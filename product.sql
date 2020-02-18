/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80017
 Source Host           : localhost:3306
 Source Schema         : product

 Target Server Type    : MySQL
 Target Server Version : 80017
 File Encoding         : 65001

 Date: 18/02/2020 15:55:20
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for order_traveller
-- ----------------------------
DROP TABLE IF EXISTS `order_traveller`;
CREATE TABLE `order_traveller`  (
  `orderId` int(11) NULL DEFAULT NULL,
  `travellerId` int(11) NULL DEFAULT NULL,
  INDEX `orderId`(`orderId`) USING BTREE,
  INDEX `travellerId`(`travellerId`) USING BTREE,
  CONSTRAINT `orderId` FOREIGN KEY (`orderId`) REFERENCES `orders` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `travellerId` FOREIGN KEY (`travellerId`) REFERENCES `traveller` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_traveller
-- ----------------------------
INSERT INTO `order_traveller` VALUES (1, 1);
INSERT INTO `order_traveller` VALUES (2, 2);
INSERT INTO `order_traveller` VALUES (3, 3);
INSERT INTO `order_traveller` VALUES (4, 2);
INSERT INTO `order_traveller` VALUES (5, 1);
INSERT INTO `order_traveller` VALUES (6, 3);
INSERT INTO `order_traveller` VALUES (7, 1);
INSERT INTO `order_traveller` VALUES (8, 2);
INSERT INTO `order_traveller` VALUES (9, 3);
INSERT INTO `order_traveller` VALUES (10, 2);
INSERT INTO `order_traveller` VALUES (11, 1);
INSERT INTO `order_traveller` VALUES (12, 3);

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `orderTime` timestamp(0) NULL DEFAULT NULL,
  `peopleCount` int(11) NULL DEFAULT NULL,
  `orderDesc` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `payType` int(11) NULL DEFAULT NULL,
  `orderStatus` int(11) NULL DEFAULT NULL,
  `productId` int(10) NULL DEFAULT NULL,
  `peopleId` int(10) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `peopleId`(`peopleId`) USING BTREE,
  INDEX `productId`(`productId`) USING BTREE,
  CONSTRAINT `peopleId` FOREIGN KEY (`peopleId`) REFERENCES `people` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `productId` FOREIGN KEY (`productId`) REFERENCES `product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (1, '2020-01-01 00:00:00', 2, '没什么', 0, 0, 1, 1);
INSERT INTO `orders` VALUES (2, '2019-12-31 00:00:00', 3, '没什么', 1, 1, 2, 2);
INSERT INTO `orders` VALUES (3, '2019-11-30 00:00:00', 4, '没什么', 0, 1, 3, 3);
INSERT INTO `orders` VALUES (4, '2019-10-31 00:00:00', 5, '没什么', 2, 1, 4, 4);
INSERT INTO `orders` VALUES (5, '2019-09-30 00:00:00', 6, '没什么', 1, 0, 5, 1);
INSERT INTO `orders` VALUES (6, '2019-08-31 00:00:00', 7, '没什么', 2, 0, 6, 2);
INSERT INTO `orders` VALUES (7, '2019-07-31 00:00:00', 8, '没什么', 0, 0, 7, 3);
INSERT INTO `orders` VALUES (8, '2019-06-30 00:00:00', 9, '没什么', 1, 0, 8, 4);
INSERT INTO `orders` VALUES (9, '2019-05-31 00:00:00', 10, '没什么', 1, 1, 9, 1);
INSERT INTO `orders` VALUES (10, '2020-01-31 12:00:00', 5, '没什么', 2, 1, 10, 2);
INSERT INTO `orders` VALUES (11, '2020-12-31 00:00:00', 8, '没什么', 0, 1, 11, 3);
INSERT INTO `orders` VALUES (12, '2020-01-20 12:50:00', 3, '没什么', 1, 0, 12, 4);

-- ----------------------------
-- Table structure for people
-- ----------------------------
DROP TABLE IF EXISTS `people`;
CREATE TABLE `people`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nickname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phoneNum` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of people
-- ----------------------------
INSERT INTO `people` VALUES (1, '张三', '小三', '1333', 'zs@163.com');
INSERT INTO `people` VALUES (2, '李四', '小四', '14444', 'ls@qq.com');
INSERT INTO `people` VALUES (3, '王五', '小五', '155555', 'ww@hm.com');
INSERT INTO `people` VALUES (4, '赵六', '小六', '1666666', 'zl@gm.com');

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES (1, '主页面', '/main');
INSERT INTO `permission` VALUES (2, '查询所有用户', '/user/findAll');
INSERT INTO `permission` VALUES (3, '查询用户详情', '/user/findById');
INSERT INTO `permission` VALUES (4, '创建用户', '/user/addUser');
INSERT INTO `permission` VALUES (5, '添加角色', '/user/addRoleToUser');
INSERT INTO `permission` VALUES (6, '查询所有角色', '/role/findAll');
INSERT INTO `permission` VALUES (8, '创建角色', '/role/addRole');
INSERT INTO `permission` VALUES (9, '添加权限', '/role/addPermissionToRole');
INSERT INTO `permission` VALUES (10, '查询所有权限', '/permission/findAll');
INSERT INTO `permission` VALUES (12, '创建权限', '/permission/addPermission');
INSERT INTO `permission` VALUES (13, '查询全部产品', '/product/findAll');
INSERT INTO `permission` VALUES (14, '创建产品', '/product/addProduct');
INSERT INTO `permission` VALUES (15, '查询全部订单', '/orders/findAll');
INSERT INTO `permission` VALUES (16, '查询订单详情', '/orders/findById');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `productName` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cityName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DepartureTime` timestamp(0) NULL DEFAULT NULL,
  `productPrice` int(30) NULL DEFAULT NULL,
  `productDesc` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `productStatus` int(30) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (1, '北京三日游', '兰州', '2020-01-01 00:00:00', 1200, '帝都我来了', 1);
INSERT INTO `product` VALUES (2, '上海五日游', '西藏', '2000-01-01 12:00:00', 1800, '魔都我来了', 0);
INSERT INTO `product` VALUES (3, '济南三日游', '合肥', '2020-01-01 00:00:00', 1200, '济南我来了', 1);
INSERT INTO `product` VALUES (4, '西藏三日游', '四川', '1999-12-28 10:00:00', 3000, '西藏我来了', 1);
INSERT INTO `product` VALUES (5, '青岛一日游', '蒙古', '2019-12-31 00:00:00', 5000, '青岛我来了', 0);
INSERT INTO `product` VALUES (6, '广西三日游', '三亚', '2019-10-01 00:00:00', 4000, '广西我来了', 1);
INSERT INTO `product` VALUES (7, '西安五日游', '西宁', '2018-01-31 12:00:00', 1500, '西安我来了', 1);
INSERT INTO `product` VALUES (8, '广东五日游', '厦门', '2018-12-31 00:00:00', 3400, '广东我来了', 0);
INSERT INTO `product` VALUES (9, '深圳一日游', '天津', '2017-01-01 12:00:00', 2800, '深圳我来了', 1);
INSERT INTO `product` VALUES (10, '桂林一日游', '青岛', '2010-12-31 00:00:00', 3500, '桂林我来了', 0);
INSERT INTO `product` VALUES (11, '南京五日游', '云南', '2010-01-01 12:00:00', 4500, '南京我来了', 1);
INSERT INTO `product` VALUES (12, '石家庄一日游', '武汉', '2020-01-20 12:50:00', 3200, '石家庄我来了', 1);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `roleDesc` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, 'ADMIN', 'master');
INSERT INTO `role` VALUES (2, 'USER', 'servant');
INSERT INTO `role` VALUES (3, 'GUEST', 'visitor');

-- ----------------------------
-- Table structure for role_permission
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission`  (
  `permissionId` int(11) NULL DEFAULT NULL,
  `roleId` int(11) NULL DEFAULT NULL,
  INDEX `permissionId`(`permissionId`) USING BTREE,
  INDEX `roleId`(`roleId`) USING BTREE,
  CONSTRAINT `permissionId` FOREIGN KEY (`permissionId`) REFERENCES `permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `roleId` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role_permission
-- ----------------------------
INSERT INTO `role_permission` VALUES (1, 1);
INSERT INTO `role_permission` VALUES (2, 1);
INSERT INTO `role_permission` VALUES (3, 1);
INSERT INTO `role_permission` VALUES (4, 1);
INSERT INTO `role_permission` VALUES (5, 1);
INSERT INTO `role_permission` VALUES (6, 1);
INSERT INTO `role_permission` VALUES (8, 1);
INSERT INTO `role_permission` VALUES (9, 1);
INSERT INTO `role_permission` VALUES (10, 1);
INSERT INTO `role_permission` VALUES (12, 1);
INSERT INTO `role_permission` VALUES (13, 1);
INSERT INTO `role_permission` VALUES (14, 1);
INSERT INTO `role_permission` VALUES (15, 1);
INSERT INTO `role_permission` VALUES (16, 1);
INSERT INTO `role_permission` VALUES (1, 2);
INSERT INTO `role_permission` VALUES (2, 2);
INSERT INTO `role_permission` VALUES (3, 2);
INSERT INTO `role_permission` VALUES (6, 2);
INSERT INTO `role_permission` VALUES (10, 2);
INSERT INTO `role_permission` VALUES (13, 2);
INSERT INTO `role_permission` VALUES (15, 2);
INSERT INTO `role_permission` VALUES (16, 2);
INSERT INTO `role_permission` VALUES (1, 3);
INSERT INTO `role_permission` VALUES (13, 3);
INSERT INTO `role_permission` VALUES (15, 3);

-- ----------------------------
-- Table structure for syslog
-- ----------------------------
DROP TABLE IF EXISTS `syslog`;
CREATE TABLE `syslog`  (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `visitTime` timestamp(0) NULL DEFAULT NULL,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ip` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `executionTime` int(50) NULL DEFAULT NULL,
  `method` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 81 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of syslog
-- ----------------------------
INSERT INTO `syslog` VALUES (81, '2020-02-18 10:39:33', 'xianyu', '0:0:0:0:0:0:0:1', '/sysLog/findAll', 54, '[类名] cn.xianyu.controller.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES (82, '2020-02-18 10:39:35', 'xianyu', '0:0:0:0:0:0:0:1', '/permission/findAll', 4, '[类名] cn.xianyu.controller.PermissionController[方法名] findAll');
INSERT INTO `syslog` VALUES (83, '2020-02-18 10:39:37', 'xianyu', '0:0:0:0:0:0:0:1', '/product/findAll', 8, '[类名] cn.xianyu.controller.ProductController[方法名] findAll');
INSERT INTO `syslog` VALUES (84, '2020-02-18 10:39:41', 'xianyu', '0:0:0:0:0:0:0:1', '/orders/findAll', 16, '[类名] cn.xianyu.controller.OrdersController[方法名] findAll');
INSERT INTO `syslog` VALUES (85, '2020-02-18 10:39:44', 'xianyu', '0:0:0:0:0:0:0:1', '/orders/findAll', 9, '[类名] cn.xianyu.controller.OrdersController[方法名] findAll');
INSERT INTO `syslog` VALUES (86, '2020-02-18 10:39:45', 'xianyu', '0:0:0:0:0:0:0:1', '/orders/findAll', 38, '[类名] cn.xianyu.controller.OrdersController[方法名] findAll');
INSERT INTO `syslog` VALUES (87, '2020-02-18 10:39:47', 'xianyu', '0:0:0:0:0:0:0:1', '/orders/findAll', 6, '[类名] cn.xianyu.controller.OrdersController[方法名] findAll');
INSERT INTO `syslog` VALUES (88, '2020-02-18 10:39:49', 'xianyu', '0:0:0:0:0:0:0:1', '/product/findAll', 5, '[类名] cn.xianyu.controller.ProductController[方法名] findAll');
INSERT INTO `syslog` VALUES (89, '2020-02-18 10:39:52', 'xianyu', '0:0:0:0:0:0:0:1', '/product/findAll', 5, '[类名] cn.xianyu.controller.ProductController[方法名] findAll');
INSERT INTO `syslog` VALUES (90, '2020-02-18 10:39:52', 'xianyu', '0:0:0:0:0:0:0:1', '/product/findAll', 4, '[类名] cn.xianyu.controller.ProductController[方法名] findAll');
INSERT INTO `syslog` VALUES (91, '2020-02-18 10:39:53', 'xianyu', '0:0:0:0:0:0:0:1', '/product/findAll', 3, '[类名] cn.xianyu.controller.ProductController[方法名] findAll');
INSERT INTO `syslog` VALUES (92, '2020-02-18 10:39:55', 'xianyu', '0:0:0:0:0:0:0:1', '/product/findAll', 2, '[类名] cn.xianyu.controller.ProductController[方法名] findAll');
INSERT INTO `syslog` VALUES (93, '2020-02-18 10:39:57', 'xianyu', '0:0:0:0:0:0:0:1', '/product/findAll', 5, '[类名] cn.xianyu.controller.ProductController[方法名] findAll');
INSERT INTO `syslog` VALUES (94, '2020-02-18 10:39:59', 'xianyu', '0:0:0:0:0:0:0:1', '/orders/findAll', 6, '[类名] cn.xianyu.controller.OrdersController[方法名] findAll');
INSERT INTO `syslog` VALUES (95, '2020-02-18 10:40:01', 'xianyu', '0:0:0:0:0:0:0:1', '/orders/findAll', 8, '[类名] cn.xianyu.controller.OrdersController[方法名] findAll');
INSERT INTO `syslog` VALUES (96, '2020-02-18 10:40:03', 'xianyu', '0:0:0:0:0:0:0:1', '/orders/findAll', 5, '[类名] cn.xianyu.controller.OrdersController[方法名] findAll');
INSERT INTO `syslog` VALUES (97, '2020-02-18 10:40:06', 'xianyu', '0:0:0:0:0:0:0:1', '/orders/findAll', 5, '[类名] cn.xianyu.controller.OrdersController[方法名] findAll');
INSERT INTO `syslog` VALUES (98, '2020-02-18 10:40:08', 'xianyu', '0:0:0:0:0:0:0:1', '/product/findAll', 3, '[类名] cn.xianyu.controller.ProductController[方法名] findAll');
INSERT INTO `syslog` VALUES (99, '2020-02-18 10:40:10', 'xianyu', '0:0:0:0:0:0:0:1', '/product/findAll', 3, '[类名] cn.xianyu.controller.ProductController[方法名] findAll');
INSERT INTO `syslog` VALUES (100, '2020-02-18 10:40:11', 'xianyu', '0:0:0:0:0:0:0:1', '/product/findAll', 5, '[类名] cn.xianyu.controller.ProductController[方法名] findAll');
INSERT INTO `syslog` VALUES (101, '2020-02-18 10:40:14', 'xianyu', '0:0:0:0:0:0:0:1', '/sysLog/findAll', 4, '[类名] cn.xianyu.controller.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES (102, '2020-02-18 10:40:15', 'xianyu', '0:0:0:0:0:0:0:1', '/product/findAll', 4, '[类名] cn.xianyu.controller.ProductController[方法名] findAll');
INSERT INTO `syslog` VALUES (103, '2020-02-18 10:40:18', 'xianyu', '0:0:0:0:0:0:0:1', '/permission/findAll', 4, '[类名] cn.xianyu.controller.PermissionController[方法名] findAll');
INSERT INTO `syslog` VALUES (104, '2020-02-18 10:40:20', 'xianyu', '0:0:0:0:0:0:0:1', '/permission/findAll', 3, '[类名] cn.xianyu.controller.PermissionController[方法名] findAll');
INSERT INTO `syslog` VALUES (105, '2020-02-18 10:40:30', 'xianyu', '0:0:0:0:0:0:0:1', '/role/findAll', 4, '[类名] cn.xianyu.controller.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES (106, '2020-02-18 10:40:32', 'xianyu', '0:0:0:0:0:0:0:1', '/permission/findAll', 3, '[类名] cn.xianyu.controller.PermissionController[方法名] findAll');
INSERT INTO `syslog` VALUES (107, '2020-02-18 10:40:34', 'xianyu', '0:0:0:0:0:0:0:1', '/user/findAll', 3, '[类名] cn.xianyu.controller.UserController[方法名] findAll');
INSERT INTO `syslog` VALUES (108, '2020-02-18 10:40:36', 'xianyu', '0:0:0:0:0:0:0:1', '/user/findAll', 4, '[类名] cn.xianyu.controller.UserController[方法名] findAll');
INSERT INTO `syslog` VALUES (109, '2020-02-18 10:40:38', 'xianyu', '0:0:0:0:0:0:0:1', '/user/findAll', 3, '[类名] cn.xianyu.controller.UserController[方法名] findAll');
INSERT INTO `syslog` VALUES (110, '2020-02-18 10:40:39', 'xianyu', '0:0:0:0:0:0:0:1', '/user/findAll', 7, '[类名] cn.xianyu.controller.UserController[方法名] findAll');
INSERT INTO `syslog` VALUES (111, '2020-02-18 10:40:41', 'xianyu', '0:0:0:0:0:0:0:1', '/user/findAll', 3, '[类名] cn.xianyu.controller.UserController[方法名] findAll');
INSERT INTO `syslog` VALUES (112, '2020-02-18 10:40:43', 'xianyu', '0:0:0:0:0:0:0:1', '/user/findAll', 3, '[类名] cn.xianyu.controller.UserController[方法名] findAll');
INSERT INTO `syslog` VALUES (113, '2020-02-18 10:40:44', 'xianyu', '0:0:0:0:0:0:0:1', '/user/findAll', 3, '[类名] cn.xianyu.controller.UserController[方法名] findAll');
INSERT INTO `syslog` VALUES (114, '2020-02-18 10:40:47', 'xianyu', '0:0:0:0:0:0:0:1', '/role/findAll', 3, '[类名] cn.xianyu.controller.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES (115, '2020-02-18 10:40:49', 'xianyu', '0:0:0:0:0:0:0:1', '/user/findAll', 3, '[类名] cn.xianyu.controller.UserController[方法名] findAll');
INSERT INTO `syslog` VALUES (116, '2020-02-18 10:40:58', 'xianyu', '0:0:0:0:0:0:0:1', '/user/findAll', 5, '[类名] cn.xianyu.controller.UserController[方法名] findAll');
INSERT INTO `syslog` VALUES (117, '2020-02-18 10:40:59', 'xianyu', '0:0:0:0:0:0:0:1', '/user/findAll', 3, '[类名] cn.xianyu.controller.UserController[方法名] findAll');
INSERT INTO `syslog` VALUES (118, '2020-02-18 10:41:00', 'xianyu', '0:0:0:0:0:0:0:1', '/user/findAll', 3, '[类名] cn.xianyu.controller.UserController[方法名] findAll');
INSERT INTO `syslog` VALUES (119, '2020-02-18 10:41:04', 'xianyu', '0:0:0:0:0:0:0:1', '/user/findAll', 3, '[类名] cn.xianyu.controller.UserController[方法名] findAll');
INSERT INTO `syslog` VALUES (120, '2020-02-18 10:41:07', 'xianyu', '0:0:0:0:0:0:0:1', '/user/findAll', 3, '[类名] cn.xianyu.controller.UserController[方法名] findAll');
INSERT INTO `syslog` VALUES (121, '2020-02-18 10:41:09', 'xianyu', '0:0:0:0:0:0:0:1', '/permission/findAll', 3, '[类名] cn.xianyu.controller.PermissionController[方法名] findAll');
INSERT INTO `syslog` VALUES (122, '2020-02-18 10:41:11', 'xianyu', '0:0:0:0:0:0:0:1', '/permission/findAll', 4, '[类名] cn.xianyu.controller.PermissionController[方法名] findAll');
INSERT INTO `syslog` VALUES (123, '2020-02-18 10:41:12', 'xianyu', '0:0:0:0:0:0:0:1', '/permission/findAll', 3, '[类名] cn.xianyu.controller.PermissionController[方法名] findAll');
INSERT INTO `syslog` VALUES (124, '2020-02-18 10:41:23', 'xianyu', '0:0:0:0:0:0:0:1', '/role/findAll', 3, '[类名] cn.xianyu.controller.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES (125, '2020-02-18 10:41:25', 'xianyu', '0:0:0:0:0:0:0:1', '/permission/findAll', 2, '[类名] cn.xianyu.controller.PermissionController[方法名] findAll');
INSERT INTO `syslog` VALUES (126, '2020-02-18 10:42:03', 'xianyu', '0:0:0:0:0:0:0:1', '/permission/findAll', 4, '[类名] cn.xianyu.controller.PermissionController[方法名] findAll');
INSERT INTO `syslog` VALUES (127, '2020-02-18 10:42:06', 'xianyu', '0:0:0:0:0:0:0:1', '/permission/findAll', 3, '[类名] cn.xianyu.controller.PermissionController[方法名] findAll');
INSERT INTO `syslog` VALUES (128, '2020-02-18 10:42:07', 'xianyu', '0:0:0:0:0:0:0:1', '/permission/findAll', 4, '[类名] cn.xianyu.controller.PermissionController[方法名] findAll');
INSERT INTO `syslog` VALUES (129, '2020-02-18 10:42:10', 'xianyu', '0:0:0:0:0:0:0:1', '/permission/findAll', 3, '[类名] cn.xianyu.controller.PermissionController[方法名] findAll');
INSERT INTO `syslog` VALUES (130, '2020-02-18 10:42:53', 'xianyu', '0:0:0:0:0:0:0:1', '/role/findAll', 3, '[类名] cn.xianyu.controller.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES (131, '2020-02-18 10:42:55', 'xianyu', '0:0:0:0:0:0:0:1', '/permission/findAll', 3, '[类名] cn.xianyu.controller.PermissionController[方法名] findAll');
INSERT INTO `syslog` VALUES (132, '2020-02-18 10:59:41', 'xianyu', '0:0:0:0:0:0:0:1', '/role/findAll', 4, '[类名] cn.xianyu.controller.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES (133, '2020-02-18 10:59:43', 'xianyu', '0:0:0:0:0:0:0:1', '/permission/findAll', 3, '[类名] cn.xianyu.controller.PermissionController[方法名] findAll');
INSERT INTO `syslog` VALUES (134, '2020-02-18 10:59:47', 'xianyu', '0:0:0:0:0:0:0:1', '/user/findAll', 6, '[类名] cn.xianyu.controller.UserController[方法名] findAll');
INSERT INTO `syslog` VALUES (135, '2020-02-18 10:59:49', 'xianyu', '0:0:0:0:0:0:0:1', '/role/findAll', 2, '[类名] cn.xianyu.controller.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES (136, '2020-02-18 10:59:53', 'xianyu', '0:0:0:0:0:0:0:1', '/user/findAll', 3, '[类名] cn.xianyu.controller.UserController[方法名] findAll');
INSERT INTO `syslog` VALUES (137, '2020-02-18 11:00:03', 'xianyu', '0:0:0:0:0:0:0:1', '/role/findAll', 3, '[类名] cn.xianyu.controller.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES (138, '2020-02-18 11:00:39', 'xianyu', '0:0:0:0:0:0:0:1', '/user/findAll', 2, '[类名] cn.xianyu.controller.UserController[方法名] findAll');
INSERT INTO `syslog` VALUES (139, '2020-02-18 11:00:42', 'xianyu', '0:0:0:0:0:0:0:1', '/role/findAll', 3, '[类名] cn.xianyu.controller.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES (140, '2020-02-18 11:00:47', 'xianyu', '0:0:0:0:0:0:0:1', '/role/findAll', 3, '[类名] cn.xianyu.controller.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES (141, '2020-02-18 11:00:51', 'xianyu', '0:0:0:0:0:0:0:1', '/role/findAll', 3, '[类名] cn.xianyu.controller.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES (142, '2020-02-18 11:00:53', 'xianyu', '0:0:0:0:0:0:0:1', '/role/findAll', 3, '[类名] cn.xianyu.controller.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES (143, '2020-02-18 11:00:54', 'xianyu', '0:0:0:0:0:0:0:1', '/role/findAll', 2, '[类名] cn.xianyu.controller.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES (144, '2020-02-18 11:00:56', 'xianyu', '0:0:0:0:0:0:0:1', '/role/findAll', 2, '[类名] cn.xianyu.controller.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES (145, '2020-02-18 11:00:57', 'xianyu', '0:0:0:0:0:0:0:1', '/role/findAll', 3, '[类名] cn.xianyu.controller.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES (146, '2020-02-18 11:00:58', 'xianyu', '0:0:0:0:0:0:0:1', '/role/findAll', 3, '[类名] cn.xianyu.controller.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES (147, '2020-02-18 11:01:03', 'xianyu', '0:0:0:0:0:0:0:1', '/user/findAll', 3, '[类名] cn.xianyu.controller.UserController[方法名] findAll');
INSERT INTO `syslog` VALUES (148, '2020-02-18 11:01:05', 'xianyu', '0:0:0:0:0:0:0:1', '/user/findAll', 3, '[类名] cn.xianyu.controller.UserController[方法名] findAll');
INSERT INTO `syslog` VALUES (149, '2020-02-18 11:01:08', 'xianyu', '0:0:0:0:0:0:0:1', '/user/findAll', 3, '[类名] cn.xianyu.controller.UserController[方法名] findAll');
INSERT INTO `syslog` VALUES (150, '2020-02-18 11:01:10', 'xianyu', '0:0:0:0:0:0:0:1', '/user/findAll', 3, '[类名] cn.xianyu.controller.UserController[方法名] findAll');
INSERT INTO `syslog` VALUES (151, '2020-02-18 11:01:13', 'xianyu', '0:0:0:0:0:0:0:1', '/user/findAll', 3, '[类名] cn.xianyu.controller.UserController[方法名] findAll');
INSERT INTO `syslog` VALUES (152, '2020-02-18 11:01:19', 'xianyu', '0:0:0:0:0:0:0:1', '/user/findAll', 3, '[类名] cn.xianyu.controller.UserController[方法名] findAll');
INSERT INTO `syslog` VALUES (153, '2020-02-18 11:01:21', 'xianyu', '0:0:0:0:0:0:0:1', '/user/findAll', 3, '[类名] cn.xianyu.controller.UserController[方法名] findAll');
INSERT INTO `syslog` VALUES (154, '2020-02-18 11:01:22', 'xianyu', '0:0:0:0:0:0:0:1', '/user/findAll', 4, '[类名] cn.xianyu.controller.UserController[方法名] findAll');
INSERT INTO `syslog` VALUES (155, '2020-02-18 11:01:24', 'xianyu', '0:0:0:0:0:0:0:1', '/user/findAll', 3, '[类名] cn.xianyu.controller.UserController[方法名] findAll');
INSERT INTO `syslog` VALUES (156, '2020-02-18 11:01:25', 'xianyu', '0:0:0:0:0:0:0:1', '/user/findAll', 2, '[类名] cn.xianyu.controller.UserController[方法名] findAll');
INSERT INTO `syslog` VALUES (157, '2020-02-18 11:01:25', 'xianyu', '0:0:0:0:0:0:0:1', '/user/findAll', 2, '[类名] cn.xianyu.controller.UserController[方法名] findAll');
INSERT INTO `syslog` VALUES (158, '2020-02-18 11:01:26', 'xianyu', '0:0:0:0:0:0:0:1', '/user/findAll', 2, '[类名] cn.xianyu.controller.UserController[方法名] findAll');
INSERT INTO `syslog` VALUES (159, '2020-02-18 11:01:27', 'xianyu', '0:0:0:0:0:0:0:1', '/user/findAll', 3, '[类名] cn.xianyu.controller.UserController[方法名] findAll');
INSERT INTO `syslog` VALUES (160, '2020-02-18 11:01:28', 'xianyu', '0:0:0:0:0:0:0:1', '/user/findAll', 2, '[类名] cn.xianyu.controller.UserController[方法名] findAll');
INSERT INTO `syslog` VALUES (161, '2020-02-18 11:01:29', 'xianyu', '0:0:0:0:0:0:0:1', '/user/findAll', 3, '[类名] cn.xianyu.controller.UserController[方法名] findAll');
INSERT INTO `syslog` VALUES (162, '2020-02-18 11:01:36', 'xianyu', '0:0:0:0:0:0:0:1', '/user/findAll', 3, '[类名] cn.xianyu.controller.UserController[方法名] findAll');
INSERT INTO `syslog` VALUES (163, '2020-02-18 11:01:40', 'xianyu', '0:0:0:0:0:0:0:1', '/role/findAll', 3, '[类名] cn.xianyu.controller.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES (164, '2020-02-18 11:01:45', 'xianyu', '0:0:0:0:0:0:0:1', '/role/findAll', 2, '[类名] cn.xianyu.controller.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES (165, '2020-02-18 11:01:47', 'xianyu', '0:0:0:0:0:0:0:1', '/role/findAll', 3, '[类名] cn.xianyu.controller.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES (166, '2020-02-18 11:01:49', 'xianyu', '0:0:0:0:0:0:0:1', '/role/findAll', 3, '[类名] cn.xianyu.controller.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES (167, '2020-02-18 11:01:51', 'xianyu', '0:0:0:0:0:0:0:1', '/role/findAll', 3, '[类名] cn.xianyu.controller.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES (168, '2020-02-18 11:02:24', 'xianyu', '0:0:0:0:0:0:0:1', '/role/findAll', 6, '[类名] cn.xianyu.controller.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES (169, '2020-02-18 11:02:28', 'xianyu', '0:0:0:0:0:0:0:1', '/permission/findAll', 3, '[类名] cn.xianyu.controller.PermissionController[方法名] findAll');
INSERT INTO `syslog` VALUES (170, '2020-02-18 11:02:30', 'xianyu', '0:0:0:0:0:0:0:1', '/role/findAll', 71, '[类名] cn.xianyu.controller.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES (171, '2020-02-18 11:02:42', 'xianyu', '0:0:0:0:0:0:0:1', '/user/findAll', 3, '[类名] cn.xianyu.controller.UserController[方法名] findAll');
INSERT INTO `syslog` VALUES (172, '2020-02-18 11:02:44', 'xianyu', '0:0:0:0:0:0:0:1', '/role/findAll', 3, '[类名] cn.xianyu.controller.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES (173, '2020-02-18 11:02:45', 'xianyu', '0:0:0:0:0:0:0:1', '/role/findAll', 3, '[类名] cn.xianyu.controller.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES (174, '2020-02-18 11:02:46', 'xianyu', '0:0:0:0:0:0:0:1', '/role/findAll', 3, '[类名] cn.xianyu.controller.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES (175, '2020-02-18 11:02:49', 'xianyu', '0:0:0:0:0:0:0:1', '/sysLog/findAll', 3, '[类名] cn.xianyu.controller.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES (176, '2020-02-18 11:02:53', 'xianyu', '0:0:0:0:0:0:0:1', '/role/findAll', 3, '[类名] cn.xianyu.controller.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES (177, '2020-02-18 11:02:55', 'xianyu', '0:0:0:0:0:0:0:1', '/permission/findAll', 3, '[类名] cn.xianyu.controller.PermissionController[方法名] findAll');
INSERT INTO `syslog` VALUES (178, '2020-02-18 11:03:03', 'xianyu', '0:0:0:0:0:0:0:1', '/permission/findAll', 3, '[类名] cn.xianyu.controller.PermissionController[方法名] findAll');
INSERT INTO `syslog` VALUES (179, '2020-02-18 11:03:05', 'xianyu', '0:0:0:0:0:0:0:1', '/permission/findAll', 3, '[类名] cn.xianyu.controller.PermissionController[方法名] findAll');
INSERT INTO `syslog` VALUES (180, '2020-02-18 11:03:07', 'xianyu', '0:0:0:0:0:0:0:1', '/sysLog/findAll', 4, '[类名] cn.xianyu.controller.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES (181, '2020-02-18 11:03:10', 'xianyu', '0:0:0:0:0:0:0:1', '/permission/findAll', 3, '[类名] cn.xianyu.controller.PermissionController[方法名] findAll');
INSERT INTO `syslog` VALUES (182, '2020-02-18 11:03:30', 'xianyu', '0:0:0:0:0:0:0:1', '/role/findAll', 20, '[类名] cn.xianyu.controller.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES (183, '2020-02-18 11:03:33', 'xianyu', '0:0:0:0:0:0:0:1', '/role/findAll', 3, '[类名] cn.xianyu.controller.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES (184, '2020-02-18 11:03:36', 'xianyu', '0:0:0:0:0:0:0:1', '/role/findAll', 3, '[类名] cn.xianyu.controller.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES (185, '2020-02-18 11:03:38', 'xianyu', '0:0:0:0:0:0:0:1', '/permission/findAll', 3, '[类名] cn.xianyu.controller.PermissionController[方法名] findAll');
INSERT INTO `syslog` VALUES (186, '2020-02-18 11:08:08', 'xianyu', '0:0:0:0:0:0:0:1', '/user/findAll', 3, '[类名] cn.xianyu.controller.UserController[方法名] findAll');
INSERT INTO `syslog` VALUES (187, '2020-02-18 11:08:12', 'xianyu', '0:0:0:0:0:0:0:1', '/role/findAll', 3, '[类名] cn.xianyu.controller.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES (188, '2020-02-18 11:08:20', 'xianyu', '0:0:0:0:0:0:0:1', '/permission/findAll', 3, '[类名] cn.xianyu.controller.PermissionController[方法名] findAll');
INSERT INTO `syslog` VALUES (189, '2020-02-18 11:08:23', 'xianyu', '0:0:0:0:0:0:0:1', '/role/findAll', 3, '[类名] cn.xianyu.controller.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES (190, '2020-02-18 11:10:34', 'xianyu', '0:0:0:0:0:0:0:1', '/user/findAll', 3, '[类名] cn.xianyu.controller.UserController[方法名] findAll');
INSERT INTO `syslog` VALUES (191, '2020-02-18 11:10:36', 'xianyu', '0:0:0:0:0:0:0:1', '/sysLog/findAll', 3, '[类名] cn.xianyu.controller.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES (192, '2020-02-18 11:10:42', 'xianyu', '0:0:0:0:0:0:0:1', '/user/findAll', 2, '[类名] cn.xianyu.controller.UserController[方法名] findAll');
INSERT INTO `syslog` VALUES (193, '2020-02-18 11:10:48', 'xianyu', '0:0:0:0:0:0:0:1', '/permission/findAll', 2, '[类名] cn.xianyu.controller.PermissionController[方法名] findAll');
INSERT INTO `syslog` VALUES (194, '2020-02-18 11:10:51', 'xianyu', '0:0:0:0:0:0:0:1', '/sysLog/findAll', 4, '[类名] cn.xianyu.controller.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES (195, '2020-02-18 11:11:18', 'xianyu', '0:0:0:0:0:0:0:1', '/permission/findAll', 3, '[类名] cn.xianyu.controller.PermissionController[方法名] findAll');
INSERT INTO `syslog` VALUES (196, '2020-02-18 11:11:20', 'xianyu', '0:0:0:0:0:0:0:1', '/role/findAll', 3, '[类名] cn.xianyu.controller.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES (197, '2020-02-18 11:11:22', 'xianyu', '0:0:0:0:0:0:0:1', '/sysLog/findAll', 3, '[类名] cn.xianyu.controller.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES (198, '2020-02-18 11:12:00', 'xianyu', '0:0:0:0:0:0:0:1', '/sysLog/findAll', 3, '[类名] cn.xianyu.controller.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES (199, '2020-02-18 11:12:01', 'xianyu', '0:0:0:0:0:0:0:1', '/sysLog/findAll', 2, '[类名] cn.xianyu.controller.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES (200, '2020-02-18 11:12:18', 'xianyu', '0:0:0:0:0:0:0:1', '/sysLog/findAll', 3, '[类名] cn.xianyu.controller.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES (201, '2020-02-18 11:12:22', 'xianyu', '0:0:0:0:0:0:0:1', '/sysLog/findAll', 3, '[类名] cn.xianyu.controller.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES (202, '2020-02-18 11:38:38', 'xianyu', '0:0:0:0:0:0:0:1', '/sysLog/findAll', 13, '[类名] cn.xianyu.controller.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES (203, '2020-02-18 11:39:03', 'xianyu', '0:0:0:0:0:0:0:1', '/role/findAll', 4, '[类名] cn.xianyu.controller.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES (204, '2020-02-18 11:39:07', 'xianyu', '0:0:0:0:0:0:0:1', '/user/findAll', 4, '[类名] cn.xianyu.controller.UserController[方法名] findAll');
INSERT INTO `syslog` VALUES (205, '2020-02-18 11:39:12', 'xianyu', '0:0:0:0:0:0:0:1', '/role/findAll', 3, '[类名] cn.xianyu.controller.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES (206, '2020-02-18 11:39:15', 'xianyu', '0:0:0:0:0:0:0:1', '/permission/findAll', 3, '[类名] cn.xianyu.controller.PermissionController[方法名] findAll');
INSERT INTO `syslog` VALUES (207, '2020-02-18 11:39:18', 'xianyu', '0:0:0:0:0:0:0:1', '/sysLog/findAll', 7, '[类名] cn.xianyu.controller.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES (208, '2020-02-18 11:39:34', 'xianyu', '0:0:0:0:0:0:0:1', '/product/findAll', 8, '[类名] cn.xianyu.controller.ProductController[方法名] findAll');
INSERT INTO `syslog` VALUES (209, '2020-02-18 11:39:37', 'xianyu', '0:0:0:0:0:0:0:1', '/product/findAll', 5, '[类名] cn.xianyu.controller.ProductController[方法名] findAll');
INSERT INTO `syslog` VALUES (210, '2020-02-18 11:39:39', 'xianyu', '0:0:0:0:0:0:0:1', '/product/findAll', 4, '[类名] cn.xianyu.controller.ProductController[方法名] findAll');
INSERT INTO `syslog` VALUES (211, '2020-02-18 11:39:45', 'xianyu', '0:0:0:0:0:0:0:1', '/orders/findAll', 8, '[类名] cn.xianyu.controller.OrdersController[方法名] findAll');
INSERT INTO `syslog` VALUES (212, '2020-02-18 11:39:47', 'xianyu', '0:0:0:0:0:0:0:1', '/orders/findAll', 4, '[类名] cn.xianyu.controller.OrdersController[方法名] findAll');
INSERT INTO `syslog` VALUES (213, '2020-02-18 11:39:50', 'xianyu', '0:0:0:0:0:0:0:1', '/orders/findAll', 5, '[类名] cn.xianyu.controller.OrdersController[方法名] findAll');
INSERT INTO `syslog` VALUES (214, '2020-02-18 11:39:52', 'xianyu', '0:0:0:0:0:0:0:1', '/orders/findAll', 6, '[类名] cn.xianyu.controller.OrdersController[方法名] findAll');
INSERT INTO `syslog` VALUES (215, '2020-02-18 11:39:53', 'xianyu', '0:0:0:0:0:0:0:1', '/orders/findAll', 4, '[类名] cn.xianyu.controller.OrdersController[方法名] findAll');
INSERT INTO `syslog` VALUES (216, '2020-02-18 11:39:54', 'xianyu', '0:0:0:0:0:0:0:1', '/orders/findAll', 4, '[类名] cn.xianyu.controller.OrdersController[方法名] findAll');
INSERT INTO `syslog` VALUES (217, '2020-02-18 11:39:58', 'xianyu', '0:0:0:0:0:0:0:1', '/orders/findAll', 9, '[类名] cn.xianyu.controller.OrdersController[方法名] findAll');

-- ----------------------------
-- Table structure for traveller
-- ----------------------------
DROP TABLE IF EXISTS `traveller`;
CREATE TABLE `traveller`  (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sex` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phoneNum` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `credentialsType` int(11) NULL DEFAULT NULL,
  `credentialsNum` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `travellerType` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of traveller
-- ----------------------------
INSERT INTO `traveller` VALUES (1, '张龙', '男', '13333333333', 0, '123456789009876543', 0);
INSERT INTO `traveller` VALUES (2, '张小龙', '男', '15555555555', 1, '987654321123456789', 1);
INSERT INTO `traveller` VALUES (3, '张大龙', '女', '14444444444', 2, '456453245345345345', 2);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PASSWORD` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phoneNum` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `STATUS` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, '1738099872@qq.com', 'xianyu', '$2a$10$LPTcZ73yPApUIeltpFezz.yS8sUyoBlmo1W7OwZ1UR/BtYTsNFsZS', '17606396598', 1);
INSERT INTO `users` VALUES (2, '18678405330@163.com', 'zhizun', '$2a$10$lgQnBspcgUcFREW5I1UycuWa.E97wZcFYhkiyYbv9ezET4E70tkgG', '18678405330', 0);
INSERT INTO `users` VALUES (3, 'zhongyi233@hotmail.com', '仲毅', '$2a$10$qC1TjB0QrDNojpIjewVayeXDOfQR9TlttGlme8cyGAX23Yj9ccCZC', '110', 1);
INSERT INTO `users` VALUES (4, 'zhongyi@zy.com', 'zhongyi', '$2a$10$S6cD.q20rS/bhSMIl5jD5OwApLaSuclu.9UGWLuPm/aeF2latIAHu', '120', 0);
INSERT INTO `users` VALUES (5, 'xianyuzhizun@gmail.com', '咸鱼至尊', '$2a$10$amTNtrYTNBgnxi/xp7mmLeBmdzLKi8cq8U06Y3IqEqlkxLU0Ey.KK', '119', 1);
INSERT INTO `users` VALUES (6, '17606396598@163.com', 'xianyuzhizun', '$2a$10$sx0eX/y/.z.vHMotoWt..e3ZmeX34tDivaFJurt/odfIGedT20iHC', '100', 0);

-- ----------------------------
-- Table structure for users_role
-- ----------------------------
DROP TABLE IF EXISTS `users_role`;
CREATE TABLE `users_role`  (
  `userId` int(11) NULL DEFAULT NULL,
  `roleId` int(11) NULL DEFAULT NULL,
  INDEX `userId`(`userId`) USING BTREE,
  INDEX `rolesId`(`roleId`) USING BTREE,
  CONSTRAINT `rolesId` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `userId` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users_role
-- ----------------------------
INSERT INTO `users_role` VALUES (1, 1);
INSERT INTO `users_role` VALUES (2, 1);
INSERT INTO `users_role` VALUES (3, 2);
INSERT INTO `users_role` VALUES (4, 2);
INSERT INTO `users_role` VALUES (5, 3);
INSERT INTO `users_role` VALUES (6, 3);

SET FOREIGN_KEY_CHECKS = 1;
