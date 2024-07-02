# 使用eclipse-temurin:17-jdk-alpine作为基础镜像
FROM eclipse-temurin:17-jdk-alpine
# 安装curl，我们将使用curl命令来测试服务是否正常运行，使用curl来call我们的api
RUN apk add curl
# 添加零时目录tmp
VOLUME /tmp
# 声明端口，暴露8080端口
EXPOSE 8080
# 将当前目录下的springboot-aws-deploy-service.jar复制到容器的/springboot-aws-deploy-service.jar
ADD target/springboot-aws-deploy-service.jar springboot-aws-deploy-service.jar
# 启动容器时执行的命令
ENTRYPOINT ["java","-jar","/springboot-aws-deploy-service.jar"]