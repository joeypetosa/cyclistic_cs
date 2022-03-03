 /*
Cyclistic Case Study: Combining quarterly tables into full_year table
using union function
*/

 -- Checking to see which column names are shared across tables

SELECT
        column_name,
        COUNT(table_name) AS column_count
FROM
        `cyclistic-cs-341119.biketrips.INFORMATION_SCHEMA.COLUMNS`
GROUP BY
        1;
  

  -- All 15 columns are common in each of the 5 tables
  -- Looking at the columns that are shared among the tables

SELECT
        column_name,
        data_type,
        COUNT(table_name) AS table_count
FROM
        `cyclistic-cs-341119.biketrips.INFORMATION_SCHEMA.COLUMNS`
WHERE
        REGEXP_CONTAINS(LOWER(table_name),"2021|2022")
GROUP BY
        1, 2;
 
 
 -- Combining all five tables using UNION
 -- Note: adjust query settings in BigQuery; For Destination, choose 'Set a destination table for query results'

SELECT 
        ride_id, 
        member_casual, 
        started_at, 
        ended_at, 
	       ride_length, 
        ride_date,
        ride_month,
        ride_year,
        start_time,
        end_time,
        day_of_week, 
        start_station_name, 
	       start_station_id, 
        end_station_name, 
	       end_station_id, 
        start_lat, 
        start_lng, 
	       end_lat, 
        end_lng, 
        rideable_type,
        quarter
FROM 
        `cyclistic-cs-341119.biketrips.2021_Q1`
UNION DISTINCT  
SELECT 
        ride_id, 
        member_casual, 
        started_at, 
        ended_at, 
	       ride_length, 
        ride_date,
        ride_month,
        ride_year,
        start_time,
        end_time,
        day_of_week, 
        start_station_name, 
	       start_station_id, 
        end_station_name, 
	       end_station_id, 
        start_lat, 
        start_lng, 
	       end_lat, 
        end_lng, 
        rideable_type,
        quarter
FROM 
        `cyclistic-cs-341119.biketrips.2021_Q2`
UNION DISTINCT  
SELECT 
        ride_id, 
        member_casual, 
        started_at, 
        ended_at, 
	       ride_length, 
        ride_date,
        ride_month,
        ride_year,
        start_time,
        end_time,
        day_of_week, 
        start_station_name, 
	       start_station_id, 
        end_station_name, 
	       end_station_id, 
        start_lat, 
        start_lng, 
	       end_lat, 
        end_lng, 
        rideable_type,
        quarter
FROM 
        `cyclistic-cs-341119.biketrips.2021_Q3`
UNION DISTINCT  
SELECT 
        ride_id, 
        member_casual, 
        started_at, 
        ended_at, 
	       ride_length, 
        ride_date,
        ride_month,
        ride_year,
        start_time,
        end_time,
        day_of_week, 
        start_station_name, 
	       start_station_id, 
        end_station_name, 
	       end_station_id, 
        start_lat, 
        start_lng, 
	       end_lat, 
        end_lng, 
        rideable_type,
        quarter
FROM 
        `cyclistic-cs-341119.biketrips.2021_Q4`
UNION DISTINCT  
SELECT 
        ride_id, 
        member_casual, 
        started_at, 
        ended_at, 
	       ride_length, 
        ride_date,
        ride_month,
        ride_year,
        start_time,
        end_time,
        day_of_week, 
        start_station_name, 
	       start_station_id, 
        end_station_name, 
	       end_station_id, 
        start_lat, 
        start_lng, 
	       end_lat, 
        end_lng, 
        rideable_type,
        quarter
FROM 
        `cyclistic-cs-341119.biketrips.2022_Q1`
 
