## SQL Pre-Production Checklist

This document contains a checklist that I use as an additional review before submitting more complex SQL code.

It is not intended to be used for every simple query. It is meant to help with the final review of the code, especially when the query is more complex.

---

## Result

* [ ] Is the number of returned records as expected?
* [ ] Are there any unintended duplicate records?
* [ ] Are the values in numeric columns correct?
* [ ] Are calculated values and sums as expected?
* [ ] Does each column contain the expected data?
* [ ] Are column names clear and meaningful?

---

## Query Logic

* [ ] Do `where`, `join` and `having` conditions include the expected data and avoid excluding data by mistake?
* [ ] Does `group by` contain only the required columns?

---

## Final Review

* [ ] Have I removed elements used only for testing the query?
* [ ] Is the code consistent with my SQL formatting standards?
* [ ] Are object and column names consistent with my naming conventions?