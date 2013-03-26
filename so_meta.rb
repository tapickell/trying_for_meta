
class Anything
	def initialize(name, *methods)
		@name = name
		@methods = methods
	end

	def method_missing(missing, *args)
		if methods.include?(missing)
			methods.each do |method_name|
				send :define_method, method_name do |something|
					puts "#{@name} is #{method_name}ing #{something}."
				end
			end
		end
	end

	def who_are_you
		puts "Object #{ @name.to_s } can #{ 
			@methods.each do |method| 
				method ", " 
			end
			}."
	end
end

puts "Lets play with meta!"
puts "We have an anonymous object that you can play with."
puts "Please enter the name your object: "
STDOUT.flush
name = gets.chomp
puts "What method names would you like your object to have?"
STDOUT.flush
methods = gets.chomp
methods = methods.split(' ').map{ |method| method.to_sym }
yourObject = Anything.new(name, methods)
puts "Your object #{yourObject.who_are_you}is ready"
yourObject.talk
yourObject.sniff
yourObject.eat
yourObject.sleep
yourObject.smell
