delete from omniorderitem where orderId <2569244;
delete from omniorderproductitem where orderId < 2569244;
delete from parceldetail where shipmentId in(select id from shipmentinfo where orderId < 2569244) ;
delete from shipmentinfo where orderId < 2569244;
delete from omniorder where id <2569244;



delete from omniorderitem where orderId <2569248;
delete from omniorderproductitem where orderId < 2569248;
delete from parceldetail where shipmentId in? (?select id from shipmentinfo where orderId < 2569248) ;
delete from shipmentinfo where orderId < 2569248;
delete from omniorder where id <2569248;
delete from warehouseworkorderinfo where id <= 169141;
delete from warehouseworkorderinfo where id <= 669141;
delete from warehouseworkorderinfo where id <= 1169141;delete from warehouseworkorderinfo where id <= 1569141;
delete from warehouseworkorderinfo where id <= 2169141;
delete from warehouseworkorderinfo where id <= 2669141;
delete from warehouseworkorderinfo where id <= 3169141;
delete from warehouseworkorderinfo where id <= 3269141;

delete from chargeresult where chargeObjectId <=2601300;
delete from transactionbill where chargeObjectId <=2601300;
delete from chargeobjectandproperty where chargeObjectId<=2601300;
delete from chargeobject where id<=2601300;