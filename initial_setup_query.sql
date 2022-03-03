/*
Cyclistic Case Study: Initial Setup Query
Windows Functions, Aggregate Functions, Creating Views, Converting Data Types
*/

 -- Data Cleaning: Ride Length Field
 -- Replace hashtags with '0:00:00' in ride_length field and repeat for all 12 tables

UPDATE
  	`cyclistic-cs-341119.biketrips.2021_02_biketrips`
SET
  	ride_length = '0:00:00'
WHERE
  	ride_length = '###############################################################################################################################################################################################################################################################' 


 -- Update data type for ride_length pt. I
 -- Convert from time to string and repeat for 2021_02 and 2022_01 tables

SELECT 
        ride_id, 
        rideable_type, 
        started_at, 
        ended_at, 
	CAST(ride_length AS STRING) AS ride_length, 
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
        member_casual
FROM 
        `cyclistic-cs-341119.biketrips.2021_02_biketrips`


 -- Check to make sure update worked
 -- Repeat for 2021_02 and 2022_01 tables

SELECT  
	*
FROM 
	`cyclistic-cs-341119.biketrips.2021_02_biketrips`
ORDER BY
	ride_length DESC 


 -- Update data type for ride_length pt. II
 -- Convert from string to interval and repeat for all 12 tables

SELECT 
        ride_id, 
        rideable_type, 
        started_at, 
        ended_at, 
	CAST(ride_length AS INTERVAL) AS ride_length,
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
        member_casual
FROM 
        `cyclistic-cs-341119.biketrips.2021_02_biketrips`


 -- Check to make sure update worked
 -- Repeat for all 12 tables

SELECT  
        *
FROM 
	`cyclistic-cs-341119.biketrips.2021_02_biketrips`
ORDER BY
        ride_length DESC 


 -- Use SELECT DISTINCT to see how many trips are in each table
 -- Repeat for all 12 tables

SELECT 
	COUNT (DISTINCT ride_id)
FROM 
        `cyclistic-cs-341119.biketrips.2021_02_biketrips`


 -- Combine the count distinct results into one temporary table:
 
 WITH biketrips_2021_02 AS 
        (
        SELECT 
	        '2021_02_biketrips' AS period,
                COUNT (DISTINCT ride_id) AS ride_total
        FROM 
                `cyclistic-cs-341119.biketrips.2021_02_biketrips`
        ), biketrips_2021_03 AS 
        (
        SELECT 
                '2021_03_biketrips' AS period, 
                COUNT (DISTINCT ride_id) AS ride_total
        FROM 
                `cyclistic-cs-341119.biketrips.2021_03_biketrips`

        ), biketrips_2021_04 AS 
        (
        SELECT 
                '2021_04_biketrips' AS period, 
                COUNT (DISTINCT ride_id) AS ride_total
        FROM 
                `cyclistic-cs-341119.biketrips.2021_04_biketrips`

        ), biketrips_2021_05 AS 
        (
        SELECT 
                '2021_05_biketrips' AS period, 
                COUNT (DISTINCT ride_id) AS ride_total
        FROM 
                `cyclistic-cs-341119.biketrips.2021_05_biketrips`

        ), biketrips_2021_06 AS 
        (
        SELECT 
                '2021_06_biketrips' AS period, 
                COUNT (DISTINCT ride_id) AS ride_total
        FROM 
                `cyclistic-cs-341119.biketrips.2021_06_biketrips`

        ), biketrips_2021_07 AS 
        (
        SELECT 
                '2021_07_biketrips' AS period, 
                COUNT (DISTINCT ride_id) AS ride_total
        FROM 
                `cyclistic-cs-341119.biketrips.2021_07_biketrips`

        ), biketrips_2021_08 AS 
        (
        SELECT 
                '2021_08_biketrips' AS period, 
                COUNT (DISTINCT ride_id) AS ride_total
        FROM 
                `cyclistic-cs-341119.biketrips.2021_08_biketrips`

        ), biketrips_2021_09 AS 
        (
        SELECT 
                '2021_09_biketrips' AS period, 
                COUNT (DISTINCT ride_id) AS ride_total
        FROM 
                `cyclistic-cs-341119.biketrips.2021_09_biketrips`

        ), biketrips_2021_10 AS 
        (
        SELECT 
                '2021_10_biketrips' AS period, 
                COUNT (DISTINCT ride_id) AS ride_total
        FROM 
                `cyclistic-cs-341119.biketrips.2021_10_biketrips`

        ), biketrips_2021_11 AS 
        (
        SELECT 
                '2021_11_biketrips' AS period, 
                COUNT (DISTINCT ride_id) AS ride_total
        FROM 
                `cyclistic-cs-341119.biketrips.2021_11_biketrips`

        ), biketrips_2021_12 AS 
        (
        SELECT 
                '2021_12_biketrips' AS period, 
                COUNT (DISTINCT ride_id) AS ride_total
        FROM 
                `cyclistic-cs-341119.biketrips.2021_12_biketrips`

        ), biketrips_2022_01 AS 
        (
        SELECT 
                '2022_01_biketrips' AS period, 
                COUNT (DISTINCT ride_id) AS ride_total
        FROM 
                `cyclistic-cs-341119.biketrips.2022_01_biketrips`

        )
