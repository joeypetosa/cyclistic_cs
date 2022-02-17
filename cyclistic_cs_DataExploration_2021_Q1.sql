/*
Cyclistic Case Study: Data Exploration, 2021_Q1
Windows Functions, Aggregate Functions, Creating Views, Converting Data Types
*/

 -- Select Q1 data 

SELECT  
        ride_id,
        ride_length,
        day_of_week, 
        member_casual
FROM 
        `cyclistic-cs-341119.biketrips.2021_Q1`
ORDER BY 
        ride_length DESC


  -- Total Trips: Members vs Casual 
  -- Looking at overall, annual member and casual rider totals

SELECT 
        TotalTrips,
        TotalMemberTrips,
        TotalCasualTrips,
        (TotalMemberTrips/TotalTrips)*100 AS MemberPercentage,
        (TotalCasualTrips/TotalTrips)*100 AS CasualPercentage,
FROM 
        (
        SELECT
                COUNT(ride_id) AS TotalTrips,
                COUNTIF(member_casual = 'member') AS TotalMemberTrips,
                COUNTIF(member_casual = 'casual') AS TotalCasualTrips,
        FROM
                `cyclistic-cs-341119.biketrips.2021_Q1`
        )

-- 2021_Q1 Total Trips = 278,118
-- 2021_Q1 Total Member Trips = 183,954 (66.1% of total)
-- 2021_Q1 Total Casual Trips =  94,164 (33.9% of total)


 -- Avergage Ride Lengths: Members vs Casual  
 -- Looking at overall, member and casual average ride lengths. 

SELECT
        (
        SELECT 
                AVG(ride_length)
        FROM 
                `cyclistic-cs-341119.biketrips.2021_Q1`
        ) AS AvgRideLength_Overall,
        (
        SELECT 
                AVG(ride_length) 
        FROM 
                `cyclistic-cs-341119.biketrips.2021_Q1`
        WHERE 
                member_casual = 'member'
        ) AS AvgRideLength_Member,
        (
        SELECT 
                AVG(ride_length) 
        FROM 
                `cyclistic-cs-341119.biketrips.2021_Q1`
        WHERE 
                member_casual = 'casual'
        ) AS AvgRideLength_Casual

 -- We can see that casual riders average 23 more minutes per trip. 
 -- Could this be do to outliers?

 -- Max Ride Lengths: Members vs Casual  
 -- Looking at max ride lengths to check for outliers

SELECT 
        member_casual,
        MAX(ride_length) AS ride_length_MAX
FROM 
        `cyclistic-cs-341119.biketrips.2021_Q1`
GROUP BY 
        member_casual
ORDER BY 
        ride_length_MAX DESC
LIMIT 
        2

 -- As we suspected, the casual riders average ride_length
 -- was sigificantly impacted by at least one outlier but 
 -- probably more. The longest trip duration for casual 
 -- riders was 528 hours, or 22 days. The longest for annual
 -- was about 26 hours. 


 -- Median Ride Lengths: Members vs Casual 
 -- Looking at median because of outliers influence on AVG.
 -- This will be more accurate for analysis.

SELECT
        DISTINCT median_ride_length,
        member_casual
FROM 
        (
        SELECT 
                ride_id,
                member_casual,
                ride_length,
                PERCENTILE_DISC(ride_length, 0.5 IGNORE NULLS) OVER(PARTITION BY member_casual) AS  median_ride_length
        FROM 
                `cyclistic-cs-341119.biketrips.2021_Q1`
        )
ORDER BY 
        median_ride_length DESC LIMIT 2

 -- Now we see a much closer number, with 18 minutes for casual
 -- riders and 10 minutes for annual members.

 -- Number of rides per day for member and casual
 -- Looking at which days have the highest number of rides

SELECT
        member_casual, 
        day_of_week AS mode_day_of_week # Top number of day_of_week
FROM 
        (
        SELECT
                DISTINCT member_casual, day_of_week, ROW_NUMBER() OVER (PARTITION BY member_casual ORDER BY COUNT(day_of_week) DESC) rn
        FROM
                `cyclistic-cs-341119.biketrips.2021_Q1`
        GROUP BY
                member_casual, day_of_week
        )
