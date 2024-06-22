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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    galaxy_type character varying(50),
    description text,
    age_in_millions_of_years numeric NOT NULL
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
    name character varying(255) NOT NULL,
    planet_id integer,
    has_atmosphere boolean,
    orbital_period_days numeric(8,2) NOT NULL
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
    name character varying(255) NOT NULL,
    star_id integer,
    planet_type character varying(50),
    is_spherical boolean,
    diameter_km integer NOT NULL
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
-- Name: planet_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_types (
    planet_types_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text
);


ALTER TABLE public.planet_types OWNER TO freecodecamp;

--
-- Name: planet_types_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_types_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_types_type_id_seq OWNER TO freecodecamp;

--
-- Name: planet_types_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_types_type_id_seq OWNED BY public.planet_types.planet_types_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(255) NOT NULL,
    galaxy_id integer,
    has_life boolean,
    distance_from_earth numeric(15,2),
    temperature_kelvin integer NOT NULL
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
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet_types planet_types_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types ALTER COLUMN planet_types_id SET DEFAULT nextval('public.planet_types_type_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 'Our home galaxy, a barred spiral with billions of stars.', 13600);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 'Nearest major galaxy to the Milky Way, also a spiral.', 10010);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 'Third largest galaxy in our Local Group, a smaller spiral.', 4000);
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud', 'Dwarf Irregular', 'Satellite galaxy of the Milky Way, irregular in shape.', 14000);
INSERT INTO public.galaxy VALUES (5, 'Small Magellanic Cloud', 'Dwarf Irregular', 'Another satellite galaxy of the Milky Way, irregular.', 14000);
INSERT INTO public.galaxy VALUES (6, 'Whirlpool Galaxy', 'Spiral', 'A grand-design spiral galaxy with prominent arms.', 400);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, false, 27.32);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, false, 0.32);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, false, 1.26);
INSERT INTO public.moon VALUES (4, 'Io', 5, true, 1.77);
INSERT INTO public.moon VALUES (5, 'Europa', 5, true, 3.55);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, true, 7.15);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, true, 16.69);
INSERT INTO public.moon VALUES (8, 'Titan', 6, true, 15.95);
INSERT INTO public.moon VALUES (9, 'Mimas', 6, false, 0.94);
INSERT INTO public.moon VALUES (10, 'Enceladus', 6, true, 1.37);
INSERT INTO public.moon VALUES (11, 'Tethys', 6, false, 1.89);
INSERT INTO public.moon VALUES (12, 'Dione', 6, true, 2.74);
INSERT INTO public.moon VALUES (13, 'Rhea', 6, true, 4.52);
INSERT INTO public.moon VALUES (14, 'Iapetus', 6, false, 79.33);
INSERT INTO public.moon VALUES (15, 'Miranda', 7, false, 1.41);
INSERT INTO public.moon VALUES (16, 'Ariel', 7, false, 2.52);
INSERT INTO public.moon VALUES (17, 'Umbriel', 7, false, 4.14);
INSERT INTO public.moon VALUES (18, 'Titania', 7, false, 8.71);
INSERT INTO public.moon VALUES (19, 'Oberon', 7, false, 13.46);
INSERT INTO public.moon VALUES (20, 'Nereid', 8, false, 360.14);
INSERT INTO public.moon VALUES (21, 'Triton', 8, true, 5.88);
INSERT INTO public.moon VALUES (22, 'Larissa', 8, false, 0.55);
INSERT INTO public.moon VALUES (23, 'Despina', 8, false, 0.33);
INSERT INTO public.moon VALUES (24, 'Galatea', 8, false, 0.43);
INSERT INTO public.moon VALUES (25, 'Thalassa', 8, false, 0.31);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 'Terrestrial', true, 12742);
INSERT INTO public.planet VALUES (2, 'Mercury', 1, 'Terrestrial', true, 4879);
INSERT INTO public.planet VALUES (3, 'Venus', 1, 'Terrestrial', true, 12104);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 'Terrestrial', true, 6779);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 'Gas Giant', true, 139822);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 'Gas Giant', true, 116464);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 'Ice Giant', true, 50724);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 'Ice Giant', true, 49244);
INSERT INTO public.planet VALUES (9, 'Proxima Centauri b', 7, 'Exoplanet', true, 14000);
INSERT INTO public.planet VALUES (10, 'Trappist-1e', 1, 'Exoplanet', true, 11000);
INSERT INTO public.planet VALUES (11, 'Kepler-452b', 1, 'Exoplanet', true, 16000);
INSERT INTO public.planet VALUES (12, 'Gliese 667 Cc', 1, 'Exoplanet', true, 14000);
INSERT INTO public.planet VALUES (13, 'Kepler-186f', 1, 'Exoplanet', true, 11000);
INSERT INTO public.planet VALUES (14, 'Gliese 581d', 1, 'Exoplanet', true, 21000);
INSERT INTO public.planet VALUES (15, 'HD 40307 g', 1, 'Exoplanet', true, 15000);
INSERT INTO public.planet VALUES (16, 'LHS 1140b', 1, 'Exoplanet', true, 18000);


--
-- Data for Name: planet_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_types VALUES (1, 'Terrestrial', 'Rocky planets like Earth, Mercury, Venus, and Mars.');
INSERT INTO public.planet_types VALUES (2, 'Gas Giant', 'Large planets composed mainly of hydrogen and helium, like Jupiter and Saturn.');
INSERT INTO public.planet_types VALUES (3, 'Ice Giant', 'Large planets composed mainly of heavier elements, like Uranus and Neptune.');
INSERT INTO public.planet_types VALUES (4, 'Dwarf Planet', 'Celestial bodies that orbit the Sun and are round but have not cleared their orbital path.');
INSERT INTO public.planet_types VALUES (5, 'Exoplanet', 'Planets that orbit a star outside our solar system.');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, true, 0.00, 5778);
INSERT INTO public.star VALUES (2, 'Sirius', 1, false, 8.60, 9940);
INSERT INTO public.star VALUES (3, 'Alpha Centauri A', 1, false, 4.37, 5790);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 1, false, 642.50, 3600);
INSERT INTO public.star VALUES (5, 'Vega', 1, false, 25.04, 9602);
INSERT INTO public.star VALUES (6, 'Polaris', 1, false, 433.00, 6015);
INSERT INTO public.star VALUES (7, 'Proxima Centauri', 1, false, 4.25, 3042);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 25, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 16, true);


--
-- Name: planet_types_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_types_type_id_seq', 5, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


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
-- Name: planet_types planet_types_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT planet_types_name_key UNIQUE (name);


--
-- Name: planet_types planet_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT planet_types_pkey PRIMARY KEY (planet_types_id);


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

