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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(256) NOT NULL,
    galaxy_type character varying(10),
    age_in_millions_of_years integer,
    constellation character varying(30)
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
    name character varying(256) NOT NULL,
    eccentricity numeric(11,10),
    planet_id integer,
    surface_gravity numeric(10,9)
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
-- Name: more_planet_info; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.more_planet_info (
    more_planet_info_id integer NOT NULL,
    planet_id integer NOT NULL,
    name character varying(30),
    description text,
    potentially_habitable boolean,
    has_water boolean
);


ALTER TABLE public.more_planet_info OWNER TO freecodecamp;

--
-- Name: more_planet_info_more_planet_info_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.more_planet_info_more_planet_info_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.more_planet_info_more_planet_info_id_seq OWNER TO freecodecamp;

--
-- Name: more_planet_info_more_planet_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.more_planet_info_more_planet_info_id_seq OWNED BY public.more_planet_info.more_planet_info_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(256) NOT NULL,
    planet_type character varying(30),
    discovery_date character varying(30),
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
    name character varying(256) NOT NULL,
    star_type character varying(30),
    galaxy_id integer,
    constellation character varying(30),
    surface_temperature integer
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
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: more_planet_info more_planet_info_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_planet_info ALTER COLUMN more_planet_info_id SET DEFAULT nextval('public.more_planet_info_more_planet_info_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milkey Way', 'Spiral', 13610, 'Sagittarius');
INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy', 'Elipptical', 10010, 'Andromeda');
INSERT INTO public.galaxy VALUES (3, 'Whirlpool Galaxy', 'Spiral', 400, 'Canes Venatici');
INSERT INTO public.galaxy VALUES (5, 'Pinwheel', 'Spiral', 21, 'Ursa Major');
INSERT INTO public.galaxy VALUES (6, 'Sombrero', NULL, 13250, 'Virgo');
INSERT INTO public.galaxy VALUES (4, 'Black Eye', 'Spiral', 13280, 'Coma Berenices');
INSERT INTO public.galaxy VALUES (7, 'Canis Major Overdensity', 'Irregular', NULL, 'Canis Major');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'moon', 0.0549000000, 16, 1.622000000);
INSERT INTO public.moon VALUES (2, 'Phobos', 0.0151000000, 9, 0.005700000);
INSERT INTO public.moon VALUES (3, 'Deimos', 0.0003300000, 9, 0.003000000);
INSERT INTO public.moon VALUES (4, 'Triton', 0.0000160000, 13, 0.779000000);
INSERT INTO public.moon VALUES (5, 'Thalassa', 0.0017600000, 13, 0.015000000);
INSERT INTO public.moon VALUES (6, 'Europa', 0.0090000000, 10, 1.314000000);
INSERT INTO public.moon VALUES (7, 'Ganymede', 0.0013000000, 10, 1.428000000);
INSERT INTO public.moon VALUES (8, 'Io', 0.0041000000, 10, 1.796000000);
INSERT INTO public.moon VALUES (9, 'Callisto', 0.0074000000, 10, 1.235000000);
INSERT INTO public.moon VALUES (10, 'Titan', 0.0288000000, 11, 1.352000000);
INSERT INTO public.moon VALUES (11, 'Enceladus', 0.0047000000, 10, 0.113000000);
INSERT INTO public.moon VALUES (12, 'Amalthea', 0.0031900000, 10, 0.020000000);
INSERT INTO public.moon VALUES (13, 'Adrastea', 0.0015000000, 10, 0.007000000);
INSERT INTO public.moon VALUES (14, 'Eirene', 0.2143000000, 10, NULL);
INSERT INTO public.moon VALUES (15, 'Cyllene', 0.3190000000, 10, 0.001000000);
INSERT INTO public.moon VALUES (16, 'Himalia', 0.1537860000, 10, 0.062000000);
INSERT INTO public.moon VALUES (17, 'Hyperion', 0.1230061000, 11, 0.017000000);
INSERT INTO public.moon VALUES (18, 'Epimetheus', 0.0098000000, 11, 0.006400000);
INSERT INTO public.moon VALUES (19, 'Oberon', 0.0014000000, 12, 0.354000000);
INSERT INTO public.moon VALUES (20, 'Dione', 0.0022000000, 11, 0.232000000);


