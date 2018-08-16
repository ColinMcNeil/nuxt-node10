# [nuxt-node10](https://hub.docker.com/r/dockterdapper/nuxt-node10/)

![pull badge](https://img.shields.io/docker/pulls/dockterdapper/nuxt-node10.svg)

The lightest nuxt image out there. (Now with node 10!)

## Usage

Add the following to your `Dockerfile` in your nuxt project:

```
FROM dockterdapper/nuxt
```

## Customize before build

If you need to customize your project before the nuxt build you can use `--build-arg autobuild=no`. Dont forget to call nuxt build yourself:

```
FROM dockterdapper/nuxt

# replace something in nuxt.config.js
RUN sed -i -e 's/apiserver\.dev/apiserver.production/g' nuxt.config.js

RUN ./node_modules/.bin/nuxt build
```

and run `docker build . --build-arg autobuild=no -t your_image_name`

## License

MIT
