#! /usr/bin/ruby
require "dakia_api.rb"
require "api.rb"

class Send
  attr_reader :url
  attr_accessor :receiver_mobile, :password

  def initialize 
    @url = "http://www.edakia.in/transactions.json"
    #@url = "http://localhost:3000/transactions.json"
  end

  def input_receiver_mobile
    display  "Receiver Mobile:"
    receiver_mobile = input
    puts receiver_mobile
    validate_mobile(receiver_mobile) ? receiver_mobile : input_receiver_mobile
  end

  def input_password
    display "Enter password:"
    password  = input
    validate_password(password) ? password : input_password
  end
  
  def login
    @receiver_mobile = input_receiver_mobile
    @password = input_password
    display  "wait..."
    response = system("curl -u #{@mobile}:#{@password} #{@url}")
    json_response = eval(response.gsub(":"," => "))
    if json_response['error']
      display "Login Failed" 
      sleep(1)
      login
    else
      display "Login Successful"
      sleep(1)
    end
  end

end

u = Send.new
response = u.login
