diagrams:
	python docs/diagrams/backend_infra.py

local_deploy:
	docker run --rm -it -p 8000:8000 -v ${PWD}:/docs squidfunk/mkdocs-material

docker_build:
	docker buildx build --platform linux/arm64/v8 . -f Dockerfile -t ghcr.io/amitkmr/personal-website:latest

docker_run:
	docker run -p 8000:8000 ghcr.io/amitkmr/personal-website:latest

deploy_on_prod:
	skaffold run --default-repo gcr.io/amitkmr/personal-website -p prod
