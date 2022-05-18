EXPLAIN ANALYZE SELECT date_acquired FROM moma_works
WHERE date_acquired BETWEEN '1950-01-01' AND '1959-12-31';

CREATE INDEX date_acq_idx ON moma_works(date_acquired);