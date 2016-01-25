<<<<<<< HEAD
权限系统说明书
===========================
适合中小型企业后台权限系统，希望大家多多提出意见

****
###　团队:bruce.liu,wanghuan,xietongjian,tuanzuo
###　邮箱:463805737@qq.com,303320076@qq.com
###      583110978@qq.com,824954861@qq.com
###  qq群：41461832

===========================
##<a name="index"/>目录
* [windows安装](#windowstext)
* [liunx安装](#liunxtext)

##<a name="windowstext"/>windows安装
* 第一步：下载https://github.com/ecnice001/privilege/tree/master/privilege-manager/target/privilege-manager.war
* 第二步：创建一个数据库privilege_b
* 第三步：执行这个sql。路径privilege->src->sql->privilege_b.sql
* 第四步：修改/privilege-core/src/main/resources/config/application.properties文件，改成自己的数据库主机，端口，帐号和密码
* 第五步：创建一个web容器，直接运行即可

##<a name="liunxtext"/>liunx安装
* 第一步：下载https://github.com/ecnice001/privilege/tree/master/privilege-manager/target/privilege-manager.war
* 第二步：创建一个数据库privilege_b
* 第三步：执行这个sql。路径privilege->src->sql->privilege_b.sql
* 第四步：创建一个目录/etc/config/privilege 命令 mkdir -p /etc/config/privilege
* 第五步：把/privilege-core/src/main/resources/config/application.properties拷贝到上面的目录下面
* 第六步：改成自己的数据库主机，端口，帐号和密码
* 第七步：把privilege-manager.war放到tomcat中，直接运行即可


=======
# privilege
权限
>>>>>>> branch 'master' of https://github.com/ecnice/privilege.git
