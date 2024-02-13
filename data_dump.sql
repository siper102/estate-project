--
-- PostgreSQL database dump
--

-- Dumped from database version 15.4 (Homebrew)
-- Dumped by pg_dump version 15.2

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
-- Name: estates; Type: SCHEMA; Schema: -; Owner: estates_scraper
--

CREATE SCHEMA estates;


ALTER SCHEMA estates OWNER TO estates_scraper;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: district; Type: TABLE; Schema: estates; Owner: estates_scraper
--

CREATE TABLE estates.district (
    district_number bigint,
    district_name text,
    postal_codes text,
    id bigint,
    lon double precision,
    lat double precision
);


ALTER TABLE estates.district OWNER TO estates_scraper;

--
-- Name: estate; Type: TABLE; Schema: estates; Owner: estates_scraper
--

CREATE TABLE estates.estate (
    estate_id character varying(50) NOT NULL,
    link character varying(255) NOT NULL,
    area double precision,
    rooms double precision,
    display_name character varying(255) NOT NULL,
    location bigint,
    postal_code character varying(5),
    street character varying(50),
    lat double precision,
    lon double precision,
    construction_year bigint
);


ALTER TABLE estates.estate OWNER TO estates_scraper;

--
-- Name: ml_stats; Type: TABLE; Schema: estates; Owner: estates_scraper
--

CREATE TABLE estates.ml_stats (
    id bigint NOT NULL,
    model_tag character varying(40),
    trained_at timestamp with time zone,
    train_score double precision,
    test_score double precision,
    mse_train double precision,
    in_production boolean,
    train_size bigint,
    test_size bigint,
    training_time double precision
);


ALTER TABLE estates.ml_stats OWNER TO estates_scraper;

--
-- Name: ml_stats_id_seq; Type: SEQUENCE; Schema: estates; Owner: estates_scraper
--

CREATE SEQUENCE estates.ml_stats_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE estates.ml_stats_id_seq OWNER TO estates_scraper;

--
-- Name: ml_stats_id_seq; Type: SEQUENCE OWNED BY; Schema: estates; Owner: estates_scraper
--

ALTER SEQUENCE estates.ml_stats_id_seq OWNED BY estates.ml_stats.id;


--
-- Name: price; Type: TABLE; Schema: estates; Owner: estates_scraper
--

CREATE TABLE estates.price (
    price double precision NOT NULL,
    scraped_at timestamp with time zone NOT NULL,
    estate_id character varying(50) NOT NULL,
    source character varying(50) NOT NULL
);


ALTER TABLE estates.price OWNER TO estates_scraper;

--
-- Name: scraper_stats; Type: TABLE; Schema: estates; Owner: estates_scraper
--

CREATE TABLE estates.scraper_stats (
    id bigint NOT NULL,
    crawl_started timestamp with time zone NOT NULL,
    crawl_ended timestamp with time zone NOT NULL,
    crawler_name character varying(60) NOT NULL,
    time_elapsed bigint NOT NULL,
    number_requests bigint,
    number_response bigint,
    number_response_200 bigint,
    finished_reason character varying(50),
    items_scraped bigint
);


ALTER TABLE estates.scraper_stats OWNER TO estates_scraper;

--
-- Name: scraper_stats_id_seq; Type: SEQUENCE; Schema: estates; Owner: estates_scraper
--

CREATE SEQUENCE estates.scraper_stats_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE estates.scraper_stats_id_seq OWNER TO estates_scraper;

--
-- Name: scraper_stats_id_seq; Type: SEQUENCE OWNED BY; Schema: estates; Owner: estates_scraper
--

ALTER SEQUENCE estates.scraper_stats_id_seq OWNED BY estates.scraper_stats.id;


--
-- Name: ml_stats id; Type: DEFAULT; Schema: estates; Owner: estates_scraper
--

ALTER TABLE ONLY estates.ml_stats ALTER COLUMN id SET DEFAULT nextval('estates.ml_stats_id_seq'::regclass);


--
-- Name: scraper_stats id; Type: DEFAULT; Schema: estates; Owner: estates_scraper
--

ALTER TABLE ONLY estates.scraper_stats ALTER COLUMN id SET DEFAULT nextval('estates.scraper_stats_id_seq'::regclass);


--
-- Data for Name: district; Type: TABLE DATA; Schema: estates; Owner: estates_scraper
--

COPY estates.district (district_number, district_name, postal_codes, id, lon, lat) FROM stdin;
11	Altstadt	40213	15879	6.7741	51.22957
55	Angermund	40489	15879	6.78333	51.33333
95	Benrath	40589|40593|40595|40597|40599	15879	6.86667	51.16667
36	Bilk	40221|40223|40225	15879	6.78045	51.20097
12	Carlstadt	40213	15879	6.77287817	51.22152099
15	Derendorf	40468|40476|40477|40479	15879	6.78032398	51.25348168
23	Düsseltal	40237|40239|40470	15879	6.81582	51.23736
82	Eller	40227|40229|40231|40591	15879	6.84010506	51.19779473
38	Flehe	40221|40223|40225|40589	15879	6.77598953	51.19472891
22	Flingern-Nord	40233|40235|40237	15879	6.82341099	51.22986596
21	Flingern-Süd	40233|40235	15879	6.80908799	51.22074151
31	Friedrichstadt	40210|40212|40213|40215|40217	15879	6.78062	51.21296
101	Garath	40593|40595	15879	6.89619541	51.14395199
71	Gerresheim	40625|40627|40629	15879	6.85942	51.23806
16	Golzheim	40468|40474|40476|40477	15879	6.77204	51.24344
72	Grafenberg	40235|40470|40629	15879	6.8275094	51.24156787
33	Hafen	40219|40221	15879	6.73586369	51.21787882
34	Hamm	40221	15879	6.73599	51.20495
98	Hassels	40597|40599	15879	6.87010288	51.18413146
42	Heerdt	40549	15879	6.72329	51.23075
102	Hellerhof	40595	15879	6.90405	51.13035
92	Himmelgeist	40589	15879	6.80714607	51.16819035
93	Holthausen	40589|40591|40599	15879	6.83285236	51.17517283
74	Hubbelrath	40472|40629	15879	6.90801859	51.25784618
97	Itter	40589	15879	6.81611538	51.16898417
53	Kaiserswerth	40489	15879	6.73624	51.30147
56	Kalkum	40489	15879	6.75865173	51.30319892
61	Lichtenbroich	40468|40472	15879	6.8	51.28333
81	Lierenfeld	40229|40231|40233	15879	6.8256855	51.21177655
52	Lohausen	40474|40489	15879	6.74476862	51.27363546
73	Ludenberg	40625|40629	15879	6.8651247	51.2548918
43	Lörick	40547|40549	15879	6.72901869	51.24440221
64	Mörsenbroich	40237|40239|40470	15879	6.80384159	51.25568413
44	Niederkassel	40547	15879	6.7535	51.24172
37	Oberbilk	40225|40227|40229|40233|40591	15879	6.80843	51.20678
41	Oberkassel	40545|40547|40549	15879	6.74698	51.23011
14	Pempelfort	40211|40213|40474|40476|40477|40479	15879	6.78526	51.23828
63	Rath	40470|40472|40629	15879	6.81564	51.26664
94	Reisholz	40599	15879	6.8592453	51.17902014
13	Stadtmitte	40210|40211|40212|40213|40233	15879	6.78362846	51.22532412
51	Stockum	40468|40474	15879	6.75260067	51.26465396
84	Unterbach	40627|40721	15879	6.9	51.2
32	Unterbilk	40213|40217|40219|40221|40223	15879	6.77038908	51.21395411
62	Unterrath	40468|40472	15879	6.78333	51.26667
96	Urdenbach	40593|40595|40597	15879	6.86727047	51.14893259
83	Vennhausen	40627	15879	6.85	51.21667
35	Volmerswerth	40221	15879	6.76236391	51.18703659
91	Wersten	40225|40589|40591	15879	6.81667	51.18333
54	Wittlaer	40489	15879	6.7329669	51.326321
\.


--
-- Data for Name: estate; Type: TABLE DATA; Schema: estates; Owner: estates_scraper
--

COPY estates.estate (estate_id, link, area, rooms, display_name, location, postal_code, street, lat, lon, construction_year) FROM stdin;
18346113	https://www.wohnungsboerse.net/immodetail/18346113	64	3.5	Wohnung wird noch bewohnt. Ein früherer Termin ist evtl. möglich.	52	42857	Alexanderstr.	51.1757	7.18641	\N
235ql57	https://www.immowelt.de/expose/235ql57	74	2	Alles Neu! Erstbezug nach Sanierung! Nähe Flughafen	62	40468	Kalkumer Straße 1	\N	\N	1927
24362546	https://www.wohnungsboerse.net/immodetail/24362546	95	3	Helle 3-Zimmer Wohnung in Düsseldorf Pempelfort zu vermieten	14	40477	Jülicher	51.2432	6.78823	1959
24zxu5e	https://www.immowelt.de/expose/24zxu5e	67	2	Alles Neu! ERSTBEZUG nach Kernsanierung!	62	40468	Kalkumer Straße 1	\N	\N	1927
26241922	https://www.wohnungsboerse.net/immodetail/26241922	55	2	Zentrales 1-Z-App. möbliert mit Balkon, Aufzug von privat / KEIN VERKAUF!	14	40477	Jülicher	51.2432	6.78823	1959
26640415	https://www.wohnungsboerse.net/immodetail/26640415	37	1	1 Zimmer -Apartment in ruhiger Einfamilienhaussiedlung in Vennhausenzu vermieten	83	40627	Reichenbacher	51.2137	6.85399	1990
26800673	https://www.wohnungsboerse.net/immodetail/26800673	37	1	1Zimmer-Apartment in Düsseldorf-Vennhausen zu vermieten	83	40627	Reichenbacher	51.2137	6.85399	1990
26899927	https://www.wohnungsboerse.net/immodetail/26899927	79	3	Moderne 3 Zimmer Wohnung Provisionsfrei freifinanziert	52	47798	Cracauerstr.	51.3367	6.57186	1980
27035171	https://www.wohnungsboerse.net/immodetail/27035171	57	2	1 Monat mietfrei ! Gepflegte 2 Zimmer Wohnung, offene Küche, direkt vom Eigentümer.	73	40629	Ludenberger	51.24	6.83495	1995
27065153	https://www.wohnungsboerse.net/immodetail/27065153	35	1	Exklusives Angebot: Möblierte 5* Wohnung "Altstadt" in Düsseldorf Derendorf	15	40476	Weißenburgstraße	51.2477	6.78775	2016
27088008	https://www.wohnungsboerse.net/immodetail/27088008	83.9	3	In bester Lage in Düsseldorf: Schicke 3-Zimmer-Wohnung  mit Balkon	73	40629	\N	51.255	6.88361	\N
27092355	https://www.wohnungsboerse.net/immodetail/27092355	274	6	Rhein-Panoramablick bis Altstadt,Decke bis 7,5 m,Wohnzi. ca. 80 qm, 6 Zi., 3 Bäder.	16	40474	\N	51.2738	6.74219	2005
27092375	https://www.wohnungsboerse.net/immodetail/27092375	460	8	Cecilienallee! Rheinblick, höhe Decken, kein Strassenlärm, Traumgarten,Wohnen und Luxus-Büro.	16	40474	\N	51.2738	6.74219	1903
285hy5x	https://www.immowelt.de/expose/285hy5x	63	2	ERSTBEZUG: Hochwertig sanierte 2-Zimmer Wohnung in Düsseldorf Eller	82	40229	\N	\N	\N	1974
28806724	https://www.wohnungsboerse.net/immodetail/28806724	76.17	2	Helle 2 Zimmer Wohnung in Benrath	95	40597	Cäcilienstr.	51.1654	6.87388	1991
28mtp5n	https://www.immowelt.de/expose/28mtp5n	28	1	Möbliertes Wohnen Zentral in Düsseldorf - Standard Apartment 	36	40225	Himmelgeister Straße 270	\N	\N	\N
28vey5x	https://www.immowelt.de/expose/28vey5x	63	2	Erstklassig möblierte 2-Zimmer Wohnung in Düsseldorf-Eller	82	40229	\N	\N	\N	1974
29314952	https://www.wohnungsboerse.net/immodetail/29314952	30	1	Vollmöbliertes Apartment - Cube River Düsseldorf	64	40239	Heinrichstraße	51.247	6.8089	2022
29317989	https://www.wohnungsboerse.net/immodetail/29317989	20.09	1	Vollmöbliertes Apartment -Cube River Düsseldorf	64	40239	Heinrichstraße	51.247	6.8089	2022
29486749	https://www.wohnungsboerse.net/immodetail/29486749	38	1	AvidonApartments luxury serviced Double Superior Apartment with Balcony	62	40468	Unterrather	51.2753	6.78637	\N
29486814	https://www.wohnungsboerse.net/immodetail/29486814	28	1	AvidonApartments luxury serviced Single Deluxe Apartment	62	40468	Unterrather	51.2753	6.78637	\N
29631528	https://www.wohnungsboerse.net/immodetail/29631528	47	2	Vollmöbliertes Apartment- Cube River Düsseldorf	64	40239	Heinrichstraße	51.247	6.8089	\N
296ck5z	https://www.immowelt.de/expose/296ck5z	38	2	Demnächst frei! 2-Zimmer-Wohnung in Düsseldorf	37	40227	Höhenstraße 85	\N	\N	1906
29tsj5z	https://www.immowelt.de/expose/29tsj5z	53	2	2-Zimmer-Wohnung in Düsseldorf Lierenfeld	37	40591	Kaiserslauterner Straße 38	\N	\N	1954
29xvb5v	https://www.immowelt.de/expose/29xvb5v	24	1	Möbliertes Apartment mit Balkon in Düsseldorf- Rath!	63	40472	Kanzlerstr. 8a	\N	\N	1992
29yz55s	https://www.immowelt.de/expose/29yz55s	44	2	Außergewöhnliche Single-Dachgeschosswohnung mit EBK und Gartenbenutzung in D.-Oberbilk	91	40591	Siegburger Straße xx	\N	\N	\N
2a2dp5e	https://www.immowelt.de/expose/2a2dp5e	26	1	Möbliertes Apartment mit Balkon in Düsseldorf- Rath!	63	40472	Kanzlerstr. 8a	\N	\N	1992
2a7rr55	https://www.immowelt.de/expose/2a7rr55	29	1	Möbliertes Apartment in Düsseldorf - Rath	63	40472	Kanzlerstr. 8a	\N	\N	1992
2an5v54	https://www.immowelt.de/expose/2an5v54	23	1	Möbliertes Apartment mit Balkon in Düsseldorf - Rath	63	40472	Kanzlerstr. 8a	\N	\N	1992
2aql75g	https://www.immowelt.de/expose/2aql75g	90	3	Charmante 3 Zimmer Wohnung in einen sanierten Mehrfamilienhaus in sehr begehrte Lage. 	16	40476	Mauerstr. 22	\N	\N	\N
2as9e5x	https://www.immowelt.de/expose/2as9e5x	90	3	Möblierte, lichtdurchflutete 3-Zimmer-Wohnung in Oberkassel! Ab sofort!	41	40545	\N	\N	\N	\N
2au925n	https://www.immowelt.de/expose/2au925n	116	4	Exclusive 4 - Zimmer - Wohnung in D - Pempelfort	14	40477	\N	\N	\N	\N
2b28n5l	https://www.immowelt.de/expose/2b28n5l	84	2	Schicke 2-Zimmer-Dachgeschosswohnung auf der Pestalozzistraße	42	40549	Pestalozzistraße	\N	\N	2003
2b2j65x	https://www.immowelt.de/expose/2b2j65x	45	1	Möbliertes, großzügig geschnittenes 1-Zimmer-Appartment mit sonnigem Balkon	53	40489	\N	\N	\N	\N
2b2r25u	https://www.immowelt.de/expose/2b2r25u	120	3	Schickes Penthouse mit umlaufender Terrasse	16	40474	Füllenbachstraße 6	\N	\N	\N
2b4lu5n	https://www.immowelt.de/expose/2b4lu5n	62	2	Erstbezug! Sanierte 2-Zi-Whg mit Balkon in ruhiger Lage	83	40627	Erlenkamp 8	\N	\N	\N
2b5ud5n	https://www.immowelt.de/expose/2b5ud5n	60	2	2-Zimmer-Wohnung in Düsseldorf Rath	63	40472	Helmutstraße 17	\N	\N	1890
2b8r25u	https://www.immowelt.de/expose/2b8r25u	90	2	Sehr schöne 2 Zimmer Wohnung	16	40474	Füllenbachstraße 6	\N	\N	\N
2baud57	https://www.immowelt.de/expose/2baud57	73	2	Düsseldorf-Golzheim, möblierte 2 Zimmer,Küche,Bad,Keller 	16	40474	Ürdinger Straße 24	\N	\N	1928
2bbma5g	https://www.immowelt.de/expose/2bbma5g	85	3	Ruhige Grüne sichere zentrumsnahe Oase Nähe Universität	82	40229	\N	\N	\N	\N
2bbsa5e	https://www.immowelt.de/expose/2bbsa5e	94	3	Top-Wohnung mit 3 Zimmern, offener Galerie, Kamin und großem Balkon in Kaiserswerth!	53	40489	\N	\N	\N	\N
2bc4f5z	https://www.immowelt.de/expose/2bc4f5z	70	2	70 qm vom Feinsten - in Toplage Düsseldorfs	22	40235	Hohenzollernallee 4	\N	\N	\N
2bcee5z	https://www.immowelt.de/expose/2bcee5z	73	2	Helle Penthousewohnung mit Dachterrasse - 2 Zi, 73 qm	31	40215	Jahnstraße 11 A	\N	\N	\N
2bd4d5z	https://www.immowelt.de/expose/2bd4d5z	59	3	Demnächst frei! 3-Zimmer-Wohnung in Düsseldorf Vennhausen	83	40627	In den Kötten 11	\N	\N	\N
2bd7g5t	https://www.immowelt.de/expose/2bd7g5t	108	3	Bei VIVAWEST die Sonnenstrahlen auf dem eigenen Balkon genießen.	95	40597	Max-Schmeling-Straße 2c	\N	\N	\N
2bd8c5q	https://www.immowelt.de/expose/2bd8c5q	\N	3	EXKLUSIVES LOFT/PEMPELFORT/INNENHOF/PROVISIONSFREI TEILSANIERT 3-4 RÄUME 2 EBENEN, 2 WCs STELLPLÄTZE	14	40477	Fischerstr. 19	\N	\N	\N
2bdga5v	https://www.immowelt.de/expose/2bdga5v	65	2	FRISCH SANIERTE 2 ZIMMER ERDGESCHOSSWOHNUNG IN RUHIGER LAGE MIT TERRASSE	83	40627	Vennhauser Allee 186	\N	\N	1974
2bghd5r	https://www.immowelt.de/expose/2bghd5r	45	1	schönes Apartment in Düsseldorf-Pempelfort	14	40477	Stockkampstr.	\N	\N	\N
2bh5l55	https://www.immowelt.de/expose/2bh5l55	40	1	Schöne Lage in Hubbelrath! Appartement für Wochenendheimfahrer (Terrasse, möbliert, Parken)	74	40629	\N	\N	\N	\N
2bjpx5g	https://www.immowelt.de/expose/2bjpx5g	149	5	Großzügige und sanierte 5-Zimmerwohnung mit Blick ins Grüne, Einbauküche und Balkon	52	40474	\N	\N	\N	\N
2bn2p5x	https://www.immowelt.de/expose/2bn2p5x	56	2	2-Zimmer-DG-Wohnung mit modernem Tageslichtbad	63	40472	Bochumer Straße 4	\N	\N	\N
2bnm958	https://www.immowelt.de/expose/2bnm958	35	\N	Apartment mit SW-Balkon	54	40489	Bergesweg 23	\N	\N	1973
2bp2a5y	https://www.immowelt.de/expose/2bp2a5y	85	3	3-Zimmer Neubau am Grafenberger Wald	73	40629	\N	\N	\N	\N
2bpef5x	https://www.immowelt.de/expose/2bpef5x	90	3	Charmante 3-Zimmer-Maisonettewohnung mit Balkon über den Dächern von Kaiserswerth	53	40489	\N	\N	\N	\N
2bpyb5w	https://www.immowelt.de/expose/2bpyb5w	75	3	Bringen Sie Ihr Herz mit, es wird sich wohlfühlen!	95	40597	Cäcilie-Beuken-Straße 11	\N	\N	\N
2bq3n5y	https://www.immowelt.de/expose/2bq3n5y	86	2	2-Zimmer-Neubau-Gartenwohnung in gepflegter Umgebung	84	40627	\N	\N	\N	\N
2bqxr5c	https://www.immowelt.de/expose/2bqxr5c	61	2	Demnächst frei! 2-Zimmer-Wohnung in Düsseldorf Eller	82	40231	Trebnitzer Straße 8	\N	\N	\N
2bqz55y	https://www.immowelt.de/expose/2bqz55y	39	1	47104/38 Helles 1-Zimmer-Appartement in D-Wittlaer	54	40489	Heinrich-Holtschneider Weg 7	\N	\N	\N
2bubg5q	https://www.immowelt.de/expose/2bubg5q	56	2	Vier Wände zum Wohlfühlen.	95	40597	Max-Schmeling-Straße 4d	\N	\N	\N
2bup85u	https://www.immowelt.de/expose/2bup85u	24	1	Für Wochenendpendler ! ! ! Schönes teilmöbliertes Souterrain-Apartment in Grafenberg am Ostpark	72	40629	Wittelsbachstraße 	\N	\N	\N
2bwtl5u	https://www.immowelt.de/expose/2bwtl5u	83	2	***Wunderschöne 2-Zimmer-Wohnung mit Terrasse und offenem Küchenbereich in Düsseldorf***	73	40629	Am Wildpark 51	\N	\N	\N
2bxgn5l	https://www.immowelt.de/expose/2bxgn5l	63	2	Renoviert! Ideal geschnittene 2-Zimmer-Wohnung mit 2 Balkonen	101	40595	Paul-Bonatz-Str. 27	\N	\N	\N
2c2cq58	https://www.immowelt.de/expose/2c2cq58	68	3	3-Zimmer-Wohnung in Derendorf	15	40476	Essener Str. 14	\N	\N	\N
2c2d45c	https://www.immowelt.de/expose/2c2d45c	40	1	Schickes Appartement in ruhiger Lage mit Einbauküche und Gartennutzung!	73	40629	\N	\N	\N	\N
2c2dt5a	https://www.immowelt.de/expose/2c2dt5a	78	3	3-Zimmer-Wohnung in Düsseldorf-Lörick	41	40547	Niederkasseler Lohweg 20	\N	\N	\N
2c2je5b	https://www.immowelt.de/expose/2c2je5b	97	3	Wunderschöne 3-Zimmer-Wohnung in Düsseldorf	73	40629	Am Wildpark 45	\N	\N	\N
2c2lj52	https://www.immowelt.de/expose/2c2lj52	83	3	Exklusive Neubauwohnung mit 3 Zimmern, Einbauküche und Balkon	36	40223	\N	\N	\N	\N
2c2ng58	https://www.immowelt.de/expose/2c2ng58	64	2	Ruhige und voll möblierte 2,5-Zimmer-Wohnung mit Terrasse in Düsseldorf-Vennhausen	83	40627	\N	\N	\N	1965
2c2pf55	https://www.immowelt.de/expose/2c2pf55	81	3	3-Zimmer-Wohnung in Düsseldorf Hassels	98	40599	Potsdamer Straße 30	\N	\N	\N
2c2wf59	https://www.immowelt.de/expose/2c2wf59	44	2	[TAUSCHWOHNUNG] Biete 2-Zimmer Wohnung in DD-Bilk, Suche Wohnung mit Balkon	36	40223	\N	\N	\N	\N
2c2ww5a	https://www.immowelt.de/expose/2c2ww5a	45	2	exclusive 2 Zi.Wohnung teilmöbeliert - in Uni Nähe	91	40591	Otto-Hahn-Str. 	\N	\N	\N
2c38j5b	https://www.immowelt.de/expose/2c38j5b	80	3	Gut geschnittene 3 Zimner Wohnung 	91	40591	Hügelstrasse 54	\N	\N	\N
2c3ds59	https://www.immowelt.de/expose/2c3ds59	77	3	Gepflegte 3 Zimmer Dachgeschosswohnung in Pempelfort!	14	40477	Mauerstr. 3	\N	\N	\N
2c3hc58	https://www.immowelt.de/expose/2c3hc58	68	2	Gepflegte Eigentumswohnung mit Aufzug und Balkon. Einziehen und Wohlfühlen!	62	40468	Im Huferfeld 26	\N	\N	\N
2c3mv57	https://www.immowelt.de/expose/2c3mv57	40	2	Düsseldorf-Gerresheim: 2 Zimmer-Wohnung	71	40625	\N	\N	\N	\N
2c3pf55	https://www.immowelt.de/expose/2c3pf55	80	3	3-Zimmer-Wohnung in Düsseldorf Hassels	98	40599	Potsdamer Straße 30	\N	\N	\N
2c3xm5a	https://www.immowelt.de/expose/2c3xm5a	60	3	Schicke 3-Zimmer-Wohnung in toller Lage	95	40597	Am Wald 37	\N	\N	\N
2c4hp55	https://www.immowelt.de/expose/2c4hp55	30	1	Gemütliche und Helle 1-Zi. Whg. in Düsseldorf!	13	40210	Stresemannstraße 36	\N	\N	\N
2c4kt59	https://www.immowelt.de/expose/2c4kt59	62	2	DG Whg 62cm² KDB Arbeitsfestvertr. Schufa, k.Tiere,k.Jobcenter	98	40599	\N	\N	\N	\N
2c4pf55	https://www.immowelt.de/expose/2c4pf55	80	3	3-Zimmer-Wohnung in Düsseldorf Hassels	98	40599	Potsdamer Straße 30	\N	\N	\N
2c4y959	https://www.immowelt.de/expose/2c4y959	57	2	2-Zimmer-Wohnung in Düsseldorf	42	40549	Hildegard-Knef-Straße 17	\N	\N	\N
2c5hu55	https://www.immowelt.de/expose/2c5hu55	61	2	Gemütliche 2-Zimmer-Wohnung in erstklassiger Lage - unmittelbare Nähe zum Klemensviertel	53	40489	\N	\N	\N	\N
2c5lj52	https://www.immowelt.de/expose/2c5lj52	63	2	Exklusive Neubauwohnung mit 2 Zimmern, Einbauküche und Balkon	36	40223	\N	\N	\N	\N
2c5pf55	https://www.immowelt.de/expose/2c5pf55	81	3	3 Zimmer-Wohnung in Düsseldorf Hassels	98	40599	Fürstenberger Straße 9	\N	\N	\N
2c5uh5a	https://www.immowelt.de/expose/2c5uh5a	75	3	47105/66 Freundliche 3-Zimmer-Wohnung in Düsseldorf-Wittlaer	54	40489	Friederike-Fliedner-Weg 16	\N	\N	\N
2c6nf55	https://www.immowelt.de/expose/2c6nf55	52	2	2-Zimmer-Wohnung in Düsseldorf Hassels	98	40599	Altenbrückstraße 61	\N	\N	\N
2c6pf55	https://www.immowelt.de/expose/2c6pf55	81	3	3-Zimmer-Wohnung in Düsseldorf Hassels	98	40599	Fürstenberger Straße 15	\N	\N	\N
2c6vn5a	https://www.immowelt.de/expose/2c6vn5a	71	3	Der Rhein um die Hausecke + schöner Schnitt + EBK + beste Lage und Anbindung	95	40597	Benrather Schlossallee 25	\N	\N	\N
2c6xn59	https://www.immowelt.de/expose/2c6xn59	52	3	3-Zimmer-Wohnung in Düsseldorf Eller	82	40229	Schöndorffstraße 26	\N	\N	\N
2c7pf55	https://www.immowelt.de/expose/2c7pf55	81	3	3-Zimmer-Wohnung in Düsseldorf Hassels	98	40599	Fürstenberger Straße 17	\N	\N	1975
2c7vl5b	https://www.immowelt.de/expose/2c7vl5b	48	2	Düsseldorf- Himmelgeist Neubau, 2 Zimmer Wohnung	92	40589	\N	\N	\N	\N
2c84u59	https://www.immowelt.de/expose/2c84u59	58	2	2-Zimmer-Wohnung in Düsseldorf Heerdt	42	40549	Krefelder Straße 155	\N	\N	\N
2c87959	https://www.immowelt.de/expose/2c87959	42	1	[TAUSCHWOHNUNG] Schöne 1,5 Zimmer Wohnung in Bilk	36	40223	\N	\N	\N	\N
2c8an57	https://www.immowelt.de/expose/2c8an57	110	4	Hochwertige 4-Zimmer-Wohnung mit fantastischem Ausblick!	14	40211	Toulouser Allee 19	\N	\N	\N
2c8cq58	https://www.immowelt.de/expose/2c8cq58	79	3	Jetzt schnell zugreifen! 3-Zimmer-Wohnung in Lichtenbroich	61	40472	Am Schorn 31	\N	\N	\N
2c8hw5b	https://www.immowelt.de/expose/2c8hw5b	186	4	Haus im Haus: moderne 4-Zimmer-Wohnung der besonderen Art mit eigenem Garten!	55	40489	\N	\N	\N	\N
2c8lv5b	https://www.immowelt.de/expose/2c8lv5b	65	2	2 Zi Wohnung Neu in Bilk	36	40223	Gogrevestr. 	\N	\N	\N
2c8t855	https://www.immowelt.de/expose/2c8t855	180	5	Familienfreundliches Stadtdomizil mit Sonnenterrasse.	22	40235	\N	\N	\N	\N
2c8uc55	https://www.immowelt.de/expose/2c8uc55	90	2	Voll möbliert wohnen	11	40213	\N	\N	\N	1937
2c8xr58	https://www.immowelt.de/expose/2c8xr58	90	3	Schöne Altbau-Wohnung mit hohen Decken, Parkettfußböden und Balkon	16	40474	Uerdinger Straße 83	\N	\N	\N
2c97z57	https://www.immowelt.de/expose/2c97z57	98	2	WOHNUNG IN NATURNAHER LAGE VON DÜSSELDORF HUBBELRATH ZUR MIETE - RUNDUM NUR FELDER!	74	40629	Ratinger Landstraße 86	\N	\N	\N
2c9hq5a	https://www.immowelt.de/expose/2c9hq5a	57	2	1 Monat mietfrei ! Gepflegte 2 Zimmer Wohnung, offene Küche, direkt vom Eigentümer.	73	40629	Ludenberger Straße 58	\N	\N	1995
2cace58	https://www.immowelt.de/expose/2cace58	40	1	Schönes zentral gelegtes 1-Zimmer-Appartment in Düsseldorf-Pempelfort zu vermieten	14	40211	Pempelforter str. 42	\N	\N	\N
2cajx57	https://www.immowelt.de/expose/2cajx57	64	2	Sanierte, top moderne 2 Zimmer Wohnung in Golzheim!	16	40476	Zietenstr. 	\N	\N	\N
2cakg58	https://www.immowelt.de/expose/2cakg58	85	3	Renovierte 3-Zimmer-Wohnung	32	40219	Lorettostraße 41	\N	\N	\N
2capf55	https://www.immowelt.de/expose/2capf55	81	3	3-Zimmer-Wohnung in Düsseldorf Hassels	98	40599	Fürstenberger Straße 29	\N	\N	\N
2cb2w57	https://www.immowelt.de/expose/2cb2w57	84	3	Helle, renovierte 3-Zimmer-Wohnung, 2 Balkone, Tageslichtbad mit Wanne und Dusche, Keller	93	40589	Eichenkreuzstraße 27	\N	\N	\N
2cbbt5a	https://www.immowelt.de/expose/2cbbt5a	68	2	ACHTUNG - Einkommensgrenzen beachten, Nettoeinkommen angeben, da mietpreisgedämpfte 2-Zimmer Wohnung	41	40547	Niederkasseler Lohweg 20	\N	\N	\N
2cbh958	https://www.immowelt.de/expose/2cbh958	76	3	Großzügige 3-Zimmer-Wohnung in Lichtebroich - bitte den Text lesen	61	40472	Buchholzer Weg 14	\N	\N	\N
2cbv757	https://www.immowelt.de/expose/2cbv757	47	2	2-Zimmer-Wohnung in Düsseldorf Bilk	36	40225	Himmelgeister Straße 110	\N	\N	\N
2cbyr5a	https://www.immowelt.de/expose/2cbyr5a	56	2	Demnächst frei! 2-Zimmer-Wohnung in Düsseldorf Garath	101	40595	Carl-Friedr.-Goerdeler-Straße 4	\N	\N	\N
2ccpf59	https://www.immowelt.de/expose/2ccpf59	26	1	Tolle 1,5 Zimmer-Wohnung mit Balkon und neuem Badezimmer. Bitte Text lesen!	14	40477	Jülicher Str. 13	\N	\N	\N
2cdd55a	https://www.immowelt.de/expose/2cdd55a	86	2	[TAUSCHWOHNUNG] 2-3 Zimmer Altbauwohnung mit Garten direkt an der Düssel	36	40223	\N	\N	\N	\N
2cdlj57	https://www.immowelt.de/expose/2cdlj57	86	2	Wunderschöne 2-Zimmer-Wohnung in Düsseldorf	73	40629	Am Wildpark 41	\N	\N	\N
2cdpp5b	https://www.immowelt.de/expose/2cdpp5b	89	3	Gartenwohnung mit Einbauküche ISD Nähe	53	40489	\N	\N	\N	\N
2cdqq5b	https://www.immowelt.de/expose/2cdqq5b	60	3	Hochwertig sanierte 3-Zimmer-Dachgeschoßwohnung mit coolen Extras und Tageslichtbad mit XXL-Dusche 	81	40231	Reisholzerstraße 1 	\N	\N	\N
2cdwy5a	https://www.immowelt.de/expose/2cdwy5a	96	3	[TAUSCHWOHNUNG] 3 Zimmer Altbautraum	36	40223	\N	\N	\N	\N
2ce4l5b	https://www.immowelt.de/expose/2ce4l5b	60	2	Immobilien-Richter: Kernsanierte und möblierte 2-Zimmerwohnung in Düsseldorf	98	40599	\N	\N	\N	\N
2ce6y54	https://www.immowelt.de/expose/2ce6y54	76	3	Modernes Wohnen! Sanierte 3-Zi-Souterrain-Whg mit Terrasse	83	40627	Erlenkamp 8	\N	\N	\N
2cej553	https://www.immowelt.de/expose/2cej553	84	3	Achtung, 1 Monat Mietfrei! - Viel Platz in ruhiger, grüner Lage	54	40489	Bergesweg 19	\N	\N	\N
2cf8357	https://www.immowelt.de/expose/2cf8357	51	2	*** Schöne 3-Zimmerwohnung in Düsseldorf-Rath ***	63	40472	Oberrather Straße 30a	\N	\N	\N
2cfdv59	https://www.immowelt.de/expose/2cfdv59	74	3	[TAUSCHWOHNUNG] 3-Zimmer Wohnung in Pempelfort mit Balkon	14	40211	\N	\N	\N	\N
2cffc53	https://www.immowelt.de/expose/2cffc53	66	2	Exklusive 2-Zimmer Wohnung in Golzheim	16	40474	Kaiserswerther Straße 115	\N	\N	\N
2cfky58	https://www.immowelt.de/expose/2cfky58	45	2	[TAUSCHWOHNUNG] 45 qm, zentral, Balkon, suche Köln	14	40477	\N	\N	\N	\N
2cflv57	https://www.immowelt.de/expose/2cflv57	160	3	WOHNTRAUM IN RHEINLAGE! 3 Zimmer	96	40593	Am Alten Rhein 34	\N	\N	\N
2cfpf55	https://www.immowelt.de/expose/2cfpf55	58	2	2-Zimmer-Wohnung in Düsseldorf Hassels	98	40599	Potsdamer Straße 51	\N	\N	\N
2cg5757	https://www.immowelt.de/expose/2cg5757	82	2	Charmante Wohnung mit moderner Einbauküche und Balkon	14	40479	Prinz-Georg-Str. 35	\N	\N	\N
2cgpf55	https://www.immowelt.de/expose/2cgpf55	58	2	2-Zimmer-Wohnung in Düsseldorf Hassels	98	40599	Potsdamer Straße 51	\N	\N	\N
2cgq45b	https://www.immowelt.de/expose/2cgq45b	136	5	Sanierte Gartenwohnung 5 Zimmer	51	40474	Niederrheinstraße 4-b	\N	\N	\N
2cgst5b	https://www.immowelt.de/expose/2cgst5b	59	2	Schöne Wohnung sucht neue Bewohner: 2-Zimmer-Wohnung mit tollem Balkon	61	40472	Volkardeyer Weg 21	\N	\N	\N
2cgtf59	https://www.immowelt.de/expose/2cgtf59	38	2	Das Glück hat ein Zuhause. 2-Zimmer-Wohnung in Derendorf	15	40476	Glockenstr. 1	\N	\N	\N
2cgxm5b	https://www.immowelt.de/expose/2cgxm5b	100	2	Wunderschöne 2-Zimmer-Wohnung in Düsseldorf	73	40629	Am Wildpark 45	\N	\N	\N
2ch2t55	https://www.immowelt.de/expose/2ch2t55	105	3	Möblierte 3-Zimmer-Wohnung inkl. WLAN	36	40223	\N	\N	\N	\N
2ch6l56	https://www.immowelt.de/expose/2ch6l56	54	1	 Design Apartment mit Arbeitsbereich	81	40229	 Karlsruher Straße 58, 40229 Düsseldorf, Deutschla	\N	\N	\N
2chng5a	https://www.immowelt.de/expose/2chng5a	57	2	Lichtdurchflutete modernisierte 2-Zimmer Wohnung mit Balkon 	31	40215	Jahnstraße 96	\N	\N	1957
2chpf55	https://www.immowelt.de/expose/2chpf55	83	4	4-Zimmer-Wohnung in Düsseldorf Hassels	98	40599	Potsdamer Straße 51	\N	\N	\N
2chsk55	https://www.immowelt.de/expose/2chsk55	106	4	Perfekt geschnittene Vierraumwohnung mit Loggia auf 106m²	36	40223	Merowingerstraße 32	\N	\N	\N
2chtf59	https://www.immowelt.de/expose/2chtf59	51	2	Tolle 2-Zimmer-Wohnung mit modernem Bad und Balkon in Oberbilk	37	40227	Ellerstr. 115	\N	\N	\N
2chwf59	https://www.immowelt.de/expose/2chwf59	40	2	[TAUSCHWOHNUNG] Düsseldorf Hassels 2-Zimmer Wohnung mit Balkon	98	40599	\N	\N	\N	\N
2cjh356	https://www.immowelt.de/expose/2cjh356	105	4	Traumhafte Maisonettewohnung in Düsseldorf Angermund	55	40489	\N	\N	\N	\N
2cjpf55	https://www.immowelt.de/expose/2cjpf55	65	3	3-Zimmer-Wohnung in Düsseldorf Hassels	98	40599	Potsdamer Straße 5	\N	\N	1975
2ckd85b	https://www.immowelt.de/expose/2ckd85b	66	3	GEMÜTLICHE 3 ZIMMER WOHNUNG IN SCHÖNER LAGE VON VENNHAUSEN MIT GROßEM BALKON	83	40627	Am Ellerforst 1	\N	\N	\N
2ckfw5b	https://www.immowelt.de/expose/2ckfw5b	50	2	Gemütliche 2-Zimmer-Wohnung mit Rheinblick	54	40489	\N	\N	\N	\N
2cklk5b	https://www.immowelt.de/expose/2cklk5b	65	2	Möblierte 2 Zimmer Wohnung mit Loftcharakter	16	40476	Roßstraße 152	\N	\N	\N
2ckpf55	https://www.immowelt.de/expose/2ckpf55	53	2	2-Zimmer-Wohnung in Düsseldorf Hassels	98	40599	Potsdamer Straße 51	\N	\N	1975
2ckqa57	https://www.immowelt.de/expose/2ckqa57	73	3	Traumhafte, renovierte und hochwertig möblierte 3-Zimmer-Wohnung in sehr guter Lage mit großem Südbalkon und eigenem Garten	93	40589	Boschstraße	\N	\N	\N
2cksk55	https://www.immowelt.de/expose/2cksk55	110	4	Wohntraum auf 110m² mit toller Loggia und zwei Bädern	36	40223	Merowingerstraße 32	\N	\N	\N
2ckuj59	https://www.immowelt.de/expose/2ckuj59	50	2	[TAUSCHWOHNUNG] 2 Zimmerwohnung mit Balkon, Ratingen Süd	61	40472	\N	\N	\N	\N
2clgh57	https://www.immowelt.de/expose/2clgh57	63	2	Mit Balkon! Ideal geschnittene 2-Zimmer-Wohnung in Eller	82	40231	Zeppelinstr. 39	\N	\N	\N
2clm555	https://www.immowelt.de/expose/2clm555	55	2	Einziehen und wohlfühlen. Tolle 2-Zimmer-Wohnung mit neuem Bad und Balkon	61	40472	Am Schorn 27	\N	\N	\N
2clud54	https://www.immowelt.de/expose/2clud54	80	3	Schöne sanierte 3 Zimmer Wohnung	36	40223	Burghofstr	\N	\N	\N
2cm2d5b	https://www.immowelt.de/expose/2cm2d5b	41	1	Gemütlich 1-Zimmer-Wohnung mit Einbauküche und Balkon	15	40476	Collenbachstr. 61	\N	\N	\N
2cm9g5b	https://www.immowelt.de/expose/2cm9g5b	82	2	Wunderschöne 2-Zimmer-Wohnung in Düsseldorf	73	40629	Am Wildpark 45	\N	\N	\N
2cmep52	https://www.immowelt.de/expose/2cmep52	25	1	Zentrumsnahes Appartement	15	40476	\N	\N	\N	\N
2cmrh5a	https://www.immowelt.de/expose/2cmrh5a	70	3	47104/39 Charmante 3-Zimmer-Wohnung mit Balkon in D-Wittlaer	54	40489	Heinrich-Holtschneider Weg 7	\N	\N	\N
2cmrt5b	https://www.immowelt.de/expose/2cmrt5b	72	2	Super schöne 2-Zimmer-Wohnung mit modernem Badezimmer und Balkon (dieser wird aktuell saniert)	63	40472	Westfalenstr. 55	\N	\N	\N
2cn8357	https://www.immowelt.de/expose/2cn8357	82	3	WOHNEN AM SCHLOSSPARK! _ 3-RAUM-WOHNUNG MIT LOGGIA IN BEGEHRTER WOHNANLAGE!	102	40595	Osteroderstraße 8	\N	\N	\N
2cn8w5a	https://www.immowelt.de/expose/2cn8w5a	59	2	Attraktive 2 Zimmer Terrassenwohnung mit Concierge und Fitness in D. - Heerdt	42	40549	Heinrich Heine Gärten 22	\N	\N	\N
2cnaq58	https://www.immowelt.de/expose/2cnaq58	67	3	Sanierte 3-Zimmer-Wohnung in Düsseldorf-Lierenfeld, neues Bad+ neue Böden	81	40231	Oderstr. 4	\N	\N	\N
2cnfv56	https://www.immowelt.de/expose/2cnfv56	76	3	Hier ist Platz zum Wohnen	81	40229	Schöndorffstraße 37	\N	\N	\N
2cngq5a	https://www.immowelt.de/expose/2cngq5a	35	1	1 Monat mietfrei ! Klein aber fein, und erschwinglich	73	40629	Ludenberger Strasse 58	\N	\N	\N
2cnqt5b	https://www.immowelt.de/expose/2cnqt5b	72	3	Ihr neues Zuhause: frisch renovierte 3-Zimmer-Wohnung mit neuem Badezimmer und Garten	63	40472	Mintarder Weg 43	\N	\N	\N
2cnrh58	https://www.immowelt.de/expose/2cnrh58	186	5	Exklusives Penthouse in erster Rheinlage in Düsseldorf - Golzheim	16	40474	\N	\N	\N	\N
2cp7v59	https://www.immowelt.de/expose/2cp7v59	99	2	Sonnige 2-Zimmer-Wohnung in Düsseldorf-Heerdt! Gleich 2 schöne Dachterrassen für viel Freiraum	42	40549	\N	\N	\N	\N
2cpdp55	https://www.immowelt.de/expose/2cpdp55	70	3	Klasse Wohnung mit Balkon und EBK!	13	40210	Stresemannstraße 36	\N	\N	\N
2cpkj52	https://www.immowelt.de/expose/2cpkj52	63	2	Exklusive Neubauwohnung mit 2 Zimmern, Einbauküche und Balkon	36	40223	\N	\N	\N	\N
2cpqs5a	https://www.immowelt.de/expose/2cpqs5a	56	2	Wohnung an den Unikliniken	36	40225	Moorenstr. 80	\N	\N	1960
2cq6n5a	https://www.immowelt.de/expose/2cq6n5a	78	3	Schöne 3-Zimmer-Wohnung mit modernem Bad und Vinyl-Böden, 2 Balkone	91	40591	Odenthaler Weg 11	\N	\N	\N
2cqfj5b	https://www.immowelt.de/expose/2cqfj5b	185	4	+++Exklusiv möbliertes Luxus-Penthouse mit Dachterrasse+++	14	40479	Prinz-Georg-Str. 35	\N	\N	1960
2cqwg5c	https://www.immowelt.de/expose/2cqwg5c	90	3	*****Traumhaft sanierte 3 Zimmer Wohnung mit Balkon und 240 qm großem Garten in ruhiger Lage!*****	96	40593	Arnold-Schönberg-Str. 5	\N	\N	\N
2cqy65c	https://www.immowelt.de/expose/2cqy65c	45	1	schöne 1-Zimmer-Wohnung in Düsseldorf-Lörick	41	40547	Niederkasseler Lohweg 20	\N	\N	\N
2cr6m57	https://www.immowelt.de/expose/2cr6m57	46	2	Helle 2 Zimmerwohnung im Süden Düsseldorfs | MIO Himmelsgeister Höfe	36	40225	\N	\N	\N	\N
2cr8559	https://www.immowelt.de/expose/2cr8559	79	3	3-Zimmer-Wohnung in Düsseldorf Hassels	98	40599	Fürstenberger Straße 41	\N	\N	\N
2crcw5b	https://www.immowelt.de/expose/2crcw5b	78	2	Großzügige helle 2 Zimmer mit Balkon	36	40225	\N	\N	\N	1978
2crg458	https://www.immowelt.de/expose/2crg458	130	2	* Komplett möbliert * Triple-Maisonette * 3 Ebenen Design & Kunst * zentral & ruhig *	14	40477	\N	\N	\N	1956
2cs3554	https://www.immowelt.de/expose/2cs3554	90	3	Viel Platz in ruhiger Lage!	82	40231	Torgauerstr. 19	\N	\N	\N
2csfl5b	https://www.immowelt.de/expose/2csfl5b	104	4	Gepflegte 4-Zimmer-Etagenwohnung mit EBK und SW-Terrasse in gefragterLage	44	40547	\N	\N	\N	\N
2csfn59	https://www.immowelt.de/expose/2csfn59	29	1	Renoviertes und sehr zentral gelegenes Apartment in Pempelfort. Nur telefonische Anfragen! Tel 01748854094	14	40477	\N	\N	\N	\N
2csft5a	https://www.immowelt.de/expose/2csft5a	60	2	Zentrale Lage zu Messe & Flughafen  2 Zimmer Balkon  ca. 60qm teilmöbiliert	51	40474	Freiligrathplatz	\N	\N	\N
2ct8y57	https://www.immowelt.de/expose/2ct8y57	64	2	Vollsanierte 2 Zi.-Wohnung auf der Straße der Kirchblüte!	16	40476	\N	\N	\N	\N
2ctf85c	https://www.immowelt.de/expose/2ctf85c	57	2	Schicke 2-Zi.-Gartenwohnung in D-Knittkuhl - genießen Sie ländliches Wohnen in Stadtnähe!	74	40629	\N	\N	\N	\N
2ctsf5a	https://www.immowelt.de/expose/2ctsf5a	65	2	[TAUSCHWOHNUNG] Kernsanierte Traumwohnung	36	40221	\N	\N	\N	\N
2ctsw56	https://www.immowelt.de/expose/2ctsw56	126	4	ATEMBERAUBENDES WOHNEN AM SCHLOSS BENRATH	95	40597	\N	\N	\N	\N
2cttb5b	https://www.immowelt.de/expose/2cttb5b	75	3	3-Zimmer-Wohnung in Düsseldorf Garath zum 01.12.23 wird renoviert	101	40595	Adam-Stegerwald-Straße 20	\N	\N	\N
2ctzd5b	https://www.immowelt.de/expose/2ctzd5b	100	3	Wunderschöne 3-Zimmer-Wohnung in Düsseldorf	73	40629	Am Wildpark 37	\N	\N	\N
2cucv59	https://www.immowelt.de/expose/2cucv59	67	2	[TAUSCHWOHNUNG] Suche eine 3 Zimmerwohnung	36	40225	\N	\N	\N	\N
2cul555	https://www.immowelt.de/expose/2cul555	75	3	3-Zimmer-EG-Wohnung mit EBK und Balkon - Einzug im November	37	40227	Solinger Str. 25	\N	\N	\N
2cuvw55	https://www.immowelt.de/expose/2cuvw55	42	1	möbliertes Appartement in der Nähe des Aquazoos, an eine Person, pauschal zu vermieten	51	40474	Amsterdamerstrasse 9	\N	\N	\N
2cv4m56	https://www.immowelt.de/expose/2cv4m56	49	2	Helle Zwei-Zimmer-Wohnung in Düsseldorf-Benrath	95	40597	\N	\N	\N	\N
2cvdt5a	https://www.immowelt.de/expose/2cvdt5a	78	3	3-Zimmer-Wohnung in Düsseldorf-Lörick auf der 12. Etage	41	40547	Niederkasseler Lohweg 20	\N	\N	\N
2cvh958	https://www.immowelt.de/expose/2cvh958	74	3	Was will man mehr? Großzügige 3-Zimmer-Wohnung mit tollem Balkon und neuem Bad	61	40472	Am Schorn 15	\N	\N	1983
2cwnf55	https://www.immowelt.de/expose/2cwnf55	83	4	4-Zimmer-Wohnung in Düsseldorf Hassels	98	40599	Altenbrückstraße 6	\N	\N	\N
2cwz457	https://www.immowelt.de/expose/2cwz457	95	3	Traum Altbau - Wunderbar grüne Lage - Aussergewöhnlich geschmackvolle Ausstattung	72	40235	Gutenbergstr.	\N	\N	\N
2cxge57	https://www.immowelt.de/expose/2cxge57	76	3	NUR MIT WBS: 3-Zimmer-Wohnung in Düsseldorf-Hassels zum selber renovieren	98	40599	Rathenower Str. 9	\N	\N	\N
2cxhp56	https://www.immowelt.de/expose/2cxhp56	97	3	Tolle Maisonette Wohnung Nähe der Nordstrasse 	14	40477	\N	\N	\N	\N
2cxll58	https://www.immowelt.de/expose/2cxll58	65	3	3-Zimmer-Wohnung mit Balkon- wird renoviert	101	40595	Wilhelm-Kreis-Straße 17	\N	\N	\N
2cxnf55	https://www.immowelt.de/expose/2cxnf55	79	3	3-Zimmer-Wohnung in Düsseldorf Hassels	98	40599	Fürstenberger Straße 41	\N	\N	\N
2cy5m57	https://www.immowelt.de/expose/2cy5m57	43	2	Helle 2 Zimmerwohnung im Süden Düsseldorfs | MIO Himmelsgeister Höfe	36	40225	\N	\N	\N	\N
2cy8358	https://www.immowelt.de/expose/2cy8358	83	2	2 Zimmer Erdgeschoss Wohnung mit Gartenzugang in D.-Heerdt / Concierge, Sauna, Fitness	42	40549	Heinrich Heine Gärten 5	\N	\N	\N
2cy9a5b	https://www.immowelt.de/expose/2cy9a5b	73	2	[TAUSCHWOHNUNG] 2,5-Zimmer Wohnung in Pempelfort	14	40477	\N	\N	\N	\N
2cyb55a	https://www.immowelt.de/expose/2cyb55a	123	4	[TAUSCHWOHNUNG] Mehr Platz gesucht, biete moderne,  barrierefreie Wohnung	14	40477	\N	\N	\N	\N
2cypx58	https://www.immowelt.de/expose/2cypx58	85	3	3,5 Zimmer Wohnung in Düsseldorf Holthausen	93	40589	Bonner Straße	\N	\N	\N
2cz3554	https://www.immowelt.de/expose/2cz3554	102	3	Achtung, 1 Monat Mietfrei! - 3-Zimmerwohnung sucht Mieter	14	40479	Duisburger Straße 133	\N	\N	1933
2czbq58	https://www.immowelt.de/expose/2czbq58	62	2	Einziehen und wohlfühlen. Gemütliche 2-Zimmer-Wohnung mit Balkon	15	40476	Essener Str. 27	\N	\N	\N
2czzp58	https://www.immowelt.de/expose/2czzp58	116	3	Frisch sanierter Bungalow - 3 Zimmer mit Innenhof direkt am Schlosspark in Düsseldorf-Benrath/Urdenbach	96	40593	Robert-Hansen-Straße 10	\N	\N	1977
2rdw54t	https://www.immowelt.de/expose/2rdw54t	205	4	*Grenze Kaiserswerth - ISR* 205 m² Luxus-Maisonette-Wohnung mit herrlichem Sonnendeck.	52	40474	\N	\N	\N	\N
30752723	https://www.wohnungsboerse.net/immodetail/30752723	340	6	Gelegenheit: Düsseldorf,  Cecilienallee,  Rhein-Panorama-Blick bis Altstadt, Parkähn. Gartenanlage!	16	40474	\N	51.2738	6.74219	1903
30952139	https://www.wohnungsboerse.net/immodetail/30952139	58.29	2	Belle Etage – Ruhig -Aufzug -Lörick am Seestern, Property Nr. 6753	43	40547	Büttgenweg	51.2477	6.72589	1969
31193233	https://www.wohnungsboerse.net/immodetail/31193233	274	6	Düsseldorf-Golzheim: TRAUMWOHNUNG MIT Rhein-BLICK ÜBER DEN RHEIN BIS HIN ZUR ALTSTADT.	16	40474	\N	51.2738	6.74219	2005
31210714	https://www.wohnungsboerse.net/immodetail/31210714	95.46	2	Charmante 2 Zimmerwohnung mit großer Terrasse zum Andreas Garten	11	40213	Am	51.2285	6.77429	2017
31394882	https://www.wohnungsboerse.net/immodetail/31394882	132	4	Außergewöhnliche 4-Zimmer-Wohnung in einer denkmalgeschützten Hofanlage vor den Toren Düsseldorfs	74	40629	Ratinger	51.2711	6.92354	1887
31549941	https://www.wohnungsboerse.net/immodetail/31549941	136	3	Vollständig renovierte 3-Zi.-Wohnung mit Vollbad,Gäste-WC,Kamin,EBK,Terrasse uvm.in begehrter Lage!	72	40629	Neuburgstraße	51.2367	6.83651	1997
31571982	https://www.wohnungsboerse.net/immodetail/31571982	36	1	AvidonApartments luxury serviced Double Deluxe Apartment	62	40468	Unterrather	51.2753	6.78637	\N
31595587	https://www.wohnungsboerse.net/immodetail/31595587	108	3	Düsseldorf-Flingern-Nord! Balkonwohnung! Frisch renoviert! Für das Leben zu zweit! Gro	22	40233	\N	51.2198	6.8119	1956
31604820	https://www.wohnungsboerse.net/immodetail/31604820	59	2	Im Herzen von Pempelforts, möblierte 2-Zimmer-Wohnung mit Balkon	14	40479	\N	51.2333	6.78371	1954
31641965	https://www.wohnungsboerse.net/immodetail/31641965	72.77	3	WIN WIN - 3 Zimmer Wohnung im 15.OG mit Blick über den Dächern Düsseldorfs	33	40221	Speditionstraße	51.215	6.74939	\N
31675590	https://www.wohnungsboerse.net/immodetail/31675590	94	3	Moderne kernsanierte Hochparterre-Wohnung	73	40629	Poßbergweg	51.2575	6.87005	1970
31737888	https://www.wohnungsboerse.net/immodetail/31737888	51	2	ERSTBEZUG IN D - OBERKASSEL - Top Lage mit Blick ins Grüne	41	40547	Wettinerstraße	51.2347	6.74919	1963
31766932	https://www.wohnungsboerse.net/immodetail/31766932	70	2	Wunderschöne helle 2 Zi. Wohnung im Zentrum Düsseldorfs	12	40213	\N	51.2221	6.77271	1955
31786791	https://www.wohnungsboerse.net/immodetail/31786791	80	2	Zentrale Komfortwohnung mit Terrasse	32	40217	\N	51.2127	6.7754	\N
31818244	https://www.wohnungsboerse.net/immodetail/31818244	65.66	2	Hellerhof: Schicke 2 Zimmer-Wohnung mit großer Terrasse (WBS erforderlich)	102	40595	Dresdener	51.1343	6.91019	1997
31823448	https://www.wohnungsboerse.net/immodetail/31823448	81.95	3	3 Zimmer Neubauwohnung mit Balkon in Rheinnähe von Düsseldorf-Flehe	38	40223	\N	51.1998	6.77225	2023
31827401	https://www.wohnungsboerse.net/immodetail/31827401	205	5	DACHTERRASSE - OFFENE EINBAUKÜCHE - MODERN ; HELL ; RUHIG	53	40489	\N	51.3305	6.76259	\N
31835169	https://www.wohnungsboerse.net/immodetail/31835169	117.39	4	Wohn(t)raum auf 2 Ebenen! Sanierte 4-Zi-Maisonetten-Whg in D-Flingern	22	40235	Junkersstr.	51.2275	6.82513	\N
31983080	https://www.wohnungsboerse.net/immodetail/31983080	35.81	1	1 Monat mietfrei ! Klein aber fein, und erschwinglich	73	40629	Ludenberger	51.24	6.83495	\N
32018207	https://www.wohnungsboerse.net/immodetail/32018207	34	1	Lorettostraße: Möbliertes Apartment im Trendviertel Unterbilk	32	40219	Lorettostr.	51.2126	6.76442	1975
32039889	https://www.wohnungsboerse.net/immodetail/32039889	149.75	5	Großzügige und sanierte 5-Zimmerwohnung mit Blick ins Grüne, Einbauküche und Balkon	52	40474	\N	51.2738	6.74219	\N
32080605	https://www.wohnungsboerse.net/immodetail/32080605	78	3	Neue TEILMÖBELIERTE 3 Zimmer  Whg. mit Terrasse	84	40627	Vennstr.	51.2052	6.88449	1959
32111553	https://www.wohnungsboerse.net/immodetail/32111553	30	1	Alles-inkl.: möblierte Wohnung für 1 Person. Pauschalmiete, inkl. alle Kosten.	91	40591	Kölner	51.1914	6.81525	1991
32135427	https://www.wohnungsboerse.net/immodetail/32135427	57	2	2-Zimmer-Wohnung in Düsseldorf - Erstbezug nach Sanierung!	21	40233	Behrenstr.	51.2255	6.80814	1958
32188005	https://www.wohnungsboerse.net/immodetail/32188005	197	4	Dachg. - Maisonette: 4 Z., 2 Bäder, 3 Balkone, Küche, Kamin, Klima, Fußbodenhzg., Parkpl.	73	40629	Ludenberger	51.2395	6.83761	1993
32189849	https://www.wohnungsboerse.net/immodetail/32189849	29.3	1	Möbliertes Apartment in Düsseldorf- Rath!	63	40472	Kanzlerstr.	51.2624	6.82259	1992
32233451	https://www.wohnungsboerse.net/immodetail/32233451	125	3	Charmante Altbauwohnung mit großer Terrasse - direkt vom Eigentümer	13	40210	Bismarckstraße	51.2226	6.7853	\N
32235383	https://www.wohnungsboerse.net/immodetail/32235383	26.4	1	Möbliertes Apartment mit Balkon in Düsseldorf- Rath!	63	40472	Kanzlerstr.	51.2624	6.82259	1992
32375748	https://www.wohnungsboerse.net/immodetail/32375748	94	3.5	Top-Wohnung mit 3 Zimmern, offener Galerie, Kamin und großem Balkon in Kaiserswerth!	53	40489	\N	51.3305	6.76259	1967
32392554	https://www.wohnungsboerse.net/immodetail/32392554	120	3	Wunderschönes Loft mit 120m² in traumhafter Jugendstilvilla!	16	40476	Rolandstraße	51.2438	6.77272	\N
32442188	https://www.wohnungsboerse.net/immodetail/32442188	44	2	Dachgeschoss-Seniorenwohnung Ü55 mit Balkon und Aufzug!	93	40589	Bergiusstraße	51.1759	6.82163	1998
32489228	https://www.wohnungsboerse.net/immodetail/32489228	150	4	Hochwertig sanierte 4 Zimmer mit 2 Terassen und Boffi Küche	72	40235	Graf-Recke-Straße	51.2456	6.82362	\N
32498958	https://www.wohnungsboerse.net/immodetail/32498958	117	2	Alles nah - alles da!\nGepflegte Stadtwohnung in strategisch guter Lage	16	40474	\N	51.2738	6.74219	1970
32542458	https://www.wohnungsboerse.net/immodetail/32542458	42.11	2	Singles aufgepasst! Renovierte 2-Zi-Whg in der Düsseldorfer Altstadt	11	40213	Ratinger	51.2296	6.77507	\N
32555875	https://www.wohnungsboerse.net/immodetail/32555875	115	2	DG Wohnung mit riesigen Balkon und wunderschöner Aussicht!	37	40227	Sonnenstraße	51.2125	6.79293	\N
32572858	https://www.wohnungsboerse.net/immodetail/32572858	81	3	Frisch renovierte 3-Zimmer Wohnung in zentraler Lage von Düsseldorf-Eller	82	40229	\N	51.1968	6.84602	1900
32579742	https://www.wohnungsboerse.net/immodetail/32579742	43	1	Kö-Bogen-Wohnen, exklusive möblierte 1-Zimmer-Wohnung in Düsseldorf	14	40479	Kaiserstraße	51.2313	6.78077	1969
32589487	https://www.wohnungsboerse.net/immodetail/32589487	90	3	Viel Platz in ruhiger Lage!	82	40231	Torgauerstr.	51.2094	6.83636	\N
32630083	https://www.wohnungsboerse.net/immodetail/32630083	52	1.5	Frisch sanierte 1,5-Zimmerwohnung in Flingern mit großer Dachterrasse	21	40233	Ruhrtalstr.	51.2214	6.81119	\N
32642458	https://www.wohnungsboerse.net/immodetail/32642458	69	2	#behomie: Möbliertes Wohnen im Medienhafen	33	40219	Hammerstraße	51.2138	6.7527	2020
32642467	https://www.wohnungsboerse.net/immodetail/32642467	35	1	#behomie: Möbliertes Wohnen im Medienhafen mit All Inclusive Miete	33	40219	Hammerstraße	51.2138	6.7527	2020
32683285	https://www.wohnungsboerse.net/immodetail/32683285	66.5	2	Erstbezug nach Sanierung! Helle 2-Zimmerwohnung mit Balkon im Grünen!	93	40589	Bahlenstr.	51.1785	6.82576	\N
32697715	https://www.wohnungsboerse.net/immodetail/32697715	72.03	3	WIN WIN -  3-Zimmer Wohnung im 15.OG mit Ausblick auf den Rhein	33	40221	Speditionstraße	51.215	6.74939	\N
32705183	https://www.wohnungsboerse.net/immodetail/32705183	70	3	Erstbezug nach Sanierung: attraktive neu Möbilierte 3-Zimmer-Wohnung in Düsseldorf	62	40468	Kalkumer	51.2697	6.77378	1946
32706775	https://www.wohnungsboerse.net/immodetail/32706775	50	2	Exklusives Wohnen im Andreas Quartier	11	40213	Mühlenstraße	51.2281	6.77415	2017
32728990	https://www.wohnungsboerse.net/immodetail/32728990	98	3	Luxuriöser Neubau mit allen wünschenswerten Ausstattungsmerkmalen-Seniorengerecht in Toplage	55	40489	Angermunder	51.3249	6.77454	2023
32728991	https://www.wohnungsboerse.net/immodetail/32728991	106	3	Luxuriöser Neubau mit allen wünschenswerten Ausstattungsmerkmalen-Seniorengerecht-Toplage-Angermund	55	40489	Angermunder	51.3249	6.77474	2023
32728992	https://www.wohnungsboerse.net/immodetail/32728992	108	3	Angermund:Luxuriöser Neubau mit allen wünschenswerten Ausstattungsmerkmalen-Seniorengerecht-Toplage	55	40489	Angermunder	51.3249	6.77474	2023
32729901	https://www.wohnungsboerse.net/immodetail/32729901	37	1	Voll Möblierte Wohnung 37m² mit Balkon	56	42113	Aprather	51.2709	7.10633	1970
32739183	https://www.wohnungsboerse.net/immodetail/32739183	190	3	Exklusive Maisonettewohnung mit Wellnessbad in Oberkassel	41	40545	Barmer	51.2296	6.74675	\N
32747252	https://www.wohnungsboerse.net/immodetail/32747252	274	6	Cecilienallee, Düsseldorf-Golzheim: TRAUMWOHNUNG MIT BLICK ÜBER DEN RHEIN BIS HIN ZUR ALTSTADT!	16	40474	\N	51.2738	6.74219	2005
32761322	https://www.wohnungsboerse.net/immodetail/32761322	37	1	Möbliertes Apartment in zentraler Lage von Golzheim	16	40474	\N	51.2738	6.74219	1972
32765946	https://www.wohnungsboerse.net/immodetail/32765946	91.6	3	Sanierte 3- Raum Altbauwohnung mit Einbauküche, Balkon und Gäste-WC!	14	40479	Pfalzstraße	51.2409	6.78067	\N
32772403	https://www.wohnungsboerse.net/immodetail/32772403	98	3	helle 3-Zimmer--Wohnung mit Balkon + extra. Terrasse + Gäste-WC in guter Lage im Grünen	63	40472	Eitelstraße	51.2704	6.82834	1972
32791864	https://www.wohnungsboerse.net/immodetail/32791864	47.68	1	Gemütliche Dachgeschosswohnung mit Balkon direkt Hauptbahnhof	13	40213	Kölner	51.2234	6.7963	1947
32803920	https://www.wohnungsboerse.net/immodetail/32803920	88	2	Geräumige 2-Zimmer-Wohnung mit Balkon in Rheinnähe	35	40221	Viehfahrtsweg	51.1852	6.75838	2023
32804194	https://www.wohnungsboerse.net/immodetail/32804194	69	2	#behomie: Möbliertes Wohnen im Medienhafen	33	40219	Hammerstraße	51.2138	6.7527	2020
32816215	https://www.wohnungsboerse.net/immodetail/32816215	45.7	1.5	71 Erstbezug mit EBK und Balkon: exklusive 1,5-Zimmer-Wohnung in Düsseldorf	42	40549	Romy-Schneider-Straße	51.2414	6.7139	2023
32817541	https://www.wohnungsboerse.net/immodetail/32817541	90	2	Voll möbliert wohnen	11	40213	\N	51.2221	6.77271	1937
32817705	https://www.wohnungsboerse.net/immodetail/32817705	142	4	Erstbezug nach Sanierung!	83	40627	Vennhauser	51.2067	6.85712	1964
32820355	https://www.wohnungsboerse.net/immodetail/32820355	76	2	Schöne 2 Zimmer Wohnung mit Pool, Sauna & Fitness in Düsseldorf, Ludenberg direkt am Wald	73	40629	Bismarckweg	51.2414	6.83316	1985
32824284	https://www.wohnungsboerse.net/immodetail/32824284	56.54	2	2-Zimmer-DG-Wohnung mit modernem Tageslichtbad	63	40472	Bochumer	51.2627	6.81033	1928
32831795	https://www.wohnungsboerse.net/immodetail/32831795	69	2	Erstbezug nach Sanierung: 2-Zimmer-Wohnung mit Balkon	13	40210	Bismarckstraße	51.2219	6.78625	1958
32846582	https://www.wohnungsboerse.net/immodetail/32846582	81	3	Freundliche 3-Zimmer-Wohnung in Essen	92	45138	Kurfürstenstraße	51.451	7.02896	1961
32848279	https://www.wohnungsboerse.net/immodetail/32848279	112	3	DÜ-Grafenberg, möblierte luxus 3-Zi Wohn., 112qm, Balk.	72	40235	Burgmüllerstr.	51.2458	6.82453	2001
32853310	https://www.wohnungsboerse.net/immodetail/32853310	160	5	DIREKTE RHEINLAGE! Traumhafte 5 Zimmer Wohnung auf der exklusiven Cecilienallee in Düsseldorf!!!	16	40474	Cecilienalle	51.2485	6.7628	\N
32853522	https://www.wohnungsboerse.net/immodetail/32853522	94	2	Düsseldorf-Angermund-2 Zimmer mit Terrasse und Garten in sehr guter Lage mit Top Ausstattung	55	40489	Koppelskamp	51.3332	6.78746	2019
32856293	https://www.wohnungsboerse.net/immodetail/32856293	99	4	NEUBAU 4-Zimmer-Wohnung mit 2 Balkonen, Erstbezug, Mietpreisgedämpft	63	40472	Westfalenstraße	51.2631	6.81503	2023
32859694	https://www.wohnungsboerse.net/immodetail/32859694	19.76	1	"The Basic One" | Kompakte Studio-Wohnung mit Vollausstattung	37	40227	Mindener	51.2119	6.81201	2023
32875836	https://www.wohnungsboerse.net/immodetail/32875836	67.45	2	Möblierte Erdgeschosswohnung in der Düsseldorfer Carlstadt zu vermieten	12	40213	Südstraße	51.2202	6.77167	\N
32876901	https://www.wohnungsboerse.net/immodetail/32876901	82	2	Aufwendig sanierte 2-Zimmer Wohnung in Niederkassel	44	40547	Alt	51.2419	6.75154	\N
32877330	https://www.wohnungsboerse.net/immodetail/32877330	103.17	4	Carlstadt; 4 Zimmer vollmöbliert zu vermieten	12	40213	Südstraße	51.2202	6.77167	\N
32877350	https://www.wohnungsboerse.net/immodetail/32877350	90.7	3	Top möblierte und sanierte Dreizimmerwohnung in der Düsseldorfer Carlstadt	12	40213	Südstraße	51.2202	6.77167	1935
32885147	https://www.wohnungsboerse.net/immodetail/32885147	96	3	Luxuriös ausgestattete 3-Zimmer-Wohnung mit traumhaftem Blick	62	40468	Im	51.2759	6.78446	1963
32896331	https://www.wohnungsboerse.net/immodetail/32896331	46	1	Pempelfort, 1 Zimmer, Küche/Diele/ Bad	14	40211	Düsselthaler	51.2329	6.79066	1957
32904875	https://www.wohnungsboerse.net/immodetail/32904875	24.79	1	Nur noch wenige Apartments verfügbar!\nModerne, möblierte Mikroapartments!	63	40472	\N	51.2685	6.83379	2020
32904956	https://www.wohnungsboerse.net/immodetail/32904956	98	3	Schöne und helle Wohnung in zentraler Lage und Rheinnähe	42	40549	Hymgasse	51.2317	6.72238	1970
32908705	https://www.wohnungsboerse.net/immodetail/32908705	30	1.5	Chices vollmöbliertes Single-Apartment - Top Renoviert Düsseldorfer Süden - Pauschalmiete	37	40227	Mindener	51.2149	6.80705	1975
32912196	https://www.wohnungsboerse.net/immodetail/32912196	45.08	1	RENOVIERT! Apartment mit Balkon & Wintergarten zu vermieten	22	40233	\N	51.2198	6.8119	\N
32917983	https://www.wohnungsboerse.net/immodetail/32917983	150	3	Neu gestaltete, sehr schöne 3-Zimmer-Maisonette-Wohnung mit Blick ins weite Grüne	53	40489	\N	51.3305	6.76259	1999
32918930	https://www.wohnungsboerse.net/immodetail/32918930	49.58	1	Frisch saniertes 1-Zimmer Apartment- Düsseldorf	93	40589	Bahlenstraße	51.176	6.83168	2023
32937445	https://www.wohnungsboerse.net/immodetail/32937445	94	3	3 Zimmer Wohnung Unterbach (Großer Balkon, Wannenbad, Parkettboden im Wohnbereich)	84	40627	Rathelbeckstr.	51.2097	6.88041	1961
32941762	https://www.wohnungsboerse.net/immodetail/32941762	120	3	Moderne 3-Zimmer-Wohnung mit Balkon im Medienhafen	32	40219	Moselstraße	51.2172	6.76433	2016
32946100	https://www.wohnungsboerse.net/immodetail/32946100	30	1	ALL INKLUSIV: Kernsanierte & möblierte Wohnung im Zentrum	31	40215	\N	51.2149	6.78256	1972
32946163	https://www.wohnungsboerse.net/immodetail/32946163	65	3	3-Zimmer, Balkon, zentral, hell + ruhig, Erstbezug nach Sanierung	71	40625	Märkische	51.2327	6.85828	\N
32948163	https://www.wohnungsboerse.net/immodetail/32948163	71.33	2	Schicke 2-Zimmer-Wohnung über den Dächern von Düsseldorf	13	40210	Immermannstr.	51.2228	6.79052	1960
32952241	https://www.wohnungsboerse.net/immodetail/32952241	96	3	Kaiserswerther Markt, 3 Zimmer mit 30 qm Terrasse	53	40489	Kaiserswerther	51.3013	6.73637	\N
32966061	https://www.wohnungsboerse.net/immodetail/32966061	71.76	3	WIN WIN - 3-Zimmer Wohnung im 17.OG mit Blick auf Düsseldorf	33	40221	Speditionstraße	51.215	6.74939	\N
32976977	https://www.wohnungsboerse.net/immodetail/32976977	125	3	Modernisierte 3-Zimmer Wohnung in Düsseldorf-Mörsenbroich	64	40470	\N	51.2569	6.80771	1986
32976985	https://www.wohnungsboerse.net/immodetail/32976985	83	3	Gepflegte Wohnung mit drei Zimmern und EBK in Düsseldorf	101	40595	Rostocker	51.1508	6.89603	1967
32977500	https://www.wohnungsboerse.net/immodetail/32977500	115.03	4	4-Zimmer-2.OG-Wohnung - hochwertige Einbauküche - Balkon - Tiefgaragenstellplatz	84	40627	\N	51.2024	6.88388	\N
32977503	https://www.wohnungsboerse.net/immodetail/32977503	115.21	4	4-Zimmer-1.OG-Wohnung - hochwertige Einbauküche - Balkon - Tiefgaragenstellplatz	84	40627	\N	51.2024	6.88388	\N
32977516	https://www.wohnungsboerse.net/immodetail/32977516	115.45	4	4-Zimmer-2.OG-Wohnung - hochwertige Einbauküche - Balkon - Tiefgaragenstellplatz	84	40627	\N	51.2024	6.88388	\N
32977517	https://www.wohnungsboerse.net/immodetail/32977517	60.02	2	2-Zimmer-2.OG-Wohnung - hochwertige Einbauküche - Balkon - Tiefgaragenstellplatz	84	40627	\N	51.2024	6.88388	\N
32995444	https://www.wohnungsboerse.net/immodetail/32995444	30	1	**FURNISHED** Schick möbliertes Apartment in Flingern	21	40233	Ruhrtalstr.	51.2214	6.81119	\N
33002011	https://www.wohnungsboerse.net/immodetail/33002011	19.6	1	Neubau-Erstbezug: Vollausgestattete 1-Zimmer-Wohnung (ideal für Studierende)	37	40227	Mindener	51.2119	6.81201	2023
33002502	https://www.wohnungsboerse.net/immodetail/33002502	68.53	2	Schöne Neubauwohnung in Gerresheim!	71	40625	Zittauer	51.2267	6.85466	2019
33002621	https://www.wohnungsboerse.net/immodetail/33002621	61.96	2	Moderne 2-Zimmerwohnung in Düsseldorf Stockum	51	40474	Erich-Klausener-Str.	51.2569	6.75875	1952
33008456	https://www.wohnungsboerse.net/immodetail/33008456	84	3	3 Zi. / 84m² mit Blick auf den Schwanenspiegel Ecke Schwanenmarkt-Park	12	40213	Haroldstraße	51.2192	6.77411	1960
33021045	https://www.wohnungsboerse.net/immodetail/33021045	52	2	Ruhig gelegene 2-Zimmerwohnung in Rheinnähe	35	40221	Aderräuscher	51.1907	6.76493	\N
33022819	https://www.wohnungsboerse.net/immodetail/33022819	136	3	Penthousewohnung in der Altstadt mit Carport	11	40213	Lambertusstr.	51.2279	6.77264	1844
33027861	https://www.wohnungsboerse.net/immodetail/33027861	105	4	Traumhafte Maisonettewohnung in Düsseldorf Angermund	55	40489	\N	51.3305	6.76259	\N
33050471	https://www.wohnungsboerse.net/immodetail/33050471	47	1	Pempelfort/Derendorf bezahlbar	14	40477	Moltkestr.	51.2405	6.78584	1971
33050991	https://www.wohnungsboerse.net/immodetail/33050991	71.76	3	WIN WIN - 3 Zimmer Wohnung mit Rheinblick	33	40221	Speditionstraße	51.215	6.74985	\N
33051217	https://www.wohnungsboerse.net/immodetail/33051217	66	2	gepflegte  2- Zimmer- Wohnung im Erdgeschoss	94	40599	Henkelstraße	51.1791	6.86025	1966
33059425	https://www.wohnungsboerse.net/immodetail/33059425	77.96	3	TYP - nur mit WBS A -Wohnung ( 80 qm / 3 Pers.  ) mit Terrasse	22	40235	\N	51.2294	6.82752	1996
33059673	https://www.wohnungsboerse.net/immodetail/33059673	66.56	2	Preisgedämpfte 2-Zimmer-Neubauwohnung mit schöner Terrasse	71	40625	Pirnaer	51.2284	6.85351	\N
33063518	https://www.wohnungsboerse.net/immodetail/33063518	70.12	2	Neues Jahr, neues Glück, neue Wohnung? Ziehe zum Jahreswechsel in diese 2-Zimmerwohnung!	21	40233	Werdener	51.2207	6.80828	\N
33067537	https://www.wohnungsboerse.net/immodetail/33067537	63	2	Renoviert! Ideal geschnittene 2-Zimmer-Wohnung mit 2 Balkonen	101	40595	Paul-Bonatz-Str.	51.1455	6.89387	\N
33069759	https://www.wohnungsboerse.net/immodetail/33069759	67	2	helle 3-Raum-Wohnung mit grossem Wohnzimmer	91	40589	Kölner	51.1829	6.82243	\N
33069942	https://www.wohnungsboerse.net/immodetail/33069942	119.16	4	Helle 4-Zimmer-Wohnung mit Balkon im Süden Düsseldorfs |  MIO Himmelsgeister Höfe	36	40225	Himmelgeister	51.2008	6.78274	2023
33070027	https://www.wohnungsboerse.net/immodetail/33070027	49.4	2	Zentral gelegene großzügige 1-Zimmer-DG Wohnung am Hauptbahnhof  mit Balkon	13	40210	Worringer	51.2242	6.7954	1946
33072500	https://www.wohnungsboerse.net/immodetail/33072500	62	2	Zentral gelegene 2-Zimmer-Wohnung am Hauptbahnhof	13	40210	Worringer	51.2242	6.7954	1946
33075428	https://www.wohnungsboerse.net/immodetail/33075428	65	2	MIT 360 GRAD RUNDGANG - 2 ZIMMER WOHNUNG MIT ARBEITSBEREICH IM DACHGESCHOSS	82	40229	Am	51.201	6.82504	1972
33077145	https://www.wohnungsboerse.net/immodetail/33077145	146	3	Tolle Wohnung im Düsseltal, frei ab sofort	23	40237	\N	51.2357	6.80917	\N
33080272	https://www.wohnungsboerse.net/immodetail/33080272	109.96	2	Schöne EG Wohnung  mit Terrasse und Garten in Düsseldorf-Heerdt, nähe Rheinallee	42	40549	\N	51.2331	6.71909	\N
33081249	https://www.wohnungsboerse.net/immodetail/33081249	25	1	Ansprechende 1-Zimmer-Wohnung in Düsseldorf-Rather Kreuzweg	63	40472	Rather	51.2639	6.80496	1954
33086103	https://www.wohnungsboerse.net/immodetail/33086103	80	3	Düsseldorf-Benrath Vermietung direkt vom Eigentümer	95	40597	Kleinstr.	51.1701	6.87929	1960
33087408	https://www.wohnungsboerse.net/immodetail/33087408	94	2.5	2,5 Zimmer mit Fernblick,  Solarstrom, neues Bad, 2 Balkone , Einbauküche, Klima,ca. 20m2Nutzfläche!	56	42579	\N	51.3273	6.9656	1980
33087472	https://www.wohnungsboerse.net/immodetail/33087472	98.55	2	2-Zimmer-EG-Wohnung - hochwertige Einbauküche - Balkon - Tiefgaragenstellplatz	35	40221	\N	51.1997	6.75072	\N
33089879	https://www.wohnungsboerse.net/immodetail/33089879	78	2	Schöne 2 Zimmer Wohnung	84	40627	Gerresheimer	51.2027	6.90113	1972
33093225	https://www.wohnungsboerse.net/immodetail/33093225	60	2.5	Erstbezug nach Sanierung. Attraktive Wohnung in Urdenbach sucht Mieter.	96	40593	Urdenbacher	51.1481	6.86687	\N
33095129	https://www.wohnungsboerse.net/immodetail/33095129	60.79	2	2-Zimmer-Wohnung in Düsseldorf Rath	63	40472	Helmutstraße	51.262	6.81911	1890
33097028	https://www.wohnungsboerse.net/immodetail/33097028	46	2	Schöne, gut gelegene Wohung (nah am WOCHENMARKT ELLER)	82	40229	Konradstraße	51.1999	6.83871	1949
33098440	https://www.wohnungsboerse.net/immodetail/33098440	73	3	GUT GESCHNITTENE DREIZIMMERWOHNUNG IN DÜSSELDORF GERRESHEIM	71	40625	Schönaustraße	51.2348	6.8583	\N
33103115	https://www.wohnungsboerse.net/immodetail/33103115	60.48	2	zentrale 2-Raum-Wohnung in Düsseldorf-Pempelforth	14	40479	Sternstraße	51.2335	6.78037	1952
33103145	https://www.wohnungsboerse.net/immodetail/33103145	62.13	2	Erstbezug! Sanierte 2-Zi-Whg mit Balkon in ruhiger Lage	83	40627	Erlenkamp	51.2101	6.85867	\N
33114294	https://www.wohnungsboerse.net/immodetail/33114294	190	5.5	MANNESMANNUFER - ERSTKLASSIGE STADTWOHNUNG MIT BALKON ZUR GARTENSEITE IN BESTER LAGE	12	40213	\N	51.2221	6.77271	1902
33121759	https://www.wohnungsboerse.net/immodetail/33121759	39	2	Möbliertes helles  App ,Düsseldorf-Zooviertel	23	40237	\N	51.2357	6.80917	\N
33126147	https://www.wohnungsboerse.net/immodetail/33126147	70	2.5	Kürzlich renovierte Wohnung in ruhiger, zentraler Lage in D-Unterrath	62	40468	\N	51.2612	6.7789	\N
33129082	https://www.wohnungsboerse.net/immodetail/33129082	53	2	Komfortables Gartenappartement SUSSEX	53	40489	Arnheimer	51.3039	6.74085	2021
33138761	https://www.wohnungsboerse.net/immodetail/33138761	54	2	Helle und frisch renovierte 2-Zimmerwohnung in Bestlage von Flingern-Nord	22	40233	\N	51.2198	6.8119	1913
33138839	https://www.wohnungsboerse.net/immodetail/33138839	45	2	*FURNISHED* Exklusives, möbliertes Apartment in Oberkassel – sofort verfügbar	41	40549	\N	51.2331	6.71909	\N
33139206	https://www.wohnungsboerse.net/immodetail/33139206	70	3	Renovierte und helle 3-Zimmer-Wohnung in Herne mit schöner Einbauküche	97	44623	Am	51.5413	7.23719	\N
33145677	https://www.wohnungsboerse.net/immodetail/33145677	95	4	Chicke 4-Zi-Komfort-Neubau-Whg. mit Balkon	13	40211	Klosterstraße	51.2239	6.79414	\N
33147363	https://www.wohnungsboerse.net/immodetail/33147363	95	3	Für Paare oder die kleine Familie	55	40489	Sengelsweg	51.3261	6.78017	1979
33149772	https://www.wohnungsboerse.net/immodetail/33149772	102	2	Außergewöhnlich & einzigartig. Dachgeschosswohnung mit großer Dachterrasse	37	40227	\N	51.2154	6.79757	1893
33151939	https://www.wohnungsboerse.net/immodetail/33151939	85	3	Erstbezug nach Komplettsanierung, 3-Zimmer Wohnung mit Balkon	91	40589	Bahlenstraße	51.1822	6.8221	\N
33154723	https://www.wohnungsboerse.net/immodetail/33154723	39	1	Vollmöbliertes 1-Zimmer-Appartement mit eigenem WLAN und TV in Top-Lage	36	40225	Himmelgeister	51.2008	6.78274	2023
33163093	https://www.wohnungsboerse.net/immodetail/33163093	71.8	3	WIN WIN - 3-Zimmerwohnung im 13. OG	33	40221	\N	51.1997	6.75072	\N
33178259	https://www.wohnungsboerse.net/immodetail/33178259	106	3	Moderne 3 Zimmer Wohnung	14	40477	Marschallstraße	51.2372	6.78125	1955
33181168	https://www.wohnungsboerse.net/immodetail/33181168	104.13	4	4-Zi.-Wohnung in D-Hassels	98	40599	Oranienburger	51.1871	6.86384	\N
33186331	https://www.wohnungsboerse.net/immodetail/33186331	90	2	Sehr schöne 2 Zimmer Wohnung	16	40474	Füllenbachstraße	51.2547	6.76374	1966
33186332	https://www.wohnungsboerse.net/immodetail/33186332	120	3	Achtung, 1 Monat Mietfrei! - Schickes Penthouse mit umlaufender Terrasse	16	40474	Füllenbachstraße	51.2547	6.76374	1966
33188188	https://www.wohnungsboerse.net/immodetail/33188188	90	4	D- Flingern / Sonnige 4-Zi- Komfort-Wohnung m. 2 Balkone	21	40233	Langerstraße	51.2242	6.8051	\N
33192578	https://www.wohnungsboerse.net/immodetail/33192578	85	3	Schöne, sonnige 3-Zimmerwohnung in Düsseldorf-Gerresheim	71	40625	\N	51.2358	6.85232	\N
33196281	https://www.wohnungsboerse.net/immodetail/33196281	252	4	Sie sehen aber schön raus! Penthouse der Superlative!	11	40213	\N	51.2221	6.77271	1908
33196294	https://www.wohnungsboerse.net/immodetail/33196294	64	2	Gemütliche 2 Zimmerwohnung in zentraler Lage	42	40549	Heerdter	51.2319	6.71659	\N
33196527	https://www.wohnungsboerse.net/immodetail/33196527	44	1	KAMEHA Residence Düsseldorf! Möbliertes Design-Apartment!	11	40213	\N	51.2221	6.77271	\N
33196576	https://www.wohnungsboerse.net/immodetail/33196576	83.79	2	***Wunderschöne 2-Zimmer-Wohnung mit Terrasse und offenem Küchenbereich in Düsseldorf***	73	40629	Am	51.2455	6.84978	2009
33197979	https://www.wohnungsboerse.net/immodetail/33197979	67	2	Oberkassel: Wunderbare, sanierte 2-Zimmer Wohnung	41	40545	Schorlemerstr.	51.2316	6.75273	1937
33198024	https://www.wohnungsboerse.net/immodetail/33198024	65	2	FRISCH SANIERTE 2 ZIMMER ERDGESCHOSSWOHNUNG IN RUHIGER LAGE MIT TERRASSE	83	40627	Vennhauser	51.208	6.85791	1974
33200036	https://www.wohnungsboerse.net/immodetail/33200036	77	3	D-Lörick | Lichtdurchflutete 3 Zi.- Dachgeschosswohnung mit Dachterrasse im kernsanierten Altbau!	43	40547	Amboßstraße	51.2394	6.73309	\N
33201711	https://www.wohnungsboerse.net/immodetail/33201711	101	4	Kernsanierte 4 Zimmer-Etagenwohnung mit großem Sonnenbalkon und PKW-Stellplatz	83	40627	Chemnitzer	51.2062	6.8547	\N
33203372	https://www.wohnungsboerse.net/immodetail/33203372	210	3	Erstbezug nach Sanierung mit Einbauküche stilvolle 3-Zimmer Wohnung in Düsseldorf	83	40627	Kamper	51.2077	6.85326	\N
33203387	https://www.wohnungsboerse.net/immodetail/33203387	54	2	Topsanierte stilvolle 2-Zimmerwohnung in Toplage Düsseldorf-Vennhausen	83	40627	Kamper	51.2077	6.85326	\N
33203773	https://www.wohnungsboerse.net/immodetail/33203773	95	4	gepflegte  4- Zimmer- Wohnung zu vermieten	94	40599	Henkelstraße	51.1792	6.85982	1966
33213161	https://www.wohnungsboerse.net/immodetail/33213161	78	3	Attraktive 2.OG-Terrassenwohnung  in Düsseldorf-Vennhausen provisionsfrei	83	40627	Zwickauer	51.2079	6.85584	1979
33213168	https://www.wohnungsboerse.net/immodetail/33213168	82	2	Vollmöblierte, moderne 2-Zimmer Wohnung in Oberkassel am Rheinufer	41	40545	Rheinallee	51.2271	6.75138	1973
33217523	https://www.wohnungsboerse.net/immodetail/33217523	65	2	2 Zimmer Maisonette Wohnung mit Balkon in Düsseldorf Hellerhof	102	40595	\N	51.1408	6.90507	\N
33223097	https://www.wohnungsboerse.net/immodetail/33223097	85.21	3	Schöne 3-Zimmer Neubauwohnung am Grafenberger Wald! Erstbezug.	72	40629	\N	51.255	6.88361	\N
33223803	https://www.wohnungsboerse.net/immodetail/33223803	91.73	3	Freundliche 3-Zimmer-Wohnung in DÜSSELDORF Gerresheim Heyestraße	71	40625	Heyestr	51.2254	6.86262	1984
33225904	https://www.wohnungsboerse.net/immodetail/33225904	71.62	3	Der Rhein um die Hausecke + schöner Schnitt + EBK + beste Lage und Anbindung	95	40597	Benrather	51.1627	6.85578	1995
33227248	https://www.wohnungsboerse.net/immodetail/33227248	70	3	3 Zimmer KDB mit Garage und Wintergarten in ruhiger Lage mit sehr guter Ausstattung	71	40627	\N	51.2024	6.88388	\N
33227368	https://www.wohnungsboerse.net/immodetail/33227368	95	2.5	D-Lörick|Rarität - kernsanierte 3-Zimmer-Erdgeschosswohnung mit eigenem Garten in ruhiger Wohnlage	43	40547	Amboßstraße	51.2394	6.73309	\N
33229616	https://www.wohnungsboerse.net/immodetail/33229616	84.45	2	Penthouse-Wohnung über den Dächern von Düsseldorf - zentrale Lage - große Dachterrasse	32	40217	Fürstenwall	51.2141	6.7748	1955
33237768	https://www.wohnungsboerse.net/immodetail/33237768	37	1	KLEINES APARTMENT IN DÜSSELDORF WERSTEN	91	40591	Bensberger	51.1836	6.83151	1966
33237999	https://www.wohnungsboerse.net/immodetail/33237999	45	1	Möbliertes, großzügig geschnittenes 1-Zimmer-Appartment mit sonnigem Balkon	53	40489	\N	51.3305	6.76259	1982
33238207	https://www.wohnungsboerse.net/immodetail/33238207	150	3	Helle, elegante Wohnung mit großem Sonnenbalkon	56	45133	Alfredstraße	51.4161	6.99516	1982
33240414	https://www.wohnungsboerse.net/immodetail/33240414	106	3	Großzügige und helle 3- Zimmer- Wohnung in Düsseldorf- Gerresheim!	73	40625	Dernbuschweg	51.2455	6.86592	\N
33240741	https://www.wohnungsboerse.net/immodetail/33240741	109	3	Zentrale Lage, Wintergarten, Garten, Garage optional	14	40477	\N	51.2385	6.78498	1958
33242019	https://www.wohnungsboerse.net/immodetail/33242019	124	4	Moderne 4-Raum-Maisonette-Wohnung mit Balkon und Parkplatz in Kaiserswerth	97	40489	Am	51.2985	6.74002	2008
33242312	https://www.wohnungsboerse.net/immodetail/33242312	90	3	Charmante 3-Zimmer-Maisonettewohnung mit Balkon über den Dächern von Kaiserswerth	53	40489	\N	51.3305	6.76259	\N
33245396	https://www.wohnungsboerse.net/immodetail/33245396	150	5	Frisch renovierte 5-Zimmer-Wohnung mit riesiger Dach-Terrasse und EBK in Düsseldorf	64	40470	Scheffelstrasse	51.2621	6.7991	1918
33248616	https://www.wohnungsboerse.net/immodetail/33248616	96	3	Frisch modernisierte 3-Zimmer Wohnung über den Dächern von Lörick	43	40547	Hansaallee	51.2416	6.72515	\N
33248782	https://www.wohnungsboerse.net/immodetail/33248782	118	3	Außergewöhnliches Wohnen in einer modernen Kapelle	84	40627	Gödinghover	51.2145	6.86941	2013
33254188	https://www.wohnungsboerse.net/immodetail/33254188	79.07	3	Große 3-Zimmerwohnung in Düsseldorf Rath	63	40472	Oberrather	51.266	6.82577	1949
33254461	https://www.wohnungsboerse.net/immodetail/33254461	36	1	Von Privat ! Schicke Single-Wohnung in Düsseldorfer Altstadt in Rheinnähe !	11	40213	Ritterstraße	51.2297	6.7739	\N
33254648	https://www.wohnungsboerse.net/immodetail/33254648	76.79	2	Helle 2 Zimmer Wohnung in Benrath	95	40597	Cäcilienstr.	51.1654	6.87388	1991
33254653	https://www.wohnungsboerse.net/immodetail/33254653	39.13	1	47104/38 Helles 1-Zimmer-Appartement in D-Wittlaer	54	40489	Heinrich-Holtschneider	51.3178	6.74657	2000
33254812	https://www.wohnungsboerse.net/immodetail/33254812	50	2	Geräumige 2-Zimmer Wohnung zu vermieten	55	40489	Zur	51.328	6.78275	\N
33254817	https://www.wohnungsboerse.net/immodetail/33254817	31	1	Geräumiges Apartment in Friedrichstadt zu vermieten	31	40215	Scheurenstr.	51.2174	6.78724	\N
33254821	https://www.wohnungsboerse.net/immodetail/33254821	62.63	3	Geräumige 3-Zimmer Wohnung in Friedrichstadt zu vermieten	31	40215	Scheurenstr.	51.2174	6.78724	\N
33259837	https://www.wohnungsboerse.net/immodetail/33259837	83	2.5	Ruhige Lage Uninähe	97	40589	Huvestr	51.1661	6.8224	\N
33259857	https://www.wohnungsboerse.net/immodetail/33259857	150	4	Exklusive Penthouse-Maisonette in Düsseldorf-Wittlaer	54	40489	Kalkstraße	51.3216	6.73855	1987
33260449	https://www.wohnungsboerse.net/immodetail/33260449	106	4	Stilvolle 4-Zimmer-Wohnung mit Balkon in Düsseldorf	15	40476	Ulmenstraße	51.2491	6.78289	2021
33263608	https://www.wohnungsboerse.net/immodetail/33263608	86	2	2-Zimmer-Neubau-Gartenwohnung in gepflegter Umgebung	84	40627	\N	51.2024	6.88388	\N
33263620	https://www.wohnungsboerse.net/immodetail/33263620	135	4	Sanierte 4-Raum-Wohnung mit Balkon und Einbauküche in Düsseldorf/ Möbliert	32	40219	Düsselstraße	51.2135	6.76648	1963
33264606	https://www.wohnungsboerse.net/immodetail/33264606	101	3	Tolle 3-Zi-Komfort-Neubau-Whg. m. EBK u. großem Balkon	13	40210	Gerresheimer	51.2275	6.79528	2022
33264735	https://www.wohnungsboerse.net/immodetail/33264735	25	1	Ruhiges, möbliertes Wohnen im Trendviertel am Medienhafen	36	40221	Volmerswertherstr.	51.2093	6.76159	\N
33267257	https://www.wohnungsboerse.net/immodetail/33267257	72.5	2	Geschmackvolle Wohnung mit zwei Zimmern sowie Balkon mit Möbelübernahme in Düsseldorf	43	40547	Emanuel-Leutze-Straße	51.2432	6.74057	\N
33270460	https://www.wohnungsboerse.net/immodetail/33270460	44	1.5	Charmante, frisch renovierte Altbau Wohnung in Pempelfort	14	40477	Scharnhorststraße	51.2419	6.78473	\N
33271959	https://www.wohnungsboerse.net/immodetail/33271959	65	2	O6 - Exklusive, gepflegte 2-Zimmer-Maisonette-Wohnung mit Balkon in Düsseldorf	34	40221	Opfergasse	51.2083	6.73944	\N
33274005	https://www.wohnungsboerse.net/immodetail/33274005	75	3	Individuelle 3Zi.Whg, Dachterr., RUHIG im Hinterhof, Pempelfort	56	40477	Nordstraße	51.2357	6.77831	\N
33274310	https://www.wohnungsboerse.net/immodetail/33274310	67.3	2	Moderne 2-Zi-Wohnung in der „Gartenstadt Reitzenstein“	64	40470	Zur	51.2467	6.81202	2015
33274368	https://www.wohnungsboerse.net/immodetail/33274368	70.78	2	70 qm vom Feinsten - in Toplage Düsseldorfs	22	40235	Hohenzollernallee	51.2337	6.82379	2015
33274394	https://www.wohnungsboerse.net/immodetail/33274394	110.64	4	Wohntraum auf 110m² mit toller Loggia und zwei Bädern	36	40223	Merowingerstraße	51.2049	6.77712	2019
33274520	https://www.wohnungsboerse.net/immodetail/33274520	59.8	3	Demnächst frei! 3-Zimmer-Wohnung in Düsseldorf Vennhausen	83	40627	In	51.2121	6.85925	1956
33275992	https://www.wohnungsboerse.net/immodetail/33275992	57	2	VON PRIVAT / Erstbezug nach Sanierung: Wunderschön geschnittene 2-Zimmerwohnung im Grünen	101	40595	Stettinerstr.	51.1481	6.89966	\N
33276394	https://www.wohnungsboerse.net/immodetail/33276394	37.4	1	Möbliertes Apartment in Düsseldorf- Rath sucht neuen Mieter!	63	40472	Kanzlerstr.	51.2624	6.82259	1992
33276431	https://www.wohnungsboerse.net/immodetail/33276431	75	2	2-Zi.-Wo. - EBK, br. Dusche; Wanne, G-WC, gr. Balkon, Stellpl.	71	40627	\N	51.2024	6.88388	1991
33278540	https://www.wohnungsboerse.net/immodetail/33278540	90.15	3	gut geschnittene 3-Zi-Maisonettewohnung mit 2 Balkonen WG-geeignet	15	40476	Glockenstraße	51.245	6.78508	\N
33279878	https://www.wohnungsboerse.net/immodetail/33279878	98	2.5	D-Lörick|Stilvolle & kernsanierte 3-Zimmer-Wohnung mit geräumigem Balkon in gefragter Wohnlage!	43	40547	Amboßstraße	51.2394	6.73309	\N
33282360	https://www.wohnungsboerse.net/immodetail/33282360	79	3	*GOLZHEIM* Modernisierte Altbauperle mit Einbauküche und Stellplatz!!	16	40474	Uerdinger	51.2499	6.76369	\N
33282683	https://www.wohnungsboerse.net/immodetail/33282683	61	2	Garage inklusive! Gemütliche 2 Zimmer Wohnung am Eller-Schlosspark	82	40229	Deutzerstraße	51.1954	6.85477	\N
33282806	https://www.wohnungsboerse.net/immodetail/33282806	25.25	1.5	2 MONATE MIETFREI: Gemütliches Appartement in Bochum-Querenburg!	56	44801	Overbergstr.	51.4501	7.26427	\N
33282868	https://www.wohnungsboerse.net/immodetail/33282868	25.25	1.5	2 MONATE MIETFREI: Renoviertes Appartement in Bochum-Querenburg mit EBK!	56	44801	Overbergstr.	51.4501	7.26427	\N
33282869	https://www.wohnungsboerse.net/immodetail/33282869	25.25	1.5	2 MONATE MIETFREI: Renoviertes Appartement in Bochum-Querenburg mit EBK!	56	44801	Overbergstr.	51.4501	7.26427	\N
33284573	https://www.wohnungsboerse.net/immodetail/33284573	80	3	3,5 Zimmerwohnung mit Balkon in Garath	101	40595	Emil-Barth-Str.	51.1396	6.89536	\N
33284623	https://www.wohnungsboerse.net/immodetail/33284623	100	3	Befristet! 4 Zimmer Wohnung zu vermieten	31	40217	Talstr.	51.2118	6.77881	1905
33286890	https://www.wohnungsboerse.net/immodetail/33286890	74	3	Erstbezug nach Sanierung 3-Zimmer-Whg mit Balkon und Gemeinschaftsgarten	63	40472	\N	51.2685	6.83379	1960
33323829	https://www.wohnungsboerse.net/immodetail/33323829	50	1	1-Zimmer Wohnung in Top-Lage	32	40219	Erftstr.	51.214	6.75648	1957
33288206	https://www.wohnungsboerse.net/immodetail/33288206	59.5	2	MIETKAUF: \nModernes Wohnen in Heerdt:\n2-Zimmer-Neubauwohnung	42	40549	\N	51.2331	6.71909	2024
33292489	https://www.wohnungsboerse.net/immodetail/33292489	98.24	4	Komplett sanierte 4 Zimmerwohnung in perfekter Lage!	16	40476	Roßstraße	51.2491	6.77536	\N
33292761	https://www.wohnungsboerse.net/immodetail/33292761	90	3	* Naturschutzgebiet * / hochwertige Einbauküche	73	40629	Bergische	51.249	6.85991	1987
33296470	https://www.wohnungsboerse.net/immodetail/33296470	60	2	Sanierte Altbau 2-Zi. Wohnung mit Balkon in bester Lage von Pempelfort	14	40211	Schirmerstr.	51.2314	6.79342	\N
33298293	https://www.wohnungsboerse.net/immodetail/33298293	121	4	Metro-Straße 27, 40235 Düsseldorf	22	40235	Metro-Straße	51.2345	6.82771	2021
33298445	https://www.wohnungsboerse.net/immodetail/33298445	82.27	3	***NETTE MIETER GESUCHT-TOLLE 3 ZIMMER WOHNUNG MIT BALKON UND STELLPLATZ***	37	40227	Oberbilker	51.2101	6.80252	\N
33298728	https://www.wohnungsboerse.net/immodetail/33298728	62	2	Schöne 2-Zimmer Wohnung mit Terrasse | Rheinlage	95	40597	Benrather	51.1626	6.85614	1996
33298889	https://www.wohnungsboerse.net/immodetail/33298889	60	1.5	Exklusive, helle Maisonette-Wohnung in Düsseldorf - (Alt-) Wittlaer	54	40489	Wasserwerksweg	51.3337	6.72693	1983
33299265	https://www.wohnungsboerse.net/immodetail/33299265	51.85	2	Extra nur für Sie:  Alles NEU gemacht !	21	40233	\N	51.2198	6.8119	1954
33299372	https://www.wohnungsboerse.net/immodetail/33299372	63.74	2	Traumhafte schöne 2 Zimmer Wohnung in Düsseldorf-Wittlaer zu vermieten!!!	54	40489	Bergesweg	51.3173	6.75398	1971
33303860	https://www.wohnungsboerse.net/immodetail/33303860	75	2	2-Zi. Wohnung zentral und im Grünen am Elbroichpark	93	40589	Bahlenstrasse	51.1761	6.82872	\N
33303915	https://www.wohnungsboerse.net/immodetail/33303915	75.4	2	Gemütliche Dachgeschosswohnung mit viel Licht	82	40231	Reisholzerstr	51.2075	6.83075	1958
33304400	https://www.wohnungsboerse.net/immodetail/33304400	84.5	3	Achtung, 1 Monat Mietfrei! - Viel Platz in ruhiger, grüner Lage	54	40489	Bergesweg	51.3176	6.7541	1971
33304508	https://www.wohnungsboerse.net/immodetail/33304508	47	2	**Moderne & gepflegte 2-Zi. DG-Wohnung in Serm**	92	47259	An	51.3475	6.70905	1979
33306950	https://www.wohnungsboerse.net/immodetail/33306950	66	2	Exklusive 2-Zimmer Wohnung in Golzheim	16	40474	Kaiserswerther	51.2442	6.77144	\N
33306997	https://www.wohnungsboerse.net/immodetail/33306997	88.5	3	Stilvolle 3-Zimmer-Dachgeschosswohnung mit Balkon und Einbauküche in Düsseldorf	63	40472	Am	51.2638	6.81604	\N
33308983	https://www.wohnungsboerse.net/immodetail/33308983	120	4	# ALTBAUJUWEL IN TOPLAGE MIT TRAUMHAFTEN BLICK AUF DEN RHEIN #	12	40213	Rathausufer	51.2221	6.77271	1909
33309447	https://www.wohnungsboerse.net/immodetail/33309447	60.5	2	Schöne 2-Zimmer Altbau-Wohnung in Friedrichstadt	31	40215	Gustav-Poensgen-Strasse	51.2121	6.78845	1950
33309495	https://www.wohnungsboerse.net/immodetail/33309495	85.3	3	3-Zimmer-Wohnung | 2-Balkone	71	40625	Torfbruchstraße	51.2353	6.84248	2024
33309496	https://www.wohnungsboerse.net/immodetail/33309496	77.6	2	Eck-Wohnung | Staffelgeschoss | 2-Zimmer	71	40625	Torfbruchstraße	51.2353	6.84248	2024
33309498	https://www.wohnungsboerse.net/immodetail/33309498	127.8	4	Dachgeschoss-Familien-Wohnung | Blick über Düsseldorf | 4-Zimmer	71	40625	Torfbruchstraße	51.2353	6.84248	2024
33309501	https://www.wohnungsboerse.net/immodetail/33309501	73.4	2	Hochparterre-Wohnung mit kleinem Garten | 2-Zimmer	71	40625	Torfbruchstraße	51.2353	6.84248	2024
33309510	https://www.wohnungsboerse.net/immodetail/33309510	65.21	2	* Senioren-Wohnung * hell & gemütlich * Liebfrauen betreutes Wohnen *	22	40235	\N	51.2294	6.82752	2005
33313054	https://www.wohnungsboerse.net/immodetail/33313054	51	3	Renovierte 2 bis 3-Zimmer-Wohnung im Herzen von Düsseldorf Benrath	95	40597	\N	51.1638	6.87102	1955
33317345	https://www.wohnungsboerse.net/immodetail/33317345	58	2	Geschmackvolle 2-Raum-Wohnung mit Balkon und Einbauküche in Düsseldorf	63	40472	Rather	51.2619	6.81079	\N
33318261	https://www.wohnungsboerse.net/immodetail/33318261	38	1.5	Stilvolle, geräumige und mobilierte Wohnung mit Balkon und EBK in Düsseldorf	62	40468	Beedstraße	51.2761	6.78302	\N
33318532	https://www.wohnungsboerse.net/immodetail/33318532	60	3	Charmante 3-Zimmer-Altbauwohnung am Grafenberger Wald	72	40629	Ludenbergerstraße	51.2406	6.83241	1948
33319871	https://www.wohnungsboerse.net/immodetail/33319871	27	1	Möblierte & kompakte Wohnung im Düsseldorfer Süden mit Terrasse	91	40591	\N	51.188	6.81736	\N
33320901	https://www.wohnungsboerse.net/immodetail/33320901	271	6	Townhouse Charakter mit Garten - Energieeffizienz, exklusiv, familienfreundlich und Luxus vereint	43	40547	\N	51.2419	6.74772	\N
33320934	https://www.wohnungsboerse.net/immodetail/33320934	120	4	# ALTBAUJUWEL IN TOPLAGE MIT TRAUMHAFTEN BLICK AUF DEN RHEIN #	12	40213	\N	51.2221	6.77271	1909
33321218	https://www.wohnungsboerse.net/immodetail/33321218	48.97	2	47110/131 Charmante 2-Zimmer-Wohnung in Mörsenbroich	64	40470	St-Franziskus-Straße	51.2552	6.80864	\N
33321367	https://www.wohnungsboerse.net/immodetail/33321367	88	3	Geräumige 3 Zimmer Wohnung mit EBK in Flehe	38	40223	\N	51.1998	6.77225	1905
33321369	https://www.wohnungsboerse.net/immodetail/33321369	56	2	*WBS erforderlich* Geräumige 2 Zimmer Wohnung mit Balkon in Flehe	38	40223	\N	51.1998	6.77225	\N
33321684	https://www.wohnungsboerse.net/immodetail/33321684	71.73	2	Ansehen, einziehen, wohlfühlen!	22	40233	Ackerstr.	51.2281	6.80199	1930
33323575	https://www.wohnungsboerse.net/immodetail/33323575	93	2.5	2.5 Zimmer Wohnung nahe Volksgarten	37	40227	Oberbilker	51.2111	6.79224	1939
33323591	https://www.wohnungsboerse.net/immodetail/33323591	132	5	5 Zimmer Penthouse im "Wohnen mit Kindern" Baugruppenprojekt in Düsseldorf, Gerresheim	71	40625	Hallesche	51.2301	6.85146	2017
33323933	https://www.wohnungsboerse.net/immodetail/33323933	74.1	3	*** 2 Monaten keine Grundmiete zahlen * Bei Anmietung zum 16.12.2023 ***	97	45891	Cranger	51.5515	7.10259	1914
33324054	https://www.wohnungsboerse.net/immodetail/33324054	35	1	Appartement in Nähe des Aaper Waldes  - nur mit Einkommensnachweis !	63	40472	Oberratherstrasse	51.2649	6.82449	\N
33326054	https://www.wohnungsboerse.net/immodetail/33326054	80	2	Geräumige 2-Zimmer-Wohnung in Düsseldorf	36	40221	Volmerswerther	51.1994	6.76309	\N
33329001	https://www.wohnungsboerse.net/immodetail/33329001	23.85	1	dein neues möbliertes Apartment mit Balkon zum Innenhof! (360 Grad Rundgang)	23	40237	Grafenberger	51.2314	6.80545	2021
33329023	https://www.wohnungsboerse.net/immodetail/33329023	116	4	Moderne Souterrain Wohnung mit Garten und Tiefgaragenstellplatz in Düsseldorf-Wittlaer	54	40489	\N	51.3305	6.76259	2007
33329109	https://www.wohnungsboerse.net/immodetail/33329109	25.43	1	das Apartment sucht Dich - möbliertes Apartment in Düsseldorf	23	40237	Grafenberger	51.2314	6.80545	2021
33329245	https://www.wohnungsboerse.net/immodetail/33329245	39.83	1	Möbliertes Wohnen im Süden Düsseldorf | MIO Himmelsgeister Höfe	36	40225	Himmelgeister	51.2008	6.78274	2023
33329646	https://www.wohnungsboerse.net/immodetail/33329646	98	3	Sonnige 3 Zimmer Wohnung (98 m²) mit  2 großen Terrassen	14	40479	\N	51.2333	6.78371	\N
33331577	https://www.wohnungsboerse.net/immodetail/33331577	30	1	Appartment komplett möbliert in Düsseldorf Gerresheim	71	40625	Benderstr.	51.2384	6.84978	1976
33331619	https://www.wohnungsboerse.net/immodetail/33331619	91	2	Dachterrassenwohnung auf der Jülicher Strasse	15	40477	Jülicher	51.243	6.78727	\N
33331984	https://www.wohnungsboerse.net/immodetail/33331984	76.75	3	Großzügige 3-Zimmer-Wohnung in Lichtebroich - bitte den Text lesen	61	40472	Buchholzer	51.2805	6.79905	\N
33331985	https://www.wohnungsboerse.net/immodetail/33331985	77	3	Endlich Zuhause: tolle 3-Zimmer-Erdgeschosswohnung	61	40472	Niederbeckstraße	51.2805	6.79816	1975
33333764	https://www.wohnungsboerse.net/immodetail/33333764	80	2	Ruhige, toll ausgestattete 2-Zimmer-Wohnung im zentralen Düsseltal mit Blick ins Grüne	23	40237	\N	51.2357	6.80917	1953
33333838	https://www.wohnungsboerse.net/immodetail/33333838	129.23	3	3,2,1 - einziehen	43	40547	Niederkasseler	51.2416	6.73738	\N
33333966	https://www.wohnungsboerse.net/immodetail/33333966	76.41	3	Modernes Wohnen! Sanierte 3-Zi-Souterrain-Whg mit Terrasse	83	40627	Erlenkamp	51.2101	6.85867	\N
33337177	https://www.wohnungsboerse.net/immodetail/33337177	45	1.5	Helle 1-Zimmer-Wohnung mit Balkon in D-Kaiserswerth	53	40489	\N	51.3305	6.76259	\N
33337302	https://www.wohnungsboerse.net/immodetail/33337302	55.45	2	Einziehen und wohlfühlen. Tolle 2-Zimmer-Wohnung mit neuem Bad und Balkon	61	40472	Am	51.283	6.79216	\N
33337352	https://www.wohnungsboerse.net/immodetail/33337352	136	4	40593 Urdenbach  - Helle Maisonettewohnung mit Terrasse und Garten	96	40593	\N	51.1403	6.86854	\N
33337558	https://www.wohnungsboerse.net/immodetail/33337558	65	2	2 Zimmer-Altbauwohnung mit Wintergarten im 1. OG und Gartenanteil in Düsseldorf-Süd	94	40599	\N	51.1825	6.8657	\N
33341744	https://www.wohnungsboerse.net/immodetail/33341744	102	3	Schöne, moderne  3 Zimmer Wohnung mit Blick in idyllischen Garten	72	40629	\N	51.255	6.88361	1954
33341790	https://www.wohnungsboerse.net/immodetail/33341790	52.5	2	** NOCH VERMIETET **Dorotheenhöfe: 2-Zimmer-Wohnung mit Loggia in D-Flingern	21	40235	Dorotheenstr.	51.226	6.81112	\N
33341849	https://www.wohnungsboerse.net/immodetail/33341849	22.82	1	3, 2, 1 - dein neues möbliertes Apartment in zentraler Lage von Düsseldorf mit Balkon!	23	40237	Grafenberger	51.2314	6.80545	2021
33341861	https://www.wohnungsboerse.net/immodetail/33341861	27.91	1	Apartment mit Möblierung im Großstadtdschungel sucht neuen Mieter	23	40237	Grafenberger	51.2314	6.80545	2021
33341901	https://www.wohnungsboerse.net/immodetail/33341901	26.34	1	ca. 2,5 km vom Rhein entfernt - möbliertes Apartment sucht dich!	23	40237	Grafenberger	51.2314	6.80545	2021
33341987	https://www.wohnungsboerse.net/immodetail/33341987	30.97	1	möbliertes Apartment in Düsseldorf zum Jahresbeginn verfügbar!	23	40237	Grafenberger	51.2314	6.80545	2021
33343707	https://www.wohnungsboerse.net/immodetail/33343707	122	3	***SCHÖN, RUHIG & GRÜN. TOLLE 3- ZIMMERWOHNUNG  MIT TERRASSE, GARTEN  &  NEUEM BAD***	84	40627	Rathelbeckstraße	51.2062	6.88544	\N
33343712	https://www.wohnungsboerse.net/immodetail/33343712	70	2	Sanierte 2-Zimmer-Wohnung mit Balkon in Kaiserswerth Düsseldorf	53	40489	Niederrheinstraße	51.289	6.73722	1972
33343991	https://www.wohnungsboerse.net/immodetail/33343991	65.19	3	3-Zimmer-Wohnung in Düsseldorf Hassels	98	40599	Potsdamer	51.1828	6.86147	1975
33343992	https://www.wohnungsboerse.net/immodetail/33343992	83	4	4-Zimmer-Wohnung in Düsseldorf Hassels	98	40599	Potsdamer	51.1858	6.86143	\N
33343999	https://www.wohnungsboerse.net/immodetail/33343999	81.01	3	3-Zimmer-Wohnung in Düsseldorf Hassels	98	40599	Fürstenberger	51.1811	6.86332	1975
33344003	https://www.wohnungsboerse.net/immodetail/33344003	81.01	3	3-Zimmer-Wohnung in Düsseldorf Hassels	98	40599	Fürstenberger	51.1812	6.86214	1975
33344004	https://www.wohnungsboerse.net/immodetail/33344004	81.01	3	3-Zimmer-Wohnung in Düsseldorf Hassels	98	40599	Fürstenberger	51.1814	6.86197	1975
33344005	https://www.wohnungsboerse.net/immodetail/33344005	81.01	3	3 Zimmer-Wohnung in Düsseldorf Hassels	98	40599	Fürstenberger	51.1817	6.86154	1975
33344007	https://www.wohnungsboerse.net/immodetail/33344007	80	3	3-Zimmer-Wohnung in Düsseldorf Hassels	98	40599	Potsdamer	51.1847	6.86023	1975
33344008	https://www.wohnungsboerse.net/immodetail/33344008	80	3	3-Zimmer-Wohnung in Düsseldorf Hassels	98	40599	Potsdamer	51.1847	6.86023	1975
33344010	https://www.wohnungsboerse.net/immodetail/33344010	81.01	3	3-Zimmer-Wohnung in Düsseldorf Hassels	98	40599	Potsdamer	51.1847	6.86023	1975
33344012	https://www.wohnungsboerse.net/immodetail/33344012	133	4	Wunderschöne, kernsanierte Wohnung mit toller Terrasse in Angermund!	55	40489	Bilkratherweg	51.3298	6.7787	\N
33344025	https://www.wohnungsboerse.net/immodetail/33344025	52.18	2	2-Zimmer-Wohnung in Düsseldorf Hassels	98	40599	Altenbrückstraße	51.1826	6.86933	\N
33344117	https://www.wohnungsboerse.net/immodetail/33344117	34	2	Frisch saniertes 2-Zimmer Apartment	37	40227	Kölnerstr.	51.2185	6.801	\N
33344119	https://www.wohnungsboerse.net/immodetail/33344119	28	1	Frisch saniertes 1-Zimmer Apartment	37	40227	Kölnerstr.	51.2185	6.801	\N
33344120	https://www.wohnungsboerse.net/immodetail/33344120	67	3	Frisch sanierte 3-Zimmer Wohnung mit kleinem Balkon	37	40227	Kölnerstr.	51.2185	6.801	\N
33345380	https://www.wohnungsboerse.net/immodetail/33345380	46	2	2 Zi-Dachgeschosswohnung, Tel. 0211-763144, teilschräge, KDB, gute Wohnlage, 46 qm, KM 520, NK 80, z. 01.12.2023 frei	91	40591	Liebfrauenstrasse	51.189	6.81958	1938
33347299	https://www.wohnungsboerse.net/immodetail/33347299	49	2	Eleganz mit Geschichte - Attraktive 2-Zimmer-Wohnung im Dreiflügelhaus in Düsseldorf-Wittlaer	54	40489	\N	51.3305	6.76259	1908
33347319	https://www.wohnungsboerse.net/immodetail/33347319	70.75	3	Klasse Wohnung mit Balkon und EBK!	13	40210	Stresemannstraße	51.2202	6.78603	1960
33347397	https://www.wohnungsboerse.net/immodetail/33347397	56	1	Helle Dachgeschossohnung mit Balkon in Düsseldorf Wersten nähe Uni	91	40589	Bahlenstraße	51.1822	6.8221	\N
33347440	https://www.wohnungsboerse.net/immodetail/33347440	107	3	Hochwertige, renovierte Wohnung in Grafenberg	72	40235	Grimmstr.	51.2422	6.82464	\N
33347483	https://www.wohnungsboerse.net/immodetail/33347483	87.69	4	4 Zimmerwohnung mit Balkon und Gäste WC in Düsseldorf-Knittkuhl - ggf. mit EBK	74	40629	Am	51.2682	6.8728	\N
33347563	https://www.wohnungsboerse.net/immodetail/33347563	82	3.5	GROßZÜGIGE 3.5 ZI. WOHNUNG MIT SONNIGEM BALKON	101	40595	Peter-Behrens-Str.	51.1434	6.89584	1966
33347939	https://www.wohnungsboerse.net/immodetail/33347939	98.99	2	Charmante Gartenterrassenwohnung im Andreas Quartier	11	40213	\N	51.2221	6.77271	2017
33351683	https://www.wohnungsboerse.net/immodetail/33351683	89.8	3	Erstbezug Neubau: Exklusive 3-Zimmer-Wohnung m. Balkon in attraktiver Lage, KFW55-Standard	84	40627	Karl-Knödl-Straße	51.2032	6.90386	2023
33351834	https://www.wohnungsboerse.net/immodetail/33351834	124.7	3.5	Moderner Altbau im Neuen Garten | Möblierte Rarität	15	40476	\N	51.248	6.77902	1900
33352052	https://www.wohnungsboerse.net/immodetail/33352052	66	2	Von privat! Erstbezug! Wunderschöne 2-Z-Neubauwohnung mit Balkon	63	40472	\N	51.2685	6.83379	2023
33352134	https://www.wohnungsboerse.net/immodetail/33352134	61	2	Gemütliche 2-Zimmer-Wohnung in erstklassiger Lage - unmittelbare Nähe zum Klemensviertel	53	40489	\N	51.3305	6.76259	1984
33354570	https://www.wohnungsboerse.net/immodetail/33354570	73.76	3	Möblierte 3-Zimmer Wohnung in direkter Wasserlage im Medienhafen!	33	40221	Speditionstraße	51.2156	6.7501	2021
33354625	https://www.wohnungsboerse.net/immodetail/33354625	88.5	3	***D´dorf-Holthausen, Nähe Park Elbroich,  Wohnen mit Ausblick! geräumige 3 Zi. + großer Balkon!***	93	40589	\N	51.1641	6.82144	1968
33355109	https://www.wohnungsboerse.net/immodetail/33355109	47	1	Gemütliches und saniertes Appartement mit Balkon	42	40549	Heerdter	51.2318	6.71633	1957
33355278	https://www.wohnungsboerse.net/immodetail/33355278	23.9	1	Möbliertes Apartment mit Balkon in Düsseldorf- Rath!	63	40472	Kanzlerstr.	51.2624	6.82259	\N
33355426	https://www.wohnungsboerse.net/immodetail/33355426	112	3	Frisch renovierte 3Zimmer-Obergeschosswohnung	72	40235	Simrockstraße	51.2417	6.82228	2002
33355443	https://www.wohnungsboerse.net/immodetail/33355443	115	3	Frisch renovierte 3Zimmer-Erdgeschosswohnung	72	40235	Simrockstraße	51.2417	6.82228	2002
33358387	https://www.wohnungsboerse.net/immodetail/33358387	108.1	3.5	Helle 3,5-Raum-Wohnung mit Aufzug in Saarn (Zweitbezug)	92	45481	\N	51.3883	6.85661	\N
33360820	https://www.wohnungsboerse.net/immodetail/33360820	73.04	3	Frisch renovierte 3-Zimmerwohnung mit Balkon in Rheinnähe	35	40221	\N	51.1997	6.75072	1974
33360934	https://www.wohnungsboerse.net/immodetail/33360934	75	3	3,5 Raum DG Wohnung mit Balkon	56	45739	Rapener	51.6424	7.27672	1996
33360939	https://www.wohnungsboerse.net/immodetail/33360939	175.24	4	Charmante 4-Zimmer-Wohnung mit Blick in den Andreas Garten	11	40213	\N	51.2221	6.77271	\N
33363525	https://www.wohnungsboerse.net/immodetail/33363525	51	2	Erstbezug einer kernsanierten Altbauwohnung mit Flair  in Trendlage	22	40233	\N	51.2198	6.8119	\N
33365152	https://www.wohnungsboerse.net/immodetail/33365152	31.65	1	schickes Apartment mit Einbauküche in Lörick	43	40547	Wevelinghover	51.2451	6.72972	\N
33366949	https://www.wohnungsboerse.net/immodetail/33366949	103	3	2021 kernsanierte Wohnung über den Dächern von Grafenberg	72	40235	Grafenberger	51.2398	6.82482	1910
33367045	https://www.wohnungsboerse.net/immodetail/33367045	71.73	2	Erstbezug nach Sanierung:  2-Zimmer-Terrassen-Wohnung	62	40468	Im	51.2775	6.78575	1982
33367267	https://www.wohnungsboerse.net/immodetail/33367267	90	3	Charmante 3-Zimmer-Wohnung mit EBK am Ostpark in Düsseldorf Grafenberg	72	40629	\N	51.255	6.88361	\N
33368057	https://www.wohnungsboerse.net/immodetail/33368057	63	2	2ZKDB mit großer Terasse in Alt-Lörick	43	40547	Bonifatiusstraße	51.2504	6.72424	\N
33368149	https://www.wohnungsboerse.net/immodetail/33368149	67	3	Düsseldorf,  67 qm  ruhige Lage, 3 Zi, Kü, Di, Bad, 2 Balkon2	82	40231	Jägerstr	51.2065	6.84111	\N
33368188	https://www.wohnungsboerse.net/immodetail/33368188	52	2	Luxus Neubau 2-Zimmer-Wohnung mit Balkon und moderne Einbauküche in Düsseldorf Golzheim	16	40476	Roßstraße	51.2503	6.77416	2023
33368227	https://www.wohnungsboerse.net/immodetail/33368227	79	4	Geräumige 4-Zimmer-Wohnung in Bergerhausen - Erstbezug nach Grundsanierung!	56	45136	\N	51.4356	7.03556	1898
33373146	https://www.wohnungsboerse.net/immodetail/33373146	98	2.5	Flingern: 2-Zimmer Loftwohnung	21	40233	\N	51.2198	6.8119	\N
33373304	https://www.wohnungsboerse.net/immodetail/33373304	85	4	WG geeignetes EFH mit Garten, Sauna und Garage in Düsseldorf Oberkassel	41	40545	Lanker	51.2333	6.74689	\N
33373605	https://www.wohnungsboerse.net/immodetail/33373605	31	1	Möbliertes Apartment mit Balkon im Trendviertel Unterbilk	32	40219	Düsselstraße	51.2143	6.76417	1956
33373823	https://www.wohnungsboerse.net/immodetail/33373823	76	2	[Düsseldorf-Pempelfort] Tolle Zwei-Raum Wohnung in beliebter Wohnlage	14	40479	Bagelstraße	51.2354	6.79261	\N
33373985	https://www.wohnungsboerse.net/immodetail/33373985	84	3	Helle schöne Wohnung für  die 3-köpfige  Familie	51	40474	Beckbuschstr.	51.2659	6.74802	\N
33376062	https://www.wohnungsboerse.net/immodetail/33376062	54	2	Vollmöblierte Stadtwohnung in der Nähe von öffentlichen Verkehrsmitteln+Einkaufsmöglichkeiten	16	40476	Seydlitzstr	51.2428	6.78127	\N
33376142	https://www.wohnungsboerse.net/immodetail/33376142	82	3.5	TOP LAGE IN DÜSSELDORF-GARATH- MIT BALKON UND GARAGENSTELLPLATZ	101	40595	Peter-Behrens-Str.	51.1434	6.89584	1966
33376381	https://www.wohnungsboerse.net/immodetail/33376381	51.21	2	*** Schöne 3-Zimmerwohnung in Düsseldorf-Rath ***	63	40472	Oberrather	51.265	6.82354	\N
33377916	https://www.wohnungsboerse.net/immodetail/33377916	113.24	3	Helle Wohnung mit großzügigem Terrassenbalkon in Düsseldorf Bilk	32	40217	Kronprinzenstraße	51.2155	6.77162	1970
33378242	https://www.wohnungsboerse.net/immodetail/33378242	67	2	Sanierte 2 Zimmerwohnung mit Aufzug in Düsseldorf Golzheim zur Miete!	16	40474	\N	51.2738	6.74219	1960
33378454	https://www.wohnungsboerse.net/immodetail/33378454	17.58	1	D-Carlstadt! Modernes Apartment zu vermieten	12	40213	Schwanenmarkt	51.2193	6.77255	\N
33378464	https://www.wohnungsboerse.net/immodetail/33378464	87.2	2	2- Zimmerwohnung Dachgeschoßwohnung	72	40235	Grimmstr.	51.2433	6.82461	\N
33380168	https://www.wohnungsboerse.net/immodetail/33380168	63	2	Sehr schöne 2-Zimmer-Wohnung mit Blick ins Grüne	42	40549	\N	51.2331	6.71909	\N
33380525	https://www.wohnungsboerse.net/immodetail/33380525	126	4	ATEMBERAUBENDES WOHNEN AM SCHLOSS BENRATH	95	40597	\N	51.1638	6.87102	\N
33380713	https://www.wohnungsboerse.net/immodetail/33380713	73.31	2	2-Zimmer-Wohnung mit Einbauküche in Düsseldorf	23	40239	Maurenbrecherstraße	51.2483	6.80255	\N
33381820	https://www.wohnungsboerse.net/immodetail/33381820	32	1.5	Düsseldorf-Benrath provisionsfreies modernes helles  renoviertes Apartment in Waldnähe Pau	95	40597	Rheinstahlstraße	51.1639	6.88367	\N
33382256	https://www.wohnungsboerse.net/immodetail/33382256	120	4	Erstbezug: ansprechen 4-Zimmer-Maisonette-Wohnung in Angermund	55	40489	Angermunder	51.333	6.78985	\N
33382392	https://www.wohnungsboerse.net/immodetail/33382392	64	2	Sanierte, top moderne 2 Zimmer Wohnung in Golzheim!	16	40476	Zietenstr.	51.2426	6.77759	\N
33382415	https://www.wohnungsboerse.net/immodetail/33382415	47	1	Geschmackvolle 1,5-Raum-Wohnung mit Balkon und EBK in Neuss	97	41462	Viersener	51.2175	6.65517	1963
33382426	https://www.wohnungsboerse.net/immodetail/33382426	63	2	Mit Balkon! Ideal geschnittene 2-Zimmer-Wohnung in Eller	82	40231	Zeppelinstr.	51.2053	6.83317	\N
33383272	https://www.wohnungsboerse.net/immodetail/33383272	80	3	Nachmieter für helle 3-Zimmer Wohnung im Zentrum von Düsseldorf gesucht	31	40215	Adersstrasse	51.2177	6.78458	1960
33384086	https://www.wohnungsboerse.net/immodetail/33384086	104	4	Gepflegte 4-Zimmer-Etagenwohnung mit EBK und SW-Terrasse in gefragterLage	44	40547	\N	51.2419	6.74772	\N
33384509	https://www.wohnungsboerse.net/immodetail/33384509	86.58	2	Wunderschöne 2-Zimmer-Wohnung in Düsseldorf	73	40629	Am	51.2456	6.85088	2009
33384649	https://www.wohnungsboerse.net/immodetail/33384649	136	5	Top sanierte 5-Zimmer-Gartenwohnung in Düsseldorf Stockum	51	40474	Niederrheinstraße	51.2675	6.74938	\N
33386056	https://www.wohnungsboerse.net/immodetail/33386056	52	2	Helle Dachgeschosswohnug in Pulheim-City	92	50259	\N	50.9996	6.80769	1970
33386081	https://www.wohnungsboerse.net/immodetail/33386081	38	1.5	Voll möblierte 1,5-Zimmer-Wohnung mit Einbauküche in Düsseldorf-Flingern	21	40233	\N	51.2198	6.8119	1958
33386349	https://www.wohnungsboerse.net/immodetail/33386349	143.52	4	Großzügige 4-Zimmer-Wohnung mit zwei Balkonen in Düsseldorf-Heerdt	42	40549	Am	51.2333	6.72125	\N
33386717	https://www.wohnungsboerse.net/immodetail/33386717	77	2	Düsseldorf-Benrath! Großzügige Balkonwohnung! Ideal für Single oder Pärch	95	40597	\N	51.1638	6.87102	\N
33386763	https://www.wohnungsboerse.net/immodetail/33386763	97	3.5	Sonnige Wohlfühloase mit großzg. 3,5-Zimmern und 2 Balkonen in bevorzugter Lage von D-dorf Golzheim!	16	40474	\N	51.2738	6.74219	1939
33389217	https://www.wohnungsboerse.net/immodetail/33389217	35.13	1	WIN WIN - 1-Zimmer Wohnung im Medienhafen	33	40221	Speditionstraße	51.215	6.74939	\N
33389260	https://www.wohnungsboerse.net/immodetail/33389260	160	3	WOHNTRAUM IN RHEINLAGE!\n3 Zimmer	96	40593	Am	51.15	6.86165	\N
33389516	https://www.wohnungsboerse.net/immodetail/33389516	84	3	Helle, renovierte 3-Zimmer-Wohnung, 2 Balkone, Tageslichtbad mit Wanne und Dusche, Keller	93	40589	Eichenkreuzstraße	51.1723	6.83549	\N
33389603	https://www.wohnungsboerse.net/immodetail/33389603	120	5	Unterbach-Schöne Maisonettewohnung mit 5 Zimmern, großer Terasse und Garage ab sofort	84	40627	Gerresheimer	51.2037	6.89044	\N
33391895	https://www.wohnungsboerse.net/immodetail/33391895	35.13	1	WIN WIN - 1 Zimmer Wohnung im 4.OG	33	40221	Speditionstraße	51.2156	6.7501	\N
33391913	https://www.wohnungsboerse.net/immodetail/33391913	85	3.5	Freundliche 3,5-Zimmer-Wohnung zur Miete in Düsseldorf	93	40589	\N	51.1641	6.82144	\N
33392135	https://www.wohnungsboerse.net/immodetail/33392135	45	2	Frisch sanierte/möblierte 1,5-Zimmer Souterrainwohnung	84	40627	Gerresheimer	51.2038	6.89319	1998
33393636	https://www.wohnungsboerse.net/immodetail/33393636	75	3	Stilvolle, neuwertige 3-Zimmer-Hochparterre-Wohnung mit Balkon in Düsseldorf	93	40589	Quadestraße	51.1781	6.8344	1966
33393958	https://www.wohnungsboerse.net/immodetail/33393958	83.61	2	2 Zimmer Erdgeschoss Wohnung mit Gartenzugang in D.-Heerdt / Concierge, Sauna, Fitness	42	40549	Heinrich	51.2388	6.72989	\N
33394176	https://www.wohnungsboerse.net/immodetail/33394176	73	3	Frisch renoviert: 3 Zi-Wohnung mit Balkon	93	40589	Kölner	51.1782	6.82951	\N
33396009	https://www.wohnungsboerse.net/immodetail/33396009	74.68	3	Was will man mehr? Großzügige 3-Zimmer-Wohnung mit tollem Balkon und neuem Bad	61	40472	Am	51.282	6.79275	1983
33397527	https://www.wohnungsboerse.net/immodetail/33397527	88	3	Helle 3-Zimmer-DG-Wohnung mit Balkon in Wersten-Uninähe	91	40591	Otto-Hahn-Straße	51.1799	6.80736	\N
33397714	https://www.wohnungsboerse.net/immodetail/33397714	66	2	**FURNISHED** Moderne und stilvolle Wohnung	22	40235	Neumannstr.	51.233	6.82368	\N
33397839	https://www.wohnungsboerse.net/immodetail/33397839	65.92	3.5	3-Zimmer-Wohnung mit Balkon- wird renoviert	101	40595	Wilhelm-Kreis-Straße	51.1451	6.89118	\N
33397960	https://www.wohnungsboerse.net/immodetail/33397960	84	3	84m² Carlsstadt / Altstadt mit Blick auf den Schwanenspiegel Ecke Schwanenmarkt-Park	12	40213	Haroldstraße	51.2192	6.77411	1960
33400003	https://www.wohnungsboerse.net/immodetail/33400003	65.01	2	Attraktive 2 Zimmer-Wohnung mit großer Küche, neuem Bad und schönem Balkon!	93	40589	Adolf-Klarenbach-Str.	51.1717	6.83409	1992
33401670	https://www.wohnungsboerse.net/immodetail/33401670	118	3	Neubau Erstbezug. Komplett Barrierefreie Penthousewohnung	84	40627	Kirschblütenweg	51.2009	6.90167	\N
33401744	https://www.wohnungsboerse.net/immodetail/33401744	186	5	Exklusives Penthouse in erster Rheinlage  in Düsseldorf - Golzheim	16	40474	\N	51.2738	6.74219	2008
33401864	https://www.wohnungsboerse.net/immodetail/33401864	71	2	Neubau Erstbezug. Komplett Barrierefreie Wohnung	84	40627	Kirschblütenweg	51.2009	6.90167	\N
33401914	https://www.wohnungsboerse.net/immodetail/33401914	65	2	* Senioren-Wohnung * helle 2 Zimmer mit Einbauküche *	22	40235	\N	51.2294	6.82752	\N
33401965	https://www.wohnungsboerse.net/immodetail/33401965	82	3	Wohnung in der Nähe des Zooparks sucht nach dem nächsten Mieter	64	40470	Ludwig-Beck-Straße	51.2461	6.81232	\N
33402808	https://www.wohnungsboerse.net/immodetail/33402808	79.92	3	Jetzt schnell zugreifen! 3-Zimmer-Wohnung in Lichtenbroich	61	40472	Am	51.283	6.79216	1983
33402810	https://www.wohnungsboerse.net/immodetail/33402810	68.15	3	3-Zimmer-Wohnung in Derendorf	15	40476	Essener	51.2436	6.78407	1913
33402819	https://www.wohnungsboerse.net/immodetail/33402819	67.36	3	Sanierte 3-Zimmer-Wohnung in Düsseldorf-Lierenfeld, neues Bad+ neue Böden	82	40231	Oderstr.	51.209	6.83178	\N
33402862	https://www.wohnungsboerse.net/immodetail/33402862	71.76	2	Tolle 2-Zimmer-Wohnung mit großer Terrasse!	13	40210	Immermannstr.	51.2227	6.79063	1960
33402892	https://www.wohnungsboerse.net/immodetail/33402892	116.18	3	Frisch sanierter Bungalow - 3 Zimmer mit Innenhof direkt am Schlosspark in Düsseldorf-Benrath/Urdenb	96	40593	Robert-Hansen-Straße	51.1535	6.8685	1977
33404414	https://www.wohnungsboerse.net/immodetail/33404414	79	3	Wunderschöne 3-Zimmerwohnung mit Balkom	23	40239	Ostendorfstraße	51.2472	6.80369	1936
33404501	https://www.wohnungsboerse.net/immodetail/33404501	60	2	Frisch Sanierte 2-Zimmer Wohnung mit 2 Balkone	36	40225	Stoffeler	51.195	6.77878	\N
33404503	https://www.wohnungsboerse.net/immodetail/33404503	43	2	Frisch Sanierte 2-Zimmer Wohnung mit Balkon	36	40225	Stoffeler	51.195	6.77878	\N
33404504	https://www.wohnungsboerse.net/immodetail/33404504	40	1	Frisch Sanierte 1-Zimmer Wohnung mit Terrasse	36	40225	Stoffeler	51.195	6.77878	\N
33404507	https://www.wohnungsboerse.net/immodetail/33404507	44.5	1	Traumhaftes Single-Apartment mit Balkon!	22	40235	Lindenstraße	51.231	6.8136	\N
33404509	https://www.wohnungsboerse.net/immodetail/33404509	78	3	Frisch Sanierte 3-Zimmer Wohnung mit Balkon	36	40225	Stoffeler	51.195	6.77878	\N
33404711	https://www.wohnungsboerse.net/immodetail/33404711	52	2	2-Zi.-Maissonette-Whg. mit EG-Terrasse, Wannenbad, sep.WC, ca. 52 m², € 495,--	82	40229	Gumbertstraße	51.1994	6.84398	\N
33407255	https://www.wohnungsboerse.net/immodetail/33407255	48	2	Möblierte 2-Zimmerwohnung mit Südbalkon auf der Ackerstraße	22	40233	\N	51.2198	6.8119	1950
33408980	https://www.wohnungsboerse.net/immodetail/33408980	35	1	Gemütliche Dachgeschosswohnung in Düsseldorf Flingern-Nord	22	40233	Lindenstraße	51.2288	6.80006	\N
33409137	https://www.wohnungsboerse.net/immodetail/33409137	28	1	Garten-Apartment in Top-Lage von D-Oberkassel Terrasse, moderner Boden, EBK, Waschmaschine, voll möb	41	40545	\N	51.2284	6.75437	\N
33409168	https://www.wohnungsboerse.net/immodetail/33409168	79.96	3	3-Zimmer-Wohnung in Düsseldorf Hassels	98	40599	Fürstenberger	51.1821	6.86251	1975
33409277	https://www.wohnungsboerse.net/immodetail/33409277	96	4	Wunderschöne Wohnung mit 2 Terrassen im Düsseldorf	15	40476	Collenbachstraße	51.2434	6.7826	\N
33412297	https://www.wohnungsboerse.net/immodetail/33412297	60	3	Vollständig renovierte 3-Raum-DG-Wohnung mit Einbauküche in Düsseldorf	82	40229	Am	51.2026	6.84238	\N
33412472	https://www.wohnungsboerse.net/immodetail/33412472	57.9	2	2-Zimmer-Wohnung in Düsseldorf	42	40549	Hildegard-Knef-Straße	51.2419	6.7146	\N
33413993	https://www.wohnungsboerse.net/immodetail/33413993	78	2	Luxuriöse vollmöblierte 2-Zimmer-Gartenwohnung in Rheinnähe	42	40549	Brunhildenstr.	51.2291	6.72144	1997
33414192	https://www.wohnungsboerse.net/immodetail/33414192	47.8	2	2-Zimmer Wohnung in Düsseldorf Wersten mit Balkon, Garten & Garage	91	40591	Werstener	51.1892	6.8333	\N
33414347	https://www.wohnungsboerse.net/immodetail/33414347	73	2	Großzügige Studio-Dachgeschoss-Wohnung	71	40625	Dreifaltigkeitsstraße	51.2284	6.86314	\N
33414349	https://www.wohnungsboerse.net/immodetail/33414349	147	4	Schöne Garten-Maisonettewohnung in Rheinlage	41	40545	\N	51.2284	6.75437	\N
33415998	https://www.wohnungsboerse.net/immodetail/33415998	90	4	D-Volmerswerth 4 Zimerwohnung befristet b. 31.03.2026, Rheinnähe	35	40221	Volmerswerther	51.1867	6.76132	\N
33416558	https://www.wohnungsboerse.net/immodetail/33416558	90	3	Neuwertige 3-Zimmer-Terrassenwohnung mit Balkon in Düsseldorf	84	40627	Karl-Knödl-Straße	51.2032	6.90386	\N
33416750	https://www.wohnungsboerse.net/immodetail/33416750	63	2.5	Exklusive 2,5-Zimmer-Wohnung mit Balkon und EBK in Düsseldorf	23	40237	\N	51.2357	6.80917	1981
33416752	https://www.wohnungsboerse.net/immodetail/33416752	97	2	Komplett sanierte und modernisierte Etagenwohnung in zentraler Lage Bahnhof 2 Minuten (2-Zimmer)	37	40227	\N	51.2154	6.79757	\N
33417423	https://www.wohnungsboerse.net/immodetail/33417423	64	2	Möbelierte Wohnung mit Tiefgarage Bezugsfrei ab 01.01.2024	82	40229	Ludwigshafener	51.2034	6.83159	\N
33418897	https://www.wohnungsboerse.net/immodetail/33418897	88	2	ALTBAU - HOHE DECKEN - 2 Zimmer + Wohnküche - Balkon - Nähe Königsallee	13	40210	\N	51.2225	6.78772	1902
33419034	https://www.wohnungsboerse.net/immodetail/33419034	83.55	3	Erstbezug nach Renovierung / ruhige 3-Zimmer-Wohnung mit Terrasse	62	40468	Hiddenseestr.	51.2741	6.77891	\N
33421608	https://www.wohnungsboerse.net/immodetail/33421608	73	3	Vollständig renovierte 3-Raum-Wohnung mit Einbauküche in Düsseldorf	93	40589	Itterstraße	51.1706	6.82427	\N
33421757	https://www.wohnungsboerse.net/immodetail/33421757	150	3.5	Tauschwohnung: Wunderschöne Gartenwohnung mit Holzofen	62	40468	\N	51.2612	6.7789	\N
33422162	https://www.wohnungsboerse.net/immodetail/33422162	57	2	Gemütliche Altbau-Balkon- Wohnung sofort für Sie frei! Langerstraße	21	40233	Langerstraße	51.223	6.80396	1950
33422243	https://www.wohnungsboerse.net/immodetail/33422243	121	3	*Wohnen im Papillion* 3- Zimmer Wohnung inkl. Einbauküche und Parklift	42	40549	Pariser	51.2329	6.72525	\N
33422321	https://www.wohnungsboerse.net/immodetail/33422321	97.67	2	Moderne 2 Zimmerwohnung mit Rheinblick, Balkon und auf Wunsch TG Stellplatz	11	40213	\N	51.2221	6.77271	\N
33424042	https://www.wohnungsboerse.net/immodetail/33424042	70	3	Gemütliche 3-Zimmer Erdgeschosswohnung im Düsseldorfer Süden	93	40589	Boschstraße	51.1781	6.82054	\N
33424092	https://www.wohnungsboerse.net/immodetail/33424092	95	3	Neubezug: helle 3-Zimmer Wohnung in Eller nach Komplettsanierung	82	40229	Gumbertstr	51.2005	6.8419	\N
33424200	https://www.wohnungsboerse.net/immodetail/33424200	99.95	2	Sonnige 2-Zimmer-Wohnung in Düsseldorf-Heerdt! Gleich 2 schöne Dachterrassen für viel Freiraum	42	40549	\N	51.2331	6.71909	\N
33424377	https://www.wohnungsboerse.net/immodetail/33424377	70	4	Tauschwohnung: Große Wohnung	83	40627	\N	51.2024	6.88388	\N
33424422	https://www.wohnungsboerse.net/immodetail/33424422	88	3	Tolle, großzügige 3-Raum Wohnung*Top Renoviert*Toller Grundriss*2 Balkone! Flottenstraße	82	40229	Flottenstraße	51.1979	6.83793	\N
33424462	https://www.wohnungsboerse.net/immodetail/33424462	58.36	2	2-Zimmer-Wohnung in Düsseldorf Heerdt	42	40549	Krefelder	51.2372	6.71065	\N
33424468	https://www.wohnungsboerse.net/immodetail/33424468	83.91	3	Top-Wohnung mit wunderschönem Garten	64	40470	Lenaustraße	51.2488	6.82151	\N
33425580	https://www.wohnungsboerse.net/immodetail/33425580	90	3	Helle 3-Zimmer-Wohnung mit 2 Balkonen und EBK in Düsseldorf-Zentrum	13	40210	Oststraße	51.2203	6.78445	\N
33425609	https://www.wohnungsboerse.net/immodetail/33425609	60	2	Neuwertige 2-Raum-Wohnung mit Balkon in Mönchengladbach	56	41068	Karl-Fegers-Str.	51.2002	6.41152	\N
33425661	https://www.wohnungsboerse.net/immodetail/33425661	59.5	2	Geschmackvolle Penthouse-Wohnung mit Rheinblick	43	40547	Emanuel-Leutze-Straße	51.2432	6.74057	\N
33425692	https://www.wohnungsboerse.net/immodetail/33425692	53	2	Vollständig renovierte 2-Raum-Wohnung mit Balkon in Düsseldorf	98	40599	\N	51.1825	6.8657	\N
33425750	https://www.wohnungsboerse.net/immodetail/33425750	53	2	Tauschwohnung: Tausche 2 Zimmerwohnung Düsseldorf gegen Köln	21	40233	\N	51.2198	6.8119	\N
33425802	https://www.wohnungsboerse.net/immodetail/33425802	87	4	Gut geschnittene 4-Zimmer-Wohnung (Balkon) in Düsseldorf (Flingern)	21	40233	Erkrather	51.2224	6.80425	\N
33425850	https://www.wohnungsboerse.net/immodetail/33425850	93	3	HOCHWERTIGE 3-RAUM-WOHNUNG MIT PARKETT, FUSSBODENHEIZUNG UND TOP-BÄDERN	73	40629	Am	51.2446	6.85191	2013
33426095	https://www.wohnungsboerse.net/immodetail/33426095	67.5	2	Helle, moderne und teilmöblierte 2-Zimmer-Wohnung in den Heinrich Heine Gärten	42	40549	\N	51.2331	6.71909	\N
33427963	https://www.wohnungsboerse.net/immodetail/33427963	54	2	Erstbezug nach Sanierung - 2-Zimmer mit Gartenzugang in Oberkassel	41	40545	Oberkasseler	51.2331	6.75533	1957
33428191	https://www.wohnungsboerse.net/immodetail/33428191	52	2	Helle Ansprechende 2-Zimmer-Wohnung mit Balkon in Düsseldorf	54	40489	\N	51.3305	6.76259	\N
33428288	https://www.wohnungsboerse.net/immodetail/33428288	68	2	Stilvolle 2-Zimmer-Wohnung mit Balkon und Einbauküche in gutem Zustand in Düsseldorf	91	40589	Kölner	51.1798	6.82799	\N
33428344	https://www.wohnungsboerse.net/immodetail/33428344	78	2	top Citylage -  helle 2 Zimmerwohnung - kurzfristig beziehbar!	13	40227	Friedrich-Ebert-Str.	51.2215	6.7902	\N
33429017	https://www.wohnungsboerse.net/immodetail/33429017	29.64	1	WIN WIN - Stilvoll möblierte 1 Zimmer-Wohnung im Medienhafen	33	40221	Speditionstraße	51.2156	6.7501	\N
33429247	https://www.wohnungsboerse.net/immodetail/33429247	107	3	Smarter Wohnen! Großzügige 3-Zi.Wohnung mit Kamin, großem Balkon und Garage! D-Unterbach!	84	40627	\N	51.2024	6.88388	1961
33431065	https://www.wohnungsboerse.net/immodetail/33431065	64.78	2	2 Raum Wohnung mit EBK - in zentraler Lage (HBF)	31	40210	Stresemannplatz	51.219	6.78853	1960
33495564	https://www.wohnungsboerse.net/immodetail/33495564	74	3	Top-renovierte Wohnung in Heerdt	42	40549	Malmedyer	51.226	6.69563	1997
33431309	https://www.wohnungsboerse.net/immodetail/33431309	70	2	Schöne Gartenwohnung mit Balkon in ruhiger Lage v. Mörsenbroich	64	40470	\N	51.2569	6.80771	\N
33432772	https://www.wohnungsboerse.net/immodetail/33432772	75.17	3	47105/66 Freundliche 3-Zimmer-Wohnung in Düsseldorf-Wittlaer	54	40489	Friederike-Fliedner-Weg	51.3169	6.75196	\N
33432779	https://www.wohnungsboerse.net/immodetail/33432779	70.09	3	47104/39 Charmante 3-Zimmer-Wohnung mit Balkon in D-Wittlaer	54	40489	Heinrich-Holtschneider	51.3178	6.74657	2000
33432833	https://www.wohnungsboerse.net/immodetail/33432833	90.1	3	Traumhaft Wohnen über den Dächern von Düsseldorf-Benrath	95	40597	Sistenichstr.	51.1637	6.87251	1930
33433016	https://www.wohnungsboerse.net/immodetail/33433016	100	2.5	Modernisierte 2,5-Zimmer-Wohnung mit Balkon und Einbauküche in Düsseldorf !!!Real Estate Hofmann!!!	82	40229	Dietrichstraße	51.199	6.83942	\N
33433063	https://www.wohnungsboerse.net/immodetail/33433063	90.5	3	Helle, vollständig modernisierte 3-Zimmer-Wohnung mit neuer Einbauküche in Bochum-Linden	56	44879	Lindenerstraße	51.4293	7.17085	1905
33434842	https://www.wohnungsboerse.net/immodetail/33434842	68	2	Exklusive DG-Wohnung mit Balkon und EBK in Düsseldorf	62	40468	Oldenburger	51.2676	6.77591	\N
33434998	https://www.wohnungsboerse.net/immodetail/33434998	78	3	Schöne 3-Zimmer-Wohnung mit modernem Bad und Vinyl-Böden, 2 Balkone	91	40591	Odenthaler	51.184	6.83001	\N
33435007	https://www.wohnungsboerse.net/immodetail/33435007	81.24	3	Neubau, Zweitbezug- Barrierefreie Wohnung in Düsseldorf - Hassels ab sofort	98	40599	Am	51.1785	6.87832	2017
33435042	https://www.wohnungsboerse.net/immodetail/33435042	60.43	3	Schicke 3-Zimmer-Wohnung in toller Lage	95	40597	Am	51.167	6.88262	\N
33435096	https://www.wohnungsboerse.net/immodetail/33435096	85	3	Tauschwohnung: Tausche eine 3 Zimmer Wohnung gegen eine 2 Zimmer Wohnung	13	40212	\N	51.2236	6.78053	\N
33435204	https://www.wohnungsboerse.net/immodetail/33435204	89	4	GRAFENBERG/OSTPARK EXKLUSIV MIT EIGENEM GARTENANTEIL+BALKON RENOVIERT LAMINAT 1. ETAGE HELL + RUHIG	72	40629	Hardtstraße	51.2382	6.83435	\N
33435206	https://www.wohnungsboerse.net/immodetail/33435206	89	3	GRAFENBERG/OSTPARK EXKLUSIV MIT EIGENEM GARTENANTEIL+BALKON RENOVIERT LAMINAT 1. ETAGE HELL + RUHIG	72	40629	Hardtstraße	51.2382	6.83435	1964
33435831	https://www.wohnungsboerse.net/immodetail/33435831	65	2	Garten Wohnung Itterstraße 40589 Düsseldorf	93	40589	\N	51.1641	6.82144	\N
33435882	https://www.wohnungsboerse.net/immodetail/33435882	86	2.5	Tauschwohnung: Helle offene DG Wohnung ohne Schrägen	93	40589	\N	51.1641	6.82144	\N
33435950	https://www.wohnungsboerse.net/immodetail/33435950	60	2	Hochwertig ausgestattete Balkonwohnung in ruhiger, zentraler Lage direkt vom Eigentümer	62	40468	Juiststr.	51.2738	6.77711	\N
33435999	https://www.wohnungsboerse.net/immodetail/33435999	83	3	Tauschwohnung: 3,5ZKDB Düsseldorf und Suche 2ZKDB in Düsseldorf oder Köln	62	40472	\N	51.2685	6.83379	\N
33436179	https://www.wohnungsboerse.net/immodetail/33436179	95	2.5	Tauschwohnung: große 2,5 Zimmer 95 qm/2 Wohnung, im Tausch gegen 60 qm/2	64	40470	\N	51.2569	6.80771	\N
33437122	https://www.wohnungsboerse.net/immodetail/33437122	86	3	moderne 3 Zimmer Wohnung in zentraler Lage von Unterbilk + Balkon mit Rheinturm-Blick	32	40217	Kirchfeldstraße	51.2125	6.77156	\N
33437192	https://www.wohnungsboerse.net/immodetail/33437192	139	3	Top gepflegte 3-Zimmer-Galeriewohnung mit hochwertiger Ausstattung in Golzheim	16	40474	\N	51.2738	6.74219	1998
33437413	https://www.wohnungsboerse.net/immodetail/33437413	56	2	Demnächst frei! 2-Zimmer-Wohnung in Düsseldorf Garath	101	40595	Carl-Friedr.-Goerdeler-Straße	51.1446	6.9054	\N
33437469	https://www.wohnungsboerse.net/immodetail/33437469	70	2	Alles FRISCH! 2-Zimmer im Zooviertel mit neuem Boden + Balkon + guter Schnitt + gut erreichbar	23	40239	Brehmstraße	51.2428	6.80137	\N
33437505	https://www.wohnungsboerse.net/immodetail/33437505	74	2	Tauschwohnung: 2Z Düsseldorf gegen 1-2Z in Köln.	81	40231	\N	51.2135	6.83024	\N
33438544	https://www.wohnungsboerse.net/immodetail/33438544	47	2	Modernisierte 2-Raum-Erdgeschosswohnung in Düsseldorf	98	40599	\N	51.1825	6.8657	\N
33438593	https://www.wohnungsboerse.net/immodetail/33438593	37	1	Schönes kleines Apartment mit Süd- Balkon u. Einbauküche	98	40599	Hoxbachstr.	51.1765	6.87222	\N
33438599	https://www.wohnungsboerse.net/immodetail/33438599	94	3	schicke 3-Zimmer-Wohnung mit Balkon und Einbauküche in Düsseldorf	44	40547	\N	51.2419	6.74772	1967
33438640	https://www.wohnungsboerse.net/immodetail/33438640	67	3	Sonnige, möblierte 3-Zimmer Wohnung mit Balkon in bester Wohnlage	83	40627	\N	51.2024	6.88388	\N
33438704	https://www.wohnungsboerse.net/immodetail/33438704	53	1.5	Luxus Neubau 2-Zimmer-Apartment mit Balkon & Moderne Einbauküche in Düsseldorf Golzheim	16	40476	Roßstraße	51.2503	6.77416	2023
33438709	https://www.wohnungsboerse.net/immodetail/33438709	55.61	2	Renovierte 2-Zimmer-Wohnung mit Balkon  in Düsseldorf-Urdenbach	96	40593	Hochstraße	51.1466	6.86943	\N
33438922	https://www.wohnungsboerse.net/immodetail/33438922	74	2	Helle 2-Zimmer-Wohnung mit Aussicht ins Grüne	82	40229	\N	51.1968	6.84602	\N
33439057	https://www.wohnungsboerse.net/immodetail/33439057	78.61	3	3-Zimmer-Wohnung in Düsseldorf-Lörick auf der 12. Etage	43	40547	Niederkasseler	51.2415	6.7346	\N
33439063	https://www.wohnungsboerse.net/immodetail/33439063	69	2	Niederkassel: Lichtdurchflutet | Inkl. Einbauküche + hochwertige Ausstattung!	44	40547	\N	51.2419	6.74772	\N
33439064	https://www.wohnungsboerse.net/immodetail/33439064	78.75	3	3-Zimmer-Wohnung in Düsseldorf-Lörick	43	40547	Niederkasseler	51.2415	6.7346	2022
33439071	https://www.wohnungsboerse.net/immodetail/33439071	68.73	2	ACHTUNG - Einkommensgrenzen beachten, Nettoeinkommen angeben, da mietpreisgedämpfte 2-Zimmer Wohnung	43	40547	Niederkasseler	51.2415	6.7346	2022
33439092	https://www.wohnungsboerse.net/immodetail/33439092	109.2	4	Helle 4-Zimmer-Dachgeschosswohnung mit sep. Küche und 2 Balkonen inkl. Stellplatz in D-Unterrath	62	40468	Kalkumer	51.2651	6.77534	\N
33439120	https://www.wohnungsboerse.net/immodetail/33439120	80	4	Attraktive 4-Zimmer-Wohnung mit Einbauküche in Düsseldorf	93	40589	Henkelstraße	51.1754	6.83515	\N
33439144	https://www.wohnungsboerse.net/immodetail/33439144	49	2	Geschmackvolle Dachgeschosswohnung mit zwei Räumen und EBK in Düsseldorf	31	40215	Zimmerstrasse	51.2105	6.78158	\N
33439198	https://www.wohnungsboerse.net/immodetail/33439198	162	4	Zooviertel - Rarität: sehr helle und großzügige 4-Zimmer-Wohnung	23	40237	Graf-Recke-Str.	51.2402	6.80785	\N
33440276	https://www.wohnungsboerse.net/immodetail/33440276	85	3	Wunderschöne 3-Zimmer Wohnung in Düsseldorf Unterrath	62	40468	\N	51.2612	6.7789	\N
33440312	https://www.wohnungsboerse.net/immodetail/33440312	66	2	2 Zimmer Wohnung voll möbiliert mit EBK & Balkon	14	40479	Feldstraße	51.2341	6.78025	\N
33440362	https://www.wohnungsboerse.net/immodetail/33440362	50	2	Helle Dachgeschosswohnung in Düsseldorf Flehe	38	40223	\N	51.1998	6.77225	\N
33440620	https://www.wohnungsboerse.net/immodetail/33440620	65	3	Tauschwohnung: Ich biete 3 Zimmer gegen 1,5 oder 2 Zimmer in Düsseldorf an.	36	40225	\N	51.1974	6.78988	\N
33440678	https://www.wohnungsboerse.net/immodetail/33440678	50	2	Tauschwohnung: Suche 3 Zimmer /biete 2 ZimmerWohnung saniert mit Balkon	62	40468	\N	51.2612	6.7789	\N
33440721	https://www.wohnungsboerse.net/immodetail/33440721	86	3	Traumhafte 3-Zimmer-Wohnung in Düsseldorf	41	40545	\N	51.2284	6.75437	\N
33440750	https://www.wohnungsboerse.net/immodetail/33440750	53	2	BLUMENVIERTEL: Erstbezug nach Sanierung: stilvolle 2-Zimmer-Whg.	51	40474	Hortensienstr.	51.2621	6.75127	\N
33440756	https://www.wohnungsboerse.net/immodetail/33440756	92	2	BLUMENVIERTEL: Erstbezug nach Sanierung: geräumige 2-Zimmer-Whg.	51	40474	Hortensienstr.	51.2621	6.75127	1949
33440758	https://www.wohnungsboerse.net/immodetail/33440758	59.37	2	Attraktive 2 Zimmer Terrassenwohnung mit Concierge und Fitness in D. - Heerdt	42	40549	Heinrich	51.2377	6.72973	\N
33440863	https://www.wohnungsboerse.net/immodetail/33440863	71	2.5	Helle 2,5-Raum-Wohnung mit wunderschönem Weitblick in Düsseldorf	64	40470	Wilhelm-Raabe-Straße	51.2519	6.82012	\N
33441897	https://www.wohnungsboerse.net/immodetail/33441897	88	3	3-Zimmer-Wohnung mit Balkon in Düsseldorf-Düsseltal	23	40239	Mulvanystraße	51.2467	6.79596	\N
33443692	https://www.wohnungsboerse.net/immodetail/33443692	55	2	TAUSCHANGEBOT 2 zimmerwohnung 55 sq	37	40227	Oberbilker	51.2111	6.79198	\N
33443714	https://www.wohnungsboerse.net/immodetail/33443714	185.83	6	Vielseitige 6 Raum-Altbauwohnung mit viel Flair in begehrter Wohnlage von D-Bilk!	36	40223	Merkurstraße	51.2018	6.76797	1911
33443851	https://www.wohnungsboerse.net/immodetail/33443851	36	1	Großzügige 1ZW mit Balkon am schönen Lessingplatz	37	40227	\N	51.2154	6.79757	\N
33443881	https://www.wohnungsboerse.net/immodetail/33443881	66	2	Gemütliche 2 Zimmer Wohnung in Oberkassel	41	40549	Schanzenstraße	51.232	6.74308	\N
33443891	https://www.wohnungsboerse.net/immodetail/33443891	77.6	2	Gartenstadt Reitzenstein: Moderne 2 Zimmer-Wohnung Nähe Grafenberger Wald!	72	40470	\N	51.2569	6.80771	\N
33443895	https://www.wohnungsboerse.net/immodetail/33443895	72	3	Erstbezug: Sanierte 2,5 Zimmer Wohnung 1. OG Flingern Nord WG-geeignet	22	40233	Birkenstraße	51.2269	6.81115	1951
33444000	https://www.wohnungsboerse.net/immodetail/33444000	38	1	Tauschwohnung: Tausche 1-Zimmer Wohnung gegen 2-Zimmer Wohnung! :)	13	40211	\N	51.2301	6.79288	\N
33444151	https://www.wohnungsboerse.net/immodetail/33444151	45	2	Tauschwohnung: Suche schönes Zuhause in Münster, biete tolle Wohnung in DUS	15	40476	\N	51.248	6.77902	\N
33444179	https://www.wohnungsboerse.net/immodetail/33444179	63	3	Komplett möblierte 3 Zi.-Wohnung in bevorzugter Wohnlage von Düsseldorf-Angermund	55	40489	\N	51.3305	6.76259	\N
33444203	https://www.wohnungsboerse.net/immodetail/33444203	160	4	Erstbezug nach Sanierung - 4 Zimmer Dachgeschoss Wohnung über den Dächern vom Medienhafen	32	40219	Erftstraße	51.214	6.7561	\N
33444249	https://www.wohnungsboerse.net/immodetail/33444249	52	2	möblierte 2 Zimmerwohnung mit Balkon in Düsseltal  zu vermieten.	23	40237	\N	51.2357	6.80917	\N
33444302	https://www.wohnungsboerse.net/immodetail/33444302	49	2	Schöne 2-Zimmer-Wohnung in zentraler Lage	15	40476	Frankenstr.	51.2503	6.78134	\N
33444305	https://www.wohnungsboerse.net/immodetail/33444305	28.96	1	Helles Appartement in Flingern direkt vom Eigentümer	21	40233	Langerstraße	51.2249	6.80527	\N
33444315	https://www.wohnungsboerse.net/immodetail/33444315	107	3	Geschmackvolle und geräumige Wohnung mit drei Zimmern sowie Balkon und Einbauküche in Düsseldorf	41	40547	\N	51.2419	6.74772	\N
33444397	https://www.wohnungsboerse.net/immodetail/33444397	60	2	-OFFENE WOHNKÜCHE, -BALKON- -	37	40227	Arminstraße	51.2134	6.79091	\N
33444495	https://www.wohnungsboerse.net/immodetail/33444495	80	3	Gut geschnittene 3-Zimmer-Wohnung in Düsseldorf-Mörsenbroich	64	40470	Münsterstr.	51.2536	6.80223	\N
33445534	https://www.wohnungsboerse.net/immodetail/33445534	56.3	2	Exklusive, vollständig renovierte 2-Zimmer-Wohnung mit Balkon und EBK in Düsseldorf	23	40237	Schumannstrasse	51.2353	6.80619	\N
33445551	https://www.wohnungsboerse.net/immodetail/33445551	117	4	Lichtdurchflutete, gut geschnittene Wohnung incl. Einbauküche und 45qm großer Terrasse	95	40593	\N	51.1403	6.86854	\N
33445566	https://www.wohnungsboerse.net/immodetail/33445566	54	2.5	Kronprinzenstraße 402, 40217 Düsseldorf	32	40217	Kronprinzenstraße	51.2126	6.77004	\N
33445581	https://www.wohnungsboerse.net/immodetail/33445581	80	2	Masuku	61	40472	\N	51.2685	6.83379	\N
33445674	https://www.wohnungsboerse.net/immodetail/33445674	123	4	Tauschwohnung: Schöne 4 Zimmerwohnung mit Garten, suche 3 Zimmer mit Balkon	36	40221	\N	51.1997	6.75072	\N
33445704	https://www.wohnungsboerse.net/immodetail/33445704	89	3	Charmante 3 Zimmer Wohnung mit Einbauküche und großem Balkon in Düsseldorf- Grafental!	22	40235	\N	51.2294	6.82752	\N
33445814	https://www.wohnungsboerse.net/immodetail/33445814	66	3	GEMÜTLICHE 3 ZIMMER WOHNUNG IN SCHÖNER LAGE VON VENNHAUSEN MIT GROßEM BALKON	83	40627	Am	51.2067	6.85791	\N
33445819	https://www.wohnungsboerse.net/immodetail/33445819	110.39	3	Hübsche 3 Zimmerwohnung mit großer Terrasse	11	40213	\N	51.2221	6.77271	\N
33445857	https://www.wohnungsboerse.net/immodetail/33445857	134.77	3	Hübsche 3 Zimmerwohnung mit großer Galerie	11	40213	Altestadt	51.2286	6.77201	\N
33445882	https://www.wohnungsboerse.net/immodetail/33445882	62	3	Tauschwohnung: Schöne 3-Zimmer-Whg gegen kleinere Whg  in Ludenberg	21	40233	\N	51.2198	6.8119	\N
33446006	https://www.wohnungsboerse.net/immodetail/33446006	120	3	Tauschwohnung: Tausche Top-Altbau-Wohnung gegen ähnliches in kleiner	23	40239	\N	51.2453	6.80322	\N
33446074	https://www.wohnungsboerse.net/immodetail/33446074	54.89	1	Charmantes Apartment in ruhiger Innenhoflage mit EBK, großem Balkon zwischen Rhein und KÖ	11	40213	\N	51.2221	6.77271	\N
33446081	https://www.wohnungsboerse.net/immodetail/33446081	34	2	47114/33 Moderne 2 Zimmer-Wohnung in Flingern	21	40233	Mettmanner	51.2243	6.80288	\N
33446138	https://www.wohnungsboerse.net/immodetail/33446138	145	3	Schöne individuelle Maisonette mit zwei Terrassen u. Gartennutzung, direkt a. Unterbacher See	84	40627	Vennstraße	51.1988	6.89861	\N
33446187	https://www.wohnungsboerse.net/immodetail/33446187	55.93	2	** Moderne 2-Zimmer Wohnung mit EBK und Balkon **	15	40476	Rather	51.2548	6.78557	\N
33446194	https://www.wohnungsboerse.net/immodetail/33446194	66.27	2	Derendorf - attraktive Altbauwohnung in gründerzeitlicher Wohnanlage	15	40476	Tannenstr.	51.2513	6.77866	\N
33446197	https://www.wohnungsboerse.net/immodetail/33446197	42	1	1-Zimmer-Whg. mit Einbauküche, Balkon, Aufzug u. Stellplatz	41	40545	Wettiner	51.2342	6.74876	\N
33446220	https://www.wohnungsboerse.net/immodetail/33446220	145	3.5	Erstbezug! Sanierte Dachgeschosswohnung im Medienhafen per sofort zu vermieten	32	40219	Erftstr	51.214	6.7561	\N
33446276	https://www.wohnungsboerse.net/immodetail/33446276	84	2.5	Einlieger Wohnung mit separatem Eingang und Stellplatz	84	40627	\N	51.2024	6.88388	\N
33448450	https://www.wohnungsboerse.net/immodetail/33448450	48.3	2	Exklusive 2-Zimmer-DG-Wohnung mit EBK in Düsseldorf	36	40221	Uedesheimer	51.1977	6.76257	\N
33448480	https://www.wohnungsboerse.net/immodetail/33448480	125	3	Geräumige 3-Zimmer-Maisonette-Wohnung mit gehobener Innenausstattung zur Miete in Düsseldorf	51	40474	Niederrheinstraße	51.2677	6.7493	1968
33448579	https://www.wohnungsboerse.net/immodetail/33448579	50	2	Stilvolle, sanierte 2-Zimmer-Altbauwohnung in Düsseldorf-Oberbilk	37	40227	\N	51.2154	6.79757	\N
33448627	https://www.wohnungsboerse.net/immodetail/33448627	126	3	Großzügiges Wohnen in exklusiver Düsseldorfer Lage!	32	40219	\N	51.2135	6.76234	\N
33448659	https://www.wohnungsboerse.net/immodetail/33448659	41.5	1	Gemütlich 1-Zimmer-Wohnung mit Einbauküche und Balkon	15	40476	Collenbachstr.	51.2445	6.78329	\N
33448755	https://www.wohnungsboerse.net/immodetail/33448755	64.4	2	Erdgeschosswohnung mit Einbauküche und Terrasse!	21	40233	Erkrather	51.2216	6.80746	\N
33448858	https://www.wohnungsboerse.net/immodetail/33448858	90	4	1.220 Kaltmiete €, 90 m², 4 Zimmer, EG mit Terrasse, Einbauküche	101	40595	Prenzlauer	51.1508	6.89695	\N
33448869	https://www.wohnungsboerse.net/immodetail/33448869	31	1	Vor kurzem saniert: ruhig, zentral und provisionsfrei mit Balkon	13	40211	Gerresheimer	51.2271	6.7958	\N
33448875	https://www.wohnungsboerse.net/immodetail/33448875	42	1	Tauschwohnung: Kernsarnierte Wohnung gegen min 1,5 Zimmerwohnung	14	40477	\N	51.2385	6.78498	\N
33448909	https://www.wohnungsboerse.net/immodetail/33448909	75.28	3.5	3-Zimmer-Wohnung in Düsseldorf Garath zum 01.12.23 wird renoviert	101	40595	Adam-Stegerwald-Straße	51.1432	6.90546	\N
33448923	https://www.wohnungsboerse.net/immodetail/33448923	79	2	Tauschwohnung: Wunderschöne Wohnung in Kaiserswerth	53	40489	\N	51.3305	6.76259	\N
33449117	https://www.wohnungsboerse.net/immodetail/33449117	55	2	Pracht Immobilien- Schöne, möblierte 2 Zimmerwohnung im Herzen der Stadt	13	40210	\N	51.2225	6.78772	1956
33449686	https://www.wohnungsboerse.net/immodetail/33449686	64	2	Helle und stilvolle 2-Zimmer-Wohnung in Unterbilk	32	40219	Konkordiastraße	51.2153	6.76897	\N
33449689	https://www.wohnungsboerse.net/immodetail/33449689	138	2	+++ INDIVIDUALISTEN AUFGEPASST - MAISONETTE TRAUM IN KAISERSWERTH +++	53	40489	Kaiserswerther	51.3015	6.73716	2015
33449714	https://www.wohnungsboerse.net/immodetail/33449714	85	3	Schöne 3 Zimmer Wohnung in den Bilker Höfen	36	40223	\N	51.1998	6.77225	\N
33449731	https://www.wohnungsboerse.net/immodetail/33449731	93	3	Attraktive Erdgeschosswohnung in unmittelbarer Schlossparknähe zu vermieten	95	40593	\N	51.1403	6.86854	\N
33449733	https://www.wohnungsboerse.net/immodetail/33449733	43	1.5	Zentrale und helle 1,5 Zimmer Wohnung - Mieter für 7 Monate gesucht	13	40211	\N	51.2301	6.79288	\N
33449753	https://www.wohnungsboerse.net/immodetail/33449753	33.7	1	Wohnung mit einem Raum und Einbauküche in Düsseldorf	23	40237	Herderstraße	51.2376	6.80167	\N
33449758	https://www.wohnungsboerse.net/immodetail/33449758	59	2	Traumhafte 2-Zimmerwohnung im Herzen von Gerresheim! Befristet bis Dezember 2024	71	40625	Steinweg	51.2356	6.86334	\N
33449785	https://www.wohnungsboerse.net/immodetail/33449785	51	1.5	Tauschwohnung: Moderne Altbauwohnung mit perfektem Schnitt und Balkon	31	40215	\N	51.2149	6.78256	\N
33449817	https://www.wohnungsboerse.net/immodetail/33449817	82	2	Wunderschöne 2-Zimmer-Wohnung in Düsseldorf	73	40629	Am	51.2453	6.85029	2009
33449855	https://www.wohnungsboerse.net/immodetail/33449855	65	2	Einziehen und Wohlfühlen Löffelfertige 2 Zimmer Wohnung mit Loft Charakter ab 01.12	16	40476	Roßstraße	51.2516	6.77275	\N
33449897	https://www.wohnungsboerse.net/immodetail/33449897	94.22	3	Moderne 3-Zimmer-Wohnung mit Erdwärmepumpe, EEK A+, Bad, Gäste-WC, Balkon, zu vermieten	38	40223	Fleher	51.1953	6.76926	\N
33449936	https://www.wohnungsboerse.net/immodetail/33449936	100	3	Tauschwohnung: Weitläufige 3-Zimmer Altbau-Wohnung mit Terrasse	13	40211	\N	51.2301	6.79288	\N
33449976	https://www.wohnungsboerse.net/immodetail/33449976	60	2	Rarität! Möbliertes Wohnen auf einem idyllischen Hof in Rheinnähe!	44	40547	Alt-Niederkassel	51.2414	6.75197	\N
33450001	https://www.wohnungsboerse.net/immodetail/33450001	30	1	Hochwertiges - möbliertes Appartement im Zentrum - in ruhiger Lage °°5 Min zur Kö°° zu vermieten!!	31	40210	Graf-Adolf-Str.	51.2187	6.78516	\N
33450063	https://www.wohnungsboerse.net/immodetail/33450063	97.09	3	Wunderschöne 3-Zimmer-Wohnung in Düsseldorf	73	40629	Am	51.2453	6.85029	2009
33450096	https://www.wohnungsboerse.net/immodetail/33450096	85	3	Tauschwohnung: Wunderschöne Altbauwohnung mit Balkon in Flingern-Nord	22	40235	\N	51.2294	6.82752	\N
33450133	https://www.wohnungsboerse.net/immodetail/33450133	55	2	Barrierefreie Wohnungen in Düsseldorf-Gerresheim	71	40625	Hagener	51.2252	6.87179	\N
33450160	https://www.wohnungsboerse.net/immodetail/33450160	100	3	Wunderschöne 3-Zimmer-Wohnung in Düsseldorf	73	40629	Am	51.2454	6.85118	\N
33450214	https://www.wohnungsboerse.net/immodetail/33450214	97	2.5	Tauschwohnung: Große Whg. mit Kamin und Dachterrasse gegen Whg. in Köln	31	40215	\N	51.2149	6.78256	\N
33450271	https://www.wohnungsboerse.net/immodetail/33450271	32	1	Schickes Apartment mit viel Licht und Balkon in Düsseldorf	82	40229	Gertrudisplatz	51.2011	6.83849	2020
33450314	https://www.wohnungsboerse.net/immodetail/33450314	48	2	Gut geschnittene 2-Zimmer-Wohnung. in Flingern- Nord	22	40233	Wülfrather-Str.	51.2273	6.80278	\N
33450401	https://www.wohnungsboerse.net/immodetail/33450401	25	1	*City Apartment* 1 Zimmer-Apartment Möbliert inkl. W-Lan & TV	31	40215	Mintropstr.	51.2179	6.78965	\N
33450424	https://www.wohnungsboerse.net/immodetail/33450424	51	2.5	Großzügige & helle 2,5 Zimmer-Wohnung in GE-Feldmark!	56	45883	Boniverstr.	51.5108	7.07877	\N
33451533	https://www.wohnungsboerse.net/immodetail/33451533	92.72	3	**NOCH VERMIETET**Helle 3-Zimmer-Wohnung mit EBK und Balkon in D-Oberbilk**	37	40227	Schmiedestr.	51.2105	6.8044	\N
33451563	https://www.wohnungsboerse.net/immodetail/33451563	107	3.5	Exklusive 3,5-Zimmer-Penthouse-Wohnung auf 107 qm mit hochwertiger Ausstattung im Düsseldo	98	40599	Zoppoter	51.1738	6.87157	1961
33451638	https://www.wohnungsboerse.net/immodetail/33451638	30	1	1A Lage // Komplett Möbliert // Einbauküche // Oberkassel // Waschmaschine // Modern	41	40547	Hansaallee	51.2354	6.74287	\N
33451641	https://www.wohnungsboerse.net/immodetail/33451641	55	2	In Düsseldorf: Gepflegte Wohnung mit zwei Zimmern und Balkon	64	40470	Münsterstr.	51.2525	6.80232	\N
33451648	https://www.wohnungsboerse.net/immodetail/33451648	42	2	Premium Zweizimmerwohnung in Düsseldorf Bilk	36	40223	\N	51.1998	6.77225	\N
33451656	https://www.wohnungsboerse.net/immodetail/33451656	49	2	1A Lage // Urban baby // 2 Zimmer //Balkon // Einbauküche // Abstellraum // Waschmaschine	31	40215	Pionierstr.	51.2163	6.78535	\N
33451694	https://www.wohnungsboerse.net/immodetail/33451694	50	1.5	Tauschwohnung: Zentrale Lage Düsseldorf gegen Stuttgart	31	40215	\N	51.2149	6.78256	\N
33451780	https://www.wohnungsboerse.net/immodetail/33451780	116	3	HELLE 3-ZIMMER WOHNUNG MIT SEPARATEM BÜRO - IDEAL FÜR HOMEOFFICE	23	40237	\N	51.2357	6.80917	1956
33451817	https://www.wohnungsboerse.net/immodetail/33451817	30	1	Dachgeschoß Appartment, D-Süd, 750€ Warmmiete	37	40229	Offenbacher	51.205	6.82121	\N
33451892	https://www.wohnungsboerse.net/immodetail/33451892	75	2	Tauschwohnung: Neu sanierte Wochnung mit hohe Decken und schönem Stuck	64	40470	\N	51.2569	6.80771	\N
33451950	https://www.wohnungsboerse.net/immodetail/33451950	31.69	1	Modernes Apartment mit Aufzug in Düsseldorf Garath	101	40595	Emil-Barth-Str.	51.1429	6.89684	\N
33451956	https://www.wohnungsboerse.net/immodetail/33451956	59.99	2	Modernisierte 2-Zi.-Wohnnug in DÜ-Lörick mit Balkon!	43	40547	Grevenbroicher	51.2412	6.72742	\N
33451972	https://www.wohnungsboerse.net/immodetail/33451972	185	4	+++Exklusiv möbliertes Luxus-Penthouse mit Dachterrasse+++	14	40479	Prinz-Georg-Str.	51.2332	6.78757	1960
33452107	https://www.wohnungsboerse.net/immodetail/33452107	74	3.5	Tauschwohnung: Schöner Neubau mitten in Düsseldorf	37	40227	\N	51.2154	6.79757	\N
33452188	https://www.wohnungsboerse.net/immodetail/33452188	95	2	Großzügige Zwei-Raum-Wohnung mit sonnigem Balkon	64	40470	Mörsenbroicher	51.2503	6.8184	\N
33452256	https://www.wohnungsboerse.net/immodetail/33452256	77	3	Top geschnittene  und sanierte 3-Zimmer-Whg mit Balkon	22	40235	Rosmarinstraße	51.2276	6.82354	\N
33452273	https://www.wohnungsboerse.net/immodetail/33452273	90	3	Wunderschöne Wohnung mit "LOFT-Charakter", ab sofort frei	96	40593	\N	51.1403	6.86854	\N
33452349	https://www.wohnungsboerse.net/immodetail/33452349	143.1	3	Exklusive Maisonette Wohnung 3 Zi. +Atelieraum +Balkon +Dachterrasse	92	51503	Bergische	50.9235	7.19729	2019
33452384	https://www.wohnungsboerse.net/immodetail/33452384	135	4	Exklusive, modernisierte 4-Zimmer-Wohnung mit Balkon und Einbauküche in Düsseldorf	22	40237	Grafenberger	51.2301	6.80073	\N
33454817	https://www.wohnungsboerse.net/immodetail/33454817	31	1	Gemütliches Studio Apartment in Flingern!	22	40235	Fortunastr.	51.227	6.81295	\N
33454883	https://www.wohnungsboerse.net/immodetail/33454883	73	2	Ruhige Wohnung im 1. Obergeschoss	56	51399	Jahnstrasse	51.0842	7.10477	1937
33454951	https://www.wohnungsboerse.net/immodetail/33454951	58	2	Tauschwohnung: Suche 2 Zimmer in Berlin - biete 2-Zimmer  in Flingern Nord	22	40235	\N	51.2294	6.82752	\N
33454997	https://www.wohnungsboerse.net/immodetail/33454997	89.25	3	Gartenwohnung mit Einbauküche ISD Nähe	53	40489	\N	51.3305	6.76259	1970
33455038	https://www.wohnungsboerse.net/immodetail/33455038	49	2	Vollmöblierte 2-Zimmerwohnung im Oberbilk/Düsseldorf	37	40227	\N	51.2154	6.79757	\N
33455159	https://www.wohnungsboerse.net/immodetail/33455159	75	2	Tauschwohnung: Heller Altbau Unterbilk mit Erker	32	40219	\N	51.2135	6.76234	\N
33455178	https://www.wohnungsboerse.net/immodetail/33455178	136.55	3	Außergewöhnliche 3-Zimmer Luxus-Wohnung.\nExklusives Wohnen im sanierten Denkmal.	11	40213	Lambertusstrasse	51.2278	6.77271	2016
33455190	https://www.wohnungsboerse.net/immodetail/33455190	57	2	2-Zimmer-Wohnung in Düsseldorf - Pempelfort mit Terrasse und Einbauküche	13	40211	\N	51.2301	6.79288	\N
33455197	https://www.wohnungsboerse.net/immodetail/33455197	100	2	Wunderschöne 2-Zimmer-Wohnung in Düsseldorf	73	40629	Am	51.2453	6.85029	2009
33455222	https://www.wohnungsboerse.net/immodetail/33455222	74	2	Neubau – im Altbau – riesige Terasse – schickes Denkmal-Haus, stilvolle, geräumige DG-Whng.	32	40227	Kronprinzenstr.	51.21	6.76973	\N
33455256	https://www.wohnungsboerse.net/immodetail/33455256	33	1	Tauschwohnung: Zentrale Düsseldorfer Wohnung mit Schlafzimmer und Wohnküche	31	40215	\N	51.2149	6.78256	\N
33455338	https://www.wohnungsboerse.net/immodetail/33455338	48	2	Düsseldorf- Himmelgeist Neubau, 2 Zimmer Wohnung	92	40589	\N	51.1641	6.82144	2016
33455367	https://www.wohnungsboerse.net/immodetail/33455367	80	3	Fürstenwall: in guter Nachbarschaft, schöne 3-Zimmerwohnung	31	40215	\N	51.2149	6.78256	\N
33455421	https://www.wohnungsboerse.net/immodetail/33455421	53	2	Traum 2-Zimmer Wohnung in Essen - TOP Renoviert und ruhige Lage - ab sofort!	97	45355	Wolfsbankstrasse	51.4765	6.95735	1967
33455542	https://www.wohnungsboerse.net/immodetail/33455542	117	3	Schöne Altbauwohnung in Düsseldorf-Düsseltal zu vermieten	23	40239	\N	51.2453	6.80322	\N
33455562	https://www.wohnungsboerse.net/immodetail/33455562	51	1.5	Schön geschnittenes 2-Zimmer Appartement mit Balkon	15	40476	Yorckstr.	51.2443	6.7927	\N
33455583	https://www.wohnungsboerse.net/immodetail/33455583	47	2	Voll möbliert! 2-Zimmer-Luxuswohnung in Düsseldorf-Hafen	32	40219	Gladbacher	51.2121	6.75599	1951
33455584	https://www.wohnungsboerse.net/immodetail/33455584	42	1	Sehr helle, ruhige  1-Zimmer-Wohnung mit Balkon, Einbauküche und Blick ins Grüne	41	40549	Drususstraße	51.2326	6.73723	\N
33455594	https://www.wohnungsboerse.net/immodetail/33455594	120	3	SANIERTES DACHGESCHOSS MIT KAMIN- IM REPRÄSENTATIVEN HAUS -UND GROßER SÜDTERRASSE	23	40239	Grunerstraße	51.2436	6.79892	1930
33457496	https://www.wohnungsboerse.net/immodetail/33457496	44	2	Tauschwohnung: Singlewohnung zum Tausch in Bilk	36	40223	\N	51.1998	6.77225	\N
33457517	https://www.wohnungsboerse.net/immodetail/33457517	59.59	2	Schöne Wohnung sucht neue Bewohner: 2-Zimmer-Wohnung mit tollem Balkon	61	40472	Volkardeyer	51.2821	6.79668	1995
33457528	https://www.wohnungsboerse.net/immodetail/33457528	72.05	2	Super schöne 2-Zimmer-Wohnung mit modernem Badezimmer und Balkon (dieser wird aktuell saniert)	63	40472	Westfalenstr.	51.2629	6.81637	\N
33457539	https://www.wohnungsboerse.net/immodetail/33457539	72.31	3	Ihr neues Zuhause: frisch renovierte 3-Zimmer-Wohnung mit neuem Badezimmer und Garten	62	40472	Mintarder	51.2778	6.79256	\N
33457567	https://www.wohnungsboerse.net/immodetail/33457567	65	2	Tauschwohnung: Helle moderne Zweizimmerwohnung mit großem Südbalkon	15	40476	\N	51.248	6.77902	\N
33457672	https://www.wohnungsboerse.net/immodetail/33457672	30	1	Tauschwohnung: Tausche zentrale 1 Zimmer Wohnung in Friedrichstadt gegen	31	40215	\N	51.2149	6.78256	\N
33457708	https://www.wohnungsboerse.net/immodetail/33457708	68	2	Tauschwohnung: Wunderschöne Altbauwohnung Flingern	22	40235	\N	51.2294	6.82752	\N
33457745	https://www.wohnungsboerse.net/immodetail/33457745	36	1	Geräumige 1-Zimmer-Wohnung in Pempelfort	14	40477	\N	51.2385	6.78498	\N
33457765	https://www.wohnungsboerse.net/immodetail/33457765	67	2	Tauschwohnung: Tausche wunderschöne 2-Z-Whg mit in Düsseltal gegen größere	23	40239	\N	51.2453	6.80322	\N
33457971	https://www.wohnungsboerse.net/immodetail/33457971	55	2	PROVISIONFREI! Wunderschöne 2-Zimmer Wohnung in Penpelfort	14	40211	Schinkel	51.2333	6.79345	\N
33458707	https://www.wohnungsboerse.net/immodetail/33458707	35	1	**ANFRAGESTOPP**Super Studenten-Wohnung	13	40210	\N	51.2225	6.78772	\N
33458709	https://www.wohnungsboerse.net/immodetail/33458709	44	2	Exklusive 2-Zimmer-Wohnung mit Einbauküche in Düsseldorf	14	40477	Kaiserstraße	51.2376	6.77754	\N
33458727	https://www.wohnungsboerse.net/immodetail/33458727	42	1.5	Tauschwohnung: gemütliche Wohnung nähe Hbf gegen Kölner Wohnung	37	40227	\N	51.2154	6.79757	\N
33458750	https://www.wohnungsboerse.net/immodetail/33458750	86	3	Modernisierte grosse Wohnung in guter, ruhiger Wohnlage Werstens	91	40589	Am	51.1805	6.82267	\N
33458773	https://www.wohnungsboerse.net/immodetail/33458773	61	2	Tauschwohnung: Zwei Zimmer Wohnung mit Aussicht	91	40589	\N	51.1641	6.82144	\N
33458812	https://www.wohnungsboerse.net/immodetail/33458812	36	1.5	Tauschwohnung: Schöne 1,5 Zimmer Wohnung in Pempelfort	14	40479	\N	51.2333	6.78371	\N
33458840	https://www.wohnungsboerse.net/immodetail/33458840	30	1	Tauschwohnung: Wunderschöne Wohnung im Herzen Düsseldorfs abzugeben!	11	40213	\N	51.2221	6.77271	\N
33458867	https://www.wohnungsboerse.net/immodetail/33458867	37	1	Gepflegte möblierte 1-Zimmer-Wohnung zu vermieten	31	40215	Adersstraße	51.2177	6.78776	1954
33458968	https://www.wohnungsboerse.net/immodetail/33458968	119	3	3-Zimmer-DG-Wohnung in ruhiger Seitenstraße im Uhlenhorst	56	45479	Wallfriedsweg	51.4106	6.85237	\N
33459640	https://www.wohnungsboerse.net/immodetail/33459640	67	2	Wunderschöne Altbauwohnung in Düsseldorf Bilk zur Zwischenmiete	31	40215	Kirchfeldstraße	51.2123	6.77894	\N
33459663	https://www.wohnungsboerse.net/immodetail/33459663	47	2	Schöne 2-Raum-Wohnung in Düsseldorf-Bachstraße mit Einbauküche	32	40217	Bachstraße	51.2084	6.76964	\N
33459667	https://www.wohnungsboerse.net/immodetail/33459667	65	2	2 Zi. Wohnung Neubau in Düsseldorf-Bilk	36	40223	Gogrevestraße	51.2079	6.78452	\N
33459669	https://www.wohnungsboerse.net/immodetail/33459669	85	3	Stilvolle, geräumige und vollständig renovierte 3-Zimmer-Wohnung mit Balkon in Düsseldorf	34	40221	Hinter	51.2012	6.73848	\N
33459707	https://www.wohnungsboerse.net/immodetail/33459707	56	2	Tauschwohnung: Lichtdurchflutete 2 Z.-Wohnung gegen min. 3-Z. in Düsseldorf	51	40474	\N	51.2738	6.74219	\N
33459763	https://www.wohnungsboerse.net/immodetail/33459763	30	2	Tauschwohnung: Suche Münster, biete Düsseldorf DG mit EBK	37	40227	\N	51.2154	6.79757	\N
33459798	https://www.wohnungsboerse.net/immodetail/33459798	78	2	Großzügige helle 2 Zimmer mit Balkon	36	40225	\N	51.1974	6.78988	1978
33459819	https://www.wohnungsboerse.net/immodetail/33459819	50	2	Tauschwohnung:  Düsseldorf Altbau gegen Köln	36	40223	\N	51.1998	6.77225	\N
33460382	https://www.wohnungsboerse.net/immodetail/33460382	174	4	Nachmieter für DG-Maisonette-Wohnung mit Terrasse im Düsseldorfer Hafen gesucht	32	40219	\N	51.2135	6.76234	\N
33460413	https://www.wohnungsboerse.net/immodetail/33460413	50	2	Stilvolle 2-Zimmer-Wohnung mit eigener Sonnenterrasse voll möbliert	23	40237	Herderstraße	51.2343	6.79839	\N
33460420	https://www.wohnungsboerse.net/immodetail/33460420	45	2	Voll möbliert: wunderschöne, helle Wohnung im Zentrum und trotzdem ruhig gelegen	31	40215	Corneliusstr.	51.2129	6.78234	\N
33460438	https://www.wohnungsboerse.net/immodetail/33460438	28	2	Gemütliche Wohnung in Top-Lage mit bester Anbindung!	36	40223	\N	51.1998	6.77225	\N
33460461	https://www.wohnungsboerse.net/immodetail/33460461	35	1.5	Modernisierte 1,5-Raum-Wohnung mit Balkon und Einbauküche in Düsseldorf	36	40223	Max-Brandts-Straße	51.2021	6.76276	\N
33460477	https://www.wohnungsboerse.net/immodetail/33460477	75	2.5	Geschmackvolle 2,5-Raum-Wohnung mit 2 Balkonen/Loggien	41	40547	\N	51.2419	6.74772	\N
33460518	https://www.wohnungsboerse.net/immodetail/33460518	108	4	Perfekt geschnittene hochwertige ETW in Oberkassel	41	40547	\N	51.2419	6.74772	\N
33460587	https://www.wohnungsboerse.net/immodetail/33460587	52	2	Tauschwohnung: Suche 3 Zi mit Balkon zentral. , biete 2 Zi. in Unterbilk	32	40219	\N	51.2135	6.76234	\N
33460627	https://www.wohnungsboerse.net/immodetail/33460627	53	2	Tauschwohnung: Ich tausche schöne 2 Zimmerwohnung gegen 3 Zimmer	36	40225	\N	51.1974	6.78988	\N
33460724	https://www.wohnungsboerse.net/immodetail/33460724	64.67	2	Nachmieter gesucht - 2 Zimmer in Friedrichstadt	31	40215	\N	51.2149	6.78256	\N
33460742	https://www.wohnungsboerse.net/immodetail/33460742	65.4	2	Zentrale+Helle Wohnung in Little Tokyo	13	40210	Immermannstraße	51.2221	6.79051	\N
33461687	https://www.wohnungsboerse.net/immodetail/33461687	48	2	Geschmackvolle, teilmöblierte  Zwei-Raum-Wohnung mit Balkon und EBK in Flingern Nord	22	40235	Bruchstraße	51.2297	6.81498	\N
33461773	https://www.wohnungsboerse.net/immodetail/33461773	57	2	Tauschwohnung: 2-Zimmer Altbauwohnung in Flingern	22	40235	\N	51.2294	6.82752	\N
33461948	https://www.wohnungsboerse.net/immodetail/33461948	43	1	Freundliches, möbliertes Appartement in sehr guter Lage von Pempelfort	14	40211	\N	51.2301	6.79288	\N
33462038	https://www.wohnungsboerse.net/immodetail/33462038	70	3	Schöne 3-Zimmer-Wohnung mit Balkon und Einbauküche in Rheinnähe	16	40474	Meineckestraße	51.2557	6.7638	\N
33462603	https://www.wohnungsboerse.net/immodetail/33462603	90	3	Sonnige und zentrale  Drei-Zimmer-Wohnung mit Balkon u. Einbauküche in Düsseldorf	13	40210	Immermannstr.	51.2247	6.78528	\N
33462698	https://www.wohnungsboerse.net/immodetail/33462698	54	2	Velberter Straße 11, 40227 Düsseldorf	37	40227	Velberter	51.2181	6.80052	\N
33462779	https://www.wohnungsboerse.net/immodetail/33462779	103	3	IDEAL FÜR BEST AGER-PAARE - HOCHWERTIG SANIERTE 3-ZIMMER-MAISONETTE-WOHNUNG IN LÖRICK	43	40547	\N	51.2419	6.74772	1982
33462789	https://www.wohnungsboerse.net/immodetail/33462789	53	2.5	Tauschwohnung: Wohnung in Unterbilk mit Balkon und Keller	32	40217	\N	51.2127	6.7754	\N
33462887	https://www.wohnungsboerse.net/immodetail/33462887	121	3	Geschmackvolle und geräumige Penthouse-Whg mit drei Zimmern sowie Balkon und EBK in D'dorf	31	40215	\N	51.2149	6.78256	\N
33463327	https://www.wohnungsboerse.net/immodetail/33463327	55	2	Heyestraße 133, 40625 Düsseldorf	71	40625	Heyestraße	51.2242	6.86411	\N
33463341	https://www.wohnungsboerse.net/immodetail/33463341	60	2.5	Schöne  2,5-Zimmer-Dachgeschosswohnung mit Balkon nähe Uni	91	40589	\N	51.1641	6.82144	\N
33463349	https://www.wohnungsboerse.net/immodetail/33463349	51	2	Ich suche eine Nachmiete für diese 2-Raum-Wohnung mit Balkon und Einbauküche in Düsseldorf	94	40599	Paul-Thomas-Straße	51.1753	6.8534	\N
33463402	https://www.wohnungsboerse.net/immodetail/33463402	89	4	In Düsseldorf: Gepflegte Wohnung mit vier Zimmern und Balkon	63	40470	\N	51.2569	6.80771	\N
33463435	https://www.wohnungsboerse.net/immodetail/33463435	67	2	Stilvolle Altbauwohnung mitten in Flingern-Nord	22	40233	\N	51.2198	6.8119	\N
33463461	https://www.wohnungsboerse.net/immodetail/33463461	43	2	Exklusive 2-Zimmer-Wohnung mit EBK in Düsseldorf	15	40476	Bülowstraße	51.2445	6.79182	\N
33463476	https://www.wohnungsboerse.net/immodetail/33463476	120	5	Gepflegte 5-Zimmer-Wohnung mit Balkon und EBK in Düsseldorf	62	40468	Unterrather	51.2731	6.78039	1960
33463581	https://www.wohnungsboerse.net/immodetail/33463581	79	3	Tauschwohnung: 3 Zimmer Wohnung Oberbilk	37	40227	\N	51.2154	6.79757	\N
33463761	https://www.wohnungsboerse.net/immodetail/33463761	117	3	Schöne 3-Zimmer-Wohnung, mit Balkon und Garten in Recklinghausen	56	45661	Auguststr	51.5758	7.17316	\N
33463776	https://www.wohnungsboerse.net/immodetail/33463776	40	1	Stilvolle 1-Zimmer-Erdgeschosswohnung mit Einbauküche in Düsseldorf	37	40227	Lessingstraße	51.2152	6.79293	\N
33464197	https://www.wohnungsboerse.net/immodetail/33464197	86	2.5	Sonnige Maisonette zur Miete in erster Rheinlage	44	40547	\N	51.2419	6.74772	\N
33464272	https://www.wohnungsboerse.net/immodetail/33464272	64	2	Stilvolle, neuwertige 2-Zimmer-Wohnung mit Balkon & Tiefgarage der Karolinger Höfe, Düsseldorf-Bilk	36	40223	\N	51.1998	6.77225	\N
33464325	https://www.wohnungsboerse.net/immodetail/33464325	89.22	3	Luxuriöse 3-Zimmer-Wohnung mit atemberaubendem Blick über Düsseldorf - provisionsfrei	14	40211	Toulouser	51.2345	6.79546	2017
33464345	https://www.wohnungsboerse.net/immodetail/33464345	65	2	Friedenstraße 62, 40219 Düsseldorf	32	40219	\N	51.2135	6.76234	\N
33464465	https://www.wohnungsboerse.net/immodetail/33464465	45.94	1	schöne 1-Zimmer-Wohnung in Düsseldorf-Lörick	43	40547	Niederkasseler	51.2415	6.7346	\N
33464500	https://www.wohnungsboerse.net/immodetail/33464500	24.66	1	Schönes helles Appartement mit Pantryküche in Derendorf in der Nähe der Hochschule	15	40476	Bülowstr.	51.2445	6.79182	\N
33464631	https://www.wohnungsboerse.net/immodetail/33464631	68	3	3-Zimmer-Dachgeschosswohnung mit 2 Balkonen in D-Garath	101	40595	Paul	51.1452	6.89408	\N
33464724	https://www.wohnungsboerse.net/immodetail/33464724	166.54	4	Altbaucharme 4-Zimmer Wohnung mit Terrasse in Düsseldorf-Düsseltal	23	40237	\N	51.2357	6.80917	\N
33464772	https://www.wohnungsboerse.net/immodetail/33464772	58.56	2	Düsseldorf-Benrath	95	40597	Benrodestr.	51.164	6.85456	\N
33465657	https://www.wohnungsboerse.net/immodetail/33465657	40	2	TAUSCHWOHNUNG Düsseldorf Hassels 2 Zimmer+Balkon Beschreibung Lesen!	98	40599	\N	51.1825	6.8657	\N
33465675	https://www.wohnungsboerse.net/immodetail/33465675	66	2	Hochwertige 2-Zimmer-Wohnung mit Einbauküche und Dachterrasse im beliebten „Le Flair“ in Pempelfort	14	40477	Marc-Chagall-Straße	51.2368	6.79491	\N
33465765	https://www.wohnungsboerse.net/immodetail/33465765	65	2	+++Wohnen am Elbroichpark+++  2-Zimmer mit Balkon in Holthausen	93	40589	\N	51.1641	6.82144	1960
33465771	https://www.wohnungsboerse.net/immodetail/33465771	47	2	Sanierte Altbauwohnung Düsseldorf-Süd Rheinnähe	93	40589	\N	51.1641	6.82144	\N
33465815	https://www.wohnungsboerse.net/immodetail/33465815	23	1	Erstbezug - kernsanierte, neu möblierte 1-Zimm Apartment	32	40217	\N	51.2127	6.7754	\N
33465898	https://www.wohnungsboerse.net/immodetail/33465898	46	2	Tauschwohnung: TAUSCHWOHNUNG, Derendorf	15	40476	\N	51.248	6.77902	\N
33466040	https://www.wohnungsboerse.net/immodetail/33466040	110	3.5	Charmante Maisonette-Wohnung mit tollen Hausgemeinschaft und Gartenmitbenutzung	82	40229	Gumbertstraße	51.203	6.83622	\N
33466189	https://www.wohnungsboerse.net/immodetail/33466189	19.6	1	Tolles Apartment in der Düsseldorfer Altstadt	11	40213	Wallstraße	51.2244	6.77355	\N
33468319	https://www.wohnungsboerse.net/immodetail/33468319	82	2	Gartenwohnung in Toplage : barrierefreie  2-Zimmer-EG-Wohnung	16	40477	Kleverstr.	51.2414	6.7785	\N
33468338	https://www.wohnungsboerse.net/immodetail/33468338	26	1	Nachmieter:in für hochwertiges 1-Zimmer Apartment, voll möbliert	33	40219	Hammer	51.2138	6.7527	\N
33468444	https://www.wohnungsboerse.net/immodetail/33468444	50	2	Tauschwohnung: perfekt aufgeteilte 2-Zimmer Wohnung mit Balkon	15	40476	\N	51.248	6.77902	\N
33468606	https://www.wohnungsboerse.net/immodetail/33468606	40	2	Tauschwohnung: Biete Unterbilk, suche Düsseltal, 2 Zimmer	32	40217	\N	51.2127	6.7754	\N
33468702	https://www.wohnungsboerse.net/immodetail/33468702	101.5	4	Platz für die ganze Familie: 4-Zimmer-Wohnung in begehrter Düsseltaler Nachbarschaft!	23	40239	Brehmstraße	51.2397	6.80205	1961
33468731	https://www.wohnungsboerse.net/immodetail/33468731	84.43	3	3 Zimmerwohnung mit Einbauküche im beliebten Pempelfort	14	40479	Rosenstraße	51.2332	6.7833	\N
33468752	https://www.wohnungsboerse.net/immodetail/33468752	37	1	Helles Apartment mit großem Balkon in Düsseldorf-Grafenberg!	72	40235	\N	51.2294	6.82752	\N
33468770	https://www.wohnungsboerse.net/immodetail/33468770	76.91	4	Schöne 4 Zimmerwohnung mit kleinem Balkon in Düsseldorf-Knittkuhl.	74	40629	Am	51.2683	6.87416	\N
33468776	https://www.wohnungsboerse.net/immodetail/33468776	30	1	Bismarck-Suites - Möbliertes Apartment im Herzen von Düsseldorf zu vermieten!	13	40210	Bismarckstraße	51.2224	6.7849	\N
33468883	https://www.wohnungsboerse.net/immodetail/33468883	44	1	"Zentral gelegene Erdgeschoss-Wohnung, in begehrter Wohnlage in Düsseldorf-Pempelfort zu vermieten!"	14	40479	Derendorfer	51.2333	6.79025	\N
33468980	https://www.wohnungsboerse.net/immodetail/33468980	90	3	Großzügige 3-Zimmer Wohnung in Düsseldorf-Bilk	36	40223	Brunnenstraße	51.2047	6.7806	\N
33469010	https://www.wohnungsboerse.net/immodetail/33469010	27	1	HALLO STUDENTEN AUFGEPASST1 - Wohnen Nähe FH Düsseldorf	15	40476	Johannstraße	51.2532	6.7739	\N
33469021	https://www.wohnungsboerse.net/immodetail/33469021	81.87	3	Geräumige 3-Zimmer-Wohnung mit schönem Balkon	56	40721	Wohlauer	51.184	6.92318	\N
33469025	https://www.wohnungsboerse.net/immodetail/33469025	105	4	Schöne Wohnung mit vier Zimmern  und großem Balkon in Köln-Sülz	56	50939	\N	50.8989	6.91769	\N
33469036	https://www.wohnungsboerse.net/immodetail/33469036	97.5	4	Schöne 4-Zimmer Wohnung in Köln-Weiden	56	50858	Ostlandstrasse	50.936	6.83608	1973
33469054	https://www.wohnungsboerse.net/immodetail/33469054	33	1	Helle 1-Zimmer-Wohnung in Essen-Rüttenscheid!	56	45130	Friederikenstraße	51.4398	7.01368	\N
33469069	https://www.wohnungsboerse.net/immodetail/33469069	43.39	1	Gemütliches Apartment in Rheindorf-Süd mit S/W-Balkon	56	51371	\N	51.0625	6.94186	\N
33469072	https://www.wohnungsboerse.net/immodetail/33469072	79	3	Wohnen auf der kinderfreundlichen Fichtenhöhe - Kommen Sie nach Hause!	56	42855	Wörthstr.	51.1806	7.20998	\N
33469076	https://www.wohnungsboerse.net/immodetail/33469076	77.8	3	Provisionsfrei: 3-Zimmer Wohnung mit Garten und Balkon in Langenfeld-Langfort	56	40764	Ludwig-Wolker-Strasse	51.1186	6.93917	1981
33470837	https://www.wohnungsboerse.net/immodetail/33470837	29.62	1	WIN WIN - Möbliertes 1-Zimmer Appartement	33	40221	Speditionstraße	51.2156	6.7501	\N
33470875	https://www.wohnungsboerse.net/immodetail/33470875	46	1	Gemütliche Wohnung im Herzen von Oberkassel	41	40549	Ria-Thiele-Straße	51.2347	6.74122	\N
33470930	https://www.wohnungsboerse.net/immodetail/33470930	65	2.5	Luxuriöses, möbliertes Apartment direkt am Arper Wald	63	40472	Reichswaldallee	51.272	6.83151	\N
33470964	https://www.wohnungsboerse.net/immodetail/33470964	43	2	Moderne 2 Zimmerwohnung, Unterrath/Lichtenbroich	62	40468	Hiddenseestr.	51.2753	6.779	\N
33471014	https://www.wohnungsboerse.net/immodetail/33471014	48.3	2	Alles, was das Herz begehrt: Helle 2-Zimmer-Wohnung in der Endetage in Holthausen	93	40589	Bonner	51.1711	6.83848	\N
33471054	https://www.wohnungsboerse.net/immodetail/33471054	95	3	helle, ruhige und renovierte Wohnung mit grossem Sonnenbalkon zu mieten!	41	40547	Lerchenstrasse	51.2391	6.7403	\N
33471079	https://www.wohnungsboerse.net/immodetail/33471079	71	3	3 Zimmerwohnung mit Balkon in Düsseldorf-Knittkuhl. Ggf. mit Einbauküche	74	40629	Am	51.2669	6.8714	\N
33471198	https://www.wohnungsboerse.net/immodetail/33471198	70	4	Tauschwohnung: Große Wohnung	83	40627	\N	51.2024	6.88388	\N
33471247	https://www.wohnungsboerse.net/immodetail/33471247	72	3	3 Zimmer Wohnung im Altbau mit Nachtstromspeicherheizung	32	40217	Kronprinzenstraße	51.2126	6.77004	\N
33471318	https://www.wohnungsboerse.net/immodetail/33471318	105	4	MIT 360 GRAD RUNDGANG - 4 ZIMMER ALTBAUPERLE IN DÜSSELDORF GRAFENBERG	72	40235	Burgmüllerstraße	51.2453	6.82481	\N
33471343	https://www.wohnungsboerse.net/immodetail/33471343	150	3.5	Tauschwohnung: Wunderschöne Gartenwohnung mit Holzofen	62	40468	\N	51.2612	6.7789	\N
33471372	https://www.wohnungsboerse.net/immodetail/33471372	90	3	*****Traumhaft sanierte 3 Zimmer Wohnung mit Balkon und 240 qm großem Garten in ruhiger Lage!*****	96	40593	Arnold-Schönberg-Str.	51.1527	6.88026	\N
33473077	https://www.wohnungsboerse.net/immodetail/33473077	50.95	2	renovierte Altbau-2 Zimmer-Wohnung mit Balkon im Erdgeschoss in ruhiger Seitenstraße in Rath	63	40472	\N	51.2685	6.83379	\N
33473113	https://www.wohnungsboerse.net/immodetail/33473113	98	3.5	3,5 Zimmer-Wohnung in Benrath mit 2 Balkonen, Garage und großer Wohnküche	95	40597	\N	51.1638	6.87102	\N
33473146	https://www.wohnungsboerse.net/immodetail/33473146	80	2.5	Geschmackvolle Wohnung mit Balkon und Terrasse in Düsseldorf	13	40210	Friedrich-Ebert-Str.	51.2225	6.78766	\N
33473152	https://www.wohnungsboerse.net/immodetail/33473152	92	2	Großzügige 2-Zimmer Maisonette-Wohnung im Zwei Familien Haus	98	40599	Dörnbergstraße	51.1785	6.87675	\N
33473299	https://www.wohnungsboerse.net/immodetail/33473299	61.26	2	Moderne Hochparterre-Wohnung mit Gartennutzung in Oberkassel	41	40545	Joachimstr.	51.2326	6.7572	\N
33473469	https://www.wohnungsboerse.net/immodetail/33473469	61	2	** Traumhafte 2-Zimmer-Wohnung mit Rundbogenfenstern **	81	40231	Posener	51.2088	6.82985	1996
33473627	https://www.wohnungsboerse.net/immodetail/33473627	50	2	Lichtdurchflutete 2-Zimmer-Wohnung | großer Balkon | modernes Badezimmer | sofort bezugsfertig	91	40591	Kampstr.	51.1906	6.81825	\N
33473690	https://www.wohnungsboerse.net/immodetail/33473690	186	4	Haus im Haus: moderne 4-Zimmer-Wohnung der besonderen Art mit eigenem Garten!	55	40489	\N	51.3305	6.76259	\N
33473842	https://www.wohnungsboerse.net/immodetail/33473842	98.83	3	Kernsanierte 3-Zimmer Wohnung in Ludenberg	73	40629	Poßbergweg	51.2584	6.86944	\N
33475843	https://www.wohnungsboerse.net/immodetail/33475843	100.35	3	Traumhafte Dachgeschoss-Wohnung mit Dachterrasse und Galerie für 3köpfige Familie	63	40472	Neuenhofstr.	51.2635	6.80981	1890
33475867	https://www.wohnungsboerse.net/immodetail/33475867	91	3.5	3,5 Zimmer Wohnung mit 2 Balkonen und Einzelgarage in D-Unterbach	84	40627	\N	51.2024	6.88388	\N
33475935	https://www.wohnungsboerse.net/immodetail/33475935	41.13	1	Attraktive 1-Zimmer-Wohnung mit Balkon und EBK in Düsseldorf-Golzheim	16	40476	Zietenstraße	51.2418	6.77575	\N
33476079	https://www.wohnungsboerse.net/immodetail/33476079	50.95	2	2-Zimmer-Wohnung in Düsseldorf-Hassels zum selber renovieren	98	40599	Dörnbergstr.	51.178	6.8768	1960
33476080	https://www.wohnungsboerse.net/immodetail/33476080	83.84	3	Große 3-Zimmer-Wohnung in sehr gepflegtem Mehrfamilienhaus - zum selber Gestalten	98	40599	Lärchenweg	51.1746	6.87906	1960
33476224	https://www.wohnungsboerse.net/immodetail/33476224	33	1.5	Moderne möblierte 1,5  Zimmer Wohnung  im Herzen von Unterbilk	32	40219	\N	51.2135	6.76234	1972
33476234	https://www.wohnungsboerse.net/immodetail/33476234	140	4	Luxuriös ausgestattete 4-Zimmer-Wohnung mit traumhaftem Rheinblick	16	40474	\N	51.2738	6.74219	1926
33476247	https://www.wohnungsboerse.net/immodetail/33476247	82.76	4	4-Zimmer-Wohnung in Düsseldorf Garath wird saniert zum 16.12.2023	101	40595	Kurt-Tucholsky-Straße	51.1444	6.90373	\N
33476261	https://www.wohnungsboerse.net/immodetail/33476261	85.5	2.5	Tolle Maisonettewohnung in ruhiger Lage	91	40591	\N	51.188	6.81736	\N
33476372	https://www.wohnungsboerse.net/immodetail/33476372	53	2	Tauschwohnung: Tausche 2 Zimmerwohnung Düsseldorf gegen Köln	21	40233	\N	51.2198	6.8119	\N
33476560	https://www.wohnungsboerse.net/immodetail/33476560	87	3.5	Lichtdurchflutete Altbau-Wohnung mit Terrasse und Blick ins Grüne, mit EBK und Schränken	71	40625	\N	51.2358	6.85232	\N
33477151	https://www.wohnungsboerse.net/immodetail/33477151	60.32	2	Erstbezug! Lichtdurchflutete Dachgeschoßwohnung mit großer Loggia in Düsseldorf-Rath	63	40472	Recklinghauser	51.2662	6.80737	2022
33477172	https://www.wohnungsboerse.net/immodetail/33477172	64	2	Tauschwohnung: neue Bau im Hafen	33	40221	\N	51.1997	6.75072	\N
33477228	https://www.wohnungsboerse.net/immodetail/33477228	40	1	Bismarck-Suites // Apartment im Herzen von Düsseldorf!	13	40210	Bismarckstraße	51.2224	6.7849	\N
33477273	https://www.wohnungsboerse.net/immodetail/33477273	74	3	3 Zimmer, Küche, Diele, Bad, Balkon - Danach haben Sie gesucht!	22	40235	Dorotheenstr.	51.2303	6.80942	\N
33477275	https://www.wohnungsboerse.net/immodetail/33477275	108.1	4	4-Zimmer-Wohnung in Düsseldorf-Friedrichstadt zum 01.12.2023 zu vermieten	31	40215	Fürstenwall	51.2138	6.78186	\N
33477460	https://www.wohnungsboerse.net/immodetail/33477460	67	3	Frisch renovierte 3-Zimmer-Wohnung im 1. OG zentral in Oberkassel	41	40545	\N	51.2284	6.75437	1924
33477540	https://www.wohnungsboerse.net/immodetail/33477540	131	4	Zooviertel Düsseldorf großzügige 4-Zi.-Wohnung in besonders ruhiger Wohnlage	23	40237	\N	51.2357	6.80917	1950
33477583	https://www.wohnungsboerse.net/immodetail/33477583	43.68	1	Geräumiges Appartement mit Terrasse in Flehe	38	40223	\N	51.1998	6.77225	2023
33477711	https://www.wohnungsboerse.net/immodetail/33477711	60	2	Bilk: Solventer Mieter gesucht!	38	40225	Ernst-Derra-Str.	51.1934	6.78597	\N
33477756	https://www.wohnungsboerse.net/immodetail/33477756	45.56	1.5	Hübsche Single-Whg. mit ruhigem Balkon nahe Medienhafen	32	40219	Neckarstraße	51.2137	6.75624	\N
33477795	https://www.wohnungsboerse.net/immodetail/33477795	52	2	2 Zimmer Dachgeschosswohnung mit neuem Bad!!	37	40227	Josefstraße	51.2146	6.80222	1960
33479487	https://www.wohnungsboerse.net/immodetail/33479487	63	2	Geschmackvolle Wohnung mit zwei Zimmern in Düsseldorf	37	40227	\N	51.2154	6.79757	1950
33479536	https://www.wohnungsboerse.net/immodetail/33479536	103	3	Düsseldorf-Wittlaer: Exklusive 3-Zimmerwohnung mit großzügiger Sonnenterrasse u. Gartenanteil	54	40489	Bockumer	51.3211	6.74159	\N
33479633	https://www.wohnungsboerse.net/immodetail/33479633	23.62	1	Perfekt für Studenten - 1-Zimmer Apartment - möbliert - mit EBK + Balkon	13	40210	Konrad-Adenauer-Platz	51.2206	6.79156	1950
33479704	https://www.wohnungsboerse.net/immodetail/33479704	51.33	1	1-Zimmer-Wohnung in Düsseldorf Lierenfeld	82	40231	Kuthsweg	51.2071	6.82854	\N
33479705	https://www.wohnungsboerse.net/immodetail/33479705	77	3	Demnächst frei! 3-Zimmer-Wohnung in Düsseldorf Unterrath	62	40468	Am	51.2651	6.79106	\N
33479709	https://www.wohnungsboerse.net/immodetail/33479709	65	2	Gepflegte 2-Raum-Wohnung mit Balkon Derendorf	15	40547	Frankenstrasse	51.2496	6.77946	\N
33479730	https://www.wohnungsboerse.net/immodetail/33479730	97.87	3	Wunderschöne 3-Zimmer-Wohnung in Düsseldorf	73	40629	Am	51.2454	6.85118	2009
33479794	https://www.wohnungsboerse.net/immodetail/33479794	67	2	Helle renovierte 2 Zimmer Wohnung in Innenstadtlage!	13	40210	Grupellostr.	51.2207	6.78717	\N
33479828	https://www.wohnungsboerse.net/immodetail/33479828	78	3	Helle 3 Zimmerwohnung mit Balkon in Düsseldorf Zentrum	13	40211	Worringerstr.	51.2284	6.7961	\N
33479930	https://www.wohnungsboerse.net/immodetail/33479930	57	2	2-Zimmer Wohnung mit Einbauküche und Badewanne in Düsseldorf - Stadtmitte	13	40211	\N	51.2301	6.79288	\N
33480003	https://www.wohnungsboerse.net/immodetail/33480003	11.47	1	Für Pendler! Saniertes Apartment mit Kitchenette	12	40213	Schwanenmarkt	51.2193	6.77255	\N
33480068	https://www.wohnungsboerse.net/immodetail/33480068	119	4	Helle Maisonette Wohnung	98	40599	Am	51.1764	6.8708	\N
33480104	https://www.wohnungsboerse.net/immodetail/33480104	72.1	3	Helle 3-Zimmer-Wohnung mit sep. Küche und Balkon  in D-Unterrath	62	40468	Kalkumer	51.2653	6.77524	\N
33480109	https://www.wohnungsboerse.net/immodetail/33480109	73.5	2.5	Düsseldorf-Urdenbach 2,5 Zimmerwohnung mit Galerie und Balkon	96	40593	Göppingerstr.	51.1483	6.87396	\N
33480183	https://www.wohnungsboerse.net/immodetail/33480183	52	2	Kernsanierte und idyllisch gelegen 2-Zimmerwohnung	35	40221	Aderräuscher	51.1907	6.76493	\N
33481072	https://www.wohnungsboerse.net/immodetail/33481072	95	2	Möblierte Luxus Altbauwohnung - saniertes Denkmal Gebäude - KFW Energieeffizient saniert	22	40233	Hermannstr.	51.2303	6.8077	1910
33481091	https://www.wohnungsboerse.net/immodetail/33481091	28	1	Exklusive 1-Zimmer-Wohnung in Düsseldorf	37	40227	\N	51.2154	6.79757	\N
33481128	https://www.wohnungsboerse.net/immodetail/33481128	73	3	Oststraße 65, 40210 Düsseldorf	13	40210	Oststraße	51.2244	6.78752	\N
33481197	https://www.wohnungsboerse.net/immodetail/33481197	73	2.5	Tauschwohnung: 2,5-Zimmer Wohnung in Pempelfort	14	40477	\N	51.2385	6.78498	\N
33481219	https://www.wohnungsboerse.net/immodetail/33481219	49.38	2	HELLE 2-ZIMMER-KOMFORTWOHNUNG IN GERRESHEIM MIT BALKON WANNENBAD INKLUSIVE EINBAUKÜCHE 1. ETAGE	71	40625	Torfbruchstraße	51.2319	6.85111	\N
33481220	https://www.wohnungsboerse.net/immodetail/33481220	51.9	2	FÜR SENIOREN ab 60 Jahre - kl. 2 Zimmer-Wohnung mit Balkon und Aufzug, nur mit WBS!	63	40472	Marler	51.2657	6.7984	1999
33481234	https://www.wohnungsboerse.net/immodetail/33481234	58	2	Zooparkblick vom Balkon im Dachgeschoss / 2 Zimmer-Wohnung	23	40239	Brehmstrasse	51.2392	6.80217	\N
33481303	https://www.wohnungsboerse.net/immodetail/33481303	92	3	Traumlage in Düsseldorf / 3 Zimmerwohnung auf der Lorettostraße	32	40219	Lorettostraße	51.2143	6.76617	\N
33481343	https://www.wohnungsboerse.net/immodetail/33481343	86	3	Sanierter Altbau inklusive EBK: 3 Zimmer zum Wohlfühlen in Wersten!	91	40591	Opladener	51.1877	6.81998	\N
33481347	https://www.wohnungsboerse.net/immodetail/33481347	116.93	3	Hübsche 3 Zimmerwohnung mit großer Terrasse in Pempelfort	14	40477	\N	51.2385	6.78498	\N
33481349	https://www.wohnungsboerse.net/immodetail/33481349	190	3	Exklusive Maisonettewohnung mit Wellnessbad in Oberkassel	41	40545	Barmer	51.2296	6.74675	1913
33481357	https://www.wohnungsboerse.net/immodetail/33481357	124.8	2.5	Exklusive Designerwohnung in Toplage in Düsseldorf-Pempelfort!	14	40479	\N	51.2333	6.78371	1985
33481527	https://www.wohnungsboerse.net/immodetail/33481527	31	1	Geschmackvolle Wohnung  im Herzen von Düsseldorf	32	40219	Friedenstrasse	51.212	6.76728	\N
33481648	https://www.wohnungsboerse.net/immodetail/33481648	85	3.5	MIT 360 GRAD RUNDGANG - SCHÖNE SANIERTE ALTBAUWOHNUNG IM HERZEN VON DÜSSELDORF ELLER	82	40229	Gumbertstraße	51.2003	6.8422	1910
33481733	https://www.wohnungsboerse.net/immodetail/33481733	110	3	Wunderschöne geräumige 3-Zimmer-Albau-Whg. mit Südwest-Balkon und Einbauküchein Düsseldorf	14	40479	Freiligrathstr.	51.2345	6.77694	\N
33481763	https://www.wohnungsboerse.net/immodetail/33481763	40	1.5	Gemütliche 1 1/2-Zimmerwohnung in zentraler Lage in Düsseldorf, Adlerstraße	14	40211	\N	51.2301	6.79288	\N
33481808	https://www.wohnungsboerse.net/immodetail/33481808	78	4	D-Rath! Bezugsfreie 4-Zimmer-Wohnung zu vermieten	63	40472	Rather	51.2676	6.82621	\N
33481831	https://www.wohnungsboerse.net/immodetail/33481831	93	4	Altbaucharme! Renovierte 4-Zimmer-Wohnung mit Balkon	63	40472	Rather	51.2676	6.82621	\N
33483615	https://www.wohnungsboerse.net/immodetail/33483615	18	1	Zimmer in einer 3er WG, 380€ all in, keine Party, 2 männ. Mitbewohner	15	40468	Schimmelbuschstraße	51.2547	6.78364	\N
33483666	https://www.wohnungsboerse.net/immodetail/33483666	202	3.5	Altbau-Wohnung mit Garten- hochwertig- luftdurchflutet- Südausrichtung	23	40237	\N	51.2357	6.80917	\N
33483731	https://www.wohnungsboerse.net/immodetail/33483731	93	3.5	Exklusive 3,5-Zimmer-Wohnung mit großem Balkon in Essen Heisingen	97	45259	\N	51.4021	7.06724	1980
33483786	https://www.wohnungsboerse.net/immodetail/33483786	60	1	Maisonette-Appartement mitten in Düsseldorf-Altstadt	11	40213	Liefergasse	51.2282	6.7733	\N
33483866	https://www.wohnungsboerse.net/immodetail/33483866	85	3	Tauschwohnung: Tausche eine 3 Zimmer Wohnung gegen eine 2 Zimmer Wohnung	13	40212	\N	51.2236	6.78053	\N
33484007	https://www.wohnungsboerse.net/immodetail/33484007	100	2	Tauschwohnung: Besondere, loftartige Maisonette-Wohnung in DUS gegen Köln	13	40210	\N	51.2225	6.78772	\N
33484043	https://www.wohnungsboerse.net/immodetail/33484043	103	4	Frisch renoviert 4-Zimmerwohnung mit Balkon	23	40239	Kühlwetterstraße	51.2428	6.79796	1928
33484055	https://www.wohnungsboerse.net/immodetail/33484055	70	3	Tauschwohnung: Tausche 70qm, 3Z+KDB, Altbau gg. kl. Wohnung Flingern-Nord	22	40235	\N	51.2294	6.82752	\N
33484110	https://www.wohnungsboerse.net/immodetail/33484110	43	1	Tauschwohnung: 1 Zimmer Wohnung mit Balkon gegen 2 Zimmer-Wohnung	14	40477	\N	51.2385	6.78498	\N
33484223	https://www.wohnungsboerse.net/immodetail/33484223	72	2	Hell & ruhig: Dachterrassen-Traum mit 2.Balkon *ab Dez/Feb*	14	40477	Tußmannstraße	51.2371	6.79332	\N
33484313	https://www.wohnungsboerse.net/immodetail/33484313	80.2	3	Schöne helle kernsanierte 3 Zimmerwohnung, 4.OG, Erstbezug (kein Aufzug)	37	40227	\N	51.2154	6.79757	1952
33484955	https://www.wohnungsboerse.net/immodetail/33484955	70	2	In Düsseldorf: Gepflegte Wohnung mit zwei Zimmern und Balkon	82	40229	\N	51.1968	6.84602	\N
33484993	https://www.wohnungsboerse.net/immodetail/33484993	24.46	1	Stilvolle 1-Zimmer-Wohnung in Düsseldorf	15	40476	Sommersstraße	51.2438	6.79053	\N
33485025	https://www.wohnungsboerse.net/immodetail/33485025	77	3	-Untermiete- Vollmöblierte 3-Zimmer-Wohnung am Belsenpark in Düsseldorf Oberkassel	41	40549	\N	51.2331	6.71909	\N
33485043	https://www.wohnungsboerse.net/immodetail/33485043	50	2	Ankommen und Wohlfühlen – Moderne Löffelfertige Zweizimmerwohnung  mit Balkon	96	40593	\N	51.1403	6.86854	1974
33485071	https://www.wohnungsboerse.net/immodetail/33485071	83	3	Tauschwohnung: 3,5ZKDB Düsseldorf und Suche 2ZKDB in Düsseldorf oder Köln	62	40472	\N	51.2685	6.83379	\N
33485207	https://www.wohnungsboerse.net/immodetail/33485207	33	1	Diese Adresse spricht für sich …	31	40215	Corneliusstraße	51.2102	6.78297	\N
33485222	https://www.wohnungsboerse.net/immodetail/33485222	62	2	Attraktive 2-Raum-Wohnung mit EBK und Balkon in Düsseldorf	15	40476	Metzer	51.2504	6.78551	1974
33485232	https://www.wohnungsboerse.net/immodetail/33485232	95	2.5	Tauschwohnung: große 2,5 Zimmer 95 qm/2 Wohnung, im Tausch gegen 60 qm/2	64	40470	\N	51.2569	6.80771	\N
33485382	https://www.wohnungsboerse.net/immodetail/33485382	93	4	Großzügige 4- Zimmer wohnung in Düsseldorf-Flingern	22	40233	\N	51.2198	6.8119	\N
33485395	https://www.wohnungsboerse.net/immodetail/33485395	50	2	Tauschwohnung: Helle neuwertige 2-Zimmer Wohnung in Oberbilk	37	40227	\N	51.2154	6.79757	\N
33485455	https://www.wohnungsboerse.net/immodetail/33485455	58	2	Traumhafte 2-Zimmerwohnung mit Tageslichtbad!	71	40625	Dreifaltigkeitsstraße	51.2278	6.865	1928
33485647	https://www.wohnungsboerse.net/immodetail/33485647	55	2	Im Alter ruhig wohnen! Seniorenwohnung mit Duschbad und Balkon in Lierenfeld	82	40231	Leuthenstr.	51.2122	6.83962	\N
33485714	https://www.wohnungsboerse.net/immodetail/33485714	64	2	schöne 2-Zimmer--Wohnung in guter Lage im Grünen	63	40472	Eitelstraße	51.2704	6.82834	1972
33487334	https://www.wohnungsboerse.net/immodetail/33487334	62	2	Schöne 2 Zi. Altbauwohnung in Oberbilk ab 1. Feb (vom Eigentümer)	37	40219	Solinger	51.2137	6.80229	\N
33487361	https://www.wohnungsboerse.net/immodetail/33487361	78	2	Sanierte 2,5-Zimmer-Wohnung mit Balkon und EBK in Düsseldorf	22	40235	Dorotheenstraße	51.229	6.81036	\N
33487416	https://www.wohnungsboerse.net/immodetail/33487416	80	2	Exklusive, möblierte 2-Zimmer-EG-Wohnung mit Einbauküche und Garten in Düsseldorf	22	40235	Schwelmer	51.2306	6.8183	\N
33487443	https://www.wohnungsboerse.net/immodetail/33487443	106	3	Erdgeschoss Wohnung mit großer Terrasse in D-Pempelfort	14	40477	\N	51.2385	6.78498	\N
33487464	https://www.wohnungsboerse.net/immodetail/33487464	68.05	2	Helle und geräumige 2- Zi. Wohnung mit Blick ins Grüne & Balkon in D-Kaiserswerth	53	40489	\N	51.3305	6.76259	1982
33487524	https://www.wohnungsboerse.net/immodetail/33487524	35.49	1	Gemütliches Apartment nahe Bahnhof	13	40210	Bendemannstr.	51.2235	6.79124	1956
33487539	https://www.wohnungsboerse.net/immodetail/33487539	63	2	Moderne 2-Zimmer-Wohnung mit großem Balkon!	101	40595	Emil-Barth-Straße	51.1399	6.89505	\N
33487594	https://www.wohnungsboerse.net/immodetail/33487594	74	2	Tauschwohnung: 2Z Düsseldorf gegen 1-2Z in Köln.	81	40231	\N	51.2135	6.83024	\N
33487610	https://www.wohnungsboerse.net/immodetail/33487610	79.96	3	Demnächst frei! 3-Zimmer-Wohnung in Düsseldorf Hassels	98	40599	Potsdamer	51.1851	6.8609	1975
33487613	https://www.wohnungsboerse.net/immodetail/33487613	95.67	4	4-Zimmer-Wohnung in Düsseldorf Hassels	98	40599	Potsdamer	51.1842	6.86031	1975
33487614	https://www.wohnungsboerse.net/immodetail/33487614	40.78	2	2-Zimmer-Wohnung in Düsseldorf Hassels	98	40599	Potsdamer	51.1835	6.86021	1975
33487615	https://www.wohnungsboerse.net/immodetail/33487615	56.06	3	Demnächst frei! 3-Zimmer-Wohnung in Düsseldorf Vennhausen	83	40627	Lassallestraße	51.2113	6.86012	1953
33487617	https://www.wohnungsboerse.net/immodetail/33487617	45.22	2	2-Zimmer-Wohnung in Düsseldorf Vennhausen	83	40627	Lassallestraße	51.2116	6.85909	1953
33487646	https://www.wohnungsboerse.net/immodetail/33487646	57	2	2-Zimmer-Wohnung in Düsseldorf Hassels	98	40599	Süllenstraße	51.1744	6.86862	1952
33487668	https://www.wohnungsboerse.net/immodetail/33487668	116	3	Wunderbarer Altbau - Neue Bäder - Große Loggia - Garage - Top Lage	41	40545	Quirinstr.	51.2318	6.74819	\N
33487702	https://www.wohnungsboerse.net/immodetail/33487702	45	1.5	Helle 1-Zimmer-Wohnung mit Balkon in D-Kaiserswerth	53	40489	\N	51.3305	6.76259	1982
33487740	https://www.wohnungsboerse.net/immodetail/33487740	52	2	47113/43 Helle 2-Zimmer-Wohnung in Düsseldorf	101	40595	Heinrich-Lersch	51.1349	6.90115	\N
33487761	https://www.wohnungsboerse.net/immodetail/33487761	86	2.5	Tauschwohnung: Helle offene DG Wohnung ohne Schrägen	93	40589	\N	51.1641	6.82144	\N
33487842	https://www.wohnungsboerse.net/immodetail/33487842	87	2	Exclusive moderne Wohnung in historischem Kloster (teilmöbliert)	31	40217	Talstr	51.2115	6.77879	\N
33487856	https://www.wohnungsboerse.net/immodetail/33487856	80	3	Gut geschnittene 3 Zimmer Wohnung	91	40591	Hügelstrasse	51.1803	6.83214	\N
33487975	https://www.wohnungsboerse.net/immodetail/33487975	55	2	*City-Apartment* 2 Zimmer-Wohnung mit Balkon möbliert inkl. W-Lan & TV & Strom	36	40223	Suitbertusstr.	51.2043	6.77194	\N
33488069	https://www.wohnungsboerse.net/immodetail/33488069	91.8	2.5	Stilvolle, hochwertig ausgestattete Altbau-Wohnung in zentraler Lage	31	40215	\N	51.2149	6.78256	\N
33488078	https://www.wohnungsboerse.net/immodetail/33488078	239	6	Luxuriöse Maisonette Wohnung mit Garten in Bestlage Grafenberg	72	40235	Böcklinstraße	51.2441	6.82394	\N
33488089	https://www.wohnungsboerse.net/immodetail/33488089	59	2	Wohnung mit Terrasse und Garten - Südlage / reines Wohngebiet!	54	40489	Hans-Vilz-Weg	51.3166	6.7489	\N
33489083	https://www.wohnungsboerse.net/immodetail/33489083	94	3	Exklusive und komfortable 3-Zimmer-Wohnung mit Balkon in jungem Wohnhaus in Top-Lage von D-Bilk	36	40223	Färberstr.	51.208	6.77855	2016
33489243	https://www.wohnungsboerse.net/immodetail/33489243	50	2.5	Tauschwohnung: Tausche kleinere gegen größere Altbauwohnung in Flingern	22	40233	\N	51.2198	6.8119	\N
33489268	https://www.wohnungsboerse.net/immodetail/33489268	29.17	1	Möbliertes, komplett ausgestattetes Luxusapartment mit Concierge und Fitnessbereich im Medienhafen	33	40221	\N	51.1997	6.75072	2020
33489270	https://www.wohnungsboerse.net/immodetail/33489270	99	2	Erstbezug - 2-Zimmer-EG-Wohnung - hochwertige Einbauküche - Balkon - Tiefgaragenstellplatz	35	40221	\N	51.1997	6.75072	\N
33489271	https://www.wohnungsboerse.net/immodetail/33489271	82	2	Erstbezug - 2-Zimmer-EG-Wohnung - hochwertige Einbauküche - eigene Terrasse - Tiefgaragenstellplatz	36	40221	\N	51.1997	6.75072	\N
33489430	https://www.wohnungsboerse.net/immodetail/33489430	50	1	Tauschwohnung: Wunderschöne Maisonette Wohnung	22	40235	\N	51.2294	6.82752	\N
33489455	https://www.wohnungsboerse.net/immodetail/33489455	64.62	3.5	3-Zimmer-Wohnung in Düsseldorf	22	40235	Gaußstraße	51.2286	6.8214	\N
33489488	https://www.wohnungsboerse.net/immodetail/33489488	53.93	2	Moderne 2-Zimmerwohnung mit Balkon	63	40472	Kürtenstr.	51.2677	6.79857	1956
33489596	https://www.wohnungsboerse.net/immodetail/33489596	65	2	Tauschwohnung: Schöne, helle 2 Zimmer Altbau Wohnung mit Sonnenbalkon	36	40223	\N	51.1998	6.77225	\N
33489639	https://www.wohnungsboerse.net/immodetail/33489639	60	2	Golzheim Yachhafen - Premium 2 Zimmer Whg, feinstens möbliert	16	40474	\N	51.2738	6.74219	\N
33489705	https://www.wohnungsboerse.net/immodetail/33489705	66	2	2 Zi.Wohnung nahe Karolingerplatz	36	40223	\N	51.1998	6.77225	\N
33489715	https://www.wohnungsboerse.net/immodetail/33489715	54	2	2 Zimmer Wohnung - großer Balkon und Einbauküche	36	40225	Himmelgeister	51.2008	6.78274	2023
33489806	https://www.wohnungsboerse.net/immodetail/33489806	102	3	GOLZHEIM 500 METER  ZUM RHEIN - FREIE 3 ZIMMERWOHNUNG- GEHOBENE AUSSTATTUNG - BALKON - EBK-TG STP  -	16	40474	\N	51.2738	6.74219	1995
33489822	https://www.wohnungsboerse.net/immodetail/33489822	90	3	Großzügige 3-Zimmer Wohnung in Düsseldorf-Bilk	36	40223	Brunnenstraße	51.2047	6.7806	1936
33489828	https://www.wohnungsboerse.net/immodetail/33489828	30	1	Bilk/ Nähe Uni: sehr helles DG - Appartment	36	40225	Moorenstr.	51.1984	6.7842	\N
33489966	https://www.wohnungsboerse.net/immodetail/33489966	84.1	3.5	Charmante 3,5-Zi.-Wohnung Düsseldorf Oberkassel provisionsfrei	41	40545	\N	51.2284	6.75437	\N
33491762	https://www.wohnungsboerse.net/immodetail/33491762	101	3	Schöne 3-Zi. Whg. in D'dorf -Urdenbach am Alten Rhein	96	40593	Am	51.1467	6.86225	\N
33491774	https://www.wohnungsboerse.net/immodetail/33491774	49	1.5	Attraktive 1,5-Raum-Wohnung in Düsseldorf Friedrichstadt	31	40215	\N	51.2149	6.78256	\N
33491804	https://www.wohnungsboerse.net/immodetail/33491804	72	3	3-Zimmer-Wohnung nahe Kirchplatz	31	40217	Kirchfeldstraße	51.2124	6.77768	\N
33491865	https://www.wohnungsboerse.net/immodetail/33491865	49.06	2.5	Helle und ruhige 2,5 Zimmer-Wohnung, Nähe obere Kö, provisionsfrei!	31	40215	Adersstraße	51.2181	6.78357	\N
33495653	https://www.wohnungsboerse.net/immodetail/33495653	45	2	Tauschwohnung: Tausch 2 gegen 3 (DD-Köln oder DD-DD)	15	40476	\N	51.248	6.77902	\N
33491896	https://www.wohnungsboerse.net/immodetail/33491896	79	3	Untermieter gesucht für 2 Monaten: Voll-möblierte 3-Zimmer-Wohnung mit Einbauküche in Düsseldorf	15	40476	\N	51.248	6.77902	\N
33491973	https://www.wohnungsboerse.net/immodetail/33491973	50	2	Tauschwohnung: 2 Zimmerwohnung am Hafen	32	40219	\N	51.2135	6.76234	\N
33492040	https://www.wohnungsboerse.net/immodetail/33492040	70	3	Tauschwohnung: Schöne 3 Zimmer Wohnung mit Balkon in Friedrichstadt/Bilk	31	40215	\N	51.2149	6.78256	\N
33492069	https://www.wohnungsboerse.net/immodetail/33492069	62.3	3	Ihr neues Zuhause: interessante 3-Zimmer-Wohnung	14	40479	Moltkestr.	51.2363	6.79304	\N
33492070	https://www.wohnungsboerse.net/immodetail/33492070	61.63	2	Großzügige 2-Zimmer-Wohnung mit Balkon	15	40476	Münsterstr.	51.2433	6.78524	\N
33492140	https://www.wohnungsboerse.net/immodetail/33492140	23	1	Schönes DG-Apartment mit einem Zimmer und EBK in Düsseldorf-Hamm	34	40221	Blasiusstraße	51.2075	6.73769	\N
33492180	https://www.wohnungsboerse.net/immodetail/33492180	58	2	Tauschwohnung: Ich, 30, w, ledig suche nach einem neuen Zuhause	32	40219	\N	51.2135	6.76234	\N
33492194	https://www.wohnungsboerse.net/immodetail/33492194	65	3	Tauschwohnung: Ich biete 3 Zimmer gegen 1,5 oder 2 Zimmer in Düsseldorf an.	36	40225	\N	51.1974	6.78988	\N
33492245	https://www.wohnungsboerse.net/immodetail/33492245	50	2	Tauschwohnung: Suche 3 Zimmer /biete 2 ZimmerWohnung saniert mit Balkon	62	40468	\N	51.2612	6.7789	\N
33492298	https://www.wohnungsboerse.net/immodetail/33492298	75	2	Tauschwohnung: Biete Düsseldorf, suche Berlin	14	40211	\N	51.2301	6.79288	\N
33493198	https://www.wohnungsboerse.net/immodetail/33493198	120	3	Ruhige Wohnoase im Medienhafen	32	40219	Völklinger	51.2118	6.75844	\N
33493220	https://www.wohnungsboerse.net/immodetail/33493220	46	2	2 Zi-DG-Wohnung, Tel. 0211-763144, teilschräge, KDB, gute Wohnlage, 46 qm, KM 520, NK 80,	91	40591	Liebfrauenstraße	51.1889	6.82121	\N
33493229	https://www.wohnungsboerse.net/immodetail/33493229	76	3	Frisch renovierte 3-Zimmer-Wohnung in Düsseldorf-Holthausen	93	40589	Bahlenstr.	51.1759	6.82924	\N
33493230	https://www.wohnungsboerse.net/immodetail/33493230	61.11	3	Behagliche 3- Zimmerwohnung für Singles oder Paare!	63	40472	Liliencronstr.	51.2678	6.82693	1955
33493239	https://www.wohnungsboerse.net/immodetail/33493239	55	2	Freundliche 3-Zimmer-Wohnung in Düsseldorf	91	40591	Millrather	51.1939	6.82346	\N
33493246	https://www.wohnungsboerse.net/immodetail/33493246	109	3	Tauschwohnung: Tauschwohnung: Schöne 3 Zimmer mit Balkon in Derendorf	15	40476	\N	51.248	6.77902	\N
33493371	https://www.wohnungsboerse.net/immodetail/33493371	52	2	Optimal für Studenten und Pendler - Sanierte 2-Zimmer Wohnung in Düsseldorf Wersten	91	40591	\N	51.188	6.81736	\N
33493408	https://www.wohnungsboerse.net/immodetail/33493408	61	2	Tauschwohnung: 2- Zimmer + Balkon in Toplage in Unterbilk	32	40219	\N	51.2135	6.76234	\N
33493427	https://www.wohnungsboerse.net/immodetail/33493427	68.24	3.5	Nachmieter zum 01.03.2024 gesucht	101	40595	Wilhelm-Kreis-Straße	51.1461	6.89071	\N
33493428	https://www.wohnungsboerse.net/immodetail/33493428	56.38	2.5	Zweizimmerwohnung mit Balkon und Tageslichtbad Nachmieter gesucht Januar 2024	101	40595	Wilhelm-Kreis-Straße	51.1461	6.89071	\N
33493438	https://www.wohnungsboerse.net/immodetail/33493438	61	2	Nachmieter gesucht 2Zimmer Wohnung mit Balkon!	101	40595	Güstrower	51.1501	6.90019	\N
33493441	https://www.wohnungsboerse.net/immodetail/33493441	56.05	2	Ein Platz für Zwei!	101	40595	Carl-Friedr.-Goerdeler-Straße	51.1448	6.90482	\N
33493442	https://www.wohnungsboerse.net/immodetail/33493442	56.19	2.5	Demnächst frei! 2-Zimmer-Wohnung in Düsseldorf Garath Vormerken-Besichtigungen ab Dezember möglich	101	40595	Otto-Braun-Straße	51.1398	6.90482	\N
33493443	https://www.wohnungsboerse.net/immodetail/33493443	68.99	3.5	Demnächst frei! 3-Zimmer-Wohnung in Düsseldorf GarathNachmieter zum Januar 2024 gesucht	101	40595	Carl-von-Ossietzky-Straße	51.143	6.90269	1969
33493444	https://www.wohnungsboerse.net/immodetail/33493444	80.98	3	Achtung familienfreundlich! Nachmieter gesucht ! zum 15.02.2024	101	40595	Carl-von-Ossietzky-Straße	51.1438	6.90092	\N
33493445	https://www.wohnungsboerse.net/immodetail/33493445	59.57	2	Demnächst frei! 2-Zimmer-Wohnung in Düsseldorf Garath Nachmieter gesucht	101	40595	Kurt-Tucholsky-Straße	51.1437	6.90495	\N
33493446	https://www.wohnungsboerse.net/immodetail/33493446	56.11	2	Freundliche Zweizimmerwohnung mit Balkon	101	40595	Kurt-Tucholsky-Straße	51.1442	6.90456	1969
33493520	https://www.wohnungsboerse.net/immodetail/33493520	64	3	Tauschwohnung: Schöne Wohnung nahe Lorettostr, Medienhafen und Rhein	32	40217	\N	51.2127	6.7754	\N
33493584	https://www.wohnungsboerse.net/immodetail/33493584	61.78	3	Erstbezug nach Sanierung - Helle Zweizimmerwohnung mit Sonnenbalkon	63	40472	Hattinger	51.2651	6.80703	1961
33493593	https://www.wohnungsboerse.net/immodetail/33493593	62.5	2.5	Ideal geschnittene 2,5 Raum Wohnung mit 2 Balkonen	36	40223	Feuerbachstraße	51.2066	6.78195	\N
33493606	https://www.wohnungsboerse.net/immodetail/33493606	40	1.5	Tauschwohnung: Superschöne Single oder Pärchenwohnung	32	40219	\N	51.2135	6.76234	\N
33493623	https://www.wohnungsboerse.net/immodetail/33493623	160	3	ERSTKLASSIGES WOHNEN IN RHEINLAGE - FÜR ALLE DIE DAS BESONDERE SUCHEN!\n3 Zimmer	96	40593	Am	51.15	6.86165	2018
33493785	https://www.wohnungsboerse.net/immodetail/33493785	70	3	Schicke 3 Zimmer-Wohnung mit Küche, Diele, Bad	31	40215	Weberstr.	51.2093	6.78015	\N
33495322	https://www.wohnungsboerse.net/immodetail/33495322	68	2.5	Schöne und ruhig gelegende 2,5 Raum-Wohnung in Düsseldorf Mörsenbroich	64	40470	Pflugstraße	51.2581	6.80799	\N
33495369	https://www.wohnungsboerse.net/immodetail/33495369	38	1	Tauschwohnung: Tausche 1-Zimmer Wohnung gegen 2-Zimmer Wohnung! :)	13	40211	\N	51.2301	6.79288	\N
33495525	https://www.wohnungsboerse.net/immodetail/33495525	45	2	Tauschwohnung: Suche schönes Zuhause in Münster, biete tolle Wohnung in DUS	15	40476	\N	51.248	6.77902	\N
33495711	https://www.wohnungsboerse.net/immodetail/33495711	55	2	*** EIN WOHNTRAUM IN ELLER AUF DER 4. ETAGE ***	82	40229	\N	51.1968	6.84602	1949
33495788	https://www.wohnungsboerse.net/immodetail/33495788	57.94	2	Gemütliche 2-Zimmer Wohnung mit Balkon	23	40239	Heinrichstr.	51.2471	6.80672	\N
33495874	https://www.wohnungsboerse.net/immodetail/33495874	86	3	Gemütliche Dachgeschoss-Wohnung sucht nette Mieter	63	40472	Oberratherstr.	51.2669	6.827	1929
33495876	https://www.wohnungsboerse.net/immodetail/33495876	52.68	1	Helles Appartement in den Heinrich-Heine-Gärten zu vermieten.	42	40549	Heinrich-Heine-Gärten	51.2383	6.72951	2016
33495909	https://www.wohnungsboerse.net/immodetail/33495909	80	2	Geräumige 2-Zimmer Wohnung zu vermieten	82	40231	Schweidnitzer	51.2087	6.83977	\N
33495913	https://www.wohnungsboerse.net/immodetail/33495913	47	2	Geräumige 2-Zimmer Wohnung zu vermieten	82	40231	Schweidnitzer	51.2087	6.83977	\N
33495914	https://www.wohnungsboerse.net/immodetail/33495914	95	3	Geräumige 3-Zimmer Wohnung zu vermieten	82	40231	Schweidnitzer	51.2087	6.83977	\N
33495915	https://www.wohnungsboerse.net/immodetail/33495915	55	1	Geräumige 1-Zimmer Wohnung zu vermieten	82	40231	Schweidnitzer	51.2087	6.83977	\N
33495916	https://www.wohnungsboerse.net/immodetail/33495916	40	2	Geräumige 2-Zimmer Wohnung zu vermieten	82	40231	Schweidnitzer	51.2087	6.83977	\N
33495917	https://www.wohnungsboerse.net/immodetail/33495917	40	1	Geräumige Souterrain Wohnung	82	40231	Schweidnitzer	51.2087	6.83977	\N
33495937	https://www.wohnungsboerse.net/immodetail/33495937	65.8	3	Attraktive, sanierte 3-Zimmer-Wohnung mit gehobener Innenausstattung in DüsseldorfGrafenbe	72	40235	Geibelstraße	51.2402	6.82329	1958
33497048	https://www.wohnungsboerse.net/immodetail/33497048	38	1	Tolle 1-Zimmer-Wohnung mit Balkon	11	40213	Bolkerstraße	51.2263	6.77442	2005
33497091	https://www.wohnungsboerse.net/immodetail/33497091	110	3	Eintrachtstraße 5, 40227 Düsseldorf	37	40227	Eintrachtstraße	51.2206	6.79982	1990
33497134	https://www.wohnungsboerse.net/immodetail/33497134	60	2	Attraktive 2-Zimmer-Wohnung mit Einbauküche in Düsseldorf	31	40215	Oberbilker	51.2109	6.78597	\N
33497192	https://www.wohnungsboerse.net/immodetail/33497192	130	3	Geräumige 3-Zimmer-Wohnung zur Miete in Düsseldorf Unterbach	84	40627	\N	51.2024	6.88388	\N
33497347	https://www.wohnungsboerse.net/immodetail/33497347	62	3	Tauschwohnung: Schöne 3-Zimmer-Whg gegen kleinere Whg  in Ludenberg	21	40233	\N	51.2198	6.8119	\N
33497487	https://www.wohnungsboerse.net/immodetail/33497487	120	3	Tauschwohnung: Tausche Top-Altbau-Wohnung gegen ähnliches in kleiner	23	40239	\N	51.2453	6.80322	\N
33497613	https://www.wohnungsboerse.net/immodetail/33497613	57	2	Schöne 2-Zimmerwohnung mit großer Terrasse und Garten	62	40468	Sperlingsweg	51.2685	6.76319	1954
33497664	https://www.wohnungsboerse.net/immodetail/33497664	107.7	3	Lieblingswohnung! Großzügige 3 Zimmerwohnung mit Ankleideraum,  Einbauküche und 2 Balkonen.	22	40235	Röpkestraße	51.2328	6.8247	\N
33497707	https://www.wohnungsboerse.net/immodetail/33497707	84	3	Gartenwohnung in zentraler Lage in Düsseldorf	36	40223	Dürener	51.1977	6.76971	\N
33497758	https://www.wohnungsboerse.net/immodetail/33497758	68.12	3.5	3-Zimmer-Wohnung in Düsseldorf Garath wird renoviert frei ab Januar 2024	101	40595	Adam-Stegerwald-Straße	51.1428	6.90568	\N
33497790	https://www.wohnungsboerse.net/immodetail/33497790	65	2	Gepflegte 2-Zimmer-Wohnung mit Balkon und EBK in Düsseldorf	22	40235	Engerstraße	51.2313	6.81873	1980
33497983	https://www.wohnungsboerse.net/immodetail/33497983	72	2	Möbliert in D-OBK! Moderne 2-Zimmer-Wohnung im Souterrain	41	40549	Drususstraße	51.2319	6.73684	\N
33497987	https://www.wohnungsboerse.net/immodetail/33497987	31	1	Apartment in Düsseldorf Oberkassel zu vermieten!	41	40549	Drususstraße	51.2319	6.73684	\N
33498010	https://www.wohnungsboerse.net/immodetail/33498010	72	3	Provisionsfreie 3 Zimmer DG Wohnung in D-Golzheim vom Eigentümer zu vermieten	16	40474	Meineckestrasse	51.2528	6.76908	\N
33500157	https://www.wohnungsboerse.net/immodetail/33500157	32	1	Zentrale 1-Zimmer Wohnung (Nähe Bilk-S)	31	40217	Bilker	51.2106	6.77715	\N
33500282	https://www.wohnungsboerse.net/immodetail/33500282	69.63	3	Endlich Zuhause - frisch sanierte 3-Zimmer-Wohnung	62	40472	Lichtenbroicher	51.2782	6.79427	1967
33500333	https://www.wohnungsboerse.net/immodetail/33500333	42	1	Tauschwohnung: Kernsarnierte Wohnung gegen min 1,5 Zimmerwohnung	14	40477	\N	51.2385	6.78498	\N
33500411	https://www.wohnungsboerse.net/immodetail/33500411	56	2	Ansprechende, gepflegte 2-Zimmer-Wohnung mit Balkon in ruhiger Hausgemeinschaft	63	40472	Rather	51.264	6.80564	\N
33500418	https://www.wohnungsboerse.net/immodetail/33500418	79	2	Tauschwohnung: Wunderschöne Wohnung in Kaiserswerth	53	40489	\N	51.3305	6.76259	\N
33500463	https://www.wohnungsboerse.net/immodetail/33500463	54	2	Düsseldorf Lörick - ruhige Wohnung mit Balkon und Einbauküche zu mieten !	43	40547	Büttgenweg	51.247	6.72416	\N
33500514	https://www.wohnungsboerse.net/immodetail/33500514	123	4	Tauschwohnung: Schöne 4 Zimmerwohnung mit Garten, suche 3 Zimmer mit Balkon	36	40221	\N	51.1997	6.75072	\N
33500564	https://www.wohnungsboerse.net/immodetail/33500564	30	1	Mit dem Fahrrad zur Uni - Kleines, preiswertes Zuhause in zentraler Lage	37	40227	Ellerstraße	51.2139	6.8031	\N
33500661	https://www.wohnungsboerse.net/immodetail/33500661	100	2	Geschmackvolle und geräumige DG-Wohnung mit zweieinhalb Zimmern und 2 Terassen	14	40477	Marc-Chagallstr.	51.2398	6.79402	\N
33500727	https://www.wohnungsboerse.net/immodetail/33500727	70	3	Renovierte 3-Zimmer-Wohnung mit Einbauküche in Gerresheim Grenze Vennhausen	71	40627	Glashüttenstraße	51.2179	6.86593	\N
33501241	https://www.wohnungsboerse.net/immodetail/33501241	67.5	2	***KOMPLETT SANIERTE ALTBAU-WOHNUNG MIT BALKON***	21	40233	Erkratherstr.	51.2193	6.81284	\N
33501288	https://www.wohnungsboerse.net/immodetail/33501288	50	2	SCHÖNE 2 ZIMMER WOHNUNG IN DÜSSELDORF OBERBILK	37	40227	\N	51.2154	6.79757	1910
33501375	https://www.wohnungsboerse.net/immodetail/33501375	100	3	Tauschwohnung: Weitläufige 3-Zimmer Altbau-Wohnung mit Terrasse	13	40211	\N	51.2301	6.79288	\N
33501378	https://www.wohnungsboerse.net/immodetail/33501378	45	2	Zentral gelegene kl. Wohnung in der Düsseldorfer Innenstadt mit Balkon	13	40211	Gerresheimerstr.	51.2273	6.79471	\N
33501469	https://www.wohnungsboerse.net/immodetail/33501469	158	3	Wohlfühloase am Unterbacher See! Ca. 158 m², 3 Zimmer, Solar, 4 Balkone/Terrassen & 4 Stellplätze	84	40627	\N	51.2024	6.88388	\N
33501511	https://www.wohnungsboerse.net/immodetail/33501511	125	3	Exklusive 3-Zimmerwohnung mit Garten	51	40468	\N	51.2612	6.7789	\N
33501529	https://www.wohnungsboerse.net/immodetail/33501529	85	3	Tauschwohnung: Wunderschöne Altbauwohnung mit Balkon in Flingern-Nord	22	40235	\N	51.2294	6.82752	\N
33501589	https://www.wohnungsboerse.net/immodetail/33501589	99	5	Gepflegte schöne 5-Zimmer-Wohnung zu vermieten	94	40599	Henkelstraße	51.1792	6.85982	1966
33501649	https://www.wohnungsboerse.net/immodetail/33501649	107.7	3	Lieblingswohnung! Großzügige 3 Zimmerwohnung mit Ankleideraum,  Einbauküche und 2 Balkonen.	22	40235	Röpkestraße	51.2324	6.82599	\N
33501664	https://www.wohnungsboerse.net/immodetail/33501664	97	2.5	Tauschwohnung: Große Whg. mit Kamin und Dachterrasse gegen Whg. in Köln	31	40215	\N	51.2149	6.78256	\N
33501741	https://www.wohnungsboerse.net/immodetail/33501741	60	2	Tauschwohnung: Tausche 2 Zimmer in DUS gegen größere Wohnung in Düsseldorf	31	40215	\N	51.2149	6.78256	\N
33501770	https://www.wohnungsboerse.net/immodetail/33501770	71.49	2	Tolle 2-Zimmer-Wohnung direkt gegenüber des Zooparks	23	40239	Brehmstr.	51.2443	6.80143	1954
33501772	https://www.wohnungsboerse.net/immodetail/33501772	93.92	4	Endlich Platz für die ganze Familie - 4-Zimmer-Wohnung mit tollem Ausblick	61	40472	Niederbeckstraße	51.2805	6.79816	1975
33501779	https://www.wohnungsboerse.net/immodetail/33501779	115	4	4-Zimmer-2.OG-Wohnung - hochwertige Einbauküche - Balkon - Tiefgaragenstellplatz	84	40627	\N	51.2024	6.88388	2023
33501780	https://www.wohnungsboerse.net/immodetail/33501780	89	2	2-Zimmer-Penthouse - hochwertige Einbauküche - Dachterrasse - Tiefgaragenstellplatz	84	40627	\N	51.2024	6.88388	2023
33501781	https://www.wohnungsboerse.net/immodetail/33501781	81	2	2-Zimmer-EG-Wohnung - hochwertige Einbauküche - Terrasse & Garten - Tiefgaragenstellplatz	84	40627	\N	51.2024	6.88388	2023
33501782	https://www.wohnungsboerse.net/immodetail/33501782	115	4	4-Zimmer-1.OG-Wohnung - hochwertige Einbauküche - Balkon - Tiefgaragenstellplatz	84	40627	\N	51.2024	6.88388	2023
33501783	https://www.wohnungsboerse.net/immodetail/33501783	115	4	4-Zimmer-2.OG-Wohnung - hochwertige Einbauküche - Balkon - Tiefgaragenstellplatz	84	40627	\N	51.2024	6.88388	2023
33501784	https://www.wohnungsboerse.net/immodetail/33501784	60	2	2-Zimmer-2.OG-Wohnung - hochwertige Einbauküche - Balkon - Tiefgaragenstellplatz	84	40627	\N	51.2024	6.88388	2023
33501793	https://www.wohnungsboerse.net/immodetail/33501793	45	2	Stilvolle 2-Zimmer-Wohnung in Düsseldorf Altstadt	11	40213	kapuizinergasse	51.2259	6.77394	\N
33501957	https://www.wohnungsboerse.net/immodetail/33501957	90	3	Traumhafte Dreizimmerwohnung im schönen Düsseldorf-Pempelfort	14	40477	Mauerstraße	51.24	6.78103	\N
33501970	https://www.wohnungsboerse.net/immodetail/33501970	72	3	In Düsseldorf: Gepflegte Wohnung mit drei Zimmern Küche, Diele, Bad und Balkon	36	40225	\N	51.1974	6.78988	\N
33503910	https://www.wohnungsboerse.net/immodetail/33503910	51.14	2	Stilaltbau, sanierte 2-Zimmer-Dachgeschosswohnung	15	40476	\N	51.248	6.77902	\N
33503916	https://www.wohnungsboerse.net/immodetail/33503916	100	2.5	Graf-Adolf-Platz 12, 40213 Düsseldorf	31	40213	Graf-Adolf-Platz	51.2188	6.77823	\N
33504020	https://www.wohnungsboerse.net/immodetail/33504020	95	3.5	Attraktive 3,5-Zimmer-Wohnung in Düsseldorf	55	40489	Zur	51.3233	6.78568	\N
33504049	https://www.wohnungsboerse.net/immodetail/33504049	75	2	Tauschwohnung: Neu sanierte Wochnung mit hohe Decken und schönem Stuck	64	40470	\N	51.2569	6.80771	\N
33504182	https://www.wohnungsboerse.net/immodetail/33504182	200	4	Wohn/Büro/Paxis - Loft der Extraklasse Golzheim/Stockum	51	40474	\N	51.2738	6.74219	2002
33504208	https://www.wohnungsboerse.net/immodetail/33504208	74	3.5	Tauschwohnung: Schöner Neubau mitten in Düsseldorf	37	40227	\N	51.2154	6.79757	\N
33504233	https://www.wohnungsboerse.net/immodetail/33504233	75	2	Carlstadt: Erstbezug nach Sanierung / Loft-Wohnung	11	40213	\N	51.2221	6.77271	\N
33504257	https://www.wohnungsboerse.net/immodetail/33504257	80.98	3	Achtung familienfreundlich! Nachmieter gesucht ! zum 15.02.2024	101	40595	Carl-von-Ossietzky-Straße	51.1438	6.90092	\N
33504326	https://www.wohnungsboerse.net/immodetail/33504326	76	3	Frisch sanierte 3 Zimmer Wohnung in Flingern Süd	21	40233	\N	51.2198	6.8119	\N
33504339	https://www.wohnungsboerse.net/immodetail/33504339	40	2	Schöne möblierte Zweizimmer Wohnung  im Herzen von Gerresheim	71	40625	\N	51.2358	6.85232	1972
33504374	https://www.wohnungsboerse.net/immodetail/33504374	85.5	3	Exklusive 3-Zimmer-Wohnung mit Terrasse in Düsseldorf Golzheim	16	40474	\N	51.2738	6.74219	2002
33504385	https://www.wohnungsboerse.net/immodetail/33504385	51	1.5	Tauschwohnung: Moderne Altbauwohnung mit perfektem Schnitt und Balkon	31	40215	\N	51.2149	6.78256	\N
33504518	https://www.wohnungsboerse.net/immodetail/33504518	128	3	Moderne Wohnung mit großer Terrasse in bevorzugter Lage von Düsseldorf - Golzheim	16	40474	\N	51.2738	6.74219	2004
33504585	https://www.wohnungsboerse.net/immodetail/33504585	69.08	2	Kernsanierte 2-Zimmerwohnung mit großer Küche und Sonnenbalkon sucht neue Mieter.	22	40233	Birkenstraße	51.2268	6.80372	1957
33504666	https://www.wohnungsboerse.net/immodetail/33504666	179	4	Prinzenhöhe - Terrassen-Wohnung am Wald zu vermieten	74	40629	\N	51.255	6.88361	\N
33504682	https://www.wohnungsboerse.net/immodetail/33504682	69	2	Geschmackvolle 2-Raum-DG-Wohnung mit Balkon und Einbauküche in Düsseldorf	55	40489	Melaniestraße	51.3316	6.78422	1987
33504688	https://www.wohnungsboerse.net/immodetail/33504688	26	1	Schönes Appartment Nähe Sportanlage	23	40239	Windscheidstr.	51.2457	6.80078	\N
33504693	https://www.wohnungsboerse.net/immodetail/33504693	26	1	Helles Appartement Nähe Sportanlage	23	40239	Windscheidstr.	51.2457	6.80078	\N
33504700	https://www.wohnungsboerse.net/immodetail/33504700	83.55	2.5	traumhafte 2,5 -Zimmer-Penthouse-Wohnung mit 2 Balkonen und TG in Grafental	22	40235	Neumannstr.	51.2328	6.82276	2015
33504701	https://www.wohnungsboerse.net/immodetail/33504701	100	4	SANIERTE- ZENTRALE 4-ZI.-WOHNUNG MIT PARKETT	32	40217	Friedrichstraße	51.2152	6.77657	\N
33504715	https://www.wohnungsboerse.net/immodetail/33504715	26	1	Schönes Appartment im Zooviertel	23	40239	Windscheidstr.	51.2456	6.80077	\N
33506206	https://www.wohnungsboerse.net/immodetail/33506206	85.21	3	Neubau - Erstbezug am Grafenberger Wald! Schöne 3-Zimmer Wohnung	72	40629	\N	51.255	6.88361	2023
33506290	https://www.wohnungsboerse.net/immodetail/33506290	88.5	3	Moderne 3-Raum-Wohnung mit Balkon und Einbauküche in Düsseldorf-Rath	63	40472	Am	51.2638	6.81604	\N
33506303	https://www.wohnungsboerse.net/immodetail/33506303	59.5	2	Geschmackvolle Penthouse-Wohnung mit Rheinblick	43	40547	Emanuel-Leutze-Straße	51.2432	6.74057	\N
33506337	https://www.wohnungsboerse.net/immodetail/33506337	50	2	Helle 2-Raum-Wohnung mit Balkon und EBK in Düsseldorf	64	40470	Zur	51.2467	6.81662	\N
33506341	https://www.wohnungsboerse.net/immodetail/33506341	82	3	3 Zimmerwohnung Mörsenbroich	64	40470	Max-Halbe-Straße	51.2528	6.80901	1970
33506350	https://www.wohnungsboerse.net/immodetail/33506350	101	2.5	Helle, sonnendurchflutete Wohnung mit Penthouse-Charakter	83	40627	Zwickauer	51.2079	6.85584	1979
33506367	https://www.wohnungsboerse.net/immodetail/33506367	96	3	Familienfreundliche 3-Zimmer Wohnung mit hochwertiger Einbauküche und 100qm großem Garten	22	40235	Schlüterstraße	51.2319	6.82307	2014
33506496	https://www.wohnungsboerse.net/immodetail/33506496	75	2	Tauschwohnung: Heller Altbau Unterbilk mit Erker	32	40219	\N	51.2135	6.76234	\N
33506504	https://www.wohnungsboerse.net/immodetail/33506504	51	2	Interessante 2-Zimmer-Galerie-Wohnung	83	40627	Tannenhofweg	51.2135	6.85721	1985
33506559	https://www.wohnungsboerse.net/immodetail/33506559	72	3	Attraktive 3-Zimmer-Wohnung in Düsseldorf Gerresheim mit Balkon und Garage	83	40627	\N	51.2024	6.88388	1985
33506595	https://www.wohnungsboerse.net/immodetail/33506595	33	1	Tauschwohnung: Zentrale Düsseldorfer Wohnung mit Schlafzimmer und Wohnküche	31	40215	\N	51.2149	6.78256	\N
33506665	https://www.wohnungsboerse.net/immodetail/33506665	115	3	Gehoben sanierte Wohnung mit großer Terrasse	23	40239	Brehmstraße	51.2449	6.8014	\N
33506668	https://www.wohnungsboerse.net/immodetail/33506668	91	3	Helle & moderne 3-Raum Wohnung in Golzheim	16	40474	\N	51.2738	6.74219	1997
33506712	https://www.wohnungsboerse.net/immodetail/33506712	50	1.5	Tauschwohnung: Zentrale Lage Düsseldorf gegen Stuttgart	31	40215	\N	51.2149	6.78256	\N
33506771	https://www.wohnungsboerse.net/immodetail/33506771	63	3	5700:  Düsseldorf! Tolle 3-Zimmerwohnung mit gutem Grundrisskonzept!	71	40625	\N	51.2358	6.85232	1970
33506806	https://www.wohnungsboerse.net/immodetail/33506806	63.61	2	Demnächst frei! 3-Zimmer-Wohnung in Düsseldorf Mörsenbroich	64	40470	Eugen-Richter-Straße	51.2483	6.80674	\N
33506830	https://www.wohnungsboerse.net/immodetail/33506830	100	3	Lichtdurchflutende 3-Zimmerwohnung mit top sanierten Duschbad in guter Lage	31	40215	Luisenstr.	51.2171	6.78192	1957
33506903	https://www.wohnungsboerse.net/immodetail/33506903	72	3	3-Zimmerwohnung sucht Mieter	82	40231	Torgauerstr.	51.2095	6.83652	\N
33506972	https://www.wohnungsboerse.net/immodetail/33506972	80	3	Big City Life Düsseldorf-Pempelfort in der 2. Etage inklusive Aufzug, für Singles und junge Paare!!	14	40477	Nordstraße	51.2378	6.77939	\N
33506987	https://www.wohnungsboerse.net/immodetail/33506987	64	3	Erstbezug nach Sanierung:	93	40589	\N	51.1641	6.82144	\N
33509212	https://www.wohnungsboerse.net/immodetail/33509212	42	2	Vollmobilierte Neubau 2-Zimmer-Wohnung in Düsseldorf	63	40470	Westfalenstraße	51.263	6.81568	2023
33509225	https://www.wohnungsboerse.net/immodetail/33509225	55	2	Möblierte 2-Zimmer-Wohnung mit Balkon im beliebten Stadtteil Flingern	21	40235	\N	51.2294	6.82752	\N
33509320	https://www.wohnungsboerse.net/immodetail/33509320	59	3	Einziehen - Genießen - Wohlfühlen	41	40545	Dominikanerstraße	51.2286	6.75056	\N
33509349	https://www.wohnungsboerse.net/immodetail/33509349	70	3	Von privat! Wunderschöne 3-Z-Neubauwohnung mit großem Balkon und Nobilia EBK	63	40472	Westfalenstraße	51.263	6.81568	2022
33509360	https://www.wohnungsboerse.net/immodetail/33509360	44.36	2	Jetzt schnell zugreifen: Günstige 2-Zimmer-Wohnung. Bitte Text lesen!	62	40468	Irenenstr.	51.2669	6.77837	1955
33509372	https://www.wohnungsboerse.net/immodetail/33509372	65	2	Tauschwohnung: Helle moderne Zweizimmerwohnung mit großem Südbalkon	15	40476	\N	51.248	6.77902	\N
33509381	https://www.wohnungsboerse.net/immodetail/33509381	46.66	2	Sanierte Erdgeschosswohnung mit modernem Duschbad	37	40227	Velberter	51.218	6.8009	1950
33509397	https://www.wohnungsboerse.net/immodetail/33509397	43.2	2	Direkt einziehen. Tolle 2-Zimmer-Wohnung mit Balkon	15	40476	Glockenstr.	51.2448	6.78377	1913
33509409	https://www.wohnungsboerse.net/immodetail/33509409	57.52	3	Kleine 3-Zimmer-Wohnung in Düsseldorf-Reisholz	94	40599	Briedestr.	51.1738	6.85525	\N
33509416	https://www.wohnungsboerse.net/immodetail/33509416	76	3	*ANNAHMESTOP* 3-Zimmer-Wohn. mit Balkon in Düsseldorf-Stadtmitte sucht nette Mieter*in	13	40210	Karlstraße	51.2235	6.79443	\N
33509424	https://www.wohnungsboerse.net/immodetail/33509424	42	1	Helle schöne exclusive 1 Zi-Wohnung, KDB m. Balkon für berufstätige Mieter*in	91	40589	Bahlenstraße	51.1832	6.82164	1986
33509425	https://www.wohnungsboerse.net/immodetail/33509425	44	2	2-Zimmer-Erdgeschosswohnung in Flingern mit Balkon	21	40233	Kettwiger	51.2232	6.81045	1950
33509432	https://www.wohnungsboerse.net/immodetail/33509432	30	1	Tauschwohnung: Tausche zentrale 1 Zimmer Wohnung in Friedrichstadt gegen	31	40215	\N	51.2149	6.78256	\N
33509513	https://www.wohnungsboerse.net/immodetail/33509513	68	2	Tauschwohnung: Wunderschöne Altbauwohnung Flingern	22	40235	\N	51.2294	6.82752	\N
33509543	https://www.wohnungsboerse.net/immodetail/33509543	67	2	Tauschwohnung: Tausche wunderschöne 2-Z-Whg mit in Düsseltal gegen größere	23	40239	\N	51.2453	6.80322	\N
33509599	https://www.wohnungsboerse.net/immodetail/33509599	58	2	Tauschwohnung: Suche 2 Zimmer in Berlin - biete 2-Zimmer  in Flingern Nord	22	40235	\N	51.2294	6.82752	\N
33509614	https://www.wohnungsboerse.net/immodetail/33509614	72	3	3 Zimmer Wohnung in D-Flingern (Nord)	22	40233	\N	51.2198	6.8119	\N
33509761	https://www.wohnungsboerse.net/immodetail/33509761	85	3.5	Wohnung inklusive Einbauküche , herrliche  Aussicht auf zwei Balkonen direkt am Wald	101	40595	Stetttinerstr.	51.1524	6.89677	1968
33510322	https://www.wohnungsboerse.net/immodetail/33510322	83.61	2	2 Zimmer Erdgeschoss Wohnung mit Gartenzugang in D.-Heerdt / Concierge, Sauna, Fitness	42	40549	Heinrich	51.2388	6.72989	2013
33510338	https://www.wohnungsboerse.net/immodetail/33510338	33	1.5	Sanierte 1,5-Zimmer-Wohnung mit Luxus-Bad und EBK in Toplage von Werden	56	45239	Huffmannstraße	51.3931	7.0053	1939
33510346	https://www.wohnungsboerse.net/immodetail/33510346	59	2.5	Exklusive 2,5-Zimmer-Wohnung in Düsseldorf - Erstbezug	16	40476	Roßstraße	51.2503	6.77416	2023
33510395	https://www.wohnungsboerse.net/immodetail/33510395	61.6	2	2 Zimmer-KDB-Balkon - beliebter und gepflegter Altbau in Uni-Nähe im begehrten Stadtteil Bilk	36	40223	\N	51.1998	6.77225	\N
33510407	https://www.wohnungsboerse.net/immodetail/33510407	61	2	Tauschwohnung: Zwei Zimmer Wohnung mit Aussicht	91	40589	\N	51.1641	6.82144	\N
33510434	https://www.wohnungsboerse.net/immodetail/33510434	59.37	2	Attraktive 2 Zimmer Terrassenwohnung mit Concierge und Fitness in D. - Heerdt	42	40549	Heinrich	51.2377	6.72973	\N
33510466	https://www.wohnungsboerse.net/immodetail/33510466	36	1.5	Tauschwohnung: Schöne 1,5 Zimmer Wohnung in Pempelfort	14	40479	\N	51.2333	6.78371	\N
33510508	https://www.wohnungsboerse.net/immodetail/33510508	30	1	Tauschwohnung: Wunderschöne Wohnung im Herzen Düsseldorfs abzugeben!	11	40213	\N	51.2221	6.77271	\N
33510545	https://www.wohnungsboerse.net/immodetail/33510545	44	2	Tauschwohnung: Singlewohnung zum Tausch in Bilk	36	40223	\N	51.1998	6.77225	\N
33510563	https://www.wohnungsboerse.net/immodetail/33510563	61.92	2	Ab sofort - ruhig gelegene 2-Zimmer-Wohnung, 3.OG, kein Aufzug, zum selber renovieren	101	40595	Reinhold-Schneider-Str.	51.1368	6.90008	1965
33511353	https://www.wohnungsboerse.net/immodetail/33511353	85	3.5	Exklusiv sanierte 3,5 -Zimmer Wohnung mit riesigem Balkon	53	40489	Alte	51.2925	6.73984	1967
33511465	https://www.wohnungsboerse.net/immodetail/33511465	58.51	2	Geschmackvolle 2-Raum-Wohnung mit Balkon und EBK in Düsseldorf	82	40229	Vennhauser	51.2017	6.85	\N
33511473	https://www.wohnungsboerse.net/immodetail/33511473	30	2	Tauschwohnung: Suche Münster, biete Düsseldorf DG mit EBK	37	40227	\N	51.2154	6.79757	\N
33511526	https://www.wohnungsboerse.net/immodetail/33511526	50	2	Tauschwohnung:  Düsseldorf Altbau gegen Köln	36	40223	\N	51.1998	6.77225	\N
33511560	https://www.wohnungsboerse.net/immodetail/33511560	29	1	Neu renoviertes Apartment in TOP Lage DUS Pempelfort	14	40477	Kaiserswerther	51.2389	6.7777	1959
33512128	https://www.wohnungsboerse.net/immodetail/33512128	60	1.5	Wasserwerksweg 40, 40489 Düsseldorf	54	40489	Wasserwerksweg	51.3337	6.72693	\N
33512290	https://www.wohnungsboerse.net/immodetail/33512290	52	2	Tauschwohnung: Suche 3 Zi mit Balkon zentral. , biete 2 Zi. in Unterbilk	32	40219	\N	51.2135	6.76234	\N
33512310	https://www.wohnungsboerse.net/immodetail/33512310	71.46	3	Zentrale 3-Zimmer-Wohnung mit großen Balkon und neuem Bad in Düsseldorf **Provisionsfrei**	82	40229	Speyerweg	51.1964	6.82352	1971
33512338	https://www.wohnungsboerse.net/immodetail/33512338	53	2	Tauschwohnung: Ich tausche schöne 2 Zimmerwohnung gegen 3 Zimmer	36	40225	\N	51.1974	6.78988	\N
33512379	https://www.wohnungsboerse.net/immodetail/33512379	56	2	Tauschwohnung: Lichtdurchflutete 2 Z.-Wohnung gegen min. 3-Z. in Düsseldorf	51	40474	\N	51.2738	6.74219	\N
33512400	https://www.wohnungsboerse.net/immodetail/33512400	21.94	1	Schickes, vollmöbliertes Studio am Medienhafen mit Uninähe	36	40221	Volmerswertherstr.	51.2093	6.76159	\N
33512469	https://www.wohnungsboerse.net/immodetail/33512469	70	2.5	Ganz Oben in Oberkassel alles inklusive; ab sofort frei!	44	40547	Lewitstraße	51.2364	6.74663	1974
33513464	https://www.wohnungsboerse.net/immodetail/33513464	102	3	GEWERBETREIBENDE ACHTUNG: WOHNEN UND ARBEITEN	23	40239	\N	51.2453	6.80322	1964
33513521	https://www.wohnungsboerse.net/immodetail/33513521	76	2.5	Ostparksiedlung: Erstbezug nach Sanierung! Neue Schallschutzfenster + neue Einbauküche + Balkon!	71	40625	Beverweg	51.2327	6.8341	1979
33513524	https://www.wohnungsboerse.net/immodetail/33513524	158	4	Großzügiges Wohnen am Rheindeich	54	40489	\N	51.3305	6.76259	1972
33514133	https://www.wohnungsboerse.net/immodetail/33514133	75	3	Gepflegte 3-Zimmer-EG-Wohnung mit Balkon und EBK in Düsseldorf	15	40476	\N	51.248	6.77902	1984
33514283	https://www.wohnungsboerse.net/immodetail/33514283	57	2	Tauschwohnung: 2-Zimmer Altbauwohnung in Flingern	22	40235	\N	51.2294	6.82752	\N
33514376	https://www.wohnungsboerse.net/immodetail/33514376	66	2	Nachmieter/in für eine 2 ZKB Wohnung mit EBK im Vilis Quartier in Düsseldorf Gerresheim gesucht	71	40625	Radeberger	51.2288	6.84714	\N
33514857	https://www.wohnungsboerse.net/immodetail/33514857	66	2	Zoo-Viertel: Schillerplatz, Düsseltal - schöne Wohnung mit Sonnenbalkon zur Miete	23	40237	Schillerstraße	51.2347	6.80063	\N
33514868	https://www.wohnungsboerse.net/immodetail/33514868	57	2	Stilvolle, modernisierte 2-Zimmer-Wohnung mit Balkon in Düsseldorf	36	40223	Merkurstraße	51.2054	6.77009	1956
33514955	https://www.wohnungsboerse.net/immodetail/33514955	30	1	Alles-inkl.: möbliertes Apartment für 1 Person. Pauschalmiete inkl. alle Kosten	91	40591	Kölner	51.1914	6.81521	1991
33514964	https://www.wohnungsboerse.net/immodetail/33514964	83	3	Gepflegte 3-Zimmer-Erdgeschosswohnung mit Einbauküche in Düsseldorf	42	40549	\N	51.2331	6.71909	\N
33514978	https://www.wohnungsboerse.net/immodetail/33514978	115	3	Düsseldorf-Oberkassel, moderne 3-Zimmer-Maisonette-Wohnung mit Garten und  Kamin	41	40549	Drususstraße	51.2329	6.73581	\N
33514990	https://www.wohnungsboerse.net/immodetail/33514990	79	3	Tauschwohnung: 3 Zimmer Wohnung Oberbilk	37	40227	\N	51.2154	6.79757	\N
33514993	https://www.wohnungsboerse.net/immodetail/33514993	79	2	Düsseldorf Rath 79 qm 2 Zimmer Wohnung 4. OG (Dachgeschoss) zu vermieten.	63	40472	Rotdornstraße	51.2624	6.81555	\N
33515065	https://www.wohnungsboerse.net/immodetail/33515065	72	3	Top moderne 3 Zimmer, Wohnküche, Diele, Bad, BALKON, 1.OG,	37	40227	Höhenstrasse	51.2121	6.79494	\N
33515086	https://www.wohnungsboerse.net/immodetail/33515086	68	2.5	*Gemütliche, helle DG.-Wohnung+Wohnküche sucht Liebhaber*Grafenberger Allee	22	40237	Grafenberger	51.235	6.81842	1953
33515589	https://www.wohnungsboerse.net/immodetail/33515589	69	2	Vollständig renovierte 2-Zimmer-Wohnung mit Balkon und Einbauküche in Düsseldorf	16	40474	Friedrich-Lau-Straße	51.2548	6.7583	\N
33515638	https://www.wohnungsboerse.net/immodetail/33515638	44	2	schön geschnittene Singlewohnung mit großem Balkon in Pempelfort	14	40477	Moltkestr	51.2389	6.78844	\N
33515642	https://www.wohnungsboerse.net/immodetail/33515642	40	1	Exklusive, geräumige 1-Zimmer-Wohnung in Düsseldorf	36	40223	Merkurstraße	51.2054	6.77009	1960
33515701	https://www.wohnungsboerse.net/immodetail/33515701	92	3	Attraktive 3-Zimmer-Wohnung mit Balkon und Einbauküche in Düsseldorf-Pempelfort	14	40479	\N	51.2333	6.78371	\N
33515717	https://www.wohnungsboerse.net/immodetail/33515717	74	3	Ansprechende 3-Zimmer-Wohnung mit Balkon in Düsseldorf	101	40595	\N	51.1408	6.90507	\N
33515788	https://www.wohnungsboerse.net/immodetail/33515788	55	2	Kernsanierte 2-Zimmer Wohnung mit Sonnenbalkon	22	40235	Hoffeldstraße	51.2294	6.81361	1962
33515794	https://www.wohnungsboerse.net/immodetail/33515794	71	2	SCHÖNER, GRÜNER UND RUHIGER WOHNEN AM WILDPARK MIT 2 ZIMMERN UND GROSSEM BALKON	73	40629	Am	51.2456	6.84909	2006
33516812	https://www.wohnungsboerse.net/immodetail/33516812	76	4	Helle Wohnung in der 1. Etage kernsaniert mit neuer Küche	32	40217	\N	51.2127	6.7754	\N
33516814	https://www.wohnungsboerse.net/immodetail/33516814	68	2	Helle 2-Zimmerwohnung zum Wohlfühlen	64	40470	\N	51.2569	6.80771	1972
33516824	https://www.wohnungsboerse.net/immodetail/33516824	60	2	Helle 2-Zimmer-Wohnung mit Balkon und Einbauküche in Düsseldorf Mörsenbroich	64	40470	\N	51.2569	6.80771	\N
33516884	https://www.wohnungsboerse.net/immodetail/33516884	85	2	Wunderschöne Altbauwohnung absolut zentral / 2ZKB	13	40210	\N	51.2225	6.78772	\N
33516886	https://www.wohnungsboerse.net/immodetail/33516886	54	2	Sanierte 2-Zimmer-Wohnung mit Balkon und Einbauküche in Düsseldorf	15	40476	Merziger	51.2503	6.78607	\N
33516901	https://www.wohnungsboerse.net/immodetail/33516901	126	3	Diskretes Angebot! - Hochmodernes Penthouse in exponierter Lage und bester Ausstattung	35	40221	\N	51.1997	6.75072	\N
33516927	https://www.wohnungsboerse.net/immodetail/33516927	71	3	Sermer Weg 52, 40472 Düsseldorf	61	40472	Sermer	51.2819	6.80261	\N
33517023	https://www.wohnungsboerse.net/immodetail/33517023	200	6	Wunderschöne Erdgeschoßwohnung	73	40629	Bergische	51.2584	6.88088	1937
33517085	https://www.wohnungsboerse.net/immodetail/33517085	42	1.5	Tauschwohnung: gemütliche Wohnung nähe Hbf gegen Kölner Wohnung	37	40227	\N	51.2154	6.79757	\N
33519871	https://www.wohnungsboerse.net/immodetail/33519871	28	1	Geschmackvolle 1-Raum-Wohnung mit Balkon und EBK in Düsseldorf	63	40472	Wattenscheider	51.2638	6.80538	\N
33519879	https://www.wohnungsboerse.net/immodetail/33519879	90	3	Hochwertige 3 Zimmer Wohnung vor Parkanlage/teilmöbliert mit hochwertiger EBK	94	40599	Steubenstr.	51.1766	6.85672	2013
33519891	https://www.wohnungsboerse.net/immodetail/33519891	25.5	1	Möbliertes Apartment in zentraler Lage	31	40215	Adersstr.	51.2178	6.78518	1955
33519960	https://www.wohnungsboerse.net/immodetail/33519960	40	2	Tauschwohnung: Biete Unterbilk, suche Düsseltal, 2 Zimmer	32	40217	\N	51.2127	6.7754	\N
33520002	https://www.wohnungsboerse.net/immodetail/33520002	81.3	3	Smarter Wohnen! Super 3-Zimmer-Wohnung im Herzen von OBERKASSEL!	41	40547	Hansaallee	51.2331	6.74532	\N
33520073	https://www.wohnungsboerse.net/immodetail/33520073	110	3	Kernsanierte 3 Zimmer Wohnung zu vermieten	31	40210	Graf-Adolf-Straße	51.2187	6.78594	1954
33520265	https://www.wohnungsboerse.net/immodetail/33520265	46	2	Tauschwohnung: TAUSCHWOHNUNG, Derendorf	15	40476	\N	51.248	6.77902	\N
33522340	https://www.wohnungsboerse.net/immodetail/33522340	59	2	Exklusive 2-Zimmer-Wohnung mit Balkon in Düsseldorf	42	40549	Heinrich-Heine-Gärten	51.2377	6.72973	\N
33522372	https://www.wohnungsboerse.net/immodetail/33522372	50	1	Helle gepflegte möblierte Dachgeschosswohnung mit hochwertiger Ausstattung	82	40231	Reisholzer	51.208	6.83082	\N
33522403	https://www.wohnungsboerse.net/immodetail/33522403	36	1	Schöne 1-Zimmer-Wohnung mit Balkon in Pempelfort	14	40211	Wielandstraße	51.2307	6.79427	\N
33522495	https://www.wohnungsboerse.net/immodetail/33522495	70	4	Tauschwohnung: Große Wohnung	83	40627	\N	51.2024	6.88388	\N
33522565	https://www.wohnungsboerse.net/immodetail/33522565	97.22	3	Duplex 3 Zimmer Wohnung in Oberkassel	41	40549	Schanzenstr.	51.2329	6.74066	1971
33522641	https://www.wohnungsboerse.net/immodetail/33522641	59	2	***möblierte 2-Zimmer Wohnung mit Charm***	22	40235	Hoffeldstr	51.227	6.81465	1970
33522653	https://www.wohnungsboerse.net/immodetail/33522653	150	3.5	Tauschwohnung: Wunderschöne Gartenwohnung mit Holzofen	62	40468	\N	51.2612	6.7789	\N
33522695	https://www.wohnungsboerse.net/immodetail/33522695	76.83	4	Einzug nach Modernisierung - schöne 4 Zimmerwohnung mit kleinem Balkon in Düsseldorf-Knittkuhl.	74	40629	Am	51.2683	6.87416	1965
33522714	https://www.wohnungsboerse.net/immodetail/33522714	59.07	2	Du bist auf der Suche nach einer neuen Wohnung? Diese 2-Zimmerwohnung wartet auf dich	21	40233	Werdener	51.2201	6.80768	2018
33522726	https://www.wohnungsboerse.net/immodetail/33522726	75.46	2	2-Zimmerwohnung mit Terrasse sucht neue Mieter	21	40233	Werdener	51.2207	6.80828	2018
33522741	https://www.wohnungsboerse.net/immodetail/33522741	39.5	2	Gemütliche 2-Zimmer-Wohnung in Düsseldorf-Pempelfort	14	40479	Franklinstraße	51.2359	6.79327	\N
33522747	https://www.wohnungsboerse.net/immodetail/33522747	64.07	2	Ihr sucht eine neue 2-Zimmerwohnung in Düsseldorf? Hier ist sie!	21	40233	Werdener	51.2207	6.80828	2018
33522771	https://www.wohnungsboerse.net/immodetail/33522771	84	3	Wunderschöne 3-Zimmer-Wohnung mit Balkon im alten Ortskern von Düsseldorf-Angermund	55	40489	Graf-Engelbert-Straße	51.3301	6.79431	1970
33522781	https://www.wohnungsboerse.net/immodetail/33522781	62	2	Renovierungsbedürftige 2-Zimmer-Wohnung zur Miete in Top-Lage in Düsseldorf	13	40211	\N	51.2301	6.79288	1955
33522816	https://www.wohnungsboerse.net/immodetail/33522816	50	2	Tauschwohnung: perfekt aufgeteilte 2-Zimmer Wohnung mit Balkon	15	40476	\N	51.248	6.77902	\N
33522999	https://www.wohnungsboerse.net/immodetail/33522999	34	1.5	Spichernstraße 31, 40476 Düsseldorf	15	40476	Spichernstraße	51.2483	6.78689	1950
33523027	https://www.wohnungsboerse.net/immodetail/33523027	88.3	3	Helle 3-Zimmer Wohnung mit großem Garten in Df.-Gerresheim	71	40625	Pirnaer	51.2284	6.85351	2023
33524106	https://www.wohnungsboerse.net/immodetail/33524106	108	3	Wunderschöne Altbauwohnung in Düsseldorf, Oberkassel	41	40545	Joachimstraße	51.2317	6.7573	1924
33524121	https://www.wohnungsboerse.net/immodetail/33524121	160	5	5-Zimmer-Maisonette mit Balkon, EBK und Klimaanlage in Angermund	55	40489	\N	51.3305	6.76259	\N
33524155	https://www.wohnungsboerse.net/immodetail/33524155	38	2	D-Zoo: BESTLAGE, 2 Zimmer, Einbauküche Balkon, direkt am Zoopark	23	40239	Bodinusstraße	51.2412	6.80762	\N
33524197	https://www.wohnungsboerse.net/immodetail/33524197	60	2	Geschmackvolle Wohnung mit zwei Zimmern sowie Balkon und EBK in Düsseldorf	32	40217	\N	51.2127	6.7754	\N
33524282	https://www.wohnungsboerse.net/immodetail/33524282	67.5	2	Helle, moderne und teilmöblierte 2-Zimmer-Wohnung in den Heinrich Heine Gärten	42	40549	\N	51.2331	6.71909	2015
33524416	https://www.wohnungsboerse.net/immodetail/33524416	80	3	Wohnen in Unterbach	84	40627	\N	51.2024	6.88388	\N
33524507	https://www.wohnungsboerse.net/immodetail/33524507	60.48	2	47104/27 Moderne 2-Zimmer-Wohnung in Düsseldorf-Wittlaer	54	40489	Heinrich-Holtschneider	51.3179	6.74658	2000
33524571	https://www.wohnungsboerse.net/immodetail/33524571	62.5	2	SANIERTE 2 ZIMMER WOHNUNG IN RUHIGER LAGE VON GRAFENBERG, MÖBELÜBERNAHME MÖGLICH	72	40629	Neuburgstraße	51.2374	6.83658	\N
33524613	https://www.wohnungsboerse.net/immodetail/33524613	65	3	*Modernes Wohnen* | Energieeffizient: A | 3-Zimmer EG | ca. 65 qm | im Herzen von Düsseldorf	37	40227	\N	51.2154	6.79757	1953
33525071	https://www.wohnungsboerse.net/immodetail/33525071	70	3	3-Zimmer Wohnung in MG-Eicken / Altbaucharme in einer ruhigen Seitenstr./ 3-Zi WG tauglich	97	41063	Alsstr.	51.2015	6.44943	1910
33526875	https://www.wohnungsboerse.net/immodetail/33526875	111	4	Helle, großzügige Wohnung mit Balkon in Düsseldorf Golzheim	16	40474	Am	51.2528	6.76591	1997
33526902	https://www.wohnungsboerse.net/immodetail/33526902	35	1.5	Luxuriöses Apartment mit Einbauküche im Win Win Düsseldorf	33	40221	Speditionstraße	51.2152	6.74966	\N
33526956	https://www.wohnungsboerse.net/immodetail/33526956	150	4	Stilvolle, luxuriöse 4-Zimmer-Maisonette-Wohnung/Haus mit großem Garten in Düsseldorf	82	40231	Schweidnitzer	51.2077	6.84051	1912
33527184	https://www.wohnungsboerse.net/immodetail/33527184	42	1	D-Oberkassel: freies, vollmöbliertes Apartment, klasse Lage!	41	40545	\N	51.2284	6.75437	1978
33527240	https://www.wohnungsboerse.net/immodetail/33527240	53	2	Tauschwohnung: Tausche 2 Zimmerwohnung Düsseldorf gegen Köln	21	40233	\N	51.2198	6.8119	\N
33527279	https://www.wohnungsboerse.net/immodetail/33527279	55	2	Tauschwohnung: 55 q² in Düsseldorf Golzheim/Derendorf	16	40476	\N	51.248	6.77902	\N
33527396	https://www.wohnungsboerse.net/immodetail/33527396	49	2	2-Zimmer-Wohnung mit Balkon und Einbauküche in DÜSSELDORF	62	40468	Hiddenseestraße	51.2754	6.77902	1995
33527400	https://www.wohnungsboerse.net/immodetail/33527400	79	3	Optimal geschnittene 3-Zimmer-Wohnung mit gr. Küche, renoviertem Bad	15	40476	Roßstr.	51.2468	6.77785	\N
33527489	https://www.wohnungsboerse.net/immodetail/33527489	70	2.5	Individuelle Maisonette-Whg. mit Balkon in toller Wohnlage in E-Bedingrade!	92	45359	\N	51.4659	6.92597	1977
33528045	https://www.wohnungsboerse.net/immodetail/33528045	90	3	Geschmackvolle Wohnung mit drei Zimmern sowie Balkon und EBK in Düsseldorf	13	40210	Oststraße	51.2203	6.78445	\N
33528095	https://www.wohnungsboerse.net/immodetail/33528095	75	3	Ansprechende Wohnung mit drei Zimmern in Düsseldorf	42	40549	Rudolfstraße	51.2266	6.71628	\N
33528229	https://www.wohnungsboerse.net/immodetail/33528229	120	3	Schöne 3 Zimmer Wohnung	16	40476	Zietenstraße	51.2421	6.77492	\N
33528294	https://www.wohnungsboerse.net/immodetail/33528294	266	7	Wie ein Haus im Haus: Moderne, komfortable Maisonettewohnung mit eigenem Garten	23	40237	\N	51.2357	6.80917	1936
33528296	https://www.wohnungsboerse.net/immodetail/33528296	80	3	Zentral gelegene sanierte Wohnung in der Düsseldorfer Innenstadt	31	40215	Helmholtzstr.	51.2158	6.78821	\N
33528355	https://www.wohnungsboerse.net/immodetail/33528355	43.91	2	40593 Urdenbach, 2-Zimmer-Wohnung	96	40593	\N	51.1403	6.86854	\N
33528588	https://www.wohnungsboerse.net/immodetail/33528588	70	2	Frisch renovierte 2-Zimmer Wohnung mit Balkon und Blick ins Grüne im ländlichen Düsseldorf-Hamm	34	40221	\N	51.1997	6.75072	1956
33528604	https://www.wohnungsboerse.net/immodetail/33528604	55	2	Dachgeschosswohnung - Aufzug im Haus	31	40215	Hüttenstraße	51.2137	6.78905	\N
33528652	https://www.wohnungsboerse.net/immodetail/33528652	65	2.5	Geschmackvolle 2,5-Raum-Wohnung mit Balkon im "Düsseldörfchen"	91	40591	Ziegeleiweg	51.1922	6.82135	\N
33528677	https://www.wohnungsboerse.net/immodetail/33528677	60	2	Wunderschöne 2-Zimmerwohnung in Friedrichstadt	31	40215	Kirchfeldstr.	51.2132	6.78819	\N
33528712	https://www.wohnungsboerse.net/immodetail/33528712	31	1	Nordstr.-Derendorf	14	40477	Nordstr.	51.2366	6.77876	\N
33530197	https://www.wohnungsboerse.net/immodetail/33530197	58	2	Renovierte, vollmöblierte 2-Zimmer-Wohnung mit Einbauküche in Düsseldorf	13	40210	Grupellostraße	51.2208	6.78689	1950
33530222	https://www.wohnungsboerse.net/immodetail/33530222	83.32	3	* Einzigartiges Wohngefühl * Moderne 3-Zimmer DG-Wohnung mit EBK ohne Aufzug!	14	40479	Franklinstraße	51.2358	6.79045	1952
33530252	https://www.wohnungsboerse.net/immodetail/33530252	116	3	TOP-PENTHOUSE-MAISONETTE - RHEINFRONT - EIGENER AUFZUG - LUXUS PUR - DIREKT VOM EIGENTÜMER !	41	40545	\N	51.2284	6.75437	1936
33530272	https://www.wohnungsboerse.net/immodetail/33530272	65.56	2	Geschmackvolle Wohnung mit zwei Zimmern sowie Balkon und Einbauküche in Düsseldorf	63	40472	Rüdigerstraße	51.2616	6.82175	\N
33530282	https://www.wohnungsboerse.net/immodetail/33530282	107.36	4	Mitten in Flingern: Traumhafte 4-Zimmer-DG-Maisonette-Wohnung	21	40233	Mettmanner	51.225	6.80265	2017
33530410	https://www.wohnungsboerse.net/immodetail/33530410	79.47	2.5	Erstbezug !!! 2-Zimmer-Wohnung mit Bürozimmer und Balkon	71	40625	Torfbruchstr.	51.2271	6.85772	\N
33530655	https://www.wohnungsboerse.net/immodetail/33530655	56.88	2	2-Zimmerwohnung mit Wannenbad und Balkon Garten mit separater Küche in Düsseldorf-Garath	101	40595	Carl-von-Ossietzky-Straße	51.1437	6.90174	\N
33530660	https://www.wohnungsboerse.net/immodetail/33530660	77.6	2	Moderne 2 Zimmer-Wohnung Nähe Grafenberger Wald!	72	40470	\N	51.2569	6.80771	\N
33530699	https://www.wohnungsboerse.net/immodetail/33530699	69	2	Erstbezug in Neubau Zweizimmer-Gartenwohnung	21	40233	Mettmannerstraße	51.2247	6.80255	2022
33530733	https://www.wohnungsboerse.net/immodetail/33530733	72.54	4	Renovierte 4 Zimmer Wohnung im Herzen der Altstadt	11	40213	Berger	51.2243	6.77258	1960
33530758	https://www.wohnungsboerse.net/immodetail/33530758	45	1	Helle Ruhiges Apartment	91	40591	Werstener	51.1892	6.83164	\N
33530824	https://www.wohnungsboerse.net/immodetail/33530824	64	2	gemütliche 2 Zimmerwohnung mitten in Düsseldorf!	31	40215	Bilker	51.2107	6.7794	1950
33532119	https://www.wohnungsboerse.net/immodetail/33532119	69	3	Gut geschnittene 3-Zimmer Wohnung mit Balkon	98	40599	\N	51.1825	6.8657	1958
33532126	https://www.wohnungsboerse.net/immodetail/33532126	53.51	2	Attraktive 2 Zimmer Wohnung in Düsseldorf Hassels	98	40599	Süllenstraße	51.1736	6.86932	\N
33532187	https://www.wohnungsboerse.net/immodetail/33532187	40	1	Exklusive, geräumige 1-Zimmer-Wohnung mit Balkon und EBK in Düsseldorf	82	40231	Weichselstraße	51.2071	6.83368	\N
33532345	https://www.wohnungsboerse.net/immodetail/33532345	25	1	Frisch renovierte Dachgeschosswohnung	93	40589	Pfeillstraße	51.176	6.83524	\N
33532414	https://www.wohnungsboerse.net/immodetail/33532414	33	1.5	Hübsches  1,5-Zimmer-App.  mit Balkon in Gerresheim - Waldblick	71	40629	Dreherstrasse	51.2323	6.85201	\N
33532441	https://www.wohnungsboerse.net/immodetail/33532441	45	2	**SINGLE WOHNUNG IN UNTERBILK 2 ZIMMER-ALTBAUWOHNUNG  NÄHE LANDTAG UND MEDIENHAFEN **	32	40219	Konkordiastr.	51.2141	6.76796	\N
33532632	https://www.wohnungsboerse.net/immodetail/33532632	39.02	1	47120/12 Moderne 1-Zimmer-Wohnung in Düsseldorf-Holthausen	93	40589	Bahlenstraße	51.1782	6.82518	1965
33532668	https://www.wohnungsboerse.net/immodetail/33532668	20	1	Exklusives Business-Apartment im Herzen von Düsseldorf Derendorf	15	40476	Merziger	51.2503	6.78703	2018
33532824	https://www.wohnungsboerse.net/immodetail/33532824	81	3	Erstbezug Neubau 3 ZI DG Wohnung Flingern Süd	21	40233	Mettmannerstraße	51.2247	6.80258	2022
33532827	https://www.wohnungsboerse.net/immodetail/33532827	69	2	Erstbezug in Neubau Zweizimmerwohnung	21	40233	Mettmannerstraße	51.2247	6.80255	2022
33532831	https://www.wohnungsboerse.net/immodetail/33532831	114	5	Neubau Erstbezug 5-ZI-Wohnung in Flingern Süd	21	40233	\N	51.2198	6.8119	2022
33534772	https://www.wohnungsboerse.net/immodetail/33534772	120	3	Birkenstraße 116, 40233 Düsseldorf	22	40233	Birkenstraße	51.2272	6.80993	1908
33534805	https://www.wohnungsboerse.net/immodetail/33534805	64	2	Suitbertusstraße 166, 40223 Düsseldorf	36	40223	\N	51.1998	6.77225	\N
33534951	https://www.wohnungsboerse.net/immodetail/33534951	40	1.5	Möbliertes Apartment im selbstbewohnten Zweifamilienhaus	84	40627	Eichenwand	51.2094	6.8826	1982
33534966	https://www.wohnungsboerse.net/immodetail/33534966	60	2	Traumwohnung in Düsseldorf Flingern Nord	22	40235	\N	51.2294	6.82752	\N
33534982	https://www.wohnungsboerse.net/immodetail/33534982	85	3	Tauschwohnung: Tausche eine 3 Zimmer Wohnung gegen eine 2 Zimmer Wohnung	13	40212	\N	51.2236	6.78053	\N
33535007	https://www.wohnungsboerse.net/immodetail/33535007	100	2	Tauschwohnung: Besondere, loftartige Maisonette-Wohnung in DUS gegen Köln	13	40210	\N	51.2225	6.78772	\N
33535061	https://www.wohnungsboerse.net/immodetail/33535061	51	3	3er WG in zentraler Lage in Düsseldorf zu vermieten!	21	40233	Engelbertstraße	51.2226	6.8091	\N
33535105	https://www.wohnungsboerse.net/immodetail/33535105	70	3	Tauschwohnung: Tausche 70qm, 3Z+KDB, Altbau gg. kl. Wohnung Flingern-Nord	22	40235	\N	51.2294	6.82752	\N
33535153	https://www.wohnungsboerse.net/immodetail/33535153	43	1	Tauschwohnung: 1 Zimmer Wohnung mit Balkon gegen 2 Zimmer-Wohnung	14	40477	\N	51.2385	6.78498	\N
33535198	https://www.wohnungsboerse.net/immodetail/33535198	73	2.5	Tauschwohnung: 2,5-Zimmer Wohnung in Pempelfort	14	40477	\N	51.2385	6.78498	\N
33535233	https://www.wohnungsboerse.net/immodetail/33535233	109.61	3	"Le Flair" in D´dorf-Pempelfort, großzügige 3-Raum-Erdgeschosswohnung mit zwei Terrassen und Garten.	14	40477	Marc-Chagall-Str.	51.2411	6.79386	2015
33535234	https://www.wohnungsboerse.net/immodetail/33535234	88.71	3	Düsseldorf-Ludenberg, Am Aaper Wald. Helle und großzügige 3-Raumwohnung mit Parkett u. Südbalkon.	73	40629	An	51.2454	6.85269	\N
33535395	https://www.wohnungsboerse.net/immodetail/33535395	56	2	Ruhige, aber gut angeschlossene 2-Zimmer-Dachgeschosswohnung mit Balkon in Düsseldorf-Hamm	34	40221	Am	51.2098	6.74064	\N
33535398	https://www.wohnungsboerse.net/immodetail/33535398	80	4	Sanierte 4-Zimmer-Wohnung mit Balkon in ruhiger Wohnlage von Düsseldorf-Wersten	91	40591	Benninghauserstr.	51.1868	6.82951	\N
33535404	https://www.wohnungsboerse.net/immodetail/33535404	89	3	helle, zentrale 3-Zimmer Wohnung im Herzen Pempelforts mit Küche und 2Balkonen	14	40477	Nettelbeckstraße	51.237	6.78297	1984
33535914	https://www.wohnungsboerse.net/immodetail/33535914	85	3	Helle und moderne 3 Zi-Whng mit Terrasse, sehr zentral in Düsseldorf Wersten	91	40591	Gertrud-Woker-Straße	51.1794	6.82601	\N
33535983	https://www.wohnungsboerse.net/immodetail/33535983	97	3	Stilvolle, vollständig renovierte 3-Zimmer-Maisonette-Wohnung mit Balkon in Düsseldorf	14	40477	Nettelbeckstrasse	51.237	6.78297	1983
33536017	https://www.wohnungsboerse.net/immodetail/33536017	95	2.5	Tauschwohnung: große 2,5 Zimmer 95 qm/2 Wohnung, im Tausch gegen 60 qm/2	64	40470	\N	51.2569	6.80771	\N
33536167	https://www.wohnungsboerse.net/immodetail/33536167	50	2	Tauschwohnung: Helle neuwertige 2-Zimmer Wohnung in Oberbilk	37	40227	\N	51.2154	6.79757	\N
33536332	https://www.wohnungsboerse.net/immodetail/33536332	79.15	3	3-Zimmer Altbauwohnung in Flingern Nord	22	40235	Flurstraße	51.2287	6.81556	\N
33536431	https://www.wohnungsboerse.net/immodetail/33536431	40.93	1	Sanierte 1-Zimmer Dachgeschosswohnung	23	40239	Heinrichstr.	51.2471	6.80672	\N
33537171	https://www.wohnungsboerse.net/immodetail/33537171	29.05	1	"The Lush One" - Geräumige Studio-Wohnung mit perfekter Aussicht	37	40227	Mindener	51.2119	6.81201	2023
33537178	https://www.wohnungsboerse.net/immodetail/33537178	122	4	NEU! mio Düsseldorf 4-Zimmer Wohnung	36	40225	Himmelgeister	51.2008	6.78274	2023
33537179	https://www.wohnungsboerse.net/immodetail/33537179	48	2	NEU! mio Düsseldorf 2-Zimmer Wohnung	36	40225	Himmelgeister	51.2008	6.78274	2023
33537199	https://www.wohnungsboerse.net/immodetail/33537199	97	3	Wunderschöne Altbauwohnung auf der Luegallee im Düsseldorf Oberkassel	41	40545	Luegallee	51.2313	6.75839	1914
33537229	https://www.wohnungsboerse.net/immodetail/33537229	30	1	Modern möbliertes Apartment im 1.OG (mit Lift) eines Mehrparteienhauses in Düsseldorf-Wersten.	91	40591	\N	51.188	6.81736	\N
33537256	https://www.wohnungsboerse.net/immodetail/33537256	60	2	Volmerswerther Straße 153, 40221 Düsseldorf	36	40221	Volmerswerther	51.2029	6.76096	\N
33537259	https://www.wohnungsboerse.net/immodetail/33537259	83	3	GELEGENHEIT ! Altbauperle sucht neue Mieter.	13	40210	Stresemannstrasse	51.2204	6.78564	\N
33537287	https://www.wohnungsboerse.net/immodetail/33537287	90	3	3-Zimmer-Wohnung mit Terasse in unmittelbare Nähe zum Unterbacher See	84	40627	Seeweg	51.2039	6.88821	\N
33537334	https://www.wohnungsboerse.net/immodetail/33537334	74	2	Tauschwohnung: 2Z Düsseldorf gegen 1-2Z in Köln.	81	40231	\N	51.2135	6.83024	\N
33537448	https://www.wohnungsboerse.net/immodetail/33537448	75	3	Singles aufgepasst! Moderne 3-Zimmer-Wohnung mit EBK in Düsseldorf-Oberkassel	41	40547	\N	51.2419	6.74772	1978
33537507	https://www.wohnungsboerse.net/immodetail/33537507	86	2.5	Tauschwohnung: Helle offene DG Wohnung ohne Schrägen	93	40589	\N	51.1641	6.82144	\N
33537526	https://www.wohnungsboerse.net/immodetail/33537526	40	2	Schöne 2. Zimmer Wohnung im Zentrum von Düsseldorf	31	40215	Pionierstraße	51.218	6.78597	\N
33537631	https://www.wohnungsboerse.net/immodetail/33537631	83	3	Tauschwohnung: 3,5ZKDB Düsseldorf und Suche 2ZKDB in Düsseldorf oder Köln	62	40472	\N	51.2685	6.83379	\N
33537783	https://www.wohnungsboerse.net/immodetail/33537783	59	2	BENRTAH KOMFORT WOHNUNG MIT BALKON TIEFGARAGE 2.OG OHNE AUFZUG KÜCHENÜBERNAHME MÖGLICH	95	40597	Steinkribbenstraße	51.1627	6.85578	1996
33537906	https://www.wohnungsboerse.net/immodetail/33537906	68	2	Helle 2-Raumwohnung am Hermannplatz	22	40233	Lindenstraße	51.2281	6.80658	\N
33539682	https://www.wohnungsboerse.net/immodetail/33539682	26.66	1	Stylische Erdgeschoss-Wohnung mit eigener Terrasse und Komplettausstattung!	37	40227	Mindener	51.2119	6.81201	2023
33539683	https://www.wohnungsboerse.net/immodetail/33539683	60.52	2	"The Special One" | Vollausgestattetes Design-Apartment mit Gäste-WC zum Erstbezug!	37	40227	Mindener	51.2119	6.81201	2023
33539684	https://www.wohnungsboerse.net/immodetail/33539684	33.88	1	Highend-Studio mit perfektem Schnitt und Komplettausstattung	37	40227	Mindener	51.2119	6.81201	2023
33539685	https://www.wohnungsboerse.net/immodetail/33539685	45.18	2	Vollmöbliertes 2-Zimmer-Apartment in bester Lage | Erstbezug!	37	40227	Mindener	51.2119	6.81201	2023
33539686	https://www.wohnungsboerse.net/immodetail/33539686	50.62	2	Luxuriöses Penthouse-Apartment mit Dachterrasse und Vollausstattung!	37	40227	Mindener	51.2119	6.81201	2023
33539687	https://www.wohnungsboerse.net/immodetail/33539687	23.76	1	Vollmöbliertes Apartment in zeitlos schönem Design + Balkon // Erstbezug in begehrter Lage	37	40227	Mindener	51.2119	6.81201	2023
33539688	https://www.wohnungsboerse.net/immodetail/33539688	31.76	1	Smart Living! Luxus-Studio mit maßgeschneiderter Möblierung zum Erstbezug	37	40227	Mindener	51.2119	6.81201	2023
33539689	https://www.wohnungsboerse.net/immodetail/33539689	20.77	1	Design-Studio mit Duschbad und hochqualitativer Ausstattung in Oberbilk	37	40227	Mindener	51.2119	6.81201	2023
33539690	https://www.wohnungsboerse.net/immodetail/33539690	71.79	3	WIN WIN - 3-Zimmer Wohnung im 7.OG im Düsseldorfer Medienhafen	33	40221	Speditionstraße	51.215	6.74939	\N
33539691	https://www.wohnungsboerse.net/immodetail/33539691	69.44	3	3 Zi-Wohnung im 19. OG in direkter Rheinlage mit Ausblick über den Hafen	33	40221	Speditionstraße	51.215	6.74939	\N
33539698	https://www.wohnungsboerse.net/immodetail/33539698	38	1	ERÖFFNUNGSANGEBOT: Vollmöbliertes 1-Zimmer-Appartement mit WLAN und TV in Top-Lage	36	40225	Himmelgeister	51.2008	6.78274	2023
33539699	https://www.wohnungsboerse.net/immodetail/33539699	40	1	ERÖFFNUNGSANGEBOT: Vollmöbliertes 1-Zimmer-Appartement mit WLAN und TV in Top-Lage	36	40225	Himmelgeister	51.2008	6.78274	2023
33539700	https://www.wohnungsboerse.net/immodetail/33539700	41	1	ERÖFFNUNGSANGEBOT: Vollmöbliertes 1-Zimmer-Appartement mit WLAN und TV in Top-Lage	36	40225	Himmelgeister	51.2008	6.78274	2023
33539739	https://www.wohnungsboerse.net/immodetail/33539739	72	2	NACHMIETER gesucht ab 01.01.24- Sanierte Altbau 2-Zimmer Wohnung Düsseldorf Bilk	36	40225	Kopernikusstraße	51.2024	6.77865	\N
33539749	https://www.wohnungsboerse.net/immodetail/33539749	77	3	Stilvolle, modernisierte 3-Zimmer-Wohnung mit Balkon und EBK in Düsseldorf	37	40227	Lessingstraße	51.2143	6.79289	\N
33539834	https://www.wohnungsboerse.net/immodetail/33539834	50	1	Geräumige 1-Zimmer-Wohnung zur Miete in Düsseldorf	62	40472	Lichtenbroicher	51.2786	6.79501	\N
33539840	https://www.wohnungsboerse.net/immodetail/33539840	78	3	999.0 € - 100.0 m² - 3 Zi.	14	40477	Jülicherstr.	51.2423	6.78483	\N
33539927	https://www.wohnungsboerse.net/immodetail/33539927	28	1	Garten-Apartment in Top-Lage von D-Oberkassel Terrasse, moderner Boden, EBK, Waschmaschine, voll möb	41	40545	\N	51.2284	6.75437	1935
33539937	https://www.wohnungsboerse.net/immodetail/33539937	122	3	***TOLLE 3-ZIMMER-WOHUNG MIT GROßER TERRASSE, KLEINEM  GARTEN & NEUEM BAD*** INKLUSIVE WEITBLICK	84	40627	Rathelbeckstraße	51.2062	6.88544	1995
33539943	https://www.wohnungsboerse.net/immodetail/33539943	92	4	Stilvolle, sanierte 4-Zimmer-Erdgeschosswohnung mit Balkon und EBK in Düsseldorf	15	40476	Frankenstrasse	51.2496	6.77946	\N
33539953	https://www.wohnungsboerse.net/immodetail/33539953	120	3	Geschmackvolle 3 Zimmerwohnung mit 3 Balkonen, EBK, Garage + Stellplatz in Niederkassel	44	40547	Joachim	51.2358	6.75559	\N
33539983	https://www.wohnungsboerse.net/immodetail/33539983	50	1	Tauschwohnung: Wunderschöne Maisonette Wohnung	22	40235	\N	51.2294	6.82752	\N
33540001	https://www.wohnungsboerse.net/immodetail/33540001	90	2	Charmant möblierte \n2 Zimmer-Wohnung \nim Düsseldorfer Zooviertel	23	40237	\N	51.2357	6.80917	1984
33540021	https://www.wohnungsboerse.net/immodetail/33540021	39	2	Hübsche 2-Raum Wohnung in zentraler Lage in Pempelfort.	14	40211	\N	51.2301	6.79288	\N
33540169	https://www.wohnungsboerse.net/immodetail/33540169	65	2	Tauschwohnung: Schöne, helle 2 Zimmer Altbau Wohnung mit Sonnenbalkon	36	40223	\N	51.1998	6.77225	\N
33540306	https://www.wohnungsboerse.net/immodetail/33540306	34.38	1	Gemütliches Single-Apartment mit Balkon	22	40233	Birkenstraße	51.2272	6.80807	1911
33540375	https://www.wohnungsboerse.net/immodetail/33540375	68	3	Frisch sanierte 3- Zimmer Wohnung mit Einbauküche und Balkon	23	40239	\N	51.2453	6.80322	\N
33540383	https://www.wohnungsboerse.net/immodetail/33540383	38	1	Modernes Apartment mit Balkon & Tiefgaragenstellplatz: Möbliert & saniert – Ihr perfektes Zuhause!	36	40223	Bachstr.	51.2074	6.7659	1981
33540408	https://www.wohnungsboerse.net/immodetail/33540408	32.5	1	Modernisierte 1-Zimmer-Wohnung mit Balkon und Einbauküche in Düsseldorf	16	40474	Friedrich-Lau-Straße	51.2553	6.75843	\N
33540487	https://www.wohnungsboerse.net/immodetail/33540487	77	3	D-Lörick | DG | Revitalisierter Altbau | Luxuriöse Ausstattung mit Balkon - Erstbezug nach Sanierung	43	40547	Amboßstraße	51.2394	6.73309	1900
33540488	https://www.wohnungsboerse.net/immodetail/33540488	98	3	D-Lörick | OG | Revitalisierter Altbau | Luxuriöse Ausstattung mit Balkon - Erstbezug nach Sanierung	43	40547	Amboßstraße	51.2394	6.73309	1900
33540498	https://www.wohnungsboerse.net/immodetail/33540498	90	3	Traumhafte und moderne 3-Zimmer-Wohnung in zentraler Lage in Düsseldorf - Unterbilk	32	40217	\N	51.2127	6.7754	1952
33540638	https://www.wohnungsboerse.net/immodetail/33540638	56	2	Scandinavian Style  2. Zimmer Wohnung (mit/ohne Möbel)  in Düsseldorf-Pempelfort	14	40477	Augustastrasse	51.2389	6.79215	\N
33540647	https://www.wohnungsboerse.net/immodetail/33540647	60	2	Flingern-Nord: sehr helle, schöne und gepflegte 2-Zimmer-Altbauwohnung	22	40235	Dorotheenstr.	51.2286	6.8103	\N
33542791	https://www.wohnungsboerse.net/immodetail/33542791	86	2	Traumwohnung sucht Nachmieter	15	40476	Glockenstraße	51.2457	6.78707	\N
33542799	https://www.wohnungsboerse.net/immodetail/33542799	56	2	Preisgedämpfte Designer Wohnung	16	40476	Schwannstraße	51.2498	6.77344	\N
33542810	https://www.wohnungsboerse.net/immodetail/33542810	60.03	2	Exklusive 2-Zimmer-Wohnung mit Terasse/Garten/Tiefgaragenstellplatz (im Preis inkludiert)	84	40627	Karl-Knödl-Straße	51.2032	6.90386	2023
33542915	https://www.wohnungsboerse.net/immodetail/33542915	70	3	Tauschwohnung: Schöne 3 Zimmer Wohnung mit Balkon in Friedrichstadt/Bilk	31	40215	\N	51.2149	6.78256	\N
33542947	https://www.wohnungsboerse.net/immodetail/33542947	58	2	Tauschwohnung: Ich, 30, w, ledig suche nach einem neuen Zuhause	32	40219	\N	51.2135	6.76234	\N
33543010	https://www.wohnungsboerse.net/immodetail/33543010	95.61	3	Gepflegte Wohnung in ruhiger Lage	97	40589	Am	51.166	6.82197	\N
33543013	https://www.wohnungsboerse.net/immodetail/33543013	53	2	EXKLUSIV BALKON GROßE WOHNKÜCHE WANNENBAD LAMINAT GARAGE 3. OG/AUFZUG RUHIG UND HELL UNTERRATH	62	40468	Kartäuser	51.2748	6.78052	\N
33543015	https://www.wohnungsboerse.net/immodetail/33543015	129	4	EXKLUSIVE MAISONETTETERRASSENWHG. 2 VOLLBÄDER PARKETT 5.OG OHNE AUFZUG HELL RUHIG RENOVIERT FLINGERN	22	40233	Lindenstraße	51.2285	6.80046	1966
33543052	https://www.wohnungsboerse.net/immodetail/33543052	50	2	Tauschwohnung: Suche 3 Zimmer /biete 2 ZimmerWohnung saniert mit Balkon	62	40468	\N	51.2612	6.7789	\N
33543088	https://www.wohnungsboerse.net/immodetail/33543088	75	2	Tauschwohnung: Biete Düsseldorf, suche Berlin	14	40211	\N	51.2301	6.79288	\N
33543126	https://www.wohnungsboerse.net/immodetail/33543126	50	2.5	Tauschwohnung: Tausche kleinere gegen größere Altbauwohnung in Flingern	22	40233	\N	51.2198	6.8119	\N
33543316	https://www.wohnungsboerse.net/immodetail/33543316	45.57	2	Möbliertes 2-Zimmer-Appartement | Einbauküche und Klimagerät | Nähe Düsseldorf Hbf	13	40211	Kurfürstenstr.	51.2236	6.79355	\N
33543320	https://www.wohnungsboerse.net/immodetail/33543320	66	2	Totalsanierte und gut geschnittene 2-Zimmerwohnung mit Einbauküche	15	40468	Hugo-Viehoff-Straße	51.2561	6.77897	\N
33543925	https://www.wohnungsboerse.net/immodetail/33543925	61	2	Tauschwohnung: 2- Zimmer + Balkon in Toplage in Unterbilk	32	40219	\N	51.2135	6.76234	\N
33543937	https://www.wohnungsboerse.net/immodetail/33543937	122	3	Luxus Altbauwohnung incl. neuer Einbauküche im Kernsanierten (Denkmal) KFW Effizienzhaus	22	40233	Hermannstraße	51.2303	6.8077	1908
33543940	https://www.wohnungsboerse.net/immodetail/33543940	80	3	Wohnen in Unterbach	84	40627	\N	51.2024	6.88388	1979
33544125	https://www.wohnungsboerse.net/immodetail/33544125	64	3	Tauschwohnung: Schöne Wohnung nahe Lorettostr, Medienhafen und Rhein	32	40217	\N	51.2127	6.7754	\N
33544205	https://www.wohnungsboerse.net/immodetail/33544205	78	4	Gut geschnittene 4 Zimmerwohnung mit Balkon in ruhiger Wohnlange: Düsseldorf-Knittkuhl.	74	40629	Am	51.2664	6.87107	1971
33544210	https://www.wohnungsboerse.net/immodetail/33544210	30	1	Apartment/auch HO: Exzellente und sehr ruhige Lage im Herzen von Oberkassel (Rheinnähe)	41	40545	\N	51.2284	6.75437	1960
33544256	https://www.wohnungsboerse.net/immodetail/33544256	40	1.5	Tauschwohnung: Superschöne Single oder Pärchenwohnung	32	40219	\N	51.2135	6.76234	\N
33544356	https://www.wohnungsboerse.net/immodetail/33544356	50	2	Tauschwohnung: 2 Zimmerwohnung am Hafen	32	40219	\N	51.2135	6.76234	\N
33544386	https://www.wohnungsboerse.net/immodetail/33544386	96.84	3	*Düsseltal* Erstbezug nach umfassender Renovierung - 3-Zi.-Gartengeschoßwohnung in zentraler Lage	23	40237	Hans-Sachs-Str.	51.2367	6.81099	1903
33544537	https://www.wohnungsboerse.net/immodetail/33544537	25	1	*City Apartment* All Inclusive	31	40215	\N	51.2149	6.78256	\N
33544560	https://www.wohnungsboerse.net/immodetail/33544560	76	2.5	Vollständig renovierte 2,5-Zimmer-Wohnung mit Südbalkon in Wuppertal Dönberg	56	42111	Ursulastraße	51.2968	7.16419	1970
33544567	https://www.wohnungsboerse.net/immodetail/33544567	47.46	2	2 Zimmerwohnung für Personen ab 60 Jahre	56	50169	Mühlengraben	50.9121	6.71169	\N
33544570	https://www.wohnungsboerse.net/immodetail/33544570	60	2	Freundliche 2-Zimmer-Wohnung zur Miete in 41541, Dormagen	56	41541	\N	51.1323	6.82687	1950
33544577	https://www.wohnungsboerse.net/immodetail/33544577	64	2	Stilvolle, geräumige und vollständig renovierte -Zimmer-Wohnung mit Balkon in Remscheid	56	42899	Richthofenstr.	51.2078	7.23771	2007
33544581	https://www.wohnungsboerse.net/immodetail/33544581	82	3	Gepflegte 3-Zimmer-Wohnung mit Balkon, bevorzugte Wohnlage in Gelsenkirchen-Resse	56	45892	Friedhofstraße	51.5874	7.11364	\N
33544590	https://www.wohnungsboerse.net/immodetail/33544590	110	3	Schöne 110 qm DG Maisonette-Wohnung mit 2 Sonnenbalkonen und 2 Bädern zu vermieten!	56	45739	Klein-Erkenschwicker-Strasse	51.6494	7.26316	1996
33546171	https://www.wohnungsboerse.net/immodetail/33546171	67	2	Schöne möblierte 2. Zimmer Wohnung in Stadtzentrum Düsseldorf	13	40211	Liesegangstraße	51.2261	6.78769	\N
33546509	https://www.wohnungsboerse.net/immodetail/33546509	52.2	2	Ideal geschnittene 2-Zimmer-Wohnung auf 52 m² inkl. Loggia	32	40217	Bachstraße	51.2081	6.7697	2015
33546732	https://www.wohnungsboerse.net/immodetail/33546732	89.11	2	***Wunderschöne 2-Zimmer-Wohnung mit Terrasse in Düsseldorf***	73	40629	Am	51.2455	6.84997	2009
33546839	https://www.wohnungsboerse.net/immodetail/33546839	60	2	Stilvolle, modernisierte 2-Zimmer-Wohnung mit Balkon und Einbauküche in Düsseldorf-Kaiserswerth	53	40489	\N	51.3305	6.76259	1989
33548090	https://www.wohnungsboerse.net/immodetail/33548090	64.19	3	Schicke 3-Raum-Wohnung in Düsseldorf-Unterrath	62	40468	Irenenstraße	51.2673	6.77814	\N
33548176	https://www.wohnungsboerse.net/immodetail/33548176	65	2	Helle freundliche 2-Zimmer-Wohnung in Mülheim an der Ruhr	97	45472	Udostraße	51.432	6.91156	1962
33548181	https://www.wohnungsboerse.net/immodetail/33548181	79.13	3	NSow	42	40549	\N	51.2331	6.71909	\N
33548521	https://www.wohnungsboerse.net/immodetail/33548521	84	3	Hochwertiges Wohnen im ehemaligen Servitinnen-Kloster: 3-Zimmer-Wohnung mit Balkonen und Einbauküche	84	40627	\N	51.2024	6.88388	1968
33548571	https://www.wohnungsboerse.net/immodetail/33548571	38	1	Tauschwohnung: Tausche 1-Zimmer Wohnung gegen 2-Zimmer Wohnung! :)	13	40211	\N	51.2301	6.79288	\N
33548591	https://www.wohnungsboerse.net/immodetail/33548591	90	3	*****Traumhaft sanierte 3 Zimmer Wohnung mit Balkon und 240 qm großem Garten in ruhiger Lage!*****	96	40593	Arnold-Schönberg-Str.	51.1527	6.88026	1970
33548624	https://www.wohnungsboerse.net/immodetail/33548624	95	3	Wunderbare Drei-Raum-Wohnung mit sonnigem Balkon	64	40470	Mörsenbroicher	51.2503	6.8184	\N
33548816	https://www.wohnungsboerse.net/immodetail/33548816	40	1	Modernes Appartement im Zentrum von Düsseldorf	13	40210	\N	51.2225	6.78772	\N
33548846	https://www.wohnungsboerse.net/immodetail/33548846	51.66	2	2 Zimmer wohnung in Düsseldorf mit Einbauküche	101	40595	Hermann-Ehlers-Straße	51.1433	6.89554	\N
33550628	https://www.wohnungsboerse.net/immodetail/33550628	154	3	Moderne und barrierefreie Stadt-Wohnung mit Tiefgarage  im Herzen von Oberkassel	41	40545	Salierstraße	51.2303	6.75731	2005
33550667	https://www.wohnungsboerse.net/immodetail/33550667	60.78	2	Ihr Weihnachtswunsch kann wahr werden !	22	40233	\N	51.2198	6.8119	1954
33550728	https://www.wohnungsboerse.net/immodetail/33550728	64	2	Freundliche 2-Zimmer-Wohnung mit Balkon und Einbauküche in dusseldof	101	40595	\N	51.1408	6.90507	\N
33550840	https://www.wohnungsboerse.net/immodetail/33550840	79	2	Tauschwohnung: Wunderschöne Wohnung in Kaiserswerth	53	40489	\N	51.3305	6.76259	\N
33552126	https://www.wohnungsboerse.net/immodetail/33552126	85	3	Tauschwohnung: Wunderschöne Altbauwohnung mit Balkon in Flingern-Nord	22	40235	\N	51.2294	6.82752	\N
33552145	https://www.wohnungsboerse.net/immodetail/33552145	28	1	Frisch saniertes 1-Zimmer Apartment	37	40227	Kölnerstr.	51.2185	6.801	\N
33552256	https://www.wohnungsboerse.net/immodetail/33552256	24.3	1	Möbliertes Apartment mit Balkon in Düsseldorf- Rath!	63	40472	Kanzlerstr.	51.2624	6.82259	1992
33552309	https://www.wohnungsboerse.net/immodetail/33552309	79.05	2.5	Erstbezug !!! 2,5-Zimmer-Wohnung mit Bürozimmer und Balkon	71	40625	Torfbruchstr.	51.2271	6.85772	2024
33552346	https://www.wohnungsboerse.net/immodetail/33552346	53.18	2	Gemütliches Wohnambiente: 2-Zimmer-Wohnung mit 53m², Wohnküche, Schlafzimmer und Bad mit Fenster	71	40627	Höherhofstraße	51.22	6.86505	1910
33552708	https://www.wohnungsboerse.net/immodetail/33552708	25	3	Einladendes Einzelzimmer in geräumiger Wohnung zu vermieten - greifen Sie jetzt zu und sichern Sie s	97	50226	\N	50.9123	6.816	\N
33552709	https://www.wohnungsboerse.net/immodetail/33552709	46	1	Modernes Wohnen in stylishen möblierten Apartment direkt am Rhein	97	51143	Bahnhofstr	50.8839	7.05525	1900
33554923	https://www.wohnungsboerse.net/immodetail/33554923	60	2	Exklusive, neuwertige 2-Zimmer-Wohnung mit Balkon und Einbauküche in Düsseldorf	71	40625	Radebergerstraße	51.2289	6.84808	2018
33554952	https://www.wohnungsboerse.net/immodetail/33554952	35	2	2 Zimmer-Wohnung in Düsseldorf Unterrath	62	40468	Auf	51.2732	6.79086	1965
33554994	https://www.wohnungsboerse.net/immodetail/33554994	68	3	Gepflegte 3-Zimmer-DG-Wohnung in Düsseldorf-Holthausen nähe Elbroichpark	93	40589	Bahlenstrasse	51.1778	6.82677	1962
33555138	https://www.wohnungsboerse.net/immodetail/33555138	105	3	Helle 3-Zimmer-Wohnung mit eigenem Garten in ruhiger Wohnlage	54	40489	\N	51.3305	6.76259	1960
33555182	https://www.wohnungsboerse.net/immodetail/33555182	38.9	2	Saniertes Appartement, TOP für Studenten	42	40549	Ardennenstraße	51.2263	6.69616	\N
33555215	https://www.wohnungsboerse.net/immodetail/33555215	56.14	2.5	Erdgeschoss! Sanierte 2- Zimmer Wohnung mit Balkon in Düsseldorf- Gerresheim ab dem 01.01.2024	71	40625	Bellscheidtstraße	51.2396	6.85436	1931
33555348	https://www.wohnungsboerse.net/immodetail/33555348	100	3	Tauschwohnung: Weitläufige 3-Zimmer Altbau-Wohnung mit Terrasse	13	40211	\N	51.2301	6.79288	\N
33555390	https://www.wohnungsboerse.net/immodetail/33555390	91	2	Stilvoll wohnen in Wittlaer - 2-Zimmer Maisonettewohnung im historischen Dreiflügelhaus	54	40489	\N	51.3305	6.76259	1908
33555498	https://www.wohnungsboerse.net/immodetail/33555498	60	2	Frisch Sanierte 2-Zimmer Wohnung mit 2 Balkone	36	40225	Stoffeler	51.195	6.77878	1972
33555506	https://www.wohnungsboerse.net/immodetail/33555506	43	2	Frisch Sanierte 2-Zimmer Wohnung mit Balkon	36	40225	Stoffeler	51.195	6.77878	1972
33555511	https://www.wohnungsboerse.net/immodetail/33555511	40	1	Frisch Sanierte 1-Zimmer Wohnung mit Terrasse	36	40225	Stoffeler	51.195	6.77878	1972
33555662	https://www.wohnungsboerse.net/immodetail/33555662	64	2	Neues Zuhause in Rath  -  in Nähe des Aaper Waldes !	63	40472	Oberratherstrasse	51.2649	6.82449	1968
33557209	https://www.wohnungsboerse.net/immodetail/33557209	62	3	3 Zimmer Altbau Charme in Flingern-Nord mit Balkon und Parkett	21	40223	Behrenstr.	51.2254	6.81187	\N
33557223	https://www.wohnungsboerse.net/immodetail/33557223	98	4	Möblierte Wohnung in ruhiger Lage, Düsseldorfs	63	40472	Herner	51.2621	6.80514	1972
33557375	https://www.wohnungsboerse.net/immodetail/33557375	28	1	Stilvolle 1-Zimmer-Wohnung mit Balkon und Einbauküche in Düsseldorf	53	40489	\N	51.3305	6.76259	\N
33557618	https://www.wohnungsboerse.net/immodetail/33557618	75	2	Erstbezug nach Renovierung: schöne 2-Zimmer-Wohnung mit Einbauküche in Grafental zur Miete	22	40235	Walter-Eucken-Straße	51.2327	6.82946	2020
33557681	https://www.wohnungsboerse.net/immodetail/33557681	75	2	Tauschwohnung: Neu sanierte Wochnung mit hohe Decken und schönem Stuck	64	40470	\N	51.2569	6.80771	\N
33560204	https://www.wohnungsboerse.net/immodetail/33560204	41.03	1	Ab April 2024: Single-Wohnung, frisch saniert, Düsseldorf-Holthausen, ruhige Lage	93	40589	Kiesselbachstraße	51.1701	6.83334	1953
33560231	https://www.wohnungsboerse.net/immodetail/33560231	55.27	2	Schöne 2-Zimmer Wohnung mit Balkon in Düsseldorf-Rath	63	40472	Rather	51.2627	6.80962	1928
33560234	https://www.wohnungsboerse.net/immodetail/33560234	53.85	2	Tolle EG-Wohnung mit Parkettboden in Derendorf	15	40476	Collenbachstr.	51.2441	6.78309	1913
33560362	https://www.wohnungsboerse.net/immodetail/33560362	150	3	Möblierte Luxus-Penthouse Wohnung mit Dachterrasse und Rheinblick!	34	40221	\N	51.1997	6.75072	2021
33560460	https://www.wohnungsboerse.net/immodetail/33560460	200	4.5	Die Wohnung Ihrer Träume direkt am Rheinufer	41	40549	\N	51.2331	6.71909	2003
33561496	https://www.wohnungsboerse.net/immodetail/33561496	30	1	Tauschwohnung: Wunderschöne Wohnung im Herzen Düsseldorfs abzugeben!	11	40213	\N	51.2221	6.77271	\N
33561557	https://www.wohnungsboerse.net/immodetail/33561557	65	2	Tauschwohnung: Helle moderne Zweizimmerwohnung mit großem Südbalkon	15	40476	\N	51.248	6.77902	\N
33562233	https://www.wohnungsboerse.net/immodetail/33562233	85	3	Lichtdurchflutete Wohnung mit gehobener Austattung im Benrather Mühlenquartier	95	40597	Max-Schmeling-Straße	51.1627	6.88022	2019
33562279	https://www.wohnungsboerse.net/immodetail/33562279	60	2	Möblierte 2-Zimmer-Wohnung mit zentraler Lage	37	40227	Ellerstraße	51.214	6.80267	1952
33562311	https://www.wohnungsboerse.net/immodetail/33562311	47	2	Traumschöne 2-Zimmerwohnung in Friedrichstadt	31	40215	\N	51.2149	6.78256	\N
33562350	https://www.wohnungsboerse.net/immodetail/33562350	50	2	Tauschwohnung:  Düsseldorf Altbau gegen Köln	36	40223	\N	51.1998	6.77225	\N
33562422	https://www.wohnungsboerse.net/immodetail/33562422	61	2	Tauschwohnung: Zwei Zimmer Wohnung mit Aussicht	91	40589	\N	51.1641	6.82144	\N
33562493	https://www.wohnungsboerse.net/immodetail/33562493	70	2	Helle 2-Zimmer-Wohnung mit Balkon und EBK in Derendorf	15	40476	Blumenthalstraße	51.2497	6.78058	\N
33562871	https://www.wohnungsboerse.net/immodetail/33562871	64	2	Wohnung mit Loft-Charakter in Flingern Nord	22	40235	Hoffeldstr.	51.2279	6.81447	\N
33562955	https://www.wohnungsboerse.net/immodetail/33562955	48	2	Helle Dachgeschoßwohnung Innenstadt	37	40227	Ellerstraße	51.215	6.8005	1958
33562972	https://www.wohnungsboerse.net/immodetail/33562972	55	2	Erstbezug nach Komplettsanierung in 2 Z-Whg, mit Küche und Einbauschränke in D-Pemepelfort	14	40477	Blücherstraße	51.2386	6.78329	1908
33563039	https://www.wohnungsboerse.net/immodetail/33563039	53	2	Tauschwohnung: Ich tausche schöne 2 Zimmerwohnung gegen 3 Zimmer	36	40225	\N	51.1974	6.78988	\N
33563088	https://www.wohnungsboerse.net/immodetail/33563088	56	2	Tauschwohnung: Lichtdurchflutete 2 Z.-Wohnung gegen min. 3-Z. in Düsseldorf	51	40474	\N	51.2738	6.74219	\N
33563103	https://www.wohnungsboerse.net/immodetail/33563103	80	3	Schöne 3-Zimmer-Wohnung im Herzen von Düsseldorf!	22	40235	\N	51.2294	6.82752	\N
33563140	https://www.wohnungsboerse.net/immodetail/33563140	30	2	Tauschwohnung: Suche Münster, biete Düsseldorf DG mit EBK	37	40227	\N	51.2154	6.79757	\N
33563212	https://www.wohnungsboerse.net/immodetail/33563212	65	2	In Düsseldorf: Gepflegte Wohnung mit zwei Zimmern, einem Badezimmer und zwei Balkonen	22	40235	Engerstraße	51.2313	6.81873	\N
33564039	https://www.wohnungsboerse.net/immodetail/33564039	100	3	Lichte Stadtwohnung =10206 = Friedrichstadt	31	40215	Corneliusstraße	51.2134	6.78238	1992
33564109	https://www.wohnungsboerse.net/immodetail/33564109	44	1	Neuwertige 1,5-Zimmer-Wohnung mit EBK in Düsseldorf	21	40233	\N	51.2198	6.8119	\N
33564140	https://www.wohnungsboerse.net/immodetail/33564140	40	1.5	Ab 01.12: ALL-IN Homeoffice Apartment Wohnung furnished möbliert	51	40474	Klapheckstraße	51.259	6.75581	\N
33564179	https://www.wohnungsboerse.net/immodetail/33564179	68	2	Neuwertige 2-Raum-Wohnung mit Balkon und Einbauküche in Düsseldorf	93	40589	\N	51.1641	6.82144	\N
33564205	https://www.wohnungsboerse.net/immodetail/33564205	126	4	ATEMBERAUBENDES WOHNEN AM SCHLOSS BENRATH	95	40597	\N	51.1638	6.87102	\N
33564317	https://www.wohnungsboerse.net/immodetail/33564317	75	3	FISCHER Str.,Düsseldorf-Pempelfort, Nähe Hofgarten, Rhein, 3 Zi., Bad, Sep. WC, exklusiver Garten.	14	40477	\N	51.2385	6.78498	1903
33564438	https://www.wohnungsboerse.net/immodetail/33564438	75	3	FISCHER Str.,Düsseldorf-Pempelfort, Nähe Hofgarten, Rhein, 3 Zi., Bad, Sep. WC, exklusiver Garten.	14	40477	\N	51.2385	6.78498	1903
33565029	https://www.wohnungsboerse.net/immodetail/33565029	70	2	Sehr schöne, gepflegte 2-Zimmerwohnung mit toller Terrasse!	21	40233	Werdener	51.2207	6.80828	2018
33565071	https://www.wohnungsboerse.net/immodetail/33565071	88	3	Luxuriöse 3 Zimmerwohnung mit Balkon und Kamin	15	40476	Glockenstr.	51.2452	6.78533	\N
33565077	https://www.wohnungsboerse.net/immodetail/33565077	57	2	Tauschwohnung: 2-Zimmer Altbauwohnung in Flingern	22	40235	\N	51.2294	6.82752	\N
33565203	https://www.wohnungsboerse.net/immodetail/33565203	47	2	Kernsanierte Wohnung mit 2. Zimmern und Süd-Balkon	82	40229	Butzbacher	51.198	6.82863	1968
33565240	https://www.wohnungsboerse.net/immodetail/33565240	65	3	Gemütliche 3-Raum-Wohnung. Bad mit Tageslicht. Frei zum 02.01.2024	52	47803	Dieselstrasse	51.3463	6.52652	1968
33565734	https://www.wohnungsboerse.net/immodetail/33565734	52	2	Wohnen mit Aussicht: Helle, gemütliche Altbauwohnung mit Südbalkon und Gartenblick	42	40549	Heerdter	51.2318	6.71523	1900
33565781	https://www.wohnungsboerse.net/immodetail/33565781	115.52	3	Erstbezug:3 Zimmerwohnung mit großer Süd-Terrasse	94	40599	Buchenstraße	51.177	6.85719	2023
33565868	https://www.wohnungsboerse.net/immodetail/33565868	62	2	Exklusive 2-Zimmer Wohnung in Golzheim	16	40474	Kaiserswerther	51.2442	6.77144	1972
33565901	https://www.wohnungsboerse.net/immodetail/33565901	89	4	GRAFENBERG/OSTPARK EXKLUSIV MIT EIGENEM GARTENANTEIL+BALKON RENOVIERT LAMINAT 1. ETAGE HELL + RUHIG	72	40629	Hardtstraße	51.2382	6.83435	1964
33565903	https://www.wohnungsboerse.net/immodetail/33565903	64.15	3	Sanierte 3-Zimmerwohnung mit Balkon in Düsseldorf-Eller	82	40229	von-Krüger-Str.	51.1985	6.8502	1960
33565930	https://www.wohnungsboerse.net/immodetail/33565930	67	2	Willkommen in Ihrem neuen Zuhause in der malerischen Düsseldorfer Stadtmitte!	13	40210	Klosterstraße	51.2241	6.78812	\N
33565975	https://www.wohnungsboerse.net/immodetail/33565975	102	3	3 Zimmer Wohnung in unmittelbarer Rheinnähe in Benrath	95	40597	Am	51.1601	6.8594	1980
33566730	https://www.wohnungsboerse.net/immodetail/33566730	44	2	Charmante Zwei-Zimmer-Altbau-Wohnung mit Erker im Herzen Unterbilks	32	40217	Sedanstr.	51.213	6.77134	1909
33566757	https://www.wohnungsboerse.net/immodetail/33566757	90	3.5	Kamper Weg 231, 40627 Düsseldorf	83	40627	\N	51.2024	6.88388	\N
33566839	https://www.wohnungsboerse.net/immodetail/33566839	65	2	Geschmackvolle Wohnung mit zwei Zimmern sowie Balkon und EBK in Benrath	95	40597	Kaiser-Friedrich-Straße	51.1627	6.86258	1938
33567049	https://www.wohnungsboerse.net/immodetail/33567049	79	3	Tauschwohnung: 3 Zimmer Wohnung Oberbilk	37	40227	\N	51.2154	6.79757	\N
33567052	https://www.wohnungsboerse.net/immodetail/33567052	62	2	City!Schöne 2-Zimmer-Wohnung mit Balkon!!!	13	40211	Klosterstr.	51.2246	6.78903	\N
33567145	https://www.wohnungsboerse.net/immodetail/33567145	130	3	Erstbezug nach Sanierung:schöne 3-Zimmer-Wohnung mit EBK Terrasse Kamin Einbauschrank OBK Düsseldorf	41	40549	Lohengrinstraße	51.2311	6.74054	1930
33567160	https://www.wohnungsboerse.net/immodetail/33567160	44	3	Gemütliche Dachgeschoß Wohnung in Düsseldorf-Bilk von Privat	36	40223	Suitbertusstraße	51.2065	6.76586	1950
33567171	https://www.wohnungsboerse.net/immodetail/33567171	46	2	SANIERTE MÖBLIERTE WOHNUNG IN ZENTRALER LAGE	13	40211	Leopoldstr.	51.2263	6.79249	1955
33568150	https://www.wohnungsboerse.net/immodetail/33568150	55	3	Sanierte 3-Zimmer-Wohnung in Düsseldorf mit Klimaanlage	51	40474	\N	51.2738	6.74219	1985
33568166	https://www.wohnungsboerse.net/immodetail/33568166	63	2	Provisionsfrei! Klassische Altbauwohnung, Erstbezug nach Sanierung	22	40235	Hoffeldstrasse	51.2271	6.81497	1913
33568292	https://www.wohnungsboerse.net/immodetail/33568292	71	2.5	Geschmackvolle Wohnung mit zweieinhalb Zimmern in Baumberg	97	40789	Holzweg	51.1234	6.89304	\N
33568328	https://www.wohnungsboerse.net/immodetail/33568328	42	1.5	Tauschwohnung: gemütliche Wohnung nähe Hbf gegen Kölner Wohnung	37	40227	\N	51.2154	6.79757	\N
33568372	https://www.wohnungsboerse.net/immodetail/33568372	66	2	Attraktive 2-Zimmer-Wohnung in Düsseldorf-Vennhausen mit Balkon und Garage	83	40627	\N	51.2024	6.88388	2011
33568443	https://www.wohnungsboerse.net/immodetail/33568443	120	3	Provisionsfrei: Oberkassel, sehr schöne, helle, freundl. 3 Zimmer Wohnung in ruhiger Lage	44	40547	\N	51.2419	6.74772	1984
33568636	https://www.wohnungsboerse.net/immodetail/33568636	82	2.5	Attraktive 2,5 Zimmerwohnung mit Garten in bester Lage Köln Junkersdorf	92	50858	Kirchweg	50.936	6.8638	\N
33571460	https://www.wohnungsboerse.net/immodetail/33571460	22	1	Singlewohnung Oberbilk 22m² Nachmieter gesucht!	37	40227	Oberbilker	51.2094	6.80455	\N
33571565	https://www.wohnungsboerse.net/immodetail/33571565	38	1.5	Modernisierte 1,5-Raum-Wohnung mit Einbauküche in Düsseldorf	91	40591	Werstener	51.1899	6.82489	\N
33571601	https://www.wohnungsboerse.net/immodetail/33571601	56.9	2	Zentral gelegene 2-Zimmer Wohnung in Düsseldorf	37	40227	Velberter	51.2181	6.79716	1987
33571647	https://www.wohnungsboerse.net/immodetail/33571647	91.5	3	Dachterrassenwohnung in dem Objekt Bilker Höfe	36	40223	Esmarchstraße	51.2079	6.78046	2012
33571784	https://www.wohnungsboerse.net/immodetail/33571784	100	2	Erstbezug - Moderne 2-Zimmer-Wohnung mit Südbalkon, Einbauküche und Tiefgaragenstellplatz	35	40221	\N	51.1997	6.75072	2023
33571818	https://www.wohnungsboerse.net/immodetail/33571818	49.64	2	2-Zimmerwohnung mit Sonnenbalkon in Düsseldorf-Eller	82	40229	von-Krüger-Str.	51.2005	6.84825	1960
33571866	https://www.wohnungsboerse.net/immodetail/33571866	63	2	Gemütliche 2 Zimmerwohnung	36	40225	Witzelstraße	51.2013	6.78787	2016
33571897	https://www.wohnungsboerse.net/immodetail/33571897	46	2	Tauschwohnung: TAUSCHWOHNUNG, Derendorf	15	40476	\N	51.248	6.77902	\N
33572057	https://www.wohnungsboerse.net/immodetail/33572057	148	4	Chice 4-Zimmer-Wohnung mit rückwertigem Balkon und herrlichem Ausblick auf den Rhein	16	40474	\N	51.2738	6.74219	1954
33572182	https://www.wohnungsboerse.net/immodetail/33572182	85.8	2	Exklusive, helle 2 Zimmerwohnung in grüner Lage von Mörsenbroich	64	40470	Zur	51.2469	6.81822	2015
33574117	https://www.wohnungsboerse.net/immodetail/33574117	90	3	Wunderschöne, vollmöblierte Maisonette Wohnung mit Dachterasse	31	40215	\N	51.2149	6.78256	\N
33574225	https://www.wohnungsboerse.net/immodetail/33574225	54	2	Gemütliche, möblierte Wohnung mit zwei Zimmern (54 m²) in Düsseldorf-Rath	63	40472	\N	51.2685	6.83379	\N
33574264	https://www.wohnungsboerse.net/immodetail/33574264	150	3.5	Tauschwohnung: Wunderschöne Gartenwohnung mit Holzofen	62	40468	\N	51.2612	6.7789	\N
33574301	https://www.wohnungsboerse.net/immodetail/33574301	51	2	Gemütlich 2-Zimmer Wohnung in D´dorf-Unterbilk!	32	40219	Benzenbergstraße	51.2096	6.76676	1955
33574371	https://www.wohnungsboerse.net/immodetail/33574371	50	2	Tauschwohnung: perfekt aufgeteilte 2-Zimmer Wohnung mit Balkon	15	40476	\N	51.248	6.77902	\N
33574494	https://www.wohnungsboerse.net/immodetail/33574494	43	2	Top-Apartment in zentraler Lage / Friedrichstadt	31	40215	Gustav-Poensgen-Strasse	51.2121	6.78845	1950
33574507	https://www.wohnungsboerse.net/immodetail/33574507	40	2	Tauschwohnung: Biete Unterbilk, suche Düsseltal, 2 Zimmer	32	40217	\N	51.2127	6.7754	\N
33574550	https://www.wohnungsboerse.net/immodetail/33574550	58	2	exklusive 2-Zimmerwohnung im Portobello Nähe Medienhafen- mit Panoramablick auf Düsseldorf	32	40219	Ernst-Gnoß-Straße	51.216	6.76307	2003
33574566	https://www.wohnungsboerse.net/immodetail/33574566	52	2	Gemütliches 2 Zimmer DG-Appartement auf zwei Ebenen	36	40225	Himmelgeister	51.1989	6.78184	1995
33574602	https://www.wohnungsboerse.net/immodetail/33574602	74.22	2	Einzigartige Dachgeschosswohnung mit zwei Balkonen	71	40625	Märkische	51.2333	6.85884	1914
33574636	https://www.wohnungsboerse.net/immodetail/33574636	75	4	2 Zimmer Wohnung + 2 Mansardenzimmer in Gerresheim	71	40625	Von-Gahlen-Str.	51.2365	6.85158	1936
33574690	https://www.wohnungsboerse.net/immodetail/33574690	25	1	*City Apartment* All Inclusive	31	40215	\N	51.2149	6.78256	1954
33574691	https://www.wohnungsboerse.net/immodetail/33574691	26	1	*City Apartment* 1 Zimmer-Apartment Möbliert inkl. W-Lan & TV	31	40215	Mintropstr.	51.2179	6.78965	1954
33574764	https://www.wohnungsboerse.net/immodetail/33574764	82	2.5	Helle und renovierte Wohnung mit Balkon Düsseltal	23	40239	Düsselkämpchen	51.2423	6.798	\N
33574808	https://www.wohnungsboerse.net/immodetail/33574808	102	3	Sehr schöne und ruhige Wohnung auf zwei Ebenen in Düsseldorf-Wittlaer	54	40489	Postenweg	51.3248	6.74216	1969
33576087	https://www.wohnungsboerse.net/immodetail/33576087	60	2	2,5-Zimmer Wohnung mit Balkon in Düsseltal	23	40239	\N	51.2453	6.80322	\N
33576144	https://www.wohnungsboerse.net/immodetail/33576144	64	3.5	3-R-Wohnung in Oberkassel	41	40545	Quirinstraße	51.235	6.75294	1960
33576147	https://www.wohnungsboerse.net/immodetail/33576147	77.15	3	47110/134 3-Zimmer-Dachgeschoss-Wohnung in Mörsenbroich	64	40470	St-Franziskus-Straße	51.2552	6.80864	1953
33576153	https://www.wohnungsboerse.net/immodetail/33576153	63	2	STADTMENSCH SUCHT STADTWOHNUNG - TOLLE  INNENSTADTLAGE - BALKON UND AUFZUG!	31	40215	Bunsenstraße	51.2149	6.78792	\N
33576182	https://www.wohnungsboerse.net/immodetail/33576182	70.82	2	47124/48 2-Zimmer-Wohnung im Neubau mit Terrasse und Gartenstück sowie zusätzlichem Balkon	63	40472	Am	51.2652	6.81769	2023
33576199	https://www.wohnungsboerse.net/immodetail/33576199	52	2	Gemütliche 2-Raum-Balkon- Wohnung sucht Liebhaber! Merowinger Straße	36	40225	Merowinger	51.2002	6.77669	1959
33576292	https://www.wohnungsboerse.net/immodetail/33576292	100	3	Tauschwohnung: Großzügige 3-Zimmerwohnung mit Balkon am Volksgarten	37	40227	\N	51.2154	6.79757	\N
33576403	https://www.wohnungsboerse.net/immodetail/33576403	70	4	Tauschwohnung: Große Wohnung	83	40627	\N	51.2024	6.88388	\N
33576553	https://www.wohnungsboerse.net/immodetail/33576553	65	2	Großzügige, offen gestaltete 2 Zimmer-Wohnung in zentraler Lage mit moderner Ausstattung und EBK	13	40211	Worringer	51.226	6.79617	1955
33576605	https://www.wohnungsboerse.net/immodetail/33576605	50	2	Nachmieter gesucht für sehr schöne 2 Zimmerwohnung in Wersten \nKölner Landstraße, 40589 Düsseldorf	91	40589	Kölner	51.1854	6.82037	\N
33576669	https://www.wohnungsboerse.net/immodetail/33576669	95	3	BENRATH - MODERNE HELLE WOHNUNG INKL: EINBAUKÜCHE UND BALKON	95	40597	\N	51.1638	6.87102	1933
33576712	https://www.wohnungsboerse.net/immodetail/33576712	30	1	City-Appartement, frei ab 01.12.2023	11	40213	\N	51.2221	6.77271	1932
33576718	https://www.wohnungsboerse.net/immodetail/33576718	95	4	Schöne Maisonette Wohnung mit neuer Einbauküche	71	40625	Scheerenburger	51.2241	6.86314	1938
33578357	https://www.wohnungsboerse.net/immodetail/33578357	40	2	Schöne Wohnung mit zwei Zimmern in Düsseldorf	34	40221	Hammer	51.21	6.74234	1900
33578486	https://www.wohnungsboerse.net/immodetail/33578486	50	2	Teilmöblierte 2-Zimmer-Wohnung mit EBK und Balkon	81	40231	\N	51.2135	6.83024	\N
33578504	https://www.wohnungsboerse.net/immodetail/33578504	85	2	Düsseldorf-Pempelfort, eine "andere Wohnung" von unserem Mieter-Designer bewohnt und gesta	14	40477	Rochusstrasse	51.2345	6.78564	1960
33578524	https://www.wohnungsboerse.net/immodetail/33578524	71	2	Brehmstraße 42, 40239 Düsseldorf	23	40239	\N	51.2453	6.80322	1954
33578535	https://www.wohnungsboerse.net/immodetail/33578535	35	1	1-Zimmer-Wohnung in Düsseldorf (Flingern) mit EBK	22	40233	\N	51.2198	6.8119	\N
33578590	https://www.wohnungsboerse.net/immodetail/33578590	60.14	2	Ab 01.04: Sanierte Wohnung in Düsseldorf-Oberbilk mit Balkon	37	40227	Flügelstr.	51.2138	6.80097	1965
33578717	https://www.wohnungsboerse.net/immodetail/33578717	53	2	Tauschwohnung: Tausche 2 Zimmerwohnung Düsseldorf gegen Köln	21	40233	\N	51.2198	6.8119	\N
33578811	https://www.wohnungsboerse.net/immodetail/33578811	89	3	GRAFENBERG/OSTPARK EXKLUSIV MIT EIGENEM GARTENANTEIL+BALKON RENOVIERT LAMINAT 1. ETAGE HELL + RUHIG	72	40629	Hardtstraße	51.2382	6.83435	1964
33578831	https://www.wohnungsboerse.net/immodetail/33578831	65	3	Direkte Zooparklage in Düsseltal mit Balkon, 3 Zimmer, WG-geeignet	23	40239	Brehmstraße	51.2385	6.80232	1960
33579012	https://www.wohnungsboerse.net/immodetail/33579012	58	2	Schöne Single- Dachgeschosswohnung mit Sonnen-Terrasse * Besichtigung 04.12.23 ab 17:00 Uhr	15	40476	\N	51.248	6.77902	1960
33579566	https://www.wohnungsboerse.net/immodetail/33579566	90	3	3-Raum-EG-Wohnung mit Garten in Unterrath	62	40472	\N	51.2685	6.83379	2002
33579780	https://www.wohnungsboerse.net/immodetail/33579780	65	2	Flingern: behagliche 2 Zimmer-Wohnung mit Balkon in ruhiger Seitenstraße	21	40233	Engelbertstr.	51.2222	6.80847	\N
33579818	https://www.wohnungsboerse.net/immodetail/33579818	74	4	Stadt-Mitte Düsseldorf Schöne 4-Zimmerwohnung	22	40233	Ackerstraße	51.2279	6.80178	1950
33579841	https://www.wohnungsboerse.net/immodetail/33579841	90	3	3 Raum-Wohnung mit großzügiger Küche und PKW-Stellplätzen	81	40231	Posener	51.2156	6.8383	1975
33579929	https://www.wohnungsboerse.net/immodetail/33579929	55.3	2	Ideal für Singles oder Paare - 2 Zimmer in Wuppertal Barmen	92	42287	Meckelstr.	51.2632	7.19051	1938
33579971	https://www.wohnungsboerse.net/immodetail/33579971	359	7	"Haus-im-Haus": große Garten-Maisonette mit Appartement im Düsseldorfer Zooviertel	23	40237	\N	51.2357	6.80917	1985
33579993	https://www.wohnungsboerse.net/immodetail/33579993	60	2	Möbliertes Wohnen. Gemütliche 2-Zimmer-Wohnung in unmittelbarer Rheinnähe in Kaiserswerth	53	40489	\N	51.3305	6.76259	1972
33580271	https://www.wohnungsboerse.net/immodetail/33580271	26.61	1	Moderne 1-Zimmer Dachgeschosswohnung in Düsseldorf - Derendorf	15	40476	Rather	51.2542	6.78558	1961
33580274	https://www.wohnungsboerse.net/immodetail/33580274	52.49	2	Moderne 2-Zimmer Etagenwohnung in Düsseldorf - Derendorf	15	40476	Rather	51.2542	6.78558	1961
33580275	https://www.wohnungsboerse.net/immodetail/33580275	44.97	2	Moderne 2-Zimmer Erdgeschosswohnung in Düsseldorf - Derendorf	15	40468	Schimmelbuschstraße	51.2543	6.78412	1961
33580276	https://www.wohnungsboerse.net/immodetail/33580276	63.68	3	Moderne 3-Zimmer Erdgeschosswohnung in Düsseldorf - Derendorf mit Balkon	23	40237	Vautierstr.	51.2425	6.82	1960
33580277	https://www.wohnungsboerse.net/immodetail/33580277	64.52	3	Moderne 3-Zimmer Erdgeschosswohnung in Düsseldorf - Düsseltal	23	40237	Simrockstr.	51.2402	6.82108	1961
33580278	https://www.wohnungsboerse.net/immodetail/33580278	29.9	1	Moderne 1-Zimmer Etagenwohnung in Düsseldorf - Mörsenbroich	23	40239	Heinrichstraße	51.2488	6.80387	1963
33580279	https://www.wohnungsboerse.net/immodetail/33580279	31.25	1	Moderne 1-Zimmer Etagenwohnung in Düsseldorf - Mörsenbroich	23	40239	Heinrichstraße	51.2488	6.80387	1963
33580280	https://www.wohnungsboerse.net/immodetail/33580280	74.89	3	Moderne 3-Zimmer Etagenwohnung in Düsseldorf - Mörsenbroich	23	40239	Heinrichstraße	51.2491	6.80334	1963
33580297	https://www.wohnungsboerse.net/immodetail/33580297	23	1	Appartment komplett möbliert in Düsseldorf Gerresheim	71	40625	\N	51.2358	6.85232	1976
33581953	https://www.wohnungsboerse.net/immodetail/33581953	78	3	Exklusive 3-Zimmer-Wohnung mit Balkon und EBK in Düsseldorf	14	40477	Jülicherstr.	51.2423	6.78483	\N
33581970	https://www.wohnungsboerse.net/immodetail/33581970	60	2	Sonnenstraße 36, 40227 Düsseldorf	37	40227	Sonnenstraße	51.2127	6.79633	1980
33581974	https://www.wohnungsboerse.net/immodetail/33581974	70	2	Modernisierte Wohnung mit zwei Zimmern und EBK in Düsseldorf	31	40217	\N	51.2127	6.7754	1922
33582044	https://www.wohnungsboerse.net/immodetail/33582044	90	3.5	Traum-Wohnung mit Aussicht	36	40225	\N	51.1974	6.78988	\N
33582106	https://www.wohnungsboerse.net/immodetail/33582106	58	2	Gemütliche 2,5-Zimmer-Dachgeschosswohnung in Düsseldorf-Heerdt	42	40549	\N	51.2331	6.71909	1922
33582134	https://www.wohnungsboerse.net/immodetail/33582134	85.03	2	Gemütliche 2 Zimmer Wohnung in Oberkassel	41	40549	Schanzenstr.	51.2329	6.74066	1971
33582147	https://www.wohnungsboerse.net/immodetail/33582147	95.2	3	Exklusive 3-Zimmer, 11. Etage, hochwertig teil-möbliert mit Blick über Park und City	14	40211	Toulouser	51.2345	6.79546	2017
33582149	https://www.wohnungsboerse.net/immodetail/33582149	61	2	Schöne helle 2-Zimmer- Wohnung zu vermieten	32	40217	Kronenstraße	51.2105	6.77377	1952
33582156	https://www.wohnungsboerse.net/immodetail/33582156	51	1	Gemütliches 1-Zimmerapartment mit separater Küche im begehrten Düsseltal!	23	40239	Windscheidstraße	51.2443	6.79885	1955
33582178	https://www.wohnungsboerse.net/immodetail/33582178	70	2	Moderne 2-Zimmer-Wohnung im beliebten Viertel	15	40476	Tannenstraße	51.2508	6.7799	\N
33582205	https://www.wohnungsboerse.net/immodetail/33582205	76	2	Schöne helle 2-Zimmer-Wohnung zu vermieten	32	40217	Kronenstraße	51.2105	6.77377	1952
33582215	https://www.wohnungsboerse.net/immodetail/33582215	55	2	Tauschwohnung: 55 q² in Düsseldorf Golzheim/Derendorf	16	40476	\N	51.248	6.77902	\N
33582266	https://www.wohnungsboerse.net/immodetail/33582266	140	3	Helle, geräumige 3-Zimmer-Wohnung mit Balkon in Düsseldorf-Grafenberg	72	40235	Geibelstr.	51.2413	6.82327	1972
33582275	https://www.wohnungsboerse.net/immodetail/33582275	80	2	Einzigartiger Luxus-Wohntraum in TOP-Lage - Kernsanierter Altbau	41	40549	Carmenstr.	51.2308	6.74178	1954
33582383	https://www.wohnungsboerse.net/immodetail/33582383	58	2	Schön geschnittene 2-Zimmerwohnung mit Balkon	37	40227	\N	51.2154	6.79757	\N
33582507	https://www.wohnungsboerse.net/immodetail/33582507	44.04	1	***Gepflegtes 1-Zimmer Apartment mit Balkon***	13	40210	Friedrich-Ebert-Str.	51.2224	6.7879	1956
33583631	https://www.wohnungsboerse.net/immodetail/33583631	84	2	3 Zimmer Etagen-Wohnung mit Balkon in Düsseldorf Bild zu vermieten	36	40225	\N	51.1974	6.78988	2006
33583666	https://www.wohnungsboerse.net/immodetail/33583666	46	1	Wohnung mit Dachterrasse zwischen Heerdt und Oberkassel	42	40549	Hansaallee	51.2381	6.73321	\N
33583866	https://www.wohnungsboerse.net/immodetail/33583866	60.72	2	Frisch modernisierte 2-Zi-Whg. im beliebten D-dorf-Rath	63	40472	Rather	51.2602	6.81509	1983
33583867	https://www.wohnungsboerse.net/immodetail/33583867	50.34	2	2-Zimmer-Wohnung zu vermieten	101	40595	Peter-Behrens-Straße	51.1438	6.89584	1968
33583877	https://www.wohnungsboerse.net/immodetail/33583877	85	3	Tauschwohnung: Tausche 3 Zimmer Traumwohnung gegen Haus	36	40225	\N	51.1974	6.78988	\N
33583884	https://www.wohnungsboerse.net/immodetail/33583884	93.9	3	** NOCH VERMIETET** 3-Zimmer-Etagenwohnung mit Balkon in D-Flingern	21	40235	Dorotheenstr.	51.226	6.81112	\N
33583944	https://www.wohnungsboerse.net/immodetail/33583944	61	2	°Direkt einziehen + Wohnfühlen° renovierte, helle 2 Zimmer & Balkon, Parkett, Tageslichtbad, Aufzug	42	40549	Schiessstraße	51.2335	6.71984	1970
33584081	https://www.wohnungsboerse.net/immodetail/33584081	57.55	2	Neu: Ideal geschnittene 2-Zimmer-Wohnung mit Loggia in Düsseldorf!	93	40589	Bonner	51.1714	6.83789	1929
33584182	https://www.wohnungsboerse.net/immodetail/33584182	45.13	2	Top-sanierte tolle Wohnung sucht Mieter.	42	40549	Burgunderstr.	51.2261	6.69869	2022
33584297	https://www.wohnungsboerse.net/immodetail/33584297	34	1	Gemütliche 1 Zimmer Wohnung	82	40231	\N	51.2135	6.83024	\N
33584300	https://www.wohnungsboerse.net/immodetail/33584300	73.5	2.5	Ansprechende 2,5-Raum-Wohnung mit EBK und Balkon in Düsseldorf	96	40593	Göppingerstr.	51.1483	6.87396	1984
33584315	https://www.wohnungsboerse.net/immodetail/33584315	66	2	Derendorf Platz der Ideen - Nähe Nordfriedhof - Erstbezug nach Kernsanierung	15	40468	\N	51.2612	6.7789	\N
33584331	https://www.wohnungsboerse.net/immodetail/33584331	58	2	Schöne DG-Whg. mit tollem Bad u. großer Küche in Benrath, EBK Übernahme erwünscht	95	40597	Paulsmühlenstraße	51.1643	6.88233	1920
33584351	https://www.wohnungsboerse.net/immodetail/33584351	70.3	3	Zugvogel sucht Nest? - 3 Zimmer möbliert mieten, wunderbar wohnen - im HUMMINGBIRD	23	40470	Münsterstraße	51.2485	6.79775	2022
33585861	https://www.wohnungsboerse.net/immodetail/33585861	43	2	Schicke, helle Stadtwohnung im Herzen von Pempelfort	14	40211	Düsselthaler	51.2332	6.79154	1958
33585982	https://www.wohnungsboerse.net/immodetail/33585982	26	2	!Für Studenten attraktiv! Geschmackvolle DG-Wohnung mit zwei Zimmern in Düsseldorf	14	40211	\N	51.2301	6.79288	\N
33586052	https://www.wohnungsboerse.net/immodetail/33586052	55	2	Sehr schöne 2-Zimmer Wohnung mit Einbauküche, Holzdielen und Altbaucharme	37	40227	Sonnenstr.	51.2125	6.79152	\N
33586061	https://www.wohnungsboerse.net/immodetail/33586061	100	2	Tauschwohnung: Besondere, loftartige Maisonette-Wohnung in DUS gegen Köln	13	40210	\N	51.2225	6.78772	\N
33586087	https://www.wohnungsboerse.net/immodetail/33586087	70	3	Tauschwohnung: Tausche 70qm, 3Z+KDB, Altbau gg. kl. Wohnung Flingern-Nord	22	40235	\N	51.2294	6.82752	\N
33586190	https://www.wohnungsboerse.net/immodetail/33586190	223.64	5	Herrschaftliches Wohnen mit Rheinblick am Kaiser-Wilhelm-Ring	41	40545	\N	51.2284	6.75437	1901
33586206	https://www.wohnungsboerse.net/immodetail/33586206	43	1	Tauschwohnung: 1 Zimmer Wohnung mit Balkon gegen 2 Zimmer-Wohnung	14	40477	\N	51.2385	6.78498	\N
33586252	https://www.wohnungsboerse.net/immodetail/33586252	73	2.5	Tauschwohnung: 2,5-Zimmer Wohnung in Pempelfort	14	40477	\N	51.2385	6.78498	\N
33586970	https://www.wohnungsboerse.net/immodetail/33586970	41	1.5	Stilvolle, modernisierte 1,5-Zimmer-Erdgeschosswohnung mit EBK in Düsseldorf	15	40476	Füsilierstraße	51.2508	6.7813	\N
33587009	https://www.wohnungsboerse.net/immodetail/33587009	34	1	1-Zimmerwohnung in Uninähe/Bilk	38	40225	Himmelgeister	51.193	6.78403	\N
33587062	https://www.wohnungsboerse.net/immodetail/33587062	74	2	Medienhafen!! Rheinlage! Balkon :-))	32	40219	Wupperstraße	51.2145	6.75756	\N
33587101	https://www.wohnungsboerse.net/immodetail/33587101	83	2	2-Zimmer-EG-Wohnung - hochwertige Einbauküche - eigene Terrasse - Tiefgaragenstellplatz	36	40221	\N	51.1997	6.75072	2023
33587205	https://www.wohnungsboerse.net/immodetail/33587205	48	2	In Düsseldorf: Gepflegte Wohnung mit zwei Zimmern und Balkon	81	40231	Tulpenweg	51.2144	6.83047	1965
33587284	https://www.wohnungsboerse.net/immodetail/33587284	98.2	3	Exklusive 3-Zimmer-Wohnung mit Südbalkon und Einbauküche / TG-Stellplatz mit 22 kW Wallbox	22	40235	\N	51.2294	6.82752	2017
33587329	https://www.wohnungsboerse.net/immodetail/33587329	85	3	Tauschwohnung: Tausche eine 3 Zimmer Wohnung gegen eine 2 Zimmer Wohnung	13	40212	\N	51.2236	6.78053	\N
33587369	https://www.wohnungsboerse.net/immodetail/33587369	80	3	Exklusives Wohnen in Düsseldorf-Pempelfort! Aufzug, Küche und noch vieles mehr!	14	40477	Nordstraße	51.2378	6.77939	2019
33587504	https://www.wohnungsboerse.net/immodetail/33587504	56.6	2	Moderne 2-Zimmer Etagenwohnung in Düsseldorf - Derendorf mit Balkon	15	40476	Kanonierstr.	51.25	6.77764	1937
33589155	https://www.wohnungsboerse.net/immodetail/33589155	78	3	Moderne 3-Zimmer-Wohnung in Düsseldorf-Unterbilk mit Balkon	32	40223	Martinstr.	51.2102	6.76278	\N
33589244	https://www.wohnungsboerse.net/immodetail/33589244	86	2.5	Tauschwohnung: Helle offene DG Wohnung ohne Schrägen	93	40589	\N	51.1641	6.82144	\N
33589277	https://www.wohnungsboerse.net/immodetail/33589277	82	4	Einziehen und wohlfühlen! Gemütliche, geräumige und helle 4 Zimmer Wohnung, im Eller-Zentrum	82	40229	Anhalterstraße	51.2011	6.83722	1970
33589367	https://www.wohnungsboerse.net/immodetail/33589367	83	3	Tauschwohnung: 3,5ZKDB Düsseldorf und Suche 2ZKDB in Düsseldorf oder Köln	62	40472	\N	51.2685	6.83379	\N
33589476	https://www.wohnungsboerse.net/immodetail/33589476	76.05	2	moderne 2-Zimmerwohnung mit großer Dachterrasse und Gäste-WC in Gerresheim!	73	40629	Am	51.2462	6.84828	2002
33589487	https://www.wohnungsboerse.net/immodetail/33589487	95	2.5	Tauschwohnung: große 2,5 Zimmer 95 qm/2 Wohnung, im Tausch gegen 60 qm/2	64	40470	\N	51.2569	6.80771	\N
33589729	https://www.wohnungsboerse.net/immodetail/33589729	65.34	3	Schöne 3-Zimmer-Wohnung zur Miete in Düsseldorf-Pempelfort (nur telef. Kontakt)	14	40477	\N	51.2385	6.78498	1953
33589756	https://www.wohnungsboerse.net/immodetail/33589756	46	2	Sanierte 2 Zi. KDB Balkon und EBK in Düsseldorf-City	13	40210	Bismarckstr.	51.2225	6.78472	1958
33589759	https://www.wohnungsboerse.net/immodetail/33589759	120	4	Erstbezug: stilvolle 4-Zimmer-Maisonette-Wohnung mit Sommergarten in Düsseldorf	55	40489	\N	51.3305	6.76259	2020
33589815	https://www.wohnungsboerse.net/immodetail/33589815	105	4	Traumhafte 4-Zimmer-Wohnung ruhig gelegen in absoluter Innenstadtlage von Neuss	52	41460	\N	51.2075	6.70631	1960
33589822	https://www.wohnungsboerse.net/immodetail/33589822	42.9	2	Bahnhofsnähe in Kempen !!! Gemütliche 2-Zimmerwohnung im EG	52	47906	Verbindungsstr.	51.3663	6.42928	1954
33590642	https://www.wohnungsboerse.net/immodetail/33590642	71.7	2	Neubau-Gartenwohnung mit Einbauküche -  Projekt "Am Quellenbusch" in Gerresheim	71	40625	Pirnaer	51.2276	6.85316	2023
33590777	https://www.wohnungsboerse.net/immodetail/33590777	171	4	Zoo/Düsseltal: luxuriöse 4 Zimmer-Garten-Maisonette-Wohnung im New-York-Loft-Stil.	23	40239	\N	51.2453	6.80322	2021
33590803	https://www.wohnungsboerse.net/immodetail/33590803	50	1	Tauschwohnung: Wunderschöne Maisonette Wohnung	22	40235	\N	51.2294	6.82752	\N
33590892	https://www.wohnungsboerse.net/immodetail/33590892	65	2	Tauschwohnung: Schöne, helle 2 Zimmer Altbau Wohnung mit Sonnenbalkon	36	40223	\N	51.1998	6.77225	\N
33590939	https://www.wohnungsboerse.net/immodetail/33590939	57	2	Objekt nicht gefunden	41	40545	\N	51.2284	6.75437	2013
33591071	https://www.wohnungsboerse.net/immodetail/33591071	74	2	Tauschwohnung: 2Z Düsseldorf gegen 1-2Z in Köln.	81	40231	\N	51.2135	6.83024	\N
33591293	https://www.wohnungsboerse.net/immodetail/33591293	49	2	DÜSSELDORF - ZENTRUM: HELLE 2 ZIMMER WOHNUNG IN CITY LAGE!	31	40215	Herzogstraße	51.2156	6.782	1957
33592705	https://www.wohnungsboerse.net/immodetail/33592705	38	1	Pöhlenweg 3, 40629 Düsseldorf	72	40629	Pöhlenweg	51.2403	6.83346	\N
33594616	https://www.wohnungsboerse.net/immodetail/33594616	72	2	2 Zimmer Wohnung mit Blick über ganz Wuppertal	97	42119	Cronenbergerstr.	51.2367	7.14699	1972
33592784	https://www.wohnungsboerse.net/immodetail/33592784	110	4	Helle 4 Zimmer Altbauwohnung mit großem Süd-Balkon und Garten Ideal für Kreative in Heerdt	42	40549	Heerdter	51.2318	6.71523	1900
33592796	https://www.wohnungsboerse.net/immodetail/33592796	81	1	Außergewöhnliche Dachgeschosswohnung mit großer Südterrasse-ab sofort verfügbar	16	40476	\N	51.248	6.77902	2007
33592937	https://www.wohnungsboerse.net/immodetail/33592937	58	2	Tauschwohnung: Ich, 30, w, ledig suche nach einem neuen Zuhause	32	40219	\N	51.2135	6.76234	\N
33592957	https://www.wohnungsboerse.net/immodetail/33592957	50	2	Tauschwohnung: Suche 3 Zimmer /biete 2 ZimmerWohnung saniert mit Balkon	62	40468	\N	51.2612	6.7789	\N
33592994	https://www.wohnungsboerse.net/immodetail/33592994	140	4	Luxuriös ausgestattete 4-Zimmer-Wohnung mit traumhaftem Rheinblick	16	40474	\N	51.2738	6.74219	1926
33593024	https://www.wohnungsboerse.net/immodetail/33593024	75	2	Modern möblierte 2-Zimmer-Wohnung mit Balkon	15	40476	Golzheimer	51.2456	6.78162	1971
33593028	https://www.wohnungsboerse.net/immodetail/33593028	92	3	Golzheimer Traumblick – frisch renovierte 3-Zimmer-Wohnung am Nordpark	16	40474	Friedrich-Lau-Straße	51.2555	6.75671	1960
33593040	https://www.wohnungsboerse.net/immodetail/33593040	75	2	Tauschwohnung: Biete Düsseldorf, suche Berlin	14	40211	\N	51.2301	6.79288	\N
33593057	https://www.wohnungsboerse.net/immodetail/33593057	32.6	1	1 Zi. Wohnung mit separater Küche, Wannenbad, Dachterrasse & Klimaanlage * zentrale & beliebte Lage	36	40223	\N	51.1998	6.77225	1956
33593059	https://www.wohnungsboerse.net/immodetail/33593059	37	1	Apartment am Zoopark / Düsseltal	23	40239	\N	51.2453	6.80322	1960
33593060	https://www.wohnungsboerse.net/immodetail/33593060	70	2	Komplett renoviert mit Terrasse und Balkon, in der Nähe der ISD und St. George's	54	40489	An	51.3238	6.74093	\N
33593062	https://www.wohnungsboerse.net/immodetail/33593062	130	4.5	Erstbezug, hochwertig mit Garten in der nähe von ISD und St. George School, in bester Lage	54	40489	\N	51.3305	6.76259	\N
33593092	https://www.wohnungsboerse.net/immodetail/33593092	50	2.5	Tauschwohnung: Tausche kleinere gegen größere Altbauwohnung in Flingern	22	40233	\N	51.2198	6.8119	\N
33593100	https://www.wohnungsboerse.net/immodetail/33593100	47.5	2	Schön ruhig und trotzdem zentral - 2-Zimmer-Wohnung nah am Fürstenplatz	31	40215	Philipp-Reis-Str.	51.2116	6.78521	1900
33593130	https://www.wohnungsboerse.net/immodetail/33593130	50	2	Tauschwohnung: Helle neuwertige 2-Zimmer Wohnung in Oberbilk	37	40227	\N	51.2154	6.79757	\N
33593157	https://www.wohnungsboerse.net/immodetail/33593157	50	2	Schöne 2-Zimmer-Wohnung in D-Hamm zu vermieten!	34	40221	\N	51.1997	6.75072	\N
33593179	https://www.wohnungsboerse.net/immodetail/33593179	29	1	Kernsanierung abgeschlossen - Innenstadtappartement für nette/n Mieter/in !	13	40211	Hohenzollernstrasse	51.2252	6.79005	1959
33593315	https://www.wohnungsboerse.net/immodetail/33593315	92	3	Nähe neue FH: sehr helle 3-Zimmer-DG Wohnung (WG-geeignet)	14	40477	Schloßstr.	51.2403	6.78961	1910
33593793	https://www.wohnungsboerse.net/immodetail/33593793	47	1	Pionierstraße 7, 40215 Düsseldorf	31	40215	Pionierstraße	51.2182	6.78548	\N
33593849	https://www.wohnungsboerse.net/immodetail/33593849	111	2.5	Über den Dächern von Düsseldorf - 2,5 Zimmer mit großer Dachterrasse	31	40215	\N	51.2149	6.78256	\N
33593894	https://www.wohnungsboerse.net/immodetail/33593894	39.76	1	Attraktives Appartement in zentraler Lage	36	40223	Kinkelstr.	51.2003	6.77299	1941
33593898	https://www.wohnungsboerse.net/immodetail/33593898	64	3	Tauschwohnung: Schöne Wohnung nahe Lorettostr, Medienhafen und Rhein	32	40217	\N	51.2127	6.7754	\N
33594001	https://www.wohnungsboerse.net/immodetail/33594001	55.92	2	Was will man mehr? Sanierte 2-Zimmer-Wohnung mit Balkon	62	40472	Mintarder	51.2771	6.79171	1966
33594011	https://www.wohnungsboerse.net/immodetail/33594011	68.59	3	Tolle 3-ZImmer-Wohnung mit Einbauküche in Oberbilk	37	40227	Eisenstr.	51.2168	6.80001	1953
33594089	https://www.wohnungsboerse.net/immodetail/33594089	125	4	**KLASSISCHE ALTBAUWOHNUNG MIT TOLLEM ERKER & BALKON IN GEPFLEGTEM HAUS NÄHE FÜRSTENPLATZ**	31	40215	Remscheider	51.2119	6.78692	1910
33594150	https://www.wohnungsboerse.net/immodetail/33594150	40	1.5	Tauschwohnung: Superschöne Single oder Pärchenwohnung	32	40219	\N	51.2135	6.76234	\N
33594278	https://www.wohnungsboerse.net/immodetail/33594278	46.01	2	Gerresheim: frisch sanierte 2-Zimmer-Wohnung	71	40625	Hasselbeckstraße	51.2391	6.85391	1932
33594288	https://www.wohnungsboerse.net/immodetail/33594288	69.53	2	Moderne 2-Zimmer-Wohnung mit Garten in Düsseldorf-Rath	63	40472	Am	51.2638	6.81545	2019
33594318	https://www.wohnungsboerse.net/immodetail/33594318	79	2	Ihr neues Stadtnest: Moderne 2-Zimmer-Wohnung mit Wohnküche und Balkon in Derendorf!	15	40476	Rather	51.2485	6.78927	1951
33594334	https://www.wohnungsboerse.net/immodetail/33594334	86.89	3	Drei gemütliche Zimmer auf 86m² mit Tageslichtbad und Balkon	95	40597	Benrodestraße	51.1637	6.86375	1900
33594335	https://www.wohnungsboerse.net/immodetail/33594335	79	3	*GOLZHEIM* Modernisierte Altbauperle mit Einbauküche und Stellplatz!!	16	40474	Uerdinger	51.2499	6.76369	\N
33594356	https://www.wohnungsboerse.net/immodetail/33594356	50	2	Tauschwohnung: 2 Zimmerwohnung am Hafen	32	40219	\N	51.2135	6.76234	\N
33594395	https://www.wohnungsboerse.net/immodetail/33594395	62	2	Altbaucharme in Düsseldorf-Pempelfort: Lichtdurchflutete 2-Zimmer Wohnung mit Südterrasse	14	40479	\N	51.2333	6.78371	1900
33594449	https://www.wohnungsboerse.net/immodetail/33594449	31	1	1 Zimmer Apartment mit großer Terrasse und Stellplatz	98	40599	Bublitzer	51.1772	6.86848	1993
33594519	https://www.wohnungsboerse.net/immodetail/33594519	70	3	Tauschwohnung: Schöne 3 Zimmer Wohnung mit Balkon in Friedrichstadt/Bilk	31	40215	\N	51.2149	6.78256	\N
33594575	https://www.wohnungsboerse.net/immodetail/33594575	32.6	1	Friedrichstadt - Apartment mit Balkon	31	40217	Friedrichstraße	51.217	6.77704	1970
33594620	https://www.wohnungsboerse.net/immodetail/33594620	45	2	Möblierte Designer Wohnung im Flingern Nord	22	40233	Ackerstraße	51.2289	6.80417	\N
33594623	https://www.wohnungsboerse.net/immodetail/33594623	68	2	Erdgeschosswohnug mit Garten im Agnesviertels zu vermieten!	97	50670	\N	50.9497	6.94347	\N
33594631	https://www.wohnungsboerse.net/immodetail/33594631	72	3.5	3,5-Zimmer-Wohnung mit Balkon und Blick ins Grüne	97	44649	Ludwigstr.	51.5395	7.16767	1966
33594637	https://www.wohnungsboerse.net/immodetail/33594637	86.49	3	TRAUMHAFT SCHÖNE Maisonettewohnung! WG-Geeignet! DIREKT VOM EIGENTÜMER!	97	51103	Olpener	50.9404	7.02512	1938
33594643	https://www.wohnungsboerse.net/immodetail/33594643	25	1	Apartment in ruhiger Lage	97	42799	Oberbüscherhof	51.1198	7.08422	\N
33594722	https://www.wohnungsboerse.net/immodetail/33594722	31	1.5	Ansprechende 1,5-Zimmer-Wohnung mit Balkon in Essen	97	45130	Süthers	51.4387	7.00656	1960
33594757	https://www.wohnungsboerse.net/immodetail/33594757	29.5	1	Wohnen im Neubau -  modern, zeitgemäß, energieeffizient und citynah	97	41068	Metzenweg	51.202	6.41708	2023
33594762	https://www.wohnungsboerse.net/immodetail/33594762	44.14	1	WBS erforderlich!  zentral und dennoch ruhig in MG- Rheydt	97	41239	Iltisweg	51.1698	6.42857	2022
33596447	https://www.wohnungsboerse.net/immodetail/33596447	120.9	3	Traumlage und Traumterasse zwischen Niederkassel und Oberkassel	44	40547	Schorlemerstraße	51.2365	6.74936	\N
33596486	https://www.wohnungsboerse.net/immodetail/33596486	45	2	Tauschwohnung: Tausch 2 gegen 3 (DD-Köln oder DD-DD)	15	40476	\N	51.248	6.77902	\N
33596604	https://www.wohnungsboerse.net/immodetail/33596604	91	3	Hochwertige Gartenwohnung mit EBK und 2 Stellplätzen	42	40549	Heinrich	51.2381	6.72932	2016
33596611	https://www.wohnungsboerse.net/immodetail/33596611	109	3	Tauschwohnung: Tauschwohnung: Schöne 3 Zimmer mit Balkon in Derendorf	15	40476	\N	51.248	6.77902	\N
33596793	https://www.wohnungsboerse.net/immodetail/33596793	76.5	3	Schicke 3-Zimmer-Wohnung mit Balkon in Düsseldorf	102	40595	Osteroder	51.1369	6.90883	1900
33596800	https://www.wohnungsboerse.net/immodetail/33596800	65.3	2	+++Attraktive Lage im Erdgeschoss: 2-Zimmer-Wohnung mit Terrasse+++	102	40595	Osteroder	51.1366	6.90831	1900
33598218	https://www.wohnungsboerse.net/immodetail/33598218	120	3	Tauschwohnung: Tausche Top-Altbau-Wohnung gegen ähnliches in kleiner	23	40239	\N	51.2453	6.80322	\N
33598459	https://www.wohnungsboerse.net/immodetail/33598459	72.61	2	Exklusives Wohnen in Heerdt: Neubauwohnung mit erstklassigem Energiestandard	42	40549	Burgunderstr.	51.226	6.6979	2023
33598493	https://www.wohnungsboerse.net/immodetail/33598493	142	4	Alt-Niederkassel - Wunderbare Lage - Top Ausstattung	44	40547	Alt	51.239	6.75413	\N
33598508	https://www.wohnungsboerse.net/immodetail/33598508	43.67	1	47101/151 Gemütliche 1-Zimmer-Wohnung mit 2 Balkonen in Düsseldorf-Reisholz	94	40599	Kappeler	51.1763	6.85939	1951
33598511	https://www.wohnungsboerse.net/immodetail/33598511	105.17	3	Exklusives Wohnen in Heerdt: Neubauwohnung mit erstklassigem Energiestandard	42	40549	Burgunderstr.	51.226	6.6979	2023
33598517	https://www.wohnungsboerse.net/immodetail/33598517	48.87	2	Exklusives Wohnen in Heerdt: Neubauwohnung mit erstklassigem Energiestandard	42	40549	Burgunderstr.	51.226	6.6979	2023
33598534	https://www.wohnungsboerse.net/immodetail/33598534	87	4	47113/2 Großzügige 4-Zimmer-Wohnung mit Balkon in Düsseldorf-Garath	101	40595	Heinrich-Lersch	51.1353	6.90115	1962
33598562	https://www.wohnungsboerse.net/immodetail/33598562	45	2	Tauschwohnung: Suche schönes Zuhause in Münster, biete tolle Wohnung in DUS	15	40476	\N	51.248	6.77902	\N
33598616	https://www.wohnungsboerse.net/immodetail/33598616	50	2	2-Zimmer-Wohnung mit Charme und Komfort in zentraler Lage!	91	40591	Werstener	51.185	6.83101	\N
33600360	https://www.wohnungsboerse.net/immodetail/33600360	68	2	Neuwertige 2-Zi DG-Wohnung mit wunderschöner Loggia	62	40468	Oldenburger	51.2676	6.77591	1954
33600402	https://www.wohnungsboerse.net/immodetail/33600402	74	2	Stilvolle, geräumige 2-Zimmer-Wohnung mit Terrasse in Düsseldorf	55	40489	\N	51.3305	6.76259	2004
33600413	https://www.wohnungsboerse.net/immodetail/33600413	85	3	Erstbezug nach Sanierung: schöne 3-Zimmer-Wohnung mit Balkon in Düsseldorf	42	40549	\N	51.2331	6.71909	1929
33600500	https://www.wohnungsboerse.net/immodetail/33600500	79	2	Tauschwohnung: Wunderschöne Wohnung in Kaiserswerth	53	40489	\N	51.3305	6.76259	\N
33600514	https://www.wohnungsboerse.net/immodetail/33600514	73.86	3	Ab 01.12 - Küchenübernahme möglich - Moderne Wohnung in Benrath	95	40597	Hospitalstraße	51.1651	6.86645	1952
33600602	https://www.wohnungsboerse.net/immodetail/33600602	50.68	2	Nachmieter zum 01.02 gesucht: Schick sanierte Wohnung, 2-Zi.+Wohnküche	98	40599	Zoppoter	51.1721	6.87267	1953
33600603	https://www.wohnungsboerse.net/immodetail/33600603	78	3	Zum 01.01: 3-Zimmer Wohnung, zwei Balkone, Übernahme EBK möglich, Garage möglich	91	40591	Odenthaler	51.184	6.83001	1965
33600604	https://www.wohnungsboerse.net/immodetail/33600604	49.98	2	Ab sofort frei: 2-Zimmer plus Wohnküche, mit modernem Tageslichtbad	98	40599	Zoppoter	51.1721	6.87267	1953
33600681	https://www.wohnungsboerse.net/immodetail/33600681	48	2	Ideal für Studenten! Junge Leute aufgepasst!!	31	40215	Fürstenwall	51.2137	6.78331	\N
33600726	https://www.wohnungsboerse.net/immodetail/33600726	45	1	Schöne, helle, geräumige 1 Zimmer Wohnung in Düsseldorf, Flingern Nord	22	40235	\N	51.2294	6.82752	1954
33600771	https://www.wohnungsboerse.net/immodetail/33600771	65	3	Tauschwohnung: Ich biete 3 Zimmer gegen 1,5 oder 2 Zimmer in Düsseldorf an.	36	40225	\N	51.1974	6.78988	\N
33601473	https://www.wohnungsboerse.net/immodetail/33601473	117	3	Ruhiger 3 Zi.-Altbau, Galerie sonnige Dachterrasse, Düsseldorf Bilk (Nähe Lorettoviertel)	36	40223	\N	51.1998	6.77225	\N
33601545	https://www.wohnungsboerse.net/immodetail/33601545	81	2	Tolle 2 Zimmerwohnung mit neuwertiger Küche	41	40545	Quirinstraße	51.235	6.75294	1960
33601613	https://www.wohnungsboerse.net/immodetail/33601613	68	3	++Helle 3-Zimmer-Wohnung ohne Balkon in Oberbilk++	37	40227	Markenstr.	51.2113	6.80923	1990
33601618	https://www.wohnungsboerse.net/immodetail/33601618	200	4	Wohn/Büro/Paxis - Loft der extraklasse Golzheim/Stockum	51	40474	\N	51.2738	6.74219	\N
33601625	https://www.wohnungsboerse.net/immodetail/33601625	65.3	2	***Helle 2-Zimmer-Wohnung mit Balkon und 2 Badezimmern***	102	40595	Dresdner	51.1373	6.90789	1900
33601712	https://www.wohnungsboerse.net/immodetail/33601712	40.56	1	Gemütliche Souterrain-Whg. mit Balkon sucht Studenten!	23	40239	Hallbergstraße	51.2437	6.81035	1957
33601786	https://www.wohnungsboerse.net/immodetail/33601786	78	3	Maisonette-Traum: Großzügige 3-Zimmer-Wohnung mit Loggia im ruhigen und begehrten Stadtteil D-Kalkum	56	40489	\N	51.3305	6.76259	2018
33602097	https://www.wohnungsboerse.net/immodetail/33602097	118	3.5	Sanierte 3,5-Raumwohnung am Hermannplatz	22	40233	Lindenstraße	51.2281	6.80658	1905
33604004	https://www.wohnungsboerse.net/immodetail/33604004	76	3	Schöne und helle Wohnung in toller Lage und Rheinnähe für Menschen die Stadt und Natur wollen	44	40547	\N	51.2419	6.74772	1996
33604082	https://www.wohnungsboerse.net/immodetail/33604082	51	1.5	Tauschwohnung: Moderne Altbauwohnung mit perfektem Schnitt und Balkon	31	40215	\N	51.2149	6.78256	\N
33604204	https://www.wohnungsboerse.net/immodetail/33604204	65.95	2	2-Zi-Whg. im beliebten D-dorf-Rath	63	40472	Rather	51.2601	6.81521	1983
33604309	https://www.wohnungsboerse.net/immodetail/33604309	77	3	Gemütliche 3-Zimmer Wohnung zu vermieten	42	40549	Im	51.2378	6.71136	\N
33604328	https://www.wohnungsboerse.net/immodetail/33604328	65	3.5	Helle 3 1/2-Zimmer-DG-Wohnung mit Galerie in Düsseldorf-Heerdt	42	40549	Eupener	51.2281	6.69653	1997
33604371	https://www.wohnungsboerse.net/immodetail/33604371	85	3	Tauschwohnung: Wunderschöne Altbauwohnung mit Balkon in Flingern-Nord	22	40235	\N	51.2294	6.82752	\N
33604437	https://www.wohnungsboerse.net/immodetail/33604437	63.08	2	Top-Wohnung am Grafenberger Wald	64	40470	Roteichenweg	51.2476	6.81964	\N
33604667	https://www.wohnungsboerse.net/immodetail/33604667	58	3	Helle möblierte 3 Zimmer-Wohnung in zentraler Lage	13	40210	Charlottenstraße	51.2216	6.78886	1983
33605697	https://www.wohnungsboerse.net/immodetail/33605697	54	2	Erstbezug nach Sanierung - moderne Traum-Wohnung in Oberkassel	41	40545	Oberkasseler	51.2331	6.75533	1957
33605699	https://www.wohnungsboerse.net/immodetail/33605699	154	3	Moderne und barrierefreie Stadt-Wohnung mit Tiefgarage  im Herzen von Oberkassel	41	40545	Salierstraße	51.2303	6.75731	2005
33605700	https://www.wohnungsboerse.net/immodetail/33605700	71.7	2	Neubau-Gartenwohnung mit Einbauküche -  Projekt "Am Quellenbusch" in Gerresheim	71	40625	Pirnaer	51.2276	6.85316	2023
33605711	https://www.wohnungsboerse.net/immodetail/33605711	70	2	Schöne 2-Zimmer-Wohnung mit Balkon in Düsseldorf	82	40229	\N	51.1968	6.84602	\N
33605748	https://www.wohnungsboerse.net/immodetail/33605748	70	2	NEU SANIERTE 2,5 Zimmer mit EBK ink. Waschmaschine	15	40476	Münsterstraße	51.2452	6.78854	\N
33605848	https://www.wohnungsboerse.net/immodetail/33605848	75	2.5	Hello 2,5-Zimmer-Wohnung mit 2 Balkonen und EBK	41	40547	\N	51.2419	6.74772	1971
33605885	https://www.wohnungsboerse.net/immodetail/33605885	33	1	Tauschwohnung: Zentrale Düsseldorfer Wohnung mit Schlafzimmer und Wohnküche	31	40215	\N	51.2149	6.78256	\N
33605966	https://www.wohnungsboerse.net/immodetail/33605966	50	1.5	Tauschwohnung: Zentrale Lage Düsseldorf gegen Stuttgart	31	40215	\N	51.2149	6.78256	\N
33606067	https://www.wohnungsboerse.net/immodetail/33606067	42	1	Sehr hochwertiges 1 Zimmer-Apartment mit Küche & Balkon (teilmöbliert)	22	40235	Hoffeldstraße	51.2295	6.81341	1890
33606087	https://www.wohnungsboerse.net/immodetail/33606087	75	2	Tauschwohnung: Neu sanierte Wochnung mit hohe Decken und schönem Stuck	64	40470	\N	51.2569	6.80771	\N
33606189	https://www.wohnungsboerse.net/immodetail/33606189	52	2	Stilvolle, vollständig renovierte 2-Zimmer-Dachgeschosswohnung mit Balkon in Düsseldorf	84	40627	Am	51.2016	6.89594	1968
33606198	https://www.wohnungsboerse.net/immodetail/33606198	74	3.5	Tauschwohnung: Schöner Neubau mitten in Düsseldorf	37	40227	\N	51.2154	6.79757	\N
33606387	https://www.wohnungsboerse.net/immodetail/33606387	78.47	3	Exklusive, neuwertige 3-Zimmer-Penthouse-Wohnung mit Dachgarten und EBK in Düsseldorf	33	40221	Speditionstraße	51.2154	6.75014	2020
33608342	https://www.wohnungsboerse.net/immodetail/33608342	79	3	Erdgeschoss 3-Zimmer Apartment sucht neuen Mieter	23	40237	Grafenberger	51.2326	6.81046	2017
33608372	https://www.wohnungsboerse.net/immodetail/33608372	57	2	Zentrale 2-Zimmer-Wohnung mit Balkon in Düsseldorf-Stadtmitte	13	40211	Kölner	51.2276	6.79294	\N
33608423	https://www.wohnungsboerse.net/immodetail/33608423	64	2	Suitbertusstraße 166, 40223 Düsseldorf	36	40223	Suitbertusstraße	51.2043	6.77921	2020
33608427	https://www.wohnungsboerse.net/immodetail/33608427	42	2	Geschmackvolle Wohnung mit zwei Zimmern sowie Balkon und EBK in Düsseldorf	15	40476	Weißenburgstraße	51.2464	6.78516	\N
33608472	https://www.wohnungsboerse.net/immodetail/33608472	67.82	2	Stilvolle 2-Zimmer-Dachgeschosswohnung mit Balkon und Einbauküche in Düsseldorf	36	40223	\N	51.1998	6.77225	\N
33608525	https://www.wohnungsboerse.net/immodetail/33608525	68	2	Tauschwohnung: Wunderschöne Altbauwohnung Flingern	22	40235	\N	51.2294	6.82752	\N
33608544	https://www.wohnungsboerse.net/immodetail/33608544	61	3	Ihre neue Wohnung: 3-Zimmer-Wohnung	14	40211	Düsselthaler	51.2324	6.7898	1911
33608581	https://www.wohnungsboerse.net/immodetail/33608581	67	2	Tauschwohnung: Tausche wunderschöne 2-Z-Whg mit in Düsseltal gegen größere	23	40239	\N	51.2453	6.80322	\N
33608703	https://www.wohnungsboerse.net/immodetail/33608703	58	2	Tauschwohnung: Suche 2 Zimmer in Berlin - biete 2-Zimmer  in Flingern Nord	22	40235	\N	51.2294	6.82752	\N
33608727	https://www.wohnungsboerse.net/immodetail/33608727	82	2	Für Kenner & Individualisten: Top sanierte Maisonette-Wohnung	44	40547	\N	51.2419	6.74772	1987
33608742	https://www.wohnungsboerse.net/immodetail/33608742	120	4	Flingern-Nord / Stil-Altbau / Renoviert: Schöne 4-Zimmer Maisonette-Wohnung	21	40235	\N	51.2294	6.82752	1910
33608779	https://www.wohnungsboerse.net/immodetail/33608779	70	3	Helle Neubauwohnung mit Blick auf den Belsenpark	41	40549	Ria	51.2345	6.74174	2021
33608789	https://www.wohnungsboerse.net/immodetail/33608789	75	2	Tauschwohnung: Heller Altbau Unterbilk mit Erker	32	40219	\N	51.2135	6.76234	\N
33609012	https://www.wohnungsboerse.net/immodetail/33609012	85	3	Geräumige 3-Zimmer-Wohnung mit Garten & TG-Stellplatz in Düsseldorf (Zentral)	15	40476	\N	51.248	6.77902	\N
33609013	https://www.wohnungsboerse.net/immodetail/33609013	91.3	4	Schöne 4-Zimmer-Wohnung in Düsseldorf	97	40589	\N	51.1641	6.82144	1952
33609058	https://www.wohnungsboerse.net/immodetail/33609058	95	3	Gemütliche, helle Wohnung im Grünen mit großem Balkon, Provisionsfrei vom Vermieter	83	40627	\N	51.2024	6.88388	1975
33609664	https://www.wohnungsboerse.net/immodetail/33609664	83	3	Schöne, geräumige 3-Zi.Whg mit eigenem Garten in Düsseldorf-Himmelgeist	92	40589	Alt	51.1676	6.80425	2012
33609721	https://www.wohnungsboerse.net/immodetail/33609721	35	1	Modernes 1-Zimmer Apartment in der Düsseldorfer Innenstadt	13	40211	\N	51.2301	6.79288	\N
33609760	https://www.wohnungsboerse.net/immodetail/33609760	30	1	Tauschwohnung: Wunderschöne Wohnung im Herzen Düsseldorfs abzugeben!	11	40213	\N	51.2221	6.77271	\N
33609821	https://www.wohnungsboerse.net/immodetail/33609821	44	2	Tauschwohnung: Singlewohnung zum Tausch in Bilk	36	40223	\N	51.1998	6.77225	\N
33609842	https://www.wohnungsboerse.net/immodetail/33609842	92	3	INDIVIDUELLES WOHNEN IM HERZEN VON BILK	36	40223	Suitbertusstr.	51.2043	6.77921	2020
33609851	https://www.wohnungsboerse.net/immodetail/33609851	65	2	Tauschwohnung: Helle moderne Zweizimmerwohnung mit großem Südbalkon	15	40476	\N	51.248	6.77902	\N
33609872	https://www.wohnungsboerse.net/immodetail/33609872	30	1	Tauschwohnung: Tausche zentrale 1 Zimmer Wohnung in Friedrichstadt gegen	31	40215	\N	51.2149	6.78256	\N
33609896	https://www.wohnungsboerse.net/immodetail/33609896	63	2	Gut geschnittene 2-Zimmer-Dachgeschosswohnung in stadtnaher Wohnlage von Düsseldorf - Golzheim	16	40476	Zietenstraße	51.2419	6.77451	1935
33610669	https://www.wohnungsboerse.net/immodetail/33610669	83	3	Stilvolle 3-Zimmer-Wohnung mit Balkon im Le Flair Pempelfort	14	40211	schinkelstrasse	51.2335	6.79422	\N
33610710	https://www.wohnungsboerse.net/immodetail/33610710	48	2	Freundliche 2-Zimmer-Wohnung in 40231, Düsseldorf	82	40231	\N	51.2135	6.83024	\N
33610764	https://www.wohnungsboerse.net/immodetail/33610764	61	2	Tauschwohnung: Zwei Zimmer Wohnung mit Aussicht	91	40589	\N	51.1641	6.82144	\N
33610906	https://www.wohnungsboerse.net/immodetail/33610906	42	1	Geräumige 1-Zimmer-Wohnung mit Balkon in Düsseldorf	32	40215	Bilker	51.2109	6.77581	1955
33611348	https://www.wohnungsboerse.net/immodetail/33611348	90	4	Familienfreundliches Wohnen in D-Ludenberg mit 4 Zimmern und moderner Ausstattung	73	40629	Luckemeyerstraße	51.259	6.8643	1974
33611354	https://www.wohnungsboerse.net/immodetail/33611354	45	1	Walburgisstraße 15, 40489 Düsseldorf	53	40489	Walburgisstraße	51.3036	6.74411	\N
33611464	https://www.wohnungsboerse.net/immodetail/33611464	30	1	Möblierte geschmackvolle 1 Zimmer Wohnung in Düsseldorf-Oberbilk, renoviert von Privat	37	40227	Sonnenstr.	51.2125	6.7944	1975
33611472	https://www.wohnungsboerse.net/immodetail/33611472	53	2	Tauschwohnung: Ich tausche schöne 2 Zimmerwohnung gegen 3 Zimmer	36	40225	\N	51.1974	6.78988	\N
33611516	https://www.wohnungsboerse.net/immodetail/33611516	56	2	Tauschwohnung: Lichtdurchflutete 2 Z.-Wohnung gegen min. 3-Z. in Düsseldorf	51	40474	\N	51.2738	6.74219	\N
33611558	https://www.wohnungsboerse.net/immodetail/33611558	30	2	Tauschwohnung: Suche Münster, biete Düsseldorf DG mit EBK	37	40227	\N	51.2154	6.79757	\N
33611594	https://www.wohnungsboerse.net/immodetail/33611594	50	2	Tauschwohnung:  Düsseldorf Altbau gegen Köln	36	40223	\N	51.1998	6.77225	\N
33612568	https://www.wohnungsboerse.net/immodetail/33612568	108	3	Helle Maisonette-Wohnung mit Blick ins Grüne zentral gelegen in Düsseldorf-Oberkassel	41	40545	Luegalle	51.2313	6.75867	\N
33612676	https://www.wohnungsboerse.net/immodetail/33612676	27	1	Apartement Derendorf Nord, ruhige Grünlage	15	40468	Bloemstr	51.257	6.78253	1953
33613226	https://www.wohnungsboerse.net/immodetail/33613226	50	2	ZWISCHENMIETE | 6 Monate ab März 2024 | zentrale, möblierte 50 qm² in Friedrichstadt | 2 Zimmer	31	40215	\N	51.2149	6.78256	\N
33613231	https://www.wohnungsboerse.net/immodetail/33613231	68	3	Möblierte & ruhige 3-Zimmerwohnung	83	40627	\N	51.2024	6.88388	1987
33613282	https://www.wohnungsboerse.net/immodetail/33613282	63	3	Modernisierte 3-Zimmer-Wohnung mit Einbauküche	15	40476	\N	51.248	6.77902	1956
33613293	https://www.wohnungsboerse.net/immodetail/33613293	57	2	Tauschwohnung: 2-Zimmer Altbauwohnung in Flingern	22	40235	\N	51.2294	6.82752	\N
33613332	https://www.wohnungsboerse.net/immodetail/33613332	70	3	Gepflegte 3-Zimmer-Wohnung mit Balkon in Düsseldorf	71	40627	\N	51.2024	6.88388	\N
33614086	https://www.wohnungsboerse.net/immodetail/33614086	70	2.5	2 Zimmer-Wohnung Altbau Charme 70m2  ruhige Lage gegenüber dem Rathaus Benrath Warmmiete 990,00 Euro	95	40597	Benrodestraße	51.1634	6.86567	1905
33614762	https://www.wohnungsboerse.net/immodetail/33614762	80	3	Altbauperle am Hafen inkl. Einbauküche und Balkon	32	40219	Wupperstr	51.2127	6.75773	1908
33614781	https://www.wohnungsboerse.net/immodetail/33614781	107.7	4	Schicke 4 Zimmer Staffelgeschosswohnung in D-Stockum	51	40474	\N	51.2738	6.74219	\N
33614801	https://www.wohnungsboerse.net/immodetail/33614801	106	2	Helle und offene Loft-Wohnung in Parknähe	36	40225	\N	51.1974	6.78988	\N
33614888	https://www.wohnungsboerse.net/immodetail/33614888	92	3	Exklusive 3-Zimmer-Wohnung mit Balkon in Düsseldorf	23	40239	\N	51.2453	6.80322	\N
33614961	https://www.wohnungsboerse.net/immodetail/33614961	50	2	2-Zimmer-DG-Wohnung mit gehobener Innenausstattung in Düsseldorf	98	40599	Altenbrückstraße	51.1831	6.86964	\N
33614971	https://www.wohnungsboerse.net/immodetail/33614971	65	2	Mitten in Oberkassel, 2-Zi KDB mit Balkon und Parkplatz!	41	40545	Dominikanerstr.	51.2287	6.75051	1970
33614975	https://www.wohnungsboerse.net/immodetail/33614975	65	2	***STILVOLLES WOHNEN IM JUGENDSTILHAUS IN D-FLINGERN-NORD***	22	40233	Wetterstr.	51.2275	6.80485	1911
33615026	https://www.wohnungsboerse.net/immodetail/33615026	79	3	Tauschwohnung: 3 Zimmer Wohnung Oberbilk	37	40227	\N	51.2154	6.79757	\N
33615031	https://www.wohnungsboerse.net/immodetail/33615031	58	2	Düsseldorf - Uni Nähe - 2-Zimmer-Wohnung mit Balkon und kleinem Garten	91	40591	Otto	51.179	6.80896	2002
33615039	https://www.wohnungsboerse.net/immodetail/33615039	56	1	Helle und ruhige Innenstadtwohnung im Loftstyle, mit Wintergarten und kleinem Garten, möbliertt	13	40211	Schützenstr	51.2278	6.7955	1909
33615088	https://www.wohnungsboerse.net/immodetail/33615088	67	3	Düsseldorf,  67 qm  ruhige Lage, 3 Zi, Kü, Di, Bad, 2 Balkon 2	82	40231	Jägerstr	51.2065	6.84111	1967
33615107	https://www.wohnungsboerse.net/immodetail/33615107	65	2	Stilvolle 2-Zimmer-Wohnung mit Balkon und Einbauküche in Düsseldorf	96	40593	\N	51.1403	6.86854	1984
33615134	https://www.wohnungsboerse.net/immodetail/33615134	65	3	Top neu sanierte, helle 3 Zimmer-Wohnung	37	40227	Kirchstr	51.2132	6.80286	1958
33615242	https://www.wohnungsboerse.net/immodetail/33615242	60	2	Stilvolle, modernisierte und vollmöblierte 2-Zi-Wohnung mit Balkon und Einbauküche in D	36	40223	Brunnenstraße	51.2061	6.77893	1972
33615243	https://www.wohnungsboerse.net/immodetail/33615243	50	1	Ansprechende 1-Zimmer-Hochparterre-Wohnung mit TerrassenBalkon in Düsseldorf	72	40629	Ludenberger	51.2407	6.8327	1914
33616300	https://www.wohnungsboerse.net/immodetail/33616300	26	1	Ruhiges 1 Zimmerapartment in zentraler Lage in Düsseldorf	31	40215	\N	51.2149	6.78256	1969
33616312	https://www.wohnungsboerse.net/immodetail/33616312	42	1.5	Tauschwohnung: gemütliche Wohnung nähe Hbf gegen Kölner Wohnung	37	40227	\N	51.2154	6.79757	\N
33616340	https://www.wohnungsboerse.net/immodetail/33616340	36	1.5	möblierte 1,5-Zimmer-EG-Wohnung im Szene Viertel	22	40237	Grafenberger	51.2316	6.80659	1963
33616369	https://www.wohnungsboerse.net/immodetail/33616369	108	4	Helle 4-Zimmer EG-Wohnung mit Garten - Erstbezug	84	40627	Karl-Knödl-Straße	51.2032	6.90386	2023
33616395	https://www.wohnungsboerse.net/immodetail/33616395	65	3	Geschmackvolle 3-Raum-Wohnung mit Balkon und Einbauküche in Düsseldorf	91	40591	Werstener	51.1895	6.82749	1970
33616482	https://www.wohnungsboerse.net/immodetail/33616482	45	2	2-Zimmer-Single-Wohnung Chemnitzer Str. Nähe Unterbacher See	83	40627	\N	51.2024	6.88388	1984
33616642	https://www.wohnungsboerse.net/immodetail/33616642	116	3	Heyestraße 152, 40625 Düsseldorf	71	40625	Heyestraße	51.2234	6.86419	\N
33616666	https://www.wohnungsboerse.net/immodetail/33616666	124	5	//Erstbezug\\\\ Ihrer neuen 5-Zimmer-Maisonette-Wohnung mit Sonnenloggia im begehrten *Klemensviertel*	53	40489	Klemensplatz	51.3016	6.73998	1911
33616678	https://www.wohnungsboerse.net/immodetail/33616678	105	3.5	Exklusive Cityresidence in Düsseldorf,  Furnished        3-Room	23	40211	Toulouser	51.2342	6.79637	\N
33616682	https://www.wohnungsboerse.net/immodetail/33616682	67	3	Opladener Straße 23, 40591 Düsseldorf	91	40591	Opladener	51.1877	6.82087	1900
33616695	https://www.wohnungsboerse.net/immodetail/33616695	120	4.5	Ansprechende 4,5-Zimmer-Wohnung mit Balkon	92	45307	Marienstr.	51.4597	7.07538	\N
33618696	https://www.wohnungsboerse.net/immodetail/33618696	29.86	1	Ab sofort: 1-Zi-Appartment mit Balkon und Aufzug in D-Bilk	36	40225	Dagobertstraße	51.2023	6.77746	1963
33618734	https://www.wohnungsboerse.net/immodetail/33618734	41	1	helle 1.5-Zimmer-Wohnung in Düsseldorf	91	40589	Kölner	51.1804	6.82808	\N
33618833	https://www.wohnungsboerse.net/immodetail/33618833	28	1	Appartment am Carlsplatz mit Pantryküche	12	40213	Benrather	51.2229	6.77237	\N
33618878	https://www.wohnungsboerse.net/immodetail/33618878	20	1	Stilvolle 1-Zimmer-EG-Wohnung in Düsseldorf	82	40229	Gumbertstrasse	51.2015	6.83764	\N
33618889	https://www.wohnungsboerse.net/immodetail/33618889	87.9	3	Schöne 3-Zimmerwohnung im Erdgeschoss mit großer Terrasse!	73	40629	Am	51.2459	6.84873	2002
33618934	https://www.wohnungsboerse.net/immodetail/33618934	85	3	Schöne grundsanierte 3-Zimmer-Wohnung in Düsseldorf-Eller	82	40229	Weinheimer	51.2027	6.8301	1962
33618963	https://www.wohnungsboerse.net/immodetail/33618963	46	2	Tauschwohnung: TAUSCHWOHNUNG, Derendorf	15	40476	\N	51.248	6.77902	\N
33619011	https://www.wohnungsboerse.net/immodetail/33619011	96.32	3	3 Zimmerwohnung in zentraler Lage	23	40239	Speldorfer	51.2417	6.80108	1992
33619031	https://www.wohnungsboerse.net/immodetail/33619031	101.3	3	Düsseldorf-Mörsenbroich: Exklusvie 3,5-Maisonette-Wohnung mit großem Balkon in ruhiger Lage!	64	40470	\N	51.2569	6.80771	1983
33619034	https://www.wohnungsboerse.net/immodetail/33619034	43	2	Gepflegte helle Singlewohnung	16	40476	Rossstr	51.2444	6.78016	\N
33619038	https://www.wohnungsboerse.net/immodetail/33619038	125	3	Moderne Terrassenwohnung in Düsseldorf-Unterbach	84	40627	\N	51.2024	6.88388	1970
33619052	https://www.wohnungsboerse.net/immodetail/33619052	57.04	2	Neubau wir kommen	62	40468	Nienburger	51.2647	6.77615	2023
33619066	https://www.wohnungsboerse.net/immodetail/33619066	75.01	3	NEUBAU wir kommen!	62	40468	Nienburger	51.2647	6.77615	2023
33619186	https://www.wohnungsboerse.net/immodetail/33619186	44	2	Stilvolle, gepflegte 2-Zimmer-Wohnung mit EBK in Düsseldorf	15	40476	Jülicherstr	51.2428	6.7854	\N
33619341	https://www.wohnungsboerse.net/immodetail/33619341	73	2	Ruhige 2-Zimmer-Wohnung mit kleinem Balkon in Düsseldorf	31	40215	Hildebrandtstrasse	51.2104	6.78416	\N
33619345	https://www.wohnungsboerse.net/immodetail/33619345	68.11	2	Helle EG-Whg. renoviert, mit neuem Bad u. großer Wohnküche nähe Nordstraße	14	40477	Blücherstr.	51.2388	6.78321	1960
33619385	https://www.wohnungsboerse.net/immodetail/33619385	96	3	OG-Wohnung in Odenthal - Küchenberg	52	51519	Küchenberger	51.024	7.11241	2014
33619386	https://www.wohnungsboerse.net/immodetail/33619386	100	3	EG-Wohnung in Odenthal - Küchenberg	52	51519	Küchenberger	51.0239	7.11194	2014
33621123	https://www.wohnungsboerse.net/immodetail/33621123	41.57	1	Ab sofort: 1-Zi-Apartment im Erdgeschoss mit Balkon und Aufzug in D-Bilk	36	40225	Dagobertstraße	51.2023	6.77746	1963
33621205	https://www.wohnungsboerse.net/immodetail/33621205	54	2	Zentrale 2-Zimmer Wohnung mit Balkon in Düsseldorf	31	40215	Adersstr.	51.2177	6.78833	\N
33621210	https://www.wohnungsboerse.net/immodetail/33621210	105	3	*ZOOGARTEN* charmante und hochwertige Mietwohnung im beliebten Zooviertel	23	40239	\N	51.2453	6.80322	\N
33621233	https://www.wohnungsboerse.net/immodetail/33621233	85	3	Helle und moderne 3 Zi-Whng mit Terrasse, sehr zentral in Düsseldorf Wersten	91	40591	Gertrud-Woker-Straße	51.1794	6.82601	1997
33621250	https://www.wohnungsboerse.net/immodetail/33621250	126	3	hochwertig möbliertes Luxus Penthouse mit Rheinblick - Düsseldorf Volmerswerth	35	40221	\N	51.1997	6.75072	\N
33621277	https://www.wohnungsboerse.net/immodetail/33621277	50	2	Tauschwohnung: perfekt aufgeteilte 2-Zimmer Wohnung mit Balkon	15	40476	\N	51.248	6.77902	\N
33621294	https://www.wohnungsboerse.net/immodetail/33621294	38	1.5	Traumwohnung in D-Friedrichstadt, 1,5-Zi., Einbauküche, Lift, Balkon	31	40215	Zimmerstr.	51.21	6.78137	2007
33621305	https://www.wohnungsboerse.net/immodetail/33621305	54.45	2	Attraktive Erdgeschosswohnung in D-Bilk	36	40225	Auf´m	51.205	6.78561	1952
33621408	https://www.wohnungsboerse.net/immodetail/33621408	40	2	Tauschwohnung: Biete Unterbilk, suche Düsseltal, 2 Zimmer	32	40217	\N	51.2127	6.7754	\N
33621429	https://www.wohnungsboerse.net/immodetail/33621429	63	2	Schöne Maisonette-Wohnung mit Balkon!	93	40589	Bahlenstr.	51.1785	6.82576	1966
33621435	https://www.wohnungsboerse.net/immodetail/33621435	56.19	2.5	Demnächst frei! 2-Zimmer-Wohnung in Düsseldorf Garath wird saniert zum 01.01.24	101	40595	Otto-Braun-Straße	51.1398	6.90482	1969
33621436	https://www.wohnungsboerse.net/immodetail/33621436	68.99	3.5	Demnächst frei! 3-Zimmer-Wohnung in Düsseldorf Garath wird saniert zum 15.01.24	101	40595	Carl-von-Ossietzky-Straße	51.143	6.90269	1969
33621437	https://www.wohnungsboerse.net/immodetail/33621437	68.12	3.5	Erdgeschoss-3-Zimmer-Wohnung in Düsseldorf Garath mit Gartenanteil	101	40595	Adam-Stegerwald-Straße	51.1428	6.90568	1969
33621439	https://www.wohnungsboerse.net/immodetail/33621439	80.85	3	3-Zimmer-Wohnung in Düsseldorf	42	40549	Böhlerstr.	51.2414	6.71231	2019
33621451	https://www.wohnungsboerse.net/immodetail/33621451	31.69	1	Modernes Apartment mit Aufzug in Düsseldorf Garath	101	40595	Emil-Barth-Str.	51.1429	6.89684	1967
33621452	https://www.wohnungsboerse.net/immodetail/33621452	51.01	2	Frisch modernisierte 2-Zimmer Wohnung in Lörick	43	40547	Grevenbroicher	51.2412	6.72752	1999
33621490	https://www.wohnungsboerse.net/immodetail/33621490	32	1	Appartement in Flingern zu vermieten.	22	40235	\N	51.2294	6.82752	1954
33621637	https://www.wohnungsboerse.net/immodetail/33621637	115	4	Komfort-Stadtwohnung mit Sonnenbalkon  und  Grünblick	16	40474	\N	51.2738	6.74219	1972
33621679	https://www.wohnungsboerse.net/immodetail/33621679	55	2	Renovierte, gepflegte 2-Zimmerwohnung	31	40215	Hüttenstr.	51.2162	6.78447	\N
33621850	https://www.wohnungsboerse.net/immodetail/33621850	52	2	Vollrenovierte 2-Zimmer-Wohnung zum Erstbezug	52	51143	Hauptstraße	50.8633	7.03734	1992
33621853	https://www.wohnungsboerse.net/immodetail/33621853	39	1	schöne 1-Zimmer-Wohnung mit neuen Bad, Boden usw. in E-Schönnebeck	52	45359	Leggewiestraße	51.4607	6.93635	1972
33621856	https://www.wohnungsboerse.net/immodetail/33621856	75	3.5	Neudorf am Hauptbahnhof renovierte 3,5-Zimmer helle Maisonette Wohnung	52	47057	Tulpenstr.	51.4282	6.78122	1968
33621867	https://www.wohnungsboerse.net/immodetail/33621867	55	2	Modern sanierte u. möblierte 2 Zimmerwohnung mit Balkon in direkter Nähe zu Teekanne	42	40549	\N	51.2331	6.71909	1960
33621870	https://www.wohnungsboerse.net/immodetail/33621870	43	2	2-Zimmer Appartement Zentral am Manforter Bahnhof	52	51377	Bodelschwinghstraße	51.0306	7.01689	1995
33621875	https://www.wohnungsboerse.net/immodetail/33621875	37	1	schöne kleine 2 Zimmer Wohnung mit Balkon und kleiner Einbauküche	52	47198	Mittelstr.	51.4539	6.7136	\N
33621876	https://www.wohnungsboerse.net/immodetail/33621876	27	1	Modernisierte Wohnung mit einem Zimmer und Einbauküche in Recklinghausen	52	45661	Hochlarmarkstr.	51.5587	7.18923	1987
33621879	https://www.wohnungsboerse.net/immodetail/33621879	24	1	teilmöbliertes Appartement im Grünen	52	47198	Ruhrorterstr.	51.4546	6.71312	\N
33621886	https://www.wohnungsboerse.net/immodetail/33621886	68	2	Traumhafte 2 Zimmer-Wohnung in super zentraler Lage	52	40211	Gerresheimerstr.	51.2277	6.79379	1957
33621890	https://www.wohnungsboerse.net/immodetail/33621890	76.65	3	Wohnung nähe Jahrhunderthalle	52	44793	Alleestr.	51.4786	7.20132	\N
33621903	https://www.wohnungsboerse.net/immodetail/33621903	130	4	Schöne Altbau-Whg. 4 1/2 Zi. mit Balkon zu vermieten	52	46045	Tannenbergstraße	51.4799	6.86258	1952
33621904	https://www.wohnungsboerse.net/immodetail/33621904	55	2	Sonnige Single-Niedrigenergiewohnung Ruhiglage Nichtraucherhaus full service, vom Eigentümer	52	50127	Zur	50.9391	6.69333	1998
33622886	https://www.wohnungsboerse.net/immodetail/33622886	22	1	ANFRAGE-STOPP: Rather Straße 68, 40476 Düsseldorf	15	40476	Rather	51.2499	6.78902	\N
33622978	https://www.wohnungsboerse.net/immodetail/33622978	90	2.5	Helle, offene und attraktive Dachgeschoss-Wohnung in Düsseldorf	42	40549	Heerdter	51.2397	6.72806	1903
33622999	https://www.wohnungsboerse.net/immodetail/33622999	73	3	Sanierte 3-Raum-Wohnung in Düsseldorf	16	40474	Uerdinger	51.2499	6.76369	\N
33623012	https://www.wohnungsboerse.net/immodetail/33623012	35	1	Mini Penthouse Maisonette-Wohnung mit Dachterrasse und EBK in Düsseldorf Derendorf	15	40476	Bülowstraße	51.2444	6.79152	\N
33623042	https://www.wohnungsboerse.net/immodetail/33623042	30	1	Stilvolle 1-Zimmer-Wohnung in Düsseldorf	15	40476	Essener	51.2437	6.78392	\N
33623140	https://www.wohnungsboerse.net/immodetail/33623140	99.39	3	Maisonette-Wohnung mit Sonnenbalkon in ruhiger Lage!	43	40545	Am	51.2431	6.73362	\N
33623177	https://www.wohnungsboerse.net/immodetail/33623177	44.95	2	Helle, neu erstellte, voll gedämmte Loftwohnung in Pempelfort- Erstbezug	13	40211	Karl-Anton-Straße	51.2255	6.7932	1950
33623269	https://www.wohnungsboerse.net/immodetail/33623269	70	4	Tauschwohnung: Große Wohnung	83	40627	\N	51.2024	6.88388	\N
33623288	https://www.wohnungsboerse.net/immodetail/33623288	94	3	Über den Dächern von Flingern Nord! Sonnige 3-Zimmer-Wohnung mit großer Wohnküche!	22	40233	Birkenstr.	51.2289	6.79886	1903
33623338	https://www.wohnungsboerse.net/immodetail/33623338	142.64	3	*GOLZHEIM* Maisonette-Penthouse mit Blick über Düsseldorf!	16	40474	Am	51.2534	6.76695	1997
33623400	https://www.wohnungsboerse.net/immodetail/33623400	150	3.5	Tauschwohnung: Wunderschöne Gartenwohnung mit Holzofen	62	40468	\N	51.2612	6.7789	\N
33623433	https://www.wohnungsboerse.net/immodetail/33623433	67.5	2	Helle, moderne und teilmöblierte 2-Zimmer-Wohnung in den Heinrich Heine Gärten	42	40549	Heinrich-Heine-Gärten	51.2377	6.73117	\N
33623483	https://www.wohnungsboerse.net/immodetail/33623483	70	2	Sehr schöne 2 Zimmer Wohnung mit überdachtem Balkon und Küche!!!	82	40231	Schlesische	51.2085	6.83596	1933
33623485	https://www.wohnungsboerse.net/immodetail/33623485	122.26	5	5-Zimmer-Wohnung im Erdgeschoss inkl. Terrasse in Düsseldorf-Rath	63	40472	Rüdigerstraße	51.2619	6.82226	2013
33623493	https://www.wohnungsboerse.net/immodetail/33623493	82	3	Komplett sanierte, helle, ruhige Etagenwohnung in Holthausen	93	40589	Itterstraße	51.1724	6.82941	1981
33623508	https://www.wohnungsboerse.net/immodetail/33623508	96	3	TOTALSANIERTER ALTBAU OBERKASSEL LUEGALLEE HOHE DECKEN BALK. NEUES DUSCHBAD GROßE WOHNKÜCHE 2. ETAGE	41	40545	Luegallee	51.2313	6.75734	1920
33623527	https://www.wohnungsboerse.net/immodetail/33623527	43	1	***NETTE MIETER GESUCHT-TOLLE  1 ZIMMER WOHNUNG IM BELIEBTEN FRIEDRICHSTADT***	31	40215	Pionierstr.	51.2151	6.78577	1955
33623586	https://www.wohnungsboerse.net/immodetail/33623586	59	2	Erstbezug nach Renovierung - 2,5-Zimmer-Wohnung mit EBK in Gelsenkirchen	92	45899	Horster	51.5507	7.0433	\N
33623692	https://www.wohnungsboerse.net/immodetail/33623692	70	3	Schöne 3 Zimmerwhg. mit großem Balkon und Einbauküche* TG-optional *Besichtigung 04.12.23 ab 18:30	71	40625	\N	51.2358	6.85232	1962
33623746	https://www.wohnungsboerse.net/immodetail/33623746	63	2	Sehr gepflegte 2-Zimmer-Wohnung mit zwei Balkonen in Düsseldorf	98	40599	Stendaler	51.1873	6.8624	1998
33623750	https://www.wohnungsboerse.net/immodetail/33623750	75	2	Schöne und ruhig gelegene Gartengeschoßwohnung	43	40547	Glehner	51.2438	6.72532	1962
33625566	https://www.wohnungsboerse.net/immodetail/33625566	70.6	2	Exklusive 2-Zimmer-Wohnung mit Balkon und EBK in Düsseldorf-Grafental	22	40235	\N	51.2294	6.82752	2015
33625573	https://www.wohnungsboerse.net/immodetail/33625573	65	3	Gemütliche 3-Zimmer-Wohnung mit großem Balkon in Düsseldorf Rath	63	40472	\N	51.2685	6.83379	1955
33625597	https://www.wohnungsboerse.net/immodetail/33625597	52	3	Helle Wohnung über den Dächern der Stadt nahe Nordstraße	16	40476	Seydlitzstraße	51.2425	6.78032	1900
33625603	https://www.wohnungsboerse.net/immodetail/33625603	45	1	Wilhelm-Rüther-Straße 8, 40597 Düsseldorf	95	40597	Wilhelm-Rüther-Straße	51.1713	6.88152	\N
33625785	https://www.wohnungsboerse.net/immodetail/33625785	47	2	*Auf Zeit Untermiete*: Möblierte 2-Zimmer Innenstadt Wohnung (3 Monate)	31	40215	Corneliusstr	51.2132	6.7826	\N
33625884	https://www.wohnungsboerse.net/immodetail/33625884	53	2	Tauschwohnung: Tausche 2 Zimmerwohnung Düsseldorf gegen Köln	21	40233	\N	51.2198	6.8119	\N
33626040	https://www.wohnungsboerse.net/immodetail/33626040	79.68	2.5	Traumwohnung mit Luxus-Terrasse mit Süd-West-Ausrichtung und Parkblick	23	40211	Toulouser	51.2373	6.79604	2017
33626056	https://www.wohnungsboerse.net/immodetail/33626056	90	3	Helle, hochwertige 3-Zimmer-Wohnung mit Balkon und Einbauküche in Grafental	22	40235	\N	51.2294	6.82752	\N
33626158	https://www.wohnungsboerse.net/immodetail/33626158	71	2	Top sanierte 2-Zimmer-DG-Wohnung im Herzen Düsseldorfs	32	40223	Martinstrasse	51.2102	6.76326	1905
33626375	https://www.wohnungsboerse.net/immodetail/33626375	75	2	Top geschnittene lichtdurchflutete 2-Zimmerwohnung in Düsseltal	23	40239	Maurenbrecherstrasse	51.2488	6.8023	1955
33626426	https://www.wohnungsboerse.net/immodetail/33626426	67	2	Erstbezug: stilvolle 2-Zimmer-Terrassenwohnung mit EBK und Balkon in Düsseldorf	41	40549	Ria-Thiele-Straße	51.2349	6.74068	2019
33627010	https://www.wohnungsboerse.net/immodetail/33627010	30	1	Möblierte Wohnung mit EBK und WiFi in Düsseldorf	91	40591	Kölner	51.1914	6.81518	\N
33627046	https://www.wohnungsboerse.net/immodetail/33627046	75	2	Besichtigung am 10.12.23 um 14 Uhr!! Gepflegte 2-Zimmer-Wohnung mit Balkon in Köln	97	50858	Bistritzer	50.9315	6.84364	2000
33627163	https://www.wohnungsboerse.net/immodetail/33627163	58	2	Helle, lichtdurchflutete Wohnung, in Nähe der Universität	93	40589	Bahlenstrasse	51.1783	6.82597	1966
33627177	https://www.wohnungsboerse.net/immodetail/33627177	164	5	Df.-Golzheim: Voll möblierte 5-Raum-Wohnung in elegantem Gebäude	16	40476	Bankstraße	51.2426	6.77389	\N
33627296	https://www.wohnungsboerse.net/immodetail/33627296	83.32	3	* Einzigartiges Wohngefühl * Moderne 3-Zimmer DG-Wohnung mit EBK ohne Aufzug!	14	40479	Franklinstraße	51.2358	6.79045	1952
33627326	https://www.wohnungsboerse.net/immodetail/33627326	60.68	2	Gepflegte, lichtdurchflutete & barrierefreie 2.-Zi Gartenwohnung mit Terrasse in D-Kalkum	56	40489	\N	51.3305	6.76259	2018
33627378	https://www.wohnungsboerse.net/immodetail/33627378	30	1	1 Zimmer App. in Alt-Oberkassel nach Kernsanierung ab sofort zu vermieten	41	40545	Dominikanerstraße	51.2286	6.751	1957
33627469	https://www.wohnungsboerse.net/immodetail/33627469	60	3	Sanierte 3-Zimmer-DG-Wohnung mit Balkon und EBK in Düsseldorf	56	40489	Kleianspatt	51.3024	6.75454	\N
33627528	https://www.wohnungsboerse.net/immodetail/33627528	131.74	3	*Neubau*Erstbezug* Schöne 3 Zimmerwohnung mit großer Dachterrasse	63	40472	Dorothea-Habedank-Straße	51.2636	6.82171	2022
33627630	https://www.wohnungsboerse.net/immodetail/33627630	101	3.5	DAS AUSSERGEWÖHNLICHE MÖBLIERTE 3,5 ZIMMER WOHNUNG IN GOLZHEIM	16	40474	\N	51.2738	6.74219	1976
33627670	https://www.wohnungsboerse.net/immodetail/33627670	119	3	Ruhige Etagenwohnung in D-Urdenbach	96	40593	\N	51.1403	6.86854	1977
33629198	https://www.wohnungsboerse.net/immodetail/33629198	30	1	**FURNISHED** Modernes Cityapartment in Derendorf	15	40476	Geistenstr.	51.2472	6.78726	\N
33629227	https://www.wohnungsboerse.net/immodetail/33629227	120.37	4	Glücklich Wohnen auf zwei Etagen mit viel Raum zum Wohlfühlen	23	40239	Mülheimer	51.2384	6.79872	1953
33629289	https://www.wohnungsboerse.net/immodetail/33629289	137.8	3	Lichtdurchflutete 3 Zimmer Wohnung am Zoopark	23	40239	Graf-Recke-Str.	51.2424	6.81125	2010
33629307	https://www.wohnungsboerse.net/immodetail/33629307	61	2	Flingern Nord 2-Zimmer-Wohnung mit großer Wohnküche	22	40233	Ackerstraße	51.2272	6.8004	1959
33629353	https://www.wohnungsboerse.net/immodetail/33629353	86	2	Exklusive und großzügige 2-Zi-DG-Wohnung mit  Süd-Balkon! EBK! TG-Stellplatz! Nähe Klemensplatz!	53	40489	\N	51.3305	6.76259	1996
33629407	https://www.wohnungsboerse.net/immodetail/33629407	80	2.5	Helle, frisch sanierte Altbauwohnung nahe der Tußmannstraße	15	40477	Jülicher	51.2434	6.79192	1937
33629602	https://www.wohnungsboerse.net/immodetail/33629602	38	1	Vollmöbeliertes helles Appartement mit Balkon und EBK in Top Zentrumslage	14	40479	Vagedesstraße	51.232	6.78788	1960
33630752	https://www.wohnungsboerse.net/immodetail/33630752	87	4	4-Zimmer Whg.: Fußbodenheizung & Wärmepumpe & Balkon & Gäste-WC	81	40231	\N	51.2135	6.83024	\N
33630880	https://www.wohnungsboerse.net/immodetail/33630880	52.5	2	NEU! "MINI PENTHOUSE STYLE" Medienhafen, Düsseldorf, 2 Zimmer Whg, OHNE PROVISION mit Balkon & Küche	32	40219	Erftstraße	51.2139	6.75754	1908
33630924	https://www.wohnungsboerse.net/immodetail/33630924	97.87	3	Wunderschöne 3-Zimmer-Wohnung in Düsseldorf	73	40629	Am	51.2454	6.85118	2009
33630974	https://www.wohnungsboerse.net/immodetail/33630974	37.79	1	Charmante 1-Zimmer Wohnung in Düsseldorf	14	40477	Duisburger	51.2367	6.77991	1996
33631016	https://www.wohnungsboerse.net/immodetail/33631016	275	7	Repräsentative Altbauwohnung in erster Rheinlage in Düsseldorf - Golzheim	16	40474	\N	51.2738	6.74219	1925
33631174	https://www.wohnungsboerse.net/immodetail/33631174	51.3	2	Gemütliche Erdgeschosswohnung	36	40223	Brachtstraße	51.2081	6.77895	2012
33633119	https://www.wohnungsboerse.net/immodetail/33633119	63	2	Eine helle 2-Zimmer Wohnung mit Balkon, Einbauküche und Tiefgaragenstellplatz	14	40477	\N	51.2385	6.78498	\N
33633121	https://www.wohnungsboerse.net/immodetail/33633121	74	3	Stilvolle 3-Zimmer-Wohnung mit Balkon in Düsseldorf	98	40599	Kulmer	51.1788	6.86782	\N
33633146	https://www.wohnungsboerse.net/immodetail/33633146	79	2	Stilvolle, geräumige und modernisierte 2-Zimmer-Dachgeschoss - Wohnung -	41	40545	Dominikanerstraße	51.2306	6.75115	1904
33633149	https://www.wohnungsboerse.net/immodetail/33633149	20	1	Vollmoblierte Einzimmerwohnung für junge Berufstätige, Studierende und Praktikanten	64	40239	Heinrichstraße	51.247	6.8089	\N
33633187	https://www.wohnungsboerse.net/immodetail/33633187	42	1	Suche Nachmieter für gemütliches 2-Zimmer Souterrainwohnung ab dem 01.01.24 in Derendorf	15	40476	Sommersstraße	51.2455	6.79024	\N
33633189	https://www.wohnungsboerse.net/immodetail/33633189	40	1	Geschmackvolle und geräumige Wohnung mit einem Zimmer sowie Balkon und EBK in Düsseldorf	71	40625	\N	51.2358	6.85232	\N
33633208	https://www.wohnungsboerse.net/immodetail/33633208	51	2	1050 € - 51 m² - 2.0 Zi.\nZwischen 01.12.2023-01.04.2023, verhandelbar	14	40221	\N	51.1997	6.75072	\N
33633219	https://www.wohnungsboerse.net/immodetail/33633219	38	2	2 Zimmer Wohnung in beliebter Lage in Pempelfort	14	40477	Schwerinstraße	51.2396	6.77867	\N
33633321	https://www.wohnungsboerse.net/immodetail/33633321	70	3	Tauschwohnung: Tausche 70qm, 3Z+KDB, Altbau gg. kl. Wohnung Flingern-Nord	22	40235	\N	51.2294	6.82752	\N
33633393	https://www.wohnungsboerse.net/immodetail/33633393	43	1	Tauschwohnung: 1 Zimmer Wohnung mit Balkon gegen 2 Zimmer-Wohnung	14	40477	\N	51.2385	6.78498	\N
33633478	https://www.wohnungsboerse.net/immodetail/33633478	60	2	Singlewohnung mit Dachterasse im 3. OG	23	40237	\N	51.2357	6.80917	1950
33633541	https://www.wohnungsboerse.net/immodetail/33633541	73	2.5	Tauschwohnung: 2,5-Zimmer Wohnung in Pempelfort	14	40477	\N	51.2385	6.78498	\N
33633812	https://www.wohnungsboerse.net/immodetail/33633812	29	2	Voll möbliertes Apartment zwischen Henkel und Uni ab sofot	91	40591	\N	51.188	6.81736	1969
33634500	https://www.wohnungsboerse.net/immodetail/33634500	70	2	Altbau Unikat mit 4m hohen Wänden in der Gneisenaustr. in Pempelfort	14	40477	\N	51.2385	6.78498	1960
33634501	https://www.wohnungsboerse.net/immodetail/33634501	130	3	Hochwertiges, geräumiges 3-Zimmer-Penthouse mit zwei Terassen in Düsseldorf	84	40627	\N	51.2024	6.88388	\N
33634504	https://www.wohnungsboerse.net/immodetail/33634504	63	2	Sehr gut geschnittene 2-Zimmer-Wohnung mit Balkon in Düsseldorf	63	40472	Oberrather	51.266	6.82577	\N
33634529	https://www.wohnungsboerse.net/immodetail/33634529	30	1	Stilvolle 1-Zimmer-Wohnung mit Balkon und Einbauküche in Benrath, Düsseldorf	95	40597	\N	51.1638	6.87102	\N
33634581	https://www.wohnungsboerse.net/immodetail/33634581	65	2	2-Zimmer-Wohnung in Düsseldorf Neubau Erstbezug	36	40223	Gogrevestr.	51.2079	6.78452	2023
33634700	https://www.wohnungsboerse.net/immodetail/33634700	74.17	3	Traumhafte Neubauwohnung in Vennhausen	83	40627	Vennhauser	51.2105	6.861	2022
33634724	https://www.wohnungsboerse.net/immodetail/33634724	85	3	Tauschwohnung: Tausche 3 Zimmer Traumwohnung gegen Haus	36	40225	\N	51.1974	6.78988	\N
33634843	https://www.wohnungsboerse.net/immodetail/33634843	85	3	Tauschwohnung: Tausche eine 3 Zimmer Wohnung gegen eine 2 Zimmer Wohnung	13	40212	\N	51.2236	6.78053	\N
33634877	https://www.wohnungsboerse.net/immodetail/33634877	50	2	ERSTBEZUG NACH SANIERUNG, SCHÖNE HELLE 2 ZIMMER DACHGESCHOSSWOHNUNG MIT GROßEM BALKON	82	40229	Braunfelsweg	51.198	6.82955	1968
33634906	https://www.wohnungsboerse.net/immodetail/33634906	100	2	Tauschwohnung: Besondere, loftartige Maisonette-Wohnung in DUS gegen Köln	13	40210	\N	51.2225	6.78772	\N
33635095	https://www.wohnungsboerse.net/immodetail/33635095	45.56	1.5	Renovierte SINGLE-Whg. mit ruhigem Balkon nahe Medienhafen	32	40219	Neckarstraße	51.2137	6.75624	1974
33636511	https://www.wohnungsboerse.net/immodetail/33636511	67	2	Exklusive 2-Zimmer-Wohnung mit Balkon und Einbauküche in Düsseldorf	37	40227	Eisenstraße	51.2173	6.79814	\N
33636555	https://www.wohnungsboerse.net/immodetail/33636555	90	3	Geschmackvolle Wohnung mit drei Zimmern, incl. Einbauküche,  Balkon und Stellplatz,	36	40223	Martinstrasse	51.2088	6.76368	\N
33636639	https://www.wohnungsboerse.net/immodetail/33636639	83	3	Tauschwohnung: 3,5ZKDB Düsseldorf und Suche 2ZKDB in Düsseldorf oder Köln	62	40472	\N	51.2685	6.83379	\N
33636718	https://www.wohnungsboerse.net/immodetail/33636718	61	2	Moderne, helle Single-Wohnung mit Balkon zum Innenhof	21	40233	\N	51.2198	6.8119	1958
33636749	https://www.wohnungsboerse.net/immodetail/33636749	78.87	2	MIT 360 GRAD RUNDGANG-TOP GEPFLEGTE 2 ZIMMER WOHNUNG MIT EBK, GROßER TERRASSE UND SEHR RUHIGER LAGE	83	40627	Zwickauer	51.2076	6.85455	1997
33636783	https://www.wohnungsboerse.net/immodetail/33636783	95	2.5	Tauschwohnung: große 2,5 Zimmer 95 qm/2 Wohnung, im Tausch gegen 60 qm/2	64	40470	\N	51.2569	6.80771	\N
33636840	https://www.wohnungsboerse.net/immodetail/33636840	78	3	Charmante  3-Zimmerwohnung mit Balkon am Klemensplatz in Kaiserswerth!	53	40489	\N	51.3305	6.76259	1984
33636857	https://www.wohnungsboerse.net/immodetail/33636857	42.4	1	47101/121 Sonniges 1-Zimmer-Appartement mit Balkon in D-Reisholz	94	40599	Kappeler	51.1758	6.8597	1951
33636941	https://www.wohnungsboerse.net/immodetail/33636941	116	3	WOHNEN UND ARBEITEN UNTER EINEM DACH - ZENTRAL IM ZOO-VIERTEL	23	40237	\N	51.2357	6.80917	1956
33637056	https://www.wohnungsboerse.net/immodetail/33637056	30.36	1	Appartment in Oberbilk zu vermieten	37	40227	Kruppstraße	51.2116	6.79699	1985
33638037	https://www.wohnungsboerse.net/immodetail/33638037	45	2	Exklusive 2-Zimmer-Wohnung mit Balkon in ruhiger Grünlage Nähe Flughafencity	62	40468	Hiddenseestrasse	51.2741	6.77948	1995
33638048	https://www.wohnungsboerse.net/immodetail/33638048	59	2	2 Zimmer Wohnung in Düsseldorf-Benrath mit Tiefgaragenstellplatz	95	40597	Schimmelpfennigstraße	51.1618	6.88769	1976
33638071	https://www.wohnungsboerse.net/immodetail/33638071	59	3.5	Geschmackvolle Wohnung mit dreieinhalb Zimmern sowie Balkon und Einbauküche in Düsseldorf	98	40599	Hasselsstr.	51.1728	6.87298	1955
33638100	https://www.wohnungsboerse.net/immodetail/33638100	119	3	Penthouse-Whg, sonnendurchflutet, luxeriös, ruhig Lage, 3 Zi, EBK, 2 große Terrassen	41	40549	Ria-Thiele-Straße	51.2336	6.74329	2012
33638158	https://www.wohnungsboerse.net/immodetail/33638158	65	2	Erstbezug nach Sanierung - Großzügige Dachgeschosswohnung in zentraler Lage	14	40476	Schwerinstr	51.2397	6.77884	1954
33638175	https://www.wohnungsboerse.net/immodetail/33638175	65	2	Tauschwohnung: Schöne, helle 2 Zimmer Altbau Wohnung mit Sonnenbalkon	36	40223	\N	51.1998	6.77225	\N
33638258	https://www.wohnungsboerse.net/immodetail/33638258	82	3	3 Zimmer Wohnung mit 2 Balkonen in Düsseldorf zu vermieten	37	40227	Hüttenstr.	51.2122	6.79186	1949
33638259	https://www.wohnungsboerse.net/immodetail/33638259	114.8	3	3 Raum Wohnung mit Balkon in Düsseldorf zu vermieten	13	40211	Kölner	51.2261	6.79441	1956
33638332	https://www.wohnungsboerse.net/immodetail/33638332	74	2	Tauschwohnung: 2Z Düsseldorf gegen 1-2Z in Köln.	81	40231	\N	51.2135	6.83024	\N
33638345	https://www.wohnungsboerse.net/immodetail/33638345	47	2	** ERSTBEZUG NACH SANIERUNG IN SEHR HELLE  2 ZIMMER ALTBAUWOHNUNG MIT BALKON NÄHE FÜRSTENPLATZ**	31	40215	Oberbilker	51.2111	6.785	1910
33638465	https://www.wohnungsboerse.net/immodetail/33638465	86	2.5	Tauschwohnung: Helle offene DG Wohnung ohne Schrägen	93	40589	\N	51.1641	6.82144	\N
33638530	https://www.wohnungsboerse.net/immodetail/33638530	54.6	2	47104/55 Charmante 2-Zimmer-Dachgeschoss-Wohnung in Wittlaer	54	40489	Heinrich-Holtschneider	51.3179	6.74683	2000
33638532	https://www.wohnungsboerse.net/immodetail/33638532	233	8	Modern renovierte & teilmöblierte 8 Raumwohnung in DÜSSELDORF-Stadtmitte	13	40210	Stresemannstraße	51.2211	6.78434	\N
33638561	https://www.wohnungsboerse.net/immodetail/33638561	36	1	36 m² in Flingern-Süd: 1 Zimmerapartment mit Balkon!	21	40233	Erkrather	51.2218	6.80587	1967
33638643	https://www.wohnungsboerse.net/immodetail/33638643	58.04	2	Großzügiges 2 - Zimmer Penthouse mit EBK und Dachterrasse	15	40476	Metzer	51.2517	6.78515	2024
33638695	https://www.wohnungsboerse.net/immodetail/33638695	46	2	Erstbezug nach Modernisierung / SINGLE-Wohnung mit Balkon u. Gartennutzung	52	42281	Sedanstraße	51.2765	7.19411	\N
33638731	https://www.wohnungsboerse.net/immodetail/33638731	65	2	Top-Wohnlage Duisburg-Wedau Seenplatte, 1. OG, Gartennutzung. max 2 Personen	52	47279	Heimweg	51.3911	6.79367	1932
33640373	https://www.wohnungsboerse.net/immodetail/33640373	84	3	3 Zimmer Wohnung in Hamm/ Düsseldorf	34	40221	Auf	51.2009	6.73609	\N
33640387	https://www.wohnungsboerse.net/immodetail/33640387	43	1.5	Traumhaft schöne kernsanierte 1,5 Zimmer Wohnung mit Terrasse in Düsseldorf Flingern	21	40233	Gerresheimer	51.2258	6.80674	1953
33640529	https://www.wohnungsboerse.net/immodetail/33640529	50	2	Tauschwohnung: Suche 3 Zimmer /biete 2 ZimmerWohnung saniert mit Balkon	62	40468	\N	51.2612	6.7789	\N
33640574	https://www.wohnungsboerse.net/immodetail/33640574	75	2	Tauschwohnung: Biete Düsseldorf, suche Berlin	14	40211	\N	51.2301	6.79288	\N
33640674	https://www.wohnungsboerse.net/immodetail/33640674	31	1	Stilvolle 1-Zimmer-Wohnung mit Einbauküche in Düsseldorf	23	40239	\N	51.2453	6.80322	1956
33640694	https://www.wohnungsboerse.net/immodetail/33640694	50	2.5	Tauschwohnung: Tausche kleinere gegen größere Altbauwohnung in Flingern	22	40233	\N	51.2198	6.8119	\N
33640739	https://www.wohnungsboerse.net/immodetail/33640739	92	3	Moderne City-Wohnung direkt am Hofgarten	14	40479	Inselstraße	51.233	6.77895	1969
33640768	https://www.wohnungsboerse.net/immodetail/33640768	50	1	Tauschwohnung: Wunderschöne Maisonette Wohnung	22	40235	\N	51.2294	6.82752	\N
33640782	https://www.wohnungsboerse.net/immodetail/33640782	56	2	2 Zimmerwohnung mit Balkon Düsseldorf Garath wird teilsaniert ab 01.01.2024 verfügbar	101	40595	Carl-Friedr.-Goerdeler-Straße	51.1446	6.90508	1969
33640807	https://www.wohnungsboerse.net/immodetail/33640807	157	4	Haus in Haus - Großzügige Wohnung mit Garten und Stellplatz im schönen Angermund!	55	40489	\N	51.3305	6.76259	2000
33641694	https://www.wohnungsboerse.net/immodetail/33641694	75	2	Geräumige Wohnung mit zwei Zimmern zur Miete in Düsseldorf	32	40219	Elisabethstraße	51.2143	6.77553	\N
33641824	https://www.wohnungsboerse.net/immodetail/33641824	76.98	3	Barrierefreie 3-Zimmer-Wohnung mit Loggia und Tiefgaragenstellplatz	71	40625	Hallesche	51.2299	6.84925	2012
33641827	https://www.wohnungsboerse.net/immodetail/33641827	40	1.5	Tauschwohnung: Superschöne Single oder Pärchenwohnung	32	40219	\N	51.2135	6.76234	\N
33641929	https://www.wohnungsboerse.net/immodetail/33641929	52.48	2	Singles und Paare aufgepasst! Gemütliche 2- Zimmerwohnung mit Balkon	63	40472	Röhrenstr.	51.2658	6.80645	1951
33641989	https://www.wohnungsboerse.net/immodetail/33641989	50	2	Tauschwohnung: 2 Zimmerwohnung am Hafen	32	40219	\N	51.2135	6.76234	\N
33642049	https://www.wohnungsboerse.net/immodetail/33642049	87	3	Sonnenstraße 21, 40227 Düsseldorf	37	40227	Sonnenstraße	51.2125	6.79293	\N
33642075	https://www.wohnungsboerse.net/immodetail/33642075	46.59	2	Gut geschnittene 2 Zimmerwohnung mit Balkon	95	40597	Melanchthonstraße	51.1667	6.87145	1954
33642096	https://www.wohnungsboerse.net/immodetail/33642096	70	3	Tauschwohnung: Schöne 3 Zimmer Wohnung mit Balkon in Friedrichstadt/Bilk	31	40215	\N	51.2149	6.78256	\N
33642189	https://www.wohnungsboerse.net/immodetail/33642189	58	2	Tauschwohnung: Ich, 30, w, ledig suche nach einem neuen Zuhause	32	40219	\N	51.2135	6.76234	\N
33642252	https://www.wohnungsboerse.net/immodetail/33642252	41	2	Düsseldorf - Unterbilk 2-Zimmer-Wohnung zum 01.03.2024 zu vermieten	36	40221	Vollmerswerther	51.2101	6.76223	\N
33642253	https://www.wohnungsboerse.net/immodetail/33642253	57.15	2	Düsseldorf-Oberbilk, schöne 2-Zimmer-Wohnung zu vermieten	37	40227	Eisenstraße	51.2169	6.80115	1950
33642277	https://www.wohnungsboerse.net/immodetail/33642277	54	2.5	Schicke Single-City-Wohnung, Unterbilk, 54qm, 2,5 Z., teilmöbliert	32	40217	\N	51.2127	6.7754	1956
33642422	https://www.wohnungsboerse.net/immodetail/33642422	71.54	3	Erstbezug - luxuriöse 3 Zimmer Wohnung, 71,54qm, mit Balkon	52	42655	Katternberger	51.1634	7.06872	2024
33642423	https://www.wohnungsboerse.net/immodetail/33642423	82.15	3	Erstbezug - luxuriöse 3 Zimmer Wohnung, 82,15qm, mit Balkon	52	42655	Katternberger	51.1634	7.06872	2024
33642424	https://www.wohnungsboerse.net/immodetail/33642424	106.6	4	Erstbezug - luxuriöse 4 Zimmer Wohnung 106,6qm, mit Terrasse	52	42655	Katternberger	51.1634	7.06872	2024
33642425	https://www.wohnungsboerse.net/immodetail/33642425	46.6	2	Erstbezug - luxuriöse 2 Zimmer Wohnung, 46,60qm, mit Terrasse	52	42655	Katternberger	51.1634	7.06872	2024
33642426	https://www.wohnungsboerse.net/immodetail/33642426	82.28	2	Neubau - Geräumige 2-Zimmer-Wohnung in Solingen	52	42655	Albrechstraße	51.1793	7.07791	2023
33642430	https://www.wohnungsboerse.net/immodetail/33642430	56	2.5	Wohnung an der Uniklinik	36	40225	Moorenstr.	51.1992	6.78923	1963
33642440	https://www.wohnungsboerse.net/immodetail/33642440	60.9	2	Charmante 2-Zimmer-Oase mit Sonnenbalkon in zentraler Wohlfühllage	52	45888	Hammerschmidtstraße	51.5168	7.11071	1961
33642445	https://www.wohnungsboerse.net/immodetail/33642445	84	4	4 Zimmerwohnung	52	47803	Hülser	51.3535	6.53425	\N
33643531	https://www.wohnungsboerse.net/immodetail/33643531	82	3	WG Zimmer zu vermieten	52	50670	Gereonswall	50.9481	6.95223	\N
33644192	https://www.wohnungsboerse.net/immodetail/33644192	60	2	Stilvolle 2-Zimmer-Wohnung mit EBK in Düsseldorf	52	40474	Lantzallee	51.278	6.74064	\N
33644208	https://www.wohnungsboerse.net/immodetail/33644208	50	2.5	Wunderschöne DG Wohnung mit Rheinblick 750 € - 50 m² - 2.5 Zi.	92	40589	\N	51.1641	6.82144	\N
33644285	https://www.wohnungsboerse.net/immodetail/33644285	75	3	Moderne City-Wohnung direkt am Hofgarten	14	40479	Inselstraße	51.233	6.77895	1969
33644286	https://www.wohnungsboerse.net/immodetail/33644286	109	3	Tauschwohnung: Tauschwohnung: Schöne 3 Zimmer mit Balkon in Derendorf	15	40476	\N	51.248	6.77902	\N
33644435	https://www.wohnungsboerse.net/immodetail/33644435	65	3	Moderne Dachgeschoss-Wohnung in Unterbilk	32	40217	\N	51.2127	6.7754	1950
33644497	https://www.wohnungsboerse.net/immodetail/33644497	57	2	Gemütliche 2-Zimmer-Wohnung in Unterbilk	32	40217	\N	51.2127	6.7754	1950
33644575	https://www.wohnungsboerse.net/immodetail/33644575	63	2	SANIERTE 2 ZIMMER WOHNUNG MIT MODERNEM DUSCHBAD, DECKENSPOTS, NACHTSTROMSPEICHER, KÜCHE ZUM VERKAUF	82	40229	Robertstraße	51.2004	6.84064	1972
33645745	https://www.wohnungsboerse.net/immodetail/33645745	70	2	2-Zimmer Wohnung in Oberbilk zu vermieten	37	40227	Höhenstraße	51.2151	6.7988	\N
33645759	https://www.wohnungsboerse.net/immodetail/33645759	43	2	Cosy Wohnung in Bilk �	38	40223	Fleher	51.1924	6.76996	\N
33645816	https://www.wohnungsboerse.net/immodetail/33645816	80	3	Attraktive 3-Zimmer-Wohnung zur Miete in Düsseldorf	71	40625	\N	51.2358	6.85232	\N
33645830	https://www.wohnungsboerse.net/immodetail/33645830	60	2	Attraktive 2-Raum-Wohnung mit EBK und Balkon in Düsseldorf	63	40472	Rather	51.2637	6.80634	1950
33645974	https://www.wohnungsboerse.net/immodetail/33645974	35	2	Tolle frisch renovierte 2 Zimmer-Wohnung mit Balkon	42	40549	Pestalozzistraße	51.2307	6.71998	1997
33645989	https://www.wohnungsboerse.net/immodetail/33645989	38	1	Tauschwohnung: Tausche 1-Zimmer Wohnung gegen 2-Zimmer Wohnung! :)	13	40211	\N	51.2301	6.79288	\N
33646060	https://www.wohnungsboerse.net/immodetail/33646060	73.37	2	Komfortable Wohnung in aufstrebender Lage in Derendorf	15	40476	Metzer	51.2491	6.78461	2005
33646080	https://www.wohnungsboerse.net/immodetail/33646080	84	3	HELL UND LUFTIG - WOHLFÜHL-WOHNUNG IN SUPER LAGE VON OBERKASSEL! BALKON!	41	40545	Belsenstraße	51.2304	6.74616	1949
33646100	https://www.wohnungsboerse.net/immodetail/33646100	77	3	MIT 360 GRAD RUNDGANG - SCHÖNE HELLE 3 ZIMMER WOHNUNG IN ZENTRALER LAGE VON ELLER,EBK, 2 BALKONE	82	40229	Anhalter	51.2012	6.83612	1962
33646136	https://www.wohnungsboerse.net/immodetail/33646136	45	2	Tauschwohnung: Suche schönes Zuhause in Münster, biete tolle Wohnung in DUS	15	40476	\N	51.248	6.77902	\N
33646238	https://www.wohnungsboerse.net/immodetail/33646238	200	5	Düsseldorf-Pempelfort: Exklusive 6-Zimmer-Jugendstil-Garten-Maisonette-Wohnung!	14	40479	\N	51.2333	6.78371	1910
33646277	https://www.wohnungsboerse.net/immodetail/33646277	82	3	Pfiffige 3 Zimmer Split-Level Wohnung mit viel Flair in begehrter Lage von D-Wersten!	91	40591	Fritz-Strassmann-Straße	51.1777	6.81027	1982
33646337	https://www.wohnungsboerse.net/immodetail/33646337	118	3	Wunderschöne 3-Zimmer-Wohnung in Düsseldorf	73	40629	Am	51.2456	6.85106	2009
33646382	https://www.wohnungsboerse.net/immodetail/33646382	150	3.5	Wohnen und arbeiten am See in Düsseldorf-Unterbach	84	40627	\N	51.2024	6.88388	1980
33646532	https://www.wohnungsboerse.net/immodetail/33646532	67	2	Lichtdurchflutete, vollmöblierte 2-Zi.-Whg. Toplage in Golzheim, Loggia & Blick ins Grüne!	16	40474	Friedrich-Lau-Straße	51.2557	6.75757	1960
33648553	https://www.wohnungsboerse.net/immodetail/33648553	169	3	Hochwertig möbliertes Luxus Penthouse mit Rheinblick - Düsseldorf Volmerswerth	35	40221	\N	51.1997	6.75072	\N
33648664	https://www.wohnungsboerse.net/immodetail/33648664	38	2	Wieder verfügbar: 2-Zimmer-City-Wohnung mit Pantry-Küche	31	40215	Corneliusstrasse	51.2132	6.7826	1962
33648674	https://www.wohnungsboerse.net/immodetail/33648674	41	2	Objekt nicht gefunden	14	40479	\N	51.2333	6.78371	\N
33648724	https://www.wohnungsboerse.net/immodetail/33648724	100	3	Freundliche 3-Zimmer-Maisonette-Wohnung in Düsseldorf Himmelgeist	92	40589	\N	51.1641	6.82144	\N
33648739	https://www.wohnungsboerse.net/immodetail/33648739	47.24	2	AB 01.03 - Schicke 2-Zimmer-Wohnung, kürzlich saniert	98	40599	Süllenstr.	51.1722	6.87062	1955
33648905	https://www.wohnungsboerse.net/immodetail/33648905	95	3	Attraktive 3-Zimmer-Wohnung mit gehobener Innenausstattung in Düsseldorf	12	40213	\N	51.2221	6.77271	\N
33648973	https://www.wohnungsboerse.net/immodetail/33648973	45	2	Tauschwohnung: Tausch 2 gegen 3 (DD-Köln oder DD-DD)	15	40476	\N	51.248	6.77902	\N
33649009	https://www.wohnungsboerse.net/immodetail/33649009	120	3	Tauschwohnung: Tausche Top-Altbau-Wohnung gegen ähnliches in kleiner	23	40239	\N	51.2453	6.80322	\N
33649052	https://www.wohnungsboerse.net/immodetail/33649052	60	2	FISCHER Str.,Düsseldorf-Pempelfort, Nähe Hofgarten, Rhein, 2 Zi., Bad, Panoramablick! Exkusiv!	14	40477	\N	51.2385	6.78498	1903
33649071	https://www.wohnungsboerse.net/immodetail/33649071	51.39	2	Moderne 2-Zimmer-Wohnung in einer der schönsten Straßen der Düsseldorfer Altstadt	11	40213	\N	51.2221	6.77271	\N
33649147	https://www.wohnungsboerse.net/immodetail/33649147	65	1	Geräumige, halbmöbliert, ausländerfreundlich Studio-Wohnung mit Küche in Düsseldorf	31	40215	Jahnstraße	51.2127	6.78086	\N
33649170	https://www.wohnungsboerse.net/immodetail/33649170	39	1	Geräumige und günstige 1-Zimmer Wohnung in zentraler Lage	13	40211	Worringerstraße	51.2252	6.79588	\N
33649941	https://www.wohnungsboerse.net/immodetail/33649941	154	5	Neuwertige Whg mit 5 Zimmern - Vermietung an Monteure, Messe, Projektmitarbeiter	63	40472	\N	51.2685	6.83379	2020
33649969	https://www.wohnungsboerse.net/immodetail/33649969	41	1	Wohnen im Herzen von Viersen	92	41747	Haupstraße	51.2536	6.39292	1967
33649987	https://www.wohnungsboerse.net/immodetail/33649987	58	2.5	Freundliche 2,5-Zimmer-Wohnung in 40625, Düsseldorf	71	40625	\N	51.2358	6.85232	1962
33650008	https://www.wohnungsboerse.net/immodetail/33650008	60	2	Tauschwohnung: Tausche 2 Zimmer in DUS gegen größere Wohnung in Düsseldorf	31	40215	\N	51.2149	6.78256	\N
33650044	https://www.wohnungsboerse.net/immodetail/33650044	63	2	Renov. 2-Zi., Einbauküche, ca. 63 m², € 650,-- !	37	40227	Solinger	51.2124	6.80156	1954
33650174	https://www.wohnungsboerse.net/immodetail/33650174	55	2	*****CHARMANTE 2-ZIMMERWOHNUNG IM HERZEN VON PEMPELFORT*****	14	40477	Stockkampstraße	51.2368	6.78926	1953
33650201	https://www.wohnungsboerse.net/immodetail/33650201	64	3	Tauschwohnung: Schöne Wohnung nahe Lorettostr, Medienhafen und Rhein	32	40217	\N	51.2127	6.7754	\N
33650244	https://www.wohnungsboerse.net/immodetail/33650244	49.5	2	Eleganz mit Geschichte - Attraktive 2-Zimmer-Wohnung im Dreiflügelhaus in Düsseldorf-Wittlaer	54	40489	\N	51.3305	6.76259	1908
33650252	https://www.wohnungsboerse.net/immodetail/33650252	41	2	Lichdurchflutete zentrale  2-Zimmer Wohnung	36	40223	Niederstr.	51.2079	6.76666	\N
33650258	https://www.wohnungsboerse.net/immodetail/33650258	139	4	Wohnen im Herzen von Oberkassel	41	40545	Dominikanerstraße	51.2309	6.75141	1905
33650266	https://www.wohnungsboerse.net/immodetail/33650266	65	2	Moderne 2 ZI.-Wohnung mit zwei Balkonen in Düsseltal	23	40239	Brehmstr.	51.243	6.8014	1954
33650288	https://www.wohnungsboerse.net/immodetail/33650288	89.11	2	***Wunderschöne 2-Zimmer-Wohnung mit Terrasse in Düsseldorf***	73	40629	Am	51.2455	6.84997	2009
33650301	https://www.wohnungsboerse.net/immodetail/33650301	81	3	3 Zimmer Erdgeschosswohnung	36	40225	Witzelstraße	51.2013	6.78787	2016
33650317	https://www.wohnungsboerse.net/immodetail/33650317	61	2	Tauschwohnung: 2- Zimmer + Balkon in Toplage in Unterbilk	32	40219	\N	51.2135	6.76234	\N
33650359	https://www.wohnungsboerse.net/immodetail/33650359	42.77	2	Schöne 2-Zimmer-DG-Wohnung in Düsseldorf	93	40589	Hinter	51.1782	6.83316	\N
33650392	https://www.wohnungsboerse.net/immodetail/33650392	79	2	Tauschwohnung: Wunderschöne Wohnung in Kaiserswerth	53	40489	\N	51.3305	6.76259	\N
33650432	https://www.wohnungsboerse.net/immodetail/33650432	60.5	2	2-Zimmer-2.OG-Wohnung - hochwertige Einbauküche - Balkon - Tiefgaragenstellplatz	84	40627	\N	51.2024	6.88388	2023
33650433	https://www.wohnungsboerse.net/immodetail/33650433	115.5	4	4-Zimmer-2.OG-Wohnung - hochwertige Einbauküche - Balkon - Tiefgaragenstellplatz	84	40627	\N	51.2024	6.88388	2023
33650434	https://www.wohnungsboerse.net/immodetail/33650434	115.5	4	4-Zimmer-1.OG-Wohnung - hochwertige Einbauküche - Balkon - Tiefgaragenstellplatz	84	40627	\N	51.2024	6.88388	2023
33650435	https://www.wohnungsboerse.net/immodetail/33650435	89.5	2	2-Zimmer-Penthouse - hochwertige Einbauküche - Dachterrasse - Tiefgaragenstellplatz	84	40627	\N	51.2024	6.88388	2023
33650436	https://www.wohnungsboerse.net/immodetail/33650436	115.5	4	4-Zimmer-2.OG-Wohnung - hochwertige Einbauküche - Balkon - Tiefgaragenstellplatz	84	40627	\N	51.2024	6.88388	2023
33650437	https://www.wohnungsboerse.net/immodetail/33650437	41	2	Geschmackvolle 2-Raum-Wohnung mit Balkon und EBK in Düsseldorf	91	40591	Kölner	51.1868	6.81877	\N
33650581	https://www.wohnungsboerse.net/immodetail/33650581	63.02	3	Ansehen, einziehen, wohlfühlen!	101	40595	Stettiner	51.1454	6.8995	1971
33652420	https://www.wohnungsboerse.net/immodetail/33652420	100	3	Tauschwohnung: Weitläufige 3-Zimmer Altbau-Wohnung mit Terrasse	13	40211	\N	51.2301	6.79288	\N
33652444	https://www.wohnungsboerse.net/immodetail/33652444	27.3	1	Single-Apartment in Flingern!	21	40233	Erkrather	51.2218	6.80587	1967
33652461	https://www.wohnungsboerse.net/immodetail/33652461	130	4.5	Voll möbliert mit 500qm Garten, hochwertig in bester Lage, nähe von ISD und St. George ,	54	40489	An	51.3238	6.74093	\N
33652464	https://www.wohnungsboerse.net/immodetail/33652464	29	1	Modernes Wohnen in Derendorf: Gemütliches 1-Zimmer-Apartment mit stilvoller Einbauküche!	15	40476	Becherstraße	51.2458	6.79209	1978
33652479	https://www.wohnungsboerse.net/immodetail/33652479	96.4	3	Ihr neues Zuhause! Helle 3 Zimmer-Wohnung mit Einbauküche und Tiefgaragenstellplatz mit Wallbox!	22	40235	Röpkestraße	51.2325	6.82691	2017
33652548	https://www.wohnungsboerse.net/immodetail/33652548	85	3	Tauschwohnung: Wunderschöne Altbauwohnung mit Balkon in Flingern-Nord	22	40235	\N	51.2294	6.82752	\N
33652634	https://www.wohnungsboerse.net/immodetail/33652634	80	4	TOP 4 Zimmer-Wohnung mit Balkon, gelegen im schönen Unterbach	84	40627	\N	51.2024	6.88388	1973
33652709	https://www.wohnungsboerse.net/immodetail/33652709	79	3	Gepflegte 3 Zimmer Wohnung in Pempelfort WG-tauglich	14	40479	Derendorfer	51.237	6.78983	1949
33652720	https://www.wohnungsboerse.net/immodetail/33652720	129.69	3	Individuelles 3 Raum "Garden House" mit offener Küche, EBK und Terrasse	14	40211	Beuthstr.	51.2317	6.7912	2010
33652804	https://www.wohnungsboerse.net/immodetail/33652804	263	6	Hochwertig sanierte Art Déco Wohnung in bevorzugter Wohnlage von Düsseldorf - Golzheim	16	40474	\N	51.2738	6.74219	1927
33652815	https://www.wohnungsboerse.net/immodetail/33652815	35	1	*Traumhaftes Apartment *+offene Küche*modernes Bad* Flottenstraße	82	40229	Flottenstraße	51.1979	6.83793	1964
33652836	https://www.wohnungsboerse.net/immodetail/33652836	52.8	2.5	�2 Balkone� | 2 Zimmer | Wohnküche | WG geeignet	31	40215	Mintropstraße	51.2186	6.7889	1956
33652853	https://www.wohnungsboerse.net/immodetail/33652853	71.63	3	Sanierte 3 Zimmer Wohnung in Düsseldorf Eller	82	40229	Auf´m	51.2016	6.84187	1955
33652875	https://www.wohnungsboerse.net/immodetail/33652875	57	2	Gemütliche Altbau-Balkon- Wohnung sofort für Sie frei! Langerstraße	21	40233	Langerstraße	51.223	6.80396	1950
33652955	https://www.wohnungsboerse.net/immodetail/33652955	32	1	Objekt nicht gefunden	37	40227	Mindenerstr.	51.2134	6.80927	1950
33653012	https://www.wohnungsboerse.net/immodetail/33653012	60.93	2	Schöne Erdgeschoss-Wohnung mit 2-Zimmern und Balkon	95	40597	Calvinstraße	51.166	6.87234	1995
33653022	https://www.wohnungsboerse.net/immodetail/33653022	31.25	1	Moderne 1-Zimmer Etagenwohnung in Düsseldorf - Mörsenbroich	23	40239	Heinrichstraße	51.2488	6.80387	1963
33653023	https://www.wohnungsboerse.net/immodetail/33653023	43.45	2	Moderne 2-Zimmer Souterrainwohnung in Düsseldorf - Düsseltal	23	40239	Ahnfeldstr.	51.2426	6.79713	1952
33653026	https://www.wohnungsboerse.net/immodetail/33653026	46.93	2	Moderne 2-Zimmer Etagenwohnung in Düsseldorf - Düsseltal	23	40237	Gellertstr.	51.2414	6.81992	1961
33653030	https://www.wohnungsboerse.net/immodetail/33653030	64.52	3	Moderne 3-Zimmer Etagenwohnung in Düsseldorf - Düsseltal	23	40237	Gellerstr.	51.242	6.8178	1961
33653031	https://www.wohnungsboerse.net/immodetail/33653031	71.9	4	Moderne 4-Zimmer Dachgeschosswohnung in Düsseldorf - Derendorf	15	40468	Heinrich-Ehrhard-Str.	51.2542	6.78539	1961
33653060	https://www.wohnungsboerse.net/immodetail/33653060	49.23	2	Gemütliche 2-Zimmer-Dachgeschosswohnung in Düsseltal	23	40239	Boltensternstraße	51.242	6.79866	1952
33653063	https://www.wohnungsboerse.net/immodetail/33653063	80	3	Sie wollen Citylife? Die Kö und die Altstadt fußläufig erreichbar! 2. OG, Aufzug, EBK, modern!	14	40477	Nordstraße	51.2378	6.77939	2019
33653065	https://www.wohnungsboerse.net/immodetail/33653065	62	3	Mörsenbroich! Schicke 3-Zi.-Whg. im Erdgeschoss	64	40470	Mörsenbroicher	51.2515	6.80498	1953
33653093	https://www.wohnungsboerse.net/immodetail/33653093	70	2	Gepflegte 2-Raum-Wohnung  in Düsseldorf	31	40217	Friedrichstraße	51.2106	6.77685	1968
33654190	https://www.wohnungsboerse.net/immodetail/33654190	45	1	Modernes Apartment für Berufseinsteiger mitten in Friedrichstadt	31	40215	Jahnstraße	51.2113	6.78087	1957
33654229	https://www.wohnungsboerse.net/immodetail/33654229	106	3	Geräumige Wohnung mit drei Zimmern sowie Terrasse und Einbauküche in Düsseldorf	36	40225	Oertelstrasse	51.2018	6.78834	2017
33654290	https://www.wohnungsboerse.net/immodetail/33654290	110	3	I. OG Schöne Aussicht - große  Terrasse - Blick ins Grüne	73	40629	\N	51.255	6.88361	1950
33654373	https://www.wohnungsboerse.net/immodetail/33654373	50	1.5	Tauschwohnung: Zentrale Lage Düsseldorf gegen Stuttgart	31	40215	\N	51.2149	6.78256	\N
33654399	https://www.wohnungsboerse.net/immodetail/33654399	61.2	3	3 Raum Dachgeschoss Wohnung in Düsseldorf zu vermieten	31	40215	Scheurenstr.	51.2179	6.78735	1948
33654426	https://www.wohnungsboerse.net/immodetail/33654426	96.4	3	Helle 3 Zimmer-Wohnung mit Einbauküche und Tiefgaragenstellplatz mit Wallbox!	22	40235	\N	51.2294	6.82752	2017
33654450	https://www.wohnungsboerse.net/immodetail/33654450	75	2	Tauschwohnung: Neu sanierte Wochnung mit hohe Decken und schönem Stuck	64	40470	\N	51.2569	6.80771	\N
33654518	https://www.wohnungsboerse.net/immodetail/33654518	60	2	Immobilien-Richter: Kernsanierte möblierte 2-Zimmerwohnung in Düsseldorf	98	40599	\N	51.1825	6.8657	1955
33654555	https://www.wohnungsboerse.net/immodetail/33654555	74	3.5	Tauschwohnung: Schöner Neubau mitten in Düsseldorf	37	40227	\N	51.2154	6.79757	\N
33654580	https://www.wohnungsboerse.net/immodetail/33654580	91.5	2	Stilvoll wohnen in Wittlaer - 2-Zimmer Maisonettewohnung im historischen Dreiflügelhaus	54	40489	\N	51.3305	6.76259	1908
33654597	https://www.wohnungsboerse.net/immodetail/33654597	156	3	Gartenwohnung in einem freistehenden Zweifamilienhaus in D'dorf-Unterrath in ruhiger Lage	62	40468	\N	51.2612	6.7789	2017
33654609	https://www.wohnungsboerse.net/immodetail/33654609	52	2	Gemütliche 2- Zimmer Erdgeschosswohnung in zentraler Lage	14	40479	\N	51.2333	6.78371	1952
33654631	https://www.wohnungsboerse.net/immodetail/33654631	117	4	** Traumhafte Altbauwohnung im Zooviertel**	23	40239	Grunerstr.	51.2433	6.80075	1935
33654646	https://www.wohnungsboerse.net/immodetail/33654646	51	1.5	Tauschwohnung: Moderne Altbauwohnung mit perfektem Schnitt und Balkon	31	40215	\N	51.2149	6.78256	\N
33654675	https://www.wohnungsboerse.net/immodetail/33654675	50	1	Gemütliches Appartement mit sep. Schlafzimmer in Flehe	38	40223	\N	51.1998	6.77225	1997
33654824	https://www.wohnungsboerse.net/immodetail/33654824	112	3	Frisch renovierte 3-Zimmer Wohnung im Obergeschoss	72	40235	Simrockstraße	51.2417	6.82228	\N
33654826	https://www.wohnungsboerse.net/immodetail/33654826	55	2	Frisch renovierte 2-Zimmer-Wohnung in Düsseldorf Friedrichstadt mit 2 Balkonen	31	40215	Bilker	51.211	6.7815	1960
33654834	https://www.wohnungsboerse.net/immodetail/33654834	45	1	Exklusive, geräumige und gepflegte 1-Zimmer-Wohnung mit Balkon in Düsseldorf	62	40468	Kalkumer	51.2734	6.77377	\N
33654859	https://www.wohnungsboerse.net/immodetail/33654859	53.67	2	Sanierte 2-Zimmer-Wohnung in Düsseldorf Friedrichstadt mit 2 Balkonen	31	40215	Bilker	51.211	6.7815	1960
33654905	https://www.wohnungsboerse.net/immodetail/33654905	161.68	4	40 qm Terrasse! 4-Zimmer-Wohnung  mit EBK, Kamin & Doppelgarage für gehobene Ansprüche	51	40474	Niederrheinstraße	51.2689	6.74668	\N
33656730	https://www.wohnungsboerse.net/immodetail/33656730	62	2	Maisonetten Wohnung mit Balkon in Düsseldorf- Urdenbach	96	40593	\N	51.1403	6.86854	\N
33656776	https://www.wohnungsboerse.net/immodetail/33656776	52	2	2-Zimmer Wohnung möbliert und voll ausgestattet, befristet 1 Jahr	13	40210	Grupellostraße	51.2208	6.78689	1951
33656846	https://www.wohnungsboerse.net/immodetail/33656846	60	2	Attraktive 2-Zimmer-Wohnung mit Einbauküche in Düsseldorf	11	40213	\N	51.2221	6.77271	\N
33656930	https://www.wohnungsboerse.net/immodetail/33656930	67	2	Tauschwohnung: Tausche wunderschöne 2-Z-Whg mit in Düsseltal gegen größere	23	40239	\N	51.2453	6.80322	\N
33656962	https://www.wohnungsboerse.net/immodetail/33656962	69.63	3	Endlich Zuhause: sanierte 3-Zimmer-Wohnung mit Balkon	62	40472	Mintarder	51.2787	6.79269	1967
33656971	https://www.wohnungsboerse.net/immodetail/33656971	88.41	4	Helle 4-Zimmer-Wohnung mit neuem Tageslichtbad und Balkon	62	40472	Mintarder	51.2784	6.79284	1967
33657003	https://www.wohnungsboerse.net/immodetail/33657003	58	2	Tauschwohnung: Suche 2 Zimmer in Berlin - biete 2-Zimmer  in Flingern Nord	22	40235	\N	51.2294	6.82752	\N
33657110	https://www.wohnungsboerse.net/immodetail/33657110	38	1.5	Tauschwohnung: Suche Wohnung näher zur HSD	36	40223	\N	51.1998	6.77225	\N
33657148	https://www.wohnungsboerse.net/immodetail/33657148	75	2	Tauschwohnung: Heller Altbau Unterbilk mit Erker	32	40219	\N	51.2135	6.76234	\N
33657182	https://www.wohnungsboerse.net/immodetail/33657182	33	1	Tauschwohnung: Zentrale Düsseldorfer Wohnung mit Schlafzimmer und Wohnküche	31	40215	\N	51.2149	6.78256	\N
33657206	https://www.wohnungsboerse.net/immodetail/33657206	65	2	2-Zi. Whg. zentral und im Grünen am Elbroichpark	93	40589	Bahlenstrasse	51.1761	6.82872	1989
33657958	https://www.wohnungsboerse.net/immodetail/33657958	68	2.5	Exclusive Wg mit Parkgartenbalkon in 2 Fam. Stadtvilla	97	45699	Hospitalstraße	51.5945	7.14642	\N
33657988	https://www.wohnungsboerse.net/immodetail/33657988	61	2	Helle, attraktive Maisonette-Wohnung in Unterrath, ruhiger Lage	62	40468	Hoferhofstraße	51.2713	6.78813	1973
33657994	https://www.wohnungsboerse.net/immodetail/33657994	40	2	Gemütliche 2-Zimmer-Dachgeschoss-Wohnung in Düsseldorf Lierenfeld	81	40231	\N	51.2135	6.83024	\N
33658003	https://www.wohnungsboerse.net/immodetail/33658003	66	3	560 € - 66 m² - 3.0 Zi.	93	40589	\N	51.1641	6.82144	\N
33658014	https://www.wohnungsboerse.net/immodetail/33658014	105	3	Lichtdurchflutet und zentral gelegener 3-Zimmer Wohnung mit offener Raumgestaltung	37	40227	Eintrachtstraße	51.2206	6.79982	1980
33658026	https://www.wohnungsboerse.net/immodetail/33658026	44	2	Tauschwohnung: Singlewohnung zum Tausch in Bilk	36	40223	\N	51.1998	6.77225	\N
33658058	https://www.wohnungsboerse.net/immodetail/33658058	65	2	Tauschwohnung: Helle moderne Zweizimmerwohnung mit großem Südbalkon	15	40476	\N	51.248	6.77902	\N
33658059	https://www.wohnungsboerse.net/immodetail/33658059	36	1	gemütliches Appartement mit Loggia, gute Verkehrsanbindung	35	40221	\N	51.1997	6.75072	1975
33658070	https://www.wohnungsboerse.net/immodetail/33658070	77	2	gemütliche Souterrain-Wohnung mit 2 Zimmern, gute Verkehrsanbindung	35	40221	\N	51.1997	6.75072	1975
33658095	https://www.wohnungsboerse.net/immodetail/33658095	30	1	Tauschwohnung: Tausche zentrale 1 Zimmer Wohnung in Friedrichstadt gegen	31	40215	\N	51.2149	6.78256	\N
33658120	https://www.wohnungsboerse.net/immodetail/33658120	68	2	Tauschwohnung: Wunderschöne Altbauwohnung Flingern	22	40235	\N	51.2294	6.82752	\N
33659133	https://www.wohnungsboerse.net/immodetail/33659133	71.52	3	534 € - 71.52 m² - 3.0 Zi.	37	40227	\N	51.2154	6.79757	\N
33659148	https://www.wohnungsboerse.net/immodetail/33659148	64.2	2	Sonnige Maisonette-Wohnung mit Balkon in Düsseldorf - Unterbilk	36	40223	\N	51.1998	6.77225	1981
33659164	https://www.wohnungsboerse.net/immodetail/33659164	97	3	Sanierte Altbau-Wohnung mit drei Zimmern und großem Balkon in Düsseldorf	82	40229	Am	51.2024	6.84149	\N
33659245	https://www.wohnungsboerse.net/immodetail/33659245	61	2	Tauschwohnung: Zwei Zimmer Wohnung mit Aussicht	91	40589	\N	51.1641	6.82144	\N
33659298	https://www.wohnungsboerse.net/immodetail/33659298	36	1.5	Tauschwohnung: Schöne 1,5 Zimmer Wohnung in Pempelfort	14	40479	\N	51.2333	6.78371	\N
33659335	https://www.wohnungsboerse.net/immodetail/33659335	46	2	Möbilierte, moderne Zwei-Zimmer Wohnung in zentraler Lage	13	40210	\N	51.2225	6.78772	\N
33659343	https://www.wohnungsboerse.net/immodetail/33659343	30	1	Tauschwohnung: Wunderschöne Wohnung im Herzen Düsseldorfs abzugeben!	11	40213	\N	51.2221	6.77271	\N
33659417	https://www.wohnungsboerse.net/immodetail/33659417	64	2	sanierte 2-Zimmer-DG-Wohnung KDB im 5.OG	37	40227	Ellerstraße	51.2158	6.79665	1959
33659423	https://www.wohnungsboerse.net/immodetail/33659423	33	2	Apartment	22	40233	\N	51.2198	6.8119	1958
33660075	https://www.wohnungsboerse.net/immodetail/33660075	56	2	Tauschwohnung: Lichtdurchflutete 2 Z.-Wohnung gegen min. 3-Z. in Düsseldorf	51	40474	\N	51.2738	6.74219	\N
33660112	https://www.wohnungsboerse.net/immodetail/33660112	30	2	Tauschwohnung: Suche Münster, biete Düsseldorf DG mit EBK	37	40227	\N	51.2154	6.79757	\N
33660141	https://www.wohnungsboerse.net/immodetail/33660141	101.68	4	Geschmackvolle Wohnung mit vier Zimmern in Düsseldorf	22	40235	Hohenzollernallee	51.2339	6.82532	\N
33660156	https://www.wohnungsboerse.net/immodetail/33660156	50	2	Tauschwohnung:  Düsseldorf Altbau gegen Köln	36	40223	\N	51.1998	6.77225	\N
33660191	https://www.wohnungsboerse.net/immodetail/33660191	35	1	Tauschwohnung: Schöne 1 Zimmerwohnung mit Dachterrasse	13	40210	\N	51.2225	6.78772	\N
33660225	https://www.wohnungsboerse.net/immodetail/33660225	39	1	EXKLUSIVES ERDGESCHOSS KOMFORT APPARTMENT MIT SCHLAFNISCHE BALKON TIEFGARAGE KÜCHENÜBERNAHME MÖGLICH	95	40597	Benrather	51.1626	6.85614	1996
33661180	https://www.wohnungsboerse.net/immodetail/33661180	39.5	2	Gemütliche Wohnung mit 2 Zimmern & großem Balkon sowie Einbauküche in Flingern Nord	22	40235	\N	51.2294	6.82752	\N
33661206	https://www.wohnungsboerse.net/immodetail/33661206	75	2	Stilvolle, geräumige Wohnung mit großzügigem Balkon	22	40235	\N	51.2294	6.82752	\N
33661332	https://www.wohnungsboerse.net/immodetail/33661332	93	4	Großzügige 4- Zimmer wohnung in Düsseldorf-Flingern	22	40233	\N	51.2198	6.8119	\N
33661396	https://www.wohnungsboerse.net/immodetail/33661396	53	2	Tauschwohnung: Ich tausche schöne 2 Zimmerwohnung gegen 3 Zimmer	36	40225	\N	51.1974	6.78988	\N
33662142	https://www.wohnungsboerse.net/immodetail/33662142	80	4	4 Zimmer-WHG, provisionsfrei, viel Verstauraum, optimale Lage, nah am HBF, beste Anbindung	37	40227	\N	51.2154	6.79757	\N
33662230	https://www.wohnungsboerse.net/immodetail/33662230	67	2	Sanierte 2-Zimmer-Wohnung mit Balkon	13	40210	Bismarckstraße	51.2219	6.78625	1958
33662797	https://www.wohnungsboerse.net/immodetail/33662797	33	1	Oberbilker Allee 265, 40227 Düsseldorf	37	40227	Oberbilker	51.2094	6.80455	\N
33662825	https://www.wohnungsboerse.net/immodetail/33662825	108	3	Stilvolle 3-Zimmer-Wohnung mit Balkon in Rheinnähe in Düsseldorf	16	40474	\N	51.2738	6.74219	\N
33662860	https://www.wohnungsboerse.net/immodetail/33662860	58	2	Ansprechende 2-Raum-Wohnung in Düsseldorf	15	40476	Frankenstraße	51.25	6.7806	\N
33662864	https://www.wohnungsboerse.net/immodetail/33662864	50	1	Stilvoller Altbau, geräumige 1-Zimmer-Wohnung mit Balkon und separater Küche Düsseldorf	71	40625	Hardenbergstr.	51.2266	6.86399	1907
33662910	https://www.wohnungsboerse.net/immodetail/33662910	30	1	Wohnungstausch Düsseldorf gegen  München einer vollständig renovierten 1-Zimmer-Wohnung	21	40233	Albertstraße	51.2252	6.80924	\N
33662933	https://www.wohnungsboerse.net/immodetail/33662933	52	2	Gut gelegene 2-Zimmer-Wohnung mit Balkon und EBK in Bilk	36	40223	\N	51.1998	6.77225	\N
33662945	https://www.wohnungsboerse.net/immodetail/33662945	85	3.5	Gemütliche 3-Zimmerwohnung in zentraler Lage von Düsseldorf – Ihr neues Zuhause erwartet Sie	36	40223	\N	51.1998	6.77225	1950
33662965	https://www.wohnungsboerse.net/immodetail/33662965	90	2	Schöne Maisonette Whg. mit Balkon in Toplage Grafenbergs	72	40235	Vautierstr.	51.2421	6.82543	1914
33662996	https://www.wohnungsboerse.net/immodetail/33662996	65	2.5	Lichtdurchflutet: Dachgeschoss-Loft in Jugendstil-Altbau in angesagter Lage	41	40547	Niederkasseler	51.2367	6.73926	1997
33663007	https://www.wohnungsboerse.net/immodetail/33663007	57	2	Tauschwohnung: 2-Zimmer Altbauwohnung in Flingern	22	40235	\N	51.2294	6.82752	\N
33663482	https://www.wohnungsboerse.net/immodetail/33663482	84.4	4	Wohnung von Privat zu vermieten	41	40545	Oberkassler-Str.	51.2284	6.75437	1988
33663485	https://www.wohnungsboerse.net/immodetail/33663485	77	3	Exklusive 3-Zimmer-DG-Wohnung mit gehobener Innenausstattung in Düsseldorf	81	40231	\N	51.2135	6.83024	1972
33663487	https://www.wohnungsboerse.net/immodetail/33663487	61.85	3	Exklusive, sanierte 3-Zimmer-Dachgeschosswohnung mit Balkon in Düsseldorf	101	40595	\N	51.1408	6.90507	1965
33663508	https://www.wohnungsboerse.net/immodetail/33663508	87	3	Großzügige und helle 3-Zimmerwohnung mit TG Stellplatz in gefragter Lage Unterbach	84	40627	\N	51.2024	6.88388	\N
33663608	https://www.wohnungsboerse.net/immodetail/33663608	165	5	Großzügige Wohnung mit Maisonetteeinheit, ideal für Homeoffice	23	40237	\N	51.2357	6.80917	\N
33663617	https://www.wohnungsboerse.net/immodetail/33663617	72.36	3	3-Zimmer Wohnung zur Untermiete bis Juni 2024  (1700€ Warm)	36	40223	Suitbertusstraße	51.2044	6.77268	\N
33663621	https://www.wohnungsboerse.net/immodetail/33663621	78	3	Geschmackvolle Wohnung mit drei Zimmern in Düsseldorf	15	40468	An	51.2628	6.77656	1930
33663806	https://www.wohnungsboerse.net/immodetail/33663806	83	3.5	Schöne Wohnung mit 3,5 Zimmern in Düsseldorf	14	40477	Jordanstraße	51.2416	6.79126	1955
33663829	https://www.wohnungsboerse.net/immodetail/33663829	100	5	Stilvolle 5-Zimmer-Wohnung Altbauwohnung im Herzen der Stadt	31	40215	Hüttenstraße	51.216	6.78513	1905
33663876	https://www.wohnungsboerse.net/immodetail/33663876	120	3	WOHNKÜCHE ; HOHE DECKEN; PARKETT; OFFENE EINBAUKÜCHE; EINBAUSCHRÄNKE; HELLE MODERNE WOHNUNG	14	40477	\N	51.2385	6.78498	\N
33664503	https://www.wohnungsboerse.net/immodetail/33664503	43	1.5	Komfortappartment, ruhig, Grünlage, chices weißes Bad, Garageneinstellplatz für Single	64	40470	Marie-Juchacz-Str.	51.2472	6.80939	1983
33664586	https://www.wohnungsboerse.net/immodetail/33664586	73	2.5	2,5-Zimmer-Wohnung mit zwei Balkonen, Seitenstraße in D-Flingern	22	40235	\N	51.2294	6.82752	1961
33664607	https://www.wohnungsboerse.net/immodetail/33664607	73	3	Top kernsanierte ruhige helle Wohnung mit hochwertigem Balkon im Zooviertel	23	40237	Schillerstr	51.2337	6.79846	1954
33664691	https://www.wohnungsboerse.net/immodetail/33664691	53	2	Stilvolle 2-Zimmer-Wohnung mit Balkon in Düsseldorf	37	40237	Velberter	51.2181	6.80052	1984
33664741	https://www.wohnungsboerse.net/immodetail/33664741	70	3	Exklusive, vollständig renovierte 3-Zimmer-Wohnung mit Balkon in Düsseldorf	64	40470	Heideweg	51.2533	6.80818	1970
33664805	https://www.wohnungsboerse.net/immodetail/33664805	64	2	Suitbertusstraße 166, 40223 Düsseldorf	36	40223	\N	51.1998	6.77225	2020
33664869	https://www.wohnungsboerse.net/immodetail/33664869	24	1	Zentrale Wohnlage in Oberbilk	37	40227	Siemenstr.	51.2141	6.79493	1970
33664893	https://www.wohnungsboerse.net/immodetail/33664893	50.5	2	Objekt nicht gefunden	63	40472	\N	51.2685	6.83379	1956
33667387	https://www.wohnungsboerse.net/immodetail/33667387	108	3	Wunderschöne Altbauwohnung in Düsseldorf, Oberkassel	41	40545	Joachimstraße	51.2317	6.7573	1924
33667466	https://www.wohnungsboerse.net/immodetail/33667466	99	4	NEUBAU 4-Zimmer-Wohnung mit 2 Balkonen, Erstbezug, Mietpreisgedämpft	63	40472	Westfalenstraße	51.2631	6.81503	2023
33667467	https://www.wohnungsboerse.net/immodetail/33667467	48	1.5	Hausteil mit grosser Terrasse in bevorzugter Lage	91	40591	\N	51.188	6.81736	\N
33667495	https://www.wohnungsboerse.net/immodetail/33667495	46	2	Tauschwohnung: TAUSCHWOHNUNG, Derendorf	15	40476	\N	51.248	6.77902	\N
33667601	https://www.wohnungsboerse.net/immodetail/33667601	42	1	Helle schöne exclusive 1 Zi-Wohnung, KDB m. Balkon für berufstätige Mieter*in	91	40589	Bahlenstraße	51.1832	6.82164	1986
33667610	https://www.wohnungsboerse.net/immodetail/33667610	29	1	Tauschwohnung: Schönes Apartment mit Balkon	71	40625	\N	51.2358	6.85232	\N
33667644	https://www.wohnungsboerse.net/immodetail/33667644	63	3	3 Zimmer Wohnung Stadtmitte Düsseldorf	13	40211	Kölner	51.2278	6.79204	1959
33667671	https://www.wohnungsboerse.net/immodetail/33667671	64.49	2	Saniertes Objekt - Wohnung mit gehobener Ausstattung und Dachterrasse	31	40215	Antoniusstraße	51.2129	6.7876	2023
33667672	https://www.wohnungsboerse.net/immodetail/33667672	76.17	3	Saniertes Objekt in zentraler und dennoch ruhiger Lage! Wohnung mit gehobener Ausstattung und Balkon	31	40215	Antoniusstraße	51.2129	6.7876	2023
33667732	https://www.wohnungsboerse.net/immodetail/33667732	51.92	2	2-Zimmer-Wohnung in Düsseldorf-Heerdt, direkt vom Eigentümer, provisionsfrei	42	40549	Benediktusstraße	51.2346	6.71604	1903
33667751	https://www.wohnungsboerse.net/immodetail/33667751	65	2	2 Zimmer-Dachgeschosswohnung in Düsseldorf-Angermund	55	40489	An	51.3256	6.78071	1971
33667784	https://www.wohnungsboerse.net/immodetail/33667784	42	1.5	Tauschwohnung: gemütliche Wohnung nähe Hbf gegen Kölner Wohnung	37	40227	\N	51.2154	6.79757	\N
33667881	https://www.wohnungsboerse.net/immodetail/33667881	72.27	2	Hell und freundlich.	16	40474	Uerdinger	51.2528	6.76996	1937
33667933	https://www.wohnungsboerse.net/immodetail/33667933	38.74	1	Düsseldorf-Unterbilk! Apartment! Ruhig mit Balkon und Lift und Einbauküche!	97	40217	\N	51.2127	6.7754	1974
33667964	https://www.wohnungsboerse.net/immodetail/33667964	108	3.5	Idyllische 3,5-Zimmer-Erdgeschosswohnung im Herzen Rösraths	97	51503	Adolph-Kolping-Straße	50.9041	7.18199	\N
33667965	https://www.wohnungsboerse.net/immodetail/33667965	107	3.5	Idyllische 3,5-Zimmer-Neubauwohnung im Herzen Rösraths	97	51503	Adolph-Kolping-Straße	50.9041	7.18199	\N
33667986	https://www.wohnungsboerse.net/immodetail/33667986	80	3	Wunderschöne helle 3 Zi-Whg. mit großer Küche in familienfreundlicher Lage	97	40627	Sandträgerweg	51.2139	6.8536	1992
33667990	https://www.wohnungsboerse.net/immodetail/33667990	55	2.5	Ruhige 2,5 Zimmerwohnung in Meiderich mit Balkon	97	47137	Bergstraße	51.4662	6.75776	1956
33667995	https://www.wohnungsboerse.net/immodetail/33667995	69.19	3	Erschwingliche 3-Raum-Wohnung zur Miete in Duisburg	97	47169	Dahlstraße	51.5065	6.74855	1962
33668007	https://www.wohnungsboerse.net/immodetail/33668007	50	2	SERM: Moderne & gepflegte 2 Zimmer DG-Wohnung	97	47259	Dorfstraße	51.3498	6.71515	1976
33668010	https://www.wohnungsboerse.net/immodetail/33668010	162	4	Penthouse mit Südterrasse	97	40470	Mörsenbroicher	51.2507	6.81249	1969
33668017	https://www.wohnungsboerse.net/immodetail/33668017	110	4	Helle und neuwertige 4 Zimmer Etagenwohnung in Korschenbroich-Herrenshoff mit Einzelgarage	97	41352	An	51.2058	6.50069	2000
33668022	https://www.wohnungsboerse.net/immodetail/33668022	31	1.5	SCHÖNES KLEINES APPARTEMENT MIT SÜDBALKON IN GUTER LAGE IN BÜTTGEN	97	41564	Randerathweg	51.1949	6.59591	1985
33669962	https://www.wohnungsboerse.net/immodetail/33669962	52.1	2	Erstbezug nach Sanierung mit Balkon: stilvolle 2-Zimmer-Wohnung in Düsseldorf	71	40625	Regenbergastr.	51.237	6.85676	\N
33670032	https://www.wohnungsboerse.net/immodetail/33670032	79.56	3	Ideale 79m²-Wohnung mit EBK und zwei Außenbereichen	14	40477	Marc-Chagall-Straße	51.2424	6.79437	2017
33670053	https://www.wohnungsboerse.net/immodetail/33670053	40	2	Tauschwohnung: Biete Unterbilk, suche Düsseltal, 2 Zimmer	32	40217	\N	51.2127	6.7754	\N
33670075	https://www.wohnungsboerse.net/immodetail/33670075	93.3	3	Helle 3 Zimmer Wohnung in Benrath	95	40597	Börchemstr.	51.1654	6.87388	1991
33670119	https://www.wohnungsboerse.net/immodetail/33670119	46.24	2	2-Zimmer-Wohnung mit Balkon und Aufzug Nähe Hofgarten !	14	40479	\N	51.2333	6.78371	1956
33670203	https://www.wohnungsboerse.net/immodetail/33670203	181	4	Haus-Alternative ! ca. 180 QM auf einer Ebene! Edle Whng für gehobene Ansprüche !	41	40547	\N	51.2419	6.74772	1963
33670213	https://www.wohnungsboerse.net/immodetail/33670213	90	3	*****Traumhaft sanierte 3 Zimmer Wohnung mit Balkon und 240 qm großem Garten in ruhiger Lage!*****	96	40593	Arnold-Schönberg-Str.	51.1527	6.88026	1970
33670261	https://www.wohnungsboerse.net/immodetail/33670261	63.75	2	Grün und ruhig gelegen - 2 Zimmer-Wohnung mit Loggia in Rath!	63	40472	Lünener	51.2645	6.79959	1999
33670303	https://www.wohnungsboerse.net/immodetail/33670303	74	2	Rheinnähe	34	40221	Fährstraße	51.2042	6.73468	1990
33670453	https://www.wohnungsboerse.net/immodetail/33670453	47	1	Helle 1-Zimmer Wohnung mit Balkon in zentraler Lage	13	40211	\N	51.2301	6.79288	1953
33670520	https://www.wohnungsboerse.net/immodetail/33670520	90	3	3-Zimmer-Dachgeschoss-Wohnung in Oberbilk zu vermieten!	37	40227	\N	51.2154	6.79757	\N
33671598	https://www.wohnungsboerse.net/immodetail/33671598	80	2.5	Gartentraum: Sanierte 2,5-Zi.-Whg. mit Garten, Parkett und Ankleide im Altbau in Bilk	36	40225	Witzelstraße	51.202	6.78584	1900
33671724	https://www.wohnungsboerse.net/immodetail/33671724	43	2	Tauschwohnung: Gemütliche helle 2-Zimmer Wohnung in Unterbilk	32	40217	\N	51.2127	6.7754	\N
33671854	https://www.wohnungsboerse.net/immodetail/33671854	56.61	2	Einziehen und Wohlfühlen!	82	40229	Von-Krüger-Straße	51.1987	6.84947	1960
33671931	https://www.wohnungsboerse.net/immodetail/33671931	70	4	Tauschwohnung: Große Wohnung	83	40627	\N	51.2024	6.88388	\N
33672027	https://www.wohnungsboerse.net/immodetail/33672027	52.8	2.5	2 Balkone | 2,5 Zimmer | Wohnküche | WG geeignet	31	40215	Mintropstraße	51.2186	6.7889	1956
33672080	https://www.wohnungsboerse.net/immodetail/33672080	150	3	Tauschwohnung: Wunderschöne Gartenwohnung mit Holzofen	62	40468	\N	51.2612	6.7789	\N
33672119	https://www.wohnungsboerse.net/immodetail/33672119	55.28	2	Sehr schöne Wohnung am Ardennenpark	42	40549	Ardennenstraße	51.226	6.69719	1997
33672217	https://www.wohnungsboerse.net/immodetail/33672217	50	2	Tauschwohnung: perfekt aufgeteilte 2-Zimmer Wohnung mit Balkon	15	40476	\N	51.248	6.77902	\N
33672236	https://www.wohnungsboerse.net/immodetail/33672236	40.35	2	**sanierte 2 - Zimmer - Wohnung in Unterbilk**	32	40217	Bachstr.	51.2098	6.77754	1955
33672283	https://www.wohnungsboerse.net/immodetail/33672283	72.53	2	Traumwohnung mit Weitblick - schöne Pärchenwohnung mit Loggia!	93	40589	Kölner	51.1763	6.83132	1989
33672291	https://www.wohnungsboerse.net/immodetail/33672291	77	2	Helle, moderne 2-Zimmerwohnung in ruhiger Wohnlage	37	40227	Landauer	51.2055	6.81588	1980
33672454	https://www.wohnungsboerse.net/immodetail/33672454	65	2	Moderne 2-Zimmer Wohnung im schönen Pempelfort	14	40477	Schloßstraße	51.2411	6.7903	2021
33673966	https://www.wohnungsboerse.net/immodetail/33673966	56	2	Schöne Altbau 2-Zimmer-Wohnung mit Einbauküche	37	40227	\N	51.2154	6.79757	\N
33673981	https://www.wohnungsboerse.net/immodetail/33673981	56	3	Helle exklusive teilmöblierte Traumwohnung in Nähe Lorettostraße	32	40219	Benzenbergstraße	51.2106	6.76483	1953
33674043	https://www.wohnungsboerse.net/immodetail/33674043	41	1	Geräumige 1-Zimmer-Wohnung mit Balkon in Düsseldorf	36	40223	\N	51.1998	6.77225	\N
33674109	https://www.wohnungsboerse.net/immodetail/33674109	15	1	Exklusive 1-Zimmer-Wohnung mit Einbauküche in Düsseldorf	23	40239	Grunerstraße	51.2449	6.80942	\N
33674129	https://www.wohnungsboerse.net/immodetail/33674129	65	2	Lohausen ein Stadtteil in Düsseldorf wie kein anderer!	52	40474	\N	51.2738	6.74219	\N
33674160	https://www.wohnungsboerse.net/immodetail/33674160	50	2	Gustav-Poensgen-Straße 53, 40215 Düsseldorf	31	40215	Gustav-Poensgen-Straße	51.2128	6.78898	\N
33674174	https://www.wohnungsboerse.net/immodetail/33674174	62	1	Neckarstraße 25, 40219 Düsseldorf	32	40219	Neckarstraße	51.2126	6.75652	\N
33674189	https://www.wohnungsboerse.net/immodetail/33674189	64	2	Stillvolle möblierte 2-Zimmer Wohnung in D-Derendorf	15	40468	Ulmenstraße	51.2558	6.77969	1920
33674195	https://www.wohnungsboerse.net/immodetail/33674195	60	2	Traumwohnung in Flingern-Nord	22	40235	Dorotheenstrasse	51.2299	6.80962	\N
33674214	https://www.wohnungsboerse.net/immodetail/33674214	53	2	Tauschwohnung: Tausche 2 Zimmerwohnung Düsseldorf gegen Köln	21	40233	\N	51.2198	6.8119	\N
33674233	https://www.wohnungsboerse.net/immodetail/33674233	50.5	2	2-Zimmer + Wohnküche, Übernahme EBK möglich	94	40599	Briedestr.	51.1737	6.85635	1930
33674263	https://www.wohnungsboerse.net/immodetail/33674263	48.99	2	2 Zimmer plus Wohnküche - zum selber renovieren ab 15.01	94	40599	Eichelstr.	51.1743	6.85478	1930
33674298	https://www.wohnungsboerse.net/immodetail/33674298	94	3	Tauschwohnung: Tausche Düsseldorf gegen Köln	71	40625	\N	51.2358	6.85232	\N
33674308	https://www.wohnungsboerse.net/immodetail/33674308	47	2	Jetzt aufgepasst. Schöne 2-Zimmer-Wohnung mit modernem Bad in Flingern.	22	40235	Dorotheenstraße	51.2305	6.80985	1907
33674341	https://www.wohnungsboerse.net/immodetail/33674341	45	2	Tolle 2-Zimmer-Wohnung in Flingern	22	40235	Dorotheenstraße	51.2305	6.80985	1907
33674342	https://www.wohnungsboerse.net/immodetail/33674342	37.41	1.5	Schicke Single-Wohnung sucht neuen Mieter, moderne Ausstattung	98	40599	Zoppoter	51.1722	6.87206	1953
33674429	https://www.wohnungsboerse.net/immodetail/33674429	101	4	Wunderschöne 4 Zimmer Wohnung - Luxus saniert - ruhig & familienfreundlich	96	40593	Corellistr.	51.1536	6.88148	1972
33674436	https://www.wohnungsboerse.net/immodetail/33674436	54	2	Tauschwohnung: Zwei Zimmerwohnung mit Blick ins Grüne	31	40215	\N	51.2149	6.78256	\N
33674546	https://www.wohnungsboerse.net/immodetail/33674546	25	1	*City Apartment* All Inclusive	31	40215	\N	51.2149	6.78256	1954
33674547	https://www.wohnungsboerse.net/immodetail/33674547	26	1	*City Apartment* 1 Zimmer-Apartment Möbliert inkl. W-Lan & TV	31	40215	Mintropstr.	51.2179	6.78965	1954
33674551	https://www.wohnungsboerse.net/immodetail/33674551	44	1	großz. 1,5 Zimmer-Wohnung mit kleiner Wohnküche in Düsseldorf-Eller	82	40229	Peter	51.1928	6.86136	1974
33674718	https://www.wohnungsboerse.net/immodetail/33674718	90	2	RHEINBLICK PUR im HAFEN - PORTOBELLO-HAUS - OFFENE EINBAUKÜCHE; PARKETT	32	40217	\N	51.2127	6.7754	2009
33675310	https://www.wohnungsboerse.net/immodetail/33675310	56	2	Wunderschöne moderne 2-Zimmerwohnung im Düsseldorfer Norden sehr, nah zum Rhein gelegen	51	40474	Hülsestrasse	51.2672	6.75025	2001
33675316	https://www.wohnungsboerse.net/immodetail/33675316	89	3	Modernisierte 3-Zimmer-Wohnung mit Balkon in Düsseldorf	44	40547	\N	51.2419	6.74772	\N
33675535	https://www.wohnungsboerse.net/immodetail/33675535	118	3	Diese Lage ist wirklich traumhaft! 3-Zimmer-Komfortwohnung in Stadtvillen-Ensemble nahe des Rheins	15	40476	\N	51.248	6.77902	2003
33675573	https://www.wohnungsboerse.net/immodetail/33675573	63	2	Exklusive Neubauwohnung mit 2 Zimmern, Einbauküche und Balkon	36	40223	\N	51.1998	6.77225	2023
33675587	https://www.wohnungsboerse.net/immodetail/33675587	79.13	3	ACHTUNG - Einkommensgrenzen beachten, Nettoeinkommen angeben, da mietpreisgedämpfte 3,0-Zimmer-Wohnu	42	40549	Hildegard-Knef-Straße	51.243	6.71649	2020
33675591	https://www.wohnungsboerse.net/immodetail/33675591	66	2	D-Bilk/Flehe: Uninähe! gemütliche 2 Zi. DG Wohnung mit Blick ins Grüne	36	40223	Stoffeler	51.1949	6.77905	1965
33675627	https://www.wohnungsboerse.net/immodetail/33675627	70	3	*Top geschnittene 3-Raum-Balkon-Wohnung*sucht Liebhaber! Itterstraße*	93	40589	Itterstraße	51.174	6.82997	1969
33675677	https://www.wohnungsboerse.net/immodetail/33675677	54.52	2	- perfekt für uns zwei - großzügig geschnitten -	82	40229	Von-Krüger-Straße	51.1987	6.84947	1960
33675809	https://www.wohnungsboerse.net/immodetail/33675809	50	2	Teilmöblierte 2-Zimmer-Wohnung mit EBK und Balkon in Düsseldorf	81	40231	\N	51.2135	6.83024	\N
33675890	https://www.wohnungsboerse.net/immodetail/33675890	94	4	Traumhafte 4-Zimmer-Wohnung im Hustadtring 31	97	44801	Hustadtring	51.4588	7.27345	1968
33675891	https://www.wohnungsboerse.net/immodetail/33675891	98	1	Große 4 Zimmer Wohnung mit Balkon nahe dem Zentrum von RS-Lütttringhausen	92	42899	\N	51.2129	7.2326	1972
33675892	https://www.wohnungsboerse.net/immodetail/33675892	40	2	2-Zimmer Wohnung in Carlstadt zu vermieten	12	40213	Benrather	51.2229	6.77237	\N
33675927	https://www.wohnungsboerse.net/immodetail/33675927	56	2	Moderne 2-Zimmer-Wohnung mit Balkon in Düsseldorf	82	40229	Ellerkirchstraße	51.2024	6.84555	\N
33675928	https://www.wohnungsboerse.net/immodetail/33675928	70	2	Wunderschöne 2 Zimmer Wohnung mit Balkon, Wannenbad, Aufzug und  TG-Platz in Ddrf Grafenberg	72	40629	Hardtstraße	51.2409	6.82947	\N
33675939	https://www.wohnungsboerse.net/immodetail/33675939	48	2	Oberkassel, sehr schöne Wohnung im Altbau mit Garten	41	40545	\N	51.2284	6.75437	1908
33677263	https://www.wohnungsboerse.net/immodetail/33677263	67	2	In Düsseldorf: Gepflegte Wohnung mit zwei Zimmern und Balkon	96	40593	\N	51.1403	6.86854	\N
33677282	https://www.wohnungsboerse.net/immodetail/33677282	55	2	Schöne 2-Zimmer-Wohnung mit EBK in Düsseldorf	42	40549	\N	51.2331	6.71909	\N
33677388	https://www.wohnungsboerse.net/immodetail/33677388	55	1	Großzügige 1-Zimmer-Dachgeschosswohnung im schönen Oberkassel	41	40545	\N	51.2284	6.75437	1960
33677495	https://www.wohnungsboerse.net/immodetail/33677495	58	2	Exklusive 2-Zimmer-Wohnung mit Balkon	72	40629	Neuburgstraße	51.2372	6.83727	1983
33677673	https://www.wohnungsboerse.net/immodetail/33677673	99	4	Dachgeschoss Maisonettewohnung mit Dachterrasse in Südlage	84	40627	Vennstr.	51.2021	6.88893	2016
33677783	https://www.wohnungsboerse.net/immodetail/33677783	107	4	Moderner 4-Zimmer-Bungalow ruhig/zentral Düsseldorf Wersten	91	40591	Kampstraße	51.1911	6.8182	2016
33677865	https://www.wohnungsboerse.net/immodetail/33677865	95	3.5	Anfragestop!!! - Helle 3,5 Raum Dachgeschoßwohnung mit Balkon in Ruhrnähe	92	45279	Briefzeile	51.4419	7.09035	1907
33677866	https://www.wohnungsboerse.net/immodetail/33677866	61	2	2-Zimmer-Wohnung mit separater Küche und Balkon	82	40229	Weinheimer	51.2034	6.8327	\N
33678984	https://www.wohnungsboerse.net/immodetail/33678984	120	4	Ruhige Erdgeschosswohnung in Troisdorf	97	53840	\N	50.8191	7.15745	1959
33679034	https://www.wohnungsboerse.net/immodetail/33679034	50	2	Ruhige 2-Zimmer Wohnung, Balkon, provisionsfrei	93	40589	Nosthoffenstr.	51.1795	6.8315	1969
33679123	https://www.wohnungsboerse.net/immodetail/33679123	263	6	Hochwertig sanierte Art Déco Wohnung in bevorzugter Wohnlage von Düsseldorf - Golzheim	16	40474	\N	51.2738	6.74219	1927
33679174	https://www.wohnungsboerse.net/immodetail/33679174	44.55	1	47125/13 Geräumige 1-Zimmer-Wohnung im Neubau in Düsseldorf-Rath/preisgedämpfter Wohnraum	63	40472	Am	51.2658	6.81718	2023
33679187	https://www.wohnungsboerse.net/immodetail/33679187	60	1	Ruhige 1 Zimmerwohnung in Düsseldorf-Stadtmitte nur wenige Schritte bis zur Königsallee.	13	40210	\N	51.2225	6.78772	1965
33679391	https://www.wohnungsboerse.net/immodetail/33679391	102	2.5	Lichtdurchflutete Altbau Maisonette-Wohnung / Loft-Wohnung / Lorettoviertel	32	40219	\N	51.2135	6.76234	1911
33679455	https://www.wohnungsboerse.net/immodetail/33679455	84	3	WOHLFÜHL-WOHNUNG FÜR KLEINE FAMILIE IN BESTER LAGE VON OBERKASSEL! BALKON!	41	40545	Belsenstraße	51.2304	6.74616	1949
33679465	https://www.wohnungsboerse.net/immodetail/33679465	57	2	***NETTE MIETER GESUCHT-TOLLE 2 ZIMMER ALTBAUWOHNUNG MIT EINBAUKÜCHE***	31	40215	Corneliusstr.	51.2145	6.78308	1951
33679545	https://www.wohnungsboerse.net/immodetail/33679545	88.6	2	Sonniges Penthouse in schöner Parkanlage unweit vom Rhein	41	40549	Greifweg	51.2345	6.73694	2015
33679734	https://www.wohnungsboerse.net/immodetail/33679734	73	3.5	Dachgeschosswohnung mit Südloggia in D-Angermund	55	40489	\N	51.3305	6.76259	\N
33679748	https://www.wohnungsboerse.net/immodetail/33679748	41	2	Topsanierte charmante Altbauwohnung	21	40233	Ruhrtalstr.	51.2206	6.81073	1900
33681288	https://www.wohnungsboerse.net/immodetail/33681288	59	2	Geschmackvolle Wohnung mit zwei Zimmern sowie Balkon und Einbauküche in Düsseldorf	23	40211	Toulouser	51.2325	6.79572	\N
33681303	https://www.wohnungsboerse.net/immodetail/33681303	75	2.5	Schöne möblierte 2,5-Raum-Wohnung in Köln-50858,	97	50858	\N	50.921	6.85414	1970
33681307	https://www.wohnungsboerse.net/immodetail/33681307	70	2	Möblierte Wohnung mit Balkon in Düsseldorf-Zoo (Zwischenmiete bis zu 3 Monate)	23	40239	Grunerstraße	51.2439	6.79972	\N
33681343	https://www.wohnungsboerse.net/immodetail/33681343	50	2	Gemütliche 2-Zimmer-Wohnung in sonniger Lage mit zwei Räumen und EBK in Düsseldorf	37	40227	Sonnenstraße	51.2127	6.79633	\N
33681355	https://www.wohnungsboerse.net/immodetail/33681355	45	2	Schöne Single-Wohnung im Trendviertel Flingern Nord	22	40233	Birkenstraße	51.2269	6.8031	\N
33681362	https://www.wohnungsboerse.net/immodetail/33681362	53	2	636 € - 53 m² - 2.0 Zi.	98	40599	\N	51.1825	6.8657	\N
33681363	https://www.wohnungsboerse.net/immodetail/33681363	53	2	Attraktive 2-Zimmer-Wohnung in 40599, Düsseldorf	98	40599	\N	51.1825	6.8657	\N
33681462	https://www.wohnungsboerse.net/immodetail/33681462	58	2	Stilvolle und helle 2-Zimmer-Wohnung mit Küche in Düsseldorf	31	40215	\N	51.2149	6.78256	1978
33681509	https://www.wohnungsboerse.net/immodetail/33681509	43	1	Tauschwohnung: 1 Zimmer Wohnung mit Balkon gegen 2 Zimmer-Wohnung	14	40477	\N	51.2385	6.78498	\N
33681549	https://www.wohnungsboerse.net/immodetail/33681549	35	1	Ab 01.04 - sanierte EG-Single-Wohnung in Bilk, plus Lagerhalle/Garage auf Wunsch	36	40221	Volmerswerther	51.209	6.76166	1968
33681580	https://www.wohnungsboerse.net/immodetail/33681580	60.43	3	Schicke 3-Zimmer-Wohnung ab sofort verfügbar	95	40597	Am	51.167	6.88262	1962
33681584	https://www.wohnungsboerse.net/immodetail/33681584	73	2.5	Tauschwohnung: 2,5-Zimmer Wohnung in Pempelfort	14	40477	\N	51.2385	6.78498	\N
33681638	https://www.wohnungsboerse.net/immodetail/33681638	32	1	Schicke kernsanierte Wohnung in Unterbilk	36	40223	Martinstraße	51.2092	6.76305	1974
33681682	https://www.wohnungsboerse.net/immodetail/33681682	71	3	Moderne 3-Zimmer-Wohnung mit EBK und zwei Balkonen	101	40595	Wilhelm-Kreis-Str.	51.1453	6.89297	1964
33681721	https://www.wohnungsboerse.net/immodetail/33681721	29.79	1	1-Zimmer-Wohnung mit Balkon in Düsseltal	23	40237	Schillerstraße	51.2339	6.79981	1956
33681987	https://www.wohnungsboerse.net/immodetail/33681987	76.19	3	Tolle 3-Zi Wohnung im Grünen, sehr ruhige Lage, EBK,Loggia,TG-Stellpl Düsseldorf-Ludenberg	73	40629	\N	51.255	6.88361	\N
33682555	https://www.wohnungsboerse.net/immodetail/33682555	60	2	Schöne 2-Zimmer Wohnung - uninah und zentral	91	40591	Am	51.1905	6.81354	1998
33682700	https://www.wohnungsboerse.net/immodetail/33682700	64	2	möblierte 2 Zimmerwohnung mit Balkon im Zooviertel zu vermieten.	23	40237	\N	51.2357	6.80917	\N
33682751	https://www.wohnungsboerse.net/immodetail/33682751	37.37	1	Exklusives 1 Zimmer-Appartement, teilmöbliert mit EBK	13	40211	Börnestr.	51.2275	6.79167	\N
33682756	https://www.wohnungsboerse.net/immodetail/33682756	63.25	2	Exquisite 2-Zimmer Mietwohnung im Le Flair	14	40477	\N	51.2385	6.78498	2010
33682811	https://www.wohnungsboerse.net/immodetail/33682811	85	3	Tauschwohnung: Tausche eine 3 Zimmer Wohnung gegen eine 2 Zimmer Wohnung	13	40212	\N	51.2236	6.78053	\N
33682924	https://www.wohnungsboerse.net/immodetail/33682924	100	2	Tauschwohnung: Besondere, loftartige Maisonette-Wohnung in DUS gegen Köln	13	40210	\N	51.2225	6.78772	\N
33682947	https://www.wohnungsboerse.net/immodetail/33682947	44.5	1	1 Zimmerwohnung mit Einbauküche in Düsseldorf Pempelfort zu vermieten.	14	40211	\N	51.2301	6.79288	1954
33682967	https://www.wohnungsboerse.net/immodetail/33682967	48.88	2	47110/101 Renovierte 2-Zimmer-Wohnung in Mörsenbroich	64	40470	St-Franziskus-Straße	51.2551	6.80807	1953
33682976	https://www.wohnungsboerse.net/immodetail/33682976	65.56	3	Viel Platz für Neues: Gemütliche 3-Zimmer-Wohnung mit Balkon in Derendorf!	93	40589	Heinrichstraße	51.1705	6.83185	1958
33682992	https://www.wohnungsboerse.net/immodetail/33682992	70	3	Tauschwohnung: Tausche 70qm, 3Z+KDB, Altbau gg. kl. Wohnung Flingern-Nord	22	40235	\N	51.2294	6.82752	\N
33683007	https://www.wohnungsboerse.net/immodetail/33683007	66	2	Bilk: 2-Zimmer-Dachgeschosswohnung mit Sonnenbalkon	36	40223	Fleher	51.2013	6.76452	1999
33683184	https://www.wohnungsboerse.net/immodetail/33683184	118	3.5	IN DER CARLSTDT ZUHAUSE, DIE ALTSDADT NEBENAN, RHEINBLICK INCLISIVE	12	40213	Mannesmannufer	51.2221	6.76857	\N
33683200	https://www.wohnungsboerse.net/immodetail/33683200	65.4	2	Provisionsfrei! Helle, zentrale 2-Zi-Wohnung in Little Toyko	13	40210	Immermannstr.	51.2221	6.79051	1972
33684604	https://www.wohnungsboerse.net/immodetail/33684604	80	2	Kernsanierte 2-Zimmer-Maisonette-Wohnung mit Loftcharakter in zentraler Lage mit Terrasse	13	40210	\N	51.2225	6.78772	\N
33684622	https://www.wohnungsboerse.net/immodetail/33684622	38	1.5	Freundliche 1,5-Zimmer-Wohnung mit Balkon und EBK in Düsseldorf	36	40223	Germaniastraße	51.2074	6.76104	\N
33684668	https://www.wohnungsboerse.net/immodetail/33684668	32.61	1	Saniertes helles Appartement mit neuem Badezimmer im Herzen von Düsseldorf - perfekt für Studierende	14	40477	Nordstr.	51.2394	6.78041	1970
33684724	https://www.wohnungsboerse.net/immodetail/33684724	95	2.5	Tauschwohnung: große 2,5 Zimmer 95 qm/2 Wohnung, im Tausch gegen 60 qm/2	64	40470	\N	51.2569	6.80771	\N
33684864	https://www.wohnungsboerse.net/immodetail/33684864	47	1	Zooviertel, 1 Zimmer Luxusappartement mit hochwertiger Einbauküche	23	40237	Rethelstraße	51.2388	6.80176	\N
33684976	https://www.wohnungsboerse.net/immodetail/33684976	53.18	2	47101/73 Charmante 2-Zimmer-Wohnung mit Balkon in Düsseldorf- Reisholz	94	40599	Eichelstraße	51.1752	6.85837	1951
33685079	https://www.wohnungsboerse.net/immodetail/33685079	46	2	SANIERTE MÖBLIERTE WOHNUNG IN ZENTRALER LAGE	13	40211	\N	51.2301	6.79288	1955
33685085	https://www.wohnungsboerse.net/immodetail/33685085	56.16	2	Moderne 2-Zimmer Etagenwohnung in Düsseldorf - Derendorf	15	40468	Bueckstraße	51.2547	6.78502	1961
33685094	https://www.wohnungsboerse.net/immodetail/33685094	162	4	Zooviertel - Rarität: sehr helle und großzügige 4-Zimmer-Wohnung	23	40237	Graf-Recke-Str.	51.2402	6.80785	1961
33685125	https://www.wohnungsboerse.net/immodetail/33685125	90	3	Exklusive Duplex-Wohnung mit drei Zimmern	71	40625	\N	51.2358	6.85232	\N
33686096	https://www.wohnungsboerse.net/immodetail/33686096	78	2	Exklusive, geräumige 2-Zimmer-Wohnung in Düsseldorf	32	40217	\N	51.2127	6.7754	\N
33686105	https://www.wohnungsboerse.net/immodetail/33686105	60	2	Uhlandstraße 17, 40237 Düsseldorf	23	40237	Uhlandstraße	51.2322	6.80098	\N
33686129	https://www.wohnungsboerse.net/immodetail/33686129	110	5	Lichtdurchflutete 5-Zimmer-DG-Wohnung mit Süd-Balkon in Grafenberg	72	40235	\N	51.2294	6.82752	1976
33686150	https://www.wohnungsboerse.net/immodetail/33686150	57	2	Gepflegte 2-Zimmer-DG-Wohnung mit Balkon in Düsseldorf	98	40599	Tönisstraße	51.181	6.86753	1997
33686157	https://www.wohnungsboerse.net/immodetail/33686157	48	2	Stilvolle 2-Zimmer-Wohnung mit Altbaucharme in Düsseldorf	23	40237	\N	51.2357	6.80917	\N
33686270	https://www.wohnungsboerse.net/immodetail/33686270	109	3	Exklusive 3-Raumwohnung mit Einbauküche und 2 Terrassen in Düsseldorf	36	40225	Erna-Eckstein-Straße	51.2013	6.78413	2022
33686288	https://www.wohnungsboerse.net/immodetail/33686288	107	3	Gut geschnittene 3-Zimmer-Wohnung mit großem Sonnenbalkon	71	40625	\N	51.2358	6.85232	2015
33686311	https://www.wohnungsboerse.net/immodetail/33686311	89	2.5	Ruhige Dachterrassenwohnung mitten im Medienhafen	32	40219	Gilbachstrasse	51.2136	6.75505	1992
33686333	https://www.wohnungsboerse.net/immodetail/33686333	74	2	Tauschwohnung: 2Z Düsseldorf gegen 1-2Z in Köln.	81	40231	\N	51.2135	6.83024	\N
33686379	https://www.wohnungsboerse.net/immodetail/33686379	55	3	Verwirklichen Sie Ihren Wohntraum noch in 2023!	22	40233	\N	51.2198	6.8119	1949
33686399	https://www.wohnungsboerse.net/immodetail/33686399	94.22	3	Penthouse mit sensationeller Aussicht	64	40470	Lenaustraße	51.2478	6.82148	2018
33686403	https://www.wohnungsboerse.net/immodetail/33686403	51.85	2	Platz genug für Ihre Weihnachtsgeschenke!	22	40233	\N	51.2198	6.8119	1954
33686433	https://www.wohnungsboerse.net/immodetail/33686433	56	3	Gemütliche 3-Zimmer Wohnung in zentraler Lage	14	40479	\N	51.2333	6.78371	1952
33686441	https://www.wohnungsboerse.net/immodetail/33686441	86	2.5	Tauschwohnung: Helle offene DG Wohnung ohne Schrägen	93	40589	\N	51.1641	6.82144	\N
33686454	https://www.wohnungsboerse.net/immodetail/33686454	62	2	**STYLISCHE 2 ZIMMER ALTBAUWOHNUNG NÄHE FÜRSTENPLATZ**HOHE DECKEN, BALKON & PARKETTBODEN**	31	40215	Remscheider	51.2121	6.78672	1920
33686561	https://www.wohnungsboerse.net/immodetail/33686561	65.5	3	Schöner Wohnen!	82	40229	Von-Krüger-Straße	51.1987	6.85058	1960
33686572	https://www.wohnungsboerse.net/immodetail/33686572	67	4	Düsseldorf-Garath | Sanierte 4-Zimmer-Wohnung im 1. OG mit Balkon in guter Lage!	101	40595	\N	51.1408	6.90507	1969
33686597	https://www.wohnungsboerse.net/immodetail/33686597	83	3	Tauschwohnung: 3,5ZKDB Düsseldorf und Suche 2ZKDB in Düsseldorf oder Köln	62	40472	\N	51.2685	6.83379	\N
33686673	https://www.wohnungsboerse.net/immodetail/33686673	60	2	Bilk: Schöne, helle 2 Zimmerwohnung	36	40223	Suitbertusstraße	51.2065	6.76654	1964
33686889	https://www.wohnungsboerse.net/immodetail/33686889	32	1	Helles Appartement mit Sonnenbalkon im Zooviertel	23	40237	Lindemannstr.	51.2362	6.805	\N
33686910	https://www.wohnungsboerse.net/immodetail/33686910	58	2	Gut-geschnittene Zwei-Zimmer Wohnung mit Wohnküche	71	40625	Scheerenburgerstr.	51.224	6.86296	1938
33688451	https://www.wohnungsboerse.net/immodetail/33688451	40	1	Lichtstraße 1, 40235 Düsseldorf	22	40235	Lichtstraße	51.2333	6.81682	\N
33688470	https://www.wohnungsboerse.net/immodetail/33688470	96	3	Zwichen miete Oktober-April	31	40215	Hildebrandstr.	51.2107	6.78503	\N
33688507	https://www.wohnungsboerse.net/immodetail/33688507	45	1.5	Stilvolle 1,5-Zimmer-Wohnung mit Balkon und Einbauküche in Düsseldorf	21	40233	Erkrather	51.2209	6.80821	\N
33688511	https://www.wohnungsboerse.net/immodetail/33688511	63	2.5	Exklusive Möblierte 2,5-Zimmer-Wohnung mit EBK, Balkon und Smart-Home	15	40476	Geistenstraße	51.2472	6.78723	\N
33688516	https://www.wohnungsboerse.net/immodetail/33688516	67	4	!!Tauschwohnung!! Ansprechende 4-Zimmer-Dachgeschosswohnung mit EBK	15	40476	\N	51.248	6.77902	\N
33688535	https://www.wohnungsboerse.net/immodetail/33688535	90	3	3-Zimmer-Wohnung in Düsseldorf-Wersten grüne Siedlung	91	40591	\N	51.188	6.81736	1923
33688567	https://www.wohnungsboerse.net/immodetail/33688567	74	3	Erstbezug nach Renovierung - 3 Zimmer in Düsseldorf-Stadtmitte, zentral und doch ruhig	13	40210	\N	51.2225	6.78772	1960
33688577	https://www.wohnungsboerse.net/immodetail/33688577	78.5	3	Geschmackvolle Wohnung mit drei Zimmern sowie Balkon und EBK in Düsseldorf	82	40229	\N	51.1968	6.84602	1996
33688642	https://www.wohnungsboerse.net/immodetail/33688642	75	2	Tauschwohnung: Biete Düsseldorf, suche Berlin	14	40211	\N	51.2301	6.79288	\N
33688664	https://www.wohnungsboerse.net/immodetail/33688664	50	2.5	Tauschwohnung: Tausche kleinere gegen größere Altbauwohnung in Flingern	22	40233	\N	51.2198	6.8119	\N
33688724	https://www.wohnungsboerse.net/immodetail/33688724	85	3	Tauschwohnung: Tausche 3 Zimmer Traumwohnung gegen Haus	36	40225	\N	51.1974	6.78988	\N
33688749	https://www.wohnungsboerse.net/immodetail/33688749	68	3	***FEINE 3-ZI-WOHNUNG MIT BALKON IN EDLER STADTVILLA***	94	40599	Briedestr.	51.1739	6.85778	1920
33688762	https://www.wohnungsboerse.net/immodetail/33688762	50	1	Tauschwohnung: Wunderschöne Maisonette Wohnung	22	40235	\N	51.2294	6.82752	\N
33688801	https://www.wohnungsboerse.net/immodetail/33688801	98	3	***HELLE 3-ZI.-WOHNUNG AUF DER BEL-ETAGE IN D-OBERKASSEL***	41	40545	Bardelebenstraße	51.2333	6.75118	1957
33688817	https://www.wohnungsboerse.net/immodetail/33688817	65	2	Tauschwohnung: Schöne, helle 2 Zimmer Altbau Wohnung mit Sonnenbalkon	36	40223	\N	51.1998	6.77225	\N
33688877	https://www.wohnungsboerse.net/immodetail/33688877	211	4	Denkmalgeschütztes Stadtpalais mit großem Dachgarten	11	40213	Ritterstraße	51.2295	6.77243	1675
33688909	https://www.wohnungsboerse.net/immodetail/33688909	42	2	Bendemannstraße 9, 40210 Düsseldorf	13	40210	Bendemannstraße	51.2234	6.79232	1980
33689000	https://www.wohnungsboerse.net/immodetail/33689000	86	3	Frisch sanierte, gefragte 3-Zi.-Altbauwohnung in begehrter Lage von D-dorf Golzheim!	16	40476	\N	51.248	6.77902	1915
33689552	https://www.wohnungsboerse.net/immodetail/33689552	83	2	°°OBERKASSEL°° Hochwertige 2 Zimmer Wohnung mit Balkon und Aufzug im 4. OG zu vermieten°°	41	40545	Luegallee	51.2313	6.75122	1936
33689562	https://www.wohnungsboerse.net/immodetail/33689562	115	2	Schöne und hochwertige Dachgeschosswohnung mit zweieinhalb Zimmern sowie zwei Balkonen	92	50968	\N	50.9038	6.96823	2003
33689625	https://www.wohnungsboerse.net/immodetail/33689625	50	2	Tauschwohnung: 2 Zimmerwohnung am Hafen	32	40219	\N	51.2135	6.76234	\N
33689639	https://www.wohnungsboerse.net/immodetail/33689639	63	2	CHARMANTE STADTWOHNUNG SUCH NEUEN MIETER - EBK-BALKON UND AUFZUG!	31	40215	Bunsenstraße	51.2149	6.78792	\N
33689640	https://www.wohnungsboerse.net/immodetail/33689640	45	1.5	Immobilien-Richter: Möbliertes Apartment mit Gartenanteil in \nDüsseldorf-Gerresheim	71	40625	\N	51.2358	6.85232	\N
33689654	https://www.wohnungsboerse.net/immodetail/33689654	226	5	Über den Dächern von Düsseldorf! Top 5-Zi-DG-Luxus-Wohnung m. Küche	32	40217	\N	51.2127	6.7754	1898
33689702	https://www.wohnungsboerse.net/immodetail/33689702	190	6	6 Zimmer, 1 Dachterrasse,  3 Balkone - Blick ins Grüne	95	40597	Weststr.	51.1652	6.87106	1994
33689742	https://www.wohnungsboerse.net/immodetail/33689742	44	2	Charmante 2-Zimmer Wohnung mit Balkon	37	40227	\N	51.2154	6.79757	1953
33689786	https://www.wohnungsboerse.net/immodetail/33689786	70	3	Tauschwohnung: Schöne 3 Zimmer Wohnung mit Balkon in Friedrichstadt/Bilk	31	40215	\N	51.2149	6.78256	\N
33689861	https://www.wohnungsboerse.net/immodetail/33689861	53.45	2	renovierte 2 Zimmer Wohnung in Düsseldorf-Derendorf zu vermieten, ab sofort	15	40476	Ratherstr.	51.2475	6.78909	\N
33689905	https://www.wohnungsboerse.net/immodetail/33689905	58	2	Tauschwohnung: Ich, 30, w, ledig suche nach einem neuen Zuhause	32	40219	\N	51.2135	6.76234	\N
33689953	https://www.wohnungsboerse.net/immodetail/33689953	41.99	2	Demnächst frei! 2-Zimmer-Wohnung in Düsseldorf Hassels	98	40599	Potsdamer	51.1851	6.8609	1975
33689955	https://www.wohnungsboerse.net/immodetail/33689955	95.67	4	Bald verfügbar - 4-Zimmer-Wohnung in Düsseldorf-Hassels!	98	40599	Potsdamer	51.1853	6.86009	1975
33689957	https://www.wohnungsboerse.net/immodetail/33689957	77.13	3	3-Zimmer-Wohnung in Düsseldorf Hassels	98	40599	Potsdamer	51.1832	6.86	1975
33693280	https://www.wohnungsboerse.net/immodetail/33693280	79	3	Tauschwohnung: 3 Zimmer Wohnung Oberbilk	37	40227	\N	51.2154	6.79757	\N
33689973	https://www.wohnungsboerse.net/immodetail/33689973	70	3	Gut aufgeteilte 3-Zimmerwohnung in Düsseldorf Bilk nähe Arkaden .WG geeignet.	36	40223	Burghofstrasse.	51.2074	6.77516	1965
33689988	https://www.wohnungsboerse.net/immodetail/33689988	50	2	Tauschwohnung: Suche 3 Zimmer /biete 2 ZimmerWohnung saniert mit Balkon	62	40468	\N	51.2612	6.7789	\N
33690170	https://www.wohnungsboerse.net/immodetail/33690170	74	2	Stilvolle, geräumige 2-Zimmer-Wohnung mit Terrasse in Düsseldorf	55	40489	\N	51.3305	6.76259	2004
33690188	https://www.wohnungsboerse.net/immodetail/33690188	43	2	Renovierte 2 Zimmerwohnung	97	46045	Marktstr.	51.4692	6.85469	1950
33690189	https://www.wohnungsboerse.net/immodetail/33690189	65	2	Ansprechende 2 Zimmerwohnung	97	46045	Marktstr.	51.4692	6.85469	1950
33690199	https://www.wohnungsboerse.net/immodetail/33690199	100	3	Penthaus 3 Zimmer	97	41069	Bahnstraße	51.1801	6.40818	2016
33690202	https://www.wohnungsboerse.net/immodetail/33690202	88	3	Schöne 3 Zimmer Wohnung	97	50181	\N	50.9893	6.57115	2018
33690211	https://www.wohnungsboerse.net/immodetail/33690211	65	2	Elegante seniorengerechte Souterrain Wohnung auf 65 m² evtl. mit Wintergart. u. Garten	97	44807	\N	51.5111	7.22631	1987
33690212	https://www.wohnungsboerse.net/immodetail/33690212	100	3	3-Zimmer-Wohnung mit Süd-West-Balkon	97	40545	Teutonenstraße	51.2309	6.75916	1973
33690218	https://www.wohnungsboerse.net/immodetail/33690218	98	3.5	von privat - Bo-Stiepel - helle + moderne 3,5 Zimmer Wohnung (98qm) mit Parkett im Grünen	97	44797	\N	51.4244	7.22056	1996
33690220	https://www.wohnungsboerse.net/immodetail/33690220	145	4.5	Helle, geräumige 4,5 Zimmer Wohnung in Remscheid - Falkenberg	97	42859	\N	51.162	7.20605	1970
33690227	https://www.wohnungsboerse.net/immodetail/33690227	51	2	moderne, kernsanierte DG-Whg	97	45657	\N	51.6165	7.18956	1952
33690229	https://www.wohnungsboerse.net/immodetail/33690229	76.47	3	Wunderschöne 3 Zimmer - Wohnung in ruhiger Lage. "Küchenübernahme möglich"	97	47058	Schreiberstraße	51.4395	6.78156	2000
33691460	https://www.wohnungsboerse.net/immodetail/33691460	35.87	1	Win Win - 1 Zimmer Wohnung möbliert	33	40221	Speditionstraße	51.215	6.74985	\N
33691528	https://www.wohnungsboerse.net/immodetail/33691528	45	2	Geschmackvolle 2-Raum-Wohnung mit Balkon und EBK in Düsseldorf	31	40215	Scheurenstraße	51.2167	6.78713	\N
33691532	https://www.wohnungsboerse.net/immodetail/33691532	45	1	Geräumige Wohnung mit einem Zimmer in Düsseldorf	15	40476	Diedenhofener	51.247	6.77894	\N
33691605	https://www.wohnungsboerse.net/immodetail/33691605	85.88	3	Gut geschnittene 3-Zimmer-Wohnung in ruhiger Lage	96	40593	Corellistr.	51.1529	6.88301	1974
33691710	https://www.wohnungsboerse.net/immodetail/33691710	96.36	3	** Wunderschöne 3-Raumwohnung mit Terrasse in Düsseldorf **	64	40470	Robert-Stolz-Straße	51.2473	6.81112	1981
33691726	https://www.wohnungsboerse.net/immodetail/33691726	77.18	2	** Wunderschöne 2-Zimmerwohnung mit Loggia in Düsseldorf **	64	40470	Robert-Stolz-Straße	51.247	6.81142	1981
33691732	https://www.wohnungsboerse.net/immodetail/33691732	44.4	1	** Wunderschöne 1-Zimmer-Wohnung für Singles mit Badewanne und Terrasse in Düsseldorf **	64	40470	Robert-Stolz-Straße	51.2476	6.81036	1986
33691764	https://www.wohnungsboerse.net/immodetail/33691764	58	2	+++ Schöne 2-Zimmer-Wohnung mit Südwestbalkon +++	96	40593	Corellistr.	51.1534	6.88507	1976
33691788	https://www.wohnungsboerse.net/immodetail/33691788	25	1	Helles  Apartment im Medien Hafen, Top Lage!	32	40219	Neckarstraße	51.2133	6.75605	1965
33691840	https://www.wohnungsboerse.net/immodetail/33691840	40	1.5	Tauschwohnung: Superschöne Single oder Pärchenwohnung	32	40219	\N	51.2135	6.76234	\N
33691910	https://www.wohnungsboerse.net/immodetail/33691910	55	2	2 Zimmer, Küche, Diele Bad in Düsseldorf	82	40229	Krippstraße	51.2016	6.84588	1905
33692021	https://www.wohnungsboerse.net/immodetail/33692021	57	2	Charmante Souterrain-Wohnung mit Gartenidylle in Düsseldorf-Eller.	82	40229	Vohwinkelallee	51.2007	6.84581	1964
33692109	https://www.wohnungsboerse.net/immodetail/33692109	70	2.5	Ganz Oben in Oberkassel - Alles Neu, alles inklusive + Garage; ab sofort frei!	44	40547	Lewitstraße	51.2364	6.74663	1974
33692139	https://www.wohnungsboerse.net/immodetail/33692139	45	2	Etagenwohnung 45 m²	37	40227	Linienstr.	51.2165	6.79364	1900
33692941	https://www.wohnungsboerse.net/immodetail/33692941	182	4	***DAS GANZ BESONDERE WOHNEN DIREKT AM HOFGARTEN***	14	40479	Inselstr.	51.234	6.77415	1904
33693005	https://www.wohnungsboerse.net/immodetail/33693005	54	2	Schöne 2-Raum-Wohnung mit Balkon, Einbauküche und TG-Stellplatz in Düsseldorf	16	40476	\N	51.248	6.77902	\N
33693008	https://www.wohnungsboerse.net/immodetail/33693008	66	2.5	2 Zimmer Wohnung mit Balkon	23	40239	Scheidtstr.	51.2411	6.80105	\N
33693047	https://www.wohnungsboerse.net/immodetail/33693047	60	2	Ein Traum zwischen Altbau und Moderne mitten in Pempelfort	14	40477	Goebenstrasse	51.2393	6.78128	1910
33693051	https://www.wohnungsboerse.net/immodetail/33693051	35	2	Charmante 2 Zimmer Wohnung mit französischem Balkon	95	40597	Sophienstraße	51.1627	6.86444	\N
33693052	https://www.wohnungsboerse.net/immodetail/33693052	166.4	4.5	Luxuriöses Townhouse auf 2 Etagen mit Dachterrasse, Stellplatz, Wallbox	13	40210	Bendemannstraße	51.2228	6.79206	1956
33693114	https://www.wohnungsboerse.net/immodetail/33693114	62	2	D´dorf - Garath | Erstbezug nach Sanierung | 2-Zimmer-Wohnung im 4. OG mit Loggia und modernem Bad!	101	40595	\N	51.1408	6.90507	1969
33693182	https://www.wohnungsboerse.net/immodetail/33693182	56.32	2	Moderne Stadtwohnung mit Wohnkomfort: 2-Zimmer-Wohnung inkl. EBK , Balkon und zeitgemäßer Wohnküche!	91	40591	Werstener	51.1892	6.8334	1980
33693187	https://www.wohnungsboerse.net/immodetail/33693187	45	2	Tauschwohnung: Suche schönes Zuhause in Münster, biete tolle Wohnung in DUS	15	40476	\N	51.248	6.77902	\N
33693333	https://www.wohnungsboerse.net/immodetail/33693333	50	2	Zentral und ruhig! 1,5 Zimmer Wohnung, inklusive Balkon,  in der nähe der Königsallee	13	40210	Grupellostraße	51.2202	6.7876	1961
33693394	https://www.wohnungsboerse.net/immodetail/33693394	65	2.5	Tauschwohnung: Große 2,5 Zimmer Wohnung in Oberbilk mit Balkon	37	40227	\N	51.2154	6.79757	\N
33693410	https://www.wohnungsboerse.net/immodetail/33693410	76	3	Frisch sanierte 3-Zimmer-Stadtwohnung	13	40210	Stresemannstraße	51.2204	6.78507	1956
33693548	https://www.wohnungsboerse.net/immodetail/33693548	64.2	2.5	Geschmackvolle Dachgeschosswohnung mit zweieinhalb Räumen und Einbauküche in Düsseldorf	21	40233	Gerresheimer	51.2255	6.80315	\N
33695445	https://www.wohnungsboerse.net/immodetail/33695445	96	3	Nachmieter für schöne 3 Zimmer-Wohnung mit Balkon und Einbauküche gesucht	63	40472	\N	51.2685	6.83379	2013
33695459	https://www.wohnungsboerse.net/immodetail/33695459	97.1	3	Exklusive 3-Zimmer-Wohnung in Flingern Nord / Grafental mit EBK	22	40235	\N	51.2294	6.82752	2017
33695486	https://www.wohnungsboerse.net/immodetail/33695486	220	5	Ihr neues Zuhause! Wunderschöne 5 Zimmer Maisonette Wohnung mit großem Garten und Kamin! Mit Video!!	63	40472	Am	51.2751	6.84805	1985
33695528	https://www.wohnungsboerse.net/immodetail/33695528	85	3.5	Helle, gepflegte 3,5-Zimmer-Wohnung, 85 qm mit Loggia und EBK in Düsseldorf Mörsenbroich	64	40470	Herchenbachstraße	51.2502	6.8083	1967
33695572	https://www.wohnungsboerse.net/immodetail/33695572	56	2.5	Perfekt geschnittene 2,5 Zi- Wohnung mit EBK	92	51107	\N	50.9173	7.09025	1969
33695593	https://www.wohnungsboerse.net/immodetail/33695593	50	1.5	[Zwischenmiete] Wohnung mit Aufzug und Balkon in Friedrichstadt	31	40215	\N	51.2149	6.78256	\N
33695658	https://www.wohnungsboerse.net/immodetail/33695658	46	2	Tolle 2-Zimmer-Wohnung mit neuem Bad in Derendorf	15	40476	Collenbachstr.	51.2445	6.78328	1913
33695683	https://www.wohnungsboerse.net/immodetail/33695683	63.16	2	Großzügige 2-Zimmer-Erdgeschosswohnung mit kleiner Terrasse	15	40476	Collenbachstr.	51.2442	6.78317	1913
33695695	https://www.wohnungsboerse.net/immodetail/33695695	53.51	2	Moderne Wohnung in Hassels - Übernahme EBK + Möbel günstig möglich zum 01.02	98	40599	Süllenstr.	51.1736	6.86932	1953
33695717	https://www.wohnungsboerse.net/immodetail/33695717	102	3	GEWERBETREIBENDE ACHTUNG: WOHNEN UND ARBEITEN	23	40239	\N	51.2453	6.80322	1964
33695764	https://www.wohnungsboerse.net/immodetail/33695764	45	2	Tauschwohnung: Tausch 2 gegen 3 (DD-Köln oder DD-DD)	15	40476	\N	51.248	6.77902	\N
33695804	https://www.wohnungsboerse.net/immodetail/33695804	120	3	Tauschwohnung: Tausche Top-Altbau-Wohnung gegen ähnliches in kleiner	23	40239	\N	51.2453	6.80322	\N
33696584	https://www.wohnungsboerse.net/immodetail/33696584	76	2.5	Erdgeschoßwohnung mit Einbauküche & Hinterhofterrasse in Oberbilk	37	40227	Kruppstraße	51.215	6.80156	1910
33696595	https://www.wohnungsboerse.net/immodetail/33696595	245	5	Erstbezug! Kernsaniertes Altbau mit Rheinblick, Sonnengarten und 5 Terrassen!	41	40545	\N	51.2284	6.75437	1904
33696598	https://www.wohnungsboerse.net/immodetail/33696598	78	2.5	Sehr schöne & helle Wohnung in Top-Lage, komplett saniert, Balkon & Stellplatz von privat	21	40233	Birkenstraße	51.2198	6.8119	1954
33696670	https://www.wohnungsboerse.net/immodetail/33696670	131.4	4	Top-Renovierte Traumwohnung am Hofgarten	14	40479	Sternstraße	51.2347	6.78206	\N
33696812	https://www.wohnungsboerse.net/immodetail/33696812	68	3	3 Zimmer - Super geschnitten und in Top-Lage!	44	40547	Mönchenwerther	51.2355	6.75742	1972
33696980	https://www.wohnungsboerse.net/immodetail/33696980	79	2	Tauschwohnung: Wunderschöne Wohnung in Kaiserswerth	53	40489	\N	51.3305	6.76259	\N
33697125	https://www.wohnungsboerse.net/immodetail/33697125	45	2	2 Zimmer Single-Wohnung in Bilk	36	40223	Martinstraße	51.2068	6.76506	\N
33697167	https://www.wohnungsboerse.net/immodetail/33697167	55	2	Sanierte 2-Raum-Wohnung mit Balkon und Einbauküche in Dusseldorf	14	40477	Schlossstrasse	51.2388	6.78955	\N
33697204	https://www.wohnungsboerse.net/immodetail/33697204	29	1	Frisch sanierte Einzimmerwohnung mit großem Balkon in zentraler Lage. 600m zur KÖ, 300m zum HBF.	13	40210	Charlottenstraße	51.2216	6.78886	1983
33697287	https://www.wohnungsboerse.net/immodetail/33697287	80	3	Sie wollen Citylife? Die Kö und die Altstadt fußläufig erreichbar! 2. OG, Aufzug, EBK, modern!	92	40477	Nordstraße	51.2378	6.77939	2019
33697291	https://www.wohnungsboerse.net/immodetail/33697291	70	2	Wunderschöne 2 Zimmer Wohnung mit Balkon, Wannenbad, Aufzug und  TG-Platz in Ddrf Grafenberg	72	40629	Hardtstraße	51.2409	6.82947	\N
33698866	https://www.wohnungsboerse.net/immodetail/33698866	140	3	(Unter-)Bilk: 3-4 Zi.-Maisonette Erstbezug nach Sanierung	36	40223	Germaniastraße	51.2074	6.76075	1900
33698876	https://www.wohnungsboerse.net/immodetail/33698876	42	1	Charmante 1,5 Zimmer Altbauwohnung in Düsseldorf Rath	63	40472	Eckampstraße	51.2597	6.8176	\N
33698901	https://www.wohnungsboerse.net/immodetail/33698901	68	2	Ackerstraße 5, 40233 Düsseldorf	13	40233	Ackerstraße	51.2248	6.79657	\N
33698981	https://www.wohnungsboerse.net/immodetail/33698981	85	3	Tauschwohnung: Wunderschöne Altbauwohnung mit Balkon in Flingern-Nord	22	40235	\N	51.2294	6.82752	\N
33699093	https://www.wohnungsboerse.net/immodetail/33699093	59.42	2	SENIORENWOHNUNG - Gut geschnittene 2-Zimmer-Wohnung mit Terrasse	71	40625	Cottbusser	51.2285	6.85475	2024
33699162	https://www.wohnungsboerse.net/immodetail/33699162	64	3	Tauschwohnung: Schöne Wohnung nahe Lorettostr, Medienhafen und Rhein	32	40217	\N	51.2127	6.7754	\N
33699228	https://www.wohnungsboerse.net/immodetail/33699228	90	3	*****Traumhaft sanierte 3 Zimmer Wohnung mit Balkon und 240 qm großem Garten in bester Lage!*****	96	40593	Arnold-Schönberg-Str.	51.1527	6.88026	1970
33699268	https://www.wohnungsboerse.net/immodetail/33699268	30	1	Voll Möbliertes 1-ZimmerAppartment in Bestlage	14	40477	Duisburger	51.2353	6.78256	\N
33699377	https://www.wohnungsboerse.net/immodetail/33699377	60	2	Tauschwohnung: Tausche 2 Zimmer in DUS gegen größere Wohnung in Düsseldorf	31	40215	\N	51.2149	6.78256	\N
33699603	https://www.wohnungsboerse.net/immodetail/33699603	86	3	Moderne 3- Zimmer Wohnung auf der Lorettostr.	32	40219	Lorettostr	51.2131	6.76456	\N
33699701	https://www.wohnungsboerse.net/immodetail/33699701	45	2	Gemütliche 2 Zimmerwohnung  mit EBK in Hürth	92	50354	Burgstraße	50.8946	6.83385	\N
33699706	https://www.wohnungsboerse.net/immodetail/33699706	34	1	Schnuckelige, helle 1-Zimmerwohnung in ruhiger Derendorfer Lage	15	40476	Frankenstraße	51.2499	6.78039	1956
33700861	https://www.wohnungsboerse.net/immodetail/33700861	45	2	Modernisierte und vollstile mobliert Wohnung mit zwei Zimmern in 40237, Düsseldorf	23	40237	\N	51.2357	6.80917	1955
33700943	https://www.wohnungsboerse.net/immodetail/33700943	42	1	Attraktives helles Apartment	81	40231	An	51.2132	6.82584	1994
33701019	https://www.wohnungsboerse.net/immodetail/33701019	75	2	Tauschwohnung: Neu sanierte Wochnung mit hohe Decken und schönem Stuck	64	40470	\N	51.2569	6.80771	\N
33701122	https://www.wohnungsboerse.net/immodetail/33701122	74	3.5	Tauschwohnung: Schöner Neubau mitten in Düsseldorf	37	40227	\N	51.2154	6.79757	\N
33701215	https://www.wohnungsboerse.net/immodetail/33701215	51	1.5	Tauschwohnung: Moderne Altbauwohnung mit perfektem Schnitt und Balkon	31	40215	\N	51.2149	6.78256	\N
33701290	https://www.wohnungsboerse.net/immodetail/33701290	84.86	3	Mietpreisgedämpfte Neubauwohnung in bester Lage	13	40211	Klosterstraße	51.2241	6.78812	2020
33701313	https://www.wohnungsboerse.net/immodetail/33701313	100	3	Tauschwohnung: Weitläufige 3-Zimmer Altbau-Wohnung mit Terrasse	13	40211	\N	51.2301	6.79288	\N
33701324	https://www.wohnungsboerse.net/immodetail/33701324	52	2	Sehr schöne, komplett renovierte 2-Zimmer-Wohnung mit Gartennutzung in D'dorf-Gerresheim, von Privat	71	40625	Baltenstr.	51.2246	6.86421	1998
33701328	https://www.wohnungsboerse.net/immodetail/33701328	91	4	D-Gerresheim, von privat, 4 Zimmer, Küche, Diele Bad, 91 m², modernisiert, renoviert	71	40625	Baltenstr.	51.2244	6.86437	\N
33701343	https://www.wohnungsboerse.net/immodetail/33701343	73	3	Gepflegte 3-Zimmer-Wohnung mit Balkon in Düsseldorf	22	40233	Ackerstraße	51.2294	6.80523	\N
33701346	https://www.wohnungsboerse.net/immodetail/33701346	70.75	3	Willkommen im neuen Zuhause! 3-Zi-Wohnung inkl. Balkon	13	40210	Stresemannstraße	51.2202	6.78603	1960
33701398	https://www.wohnungsboerse.net/immodetail/33701398	130	3	Herausragende Mietwohnung in bester  Lage von Oberkassel	41	40549	\N	51.2331	6.71909	2014
33701525	https://www.wohnungsboerse.net/immodetail/33701525	79	3	Schöne, großzügige 3-ZW mit Balkon in ruhiger Lage von Düsseldorf-Eller, Erstbezug nach Sanierung	82	40229	\N	51.1968	6.84602	1950
33703355	https://www.wohnungsboerse.net/immodetail/33703355	86.4	3	Helle Wohnung im Herzen von Pempelfort	14	40479	Bagelstraße	51.2346	6.79194	1956
33703369	https://www.wohnungsboerse.net/immodetail/33703369	58	2	Tauschwohnung: Suche 2 Zimmer in Berlin - biete 2-Zimmer  in Flingern Nord	22	40235	\N	51.2294	6.82752	\N
33703392	https://www.wohnungsboerse.net/immodetail/33703392	74.6	2	Schicke 2-Zimmer-Wohnung mit Wintergarten im ruhigen Düsseldorf-Angermund	55	40489	Kirchweg	51.3313	6.78758	1958
33703393	https://www.wohnungsboerse.net/immodetail/33703393	67.54	3	Tolle 3-Zimmer-Wohnung mit tollem Balkon im frisch wärmegedämmten Objekt	63	40472	Neuenhofstraße	51.2632	6.80958	1928
33703417	https://www.wohnungsboerse.net/immodetail/33703417	38	1.5	Tauschwohnung: Suche Wohnung näher zur HSD	36	40223	\N	51.1998	6.77225	\N
33703442	https://www.wohnungsboerse.net/immodetail/33703442	52.16	2	Traumwohnung in Derendorf!	15	40476	Rather	51.2508	6.78845	1915
33703455	https://www.wohnungsboerse.net/immodetail/33703455	108.85	4	Zweitbezug nach DG-Ausbau: Moderne 4-Zimmer-Wohnung im beliebten Benrath	95	40597	Hospitalstraße	51.1658	6.86615	1952
33703507	https://www.wohnungsboerse.net/immodetail/33703507	75	2	Tauschwohnung: Heller Altbau Unterbilk mit Erker	32	40219	\N	51.2135	6.76234	\N
33703540	https://www.wohnungsboerse.net/immodetail/33703540	33	1	Tauschwohnung: Zentrale Düsseldorfer Wohnung mit Schlafzimmer und Wohnküche	31	40215	\N	51.2149	6.78256	\N
33703578	https://www.wohnungsboerse.net/immodetail/33703578	50	1.5	Tauschwohnung: Zentrale Lage Düsseldorf gegen Stuttgart	31	40215	\N	51.2149	6.78256	\N
33703627	https://www.wohnungsboerse.net/immodetail/33703627	143	4	Ruhige 4-Zimmer Wohnung in denkmalgeschütztem Altbau in Oberkassel befristet auf 2-3 Jahre	41	40545	\N	51.2284	6.75437	1913
33703673	https://www.wohnungsboerse.net/immodetail/33703673	92	3	Kernsanierte Gartenwohnung mit großzügiger Terrasse und großem Garten	62	40468	\N	51.2612	6.7789	\N
33703775	https://www.wohnungsboerse.net/immodetail/33703775	125	3	Charmante 3-Zimmer Wohnung im Herzen von Düsseldorf	13	40210	Bismarckstraße	51.2226	6.7853	\N
33704447	https://www.wohnungsboerse.net/immodetail/33704447	100	4.5	große Dachgeschosswohnung	63	40472	\N	51.2685	6.83379	1902
33704470	https://www.wohnungsboerse.net/immodetail/33704470	65	2	Tauschwohnung: Helle moderne Zweizimmerwohnung mit großem Südbalkon	15	40476	\N	51.248	6.77902	\N
33704509	https://www.wohnungsboerse.net/immodetail/33704509	30	1	Tauschwohnung: Tausche zentrale 1 Zimmer Wohnung in Friedrichstadt gegen	31	40215	\N	51.2149	6.78256	\N
33704559	https://www.wohnungsboerse.net/immodetail/33704559	65	3	Geschmackvolle Wohnung mit drei Zimmern in Düsseldorf	32	40219	Gladbacher	51.2118	6.76235	1905
33704572	https://www.wohnungsboerse.net/immodetail/33704572	67	2	Tauschwohnung: Tausche wunderschöne 2-Z-Whg mit in Düsseltal gegen größere	23	40239	\N	51.2453	6.80322	\N
33704596	https://www.wohnungsboerse.net/immodetail/33704596	95	4	Gepflegte 4-Zimmer-Wohnung zu vermieten	94	40599	Henkelstraße	51.1791	6.86025	1966
33705222	https://www.wohnungsboerse.net/immodetail/33705222	25	1	Nachmieter*in gesucht für helles Apartment in Bilk - perfekt für Studierende	36	40221	\N	51.1997	6.75072	\N
33705276	https://www.wohnungsboerse.net/immodetail/33705276	126	4	Neuwertige 4-Zimmer-Wohnung mit Balkon in Düsseldorf	71	40625	\N	51.2358	6.85232	2014
33705284	https://www.wohnungsboerse.net/immodetail/33705284	36	1.5	Tauschwohnung: Schöne 1,5 Zimmer Wohnung in Pempelfort	14	40479	\N	51.2333	6.78371	\N
33705304	https://www.wohnungsboerse.net/immodetail/33705304	70	1	Möblierte Traumwohnung mit Garten im Herzen von Flingern	22	40233	Hermannstraße	51.2274	6.80852	1910
33705317	https://www.wohnungsboerse.net/immodetail/33705317	30	1	Tauschwohnung: Wunderschöne Wohnung im Herzen Düsseldorfs abzugeben!	11	40213	\N	51.2221	6.77271	\N
33705337	https://www.wohnungsboerse.net/immodetail/33705337	31	1	1 Zimmer Apartment mit großer Terrasse und Stellplatz, 1993 Baujahr	98	40599	Bublitzer	51.1772	6.86848	1993
33705345	https://www.wohnungsboerse.net/immodetail/33705345	95	3	Für den gehobenen Anspruch: Exklusive 3-Zimmer-Wohnung mit EBK-Küche in Oberkassel.	41	40549	Schanzenstrasse	51.2351	6.73547	2006
33705365	https://www.wohnungsboerse.net/immodetail/33705365	44	2	Tauschwohnung: Singlewohnung zum Tausch in Bilk	36	40223	\N	51.1998	6.77225	\N
33705388	https://www.wohnungsboerse.net/immodetail/33705388	86.06	3	D-Niederkassel: modernes Wohnen am KFR Ecke Lotharstrasse - mit dem Rhein vor der Türe...	44	40547	Kaiser-Friedrich-Ring	51.2419	6.74937	2006
33705398	https://www.wohnungsboerse.net/immodetail/33705398	44	1.5	Geschmackvolle 1,5-Raum-Wohnung mit Balkon und Einbauküche in Düsseldorf	64	40470	Marie-Juchacz-Straße	51.248	6.80806	1983
33705400	https://www.wohnungsboerse.net/immodetail/33705400	50	2	TOPLAGE NÄHE NORDSTRAßE - KLEINES PARADIES MIT LOGGIA	16	40476	Mauerstraße	51.2421	6.77933	1936
33705406	https://www.wohnungsboerse.net/immodetail/33705406	68	2	Tauschwohnung: Wunderschöne Altbauwohnung Flingern	22	40235	\N	51.2294	6.82752	\N
33705811	https://www.wohnungsboerse.net/immodetail/33705811	112	3	Burg Angermund: Wohlfühlen im historischen Gebäude mitten im Grünen	55	40489	Graf-Engelbert-Straße	51.3288	6.79475	1198
33705943	https://www.wohnungsboerse.net/immodetail/33705943	30	2	Tauschwohnung: Suche Münster, biete Düsseldorf DG mit EBK	37	40227	\N	51.2154	6.79757	\N
33705959	https://www.wohnungsboerse.net/immodetail/33705959	68.89	2	Gepflegte 2-Zimmer-Wohnung mit Wohnküche in zentraler Lage. EBK kann übernommen werden	13	40211	\N	51.2301	6.79288	1955
33705960	https://www.wohnungsboerse.net/immodetail/33705960	80	4	Sanierte Eigentumswohnung in Düsseldorf Derendorf mit guter Raumaufteilung zur Miete	15	40476	\N	51.248	6.77902	1972
33705987	https://www.wohnungsboerse.net/immodetail/33705987	50	2	Tauschwohnung:  Düsseldorf Altbau gegen Köln	36	40223	\N	51.1998	6.77225	\N
33706010	https://www.wohnungsboerse.net/immodetail/33706010	64	2	Direkt von der Eigentümerin: Moderne und helle 2,5 Zimmerwohnung mit schönem Balkon	91	40589	\N	51.1641	6.82144	1956
33706012	https://www.wohnungsboerse.net/immodetail/33706012	62	2	*Top geschnittene, helle 2-Raum-Balkon Wohnung*sucht Liebhaber! Itterstraße*	93	40589	Itterstraße	51.174	6.82997	1969
33706041	https://www.wohnungsboerse.net/immodetail/33706041	80	2	CHARMANTES PENTHOUSE - ERSTBEZUG - IN DÜSSELTAL - EBK-AUFZUG-GARAGE!	23	40239	Brehmstraße	51.2441	6.80141	\N
33706042	https://www.wohnungsboerse.net/immodetail/33706042	35	1	Tauschwohnung: Schöne 1 Zimmerwohnung mit Dachterrasse	13	40210	\N	51.2225	6.78772	\N
33706060	https://www.wohnungsboerse.net/immodetail/33706060	55	2	***NETTE MIETER GESUCHT-TOLLE 2 ZIMMER WOHNUNG MIT BALKON***	84	40627	Flachskampstr.	51.2071	6.88942	1970
33706091	https://www.wohnungsboerse.net/immodetail/33706091	61	2	Tauschwohnung: 2- Zimmer + Balkon in Toplage in Unterbilk	32	40219	\N	51.2135	6.76234	\N
33706795	https://www.wohnungsboerse.net/immodetail/33706795	52	2	Exklusive 2-Zimmer-Wohnung mit Balkon und EBK in Düsseldorf	63	40472	Iserlohner	51.2614	6.81538	\N
33706807	https://www.wohnungsboerse.net/immodetail/33706807	92	3	Düsseldorf Garath Süd West 3-Zimmer-Wohnung im 1. OG  direkt am Naturschutzgebiet	101	40595	Jakob-Kneip-Straße	51.1346	6.90115	1965
33706813	https://www.wohnungsboerse.net/immodetail/33706813	125	4	Eine wunderschöne 4 Zi Wohnung mit Garten - Neubau nach Sanierung mit Garten	14	40476	Blücherstrasse	51.2377	6.78439	1911
33706834	https://www.wohnungsboerse.net/immodetail/33706834	30	1	Geschmackvolle 1-Raum-Wohnung mit Balkon und Einbauküche in Düsseldorf	95	40597	\N	51.1638	6.87102	\N
33706960	https://www.wohnungsboerse.net/immodetail/33706960	58	2	Schöne 2-Zimmer-Wohnung mit EBK, Sonnenbalkon und TG-Stellplatz	72	40629	Staufenplatz	51.241	6.83018	1997
33707022	https://www.wohnungsboerse.net/immodetail/33707022	53	2	Tauschwohnung: Ich tausche schöne 2 Zimmerwohnung gegen 3 Zimmer	36	40225	\N	51.1974	6.78988	\N
33707100	https://www.wohnungsboerse.net/immodetail/33707100	88	3	Gut geschnittene 3 Zimmer-Wohnung in ruhiger Lage	23	40239	Windscheidstraße	51.2445	6.79917	\N
33707202	https://www.wohnungsboerse.net/immodetail/33707202	45	2	Exklusive, modernisierte 2-Zimmer-Wohnung mit Balkon und Einbauküche in Düsseldorf	21	40233	Langerstraße	51.2238	6.80455	\N
33707208	https://www.wohnungsboerse.net/immodetail/33707208	71	3	Florastraße, schöne sanierte 3-Z-Whg, niedrige Betriebskosten	32	40217	\N	51.2127	6.7754	1955
33707626	https://www.wohnungsboerse.net/immodetail/33707626	150	4	Flingern Nord: Exklusive 4-Raum-Wohnung in elegantem Gebäude	22	40233	Lindenstraße	51.2281	6.80631	\N
33707630	https://www.wohnungsboerse.net/immodetail/33707630	65	2	Frisch renovierte 2 ZKDB-Wohnung mit Balkon und Garage	62	40468	Am	51.2726	6.78158	\N
33708228	https://www.wohnungsboerse.net/immodetail/33708228	100	4	Maisonette Wohnung mit eigenem Eingang	55	40489	Auf	51.3296	6.77431	\N
33708296	https://www.wohnungsboerse.net/immodetail/33708296	142.7	5	Erstbezug nach Sanierung mit 2 EBK und Balkon: stilvolle 5-Zimmer-Maisonette-Wohnung	94	40599	\N	51.1825	6.8657	1912
33708318	https://www.wohnungsboerse.net/immodetail/33708318	110	4	Große 4-Zimmer-Wohnung mit offener Küche, Einbauküche und eigenem Garten in D-Holthausen	93	40589	Hinter	51.1782	6.83131	1920
33708437	https://www.wohnungsboerse.net/immodetail/33708437	16	1	Neu möblierte WG-Zimmer mit perfekter Anbindung in Düsseldorf-Benrath BITTE TEXT LESEN	95	40599	Hasselsstraße	51.1709	6.87377	\N
33708444	https://www.wohnungsboerse.net/immodetail/33708444	57	2	Tauschwohnung: 2-Zimmer Altbauwohnung in Flingern	22	40235	\N	51.2294	6.82752	\N
33708457	https://www.wohnungsboerse.net/immodetail/33708457	78	3	Schöne 3 Zimmer Wohnung (Souterrain) in D - Eller	37	40227	Erbacher	51.2048	6.81668	\N
33708525	https://www.wohnungsboerse.net/immodetail/33708525	80	3	Mieter suchen Nachmieter: Schöne 80qm Wohnung im Herzen von Düsseldorf Kaiserswerth!	53	40489	Kaiserswerther	51.3013	6.73687	\N
33709317	https://www.wohnungsboerse.net/immodetail/33709317	77	3	Moderne 3-Zimmer-Wohnung mit Balkon und EBK in Düsseldorf	36	40223	\N	51.1998	6.77225	2008
33709346	https://www.wohnungsboerse.net/immodetail/33709346	65	2	Wohnen im begehrten TANNENHOF - provisionsfrei	15	40476	Tannenstraße	51.2508	6.77854	1898
33709514	https://www.wohnungsboerse.net/immodetail/33709514	40	2	Helle 2-Zimmerwohnung in Düsseldorf-Stadtmitte	13	40233	\N	51.2198	6.8119	1950
33709534	https://www.wohnungsboerse.net/immodetail/33709534	52	2	Carlsplatz - Charmant möblierte 2-Zi-Wohnung über den Dächern der Altstadt zur Untermiete	11	40213	Wallstraße	51.2246	6.77403	\N
33709536	https://www.wohnungsboerse.net/immodetail/33709536	134	4	Repräsentative 4-Zi.-Maisonettewohnung, Top-Lage	55	40489	Bahnhofstraße	51.3306	6.78528	1981
33709563	https://www.wohnungsboerse.net/immodetail/33709563	31	1	Wohnen am kulinarischen Herzens Derendorf	15	40476	\N	51.248	6.77902	1914
33709668	https://www.wohnungsboerse.net/immodetail/33709668	111	4	Geschmackvolle 4-Raum-Maisonette-Wohnung mit Balkon und Einbauküche in Düsseldorf	93	40589	Adolf-Klarenbachstr.	51.1723	6.83396	1955
33709735	https://www.wohnungsboerse.net/immodetail/33709735	70	2	Gehobene 2 Zimmer-Wohnung in zentraler Lage	36	40223	Suitbertusstr.	51.2047	6.77773	2019
33710405	https://www.wohnungsboerse.net/immodetail/33710405	72	2	Stilvolle, moderne 2-Zimmer-Wohnung in Düsseldorf	16	40476	Schwannstraße	51.2497	6.77318	2018
33710407	https://www.wohnungsboerse.net/immodetail/33710407	80	3	Freundliche 3-Zimmer-Wohnung mit Balkon in Düsseldorf	55	40489	Zur	51.3237	6.78825	1979
33710474	https://www.wohnungsboerse.net/immodetail/33710474	32	1	Modernes 1-Zimmerapartment zu vermieten	64	40470	\N	51.2569	6.80771	\N
33710483	https://www.wohnungsboerse.net/immodetail/33710483	57	2	Ruhige 2-Zimmer-Wohnung mit Balkon und Einbauküche in Düsseldorf-Lierenfeld	81	40231	\N	51.2135	6.83024	1965
33710498	https://www.wohnungsboerse.net/immodetail/33710498	64	2	Schöne 2-Zimmer-Wohnung mit Balkon zum Hinterhof in Oberbilk	37	40227	\N	51.2154	6.79757	\N
33710499	https://www.wohnungsboerse.net/immodetail/33710499	36	1	Schöne 1-Zimmer-Wohnung mit Balkon in Düsseldorf	93	40589	Heinrich-Hertz-Straße	51.1707	6.83066	\N
33710519	https://www.wohnungsboerse.net/immodetail/33710519	110	4	Schöne 4-Zimmer-Altbauwohnung in D'dorf-Bilk	36	40223	Aachener	51.2068	6.77565	1900
33710530	https://www.wohnungsboerse.net/immodetail/33710530	51	2	Exklusive 2-Zimmer-Wohnung in Düsseldorf	11	40213	\N	51.2221	6.77271	\N
33710692	https://www.wohnungsboerse.net/immodetail/33710692	67	3	Erstbezug! Schöne, kernsanierte und helle 3-Zi.-Whg. mit Loggia und hochwertiger Küche	71	40627	Kamper	51.2168	6.86612	1968
33710697	https://www.wohnungsboerse.net/immodetail/33710697	44	1	schöne  1 Zi. - Wohnung mit separater Küche und Balkon in Düsseldorf-Bilk	36	40223	Burghofstr.	51.207	6.77219	1950
33710804	https://www.wohnungsboerse.net/immodetail/33710804	85	4	Schöne 4 Zimmer Wohnung in ruhiger zentraler Lage	14	40477	Annastr.	51.2415	6.78854	1977
33713452	https://www.wohnungsboerse.net/immodetail/33713452	52.8	2.5	2 Balkone | 2,5 Zimmer | Wohnküche | WG geeignet	31	40215	Mintropstraße	51.2186	6.7889	1956
33713644	https://www.wohnungsboerse.net/immodetail/33713644	57	2	BEZAUBERNDE DACHGESCHOSSWOHNUNG - MITTEN IN FLINGERN  - BAD MIT FENSTER !!!	21	40233	Hubbelrather	51.2234	6.80584	1938
33713773	https://www.wohnungsboerse.net/immodetail/33713773	79	3	47114/31 Moderne 3-Zimmer-Wohnung in Flingern	21	40233	Mettmanner	51.2243	6.80288	2015
33713792	https://www.wohnungsboerse.net/immodetail/33713792	42	1.5	Tauschwohnung: gemütliche Wohnung nähe Hbf gegen Kölner Wohnung	37	40227	\N	51.2154	6.79757	\N
33713828	https://www.wohnungsboerse.net/immodetail/33713828	45	2	Tolle Etagenwohnung Nähe Worringer Platz	13	40233	Ackerstr.	51.2259	6.79802	1964
33713915	https://www.wohnungsboerse.net/immodetail/33713915	75	3	Innenstadtwohnung in kleiner Seitenstrasse !	13	40211	Hohenzollernstrasse	51.2252	6.79005	1959
33714056	https://www.wohnungsboerse.net/immodetail/33714056	47	2	Hübsche Singlewhg. nähe Medienhafen, EBK Übernahme mgl.	36	40223	Sternwartstraße	51.2062	6.76227	1955
33714070	https://www.wohnungsboerse.net/immodetail/33714070	14	1	Gehobenes WG-Zimmer. Vollständig renovierte WG-Wohnung (3er-WG) ab dem 01.11.2023	92	51103	\N	50.9403	7.01361	2013
33714081	https://www.wohnungsboerse.net/immodetail/33714081	130	3	Lichtdurchflutete Dachgeschoss-Wohnung mit 130 qm und großer Dachterrasse	92	42109	Bremer	51.2697	7.13104	\N
33714087	https://www.wohnungsboerse.net/immodetail/33714087	72.35	3	3-Zimmer-Wohnung mit Balkon mitten in Wesseling	92	50389	\N	50.8256	6.97254	1974
33714089	https://www.wohnungsboerse.net/immodetail/33714089	63	2.5	Schöne Erdgeschosswohnung mit Terrasse - optimal für Singles	92	45966	Kreuzstraße	51.5795	6.96307	1998
33714091	https://www.wohnungsboerse.net/immodetail/33714091	35	1	Gemütliche Dachgeschoßwohnung am historischen Ortskern von Wülfrath	92	42489	\N	51.2803	7.03496	1905
33715691	https://www.wohnungsboerse.net/immodetail/33715691	58.5	2.5	Helle, renovierte 2,5 Zimmer Wohnung mit Balkon in Wersten, Keller, Badewanne AB SOFORT	91	40591	Leichlinger	51.1868	6.82486	1982
33715853	https://www.wohnungsboerse.net/immodetail/33715853	59.84	2	Helle Maisonettewohnung mit großem Balkon in zentraler Lage von Düsseldorf	32	40217	Kronprinzenstr.	51.2155	6.77162	1970
33715912	https://www.wohnungsboerse.net/immodetail/33715912	28	1	Frisch saniertes 1-Zimmer Apartment	37	40227	Kölnerstr.	51.2185	6.801	\N
33715919	https://www.wohnungsboerse.net/immodetail/33715919	34	2	Frisch saniertes 2-Zimmer Apartment	37	40227	Kölnerstr.	51.2185	6.801	\N
33715925	https://www.wohnungsboerse.net/immodetail/33715925	67	3	Frisch sanierte 3-Zimmer Wohnung mit kleinem Balkon	37	40227	Kölnerstr.	51.2185	6.801	\N
33715951	https://www.wohnungsboerse.net/immodetail/33715951	45	2	Wunderschöne 2 Zimmerwohnung mit großen Balkon	62	40472	Lichtenbroicher	51.2778	6.79498	2021
33715994	https://www.wohnungsboerse.net/immodetail/33715994	87	3	Sanierte 3-Zimmer-Altbauwohnung in der blühenden Halskestraße (Friedrichstadt)	31	40215	Halskestraße	51.2122	6.78801	1903
33716067	https://www.wohnungsboerse.net/immodetail/33716067	77	3	D´dorf - Garath | Erstbezug nach Sanierung | 3-Zimmer-Wohnung im 9. OG mit Loggia und modernem Bad!	101	40595	Heinrich-von-Brentano-Platz	51.1426	6.89512	1969
33716085	https://www.wohnungsboerse.net/immodetail/33716085	46	2	Tauschwohnung: TAUSCHWOHNUNG, Derendorf	15	40476	\N	51.248	6.77902	\N
33716093	https://www.wohnungsboerse.net/immodetail/33716093	76	3	Kernsanierte und Gepflegte 3-Zimmer-Wohnung mit Balkon und EBK in Düsseldorf	63	40472	Am	51.2661	6.8173	\N
33716129	https://www.wohnungsboerse.net/immodetail/33716129	79	3	47114/34 hochwertige 3-Zimmer-Wohnung in Flingern	21	40233	Mettmanner	51.2243	6.80288	2015
33716140	https://www.wohnungsboerse.net/immodetail/33716140	62	2	Helle 2 Zimmerwohnung mit großem Südbalkon und Außenstellplatz, Provisionsfrei	82	40231	\N	51.2135	6.83024	\N
33716142	https://www.wohnungsboerse.net/immodetail/33716142	80	3	47114/6 Charmante 3-Zimmer-Wohnung in Flingern	21	40233	Mettmanner	51.2245	6.80274	2015
33716146	https://www.wohnungsboerse.net/immodetail/33716146	65.3	2	+++Attraktive Lage im Erdgeschoss: 2-Zimmer-Wohnung mit Terrasse+++	102	40595	Dresdner	51.1373	6.90789	1900
33716268	https://www.wohnungsboerse.net/immodetail/33716268	25	1	*City Apartment* All Inclusive	31	40215	\N	51.2149	6.78256	1954
33716389	https://www.wohnungsboerse.net/immodetail/33716389	45.91	2	Modernes Exklusiv ausgestattetes 2-Zimmer Apartment in zentraler Lage	32	40217	\N	51.2127	6.7754	2015
33717156	https://www.wohnungsboerse.net/immodetail/33717156	94	3	Schöne, geräumige drei Zimmer Altbauwohnung in Düsseldorf, Rath	63	40472	Rather	51.2558	6.82039	\N
33717215	https://www.wohnungsboerse.net/immodetail/33717215	40	2	Exklusive 2-Zimmer-Wohnung in Düsseldorf	62	40468	\N	51.2612	6.7789	\N
33717259	https://www.wohnungsboerse.net/immodetail/33717259	79.4	3	Erstbezug: Wohnung mit drei Zimmern sowie Balkon und EBK in Düsseldorf-Heerd	42	40549	Hildegard-Knef-Straße	51.2429	6.71609	2024
33717289	https://www.wohnungsboerse.net/immodetail/33717289	35	1	Luxus-Appartement in TOP-Lage	95	40597	Sophienstr	51.1628	6.8643	1973
33717322	https://www.wohnungsboerse.net/immodetail/33717322	70	4	Tauschwohnung: Große Wohnung	83	40627	\N	51.2024	6.88388	\N
33717329	https://www.wohnungsboerse.net/immodetail/33717329	122.93	5	Große 5-Zimmer-Wohnung im Neubauquartier Gather Höfe in Düsseldorf-Rath!	63	40472	\N	51.2685	6.83379	2024
33717380	https://www.wohnungsboerse.net/immodetail/33717380	78.81	3	Wohnen in einer 3-Zimmer Wohnung mit EBK in einer der schönsten Straßen Düsseldorf's	16	40476	Zietenstr.	51.2421	6.77543	1955
33717408	https://www.wohnungsboerse.net/immodetail/33717408	150	3	Tauschwohnung: Wunderschöne Gartenwohnung mit Holzofen	62	40468	\N	51.2612	6.7789	\N
33717463	https://www.wohnungsboerse.net/immodetail/33717463	10	1	Modernes Wohnen im Nano Apartment	37	40227	Eintrachtstr.	51.2209	6.7997	\N
33717499	https://www.wohnungsboerse.net/immodetail/33717499	50	2	Tauschwohnung: perfekt aufgeteilte 2-Zimmer Wohnung mit Balkon	15	40476	\N	51.248	6.77902	\N
33717531	https://www.wohnungsboerse.net/immodetail/33717531	105	3	In Düsseldorf: Hochwertige Wohnung mit drei Zimmern und Balkon	32	40217	Kronprinzenstraße	51.212	6.77013	1991
33717536	https://www.wohnungsboerse.net/immodetail/33717536	60.85	2	Moderne Erdgeschoss Wohnung im Neubauquartier Gather Höfe!	63	40472	\N	51.2685	6.83379	2024
33717537	https://www.wohnungsboerse.net/immodetail/33717537	99.3	3	Neubauquartier Gather Höfe: Großzügige und moderne 3-Zimmer-Wohnung mit Garten Nähe Aaper Wald!	63	40472	\N	51.2685	6.83379	2024
33717538	https://www.wohnungsboerse.net/immodetail/33717538	56.13	2	Neubauquartier Gather Höfe: Moderne 2-Zimmer-Wohnung Nähe Aaper Wald!	63	40472	\N	51.2685	6.83379	2024
33717539	https://www.wohnungsboerse.net/immodetail/33717539	63.85	2	Moderne, große 2-Zimmer-Wohnung im Neubauquartier Gather Höfe	63	40472	\N	51.2685	6.83379	2024
33717540	https://www.wohnungsboerse.net/immodetail/33717540	112.32	4	Moderne 4-Zimmer-Wohnung mit Garten im Neubauquartier Gather Höfe Nähe Aaper Wald!	63	40472	\N	51.2685	6.83379	2024
33717626	https://www.wohnungsboerse.net/immodetail/33717626	40	2	Tauschwohnung: Biete Unterbilk, suche Düsseltal, 2 Zimmer	32	40217	\N	51.2127	6.7754	\N
33717668	https://www.wohnungsboerse.net/immodetail/33717668	130	4	Premium 4-Zi. Apartment, Top EBK, 2 Bäder, 2 Balkone, 2 TG, einmaliger Blick	22	40235	Hohenzollernallee	51.233	6.82484	2015
33717747	https://www.wohnungsboerse.net/immodetail/33717747	37.61	1	Erstbezug: EG 1-Zimmer-Appartement mit Garten im Sohnemann am Hanielpark	23	40237	Sohnstraße	51.2346	6.81603	2023
33717778	https://www.wohnungsboerse.net/immodetail/33717778	100	4	Erstbezug nach Sanierung mit Balkon: exklusive 4-Zimmer-Wohnung in Düsseldorf Düsseltal	23	40239	\N	51.2453	6.80322	\N
33717797	https://www.wohnungsboerse.net/immodetail/33717797	58	3	3-Zimmer-Altbaucharme in Flingern, ab 1.1.24	21	40233	Behrenstraße	51.2254	6.81187	1939
33717857	https://www.wohnungsboerse.net/immodetail/33717857	70	3	3-Zimmer-Altbau-Wohnung mit Balkon in Rath	63	40472	Rather	51.2643	6.80495	1910
33717867	https://www.wohnungsboerse.net/immodetail/33717867	80	3	Gemütliche Dreizimmerwohnung im Herzen von Düsseldorf-Gerresheim	71	40625	Hasselbeckstraße	51.2394	6.85392	\N
33719295	https://www.wohnungsboerse.net/immodetail/33719295	70	2	2 Zimmer- Wohnung zentral Flingern-Nord	22	40235	\N	51.2294	6.82752	\N
33719317	https://www.wohnungsboerse.net/immodetail/33719317	43	2	2-Zimmer-Hochparterre-Wohnung mit Balkon in Düsseldorf.\n\nBadezimmer ist neu gemacht.	91	40591	\N	51.188	6.81736	1984
33719345	https://www.wohnungsboerse.net/immodetail/33719345	38	1	Praktisches Apartment mit Balkon und Einbauküche in Oberbilk	37	40227	Kölnerstrasse	51.2154	6.80429	\N
33719442	https://www.wohnungsboerse.net/immodetail/33719442	55	2	D-Medienhafen. Moderne  Maisonette-Wohnung mit zwei Zimmern und Balkon	32	40219	Hammerstraße	51.2136	6.75454	\N
33719454	https://www.wohnungsboerse.net/immodetail/33719454	28	1	Wohnung am Düsseldorf - Zoo  mit einem Zimmer  sowie Balkon . Komplett möbliert .	23	40237	Rethelstraße	51.2357	6.79772	1956
33719548	https://www.wohnungsboerse.net/immodetail/33719548	54	2	Tauschwohnung: Zwei Zimmerwohnung mit Blick ins Grüne	31	40215	\N	51.2149	6.78256	\N
33719633	https://www.wohnungsboerse.net/immodetail/33719633	65	2	Exklusive 2-Zimmer Wohnung im Herzen von Alt-Oberkassel - Erstbezug nach Sanierung - inkl. EBK	41	40545	Wildenbruchstraße	51.2289	6.75349	1976
33719635	https://www.wohnungsboerse.net/immodetail/33719635	50	2	Renovierte Wohnung - 2 Z. +Balkon u. Einbauküche in Düsseld. Holthausen - WG Potential -	93	40589	Bonnerstraße	51.174	6.83399	1960
33719697	https://www.wohnungsboerse.net/immodetail/33719697	35	1.5	Vollständig möblierte Wohnung in Düsseldorf Derendorf für 895 Pauschalmiete	15	40476	Weißenburgstraße	51.2464	6.78516	\N
33719712	https://www.wohnungsboerse.net/immodetail/33719712	43	2	Tauschwohnung: Gemütliche helle 2-Zimmer Wohnung in Unterbilk	32	40217	\N	51.2127	6.7754	\N
33719818	https://www.wohnungsboerse.net/immodetail/33719818	55	2	Geschmackvolle 2-Raum-Erdgeschosswohnung mit Balkon und EBK in Düsseldorf	53	40489	Kittelbachstr	51.2953	6.73736	\N
33720495	https://www.wohnungsboerse.net/immodetail/33720495	55	2	Dachgeschosswohnung 55 qm Nähe Flughafen/Messe	62	40468	Kartäuser	51.2765	6.78027	\N
33720500	https://www.wohnungsboerse.net/immodetail/33720500	130	4	Erstbezug nach Modernisierung: Attraktive Wohnung mit Terrasse  - 4Zi. / ruhige Wohnlage	92	51427	\N	50.957	7.12678	1969
33720505	https://www.wohnungsboerse.net/immodetail/33720505	70	3	Attraktive \n3-Zimmer-Wohnung mit Balkon und Einbauküche in Düsseldorf Flingern	22	40233	Birkenstraße	51.227	6.80475	\N
33720562	https://www.wohnungsboerse.net/immodetail/33720562	20	1	Möbliertes 1-Zimmer-Apartment mit Einbauküche, WLAN - sofort frei	71	40625	Schönaustr.	51.2347	6.85914	1908
33720659	https://www.wohnungsboerse.net/immodetail/33720659	71.6	2	EXKLUSIV IN BILK NÄHE UNI PARKETT TERRASSE WANNENBAD HELL + MODERN RENOVIERT TIEFGARAGENEINSTELLPL.	38	40225	Himmelgeister	51.194	6.78439	1990
33720686	https://www.wohnungsboerse.net/immodetail/33720686	58	2	Ruhige, sonnige 2-Zimmer-DG-Wohnung in denkmalgeschütztem Jugendstilhaus	22	40235	Hoffeldstraße	51.2296	6.81395	1907
33720746	https://www.wohnungsboerse.net/immodetail/33720746	168	3	Besonderes Haus, besondere Wohnung im Dachgeschoss! Ihre 2 Etagen in direkter Lage von Oberkassel!	41	40545	\N	51.2284	6.75437	1926
33720783	https://www.wohnungsboerse.net/immodetail/33720783	71.25	3	3 Zimmerwohnung mit Balkon in Düsseldorf-Knittkuhl	74	40629	Am	51.2692	6.87435	1965
33720792	https://www.wohnungsboerse.net/immodetail/33720792	72	3	Geräumige 3-Zimmerwohnung in Düsseldorf mit Balkon	101	40595	Frankfurter	51.1442	6.89904	\N
33720865	https://www.wohnungsboerse.net/immodetail/33720865	68.99	3	3-Zimmer-Wohnung in Düsseldorf Garath wird saniert zum 15.01.2024	101	40595	Carl-von-Ossietzky-Straße	51.143	6.90269	1969
33720882	https://www.wohnungsboerse.net/immodetail/33720882	68	2	*** TOP NEU SANIERTE WOHNUNG inkl. EINBAUKÜCHE ***	13	40211	\N	51.2301	6.79288	1960
33720897	https://www.wohnungsboerse.net/immodetail/33720897	53	2	Tauschwohnung: Tausche 2 Zimmerwohnung Düsseldorf gegen Köln	21	40233	\N	51.2198	6.8119	\N
33720919	https://www.wohnungsboerse.net/immodetail/33720919	95	3	3-Zimmer-Wohnung mit Balkon in Düsseldorf-Unterbilk, Nähe Medienhafen	32	40219	Erftstraße	51.2141	6.75915	2000
33720931	https://www.wohnungsboerse.net/immodetail/33720931	73.68	2	2 Zimmer-Terrassenwohnung für Naturliebhaber in Düsseldorf-Unterbach	84	40627	\N	51.2024	6.88388	1983
33721077	https://www.wohnungsboerse.net/immodetail/33721077	94.5	4	4 Zimmer-Masionette-Wohnung in super Lage von Düsseltal mit Einbauküche	23	40239	Grunerstr.	51.2436	6.80229	1914
33722567	https://www.wohnungsboerse.net/immodetail/33722567	74	2	Nachmieter für gut gelegene 2-Zimmer-Wohnung mit Balkon und EBK in Düsseldorf Unterbilk	32	40217	\N	51.2127	6.7754	1971
33722674	https://www.wohnungsboerse.net/immodetail/33722674	100.69	3	Familien aufgepasst • Tolle, moderne 3 Zimmer Wohnung in Düsseldorf !	23	40237	Ivo	51.2372	6.81997	2012
33722757	https://www.wohnungsboerse.net/immodetail/33722757	62.1	2.5	Direkt am Hochschulcampus: 2,5 Zimmer in Derendorf mit Balkon und EBK	15	40476	Becherstr.	51.2455	6.79228	1954
33722774	https://www.wohnungsboerse.net/immodetail/33722774	53.63	2.5	Direkt am Hochschulcampus: 2,5 Zimmer in Derendorf mit Balkon und EBK	15	40476	Becherstr.	51.2455	6.79228	1954
33722913	https://www.wohnungsboerse.net/immodetail/33722913	71	3	3 Zimmerwohnung mit Balkon in Düsseldorf-Knittkuhl	74	40629	Am	51.2666	6.87174	1969
33723023	https://www.wohnungsboerse.net/immodetail/33723023	27	1	Apartment in Düsseldorf Oberbilk zu vermieten	37	40227	Heerstr	51.212	6.80889	\N
33723052	https://www.wohnungsboerse.net/immodetail/33723052	27	1	Hochwertig sanierte Wohnung zentral in Pempelfort!	14	40477	Tußmannstraße	51.2415	6.79251	1993
33724043	https://www.wohnungsboerse.net/immodetail/33724043	199	6	Df.-Zoo: Elegante 6-Raum-Wohnung mit hochwertiger Einbauküche und Ankleideschränken	23	40237	\N	51.2357	6.80917	2015
33724089	https://www.wohnungsboerse.net/immodetail/33724089	80	3	Freundliche 3-Zimmer-Wohnung mit Garten und EBK in Leverkusen	92	51379	Im	51.0621	7.00525	\N
33724139	https://www.wohnungsboerse.net/immodetail/33724139	91	3	Frisch renovierte Penthouse-Dachgeschosswohnung mit Einbauküche und Klimaanlage	14	40477	Tußmannstraße	51.2397	6.79339	1990
33724179	https://www.wohnungsboerse.net/immodetail/33724179	84	2.5	Pempelfort: Hochwertig kernsanierte Wohnung mit Einbauküche und Balkon in sehr beliebter Lage!	14	40477	\N	51.2385	6.78498	1956
33724203	https://www.wohnungsboerse.net/immodetail/33724203	80	3	Tolle 3-Zimmer-Wohnung im beliebten Grafental!	22	40235	\N	51.2294	6.82752	2017
33724294	https://www.wohnungsboerse.net/immodetail/33724294	43	2	Frisch sanierte Wohnung mit Balkon	36	40233	Kopernikustr.	51.2026	6.78006	1960
33724440	https://www.wohnungsboerse.net/immodetail/33724440	40	1	Modernisiertes Appartement in ruhiger Lage von Düsseldorf-Lörick!	43	40547	\N	51.2419	6.74772	1935
33724532	https://www.wohnungsboerse.net/immodetail/33724532	52	2	Tauschwohnung: 2 Zimmer Wohnung im Pempelfort	14	40477	\N	51.2385	6.78498	\N
33724540	https://www.wohnungsboerse.net/immodetail/33724540	67.89	3	3 Zimmerwohnung mit Balkon in Düsseldorf-Knittkuhl.	74	40629	Am	51.2683	6.87445	1965
33724736	https://www.wohnungsboerse.net/immodetail/33724736	56.56	2	Schöne 2-Zimmer-Wohnung mit Balkon in Düsseldorf Oberkassel	41	40545	Oberkasselder	51.2342	6.755	1962
33726319	https://www.wohnungsboerse.net/immodetail/33726319	37	1	Exklusive, geräumige 1-Zimmer-EG-Wohnung mit Einbauküche in Düsseldorf	36	40225	\N	51.1974	6.78988	\N
33726343	https://www.wohnungsboerse.net/immodetail/33726343	51	2	Objekt nicht gefunden	22	40235	Cranachstraße	51.2324	6.81275	1970
33726365	https://www.wohnungsboerse.net/immodetail/33726365	106	4	Modernisierte Wohnung mit vier Zimmern sowie Terrasse, Garten und EBK in Hilden	92	40724	\N	51.1771	6.95719	1979
33726412	https://www.wohnungsboerse.net/immodetail/33726412	88	3	Charmante 3-Zimmer Wohnung in D-Unterrath	62	40468	Kalkumer	51.264	6.77582	1954
33726435	https://www.wohnungsboerse.net/immodetail/33726435	37	1.5	1,5 Zimmer-Appartement in der Düsseldorfer Innenstadt	13	40210	\N	51.2225	6.78772	\N
33726445	https://www.wohnungsboerse.net/immodetail/33726445	45	2	Gemütliche 2-Zimmer-Dachgeschosswohnung mit Einbauküche in Düsseldorf	14	40479	Derendorferstr	51.2352	6.7899	\N
33726469	https://www.wohnungsboerse.net/immodetail/33726469	73	3	Gepflegte 3-Zimmer-Wohnung mit Balkon und Einbauküche in Düsseldorf	15	40476	\N	51.248	6.77902	\N
33726485	https://www.wohnungsboerse.net/immodetail/33726485	65	2	Ruhige 2-Zimmer Wohnung mit Holzdielen in zentraler Lage	31	40215	Hildebrandtstraße	51.2101	6.78377	\N
33726512	https://www.wohnungsboerse.net/immodetail/33726512	73	2.5	Tauschwohnung: 2,5-Zimmer Wohnung in Pempelfort	14	40477	\N	51.2385	6.78498	\N
33726557	https://www.wohnungsboerse.net/immodetail/33726557	65	3	Tauschwohnung: kleine wohnung in Berlin gegen 3Zimmer Wohnung in Düsseldorf	36	40225	\N	51.1974	6.78988	\N
33726682	https://www.wohnungsboerse.net/immodetail/33726682	82	3	Tauschwohnung: Schöne 3 Zimmer Altbauwohnung auf der Karolingerstr. in Bilk	36	40223	\N	51.1998	6.77225	\N
33726711	https://www.wohnungsboerse.net/immodetail/33726711	76	3	Tauschwohnung: 3 Zimmer Wohnung Angermund u	55	40489	\N	51.3305	6.76259	\N
33726737	https://www.wohnungsboerse.net/immodetail/33726737	57	2	Gemütliche 2-Zimmer-EG Wohnung mit kl. Terrasse und Garten - WG geeignet!	21	40233	Mettmanner	51.2238	6.80378	1965
33726747	https://www.wohnungsboerse.net/immodetail/33726747	29	2	Tauschwohnung: Tauschwohnung 29 qm gegen eine größere Wohnung min 50qm	32	40219	\N	51.2135	6.76234	\N
33726775	https://www.wohnungsboerse.net/immodetail/33726775	48	2	Wunderschöne Altbau Maisonette-Wohnung mit Blick auf den Rhein	41	40549	Drususstrasse	51.2313	6.73769	1903
33727613	https://www.wohnungsboerse.net/immodetail/33727613	88.5	3	***D´dorf-Holthausen, Nähe Park Elbroich,  Wohnen mit Ausblick! geräumige 3 Zi. + großer Balkon!***	93	40589	\N	51.1641	6.82144	1968
33727614	https://www.wohnungsboerse.net/immodetail/33727614	52	2	Gemütliche Gartenwohnung in optimal angebundener Neubausiedlung	95	40597	\N	51.1638	6.87102	2020
33727666	https://www.wohnungsboerse.net/immodetail/33727666	65	3	Charmante Altbauwohnung: Erstbezug nach Sanierung - Luxus-Einbauküche und Stilvollem Interieur	15	40476	Roßstraße	51.247	6.77838	1926
33727670	https://www.wohnungsboerse.net/immodetail/33727670	123	4	Dachgeschoss Maisonette Wohnung mit Kamin, Klimaanlage und Dachterrasse	72	40629	\N	51.255	6.88361	1918
33727709	https://www.wohnungsboerse.net/immodetail/33727709	85	3	Tauschwohnung: Tausche eine 3 Zimmer Wohnung gegen eine 2 Zimmer Wohnung	13	40212	\N	51.2236	6.78053	\N
33727767	https://www.wohnungsboerse.net/immodetail/33727767	90	2.5	Geräumige 2,5-Zimmer-Maisonette-Wohnung in Düsseldorf	71	40625	\N	51.2358	6.85232	\N
33727796	https://www.wohnungsboerse.net/immodetail/33727796	73	2	TRAUMWOHNUNG AM RHEIN-BENRATHER SCHLOßUFER-NEUE KÜCHE	96	40593	Benrather	51.1516	6.86167	1982
33727806	https://www.wohnungsboerse.net/immodetail/33727806	100	2	Tauschwohnung: Besondere, loftartige Maisonette-Wohnung in DUS gegen Köln	13	40210	\N	51.2225	6.78772	\N
33727914	https://www.wohnungsboerse.net/immodetail/33727914	70	3	Tauschwohnung: Tausche 70qm, 3Z+KDB, Altbau gg. kl. Wohnung Flingern-Nord	22	40235	\N	51.2294	6.82752	\N
33727930	https://www.wohnungsboerse.net/immodetail/33727930	75.96	3	47105/141 Gemütliche 3-Zi-Wohnung in Düsseldorf-Wittlaer	54	40489	Friederike-Fliedner-Weg	51.3158	6.75107	2000
33727984	https://www.wohnungsboerse.net/immodetail/33727984	43	1	Tauschwohnung: 1 Zimmer Wohnung mit Balkon gegen 2 Zimmer-Wohnung	14	40477	\N	51.2385	6.78498	\N
33728018	https://www.wohnungsboerse.net/immodetail/33728018	59	2	Exklusive 2-Zimmer-Wohnung mit Balkon und EBK in Düsseldorf	36	40223	Aachener	51.2009	6.77042	\N
33728020	https://www.wohnungsboerse.net/immodetail/33728020	57	2	Geschmackvolle Wohnung mit zwei Räumen und Einbauküche in Düsseldorf	37	40227	Industriestraße	51.2147	6.79515	\N
33728161	https://www.wohnungsboerse.net/immodetail/33728161	84	3	Helle & moderne 3 Zimmer Wohnung mit Balkon in D-Grafenberg!	72	40629	\N	51.255	6.88361	\N
33728224	https://www.wohnungsboerse.net/immodetail/33728224	64.85	3	Leben im schönen Düsseldorf-Unterrath	62	40468	Irenenstr.	51.2669	6.77774	1955
33729717	https://www.wohnungsboerse.net/immodetail/33729717	73	3	Helle, sanierte Altbauwohnung mit Balkon am Fuße des Grafenberger Waldes	72	40235	\N	51.2294	6.82752	\N
33729737	https://www.wohnungsboerse.net/immodetail/33729737	64	3	Schöne und helle 3-Zimmer-Wohnung in Düsseldorf-Bilk	36	40223	\N	51.1998	6.77225	1961
33729739	https://www.wohnungsboerse.net/immodetail/33729739	60	1	Möbliertes WG Zimmer (20m2) in 2 Zi WG (60m2)  im Zooviertel nahe Park am Hansaplatz	23	40239	Sybelstrasse	51.246	6.80386	1930
33729744	https://www.wohnungsboerse.net/immodetail/33729744	66.59	2	+++ Erstbezug! Top moderne 2-Z-Wohnung mit großzügigen Balkon, in Düsseldorf Rath +++	63	40472	Recklinghauser	51.265	6.81087	2018
33729783	https://www.wohnungsboerse.net/immodetail/33729783	35	1	1-Zimmerwohnung in Düsseldorf-Wittlaer zu vermieten	54	40489	\N	51.3305	6.76259	1973
33729811	https://www.wohnungsboerse.net/immodetail/33729811	55	3	Helle 3-Zimmer-Dachgeschosswohnung in Düsseldorf-Süd	98	40599	\N	51.1825	6.8657	2015
33729885	https://www.wohnungsboerse.net/immodetail/33729885	63	2	Exklusive, Teilmöblierte 2-Zimmerwohnung auf der Toulouser Allee im Pandion D´Or!	23	40211	Toulouser	51.2358	6.79645	2014
33729894	https://www.wohnungsboerse.net/immodetail/33729894	80	2.5	Stilvolle, renovierte voll möblierte 2,5-Zimmer-DG-Wohnung mit EBK in Düsseldorf	31	40217	\N	51.2127	6.7754	1900
33729935	https://www.wohnungsboerse.net/immodetail/33729935	66	2	Bilk: 2-Zimmer-Dachgeschosswohnung mit Sonnenbalkon	36	40223	Fleher	51.2014	6.76502	1999
33729947	https://www.wohnungsboerse.net/immodetail/33729947	60	3	Objekt nicht gefunden	36	40223	\N	51.1998	6.77225	1903
33730009	https://www.wohnungsboerse.net/immodetail/33730009	90	3	Gudastraße, 40625 Düsseldorf	71	40625	\N	51.2358	6.85232	\N
33730022	https://www.wohnungsboerse.net/immodetail/33730022	170	4	***IM HERZEN VON DÜSSELTAL - VOLL AUSGESTATTETE  LUXUS WOHNUNG***	23	40237	Goethestr.	51.2333	6.80578	1905
33730099	https://www.wohnungsboerse.net/immodetail/33730099	115.3	2	N7 - Pempelforter Loft-Style	14	40477	Nettelbeckstraße	51.2367	6.78363	1962
33731005	https://www.wohnungsboerse.net/immodetail/33731005	51	2	Wow! Erstbezug, exklusiv ausgestattet und all-inklusive in Düsseltal!	23	40237	Herderstraße	51.2349	6.79842	1953
33731016	https://www.wohnungsboerse.net/immodetail/33731016	48.14	2	Premium Wohnen: Teilmöbliertes Apartment mit 2 Zimmern in Alt-Oberkassel!	41	40545	Cimbernstraße	51.2286	6.75771	2015
33731028	https://www.wohnungsboerse.net/immodetail/33731028	16	1	Zimmer in einer 6er WG in Derendorf	15	40468	Ulmenstraße	51.256	6.78023	1975
33731040	https://www.wohnungsboerse.net/immodetail/33731040	40	2	*SANIERTES 2-Zi. Apartment in zweiter Rheinlage von Oberkassel	41	40545	Brend´amourstraße	51.2307	6.7613	\N
33731188	https://www.wohnungsboerse.net/immodetail/33731188	74	2	Tauschwohnung: 2Z Düsseldorf gegen 1-2Z in Köln.	81	40231	\N	51.2135	6.83024	\N
33731225	https://www.wohnungsboerse.net/immodetail/33731225	67	2	**SONNENDURCHFLUTETE 2 ZIMMER-WOHNUNG MIT S/W BALKON & SCHÖNEM ERKER** ERSTBEZUG N. SANIERUNG**	31	40215	Kirchfeldstraße	51.2123	6.78401	1958
33731246	https://www.wohnungsboerse.net/immodetail/33731246	86	2.5	Tauschwohnung: Helle offene DG Wohnung ohne Schrägen	93	40589	\N	51.1641	6.82144	\N
33731275	https://www.wohnungsboerse.net/immodetail/33731275	32.71	1	Frisch modernisierte 1 Zimmer Wohnung mit großem eigenem Garten	62	40468	Unterrather	51.2745	6.78794	1957
33731362	https://www.wohnungsboerse.net/immodetail/33731362	83	3	Tauschwohnung: 3,5ZKDB Düsseldorf und Suche 2ZKDB in Düsseldorf oder Köln	62	40472	\N	51.2685	6.83379	\N
33731420	https://www.wohnungsboerse.net/immodetail/33731420	57.15	2	Düsseldorf-Oberbilk, schöne 2-Zi.-Wohnung zu vermieten!	37	40227	Eisenstraße	51.2169	6.80115	1950
33731462	https://www.wohnungsboerse.net/immodetail/33731462	95	2.5	Tauschwohnung: große 2,5 Zimmer 95 qm/2 Wohnung, im Tausch gegen 60 qm/2	64	40470	\N	51.2569	6.80771	\N
33731498	https://www.wohnungsboerse.net/immodetail/33731498	51.88	2	2-Zimmer-Wohnung in Düsseldorf	42	40549	Romy-Schneider-Str.	51.2412	6.71262	2019
33731510	https://www.wohnungsboerse.net/immodetail/33731510	70	3	Hallo hier bin ich...."Dreiraum - Fairmietung"	71	40625	Quadenhofstraße	51.2273	6.86506	1952
33731545	https://www.wohnungsboerse.net/immodetail/33731545	82	2	Singles und Paare aufgepasst! Wunderschöne 2-Zimmer-Wohnung in Düsseldorf	73	40629	Am	51.2453	6.85029	2009
33731588	https://www.wohnungsboerse.net/immodetail/33731588	76.25	3	3 Raum Wohnung preisgedämpft. Mit Balkon und Super Ausblick zum Hanielpark.	23	40237	Grafenberger	51.2342	6.81641	2022
33731589	https://www.wohnungsboerse.net/immodetail/33731589	61.32	2	Preisgedämpfte 2-Zimmer-Wohnung im Sohnemann am Hanielpark. Erstbezug. Balkon	23	40237	Grafenberger	51.2342	6.81641	2022
33731602	https://www.wohnungsboerse.net/immodetail/33731602	99	3	Krefeld - Nähe Bismarckviertel, grosszügiges Penthouse, Aufzug, 3 Balkone, inkl. Einbauküche	92	47799	\N	51.3386	6.57543	1975
33731607	https://www.wohnungsboerse.net/immodetail/33731607	60	3	Erdgeschosswohnung mit kleinem Garten	92	41542	Im	51.1281	6.7845	1955
33733230	https://www.wohnungsboerse.net/immodetail/33733230	34	1	Ruhige 1 Zimmer Whg direkt am Park	98	40599	\N	51.1825	6.8657	\N
33733242	https://www.wohnungsboerse.net/immodetail/33733242	52	2	2-Zimmer-Wohnung mit Balkon und EBK in Düsseldorf	31	40215	\N	51.2149	6.78256	\N
33733258	https://www.wohnungsboerse.net/immodetail/33733258	50	2	Exklusive 2-Zimmer-DG-Wohnung mit Einbauküche in Düsseldorf	44	40547	\N	51.2419	6.74772	\N
33733301	https://www.wohnungsboerse.net/immodetail/33733301	38	1	Gemütliche (teilmöblierte) 1-Zimmer-Wohnung mit Balkon und Einbauküche im Zentrum von Düsseldorf	13	40210	Oststraße	51.2218	6.78595	\N
33733307	https://www.wohnungsboerse.net/immodetail/33733307	32	2	Teilmöblierte Altbauwohnung in Düsseldorf Flingern	21	40233	Krahestraße	51.2252	6.8014	1902
33733317	https://www.wohnungsboerse.net/immodetail/33733317	70	2	Erstbezug nach Sanierung mit EBK und Balkon: 2,5-Zimmer-Wohnung in Düsseldorf	15	40476	Münsterstraße	51.2452	6.78854	\N
33733341	https://www.wohnungsboerse.net/immodetail/33733341	82	1.5	Heute anrufen (Call today!) Große Chance. 3 Monate Untermiete (Feb-Mai). ENGLISH Speakers welcome.	36	40223	Merowingerstraße	51.2069	6.77735	\N
33733342	https://www.wohnungsboerse.net/immodetail/33733342	85	3	Lichtdurchflutete 3 Zimmer Wohnung im Herzen Düsseldorfs	14	40477	Kaiserswerther	51.24	6.77636	\N
33733379	https://www.wohnungsboerse.net/immodetail/33733379	50	2.5	Tauschwohnung: Tausche kleinere gegen größere Altbauwohnung in Flingern	22	40233	\N	51.2198	6.8119	\N
33733420	https://www.wohnungsboerse.net/immodetail/33733420	85	3	Tauschwohnung: Tausche 3 Zimmer Traumwohnung gegen Haus	36	40225	\N	51.1974	6.78988	\N
33733496	https://www.wohnungsboerse.net/immodetail/33733496	150	4.5	BEFRISTETvon 02.01.24 - 31.03.24: Vollmöbliertes Hinterhofhaus in Friedrichstadt	32	40217	Friedrichstraße	51.208	6.77703	1955
33733540	https://www.wohnungsboerse.net/immodetail/33733540	50	1	Tauschwohnung: Wunderschöne Maisonette Wohnung	22	40235	\N	51.2294	6.82752	\N
33733573	https://www.wohnungsboerse.net/immodetail/33733573	65	2	Tauschwohnung: Schöne, helle 2 Zimmer Altbau Wohnung mit Sonnenbalkon	36	40223	\N	51.1998	6.77225	\N
33733664	https://www.wohnungsboerse.net/immodetail/33733664	56	2	Erstbezug nach Sanierung: freundliche 2-Zimmer-Wohnung mit gehobener Innenausstattung in Düsseldorf	63	40472	Westfalenstraße	51.2632	6.81855	1967
33733671	https://www.wohnungsboerse.net/immodetail/33733671	33	1	1 Zimmer Apartment in Unterbilk nahe Uni mit Pantryküche	36	40223	Suitbertusstr.	51.2062	6.76701	\N
33733794	https://www.wohnungsboerse.net/immodetail/33733794	35	1	1-Zimmer-Wohnung in Düsseldorf (Flingern) mit EBK	22	40233	Birkenstraße	51.2271	6.80655	\N
33734491	https://www.wohnungsboerse.net/immodetail/33734491	45	1	Sanierte 1-Zimmer-Wohnung mit Balkon und EBK in Düsseldorf- Lörick	43	40547	Emanuel-Leutze-Straße	51.2432	6.74057	\N
33734507	https://www.wohnungsboerse.net/immodetail/33734507	83.32	3	* Einzigartiges Wohngefühl * Moderne 3-Zimmer DG-Wohnung mit EBK ohne Aufzug!	14	40479	Franklinstraße	51.2358	6.79045	1952
33734508	https://www.wohnungsboerse.net/immodetail/33734508	52.5	2	Sonnige Dachterrassenwohnung mit Lift und Küche!	31	40215	Bilker	51.2104	6.78025	1955
33734541	https://www.wohnungsboerse.net/immodetail/33734541	40	1	Gemütliche 1 Zimmer - Altbauwohnung mit zwei Balkonen und EBK in Pempelfort zum 01.02.2024	14	40479	Prinz-	51.2339	6.78723	\N
33734557	https://www.wohnungsboerse.net/immodetail/33734557	42	2	Gemütliche 2 Zimmer Dachgeschoss Wohnung mit sehr großer Dachterrasse	14	40477	\N	51.2385	6.78498	\N
33734582	https://www.wohnungsboerse.net/immodetail/33734582	70	3	Tauschwohnung: Schöne 3 Zimmer Wohnung mit Balkon in Friedrichstadt/Bilk	31	40215	\N	51.2149	6.78256	\N
33734709	https://www.wohnungsboerse.net/immodetail/33734709	58	2	Tauschwohnung: Ich, 30, w, ledig suche nach einem neuen Zuhause	32	40219	\N	51.2135	6.76234	\N
33734804	https://www.wohnungsboerse.net/immodetail/33734804	59.71	2	Erstbezug! Wohlfühloase inkl. Einbauküche	13	40211	Klosterstraße	51.2241	6.78812	2020
33734830	https://www.wohnungsboerse.net/immodetail/33734830	50	2	Tauschwohnung: Suche 3 Zimmer /biete 2 ZimmerWohnung saniert mit Balkon	62	40468	\N	51.2612	6.7789	\N
33734885	https://www.wohnungsboerse.net/immodetail/33734885	75	2	Tauschwohnung: Biete Düsseldorf, suche Berlin	14	40211	\N	51.2301	6.79288	\N
33735057	https://www.wohnungsboerse.net/immodetail/33735057	46	2	Nett geschnittene 2-Zimmerwohnung in Unterbilk	92	40219	Friedenstrasse	51.2139	6.7691	1960
33735060	https://www.wohnungsboerse.net/immodetail/33735060	93	3	Nippes, helle 3 Zimmer-Altbauwohnung Nähe Leipziger Platz	92	50733	\N	50.9648	6.95382	\N
33735063	https://www.wohnungsboerse.net/immodetail/33735063	56	2	ELB-Südstadt top-gepflegte 2 Zimmer-Wohnung zwischen Universität und Bahnhof	92	42119	Platanenstraße	51.2518	7.15477	1956
33735068	https://www.wohnungsboerse.net/immodetail/33735068	55	2	2 Zimmer Whg. mit Balkon & Einbauküche Rheinnähe in Neuss Üdesheim	92	41468	Macherscheider	51.1636	6.7881	2000
33735070	https://www.wohnungsboerse.net/immodetail/33735070	90	3	hochwertige Wohnung über 2 Etagen mit Balkon im 2 Familienhaus mit Einbauküche	95	40597	Am	51.1688	6.88253	1910
33735084	https://www.wohnungsboerse.net/immodetail/33735084	30	1	Schönes Appartement im Stadtzentrum von Haan	92	42781	Diekerstr.	51.1939	7.01144	1900
33736436	https://www.wohnungsboerse.net/immodetail/33736436	25	1	Exklusive, vollständig renovierte 1-Zimmer-DG-Wohnung in Düsseldorf	31	40215	Phillip	51.2107	6.78559	\N
33736481	https://www.wohnungsboerse.net/immodetail/33736481	27	1	Nachmieter für geräumige 1-Zimmer-Wohnung in Düsseldorf Wittlaer gesucht	54	40489	Kalkstraße	51.3233	6.74209	\N
33736517	https://www.wohnungsboerse.net/immodetail/33736517	45	2	Stilvolle möblierte 2-Zimmer-Wohnung mit Balkon und Einbauküche in Düsseldorf	62	40468	\N	51.2612	6.7789	\N
33736551	https://www.wohnungsboerse.net/immodetail/33736551	57	1	Tauschwohnung: Helle Wohnung in Düsseldorf-Carlstadt gegen Kölner Wohnung	12	40213	\N	51.2221	6.77271	\N
33736634	https://www.wohnungsboerse.net/immodetail/33736634	40	1.5	Tauschwohnung: Superschöne Single oder Pärchenwohnung	32	40219	\N	51.2135	6.76234	\N
33736648	https://www.wohnungsboerse.net/immodetail/33736648	80	3	HELLE 3-ZIMMER-WOHNUNG IM ZOOVIERTEL	23	40237	\N	51.2357	6.80917	1956
33736668	https://www.wohnungsboerse.net/immodetail/33736668	211	3	Perle im Innenhof -  DDH mit Bürohaus für Paare oder Familien mit max. 1 Kind	23	40237	Humboltstraße	51.2343	6.80153	\N
33736740	https://www.wohnungsboerse.net/immodetail/33736740	50	2	Tauschwohnung: 2 Zimmerwohnung am Hafen	32	40219	\N	51.2135	6.76234	\N
33736800	https://www.wohnungsboerse.net/immodetail/33736800	40	1	Premium Apartment, High class möbliert, Ddorf. - Golzheim	16	40474	\N	51.2738	6.74219	\N
33736981	https://www.wohnungsboerse.net/immodetail/33736981	35	1	Sonniges Apartment, ruhig und vollmöbliert. Südwestbalkon, schöne Aussicht, WLAN	63	40472	Oberrather	51.2667	6.82665	1994
33737744	https://www.wohnungsboerse.net/immodetail/33737744	80.54	3	3 Zimmer Wohnung in zentraler Lage von Düsseldorf	22	40233	\N	51.2198	6.8119	\N
33737770	https://www.wohnungsboerse.net/immodetail/33737770	65	2	Nachmieter für Neubau in Gladbeck gesucht.	92	45966	\N	51.5877	6.96648	\N
33737803	https://www.wohnungsboerse.net/immodetail/33737803	69	2	Zwischenmiete Altbauwohnung in Unterbilk	32	40219	Friedenstrasse	51.2121	6.76739	\N
33737818	https://www.wohnungsboerse.net/immodetail/33737818	78	2	Wunderschöne Wohnung mit Ausblick auf den Rheinturm in Unterbilk	32	40217	\N	51.2127	6.7754	\N
33737866	https://www.wohnungsboerse.net/immodetail/33737866	45	2	Tauschwohnung: Suche schönes Zuhause in Münster, biete tolle Wohnung in DUS	15	40476	\N	51.248	6.77902	\N
33737902	https://www.wohnungsboerse.net/immodetail/33737902	88	4	Wohnung mit 2 Schlafzimmern, großer Wohn-/Essbereich, 2 Balkone, Einbauküche, hohe Decken in Heerdt	42	40549	Heerdter	51.2318	6.71587	1910
33737923	https://www.wohnungsboerse.net/immodetail/33737923	35	1.5	Scandinavian Style, edel möbliertes Apartment in der Unternehmerstadt in Derendorf, nähe Deloitte	15	40476	Merzigerstrasse	51.251	6.7875	\N
33737938	https://www.wohnungsboerse.net/immodetail/33737938	79	3	Tauschwohnung: 3 Zimmer Wohnung Oberbilk	37	40227	\N	51.2154	6.79757	\N
33738004	https://www.wohnungsboerse.net/immodetail/33738004	65	2.5	Tauschwohnung: Große 2,5 Zimmer Wohnung in Oberbilk mit Balkon	37	40227	\N	51.2154	6.79757	\N
33738195	https://www.wohnungsboerse.net/immodetail/33738195	59	2	Luxus-Neubauwohnung der Extraklasse mit moderner Einbauküche und Tiefgarage in Bestlage	16	40476	\N	51.248	6.77902	\N
33738247	https://www.wohnungsboerse.net/immodetail/33738247	62.53	2	Gepflegte und helle 2-Raum-Dachgeschosswohnung mit 2 Balkonen und Einbauküche inDüsseldorf Unterrath	62	40468	Saargemünder	51.2716	6.76973	2007
33740097	https://www.wohnungsboerse.net/immodetail/33740097	106	3	Stilvolle, geräumige und modernisierte 3-Zimmer-Wohnung mit Balkon und EBK in Düsseldorf	53	40489	\N	51.3305	6.76259	1976
33740129	https://www.wohnungsboerse.net/immodetail/33740129	98	3	Geschmackvolle 3-Raum-Maisonette-Wohnung mit Balkon und Einbauküche in Düsseldorf	53	40489	Arnheimerstrasse	51.304	6.74092	\N
33740136	https://www.wohnungsboerse.net/immodetail/33740136	75	2	Geschmackvolle und geräumige Wohnung mit zwei Zimmern sowie 2 Balkonen und Einbauküche	41	40547	\N	51.2419	6.74772	1971
33740151	https://www.wohnungsboerse.net/immodetail/33740151	61	3	Erstbezug nach Sanierung - 3-Zimmer-Wohnung mit Süd-Balkon	63	40472	\N	51.2685	6.83379	1956
33740210	https://www.wohnungsboerse.net/immodetail/33740210	56	2	2- Zimmer Wohnung, Düsseldorf-Bilk, Uninähe	36	40225	\N	51.1974	6.78988	1965
33740265	https://www.wohnungsboerse.net/immodetail/33740265	45	2	Tauschwohnung: Tausch 2 gegen 3 (DD-Köln oder DD-DD)	15	40476	\N	51.248	6.77902	\N
33740543	https://www.wohnungsboerse.net/immodetail/33740543	42	1	1. NKM frei!!! Sonnige 1-Zimmer-Wohnung für SINGLE ODER PÄRCHEN!! ENGLISH scroll down!	91	40589	Kölner	51.1806	6.82779	1970
33740565	https://www.wohnungsboerse.net/immodetail/33740565	120	3	Tauschwohnung: Tausche Top-Altbau-Wohnung gegen ähnliches in kleiner	23	40239	\N	51.2453	6.80322	\N
33740616	https://www.wohnungsboerse.net/immodetail/33740616	38	1	Tauschwohnung: Tausche 1-Zimmer Wohnung gegen 2-Zimmer Wohnung! :)	13	40211	\N	51.2301	6.79288	\N
33741354	https://www.wohnungsboerse.net/immodetail/33741354	63	2	Geschmackvolle Wohnung mit zwei Zimmern in Düsseldorf	41	40545	Barmer	51.2299	6.74673	\N
33741410	https://www.wohnungsboerse.net/immodetail/33741410	67.5	2	Helle, moderne und teilmöblierte 2-Zimmer-Wohnung in den Heinrich Heine Gärten	42	40549	\N	51.2331	6.71909	\N
33741463	https://www.wohnungsboerse.net/immodetail/33741463	39.24	1	Glücklich Wohnen in Düsseldorf inkl. EBK und Balkon	36	40223	Burghofstraße	51.2072	6.76922	1955
33741544	https://www.wohnungsboerse.net/immodetail/33741544	79	2	Tauschwohnung: Wunderschöne Wohnung in Kaiserswerth	53	40489	\N	51.3305	6.76259	\N
33741574	https://www.wohnungsboerse.net/immodetail/33741574	130	5	Absolute Rarität! 5 Zimmer Maisonette-Wohnung mit 2 Balkonen!	71	40625	Pfeifferstr.	51.2372	6.84836	1968
33741589	https://www.wohnungsboerse.net/immodetail/33741589	89	3	VOLLSTÄNDIG RENOVIERTE 3 ZIMMER WOHNUNG MIT GROßEM BALKON, PARKETT, LAMINAT	82	40229	Karlsruher	51.198	6.83857	1961
33741668	https://www.wohnungsboerse.net/immodetail/33741668	123	4	Tauschwohnung: Schöne 4 Zimmerwohnung mit Garten, suche 3 Zimmer mit Balkon	36	40221	\N	51.1997	6.75072	\N
33741743	https://www.wohnungsboerse.net/immodetail/33741743	70	2	OFFENE BESICHTIGUNG AM 16.12.2023 VON 14:30 - 15:30 UHR!!!!	72	40629	Hardtstraße	51.2409	6.82947	\N
33743583	https://www.wohnungsboerse.net/immodetail/33743583	58	2	Hier möchten Sie sofort einziehen! Kernsanierter Altbau trifft moderne Architektur.	22	40223	Dorotheenstraße	51.23	6.80946	1908
33743602	https://www.wohnungsboerse.net/immodetail/33743602	64	3	Tauschwohnung: Schöne Wohnung nahe Lorettostr, Medienhafen und Rhein	32	40217	\N	51.2127	6.7754	\N
33743617	https://www.wohnungsboerse.net/immodetail/33743617	82	3	Toulouser Allee - Lichtdurchflutete Wohnung mit Fernblick	14	40211	\N	51.2301	6.79288	2016
33743724	https://www.wohnungsboerse.net/immodetail/33743724	60	2	Tauschwohnung: Tausche 2 Zimmer in DUS gegen größere Wohnung in Düsseldorf	31	40215	\N	51.2149	6.78256	\N
33743791	https://www.wohnungsboerse.net/immodetail/33743791	76	3	Neu saniert! Helle 3 Zi. Whg, großer Balkon und Garage. Wersten	91	40591	Kölner	51.1869	6.81876	1960
33743859	https://www.wohnungsboerse.net/immodetail/33743859	45	2	***COOLE  2-ZIMMERWOHNUNG***MIT KLEINER PENTRYKÜCHE, BALKON UND SCHÖNEN WÄNDEN. FÜR SINGLES***	72	40629	\N	51.255	6.88361	1930
33744110	https://www.wohnungsboerse.net/immodetail/33744110	120	4	Erstbezug mit Balkon: exklusive 4-Zimmer-Maisonette-Wohnung in Düsseldorf	55	40489	\N	51.3305	6.76259	2021
33744144	https://www.wohnungsboerse.net/immodetail/33744144	62	3	Gemütliche 3-Zi.-Whg. mit Balkon	64	40470	Mörsenbroicher	51.2515	6.80498	1953
33744149	https://www.wohnungsboerse.net/immodetail/33744149	64.14	3	Erstbezug nach Sanierung! 3-Zi.-Whg. mit Balkon!	64	40470	Mörsenbroicher	51.2518	6.80471	1953
33745592	https://www.wohnungsboerse.net/immodetail/33745592	60	2	Neuwertige 2-Raum-Wohnung mit Balkon und Einbauküche in Düsseldorf	71	40625	Radeberger	51.2289	6.84808	2019
33745613	https://www.wohnungsboerse.net/immodetail/33745613	144	3	Außergewöhnliche neu sanierte Gartengeschoss-Wohnung in schönster Lage - Niederkassel nahe Seestern	44	40547	\N	51.2419	6.74772	\N
33745623	https://www.wohnungsboerse.net/immodetail/33745623	74	3.5	Tauschwohnung: Schöner Neubau mitten in Düsseldorf	37	40227	\N	51.2154	6.79757	\N
33745648	https://www.wohnungsboerse.net/immodetail/33745648	91.4	3	EXKLUSIVE TERRASSENWHG. MODERN+HELL 2 BÄDER EINBAUKÜCHE MÖGLICH PARKETT TG-STELLPLATZ GOLZHEIM IM EG	16	40476	Hans-Böckler-Straße	51.2467	6.77646	1998
33745681	https://www.wohnungsboerse.net/immodetail/33745681	51	1.5	Tauschwohnung: Moderne Altbauwohnung mit perfektem Schnitt und Balkon	31	40215	\N	51.2149	6.78256	\N
33745708	https://www.wohnungsboerse.net/immodetail/33745708	78	2	Luxuriöse vollmöblierte 2-Zimmer-Gartenwohnung in Rheinnähe	42	40549	Brunhildenstr.	51.2291	6.72144	1997
33745750	https://www.wohnungsboerse.net/immodetail/33745750	64	1.5	Helles Dachgeschosstudio ab 1.03.2024 zu vermieten!	15	40468	Schimmelbuschstraße	51.2574	6.78383	1938
33745768	https://www.wohnungsboerse.net/immodetail/33745768	100	3	Tauschwohnung: Weitläufige 3-Zimmer Altbau-Wohnung mit Terrasse	13	40211	\N	51.2301	6.79288	\N
33745789	https://www.wohnungsboerse.net/immodetail/33745789	44.5	1	1 Zimmerwohnung mit Einbauküche in Düsseldorf Pempelfort zu vermieten.	14	40211	\N	51.2301	6.79288	1954
33745807	https://www.wohnungsboerse.net/immodetail/33745807	41.33	1.5	Gemütliche 1,5 Zimmer Wohnung in Rheinnähe	38	40221	\N	51.1997	6.75072	1979
33745851	https://www.wohnungsboerse.net/immodetail/33745851	85	3	Tauschwohnung: Wunderschöne Altbauwohnung mit Balkon in Flingern-Nord	22	40235	\N	51.2294	6.82752	\N
33745983	https://www.wohnungsboerse.net/immodetail/33745983	65.32	2	Exklusive 2-Zimmer-Wohnung im Herzen der Stadt	11	40213	\N	51.2221	6.77271	2017
33747792	https://www.wohnungsboerse.net/immodetail/33747792	68	2	Tauschwohnung: 2-Zimmer Wohnung in Gerresheim	71	40625	\N	51.2358	6.85232	\N
33747819	https://www.wohnungsboerse.net/immodetail/33747819	75	2	Tauschwohnung: Heller Altbau Unterbilk mit Erker	32	40219	\N	51.2135	6.76234	\N
33747839	https://www.wohnungsboerse.net/immodetail/33747839	95	3	Traumhafte 3 Zimmer-Wohnung in Bestlage am Hofgarten	15	40476	\N	51.248	6.77902	1987
33747869	https://www.wohnungsboerse.net/immodetail/33747869	33	1	Tauschwohnung: Zentrale Düsseldorfer Wohnung mit Schlafzimmer und Wohnküche	31	40215	\N	51.2149	6.78256	\N
33747906	https://www.wohnungsboerse.net/immodetail/33747906	50	1.5	Tauschwohnung: Zentrale Lage Düsseldorf gegen Stuttgart	31	40215	\N	51.2149	6.78256	\N
33747934	https://www.wohnungsboerse.net/immodetail/33747934	54	2.5	Von Privat: Helle Wohnung (2,5 Zimmer, 54 qm) mit Balkon in zentraler Lage zum Hbf.	37	40227	Höhenstraße	51.2149	6.79767	1994
33747964	https://www.wohnungsboerse.net/immodetail/33747964	75	2	Tauschwohnung: Neu sanierte Wochnung mit hohe Decken und schönem Stuck	64	40470	\N	51.2569	6.80771	\N
33748572	https://www.wohnungsboerse.net/immodetail/33748572	55	2	Modernisierte Wohnung mit zweieinhalb Zimmern und Einbauküche in Düsseldorf	37	40227	Markenstraße	51.2114	6.80941	\N
33748641	https://www.wohnungsboerse.net/immodetail/33748641	30	1	Tauschwohnung: Tausche zentrale 1 Zimmer Wohnung in Friedrichstadt gegen	31	40215	\N	51.2149	6.78256	\N
33748682	https://www.wohnungsboerse.net/immodetail/33748682	68	2	Tauschwohnung: Wunderschöne Altbauwohnung Flingern	22	40235	\N	51.2294	6.82752	\N
33748722	https://www.wohnungsboerse.net/immodetail/33748722	67	2	Tauschwohnung: Tausche wunderschöne 2-Z-Whg mit in Düsseltal gegen größere	23	40239	\N	51.2453	6.80322	\N
33748757	https://www.wohnungsboerse.net/immodetail/33748757	58	2	Tauschwohnung: Suche 2 Zimmer in Berlin - biete 2-Zimmer  in Flingern Nord	22	40235	\N	51.2294	6.82752	\N
33748889	https://www.wohnungsboerse.net/immodetail/33748889	60	2	Helle 2-Zimmer-Wohnung mit Sonnenbalkon direkt am Hermannsplatz	22	40233	\N	51.2198	6.8119	\N
33749588	https://www.wohnungsboerse.net/immodetail/33749588	30	1	Tauschwohnung: Wunderschöne Wohnung im Herzen Düsseldorfs abzugeben!	11	40213	\N	51.2221	6.77271	\N
33749666	https://www.wohnungsboerse.net/immodetail/33749666	44	2	Tauschwohnung: Singlewohnung zum Tausch in Bilk	36	40223	\N	51.1998	6.77225	\N
33749699	https://www.wohnungsboerse.net/immodetail/33749699	65	2	Tauschwohnung: Helle moderne Zweizimmerwohnung mit großem Südbalkon	15	40476	\N	51.248	6.77902	\N
33750319	https://www.wohnungsboerse.net/immodetail/33750319	70	3	Schöne Wohnung im 1. Obergeschoss (Golzheim, 3 Etagen) mit Balkon zum Garten	16	40474	\N	51.2738	6.74219	1951
33750336	https://www.wohnungsboerse.net/immodetail/33750336	50	2	Tauschwohnung:  Düsseldorf Altbau gegen Köln	36	40223	\N	51.1998	6.77225	\N
33750361	https://www.wohnungsboerse.net/immodetail/33750361	35	1	Tauschwohnung: Schöne 1 Zimmerwohnung mit Dachterrasse	13	40210	\N	51.2225	6.78772	\N
33750384	https://www.wohnungsboerse.net/immodetail/33750384	61	2	Tauschwohnung: 2- Zimmer + Balkon in Toplage in Unterbilk	32	40219	\N	51.2135	6.76234	\N
33750404	https://www.wohnungsboerse.net/immodetail/33750404	55	2	Sanierte 2 Zimmerwohnung inklusive Einbauküche!	81	40231	Tulpenweg	51.2146	6.8299	\N
33750410	https://www.wohnungsboerse.net/immodetail/33750410	80	3	Schöne 3-Zimmer-Wohnung im Herzen von Düsseldorf!	22	40235	Hoffeld	51.2289	6.81459	\N
33750419	https://www.wohnungsboerse.net/immodetail/33750419	36	1.5	Tauschwohnung: Schöne 1,5 Zimmer Wohnung in Pempelfort	14	40479	\N	51.2333	6.78371	\N
33750476	https://www.wohnungsboerse.net/immodetail/33750476	50	1	Wunderschönes gemütliches helles Appartement in Rheinnähe und Uninähe	34	40221	Hinter	51.2026	6.73873	1962
33751314	https://www.wohnungsboerse.net/immodetail/33751314	75	3	75 m² Altbau-Wohnung im skandinavischen Stil	37	40227	Kirchstraße	51.2133	6.80323	\N
33751360	https://www.wohnungsboerse.net/immodetail/33751360	113	3	CHARMANTE WOHNUNG IN KAISERSWERTH, DÜSSELDORF	53	40489	Im	51.297	6.73972	\N
33751413	https://www.wohnungsboerse.net/immodetail/33751413	58.6	3	Kleine 3-Zimmer-Wohnung - saniert und vermietungsbereit ab 29.April 2024	98	40599	Zoppoter	51.1725	6.87231	1956
33751414	https://www.wohnungsboerse.net/immodetail/33751414	41	1	Single-Wohnung in Oberbilk ab 29.04.2024	37	40227	Kruppstr.	51.214	6.7995	1960
33751418	https://www.wohnungsboerse.net/immodetail/33751418	59	2	Tauschwohnung: Patchwork-Family tauscht 2-Zi Düsseltal gegen 3Zi Gerresheim	23	40239	\N	51.2453	6.80322	\N
33751468	https://www.wohnungsboerse.net/immodetail/33751468	53	2	Tauschwohnung: Ich tausche schöne 2 Zimmerwohnung gegen 3 Zimmer	36	40225	\N	51.1974	6.78988	\N
33751485	https://www.wohnungsboerse.net/immodetail/33751485	100	3	Exklusive 3-Zimmer-Maisonette-Wohnung mit Loftcharakter	64	40470	Wenkerstr.	51.2494	6.81728	1980
33751515	https://www.wohnungsboerse.net/immodetail/33751515	30	2	Tauschwohnung: Suche Münster, biete Düsseldorf DG mit EBK	37	40227	\N	51.2154	6.79757	\N
33751540	https://www.wohnungsboerse.net/immodetail/33751540	52	2	Schöne 2-Raum-Maisonette-Wohnung mit Balkon und Einbauküche in Wersten	91	40591	Am	51.1912	6.81443	1997
33751930	https://www.wohnungsboerse.net/immodetail/33751930	27	1	Möbliertes Appartement nahe FH-Campus in Düsseldorf-Derendorf	15	40476	\N	51.248	6.77902	\N
33752018	https://www.wohnungsboerse.net/immodetail/33752018	64.5	2	Stilvolle, sanierte 2-Zimmer-Hochparterre-Wohnung mit Einbauküche in Düsseldorf	15	40476	Füsilierstrasse	51.2505	6.7803	\N
33752594	https://www.wohnungsboerse.net/immodetail/33752594	57	2	Tauschwohnung: 2-Zimmer Altbauwohnung in Flingern	22	40235	\N	51.2294	6.82752	\N
33752618	https://www.wohnungsboerse.net/immodetail/33752618	98	3	Schön aufgeteilte und helle Wohnung in zentraler Lage und Rheinnähe	42	40549	Hymgasse	51.2317	6.72238	1970
33752651	https://www.wohnungsboerse.net/immodetail/33752651	74	3	*Kernsaniert* Tolle 3- Zimmer Wohnung mitten in Oberbilk	37	40227	Markenstr.	51.2118	6.80933	1910
33752684	https://www.wohnungsboerse.net/immodetail/33752684	91	3	Gepflegte 3-Raum-Wohnung mit Balkon und Einbauküche in Düsseldorf	14	40479	Feldstrasse	51.2341	6.78065	1952
33753077	https://www.wohnungsboerse.net/immodetail/33753077	77	3	Erstbezug einer modernen kernsanierten 3 Zimmer Erdgeschoss-Wohnung in Oberkassel	44	40547	\N	51.2419	6.74772	1952
33753091	https://www.wohnungsboerse.net/immodetail/33753091	21.11	1	Geschmackvolles 1-Zimmer-Apartment - möbliert mit Balkon und EBK in Düsseldorf	13	40210	Konrad-Adenauer-Platz	51.2206	6.79156	\N
33753148	https://www.wohnungsboerse.net/immodetail/33753148	68	3	In Düsseldorf: Frisch sanierte Wohnung mit drei Zimmern und Balkon in Düsseltal	23	40239	Lacombletstraße	51.2476	6.79758	1957
33753181	https://www.wohnungsboerse.net/immodetail/33753181	55.47	2	Geschmackvolle 2-Raum-Wohnung mit Balkon und Einbauküche in Düseldorf	14	40477	Marc-Chagall-Str.	51.2423	6.79345	\N
33753183	https://www.wohnungsboerse.net/immodetail/33753183	165	4	Ansprechende 4-Zimmer-Wohnung mit Balkon und EBK in Düsseldorf	23	40237	\N	51.2357	6.80917	\N
33753201	https://www.wohnungsboerse.net/immodetail/33753201	105	3	Sanierte Wohnung mit drei Zimmern sowie Balkon und EBK in Düsseldorf	62	40468	Beedstraße	51.2765	6.782	\N
33753345	https://www.wohnungsboerse.net/immodetail/33753345	64	2	Moderne Altbauwohnung in zentraler Lage in D-Grafenberg	72	40235	\N	51.2294	6.82752	\N
33753349	https://www.wohnungsboerse.net/immodetail/33753349	52	2	Modernisierte 2-Zimmer-Wohnung mit Balkon und EBK in Düsseldorf	73	40629	\N	51.255	6.88361	\N
33754038	https://www.wohnungsboerse.net/immodetail/33754038	63	2	Modernisierte und charmante 2-Raum-Altbau mit Balkon und Einbauküche direkt am Volksgarten	37	40227	Kruppstraße	51.2098	6.79396	\N
33754069	https://www.wohnungsboerse.net/immodetail/33754069	56	2	Sonnendurchflutete 2-Zimmer Dachgeschosswohnung im Herzen von Düsseldorf ++ Friedrichstadt ++ EBK	31	40215	Jahnstrasse	51.2171	6.78105	\N
33754265	https://www.wohnungsboerse.net/immodetail/33754265	102	3	Le Flair -  3 Zimmer mit Küche, Einbauschränken und E-Ladestation	14	40477	Marc-Chagall-Straße	51.2409	6.7946	2015
33754288	https://www.wohnungsboerse.net/immodetail/33754288	70	2	Charmante 2 Zimmer-Altbauwohnung mit Balkon in Düsseldorf-Flingern Nord!	22	40235	\N	51.2294	6.82752	1902
33754292	https://www.wohnungsboerse.net/immodetail/33754292	50	2	Schöne 2 Zimmer Wohnung in Waldnähe	63	40470	Jean-Paul-Str.	51.2542	6.82193	1963
33756995	https://www.wohnungsboerse.net/immodetail/33756995	61	2	Sonnige 2-Zi-Luxus-Wohnung mit Balkon	13	40211	Gerresheimer	51.2275	6.79527	2022
33757002	https://www.wohnungsboerse.net/immodetail/33757002	89.18	3	Moderne 3 Zimmer Wohnung mit Gäste WC, Parkett und Terrasse	23	40237	Ivo	51.2371	6.82024	2012
33757007	https://www.wohnungsboerse.net/immodetail/33757007	81.81	3	Super aufgeteilte 3- Zimmerwohnung in top Lage!	73	40629	Am	51.2433	6.8506	2014
33757028	https://www.wohnungsboerse.net/immodetail/33757028	86.19	3	Modernes Wohnen mit bester Anbindung zum Zentrum	72	40629	Ludenbergerstraße	51.2409	6.83168	2021
33757031	https://www.wohnungsboerse.net/immodetail/33757031	42	1.5	Tauschwohnung: gemütliche Wohnung nähe Hbf gegen Kölner Wohnung	37	40227	\N	51.2154	6.79757	\N
33757132	https://www.wohnungsboerse.net/immodetail/33757132	69.82	2.5	Renovierte 2,5 Zimmerwohnung in Pempelfort	14	40479	Arnoldstraße	51.2342	6.77824	1965
33757186	https://www.wohnungsboerse.net/immodetail/33757186	45	2	Exklusive 2-Zimmer-Wohnung mit Balkon und Einbauküche in Düsseldorf	13	40210	Grupellostraße	51.2202	6.7882	\N
33757292	https://www.wohnungsboerse.net/immodetail/33757292	73	3.5	Großzügig geschnittene Balkonwohnung in Dahlhausen!	92	44879	Kassenbergerstraße	51.4314	7.14745	1972
33757357	https://www.wohnungsboerse.net/immodetail/33757357	60	2	E -Bredeney, Balkon,Einstellpl.,zum 01.02.2024	92	45133	Zeunerstraße	51.4111	6.99275	1960
33757362	https://www.wohnungsboerse.net/immodetail/33757362	33	1	Leopoldstraße 33, 40211 Düsseldorf	92	40211	Leopoldstraße	51.2263	6.79162	\N
33757365	https://www.wohnungsboerse.net/immodetail/33757365	80	3	Einziehen & Wohlfühlen - 80 qm mit Balkon	92	45663	\N	51.582	7.23464	2011
33757376	https://www.wohnungsboerse.net/immodetail/33757376	84	2	Wohnen in Zentrum von Viersen ... mit großer Dachterrasse	92	41747	Hauptstraße	51.2533	6.39318	1966
33757377	https://www.wohnungsboerse.net/immodetail/33757377	30	1	kleines Appartement Nähe Eishalle	23	40239	Windscheidstr.	51.2457	6.80078	\N
\.



--
-- Data for Name: price; Type: TABLE DATA; Schema: estates; Owner: estates_scraper
--

COPY estates.price (price, scraped_at, estate_id, source) FROM stdin;
1800	2023-11-06 13:00:15+01	2c8uc55	Immowelt
2086.5	2023-11-06 13:00:17+01	2c8hw5b	Immowelt
1200	2023-11-06 13:00:17+01	2cjh356	Immowelt
1644	2023-11-06 13:00:19+01	2bd7g5t	Immowelt
1145	2023-11-06 13:00:19+01	2bpyb5w	Immowelt
911	2023-11-06 13:00:19+01	2bubg5q	Immowelt
676.82	2023-11-06 13:00:19+01	2c3xm5a	Immowelt
900	2023-11-06 13:00:19+01	2c6vn5a	Immowelt
1640	2023-11-06 13:00:19+01	2ctsw56	Immowelt
420	2023-11-06 13:00:19+01	2cv4m56	Immowelt
690	2023-11-06 13:00:21+01	28mtp5n	Immowelt
1800	2023-11-06 13:00:21+01	2c2lj52	Immowelt
530	2023-11-06 13:00:21+01	2c2wf59	Immowelt
1450	2023-11-06 13:00:21+01	2c5lj52	Immowelt
600	2023-11-06 13:00:21+01	2c87959	Immowelt
1350	2023-11-06 13:00:21+01	2c8lv5b	Immowelt
686	2023-11-06 13:00:21+01	2cbv757	Immowelt
1070	2023-11-06 13:00:21+01	2cdd55a	Immowelt
950	2023-11-06 13:00:21+01	2cdwy5a	Immowelt
1990	2023-11-06 13:00:21+01	2ch2t55	Immowelt
1612.68	2023-11-06 13:00:21+01	2chsk55	Immowelt
1775.75	2023-11-06 13:00:21+01	2cksk55	Immowelt
1100	2023-11-06 13:00:21+01	2clud54	Immowelt
1500	2023-11-06 13:00:21+01	2cpkj52	Immowelt
1040	2023-11-06 13:00:21+01	2cpqs5a	Immowelt
1030	2023-11-06 13:00:21+01	2cr6m57	Immowelt
695	2023-11-06 13:00:21+01	2crcw5b	Immowelt
800	2023-11-06 13:00:21+01	2ctsf5a	Immowelt
600	2023-11-06 13:00:21+01	2cucv59	Immowelt
1060	2023-11-06 13:00:21+01	2cy5m57	Immowelt
654.92	2023-11-06 13:00:26+01	2c2cq58	Immowelt
560	2023-11-06 13:00:26+01	2cgtf59	Immowelt
620.84	2023-11-06 13:00:26+01	2cm2d5b	Immowelt
300	2023-11-06 13:00:26+01	2cmep52	Immowelt
594.6	2023-11-06 13:00:26+01	2czbq58	Immowelt
1320	2023-11-06 13:00:31+01	285hy5x	Immowelt
1680	2023-11-06 13:00:31+01	28vey5x	Immowelt
1790	2023-11-06 13:00:31+01	2bbma5g	Immowelt
640	2023-11-06 13:00:31+01	2bqxr5c	Immowelt
615	2023-11-06 13:00:31+01	2c6xn59	Immowelt
950	2023-11-06 13:00:31+01	2clgh57	Immowelt
900	2023-11-06 13:00:31+01	2cs3554	Immowelt
1190.87	2023-11-06 13:00:35+01	2bc4f5z	Immowelt
1950	2023-11-06 13:00:35+01	2c8t855	Immowelt
1186.17	2023-11-06 13:00:41+01	2bcee5z	Immowelt
1140	2023-11-06 13:00:41+01	2chng5a	Immowelt
850	2023-11-06 13:00:43+01	2bxgn5l	Immowelt
570	2023-11-06 13:00:43+01	2cbyr5a	Immowelt
783	2023-11-06 13:00:43+01	2cttb5b	Immowelt
685	2023-11-06 13:00:43+01	2cxll58	Immowelt
650	2023-11-06 13:00:47+01	2c3mv57	Immowelt
1255	2023-11-06 13:00:49+01	2aql75g	Immowelt
1260	2023-11-06 13:00:49+01	2b2r25u	Immowelt
870	2023-11-06 13:00:49+01	2b8r25u	Immowelt
1200	2023-11-06 13:00:49+01	2baud57	Immowelt
990	2023-11-06 13:00:49+01	2c8xr58	Immowelt
1050	2023-11-06 13:00:49+01	2cajx57	Immowelt
1500	2023-11-06 13:00:49+01	2cffc53	Immowelt
1320	2023-11-06 13:00:49+01	2cklk5b	Immowelt
4350	2023-11-06 13:00:49+01	2cnrh58	Immowelt
1050	2023-11-06 13:00:49+01	2ct8y57	Immowelt
320	2023-11-06 13:00:51+01	2bup85u	Immowelt
2300	2023-11-06 13:00:51+01	2cwz457	Immowelt
869	2023-11-06 13:03:31+01	2c2pf55	Immowelt
839	2023-11-06 13:03:31+01	2c3pf55	Immowelt
650	2023-11-06 13:03:31+01	2c4kt59	Immowelt
869	2023-11-06 13:03:31+01	2c4pf55	Immowelt
839	2023-11-06 13:03:31+01	2c5pf55	Immowelt
560	2023-11-06 13:03:31+01	2c6nf55	Immowelt
859	2023-11-06 13:03:31+01	2c6pf55	Immowelt
869	2023-11-06 13:03:31+01	2c7pf55	Immowelt
869	2023-11-06 13:03:31+01	2capf55	Immowelt
900	2023-11-06 13:03:31+01	2ce4l5b	Immowelt
630	2023-11-06 13:03:31+01	2cfpf55	Immowelt
630	2023-11-06 13:03:31+01	2cgpf55	Immowelt
889	2023-11-06 13:03:31+01	2chpf55	Immowelt
445	2023-11-06 13:03:31+01	2chwf59	Immowelt
681	2023-11-06 13:03:31+01	2cjpf55	Immowelt
568	2023-11-06 13:03:31+01	2ckpf55	Immowelt
839	2023-11-06 13:03:31+01	2cr8559	Immowelt
889	2023-11-06 13:03:31+01	2cwnf55	Immowelt
493.51	2023-11-06 13:03:31+01	2cxge57	Immowelt
839	2023-11-06 13:03:31+01	2cxnf55	Immowelt
920	2023-11-06 13:03:33+01	2b28n5l	Immowelt
935	2023-11-06 13:03:33+01	2c4y959	Immowelt
709	2023-11-06 13:03:33+01	2c84u59	Immowelt
1034	2023-11-06 13:03:33+01	2cn8w5a	Immowelt
1270	2023-11-06 13:03:33+01	2cp7v59	Immowelt
1498	2023-11-06 13:03:33+01	2cy8358	Immowelt
897	2023-11-06 13:03:36+01	2cn8357	Immowelt
687	2023-11-06 13:03:39+01	2c7vl5b	Immowelt
840	2023-11-06 13:03:41+01	2cb2w57	Immowelt
1249	2023-11-06 13:03:41+01	2ckqa57	Immowelt
900	2023-11-06 13:03:41+01	2cypx58	Immowelt
600	2023-11-06 13:03:44+01	2bh5l55	Immowelt
1421	2023-11-06 13:03:44+01	2c97z57	Immowelt
670	2023-11-06 13:03:44+01	2ctf85c	Immowelt
630	2023-11-06 13:03:49+01	2b2j65x	Immowelt
1450	2023-11-06 13:03:49+01	2bbsa5e	Immowelt
1250	2023-11-06 13:03:49+01	2bpef5x	Immowelt
850	2023-11-06 13:03:49+01	2c5hu55	Immowelt
1450	2023-11-06 13:03:49+01	2cdpp5b	Immowelt
839.16	2023-11-06 13:03:54+01	2c8cq58	Immowelt
770.57	2023-11-06 13:03:54+01	2cbh958	Immowelt
623.31	2023-11-06 13:03:54+01	2cgst5b	Immowelt
460	2023-11-06 13:03:54+01	2ckuj59	Immowelt
593.87	2023-11-06 13:03:54+01	2clm555	Immowelt
828.2	2023-11-06 13:03:54+01	2cvh958	Immowelt
660	2023-11-06 13:03:57+01	2cdqq5b	Immowelt
700	2023-11-06 13:03:57+01	2ch6l56	Immowelt
745.68	2023-11-06 13:03:57+01	2cnaq58	Immowelt
765	2023-11-06 13:03:57+01	2cnfv56	Immowelt
1500	2023-11-06 13:03:59+01	2bjpx5g	Immowelt
2995	2023-11-06 13:03:59+01	2rdw54t	Immowelt
1450	2023-11-06 13:04:01+01	2bp2a5y	Immowelt
1072.51	2023-11-06 13:04:01+01	2bwtl5u	Immowelt
480	2023-11-06 13:04:01+01	2c2d45c	Immowelt
1262.17	2023-11-06 13:04:01+01	2c2je5b	Immowelt
684	2023-11-06 13:04:01+01	2c9hq5a	Immowelt
1168.83	2023-11-06 13:04:01+01	2cdlj57	Immowelt
1280	2023-11-06 13:04:01+01	2cgxm5b	Immowelt
1049.6	2023-11-06 13:04:01+01	2cm9g5b	Immowelt
470	2023-11-06 13:04:01+01	2cngq5a	Immowelt
1280	2023-11-06 13:04:01+01	2ctzd5b	Immowelt
1450	2023-11-06 13:04:07+01	2csfl5b	Immowelt
456	2023-11-06 13:04:10+01	296ck5z	Immowelt
709	2023-11-06 13:04:10+01	29tsj5z	Immowelt
619	2023-11-06 13:04:10+01	2chtf59	Immowelt
958.65	2023-11-06 13:04:10+01	2cul555	Immowelt
1300	2023-11-06 13:06:54+01	2as9e5x	Immowelt
1210	2023-11-06 13:06:54+01	2c2dt5a	Immowelt
810	2023-11-06 13:06:54+01	2cbbt5a	Immowelt
740	2023-11-06 13:06:54+01	2cqy65c	Immowelt
1300	2023-11-06 13:06:54+01	2cvdt5a	Immowelt
540	2023-11-06 13:06:56+01	2bghd5r	Immowelt
1041	2023-11-06 13:06:56+01	2c3ds59	Immowelt
2050	2023-11-06 13:06:56+01	2c8an57	Immowelt
630	2023-11-06 13:06:56+01	2cace58	Immowelt
398.25	2023-11-06 13:06:56+01	2ccpf59	Immowelt
700	2023-11-06 13:06:56+01	2cfdv59	Immowelt
525	2023-11-06 13:06:56+01	2cfky58	Immowelt
1390	2023-11-06 13:06:56+01	2cg5757	Immowelt
3490	2023-11-06 13:06:56+01	2cqfj5b	Immowelt
2500	2023-11-06 13:06:56+01	2crg458	Immowelt
400	2023-11-06 13:06:56+01	2csfn59	Immowelt
1500	2023-11-06 13:06:56+01	2cxhp56	Immowelt
1160	2023-11-06 13:06:56+01	2cy9a5b	Immowelt
1400	2023-11-06 13:06:56+01	2cyb55a	Immowelt
1590	2023-11-06 13:06:57+01	2au925n	Immowelt
3900	2023-11-06 13:06:57+01	2bd8c5q	Immowelt
1550	2023-11-06 13:06:57+01	2cz3554	Immowelt
632	2023-11-06 13:06:59+01	29xvb5v	Immowelt
687	2023-11-06 13:06:59+01	2a2dp5e	Immowelt
733	2023-11-06 13:06:59+01	2a7rr55	Immowelt
622	2023-11-06 13:06:59+01	2an5v54	Immowelt
759	2023-11-06 13:06:59+01	2b5ud5n	Immowelt
681.31	2023-11-06 13:06:59+01	2bn2p5x	Immowelt
589	2023-11-06 13:06:59+01	2cf8357	Immowelt
804.44	2023-11-06 13:06:59+01	2cmrt5b	Immowelt
751.66	2023-11-06 13:06:59+01	2cnqt5b	Immowelt
507.68	2023-11-06 13:07:04+01	2c4hp55	Immowelt
997.58	2023-11-06 13:07:04+01	2cpdp55	Immowelt
2200	2023-11-06 13:07:07+01	2cgq45b	Immowelt
780	2023-11-06 13:07:07+01	2csft5a	Immowelt
750	2023-11-06 13:07:07+01	2cuvw55	Immowelt
1285	2023-11-06 13:07:09+01	2bq3n5y	Immowelt
850	2023-11-06 13:07:12+01	2cakg58	Immowelt
850	2023-11-06 13:07:15+01	235ql57	Immowelt
799	2023-11-06 13:07:15+01	24zxu5e	Immowelt
750	2023-11-06 13:07:15+01	2c3hc58	Immowelt
2560	2023-11-06 13:07:17+01	2cflv57	Immowelt
1600	2023-11-06 13:07:17+01	2cqwg5c	Immowelt
1568.43	2023-11-06 13:07:17+01	2czzp58	Immowelt
890	2023-11-06 13:07:20+01	2b4lu5n	Immowelt
692	2023-11-06 13:07:20+01	2bd4d5z	Immowelt
810	2023-11-06 13:07:20+01	2bdga5v	Immowelt
1200	2023-11-06 13:07:20+01	2c2ng58	Immowelt
950	2023-11-06 13:07:20+01	2ce6y54	Immowelt
750	2023-11-06 13:07:20+01	2ckd85b	Immowelt
490	2023-11-06 13:07:25+01	29yz55s	Immowelt
690	2023-11-06 13:07:25+01	2c2ww5a	Immowelt
880	2023-11-06 13:07:25+01	2c38j5b	Immowelt
811.2	2023-11-06 13:07:25+01	2cq6n5a	Immowelt
525	2023-11-06 13:07:27+01	2bnm958	Immowelt
465.65	2023-11-06 13:07:27+01	2bqz55y	Immowelt
834.97	2023-11-06 13:07:27+01	2c5uh5a	Immowelt
947.16	2023-11-06 13:07:27+01	2cej553	Immowelt
525	2023-11-06 13:07:27+01	2ckfw5b	Immowelt
752.77	2023-11-06 13:07:27+01	2cmrh5a	Immowelt
2480	2023-11-06 13:10:46+01	31210714	Wohnungsboerse
1890	2023-11-06 13:10:48+01	32728992	Wohnungsboerse
800	2023-11-06 13:10:49+01	28806724	Wohnungsboerse
670	2023-11-06 13:10:52+01	33440620	Wohnungsboerse
800	2023-11-06 13:10:54+01	31766932	Wohnungsboerse
670	2023-11-06 13:10:57+01	33444151	Wohnungsboerse
780	2023-11-06 13:11:00+01	33437469	Wohnungsboerse
850	2023-11-06 13:11:03+01	33368149	Wohnungsboerse
450	2023-11-06 13:11:05+01	33321369	Wohnungsboerse
775	2023-11-06 13:11:07+01	33443895	Wohnungsboerse
520	2023-11-06 13:11:09+01	32995444	Wohnungsboerse
550	2023-11-06 13:11:12+01	33449785	Wohnungsboerse
830	2023-11-06 13:11:15+01	32976985	Wohnungsboerse
905	2023-11-06 13:11:17+01	33002502	Wohnungsboerse
1650	2023-11-06 13:11:19+01	33282360	Wohnungsboerse
1700	2023-11-06 13:11:22+01	31549941	Wohnungsboerse
1874	2023-11-06 13:11:24+01	31641965	Wohnungsboerse
1891	2023-11-06 13:11:26+01	32697715	Wohnungsboerse
985	2023-11-06 13:11:29+01	32642467	Wohnungsboerse
1840	2023-11-06 13:11:31+01	32642458	Wohnungsboerse
1777	2023-11-06 13:11:34+01	33163093	Wohnungsboerse
1705	2023-11-06 13:11:37+01	33050991	Wohnungsboerse
2009	2023-11-06 13:11:39+01	32966061	Wohnungsboerse
2590	2023-11-06 13:11:40+01	33354570	Wohnungsboerse
2225	2023-11-06 13:11:42+01	32804194	Wohnungsboerse
943	2023-11-06 13:11:45+01	33391895	Wohnungsboerse
920	2023-11-06 13:11:48+01	33429017	Wohnungsboerse
830	2023-11-06 13:11:51+01	33468338	Wohnungsboerse
1450	2023-11-06 13:11:53+01	33223097	Wohnungsboerse
820	2023-11-06 13:11:56+01	33318532	Wohnungsboerse
1520	2023-11-06 13:11:58+01	33341744	Wohnungsboerse
1430	2023-11-06 13:12:01+01	33355426	Wohnungsboerse
1550	2023-11-06 13:12:03+01	33355443	Wohnungsboerse
1290	2023-11-06 13:12:06+01	33367267	Wohnungsboerse
1300	2023-11-06 13:12:08+01	33378464	Wohnungsboerse
1250	2023-11-06 13:12:10+01	33366949	Wohnungsboerse
2950	2023-11-06 13:12:12+01	32489228	Wohnungsboerse
1400	2023-11-06 13:12:14+01	33435206	Wohnungsboerse
1400	2023-11-06 13:12:15+01	33435204	Wohnungsboerse
1049	2023-11-06 13:12:17+01	33443891	Wohnungsboerse
510	2023-11-06 13:12:20+01	33468752	Wohnungsboerse
1350	2023-11-06 13:12:22+01	33292489	Wohnungsboerse
1500	2023-11-06 13:12:25+01	33306950	Wohnungsboerse
990	2023-11-06 13:12:28+01	33378242	Wohnungsboerse
1050	2023-11-06 13:12:30+01	33382392	Wohnungsboerse
1200	2023-11-06 13:12:32+01	33376062	Wohnungsboerse
4350	2023-11-06 13:12:34+01	33401744	Wohnungsboerse
2200	2023-11-06 13:12:37+01	33437192	Wohnungsboerse
1400	2023-11-06 13:12:40+01	33438704	Wohnungsboerse
2000	2023-11-06 13:12:42+01	32392554	Wohnungsboerse
1320	2023-11-06 13:12:44+01	33449855	Wohnungsboerse
600	2023-11-06 13:12:47+01	32761322	Wohnungsboerse
1200	2023-11-06 13:12:50+01	33462038	Wohnungsboerse
1400	2023-11-06 13:12:53+01	33368188	Wohnungsboerse
1250	2023-11-06 13:12:54+01	33468319	Wohnungsboerse
1885.05	2023-11-06 13:12:55+01	33309498	Wohnungsboerse
1236.85	2023-11-06 13:12:57+01	33309495	Wohnungsboerse
700	2023-11-06 13:13:00+01	33331577	Wohnungsboerse
1150	2023-11-06 13:13:01+01	33276431	Wohnungsboerse
990	2023-11-06 13:13:04+01	33192578	Wohnungsboerse
810	2023-11-06 13:13:07+01	32946163	Wohnungsboerse
795	2023-11-06 13:13:10+01	33414347	Wohnungsboerse
2276	2023-11-06 13:13:12+01	33323591	Wohnungsboerse
890	2023-11-06 13:13:15+01	33227248	Wohnungsboerse
1082.65	2023-11-06 13:13:17+01	33309501	Wohnungsboerse
1164	2023-11-06 13:13:20+01	33309496	Wohnungsboerse
800	2023-11-06 13:13:22+01	33449758	Wohnungsboerse
825	2023-11-06 13:13:24+01	33450133	Wohnungsboerse
510	2023-11-06 13:13:26+01	33463327	Wohnungsboerse
750	2023-11-06 13:13:29+01	33275992	Wohnungsboerse
650	2023-11-06 13:13:32+01	33284573	Wohnungsboerse
750	2023-11-06 13:13:34+01	33347563	Wohnungsboerse
685	2023-11-06 13:13:37+01	33397839	Wohnungsboerse
850	2023-11-06 13:13:40+01	33067537	Wohnungsboerse
750	2023-11-06 13:13:42+01	33376142	Wohnungsboerse
570	2023-11-06 13:13:43+01	33437413	Wohnungsboerse
1220	2023-11-06 13:13:46+01	33448858	Wohnungsboerse
783	2023-11-06 13:13:49+01	33448909	Wohnungsboerse
449	2023-11-06 13:13:52+01	33451950	Wohnungsboerse
665	2023-11-06 13:13:55+01	33464631	Wohnungsboerse
890	2023-11-06 13:13:57+01	33450001	Wohnungsboerse
850	2023-11-06 13:14:00+01	33450214	Wohnungsboerse
630	2023-11-06 13:14:03+01	33450401	Wohnungsboerse
650	2023-11-06 13:14:06+01	33451656	Wohnungsboerse
800	2023-11-06 13:14:08+01	33451694	Wohnungsboerse
275	2023-11-06 13:14:11+01	33455256	Wohnungsboerse
880	2023-11-06 13:14:13+01	33455367	Wohnungsboerse
295	2023-11-06 13:14:15+01	33457672	Wohnungsboerse
630	2023-11-06 13:14:18+01	33458867	Wohnungsboerse
800	2023-11-06 13:14:20+01	33459640	Wohnungsboerse
800	2023-11-06 13:14:23+01	33460420	Wohnungsboerse
780	2023-11-06 13:14:26+01	33460724	Wohnungsboerse
1850	2023-11-06 13:14:28+01	33462887	Wohnungsboerse
950	2023-11-06 13:14:30+01	33439144	Wohnungsboerse
1051.8	2023-11-06 13:14:32+01	33063518	Wohnungsboerse
720	2023-11-06 13:14:35+01	32630083	Wohnungsboerse
788	2023-11-06 13:14:37+01	33299265	Wohnungsboerse
1330	2023-11-06 13:14:39+01	33188188	Wohnungsboerse
1390	2023-11-06 13:14:42+01	33373146	Wohnungsboerse
630	2023-11-06 13:14:44+01	33341790	Wohnungsboerse
640	2023-11-06 13:14:47+01	33386081	Wohnungsboerse
600	2023-11-06 13:14:49+01	33422162	Wohnungsboerse
500	2023-11-06 13:14:51+01	33425750	Wohnungsboerse
990	2023-11-06 13:14:54+01	33425802	Wohnungsboerse
395	2023-11-06 13:14:56+01	33444305	Wohnungsboerse
443	2023-11-06 13:14:57+01	33445882	Wohnungsboerse
539.64	2023-11-06 13:14:59+01	33446081	Wohnungsboerse
888.72	2023-11-06 13:15:02+01	33448755	Wohnungsboerse
1480	2023-11-06 13:15:05+01	33445704	Wohnungsboerse
1200	2023-11-06 13:15:08+01	33450096	Wohnungsboerse
940	2023-11-06 13:15:10+01	33452256	Wohnungsboerse
565	2023-11-06 13:15:13+01	33450314	Wohnungsboerse
1950	2023-11-06 13:15:15+01	33452384	Wohnungsboerse
700	2023-11-06 13:15:17+01	33138761	Wohnungsboerse
900	2023-11-06 13:15:20+01	33454817	Wohnungsboerse
640	2023-11-06 13:15:23+01	33454951	Wohnungsboerse
850	2023-11-06 13:15:25+01	33309510	Wohnungsboerse
680	2023-11-06 13:15:28+01	33457708	Wohnungsboerse
720	2023-11-06 13:15:30+01	33461687	Wohnungsboerse
600	2023-11-06 13:15:33+01	33461773	Wohnungsboerse
853	2023-11-06 13:15:35+01	33463435	Wohnungsboerse
2600	2023-11-06 13:15:37+01	33298293	Wohnungsboerse
1100	2023-11-06 13:15:39+01	33321367	Wohnungsboerse
550	2023-11-06 13:15:41+01	33440362	Wohnungsboerse
1450	2023-11-06 13:15:43+01	33449897	Wohnungsboerse
950	2023-11-06 13:15:47+01	33382426	Wohnungsboerse
900	2023-11-06 13:15:51+01	32589487	Wohnungsboerse
745.68	2023-11-06 13:15:52+01	33402819	Wohnungsboerse
810	2023-11-06 13:15:55+01	32572858	Wohnungsboerse
600	2023-11-06 13:15:57+01	33412297	Wohnungsboerse
670	2023-11-06 13:15:59+01	33417423	Wohnungsboerse
1125	2023-11-06 13:16:02+01	33424092	Wohnungsboerse
880	2023-11-06 13:16:05+01	33424422	Wohnungsboerse
1400	2023-11-06 13:16:08+01	33433016	Wohnungsboerse
851	2023-11-06 13:16:11+01	33438922	Wohnungsboerse
800	2023-11-06 13:16:14+01	33450271	Wohnungsboerse
620	2023-11-06 13:16:16+01	33097028	Wohnungsboerse
1190	2023-11-06 13:16:19+01	33466040	Wohnungsboerse
671	2023-11-06 13:16:21+01	33282683	Wohnungsboerse
1900	2023-11-06 13:16:24+01	33439198	Wohnungsboerse
922	2023-11-06 13:16:27+01	33441897	Wohnungsboerse
950	2023-11-06 13:16:29+01	33444249	Wohnungsboerse
788	2023-11-06 13:16:32+01	33445534	Wohnungsboerse
978	2023-11-06 13:16:33+01	33446006	Wohnungsboerse
440	2023-11-06 13:16:35+01	33449753	Wohnungsboerse
1600	2023-11-06 13:16:37+01	33451780	Wohnungsboerse
1800	2023-11-06 13:16:40+01	33455542	Wohnungsboerse
1800	2023-11-06 13:16:42+01	33455594	Wohnungsboerse
870	2023-11-06 13:16:44+01	33457765	Wohnungsboerse
1150	2023-11-06 13:16:46+01	33416750	Wohnungsboerse
900	2023-11-06 13:16:48+01	33460413	Wohnungsboerse
1900	2023-11-06 13:16:51+01	33464724	Wohnungsboerse
1268	2023-11-06 13:16:54+01	33468702	Wohnungsboerse
640	2023-11-06 13:16:58+01	33444302	Wohnungsboerse
1010	2023-11-06 13:17:00+01	33446194	Wohnungsboerse
620.84	2023-11-06 13:17:02+01	33448659	Wohnungsboerse
681.79	2023-11-06 13:17:03+01	33446187	Wohnungsboerse
3850	2023-11-06 13:17:04+01	33351834	Wohnungsboerse
1920	2023-11-06 13:17:08+01	33409277	Wohnungsboerse
690	2023-11-06 13:17:10+01	33455562	Wohnungsboerse
1100	2023-11-06 13:17:11+01	33457567	Wohnungsboerse
640	2023-11-06 13:17:14+01	33463461	Wohnungsboerse
310	2023-11-06 13:17:16+01	33464500	Wohnungsboerse
529	2023-11-06 13:17:19+01	33465898	Wohnungsboerse
580	2023-11-06 13:17:21+01	33468444	Wohnungsboerse
1210	2023-11-06 13:17:23+01	33331619	Wohnungsboerse
290	2023-11-06 13:17:26+01	33469010	Wohnungsboerse
3250	2023-11-06 13:17:29+01	33114294	Wohnungsboerse
1610	2023-11-06 13:17:32+01	32875836	Wohnungsboerse
2080	2023-11-06 13:17:35+01	32877350	Wohnungsboerse
2090	2023-11-06 13:17:37+01	32877330	Wohnungsboerse
1950	2023-11-06 13:17:39+01	33308983	Wohnungsboerse
1950	2023-11-06 13:17:42+01	33320934	Wohnungsboerse
655	2023-11-06 13:17:45+01	33378454	Wohnungsboerse
1100	2023-11-06 13:17:48+01	33397960	Wohnungsboerse
1100	2023-11-06 13:17:50+01	33008456	Wohnungsboerse
2300	2023-11-06 13:17:53+01	33443714	Wohnungsboerse
1800	2023-11-06 13:17:55+01	33445674	Wohnungsboerse
510	2023-11-06 13:17:57+01	33448450	Wohnungsboerse
1330	2023-11-06 13:18:00+01	33449714	Wohnungsboerse
1100	2023-11-06 13:18:03+01	33451648	Wohnungsboerse
365	2023-11-06 13:18:06+01	33457496	Wohnungsboerse
1350	2023-11-06 13:18:08+01	33459667	Wohnungsboerse
695	2023-11-06 13:18:10+01	33459798	Wohnungsboerse
515	2023-11-06 13:18:13+01	33459819	Wohnungsboerse
415	2023-11-06 13:18:16+01	33460461	Wohnungsboerse
500	2023-11-06 13:18:19+01	33460438	Wohnungsboerse
730	2023-11-06 13:18:21+01	33460627	Wohnungsboerse
1157	2023-11-06 13:18:23+01	33464272	Wohnungsboerse
1100	2023-11-06 13:18:26+01	33468980	Wohnungsboerse
810	2023-11-06 13:18:28+01	33254648	Wohnungsboerse
1640	2023-11-06 13:18:33+01	33380525	Wohnungsboerse
412	2023-11-06 13:18:35+01	33381820	Wohnungsboerse
950	2023-11-06 13:18:37+01	33298728	Wohnungsboerse
800	2023-11-06 13:18:39+01	33086103	Wohnungsboerse
840	2023-11-06 13:18:42+01	33313054	Wohnungsboerse
900	2023-11-06 13:18:44+01	33225904	Wohnungsboerse
1081	2023-11-06 13:18:48+01	33432833	Wohnungsboerse
676.82	2023-11-06 13:18:50+01	33435042	Wohnungsboerse
1521	2023-11-06 13:18:53+01	33445551	Wohnungsboerse
1280	2023-11-06 13:18:56+01	33449731	Wohnungsboerse
600	2023-11-06 13:18:57+01	33464772	Wohnungsboerse
1200	2023-11-06 13:19:00+01	33027861	Wohnungsboerse
2200	2023-11-06 13:19:03+01	33344012	Wohnungsboerse
1550	2023-11-06 13:19:06+01	33382256	Wohnungsboerse
595	2023-11-06 13:19:08+01	33254812	Wohnungsboerse
1550	2023-11-06 13:19:11+01	32853522	Wohnungsboerse
1890	2023-11-06 13:19:13+01	32728991	Wohnungsboerse
1790	2023-11-06 13:19:16+01	32728990	Wohnungsboerse
900	2023-11-06 13:19:18+01	33444179	Wohnungsboerse
8500	2023-11-06 13:19:20+01	33196281	Wohnungsboerse
1850	2023-11-06 13:19:23+01	33196527	Wohnungsboerse
600	2023-11-06 13:19:26+01	33254461	Wohnungsboerse
2770	2023-11-06 13:19:29+01	33347939	Wohnungsboerse
4205.76	2023-11-06 13:19:31+01	33360939	Wohnungsboerse
1800	2023-11-06 13:19:33+01	32817541	Wohnungsboerse
740	2023-11-06 13:19:36+01	32542458	Wohnungsboerse
1379.88	2023-11-06 13:19:38+01	33445819	Wohnungsboerse
1684.63	2023-11-06 13:19:41+01	33445857	Wohnungsboerse
1135	2023-11-06 13:19:43+01	33446074	Wohnungsboerse
2200	2023-11-06 13:19:46+01	33422321	Wohnungsboerse
2950	2023-11-06 13:19:49+01	33455178	Wohnungsboerse
650	2023-11-06 13:19:52+01	33458840	Wohnungsboerse
392	2023-11-06 13:19:54+01	33466189	Wohnungsboerse
700	2023-11-06 13:20:36+01	33271959	Wohnungsboerse
839	2023-11-06 13:20:38+01	33344008	Wohnungsboerse
896	2023-11-06 13:20:40+01	33196294	Wohnungsboerse
498.36	2023-11-06 13:20:43+01	31818244	Wohnungsboerse
687	2023-11-06 13:20:45+01	33455338	Wohnungsboerse
800	2023-11-06 13:20:47+01	32683285	Wohnungsboerse
1900	2023-11-06 13:20:50+01	31394882	Wohnungsboerse
685	2023-11-06 13:20:52+01	33259837	Wohnungsboerse
3000	2023-11-06 13:20:55+01	31827401	Wohnungsboerse
994	2023-11-06 13:20:57+01	33463761	Wohnungsboerse
593.87	2023-11-06 13:20:59+01	33337302	Wohnungsboerse
580	2023-11-06 13:21:02+01	33437505	Wohnungsboerse
1500	2023-11-06 13:21:05+01	32039889	Wohnungsboerse
1205	2023-11-06 13:21:06+01	27088008	Wohnungsboerse
952	2023-11-06 13:21:08+01	30952139	Wohnungsboerse
491.81	2023-11-06 13:21:11+01	33321218	Wohnungsboerse
1450	2023-11-06 13:21:13+01	32876901	Wohnungsboerse
1550	2023-11-06 13:21:16+01	33438599	Wohnungsboerse
1159	2023-11-06 13:21:19+01	33439063	Wohnungsboerse
1200	2023-11-06 13:21:21+01	33449976	Wohnungsboerse
1450	2023-11-06 13:21:24+01	33384086	Wohnungsboerse
1608.2	2023-11-06 13:21:26+01	33464197	Wohnungsboerse
1116.17	2023-11-06 13:21:29+01	33274310	Wohnungsboerse
1400	2023-11-06 13:21:32+01	33424468	Wohnungsboerse
1380	2023-11-06 13:21:34+01	33401965	Wohnungsboerse
920	2023-11-06 13:21:36+01	29314952	Wohnungsboerse
650	2023-11-06 13:21:38+01	29317989	Wohnungsboerse
1200	2023-11-06 13:21:41+01	29631528	Wohnungsboerse
980	2023-11-06 13:21:43+01	33436179	Wohnungsboerse
1050	2023-11-06 13:21:45+01	33440863	Wohnungsboerse
880	2023-11-06 13:21:48+01	33444495	Wohnungsboerse
650	2023-11-06 13:21:49+01	33451641	Wohnungsboerse
750	2023-11-06 13:21:52+01	33451892	Wohnungsboerse
1330	2023-11-06 13:21:54+01	33452188	Wohnungsboerse
910	2023-11-06 13:21:57+01	33431309	Wohnungsboerse
1785	2023-11-06 13:21:59+01	33245396	Wohnungsboerse
1331	2023-11-06 13:22:01+01	33248616	Wohnungsboerse
4200	2023-11-06 13:22:04+01	33320901	Wohnungsboerse
2115	2023-11-06 13:22:07+01	33333838	Wohnungsboerse
1795	2023-11-06 13:22:09+01	33279878	Wohnungsboerse
1495	2023-11-06 13:22:11+01	33200036	Wohnungsboerse
500	2023-11-06 13:22:13+01	33365152	Wohnungsboerse
1045.08	2023-11-06 13:22:15+01	33425661	Wohnungsboerse
1895	2023-11-06 13:22:18+01	33227368	Wohnungsboerse
1300	2023-11-06 13:22:21+01	33439057	Wohnungsboerse
810	2023-11-06 13:22:23+01	33439071	Wohnungsboerse
1210	2023-11-06 13:22:26+01	33439064	Wohnungsboerse
839	2023-11-06 13:22:29+01	33451956	Wohnungsboerse
1340	2023-11-06 13:22:32+01	33462779	Wohnungsboerse
740	2023-11-06 13:22:35+01	33464465	Wohnungsboerse
1100	2023-11-06 13:22:37+01	31675590	Wohnungsboerse
2500	2023-11-06 13:22:40+01	32188005	Wohnungsboerse
1330	2023-11-06 13:22:42+01	33240414	Wohnungsboerse
1168.83	2023-11-06 13:22:45+01	33384509	Wohnungsboerse
470	2023-11-06 13:22:48+01	31983080	Wohnungsboerse
684	2023-11-06 13:22:51+01	27035171	Wohnungsboerse
1072.51	2023-11-06 13:22:54+01	33196576	Wohnungsboerse
1348	2023-11-06 13:22:57+01	33425850	Wohnungsboerse
1049.6	2023-11-06 13:23:00+01	33449817	Wohnungsboerse
1262.17	2023-11-06 13:23:03+01	33450063	Wohnungsboerse
1280	2023-11-06 13:23:05+01	33450160	Wohnungsboerse
1280	2023-11-06 13:23:08+01	33455197	Wohnungsboerse
1064	2023-11-06 13:23:11+01	32820355	Wohnungsboerse
770.57	2023-11-06 13:23:13+01	33331984	Wohnungsboerse
828.2	2023-11-06 13:23:16+01	33396009	Wohnungsboerse
839.16	2023-11-06 13:23:18+01	33402808	Wohnungsboerse
950	2023-11-06 13:23:19+01	33445581	Wohnungsboerse
623.31	2023-11-06 13:23:21+01	33457517	Wohnungsboerse
815	2023-11-06 13:23:23+01	33469021	Wohnungsboerse
450	2023-11-06 13:23:24+01	33425609	Wohnungsboerse
350	2023-11-06 13:23:27+01	33450424	Wohnungsboerse
1645	2023-11-06 13:23:29+01	33469025	Wohnungsboerse
1040	2023-11-06 13:23:31+01	33274005	Wohnungsboerse
400	2023-11-06 13:23:33+01	32729901	Wohnungsboerse
1029	2023-11-06 13:23:35+01	33469036	Wohnungsboerse
1375	2023-11-06 13:23:38+01	33458968	Wohnungsboerse
800	2023-11-06 13:23:40+01	33433063	Wohnungsboerse
270	2023-11-06 13:23:43+01	33469054	Wohnungsboerse
715	2023-11-06 13:23:46+01	33454883	Wohnungsboerse
395	2023-11-06 13:23:47+01	33469069	Wohnungsboerse
473.21	2023-11-06 13:23:50+01	33469072	Wohnungsboerse
865	2023-11-06 13:23:52+01	33469076	Wohnungsboerse
1450	2023-11-06 13:23:55+01	32375748	Wohnungsboerse
2650	2023-11-06 13:23:57+01	32917983	Wohnungsboerse
2600	2023-11-06 13:23:59+01	33129082	Wohnungsboerse
1900	2023-11-06 13:24:02+01	32952241	Wohnungsboerse
1250	2023-11-06 13:24:05+01	33242312	Wohnungsboerse
560	2023-11-06 13:24:06+01	33337177	Wohnungsboerse
925	2023-11-06 13:24:10+01	33343712	Wohnungsboerse
850	2023-11-06 13:24:12+01	33352134	Wohnungsboerse
630	2023-11-06 13:24:15+01	33237999	Wohnungsboerse
790	2023-11-06 13:24:18+01	33448923	Wohnungsboerse
2700	2023-11-06 13:24:21+01	33449689	Wohnungsboerse
1450	2023-11-06 13:24:24+01	33454997	Wohnungsboerse
870	2023-11-06 13:24:26+01	33347483	Wohnungsboerse
785	2023-11-06 13:24:29+01	33468770	Wohnungsboerse
830	2023-11-06 13:24:32+01	33354625	Wohnungsboerse
840	2023-11-06 13:24:34+01	33389516	Wohnungsboerse
900	2023-11-06 13:24:36+01	33391913	Wohnungsboerse
1035	2023-11-06 13:24:39+01	33393636	Wohnungsboerse
820	2023-11-06 13:24:41+01	33394176	Wohnungsboerse
610.44	2023-11-06 13:24:44+01	33400003	Wohnungsboerse
880	2023-11-06 13:24:46+01	33303860	Wohnungsboerse
1000	2023-11-06 13:24:48+01	33421608	Wohnungsboerse
825	2023-11-06 13:24:51+01	33424042	Wohnungsboerse
1050	2023-11-06 13:24:54+01	33435882	Wohnungsboerse
730	2023-11-06 13:24:56+01	33439120	Wohnungsboerse
790	2023-11-06 13:24:59+01	33435831	Wohnungsboerse
480	2023-11-06 13:25:00+01	33465771	Wohnungsboerse
720	2023-11-06 13:25:03+01	33465765	Wohnungsboerse
750	2023-11-06 13:25:05+01	33217523	Wohnungsboerse
1074	2023-11-06 13:25:07+01	32816215	Wohnungsboerse
1038.8	2023-11-06 13:25:10+01	32904956	Wohnungsboerse
850	2023-11-06 13:25:12+01	33380168	Wohnungsboerse
1900	2023-11-06 13:25:14+01	33288206	Wohnungsboerse
1500	2023-11-06 13:25:18+01	33386349	Wohnungsboerse
1498	2023-11-06 13:25:20+01	33393958	Wohnungsboerse
935	2023-11-06 13:25:22+01	33412472	Wohnungsboerse
1600	2023-11-06 13:25:25+01	33413993	Wohnungsboerse
2200	2023-11-06 13:25:27+01	33422243	Wohnungsboerse
1270	2023-11-06 13:25:30+01	33424200	Wohnungsboerse
709	2023-11-06 13:25:33+01	33424462	Wohnungsboerse
1550	2023-11-06 13:25:36+01	33426095	Wohnungsboerse
656	2023-11-06 13:25:38+01	33355109	Wohnungsboerse
1034	2023-11-06 13:25:41+01	33440758	Wohnungsboerse
869	2023-11-06 13:25:43+01	33344007	Wohnungsboerse
839	2023-11-06 13:25:45+01	33344005	Wohnungsboerse
859	2023-11-06 13:25:48+01	33344004	Wohnungsboerse
869	2023-11-06 13:25:50+01	33344003	Wohnungsboerse
560	2023-11-06 13:25:52+01	33344025	Wohnungsboerse
636	2023-11-06 13:25:54+01	33425692	Wohnungsboerse
1197.48	2023-11-06 13:25:57+01	33435007	Wohnungsboerse
423	2023-11-06 13:25:58+01	33438544	Wohnungsboerse
440	2023-11-06 13:26:00+01	33438593	Wohnungsboerse
839	2023-11-06 13:26:03+01	33409168	Wohnungsboerse
889	2023-11-06 13:26:06+01	33343992	Wohnungsboerse
1500	2023-11-06 13:26:08+01	33451563	Wohnungsboerse
869	2023-11-06 13:26:11+01	33343999	Wohnungsboerse
444.4	2023-11-06 13:26:13+01	33465657	Wohnungsboerse
1040	2023-11-06 13:26:16+01	33459669	Wohnungsboerse
750	2023-11-06 13:26:56+01	33462698	Wohnungsboerse
1170	2023-11-06 13:26:57+01	33416752	Wohnungsboerse
725	2023-11-06 13:27:00+01	33443692	Wohnungsboerse
1500	2023-11-06 13:27:03+01	33373304	Wohnungsboerse
1370	2023-11-06 13:27:05+01	33440312	Wohnungsboerse
1190	2023-11-06 13:27:07+01	32772403	Wohnungsboerse
614	2023-11-06 13:27:09+01	33051217	Wohnungsboerse
1500	2023-11-06 13:27:11+01	33425580	Wohnungsboerse
810.81	2023-11-06 13:27:14+01	33002621	Wohnungsboerse
1285	2023-11-06 13:27:17+01	33263608	Wohnungsboerse
1750	2023-11-06 13:27:20+01	33444203	Wohnungsboerse
830	2023-11-06 13:27:22+01	33367045	Wohnungsboerse
995	2023-11-06 13:27:23+01	33093225	Wohnungsboerse
590	2023-11-06 13:27:26+01	26640415	Wohnungsboerse
1750	2023-11-06 13:27:28+01	33087472	Wohnungsboerse
636	2023-11-06 13:27:31+01	33069759	Wohnungsboerse
465.65	2023-11-06 13:27:33+01	33254653	Wohnungsboerse
640	2023-11-06 13:27:35+01	33299372	Wohnungsboerse
735	2023-11-06 13:27:38+01	33347299	Wohnungsboerse
947.16	2023-11-06 13:27:41+01	33304400	Wohnungsboerse
490	2023-11-06 13:27:44+01	33428191	Wohnungsboerse
752.77	2023-11-06 13:27:46+01	33432779	Wohnungsboerse
834.97	2023-11-06 13:27:49+01	33432772	Wohnungsboerse
1190	2023-11-06 13:27:52+01	33151939	Wohnungsboerse
850	2023-11-06 13:27:55+01	33319871	Wohnungsboerse
520	2023-11-06 13:27:57+01	33345380	Wohnungsboerse
784	2023-11-06 13:27:59+01	33347397	Wohnungsboerse
968	2023-11-06 13:28:02+01	33397527	Wohnungsboerse
575	2023-11-06 13:28:05+01	33414192	Wohnungsboerse
680	2023-11-06 13:28:07+01	33428288	Wohnungsboerse
811.2	2023-11-06 13:28:09+01	33434998	Wohnungsboerse
1075	2023-11-06 13:28:12+01	33458750	Wohnungsboerse
610	2023-11-06 13:28:15+01	33458773	Wohnungsboerse
720	2023-11-06 13:28:17+01	33463341	Wohnungsboerse
730	2023-11-06 13:28:19+01	33021045	Wohnungsboerse
1562	2023-11-06 13:28:22+01	32803920	Wohnungsboerse
875	2023-11-06 13:28:24+01	33360820	Wohnungsboerse
900	2023-11-06 13:28:26+01	33415998	Wohnungsboerse
590	2023-11-06 13:28:29+01	26800673	Wohnungsboerse
2500	2023-11-06 13:28:31+01	32817705	Wohnungsboerse
810	2023-11-06 13:28:33+01	33198024	Wohnungsboerse
1400	2023-11-06 13:28:36+01	33201711	Wohnungsboerse
864	2023-11-06 13:28:37+01	33203387	Wohnungsboerse
2500	2023-11-06 13:28:39+01	33203372	Wohnungsboerse
850	2023-11-06 13:28:42+01	33213161	Wohnungsboerse
950	2023-11-06 13:28:45+01	33333966	Wohnungsboerse
890	2023-11-06 13:28:48+01	33103145	Wohnungsboerse
670	2023-11-06 13:28:51+01	33424377	Wohnungsboerse
1140	2023-11-06 13:28:54+01	33438640	Wohnungsboerse
750	2023-11-06 13:28:57+01	33445814	Wohnungsboerse
789	2023-11-06 13:28:59+01	33274520	Wohnungsboerse
1200	2023-11-06 13:29:01+01	33337352	Wohnungsboerse
2560	2023-11-06 13:29:02+01	33389260	Wohnungsboerse
1568.43	2023-11-06 13:29:05+01	33402892	Wohnungsboerse
700	2023-11-06 13:29:07+01	33438709	Wohnungsboerse
1200	2023-11-06 13:29:09+01	33452273	Wohnungsboerse
850	2023-11-06 13:29:11+01	33126147	Wohnungsboerse
1590	2023-11-06 13:29:13+01	29486749	Wohnungsboerse
1500	2023-11-06 13:29:15+01	33421757	Wohnungsboerse
1100	2023-11-06 13:29:18+01	33419034	Wohnungsboerse
1790	2023-11-06 13:29:20+01	31571982	Wohnungsboerse
795	2023-11-06 13:29:22+01	33435950	Wohnungsboerse
700	2023-11-06 13:29:25+01	33435999	Wohnungsboerse
1199	2023-11-06 13:29:28+01	33439092	Wohnungsboerse
800	2023-11-06 13:29:30+01	33440276	Wohnungsboerse
450	2023-11-06 13:29:32+01	33440678	Wohnungsboerse
630	2023-11-06 13:29:35+01	33318261	Wohnungsboerse
820	2023-11-06 13:29:38+01	33434842	Wohnungsboerse
751.66	2023-11-06 13:29:40+01	33457539	Wohnungsboerse
1340	2023-11-06 13:29:42+01	33463476	Wohnungsboerse
1000	2023-11-06 13:29:45+01	33445566	Wohnungsboerse
1690	2023-11-06 13:29:48+01	33446220	Wohnungsboerse
1520	2023-11-06 13:29:50+01	33448627	Wohnungsboerse
1150	2023-11-06 13:29:52+01	33449686	Wohnungsboerse
835	2023-11-06 13:29:55+01	33455159	Wohnungsboerse
1360	2023-11-06 13:29:58+01	33455222	Wohnungsboerse
1000	2023-11-06 13:30:01+01	33455583	Wohnungsboerse
787	2023-11-06 13:30:04+01	33459663	Wohnungsboerse
3200	2023-11-06 13:30:06+01	33460382	Wohnungsboerse
656	2023-11-06 13:30:09+01	33460587	Wohnungsboerse
440	2023-11-06 13:30:11+01	33462789	Wohnungsboerse
820	2023-11-06 13:30:14+01	33464345	Wohnungsboerse
560	2023-11-06 13:30:17+01	33465815	Wohnungsboerse
435	2023-11-06 13:30:20+01	33468606	Wohnungsboerse
850	2023-11-06 13:30:22+01	33089879	Wohnungsboerse
870	2023-11-06 13:30:25+01	32977517	Wohnungsboerse
1610	2023-11-06 13:30:26+01	32977500	Wohnungsboerse
1449	2023-11-06 13:30:28+01	33248782	Wohnungsboerse
1560	2023-11-06 13:30:32+01	32977503	Wohnungsboerse
1190	2023-11-06 13:30:34+01	32080605	Wohnungsboerse
2124	2023-11-06 13:30:36+01	33401670	Wohnungsboerse
1278	2023-11-06 13:30:38+01	33401864	Wohnungsboerse
1350	2023-11-06 13:30:40+01	33416558	Wohnungsboerse
1150	2023-11-06 13:30:42+01	33429247	Wohnungsboerse
790	2023-11-06 13:30:45+01	33392135	Wohnungsboerse
1590	2023-11-06 13:30:47+01	33446138	Wohnungsboerse
1050	2023-11-06 13:30:50+01	33446276	Wohnungsboerse
1620	2023-11-06 13:30:52+01	33343707	Wohnungsboerse
1270	2023-11-06 13:30:55+01	33373985	Wohnungsboerse
800	2023-11-06 13:30:58+01	33440750	Wohnungsboerse
1350	2023-11-06 13:31:00+01	33440756	Wohnungsboerse
2200	2023-11-06 13:31:03+01	33384649	Wohnungsboerse
1750	2023-11-06 13:31:05+01	33448480	Wohnungsboerse
660	2023-11-06 13:31:08+01	33459707	Wohnungsboerse
990	2023-11-06 13:31:10+01	33428344	Wohnungsboerse
1100	2023-11-06 13:31:13+01	33435096	Wohnungsboerse
527	2023-11-06 13:31:16+01	33072500	Wohnungsboerse
490	2023-11-06 13:31:18+01	33444000	Wohnungsboerse
430	2023-11-06 13:31:21+01	33448869	Wohnungsboerse
1150	2023-11-06 13:31:24+01	33449117	Wohnungsboerse
390	2023-11-06 13:31:26+01	33449733	Wohnungsboerse
1000	2023-11-06 13:31:29+01	33449936	Wohnungsboerse
445	2023-11-06 13:31:32+01	33070027	Wohnungsboerse
912	2023-11-06 13:31:35+01	33455190	Wohnungsboerse
735	2023-11-06 13:31:37+01	33460742	Wohnungsboerse
599	2023-11-06 13:31:38+01	33458707	Wohnungsboerse
1296	2023-11-06 13:31:41+01	33462603	Wohnungsboerse
600	2023-11-06 13:31:43+01	33468776	Wohnungsboerse
690	2023-11-06 13:31:45+01	33337558	Wohnungsboerse
850	2023-11-06 13:31:47+01	33203773	Wohnungsboerse
481	2023-11-06 13:31:49+01	33463349	Wohnungsboerse
973	2023-11-06 13:31:52+01	33276394	Wohnungsboerse
687	2023-11-06 13:31:54+01	32235383	Wohnungsboerse
1188	2023-11-06 13:31:57+01	33352052	Wohnungsboerse
622	2023-11-06 13:31:59+01	33355278	Wohnungsboerse
400	2023-11-06 13:32:02+01	33324054	Wohnungsboerse
1290	2023-11-06 13:32:05+01	33306997	Wohnungsboerse
970	2023-11-06 13:32:07+01	33286890	Wohnungsboerse
700	2023-11-06 13:32:09+01	33317345	Wohnungsboerse
589	2023-11-06 13:32:11+01	33376381	Wohnungsboerse
700	2023-11-06 13:32:14+01	33081249	Wohnungsboerse
1491	2023-11-06 13:32:17+01	32856293	Wohnungsboerse
766.98	2023-11-06 13:32:19+01	33254188	Wohnungsboerse
804.44	2023-11-06 13:32:21+01	33457528	Wohnungsboerse
1080	2023-11-06 13:32:24+01	33463402	Wohnungsboerse
2000	2023-11-06 13:32:26+01	32765946	Wohnungsboerse
1350	2023-11-06 13:32:29+01	33329646	Wohnungsboerse
485	2023-11-06 13:32:31+01	33448875	Wohnungsboerse
3490	2023-11-06 13:32:33+01	33451972	Wohnungsboerse
500	2023-11-06 13:32:36+01	33457745	Wohnungsboerse
690	2023-11-06 13:32:39+01	33457971	Wohnungsboerse
950	2023-11-06 13:32:42+01	33458709	Wohnungsboerse
500	2023-11-06 13:32:44+01	33458812	Wohnungsboerse
600	2023-11-06 13:32:47+01	33461948	Wohnungsboerse
2170	2023-11-06 13:32:50+01	33464325	Wohnungsboerse
1210	2023-11-06 13:32:52+01	33465675	Wohnungsboerse
1020	2023-11-06 13:32:55+01	33468731	Wohnungsboerse
520	2023-11-06 13:32:57+01	33468883	Wohnungsboerse
1250	2023-11-06 13:32:59+01	33138839	Wohnungsboerse
1072	2023-11-06 13:33:02+01	33197979	Wohnungsboerse
630	2023-11-06 13:33:04+01	33409137	Wohnungsboerse
2950	2023-11-06 13:33:06+01	33414349	Wohnungsboerse
1080	2023-11-06 13:33:09+01	33427963	Wohnungsboerse
4500	2023-11-06 13:33:12+01	32739183	Wohnungsboerse
1350	2023-11-06 13:33:15+01	33440721	Wohnungsboerse
860	2023-11-06 13:33:16+01	33443881	Wohnungsboerse
1450	2023-11-06 13:33:19+01	33444315	Wohnungsboerse
590	2023-11-06 13:33:22+01	33446197	Wohnungsboerse
610	2023-11-06 13:33:24+01	33451638	Wohnungsboerse
672	2023-11-06 13:33:26+01	33455584	Wohnungsboerse
1050	2023-11-06 13:33:29+01	33460477	Wohnungsboerse
1800	2023-11-06 13:33:32+01	33460518	Wohnungsboerse
590	2023-11-06 13:33:34+01	33443851	Wohnungsboerse
580	2023-11-06 13:33:37+01	33444397	Wohnungsboerse
720	2023-11-06 13:33:42+01	33448579	Wohnungsboerse
750	2023-11-06 13:33:45+01	33452107	Wohnungsboerse
770	2023-11-06 13:33:48+01	33455038	Wohnungsboerse
430	2023-11-06 13:33:49+01	33458727	Wohnungsboerse
400	2023-11-06 13:33:51+01	33459763	Wohnungsboerse
750	2023-11-06 13:33:53+01	33451817	Wohnungsboerse
1100	2023-11-06 13:33:56+01	33463581	Wohnungsboerse
690	2023-11-06 13:33:58+01	33463776	Wohnungsboerse
1195	2023-11-06 13:34:01+01	33451533	Wohnungsboerse
8500	2023-11-09 18:59:02+01	33196281	Wohnungsboerse
1890	2023-11-09 18:59:03+01	32728992	Wohnungsboerse
800	2023-11-09 18:59:06+01	28806724	Wohnungsboerse
1350	2023-11-09 18:59:09+01	33404501	Wohnungsboerse
800	2023-11-09 18:59:12+01	31766932	Wohnungsboerse
529	2023-11-09 18:59:14+01	33465898	Wohnungsboerse
1800	2023-11-09 18:59:17+01	33455594	Wohnungsboerse
800	2023-11-09 18:59:19+01	33450271	Wohnungsboerse
1100	2023-11-09 18:59:23+01	33321367	Wohnungsboerse
853	2023-11-09 18:59:26+01	33463435	Wohnungsboerse
805	2023-11-09 18:59:28+01	32135427	Wohnungsboerse
950	2023-11-09 18:59:29+01	33439144	Wohnungsboerse
1220	2023-11-09 18:59:30+01	33448858	Wohnungsboerse
905	2023-11-09 18:59:33+01	33002502	Wohnungsboerse
1400	2023-11-09 18:59:36+01	33438704	Wohnungsboerse
1450	2023-11-09 19:02:54+01	33223097	Wohnungsboerse
1874	2023-11-09 19:02:56+01	31641965	Wohnungsboerse
1891	2023-11-09 19:02:58+01	32697715	Wohnungsboerse
985	2023-11-09 19:03:00+01	32642467	Wohnungsboerse
1840	2023-11-09 19:03:03+01	32642458	Wohnungsboerse
1777	2023-11-09 19:03:06+01	33163093	Wohnungsboerse
1705	2023-11-09 19:03:09+01	33050991	Wohnungsboerse
2009	2023-11-09 19:03:11+01	32966061	Wohnungsboerse
2590	2023-11-09 19:03:14+01	33354570	Wohnungsboerse
2225	2023-11-09 19:03:17+01	32804194	Wohnungsboerse
943	2023-11-09 19:03:19+01	33391895	Wohnungsboerse
830	2023-11-09 19:03:22+01	33468338	Wohnungsboerse
860	2023-11-09 19:03:25+01	33470837	Wohnungsboerse
660	2023-11-09 19:03:26+01	33477172	Wohnungsboerse
820	2023-11-09 19:06:17+01	33318532	Wohnungsboerse
965	2023-11-09 19:06:17+01	33489268	Wohnungsboerse
1520	2023-11-09 19:06:20+01	33341744	Wohnungsboerse
1430	2023-11-09 19:06:21+01	33355426	Wohnungsboerse
1550	2023-11-09 19:06:24+01	33355443	Wohnungsboerse
1300	2023-11-09 19:06:27+01	33378464	Wohnungsboerse
1250	2023-11-09 19:06:30+01	33366949	Wohnungsboerse
2950	2023-11-09 19:06:32+01	32489228	Wohnungsboerse
1400	2023-11-09 19:06:34+01	33435204	Wohnungsboerse
1049	2023-11-09 19:06:37+01	33443891	Wohnungsboerse
510	2023-11-09 19:06:40+01	33468752	Wohnungsboerse
1400	2023-11-09 19:06:43+01	33471318	Wohnungsboerse
2900	2023-11-09 19:06:46+01	33488078	Wohnungsboerse
2000	2023-11-09 19:10:19+01	32392554	Wohnungsboerse
1320	2023-11-09 19:10:22+01	33449855	Wohnungsboerse
600	2023-11-09 19:10:24+01	32761322	Wohnungsboerse
1200	2023-11-09 19:10:26+01	33462038	Wohnungsboerse
1400	2023-11-09 19:10:29+01	33368188	Wohnungsboerse
1250	2023-11-09 19:10:30+01	33468319	Wohnungsboerse
1250	2023-11-09 19:10:33+01	32498958	Wohnungsboerse
534.6	2023-11-09 19:10:35+01	33475935	Wohnungsboerse
3000	2023-11-09 19:10:38+01	33476234	Wohnungsboerse
1000	2023-11-09 19:10:41+01	33376062	Wohnungsboerse
1600	2023-11-09 19:10:43+01	33489639	Wohnungsboerse
1700	2023-11-09 19:10:46+01	33489806	Wohnungsboerse
1260	2023-11-09 19:10:49+01	33186332	Wohnungsboerse
1050	2023-11-09 19:12:01+01	33498010	Wohnungsboerse
1885.05	2023-11-09 19:12:03+01	33309498	Wohnungsboerse
1236.85	2023-11-09 19:12:04+01	33309495	Wohnungsboerse
700	2023-11-09 19:12:07+01	33331577	Wohnungsboerse
750	2023-11-09 19:12:09+01	33098440	Wohnungsboerse
795	2023-11-09 19:12:12+01	33414347	Wohnungsboerse
2276	2023-11-09 19:12:14+01	33323591	Wohnungsboerse
1082.65	2023-11-09 19:12:16+01	33309501	Wohnungsboerse
1164	2023-11-09 19:12:19+01	33309496	Wohnungsboerse
800	2023-11-09 19:12:22+01	33449758	Wohnungsboerse
510	2023-11-09 19:12:25+01	33463327	Wohnungsboerse
1390	2023-11-09 19:12:27+01	33476560	Wohnungsboerse
470	2023-11-09 19:12:30+01	33481219	Wohnungsboerse
690	2023-11-09 19:12:32+01	33485455	Wohnungsboerse
825	2023-11-09 19:16:24+01	33450133	Wohnungsboerse
665	2023-11-09 19:16:26+01	33464631	Wohnungsboerse
860	2023-11-09 19:16:29+01	33476247	Wohnungsboerse
740	2023-11-09 19:16:31+01	33487539	Wohnungsboerse
483.34	2023-11-09 19:16:33+01	33487740	Wohnungsboerse
579	2023-11-09 19:16:36+01	33493442	Wohnungsboerse
586	2023-11-09 19:16:38+01	33493441	Wohnungsboerse
629	2023-11-09 19:16:41+01	33493438	Wohnungsboerse
586	2023-11-09 19:16:43+01	33493428	Wohnungsboerse
709	2023-11-09 19:16:46+01	33493427	Wohnungsboerse
599	2023-11-09 19:16:49+01	33493446	Wohnungsboerse
636	2023-11-09 19:16:51+01	33493445	Wohnungsboerse
842	2023-11-09 19:16:55+01	33493444	Wohnungsboerse
1190	2023-11-09 19:19:15+01	33477275	Wohnungsboerse
693	2023-11-09 19:19:15+01	33497758	Wohnungsboerse
750	2023-11-09 19:19:17+01	33309447	Wohnungsboerse
940	2023-11-09 19:19:19+01	33254821	Wohnungsboerse
520	2023-11-09 19:19:22+01	33254817	Wohnungsboerse
395	2023-11-09 19:19:25+01	33485207	Wohnungsboerse
1780	2023-11-09 19:19:27+01	33487842	Wohnungsboerse
1790	2023-11-09 19:19:30+01	33488069	Wohnungsboerse
480	2023-11-09 19:19:33+01	33491774	Wohnungsboerse
940	2023-11-09 19:19:35+01	33491804	Wohnungsboerse
620	2023-11-09 19:19:38+01	33491865	Wohnungsboerse
810	2023-11-09 19:19:40+01	33492040	Wohnungsboerse
700	2023-11-09 19:19:41+01	33493785	Wohnungsboerse
520	2023-11-09 19:23:43+01	32995444	Wohnungsboerse
1051.8	2023-11-09 19:23:44+01	33063518	Wohnungsboerse
720	2023-11-09 19:23:47+01	32630083	Wohnungsboerse
788	2023-11-09 19:23:49+01	33299265	Wohnungsboerse
1390	2023-11-09 19:23:52+01	33373146	Wohnungsboerse
630	2023-11-09 19:23:53+01	33341790	Wohnungsboerse
600	2023-11-09 19:23:56+01	33422162	Wohnungsboerse
443	2023-11-09 19:23:59+01	33445882	Wohnungsboerse
539.64	2023-11-09 19:24:01+01	33446081	Wohnungsboerse
888.72	2023-11-09 19:24:04+01	33448755	Wohnungsboerse
500	2023-11-09 19:24:07+01	33476372	Wohnungsboerse
395	2023-11-09 19:24:10+01	33444305	Wohnungsboerse
443	2023-11-09 19:24:11+01	33497347	Wohnungsboerse
1199	2023-11-09 19:24:14+01	33477273	Wohnungsboerse
450	2023-11-09 19:24:17+01	33408980	Wohnungsboerse
2895	2023-11-09 19:27:56+01	33481072	Wohnungsboerse
1000	2023-11-09 19:27:58+01	33484055	Wohnungsboerse
1200	2023-11-09 19:28:00+01	33397714	Wohnungsboerse
1350	2023-11-09 19:28:03+01	33485382	Wohnungsboerse
1080	2023-11-09 19:28:06+01	33487361	Wohnungsboerse
1800	2023-11-09 19:28:09+01	33487416	Wohnungsboerse
500	2023-11-09 19:28:11+01	33489243	Wohnungsboerse
590	2023-11-09 19:28:14+01	33489430	Wohnungsboerse
742	2023-11-09 19:28:17+01	33489455	Wohnungsboerse
1500	2023-11-09 19:28:19+01	31835169	Wohnungsboerse
1990	2023-11-09 19:28:22+01	33497664	Wohnungsboerse
885	2023-11-09 19:28:24+01	33497790	Wohnungsboerse
550	2023-11-09 19:28:27+01	33440362	Wohnungsboerse
1300	2023-11-09 19:29:52+01	31823448	Wohnungsboerse
700	2023-11-09 19:29:53+01	33477583	Wohnungsboerse
720	2023-11-09 19:29:56+01	33477711	Wohnungsboerse
620	2023-11-09 19:29:57+01	33097028	Wohnungsboerse
1190	2023-11-09 19:29:59+01	33466040	Wohnungsboerse
589	2023-11-09 19:30:02+01	33479704	Wohnungsboerse
1060	2023-11-09 19:30:04+01	33481648	Wohnungsboerse
939	2023-11-09 19:30:06+01	33484955	Wohnungsboerse
451	2023-11-09 19:30:07+01	33485647	Wohnungsboerse
690	2023-11-09 19:30:10+01	33075428	Wohnungsboerse
550	2023-11-09 19:30:13+01	33495711	Wohnungsboerse
980	2023-11-09 19:30:15+01	33495909	Wohnungsboerse
590	2023-11-09 19:30:18+01	33495917	Wohnungsboerse
590	2023-11-09 19:30:21+01	33495916	Wohnungsboerse
690	2023-11-09 19:30:23+01	33495915	Wohnungsboerse
650	2023-11-09 19:33:22+01	33495913	Wohnungsboerse
1200	2023-11-09 19:33:22+01	33495914	Wohnungsboerse
870	2023-11-09 19:33:25+01	33457765	Wohnungsboerse
1150	2023-11-09 19:33:27+01	33416750	Wohnungsboerse
900	2023-11-09 19:33:29+01	33460413	Wohnungsboerse
1900	2023-11-09 19:33:32+01	33464724	Wohnungsboerse
630	2023-11-09 19:33:35+01	33121759	Wohnungsboerse
896	2023-11-09 19:33:37+01	33380713	Wohnungsboerse
1656	2023-11-09 19:33:39+01	33477540	Wohnungsboerse
1027	2023-11-09 19:33:41+01	33404414	Wohnungsboerse
595	2023-11-09 19:33:44+01	33481234	Wohnungsboerse
3232	2023-11-09 19:33:46+01	33483666	Wohnungsboerse
1495	2023-11-09 19:33:49+01	33484043	Wohnungsboerse
1268	2023-11-09 19:33:52+01	33468702	Wohnungsboerse
565	2023-11-09 19:37:35+01	33495788	Wohnungsboerse
978	2023-11-09 19:37:37+01	33497487	Wohnungsboerse
580	2023-11-09 19:37:39+01	33468444	Wohnungsboerse
1210	2023-11-09 19:37:42+01	33331619	Wohnungsboerse
1100	2023-11-09 19:37:45+01	27065153	Wohnungsboerse
880	2023-11-09 19:37:47+01	33479709	Wohnungsboerse
300	2023-11-09 19:37:49+01	33483615	Wohnungsboerse
270	2023-11-09 19:37:51+01	33484993	Wohnungsboerse
744	2023-11-09 19:37:54+01	33485222	Wohnungsboerse
900	2023-11-09 19:37:57+01	33278540	Wohnungsboerse
584.25	2023-11-09 19:37:58+01	33492070	Wohnungsboerse
1100	2023-11-09 19:38:00+01	33491896	Wohnungsboerse
1500	2023-11-09 19:38:03+01	33493246	Wohnungsboerse
640	2023-11-09 19:38:05+01	33444302	Wohnungsboerse
670	2023-11-09 19:38:07+01	33495525	Wohnungsboerse
500	2023-11-09 19:38:10+01	33495653	Wohnungsboerse
3250	2023-11-09 19:38:12+01	33114294	Wohnungsboerse
1610	2023-11-09 19:38:15+01	32875836	Wohnungsboerse
2080	2023-11-09 19:38:17+01	32877350	Wohnungsboerse
1950	2023-11-09 19:38:20+01	33308983	Wohnungsboerse
1950	2023-11-09 19:38:22+01	33320934	Wohnungsboerse
655	2023-11-09 19:38:25+01	33378454	Wohnungsboerse
1100	2023-11-09 19:38:28+01	33397960	Wohnungsboerse
1100	2023-11-09 19:38:30+01	33008456	Wohnungsboerse
505	2023-11-09 19:38:32+01	33480003	Wohnungsboerse
1850	2023-11-09 19:38:34+01	33404509	Wohnungsboerse
990	2023-11-09 19:38:36+01	33404504	Wohnungsboerse
900	2023-11-09 19:38:37+01	33487975	Wohnungsboerse
1550	2023-11-09 19:38:40+01	33489083	Wohnungsboerse
1350	2023-11-09 19:41:45+01	33489271	Wohnungsboerse
860	2023-11-09 19:41:47+01	33489596	Wohnungsboerse
690	2023-11-09 19:41:49+01	33489705	Wohnungsboerse
1050	2023-11-09 19:41:52+01	33489715	Wohnungsboerse
330	2023-11-09 19:41:55+01	33489828	Wohnungsboerse
1100	2023-11-09 19:41:57+01	33489822	Wohnungsboerse
670	2023-11-09 19:42:00+01	33492194	Wohnungsboerse
600	2023-11-09 19:42:02+01	33264735	Wohnungsboerse
620	2023-11-09 19:42:05+01	33493593	Wohnungsboerse
1480	2023-11-09 19:42:08+01	33497707	Wohnungsboerse
1640	2023-11-09 19:42:10+01	33380525	Wohnungsboerse
800	2023-11-09 19:42:13+01	33086103	Wohnungsboerse
676.82	2023-11-09 19:45:42+01	33435042	Wohnungsboerse
1280	2023-11-09 19:45:44+01	33449731	Wohnungsboerse
600	2023-11-09 19:45:47+01	33464772	Wohnungsboerse
1420	2023-11-09 19:45:50+01	33473113	Wohnungsboerse
810	2023-11-09 19:45:52+01	33254648	Wohnungsboerse
412	2023-11-09 19:45:55+01	33381820	Wohnungsboerse
950	2023-11-09 19:45:57+01	33298728	Wohnungsboerse
2200	2023-11-09 19:45:59+01	33344012	Wohnungsboerse
595	2023-11-09 19:46:02+01	33254812	Wohnungsboerse
1890	2023-11-09 19:46:04+01	32728991	Wohnungsboerse
1790	2023-11-09 19:46:07+01	32728990	Wohnungsboerse
900	2023-11-09 19:46:10+01	33444179	Wohnungsboerse
2086.5	2023-11-09 19:49:52+01	33473690	Wohnungsboerse
1200	2023-11-09 19:49:53+01	33027861	Wohnungsboerse
930	2023-11-09 19:49:55+01	33147363	Wohnungsboerse
1550	2023-11-09 19:49:57+01	32853522	Wohnungsboerse
1850	2023-11-09 19:49:59+01	33196527	Wohnungsboerse
600	2023-11-09 19:50:01+01	33254461	Wohnungsboerse
2770	2023-11-09 19:50:04+01	33347939	Wohnungsboerse
4205.76	2023-11-09 19:50:05+01	33360939	Wohnungsboerse
1800	2023-11-09 19:50:08+01	32817541	Wohnungsboerse
1379.88	2023-11-09 19:50:11+01	33445819	Wohnungsboerse
1684.63	2023-11-09 19:50:13+01	33445857	Wohnungsboerse
1135	2023-11-09 19:50:16+01	33446074	Wohnungsboerse
2200	2023-11-09 19:50:18+01	33422321	Wohnungsboerse
2950	2023-11-09 19:50:20+01	33455178	Wohnungsboerse
650	2023-11-09 19:50:23+01	33458840	Wohnungsboerse
392	2023-11-09 19:53:51+01	33466189	Wohnungsboerse
690	2023-11-09 19:53:52+01	33483786	Wohnungsboerse
280	2023-11-09 19:53:55+01	33497048	Wohnungsboerse
1081	2023-11-09 19:53:57+01	33432833	Wohnungsboerse
840	2023-11-09 19:54:00+01	33313054	Wohnungsboerse
750	2023-11-09 19:54:03+01	33497134	Wohnungsboerse
709	2023-11-09 19:54:05+01	33493443	Wohnungsboerse
1400	2023-11-09 19:54:08+01	33435206	Wohnungsboerse
737	2023-11-09 19:54:10+01	33495937	Wohnungsboerse
1040	2023-11-09 19:58:12+01	33459669	Wohnungsboerse
423	2023-11-09 19:58:13+01	33438544	Wohnungsboerse
1850	2023-11-09 20:01:47+01	33080272	Wohnungsboerse
498.36	2023-11-09 20:01:49+01	31818244	Wohnungsboerse
687	2023-11-09 20:01:52+01	33455338	Wohnungsboerse
920	2023-11-09 20:01:55+01	32918930	Wohnungsboerse
1900	2023-11-09 20:01:58+01	31394882	Wohnungsboerse
685	2023-11-09 20:02:00+01	33259837	Wohnungsboerse
3000	2023-11-09 20:02:02+01	31827401	Wohnungsboerse
1450	2023-11-09 20:02:04+01	32375748	Wohnungsboerse
593.87	2023-11-09 20:02:07+01	33337302	Wohnungsboerse
695	2023-11-09 20:02:08+01	33473469	Wohnungsboerse
580	2023-11-09 20:02:10+01	33487594	Wohnungsboerse
1205	2023-11-09 20:02:12+01	27088008	Wohnungsboerse
952	2023-11-09 20:02:13+01	30952139	Wohnungsboerse
491.81	2023-11-09 20:02:16+01	33321218	Wohnungsboerse
1450	2023-11-09 20:02:19+01	32876901	Wohnungsboerse
1550	2023-11-09 20:05:36+01	33438599	Wohnungsboerse
1200	2023-11-09 20:05:37+01	33449976	Wohnungsboerse
1400	2023-11-09 20:05:40+01	33424468	Wohnungsboerse
1380	2023-11-09 20:05:42+01	33401965	Wohnungsboerse
920	2023-11-09 20:05:45+01	29314952	Wohnungsboerse
650	2023-11-09 20:05:47+01	29317989	Wohnungsboerse
1200	2023-11-09 20:05:50+01	29631528	Wohnungsboerse
1050	2023-11-09 20:05:53+01	33440863	Wohnungsboerse
880	2023-11-09 20:05:56+01	33444495	Wohnungsboerse
650	2023-11-09 20:05:59+01	33451641	Wohnungsboerse
750	2023-11-09 20:06:01+01	33451892	Wohnungsboerse
1330	2023-11-09 20:06:04+01	33452188	Wohnungsboerse
1785	2023-11-09 20:06:06+01	33245396	Wohnungsboerse
1116.17	2023-11-09 20:10:00+01	33274310	Wohnungsboerse
980	2023-11-09 20:10:00+01	33485232	Wohnungsboerse
730	2023-11-09 20:10:03+01	33495322	Wohnungsboerse
1331	2023-11-09 20:10:06+01	33248616	Wohnungsboerse
4200	2023-11-09 20:10:08+01	33320901	Wohnungsboerse
1795	2023-11-09 20:10:10+01	33279878	Wohnungsboerse
500	2023-11-09 20:10:13+01	33365152	Wohnungsboerse
1300	2023-11-09 20:10:15+01	33439057	Wohnungsboerse
1210	2023-11-09 20:10:17+01	33439064	Wohnungsboerse
839	2023-11-09 20:10:21+01	33451956	Wohnungsboerse
1340	2023-11-09 20:10:23+01	33462779	Wohnungsboerse
740	2023-11-09 20:10:26+01	33464465	Wohnungsboerse
1895	2023-11-09 20:10:28+01	33227368	Wohnungsboerse
1495	2023-11-09 20:10:30+01	33200036	Wohnungsboerse
1086	2023-11-09 20:13:39+01	33267257	Wohnungsboerse
810	2023-11-09 20:13:41+01	33439071	Wohnungsboerse
1100	2023-11-09 20:13:43+01	31675590	Wohnungsboerse
2500	2023-11-09 20:13:46+01	32188005	Wohnungsboerse
1168.83	2023-11-09 20:13:49+01	33384509	Wohnungsboerse
470	2023-11-09 20:13:51+01	31983080	Wohnungsboerse
684	2023-11-09 20:13:53+01	27035171	Wohnungsboerse
1348	2023-11-09 20:13:55+01	33425850	Wohnungsboerse
1064	2023-11-09 20:13:58+01	32820355	Wohnungsboerse
1249	2023-11-09 20:14:00+01	33473842	Wohnungsboerse
1300	2023-11-09 20:14:02+01	33455197	Wohnungsboerse
1066	2023-11-09 20:14:05+01	33449817	Wohnungsboerse
1300	2023-11-09 20:14:08+01	33450160	Wohnungsboerse
1089.27	2023-11-09 20:14:10+01	33196576	Wohnungsboerse
1272.31	2023-11-09 20:16:10+01	33479730	Wohnungsboerse
1262.17	2023-11-09 20:16:12+01	33450063	Wohnungsboerse
770.57	2023-11-09 20:16:14+01	33331984	Wohnungsboerse
828.2	2023-11-09 20:16:16+01	33396009	Wohnungsboerse
839.16	2023-11-09 20:16:19+01	33402808	Wohnungsboerse
623.31	2023-11-09 20:16:20+01	33457517	Wohnungsboerse
2650	2023-11-09 20:16:23+01	32917983	Wohnungsboerse
2600	2023-11-09 20:16:26+01	33129082	Wohnungsboerse
1900	2023-11-09 20:16:29+01	32952241	Wohnungsboerse
850	2023-11-09 20:16:32+01	33352134	Wohnungsboerse
630	2023-11-09 20:16:34+01	33237999	Wohnungsboerse
790	2023-11-09 20:16:37+01	33448923	Wohnungsboerse
2700	2023-11-09 20:16:40+01	33449689	Wohnungsboerse
1450	2023-11-09 20:16:42+01	33454997	Wohnungsboerse
720	2023-11-09 20:16:44+01	33487464	Wohnungsboerse
560	2023-11-09 20:16:47+01	33487702	Wohnungsboerse
925	2023-11-09 20:16:49+01	33343712	Wohnungsboerse
870	2023-11-09 20:16:51+01	33347483	Wohnungsboerse
710	2023-11-09 20:16:54+01	33471079	Wohnungsboerse
785	2023-11-09 20:16:56+01	33468770	Wohnungsboerse
800	2023-11-09 20:16:59+01	32683285	Wohnungsboerse
830	2023-11-09 20:17:01+01	33354625	Wohnungsboerse
840	2023-11-09 20:17:03+01	33389516	Wohnungsboerse
820	2023-11-09 20:17:06+01	33394176	Wohnungsboerse
610.44	2023-11-09 20:17:08+01	33400003	Wohnungsboerse
880	2023-11-09 20:17:10+01	33303860	Wohnungsboerse
825	2023-11-09 20:17:12+01	33424042	Wohnungsboerse
730	2023-11-09 20:17:15+01	33439120	Wohnungsboerse
720	2023-11-09 20:17:18+01	33465765	Wohnungsboerse
495	2023-11-09 20:17:20+01	33465771	Wohnungsboerse
447	2023-11-09 20:17:23+01	33471014	Wohnungsboerse
1050	2023-11-09 20:17:26+01	33487761	Wohnungsboerse
1035	2023-11-09 20:17:27+01	33393636	Wohnungsboerse
798	2023-11-09 20:17:29+01	33493229	Wohnungsboerse
750	2023-11-09 20:17:32+01	33217523	Wohnungsboerse
1038.8	2023-11-09 20:17:34+01	32904956	Wohnungsboerse
1900	2023-11-09 20:17:37+01	33288206	Wohnungsboerse
1500	2023-11-09 20:17:40+01	33386349	Wohnungsboerse
1498	2023-11-09 20:17:42+01	33393958	Wohnungsboerse
1600	2023-11-09 20:17:45+01	33413993	Wohnungsboerse
2200	2023-11-09 20:17:48+01	33422243	Wohnungsboerse
1270	2023-11-09 20:17:50+01	33424200	Wohnungsboerse
709	2023-11-09 20:17:51+01	33424462	Wohnungsboerse
1550	2023-11-09 20:17:53+01	33426095	Wohnungsboerse
656	2023-11-09 20:17:56+01	33355109	Wohnungsboerse
1034	2023-11-09 20:17:59+01	33440758	Wohnungsboerse
1005.4	2023-11-09 20:18:01+01	32816215	Wohnungsboerse
840	2023-11-09 20:18:03+01	33495564	Wohnungsboerse
970	2023-11-09 20:18:06+01	33495876	Wohnungsboerse
440	2023-11-09 20:18:09+01	33438593	Wohnungsboerse
839	2023-11-09 20:18:12+01	33409168	Wohnungsboerse
889	2023-11-09 20:18:15+01	33343992	Wohnungsboerse
1500	2023-11-09 20:18:17+01	33451563	Wohnungsboerse
869	2023-11-09 20:18:20+01	33343999	Wohnungsboerse
1050	2023-11-09 20:18:23+01	33473152	Wohnungsboerse
538.03	2023-11-09 20:18:25+01	33476079	Wohnungsboerse
902.96	2023-11-09 20:18:28+01	33476080	Wohnungsboerse
980	2023-11-09 20:18:31+01	33480068	Wohnungsboerse
475	2023-11-09 20:18:32+01	33487614	Wohnungsboerse
999	2023-11-09 20:18:35+01	33487613	Wohnungsboerse
829	2023-11-09 20:18:37+01	33487610	Wohnungsboerse
636	2023-11-09 20:18:40+01	33487646	Wohnungsboerse
1197.48	2023-11-09 20:18:42+01	33435007	Wohnungsboerse
250	2023-11-09 20:18:45+01	33492140	Wohnungsboerse
1600	2023-11-09 20:19:21+01	33497091	Wohnungsboerse
656	2023-11-09 20:19:24+01	33485395	Wohnungsboerse
580	2023-11-09 20:19:26+01	33444397	Wohnungsboerse
672	2023-11-09 20:19:27+01	33455584	Wohnungsboerse
1550	2023-11-09 20:19:28+01	33178259	Wohnungsboerse
804.44	2023-11-09 20:19:31+01	33457528	Wohnungsboerse
614	2023-11-09 20:19:32+01	33051217	Wohnungsboerse
1296	2023-11-09 20:19:34+01	33462603	Wohnungsboerse
810.81	2023-11-09 20:19:37+01	33002621	Wohnungsboerse
1620	2023-11-09 20:19:39+01	32977516	Wohnungsboerse
950	2023-11-09 20:19:41+01	33471247	Wohnungsboerse
1790	2023-11-09 20:19:44+01	31571982	Wohnungsboerse
995	2023-11-09 20:19:46+01	33093225	Wohnungsboerse
590	2023-11-09 20:19:49+01	26800673	Wohnungsboerse
1562	2023-11-09 20:19:52+01	32803920	Wohnungsboerse
520	2023-11-09 20:19:54+01	33345380	Wohnungsboerse
465.65	2023-11-09 20:19:55+01	33254653	Wohnungsboerse
640	2023-11-09 20:19:58+01	33299372	Wohnungsboerse
735	2023-11-09 20:20:01+01	33347299	Wohnungsboerse
947.16	2023-11-09 20:20:03+01	33304400	Wohnungsboerse
834.97	2023-11-09 20:20:06+01	33432772	Wohnungsboerse
752.77	2023-11-09 20:20:08+01	33432779	Wohnungsboerse
1390.5	2023-11-09 20:20:10+01	33479536	Wohnungsboerse
720	2023-11-09 20:20:13+01	33488089	Wohnungsboerse
784	2023-11-09 20:20:15+01	33347397	Wohnungsboerse
575	2023-11-09 20:20:17+01	33414192	Wohnungsboerse
680	2023-11-09 20:20:20+01	33428288	Wohnungsboerse
811.2	2023-11-09 20:20:22+01	33434998	Wohnungsboerse
1075	2023-11-09 20:20:25+01	33458750	Wohnungsboerse
610	2023-11-09 20:20:28+01	33458773	Wohnungsboerse
710	2023-11-09 20:20:30+01	33463341	Wohnungsboerse
600	2023-11-09 20:20:32+01	33473627	Wohnungsboerse
1000	2023-11-09 20:20:35+01	33476261	Wohnungsboerse
1250	2023-11-09 20:20:37+01	33481343	Wohnungsboerse
880	2023-11-09 20:20:40+01	33487856	Wohnungsboerse
520	2023-11-09 20:20:42+01	33493220	Wohnungsboerse
600	2023-11-09 20:20:45+01	33493371	Wohnungsboerse
715	2023-11-09 20:20:48+01	33493239	Wohnungsboerse
875	2023-11-09 20:20:51+01	33360820	Wohnungsboerse
900	2023-11-09 20:20:53+01	33415998	Wohnungsboerse
730	2023-11-09 20:20:56+01	33480183	Wohnungsboerse
1750	2023-11-09 20:20:58+01	33489270	Wohnungsboerse
2500	2023-11-09 20:21:01+01	32817705	Wohnungsboerse
810	2023-11-09 20:21:03+01	33198024	Wohnungsboerse
1400	2023-11-09 20:21:06+01	33201711	Wohnungsboerse
864	2023-11-09 20:21:08+01	33203387	Wohnungsboerse
2500	2023-11-09 20:21:11+01	33203372	Wohnungsboerse
850	2023-11-09 20:21:14+01	33213161	Wohnungsboerse
950	2023-11-09 20:21:16+01	33333966	Wohnungsboerse
890	2023-11-09 20:21:17+01	33103145	Wohnungsboerse
1140	2023-11-09 20:21:19+01	33438640	Wohnungsboerse
750	2023-11-09 20:21:21+01	33445814	Wohnungsboerse
670	2023-11-09 20:21:24+01	33471198	Wohnungsboerse
614	2023-11-09 20:21:26+01	33487615	Wohnungsboerse
511	2023-11-09 20:21:29+01	33487617	Wohnungsboerse
692	2023-11-09 20:21:31+01	33274520	Wohnungsboerse
1200	2023-11-09 20:21:34+01	33337352	Wohnungsboerse
1568.43	2023-11-09 20:21:37+01	33402892	Wohnungsboerse
1600	2023-11-09 20:21:38+01	33471372	Wohnungsboerse
735	2023-11-09 20:21:40+01	33480109	Wohnungsboerse
1150	2023-11-09 20:21:43+01	33485043	Wohnungsboerse
850	2023-11-09 20:21:46+01	33491762	Wohnungsboerse
2560	2023-11-09 20:21:48+01	33493623	Wohnungsboerse
795	2023-11-09 20:21:50+01	33435950	Wohnungsboerse
1199	2023-11-09 20:21:52+01	33439092	Wohnungsboerse
820	2023-11-09 20:21:54+01	33434842	Wohnungsboerse
751.66	2023-11-09 20:21:56+01	33457539	Wohnungsboerse
550	2023-11-09 20:21:58+01	33470964	Wohnungsboerse
1500	2023-11-09 20:22:00+01	33471343	Wohnungsboerse
805	2023-11-09 20:22:03+01	33479705	Wohnungsboerse
640	2023-11-09 20:22:05+01	33480104	Wohnungsboerse
700	2023-11-09 20:22:08+01	33485071	Wohnungsboerse
1185	2023-11-09 20:22:10+01	32705183	Wohnungsboerse
450	2023-11-09 20:22:13+01	33492245	Wohnungsboerse
830	2023-11-09 20:22:15+01	33367045	Wohnungsboerse
1590	2023-11-09 20:22:17+01	29486814	Wohnungsboerse
740	2023-11-09 20:22:20+01	33497613	Wohnungsboerse
510	2023-11-09 20:22:22+01	33323829	Wohnungsboerse
720	2023-11-09 20:22:24+01	33476224	Wohnungsboerse
470	2023-11-09 20:22:26+01	33477756	Wohnungsboerse
1690	2023-11-09 20:22:27+01	33444203	Wohnungsboerse
1400	2023-11-09 20:22:30+01	33481303	Wohnungsboerse
380	2023-11-09 20:22:33+01	33481527	Wohnungsboerse
3200	2023-11-09 20:22:36+01	33460382	Wohnungsboerse
835	2023-11-09 20:22:38+01	33455159	Wohnungsboerse
539	2023-11-09 20:22:40+01	33491973	Wohnungsboerse
780	2023-11-09 20:22:42+01	33492180	Wohnungsboerse
2150	2023-11-09 20:22:44+01	33493198	Wohnungsboerse
732	2023-11-09 20:22:46+01	33493408	Wohnungsboerse
740	2023-11-09 20:22:48+01	33493520	Wohnungsboerse
420	2023-11-09 20:22:51+01	33493606	Wohnungsboerse
1610	2023-11-09 20:22:54+01	32977500	Wohnungsboerse
1449	2023-11-09 20:22:57+01	33248782	Wohnungsboerse
1560	2023-11-09 20:23:00+01	32977503	Wohnungsboerse
1190	2023-11-09 20:23:03+01	32080605	Wohnungsboerse
2124	2023-11-09 20:23:04+01	33401670	Wohnungsboerse
1278	2023-11-09 20:23:05+01	33401864	Wohnungsboerse
1400	2023-11-09 20:23:06+01	33389603	Wohnungsboerse
1350	2023-11-09 20:23:08+01	33416558	Wohnungsboerse
1150	2023-11-09 20:23:11+01	33429247	Wohnungsboerse
1620	2023-11-09 20:23:14+01	33343707	Wohnungsboerse
1200	2023-11-09 20:23:16+01	33475867	Wohnungsboerse
790	2023-11-09 20:23:19+01	33392135	Wohnungsboerse
795	2023-11-09 20:23:20+01	33089879	Wohnungsboerse
1350	2023-11-09 20:23:22+01	33497192	Wohnungsboerse
800	2023-11-09 20:23:24+01	33440750	Wohnungsboerse
1350	2023-11-09 20:23:26+01	33440756	Wohnungsboerse
1750	2023-11-09 20:23:29+01	33448480	Wohnungsboerse
660	2023-11-09 20:23:32+01	33459707	Wohnungsboerse
600	2023-11-09 20:23:35+01	33468776	Wohnungsboerse
1150	2023-11-09 20:23:36+01	33473146	Wohnungsboerse
735	2023-11-09 20:23:39+01	33460742	Wohnungsboerse
585.65	2023-11-09 20:23:42+01	33479633	Wohnungsboerse
620	2023-11-09 20:23:44+01	33479794	Wohnungsboerse
900	2023-11-09 20:23:47+01	33479828	Wohnungsboerse
912	2023-11-09 20:23:49+01	33479930	Wohnungsboerse
600	2023-11-09 20:23:52+01	33477228	Wohnungsboerse
850	2023-11-09 20:23:54+01	33481128	Wohnungsboerse
1368.44	2023-11-09 20:23:57+01	33145677	Wohnungsboerse
1100	2023-11-09 20:24:00+01	33483866	Wohnungsboerse
900	2023-11-09 20:24:03+01	33484007	Wohnungsboerse
660	2023-11-09 20:24:06+01	33487524	Wohnungsboerse
490	2023-11-09 20:24:08+01	33495369	Wohnungsboerse
690	2023-11-09 20:24:10+01	33337558	Wohnungsboerse
850	2023-11-09 20:24:12+01	33203773	Wohnungsboerse
481	2023-11-09 20:24:14+01	33463349	Wohnungsboerse
1080	2023-11-09 20:24:16+01	33463402	Wohnungsboerse
560	2023-11-09 20:24:19+01	33473077	Wohnungsboerse
1200	2023-11-09 20:24:22+01	33475843	Wohnungsboerse
1500	2023-11-09 20:24:25+01	33470930	Wohnungsboerse
422.89	2023-11-09 20:24:27+01	33481220	Wohnungsboerse
1300	2023-11-09 20:24:30+01	33481831	Wohnungsboerse
1060	2023-11-09 20:24:32+01	33481808	Wohnungsboerse
850	2023-11-09 20:24:34+01	33485714	Wohnungsboerse
759	2023-11-09 20:24:37+01	33095129	Wohnungsboerse
1190	2023-11-09 20:24:39+01	32772403	Wohnungsboerse
523.66	2023-11-09 20:24:40+01	33489488	Wohnungsboerse
593.38	2023-11-09 20:24:43+01	33493230	Wohnungsboerse
570.85	2023-11-09 20:24:45+01	33493584	Wohnungsboerse
795	2023-11-09 20:24:47+01	33495874	Wohnungsboerse
950	2023-11-09 20:24:49+01	33458709	Wohnungsboerse
1160	2023-11-09 20:24:52+01	33481197	Wohnungsboerse
1637.02	2023-11-09 20:24:54+01	33481347	Wohnungsboerse
3500	2023-11-09 20:24:57+01	33481357	Wohnungsboerse
2000	2023-11-09 20:25:00+01	32765946	Wohnungsboerse
1950	2023-11-09 20:25:03+01	33481733	Wohnungsboerse
450	2023-11-09 20:25:04+01	33481763	Wohnungsboerse
485	2023-11-09 20:25:07+01	33448875	Wohnungsboerse
465	2023-11-09 20:25:09+01	33484110	Wohnungsboerse
1044	2023-11-09 20:25:12+01	33484223	Wohnungsboerse
1272	2023-11-09 20:25:15+01	33487443	Wohnungsboerse
550	2023-11-09 20:25:17+01	32896331	Wohnungsboerse
694	2023-11-09 20:25:19+01	33492069	Wohnungsboerse
1250	2023-11-09 20:25:22+01	33492298	Wohnungsboerse
1050	2023-11-09 20:25:24+01	33460477	Wohnungsboerse
1800	2023-11-09 20:25:26+01	33460518	Wohnungsboerse
1181	2023-11-09 20:25:29+01	33470875	Wohnungsboerse
1080	2023-11-09 20:25:32+01	33471054	Wohnungsboerse
1100	2023-11-09 20:25:35+01	33473299	Wohnungsboerse
1300	2023-11-09 20:25:38+01	33477460	Wohnungsboerse
1072	2023-11-09 20:25:40+01	33197979	Wohnungsboerse
3900	2023-11-09 20:25:42+01	33481349	Wohnungsboerse
2300	2023-11-09 20:25:44+01	33487668	Wohnungsboerse
1647	2023-11-09 20:25:47+01	33485025	Wohnungsboerse
1580	2023-11-09 20:28:18+01	33489966	Wohnungsboerse
1450	2023-11-09 20:28:20+01	33444315	Wohnungsboerse
1500	2023-11-09 20:28:24+01	33497983	Wohnungsboerse
750	2023-11-09 20:28:26+01	33497987	Wohnungsboerse
685	2023-11-09 20:28:29+01	33477795	Wohnungsboerse
720	2023-11-09 20:28:31+01	33448579	Wohnungsboerse
990	2023-11-09 20:28:34+01	33479487	Wohnungsboerse
400	2023-11-09 20:28:36+01	33481091	Wohnungsboerse
995	2023-11-09 20:28:38+01	33484313	Wohnungsboerse
750	2023-11-09 20:28:41+01	33487334	Wohnungsboerse
1500	2023-11-09 20:28:43+01	33344120	Wohnungsboerse
765	2023-11-09 20:28:44+01	33344119	Wohnungsboerse
810	2023-11-09 20:28:46+01	33344117	Wohnungsboerse
1581	2023-11-09 20:28:48+01	33149772	Wohnungsboerse
990	2023-11-09 20:31:53+01	33298445	Wohnungsboerse
1850	2023-11-13 12:03:01+01	33196527	Wohnungsboerse
1890	2023-11-13 12:03:04+01	32728992	Wohnungsboerse
800	2023-11-13 12:03:06+01	28806724	Wohnungsboerse
1800	2023-11-13 12:03:08+01	33500514	Wohnungsboerse
800	2023-11-13 12:03:11+01	31766932	Wohnungsboerse
1500	2023-11-13 12:03:14+01	33493246	Wohnungsboerse
1268	2023-11-13 12:03:16+01	33468702	Wohnungsboerse
1060	2023-11-13 12:03:18+01	33481648	Wohnungsboerse
1100	2023-11-13 12:03:20+01	33321367	Wohnungsboerse
1990	2023-11-13 12:03:22+01	33501649	Wohnungsboerse
805	2023-11-13 12:03:25+01	32135427	Wohnungsboerse
650	2023-11-13 12:03:28+01	33284573	Wohnungsboerse
700	2023-11-13 12:03:31+01	33331577	Wohnungsboerse
1600	2023-11-13 12:03:33+01	33489639	Wohnungsboerse
1700	2023-11-13 12:03:35+01	31549941	Wohnungsboerse
1874	2023-11-13 12:03:38+01	31641965	Wohnungsboerse
1891	2023-11-13 12:03:41+01	32697715	Wohnungsboerse
985	2023-11-13 12:03:53+01	32642467	Wohnungsboerse
1840	2023-11-13 12:04:01+01	32642458	Wohnungsboerse
2225	2023-11-13 12:04:03+01	32804194	Wohnungsboerse
2009	2023-11-13 12:04:03+01	32966061	Wohnungsboerse
1705	2023-11-13 12:04:03+01	33050991	Wohnungsboerse
2590	2023-11-13 12:04:03+01	33354570	Wohnungsboerse
860	2023-11-13 12:04:03+01	33470837	Wohnungsboerse
1777	2023-11-13 12:04:04+01	33163093	Wohnungsboerse
943	2023-11-13 12:04:05+01	33391895	Wohnungsboerse
830	2023-11-13 12:04:05+01	33468338	Wohnungsboerse
660	2023-11-13 12:04:05+01	33477172	Wohnungsboerse
965	2023-11-13 12:04:08+01	33489268	Wohnungsboerse
820	2023-11-13 12:04:10+01	33318532	Wohnungsboerse
1520	2023-11-13 12:04:13+01	33341744	Wohnungsboerse
1430	2023-11-13 12:04:15+01	33355426	Wohnungsboerse
1550	2023-11-13 12:04:18+01	33355443	Wohnungsboerse
1300	2023-11-13 12:04:20+01	33378464	Wohnungsboerse
1250	2023-11-13 12:04:22+01	33366949	Wohnungsboerse
2950	2023-11-13 12:04:23+01	32489228	Wohnungsboerse
1400	2023-11-13 12:04:26+01	33435204	Wohnungsboerse
1049	2023-11-13 12:04:29+01	33443891	Wohnungsboerse
510	2023-11-13 12:04:31+01	33468752	Wohnungsboerse
1400	2023-11-13 12:04:34+01	33471318	Wohnungsboerse
737	2023-11-13 12:04:37+01	33495937	Wohnungsboerse
1400	2023-11-13 12:04:39+01	33435206	Wohnungsboerse
1450	2023-11-13 12:04:42+01	33506206	Wohnungsboerse
1700	2023-11-13 12:04:45+01	33489806	Wohnungsboerse
1260	2023-11-13 12:04:47+01	33186332	Wohnungsboerse
1050	2023-11-13 12:04:49+01	33498010	Wohnungsboerse
990	2023-11-13 12:04:51+01	33378242	Wohnungsboerse
2650	2023-11-13 12:04:53+01	33504518	Wohnungsboerse
1200	2023-11-13 12:04:55+01	33506668	Wohnungsboerse
1390	2023-11-13 12:04:57+01	33504374	Wohnungsboerse
1320	2023-11-13 12:05:00+01	33449855	Wohnungsboerse
1500	2023-11-13 12:05:03+01	33510346	Wohnungsboerse
1250	2023-11-13 12:05:05+01	33386763	Wohnungsboerse
1250	2023-11-13 12:05:07+01	33468319	Wohnungsboerse
1400	2023-11-13 12:05:10+01	33368188	Wohnungsboerse
1000	2023-11-13 12:05:12+01	33515589	Wohnungsboerse
870	2023-11-13 12:05:15+01	33186331	Wohnungsboerse
795	2023-11-13 12:05:16+01	33414347	Wohnungsboerse
2276	2023-11-13 12:05:19+01	33323591	Wohnungsboerse
1082.65	2023-11-13 12:05:21+01	33309501	Wohnungsboerse
1164	2023-11-13 12:05:23+01	33309496	Wohnungsboerse
800	2023-11-13 12:05:26+01	33449758	Wohnungsboerse
1390	2023-11-13 12:05:28+01	33476560	Wohnungsboerse
470	2023-11-13 12:05:30+01	33481219	Wohnungsboerse
690	2023-11-13 12:05:32+01	33485455	Wohnungsboerse
825	2023-11-13 12:05:35+01	33450133	Wohnungsboerse
826	2023-11-13 12:05:37+01	33500727	Wohnungsboerse
990	2023-11-13 12:05:40+01	33504339	Wohnungsboerse
600	2023-11-13 12:05:42+01	33506771	Wohnungsboerse
1199	2023-11-13 12:05:45+01	33513521	Wohnungsboerse
890	2023-11-13 12:05:48+01	33514376	Wohnungsboerse
750	2023-11-13 12:05:51+01	33347563	Wohnungsboerse
850	2023-11-13 12:05:53+01	33067537	Wohnungsboerse
750	2023-11-13 12:05:55+01	33376142	Wohnungsboerse
1220	2023-11-13 12:05:57+01	33448858	Wohnungsboerse
665	2023-11-13 12:06:00+01	33464631	Wohnungsboerse
740	2023-11-13 12:06:02+01	33487539	Wohnungsboerse
483.34	2023-11-13 12:06:04+01	33487740	Wohnungsboerse
629	2023-11-13 12:06:07+01	33493438	Wohnungsboerse
599	2023-11-13 12:06:09+01	33493446	Wohnungsboerse
709	2023-11-13 12:06:11+01	33493443	Wohnungsboerse
842	2023-11-13 12:06:14+01	33504257	Wohnungsboerse
800	2023-11-13 12:06:17+01	33509761	Wohnungsboerse
575.54	2023-11-13 12:06:20+01	33510563	Wohnungsboerse
790	2023-11-13 12:06:22+01	33515717	Wohnungsboerse
875	2023-11-13 12:06:24+01	33431065	Wohnungsboerse
750	2023-11-13 12:06:26+01	33497134	Wohnungsboerse
467.5	2023-11-13 12:06:28+01	33500157	Wohnungsboerse
850	2023-11-13 12:06:31+01	33501664	Wohnungsboerse
550	2023-11-13 12:06:33+01	33501741	Wohnungsboerse
750	2023-11-13 12:06:35+01	33309447	Wohnungsboerse
1250	2023-11-13 12:06:38+01	33503916	Wohnungsboerse
550	2023-11-13 12:06:41+01	33504385	Wohnungsboerse
275	2023-11-13 12:06:44+01	33506595	Wohnungsboerse
800	2023-11-13 12:06:46+01	33506712	Wohnungsboerse
1190	2023-11-13 12:06:49+01	33506830	Wohnungsboerse
295	2023-11-13 12:06:52+01	33509432	Wohnungsboerse
550	2023-11-13 12:06:54+01	33519891	Wohnungsboerse
2100	2023-11-13 12:06:56+01	33520073	Wohnungsboerse
520	2023-11-13 12:06:58+01	32995444	Wohnungsboerse
1051.8	2023-11-13 12:07:01+01	33063518	Wohnungsboerse
720	2023-11-13 12:07:03+01	32630083	Wohnungsboerse
1390	2023-11-13 12:07:06+01	33373146	Wohnungsboerse
630	2023-11-13 12:07:09+01	33341790	Wohnungsboerse
600	2023-11-13 12:07:11+01	33422162	Wohnungsboerse
539.64	2023-11-13 12:07:14+01	33446081	Wohnungsboerse
888.72	2023-11-13 12:07:17+01	33448755	Wohnungsboerse
500	2023-11-13 12:07:20+01	33476372	Wohnungsboerse
395	2023-11-13 12:07:22+01	33444305	Wohnungsboerse
795	2023-11-13 12:07:25+01	33501241	Wohnungsboerse
1300	2023-11-13 12:07:27+01	33504326	Wohnungsboerse
573	2023-11-13 12:07:30+01	33509225	Wohnungsboerse
514.8	2023-11-13 12:07:32+01	33509425	Wohnungsboerse
595	2023-11-13 12:07:34+01	33404507	Wohnungsboerse
1040	2023-11-13 12:07:36+01	33401914	Wohnungsboerse
970	2023-11-13 12:07:39+01	33504585	Wohnungsboerse
1590	2023-11-13 12:07:42+01	33504700	Wohnungsboerse
1540	2023-11-13 12:07:43+01	33506367	Wohnungsboerse
788	2023-11-13 12:07:46+01	33299265	Wohnungsboerse
680	2023-11-13 12:07:48+01	33509513	Wohnungsboerse
640	2023-11-13 12:07:51+01	33509599	Wohnungsboerse
820	2023-11-13 12:07:54+01	33509614	Wohnungsboerse
567.55	2023-11-13 12:07:56+01	33059425	Wohnungsboerse
920	2023-11-13 12:07:59+01	33363525	Wohnungsboerse
600	2023-11-13 12:08:00+01	33514283	Wohnungsboerse
640	2023-11-13 12:08:03+01	33515086	Wohnungsboerse
920	2023-11-13 12:08:06+01	33515788	Wohnungsboerse
550	2023-11-13 12:08:08+01	33440362	Wohnungsboerse
1300	2023-11-13 12:08:11+01	31823448	Wohnungsboerse
700	2023-11-13 12:08:14+01	33477583	Wohnungsboerse
720	2023-11-13 12:08:16+01	33477711	Wohnungsboerse
939	2023-11-13 12:08:19+01	33484955	Wohnungsboerse
451	2023-11-13 12:08:22+01	33485647	Wohnungsboerse
710	2023-11-13 12:08:25+01	33303915	Wohnungsboerse
690	2023-11-13 12:08:28+01	33075428	Wohnungsboerse
550	2023-11-13 12:08:30+01	33495711	Wohnungsboerse
980	2023-11-13 12:08:33+01	33495909	Wohnungsboerse
590	2023-11-13 12:08:36+01	33495917	Wohnungsboerse
590	2023-11-13 12:08:38+01	33495916	Wohnungsboerse
690	2023-11-13 12:08:40+01	33495915	Wohnungsboerse
1200	2023-11-13 12:08:43+01	33495914	Wohnungsboerse
650	2023-11-13 12:08:45+01	33495913	Wohnungsboerse
781.96	2023-11-13 12:08:48+01	33506903	Wohnungsboerse
660	2023-11-13 12:08:51+01	33511465	Wohnungsboerse
1000	2023-11-13 12:08:53+01	33512310	Wohnungsboerse
565	2023-11-13 12:08:56+01	33495788	Wohnungsboerse
978	2023-11-13 12:08:58+01	33497487	Wohnungsboerse
798.18	2023-11-13 12:09:01+01	33501770	Wohnungsboerse
1950	2023-11-13 12:09:03+01	33077145	Wohnungsboerse
442	2023-11-13 12:09:06+01	33504688	Wohnungsboerse
682	2023-11-13 12:09:08+01	33504693	Wohnungsboerse
442	2023-11-13 12:09:11+01	33504715	Wohnungsboerse
1700	2023-11-13 12:09:14+01	33506665	Wohnungsboerse
870	2023-11-13 12:09:16+01	33509543	Wohnungsboerse
1230	2023-11-13 12:09:19+01	33513464	Wohnungsboerse
737	2023-11-13 12:09:22+01	33341861	Wohnungsboerse
1150	2023-11-13 12:09:25+01	33416750	Wohnungsboerse
760	2023-11-13 12:09:28+01	33514857	Wohnungsboerse
1027	2023-11-13 12:09:31+01	33404414	Wohnungsboerse
640	2023-11-13 12:09:33+01	33444302	Wohnungsboerse
654.92	2023-11-13 12:09:34+01	33402810	Wohnungsboerse
670	2023-11-13 12:09:37+01	33495525	Wohnungsboerse
500	2023-11-13 12:09:40+01	33495653	Wohnungsboerse
584.25	2023-11-13 12:09:42+01	33492070	Wohnungsboerse
760	2023-11-13 12:09:45+01	33503910	Wohnungsboerse
1100	2023-11-13 12:09:47+01	27065153	Wohnungsboerse
1870	2023-11-13 12:09:50+01	33409277	Wohnungsboerse
1100	2023-11-13 12:09:53+01	33509372	Wohnungsboerse
460.94	2023-11-13 12:09:55+01	33509397	Wohnungsboerse
850	2023-11-13 12:09:58+01	33514133	Wohnungsboerse
1900	2023-11-13 12:10:00+01	33260449	Wohnungsboerse
850	2023-11-13 12:10:03+01	33516886	Wohnungsboerse
529	2023-11-13 12:10:06+01	33520265	Wohnungsboerse
3250	2023-11-13 12:10:08+01	33114294	Wohnungsboerse
1610	2023-11-13 12:10:11+01	32875836	Wohnungsboerse
1950	2023-11-13 12:10:14+01	33308983	Wohnungsboerse
1950	2023-11-13 12:10:15+01	33320934	Wohnungsboerse
655	2023-11-13 12:10:19+01	33378454	Wohnungsboerse
1100	2023-11-13 12:10:20+01	33397960	Wohnungsboerse
1100	2023-11-13 12:10:23+01	33008456	Wohnungsboerse
1640	2023-11-13 12:10:28+01	32877350	Wohnungsboerse
505	2023-11-13 12:10:28+01	33480003	Wohnungsboerse
1350	2023-11-13 12:10:30+01	33489271	Wohnungsboerse
792	2023-11-13 12:10:33+01	33501970	Wohnungsboerse
1850	2023-11-13 12:10:36+01	33404509	Wohnungsboerse
990	2023-11-13 12:10:39+01	33404504	Wohnungsboerse
1050	2023-11-13 12:10:42+01	33404503	Wohnungsboerse
1350	2023-11-13 12:10:43+01	33404501	Wohnungsboerse
990	2023-11-13 12:10:46+01	33154723	Wohnungsboerse
850	2023-11-13 12:10:49+01	33510395	Wohnungsboerse
365	2023-11-13 12:10:51+01	33510545	Wohnungsboerse
515	2023-11-13 12:10:53+01	33511526	Wohnungsboerse
730	2023-11-13 12:10:54+01	33512338	Wohnungsboerse
500	2023-11-13 12:10:57+01	33512400	Wohnungsboerse
790	2023-11-13 12:11:00+01	33514868	Wohnungsboerse
560	2023-11-13 12:11:02+01	33515642	Wohnungsboerse
1640	2023-11-13 12:11:05+01	33380525	Wohnungsboerse
800	2023-11-13 12:11:09+01	33086103	Wohnungsboerse
840	2023-11-13 12:11:10+01	33313054	Wohnungsboerse
1081	2023-11-13 12:11:13+01	33432833	Wohnungsboerse
1420	2023-11-13 12:11:15+01	33473113	Wohnungsboerse
810	2023-11-13 12:11:18+01	33254648	Wohnungsboerse
950	2023-11-13 12:11:20+01	33298728	Wohnungsboerse
2200	2023-11-13 12:11:22+01	33344012	Wohnungsboerse
595	2023-11-13 12:11:25+01	33254812	Wohnungsboerse
1890	2023-11-13 12:11:27+01	32728991	Wohnungsboerse
1790	2023-11-13 12:11:29+01	32728990	Wohnungsboerse
2086.5	2023-11-13 12:11:31+01	33473690	Wohnungsboerse
1200	2023-11-13 12:11:34+01	33027861	Wohnungsboerse
930	2023-11-13 12:11:37+01	33147363	Wohnungsboerse
1550	2023-11-13 12:11:39+01	32853522	Wohnungsboerse
920	2023-11-13 12:11:42+01	33504020	Wohnungsboerse
860	2023-11-13 12:11:44+01	33504682	Wohnungsboerse
600	2023-11-13 12:11:46+01	33254461	Wohnungsboerse
2770	2023-11-13 12:11:49+01	33347939	Wohnungsboerse
4205.76	2023-11-13 12:11:51+01	33360939	Wohnungsboerse
1800	2023-11-13 12:11:53+01	32817541	Wohnungsboerse
1379.88	2023-11-13 12:11:56+01	33445819	Wohnungsboerse
1684.63	2023-11-13 12:11:58+01	33445857	Wohnungsboerse
1135	2023-11-13 12:12:01+01	33446074	Wohnungsboerse
2200	2023-11-13 12:12:03+01	33422321	Wohnungsboerse
2950	2023-11-13 12:12:06+01	33455178	Wohnungsboerse
392	2023-11-13 12:12:09+01	33466189	Wohnungsboerse
690	2023-11-13 12:12:11+01	33483786	Wohnungsboerse
700	2023-11-13 12:12:14+01	33501793	Wohnungsboerse
1390	2023-11-13 12:12:16+01	33504233	Wohnungsboerse
650	2023-11-13 12:12:18+01	33510508	Wohnungsboerse
560	2023-11-13 12:13:02+01	33344025	Wohnungsboerse
1038.8	2023-11-13 12:13:05+01	32904956	Wohnungsboerse
498.36	2023-11-13 12:13:07+01	31818244	Wohnungsboerse
687	2023-11-13 12:13:10+01	33455338	Wohnungsboerse
481.92	2023-11-13 12:13:13+01	32442188	Wohnungsboerse
1900	2023-11-13 12:13:16+01	31394882	Wohnungsboerse
685	2023-11-13 12:13:18+01	33259837	Wohnungsboerse
3000	2023-11-13 12:13:21+01	31827401	Wohnungsboerse
1450	2023-11-13 12:13:22+01	32375748	Wohnungsboerse
593.87	2023-11-13 12:13:25+01	33337302	Wohnungsboerse
695	2023-11-13 12:13:27+01	33473469	Wohnungsboerse
580	2023-11-13 12:13:30+01	33487594	Wohnungsboerse
2500	2023-11-13 12:13:32+01	32188005	Wohnungsboerse
952	2023-11-13 12:13:35+01	30952139	Wohnungsboerse
650	2023-11-13 12:13:38+01	29317989	Wohnungsboerse
1550	2023-11-13 12:13:40+01	33438599	Wohnungsboerse
810	2023-11-13 12:13:43+01	33344117	Wohnungsboerse
1581	2023-11-13 12:13:44+01	33149772	Wohnungsboerse
1600	2023-11-13 12:13:50+01	33497091	Wohnungsboerse
285	2023-11-13 12:13:51+01	33500564	Wohnungsboerse
680	2023-11-13 12:13:54+01	33501288	Wohnungsboerse
750	2023-11-13 12:13:56+01	33504208	Wohnungsboerse
990	2023-11-13 12:14:02+01	33479487	Wohnungsboerse
580.92	2023-11-13 12:14:04+01	33509381	Wohnungsboerse
400	2023-11-13 12:14:07+01	33511473	Wohnungsboerse
1170	2023-11-13 12:14:10+01	33416752	Wohnungsboerse
1100	2023-11-13 12:14:12+01	33514990	Wohnungsboerse
910	2023-11-13 12:14:15+01	33515065	Wohnungsboerse
430	2023-11-13 12:14:17+01	33517085	Wohnungsboerse
1200	2023-11-13 12:14:20+01	33449976	Wohnungsboerse
1500	2023-11-13 12:14:22+01	33512469	Wohnungsboerse
1200	2023-11-13 12:14:25+01	29631528	Wohnungsboerse
1050	2023-11-13 12:14:28+01	33440863	Wohnungsboerse
650	2023-11-13 12:14:31+01	33451641	Wohnungsboerse
1330	2023-11-13 12:14:33+01	33452188	Wohnungsboerse
1785	2023-11-13 12:14:35+01	33245396	Wohnungsboerse
1116.17	2023-11-13 12:14:38+01	33274310	Wohnungsboerse
980	2023-11-13 12:14:41+01	33485232	Wohnungsboerse
730	2023-11-13 12:14:42+01	33495322	Wohnungsboerse
750	2023-11-13 12:14:45+01	33504049	Wohnungsboerse
1300	2023-11-13 12:14:47+01	33506341	Wohnungsboerse
600	2023-11-13 12:14:50+01	33506337	Wohnungsboerse
761	2023-11-13 12:14:52+01	33506806	Wohnungsboerse
990	2023-11-13 12:14:55+01	33516814	Wohnungsboerse
600	2023-11-13 12:14:57+01	33516824	Wohnungsboerse
4200	2023-11-13 12:15:00+01	33320901	Wohnungsboerse
1795	2023-11-13 12:15:02+01	33279878	Wohnungsboerse
500	2023-11-13 12:15:05+01	33365152	Wohnungsboerse
1300	2023-11-13 12:15:07+01	33439057	Wohnungsboerse
1210	2023-11-13 12:15:09+01	33439064	Wohnungsboerse
1340	2023-11-13 12:15:10+01	33462779	Wohnungsboerse
740	2023-11-13 12:15:13+01	33464465	Wohnungsboerse
1895	2023-11-13 12:15:16+01	33227368	Wohnungsboerse
810	2023-11-13 12:15:17+01	33439071	Wohnungsboerse
630	2023-11-13 12:15:20+01	33500463	Wohnungsboerse
1045.08	2023-11-13 12:15:22+01	33506303	Wohnungsboerse
1495	2023-11-13 12:15:25+01	33200036	Wohnungsboerse
840	2023-11-13 12:15:27+01	33368057	Wohnungsboerse
1168.83	2023-11-13 12:15:30+01	33384509	Wohnungsboerse
470	2023-11-13 12:15:32+01	31983080	Wohnungsboerse
684	2023-11-13 12:15:33+01	27035171	Wohnungsboerse
1348	2023-11-13 12:15:36+01	33425850	Wohnungsboerse
1064	2023-11-13 12:15:39+01	32820355	Wohnungsboerse
1249	2023-11-13 12:15:42+01	33473842	Wohnungsboerse
1300	2023-11-13 12:15:43+01	33455197	Wohnungsboerse
1066	2023-11-13 12:15:46+01	33449817	Wohnungsboerse
1300	2023-11-13 12:15:48+01	33450160	Wohnungsboerse
1089.27	2023-11-13 12:15:50+01	33196576	Wohnungsboerse
1272.31	2023-11-13 12:15:53+01	33479730	Wohnungsboerse
1262.17	2023-11-13 12:15:55+01	33450063	Wohnungsboerse
997	2023-11-13 12:15:58+01	33515794	Wohnungsboerse
2800	2023-11-13 12:16:00+01	33517023	Wohnungsboerse
770.57	2023-11-13 12:16:02+01	33331984	Wohnungsboerse
828.2	2023-11-13 12:16:04+01	33396009	Wohnungsboerse
839.16	2023-11-13 12:16:07+01	33402808	Wohnungsboerse
623.31	2023-11-13 12:16:09+01	33457517	Wohnungsboerse
942.96	2023-11-13 12:16:11+01	33501772	Wohnungsboerse
980	2023-11-13 12:16:14+01	33516927	Wohnungsboerse
2650	2023-11-13 12:16:15+01	32917983	Wohnungsboerse
2600	2023-11-13 12:16:18+01	33129082	Wohnungsboerse
850	2023-11-13 12:16:21+01	33352134	Wohnungsboerse
630	2023-11-13 12:16:24+01	33237999	Wohnungsboerse
2700	2023-11-13 12:16:26+01	33449689	Wohnungsboerse
1450	2023-11-13 12:16:29+01	33454997	Wohnungsboerse
720	2023-11-13 12:16:31+01	33487464	Wohnungsboerse
560	2023-11-13 12:16:33+01	33487702	Wohnungsboerse
925	2023-11-13 12:16:35+01	33343712	Wohnungsboerse
790	2023-11-13 12:16:38+01	33500418	Wohnungsboerse
1165	2023-11-13 12:16:40+01	33511353	Wohnungsboerse
870	2023-11-13 12:16:42+01	33347483	Wohnungsboerse
710	2023-11-13 12:16:44+01	33471079	Wohnungsboerse
785	2023-11-13 12:16:45+01	33468770	Wohnungsboerse
3200	2023-11-13 12:16:46+01	33504666	Wohnungsboerse
920	2023-11-13 12:16:49+01	32918930	Wohnungsboerse
800	2023-11-13 12:16:52+01	32683285	Wohnungsboerse
840	2023-11-13 12:16:55+01	33389516	Wohnungsboerse
820	2023-11-13 12:16:58+01	33394176	Wohnungsboerse
825	2023-11-13 12:17:01+01	33424042	Wohnungsboerse
730	2023-11-13 12:17:03+01	33439120	Wohnungsboerse
720	2023-11-13 12:17:06+01	33465765	Wohnungsboerse
495	2023-11-13 12:17:08+01	33465771	Wohnungsboerse
1050	2023-11-13 12:17:10+01	33487761	Wohnungsboerse
1035	2023-11-13 12:17:12+01	33393636	Wohnungsboerse
798	2023-11-13 12:17:14+01	33493229	Wohnungsboerse
830	2023-11-13 12:17:17+01	33354625	Wohnungsboerse
1150	2023-11-13 12:17:20+01	33506987	Wohnungsboerse
750	2023-11-13 12:17:22+01	33217523	Wohnungsboerse
1900	2023-11-13 12:17:24+01	33288206	Wohnungsboerse
1500	2023-11-13 12:17:27+01	33386349	Wohnungsboerse
1600	2023-11-13 12:17:29+01	33413993	Wohnungsboerse
2200	2023-11-13 12:17:31+01	33422243	Wohnungsboerse
1270	2023-11-13 12:17:34+01	33424200	Wohnungsboerse
709	2023-11-13 12:17:37+01	33424462	Wohnungsboerse
1550	2023-11-13 12:17:39+01	33426095	Wohnungsboerse
656	2023-11-13 12:17:42+01	33355109	Wohnungsboerse
1005.4	2023-11-13 12:17:44+01	32816215	Wohnungsboerse
840	2023-11-13 12:17:47+01	33495564	Wohnungsboerse
970	2023-11-13 12:17:49+01	33495876	Wohnungsboerse
1498	2023-11-13 12:17:51+01	33510322	Wohnungsboerse
1034	2023-11-13 12:17:53+01	33510434	Wohnungsboerse
1300	2023-11-13 12:17:56+01	33514964	Wohnungsboerse
423	2023-11-13 12:17:58+01	33438544	Wohnungsboerse
839	2023-11-13 12:18:01+01	33409168	Wohnungsboerse
889	2023-11-13 12:18:03+01	33343992	Wohnungsboerse
1500	2023-11-13 12:18:06+01	33451563	Wohnungsboerse
869	2023-11-13 12:18:08+01	33343999	Wohnungsboerse
1050	2023-11-13 12:18:11+01	33473152	Wohnungsboerse
538.03	2023-11-13 12:18:14+01	33476079	Wohnungsboerse
902.96	2023-11-13 12:18:17+01	33476080	Wohnungsboerse
980	2023-11-13 12:18:19+01	33480068	Wohnungsboerse
475	2023-11-13 12:18:22+01	33487614	Wohnungsboerse
999	2023-11-13 12:18:25+01	33487613	Wohnungsboerse
829	2023-11-13 12:18:27+01	33487610	Wohnungsboerse
636	2023-11-13 12:18:30+01	33487646	Wohnungsboerse
1197.48	2023-11-13 12:18:32+01	33435007	Wohnungsboerse
1200	2023-11-13 12:19:10+01	33514978	Wohnungsboerse
1350	2023-11-13 12:19:12+01	33520002	Wohnungsboerse
1800	2023-11-13 12:19:15+01	33460518	Wohnungsboerse
1181	2023-11-13 12:19:16+01	33470875	Wohnungsboerse
1044	2023-11-13 12:19:19+01	33484223	Wohnungsboerse
1060	2023-11-13 12:19:21+01	33481808	Wohnungsboerse
614	2023-11-13 12:19:23+01	33051217	Wohnungsboerse
900	2023-11-13 12:19:26+01	33479828	Wohnungsboerse
810.81	2023-11-13 12:19:29+01	33002621	Wohnungsboerse
1278	2023-11-13 12:19:31+01	33401864	Wohnungsboerse
470	2023-11-13 12:19:33+01	33477756	Wohnungsboerse
1790	2023-11-13 12:19:36+01	31571982	Wohnungsboerse
995	2023-11-13 12:19:39+01	33093225	Wohnungsboerse
1400	2023-11-13 12:19:42+01	33201711	Wohnungsboerse
1562	2023-11-13 12:19:45+01	32803920	Wohnungsboerse
784	2023-11-13 12:19:48+01	33347397	Wohnungsboerse
465.65	2023-11-13 12:19:50+01	33254653	Wohnungsboerse
640	2023-11-13 12:19:52+01	33299372	Wohnungsboerse
735	2023-11-13 12:19:55+01	33347299	Wohnungsboerse
947.16	2023-11-13 12:19:58+01	33304400	Wohnungsboerse
752.77	2023-11-13 12:20:01+01	33432779	Wohnungsboerse
1390.5	2023-11-13 12:20:03+01	33479536	Wohnungsboerse
740	2023-11-13 12:20:05+01	33512128	Wohnungsboerse
1500	2023-11-13 12:20:07+01	33513524	Wohnungsboerse
811.2	2023-11-13 12:20:09+01	33434998	Wohnungsboerse
710	2023-11-13 12:20:11+01	33463341	Wohnungsboerse
600	2023-11-13 12:20:14+01	33473627	Wohnungsboerse
1000	2023-11-13 12:20:17+01	33476261	Wohnungsboerse
1250	2023-11-13 12:20:20+01	33481343	Wohnungsboerse
880	2023-11-13 12:20:21+01	33487856	Wohnungsboerse
520	2023-11-13 12:20:24+01	33493220	Wohnungsboerse
600	2023-11-13 12:20:27+01	33493371	Wohnungsboerse
715	2023-11-13 12:20:30+01	33493239	Wohnungsboerse
504	2023-11-13 12:20:32+01	33509424	Wohnungsboerse
610	2023-11-13 12:20:34+01	33510407	Wohnungsboerse
1075	2023-11-13 12:20:37+01	33458750	Wohnungsboerse
480	2023-11-13 12:20:39+01	32111553	Wohnungsboerse
480	2023-11-13 12:20:42+01	33514955	Wohnungsboerse
875	2023-11-13 12:20:44+01	33360820	Wohnungsboerse
730	2023-11-13 12:20:46+01	33480183	Wohnungsboerse
1750	2023-11-13 12:20:49+01	33489270	Wohnungsboerse
4600	2023-11-13 12:20:51+01	33516901	Wohnungsboerse
864	2023-11-13 12:20:53+01	33203387	Wohnungsboerse
2500	2023-11-13 12:20:56+01	33203372	Wohnungsboerse
850	2023-11-13 12:20:58+01	33213161	Wohnungsboerse
950	2023-11-13 12:21:01+01	33333966	Wohnungsboerse
890	2023-11-13 12:21:04+01	33103145	Wohnungsboerse
1140	2023-11-13 12:21:05+01	33438640	Wohnungsboerse
750	2023-11-13 12:21:08+01	33445814	Wohnungsboerse
670	2023-11-13 12:21:09+01	33471198	Wohnungsboerse
614	2023-11-13 12:21:12+01	33487615	Wohnungsboerse
511	2023-11-13 12:21:14+01	33487617	Wohnungsboerse
692	2023-11-13 12:21:17+01	33274520	Wohnungsboerse
1250	2023-11-13 12:21:19+01	33506350	Wohnungsboerse
430	2023-11-13 12:21:21+01	33506504	Wohnungsboerse
700	2023-11-13 12:21:24+01	33506559	Wohnungsboerse
1200	2023-11-13 12:21:26+01	33337352	Wohnungsboerse
1568.43	2023-11-13 12:21:29+01	33402892	Wohnungsboerse
1600	2023-11-13 12:21:31+01	33471372	Wohnungsboerse
735	2023-11-13 12:21:34+01	33480109	Wohnungsboerse
1150	2023-11-13 12:21:37+01	33485043	Wohnungsboerse
850	2023-11-13 12:21:39+01	33491762	Wohnungsboerse
2560	2023-11-13 12:21:41+01	33493623	Wohnungsboerse
795	2023-11-13 12:21:43+01	33435950	Wohnungsboerse
1199	2023-11-13 12:21:46+01	33439092	Wohnungsboerse
820	2023-11-13 12:21:48+01	33434842	Wohnungsboerse
550	2023-11-13 12:21:50+01	33470964	Wohnungsboerse
1500	2023-11-13 12:21:53+01	33471343	Wohnungsboerse
805	2023-11-13 12:21:56+01	33479705	Wohnungsboerse
640	2023-11-13 12:21:58+01	33480104	Wohnungsboerse
700	2023-11-13 12:22:01+01	33485071	Wohnungsboerse
1185	2023-11-13 12:22:04+01	32705183	Wohnungsboerse
450	2023-11-13 12:22:07+01	33492245	Wohnungsboerse
1590	2023-11-13 12:22:09+01	29486814	Wohnungsboerse
759.66	2023-11-13 12:22:12+01	33500282	Wohnungsboerse
543.41	2023-11-13 12:22:15+01	33509360	Wohnungsboerse
830	2023-11-13 12:22:17+01	33367045	Wohnungsboerse
1690	2023-11-13 12:22:20+01	33444203	Wohnungsboerse
1400	2023-11-13 12:22:22+01	33481303	Wohnungsboerse
539	2023-11-13 12:22:24+01	33491973	Wohnungsboerse
780	2023-11-13 12:22:26+01	33492180	Wohnungsboerse
2150	2023-11-13 12:22:29+01	33493198	Wohnungsboerse
732	2023-11-13 12:22:32+01	33493408	Wohnungsboerse
420	2023-11-13 12:22:34+01	33493606	Wohnungsboerse
1150	2023-11-13 12:22:37+01	33504701	Wohnungsboerse
740	2023-11-13 12:22:39+01	33493520	Wohnungsboerse
835	2023-11-13 12:22:41+01	33506496	Wohnungsboerse
656	2023-11-13 12:22:44+01	33512290	Wohnungsboerse
1150	2023-11-13 12:22:47+01	33437122	Wohnungsboerse
900	2023-11-13 12:22:49+01	33516812	Wohnungsboerse
435	2023-11-13 12:22:52+01	33519960	Wohnungsboerse
1400	2023-11-13 12:22:54+01	33389603	Wohnungsboerse
1150	2023-11-13 12:22:56+01	33429247	Wohnungsboerse
1620	2023-11-13 12:22:58+01	33343707	Wohnungsboerse
790	2023-11-13 12:23:00+01	33392135	Wohnungsboerse
795	2023-11-13 12:23:03+01	33089879	Wohnungsboerse
1350	2023-11-13 12:23:06+01	33497192	Wohnungsboerse
2213	2023-11-13 12:23:08+01	33501469	Wohnungsboerse
1100	2023-11-13 12:23:10+01	33501781	Wohnungsboerse
1340	2023-11-13 12:23:13+01	33501780	Wohnungsboerse
1620	2023-11-13 12:23:15+01	33501779	Wohnungsboerse
870	2023-11-13 12:23:18+01	33501784	Wohnungsboerse
1610	2023-11-13 12:23:21+01	33501783	Wohnungsboerse
1560	2023-11-13 12:23:23+01	33501782	Wohnungsboerse
1200	2023-11-13 12:23:24+01	33475867	Wohnungsboerse
1750	2023-11-13 12:23:26+01	33448480	Wohnungsboerse
1650	2023-11-13 12:23:28+01	33501511	Wohnungsboerse
3800	2023-11-13 12:23:31+01	33504182	Wohnungsboerse
660	2023-11-13 12:23:34+01	33512379	Wohnungsboerse
1330	2023-11-13 12:23:36+01	33440756	Wohnungsboerse
780	2023-11-13 12:23:39+01	33440750	Wohnungsboerse
912	2023-11-13 12:23:42+01	33479930	Wohnungsboerse
850	2023-11-13 12:23:44+01	33481128	Wohnungsboerse
1368.44	2023-11-13 12:23:47+01	33145677	Wohnungsboerse
1100	2023-11-13 12:23:48+01	33483866	Wohnungsboerse
900	2023-11-13 12:23:51+01	33484007	Wohnungsboerse
660	2023-11-13 12:23:54+01	33487524	Wohnungsboerse
490	2023-11-13 12:23:56+01	33495369	Wohnungsboerse
585	2023-11-13 12:23:59+01	33501378	Wohnungsboerse
1000	2023-11-13 12:24:01+01	33501375	Wohnungsboerse
445	2023-11-13 12:24:03+01	33070027	Wohnungsboerse
863	2023-11-13 12:24:05+01	32831795	Wohnungsboerse
995	2023-11-13 12:24:08+01	33418897	Wohnungsboerse
838	2023-11-13 12:24:10+01	33509416	Wohnungsboerse
965	2023-11-13 12:24:13+01	33516884	Wohnungsboerse
690	2023-11-13 12:24:16+01	33337558	Wohnungsboerse
850	2023-11-13 12:24:18+01	33203773	Wohnungsboerse
910	2023-11-13 12:24:20+01	33501589	Wohnungsboerse
550.46	2023-11-13 12:24:22+01	33509409	Wohnungsboerse
1270	2023-11-13 12:24:24+01	33519879	Wohnungsboerse
850	2023-11-13 12:24:27+01	33485714	Wohnungsboerse
759	2023-11-13 12:24:29+01	33095129	Wohnungsboerse
1190	2023-11-13 12:24:30+01	32772403	Wohnungsboerse
523.66	2023-11-13 12:24:33+01	33489488	Wohnungsboerse
593.38	2023-11-13 12:24:35+01	33493230	Wohnungsboerse
570.85	2023-11-13 12:24:37+01	33493584	Wohnungsboerse
795	2023-11-13 12:24:40+01	33495874	Wohnungsboerse
625	2023-11-13 12:24:43+01	33500411	Wohnungsboerse
1290	2023-11-13 12:24:45+01	33506290	Wohnungsboerse
1050	2023-11-13 12:24:47+01	33509212	Wohnungsboerse
1400	2023-11-13 12:24:50+01	33509349	Wohnungsboerse
730	2023-11-13 12:24:52+01	33514993	Wohnungsboerse
1200	2023-11-13 12:24:55+01	33475843	Wohnungsboerse
400	2023-11-13 12:24:58+01	33519871	Wohnungsboerse
1272	2023-11-13 12:25:00+01	33487443	Wohnungsboerse
550	2023-11-13 12:25:03+01	32896331	Wohnungsboerse
1250	2023-11-13 12:25:06+01	33492298	Wohnungsboerse
485	2023-11-13 12:25:08+01	33500333	Wohnungsboerse
2500	2023-11-13 12:25:10+01	33240741	Wohnungsboerse
1295	2023-11-13 12:25:12+01	33501957	Wohnungsboerse
1200	2023-11-13 12:25:15+01	33296470	Wohnungsboerse
1950	2023-11-13 12:25:17+01	33506972	Wohnungsboerse
500	2023-11-13 12:25:19+01	33510466	Wohnungsboerse
1600	2023-11-13 12:25:22+01	33500661	Wohnungsboerse
600	2023-11-13 12:25:25+01	33511560	Wohnungsboerse
650	2023-11-13 12:25:26+01	33373823	Wohnungsboerse
735	2023-11-13 12:25:29+01	33515638	Wohnungsboerse
920	2023-11-13 12:25:30+01	33515701	Wohnungsboerse
1080	2023-11-13 12:25:33+01	33471054	Wohnungsboerse
1100	2023-11-13 12:25:35+01	33473299	Wohnungsboerse
1300	2023-11-13 12:25:38+01	33477460	Wohnungsboerse
3900	2023-11-13 12:25:41+01	33481349	Wohnungsboerse
2300	2023-11-13 12:25:43+01	33487668	Wohnungsboerse
1647	2023-11-13 12:25:44+01	33485025	Wohnungsboerse
1450	2023-11-13 12:25:47+01	33444315	Wohnungsboerse
750	2023-11-13 12:25:50+01	33497987	Wohnungsboerse
1072	2023-11-13 12:25:52+01	33197979	Wohnungsboerse
1500	2023-11-13 12:25:55+01	33497983	Wohnungsboerse
1000	2023-11-13 12:25:58+01	33509320	Wohnungsboerse
2480	2023-11-16 12:09:43+01	31210714	Wohnungsboerse
1890	2023-11-16 12:09:45+01	32728992	Wohnungsboerse
800	2023-11-16 12:09:48+01	28806724	Wohnungsboerse
1157	2023-11-16 12:09:50+01	33534805	Wohnungsboerse
800	2023-11-16 12:09:53+01	31766932	Wohnungsboerse
1870	2023-11-16 12:09:55+01	33409277	Wohnungsboerse
1100	2023-11-16 12:09:57+01	33321367	Wohnungsboerse
700	2023-11-16 12:10:00+01	33477583	Wohnungsboerse
640	2023-11-16 12:10:03+01	33515086	Wohnungsboerse
920	2023-11-16 12:10:05+01	33515788	Wohnungsboerse
1200	2023-11-16 12:10:08+01	33501529	Wohnungsboerse
1250	2023-11-16 12:10:11+01	33503916	Wohnungsboerse
550	2023-11-16 12:10:14+01	33504385	Wohnungsboerse
2276	2023-11-16 12:10:16+01	33323591	Wohnungsboerse
1320	2023-11-16 12:10:18+01	33449855	Wohnungsboerse
820	2023-11-16 12:10:21+01	33318532	Wohnungsboerse
1891	2023-11-16 12:10:24+01	32697715	Wohnungsboerse
985	2023-11-16 12:10:26+01	32642467	Wohnungsboerse
1840	2023-11-16 12:10:29+01	32642458	Wohnungsboerse
1705	2023-11-16 12:10:32+01	33050991	Wohnungsboerse
2009	2023-11-16 12:10:35+01	32966061	Wohnungsboerse
2590	2023-11-16 12:10:37+01	33354570	Wohnungsboerse
2225	2023-11-16 12:10:40+01	32804194	Wohnungsboerse
943	2023-11-16 12:10:43+01	33391895	Wohnungsboerse
852	2023-11-16 12:10:45+01	33389217	Wohnungsboerse
965	2023-11-16 12:10:47+01	33489268	Wohnungsboerse
659	2023-11-16 12:10:51+01	33526902	Wohnungsboerse
2031	2023-11-16 12:10:52+01	33539691	Wohnungsboerse
1490	2023-11-16 12:10:55+01	33539690	Wohnungsboerse
1520	2023-11-16 12:10:57+01	33341744	Wohnungsboerse
1430	2023-11-16 12:11:00+01	33355426	Wohnungsboerse
1550	2023-11-16 12:11:02+01	33355443	Wohnungsboerse
1250	2023-11-16 12:11:04+01	33366949	Wohnungsboerse
2950	2023-11-16 12:11:06+01	32489228	Wohnungsboerse
1400	2023-11-16 12:11:08+01	33435204	Wohnungsboerse
1550	2023-11-16 12:11:11+01	32848279	Wohnungsboerse
510	2023-11-16 12:11:13+01	33468752	Wohnungsboerse
1400	2023-11-16 12:11:15+01	33471318	Wohnungsboerse
737	2023-11-16 12:11:17+01	33495937	Wohnungsboerse
1400	2023-11-16 12:11:20+01	33435206	Wohnungsboerse
1450	2023-11-16 12:11:23+01	33506206	Wohnungsboerse
760	2023-11-16 12:11:24+01	33524571	Wohnungsboerse
1049	2023-11-16 12:11:27+01	33530660	Wohnungsboerse
1500	2023-11-16 12:11:30+01	33510346	Wohnungsboerse
1250	2023-11-16 12:11:31+01	33386763	Wohnungsboerse
1250	2023-11-16 12:11:34+01	33468319	Wohnungsboerse
1400	2023-11-16 12:11:35+01	33368188	Wohnungsboerse
1000	2023-11-16 12:11:38+01	33515589	Wohnungsboerse
11040	2023-11-16 12:11:41+01	27092375	Wohnungsboerse
1450	2023-11-16 12:11:43+01	33526875	Wohnungsboerse
550	2023-11-16 12:11:46+01	33527279	Wohnungsboerse
1700	2023-11-16 12:11:48+01	33528229	Wohnungsboerse
4350	2023-11-16 12:11:51+01	33401744	Wohnungsboerse
3000	2023-11-16 12:11:53+01	33476234	Wohnungsboerse
420	2023-11-16 12:11:56+01	33540408	Wohnungsboerse
558	2023-11-16 12:11:58+01	33542799	Wohnungsboerse
1200	2023-11-16 12:12:01+01	33506668	Wohnungsboerse
1082.65	2023-11-16 12:12:03+01	33309501	Wohnungsboerse
1164	2023-11-16 12:12:06+01	33309496	Wohnungsboerse
800	2023-11-16 12:12:08+01	33449758	Wohnungsboerse
1390	2023-11-16 12:12:11+01	33476560	Wohnungsboerse
470	2023-11-16 12:12:13+01	33481219	Wohnungsboerse
690	2023-11-16 12:12:17+01	33485455	Wohnungsboerse
825	2023-11-16 12:12:19+01	33450133	Wohnungsboerse
990	2023-11-16 12:12:21+01	33504339	Wohnungsboerse
600	2023-11-16 12:12:23+01	33506771	Wohnungsboerse
1199	2023-11-16 12:12:25+01	33513521	Wohnungsboerse
890	2023-11-16 12:12:27+01	33514376	Wohnungsboerse
1272.37	2023-11-16 12:12:29+01	33523027	Wohnungsboerse
445	2023-11-16 12:12:32+01	33532414	Wohnungsboerse
933.77	2023-11-16 12:12:35+01	33530410	Wohnungsboerse
830	2023-11-16 12:12:37+01	32976985	Wohnungsboerse
650	2023-11-16 12:12:39+01	33284573	Wohnungsboerse
750	2023-11-16 12:12:42+01	33347563	Wohnungsboerse
850	2023-11-16 12:12:43+01	33067537	Wohnungsboerse
750	2023-11-16 12:12:46+01	33376142	Wohnungsboerse
1220	2023-11-16 12:12:49+01	33448858	Wohnungsboerse
665	2023-11-16 12:12:51+01	33464631	Wohnungsboerse
483.34	2023-11-16 12:12:54+01	33487740	Wohnungsboerse
599	2023-11-16 12:12:56+01	33493446	Wohnungsboerse
709	2023-11-16 12:12:58+01	33493443	Wohnungsboerse
800	2023-11-16 12:13:01+01	33509761	Wohnungsboerse
575.54	2023-11-16 12:13:03+01	33510563	Wohnungsboerse
790	2023-11-16 12:13:06+01	33515717	Wohnungsboerse
591	2023-11-16 12:13:09+01	33530655	Wohnungsboerse
275	2023-11-16 12:13:11+01	33506595	Wohnungsboerse
800	2023-11-16 12:13:14+01	33506712	Wohnungsboerse
1190	2023-11-16 12:13:17+01	33506830	Wohnungsboerse
295	2023-11-16 12:13:19+01	33509432	Wohnungsboerse
2100	2023-11-16 12:13:22+01	33520073	Wohnungsboerse
960	2023-11-16 12:13:25+01	33528296	Wohnungsboerse
600	2023-11-16 12:13:27+01	33528604	Wohnungsboerse
670	2023-11-16 12:13:29+01	33528677	Wohnungsboerse
672	2023-11-16 12:13:31+01	33530824	Wohnungsboerse
690	2023-11-16 12:13:33+01	33537526	Wohnungsboerse
810	2023-11-16 12:13:36+01	33542915	Wohnungsboerse
590	2023-11-16 12:13:38+01	33544537	Wohnungsboerse
630	2023-11-16 12:13:41+01	33450401	Wohnungsboerse
539.64	2023-11-16 12:13:44+01	33446081	Wohnungsboerse
640	2023-11-16 12:13:46+01	33386081	Wohnungsboerse
573	2023-11-16 12:13:48+01	33509225	Wohnungsboerse
514.8	2023-11-16 12:13:51+01	33509425	Wohnungsboerse
1094.17	2023-11-16 12:13:53+01	33522726	Wohnungsboerse
874.24	2023-11-16 12:13:56+01	33522714	Wohnungsboerse
941.83	2023-11-16 12:13:58+01	33522747	Wohnungsboerse
500	2023-11-16 12:14:00+01	33527240	Wohnungsboerse
1550	2023-11-16 12:14:03+01	33530282	Wohnungsboerse
1250	2023-11-16 12:14:05+01	33530699	Wohnungsboerse
1830	2023-11-16 12:14:08+01	33532831	Wohnungsboerse
1230	2023-11-16 12:14:11+01	33532827	Wohnungsboerse
1400	2023-11-16 12:14:13+01	33532824	Wohnungsboerse
1260	2023-11-16 12:14:15+01	33535061	Wohnungsboerse
1300	2023-11-16 12:14:17+01	33504326	Wohnungsboerse
710	2023-11-16 12:14:20+01	33303915	Wohnungsboerse
690	2023-11-16 12:14:23+01	33075428	Wohnungsboerse
550	2023-11-16 12:14:26+01	33495711	Wohnungsboerse
980	2023-11-16 12:14:29+01	33495909	Wohnungsboerse
590	2023-11-16 12:14:31+01	33495917	Wohnungsboerse
590	2023-11-16 12:14:34+01	33495916	Wohnungsboerse
690	2023-11-16 12:14:37+01	33495915	Wohnungsboerse
1200	2023-11-16 12:14:39+01	33495914	Wohnungsboerse
650	2023-11-16 12:14:41+01	33495913	Wohnungsboerse
781.96	2023-11-16 12:14:44+01	33506903	Wohnungsboerse
1000	2023-11-16 12:14:47+01	33512310	Wohnungsboerse
500	2023-11-16 12:14:50+01	33522372	Wohnungsboerse
3000	2023-11-16 12:14:53+01	33526956	Wohnungsboerse
465	2023-11-16 12:14:55+01	33532187	Wohnungsboerse
495	2023-11-16 12:14:58+01	33404711	Wohnungsboerse
960	2023-11-16 12:15:00+01	33522641	Wohnungsboerse
1800	2023-11-16 12:15:02+01	33534772	Wohnungsboerse
1080	2023-11-16 12:15:04+01	33534966	Wohnungsboerse
1000	2023-11-16 12:15:05+01	33535105	Wohnungsboerse
950	2023-11-16 12:15:08+01	33536332	Wohnungsboerse
574.6	2023-11-16 12:15:10+01	33537906	Wohnungsboerse
590	2023-11-16 12:15:13+01	33539983	Wohnungsboerse
525	2023-11-16 12:15:15+01	33540306	Wohnungsboerse
630	2023-11-16 12:15:18+01	33540647	Wohnungsboerse
1200	2023-11-16 12:15:20+01	33543015	Wohnungsboerse
500	2023-11-16 12:15:22+01	33543126	Wohnungsboerse
2745	2023-11-16 12:15:25+01	33543937	Wohnungsboerse
1230	2023-11-16 12:15:28+01	33513464	Wohnungsboerse
737	2023-11-16 12:15:31+01	33341861	Wohnungsboerse
760	2023-11-16 12:15:33+01	33514857	Wohnungsboerse
1027	2023-11-16 12:15:35+01	33404414	Wohnungsboerse
737	2023-11-16 12:15:39+01	33341901	Wohnungsboerse
782	2023-11-16 12:15:41+01	33329001	Wohnungsboerse
737	2023-11-16 12:15:44+01	33341987	Wohnungsboerse
570	2023-11-16 12:15:46+01	33524155	Wohnungsboerse
4900	2023-11-16 12:15:50+01	33528294	Wohnungsboerse
990	2023-11-16 12:15:52+01	33416750	Wohnungsboerse
1800	2023-11-16 12:15:55+01	33455594	Wohnungsboerse
410	2023-11-16 12:15:57+01	33536431	Wohnungsboerse
1800	2023-11-16 12:15:58+01	33540001	Wohnungsboerse
980	2023-11-16 12:16:01+01	33540375	Wohnungsboerse
895	2023-11-16 12:16:03+01	33544386	Wohnungsboerse
1300	2023-11-16 12:16:06+01	31823448	Wohnungsboerse
1100	2023-11-16 12:16:09+01	33509372	Wohnungsboerse
460.94	2023-11-16 12:16:12+01	33509397	Wohnungsboerse
1900	2023-11-16 12:16:14+01	33260449	Wohnungsboerse
850	2023-11-16 12:16:16+01	33516886	Wohnungsboerse
529	2023-11-16 12:16:18+01	33520265	Wohnungsboerse
580	2023-11-16 12:16:21+01	33522816	Wohnungsboerse
620	2023-11-16 12:16:24+01	33522999	Wohnungsboerse
1500	2023-11-16 12:16:27+01	33493246	Wohnungsboerse
965	2023-11-16 12:16:29+01	33527400	Wohnungsboerse
600	2023-11-16 12:16:32+01	33532668	Wohnungsboerse
850	2023-11-16 12:16:35+01	33514133	Wohnungsboerse
1350	2023-11-16 12:16:37+01	33539943	Wohnungsboerse
1300	2023-11-16 12:16:40+01	33542791	Wohnungsboerse
820	2023-11-16 12:16:42+01	33543320	Wohnungsboerse
3250	2023-11-16 12:16:44+01	33114294	Wohnungsboerse
1610	2023-11-16 12:16:47+01	32875836	Wohnungsboerse
1950	2023-11-16 12:16:49+01	33308983	Wohnungsboerse
1950	2023-11-16 12:16:52+01	33320934	Wohnungsboerse
1100	2023-11-16 12:16:55+01	33397960	Wohnungsboerse
1100	2023-11-16 12:16:58+01	33008456	Wohnungsboerse
1640	2023-11-16 12:17:00+01	32877350	Wohnungsboerse
505	2023-11-16 12:17:02+01	33480003	Wohnungsboerse
1000	2023-11-16 12:17:05+01	33537179	Wohnungsboerse
1980	2023-11-16 12:17:08+01	33537178	Wohnungsboerse
550	2023-11-16 12:17:11+01	33537256	Wohnungsboerse
1775.75	2023-11-16 12:17:13+01	33274394	Wohnungsboerse
690	2023-11-16 12:17:15+01	33489705	Wohnungsboerse
795	2023-11-16 12:17:18+01	33539700	Wohnungsboerse
795	2023-11-16 12:17:21+01	33539699	Wohnungsboerse
795	2023-11-16 12:17:24+01	33539698	Wohnungsboerse
993.86	2023-11-16 12:17:27+01	33539739	Wohnungsboerse
1214.95	2023-11-16 12:17:29+01	33329245	Wohnungsboerse
1800	2023-11-16 12:17:32+01	33069942	Wohnungsboerse
860	2023-11-16 12:17:35+01	33540169	Wohnungsboerse
725	2023-11-16 12:17:37+01	33540383	Wohnungsboerse
1030	2023-11-16 12:17:40+01	33489715	Wohnungsboerse
1640	2023-11-16 12:17:43+01	33380525	Wohnungsboerse
840	2023-11-16 12:17:46+01	33313054	Wohnungsboerse
1081	2023-11-16 12:17:47+01	33432833	Wohnungsboerse
900	2023-11-16 12:17:49+01	33386717	Wohnungsboerse
1420	2023-11-16 12:17:51+01	33473113	Wohnungsboerse
810	2023-11-16 12:17:54+01	33254648	Wohnungsboerse
950	2023-11-16 12:17:55+01	33298728	Wohnungsboerse
735	2023-11-16 12:17:57+01	33537783	Wohnungsboerse
800	2023-11-16 12:18:00+01	33086103	Wohnungsboerse
595	2023-11-16 12:18:01+01	33254812	Wohnungsboerse
1890	2023-11-16 12:18:03+01	32728991	Wohnungsboerse
1790	2023-11-16 12:18:05+01	32728990	Wohnungsboerse
930	2023-11-16 12:18:07+01	33147363	Wohnungsboerse
1550	2023-11-16 12:18:10+01	32853522	Wohnungsboerse
920	2023-11-16 12:18:12+01	33504020	Wohnungsboerse
924	2023-11-16 12:18:14+01	33522771	Wohnungsboerse
860	2023-11-16 12:18:17+01	33504682	Wohnungsboerse
1760	2023-11-16 12:18:20+01	33524121	Wohnungsboerse
8500	2023-11-16 12:18:22+01	33196281	Wohnungsboerse
1850	2023-11-16 12:18:26+01	33196527	Wohnungsboerse
2770	2023-11-16 12:18:28+01	33347939	Wohnungsboerse
4205.76	2023-11-16 12:18:31+01	33360939	Wohnungsboerse
1800	2023-11-16 12:18:33+01	32817541	Wohnungsboerse
1379.88	2023-11-16 12:18:36+01	33445819	Wohnungsboerse
1684.63	2023-11-16 12:18:38+01	33445857	Wohnungsboerse
2200	2023-11-16 12:18:40+01	33422321	Wohnungsboerse
2950	2023-11-16 12:18:43+01	33455178	Wohnungsboerse
690	2023-11-16 12:18:44+01	33483786	Wohnungsboerse
700	2023-11-16 12:18:46+01	33501793	Wohnungsboerse
1390	2023-11-16 12:18:48+01	33504233	Wohnungsboerse
650	2023-11-16 12:18:51+01	33510508	Wohnungsboerse
817	2023-11-16 12:18:54+01	33530733	Wohnungsboerse
700	2023-11-16 12:19:38+01	33535395	Wohnungsboerse
1075.3	2023-11-16 12:19:40+01	33181168	Wohnungsboerse
1038.8	2023-11-16 12:19:42+01	32904956	Wohnungsboerse
498.36	2023-11-16 12:19:44+01	31818244	Wohnungsboerse
687	2023-11-16 12:19:46+01	33455338	Wohnungsboerse
481.92	2023-11-16 12:19:48+01	32442188	Wohnungsboerse
1900	2023-11-16 12:19:50+01	31394882	Wohnungsboerse
1085	2023-11-16 12:19:53+01	33543010	Wohnungsboerse
1450	2023-11-16 12:19:54+01	32375748	Wohnungsboerse
680	2023-11-16 12:19:57+01	33544560	Wohnungsboerse
593.87	2023-11-16 12:19:59+01	33337302	Wohnungsboerse
695	2023-11-16 12:20:01+01	33473469	Wohnungsboerse
580	2023-11-16 12:20:03+01	33537334	Wohnungsboerse
470	2023-11-16 12:20:07+01	31983080	Wohnungsboerse
952	2023-11-16 12:20:09+01	30952139	Wohnungsboerse
1200	2023-11-16 12:20:12+01	29631528	Wohnungsboerse
1200	2023-11-16 12:20:14+01	33449976	Wohnungsboerse
1500	2023-11-16 12:20:17+01	33512469	Wohnungsboerse
1830	2023-11-16 12:20:20+01	33539953	Wohnungsboerse
1050	2023-11-16 12:20:22+01	33440863	Wohnungsboerse
650	2023-11-16 12:20:25+01	33451641	Wohnungsboerse
1785	2023-11-16 12:20:28+01	33245396	Wohnungsboerse
750	2023-11-16 12:20:31+01	33504049	Wohnungsboerse
1300	2023-11-16 12:20:33+01	33506341	Wohnungsboerse
600	2023-11-16 12:20:35+01	33506337	Wohnungsboerse
761	2023-11-16 12:20:38+01	33506806	Wohnungsboerse
990	2023-11-16 12:20:40+01	33516814	Wohnungsboerse
600	2023-11-16 12:20:42+01	33516824	Wohnungsboerse
1116.17	2023-11-16 12:20:44+01	33274310	Wohnungsboerse
1890	2023-11-16 12:20:47+01	32976977	Wohnungsboerse
491.81	2023-11-16 12:20:49+01	33321218	Wohnungsboerse
980	2023-11-16 12:20:52+01	33536017	Wohnungsboerse
730	2023-11-16 12:20:55+01	33495322	Wohnungsboerse
4200	2023-11-16 12:20:57+01	33320901	Wohnungsboerse
500	2023-11-16 12:20:58+01	33365152	Wohnungsboerse
1300	2023-11-16 12:21:01+01	33439057	Wohnungsboerse
1210	2023-11-16 12:21:03+01	33439064	Wohnungsboerse
1340	2023-11-16 12:21:07+01	33462779	Wohnungsboerse
740	2023-11-16 12:21:08+01	33464465	Wohnungsboerse
810	2023-11-16 12:21:09+01	33439071	Wohnungsboerse
1045.08	2023-11-16 12:21:12+01	33506303	Wohnungsboerse
1795	2023-11-16 12:21:14+01	33540488	Wohnungsboerse
1495	2023-11-16 12:21:17+01	33540487	Wohnungsboerse
684	2023-11-16 12:21:19+01	27035171	Wohnungsboerse
1390	2023-11-16 12:21:22+01	33292761	Wohnungsboerse
1348	2023-11-16 12:21:25+01	33425850	Wohnungsboerse
1064	2023-11-16 12:21:28+01	32820355	Wohnungsboerse
1249	2023-11-16 12:21:29+01	33473842	Wohnungsboerse
1300	2023-11-16 12:21:32+01	33455197	Wohnungsboerse
1066	2023-11-16 12:21:35+01	33449817	Wohnungsboerse
1300	2023-11-16 12:21:37+01	33450160	Wohnungsboerse
1089.27	2023-11-16 12:21:40+01	33196576	Wohnungsboerse
1272.31	2023-11-16 12:21:43+01	33479730	Wohnungsboerse
1262.17	2023-11-16 12:21:45+01	33450063	Wohnungsboerse
997	2023-11-16 12:21:46+01	33515794	Wohnungsboerse
2800	2023-11-16 12:21:49+01	33517023	Wohnungsboerse
1045	2023-11-16 12:21:52+01	33535234	Wohnungsboerse
828.2	2023-11-16 12:21:54+01	33396009	Wohnungsboerse
766.92	2023-11-16 12:21:56+01	33331985	Wohnungsboerse
839.16	2023-11-16 12:21:58+01	33402808	Wohnungsboerse
623.31	2023-11-16 12:22:01+01	33457517	Wohnungsboerse
942.96	2023-11-16 12:22:03+01	33501772	Wohnungsboerse
850	2023-11-16 12:22:05+01	33368227	Wohnungsboerse
440	2023-11-16 12:22:07+01	33360934	Wohnungsboerse
375	2023-11-16 12:22:10+01	33282806	Wohnungsboerse
1290	2023-11-16 12:22:12+01	33238207	Wohnungsboerse
450	2023-11-16 12:22:14+01	33282869	Wohnungsboerse
450	2023-11-16 12:22:16+01	33282868	Wohnungsboerse
940	2023-11-16 12:22:18+01	33087408	Wohnungsboerse
267.67	2023-11-16 12:22:21+01	33544567	Wohnungsboerse
450	2023-11-16 12:22:24+01	33544570	Wohnungsboerse
640	2023-11-16 12:22:27+01	33544577	Wohnungsboerse
465	2023-11-16 12:22:29+01	33544581	Wohnungsboerse
490	2023-11-16 12:22:32+01	33510338	Wohnungsboerse
700	2023-11-16 12:22:33+01	33544590	Wohnungsboerse
2650	2023-11-16 12:22:35+01	32917983	Wohnungsboerse
2700	2023-11-16 12:22:37+01	33449689	Wohnungsboerse
1450	2023-11-16 12:22:39+01	33454997	Wohnungsboerse
720	2023-11-16 12:22:42+01	33487464	Wohnungsboerse
560	2023-11-16 12:22:45+01	33487702	Wohnungsboerse
925	2023-11-16 12:22:48+01	33343712	Wohnungsboerse
790	2023-11-16 12:22:51+01	33500418	Wohnungsboerse
1165	2023-11-16 12:22:54+01	33511353	Wohnungsboerse
850	2023-11-16 12:22:55+01	33352134	Wohnungsboerse
1850	2023-11-16 12:22:58+01	33129082	Wohnungsboerse
785	2023-11-16 12:23:01+01	33468770	Wohnungsboerse
3200	2023-11-16 12:23:02+01	33504666	Wohnungsboerse
800	2023-11-16 12:23:05+01	33522695	Wohnungsboerse
765	2023-11-16 12:23:06+01	33544205	Wohnungsboerse
920	2023-11-16 12:23:09+01	32918930	Wohnungsboerse
820	2023-11-16 12:23:12+01	33394176	Wohnungsboerse
730	2023-11-16 12:23:14+01	33439120	Wohnungsboerse
720	2023-11-16 12:23:17+01	33465765	Wohnungsboerse
1035	2023-11-16 12:23:19+01	33393636	Wohnungsboerse
798	2023-11-16 12:23:21+01	33493229	Wohnungsboerse
830	2023-11-16 12:23:24+01	33354625	Wohnungsboerse
1150	2023-11-16 12:23:26+01	33506987	Wohnungsboerse
280	2023-11-16 12:23:28+01	33532345	Wohnungsboerse
379.57	2023-11-16 12:23:31+01	33532632	Wohnungsboerse
1050	2023-11-16 12:23:33+01	33537507	Wohnungsboerse
1900	2023-11-16 12:23:35+01	33288206	Wohnungsboerse
1500	2023-11-16 12:23:37+01	33386349	Wohnungsboerse
1600	2023-11-16 12:23:39+01	33413993	Wohnungsboerse
709	2023-11-16 12:23:42+01	33424462	Wohnungsboerse
656	2023-11-16 12:23:44+01	33355109	Wohnungsboerse
1005.4	2023-11-16 12:23:46+01	32816215	Wohnungsboerse
840	2023-11-16 12:23:48+01	33495564	Wohnungsboerse
970	2023-11-16 12:23:50+01	33495876	Wohnungsboerse
1498	2023-11-16 12:23:52+01	33510322	Wohnungsboerse
1034	2023-11-16 12:23:55+01	33510434	Wohnungsboerse
1300	2023-11-16 12:23:57+01	33514964	Wohnungsboerse
1112	2023-11-16 12:24:00+01	33522340	Wohnungsboerse
1550	2023-11-16 12:24:02+01	33524282	Wohnungsboerse
950	2023-11-16 12:24:05+01	33528095	Wohnungsboerse
839	2023-11-16 12:24:06+01	33409168	Wohnungsboerse
1500	2023-11-16 12:24:08+01	33451563	Wohnungsboerse
869	2023-11-16 12:24:11+01	33343999	Wohnungsboerse
1050	2023-11-16 12:24:13+01	33473152	Wohnungsboerse
538.03	2023-11-16 12:24:16+01	33476079	Wohnungsboerse
902.96	2023-11-16 12:24:19+01	33476080	Wohnungsboerse
980	2023-11-16 12:24:22+01	33480068	Wohnungsboerse
475	2023-11-16 12:24:24+01	33487614	Wohnungsboerse
999	2023-11-16 12:24:27+01	33487613	Wohnungsboerse
829	2023-11-16 12:24:29+01	33487610	Wohnungsboerse
636	2023-11-16 12:24:31+01	33487646	Wohnungsboerse
1197.48	2023-11-16 12:24:33+01	33435007	Wohnungsboerse
561.86	2023-11-16 12:24:35+01	33532126	Wohnungsboerse
600	2023-11-16 12:24:38+01	33532119	Wohnungsboerse
800	2023-11-16 12:24:41+01	33528588	Wohnungsboerse
840	2023-11-16 12:25:20+01	33539687	Wohnungsboerse
1790	2023-11-16 12:25:21+01	33539686	Wohnungsboerse
656	2023-11-16 12:25:24+01	33536167	Wohnungsboerse
2300	2023-11-16 12:25:27+01	33487668	Wohnungsboerse
650	2023-11-16 12:25:30+01	33522403	Wohnungsboerse
1060	2023-11-16 12:25:32+01	33481808	Wohnungsboerse
614	2023-11-16 12:25:35+01	33051217	Wohnungsboerse
912	2023-11-16 12:25:38+01	33479930	Wohnungsboerse
810.81	2023-11-16 12:25:41+01	33002621	Wohnungsboerse
1350	2023-11-16 12:25:43+01	33497192	Wohnungsboerse
435	2023-11-16 12:25:46+01	33519960	Wohnungsboerse
1590	2023-11-16 12:25:49+01	29486749	Wohnungsboerse
995	2023-11-16 12:25:51+01	33093225	Wohnungsboerse
2500	2023-11-16 12:25:54+01	32817705	Wohnungsboerse
1562	2023-11-16 12:25:56+01	32803920	Wohnungsboerse
520	2023-11-16 12:25:58+01	33345380	Wohnungsboerse
465.65	2023-11-16 12:26:00+01	33254653	Wohnungsboerse
640	2023-11-16 12:26:03+01	33299372	Wohnungsboerse
735	2023-11-16 12:26:06+01	33347299	Wohnungsboerse
2925	2023-11-16 12:26:08+01	33259857	Wohnungsboerse
752.77	2023-11-16 12:26:11+01	33432779	Wohnungsboerse
740	2023-11-16 12:26:13+01	33512128	Wohnungsboerse
692.16	2023-11-16 12:26:15+01	33524507	Wohnungsboerse
1500	2023-11-16 12:26:16+01	33513524	Wohnungsboerse
784	2023-11-16 12:26:19+01	33347397	Wohnungsboerse
1250	2023-11-16 12:26:21+01	33481343	Wohnungsboerse
520	2023-11-16 12:26:22+01	33493220	Wohnungsboerse
600	2023-11-16 12:26:25+01	33493371	Wohnungsboerse
504	2023-11-16 12:26:28+01	33509424	Wohnungsboerse
610	2023-11-16 12:26:30+01	33510407	Wohnungsboerse
1075	2023-11-16 12:26:32+01	33458750	Wohnungsboerse
790	2023-11-16 12:26:35+01	33528652	Wohnungsboerse
530	2023-11-16 12:26:37+01	33530758	Wohnungsboerse
990	2023-11-16 12:26:39+01	33535398	Wohnungsboerse
1080	2023-11-16 12:26:42+01	33535914	Wohnungsboerse
800	2023-11-16 12:26:44+01	32111553	Wohnungsboerse
530	2023-11-16 12:26:47+01	33537229	Wohnungsboerse
800	2023-11-16 12:26:49+01	33514955	Wohnungsboerse
875	2023-11-16 12:26:52+01	33360820	Wohnungsboerse
730	2023-11-16 12:26:55+01	33480183	Wohnungsboerse
1750	2023-11-16 12:26:57+01	33489270	Wohnungsboerse
4600	2023-11-16 12:27:00+01	33516901	Wohnungsboerse
810	2023-11-16 12:27:03+01	33198024	Wohnungsboerse
1400	2023-11-16 12:27:06+01	33201711	Wohnungsboerse
864	2023-11-16 12:27:08+01	33203387	Wohnungsboerse
2500	2023-11-16 12:27:11+01	33203372	Wohnungsboerse
850	2023-11-16 12:27:14+01	33213161	Wohnungsboerse
950	2023-11-16 12:27:16+01	33333966	Wohnungsboerse
890	2023-11-16 12:27:18+01	33103145	Wohnungsboerse
614	2023-11-16 12:27:21+01	33487615	Wohnungsboerse
511	2023-11-16 12:27:23+01	33487617	Wohnungsboerse
692	2023-11-16 12:27:25+01	33274520	Wohnungsboerse
1250	2023-11-16 12:27:28+01	33506350	Wohnungsboerse
430	2023-11-16 12:27:29+01	33506504	Wohnungsboerse
700	2023-11-16 12:27:31+01	33506559	Wohnungsboerse
670	2023-11-16 12:27:33+01	33522495	Wohnungsboerse
1568.43	2023-11-16 12:27:35+01	33402892	Wohnungsboerse
1600	2023-11-16 12:27:37+01	33471372	Wohnungsboerse
1150	2023-11-16 12:27:40+01	33485043	Wohnungsboerse
2560	2023-11-16 12:27:42+01	33493623	Wohnungsboerse
735	2023-11-16 12:27:44+01	33480109	Wohnungsboerse
435	2023-11-16 12:27:46+01	33528355	Wohnungsboerse
1790	2023-11-16 12:27:49+01	31571982	Wohnungsboerse
1199	2023-11-16 12:27:51+01	33439092	Wohnungsboerse
805	2023-11-16 12:27:52+01	33479705	Wohnungsboerse
640	2023-11-16 12:27:55+01	33480104	Wohnungsboerse
1590	2023-11-16 12:27:57+01	29486814	Wohnungsboerse
543.41	2023-11-16 12:27:59+01	33509360	Wohnungsboerse
830	2023-11-16 12:28:01+01	33367045	Wohnungsboerse
1500	2023-11-16 12:28:03+01	33522653	Wohnungsboerse
570	2023-11-16 12:28:06+01	33527396	Wohnungsboerse
1135	2023-11-16 12:28:08+01	32705183	Wohnungsboerse
700	2023-11-16 12:28:11+01	33537631	Wohnungsboerse
460	2023-11-16 12:28:14+01	33539834	Wohnungsboerse
580	2023-11-16 12:28:16+01	33543013	Wohnungsboerse
450	2023-11-16 12:28:19+01	33543052	Wohnungsboerse
510	2023-11-16 12:28:21+01	33323829	Wohnungsboerse
990	2023-11-16 12:28:24+01	33524197	Wohnungsboerse
656	2023-11-16 12:28:26+01	33512290	Wohnungsboerse
3000	2023-11-16 12:28:29+01	32941762	Wohnungsboerse
940	2023-11-16 12:28:31+01	33373605	Wohnungsboerse
1360	2023-11-16 12:28:33+01	33455222	Wohnungsboerse
600	2023-11-16 12:28:36+01	33532441	Wohnungsboerse
1250	2023-11-16 12:28:39+01	31786791	Wohnungsboerse
1260	2023-11-16 12:28:42+01	33540498	Wohnungsboerse
780	2023-11-16 12:28:44+01	33542947	Wohnungsboerse
732	2023-11-16 12:28:46+01	33543925	Wohnungsboerse
740	2023-11-16 12:28:49+01	33544125	Wohnungsboerse
420	2023-11-16 12:28:51+01	33544256	Wohnungsboerse
539	2023-11-16 12:28:54+01	33544356	Wohnungsboerse
1200	2023-11-16 12:28:56+01	33475867	Wohnungsboerse
880	2023-11-16 12:28:59+01	33524416	Wohnungsboerse
870	2023-11-16 12:29:00+01	33501784	Wohnungsboerse
1610	2023-11-16 12:29:03+01	33501783	Wohnungsboerse
1560	2023-11-16 12:29:05+01	33501782	Wohnungsboerse
1100	2023-11-16 12:29:07+01	33501781	Wohnungsboerse
1340	2023-11-16 12:29:10+01	33501780	Wohnungsboerse
1620	2023-11-16 12:29:12+01	33501779	Wohnungsboerse
650	2023-11-16 12:29:13+01	33534951	Wohnungsboerse
1260	2023-11-16 12:29:16+01	33537287	Wohnungsboerse
790	2023-11-16 12:29:18+01	33392135	Wohnungsboerse
1620	2023-11-16 12:29:20+01	33539937	Wohnungsboerse
1250	2023-11-16 12:29:23+01	33542810	Wohnungsboerse
800	2023-11-16 12:29:25+01	33543940	Wohnungsboerse
1750	2023-11-16 12:29:27+01	33448480	Wohnungsboerse
1650	2023-11-16 12:29:30+01	33501511	Wohnungsboerse
3800	2023-11-16 12:29:33+01	33504182	Wohnungsboerse
660	2023-11-16 12:29:35+01	33512379	Wohnungsboerse
660	2023-11-16 12:29:37+01	33487524	Wohnungsboerse
490	2023-11-16 12:29:39+01	33495369	Wohnungsboerse
1000	2023-11-16 12:29:42+01	33501375	Wohnungsboerse
445	2023-11-16 12:29:44+01	33070027	Wohnungsboerse
863	2023-11-16 12:29:46+01	32831795	Wohnungsboerse
995	2023-11-16 12:29:49+01	33418897	Wohnungsboerse
838	2023-11-16 12:29:51+01	33509416	Wohnungsboerse
630	2023-11-16 12:29:54+01	33522781	Wohnungsboerse
1500	2023-11-16 12:29:56+01	33528045	Wohnungsboerse
1250	2023-11-16 12:29:58+01	33530197	Wohnungsboerse
1100	2023-11-16 12:30:00+01	33534982	Wohnungsboerse
900	2023-11-16 12:30:02+01	33535007	Wohnungsboerse
1150	2023-11-16 12:30:05+01	33537259	Wohnungsboerse
950	2023-11-16 12:30:06+01	33543316	Wohnungsboerse
690	2023-11-16 12:30:09+01	33337558	Wohnungsboerse
850	2023-11-16 12:30:11+01	33203773	Wohnungsboerse
910	2023-11-16 12:30:13+01	33501589	Wohnungsboerse
550.46	2023-11-16 12:30:16+01	33509409	Wohnungsboerse
1270	2023-11-16 12:30:19+01	33519879	Wohnungsboerse
850	2023-11-16 12:30:21+01	33485714	Wohnungsboerse
759	2023-11-16 12:30:23+01	33095129	Wohnungsboerse
694	2023-11-16 12:30:25+01	33477151	Wohnungsboerse
523.66	2023-11-16 12:30:28+01	33489488	Wohnungsboerse
593.38	2023-11-16 12:30:30+01	33493230	Wohnungsboerse
570.85	2023-11-16 12:30:33+01	33493584	Wohnungsboerse
1290	2023-11-16 12:30:35+01	33506290	Wohnungsboerse
1050	2023-11-16 12:30:37+01	33509212	Wohnungsboerse
1400	2023-11-16 12:30:39+01	33509349	Wohnungsboerse
730	2023-11-16 12:30:41+01	33514993	Wohnungsboerse
1200	2023-11-16 12:30:44+01	33475843	Wohnungsboerse
400	2023-11-16 12:30:48+01	33519871	Wohnungsboerse
790	2023-11-16 12:30:49+01	33530272	Wohnungsboerse
1190	2023-11-16 12:30:52+01	32772403	Wohnungsboerse
500	2023-11-16 12:30:55+01	33522741	Wohnungsboerse
600	2023-11-16 12:30:57+01	33528712	Wohnungsboerse
1700	2023-11-16 12:31:00+01	33530222	Wohnungsboerse
1950	2023-11-16 12:31:03+01	33481733	Wohnungsboerse
465	2023-11-16 12:31:05+01	33535153	Wohnungsboerse
1160	2023-11-16 12:31:08+01	33535198	Wohnungsboerse
1774	2023-11-16 12:31:10+01	33535233	Wohnungsboerse
1400	2023-11-16 12:31:13+01	33535404	Wohnungsboerse
650	2023-11-16 12:31:16+01	33270460	Wohnungsboerse
1500	2023-11-16 12:31:18+01	33535983	Wohnungsboerse
1450	2023-11-16 12:31:21+01	33539840	Wohnungsboerse
415	2023-11-16 12:31:23+01	33540021	Wohnungsboerse
1098	2023-11-16 12:31:24+01	33540638	Wohnungsboerse
1250	2023-11-16 12:31:27+01	33543088	Wohnungsboerse
1450	2023-11-16 12:31:29+01	33444315	Wohnungsboerse
750	2023-11-16 12:31:31+01	33497987	Wohnungsboerse
1072	2023-11-16 12:31:34+01	33197979	Wohnungsboerse
1500	2023-11-16 12:31:36+01	33497983	Wohnungsboerse
1000	2023-11-16 12:31:39+01	33509320	Wohnungsboerse
1200	2023-11-16 12:31:42+01	33514978	Wohnungsboerse
1592.94	2023-11-16 12:31:43+01	33522565	Wohnungsboerse
1700	2023-11-16 12:31:46+01	33524106	Wohnungsboerse
620	2023-11-16 12:31:49+01	33527184	Wohnungsboerse
2400	2023-11-16 12:31:52+01	33530252	Wohnungsboerse
1649	2023-11-16 12:31:54+01	33537199	Wohnungsboerse
1170	2023-11-16 12:31:57+01	33537448	Wohnungsboerse
630	2023-11-16 12:32:00+01	33539927	Wohnungsboerse
480	2023-11-16 12:32:01+01	33544210	Wohnungsboerse
730	2023-11-16 12:32:04+01	33002011	Wohnungsboerse
1040	2023-11-16 12:32:05+01	33537171	Wohnungsboerse
725	2023-11-16 12:32:08+01	32859694	Wohnungsboerse
1380	2023-11-16 12:32:11+01	32555875	Wohnungsboerse
750	2023-11-16 12:32:13+01	33539689	Wohnungsboerse
1120	2023-11-16 12:32:16+01	33539688	Wohnungsboerse
1595	2023-11-16 12:32:19+01	33539685	Wohnungsboerse
1190	2023-11-16 12:32:22+01	33539684	Wohnungsboerse
2125	2023-11-16 12:32:25+01	33539683	Wohnungsboerse
950	2023-11-16 12:32:27+01	33539682	Wohnungsboerse
920	2023-11-16 12:32:29+01	33539749	Wohnungsboerse
550	2023-11-16 12:32:32+01	33451817	Wohnungsboerse
2920	2023-11-23 12:03:03+01	33022819	Wohnungsboerse
1890	2023-11-23 12:03:06+01	32728992	Wohnungsboerse
800	2023-11-23 12:03:08+01	28806724	Wohnungsboerse
515	2023-11-23 12:03:11+01	33562350	Wohnungsboerse
800	2023-11-23 12:03:13+01	31766932	Wohnungsboerse
1100	2023-11-23 12:03:16+01	33561557	Wohnungsboerse
442	2023-11-23 12:03:18+01	33504688	Wohnungsboerse
590	2023-11-23 12:03:20+01	33495917	Wohnungsboerse
1100	2023-11-23 12:03:22+01	33321367	Wohnungsboerse
860	2023-11-23 12:03:25+01	33562871	Wohnungsboerse
1094.17	2023-11-23 12:03:28+01	33522726	Wohnungsboerse
1200	2023-11-23 12:03:30+01	33383272	Wohnungsboerse
830	2023-11-23 12:03:33+01	32976985	Wohnungsboerse
825	2023-11-23 12:03:35+01	33450133	Wohnungsboerse
2650	2023-11-23 12:03:38+01	33504518	Wohnungsboerse
1700	2023-11-23 12:03:39+01	31549941	Wohnungsboerse
1891	2023-11-23 12:03:41+01	32697715	Wohnungsboerse
985	2023-11-23 12:03:44+01	32642467	Wohnungsboerse
1840	2023-11-23 12:03:47+01	32642458	Wohnungsboerse
1705	2023-11-23 12:03:49+01	33050991	Wohnungsboerse
2009	2023-11-23 12:03:52+01	32966061	Wohnungsboerse
2590	2023-11-23 12:03:54+01	33354570	Wohnungsboerse
2225	2023-11-23 12:03:56+01	32804194	Wohnungsboerse
943	2023-11-23 12:03:58+01	33391895	Wohnungsboerse
965	2023-11-23 12:04:01+01	33489268	Wohnungsboerse
2031	2023-11-23 12:04:03+01	33539691	Wohnungsboerse
1490	2023-11-23 12:04:05+01	33539690	Wohnungsboerse
820	2023-11-23 12:04:08+01	33318532	Wohnungsboerse
1520	2023-11-23 12:04:10+01	33341744	Wohnungsboerse
1430	2023-11-23 12:04:12+01	33355426	Wohnungsboerse
1550	2023-11-23 12:04:14+01	33355443	Wohnungsboerse
1250	2023-11-23 12:04:17+01	33366949	Wohnungsboerse
2950	2023-11-23 12:04:20+01	32489228	Wohnungsboerse
1550	2023-11-23 12:04:22+01	32848279	Wohnungsboerse
737	2023-11-23 12:04:25+01	33495937	Wohnungsboerse
1400	2023-11-23 12:04:27+01	33435206	Wohnungsboerse
1450	2023-11-23 12:04:29+01	33506206	Wohnungsboerse
1400	2023-11-23 12:04:32+01	33565901	Wohnungsboerse
1400	2023-11-23 12:04:35+01	33578811	Wohnungsboerse
1470	2023-11-23 12:04:37+01	33582266	Wohnungsboerse
499	2023-11-23 12:04:39+01	33592705	Wohnungsboerse
8480	2023-11-23 12:04:42+01	30752723	Wohnungsboerse
11040	2023-11-23 12:04:45+01	27092375	Wohnungsboerse
6850	2023-11-23 12:04:47+01	31193233	Wohnungsboerse
6576	2023-11-23 12:04:50+01	27092355	Wohnungsboerse
1410	2023-11-23 12:04:52+01	33565868	Wohnungsboerse
1400	2023-11-23 12:04:55+01	33368188	Wohnungsboerse
6850	2023-11-23 12:04:57+01	32747252	Wohnungsboerse
1100	2023-11-23 12:04:59+01	33449855	Wohnungsboerse
550	2023-11-23 12:05:01+01	33582215	Wohnungsboerse
2555	2023-11-23 12:05:03+01	33572057	Wohnungsboerse
1500	2023-11-23 12:05:05+01	33592796	Wohnungsboerse
2950	2023-11-23 12:05:08+01	33592994	Wohnungsboerse
1200	2023-11-23 12:05:10+01	33593028	Wohnungsboerse
1650	2023-11-23 12:05:12+01	33594335	Wohnungsboerse
990	2023-11-23 12:05:14+01	33504339	Wohnungsboerse
600	2023-11-23 12:05:17+01	33506771	Wohnungsboerse
1199	2023-11-23 12:05:19+01	33513521	Wohnungsboerse
1272.37	2023-11-23 12:05:22+01	33523027	Wohnungsboerse
580	2023-11-23 12:05:25+01	33552346	Wohnungsboerse
990	2023-11-23 12:05:28+01	33554923	Wohnungsboerse
620.91	2023-11-23 12:05:29+01	33555215	Wohnungsboerse
970	2023-11-23 12:05:31+01	33574602	Wohnungsboerse
900	2023-11-23 12:05:34+01	33574636	Wohnungsboerse
849.79	2023-11-23 12:05:36+01	33552309	Wohnungsboerse
950	2023-11-23 12:05:39+01	33576718	Wohnungsboerse
600	2023-11-23 12:05:41+01	33580297	Wohnungsboerse
995	2023-11-23 12:05:44+01	33590642	Wohnungsboerse
593.07	2023-11-23 12:05:47+01	33594278	Wohnungsboerse
650	2023-11-23 12:05:49+01	33284573	Wohnungsboerse
750	2023-11-23 12:05:52+01	33347563	Wohnungsboerse
850	2023-11-23 12:05:55+01	33067537	Wohnungsboerse
750	2023-11-23 12:05:57+01	33376142	Wohnungsboerse
665	2023-11-23 12:05:59+01	33464631	Wohnungsboerse
599	2023-11-23 12:06:01+01	33493446	Wohnungsboerse
709	2023-11-23 12:06:04+01	33493443	Wohnungsboerse
800	2023-11-23 12:06:07+01	33509761	Wohnungsboerse
575.54	2023-11-23 12:06:09+01	33510563	Wohnungsboerse
580	2023-11-23 12:06:12+01	33548846	Wohnungsboerse
600	2023-11-23 12:06:15+01	33550728	Wohnungsboerse
500	2023-11-23 12:06:18+01	33583867	Wohnungsboerse
650	2023-11-23 12:06:20+01	33458867	Wohnungsboerse
1395	2023-11-23 12:06:23+01	33574117	Wohnungsboerse
630	2023-11-23 12:06:25+01	33574691	Wohnungsboerse
590	2023-11-23 12:06:28+01	33574690	Wohnungsboerse
790	2023-11-23 12:06:30+01	33576153	Wohnungsboerse
1300	2023-11-23 12:06:32+01	33581974	Wohnungsboerse
620	2023-11-23 12:06:34+01	33591293	Wohnungsboerse
1050	2023-11-23 12:06:36+01	33564039	Wohnungsboerse
600	2023-11-23 12:06:38+01	33593100	Wohnungsboerse
750	2023-11-23 12:06:42+01	33593793	Wohnungsboerse
1190	2023-11-23 12:06:44+01	33593849	Wohnungsboerse
1520	2023-11-23 12:06:46+01	33594089	Wohnungsboerse
810	2023-11-23 12:06:49+01	33594519	Wohnungsboerse
425	2023-11-23 12:06:51+01	33594575	Wohnungsboerse
874.24	2023-11-23 12:06:53+01	33522714	Wohnungsboerse
941.83	2023-11-23 12:06:55+01	33522747	Wohnungsboerse
1550	2023-11-23 12:06:57+01	33530282	Wohnungsboerse
1250	2023-11-23 12:07:00+01	33530699	Wohnungsboerse
1830	2023-11-23 12:07:02+01	33532831	Wohnungsboerse
1230	2023-11-23 12:07:05+01	33532827	Wohnungsboerse
1400	2023-11-23 12:07:07+01	33532824	Wohnungsboerse
1260	2023-11-23 12:07:09+01	33535061	Wohnungsboerse
690	2023-11-23 12:07:12+01	33557209	Wohnungsboerse
550	2023-11-23 12:07:15+01	33564109	Wohnungsboerse
1034	2023-11-23 12:07:18+01	33565029	Wohnungsboerse
500	2023-11-23 12:07:20+01	33578717	Wohnungsboerse
700	2023-11-23 12:07:23+01	33579780	Wohnungsboerse
1315	2023-11-23 12:07:25+01	33583884	Wohnungsboerse
600	2023-11-23 12:07:28+01	33565077	Wohnungsboerse
880	2023-11-23 12:07:31+01	33568166	Wohnungsboerse
1340	2023-11-23 12:07:33+01	33557618	Wohnungsboerse
510	2023-11-23 12:07:35+01	33578535	Wohnungsboerse
1025	2023-11-23 12:07:37+01	33579818	Wohnungsboerse
1200	2023-11-23 12:07:40+01	33552126	Wohnungsboerse
920	2023-11-23 12:07:41+01	33515788	Wohnungsboerse
750	2023-11-23 12:07:44+01	33563212	Wohnungsboerse
1000	2023-11-23 12:07:47+01	33586087	Wohnungsboerse
1398	2023-11-23 12:07:50+01	33587284	Wohnungsboerse
900	2023-11-23 12:07:51+01	33407255	Wohnungsboerse
590	2023-11-23 12:07:53+01	33590803	Wohnungsboerse
500	2023-11-23 12:07:56+01	33593092	Wohnungsboerse
1100	2023-11-23 12:07:58+01	33594620	Wohnungsboerse
700	2023-11-23 12:08:01+01	33477583	Wohnungsboerse
1300	2023-11-23 12:08:04+01	31823448	Wohnungsboerse
415	2023-11-23 12:08:06+01	33587009	Wohnungsboerse
590	2023-11-23 12:08:08+01	33495916	Wohnungsboerse
690	2023-11-23 12:08:11+01	33495915	Wohnungsboerse
1200	2023-11-23 12:08:13+01	33495914	Wohnungsboerse
650	2023-11-23 12:08:16+01	33495913	Wohnungsboerse
1000	2023-11-23 12:08:18+01	33512310	Wohnungsboerse
1060	2023-11-23 12:08:21+01	33481648	Wohnungsboerse
2500	2023-11-23 12:08:24+01	33526956	Wohnungsboerse
690	2023-11-23 12:08:27+01	33075428	Wohnungsboerse
625	2023-11-23 12:08:29+01	33565203	Wohnungsboerse
674	2023-11-23 12:08:32+01	33565903	Wohnungsboerse
522	2023-11-23 12:08:34+01	33571818	Wohnungsboerse
650	2023-11-23 12:08:36+01	33303915	Wohnungsboerse
312	2023-11-23 12:08:39+01	33584297	Wohnungsboerse
1000	2023-11-23 12:08:41+01	33589277	Wohnungsboerse
1050	2023-11-23 12:08:43+01	33574764	Wohnungsboerse
798	2023-11-23 12:08:47+01	33578524	Wohnungsboerse
540	2023-11-23 12:08:49+01	33576087	Wohnungsboerse
745	2023-11-23 12:08:51+01	33578831	Wohnungsboerse
6900	2023-11-23 12:08:53+01	33579971	Wohnungsboerse
715.2	2023-11-23 12:08:56+01	33580280	Wohnungsboerse
294.38	2023-11-23 12:08:58+01	33580279	Wohnungsboerse
292.12	2023-11-23 12:09:01+01	33580278	Wohnungsboerse
738.75	2023-11-23 12:09:03+01	33580277	Wohnungsboerse
718.95	2023-11-23 12:09:07+01	33580276	Wohnungsboerse
610	2023-11-23 12:09:09+01	33582156	Wohnungsboerse
1790	2023-11-23 12:09:10+01	33584351	Wohnungsboerse
3420	2023-11-23 12:09:13+01	33590777	Wohnungsboerse
444	2023-11-23 12:09:15+01	33593059	Wohnungsboerse
830	2023-11-23 12:09:18+01	33562493	Wohnungsboerse
1200	2023-11-23 12:09:21+01	33565071	Wohnungsboerse
620	2023-11-23 12:09:23+01	33522999	Wohnungsboerse
529	2023-11-23 12:09:26+01	33571897	Wohnungsboerse
580	2023-11-23 12:09:28+01	33574371	Wohnungsboerse
418.22	2023-11-23 12:09:30+01	33580275	Wohnungsboerse
589.46	2023-11-23 12:09:33+01	33580274	Wohnungsboerse
296.44	2023-11-23 12:09:36+01	33580271	Wohnungsboerse
1015	2023-11-23 12:09:38+01	33582178	Wohnungsboerse
860	2023-11-23 12:09:40+01	33584315	Wohnungsboerse
520	2023-11-23 12:09:44+01	33586970	Wohnungsboerse
693.35	2023-11-23 12:09:45+01	33587504	Wohnungsboerse
1130	2023-11-23 12:09:48+01	33593024	Wohnungsboerse
870	2023-11-23 12:09:51+01	33594318	Wohnungsboerse
3250	2023-11-23 12:09:53+01	33114294	Wohnungsboerse
1950	2023-11-23 12:09:55+01	33308983	Wohnungsboerse
1950	2023-11-23 12:09:58+01	33320934	Wohnungsboerse
505	2023-11-23 12:10:01+01	33480003	Wohnungsboerse
730	2023-11-23 12:10:04+01	33563039	Wohnungsboerse
704	2023-11-23 12:10:07+01	33567160	Wohnungsboerse
1414.69	2023-11-23 12:10:09+01	33571647	Wohnungsboerse
980	2023-11-23 12:10:11+01	33571866	Wohnungsboerse
590	2023-11-23 12:10:13+01	33574566	Wohnungsboerse
520	2023-11-23 12:10:16+01	33576199	Wohnungsboerse
1220	2023-11-23 12:10:19+01	33582044	Wohnungsboerse
1050	2023-11-23 12:10:20+01	33583631	Wohnungsboerse
1000	2023-11-23 12:10:23+01	33583877	Wohnungsboerse
1350	2023-11-23 12:10:25+01	33587101	Wohnungsboerse
1030	2023-11-23 12:10:27+01	33489715	Wohnungsboerse
860	2023-11-23 12:10:30+01	33590892	Wohnungsboerse
530	2023-11-23 12:10:32+01	33593057	Wohnungsboerse
356.59	2023-11-23 12:10:35+01	33593894	Wohnungsboerse
840	2023-11-23 12:10:37+01	33313054	Wohnungsboerse
1081	2023-11-23 12:10:40+01	33432833	Wohnungsboerse
810	2023-11-23 12:10:42+01	33254648	Wohnungsboerse
900	2023-11-23 12:10:44+01	33225904	Wohnungsboerse
950	2023-11-23 12:10:46+01	33298728	Wohnungsboerse
735	2023-11-23 12:10:49+01	33537783	Wohnungsboerse
800	2023-11-23 12:10:51+01	33086103	Wohnungsboerse
1272	2023-11-23 12:10:54+01	33562233	Wohnungsboerse
1640	2023-11-23 12:10:57+01	33564205	Wohnungsboerse
1530	2023-11-23 12:11:00+01	33565975	Wohnungsboerse
830	2023-11-23 12:11:03+01	33566839	Wohnungsboerse
1150	2023-11-23 12:11:04+01	33576669	Wohnungsboerse
650	2023-11-23 12:11:06+01	33584331	Wohnungsboerse
955.79	2023-11-23 12:11:09+01	33594334	Wohnungsboerse
595	2023-11-23 12:11:11+01	33254812	Wohnungsboerse
1890	2023-11-23 12:11:15+01	32728991	Wohnungsboerse
1790	2023-11-23 12:11:17+01	32728990	Wohnungsboerse
930	2023-11-23 12:11:19+01	33147363	Wohnungsboerse
1550	2023-11-23 12:11:21+01	32853522	Wohnungsboerse
920	2023-11-23 12:11:24+01	33504020	Wohnungsboerse
924	2023-11-23 12:11:27+01	33522771	Wohnungsboerse
860	2023-11-23 12:11:30+01	33504682	Wohnungsboerse
1550	2023-11-23 12:11:32+01	33589759	Wohnungsboerse
1760	2023-11-23 12:11:35+01	33524121	Wohnungsboerse
2480	2023-11-23 12:11:38+01	31210714	Wohnungsboerse
8500	2023-11-23 12:11:39+01	33196281	Wohnungsboerse
1850	2023-11-23 12:11:42+01	33196527	Wohnungsboerse
1800	2023-11-23 12:11:45+01	32817541	Wohnungsboerse
1379.88	2023-11-23 12:11:49+01	33445819	Wohnungsboerse
1684.63	2023-11-23 12:11:50+01	33445857	Wohnungsboerse
2200	2023-11-23 12:11:52+01	33422321	Wohnungsboerse
2950	2023-11-23 12:11:55+01	33455178	Wohnungsboerse
1742	2023-11-23 12:11:57+01	32706775	Wohnungsboerse
700	2023-11-23 12:12:00+01	33501793	Wohnungsboerse
817	2023-11-23 12:12:02+01	33530733	Wohnungsboerse
650	2023-11-23 12:12:04+01	33561496	Wohnungsboerse
450	2023-11-23 12:12:07+01	33576712	Wohnungsboerse
2770	2023-11-23 12:12:09+01	33347939	Wohnungsboerse
700	2023-11-23 12:12:53+01	33535395	Wohnungsboerse
839	2023-11-23 12:12:56+01	33344005	Wohnungsboerse
840	2023-11-23 12:12:59+01	33495564	Wohnungsboerse
498.36	2023-11-23 12:13:01+01	31818244	Wohnungsboerse
687	2023-11-23 12:13:04+01	33455338	Wohnungsboerse
481.92	2023-11-23 12:13:06+01	32442188	Wohnungsboerse
1900	2023-11-23 12:13:09+01	31394882	Wohnungsboerse
580	2023-11-23 12:13:11+01	33594616	Wohnungsboerse
1450	2023-11-23 12:13:15+01	32375748	Wohnungsboerse
2650	2023-11-23 12:13:17+01	32917983	Wohnungsboerse
828.2	2023-11-23 12:13:20+01	33396009	Wohnungsboerse
695	2023-11-23 12:13:22+01	33473469	Wohnungsboerse
762	2023-11-23 12:13:25+01	33578486	Wohnungsboerse
2500	2023-11-23 12:13:26+01	32188005	Wohnungsboerse
952	2023-11-23 12:13:29+01	30952139	Wohnungsboerse
920	2023-11-23 12:13:31+01	29314952	Wohnungsboerse
1500	2023-11-23 12:13:34+01	33512469	Wohnungsboerse
1830	2023-11-23 12:13:37+01	33568443	Wohnungsboerse
650	2023-11-23 12:13:40+01	29317989	Wohnungsboerse
1200	2023-11-23 12:13:42+01	29631528	Wohnungsboerse
1050	2023-11-23 12:13:45+01	33440863	Wohnungsboerse
1300	2023-11-23 12:13:47+01	33506341	Wohnungsboerse
1890	2023-11-23 12:13:49+01	32976977	Wohnungsboerse
730	2023-11-23 12:13:52+01	33495322	Wohnungsboerse
1330	2023-11-23 12:13:54+01	33548624	Wohnungsboerse
1785	2023-11-23 12:13:56+01	33245396	Wohnungsboerse
955	2023-11-23 12:13:59+01	33572182	Wohnungsboerse
1116.17	2023-11-23 12:14:02+01	33274310	Wohnungsboerse
796.03	2023-11-23 12:14:04+01	33576147	Wohnungsboerse
990	2023-11-23 12:14:06+01	33516814	Wohnungsboerse
750	2023-11-23 12:14:08+01	33557681	Wohnungsboerse
980	2023-11-23 12:14:10+01	33589487	Wohnungsboerse
1210	2023-11-23 12:14:12+01	33439064	Wohnungsboerse
1340	2023-11-23 12:14:15+01	33462779	Wohnungsboerse
810	2023-11-23 12:14:16+01	33439071	Wohnungsboerse
1495	2023-11-23 12:14:19+01	33540487	Wohnungsboerse
1795	2023-11-23 12:14:22+01	33540488	Wohnungsboerse
1168.83	2023-11-23 12:14:24+01	33384509	Wohnungsboerse
684	2023-11-23 12:14:27+01	27035171	Wohnungsboerse
1348	2023-11-23 12:14:29+01	33425850	Wohnungsboerse
1064	2023-11-23 12:14:31+01	32820355	Wohnungsboerse
1066	2023-11-23 12:14:34+01	33449817	Wohnungsboerse
1089.27	2023-11-23 12:14:36+01	33196576	Wohnungsboerse
1272.31	2023-11-23 12:14:40+01	33479730	Wohnungsboerse
1262.17	2023-11-23 12:14:42+01	33450063	Wohnungsboerse
997	2023-11-23 12:14:45+01	33515794	Wohnungsboerse
2800	2023-11-23 12:14:47+01	33517023	Wohnungsboerse
1158.43	2023-11-23 12:14:49+01	33546732	Wohnungsboerse
1390	2023-11-23 12:14:51+01	33292761	Wohnungsboerse
986	2023-11-23 12:14:54+01	33589476	Wohnungsboerse
1300	2023-11-23 12:14:57+01	33455197	Wohnungsboerse
999	2023-11-23 12:14:58+01	33579841	Wohnungsboerse
500	2023-11-23 12:15:01+01	33587205	Wohnungsboerse
580	2023-11-23 12:15:04+01	33591071	Wohnungsboerse
766.92	2023-11-23 12:15:06+01	33331985	Wohnungsboerse
839.16	2023-11-23 12:15:09+01	33402808	Wohnungsboerse
623.31	2023-11-23 12:15:12+01	33457517	Wohnungsboerse
942.96	2023-11-23 12:15:15+01	33501772	Wohnungsboerse
2700	2023-11-23 12:15:18+01	33449689	Wohnungsboerse
720	2023-11-23 12:15:21+01	33487464	Wohnungsboerse
560	2023-11-23 12:15:24+01	33487702	Wohnungsboerse
1165	2023-11-23 12:15:26+01	33511353	Wohnungsboerse
850	2023-11-23 12:15:29+01	33352134	Wohnungsboerse
1850	2023-11-23 12:15:33+01	33129082	Wohnungsboerse
790	2023-11-23 12:15:35+01	33550840	Wohnungsboerse
700	2023-11-23 12:15:37+01	33557375	Wohnungsboerse
990	2023-11-23 12:15:39+01	33546839	Wohnungsboerse
1150	2023-11-23 12:15:42+01	33579993	Wohnungsboerse
925	2023-11-23 12:15:44+01	33343712	Wohnungsboerse
1478	2023-11-23 12:15:48+01	33594623	Wohnungsboerse
295	2023-11-23 12:15:48+01	33594643	Wohnungsboerse
1030	2023-11-23 12:15:52+01	33594637	Wohnungsboerse
504	2023-11-23 12:15:54+01	33594631	Wohnungsboerse
282	2023-11-23 12:15:56+01	33594722	Wohnungsboerse
850	2023-11-23 12:15:59+01	33568292	Wohnungsboerse
820	2023-11-23 12:16:01+01	33552709	Wohnungsboerse
700	2023-11-23 12:16:04+01	33552708	Wohnungsboerse
1200	2023-11-23 12:16:07+01	33483731	Wohnungsboerse
280.3	2023-11-23 12:16:09+01	33594757	Wohnungsboerse
248.65	2023-11-23 12:16:11+01	33594762	Wohnungsboerse
1799	2023-11-23 12:16:13+01	33242019	Wohnungsboerse
525	2023-11-23 12:16:16+01	33525071	Wohnungsboerse
800	2023-11-23 12:16:18+01	33522695	Wohnungsboerse
765	2023-11-23 12:16:21+01	33544205	Wohnungsboerse
920	2023-11-23 12:16:24+01	32918930	Wohnungsboerse
1035	2023-11-23 12:16:26+01	33393636	Wohnungsboerse
379.57	2023-11-23 12:16:29+01	33532632	Wohnungsboerse
830	2023-11-23 12:16:31+01	33354625	Wohnungsboerse
623	2023-11-23 12:16:34+01	33554994	Wohnungsboerse
743	2023-11-23 12:16:36+01	33564179	Wohnungsboerse
526.83	2023-11-23 12:16:38+01	33560204	Wohnungsboerse
533	2023-11-23 12:16:41+01	33584081	Wohnungsboerse
1050	2023-11-23 12:16:44+01	33589244	Wohnungsboerse
970	2023-11-23 12:16:46+01	33495876	Wohnungsboerse
1498	2023-11-23 12:16:47+01	33510322	Wohnungsboerse
1300	2023-11-23 12:16:50+01	33514964	Wohnungsboerse
1550	2023-11-23 12:16:53+01	33524282	Wohnungsboerse
950	2023-11-23 12:16:54+01	33528095	Wohnungsboerse
934.75	2023-11-23 12:16:57+01	33548181	Wohnungsboerse
415	2023-11-23 12:17:00+01	33555182	Wohnungsboerse
624	2023-11-23 12:17:02+01	33565734	Wohnungsboerse
535	2023-11-23 12:17:04+01	33583666	Wohnungsboerse
670	2023-11-23 12:17:07+01	33583944	Wohnungsboerse
896	2023-11-23 12:17:09+01	33196294	Wohnungsboerse
720	2023-11-23 12:17:12+01	33584182	Wohnungsboerse
959	2023-11-23 12:17:14+01	32816215	Wohnungsboerse
1050	2023-11-23 12:17:16+01	33592784	Wohnungsboerse
859	2023-11-23 12:17:19+01	33344004	Wohnungsboerse
839	2023-11-23 12:17:22+01	33409168	Wohnungsboerse
869	2023-11-23 12:17:24+01	33343999	Wohnungsboerse
538.03	2023-11-23 12:17:27+01	33476079	Wohnungsboerse
902.96	2023-11-23 12:17:30+01	33476080	Wohnungsboerse
475	2023-11-23 12:17:32+01	33487614	Wohnungsboerse
999	2023-11-23 12:17:35+01	33487613	Wohnungsboerse
829	2023-11-23 12:17:38+01	33487610	Wohnungsboerse
636	2023-11-23 12:17:40+01	33487646	Wohnungsboerse
1197.48	2023-11-23 12:17:43+01	33435007	Wohnungsboerse
600	2023-11-23 12:17:45+01	33532119	Wohnungsboerse
681	2023-11-23 12:17:48+01	33343991	Wohnungsboerse
869	2023-11-23 12:17:50+01	33344003	Wohnungsboerse
460	2023-11-23 12:17:52+01	33594449	Wohnungsboerse
440	2023-11-23 12:17:54+01	33578357	Wohnungsboerse
4900	2023-11-23 12:17:57+01	33560362	Wohnungsboerse
550	2023-11-23 12:17:59+01	33593157	Wohnungsboerse
1035	2023-11-23 12:18:39+01	33524613	Wohnungsboerse
1000	2023-11-23 12:18:42+01	33576292	Wohnungsboerse
900	2023-11-23 12:18:44+01	33562279	Wohnungsboerse
620	2023-11-23 12:18:47+01	33527184	Wohnungsboerse
930	2023-11-23 12:18:50+01	33578504	Wohnungsboerse
1050	2023-11-23 12:18:53+01	33509212	Wohnungsboerse
910	2023-11-23 12:18:55+01	33501589	Wohnungsboerse
1400	2023-11-23 12:18:57+01	33546171	Wohnungsboerse
810.81	2023-11-23 12:19:00+01	33002621	Wohnungsboerse
1450	2023-11-23 12:19:03+01	33351683	Wohnungsboerse
590	2023-11-23 12:19:05+01	33566730	Wohnungsboerse
1199	2023-11-23 12:19:07+01	33439092	Wohnungsboerse
2560	2023-11-23 12:19:09+01	33493623	Wohnungsboerse
2500	2023-11-23 12:19:11+01	32817705	Wohnungsboerse
875	2023-11-23 12:19:13+01	33360820	Wohnungsboerse
370	2023-11-23 12:19:15+01	33237768	Wohnungsboerse
465.65	2023-11-23 12:19:18+01	33254653	Wohnungsboerse
640	2023-11-23 12:19:20+01	33299372	Wohnungsboerse
735	2023-11-23 12:19:23+01	33347299	Wohnungsboerse
2925	2023-11-23 12:19:25+01	33259857	Wohnungsboerse
740	2023-11-23 12:19:28+01	33512128	Wohnungsboerse
692.16	2023-11-23 12:19:31+01	33524507	Wohnungsboerse
1500	2023-11-23 12:19:33+01	33513524	Wohnungsboerse
1390	2023-11-23 12:19:35+01	33555138	Wohnungsboerse
1350	2023-11-23 12:19:37+01	33555390	Wohnungsboerse
1000	2023-11-23 12:19:40+01	33574808	Wohnungsboerse
1590	2023-11-23 12:19:41+01	33329023	Wohnungsboerse
3500	2023-11-23 12:19:43+01	33593062	Wohnungsboerse
1800	2023-11-23 12:19:46+01	33593060	Wohnungsboerse
784	2023-11-23 12:19:48+01	33347397	Wohnungsboerse
504	2023-11-23 12:19:51+01	33509424	Wohnungsboerse
800	2023-11-23 12:19:54+01	32111553	Wohnungsboerse
800	2023-11-23 12:19:55+01	33514955	Wohnungsboerse
610	2023-11-23 12:19:58+01	33562422	Wohnungsboerse
500	2023-11-23 12:20:01+01	33571565	Wohnungsboerse
600	2023-11-23 12:20:03+01	33576605	Wohnungsboerse
4600	2023-11-23 12:20:06+01	33516901	Wohnungsboerse
1750	2023-11-23 12:20:08+01	33571784	Wohnungsboerse
1540	2023-11-23 12:20:12+01	32803920	Wohnungsboerse
810	2023-11-23 12:20:14+01	33198024	Wohnungsboerse
864	2023-11-23 12:20:17+01	33203387	Wohnungsboerse
850	2023-11-23 12:20:19+01	33213161	Wohnungsboerse
950	2023-11-23 12:20:22+01	33333966	Wohnungsboerse
890	2023-11-23 12:20:24+01	33103145	Wohnungsboerse
614	2023-11-23 12:20:26+01	33487615	Wohnungsboerse
692	2023-11-23 12:20:28+01	33274520	Wohnungsboerse
1250	2023-11-23 12:20:30+01	33506350	Wohnungsboerse
430	2023-11-23 12:20:32+01	33506504	Wohnungsboerse
700	2023-11-23 12:20:34+01	33506559	Wohnungsboerse
1500	2023-11-23 12:20:37+01	33566757	Wohnungsboerse
700	2023-11-23 12:20:40+01	33568372	Wohnungsboerse
670	2023-11-23 12:20:42+01	33576403	Wohnungsboerse
511	2023-11-23 12:20:45+01	33487617	Wohnungsboerse
1600	2023-11-23 12:20:47+01	33548591	Wohnungsboerse
1568.43	2023-11-23 12:20:50+01	33402892	Wohnungsboerse
1200	2023-11-23 12:20:53+01	33452273	Wohnungsboerse
735	2023-11-23 12:20:55+01	33584300	Wohnungsboerse
640	2023-11-23 12:20:58+01	33480104	Wohnungsboerse
1590	2023-11-23 12:21:01+01	29486814	Wohnungsboerse
543.41	2023-11-23 12:21:03+01	33509360	Wohnungsboerse
830	2023-11-23 12:21:06+01	33367045	Wohnungsboerse
1135	2023-11-23 12:21:07+01	32705183	Wohnungsboerse
1790	2023-11-23 12:21:10+01	31571982	Wohnungsboerse
685.55	2023-11-23 12:21:11+01	33548090	Wohnungsboerse
720	2023-11-23 12:21:13+01	33554952	Wohnungsboerse
570	2023-11-23 12:21:15+01	33527396	Wohnungsboerse
1500	2023-11-23 12:21:18+01	33574264	Wohnungsboerse
1330	2023-11-23 12:21:20+01	33579566	Wohnungsboerse
700	2023-11-23 12:21:22+01	33589367	Wohnungsboerse
450	2023-11-23 12:21:24+01	33592957	Wohnungsboerse
677.75	2023-11-23 12:21:27+01	33594001	Wohnungsboerse
495.21	2023-11-23 12:21:29+01	33574301	Wohnungsboerse
435	2023-11-23 12:21:32+01	33574507	Wohnungsboerse
1160	2023-11-23 12:21:35+01	33574550	Wohnungsboerse
510	2023-11-23 12:21:36+01	33323829	Wohnungsboerse
641.96	2023-11-23 12:21:38+01	33582149	Wohnungsboerse
707	2023-11-23 12:21:41+01	33582205	Wohnungsboerse
1550	2023-11-23 12:21:44+01	33377916	Wohnungsboerse
1030	2023-11-23 12:21:47+01	33589155	Wohnungsboerse
785	2023-11-23 12:21:49+01	33587062	Wohnungsboerse
1260	2023-11-23 12:21:51+01	33540498	Wohnungsboerse
780	2023-11-23 12:21:54+01	33592937	Wohnungsboerse
740	2023-11-23 12:21:56+01	33593898	Wohnungsboerse
420	2023-11-23 12:21:59+01	33594150	Wohnungsboerse
539	2023-11-23 12:22:00+01	33594356	Wohnungsboerse
795	2023-11-23 12:22:02+01	33089879	Wohnungsboerse
1350	2023-11-23 12:22:05+01	33497192	Wohnungsboerse
870	2023-11-23 12:22:07+01	33501784	Wohnungsboerse
1610	2023-11-23 12:22:10+01	33501783	Wohnungsboerse
1560	2023-11-23 12:22:12+01	33501782	Wohnungsboerse
1100	2023-11-23 12:22:15+01	33501781	Wohnungsboerse
1340	2023-11-23 12:22:18+01	33501780	Wohnungsboerse
1620	2023-11-23 12:22:20+01	33501779	Wohnungsboerse
650	2023-11-23 12:22:22+01	33534951	Wohnungsboerse
1620	2023-11-23 12:22:24+01	33539937	Wohnungsboerse
800	2023-11-23 12:22:27+01	33543940	Wohnungsboerse
1280	2023-11-23 12:22:30+01	33548521	Wohnungsboerse
1100	2023-11-23 12:22:32+01	33542810	Wohnungsboerse
790	2023-11-23 12:22:34+01	33392135	Wohnungsboerse
3800	2023-11-23 12:22:37+01	33504182	Wohnungsboerse
1330	2023-11-23 12:22:39+01	33440756	Wohnungsboerse
660	2023-11-23 12:22:41+01	33563088	Wohnungsboerse
600	2023-11-23 12:22:43+01	33564140	Wohnungsboerse
1500	2023-11-23 12:22:45+01	33568150	Wohnungsboerse
490	2023-11-23 12:22:48+01	33548571	Wohnungsboerse
1000	2023-11-23 12:22:50+01	33555348	Wohnungsboerse
445	2023-11-23 12:22:53+01	33070027	Wohnungsboerse
1110	2023-11-23 12:22:56+01	33565930	Wohnungsboerse
680	2023-11-23 12:22:59+01	33567052	Wohnungsboerse
1000	2023-11-23 12:23:00+01	33567171	Wohnungsboerse
800	2023-11-23 12:23:02+01	33576553	Wohnungsboerse
524.96	2023-11-23 12:23:04+01	33582507	Wohnungsboerse
630	2023-11-23 12:23:07+01	33548816	Wohnungsboerse
590.26	2023-11-23 12:23:10+01	33479633	Wohnungsboerse
900	2023-11-23 12:23:13+01	33586061	Wohnungsboerse
1100	2023-11-23 12:23:16+01	33587329	Wohnungsboerse
740	2023-11-23 12:23:18+01	33589756	Wohnungsboerse
450	2023-11-23 12:23:21+01	33593179	Wohnungsboerse
1270	2023-11-23 12:23:23+01	33519879	Wohnungsboerse
1730	2023-11-23 12:23:26+01	33565781	Wohnungsboerse
850	2023-11-23 12:23:28+01	33203773	Wohnungsboerse
614	2023-11-23 12:23:31+01	33051217	Wohnungsboerse
523.66	2023-11-23 12:23:32+01	33489488	Wohnungsboerse
632	2023-11-23 12:23:35+01	33552256	Wohnungsboerse
570.85	2023-11-23 12:23:38+01	33493584	Wohnungsboerse
760	2023-11-23 12:23:40+01	33555662	Wohnungsboerse
698.61	2023-11-23 12:23:43+01	33560231	Wohnungsboerse
1375	2023-11-23 12:23:45+01	33509349	Wohnungsboerse
759	2023-11-23 12:23:48+01	33095129	Wohnungsboerse
800	2023-11-23 12:23:50+01	33574225	Wohnungsboerse
864	2023-11-23 12:23:52+01	33576182	Wohnungsboerse
750	2023-11-23 12:23:54+01	33583866	Wohnungsboerse
1650	2023-11-23 12:23:56+01	33557223	Wohnungsboerse
1175	2023-11-23 12:23:59+01	32772403	Wohnungsboerse
970	2023-11-23 12:24:02+01	33286890	Wohnungsboerse
996	2023-11-23 12:24:05+01	33594288	Wohnungsboerse
2250	2023-11-23 12:24:07+01	33582147	Wohnungsboerse
927.5	2023-11-23 12:24:10+01	26241922	Wohnungsboerse
1567.5	2023-11-23 12:24:13+01	24362546	Wohnungsboerse
605	2023-11-23 12:24:16+01	33585861	Wohnungsboerse
350	2023-11-23 12:24:19+01	33585982	Wohnungsboerse
1200	2023-11-23 12:36:51+01	33564438	Wohnungsboerse
1950	2023-11-23 12:36:51+01	33587369	Wohnungsboerse
635	2023-11-23 12:36:52+01	33589729	Wohnungsboerse
1160	2023-11-23 12:36:53+01	33586252	Wohnungsboerse
1250	2023-11-23 12:36:54+01	33593040	Wohnungsboerse
1200	2023-11-23 12:36:55+01	33564317	Wohnungsboerse
465	2023-11-23 12:36:56+01	33586206	Wohnungsboerse
920	2023-11-23 12:36:56+01	33593315	Wohnungsboerse
880	2023-11-23 12:36:59+01	33594395	Wohnungsboerse
2400	2023-11-23 12:37:01+01	33530252	Wohnungsboerse
1170	2023-11-23 12:37:04+01	33537448	Wohnungsboerse
630	2023-11-23 12:37:07+01	33539927	Wohnungsboerse
480	2023-11-23 12:37:09+01	33544210	Wohnungsboerse
2500	2023-11-23 12:37:11+01	33550628	Wohnungsboerse
1080	2023-11-23 12:37:13+01	33427963	Wohnungsboerse
3250	2023-11-23 12:37:15+01	33560460	Wohnungsboerse
2990	2023-11-23 12:37:18+01	33567145	Wohnungsboerse
695	2023-11-23 12:37:21+01	33576144	Wohnungsboerse
1425.35	2023-11-23 12:37:23+01	33582134	Wohnungsboerse
1800	2023-11-23 12:37:25+01	33582275	Wohnungsboerse
5669.69	2023-11-23 12:37:27+01	33586190	Wohnungsboerse
1649	2023-11-23 12:50:19+01	33537199	Wohnungsboerse
500	2023-11-23 12:50:19+01	33562955	Wohnungsboerse
400	2023-11-23 12:50:22+01	33563140	Wohnungsboerse
1100	2023-11-23 12:50:23+01	33567049	Wohnungsboerse
950	2023-11-23 12:50:25+01	33590939	Wohnungsboerse
430	2023-11-23 12:50:26+01	33568328	Wohnungsboerse
596	2023-11-23 12:50:27+01	33571601	Wohnungsboerse
695.22	2023-11-23 12:50:30+01	33578590	Wohnungsboerse
1200	2023-11-23 12:50:32+01	33581970	Wohnungsboerse
595	2023-11-23 12:50:35+01	33582383	Wohnungsboerse
330	2023-11-23 12:50:38+01	33571460	Wohnungsboerse
700	2023-11-23 12:50:41+01	33586052	Wohnungsboerse
656	2023-11-23 12:50:43+01	33593130	Wohnungsboerse
857.3	2023-11-23 12:50:46+01	33594011	Wohnungsboerse
2920	2023-11-27 15:18:33+01	33022819	Wohnungsboerse
1890	2023-11-27 15:18:36+01	32728992	Wohnungsboerse
670	2023-11-27 15:18:38+01	33600771	Wohnungsboerse
800	2023-11-27 15:18:41+01	28806724	Wohnungsboerse
500	2023-11-27 15:18:43+01	33596486	Wohnungsboerse
800	2023-11-27 15:18:45+01	31766932	Wohnungsboerse
745	2023-11-27 15:18:48+01	33578831	Wohnungsboerse
650	2023-11-27 15:18:50+01	33495913	Wohnungsboerse
1100	2023-11-27 15:18:53+01	33321367	Wohnungsboerse
520	2023-11-27 15:18:56+01	33600726	Wohnungsboerse
1094.17	2023-11-27 15:18:58+01	33522726	Wohnungsboerse
630	2023-11-27 15:19:01+01	33574691	Wohnungsboerse
830	2023-11-27 15:19:03+01	32976985	Wohnungsboerse
825	2023-11-27 15:19:06+01	33450133	Wohnungsboerse
1100	2023-11-27 15:19:09+01	33449855	Wohnungsboerse
1700	2023-11-27 15:19:11+01	31549941	Wohnungsboerse
1891	2023-11-27 15:19:13+01	32697715	Wohnungsboerse
985	2023-11-27 15:19:15+01	32642467	Wohnungsboerse
1840	2023-11-27 15:19:17+01	32642458	Wohnungsboerse
1705	2023-11-27 15:19:20+01	33050991	Wohnungsboerse
2590	2023-11-27 15:19:23+01	33354570	Wohnungsboerse
2225	2023-11-27 15:19:26+01	32804194	Wohnungsboerse
943	2023-11-27 15:19:28+01	33391895	Wohnungsboerse
965	2023-11-27 15:19:31+01	33489268	Wohnungsboerse
2031	2023-11-27 15:19:34+01	33539691	Wohnungsboerse
1490	2023-11-27 15:19:36+01	33539690	Wohnungsboerse
820	2023-11-27 15:19:41+01	33318532	Wohnungsboerse
1430	2023-11-27 15:19:43+01	33355426	Wohnungsboerse
1550	2023-11-27 15:19:45+01	33355443	Wohnungsboerse
2550	2023-11-27 15:19:45+01	33606387	Wohnungsboerse
1250	2023-11-27 15:19:48+01	33366949	Wohnungsboerse
2950	2023-11-27 15:19:51+01	32489228	Wohnungsboerse
1550	2023-11-27 15:19:53+01	32848279	Wohnungsboerse
1400	2023-11-27 15:19:56+01	33435206	Wohnungsboerse
1450	2023-11-27 15:19:58+01	33506206	Wohnungsboerse
1400	2023-11-27 15:20:01+01	33565901	Wohnungsboerse
1400	2023-11-27 15:20:03+01	33578811	Wohnungsboerse
1470	2023-11-27 15:20:06+01	33582266	Wohnungsboerse
499	2023-11-27 15:20:09+01	33592705	Wohnungsboerse
590	2023-11-27 15:20:11+01	33615243	Wohnungsboerse
550	2023-11-27 15:20:14+01	33582215	Wohnungsboerse
2555	2023-11-27 15:20:17+01	33572057	Wohnungsboerse
1500	2023-11-27 15:20:20+01	33592796	Wohnungsboerse
1200	2023-11-27 15:20:23+01	33593028	Wohnungsboerse
1650	2023-11-27 15:20:24+01	33594335	Wohnungsboerse
2950	2023-11-27 15:20:26+01	33592994	Wohnungsboerse
1250	2023-11-27 15:20:29+01	33386763	Wohnungsboerse
2650	2023-11-27 15:20:32+01	33504518	Wohnungsboerse
820	2023-11-27 15:20:35+01	33609896	Wohnungsboerse
1400	2023-11-27 15:20:37+01	33438704	Wohnungsboerse
1400	2023-11-27 15:20:39+01	33368188	Wohnungsboerse
475	2023-11-27 15:20:43+01	33619034	Wohnungsboerse
1900	2023-11-27 15:20:45+01	33621637	Wohnungsboerse
1990	2023-11-27 15:20:47+01	33437192	Wohnungsboerse
990	2023-11-27 15:20:50+01	33504339	Wohnungsboerse
1199	2023-11-27 15:20:53+01	33513521	Wohnungsboerse
1272.37	2023-11-27 15:20:55+01	33523027	Wohnungsboerse
990	2023-11-27 15:20:57+01	33554923	Wohnungsboerse
970	2023-11-27 15:20:59+01	33574602	Wohnungsboerse
900	2023-11-27 15:21:00+01	33574636	Wohnungsboerse
849.79	2023-11-27 15:21:03+01	33552309	Wohnungsboerse
600	2023-11-27 15:21:05+01	33580297	Wohnungsboerse
995	2023-11-27 15:21:06+01	33605700	Wohnungsboerse
620.91	2023-11-27 15:21:08+01	33555215	Wohnungsboerse
593.07	2023-11-27 15:21:11+01	33594278	Wohnungsboerse
740	2023-11-27 15:21:14+01	33613332	Wohnungsboerse
1537	2023-11-27 15:21:17+01	33616642	Wohnungsboerse
1125	2023-11-27 15:21:19+01	33276431	Wohnungsboerse
650	2023-11-27 15:21:21+01	33284573	Wohnungsboerse
850	2023-11-27 15:21:22+01	33067537	Wohnungsboerse
665	2023-11-27 15:21:24+01	33464631	Wohnungsboerse
580	2023-11-27 15:21:27+01	33548846	Wohnungsboerse
600	2023-11-27 15:21:29+01	33550728	Wohnungsboerse
500	2023-11-27 15:21:32+01	33583867	Wohnungsboerse
808.67	2023-11-27 15:21:34+01	33598534	Wohnungsboerse
575.54	2023-11-27 15:21:37+01	33510563	Wohnungsboerse
800	2023-11-27 15:21:39+01	33509761	Wohnungsboerse
693	2023-11-27 15:21:44+01	33621437	Wohnungsboerse
709	2023-11-27 15:21:56+01	33621436	Wohnungsboerse
590	2023-11-27 15:21:57+01	33574690	Wohnungsboerse
550	2023-11-27 15:21:57+01	33604082	Wohnungsboerse
1190	2023-11-27 15:21:58+01	33506830	Wohnungsboerse
275	2023-11-27 15:21:58+01	33605885	Wohnungsboerse
579	2023-11-27 15:21:58+01	33621435	Wohnungsboerse
449	2023-11-27 15:21:58+01	33621451	Wohnungsboerse
800	2023-11-27 15:22:00+01	33605966	Wohnungsboerse
750	2023-11-27 15:22:03+01	33309447	Wohnungsboerse
295	2023-11-27 15:22:05+01	33609872	Wohnungsboerse
700	2023-11-27 15:22:08+01	33562311	Wohnungsboerse
610	2023-11-27 15:22:11+01	33613226	Wohnungsboerse
320	2023-11-27 15:22:13+01	33616300	Wohnungsboerse
895	2023-11-27 15:22:16+01	33619341	Wohnungsboerse
900	2023-11-27 15:22:18+01	33621205	Wohnungsboerse
645	2023-11-27 15:22:20+01	33621294	Wohnungsboerse
725	2023-11-27 15:22:23+01	33621679	Wohnungsboerse
874.24	2023-11-27 15:22:26+01	33522714	Wohnungsboerse
941.83	2023-11-27 15:22:28+01	33522747	Wohnungsboerse
1550	2023-11-27 15:22:31+01	33530282	Wohnungsboerse
1250	2023-11-27 15:22:34+01	33530699	Wohnungsboerse
1830	2023-11-27 15:22:35+01	33532831	Wohnungsboerse
1230	2023-11-27 15:22:38+01	33532827	Wohnungsboerse
1400	2023-11-27 15:22:40+01	33532824	Wohnungsboerse
1260	2023-11-27 15:22:43+01	33535061	Wohnungsboerse
690	2023-11-27 15:22:45+01	33557209	Wohnungsboerse
500	2023-11-27 15:22:48+01	33578717	Wohnungsboerse
700	2023-11-27 15:22:50+01	33579780	Wohnungsboerse
1315	2023-11-27 15:22:53+01	33583884	Wohnungsboerse
1350	2023-11-27 15:22:53+01	33608742	Wohnungsboerse
1390	2023-11-27 15:22:56+01	33373146	Wohnungsboerse
1589.91	2023-11-27 15:22:58+01	33602097	Wohnungsboerse
595	2023-11-27 15:23:01+01	33404507	Wohnungsboerse
1200	2023-11-27 15:23:04+01	33604371	Wohnungsboerse
1340	2023-11-27 15:23:07+01	33557618	Wohnungsboerse
850	2023-11-27 15:23:10+01	33606067	Wohnungsboerse
680	2023-11-27 15:23:12+01	33608525	Wohnungsboerse
640	2023-11-27 15:23:15+01	33608703	Wohnungsboerse
880	2023-11-27 15:23:18+01	33568166	Wohnungsboerse
600	2023-11-27 15:23:20+01	33613293	Wohnungsboerse
640	2023-11-27 15:23:23+01	33515086	Wohnungsboerse
775	2023-11-27 15:23:25+01	33614975	Wohnungsboerse
1890	2023-11-27 15:23:28+01	33534772	Wohnungsboerse
750	2023-11-27 15:23:30+01	33616340	Wohnungsboerse
400	2023-11-27 15:23:32+01	33621490	Wohnungsboerse
415	2023-11-27 15:23:35+01	33587009	Wohnungsboerse
700	2023-11-27 15:23:37+01	33477583	Wohnungsboerse
1300	2023-11-27 15:23:40+01	31823448	Wohnungsboerse
1060	2023-11-27 15:23:41+01	33481648	Wohnungsboerse
2500	2023-11-27 15:23:44+01	33526956	Wohnungsboerse
690	2023-11-27 15:23:46+01	33075428	Wohnungsboerse
625	2023-11-27 15:23:48+01	33565203	Wohnungsboerse
674	2023-11-27 15:23:51+01	33565903	Wohnungsboerse
522	2023-11-27 15:23:53+01	33571818	Wohnungsboerse
1400	2023-11-27 15:23:55+01	33433016	Wohnungsboerse
1000	2023-11-27 15:23:58+01	33589277	Wohnungsboerse
650	2023-11-27 15:24:01+01	33303915	Wohnungsboerse
857	2023-11-27 15:24:03+01	33605711	Wohnungsboerse
416	2023-11-27 15:24:04+01	33610710	Wohnungsboerse
850	2023-11-27 15:24:06+01	33615088	Wohnungsboerse
350	2023-11-27 15:24:08+01	33618878	Wohnungsboerse
850	2023-11-27 15:24:10+01	33618934	Wohnungsboerse
6900	2023-11-27 15:24:12+01	33579971	Wohnungsboerse
1790	2023-11-27 15:24:15+01	33584351	Wohnungsboerse
3420	2023-11-27 15:24:17+01	33590777	Wohnungsboerse
444	2023-11-27 15:24:19+01	33593059	Wohnungsboerse
978	2023-11-27 15:24:21+01	33598218	Wohnungsboerse
393.84	2023-11-27 15:24:24+01	33601712	Wohnungsboerse
484	2023-11-27 15:24:27+01	33608342	Wohnungsboerse
870	2023-11-27 15:24:29+01	33608581	Wohnungsboerse
782	2023-11-27 15:24:32+01	33341849	Wohnungsboerse
990	2023-11-27 15:24:34+01	33416750	Wohnungsboerse
1270	2023-11-27 15:24:35+01	33614888	Wohnungsboerse
2950	2023-11-27 15:24:38+01	33616678	Wohnungsboerse
1171	2023-11-27 15:24:40+01	33619011	Wohnungsboerse
1700	2023-11-27 15:24:42+01	33621210	Wohnungsboerse
3250	2023-11-27 15:24:44+01	33114294	Wohnungsboerse
1950	2023-11-27 15:24:46+01	33308983	Wohnungsboerse
1950	2023-11-27 15:24:49+01	33320934	Wohnungsboerse
505	2023-11-27 15:24:52+01	33480003	Wohnungsboerse
590	2023-11-27 15:24:54+01	33618833	Wohnungsboerse
1500	2023-11-27 15:24:56+01	33596611	Wohnungsboerse
670	2023-11-27 15:24:58+01	33598562	Wohnungsboerse
1200	2023-11-27 15:25:00+01	33605748	Wohnungsboerse
611	2023-11-27 15:25:03+01	33608427	Wohnungsboerse
548.19	2023-11-27 15:25:05+01	33560234	Wohnungsboerse
460.94	2023-11-27 15:25:09+01	33509397	Wohnungsboerse
850	2023-11-27 15:25:10+01	33609012	Wohnungsboerse
1100	2023-11-27 15:25:12+01	33609851	Wohnungsboerse
280	2023-11-27 15:25:14+01	33612676	Wohnungsboerse
850	2023-11-27 15:25:17+01	33613282	Wohnungsboerse
740	2023-11-27 15:25:20+01	33485222	Wohnungsboerse
529	2023-11-27 15:25:23+01	33618963	Wohnungsboerse
550	2023-11-27 15:25:25+01	33619186	Wohnungsboerse
580	2023-11-27 15:25:26+01	33621277	Wohnungsboerse
840	2023-11-27 15:25:29+01	33313054	Wohnungsboerse
1081	2023-11-27 15:25:32+01	33432833	Wohnungsboerse
810	2023-11-27 15:25:35+01	33254648	Wohnungsboerse
900	2023-11-27 15:25:37+01	33225904	Wohnungsboerse
950	2023-11-27 15:25:40+01	33298728	Wohnungsboerse
735	2023-11-27 15:25:42+01	33537783	Wohnungsboerse
800	2023-11-27 15:25:45+01	33086103	Wohnungsboerse
1530	2023-11-27 15:25:47+01	33565975	Wohnungsboerse
830	2023-11-27 15:25:49+01	33566839	Wohnungsboerse
650	2023-11-27 15:25:50+01	33584331	Wohnungsboerse
955.79	2023-11-27 15:25:52+01	33594334	Wohnungsboerse
1150	2023-11-27 15:25:55+01	33576669	Wohnungsboerse
974.95	2023-11-27 15:25:58+01	33600514	Wohnungsboerse
850	2023-11-27 15:26:00+01	33614086	Wohnungsboerse
1450	2023-11-27 15:26:02+01	33601473	Wohnungsboerse
900	2023-11-27 15:26:04+01	33555511	Wohnungsboerse
950	2023-11-27 15:26:05+01	33555506	Wohnungsboerse
1300	2023-11-27 15:26:08+01	33608472	Wohnungsboerse
365	2023-11-27 15:26:11+01	33609821	Wohnungsboerse
1584	2023-11-27 15:26:14+01	33609842	Wohnungsboerse
730	2023-11-27 15:26:16+01	33611472	Wohnungsboerse
515	2023-11-27 15:26:18+01	33611594	Wohnungsboerse
1157	2023-11-27 15:26:21+01	33608423	Wohnungsboerse
1250	2023-11-27 15:26:23+01	33614801	Wohnungsboerse
1000	2023-11-27 15:26:25+01	33615242	Wohnungsboerse
380.72	2023-11-27 15:26:28+01	33618696	Wohnungsboerse
478.47	2023-11-27 15:26:30+01	33621123	Wohnungsboerse
490.06	2023-11-27 15:26:33+01	33621305	Wohnungsboerse
1890	2023-11-27 15:26:36+01	32728991	Wohnungsboerse
1790	2023-11-27 15:26:37+01	32728990	Wohnungsboerse
930	2023-11-27 15:26:40+01	33147363	Wohnungsboerse
1550	2023-11-27 15:26:42+01	32853522	Wohnungsboerse
924	2023-11-27 15:26:44+01	33522771	Wohnungsboerse
1550	2023-11-27 15:26:46+01	33589759	Wohnungsboerse
1760	2023-11-27 15:26:50+01	33524121	Wohnungsboerse
920	2023-11-27 15:26:52+01	33600402	Wohnungsboerse
2480	2023-11-27 15:26:55+01	31210714	Wohnungsboerse
8500	2023-11-27 15:26:58+01	33196281	Wohnungsboerse
1850	2023-11-27 15:26:59+01	33196527	Wohnungsboerse
1800	2023-11-27 15:27:01+01	32817541	Wohnungsboerse
1379.88	2023-11-27 15:27:04+01	33445819	Wohnungsboerse
1684.63	2023-11-27 15:27:06+01	33445857	Wohnungsboerse
2200	2023-11-27 15:27:09+01	33422321	Wohnungsboerse
2950	2023-11-27 15:27:11+01	33455178	Wohnungsboerse
1742	2023-11-27 15:27:14+01	32706775	Wohnungsboerse
700	2023-11-27 15:27:16+01	33501793	Wohnungsboerse
817	2023-11-27 15:27:18+01	33530733	Wohnungsboerse
450	2023-11-27 15:27:20+01	33576712	Wohnungsboerse
2770	2023-11-27 15:27:23+01	33347939	Wohnungsboerse
650	2023-11-27 15:27:25+01	33609760	Wohnungsboerse
700	2023-11-27 15:28:08+01	33535395	Wohnungsboerse
902.96	2023-11-27 15:28:11+01	33476080	Wohnungsboerse
624	2023-11-27 15:28:13+01	33565734	Wohnungsboerse
498.36	2023-11-27 15:28:15+01	31818244	Wohnungsboerse
687	2023-11-27 15:28:18+01	33455338	Wohnungsboerse
481.92	2023-11-27 15:28:21+01	32442188	Wohnungsboerse
1900	2023-11-27 15:28:22+01	31394882	Wohnungsboerse
986	2023-11-27 15:28:25+01	33609013	Wohnungsboerse
1450	2023-11-27 15:28:28+01	32375748	Wohnungsboerse
1190	2023-11-27 15:28:30+01	33601786	Wohnungsboerse
942.96	2023-11-27 15:28:32+01	33501772	Wohnungsboerse
695	2023-11-27 15:28:35+01	33473469	Wohnungsboerse
800	2023-11-27 15:28:37+01	33621850	Wohnungsboerse
1205	2023-11-27 15:28:40+01	27088008	Wohnungsboerse
1340	2023-11-27 15:28:41+01	33462779	Wohnungsboerse
920	2023-11-27 15:28:43+01	29314952	Wohnungsboerse
1550	2023-11-27 15:28:46+01	33438599	Wohnungsboerse
2140	2023-11-27 15:28:49+01	33596447	Wohnungsboerse
3300	2023-11-27 15:28:52+01	33598493	Wohnungsboerse
1830	2023-11-27 15:28:54+01	33568443	Wohnungsboerse
1360	2023-11-27 15:28:56+01	33604004	Wohnungsboerse
1450	2023-11-27 15:28:58+01	33608727	Wohnungsboerse
650	2023-11-27 15:29:01+01	29317989	Wohnungsboerse
1200	2023-11-27 15:29:04+01	29631528	Wohnungsboerse
1050	2023-11-27 15:29:07+01	33440863	Wohnungsboerse
1890	2023-11-27 15:29:09+01	32976977	Wohnungsboerse
730	2023-11-27 15:29:11+01	33495322	Wohnungsboerse
1785	2023-11-27 15:29:14+01	33245396	Wohnungsboerse
955	2023-11-27 15:29:16+01	33572182	Wohnungsboerse
1116.17	2023-11-27 15:29:19+01	33274310	Wohnungsboerse
796.03	2023-11-27 15:29:21+01	33576147	Wohnungsboerse
980	2023-11-27 15:29:24+01	33589487	Wohnungsboerse
1070	2023-11-27 15:29:27+01	33604437	Wohnungsboerse
750	2023-11-27 15:29:29+01	33606087	Wohnungsboerse
1400	2023-11-27 15:29:31+01	33619031	Wohnungsboerse
810	2023-11-27 15:29:33+01	33439071	Wohnungsboerse
1795	2023-11-27 15:29:36+01	33540488	Wohnungsboerse
1495	2023-11-27 15:29:39+01	33540487	Wohnungsboerse
722	2023-11-27 15:29:42+01	33621452	Wohnungsboerse
1100	2023-11-27 15:29:44+01	31675590	Wohnungsboerse
2500	2023-11-27 15:29:47+01	32188005	Wohnungsboerse
1168.83	2023-11-27 15:29:50+01	33384509	Wohnungsboerse
684	2023-11-27 15:29:52+01	27035171	Wohnungsboerse
1348	2023-11-27 15:29:55+01	33425850	Wohnungsboerse
1064	2023-11-27 15:29:58+01	32820355	Wohnungsboerse
1066	2023-11-27 15:30:01+01	33449817	Wohnungsboerse
1262.17	2023-11-27 15:30:04+01	33450063	Wohnungsboerse
997	2023-11-27 15:30:06+01	33515794	Wohnungsboerse
986	2023-11-27 15:30:09+01	33589476	Wohnungsboerse
1300	2023-11-27 15:30:12+01	33455197	Wohnungsboerse
1215	2023-11-27 15:30:12+01	33611348	Wohnungsboerse
1300	2023-11-27 15:30:15+01	33292761	Wohnungsboerse
1140	2023-11-27 15:30:17+01	33618889	Wohnungsboerse
350	2023-11-27 15:30:20+01	33621853	Wohnungsboerse
550	2023-11-27 15:30:22+01	33621856	Wohnungsboerse
670	2023-11-27 15:30:24+01	33565240	Wohnungsboerse
469	2023-11-27 15:30:27+01	33621870	Wohnungsboerse
444	2023-11-27 15:30:29+01	33621875	Wohnungsboerse
180	2023-11-27 15:30:31+01	33621876	Wohnungsboerse
210	2023-11-27 15:30:34+01	33621879	Wohnungsboerse
680	2023-11-27 15:30:36+01	33621886	Wohnungsboerse
613.2	2023-11-27 15:30:39+01	33621890	Wohnungsboerse
780	2023-11-27 15:30:42+01	33621903	Wohnungsboerse
600	2023-11-27 15:30:44+01	33621904	Wohnungsboerse
511	2023-11-27 15:30:47+01	33589822	Wohnungsboerse
390.4	2023-11-27 15:30:48+01	18346113	Wohnungsboerse
999	2023-11-27 15:30:51+01	33579841	Wohnungsboerse
500	2023-11-27 15:30:54+01	33587205	Wohnungsboerse
580	2023-11-27 15:30:55+01	33591071	Wohnungsboerse
762	2023-11-27 15:30:59+01	33578486	Wohnungsboerse
623.31	2023-11-27 15:31:01+01	33457517	Wohnungsboerse
839.16	2023-11-27 15:31:04+01	33402808	Wohnungsboerse
828.2	2023-11-27 15:31:06+01	33396009	Wohnungsboerse
2650	2023-11-27 15:31:09+01	32917983	Wohnungsboerse
2700	2023-11-27 15:31:11+01	33449689	Wohnungsboerse
720	2023-11-27 15:31:13+01	33487464	Wohnungsboerse
560	2023-11-27 15:31:16+01	33487702	Wohnungsboerse
2920	2023-11-30 12:03:08+01	33022819	Wohnungsboerse
1890	2023-11-30 12:03:11+01	32728992	Wohnungsboerse
900	2023-11-30 12:03:12+01	33225904	Wohnungsboerse
730	2023-11-30 12:03:14+01	33611472	Wohnungsboerse
800	2023-11-30 12:03:17+01	31766932	Wohnungsboerse
850	2023-11-30 12:03:20+01	33609012	Wohnungsboerse
484	2023-11-30 12:03:22+01	33608342	Wohnungsboerse
1060	2023-11-30 12:03:24+01	33481648	Wohnungsboerse
1100	2023-11-30 12:03:27+01	33321367	Wohnungsboerse
1190.87	2023-11-30 12:03:30+01	33274368	Wohnungsboerse
520	2023-11-30 12:03:33+01	32995444	Wohnungsboerse
800	2023-11-30 12:03:35+01	33605966	Wohnungsboerse
830	2023-11-30 12:03:38+01	32976985	Wohnungsboerse
690	2023-11-30 12:03:41+01	33485455	Wohnungsboerse
2650	2023-11-30 12:03:42+01	33504518	Wohnungsboerse
1700	2023-11-30 12:03:44+01	31549941	Wohnungsboerse
1891	2023-11-30 12:03:46+01	32697715	Wohnungsboerse
985	2023-11-30 12:03:49+01	32642467	Wohnungsboerse
1840	2023-11-30 12:03:52+01	32642458	Wohnungsboerse
1705	2023-11-30 12:03:55+01	33050991	Wohnungsboerse
2590	2023-11-30 12:03:58+01	33354570	Wohnungsboerse
2225	2023-11-30 12:04:00+01	32804194	Wohnungsboerse
943	2023-11-30 12:04:03+01	33391895	Wohnungsboerse
965	2023-11-30 12:04:06+01	33489268	Wohnungsboerse
2031	2023-11-30 12:04:09+01	33539691	Wohnungsboerse
1490	2023-11-30 12:04:11+01	33539690	Wohnungsboerse
2550	2023-11-30 12:04:13+01	33606387	Wohnungsboerse
820	2023-11-30 12:04:16+01	33318532	Wohnungsboerse
1430	2023-11-30 12:04:18+01	33355426	Wohnungsboerse
1550	2023-11-30 12:04:20+01	33355443	Wohnungsboerse
1450	2023-11-30 12:04:22+01	33347440	Wohnungsboerse
2950	2023-11-30 12:04:25+01	32489228	Wohnungsboerse
1550	2023-11-30 12:04:27+01	32848279	Wohnungsboerse
1400	2023-11-30 12:04:30+01	33435206	Wohnungsboerse
1450	2023-11-30 12:04:31+01	33506206	Wohnungsboerse
1400	2023-11-30 12:04:33+01	33565901	Wohnungsboerse
1400	2023-11-30 12:04:35+01	33578811	Wohnungsboerse
1470	2023-11-30 12:04:38+01	33582266	Wohnungsboerse
499	2023-11-30 12:04:40+01	33592705	Wohnungsboerse
590	2023-11-30 12:04:42+01	33615243	Wohnungsboerse
1250	2023-11-30 12:04:45+01	33366949	Wohnungsboerse
820	2023-11-30 12:04:47+01	33609896	Wohnungsboerse
1400	2023-11-30 12:04:50+01	33368188	Wohnungsboerse
475	2023-11-30 12:04:51+01	33619034	Wohnungsboerse
1900	2023-11-30 12:04:54+01	33621637	Wohnungsboerse
1990	2023-11-30 12:04:56+01	33437192	Wohnungsboerse
1200	2023-11-30 12:04:59+01	33622999	Wohnungsboerse
1290	2023-11-30 12:05:02+01	33292489	Wohnungsboerse
2000	2023-11-30 12:05:04+01	33623338	Wohnungsboerse
730	2023-11-30 12:05:06+01	33625597	Wohnungsboerse
5300	2023-11-30 12:05:09+01	33627177	Wohnungsboerse
1400	2023-11-30 12:05:12+01	33627630	Wohnungsboerse
5400	2023-11-30 12:05:15+01	33631016	Wohnungsboerse
6850	2023-11-30 12:05:18+01	31193233	Wohnungsboerse
1300	2023-11-30 12:05:21+01	33438704	Wohnungsboerse
1199	2023-11-30 12:05:24+01	33513521	Wohnungsboerse
1272.37	2023-11-30 12:05:27+01	33523027	Wohnungsboerse
990	2023-11-30 12:05:30+01	33554923	Wohnungsboerse
970	2023-11-30 12:05:31+01	33574602	Wohnungsboerse
900	2023-11-30 12:05:34+01	33574636	Wohnungsboerse
600	2023-11-30 12:05:36+01	33580297	Wohnungsboerse
593.07	2023-11-30 12:05:38+01	33594278	Wohnungsboerse
740	2023-11-30 12:05:40+01	33613332	Wohnungsboerse
1537	2023-11-30 12:05:42+01	33616642	Wohnungsboerse
1125	2023-11-30 12:05:43+01	33276431	Wohnungsboerse
620.91	2023-11-30 12:05:45+01	33555215	Wohnungsboerse
940	2023-11-30 12:05:47+01	33504339	Wohnungsboerse
735	2023-11-30 12:05:50+01	33633189	Wohnungsboerse
769.8	2023-11-30 12:05:53+01	33641824	Wohnungsboerse
650	2023-11-30 12:05:55+01	33284573	Wohnungsboerse
850	2023-11-30 12:05:57+01	33067537	Wohnungsboerse
665	2023-11-30 12:06:00+01	33464631	Wohnungsboerse
580	2023-11-30 12:06:03+01	33548846	Wohnungsboerse
600	2023-11-30 12:06:06+01	33550728	Wohnungsboerse
808.67	2023-11-30 12:06:08+01	33598534	Wohnungsboerse
575.54	2023-11-30 12:06:10+01	33510563	Wohnungsboerse
800	2023-11-30 12:06:12+01	33509761	Wohnungsboerse
693	2023-11-30 12:06:14+01	33621437	Wohnungsboerse
709	2023-11-30 12:06:17+01	33621436	Wohnungsboerse
579	2023-11-30 12:06:20+01	33621435	Wohnungsboerse
570	2023-11-30 12:06:23+01	33640782	Wohnungsboerse
750	2023-11-30 12:06:25+01	33309447	Wohnungsboerse
295	2023-11-30 12:06:28+01	33609872	Wohnungsboerse
700	2023-11-30 12:06:31+01	33562311	Wohnungsboerse
610	2023-11-30 12:06:33+01	33613226	Wohnungsboerse
320	2023-11-30 12:06:35+01	33616300	Wohnungsboerse
645	2023-11-30 12:06:38+01	33621294	Wohnungsboerse
725	2023-11-30 12:06:40+01	33621679	Wohnungsboerse
780	2023-11-30 12:06:43+01	33623527	Wohnungsboerse
560	2023-11-30 12:06:46+01	33625785	Wohnungsboerse
590	2023-11-30 12:06:48+01	33574494	Wohnungsboerse
1000	2023-11-30 12:06:51+01	33284623	Wohnungsboerse
750	2023-11-30 12:06:53+01	33621205	Wohnungsboerse
650	2023-11-30 12:06:56+01	33638345	Wohnungsboerse
810	2023-11-30 12:06:58+01	33642096	Wohnungsboerse
720	2023-11-30 12:07:01+01	32630083	Wohnungsboerse
600	2023-11-30 12:07:03+01	33422162	Wohnungsboerse
640	2023-11-30 12:07:05+01	33386081	Wohnungsboerse
1094.17	2023-11-30 12:07:08+01	33522726	Wohnungsboerse
874.24	2023-11-30 12:07:11+01	33522714	Wohnungsboerse
941.83	2023-11-30 12:07:13+01	33522747	Wohnungsboerse
700	2023-11-30 12:07:15+01	33579780	Wohnungsboerse
1315	2023-11-30 12:07:17+01	33583884	Wohnungsboerse
1390	2023-11-30 12:07:20+01	33373146	Wohnungsboerse
500	2023-11-30 12:07:22+01	33625884	Wohnungsboerse
1350	2023-11-30 12:07:24+01	33608742	Wohnungsboerse
630.13	2023-11-30 12:07:27+01	33636718	Wohnungsboerse
450	2023-11-30 12:07:29+01	33638561	Wohnungsboerse
660	2023-11-30 12:07:31+01	33640387	Wohnungsboerse
680	2023-11-30 12:07:33+01	33608525	Wohnungsboerse
640	2023-11-30 12:07:35+01	33608703	Wohnungsboerse
880	2023-11-30 12:07:38+01	33568166	Wohnungsboerse
600	2023-11-30 12:07:40+01	33613293	Wohnungsboerse
1890	2023-11-30 12:07:42+01	33534772	Wohnungsboerse
750	2023-11-30 12:07:44+01	33616340	Wohnungsboerse
1056.42	2023-11-30 12:07:47+01	33625566	Wohnungsboerse
1395	2023-11-30 12:07:50+01	33626056	Wohnungsboerse
915	2023-11-30 12:07:53+01	33629307	Wohnungsboerse
1000	2023-11-30 12:07:56+01	33633321	Wohnungsboerse
1128	2023-11-30 12:07:58+01	33623288	Wohnungsboerse
900	2023-11-30 12:08:00+01	33407255	Wohnungsboerse
500	2023-11-30 12:08:02+01	33640694	Wohnungsboerse
590	2023-11-30 12:08:05+01	33640768	Wohnungsboerse
700	2023-11-30 12:08:08+01	33477583	Wohnungsboerse
1300	2023-11-30 12:08:10+01	31823448	Wohnungsboerse
2500	2023-11-30 12:08:12+01	33526956	Wohnungsboerse
690	2023-11-30 12:08:15+01	33075428	Wohnungsboerse
625	2023-11-30 12:08:17+01	33565203	Wohnungsboerse
522	2023-11-30 12:08:20+01	33571818	Wohnungsboerse
1400	2023-11-30 12:08:22+01	33433016	Wohnungsboerse
1000	2023-11-30 12:08:24+01	33589277	Wohnungsboerse
650	2023-11-30 12:08:26+01	33303915	Wohnungsboerse
857	2023-11-30 12:08:29+01	33605711	Wohnungsboerse
416	2023-11-30 12:08:31+01	33610710	Wohnungsboerse
850	2023-11-30 12:08:33+01	33615088	Wohnungsboerse
850	2023-11-30 12:08:36+01	33618934	Wohnungsboerse
840	2023-11-30 12:08:39+01	33623483	Wohnungsboerse
305	2023-11-30 12:08:41+01	33618878	Wohnungsboerse
650	2023-11-30 12:08:42+01	33634877	Wohnungsboerse
870	2023-11-30 12:08:45+01	33608581	Wohnungsboerse
782	2023-11-30 12:08:48+01	33341849	Wohnungsboerse
990	2023-11-30 12:08:50+01	33416750	Wohnungsboerse
1270	2023-11-30 12:08:53+01	33614888	Wohnungsboerse
2950	2023-11-30 12:08:55+01	33616678	Wohnungsboerse
1700	2023-11-30 12:08:57+01	33621210	Wohnungsboerse
745	2023-11-30 12:09:00+01	33578831	Wohnungsboerse
1800	2023-11-30 12:09:03+01	33626040	Wohnungsboerse
750	2023-11-30 12:09:05+01	33626375	Wohnungsboerse
1918.4	2023-11-30 12:09:07+01	33629227	Wohnungsboerse
1815	2023-11-30 12:09:10+01	33629289	Wohnungsboerse
845	2023-11-30 12:09:12+01	33633478	Wohnungsboerse
1600	2023-11-30 12:09:15+01	33636941	Wohnungsboerse
410	2023-11-30 12:09:17+01	33640674	Wohnungsboerse
1100	2023-11-30 12:09:19+01	33609851	Wohnungsboerse
280	2023-11-30 12:09:21+01	33612676	Wohnungsboerse
850	2023-11-30 12:09:24+01	33613282	Wohnungsboerse
740	2023-11-30 12:09:26+01	33485222	Wohnungsboerse
529	2023-11-30 12:09:29+01	33618963	Wohnungsboerse
580	2023-11-30 12:09:32+01	33621277	Wohnungsboerse
480	2023-11-30 12:09:34+01	33623042	Wohnungsboerse
625	2023-11-30 12:09:37+01	33623012	Wohnungsboerse
420	2023-11-30 12:09:40+01	33622886	Wohnungsboerse
700	2023-11-30 12:09:42+01	33629198	Wohnungsboerse
1005	2023-11-30 12:09:45+01	33629407	Wohnungsboerse
654.92	2023-11-30 12:09:48+01	33402810	Wohnungsboerse
1311	2023-11-30 12:09:50+01	33638643	Wohnungsboerse
520	2023-11-30 12:09:53+01	33633187	Wohnungsboerse
3250	2023-11-30 12:09:55+01	33114294	Wohnungsboerse
1950	2023-11-30 12:09:57+01	33308983	Wohnungsboerse
1950	2023-11-30 12:09:59+01	33320934	Wohnungsboerse
505	2023-11-30 12:10:02+01	33480003	Wohnungsboerse
1640	2023-11-30 12:10:04+01	32877350	Wohnungsboerse
590	2023-11-30 12:10:06+01	33618833	Wohnungsboerse
515	2023-11-30 12:10:09+01	33611594	Wohnungsboerse
1157	2023-11-30 12:10:12+01	33608423	Wohnungsboerse
1000	2023-11-30 12:10:15+01	33615242	Wohnungsboerse
900	2023-11-30 12:10:18+01	33326054	Wohnungsboerse
950	2023-11-30 12:10:21+01	33555506	Wohnungsboerse
770.5	2023-11-30 12:10:24+01	33631174	Wohnungsboerse
1250	2023-11-30 12:10:26+01	33634581	Wohnungsboerse
1000	2023-11-30 12:10:29+01	33634724	Wohnungsboerse
1300	2023-11-30 12:10:32+01	33636555	Wohnungsboerse
1030	2023-11-30 12:10:34+01	33489715	Wohnungsboerse
860	2023-11-30 12:10:37+01	33638175	Wohnungsboerse
1200	2023-11-30 12:10:40+01	33608472	Wohnungsboerse
492	2023-11-30 12:10:43+01	33642252	Wohnungsboerse
990	2023-11-30 12:10:45+01	33642430	Wohnungsboerse
950	2023-11-30 12:10:48+01	33298728	Wohnungsboerse
800	2023-11-30 12:10:49+01	33086103	Wohnungsboerse
1530	2023-11-30 12:10:51+01	33565975	Wohnungsboerse
830	2023-11-30 12:10:54+01	33566839	Wohnungsboerse
650	2023-11-30 12:10:56+01	33584331	Wohnungsboerse
955.79	2023-11-30 12:10:58+01	33594334	Wohnungsboerse
1150	2023-11-30 12:11:01+01	33576669	Wohnungsboerse
974.95	2023-11-30 12:11:04+01	33600514	Wohnungsboerse
850	2023-11-30 12:11:06+01	33614086	Wohnungsboerse
500	2023-11-30 12:11:08+01	33625603	Wohnungsboerse
480	2023-11-30 12:11:11+01	33634529	Wohnungsboerse
550	2023-11-30 12:11:12+01	33638048	Wohnungsboerse
810	2023-11-30 12:11:15+01	33254648	Wohnungsboerse
585	2023-11-30 12:11:17+01	33642075	Wohnungsboerse
1890	2023-11-30 12:11:20+01	32728991	Wohnungsboerse
1790	2023-11-30 12:11:23+01	32728990	Wohnungsboerse
930	2023-11-30 12:11:25+01	33147363	Wohnungsboerse
1550	2023-11-30 12:11:27+01	32853522	Wohnungsboerse
1550	2023-11-30 12:11:30+01	33589759	Wohnungsboerse
1760	2023-11-30 12:11:33+01	33524121	Wohnungsboerse
920	2023-11-30 12:11:35+01	33600402	Wohnungsboerse
2150	2023-11-30 12:11:37+01	33640807	Wohnungsboerse
2480	2023-11-30 12:11:40+01	31210714	Wohnungsboerse
8500	2023-11-30 12:11:43+01	33196281	Wohnungsboerse
1800	2023-11-30 12:11:46+01	32817541	Wohnungsboerse
1379.88	2023-11-30 12:11:49+01	33445819	Wohnungsboerse
1684.63	2023-11-30 12:11:51+01	33445857	Wohnungsboerse
2200	2023-11-30 12:11:54+01	33422321	Wohnungsboerse
2950	2023-11-30 12:11:56+01	33455178	Wohnungsboerse
1742	2023-11-30 12:11:58+01	32706775	Wohnungsboerse
700	2023-11-30 12:12:01+01	33501793	Wohnungsboerse
817	2023-11-30 12:12:04+01	33530733	Wohnungsboerse
450	2023-11-30 12:12:07+01	33576712	Wohnungsboerse
2770	2023-11-30 12:12:10+01	33347939	Wohnungsboerse
650	2023-11-30 12:12:12+01	33609760	Wohnungsboerse
1850	2023-11-30 12:12:14+01	33196527	Wohnungsboerse
700	2023-11-30 12:12:57+01	33535395	Wohnungsboerse
902.96	2023-11-30 12:13:00+01	33476080	Wohnungsboerse
624	2023-11-30 12:13:02+01	33565734	Wohnungsboerse
879.75	2023-11-30 12:13:05+01	33596793	Wohnungsboerse
687	2023-11-30 12:13:08+01	33455338	Wohnungsboerse
481.92	2023-11-30 12:13:11+01	32442188	Wohnungsboerse
1900	2023-11-30 12:13:13+01	31394882	Wohnungsboerse
986	2023-11-30 12:13:16+01	33609013	Wohnungsboerse
2700	2023-11-30 12:13:19+01	33449689	Wohnungsboerse
1190	2023-11-30 12:13:22+01	33601786	Wohnungsboerse
942.96	2023-11-30 12:13:23+01	33501772	Wohnungsboerse
695	2023-11-30 12:13:26+01	33473469	Wohnungsboerse
595	2023-11-30 12:13:27+01	33642425	Wohnungsboerse
1205	2023-11-30 12:13:30+01	27088008	Wohnungsboerse
1340	2023-11-30 12:13:32+01	33462779	Wohnungsboerse
920	2023-11-30 12:13:34+01	29314952	Wohnungsboerse
1550	2023-11-30 12:13:36+01	33438599	Wohnungsboerse
2140	2023-11-30 12:13:38+01	33596447	Wohnungsboerse
3300	2023-11-30 12:13:41+01	33598493	Wohnungsboerse
1830	2023-11-30 12:13:44+01	33568443	Wohnungsboerse
1360	2023-11-30 12:13:46+01	33604004	Wohnungsboerse
1450	2023-11-30 12:13:48+01	33608727	Wohnungsboerse
650	2023-11-30 12:13:50+01	29317989	Wohnungsboerse
1200	2023-11-30 12:13:53+01	29631528	Wohnungsboerse
1890	2023-11-30 12:13:55+01	32976977	Wohnungsboerse
730	2023-11-30 12:13:58+01	33495322	Wohnungsboerse
1785	2023-11-30 12:14:00+01	33245396	Wohnungsboerse
955	2023-11-30 12:14:03+01	33572182	Wohnungsboerse
1070	2023-11-30 12:14:04+01	33604437	Wohnungsboerse
750	2023-11-30 12:14:06+01	33606087	Wohnungsboerse
1116.17	2023-11-30 12:14:09+01	33274310	Wohnungsboerse
1400	2023-11-30 12:14:12+01	33619031	Wohnungsboerse
790	2023-11-30 12:14:14+01	33633149	Wohnungsboerse
980	2023-11-30 12:14:16+01	33636783	Wohnungsboerse
600	2023-11-30 12:14:18+01	33516824	Wohnungsboerse
810	2023-11-30 12:14:21+01	33439071	Wohnungsboerse
1795	2023-11-30 12:14:23+01	33540488	Wohnungsboerse
1495	2023-11-30 12:14:25+01	33540487	Wohnungsboerse
1450	2023-11-30 12:14:28+01	33623140	Wohnungsboerse
850	2023-11-30 12:14:30+01	33623750	Wohnungsboerse
1100	2023-11-30 12:14:33+01	31675590	Wohnungsboerse
1168.83	2023-11-30 12:14:36+01	33384509	Wohnungsboerse
684	2023-11-30 12:14:38+01	27035171	Wohnungsboerse
1348	2023-11-30 12:14:40+01	33425850	Wohnungsboerse
1064	2023-11-30 12:14:42+01	32820355	Wohnungsboerse
1066	2023-11-30 12:14:44+01	33449817	Wohnungsboerse
1262.17	2023-11-30 12:14:47+01	33450063	Wohnungsboerse
997	2023-11-30 12:14:50+01	33515794	Wohnungsboerse
1300	2023-11-30 12:14:51+01	33455197	Wohnungsboerse
1215	2023-11-30 12:14:54+01	33611348	Wohnungsboerse
1272.31	2023-11-30 12:14:57+01	33630924	Wohnungsboerse
1350	2023-11-30 12:14:59+01	33642424	Wohnungsboerse
1025	2023-11-30 12:15:01+01	33642423	Wohnungsboerse
895	2023-11-30 12:15:03+01	33642422	Wohnungsboerse
830	2023-11-30 12:15:05+01	33642426	Wohnungsboerse
420	2023-11-30 12:15:07+01	33638695	Wohnungsboerse
1000	2023-11-30 12:15:10+01	33589815	Wohnungsboerse
350	2023-11-30 12:15:13+01	33642440	Wohnungsboerse
990	2023-11-30 12:15:15+01	33619386	Wohnungsboerse
990	2023-11-30 12:15:18+01	33619385	Wohnungsboerse
720	2023-11-30 12:15:20+01	33642445	Wohnungsboerse
590	2023-11-30 12:15:23+01	33638731	Wohnungsboerse
537.2	2023-11-30 12:15:24+01	26899927	Wohnungsboerse
700	2023-11-30 12:15:27+01	33643531	Wohnungsboerse
999	2023-11-30 12:15:29+01	33579841	Wohnungsboerse
500	2023-11-30 12:15:33+01	33587205	Wohnungsboerse
762	2023-11-30 12:15:34+01	33578486	Wohnungsboerse
1450	2023-11-30 12:15:37+01	33630752	Wohnungsboerse
580	2023-11-30 12:15:39+01	33638332	Wohnungsboerse
623.31	2023-11-30 12:15:40+01	33457517	Wohnungsboerse
839.16	2023-11-30 12:15:44+01	33402808	Wohnungsboerse
828.2	2023-11-30 12:15:46+01	33396009	Wohnungsboerse
920	2023-11-30 12:15:48+01	33627326	Wohnungsboerse
900	2023-11-30 12:15:51+01	33627469	Wohnungsboerse
720	2023-11-30 12:15:53+01	33487464	Wohnungsboerse
1850	2023-11-30 12:15:56+01	33129082	Wohnungsboerse
1450	2023-11-30 12:15:58+01	33454997	Wohnungsboerse
1150	2023-11-30 12:16:00+01	33579993	Wohnungsboerse
1799	2023-11-30 12:16:03+01	33242019	Wohnungsboerse
790	2023-11-30 12:16:05+01	33600500	Wohnungsboerse
697	2023-11-30 12:16:07+01	33611354	Wohnungsboerse
1999	2023-11-30 12:16:09+01	33616666	Wohnungsboerse
1290	2023-11-30 12:16:11+01	33629353	Wohnungsboerse
1450	2023-11-30 12:16:14+01	32375748	Wohnungsboerse
1200	2023-11-30 12:16:15+01	33636840	Wohnungsboerse
765	2023-11-30 12:16:18+01	33544205	Wohnungsboerse
920	2023-11-30 12:16:19+01	32918930	Wohnungsboerse
610.44	2023-11-30 12:16:21+01	33400003	Wohnungsboerse
830	2023-11-30 12:16:24+01	33354625	Wohnungsboerse
526.83	2023-11-30 12:16:26+01	33560204	Wohnungsboerse
750	2023-11-30 12:16:28+01	33621429	Wohnungsboerse
1125	2023-11-30 12:16:30+01	33623493	Wohnungsboerse
900	2023-11-30 12:16:33+01	33627163	Wohnungsboerse
1050	2023-11-30 12:16:36+01	33638465	Wohnungsboerse
623	2023-11-30 12:16:37+01	33554994	Wohnungsboerse
1100	2023-11-30 12:16:40+01	33609664	Wohnungsboerse
750.95	2023-11-30 12:16:42+01	33596800	Wohnungsboerse
750.95	2023-11-30 12:16:44+01	33601625	Wohnungsboerse
498.36	2023-11-30 12:16:47+01	31818244	Wohnungsboerse
670	2023-11-30 12:16:50+01	33583944	Wohnungsboerse
896	2023-11-30 12:16:52+01	33196294	Wohnungsboerse
959	2023-11-30 12:16:54+01	32816215	Wohnungsboerse
1050	2023-11-30 12:16:57+01	33592784	Wohnungsboerse
1630	2023-11-30 12:16:59+01	33596604	Wohnungsboerse
872.49	2023-11-30 12:17:02+01	33598517	Wohnungsboerse
1250	2023-11-30 12:17:04+01	33600413	Wohnungsboerse
645	2023-11-30 12:17:06+01	33604328	Wohnungsboerse
1290	2023-11-30 12:17:08+01	33621439	Wohnungsboerse
1250	2023-11-30 12:17:11+01	33621867	Wohnungsboerse
890	2023-11-30 12:17:14+01	33622978	Wohnungsboerse
1550	2023-11-30 12:17:17+01	33623433	Wohnungsboerse
720	2023-11-30 12:17:19+01	33584182	Wohnungsboerse
850	2023-11-30 12:17:20+01	33604309	Wohnungsboerse
636	2023-11-30 12:17:22+01	33487646	Wohnungsboerse
869	2023-11-30 12:17:25+01	33344003	Wohnungsboerse
460	2023-11-30 12:17:28+01	33594449	Wohnungsboerse
681	2023-11-30 12:17:31+01	33343991	Wohnungsboerse
869	2023-11-30 12:17:33+01	33344010	Wohnungsboerse
839	2023-11-30 12:17:36+01	33344005	Wohnungsboerse
505.8	2023-11-30 12:17:38+01	33600604	Wohnungsboerse
549.88	2023-11-30 12:17:40+01	33600602	Wohnungsboerse
600	2023-11-30 12:17:44+01	33614961	Wohnungsboerse
760	2023-11-30 12:17:46+01	33623746	Wohnungsboerse
829	2023-11-30 12:17:49+01	33487610	Wohnungsboerse
950	2023-11-30 12:17:52+01	33633121	Wohnungsboerse
695	2023-11-30 12:17:53+01	33638071	Wohnungsboerse
1137.36	2023-11-30 12:17:56+01	33435007	Wohnungsboerse
4900	2023-11-30 12:17:58+01	33560362	Wohnungsboerse
2000	2023-11-30 12:18:00+01	33640373	Wohnungsboerse
630	2023-11-30 12:18:39+01	33642253	Wohnungsboerse
650	2023-11-30 12:18:41+01	33601613	Wohnungsboerse
750	2023-11-30 12:18:44+01	33606198	Wohnungsboerse
1649	2023-11-30 12:18:45+01	33537199	Wohnungsboerse
750	2023-11-30 12:18:48+01	33619345	Wohnungsboerse
759	2023-11-30 12:18:51+01	33095129	Wohnungsboerse
467.18	2023-11-30 12:18:53+01	33598508	Wohnungsboerse
900	2023-11-30 12:18:56+01	33604667	Wohnungsboerse
810.81	2023-11-30 12:18:58+01	33002621	Wohnungsboerse
1150	2023-11-30 12:19:00+01	33429247	Wohnungsboerse
835	2023-11-30 12:19:04+01	33608789	Wohnungsboerse
740	2023-11-30 12:19:05+01	33497613	Wohnungsboerse
2560	2023-11-30 12:19:08+01	33493623	Wohnungsboerse
850	2023-11-30 12:19:10+01	33213161	Wohnungsboerse
1750	2023-11-30 12:19:12+01	33571784	Wohnungsboerse
784	2023-11-30 12:19:15+01	33347397	Wohnungsboerse
465.65	2023-11-30 12:19:17+01	33254653	Wohnungsboerse
640	2023-11-30 12:19:19+01	33299372	Wohnungsboerse
735	2023-11-30 12:19:22+01	33347299	Wohnungsboerse
2925	2023-11-30 12:19:25+01	33259857	Wohnungsboerse
1500	2023-11-30 12:19:28+01	33513524	Wohnungsboerse
1350	2023-11-30 12:19:31+01	33555390	Wohnungsboerse
1000	2023-11-30 12:19:33+01	33574808	Wohnungsboerse
1590	2023-11-30 12:19:36+01	33329023	Wohnungsboerse
3500	2023-11-30 12:19:40+01	33593062	Wohnungsboerse
1800	2023-11-30 12:19:41+01	33593060	Wohnungsboerse
740	2023-11-30 12:19:43+01	33298889	Wohnungsboerse
586.4	2023-11-30 12:19:46+01	33638530	Wohnungsboerse
800	2023-11-30 12:19:48+01	32111553	Wohnungsboerse
500	2023-11-30 12:19:50+01	33571565	Wohnungsboerse
425	2023-11-30 12:19:52+01	33598616	Wohnungsboerse
810.81	2023-11-30 12:19:54+01	33600603	Wohnungsboerse
610	2023-11-30 12:19:57+01	33610764	Wohnungsboerse
745	2023-11-30 12:19:58+01	33616395	Wohnungsboerse
625	2023-11-30 12:20:00+01	33615031	Wohnungsboerse
650	2023-11-30 12:20:03+01	33616682	Wohnungsboerse
482	2023-11-30 12:20:05+01	33618734	Wohnungsboerse
1180	2023-11-30 12:20:07+01	33621233	Wohnungsboerse
530	2023-11-30 12:20:09+01	33627010	Wohnungsboerse
550	2023-11-30 12:20:11+01	33633812	Wohnungsboerse
1540	2023-11-30 12:20:14+01	32803920	Wohnungsboerse
4300	2023-11-30 12:20:16+01	33621250	Wohnungsboerse
950	2023-11-30 12:20:21+01	33333966	Wohnungsboerse
890	2023-11-30 12:20:23+01	33103145	Wohnungsboerse
692	2023-11-30 12:20:26+01	33274520	Wohnungsboerse
614	2023-11-30 12:20:26+01	33487615	Wohnungsboerse
1500	2023-11-30 12:20:29+01	33566757	Wohnungsboerse
700	2023-11-30 12:20:31+01	33568372	Wohnungsboerse
511	2023-11-30 12:20:33+01	33487617	Wohnungsboerse
970	2023-11-30 12:20:36+01	33609058	Wohnungsboerse
990	2023-11-30 12:20:39+01	33613231	Wohnungsboerse
540	2023-11-30 12:20:42+01	33616482	Wohnungsboerse
670	2023-11-30 12:20:43+01	33623269	Wohnungsboerse
1160	2023-11-30 12:20:46+01	33634700	Wohnungsboerse
990	2023-11-30 12:20:48+01	33636749	Wohnungsboerse
810	2023-11-30 12:20:50+01	33203387	Wohnungsboerse
1600	2023-11-30 12:20:53+01	33548591	Wohnungsboerse
735	2023-11-30 12:20:56+01	33584300	Wohnungsboerse
1200	2023-11-30 12:20:59+01	33452273	Wohnungsboerse
640	2023-11-30 12:21:01+01	33615107	Wohnungsboerse
990	2023-11-30 12:21:02+01	33627670	Wohnungsboerse
1568.43	2023-11-30 12:21:05+01	33402892	Wohnungsboerse
830	2023-11-30 12:21:08+01	33367045	Wohnungsboerse
1135	2023-11-30 12:21:11+01	32705183	Wohnungsboerse
1790	2023-11-30 12:21:14+01	31571982	Wohnungsboerse
1330	2023-11-30 12:21:16+01	33579566	Wohnungsboerse
810	2023-11-30 12:21:19+01	33600360	Wohnungsboerse
677.75	2023-11-30 12:21:22+01	33594001	Wohnungsboerse
759.66	2023-11-30 12:21:24+01	33500282	Wohnungsboerse
995	2023-11-30 12:21:26+01	33619052	Wohnungsboerse
1125	2023-11-30 12:21:29+01	33619066	Wohnungsboerse
1500	2023-11-30 12:21:31+01	33623400	Wohnungsboerse
640	2023-11-30 12:21:33+01	33480104	Wohnungsboerse
700	2023-11-30 12:21:37+01	33636639	Wohnungsboerse
620	2023-11-30 12:21:39+01	33638037	Wohnungsboerse
450	2023-11-30 12:21:40+01	33640529	Wohnungsboerse
530	2023-11-30 12:21:43+01	33610906	Wohnungsboerse
954.97	2023-11-30 12:21:46+01	33229616	Wohnungsboerse
1280	2023-11-30 12:21:48+01	33614762	Wohnungsboerse
435	2023-11-30 12:21:51+01	33621408	Wohnungsboerse
510	2023-11-30 12:21:54+01	33323829	Wohnungsboerse
995	2023-11-30 12:21:55+01	33626158	Wohnungsboerse
865	2023-11-30 12:21:58+01	33630880	Wohnungsboerse
642	2023-11-30 12:22:01+01	33582149	Wohnungsboerse
470	2023-11-30 12:22:03+01	33635095	Wohnungsboerse
1250	2023-11-30 12:22:05+01	33641694	Wohnungsboerse
420	2023-11-30 12:22:07+01	33641827	Wohnungsboerse
539	2023-11-30 12:22:09+01	33641989	Wohnungsboerse
780	2023-11-30 12:22:12+01	33642189	Wohnungsboerse
770	2023-11-30 12:22:14+01	33642277	Wohnungsboerse
870	2023-11-30 12:22:16+01	33501784	Wohnungsboerse
1610	2023-11-30 12:22:19+01	33501783	Wohnungsboerse
1560	2023-11-30 12:22:22+01	33501782	Wohnungsboerse
1340	2023-11-30 12:22:25+01	33501780	Wohnungsboerse
1620	2023-11-30 12:22:27+01	33501779	Wohnungsboerse
1620	2023-11-30 12:22:30+01	33539937	Wohnungsboerse
800	2023-11-30 12:22:31+01	33543940	Wohnungsboerse
977.5	2023-11-30 12:22:34+01	32937445	Wohnungsboerse
610	2023-11-30 12:22:36+01	33606189	Wohnungsboerse
1728	2023-11-30 12:22:38+01	33616369	Wohnungsboerse
1450	2023-11-30 12:22:41+01	33351683	Wohnungsboerse
1450	2023-11-30 12:22:43+01	33619038	Wohnungsboerse
790	2023-11-30 12:22:46+01	33392135	Wohnungsboerse
1430	2023-11-30 12:22:50+01	33634501	Wohnungsboerse
1500	2023-11-30 12:22:52+01	33568150	Wohnungsboerse
3800	2023-11-30 12:22:55+01	33601618	Wohnungsboerse
660	2023-11-30 12:22:58+01	33611516	Wohnungsboerse
1510	2023-11-30 12:22:59+01	33614781	Wohnungsboerse
1290	2023-11-30 12:23:01+01	33440756	Wohnungsboerse
445	2023-11-30 12:23:03+01	33070027	Wohnungsboerse
690	2023-11-30 12:23:06+01	33608372	Wohnungsboerse
490	2023-11-30 12:23:09+01	33609721	Wohnungsboerse
920	2023-11-30 12:23:11+01	33615039	Wohnungsboerse
1000	2023-11-30 12:23:14+01	33567171	Wohnungsboerse
680	2023-11-30 12:23:16+01	33621886	Wohnungsboerse
700	2023-11-30 12:23:19+01	33623177	Wohnungsboerse
927.29	2023-11-30 12:23:21+01	32948163	Wohnungsboerse
932.88	2023-11-30 12:23:23+01	33402862	Wohnungsboerse
1100	2023-11-30 12:23:26+01	33634843	Wohnungsboerse
900	2023-11-30 12:23:29+01	33634906	Wohnungsboerse
1625	2023-11-30 12:23:32+01	32233451	Wohnungsboerse
1100	2023-11-30 12:23:34+01	33638259	Wohnungsboerse
3650	2023-11-30 12:23:36+01	33638532	Wohnungsboerse
1620	2023-11-30 12:23:37+01	33565781	Wohnungsboerse
1270	2023-11-30 12:23:40+01	33519879	Wohnungsboerse
850	2023-11-30 12:23:42+01	33203773	Wohnungsboerse
614	2023-11-30 12:23:45+01	33051217	Wohnungsboerse
459.38	2023-11-30 12:23:46+01	33636857	Wohnungsboerse
800	2023-11-30 12:23:49+01	33574225	Wohnungsboerse
864	2023-11-30 12:23:51+01	33576182	Wohnungsboerse
750	2023-11-30 12:23:54+01	33583866	Wohnungsboerse
970	2023-11-30 12:23:55+01	33286890	Wohnungsboerse
996	2023-11-30 12:23:57+01	33594288	Wohnungsboerse
800	2023-11-30 12:24:00+01	33604204	Wohnungsboerse
1254	2023-11-30 12:24:03+01	33352052	Wohnungsboerse
700	2023-11-30 12:24:05+01	33317345	Wohnungsboerse
520.59	2023-11-30 12:24:08+01	32904875	Wohnungsboerse
1385	2023-11-30 12:24:10+01	33623485	Wohnungsboerse
940.3	2023-11-30 12:24:13+01	33625573	Wohnungsboerse
1594.05	2023-11-30 12:24:15+01	33627528	Wohnungsboerse
710	2023-11-30 12:24:18+01	33634504	Wohnungsboerse
509.58	2023-11-30 12:24:21+01	33641929	Wohnungsboerse
1700	2023-11-30 12:24:23+01	33627296	Wohnungsboerse
950	2023-11-30 12:24:24+01	32579742	Wohnungsboerse
550	2023-11-30 12:24:27+01	33629602	Wohnungsboerse
559.99	2023-11-30 12:24:30+01	33630974	Wohnungsboerse
1099	2023-11-30 12:24:33+01	33633119	Wohnungsboerse
590	2023-11-30 12:24:34+01	33633219	Wohnungsboerse
1050	2023-11-30 12:24:37+01	33633208	Wohnungsboerse
465	2023-11-30 12:24:38+01	33633393	Wohnungsboerse
1160	2023-11-30 12:24:41+01	33633541	Wohnungsboerse
900	2023-11-30 12:24:44+01	33634500	Wohnungsboerse
850	2023-11-30 12:24:46+01	33638158	Wohnungsboerse
1250	2023-11-30 12:24:48+01	33640574	Wohnungsboerse
1142	2023-11-30 12:24:51+01	33640739	Wohnungsboerse
724.07	2023-11-30 12:24:53+01	33608544	Wohnungsboerse
959	2023-11-30 12:24:55+01	33601545	Wohnungsboerse
2500	2023-11-30 12:24:58+01	33605699	Wohnungsboerse
1080	2023-11-30 12:25:00+01	33605697	Wohnungsboerse
1050	2023-11-30 12:25:02+01	33605848	Wohnungsboerse
1600	2023-11-30 12:25:05+01	33608779	Wohnungsboerse
1728	2023-11-30 12:25:08+01	33612568	Wohnungsboerse
943	2023-11-30 12:25:11+01	31737888	Wohnungsboerse
1600	2023-11-30 12:25:13+01	33623508	Wohnungsboerse
1630	2023-11-30 12:25:15+01	33626426	Wohnungsboerse
750	2023-11-30 12:25:18+01	33627378	Wohnungsboerse
2000	2023-11-30 12:25:20+01	33213168	Wohnungsboerse
1450	2023-11-30 12:25:23+01	33633146	Wohnungsboerse
975	2023-11-30 12:25:25+01	33614971	Wohnungsboerse
2980	2023-11-30 12:25:29+01	33638100	Wohnungsboerse
600	2023-11-30 12:25:31+01	33611464	Wohnungsboerse
400	2023-11-30 12:25:34+01	33611558	Wohnungsboerse
1100	2023-11-30 12:25:37+01	33615026	Wohnungsboerse
805	2023-11-30 12:25:40+01	33615134	Wohnungsboerse
1200	2023-11-30 12:25:41+01	33581970	Wohnungsboerse
1035	2023-11-30 12:25:44+01	33524613	Wohnungsboerse
720	2023-11-30 12:25:46+01	33636511	Wohnungsboerse
450	2023-11-30 12:25:48+01	33637056	Wohnungsboerse
430	2023-11-30 12:25:50+01	33616312	Wohnungsboerse
790	2023-11-30 12:25:53+01	33638258	Wohnungsboerse
990	2023-11-30 12:25:56+01	33479487	Wohnungsboerse
1090	2023-11-30 12:25:58+01	33642049	Wohnungsboerse
2480	2023-12-04 12:02:52+01	31210714	Wohnungsboerse
1790	2023-12-04 12:02:55+01	32728990	Wohnungsboerse
840	2023-12-04 12:02:56+01	33313054	Wohnungsboerse
570	2023-12-04 12:02:58+01	33650252	Wohnungsboerse
800	2023-12-04 12:03:01+01	31766932	Wohnungsboerse
700	2023-12-04 12:03:03+01	33629198	Wohnungsboerse
978	2023-12-04 12:03:06+01	33649009	Wohnungsboerse
522	2023-12-04 12:03:08+01	33571818	Wohnungsboerse
1100	2023-12-04 12:03:11+01	33321367	Wohnungsboerse
1590	2023-12-04 12:03:13+01	33652479	Wohnungsboerse
720	2023-12-04 12:03:15+01	32630083	Wohnungsboerse
550	2023-12-04 12:03:18+01	33650008	Wohnungsboerse
830	2023-12-04 12:03:20+01	32976985	Wohnungsboerse
970	2023-12-04 12:03:23+01	33574602	Wohnungsboerse
1990	2023-12-04 12:03:25+01	33437192	Wohnungsboerse
1700	2023-12-04 12:03:28+01	31549941	Wohnungsboerse
1891	2023-12-04 12:03:31+01	32697715	Wohnungsboerse
985	2023-12-04 12:03:32+01	32642467	Wohnungsboerse
1840	2023-12-04 12:03:35+01	32642458	Wohnungsboerse
1705	2023-12-04 12:03:38+01	33050991	Wohnungsboerse
2590	2023-12-04 12:03:41+01	33354570	Wohnungsboerse
2225	2023-12-04 12:03:43+01	32804194	Wohnungsboerse
943	2023-12-04 12:03:46+01	33391895	Wohnungsboerse
965	2023-12-04 12:03:47+01	33489268	Wohnungsboerse
2031	2023-12-04 12:03:50+01	33539691	Wohnungsboerse
1490	2023-12-04 12:03:52+01	33539690	Wohnungsboerse
2550	2023-12-04 12:03:53+01	33606387	Wohnungsboerse
820	2023-12-04 12:03:56+01	33318532	Wohnungsboerse
1450	2023-12-04 12:03:59+01	33347440	Wohnungsboerse
2950	2023-12-04 12:04:01+01	32489228	Wohnungsboerse
1550	2023-12-04 12:04:02+01	32848279	Wohnungsboerse
1400	2023-12-04 12:04:04+01	33435206	Wohnungsboerse
1450	2023-12-04 12:04:06+01	33506206	Wohnungsboerse
1400	2023-12-04 12:04:08+01	33565901	Wohnungsboerse
1400	2023-12-04 12:04:11+01	33578811	Wohnungsboerse
1470	2023-12-04 12:04:14+01	33582266	Wohnungsboerse
590	2023-12-04 12:04:16+01	33615243	Wohnungsboerse
1250	2023-12-04 12:04:18+01	33366949	Wohnungsboerse
1430	2023-12-04 12:04:21+01	33654824	Wohnungsboerse
870	2023-12-04 12:04:24+01	33662965	Wohnungsboerse
1200	2023-12-04 12:04:27+01	33622999	Wohnungsboerse
1290	2023-12-04 12:04:29+01	33292489	Wohnungsboerse
2000	2023-12-04 12:04:32+01	33623338	Wohnungsboerse
730	2023-12-04 12:04:35+01	33625597	Wohnungsboerse
5300	2023-12-04 12:04:37+01	33627177	Wohnungsboerse
1400	2023-12-04 12:04:39+01	33627630	Wohnungsboerse
5400	2023-12-04 12:04:42+01	33631016	Wohnungsboerse
990	2023-12-04 12:04:45+01	33378242	Wohnungsboerse
1300	2023-12-04 12:04:47+01	33438704	Wohnungsboerse
6850	2023-12-04 12:04:48+01	31193233	Wohnungsboerse
1050	2023-12-04 12:04:51+01	33646532	Wohnungsboerse
5200	2023-12-04 12:04:53+01	33652804	Wohnungsboerse
1121	2023-12-04 12:04:55+01	33662825	Wohnungsboerse
689.99	2023-12-04 12:04:57+01	33667881	Wohnungsboerse
900	2023-12-04 12:05:00+01	33574636	Wohnungsboerse
600	2023-12-04 12:05:02+01	33580297	Wohnungsboerse
593.07	2023-12-04 12:05:05+01	33594278	Wohnungsboerse
1125	2023-12-04 12:05:07+01	33276431	Wohnungsboerse
620.91	2023-12-04 12:05:10+01	33555215	Wohnungsboerse
940	2023-12-04 12:05:12+01	33504339	Wohnungsboerse
735	2023-12-04 12:05:14+01	33633189	Wohnungsboerse
871.94	2023-12-04 12:05:17+01	33059673	Wohnungsboerse
880	2023-12-04 12:05:20+01	33645816	Wohnungsboerse
790	2023-12-04 12:05:22+01	33649987	Wohnungsboerse
780	2023-12-04 12:05:25+01	33623692	Wohnungsboerse
750	2023-12-04 12:05:27+01	33662864	Wohnungsboerse
920	2023-12-04 12:05:29+01	33223803	Wohnungsboerse
350	2023-12-04 12:05:32+01	33667610	Wohnungsboerse
650	2023-12-04 12:05:35+01	33284573	Wohnungsboerse
850	2023-12-04 12:05:37+01	33067537	Wohnungsboerse
665	2023-12-04 12:05:39+01	33464631	Wohnungsboerse
580	2023-12-04 12:05:42+01	33548846	Wohnungsboerse
808.67	2023-12-04 12:05:44+01	33598534	Wohnungsboerse
800	2023-12-04 12:05:46+01	33509761	Wohnungsboerse
709	2023-12-04 12:05:48+01	33621436	Wohnungsboerse
579	2023-12-04 12:05:51+01	33621435	Wohnungsboerse
555	2023-12-04 12:05:53+01	33650581	Wohnungsboerse
575.54	2023-12-04 12:05:56+01	33510563	Wohnungsboerse
850	2023-12-04 12:05:59+01	33663487	Wohnungsboerse
799.81	2023-12-04 12:06:00+01	33652836	Wohnungsboerse
660	2023-12-04 12:06:03+01	33653093	Wohnungsboerse
585	2023-12-04 12:06:05+01	33654190	Wohnungsboerse
800	2023-12-04 12:06:07+01	33654373	Wohnungsboerse
580	2023-12-04 12:06:09+01	33654399	Wohnungsboerse
550	2023-12-04 12:06:12+01	33654646	Wohnungsboerse
700	2023-12-04 12:06:14+01	33654826	Wohnungsboerse
750	2023-12-04 12:06:16+01	33654859	Wohnungsboerse
275	2023-12-04 12:06:19+01	33657182	Wohnungsboerse
295	2023-12-04 12:06:21+01	33658095	Wohnungsboerse
780	2023-12-04 12:06:22+01	33649147	Wohnungsboerse
1300	2023-12-04 12:06:25+01	33663829	Wohnungsboerse
1105	2023-12-04 12:06:28+01	33667672	Wohnungsboerse
1150	2023-12-04 12:06:31+01	33667671	Wohnungsboerse
640	2023-12-04 12:06:33+01	33386081	Wohnungsboerse
1094.17	2023-12-04 12:06:35+01	33522726	Wohnungsboerse
874.24	2023-12-04 12:06:38+01	33522714	Wohnungsboerse
941.83	2023-12-04 12:06:41+01	33522747	Wohnungsboerse
700	2023-12-04 12:06:43+01	33579780	Wohnungsboerse
1315	2023-12-04 12:06:46+01	33583884	Wohnungsboerse
1390	2023-12-04 12:06:48+01	33373146	Wohnungsboerse
500	2023-12-04 12:06:50+01	33625884	Wohnungsboerse
1350	2023-12-04 12:06:52+01	33608742	Wohnungsboerse
660	2023-12-04 12:06:54+01	33640387	Wohnungsboerse
630.13	2023-12-04 12:06:56+01	33636718	Wohnungsboerse
375	2023-12-04 12:06:58+01	33652444	Wohnungsboerse
600	2023-12-04 12:07:01+01	33652875	Wohnungsboerse
570	2023-12-04 12:07:03+01	33662910	Wohnungsboerse
1200	2023-12-04 12:07:05+01	33652548	Wohnungsboerse
1590	2023-12-04 12:07:08+01	33654426	Wohnungsboerse
640	2023-12-04 12:07:10+01	33657003	Wohnungsboerse
1190.87	2023-12-04 12:07:13+01	33274368	Wohnungsboerse
680	2023-12-04 12:07:16+01	33658120	Wohnungsboerse
390	2023-12-04 12:07:18+01	33659423	Wohnungsboerse
1648.76	2023-12-04 12:07:21+01	33660141	Wohnungsboerse
450	2023-12-04 12:07:24+01	33661180	Wohnungsboerse
1013	2023-12-04 12:07:27+01	33661206	Wohnungsboerse
1250	2023-12-04 12:07:28+01	33661332	Wohnungsboerse
1400	2023-12-04 12:07:31+01	31595587	Wohnungsboerse
600	2023-12-04 12:07:33+01	33663007	Wohnungsboerse
646	2023-12-04 12:07:36+01	33321684	Wohnungsboerse
950	2023-12-04 12:07:39+01	33664586	Wohnungsboerse
700	2023-12-04 12:07:41+01	33477583	Wohnungsboerse
1300	2023-12-04 12:07:44+01	31823448	Wohnungsboerse
550	2023-12-04 12:07:46+01	33645759	Wohnungsboerse
430	2023-12-04 12:07:49+01	33654675	Wohnungsboerse
1400	2023-12-04 12:07:51+01	33433016	Wohnungsboerse
1000	2023-12-04 12:07:54+01	33589277	Wohnungsboerse
650	2023-12-04 12:07:57+01	33303915	Wohnungsboerse
857	2023-12-04 12:08:00+01	33605711	Wohnungsboerse
850	2023-12-04 12:08:02+01	33615088	Wohnungsboerse
850	2023-12-04 12:08:04+01	33618934	Wohnungsboerse
840	2023-12-04 12:08:06+01	33623483	Wohnungsboerse
650	2023-12-04 12:08:09+01	33634877	Wohnungsboerse
660	2023-12-04 12:08:12+01	33644575	Wohnungsboerse
870	2023-12-04 12:08:14+01	33646100	Wohnungsboerse
360	2023-12-04 12:08:16+01	33652815	Wohnungsboerse
790	2023-12-04 12:08:18+01	33652853	Wohnungsboerse
590	2023-12-04 12:08:20+01	33495917	Wohnungsboerse
1000	2023-12-04 12:08:22+01	33659164	Wohnungsboerse
800	2023-12-04 12:08:25+01	33650266	Wohnungsboerse
680.13	2023-12-04 12:08:27+01	33653030	Wohnungsboerse
507.04	2023-12-04 12:08:29+01	33653026	Wohnungsboerse
424.51	2023-12-04 12:08:31+01	33653023	Wohnungsboerse
348.44	2023-12-04 12:08:34+01	33653022	Wohnungsboerse
530	2023-12-04 12:08:36+01	33653060	Wohnungsboerse
1200	2023-12-04 12:08:39+01	33333764	Wohnungsboerse
1290	2023-12-04 12:08:42+01	33654631	Wohnungsboerse
870	2023-12-04 12:08:45+01	33656930	Wohnungsboerse
2150	2023-12-04 12:08:47+01	33663608	Wohnungsboerse
844.5	2023-12-04 12:08:50+01	33445534	Wohnungsboerse
737	2023-12-04 12:08:53+01	33329109	Wohnungsboerse
782	2023-12-04 12:08:56+01	33341849	Wohnungsboerse
1186	2023-12-04 12:08:59+01	33664607	Wohnungsboerse
1005	2023-12-04 12:09:00+01	33629407	Wohnungsboerse
1311	2023-12-04 12:09:02+01	33638643	Wohnungsboerse
520	2023-12-04 12:09:04+01	33633187	Wohnungsboerse
1500	2023-12-04 12:09:07+01	33644286	Wohnungsboerse
1200	2023-12-04 12:09:09+01	33646060	Wohnungsboerse
670	2023-12-04 12:09:11+01	33646136	Wohnungsboerse
500	2023-12-04 12:09:14+01	33648973	Wohnungsboerse
390	2023-12-04 12:09:17+01	33652464	Wohnungsboerse
1100	2023-12-04 12:09:20+01	33658058	Wohnungsboerse
750	2023-12-04 12:09:23+01	33579012	Wohnungsboerse
691.15	2023-12-04 12:09:25+01	33653031	Wohnungsboerse
600	2023-12-04 12:09:28+01	33662860	Wohnungsboerse
850	2023-12-04 12:09:31+01	33663621	Wohnungsboerse
529	2023-12-04 12:09:34+01	33667495	Wohnungsboerse
3250	2023-12-04 12:09:36+01	33114294	Wohnungsboerse
1950	2023-12-04 12:09:39+01	33308983	Wohnungsboerse
1950	2023-12-04 12:09:41+01	33320934	Wohnungsboerse
505	2023-12-04 12:09:44+01	33480003	Wohnungsboerse
1640	2023-12-04 12:09:46+01	32877350	Wohnungsboerse
590	2023-12-04 12:09:49+01	33618833	Wohnungsboerse
1360	2023-12-04 12:09:52+01	33648905	Wohnungsboerse
1220	2023-12-04 12:09:54+01	33650301	Wohnungsboerse
900	2023-12-04 12:09:56+01	33555511	Wohnungsboerse
950	2023-12-04 12:09:59+01	33555506	Wohnungsboerse
1750	2023-12-04 12:10:01+01	33654229	Wohnungsboerse
500	2023-12-04 12:10:03+01	33657110	Wohnungsboerse
365	2023-12-04 12:10:05+01	33658026	Wohnungsboerse
770	2023-12-04 12:10:08+01	33659148	Wohnungsboerse
515	2023-12-04 12:10:09+01	33660156	Wohnungsboerse
730	2023-12-04 12:10:12+01	33661396	Wohnungsboerse
1020	2023-12-04 12:10:15+01	33662945	Wohnungsboerse
660	2023-12-04 12:10:18+01	33662933	Wohnungsboerse
1050	2023-12-04 12:10:20+01	33583631	Wohnungsboerse
1700	2023-12-04 12:10:22+01	33663617	Wohnungsboerse
1157	2023-12-04 12:10:25+01	33664805	Wohnungsboerse
1081	2023-12-04 12:10:28+01	33432833	Wohnungsboerse
900	2023-12-04 12:10:30+01	33225904	Wohnungsboerse
950	2023-12-04 12:10:33+01	33298728	Wohnungsboerse
800	2023-12-04 12:10:35+01	33086103	Wohnungsboerse
955.79	2023-12-04 12:10:38+01	33594334	Wohnungsboerse
1150	2023-12-04 12:10:40+01	33576669	Wohnungsboerse
974.95	2023-12-04 12:10:43+01	33600514	Wohnungsboerse
500	2023-12-04 12:10:45+01	33625603	Wohnungsboerse
480	2023-12-04 12:10:48+01	33634529	Wohnungsboerse
550	2023-12-04 12:10:50+01	33638048	Wohnungsboerse
810	2023-12-04 12:10:52+01	33254648	Wohnungsboerse
585	2023-12-04 12:10:54+01	33642075	Wohnungsboerse
600	2023-12-04 12:10:57+01	33653012	Wohnungsboerse
450	2023-12-04 12:10:59+01	33660225	Wohnungsboerse
930	2023-12-04 12:11:02+01	33147363	Wohnungsboerse
1550	2023-12-04 12:11:05+01	33589759	Wohnungsboerse
1760	2023-12-04 12:11:08+01	33524121	Wohnungsboerse
920	2023-12-04 12:11:09+01	33600402	Wohnungsboerse
2150	2023-12-04 12:11:11+01	33640807	Wohnungsboerse
1890	2023-12-04 12:11:13+01	32728992	Wohnungsboerse
1890	2023-12-04 12:11:15+01	32728991	Wohnungsboerse
1550	2023-12-04 12:11:18+01	32853522	Wohnungsboerse
487	2023-12-04 12:11:21+01	33667751	Wohnungsboerse
8500	2023-12-04 12:11:24+01	33196281	Wohnungsboerse
1800	2023-12-04 12:11:26+01	32817541	Wohnungsboerse
1379.88	2023-12-04 12:11:28+01	33445819	Wohnungsboerse
1684.63	2023-12-04 12:11:31+01	33445857	Wohnungsboerse
2200	2023-12-04 12:11:34+01	33422321	Wohnungsboerse
2950	2023-12-04 12:11:36+01	33455178	Wohnungsboerse
1742	2023-12-04 12:11:39+01	32706775	Wohnungsboerse
700	2023-12-04 12:11:42+01	33501793	Wohnungsboerse
817	2023-12-04 12:11:44+01	33530733	Wohnungsboerse
2770	2023-12-04 12:11:47+01	33347939	Wohnungsboerse
1850	2023-12-04 12:11:49+01	33196527	Wohnungsboerse
797.84	2023-12-04 12:11:52+01	33649071	Wohnungsboerse
534	2023-12-04 12:11:55+01	33656846	Wohnungsboerse
650	2023-12-04 12:11:57+01	33659343	Wohnungsboerse
700	2023-12-04 12:12:40+01	33535395	Wohnungsboerse
902.96	2023-12-04 12:12:43+01	33476080	Wohnungsboerse
896	2023-12-04 12:12:45+01	33196294	Wohnungsboerse
879.75	2023-12-04 12:12:48+01	33596793	Wohnungsboerse
750	2023-12-04 12:12:51+01	33644208	Wohnungsboerse
481.92	2023-12-04 12:12:53+01	32442188	Wohnungsboerse
1900	2023-12-04 12:12:56+01	31394882	Wohnungsboerse
595	2023-12-04 12:12:59+01	33667933	Wohnungsboerse
2700	2023-12-04 12:13:02+01	33449689	Wohnungsboerse
1190	2023-12-04 12:13:04+01	33601786	Wohnungsboerse
839.16	2023-12-04 12:13:06+01	33402808	Wohnungsboerse
695	2023-12-04 12:13:08+01	33473469	Wohnungsboerse
850	2023-12-04 12:13:10+01	33644192	Wohnungsboerse
1205	2023-12-04 12:13:13+01	27088008	Wohnungsboerse
1340	2023-12-04 12:13:15+01	33462779	Wohnungsboerse
1200	2023-12-04 12:13:18+01	29631528	Wohnungsboerse
2140	2023-12-04 12:13:20+01	33596447	Wohnungsboerse
3300	2023-12-04 12:13:22+01	33598493	Wohnungsboerse
1830	2023-12-04 12:13:24+01	33568443	Wohnungsboerse
1450	2023-12-04 12:13:26+01	33608727	Wohnungsboerse
1550	2023-12-04 12:13:29+01	33438599	Wohnungsboerse
1890	2023-12-04 12:13:31+01	32976977	Wohnungsboerse
730	2023-12-04 12:13:34+01	33495322	Wohnungsboerse
1785	2023-12-04 12:13:35+01	33245396	Wohnungsboerse
955	2023-12-04 12:13:38+01	33572182	Wohnungsboerse
1070	2023-12-04 12:13:40+01	33604437	Wohnungsboerse
1400	2023-12-04 12:13:43+01	33619031	Wohnungsboerse
790	2023-12-04 12:13:46+01	33633149	Wohnungsboerse
980	2023-12-04 12:13:48+01	33636783	Wohnungsboerse
600	2023-12-04 12:13:51+01	33516824	Wohnungsboerse
798	2023-12-04 12:13:54+01	33653065	Wohnungsboerse
750	2023-12-04 12:13:56+01	33654450	Wohnungsboerse
1000	2023-12-04 12:13:58+01	33664741	Wohnungsboerse
620	2023-12-04 12:14:00+01	33664503	Wohnungsboerse
810	2023-12-04 12:14:03+01	33439071	Wohnungsboerse
1795	2023-12-04 12:14:06+01	33540488	Wohnungsboerse
1495	2023-12-04 12:14:08+01	33540487	Wohnungsboerse
1450	2023-12-04 12:14:11+01	33623140	Wohnungsboerse
850	2023-12-04 12:14:14+01	33623750	Wohnungsboerse
1100	2023-12-04 12:14:16+01	31675590	Wohnungsboerse
1168.83	2023-12-04 12:14:19+01	33384509	Wohnungsboerse
684	2023-12-04 12:14:22+01	27035171	Wohnungsboerse
1348	2023-12-04 12:14:25+01	33425850	Wohnungsboerse
1064	2023-12-04 12:14:28+01	32820355	Wohnungsboerse
1066	2023-12-04 12:14:30+01	33449817	Wohnungsboerse
1262.17	2023-12-04 12:14:32+01	33450063	Wohnungsboerse
1300	2023-12-04 12:14:35+01	33455197	Wohnungsboerse
1215	2023-12-04 12:14:37+01	33611348	Wohnungsboerse
1272.31	2023-12-04 12:14:39+01	33630924	Wohnungsboerse
1158.43	2023-12-04 12:14:41+01	33650288	Wohnungsboerse
1534	2023-12-04 12:14:44+01	33646337	Wohnungsboerse
1375	2023-12-04 12:14:47+01	33654290	Wohnungsboerse
999	2023-12-04 12:14:50+01	33579841	Wohnungsboerse
762	2023-12-04 12:14:52+01	33578486	Wohnungsboerse
1450	2023-12-04 12:14:55+01	33630752	Wohnungsboerse
580	2023-12-04 12:14:58+01	33638332	Wohnungsboerse
1150	2023-12-04 12:15:00+01	33663485	Wohnungsboerse
828.2	2023-12-04 12:15:03+01	33396009	Wohnungsboerse
920	2023-12-04 12:15:06+01	33627326	Wohnungsboerse
720	2023-12-04 12:15:07+01	33487464	Wohnungsboerse
1850	2023-12-04 12:15:11+01	33129082	Wohnungsboerse
1450	2023-12-04 12:15:13+01	33454997	Wohnungsboerse
1150	2023-12-04 12:15:15+01	33579993	Wohnungsboerse
697	2023-12-04 12:15:18+01	33611354	Wohnungsboerse
1999	2023-12-04 12:15:19+01	33616666	Wohnungsboerse
1290	2023-12-04 12:15:21+01	33629353	Wohnungsboerse
1450	2023-12-04 12:15:24+01	32375748	Wohnungsboerse
1200	2023-12-04 12:15:26+01	33636840	Wohnungsboerse
790	2023-12-04 12:15:28+01	33650392	Wohnungsboerse
1328	2023-12-04 12:15:30+01	33667965	Wohnungsboerse
1355	2023-12-04 12:15:33+01	33667964	Wohnungsboerse
680	2023-12-04 12:15:37+01	33657958	Wohnungsboerse
1149	2023-12-04 12:15:39+01	33627046	Wohnungsboerse
540	2023-12-04 12:15:41+01	33548176	Wohnungsboerse
915	2023-12-04 12:15:43+01	33667986	Wohnungsboerse
495	2023-12-04 12:15:46+01	33667990	Wohnungsboerse
560	2023-12-04 12:15:48+01	33139206	Wohnungsboerse
550	2023-12-04 12:15:49+01	33382415	Wohnungsboerse
407	2023-12-04 12:15:52+01	33667995	Wohnungsboerse
440	2023-12-04 12:15:55+01	33668007	Wohnungsboerse
2000	2023-12-04 12:15:58+01	33668010	Wohnungsboerse
1350	2023-12-04 12:16:00+01	33668017	Wohnungsboerse
380	2023-12-04 12:16:03+01	33668022	Wohnungsboerse
765	2023-12-04 12:16:06+01	33544205	Wohnungsboerse
920	2023-12-04 12:16:08+01	32918930	Wohnungsboerse
610.44	2023-12-04 12:16:11+01	33400003	Wohnungsboerse
830	2023-12-04 12:16:13+01	33354625	Wohnungsboerse
750	2023-12-04 12:16:16+01	33621429	Wohnungsboerse
1125	2023-12-04 12:16:19+01	33623493	Wohnungsboerse
900	2023-12-04 12:16:21+01	33627163	Wohnungsboerse
1050	2023-12-04 12:16:24+01	33638465	Wohnungsboerse
623	2023-12-04 12:16:27+01	33554994	Wohnungsboerse
480	2023-12-04 12:16:28+01	33650359	Wohnungsboerse
526.83	2023-12-04 12:16:30+01	33560204	Wohnungsboerse
750	2023-12-04 12:16:32+01	33657206	Wohnungsboerse
560	2023-12-04 12:16:35+01	33658003	Wohnungsboerse
1000	2023-12-04 12:16:38+01	33648724	Wohnungsboerse
750.95	2023-12-04 12:16:41+01	33601625	Wohnungsboerse
750.95	2023-12-04 12:16:43+01	33596800	Wohnungsboerse
959	2023-12-04 12:16:46+01	32816215	Wohnungsboerse
1050	2023-12-04 12:16:49+01	33592784	Wohnungsboerse
872.49	2023-12-04 12:16:50+01	33598517	Wohnungsboerse
645	2023-12-04 12:16:53+01	33604328	Wohnungsboerse
1100.59	2023-12-04 12:16:55+01	33598459	Wohnungsboerse
1773.39	2023-12-04 12:16:57+01	33598511	Wohnungsboerse
1290	2023-12-04 12:17:00+01	33621439	Wohnungsboerse
1250	2023-12-04 12:17:03+01	33621867	Wohnungsboerse
1550	2023-12-04 12:17:05+01	33623433	Wohnungsboerse
720	2023-12-04 12:17:07+01	33584182	Wohnungsboerse
850	2023-12-04 12:17:10+01	33604309	Wohnungsboerse
490	2023-12-04 12:17:12+01	33645974	Wohnungsboerse
580	2023-12-04 12:17:14+01	33582106	Wohnungsboerse
575	2023-12-04 12:17:16+01	33667732	Wohnungsboerse
636	2023-12-04 12:17:19+01	33487646	Wohnungsboerse
869	2023-12-04 12:17:22+01	33344003	Wohnungsboerse
681	2023-12-04 12:17:25+01	33343991	Wohnungsboerse
869	2023-12-04 12:17:28+01	33344010	Wohnungsboerse
839	2023-12-04 12:17:30+01	33344005	Wohnungsboerse
549.88	2023-12-04 12:17:32+01	33600602	Wohnungsboerse
760	2023-12-04 12:17:34+01	33623746	Wohnungsboerse
829	2023-12-04 12:17:37+01	33487610	Wohnungsboerse
510.19	2023-12-04 12:24:17+01	33648739	Wohnungsboerse
600	2023-12-04 12:24:18+01	33614961	Wohnungsboerse
900	2023-12-04 12:24:18+01	33654518	Wohnungsboerse
1137.36	2023-12-04 12:24:20+01	33435007	Wohnungsboerse
2000	2023-12-04 12:24:21+01	33640373	Wohnungsboerse
4900	2023-12-04 12:24:23+01	33560362	Wohnungsboerse
950	2023-12-04 12:24:47+01	33633121	Wohnungsboerse
695	2023-12-04 12:24:49+01	33638071	Wohnungsboerse
1050	2023-12-04 12:25:09+01	33605848	Wohnungsboerse
1012.5	2023-12-04 12:25:12+01	33644285	Wohnungsboerse
840	2023-12-04 12:25:12+01	33645745	Wohnungsboerse
750	2023-12-04 12:25:15+01	33583866	Wohnungsboerse
467.18	2023-12-04 12:25:17+01	33598508	Wohnungsboerse
900	2023-12-04 12:25:21+01	33634906	Wohnungsboerse
810.81	2023-12-04 12:25:23+01	33002621	Wohnungsboerse
1728	2023-12-04 12:25:25+01	33616369	Wohnungsboerse
1450	2023-12-04 12:25:27+01	33351683	Wohnungsboerse
1450	2023-12-04 12:25:30+01	33619038	Wohnungsboerse
995	2023-12-04 12:25:33+01	33626158	Wohnungsboerse
1790	2023-12-04 12:25:35+01	31571982	Wohnungsboerse
2560	2023-12-04 12:25:38+01	33493623	Wohnungsboerse
810	2023-12-04 12:25:41+01	33198024	Wohnungsboerse
1750	2023-12-04 12:25:43+01	33571784	Wohnungsboerse
800	2023-12-04 12:25:45+01	32111553	Wohnungsboerse
465.65	2023-12-04 12:25:48+01	33254653	Wohnungsboerse
640	2023-12-04 12:25:50+01	33299372	Wohnungsboerse
2925	2023-12-04 12:25:53+01	33259857	Wohnungsboerse
947.16	2023-12-04 12:25:55+01	33304400	Wohnungsboerse
1500	2023-12-04 12:25:58+01	33513524	Wohnungsboerse
1000	2023-12-04 12:26:00+01	33574808	Wohnungsboerse
1590	2023-12-04 12:26:03+01	33329023	Wohnungsboerse
752.77	2023-12-04 12:26:05+01	33432779	Wohnungsboerse
740	2023-12-04 12:26:08+01	33298889	Wohnungsboerse
586.4	2023-12-04 12:26:11+01	33638530	Wohnungsboerse
735	2023-12-04 12:26:14+01	33650244	Wohnungsboerse
2900	2023-12-04 12:26:16+01	33652461	Wohnungsboerse
1800	2023-12-04 12:26:19+01	33593060	Wohnungsboerse
2900	2023-12-04 12:26:21+01	33593062	Wohnungsboerse
1350	2023-12-04 12:26:24+01	33654580	Wohnungsboerse
425	2023-12-04 12:26:26+01	33598616	Wohnungsboerse
810.81	2023-12-04 12:26:29+01	33600603	Wohnungsboerse
745	2023-12-04 12:26:32+01	33616395	Wohnungsboerse
650	2023-12-04 12:26:35+01	33616682	Wohnungsboerse
482	2023-12-04 12:26:37+01	33618734	Wohnungsboerse
1180	2023-12-04 12:26:40+01	33621233	Wohnungsboerse
530	2023-12-04 12:26:43+01	33627010	Wohnungsboerse
550	2023-12-04 12:26:46+01	33633812	Wohnungsboerse
1100	2023-12-04 12:26:49+01	33646277	Wohnungsboerse
610	2023-12-04 12:27:27+01	33659245	Wohnungsboerse
900	2023-12-04 12:27:27+01	33667467	Wohnungsboerse
710	2023-12-04 12:27:28+01	33347397	Wohnungsboerse
520	2023-12-04 12:27:28+01	33667601	Wohnungsboerse
480	2023-12-04 12:27:29+01	33650437	Wohnungsboerse
1540	2023-12-04 12:27:30+01	32803920	Wohnungsboerse
4200	2023-12-04 12:27:33+01	33648553	Wohnungsboerse
730	2023-12-04 12:27:35+01	33658070	Wohnungsboerse
420	2023-12-04 12:27:38+01	33658059	Wohnungsboerse
950	2023-12-04 12:27:41+01	33333966	Wohnungsboerse
890	2023-12-04 12:27:42+01	33103145	Wohnungsboerse
614	2023-12-04 12:27:44+01	33487615	Wohnungsboerse
692	2023-12-04 12:27:47+01	33274520	Wohnungsboerse
700	2023-12-04 12:27:50+01	33568372	Wohnungsboerse
511	2023-12-04 12:27:51+01	33487617	Wohnungsboerse
970	2023-12-04 12:27:53+01	33609058	Wohnungsboerse
990	2023-12-04 12:27:56+01	33613231	Wohnungsboerse
540	2023-12-04 12:27:59+01	33616482	Wohnungsboerse
670	2023-12-04 12:28:02+01	33623269	Wohnungsboerse
1160	2023-12-04 12:28:05+01	33634700	Wohnungsboerse
990	2023-12-04 12:28:07+01	33636749	Wohnungsboerse
810	2023-12-04 12:28:10+01	33203387	Wohnungsboerse
1600	2023-12-04 12:28:11+01	33548591	Wohnungsboerse
735	2023-12-04 12:28:13+01	33584300	Wohnungsboerse
990	2023-12-04 12:28:16+01	33627670	Wohnungsboerse
1568.43	2023-12-04 12:28:18+01	33402892	Wohnungsboerse
630	2023-12-04 12:28:20+01	33656730	Wohnungsboerse
640	2023-12-04 12:28:23+01	33615107	Wohnungsboerse
810	2023-12-04 12:28:24+01	33600360	Wohnungsboerse
677.75	2023-12-04 12:28:26+01	33594001	Wohnungsboerse
759.66	2023-12-04 12:28:29+01	33500282	Wohnungsboerse
1125	2023-12-04 12:28:31+01	33619066	Wohnungsboerse
640	2023-12-04 12:28:33+01	33480104	Wohnungsboerse
700	2023-12-04 12:28:35+01	33636639	Wohnungsboerse
450	2023-12-04 12:28:38+01	33640529	Wohnungsboerse
1994	2023-12-04 12:28:41+01	33654597	Wohnungsboerse
540	2023-12-04 12:28:43+01	33654834	Wohnungsboerse
919.02	2023-12-04 12:28:45+01	33656971	Wohnungsboerse
750.61	2023-12-04 12:28:48+01	33656962	Wohnungsboerse
845	2023-12-04 12:28:51+01	33657988	Wohnungsboerse
1500	2023-12-04 12:28:53+01	33623400	Wohnungsboerse
995	2023-12-04 12:28:56+01	33619052	Wohnungsboerse
865	2023-12-04 12:28:59+01	33630880	Wohnungsboerse
420	2023-12-04 12:29:01+01	33641827	Wohnungsboerse
539	2023-12-04 12:29:03+01	33641989	Wohnungsboerse
780	2023-12-04 12:29:07+01	33642189	Wohnungsboerse
920	2023-12-04 12:59:48+01	32018207	Wohnungsboerse
930	2023-12-04 12:59:49+01	33644497	Wohnungsboerse
740	2023-12-04 12:59:50+01	33650201	Wohnungsboerse
732	2023-12-04 12:59:51+01	33650317	Wohnungsboerse
1080	2023-12-04 12:59:52+01	33644435	Wohnungsboerse
1250	2023-12-04 12:59:54+01	33641694	Wohnungsboerse
835	2023-12-04 12:59:54+01	33657148	Wohnungsboerse
841.49	2023-12-04 12:59:55+01	33546509	Wohnungsboerse
790	2023-12-04 12:59:58+01	33392135	Wohnungsboerse
1000	2023-12-04 13:00:01+01	33542810	Wohnungsboerse
1430	2023-12-04 13:00:03+01	33634501	Wohnungsboerse
1700	2023-12-04 13:00:06+01	33646382	Wohnungsboerse
1620	2023-12-04 13:00:08+01	33650436	Wohnungsboerse
1340	2023-12-04 13:00:11+01	33650435	Wohnungsboerse
1560	2023-12-04 13:00:14+01	33650434	Wohnungsboerse
1610	2023-12-04 13:00:31+01	33650433	Wohnungsboerse
870	2023-12-04 13:00:32+01	33650432	Wohnungsboerse
900	2023-12-04 13:00:33+01	33652634	Wohnungsboerse
1620	2023-12-04 13:00:36+01	33539937	Wohnungsboerse
1015	2023-12-04 13:00:38+01	33663508	Wohnungsboerse
3690	2023-12-04 13:00:40+01	33601618	Wohnungsboerse
2480	2023-12-04 13:00:42+01	33654905	Wohnungsboerse
660	2023-12-04 13:00:44+01	33660075	Wohnungsboerse
1290	2023-12-04 13:00:46+01	33440756	Wohnungsboerse
1625	2023-12-04 13:00:48+01	32233451	Wohnungsboerse
1100	2023-12-04 13:00:50+01	33638259	Wohnungsboerse
3650	2023-12-04 13:00:52+01	33638532	Wohnungsboerse
700	2023-12-04 13:00:55+01	33621886	Wohnungsboerse
490	2023-12-04 13:01:06+01	33645989	Wohnungsboerse
330	2023-12-04 13:01:08+01	33649170	Wohnungsboerse
385	2023-12-04 13:01:09+01	32791864	Wohnungsboerse
1000	2023-12-04 13:01:09+01	33652420	Wohnungsboerse
1200	2023-12-04 13:01:10+01	33656776	Wohnungsboerse
795	2023-12-04 13:01:10+01	33659335	Wohnungsboerse
500	2023-12-04 13:01:12+01	33660191	Wohnungsboerse
865	2023-12-04 13:01:15+01	33662230	Wohnungsboerse
1471.6	2023-12-04 13:01:16+01	33264606	Wohnungsboerse
995	2023-12-04 13:01:18+01	33667644	Wohnungsboerse
1620	2023-12-04 13:01:20+01	33565781	Wohnungsboerse
1270	2023-12-04 13:01:23+01	33519879	Wohnungsboerse
850	2023-12-04 13:01:25+01	33203773	Wohnungsboerse
614	2023-12-04 13:01:27+01	33051217	Wohnungsboerse
459.38	2023-12-04 13:01:38+01	33636857	Wohnungsboerse
996	2023-12-04 13:01:40+01	33594288	Wohnungsboerse
800	2023-12-04 13:01:42+01	33604204	Wohnungsboerse
1254	2023-12-04 13:01:45+01	33352052	Wohnungsboerse
520.59	2023-12-04 13:01:57+01	32904875	Wohnungsboerse
700	2023-12-04 13:01:57+01	33317345	Wohnungsboerse
940.3	2023-12-04 13:01:57+01	33625573	Wohnungsboerse
710	2023-12-04 13:01:58+01	33634504	Wohnungsboerse
509.58	2023-12-04 13:01:59+01	33641929	Wohnungsboerse
733	2023-12-04 13:02:00+01	32189849	Wohnungsboerse
575	2023-12-04 13:02:03+01	33645830	Wohnungsboerse
2300	2023-12-04 13:02:04+01	33649941	Wohnungsboerse
1594.05	2023-12-04 13:02:06+01	33627528	Wohnungsboerse
500	2023-12-04 13:02:08+01	33664893	Wohnungsboerse
1491	2023-12-04 13:02:11+01	33667466	Wohnungsboerse
3000	2023-12-04 13:02:14+01	33646238	Wohnungsboerse
1700	2023-12-04 13:02:17+01	33610669	Wohnungsboerse
535	2023-12-04 13:02:19+01	33648674	Wohnungsboerse
880	2023-12-04 13:02:21+01	33650174	Wohnungsboerse
970	2023-12-04 13:02:24+01	33652709	Wohnungsboerse
2100	2023-12-04 13:02:27+01	33652720	Wohnungsboerse
1950	2023-12-04 13:02:30+01	33653063	Wohnungsboerse
680	2023-12-04 13:02:32+01	33654609	Wohnungsboerse
500	2023-12-04 13:02:35+01	33659298	Wohnungsboerse
1089	2023-12-04 13:02:37+01	33562972	Wohnungsboerse
995	2023-12-04 13:02:40+01	33663806	Wohnungsboerse
724.07	2023-12-04 13:02:43+01	33608544	Wohnungsboerse
2300	2023-12-04 13:02:45+01	33663876	Wohnungsboerse
1250	2023-12-04 13:02:48+01	33581953	Wohnungsboerse
1600	2023-12-04 13:02:50+01	33608779	Wohnungsboerse
1728	2023-12-04 13:02:53+01	33612568	Wohnungsboerse
943	2023-12-04 13:02:56+01	31737888	Wohnungsboerse
1600	2023-12-04 13:02:58+01	33623508	Wohnungsboerse
1630	2023-12-04 13:02:59+01	33626426	Wohnungsboerse
1450	2023-12-04 13:03:02+01	33633146	Wohnungsboerse
975	2023-12-04 13:03:04+01	33614971	Wohnungsboerse
2980	2023-12-04 13:03:07+01	33638100	Wohnungsboerse
1550	2023-12-04 13:03:10+01	33646080	Wohnungsboerse
2225	2023-12-04 13:03:12+01	33650258	Wohnungsboerse
750	2023-12-04 13:03:13+01	33497987	Wohnungsboerse
995	2023-12-04 13:03:16+01	33662996	Wohnungsboerse
940	2023-12-04 13:03:18+01	33663482	Wohnungsboerse
1700	2023-12-04 13:03:21+01	33667387	Wohnungsboerse
500	2023-12-04 13:03:23+01	33652955	Wohnungsboerse
650	2023-12-04 13:03:25+01	33650044	Wohnungsboerse
750	2023-12-04 13:03:28+01	33654555	Wohnungsboerse
1200	2023-12-04 13:03:31+01	33581970	Wohnungsboerse
1400	2023-12-04 13:03:33+01	33658014	Wohnungsboerse
534	2023-12-04 13:03:36+01	33659133	Wohnungsboerse
695	2023-12-04 13:03:38+01	33659417	Wohnungsboerse
400	2023-12-04 13:03:39+01	33660112	Wohnungsboerse
1100	2023-12-04 13:03:42+01	33323575	Wohnungsboerse
885	2023-12-04 13:03:44+01	33662142	Wohnungsboerse
400	2023-12-04 13:03:47+01	33662797	Wohnungsboerse
650	2023-12-04 13:03:49+01	33664691	Wohnungsboerse
430	2023-12-04 13:04:00+01	33664869	Wohnungsboerse
430	2023-12-04 13:04:01+01	33667784	Wohnungsboerse
770	2023-12-04 13:04:08+01	33642277	Wohnungsboerse
2920	2023-12-07 12:19:53+01	33022819	Wohnungsboerse
1790	2023-12-07 12:19:55+01	32728990	Wohnungsboerse
1081	2023-12-07 12:19:58+01	33432833	Wohnungsboerse
535	2023-12-07 12:20:00+01	33674043	Wohnungsboerse
800	2023-12-07 12:20:03+01	31766932	Wohnungsboerse
670	2023-12-07 12:20:04+01	33646136	Wohnungsboerse
844.5	2023-12-07 12:20:06+01	33445534	Wohnungsboerse
840	2023-12-07 12:20:08+01	33623483	Wohnungsboerse
550	2023-12-07 12:20:11+01	33645759	Wohnungsboerse
646	2023-12-07 12:20:14+01	33321684	Wohnungsboerse
520	2023-12-07 12:20:16+01	32995444	Wohnungsboerse
1150	2023-12-07 12:20:19+01	33667671	Wohnungsboerse
830	2023-12-07 12:20:21+01	32976985	Wohnungsboerse
940	2023-12-07 12:20:24+01	33504339	Wohnungsboerse
1990	2023-12-07 12:20:26+01	33437192	Wohnungsboerse
820	2023-12-07 12:20:29+01	33318532	Wohnungsboerse
1891	2023-12-07 12:20:31+01	32697715	Wohnungsboerse
985	2023-12-07 12:20:34+01	32642467	Wohnungsboerse
1840	2023-12-07 12:20:37+01	32642458	Wohnungsboerse
1705	2023-12-07 12:20:40+01	33050991	Wohnungsboerse
2590	2023-12-07 12:20:42+01	33354570	Wohnungsboerse
2225	2023-12-07 12:20:45+01	32804194	Wohnungsboerse
943	2023-12-07 12:20:47+01	33391895	Wohnungsboerse
965	2023-12-07 12:20:50+01	33489268	Wohnungsboerse
2031	2023-12-07 12:20:53+01	33539691	Wohnungsboerse
2550	2023-12-07 12:20:55+01	33606387	Wohnungsboerse
1450	2023-12-07 12:20:57+01	33347440	Wohnungsboerse
2950	2023-12-07 12:20:59+01	32489228	Wohnungsboerse
1550	2023-12-07 12:21:01+01	32848279	Wohnungsboerse
1400	2023-12-07 12:21:04+01	33435206	Wohnungsboerse
1450	2023-12-07 12:21:06+01	33506206	Wohnungsboerse
1400	2023-12-07 12:21:09+01	33565901	Wohnungsboerse
1400	2023-12-07 12:21:10+01	33578811	Wohnungsboerse
1470	2023-12-07 12:21:13+01	33582266	Wohnungsboerse
590	2023-12-07 12:21:16+01	33615243	Wohnungsboerse
1430	2023-12-07 12:21:18+01	33654824	Wohnungsboerse
900	2023-12-07 12:21:20+01	33675928	Wohnungsboerse
698	2023-12-07 12:21:23+01	33677495	Wohnungsboerse
870	2023-12-07 12:21:26+01	33662965	Wohnungsboerse
1400	2023-12-07 12:21:27+01	33686129	Wohnungsboerse
2000	2023-12-07 12:21:30+01	33623338	Wohnungsboerse
730	2023-12-07 12:21:33+01	33625597	Wohnungsboerse
5300	2023-12-07 12:21:35+01	33627177	Wohnungsboerse
5400	2023-12-07 12:21:37+01	33631016	Wohnungsboerse
6850	2023-12-07 12:21:38+01	31193233	Wohnungsboerse
1050	2023-12-07 12:21:41+01	33646532	Wohnungsboerse
1121	2023-12-07 12:21:44+01	33662825	Wohnungsboerse
1300	2023-12-07 12:21:45+01	33438704	Wohnungsboerse
880	2023-12-07 12:21:46+01	33378242	Wohnungsboerse
1200	2023-12-07 12:21:49+01	33622999	Wohnungsboerse
5200	2023-12-07 12:21:53+01	33679123	Wohnungsboerse
666.55	2023-12-07 12:21:54+01	33667881	Wohnungsboerse
2400	2023-12-07 12:21:55+01	32853310	Wohnungsboerse
1050	2023-12-07 12:21:57+01	33689000	Wohnungsboerse
871.94	2023-12-07 12:22:00+01	33059673	Wohnungsboerse
880	2023-12-07 12:22:02+01	33645816	Wohnungsboerse
790	2023-12-07 12:22:05+01	33649987	Wohnungsboerse
750	2023-12-07 12:22:08+01	33662864	Wohnungsboerse
920	2023-12-07 12:22:10+01	33223803	Wohnungsboerse
833.6	2023-12-07 12:22:13+01	33669962	Wohnungsboerse
780	2023-12-07 12:22:15+01	33623692	Wohnungsboerse
1130	2023-12-07 12:22:18+01	33674298	Wohnungsboerse
620.91	2023-12-07 12:22:20+01	33555215	Wohnungsboerse
600	2023-12-07 12:22:22+01	33580297	Wohnungsboerse
1440	2023-12-07 12:22:25+01	33685125	Wohnungsboerse
1155.6	2023-12-07 12:22:28+01	33686288	Wohnungsboerse
640	2023-12-07 12:22:30+01	33686910	Wohnungsboerse
675	2023-12-07 12:22:31+01	33689640	Wohnungsboerse
650	2023-12-07 12:22:33+01	33284573	Wohnungsboerse
850	2023-12-07 12:22:36+01	33067537	Wohnungsboerse
665	2023-12-07 12:22:39+01	33464631	Wohnungsboerse
740	2023-12-07 12:22:42+01	33487539	Wohnungsboerse
580	2023-12-07 12:22:44+01	33548846	Wohnungsboerse
800	2023-12-07 12:22:45+01	33509761	Wohnungsboerse
579	2023-12-07 12:22:48+01	33621435	Wohnungsboerse
555	2023-12-07 12:22:51+01	33650581	Wohnungsboerse
850	2023-12-07 12:22:53+01	33663487	Wohnungsboerse
750	2023-12-07 12:22:56+01	33681682	Wohnungsboerse
800	2023-12-07 12:22:58+01	33686572	Wohnungsboerse
1200	2023-12-07 12:23:01+01	32946100	Wohnungsboerse
505	2023-12-07 12:23:04+01	33600681	Wohnungsboerse
780	2023-12-07 12:23:06+01	33623527	Wohnungsboerse
799.81	2023-12-07 12:23:09+01	33672027	Wohnungsboerse
630	2023-12-07 12:23:10+01	33674160	Wohnungsboerse
630	2023-12-07 12:23:13+01	33674436	Wohnungsboerse
630	2023-12-07 12:23:16+01	33674547	Wohnungsboerse
590	2023-12-07 12:23:18+01	33674546	Wohnungsboerse
799	2023-12-07 12:23:20+01	33679465	Wohnungsboerse
770	2023-12-07 12:23:23+01	33681462	Wohnungsboerse
730	2023-12-07 12:23:24+01	33686454	Wohnungsboerse
1400	2023-12-07 12:23:27+01	33688470	Wohnungsboerse
790	2023-12-07 12:23:30+01	33689639	Wohnungsboerse
810	2023-12-07 12:23:33+01	33689786	Wohnungsboerse
720	2023-12-07 12:23:35+01	32630083	Wohnungsboerse
1094.17	2023-12-07 12:23:37+01	33522726	Wohnungsboerse
874.24	2023-12-07 12:23:40+01	33522714	Wohnungsboerse
941.83	2023-12-07 12:23:43+01	33522747	Wohnungsboerse
700	2023-12-07 12:23:45+01	33579780	Wohnungsboerse
1315	2023-12-07 12:23:48+01	33583884	Wohnungsboerse
600	2023-12-07 12:23:51+01	33652875	Wohnungsboerse
570	2023-12-07 12:23:54+01	33662910	Wohnungsboerse
1390	2023-12-07 12:23:56+01	33373146	Wohnungsboerse
500	2023-12-07 12:23:58+01	33674214	Wohnungsboerse
640	2023-12-07 12:24:00+01	33386081	Wohnungsboerse
830	2023-12-07 12:24:02+01	33679748	Wohnungsboerse
630	2023-12-07 12:24:04+01	33688507	Wohnungsboerse
950	2023-12-07 12:24:07+01	33664586	Wohnungsboerse
2360	2023-12-07 12:24:10+01	33298293	Wohnungsboerse
1080	2023-12-07 12:24:12+01	33674195	Wohnungsboerse
493.5	2023-12-07 12:24:14+01	33674308	Wohnungsboerse
474.3	2023-12-07 12:24:17+01	33674341	Wohnungsboerse
529	2023-12-07 12:24:20+01	33681355	Wohnungsboerse
1000	2023-12-07 12:24:22+01	33682992	Wohnungsboerse
1220	2023-12-07 12:24:25+01	33563103	Wohnungsboerse
760	2023-12-07 12:24:27+01	33686379	Wohnungsboerse
700	2023-12-07 12:24:29+01	33686403	Wohnungsboerse
750	2023-12-07 12:24:32+01	33550667	Wohnungsboerse
600	2023-12-07 12:24:33+01	33688451	Wohnungsboerse
500	2023-12-07 12:24:35+01	33688664	Wohnungsboerse
590	2023-12-07 12:24:37+01	33688762	Wohnungsboerse
430	2023-12-07 12:24:40+01	33654675	Wohnungsboerse
700	2023-12-07 12:24:41+01	33477583	Wohnungsboerse
1300	2023-12-07 12:24:44+01	31823448	Wohnungsboerse
650	2023-12-07 12:24:47+01	33634877	Wohnungsboerse
660	2023-12-07 12:24:50+01	33644575	Wohnungsboerse
870	2023-12-07 12:24:53+01	33646100	Wohnungsboerse
790	2023-12-07 12:24:55+01	33652853	Wohnungsboerse
590	2023-12-07 12:24:57+01	33495917	Wohnungsboerse
1000	2023-12-07 12:24:59+01	33659164	Wohnungsboerse
440	2023-12-07 12:25:02+01	33674551	Wohnungsboerse
620	2023-12-07 12:25:05+01	33675927	Wohnungsboerse
599	2023-12-07 12:25:08+01	33677866	Wohnungsboerse
1400	2023-12-07 12:25:10+01	33433016	Wohnungsboerse
595	2023-12-07 12:25:13+01	33671854	Wohnungsboerse
573	2023-12-07 12:25:14+01	33675677	Wohnungsboerse
741	2023-12-07 12:25:16+01	33686561	Wohnungsboerse
850	2023-12-07 12:25:17+01	33688577	Wohnungsboerse
737	2023-12-07 12:25:20+01	33329109	Wohnungsboerse
782	2023-12-07 12:25:22+01	33341849	Wohnungsboerse
550	2023-12-07 12:25:24+01	33674109	Wohnungsboerse
1400	2023-12-07 12:25:26+01	33681288	Wohnungsboerse
700	2023-12-07 12:25:29+01	33681307	Wohnungsboerse
460	2023-12-07 12:25:31+01	33681721	Wohnungsboerse
1050	2023-12-07 12:25:34+01	33682700	Wohnungsboerse
900	2023-12-07 12:25:36+01	33684864	Wohnungsboerse
1750	2023-12-07 12:25:39+01	33685094	Wohnungsboerse
550	2023-12-07 12:25:42+01	33686105	Wohnungsboerse
695	2023-12-07 12:25:43+01	33686157	Wohnungsboerse
1290	2023-12-07 12:25:45+01	33654631	Wohnungsboerse
600	2023-12-07 12:25:48+01	33686889	Wohnungsboerse
845	2023-12-07 12:25:50+01	33633478	Wohnungsboerse
500	2023-12-07 12:25:53+01	33648973	Wohnungsboerse
390	2023-12-07 12:25:56+01	33652464	Wohnungsboerse
1100	2023-12-07 12:25:58+01	33658058	Wohnungsboerse
691.15	2023-12-07 12:26:00+01	33653031	Wohnungsboerse
600	2023-12-07 12:26:02+01	33662860	Wohnungsboerse
529	2023-12-07 12:26:04+01	33667495	Wohnungsboerse
750	2023-12-07 12:26:06+01	33579012	Wohnungsboerse
580	2023-12-07 12:26:09+01	33672217	Wohnungsboerse
1050	2023-12-07 12:26:11+01	33674189	Wohnungsboerse
1950	2023-12-07 12:26:14+01	33675535	Wohnungsboerse
588	2023-12-07 12:26:16+01	33685085	Wohnungsboerse
735	2023-12-07 12:26:19+01	33688516	Wohnungsboerse
1090	2023-12-07 12:26:21+01	33688511	Wohnungsboerse
758	2023-12-07 12:26:24+01	33689861	Wohnungsboerse
3250	2023-12-07 12:26:26+01	33114294	Wohnungsboerse
1950	2023-12-07 12:26:29+01	33308983	Wohnungsboerse
1950	2023-12-07 12:26:30+01	33320934	Wohnungsboerse
1640	2023-12-07 12:26:32+01	32877350	Wohnungsboerse
1360	2023-12-07 12:26:35+01	33648905	Wohnungsboerse
650	2023-12-07 12:26:38+01	33675892	Wohnungsboerse
505	2023-12-07 12:26:40+01	33480003	Wohnungsboerse
1950	2023-12-07 12:26:42+01	33683184	Wohnungsboerse
660	2023-12-07 12:26:44+01	33567160	Wohnungsboerse
1500	2023-12-07 12:26:47+01	33675573	Wohnungsboerse
660	2023-12-07 12:26:49+01	33675591	Wohnungsboerse
1100	2023-12-07 12:26:52+01	33671598	Wohnungsboerse
1550	2023-12-07 12:26:54+01	33489083	Wohnungsboerse
448.7	2023-12-07 12:26:57+01	33681549	Wohnungsboerse
570	2023-12-07 12:27:00+01	33681638	Wohnungsboerse
720	2023-12-07 12:27:01+01	33683007	Wohnungsboerse
500	2023-12-07 12:27:04+01	33684622	Wohnungsboerse
1750	2023-12-07 12:27:06+01	33686270	Wohnungsboerse
810	2023-12-07 12:27:08+01	33686673	Wohnungsboerse
1000	2023-12-07 12:27:11+01	33688724	Wohnungsboerse
860	2023-12-07 12:27:14+01	33688817	Wohnungsboerse
1050	2023-12-07 12:27:17+01	33689973	Wohnungsboerse
900	2023-12-07 12:27:19+01	33225904	Wohnungsboerse
950	2023-12-07 12:27:22+01	33298728	Wohnungsboerse
800	2023-12-07 12:27:24+01	33086103	Wohnungsboerse
955.79	2023-12-07 12:27:25+01	33594334	Wohnungsboerse
974.95	2023-12-07 12:27:27+01	33600514	Wohnungsboerse
550	2023-12-07 12:27:29+01	33638048	Wohnungsboerse
810	2023-12-07 12:27:32+01	33254648	Wohnungsboerse
585	2023-12-07 12:27:35+01	33642075	Wohnungsboerse
600	2023-12-07 12:27:37+01	33653012	Wohnungsboerse
450	2023-12-07 12:27:40+01	33660225	Wohnungsboerse
985	2023-12-07 12:27:43+01	33670075	Wohnungsboerse
1150	2023-12-07 12:27:45+01	33576669	Wohnungsboerse
634.52	2023-12-07 12:27:47+01	33681580	Wohnungsboerse
2250	2023-12-07 12:27:50+01	33689702	Wohnungsboerse
930	2023-12-07 12:27:52+01	33147363	Wohnungsboerse
1760	2023-12-07 12:27:55+01	33524121	Wohnungsboerse
2150	2023-12-07 12:27:57+01	33640807	Wohnungsboerse
1890	2023-12-07 12:28:00+01	32728992	Wohnungsboerse
1890	2023-12-07 12:28:02+01	32728991	Wohnungsboerse
1550	2023-12-07 12:28:04+01	32853522	Wohnungsboerse
487	2023-12-07 12:28:06+01	33667751	Wohnungsboerse
920	2023-12-07 12:28:08+01	33600402	Wohnungsboerse
1050	2023-12-07 12:28:10+01	33679734	Wohnungsboerse
920	2023-12-07 12:28:13+01	33690170	Wohnungsboerse
8500	2023-12-07 12:28:16+01	33196281	Wohnungsboerse
1800	2023-12-07 12:28:19+01	32817541	Wohnungsboerse
1379.88	2023-12-07 12:28:22+01	33445819	Wohnungsboerse
1684.63	2023-12-07 12:28:24+01	33445857	Wohnungsboerse
2200	2023-12-07 12:28:27+01	33422321	Wohnungsboerse
2950	2023-12-07 12:28:29+01	33455178	Wohnungsboerse
700	2023-12-07 12:28:31+01	33501793	Wohnungsboerse
2770	2023-12-07 12:28:34+01	33347939	Wohnungsboerse
1850	2023-12-07 12:28:37+01	33196527	Wohnungsboerse
797.84	2023-12-07 12:28:39+01	33649071	Wohnungsboerse
534	2023-12-07 12:28:42+01	33656846	Wohnungsboerse
650	2023-12-07 12:28:44+01	33659343	Wohnungsboerse
2480	2023-12-07 12:28:46+01	31210714	Wohnungsboerse
4750	2023-12-07 12:28:49+01	33688877	Wohnungsboerse
700	2023-12-07 12:29:32+01	33535395	Wohnungsboerse
760	2023-12-07 12:29:34+01	33623746	Wohnungsboerse
896	2023-12-07 12:29:36+01	33196294	Wohnungsboerse
750.95	2023-12-07 12:29:38+01	33596800	Wohnungsboerse
750	2023-12-07 12:29:41+01	33644208	Wohnungsboerse
920	2023-12-07 12:29:44+01	32918930	Wohnungsboerse
1900	2023-12-07 12:29:46+01	31394882	Wohnungsboerse
1500	2023-12-07 12:29:49+01	33681303	Wohnungsboerse
2700	2023-12-07 12:29:52+01	33449689	Wohnungsboerse
1190	2023-12-07 12:29:54+01	33601786	Wohnungsboerse
839.16	2023-12-07 12:29:55+01	33402808	Wohnungsboerse
695	2023-12-07 12:29:58+01	33473469	Wohnungsboerse
850	2023-12-07 12:30:01+01	33644192	Wohnungsboerse
1100	2023-12-07 12:30:03+01	31675590	Wohnungsboerse
1340	2023-12-07 12:30:05+01	33462779	Wohnungsboerse
920	2023-12-07 12:30:07+01	29314952	Wohnungsboerse
3300	2023-12-07 12:30:10+01	33598493	Wohnungsboerse
1830	2023-12-07 12:30:13+01	33568443	Wohnungsboerse
1550	2023-12-07 12:30:15+01	33438599	Wohnungsboerse
1800	2023-12-07 12:30:18+01	33675316	Wohnungsboerse
1450	2023-12-07 12:30:20+01	33608727	Wohnungsboerse
1200	2023-12-07 12:30:23+01	29631528	Wohnungsboerse
1890	2023-12-07 12:30:26+01	32976977	Wohnungsboerse
730	2023-12-07 12:30:29+01	33495322	Wohnungsboerse
1785	2023-12-07 12:30:30+01	33245396	Wohnungsboerse
955	2023-12-07 12:30:33+01	33572182	Wohnungsboerse
750	2023-12-07 12:30:36+01	33654450	Wohnungsboerse
1000	2023-12-07 12:30:38+01	33664741	Wohnungsboerse
2000	2023-12-07 12:30:40+01	33668010	Wohnungsboerse
650	2023-12-07 12:30:42+01	29317989	Wohnungsboerse
620	2023-12-07 12:30:44+01	33664503	Wohnungsboerse
1100	2023-12-07 12:30:47+01	33506341	Wohnungsboerse
577.92	2023-12-07 12:30:49+01	33682967	Wohnungsboerse
980	2023-12-07 12:30:51+01	33684724	Wohnungsboerse
1590	2023-12-07 12:30:53+01	33686399	Wohnungsboerse
1495	2023-12-07 12:30:55+01	33540487	Wohnungsboerse
1795	2023-12-07 12:30:57+01	33540488	Wohnungsboerse
1168.83	2023-12-07 12:30:59+01	33384509	Wohnungsboerse
684	2023-12-07 12:31:02+01	27035171	Wohnungsboerse
1348	2023-12-07 12:31:05+01	33425850	Wohnungsboerse
1064	2023-12-07 12:31:07+01	32820355	Wohnungsboerse
1066	2023-12-07 12:31:10+01	33449817	Wohnungsboerse
1262.17	2023-12-07 12:31:12+01	33450063	Wohnungsboerse
1300	2023-12-07 12:31:15+01	33455197	Wohnungsboerse
1215	2023-12-07 12:31:17+01	33611348	Wohnungsboerse
1272.31	2023-12-07 12:31:20+01	33630924	Wohnungsboerse
1158.43	2023-12-07 12:31:22+01	33650288	Wohnungsboerse
1534	2023-12-07 12:31:25+01	33646337	Wohnungsboerse
1375	2023-12-07 12:31:27+01	33654290	Wohnungsboerse
1205	2023-12-07 12:31:29+01	27088008	Wohnungsboerse
780	2023-12-07 12:31:32+01	33681987	Wohnungsboerse
655	2023-12-07 12:31:35+01	33674129	Wohnungsboerse
999	2023-12-07 12:31:37+01	33579841	Wohnungsboerse
1450	2023-12-07 12:31:40+01	33630752	Wohnungsboerse
1150	2023-12-07 12:31:43+01	33663485	Wohnungsboerse
762	2023-12-07 12:31:45+01	33675809	Wohnungsboerse
580	2023-12-07 12:31:48+01	33686333	Wohnungsboerse
828.2	2023-12-07 12:31:49+01	33396009	Wohnungsboerse
920	2023-12-07 12:31:52+01	33627326	Wohnungsboerse
720	2023-12-07 12:31:55+01	33487464	Wohnungsboerse
1850	2023-12-07 12:31:58+01	33129082	Wohnungsboerse
1450	2023-12-07 12:31:59+01	33454997	Wohnungsboerse
1150	2023-12-07 12:32:02+01	33579993	Wohnungsboerse
1999	2023-12-07 12:32:04+01	33616666	Wohnungsboerse
1290	2023-12-07 12:32:07+01	33629353	Wohnungsboerse
1450	2023-12-07 12:32:09+01	32375748	Wohnungsboerse
1200	2023-12-07 12:32:11+01	33636840	Wohnungsboerse
790	2023-12-07 12:32:14+01	33650392	Wohnungsboerse
790	2023-12-07 12:32:15+01	33675890	Wohnungsboerse
1440	2023-12-07 12:32:17+01	33678984	Wohnungsboerse
280	2023-12-07 12:32:19+01	33690188	Wohnungsboerse
485	2023-12-07 12:32:21+01	33455421	Wohnungsboerse
360	2023-12-07 12:32:22+01	33690189	Wohnungsboerse
410	2023-12-07 12:32:25+01	33323933	Wohnungsboerse
950	2023-12-07 12:32:27+01	33690199	Wohnungsboerse
880	2023-12-07 12:32:29+01	33690202	Wohnungsboerse
525	2023-12-07 12:32:32+01	33690211	Wohnungsboerse
1500	2023-12-07 12:32:35+01	33690212	Wohnungsboerse
1180	2023-12-07 12:32:37+01	33690218	Wohnungsboerse
950	2023-12-07 12:32:40+01	33690220	Wohnungsboerse
470	2023-12-07 12:32:43+01	33690227	Wohnungsboerse
726	2023-12-07 12:32:46+01	33690229	Wohnungsboerse
765	2023-12-07 12:32:48+01	33544205	Wohnungsboerse
610.44	2023-12-07 12:32:51+01	33400003	Wohnungsboerse
830	2023-12-07 12:32:54+01	33354625	Wohnungsboerse
750	2023-12-07 12:32:57+01	33621429	Wohnungsboerse
900	2023-12-07 12:32:59+01	33627163	Wohnungsboerse
623	2023-12-07 12:33:02+01	33554994	Wohnungsboerse
480	2023-12-07 12:33:04+01	33650359	Wohnungsboerse
526.83	2023-12-07 12:33:09+01	33560204	Wohnungsboerse
750	2023-12-07 12:33:10+01	33657206	Wohnungsboerse
560	2023-12-07 12:33:13+01	33658003	Wohnungsboerse
665	2023-12-07 12:33:15+01	33672283	Wohnungsboerse
620	2023-12-07 12:33:17+01	33675627	Wohnungsboerse
480	2023-12-07 12:33:19+01	33679034	Wohnungsboerse
637	2023-12-07 12:33:22+01	33682976	Wohnungsboerse
1050	2023-12-07 12:33:24+01	33686441	Wohnungsboerse
1000	2023-12-07 12:33:26+01	33648724	Wohnungsboerse
959	2023-12-07 12:33:29+01	32816215	Wohnungsboerse
872.49	2023-12-07 12:33:32+01	33598517	Wohnungsboerse
645	2023-12-07 12:33:38+01	33604328	Wohnungsboerse
1773.39	2023-12-07 12:33:39+01	33598511	Wohnungsboerse
1250	2023-12-07 12:33:41+01	33621867	Wohnungsboerse
1550	2023-12-07 12:33:43+01	33623433	Wohnungsboerse
850	2023-12-07 12:33:47+01	33604309	Wohnungsboerse
575	2023-12-07 12:33:48+01	33667732	Wohnungsboerse
650	2023-12-07 12:33:51+01	33672119	Wohnungsboerse
490	2023-12-07 12:33:53+01	33645974	Wohnungsboerse
976	2023-12-07 12:33:56+01	33675587	Wohnungsboerse
750	2023-12-07 12:33:58+01	33677282	Wohnungsboerse
720	2023-12-07 12:34:01+01	33584182	Wohnungsboerse
1100.59	2023-12-07 12:34:03+01	33598459	Wohnungsboerse
829	2023-12-07 12:34:06+01	33487610	Wohnungsboerse
695	2023-12-07 12:34:08+01	33638071	Wohnungsboerse
1137.36	2023-12-07 12:34:11+01	33435007	Wohnungsboerse
510.19	2023-12-07 12:34:12+01	33648739	Wohnungsboerse
600	2023-12-07 12:34:15+01	33614961	Wohnungsboerse
900	2023-12-07 12:34:17+01	33654518	Wohnungsboerse
869	2023-12-07 12:34:19+01	33344003	Wohnungsboerse
636	2023-12-07 12:34:21+01	33681363	Wohnungsboerse
636	2023-12-07 12:34:22+01	33681362	Wohnungsboerse
469	2023-12-07 12:51:47+01	33689953	Wohnungsboerse
1026	2023-12-07 12:51:47+01	33689955	Wohnungsboerse
827	2023-12-07 12:51:48+01	33689957	Wohnungsboerse
2000	2023-12-07 12:51:49+01	33640373	Wohnungsboerse
740	2023-12-07 12:51:51+01	33670303	Wohnungsboerse
441.44	2023-12-07 12:52:17+01	33674342	Wohnungsboerse
570	2023-12-07 12:52:19+01	33686150	Wohnungsboerse
400	2023-12-07 12:52:59+01	33660112	Wohnungsboerse
995	2023-12-07 12:53:02+01	33662996	Wohnungsboerse
1200	2023-12-07 12:53:05+01	33649052	Wohnungsboerse
750	2023-12-07 12:53:07+01	33583866	Wohnungsboerse
1620	2023-12-07 12:53:10+01	33565781	Wohnungsboerse
1471.6	2023-12-07 12:53:12+01	33264606	Wohnungsboerse
810.81	2023-12-07 12:53:15+01	33002621	Wohnungsboerse
1728	2023-12-07 12:53:18+01	33616369	Wohnungsboerse
595	2023-12-07 12:53:21+01	33667933	Wohnungsboerse
435	2023-12-07 12:53:23+01	33670053	Wohnungsboerse
510	2023-12-07 12:53:26+01	33323829	Wohnungsboerse
810	2023-12-07 12:53:28+01	33600360	Wohnungsboerse
2560	2023-12-07 12:53:31+01	33493623	Wohnungsboerse
590	2023-12-07 12:53:33+01	26640415	Wohnungsboerse
1750	2023-12-07 12:53:36+01	33571784	Wohnungsboerse
800	2023-12-07 12:53:38+01	32111553	Wohnungsboerse
465.65	2023-12-07 12:53:40+01	33254653	Wohnungsboerse
640	2023-12-07 12:53:43+01	33299372	Wohnungsboerse
2925	2023-12-07 12:53:44+01	33259857	Wohnungsboerse
947.16	2023-12-07 12:53:47+01	33304400	Wohnungsboerse
1000	2023-12-07 12:53:50+01	33574808	Wohnungsboerse
1590	2023-12-07 12:53:52+01	33329023	Wohnungsboerse
752.77	2023-12-07 12:53:55+01	33432779	Wohnungsboerse
740	2023-12-07 12:53:58+01	33298889	Wohnungsboerse
586.4	2023-12-07 12:54:00+01	33638530	Wohnungsboerse
735	2023-12-07 12:54:03+01	33650244	Wohnungsboerse
1800	2023-12-07 12:54:06+01	33593060	Wohnungsboerse
2900	2023-12-07 12:54:09+01	33593062	Wohnungsboerse
1350	2023-12-07 12:54:11+01	33654580	Wohnungsboerse
2900	2023-12-07 12:54:13+01	33652461	Wohnungsboerse
425	2023-12-07 12:54:17+01	33598616	Wohnungsboerse
745	2023-12-07 12:54:18+01	33616395	Wohnungsboerse
650	2023-12-07 12:54:20+01	33616682	Wohnungsboerse
530	2023-12-07 12:54:23+01	33627010	Wohnungsboerse
550	2023-12-07 12:54:25+01	33633812	Wohnungsboerse
710	2023-12-07 12:54:26+01	33347397	Wohnungsboerse
900	2023-12-07 12:54:29+01	33667467	Wohnungsboerse
520	2023-12-07 12:54:31+01	33667601	Wohnungsboerse
810.81	2023-12-07 12:54:33+01	33600603	Wohnungsboerse
1650	2023-12-07 12:54:36+01	33677783	Wohnungsboerse
1100	2023-12-07 12:54:38+01	33646277	Wohnungsboerse
690	2023-12-07 12:54:40+01	33682555	Wohnungsboerse
1050	2023-12-07 12:54:43+01	33688535	Wohnungsboerse
1540	2023-12-07 12:54:45+01	32803920	Wohnungsboerse
4200	2023-12-07 12:54:47+01	33648553	Wohnungsboerse
730	2023-12-07 12:54:50+01	33658070	Wohnungsboerse
420	2023-12-07 12:54:53+01	33658059	Wohnungsboerse
590	2023-12-07 12:54:54+01	26800673	Wohnungsboerse
810	2023-12-07 12:54:57+01	33198024	Wohnungsboerse
950	2023-12-07 12:55:00+01	33333966	Wohnungsboerse
890	2023-12-07 12:55:01+01	33103145	Wohnungsboerse
700	2023-12-07 12:55:04+01	33568372	Wohnungsboerse
970	2023-12-07 12:55:06+01	33609058	Wohnungsboerse
990	2023-12-07 12:55:07+01	33613231	Wohnungsboerse
540	2023-12-07 12:55:09+01	33616482	Wohnungsboerse
810	2023-12-07 12:55:12+01	33203387	Wohnungsboerse
915	2023-12-07 12:55:14+01	33667986	Wohnungsboerse
670	2023-12-07 12:55:17+01	33671931	Wohnungsboerse
950	2023-12-07 12:55:20+01	33636749	Wohnungsboerse
990	2023-12-07 12:55:22+01	33627670	Wohnungsboerse
1568.43	2023-12-07 12:55:24+01	33402892	Wohnungsboerse
630	2023-12-07 12:55:26+01	33656730	Wohnungsboerse
640	2023-12-07 12:55:28+01	33615107	Wohnungsboerse
1600	2023-12-07 12:55:31+01	33670213	Wohnungsboerse
1350	2023-12-07 12:55:33+01	33674429	Wohnungsboerse
677.75	2023-12-07 12:55:36+01	33594001	Wohnungsboerse
759.66	2023-12-07 12:55:39+01	33500282	Wohnungsboerse
1125	2023-12-07 12:55:42+01	33619066	Wohnungsboerse
640	2023-12-07 12:55:44+01	33480104	Wohnungsboerse
1994	2023-12-07 12:55:46+01	33654597	Wohnungsboerse
919.02	2023-12-07 12:55:48+01	33656971	Wohnungsboerse
750.61	2023-12-07 12:55:51+01	33656962	Wohnungsboerse
845	2023-12-07 12:55:53+01	33657988	Wohnungsboerse
995	2023-12-07 12:55:56+01	33619052	Wohnungsboerse
1500	2023-12-07 12:55:58+01	33672080	Wohnungsboerse
1199	2023-12-07 12:56:00+01	33439092	Wohnungsboerse
1350	2023-12-07 12:56:02+01	32885147	Wohnungsboerse
700	2023-12-07 12:56:05+01	33686597	Wohnungsboerse
450	2023-12-07 12:56:07+01	33689988	Wohnungsboerse
500	2023-12-07 12:56:09+01	33671724	Wohnungsboerse
600	2023-12-07 12:56:12+01	33672236	Wohnungsboerse
1400	2023-12-07 12:56:15+01	33673981	Wohnungsboerse
1290	2023-12-07 12:56:17+01	33674174	Wohnungsboerse
1500	2023-12-07 12:56:19+01	33674718	Wohnungsboerse
1800	2023-12-07 12:56:22+01	33679391	Wohnungsboerse
1260	2023-12-07 12:56:24+01	33540498	Wohnungsboerse
1174	2023-12-07 12:56:26+01	33686096	Wohnungsboerse
1250	2023-12-07 12:56:28+01	33686311	Wohnungsboerse
539	2023-12-07 12:56:30+01	33689625	Wohnungsboerse
5100	2023-12-07 12:56:32+01	33689654	Wohnungsboerse
780	2023-12-07 12:56:34+01	33689905	Wohnungsboerse
1450	2023-12-07 12:56:36+01	33351683	Wohnungsboerse
1450	2023-12-07 12:56:38+01	33619038	Wohnungsboerse
1000	2023-12-07 12:56:41+01	33542810	Wohnungsboerse
1430	2023-12-07 12:56:42+01	33634501	Wohnungsboerse
1700	2023-12-07 12:56:45+01	33646382	Wohnungsboerse
1620	2023-12-07 12:56:48+01	33650436	Wohnungsboerse
1340	2023-12-07 12:56:51+01	33650435	Wohnungsboerse
1560	2023-12-07 12:56:54+01	33650434	Wohnungsboerse
1610	2023-12-07 12:56:56+01	33650433	Wohnungsboerse
870	2023-12-07 12:56:59+01	33650432	Wohnungsboerse
900	2023-12-07 12:57:01+01	33652634	Wohnungsboerse
1015	2023-12-07 12:57:04+01	33663508	Wohnungsboerse
1435.5	2023-12-07 12:57:05+01	33677673	Wohnungsboerse
790	2023-12-07 12:57:08+01	33392135	Wohnungsboerse
3690	2023-12-07 12:57:11+01	33601618	Wohnungsboerse
2480	2023-12-07 12:57:13+01	33654905	Wohnungsboerse
690	2023-12-07 12:57:15+01	33675310	Wohnungsboerse
995	2023-12-07 12:57:17+01	33667644	Wohnungsboerse
1100	2023-12-07 12:57:20+01	33638259	Wohnungsboerse
550	2023-12-07 12:57:22+01	33670453	Wohnungsboerse
625	2023-12-07 12:57:24+01	33679187	Wohnungsboerse
900	2023-12-07 12:57:27+01	33604667	Wohnungsboerse
650	2023-12-07 12:57:30+01	33682751	Wohnungsboerse
1100	2023-12-07 12:57:33+01	33682811	Wohnungsboerse
900	2023-12-07 12:57:36+01	33682924	Wohnungsboerse
785	2023-12-07 12:57:37+01	33683200	Wohnungsboerse
1155	2023-12-07 12:57:40+01	33684604	Wohnungsboerse
1000	2023-12-07 12:57:43+01	33685079	Wohnungsboerse
1200	2023-12-07 12:57:45+01	33546171	Wohnungsboerse
980	2023-12-07 12:57:48+01	33688567	Wohnungsboerse
760	2023-12-07 12:57:51+01	33688909	Wohnungsboerse
1270	2023-12-07 12:57:53+01	33519879	Wohnungsboerse
850	2023-12-07 12:57:55+01	33203773	Wohnungsboerse
614	2023-12-07 12:57:57+01	33051217	Wohnungsboerse
459.38	2023-12-07 12:57:59+01	33636857	Wohnungsboerse
483.28	2023-12-07 12:58:01+01	33674233	Wohnungsboerse
467.6	2023-12-07 12:58:04+01	33674263	Wohnungsboerse
535.43	2023-12-07 12:58:07+01	33684976	Wohnungsboerse
845	2023-12-07 12:58:09+01	33688749	Wohnungsboerse
996	2023-12-07 12:58:11+01	33594288	Wohnungsboerse
800	2023-12-07 12:58:14+01	33604204	Wohnungsboerse
1254	2023-12-07 12:58:16+01	33352052	Wohnungsboerse
700	2023-12-07 12:58:19+01	33317345	Wohnungsboerse
940.3	2023-12-07 12:58:21+01	33625573	Wohnungsboerse
509.58	2023-12-07 12:58:24+01	33641929	Wohnungsboerse
733	2023-12-07 12:58:26+01	32189849	Wohnungsboerse
575	2023-12-07 12:58:28+01	33645830	Wohnungsboerse
2300	2023-12-07 12:58:30+01	33649941	Wohnungsboerse
1594.05	2023-12-07 12:58:33+01	33627528	Wohnungsboerse
1491	2023-12-07 12:58:36+01	33667466	Wohnungsboerse
467.29	2023-12-07 12:58:39+01	33670261	Wohnungsboerse
570.85	2023-12-07 12:58:41+01	33493584	Wohnungsboerse
485.6	2023-12-07 12:58:44+01	33679174	Wohnungsboerse
1089	2023-12-07 12:58:47+01	33562972	Wohnungsboerse
995	2023-12-07 12:58:49+01	33663806	Wohnungsboerse
1241.97	2023-12-07 12:58:52+01	33670032	Wohnungsboerse
775	2023-12-07 12:58:55+01	33670119	Wohnungsboerse
950	2023-12-07 12:58:57+01	33672454	Wohnungsboerse
465	2023-12-07 12:59:00+01	33681509	Wohnungsboerse
1160	2023-12-07 12:59:02+01	33681584	Wohnungsboerse
724.07	2023-12-07 12:59:05+01	33608544	Wohnungsboerse
1010.36	2023-12-07 12:59:08+01	33682756	Wohnungsboerse
514	2023-12-07 12:59:11+01	33682947	Wohnungsboerse
655	2023-12-07 12:59:13+01	33684668	Wohnungsboerse
740	2023-12-07 12:59:15+01	33686433	Wohnungsboerse
1250	2023-12-07 12:59:18+01	33688642	Wohnungsboerse
517	2023-12-07 12:59:20+01	33050471	Wohnungsboerse
940	2023-12-07 12:59:22+01	33663482	Wohnungsboerse
1700	2023-12-07 12:59:25+01	33667387	Wohnungsboerse
2525	2023-12-07 12:59:28+01	33670203	Wohnungsboerse
1600	2023-12-07 12:59:30+01	33623508	Wohnungsboerse
630	2023-12-07 12:59:33+01	33539927	Wohnungsboerse
940	2023-12-07 12:59:36+01	33675939	Wohnungsboerse
750	2023-12-07 12:59:38+01	33677388	Wohnungsboerse
1050	2023-12-07 12:59:41+01	33605848	Wohnungsboerse
1550	2023-12-07 12:59:44+01	33679455	Wohnungsboerse
1728	2023-12-07 12:59:47+01	33679545	Wohnungsboerse
1160	2023-12-07 12:59:48+01	33605697	Wohnungsboerse
1390	2023-12-07 12:59:51+01	33688801	Wohnungsboerse
1180	2023-12-07 12:59:53+01	33689552	Wohnungsboerse
1100	2023-12-07 12:59:55+01	33323575	Wohnungsboerse
885	2023-12-07 12:59:58+01	33662142	Wohnungsboerse
400	2023-12-07 13:00:00+01	33662797	Wohnungsboerse
650	2023-12-07 13:00:03+01	33664691	Wohnungsboerse
430	2023-12-07 13:00:05+01	33664869	Wohnungsboerse
430	2023-12-07 13:00:08+01	33667784	Wohnungsboerse
810	2023-12-07 13:00:10+01	33670520	Wohnungsboerse
650	2023-12-07 13:00:12+01	33650044	Wohnungsboerse
790	2023-12-07 13:00:14+01	33638258	Wohnungsboerse
770	2023-12-07 13:00:16+01	33672291	Wohnungsboerse
1100	2023-12-07 13:00:19+01	33673966	Wohnungsboerse
635	2023-12-07 13:00:20+01	33659133	Wohnungsboerse
660	2023-12-07 13:00:23+01	33681343	Wohnungsboerse
500	2023-12-07 13:00:25+01	33689742	Wohnungsboerse
2920	2023-12-11 12:41:33+01	33022819	Wohnungsboerse
930	2023-12-11 12:41:36+01	33147363	Wohnungsboerse
950	2023-12-11 12:41:39+01	33298728	Wohnungsboerse
420	2023-12-11 12:41:40+01	33697125	Wohnungsboerse
800	2023-12-11 12:41:43+01	31766932	Wohnungsboerse
588	2023-12-11 12:41:45+01	33685085	Wohnungsboerse
700	2023-12-11 12:41:47+01	33681307	Wohnungsboerse
870	2023-12-11 12:41:50+01	33646100	Wohnungsboerse
430	2023-12-11 12:41:52+01	33654675	Wohnungsboerse
750	2023-12-11 12:41:55+01	33550667	Wohnungsboerse
1094.17	2023-12-11 12:41:58+01	33522726	Wohnungsboerse
799	2023-12-11 12:42:00+01	33679465	Wohnungsboerse
830	2023-12-11 12:42:03+01	32976985	Wohnungsboerse
970	2023-12-11 12:42:06+01	33574602	Wohnungsboerse
1050	2023-12-11 12:42:07+01	33646532	Wohnungsboerse
2950	2023-12-11 12:42:10+01	32489228	Wohnungsboerse
1891	2023-12-11 12:42:11+01	32697715	Wohnungsboerse
985	2023-12-11 12:42:14+01	32642467	Wohnungsboerse
1840	2023-12-11 12:42:16+01	32642458	Wohnungsboerse
1705	2023-12-11 12:42:19+01	33050991	Wohnungsboerse
2590	2023-12-11 12:42:21+01	33354570	Wohnungsboerse
2225	2023-12-11 12:42:24+01	32804194	Wohnungsboerse
965	2023-12-11 12:42:26+01	33489268	Wohnungsboerse
2031	2023-12-11 12:42:29+01	33539691	Wohnungsboerse
1200	2023-12-11 12:42:30+01	33691460	Wohnungsboerse
2550	2023-12-11 12:42:33+01	33606387	Wohnungsboerse
1550	2023-12-11 12:42:36+01	32848279	Wohnungsboerse
1400	2023-12-11 12:42:38+01	33435206	Wohnungsboerse
1450	2023-12-11 12:42:41+01	33506206	Wohnungsboerse
1400	2023-12-11 12:42:44+01	33565901	Wohnungsboerse
1400	2023-12-11 12:42:46+01	33578811	Wohnungsboerse
1470	2023-12-11 12:42:48+01	33582266	Wohnungsboerse
590	2023-12-11 12:42:50+01	33615243	Wohnungsboerse
1430	2023-12-11 12:42:52+01	33654824	Wohnungsboerse
698	2023-12-11 12:42:54+01	33677495	Wohnungsboerse
870	2023-12-11 12:42:57+01	33662965	Wohnungsboerse
1450	2023-12-11 12:43:00+01	33347440	Wohnungsboerse
900	2023-12-11 12:43:03+01	33697291	Wohnungsboerse
1400	2023-12-11 12:43:06+01	33686129	Wohnungsboerse
830	2023-12-11 12:43:08+01	33706960	Wohnungsboerse
1300	2023-12-11 12:43:11+01	33438704	Wohnungsboerse
880	2023-12-11 12:43:13+01	33378242	Wohnungsboerse
1200	2023-12-11 12:43:15+01	33622999	Wohnungsboerse
5200	2023-12-11 12:43:17+01	33679123	Wohnungsboerse
666.55	2023-12-11 12:43:20+01	33667881	Wohnungsboerse
2400	2023-12-11 12:43:21+01	32853310	Wohnungsboerse
1050	2023-12-11 12:43:24+01	33689000	Wohnungsboerse
720	2023-12-11 12:43:27+01	33693005	Wohnungsboerse
1200	2023-12-11 12:43:30+01	33506668	Wohnungsboerse
6850	2023-12-11 12:43:33+01	32747252	Wohnungsboerse
8480	2023-12-11 12:43:34+01	30752723	Wohnungsboerse
6850	2023-12-11 12:43:37+01	31193233	Wohnungsboerse
690	2023-12-11 12:43:40+01	33705400	Wohnungsboerse
999	2023-12-11 12:43:41+01	33710405	Wohnungsboerse
1125	2023-12-11 12:43:44+01	33276431	Wohnungsboerse
940	2023-12-11 12:43:46+01	33504339	Wohnungsboerse
871.94	2023-12-11 12:43:49+01	33059673	Wohnungsboerse
880	2023-12-11 12:43:51+01	33645816	Wohnungsboerse
790	2023-12-11 12:43:54+01	33649987	Wohnungsboerse
750	2023-12-11 12:43:56+01	33662864	Wohnungsboerse
920	2023-12-11 12:43:58+01	33223803	Wohnungsboerse
600	2023-12-11 12:44:00+01	33580297	Wohnungsboerse
1440	2023-12-11 12:44:02+01	33685125	Wohnungsboerse
713.04	2023-12-11 12:44:04+01	33699093	Wohnungsboerse
1100	2023-12-11 12:44:07+01	33701328	Wohnungsboerse
660	2023-12-11 12:44:09+01	33701324	Wohnungsboerse
1512	2023-12-11 12:44:12+01	33705276	Wohnungsboerse
950	2023-12-11 12:44:14+01	33710692	Wohnungsboerse
650	2023-12-11 12:44:17+01	33284573	Wohnungsboerse
850	2023-12-11 12:44:20+01	33067537	Wohnungsboerse
665	2023-12-11 12:44:23+01	33464631	Wohnungsboerse
740	2023-12-11 12:44:26+01	33487539	Wohnungsboerse
580	2023-12-11 12:44:28+01	33548846	Wohnungsboerse
800	2023-12-11 12:44:31+01	33509761	Wohnungsboerse
555	2023-12-11 12:44:33+01	33650581	Wohnungsboerse
850	2023-12-11 12:44:36+01	33663487	Wohnungsboerse
750	2023-12-11 12:44:39+01	33681682	Wohnungsboerse
800	2023-12-11 12:44:41+01	33686572	Wohnungsboerse
730	2023-12-11 12:44:44+01	33693114	Wohnungsboerse
890	2023-12-11 12:44:47+01	33706807	Wohnungsboerse
770	2023-12-11 12:44:49+01	33681462	Wohnungsboerse
1400	2023-12-11 12:44:51+01	33688470	Wohnungsboerse
810	2023-12-11 12:44:53+01	33689786	Wohnungsboerse
798	2023-12-11 12:44:59+01	33691528	Wohnungsboerse
790	2023-12-11 12:45:02+01	33689639	Wohnungsboerse
900	2023-12-11 12:45:05+01	33695593	Wohnungsboerse
550	2023-12-11 12:45:08+01	33699377	Wohnungsboerse
550	2023-12-11 12:45:11+01	33701215	Wohnungsboerse
275	2023-12-11 12:45:14+01	33703540	Wohnungsboerse
800	2023-12-11 12:45:16+01	33703578	Wohnungsboerse
295	2023-12-11 12:45:18+01	33704509	Wohnungsboerse
730	2023-12-11 12:45:22+01	33686454	Wohnungsboerse
799.81	2023-12-11 12:45:24+01	33713452	Wohnungsboerse
874.24	2023-12-11 12:45:25+01	33522714	Wohnungsboerse
941.83	2023-12-11 12:45:27+01	33522747	Wohnungsboerse
700	2023-12-11 12:45:29+01	33579780	Wohnungsboerse
570	2023-12-11 12:45:31+01	33662910	Wohnungsboerse
500	2023-12-11 12:45:34+01	33674214	Wohnungsboerse
640	2023-12-11 12:45:36+01	33386081	Wohnungsboerse
830	2023-12-11 12:45:38+01	33679748	Wohnungsboerse
630	2023-12-11 12:45:41+01	33688507	Wohnungsboerse
845	2023-12-11 12:45:44+01	33693548	Wohnungsboerse
895	2023-12-11 12:45:46+01	33696598	Wohnungsboerse
1315	2023-12-11 12:45:49+01	33583884	Wohnungsboerse
500.76	2023-12-11 12:45:51+01	33707202	Wohnungsboerse
630	2023-12-11 12:45:53+01	33713644	Wohnungsboerse
1054.1	2023-12-11 12:45:56+01	33713773	Wohnungsboerse
600	2023-12-11 12:45:59+01	33688451	Wohnungsboerse
500	2023-12-11 12:46:01+01	33688664	Wohnungsboerse
590	2023-12-11 12:46:04+01	33688762	Wohnungsboerse
1200	2023-12-11 12:46:06+01	33698981	Wohnungsboerse
770	2023-12-11 12:46:09+01	32912196	Wohnungsboerse
760	2023-12-11 12:46:10+01	33701343	Wohnungsboerse
640	2023-12-11 12:46:11+01	33703369	Wohnungsboerse
1340	2023-12-11 12:46:14+01	33705304	Wohnungsboerse
680	2023-12-11 12:46:16+01	33705406	Wohnungsboerse
2895	2023-12-11 12:46:18+01	33481072	Wohnungsboerse
1700	2023-12-11 12:46:21+01	33695459	Wohnungsboerse
1013	2023-12-11 12:46:24+01	33661206	Wohnungsboerse
3950	2023-12-11 12:46:27+01	33707626	Wohnungsboerse
600	2023-12-11 12:46:29+01	33708444	Wohnungsboerse
700	2023-12-11 12:46:32+01	33477583	Wohnungsboerse
1300	2023-12-11 12:46:34+01	31823448	Wohnungsboerse
790	2023-12-11 12:46:37+01	33652853	Wohnungsboerse
590	2023-12-11 12:46:40+01	33495917	Wohnungsboerse
440	2023-12-11 12:46:43+01	33674551	Wohnungsboerse
620	2023-12-11 12:46:45+01	33675927	Wohnungsboerse
599	2023-12-11 12:46:47+01	33677866	Wohnungsboerse
595	2023-12-11 12:46:50+01	33671854	Wohnungsboerse
573	2023-12-11 12:46:51+01	33675677	Wohnungsboerse
741	2023-12-11 12:46:54+01	33686561	Wohnungsboerse
850	2023-12-11 12:46:57+01	33688577	Wohnungsboerse
590	2023-12-11 12:46:59+01	33691910	Wohnungsboerse
810	2023-12-11 12:47:01+01	33692021	Wohnungsboerse
1300	2023-12-11 12:47:03+01	33433016	Wohnungsboerse
720	2023-12-11 12:47:06+01	33701525	Wohnungsboerse
660	2023-12-11 12:47:07+01	33644575	Wohnungsboerse
460	2023-12-11 12:47:09+01	33681721	Wohnungsboerse
1050	2023-12-11 12:47:12+01	33682700	Wohnungsboerse
900	2023-12-11 12:47:14+01	33684864	Wohnungsboerse
1750	2023-12-11 12:47:17+01	33685094	Wohnungsboerse
1290	2023-12-11 12:47:20+01	33654631	Wohnungsboerse
600	2023-12-11 12:47:22+01	33686889	Wohnungsboerse
845	2023-12-11 12:47:25+01	33633478	Wohnungsboerse
700	2023-12-11 12:47:28+01	33693008	Wohnungsboerse
1230	2023-12-11 12:47:31+01	33695717	Wohnungsboerse
978	2023-12-11 12:47:32+01	33695804	Wohnungsboerse
870	2023-12-11 12:47:35+01	33704572	Wohnungsboerse
1100	2023-12-11 12:47:37+01	33700861	Wohnungsboerse
1300	2023-12-11 12:47:40+01	33706041	Wohnungsboerse
1100	2023-12-11 12:47:42+01	33707100	Wohnungsboerse
735	2023-12-11 12:47:44+01	33688516	Wohnungsboerse
1090	2023-12-11 12:47:46+01	33688511	Wohnungsboerse
758	2023-12-11 12:47:49+01	33689861	Wohnungsboerse
490	2023-12-11 12:47:51+01	33691532	Wohnungsboerse
670	2023-12-11 12:47:53+01	33693187	Wohnungsboerse
546.94	2023-12-11 12:47:56+01	33695658	Wohnungsboerse
677.71	2023-12-11 12:47:59+01	33695683	Wohnungsboerse
500	2023-12-11 12:48:01+01	33695764	Wohnungsboerse
450	2023-12-11 12:48:03+01	33699706	Wohnungsboerse
740	2023-12-11 12:48:06+01	33703442	Wohnungsboerse
1100	2023-12-11 12:48:09+01	33704470	Wohnungsboerse
1100	2023-12-11 12:48:11+01	33705960	Wohnungsboerse
1020.5	2023-12-11 12:48:14+01	33709346	Wohnungsboerse
370	2023-12-11 12:48:17+01	33709563	Wohnungsboerse
3250	2023-12-11 12:48:18+01	33114294	Wohnungsboerse
1950	2023-12-11 12:48:20+01	33308983	Wohnungsboerse
1950	2023-12-11 12:48:23+01	33320934	Wohnungsboerse
1640	2023-12-11 12:48:24+01	32877350	Wohnungsboerse
1360	2023-12-11 12:48:26+01	33648905	Wohnungsboerse
650	2023-12-11 12:48:28+01	33675892	Wohnungsboerse
1950	2023-12-11 12:48:30+01	33683184	Wohnungsboerse
505	2023-12-11 12:48:34+01	33480003	Wohnungsboerse
900	2023-12-11 12:48:36+01	33555511	Wohnungsboerse
950	2023-12-11 12:48:39+01	33555506	Wohnungsboerse
1300	2023-12-11 12:48:41+01	33555498	Wohnungsboerse
1950	2023-12-11 12:48:44+01	33698866	Wohnungsboerse
500	2023-12-11 12:48:45+01	33703417	Wohnungsboerse
336	2023-12-11 12:48:48+01	33705222	Wohnungsboerse
365	2023-12-11 12:48:51+01	33705365	Wohnungsboerse
515	2023-12-11 12:48:54+01	33705987	Wohnungsboerse
730	2023-12-11 12:48:56+01	33707022	Wohnungsboerse
1400	2023-12-11 12:48:59+01	33709317	Wohnungsboerse
1100	2023-12-11 12:49:01+01	33709735	Wohnungsboerse
1210	2023-12-11 12:49:03+01	33710519	Wohnungsboerse
530	2023-12-11 12:49:05+01	33710697	Wohnungsboerse
565	2023-12-11 12:49:08+01	33714056	Wohnungsboerse
800	2023-12-11 12:49:11+01	33086103	Wohnungsboerse
955.79	2023-12-11 12:49:13+01	33594334	Wohnungsboerse
974.95	2023-12-11 12:49:14+01	33600514	Wohnungsboerse
810	2023-12-11 12:49:17+01	33254648	Wohnungsboerse
585	2023-12-11 12:49:19+01	33642075	Wohnungsboerse
600	2023-12-11 12:49:21+01	33653012	Wohnungsboerse
985	2023-12-11 12:49:24+01	33670075	Wohnungsboerse
634.52	2023-12-11 12:49:26+01	33681580	Wohnungsboerse
2250	2023-12-11 12:49:28+01	33689702	Wohnungsboerse
490	2023-12-11 12:49:30+01	33693051	Wohnungsboerse
1251.78	2023-12-11 12:49:33+01	33703455	Wohnungsboerse
450	2023-12-11 12:49:34+01	33660225	Wohnungsboerse
480	2023-12-11 12:49:37+01	33706834	Wohnungsboerse
435	2023-12-11 12:49:39+01	33708437	Wohnungsboerse
1760	2023-12-11 12:49:42+01	33524121	Wohnungsboerse
924	2023-12-11 12:49:43+01	33522771	Wohnungsboerse
2150	2023-12-11 12:49:46+01	33640807	Wohnungsboerse
1890	2023-12-11 12:49:49+01	32728992	Wohnungsboerse
1890	2023-12-11 12:49:51+01	32728991	Wohnungsboerse
1550	2023-12-11 12:49:54+01	32853522	Wohnungsboerse
487	2023-12-11 12:49:56+01	33667751	Wohnungsboerse
1050	2023-12-11 12:49:59+01	33679734	Wohnungsboerse
920	2023-12-11 12:50:01+01	33690170	Wohnungsboerse
888.71	2023-12-11 12:50:04+01	33703392	Wohnungsboerse
1580	2023-12-11 12:50:07+01	33705811	Wohnungsboerse
900	2023-12-11 12:50:10+01	33708228	Wohnungsboerse
1280	2023-12-11 12:50:13+01	33709536	Wohnungsboerse
1000	2023-12-11 12:50:14+01	33710407	Wohnungsboerse
8500	2023-12-11 12:50:17+01	33196281	Wohnungsboerse
1800	2023-12-11 12:50:19+01	32817541	Wohnungsboerse
1379.88	2023-12-11 12:50:22+01	33445819	Wohnungsboerse
1684.63	2023-12-11 12:50:24+01	33445857	Wohnungsboerse
2200	2023-12-11 12:50:25+01	33422321	Wohnungsboerse
2950	2023-12-11 12:50:28+01	33455178	Wohnungsboerse
700	2023-12-11 12:50:31+01	33501793	Wohnungsboerse
2770	2023-12-11 12:50:34+01	33347939	Wohnungsboerse
1850	2023-12-11 12:50:36+01	33196527	Wohnungsboerse
797.84	2023-12-11 12:50:38+01	33649071	Wohnungsboerse
4750	2023-12-11 12:50:40+01	33688877	Wohnungsboerse
650	2023-12-11 12:50:43+01	33705317	Wohnungsboerse
890	2023-12-11 12:50:46+01	33709534	Wohnungsboerse
797.84	2023-12-11 12:50:47+01	33710530	Wohnungsboerse
700	2023-12-11 12:51:36+01	33535395	Wohnungsboerse
600	2023-12-11 12:51:37+01	33532119	Wohnungsboerse
896	2023-12-11 12:51:39+01	33196294	Wohnungsboerse
750.95	2023-12-11 12:51:42+01	33596800	Wohnungsboerse
1950	2023-12-11 12:51:44+01	33697287	Wohnungsboerse
900	2023-12-11 12:51:47+01	33627163	Wohnungsboerse
1900	2023-12-11 12:51:50+01	31394882	Wohnungsboerse
765	2023-12-11 12:51:52+01	33544205	Wohnungsboerse
2700	2023-12-11 12:51:55+01	33449689	Wohnungsboerse
1190	2023-12-11 12:51:56+01	33601786	Wohnungsboerse
920	2023-12-11 12:51:59+01	33627326	Wohnungsboerse
655	2023-12-11 12:52:00+01	33674129	Wohnungsboerse
839.16	2023-12-11 12:52:02+01	33402808	Wohnungsboerse
1340	2023-12-11 12:52:05+01	33462779	Wohnungsboerse
1495	2023-12-11 12:52:08+01	33540487	Wohnungsboerse
695	2023-12-11 12:52:11+01	33473469	Wohnungsboerse
1150	2023-12-11 12:52:13+01	33663485	Wohnungsboerse
650	2023-12-11 12:52:16+01	29317989	Wohnungsboerse
620	2023-12-11 12:52:18+01	33664503	Wohnungsboerse
1100	2023-12-11 12:52:21+01	33506341	Wohnungsboerse
577.92	2023-12-11 12:52:23+01	33682967	Wohnungsboerse
980	2023-12-11 12:52:25+01	33684724	Wohnungsboerse
1590	2023-12-11 12:52:28+01	33686399	Wohnungsboerse
530.6	2023-12-11 12:52:31+01	33691732	Wohnungsboerse
992.46	2023-12-11 12:52:33+01	33691726	Wohnungsboerse
1875	2023-12-11 12:52:35+01	32976977	Wohnungsboerse
1200	2023-12-11 12:52:38+01	33695528	Wohnungsboerse
1121.63	2023-12-11 12:52:41+01	33691710	Wohnungsboerse
750	2023-12-11 12:52:44+01	33701019	Wohnungsboerse
540	2023-12-11 12:52:47+01	33705398	Wohnungsboerse
670	2023-12-11 12:52:50+01	33710474	Wohnungsboerse
420	2023-12-11 12:52:52+01	33657994	Wohnungsboerse
580	2023-12-11 12:52:54+01	33686333	Wohnungsboerse
575	2023-12-11 12:52:57+01	33700943	Wohnungsboerse
1450	2023-12-11 12:52:59+01	33630752	Wohnungsboerse
627	2023-12-11 12:53:02+01	33710483	Wohnungsboerse
3300	2023-12-11 12:53:05+01	33598493	Wohnungsboerse
1830	2023-12-11 12:53:07+01	33568443	Wohnungsboerse
1800	2023-12-11 12:53:10+01	33675316	Wohnungsboerse
1450	2023-12-11 12:53:12+01	33608727	Wohnungsboerse
1700	2023-12-11 12:53:15+01	33692109	Wohnungsboerse
955	2023-12-11 12:53:18+01	33696812	Wohnungsboerse
1200	2023-12-11 12:53:20+01	33705388	Wohnungsboerse
1795	2023-12-11 12:53:22+01	33540488	Wohnungsboerse
1100	2023-12-11 12:53:25+01	31675590	Wohnungsboerse
1168.83	2023-12-11 12:53:28+01	33384509	Wohnungsboerse
684	2023-12-11 12:53:30+01	27035171	Wohnungsboerse
1348	2023-12-11 12:53:32+01	33425850	Wohnungsboerse
1064	2023-12-11 12:53:34+01	32820355	Wohnungsboerse
1066	2023-12-11 12:53:37+01	33449817	Wohnungsboerse
1262.17	2023-12-11 12:53:40+01	33450063	Wohnungsboerse
1300	2023-12-11 12:53:42+01	33455197	Wohnungsboerse
1272.31	2023-12-11 12:53:44+01	33630924	Wohnungsboerse
1158.43	2023-12-11 12:53:47+01	33650288	Wohnungsboerse
1534	2023-12-11 12:53:50+01	33646337	Wohnungsboerse
1375	2023-12-11 12:53:52+01	33654290	Wohnungsboerse
1205	2023-12-11 12:53:55+01	27088008	Wohnungsboerse
780	2023-12-11 12:53:57+01	33681987	Wohnungsboerse
828.2	2023-12-11 12:53:59+01	33396009	Wohnungsboerse
720	2023-12-11 12:54:01+01	33487464	Wohnungsboerse
1850	2023-12-11 12:54:03+01	33129082	Wohnungsboerse
1450	2023-12-11 12:54:06+01	33454997	Wohnungsboerse
1150	2023-12-11 12:54:07+01	33579993	Wohnungsboerse
1290	2023-12-11 12:54:10+01	33629353	Wohnungsboerse
1450	2023-12-11 12:54:12+01	32375748	Wohnungsboerse
1200	2023-12-11 12:54:15+01	33636840	Wohnungsboerse
790	2023-12-11 12:54:18+01	33696980	Wohnungsboerse
970	2023-12-11 12:54:20+01	33708525	Wohnungsboerse
480	2023-12-11 12:54:23+01	33650359	Wohnungsboerse
526.83	2023-12-11 12:54:26+01	33560204	Wohnungsboerse
750	2023-12-11 12:54:28+01	33657206	Wohnungsboerse
665	2023-12-11 12:54:31+01	33672283	Wohnungsboerse
620	2023-12-11 12:54:33+01	33675627	Wohnungsboerse
480	2023-12-11 12:54:35+01	33679034	Wohnungsboerse
637	2023-12-11 12:54:38+01	33682976	Wohnungsboerse
1050	2023-12-11 12:54:41+01	33686441	Wohnungsboerse
720	2023-12-11 12:54:42+01	33465765	Wohnungsboerse
830	2023-12-11 12:54:45+01	33354625	Wohnungsboerse
550	2023-12-11 12:54:47+01	33706012	Wohnungsboerse
1400	2023-12-11 12:54:50+01	33708318	Wohnungsboerse
1600	2023-12-11 12:54:53+01	33709668	Wohnungsboerse
350	2023-12-11 12:54:56+01	33710499	Wohnungsboerse
1650	2023-12-11 12:54:59+01	33689562	Wohnungsboerse
712.5	2023-12-11 12:55:01+01	33677865	Wohnungsboerse
680	2023-12-11 12:55:04+01	33675891	Wohnungsboerse
600	2023-12-11 12:55:06+01	33527489	Wohnungsboerse
1890	2023-12-11 12:55:08+01	33358387	Wohnungsboerse
540	2023-12-11 12:55:09+01	33699701	Wohnungsboerse
700	2023-12-11 12:55:12+01	33714070	Wohnungsboerse
1430	2023-12-11 12:55:14+01	33714081	Wohnungsboerse
2000	2023-12-11 12:55:17+01	33668010	Wohnungsboerse
795	2023-12-11 12:55:19+01	33714087	Wohnungsboerse
430	2023-12-11 12:55:22+01	33714089	Wohnungsboerse
345	2023-12-11 12:55:24+01	33714091	Wohnungsboerse
365	2023-12-11 12:55:27+01	33649969	Wohnungsboerse
959	2023-12-11 12:55:29+01	32816215	Wohnungsboerse
872.49	2023-12-11 12:55:31+01	33598517	Wohnungsboerse
645	2023-12-11 12:55:32+01	33604328	Wohnungsboerse
1773.39	2023-12-11 12:55:35+01	33598511	Wohnungsboerse
1250	2023-12-11 12:55:38+01	33621867	Wohnungsboerse
850	2023-12-11 12:55:39+01	33604309	Wohnungsboerse
415	2023-12-11 12:55:42+01	33555182	Wohnungsboerse
650	2023-12-11 12:55:44+01	33672119	Wohnungsboerse
490	2023-12-11 12:55:46+01	33645974	Wohnungsboerse
976	2023-12-11 12:55:49+01	33675587	Wohnungsboerse
750	2023-12-11 12:55:52+01	33677282	Wohnungsboerse
720	2023-12-11 12:55:55+01	33584182	Wohnungsboerse
1100.59	2023-12-11 12:55:56+01	33598459	Wohnungsboerse
575	2023-12-11 12:55:58+01	33667732	Wohnungsboerse
695	2023-12-11 12:56:00+01	33638071	Wohnungsboerse
1137.36	2023-12-11 12:56:03+01	33435007	Wohnungsboerse
510.19	2023-12-11 12:56:05+01	33648739	Wohnungsboerse
600	2023-12-11 12:56:08+01	33614961	Wohnungsboerse
900	2023-12-11 12:56:11+01	33654518	Wohnungsboerse
869	2023-12-11 12:56:14+01	33344003	Wohnungsboerse
636	2023-12-11 12:56:15+01	33681363	Wohnungsboerse
636	2023-12-11 12:56:18+01	33681362	Wohnungsboerse
441.44	2023-12-11 12:56:20+01	33674342	Wohnungsboerse
570	2023-12-11 12:56:22+01	33686150	Wohnungsboerse
827	2023-12-11 12:56:24+01	33689957	Wohnungsboerse
597.44	2023-12-11 12:56:27+01	33695695	Wohnungsboerse
1450	2023-12-11 12:56:30+01	33451563	Wohnungsboerse
495	2023-12-11 12:56:31+01	33705337	Wohnungsboerse
2000	2023-12-11 12:56:34+01	33640373	Wohnungsboerse
800	2023-12-11 12:56:36+01	33528588	Wohnungsboerse
1216	2023-12-11 12:57:15+01	33696584	Wohnungsboerse
750	2023-12-11 12:57:17+01	33701122	Wohnungsboerse
660	2023-12-11 12:57:19+01	33681343	Wohnungsboerse
1600	2023-12-11 12:57:21+01	33623508	Wohnungsboerse
517	2023-12-11 12:57:23+01	33050471	Wohnungsboerse
996	2023-12-11 12:57:25+01	33594288	Wohnungsboerse
1620	2023-12-11 12:57:27+01	33565781	Wohnungsboerse
650	2023-12-11 12:57:30+01	33693333	Wohnungsboerse
810.81	2023-12-11 12:57:33+01	33002621	Wohnungsboerse
1728	2023-12-11 12:57:35+01	33616369	Wohnungsboerse
1260	2023-12-11 12:57:37+01	33540498	Wohnungsboerse
759.66	2023-12-11 12:57:40+01	33500282	Wohnungsboerse
2560	2023-12-11 12:57:43+01	33493623	Wohnungsboerse
590	2023-12-11 12:57:46+01	26640415	Wohnungsboerse
1750	2023-12-11 12:57:48+01	33571784	Wohnungsboerse
800	2023-12-11 12:57:50+01	32111553	Wohnungsboerse
465.65	2023-12-11 12:57:53+01	33254653	Wohnungsboerse
640	2023-12-11 12:57:55+01	33299372	Wohnungsboerse
2925	2023-12-11 12:57:57+01	33259857	Wohnungsboerse
947.16	2023-12-11 12:57:59+01	33304400	Wohnungsboerse
1000	2023-12-11 12:58:02+01	33574808	Wohnungsboerse
1590	2023-12-11 12:58:05+01	33329023	Wohnungsboerse
752.77	2023-12-11 12:58:07+01	33432779	Wohnungsboerse
740	2023-12-11 12:58:10+01	33298889	Wohnungsboerse
586.4	2023-12-11 12:58:12+01	33638530	Wohnungsboerse
735	2023-12-11 12:58:14+01	33650244	Wohnungsboerse
1800	2023-12-11 12:58:18+01	33593060	Wohnungsboerse
1350	2023-12-11 12:58:19+01	33654580	Wohnungsboerse
3050	2023-12-11 12:58:22+01	33652461	Wohnungsboerse
3050	2023-12-11 12:58:25+01	33593062	Wohnungsboerse
530	2023-12-11 12:58:27+01	33627010	Wohnungsboerse
550	2023-12-11 12:58:30+01	33633812	Wohnungsboerse
710	2023-12-11 12:58:32+01	33347397	Wohnungsboerse
520	2023-12-11 12:58:35+01	33667601	Wohnungsboerse
1650	2023-12-11 12:58:37+01	33677783	Wohnungsboerse
1050	2023-12-11 12:58:40+01	33688535	Wohnungsboerse
650	2023-12-11 12:58:42+01	33693182	Wohnungsboerse
690	2023-12-11 12:58:44+01	33682555	Wohnungsboerse
832	2023-12-11 12:58:47+01	33706010	Wohnungsboerse
1540	2023-12-11 12:58:48+01	32803920	Wohnungsboerse
4200	2023-12-11 12:58:51+01	33648553	Wohnungsboerse
730	2023-12-11 12:58:54+01	33658070	Wohnungsboerse
420	2023-12-11 12:58:57+01	33658059	Wohnungsboerse
590	2023-12-11 12:58:58+01	26800673	Wohnungsboerse
810	2023-12-11 12:59:00+01	33198024	Wohnungsboerse
950	2023-12-11 12:59:03+01	33333966	Wohnungsboerse
890	2023-12-11 12:59:06+01	33103145	Wohnungsboerse
700	2023-12-11 12:59:08+01	33568372	Wohnungsboerse
970	2023-12-11 12:59:11+01	33609058	Wohnungsboerse
810	2023-12-11 12:59:14+01	33203387	Wohnungsboerse
915	2023-12-11 12:59:15+01	33667986	Wohnungsboerse
670	2023-12-11 12:59:18+01	33671931	Wohnungsboerse
950	2023-12-11 12:59:19+01	33636749	Wohnungsboerse
1568.43	2023-12-11 12:59:22+01	33402892	Wohnungsboerse
1350	2023-12-11 12:59:25+01	33674429	Wohnungsboerse
750	2023-12-11 12:59:27+01	33677263	Wohnungsboerse
580	2023-12-11 12:59:29+01	33691764	Wohnungsboerse
1600	2023-12-11 12:59:31+01	33699228	Wohnungsboerse
1125	2023-12-11 12:59:35+01	33619066	Wohnungsboerse
640	2023-12-11 12:59:37+01	33480104	Wohnungsboerse
1994	2023-12-11 12:59:39+01	33654597	Wohnungsboerse
919.02	2023-12-11 12:59:42+01	33656971	Wohnungsboerse
750.61	2023-12-11 12:59:45+01	33656962	Wohnungsboerse
845	2023-12-11 12:59:48+01	33657988	Wohnungsboerse
995	2023-12-11 12:59:50+01	33619052	Wohnungsboerse
1500	2023-12-11 12:59:51+01	33672080	Wohnungsboerse
1199	2023-12-11 12:59:54+01	33439092	Wohnungsboerse
1350	2023-12-11 12:59:57+01	32885147	Wohnungsboerse
700	2023-12-11 13:00:00+01	33686597	Wohnungsboerse
450	2023-12-11 13:00:01+01	33689988	Wohnungsboerse
1220	2023-12-11 13:00:03+01	33703673	Wohnungsboerse
910	2023-12-11 13:00:06+01	33707630	Wohnungsboerse
1174	2023-12-11 13:00:09+01	33686096	Wohnungsboerse
1250	2023-12-11 13:00:11+01	33686311	Wohnungsboerse
539	2023-12-11 13:00:13+01	33689625	Wohnungsboerse
5100	2023-12-11 13:00:15+01	33689654	Wohnungsboerse
780	2023-12-11 13:00:17+01	33689905	Wohnungsboerse
375	2023-12-11 13:00:20+01	33691788	Wohnungsboerse
420	2023-12-11 13:00:22+01	33691840	Wohnungsboerse
740	2023-12-11 13:00:24+01	33699162	Wohnungsboerse
1100	2023-12-11 13:00:26+01	33699603	Wohnungsboerse
1800	2023-12-11 13:00:28+01	33679391	Wohnungsboerse
835	2023-12-11 13:00:30+01	33703507	Wohnungsboerse
850	2023-12-11 13:00:32+01	33704559	Wohnungsboerse
732	2023-12-11 13:00:34+01	33706091	Wohnungsboerse
938.39	2023-12-11 13:00:37+01	33707208	Wohnungsboerse
1450	2023-12-11 13:00:40+01	33351683	Wohnungsboerse
1450	2023-12-11 13:00:42+01	33619038	Wohnungsboerse
1430	2023-12-11 13:00:45+01	33634501	Wohnungsboerse
1620	2023-12-11 13:00:47+01	33650436	Wohnungsboerse
1340	2023-12-11 13:00:50+01	33650435	Wohnungsboerse
1560	2023-12-11 13:00:52+01	33650434	Wohnungsboerse
1610	2023-12-11 13:00:55+01	33650433	Wohnungsboerse
870	2023-12-11 13:00:57+01	33650432	Wohnungsboerse
900	2023-12-11 13:00:59+01	33652634	Wohnungsboerse
1435.5	2023-12-11 13:01:01+01	33677673	Wohnungsboerse
790	2023-12-11 13:01:04+01	33392135	Wohnungsboerse
1700	2023-12-11 13:01:05+01	33646382	Wohnungsboerse
1000	2023-12-11 13:01:07+01	33542810	Wohnungsboerse
575	2023-12-11 13:01:10+01	33706060	Wohnungsboerse
3690	2023-12-11 13:01:12+01	33601618	Wohnungsboerse
2480	2023-12-11 13:01:15+01	33654905	Wohnungsboerse
690	2023-12-11 13:01:17+01	33675310	Wohnungsboerse
1216	2023-12-11 13:01:20+01	33693410	Wohnungsboerse
450	2023-12-11 13:01:22+01	33697204	Wohnungsboerse
820	2023-12-11 13:01:25+01	33698901	Wohnungsboerse
2650	2023-12-11 13:01:27+01	33693052	Wohnungsboerse
1093.73	2023-12-11 13:01:29+01	33701290	Wohnungsboerse
1000	2023-12-11 13:01:31+01	33701313	Wohnungsboerse
955.13	2023-12-11 13:01:33+01	33701346	Wohnungsboerse
1625	2023-12-11 13:01:36+01	33703775	Wohnungsboerse
640	2023-12-11 13:01:38+01	33705959	Wohnungsboerse
500	2023-12-11 13:01:40+01	33706042	Wohnungsboerse
1471.6	2023-12-11 13:01:43+01	33264606	Wohnungsboerse
410	2023-12-11 13:01:45+01	33709514	Wohnungsboerse
500	2023-12-11 13:01:48+01	33713828	Wohnungsboerse
850	2023-12-11 13:01:50+01	33713915	Wohnungsboerse
1270	2023-12-11 13:01:52+01	33519879	Wohnungsboerse
614	2023-12-11 13:01:54+01	33051217	Wohnungsboerse
459.38	2023-12-11 13:01:57+01	33636857	Wohnungsboerse
483.28	2023-12-11 13:02:00+01	33674233	Wohnungsboerse
467.6	2023-12-11 13:02:03+01	33674263	Wohnungsboerse
535.43	2023-12-11 13:02:06+01	33684976	Wohnungsboerse
850	2023-12-11 13:02:09+01	33704596	Wohnungsboerse
1998	2023-12-11 13:02:11+01	33708296	Wohnungsboerse
800	2023-12-11 13:02:14+01	33604204	Wohnungsboerse
940.3	2023-12-11 13:02:16+01	33625573	Wohnungsboerse
733	2023-12-11 13:02:18+01	32189849	Wohnungsboerse
2300	2023-12-11 13:02:21+01	33649941	Wohnungsboerse
570.85	2023-12-11 13:02:25+01	33493584	Wohnungsboerse
1491	2023-12-11 13:02:25+01	33667466	Wohnungsboerse
2000	2023-12-11 13:02:28+01	33695486	Wohnungsboerse
500	2023-12-11 13:02:30+01	33698876	Wohnungsboerse
1148	2023-12-11 13:02:35+01	33695445	Wohnungsboerse
880.05	2023-12-11 13:02:36+01	33703393	Wohnungsboerse
540	2023-12-11 13:02:38+01	33706795	Wohnungsboerse
1100	2023-12-11 13:02:40+01	33704447	Wohnungsboerse
593.38	2023-12-11 13:02:43+01	33493230	Wohnungsboerse
700	2023-12-11 13:02:45+01	33317345	Wohnungsboerse
2950	2023-12-11 13:02:48+01	33692941	Wohnungsboerse
1450	2023-12-11 13:02:50+01	33693047	Wohnungsboerse
1970	2023-12-11 13:02:53+01	33696670	Wohnungsboerse
1000	2023-12-11 13:02:55+01	33697167	Wohnungsboerse
750	2023-12-11 13:02:57+01	33699268	Wohnungsboerse
1360	2023-12-11 13:03:00+01	33703355	Wohnungsboerse
1200	2023-12-11 13:03:02+01	33564317	Wohnungsboerse
1200	2023-12-11 13:03:04+01	33649052	Wohnungsboerse
1200	2023-12-11 13:03:06+01	33564438	Wohnungsboerse
500	2023-12-11 13:03:08+01	33705284	Wohnungsboerse
2050	2023-12-11 13:03:11+01	33706813	Wohnungsboerse
725	2023-12-11 13:03:14+01	33710804	Wohnungsboerse
724.07	2023-12-11 13:03:16+01	33608544	Wohnungsboerse
630	2023-12-11 13:03:19+01	33539927	Wohnungsboerse
940	2023-12-11 13:03:20+01	33675939	Wohnungsboerse
1550	2023-12-11 13:03:22+01	33679455	Wohnungsboerse
1728	2023-12-11 13:03:24+01	33679545	Wohnungsboerse
1160	2023-12-11 13:03:27+01	33605697	Wohnungsboerse
1390	2023-12-11 13:03:30+01	33688801	Wohnungsboerse
1500	2023-12-11 13:03:32+01	33690212	Wohnungsboerse
620	2023-12-11 13:03:35+01	33527184	Wohnungsboerse
5500	2023-12-11 13:03:38+01	33696595	Wohnungsboerse
1180	2023-12-11 13:03:41+01	33689552	Wohnungsboerse
2800	2023-12-11 13:03:43+01	33701398	Wohnungsboerse
1930	2023-12-11 13:03:45+01	33703627	Wohnungsboerse
1700	2023-12-11 13:03:48+01	33667387	Wohnungsboerse
1620	2023-12-11 13:03:50+01	33705345	Wohnungsboerse
400	2023-12-11 13:03:51+01	33692139	Wohnungsboerse
1100	2023-12-11 13:03:57+01	33693280	Wohnungsboerse
750	2023-12-11 13:04:00+01	33693394	Wohnungsboerse
857.3	2023-12-11 13:04:02+01	33594011	Wohnungsboerse
400	2023-12-11 13:04:04+01	33705943	Wohnungsboerse
700	2023-12-11 13:04:06+01	33552145	Wohnungsboerse
877.5	2023-12-11 13:04:08+01	33708457	Wohnungsboerse
750	2023-12-11 13:04:10+01	33710498	Wohnungsboerse
895	2023-12-11 13:04:14+01	33484313	Wohnungsboerse
885	2023-12-11 13:04:15+01	33662142	Wohnungsboerse
430	2023-12-11 13:04:18+01	33713792	Wohnungsboerse
2920	2023-12-14 12:27:20+01	33022819	Wohnungsboerse
1760	2023-12-14 12:27:23+01	33524121	Wohnungsboerse
950	2023-12-14 12:27:26+01	33298728	Wohnungsboerse
535	2023-12-14 12:27:29+01	33674043	Wohnungsboerse
1950	2023-12-14 12:27:32+01	33308983	Wohnungsboerse
740	2023-12-14 12:27:34+01	33703442	Wohnungsboerse
844.5	2023-12-14 12:27:37+01	33445534	Wohnungsboerse
790	2023-12-14 12:27:39+01	33652853	Wohnungsboerse
430	2023-12-14 12:27:42+01	33654675	Wohnungsboerse
1013	2023-12-14 12:27:44+01	33661206	Wohnungsboerse
874.24	2023-12-14 12:27:47+01	33522714	Wohnungsboerse
550	2023-12-14 12:27:50+01	33701215	Wohnungsboerse
830	2023-12-14 12:27:53+01	32976985	Wohnungsboerse
880	2023-12-14 12:27:55+01	33645816	Wohnungsboerse
1990	2023-12-14 12:27:58+01	33437192	Wohnungsboerse
1400	2023-12-14 12:28:00+01	33435206	Wohnungsboerse
1891	2023-12-14 12:28:03+01	32697715	Wohnungsboerse
985	2023-12-14 12:28:05+01	32642467	Wohnungsboerse
1840	2023-12-14 12:28:08+01	32642458	Wohnungsboerse
1705	2023-12-14 12:28:11+01	33050991	Wohnungsboerse
2590	2023-12-14 12:28:13+01	33354570	Wohnungsboerse
2225	2023-12-14 12:28:15+01	32804194	Wohnungsboerse
965	2023-12-14 12:28:18+01	33489268	Wohnungsboerse
2031	2023-12-14 12:28:20+01	33539691	Wohnungsboerse
1200	2023-12-14 12:28:23+01	33691460	Wohnungsboerse
2550	2023-12-14 12:28:25+01	33606387	Wohnungsboerse
1450	2023-12-14 12:28:28+01	33506206	Wohnungsboerse
1400	2023-12-14 12:28:31+01	33565901	Wohnungsboerse
1400	2023-12-14 12:28:33+01	33578811	Wohnungsboerse
1470	2023-12-14 12:28:35+01	33582266	Wohnungsboerse
590	2023-12-14 12:28:38+01	33615243	Wohnungsboerse
1430	2023-12-14 12:28:41+01	33654824	Wohnungsboerse
698	2023-12-14 12:28:44+01	33677495	Wohnungsboerse
1450	2023-12-14 12:28:47+01	33347440	Wohnungsboerse
1400	2023-12-14 12:28:49+01	33686129	Wohnungsboerse
830	2023-12-14 12:28:52+01	33706960	Wohnungsboerse
900	2023-12-14 12:28:55+01	33697291	Wohnungsboerse
1950	2023-12-14 12:28:56+01	33727670	Wohnungsboerse
990	2023-12-14 12:28:58+01	33728161	Wohnungsboerse
725	2023-12-14 12:29:01+01	33729717	Wohnungsboerse
5300	2023-12-14 12:29:04+01	33627177	Wohnungsboerse
5400	2023-12-14 12:29:06+01	33631016	Wohnungsboerse
1300	2023-12-14 12:29:09+01	33438704	Wohnungsboerse
880	2023-12-14 12:29:12+01	33378242	Wohnungsboerse
5200	2023-12-14 12:29:14+01	33679123	Wohnungsboerse
720	2023-12-14 12:29:16+01	33693005	Wohnungsboerse
1200	2023-12-14 12:29:19+01	33506668	Wohnungsboerse
6850	2023-12-14 12:29:22+01	32747252	Wohnungsboerse
8480	2023-12-14 12:29:23+01	30752723	Wohnungsboerse
6850	2023-12-14 12:29:25+01	31193233	Wohnungsboerse
999	2023-12-14 12:29:28+01	33710405	Wohnungsboerse
1125	2023-12-14 12:29:30+01	33717380	Wohnungsboerse
1000	2023-12-14 12:29:32+01	33376062	Wohnungsboerse
1990	2023-12-14 12:29:35+01	33623338	Wohnungsboerse
790	2023-12-14 12:29:37+01	33649987	Wohnungsboerse
750	2023-12-14 12:29:40+01	33662864	Wohnungsboerse
920	2023-12-14 12:29:42+01	33223803	Wohnungsboerse
600	2023-12-14 12:29:44+01	33580297	Wohnungsboerse
1100	2023-12-14 12:29:46+01	33701328	Wohnungsboerse
660	2023-12-14 12:29:48+01	33701324	Wohnungsboerse
1512	2023-12-14 12:29:49+01	33705276	Wohnungsboerse
950	2023-12-14 12:29:50+01	33710692	Wohnungsboerse
1160	2023-12-14 12:29:53+01	33717867	Wohnungsboerse
450	2023-12-14 12:29:55+01	33720562	Wohnungsboerse
1200	2023-12-14 12:29:58+01	33727767	Wohnungsboerse
1440	2023-12-14 12:30:01+01	33730009	Wohnungsboerse
770	2023-12-14 12:30:04+01	33623692	Wohnungsboerse
765	2023-12-14 12:30:05+01	33731510	Wohnungsboerse
650	2023-12-14 12:30:06+01	33284573	Wohnungsboerse
850	2023-12-14 12:30:08+01	33067537	Wohnungsboerse
665	2023-12-14 12:30:10+01	33464631	Wohnungsboerse
580	2023-12-14 12:30:13+01	33548846	Wohnungsboerse
800	2023-12-14 12:30:16+01	33509761	Wohnungsboerse
850	2023-12-14 12:30:18+01	33663487	Wohnungsboerse
890	2023-12-14 12:30:20+01	33706807	Wohnungsboerse
885	2023-12-14 12:30:23+01	33716067	Wohnungsboerse
730	2023-12-14 12:30:25+01	33693114	Wohnungsboerse
800	2023-12-14 12:30:28+01	33686572	Wohnungsboerse
864	2023-12-14 12:30:29+01	33720792	Wohnungsboerse
709	2023-12-14 12:30:31+01	33720865	Wohnungsboerse
750	2023-12-14 12:30:34+01	33681682	Wohnungsboerse
275	2023-12-14 12:30:37+01	33703540	Wohnungsboerse
800	2023-12-14 12:30:39+01	33703578	Wohnungsboerse
295	2023-12-14 12:30:41+01	33704509	Wohnungsboerse
799.81	2023-12-14 12:30:44+01	33713452	Wohnungsboerse
1100	2023-12-14 12:30:46+01	33715994	Wohnungsboerse
590	2023-12-14 12:30:48+01	33716268	Wohnungsboerse
630	2023-12-14 12:30:51+01	33719548	Wohnungsboerse
728	2023-12-14 12:30:53+01	33726485	Wohnungsboerse
1200	2023-12-14 12:30:56+01	33729894	Wohnungsboerse
880	2023-12-14 12:30:59+01	33731225	Wohnungsboerse
678	2023-12-14 12:31:01+01	33733242	Wohnungsboerse
1155	2023-12-14 12:31:06+01	33734508	Wohnungsboerse
430	2023-12-14 12:31:07+01	33648664	Wohnungsboerse
810	2023-12-14 12:31:08+01	33734582	Wohnungsboerse
941.83	2023-12-14 12:31:10+01	33522747	Wohnungsboerse
700	2023-12-14 12:31:12+01	33579780	Wohnungsboerse
570	2023-12-14 12:31:14+01	33662910	Wohnungsboerse
845	2023-12-14 12:31:17+01	33693548	Wohnungsboerse
895	2023-12-14 12:31:19+01	33696598	Wohnungsboerse
1315	2023-12-14 12:31:21+01	33583884	Wohnungsboerse
1054.1	2023-12-14 12:31:24+01	33713773	Wohnungsboerse
1167.44	2023-12-14 12:31:26+01	33716142	Wohnungsboerse
1083.99	2023-12-14 12:31:29+01	33716129	Wohnungsboerse
640	2023-12-14 12:31:32+01	33386081	Wohnungsboerse
690	2023-12-14 12:31:34+01	33717797	Wohnungsboerse
500	2023-12-14 12:31:37+01	33720897	Wohnungsboerse
627	2023-12-14 12:31:39+01	33726737	Wohnungsboerse
650	2023-12-14 12:31:42+01	33733307	Wohnungsboerse
600	2023-12-14 12:31:45+01	33708444	Wohnungsboerse
2800	2023-12-14 12:31:48+01	33717668	Wohnungsboerse
1056	2023-12-14 12:31:49+01	33719295	Wohnungsboerse
1700	2023-12-14 12:31:52+01	33695459	Wohnungsboerse
980	2023-12-14 12:31:54+01	33720505	Wohnungsboerse
950	2023-12-14 12:31:56+01	33664586	Wohnungsboerse
730	2023-12-14 12:31:59+01	33720686	Wohnungsboerse
1500	2023-12-14 12:32:01+01	33724203	Wohnungsboerse
660	2023-12-14 12:32:04+01	33726343	Wohnungsboerse
1000	2023-12-14 12:32:06+01	33727914	Wohnungsboerse
3950	2023-12-14 12:32:09+01	33707626	Wohnungsboerse
500	2023-12-14 12:32:11+01	33733379	Wohnungsboerse
590	2023-12-14 12:32:14+01	33733540	Wohnungsboerse
510	2023-12-14 12:32:16+01	33733794	Wohnungsboerse
700	2023-12-14 12:32:19+01	33477583	Wohnungsboerse
1300	2023-12-14 12:32:21+01	31823448	Wohnungsboerse
850	2023-12-14 12:32:23+01	33720659	Wohnungsboerse
590	2023-12-14 12:32:26+01	33495917	Wohnungsboerse
440	2023-12-14 12:32:28+01	33674551	Wohnungsboerse
620	2023-12-14 12:32:30+01	33675927	Wohnungsboerse
599	2023-12-14 12:32:33+01	33677866	Wohnungsboerse
595	2023-12-14 12:32:35+01	33671854	Wohnungsboerse
573	2023-12-14 12:32:36+01	33675677	Wohnungsboerse
741	2023-12-14 12:32:38+01	33686561	Wohnungsboerse
850	2023-12-14 12:32:41+01	33688577	Wohnungsboerse
810	2023-12-14 12:32:44+01	33692021	Wohnungsboerse
1300	2023-12-14 12:32:45+01	33433016	Wohnungsboerse
720	2023-12-14 12:32:48+01	33701525	Wohnungsboerse
660	2023-12-14 12:32:51+01	33644575	Wohnungsboerse
650	2023-12-14 12:32:53+01	33716140	Wohnungsboerse
1060	2023-12-14 12:32:56+01	33481648	Wohnungsboerse
726.98	2023-12-14 12:32:58+01	33717747	Wohnungsboerse
2000	2023-12-14 12:33:01+01	33717778	Wohnungsboerse
400	2023-12-14 12:33:03+01	33719454	Wohnungsboerse
1400	2023-12-14 12:33:06+01	33721077	Wohnungsboerse
1380	2023-12-14 12:33:07+01	33722674	Wohnungsboerse
1918.4	2023-12-14 12:33:10+01	33629227	Wohnungsboerse
4385	2023-12-14 12:33:12+01	33724043	Wohnungsboerse
990	2023-12-14 12:33:14+01	33700861	Wohnungsboerse
650	2023-12-14 12:33:16+01	33729739	Wohnungsboerse
1150	2023-12-14 12:33:19+01	33729885	Wohnungsboerse
2900	2023-12-14 12:33:21+01	33730022	Wohnungsboerse
1645	2023-12-14 12:33:24+01	33731005	Wohnungsboerse
924.09	2023-12-14 12:33:26+01	33731589	Wohnungsboerse
1149.09	2023-12-14 12:33:29+01	33731588	Wohnungsboerse
1100	2023-12-14 12:33:31+01	33704470	Wohnungsboerse
1100	2023-12-14 12:33:34+01	33705960	Wohnungsboerse
1020.5	2023-12-14 12:33:36+01	33709346	Wohnungsboerse
600	2023-12-14 12:33:38+01	33662860	Wohnungsboerse
529	2023-12-14 12:33:41+01	33716085	Wohnungsboerse
580	2023-12-14 12:33:43+01	33717499	Wohnungsboerse
750	2023-12-14 12:33:46+01	33719697	Wohnungsboerse
998	2023-12-14 12:33:47+01	33722757	Wohnungsboerse
998	2023-12-14 12:33:49+01	33722774	Wohnungsboerse
830	2023-12-14 12:33:51+01	33562493	Wohnungsboerse
717	2023-12-14 12:33:53+01	33726469	Wohnungsboerse
1100	2023-12-14 12:33:56+01	33727666	Wohnungsboerse
1200	2023-12-14 12:33:58+01	33733317	Wohnungsboerse
402	2023-12-14 12:34:00+01	33731028	Wohnungsboerse
1950	2023-12-14 12:34:03+01	33320934	Wohnungsboerse
1640	2023-12-14 12:34:06+01	32877350	Wohnungsboerse
1100	2023-12-14 12:34:09+01	33397960	Wohnungsboerse
1100	2023-12-14 12:34:11+01	33008456	Wohnungsboerse
1360	2023-12-14 12:34:13+01	33648905	Wohnungsboerse
1950	2023-12-14 12:34:16+01	33683184	Wohnungsboerse
505	2023-12-14 12:34:18+01	33480003	Wohnungsboerse
595	2023-12-14 12:34:20+01	33675892	Wohnungsboerse
1750	2023-12-14 12:34:23+01	33686270	Wohnungsboerse
570	2023-12-14 12:34:26+01	33724294	Wohnungsboerse
385	2023-12-14 12:34:28+01	33726319	Wohnungsboerse
600	2023-12-14 12:34:30+01	33726557	Wohnungsboerse
1236	2023-12-14 12:34:32+01	33726682	Wohnungsboerse
767	2023-12-14 12:34:35+01	33728018	Wohnungsboerse
1300	2023-12-14 12:34:38+01	33497707	Wohnungsboerse
830	2023-12-14 12:34:41+01	33729737	Wohnungsboerse
720	2023-12-14 12:34:43+01	33729935	Wohnungsboerse
905	2023-12-14 12:34:46+01	33729947	Wohnungsboerse
825	2023-12-14 12:34:49+01	33733341	Wohnungsboerse
1000	2023-12-14 12:34:52+01	33733420	Wohnungsboerse
860	2023-12-14 12:34:54+01	33733573	Wohnungsboerse
599	2023-12-14 12:34:56+01	33733671	Wohnungsboerse
800	2023-12-14 12:35:02+01	33086103	Wohnungsboerse
955.79	2023-12-14 12:35:02+01	33594334	Wohnungsboerse
974.95	2023-12-14 12:35:05+01	33600514	Wohnungsboerse
810	2023-12-14 12:35:07+01	33254648	Wohnungsboerse
985	2023-12-14 12:35:10+01	33670075	Wohnungsboerse
634.52	2023-12-14 12:35:12+01	33681580	Wohnungsboerse
490	2023-12-14 12:35:15+01	33693051	Wohnungsboerse
1251.78	2023-12-14 12:35:18+01	33703455	Wohnungsboerse
450	2023-12-14 12:35:21+01	33660225	Wohnungsboerse
435	2023-12-14 12:35:23+01	33708437	Wohnungsboerse
560	2023-12-14 12:35:26+01	33717289	Wohnungsboerse
800	2023-12-14 12:35:29+01	28806724	Wohnungsboerse
602	2023-12-14 12:35:31+01	33727614	Wohnungsboerse
1080	2023-12-14 12:35:33+01	33735070	Wohnungsboerse
924	2023-12-14 12:35:35+01	33522771	Wohnungsboerse
2150	2023-12-14 12:35:38+01	33640807	Wohnungsboerse
1550	2023-12-14 12:35:40+01	32853522	Wohnungsboerse
1050	2023-12-14 12:35:43+01	33679734	Wohnungsboerse
920	2023-12-14 12:35:44+01	33690170	Wohnungsboerse
888.71	2023-12-14 12:35:46+01	33703392	Wohnungsboerse
1580	2023-12-14 12:35:49+01	33705811	Wohnungsboerse
900	2023-12-14 12:35:51+01	33708228	Wohnungsboerse
1280	2023-12-14 12:35:52+01	33709536	Wohnungsboerse
1000	2023-12-14 12:35:55+01	33710407	Wohnungsboerse
1890	2023-12-14 12:35:57+01	32728992	Wohnungsboerse
1890	2023-12-14 12:36:00+01	32728991	Wohnungsboerse
1790	2023-12-14 12:36:02+01	32728990	Wohnungsboerse
1200	2023-12-14 12:36:05+01	33726711	Wohnungsboerse
8500	2023-12-14 12:36:08+01	33196281	Wohnungsboerse
1800	2023-12-14 12:36:10+01	32817541	Wohnungsboerse
1379.88	2023-12-14 12:36:13+01	33445819	Wohnungsboerse
1684.63	2023-12-14 12:36:16+01	33445857	Wohnungsboerse
2950	2023-12-14 12:36:18+01	33455178	Wohnungsboerse
700	2023-12-14 12:36:20+01	33501793	Wohnungsboerse
2770	2023-12-14 12:36:22+01	33347939	Wohnungsboerse
1850	2023-12-14 12:36:25+01	33196527	Wohnungsboerse
797.84	2023-12-14 12:36:27+01	33649071	Wohnungsboerse
4750	2023-12-14 12:36:30+01	33688877	Wohnungsboerse
650	2023-12-14 12:36:31+01	33705317	Wohnungsboerse
890	2023-12-14 12:36:34+01	33709534	Wohnungsboerse
797.84	2023-12-14 12:36:36+01	33710530	Wohnungsboerse
800	2023-12-14 12:37:20+01	33528588	Wohnungsboerse
549.88	2023-12-14 12:37:23+01	33600602	Wohnungsboerse
959	2023-12-14 12:37:25+01	32816215	Wohnungsboerse
750.95	2023-12-14 12:37:28+01	33596800	Wohnungsboerse
660	2023-12-14 12:37:30+01	33731607	Wohnungsboerse
610.44	2023-12-14 12:37:33+01	33400003	Wohnungsboerse
1900	2023-12-14 12:37:35+01	31394882	Wohnungsboerse
710	2023-12-14 12:37:37+01	33720783	Wohnungsboerse
2700	2023-12-14 12:37:39+01	33449689	Wohnungsboerse
1190	2023-12-14 12:37:42+01	33601786	Wohnungsboerse
839.16	2023-12-14 12:37:45+01	33402808	Wohnungsboerse
695	2023-12-14 12:37:47+01	33473469	Wohnungsboerse
1150	2023-12-14 12:37:49+01	33663485	Wohnungsboerse
1100	2023-12-14 12:37:52+01	31675590	Wohnungsboerse
1495	2023-12-14 12:37:54+01	33540487	Wohnungsboerse
577.92	2023-12-14 12:37:56+01	33682967	Wohnungsboerse
3300	2023-12-14 12:37:59+01	33598493	Wohnungsboerse
1830	2023-12-14 12:38:01+01	33568443	Wohnungsboerse
1800	2023-12-14 12:38:03+01	33675316	Wohnungsboerse
1450	2023-12-14 12:38:06+01	33608727	Wohnungsboerse
1700	2023-12-14 12:38:09+01	33692109	Wohnungsboerse
955	2023-12-14 12:38:12+01	33696812	Wohnungsboerse
1200	2023-12-14 12:38:14+01	33705388	Wohnungsboerse
840	2023-12-14 12:38:17+01	33733258	Wohnungsboerse
1590	2023-12-14 12:38:19+01	33686399	Wohnungsboerse
530.6	2023-12-14 12:38:21+01	33691732	Wohnungsboerse
992.46	2023-12-14 12:38:24+01	33691726	Wohnungsboerse
1875	2023-12-14 12:38:27+01	32976977	Wohnungsboerse
1200	2023-12-14 12:38:29+01	33695528	Wohnungsboerse
1121.63	2023-12-14 12:38:31+01	33691710	Wohnungsboerse
750	2023-12-14 12:38:34+01	33701019	Wohnungsboerse
540	2023-12-14 12:38:36+01	33705398	Wohnungsboerse
670	2023-12-14 12:38:38+01	33710474	Wohnungsboerse
1100	2023-12-14 12:38:40+01	33506341	Wohnungsboerse
920	2023-12-14 12:38:42+01	29314952	Wohnungsboerse
650	2023-12-14 12:38:45+01	29317989	Wohnungsboerse
1200	2023-12-14 12:38:48+01	29631528	Wohnungsboerse
980	2023-12-14 12:38:51+01	33731462	Wohnungsboerse
1450	2023-12-14 12:38:53+01	33623140	Wohnungsboerse
1795	2023-12-14 12:38:55+01	33540488	Wohnungsboerse
650	2023-12-14 12:38:58+01	33724440	Wohnungsboerse
750	2023-12-14 12:39:01+01	33734491	Wohnungsboerse
1168.83	2023-12-14 12:39:03+01	33384509	Wohnungsboerse
684	2023-12-14 12:39:05+01	27035171	Wohnungsboerse
1348	2023-12-14 12:39:08+01	33425850	Wohnungsboerse
1064	2023-12-14 12:39:10+01	32820355	Wohnungsboerse
1262.17	2023-12-14 12:39:13+01	33450063	Wohnungsboerse
1300	2023-12-14 12:39:15+01	33455197	Wohnungsboerse
1272.31	2023-12-14 12:39:17+01	33630924	Wohnungsboerse
1158.43	2023-12-14 12:39:20+01	33650288	Wohnungsboerse
1534	2023-12-14 12:39:23+01	33646337	Wohnungsboerse
1375	2023-12-14 12:39:26+01	33654290	Wohnungsboerse
1205	2023-12-14 12:39:28+01	27088008	Wohnungsboerse
780	2023-12-14 12:39:30+01	33681987	Wohnungsboerse
1066	2023-12-14 12:39:31+01	33731545	Wohnungsboerse
575	2023-12-14 12:39:33+01	33700943	Wohnungsboerse
1450	2023-12-14 12:39:36+01	33630752	Wohnungsboerse
627	2023-12-14 12:39:38+01	33710483	Wohnungsboerse
580	2023-12-14 12:39:41+01	33731188	Wohnungsboerse
828.2	2023-12-14 12:39:44+01	33396009	Wohnungsboerse
920	2023-12-14 12:39:47+01	33627326	Wohnungsboerse
630	2023-12-14 12:39:49+01	33237999	Wohnungsboerse
1850	2023-12-14 12:39:52+01	33129082	Wohnungsboerse
1450	2023-12-14 12:39:54+01	33454997	Wohnungsboerse
1150	2023-12-14 12:39:57+01	33579993	Wohnungsboerse
1290	2023-12-14 12:40:00+01	33629353	Wohnungsboerse
1450	2023-12-14 12:40:03+01	32375748	Wohnungsboerse
1200	2023-12-14 12:40:05+01	33636840	Wohnungsboerse
790	2023-12-14 12:40:08+01	33696980	Wohnungsboerse
970	2023-12-14 12:40:10+01	33708525	Wohnungsboerse
650	2023-12-14 12:40:13+01	33719818	Wohnungsboerse
720	2023-12-14 12:40:15+01	33487464	Wohnungsboerse
710	2023-12-14 12:40:17+01	33722913	Wohnungsboerse
650	2023-12-14 12:40:20+01	33724540	Wohnungsboerse
750	2023-12-14 12:40:22+01	33621429	Wohnungsboerse
900	2023-12-14 12:40:25+01	33627163	Wohnungsboerse
480	2023-12-14 12:40:28+01	33650359	Wohnungsboerse
750	2023-12-14 12:40:31+01	33657206	Wohnungsboerse
665	2023-12-14 12:40:33+01	33672283	Wohnungsboerse
637	2023-12-14 12:40:36+01	33682976	Wohnungsboerse
720	2023-12-14 12:40:39+01	33465765	Wohnungsboerse
1400	2023-12-14 12:40:42+01	33708318	Wohnungsboerse
350	2023-12-14 12:40:44+01	33710499	Wohnungsboerse
750	2023-12-14 12:40:46+01	33719635	Wohnungsboerse
620	2023-12-14 12:40:48+01	33675627	Wohnungsboerse
830	2023-12-14 12:40:51+01	33727613	Wohnungsboerse
1600	2023-12-14 12:40:54+01	33709668	Wohnungsboerse
1050	2023-12-14 12:40:56+01	33731246	Wohnungsboerse
830	2023-12-14 12:40:59+01	33731602	Wohnungsboerse
1395	2023-12-14 12:41:02+01	33735060	Wohnungsboerse
598	2023-12-14 12:41:04+01	33735057	Wohnungsboerse
1675	2023-12-14 12:41:07+01	33720500	Wohnungsboerse
488	2023-12-14 12:41:09+01	33735063	Wohnungsboerse
413	2023-12-14 12:41:12+01	33623586	Wohnungsboerse
459	2023-12-14 12:41:14+01	33579929	Wohnungsboerse
545	2023-12-14 12:41:16+01	33386056	Wohnungsboerse
660	2023-12-14 12:41:19+01	32846582	Wohnungsboerse
660	2023-12-14 12:41:21+01	33735068	Wohnungsboerse
800	2023-12-14 12:41:24+01	33616695	Wohnungsboerse
680	2023-12-14 12:41:26+01	33695572	Wohnungsboerse
300	2023-12-14 12:41:27+01	33735084	Wohnungsboerse
750.95	2023-12-14 12:41:30+01	33716146	Wohnungsboerse
872.49	2023-12-14 12:41:33+01	33598517	Wohnungsboerse
645	2023-12-14 12:41:35+01	33604328	Wohnungsboerse
1773.39	2023-12-14 12:41:36+01	33598511	Wohnungsboerse
1250	2023-12-14 12:41:38+01	33621867	Wohnungsboerse
850	2023-12-14 12:41:41+01	33604309	Wohnungsboerse
415	2023-12-14 12:41:42+01	33555182	Wohnungsboerse
650	2023-12-14 12:41:44+01	33672119	Wohnungsboerse
490	2023-12-14 12:41:46+01	33645974	Wohnungsboerse
976	2023-12-14 12:41:49+01	33675587	Wohnungsboerse
720	2023-12-14 12:41:52+01	33584182	Wohnungsboerse
1100.59	2023-12-14 12:41:54+01	33598459	Wohnungsboerse
575	2023-12-14 12:41:56+01	33667732	Wohnungsboerse
1600	2023-12-14 12:41:58+01	33717259	Wohnungsboerse
830	2023-12-14 12:42:01+01	33731498	Wohnungsboerse
600	2023-12-14 12:42:04+01	33532119	Wohnungsboerse
1137.36	2023-12-14 12:42:06+01	33435007	Wohnungsboerse
510.19	2023-12-14 12:42:09+01	33648739	Wohnungsboerse
600	2023-12-14 12:42:11+01	33614961	Wohnungsboerse
900	2023-12-14 12:42:14+01	33654518	Wohnungsboerse
869	2023-12-14 12:42:17+01	33344003	Wohnungsboerse
441.44	2023-12-14 12:42:19+01	33674342	Wohnungsboerse
570	2023-12-14 12:42:22+01	33686150	Wohnungsboerse
597.44	2023-12-14 12:42:25+01	33695695	Wohnungsboerse
1450	2023-12-14 12:42:27+01	33451563	Wohnungsboerse
495	2023-12-14 12:42:30+01	33705337	Wohnungsboerse
636	2023-12-14 12:42:32+01	33487646	Wohnungsboerse
715	2023-12-14 12:42:35+01	33729811	Wohnungsboerse
310	2023-12-14 12:42:37+01	33733230	Wohnungsboerse
810	2023-12-14 12:43:16+01	33670520	Wohnungsboerse
1200	2023-12-14 12:43:18+01	33715925	Wohnungsboerse
750	2023-12-14 12:43:21+01	33710498	Wohnungsboerse
1160	2023-12-14 12:43:23+01	33605697	Wohnungsboerse
760	2023-12-14 12:43:25+01	33723052	Wohnungsboerse
1100	2023-12-14 12:43:28+01	33704447	Wohnungsboerse
614	2023-12-14 12:43:30+01	33051217	Wohnungsboerse
1000	2023-12-14 12:43:31+01	33701313	Wohnungsboerse
3690	2023-12-14 12:43:34+01	33601618	Wohnungsboerse
977.5	2023-12-14 12:43:36+01	32937445	Wohnungsboerse
950	2023-12-14 12:43:38+01	33715853	Wohnungsboerse
995	2023-12-14 12:43:40+01	33619052	Wohnungsboerse
2560	2023-12-14 12:43:43+01	33493623	Wohnungsboerse
590	2023-12-14 12:43:46+01	26640415	Wohnungsboerse
1750	2023-12-14 12:43:48+01	33571784	Wohnungsboerse
800	2023-12-14 12:43:51+01	32111553	Wohnungsboerse
465.65	2023-12-14 12:43:54+01	33254653	Wohnungsboerse
640	2023-12-14 12:43:57+01	33299372	Wohnungsboerse
2925	2023-12-14 12:44:00+01	33259857	Wohnungsboerse
947.16	2023-12-14 12:44:03+01	33304400	Wohnungsboerse
1590	2023-12-14 12:44:05+01	33329023	Wohnungsboerse
752.77	2023-12-14 12:44:08+01	33432779	Wohnungsboerse
740	2023-12-14 12:44:10+01	33298889	Wohnungsboerse
735	2023-12-14 12:44:13+01	33650244	Wohnungsboerse
1800	2023-12-14 12:44:16+01	33593060	Wohnungsboerse
1350	2023-12-14 12:44:19+01	33654580	Wohnungsboerse
3050	2023-12-14 12:44:21+01	33652461	Wohnungsboerse
3050	2023-12-14 12:44:23+01	33593062	Wohnungsboerse
815.81	2023-12-14 12:44:26+01	33727930	Wohnungsboerse
455	2023-12-14 12:44:28+01	33729783	Wohnungsboerse
550	2023-12-14 12:44:31+01	33633812	Wohnungsboerse
710	2023-12-14 12:44:33+01	33347397	Wohnungsboerse
520	2023-12-14 12:44:36+01	33667601	Wohnungsboerse
1650	2023-12-14 12:44:39+01	33677783	Wohnungsboerse
1050	2023-12-14 12:44:42+01	33688535	Wohnungsboerse
650	2023-12-14 12:44:43+01	33693182	Wohnungsboerse
832	2023-12-14 12:44:45+01	33706010	Wohnungsboerse
520	2023-12-14 12:44:48+01	33719317	Wohnungsboerse
675	2023-12-14 12:44:50+01	33715691	Wohnungsboerse
690	2023-12-14 12:44:53+01	33682555	Wohnungsboerse
1540	2023-12-14 12:44:55+01	32803920	Wohnungsboerse
4200	2023-12-14 12:44:58+01	33648553	Wohnungsboerse
730	2023-12-14 12:44:59+01	33658070	Wohnungsboerse
420	2023-12-14 12:45:01+01	33658059	Wohnungsboerse
590	2023-12-14 12:45:04+01	26800673	Wohnungsboerse
810	2023-12-14 12:45:06+01	33198024	Wohnungsboerse
950	2023-12-14 12:45:09+01	33333966	Wohnungsboerse
890	2023-12-14 12:45:11+01	33103145	Wohnungsboerse
700	2023-12-14 12:45:13+01	33568372	Wohnungsboerse
970	2023-12-14 12:45:16+01	33609058	Wohnungsboerse
915	2023-12-14 12:45:19+01	33667986	Wohnungsboerse
950	2023-12-14 12:45:22+01	33636749	Wohnungsboerse
670	2023-12-14 12:45:24+01	33717322	Wohnungsboerse
1568.43	2023-12-14 12:45:26+01	33402892	Wohnungsboerse
1350	2023-12-14 12:45:29+01	33674429	Wohnungsboerse
580	2023-12-14 12:45:31+01	33691764	Wohnungsboerse
1320	2023-12-14 12:45:34+01	33727796	Wohnungsboerse
1600	2023-12-14 12:45:37+01	33699228	Wohnungsboerse
1199	2023-12-14 12:45:39+01	33439092	Wohnungsboerse
1350	2023-12-14 12:45:42+01	32885147	Wohnungsboerse
1220	2023-12-14 12:45:44+01	33703673	Wohnungsboerse
910	2023-12-14 12:45:46+01	33707630	Wohnungsboerse
615	2023-12-14 12:45:52+01	33715951	Wohnungsboerse
480	2023-12-14 12:45:54+01	33717215	Wohnungsboerse
1034	2023-12-14 12:46:02+01	32705183	Wohnungsboerse
1500	2023-12-14 12:46:02+01	33717408	Wohnungsboerse
715	2023-12-14 12:46:02+01	33720495	Wohnungsboerse
1330	2023-12-14 12:46:02+01	33726412	Wohnungsboerse
650	2023-12-14 12:46:05+01	33728224	Wohnungsboerse
604	2023-12-14 12:46:07+01	33731275	Wohnungsboerse
700	2023-12-14 12:46:10+01	33731362	Wohnungsboerse
450	2023-12-14 12:46:11+01	33734830	Wohnungsboerse
675	2023-12-14 12:46:14+01	33716389	Wohnungsboerse
1620	2023-12-14 12:46:17+01	33717531	Wohnungsboerse
435	2023-12-14 12:46:19+01	33717626	Wohnungsboerse
890	2023-12-14 12:46:22+01	33719442	Wohnungsboerse
500	2023-12-14 12:46:24+01	33719712	Wohnungsboerse
950	2023-12-14 12:46:27+01	33471247	Wohnungsboerse
1235	2023-12-14 12:46:29+01	33720919	Wohnungsboerse
2350	2023-12-14 12:46:31+01	33263620	Wohnungsboerse
990	2023-12-14 12:46:34+01	33722567	Wohnungsboerse
954.97	2023-12-14 12:46:36+01	33229616	Wohnungsboerse
340	2023-12-14 12:46:39+01	33726747	Wohnungsboerse
1500	2023-12-14 12:46:42+01	33733496	Wohnungsboerse
780	2023-12-14 12:46:45+01	33734709	Wohnungsboerse
1728	2023-12-14 12:46:47+01	33616369	Wohnungsboerse
1450	2023-12-14 12:46:49+01	33351683	Wohnungsboerse
1450	2023-12-14 12:46:52+01	33619038	Wohnungsboerse
1620	2023-12-14 12:46:55+01	33650436	Wohnungsboerse
1340	2023-12-14 12:46:58+01	33650435	Wohnungsboerse
1560	2023-12-14 12:47:01+01	33650434	Wohnungsboerse
1610	2023-12-14 12:47:03+01	33650433	Wohnungsboerse
870	2023-12-14 12:47:06+01	33650432	Wohnungsboerse
1435.5	2023-12-14 12:47:09+01	33677673	Wohnungsboerse
1700	2023-12-14 12:47:12+01	33646382	Wohnungsboerse
575	2023-12-14 12:47:14+01	33706060	Wohnungsboerse
795	2023-12-14 12:47:17+01	33720931	Wohnungsboerse
950	2023-12-14 12:47:20+01	33542810	Wohnungsboerse
790	2023-12-14 12:47:23+01	33392135	Wohnungsboerse
2480	2023-12-14 12:47:25+01	33654905	Wohnungsboerse
1625	2023-12-14 12:47:26+01	33448480	Wohnungsboerse
810.81	2023-12-14 12:47:29+01	33002621	Wohnungsboerse
955.13	2023-12-14 12:47:32+01	33701346	Wohnungsboerse
500	2023-12-14 12:47:33+01	33706042	Wohnungsboerse
1471.6	2023-12-14 12:47:36+01	33264606	Wohnungsboerse
410	2023-12-14 12:47:38+01	33709514	Wohnungsboerse
500	2023-12-14 12:47:41+01	33713828	Wohnungsboerse
850	2023-12-14 12:47:43+01	33713915	Wohnungsboerse
760	2023-12-14 12:47:46+01	33688909	Wohnungsboerse
1564	2023-12-14 12:47:49+01	33720882	Wohnungsboerse
610	2023-12-14 12:47:51+01	33726435	Wohnungsboerse
1625	2023-12-14 12:47:54+01	33703775	Wohnungsboerse
1100	2023-12-14 12:47:56+01	33727709	Wohnungsboerse
900	2023-12-14 12:47:59+01	33727806	Wohnungsboerse
600	2023-12-14 12:48:01+01	33733301	Wohnungsboerse
1140	2023-12-14 12:48:04+01	33734804	Wohnungsboerse
459.38	2023-12-14 12:48:06+01	33636857	Wohnungsboerse
467.6	2023-12-14 12:48:09+01	33674263	Wohnungsboerse
535.43	2023-12-14 12:48:11+01	33684976	Wohnungsboerse
850	2023-12-14 12:48:14+01	33704596	Wohnungsboerse
1998	2023-12-14 12:48:16+01	33708296	Wohnungsboerse
1270	2023-12-14 12:48:19+01	33519879	Wohnungsboerse
593.38	2023-12-14 12:48:21+01	33493230	Wohnungsboerse
1148	2023-12-14 12:48:23+01	33716093	Wohnungsboerse
1270	2023-12-14 12:48:26+01	33717156	Wohnungsboerse
1342.16	2023-12-14 12:48:29+01	33717540	Wohnungsboerse
788.55	2023-12-14 12:48:31+01	33717539	Wohnungsboerse
693.21	2023-12-14 12:48:33+01	33717538	Wohnungsboerse
1186.64	2023-12-14 12:48:36+01	33717537	Wohnungsboerse
751.5	2023-12-14 12:48:37+01	33717536	Wohnungsboerse
650	2023-12-14 12:48:40+01	33717857	Wohnungsboerse
880.05	2023-12-14 12:48:43+01	33703393	Wohnungsboerse
1468.95	2023-12-14 12:48:45+01	33717329	Wohnungsboerse
859	2023-12-14 12:48:48+01	33729744	Wohnungsboerse
681.31	2023-12-14 12:48:50+01	32824284	Wohnungsboerse
650	2023-12-14 12:48:52+01	33733664	Wohnungsboerse
1400	2023-12-14 12:48:54+01	33724139	Wohnungsboerse
1260	2023-12-14 12:48:57+01	33724179	Wohnungsboerse
600	2023-12-14 12:48:59+01	33724532	Wohnungsboerse
700	2023-12-14 12:49:01+01	33726445	Wohnungsboerse
1160	2023-12-14 12:49:04+01	33726512	Wohnungsboerse
465	2023-12-14 12:49:06+01	33727984	Wohnungsboerse
1250	2023-12-14 12:49:08+01	33539840	Wohnungsboerse
1725	2023-12-14 12:49:10+01	33730099	Wohnungsboerse
1370	2023-12-14 12:49:12+01	33733342	Wohnungsboerse
724.07	2023-12-14 12:49:15+01	33608544	Wohnungsboerse
1600	2023-12-14 12:49:18+01	33734507	Wohnungsboerse
419	2023-12-14 12:49:21+01	33734541	Wohnungsboerse
400	2023-12-14 12:49:23+01	33734557	Wohnungsboerse
1250	2023-12-14 12:49:25+01	33734885	Wohnungsboerse
1500	2023-12-14 12:49:28+01	33690212	Wohnungsboerse
620	2023-12-14 12:49:30+01	33527184	Wohnungsboerse
5500	2023-12-14 12:49:32+01	33696595	Wohnungsboerse
1930	2023-12-14 12:49:34+01	33703627	Wohnungsboerse
1700	2023-12-14 12:49:36+01	33667387	Wohnungsboerse
2225	2023-12-14 12:49:38+01	33650258	Wohnungsboerse
2525	2023-12-14 12:49:40+01	33670203	Wohnungsboerse
1385	2023-12-14 12:49:43+01	33719633	Wohnungsboerse
2995	2023-12-14 12:49:46+01	33720746	Wohnungsboerse
600	2023-12-14 12:49:48+01	33114294	Wohnungsboerse
565	2023-12-14 12:49:50+01	33724736	Wohnungsboerse
750	2023-12-14 12:49:53+01	33726775	Wohnungsboerse
800	2023-12-14 12:49:55+01	33731040	Wohnungsboerse
1198	2023-12-14 12:49:58+01	33731016	Wohnungsboerse
895	2023-12-14 12:50:01+01	33484313	Wohnungsboerse
885	2023-12-14 12:50:03+01	33662142	Wohnungsboerse
430	2023-12-14 12:50:06+01	33713792	Wohnungsboerse
700	2023-12-14 12:50:09+01	33715919	Wohnungsboerse
590	2023-12-14 12:50:12+01	33715912	Wohnungsboerse
280	2023-12-14 12:50:14+01	33717463	Wohnungsboerse
600	2023-12-14 12:50:17+01	33719345	Wohnungsboerse
857.3	2023-12-14 12:50:19+01	33594011	Wohnungsboerse
741	2023-12-14 12:50:21+01	33728020	Wohnungsboerse
460	2023-12-14 12:50:24+01	33723023	Wohnungsboerse
630	2023-12-14 12:50:26+01	33642253	Wohnungsboerse
630	2023-12-14 12:50:29+01	33731420	Wohnungsboerse
2920	2023-12-18 12:03:13+01	33022819	Wohnungsboerse
1760	2023-12-18 12:03:15+01	33524121	Wohnungsboerse
840	2023-12-18 12:03:18+01	33313054	Wohnungsboerse
1236	2023-12-18 12:03:21+01	33726682	Wohnungsboerse
1950	2023-12-18 12:03:24+01	33308983	Wohnungsboerse
998	2023-12-18 12:03:26+01	33722774	Wohnungsboerse
2900	2023-12-18 12:03:29+01	33730022	Wohnungsboerse
2500	2023-12-18 12:03:32+01	33526956	Wohnungsboerse
430	2023-12-18 12:03:35+01	33654675	Wohnungsboerse
500	2023-12-18 12:03:38+01	33733379	Wohnungsboerse
720	2023-12-18 12:03:40+01	32630083	Wohnungsboerse
630	2023-12-18 12:03:43+01	33719548	Wohnungsboerse
830	2023-12-18 12:03:46+01	32976985	Wohnungsboerse
970	2023-12-18 12:03:49+01	33574602	Wohnungsboerse
5400	2023-12-18 12:03:52+01	33631016	Wohnungsboerse
1400	2023-12-18 12:03:54+01	33565901	Wohnungsboerse
1891	2023-12-18 12:03:57+01	32697715	Wohnungsboerse
985	2023-12-18 12:04:02+01	32642467	Wohnungsboerse
1840	2023-12-18 12:04:03+01	32642458	Wohnungsboerse
1705	2023-12-18 12:04:05+01	33050991	Wohnungsboerse
2590	2023-12-18 12:04:08+01	33354570	Wohnungsboerse
2225	2023-12-18 12:04:11+01	32804194	Wohnungsboerse
965	2023-12-18 12:04:13+01	33489268	Wohnungsboerse
2031	2023-12-18 12:04:15+01	33539691	Wohnungsboerse
2550	2023-12-18 12:04:17+01	33606387	Wohnungsboerse
1400	2023-12-18 12:04:20+01	33578811	Wohnungsboerse
1470	2023-12-18 12:04:23+01	33582266	Wohnungsboerse
590	2023-12-18 12:04:26+01	33615243	Wohnungsboerse
1430	2023-12-18 12:04:28+01	33654824	Wohnungsboerse
698	2023-12-18 12:04:31+01	33677495	Wohnungsboerse
1450	2023-12-18 12:04:33+01	33347440	Wohnungsboerse
1400	2023-12-18 12:04:36+01	33686129	Wohnungsboerse
830	2023-12-18 12:04:38+01	33706960	Wohnungsboerse
1950	2023-12-18 12:04:41+01	33727670	Wohnungsboerse
990	2023-12-18 12:04:42+01	33728161	Wohnungsboerse
900	2023-12-18 12:04:44+01	33741743	Wohnungsboerse
700	2023-12-18 12:04:46+01	33743859	Wohnungsboerse
750	2023-12-18 12:04:49+01	33753345	Wohnungsboerse
1240	2023-12-18 12:04:52+01	33757028	Wohnungsboerse
1300	2023-12-18 12:04:54+01	33438704	Wohnungsboerse
880	2023-12-18 12:04:57+01	33378242	Wohnungsboerse
1200	2023-12-18 12:04:59+01	33506668	Wohnungsboerse
6850	2023-12-18 12:05:02+01	32747252	Wohnungsboerse
8480	2023-12-18 12:05:05+01	30752723	Wohnungsboerse
6850	2023-12-18 12:05:08+01	31193233	Wohnungsboerse
999	2023-12-18 12:05:10+01	33710405	Wohnungsboerse
1990	2023-12-18 12:05:12+01	33623338	Wohnungsboerse
1690	2023-12-18 12:05:15+01	33736800	Wohnungsboerse
1250	2023-12-18 12:05:17+01	33738195	Wohnungsboerse
1310	2023-12-18 12:05:19+01	33745648	Wohnungsboerse
875	2023-12-18 12:05:20+01	33750319	Wohnungsboerse
1300	2023-12-18 12:05:23+01	33510346	Wohnungsboerse
5200	2023-12-18 12:05:24+01	33679123	Wohnungsboerse
940	2023-12-18 12:05:27+01	33504339	Wohnungsboerse
871.94	2023-12-18 12:05:29+01	33059673	Wohnungsboerse
920	2023-12-18 12:05:32+01	33223803	Wohnungsboerse
600	2023-12-18 12:05:35+01	33580297	Wohnungsboerse
1100	2023-12-18 12:05:37+01	33701328	Wohnungsboerse
660	2023-12-18 12:05:39+01	33701324	Wohnungsboerse
950	2023-12-18 12:05:41+01	33710692	Wohnungsboerse
1160	2023-12-18 12:05:44+01	33717867	Wohnungsboerse
1200	2023-12-18 12:05:46+01	33727767	Wohnungsboerse
1440	2023-12-18 12:05:49+01	33730009	Wohnungsboerse
951	2023-12-18 12:05:51+01	33309501	Wohnungsboerse
1550	2023-12-18 12:05:54+01	33741574	Wohnungsboerse
990	2023-12-18 12:05:56+01	33745592	Wohnungsboerse
690	2023-12-18 12:05:58+01	33747792	Wohnungsboerse
650	2023-12-18 12:06:01+01	33284573	Wohnungsboerse
850	2023-12-18 12:06:04+01	33067537	Wohnungsboerse
665	2023-12-18 12:06:07+01	33464631	Wohnungsboerse
800	2023-12-18 12:06:10+01	33509761	Wohnungsboerse
890	2023-12-18 12:06:12+01	33706807	Wohnungsboerse
885	2023-12-18 12:06:14+01	33716067	Wohnungsboerse
730	2023-12-18 12:06:17+01	33693114	Wohnungsboerse
800	2023-12-18 12:06:20+01	33686572	Wohnungsboerse
709	2023-12-18 12:06:22+01	33720865	Wohnungsboerse
750	2023-12-18 12:06:24+01	33681682	Wohnungsboerse
864	2023-12-18 12:06:26+01	33720792	Wohnungsboerse
728	2023-12-18 12:06:28+01	33726485	Wohnungsboerse
880	2023-12-18 12:06:31+01	33731225	Wohnungsboerse
810	2023-12-18 12:06:34+01	33734582	Wohnungsboerse
540	2023-12-18 12:06:40+01	33736436	Wohnungsboerse
1200	2023-12-18 12:06:42+01	33729894	Wohnungsboerse
505	2023-12-18 12:06:44+01	33600681	Wohnungsboerse
550	2023-12-18 12:06:47+01	33743724	Wohnungsboerse
550	2023-12-18 12:06:49+01	33745681	Wohnungsboerse
275	2023-12-18 12:06:51+01	33747869	Wohnungsboerse
800	2023-12-18 12:06:54+01	33747906	Wohnungsboerse
295	2023-12-18 12:06:56+01	33748641	Wohnungsboerse
750	2023-12-18 12:06:59+01	33754069	Wohnungsboerse
1155	2023-12-18 12:07:02+01	33734508	Wohnungsboerse
874.24	2023-12-18 12:07:05+01	33522714	Wohnungsboerse
941.83	2023-12-18 12:07:07+01	33522747	Wohnungsboerse
700	2023-12-18 12:07:10+01	33579780	Wohnungsboerse
845	2023-12-18 12:07:12+01	33693548	Wohnungsboerse
1315	2023-12-18 12:07:14+01	33583884	Wohnungsboerse
1054.1	2023-12-18 12:07:17+01	33713773	Wohnungsboerse
1167.44	2023-12-18 12:07:20+01	33716142	Wohnungsboerse
1083.99	2023-12-18 12:07:23+01	33716129	Wohnungsboerse
640	2023-12-18 12:07:25+01	33386081	Wohnungsboerse
690	2023-12-18 12:07:28+01	33717797	Wohnungsboerse
500	2023-12-18 12:07:30+01	33720897	Wohnungsboerse
627	2023-12-18 12:07:33+01	33726737	Wohnungsboerse
1094.17	2023-12-18 12:07:35+01	33522726	Wohnungsboerse
650	2023-12-18 12:07:37+01	33733307	Wohnungsboerse
590	2023-12-18 12:07:39+01	33733540	Wohnungsboerse
510	2023-12-18 12:07:41+01	33733794	Wohnungsboerse
1150	2023-12-18 12:07:43+01	33737744	Wohnungsboerse
1280	2023-12-18 12:07:46+01	33743583	Wohnungsboerse
2850	2023-12-18 12:07:48+01	33707626	Wohnungsboerse
1200	2023-12-18 12:07:50+01	33745851	Wohnungsboerse
730	2023-12-18 12:07:54+01	33720686	Wohnungsboerse
680	2023-12-18 12:07:55+01	33748682	Wohnungsboerse
640	2023-12-18 12:07:57+01	33748757	Wohnungsboerse
740	2023-12-18 12:08:00+01	33748889	Wohnungsboerse
1220	2023-12-18 12:08:02+01	33750410	Wohnungsboerse
1013	2023-12-18 12:08:05+01	33661206	Wohnungsboerse
600	2023-12-18 12:08:07+01	33752594	Wohnungsboerse
880	2023-12-18 12:08:10+01	33754288	Wohnungsboerse
700	2023-12-18 12:08:12+01	33477583	Wohnungsboerse
1300	2023-12-18 12:08:14+01	31823448	Wohnungsboerse
850	2023-12-18 12:08:17+01	33720659	Wohnungsboerse
450	2023-12-18 12:08:19+01	33745807	Wohnungsboerse
850	2023-12-18 12:08:22+01	33615088	Wohnungsboerse
850	2023-12-18 12:08:24+01	33618934	Wohnungsboerse
870	2023-12-18 12:08:27+01	33646100	Wohnungsboerse
590	2023-12-18 12:08:30+01	33495917	Wohnungsboerse
620	2023-12-18 12:08:31+01	33675927	Wohnungsboerse
599	2023-12-18 12:08:33+01	33677866	Wohnungsboerse
595	2023-12-18 12:08:36+01	33671854	Wohnungsboerse
573	2023-12-18 12:08:38+01	33675677	Wohnungsboerse
741	2023-12-18 12:08:41+01	33686561	Wohnungsboerse
810	2023-12-18 12:08:43+01	33692021	Wohnungsboerse
1300	2023-12-18 12:08:45+01	33433016	Wohnungsboerse
720	2023-12-18 12:08:48+01	33701525	Wohnungsboerse
1060	2023-12-18 12:08:50+01	33481648	Wohnungsboerse
1030	2023-12-18 12:08:53+01	33741589	Wohnungsboerse
1180	2023-12-18 12:08:56+01	33736648	Wohnungsboerse
2997	2023-12-18 12:08:59+01	33736668	Wohnungsboerse
978	2023-12-18 12:09:01+01	33740565	Wohnungsboerse
1545	2023-12-18 12:09:03+01	33731005	Wohnungsboerse
870	2023-12-18 12:09:05+01	33748722	Wohnungsboerse
782	2023-12-18 12:09:07+01	33329001	Wohnungsboerse
737	2023-12-18 12:09:09+01	33341901	Wohnungsboerse
690	2023-12-18 12:09:11+01	33751418	Wohnungsboerse
899	2023-12-18 12:09:14+01	33700861	Wohnungsboerse
880	2023-12-18 12:09:16+01	33753148	Wohnungsboerse
2000	2023-12-18 12:09:19+01	33753183	Wohnungsboerse
1159	2023-12-18 12:09:22+01	33757002	Wohnungsboerse
1100	2023-12-18 12:09:25+01	33333764	Wohnungsboerse
510	2023-12-18 12:09:27+01	33757377	Wohnungsboerse
830	2023-12-18 12:09:29+01	33562493	Wohnungsboerse
717	2023-12-18 12:09:32+01	33726469	Wohnungsboerse
1200	2023-12-18 12:09:34+01	33733317	Wohnungsboerse
402	2023-12-18 12:09:36+01	33731028	Wohnungsboerse
600	2023-12-18 12:09:39+01	33532668	Wohnungsboerse
670	2023-12-18 12:09:42+01	33737866	Wohnungsboerse
950	2023-12-18 12:09:44+01	33737923	Wohnungsboerse
1100	2023-12-18 12:09:47+01	33727666	Wohnungsboerse
500	2023-12-18 12:09:50+01	33740265	Wohnungsboerse
699	2023-12-18 12:09:53+01	33745750	Wohnungsboerse
2100	2023-12-18 12:09:55+01	33747839	Wohnungsboerse
1100	2023-12-18 12:09:58+01	33749699	Wohnungsboerse
520	2023-12-18 12:10:01+01	33751930	Wohnungsboerse
800	2023-12-18 12:10:04+01	33752018	Wohnungsboerse
1950	2023-12-18 12:10:06+01	33320934	Wohnungsboerse
1640	2023-12-18 12:10:08+01	32877350	Wohnungsboerse
1100	2023-12-18 12:10:11+01	33397960	Wohnungsboerse
1100	2023-12-18 12:10:13+01	33008456	Wohnungsboerse
1360	2023-12-18 12:10:16+01	33648905	Wohnungsboerse
1950	2023-12-18 12:10:19+01	33683184	Wohnungsboerse
505	2023-12-18 12:10:22+01	33480003	Wohnungsboerse
595	2023-12-18 12:10:24+01	33675892	Wohnungsboerse
710	2023-12-18 12:10:28+01	33736551	Wohnungsboerse
767	2023-12-18 12:10:30+01	33728018	Wohnungsboerse
1300	2023-12-18 12:10:32+01	33497707	Wohnungsboerse
830	2023-12-18 12:10:35+01	33729737	Wohnungsboerse
720	2023-12-18 12:10:38+01	33729935	Wohnungsboerse
1000	2023-12-18 12:10:40+01	33733420	Wohnungsboerse
860	2023-12-18 12:10:42+01	33733573	Wohnungsboerse
599	2023-12-18 12:10:45+01	33733671	Wohnungsboerse
680	2023-12-18 12:10:47+01	33740210	Wohnungsboerse
625.39	2023-12-18 12:10:49+01	33741463	Wohnungsboerse
1800	2023-12-18 12:10:51+01	33741668	Wohnungsboerse
1750	2023-12-18 12:10:54+01	33654229	Wohnungsboerse
365	2023-12-18 12:10:57+01	33749666	Wohnungsboerse
515	2023-12-18 12:11:00+01	33750336	Wohnungsboerse
730	2023-12-18 12:11:02+01	33751468	Wohnungsboerse
1081	2023-12-18 12:11:05+01	33432833	Wohnungsboerse
900	2023-12-18 12:11:07+01	33225904	Wohnungsboerse
950	2023-12-18 12:11:09+01	33298728	Wohnungsboerse
800	2023-12-18 12:11:12+01	33086103	Wohnungsboerse
955.79	2023-12-18 12:11:14+01	33594334	Wohnungsboerse
810	2023-12-18 12:11:17+01	33254648	Wohnungsboerse
985	2023-12-18 12:11:19+01	33670075	Wohnungsboerse
490	2023-12-18 12:11:22+01	33693051	Wohnungsboerse
1251.78	2023-12-18 12:11:24+01	33703455	Wohnungsboerse
435	2023-12-18 12:11:27+01	33708437	Wohnungsboerse
560	2023-12-18 12:11:29+01	33717289	Wohnungsboerse
800	2023-12-18 12:11:32+01	28806724	Wohnungsboerse
1080	2023-12-18 12:11:35+01	33735070	Wohnungsboerse
450	2023-12-18 12:11:37+01	33660225	Wohnungsboerse
924	2023-12-18 12:11:39+01	33522771	Wohnungsboerse
2150	2023-12-18 12:11:42+01	33640807	Wohnungsboerse
1550	2023-12-18 12:11:45+01	32853522	Wohnungsboerse
1050	2023-12-18 12:11:48+01	33679734	Wohnungsboerse
920	2023-12-18 12:11:51+01	33690170	Wohnungsboerse
888.71	2023-12-18 12:11:53+01	33703392	Wohnungsboerse
1580	2023-12-18 12:11:56+01	33705811	Wohnungsboerse
1280	2023-12-18 12:11:59+01	33709536	Wohnungsboerse
1000	2023-12-18 12:12:02+01	33710407	Wohnungsboerse
1890	2023-12-18 12:12:04+01	32728992	Wohnungsboerse
1890	2023-12-18 12:12:07+01	32728991	Wohnungsboerse
1790	2023-12-18 12:12:08+01	32728990	Wohnungsboerse
1200	2023-12-18 12:12:11+01	33726711	Wohnungsboerse
1550	2023-12-18 12:12:14+01	33744110	Wohnungsboerse
8500	2023-12-18 12:12:16+01	33196281	Wohnungsboerse
1800	2023-12-18 12:12:19+01	32817541	Wohnungsboerse
1379.88	2023-12-18 12:12:22+01	33445819	Wohnungsboerse
1684.63	2023-12-18 12:12:23+01	33445857	Wohnungsboerse
2950	2023-12-18 12:12:25+01	33455178	Wohnungsboerse
700	2023-12-18 12:12:27+01	33501793	Wohnungsboerse
2770	2023-12-18 12:12:30+01	33347939	Wohnungsboerse
1850	2023-12-18 12:12:33+01	33196527	Wohnungsboerse
4750	2023-12-18 12:12:36+01	33688877	Wohnungsboerse
1760	2023-12-18 12:12:38+01	33745983	Wohnungsboerse
650	2023-12-18 12:12:41+01	33749588	Wohnungsboerse
800	2023-12-18 12:13:25+01	33528588	Wohnungsboerse
681	2023-12-18 12:13:28+01	33343991	Wohnungsboerse
1773.39	2023-12-18 12:13:30+01	33598511	Wohnungsboerse
750.95	2023-12-18 12:13:33+01	33596800	Wohnungsboerse
495	2023-12-18 12:13:36+01	33757292	Wohnungsboerse
481.92	2023-12-18 12:13:39+01	32442188	Wohnungsboerse
1900	2023-12-18 12:13:42+01	31394882	Wohnungsboerse
710	2023-12-18 12:13:44+01	33720783	Wohnungsboerse
2700	2023-12-18 12:13:47+01	33449689	Wohnungsboerse
920	2023-12-18 12:13:49+01	33627326	Wohnungsboerse
839.16	2023-12-18 12:13:52+01	33402808	Wohnungsboerse
695	2023-12-18 12:13:55+01	33473469	Wohnungsboerse
575	2023-12-18 12:13:57+01	33700943	Wohnungsboerse
1168.83	2023-12-18 12:13:59+01	33384509	Wohnungsboerse
1495	2023-12-18 12:14:01+01	33540487	Wohnungsboerse
530.6	2023-12-18 12:14:04+01	33691732	Wohnungsboerse
3300	2023-12-18 12:14:07+01	33598493	Wohnungsboerse
1830	2023-12-18 12:14:09+01	33568443	Wohnungsboerse
1450	2023-12-18 12:14:11+01	33608727	Wohnungsboerse
955	2023-12-18 12:14:13+01	33696812	Wohnungsboerse
1200	2023-12-18 12:14:15+01	33705388	Wohnungsboerse
2590	2023-12-18 12:14:18+01	33745613	Wohnungsboerse
1250	2023-12-18 12:14:20+01	33753077	Wohnungsboerse
992.46	2023-12-18 12:14:21+01	33691726	Wohnungsboerse
1875	2023-12-18 12:14:23+01	32976977	Wohnungsboerse
1200	2023-12-18 12:14:26+01	33695528	Wohnungsboerse
1121.63	2023-12-18 12:14:28+01	33691710	Wohnungsboerse
920	2023-12-18 12:14:30+01	29314952	Wohnungsboerse
650	2023-12-18 12:14:33+01	29317989	Wohnungsboerse
1200	2023-12-18 12:14:35+01	29631528	Wohnungsboerse
980	2023-12-18 12:14:38+01	33731462	Wohnungsboerse
798	2023-12-18 12:14:40+01	33744144	Wohnungsboerse
798	2023-12-18 12:14:41+01	33744149	Wohnungsboerse
750	2023-12-18 12:14:44+01	33747964	Wohnungsboerse
540	2023-12-18 12:14:46+01	33705398	Wohnungsboerse
1520	2023-12-18 12:14:49+01	33751485	Wohnungsboerse
1450	2023-12-18 12:14:52+01	33623140	Wohnungsboerse
1795	2023-12-18 12:14:54+01	33540488	Wohnungsboerse
650	2023-12-18 12:14:57+01	33724440	Wohnungsboerse
750	2023-12-18 12:14:59+01	33734491	Wohnungsboerse
684	2023-12-18 12:15:01+01	27035171	Wohnungsboerse
1348	2023-12-18 12:15:04+01	33425850	Wohnungsboerse
1064	2023-12-18 12:15:06+01	32820355	Wohnungsboerse
1262.17	2023-12-18 12:15:08+01	33450063	Wohnungsboerse
1300	2023-12-18 12:15:11+01	33455197	Wohnungsboerse
1272.31	2023-12-18 12:15:14+01	33630924	Wohnungsboerse
1158.43	2023-12-18 12:15:16+01	33650288	Wohnungsboerse
1534	2023-12-18 12:15:18+01	33646337	Wohnungsboerse
1375	2023-12-18 12:15:21+01	33654290	Wohnungsboerse
1205	2023-12-18 12:15:23+01	27088008	Wohnungsboerse
780	2023-12-18 12:15:26+01	33681987	Wohnungsboerse
1066	2023-12-18 12:15:28+01	33731545	Wohnungsboerse
702	2023-12-18 12:15:31+01	33753349	Wohnungsboerse
1238	2023-12-18 12:15:34+01	33757007	Wohnungsboerse
627	2023-12-18 12:15:36+01	33710483	Wohnungsboerse
580	2023-12-18 12:15:39+01	33731188	Wohnungsboerse
690	2023-12-18 12:15:41+01	33750404	Wohnungsboerse
828.2	2023-12-18 12:15:44+01	33396009	Wohnungsboerse
1190	2023-12-18 12:15:46+01	33601786	Wohnungsboerse
630	2023-12-18 12:15:49+01	33237999	Wohnungsboerse
1150	2023-12-18 12:15:52+01	33579993	Wohnungsboerse
1290	2023-12-18 12:15:54+01	33629353	Wohnungsboerse
1450	2023-12-18 12:15:57+01	32375748	Wohnungsboerse
1200	2023-12-18 12:15:59+01	33636840	Wohnungsboerse
970	2023-12-18 12:16:01+01	33708525	Wohnungsboerse
650	2023-12-18 12:16:04+01	33719818	Wohnungsboerse
720	2023-12-18 12:16:05+01	33487464	Wohnungsboerse
1450	2023-12-18 12:16:08+01	33454997	Wohnungsboerse
2085	2023-12-18 12:16:11+01	33740097	Wohnungsboerse
1120	2023-12-18 12:16:14+01	33740129	Wohnungsboerse
790	2023-12-18 12:16:16+01	33741544	Wohnungsboerse
1850	2023-12-18 12:16:20+01	33129082	Wohnungsboerse
1470	2023-12-18 12:16:22+01	33751360	Wohnungsboerse
710	2023-12-18 12:16:27+01	33722913	Wohnungsboerse
650	2023-12-18 12:16:27+01	33724540	Wohnungsboerse
920	2023-12-18 12:16:30+01	32918930	Wohnungsboerse
610.44	2023-12-18 12:16:31+01	33400003	Wohnungsboerse
750	2023-12-18 12:16:32+01	33621429	Wohnungsboerse
900	2023-12-18 12:16:35+01	33627163	Wohnungsboerse
665	2023-12-18 12:16:37+01	33672283	Wohnungsboerse
637	2023-12-18 12:16:40+01	33682976	Wohnungsboerse
720	2023-12-18 12:16:42+01	33465765	Wohnungsboerse
1400	2023-12-18 12:16:45+01	33708318	Wohnungsboerse
750	2023-12-18 12:16:47+01	33719635	Wohnungsboerse
620	2023-12-18 12:16:49+01	33675627	Wohnungsboerse
830	2023-12-18 12:16:52+01	33727613	Wohnungsboerse
1600	2023-12-18 12:16:54+01	33709668	Wohnungsboerse
1050	2023-12-18 12:16:57+01	33731246	Wohnungsboerse
1190	2023-12-18 12:16:59+01	33347397	Wohnungsboerse
650	2023-12-18 12:17:02+01	33737770	Wohnungsboerse
780	2023-12-18 12:17:04+01	33757357	Wohnungsboerse
1220	2023-12-18 12:17:05+01	33726365	Wohnungsboerse
750	2023-12-18 12:17:08+01	33724089	Wohnungsboerse
380	2023-12-18 12:17:11+01	33757362	Wohnungsboerse
1590	2023-12-18 12:17:12+01	33452349	Wohnungsboerse
496	2023-12-18 12:17:14+01	33757365	Wohnungsboerse
540	2023-12-18 12:17:17+01	33699701	Wohnungsboerse
1390	2023-12-18 12:17:20+01	33568636	Wohnungsboerse
695	2023-12-18 12:17:23+01	33757376	Wohnungsboerse
420	2023-12-18 12:17:25+01	33304508	Wohnungsboerse
1000	2023-12-18 12:17:27+01	33506341	Wohnungsboerse
750.95	2023-12-18 12:17:29+01	33716146	Wohnungsboerse
1250	2023-12-18 12:17:31+01	33621867	Wohnungsboerse
850	2023-12-18 12:17:34+01	33604309	Wohnungsboerse
415	2023-12-18 12:17:36+01	33555182	Wohnungsboerse
650	2023-12-18 12:17:39+01	33672119	Wohnungsboerse
490	2023-12-18 12:17:41+01	33645974	Wohnungsboerse
976	2023-12-18 12:17:44+01	33675587	Wohnungsboerse
720	2023-12-18 12:17:47+01	33584182	Wohnungsboerse
1100.59	2023-12-18 12:17:50+01	33598459	Wohnungsboerse
1600	2023-12-18 12:17:53+01	33717259	Wohnungsboerse
830	2023-12-18 12:17:56+01	33731498	Wohnungsboerse
1050	2023-12-18 12:17:59+01	33737902	Wohnungsboerse
1550	2023-12-18 12:18:01+01	33741410	Wohnungsboerse
1490	2023-12-18 12:18:04+01	33745708	Wohnungsboerse
1038.8	2023-12-18 12:18:06+01	33752618	Wohnungsboerse
600	2023-12-18 12:18:09+01	33532119	Wohnungsboerse
1137.36	2023-12-18 12:18:11+01	33435007	Wohnungsboerse
600	2023-12-18 12:18:16+01	33614961	Wohnungsboerse
510.19	2023-12-18 12:18:16+01	33648739	Wohnungsboerse
869	2023-12-18 12:18:18+01	33344003	Wohnungsboerse
570	2023-12-18 12:18:21+01	33686150	Wohnungsboerse
597.44	2023-12-18 12:18:22+01	33695695	Wohnungsboerse
1450	2023-12-18 12:18:24+01	33451563	Wohnungsboerse
495	2023-12-18 12:18:27+01	33705337	Wohnungsboerse
636	2023-12-18 12:18:28+01	33487646	Wohnungsboerse
715	2023-12-18 12:18:31+01	33729811	Wohnungsboerse
310	2023-12-18 12:18:34+01	33733230	Wohnungsboerse
902.96	2023-12-18 12:18:36+01	33476080	Wohnungsboerse
654.56	2023-12-18 12:18:38+01	33751413	Wohnungsboerse
650	2023-12-18 12:18:43+01	33750476	Wohnungsboerse
680	2023-12-18 12:19:19+01	33719345	Wohnungsboerse
877.5	2023-12-18 12:19:20+01	33708457	Wohnungsboerse
1100	2023-12-18 12:19:23+01	33737938	Wohnungsboerse
1500	2023-12-18 12:19:26+01	33690212	Wohnungsboerse
1370	2023-12-18 12:19:28+01	33733342	Wohnungsboerse
1342.16	2023-12-18 12:19:30+01	33717540	Wohnungsboerse
614	2023-12-18 12:19:32+01	33051217	Wohnungsboerse
1564	2023-12-18 12:19:35+01	33720882	Wohnungsboerse
3690	2023-12-18 12:19:37+01	33601618	Wohnungsboerse
1278	2023-12-18 12:19:39+01	33401864	Wohnungsboerse
1235	2023-12-18 12:19:42+01	33720919	Wohnungsboerse
1220	2023-12-18 12:19:45+01	33703673	Wohnungsboerse
2560	2023-12-18 12:19:47+01	33493623	Wohnungsboerse
590	2023-12-18 12:19:50+01	26640415	Wohnungsboerse
1750	2023-12-18 12:19:53+01	33571784	Wohnungsboerse
800	2023-12-18 12:19:56+01	32111553	Wohnungsboerse
640	2023-12-18 12:19:58+01	33299372	Wohnungsboerse
2925	2023-12-18 12:20:01+01	33259857	Wohnungsboerse
947.16	2023-12-18 12:20:04+01	33304400	Wohnungsboerse
1590	2023-12-18 12:20:06+01	33329023	Wohnungsboerse
752.77	2023-12-18 12:20:09+01	33432779	Wohnungsboerse
740	2023-12-18 12:20:12+01	33298889	Wohnungsboerse
735	2023-12-18 12:20:15+01	33650244	Wohnungsboerse
1350	2023-12-18 12:20:17+01	33654580	Wohnungsboerse
3050	2023-12-18 12:20:20+01	33652461	Wohnungsboerse
3050	2023-12-18 12:20:23+01	33593062	Wohnungsboerse
815.81	2023-12-18 12:20:26+01	33727930	Wohnungsboerse
455	2023-12-18 12:20:27+01	33729783	Wohnungsboerse
280	2023-12-18 12:20:30+01	33736481	Wohnungsboerse
1800	2023-12-18 12:20:32+01	33593060	Wohnungsboerse
449	2023-12-18 12:20:34+01	33254653	Wohnungsboerse
550	2023-12-18 12:20:35+01	33633812	Wohnungsboerse
1650	2023-12-18 12:20:37+01	33677783	Wohnungsboerse
1050	2023-12-18 12:20:39+01	33688535	Wohnungsboerse
650	2023-12-18 12:20:41+01	33693182	Wohnungsboerse
832	2023-12-18 12:20:44+01	33706010	Wohnungsboerse
675	2023-12-18 12:20:46+01	33715691	Wohnungsboerse
690	2023-12-18 12:20:49+01	33682555	Wohnungsboerse
526.75	2023-12-18 12:20:52+01	33740543	Wohnungsboerse
980	2023-12-18 12:20:53+01	33743791	Wohnungsboerse
550	2023-12-18 12:20:55+01	33751540	Wohnungsboerse
1540	2023-12-18 12:20:58+01	32803920	Wohnungsboerse
730	2023-12-18 12:20:59+01	33658070	Wohnungsboerse
420	2023-12-18 12:21:01+01	33658059	Wohnungsboerse
590	2023-12-18 12:21:04+01	26800673	Wohnungsboerse
810	2023-12-18 12:21:06+01	33198024	Wohnungsboerse
950	2023-12-18 12:21:09+01	33333966	Wohnungsboerse
890	2023-12-18 12:21:11+01	33103145	Wohnungsboerse
970	2023-12-18 12:21:14+01	33609058	Wohnungsboerse
915	2023-12-18 12:21:17+01	33667986	Wohnungsboerse
670	2023-12-18 12:21:19+01	33717322	Wohnungsboerse
920	2023-12-18 12:21:22+01	33636749	Wohnungsboerse
1568.43	2023-12-18 12:21:24+01	33402892	Wohnungsboerse
1350	2023-12-18 12:21:26+01	33674429	Wohnungsboerse
580	2023-12-18 12:21:28+01	33691764	Wohnungsboerse
738.57	2023-12-18 12:21:29+01	33691605	Wohnungsboerse
1320	2023-12-18 12:21:31+01	33727796	Wohnungsboerse
1600	2023-12-18 12:21:33+01	33699228	Wohnungsboerse
910	2023-12-18 12:21:39+01	33707630	Wohnungsboerse
615	2023-12-18 12:21:39+01	33715951	Wohnungsboerse
480	2023-12-18 12:21:42+01	33717215	Wohnungsboerse
1500	2023-12-18 12:21:45+01	33717408	Wohnungsboerse
715	2023-12-18 12:21:47+01	33720495	Wohnungsboerse
1330	2023-12-18 12:21:49+01	33726412	Wohnungsboerse
1034	2023-12-18 12:21:51+01	32705183	Wohnungsboerse
650	2023-12-18 12:21:55+01	33728224	Wohnungsboerse
604	2023-12-18 12:21:56+01	33731275	Wohnungsboerse
700	2023-12-18 12:21:59+01	33731362	Wohnungsboerse
450	2023-12-18 12:22:02+01	33734830	Wohnungsboerse
900	2023-12-18 12:22:04+01	33736517	Wohnungsboerse
780	2023-12-18 12:22:07+01	33738247	Wohnungsboerse
1300	2023-12-18 12:22:10+01	33753201	Wohnungsboerse
2350	2023-12-18 12:22:12+01	33263620	Wohnungsboerse
954.97	2023-12-18 12:22:14+01	33229616	Wohnungsboerse
1500	2023-12-18 12:22:18+01	33733496	Wohnungsboerse
780	2023-12-18 12:22:20+01	33734709	Wohnungsboerse
598	2023-12-18 12:22:23+01	33735057	Wohnungsboerse
420	2023-12-18 12:22:25+01	33736634	Wohnungsboerse
539	2023-12-18 12:22:27+01	33736740	Wohnungsboerse
980	2023-12-18 12:30:41+01	33737803	Wohnungsboerse
1174	2023-12-18 12:30:41+01	33737818	Wohnungsboerse
740	2023-12-18 12:30:42+01	33743602	Wohnungsboerse
340	2023-12-18 12:30:43+01	33726747	Wohnungsboerse
835	2023-12-18 12:30:47+01	33747819	Wohnungsboerse
732	2023-12-18 12:30:49+01	33750384	Wohnungsboerse
1150	2023-12-18 12:30:52+01	33429247	Wohnungsboerse
800	2023-12-18 12:30:55+01	33543940	Wohnungsboerse
977.5	2023-12-18 12:30:58+01	32937445	Wohnungsboerse
1728	2023-12-18 12:31:01+01	33616369	Wohnungsboerse
1450	2023-12-18 12:31:03+01	33619038	Wohnungsboerse
1620	2023-12-18 12:31:06+01	33650436	Wohnungsboerse
1340	2023-12-18 12:31:07+01	33650435	Wohnungsboerse
1560	2023-12-18 12:31:08+01	33650434	Wohnungsboerse
870	2023-12-18 12:31:10+01	33650432	Wohnungsboerse
1700	2023-12-18 12:31:13+01	33646382	Wohnungsboerse
575	2023-12-18 12:31:16+01	33706060	Wohnungsboerse
950	2023-12-18 12:31:18+01	33542810	Wohnungsboerse
790	2023-12-18 12:31:21+01	33392135	Wohnungsboerse
1350	2023-12-18 12:31:23+01	33351683	Wohnungsboerse
2480	2023-12-18 12:31:27+01	33654905	Wohnungsboerse
1500	2023-12-18 12:31:28+01	33568150	Wohnungsboerse
1625	2023-12-18 12:31:31+01	33448480	Wohnungsboerse
810.81	2023-12-18 12:31:33+01	33002621	Wohnungsboerse
610	2023-12-18 12:31:35+01	33726435	Wohnungsboerse
1625	2023-12-18 12:31:38+01	33703775	Wohnungsboerse
1100	2023-12-18 12:31:41+01	33727709	Wohnungsboerse
900	2023-12-18 12:31:44+01	33727806	Wohnungsboerse
600	2023-12-18 12:31:46+01	33733301	Wohnungsboerse
1140	2023-12-18 12:31:49+01	33734804	Wohnungsboerse
490	2023-12-18 12:31:52+01	33740616	Wohnungsboerse
1000	2023-12-18 12:31:55+01	33745768	Wohnungsboerse
997.58	2023-12-18 12:31:57+01	33347319	Wohnungsboerse
500	2023-12-18 12:31:59+01	33750361	Wohnungsboerse
595.94	2023-12-18 12:32:01+01	33753091	Wohnungsboerse
1206.86	2023-12-18 12:32:04+01	33756995	Wohnungsboerse
958.5	2023-12-18 12:32:07+01	33757186	Wohnungsboerse
459.38	2023-12-18 12:32:09+01	33636857	Wohnungsboerse
535.43	2023-12-18 12:32:11+01	33684976	Wohnungsboerse
850	2023-12-18 12:32:14+01	33704596	Wohnungsboerse
1998	2023-12-18 12:32:15+01	33708296	Wohnungsboerse
1270	2023-12-18 12:32:18+01	33519879	Wohnungsboerse
788.55	2023-12-18 12:32:20+01	33717539	Wohnungsboerse
693.21	2023-12-18 12:32:23+01	33717538	Wohnungsboerse
1186.64	2023-12-18 12:32:26+01	33717537	Wohnungsboerse
751.5	2023-12-18 12:32:27+01	33717536	Wohnungsboerse
650	2023-12-18 12:32:30+01	33717857	Wohnungsboerse
880.05	2023-12-18 12:32:33+01	33703393	Wohnungsboerse
1468.95	2023-12-18 12:32:36+01	33717329	Wohnungsboerse
650	2023-12-18 12:32:38+01	33733664	Wohnungsboerse
859	2023-12-18 12:32:40+01	33729744	Wohnungsboerse
680	2023-12-18 12:32:43+01	33736981	Wohnungsboerse
975	2023-12-18 12:32:46+01	33740151	Wohnungsboerse
1491	2023-12-18 12:32:49+01	33667466	Wohnungsboerse
570.85	2023-12-18 12:32:50+01	33493584	Wohnungsboerse
450	2023-12-18 12:32:53+01	33754292	Wohnungsboerse
1600	2023-12-18 12:32:56+01	33734507	Wohnungsboerse
419	2023-12-18 12:32:58+01	33734541	Wohnungsboerse
1250	2023-12-18 12:33:01+01	33734885	Wohnungsboerse
1350	2023-12-18 12:33:04+01	31604820	Wohnungsboerse
514	2023-12-18 12:33:06+01	33745789	Wohnungsboerse
600	2023-12-18 12:33:09+01	33103115	Wohnungsboerse
650	2023-12-18 12:33:12+01	33723052	Wohnungsboerse
500	2023-12-18 12:33:14+01	33750419	Wohnungsboerse
1470	2023-12-18 12:33:16+01	33752684	Wohnungsboerse
954.67	2023-12-18 12:33:19+01	33753181	Wohnungsboerse
724.07	2023-12-18 12:33:21+01	33608544	Wohnungsboerse
2400	2023-12-18 12:33:23+01	33754265	Wohnungsboerse
838	2023-12-18 12:33:25+01	33757132	Wohnungsboerse
1804	2023-12-18 12:33:28+01	33743617	Wohnungsboerse
620	2023-12-18 12:33:31+01	33527184	Wohnungsboerse
5500	2023-12-18 12:33:34+01	33696595	Wohnungsboerse
1700	2023-12-18 12:33:36+01	33667387	Wohnungsboerse
2225	2023-12-18 12:33:39+01	33650258	Wohnungsboerse
2525	2023-12-18 12:33:42+01	33670203	Wohnungsboerse
1385	2023-12-18 12:33:45+01	33719633	Wohnungsboerse
2995	2023-12-18 12:33:47+01	33720746	Wohnungsboerse
565	2023-12-18 12:33:50+01	33724736	Wohnungsboerse
750	2023-12-18 12:33:52+01	33726775	Wohnungsboerse
800	2023-12-18 12:33:55+01	33731040	Wohnungsboerse
1198	2023-12-18 12:33:57+01	33731016	Wohnungsboerse
990	2023-12-18 12:34:00+01	33740136	Wohnungsboerse
950	2023-12-18 12:34:02+01	33741354	Wohnungsboerse
1930	2023-12-18 12:34:04+01	33703627	Wohnungsboerse
750	2023-12-18 12:34:07+01	33738004	Wohnungsboerse
750	2023-12-18 12:34:10+01	33745623	Wohnungsboerse
650	2023-12-18 12:34:12+01	32908705	Wohnungsboerse
1090	2023-12-18 12:34:14+01	33642049	Wohnungsboerse
670	2023-12-18 12:34:17+01	33747934	Wohnungsboerse
650	2023-12-18 12:34:20+01	33748572	Wohnungsboerse
1500	2023-12-18 12:34:23+01	33751314	Wohnungsboerse
436.12	2023-12-18 12:34:25+01	33751414	Wohnungsboerse
400	2023-12-18 12:34:28+01	33751515	Wohnungsboerse
875	2023-12-18 12:34:30+01	33752651	Wohnungsboerse
630	2023-12-18 12:34:34+01	33754038	Wohnungsboerse
430	2023-12-18 12:34:35+01	33757031	Wohnungsboerse
\.


--
-- Data for Name: scraper_stats; Type: TABLE DATA; Schema: estates; Owner: estates_scraper
--

COPY estates.scraper_stats (id, crawl_started, crawl_ended, crawler_name, time_elapsed, number_requests, number_response, number_response_200, finished_reason, items_scraped) FROM stdin;
1	2023-11-06 12:00:12+01	2023-11-06 12:09:57+01	immowelt-scraper	586	240	240	239	finished	189
2	2023-11-06 12:10:01+01	2023-11-06 12:34:01+01	wohnungsboerse-scraper	1440	589	589	589	finished	537
3	2023-11-09 13:25:56+01	2023-11-09 13:25:56+01	immowelt-scraper	0	0	0	0	finished	0
4	2023-11-09 13:25:58+01	2023-11-09 13:25:58+01	wohnungsboerse-scraper	0	0	0	0	finished	0
5	2023-11-09 13:34:18+01	2023-11-09 13:34:18+01	immowelt-scraper	0	0	0	0	finished	0
6	2023-11-09 13:34:21+01	2023-11-09 13:34:21+01	wohnungsboerse-scraper	0	0	0	0	finished	0
7	2023-11-09 17:51:35+01	2023-11-09 17:51:35+01	immowelt-scraper	0	0	0	0	finished	0
8	2023-11-09 17:51:39+01	2023-11-09 17:51:39+01	wohnungsboerse-scraper	0	0	0	0	finished	0
9	2023-11-09 17:52:51+01	2023-11-09 17:52:51+01	immowelt-scraper	0	0	0	0	finished	0
10	2023-11-09 17:52:53+01	2023-11-09 17:52:53+01	wohnungsboerse-scraper	0	0	0	0	finished	0
11	2023-11-09 17:55:37+01	2023-11-09 17:56:17+01	immowelt-scraper	39	17	17	0	shutdown	0
12	2023-11-09 17:56:15+01	2023-11-09 17:58:17+01	immowelt-scraper	123	50	50	0	finished	0
13	2023-11-09 17:58:19+01	2023-11-09 19:31:53+01	wohnungsboerse-scraper	5614	588	582	582	finished	530
14	2023-11-13 11:00:13+01	2023-11-13 11:02:18+01	immowelt-scraper	125	50	50	0	finished	0
15	2023-11-13 11:02:20+01	2023-11-13 11:25:58+01	wohnungsboerse-scraper	1417	584	584	584	finished	531
16	2023-11-16 11:06:55+01	2023-11-16 11:08:55+01	immowelt-scraper	120	50	50	0	finished	0
17	2023-11-16 11:08:58+01	2023-11-16 11:32:32+01	wohnungsboerse-scraper	1414	584	584	584	finished	534
18	2023-11-23 11:00:15+01	2023-11-23 11:02:15+01	immowelt-scraper	120	50	50	0	finished	0
19	2023-11-23 11:02:18+01	2023-11-23 11:50:46+01	wohnungsboerse-scraper	2908	574	574	574	finished	524
20	2023-11-27 11:20:33+01	2023-11-27 14:17:44+01	immowelt-scraper	10631	50	50	0	finished	0
21	2023-11-30 11:00:15+01	2023-11-30 11:02:14+01	immowelt-scraper	119	50	50	0	finished	0
22	2023-11-30 11:02:21+01	2023-11-30 11:25:58+01	wohnungsboerse-scraper	1416	584	584	584	finished	534
23	2023-12-04 11:00:08+01	2023-12-04 11:02:03+01	immowelt-scraper	116	50	50	0	finished	0
24	2023-12-04 11:02:09+01	2023-12-04 12:04:08+01	wohnungsboerse-scraper	3720	593	590	590	finished	540
25	2023-12-07 11:00:44+01	2023-12-07 11:19:03+01	immowelt-scraper	1099	50	50	0	finished	0
26	2023-12-07 11:19:05+01	2023-12-07 12:00:25+01	wohnungsboerse-scraper	2480	590	588	588	finished	538
27	2023-12-11 11:00:22+01	2023-12-11 11:02:16+01	immowelt-scraper	114	50	50	0	finished	0
28	2023-12-11 11:18:12+01	2023-12-11 11:20:17+01	immowelt-scraper	124	50	50	0	finished	0
29	2023-12-11 11:02:19+01	2023-12-11 11:25:47+01	wohnungsboerse-scraper	1408	583	583	583	finished	531
30	2023-12-11 11:20:20+01	2023-12-11 11:36:20+01	wohnungsboerse-scraper	960	393	393	393	shutdown	354
31	2023-12-11 11:38:42+01	2023-12-11 11:40:43+01	immowelt-scraper	121	50	50	0	finished	0
32	2023-12-11 11:40:47+01	2023-12-11 12:04:18+01	wohnungsboerse-scraper	1411	583	583	583	finished	531
33	2023-12-14 11:00:10+01	2023-12-14 11:26:28+01	immowelt-scraper	1578	50	50	0	finished	0
34	2023-12-14 11:26:34+01	2023-12-14 11:50:29+01	wohnungsboerse-scraper	1434	588	588	588	finished	537
35	2023-12-18 11:00:25+01	2023-12-18 11:02:23+01	immowelt-scraper	118	50	50	0	finished	0
36	2023-12-18 11:02:29+01	2023-12-18 11:34:35+01	wohnungsboerse-scraper	1927	586	586	586	finished	533
37	2023-12-27 17:02:05+01	2023-12-27 17:02:05+01	wohnungsboerse-scraper	0	0	0	0	finished	0
38	2023-12-27 17:05:01+01	2023-12-27 17:05:29+01	wohnungsboerse-scraper	28	12	11	11	shutdown	6
39	2023-12-27 17:06:22+01	2023-12-27 17:06:48+01	wohnungsboerse-scraper	26	12	12	12	finished	6
40	2023-12-27 17:07:25+01	2023-12-27 17:07:52+01	wohnungsboerse-scraper	27	12	12	12	finished	6
41	2023-12-27 17:08:57+01	2023-12-27 17:09:25+01	wohnungsboerse-scraper	29	12	12	12	finished	10
42	2024-01-03 17:41:44+01	2024-01-03 17:41:44+01	wohnungsboerse-scraper	0	0	0	0	finished	0
43	2024-01-03 17:43:08+01	2024-01-03 18:06:22+01	wohnungsboerse-scraper	1394	568	568	568	finished	517
\.


--
-- Name: ml_stats_id_seq; Type: SEQUENCE SET; Schema: estates; Owner: estates_scraper
--

SELECT pg_catalog.setval('estates.ml_stats_id_seq', 2, true);


--
-- Name: scraper_stats_id_seq; Type: SEQUENCE SET; Schema: estates; Owner: estates_scraper
--

SELECT pg_catalog.setval('estates.scraper_stats_id_seq', 43, true);


--
-- Name: estate idx_16561_primary; Type: CONSTRAINT; Schema: estates; Owner: estates_scraper
--

ALTER TABLE ONLY estates.estate
    ADD CONSTRAINT idx_16561_primary PRIMARY KEY (estate_id);


--
-- Name: ml_stats idx_16567_primary; Type: CONSTRAINT; Schema: estates; Owner: estates_scraper
--

ALTER TABLE ONLY estates.ml_stats
    ADD CONSTRAINT idx_16567_primary PRIMARY KEY (id);


--
-- Name: price idx_16571_primary; Type: CONSTRAINT; Schema: estates; Owner: estates_scraper
--

ALTER TABLE ONLY estates.price
    ADD CONSTRAINT idx_16571_primary PRIMARY KEY (scraped_at, estate_id);


--
-- Name: scraper_stats idx_16575_primary; Type: CONSTRAINT; Schema: estates; Owner: estates_scraper
--

ALTER TABLE ONLY estates.scraper_stats
    ADD CONSTRAINT idx_16575_primary PRIMARY KEY (id);


--
-- Name: idx_16561_fk_l_id; Type: INDEX; Schema: estates; Owner: estates_scraper
--

CREATE INDEX idx_16561_fk_l_id ON estates.estate USING btree (location);


--
-- Name: idx_16571_estate_id; Type: INDEX; Schema: estates; Owner: estates_scraper
--

CREATE INDEX idx_16571_estate_id ON estates.price USING btree (estate_id);


--
-- Name: price price_ibfk_1; Type: FK CONSTRAINT; Schema: estates; Owner: estates_scraper
--

ALTER TABLE ONLY estates.price
    ADD CONSTRAINT price_ibfk_1 FOREIGN KEY (estate_id) REFERENCES estates.estate(estate_id);


--
-- PostgreSQL database dump complete
--
