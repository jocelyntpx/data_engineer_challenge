# Section 5

#### Data handling:
1. Dropped 'person' column as it is not used as input in question given.
2. Checked that the number of categories for each column in the dataset match the dataset description given (and that there are no null values).
3. Did data pre-processing to convert categorical data to numerical values. Used ordinal encoding for columns that have ranking involved between the categories and used one-hot encoding for columns that do not have ranking involved.
4. Checked that the target variable do not have data imbalance which will cause the machine learning model to be more biased towards the majority class.

#### Machine learning prediction result:
Predicted buying price with given parameters is low.