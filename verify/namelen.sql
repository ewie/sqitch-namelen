-- Verify namelen:namelen on pg

BEGIN;

SELECT :'name'::regclass;

ROLLBACK;
