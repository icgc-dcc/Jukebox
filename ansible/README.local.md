# How to configure Jukebox to run on your local computer or laptop 

1. Setup your google secrets
    - Make the file "~/secrets/oauth_secrets.yml" and place these parameters replacing client_id and client_secret with your google API console credentials:
    ```
    oauth_callback_url: "https://localhost:443/hub/oauth_callback"    
    oauth_client_id: ""
    oauth_client_secret: ""
    ```
   Make sure your google API credentials has the callback url authorized
    
2. Setup ego secrets
    - Make the file "~/secrets/ego.yml" and place these parameters replacing ego_user_email with the google email you wish to use for oauth2 login into jupyter:          
      ```            
      ego_base_url: 'http://api:8081'
      ego_client_id:    'jupyter'
      ego_client_secret: 'jupyter' 
      ego_policy: 'egoAccess'
      ego_client_scope: '{{ego_policy}}.READ'      
      ego_user_email: ''
      ego_local_port: 8080
      ```  
         
3. Run `ansible-playbook build-local.yml`, and wait for it to finish installing.

4. Go to https://localhost:443/hub/login in your web browser, authenticate with Google account (same email as ego_user_email otherwise you will get 403 error) then try out the site.
   - You can also check the ego swaggerUI at http://localhost:8080/swagger-ui.html#!/ or change the port to ego_local_port 

