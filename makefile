SHELL:=/bin/bash

build-dev:
	docker compose -f .docker/docker-compose.local.yml build --progress plain

dev:
	docker compose -f .docker/docker-compose.local.yml --env-file .env up -d

delete:
	echo 'delete'