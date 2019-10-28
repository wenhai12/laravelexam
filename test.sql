/*
 Navicat MySQL Data Transfer

 Source Server         : vagrant
 Source Server Type    : MySQL
 Source Server Version : 50727
 Source Host           : localhost:3306
 Source Schema         : test

 Target Server Type    : MySQL
 Target Server Version : 50727
 File Encoding         : 65001

 Date: 28/10/2019 15:02:14
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin_menu
-- ----------------------------
DROP TABLE IF EXISTS `admin_menu`;
CREATE TABLE `admin_menu`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `order` int(11) NOT NULL DEFAULT 0,
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `uri` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `permission` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_menu
-- ----------------------------
INSERT INTO `admin_menu` VALUES (1, 0, 1, '首页', 'fa-bar-chart', '/', NULL, NULL, '2019-10-28 14:44:24');
INSERT INTO `admin_menu` VALUES (2, 0, 2, '管理员', 'fa-tasks', NULL, NULL, NULL, '2019-10-28 14:44:48');
INSERT INTO `admin_menu` VALUES (3, 2, 3, '成员', 'fa-users', 'auth/users', NULL, NULL, '2019-10-28 14:44:33');
INSERT INTO `admin_menu` VALUES (4, 2, 4, '角色', 'fa-user', 'auth/roles', NULL, NULL, '2019-10-28 14:44:58');
INSERT INTO `admin_menu` VALUES (5, 2, 5, '权限', 'fa-ban', 'auth/permissions', NULL, NULL, '2019-10-28 14:45:07');
INSERT INTO `admin_menu` VALUES (6, 2, 6, '菜单', 'fa-bars', 'auth/menu', NULL, NULL, '2019-10-28 14:45:15');
INSERT INTO `admin_menu` VALUES (7, 2, 7, '操作日志', 'fa-history', 'auth/logs', NULL, NULL, '2019-10-28 14:45:26');
INSERT INTO `admin_menu` VALUES (8, 0, 0, '用户', 'fa-child', '/users', NULL, '2019-10-28 14:45:58', '2019-10-28 14:45:58');
INSERT INTO `admin_menu` VALUES (9, 0, 0, '科目', 'fa-files-o', '/project', NULL, '2019-10-28 14:47:50', '2019-10-28 14:47:50');
INSERT INTO `admin_menu` VALUES (10, 0, 0, '试题', 'fa-info', NULL, NULL, '2019-10-28 14:48:52', '2019-10-28 14:48:52');
INSERT INTO `admin_menu` VALUES (11, 10, 0, '选择题', 'fa-bullseye', 'selects', NULL, '2019-10-28 14:49:25', '2019-10-28 14:49:41');

-- ----------------------------
-- Table structure for admin_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `admin_operation_log`;
CREATE TABLE `admin_operation_log`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `input` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `admin_operation_log_user_id_index`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 52 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_operation_log
-- ----------------------------
INSERT INTO `admin_operation_log` VALUES (1, 1, 'admin', 'GET', '192.168.10.1', '[]', '2019-10-28 14:42:02', '2019-10-28 14:42:02');
INSERT INTO `admin_operation_log` VALUES (2, 1, 'admin', 'GET', '192.168.10.1', '[]', '2019-10-28 14:42:12', '2019-10-28 14:42:12');
INSERT INTO `admin_operation_log` VALUES (3, 1, 'admin', 'GET', '192.168.10.1', '[]', '2019-10-28 14:42:14', '2019-10-28 14:42:14');
INSERT INTO `admin_operation_log` VALUES (4, 1, 'admin', 'GET', '192.168.10.1', '[]', '2019-10-28 14:42:16', '2019-10-28 14:42:16');
INSERT INTO `admin_operation_log` VALUES (5, 1, 'admin', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-10-28 14:43:34', '2019-10-28 14:43:34');
INSERT INTO `admin_operation_log` VALUES (6, 1, 'admin/users', 'GET', '192.168.10.1', '[]', '2019-10-28 14:43:47', '2019-10-28 14:43:47');
INSERT INTO `admin_operation_log` VALUES (7, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-10-28 14:44:08', '2019-10-28 14:44:08');
INSERT INTO `admin_operation_log` VALUES (8, 1, 'admin/auth/menu/1/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-10-28 14:44:17', '2019-10-28 14:44:17');
INSERT INTO `admin_operation_log` VALUES (9, 1, 'admin/auth/menu/1', 'PUT', '192.168.10.1', '{\"parent_id\":\"0\",\"title\":\"\\u9996\\u9875\",\"icon\":\"fa-bar-chart\",\"uri\":\"\\/\",\"roles\":[null],\"permission\":null,\"_token\":\"Fvebsp8IHaZ02myvAaeKWAyevFBXNVpILErLHhpa\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/test.com\\/admin\\/auth\\/menu\"}', '2019-10-28 14:44:23', '2019-10-28 14:44:23');
INSERT INTO `admin_operation_log` VALUES (10, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2019-10-28 14:44:24', '2019-10-28 14:44:24');
INSERT INTO `admin_operation_log` VALUES (11, 1, 'admin/auth/menu/3/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-10-28 14:44:28', '2019-10-28 14:44:28');
INSERT INTO `admin_operation_log` VALUES (12, 1, 'admin/auth/menu/3', 'PUT', '192.168.10.1', '{\"parent_id\":\"2\",\"title\":\"\\u6210\\u5458\",\"icon\":\"fa-users\",\"uri\":\"auth\\/users\",\"roles\":[null],\"permission\":null,\"_token\":\"Fvebsp8IHaZ02myvAaeKWAyevFBXNVpILErLHhpa\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/test.com\\/admin\\/auth\\/menu\"}', '2019-10-28 14:44:33', '2019-10-28 14:44:33');
INSERT INTO `admin_operation_log` VALUES (13, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2019-10-28 14:44:34', '2019-10-28 14:44:34');
INSERT INTO `admin_operation_log` VALUES (14, 1, 'admin/auth/menu/3/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-10-28 14:44:37', '2019-10-28 14:44:37');
INSERT INTO `admin_operation_log` VALUES (15, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-10-28 14:44:39', '2019-10-28 14:44:39');
INSERT INTO `admin_operation_log` VALUES (16, 1, 'admin/auth/menu/2/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-10-28 14:44:42', '2019-10-28 14:44:42');
INSERT INTO `admin_operation_log` VALUES (17, 1, 'admin/auth/menu/2', 'PUT', '192.168.10.1', '{\"parent_id\":\"0\",\"title\":\"\\u7ba1\\u7406\\u5458\",\"icon\":\"fa-tasks\",\"uri\":null,\"roles\":[\"1\",null],\"permission\":null,\"_token\":\"Fvebsp8IHaZ02myvAaeKWAyevFBXNVpILErLHhpa\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/test.com\\/admin\\/auth\\/menu\"}', '2019-10-28 14:44:48', '2019-10-28 14:44:48');
INSERT INTO `admin_operation_log` VALUES (18, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2019-10-28 14:44:49', '2019-10-28 14:44:49');
INSERT INTO `admin_operation_log` VALUES (19, 1, 'admin/auth/menu/4/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-10-28 14:44:53', '2019-10-28 14:44:53');
INSERT INTO `admin_operation_log` VALUES (20, 1, 'admin/auth/menu/4', 'PUT', '192.168.10.1', '{\"parent_id\":\"2\",\"title\":\"\\u89d2\\u8272\",\"icon\":\"fa-user\",\"uri\":\"auth\\/roles\",\"roles\":[null],\"permission\":null,\"_token\":\"Fvebsp8IHaZ02myvAaeKWAyevFBXNVpILErLHhpa\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/test.com\\/admin\\/auth\\/menu\"}', '2019-10-28 14:44:58', '2019-10-28 14:44:58');
INSERT INTO `admin_operation_log` VALUES (21, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2019-10-28 14:44:59', '2019-10-28 14:44:59');
INSERT INTO `admin_operation_log` VALUES (22, 1, 'admin/auth/menu/5/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-10-28 14:45:02', '2019-10-28 14:45:02');
INSERT INTO `admin_operation_log` VALUES (23, 1, 'admin/auth/menu/5', 'PUT', '192.168.10.1', '{\"parent_id\":\"2\",\"title\":\"\\u6743\\u9650\",\"icon\":\"fa-ban\",\"uri\":\"auth\\/permissions\",\"roles\":[null],\"permission\":null,\"_token\":\"Fvebsp8IHaZ02myvAaeKWAyevFBXNVpILErLHhpa\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/test.com\\/admin\\/auth\\/menu\"}', '2019-10-28 14:45:06', '2019-10-28 14:45:06');
INSERT INTO `admin_operation_log` VALUES (24, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2019-10-28 14:45:07', '2019-10-28 14:45:07');
INSERT INTO `admin_operation_log` VALUES (25, 1, 'admin/auth/menu/6/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-10-28 14:45:10', '2019-10-28 14:45:10');
INSERT INTO `admin_operation_log` VALUES (26, 1, 'admin/auth/menu/6', 'PUT', '192.168.10.1', '{\"parent_id\":\"2\",\"title\":\"\\u83dc\\u5355\",\"icon\":\"fa-bars\",\"uri\":\"auth\\/menu\",\"roles\":[null],\"permission\":null,\"_token\":\"Fvebsp8IHaZ02myvAaeKWAyevFBXNVpILErLHhpa\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/test.com\\/admin\\/auth\\/menu\"}', '2019-10-28 14:45:15', '2019-10-28 14:45:15');
INSERT INTO `admin_operation_log` VALUES (27, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2019-10-28 14:45:15', '2019-10-28 14:45:15');
INSERT INTO `admin_operation_log` VALUES (28, 1, 'admin/auth/menu/7/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-10-28 14:45:18', '2019-10-28 14:45:18');
INSERT INTO `admin_operation_log` VALUES (29, 1, 'admin/auth/menu/7', 'PUT', '192.168.10.1', '{\"parent_id\":\"2\",\"title\":\"\\u64cd\\u4f5c\\u65e5\\u5fd7\",\"icon\":\"fa-history\",\"uri\":\"auth\\/logs\",\"roles\":[null],\"permission\":null,\"_token\":\"Fvebsp8IHaZ02myvAaeKWAyevFBXNVpILErLHhpa\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/test.com\\/admin\\/auth\\/menu\"}', '2019-10-28 14:45:26', '2019-10-28 14:45:26');
INSERT INTO `admin_operation_log` VALUES (30, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2019-10-28 14:45:27', '2019-10-28 14:45:27');
INSERT INTO `admin_operation_log` VALUES (31, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2019-10-28 14:45:30', '2019-10-28 14:45:30');
INSERT INTO `admin_operation_log` VALUES (32, 1, 'admin/auth/menu', 'POST', '192.168.10.1', '{\"parent_id\":\"0\",\"title\":\"\\u7528\\u6237\",\"icon\":\"fa-child\",\"uri\":\"\\/users\",\"roles\":[null],\"permission\":null,\"_token\":\"Fvebsp8IHaZ02myvAaeKWAyevFBXNVpILErLHhpa\"}', '2019-10-28 14:45:58', '2019-10-28 14:45:58');
INSERT INTO `admin_operation_log` VALUES (33, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2019-10-28 14:45:59', '2019-10-28 14:45:59');
INSERT INTO `admin_operation_log` VALUES (34, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2019-10-28 14:46:02', '2019-10-28 14:46:02');
INSERT INTO `admin_operation_log` VALUES (35, 1, 'admin/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-10-28 14:46:05', '2019-10-28 14:46:05');
INSERT INTO `admin_operation_log` VALUES (36, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-10-28 14:46:11', '2019-10-28 14:46:11');
INSERT INTO `admin_operation_log` VALUES (37, 1, 'admin/project', 'GET', '192.168.10.1', '[]', '2019-10-28 14:46:30', '2019-10-28 14:46:30');
INSERT INTO `admin_operation_log` VALUES (38, 1, 'admin/auth/menu', 'POST', '192.168.10.1', '{\"parent_id\":\"0\",\"title\":\"\\u79d1\\u76ee\",\"icon\":\"fa-files-o\",\"uri\":\"\\/project\",\"roles\":[null],\"permission\":null,\"_token\":\"Fvebsp8IHaZ02myvAaeKWAyevFBXNVpILErLHhpa\"}', '2019-10-28 14:47:50', '2019-10-28 14:47:50');
INSERT INTO `admin_operation_log` VALUES (39, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2019-10-28 14:47:51', '2019-10-28 14:47:51');
INSERT INTO `admin_operation_log` VALUES (40, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2019-10-28 14:47:53', '2019-10-28 14:47:53');
INSERT INTO `admin_operation_log` VALUES (41, 1, 'admin/project', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-10-28 14:47:55', '2019-10-28 14:47:55');
INSERT INTO `admin_operation_log` VALUES (42, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-10-28 14:47:58', '2019-10-28 14:47:58');
INSERT INTO `admin_operation_log` VALUES (43, 1, 'admin/auth/menu', 'POST', '192.168.10.1', '{\"parent_id\":\"0\",\"title\":\"\\u8bd5\\u9898\",\"icon\":\"fa-info\",\"uri\":null,\"roles\":[null],\"permission\":null,\"_token\":\"Fvebsp8IHaZ02myvAaeKWAyevFBXNVpILErLHhpa\"}', '2019-10-28 14:48:51', '2019-10-28 14:48:51');
INSERT INTO `admin_operation_log` VALUES (44, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2019-10-28 14:48:52', '2019-10-28 14:48:52');
INSERT INTO `admin_operation_log` VALUES (45, 1, 'admin/auth/menu', 'POST', '192.168.10.1', '{\"parent_id\":\"10\",\"title\":\"\\u9009\\u62e9\\u9898\",\"icon\":\"fa-bullseye\",\"uri\":null,\"roles\":[null],\"permission\":null,\"_token\":\"Fvebsp8IHaZ02myvAaeKWAyevFBXNVpILErLHhpa\"}', '2019-10-28 14:49:25', '2019-10-28 14:49:25');
INSERT INTO `admin_operation_log` VALUES (46, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2019-10-28 14:49:26', '2019-10-28 14:49:26');
INSERT INTO `admin_operation_log` VALUES (47, 1, 'admin/auth/menu/11/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-10-28 14:49:29', '2019-10-28 14:49:29');
INSERT INTO `admin_operation_log` VALUES (48, 1, 'admin/auth/menu/11', 'PUT', '192.168.10.1', '{\"parent_id\":\"10\",\"title\":\"\\u9009\\u62e9\\u9898\",\"icon\":\"fa-bullseye\",\"uri\":\"selects\",\"roles\":[null],\"permission\":null,\"_token\":\"Fvebsp8IHaZ02myvAaeKWAyevFBXNVpILErLHhpa\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/test.com\\/admin\\/auth\\/menu\"}', '2019-10-28 14:49:41', '2019-10-28 14:49:41');
INSERT INTO `admin_operation_log` VALUES (49, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2019-10-28 14:49:42', '2019-10-28 14:49:42');
INSERT INTO `admin_operation_log` VALUES (50, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2019-10-28 14:49:44', '2019-10-28 14:49:44');
INSERT INTO `admin_operation_log` VALUES (51, 1, 'admin/selects', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-10-28 14:49:48', '2019-10-28 14:49:48');

-- ----------------------------
-- Table structure for admin_permissions
-- ----------------------------
DROP TABLE IF EXISTS `admin_permissions`;
CREATE TABLE `admin_permissions`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `http_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `http_path` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `admin_permissions_name_unique`(`name`) USING BTREE,
  UNIQUE INDEX `admin_permissions_slug_unique`(`slug`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_permissions
-- ----------------------------
INSERT INTO `admin_permissions` VALUES (1, 'All permission', '*', '', '*', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (2, 'Dashboard', 'dashboard', 'GET', '/', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (3, 'Login', 'auth.login', '', '/auth/login\r\n/auth/logout', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (4, 'User setting', 'auth.setting', 'GET,PUT', '/auth/setting', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (5, 'Auth management', 'auth.management', '', '/auth/roles\r\n/auth/permissions\r\n/auth/menu\r\n/auth/logs', NULL, NULL);

-- ----------------------------
-- Table structure for admin_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_menu`;
CREATE TABLE `admin_role_menu`  (
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `admin_role_menu_role_id_menu_id_index`(`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_role_menu
-- ----------------------------
INSERT INTO `admin_role_menu` VALUES (1, 2, NULL, NULL);

-- ----------------------------
-- Table structure for admin_role_permissions
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_permissions`;
CREATE TABLE `admin_role_permissions`  (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `admin_role_permissions_role_id_permission_id_index`(`role_id`, `permission_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_role_permissions
-- ----------------------------
INSERT INTO `admin_role_permissions` VALUES (1, 1, NULL, NULL);

-- ----------------------------
-- Table structure for admin_role_users
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_users`;
CREATE TABLE `admin_role_users`  (
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `admin_role_users_role_id_user_id_index`(`role_id`, `user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_role_users
-- ----------------------------
INSERT INTO `admin_role_users` VALUES (1, 1, NULL, NULL);

-- ----------------------------
-- Table structure for admin_roles
-- ----------------------------
DROP TABLE IF EXISTS `admin_roles`;
CREATE TABLE `admin_roles`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `admin_roles_name_unique`(`name`) USING BTREE,
  UNIQUE INDEX `admin_roles_slug_unique`(`slug`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_roles
-- ----------------------------
INSERT INTO `admin_roles` VALUES (1, 'Administrator', 'administrator', '2019-10-28 14:41:40', '2019-10-28 14:41:40');

-- ----------------------------
-- Table structure for admin_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `admin_user_permissions`;
CREATE TABLE `admin_user_permissions`  (
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `admin_user_permissions_user_id_permission_id_index`(`user_id`, `permission_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for admin_users
-- ----------------------------
DROP TABLE IF EXISTS `admin_users`;
CREATE TABLE `admin_users`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `admin_users_username_unique`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_users
-- ----------------------------
INSERT INTO `admin_users` VALUES (1, 'admin', '$2y$10$FVmN6ac9cCPqLFRx4pf.VOjoHuJ5vobJGjIPH8VA2Z/VZuGgcaDNe', 'Administrator', NULL, 'RY2lwYivagGcQnqSY5QgdXJrAcCsEmMv0YW0x5Tfjo11PoAcnJPjfnuEMJUB', '2019-10-28 14:41:40', '2019-10-28 14:41:40');

-- ----------------------------
-- Table structure for answers
-- ----------------------------
DROP TABLE IF EXISTS `answers`;
CREATE TABLE `answers`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `project_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `answers_project_id_foreign`(`project_id`) USING BTREE,
  CONSTRAINT `answers_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for blanks
-- ----------------------------
DROP TABLE IF EXISTS `blanks`;
CREATE TABLE `blanks`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` multilinestring NOT NULL,
  `answer` multilinestring NOT NULL,
  `project_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `blanks_project_id_foreign`(`project_id`) USING BTREE,
  CONSTRAINT `blanks_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (2, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` VALUES (3, '2016_01_04_173148_create_admin_tables', 1);
INSERT INTO `migrations` VALUES (4, '2019_10_22_160346_create_projects_table', 1);
INSERT INTO `migrations` VALUES (5, '2019_10_22_162014_create_blanks_table', 1);
INSERT INTO `migrations` VALUES (6, '2019_10_22_162044_create_answers_table', 1);
INSERT INTO `migrations` VALUES (7, '2019_10_22_182066_create_selects_table', 1);

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets`  (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `password_resets_email_index`(`email`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for projects
-- ----------------------------
DROP TABLE IF EXISTS `projects`;
CREATE TABLE `projects`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for selects
-- ----------------------------
DROP TABLE IF EXISTS `selects`;
CREATE TABLE `selects`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `optionA` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `optionB` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `optionC` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `optionD` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `project_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `selects_title_unique`(`title`) USING BTREE,
  INDEX `selects_project_id_foreign`(`project_id`) USING BTREE,
  CONSTRAINT `selects_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp(0) NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
