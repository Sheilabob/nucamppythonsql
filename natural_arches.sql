--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1
-- Dumped by pg_dump version 14.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: arches; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.arches (
    id integer NOT NULL,
    gps_point point NOT NULL,
    size_gad integer NOT NULL,
    size_lad numeric,
    name text NOT NULL,
    rating integer,
    type text,
    trail_id integer,
    map_id integer DEFAULT 0 NOT NULL,
    picture_id integer
);


ALTER TABLE public.arches OWNER TO postgres;

--
-- Name: arches_background_info; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.arches_background_info (
    arch_id integer NOT NULL,
    background_info_id integer NOT NULL
);


ALTER TABLE public.arches_background_info OWNER TO postgres;

--
-- Name: arches_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.arches_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.arches_id_seq OWNER TO postgres;

--
-- Name: arches_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.arches_id_seq OWNED BY public.arches.id;


--
-- Name: background_info; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.background_info (
    id integer NOT NULL,
    original_reporter text,
    references_sources text
);


ALTER TABLE public.background_info OWNER TO postgres;

--
-- Name: background_info_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.background_info_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.background_info_id_seq OWNER TO postgres;

--
-- Name: background_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.background_info_id_seq OWNED BY public.background_info.id;


--
-- Name: maps; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.maps (
    id integer NOT NULL,
    name text NOT NULL,
    location text
);


ALTER TABLE public.maps OWNER TO postgres;

--
-- Name: maps_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.maps_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.maps_id_seq OWNER TO postgres;

--
-- Name: maps_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.maps_id_seq OWNED BY public.maps.id;


--
-- Name: pictures; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pictures (
    id integer NOT NULL,
    date date,
    photographer text,
    link_to_db text NOT NULL,
    arch_id integer NOT NULL
);


ALTER TABLE public.pictures OWNER TO postgres;

--
-- Name: pictures_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pictures_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pictures_id_seq OWNER TO postgres;

--
-- Name: pictures_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pictures_id_seq OWNED BY public.pictures.id;


--
-- Name: reports; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reports (
    id integer NOT NULL,
    type text,
    author text NOT NULL,
    date date DEFAULT now() NOT NULL,
    arch_id integer NOT NULL
);


ALTER TABLE public.reports OWNER TO postgres;

--
-- Name: reports_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reports_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reports_id_seq OWNER TO postgres;

--
-- Name: reports_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reports_id_seq OWNED BY public.reports.id;


