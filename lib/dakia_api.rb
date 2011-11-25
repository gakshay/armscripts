#! /usr/bin/ruby
require "lib/api.rb"

def validate_mobile(mobile)
  if m = mobile.to_s.match(/^[+]?[0-9]{10,12}$/)
    if s = mobile.to_s.match(/(^((0)?|(\+?91)?)[789][0-9]{9}$)/)
      return true
    end
  end
  display "Wrong/Invalid no"
  sleep 1
  return false
end

def validate_password(password)
  if p = password.to_s.match(/^[0-9]{4,12}$/)
    return true
  end
  display "Invalid password"
  sleep 1
  return false
end

