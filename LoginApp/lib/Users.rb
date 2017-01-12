require 'pry'

class Users
	@@users = Hash["senen" => "123"]		
	def self.add_user(name, password)
		@@users[name] = password
	end
	def self.check_user?(name, password)
		@@users[name] == password
	end	
	def self.user_exits?(name)
		@@users[name]
	end	
end