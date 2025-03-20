# Welcome to Cloud Functions for Firebase for Python!
# To get started, simply uncomment the below code or create your own.
# Deploy with `firebase deploy`

from firebase_functions import https_fn
from firebase_admin import firestore, initialize_app, credentials
import os

os.environ["GOOGLE_APPLICATION_CREDENTIALS"] = "./keys/service-account-key.json"
cred_path = os.getenv('GOOGLE_APPLICATION_CREDENTIALS')
cred = credentials.Certificate(cred_path)
initialize_app(cred)
db = firestore.client()


@https_fn.on_request()
def get_user_sign_up_rank(req):
    data = req.data

    # Ensure 'signUpSeconds' is provided
    if 'signUpSeconds' not in data:
        return { 'error': 'signUpSeconds is required.' }
    
    sign_up_seconds = data['signUpSeconds']

    # Fetch all users ordered by 'signUpSeconds'
    users_ref = db.collection('users').order_by('signUpSeconds', direction=firestore.Query.ASCENDING).stream()

    # Extract and sort the 'signUpSeconds' values
    sorted_seconds = [user.to_dict().get('signUpSeconds') for user in users_ref]

    # Calculate the user's rank
    rank = next((i + 1 for i, seconds in enumerate(sorted_seconds) if sign_up_seconds <= seconds), len(sorted_seconds) + 1)

    # Return the rank
    return { 'rank': rank }
