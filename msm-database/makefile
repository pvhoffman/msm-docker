# makefile for msm-database and msm-dbdata docker image and container

# makefile does the following
# docker build -t yellowmagic/msm-database .
# docker run --name msm-dbdata yellowmagic/msm-database echo "msm-dbdata container"
# docker run -d --volumes-from msm-dbdata --name msm-database yellowmagic/msm-database

# image names
DATABASE_IMAGE_NAME=yellowmagic/msm-database

#container names
DATABASE_CONTAINER_NAME=msm-database
DBDATA_CONTAINER_NAME=msm-dbdata




image: 
	docker build -t $(DATABASE_IMAGE_NAME) .

dbdatacontainer:
	docker run --name $(DBDATA_CONTAINER_NAME) $(DATABASE_IMAGE_NAME) echo "msm-dbdata container"

databasecontainer:
	docker run -d --volumes-from $(DBDATA_CONTAINER_NAME) --name $(DATABASE_CONTAINER_NAME) $(DATABASE_IMAGE_NAME)

container: dbdatacontainer databasecontainer

all: image container

clean:
	docker rmi $(DATBASE_IMAGE_NAME)
	docker rmi $(DBDATA_IMAGE_NAME)
	docker rm $(DATABASE_CONTAINER_NAME)
	docker rm $(DBDATA_CONTAINER_NAME)




