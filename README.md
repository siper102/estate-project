# Data for rental prices in the german city Duesseldorf

I created this project to create a feeling on how a data driven system could look like, to get better insights
into some frameworks and what are possible problems that I can possibly run into during the development of a data system.

The goal of this system is to continuously scrape data about rental prices in the german city duesseldorf and save this data in a database.
Then it should make this data available and with the resulting dataset it should be possible to see the latest trends and regional differences
between the districts. Also, a machine learning model is trained with the data to make predictions.

The resulting project is:
1. fully automized: every part of this project can be easily scheduled via any orchestrator like Apache Airflow
2. scalable: each component runs in an own microservice and each part can be scaled up and down


## The single components:

### 1. Scrapers
The data is extracted from the web via webscraping. The scrapers are build with [Scrapy](https://scrapy.org). This is the perfect choice
when we have several data sources (in this case 2) that produce the same type of data.
In this example project the data sources are [Immowelt](https://www.immowelt.de) and [Wohnungsboerse](www.wohnungsboerse.net).
All the scraping logic is written in [spiders](scrapers%2Fscrapers%2Fspiders) and the extraction, validation and persistence is implemented in the files in [scrapers](scrapers%2Fscrapers).
The resulting data is saved in a relational database (via Rest API) and is validated with pydantics.

### 2. API:
The interface to the database is provided by a Rest API. This API is created using FastAPI.
This is a good choice because it makes building an API very easy and provides automatic documentation.
The different routes can be found in [routes](api%2Froutes). The different routes are used by the different services.
Most of the endpoints need authorization via api-token that is sent in the headers.
The reason for this is to grant read or write access to the different services for different tables.

### 3. Machine Learning:
In this part the data is used to make predictions.
Here this is done by training a machine learning model using the data to predict the monthly rental price by using several numbers from the estate object.
The code can be found in [machine-learning](machine-learning).
The resulting model is a random forrest regressor. An analysis on why I chose this model can be found [here](machine-learning%2Fmodel%2Fmodel-selection.ipynb).
The model is build with sklearn and the service that gives the predictions via API is build with [BentoMl](https://www.bentoml.com).
The model is trained with the data from the last 4 weeks and when the new model has a lower MSE on the training data the new model is used in production.

### 4. User Interface:
On top of the Backend (The Rest API and the Machine Learning API) here a frontend is created. This was realized using
streamlit. This makes creating dashboards for the web browser super easy.
The different pages can be found in [pages](user-interface%2Fpages).
On the first page there is one plot that shows the time series of the average rental price for all flats.
On the second page we have a heatmap of düsseldorf where the prices for all districts are plotted.
The third page can be used to make a prediction for a specific flat.

### Visualization of the relationships between the services
![Graph.jpg](resources%2FGraph.jpg)

## How to run this project locally
All Services are Containerized so to start all the Services just type:
```shell
docker-compose up
```
Then the Database with some example data, the Rest API, the ML Model and the user interface are started in a container.
The Swagger Documentation from the Rest API can then be found at
```
http://localhost:8000/docs
```
and the Swagger Documentation for the machine learning model can be found at
```
http://localhost:3000
```
The user interface can be found at
```
http://localhost:8501
```
If you want to add new data just run:
```shell
docker build -t estates/scraper -f scrapers/Dockerfile scrapers
docker run \
    --entrypoint=/bin/bash \
    --rm \
    -e API_HOST=api \
    -e API_PORT=8000 \
    -e API_KEY=scraper_api_key \
    --network database-network \
    estates/scraper \
    -c "scrapy crawl wohnungsboerse-scraper"
```
Note that we just run **Wohnungsbörse** since the other scraper is blocked by the website.
After running the plots should have changed.
You can then retrain the model:
```shell
docker exec machine-learning bash -c "python3 model-training.py"
```
Sadly I could not figure out how to make hot reloading for the bentoml api work in a docker container.
So the new model will not be used in production when the new model is used in production.
This is something that could be improved.


# Possible improvements
Since this is just a project for personal research there is of course room for improvements. I would like to outline a few points:
- For production, it would be good to use Scrapyd to build a Rest API on top of the Scrapy project. This makes the logs available in a folder and lets you run the spiders from anywhere via http request.
- It would be good to use an orchestration tool like Airflow or Prefect to run the spiders and make the training
- If everything runs automated the monitoring has to be improved and a messages have to be sent when anything looks unusual.
- The data validation needs to be improved to check that we just scrape data from flats and no office buildings or something like this.
- To make better predictions we need more information about the flat. For example the last renovation or weather the flat is furnished could have an influence on the price.
- For credentials, it is always better to use some secret manager like GCP secret-manager
