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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
    username character varying(22),
    guesses integer
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    username character varying(22) NOT NULL,
    games_played integer,
    best_game integer
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES ('ham', 4);
INSERT INTO public.games VALUES ('ham', 0);
INSERT INTO public.games VALUES ('user_1709499251605', 691);
INSERT INTO public.games VALUES ('user_1709499251605', 691);
INSERT INTO public.games VALUES ('user_1709499251606', 569);
INSERT INTO public.games VALUES ('user_1709499251606', 569);
INSERT INTO public.games VALUES ('user_1709499251606', 569);
INSERT INTO public.games VALUES ('user_1709499251606', 569);
INSERT INTO public.games VALUES ('user_1709499251606', 569);
INSERT INTO public.games VALUES ('user_1709499317995', 840);
INSERT INTO public.games VALUES ('user_1709499317995', 840);
INSERT INTO public.games VALUES ('user_1709499317996', 679);
INSERT INTO public.games VALUES ('user_1709499317996', 679);
INSERT INTO public.games VALUES ('user_1709499317996', 679);
INSERT INTO public.games VALUES ('user_1709499317996', 679);
INSERT INTO public.games VALUES ('user_1709499317996', 679);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES ('user_1709498521755', NULL, NULL);
INSERT INTO public.users VALUES ('user_1709498521754', NULL, NULL);
INSERT INTO public.users VALUES ('ham', NULL, NULL);
INSERT INTO public.users VALUES ('user_1709499251606', NULL, NULL);
INSERT INTO public.users VALUES ('user_1709499251605', NULL, NULL);
INSERT INTO public.users VALUES ('user_1709499317996', NULL, NULL);
INSERT INTO public.users VALUES ('user_1709499317995', NULL, NULL);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (username);


--
-- Name: games games_username_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_username_fkey FOREIGN KEY (username) REFERENCES public.users(username);


--
-- PostgreSQL database dump complete
--

