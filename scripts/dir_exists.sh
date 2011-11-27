#! /bin/sh
dir_exists(){                                                                                                                                                                                   
  if [ "$(ls -A $1)" ]; then                                                                                                                                                                    
    return 0                                                                                                                                                                                    
  else                                                                                                                                                                                          
    return 1                                                                                                                                                                                    
  fi                                                                                                                                                                                            
}   


dir_exists /home/root/dakia/files/send/outbox
echo $?
dir_exists /home/root/dakia/files/send/inbox
echo $?
