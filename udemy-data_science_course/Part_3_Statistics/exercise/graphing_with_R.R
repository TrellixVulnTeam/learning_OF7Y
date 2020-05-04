# Make a df
df = data.frame("NY" = New_York, "LA" = LA, "SF" = San_Francisco, "Total" = sum(New_York,LA,San_Francisco))
df = gather(df, key = State, value = Freq)
