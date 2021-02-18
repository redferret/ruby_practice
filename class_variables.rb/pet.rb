# *****************************************************************************
# Example of accessing a Static Variable outside the Class
# *****************************************************************************

class Pet
  @@count = 0

  attr_reader :name, :age

  def initialize (name, age)
    @name = name
    @age = age
    @@count += 1
  end

  # Define a static method with `self.` with the pattern "set_<class variable name>"
  # This is only a self defined convention.
  def self.set_count=(count)
    @@count = count
  end

  # Define another static method matching the same variable name (They are still different even though they share the same name)
  # One is a method the other is a class variable.
  def self.count
    @@count
  end

  def have_birthday
    @age += 1
  end

  def speak
    "#{name}, speaks!"
  end
end


# Make two pets
pet_1 = Pet.new("Spots", 2)
pet_2 = Pet.new("Olivine", 1)

puts "There are #{Pet.count} pets"

# set count to 0 (Generally not a safe thing to do... for this exact reason)
Pet.set_count = 0

puts "You now have #{Pet.count} pets.. or do you?"
