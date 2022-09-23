FROM eclipse-temurin:11-jre-focal

RUN set -ex\
    && curl -o /usr/bin/jq -L https://github.com/stedolan/jq/releases/download/jq-1.6/jq-linux64\
    && chmod +x /usr/bin/jq

# CMD ["curl", "-fsSL", "https://papermc.io/api/v2/projects/paper/versions/1.16.5"]

