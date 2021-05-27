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
        parse(req)
        print('maya made it here', req)
        connection.send(req)
    return 0


def parse(req):
    

if __name__ == '__main__':
    serve()
