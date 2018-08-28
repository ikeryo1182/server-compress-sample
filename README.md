# Description
This repository has the simulation of gzip and brotli for you with gulp and docker.

# How To Use
- Install Node Modules
```
yarn install
```

- Build Source
```
yarn run build
```

- Docker Build
```
docker build -t httpd/test:latest .
```

- Docker Run
```
docker run -d -p 8080:80 httpd/test:latest
```

- Testing 
    - Get plain
    ```
    curl -s --head -H http://localhost:8080
    ```

    - Get gzip compressed
    ```
    curl -s --head -H "Accept-Encoding: gzip" http://localhost:8080
    ```