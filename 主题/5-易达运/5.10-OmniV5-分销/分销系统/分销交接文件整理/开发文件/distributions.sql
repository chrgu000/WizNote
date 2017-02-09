
CREATE TABLE `distributionPublish` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `productId` bigint(20) NOT NULL COMMENT '产品ID',
  `accountId` varchar(255) NOT NULL COMMENT '商家编号',
  `distributionSku` varchar(255) NOT NULL COMMENT '分销平台sku',
  `distributionShareWarningQuantity` int(11) DEFAULT NULL COMMENT '分销共享警告值',
  `categoryId` bigint(11) NOT NULL COMMENT '产品分类',
  `status` varchar(255) DEFAULT NULL COMMENT '状态',
  `imageUrl` varchar(2000) DEFAULT NULL COMMENT '图片 imageUrl规则：1.jpg;2.jpg',
  `createBy` bigint(20) NOT NULL,
  `createDate` datetime NOT NULL,
  `modifiedBy` bigint(20) NOT NULL,
  `modifiedDate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='产品刊登表';

CREATE TABLE `distributionPublishDetail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `distributionPublishId` bigint(20) NOT NULL COMMENT 'distributionPublish.id',
  `warehouseId` bigint(20) NOT NULL COMMENT '仓库ID',
  `productId` bigint(20) NOT NULL COMMENT '产品ID',
  `distributionShareQuantity` int(11) DEFAULT NULL COMMENT '分销共享',
  `price` decimal(10,2) DEFAULT NULL COMMENT '分销价',
  `supplierPrice` decimal(10,2) DEFAULT NULL COMMENT '供货价',
  `adviceRetailPrice` decimal(10,2) DEFAULT NULL COMMENT '建议零售价',
  `lowestRetailPrice` decimal(10,2) DEFAULT NULL COMMENT '最低零售价',
  `createBy` bigint(20) NOT NULL,
  `createDate` datetime NOT NULL,
  `modifiedBy` bigint(20) NOT NULL,
  `modifiedDate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='产品刊登表明细表';


CREATE TABLE `distributionPublishAuditing` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `warehouseId` bigint(11) NOT NULL COMMENT '仓库ID',
  `accountId` varchar(255) NOT NULL COMMENT '商家编号',
  `distributionSku` varchar(255) NOT NULL COMMENT '分销平台sku',
  `distributionShareQuantity` int(11) DEFAULT NULL COMMENT '分销共享',
  `price` decimal(10,2) DEFAULT NULL COMMENT '分销价',
  `supplierPrice` decimal(10,2) DEFAULT NULL COMMENT '供货价',
  `adviceRetailPrice` decimal(10,2) DEFAULT NULL COMMENT '建议零售价',
  `lowestRetailPrice` decimal(10,2) DEFAULT NULL COMMENT '最低零售价',
  `categoryId` bigint(11) NOT NULL COMMENT '类别id',
  `status` varchar(255) DEFAULT NULL COMMENT '状态',
  `auditingAccountId` bigint(20) DEFAULT NULL COMMENT '运营审核人id',
  `auditingDesc` varchar(512) NOT NULL COMMENT '审查内容',
  `createBy` bigint(20) NOT NULL,
  `createDate` datetime NOT NULL,
  `modifiedBy` bigint(20) NOT NULL,
  `modifiedDate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='产品刊登变更审核表';

