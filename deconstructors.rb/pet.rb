# *****************************************************************************
# Example of creating a destructor for an object when it is ready to be
# collected by the Garbage Collector and freed from memory
# *****************************************************************************

class Pet
  # Define a Proc when an instance of Pet is cleaned up from memory
  FINALIZE_CONST = Proc.new {@@count -= 1}
  @@count = 0

  attr_reader :name, :age

  def initialize (name, age)
    @name = name
    @age = age
    @@count += 1
    # Define a finalizer for the current instance being made
    ObjectSpace.define_finalizer(self, FINALIZE_CONST)
  end

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

# dereference the instance
pet_1 = nil

# Collect the now unreference instance that was stored in pet_1
# this should invoke the Proc defined in Pet and subtract the count by 1
#
# GC will auto collect during the lifetime of a program but not everytime
# an instance is dereferenced so I force it here to prove the Proc code
GC.start

# should be not be 1
puts "How many pets now? #{Pet.count}"
