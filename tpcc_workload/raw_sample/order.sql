INSERT INTO new_order (no_w_id, no_d_id, no_o_id) 
VALUES (:w_id, :d_id, :o_id);

INSERT INTO orders (o_w_id, o_d_id, o_o_id, o_c_id, o_entry_d, o_ol_cnt, o_all_local)
VALUES (:w_id, :d_id, :o_id, :c_id, NOW(), :ol_cnt, :all_local);

INSERT INTO order_line (ol_w_id, ol_d_id, ol_o_id, ol_number, ol_i_id, ol_supply_w_id, ol_quantity, ol_amount)
VALUES (:w_id, :d_id, :o_id, :line_number, :i_id, :supply_w_id, :quantity, :amount);

UPDATE stock SET s_quantity = s_quantity - :quantity 
WHERE s_i_id = :i_id AND s_w_id = :w_id;
