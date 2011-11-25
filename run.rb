re 'app/user.rb'
require 'app/scan.rb'
require 'app/send.rb'

PATH="/home/root/files"

scan = scan_files
if scan == 1
  user = User.new
  response = user.login
  if response 
    user = Send.new("#{user.mobile}", "#{user.password}", PATH)
    user.export
  end
end



#  user = Send.new("9711335593", "1112")
