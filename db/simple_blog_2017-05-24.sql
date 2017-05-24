# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.18)
# Database: simple_blog
# Generation Time: 2017-05-24 13:38:27 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table blog_article
# ------------------------------------------------------------

DROP TABLE IF EXISTS `blog_article`;

CREATE TABLE `blog_article` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `createTime` timestamp NULL DEFAULT NULL,
  `updateTime` timestamp NULL DEFAULT NULL,
  `category` int(10) unsigned DEFAULT NULL,
  `title` varchar(30) DEFAULT NULL,
  `author` bigint(20) DEFAULT NULL,
  `content` text,
  `status` int(20) unsigned DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `blog_article` WRITE;
/*!40000 ALTER TABLE `blog_article` DISABLE KEYS */;

INSERT INTO `blog_article` (`id`, `createTime`, `updateTime`, `category`, `title`, `author`, `content`, `status`)
VALUES
	(17,'2017-05-23 13:39:52','2017-05-23 00:40:07',0,'数据库中什么样的数据需要进行伪删除？',1,'数据库中的记录，是否应该进行伪删除呢？\n如果需要进行伪删除，那么伪删除的条件是什么，在什么情况下可以对数据库中的记录做真删除操作？\n\n\n<!--more-->\n\n\n## 想法一：\n\n二次插入相同数据不会引起歧义。\n\n那么什么是歧义？\n\n我也还不知道怎么解释比较清楚。\n\n## 想法二：\n\n### 前提：\n\n计算机世界的对象模型是从现实世界中抽象出来的，与之都有一个现实世界中的参考实例。且实例都具有在现实世界中是否存在的属性。\n\n### 推论\n\n若现实世界中的某实例，能够在现实世界中 *合法地* 被永久删除、彻底消失，则该对象在现实世界消失时，数据库记录则应该伪删除。\n\n若该实例在现实世界中不能被 *合法地* 删除，或者删除条件比较难以达到，则该对象从现实世界消失时，数据库记录可以真删除。\n\n## 真删除示例\n\n> 1. 某学生管理系统中的学生获奖情况\n    在现实世界中，若一名学生真的获奖了，且消息属实。那么想否认这条消息是困难的。满足现实世界中删除条件难以达成。\n\n\n## 伪删除示例\n\n> 1. 某社保系统中的人\n     在现实世界中，人是一个个体，常理上该个体死亡就代表消失。但关于人这个个体消失的定义很哲学，若在世的人还保留着对亡者的回忆，则并不能表示该个体确实消失。所以数据库中记录进行伪删除。反正则是真删除。\n\n> 2. 某电商网站的购物订单\n     在现实世界中，订单凭证也许就是一张简单的发票，该发票可以轻易销毁，不论是烧掉还是丢掉难度都不大。因此，该类数据在数据库中若需要执行删除操作，则选择伪删除。\n\n\n\n\n\n\n\n',1),
	(18,'2017-05-23 13:40:31','2017-05-23 00:40:58',0,'技术和业务孰轻孰重？',1,'快毕业了，朋友面试了几个实习单位经常被问到的问题就是怎么看 *技术* 和 *业务* 的关系，哪个轻哪个重？\n\n刚开始我听到这个问题的时候我是很懵逼的。\n\n第一反应：我觉得技术重要。\n\n但是后来仔细想想觉得，**技术不都是从业务中抽离出去的吗？**\n\n所以觉得，技术和业务其实是 **相辅相成的** 。业务引导着技术的发展，技术又提供便利于业务。\n\n就像嘴唇与牙齿，缺一不可。\n\n既不能脱离业务盲目崇拜技术，也不可用着落伍的技术去实现复杂的业务。\n\n至于如何权衡....\n\n<br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />\n\n我又不是项目经理关我啥事!\n\n<br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />\n\n睡觉去\n\n<br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />\n\n反正我爱技术主导\n',1),
	(19,'2017-05-23 00:41:14','2017-05-23 00:41:14',0,'Mac Air 内置键盘上方外接键盘的方法',1,'不用禁用任何驱动\n\n不用安装任何软件\n\n从物理上彻底解决！\n\n> 我能怎么办？我也很绝望啊！\n\n<!--more-->\n\n\n\n![](http://ojem7de4g.bkt.clouddn.com/article/MacairKeyboard/IMG_20170314_163426.jpg)\n\n是不是很想问那个纸片哪里来的？\n\n> 键盘盒子上剪下来的！\n\n\n\n',1),
	(20,'2017-05-23 00:41:50','2017-05-23 00:41:50',0,'JS 实现新标签打开站外网站',1,'## 15行JS 实现新标签打开站外网站\n\n```JS\n(function(){\n    function isOutSite(link){\n        if( link.substr(0,4) !== \"http\" ) {return false;}\n        var url = new URL(link);\n        if(url.hostname === location.hostname) {return false;}\n        return true;\n    };\n    $(\"a[href]\").click(function(){\n        var url = $(this).attr(\"href\");\n        if(isOutSite(url)){\n            open(url);\n            return false;\n        }\n    });\n})();\n\n```\n\n\n',1),
	(21,'2017-05-23 00:43:29','2017-05-23 00:43:29',0,'MAC 安装 Composer ',1,'## 下载 `Composer.phar` 文件 \n```bash \ncurl -sS https://getcomposer.org/installer | php\n```\n\n\n## 移动 `Composer.phar` 文件\n\n移动 `Composer.phar` 文件到 `bin` 目录，使之成为全局指令 \n```bash\nmv composer.phar /usr/local/bin/composer\n```\n\n\n<!--more-->\n\n',1),
	(22,'2017-05-23 13:44:12','2017-05-23 00:44:24',0,'抽奖[谁去做啥子]',1,'# 一个简单的随机抽奖功能\n## 每行一个参与者填入文本域中\n## 点击 `Run！` 开始~\n<div style=\"margin:0 auto;text-align:center;\">\n <textarea id=\"txt_names\" placeholder=\"一行一个参与者\" style=\"width:60%;height:130px;border:2px solid rgb(85, 85, 85);\"></textarea><br />\n <span class=\"more\">\n  <a id=\"btn_run\" href=\"javascript:void(0)\">Run!</a>\n </span>\n</div>\n\n\n\n<script>\n(function(){\n  function getIds(){\n    var tmp_ids = document.querySelector(\"#txt_names\").value.split(\'\\n\');\n    var ids = [];\n    for(let i=0;i<tmp_ids.length;i++){\n      if(tmp_ids[i]){\n        ids.push(tmp_ids[i]);\n      }\n    }\n    console.log(tmp_ids,ids);\n    return ids;\n  }\n  function random(size){\n    var idx = parseInt(Math.random()*10000)%size;\n    console.log(\"random:\"+idx);\n    return idx;\n  }\n  function showMsg(msg){\n    if(msg){\n      msg = \"恭喜【\"+msg+\"】！！你中奖了！顺便买张彩票吧！！\";\n    }else{\n      msg = \"貌似木有人参与啊，不带这么玩儿的！\";\n    }\n    alert(msg);\n  }\n  function animate(ids,lucky){\n    var times = parseInt(Math.random()*100%10);\n    var speed = 70;\n    var btn = document.querySelector(\"#btn_run\");\n    var max = ids.length*times;\n    for(let i=0;i<max;i++){\n      setTimeout(function(){\n        btn.text=ids[i%ids.length];\n        if(i+1==max){\n          btn.text = lucky;\n          setTimeout(function(){\n            showMsg(lucky);\n            btn.text = \"Run!\";\n          },speed);\n        }\n      },i*speed);\n    }\n  }\n  document.querySelector(\"#btn_run\").onclick = function(){\n    var ids = getIds();\n    var lucky = ids[random(ids.length)];\n    animate(ids,lucky);\n  };\n})();\n</script>\n\n<!--more-->\n\n\n\n',1);

