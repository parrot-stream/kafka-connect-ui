# Kafka Connect UI

This is the source fork of a web tool for Kafka Connect for setting up and managing connectors for multiple connect clusters.

## Run standalone with docker

```
docker run --rm -it -p 8000:8000 \
           -e "CONNECT_URL=http://connect.distributed.url" \
           parrot/kafka-connect-ui
```

The CONNECT_URL can be a comma separated array of Connect worker endpoints. E.g: CONNECT_URL=http://connect.1.url,http://connect.2.url"

Web UI will be available at `http://localhost:8000`

## Run standalone with docker-compose

```
docker-compose -f docker/docker-compose.yml up
```

## Build from source

```
    git clone https://github.com/parrotstream/kafka-connect-ui.git
    cd kafka-connect-ui
    npm install
    http-server .
```
Web UI will be available at `http://localhost:8080`

### Nginx config

If you use `nginx` to serve this ui, let angular manage routing with
```
    location / {
        try_files $uri $uri/ /index.html =404;
        root /folder-with-kafka-connect-ui/;
    }
```

### Setup connect clusters

Use multiple Kafka Connect clusters in `env.js` :
```
var clusters = [
   {
     NAME:"prod", //unique name is required
     KAFKA_CONNECT: "http://kafka-connect.prod.url", //required
     KAFKA_TOPICS_UI: "http://kafka-topics-ui.url", //optional
     KAFKA_TOPICS_UI_ENABLED: true //optional
     COLOR: "#141414" //optional
   },
   {
     NAME:"dev",
     KAFKA_CONNECT: "http://kafka-connect.dev.url",
     KAFKA_TOPICS_UI_ENABLED: false
   },
   {
     NAME:"local",
     KAFKA_CONNECT: "http://kafka-connect.local.url",
   }
]

```
* Use `KAFKA_TOPICS_UI` and `KAFKA_TOPICS_UI_ENABLED` to navigate to the relevant topic when you have [kafka-topics-ui](https://github.com/parrot-stream/kafka-topics-ui) installed.
* Use `COLOR` to set different header colors for each set up cluster.

### Supported Connectors
There is a template of metadata within the `supported-connectors.js`: in any case you will be shown all the existing connectors in your classpath with all the required fields to set them up.

## Changelog
[Here](https://github.com/parrot-stream/kafka-connect-ui/releases)

## License

The project is licensed under the [BSL](http://www.landoop.com/bsl) license.

## Relevant Projects

* [Schema Registry UI](https://github.com/parrot-stream/schema-registry-ui), View, create, evolve and manage your Avro Schemas for multiple Kafka clusters
* [Kafka Connect UI](https://github.com/parrot-stream/kafka-connect-ui), Set up and manage connectors for multiple connect clusters
