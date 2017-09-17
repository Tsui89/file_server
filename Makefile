

VERSION = 1.0

bindata-dev:
	go-bindata --dev data/

bindata-build: 
	go-bindata data/

run:
	FILESERVER_DIR=/tmp FILESERVER_PORT=:9000 \
	go run auth.go bindata.go commands.go dirjson.go dirsearch.go \
			dirzip.go gzip.go main.go serv_statics.go webcommand.go


build: 
	CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o file_server .

build_image: 
	docker build -t ops/fileserver:dev-1.0 .

push: 
	docker push ops/fileserver:dev-1.0

all: bindata-build build build_image
