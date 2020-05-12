/* <IMPLICT_TRANSACTIONS> */

-- (+) statements, statements_other, transactions and transactions_commit
DROP TABLE IF EXISTS test;

-- (+) statements, statements_other, transactions and transactions_commit
CREATE TABLE test();

-- (+) statements, statements_other, transactions and transactions_commit
ALTER TABLE test
  ADD COLUMN f1 BIGSERIAL;

-- (+) statements, statements_other, transactions and transactions_commit
ALTER TABLE test
  ADD COLUMN f2 VARCHAR(100),
  ADD COLUMN f3 TIMESTAMP;

-- (+) statements, statements_insert, transactions and transactions_commit
INSERT INTO test (f2, f3)
  VALUES ('Name 1', now());

-- (+) statements, statements_insert, transactions and transactions_commit
INSERT INTO test (f2, f3)
  VALUES ('Name 2', now()), ('Name 3', now());

-- (+) statements, statements_update, transactions and transactions_commit
UPDATE test SET f2 = 'XXXX' WHERE f1 = 1;
 
-- (+) statements, statements_update, transactions and transactions_commit
UPDATE test SET f2 = 'XXXX';

-- (+) statements, statements_select, transactions and transactions_commit
SELECT * FROM test WHERE f1 = 1;

-- (+) statements, statements_select, transactions and transactions_commit
SELECT * FROM test;

-- (+) statements, statements_delete, transactions and transactions_commit
DELETE FROM test WHERE f1 = 1;

-- (+) statements, statements_delete, transactions and transactions_commit
DELETE FROM test;

/* </IMPLICT_TRANSACTIONS> */
