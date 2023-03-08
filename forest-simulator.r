# Set up initial forest parameters
num_trees <- 50
tree_heights <- sample(10:30, num_trees, replace = TRUE)
tree_health <- sample(1:5, num_trees, replace = TRUE)

# Define functions for game mechanics
grow_trees <- function() {
  tree_heights <<- tree_heights + rnorm(num_trees, mean = 0.5, sd = 0.2)
  tree_heights[tree_heights < 0] <<- 0 # make sure heights don't go below zero
}

deforest <- function() {
  num_trees_to_cut <<- sample(5:15, 1)
  trees_to_cut <<- sample(num_trees, num_trees_to_cut)
  tree_health[trees_to_cut] <<- tree_health[trees_to_cut] - 1
  tree_health[tree_health < 1] <<- 1 # make sure health doesn't go below 1
}

regenerate_forest <- function() {
  new_tree_heights <<- sample(10:30, num_trees_to_cut, replace = TRUE)
  new_tree_health <<- sample(1:5, num_trees_to_cut, replace = TRUE)
  tree_heights[trees_to_cut] <<- new_tree_heights
  tree_health[trees_to_cut] <<- new_tree_health
}

check_game_over <- function() {
  if (sum(tree_health == 0) > num_trees/2) {
    cat("Game over - too many trees have died :(\n")
    return(TRUE)
  }
  else {
    return(FALSE)
  }
}

# Start the game loop
while (TRUE) {
  # Print current state of forest
  cat("Current state of forest:\n")
  cat(sprintf("Number of trees: %d\n", num_trees))
  cat(sprintf("Average tree height: %.1f\n", mean(tree_heights)))
  cat(sprintf("Number of healthy trees: %d\n", sum(tree_health >= 3)))
  cat(sprintf("Number of sick trees: %d\n", sum(tree_health < 3)))
  
  # Get user input
  user_input <- readline(prompt = "What would you like to do? (grow, cut, quit) ")
  
  # Execute user's choice
  if (user_input == "grow") {
    grow_trees()
  }
  else if (user_input == "cut") {
    deforest()
    regenerate_forest()
  }
  else if (user_input == "quit") {
    break
  }
  
  # Check if game is over
  if (check_game_over()) {
    break
  }
}
