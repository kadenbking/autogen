# AutoGen

This is a fork of the [Microsoft AutoGen repository](https://github.com/microsoft/autogen?tab=readme-ov-file#readme-top) (see parent README for details). This repository was forked in order to customize the [AutoGen Studio](https://github.com/microsoft/autogen/tree/main/python/packages/autogen-studio) web application.

<strong>Current updates include:</strong>

- [Custom IP Whitelisting middleware](https://github.com/microsoft/autogen/commit/0da9546cd77876ed0f10be2e25dfb0f8867902dc)
- [Github Action to sync parent with fork repository](https://github.com/kadenbking/autogen/blob/main/.github/workflows/sync-fork.yml)

<strong>Potential Future Updates:</strong>

- Custom Login/Logout logic to AutoGen Studio web application

## Local Development

I found it easiest to run the modified web application using the pre-configured [dev container](https://github.com/microsoft/autogen/tree/main/python/packages/autogen-studio#b--install-from-source-using-a-dev-container). Follow the README for instructions.

## Deployment

This fork is deployed for internal use on [Render's](render.com) free tier for web services using a docker image. To update the docker image, follow the guide below:

### Docker Build

```
# Open directory: `/python/packages/autogen-studio`

$ docker build -t autogenstudio -f render.Dockerfile .
$ docker login
$ docker tag autogenstudio <docker_username>/autogenstudio
$ docker push <docker_username>/autogenstudio

# Optional: Run the application
# `docker run -p 10000:10000 autogenstudio` OR `docker run -p 10000:10000 <docker_username>/autogenstudio`

# Run the application with environment variables
# `docker run -e AUTOGENSTUDIO_ALLOWED_IPS='["<whitelisted-ip-address>"]' -p 10000:10000 kadencf/autogenstudio`
```

### Render Configuration

1. Render.com
2. New web service
3. Deploy from Docker image > `docker.io/<docker_username>/autogenstudio:latest`
4. Set health check > `/api/health`
5. Set environment variable > `AUTOGENSTUDIO_ALLOWED_IPS=["<whitelisted-ip-address>"]`
6. Deploy!
