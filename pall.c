#include "monty.h"
/**
 * print_pull - Print the elements of the stack's
 * @head: A pointer of the stack's head
 * @counter: Unused
 * Return: No return value
 */
void print_pull(stack_t **head, unsigned int counter)
{
	stack_t *h;
	(void)counter;

	h = *head;
	if (h == NULL)
		return;
	while (h)
	{
		printf("%d\n", h->n);
		h = h->next;
	}
}
