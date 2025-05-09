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
from datetime import datetime
from dateutil import tz

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

def submit_activity_proof_handler(user_id: str, challenge_id: str, activity_id: str, proof: dict) -> dict:
    """
    Handler for submitting an activity proof.
    
    Args:
        user_id: ID of the user
        challenge_id: ID of the challenge
        activity_id: ID of the activity
        proof: The proof data to add
        
    Returns:
        dict: Response containing success status
    """
    try:
        # Get Firestore client
        firestore_client: google.cloud.firestore.Client = firestore.client()
        
        # Get user document
        user_doc = firestore_client.collection('users').document(user_id).get()
        if not user_doc.exists:
            return {'error': 'User not found', 'status': 404}
            
        user_data = user_doc.to_dict()
        challenges = user_data.get('challenges', {})
        
        # Check if challenge exists
        if challenge_id not in challenges:
            return {'error': 'Challenge not found', 'status': 404}
            
        challenge = challenges[challenge_id]
        activities = challenge.get('activities', {})
        
        # Check if activity exists
        if activity_id not in activities:
            return {'error': 'Activity not found', 'status': 404}
            
        activity = activities[activity_id]
        daily_proofs = activity.get('dailyProofs', {})
        
        # Add the proof to dailyProofs using the submittedAt timestamp as key
        proof_date = proof.get('submittedAt')
        if not proof_date:
            return {'error': 'Proof must include submittedAt timestamp', 'status': 400}
            
        daily_proofs[proof_date] = proof
        
        # Update the activity with the new dailyProofs
        activities[activity_id]['dailyProofs'] = daily_proofs
        
        # Update the challenge with the updated activities
        challenges[challenge_id]['activities'] = activities
        
        # Update the user document
        user_doc.reference.update({
            'challenges': challenges
        })
        
        return {'status': 'success', 'message': 'Proof added successfully'}
        
    except Exception as e:
        error_msg = f"Error submitting proof: {str(e)}"
        logger.error(error_msg)
        logger.error(traceback.format_exc())
        return {'error': error_msg, 'status': 500}

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

@https_fn.on_request()
def get_users_with_challenge(req: https_fn.Request) -> https_fn.Response:
    """
    Cloud function to get all users that have a specific challenge in their challenges map.
    
    This function expects a POST request with JSON body containing:
    {
        "challengeId": "challenge123"
    }
    
    Returns a list of maps containing userName and userProfilePictureUrl for each matching user.
    """
    try:
        # Get JSON data from request
        request_json = req.get_json(silent=True)
        
        if not request_json or 'challengeId' not in request_json:
            error_response = json.dumps({'error': 'challengeId is required'})
            return https_fn.Response(error_response, status=400, 
                                     content_type='application/json')
        
        challenge_id = request_json['challengeId']
        logger.info(f"Processing request for challengeId: {challenge_id}")
        
        # Get Firestore client
        firestore_client: google.cloud.firestore.Client = firestore.client()
        
        try:
            # Query users collection
            users_ref = firestore_client.collection('users')
            users = list(users_ref.stream())
            
            # Filter users that have the challenge
            matching_users = []
            for user in users:
                user_data = user.to_dict()
                challenges = user_data.get('challenges', {})
                
                # Check if the challengeId exists in the challenges map
                if challenge_id in challenges:
                    matching_users.append({
                        'userName': user_data.get('name', ''),
                        'userProfilePictureUrl': user_data.get('profilePictureUrl', '')
                    })
            
            logger.info(f"Found {len(matching_users)} users with challenge {challenge_id}")
            
            # Return the result as an HTTP response
            response_data = json.dumps({'users': matching_users})
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

