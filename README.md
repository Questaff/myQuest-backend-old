# myQuest-backend
This is the Rails API backend for myQuest !

## Project
This is an API only, access this project via this url : `http://localhost:3001`.

This project is powered by docker and docker-compose, you'll run command into containers via `docker-compose exec/run <container name> command`
For more informations about containers you should take a look to `docker-compose.yml`

### Setup
This setup guide assume you have [Docker](https://docs.docker.com/install/) and [Docker-compose](https://docs.docker.com/compose/install/) installed.

1. Clone this repository and browse into it via your terminal.
2. Run `docker-compose build` to build the ruby image.
3. Run `docker-compose run --rm web bundle install` to install dependencies.
4. Run `docker-compose up` to launch docker environment (and so all containers).
5. Run `docker-compose run --rm web rails db:create` to create the database.
6. Run `docker-compose run --rm web rails db:migrate` to create tables from migration in the database.

### Available Commands
Run the project with `docker-compose up` will open every containers,

Stop and remove container with `docker-compose down`,

Run bundle install after adding gem `docker-compose run --rm web bundle install`

Open rails console with `docker-compose exec web rails c`

Open a bash in a container `docker-compose run <container_name> bash`

Create database `docker-compose run web rake db:create`

Migrate database `docker-compose run web rake db:migrate`

Delete database `docker-compose run web rake db:drop`

*You should type command from wich environment you want by adding `RAILS_ENV=<environment_name>`*

Restore database `cat <dump> | docker exec -i myquest_db psql -U postgres -Fc myquest_development`

*You should ask the lead developer to send you database dump*
