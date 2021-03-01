/*
 Navicat Premium Data Transfer

 Source Server         : MySQL5.7.29-centos7
 Source Server Type    : MySQL
 Source Server Version : 50729
 Source Host           : 192.168.152.100:3306
 Source Schema         : fjl

 Target Server Type    : MySQL
 Target Server Version : 50729
 File Encoding         : 65001

 Date: 08/02/2021 15:43:57
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_course
-- ----------------------------
DROP TABLE IF EXISTS `t_course`;
CREATE TABLE `t_course`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '课程ID',
  `type` int(1) NOT NULL DEFAULT 1 COMMENT '课程类型',
  `name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '课程名称',
  `teaId` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '开课老师ID',
  `credit` int(2) NOT NULL DEFAULT 1 COMMENT '学分',
  `start` int(2) NOT NULL DEFAULT 1 COMMENT '起始周',
  `end` int(2) NOT NULL DEFAULT 17 COMMENT '结束周',
  `semester` int(1) NOT NULL DEFAULT 1 COMMENT '开课学期',
  `grade` int(1) NOT NULL DEFAULT 1 COMMENT '开课年级',
  `collegeId` int(11) NOT NULL COMMENT '开课学院ID',
  `limitNum` int(3) NOT NULL DEFAULT 100 COMMENT '限定人数',
  `chosen` int(3) NOT NULL DEFAULT 0 COMMENT '已选人数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 109 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_course
-- ----------------------------
INSERT INTO `t_course` VALUES (1, 1, 'C语言', '2101', 3, 1, 17, 1, 1, 2, 50, 0);
INSERT INTO `t_course` VALUES (2, 1, 'C语言', '2102', 3, 1, 17, 1, 1, 2, 50, 0);
INSERT INTO `t_course` VALUES (3, 1, 'C语言', '2103', 3, 1, 17, 1, 1, 2, 50, 0);
INSERT INTO `t_course` VALUES (4, 1, '计算机网络', '2104', 4, 1, 17, 2, 1, 2, 50, 0);
INSERT INTO `t_course` VALUES (5, 1, '计算机网络', '2105', 4, 1, 17, 2, 1, 2, 50, 0);
INSERT INTO `t_course` VALUES (6, 1, '计算机组成原理', '2106', 4, 1, 17, 1, 2, 2, 50, 0);
INSERT INTO `t_course` VALUES (7, 1, '计算机组成原理', '2107', 4, 1, 17, 1, 2, 2, 50, 0);
INSERT INTO `t_course` VALUES (8, 1, '数据结构', '2108', 4, 1, 17, 1, 2, 2, 50, 0);
INSERT INTO `t_course` VALUES (9, 1, '数据结构', '2109', 4, 1, 17, 1, 2, 2, 50, 0);
INSERT INTO `t_course` VALUES (10, 1, '操作系统', '2110', 4, 1, 17, 2, 2, 2, 50, 0);
INSERT INTO `t_course` VALUES (11, 1, '操作系统', '2111', 4, 1, 17, 2, 2, 2, 50, 0);
INSERT INTO `t_course` VALUES (12, 1, '数据库系统原理', '2112', 4, 1, 17, 2, 2, 2, 50, 0);
INSERT INTO `t_course` VALUES (13, 1, '数据库系统原理', '2113', 4, 1, 17, 2, 2, 2, 50, 0);
INSERT INTO `t_course` VALUES (14, 1, '大数据安全管理', '2104', 3, 1, 17, 1, 3, 2, 30, 0);
INSERT INTO `t_course` VALUES (15, 1, '大数据存储与处理', '2105', 3, 1, 17, 2, 3, 2, 30, 0);
INSERT INTO `t_course` VALUES (16, 1, '大数据分析方法', '2106', 3, 1, 17, 1, 4, 2, 30, 0);
INSERT INTO `t_course` VALUES (17, 1, '软件工程', '2107', 3, 1, 17, 1, 3, 2, 30, 0);
INSERT INTO `t_course` VALUES (18, 1, '编译原理', '2108', 3, 1, 17, 2, 3, 2, 30, 0);
INSERT INTO `t_course` VALUES (19, 1, '软件项目管理', '2109', 3, 1, 17, 1, 4, 2, 30, 0);
INSERT INTO `t_course` VALUES (20, 1, '单片机原理', '2110', 3, 1, 17, 1, 3, 2, 30, 0);
INSERT INTO `t_course` VALUES (21, 1, '嵌入式系统', '2111', 3, 1, 17, 2, 3, 2, 30, 0);
INSERT INTO `t_course` VALUES (22, 1, '传感器与检测技术', '2112', 3, 1, 17, 1, 4, 2, 30, 0);
INSERT INTO `t_course` VALUES (23, 1, '金融学', '2114', 3, 1, 17, 1, 1, 3, 50, 0);
INSERT INTO `t_course` VALUES (24, 1, '金融学', '2115', 3, 1, 17, 1, 1, 3, 50, 0);
INSERT INTO `t_course` VALUES (25, 1, '金融学', '2116', 3, 1, 17, 1, 1, 3, 50, 0);
INSERT INTO `t_course` VALUES (26, 1, '金融工程学', '2117', 4, 1, 17, 2, 1, 3, 50, 0);
INSERT INTO `t_course` VALUES (27, 1, '金融工程学', '2118', 4, 1, 17, 2, 1, 3, 50, 0);
INSERT INTO `t_course` VALUES (28, 1, '利息理论', '2119', 4, 1, 17, 1, 2, 3, 50, 0);
INSERT INTO `t_course` VALUES (29, 1, '利息理论', '2120', 4, 1, 17, 1, 2, 3, 50, 0);
INSERT INTO `t_course` VALUES (30, 1, '金融风险管理', '2121', 4, 1, 17, 1, 2, 3, 50, 0);
INSERT INTO `t_course` VALUES (31, 1, '金融风险管理', '2122', 4, 1, 17, 1, 2, 3, 50, 0);
INSERT INTO `t_course` VALUES (32, 1, '国际金融', '2123', 4, 1, 17, 2, 2, 3, 50, 0);
INSERT INTO `t_course` VALUES (33, 1, '国际金融', '2124', 4, 1, 17, 2, 2, 3, 50, 0);
INSERT INTO `t_course` VALUES (34, 1, '金融计量学', '2125', 4, 1, 17, 2, 2, 3, 50, 0);
INSERT INTO `t_course` VALUES (35, 1, '金融计量学', '2126', 4, 1, 17, 2, 2, 3, 50, 0);
INSERT INTO `t_course` VALUES (36, 1, '信用经济学', '2117', 3, 1, 17, 1, 3, 3, 30, 0);
INSERT INTO `t_course` VALUES (37, 1, '信用管理学', '2118', 3, 1, 17, 2, 3, 3, 30, 0);
INSERT INTO `t_course` VALUES (38, 1, '信用评级', '2119', 3, 1, 17, 1, 4, 3, 30, 0);
INSERT INTO `t_course` VALUES (39, 1, '保险学原理', '2120', 3, 1, 17, 1, 3, 3, 30, 0);
INSERT INTO `t_course` VALUES (40, 1, '保险经营管理学', '2121', 3, 1, 17, 2, 3, 3, 30, 0);
INSERT INTO `t_course` VALUES (41, 1, '保险营销学', '2122', 3, 1, 17, 1, 4, 3, 30, 0);
INSERT INTO `t_course` VALUES (42, 1, '证券投资学', '2123', 3, 1, 17, 1, 3, 3, 30, 0);
INSERT INTO `t_course` VALUES (43, 1, '投资银行学', '2124', 3, 1, 17, 2, 3, 3, 30, 0);
INSERT INTO `t_course` VALUES (44, 1, '创业风险投资', '2125', 3, 1, 17, 2, 4, 3, 30, 0);
INSERT INTO `t_course` VALUES (45, 2, '唐诗宋词赏析', '2127', 3, 1, 11, 1, 1, 1, 100, 0);
INSERT INTO `t_course` VALUES (46, 2, '中国通史', '2128', 3, 1, 11, 1, 1, 1, 100, 0);
INSERT INTO `t_course` VALUES (47, 2, '现代通讯技术', '2129', 3, 1, 11, 1, 1, 2, 100, 0);
INSERT INTO `t_course` VALUES (48, 2, '金融与理财', '2130', 3, 1, 11, 1, 1, 3, 100, 0);
INSERT INTO `t_course` VALUES (49, 2, '自然科学导论', '2127', 3, 1, 11, 2, 1, 1, 100, 0);
INSERT INTO `t_course` VALUES (50, 2, '旅游环境', '2128', 3, 1, 11, 2, 1, 1, 100, 0);
INSERT INTO `t_course` VALUES (51, 2, '计算机辅助设计技术', '2129', 3, 1, 11, 2, 1, 2, 100, 0);
INSERT INTO `t_course` VALUES (52, 2, '零售学基础', '2130', 3, 1, 11, 2, 1, 3, 100, 0);
INSERT INTO `t_course` VALUES (53, 2, '民间艺术概论', '2131', 3, 1, 11, 1, 2, 1, 100, 0);
INSERT INTO `t_course` VALUES (54, 2, '中外音乐简史', '2132', 3, 1, 11, 1, 2, 1, 100, 0);
INSERT INTO `t_course` VALUES (55, 2, '算法分析与设计', '2133', 3, 1, 11, 1, 2, 2, 100, 0);
INSERT INTO `t_course` VALUES (56, 2, '世界经济', '2134', 3, 1, 11, 1, 2, 3, 100, 0);
INSERT INTO `t_course` VALUES (57, 2, '运动营养学', '2131', 3, 1, 11, 2, 2, 1, 100, 0);
INSERT INTO `t_course` VALUES (58, 2, '摄影与动画设计', '2132', 3, 1, 11, 2, 2, 1, 100, 0);
INSERT INTO `t_course` VALUES (59, 2, 'WEB技术与应用', '2133', 3, 1, 11, 2, 2, 2, 100, 0);
INSERT INTO `t_course` VALUES (60, 2, '中国经济改革与发展', '2134', 3, 1, 11, 2, 2, 3, 100, 0);
INSERT INTO `t_course` VALUES (61, 2, '生物科学与思维', '2135', 3, 1, 11, 1, 3, 1, 100, 0);
INSERT INTO `t_course` VALUES (62, 2, '地球科学导论', '2136', 3, 1, 11, 1, 3, 1, 100, 0);
INSERT INTO `t_course` VALUES (63, 2, '网站制作', '2137', 3, 1, 11, 1, 3, 2, 100, 0);
INSERT INTO `t_course` VALUES (64, 2, '现代投资与理财', '2138', 3, 1, 11, 1, 3, 3, 100, 0);
INSERT INTO `t_course` VALUES (65, 2, '教育行政与管理', '2135', 3, 1, 11, 2, 3, 1, 100, 0);
INSERT INTO `t_course` VALUES (66, 2, '人脑科学与思维', '2136', 3, 1, 11, 2, 3, 1, 100, 0);
INSERT INTO `t_course` VALUES (67, 2, '现代信息技术概论', '2137', 3, 1, 11, 2, 3, 2, 100, 0);
INSERT INTO `t_course` VALUES (68, 2, '市场经济模式概览', '2138', 3, 1, 11, 2, 3, 3, 100, 0);
INSERT INTO `t_course` VALUES (69, 3, '篮球', '2139', 2, 1, 17, 1, 1, 1, 50, 0);
INSERT INTO `t_course` VALUES (70, 3, '篮球', '2140', 2, 1, 17, 1, 1, 1, 50, 0);
INSERT INTO `t_course` VALUES (71, 3, '篮球', '2139', 2, 1, 17, 1, 2, 1, 50, 0);
INSERT INTO `t_course` VALUES (72, 3, '篮球', '2140', 2, 1, 17, 1, 2, 1, 50, 0);
INSERT INTO `t_course` VALUES (73, 3, '足球', '2141', 2, 1, 17, 2, 1, 1, 50, 0);
INSERT INTO `t_course` VALUES (74, 3, '足球', '2142', 2, 1, 17, 2, 1, 1, 50, 0);
INSERT INTO `t_course` VALUES (75, 3, '足球', '2141', 2, 1, 17, 2, 2, 1, 50, 0);
INSERT INTO `t_course` VALUES (76, 3, '足球', '2142', 2, 1, 17, 2, 2, 1, 50, 0);
INSERT INTO `t_course` VALUES (77, 3, '排球', '2143', 2, 1, 17, 1, 1, 1, 50, 0);
INSERT INTO `t_course` VALUES (78, 3, '排球', '2144', 2, 1, 17, 1, 1, 1, 50, 0);
INSERT INTO `t_course` VALUES (79, 3, '排球', '2143', 2, 1, 17, 1, 2, 1, 50, 0);
INSERT INTO `t_course` VALUES (80, 3, '排球', '2144', 2, 1, 17, 1, 2, 1, 50, 0);
INSERT INTO `t_course` VALUES (81, 3, '羽毛球', '2145', 2, 1, 17, 2, 1, 1, 50, 0);
INSERT INTO `t_course` VALUES (82, 3, '羽毛球', '2146', 2, 1, 17, 2, 1, 1, 50, 0);
INSERT INTO `t_course` VALUES (83, 3, '羽毛球', '2145', 2, 1, 17, 2, 2, 1, 50, 0);
INSERT INTO `t_course` VALUES (84, 3, '羽毛球', '2146', 2, 1, 17, 2, 2, 1, 50, 0);
INSERT INTO `t_course` VALUES (85, 3, '兵乓球', '2147', 2, 1, 17, 1, 1, 1, 50, 0);
INSERT INTO `t_course` VALUES (86, 3, '乒乓球', '2148', 2, 1, 17, 1, 1, 1, 50, 0);
INSERT INTO `t_course` VALUES (87, 3, '兵乓球', '2147', 2, 1, 17, 1, 2, 1, 50, 0);
INSERT INTO `t_course` VALUES (88, 3, '乒乓球', '2148', 2, 1, 17, 1, 2, 1, 50, 0);
INSERT INTO `t_course` VALUES (89, 3, '体操', '2149', 2, 1, 17, 2, 1, 1, 50, 0);
INSERT INTO `t_course` VALUES (90, 3, '体操', '2150', 2, 1, 17, 2, 1, 1, 50, 0);
INSERT INTO `t_course` VALUES (91, 3, '体操', '2149', 2, 1, 17, 2, 2, 1, 50, 0);
INSERT INTO `t_course` VALUES (92, 3, '体操', '2150', 2, 1, 17, 2, 2, 1, 50, 0);
INSERT INTO `t_course` VALUES (93, 3, '武术', '2151', 2, 1, 17, 1, 1, 1, 50, 0);
INSERT INTO `t_course` VALUES (94, 3, '武术', '2152', 2, 1, 17, 1, 1, 1, 50, 0);
INSERT INTO `t_course` VALUES (95, 3, '武术', '2151', 2, 1, 17, 1, 2, 1, 50, 0);
INSERT INTO `t_course` VALUES (96, 3, '武术', '2152', 2, 1, 17, 1, 2, 1, 50, 0);
INSERT INTO `t_course` VALUES (97, 3, '健美', '2153', 2, 1, 17, 2, 1, 1, 50, 0);
INSERT INTO `t_course` VALUES (98, 3, '健美', '2154', 2, 1, 17, 2, 1, 1, 50, 0);
INSERT INTO `t_course` VALUES (99, 3, '健美', '2153', 2, 1, 17, 2, 2, 1, 50, 0);
INSERT INTO `t_course` VALUES (100, 3, '健美', '2154', 2, 1, 17, 2, 2, 1, 50, 0);
INSERT INTO `t_course` VALUES (101, 3, '田径', '2155', 2, 1, 17, 1, 1, 1, 50, 0);
INSERT INTO `t_course` VALUES (102, 3, '田径', '2156', 2, 1, 17, 1, 1, 1, 50, 0);
INSERT INTO `t_course` VALUES (103, 3, '田径', '2155', 2, 1, 17, 1, 2, 1, 50, 0);
INSERT INTO `t_course` VALUES (104, 3, '田径', '2156', 2, 1, 17, 1, 2, 1, 50, 0);
INSERT INTO `t_course` VALUES (105, 3, '轮滑', '2157', 2, 1, 17, 2, 1, 1, 50, 0);
INSERT INTO `t_course` VALUES (106, 3, '轮滑', '2158', 2, 1, 17, 2, 1, 1, 50, 0);
INSERT INTO `t_course` VALUES (107, 3, '轮滑', '2157', 2, 1, 17, 2, 2, 1, 50, 0);
INSERT INTO `t_course` VALUES (108, 3, '轮滑', '2158', 2, 1, 17, 2, 2, 1, 50, 0);

-- ----------------------------
-- Table structure for t_dict
-- ----------------------------
DROP TABLE IF EXISTS `t_dict`;
CREATE TABLE `t_dict`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '名称',
  `parent` int(11) NOT NULL DEFAULT 0 COMMENT '父节点ID',
  `grade` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '届数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_dict
-- ----------------------------
INSERT INTO `t_dict` VALUES (1, '教务处', 0, '00');
INSERT INTO `t_dict` VALUES (2, '信息工程学院', 0, '00');
INSERT INTO `t_dict` VALUES (3, '金融学院', 0, '00');
INSERT INTO `t_dict` VALUES (4, '计算机1701', 2, '17');
INSERT INTO `t_dict` VALUES (5, '软件1701', 2, '17');
INSERT INTO `t_dict` VALUES (6, '大数据1701', 2, '17');
INSERT INTO `t_dict` VALUES (7, '物联网1701', 2, '17');
INSERT INTO `t_dict` VALUES (8, '金融1701', 3, '17');
INSERT INTO `t_dict` VALUES (9, '信用管理1701', 3, '17');
INSERT INTO `t_dict` VALUES (10, '保险1701', 3, '17');
INSERT INTO `t_dict` VALUES (11, '投资1701', 3, '17');
INSERT INTO `t_dict` VALUES (12, '计算机1801', 2, '18');
INSERT INTO `t_dict` VALUES (13, '软件1801', 2, '18');
INSERT INTO `t_dict` VALUES (14, '大数据1801', 2, '18');
INSERT INTO `t_dict` VALUES (15, '物联网1801', 2, '18');
INSERT INTO `t_dict` VALUES (16, '金融1801', 3, '18');
INSERT INTO `t_dict` VALUES (17, '信用管理1801', 3, '18');
INSERT INTO `t_dict` VALUES (18, '保险1801', 3, '18');
INSERT INTO `t_dict` VALUES (19, '投资1801', 3, '18');
INSERT INTO `t_dict` VALUES (20, '计算机1901', 2, '19');
INSERT INTO `t_dict` VALUES (21, '软件1901', 2, '19');
INSERT INTO `t_dict` VALUES (22, '大数据1901', 2, '19');
INSERT INTO `t_dict` VALUES (23, '物联网1901', 2, '19');
INSERT INTO `t_dict` VALUES (24, '金融1901', 3, '19');
INSERT INTO `t_dict` VALUES (25, '信用管理1901', 3, '19');
INSERT INTO `t_dict` VALUES (26, '保险1901', 3, '19');
INSERT INTO `t_dict` VALUES (27, '投资1901', 3, '19');
INSERT INTO `t_dict` VALUES (28, '计算机2001', 2, '20');
INSERT INTO `t_dict` VALUES (29, '软件2001', 2, '20');
INSERT INTO `t_dict` VALUES (30, '大数据2001', 2, '20');
INSERT INTO `t_dict` VALUES (31, '物联网2001', 2, '20');
INSERT INTO `t_dict` VALUES (32, '金融2001', 3, '20');
INSERT INTO `t_dict` VALUES (33, '信用管理2001', 3, '20');
INSERT INTO `t_dict` VALUES (34, '保险2001', 3, '20');
INSERT INTO `t_dict` VALUES (35, '投资2001', 3, '20');

-- ----------------------------
-- Table structure for t_record
-- ----------------------------
DROP TABLE IF EXISTS `t_record`;
CREATE TABLE `t_record`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '选课记录ID',
  `stuId` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '学生ID',
  `courseId` int(11) NOT NULL COMMENT '课程ID',
  `teaId` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '老师ID',
  `collegeId` int(11) NOT NULL COMMENT '学生所属学院ID',
  `classId` int(11) NOT NULL COMMENT '学生所属班级ID',
  `createTime` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '选课时间',
  `type` int(1) NOT NULL DEFAULT 1 COMMENT '选课类型',
  `status` int(1) NOT NULL DEFAULT 0 COMMENT '选课状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_record
-- ----------------------------

-- ----------------------------
-- Table structure for t_stu
-- ----------------------------
DROP TABLE IF EXISTS `t_stu`;
CREATE TABLE `t_stu`  (
  `card` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '学号',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '密码',
  `collegeId` int(11) NOT NULL COMMENT '学院ID',
  `classId` int(11) NOT NULL COMMENT '班级ID',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '姓名',
  `loginTime` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '最近登录时间',
  PRIMARY KEY (`card`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_stu
-- ----------------------------

-- ----------------------------
-- Table structure for t_tea
-- ----------------------------
DROP TABLE IF EXISTS `t_tea`;
CREATE TABLE `t_tea`  (
  `card` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '学号',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '密码',
  `collegeId` int(11) NOT NULL COMMENT '学院ID',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '姓名',
  `loginTime` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '最近登录时间',
  PRIMARY KEY (`card`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_tea
-- ----------------------------
INSERT INTO `t_tea` VALUES ('2101', 'e10adc3949ba59abbe56e057f20f883e', 2, '秦红', '2021-02-08 15:20:54');
INSERT INTO `t_tea` VALUES ('2102', 'e10adc3949ba59abbe56e057f20f883e', 2, '吕慧', '');
INSERT INTO `t_tea` VALUES ('2103', 'e10adc3949ba59abbe56e057f20f883e', 2, '秦光兰', '');
INSERT INTO `t_tea` VALUES ('2104', 'e10adc3949ba59abbe56e057f20f883e', 2, '孙易梦', '');
INSERT INTO `t_tea` VALUES ('2105', 'e10adc3949ba59abbe56e057f20f883e', 2, '张凤美', '');
INSERT INTO `t_tea` VALUES ('2106', 'e10adc3949ba59abbe56e057f20f883e', 2, '严梦娇', '');
INSERT INTO `t_tea` VALUES ('2107', 'e10adc3949ba59abbe56e057f20f883e', 2, '姜文秀', '');
INSERT INTO `t_tea` VALUES ('2108', 'e10adc3949ba59abbe56e057f20f883e', 2, '朱启英', '');
INSERT INTO `t_tea` VALUES ('2109', 'e10adc3949ba59abbe56e057f20f883e', 2, '李桂兰', '');
INSERT INTO `t_tea` VALUES ('2110', 'e10adc3949ba59abbe56e057f20f883e', 2, '蒋世兰', '2021-02-08 15:21:56');
INSERT INTO `t_tea` VALUES ('2111', 'e10adc3949ba59abbe56e057f20f883e', 2, '戚欣阳', '');
INSERT INTO `t_tea` VALUES ('2112', 'e10adc3949ba59abbe56e057f20f883e', 2, '孔丽', '');
INSERT INTO `t_tea` VALUES ('2113', 'e10adc3949ba59abbe56e057f20f883e', 2, '卫敏婷', '');
INSERT INTO `t_tea` VALUES ('2114', 'e10adc3949ba59abbe56e057f20f883e', 3, '钱巧丽', '');
INSERT INTO `t_tea` VALUES ('2115', 'e10adc3949ba59abbe56e057f20f883e', 3, '何世群', '');
INSERT INTO `t_tea` VALUES ('2116', 'e10adc3949ba59abbe56e057f20f883e', 3, '华枫', '');
INSERT INTO `t_tea` VALUES ('2117', 'e10adc3949ba59abbe56e057f20f883e', 3, '金凌迦', '');
INSERT INTO `t_tea` VALUES ('2118', 'e10adc3949ba59abbe56e057f20f883e', 3, '朱太群', '');
INSERT INTO `t_tea` VALUES ('2119', 'e10adc3949ba59abbe56e057f20f883e', 3, '伊晶', '');
INSERT INTO `t_tea` VALUES ('2120', 'e10adc3949ba59abbe56e057f20f883e', 3, '郑子彤', '');
INSERT INTO `t_tea` VALUES ('2121', 'e10adc3949ba59abbe56e057f20f883e', 3, '郑娅', '');
INSERT INTO `t_tea` VALUES ('2122', 'e10adc3949ba59abbe56e057f20f883e', 3, '沈功碧', '');
INSERT INTO `t_tea` VALUES ('2123', 'e10adc3949ba59abbe56e057f20f883e', 3, '柳红萍', '');
INSERT INTO `t_tea` VALUES ('2124', 'e10adc3949ba59abbe56e057f20f883e', 3, '朱珊', '');
INSERT INTO `t_tea` VALUES ('2125', 'e10adc3949ba59abbe56e057f20f883e', 3, '杨谷波', '');
INSERT INTO `t_tea` VALUES ('2126', 'e10adc3949ba59abbe56e057f20f883e', 3, '韩招弟', '');
INSERT INTO `t_tea` VALUES ('2127', 'e10adc3949ba59abbe56e057f20f883e', 1, '郑美', '');
INSERT INTO `t_tea` VALUES ('2128', 'e10adc3949ba59abbe56e057f20f883e', 1, '钱婷', '');
INSERT INTO `t_tea` VALUES ('2129', 'e10adc3949ba59abbe56e057f20f883e', 2, '孔慧', '');
INSERT INTO `t_tea` VALUES ('2130', 'e10adc3949ba59abbe56e057f20f883e', 3, '魏琳', '');
INSERT INTO `t_tea` VALUES ('2131', 'e10adc3949ba59abbe56e057f20f883e', 1, '金心媛', '');
INSERT INTO `t_tea` VALUES ('2132', 'e10adc3949ba59abbe56e057f20f883e', 1, '魏佳玲', '');
INSERT INTO `t_tea` VALUES ('2133', 'e10adc3949ba59abbe56e057f20f883e', 2, '秦荷', '');
INSERT INTO `t_tea` VALUES ('2134', 'e10adc3949ba59abbe56e057f20f883e', 3, '朱璧', '');
INSERT INTO `t_tea` VALUES ('2135', 'e10adc3949ba59abbe56e057f20f883e', 1, '吕溶艳', '');
INSERT INTO `t_tea` VALUES ('2136', 'e10adc3949ba59abbe56e057f20f883e', 1, '赵勤', '');
INSERT INTO `t_tea` VALUES ('2137', 'e10adc3949ba59abbe56e057f20f883e', 2, '周涛', '');
INSERT INTO `t_tea` VALUES ('2138', 'e10adc3949ba59abbe56e057f20f883e', 3, '蒋武琴', '');
INSERT INTO `t_tea` VALUES ('2139', 'e10adc3949ba59abbe56e057f20f883e', 1, '魏蕊', '');
INSERT INTO `t_tea` VALUES ('2140', 'e10adc3949ba59abbe56e057f20f883e', 1, '严雪', '');
INSERT INTO `t_tea` VALUES ('2141', 'e10adc3949ba59abbe56e057f20f883e', 1, '韩程悦', '');
INSERT INTO `t_tea` VALUES ('2142', 'e10adc3949ba59abbe56e057f20f883e', 1, '秦睿敏', '');
INSERT INTO `t_tea` VALUES ('2143', 'e10adc3949ba59abbe56e057f20f883e', 1, '李欣怡', '');
INSERT INTO `t_tea` VALUES ('2144', 'e10adc3949ba59abbe56e057f20f883e', 1, '何晓磊', '');
INSERT INTO `t_tea` VALUES ('2145', 'e10adc3949ba59abbe56e057f20f883e', 1, '魏海莲', '');
INSERT INTO `t_tea` VALUES ('2146', 'e10adc3949ba59abbe56e057f20f883e', 1, '贺美丽', '');
INSERT INTO `t_tea` VALUES ('2147', 'e10adc3949ba59abbe56e057f20f883e', 1, '李敏', '');
INSERT INTO `t_tea` VALUES ('2148', 'e10adc3949ba59abbe56e057f20f883e', 1, '钱有为', '');
INSERT INTO `t_tea` VALUES ('2149', 'e10adc3949ba59abbe56e057f20f883e', 1, '尤傲文', '');
INSERT INTO `t_tea` VALUES ('2150', 'e10adc3949ba59abbe56e057f20f883e', 1, '沈子彤', '');
INSERT INTO `t_tea` VALUES ('2151', 'e10adc3949ba59abbe56e057f20f883e', 1, '尤欣怡', '');
INSERT INTO `t_tea` VALUES ('2152', 'e10adc3949ba59abbe56e057f20f883e', 1, '孙敏', '');
INSERT INTO `t_tea` VALUES ('2153', 'e10adc3949ba59abbe56e057f20f883e', 1, '蒋荷', '');
INSERT INTO `t_tea` VALUES ('2154', 'e10adc3949ba59abbe56e057f20f883e', 1, '金洋', '');
INSERT INTO `t_tea` VALUES ('2155', 'e10adc3949ba59abbe56e057f20f883e', 1, '许宜', '');
INSERT INTO `t_tea` VALUES ('2156', 'e10adc3949ba59abbe56e057f20f883e', 1, '何倩', '');
INSERT INTO `t_tea` VALUES ('2157', 'e10adc3949ba59abbe56e057f20f883e', 1, '冯明', '');
INSERT INTO `t_tea` VALUES ('2158', 'e10adc3949ba59abbe56e057f20f883e', 1, '赵一凡', '');

SET FOREIGN_KEY_CHECKS = 1;
