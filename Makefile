app-db-prepare:
	docker-compose run --rm web bash -c "bin/rails db:create db:migrate"

app-install:
	docker-compose run --rm web bash -c "bundle install"

compose:
	docker-compose up

compose-bash:
	docker-compose run --rm web bash

compose-build:
	docker-compose build

compose-down:
	docker-compose down -v || true

compose-setup: compose-down compose-build app-install app-db-prepare
