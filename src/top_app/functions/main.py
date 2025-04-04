# Welcome to Cloud Functions for Firebase for Python!
# To get started, simply uncomment the below code or create your own.
# Deploy with `firebase deploy`

# The Cloud Functions for Firebase SDK to create Cloud Functions and set up triggers.
from firebase_functions import https_fn

# The Firebase Admin SDK to access Cloud Firestore.
from firebase_admin import initialize_app, firestore
import google.cloud.firestore
import logging
import traceback
import json

# Configure logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

# Initialize Firebase
try:
    app = initialize_app()
    logger.info("Firebase initialized successfully")
except Exception as e:
    logger.error(f"Error initializing Firebase: {str(e)}")
    logger.error(traceback.format_exc())
    raise

@https_fn.on_request()
def get_user_sign_up_rank(req: https_fn.Request) -> https_fn.Response:
    """
    Cloud function to get a user's signup rank based on their signup timestamp.
    
    This function expects a POST request with JSON body containing:
    {
        "signUpSeconds": 1234567890
    }
    """
    try:
        # Get JSON data from request
        request_json = req.get_json(silent=True)
        
        if not request_json or 'signUpSeconds' not in request_json:
            error_response = json.dumps({'error': 'signUpSeconds is required'})
            return https_fn.Response(error_response, status=400, 
                                     content_type='application/json')
        
        sign_up_seconds = request_json['signUpSeconds']
        logger.info(f"Processing request for signUpSeconds: {sign_up_seconds}")
        
        # Get Firestore client
        firestore_client: google.cloud.firestore.Client = firestore.client()
        
        try:
            # Query users with signUp time less than or equal to the target
            query = firestore_client.collection('users').where('signUpSeconds', '<=', sign_up_seconds)
            users = list(query.stream())
            rank = len(users)
            
            logger.info(f"Calculated rank: {rank}")
            
            # Return the result as an HTTP response
            response_data = json.dumps({'rank': rank})
            return https_fn.Response(response_data, status=200, 
                                     content_type='application/json')
            
        except Exception as db_error:
            error_msg = f"Database error: {str(db_error)}"
            logger.error(error_msg)
            logger.error(traceback.format_exc())
            error_response = json.dumps({'error': error_msg})
            return https_fn.Response(error_response, status=500, 
                                     content_type='application/json')
        
    except Exception as e:
        error_msg = f"Unexpected error: {str(e)}"
        logger.error(error_msg)
        logger.error(traceback.format_exc())
        error_response = json.dumps({'error': error_msg})
        return https_fn.Response(error_response, status=500, 
                                 content_type='application/json')
