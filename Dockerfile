FROM scratch
MAINTAINER jordic jordic@gmail.com
# REPO http://github.com/jordic/file_server
ADD file_server /
VOLUME "/data"
EXPOSE 80
ENTRYPOINT ["/file_server"]
