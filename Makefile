build:
	docker compose build cups-exporter

run:
	docker compose up --force-recreate cups-exporter