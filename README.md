# diploma-experiments
for diploma



https://docs.google.com/spreadsheets/d/191WWNpjJ2za6-nbG4ZoUMXMpUK8KlCIosvQB0f-oq3k/edit#gid=907731238

 - https://www.youtube.com/watch?v=ZthWg-_Bg_c&ab_channel=solo.io
[about metrics logs ... in envoy, prometheus, ...]

### To run *locally*, you can do

## 1st way:

 - docker run -d -p 8083:8099 --rm --name my_web_db-3 avborovets/restful_api_example && docker run -d -p 8082:8099 --rm --name my_web_db-2 avborovets/restful_api_example && docker run -d -p 8081:8099 --rm --name my_web_db-1 avborovets/restful_api_example

 - docker build -t envoy:v1 . && docker run -p 8080:10000 -p 9901:9901 --rm -v $(pwd)/logs/file.log:/tmp/admin_access.log envoy:v1

 - prometheus --config.file=prometheus.yaml --web.listen-address=localhost:9090 --storage.tsdb.path=$(mktemp -d)  # for local prometheus

 - brew services start grafana

## 2nd way:

 - docker-compose up -d


## important
logs/file.log must exist before running container 
