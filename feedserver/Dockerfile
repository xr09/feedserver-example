FROM nginx:stable
USER root

RUN apt update && apt install -y curl

COPY scripts/ /scripts

RUN chmod 755 /scripts/*

EXPOSE 80


ENTRYPOINT ["/scripts/entrypoint.sh"]
