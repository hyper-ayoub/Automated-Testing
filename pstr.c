#include "monty.h"
/**
 * print_char - Prints the string starting at the top of the stack
 * followed by a new
 * @head: A pointer to stack's head
 * @counter: then line number
 * Return: No return value
*/
void print_char(stack_t **head, unsigned int counter)
{
	stack_t *h;
	(void)counter;

	h = *head;
	while (h)
	{
		if (h->n > 127 || h->n <= 0)
		{
			break;
		}
		printf("%c", h->n);
		h = h->next;
	}
	printf("\n");
}
