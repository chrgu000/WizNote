select id,businessNum,"TRF" as orderType from changewhorder   
UNION
select id,businessNum,"REM" as orderType from remorder where orderStatus = 'Finished'
UNION
select id,businessNum,"RMA" as orderType from rmaorder where orderStatus = 'Finished';


select * from changewhorder ;

select * from remorder;

select * from rmaorder;

select * from orderitemaddonaction;

select * from ChargeResult where BusinessObjectType='RMA';

select * from TransactionBill   where chargeObjectId='2000401';

select a.*,c.additionalServiceType from (
select id,businessNum from rmaorder where orderStatus in ("Finished","RecvDoneOdr")
) a left join rmaorderitem b on a.id = b.rmaorderId 
left join orderitemaddonaction c on c.inbOrderItemId = b.id
where (b.handleWay = 'CHECK' and c.additionalServiceType is null) or c.additionalServiceType = "CHECK" or c.additionalServiceType = "TAKING_PICTURES";

select a.*,c.additionalServiceType from (
select id,businessNum from rmaorder where orderStatus in ("Finished","RecvDoneOdr")
) a left join rmaorderitem b on a.id = b.rmaorderId 
left join orderitemaddonaction c on c.inbOrderItemId = b.id
where c.additionalServiceType = "PACKAGE";

select a.* from (
select id,businessNum from rmaorder where orderStatus in ("Finished","RecvDoneOdr")
) a left join rmaorderitem b on a.id = b.rmaorderId 
where b.handleWay = "DESTROY";

select a.* from (
select id,businessNum from rmaorder where orderStatus in ("Finished","RecvDoneOdr")
) a left join rmaorderitem b on a.id = b.rmaorderId 
where b.handleWay = "SHELVES";