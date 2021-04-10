use v_store
drop procedure makePlan if exists
delimiter $ 
create procedure makePlan(in customerID int, in orderStatus VARCHAR(30), in planDate DATE, in storeID int, in staffID int)
begin
if not exists (select 1 from plan where customer_id=@customerID and order_status=@orderStatus and plan_date=@planDate and store_id=@storeID and staff_id=@staffID )
then
insert into plan(customer_id, order_status, plan_date, store_id, staff_id)
values (customerID,orderStatus,planDate,storeID,staffID);
else
select 'there is existing plan' as error;
end if;
end;
$
delimiter ;

set @customerID=100104;
set @orderStatus='active';
set  @planDate= '2017-03-03';
set @storeID=110102;
set @staffID=120103;
call makePlan(@customerID,@orderStatus,@planDate,@storeID,@staffID);