#include "monty.h"
/**
 * setQueueMode - Sets the stack to queue mode (FIFO).
 * @head: A pointer to the stack's head
 * @counter: The line number
 * Return: No return value
*/
void setQueueMode(stack_t **head, unsigned int counter)
{
	(void)head;
	(void)counter;
	bus.lifi = 1;
}

/**
 * addToQueue -  Adds a new node to the tail of the queue.
 * @n: The new value to be added to the queue.
 * @head: A pointer to be added to the queue.
 * Return: no return
*/
void addToQueue(stack_t **head, int n)
{
	stack_t *new_node, *aux;

	aux = *head;
	new_node = malloc(sizeof(stack_t));
	if (new_node == NULL)
	{
		printf("Error\n");
	}
	new_node->n = n;
	new_node->next = NULL;
	if (aux)
	{
		while (aux->next)
			aux = aux->next;
	}
	if (!aux)
	{
		*head = new_node;
		new_node->prev = NULL;
	}
	else
	{
		aux->next = new_node;
		new_node->prev = aux;
	}
}
