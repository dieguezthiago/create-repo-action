FROM ubuntu:latest

RUN apt-get update && \
    apt-get install -y jq curl

COPY create-repo/main.sh /main.sh
RUN chmod +x /main.sh

ENTRYPOINT ["/main.sh"]
