# API Documentation

`api.yaml` is an OPEN API 3 compliant specification of Ferrandine's api.

## Documentation UI

The easiest way to visualize the API documentation in an user-friendly manner is to use `ReDoc`.

### Static

This static version is there to avoid internet speed issues. 

:warning: **This is not to be trusted, it can be outdated.**

To use the static version, just open `static.html` in your browser.

### Serve 

You need `node` installed on your computer to use it.
```sh
npx redoc-cli serve ./documentation/api.yaml 
```

