all: build
build:
	go build -o bin/clusterd ./system-api/cmd/clusterd
	go build -o bin/rackd ./system-api/cmd/rackd
	go build -o bin/hatd ./system-api/cmd/hatd
	go build -o bin/machined ./system-api/cmd/machined
	go build -o bin/uart ./system-api/cmd/uart