import pandas as pd
import os

# to get directories, so that this file can be runned on different computers without hardcoding the directory
# current directory
current_directory = os.path.dirname(os.path.realpath(__file__))
# directory of the input datasets
dataset_directory = os.path.join(current_directory, 'input_dataset')
# directory of the output datasets
processed_data_directory = os.path.join(current_directory, 'processed_data')

# to get the directories of all input csv files
file_list = os.listdir(dataset_directory)
csv_list = [os.path.join(dataset_directory, file) for file in os.listdir(dataset_directory) if file.endswith('.csv')]

# check that there is dataset
if len(csv_list) > 0:
    df = pd.concat((pd.read_csv(f) for f in csv_list), ignore_index=True)
    # remove any rows which do not have name
    df = df.dropna(subset=['name'])
    # remove name titles
    pattern = r'(\,|\.|Mrs|Dr|Mr|Miss|Ms)'
    df['name'] = df['name'].replace(pattern,'',regex=True)
    # split name into first name and last name
    df['first_name'] = df['name'].str.split(' ', expand=True)[0]
    df['last_name'] = df['name'].str.split(' ', expand=True)[1]
    df = df.drop('name', axis=1)
    # remove zeros pretended to the price field
    df['price'] = df.apply(lambda x: str(x['price']).lstrip('0'), axis = 1)
    # create a new field above_100
    df['above_100'] = df['price'].astype(float) > 100
    df = df[['first_name', 'last_name', 'price', 'above_100']] 

    today_date = pd.Timestamp('today').strftime("%Y%m%d")
    df.to_csv(os.path.join(processed_data_directory, 'processed_data_'+today_date+'.csv'), index=False)

else:
    print('no dataset found')


