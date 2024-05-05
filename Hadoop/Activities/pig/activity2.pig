-- Load input file from HDFS
inputFile = LOAD 'hdfs:///user/parvesh/input.txt' AS (line:chararray);
-- Tokeize each word in the file (Map)
words = FOREACH inputFile GENERATE FLATTEN(TOKENIZE(line)) AS word;
-- Combine the words from the above stage
grpd = GROUP words BY word;
-- Count the occurence of each word (Reduce)
totalCount = FOREACH grpd GENERATE $0, COUNT($1) AS wordCount;
--remove the old folder
rmf hdfs:///user/parvesh/pigOutput1;
-- Store the result in HDFS
STORE totalCount INTO 'hdfs:///user/parvesh/pigOutput1';