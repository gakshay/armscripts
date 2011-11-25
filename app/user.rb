#! /usr/bin/ruby
require "lib/dakia_api.rb"
require "lib/api.rb"

class User 
  attr_reader :url
  attr_accessor :mobile, :password

  def initialize 
    @url = "http://www.edakia.in/api/users.json"
  end

  def input_mobile
    display  "Enter Mobile No:"
    mobile = input
    validate_mobile(mobile) ? (@mobile = mobile[/\d{10}$/]) : input_mobile
  end

  def input_password
    display "Enter password:"
    password  = input
    validate_password(password) ? (@password = password) : input_password
  end
  
  def login
    input_mobile
    input_password
    display  "wait..."
    begin
    	response = `curl -u #{@mobile}:#{@password} #{@url}`
    	json_response = eval(response.gsub(":"," => "))
    	if json_response['error']
      		display "Login Failed" 
      		sleep(1)
      		login
    	else
      		display "Login Successful"
      		sleep(2)
      		return true 
    	end
    rescue
    	display "Error: network unreachable"
	sleep(2)
        return false
    end
  end
end
