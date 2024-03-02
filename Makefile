GO_FILES := $(shell find . -name "*.go" -type f)
BIN_DIR := ./bin
SRC_DIR := .

.PHONY: all clean build test lint format install run

all: test lint build

build: $(BIN_DIR)/blockchain

$(BIN_DIR)/blockchain: $(GO_FILES)
	@mkdir -p $(BIN_DIR)
	go build -o $@ $(SRC_DIR)

test:
	go test -v ./...

lint:
	golangci-lint run

format:
	gofmt -w $(GO_FILES)

install:
	go mod tidy

clean:
	go clean
	rm -rf $(BIN_DIR)

run: build
	$@

