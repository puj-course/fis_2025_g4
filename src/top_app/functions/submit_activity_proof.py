import logging
import traceback
import json
from firebase_admin import firestore
import google.cloud.firestore

logger = logging.getLogger(__name__)

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