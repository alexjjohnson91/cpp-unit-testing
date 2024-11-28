# Define variables
CPP = g++
CFLAGS = -Wall -Wextra -O2
SRC_DIR = src
OBJ_DIR = obj
BIN_DIR = bin
TARGET = $(BIN_DIR)/my_program

# Find all source files
SRCS = $(wildcard $(SRC_DIR)/*.cpp)

# Generate object file names from source files
OBJS = $(patsubst $(SRC_DIR)/%.cpp, $(OBJ_DIR)/%.o, $(SRCS))

all: $(TARGET)

run: $(TARGET)
	$(TARGET)

# Link the final executable
$(TARGET): $(OBJS)
	@mkdir -p $(BIN_DIR)
	$(CPP) -o $@ $^

# Compile source files to object files
$(OBJS): $(SRCS)
	@mkdir -p $(OBJ_DIR)
	$(CPP) $(CFLAGS) -c -o $@ $<

# Clean up build artifacts
clean:
	rm -rf $(OBJ_DIR) $(BIN_DIR)

# Phony targets
.PHONY: all clean


