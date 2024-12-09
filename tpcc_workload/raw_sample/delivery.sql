SELECT no_o_id, no_c_id 
FROM new_order 
WHERE no_w_id = :w_id AND no_d_id = :d_id;

DELETE FROM new_order 
WHERE no_w_id = :w_id AND no_d_id = :d_id AND no_o_id = :o_id;

INSERT INTO delivery (d_w_id, d_d_id, d_o_id, d_c_id, d_entry_d)
VALUES (:w_id, :d_id, :o_id, :c_id, NOW());

UPDATE orders SET o_status = 'F' 
WHERE o_w_id = :w_id AND o_d_id = :d_id AND o_o_id = :o_id;


