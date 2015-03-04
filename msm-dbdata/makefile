# makefile for msm-dbdata docker image and container

# image name
IMAGE_NAME=yellowmagic/msm-dbdata

#container name
CONTAINER_NAME=msm-dbdata

image:
	docker build -t $IMAGE_NAME .

container:
	docker run -it --name $CONTAINER_NAME $IMAGE_NAME

all: image container

clean:
	docker rmi $IMAGE_NAME
	docker rm $CONTAINER_NAME


