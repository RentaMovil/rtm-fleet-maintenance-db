# Runs this repo's migrations inside Docker ("migrations" service of docker-compose.yml).
# The official Liquibase 5 image has no SQL Server driver: we add the same one pom.xml uses, so
# Docker and Maven compute the same checksums.
FROM liquibase/liquibase:5.0.4

ADD --chmod=644 https://repo1.maven.org/maven2/com/microsoft/sqlserver/mssql-jdbc/13.6.0.jre11/mssql-jdbc-13.6.0.jre11.jar /liquibase/lib/

# Changelogs are copied into the image (not mounted), so it behaves the same on any machine
COPY changelog /liquibase/changelog/changelog
COPY 01_ddl /liquibase/changelog/01_ddl
COPY 02_dml /liquibase/changelog/02_dml
COPY 03_dcl /liquibase/changelog/03_dcl
COPY 04_tcl /liquibase/changelog/04_tcl
COPY 05_rollbacks /liquibase/changelog/05_rollbacks
