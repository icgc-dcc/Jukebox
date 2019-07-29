import subprocess
from traitlets import Unicode
from tornado import gen
from tornado.web import HTTPError
from oauthenticator.ego_client import EgoClient, EgoException
from oauthenticator.google import GoogleOAuthenticator

def log(msg, *args):
    subprocess.run(['logger',msg.format(*args)])

class EgoOAuthenticator(GoogleOAuthenticator):
    ego_base_url = Unicode(config=True)
    ego_client_id = Unicode(config=True)
    ego_client_secret = Unicode(config=True)
    ego_client_scope = Unicode(config=True)


    @gen.coroutine
    def authenticate(self, handler, data=None):
        # Google authentication either succeeds or throws an exception
        auth= yield super().authenticate(handler, data)
        
        email = auth['name']

        self.egoClient = EgoClient(
                    client_id       = self.ego_client_id,
                    client_secret   = self.ego_client_secret,
                    base_url        = self.ego_base_url)

        try:
            self.egoClient.check_user_scope(email, self.ego_client_scope)
        except EgoException:
            raise HTTPError(403, "User '{}' does not have Ego authorization".format(email))

        log("Returning auth='{}'", auth)
        return auth