FROM  stoplight/prism:3

ADD ./api.yaml api.yaml
ADD ./entrypoint.sh entrypoint.sh

ENTRYPOINT "./entrypoint.sh"