WHERE
        rn = 1
ORDER BY
        member_casual DESC LIMIT 2
 
 -- Unsurprisingly, Saturday is the most popular day for trips


 -- Looking at average ride length per day of week

SELECT 
        day_of_week,
        AVG(ride_length) AS average_ride_length
FROM 
        (
        SELECT 
                member_casual,
                day_of_week,
                ride_length,
        FROM
                `cyclistic-cs-341119.biketrips.2021_Q1`
        )
GROUP BY
        day_of_week
ORDER BY
        average_ride_length DESC LIMIT 7

 -- Unsurprisingly, Saturday also has the longest average
 -- ride length
 

 -- How about the median ride length per day of week?

SELECT
        DISTINCT median_ride_length,
        day_of_week
FROM 
        (
        SELECT 
                ride_id,
                day_of_week,
                ride_length,
                PERCENTILE_DISC(ride_length, 0.5 IGNORE NULLS) OVER(PARTITION BY day_of_week) AS  median_ride_length
        FROM 
                `cyclistic-cs-341119.biketrips.2021_Q1`
        )
ORDER BY 
        median_ride_length DESC LIMIT 7
 
 -- Sunday just edges out Saturday for the longest median ride length

 
 -- Looking at AVG ride length per day of week for casual and annual

SELECT 
        member_casual,
        day_of_week,
        AVG(ride_length) AS average_ride_length
FROM 
        (
        SELECT 
                member_casual,
                day_of_week,
                ride_length,
        FROM
                `cyclistic-cs-341119.biketrips.2021_Q1`
        )
GROUP BY
        day_of_week,
        member_casual
ORDER BY
        average_ride_length DESC LIMIT 14


 -- Looking at median ride lengths per day because of outliers influencing AVG

SELECT
        DISTINCT median_ride_length,
        member_casual,
        day_of_week
FROM 
        (
        SELECT 
                ride_id,
                member_casual,
                day_of_week,
                ride_length,
                PERCENTILE_DISC(ride_length, 0.5 IGNORE NULLS) OVER(PARTITION BY day_of_week) AS  median_ride_length
        FROM 
                `cyclistic-cs-341119.biketrips.2021_Q1`
        WHERE
                member_casual = 'member'
        )
ORDER BY 
        median_ride_length DESC LIMIT 7
##
SELECT
        DISTINCT median_ride_length,
        member_casual,
        day_of_week
FROM 
        (
        SELECT 
                ride_id,
                member_casual,
                day_of_week,
                ride_length,
                PERCENTILE_DISC(ride_length, 0.5 IGNORE NULLS) OVER(PARTITION BY day_of_week) AS  median_ride_length
        FROM 
                `cyclistic-cs-341119.biketrips.2021_Q1`
        WHERE
                member_casual = 'casual'
        )
ORDER BY 
        median_ride_length DESC LIMIT 7

 -- Very interesting! The median ride length for casual riders 
 -- on the top four days (SUN, SAT, MON, TUE) is nearly double 
 -- the amount for annual members on those same days. 


 -- Looking at total number of trips per day_of_week

SELECT  
        day_of_week,
        COUNT(DISTINCT ride_id) AS TotalTrips
FROM
        `cyclistic-cs-341119.biketrips.2021_Q1`
GROUP BY 
        day_of_week
ORDER BY 
        TotalTrips DESC LIMIT 7


 -- Looking at total number of member trips per day_of_week

SELECT  
        day_of_week,
        COUNT(DISTINCT ride_id) AS TotalTrips
FROM
        `cyclistic-cs-341119.biketrips.2021_Q1`
WHERE 
        member_casual = 'member'
GROUP BY 
        day_of_week
ORDER BY 
        TotalTrips DESC LIMIT 7


 -- Looking at total number of casual trips per day_of_week

SELECT  
        day_of_week,
        COUNT(DISTINCT ride_id) AS TotalTrips
FROM
        `cyclistic-cs-341119.biketrips.2021_Q1`
WHERE 
        member_casual = 'casual'
GROUP BY 
        day_of_week
ORDER BY 
        TotalTrips DESC LIMIT 7