CREATE TABLE `distributionOrder` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `accountId` varchar(255) NOT NULL COMMENT '商家编号',
  `distributionOrderId` bigint(20) NOT NULL COMMENT '[分销平台]预订单ID',
  `distributionOrderSN` varchar(64) NOT NULL COMMENT '[分销平台]预订单编号',
  `bookingTotalPay` decimal(10,2) DEFAULT NULL COMMENT '[分销平台]预订总费用',
  `currencyId`	int(11) DEFAULT NULL COMMENT '[分销平台]币种ID',
  `currencyCode`	varchar(3) DEFAULT NULL COMMENT '[分销平台]币种Code',
  `currencyValue` decimal(15,8) DEFAULT NULL COMMENT '[分销平台]币种',
  `payWay` varchar(255) DEFAULT NULL COMMENT '[分销平台]支付方式',
  `payStatus` varchar(255) DEFAULT NULL COMMENT '[分销平台]支付状态',
  `unitPriceTotal` varchar(255) DEFAULT NULL COMMENT '[分销平台]总价',
  `orderCreateDate` datetime NOT NULL COMMENT '[分销平台]订单创建时间',
  `createBy` bigint(20) NOT NULL,
  `createDate` datetime NOT NULL,
  `modifiedBy` bigint(20) NOT NULL,
  `modifiedDate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='分销单订单表';

CREATE TABLE `distributionOrderDetail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `distributionOrderId` bigint(20) NOT NULL COMMENT 'distributionOrder.id',
  `productId` bigint(20) NOT NULL,
  `warehouseId` bigint(11) NOT NULL COMMENT '仓库ID',
  `quantity` int(11) NOT NULL COMMENT '数量',
  `price` decimal(10,2) DEFAULT NULL COMMENT '分销价',
  `supplierPrice` decimal(10,2) DEFAULT NULL COMMENT '供货价',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `productOptionId` bigint(11) NOT NULL COMMENT '[分销平台]产品选项id',
  `createBy` bigint(20) NOT NULL COMMENT '产品id',
  `createDate` datetime NOT NULL,
  `modifiedBy` bigint(20) NOT NULL,
  `modifiedDate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='分销单订单表-产品明细';

CREATE TABLE `distributionInventory` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `accountId` bigint(20) NOT NULL COMMENT '产品ID',
  `productId` bigint(20) NOT NULL COMMENT '产品ID',
  `warehouseId` bigint(20) NOT NULL COMMENT '仓库ID',
  `quantity` int(11) DEFAULT NULL COMMENT '数量',
  `createBy` bigint(20) NOT NULL,
  `createDate` datetime NOT NULL,
  `modifiedBy` bigint(20) NOT NULL,
  `modifiedDate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='买方分销库存表';

CREATE TABLE `distributionInventoryLock` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `distributionInventoryId` bigint(20) NOT NULL,
  `lockedFor` varchar(255) DEFAULT NULL,
  `lockedCount` int(11) NOT NULL,
  `lockedStatus` varchar(255) DEFAULT NULL,
  `lockedTime` datetime NOT NULL,
  `unlockedTime` datetime DEFAULT NULL,
  `createBy` bigint(20) NOT NULL,
  `createDate` datetime NOT NULL,
  `modifiedBy` bigint(20) NOT NULL,
  `modifiedDate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='买方分销库存表锁表';

CREATE TABLE `distributionInventoryAccessDetails` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `productId` bigint(20) NOT NULL COMMENT '产品ID',
  `warehouseId` bigint(20) NOT NULL COMMENT '仓库ID',
  `businessNum` varchar(100) NOT NULL COMMENT '业务单号',
  `businessId` bigint(20) NOT NULL COMMENT '业务ID',
  `businessType` varchar(32) NOT NULL COMMENT '业务单类型：分销单、销售平台订单、退货单',
  `quantity` int(11) DEFAULT NULL COMMENT '数量，增加正数，使用负数',
  `quantityBefore` int(11) DEFAULT NULL COMMENT '数量变更前总数量',
  `quantityAfter` int(11) DEFAULT NULL COMMENT '数量变更后总数量',
  `createBy` bigint(20) NOT NULL,
  `createDate` datetime NOT NULL,
  `modifiedBy` bigint(20) NOT NULL,
  `modifiedDate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='分销产品库存进出明细表';

CREATE TABLE `distributionWhitelist` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `accountId` bigint(11) DEFAULT NULL,
  `distributionSku` varchar(255) DEFAULT NULL,
  `allowAccountId` bigint(11) DEFAULT NULL COMMENT '允许卖家id',
  `createBy` bigint(20) NOT NULL,
  `createDate` datetime NOT NULL,
  `modifiedBy` bigint(20) NOT NULL,
  `modifiedDate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='白名单表';

alter table inventory add COLUMN `distributionQuantity` int(11) DEFAULT NULL
COMMENT '实际仓库中划分给分销的数量';

alter table omniorder add COLUMN `distributionInventoryId` bigint(20) DEFAULT NULL
COMMENT '分销库存Id，订单使用分销产品发货才需要设置';

-- alter table omniorder add COLUMN `omniorder.ownerAccountId` bigint(20) DEFAULT NULL
-- COMMENT '产品实际拥有用户ID';

alter table productlisting add COLUMN `isDistributionProduct` int(2) DEFAULT 0
COMMENT '标记mapping的产品是不是分销产品，1分销产品、0自有产品';
增加字段
