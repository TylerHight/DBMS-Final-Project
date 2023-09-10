# delete the last row if it was already added from the previous test
# (not neccessary to run this line if "Trigger 1 and Trigger 3 Test" has
# not been run yet)
# DELETE FROM TRANS_RECORD ORDER BY T_Cid DESC LIMIT 1;

# Trigger 1 and Trigger 3 Test
# Trigger 1 is demonstrated as the row identified as T_Cid 6 where Saving is copied over from
# the previous row. Trigger 3 is demonstrated as the T_Cid automatically being generated as the
# previous T_Cid incremented by one.
INSERT INTO trans_record(Checking, Date) VALUES 
(13000, NOW());
SELECT * FROM trans_record;

# Trigger 2 Test
# raises an error because the update to Checking, 50, is lower than the minimum 
# allowed amount in an account, 100
INSERT INTO trans_record(Checking, Date) VALUES 
(50, NOW());

# Display the table
SELECT * FROM trans_record;


