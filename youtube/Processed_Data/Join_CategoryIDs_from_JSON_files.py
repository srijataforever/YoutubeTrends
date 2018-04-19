# US YouTube Video Statistics Data 

# Importing the libraries
import numpy as np
import pandas as pd 
pd.options.display.max_rows = 10
from IPython.display import display, HTML

# remove warnings
import warnings
warnings.filterwarnings('ignore')


us_data= pd.read_csv("USvideos.csv")
print (us_data.shape)
display(HTML(us_data.head().to_html()))
display(HTML(us_data.describe().to_html()))


# read category_id
import json
data_id = {}
with open('US_category_id.json', 'r') as f:
    category_id = json.load(f)
    for i in category_id['items']:
        data_id[i['id']] = i['snippet']['title']
print (data_id)


# add 'category' column into data frame
category = []
for i in us_data['category_id']:
    category.append(data_id[str(i)])
us_data['category'] = pd.Series(category)
display(HTML(us_data.head(1).to_html()))

# write to CSV
us_data.to_csv('US_Data.csv', sep=',', index=False, encoding='utf-8')


# Repeated process for GB, FR, DE & CA YouTube Video Statistics Datasets 
