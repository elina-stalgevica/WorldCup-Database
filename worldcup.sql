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

DROP DATABASE worldcup;
--
-- Name: worldcup; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE worldcup WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE worldcup OWNER TO freecodecamp;

\connect worldcup

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    year integer NOT NULL,
    round character varying(255) NOT NULL,
    winner_id integer NOT NULL,
    opponent_id integer NOT NULL,
    winner_goals integer NOT NULL,
    opponent_goals integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: teams; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.teams (
    team_id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.teams OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.teams_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_team_id_seq OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.teams_team_id_seq OWNED BY public.teams.team_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: teams team_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams ALTER COLUMN team_id SET DEFAULT nextval('public.teams_team_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (190, 2018, 'Final', 87, 88, 4, 2);
INSERT INTO public.games VALUES (191, 2018, 'Third Place', 89, 90, 2, 0);
INSERT INTO public.games VALUES (192, 2018, 'Semi-Final', 88, 90, 2, 1);
INSERT INTO public.games VALUES (193, 2018, 'Semi-Final', 87, 89, 1, 0);
INSERT INTO public.games VALUES (194, 2018, 'Quarter-Final', 88, 91, 3, 2);
INSERT INTO public.games VALUES (195, 2018, 'Quarter-Final', 90, 92, 2, 0);
INSERT INTO public.games VALUES (196, 2018, 'Quarter-Final', 89, 93, 2, 1);
INSERT INTO public.games VALUES (197, 2018, 'Quarter-Final', 87, 94, 2, 0);
INSERT INTO public.games VALUES (198, 2018, 'Eighth-Final', 90, 95, 2, 1);
INSERT INTO public.games VALUES (199, 2018, 'Eighth-Final', 92, 96, 1, 0);
INSERT INTO public.games VALUES (200, 2018, 'Eighth-Final', 89, 97, 3, 2);
INSERT INTO public.games VALUES (201, 2018, 'Eighth-Final', 93, 98, 2, 0);
INSERT INTO public.games VALUES (202, 2018, 'Eighth-Final', 88, 99, 2, 1);
INSERT INTO public.games VALUES (203, 2018, 'Eighth-Final', 91, 100, 2, 1);
INSERT INTO public.games VALUES (204, 2018, 'Eighth-Final', 94, 101, 2, 1);
INSERT INTO public.games VALUES (205, 2018, 'Eighth-Final', 87, 102, 4, 3);
INSERT INTO public.games VALUES (206, 2014, 'Final', 103, 102, 1, 0);
INSERT INTO public.games VALUES (207, 2014, 'Third Place', 104, 93, 3, 0);
INSERT INTO public.games VALUES (208, 2014, 'Semi-Final', 102, 104, 1, 0);
INSERT INTO public.games VALUES (209, 2014, 'Semi-Final', 103, 93, 7, 1);
INSERT INTO public.games VALUES (210, 2014, 'Quarter-Final', 104, 105, 1, 0);
INSERT INTO public.games VALUES (211, 2014, 'Quarter-Final', 102, 89, 1, 0);
INSERT INTO public.games VALUES (212, 2014, 'Quarter-Final', 93, 95, 2, 1);
INSERT INTO public.games VALUES (213, 2014, 'Quarter-Final', 103, 87, 1, 0);
INSERT INTO public.games VALUES (214, 2014, 'Eighth-Final', 93, 106, 2, 1);
INSERT INTO public.games VALUES (215, 2014, 'Eighth-Final', 95, 94, 2, 0);
INSERT INTO public.games VALUES (216, 2014, 'Eighth-Final', 87, 107, 2, 0);
INSERT INTO public.games VALUES (217, 2014, 'Eighth-Final', 103, 108, 2, 1);
INSERT INTO public.games VALUES (218, 2014, 'Eighth-Final', 104, 98, 2, 1);
INSERT INTO public.games VALUES (219, 2014, 'Eighth-Final', 105, 109, 2, 1);
INSERT INTO public.games VALUES (220, 2014, 'Eighth-Final', 102, 96, 1, 0);
INSERT INTO public.games VALUES (221, 2014, 'Eighth-Final', 89, 110, 2, 1);


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.teams VALUES (87, 'France');
INSERT INTO public.teams VALUES (88, 'Croatia');
INSERT INTO public.teams VALUES (89, 'Belgium');
INSERT INTO public.teams VALUES (90, 'England');
INSERT INTO public.teams VALUES (91, 'Russia');
INSERT INTO public.teams VALUES (92, 'Sweden');
INSERT INTO public.teams VALUES (93, 'Brazil');
INSERT INTO public.teams VALUES (94, 'Uruguay');
INSERT INTO public.teams VALUES (95, 'Colombia');
INSERT INTO public.teams VALUES (96, 'Switzerland');
INSERT INTO public.teams VALUES (97, 'Japan');
INSERT INTO public.teams VALUES (98, 'Mexico');
INSERT INTO public.teams VALUES (99, 'Denmark');
INSERT INTO public.teams VALUES (100, 'Spain');
INSERT INTO public.teams VALUES (101, 'Portugal');
INSERT INTO public.teams VALUES (102, 'Argentina');
INSERT INTO public.teams VALUES (103, 'Germany');
INSERT INTO public.teams VALUES (104, 'Netherlands');
INSERT INTO public.teams VALUES (105, 'Costa Rica');
INSERT INTO public.teams VALUES (106, 'Chile');
INSERT INTO public.teams VALUES (107, 'Nigeria');
INSERT INTO public.teams VALUES (108, 'Algeria');
INSERT INTO public.teams VALUES (109, 'Greece');
INSERT INTO public.teams VALUES (110, 'United States');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 221, true);


--
-- Name: teams_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.teams_team_id_seq', 110, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: teams teams_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_name_key UNIQUE (name);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (team_id);


--
-- Name: games fk_opponent_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT fk_opponent_id FOREIGN KEY (opponent_id) REFERENCES public.teams(team_id);


--
-- Name: games fk_winner_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT fk_winner_id FOREIGN KEY (winner_id) REFERENCES public.teams(team_id);


--
-- PostgreSQL database dump complete
--

