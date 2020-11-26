.PHONY: build run stop deploy redoc

help: ## Prints help for targets with comments
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

build: ## Build mock server
	docker build -t project-name-mock .

run: ## Run mock server at port :8080
	docker run -p 127.0.0.1:8080:5000 -e "PORT=5000" project-name-mock

stop: ## Stop mock server
	docker ps | grep project-name-mock | awk '{print $$1}' | xargs docker stop

deploy-mock: ## Deploy mock server
	rm Dockerfile_api
	mv Dockerfile_mock Dockerfile
	heroku container:login
	heroku container:push web --app=project-name-mock
	heroku container:release web --app=project-name-mock

deploy-api: ## Deploy api server
	rm Dockerfile_mock
	mv Dockerfile_api Dockerfile
	heroku container:login
	heroku container:push web --app=project-name-api
	heroku container:release web --app=project-name-api

redoc: ## Run ReDoc at port :7000
	docker run -it --rm -p 7000:80 -v $(CURDIR)/:/usr/share/nginx/html/ -e SPEC_URL=api.yaml redocly/redoc
