/* <EXPLICT_TRANSACTIONS> */

-- (+) statements, statements_other and transactions
BEGIN;

	-- (+) statements and statements_other
DROP TABLE IF EXISTS test;

-- (+) statements and statements_other
CREATE TABLE test();

-- (+) statements and statements_other
ALTER TABLE test
  ADD COLUMN f1 BIGSERIAL;

-- (+) statements and statements_other
ALTER TABLE test
  ADD COLUMN f2 VARCHAR(100),
  ADD COLUMN f3 TIMESTAMP;

-- (+) statements and statements_insert
INSERT INTO test (f2, f3)
  VALUES ('Name 1', now());

-- (+) statements and statements_insert
INSERT INTO test (f2, f3)
  VALUES ('Name 2', now()), ('Name 3', now());

-- (+) statements and statements_update
UPDATE test SET f2 = 'XXXX' WHERE f1 = 1;
 
-- (+) statements and statements_update
UPDATE test SET f2 = 'XXXX';

-- (+) statements and statements_select
SELECT * FROM test WHERE f1 = 1;

-- (+) statements and statements_select
SELECT * FROM test;

-- (+) statements and statements_delete
DELETE FROM test WHERE f1 = 1;

-- (+) statements and statements_delete
DELETE FROM test;

-- (+) statements, statements_other and transactions_commit
COMMIT;

/* </EXPLICT_TRANSACTIONS> */
