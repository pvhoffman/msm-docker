# makefile for msm-appdata docker image and container

# image name
IMAGE_NAME=yellowmagic/msm-appdata

#container name
CONTAINER_NAME=msm-appdata

image:
	docker build -t $IMAGE_NAME .

container:
	docker run -it --name $CONTAINER_NAME

all: image container

clean:
	docker rmi $IMAGE_NAME
	docker rm $CONTAINER_NAME


