import random

try:
    class Animal:
        def __init__(self, name, species, hunger, happiness):
            self.name = name
            self.species = species
            self.hunger = hunger
            self.happiness = happiness

        def __str__(self):
            return f"{self.name} ({self.species}) - hunger: {self.hunger}, happiness: {self.happiness}"

    class WildlifePark:
        def __init__(self, num_animals=5):
            self.animals = []
            self.food_supply = 10
            self.num_animals = num_animals
            self.species_list = ["lion", "tiger", "bear",
                                 "elephant", "giraffe", "zebra", "monkey", "kangaroo"]

        def setup(self):
            for i in range(self.num_animals):
                name = input(f"What would you like to name animal {i+1}? ")
                species = random.choice(self.species_list)
                hunger = random.randint(0, 5)
                happiness = random.randint(0, 5)
                animal = Animal(name, species, hunger, happiness)
                self.animals.append(animal)

        def feed_animals(self):
            if self.food_supply == 0:
                print("Sorry, there is no more food.")
                return
            animal_index = int(
                input("Which animal would you like to feed (1-5)? ")) - 1
            if animal_index < 0 or animal_index >= len(self.animals):
                print("Invalid selection.")
                return
            self.animals[animal_index].hunger = max(
                self.animals[animal_index].hunger - 1, 0)
            self.animals[animal_index].happiness = min(
                self.animals[animal_index].happiness + 1, 5)
            self.food_supply -= 1
            print(f"{self.animals[animal_index].name} has been fed.")

        def play_with_animals(self):
            animal_index = int(
                input("Which animal would you like to play with (1-5)? ")) - 1
            if animal_index < 0 or animal_index >= len(self.animals):
                print("Invalid selection.")
                return
            self.animals[animal_index].happiness = min(
                self.animals[animal_index].happiness + 1, 5)
            print(f"{self.animals[animal_index].name} has been played with.")

        def show_status(self):
            for animal in self.animals:
                print(animal)
            print(f"Food supply: {self.food_supply}")

        def run(self):
            self.setup()
            while True:
                print("What would you like to do?")
                print("1. Feed an animal")
                print("2. Play with an animal")
                print("3. Show status")
                print("4. Exit")
                choice = input("Enter choice (1-4): ")
                if choice == "1":
                    self.feed_animals()
                elif choice == "2":
                    self.play_with_animals()
                elif choice == "3":
                    self.show_status()
                elif choice == "4":
                    print("Goodbye!")
                    return
                else:
                    print("Invalid choice.")

    if __name__ == '__main__':
        park = WildlifePark()
        park.run()

except ValueError:
    print("Check what you mistake and try again")
