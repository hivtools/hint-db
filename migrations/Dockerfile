FROM flyway/flyway:11.20.3

COPY sql /flyway/sql/
COPY flyway.conf /flyway/conf/flyway.conf

ENTRYPOINT ["flyway", "migrate"]