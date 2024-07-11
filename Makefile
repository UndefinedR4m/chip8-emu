PROGRAM_NAME := chip8.x86

CC           := gcc
SRC_DIR      := ./src
INC_DIR      := ./include
BUILD_DIR    := ./build
CFLAGS       :=  -I$(INC_DIR) -std=c99 -Wall -Wextra -Werror $(SDL_CFLAGS)
LDFLAGS      := $(SDL_LDFLAGS)

all: program

program: $(BUILD_DIR)/*.o
	$(CC) $<  -o $(BUILD_DIR)/$(PROGRAM_NAME)

$(BUILD_DIR)/%.o: $(SRC_DIR)/%.c build
	$(CC) $(CFLAGS) -c $< -o $@

build:
	mkdir -p $(BUILD_DIR)

clean:
	rm -rf $(BUILD_DIR)