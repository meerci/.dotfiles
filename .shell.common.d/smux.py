#!/usr/bin/env python3
import os
import pty
import socket
import sys
import threading


def set_winsize(fd, row, col, xpix=0, ypix=0):
    import fcntl
    import struct
    import termios

    winsize = struct.pack("HHHH", row, col, xpix, ypix)
    fcntl.ioctl(fd, termios.TIOCSWINSZ, winsize)


def fork_exec(args):
    master_fd, slave_fd = pty.openpty()
    pid = os.fork()
    if pid == 0:
        os.close(master_fd)
        os.dup2(slave_fd, 0)
        os.dup2(slave_fd, 1)
        os.dup2(slave_fd, 2)
        os.execvp(args[0], args)
    else:
        os.close(slave_fd)
        return master_fd


def pread(fd, length):
    try:
        return os.read(fd, length)
    except:
        return None


def pwrite(fd, buf):
    try:
        return os.write(fd, buf)
    except:
        return None


def pclose(fd):
    try:
        os.close(fd)
    except:
        pass


def handle_output():
    global socks
    while True:
        buf = pread(shell_fd, 1)
        with fd_lock:
            n = 0
            for i in range(len(socks)):
                socks[n] = socks[i]
                socks[n] = socks[i]
                if buf is not None and pwrite(socks[i][0], buf) is not None:
                    n += 1
                else:
                    pclose(socks[i][0])
                    if buf is None:
                        print("program output closed")
                        return
            socks = socks[:n]


def handle_input(addr, fd):
    own_lock = False
    llast_buf, last_buf = None, None
    print(addr, "connect")
    while True:
        buf = pread(fd, 1)
        # NOTE: telnet brk command is used as lock acquire/release
        if llast_buf == b"\xff" and last_buf == b"\xf3" and buf == b"\r":
            own_lock = not own_lock
            if own_lock:
                input_lock.acquire()
                print(addr, "acquire lock")
            else:
                input_lock.release()
                print(addr, "release lock")
        elif USE_CR_ONLY and buf == b"\n" and last_buf == b"\r":
            pass
        elif IGNORE_TELNET_COMMAND and (
            buf == b"\xff" or last_buf == b"\xff" or llast_buf == b"\xff"
        ):
            pass
        elif buf is None or len(buf) == 0:
            if own_lock:
                input_lock.release()
                print(addr, "release lock")
            pclose(fd)
            print(addr, "closed")
            return
        else:
            if own_lock:
                pwrite(shell_fd, buf)
            elif input_lock.acquire(timeout=0.1):
                # NOTE: ignore input if it can not get lock in 100ms
                pwrite(shell_fd, buf)
                input_lock.release()
        llast_buf, last_buf = last_buf, buf


shell_fd = fork_exec(sys.argv[1:])
set_winsize(shell_fd, 30, 80)
fd_lock = threading.Lock()
input_lock = threading.RLock()
socks = []  # (fd,sock)  # keep the socket reference to prevent GC
# use the stdin/stduo ?
# socks.append((1,None))
# threading.Thread(target=lambda: handle_input(0)).start()
threading.Thread(target=handle_output).start()
ssock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

ADDR = ("0.0.0.0", 8888)
USE_CR_ONLY = True
IGNORE_TELNET_COMMAND = True

ssock.bind(ADDR)
print("server listen on", ADDR)
ssock.listen(5)
try:
    while True:
        csock, addr = ssock.accept()
        with fd_lock:
            socks.append((csock.fileno(), csock))
        threading.Thread(target=lambda: handle_input(addr, csock.fileno())).start()
finally:
    ssock.close()
    with fd_lock:
        for sock, _ in socks:
            sock.close()
