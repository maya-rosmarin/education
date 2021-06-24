from socket import *


def tcp_server():
    server_port = 12000
    server_socket = socket(AF_INET, SOCK_STREAM)
    server_socket.bind(('', server_port))
    server_socket.listen(1)
    print('The server is ready to receive')
    while 1:
        connection_socket, addr = server_socket.accept()
        sentence = connection_socket.recv(1024)
        capitalized_sentence = sentence.upper()
        connection_socket.send(capitalized_sentence)
        connection_socket.close()


if __name__ == "__main__":
    tcp_server()