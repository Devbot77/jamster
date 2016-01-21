
# # - Add methods to an object
# my_object = Object.new

# def my_object.set_my_variable=(var)
# 	@my_instance_variable = var
# end

# def my_object.get_my_variable
# 	@my_instance_variable
# end
# #
# #
# # write a class method
# my_object.set_my_variable = "Giggity"
# # puts my_object.get_my_variable

# class MyClass
# 	def self.capitalize_name
# 		name.upcase
# 	end
# end

# # puts MyClass.capitalize_name
# x = MyClass.new
# # puts x.capitalize_name # produces undefined method error as method is only instance of MyClass class
# ##
# class CarModel
# 	# manually writing getter and setter methods
# 	def engine_info=(info)
# 		@engine_info = info
# 	end

# 	def engine_info
# 		@engine_info
# 	end

# 	def engine_price=(price)
# 		@engine_price = price
# 	end

# 	def engine_price
# 		@engine_price
# 	end

# 	def wheel_info=(info)
# 		@wheel_info = info
# 	end

# 	def wheel_info
# 		@wheel_info
# 	end

# 	def wheel_price=(price)
# 		@wheel_price = price
# 	end

# 	def wheel_price
# 		@wheel_price
# 	end
# # or simplify that code to write similar methods
# 	FEATURES = ["engine", "wheel", "airbag", "alarm", "stereo"]

# 	FEATURES.each do |feature|
# 		define_method("#{feature}_info=") do |info|
# 			instance_variable_set("#{feature}_info", (info))
# 		end

# 		define_method("#{feature}_info") do 
# 			instance_variable_set("#{feature}_info"
# 		end

# 		define_method("#{feature}_price=") do |price|
# 			instance_variable_set("#{feature}_price", (price))
# 		end

# 		define_method("#{feature}_price") do 
# 			instance_variable_set("#{feature}_price")
# 		end
# 	end

# # or use existing Ruby methods to do the above even simpler
# 	attr_accessor :engine_info, :engine_price, :wheel_info, :wheel_price
# # simplify that by having a method to create _info and _price for ever feature passed to it
# 	def self.features(*args)
# 		args.each do |feature|
# 			attr_accessor "#{feature}_price", "#{feature}_info"
# 		end
# 	end

# 	features :engine, :wheel, :airbag, :alarm, :stereo
# end

#alter the method_missing() class from Object
####
# class MyGhostClass
# 	def method_missing(name, *args)
# 		if name.to_s =~ /awesome/
# 			puts "#{name} was called with arguments: #{args.join(', ')}"
# 		else
# 			super
# 		end
# 	end
# end

# m = MyGhostClass.new
# m.awesome_method("beef", "steak") #this is what is called a ghost method. doesn't exist, but does something anyway
# m.another_method("chicken", "rice")

#using ghost methods to do the same as CarModel class above for any features at any time when called
class CarModel02
	def method_missing(name, *args)
		name = name.to_s
		super unless name =~ /(_info|_price)=?$/
		if name =~ (/=$/)
			instance_variable_set("@#{name.chop}", args.first)
		else
			instance_variable_get("@#{name}")
		end
	end
end

@car_model = CarModel02.new

@car_model.stereo_info = "CD/MP3 Player"
@car_model.stereo_price = "$7.99"

puts @car_model.stereo_price
puts @car_model.stereo_info