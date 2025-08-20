FROM tomcat:9.0-jdk17

# Install curl to download from Nexus
RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*

# Define environment variables
ENV NEXUS_REPO_URL="http://54.157.190.6:8081/repository/hiring-app/"
ENV ARTIFACT_PATH="junit/hiring/0.1/hiring-0.1.war"

# Download WAR from Nexus and copy to Tomcat webapps
RUN curl -o /usr/local/tomcat/webapps/hiring.war $NEXUS_REPO_URL$ARTIFACT_PATH

# Expose Tomcat port
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]
