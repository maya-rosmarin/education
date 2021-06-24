from socket import *


def udp_client():
    server_name = 'localhost'
    server_port = 12000
    client_socket = socket(AF_INET, SOCK_DGRAM)
    message = bytes(input('Input lowercase sentence:'), 'utf8')
    client_socket.sendto(message, (server_name, server_port))
    modified_message, server_address = client_socket.recvfrom(2048)
    print(modified_message)
    client_socket.close()


if __name__ == "__main__":
    udp_client()