# ~~Project name~~ API specification

API for ~~Project name~~ mobile applications for Android & iOS.

Generated human-readable specification is available here:

~~TBA~~

Preferred way for editing this specification is using [Stoplight Studio](https://stoplight.io/studio/).

## Server URLs:

- Production server: ~~TBA~~
- Development server: ~~TBA~~
- Mock server: ~~TBA~~

## Running local mock server

For debugging purposes when possible is it recommended to use local mock server or proxy. Two main methods to install and run are available:

### Yarn

```
brew install yarn
yarn global add @stoplight/prism-cli
prism mock api.yaml
```

### Docker

```
make build
make run
```

Server address: `127.0.0.1:8080`

## Running local validation when editing the spec

```
yarn add @stoplight/spectral
yarn run spectral lint api.yaml
```

## Running local ReDoc server

```
make redoc
```

Server address: `127.0.0.1:7000`
