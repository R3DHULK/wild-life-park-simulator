class Animal
  attr_accessor :name, :species, :age
  
  def initialize(name, species, age)
    @name = name
    @species = species
    @age = age
  end
  
  def info
    "#{name} (#{species}, #{age} years old)"
  end
end

class Park
  attr_accessor :name, :animals
  
  def initialize(name)
    @name = name
    @animals = []
  end
  
  def add_animal(animal)
    @animals << animal
    puts "#{animal.name} has been added to the park."
  end
  
  def list_animals
    puts "Animals in the park:"
    @animals.each do |animal|
      puts "- #{animal.info}"
    end
  end
  
  def remove_animal(animal_name)
    animal = @animals.find {|a| a.name == animal_name }
    if animal
      @animals.delete(animal)
      puts "#{animal.name} has been removed from the park."
    else
      puts "Animal not found."
    end
  end
end

# Main program
park = Park.new("Wildlife Park")

puts "Welcome to #{park.name}!"

loop do
  puts "Please select an option:"
  puts "1. Add an animal"
  puts "2. List animals"
  puts "3. Remove an animal"
  puts "4. Exit"
  choice = gets.chomp.to_i
  
  case choice
  when 1
    puts "Enter animal name:"
    name = gets.chomp
    puts "Enter animal species:"
    species = gets.chomp
    puts "Enter animal age:"
    age = gets.chomp.to_i
    animal = Animal.new(name, species, age)
    park.add_animal(animal)
  when 2
    park.list_animals
  when 3
    puts "Enter animal name to remove:"
    name = gets.chomp
    park.remove_animal(name)
  when 4
    break
  else
    puts "Invalid choice. Please try again."
  end
end

puts "Thank you for visiting #{park.name}!"
