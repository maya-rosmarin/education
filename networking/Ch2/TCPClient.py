from socket import *


def tcp_client():
    server_name = 'localhost'
    server_port = 12000
    client_socket = socket(AF_INET, SOCK_STREAM)
    client_socket.connect((server_name, server_port))
    sentence = bytes(input('Input lowercase sentence:'), 'utf-8')
    client_socket.send(sentence)
    modified_sentence = client_socket.recv(1024)
    print('From Server:', modified_sentence)
    client_socket.close()


if __name__ == "__main__":
    tcp_client()