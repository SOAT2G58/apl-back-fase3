def lambda_handler(event, context):
    # apenas retornando sucesso, sem necessidade de tratar
    event['response']['issueTokens'] = True
    event['response']['failAuthentication'] = False
    return event
