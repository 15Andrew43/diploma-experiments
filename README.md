# diploma-experiments
for diploma



https://docs.google.com/spreadsheets/d/191WWNpjJ2za6-nbG4ZoUMXMpUK8KlCIosvQB0f-oq3k/edit#gid=907731238



 - docker run -d -p 8083:8099 --rm --name my_web_db-3 avborovets/restful_api_example && docker run -d -p 8082:8099 --rm --name my_web_db-2 avborovets/restful_api_example && docker run -d -p 8081:8099 --rm --name my_web_db-1 avborovets/restful_api_example
 - docker build -t envoy:v1 . && docker run -p 8080:10000 -p 9901:9901 --rm envoy:v1