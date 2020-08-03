--
-- PostgreSQL database dump
--

-- Dumped from database version 10.12 (Ubuntu 10.12-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.12 (Ubuntu 10.12-0ubuntu0.18.04.1)

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
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: account_emailaddress; Type: TABLE; Schema: public; Owner: 3900user
--

CREATE TABLE public.account_emailaddress (
    id integer NOT NULL,
    email character varying(254) NOT NULL,
    verified boolean NOT NULL,
    "primary" boolean NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.account_emailaddress OWNER TO "3900user";

--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE; Schema: public; Owner: 3900user
--

CREATE SEQUENCE public.account_emailaddress_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_emailaddress_id_seq OWNER TO "3900user";

--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: 3900user
--

ALTER SEQUENCE public.account_emailaddress_id_seq OWNED BY public.account_emailaddress.id;


--
-- Name: account_emailconfirmation; Type: TABLE; Schema: public; Owner: 3900user
--

CREATE TABLE public.account_emailconfirmation (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    sent timestamp with time zone,
    key character varying(64) NOT NULL,
    email_address_id integer NOT NULL
);


ALTER TABLE public.account_emailconfirmation OWNER TO "3900user";

--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE; Schema: public; Owner: 3900user
--

CREATE SEQUENCE public.account_emailconfirmation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_emailconfirmation_id_seq OWNER TO "3900user";

--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: 3900user
--

ALTER SEQUENCE public.account_emailconfirmation_id_seq OWNED BY public.account_emailconfirmation.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: 3900user
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO "3900user";

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: 3900user
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO "3900user";

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: 3900user
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: 3900user
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO "3900user";

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: 3900user
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO "3900user";

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: 3900user
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: 3900user
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO "3900user";

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: 3900user
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO "3900user";

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: 3900user
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: 3900user
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO "3900user";

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: 3900user
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO "3900user";

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: 3900user
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO "3900user";

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: 3900user
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: 3900user
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO "3900user";

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: 3900user
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: 3900user
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO "3900user";

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: 3900user
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO "3900user";

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: 3900user
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: authors; Type: TABLE; Schema: public; Owner: 3900user
--

CREATE TABLE public.authors (
    id integer NOT NULL,
    author_name character varying(200) NOT NULL
);


ALTER TABLE public.authors OWNER TO "3900user";

--
-- Name: authors_id_seq; Type: SEQUENCE; Schema: public; Owner: 3900user
--

CREATE SEQUENCE public.authors_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.authors_id_seq OWNER TO "3900user";

--
-- Name: authors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: 3900user
--

ALTER SEQUENCE public.authors_id_seq OWNED BY public.authors.id;


--
-- Name: authtoken_token; Type: TABLE; Schema: public; Owner: 3900user
--

CREATE TABLE public.authtoken_token (
    key character varying(40) NOT NULL,
    created timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.authtoken_token OWNER TO "3900user";

--
-- Name: books; Type: TABLE; Schema: public; Owner: 3900user
--

CREATE TABLE public.books (
    id integer NOT NULL,
    book_title character varying(200) NOT NULL,
    book_synopsis text NOT NULL,
    book_publisher character varying(200) NOT NULL,
    publication_date date NOT NULL,
    genre character varying(50) NOT NULL,
    average_rating double precision NOT NULL,
    book_thumbnail character varying(200) NOT NULL
);


ALTER TABLE public.books OWNER TO "3900user";

--
-- Name: books_id_seq; Type: SEQUENCE; Schema: public; Owner: 3900user
--

CREATE SEQUENCE public.books_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.books_id_seq OWNER TO "3900user";

--
-- Name: books_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: 3900user
--

ALTER SEQUENCE public.books_id_seq OWNED BY public.books.id;


--
-- Name: collection; Type: TABLE; Schema: public; Owner: 3900user
--

CREATE TABLE public.collection (
    id integer NOT NULL,
    collection_type character varying(10) NOT NULL,
    is_private boolean NOT NULL,
    description text NOT NULL,
    collection_name character varying(200) NOT NULL,
    count integer NOT NULL,
    date_created timestamp with time zone NOT NULL,
    owner_id integer
);


ALTER TABLE public.collection OWNER TO "3900user";

--
-- Name: collection_id_seq; Type: SEQUENCE; Schema: public; Owner: 3900user
--

CREATE SEQUENCE public.collection_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.collection_id_seq OWNER TO "3900user";

--
-- Name: collection_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: 3900user
--

ALTER SEQUENCE public.collection_id_seq OWNED BY public.collection.id;


--
-- Name: contains; Type: TABLE; Schema: public; Owner: 3900user
--

CREATE TABLE public.contains (
    id integer NOT NULL,
    time_added timestamp with time zone NOT NULL,
    book_id integer NOT NULL,
    collection_id integer NOT NULL
);


ALTER TABLE public.contains OWNER TO "3900user";

--
-- Name: contains_id_seq; Type: SEQUENCE; Schema: public; Owner: 3900user
--

CREATE SEQUENCE public.contains_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contains_id_seq OWNER TO "3900user";

--
-- Name: contains_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: 3900user
--

ALTER SEQUENCE public.contains_id_seq OWNED BY public.contains.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: 3900user
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO "3900user";

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: 3900user
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO "3900user";

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: 3900user
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: 3900user
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO "3900user";

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: 3900user
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO "3900user";

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: 3900user
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: 3900user
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO "3900user";

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: 3900user
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO "3900user";

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: 3900user
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: 3900user
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO "3900user";

--
-- Name: django_site; Type: TABLE; Schema: public; Owner: 3900user
--

CREATE TABLE public.django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.django_site OWNER TO "3900user";

--
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: 3900user
--

CREATE SEQUENCE public.django_site_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_site_id_seq OWNER TO "3900user";

--
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: 3900user
--

ALTER SEQUENCE public.django_site_id_seq OWNED BY public.django_site.id;


--
-- Name: knox_authtoken; Type: TABLE; Schema: public; Owner: 3900user
--

CREATE TABLE public.knox_authtoken (
    digest character varying(128) NOT NULL,
    salt character varying(16) NOT NULL,
    created timestamp with time zone NOT NULL,
    user_id integer NOT NULL,
    expiry timestamp with time zone,
    token_key character varying(8) NOT NULL
);


ALTER TABLE public.knox_authtoken OWNER TO "3900user";

--
-- Name: profiles; Type: TABLE; Schema: public; Owner: 3900user
--

CREATE TABLE public.profiles (
    id integer NOT NULL,
    verification_code character varying(100) NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.profiles OWNER TO "3900user";

--
-- Name: profiles_id_seq; Type: SEQUENCE; Schema: public; Owner: 3900user
--

CREATE SEQUENCE public.profiles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.profiles_id_seq OWNER TO "3900user";

--
-- Name: profiles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: 3900user
--

ALTER SEQUENCE public.profiles_id_seq OWNED BY public.profiles.id;


--
-- Name: reads; Type: TABLE; Schema: public; Owner: 3900user
--

CREATE TABLE public.reads (
    id integer NOT NULL,
    book_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.reads OWNER TO "3900user";

--
-- Name: reads_id_seq; Type: SEQUENCE; Schema: public; Owner: 3900user
--

CREATE SEQUENCE public.reads_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reads_id_seq OWNER TO "3900user";

--
-- Name: reads_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: 3900user
--

ALTER SEQUENCE public.reads_id_seq OWNED BY public.reads.id;


--
-- Name: reviews; Type: TABLE; Schema: public; Owner: 3900user
--

CREATE TABLE public.reviews (
    id integer NOT NULL,
    review text NOT NULL,
    rating integer NOT NULL,
    date date NOT NULL,
    book_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.reviews OWNER TO "3900user";

--
-- Name: reviews_id_seq; Type: SEQUENCE; Schema: public; Owner: 3900user
--

CREATE SEQUENCE public.reviews_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reviews_id_seq OWNER TO "3900user";

--
-- Name: reviews_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: 3900user
--

ALTER SEQUENCE public.reviews_id_seq OWNED BY public.reviews.id;


--
-- Name: simple_email_confirmation_emailaddress; Type: TABLE; Schema: public; Owner: 3900user
--

CREATE TABLE public.simple_email_confirmation_emailaddress (
    id integer NOT NULL,
    email character varying(255) NOT NULL,
    key character varying(40) NOT NULL,
    set_at timestamp with time zone NOT NULL,
    confirmed_at timestamp with time zone,
    user_id integer NOT NULL
);


ALTER TABLE public.simple_email_confirmation_emailaddress OWNER TO "3900user";

--
-- Name: simple_email_confirmation_emailaddress_id_seq; Type: SEQUENCE; Schema: public; Owner: 3900user
--

CREATE SEQUENCE public.simple_email_confirmation_emailaddress_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.simple_email_confirmation_emailaddress_id_seq OWNER TO "3900user";

--
-- Name: simple_email_confirmation_emailaddress_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: 3900user
--

ALTER SEQUENCE public.simple_email_confirmation_emailaddress_id_seq OWNED BY public.simple_email_confirmation_emailaddress.id;


--
-- Name: socialaccount_socialaccount; Type: TABLE; Schema: public; Owner: 3900user
--

CREATE TABLE public.socialaccount_socialaccount (
    id integer NOT NULL,
    provider character varying(30) NOT NULL,
    uid character varying(191) NOT NULL,
    last_login timestamp with time zone NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    extra_data text NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.socialaccount_socialaccount OWNER TO "3900user";

--
-- Name: socialaccount_socialaccount_id_seq; Type: SEQUENCE; Schema: public; Owner: 3900user
--

CREATE SEQUENCE public.socialaccount_socialaccount_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socialaccount_socialaccount_id_seq OWNER TO "3900user";

--
-- Name: socialaccount_socialaccount_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: 3900user
--

ALTER SEQUENCE public.socialaccount_socialaccount_id_seq OWNED BY public.socialaccount_socialaccount.id;


--
-- Name: socialaccount_socialapp; Type: TABLE; Schema: public; Owner: 3900user
--

CREATE TABLE public.socialaccount_socialapp (
    id integer NOT NULL,
    provider character varying(30) NOT NULL,
    name character varying(40) NOT NULL,
    client_id character varying(191) NOT NULL,
    secret character varying(191) NOT NULL,
    key character varying(191) NOT NULL
);


ALTER TABLE public.socialaccount_socialapp OWNER TO "3900user";

--
-- Name: socialaccount_socialapp_id_seq; Type: SEQUENCE; Schema: public; Owner: 3900user
--

CREATE SEQUENCE public.socialaccount_socialapp_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socialaccount_socialapp_id_seq OWNER TO "3900user";

--
-- Name: socialaccount_socialapp_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: 3900user
--

ALTER SEQUENCE public.socialaccount_socialapp_id_seq OWNED BY public.socialaccount_socialapp.id;


--
-- Name: socialaccount_socialapp_sites; Type: TABLE; Schema: public; Owner: 3900user
--

CREATE TABLE public.socialaccount_socialapp_sites (
    id integer NOT NULL,
    socialapp_id integer NOT NULL,
    site_id integer NOT NULL
);


ALTER TABLE public.socialaccount_socialapp_sites OWNER TO "3900user";

--
-- Name: socialaccount_socialapp_sites_id_seq; Type: SEQUENCE; Schema: public; Owner: 3900user
--

CREATE SEQUENCE public.socialaccount_socialapp_sites_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socialaccount_socialapp_sites_id_seq OWNER TO "3900user";

--
-- Name: socialaccount_socialapp_sites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: 3900user
--

ALTER SEQUENCE public.socialaccount_socialapp_sites_id_seq OWNED BY public.socialaccount_socialapp_sites.id;


--
-- Name: socialaccount_socialtoken; Type: TABLE; Schema: public; Owner: 3900user
--

CREATE TABLE public.socialaccount_socialtoken (
    id integer NOT NULL,
    token text NOT NULL,
    token_secret text NOT NULL,
    expires_at timestamp with time zone,
    account_id integer NOT NULL,
    app_id integer NOT NULL
);


ALTER TABLE public.socialaccount_socialtoken OWNER TO "3900user";

--
-- Name: socialaccount_socialtoken_id_seq; Type: SEQUENCE; Schema: public; Owner: 3900user
--

CREATE SEQUENCE public.socialaccount_socialtoken_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socialaccount_socialtoken_id_seq OWNER TO "3900user";

--
-- Name: socialaccount_socialtoken_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: 3900user
--

ALTER SEQUENCE public.socialaccount_socialtoken_id_seq OWNED BY public.socialaccount_socialtoken.id;


--
-- Name: written_by; Type: TABLE; Schema: public; Owner: 3900user
--

CREATE TABLE public.written_by (
    id integer NOT NULL,
    author_id integer NOT NULL,
    book_id integer NOT NULL
);


ALTER TABLE public.written_by OWNER TO "3900user";

--
-- Name: written_by_id_seq; Type: SEQUENCE; Schema: public; Owner: 3900user
--

CREATE SEQUENCE public.written_by_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.written_by_id_seq OWNER TO "3900user";

--
-- Name: written_by_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: 3900user
--

ALTER SEQUENCE public.written_by_id_seq OWNED BY public.written_by.id;


--
-- Name: account_emailaddress id; Type: DEFAULT; Schema: public; Owner: 3900user
--

ALTER TABLE ONLY public.account_emailaddress ALTER COLUMN id SET DEFAULT nextval('public.account_emailaddress_id_seq'::regclass);


--
-- Name: account_emailconfirmation id; Type: DEFAULT; Schema: public; Owner: 3900user
--

ALTER TABLE ONLY public.account_emailconfirmation ALTER COLUMN id SET DEFAULT nextval('public.account_emailconfirmation_id_seq'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: 3900user
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: 3900user
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: 3900user
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: 3900user
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: 3900user
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: 3900user
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: authors id; Type: DEFAULT; Schema: public; Owner: 3900user
--

ALTER TABLE ONLY public.authors ALTER COLUMN id SET DEFAULT nextval('public.authors_id_seq'::regclass);


--
-- Name: books id; Type: DEFAULT; Schema: public; Owner: 3900user
--

ALTER TABLE ONLY public.books ALTER COLUMN id SET DEFAULT nextval('public.books_id_seq'::regclass);


--
-- Name: collection id; Type: DEFAULT; Schema: public; Owner: 3900user
--

ALTER TABLE ONLY public.collection ALTER COLUMN id SET DEFAULT nextval('public.collection_id_seq'::regclass);


--
-- Name: contains id; Type: DEFAULT; Schema: public; Owner: 3900user
--

ALTER TABLE ONLY public.contains ALTER COLUMN id SET DEFAULT nextval('public.contains_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: 3900user
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: 3900user
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: 3900user
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: django_site id; Type: DEFAULT; Schema: public; Owner: 3900user
--

ALTER TABLE ONLY public.django_site ALTER COLUMN id SET DEFAULT nextval('public.django_site_id_seq'::regclass);


--
-- Name: profiles id; Type: DEFAULT; Schema: public; Owner: 3900user
--

ALTER TABLE ONLY public.profiles ALTER COLUMN id SET DEFAULT nextval('public.profiles_id_seq'::regclass);


--
-- Name: reads id; Type: DEFAULT; Schema: public; Owner: 3900user
--

ALTER TABLE ONLY public.reads ALTER COLUMN id SET DEFAULT nextval('public.reads_id_seq'::regclass);


--
-- Name: reviews id; Type: DEFAULT; Schema: public; Owner: 3900user
--

ALTER TABLE ONLY public.reviews ALTER COLUMN id SET DEFAULT nextval('public.reviews_id_seq'::regclass);


--
-- Name: simple_email_confirmation_emailaddress id; Type: DEFAULT; Schema: public; Owner: 3900user
--

ALTER TABLE ONLY public.simple_email_confirmation_emailaddress ALTER COLUMN id SET DEFAULT nextval('public.simple_email_confirmation_emailaddress_id_seq'::regclass);


--
-- Name: socialaccount_socialaccount id; Type: DEFAULT; Schema: public; Owner: 3900user
--

ALTER TABLE ONLY public.socialaccount_socialaccount ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialaccount_id_seq'::regclass);


--
-- Name: socialaccount_socialapp id; Type: DEFAULT; Schema: public; Owner: 3900user
--

ALTER TABLE ONLY public.socialaccount_socialapp ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialapp_id_seq'::regclass);


--
-- Name: socialaccount_socialapp_sites id; Type: DEFAULT; Schema: public; Owner: 3900user
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialapp_sites_id_seq'::regclass);


--
-- Name: socialaccount_socialtoken id; Type: DEFAULT; Schema: public; Owner: 3900user
--

ALTER TABLE ONLY public.socialaccount_socialtoken ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialtoken_id_seq'::regclass);


--
-- Name: written_by id; Type: DEFAULT; Schema: public; Owner: 3900user
--

ALTER TABLE ONLY public.written_by ALTER COLUMN id SET DEFAULT nextval('public.written_by_id_seq'::regclass);


--
-- Data for Name: account_emailaddress; Type: TABLE DATA; Schema: public; Owner: 3900user
--

COPY public.account_emailaddress (id, email, verified, "primary", user_id) FROM stdin;
\.


--
-- Data for Name: account_emailconfirmation; Type: TABLE DATA; Schema: public; Owner: 3900user
--

COPY public.account_emailconfirmation (id, created, sent, key, email_address_id) FROM stdin;
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: 3900user
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: 3900user
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: 3900user
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add site	7	add_site
26	Can change site	7	change_site
27	Can delete site	7	delete_site
28	Can view site	7	view_site
29	Can add books	8	add_books
30	Can change books	8	change_books
31	Can delete books	8	delete_books
32	Can view books	8	view_books
33	Can add reads	9	add_reads
34	Can change reads	9	change_reads
35	Can delete reads	9	delete_reads
36	Can view reads	9	view_reads
37	Can add reviews	10	add_reviews
38	Can change reviews	10	change_reviews
39	Can delete reviews	10	delete_reviews
40	Can view reviews	10	view_reviews
41	Can add authors	11	add_authors
42	Can change authors	11	change_authors
43	Can delete authors	11	delete_authors
44	Can view authors	11	view_authors
45	Can add written by	12	add_writtenby
46	Can change written by	12	change_writtenby
47	Can delete written by	12	delete_writtenby
48	Can view written by	12	view_writtenby
49	Can add collections	13	add_collections
50	Can change collections	13	change_collections
51	Can delete collections	13	delete_collections
52	Can view collections	13	view_collections
53	Can add contains	14	add_contains
54	Can change contains	14	change_contains
55	Can delete contains	14	delete_contains
56	Can view contains	14	view_contains
57	Can add profiles	15	add_profiles
58	Can change profiles	15	change_profiles
59	Can delete profiles	15	delete_profiles
60	Can view profiles	15	view_profiles
61	Can add Token	16	add_token
62	Can change Token	16	change_token
63	Can delete Token	16	delete_token
64	Can view Token	16	view_token
65	Can add email address	17	add_emailaddress
66	Can change email address	17	change_emailaddress
67	Can delete email address	17	delete_emailaddress
68	Can view email address	17	view_emailaddress
69	Can add email confirmation	18	add_emailconfirmation
70	Can change email confirmation	18	change_emailconfirmation
71	Can delete email confirmation	18	delete_emailconfirmation
72	Can view email confirmation	18	view_emailconfirmation
73	Can add social account	19	add_socialaccount
74	Can change social account	19	change_socialaccount
75	Can delete social account	19	delete_socialaccount
76	Can view social account	19	view_socialaccount
77	Can add social application	20	add_socialapp
78	Can change social application	20	change_socialapp
79	Can delete social application	20	delete_socialapp
80	Can view social application	20	view_socialapp
81	Can add social application token	21	add_socialtoken
82	Can change social application token	21	change_socialtoken
83	Can delete social application token	21	delete_socialtoken
84	Can view social application token	21	view_socialtoken
85	Can add auth token	22	add_authtoken
86	Can change auth token	22	change_authtoken
87	Can delete auth token	22	delete_authtoken
88	Can view auth token	22	view_authtoken
89	Can add email address	23	add_emailaddress
90	Can change email address	23	change_emailaddress
91	Can delete email address	23	delete_emailaddress
92	Can view email address	23	view_emailaddress
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: 3900user
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
69	pbkdf2_sha256$180000$PMqjP6i6YsS4$HYPfHmsmbSGSSzJ9E3kdYsMQyGnhYquhjLr808+kJTc=	\N	f	farhanghazi	Farhan	Ghazi	farhansghazi@outlook.com	f	t	2020-07-30 23:07:10.953946+10
70	pbkdf2_sha256$180000$LEbZNzwVvCrf$tIRIRUY88UBnafcXFkc6p1eBaoiiEbbDHJYHkrtQEE8=	\N	f	mwang10	Farhan	Ghazi	farhansghazi@outlook.com	f	t	2020-07-31 09:37:35.347789+10
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: 3900user
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: 3900user
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: authors; Type: TABLE DATA; Schema: public; Owner: 3900user
--

COPY public.authors (id, author_name) FROM stdin;
51	Mary L Trump
52	Alex Trebek
53	Ben Shapiro
54	Ibram X Kendi
55	John Bolton
56	Glennon Doyle
57	Eddie S Glaude Jr
58	James Nestor
59	Michelle Obama
60	Tara Westover
61	Anne Applebaum
62	David Horowitz
63	Delia Owens
64	Brad Thor
65	Daniel Silva
66	Brit Bennett
67	Elin Hilderbrand
68	Lucy Foley
69	Lindsay Ellis
70	John Grisham
71	Jim Butcher
72	Jeanine Cummins
73	Kevin Kwan
74	Debbie Macomber
75	Stephen King
76	Emma Donoghue
77	Jennifer Weiner
78	Suzanne Collins
79	Aaron Blabey
80	Dav Pilkey
81	JK Rowling
82	Jeff Kinney
83	Ann M Martin
84	Dav Pilkey
85	Rick Riordan
86	Max Brallier
87	Mary Pope Osborne
88	Jason Reynolds and Ibram X Kendi
89	FC Yee
90	Angie Thomas
91	Karen M McManus
92	James Patterson
93	Cassandra Clare
94	Kiera Cass
95	Elizabeth Acevedo
96	Tomi Adeyemi
97	Tomi Adeyemi
\.


--
-- Data for Name: authtoken_token; Type: TABLE DATA; Schema: public; Owner: 3900user
--

COPY public.authtoken_token (key, created, user_id) FROM stdin;
\.


--
-- Data for Name: books; Type: TABLE DATA; Schema: public; Owner: 3900user
--

COPY public.books (id, book_title, book_synopsis, book_publisher, publication_date, genre, average_rating, book_thumbnail) FROM stdin;
129	TOO MUCH AND NEVER ENOUGH	The clinical psychologist gives her assessment of events and patterns inside her family and how they shaped President Trump.	Simon & Schuster	2020-08-09	NonFiction	0	https://images-na.ssl-images-amazon.com/images/I/51xzDg7YGRL._SX329_BO1,204,203,200_.jpg
130	THE ANSWER IS ...	Who is the Canadian-American who got his break on American TV by hosting the game show “The Wizard of Odds” and whose pronunciation of the word “genre” has been shared widely on social media?	Simon & Schuster	2020-08-09	NonFiction	0	https://images-na.ssl-images-amazon.com/images/I/41eSHmYLY7L._SX331_BO1,204,203,200_.jpg
131	HOW TO DESTROY AMERICA IN THREE EASY STEPS	The conservative commentator describes what he perceives as threats to American history, ideals and culture.	Broadside	2020-08-09	NonFiction	0	https://images-na.ssl-images-amazon.com/images/I/517AjmVWPLL._SX329_BO1,204,203,200_.jpg
132	HOW TO BE AN ANTIRACIST	A primer for creating a more just and equitable society through identifying and opposing racism.	One World	2020-08-09	NonFiction	0	https://images-na.ssl-images-amazon.com/images/I/51JM3rldZCL._SX329_BO1,204,203,200_.jpg
133	THE ROOM WHERE IT HAPPENED	The former national security advisor gives his account of the 17 months he spent working for President Trump.	Simon & Schuster	2020-08-09	NonFiction	0	https://images-na.ssl-images-amazon.com/images/I/41gRbWB7I-L._SX329_BO1,204,203,200_.jpg
134	UNTAMED	The activist and public speaker describes her journey of listening to her inner voice.	Dial	2020-08-09	NonFiction	0	https://images-na.ssl-images-amazon.com/images/I/51tvNGGDTCL._SX329_BO1,204,203,200_.jpg
135	BEGIN AGAIN	An appraisal of the life and work of James Baldwin and their meaning in relation to the Black Lives Matter movement and the Trump presidency.	Crown	2020-08-09	NonFiction	0	https://images-na.ssl-images-amazon.com/images/I/41SgC38NcjL._SX329_BO1,204,203,200_.jpg
136	BREATH	A re-examination of a basic biological function and a look at the science behind ancient breathing practices.	Riverhead	2020-08-09	NonFiction	0	https://images-na.ssl-images-amazon.com/images/I/41o5B3nR1gL._SX329_BO1,204,203,200_.jpg
137	BECOMING	The former first lady describes how she balanced work, family and her husband’s political ascent.	Crown	2020-08-09	NonFiction	0	https://images-na.ssl-images-amazon.com/images/I/414JfiBCutL._SX327_BO1,204,203,200_.jpg
138	EDUCATED	The daughter of survivalists, who is kept out of school, educates herself enough to leave home for university.	Random House	2020-08-09	NonFiction	0	https://images-na.ssl-images-amazon.com/images/I/41+aN7ZbS9L._SX327_BO1,204,203,200_.jpg
139	TWILIGHT OF DEMOCRACY	The Pulitzer Prize–winning historian looks at the rise of nationalism and authoritarianism around the world.	Doubleday	2020-08-09	NonFiction	0	https://images-na.ssl-images-amazon.com/images/I/41P2PVKAijL._SX298_BO1,204,203,200_.jpg
140	BLITZ	The author of “Big Agenda” explains why he thinks President Trump will be re-elected.	Humanix	2020-08-09	NonFiction	0	https://images-na.ssl-images-amazon.com/images/I/51qJ8wVQ-eL._SX329_BO1,204,203,200_.jpg
141	WHERE THE CRAWDADS SING	In a quiet town on the North Carolina coast in 1969, a young woman who survived alone in the marsh becomes a murder suspect.	Putnam	2020-08-09	Fiction	0	https://images-na.ssl-images-amazon.com/images/I/51NYjNgldSL._SX330_BO1,204,203,200_.jpg
142	NEAR DARK	The 19th book in the Scot Harvath series. With a bounty on his head, Harvath makes an alliance with a Norwegian intelligence operative.	Emily Bestler/Atria	2020-08-09	Fiction	0	https://images-na.ssl-images-amazon.com/images/I/41txJPLDPVL._SX325_BO1,204,203,200_.jpg
143	THE ORDER	The 20th book in the Gabriel Allon series. The art restorer and spy cuts his family’s vacation short to investigate whether Pope Paul VII was murdered.	Harper	2020-08-09	Fiction	0	https://images-na.ssl-images-amazon.com/images/I/519uxwI79rL._SX329_BO1,204,203,200_.jpg
144	THE VANISHING HALF	The lives of twin sisters who run away from a Southern Black community at age 16 diverge as one returns and the other takes on a different racial identity but their fates intertwine.	Riverhead	2020-08-09	Fiction	0	https://images-na.ssl-images-amazon.com/images/I/41Qi7YILYiL._SX329_BO1,204,203,200_.jpg
145	28 SUMMERS	A relationship that started in 1993 between Mallory Blessing and Jake McCloud comes to light while she is on her deathbed and his wife runs for president.	Little, Brown	2020-08-09	Fiction	0	https://images-na.ssl-images-amazon.com/images/I/41+BPlnwJXL._SX320_BO1,204,203,200_.jpg
146	THE GUEST LIST	A wedding between a TV star and a magazine publisher on an island off the coast of Ireland turns deadly.	Morrow	2020-08-09	Fiction	0	https://images-na.ssl-images-amazon.com/images/I/51HNh-eI7CL._SX327_BO1,204,203,200_.jpg
147	AXIOM'S END	Cora Sabino finds herself caught between her estranged whistle-blower father and the extraterrestrials who have been living here for decades.	St. Martin's	2020-08-09	Fiction	0	https://images-na.ssl-images-amazon.com/images/I/51WOoai6RnL._SX327_BO1,204,203,200_.jpg
148	CAMINO WINDS	The line between fact and fiction becomes blurred when an author of thrillers is found dead after a hurricane hits Camino Island.	Doubleday	2020-08-09	Fiction	0	https://images-na.ssl-images-amazon.com/images/I/51CzgnvkazL._SX327_BO1,204,203,200_.jpg
149	PEACE TALKS	The 16th book in the Dresden Files series. Chicago's only professional wizard tries to keep the peace during a summit of the Supernatural nations of the world.	Ace	2020-08-09	Fiction	0	https://images-na.ssl-images-amazon.com/images/I/51mBJZGnFFL._SX329_BO1,204,203,200_.jpg
150	AMERICAN DIRT	A bookseller flees Mexico for the United States with her son while pursued by the head of a drug cartel.	Flatiron	2020-08-09	Fiction	0	https://images-na.ssl-images-amazon.com/images/I/51hwe011M+L._SX327_BO1,204,203,200_.jpg
151	SEX AND VANITY	A nod to “A Room With a View” in which Lucie Tang Churchill is torn between her WASPy billionaire fiancé and a privileged hunk born in Hong Kong.	Doubleday	2020-08-09	Fiction	0	https://images-na.ssl-images-amazon.com/images/I/51SSjum+fRL._SX327_BO1,204,203,200_.jpg
152	A WALK ALONG THE BEACH	After dealing with loss and setbacks, two sisters take risks on dreams and love.	Ballantine	2020-08-09	Fiction	0	https://images-na.ssl-images-amazon.com/images/I/51eQKhfhGsL._SX327_BO1,204,203,200_.jpg
153	IF IT BLEEDS	Four novellas: “Mr. Harrigan’s Phone,” “The Life of Chuck,” “Rat” and “If It Bleeds.”	Scribner	2020-08-09	Fiction	0	https://images-na.ssl-images-amazon.com/images/I/51Zz45NoRbL._SX327_BO1,204,203,200_.jpg
154	THE PULL OF THE STARS	While war and the Great Flu ravages 1918 Dublin, three women help expectant mothers who have been quarantined in a hospital.	Little, Brown	2020-08-09	Fiction	0	https://images-na.ssl-images-amazon.com/images/I/51wAzPDKyxL._SX320_BO1,204,203,200_.jpg
155	BIG SUMMER	Daphne Berg’s former best friend asks her to be the maid of honor at her wedding in Cape Cod.	Atria	2020-08-09	Fiction	0	https://images-na.ssl-images-amazon.com/images/I/41x7Hl3D3pL._SX329_BO1,204,203,200_.jpg
156	THE HUNGER GAMES	In a dystopia, a girl fights for survival on live TV.	Scholastic	2020-08-09	Childrens	0	https://images-na.ssl-images-amazon.com/images/I/414rRyIJsDL._SX328_BO1,204,203,200_.jpg
157	THE BAD GUYS	Tough animals in suits take on some real villains.	Scholastic	2020-08-09	Childrens	0	https://images-na.ssl-images-amazon.com/images/I/51mECnE0w8L._SX393_BO1,204,203,200_.jpg
158	DOG MAN	A dog’s head is combined with a policeman’s body to create this hybrid supercop hound.	Scholastic	2020-08-09	Childrens	0	https://images-na.ssl-images-amazon.com/images/I/51biJWyO6cL._SX336_BO1,204,203,200_.jpg
159	HARRY POTTER	A wizard hones his conjuring skills in the service of fighting evil.	Scholastic	2020-08-09	Childrens	0	https://images-na.ssl-images-amazon.com/images/I/51SfTd37PaL._SX415_BO1,204,203,200_.jpg
160	DIARY OF A WIMPY KID	The travails and challenges of adolescence.	Amulet	2020-08-09	Childrens	0	https://images-na.ssl-images-amazon.com/images/I/51WVlYqD1RL._SX339_BO1,204,203,200_.jpg
161	BABY-SITTERS CLUB GRAPHIX	Kristy, Mary Anne, Claudia, Stacey, and Dawn are The Baby-sitters Club.	Scholastic	2020-08-09	Childrens	0	https://images-na.ssl-images-amazon.com/images/I/513FhwnoQVL._SX342_BO1,204,203,200_.jpg
162	CAPTAIN UNDERPANTS	Boys and their principal fight evil.	Scholastic	2020-08-09	Childrens	0	https://images-na.ssl-images-amazon.com/images/I/61GRtjzSULL._SX333_BO1,204,203,200_.jpg
163	PERCY JACKSON & THE OLYMPIANS	A boy battles mythological monsters.	Disney-Hyperion	2020-08-09	Childrens	0	https://images-na.ssl-images-amazon.com/images/I/51sZJKZpQBL._SX337_BO1,204,203,200_.jpg
164	THE LAST KIDS ON EARTH	Jack and his friends fight for their lives through the zombie apocalypse.	Viking	2020-08-09	Childrens	0	https://images-na.ssl-images-amazon.com/images/I/51nVkIIF4sL._SX327_BO1,204,203,200_.jpg
165	MAGIC TREE HOUSE	These siblings can overcome space and time.	Stepping Stone/Random House	2020-08-09	Childrens	0	https://images-na.ssl-images-amazon.com/images/I/51nnn+oh5rL._SX338_BO1,204,203,200_.jpg
166	STAMPED	An exploration of racism and anti-racism in America.	Little, Brown	2020-08-09	Crime	0	https://images-na.ssl-images-amazon.com/images/I/512hup-TOmL._SX329_BO1,204,203,200_.jpg
167	AVATAR, THE LAST AIRBENDER: THE SHADOW OF KYOSHI	Kyoshi must stop a mysterious threat that emerges from the Spirit World.	Amulet	2020-08-09	Crime	0	https://images-na.ssl-images-amazon.com/images/I/516-YnacpGL._SX330_BO1,204,203,200_.jpg
168	THE HATE U GIVE	A 16-year-old girl sees a police officer kill her friend.	Balzer + Bray	2020-08-09	Crime	0	https://images-na.ssl-images-amazon.com/images/I/41xnmF+jlnL._SX329_BO1,204,203,200_.jpg
169	ONE OF US IS LYING	For five students, a detour into detention ends in murder.	Delacorte	2020-08-09	Crime	0	https://images-na.ssl-images-amazon.com/images/I/51yke+5Oj1L._SX329_BO1,204,203,200_.jpg
170	HAWK	Ten years after Maximum Ride, a new hero emerges in a postapocalyptic New York City.	jimmy patterson	2020-08-09	Crime	0	https://images-na.ssl-images-amazon.com/images/I/511n3csCaNL._SX331_BO1,204,203,200_.jpg
171	CHAIN OF GOLD	Cordelia battles demons in a quarantined London that are nothing like she’s encountered before.	Margaret K. McElderry	2020-08-09	Crime	0	https://images-na.ssl-images-amazon.com/images/I/51dCwVleEwL._SX329_BO1,204,203,200_.jpg
172	THE BETROTHED	Lady Hollis Brite and King Jameson are set to be married, but will a commoner steal Hollis’s heart?	HarperTeen	2020-08-09	Crime	0	https://images-na.ssl-images-amazon.com/images/I/51byOdCSFZL._SX329_BO1,204,203,200_.jpg
173	CLAP WHEN YOU LAND	Unbeknownst to each other, two sisters meet when their father dies in a plane crash.	Quill Tree	2020-08-09	Crime	0	https://images-na.ssl-images-amazon.com/images/I/51VlHTCDDkL._SX329_BO1,204,203,200_.jpg
174	CHILDREN OF VIRTUE AND VENGEANCE	Zélie must stop the threat of civil war in Orïsha.	Holt	2020-08-09	Crime	0	https://images-na.ssl-images-amazon.com/images/I/51-QmBtB8TL._SX329_BO1,204,203,200_.jpg
175	CHILDREN OF BLOOD AND BONE	Zélie fights to restore magic to the land of Orïsha.	Holt	2020-08-09	Crime	0	https://images-na.ssl-images-amazon.com/images/I/61SB-c0mHGL._SX329_BO1,204,203,200_.jpg
\.


--
-- Data for Name: collection; Type: TABLE DATA; Schema: public; Owner: 3900user
--

COPY public.collection (id, collection_type, is_private, description, collection_name, count, date_created, owner_id) FROM stdin;
230	Main	f	This is your Main Collection	Main Collection	0	2020-07-30 23:07:15.727613+10	69
231	Main	f	This is your Main Collection	Main Collection	0	2020-07-31 09:37:39.86315+10	70
232	Finished	f	This is your Finished Collection	Finished Collection	0	2020-07-31 09:37:39.868619+10	70
234	Named	f	this is a test collection	Test	0	2020-07-31 09:43:53.392028+10	70
235	Cloned	f	This is a named collection	mwang10's Named Collection collection	1	2020-07-31 09:58:57.445184+10	69
229	Finished	f	This is your Finished Collection	Finished Collection	0	2020-07-30 23:07:15.72339+10	69
233	Named	f	This is a named collection	Named Collection	3	2020-07-31 09:38:27.135165+10	70
\.


--
-- Data for Name: contains; Type: TABLE DATA; Schema: public; Owner: 3900user
--

COPY public.contains (id, time_added, book_id, collection_id) FROM stdin;
225	2020-07-31 09:42:23.509801+10	129	233
226	2020-07-31 09:58:57.591047+10	129	235
227	2020-08-01 00:25:07.568364+10	147	233
228	2020-08-01 00:27:39.141229+10	158	233
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: 3900user
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: 3900user
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	sites	site
8	app	books
9	app	reads
10	app	reviews
11	app	authors
12	app	writtenby
13	app	collections
14	app	contains
15	app	profiles
16	authtoken	token
17	account	emailaddress
18	account	emailconfirmation
19	socialaccount	socialaccount
20	socialaccount	socialapp
21	socialaccount	socialtoken
22	knox	authtoken
23	simple_email_confirmation	emailaddress
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: 3900user
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2020-07-23 22:12:15.449263+10
2	auth	0001_initial	2020-07-23 22:12:15.569247+10
3	account	0001_initial	2020-07-23 22:12:15.740299+10
4	account	0002_email_max_length	2020-07-23 22:12:15.783677+10
5	admin	0001_initial	2020-07-23 22:12:15.80766+10
6	admin	0002_logentry_remove_auto_add	2020-07-23 22:12:15.837044+10
7	admin	0003_logentry_add_action_flag_choices	2020-07-23 22:12:15.877372+10
8	contenttypes	0002_remove_content_type_name	2020-07-23 22:12:15.91808+10
9	auth	0002_alter_permission_name_max_length	2020-07-23 22:12:15.927775+10
10	auth	0003_alter_user_email_max_length	2020-07-23 22:12:15.941115+10
11	auth	0004_alter_user_username_opts	2020-07-23 22:12:15.953322+10
12	auth	0005_alter_user_last_login_null	2020-07-23 22:12:15.967475+10
13	auth	0006_require_contenttypes_0002	2020-07-23 22:12:15.971445+10
14	auth	0007_alter_validators_add_error_messages	2020-07-23 22:12:15.983332+10
15	auth	0008_alter_user_username_max_length	2020-07-23 22:12:16.003706+10
16	auth	0009_alter_user_last_name_max_length	2020-07-23 22:12:16.02978+10
17	auth	0010_alter_group_name_max_length	2020-07-23 22:12:16.050974+10
18	auth	0011_update_proxy_permissions	2020-07-23 22:12:16.068838+10
19	authtoken	0001_initial	2020-07-23 22:12:16.090644+10
20	authtoken	0002_auto_20160226_1747	2020-07-23 22:12:16.153233+10
21	knox	0001_initial	2020-07-23 22:12:16.169998+10
22	knox	0002_auto_20150916_1425	2020-07-23 22:12:16.209212+10
23	knox	0003_auto_20150916_1526	2020-07-23 22:12:16.27406+10
24	knox	0004_authtoken_expires	2020-07-23 22:12:16.297263+10
25	knox	0005_authtoken_token_key	2020-07-23 22:12:16.310501+10
26	knox	0006_auto_20160818_0932	2020-07-23 22:12:16.353826+10
27	knox	0007_auto_20190111_0542	2020-07-23 22:12:16.367287+10
28	sessions	0001_initial	2020-07-23 22:12:16.389684+10
29	simple_email_confirmation	0001_initial	2020-07-23 22:12:16.471207+10
30	sites	0001_initial	2020-07-23 22:12:16.496136+10
31	sites	0002_alter_domain_unique	2020-07-23 22:12:16.513034+10
32	socialaccount	0001_initial	2020-07-23 22:12:16.627059+10
33	socialaccount	0002_token_max_lengths	2020-07-23 22:12:16.729399+10
34	socialaccount	0003_extra_data_default_dict	2020-07-23 22:12:16.755343+10
35	app	0001_initial	2020-07-23 22:12:31.122784+10
44	app	0002_auto_20200728_1548	2020-07-29 01:48:36.962942+10
45	app	0003_books_book_thumbnail	2020-07-30 02:07:39.175817+10
46	app	0004_auto_20200730_1347	2020-07-30 23:47:12.346989+10
47	app	0005_auto_20200730_1357	2020-07-30 23:57:56.598389+10
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: 3900user
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
\.


--
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: 3900user
--

COPY public.django_site (id, domain, name) FROM stdin;
1	example.com	example.com
\.


--
-- Data for Name: knox_authtoken; Type: TABLE DATA; Schema: public; Owner: 3900user
--

COPY public.knox_authtoken (digest, salt, created, user_id, expiry, token_key) FROM stdin;
a7fa8de2ae8d20f4f4ae572abb043f6a083aa6a2fcc176e387d6296290281cfe28ebe25823a44da72694563715d8adb48d1a68aac3db92ea922c13c09dfa72e5	b627fb384c74ae45	2020-07-30 23:07:15.65222+10	69	2020-07-31 09:07:15.65179+10	c80502f7
09be009ec64a6730565ae5a1ac67ae272cb83cc9684dc473fee83608c77aed033f1658e1111319e1405729835d603806113bc93dfc9c06425d01dde93210be76	b28653b29a73000e	2020-07-30 23:07:35.655737+10	69	2020-07-31 09:07:35.655315+10	015436d9
3bef6712fa3b092bcf7e85959fbcfd1d5da898e7e95dad68e4dac031b387bb51e7b379ae5224d09aeee9f0ad4b9ad82a8411b0e129ac80be0e1f72fafb326525	1e4ca7e29994227a	2020-07-30 23:18:00.286396+10	69	2020-07-31 09:18:00.286005+10	285c5ea0
d0edee00b48e1f2c202bbaa709784034f87b132d570bd4644b7fe157baa553ed1cc1a2c2228f7297729eb041676ab51e4379bb1b8676dea2856e7bcdb6505836	7987b3a3030f0f2e	2020-07-30 23:54:48.18072+10	69	2020-07-31 09:54:48.180095+10	e346bcae
bd09acd22a816ef2fa1fe5842add14afc2d0ec18e128770dc2cc5c82de698ec2e8bc1461c5a69fb204fd05470047ced0bc9e73365d06f9336f894896f2a71270	274e0234ca532ab5	2020-07-31 00:12:34.440703+10	69	2020-07-31 10:12:34.439894+10	445730c1
05180734f7841577994c91438a73a5915dcf71a80f9d29272e2697c721611de74696d34bd7d34e785c78239d2a082934ac713ccb00792eee93f9db351eb2a1bb	2bc5b98337aee93a	2020-07-31 01:20:56.358198+10	69	2020-07-31 11:20:56.357732+10	0fc4c6b0
0057f7c2564b9958ba6cf6f5293b3095ca3f303108c5271afd50f8ab6a66019908f832efa6888fd2240ba39db09fa88b88841bbb8e8f4dc7cd705f6983c67aaa	7584ccf6f50af391	2020-07-31 02:21:57.573114+10	69	2020-07-31 12:21:57.572582+10	242b3912
5b30c72049ad040df0aece1d9a4899c0abb6d6ba5be005a99c99a5533f3525c839aa4ec621f0337150be903c47dbe7b33a149c26b584effa9062eae1c5741c07	7f7190921ebbe909	2020-07-31 03:23:09.731125+10	69	2020-07-31 13:23:09.730633+10	89fdcecd
26253b0fe5ce47ec70e32c808df147d5489d9bd460e911384d51f06a6ae1aca84da7ab88b4e6aae4539dc9b57a401da6429152709f2cee03067a8dceb3640b3f	c930c8ef8db315ba	2020-07-31 09:17:23.714359+10	69	2020-07-31 19:17:23.713877+10	5241233a
bf6e3a18416beb6e545562201acec23c2c9a4bebfc917dcd7e50a0bdfb64556b10e9aae4d5e10c005185d8d67b4f459e5df74885dfd00960e11f80de728e51bd	1e5bb63ed8317aca	2020-07-31 09:36:49.930707+10	69	2020-07-31 19:36:49.930202+10	f820a231
3cb2f482900426f17af3222f89dffe351b6eefdef9d942edf94dec0cda44a7831262132b11209252ca7757ca6f0a5997ca4a0d9e1ff6f4b5554dc084944bcad0	e9cf363efea877f2	2020-07-31 09:37:39.767722+10	70	2020-07-31 19:37:39.766492+10	7e56c4da
3830b35a8a685e917780106bb5e156588d108b92d7c93165f65ad62a7ba639ac879300243758de45f90e057d5af55eb0468dabf2118a42504f3538221c2e2ab3	9f110163780d0cd9	2020-07-31 09:38:13.66873+10	70	2020-07-31 19:38:13.668332+10	b89cdf60
182934fa1f4ae451528acae09c395163e3513a92bf081b7c959c84379e7f2e0dcf652514981ebef2fe70e171cfe2f054472a1379651372d2bf40934238d0ff25	6f99e681fc73fd4e	2020-07-31 09:38:52.892048+10	69	2020-07-31 19:38:52.891702+10	b2f23380
5f1c244c0b549340104483776a15bd04ebc7d6bd64fb1894bff2f6b80399a0c7f51a3faae3510cdb7cba3fbe26d8251ccf143ef0121c587a7cb7f2eaf41f4899	10523ba81d7661a5	2020-07-31 09:39:29.886927+10	70	2020-07-31 19:39:29.886489+10	e4dd6dbd
989e82e2477933f2bc559be183527a07e180d91232a567b7686361668b0efdd5a4012944c2367975899e36e94354ef77aa7f50a02923ea010c5e6670ad1068fb	0f739c9087743b50	2020-07-31 09:49:23.231341+10	70	2020-07-31 19:49:23.230931+10	5e693428
236087d5e0aa1b723f5d44685ea6ff9f981d5744d725b1ace556304d17d7d2e307acbc991417431f58602c838c149553485c53de18904818da5a9ffb98811305	a58673b2fd9a3c7a	2020-07-31 09:49:33.915766+10	69	2020-07-31 19:49:33.91538+10	b906d8d3
0bcd3987d766a44ea6734f0b50a512d2de749dbb84bf37a725b52c5f26924d4fbdef436c8946c783e1d8884fe302eefa1f78bf28f3f1d6d4247f9887bebe6351	f66accb9b0e0405a	2020-07-31 10:00:57.617259+10	69	2020-07-31 20:00:57.616853+10	08459072
f99d544da7bf8dcca9e2dc43f3d4d6e21ad4022e06bd87605a23a8c2e326c8471e3729509db18be2b4f47dfd53cfda8586c9dbbb44fe39554201bb5cb1bce7c0	0d2a635a402e96a5	2020-07-31 11:00:37.948407+10	69	2020-07-31 21:00:37.947872+10	1bf90d80
32be03b061068b241f8eb50326518cbd462d829afe143764ee96c5f6f951ef970e76477eb67292e56b238a767b10068da78ed3493feb17803ce90458ee76e519	fbce3be930bad95b	2020-07-31 11:03:14.108693+10	69	2020-07-31 21:03:14.108348+10	358aa82f
07518e57ca7be2a2eade45a802364c28bc0b9429ff67c2f3ebd36fd22ab15bc1f8deb5e28dfbb2e7bebda9e29048c8979fc3a1fb2c5453eed8cf3bac5901aad6	5ee1f261fa99d518	2020-07-31 12:44:45.09065+10	69	2020-07-31 22:44:45.090242+10	18e3880c
990c8f5e83268ae98ce7b8835082d133f89c77cd252710d0b39b4652a33ddffa62f80939cb84aee3597abb6eb0d1843b042e60b017744ec57af2b5c74b3c40d1	0159f00a4eb0efcc	2020-07-31 13:08:56.986738+10	69	2020-07-31 23:08:56.986221+10	f0645eb1
fe10c61be591a21d43d4e52c78dae0cb96145c68bc59ff697c34adcaf29636332598519a02f7e510f37a2387790ae070cc089c1855c5d72b1fe036dad2d94bd8	4489248d8a3628f4	2020-07-31 13:47:58.364433+10	69	2020-07-31 23:47:58.363879+10	bb9db00a
6c52415b02eff72db2969cd47e02cb335847c4932b93a373b60c207f514e74453dab4db2a8296d7926d59fd95e9bff630459855036e815b44b302ee0b56daf4b	3a14c9c8e843b991	2020-07-31 15:26:18.175796+10	69	2020-08-01 01:26:18.175404+10	35e0c27c
261523cf94be4aa2f222adc14bacc609057560c7a52777d8b02299f8b064e2dbd3fbd9becdff9447d63ab407db716d9f79410a61c4967b7ddae22bbb0a55765f	d18efa1e58e1640a	2020-07-31 19:49:22.474702+10	69	2020-08-01 05:49:22.474209+10	8f31e421
e3d6a2745023cec17f56bcaa3aec60aefc274ca344c8c679ef7c20912356d11709c50691040a896012104f15dbc33f305af95595583a4da666b5bb14cf49759d	4c0a923a39d52059	2020-08-01 00:16:07.379893+10	69	2020-08-01 10:16:07.379574+10	4d33466a
242eef87a5f70babfb12efda51c007b7adc9a0a8ed95337f6109cb941c2b06577f53a96d5f553a90e783eadaf658a30f97e71fd8f52de0d4e7b84a27121f6045	4dc2745af92b160e	2020-08-01 00:24:40.916456+10	70	2020-08-01 10:24:40.916119+10	8f5cea1f
a470dfec5ab105c3a5e21510ca62c60429a140b16dd5e57a9cee0d5feac2313ad71d5580a9620ea5112fd08e4ee2ac4c8ca954174c38b1be610ac5a951fa148c	1cdcce5c3bc202dd	2020-08-01 00:25:23.270059+10	69	2020-08-01 10:25:23.269731+10	cb0a0d5c
33f2e084c57ce208e9ab0266d010c8cd6523592de3094656ecd2dac28d0a3f8d07a8f86a20b3e962d50a43e60cdfbb1816a8a46721bea3972f3ded562b2b6256	62595e12505c8a1f	2020-08-01 00:27:19.875163+10	70	2020-08-01 10:27:19.874769+10	0bb73933
a04a5efffff663d4c38b12a9ccf0a35963b73c166cd45925e92d72ae93e4361cc65d93f536492cb86beacc2283eabbc60dd1ac3c92b2e3659a5feca1dc1d45f7	fd1028eaf57890ca	2020-08-01 00:27:50.806921+10	69	2020-08-01 10:27:50.806511+10	02651c10
b848048c6926ef561f90769dfd7122c7bebe9e1c6280d6f68a2a9ab074b2dc414edf87e484ba5ddc299687d193f76b6b227926faa624ec8ef35cfc2564f49afa	4dd5d9847ee067da	2020-08-01 00:28:49.634263+10	69	2020-08-01 10:28:49.633755+10	a9cb2ada
6c94afa300368f9015cb065cad58d2032435c2050f2564c82e1628895a26087fbd29444ae9bc0af881aeb96ac06f97c4fd19d6fc05a9d9db4b6ec67aa6662ae7	d2bee6cfa4479c0b	2020-08-01 00:33:08.693271+10	69	2020-08-01 10:33:08.692731+10	a21acebd
6966f85052b6111f19aa9b086b48164315a88fa013d64ec986563f42854269e626e59c21b822027db8dcff6dd4941447e60c6792dadbbcaa65ccbf05fff09d0d	4b17a4d11739cd73	2020-08-01 00:45:00.165886+10	69	2020-08-01 10:45:00.165569+10	7f97b3bb
\.


--
-- Data for Name: profiles; Type: TABLE DATA; Schema: public; Owner: 3900user
--

COPY public.profiles (id, verification_code, user_id) FROM stdin;
9	eyCCjbyp2Fez	69
10	Er1ifQ9MSlbJ	70
\.


--
-- Data for Name: reads; Type: TABLE DATA; Schema: public; Owner: 3900user
--

COPY public.reads (id, book_id, user_id) FROM stdin;
\.


--
-- Data for Name: reviews; Type: TABLE DATA; Schema: public; Owner: 3900user
--

COPY public.reviews (id, review, rating, date, book_id, user_id) FROM stdin;
\.


--
-- Data for Name: simple_email_confirmation_emailaddress; Type: TABLE DATA; Schema: public; Owner: 3900user
--

COPY public.simple_email_confirmation_emailaddress (id, email, key, set_at, confirmed_at, user_id) FROM stdin;
11	farhansghazi@outlook.com	eyCCjbyp2Fez	2020-07-30 23:07:11.060349+10	\N	69
12	farhansghazi@outlook.com	Er1ifQ9MSlbJ	2020-07-31 09:37:35.48406+10	\N	70
\.


--
-- Data for Name: socialaccount_socialaccount; Type: TABLE DATA; Schema: public; Owner: 3900user
--

COPY public.socialaccount_socialaccount (id, provider, uid, last_login, date_joined, extra_data, user_id) FROM stdin;
\.


--
-- Data for Name: socialaccount_socialapp; Type: TABLE DATA; Schema: public; Owner: 3900user
--

COPY public.socialaccount_socialapp (id, provider, name, client_id, secret, key) FROM stdin;
\.


--
-- Data for Name: socialaccount_socialapp_sites; Type: TABLE DATA; Schema: public; Owner: 3900user
--

COPY public.socialaccount_socialapp_sites (id, socialapp_id, site_id) FROM stdin;
\.


--
-- Data for Name: socialaccount_socialtoken; Type: TABLE DATA; Schema: public; Owner: 3900user
--

COPY public.socialaccount_socialtoken (id, token, token_secret, expires_at, account_id, app_id) FROM stdin;
\.


--
-- Data for Name: written_by; Type: TABLE DATA; Schema: public; Owner: 3900user
--

COPY public.written_by (id, author_id, book_id) FROM stdin;
32	51	129
33	52	130
34	53	131
35	54	132
36	55	133
37	56	134
38	57	135
39	58	136
40	59	137
41	60	138
42	61	139
43	62	140
44	63	141
45	64	142
46	65	143
47	66	144
48	67	145
49	68	146
50	69	147
51	70	148
52	71	149
53	72	150
54	73	151
55	74	152
56	75	153
57	76	154
58	77	155
59	78	156
60	79	157
61	80	158
62	81	159
63	82	160
64	83	161
65	84	162
66	85	163
67	86	164
68	87	165
69	88	166
70	89	167
71	90	168
72	91	169
73	92	170
74	93	171
75	94	172
76	95	173
77	96	174
78	97	175
\.


--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE SET; Schema: public; Owner: 3900user
--

SELECT pg_catalog.setval('public.account_emailaddress_id_seq', 1, false);


--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: 3900user
--

SELECT pg_catalog.setval('public.account_emailconfirmation_id_seq', 1, false);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: 3900user
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: 3900user
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: 3900user
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 96, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: 3900user
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: 3900user
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 70, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: 3900user
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: authors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: 3900user
--

SELECT pg_catalog.setval('public.authors_id_seq', 97, true);


--
-- Name: books_id_seq; Type: SEQUENCE SET; Schema: public; Owner: 3900user
--

SELECT pg_catalog.setval('public.books_id_seq', 175, true);


--
-- Name: collection_id_seq; Type: SEQUENCE SET; Schema: public; Owner: 3900user
--

SELECT pg_catalog.setval('public.collection_id_seq', 235, true);


--
-- Name: contains_id_seq; Type: SEQUENCE SET; Schema: public; Owner: 3900user
--

SELECT pg_catalog.setval('public.contains_id_seq', 228, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: 3900user
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: 3900user
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 23, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: 3900user
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 47, true);


--
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: 3900user
--

SELECT pg_catalog.setval('public.django_site_id_seq', 1, true);


--
-- Name: profiles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: 3900user
--

SELECT pg_catalog.setval('public.profiles_id_seq', 10, true);


--
-- Name: reads_id_seq; Type: SEQUENCE SET; Schema: public; Owner: 3900user
--

SELECT pg_catalog.setval('public.reads_id_seq', 1, false);


--
-- Name: reviews_id_seq; Type: SEQUENCE SET; Schema: public; Owner: 3900user
--

SELECT pg_catalog.setval('public.reviews_id_seq', 28, true);


--
-- Name: simple_email_confirmation_emailaddress_id_seq; Type: SEQUENCE SET; Schema: public; Owner: 3900user
--

SELECT pg_catalog.setval('public.simple_email_confirmation_emailaddress_id_seq', 12, true);


--
-- Name: socialaccount_socialaccount_id_seq; Type: SEQUENCE SET; Schema: public; Owner: 3900user
--

SELECT pg_catalog.setval('public.socialaccount_socialaccount_id_seq', 1, false);


--
-- Name: socialaccount_socialapp_id_seq; Type: SEQUENCE SET; Schema: public; Owner: 3900user
--

SELECT pg_catalog.setval('public.socialaccount_socialapp_id_seq', 1, false);


--
-- Name: socialaccount_socialapp_sites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: 3900user
--

SELECT pg_catalog.setval('public.socialaccount_socialapp_sites_id_seq', 1, false);


--
-- Name: socialaccount_socialtoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: 3900user
--

SELECT pg_catalog.setval('public.socialaccount_socialtoken_id_seq', 1, false);


--
-- Name: written_by_id_seq; Type: SEQUENCE SET; Schema: public; Owner: 3900user
--

SELECT pg_catalog.setval('public.written_by_id_seq', 78, true);


--
-- Name: account_emailaddress account_emailaddress_email_key; Type: CONSTRAINT; Schema: public; Owner: 3900user
--

ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_email_key UNIQUE (email);


--
-- Name: account_emailaddress account_emailaddress_pkey; Type: CONSTRAINT; Schema: public; Owner: 3900user
--

ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_pkey PRIMARY KEY (id);


--
-- Name: account_emailconfirmation account_emailconfirmation_key_key; Type: CONSTRAINT; Schema: public; Owner: 3900user
--

ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirmation_key_key UNIQUE (key);


--
-- Name: account_emailconfirmation account_emailconfirmation_pkey; Type: CONSTRAINT; Schema: public; Owner: 3900user
--

ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirmation_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: 3900user
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: 3900user
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: 3900user
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: 3900user
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: 3900user
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: 3900user
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: 3900user
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: 3900user
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: 3900user
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: 3900user
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: 3900user
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: 3900user
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: authors authors_pkey; Type: CONSTRAINT; Schema: public; Owner: 3900user
--

ALTER TABLE ONLY public.authors
    ADD CONSTRAINT authors_pkey PRIMARY KEY (id);


--
-- Name: authtoken_token authtoken_token_pkey; Type: CONSTRAINT; Schema: public; Owner: 3900user
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_pkey PRIMARY KEY (key);


--
-- Name: authtoken_token authtoken_token_user_id_key; Type: CONSTRAINT; Schema: public; Owner: 3900user
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_key UNIQUE (user_id);


--
-- Name: books books_pkey; Type: CONSTRAINT; Schema: public; Owner: 3900user
--

ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_pkey PRIMARY KEY (id);


--
-- Name: collection collection_pkey; Type: CONSTRAINT; Schema: public; Owner: 3900user
--

ALTER TABLE ONLY public.collection
    ADD CONSTRAINT collection_pkey PRIMARY KEY (id);


--
-- Name: contains contains_pkey; Type: CONSTRAINT; Schema: public; Owner: 3900user
--

ALTER TABLE ONLY public.contains
    ADD CONSTRAINT contains_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: 3900user
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: 3900user
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: 3900user
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: 3900user
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: 3900user
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: django_site django_site_domain_a2e37b91_uniq; Type: CONSTRAINT; Schema: public; Owner: 3900user
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_domain_a2e37b91_uniq UNIQUE (domain);


--
-- Name: django_site django_site_pkey; Type: CONSTRAINT; Schema: public; Owner: 3900user
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- Name: knox_authtoken knox_authtoken_pkey; Type: CONSTRAINT; Schema: public; Owner: 3900user
--

ALTER TABLE ONLY public.knox_authtoken
    ADD CONSTRAINT knox_authtoken_pkey PRIMARY KEY (digest);


--
-- Name: knox_authtoken knox_authtoken_salt_key; Type: CONSTRAINT; Schema: public; Owner: 3900user
--

ALTER TABLE ONLY public.knox_authtoken
    ADD CONSTRAINT knox_authtoken_salt_key UNIQUE (salt);


--
-- Name: profiles profiles_pkey; Type: CONSTRAINT; Schema: public; Owner: 3900user
--

ALTER TABLE ONLY public.profiles
    ADD CONSTRAINT profiles_pkey PRIMARY KEY (id);


--
-- Name: profiles profiles_user_id_key; Type: CONSTRAINT; Schema: public; Owner: 3900user
--

ALTER TABLE ONLY public.profiles
    ADD CONSTRAINT profiles_user_id_key UNIQUE (user_id);


--
-- Name: reads reads_pkey; Type: CONSTRAINT; Schema: public; Owner: 3900user
--

ALTER TABLE ONLY public.reads
    ADD CONSTRAINT reads_pkey PRIMARY KEY (id);


--
-- Name: reviews reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: 3900user
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY (id);


--
-- Name: simple_email_confirmation_emailaddress simple_email_confirmatio_user_id_email_28a01714_uniq; Type: CONSTRAINT; Schema: public; Owner: 3900user
--

ALTER TABLE ONLY public.simple_email_confirmation_emailaddress
    ADD CONSTRAINT simple_email_confirmatio_user_id_email_28a01714_uniq UNIQUE (user_id, email);


--
-- Name: simple_email_confirmation_emailaddress simple_email_confirmation_emailaddress_key_key; Type: CONSTRAINT; Schema: public; Owner: 3900user
--

ALTER TABLE ONLY public.simple_email_confirmation_emailaddress
    ADD CONSTRAINT simple_email_confirmation_emailaddress_key_key UNIQUE (key);


--
-- Name: simple_email_confirmation_emailaddress simple_email_confirmation_emailaddress_pkey; Type: CONSTRAINT; Schema: public; Owner: 3900user
--

ALTER TABLE ONLY public.simple_email_confirmation_emailaddress
    ADD CONSTRAINT simple_email_confirmation_emailaddress_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialaccount socialaccount_socialaccount_pkey; Type: CONSTRAINT; Schema: public; Owner: 3900user
--

ALTER TABLE ONLY public.socialaccount_socialaccount
    ADD CONSTRAINT socialaccount_socialaccount_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialaccount socialaccount_socialaccount_provider_uid_fc810c6e_uniq; Type: CONSTRAINT; Schema: public; Owner: 3900user
--

ALTER TABLE ONLY public.socialaccount_socialaccount
    ADD CONSTRAINT socialaccount_socialaccount_provider_uid_fc810c6e_uniq UNIQUE (provider, uid);


--
-- Name: socialaccount_socialapp_sites socialaccount_socialapp__socialapp_id_site_id_71a9a768_uniq; Type: CONSTRAINT; Schema: public; Owner: 3900user
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_socialapp__socialapp_id_site_id_71a9a768_uniq UNIQUE (socialapp_id, site_id);


--
-- Name: socialaccount_socialapp socialaccount_socialapp_pkey; Type: CONSTRAINT; Schema: public; Owner: 3900user
--

ALTER TABLE ONLY public.socialaccount_socialapp
    ADD CONSTRAINT socialaccount_socialapp_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialapp_sites socialaccount_socialapp_sites_pkey; Type: CONSTRAINT; Schema: public; Owner: 3900user
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_socialapp_sites_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialtoken socialaccount_socialtoken_app_id_account_id_fca4e0ac_uniq; Type: CONSTRAINT; Schema: public; Owner: 3900user
--

ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_socialtoken_app_id_account_id_fca4e0ac_uniq UNIQUE (app_id, account_id);


--
-- Name: socialaccount_socialtoken socialaccount_socialtoken_pkey; Type: CONSTRAINT; Schema: public; Owner: 3900user
--

ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_socialtoken_pkey PRIMARY KEY (id);


--
-- Name: written_by written_by_pkey; Type: CONSTRAINT; Schema: public; Owner: 3900user
--

ALTER TABLE ONLY public.written_by
    ADD CONSTRAINT written_by_pkey PRIMARY KEY (id);


--
-- Name: account_emailaddress_email_03be32b2_like; Type: INDEX; Schema: public; Owner: 3900user
--

CREATE INDEX account_emailaddress_email_03be32b2_like ON public.account_emailaddress USING btree (email varchar_pattern_ops);


--
-- Name: account_emailaddress_user_id_2c513194; Type: INDEX; Schema: public; Owner: 3900user
--

CREATE INDEX account_emailaddress_user_id_2c513194 ON public.account_emailaddress USING btree (user_id);


--
-- Name: account_emailconfirmation_email_address_id_5b7f8c58; Type: INDEX; Schema: public; Owner: 3900user
--

CREATE INDEX account_emailconfirmation_email_address_id_5b7f8c58 ON public.account_emailconfirmation USING btree (email_address_id);


--
-- Name: account_emailconfirmation_key_f43612bd_like; Type: INDEX; Schema: public; Owner: 3900user
--

CREATE INDEX account_emailconfirmation_key_f43612bd_like ON public.account_emailconfirmation USING btree (key varchar_pattern_ops);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: 3900user
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: 3900user
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: 3900user
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: 3900user
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: 3900user
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: 3900user
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: 3900user
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: 3900user
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: 3900user
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: authtoken_token_key_10f0b77e_like; Type: INDEX; Schema: public; Owner: 3900user
--

CREATE INDEX authtoken_token_key_10f0b77e_like ON public.authtoken_token USING btree (key varchar_pattern_ops);


--
-- Name: collection_owner_id_eb1b2f64; Type: INDEX; Schema: public; Owner: 3900user
--

CREATE INDEX collection_owner_id_eb1b2f64 ON public.collection USING btree (owner_id);


--
-- Name: contains_book_id_8b5e99ab; Type: INDEX; Schema: public; Owner: 3900user
--

CREATE INDEX contains_book_id_8b5e99ab ON public.contains USING btree (book_id);


--
-- Name: contains_collection_id_101cdf7e; Type: INDEX; Schema: public; Owner: 3900user
--

CREATE INDEX contains_collection_id_101cdf7e ON public.contains USING btree (collection_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: 3900user
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: 3900user
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: 3900user
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: 3900user
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: django_site_domain_a2e37b91_like; Type: INDEX; Schema: public; Owner: 3900user
--

CREATE INDEX django_site_domain_a2e37b91_like ON public.django_site USING btree (domain varchar_pattern_ops);


--
-- Name: knox_authtoken_digest_188c7e77_like; Type: INDEX; Schema: public; Owner: 3900user
--

CREATE INDEX knox_authtoken_digest_188c7e77_like ON public.knox_authtoken USING btree (digest varchar_pattern_ops);


--
-- Name: knox_authtoken_salt_3d9f48ac_like; Type: INDEX; Schema: public; Owner: 3900user
--

CREATE INDEX knox_authtoken_salt_3d9f48ac_like ON public.knox_authtoken USING btree (salt varchar_pattern_ops);


--
-- Name: knox_authtoken_token_key_8f4f7d47; Type: INDEX; Schema: public; Owner: 3900user
--

CREATE INDEX knox_authtoken_token_key_8f4f7d47 ON public.knox_authtoken USING btree (token_key);


--
-- Name: knox_authtoken_token_key_8f4f7d47_like; Type: INDEX; Schema: public; Owner: 3900user
--

CREATE INDEX knox_authtoken_token_key_8f4f7d47_like ON public.knox_authtoken USING btree (token_key varchar_pattern_ops);


--
-- Name: knox_authtoken_user_id_e5a5d899; Type: INDEX; Schema: public; Owner: 3900user
--

CREATE INDEX knox_authtoken_user_id_e5a5d899 ON public.knox_authtoken USING btree (user_id);


--
-- Name: reads_book_id_0376bcbf; Type: INDEX; Schema: public; Owner: 3900user
--

CREATE INDEX reads_book_id_0376bcbf ON public.reads USING btree (book_id);


--
-- Name: reads_user_id_c209fc96; Type: INDEX; Schema: public; Owner: 3900user
--

CREATE INDEX reads_user_id_c209fc96 ON public.reads USING btree (user_id);


--
-- Name: reviews_book_id_b7e9bb6d; Type: INDEX; Schema: public; Owner: 3900user
--

CREATE INDEX reviews_book_id_b7e9bb6d ON public.reviews USING btree (book_id);


--
-- Name: reviews_user_id_c23b0903; Type: INDEX; Schema: public; Owner: 3900user
--

CREATE INDEX reviews_user_id_c23b0903 ON public.reviews USING btree (user_id);


--
-- Name: simple_email_confirmation_emailaddress_key_22d3e56e_like; Type: INDEX; Schema: public; Owner: 3900user
--

CREATE INDEX simple_email_confirmation_emailaddress_key_22d3e56e_like ON public.simple_email_confirmation_emailaddress USING btree (key varchar_pattern_ops);


--
-- Name: simple_email_confirmation_emailaddress_user_id_b0e04c62; Type: INDEX; Schema: public; Owner: 3900user
--

CREATE INDEX simple_email_confirmation_emailaddress_user_id_b0e04c62 ON public.simple_email_confirmation_emailaddress USING btree (user_id);


--
-- Name: socialaccount_socialaccount_user_id_8146e70c; Type: INDEX; Schema: public; Owner: 3900user
--

CREATE INDEX socialaccount_socialaccount_user_id_8146e70c ON public.socialaccount_socialaccount USING btree (user_id);


--
-- Name: socialaccount_socialapp_sites_site_id_2579dee5; Type: INDEX; Schema: public; Owner: 3900user
--

CREATE INDEX socialaccount_socialapp_sites_site_id_2579dee5 ON public.socialaccount_socialapp_sites USING btree (site_id);


--
-- Name: socialaccount_socialapp_sites_socialapp_id_97fb6e7d; Type: INDEX; Schema: public; Owner: 3900user
--

CREATE INDEX socialaccount_socialapp_sites_socialapp_id_97fb6e7d ON public.socialaccount_socialapp_sites USING btree (socialapp_id);


--
-- Name: socialaccount_socialtoken_account_id_951f210e; Type: INDEX; Schema: public; Owner: 3900user
--

CREATE INDEX socialaccount_socialtoken_account_id_951f210e ON public.socialaccount_socialtoken USING btree (account_id);


--
-- Name: socialaccount_socialtoken_app_id_636a42d7; Type: INDEX; Schema: public; Owner: 3900user
--

CREATE INDEX socialaccount_socialtoken_app_id_636a42d7 ON public.socialaccount_socialtoken USING btree (app_id);


--
-- Name: written_by_author_id_9d52ea1a; Type: INDEX; Schema: public; Owner: 3900user
--

CREATE INDEX written_by_author_id_9d52ea1a ON public.written_by USING btree (author_id);


--
-- Name: written_by_book_id_2f44d5a5; Type: INDEX; Schema: public; Owner: 3900user
--

CREATE INDEX written_by_book_id_2f44d5a5 ON public.written_by USING btree (book_id);


--
-- Name: account_emailaddress account_emailaddress_user_id_2c513194_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: 3900user
--

ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_user_id_2c513194_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: account_emailconfirmation account_emailconfirm_email_address_id_5b7f8c58_fk_account_e; Type: FK CONSTRAINT; Schema: public; Owner: 3900user
--

ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirm_email_address_id_5b7f8c58_fk_account_e FOREIGN KEY (email_address_id) REFERENCES public.account_emailaddress(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: 3900user
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: 3900user
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: 3900user
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: 3900user
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: 3900user
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: 3900user
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: 3900user
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: authtoken_token authtoken_token_user_id_35299eff_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: 3900user
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_35299eff_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: collection collection_owner_id_eb1b2f64_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: 3900user
--

ALTER TABLE ONLY public.collection
    ADD CONSTRAINT collection_owner_id_eb1b2f64_fk_auth_user_id FOREIGN KEY (owner_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: contains contains_book_id_8b5e99ab_fk_books_id; Type: FK CONSTRAINT; Schema: public; Owner: 3900user
--

ALTER TABLE ONLY public.contains
    ADD CONSTRAINT contains_book_id_8b5e99ab_fk_books_id FOREIGN KEY (book_id) REFERENCES public.books(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: contains contains_collection_id_101cdf7e_fk_collection_id; Type: FK CONSTRAINT; Schema: public; Owner: 3900user
--

ALTER TABLE ONLY public.contains
    ADD CONSTRAINT contains_collection_id_101cdf7e_fk_collection_id FOREIGN KEY (collection_id) REFERENCES public.collection(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: 3900user
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: 3900user
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: knox_authtoken knox_authtoken_user_id_e5a5d899_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: 3900user
--

ALTER TABLE ONLY public.knox_authtoken
    ADD CONSTRAINT knox_authtoken_user_id_e5a5d899_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: profiles profiles_user_id_36580373_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: 3900user
--

ALTER TABLE ONLY public.profiles
    ADD CONSTRAINT profiles_user_id_36580373_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reads reads_book_id_0376bcbf_fk_books_id; Type: FK CONSTRAINT; Schema: public; Owner: 3900user
--

ALTER TABLE ONLY public.reads
    ADD CONSTRAINT reads_book_id_0376bcbf_fk_books_id FOREIGN KEY (book_id) REFERENCES public.books(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reads reads_user_id_c209fc96_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: 3900user
--

ALTER TABLE ONLY public.reads
    ADD CONSTRAINT reads_user_id_c209fc96_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews reviews_book_id_b7e9bb6d_fk_books_id; Type: FK CONSTRAINT; Schema: public; Owner: 3900user
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_book_id_b7e9bb6d_fk_books_id FOREIGN KEY (book_id) REFERENCES public.books(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews reviews_user_id_c23b0903_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: 3900user
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_user_id_c23b0903_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: simple_email_confirmation_emailaddress simple_email_confirm_user_id_b0e04c62_fk_auth_user; Type: FK CONSTRAINT; Schema: public; Owner: 3900user
--

ALTER TABLE ONLY public.simple_email_confirmation_emailaddress
    ADD CONSTRAINT simple_email_confirm_user_id_b0e04c62_fk_auth_user FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialtoken socialaccount_social_account_id_951f210e_fk_socialacc; Type: FK CONSTRAINT; Schema: public; Owner: 3900user
--

ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_social_account_id_951f210e_fk_socialacc FOREIGN KEY (account_id) REFERENCES public.socialaccount_socialaccount(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialtoken socialaccount_social_app_id_636a42d7_fk_socialacc; Type: FK CONSTRAINT; Schema: public; Owner: 3900user
--

ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_social_app_id_636a42d7_fk_socialacc FOREIGN KEY (app_id) REFERENCES public.socialaccount_socialapp(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialapp_sites socialaccount_social_site_id_2579dee5_fk_django_si; Type: FK CONSTRAINT; Schema: public; Owner: 3900user
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_social_site_id_2579dee5_fk_django_si FOREIGN KEY (site_id) REFERENCES public.django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialapp_sites socialaccount_social_socialapp_id_97fb6e7d_fk_socialacc; Type: FK CONSTRAINT; Schema: public; Owner: 3900user
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_social_socialapp_id_97fb6e7d_fk_socialacc FOREIGN KEY (socialapp_id) REFERENCES public.socialaccount_socialapp(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialaccount socialaccount_socialaccount_user_id_8146e70c_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: 3900user
--

ALTER TABLE ONLY public.socialaccount_socialaccount
    ADD CONSTRAINT socialaccount_socialaccount_user_id_8146e70c_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: written_by written_by_author_id_9d52ea1a_fk_authors_id; Type: FK CONSTRAINT; Schema: public; Owner: 3900user
--

ALTER TABLE ONLY public.written_by
    ADD CONSTRAINT written_by_author_id_9d52ea1a_fk_authors_id FOREIGN KEY (author_id) REFERENCES public.authors(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: written_by written_by_book_id_2f44d5a5_fk_books_id; Type: FK CONSTRAINT; Schema: public; Owner: 3900user
--

ALTER TABLE ONLY public.written_by
    ADD CONSTRAINT written_by_book_id_2f44d5a5_fk_books_id FOREIGN KEY (book_id) REFERENCES public.books(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

