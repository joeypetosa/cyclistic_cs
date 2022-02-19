 /*
Cyclistic Case Study: Data Visualizations, full_year
Creating VIEWs to store data for later visualizations
*/

 -- Creating VIEW for total trips by annual members

CREATE VIEW biketrips.TotalTripsMember AS 
SELECT
          day_of_week,
          member_casual,
          COUNT(DISTINCT ride_id) AS TotalTrips,
          (COUNT(DISTINCT ride_id)/TotalTrips_Overall)*100 AS PercentageOfTotal
FROM
          (
          SELECT
              COUNT(ride_id) AS TotalTrips_Overall
          FROM
              `cyclistic-cs-341119.biketrips.full_year`
          WHERE 
              member_casual = 'member'
          ),
          `cyclistic-cs-341119.biketrips.full_year`
WHERE
          member_casual = 'member'
GROUP BY
          day_of_week, 
          member_casual, 
          TotalTrips_Overall
ORDER BY
          TotalTrips DESC
LIMIT
          7


 -- Creating VIEW for total trips by casual riders

CREATE VIEW biketrips.TotalTripsCasual AS 
SELECT
          day_of_week,
          member_casual,
          COUNT(DISTINCT ride_id) AS TotalTrips,
          (COUNT(DISTINCT ride_id)/TotalTrips_Overall)*100 AS PercentageOfTotal
FROM
          (
          SELECT
              COUNT(ride_id) AS TotalTrips_Overall
          FROM
              `cyclistic-cs-341119.biketrips.full_year`
          WHERE 
              member_casual = 'casual'
          ),
          `cyclistic-cs-341119.biketrips.full_year`
WHERE
          member_casual = 'casual'
GROUP BY
          day_of_week,
          member_casual, 
          TotalTrips_Overall
ORDER BY
          TotalTrips DESC
LIMIT
          7
