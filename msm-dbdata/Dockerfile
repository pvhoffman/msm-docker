# Dockerfile for msm-appdata 
# Data-only container for non-database data used by the webserver container

FROM busybox

MAINTAINER Paul V. Hoffman <pvhoffman@gmail.com>

# data volume within the container
VOLUME /var/lib/mysql

# Data-only patter container does not need to be a daemon
CMD ["true"]
