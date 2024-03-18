##
## EPITECH PROJECT, 2023
## wolfram
## File description:
## Makefile
##

BINARY_PATH = $(shell stack path --local-install-root)
TEST_SRC = $(wildcard src/*.hs app/*.hs)
NAME = imageCompressor

MSG = ""
FILES_TO_PUSH = ""
TEST_FILE = ""

all :
	@stack build
	@cp $(BINARY_PATH)/bin/$(NAME)-exe $(NAME)

clean :
	@echo -e "\n\033[1;35m\tC L E A N I N G   P R O J E C T\033[0m\n"
	@stack clean
	@rm -f test_exec
	@rm -f src/*.o
	@rm -f src/*.hi
	@rm -f app/*.o
	@rm -f app/*.hi
	@rm -f *.a

test : all
	@echo -e "\n\033[1;35m\tT E S T I N G   P R O J E C T\033[0m\n"
	@read -p "Files to test: " TEST_FILE; \
	clear; \
	./$(NAME) -n 3 -f testFiles/$$TEST_FILE.txt -l 0.7 > output/myResult.txt; \
	./xpmlmg -n 3 -f testFiles/$$TEST_FILE.txt -l 0.7 > output/xpmlmgResult.txt; \
	diff output/myResult.txt output/xpmlmgResult.txt

fclean : clean
	@rm -f $(NAME)
	@echo -e "\n\033[1;35m\tB I N A R Y   R E M O V E D\033[0m\n"

cs : fclean
	@coding-style . .
	@clear
	@echo -e "\n\033[1;35m\tC O D I N G   S T Y L E\033[0m\n"
	@cat coding-style-reports.log
	@rm -f coding-style-reports.log

allCommit : fclean
	@git add -A
	@clear
	@echo -e "\033[1;35mC O M M I T   M E S S A G E\033[0m\n\n"
	@read -p "--> " MSG; \
	git commit -m "$$MSG" && \
	git push origin main
	@clear
	@echo -e "\n\033[1;35m\tP R O J E C T   P U S H E D\033[0m\n"

safeCommit : fclean
	@make
	if [ $$? -ne 0 ]; then \
		echo -e "\n\033[1;35m\D I D N ' T   C O M P I L E\033[0m\n"; \
		clear; \
		exit 84; \
	fi
	@clear
	@git status
	@echo -e "\n"
	@echo -e "\033[1;35mF I L E S   T O   P U S H\033[0m\n\n"
	@read -p "--> " FILES_TO_PUSH; \
	git add $$FILES_TO_PUSH
	@clear
	@echo -e "\033[1;35mC O M M I T   M E S S A G E\033[0m\n\n"
	@read -p "--> " MSG; \
	git commit -m "$$MSG" && \
	git push origin main
	@clear
	@echo -e "\n\033[1;35m\tP R O J E C T   P U S H E D\033[0m\n"

re : fclean all
	@stack build
	@cp $(BINARY_PATH)/bin/$(NAME)-exe $(NAME)
	@echo -e "\n\033[1;35m\tP R O J E C T   R E C O M P I L E D\033[0m\n"

.PHONY : all clean fclean re
