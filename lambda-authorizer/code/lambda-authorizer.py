import jwt
from aws_jwt_verify import CognitoJwtVerifier
import os

def lambda_handler(event, context):
    token = event['authorization']

    try:
        decoded = jwt.decode(token, verify=False)

        if decoded.get('payload', {}).get('iss') == 'anonymous-token':
            secret = os.environ["SECRET_KEY_JWT"]
            verified = jwt.decode(token, secret)

            if verified['sub'] == 'anonymoussub':
                return {
                    'statusCode': 200,
                    'body': {'message': 'Token JWT válido.'}
                }
            else:
                return {
                    'statusCode': 401,
                    'body': {'message': 'Token JWT inválido ou expirado.'}
                }
        else:
            CLIENT_ID = os.environ["CLIENT_ID"]
            POOL_ID = os.environ["POOL_ID"]
            verifier = CognitoJwtVerifier.create(
                user_pool_id=POOL_ID,
                token_use="access",
                client_id=CLIENT_ID
            )

            verifier.verify(token)

            return {
                'statusCode': 200,
                'body': {'message': 'Token JWT válido.'}
            }
    except jwt.ExpiredSignatureError:
        return {
            'statusCode': 401,
            'body': {'message': 'Token JWT expirado.'}
        }
    except jwt.DecodeError:
        return {
            'statusCode': 401,
            'body': {'message': 'Token JWT inválido.'}
        }
