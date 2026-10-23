<<<<<<< HEAD
# Imagen para correr las migraciones dentro de Docker (servicio "migrations" del docker-compose).
# La imagen oficial de Liquibase 5 ya no trae el driver de SQL Server: se agrega el mismo que usa
# el pom.xml, para que Docker y Maven calculen los mismos checksums.
=======
# Runs this repo's migrations inside Docker ("migrations" service of docker-compose.yml).
# The official Liquibase 5 image has no SQL Server driver: we add the same one pom.xml uses, so
# Docker and Maven compute the same checksums.
>>>>>>> fe861e60699c758c7f847eb81a9bff570dc74ede
FROM liquibase/liquibase:5.0.4

ADD --chmod=644 https://repo1.maven.org/maven2/com/microsoft/sqlserver/mssql-jdbc/13.6.0.jre11/mssql-jdbc-13.6.0.jre11.jar /liquibase/lib/

<<<<<<< HEAD
# Los changelogs se copian a la imagen (no se montan): así funciona igual en cualquier máquina
=======
# Changelogs are copied into the image (not mounted), so it behaves the same on any machine
>>>>>>> fe861e60699c758c7f847eb81a9bff570dc74ede
COPY changelog /liquibase/changelog/changelog
COPY 01_ddl /liquibase/changelog/01_ddl
COPY 02_dml /liquibase/changelog/02_dml
COPY 03_dcl /liquibase/changelog/03_dcl
COPY 04_tcl /liquibase/changelog/04_tcl
COPY 05_rollbacks /liquibase/changelog/05_rollbacks
