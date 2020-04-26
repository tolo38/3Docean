##############################################################
#################### LIB LOCATION ############################
GOOGLE_TEST_LIB = gtest
GOOGLE_TEST_INCLUDE = /usr/include/gtest

###################### OPTIONS ###############################
TARGET = proj
TARGET_T = proj-test

SRC_DIR   = src
INC_DIR   = src
TEST_DIR  = test
BUILD_DIR = build
BIN_DIR   = bin

CXX = g++
DEBUG = -g -Wall
CXX_FLAGS = -c $(DEBUG) -std=c++11 -I $(INC_DIR)
CXX_FLAGS_T = $(CXX_FLAGS) -I $(GOOGLE_TEST_INCLUDE)
LD_FLAGS =
#LD_FLAGS_T = $(LD_FLAGS) -l $(GOOGLE_TEST_LIB) -l pthread
LD_FLAGS_T = $(LD_FLAGS)-L /usr/local/lib -l $(GOOGLE_TEST_LIB) -l pthread

###################### AUTO SET VAR ##########################

SRC = $(wildcard $(SRC_DIR)/*.cpp)
OBJ = $(patsubst $(SRC_DIR)/%.cpp,$(BUILD_DIR)/%.o,$(SRC))
BIN = $(addprefix $(BIN_DIR)/, $(TARGET))

INC = $(wildcard $(INC_DIR)/*.hpp)
SRC_T = $(wildcard $(TEST_DIR)/*.cpp)
OBJ_T = $(patsubst $(TEST_DIR)/%.cpp,$(BUILD_DIR)/%.o,$(SRC_T))\
	$(patsubst $(INC_DIR)/%.hpp,$(BUILD_DIR)/%.o,$(INC))
BIN_T = $(addprefix $(BIN_DIR)/, $(TARGET_T))

######################## RULES ###############################
# entry point
default: help proj 
help:
	@echo "Call Default command :"
	@echo "    \$make proj "
	@echo "  Other command available:"
	@echo "    make test"
	@echo "    make clean"
	@echo "    make help"
	@echo "    make -n [rundown]"
	@echo ""
debug:
	@echo "src : " $(SRC) 
	@echo "obj : " $(OBJ) 
	@echo "bin : " $(BIN) 
	@echo "" 
	@echo "src : " $(SRC_T) 
	@echo "obj : " $(OBJ_T) 
	@echo "bin : " $(BIN_T) 

proj: make_dir $(BIN)

test: make_dir $(BIN_T)

$(BIN): $(OBJ)
	$(CXX) -o $@ $^ $(LD_FLAGS)

$(BUILD_DIR)/%.o : $(SRC_DIR)/%.cpp 
	$(CXX) $(CXX_FLAGS) -o $@ $< 

$(BIN_T): $(OBJ_T) 
	$(CXX) -o $@ $^ $(LD_FLAGS_T)

#$(OBJ_T): $(SRC_T) #CAUTION: DOES NOT WORK
$(BUILD_DIR)/%.o : $(TEST_DIR)/%.cpp 
	$(CXX) $(CXX_FLAGS_T) -o $@ $< 

make_dir:
	@mkdir -p $(BUILD_DIR)
	@mkdir -p $(BIN_DIR)

clean:
	@rm -f  $(BUILD_DIR)/*.o
	@rm -rf $(BUILD_DIR)

.PHONY: all clean
