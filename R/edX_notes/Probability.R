# Monte Carlo simulation for picking a red or blue bead out of an urn
# creating the urn with 5 total beads: 2 red, three blue
beads = rep(c("red", "blue"), times = c(2,3))

# pick a random bead using the sample funciton
sample(beads, 1)
# sample returns one random event of picking a bead from the urn

# if we run this sample an infinite number of times, we can determine all the possible outcomes and 
# their accompanying probablilities
# Hoever, it is impossible to run it an infinite number of times, so we run it enough times we can
# simulate the results of running it an infinite amount of times. This is called the monte carlo affect
while(x < 1000){
  x = 0
  sample(beads, 1)
  x = x + 1
}
