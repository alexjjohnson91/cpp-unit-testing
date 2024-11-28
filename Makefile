# Define variables
CXX = g++
CXXFLAGS = -Wall -Wextra -O2
SRC_DIR = src
TEST_DIR = test
OBJ_DIR = obj
BIN_DIR = bin
TARGET = $(BIN_DIR)/my_program
TEST_TARGET = $(BIN_DIR)/test_runner

# Find all source files
SRCS = $(wildcard $(SRC_DIR)/*.cpp)
TEST_SRCS = $(wildcard $(TEST_DIR)/*.cpp)

# Generate object file names from source files
OBJS = $(patsubst $(SRC_DIR)/%.cpp, $(OBJ_DIR)/%.o, $(SRCS))
TEST_OBJS = $(patsubst $(TEST_DIR)/%.cpp, $(OBJ_DIR)/test_%.o, $(TEST_SRCS))

# Default target
all: $(TARGET)

# Build the main application
$(TARGET): $(OBJS)
	@mkdir -p $(BIN_DIR)
	$(CXX) $(CXXFLAGS) -o $@ $^

# Build the test runner
$(TEST_TARGET): $(OBJS) $(TEST_OBJS)
	@mkdir -p $(BIN_DIR)
	$(CXX) $(CXXFLAGS) -o $@ $(OBJS) $(TEST_OBJS)

# Compile source files to object files
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.cpp
	@mkdir -p $(OBJ_DIR)
	$(CXX) $(CXXFLAGS) -c $< -o $@

$(OBJ_DIR)/test_%.o: $(TEST_DIR)/%.cpp
	@mkdir -p $(OBJ_DIR)
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Run the main program
run: $(TARGET)
	$(TARGET)

# Run the test suite
test: $(TEST_TARGET)
	$(TEST_TARGET)

# Clean up build artifacts
clean:
	rm -rf $(OBJ_DIR) $(BIN_DIR)

# Phony targets
.PHONY: all clean test run