@https_fn.on_request()
def submit_activity_proof(req: https_fn.Request) -> https_fn.Response:
    """
    Cloud function to submit an activity proof.
    
    This function expects a POST request with JSON body containing:
    {
        "userId": "user123",
        "challengeId": "challenge123",
        "activityId": "activity456",
        "proof": {
            // proof data
        }
    }
    """
    try:
        # Get JSON data from request
        request_json = req.get_json(silent=True)
        
        if not request_json:
            error_response = json.dumps({'error': 'Invalid request body'})
            return https_fn.Response(error_response, status=400, 
                                     content_type='application/json')
        
        required_fields = ['userId', 'challengeId', 'activityId', 'proof']
        missing_fields = [field for field in required_fields if field not in request_json]
        
        if missing_fields:
            error_response = json.dumps({'error': f'Missing required fields: {", ".join(missing_fields)}'})
            return https_fn.Response(error_response, status=400, 
                                     content_type='application/json')
        
        # Call the handler
        result = submit_activity_proof_handler(
            user_id=request_json['userId'],
            challenge_id=request_json['challengeId'],
            activity_id=request_json['activityId'],
            proof=request_json['proof']
        )
        
        # Return the result as an HTTP response
        status_code = result.get('status', 500) if 'error' in result else 200
        return https_fn.Response(json.dumps(result), status=status_code, 
                                 content_type='application/json')
        
    except Exception as e:
        error_msg = f"Unexpected error: {str(e)}"
        logger.error(error_msg)
        logger.error(traceback.format_exc())
        error_response = json.dumps({'error': error_msg})
        return https_fn.Response(error_response, status=500, 
                                 content_type='application/json')

@https_fn.on_request()
def join_challenge(req: https_fn.Request) -> https_fn.Response:
    """
    Cloud function to join a challenge for a user.
    Expects a POST request with JSON body containing:
    {
        "userId": "user123",
        "challengeId": "challenge123"
    }
    Adds the challenge to the user's 'challenges' map with the correct structure.
    """
    try:
        request_json = req.get_json(silent=True)
        if not request_json or 'userId' not in request_json or 'challengeId' not in request_json:
            error_response = json.dumps({'error': 'userId and challengeId are required'})
            return https_fn.Response(error_response, status=400, content_type='application/json')

        user_id = request_json['userId']
        challenge_id = request_json['challengeId']
        logger.info(f"User {user_id} joining challenge {challenge_id}")

        firestore_client: google.cloud.firestore.Client = firestore.client()

        # Get user document
        user_ref = firestore_client.collection('users').document(user_id)
        user_doc = user_ref.get()
        if not user_doc.exists:
            return https_fn.Response(json.dumps({'error': 'User not found'}), status=404, content_type='application/json')
        
        user_data = user_doc.to_dict()
        logger.info(f"User data type: {type(user_data)}")
        logger.info(f"User data: {user_data}")
        
        challenges = user_data.get('challenges', {})
        logger.info(f"Challenges type: {type(challenges)}")
        logger.info(f"Challenges: {challenges}")

        # Check if user already joined the challenge
        if challenge_id in challenges:
            return https_fn.Response(json.dumps({'error': 'User already joined this challenge'}), status=400, content_type='application/json')

        # Get challenge document from 'challenges' collection
        challenge_ref = firestore_client.collection('challenges').document(challenge_id)
        challenge_doc = challenge_ref.get()
        if not challenge_doc.exists:
            return https_fn.Response(json.dumps({'error': 'Challenge not found'}), status=404, content_type='application/json')
        
        challenge_data = challenge_doc.to_dict()
        logger.info(f"Challenge data type: {type(challenge_data)}")
        logger.info(f"Challenge data: {challenge_data}")
        
        activities_map = challenge_data.get('activities', {})
        logger.info(f"Activities map type: {type(activities_map)}")
        logger.info(f"Activities map: {activities_map}")

        # Build activities map for the user
        user_activities_map = {}
        for activity_id, activity in activities_map.items():
            user_activities_map[activity_id] = {
                'currentStreak': 0,
                'bestStreak': 0,
                'completion': 0,
                'dailyProofs': {},
                'activityId': activity_id
            }

        # Get current UTC time in ISO format
        now_utc = datetime.now(tz=tz.UTC).isoformat()

        # Build the challenge entry for the user
        user_challenge_entry = {
            'challengeId': challenge_id,
            'dateStarted': now_utc,
            'currentStreak': 0,
            'bestStreak': 0,
            'completion': 0,
            'activities': user_activities_map
        }

        # Add the challenge to the user's challenges map
        challenges[challenge_id] = user_challenge_entry
        user_ref.update({'challenges': challenges})

        return https_fn.Response(json.dumps({'status': 'success', 'message': 'Challenge joined successfully'}), status=200, content_type='application/json')

    except Exception as e:
        error_msg = f"Error joining challenge: {str(e)}"
        logger.error(error_msg)
        logger.error(traceback.format_exc())
        error_response = json.dumps({'error': error_msg})
        return https_fn.Response(error_response, status=500, content_type='application/json')
