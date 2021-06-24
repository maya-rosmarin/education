from socket import *


def udp_server():
    server_port = 12000
    server_socket = socket(AF_INET, SOCK_DGRAM)
    server_socket.bind(('', server_port))
    print('The server is ready to receive')
    while 1:
        message, client_address = server_socket.recvfrom(2048)
        modified_message = message.upper()
        server_socket.sendto(modified_message, client_address)


if __name__ == "__main__":
    udp_server()