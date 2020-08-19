
# Discrete Probability ####

# Monte Carlo simulation for picking a red or blue bead out of an urn
# creating the urn with 5 total beads: 2 red, three blue
beads = rep(c("red", "blue"), times = c(2,3))

# pick a random bead using the sample funciton
sample(beads, 1)
# sample returns one random event of picking a bead from the urn

# if we run this sample an infinite number of times, we can determine all the possible outcomes and 
# their accompanying probablilities
# However, it is impossible to run it an infinite number of times, so we run it enough times we can
# simulate the results of running it an infinite amount of times. This is called the monte carlo affect
B <- 10000
events = replicate(B, sample(beads, 1))
# here we performed our experiment from before but 10,000 times

# in order to count the number of outcomes for each color, we can build a contingency 
# table:
tab = table(events)
tab

# prop.table() gives us the proportion of each event:
prop.table(tab)

# another way to find the probablity of tables or events is with the mean funciton:
mean(events == "blue")

# Monte Carlo simulations ####

# setting the seed can help generate the same random variable each time the code is run.
# This helps to prevent getting different answers everytime you run the same piece of code
# and avoids confusion.
# Choosing the seed to set is conventionally done by subtracting the current year by the
# day and month
set.seed(1986)

# with and without replacement 
# the function sample() automatically sets the argument "replace" to FALSE. In other words
# when you take a bead out of the urn, it does not get replaced (dependent events)

# Independence ####
# two events are independent if the outcome of one does not affect the other (coin toss)
# two events are dependent if the outcome of one DOES affect the other. If we deal a King
# for the first card, the probability of getting a king for the second card because there
# are now only three kings instead of 4.

# as far as notation:
# for independent:
#   Pr(A | B) = Pr(A) (the probability of A given B = probability of A)

# for dependent:
#   Pr(A | B)

# multiplication rule for independent events: ####
#  Pr(A and B and C) = Pr(A) * Pr(B) * Pr(C)

# multiplication rule for dependent events: ####
#  Pr(A and B) = Pr(A) * Pr(B | A)
# for more than two events:
#  Pr(A and B and C) = Pr(A) * Pr(B | A) * Pr(C | A and B)



