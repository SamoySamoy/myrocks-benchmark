SELECT s_quantity 
FROM stock 
WHERE s_w_id = :w_id AND s_i_id = :i_id;