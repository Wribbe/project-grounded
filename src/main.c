#include <stdlib.h>
#include <stdio.h>

#include <sys/socket.h>
#include <sys/un.h>
#include <errno.h>

int
main(void)
{
  int fd_socket = socket(AF_UNIX, SOCK_STREAM, 0);
  struct sockaddr_un srv_addr = {
    .sun_family = AF_UNIX,
    .sun_path = "/tmp/.X11-unix/X0",
  };

  int result = 0;

  result = connect(
    fd_socket,
    (const struct sockaddr *) &srv_addr,
    sizeof(struct sockaddr_un)
  );

  if (result == -1) {
    fprintf(
      stderr,
      "Failed to connect to %s with %s.\n",
      srv_addr.sun_path,
      strerror(errno)
    );
    exit(EXIT_FAILURE);
  }
}
