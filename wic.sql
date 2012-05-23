--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: walkincoma; Tablespace: 
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO walkincoma;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: walkincoma
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO walkincoma;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: walkincoma
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: walkincoma
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: walkincoma; Tablespace: 
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO walkincoma;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: walkincoma
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO walkincoma;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: walkincoma
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: walkincoma
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: walkincoma; Tablespace: 
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO walkincoma;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: walkincoma
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO walkincoma;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: walkincoma
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: walkincoma
--

SELECT pg_catalog.setval('auth_permission_id_seq', 51, true);


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: walkincoma; Tablespace: 
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    username character varying(30) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(75) NOT NULL,
    password character varying(128) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    is_superuser boolean NOT NULL,
    last_login timestamp with time zone NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO walkincoma;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: walkincoma; Tablespace: 
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO walkincoma;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: walkincoma
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO walkincoma;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: walkincoma
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: walkincoma
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: walkincoma
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO walkincoma;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: walkincoma
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: walkincoma
--

SELECT pg_catalog.setval('auth_user_id_seq', 2, true);


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: walkincoma; Tablespace: 
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO walkincoma;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: walkincoma
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO walkincoma;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: walkincoma
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: walkincoma
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: walkincoma; Tablespace: 
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    user_id integer NOT NULL,
    content_type_id integer,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO walkincoma;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: walkincoma
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO walkincoma;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: walkincoma
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: walkincoma
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 92, true);


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: walkincoma; Tablespace: 
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO walkincoma;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: walkincoma
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO walkincoma;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: walkincoma
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: walkincoma
--

SELECT pg_catalog.setval('django_content_type_id_seq', 17, true);


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: walkincoma; Tablespace: 
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO walkincoma;

--
-- Name: django_site; Type: TABLE; Schema: public; Owner: walkincoma; Tablespace: 
--

CREATE TABLE django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.django_site OWNER TO walkincoma;

--
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: walkincoma
--

CREATE SEQUENCE django_site_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.django_site_id_seq OWNER TO walkincoma;

--
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: walkincoma
--

ALTER SEQUENCE django_site_id_seq OWNED BY django_site.id;


--
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: walkincoma
--

SELECT pg_catalog.setval('django_site_id_seq', 1, true);


--
-- Name: south_migrationhistory; Type: TABLE; Schema: public; Owner: walkincoma; Tablespace: 
--