/*!40000 ALTER TABLE `blog_article` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table blog_article_tag
# ------------------------------------------------------------

DROP TABLE IF EXISTS `blog_article_tag`;

CREATE TABLE `blog_article_tag` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `createTime` timestamp NULL DEFAULT NULL,
  `updateTime` timestamp NULL DEFAULT NULL,
  `article` int(11) DEFAULT NULL,
  `tag` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table blog_category
# ------------------------------------------------------------

DROP TABLE IF EXISTS `blog_category`;

CREATE TABLE `blog_category` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `createTime` timestamp NULL DEFAULT NULL,
  `updateTime` timestamp NULL DEFAULT NULL,
  `title` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `blog_category` WRITE;
/*!40000 ALTER TABLE `blog_category` DISABLE KEYS */;

INSERT INTO `blog_category` (`id`, `createTime`, `updateTime`, `title`)
VALUES
	(1,NULL,NULL,'日常思考'),
	(2,NULL,NULL,'测试分类2');

/*!40000 ALTER TABLE `blog_category` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table blog_comment
# ------------------------------------------------------------

DROP TABLE IF EXISTS `blog_comment`;

CREATE TABLE `blog_comment` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `createTime` timestamp NULL DEFAULT NULL,
  `updateTime` timestamp NULL DEFAULT NULL,
  `article` int(11) DEFAULT NULL,
  `nickname` varchar(256) DEFAULT '',
  `site` varchar(256) DEFAULT '',
  `email` varchar(256) DEFAULT NULL,
  `content` text,
  `replyTo` int(11) unsigned DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `blog_comment` WRITE;
/*!40000 ALTER TABLE `blog_comment` DISABLE KEYS */;

