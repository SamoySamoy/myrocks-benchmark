INSERT INTO payment (p_w_id, p_d_id, p_c_id, p_amount, p_date)
VALUES (:w_id, :d_id, :c_id, :amount, NOW());

UPDATE customer SET c_balance = c_balance - :amount
WHERE c_w_id = :w_id AND c_d_id = :d_id AND c_id = :c_id;

UPDATE district SET d_ytd = d_ytd + :amount
WHERE d_w_id = :w_id AND d_d_id = :d_id;
