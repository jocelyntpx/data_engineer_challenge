# Section 3

### Architecture Design
According to the information provided in the question, we have 2 separate web application. One is to collect images uploaded by customers. The other provides a stream of information using a Kafka stream. 

We will then use the AWS lambda function for image processing, using the code already written by the team. There will be 2 lambda functions as there are 2 data sources (web application):
- For the first web application (collection of images uploaded by customers), the lambda function will be triggered by Amazon API gateway.
- For the second web application (image streaming using Kafka), the lambda function will be triggered by the Kafka stream.

The destinations for both lambda functions are the same - Amazon Redshift and Amazon S3. We will store the structured data into Redshift and store the processed images into Amazon S3. 
We will store each processed image in Amazon S3 for 7 days before storing them in Amazon S3 Glacier Deep Archive instead. 

Finally, we will use Amazon QuickSight to showcase the key statistics. 

### Assumptions:
- As the question only stated that the processed images is to be stored for a minimum of 7 days for archival purposes. I made the assumption that it will be good for the company to store the processed image for longer than 7 days. 

### Pros of design:
1. The entire architecture is built using the services provided by AWS as services provided by AWS are already well integrated with one another. This saves the team time and effort as they do not need to spend the time and effort to integrate various services with each other. 
2. Lambda is chosen such that the team do not need to create and maintain their own infrastructure. Lambda helps the team run the data/image processing automatically from the API gateway and Kafka stream and store the processed data in Redshift and S3.
3. Redshift is chosen to store the structured data to be used for Business Intelligence as it is a great data warehousing solution and it is also a service provided by AWS, making it very easy to set it up as one of the lambda destinations.
4. S3 is chosen to store processed image data for 7 days while processed image data after 7 days will be stored in S3 Glacier Deep Archive to save cost. S3 Glacier Deep Archive is good for long term storage that we do not need to access/restore much (max 2-3 times per year) as the cost is extremely low (Amazon S3's lowest cost storage class) and safety is high. S3 is more for frequent usage and we do not need that for our archived data. 
5. QuickSight is chosen for our Business Intelligence tool for dashboarding and visualisations. Apart from it being an AWS service, making it easy to integrate with Redshift, it is also a great tool for visualisation.


### Cons of design:
1. Although the services provided by AWS are great, there are still some ways that it could be better.
- Accessing and restoring data from S3 Glacier Deep Archive is very costly and response time is long as well.
- Some charts and graph options are not available in QuickSight. 