INSERT INTO `blog_comment` (`id`, `createTime`, `updateTime`, `article`, `nickname`, `site`, `email`, `content`, `replyTo`)
VALUES
	(66,'2017-05-23 10:04:37','2017-05-23 10:04:37',21,'Macintosh 用户','http://localhost:8080','kyuuseiryuu@gmail.com','Nice',0),
	(67,'2017-05-23 10:04:43','2017-05-23 10:04:43',21,'Macintosh 用户','http://localhost:8080','kyuuseiryuu@gmail.com','Cool!',0),
	(71,'2017-05-23 10:12:36','2017-05-23 10:12:36',21,'Macintosh 用户','http://localhost:8080','7412947479@qq.com','@Macintosh 用户  hahaha',67),
	(72,'2017-05-23 10:12:40','2017-05-23 10:12:40',21,'Macintosh 用户','http://localhost:8080','7412947479@qq.com','@Macintosh 用户  asdfasfd ',67);

/*!40000 ALTER TABLE `blog_comment` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table blog_config
# ------------------------------------------------------------

DROP TABLE IF EXISTS `blog_config`;

CREATE TABLE `blog_config` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `updateTime` timestamp NULL DEFAULT NULL,
  `createTime` timestamp NULL DEFAULT NULL,
  `k` varchar(512) DEFAULT NULL,
  `v` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `blog_config` WRITE;
/*!40000 ALTER TABLE `blog_config` DISABLE KEYS */;

INSERT INTO `blog_config` (`id`, `updateTime`, `createTime`, `k`, `v`)
VALUES
	(3,'2017-05-21 20:31:01','2017-05-21 20:31:01','sitename','ChioyNote');

/*!40000 ALTER TABLE `blog_config` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table blog_file
# ------------------------------------------------------------

DROP TABLE IF EXISTS `blog_file`;

CREATE TABLE `blog_file` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `createTime` timestamp NULL DEFAULT NULL,
  `updateTime` timestamp NULL DEFAULT NULL,
  `title` varchar(32) DEFAULT NULL,
  `src` varchar(256) DEFAULT NULL,
  `type` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `blog_file` WRITE;
/*!40000 ALTER TABLE `blog_file` DISABLE KEYS */;

INSERT INTO `blog_file` (`id`, `createTime`, `updateTime`, `title`, `src`, `type`)
VALUES
	(10,'2017-05-24 04:24:39','2017-05-24 04:24:39','inner-3.jpg','/upload/2017/05/24/IMAGE_6270829573729478170.jpg','IMAGE'),
	(12,'2017-05-24 04:36:30','2017-05-24 04:36:30','inner-2.jpg','/upload/2017/05/24/IMAGE_9201913755833947167.jpg','IMAGE'),
	(13,'2017-05-24 04:50:14','2017-05-24 04:50:14','work-3.jpg','/upload/2017/05/24/IMAGE_234694193878671279.jpg','IMAGE');

