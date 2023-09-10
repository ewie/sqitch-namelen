-- Revert namelen:namelen from pg

BEGIN;

DROP TABLE :"name";

COMMIT;
