CFLAGS := `root-config --cflags`
LFLAGS := `root-config --libs`

CC := g++

OBJ := $(PWD)/.obj
BIN := $(PWD)/bin

SRC_DIR := $(PWD)
SRC_SRC := $(wildcard $(SRC_DIR)/*.cxx)
SRC_HDR := $(wildcard $(SRC_DIR)/*.h)
SRC_OBJ := $(patsubst $(SRC_DIR)/%.cxx,$(OBJ)/%.o,$(SRC_SRC))

EXE_DIR := $(PWD)
EXE_SRC := $(wildcard $(EXE_DIR)/*.cc)
#EXE_OBJ := $(patsubst $(EXE_DIR)/%.cc,$(OBJ)/%.o,$(EXE_SRC))
EXE_BIN := $(patsubst $(EXE_DIR)/%.cc,$(BIN)/%,$(EXE_SRC))


# Default
all: dir $(SRC_OBJ) $(EXE_BIN)

# Object directory
dir:
	test -d $(OBJ) || mkdir $(OBJ)

# Clean
clean:
	rm -rf $(OBJ)
	rm -f $(EXE_BIN)

$(OBJ)/%.o: $(SRC_DIR)/%.cxx $(SRC_DIR)/%.h
	$(CC) -c $(CFLAGS) -o $@ $<

#$(OBJ)/%.o: $(EXE_DIR)/%.cc
#	$(CC) -c $(CFLAGS) -o $@ $<

# Compile root
#make_vtx: make_vtx.cc
#	g++ -o make_vtx make_vtx.cc `root-config --cflags --glibs`

$(BIN)/%: $(EXE_DIR)/%.cc $(SRC_OBJ)
	$(CC) $(CFLAGS) $(OBJ)/*.o -o $@ $< $(LFLAGS)
