# Trigger 1: Copies the amount of savings or checking from the previous transaction upon a new 
# transaction if the value is NULL or empty for the new transaction when trans_record has a new row added
DELIMITER $$
DROP TRIGGER IF EXISTS carry_amount$$
CREATE TRIGGER carry_amount
BEFORE INSERT ON trans_record
FOR EACH ROW
BEGIN
    IF (NEW.Checking = '' OR NEW.Checking IS NULL)
    THEN
		# set the new checking value to the previous checking value
        SET NEW.Checking = (SELECT t.Checking FROM trans_record t ORDER BY T_Cid DESC LIMIT 1);
    END IF;
    IF (NEW.Saving = '' OR NEW.Saving IS NULL)
    THEN
        SET NEW.Saving = (SELECT t.Saving FROM trans_record t ORDER BY T_Cid DESC LIMIT 1);
    END IF;
END $$
DELIMITER ;


# Trigger 2: Checks if the minimum balance will be violated before a withdrawal from checking or savings:
DELIMITER $$
DROP TRIGGER IF EXISTS check_min_balance$$
CREATE TRIGGER check_min_balance
BEFORE INSERT ON trans_record
FOR EACH ROW
BEGIN
  DECLARE min_balance INT DEFAULT 100;  # min balance that can be in the account
  # Previous checking value
  DECLARE prev_checking INT DEFAULT (SELECT t.Checking FROM trans_record t ORDER BY T_Cid DESC LIMIT 1);
  DECLARE prev_saving INT DEFAULT (SELECT t.Saving FROM trans_record t ORDER BY T_Cid DESC LIMIT 1);
  IF NEW.Checking < min_balance THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Cannot withdraw. Minimum balance requirement not met.';
  END IF;
END; $$
DELIMITER ;

# Trigger 3: Increments the T_Cid (transaction ID) for a new row when a new transaction is entered
DELIMITER $$
DROP TRIGGER IF EXISTS increment_trans_ID$$
CREATE TRIGGER increment_trans_ID
BEFORE INSERT ON trans_record
FOR EACH ROW
BEGIN
  IF (NEW.T_Cid = '' OR NEW.T_Cid IS NULL)
    THEN
		# set the new T_Cid value to the previous T_Cid value + 1
        SET NEW.T_Cid = ((SELECT t.T_Cid FROM trans_record t ORDER BY T_Cid DESC LIMIT 1)+1);
	END IF;
END; $$
DELIMITER ;
