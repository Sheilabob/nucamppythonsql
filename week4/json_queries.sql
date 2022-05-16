SELECT 
info -> 'display_name' AS name,
info -> 'nationality' AS nationality
FROM moma_artists
WHERE info ->> 'nationality' = 'American'
ORDER BY id
LIMIT 50;

INSERT INTO moma_artists (info) VALUES (
	json_object('{display_name, Ablade Glover, nationality, Ghanian}')
);

SELECT info FROM moma_artists ORDER BY id DESC LIMIT 1;