/*!40000 ALTER TABLE `blog_file` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table blog_link
# ------------------------------------------------------------

DROP TABLE IF EXISTS `blog_link`;

CREATE TABLE `blog_link` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `createTime` timestamp NULL DEFAULT NULL,
  `updateTime` timestamp NULL DEFAULT NULL,
  `title` varchar(32) DEFAULT NULL,
  `summary` varchar(32) DEFAULT NULL,
  `link` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `blog_link` WRITE;
/*!40000 ALTER TABLE `blog_link` DISABLE KEYS */;

INSERT INTO `blog_link` (`id`, `createTime`, `updateTime`, `title`, `summary`, `link`)
VALUES
	(7,'2017-05-17 19:38:17','2017-05-24 08:27:54','RyuuNote','龙叔的博客，专门记一些笔记。以及一些有的没的。','http://chioy.cn'),
	(8,'2017-05-24 08:00:14','2017-05-24 08:00:14','QQ','QQ','http://im.qq.com');

/*!40000 ALTER TABLE `blog_link` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table blog_status
# ------------------------------------------------------------

DROP TABLE IF EXISTS `blog_status`;

CREATE TABLE `blog_status` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `createTime` timestamp NULL DEFAULT NULL,
  `updateTime` timestamp NULL DEFAULT NULL,
  `title` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `blog_status` WRITE;
/*!40000 ALTER TABLE `blog_status` DISABLE KEYS */;

INSERT INTO `blog_status` (`id`, `createTime`, `updateTime`, `title`)
VALUES
	(1,'2017-04-27 00:00:00','2017-04-27 00:00:00','已发布'),
	(2,'2017-04-27 00:00:00','2017-04-27 00:00:00','已删除');

/*!40000 ALTER TABLE `blog_status` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table blog_tag
# ------------------------------------------------------------

DROP TABLE IF EXISTS `blog_tag`;

CREATE TABLE `blog_tag` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `createTime` timestamp NULL DEFAULT NULL,
  `updateTime` timestamp NULL DEFAULT NULL,
  `title` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `blog_tag` WRITE;
/*!40000 ALTER TABLE `blog_tag` DISABLE KEYS */;

INSERT INTO `blog_tag` (`id`, `createTime`, `updateTime`, `title`)
VALUES
	(1,'2017-04-30 11:15:47','2017-04-30 11:15:47','吐槽'),
	(2,'2017-04-30 11:15:47','2017-04-30 11:15:47','Java'),
	(3,'2017-04-30 11:15:47','2017-04-30 11:15:47','JavaScript'),
	(4,'2017-04-30 11:15:47','2017-04-30 11:15:47','Linux'),
	(5,'2017-04-30 11:15:47','2017-04-30 11:15:47','生活感悟');

/*!40000 ALTER TABLE `blog_tag` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table blog_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `blog_user`;

CREATE TABLE `blog_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `createTime` timestamp NULL DEFAULT NULL,
  `updateTime` timestamp NULL DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  `username` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `passwd` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `blog_user` WRITE;
/*!40000 ALTER TABLE `blog_user` DISABLE KEYS */;

INSERT INTO `blog_user` (`id`, `createTime`, `updateTime`, `type`, `username`, `email`, `passwd`)
VALUES
	(1,'2017-04-27 00:00:00','2017-05-24 01:30:30','admin','ryuu','kyuuseiryuu@gmail.com','4297F44B13955235245B2497399D7A93');

/*!40000 ALTER TABLE `blog_user` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table blog_user_type
# ------------------------------------------------------------

DROP TABLE IF EXISTS `blog_user_type`;

CREATE TABLE `blog_user_type` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `createTime` timestamp NULL DEFAULT NULL,
  `updateTime` timestamp NULL DEFAULT NULL,
  `title` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `blog_user_type` WRITE;
/*!40000 ALTER TABLE `blog_user_type` DISABLE KEYS */;

INSERT INTO `blog_user_type` (`id`, `createTime`, `updateTime`, `title`)
VALUES
	(1,NULL,NULL,'admin');

/*!40000 ALTER TABLE `blog_user_type` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
