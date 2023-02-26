FROM envoyproxy/envoy-dev:f2e49c86b2edca1c65c7a375a7629f46d3c78e4e

COPY envoy.yaml /etc/envoy/envoy.yaml

RUN chmod 777 -R /tmp

RUN chmod go+r /etc/envoy/envoy.yaml

