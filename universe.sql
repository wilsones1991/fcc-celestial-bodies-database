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
    name character varying(30) NOT NULL,
    description text,
    constellation character varying(30),
    number_of_stars_in_billions integer
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
    name character varying(30) NOT NULL,
    planet_id integer,
    semi_major_axis_in_km integer,
    eccentricity numeric(5,4)
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
    name character varying(30) NOT NULL,
    distance_from_earth integer,
    age_in_millions_of_years integer,
    has_life boolean,
    is_gas boolean,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_more_info; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_more_info (
    adjectives character varying(20) NOT NULL,
    aphelion numeric(6,3),
    perihelion numeric(6,3),
    semi_major_axis numeric(6,3),
    planet_id integer NOT NULL,
    name character varying(20),
    planet_more_info_id integer NOT NULL
);


ALTER TABLE public.planet_more_info OWNER TO freecodecamp;

--
-- Name: planet_more_info_planet_more_info_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_more_info_planet_more_info_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_more_info_planet_more_info_id_seq OWNER TO freecodecamp;

--
-- Name: planet_more_info_planet_more_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_more_info_planet_more_info_id_seq OWNED BY public.planet_more_info.planet_more_info_id;


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
    name character varying(30) NOT NULL,
    galaxy_id integer,
    solar_radius integer,
    details text
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
-- Name: planet_more_info planet_more_info_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_more_info ALTER COLUMN planet_more_info_id SET DEFAULT nextval('public.planet_more_info_planet_more_info_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'galaxy that includes the solar system', 'Sagittarius', 100);
INSERT INTO public.galaxy VALUES (2, 'Large Megellanic Cloud', 'satellite galaxy of the Milky Way', 'Dorado/Mensa', NULL);
INSERT INTO public.galaxy VALUES (3, 'Small Magellanic Cloud', 'dwarf galaxy near the Milky Way', 'Tucana', NULL);
INSERT INTO public.galaxy VALUES (4, 'Andromeda', 'barred spiral galaxy 2.5 million light-years from Earth', 'Andromeda', 1000);
INSERT INTO public.galaxy VALUES (5, 'Triangulum', 'spiral galaxy 2.73 million light-years from Earth', 'Triangulum', 40000);
INSERT INTO public.galaxy VALUES (6, 'Centaurus A', 'galaxy discovered in 1826 by Scottish astronomer James Dunlop', 'Centaurus', NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'The moon', 3, NULL, NULL);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, NULL, NULL);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, NULL, NULL);
INSERT INTO public.moon VALUES (4, 'Metis', 5, NULL, NULL);
INSERT INTO public.moon VALUES (5, 'Adrastea', 5, NULL, NULL);
INSERT INTO public.moon VALUES (6, 'Amalthea', 5, NULL, NULL);
INSERT INTO public.moon VALUES (7, 'Thebe', 5, NULL, NULL);
INSERT INTO public.moon VALUES (8, 'Io', 5, NULL, NULL);
INSERT INTO public.moon VALUES (9, 'Europa', 5, NULL, NULL);
INSERT INTO public.moon VALUES (10, 'Ganymede', 5, NULL, NULL);
INSERT INTO public.moon VALUES (11, 'Callisto', 5, NULL, NULL);
INSERT INTO public.moon VALUES (12, 'Himalia group', 5, NULL, NULL);
INSERT INTO public.moon VALUES (13, 'Themisto', 5, NULL, NULL);
INSERT INTO public.moon VALUES (14, 'Carpo', 5, NULL, NULL);
INSERT INTO public.moon VALUES (15, 'Valetudo', 5, NULL, NULL);
INSERT INTO public.moon VALUES (16, 'Ananke group', 5, NULL, NULL);
INSERT INTO public.moon VALUES (17, 'Carme group', 5, NULL, NULL);
INSERT INTO public.moon VALUES (18, 'Pasiphae group', 5, NULL, NULL);
INSERT INTO public.moon VALUES (19, 'Pan', 6, NULL, NULL);
INSERT INTO public.moon VALUES (20, 'Daphnis', 6, NULL, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', NULL, NULL, NULL, NULL, 4);
INSERT INTO public.planet VALUES (2, 'Venus', NULL, NULL, NULL, NULL, 4);
INSERT INTO public.planet VALUES (3, 'Earth', NULL, NULL, NULL, NULL, 4);
INSERT INTO public.planet VALUES (4, 'Mars', NULL, NULL, NULL, NULL, 4);
INSERT INTO public.planet VALUES (5, 'Jupiter', NULL, NULL, NULL, NULL, 4);
INSERT INTO public.planet VALUES (6, 'Saturn', NULL, NULL, NULL, NULL, 4);
INSERT INTO public.planet VALUES (7, 'Uranus', NULL, NULL, NULL, NULL, 4);
INSERT INTO public.planet VALUES (8, 'Neptune', NULL, NULL, NULL, NULL, 4);
INSERT INTO public.planet VALUES (9, 'Proxima Centauri b', NULL, NULL, NULL, NULL, 7);
INSERT INTO public.planet VALUES (10, 'Gliese 1061 c', NULL, NULL, NULL, NULL, 8);
INSERT INTO public.planet VALUES (11, 'Gliese 1061 d', NULL, NULL, NULL, NULL, 8);
INSERT INTO public.planet VALUES (12, 'Teegarden''s Star b', NULL, NULL, NULL, NULL, 9);


--
-- Data for Name: planet_more_info; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_more_info VALUES ('Mercurian', NULL, NULL, NULL, 1, 'Mercury', 1);
INSERT INTO public.planet_more_info VALUES ('Venusian', NULL, NULL, NULL, 2, 'Venus', 2);
INSERT INTO public.planet_more_info VALUES ('Earthly', NULL, NULL, NULL, 3, 'Earth', 3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Stephenson 2-18', 1, 2150, 'red supergiant or possible extreme red hypergiant star');
INSERT INTO public.star VALUES (2, 'UY Scuti', 1, 1708, 'extreme red hypergiant or red supergiant star');
INSERT INTO public.star VALUES (3, 'WOH G64', 2, 1540, 'unusual red supergiant star');
INSERT INTO public.star VALUES (4, 'Sun', 1, 1, 'center of our solar system');
INSERT INTO public.star VALUES (5, 'Alpha Andromedae', 4, NULL, 'brightest star of Andromeda');
INSERT INTO public.star VALUES (6, 'Beta Andromedae', 4, NULL, 'prominent star in northern constellation of Andromeda');
INSERT INTO public.star VALUES (7, 'Proxima Centauri', 1, NULL, NULL);
INSERT INTO public.star VALUES (8, 'Gliese 1061', 1, NULL, NULL);
INSERT INTO public.star VALUES (9, 'Teegarden''s Star', 1, NULL, NULL);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_more_info_planet_more_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_more_info_planet_more_info_id_seq', 3, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 9, true);


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
-- Name: planet_more_info planet_more_info_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_more_info
    ADD CONSTRAINT planet_more_info_key UNIQUE (planet_more_info_id);


--
-- Name: planet_more_info planet_more_info_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_more_info
    ADD CONSTRAINT planet_more_info_pkey PRIMARY KEY (planet_more_info_id);


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
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet_more_info planet_more_info_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_more_info
    ADD CONSTRAINT planet_more_info_name_fkey FOREIGN KEY (name) REFERENCES public.planet(name);


--
-- Name: planet_more_info planet_more_info_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_more_info
    ADD CONSTRAINT planet_more_info_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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
