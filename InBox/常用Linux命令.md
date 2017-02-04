+ 常用Linux命令：
    + du -h catalina.out 查看catalina.out占空间
    + cat /dev/null > catalina.out用这个命令清空日志数据
    + cat  /usr/local/tomcat/channelorder/logs/catalina.out | grep  Aliexpress > catalina.out
    + tail -fn 100 /usr/local/tomcat/channelorder/logs/catalina.out
    + cp catalina.out ~
        + tar czvf catalina.out.tar.gz catalina.out
        + sz catalina.out.tar.gz
    + cp /tmp/omniv4.war /webapps2/
    + ps -ef |grep tomcat
    + rm -fr channelorder :删除非空目录
    tac catalina.out |grep -m 9 SyncOrderScheduler
    more BaseScheduler.xml
    gzip or gz
    rm -rf *
    jar xvf channelorder.war channelorder
