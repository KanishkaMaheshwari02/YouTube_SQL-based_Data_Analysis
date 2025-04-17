
#Q1.Top 5 most subscribed YouTube channels.

SELECT 
    channel_id,
    channel_name,
    subscribers,
    CASE
        WHEN subscribers LIKE '%M' THEN REPLACE(subscribers, 'M', '') * 1000000
        ELSE subscribers
    END AS numeric_equivalent
FROM
    youtube_channels
ORDER BY numeric_equivalent DESC
LIMIT 5; 


#Q2. Find the total yearly revenue of all channels. 

SELECT 
    SUM(yearly_revenue) AS total_yearly_revenue
FROM
    channel_revenue; 

#Q3.Find the video uploaded by 'MrBeast'

SELECT 
    youtube_channels.channel_id,
    youtube_channels.channel_name,
    channel_videos.video_id,
    channel_videos.video_title,
    channel_videos.upload_date
FROM
    youtube_channels
        JOIN
    channel_videos ON youtube_channels.channel_id = channel_videos.channel_id
WHERE
    youtube_channels.channel_name = 'MrBeast';
    
    
#Q4.Get the average engagement (likes & comments) for each channel.

SELECT 
    youtube_channels.channel_id,
    youtube_channels.channel_name,
    channel_engagement.likes_per_video AS avg_likes,
    channel_engagement.comments_per_video AS avg_comments
FROM
    youtube_channels
        JOIN
    channel_engagement ON youtube_channels.channel_id = channel_engagement.channel_id;

#Q5. List channels that have a NOX score higher than 10(highest to lowest score).

SELECT * FROM youtube_channels
WHERE nox_score > 10
ORDER BY nox_score DESC;


#Q6. Find the most commented video

SELECT 
    youtube_channels.channel_id,
    youtube_channels.channel_name,
    channel_videos.video_id,
    channel_videos.video_title,
    channel_videos.comments
FROM
    channel_videos
        JOIN
    youtube_channels ON channel_videos.channel_id = youtube_channels.channel_id
ORDER BY channel_videos.comments DESC
LIMIT 1;

#Q7.  Count the total number of channels in each category.

SELECT 
    category, COUNT(channel_id) AS channels_count
FROM
    youtube_channels
GROUP BY category;

#Q8. Search for channel names that start with "M" and end with "t".

SELECT 
    channel_id, channel_name, category
FROM
    youtube_channels
WHERE
    channel_name LIKE 'M%t';

#Q9. Find videos uploaded between '2024-03-01' AND '2024-08-01'.

SELECT 
    youtube_channels.channel_name,
    channel_videos.video_title,
    channel_videos.upload_date
FROM
    channel_videos
        JOIN
    youtube_channels ON channel_videos.channel_id = youtube_channels.channel_id
WHERE
    upload_date BETWEEN '2024-03-01' AND '2024-08-01';

#Q10.  Find the top 3 most liked videos.

SELECT 
    youtube_channels.channel_id,
    youtube_channels.channel_name,
    channel_videos.video_id,
    channel_videos.video_title,
    channel_videos.likes
FROM
    youtube_channels
        JOIN
    channel_videos ON youtube_channels.channel_id = channel_videos.channel_id
ORDER BY channel_videos.likes DESC
LIMIT 3;





