# Data Sources
Overview of the data used in this case study.  

## Historical Bike Trip Data
The data for this case study is publicly available [here](https://divvy-tripdata.s3.amazonaws.com/index.html). The data is made available by Motivate International Inc. under this [license](https://www.divvybikes.com/data-license-agreement). For my analysis, I focus on historical bike trip data that covers a 12 month period. Since the files are too large for Github and I'll be using BigQuery for analysis, I have instead uploaded these files to a storage bucket in Google Cloud. I have included a list of the file names below:  

1) 2021-02_divvy_trip-data.csv  
2) 2021-03_divvy_trip-data.csv  
3) 2021-04_divvy_trip-data.csv  
4) 2021-05_divvy_trip-data.csv  
5) 2021-06_divvy_trip-data.csv  
6) 2021-07_divvy_trip-data.csv  
7) 2021-08_divvy_trip-data.csv  
8) 2021-09_divvy_trip-data.csv  
9) 2021-10_divvy_trip-data.csv  
10) 2021-11_divvy_trip-data.csv  
11) 2021-12_divvy_trip-data.csv  
12) 2022-01_divvy_trip-data.csv 

## Divvy Bicycle Station Data
I also use bike station data that is made publicly available by the [city of Chicago](https://www.chicago.gov/city/en/narr/foia/data_disclaimer.html). It can be downloaded [here](https://data.cityofchicago.org/Transportation/Divvy-Bicycle-Stations/bbyy-e7gq/data).
