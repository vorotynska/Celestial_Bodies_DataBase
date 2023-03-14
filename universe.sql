--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(50),
    period numeric,
    last integer NOT NULL,
    next integer,
    magnide boolean,
    observation boolean,
    star_id integer
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50),
    constellation text,
    observation_by_eyes boolean,
    age_million_years integer NOT NULL,
    diameter_parsek integer,
    speed_relative numeric(4,2),
    spiral boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50),
    discovery text,
    diameter_km integer NOT NULL,
    gravity numeric,
    atmosphere boolean,
    observation boolean,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(50),
    description text,
    life boolean,
    moon integer,
    orbital_period numeric NOT NULL,
    observation boolean,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50),
    observation_by_years boolean,
    has_planet boolean,
    distans_ly numeric NOT NULL,
    age_million_years integer,
    type text,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'Melish', 145.1, 1917, 2062, false, true, 1);
INSERT INTO public.comet VALUES (2, 'Levy', 51.28, 1998, 2042, true, true, 1);
INSERT INTO public.comet VALUES (3, 'Linear', 42.08, 1998, 2040, true, true, 1);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (2, 'Milky way', 'Sagettarius', true, 7000, 26800, 55.22, true);
INSERT INTO public.galaxy VALUES (3, 'Andromeda galaxy', 'Andromeda', true, 6500, 46000, 30.22, false);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool galaxy', 'Canes Venatici', false, 3500, 23580, 14.12, true);
INSERT INTO public.galaxy VALUES (5, 'Large Magellanic Cloud', 'Dorado', true, 3500, 9860, 12.45, false);
INSERT INTO public.galaxy VALUES (6, 'Triangulum galaxy', 'Tringulum', true, 4700, 18740, 67.55, true);
INSERT INTO public.galaxy VALUES (7, 'Sagittarius galaxy', 'Sagittarius', true, 6000, 500, 87.48, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Vants', 'M Braun in 2005', 434, 0.01, false, false, 10);
INSERT INTO public.moon VALUES (2, 'Moon', 'prehistorie', 1734, 0.146, false, true, 5);
INSERT INTO public.moon VALUES (3, 'Phobos', 'Asaph Hall in 1877', 22, 0.001, false, false, 7);
INSERT INTO public.moon VALUES (4, 'Deimos', 'Asaph Hall in 1878', 12, 0.001, false, false, 7);
INSERT INTO public.moon VALUES (5, 'Europa', 'It known Galilean moon', 31121, 0.134, true, true, 1);
INSERT INTO public.moon VALUES (6, 'Ganymede', 'in 1610', 5268, 0.146, true, true, 1);
INSERT INTO public.moon VALUES (7, 'Callisto', 'discovery in 1610', 4820, 0.126, true, true, 1);
INSERT INTO public.moon VALUES (8, 'Io', 'discovery in 1610', 3660, 0.183, true, true, 1);
INSERT INTO public.moon VALUES (9, 'Titan', 'C Huygens in 1655', 5150, 0.138, true, false, 3);
INSERT INTO public.moon VALUES (10, 'Rhea', 'D Cassini 1672', 1532, 0.027, true, false, 3);
INSERT INTO public.moon VALUES (11, 'Enceladus', 'W Herches 1789', 500, 0.011, false, false, 3);
INSERT INTO public.moon VALUES (12, 'Tethys', 'D Cassini 1684', 400, 0.015, false, false, 3);
INSERT INTO public.moon VALUES (13, 'Lapetus', 'D Cassini 1671', 1462, 0.001, false, false, 3);
INSERT INTO public.moon VALUES (14, 'Hyperion', 'W Bond 1848', 270, 0.001, false, false, 3);
INSERT INTO public.moon VALUES (15, 'Minas', 'W Hershee 1789', 396, 0.06, false, false, 3);
INSERT INTO public.moon VALUES (16, 'Miranda', 'G Kuiper 1948', 470, 0.008, false, false, 2);
INSERT INTO public.moon VALUES (17, 'Ariel', 'W Lassel 1851', 210, 0.028, false, false, 2);
INSERT INTO public.moon VALUES (18, 'Titania', 'W Hershei 1787', 1578, 0.040, true, false, 2);
INSERT INTO public.moon VALUES (19, 'Oberon', 'W Hershei 1787', 212, 0.036, false, false, 2);
INSERT INTO public.moon VALUES (20, 'Triton', 'W Lassell 1846', 2710, 0.080, true, false, 4);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Jupiter', 'It is lardest in the Solar System', false, 83, 29.45, false, 1);
INSERT INTO public.planet VALUES (2, 'Uranus', 'ice giants', false, 27, 84.02, true, 1);
INSERT INTO public.planet VALUES (3, 'Saturn', 'It has ring system', false, 83, 29.45, true, 1);
INSERT INTO public.planet VALUES (4, 'Neptune', 'It found by mathematical predicat', false, 14, 164.8, false, 1);
INSERT INTO public.planet VALUES (5, 'Ears', 'Place where life has originated', true, 1, 1, true, 1);
INSERT INTO public.planet VALUES (6, 'Venus', 'Earth sister', false, 0, 1.7, true, 1);
INSERT INTO public.planet VALUES (7, 'Mars', 'It is terrestrial planet', false, 2, 1.9, true, 1);
INSERT INTO public.planet VALUES (8, 'Mercury', 'It is smalled planet', false, 0, 0.25, true, 1);
INSERT INTO public.planet VALUES (9, 'ADS', 'black disk', false, 1, 45.6, false, 2);
INSERT INTO public.planet VALUES (10, 'Orcus', 'dwarf planet', false, 4, 245.1, false, 1);
INSERT INTO public.planet VALUES (11, 'Pluto', 'dwarf planet', false, 1, 247.9, false, 1);
INSERT INTO public.planet VALUES (12, 'Ceres', 'dwarf planet', false, 0, 4.6, false, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', true, true, 4.6, 60, 'G2V', 2);
INSERT INTO public.star VALUES (2, 'WOH', false, false, 100.3, 5, 'M5I', 5);
INSERT INTO public.star VALUES (3, 'VYCM', false, false, 3820.3, 8, 'M3', 4);
INSERT INTO public.star VALUES (4, 'Betelqeuse', true, false, 548.1, 9, 'M1-2', 2);
INSERT INTO public.star VALUES (5, 'Regel', true, true, 863.3, 8, 'B8', 2);
INSERT INTO public.star VALUES (6, 'Antares', true, true, 550.4, 15, 'M1', 2);


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: comet comet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_name_key UNIQUE (name);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: comet comet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

