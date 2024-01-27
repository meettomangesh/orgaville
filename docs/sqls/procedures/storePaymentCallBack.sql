DELIMITER $$
DROP PROCEDURE IF EXISTS storePaymentCallBack$$
CREATE PROCEDURE storePaymentCallBack(IN inputData JSON)
storePaymentCallBack:BEGIN
    
    INSERT INTO test_table (input_data) VALUES (inputData);
END$$
DELIMITER ;