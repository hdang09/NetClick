# Use a base image with Java and Tomcat
FROM tomcat:9.0-jre11

# Set the working directory
WORKDIR /usr/local/tomcat/webapps

# Copy the WAR file into the ROOT directory
COPY target/netclick.war ./ROOT.war

# Expose the default Tomcat port
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]