FROM postgres:10.3
COPY bin /hint-bin
ENV PATH="hint-bin:$PATH"
ENV POSTGRES_DB hint
ENV POSTGRES_USER hintuser
ENV POSTGRES_PASSWORD changeme
# This is needed to override the loss of data that happens if you
# don't mount a persistent volume at the mount point.
ENV PGDATA /pgdata

COPY conf /etc/hint
RUN cat /etc/hint/postgresql.conf /etc/hint/postgresql.test.conf.in > \
        /etc/hint/postgresql.test.conf
RUN cat /etc/hint/postgresql.conf /etc/hint/postgresql.production.conf.in > \
        /etc/hint/postgresql.production.conf
RUN chown -R postgres:postgres /etc/hint
RUN ./docker-entrypoint.sh --version

RUN cp /hint-bin/create-users.sh /docker-entrypoint-initdb.d/

ENTRYPOINT ["/hint-bin/start-with-config.sh"]
CMD ["/etc/hint/postgresql.conf"]