CC=gcc
CFLAGS=-Wall -g

CLIENT_TARGET=client
SERVER_TARGET=server

CLIENT_SOURCES=$(./code)/client.c
SERVER_SOURCES=$(./code)/server.c

CLIENT_OBJECTS=$(CLIENT_SOURCES:.c=.o)
SERVER_OBJECTS=$(SERVER_SOURCES:.c=.o)

all: $(CLIENT_TARGET) $(SERVER_TARGET)

$(CLIENT_TARGET): $(CLIENT_OBJECTS)
	$(CC) $(CFLAGS) -o $@ $^

$(SERVER_TARGET): $(SERVER_OBJECTS)
	$(CC) $(CFLAGS) -o $@ $^

$(./code)/%.o: $(./code)/%.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(CLIENT_TARGET) $(SERVER_OBJECTS) $(SERVER_TARGET) $(CLIENT_OBJECTS)
