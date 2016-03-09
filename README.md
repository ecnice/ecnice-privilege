权限系统说明书
===========================
适合中小型企业后台权限系统，希望大家多多提出意见

****
###　邮箱:liuwenjun05101@126.com
###  qq群：41461832

================================================
##<a name="index"/>目录
* [windows安装](#windowstext)
* [liunx安装](#liunxtext)
* [预览](#show)

##<a name="windowstext"/>windows安装
* 第一步：下载http://pan.baidu.com/s/1nuu104D
* 第二步：创建一个数据库privilege
* 第三步：执行这个sql。路径privilege->src->sql->privilege.sql
* 第四步：修改privilege-manager.war包解压的lib目录下的privilege-core-0.0.1-SNAPSHOT.jar
	 	用压缩文件打开修改src/main/resources/config/application.properties文件，改成自己的数据库主机，端口，帐号和密码
* 第五步：安装web容器，直接把privilege-manager.war放入运行即可

##<a name="liunxtext"/>liunx安装
* 第一步：下载http://pan.baidu.com/s/1nuu104D
* 第二步：创建一个数据库privilege
* 第三步：执行这个sql。路径privilege->src->sql->privilege.sql
* 第四步：创建一个目录/etc/config/privilege 命令 mkdir -p /etc/config/privilege
* 第五步：把/privilege-core/src/main/resources/config/application.properties拷贝到上面的目录下面
* 第六步：改成自己的数据库主机，端口，帐号和密码
* 第七步：把privilege-manager.war放到tomcat中，直接运行即可

##<a name="show"/>预览
* [图片链接](http://pan.baidu.com/s/1eRsDNEi)

