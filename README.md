# web-simple

FIXME: description

## Installation

Download from http://example.com/FIXME.

## Usage

## development

To start the web server run the repl:

```
lein repl
```

Then in the REPL run:

```
(start)
```

To stop the web server press `Ctrl+C` in the terminal where the REPL is running.

To run the docker-compose in your machine run:

```
docker-compose -f docker-compose.yaml -f docker-compose.dev.yaml up
```

## Deployment  

To deploy the application run:

```
docker-compose up
```

## Configure AWS credentials for actions
follow instructions [here](https://github.com/aws-actions/configure-aws-credentials?tab=readme-ov-file#configure-aws-credentials-for-github-actions).
