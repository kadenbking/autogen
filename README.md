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

This fork is deployed for internal use on AWS' ECS Fargate Service using a docker image. To update the docker image, follow the guide below:

```
# Open directory: `/python/packages/autogen-studio`

$ docker build -t ptg/autogenstudio -f ecs.Dockerfile .
$ docker tag autogenstudio ptg/autogenstudio
$ docker push ptg/autogenstudio

# Optional: Run the application with environment variables
# `docker run -e AUTOGENSTUDIO_ALLOWED_IPS='["<whitelisted-ip-address>"]' -p 8080:8080 ptg/autogenstudio`
```
