#! /usr/bin/ruby

FILENAME = "/keypad/file"

def read_user_input
  begin
     str = ""
     file = File.new(FILENAME, "r")
     while (line = file.gets)
         str += line  
     end
     file.close
     sleep 0.1
     str
  rescue => err
     puts "Exception: #{err}"
     err
  end
end

def clear
 sleep 0.1
 system("/lcd/lcd *r")
 sleep 0.1
end

def newline
 sleep 0.1
  system('/lcd/lcd *n')
 sleep 0.1
end

def display(str, nextline=true)
 clear if nextline
 system("/lcd/lcd ^#{str.gsub(/\s+/,'~')}^")
 newline if nextline
end

def user_input
  system('/keypad/alphanumeric')
  read_user_input
end


def input
  system('/keypad/numeric')
  read_user_input
end


