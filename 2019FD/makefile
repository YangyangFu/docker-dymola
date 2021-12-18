IMA_NAME = dymola
HOST = yangyangfu
TAG = 2019

build:
	docker build --no-cache --rm -t ${IMA_NAME} .

remove:
	docker rmi ${IMA_NAME}

tag:
	docker tag ${IMA_NAME} ${HOST}/${IMA_NAME}:${TAG}

push:
	docker push ${HOST}/${IMA_NAME}:${TAG}

run: 
	bash run.sh