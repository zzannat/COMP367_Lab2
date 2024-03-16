# Use an appropriate base image with Java and a servlet container
FROM tomcat:9.0-jdk17-openjdk-slim

# Remove the default ROOT application in Tomcat
RUN rm -rf /usr/local/tomcat/webapps/ROOT

# Copy the WAR file built by Maven into the webapps directory of Tomcat
COPY target/MavenWebApp.war /usr/local/tomcat/webapps/ROOT.war

# Expose port 8080 to the outside world
EXPOSE 8080

# Define the command to run when the container starts
CMD ["catalina.sh", "run"]