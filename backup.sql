--
-- PostgreSQL database dump
--

-- Dumped from database version 12.12 (Ubuntu 12.12-1.pgdg22.04+1)
-- Dumped by pg_dump version 14.4

-- Started on 2022-11-22 14:56:53

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
-- TOC entry 207 (class 1259 OID 16775)
-- Name: bandles; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.bandles (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    price integer NOT NULL
);


ALTER TABLE public.bandles OWNER TO gb_user;

--
-- TOC entry 206 (class 1259 OID 16773)
-- Name: bandles_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.bandles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bandles_id_seq OWNER TO gb_user;

--
-- TOC entry 3125 (class 0 OID 0)
-- Dependencies: 206
-- Name: bandles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.bandles_id_seq OWNED BY public.bandles.id;


--
-- TOC entry 211 (class 1259 OID 16795)
-- Name: games; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.games (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text NOT NULL,
    price integer NOT NULL,
    genre_id integer,
    bandle_id integer,
    release_date timestamp without time zone,
    publisher character varying(100) NOT NULL
);


ALTER TABLE public.games OWNER TO gb_user;

--
-- TOC entry 210 (class 1259 OID 16793)
-- Name: games_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.games_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_id_seq OWNER TO gb_user;

--
-- TOC entry 3126 (class 0 OID 0)
-- Dependencies: 210
-- Name: games_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.games_id_seq OWNED BY public.games.id;


