function remote_compile() {
  touch .cache/.last_upload_time.1
  local time_filter=''
  if [ -e .cache/.last_upload_time ]; then 
    files=($(find . -type f -newer .cache/.last_upload_time))
  else
    files=($(find . -type f))
  fi
  send_file $@ $files || return $?
  mv .cache/.last_upload_time.1 .cache/.last_upload_time
}

# example: file:../compiled 
#!/usr/bin/env sh
# source ~/.file_transfer.sh
# while true;do echo "==========waitting==========="; recv_file && sh build.sh; done
