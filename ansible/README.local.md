# How to configure Jukebox to run on your local computer or laptop 

1. Setup your google and ego secrets
    - GoogleOauth secrets in "~/secrets/oauth_secrets.yml"
    - Ego secrets in "~/secrets/ego.yml"
2. Make sure Ego is setup with the email to be used with google authentication and it has desired scope.
   - The desired scope for jupyterhub is set in ego.yml
3. Run `ansible-playbook build-local.yml`, and wait for it to finish installing.
4. Go to https://localhost:443/hub/login in your web browser, authenticate with Google account then try out the site.


Note:

If EGO is setup locally and using localhost, jupyterhub won't be able to talk to it.

Change the link for ego from localhost to the default-gateway IP address of the jukebox-network.
E.g.
localhost:9081  -> 172.20.0.1:9081

The default-gateway of jukebox-network in docker routes to localhost on host. Do this after step 3 in ~/jukebox/config/jupyterhub_config.py to make sure the docker-network is setup.

To get the gateway:
`docker network inspect jukebox-network -f '{{range .IPAM.Config}}{{.Gateway}}{{end}}'`
    
