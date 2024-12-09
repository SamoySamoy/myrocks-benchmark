SELECT o_o_id, o_entry_d, o_status 
FROM orders 
WHERE o_w_id = :w_id AND o_d_id = :d_id AND o_c_id = :c_id;

SELECT ol_number, ol_i_id, ol_supply_w_id, ol_quantity, ol_amount 
FROM order_line
WHERE ol_w_id = :w_id AND ol_d_id = :d_id AND ol_o_id = :o_id;
