# **kafka-connect-ui**
___

### Description
___

This image runs [**Kafka Connect UI**](https://github.com/Landoop/kafka-connect-ui.git).


You can pull it with:

    docker pull parrotstream/kafka-connect-ui


You can also find other images based on different Kafka Connect UI releases, using a different tag in the following form:

    docker pull parrotstream/kafka-connect-ui:[kafka-connect-ui-release]


Start with Docker Compose:

    docker-compose -p parrot -f docker.parrot/docker-compose.yml up

## Configuration

In the docker-compose.yml you can update the following environment variables:

  - `CONNECT_URL` [`connect.cluster.1.url`;`name`]: a comma separated array of Connect worker endpoints (url and name')
  - `PORT` [`PORT`]: the docker internal port to expose the Kafka Connect UI. Remember to change the port mapping in the docker-compose.yml
  - `PROXY` [`true`|`false`]: whether to proxy Connect endpoints via the internal webserver. This option is by default set to true as older versions of Connect do not support CORS, so there isn't another way to make the UI work. If you have a recent Connect (0.11 or 1.0) and permit CORS, you can disable the proxying feature
  - `PROXY_SKIP_VERIFY` [`true`|`false`]: whether to accept self-signed certificates when proxying Connect via https
  - `KAFKA_TOPICS_UI_ENABLED` [`true`|`false`]: set to `true` if you want to navigate to the relevant topic when you have *kafka-topics-ui* running.
  - `KAFKA_TOPICS_UI`: the URL of a running **Kafka Topics UI**
  - `CADDY_OPTIONS`: the webserver that powers the image is Caddy. Via this variable you can add options that will be appended to its configuration (Caddyfile)
  
Once started you'll be able to access to the following UI:

| **Kafka Connect UI**        |**URL**                   |
|:----------------------------|:-------------------------|
| *Kafka Connect UI*          | http://localhost:8000    |


## Relevant Projects

* [Schema Registry UI](https://github.com/parrot-stream/schema-registry-ui), View, create, evolve and manage your Avro Schemas on your Kafka cluster
* [Kafka Topics UI](https://github.com/parrot-stream/kafka-topics-ui), UI to browse Kafka data and work with Kafka Topics

## Supported Connectors

There is a template of metadata within the `src/supported-connectors.js`: in any case you will be shown all the existing connectors in your classpath with all the required fields to set them up.

## License

The project is licensed under the [BSL](http://www.landoop.com/bsl) license.


## Available tags:

- Kafka Connect UI 0.9.6 ([0.9.6](https://github.com/parrot-stream/kafka-connect-ui/blob/0.9.6/Dockerfile), [latest](https://github.com/parrot-stream/kafka-connect-ui/blob/latest/Dockerfile))
