#ifndef MONTY_H
#define MONTY_H
#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <unistd.h>
#include <fcntl.h>
#include <string.h>
#include <ctype.h>
/**
 * struct stack_s - doubly linked list representation of a stack (or queue)
 * @n: integer
 * @prev: points to the previous element of the stack (or queue)
 * @next: points to the next element of the stack (or queue)
 *
 * Description: doubly linked list node structure
 * for stack, queues, LIFO, FIFO Holberton project
 */
typedef struct stack_s
{
	int n;
	struct stack_s *prev;
	struct stack_s *next;
} stack_t;
/**
 * struct bus_s - variables -args, file, line content
 * @arg: value
 * @file: pointer to monty file
 * @content: line content
 * @lifi: flag change stack <-> queue
 * Description: carries values through the program
 */
typedef struct bus_s
{
	char *arg;
	FILE *file;
	char *content;
	int lifi;
}  bus_t;
extern bus_t bus;
/**
 * struct instruction_s - opcode and its function
 * @opcode: the opcode
 * @f: function to handle the opcode
 *
 * Description: opcode and its function
 * for stack, queues, LIFO, FIFO Holberton project
 */
typedef struct instruction_s
{
	char *opcode;
	void (*f)(stack_t **stack, unsigned int line_number);
} instruction_t;
char *_realloc(char *ptr, unsigned int old_size, unsigned int new_size);
ssize_t getstdin(char **lineptr, int file);
char  *clean_line(char *content);
void add_node_from_stack(stack_t **head, unsigned int number);
void print_pull(stack_t **head, unsigned int number);
void print_top_elemnt(stack_t **head, unsigned int number);
int execute_(char *content, stack_t **head, unsigned int counter, FILE *file);
void free_stack(stack_t *head);
void custom_print_function (stack_t **head, unsigned int counter);
void swap(stack_t **head, unsigned int counter);
void add_top_two_elements(stack_t **head, unsigned int counter);
void do_nothing(stack_t **head, unsigned int counter);
void sub(stack_t **head, unsigned int counter);
void add_node_to_stack(stack_t **head, unsigned int counter);
void multiply_to_two(stack_t **head, unsigned int counter);
void mod_top_two(stack_t **head, unsigned int counter);
void print_char(stack_t **head, unsigned int counter);
void print_char(stack_t **head, unsigned int counter);
void rotatestack(stack_t **head, unsigned int counter);
void rotr(stack_t **head, __attribute__((unused)) unsigned int counter);
void add_node(stack_t **head, int n);
void addToQueue(stack_t **head, int n);
void setQueueMode(stack_t **head, unsigned int counter);
void print_stack(stack_t **head, unsigned int counter);

#endif
