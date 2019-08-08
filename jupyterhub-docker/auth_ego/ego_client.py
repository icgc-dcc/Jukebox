import requests
import json
from rauth import OAuth2Service

class EgoException(Exception):
    def __init__(self, status_code, message):
        self.status_code = status_code
        self.message = message


class EgoClient:
    def __init__(self, client_id, client_secret, token_url, scope_url, name='test'):
        self.access_token = None
        self.scope_url = scope_url

        self.service = OAuth2Service(
            name=name,
            client_id=client_id,
            client_secret=client_secret,
            access_token_url=token_url
        )

    def check_user_scope(self, userEmail='', scope="collab.READ"):     
        data={'grant_type': 'client_credentials'}
        session = self.service.get_auth_session(data=data, decoder=json.loads)
        response = session.get(self.scope_url + userEmail)
        
        try:
            if not (scope in response.json()["scopes"]):
                raise EgoException(response.status_code, "User not in scope")
        except:
            raise EgoException(response.status_code, "Ego Error")     
        


   