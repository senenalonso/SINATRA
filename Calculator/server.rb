require "sinatra"
require "./lib/Calculator"

get "/" do
	erb(:calculator)
end

post "/calculate" do
  first = params[:first_number].to_f
  second = params[:second_number].to_f
  operation = params[:operation].to_s
  result = Calculator.calculate(first,second,operation)
  symbol = Calculator.get_symbol(operation)
  "#{first} #{symbol} #{second} = #{result}"
end

get "/add" do
  erb(:add)
end

post "/calculate_add" do
  first = params[:first_number].to_f
  second = params[:second_number].to_f
  result = Calculator.add(first,second)
  "#{first} + #{second} = #{result}"
end

get "/substract" do
  erb(:substract)
end

post "/calculate_substract" do
  first = params[:first_number].to_f
  second = params[:second_number].to_f
  result = Calculator.substract(first,second)
  "#{first} - #{second} = #{result}"
end

get "/multiply" do
  erb(:multiply)
end

post "/calculate_multiply" do
  first = params[:first_number].to_f
  second = params[:second_number].to_f
  result = Calculator.multiply(first,second)
  "#{first} * #{second} = #{result}"
end

get "/divide" do
  erb(:divide)
end

post "/calculate_divide" do
  first = params[:first_number].to_f
  second = params[:second_number].to_f
  result = Calculator.divide(first,second)
  "#{first} / #{second} = #{result}"
end