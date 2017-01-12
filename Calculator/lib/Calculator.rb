class Calculator
	def self.add(n1, n2)
		n1+n2		
	end
	def self.substract(n1, n2)
		n1-n2				
	end
	def self.multiply(n1, n2)
		n1*n2			
	end
	def self.divide(n1, n2)
		n1/n2		
	end	
	def self.calculate(n1,n2,operation)
		case operation
		when "addition"
			self.add(n1,n2)
		when "subtraction"
			self.substract(n1,n2)
		when "multiplication"
			self.multiply(n1,n2)
		when "division"
			self.divide(n1,n2)			
		end
	end
	def self.get_symbol(operation)
		case operation
		when "addition"
			"+"
		when "subtraction"
			"-"
		when "multiplication"
			"*"
		when "division"
			"/"		
		end
	end
end