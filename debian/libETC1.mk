NAME = libETC1
SOURCES = etc1.cpp
SOURCES := $(foreach source, $(SOURCES), opengl/libs/ETC1/$(source))
CXXFLAGS += -fPIC
CPPFLAGS += -Iopengl/include
LDFLAGS += -shared -Wl,-soname,$(NAME).so.0

$(NAME).so.0: $(SOURCES)
	$(CXX) $^ -o $@ $(CXXFLAGS) $(CPPFLAGS) $(LDFLAGS)
	ln -s $(NAME).so.0 $(NAME).so

clean:
	$(RM) $(NAME).so*