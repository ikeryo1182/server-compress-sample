# Description
This repository has the simulation of gzip for you with docker.

# How To Use
- Install Node Modules
```
yarn install
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
    curl -s --head http://localhost:8080
    ```

    - Get gzip compressed
    ```
    curl -s --head -H "Accept-Encoding: gzip" http://localhost:8080
    ```