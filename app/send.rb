#! /usr/bin/ruby
require "lib/dakia_api.rb"
require "lib/api.rb"

class Send
  attr_accessor :path, :scanpath, :receiver_mobile, :sender_mobile, :password, :folder_name, :time

  def initialize(sender, password, scanpath) 
    @path = "/home/root/dakia/files/send/inbox"
    @sender_mobile = sender
    @password = password
    @scanpath = scanpath
  end

  def input_receiver_mobile
    display  "Receiver Mobile"
    mobile = input
    puts mobile
    validate_mobile(mobile) ? (@receiver_mobile = mobile[/\d{10}$/]) : input_receiver_mobile
  end

  def export
    input_receiver_mobile
    display "wait..."
    create_files
  end

  def create_files
    begin
    	@time = Time.now.strftime("%d%m%Y%H%M%S")
    	@folder_name = "#{@time}_#{@sender_mobile}"
    	system("mkdir -p #{@path}/#{@folder_name}")
	file = File.open("#{@path}/#{@folder_name}/#{@folder_name}.txt", "w")
    	file.puts("#{@sender_mobile}") 
    	file.puts("#{@password}") 
    	file.puts("#{@receiver_mobile}") 
    	file.close
        sleep(1)
	result = move_scan_files
        if result
		display "Sending..."
        	return true
	else
		return false
	end
    rescue
       display "Error: Not sent"
       sleep(2)
       return false
    end
  end

  def move_scan_files
    begin
    	system("mv #{@scanpath}/* #{@path}/#{@folder_name}/")
	return true
    rescue
	display "ERR:File export"
        sleep(2)
        return false
    end
  end

end
