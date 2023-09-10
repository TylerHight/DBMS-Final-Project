# Changes the maximum number of characters for column A_num to 100
ALTER TABLE account 
MODIFY COLUMN A_num CHAR(100);
