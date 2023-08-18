# AisleAssignment

#Project - 1 Answer:
Maintain a user database that stores user profiles, including their unique user IDs, time zones, and remaining daily Likes.
Implement a scheduled task that triggers every day at a specific time (e.g., 12:00 pm) in UTC time.
Iterate through each user in the database and calculate the user's local 12:00 pm time based on their time zone.
Reset each user's remaining daily Likes to the default value of 10.
Convert user's local 12:00 pm time to UTC time for consistent scheduling and calculations.
iOS provides APIs to work with time zones, such as TimeZone and Calendar classes.
