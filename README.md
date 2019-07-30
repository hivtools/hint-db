# hint-db

Web application database for the HIV Indicators Tool. Postgresql database for storing user data.

You can build and push the db docker image by running the `./scripts/build` and `./scripts/push` from this folder.
Migrations can be built and run from the `/migrations` folder. 

The db image will be started as part of the `run-dependencies.sh` script in the web application repo, 
which will also apply migrations. 