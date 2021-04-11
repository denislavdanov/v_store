use v_store;
create view StaffAndStore
AS 
SELECT staff.staff_id, staff.first_name, store.store_id ,store.store_name
 FROM staff JOIN store
 ON staff.staff_id IN (
	SELECT staff_id
	FROM plan
	WHERE plan.store_id = store.store_id
 )
 WHERE store.store_id IN(
	SELECT store_id
    FROM plan
    WHERE store_id IN(
		SELECT store_id
		FROM plan
		WHERE plan_date = '2016-05-04'
		AND customer_id IN(
			SELECT id
			FROM customer
			WHERE first_name = 'Jivko'
		)
        AND staff_id =(
			SELECT staff_id
			FROM staff
            WHERE first_name = 'Iva'
		)
    )
 );