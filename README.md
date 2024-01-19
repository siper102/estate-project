# Data for rental prices in the german city Duesseldorf

I created this project to create a feeling on how a data driven system could look like, to get better insights
into some frameworks and what are possible problems that I can possibly run into during the development of a data system.

The goal of this system is to continuously scrape data about rental prices in the german city duesseldorf and save this data in a database.
Then it should make this data available and with the resulting dataset it should be possible to see the latest trends and regional differences 
between the districts. Also, a machine learning model is trained with the data to make predictions.

The resulting project is:
1. fully automized: every part of this project can be easily scheduled via any orchestrator like Apache Airflow
2. scalable: each component runs in an own microservice and each part can be scaled up and down 

# Path of a data point from extraction to analysis

## Data extraction from the web:
The first step is the data extraction from the web. I decided go the easy way and build scrapers to extract data from several data sources.
In this example project the websites [Immowelt](https://www.immowelt.de) and [Wohnungsboerse](www.wohnungsboerse.net).
The scrapers are build with [Scrapy](https://scrapy.org). The data can be found in [scrapers](scrapers).
Scrapy is the best choice when you need to send a lot of requests and need to write several scrapers that extract the same typ of data.
All the scraping logic is written in [spiders](scrapers%2Fscrapers%2Fspiders) and the extraction, validation and persistence is implemented in the files in [scrapers](scrapers%2Fscrapers).
The resulting data is saved in a relational database and is validated with pydantics.

## Making the data usable for analysis and prediction
Since the resulting database has just two tables this step is not necessary. But of corcse this step is completely necessary when the database has a large amount of tables and columns.
In this project I decided to make the data available with views that are created with [DBT](https://www.getdbt.com).
Another, maybe better way, would be to build a Rest-API that serves the data from the database. But I wanted to find out what DBT is :D.
The code can be found in [transformation](transformation).
The scripts in [models](transformation%2Fmodels) produce three views, one with basic statistics like the average price for each run, 
one that serves the data in a nice format and one that serves the dataset for the machine learning part.
In the [seeds](transformation%2Fseeds)-folder the district information are saved aswell.

## Machine Learning
After serving the data the next part is to use the data. Here this is done by training a machine learning model using the data to predict the monthly rental price by using several numbers from the estate object.
The code can be found in [machine-learning](machine-learning).
The resulting model is a random forrest regressor. An analysis on why I chose this model can be found [here](machine-learning%2Fmodel%2Fmodel-selection.ipynb).
The model is build with sklearn and the service that gives the predictions via API is build with [BentoMl](https://www.bentoml.com).
The model is trained with the data from the last 4 weeks and when the new model has a lower MSE on the training data the new model is used in production.

## Dashboards
But there are also other use cases for the resulting data than training a ml model with it.
For example we can visualize the average monthly price for each district in duesseldorf to find out what local differences there are.
Also we can visualize the mean monthly price as a time series so we can compare the current mean price with historic prices.
The "dashboards" are built with [Streamlit](https://streamlit.io).
The dashboards can be found in [pages](user-interface%2Fpages).
In the same folder there is also a user interface that can be used to get the predictions from the random forrest regressor in a user-friendly way. 

The whole flow is summarized in the picture below:
![chart.png](resources%2Fchart.png)

# How to run this project locally
## 1. Run the scrapers
To run the scrapers just navigate to the [scrapers directory](scrapers/scrapers). In the data directory add a file called **credentials.ini**
with the following content:
```ini
[DATABASE]
drivername=mysql+driver
username=username
password=password
host=host
port=port
database=estates
```
Then type the following command to start the scrapers:
```shell
scrapy list|xargs -n 1 scrapy crawl
```
After that the most recent data should be stored in the database 


## 2. Run the transformators
This step is optional. If this step should be skipped the queries in the other steps should be replaced by the queries defined in the model folder.
To run this step, setup DBT and navigate to [transformation](transformation). There you just run the command 
```shell
dbt run
```
This command also persists the district data from the file [district.csv](transformation%2Fseeds%2Fdistrict.csv) in the seeds folder.

## 3. Train the model
After this the data is ready to be used by the machine learning model. 
To train the model and store it, just run the script [model-training.py](machine-learning%2Fmodel%2Fmodel-training.py).
After this just run the command 
```shell
cd machine-learning
bentoml serve service:tree
```

## 4. Run the user interface
After the whole setup is done the user interface can be started to interact with the machine learning model and to visualize the data.
To do this just run 
```
cd user-interface
streamlit run app.py
```
This directly opens the user interface in the web browser.

# Possible improvements
Since this is just a project for personal research there is of cource room for improvements. I would like to outline a few points:
- For production it would be good to use Scrapyd to build a Rest API on top of the Scrapy project. This makes the logs available in a folder and lets you run the spiders from anywhere via http request.
- It would be good to use a orchestration tool like Airflow or Prefect to run the spiders and make the training
- If everything runs automated the monitoring has to beimproved and a masseges have to be sent when anythong looks unusual.
- The data validation needs to be improved to check that we just scrape data from flats and no office buildings or something like this.
- To make better predictions we need more information about the flat. For example the last rennovation or weather the flat is furnished could have an influence on the price.