CREATE TABLE south_migrationhistory (
    id integer NOT NULL,
    app_name character varying(255) NOT NULL,
    migration character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.south_migrationhistory OWNER TO walkincoma;

--
-- Name: south_migrationhistory_id_seq; Type: SEQUENCE; Schema: public; Owner: walkincoma
--

CREATE SEQUENCE south_migrationhistory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.south_migrationhistory_id_seq OWNER TO walkincoma;

--
-- Name: south_migrationhistory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: walkincoma
--

ALTER SEQUENCE south_migrationhistory_id_seq OWNED BY south_migrationhistory.id;


--
-- Name: south_migrationhistory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: walkincoma
--

SELECT pg_catalog.setval('south_migrationhistory_id_seq', 7, true);


--
-- Name: thumbnail_kvstore; Type: TABLE; Schema: public; Owner: walkincoma; Tablespace: 
--

CREATE TABLE thumbnail_kvstore (
    key character varying(200) NOT NULL,
    value text NOT NULL
);


ALTER TABLE public.thumbnail_kvstore OWNER TO walkincoma;

--
-- Name: wic_album; Type: TABLE; Schema: public; Owner: walkincoma; Tablespace: 
--

CREATE TABLE wic_album (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    release_date date NOT NULL,
    label character varying(255),
    cover character varying(100) NOT NULL
);


ALTER TABLE public.wic_album OWNER TO walkincoma;

--
-- Name: wic_album_id_seq; Type: SEQUENCE; Schema: public; Owner: walkincoma
--

CREATE SEQUENCE wic_album_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.wic_album_id_seq OWNER TO walkincoma;

--
-- Name: wic_album_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: walkincoma
--

ALTER SEQUENCE wic_album_id_seq OWNED BY wic_album.id;


--
-- Name: wic_album_id_seq; Type: SEQUENCE SET; Schema: public; Owner: walkincoma
--

SELECT pg_catalog.setval('wic_album_id_seq', 4, true);


--
-- Name: wic_album_members; Type: TABLE; Schema: public; Owner: walkincoma; Tablespace: 
--

CREATE TABLE wic_album_members (
    id integer NOT NULL,
    album_id integer NOT NULL,
    bandmember_id integer NOT NULL
);


ALTER TABLE public.wic_album_members OWNER TO walkincoma;

--
-- Name: wic_album_members_id_seq; Type: SEQUENCE; Schema: public; Owner: walkincoma
--

CREATE SEQUENCE wic_album_members_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.wic_album_members_id_seq OWNER TO walkincoma;

--
-- Name: wic_album_members_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: walkincoma
--

ALTER SEQUENCE wic_album_members_id_seq OWNED BY wic_album_members.id;


--
-- Name: wic_album_members_id_seq; Type: SEQUENCE SET; Schema: public; Owner: walkincoma
--

SELECT pg_catalog.setval('wic_album_members_id_seq', 15, true);


--
-- Name: wic_album_tracks; Type: TABLE; Schema: public; Owner: walkincoma; Tablespace: 
--

CREATE TABLE wic_album_tracks (
    id integer NOT NULL,
    album_id integer NOT NULL,
    track_id integer NOT NULL
);


ALTER TABLE public.wic_album_tracks OWNER TO walkincoma;

--
-- Name: wic_album_tracks_id_seq; Type: SEQUENCE; Schema: public; Owner: walkincoma
--

CREATE SEQUENCE wic_album_tracks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.wic_album_tracks_id_seq OWNER TO walkincoma;

--
-- Name: wic_album_tracks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: walkincoma
--

ALTER SEQUENCE wic_album_tracks_id_seq OWNED BY wic_album_tracks.id;


--
-- Name: wic_album_tracks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: walkincoma
--

SELECT pg_catalog.setval('wic_album_tracks_id_seq', 19, true);


--
-- Name: wic_bandmember; Type: TABLE; Schema: public; Owner: walkincoma; Tablespace: 
--

CREATE TABLE wic_bandmember (
    id integer NOT NULL,
    nickname character varying(30) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    role_in_band character varying(255) NOT NULL,
    bio text,
    gear text,
    avatar character varying(100),
    is_active boolean NOT NULL
);


ALTER TABLE public.wic_bandmember OWNER TO walkincoma;

--
-- Name: wic_bandmember_id_seq; Type: SEQUENCE; Schema: public; Owner: walkincoma
--

CREATE SEQUENCE wic_bandmember_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.wic_bandmember_id_seq OWNER TO walkincoma;

--
-- Name: wic_bandmember_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: walkincoma
--

ALTER SEQUENCE wic_bandmember_id_seq OWNED BY wic_bandmember.id;


--
-- Name: wic_bandmember_id_seq; Type: SEQUENCE SET; Schema: public; Owner: walkincoma
--

SELECT pg_catalog.setval('wic_bandmember_id_seq', 4, true);


--
-- Name: wic_devicetoken; Type: TABLE; Schema: public; Owner: walkincoma; Tablespace: 
--

CREATE TABLE wic_devicetoken (
    id integer NOT NULL,
    device_id character varying(255) NOT NULL,
    date_subscribed date NOT NULL
);


ALTER TABLE public.wic_devicetoken OWNER TO walkincoma;

--
-- Name: wic_devicetoken_id_seq; Type: SEQUENCE; Schema: public; Owner: walkincoma
--

CREATE SEQUENCE wic_devicetoken_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.wic_devicetoken_id_seq OWNER TO walkincoma;

--
-- Name: wic_devicetoken_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: walkincoma
--

ALTER SEQUENCE wic_devicetoken_id_seq OWNED BY wic_devicetoken.id;


--
-- Name: wic_devicetoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: walkincoma
--

SELECT pg_catalog.setval('wic_devicetoken_id_seq', 1, false);


--
-- Name: wic_gig; Type: TABLE; Schema: public; Owner: walkincoma; Tablespace: 
--

CREATE TABLE wic_gig (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    event_info text NOT NULL,
    start_date timestamp with time zone NOT NULL,
    end_date timestamp with time zone NOT NULL,
    location character varying(255) NOT NULL,
    other_bands character varying(255),
    venue_pic character varying(100),
    is_cancelled boolean NOT NULL
);


ALTER TABLE public.wic_gig OWNER TO walkincoma;

--
-- Name: wic_gig_id_seq; Type: SEQUENCE; Schema: public; Owner: walkincoma
--

CREATE SEQUENCE wic_gig_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.wic_gig_id_seq OWNER TO walkincoma;

--
-- Name: wic_gig_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: walkincoma
--

ALTER SEQUENCE wic_gig_id_seq OWNED BY wic_gig.id;


--
-- Name: wic_gig_id_seq; Type: SEQUENCE SET; Schema: public; Owner: walkincoma
--

SELECT pg_catalog.setval('wic_gig_id_seq', 5, true);


--
-- Name: wic_newsarticle; Type: TABLE; Schema: public; Owner: walkincoma; Tablespace: 
--

CREATE TABLE wic_newsarticle (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    article_date date NOT NULL,
    article_body text NOT NULL,
    slug character varying(50) NOT NULL
);


ALTER TABLE public.wic_newsarticle OWNER TO walkincoma;

--
-- Name: wic_newsarticle_id_seq; Type: SEQUENCE; Schema: public; Owner: walkincoma
--

CREATE SEQUENCE wic_newsarticle_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.wic_newsarticle_id_seq OWNER TO walkincoma;

--
-- Name: wic_newsarticle_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: walkincoma
--

ALTER SEQUENCE wic_newsarticle_id_seq OWNED BY wic_newsarticle.id;


--
-- Name: wic_newsarticle_id_seq; Type: SEQUENCE SET; Schema: public; Owner: walkincoma
--

SELECT pg_catalog.setval('wic_newsarticle_id_seq', 4, true);


--
-- Name: wic_newsarticle_posted_by; Type: TABLE; Schema: public; Owner: walkincoma; Tablespace: 
--

CREATE TABLE wic_newsarticle_posted_by (
    id integer NOT NULL,
    newsarticle_id integer NOT NULL,
    bandmember_id integer NOT NULL
);


ALTER TABLE public.wic_newsarticle_posted_by OWNER TO walkincoma;

--
-- Name: wic_newsarticle_posted_by_id_seq; Type: SEQUENCE; Schema: public; Owner: walkincoma
--

CREATE SEQUENCE wic_newsarticle_posted_by_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.wic_newsarticle_posted_by_id_seq OWNER TO walkincoma;

--
-- Name: wic_newsarticle_posted_by_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: walkincoma
--

ALTER SEQUENCE wic_newsarticle_posted_by_id_seq OWNED BY wic_newsarticle_posted_by.id;


--
-- Name: wic_newsarticle_posted_by_id_seq; Type: SEQUENCE SET; Schema: public; Owner: walkincoma
--

SELECT pg_catalog.setval('wic_newsarticle_posted_by_id_seq', 6, true);


--
-- Name: wic_photo; Type: TABLE; Schema: public; Owner: walkincoma; Tablespace: 
--

CREATE TABLE wic_photo (
    id integer NOT NULL,
    title character varying(100),
    flickr_id bigint NOT NULL,
    flickr_owner character varying(20) NOT NULL,
    flickr_server integer NOT NULL,
    flickr_secret character varying(50) NOT NULL
);


ALTER TABLE public.wic_photo OWNER TO walkincoma;

--
-- Name: wic_photo_id_seq; Type: SEQUENCE; Schema: public; Owner: walkincoma
--

CREATE SEQUENCE wic_photo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.wic_photo_id_seq OWNER TO walkincoma;

--
-- Name: wic_photo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: walkincoma
--

ALTER SEQUENCE wic_photo_id_seq OWNED BY wic_photo.id;


--
-- Name: wic_photo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: walkincoma
--

SELECT pg_catalog.setval('wic_photo_id_seq', 142, true);


--
-- Name: wic_pushmessage; Type: TABLE; Schema: public; Owner: walkincoma; Tablespace: 
--

CREATE TABLE wic_pushmessage (
    id integer NOT NULL,
    message character varying(255) NOT NULL,
    date_sent date NOT NULL
);


ALTER TABLE public.wic_pushmessage OWNER TO walkincoma;

--
-- Name: wic_pushmessage_id_seq; Type: SEQUENCE; Schema: public; Owner: walkincoma
--

CREATE SEQUENCE wic_pushmessage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.wic_pushmessage_id_seq OWNER TO walkincoma;

--
-- Name: wic_pushmessage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: walkincoma
--

ALTER SEQUENCE wic_pushmessage_id_seq OWNED BY wic_pushmessage.id;


--
-- Name: wic_pushmessage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: walkincoma
--

SELECT pg_catalog.setval('wic_pushmessage_id_seq', 1, false);


--
-- Name: wic_track; Type: TABLE; Schema: public; Owner: walkincoma; Tablespace: 
--

CREATE TABLE wic_track (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    release_date date NOT NULL
);


ALTER TABLE public.wic_track OWNER TO walkincoma;

--
-- Name: wic_track_id_seq; Type: SEQUENCE; Schema: public; Owner: walkincoma
--

CREATE SEQUENCE wic_track_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.wic_track_id_seq OWNER TO walkincoma;

--
-- Name: wic_track_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: walkincoma
--

ALTER SEQUENCE wic_track_id_seq OWNED BY wic_track.id;


--
-- Name: wic_track_id_seq; Type: SEQUENCE SET; Schema: public; Owner: walkincoma
--

SELECT pg_catalog.setval('wic_track_id_seq', 17, true);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: walkincoma
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: walkincoma
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: walkincoma
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: walkincoma
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: walkincoma
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: walkincoma
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: walkincoma
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: walkincoma
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: walkincoma
--

ALTER TABLE ONLY django_site ALTER COLUMN id SET DEFAULT nextval('django_site_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: walkincoma
--

ALTER TABLE ONLY south_migrationhistory ALTER COLUMN id SET DEFAULT nextval('south_migrationhistory_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: walkincoma
--

ALTER TABLE ONLY wic_album ALTER COLUMN id SET DEFAULT nextval('wic_album_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: walkincoma
--

ALTER TABLE ONLY wic_album_members ALTER COLUMN id SET DEFAULT nextval('wic_album_members_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: walkincoma
--

ALTER TABLE ONLY wic_album_tracks ALTER COLUMN id SET DEFAULT nextval('wic_album_tracks_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: walkincoma
--

ALTER TABLE ONLY wic_bandmember ALTER COLUMN id SET DEFAULT nextval('wic_bandmember_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: walkincoma
--

ALTER TABLE ONLY wic_devicetoken ALTER COLUMN id SET DEFAULT nextval('wic_devicetoken_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: walkincoma
--

ALTER TABLE ONLY wic_gig ALTER COLUMN id SET DEFAULT nextval('wic_gig_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: walkincoma
--

ALTER TABLE ONLY wic_newsarticle ALTER COLUMN id SET DEFAULT nextval('wic_newsarticle_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: walkincoma
--

ALTER TABLE ONLY wic_newsarticle_posted_by ALTER COLUMN id SET DEFAULT nextval('wic_newsarticle_posted_by_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: walkincoma
--

ALTER TABLE ONLY wic_photo ALTER COLUMN id SET DEFAULT nextval('wic_photo_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: walkincoma
--

ALTER TABLE ONLY wic_pushmessage ALTER COLUMN id SET DEFAULT nextval('wic_pushmessage_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: walkincoma
--

ALTER TABLE ONLY wic_track ALTER COLUMN id SET DEFAULT nextval('wic_track_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: walkincoma
--

COPY auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: walkincoma
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: walkincoma
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add permission	1	add_permission
2	Can change permission	1	change_permission
3	Can delete permission	1	delete_permission
4	Can add group	2	add_group
5	Can change group	2	change_group
6	Can delete group	2	delete_group
7	Can add user	3	add_user
8	Can change user	3	change_user
9	Can delete user	3	delete_user
10	Can add content type	4	add_contenttype
11	Can change content type	4	change_contenttype
12	Can delete content type	4	delete_contenttype
13	Can add session	5	add_session
14	Can change session	5	change_session
15	Can delete session	5	delete_session
16	Can add site	6	add_site
17	Can change site	6	change_site
18	Can delete site	6	delete_site
19	Can add log entry	7	add_logentry
20	Can change log entry	7	change_logentry
21	Can delete log entry	7	delete_logentry
22	Can add migration history	8	add_migrationhistory
23	Can change migration history	8	change_migrationhistory
24	Can delete migration history	8	delete_migrationhistory
25	Can add band member	9	add_bandmember
26	Can change band member	9	change_bandmember
27	Can delete band member	9	delete_bandmember
28	Can add gig	10	add_gig
29	Can change gig	10	change_gig
30	Can delete gig	10	delete_gig
31	Can add track	11	add_track
32	Can change track	11	change_track
33	Can delete track	11	delete_track
34	Can add album	12	add_album
35	Can change album	12	change_album
36	Can delete album	12	delete_album
37	Can add device token	13	add_devicetoken
38	Can change device token	13	change_devicetoken
39	Can delete device token	13	delete_devicetoken
40	Can add push message	14	add_pushmessage
41	Can change push message	14	change_pushmessage
42	Can delete push message	14	delete_pushmessage
43	Can add news article	15	add_newsarticle
44	Can change news article	15	change_newsarticle
45	Can delete news article	15	delete_newsarticle
46	Can add photo	16	add_photo
47	Can change photo	16	change_photo
48	Can delete photo	16	delete_photo
49	Can add kv store	17	add_kvstore
50	Can change kv store	17	change_kvstore
51	Can delete kv store	17	delete_kvstore
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: walkincoma
--

COPY auth_user (id, username, first_name, last_name, email, password, is_staff, is_active, is_superuser, last_login, date_joined) FROM stdin;
2	tomcase	Tom	Case	tomcase@urban-butterfly.co.uk	pbkdf2_sha256$10000$c64YgoLcQvcp$zKOu4Ix3ft9O8Zp3aISr4rKYi1XBdVNvPUvisZXDmo8=	t	t	t	2012-05-12 23:01:05.363519+01	2012-04-17 20:39:27+01
1	nickp666	Nick	Pack	nick@nickpack.com	pbkdf2_sha256$10000$fvhbwqUGDc9W$sA+L1FQGpkIOH/5R2GG4Q6aIp5ihJGQ2O8gmqscZrA8=	t	t	t	2012-05-18 14:17:43.257805+01	2012-04-11 21:08:04+01
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: walkincoma
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: walkincoma
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: walkincoma
--

COPY django_admin_log (id, action_time, user_id, content_type_id, object_id, object_repr, action_flag, change_message) FROM stdin;
1	2012-04-12 13:40:19.441324+01	1	9	1	Nick	1	
2	2012-04-12 14:10:36.600045+01	1	9	1	Nick	2	Changed avatar.
3	2012-04-12 14:14:51.09891+01	1	9	1	Nick	2	Changed avatar.
4	2012-04-12 15:11:32.418997+01	1	9	1	Nick	2	Changed avatar.
5	2012-04-12 15:12:33.767595+01	1	9	1	Nick	2	Changed avatar.
6	2012-04-12 15:13:29.684213+01	1	9	1	Nick	2	Changed avatar.
7	2012-04-12 15:16:11.25832+01	1	9	1	Nick	2	Changed avatar.
8	2012-04-12 15:19:40.174205+01	1	9	1	Nick	2	Changed avatar.
9	2012-04-12 15:20:26.595141+01	1	9	1	Nick	2	Changed avatar.
10	2012-04-12 15:21:16.429824+01	1	9	1	Nick	2	Changed avatar.
11	2012-04-16 20:29:57.954704+01	1	9	2	Mark	1	
12	2012-04-16 20:30:22.395084+01	1	9	3	Tom	1	
13	2012-04-16 20:31:06.329408+01	1	9	4	AJ	1	
14	2012-04-16 20:31:30.888427+01	1	11	1	(You Don't Know) Anyone	1	
15	2012-04-16 20:31:42.524435+01	1	11	2	In Spite Of This	1	
16	2012-04-16 20:31:53.388004+01	1	11	3	Space Monkeys	1	
17	2012-04-16 20:32:03.648089+01	1	11	4	Listen	1	
18	2012-04-16 20:32:13.714787+01	1	11	5	In Circles	1	
19	2012-04-16 20:32:23.985694+01	1	11	6	Dirty South (Live Demo)	1	
20	2012-04-16 20:32:33.439384+01	1	11	7	Proven (Acoustic)	1	
21	2012-04-16 20:34:30.622968+01	1	12	1	Anyone	1	
22	2012-04-16 20:35:00.260103+01	1	11	8	Prey Hunter	1	
23	2012-04-16 20:35:13.575371+01	1	11	9	94/44	1	
24	2012-04-16 20:35:22.517532+01	1	11	10	Dirty South	1	
25	2012-04-16 20:36:58.160743+01	1	12	2	When The Prey Becomes The Hunter	1	
26	2012-04-16 20:41:09.000763+01	1	15	1	NewsArticle object	1	
27	2012-04-16 20:43:05.532875+01	1	10	1	Battle of the bands Round 2	1	
28	2012-04-16 21:59:48.278669+01	1	9	3	Bambi	2	Changed nickname.
29	2012-04-16 21:59:58.90544+01	1	9	2	Mk2	2	Changed nickname.
30	2012-04-16 22:00:06.099477+01	1	9	1	Bastard	2	Changed nickname.
31	2012-04-17 20:39:28.066079+01	1	3	2	tomcase	1	
32	2012-04-17 20:39:48.048961+01	1	3	2	tomcase	2	Changed password, first_name, last_name, email, is_staff and is_superuser.
33	2012-04-17 20:40:04.487847+01	1	3	1	nickp666	2	Changed password, first_name and last_name.
34	2012-04-17 20:43:02.886219+01	2	9	3	Bambi	2	Changed gear.
35	2012-04-17 20:45:44.836008+01	2	9	3	Bambi	2	Changed bio.
36	2012-04-17 20:46:23.450764+01	2	9	3	Bambi	2	Changed gear.
37	2012-04-17 20:46:53.736884+01	2	9	3	Bambi	2	Changed gear.
38	2012-04-17 20:47:26.044406+01	2	9	3	Bambi	2	Changed bio.
39	2012-04-17 20:48:44.830702+01	2	9	2	Mk2	2	Changed bio and gear.
40	2012-04-17 20:49:31.883953+01	2	9	2	Mk2	2	Changed bio.
41	2012-04-17 20:49:45.004209+01	1	9	1	Bastard	2	Changed gear.
42	2012-04-17 20:51:35.129327+01	1	9	1	Bastard	2	Changed role_in_band.
43	2012-04-17 20:52:48.356363+01	2	9	3	Bambi	2	Changed gear.
44	2012-04-17 20:53:29.140459+01	1	9	1	Bastard	2	Changed gear.
45	2012-04-17 20:54:39.426414+01	1	9	1	Bastard	2	Changed bio and gear.
46	2012-04-17 20:56:22.035753+01	2	9	3	Bambi	2	Changed bio and gear.
47	2012-04-17 21:15:53.519347+01	1	15	1	New Site	2	Changed slug.
48	2012-04-17 21:36:18.68309+01	1	9	1	Bastard	2	Changed gear.
49	2012-04-17 21:39:04.469084+01	1	9	1	Bastard	2	Changed bio.
50	2012-04-17 21:40:05.62575+01	1	9	2	Mk2	2	Changed bio and gear.
51	2012-04-17 22:13:03.071793+01	2	9	3	Bambi	2	Changed bio.
52	2012-04-17 22:14:22.586122+01	2	9	3	Bambi	2	Changed avatar.
53	2012-04-17 22:15:17.222239+01	2	9	4	AJ	2	Changed bio.
54	2012-04-17 22:17:43.323537+01	1	15	2	Through to round 2 of Burtons BOTB	1	
55	2012-04-17 22:18:48.299849+01	2	9	3	Bambi	2	Changed bio.
56	2012-04-17 22:20:28.954453+01	2	9	3	Bambi	2	Changed bio.
57	2012-04-17 22:28:11.253331+01	1	15	3	Recording "When the prey becomes the hunter"	1	
58	2012-04-17 22:30:53.667807+01	1	15	4	New apps on the way	1	
59	2012-04-17 22:39:02.532309+01	2	9	3	Bambi	2	Changed avatar.
60	2012-04-17 22:41:01.214864+01	2	9	3	Bambi	2	Changed gear.
61	2012-04-17 22:43:03.0541+01	2	10	2	The Bull, Colchester	1	
62	2012-04-17 22:43:38.676302+01	1	15	1	New Site	2	Changed article_body.
63	2012-04-17 22:45:33.963091+01	2	10	2	The Bull, Colchester	2	Changed location.
64	2012-04-17 22:46:30.876647+01	2	10	1	Battle of the bands Round 2	2	Changed location.
65	2012-04-17 23:01:01.30722+01	2	10	3	Battle Of The Bands, Round 1	1	
66	2012-04-17 23:02:41.17504+01	2	10	4	SAKS, Southend-on-Sea	1	
67	2012-04-18 12:19:42.132684+01	2	9	3	Bambi	2	Changed gear.
68	2012-04-18 12:22:08.148037+01	2	9	3	Bambi	2	Changed bio.
69	2012-04-18 12:23:43.55072+01	2	9	3	Bambi	2	Changed bio.
70	2012-04-18 12:25:09.472769+01	2	10	1	Burtons BOTB, Round 2	2	Changed title.
71	2012-04-18 12:25:22.338714+01	2	10	3	Burtons BOTB, Round 1	2	Changed title.
72	2012-04-18 12:27:43.766632+01	2	10	5	Chinnerys, Southend-on-Sea	1	
73	2012-04-18 23:06:15.253481+01	2	9	2	Mk2	2	Changed bio and gear.
74	2012-04-18 23:07:42.849947+01	2	9	4	AJ	2	Changed bio.
75	2012-04-18 23:08:32.786273+01	2	9	1	Bastard	2	Changed gear.
76	2012-04-19 16:12:35.930128+01	1	9	2	Mk2	2	Changed gear.
77	2012-04-23 13:42:14.945646+01	1	11	11	Layne	1	
78	2012-04-23 13:42:32.221031+01	1	11	12	Homoerotic Incestuallity	1	
79	2012-04-23 13:42:46.622763+01	1	11	13	Old Bleeding Man	1	
80	2012-04-23 13:42:59.685331+01	1	11	14	False Idol	1	
81	2012-04-23 13:43:12.20201+01	1	12	3	Lyrics In Random Places	1	
82	2012-04-23 13:43:43.313085+01	1	11	15	Whore Fags	1	
83	2012-04-23 13:43:59.205202+01	1	11	16	The Word	1	
84	2012-04-23 13:44:10.995513+01	1	11	17	Masterpiece	1	
85	2012-04-23 13:44:17.037258+01	1	12	4	E.P. II	1	
86	2012-05-12 23:01:30.484615+01	2	9	4	AJ	2	Changed gear.
87	2012-05-12 23:02:28.02686+01	2	9	3	Bambi	2	Changed gear.
88	2012-05-18 15:40:18.674628+01	1	12	2	When The Prey Becomes The Hunter	2	Changed tracks.
89	2012-05-18 17:20:42.929008+01	1	10	2	The Bull, Colchester	2	Changed venue_pic.
90	2012-05-18 17:23:38.680539+01	1	10	1	Burtons BOTB, Round 2	2	Changed venue_pic.
91	2012-05-18 17:28:47.158909+01	1	10	3	Burtons BOTB, Round 1	2	Changed venue_pic.
92	2012-05-18 17:29:17.870496+01	1	10	4	SAKS, Southend-on-Sea	2	Changed venue_pic.
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: walkincoma
--

COPY django_content_type (id, name, app_label, model) FROM stdin;
1	permission	auth	permission
2	group	auth	group
3	user	auth	user
4	content type	contenttypes	contenttype
5	session	sessions	session
6	site	sites	site
7	log entry	admin	logentry
8	migration history	south	migrationhistory
9	band member	wic	bandmember
10	gig	wic	gig
11	track	wic	track
12	album	wic	album
13	device token	wic	devicetoken
14	push message	wic	pushmessage
15	news article	wic	newsarticle
16	photo	wic	photo
17	kv store	thumbnail	kvstore
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: walkincoma
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
c84b2432d6cf1418064f3774de7c71c8	N2NhYjM3NDVhYjI4YWFjYjBiMDkwM2I2ZDhiNDZiZGI5ZWUyNTc2OTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLAXUu\n	2012-04-26 13:39:49.722495+01
2973f5f8be8654e4b13a13f1c9f5ec76	ODExNjMxOWZiN2QwNWFkNjMwODY3MGM1MmM2YTI3MzUyM2MzYjg3MTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLAnUu\n	2012-05-01 20:39:52.342217+01
e6c1f6d3d9d94af3e8d50d76f68b5d0d	YWE5OTU4NTdmOTQ5NjU0NzBlM2MzNTcyMGZlYTBmOTM0NjhiOTJjNDqAAn1xAS4=\n	2012-05-26 23:06:22.188818+01
ddcd36232d56cadffa83787f837954d3	N2NhYjM3NDVhYjI4YWFjYjBiMDkwM2I2ZDhiNDZiZGI5ZWUyNTc2OTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLAXUu\n	2012-06-01 14:17:43.267915+01
\.


--
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: walkincoma
--

COPY django_site (id, domain, name) FROM stdin;
1	example.com	example.com
\.


--
-- Data for Name: south_migrationhistory; Type: TABLE DATA; Schema: public; Owner: walkincoma
--

COPY south_migrationhistory (id, app_name, migration, applied) FROM stdin;
1	wic	0001_initial	2012-04-11 21:08:12.42764+01
2	wic	0002_auto__chg_field_photo_flickr_id	2012-04-11 21:08:12.640218+01
3	wic	0003_auto	2012-04-11 21:08:12.693227+01
4	wic	0004_auto__add_field_bandmember_is_active	2012-04-11 21:08:12.767687+01
5	wic	0005_auto__chg_field_album_cover__chg_field_bandmember_avatar	2012-04-11 21:08:12.988396+01
6	wic	0006_auto__chg_field_album_cover__chg_field_bandmember_avatar__add_field_ne	2012-04-17 21:10:09.67022+01
7	wic	0007_auto__chg_field_album_label__chg_field_bandmember_bio__chg_field_bandm	2012-05-18 16:02:40.343268+01
\.


--
-- Data for Name: thumbnail_kvstore; Type: TABLE DATA; Schema: public; Owner: walkincoma
--

COPY thumbnail_kvstore (key, value) FROM stdin;
sorl-thumbnail||image||fb0157fb3aa9fdc31b09dea61917caf1	{"storage": "django.core.files.storage.FileSystemStorage", "name": "avatars/535032_412802708733689_170302436317052_1776085_1469052726_n.jpg", "size": [640, 960]}
sorl-thumbnail||image||c403ad0f778736c48f2c219cae8f9927	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/e0/ec/e0ec085ed2637bb15115c8e2b51d3aaa.jpg", "size": [100, 100]}
sorl-thumbnail||thumbnails||fb0157fb3aa9fdc31b09dea61917caf1	["c403ad0f778736c48f2c219cae8f9927"]
sorl-thumbnail||image||23b15cb3a7950925e5802785491e38ba	{"storage": "django.core.files.storage.FileSystemStorage", "name": "avatars/darth_vader-wide.jpg", "size": [1920, 1200]}
sorl-thumbnail||image||89a5980a9d4d61630d27e4734b044231	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/76/45/7645df8930fd579eb8368df293f38d7e.jpg", "size": [100, 100]}
sorl-thumbnail||thumbnails||23b15cb3a7950925e5802785491e38ba	["89a5980a9d4d61630d27e4734b044231"]
sorl-thumbnail||image||8226cb43580ce84eb6fb7d305ecc1aa5	{"storage": "django.core.files.storage.FileSystemStorage", "name": "avatars/fallout3.jpg", "size": [1600, 1200]}
sorl-thumbnail||image||673c2bf854da853d1c0eb0f7018c38ca	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/93/d0/93d099afd2d66efee9a0d258b707bb2f.jpg", "size": [100, 100]}
sorl-thumbnail||thumbnails||8226cb43580ce84eb6fb7d305ecc1aa5	["673c2bf854da853d1c0eb0f7018c38ca"]
sorl-thumbnail||image||6e7997ad0adda591f65bb50dde6f8941	{"storage": "django.core.files.storage.FileSystemStorage", "name": "avatars/eightbit-61d039f8-5e11-48d5-990a-27064cc61f9d.png", "size": [100, 100]}
sorl-thumbnail||image||745823bbd3a822ddb239468013c1e7ea	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/3d/43/3d431b512d98196bcd24508ac32a1202.jpg", "size": [100, 100]}
sorl-thumbnail||thumbnails||6e7997ad0adda591f65bb50dde6f8941	["745823bbd3a822ddb239468013c1e7ea"]
sorl-thumbnail||image||aebb2b5620a94a9167c19bc95d4e6d8a	{"storage": "django.core.files.storage.FileSystemStorage", "name": "avatars/IMAG0003.jpg", "size": [2592, 1552]}
sorl-thumbnail||image||77cbf67474bff5371c1b4fd3f9431cd9	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/8f/de/8fde3b698ed530bd6b83fe5f4682f066.jpg", "size": [100, 100]}
sorl-thumbnail||thumbnails||aebb2b5620a94a9167c19bc95d4e6d8a	["77cbf67474bff5371c1b4fd3f9431cd9"]
sorl-thumbnail||image||987fd2f9befd2179cc8f0148a82a2ad6	{"storage": "django.core.files.storage.FileSystemStorage", "name": "avatars/hoogadrumming.jpg", "size": [640, 960]}
sorl-thumbnail||image||99daa2f0438d29dfed1b6e18eea88c86	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/d6/ba/d6ba27a7612606fc8f2bfbfd0208fca4.jpg", "size": [100, 100]}
sorl-thumbnail||image||705d40f0d314bfd2052ea36887366019	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/ad/51/ad51db970f7385b1f0ea878689bc667b.jpg", "size": [270, 100]}
sorl-thumbnail||image||3f19f3122c087a9b278d8875fcab4505	{"storage": "django.core.files.storage.FileSystemStorage", "name": "avatars/alex.jpg", "size": [640, 960]}
sorl-thumbnail||image||4eb2cfa4b0bcd0b9301d6fed14b79363	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/4c/b5/4cb53170b25a00b83c278751eb211c0e.jpg", "size": [100, 100]}
sorl-thumbnail||image||f41fde42a0045456120bab71c82e9f1f	{"storage": "django.core.files.storage.FileSystemStorage", "name": "avatars/mark.jpg", "size": [640, 960]}
sorl-thumbnail||image||ec9987b7651632e4333cca7eab21ce08	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/b4/4c/b44ca3a6a0ac9e777c02cffe9f7b84d7.jpg", "size": [100, 100]}
sorl-thumbnail||image||daaed015d9e51a91eab40fda10a6e95f	{"storage": "django.core.files.storage.FileSystemStorage", "name": "avatars/tom.jpg", "size": [640, 960]}
sorl-thumbnail||image||7414f0baf725d194c5cbc176f719e6b4	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/ae/7b/ae7b339856f1d6e502049f582b49c63c.jpg", "size": [100, 100]}
sorl-thumbnail||image||536fb2f8b4f512bde65d7cf558accdb7	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/10/36/10363331b2a9871ec4655973577ed8fc.jpg", "size": [270, 100]}
sorl-thumbnail||image||ccabfb64569f6a958d7941f966c08780	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/2a/1a/2a1a4840ed676128c77b820d2b9adba1.jpg", "size": [270, 100]}
sorl-thumbnail||image||d48a0ed81588395b6098afebc52074b9	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/2f/3c/2f3c209fb11a936d176fb33b17494cc5.jpg", "size": [270, 100]}
sorl-thumbnail||image||f7b89aa84516953c00422a65221b1cf4	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/7b/aa/7baa3b76e53f1297800b771f74da60b7.jpg", "size": [270, 100]}
sorl-thumbnail||image||63037cda605ec1b3634d12e2ba29743f	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/a3/09/a309ffa4c40be9b43ccb3bd936930743.jpg", "size": [270, 100]}
sorl-thumbnail||image||3148e967e7ab37fe347b3c9b102605d1	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/45/0a/450a3e018f31e1d9a91098d587e29cc2.jpg", "size": [270, 100]}
sorl-thumbnail||thumbnails||3f19f3122c087a9b278d8875fcab4505	["ccabfb64569f6a958d7941f966c08780", "c182f27c49ed72d7f4f393fb3155d635", "4eb2cfa4b0bcd0b9301d6fed14b79363"]
sorl-thumbnail||image||b0ecc692c1d36628dd425332a775699c	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/69/f0/69f093cf6ebf8754d40626a719de988c.jpg", "size": [270, 100]}
sorl-thumbnail||thumbnails||f41fde42a0045456120bab71c82e9f1f	["ec9987b7651632e4333cca7eab21ce08", "d48a0ed81588395b6098afebc52074b9", "28349f1ee7266e263619000c8f08b4e1"]
sorl-thumbnail||image||9e10ec19976d8208717cf900cae3e421	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/72/0a/720ada308be1c98196e3f5e2bb8fd2ee.jpg", "size": [270, 100]}
sorl-thumbnail||thumbnails||daaed015d9e51a91eab40fda10a6e95f	["3148e967e7ab37fe347b3c9b102605d1", "7414f0baf725d194c5cbc176f719e6b4", "b2095a0825c43ce6951dce0eb799a7fd"]
sorl-thumbnail||image||1327561d414f2b89191566cc045bce68	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/2d/62/2d628a3fa4d552d6a240d98f5cbb0103.jpg", "size": [270, 100]}
sorl-thumbnail||thumbnails||608a57f777fbd363635c276547fcc318	["5fe6d5e8a85c18272c85abd1f75e9827", "28e3c2ac6d2d383932bf3e18df7b61ab"]
sorl-thumbnail||image||bdcee99b07bf931922b51ba54ec99e1a	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/fa/4e/fa4e6aaee6554255a70c00aae81af0e7.jpg", "size": [270, 100]}
sorl-thumbnail||image||c7e1f94a0eb1cb9c8ed2e5fe39612a14	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/54/84/54847fc63e8a60be84c639a86b0f86f6.jpg", "size": [270, 100]}
sorl-thumbnail||image||f28b17219c3b5dd714029a1eac7dbe91	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/b6/bd/b6bd8be263376c355fb24a37ed94c316.jpg", "size": [270, 100]}
sorl-thumbnail||image||a8007c76cdd029c0b202d0467cdf083e	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/00/df/00df14473963123681585602568bb66a.jpg", "size": [270, 100]}
sorl-thumbnail||image||edce846f3bf3fc723b92b3be54dcedde	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/38/13/381362c9be8ee08a05253fefad1cf613.jpg", "size": [270, 100]}
sorl-thumbnail||image||f39e44b80814463a64e62a82be96da48	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/d0/8a/d08a770a011206097888e2e0d88ac712.jpg", "size": [270, 100]}
sorl-thumbnail||image||c182f27c49ed72d7f4f393fb3155d635	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/0a/b5/0ab5b77f84f0a79133554f64c3360241.jpg", "size": [250, 100]}
sorl-thumbnail||image||28349f1ee7266e263619000c8f08b4e1	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/57/7e/577ed1b01914fc59593e9a49b30c17c4.jpg", "size": [250, 100]}
sorl-thumbnail||image||d5e50eae10176b30d80df7e0faf80a35	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/13/a5/13a5f9c053d71a8192a7829f26250391.jpg", "size": [250, 100]}
sorl-thumbnail||thumbnails||987fd2f9befd2179cc8f0148a82a2ad6	["99daa2f0438d29dfed1b6e18eea88c86", "63037cda605ec1b3634d12e2ba29743f", "d5e50eae10176b30d80df7e0faf80a35"]
sorl-thumbnail||image||b2095a0825c43ce6951dce0eb799a7fd	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/63/53/6353ced316049e457ad5cca3a817f67e.jpg", "size": [250, 100]}
sorl-thumbnail||image||208a4138b948638bb25b2110b3e9efbe	{"storage": "django.core.files.storage.FileSystemStorage", "name": "albums/musicplaceholder.png", "size": [549, 500]}
sorl-thumbnail||image||175e2231490567b43b544b2912abfdc6	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/66/df/66dfd30012cd810ec3818e9e98c01e4d.jpg", "size": [100, 91]}
sorl-thumbnail||image||0e49be8995c5d0e0fdb09c3308855f1d	{"storage": "django.core.files.storage.FileSystemStorage", "name": "avatars/avatar_tom.jpg", "size": [200, 300]}
sorl-thumbnail||image||fb0c1049697d32a073c3771e15a9f78b	{"storage": "django.core.files.storage.FileSystemStorage", "name": "albums/eightbit-61d039f8-5e11-48d5-990a-27064cc61f9d.png", "size": [100, 100]}
sorl-thumbnail||image||c278de05e058ee2abc046c40b5e6b153	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/33/09/3309cda4f01570bf2f9c820ac3c066d8.jpg", "size": [100, 100]}
sorl-thumbnail||image||710591e563a6fe588a9051ff5c652f60	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/c0/07/c007c9a813b881fae6537dcb30a0fb25.jpg", "size": [60, 55]}
sorl-thumbnail||image||2f7f0a521009969ab1bde92a2b8270ea	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/ff/cb/ffcb81bde175b69b5b72aeb2ab7ae510.jpg", "size": [250, 100]}
sorl-thumbnail||image||76885e5ad9f72bb25f82ce16d844959d	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/fd/72/fd7206187a156945fde27fc9ebd6b605.jpg", "size": [60, 60]}
sorl-thumbnail||image||6c04e14f0431d57b8ca8a3e1fd6bdb7e	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/9b/fa/9bfa7b7e47957798840943d1c5a16b8a.jpg", "size": [70, 64]}
sorl-thumbnail||image||4a166c237ca20ffd3ac393d4e65527f2	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/e3/70/e370ca6bb7da90394ae6e0d8840dc2c5.jpg", "size": [70, 70]}
sorl-thumbnail||thumbnails||c7377dc2d98ad7cb94a4a49d7a2b07fa	["fb3ff2b3d0760a9c26c57bb8158da45a"]
sorl-thumbnail||thumbnails||0e49be8995c5d0e0fdb09c3308855f1d	["2f7f0a521009969ab1bde92a2b8270ea"]
sorl-thumbnail||image||0b3f038dec42100c6d5a5c8336e67a13	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/e6/78/e678d8ac77dbe5948a8aaf4e93b5c408.jpg", "size": [170, 155]}
sorl-thumbnail||thumbnails||208a4138b948638bb25b2110b3e9efbe	["710591e563a6fe588a9051ff5c652f60", "6c04e14f0431d57b8ca8a3e1fd6bdb7e", "0b3f038dec42100c6d5a5c8336e67a13", "3dad6ad5fa3fb001fd5f05c834a35217", "175e2231490567b43b544b2912abfdc6", "c4886dd57e9fea7e3bad226f94cc5fc4"]
sorl-thumbnail||image||93b6dd3928fc93bb97feed9166ca7499	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/71/58/7158c2057ef4667b657ebe91f48f3e28.jpg", "size": [170, 170]}
sorl-thumbnail||image||5c509bd2f45e20c57cb1aea206192a87	{"storage": "django.core.files.storage.FileSystemStorage", "name": "albums/l_1.jpg", "size": [384, 383]}
sorl-thumbnail||image||c7377dc2d98ad7cb94a4a49d7a2b07fa	{"storage": "django.core.files.storage.FileSystemStorage", "name": "avatars/541831_10150903195885200_515015199_12832547_1673904551_n.jpg", "size": [640, 960]}
sorl-thumbnail||image||fb3ff2b3d0760a9c26c57bb8158da45a	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/e4/9c/e49c4057e3c619d62721f019190a4e32.jpg", "size": [250, 100]}
sorl-thumbnail||image||c4886dd57e9fea7e3bad226f94cc5fc4	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/47/d7/47d74503bb2d34bb528c6a84a96cf7ca.jpg", "size": [140, 128]}
sorl-thumbnail||thumbnails||5c509bd2f45e20c57cb1aea206192a87	["5766f3a2f53e5f62c7a046d98f72b94a", "3c4db2716c106ba69a665ffe7330b356"]
sorl-thumbnail||image||b296c801957adedf8f3807ab9d64c3ff	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/f0/b1/f0b1a4525ada6fbae9ac13760f4080a8.jpg", "size": [140, 140]}
sorl-thumbnail||image||3c4db2716c106ba69a665ffe7330b356	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/16/cf/16cf3a3ffa8dfc17f4ff7743d915d10c.jpg", "size": [140, 140]}
sorl-thumbnail||image||608a57f777fbd363635c276547fcc318	{"storage": "django.core.files.storage.FileSystemStorage", "name": "albums/l.jpg", "size": [384, 383]}
sorl-thumbnail||image||28e3c2ac6d2d383932bf3e18df7b61ab	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/e3/55/e3559a423ae2b25716b4c998a02cd919.jpg", "size": [140, 140]}
sorl-thumbnail||image||ae8fb14d58c33a7646beb627a0110593	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/a4/52/a45287e91796bd5ac272d40dcd1f9aeb.jpg", "size": [150, 150]}
sorl-thumbnail||thumbnails||fb0c1049697d32a073c3771e15a9f78b	["93b6dd3928fc93bb97feed9166ca7499", "ae8fb14d58c33a7646beb627a0110593", "76885e5ad9f72bb25f82ce16d844959d", "c278de05e058ee2abc046c40b5e6b153", "b296c801957adedf8f3807ab9d64c3ff", "4a166c237ca20ffd3ac393d4e65527f2"]
sorl-thumbnail||image||3dad6ad5fa3fb001fd5f05c834a35217	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/d2/98/d298474c87be273733694b12556adf3d.jpg", "size": [150, 137]}
sorl-thumbnail||image||5766f3a2f53e5f62c7a046d98f72b94a	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/d7/1f/d71f297359a63b53eaceec163737ef83.jpg", "size": [150, 150]}
sorl-thumbnail||image||5fe6d5e8a85c18272c85abd1f75e9827	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/ec/78/ec7864ec404fe5ea07703d41f24c4e83.jpg", "size": [150, 150]}
sorl-thumbnail||image||3a5a32971cd98dd7ec9a53e1628ff2ef	{"storage": "django.core.files.storage.FileSystemStorage", "name": "avatars/Header.jpg", "size": [814, 155]}
sorl-thumbnail||image||cc52f1ac0ddd99fa5303677ccf34b7b2	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/51/32/513214036ae63df4ba9fedb1cc191678.jpg", "size": [260, 180]}
sorl-thumbnail||thumbnails||3a5a32971cd98dd7ec9a53e1628ff2ef	["cc52f1ac0ddd99fa5303677ccf34b7b2"]
sorl-thumbnail||image||10341c916be329f1887b3eaf74cd56eb	{"storage": "django.core.files.storage.FileSystemStorage", "name": "avatars/2515610_c4ae6680.jpg", "size": [640, 411]}
sorl-thumbnail||image||374f0f509f5e3fefd6a13f9f02dc8526	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/a4/24/a4240d9761187fa812f45cd8ba53822d.jpg", "size": [260, 180]}
sorl-thumbnail||thumbnails||10341c916be329f1887b3eaf74cd56eb	["374f0f509f5e3fefd6a13f9f02dc8526"]
\.


--
-- Data for Name: wic_album; Type: TABLE DATA; Schema: public; Owner: walkincoma
--

COPY wic_album (id, title, release_date, label, cover) FROM stdin;
1	Anyone	2011-07-02	N/A	albums/musicplaceholder.png
3	Lyrics In Random Places	2008-06-02	N/A	albums/l.jpg
4	E.P. II	2009-06-02	N/A	albums/l_1.jpg
2	When The Prey Becomes The Hunter	2012-04-29	N/A	albums/eightbit-61d039f8-5e11-48d5-990a-27064cc61f9d.png
\.


--
-- Data for Name: wic_album_members; Type: TABLE DATA; Schema: public; Owner: walkincoma
--

COPY wic_album_members (id, album_id, bandmember_id) FROM stdin;
1	1	2
2	1	3
3	1	4
8	3	2
9	3	4
10	4	2
11	4	4
12	2	1
13	2	2
14	2	3
15	2	4
\.


--
-- Data for Name: wic_album_tracks; Type: TABLE DATA; Schema: public; Owner: walkincoma
--

COPY wic_album_tracks (id, album_id, track_id) FROM stdin;
1	1	1
2	1	2
3	1	3
4	1	4
5	1	5
6	1	6
7	1	7
11	3	11
12	3	12
13	3	13
14	3	14
15	4	16
16	4	17
17	4	15
18	2	8
19	2	9
\.


--
-- Data for Name: wic_bandmember; Type: TABLE DATA; Schema: public; Owner: walkincoma
--

COPY wic_bandmember (id, nickname, first_name, last_name, role_in_band, bio, gear, avatar, is_active) FROM stdin;
1	Bastard	Nick	Pack	Drums/Percussion	John Bonham\r\nPaul Bostaph\r\nDaniel Erlandsson\r\nKeith Moon\r\nNicholas Barker	Pearl Export EX Charcoal Metallic\r\nPDP 14"x5" Steel Snare\r\nEvans G2 & EMAD Heads\r\nPearl and Mapex Hardware\r\nPaiste Alpha Black Crash, Splash, Sound Edge Hi-Hats\r\nPaiste 501 Crash\r\nZildjian ZXT Rock Crash/Ride, Ride, China\r\nZildjian Z Custom Crash\r\nTama Iron Cobra Double Pedal\r\nAhead 5A Sticks	avatars/hoogadrumming.jpg	t
2	Mk2	Mark	Elliott	Guitars	Slipknot\r\nRage Against The Machine\r\nSoundgarden\r\nPearl Jam\r\nAlice In Chains\r\nTool\r\nParkway Drive\r\nAvenged Sevenfold\r\nDeftones\r\nFuneral For A Friend\r\nMark Tremonti/Alter Bridge	ESP LTD M-1000\r\nFender Telecaster\r\nPeavey 6505+ Head\r\nMarshall 1960 Lead 4x12 Guitar Cabinet\r\nJim Dunlop Dimebag CFH Signature Wah\r\nElectro Harmonix Small Clone Chorus\r\nBoss RV-5 Digital Reverb\r\nBoss DD-7 Digital Delay\r\nMXR Smart Gate\r\nBoss TU-2 Tuner\r\nElixir And Planet Waves Cables	avatars/mark.jpg	t
4	AJ	Alex	Adlington	Vocals, Guitars	Alice In Chains\r\nChris Cornell/Soundgarden\r\nSlipknot\r\nEddie Vedder\r\nLamb Of God\r\nThe Who\r\nKelly Jones\r\nMachine Head\r\nTool\r\nTom Waits	Epiphone G-400\r\nMarshall JCM800\r\nDigitech Grunge Distortion\r\nMXR Doubleshot Distortion\r\nBoss CH-1 Chorus\r\nBoss DS-2 Turbo Distortion\r\nBoss TU-2 Tuner	avatars/alex.jpg	t
3	Bambi	Tom	Case	Bass, Vocals	Trent Reznor/Nine Inch Nails\r\nParadise Lost\r\nJohnny Cash\r\nPaul Gray/Slipknot\r\nTwiggy Ramirez/Marilyn Manson\r\nChi Cheng/Deftones\r\nRadiohead\r\nVersaEmerge\r\nArchitects\r\nJustin Meldal-Johnson	Epiphone Thunderbird IV (Ltd Custom Shop)\r\nESP LTD B-15 (5-String)\r\nIbanez GSR200\r\nAshdown Electric Blue 180 Head\r\nAshdown MAG410 Deep Cab\r\nTech 21 SansAmp Bass Driver D.I.\r\nBoss ODB-3 Distortion\r\nJim Dunlop Crybaby  105Q Bass Wah\r\nBehringer TU300 Chromatic Tuner	avatars/541831_10150903195885200_515015199_12832547_1673904551_n.jpg	t
\.


--
-- Data for Name: wic_devicetoken; Type: TABLE DATA; Schema: public; Owner: walkincoma
--

COPY wic_devicetoken (id, device_id, date_subscribed) FROM stdin;
\.


--
-- Data for Name: wic_gig; Type: TABLE DATA; Schema: public; Owner: walkincoma
--

COPY wic_gig (id, title, event_info, start_date, end_date, location, other_bands, venue_pic, is_cancelled) FROM stdin;
5	Chinnerys, Southend-on-Sea	 	2012-03-16 20:00:00+00	2012-03-16 23:00:00+00	Chinnerys, 21-22 Marine Parade, Southend-on-Sea, Essex, SS1 2EJ	Storm Of Ashes, DMT, One Fell Down	\N	f
2	The Bull, Colchester	TBC	2012-06-14 18:00:00+01	2012-06-14 23:00:00+01	The Bull, 2-4 Crouch Street, Colchester, Essex, CO3 3ES	TBC	avatars/Header.jpg	f
1	Burtons BOTB, Round 2	Following our success in the first round, we are invited to play the second round.	2012-06-23 20:00:00+01	2012-06-23 22:30:00+01	Burtons, 22-24 High Street, Grays, Essex, RM17 6LU	TBC	avatars/2515610_c4ae6680.jpg	f
3	Burtons BOTB, Round 1	 	2012-04-14 20:30:00+01	2012-04-14 22:30:00+01	Burtons, 22-24 High Street, Grays, Essex, RM17 6LU	We Live To Tell, Avenue	avatars/2515610_c4ae6680_1.jpg	f
4	SAKS, Southend-on-Sea	 	2012-04-13 20:30:00+01	2012-04-13 23:00:00+01	SAKS, 24-25 Clifftown Road, Southend-on-Sea, Essex, SS1 1AB	Afterglow, Stratus	avatars/2709412123_35c321f59b.jpg	f
\.


--
-- Data for Name: wic_newsarticle; Type: TABLE DATA; Schema: public; Owner: walkincoma
--

COPY wic_newsarticle (id, title, article_date, article_body, slug) FROM stdin;
2	Through to round 2 of Burtons BOTB	2012-04-14	We played Burtons (Grays Snooker Club) tonight, and although we had some fierce competition managed to get through to the next round of the battle of the bands they are holding.\r\n\r\nOur next Burtons gig is on the 27th of July, more details to follow but keep an eye on the Live page for more information as it becomes available.\r\n\r\nWe would like to take the opportunity to thank the other bands we gigged with for making it a good night:\r\nWe Live To Tell\r\nAvenue\r\n	through-round-2-burtons-botb
3	Recording "When the prey becomes the hunter"	2012-04-17	We are proud to announce that we will be recording the first demo for the new line-up on the 29th.\r\n\r\nThe demo is due to feature two new tracks and one re-recorded with a completely different sound:\r\nPrey Hunter\r\n94/44\r\nDirty South\r\n\r\nThe band are massively excited about this, and cannot wait to get in the studio so that we can get the tracks down and out for you guys to listen to.\r\n\r\nWatch this space for further updates.\r\n\r\n-Nick	recording-when-prey-becomes-hunter
4	New apps on the way	2012-04-16	Following the complete overhaul of our site, new iOS and Android apps are currently in development.\r\n\r\nThe new site paves the way for a whole new feature set for our apps and we cant wait to bring them to you.\r\n\r\nThe new iOS app will be first, followed closely by its Android counterpart.\r\n\r\nWe will need some beta testers once the development is a bit further on, please let us know if you'd like to be one of the early adopters.\r\n\r\n- Nick	new-apps-way
1	New Site	2012-04-16	As you can see if you have been here before, our site has had a massive overhaul.\r\n\r\nOnce development is complete, I will open source the codebase in the hope that it is useful to other bands.\r\n\r\nThe app itself is based on Django 1.4 and has a full set of APIs and full Apple Push Notification support for those of you that have your own band apps, you can publish your events directly to your user base with next to no effort at all.\r\n\r\nWatch this space for further updates.\r\n\r\n- Nick	new-site
\.


--
-- Data for Name: wic_newsarticle_posted_by; Type: TABLE DATA; Schema: public; Owner: walkincoma
--

COPY wic_newsarticle_posted_by (id, newsarticle_id, bandmember_id) FROM stdin;
3	2	1
4	3	1
5	4	1
6	1	1
\.


--
-- Data for Name: wic_photo; Type: TABLE DATA; Schema: public; Owner: walkincoma
--

COPY wic_photo (id, title, flickr_id, flickr_owner, flickr_server, flickr_secret) FROM stdin;
1	Maple Studios - 11/03/12	6974335207	53127318@N08	7051	c73fa6949f
2	Maple Studios - 11/03/12	6974334883	53127318@N08	7186	7e7e0796b0
3	Maple Studios - 11/03/12	6828212258	53127318@N08	7048	c1e3832af4
4	Maple Studios - 11/03/12	6974334223	53127318@N08	7184	a327cfc77f
5	Maple Studios - 11/03/12	6974333927	53127318@N08	7183	3fed932683
6	Maple Studios - 11/03/12	6974333647	53127318@N08	7042	c989bb521a
7	Maple Studios - 04/03/12	6959932201	53127318@N08	7051	63b0f6bb1d
8	Maple Studios - 04/03/12	6959932103	53127318@N08	7049	08e6ceffb9
9	Maple Studios - 04/03/12	6959931835	53127318@N08	7042	55738692d6
10	Maple Studios - 04/03/12	6813817820	53127318@N08	7046	08ac97e805
11	Maple Studios - 04/03/12	6957196461	53127318@N08	7040	26d54bf4f3
12	Maple Studios - 04/03/12	6957196355	53127318@N08	7054	c93163f816
13	Maple Studios - 04/03/12	6957196269	53127318@N08	7060	b6c0e35060
14	Maple Studios - 04/03/12	6957196145	53127318@N08	7185	9cf95b54cd
15	Maple Studios - 04/03/12	6957196031	53127318@N08	7209	75b7d0b5ea
16	Maple Studios - 04/03/12	6811086558	53127318@N08	7048	6b720031aa
17	Maple Studios - 04/03/12	6811086460	53127318@N08	7053	21bd0503d9
18	Maple Studios - 04/03/12	6811086398	53127318@N08	7069	2c50d11987
19	Maple Studios - 04/03/12	6811086324	53127318@N08	7050	335e3ccf75
20	Chinnerys, Southend-on-Sea - 19/08/11	6617151689	53127318@N08	7154	6aed36f8b1
21	Chinnerys, Southend-on-Sea - 19/08/11	6617151427	53127318@N08	7166	805a5c3cc1
22	Chinnerys, Southend-on-Sea - 19/08/11	6617151011	53127318@N08	7013	990e80cb3b
23	Chinnerys, Southend-on-Sea - 19/08/11	6617150795	53127318@N08	7173	68875c9735
24	Chinnerys, Southend-on-Sea - 19/08/11	6617150485	53127318@N08	7009	a5aa367e01
25	Chinnerys, Southend-on-Sea - 19/08/11	6617150287	53127318@N08	7034	65259f8805
26	EP Launch Night, The Royal Hotel Basement, Southend-on-Sea - 02/07/11	6617132573	53127318@N08	7009	835351f3d8
27	EP Launch Night, The Royal Hotel Basement, Southend-on-Sea - 02/07/11	6617132209	53127318@N08	7006	26ae8d0842
28	Barfly, London - 02/04/11	6617082977	53127318@N08	7150	ae469858d6
29	Barfly, London - 02/04/11	6617082773	53127318@N08	7022	0fcf9cd322
30	O2 Academy2 Islington - London, 14/07/11	6617068913	53127318@N08	7168	f3e7a39b46
31	O2 Academy2 Islington - London, 14/07/11	6617068771	53127318@N08	7027	7a9b905c9b
32	O2 Academy2 Islington - London, 14/07/11	6617068617	53127318@N08	7143	a038e9bbbb
33	O2 Academy2 Islington - London, 14/07/11	6617068407	53127318@N08	7018	2b45b85ce0
34	O2 Academy2 Islington - London, 14/07/11	6617068193	53127318@N08	7017	a9ebbc4c0a
35	O2 Academy2 Islington - London, 14/07/11	6617067973	53127318@N08	7149	96695bb7cd
36	O2 Academy2 Islington - London, 14/07/11	6617067801	53127318@N08	7160	07d21d22ec
37	O2 Academy2 Islington - London, 14/07/11	6617067589	53127318@N08	7001	eab3675bd8
38	O2 Academy2 Islington - London, 14/07/11	6617067317	53127318@N08	7151	fb9ca5bfd3
39	Purple Turtle, London - 26/05/11	6617049235	53127318@N08	7158	7dfd766759
40	Purple Turtle, London - 26/05/11	6617049011	53127318@N08	7031	d14c0e08d5
41	Purple Turtle, London - 26/05/11	6617048783	53127318@N08	7014	e363122358
42	Purple Turtle, London - 26/05/11	6617048601	53127318@N08	7147	6cbae799cd
43	Purple Turtle, London - 26/05/11	6617048451	53127318@N08	7170	d0414ec6d4
44	Purple Turtle, London - 26/05/11	6617048223	53127318@N08	7012	d6c7f07606
45	Purple Turtle, London - 26/05/11	6617048015	53127318@N08	7174	c61da11633
46	Purple Turtle, London - 26/05/11	6617047809	53127318@N08	7167	ba0a65c05e
47	Purple Turtle, London - 26/05/11	6617047621	53127318@N08	7166	31a4bfe093
48	Purple Turtle, London - 26/05/11	6617047421	53127318@N08	7161	f880480c51
49	Purple Turtle, London - 26/05/11	6617047233	53127318@N08	7028	b4af882a0d
50	Purple Turtle, London - 26/05/11	6617047041	53127318@N08	7008	cf2212e10a
51	Purple Turtle, London - 26/05/11	6617046787	53127318@N08	7032	6da31e3955
52	Purple Turtle, London - 26/05/11	6617046479	53127318@N08	7170	40c088443d
53	229, London - 13/04/11	6616974041	53127318@N08	7156	0cfa8f5961
54	229, London - 13/04/11	6616973855	53127318@N08	7175	ac0fbfbd06
55	229, London - 13/04/11	6616973683	53127318@N08	7003	b43ed1c457
56	229, London - 13/04/11	6616973499	53127318@N08	7031	2c6d49f655
57	229, London - 13/04/11	6616973321	53127318@N08	7147	fb74fddffa
58	229, London - 13/04/11	6616973129	53127318@N08	7170	7710ec9950
59	229, London - 13/04/11	6616972955	53127318@N08	7024	920f8a5a3e
60	229, London - 13/04/11	6616972657	53127318@N08	7144	78846db44e
61	229, London - 13/04/11	6616972365	53127318@N08	7008	71a86628d5
62	229, London - 13/04/11	6616972095	53127318@N08	7144	1ec898ec6a
63	229, London - 13/04/11	6616971787	53127318@N08	7024	92326b6e60
64	229, London - 13/04/11	6616971451	53127318@N08	7033	6d61624b4c
65	229, London - 13/04/11	6616971139	53127318@N08	7014	9b042c556a
66	229, London - 13/04/11	6616970839	53127318@N08	7023	9221fa6104
67	Walk In Coma - December 2011	6615069285	53127318@N08	7167	c4054f9196
68	Walk In Coma - December 2011	6615068967	53127318@N08	7159	315b7b6ccb
69	Walk In Coma - December 2011	6615068549	53127318@N08	7015	e3d5665487
70	Walk In Coma - December 2011	6615068219	53127318@N08	7025	e12255d6fa
71	Walk In Coma - December 2011	6615067899	53127318@N08	7021	af77d18502
72	Walk In Coma - December 2011	6615067571	53127318@N08	7024	1ae788c3db
73	Walk In Coma - December 2011	6615067173	53127318@N08	7151	1c483ff894
74	Walk In Coma - December 2011	6615066939	53127318@N08	7007	29afff017b
75	Walk In Coma - December 2011	6615066669	53127318@N08	7012	036d570117
76	Walk In Coma - December 2011	6615066345	53127318@N08	7030	f75f6c214c
77	Walk In Coma - December 2011	6615066015	53127318@N08	7030	58862731b8
78	Walk In Coma - December 2011	6615065819	53127318@N08	7173	042cc28a98
79	Tom - Bass - December 2011	6615065589	53127318@N08	7018	33e9571df7
80	Alex - Vocals & Guitars - December 2011	6615065465	53127318@N08	7024	d52bc5a391
81	Nick - Drums - December 2011	6615065339	53127318@N08	7164	be63575163
82	Mark - Guitars - December 2011	6615065075	53127318@N08	7022	f92e9ed7b7
83	The Mill, Rayleigh - 27/08/10 - Stage Right Photography	4935405675	53127318@N08	4093	1be8aeac55
84	The Mill, Rayleigh - 27/08/10 - Stage Right Photography	4935995012	53127318@N08	4098	b20604524d
85	The Mill, Rayleigh - 27/08/10 - Stage Right Photography	4935994886	53127318@N08	4078	7cc6b4ae5a
86	The Mill, Rayleigh - 27/08/10 - Stage Right Photography	4935994794	53127318@N08	4102	56f1f8e334
87	The Mill, Rayleigh - 27/08/10 - Stage Right Photography	4935994704	53127318@N08	4082	c678b419ee
88	The Mill, Rayleigh - 27/08/10 - Stage Right Photography	4935405157	53127318@N08	4134	831a037394
89	The Mill, Rayleigh - 27/08/10 - Stage Right Photography	4935405061	53127318@N08	4120	668e6bb259
90	The Mill, Rayleigh - 27/08/10 - Stage Right Photography	4935404967	53127318@N08	4143	ea9f104a09
91	The Mill, Rayleigh - 27/08/10 - Stage Right Photography	4935404871	53127318@N08	4080	9af82ccbcd
92	The Mill, Rayleigh - 27/08/10 - Stage Right Photography	4935404783	53127318@N08	4121	10dbd6e647
93	The Mill, Rayleigh - 27/08/10 - Stage Right Photography	4935404347	53127318@N08	4073	428b1b545b
94	The Mill, Rayleigh - 27/08/10 - Stage Right Photography	4935993592	53127318@N08	4119	da0c2c7639
95	The Mill, Rayleigh - 27/08/10 - Stage Right Photography	4935404165	53127318@N08	4095	97f40ff4d1
96	The Mill, Rayleigh - 27/08/10 - Stage Right Photography	4935993388	53127318@N08	4119	cffe202ece
97	The Mill, Rayleigh - 27/08/10 - Stage Right Photography	4935403939	53127318@N08	4119	27cc1684b2
98	The Mill, Rayleigh - 27/08/10 - Stage Right Photography	4935993174	53127318@N08	4080	232d9727f8
99	The Mill, Rayleigh - 27/08/10 - Stage Right Photography	4935403779	53127318@N08	4097	d7b876776b
100	The Mill, Rayleigh - 27/08/10 - Stage Right Photography	4935993000	53127318@N08	4137	1a6c0b734c
101	The Mill, Rayleigh - 27/08/10 - Stage Right Photography	4935992908	53127318@N08	4116	e6989c4500
102	The Mill, Rayleigh - 27/08/10 - Stage Right Photography	4935403473	53127318@N08	4141	b5ca79433d
103	The Mill, Rayleigh - 27/08/10 - Stage Right Photography	4935992720	53127318@N08	4120	91f783ed04
104	The Mill, Rayleigh - 27/08/10 - Stage Right Photography	4935992610	53127318@N08	4141	04e227817a
105	The Mill, Rayleigh - 27/08/10 - Stage Right Photography	4935992494	53127318@N08	4079	84424cdc8e
106	The Mill, Rayleigh - 27/08/10 - Stage Right Photography	4935403071	53127318@N08	4115	988a224f17
107	The Mill, Rayleigh - 27/08/10 - Stage Right Photography	4935402941	53127318@N08	4096	7983fbccbf
108	The Mill, Rayleigh - 27/08/10 - Stage Right Photography	4935992212	53127318@N08	4094	791aa005f1
109	The Mill, Rayleigh - 27/08/10 - Stage Right Photography	4935992090	53127318@N08	4141	1a400db5b2
110	The Mill, Rayleigh - 27/08/10 - Stage Right Photography	4935402589	53127318@N08	4074	df4cf5ce8b
111	The Mill, Rayleigh - 27/08/10 - Stage Right Photography	4935402477	53127318@N08	4116	a95da8493c
112	The Mill, Rayleigh - 27/08/10 - Stage Right Photography	4935991636	53127318@N08	4082	f8fe8ec81c
113	Chinnerys, Southend-on-Sea - 09/07/10	4897195282	53127318@N08	4119	f6c437fdc1
114	Chinnerys, Southend-on-Sea - 09/07/10	4897195222	53127318@N08	4140	a516dca933
115	Chinnerys, Southend-on-Sea - 09/07/10	4896600227	53127318@N08	4101	08d35b296a
116	Chinnerys, Southend-on-Sea - 09/07/10	4897195078	53127318@N08	4073	314b3d6feb
117	Chinnerys, Southend-on-Sea - 09/07/10	4896600057	53127318@N08	4119	be01085a49
118	Chinnerys, Southend-on-Sea - 09/07/10	4897194956	53127318@N08	4099	5cc81363b5
119	Chinnerys, Southend-on-Sea - 09/07/10	4896599897	53127318@N08	4141	6e2c9db2cc
120	Chinnerys, Southend-on-Sea - 09/07/10	4897194802	53127318@N08	4074	8742a6fa8e
121	Chinnerys, Southend-on-Sea - 09/07/10	4897194706	53127318@N08	4138	91db777ca2
122	Chinnerys, Southend-on-Sea - 09/07/10	4896599693	53127318@N08	4095	181f2164e8
123	Chinnerys, Southend-on-Sea - 09/07/10	4897194564	53127318@N08	4115	aef0cd90bb
124	Chinnerys, Southend-on-Sea - 09/07/10	4896599573	53127318@N08	4115	2d65d0e7a7
125	Chinnerys, Southend-on-Sea - 09/07/10	4897194470	53127318@N08	4118	494823c55e
126	Chinnerys, Southend-on-Sea - 09/07/10	4897194422	53127318@N08	4074	648022e3c8
127	Chinnerys, Southend-on-Sea - 09/07/10	4897194286	53127318@N08	4079	d567b89a82
128	Chinnerys, Southend-on-Sea - 09/07/10	4897194226	53127318@N08	4138	ca54052352
129	Chinnerys, Southend-on-Sea - 09/07/10	4897194130	53127318@N08	4116	7f894841bc
130	Chinnerys, Southend-on-Sea - 09/07/10	4896599145	53127318@N08	4074	a32a76b074
131	The Railway Hotel, Southend-on-Sea - 25/03/12	6948342896	53127318@N08	7188	dce7ae9744
132	The Railway Hotel, Southend-on-Sea - 25/03/12	7094412223	53127318@N08	7139	43bd7b4fae
133	The Railway Hotel, Southend-on-Sea - 25/03/12	7094412119	53127318@N08	7279	ba8d730e8e
134	The Railway Hotel, Southend-on-Sea - 25/03/12	6948342662	53127318@N08	7105	379b222ef5
135	The Railway Hotel, Southend-on-Sea - 25/03/12	7094411945	53127318@N08	7238	dd7a6a4487
136	Chinnerys, Southend-on-Sea - 16/03/12	7094393759	53127318@N08	7275	10357a155d
137	Chinnerys, Southend-on-Sea - 16/03/12	6948324350	53127318@N08	7126	d539f01c56
138	Chinnerys, Southend-on-Sea - 16/03/12	6948324272	53127318@N08	7102	bb3b7295a3
139	Chinnerys, Southend-on-Sea - 16/03/12	7094393567	53127318@N08	7065	d16dc52207
140	Chinnerys, Southend-on-Sea - 16/03/12	6948324100	53127318@N08	7206	4963bf4721
141	O2 Academy2, Islington - 20/01/12	6948308166	53127318@N08	5326	f96a358b81
142	O2 Academy2, Islington - 20/01/12	6948308090	53127318@N08	7244	32b572c6e6
\.


--
-- Data for Name: wic_pushmessage; Type: TABLE DATA; Schema: public; Owner: walkincoma
--

COPY wic_pushmessage (id, message, date_sent) FROM stdin;
\.


--
-- Data for Name: wic_track; Type: TABLE DATA; Schema: public; Owner: walkincoma
--

COPY wic_track (id, title, release_date) FROM stdin;
1	(You Don't Know) Anyone	2011-07-02
2	In Spite Of This	2011-07-02
3	Space Monkeys	2011-07-02
4	Listen	2011-07-02
5	In Circles	2011-07-02
6	Dirty South (Live Demo)	2011-07-02
7	Proven (Acoustic)	2011-07-02
8	Prey Hunter	2012-04-29
9	94/44	2012-04-29
10	Dirty South	2012-04-29
11	Layne	2008-06-02
12	Homoerotic Incestuallity	2008-06-02
13	Old Bleeding Man	2008-06-02
14	False Idol	2008-06-02
15	Whore Fags	2008-06-02
16	The Word	2009-06-02
17	Masterpiece	2009-06-02
\.


--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: walkincoma; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_key; Type: CONSTRAINT; Schema: public; Owner: walkincoma; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_key UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: walkincoma; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: walkincoma; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_key; Type: CONSTRAINT; Schema: public; Owner: walkincoma; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_key UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: walkincoma; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: walkincoma; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_user_id_key; Type: CONSTRAINT; Schema: public; Owner: walkincoma; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_key UNIQUE (user_id, group_id);


--
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: walkincoma; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: walkincoma; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_user_id_key; Type: CONSTRAINT; Schema: public; Owner: walkincoma; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_key UNIQUE (user_id, permission_id);


--
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: walkincoma; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: walkincoma; Tablespace: 
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_key; Type: CONSTRAINT; Schema: public; Owner: walkincoma; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_key UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: walkincoma; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: walkincoma; Tablespace: 
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: django_site_pkey; Type: CONSTRAINT; Schema: public; Owner: walkincoma; Tablespace: 
--

ALTER TABLE ONLY django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- Name: south_migrationhistory_pkey; Type: CONSTRAINT; Schema: public; Owner: walkincoma; Tablespace: 
--

ALTER TABLE ONLY south_migrationhistory
    ADD CONSTRAINT south_migrationhistory_pkey PRIMARY KEY (id);


--
-- Name: thumbnail_kvstore_pkey; Type: CONSTRAINT; Schema: public; Owner: walkincoma; Tablespace: 
--

ALTER TABLE ONLY thumbnail_kvstore
    ADD CONSTRAINT thumbnail_kvstore_pkey PRIMARY KEY (key);


--
-- Name: wic_album_members_album_id_a18b88ef30b6243_uniq; Type: CONSTRAINT; Schema: public; Owner: walkincoma; Tablespace: 
--

ALTER TABLE ONLY wic_album_members
    ADD CONSTRAINT wic_album_members_album_id_a18b88ef30b6243_uniq UNIQUE (album_id, bandmember_id);


--
-- Name: wic_album_members_pkey; Type: CONSTRAINT; Schema: public; Owner: walkincoma; Tablespace: 
--

ALTER TABLE ONLY wic_album_members
    ADD CONSTRAINT wic_album_members_pkey PRIMARY KEY (id);


--
-- Name: wic_album_pkey; Type: CONSTRAINT; Schema: public; Owner: walkincoma; Tablespace: 
--

ALTER TABLE ONLY wic_album
    ADD CONSTRAINT wic_album_pkey PRIMARY KEY (id);


--
-- Name: wic_album_tracks_album_id_8684844d4115e44_uniq; Type: CONSTRAINT; Schema: public; Owner: walkincoma; Tablespace: 
--

ALTER TABLE ONLY wic_album_tracks
    ADD CONSTRAINT wic_album_tracks_album_id_8684844d4115e44_uniq UNIQUE (album_id, track_id);


--
-- Name: wic_album_tracks_pkey; Type: CONSTRAINT; Schema: public; Owner: walkincoma; Tablespace: 
--

ALTER TABLE ONLY wic_album_tracks
    ADD CONSTRAINT wic_album_tracks_pkey PRIMARY KEY (id);


--
-- Name: wic_bandmember_pkey; Type: CONSTRAINT; Schema: public; Owner: walkincoma; Tablespace: 
--

ALTER TABLE ONLY wic_bandmember
    ADD CONSTRAINT wic_bandmember_pkey PRIMARY KEY (id);


--
-- Name: wic_devicetoken_pkey; Type: CONSTRAINT; Schema: public; Owner: walkincoma; Tablespace: 
--

ALTER TABLE ONLY wic_devicetoken
    ADD CONSTRAINT wic_devicetoken_pkey PRIMARY KEY (id);


--
-- Name: wic_gig_pkey; Type: CONSTRAINT; Schema: public; Owner: walkincoma; Tablespace: 
--

ALTER TABLE ONLY wic_gig
    ADD CONSTRAINT wic_gig_pkey PRIMARY KEY (id);


--
-- Name: wic_newsarticle_pkey; Type: CONSTRAINT; Schema: public; Owner: walkincoma; Tablespace: 
--

ALTER TABLE ONLY wic_newsarticle
    ADD CONSTRAINT wic_newsarticle_pkey PRIMARY KEY (id);


--
-- Name: wic_newsarticle_posted_by_newsarticle_id_31f87985d67bb909_uniq; Type: CONSTRAINT; Schema: public; Owner: walkincoma; Tablespace: 
--

ALTER TABLE ONLY wic_newsarticle_posted_by
    ADD CONSTRAINT wic_newsarticle_posted_by_newsarticle_id_31f87985d67bb909_uniq UNIQUE (newsarticle_id, bandmember_id);


--
-- Name: wic_newsarticle_posted_by_pkey; Type: CONSTRAINT; Schema: public; Owner: walkincoma; Tablespace: 
--

ALTER TABLE ONLY wic_newsarticle_posted_by
    ADD CONSTRAINT wic_newsarticle_posted_by_pkey PRIMARY KEY (id);


--
-- Name: wic_photo_pkey; Type: CONSTRAINT; Schema: public; Owner: walkincoma; Tablespace: 
--

ALTER TABLE ONLY wic_photo
    ADD CONSTRAINT wic_photo_pkey PRIMARY KEY (id);


--
-- Name: wic_pushmessage_pkey; Type: CONSTRAINT; Schema: public; Owner: walkincoma; Tablespace: 
--

ALTER TABLE ONLY wic_pushmessage
    ADD CONSTRAINT wic_pushmessage_pkey PRIMARY KEY (id);


--
-- Name: wic_track_pkey; Type: CONSTRAINT; Schema: public; Owner: walkincoma; Tablespace: 
--

ALTER TABLE ONLY wic_track
    ADD CONSTRAINT wic_track_pkey PRIMARY KEY (id);


--
-- Name: auth_group_permissions_group_id; Type: INDEX; Schema: public; Owner: walkincoma; Tablespace: 
--

CREATE INDEX auth_group_permissions_group_id ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id; Type: INDEX; Schema: public; Owner: walkincoma; Tablespace: 
--

CREATE INDEX auth_group_permissions_permission_id ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id; Type: INDEX; Schema: public; Owner: walkincoma; Tablespace: 
--

CREATE INDEX auth_permission_content_type_id ON auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id; Type: INDEX; Schema: public; Owner: walkincoma; Tablespace: 
--

CREATE INDEX auth_user_groups_group_id ON auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id; Type: INDEX; Schema: public; Owner: walkincoma; Tablespace: 
--

CREATE INDEX auth_user_groups_user_id ON auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id; Type: INDEX; Schema: public; Owner: walkincoma; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_permission_id ON auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id; Type: INDEX; Schema: public; Owner: walkincoma; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_user_id ON auth_user_user_permissions USING btree (user_id);


--
-- Name: django_admin_log_content_type_id; Type: INDEX; Schema: public; Owner: walkincoma; Tablespace: 
--

CREATE INDEX django_admin_log_content_type_id ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id; Type: INDEX; Schema: public; Owner: walkincoma; Tablespace: 
--

CREATE INDEX django_admin_log_user_id ON django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date; Type: INDEX; Schema: public; Owner: walkincoma; Tablespace: 
--

CREATE INDEX django_session_expire_date ON django_session USING btree (expire_date);


--
-- Name: wic_album_members_album_id; Type: INDEX; Schema: public; Owner: walkincoma; Tablespace: 
--

CREATE INDEX wic_album_members_album_id ON wic_album_members USING btree (album_id);


--
-- Name: wic_album_members_bandmember_id; Type: INDEX; Schema: public; Owner: walkincoma; Tablespace: 
--

CREATE INDEX wic_album_members_bandmember_id ON wic_album_members USING btree (bandmember_id);


--
-- Name: wic_album_tracks_album_id; Type: INDEX; Schema: public; Owner: walkincoma; Tablespace: 
--

CREATE INDEX wic_album_tracks_album_id ON wic_album_tracks USING btree (album_id);


--
-- Name: wic_album_tracks_track_id; Type: INDEX; Schema: public; Owner: walkincoma; Tablespace: 
--

CREATE INDEX wic_album_tracks_track_id ON wic_album_tracks USING btree (track_id);


--
-- Name: wic_newsarticle_posted_by_bandmember_id; Type: INDEX; Schema: public; Owner: walkincoma; Tablespace: 
--

CREATE INDEX wic_newsarticle_posted_by_bandmember_id ON wic_newsarticle_posted_by USING btree (bandmember_id);


--
-- Name: wic_newsarticle_posted_by_newsarticle_id; Type: INDEX; Schema: public; Owner: walkincoma; Tablespace: 
--

CREATE INDEX wic_newsarticle_posted_by_newsarticle_id ON wic_newsarticle_posted_by USING btree (newsarticle_id);


--
-- Name: wic_newsarticle_slug; Type: INDEX; Schema: public; Owner: walkincoma; Tablespace: 
--

CREATE INDEX wic_newsarticle_slug ON wic_newsarticle USING btree (slug);


--
-- Name: wic_newsarticle_slug_like; Type: INDEX; Schema: public; Owner: walkincoma; Tablespace: 
--

CREATE INDEX wic_newsarticle_slug_like ON wic_newsarticle USING btree (slug varchar_pattern_ops);


--
-- Name: album_id_refs_id_2706362cab1aef19; Type: FK CONSTRAINT; Schema: public; Owner: walkincoma
--

ALTER TABLE ONLY wic_album_tracks
    ADD CONSTRAINT album_id_refs_id_2706362cab1aef19 FOREIGN KEY (album_id) REFERENCES wic_album(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: album_id_refs_id_2b3d9cdc7bf7e16d; Type: FK CONSTRAINT; Schema: public; Owner: walkincoma
--

ALTER TABLE ONLY wic_album_members
    ADD CONSTRAINT album_id_refs_id_2b3d9cdc7bf7e16d FOREIGN KEY (album_id) REFERENCES wic_album(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: walkincoma
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: walkincoma
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_fkey FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: walkincoma
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: bandmember_id_refs_id_51426124a519c8c8; Type: FK CONSTRAINT; Schema: public; Owner: walkincoma
--

ALTER TABLE ONLY wic_album_members
    ADD CONSTRAINT bandmember_id_refs_id_51426124a519c8c8 FOREIGN KEY (bandmember_id) REFERENCES wic_bandmember(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: bandmember_id_refs_id_74bc71ea3afd7cfe; Type: FK CONSTRAINT; Schema: public; Owner: walkincoma
--

ALTER TABLE ONLY wic_newsarticle_posted_by
    ADD CONSTRAINT bandmember_id_refs_id_74bc71ea3afd7cfe FOREIGN KEY (bandmember_id) REFERENCES wic_bandmember(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: content_type_id_refs_id_728de91f; Type: FK CONSTRAINT; Schema: public; Owner: walkincoma
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT content_type_id_refs_id_728de91f FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_content_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: walkincoma
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_fkey FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: walkincoma
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: group_id_refs_id_3cea63fe; Type: FK CONSTRAINT; Schema: public; Owner: walkincoma
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT group_id_refs_id_3cea63fe FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: newsarticle_id_refs_id_75856b348955c233; Type: FK CONSTRAINT; Schema: public; Owner: walkincoma
--

ALTER TABLE ONLY wic_newsarticle_posted_by
    ADD CONSTRAINT newsarticle_id_refs_id_75856b348955c233 FOREIGN KEY (newsarticle_id) REFERENCES wic_newsarticle(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: track_id_refs_id_56df824e19679c57; Type: FK CONSTRAINT; Schema: public; Owner: walkincoma
--

ALTER TABLE ONLY wic_album_tracks
    ADD CONSTRAINT track_id_refs_id_56df824e19679c57 FOREIGN KEY (track_id) REFERENCES wic_track(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_831107f1; Type: FK CONSTRAINT; Schema: public; Owner: walkincoma
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT user_id_refs_id_831107f1 FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_f2045483; Type: FK CONSTRAINT; Schema: public; Owner: walkincoma
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT user_id_refs_id_f2045483 FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

