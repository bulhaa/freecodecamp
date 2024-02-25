--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    origin_of_name text,
    notes text,
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years integer,
    radius_in_km integer,
    distance_from_earth numeric,
    constellation_id bigint NOT NULL
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
    name character varying(50) NOT NULL,
    notes text,
    has_life boolean,
    is_spherical boolean,
    numeral integer,
    radius_in_km integer,
    orbital_semi_major_axis_in_km numeric,
    planet_id bigint NOT NULL
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
    name character varying(50) NOT NULL,
    description text,
    has_life boolean,
    has_rings boolean,
    discovery_year integer,
    gravity_in_mps2 numeric,
    radius_in_km integer,
    distance_from_sun_in_km numeric,
    star_id bigint NOT NULL
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
    name character varying(50) NOT NULL,
    historical_names_and_comments text,
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years integer,
    radius_in_km integer,
    distance_from_earth numeric,
    galaxy_id bigint NOT NULL
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
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


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
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'Andromeda', NULL);
INSERT INTO public.constellation VALUES (2, 'Corvus', NULL);
INSERT INTO public.constellation VALUES (3, 'Centaurus', NULL);
INSERT INTO public.constellation VALUES (4, 'Lynx', NULL);
INSERT INTO public.constellation VALUES (5, 'Coma Berenices', NULL);
INSERT INTO public.constellation VALUES (6, 'Sagittarius', NULL);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda Galaxy', 'Andromeda, which is shortened from "Andromeda Galaxy", gets its name from the area of the sky in which it appears, the constellation of Andromeda.', 'Andromeda is the closest big galaxy to the Milky Way and is expected to collide with the Milky Way around 4.5 billion years from now. The two will eventually merge into a single new galaxy called Milkdromeda.', NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.galaxy VALUES (2, 'Antennae Galaxies', 'Appearance is similar to an insect''s antennae.', 'Two colliding galaxies', NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO public.galaxy VALUES (3, 'Backward Galaxy', 'It appears to rotate backwards, as the tips of the spiral arms point in the direction of rotation.', '', NULL, NULL, NULL, NULL, NULL, 3);
INSERT INTO public.galaxy VALUES (4, 'Bear Paw Galaxy', 'It resembles the appearance of a bear''s claw.', 'Also known as "Bear Claw Galaxy."', NULL, NULL, NULL, NULL, NULL, 4);
INSERT INTO public.galaxy VALUES (5, 'Black Eye Galaxy', 'It has a spectacular dark band of absorbing dust in front of the galaxy''s bright nucleus, giving rise to its nicknames of the "Black Eye" or "Evil Eye" galaxy.', 'Also known as "Sleeping Beauty Galaxy."', NULL, NULL, NULL, NULL, NULL, 5);
INSERT INTO public.galaxy VALUES (6, 'Milky Way', 'The appearance from Earth of the galaxy—a band of light', 'The galaxy containing the Sun and its Solar System, and therefore Earth.', NULL, NULL, NULL, NULL, NULL, 6);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Adrastea', 'Inner moon (Amalthea)', false, true, 15, 8, 129000, 5);
INSERT INTO public.moon VALUES (2, 'Amalthea', 'Inner moon (Amalthea)', false, true, 5, 84, 181400, 5);
INSERT INTO public.moon VALUES (3, 'Ananke', 'Retrograde irregular (Ananke)', false, true, 12, 14, 21276000, 5);
INSERT INTO public.moon VALUES (4, 'Callirrhoe', 'Retrograde irregular (Pasiphae)', false, true, 17, 5, 24103000, 5);
INSERT INTO public.moon VALUES (5, 'Callisto', 'Main-group moon (Galilean)', false, true, 4, 2410, 1882700, 5);
INSERT INTO public.moon VALUES (6, 'Carme', 'Retrograde irregular (Carme)', false, true, 11, 23, 23404000, 5);
INSERT INTO public.moon VALUES (7, 'Deimos', 'Synchronous rotation', false, true, 2, 6, 23460, 4);
INSERT INTO public.moon VALUES (8, 'Elara', 'Prograde irregular (Himalia)', false, true, 7, 43, 11741000, 5);
INSERT INTO public.moon VALUES (9, 'Europa', 'Main-group moon (Galilean)', false, true, 2, 1561, 671100, 5);
INSERT INTO public.moon VALUES (10, 'Ganymede', 'Main-group moon (Galilean)', false, true, 3, 2634, 1070400, 5);
INSERT INTO public.moon VALUES (11, 'Himalia', 'Prograde irregular (Himalia)', false, true, 6, 70, 11461000, 5);
INSERT INTO public.moon VALUES (12, 'Io', 'Main-group moon (Galilean)', false, true, 1, 1822, 421800, 5);
INSERT INTO public.moon VALUES (13, 'Leda', 'Prograde irregular (Himalia)', false, true, 13, 10, 11165000, 5);
INSERT INTO public.moon VALUES (14, 'Lysithea', 'Prograde irregular (Himalia)', false, true, 10, 18, 11717000, 5);
INSERT INTO public.moon VALUES (15, 'Metis', 'Inner moon (Amalthea)', false, true, 16, 22, 128000, 5);
INSERT INTO public.moon VALUES (16, 'Moon', 'Synchronous rotation (Binary)', false, true, 1, 1738, 384399, 3);
INSERT INTO public.moon VALUES (17, 'Pasiphae', 'Retrograde irregular (Pasiphae)', false, true, 8, 30, 23624000, 5);
INSERT INTO public.moon VALUES (18, 'Phobos', 'Synchronous rotation', false, true, 1, 11, 9380, 4);
INSERT INTO public.moon VALUES (19, 'Sinope', 'Retrograde irregular (Pasiphae)', false, true, 9, 19, 23939000, 5);
INSERT INTO public.moon VALUES (20, 'Thebe', 'Inner moon (Amalthea)', false, true, 14, 49, 221900, 5);
INSERT INTO public.moon VALUES (21, 'Themisto', 'Prograde irregular (Themisto)', false, true, 18, 4, 7284000, 5);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', '', false, false, NULL, 3.7, 2441, 57909175, 6);
INSERT INTO public.planet VALUES (2, 'Venus', '', false, false, NULL, 8.87, 6052, 108208930, 6);
INSERT INTO public.planet VALUES (3, 'Earth', '', true, false, NULL, 9.8, 6378, 149597890, 6);
INSERT INTO public.planet VALUES (4, 'Mars', '', false, false, NULL, 3.71, 3396, 227936640, 6);
INSERT INTO public.planet VALUES (5, 'Jupiter', '', false, true, NULL, 24.79, 71492, 778412010, 6);
INSERT INTO public.planet VALUES (6, 'Saturn', '', false, true, NULL, 10.44, 60268, 1426725400, 6);
INSERT INTO public.planet VALUES (7, 'Uranus', '', false, true, 1781, 8.87, 25559, 2870972200, 6);
INSERT INTO public.planet VALUES (8, 'Neptune', '', false, true, 1846, 11.15, 24764, 4498252900, 6);
INSERT INTO public.planet VALUES (9, 'Ceres', '', false, false, 1801, 0.27, 473, 413700000, 6);
INSERT INTO public.planet VALUES (10, 'Pluto', '', false, false, 1930, 0.62, 1188, 5906380000, 6);
INSERT INTO public.planet VALUES (11, 'Haumea', '', false, false, 2004, 0.63, 816, 6484000000, 6);
INSERT INTO public.planet VALUES (12, 'Makemake', '', false, false, 2005, 0.4, 715, 6850000000, 6);
INSERT INTO public.planet VALUES (13, 'Eris', '', false, false, 2005, 0.82, 1163, 10210000000, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Absolutno', 'IAU new 2019\nCzech Republic proposal; a fictional substance in the novel Továrna na absolutno by Karel Capek.', NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.star VALUES (2, 'Acamar', '', NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO public.star VALUES (3, 'Achernar', 'The name was originally Arabic: ??? ????? ?a?ir an-nahr (''river''s end'').', NULL, NULL, NULL, NULL, NULL, 3);
INSERT INTO public.star VALUES (4, 'Achird', 'Apparently first applied to ? Cassiopeiae in the Skalnate Pleso Atlas of the Heavens published in 1950, but is not known prior to that.[15]', NULL, NULL, NULL, NULL, NULL, 4);
INSERT INTO public.star VALUES (5, 'Acrab', 'The traditional name of the ß Scorpii system has been rendered Akrab and Elakrab, derived (like Acrab) from Arabic: ?????? al-?aqrab (''the scorpion'').', NULL, NULL, NULL, NULL, NULL, 5);
INSERT INTO public.star VALUES (6, 'Sun', '', NULL, NULL, NULL, NULL, NULL, 6);


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 6, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: constellation constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_key UNIQUE (name);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


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
-- Name: galaxy galaxy_constellation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_constellation_id_fkey FOREIGN KEY (constellation_id) REFERENCES public.constellation(constellation_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- PostgreSQL database dump complete
--

