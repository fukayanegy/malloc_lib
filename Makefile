# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: etakaham <etakaham@student.42tokyo.jp>     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/05/26 19:51:15 by etakaham          #+#    #+#              #
#    Updated: 2024/05/26 19:51:15 by etakaham         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

.PHONY: all fclean re clean

NAME	= malloc_lib.a
CC		= CC
CFLAGS	= -Wall -Wextra -Werror
SRCS	= ft_calloc.c ft_exit.c ft_free.c ft_malloc.c ft_realloc.c malloc_end.c malloc_startup.c
OBJS	= $(SRCS:.c=.o)

Y = "\033[33m"
R = "\033[31m"
G = "\033[32m"
B = "\033[34m"
X = "\033[0m"
UP = "\033[A"
CUT = "\033[K"

all:$(NAME)

%.o : %.c
	@echo $(Y)Compiling [$<]...$(X)
	@$(CC) $(CFLAGS) -c $< -o $@
	@printf $(UP)$(CUT)

$(NAME):$(OBJS)

	@echo $(Y)Compiling [$(CFILES)]...$(X)
	@echo $(G)Finished [$(CFILES)]$(X)
	@echo
	@echo $(Y)Compiling [$(NAME)]...$(X)
	@ar rcs $(NAME) $(OBJS)
	@echo $(G)Finished [$(NAME)]$(X)

clean:
	@rm -f $(OBJS)
	@echo $(R)Removed [$(OBJECTS)]$(X)

fclean: clean
	@rm -f $(NAME)
	@echo $(R)Removed [$(NAME)]$(X)

re: fclean all
