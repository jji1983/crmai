@ECHO OFF
set CLASSPATH=../lib/ojdbc7-12.1.0.2.jar;../lib/crmaiBatch_v0.1.jar;
java -Xms4096m -Xmx4096m -XX:-UseGCOverheadLimit  com.ktds.crmai.AppMain
pause