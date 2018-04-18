# Installation

```
npm install -g yamlinc
npm install
```

# Modify and combine into one yaml file
1. Run `npm run watch` to watch `*.yaml` (excluding the `index.inc.yaml`). Or
2. Run `npm run build` to compile to `index.inc.yaml`. Use `index.inc.yaml` file as an all-in-one swagger file in SwaggerHub.
3. As of this writing, SwaggerHub doesn't support GitHub Sync for Open API 3.0. So until the GitHub Sync is ready, we have to manually copy/paste the compiled `index.inc.yaml` into [https://app.swaggerhub.com/apis/airmnb/api/1.0.0](https://app.swaggerhub.com/apis/airmnb/api/1.0.0) and click the "Save" button on the page. After that the Mock API server can be updated automatically. 
  The mock API URL[https://virtserver.swaggerhub.com/airmnb/api/1.0.0/](https://virtserver.swaggerhub.com/airmnb/api/1.0.0/)
