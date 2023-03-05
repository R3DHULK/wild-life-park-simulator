use strict;
use warnings;

# Define the initial state of the park
my $park = {
    animals => [],
    visitors => 0,
    funds => 10000,
};

# Define the list of available animals
my @animals = (
    { name => 'Lion', cost => 2000, revenue => 500 },
    { name => 'Elephant', cost => 5000, revenue => 1000 },
    { name => 'Giraffe', cost => 1000, revenue => 200 },
);

# Start the game loop
while (1) {
    # Display the current state of the park
    print "---------------------------\n";
    print "Visitors: $park->{visitors}\n";
    print "Funds: $park->{funds}\n";
    print "---------------------------\n";

    # Display the list of available actions
    print "Available actions:\n";
    print "1. Buy animal\n";
    print "2. Sell animal\n";
    print "3. Advertise\n";
    print "4. Pass\n";

    # Get the player's choice
    print "Enter your choice: ";
    my $choice = <STDIN>;
    chomp($choice);

    # Perform the selected action
    if ($choice == 1) {
        # Buy animal
        print "Available animals:\n";
        foreach my $animal (@animals) {
            print "$animal->{name} (cost: $animal->{cost})\n";
        }
        print "Enter the name of the animal you want to buy: ";
        my $animal_name = <STDIN>;
        chomp($animal_name);
        my $animal = find_animal($animal_name);
        if ($animal) {
            if ($park->{funds} >= $animal->{cost}) {
                push @{$park->{animals}}, $animal;
                $park->{funds} -= $animal->{cost};
                print "You bought a $animal_name.\n";
            } else {
                print "You don't have enough funds to buy a $animal_name.\n";
            }
        } else {
            print "Invalid animal name.\n";
        }
    } elsif ($choice == 2) {
        # Sell animal
        if (@{$park->{animals}}) {
            print "Your animals:\n";
            foreach my $animal (@{$park->{animals}}) {
                print "$animal->{name}\n";
            }
            print "Enter the name of the animal you want to sell: ";
            my $animal_name = <STDIN>;
            chomp($animal_name);
            my $animal_index = find_animal_index($animal_name);
            if ($animal_index >= 0) {
                my $animal = splice(@{$park->{animals}}, $animal_index, 1);
                $park->{funds} += $animal->{revenue};
                print "You sold a $animal_name for $animal->{revenue}.\n";
            } else {
                print "Invalid animal name.\n";
            }
        } else {
            print "You don't have any animals to sell.\n";
        }
    } elsif ($choice == 3) {
        # Advertise
        if ($park->{funds} >= 1000) {
            $park->{visitors} += 50;
            $park->{funds} -= 1000;
            print "You advertised and attracted 50 more visitors.\n";
        } else {
            print "You don't have enough funds to advertise.\n";
        }
    } elsif ($choice == 3) {
		# Advertise
		if ($park->{funds} >= 1000) {
			$park->{visitors} += 50;
			$park->{funds} -= 1000;
			print "You advertised and attracted 50 more visitors.\n";
		} else {
			print "You don't have enough funds to advertise.\n";
		}
	} elsif ($choice == 4) {
		# Hire staff
		if ($park->{funds} >= 2000) {
			$park->{staff} += 1;
			$park->{funds} -= 2000;
			print "You hired another staff member.\n";
		} else {
			print "You don't have enough funds to hire another staff member.\n";
		}
	} elsif ($choice == 5) {
		# Fire staff
		if ($park->{staff} > 1) {
			$park->{staff} -= 1;
			$park->{funds} -= 1000;
			print "You fired a staff member.\n";
		} else {
			print "You can't fire any more staff members.\n";
		}
	} elsif ($choice == 6) {
		# View statistics
		print "Park Statistics:\n";
		print "Visitors: " . $park->{visitors} . "\n";
		print "Staff: " . $park->{staff} . "\n";
		print "Funds: " . $park->{funds} . "\n";
	} elsif ($choice == 7) {
		# Quit the game
		print "Thanks for playing!\n";
		exit;
	} else {
		print "Invalid input. Please try again.\n";
	}
}