--
-- Data for Name: more_planet_info; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.more_planet_info VALUES (1, 6, 'Kepler-442-b', 'Kepler-442-b also know by its Kepler object of interst designation KOI-4742.01  is a confirmed near Earth sized exoplanet, likely rocky, orbiting within the habitable zone of the K type main-sequence star Kepler 442 about 1206 light years away', true, NULL);
INSERT INTO public.more_planet_info VALUES (2, 1, 'Proxima Centauri b', 'Proxima Centauri b or Proxima b is an exoplanet orbiting the habitable zone of the red dwarf star Proxima Centauri wich is the closest star to the Sun and part of the triple star system Alpha Centauri. It is approximately 4.2 light years away', true, NULL);
INSERT INTO public.more_planet_info VALUES (3, 16, 'earth', 'Earth is the third planet from the sun and the only planet known to harbor life. While large volumes of water can be found throughout the solar system, only earth sustains liquid surface water', true, true);
INSERT INTO public.more_planet_info VALUES (4, 12, 'Uranus', 'Uranus is the seventh planet from the sun, its name is a reference to the greek god of the sky. It has the third largest planetary radius and the fourth largest planetary mass', false, true);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Proxima Centauri b', 'super Earth exoplanet', '24 August 2016', 8);
INSERT INTO public.planet VALUES (2, 'Proxima Centauri c', 'super Earth exoplanet', 'January 2020', 8);
INSERT INTO public.planet VALUES (3, 'Proxima Centauri d', 'exoplanet', '2020', 8);
INSERT INTO public.planet VALUES (4, 'Tau Ceti e', 'super Earth exoplanet', '19 December 2012', 9);
INSERT INTO public.planet VALUES (5, 'Tau Ceti f', 'super Earth exoplanet', '19 December 2012', 9);
INSERT INTO public.planet VALUES (6, 'Kepler-442-b', 'super Earth exoplanet', '6 January 2015', 10);
INSERT INTO public.planet VALUES (7, 'Mercury', 'Rocky', '1631', 1);
INSERT INTO public.planet VALUES (8, 'Venus', 'Rocky', 'October 1610', 1);
INSERT INTO public.planet VALUES (9, 'Mars', 'Rocky', '1610', 1);
INSERT INTO public.planet VALUES (10, 'Jupiter', 'Gas Giant', '1610', 1);
INSERT INTO public.planet VALUES (11, 'Saturn', 'Gas Giant', 'July 1610', 1);
INSERT INTO public.planet VALUES (12, 'Uranus', 'Ice Giant', '13 Mars 1781', 1);
INSERT INTO public.planet VALUES (13, 'Neptune', 'Ice Giant', '23 September 1846', 1);
INSERT INTO public.planet VALUES (14, 'Eris', 'Plutoid', '5 January 2005', 1);
INSERT INTO public.planet VALUES (15, 'Pluto', 'Dwarf planet', '18 Feburary 1930', 1);
INSERT INTO public.planet VALUES (16, 'earth', 'Rocky', NULL, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'Yellow Dwarf', 1, NULL, 5778);
INSERT INTO public.star VALUES (2, 'Vega', 'White Dwarf', 1, 'Lyra', 9602);
INSERT INTO public.star VALUES (3, 'Alpheratz', 'Hot Blue', 2, 'Pegasus', 13800);
INSERT INTO public.star VALUES (4, 'Mirach', 'Red Giant', 2, 'Andromeda', 3842);
INSERT INTO public.star VALUES (5, 'Almach', 'Yellow Giant', 2, 'Andromeda', 4500);
INSERT INTO public.star VALUES (6, 'Betelgeuse', 'Red Supergiant', 1, 'Orion', 3500);
INSERT INTO public.star VALUES (7, 'Sirius', 'White Dwarf', 7, 'Canis Major', 9940);
INSERT INTO public.star VALUES (8, 'Proxima Centauri', 'Red Dwarf', 1, 'Centaurus', 3042);
INSERT INTO public.star VALUES (9, 'Tau Ceti', 'Yellow Dwarf', 1, 'Cetus', 5344);
INSERT INTO public.star VALUES (10, 'Kepler-442', 'K main-sequence-star', 1, 'Lyra', 4402);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: more_planet_info_more_planet_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.more_planet_info_more_planet_info_id_seq', 4, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 16, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 10, true);


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
-- Name: more_planet_info more_planet_info_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_planet_info
    ADD CONSTRAINT more_planet_info_pkey PRIMARY KEY (more_planet_info_id);


--
-- Name: more_planet_info more_planet_info_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_planet_info
    ADD CONSTRAINT more_planet_info_planet_id_key UNIQUE (planet_id);


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
-- Name: star star_name_key1; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key1 UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: more_planet_info more_planet_info_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_planet_info
    ADD CONSTRAINT more_planet_info_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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

