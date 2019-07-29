import requests
import json
from rauth import OAuth2Service

class EgoException(Exception):
    def __init__(self, status_code, message):
        self.status_code = status_code
        self.message = message


class EgoClient:
    def __init__(self, client_id, client_secret, base_url, name='test'):
        self.access_token = None
        self.base_url = base_url

        self.service = OAuth2Service(
            name=name,
            client_id=client_id,
            client_secret=client_secret,
            access_token_url=base_url + "/oauth/token"
        )

    def getAccessToken(self, data={'grant_type': 'client_credentials'}):
        # add check for whether token is expired
        if (self.access_token == None):
            self.access_token = self.service.get_auth_session(data=data, decoder=json.loads).access_token

        return self.access_token

    def get(self, endpoint):
        return requests.get(
            self.base_url + endpoint,
            headers={
                "Accept": "*/*",
                "Authorization": "Bearer " + self.getAccessToken()
            })

    def check_user_scope(self, userEmail='', scope="precious.READ"):        
        response = self.get("/o/scopes?userName=" + userEmail)
        
        try:
            if not (scope in response.json()["scopes"]):
                raise EgoException(response.status_code, "User not in scope")
        except:
            raise EgoException(response.status_code, "Ego Error")     
        


   