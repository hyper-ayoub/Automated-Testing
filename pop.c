#include "monty.h"
/**
 * custom_print_function - Prints the top element of the stack
 * @head: A pointer of the stack's head
 * @counter: The line number
 * Return: No return value
*/
void custom_print_function(stack_t **head, unsigned int counter)
{
	stack_t *h;

	if (*head == NULL)
	{
		fprintf(stderr, "L%d: can't pop an empty stack\n", counter);
		fclose(bus.file);
		free(bus.content);
		free_stack(*head);
		exit(EXIT_FAILURE);
	}
	h = *head;
	*head = h->next;
	free(h);
}
