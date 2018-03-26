# Default
all: make_vtx

# Clean
clean:
	rm make_vtx

# Compile root
make_vtx: make_vtx.cc
	g++ -o make_vtx make_vtx.cc `root-config --cflags --glibs`

