# Define the wildlife and their corresponding attributes
wildlife <- list(
  c("Deer", 10, 5, 2),
  c("Bear", 20, 10, 5),
  c("Rabbit", 5, 2, 1),
  c("Wolf", 15, 7, 3)
)

# Define the player's initial attributes
player <- c(100, 10, 0)

# Define the actions available to the player
actions <- c("Hunt", "Rest", "Exit")

# Function to print the game status
print_status <- function() {
  cat("Player status:\n")
  cat("  Health: ", player[1], "\n")
  cat("  Ammo: ", player[2], "\n")
  cat("  Meat: ", player[3], "\n")
  cat("\n")
}

# Game loop
while (TRUE) {
  # Print the game status
  print_status()
  
  # Print the available actions
  cat("Available actions:\n")
  for (i in 1:length(actions)) {
    cat("  ", i, ": ", actions[i], "\n")
  }
  
  # Get the user's action choice
  cat("\n")
  choice <- readline(prompt="Choose an action: ")
  choice <- as.integer(choice)
  
  # Handle the user's action
  if (choice == 1) { # Hunt
    # Select a random wildlife
    wildlife_idx <- sample(1:length(wildlife), 1)
    animal <- wildlife[[wildlife_idx]]
    cat("You encounter a ", animal[1], ".\n")
    
    # Check if the player has enough ammo
    if (player[2] < animal[4]) {
      cat("You don't have enough ammo to hunt this animal.\n")
    } else {
      # Hunt the animal
      player[2] <- player[2] - animal[4]
      outcome <- sample(c("success", "failure"), 1, prob=c(animal[2]/100, 1-animal[2]/100))
      if (outcome == "success") {
        meat <- sample(1:animal[3], 1)
        player[3] <- player[3] + meat
        cat("You hunted the ", animal[1], " and got ", meat, " meat.\n")
      } else {
        cat("You failed to hunt the ", animal[1], ".\n")
      }
      
      # Reduce the player's health
      player[1] <- player[1] - animal[4]/2
      if (player[1] <= 0) {
        cat("Game over: You died.\n")
        break
      }
    }
  } else if (choice == 2) { # Rest
    # Restore the player's health
    player[1] <- player[1] + 20
    if (player[1] > 100) {
      player[1] <- 100
    }
    cat("You rested and restored your health.\n")
  } else if (choice == 3) { # Exit
    cat("Thanks for playing!\n")
    break
  } else {
    cat("Invalid choice.\n")
  }
}
