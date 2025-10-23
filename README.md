# WeasyPrint template for Azure Function
The function is set up with the help of the [Azure Function quickstart guide](https://docs.microsoft.com/en-us/azure/azure-functions/functions-create-first-azure-function-azure-cli).
See also the [Azure custom Docker image tutorial](https://docs.microsoft.com/en-us/azure/app-service/containers/tutorial-custom-docker-image).
There is no need to init a new function with `func init <name>`, because the scaffold is already included in this document.

## Prerequisites
* Azure console
* Docker

## Build the docker container
`docker buildx build --platform linux/amd64 --no-cache -t hoevehammock/azure-function-weasyprint .`

## Run the docker container
`docker run --platform linux/amd64 -p 8080:80 -it hoevehammock/azure-function-weasyprint`
Verify that the project is running properly on http://localhost:8080

## Deploy container to Docker hub

If you changed anything to the Dockerfile, you should push the container to Docker hub (or any other Docker repository) in order to use it in Azure.
See the [Docker hub documentation](https://docs.docker.com/docker-hub/repos/) for more detailed instructions.

* Log in to docker with `docker login`.
* Push the container with `docker push <image-name>`.

## Updating the App

...

## Calling the function

* Find the value of the Environment Variable FUNCTION_CODE of the Container App Container, or the local.settings.json if locally. You'll need this variable.
You should now be able to send a POST request to `https://<app_name>.azurewebsites.net/api/http-trigger?code=<FUNCTION_CODE>`.
