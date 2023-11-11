import boto3
from botocore.exceptions import NoCredentialsError
import hmac
import hashlib
import base64
import os

def lambda_handler(event, context):
    cpf = event['cpf']  # CPF fornecido pelo usuário

    CLIENT_ID = os.environ["CLIENT_ID"]
    CLIENT_SECRET = os.environ["CLIENT_SECRET"]
    POOL_ID = os.environ["POOL_ID"]
    REGION = os.environ["REGION"]

    try:
        cognito = boto3.client('cognito-idp', region_name=REGION)

        # Calcula o SECRET_HASH
        secret_hash = calculate_secret_hash(CLIENT_ID, CLIENT_SECRET, cpf)

        # Parâmetros de autenticação
        auth_params = {
            'USERNAME': cpf,
            'SECRET_HASH': secret_hash
        }
        

        # Solicita a autenticação usando AdminInitiateAuth
        auth_request = {
            'AuthFlow': 'CUSTOM_AUTH',
            'ClientId': CLIENT_ID,
            'UserPoolId': POOL_ID,
            'AuthParameters': auth_params
        }
        
        auth_response = cognito.admin_initiate_auth(**auth_request)

        # Obter tokens de autenticação
        access_token = auth_response['AuthenticationResult']['AccessToken']
        id_token = auth_response['AuthenticationResult']['IdToken']

        return {
            'statusCode': 200,
            'body': {
                'accessToken': access_token,
                'idToken': id_token
            }
        }

    except Exception as e:
        tipo_de_excecao = type(e).__name__
        return {
            'statusCode': 500,
            'message': cpf,
            'body': str(e),
            "exception_type": tipo_de_excecao
        }

def calculate_secret_hash(client_id, client_secret, cpf):
    message = cpf + client_id
    dig = hmac.new(str(client_secret).encode('utf-8'),
                   msg=str(message).encode('utf-8'), digestmod=hashlib.sha256).digest()
    secret_hash = base64.b64encode(dig).decode()
    return secret_hash
