FROM flyway/flyway:latest

COPY sql /flyway/sql/
COPY flyway.conf /flyway/conf/flyway.conf

ENTRYPOINT ["flyway", "migrate"]