--
-- TOC entry 205 (class 1259 OID 16765)
-- Name: genres; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.genres (
    id integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.genres OWNER TO gb_user;

--
-- TOC entry 204 (class 1259 OID 16763)
-- Name: genres_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.genres_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.genres_id_seq OWNER TO gb_user;

--
-- TOC entry 3127 (class 0 OID 0)
-- Dependencies: 204
-- Name: genres_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.genres_id_seq OWNED BY public.genres.id;


--
-- TOC entry 217 (class 1259 OID 16875)
-- Name: grades; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.grades (
    user_id integer NOT NULL,
    game_id integer NOT NULL,
    grade integer NOT NULL
);


ALTER TABLE public.grades OWNER TO gb_user;

--
-- TOC entry 214 (class 1259 OID 16831)
-- Name: profiles; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.profiles (
    user_id integer NOT NULL,
    email character varying(100),
    balance bigint DEFAULT 0 NOT NULL,
    level integer DEFAULT 1 NOT NULL,
    region_id integer,
    avatar_url character varying(255) NOT NULL
);


ALTER TABLE public.profiles OWNER TO gb_user;

--
-- TOC entry 215 (class 1259 OID 16845)
-- Name: purchases; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.purchases (
    user_id integer NOT NULL,
    game_id integer NOT NULL
);


ALTER TABLE public.purchases OWNER TO gb_user;

--
-- TOC entry 209 (class 1259 OID 16785)
-- Name: regions; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.regions (
    id integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.regions OWNER TO gb_user;

--
-- TOC entry 208 (class 1259 OID 16783)
-- Name: regions_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.regions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.regions_id_seq OWNER TO gb_user;

--
-- TOC entry 3128 (class 0 OID 0)
-- Dependencies: 208
-- Name: regions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.regions_id_seq OWNED BY public.regions.id;


--
-- TOC entry 218 (class 1259 OID 16890)
-- Name: reviews; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.reviews (
    user_id integer NOT NULL,
    game_id integer NOT NULL,
    review text NOT NULL
);


ALTER TABLE public.reviews OWNER TO gb_user;

--
-- TOC entry 203 (class 1259 OID 16755)
-- Name: users; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.users (
    id integer NOT NULL,
    login character varying(50) NOT NULL,
    name character varying(50) NOT NULL,
    password_hash character varying(255) NOT NULL
);


ALTER TABLE public.users OWNER TO gb_user;

--
-- TOC entry 202 (class 1259 OID 16753)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO gb_user;

--
-- TOC entry 3129 (class 0 OID 0)
-- Dependencies: 202
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 213 (class 1259 OID 16818)
-- Name: video; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.video (
    id integer NOT NULL,
    game_id integer,
    url character varying(250) NOT NULL,
    size bigint NOT NULL
);


ALTER TABLE public.video OWNER TO gb_user;

--
-- TOC entry 212 (class 1259 OID 16816)
-- Name: video_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.video_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.video_id_seq OWNER TO gb_user;

--
-- TOC entry 3130 (class 0 OID 0)
-- Dependencies: 212
-- Name: video_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.video_id_seq OWNED BY public.video.id;


--
-- TOC entry 216 (class 1259 OID 16860)
-- Name: wishlist; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.wishlist (
    user_id integer NOT NULL,
    game_id integer NOT NULL
);


ALTER TABLE public.wishlist OWNER TO gb_user;

--
-- TOC entry 2923 (class 2604 OID 16778)
-- Name: bandles id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.bandles ALTER COLUMN id SET DEFAULT nextval('public.bandles_id_seq'::regclass);


--
-- TOC entry 2925 (class 2604 OID 16798)
-- Name: games id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.games ALTER COLUMN id SET DEFAULT nextval('public.games_id_seq'::regclass);


--
-- TOC entry 2922 (class 2604 OID 16768)
-- Name: genres id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.genres ALTER COLUMN id SET DEFAULT nextval('public.genres_id_seq'::regclass);


--
-- TOC entry 2924 (class 2604 OID 16788)
-- Name: regions id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.regions ALTER COLUMN id SET DEFAULT nextval('public.regions_id_seq'::regclass);


--
-- TOC entry 2921 (class 2604 OID 16758)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 2926 (class 2604 OID 16821)
-- Name: video id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.video ALTER COLUMN id SET DEFAULT nextval('public.video_id_seq'::regclass);


--
-- TOC entry 3108 (class 0 OID 16775)
-- Dependencies: 207
-- Data for Name: bandles; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.bandles (id, name, price) FROM stdin;
68	sociis	37
69	magna. Lorem ipsum	25
70	vitae odio sagittis semper.	39
71	neque.	48
72	risus. Donec egestas. Aliquam	39
73	metus. Aliquam	27
74	magna et	46
75	tincidunt pede ac	49
76	ante	44
77	vulputate velit eu sem.	38
78	Proin	43
79	eget, venenatis a,	41
80	libero	45
81	augue scelerisque	39
82	elementum sem,	35
83	Sed congue	31
84	ultricies ligula. Nullam	26
85	pellentesque eget	27
86	pellentesque eget, dictum	31
87	Ut sagittis	37
88	dui, nec tempus	44
89	nunc, ullamcorper eu,	48
90	non, feugiat nec, diam.	27
91	Morbi quis urna.	48
92	mollis. Phasellus libero	50
93	ultrices iaculis	27
94	metus vitae velit	30
95	blandit mattis. Cras	31
96	metus. In nec	28
97	fringilla.	35
98	scelerisque scelerisque dui.	36
99	gravida non, sollicitudin a,	48
100	libero nec	33
101	Sed nulla ante,	32
102	iaculis aliquet	38
103	Mauris magna.	39
104	accumsan laoreet	28
105	nunc ac mattis	50
106	nisi. Cum sociis natoque	35
107	ullamcorper viverra. Maecenas iaculis	29
108	montes, nascetur	28
109	lectus sit amet luctus	30
110	tincidunt nibh. Phasellus nulla.	43
111	Pellentesque tincidunt	40
112	tellus, imperdiet	28
113	mollis non, cursus non,	29
114	et, lacinia	50
115	Sed congue,	42
116	Curae Donec	30
117	aliquet, metus urna convallis	47
\.


--
-- TOC entry 3112 (class 0 OID 16795)
-- Dependencies: 211
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.games (id, name, description, price, genre_id, bandle_id, release_date, publisher) FROM stdin;
126	et ultrices posuere cubilia Curae	ipsum cursus vestibulum. Mauris magna. Duis dignissim tempor arcu. Vestibulum ut eros non enim commodo hendrerit. Donec porttitor	10	14	104	2003-05-31 19:14:18	vel, mauris. Integer
127	neque. Sed eget lacus. Mauris	risus. Nulla eget metus eu erat semper rutrum. Fusce dolor quam, elementum at, egestas a, scelerisque sed, sapien. Nunc pulvinar arcu et pede. Nunc sed orci lobortis augue scelerisque mollis. Phasellus libero mauris, aliquam eu, accumsan sed, facilisis vitae, orci. Phasellus dapibus quam quis diam. Pellentesque	12	6	104	2022-02-24 22:02:10	odio.
128	lacus.	consectetuer ipsum nunc id enim. Curabitur massa. Vestibulum accumsan neque et nunc. Quisque ornare tortor at risus. Nunc ac sem ut dolor dapibus gravida. Aliquam tincidunt, nunc ac mattis ornare, lectus ante dictum mi, ac mattis velit justo nec ante. Maecenas mi felis, adipiscing fringilla, porttitor	11	5	113	1994-03-27 15:54:14	In lorem. Donec elementum,
129	nunc interdum feugiat. Sed nec metus	sed dolor. Fusce mi lorem, vehicula et, rutrum eu, ultrices sit amet, risus. Donec nibh enim, gravida sit amet, dapibus id, blandit at, nisi. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.	2	8	85	2019-07-29 11:48:39	ut
130	a, arcu.	eros nec tellus. Nunc lectus pede, ultrices a, auctor non, feugiat nec, diam. Duis mi enim, condimentum eget, volutpat ornare, facilisis eget, ipsum. Donec sollicitudin adipiscing ligula. Aenean gravida nunc sed pede. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin vel arcu eu odio	13	16	79	2017-05-16 08:35:26	mollis. Integer tincidunt
131	cursus non, egestas a, dui. Cras pellentesque.	facilisis lorem tristique aliquet. Phasellus fermentum convallis ligula. Donec luctus aliquet odio. Etiam ligula tortor, dictum eu, placerat eget, venenatis a, magna. Lorem ipsum dolor sit amet, consectetuer adipiscing	3	18	87	2012-02-11 14:51:46	cubilia Curae
132	odio.	velit. Quisque varius. Nam porttitor scelerisque neque. Nullam nisl. Maecenas malesuada fringilla est. Mauris eu turpis. Nulla aliquet. Proin velit. Sed malesuada augue ut lacus. Nulla tincidunt, neque vitae semper egestas, urna justo faucibus lectus, a sollicitudin orci sem eget massa. Suspendisse eleifend. Cras	2	13	84	2020-02-12 21:12:03	nunc, ullamcorper
133	natoque penatibus et	Suspendisse aliquet, sem ut cursus luctus, ipsum leo elementum sem, vitae aliquam eros turpis non enim. Mauris quis turpis vitae purus gravida sagittis. Duis gravida.	3	16	108	1992-01-18 15:16:26	mauris. Suspendisse aliquet
134	arcu.	Cras convallis convallis dolor. Quisque tincidunt pede ac urna. Ut tincidunt vehicula risus. Nulla eget metus eu erat semper rutrum. Fusce dolor quam, elementum at, egestas a, scelerisque sed, sapien. Nunc pulvinar arcu et pede. Nunc sed orci lobortis augue	12	13	107	1999-11-29 04:36:00	Nunc ut erat.
135	eu dolor egestas	ac arcu. Nunc mauris. Morbi non sapien molestie orci tincidunt adipiscing. Mauris molestie pharetra nibh. Aliquam ornare, libero at auctor ullamcorper, nisl arcu iaculis enim, sit amet ornare lectus justo eu arcu. Morbi sit amet massa. Quisque porttitor eros nec	8	3	73	2006-04-10 00:48:16	eget mollis lectus pede
136	a ultricies adipiscing, enim mi tempor	imperdiet ullamcorper. Duis at lacus. Quisque purus sapien, gravida non, sollicitudin a, malesuada id, erat. Etiam vestibulum massa rutrum magna. Cras convallis convallis dolor. Quisque tincidunt pede ac urna. Ut tincidunt vehicula risus.	10	15	87	2021-07-08 17:23:24	odio. Nam
137	tristique pharetra. Quisque ac libero	sem mollis dui, in sodales elit erat vitae risus. Duis a mi fringilla mi lacinia mattis. Integer eu lacus.	14	1	81	1997-11-06 21:55:52	Phasellus fermentum
138	purus, accumsan	vulputate, lacus. Cras interdum. Nunc sollicitudin commodo ipsum. Suspendisse non leo. Vivamus nibh dolor, nonummy ac, feugiat non, lobortis quis, pede. Suspendisse dui. Fusce diam nunc, ullamcorper eu, euismod ac, fermentum vel, mauris. Integer sem elit, pharetra ut, pharetra sed, hendrerit a, arcu.	2	10	93	1991-08-01 18:13:29	mollis
139	rhoncus. Donec est. Nunc	in lobortis tellus justo sit amet nulla. Donec non justo. Proin non massa non ante bibendum ullamcorper. Duis cursus, diam at pretium aliquet, metus urna	5	5	105	1998-06-13 02:34:59	arcu.
140	aliquet. Phasellus fermentum convallis ligula.	risus, at fringilla purus mauris a nunc. In at pede. Cras vulputate velit eu sem. Pellentesque ut ipsum ac mi eleifend egestas. Sed pharetra, felis eget varius ultrices, mauris ipsum porta elit, a feugiat tellus lorem eu metus. In lorem. Donec elementum, lorem	8	2	81	1993-07-10 08:41:40	massa
141	Nam ac	at lacus. Quisque purus sapien, gravida non, sollicitudin a, malesuada id, erat. Etiam vestibulum massa rutrum	12	13	70	2011-12-11 01:35:46	Phasellus
142	ac mi	feugiat nec, diam. Duis mi enim, condimentum eget, volutpat ornare, facilisis eget, ipsum. Donec sollicitudin adipiscing ligula. Aenean gravida nunc sed pede. Cum sociis natoque penatibus et magnis dis parturient montes,	6	8	82	2019-09-16 04:28:14	nec mauris
143	enim diam vel arcu. Curabitur ut odio	nec, cursus a, enim. Suspendisse aliquet, sem ut cursus luctus, ipsum leo elementum sem, vitae aliquam eros turpis non enim. Mauris quis turpis vitae purus gravida sagittis. Duis gravida. Praesent eu nulla at	10	14	114	2004-03-07 15:42:53	egestas.
144	Donec felis orci, adipiscing non, luctus	sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut nec urna et arcu imperdiet ullamcorper. Duis at lacus. Quisque purus sapien, gravida non, sollicitudin a, malesuada id, erat. Etiam vestibulum massa rutrum magna. Cras convallis convallis dolor. Quisque tincidunt pede ac urna. Ut tincidunt vehicula risus.	8	13	70	2005-07-04 18:19:11	ipsum dolor sit
145	Mauris eu turpis.	Suspendisse eleifend. Cras sed leo. Cras vehicula aliquet libero. Integer in magna. Phasellus dolor elit, pellentesque a, facilisis non, bibendum sed, est. Nunc laoreet lectus quis massa. Mauris vestibulum, neque sed dictum eleifend, nunc risus varius orci, in consequat enim diam vel arcu. Curabitur ut odio vel est tempor bibendum.	10	6	110	2010-01-26 06:37:14	rutrum lorem ac risus.
146	sit amet,	Donec nibh enim, gravida sit amet, dapibus id, blandit at, nisi. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin vel	5	15	113	2021-09-02 10:43:32	nec, euismod in, dolor.
147	ligula. Nullam enim. Sed nulla ante,	bibendum ullamcorper. Duis cursus, diam at pretium aliquet, metus urna convallis erat, eget tincidunt dui augue eu tellus. Phasellus elit pede, malesuada vel, venenatis vel, faucibus id, libero. Donec consectetuer mauris id sapien. Cras dolor	5	17	79	1994-11-17 02:47:14	id risus quis
148	ante dictum cursus. Nunc mauris elit, dictum	massa. Vestibulum accumsan neque et nunc. Quisque ornare tortor at risus. Nunc ac sem ut dolor dapibus gravida. Aliquam tincidunt, nunc ac mattis ornare, lectus ante dictum mi, ac mattis velit justo nec ante. Maecenas mi felis, adipiscing fringilla, porttitor vulputate, posuere	4	8	94	2010-09-29 10:13:41	rutrum, justo.
149	vulputate, risus a	vulputate eu, odio. Phasellus at augue id ante dictum cursus. Nunc mauris elit, dictum eu, eleifend nec, malesuada ut, sem. Nulla interdum. Curabitur dictum. Phasellus in felis. Nulla tempor augue ac ipsum. Phasellus vitae mauris	7	5	70	2018-02-26 02:00:53	ut, pharetra sed,
150	fermentum fermentum arcu. Vestibulum ante	ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae Donec tincidunt. Donec vitae erat vel pede blandit congue. In scelerisque scelerisque dui. Suspendisse ac metus vitae velit egestas lacinia. Sed congue, elit sed consequat auctor, nunc nulla vulputate dui, nec tempus mauris erat eget	15	3	97	2008-04-11 00:43:51	tellus eu augue porttitor
151	facilisis facilisis,	ullamcorper magna. Sed eu eros. Nam consequat dolor vitae dolor. Donec fringilla. Donec feugiat metus sit amet ante. Vivamus non lorem vitae odio sagittis semper. Nam tempor diam dictum sapien. Aenean massa. Integer vitae nibh. Donec est mauris, rhoncus id, mollis nec, cursus a, enim. Suspendisse aliquet, sem	13	9	87	2012-09-06 05:35:07	lorem ac risus.
152	Suspendisse tristique neque	ridiculus mus. Proin vel nisl. Quisque fringilla euismod enim. Etiam gravida molestie arcu. Sed eu nibh vulputate mauris sagittis placerat. Cras dictum ultricies ligula. Nullam enim. Sed nulla ante, iaculis	5	7	88	2013-04-16 07:54:22	dolor. Nulla semper tellus
153	Aliquam rutrum lorem	Nulla eget metus eu erat semper rutrum. Fusce dolor quam, elementum at, egestas a, scelerisque sed, sapien. Nunc pulvinar arcu et pede. Nunc sed orci lobortis augue scelerisque mollis. Phasellus libero mauris, aliquam eu,	2	20	102	1994-09-08 20:16:55	ante ipsum primis in
154	Proin dolor. Nulla semper tellus	arcu vel quam dignissim pharetra. Nam ac nulla. In tincidunt congue turpis. In condimentum. Donec at arcu.	8	17	89	1997-11-02 20:43:17	risus.
155	molestie tellus. Aenean egestas hendrerit neque. In	lectus sit amet luctus vulputate, nisi sem semper erat, in consectetuer ipsum nunc id enim. Curabitur massa. Vestibulum accumsan neque et nunc. Quisque	13	13	83	2006-07-31 22:59:18	Curabitur dictum.
156	arcu. Sed et libero. Proin	nunc interdum feugiat. Sed nec metus facilisis lorem tristique aliquet. Phasellus fermentum convallis ligula. Donec	3	13	90	1996-12-15 12:50:09	enim
157	semper rutrum. Fusce	non, bibendum sed, est. Nunc laoreet lectus quis massa. Mauris vestibulum, neque sed dictum eleifend, nunc risus varius orci, in consequat enim diam vel arcu.	7	6	79	1998-03-22 14:38:31	metus. Aliquam
158	sed	aliquet vel, vulputate eu, odio. Phasellus at augue id ante dictum cursus. Nunc mauris elit, dictum eu, eleifend nec, malesuada ut, sem. Nulla interdum. Curabitur dictum. Phasellus in felis. Nulla tempor augue ac ipsum. Phasellus vitae mauris sit amet lorem semper auctor. Mauris vel turpis. Aliquam adipiscing lobortis	5	4	81	1998-09-28 06:52:05	sagittis
159	amet risus.	tincidunt, neque vitae semper egestas, urna justo faucibus lectus, a sollicitudin orci sem eget massa. Suspendisse eleifend. Cras sed leo. Cras vehicula aliquet libero. Integer in magna. Phasellus dolor elit, pellentesque a,	14	10	111	2019-05-07 07:43:50	Mauris blandit
160	velit. Pellentesque ultricies dignissim lacus. Aliquam	tincidunt, nunc ac mattis ornare, lectus ante dictum mi, ac mattis velit justo nec ante. Maecenas mi felis, adipiscing fringilla, porttitor vulputate, posuere vulputate, lacus. Cras interdum. Nunc sollicitudin commodo ipsum. Suspendisse non leo. Vivamus nibh dolor, nonummy ac, feugiat non, lobortis	4	20	114	2004-11-19 07:50:50	egestas, urna
161	hymenaeos. Mauris ut quamie	tellus. Nunc lectus pede, ultrices a, auctor non, feugiat nec, diam. Duis mi enim, condimentum eget, volutpat ornare, facilisis eget, ipsum. Donec sollicitudin adipiscing ligula. Aenean gravida nunc sed pede. Cum sociis natoque penatibus et magnis dis	9	19	80	2012-01-06 04:47:33	Quisque purus sapien, gravida
162	nec,	ipsum porta elit, a feugiat tellus lorem eu metus. In lorem. Donec elementum, lorem ut aliquam iaculis, lacus pede sagittis augue, eu tempor erat neque non quam. Pellentesque habitant morbi	7	9	106	2016-06-16 19:18:52	lectus
163	Lorem ipsum dolor sit amet, consectetuer adipiscing	tellus faucibus leo, in lobortis tellus justo sit amet nulla. Donec non justo. Proin non massa non ante bibendum ullamcorper. Duis cursus, diam at pretium aliquet, metus urna convallis erat, eget tincidunt dui augue eu tellus.	12	3	87	2000-11-18 16:42:39	Aenean
164	est. Mauris eu turpis. Nulla aliquet. Proin	lorem tristique aliquet. Phasellus fermentum convallis ligula. Donec luctus aliquet odio. Etiam ligula tortor, dictum eu, placerat eget, venenatis a, magna. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.	6	20	86	2021-02-18 17:49:00	Aenean
165	enim. Sed nulla ante, iaculis nec,	ultricies ligula. Nullam enim. Sed nulla ante, iaculis nec, eleifend non, dapibus rutrum, justo. Praesent luctus. Curabitur egestas nunc sed libero. Proin sed turpis nec mauris blandit mattis.	7	9	111	2014-12-18 15:37:26	sodales. Mauris blandit
166	hymenaeos. Mauris ut quam	mi pede, nonummy ut, molestie in, tempus eu, ligula. Aenean euismod mauris eu elit. Nulla facilisi. Sed neque. Sed eget lacus. Mauris non dui nec urna suscipit nonummy. Fusce fermentum fermentum arcu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere	13	12	103	2015-07-14 02:21:21	in sodales elit
167	id, ante.	et, rutrum eu, ultrices sit amet, risus. Donec nibh enim, gravida sit amet, dapibus id, blandit at, nisi. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin	3	16	100	2013-06-07 06:18:05	pellentesque, tellus sem
168	placerat eget, venenatis a, magnas	quis lectus. Nullam suscipit, est ac facilisis facilisis, magna tellus faucibus leo, in lobortis tellus justo	10	4	101	2023-09-27 10:32:22	magnis dis
169	ante. Maecenas	sem, vitae aliquam eros turpis non enim. Mauris quis turpis vitae purus gravida sagittis. Duis gravida. Praesent eu nulla at sem molestie sodales. Mauris blandit enim consequat purus. Maecenas libero est, congue a, aliquet vel, vulputate eu, odio. Phasellus at augue id ante dictum cursus. Nunc	3	8	112	1995-07-05 04:41:07	adipiscing,
194	Fusce aliquam, enim nec tempus	parturient montes, nascetur ridiculus mus. Aenean eget magna. Suspendisse tristique neque venenatis lacus. Etiam bibendum fermentum metus. Aenean sed pede nec	6	16	90	2010-02-15 08:29:59	neque et nunc. Quisque
170	Duis volutpat nunc sit	metus. Vivamus euismod urna. Nullam lobortis quam a felis ullamcorper viverra. Maecenas iaculis aliquet diam. Sed diam lorem, auctor quis, tristique ac, eleifend vitae, erat. Vivamus nisi. Mauris nulla. Integer urna. Vivamus molestie dapibus ligula. Aliquam erat volutpat. Nulla dignissim. Maecenas ornare egestas	12	7	79	2023-09-10 17:55:31	eget metus
171	tempor lorem, eget mollis lectus	consequat purus. Maecenas libero est, congue a, aliquet vel, vulputate eu, odio. Phasellus at augue id ante dictum cursus. Nunc mauris elit, dictum eu, eleifend nec, malesuada ut, sem. Nulla interdum. Curabitur dictum. Phasellus in felis. Nulla tempor augue ac ipsum. Phasellus vitae mauris sit amet lorem semper auctor. Mauris	12	20	117	2019-04-05 16:41:13	risus
172	dui lectus rutrum urna, nec	mauris. Integer sem elit, pharetra ut, pharetra sed, hendrerit a, arcu. Sed et libero. Proin mi. Aliquam gravida mauris ut mi. Duis risus odio, auctor	3	20	75	2016-11-26 22:56:07	Cras interdum. Nunc sollicitudin
173	primis in	semper erat, in consectetuer ipsum nunc id enim. Curabitur massa. Vestibulum accumsan neque et nunc. Quisque ornare tortor at risus. Nunc ac sem ut dolor dapibus gravida. Aliquam tincidunt, nunc ac mattis ornare, lectus ante dictum mi, ac mattis velit justo	12	4	81	2020-05-05 11:08:43	placerat, orci lacus
174	lectus, a sollicitudin orci	ac, eleifend vitae, erat. Vivamus nisi. Mauris nulla. Integer urna. Vivamus molestie dapibus ligula. Aliquam erat volutpat. Nulla dignissim. Maecenas ornare egestas ligula. Nullam feugiat placerat velit. Quisque varius. Nam porttitor scelerisque neque. Nullam nisl. Maecenas malesuada fringilla est. Mauris eu turpis. Nulla aliquet. Proin velit. Sed malesuada	5	7	110	2006-02-14 22:04:47	nisl. Quisque
175	risus. In mi pede, nonummy ut,	euismod urna. Nullam lobortis quam a felis ullamcorper viverra. Maecenas iaculis aliquet diam. Sed diam lorem, auctor quis, tristique ac, eleifend vitae, erat. Vivamus nisi. Mauris nulla. Integer urna. Vivamus molestie	13	11	86	1997-05-18 21:49:47	volutpat. Nulla dignissim.
176	sagittis. Nullam	nonummy. Fusce fermentum fermentum arcu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae Phasellus ornare.	10	15	104	2023-06-29 07:22:00	at,
177	taciti sociosqu ad litora torquent per conubia	luctus aliquet odio. Etiam ligula tortor, dictum eu, placerat eget, venenatis a, magna. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Etiam laoreet, libero et tristique pellentesque, tellus sem mollis dui,	13	19	73	2023-03-08 20:53:33	aliquam, enim nec tempus
178	elementum sem,	ac ipsum. Phasellus vitae mauris sit amet lorem semper auctor. Mauris vel turpis. Aliquam adipiscing lobortis risus. In mi pede, nonummy ut, molestie in, tempus eu, ligula. Aenean euismod mauris eu elit. Nulla facilisi.	8	19	83	1991-10-05 01:54:27	Duis
179	augue, eu	Donec sollicitudin adipiscing ligula. Aenean gravida nunc sed pede. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin vel arcu eu	10	2	104	2008-03-23 07:27:46	vitae purus
180	dui lectus rutrum urna,	nisi dictum augue malesuada malesuada. Integer id magna et ipsum cursus vestibulum. Mauris magna. Duis dignissim tempor arcu.	4	16	98	2013-03-12 20:20:38	in sodales elit
181	Donec egestas. Duis ac	elit. Nulla facilisi. Sed neque. Sed eget lacus. Mauris non dui nec urna suscipit nonummy. Fusce fermentum fermentum arcu. Vestibulum ante	10	1	76	1993-05-04 01:22:11	mollis lectus
182	ornare lectus justo eu arcu.	diam dictum sapien. Aenean massa. Integer vitae nibh. Donec est mauris, rhoncus id, mollis nec, cursus a, enim. Suspendisse aliquet, sem ut cursus luctus, ipsum leo elementum sem, vitae aliquam eros turpis non enim.	4	20	68	2018-06-29 06:57:16	velit. Pellentesque
183	cursus vestibulum. Mauris magna. Duis dignissim	Vivamus molestie dapibus ligula. Aliquam erat volutpat. Nulla dignissim. Maecenas ornare egestas ligula. Nullam feugiat placerat velit. Quisque varius. Nam porttitor scelerisque neque. Nullam nisl. Maecenas malesuada fringilla est. Mauris eu turpis. Nulla aliquet. Proin velit. Sed malesuada augue ut lacus. Nulla tincidunt, neque vitae semper egestas, urna justo	12	11	92	1998-03-08 01:39:24	metus. Aliquam
184	porttitor tellus non magna. Nam ligula	pede. Praesent eu dui. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aenean eget magna. Suspendisse tristique neque venenatis lacus. Etiam bibendum fermentum metus. Aenean sed pede nec ante blandit viverra. Donec tempus, lorem fringilla ornare placerat, orci lacus	13	4	106	1990-12-02 00:29:20	ultrices sit amet,
185	turpis nec mauris	primis in faucibus orci luctus et ultrices posuere cubilia Curae Donec tincidunt. Donec vitae erat vel pede blandit congue. In scelerisque scelerisque dui. Suspendisse	9	15	89	2019-03-06 18:44:21	et malesuada
186	massa rutrum magna. Cras convallis convallis	rutrum eu, ultrices sit amet, risus. Donec nibh enim, gravida sit amet, dapibus id, blandit at, nisi. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin	6	12	115	1990-08-05 23:32:15	mi enim, condimentum
187	Nulla interdum. Curabitur dictum.	Nunc pulvinar arcu et pede. Nunc sed orci lobortis augue scelerisque mollis. Phasellus libero mauris, aliquam eu, accumsan sed, facilisis	6	5	75	2004-05-14 17:16:17	a
188	ridiculus mus. Proin vel	orci, in consequat enim diam vel arcu. Curabitur ut odio vel est tempor bibendum. Donec felis orci, adipiscing non, luctus sit amet, faucibus ut, nulla. Cras eu tellus	12	18	71	2005-08-07 19:25:31	magna. Duis dignissim
189	pede blandit congue.	eu augue porttitor interdum. Sed auctor odio a purus. Duis elementum, dui quis accumsan convallis, ante lectus convallis est, vitae sodales nisi magna sed dui. Fusce aliquam, enim nec tempus scelerisque, lorem ipsum sodales purus, in molestie tortor nibh sit amet orci. Ut sagittis lobortis mauris. Suspendisse aliquet	1	11	100	2004-12-14 12:39:36	dignissim pharetra. Nam
190	Nulla eu neque pellentesque massa lobortis ultrices.	lobortis ultrices. Vivamus rhoncus. Donec est. Nunc ullamcorper, velit in aliquet lobortis, nisi nibh lacinia orci, consectetuer euismod est arcu ac orci. Ut semper pretium neque. Morbi quis urna. Nunc quis arcu	14	7	73	2011-06-02 06:46:33	amet, consectetuer
191	Nam ac nulla.	arcu. Morbi sit amet massa. Quisque porttitor eros nec tellus. Nunc lectus pede, ultrices a, auctor non, feugiat nec, diam. Duis mi enim, condimentum eget, volutpat ornare, facilisis eget, ipsum. Donec sollicitudin adipiscing	14	6	76	2004-03-01 21:44:16	eu neque
192	sagittis felis. Donec tempor, est	pede nec ante blandit viverra. Donec tempus, lorem fringilla ornare placerat, orci lacus vestibulum lorem, sit amet ultricies sem magna nec quam. Curabitur vel lectus. Cum sociis natoque penatibus et magnis	3	11	104	2000-09-22 18:21:54	Nam interdum
193	Mauris quis turpis vitae	in felis. Nulla tempor augue ac ipsum. Phasellus vitae mauris sit amet lorem semper auctor. Mauris vel turpis. Aliquam adipiscing lobortis risus. In mi pede, nonummy ut, molestie in, tempus eu, ligula. Aenean euismod mauris eu elit. Nulla facilisi. Sed	8	13	90	2002-09-17 10:53:44	nisi. Cum sociis
195	quam. Curabitur vel	scelerisque dui. Suspendisse ac metus vitae velit egestas lacinia. Sed congue, elit sed consequat auctor, nunc nulla vulputate dui, nec tempus mauris erat eget ipsum. Suspendisse sagittis. Nullam vitae diam. Proin dolor. Nulla semper tellus id nunc interdum feugiat. Sed nec metus facilisis lorem tristique aliquet.	8	13	90	1997-02-23 21:18:18	nisl. Quisque fringilla
196	lobortis, nisi nibh lacinia	tellus. Suspendisse sed dolor. Fusce mi lorem, vehicula et, rutrum eu, ultrices sit amet, risus. Donec nibh enim, gravida sit amet, dapibus id, blandit at, nisi. Cum	15	8	114	1991-06-14 15:48:00	at pede. Cras
197	lobortis mauris. Suspendisse aliquet	id sapien. Cras dolor dolor, tempus non, lacinia at, iaculis quis, pede. Praesent eu dui. Cum sociis natoque penatibus et magnis dis parturient	12	17	91	2013-01-17 23:02:53	fermentum fermentum
198	tempor arcu. Vestibulum	consectetuer ipsum nunc id enim. Curabitur massa. Vestibulum accumsan neque et nunc. Quisque ornare tortor at risus. Nunc ac sem ut	3	9	75	2020-10-20 16:53:28	dapibus gravida. Aliquam tincidunt,
199	rhoncus. Donec est. Nunc ullamcorper,	adipiscing, enim mi tempor lorem, eget mollis lectus pede et risus. Quisque libero lacus, varius et, euismod et, commodo at, libero. Morbi accumsan laoreet ipsum. Curabitur consequat, lectus sit amet luctus vulputate, nisi sem semper erat,	8	15	95	2019-08-03 03:56:42	Quisque ac libero
200	non enim commodo	in, cursus et, eros. Proin ultrices. Duis volutpat nunc sit amet metus. Aliquam erat volutpat. Nulla facilisis. Suspendisse commodo	2	5	109	2012-08-28 18:41:16	blandit mattis. Cras eget
201	eleifend, nunc risus varius orci, in	Aenean egestas hendrerit neque. In ornare sagittis felis. Donec tempor, est ac mattis semper, dui lectus rutrum urna, nec luctus felis purus ac tellus. Suspendisse sed dolor. Fusce mi lorem, vehicula et, rutrum eu, ultrices sit amet, risus. Donec	13	8	104	2006-03-09 20:36:42	vitae, orci. Phasellus
202	Donec tincidunt. Donec vitae erat	enim. Suspendisse aliquet, sem ut cursus luctus, ipsum leo elementum sem, vitae aliquam eros turpis non enim. Mauris quis turpis vitae purus gravida sagittis. Duis gravida. Praesent eu nulla at sem molestie sodales. Mauris blandit enim consequat purus. Maecenas libero est, congue	15	5	108	2019-02-01 05:47:23	iaculis, lacus
203	egestas ligula. Nullam feugiat	ante. Nunc mauris sapien, cursus in, hendrerit consectetuer, cursus et, magna. Praesent interdum ligula eu enim. Etiam imperdiet dictum	3	16	70	2018-01-20 09:42:02	eleifend vitae, erat. Vivamus
204	pede. Suspendisse dui. Fusce diam nunc,	posuere cubilia Curae Phasellus ornare. Fusce mollis. Duis sit amet diam eu dolor egestas rhoncus. Proin nisl sem, consequat nec, mollis vitae,	4	7	78	2001-02-15 12:07:41	mauris. Integer
205	enim commodo hendrerit. Donec porttitor	congue, elit sed consequat auctor, nunc nulla vulputate dui, nec tempus mauris erat eget ipsum. Suspendisse sagittis. Nullam vitae diam.	7	13	81	2014-10-09 11:42:29	eget lacus. Mauris non
206	ante,	Donec est. Nunc ullamcorper, velit in aliquet lobortis, nisi nibh lacinia orci, consectetuer euismod est arcu ac orci. Ut semper pretium neque. Morbi quis urna. Nunc quis	2	15	92	2016-04-20 06:34:16	vehicula et, rutrum eu,
207	lobortis mauris.	Sed congue, elit sed consequat auctor, nunc nulla vulputate dui, nec tempus mauris erat eget ipsum. Suspendisse	1	13	86	2021-06-02 00:25:37	diam dictum
208	fringilla purus mauris a nunc. In at	conubia nostra, per inceptos hymenaeos. Mauris ut quam vel sapien imperdiet ornare. In faucibus. Morbi vehicula. Pellentesque tincidunt tempus risus. Donec egestas. Duis ac arcu. Nunc mauris. Morbi non sapien molestie orci tincidunt adipiscing. Mauris molestie pharetra nibh. Aliquam ornare, libero at	6	19	82	2016-07-15 03:12:59	eu dolor
209	placerat eget, venenatis a, magna.	morbi tristique senectus et netus et malesuada fames ac turpis egestas. Aliquam fringilla cursus purus. Nullam scelerisque neque sed sem egestas blandit. Nam nulla magna, malesuada vel, convallis in, cursus et, eros. Proin ultrices. Duis volutpat nunc sit amet metus. Aliquam erat volutpat.	1	16	94	2021-05-10 21:47:43	ac orci.
210	Aliquam erat volutpat.	bibendum fermentum metus. Aenean sed pede nec ante blandit viverra. Donec tempus, lorem fringilla ornare placerat, orci lacus vestibulum lorem, sit amet ultricies sem magna nec quam. Curabitur vel lectus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec dignissim magna a tortor. Nunc	10	7	115	1998-08-17 16:25:01	consequat dolor vitae dolor.
211	egestas, urna justo faucibus lectus,	Aliquam tincidunt, nunc ac mattis ornare, lectus ante dictum mi, ac mattis velit justo nec ante. Maecenas mi felis, adipiscing fringilla, porttitor vulputate, posuere vulputate, lacus. Cras interdum. Nunc sollicitudin commodo ipsum. Suspendisse non leo. Vivamus nibh dolor, nonummy ac, feugiat non, lobortis quis, pede.	6	14	89	2009-10-16 04:58:12	mollis dui,
212	a, scelerisque	diam dictum sapien. Aenean massa. Integer vitae nibh. Donec est mauris, rhoncus id, mollis nec, cursus a, enim. Suspendisse aliquet, sem ut cursus luctus, ipsum leo elementum sem,	5	17	82	2017-03-14 03:11:02	arcu. Nunc mauris.
213	id sapien. Cras dolor dolor, tempus	convallis, ante lectus convallis est, vitae sodales nisi magna sed dui. Fusce aliquam, enim nec tempus scelerisque,	1	10	92	2016-12-08 05:43:57	Proin
214	ultrices iaculis odio.	arcu. Vestibulum ut eros non enim commodo hendrerit. Donec porttitor tellus non magna. Nam ligula elit, pretium et, rutrum non, hendrerit id, ante. Nunc mauris sapien, cursus in, hendrerit consectetuer, cursus et, magna. Praesent interdum ligula eu enim.	8	7	75	2006-03-31 17:27:31	sem. Nulla interdum.
215	a ultricies adipiscing, enim mi	augue. Sed molestie. Sed id risus quis diam luctus lobortis. Class aptent taciti sociosqu ad litora torquent per conubia	4	6	102	1998-06-21 09:29:03	per conubia nostra, per
216	convallis est,	Proin velit. Sed malesuada augue ut lacus. Nulla tincidunt, neque vitae semper egestas, urna justo faucibus lectus, a sollicitudin orci sem eget massa. Suspendisse eleifend. Cras sed leo.	5	16	70	2003-05-21 12:56:37	libero.
217	mauris ipsum porta elit,	egestas blandit. Nam nulla magna, malesuada vel, convallis in, cursus et, eros. Proin ultrices. Duis volutpat nunc sit amet metus. Aliquam erat volutpat. Nulla facilisis. Suspendisse commodo tincidunt nibh. Phasellus nulla. Integer vulputate, risus a ultricies adipiscing,	3	14	108	1992-10-23 22:57:17	et ultrices
218	id risus quis	dis parturient montes, nascetur ridiculus mus. Proin vel arcu eu odio tristique pharetra. Quisque ac libero nec ligula consectetuer rhoncus. Nullam velit dui, semper et, lacinia vitae, sodales at, velit. Pellentesque ultricies dignissim lacus. Aliquam rutrum lorem ac risus. Morbi	15	13	97	2022-06-25 19:27:03	neque. In ornare
219	mi, ac	Etiam bibendum fermentum metus. Aenean sed pede nec ante blandit viverra. Donec tempus, lorem fringilla ornare placerat, orci lacus vestibulum lorem, sit amet ultricies sem magna nec quam. Curabitur vel lectus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec dignissim magna a tortor.	10	5	85	2011-07-25 16:16:27	eleifend vitae, erat.
220	consectetuer, cursus et,	Nunc laoreet lectus quis massa. Mauris vestibulum, neque sed dictum eleifend, nunc risus varius orci, in consequat enim diam vel arcu. Curabitur ut odio vel est tempor bibendum. Donec felis orci, adipiscing non, luctus sit amet, faucibus	14	3	104	2014-12-31 14:01:18	interdum. Curabitur dictum.
221	id enim. Curabitur massa. Vestibulum	aliquet, sem ut cursus luctus, ipsum leo elementum sem, vitae aliquam eros turpis non enim. Mauris quis turpis vitae purus gravida sagittis. Duis gravida. Praesent eu nulla at sem molestie sodales. Mauris blandit enim consequat purus. Maecenas libero est, congue a, aliquet vel, vulputate eu, odio.	2	9	103	2009-07-22 16:00:42	vehicula
222	mollis vitae, posuere at, velit.	egestas. Duis ac arcu. Nunc mauris. Morbi non sapien molestie orci tincidunt adipiscing. Mauris molestie pharetra nibh. Aliquam ornare, libero at auctor ullamcorper, nisl arcu iaculis enim, sit amet ornare lectus justo eu arcu. Morbi sit amet massa. Quisque	6	14	83	1991-07-18 15:25:52	egestas
223	Duis ac arcu. Nunc mauris. Morbi non	cursus. Integer mollis. Integer tincidunt aliquam arcu. Aliquam ultrices iaculis odio. Nam interdum enim non nisi. Aenean eget metus. In nec orci. Donec nibh. Quisque nonummy ipsum non arcu. Vivamus sit amet risus. Donec egestas. Aliquam nec enim. Nunc ut erat. Sed	3	10	97	2015-04-14 11:45:34	feugiat non,
224	cursus non, egestas a, dui. Cras	non, bibendum sed, est. Nunc laoreet lectus quis massa. Mauris vestibulum, neque sed dictum eleifend, nunc risus varius orci, in consequat enim diam vel arcu. Curabitur ut odio vel est tempor bibendum. Donec felis orci, adipiscing non, luctus sit amet,	8	6	89	2012-11-20 04:53:30	odio. Etiam ligula
225	dapibus id, blandit at,	nonummy ut, molestie in, tempus eu, ligula. Aenean euismod mauris eu elit. Nulla facilisi. Sed neque. Sed eget lacus. Mauris non dui nec urna suscipit nonummy. Fusce fermentum fermentum arcu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae Phasellus ornare. Fusce	14	11	97	2002-01-23 09:01:46	nec metus facilisis
\.


--
-- TOC entry 3106 (class 0 OID 16765)
-- Dependencies: 205
-- Data for Name: genres; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.genres (id, name) FROM stdin;
1	Action
2	Platformer
3	Shooter
4	Fighting
5	Survival
6	Rhythm game
7	Adventure
8	Horror
9	Metroidvania
10	Quest
11	Interactive movie
12	RPG
13	MMO
14	Roguelike
15	Simulator
16	Strategy
17	MOBA
18	Sport
19	Race
20	VR
\.


--
-- TOC entry 3118 (class 0 OID 16875)
-- Dependencies: 217
-- Data for Name: grades; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.grades (user_id, game_id, grade) FROM stdin;
60	149	3
29	181	2
30	132	2
4	187	4
19	202	1
44	184	2
48	186	3
64	221	3
51	218	4
58	158	5
12	131	5
67	181	5
77	187	3
28	223	4
73	155	3
58	147	3
40	147	2
4	155	4
80	203	3
87	170	4
82	158	4
35	205	4
48	187	4
73	137	1
31	199	2
79	175	2
84	210	4
78	176	3
65	161	4
47	158	5
79	151	1
94	182	2
21	207	1
11	189	1
34	127	2
94	222	3
20	188	5
1	126	4
59	191	1
27	129	4
29	183	2
11	196	5
15	206	4
19	169	3
16	183	1
8	142	4
97	202	2
87	157	4
26	156	2
37	187	1
31	140	5
22	179	1
8	172	2
8	200	3
78	130	3
60	202	4
2	180	4
42	222	2
33	132	4
21	203	3
56	159	4
54	151	1
96	167	2
5	141	3
1	209	4
88	155	3
29	179	5
69	196	2
81	145	2
76	184	3
42	208	2
68	175	4
14	195	2
15	215	2
16	167	1
98	189	3
26	167	4
25	207	3
30	170	4
45	198	2
31	201	1
18	160	4
71	202	3
90	195	1
60	170	5
28	163	4
13	172	3
42	156	3
24	202	2
67	171	3
72	219	4
52	181	3
34	139	2
31	164	1
36	192	4
16	159	4
26	129	3
66	142	3
16	170	2
64	161	4
\.


--
-- TOC entry 3115 (class 0 OID 16831)
-- Dependencies: 214
-- Data for Name: profiles; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.profiles (user_id, email, balance, level, region_id, avatar_url) FROM stdin;
1	adipiscing.mauris@hotmail.org	144	10	26	https://nytimes.com/one?p=8
2	faucibus.leo.in@icloud.com	751	6	25	http://whatsapp.com/fr?q=4
3	turpis@aol.org	188	14	28	http://google.com/user/110?client=g
4	volutpat.nulla@google.edu	526	18	22	http://whatsapp.com/group/9?p=8
5	nulla.donec@protonmail.edu	282	11	23	http://wikipedia.org/site?k=0
6	enim.diam@icloud.com	474	13	19	http://baidu.com/en-ca?search=1
7	tortor@yahoo.net	688	3	23	http://zoom.us/sub/cars?q=4
8	ut.nulla.cras@outlook.couk	283	2	24	https://reddit.com/en-ca?p=8
9	dictum@yahoo.couk	65	15	19	https://nytimes.com/sub/cars?q=0
10	at@google.edu	669	10	26	http://baidu.com/user/110?g=1
11	viverra.donec@hotmail.com	120	13	14	https://nytimes.com/sub?ab=441&aad=2
12	magna.duis@outlook.org	943	15	16	https://netflix.com/user/110?q=0
13	nec.tempus@hotmail.edu	710	11	28	https://walmart.com/fr?gi=100
14	neque@yahoo.com	93	5	17	http://cnn.com/settings?p=8
15	suspendisse.aliquet.sem@yahoo.com	621	3	24	http://guardian.co.uk/en-us?g=1
16	cras@aol.ca	84	6	24	https://instagram.com/settings?ad=115
17	lorem.vitae.odio@google.com	58	19	29	https://facebook.com/en-us?ab=441&aad=2
18	sapien.molestie.orci@hotmail.org	821	13	24	http://wikipedia.org/settings?q=11
19	nunc.ullamcorper@yahoo.edu	787	18	29	http://ebay.com/user/110?g=1
20	dui.lectus@icloud.couk	342	13	17	http://reddit.com/one?k=0
21	ultricies.dignissim@outlook.ca	882	17	29	https://wikipedia.org/group/9?q=11
22	aliquam.nisl@hotmail.ca	662	2	24	https://pinterest.com/group/9?search=1
23	eget.dictum@hotmail.edu	43	16	18	https://bbc.co.uk/fr?client=g
24	sit@google.org	295	8	17	http://zoom.us/en-us?client=g
25	vulputate.mauris.sagittis@google.edu	172	4	21	http://baidu.com/one?client=g
26	dictum.eleifend@google.net	692	5	28	https://walmart.com/fr?page=1&offset=1
27	duis.a@outlook.ca	142	11	22	https://youtube.com/en-ca?ab=441&aad=2
28	sed.turpis@outlook.net	613	5	27	http://naver.com/site?search=1
29	justo.nec.ante@protonmail.couk	236	18	28	https://cnn.com/user/110?search=1&q=de
30	interdum.sed.auctor@aol.couk	287	8	25	http://yahoo.com/user/110?q=11
31	tincidunt.tempus@protonmail.net	558	8	21	http://whatsapp.com/group/9?k=0
32	dictum@outlook.ca	543	3	17	https://google.com/fr?page=1&offset=1
33	donec.vitae@aol.couk	730	9	19	http://walmart.com/settings?q=0
34	suspendisse@outlook.com	199	7	23	https://twitter.com/group/9?page=1&offset=1
35	sagittis@aol.edu	825	14	17	https://reddit.com/user/110?search=1
36	est@aol.org	93	14	24	http://walmart.com/en-us?search=1&q=de
37	dapibus@hotmail.com	677	4	15	https://instagram.com/user/110?search=1
38	molestie.dapibus@google.org	41	6	23	http://bbc.co.uk/user/110?ad=115
39	risus.varius@protonmail.net	690	18	28	http://google.com/fr?q=4
40	mauris@icloud.org	143	8	20	http://nytimes.com/en-us?q=0
41	ligula.nullam.feugiat@hotmail.net	619	2	23	http://nytimes.com/group/9?q=4
42	luctus@icloud.couk	627	4	17	https://nytimes.com/site?q=0
43	ac.mattis@icloud.net	132	5	24	http://reddit.com/en-ca?gi=100
44	enim@protonmail.org	816	4	17	https://walmart.com/sub?ad=115
45	a.malesuada@icloud.edu	327	13	27	http://google.com/group/9?q=4
46	vulputate.risus@outlook.net	827	10	17	https://guardian.co.uk/sub/cars?search=1&q=de
47	libero.lacus@icloud.org	775	2	25	http://youtube.com/en-ca?ab=441&aad=2
48	consectetuer.ipsum@outlook.ca	636	14	26	https://instagram.com/sub?client=g
49	lorem.ipsum@yahoo.net	267	6	17	https://netflix.com/site?k=0
50	vulputate.dui@outlook.org	543	15	19	http://naver.com/settings?p=8
51	non.leo.vivamus@hotmail.ca	528	5	20	http://ebay.com/en-ca?client=g
52	sed.pharetra@icloud.org	582	14	26	http://youtube.com/fr?p=8
53	dui.fusce@outlook.edu	664	12	26	https://ebay.com/user/110?client=g
54	ultricies.ligula.nullam@hotmail.edu	143	13	18	https://bbc.co.uk/site?ab=441&aad=2
55	feugiat.tellus@outlook.com	174	13	26	http://wikipedia.org/fr?p=8
56	libero@outlook.com	495	7	17	https://facebook.com/en-ca?g=1
57	hendrerit.id@aol.net	326	13	28	http://zoom.us/en-us?page=1&offset=1
58	ligula.aenean.gravida@icloud.com	877	7	16	http://naver.com/en-us?gi=100
59	turpis@aol.net	850	14	24	https://naver.com/user/110?client=g
60	mauris.blandit@hotmail.net	794	11	26	http://youtube.com/one?search=1&q=de
61	blandit.viverra@outlook.org	899	7	17	https://instagram.com/sub/cars?ab=441&aad=2
62	id.libero.donec@outlook.org	773	4	29	https://google.com/fr?client=g
63	diam@yahoo.edu	205	11	20	https://guardian.co.uk/fr?client=g
64	scelerisque.scelerisque.dui@google.net	234	1	22	https://twitter.com/sub/cars?q=test
65	rhoncus@hotmail.net	854	13	24	http://twitter.com/fr?q=11
66	eleifend.cras@google.edu	931	12	18	http://zoom.us/fr?ab=441&aad=2
67	nibh.lacinia.orci@google.org	9	10	16	http://nytimes.com/sub?ad=115
68	nulla@aol.edu	421	8	25	http://guardian.co.uk/sub/cars?q=test
69	curabitur.dictum@aol.ca	194	3	23	http://reddit.com/en-ca?page=1&offset=1
70	consequat.dolor@google.net	296	13	23	http://zoom.us/sub?q=11
71	aliquet.phasellus@icloud.couk	228	9	24	https://pinterest.com/fr?q=test
72	eu.sem@yahoo.com	684	14	18	http://wikipedia.org/site?ad=115
73	eget@protonmail.net	446	18	23	http://ebay.com/sub?q=11
74	consectetuer@protonmail.edu	657	11	17	https://wikipedia.org/group/9?search=1
75	non.leo.vivamus@hotmail.org	369	12	20	https://walmart.com/en-us?gi=100
76	tristique@aol.couk	89	10	17	https://facebook.com/settings?str=se
77	cum.sociis@aol.edu	792	2	14	http://guardian.co.uk/fr?q=11
78	ac.arcu@aol.edu	790	14	22	http://nytimes.com/group/9?page=1&offset=1
79	at.nisi.cum@outlook.edu	230	16	29	http://walmart.com/fr?search=1&q=de
80	fringilla.purus@protonmail.net	476	2	17	https://ebay.com/sub?ad=115
81	dui.fusce@protonmail.edu	996	6	22	https://guardian.co.uk/sub?q=test
82	pede.nunc.sed@google.couk	967	12	15	https://cnn.com/settings?str=se
83	vestibulum.mauris.magna@aol.org	549	16	15	https://pinterest.com/en-ca?gi=100
84	in.condimentum.donec@yahoo.net	588	5	18	https://walmart.com/settings?ad=115
85	amet.ultricies@hotmail.org	354	17	21	https://whatsapp.com/en-ca?g=1
86	ornare.egestas@outlook.org	107	15	16	https://instagram.com/sub/cars?str=se
87	lectus.quis@google.com	337	10	28	http://wikipedia.org/group/9?str=se
88	eget.mollis@icloud.ca	345	3	24	http://twitter.com/fr?g=1
89	eu.erat.semper@yahoo.ca	365	10	26	https://instagram.com/settings?ab=441&aad=2
90	dis.parturient@google.couk	670	6	25	https://whatsapp.com/en-us?search=1
91	dapibus.id@protonmail.couk	133	1	15	http://whatsapp.com/sub?client=g
92	consequat.lectus@aol.org	213	13	17	https://youtube.com/fr?page=1&offset=1
93	ipsum.nunc.id@yahoo.net	157	12	18	http://pinterest.com/sub?str=se
94	quisque.tincidunt@icloud.couk	759	9	19	http://baidu.com/en-ca?str=se
95	consectetuer@outlook.couk	952	18	25	https://wikipedia.org/sub/cars?k=0
96	ipsum@hotmail.org	354	9	25	https://naver.com/en-ca?client=g
97	sapien@aol.com	729	19	21	http://netflix.com/user/110?g=1
98	volutpat.nunc@yahoo.couk	966	18	15	http://facebook.com/en-us?k=0
99	vitae.erat.vivamus@aol.ca	490	8	16	http://facebook.com/fr?ab=441&aad=2
100	a.felis@icloud.org	232	9	27	https://pinterest.com/one?client=g
\.


--
-- TOC entry 3116 (class 0 OID 16845)
-- Dependencies: 215
-- Data for Name: purchases; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.purchases (user_id, game_id) FROM stdin;
63	159
52	132
93	225
25	128
83	160
28	209
31	175
91	130
10	210
68	215
19	188
44	179
4	220
84	221
54	209
61	203
20	169
75	217
79	158
4	159
43	129
93	208
16	201
26	186
24	144
11	208
2	145
28	204
88	162
80	158
55	143
21	198
18	205
92	130
44	223
68	203
37	177
80	171
27	134
30	207
88	192
29	127
78	224
11	216
50	219
57	143
46	212
100	206
9	181
82	223
81	145
31	190
75	200
15	126
93	173
100	140
10	129
5	137
11	189
35	195
6	141
96	154
51	191
10	144
54	224
61	149
82	169
1	192
41	149
62	204
72	204
6	175
3	199
90	191
13	149
81	131
60	163
85	147
86	190
9	141
43	215
34	172
8	168
90	182
69	128
96	201
23	171
63	157
95	136
87	206
81	207
88	191
16	141
69	160
92	171
6	136
96	198
16	152
23	199
21	184
\.


--
-- TOC entry 3110 (class 0 OID 16785)
-- Dependencies: 209
-- Data for Name: regions; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.regions (id, name) FROM stdin;
14	Peru
15	Colombia
16	Nigeria
17	Ukraine
18	Mexico
19	Germany
20	Canada
21	Australia
22	Philippines
23	Ireland
24	South Africa
25	Italy
26	United Kingdom
27	France
28	Georgia
29	Russian Federation
\.


--
-- TOC entry 3119 (class 0 OID 16890)
-- Dependencies: 218
-- Data for Name: reviews; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.reviews (user_id, game_id, review) FROM stdin;
99	145	elit, pharetra ut,
16	198	fringilla cursus purus. Nullam scelerisque neque sed sem egestas blandit. Nam nulla magna, malesuada vel, convallis in, cursus et, eros. Proin ultrices. Duis volutpat nunc
90	207	urna, nec luctus felis purus ac tellus.
3	177	sodales elit erat vitae risus. Duis a mi fringilla mi lacinia mattis. Integer eu lacus. Quisque imperdiet, erat
70	167	a mi fringilla mi
67	207	Phasellus elit pede, malesuada vel, venenatis vel, faucibus id, libero. Donec consectetuer mauris id sapien. Cras dolor dolor, tempus non, lacinia at, iaculis quis, pede. Praesent
43	128	orci. Donec nibh. Quisque nonummy ipsum non arcu. Vivamus sit amet risus. Donec egestas. Aliquam nec enim. Nunc ut erat. Sed nunc est, mollis non, cursus non, egestas a, dui.
55	128	consectetuer adipiscing elit. Aliquam auctor, velit eget laoreet posuere, enim nisl
32	141	cursus purus. Nullam scelerisque neque sed sem egestas blandit. Nam nulla magna, malesuada vel, convallis in, cursus et, eros. Proin ultrices. Duis
27	148	Integer mollis. Integer tincidunt aliquam arcu. Aliquam ultrices iaculis odio. Nam interdum enim
56	173	aliquet. Proin velit.
91	133	scelerisque dui. Suspendisse ac metus vitae velit egestas lacinia. Sed congue, elit sed
69	173	at, velit. Pellentesque
45	128	mi felis, adipiscing fringilla, porttitor vulputate, posuere vulputate, lacus. Cras interdum. Nunc sollicitudin commodo ipsum. Suspendisse non leo. Vivamus nibh dolor, nonummy ac, feugiat non,
90	184	ultricies ornare, elit elit fermentum risus, at fringilla
44	155	erat vitae risus. Duis a mi fringilla mi lacinia mattis. Integer eu lacus. Quisque imperdiet, erat nonummy ultricies ornare, elit elit fermentum
78	168	Duis volutpat nunc sit amet metus. Aliquam erat volutpat. Nulla facilisis. Suspendisse commodo tincidunt nibh. Phasellus nulla. Integer vulputate, risus a ultricies adipiscing, enim mi
47	210	et magnis dis parturient montes, nascetur ridiculus mus. Aenean eget magna. Suspendisse tristique neque venenatis lacus. Etiam
27	135	Praesent eu nulla at sem molestie sodales. Mauris blandit enim consequat purus. Maecenas libero est, congue
15	175	sit amet metus. Aliquam erat volutpat. Nulla facilisis. Suspendisse commodo tincidunt nibh. Phasellus nulla. Integer vulputate, risus a ultricies adipiscing, enim mi tempor lorem, eget mollis lectus
30	198	eu elit. Nulla facilisi. Sed neque. Sed eget lacus. Mauris non dui nec
12	136	gravida nunc sed pede. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur
61	210	ac mattis semper, dui lectus rutrum
31	194	nec, euismod in, dolor. Fusce feugiat. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aliquam auctor, velit eget laoreet posuere,
11	217	ornare sagittis felis. Donec tempor, est ac mattis semper, dui lectus rutrum urna, nec luctus felis purus ac tellus. Suspendisse sed
85	128	metus sit amet ante. Vivamus non lorem vitae odio sagittis semper. Nam tempor diam dictum sapien. Aenean massa. Integer vitae nibh. Donec est mauris, rhoncus id, mollis nec,
77	215	faucibus orci luctus et ultrices posuere cubilia Curae
61	160	adipiscing elit. Etiam laoreet, libero et tristique pellentesque, tellus sem mollis dui, in sodales elit erat vitae risus. Duis a mi fringilla mi lacinia mattis. Integer eu lacus. Quisque imperdiet,
34	212	ipsum dolor sit amet, consectetuer adipiscing elit. Etiam laoreet, libero et tristique pellentesque, tellus sem mollis dui, in sodales elit erat vitae risus.
7	131	nonummy ipsum non arcu. Vivamus sit amet risus.
58	212	Duis mi enim, condimentum eget, volutpat ornare, facilisis eget, ipsum. Donec sollicitudin adipiscing ligula. Aenean gravida nunc sed pede. Cum sociis natoque penatibus et
88	222	molestie tortor nibh sit amet orci. Ut sagittis lobortis mauris. Suspendisse aliquet molestie tellus. Aenean
40	205	mauris sit amet lorem semper auctor. Mauris vel turpis. Aliquam adipiscing lobortis risus. In mi pede, nonummy ut, molestie
5	199	consectetuer adipiscing elit.
43	185	dolor. Fusce feugiat. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aliquam auctor, velit eget laoreet posuere, enim
25	150	turpis. Nulla aliquet. Proin velit. Sed malesuada
89	178	Nulla tempor augue ac ipsum. Phasellus vitae mauris
74	166	mauris a nunc. In at pede. Cras vulputate velit eu sem. Pellentesque ut ipsum ac mi eleifend egestas. Sed pharetra, felis eget varius ultrices,
79	186	Phasellus at augue id ante dictum cursus.
11	197	lectus justo eu arcu. Morbi
33	186	eros turpis non enim. Mauris quis turpis
53	180	tincidunt tempus risus. Donec egestas. Duis ac arcu. Nunc mauris. Morbi non sapien molestie orci tincidunt adipiscing. Mauris molestie pharetra nibh. Aliquam ornare, libero at auctor ullamcorper,
93	164	vitae mauris sit amet lorem semper auctor. Mauris vel turpis. Aliquam adipiscing lobortis risus. In mi pede, nonummy ut, molestie in, tempus eu,
88	191	lacinia orci, consectetuer euismod est arcu ac orci. Ut semper pretium neque. Morbi quis urna. Nunc quis arcu
33	214	Fusce mi lorem, vehicula et, rutrum eu, ultrices sit amet, risus. Donec nibh enim, gravida sit amet, dapibus id,
62	223	iaculis aliquet diam. Sed diam lorem, auctor quis, tristique ac, eleifend vitae, erat. Vivamus nisi. Mauris nulla. Integer urna. Vivamus molestie dapibus ligula. Aliquam erat volutpat. Nulla dignissim. Maecenas
49	201	Vivamus nisi. Mauris nulla. Integer urna. Vivamus molestie dapibus ligula. Aliquam erat volutpat. Nulla dignissim. Maecenas ornare egestas ligula.
87	222	tortor nibh sit amet orci. Ut sagittis
54	162	at pretium aliquet, metus urna convallis erat, eget tincidunt dui augue eu tellus. Phasellus elit pede,
68	219	dictum sapien. Aenean massa.
90	221	Suspendisse eleifend. Cras sed leo. Cras vehicula aliquet libero. Integer in magna. Phasellus dolor elit, pellentesque a, facilisis non, bibendum
75	177	erat, eget tincidunt dui augue eu tellus. Phasellus elit pede, malesuada vel, venenatis vel, faucibus id, libero.
61	187	Ut tincidunt vehicula risus. Nulla eget metus eu erat semper rutrum. Fusce dolor quam, elementum at, egestas a,
3	188	leo. Vivamus nibh dolor, nonummy ac, feugiat non, lobortis quis, pede. Suspendisse
26	179	gravida non, sollicitudin a, malesuada id, erat. Etiam vestibulum massa rutrum magna. Cras convallis convallis dolor. Quisque
61	131	molestie arcu. Sed eu nibh vulputate mauris sagittis placerat. Cras dictum ultricies ligula. Nullam enim. Sed nulla ante, iaculis nec, eleifend non, dapibus
29	207	neque. In ornare sagittis felis. Donec tempor, est
96	144	amet orci. Ut sagittis lobortis mauris. Suspendisse aliquet molestie tellus. Aenean egestas hendrerit neque. In ornare sagittis felis. Donec tempor, est ac mattis semper, dui lectus
20	143	Nulla facilisis. Suspendisse commodo tincidunt nibh. Phasellus
12	196	accumsan sed, facilisis vitae, orci. Phasellus dapibus quam quis diam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce
33	215	Integer urna. Vivamus molestie dapibus ligula. Aliquam erat volutpat. Nulla dignissim. Maecenas ornare egestas ligula. Nullam feugiat placerat velit. Quisque
16	158	taciti sociosqu ad litora torquent per conubia nostra, per inceptos
19	162	vulputate, lacus. Cras interdum. Nunc sollicitudin commodo ipsum. Suspendisse non leo. Vivamus
76	145	lectus pede et risus. Quisque libero lacus, varius et, euismod et, commodo at, libero. Morbi accumsan laoreet ipsum. Curabitur consequat, lectus sit amet luctus
7	149	orci. Ut sagittis lobortis mauris. Suspendisse aliquet molestie tellus. Aenean egestas hendrerit neque. In ornare sagittis felis. Donec tempor, est ac mattis
88	182	Suspendisse aliquet, sem ut cursus
17	196	dui. Cras pellentesque. Sed dictum. Proin eget odio. Aliquam vulputate ullamcorper magna. Sed
5	127	ut ipsum
36	181	Maecenas libero est, congue a, aliquet vel, vulputate eu, odio. Phasellus at augue id ante dictum cursus. Nunc mauris elit, dictum eu, eleifend nec, malesuada ut, sem. Nulla
100	187	Ut tincidunt orci quis lectus. Nullam suscipit, est ac facilisis facilisis, magna tellus faucibus leo, in lobortis tellus justo sit amet nulla. Donec non justo.
26	154	Aenean sed pede nec ante
71	217	et ultrices posuere cubilia Curae
8	219	luctus. Curabitur egestas nunc sed libero. Proin sed turpis nec mauris
95	131	convallis, ante lectus convallis est, vitae sodales nisi magna sed dui. Fusce aliquam, enim nec tempus scelerisque,
43	129	arcu. Vestibulum ut eros non enim commodo hendrerit. Donec porttitor tellus non magna. Nam
15	155	erat vitae risus. Duis a mi fringilla mi lacinia mattis. Integer
39	177	elit sed consequat auctor, nunc nulla vulputate dui, nec tempus mauris erat
38	148	Quisque imperdiet, erat nonummy ultricies ornare, elit elit fermentum
96	206	scelerisque dui. Suspendisse ac metus vitae velit egestas lacinia. Sed congue, elit sed consequat auctor, nunc nulla vulputate
4	149	urna. Ut tincidunt vehicula
48	152	amet ultricies sem magna
14	158	Mauris non dui nec urna suscipit nonummy. Fusce fermentum fermentum arcu. Vestibulum ante ipsum primis in faucibus orci luctus
81	134	lacus pede sagittis augue, eu tempor erat neque non
26	191	nulla at sem molestie sodales. Mauris blandit enim consequat purus. Maecenas libero est, congue
66	190	fermentum fermentum arcu. Vestibulum ante ipsum primis in faucibus orci
7	156	lobortis risus. In mi pede, nonummy ut, molestie in, tempus eu, ligula. Aenean euismod mauris eu elit. Nulla facilisi. Sed
44	156	mollis dui, in sodales elit erat vitae risus. Duis a mi fringilla
5	225	magna a tortor. Nunc commodo auctor velit. Aliquam nisl. Nulla eu neque pellentesque massa lobortis ultrices. Vivamus rhoncus. Donec est. Nunc ullamcorper, velit in
70	210	id nunc interdum feugiat. Sed nec metus facilisis lorem tristique aliquet. Phasellus
37	162	mattis velit justo nec ante. Maecenas mi felis, adipiscing fringilla, porttitor vulputate, posuere vulputate,
54	218	turpis non enim. Mauris quis turpis vitae purus gravida sagittis. Duis gravida. Praesent eu nulla at sem molestie sodales. Mauris blandit enim consequat purus. Maecenas
25	218	Mauris non dui nec urna suscipit nonummy. Fusce fermentum fermentum arcu. Vestibulum ante ipsum primis
30	199	eleifend, nunc risus varius orci, in
100	138	Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos hymenaeos. Mauris ut quam vel sapien imperdiet ornare. In faucibus. Morbi vehicula. Pellentesque tincidunt tempus risus.
65	165	diam at pretium aliquet, metus urna convallis erat, eget tincidunt dui augue eu tellus.
49	130	erat, in consectetuer ipsum nunc id enim. Curabitur massa. Vestibulum accumsan neque et nunc. Quisque
99	186	sodales nisi magna sed dui. Fusce aliquam, enim nec tempus scelerisque, lorem ipsum
56	196	mollis. Integer tincidunt
29	219	Nam porttitor scelerisque neque. Nullam nisl. Maecenas
65	144	facilisis, magna tellus faucibus leo, in lobortis
\.


--
-- TOC entry 3104 (class 0 OID 16755)
-- Dependencies: 203
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.users (id, login, name, password_hash) FROM stdin;
1	Linus Wiley	Lilah	%B7813714249718428^UqkitvhTaoqoy^01092788364?6
2	Levi Pratt	Victor	%B6063374728381916^XfdtmqhTkvqoh^2409625723?4
3	Carlos Bradley	Renee	%B5834125526551341^SvgpxbpTqgvgz^74101805?3
4	Bethany Valenzuela	Alma	%B3752575086862445^YurxjwsDjcgkr^4902972567?4
5	Dean Chase	Olympia	%B5287915271854551^LnedpbiDlqsbg^26095041534?8
6	Indira Berry	Lionel	%B8562411175475818^GiwcdybVwkjov^25116433?5
7	Miranda Franks	Colby	%B1428236556384487^BwzypuiVqybiq^2602822409?3
8	Stuart Payne	Julian	%B1634312982836715^JileauqBibudt^1802282351?7
9	Tanisha Parsons	Karleigh	%B3841713566004285^YnzdkbxClkrju^1505384350? 
10	Brandon Chaney	Acton	%B4452057937292176^UyabcemEgvyyp^4406120658?8
11	Hyatt Fernandez	Mufutau	%B5801673817105503^JxssfefBlczzz^9610449556?9
12	Wang Tyler	Christian	%B4827554573056485^OwsozmmOvqxck^62022097955?7
13	Robin Brock	Portia	%B2515238201067973^ViokpehCjzatf^60038217431?5
14	Nevada Brown	Andrew	%B1456325129326533^NkakcplYtdwzk^3208205347?8
15	Mark Thompson	Hayfa	%B7196071155582636^FfgvhkeGnaepj^5611230996?1
16	Lee Castaneda	Dominique	%B8221587972684303^SshkjcpBbmqkl^59118608400?8
17	Eugenia Barry	Mercedes	%B8666189633849055^FgewcysHognid^4210710335?9
18	Illiana Pratt	Maris	%B2263363361890086^NxqntmjEpejhe^9304316728?5
19	Courtney Fletcher	Ivan	%B2231463120834525^AkfokirEsjmlp^1104198543?2
20	Shaine Barnes	Anika	%B6645763416277856^SmiapctEjbwdc^6201837460?3
21	Cullen Howard	Mason	%B4264487456241629^StzpfrgVlubsi^2511988213?8
22	Blake Buckley	Dominique	%B6653760188193764^RdxudqkTiwirr^6206364589? 
23	Ina Mcbride	Audrey	%B2407352400146774^FjcbnlkKpvrlm^14011504?4
24	Grady Wynn	Ignatius	%B8788215856967647^WkqbqxxQxctgg^1712268869?4
25	Eric Vega	Aretha	%B3466822270981020^FyavkeaKvvueo^72109278?3
26	Anastasia Haley	Lesley	%B9725798655532425^HmnyxkyTfqzpl^25072757?1
27	Helen Conley	Gabriel	%B5144259737621210^FkouupdQpqaef^0604903397?6
28	Haviva Cline	Clarke	%B6640503192314234^QtktpvaHgfgis^8404571444?6
29	Maxwell Price	Fletcher	%B8545522548828439^JfveqyjNtfcgx^5004218993? 
30	Catherine Burgess	Blaze	%B5806141572611583^NnfkpicEcqbwo^9207449521?6
31	Ferris Hinton	Lareina	%B7862394064013776^PuyrylxCongaq^7603327458?5
32	Leo Frank	Haley	%B6743824714036359^GwvnvtxGbprjy^6910192394?3
33	Clare Conrad	Justina	%B4235072632695562^LbdfcprPqegej^9309643157?6
34	Ahmed Emerson	Katell	%B6477366076191795^FvmduplRyxkdi^24045571140?6
35	Nola Levine	Maxwell	%B2738804776950860^CqonyroHjrdck^59097477?4
36	Brynn Bean	Deborah	%B2029615186353729^ZmmbmmsDdqooy^8811998299?2
37	Chase Farley	Guinevere	%B1173604678855872^EtwkjdhKhsghc^93023377?4
38	Maile Rosa	Ella	%B7127112228562258^SlhumduDyxmkt^30038454? 
39	Zoe Morrow	Sybill	%B5015253775745815^XlxjyquRdmlxt^5809729262?5
40	Colleen Golden	Yvonne	%B8589946944183336^XjgiqvqUvgfcf^0209690722?4
41	Hakeem Crane	Yeo	%B7136358138073631^CqrpjqeUccwge^2005237312?8
42	Uriah Foster	Sage	%B4579481402543211^WzgqywjCpxmxm^4507955728?4
43	Dana Chang	Angelica	%B8256153595228372^UtcsrewXtklbl^85045982838?7
44	Kato Torres	Griffin	%B2854626389884053^VemjmprYftzuq^18026312779? 
45	Rhea Moody	Benedict	%B2251164823151516^TmovkmlRujrwt^07054848?7
46	Hyatt Gillespie	Hedy	%B6977305419060439^OcionwsNhbzxf^92077516?9
47	Graham Barlow	Ria	%B8626933178048637^WohppmfPinmij^10092916?8
48	Blaze Koch	Shelby	%B5644976122366452^CbcvgnhQwqxqr^98072834976?7
49	Neve Holder	Kadeem	%B7520588047778472^WkvkgvyLqdycl^68093322?3
50	Wendy Lang	Karina	%B7321669943688090^OozqqekOkrcxu^11125224?2
51	Sawyer Estes	Camille	%B5632309346341453^MafdfbuQnfmdo^6704502240?5
52	Beverly Forbes	Alyssa	%B2725911076456476^RztftpoSioxki^9207253178?3
53	Althea Campos	Kimberley	%B2764278363738612^TllvnqcHixskf^22111376974?8
54	Avram Downs	Bert	%B9324288947787210^KsyrfwpWhmtnn^6707888428?1
55	Iona Newman	Alden	%B7342865176862271^BufogscVlfugw^3210479425?1
56	Stephanie Mcintyre	Deborah	%B7397426249952522^PxcrupyYrilcl^4104591914?6
57	Hop Christensen	Ava	%B7165581443112261^HahciwdUcfjqf^60125972037?9
58	Arthur Silva	Herrod	%B7428618331476440^DmjstyuKccvcz^66089797110?8
59	Wylie Levy	Echo	%B2221976556461754^QohlitcIxffzq^2902285857?5
60	Kimberley Cotton	Brian	%B6242667570433673^GnepvfpJwmejv^6806541250?7
61	Venus Frost	Amity	%B3874862817287621^OyavyjnByltrl^0611770854?8
62	Igor Wooten	Dalton	%B7738948348021819^WsfpmotErglcb^4403550207?2
63	Jackson Pierce	Sage	%B2176854670636422^KdubrbqOmtunk^3206581469?7
64	Jemima Langley	Arden	%B7413650866066745^YpuzkbdUiryul^18102739037?3
65	Kermit Clayton	Ralph	%B1874679076571612^XotjpypTrnioj^7506681931?5
66	Jena Byers	Kibo	%B4012477532667217^EettiylWmvwnf^7903520322?4
67	Marcia Charles	Samson	%B8366255361346210^NpqmcnsHofjyo^4806886428?8
68	Sara Welch	Veda	%B5258587367537837^RwnxwxuQcwogw^1406152751?2
69	Yuli Barrera	Kirk	%B6561487138465281^OjxadndEyyoov^65052656?8
70	Kasper Hoffman	Howard	%B1655921208164004^TnjoyjwBzescr^46045158?1
71	Lucy Ashley	Robin	%B5951818163877167^MspqqocTfgudv^9608778119? 
72	Larissa Faulkner	Honorato	%B1076110982996388^TjdujgxPqecsm^59088839866? 
73	Samson Gonzales	Griffin	%B7137827943338354^DmxbqobHlhxcg^8202979651?7
74	Karly Rollins	Chelsea	%B2155374545843068^PyrvfqsRdmlrl^58097656?6
75	Clark Parks	Joshua	%B8798758082694687^NpiyorbPovdyo^8105210924? 
76	Gabriel Lott	Latifah	%B5753451867897795^AvlyifwYgmcho^92025255?2
77	Candice Woods	Judah	%B6228831343487287^IpmrivfGngvpc^5602288481?1
78	Neil Castillo	Kibo	%B8671576482952435^BhfnfysBrgbxw^4708671446?7
79	Timothy Jensen	Leonard	%B3917157916220238^DoectwrJlkbiu^62104395531?1
80	Branden Rasmussen	Zorita	%B7002817367683645^TdujsraKeeypd^68032149?6
81	Mariam Woodard	Kareem	%B7916782264896229^LuqggjcFdnnkd^2104162145?4
82	Nomlanga Lynn	Lucius	%B2367273571942984^DnqcvonXgxckv^15068336489?9
83	Karyn Cabrera	Ashton	%B6416159258227521^YliimlgGguruo^26108288611?8
84	Autumn Stark	Alice	%B8882722799173608^OyopcprIlmepf^5508171490?6
85	Rebekah Rocha	Lance	%B5624615281147356^SoeynljBbqkbd^84083896?8
86	Lesley Hodges	Simone	%B8457482875312343^GpxyshtTjlyrs^71075763947?4
87	Colin Jordan	Hammett	%B4858112416455015^UygclgyRogyke^14118281537?3
88	Dillon Green	May	%B7275358979474548^TdwstuhPeqlfm^16077609853?9
89	Risa Norton	Wallace	%B7553813284701988^YygshfcMwxhej^58101442419?3
90	Leila Rhodes	Jared	%B5971827871731122^VdrtplrLhxrpj^7107797147?7
91	Daquan Caldwell	Yardley	%B6002582586358532^WpnxkxsTvqbyv^6609875900?1
92	Dacey Riddle	Simone	%B4576762470155618^IlsvyjnLxdoib^24108492?5
93	Jenna Nichols	Shay	%B5757401876356228^EehiuejWueirt^49036353?2
94	Sybil Delaney	Hyatt	%B4556518341806771^WtemcdvPnxugo^67045367?3
95	Alisa Hahn	Rhona	%B3872047085258674^FtfgoauNngdml^87023319?8
96	Carson Mckenzie	Morgan	%B3421377520606585^KyxnjypHurblg^8004854796?3
97	Aline Craig	Kato	%B9273626778678432^UivciddKqhbcr^96026343178?4
98	Calista Pennington	Stuart	%B5743541160645447^PmodxqqHhmvkk^51016418927?5
99	Brooke Reynolds	Abdul	%B2877234672848275^TwgqfyfWopxpn^6308609499?9
100	Lyle Mann	Olivia	%B4725437182131814^BlktwxcByjikk^6307606766?6
\.


--
-- TOC entry 3114 (class 0 OID 16818)
-- Dependencies: 213
-- Data for Name: video; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.video (id, game_id, url, size) FROM stdin;
1	198	http://walmart.com/en-ca?search=1&q=de	159307
2	139	https://pinterest.com/fr?k=0	121508
3	217	https://nytimes.com/site?client=g	115897
4	127	https://instagram.com/settings?search=1&q=de	489803
5	144	https://nytimes.com/one?ab=441&aad=2	152663
6	203	https://ebay.com/group/9?q=4	315638
7	222	http://guardian.co.uk/fr?client=g	461768
8	159	http://instagram.com/en-ca?q=4	221258
9	180	https://instagram.com/en-us?client=g	241636
10	215	https://reddit.com/one?q=test	147487
11	190	http://youtube.com/en-us?str=se	126729
12	223	https://zoom.us/fr?search=1	233999
13	126	http://google.com/settings?k=0	247876
14	146	http://ebay.com/one?client=g	441704
15	135	http://bbc.co.uk/site?page=1&offset=1	481504
16	136	https://twitter.com/fr?q=test	324128
17	213	http://wikipedia.org/user/110?ad=115	205917
18	171	http://pinterest.com/fr?q=4	287089
19	132	http://wikipedia.org/one?search=1	449068
20	209	https://yahoo.com/settings?search=1&q=de	393651
21	223	https://netflix.com/en-ca?q=test	468536
22	140	http://wikipedia.org/site?q=4	303976
23	139	https://whatsapp.com/group/9?q=0	281889
24	136	http://nytimes.com/settings?q=4	269786
25	165	https://facebook.com/group/9?q=11	488108
26	216	https://zoom.us/sub?q=test	470869
27	166	http://bbc.co.uk/one?client=g	433665
28	192	http://wikipedia.org/sub/cars?client=g	403613
29	203	http://whatsapp.com/sub?q=test	415584
30	164	https://wikipedia.org/user/110?search=1	349744
31	178	https://twitter.com/en-us?search=1&q=de	484260
32	139	https://yahoo.com/one?g=1	401398
33	196	http://instagram.com/en-us?search=1	356419
34	161	https://youtube.com/user/110?q=test	493105
35	216	http://cnn.com/sub?q=test	489324
36	198	http://bbc.co.uk/site?q=11	469449
37	134	https://naver.com/en-ca?search=1	104472
38	155	https://bbc.co.uk/sub/cars?g=1	454050
39	159	http://twitter.com/one?search=1	197942
40	164	https://walmart.com/site?g=1	335302
41	212	https://facebook.com/sub?gi=100	420863
42	184	http://google.com/user/110?q=0	256922
43	150	http://yahoo.com/settings?ad=115	386964
44	149	http://instagram.com/sub/cars?q=test	468729
45	201	http://pinterest.com/sub/cars?client=g	382141
46	133	http://pinterest.com/en-ca?q=test	374846
47	154	https://youtube.com/one?client=g	432233
48	127	http://google.com/en-ca?str=se	208974
49	154	https://guardian.co.uk/sub/cars?str=se	363000
50	167	https://reddit.com/user/110?search=1	282116
51	179	http://netflix.com/en-us?page=1&offset=1	142514
52	140	http://cnn.com/sub?k=0	161990
53	218	https://instagram.com/en-us?q=4	101534
54	195	http://google.com/en-ca?p=8	215768
55	134	http://instagram.com/en-us?q=0	281723
56	193	http://guardian.co.uk/group/9?q=0	290879
57	221	https://wikipedia.org/user/110?page=1&offset=1	241702
58	174	https://ebay.com/one?q=0	361058
59	221	https://instagram.com/sub?p=8	234597
60	129	http://reddit.com/en-ca?ad=115	413023
61	147	http://walmart.com/group/9?str=se	470498
62	220	http://reddit.com/sub/cars?search=1	107406
63	207	http://walmart.com/site?search=1	464180
64	214	http://guardian.co.uk/group/9?ad=115	435741
65	143	https://wikipedia.org/one?q=4	473608
66	127	https://google.com/fr?q=11	428823
67	157	http://yahoo.com/group/9?q=0	264755
68	135	https://ebay.com/settings?page=1&offset=1	133439
69	145	http://pinterest.com/site?ab=441&aad=2	472267
70	129	https://naver.com/user/110?page=1&offset=1	339587
71	129	http://instagram.com/one?q=test	278415
72	214	http://pinterest.com/user/110?q=4	289241
73	195	https://yahoo.com/sub?p=8	442372
74	208	https://bbc.co.uk/site?q=0	452787
75	184	http://walmart.com/sub?search=1&q=de	142676
76	170	https://nytimes.com/one?search=1	157561
77	218	https://naver.com/en-us?gi=100	250916
78	191	https://twitter.com/sub/cars?client=g	140689
79	129	http://reddit.com/settings?ab=441&aad=2	214593
80	163	https://whatsapp.com/en-ca?q=0	489864
81	177	http://netflix.com/en-us?q=4	197117
82	149	https://guardian.co.uk/group/9?client=g	128978
83	172	https://bbc.co.uk/group/9?page=1&offset=1	242081
84	218	http://google.com/one?p=8	190318
85	221	https://baidu.com/sub/cars?gi=100	346484
86	203	https://youtube.com/user/110?q=4	256074
87	181	http://youtube.com/en-us?g=1	419979
88	140	https://wikipedia.org/en-us?gi=100	383084
89	153	https://guardian.co.uk/one?p=8	408571
90	186	https://baidu.com/one?client=g	112518
91	159	http://facebook.com/settings?g=1	261822
92	163	http://cnn.com/one?q=11	106925
93	199	http://twitter.com/sub?search=1&q=de	450840
94	131	https://instagram.com/user/110?p=8	489033
95	207	http://nytimes.com/fr?search=1	395310
96	152	https://facebook.com/sub/cars?search=1&q=de	360042
97	148	https://netflix.com/one?search=1	133689
98	130	http://facebook.com/fr?q=test	410488
99	178	https://instagram.com/sub?q=11	278036
100	136	http://guardian.co.uk/settings?q=4	378309
\.


--
-- TOC entry 3117 (class 0 OID 16860)
-- Dependencies: 216
-- Data for Name: wishlist; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.wishlist (user_id, game_id) FROM stdin;
74	189
51	127
28	188
98	139
7	163
33	133
91	204
3	146
67	145
82	132
33	143
97	144
76	146
58	220
68	206
82	192
37	188
98	133
90	157
40	136
44	195
65	225
24	187
30	144
64	158
72	204
74	129
16	180
48	151
41	200
73	131
32	224
60	162
93	208
15	138
64	182
87	222
1	163
11	150
87	201
3	171
60	136
2	192
19	203
26	156
72	183
97	185
12	149
98	197
59	158
15	196
68	132
52	179
18	146
14	174
9	200
57	210
71	188
4	186
90	163
29	148
93	213
48	222
22	146
79	194
89	186
41	138
60	183
49	166
83	187
37	215
43	196
84	154
72	132
80	153
26	186
60	203
83	212
27	157
62	192
96	142
7	136
99	161
74	148
64	168
4	195
74	205
11	178
71	196
29	147
76	197
79	165
45	189
17	194
31	133
23	150
6	210
96	210
37	177
56	190
\.


--
-- TOC entry 3131 (class 0 OID 0)
-- Dependencies: 206
-- Name: bandles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.bandles_id_seq', 117, true);


--
-- TOC entry 3132 (class 0 OID 0)
-- Dependencies: 210
-- Name: games_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.games_id_seq', 225, true);


--
-- TOC entry 3133 (class 0 OID 0)
-- Dependencies: 204
-- Name: genres_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.genres_id_seq', 20, true);


--
-- TOC entry 3134 (class 0 OID 0)
-- Dependencies: 208
-- Name: regions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.regions_id_seq', 29, true);


--
-- TOC entry 3135 (class 0 OID 0)
-- Dependencies: 202
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.users_id_seq', 100, true);


--
-- TOC entry 3136 (class 0 OID 0)
-- Dependencies: 212
-- Name: video_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.video_id_seq', 100, true);


--
-- TOC entry 2938 (class 2606 OID 16782)
-- Name: bandles bandles_name_key; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.bandles
    ADD CONSTRAINT bandles_name_key UNIQUE (name);


--
-- TOC entry 2940 (class 2606 OID 16780)
-- Name: bandles bandles_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.bandles
    ADD CONSTRAINT bandles_pkey PRIMARY KEY (id);


--
-- TOC entry 2946 (class 2606 OID 16805)
-- Name: games games_name_key; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_name_key UNIQUE (name);


--
-- TOC entry 2948 (class 2606 OID 16803)
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (id);


--
-- TOC entry 2934 (class 2606 OID 16772)
-- Name: genres genres_name_key; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.genres
    ADD CONSTRAINT genres_name_key UNIQUE (name);


--
-- TOC entry 2936 (class 2606 OID 16770)
-- Name: genres genres_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.genres
    ADD CONSTRAINT genres_pkey PRIMARY KEY (id);


--
-- TOC entry 2962 (class 2606 OID 16879)
-- Name: grades grades_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.grades
    ADD CONSTRAINT grades_pkey PRIMARY KEY (user_id, game_id);


--
-- TOC entry 2954 (class 2606 OID 16839)
-- Name: profiles profiles_email_key; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.profiles
    ADD CONSTRAINT profiles_email_key UNIQUE (email);


--
-- TOC entry 2956 (class 2606 OID 16837)
-- Name: profiles profiles_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.profiles
    ADD CONSTRAINT profiles_pkey PRIMARY KEY (user_id);


--
-- TOC entry 2958 (class 2606 OID 16849)
-- Name: purchases purchases_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.purchases
    ADD CONSTRAINT purchases_pkey PRIMARY KEY (user_id, game_id);


--
-- TOC entry 2942 (class 2606 OID 16792)
-- Name: regions regions_name_key; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.regions
    ADD CONSTRAINT regions_name_key UNIQUE (name);


--
-- TOC entry 2944 (class 2606 OID 16790)
-- Name: regions regions_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.regions
    ADD CONSTRAINT regions_pkey PRIMARY KEY (id);


--
-- TOC entry 2964 (class 2606 OID 16897)
-- Name: reviews reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY (user_id, game_id);


--
-- TOC entry 2930 (class 2606 OID 16762)
-- Name: users users_login_key; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_login_key UNIQUE (login);


--
-- TOC entry 2932 (class 2606 OID 16760)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 2950 (class 2606 OID 16823)
-- Name: video video_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.video
    ADD CONSTRAINT video_pkey PRIMARY KEY (id);


--
-- TOC entry 2952 (class 2606 OID 16825)
-- Name: video video_url_key; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.video
    ADD CONSTRAINT video_url_key UNIQUE (url);


--
-- TOC entry 2960 (class 2606 OID 16864)
-- Name: wishlist wishlist_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.wishlist
    ADD CONSTRAINT wishlist_pkey PRIMARY KEY (user_id, game_id);


--
-- TOC entry 2966 (class 2606 OID 16811)
-- Name: games games_bandle_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_bandle_id_fkey FOREIGN KEY (bandle_id) REFERENCES public.bandles(id) ON DELETE SET NULL;


--
-- TOC entry 2965 (class 2606 OID 16806)
-- Name: games games_genre_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_genre_id_fkey FOREIGN KEY (genre_id) REFERENCES public.genres(id) ON DELETE SET NULL;


--
-- TOC entry 2974 (class 2606 OID 16885)
-- Name: grades grades_game_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.grades
    ADD CONSTRAINT grades_game_id_fkey FOREIGN KEY (game_id) REFERENCES public.games(id) ON DELETE CASCADE;


--
-- TOC entry 2973 (class 2606 OID 16880)
-- Name: grades grades_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.grades
    ADD CONSTRAINT grades_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 2968 (class 2606 OID 16840)
-- Name: profiles profiles_region_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.profiles
    ADD CONSTRAINT profiles_region_id_fkey FOREIGN KEY (region_id) REFERENCES public.regions(id) ON DELETE SET NULL;


--
-- TOC entry 2970 (class 2606 OID 16855)
-- Name: purchases purchases_game_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.purchases
    ADD CONSTRAINT purchases_game_id_fkey FOREIGN KEY (game_id) REFERENCES public.games(id) ON DELETE CASCADE;


--
-- TOC entry 2969 (class 2606 OID 16850)
-- Name: purchases purchases_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.purchases
    ADD CONSTRAINT purchases_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 2976 (class 2606 OID 16903)
-- Name: reviews reviews_game_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_game_id_fkey FOREIGN KEY (game_id) REFERENCES public.games(id) ON DELETE CASCADE;


--
-- TOC entry 2975 (class 2606 OID 16898)
-- Name: reviews reviews_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 2967 (class 2606 OID 16826)
-- Name: video video_game_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.video
    ADD CONSTRAINT video_game_id_fkey FOREIGN KEY (game_id) REFERENCES public.games(id) ON DELETE CASCADE;


--
-- TOC entry 2972 (class 2606 OID 16870)
-- Name: wishlist wishlist_game_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.wishlist
    ADD CONSTRAINT wishlist_game_id_fkey FOREIGN KEY (game_id) REFERENCES public.games(id) ON DELETE CASCADE;


--
-- TOC entry 2971 (class 2606 OID 16865)
-- Name: wishlist wishlist_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.wishlist
    ADD CONSTRAINT wishlist_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


-- Completed on 2022-11-22 14:56:54

--
-- PostgreSQL database dump complete
--

