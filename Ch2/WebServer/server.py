import json
from socket import *


def serve():
    with socket(AF_INET, SOCK_STREAM) as server_socket:
        rcode = listen(server_socket)
        if rcode != 0:
            print('error processing request')


def listen(server_socket):
    server_socket.bind(('', 12000))
    server_socket.listen(1)

    while True:
        connection, address = server_socket.accept()
        req = connection.recv(2048)
        if not req:
            return 1
        res, rcode = parse(req)
        if rcode != 0:
            return rcode

        connection.send(res)
    return 0


def parse(req):
    payload = json.loads(req)
    file_name = payload['url']
    try:
        file_obj = open(file_name, 'r')
        contents = file_obj.read()
        return bytes(contents, encoding='utf-8'), 0

    except IOError:
        return None, 1
    finally:
        file_obj.close()

if __name__ == '__main__':
    serve()
