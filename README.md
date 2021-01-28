# Astoria

Create 1

## TODO

- Add/Remove webhooks need to be implemented
- Suspend needs to be implemented
- Need to pass period to R code
- User management (invites, roles)
- Audit log
- Flash messages should be handled in JS

## Server

Provided Docker is installed you should be able to start the server component with `make server-start`. This will fetch all dependencies, install all libs then start the server.

### Setup for local development

Local development will require the use of ngrok and a dummy repository on GitHub which is configured to the ngrok endpoint. You can trigger events by pushing to your dummy repo.

1. Clone repo
2. Configure local environment variables using Direnv. All environment variables specified in .envrc.example will need to be configured.
3. Run `make server-test` which should perform all local builds, installs and successfully run the tests.
4. Create or pick a repo on Github which will be the source for dummy push events.
5. Configure a webhook on push events for that repo that targets your ngrok endpoint (this can be found by looking at the ngrok dashboard when the container is started)
6. If all is configured correctly, code pushes to that dummy repo will arrive on your local machine.

### Direnv variables and there usage

| Name                         | Use                                                                                                                                          |
| ---------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------- |
| GITHUB_PERSONAL_ACCESS_TOKEN | Used to access the Github API until an auth system is built. When setting permissions, ensure it has access to download the repo source code |
| NGROK_COMMAND                | Used in the `docker-compose` file to bring up the ngrok container. Defined as an env variable to allow usage of the paid version             |

### ngrok usage

ngrok (https://ngrok.com/) makes it easier to open public facing connections to your local machine. The benefit of this is that you can configure a Github webhook to point to the ngrok endpoint which when then forward it to your local development environment. This makes it much easier to work with APIs that generate callbacks.

If you examine the .envrc.example you'll see an ngrok command that will allow you to open a tunnel without a paid account. If you do get sick of having to update your webhooks in Github you can opt for a paid ngrok account which will allow custom sub domains. And example config for this setup is:

```
export NGROK_COMMAND="ngrok http server:4000 -subdomain=$NGROK_SUBDOMAIN -region=au -authtoken=$NGROK_TOKEN"
export NGROK_SUBDOMAIN=gotchaslocal
export NGROK_TOKEN=123
```
