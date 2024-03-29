function add_rules() {
    echo -e "OBJ\t=\t\$(SRC:.c=.o)" >> "$1/Makefile"
    echo -e "\nall:\t\$(NAME)\n" >> "$1/Makefile"
    echo -e "\$(NAME):\t\$(OBJ)" >> "$1/Makefile"
    echo -e "\t\t\$(CC) -o \$(NAME) \$(OBJ) \$(CFLAGS) \$(LDFLAGS) \$(CPPFLAGS)\n" >> "$1/Makefile"
    echo -e "clean:" >> "$1/Makefile"
    echo -e "\trm -f \$(OBJ)\n" >> "$1/Makefile"
    echo -e "fclean:\tclean" >> "$1/Makefile"
    echo -e "\trm -f \$(NAME)" >> "$1/Makefile"
    echo -e "\trm -f *.gcno\n" >> "$1/Makefile"
    echo -e "re:\t fclean" >> "$1/Makefile"
    echo -e "\tmake all\n" >> "$1/Makefile"
    echo -e "archive:" >> "$1/Makefile"
    echo -e "\t\$(ZIP) \$(ZIPFLAGS) \$(BCK_DIR)save_\$(shell cat .version | grep 1 | wc -m).\$(ZIP) \$(SRC)" >> "$1/Makefile"
    echo -e "\t@echo '\$(BCK_DIR)save_\$(shell cat .version | grep 1 | wc -m).\$(ZIP) file generated'" >> "$1/Makefile"
    echo -e "\t@echo -e 'save_\$(shell cat .version | grep 1 | wc -m).\$(ZIP)' >> .version_name" >> "$1/Makefile"
    echo -e "\t@echo -n 1 >> .version\n" >> "$1/Makefile"
    echo -e "revert:" >> "$1/Makefile"
    echo -e "\t\$(UNZIP) \$(UNZIPFLAGS) \$(BCK_DIR)\$(shell cat .version_name | tail -n 1)" >> "$1/Makefile"
    echo -e "\t@make --silent delete\n" >> "$1/Makefile"
    echo -e "delete:" >> "$1/Makefile" >> "$1/Makefile"
    echo -e "\t@rm -f \$(BCK_DIR)\$(shell cat .version_name | tail -n 1)" >> "$1/Makefile"
    echo -e "\t@truncate -s-1 .version" >> "$1/Makefile"
    echo -e "\t@sed -i '\$\$\$ d' .version_name\n" >> "$1/Makefile"
    echo -e "num:" >> "$1/Makefile" >> "$1/Makefile"
    echo -e "\t@cat .version | head -n 1 | wc -m\n" >> "$1/Makefile"
    echo -e ".PHONY\t=\tall clean fclean re" >> "$1/Makefile"
}