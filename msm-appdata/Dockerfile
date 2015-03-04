# Dockerfile for msm-appdata 
# Data-only container for non-database data used by the webserver container

FROM busybox

MAINTAINER Paul V. Hoffman

# data volume within the container
VOLUME /var/data

# Data-only patter container does not need to be a daemon
CMD ["true"]
