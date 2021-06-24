import json
import os
from socket import *


def tcp_client():
    server_name = 'localhost'
    server_port = 12000
    client_socket = socket(AF_INET, SOCK_STREAM)
    client_socket.connect((server_name, server_port))
    file_path = os.path.join(os.getcwd(), 'testing123.txt')
    req = {'method': 'GET', 'url': file_path}
    client_socket.send(json.dumps(req, indent=2).encode('utf-8'))
    res = client_socket.recv(1024)
    print('From Server:', res)
    client_socket.close()


if __name__ == "__main__":
    tcp_client()
