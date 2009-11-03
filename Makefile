
SRC=main.cpp \
	tongseng.cpp \
	TUIO/TuioServer.cpp \
	TUIO/TuioTime.cpp \
	oscpack/ip/posix/NetworkingUtils.cpp \
	oscpack/ip/posix/UdpSocket.cpp \
	oscpack/osc/OscOutboundPacketStream.cpp \
	oscpack/osc/OscTypes.cpp

OBJS=$(SRC:.cpp=.o)
CPPFLAGS=-ITUIO -Ioscpack -m32
LIBS=-F/System/Library/PrivateFrameworks -framework MultitouchSupport -m32
BIN=tongseng

all : $(BIN)

.cpp.o :
	g++ -c $(CPPFLAGS) $< -o $@

$(BIN) : $(OBJS)
	g++ -o $@ $(LIBS) $^

clean :
	rm -f $(BIN) $(OBJS)

