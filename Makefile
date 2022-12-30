NAME = gameoflife
CC = gcc
RM = rm -f
CFLAGS =	-Werror -Wextra -Wall -std=c99 -O0 -g
SRCS =		$(addprefix src/,	grid_operation.c \
		display.c \
		is_alive.c \
		main.c \
		init.c \
		game.c \
		SDL.c \
		checks.c)
OBJS =		${SRCS:.c=.o}

all: ${NAME}

.c.o:
	${CC} ${CFLAGS} -Iinclude/ -c $< -o ${<:.c=.o}

${NAME}: ${OBJS}
	${CC} ${CFLAGS} -o ${NAME} ${OBJS} $$(sdl2-config --cflags --libs)

clean:
	${RM} ${OBJS} ${OBJSBONUS}

fclean: clean
	${RM} ${NAME}

re: fclean all

.PHONY: all clean fclean re

