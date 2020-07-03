build: ## Build the container
	docker build -t es-namegen .

run: build
	docker run es-namegen:latest