--
-- Name: trails; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.trails (
    id integer NOT NULL,
    name text NOT NULL,
    difficulty_level text,
    map_id integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.trails OWNER TO postgres;

--
-- Name: trails_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.trails_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.trails_id_seq OWNER TO postgres;

--
-- Name: trails_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.trails_id_seq OWNED BY public.trails.id;


--
-- Name: arches id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.arches ALTER COLUMN id SET DEFAULT nextval('public.arches_id_seq'::regclass);


--
-- Name: background_info id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.background_info ALTER COLUMN id SET DEFAULT nextval('public.background_info_id_seq'::regclass);


--
-- Name: maps id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.maps ALTER COLUMN id SET DEFAULT nextval('public.maps_id_seq'::regclass);


--
-- Name: pictures id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pictures ALTER COLUMN id SET DEFAULT nextval('public.pictures_id_seq'::regclass);


--
-- Name: reports id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reports ALTER COLUMN id SET DEFAULT nextval('public.reports_id_seq'::regclass);


--
-- Name: trails id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trails ALTER COLUMN id SET DEFAULT nextval('public.trails_id_seq'::regclass);


--
-- Data for Name: arches; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.arches (id, gps_point, size_gad, size_lad, name, rating, type, trail_id, map_id, picture_id) FROM stdin;
1	(108,97)	25	1.5	Morning Glory Bridge	8	bridge	1	1	1
2	(45.44,33.2123)	100	47.5	Delicate Arch	10	bridge	2	2	2
\.


--
-- Data for Name: arches_background_info; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.arches_background_info (arch_id, background_info_id) FROM stdin;
1	1
2	2
\.


--
-- Data for Name: background_info; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.background_info (id, original_reporter, references_sources) FROM stdin;
1	David Alexander	The Arches Book
2	Bates Wilson	History of UT
\.


--
-- Data for Name: maps; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.maps (id, name, location) FROM stdin;
1	Grandstaff Canyon	UT
2	Arches National Park	UT
\.


--
-- Data for Name: pictures; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pictures (id, date, photographer, link_to_db, arch_id) FROM stdin;
1	2022-05-07	Henry Hiker	www.archphoto23.yay	1
2	2022-05-07	Henry Hiker	www.archphoto47.yay	2
\.


--
-- Data for Name: reports; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reports (id, type, author, date, arch_id) FROM stdin;
2	most recent	Bobbie Nelson	2022-05-07	1
3	most recent	Random Tourist	2022-05-08	2
\.


--
-- Data for Name: trails; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.trails (id, name, difficulty_level, map_id) FROM stdin;
1	Morning Glory Bridge	maintained trail	1
2	Delicate Arch	maintained trail, steep	2
\.


--
-- Name: arches_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.arches_id_seq', 2, true);


--
-- Name: background_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.background_info_id_seq', 2, true);


--
-- Name: maps_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.maps_id_seq', 2, true);


--
-- Name: pictures_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pictures_id_seq', 2, true);


--
-- Name: reports_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reports_id_seq', 3, true);


--
-- Name: trails_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.trails_id_seq', 2, true);


--
-- Name: arches_background_info arches_background_info_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.arches_background_info
    ADD CONSTRAINT arches_background_info_pkey PRIMARY KEY (arch_id, background_info_id);


--
-- Name: arches arches_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.arches
    ADD CONSTRAINT arches_name_key UNIQUE (name);


--
-- Name: arches arches_picture_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.arches
    ADD CONSTRAINT arches_picture_id_key UNIQUE (picture_id);


--
-- Name: arches arches_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.arches
    ADD CONSTRAINT arches_pkey PRIMARY KEY (id);


--
-- Name: background_info background_info_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.background_info
    ADD CONSTRAINT background_info_pkey PRIMARY KEY (id);


--
-- Name: maps maps_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.maps
    ADD CONSTRAINT maps_name_key UNIQUE (name);


--
-- Name: maps maps_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.maps
    ADD CONSTRAINT maps_pkey PRIMARY KEY (id);


--
-- Name: pictures pictures_arch_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pictures
    ADD CONSTRAINT pictures_arch_id_key UNIQUE (arch_id);


--
-- Name: pictures pictures_link_to_db_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pictures
    ADD CONSTRAINT pictures_link_to_db_key UNIQUE (link_to_db);


--
-- Name: pictures pictures_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pictures
    ADD CONSTRAINT pictures_pkey PRIMARY KEY (id);


--
-- Name: reports reports_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reports
    ADD CONSTRAINT reports_pkey PRIMARY KEY (id);


--
-- Name: trails trails_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trails
    ADD CONSTRAINT trails_pkey PRIMARY KEY (id);


--
-- Name: arches_background_info fk_arches_background_info_arches; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.arches_background_info
    ADD CONSTRAINT fk_arches_background_info_arches FOREIGN KEY (arch_id) REFERENCES public.arches(id);


--
-- Name: arches fk_arches_maps; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.arches
    ADD CONSTRAINT fk_arches_maps FOREIGN KEY (map_id) REFERENCES public.maps(id);


--
-- Name: arches fk_arches_pictures; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.arches
    ADD CONSTRAINT fk_arches_pictures FOREIGN KEY (picture_id) REFERENCES public.pictures(id);


--
-- Name: arches fk_arches_trails; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.arches
    ADD CONSTRAINT fk_arches_trails FOREIGN KEY (trail_id) REFERENCES public.trails(id);


--
-- Name: pictures fk_pictures_arches; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pictures
    ADD CONSTRAINT fk_pictures_arches FOREIGN KEY (arch_id) REFERENCES public.arches(id);


--
-- Name: reports fk_reports_arches; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reports
    ADD CONSTRAINT fk_reports_arches FOREIGN KEY (arch_id) REFERENCES public.arches(id);


--
-- Name: trails fk_trails_maps; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trails
    ADD CONSTRAINT fk_trails_maps FOREIGN KEY (map_id) REFERENCES public.maps(id);


--
-- PostgreSQL database dump complete
--

