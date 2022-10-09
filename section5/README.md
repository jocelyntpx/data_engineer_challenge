# Section 5

#### Data handling:
1. Dropped 'person' column as it is not used as input in question given.
2. Checked that the number of categories for each column in the dataset match the dataset description given (and that there are no null values).
3. Did data pre-processing to convert categorical data to numerical values. Used ordinal encoding for columns that have ranking involved between the categories and used one-hot encoding for columns that do not have ranking involved. (see under assumptions section)
4. Checked that the target variable do not have data imbalance which will cause the machine learning model to be more biased towards the majority class.

#### Assumptions:
1. Low maintenance is better --> save cost and time
2. High safety is better --> greater safety is always better
3. vgood class value is better
4. More/less doors does not mean that it is better --> numbers of doors is usually dependent on the size of the car, which is of personal preference
5. More/less boot space does not mean that it is better --> boot size is usually dependent on the size of the car, which is of personal preference

#### Machine learning prediction result:
Predicted buying price with given parameters is low.
