/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50717
 Source Host           : localhost:3306
 Source Schema         : cloudall

 Target Server Type    : MySQL
 Target Server Version : 50717
 File Encoding         : 65001

 Date: 05/08/2020 16:27:11
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单编号',
  `menu_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单名称',
  `router` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '路由',
  `imgsrc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标地址',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `MENU_UNIQUE`(`menu_code`) USING BTREE COMMENT 'menu唯一'
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES (1, '1000', '总菜单', NULL, NULL);
INSERT INTO `menu` VALUES (9, '10000001', '基础信息', '', 'el-icon-user-solid');
INSERT INTO `menu` VALUES (10, '100000010001', '区域管理', '/RegionIndex', '');
INSERT INTO `menu` VALUES (11, '100000010002', '用户管理', '/UserIndex', '');
INSERT INTO `menu` VALUES (12, '100000010003', '角色管理', '/RoleIndex', '');
INSERT INTO `menu` VALUES (13, '100000010004', '系统日志', '', '');
INSERT INTO `menu` VALUES (14, '10000002', '原始数据', '', 'el-icon-coin');
INSERT INTO `menu` VALUES (15, '100000020001', '工业源', '/Industrials', '');
INSERT INTO `menu` VALUES (16, '100000020002', '生活源', '/LifesourceIndex', '');
INSERT INTO `menu` VALUES (17, '10000003', '数据统计', '', 'el-icon-tickets');
INSERT INTO `menu` VALUES (18, '100000010005', '菜单管理', '/MenuIndex', '');
INSERT INTO `menu` VALUES (22, '10000004', '测试菜单', '/TEST', 'el-icon-s-goods');
INSERT INTO `menu` VALUES (23, '100000020003', '餐饮业', '/CateringIndex', '');
INSERT INTO `menu` VALUES (25, '100000020004', '汽修业', '/RepairindustryIndex', '');
INSERT INTO `menu` VALUES (26, '100000020005', '医疗业', '/MedicalprofessionIndex', '');
INSERT INTO `menu` VALUES (27, '100000020006', '移动源', '/MobilesourceIndex', '');
INSERT INTO `menu` VALUES (28, '100000010006', 'Excel字段', '/ExcelFieldIndex', '');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '描述',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `nameunique`(`name`) USING BTREE COMMENT 'role name唯一'
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, 'ROLE_ADMIN', '超级管理员');
INSERT INTO `role` VALUES (2, 'ROLE_TEST', '测试用户');
INSERT INTO `role` VALUES (6, 'ROLE_OR', '普通用户');
INSERT INTO `role` VALUES (7, 'ROLE_OR1', '普通用户');
INSERT INTO `role` VALUES (8, 'ROLE_OR2', '普通用户12');
INSERT INTO `role` VALUES (9, 'ROLE_OR3', '普通用户');
INSERT INTO `role` VALUES (10, 'ROLE_OR4', '普通用户');
INSERT INTO `role` VALUES (11, 'ROLE_OR5', '普通用户');
INSERT INTO `role` VALUES (12, 'ROLE_OR6', '普通用户');
INSERT INTO `role` VALUES (13, 'ROLE_OR7', '普通用户');
INSERT INTO `role` VALUES (14, 'ROLE_OR8', '普通用户');
INSERT INTO `role` VALUES (15, 'ROLE_OR9', '普通用户');
INSERT INTO `role` VALUES (16, 'ROLE_OR10', '普通用户');
INSERT INTO `role` VALUES (17, 'ROLE_OR11', '普通用户');
INSERT INTO `role` VALUES (18, 'ROLE_OR12', '普通用户');
INSERT INTO `role` VALUES (25, 'ROLE_RO14', 'DWA');
INSERT INTO `role` VALUES (27, 'ROLE_OR21', '普通用户');

-- ----------------------------
-- Table structure for role_menu
-- ----------------------------
DROP TABLE IF EXISTS `role_menu`;
CREATE TABLE `role_menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `r_id` int(11) NULL DEFAULT NULL,
  `m_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 196 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role_menu
-- ----------------------------
INSERT INTO `role_menu` VALUES (179, 1, 1);
INSERT INTO `role_menu` VALUES (180, 1, 9);
INSERT INTO `role_menu` VALUES (181, 1, 10);
INSERT INTO `role_menu` VALUES (182, 1, 11);
INSERT INTO `role_menu` VALUES (183, 1, 12);
INSERT INTO `role_menu` VALUES (184, 1, 13);
INSERT INTO `role_menu` VALUES (185, 1, 18);
INSERT INTO `role_menu` VALUES (186, 1, 28);
INSERT INTO `role_menu` VALUES (187, 1, 14);
INSERT INTO `role_menu` VALUES (188, 1, 15);
INSERT INTO `role_menu` VALUES (189, 1, 16);
INSERT INTO `role_menu` VALUES (190, 1, 23);
INSERT INTO `role_menu` VALUES (191, 1, 25);
INSERT INTO `role_menu` VALUES (192, 1, 26);
INSERT INTO `role_menu` VALUES (193, 1, 27);
INSERT INTO `role_menu` VALUES (194, 1, 17);
INSERT INTO `role_menu` VALUES (195, 1, 22);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `iphone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `organization_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `organization_num` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `savetime` datetime(6) NULL DEFAULT NULL,
  `sex` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '1', '1', '1', '123456', '2020-05-28 13:42:15.000000', '1', 'admin');
INSERT INTO `user` VALUES (2, '1', '1', '1', '123456', '2020-05-28 13:42:15.000000', '1', 'test');
INSERT INTO `user` VALUES (3, '1234', '111', '111', '123456', '2020-06-12 19:33:30.594000', '1', 'test2');
INSERT INTO `user` VALUES (13, '123', '', NULL, '123456', '2020-06-15 14:34:39.688000', '2', 'test3');
INSERT INTO `user` VALUES (37, '1111', NULL, NULL, '123456', '2020-06-15 18:05:06.766000', '2', 'test4');

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `u_id` int(11) NULL DEFAULT NULL,
  `r_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES (1, 1, 1);
INSERT INTO `user_role` VALUES (3, 2, 1);
INSERT INTO `user_role` VALUES (6, 13, 1);
INSERT INTO `user_role` VALUES (7, 3, 1);
INSERT INTO `user_role` VALUES (8, 37, 2);

SET FOREIGN_KEY_CHECKS = 1;
