# SQL solution for transposing rows from a column

Let us assume that we have a table just like below:
| number_row | recipe | id |
|-----------|-----------|-----------|
| 1 | Name: Scrambled eggs |  |
| 2 | 1. Eggs |  |
| 3 | 2. Clarified butter |  |
| 4 | 3. Pepper |  |
| 5 | Name: Potato dumplings |  |
| 6 | 1. Cooked potatos |  |
| 7 | 2. Egg |  |
| 8 | 3. Flour |  |

We want to have a name of the recipe and each ingredient in separate columns - new recipe, new row.
