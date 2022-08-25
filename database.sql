--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5
-- Dumped by pg_dump version 14.5

-- Started on 2022-08-25 10:58:47

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

--
-- TOC entry 3325 (class 1262 OID 16394)
-- Name: ukur_test; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE ukur_test WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Indonesian_Indonesia.1252';


ALTER DATABASE ukur_test OWNER TO postgres;

\connect ukur_test

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
-- TOC entry 213 (class 1259 OID 16440)
-- Name: Members; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Members" (
    _id character varying(255) NOT NULL,
    name character varying(255),
    balance integer,
    transportation character varying(255)
);


ALTER TABLE public."Members" OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 16417)
-- Name: SequelizeMeta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SequelizeMeta" (
    name character varying(255) NOT NULL
);


ALTER TABLE public."SequelizeMeta" OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 16432)
-- Name: Users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Users" (
    id integer NOT NULL,
    name character varying(255),
    email character varying(255),
    password character varying(255),
    refresh_token text,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."Users" OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 16431)
-- Name: Users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Users_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Users_id_seq" OWNER TO postgres;

--
-- TOC entry 3326 (class 0 OID 0)
-- Dependencies: 211
-- Name: Users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Users_id_seq" OWNED BY public."Users".id;


--
-- TOC entry 3172 (class 2604 OID 16435)
-- Name: Users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Users" ALTER COLUMN id SET DEFAULT nextval('public."Users_id_seq"'::regclass);


--
-- TOC entry 3319 (class 0 OID 16440)
-- Dependencies: 213
-- Data for Name: Members; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Members" VALUES ('61513409910e67390ff53890', 'Tameka', 6728, 'bus');
INSERT INTO public."Members" VALUES ('61513409802beedbe9956ded', 'Crosby', 3647, 'train');
INSERT INTO public."Members" VALUES ('61513409fc036c74e866d348', 'Jocelyn', 4610, 'train');
INSERT INTO public."Members" VALUES ('615134098cf9ce80fcc58be7', 'Mcmahon', 9386, 'train');


--
-- TOC entry 3316 (class 0 OID 16417)
-- Dependencies: 210
-- Data for Name: SequelizeMeta; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3318 (class 0 OID 16432)
-- Dependencies: 212
-- Data for Name: Users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Users" VALUES (4, 'test', 'test@gmail.com', '$2b$10$l1QTn7pKuAe/.EP3QskZWeD8WM17KkbaZchvvY36vg8GA/4KWTijK', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjQsIm5hbWUiOiJ0ZXN0IiwiZW1haWwiOiJ0ZXN0QGdtYWlsLmNvbSIsImlhdCI6MTY2MTM5OTY0NCwiZXhwIjoxNjYxNDg2MDQ0fQ.PfWFLkpLvMuYKAHNgtjD1KYPsR1hvIreYI_R3HR93gI', '2022-08-25 10:53:56.934+07', '2022-08-25 10:54:04.893+07');


--
-- TOC entry 3327 (class 0 OID 0)
-- Dependencies: 211
-- Name: Users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Users_id_seq"', 4, true);


--
-- TOC entry 3174 (class 2606 OID 16421)
-- Name: SequelizeMeta SequelizeMeta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SequelizeMeta"
    ADD CONSTRAINT "SequelizeMeta_pkey" PRIMARY KEY (name);


--
-- TOC entry 3176 (class 2606 OID 16439)
-- Name: Users Users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_pkey" PRIMARY KEY (id);


-- Completed on 2022-08-25 10:58:48

--
-- PostgreSQL database dump complete
--

