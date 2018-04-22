##Query 1:
##Calculate top channels with maximum number of likes
select channel_title, country, max(likes) FROM
ca675 group by country, channel_title order by channel_title


##Query 2:
##Calculate top 10 category with maximum number of comments
select category, max(comment_count) as
max_comment_count from ca675 group by category ORDER
BY max_comment_count DESC LIMIT 10;

##Query 3:
##Calculate top videos with maximum number of views
select title, country, max(views) as max_views FROM
ca675 group by country, title order by title

##Query 4:
##Find out the top 10 categories with maximum number of video uploads
select Category, count (*) as video_count FROM 
ca675 group by category order by video_count desc limit 10;

##Query 5:
##Calculate top videos with maximum number of views where comments & ratings disabled
select title, country, max(views) as max_views FROM ca675 
WHERE comments_disabled = 'TRUE' AND ratings_disabled = 'TRUE'
group by country, title order by title
