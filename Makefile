.PHONY: setup server-setup server-test server-start server-sh server-sh-root infra-setup infra-deploy

setup:
	docker-compose pull
	docker-compose build

server-setup: setup
	docker-compose run --no-deps --user=root:root --rm server chown -R 1000:1000 /home/server
	docker-compose run --no-deps server mix local.hex --force
	docker-compose run --no-deps server mix local.rebar --force
	docker-compose run server mix setup

server-test: server-setup
	docker-compose run server mix test

server-start: server-setup
	docker-compose up

server-bash:
	docker-compose run --rm astoria-server bash

server-bash-root:
	docker-compose run --user=root:root --rm astoria-server bash

infra-deploy:
	ansible-playbook --vault-password-file=infra/vault_password.sh -i infra/hosts infra/playbook.yml

graphql-update-schema:
	docker-compose run --rm astoria-server mix absinthe.schema.json assets/src/schema.json
