FROM envoyproxy/envoy:dev-f1acd09bf7d61e21bf2bd155e5b45a8bc6d1ad48

COPY envoy.yaml /etc/envoy/envoy.yaml

RUN chmod 777 -R /tmp

RUN chmod go+r /etc/envoy/envoy.yaml

