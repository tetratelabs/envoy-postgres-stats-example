/* ERROR inside a explicit transaction */
BEGIN;                       -- (+) statements, statements_other and transactions
DROP TABLE IF EXISTS test;   -- (+) statements and statements_other
CREATE TABLE test();         -- (+) statements and statements_other
SELECT * FROM test;          -- (+) statements and statements_select
DELETE FROM test WHERE x=1;  -- (+) errors
COMMIT;                      -- (+) statements, statements_other and transactions_rollback

/* WARNING:  there is already a transaction in progress */
BEGIN;     -- (+) statements, statements_other and transactions
BEGIN;     -- (+) statements and warnings
SELECT 1;  -- (+) statements and statements_select
COMMIT;    -- (+) statements, statements_other and transactions_commit

/* ROLLBACK from an explicit transaction */
BEGIN;       -- (+) statements, statements_other and transactions
SELECT 1+1;  -- (+) statements and statements_select
ROLLBACK;    -- (+) statements, statements_other and transactions_rollback