SELECT 
        *
FROM 
        biketrips_2021_02
UNION DISTINCT
SELECT
        *
FROM
        biketrips_2021_03
UNION DISTINCT
SELECT
        *
FROM
        biketrips_2021_04
UNION DISTINCT
SELECT
        *
FROM
        biketrips_2021_05
UNION DISTINCT
SELECT
        *
FROM
        biketrips_2021_06
UNION DISTINCT
SELECT
        *
FROM
        biketrips_2021_07
UNION DISTINCT
SELECT
        *
FROM
        biketrips_2021_08
UNION DISTINCT
SELECT
        *
FROM
        biketrips_2021_09
UNION DISTINCT
SELECT
        *
FROM
        biketrips_2021_10 
UNION DISTINCT
SELECT
        *
FROM
        biketrips_2021_11
UNION DISTINCT
SELECT
        *
FROM
        biketrips_2021_12
UNION DISTINCT
SELECT
        *
FROM
        biketrips_2022_01
ORDER BY 
        2 DESC


 -- We'll create five quarterly tables for analysis:
 -- Table 1) 2021_Q1 -> FEB(02), MAR(03)
 -- Table 2) 2021_Q2 -> APR(04), MAY(05), JUN(06)
 -- Table 3) 2021_Q3 -> JUL(07), AUG(08), SEP(09)
 -- Table 4) 2021_Q4 -> OCT(10), NOV(11), DEC(12)
 -- Table 5) 2022_Q1 -> JAN(01)

 -- We’ll first create 2021_Q2 and then repeat for the remaining four tables
 -- Using UNION to join 2021_Q2 tables: APR, MAY, JUN

SELECT 
        ride_id, 
        rideable_type, 
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
        member_casual,
	'Q2' AS quarter
FROM 
        `cyclistic-cs-341119.biketrips.2021_04_biketrips`
UNION DISTINCT  
SELECT 
        ride_id, 
        rideable_type, 
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
        member_casual,
	'Q2' AS quarter
FROM 
        `cyclistic-cs-341119.biketrips.2021_05_biketrips`
UNION DISTINCT  
SELECT 
        ride_id, 
        rideable_type, 
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
        member_casual,
	'Q2' AS quarter
FROM 
        `cyclistic-cs-341119.biketrips.2021_06_biketrips`

 -- Update the format for 'day_of_week' from float to string
 -- Start with 2021_Q1 and repeat for other four tables
 -- Update 'day_of_week' format with CAST()

SELECT 
        ride_id, 
        rideable_type, 
        started_at, 
        ended_at, 
	ride_length,
        ride_date,
        ride_month,
        ride_year,
        start_time,
        end_time,
        CAST(day_of_week AS STRING) AS day_of_week,
	start_station_name, 
	start_station_id, 
        end_station_name, 
	end_station_id, 
        start_lat, 
        start_lng, 
	end_lat, 
        end_lng, 
        member_casual,
	'Q2' AS quarter
FROM 
        `cyclistic-cs-341119.biketrips.2021_Q1`

 -- Update 'day_of_week' values in Q1, Q2, Q3, Q4.
 -- Start with 2021_Q1 and repeat for other four tables
 -- Update 'day_of_week' values with CASE WHEN

UPDATE 
	`cyclistic-cs-341119.biketrips.2021_Q1`
SET  
        day_of_week = 
            CASE
                WHEN day_of_week = '1' THEN 'Sunday'
                WHEN day_of_week = '2' THEN 'Monday'
                WHEN day_of_week = '3' THEN 'Tuesday'
                WHEN day_of_week = '4' THEN 'Wednesday'
                WHEN day_of_week = '5' THEN 'Thursday'
                WHEN day_of_week = '6' THEN 'Friday'
                WHEN day_of_week = '7' THEN 'Saturday' 
            END
WHERE
        day_of_week IN ('1', '2', '3', '4', '5', '6', '7')

