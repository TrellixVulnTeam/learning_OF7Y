# load in the libraries
import pandas as pd
from plotnine import *
import statistics

# load in the data
df = pd.read_csv('./landdata-states.csv')

'''# become familiar with the data
print(df.head())
print(df.columns)

# class of data
print('The type of each variable is: ')
print(df.dtypes)

# summary of the data
print(df.describe())'''

# make EDA plots
print(df.columns)

print(ggplot(df, aes(x = 'Year', y = 'Home.Value')) + geom_point() + geom_smooth())