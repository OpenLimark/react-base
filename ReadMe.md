## React Base Docker Image (Nginx)
This is used to deploy React Web components on the cloud. This container is based on the `bitnami/nginx` Docker image. It adds support for passing server configurations to the React applications by injecting the variables to `__REACT_SERVER_CONFIG__` placeholder in the index.html file.

#### Versions
Current latest version of this image is 1.0.0 which uses BitNami Nginx 1.18.

#### Usage
In your `public/index.html` file, have the following code block.

```
<script>
      try {
        <!-- Server Injected Config -->
        window._serverConfig = __REACT_SERVER_CONFIG__;
      } catch(e) {
        window._serverConfig = {}; // Replace with your defaults 
      }
    </script>
```
Extend from this docker image and create an image with your static content at `/app/`. This Dockerfile should look like the following.

```
FROM openlimark/react-base:latest
COPY build/ /app/
```

When running the container, pass in `REACT_SERVER_CONFIG` environment variable with a JSON string that contains the config.
You can access that JSON object in your code via `window._serverConfig`.

Congratulations, now you have a Docker image for your React WebApp that is portable across environments.