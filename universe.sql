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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(60) NOT NULL,
    discovery_date date,
    composition text,
    orbital_period numeric,
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
    name character varying(60) NOT NULL,
    description text,
    distance_from_earth bigint,
    age_in_millions_of_years numeric(30,15)
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
    name character varying(60) NOT NULL,
    planet_id integer,
    description text,
    mass numeric,
    hours_in_a_day integer
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
    name character varying(60) NOT NULL,
    star_id integer,
    is_spherical boolean,
    diameter numeric,
    has_life boolean,
    mass numeric,
    has_ring boolean,
    description text,
    number_of_moon integer DEFAULT 0
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
    name character varying(60) NOT NULL,
    galaxy_id integer,
    age_in_millions_of_years numeric(30,15),
    distance_from_earth bigint,
    description text
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

INSERT INTO public.comet VALUES (1, 'Halley"s Comet', '0240-01-01', 'Ice, dust, and rocky debris', 75.3, 1);
INSERT INTO public.comet VALUES (2, 'Hale-Bopp', '1995-07-23', 'Ice, dust, and rocky debris', 2500, 1);
INSERT INTO public.comet VALUES (3, 'Comet Hyakutake', '1996-01-31', 'Ice, dust, and rocky debris', 11100, 1);
INSERT INTO public.comet VALUES (4, 'Comet ISON', '2012-09-21', 'Ice, dust, and rocky debris', 550000, 1);
INSERT INTO public.comet VALUES (5, 'Comet McNaught', '2006-08-07', 'Ice, dust, and rocky debris', 90000, 1);
INSERT INTO public.comet VALUES (6, 'Comet Lovejoy', '2011-12-26', 'Ice, dust, and rocky debris', 13500, 1);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy, a barred spiral galaxy with billions of stars.', 0, 13600.000000000000000);
INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy (M31)', 'The nearest large galaxy to the Milky Way, a spiral galaxy.', 2500000, 10000.000000000000000);
INSERT INTO public.galaxy VALUES (3, 'Large Magellanic Cloud (LMC)', 'A satellite galaxy of the Milky Way, an irregular galaxy.', 163000, 13200.000000000000000);
INSERT INTO public.galaxy VALUES (4, 'Small Magellanic Cloud (SMC)', 'Another satellite galaxy of the Milky Way, an irregular galaxy.', 200000, 13000.000000000000000);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool Galaxy (M51)', 'A grand design spiral galaxy with prominent spiral arms.', 31000000, 10000.000000000000000);
INSERT INTO public.galaxy VALUES (6, 'Sombrero Galaxy (M104)', 'A lenticular galaxy with a bright central bulge and a prominent dust lane.', 29300000, 13700.000000000000000);
INSERT INTO public.galaxy VALUES (7, 'Cartwheel Galaxy', 'A ring galaxy formed from a high-speed collision between two galaxies.', 500000000, 400.000000000000000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 'Earth"s only natural satellite, tidally locked.', 73476730900000000000000, NULL);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 'Small, irregularly shaped moon, slowly spiraling towards Mars.', 10659000000000000, NULL);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 'Even smaller than Phobos, also irregularly shaped.', 1476200000000000, NULL);
INSERT INTO public.moon VALUES (4, 'Io', 5, 'Volcanic moon with sulfurous surface.', 89319000000000000000000, NULL);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 'Icy moon with a subsurface ocean.', 48000000000000000000000, NULL);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 'Largest moon in the Solar System, larger than Mercury.', 148190000000000000000000, NULL);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 'Heavily cratered, icy moon.', 107590000000000000000000, NULL);
INSERT INTO public.moon VALUES (8, 'Mimas', 6, 'Small moon with a large crater, Herschel.', 37500000000000000000, NULL);
INSERT INTO public.moon VALUES (9, 'Enceladus', 6, 'Icy moon with geysers erupting water vapor.', 108000000000000000000, NULL);
INSERT INTO public.moon VALUES (10, 'Tethys', 6, 'Icy moon with a large canyon system.', 617000000000000000000, NULL);
INSERT INTO public.moon VALUES (11, 'Dione', 6, 'Icy moon with a heavily cratered surface.', 1100000000000000000000, NULL);
INSERT INTO public.moon VALUES (12, 'Rhea', 6, 'Second-largest moon of Saturn, icy with a cratered surface.', 2310000000000000000000, NULL);
INSERT INTO public.moon VALUES (13, 'Titan', 6, 'Largest moon of Saturn, with a thick atmosphere and hydrocarbon lakes.', 134520000000000000000000, NULL);
INSERT INTO public.moon VALUES (14, 'Iapetus', 6, 'Two-toned moon, one side dark, the other bright.', 1880000000000000000000, NULL);
INSERT INTO public.moon VALUES (15, 'Hyperion', 6, 'Chaotic rotation, sponge-like appearance.', 5570000000000000000, NULL);
INSERT INTO public.moon VALUES (16, 'Phoebe', 6, 'Irregularly shaped moon with a retrograde orbit.', 8300000000000000000, NULL);
INSERT INTO public.moon VALUES (17, 'Miranda', 7, 'Small moon with varied terrain, including cliffs and valleys.', 65900000000000000000, NULL);
INSERT INTO public.moon VALUES (18, 'Ariel', 7, 'Icy moon with a heavily cratered surface.', 1353000000000000000000, NULL);
INSERT INTO public.moon VALUES (19, 'Umbriel', 7, 'Darkest of Uranus"s major moons.', 1172000000000000000000, NULL);
INSERT INTO public.moon VALUES (20, 'Titania', 7, 'Largest moon of Uranus, heavily cratered.', 3520000000000000000000, NULL);
INSERT INTO public.moon VALUES (21, 'Oberon', 7, 'Outermost major moon of Uranus, heavily cratered.', 3040000000000000000000, NULL);
INSERT INTO public.moon VALUES (22, 'Triton', 8, 'Large, geologically active moon with a retrograde orbit.', 21400000000000000000000, NULL);
INSERT INTO public.moon VALUES (23, 'Nereid', 8, 'Distant, irregularly shaped moon with a highly eccentric orbit.', 31000000000000000000, NULL);
INSERT INTO public.moon VALUES (24, 'Proteus', 8, 'Irregularly shaped moon, second-largest of Neptune"s.', 44000000000000000000, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, true, 4879, false, 330220000000000000000000, false, 'The smallest and closest planet to the Sun.', 0);
INSERT INTO public.planet VALUES (2, 'Venus', 1, true, 12104, false, 4867500000000000000000000, false, 'The hottest planet in the Solar System.', 0);
INSERT INTO public.planet VALUES (3, 'Earth', 1, true, 12742, true, 5972370000000000000000000, false, 'The only planet known to support life.', 0);
INSERT INTO public.planet VALUES (4, 'Mars', 1, true, 6779, false, 641710000000000000000000, false, 'The Red Planet, with a thin atmosphere.', 0);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, true, 139822, false, 1898600000000000000000000000, true, 'The largest planet in the Solar System, a gas giant.', 0);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, true, 116460, false, 568460000000000000000000000, true, 'The second-largest planet, known for its rings.', 0);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, true, 50724, false, 86810000000000000000000000, true, 'An ice giant with a tilted axis.', 0);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, true, 49244, false, 102430000000000000000000000, true, 'A distant ice giant, known for its strong winds.', 0);
INSERT INTO public.planet VALUES (9, 'Kepler-452b', 2, true, 12742, false, 0, false, 'A super-Earth exoplanet, potentially habitable.', 0);
INSERT INTO public.planet VALUES (10, 'Kepler-186f', 3, true, 13400, false, 0, false, 'A potentially habitable exoplanet in the habitable zone.', 0);
INSERT INTO public.planet VALUES (11, 'Proxima Centauri b', 5, true, 15000, false, 0, false, 'The nearest exoplanet to Earth, orbiting Proxima Centauri.', 0);
INSERT INTO public.planet VALUES (12, 'TRAPPIST-1b', 6, true, 7500, false, 0, false, 'A rocky exoplanet in the TRAPPIST-1 system.', 0);
INSERT INTO public.planet VALUES (13, 'TRAPPIST-1e', 6, true, 9000, false, 0, false, 'A potentially habitable exoplanet in the TRAPPIST-1 system.', 0);
INSERT INTO public.planet VALUES (14, 'TRAPPIST-1f', 6, true, 9500, false, 0, false, 'A potentially habitable exoplanet in the TRAPPIST-1 system.', 0);
INSERT INTO public.planet VALUES (15, 'TRAPPIST-1g', 6, true, 9200, false, 0, false, 'A potentially habitable exoplanet in the TRAPPIST-1 system.', 0);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 4600.000000000000000, 0, 'The star at the center of the Solar System.');
INSERT INTO public.star VALUES (2, 'Sirius', 1, 230.000000000000000, 9, 'The brightest star in the night sky.');
INSERT INTO public.star VALUES (3, 'Betelgeuse', 1, 8.500000000000000, 640, 'A red supergiant star, one of the largest known stars.');
INSERT INTO public.star VALUES (4, 'Rigel', 1, 8.000000000000000, 860, 'A blue-white supergiant star, one of the brightest stars in the Milky Way.');
INSERT INTO public.star VALUES (5, 'Proxima Centauri', 1, 4.850000000000000, 4, 'The nearest star to the Sun.');
INSERT INTO public.star VALUES (6, 'Andromeda Galaxy Center', 2, 10000.000000000000000, 2500000, 'A supermassive black hole at the center of the Andromeda Galaxy.');
INSERT INTO public.star VALUES (7, 'Cartwheel Galaxy Center', 7, 400.000000000000000, 500000000, 'A supermassive black hole at the center of the Cartwheel Galaxy.');


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 6, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 24, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 15, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


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
-- Name: comet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


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

