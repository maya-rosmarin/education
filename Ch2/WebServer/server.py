import json
from socket import *


def serve():
    with socket(AF_INET, SOCK_STREAM) as server_socket:
        listen(server_socket)


def listen(server_socket):
    server_socket.bind(('', 12000))
    server_socket.listen(1)

    while True:
        connection, address = server_socket.accept()
        req = connection.recv(2048)
        if not req:
            continue
        body, rcode = parse(req)
        if rcode != 0:
            res = {'status': 404, 'message': 'Not Found', 'body': ''}
            connection.send(json.dumps(res, indent=2).encode('utf-8'))
            continue

        res = {'status': 200, 'message': 'OK', 'body': body}
        connection.send(json.dumps(res, indent=2).encode('utf-8'))
    return 0


def parse(req):
    payload = json.loads(req)
    file_name = payload['url']
    try:
        file_obj = open(file_name, 'r')
        contents = file_obj.read()
        file_obj.close()
        return contents, 0

    except IOError:
        return None, 1

if __name__ == '__main__':
    serve()
