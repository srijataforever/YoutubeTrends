-- Registring piggybank
REGISTER /home/vagrant/assignment1/piggybank-0.12.0.jar

-- Loading five diffrent CSV files into PIG
CAdata = LOAD '/home/vagrant/youtube/CAvideos.csv' USING org.apache.pig.piggybank.storage.CSVExcelStorage(',', 'NO_MULTILINE', 'UNIX', 'SKIP_INPUT_HEADER');

DEdata = LOAD '/home/vagrant/youtube/DEvideos.csv' USING org.apache.pig.piggybank.storage.CSVExcelStorage(',', 'NO_MULTILINE', 'UNIX', 'SKIP_INPUT_HEADER');

FRdata = LOAD '/home/vagrant/youtube/FRvideos.csv' USING org.apache.pig.piggybank.storage.CSVExcelStorage(',', 'NO_MULTILINE', 'UNIX', 'SKIP_INPUT_HEADER');

GBdata = LOAD '/home/vagrant/youtube/GBvideos.csv' USING org.apache.pig.piggybank.storage.CSVExcelStorage(',', 'NO_MULTILINE', 'UNIX', 'SKIP_INPUT_HEADER');

USdata = LOAD '/home/vagrant/youtube/USvideos.csv' USING org.apache.pig.piggybank.storage.CSVExcelStorage(',', 'NO_MULTILINE', 'UNIX', 'SKIP_INPUT_HEADER');

-- Combining all CSV files
U = UNION CAdata, DEdata, FRdata, GBdata, USdata;

-- Selecting limited number of columns 
-- video_id,trending_date,title,channel_title,publish_time,tags,views,likes,dislikes,comment_count,country
limitedData = FOREACH U GENERATE $0 .. $3, $5 .. $10, $14;

-- storing data
STORE limitedData into '/home/vagrant/youtube/data';
