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
57	pbkdf2_sha256$180000$o17PxuXowR0C$igt5fsQN7thtgQLFF5hXhfjkVp5L7pTUM03CuUacKss=	\N	f	timwang	tim	wang	test@test.com	f	t	2020-07-10 11:03:19.586772+10
58	pbkdf2_sha256$180000$cyAd31uhKBki$0gOzEogQRHdUFqdyjEQBqguDG+mrZLpdo1OrPpDGIwU=	\N	f	helloworld	hello	world	test@test.com	f	t	2020-07-10 12:16:24.593033+10
59	pbkdf2_sha256$180000$YtKGN5HNuJrJ$u4hHuj4R8duWQT0zPx0iZ0t+uYq22HMCU3pI5KAJvH4=	\N	f	testuser69	Ghazi	User	farhansghazi@outlook.com	f	t	2020-07-23 22:47:00.207936+10
60	pbkdf2_sha256$180000$Fxfn7PafQNPb$tpC71KqLwBQdrBY2i0tV3i/0n/Pk5Gm6JMGwvrO+mrs=	\N	f	testuser100	Test	User	farhansghazi@outlook.com	f	t	2020-07-23 23:38:25.587405+10
61	pbkdf2_sha256$180000$pvXZMIyTkyRM$cvgQC+xicMxIkJONo2aMGHPiKjmH1/4kwybtPCe3jgo=	\N	f	timhuang19	Farhan	Huang	farhansghazi@outlook.com	f	t	2020-07-24 08:50:21.182965+10
62	pbkdf2_sha256$180000$H0eskCQs7zdx$fdSFZmReKOA0BKI957ijbE+6gfAuCQ7Hvd5L+DcF4kU=	\N	f	timhuang20	Farhan	Ghazi	farhansghazi@outlook.com	f	t	2020-07-24 10:12:01.540151+10
63	pbkdf2_sha256$180000$fS9TxCF1c4pr$H1M0TWPi2tu/BYaaW3YU5u854pYU9FOruJvuwndJVU8=	\N	f	testtest	Farhan	Ghazi	farhansghazi@outlook.com	f	t	2020-07-24 15:57:05.390066+10
56	pbkdf2_sha256$180000$Xjwd9r6AB3qK$KRI056c0tq1vrAwAWn3SvvSaPiwujipLz0h7bsgWVGQ=	\N	f	farhanghazi	Farhan	Ghazi	test@test.com	f	t	2020-07-09 01:32:22.546443+10
64	pbkdf2_sha256$180000$2y81qFuXTWK9$1EkJtdjJmr2J2osmWDo9H5DJA777PuERQAP0VtJP65w=	\N	f	abdulwahab	Farhan	Ghazi	farhansghazi@outlook.com	f	t	2020-07-26 12:26:58.570656+10
65	pbkdf2_sha256$180000$ZHhlkbQKdidx$IBJueekFeXkZLFYos4s6AsjuNhfVWCAUFCgjHEVxsaI=	\N	f	wowuser	Farhan	Ghazi	farhansghazi@outlook.com	f	t	2020-07-26 20:58:13.999432+10
66	pbkdf2_sha256$180000$q9z0kVKCGOfs$D4hb4rorIB2LVbxp6yRY2Lb6X9ZoGVwwcQKqbmKQZf8=	\N	f	michaelp	Farhan	Ghazi	farhansghazi@outlook.com	f	t	2020-07-28 23:03:21.526729+10
67	pbkdf2_sha256$180000$feI1ZT0meZpq$VJ70iO/8p2NcOWzW6VLjiQjgH8xusoh1Ml1/XEalGWM=	\N	f	mwang	Farhan	Ghazi	farhansghazi@outlook.com	f	t	2020-07-28 23:18:15.726148+10
68	pbkdf2_sha256$180000$tjGfvkvxhprH$mK5MABOOcKPtYkA0cEIXKDFe/6miFGEeL+CMqoWzKh0=	\N	f	mwang10	Farhan	Ghazi	farhansghazi@outlook.com	f	t	2020-07-28 23:22:51.855957+10
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
33	THE ORDER	The 20th book in the Gabriel Allon series. The art restorer and spy cuts his family’s vacation short to investigate whether Pope Paul VII was murdered.	Harper	2020-08-02	Adventure	0	https://images-na.ssl-images-amazon.com/images/I/519uxwI79rL._SX329_BO1,204,203,200_.jpg
34	PEACE TALKS	The 16th book in the Dresden Files series. Chicago's only professional wizard tries to keep the peace during a summit of the Supernatural nations of the world.	Ace	2020-08-02	Adventure	0	https://images-na.ssl-images-amazon.com/images/I/51mBJZGnFFL._SX329_BO1,204,203,200_.jpg
35	WHERE THE CRAWDADS SING	In a quiet town on the North Carolina coast in 1969, a young woman who survived alone in the marsh becomes a murder suspect.	Putnam	2020-08-02	Adventure	0	https://images-na.ssl-images-amazon.com/images/I/51NYjNgldSL._SX330_BO1,204,203,200_.jpg
36	THE VANISHING HALF	The lives of twin sisters who run away from a Southern Black community at age 16 diverge as one returns and the other takes on a different racial identity but their fates intertwine.	Riverhead	2020-08-02	Adventure	0	https://images-na.ssl-images-amazon.com/images/I/41Qi7YILYiL._SX329_BO1,204,203,200_.jpg
37	28 SUMMERS	A relationship that started in 1993 between Mallory Blessing and Jake McCloud comes to light while she is on her deathbed and his wife runs for president.	Little, Brown	2020-08-02	Adventure	0	https://images-na.ssl-images-amazon.com/images/I/41+BPlnwJXL._SX320_BO1,204,203,200_.jpg
38	SEX AND VANITY	A nod to “A Room With a View” in which Lucie Tang Churchill is torn between her WASPy billionaire fiancé and a privileged hunk born in Hong Kong.	Doubleday	2020-08-02	Adventure	0	https://images-na.ssl-images-amazon.com/images/I/51SSjum+fRL._SX327_BO1,204,203,200_.jpg
39	THE GUEST LIST	A wedding between a TV star and a magazine publisher on an island off the coast of Ireland turns deadly.	Morrow	2020-08-02	Adventure	0	https://images-na.ssl-images-amazon.com/images/I/51HNh-eI7CL._SX327_BO1,204,203,200_.jpg
40	CAMINO WINDS	The line between fact and fiction becomes blurred when an author of thrillers is found dead after a hurricane hits Camino Island.	Doubleday	2020-08-02	Adventure	0	https://images-na.ssl-images-amazon.com/images/I/51CzgnvkazL._SX327_BO1,204,203,200_.jpg
41	UTOPIA AVENUE	The glories and misadventures of a 1960s British band told from several perspectives with cameos by real-life musicians.	Random House	2020-08-02	Adventure	0	https://images-na.ssl-images-amazon.com/images/I/51E8EFJstEL._SX326_BO1,204,203,200_.jpg
42	A WALK ALONG THE BEACH	After dealing with loss and setbacks, two sisters take risks on dreams and love.	Ballantine	2020-08-02	Adventure	0	https://images-na.ssl-images-amazon.com/images/I/51eQKhfhGsL._SX327_BO1,204,203,200_.jpg
43	IF IT BLEEDS	Four novellas: “Mr. Harrigan’s Phone,” “The Life of Chuck,” “Rat” and “If It Bleeds.”	Scribner	2020-08-02	Adventure	0	https://images-na.ssl-images-amazon.com/images/I/51Zz45NoRbL._SX327_BO1,204,203,200_.jpg
44	AMERICAN DIRT	A bookseller flees Mexico for the United States with her son while pursued by the head of a drug cartel.	Flatiron	2020-08-02	Adventure	0	https://images-na.ssl-images-amazon.com/images/I/51hwe011M+L._SX327_BO1,204,203,200_.jpg
45	THE SUMMER HOUSE	Jeremiah Cook, a veteran and former N.Y.P.D. cop, investigates a mass murder near a lake in Georgia.	Little, Brown	2020-08-02	Adventure	0	https://images-na.ssl-images-amazon.com/images/I/51bKp5ZcwTL._SX318_BO1,204,203,200_.jpg
46	MEXICAN GOTHIC	In 1950s Mexico, a debutante travels to a distant mansion where family secrets of a faded mining empire have been kept hidden.	Del Rey	2020-08-02	Adventure	0	https://images-na.ssl-images-amazon.com/images/I/51FIj4YAurL._SX328_BO1,204,203,200_.jpg
47	BIG SUMMER	Daphne Berg’s former best friend asks her to be the maid of honor at her wedding in Cape Cod.	Atria	2020-08-02	Adventure	0	https://images-na.ssl-images-amazon.com/images/I/41x7Hl3D3pL._SX329_BO1,204,203,200_.jpg
48	WHITE FRAGILITY	Historical and cultural analyses on what causes defensive moves by white people and how this inhibits cross-racial dialogue.	Beacon	2020-08-02	Adventure	0	https://images-na.ssl-images-amazon.com/images/I/51aDh-YMFAL._SX331_BO1,204,203,200_.jpg
50	STAMPED	An exploration of racism and anti-racism in America.	Little, Brown	2020-08-02	Adventure	0	https://images-na.ssl-images-amazon.com/images/I/512hup-TOmL._SX329_BO1,204,203,200_.jpg
51	THE HATE U GIVE	A 16-year-old girl sees a police officer kill her friend.	Balzer + Bray	2020-08-02	Adventure	0	https://images-na.ssl-images-amazon.com/images/I/41xnmF+jlnL._SX329_BO1,204,203,200_.jpg
52	ONE OF US IS LYING	For five students, a detour into detention ends in murder.	Delacorte	2020-08-02	Adventure	0	https://images-na.ssl-images-amazon.com/images/I/51yke+5Oj1L._SX329_BO1,204,203,200_.jpg
53	HAWK	Ten years after Maximum Ride, a new hero emerges in a postapocalyptic New York City.	jimmy patterson	2020-08-02	Adventure	0	https://images-na.ssl-images-amazon.com/images/I/511n3csCaNL._SX331_BO1,204,203,200_.jpg
54	CHAIN OF GOLD	Cordelia battles demons in a quarantined London that are nothing like she’s encountered before.	Margaret K. McElderry	2020-08-02	Adventure	0	https://images-na.ssl-images-amazon.com/images/I/51dCwVleEwL._SX329_BO1,204,203,200_.jpg
55	THE BETROTHED	Lady Hollis Brite and King Jameson are set to be married, but will a commoner steal Hollis’s heart?	HarperTeen	2020-08-02	Adventure	0	https://images-na.ssl-images-amazon.com/images/I/51byOdCSFZL._SX329_BO1,204,203,200_.jpg
56	CLAP WHEN YOU LAND	Unbeknownst to each other, two sisters meet when their father dies in a plane crash.	Quill Tree	2020-08-02	Adventure	0	https://images-na.ssl-images-amazon.com/images/I/51VlHTCDDkL._SX329_BO1,204,203,200_.jpg
57	FIVE FEET APART	Stella and Will are in love, but they can't get within five feet of each other.	Simon & Schuster	2020-08-02	Adventure	0	https://images-na.ssl-images-amazon.com/images/I/51cYrYjR24L._SX324_BO1,204,203,200_.jpg
58	CHILDREN OF BLOOD AND BONE	Zélie fights to restore magic to the land of Orïsha.	Holt	2020-08-02	Adventure	0	https://images-na.ssl-images-amazon.com/images/I/61SB-c0mHGL._SX329_BO1,204,203,200_.jpg
59	ONE OF US IS NEXT	In this sequel to “One of Us Is Lying,” a deadly game of truth or dare via text now plagues the students of Bayview High.	Delacorte	2020-08-02	Adventure	0	https://images-na.ssl-images-amazon.com/images/I/51YWQjsiw7L._SX330_BO1,204,203,200_.jpg
60	TOO MUCH AND NEVER ENOUGH	The clinical psychologist gives her assessment of events and patterns inside her family and how they shaped President Trump.	Simon & Schuster	2020-08-02	Adventure	0	https://images-na.ssl-images-amazon.com/images/I/51xzDg7YGRL._SX329_BO1,204,203,200_.jpg
61	HOW TO BE AN ANTIRACIST	A primer for creating a more just and equitable society through identifying and opposing racism.	One World	2020-08-02	Adventure	0	https://images-na.ssl-images-amazon.com/images/I/51JM3rldZCL._SX329_BO1,204,203,200_.jpg
62	THE ROOM WHERE IT HAPPENED	The former national security advisor gives his account of the 17 months he spent working for President Trump.	Simon & Schuster	2020-08-02	Adventure	0	https://images-na.ssl-images-amazon.com/images/I/41gRbWB7I-L._SX329_BO1,204,203,200_.jpg
63	UNTAMED	The activist and public speaker describes her journey of listening to her inner voice.	Dial	2020-08-02	Adventure	0	https://images-na.ssl-images-amazon.com/images/I/51tvNGGDTCL._SX329_BO1,204,203,200_.jpg
64	BEGIN AGAIN	An appraisal of the life and work of James Baldwin and their meaning in relation to the Black Lives Matter movement and the Trump presidency.	Crown	2020-08-02	Adventure	0	https://images-na.ssl-images-amazon.com/images/I/41SgC38NcjL._SX329_BO1,204,203,200_.jpg
65	ME AND WHITE SUPREMACY	Ways to understand and possibly counteract white privilege.	Sourcebooks	2020-08-02	Adventure	0	https://images-na.ssl-images-amazon.com/images/I/51tW62wr9qL._SX327_BO1,204,203,200_.jpg
66	A VERY PUNCHABLE FACE	Snippets of the “Saturday Night Live” head writer’s life including growing up on Staten Island, performing in rural college cafeterias and competing in a WrestleMania match.	Crown	2020-08-02	Adventure	0	https://images-na.ssl-images-amazon.com/images/I/41zCs-R39IL._SX330_BO1,204,203,200_.jpg
67	THE HUNGER GAMES	In a dystopia, a girl fights for survival on live TV.	Scholastic	2020-08-02	Childrens	0	https://images-na.ssl-images-amazon.com/images/I/414rRyIJsDL._SX328_BO1,204,203,200_.jpg
68	HARRY POTTER	A wizard hones his conjuring skills in the service of fighting evil.	Scholastic	2020-08-02	Childrens	0	https://images-na.ssl-images-amazon.com/images/I/51SfTd37PaL._SX258_BO1,204,203,200_.jpg
69	THE BAD GUYS	Tough animals in suits take on some real villains.	Scholastic	2020-08-02	Childrens	0	https://images-na.ssl-images-amazon.com/images/I/51mECnE0w8L._SX258_BO1,204,203,200_.jpg
70	DOG MAN	A dog’s head is combined with a policeman’s body to create this hybrid supercop hound.	Scholastic	2020-08-02	Childrens	0	https://images-na.ssl-images-amazon.com/images/I/51biJWyO6cL._SX336_BO1,204,203,200_.jpg
71	DIARY OF A WIMPY KID	The travails and challenges of adolescence.	Amulet	2020-08-02	Childrens	0	https://images-na.ssl-images-amazon.com/images/I/51WVlYqD1RL._SX339_BO1,204,203,200_.jpg
72	BABY-SITTERS CLUB GRAPHIX	Kristy, Mary Anne, Claudia, Stacey, and Dawn are The Baby-sitters Club.	Scholastic	2020-08-02	Childrens	0	https://images-na.ssl-images-amazon.com/images/I/513FhwnoQVL._SX342_BO1,204,203,200_.jpg
73	CAPTAIN UNDERPANTS	Boys and their principal fight evil.	Scholastic	2020-08-02	Childrens	0	https://images-na.ssl-images-amazon.com/images/I/61GRtjzSULL._SX333_BO1,204,203,200_.jpg
74	PERCY JACKSON & THE OLYMPIANS	A boy battles mythological monsters.	Disney-Hyperion	2020-08-02	Childrens	0	https://images-na.ssl-images-amazon.com/images/I/51sZJKZpQBL._SX337_BO1,204,203,200_.jpg
75	THE LAST KIDS ON EARTH	Jack and his friends fight for their lives through the zombie apocalypse.	Viking	2020-08-02	Childrens	0	https://images-na.ssl-images-amazon.com/images/I/51nVkIIF4sL._SX327_BO1,204,203,200_.jpg
76	I SURVIVED	Youngsters' tales of living through dangerous historical events.	Scholastic	2020-08-02	Childrens	0	https://images-na.ssl-images-amazon.com/images/I/513ZOQ2VDnL._SX331_BO1,204,203,200_.jpg
\.


--
-- Data for Name: collection; Type: TABLE DATA; Schema: public; Owner: 3900user
--

COPY public.collection (id, collection_type, is_private, description, collection_name, count, date_created, owner_id) FROM stdin;
139	Main	f	This is your Main Collection	Main Collection	0	2020-07-10 13:06:46.7088+10	58
140	Finished	f	This is your Finished Collection	Finished Collection	0	2020-07-10 13:06:46.7088+10	58
122	Main	f	This is your Main Collection	Main Collection	1	2020-07-10 13:06:46.7088+10	56
196	Named	f	My collection of religion books	Religion	2	2020-07-28 13:44:30.262113+10	62
186	Named	f	This is a renamed collection	Renamed Collection	1	2020-07-24 10:15:36.177727+10	62
181	Main	t	This is your Main Collection	Main Collection	0	2020-07-24 08:50:26.392113+10	61
123	Finished	f	This is your Finished Collection	Finished Collection	3	2020-07-10 13:06:46.7088+10	56
197	Main	f	This is your Main Collection	Main Collection	0	2020-07-28 23:03:25.86473+10	66
198	Finished	f	This is your Finished Collection	Finished Collection	0	2020-07-28 23:03:25.888456+10	66
187	Finished	f	This is your Finished Collection	Finished Collection	0	2020-07-24 15:57:10.143956+10	63
188	Main	f	This is your Main Collection	Main Collection	0	2020-07-24 15:57:10.147128+10	63
174	Main	f	This is your Main Collection	Main Collection	-1	2020-07-23 22:47:04.661845+10	59
199	Named	f	Random bunch of books	Extra Collection	0	2020-07-28 23:04:13.434144+10	66
200	Main	f	This is your Main Collection	Main Collection	0	2020-07-28 23:18:20.101881+10	67
177	Named	f	This is a named collection	Named Collection	0	2020-07-23 23:27:42.07737+10	59
175	Finished	f	This is your Finished Collection	Finished Collection	4	2020-07-23 22:47:04.667273+10	59
201	Finished	f	This is your Finished Collection	Finished Collection	0	2020-07-28 23:18:20.104495+10	67
137	Finished	t	This is your Finished Collection	Finished Collection	3	2020-07-10 13:06:46.7088+10	57
136	Main	f	This is your Main Collection	Main Collection	1	2020-07-10 13:06:46.7088+10	57
190	Main	f	This is your Main Collection	Main Collection	0	2020-07-26 12:27:04.074271+10	64
191	Finished	f	This is your Finished Collection	Finished Collection	0	2020-07-26 12:27:04.077416+10	64
192	Main	f	This is your Main Collection	Main Collection	0	2020-07-26 12:27:24.776675+10	64
193	Finished	f	This is your Finished Collection	Finished Collection	0	2020-07-26 12:27:24.780022+10	64
202	Named	f	Personal collection of philosophy books	Philosophy	1	2020-07-28 23:19:39.4445+10	67
178	Main	f	This is your Main Collection	Main Collection	0	2020-07-23 23:38:31.026894+10	60
179	Finished	f	This is your Finished Collection	Finished Collection	2	2020-07-23 23:38:31.029015+10	60
203	Main	f	collection_description	default_collection_name	0	2020-07-29 01:22:02.573474+10	\N
204	Main	f	collection_description	default_collection_name	0	2020-07-29 01:24:28.068483+10	\N
194	Finished	f	This is your Finished Collection	Finished Collection	0	2020-07-26 20:58:19.259707+10	65
195	Main	f	This is your Main Collection	Main Collection	0	2020-07-26 20:58:19.26147+10	65
173	Named	f	This is a named collection	Named Collection	0	2020-07-23 22:32:39.225453+10	56
227	Cloned	f	My collection of religion books	timhuang20's Religion collection	2	2020-07-29 19:51:08.452399+10	56
184	Main	f	This is your Main Collection	Main Collection	0	2020-07-24 10:12:06.252065+10	62
185	Finished	f	This is your Finished Collection	Finished Collection	4	2020-07-24 10:12:06.255854+10	62
183	Named	f	This is a renamed collection	Renamed Collection	-1	2020-07-24 08:55:20.663944+10	61
182	Finished	f	This is your Finished Collection	Finished Collection	3	2020-07-24 08:50:26.394353+10	61
228	Cloned	f	My collection of religion books	timhuang20's Religion collection	2	2020-07-29 23:25:33.316931+10	61
\.


--
-- Data for Name: contains; Type: TABLE DATA; Schema: public; Owner: 3900user
--

COPY public.contains (id, time_added, book_id, collection_id) FROM stdin;
222	2020-07-30 02:50:27.909092+10	41	122
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
6bcf111e80a9470544a00a2d802c63a440272bf23ab25042fa67ff2cb4224d3f24d7715a63d0a7690a812e97a6ae84f8dd5a953b6dc13c5bbccc6f934071c132	9942a630211afc5a	2020-07-09 01:32:22.664042+10	56	2020-07-09 11:32:22.66367+10	3103a17a
f5f79ea8955e0b42d4ab41ea984dd32009cdddee56d4ceffd177d7566e6e42d5f77a86ef53806116919516c5584c811bc838e2061f10e35ed050bcb2eb61fcd7	9aca4b3137b6699b	2020-07-09 01:32:42.9891+10	56	2020-07-09 11:32:42.98864+10	7b01b451
7d5711a063f1bd93f25da037be103f09d9a9c2674b58b51e78da95c61318b6a2622ebda8eed4d0f09374c52c4211f69e237e940919dfefea93e4091ede70535c	6a39aa7bae98d113	2020-07-09 01:33:29.793431+10	56	2020-07-09 11:33:29.793061+10	395f3e46
5ea59b81c7c926af9faccf56dfbfb7cbf4ea722c4cf9f296348516aa68c51b42a28dd85780ec18634ed3140c16473c47667a59e1d5740141082c48a3a6c39379	24ead89da9c6306e	2020-07-09 01:40:36.706873+10	56	2020-07-09 11:40:36.706563+10	983cc634
05249f88b75121758f069398761a5d95775c795424bbe05f9726de9138de52e70d60757380f2891f3016ab1f995868595168fb8bf7f941f5375ff721ccd59eb1	585a2b5f4af34b21	2020-07-09 01:43:44.627203+10	56	2020-07-09 11:43:44.626878+10	0569195e
23d70934581ac422d4cfaccfcb6e8b203d5599d20fc86f919527a17660583f4b307dc2d03d15830d5391f52b8489f1a226a804f446cde59b250cbbdae6ff32ea	df48eff23cb111bf	2020-07-09 01:45:23.964133+10	56	2020-07-09 11:45:23.963747+10	f35bf96f
0b4f2143208fb20c83ea0c165b4a9ced084a94972998baa61c8155375bf8bdde41fb8096f7a31d31bdca083d544bf97fb124596faf7f06137d1d4b7cf38787b2	e424fb31ef2b0a59	2020-07-09 01:51:13.676831+10	56	2020-07-09 11:51:13.676522+10	8450a3bb
6cd9938359195bd5836627c2b89fc6b28badbc62cc45345b1ba0a44c3c72ebf6951546ec95e9508d2a7fe9fd21beb15a45944b89d375664381d41c9f176c3d97	c58ffc4832953a16	2020-07-09 01:51:30.817809+10	56	2020-07-09 11:51:30.817461+10	d08eb36a
31e0dad2bc1a2e2c4bea0a9ca8931e2bc33b13fc191409390087d15ce8a9b4bebcdd3137189e2d7dbebf69355405035cae9b2ccda4b6099cfe5cf95ff6690116	aa522ac96a7180e7	2020-07-09 01:52:54.262923+10	56	2020-07-09 11:52:54.262619+10	3eb09459
e27a95ec343e38d5f0a61b588fb84190203b2baf5493b310d6c0945a29e80a436b3075699d9dfdb70ef439dfe988f4af6224a3ecf470411f8a14584c8443f86b	14611e543d5bd774	2020-07-09 09:44:26.966147+10	56	2020-07-09 19:44:26.965838+10	159e1cc1
44848cc81061bfdc5afa10ec8f8bf893018fbcea4c99cad8ff0c52e39d83ec2f126c71d6400755cfac22f75ee1839e73583a27b05da5dd5e24b372e278b29a69	c72e9e78cfb50c83	2020-07-09 09:46:26.82551+10	56	2020-07-09 19:46:26.824893+10	5383bcc1
406ddf7d7a8eea715bc01638a0b4f2e6da5ae092eef8f57c6fc4d4655237e3d3d5225ddab957c19c8305111e768edea6871fb53f687c8ac37e6578dcd5defac0	b4a434b36f610016	2020-07-09 10:52:36.372815+10	56	2020-07-09 20:52:36.372274+10	627fa9cd
ed38a6a4bfaac25775745d517e4d921d84c355e0350c32b4c19ebcc95fd63b8fae04ed03a1d7a83c1849c24472723d9aa7eddac7396a097f7adfb54ca5075f3d	7f496a50fead9c47	2020-07-09 10:55:08.852955+10	56	2020-07-09 20:55:08.852593+10	c5162327
2d326efe415161c043e1e755d5312a5fb5d4aae138a7571f92a5266ab4028f1bc34d16f28b93f0cf6a425e011097647aa8fc1fa39b15e3e62b8f1cfc66e47166	2c89b75a0b440f99	2020-07-09 11:48:00.878057+10	56	2020-07-09 21:48:00.877566+10	5c6af5fa
6e77f79f04b8352cd58c7ff5b5ffdb041ca42def40f8cd3a2db69584b82400d009991f03661abc6b8d7f82a1e0b0aeeccf258a5c1a55c8d0913086b7745c4f17	81a842c1e19fe3ba	2020-07-09 12:24:59.703875+10	56	2020-07-09 22:24:59.703534+10	bf3f1f3d
e261f8ad35426aa095db4caf30f84016ae1789b724d3ba6eed19837cad2348632de63a470ebee13335321a5925904bf711cb64e9def1ee5b06bb870599e208cd	f05671351f3f9bda	2020-07-09 12:27:43.005063+10	56	2020-07-09 22:27:43.004741+10	9d859d6e
0dc5963d26346f93e3ef0c760cc7ec17885478340c4bcc9e4a227939090380a40ef9676adb432c02f413ad6581b58aadcbf3ca0b0f72ac9c17040812f5a35417	43c8f47807f612ee	2020-07-09 12:31:06.427842+10	56	2020-07-09 22:31:06.427527+10	f1528d6e
10b80a0fbdc678d40cd4afb0ba2f91e978a9318db375e64d41c79e74c7c8f97a283393ca441b48cf0af6815352842a840e0d1f99617d2f293e18635c66b81b90	3a74ea54f81d2173	2020-07-09 14:18:42.641637+10	56	2020-07-10 00:18:42.64133+10	38b0e9cb
ac20a2b3308b6069bc6753c33a46e95f52cbb2354037369a039839229922b5680d75b7a1d5b8b166b793eb15444e60eacd3b8dfa92bd348e8ad2f61d7fb05156	e238a6db2eb151b5	2020-07-09 14:42:05.23093+10	56	2020-07-10 00:42:05.230078+10	2976aa2d
296fe99d896846e4bfb4c9c210845714a5dd1237c3998be166bcc41fd71cd234c66042a992bdf7d0f7d880b8e8cf1f6975aa0a8d8d71356e9e61eb3114474cc8	56bb5450c2767863	2020-07-09 15:37:43.96022+10	56	2020-07-10 01:37:43.959729+10	3f4cfc3b
5431cfb006800643aefe89d88695e2c9e991f7c8fbc800c451a41f37a58fa7b1514819603995b1ec7a1ecc6b362391efff0c6214c48cc1f3cfc89bee6286fc74	aed0940ba0c73839	2020-07-09 16:25:18.740768+10	56	2020-07-10 02:25:18.740246+10	8958c035
a63d9a227f12aede8d48008d53483983b5ede018bacbd22dd0e38c68fc69f3f72f723b783d926ce7ff353a072a023d8ca873427a7d548f31c48ed61f713a8f28	ca7b9204c9a50a91	2020-07-09 16:26:23.086577+10	56	2020-07-10 02:26:23.086203+10	829f7cd9
69c375870a4979798dec869bc62d557070f39ff5d05ed193d735f7c8837b82676c314d5e46e46bb3621dcbba5348b2f353dfe571735267b8eaff1ded9e27896e	82b77e2e11d896e5	2020-07-09 16:53:18.469997+10	56	2020-07-10 02:53:18.469698+10	9f74bed9
332b4438dbce6c6c572b14e6f3090755d01a7a887b889f61360e4e5b9a5f64b25da3046ea710ab6aafa319b13019af8592e36a593c151d13f7938609d7c1be3d	6168a510ed114d71	2020-07-09 17:05:26.981886+10	56	2020-07-10 03:05:26.981578+10	51d0d5d6
9288b839c3f76a99c6289adca662fd68508f936cf913702458ee29ad4798c8252e37a45ad3706fd9632ea30f1589f6755cb1b4647a3fd33e8963a4b32ab581b3	4efa9697fd2d1588	2020-07-09 20:54:11.594816+10	56	2020-07-10 06:54:11.594504+10	66ac0efb
ced7ce7e6dbe1d55d6d74c35300a8a75b682530619aac9530514f6791048321131706769bd4ce653bf0141e63fb9f635b105867444e4996b791647373bacab47	036e5f7484fa8ff3	2020-07-09 20:54:39.966383+10	56	2020-07-10 06:54:39.966077+10	b05fd15d
7639e33f3efd203acae8b988fa61ad417cd07a90591f351bf2513fef3e5d44adbae6c61ec0d34acdfd343746540fd73f4d650d42ca0e30108324eb39caf55948	92eb0ddfaace15c4	2020-07-09 22:13:11.93634+10	56	2020-07-10 08:13:11.936037+10	f3e1b240
7330653ba7b1becb298b48d85fe282d587d296ea77d93eabcf50b802840f8237b1c1f8d325a68953690fcca56a4bb0a6f695f3d26b2ae3d4b3110e44f7a82248	cb5a9a2b800edcdc	2020-07-09 22:14:01.054988+10	56	2020-07-10 08:14:01.054681+10	548211e1
5b7a7b81e631e62208e2fc4d7447a5d474ac0fe3b321f5a20b71311a0b96fe1b64cef04ef651e0a164765bae111bf305fe1d2ebedb391ef38abf8953c46708f2	2ce724124da26ca4	2020-07-09 22:18:09.233041+10	56	2020-07-10 08:18:09.232715+10	3975a6d8
f3bdd5e1bdcf18280a2572fa545a2427e55d137b76165bcf3fce2e5c7e51766b32e8091b9e673b4d19e52ab4b4b19690e9a17daa78e49ec9b262f1162512cf69	2149a7d653d98651	2020-07-09 22:46:26.981469+10	56	2020-07-10 08:46:26.981096+10	11591778
3c81eb566e1a10fdd575471ce20c545c5c96150aa88327ea353ea1f9f4d0140c7da1897756a58f2c249bac6482122891346f8e4992f15bd154a6cafb631d57ed	20956ce1545bf4a2	2020-07-09 22:47:34.821062+10	56	2020-07-10 08:47:34.820741+10	2582b9d2
a8d0a7c88d9949458300c5ac230cad1af799f423d57c080eb7dd0bbd7162e6bcecf167e24a63fc9abd1861faf056f46a7e8f2a1dae25cb21c905efc3c6cfa619	23ec580acbe131eb	2020-07-09 23:17:21.878625+10	56	2020-07-10 09:17:21.878014+10	41fe8782
6ef3938ce8c2819629d7eb389babbeccac9b5e165839461bfc5fbd41994f6e1a8faa9e221ab795dd5e4abbd00f0e7c5e0de2b1d2175d24fdd88f3e2b049557cb	694df95b8a6d1026	2020-07-09 23:17:44.863756+10	56	2020-07-10 09:17:44.863408+10	4078554a
a1a9b30c278a1b663d0a8676d816b3bc574572ee94577c65d603b4c545f59e662b8587d17ab5810a59adb2d71e14b23f72d06dbad628315484413a636de9728f	445a27c39941202c	2020-07-09 23:19:50.623069+10	56	2020-07-10 09:19:50.622622+10	f2511e61
0f20ea530dab09f8c784d9a1e8ed92e58dbb3b5a6729b8469d6308081929f31856340cacd7fb3ec6e8f608c3da7ac47bba4fc9326b29b85d8c1d13caaa60df0c	0381b5764e342f3e	2020-07-09 23:22:24.260217+10	56	2020-07-10 09:22:24.259824+10	c3415d13
15d6c6fe54c0ea8370ae1f3fac5eae4668f736b372b8c6fecc17d90170a451b79a11315ac8485f6702a74e3b16bf120969381ec48af9030e9e865e1b5e930f46	63bd5e0a96517df0	2020-07-09 23:28:50.363349+10	56	2020-07-10 09:28:50.362965+10	8e3c3990
b7aabbd16789c87ef0c1b8e36f2b1f8a23f170fb8cb5902591a789a0c62a0fa1c23ab57cd531d241a824e7157be8f980a3d6376dc4bb8b32e5457e3d232ecb32	72d986db39c05600	2020-07-09 23:43:50.113513+10	56	2020-07-10 09:43:50.113181+10	435986e0
ccebadc381e4bc46021e2c1974ca4c9f9309acfad4ca9ce94554833bf66a0ffeec163d73087f4f70da9698481b34e80be0a7013f582a8f0ceeacaecb26062f42	874353b1db938a02	2020-07-09 23:57:54.993289+10	56	2020-07-10 09:57:54.992935+10	b3d2647a
c78d6a60d71df7abd69f55aaccf756ddee91eb876f7a171ce69d0cb148e4d61d6eab6873d4d4df80529e4d456a4ec738658c343268d07f8be0b470f4833a117e	cb9971cff1569917	2020-07-10 10:22:56.203945+10	56	2020-07-10 20:22:56.203452+10	aba44eb2
cf0acf27aa7f39da0273190ccee55836a30bccf51daa30edfb990b5b755dd50fdfe91d44ca09e0409821b574bc76297c1d6d6089f60ebefc68293c47545633b7	7d586ef9b76f61b0	2020-07-10 10:39:28.149266+10	56	2020-07-10 20:39:28.148953+10	a5f4d207
95bb745f17a38271f7cb9f74665e038fcb6ff64a9c908e33afeb28ad53a7d42d068fed7ab0e2631c932786cec7486ce761d7efb8a71954ddf36dd878194f66ca	47095de91779e271	2020-07-10 11:03:19.702347+10	57	2020-07-10 21:03:19.70204+10	eef20357
07df4ec0e3e5896a5f4f7785d427794bb52c188a1e9e0489947997bb000aa09e39e72ee2017bf028e5f95c1f4972d4a334d554d8b1d2a26566794b7a7c34d1e6	9231de5765f4bfff	2020-07-10 11:03:48.61289+10	57	2020-07-10 21:03:48.612564+10	7ef7cd4d
6e0276ff251b4c1e00a451fc5859422630dc704f2ba010964d5ee048579e134845f8c3cdd6087e16b4fba73904d070ffdb8c34565fcf4348e7053362cfe13aea	526c0fbad6271598	2020-07-10 11:03:59.415348+10	56	2020-07-10 21:03:59.415045+10	4d0d707d
3f64c8e8c14df18f9df1f5ef414bd7bb70a418c56a8559e3878939bebdbff51a3cbe06fe0564f12c66a4709992e54b5f5c0d9c1cf887ab11d386b10f6c1171b6	c1fe07ed68117968	2020-07-10 11:27:07.133508+10	56	2020-07-10 21:27:07.132864+10	085a466d
3d31e596c003e26c64db14c4f8eb595c5923b15c796c5950934ba98ec65e645f33a1f87a20c3cbb006342a4f53b20de8194b63e6871b875ad10727150ca29431	f4e66168ad713e1d	2020-07-10 11:27:38.40423+10	56	2020-07-10 21:27:38.403874+10	797eadb0
c33d042b64c33dea897605b51820aa2eb889c4b1d74d2ed2b405f4ca86096a6eb6f904f7b2b3577bc14bdf8d7a8f2028c52621e4a650536b0a7ceb37363edd44	b5b75bd7296ff0f8	2020-07-10 11:30:58.006764+10	56	2020-07-10 21:30:58.00636+10	47988141
e17722fa29def20e0587516e9ef2f55a8676787f947a078453503333b265c54ca852c085e9e91a6684961ad303c026b5ec026b10741e611e064ab429d66fe8da	3f1761c020513807	2020-07-10 11:47:55.041565+10	56	2020-07-10 21:47:55.041253+10	586e95df
628b790d72a97f57bd4742df6afe38df06ffc536855d93e2439d55fec0559d5140d123cfe3e4395d1ea6e753758994299dc4e1e0ffbb252c0428a3d8cacb590e	fa2595c32aec20cf	2020-07-10 12:15:50.029749+10	56	2020-07-10 22:15:50.029436+10	82cadde2
c271e84aae4c7870030573ee7e158b58b5aa94c4f96bd6500bae046dc6f260103877f71b35107aee03a3bba1b818e083ad1e60ce58eedef31b000acd96d85143	af364739f30703f1	2020-07-10 12:16:24.714543+10	58	2020-07-10 22:16:24.714269+10	9fae5ce0
83a808c40942a931a431f65fd15d4cb93428f7e9d771dd76db60ef1b3417f3f7c03ffb83984021d326711cc4562e7dbf8f472e4ab8472564d4ec40e108d5beb4	7c36a106b67618ef	2020-07-10 12:27:00.889514+10	56	2020-07-10 22:27:00.889051+10	51f6826d
6267e225809f0ea5b9cace9d1ebabfb10c48b16452f5687e80834dfc61798fa2f4e95d69e4123a833dbca6ffbbcdbf55c27765765e0e7fc70351d18e97c17ede	c4bcb8b89543f7f0	2020-07-10 12:34:35.455209+10	56	2020-07-10 22:34:35.454898+10	72db6f20
a2d248ca6f239c332d40ce5fb1271af0389380c8b0fcc1e7acdb3764a3814d7649f16243cbb7e3ca76e91b696546223b89f8ae3e9fb294ee83db9c83b0ec15d9	4a8e4e49a0a8ea2d	2020-07-10 12:55:53.487333+10	56	2020-07-10 22:55:53.487013+10	f70c49fd
d622447e18521d8d0ec039d6e83eaefb21b81fb5b2389c5042d3aff0c52a73d6d5c9d3f88f35883e6b7ca6b4231e94808bb4762809c5c59a37a8ce93efc32f4e	bd6a047d5a096fa6	2020-07-10 12:56:56.973539+10	56	2020-07-10 22:56:56.973233+10	e4dbe1de
b7283784f7c8550d19140c2548bb1c7dbc669826a684bbaa90f1fdfce2635a8946fcb594d0d4dc98f96c94dee577420a67ab07851f6e6823a61644e72d91b872	aacfeb045c85d229	2020-07-10 13:11:28.623337+10	56	2020-07-10 23:11:28.622834+10	96514755
215c86bf6efbcd6a90a1d3c0bf325cecfacbc1a5892be7659bd2aa2cb15ad72515f9ec9b989aa04190fdc034e904855144fdd6450923e084b9d534932893516c	413165448961bece	2020-07-10 20:22:18.653833+10	56	2020-07-11 06:22:18.653517+10	d5f388a7
c73d688ca934ac11925303b7553d4a9ebe4cd2144201a979b9227d82d4d6614a80f91962e275b31bca0dd975a6daef02ea1675420f3543892af022c08f55204b	e52965648f3d72ef	2020-07-10 20:22:33.385623+10	57	2020-07-11 06:22:33.385322+10	e2219cd5
080bda6234068cc714a7bee698de4f052cc54e97ef2345c4c43d675b18c1de7c4ccedaafb1ccb8dc281431ee18859719d8d9cbc1ceb4d9da89e06ac307543101	d6ee6829dc37a37b	2020-07-10 20:22:45.942317+10	56	2020-07-11 06:22:45.942005+10	d4d7926d
e9f641f0426585a6c0a810e8eaafd483a5e61d543ea612086e6b34693afacc823f716e452808f7afc7e147b76d030095341bb5bc292e80b2d1dfe1891dbe575b	bf4b70ba62ccee9a	2020-07-10 20:25:32.817069+10	56	2020-07-11 06:25:32.816576+10	66e41334
b7c2718f82b6ec03f7951b24b0f195cbeb3f27fe5e6a551c6d0cf8f0b67bd637782320ca9be45e71d3695714caa8271734ba8df092c47d63326be558873d6763	ce704b5e872c164b	2020-07-10 20:25:41.589957+10	56	2020-07-11 06:25:41.589606+10	7b8c0970
f3717de3d00eff5711701bf9ea6a6c1997ffb3258ece7fb89c54a45f5d78f9dfe6454539cb91f6ff694ed3cfd7841219e4b6ce7f44a5d28e38270573a99ce85f	0c4bb5e2d90f2df3	2020-07-10 20:26:02.417186+10	56	2020-07-11 06:26:02.416878+10	dd865ca1
363f6a55e696d1becb99d909f84d05311da115bd867f1a1a86fef44b1ffcc32530839662412add7cbeb2f59597994980c40f6b3db262c0f4377dd64592aa6fca	7854f775c97f2dc5	2020-07-10 20:27:32.589469+10	56	2020-07-11 06:27:32.589002+10	7e0aeafc
b776eb570e7cb964994e68547c970c245cf312fa9abe3fe933093a5ea130847c465f15b5077d53626c61bb6f3fb909f870805c7018e19a153b0d29f10c615d88	d08525bb87dc7ee5	2020-07-10 20:27:43.348854+10	56	2020-07-11 06:27:43.348545+10	d874437b
d7fdb5d8b5d31aaa073a752d541080f8822da8676b63efa8b0bd040a2bdd9cfb07546475c63143da45401ff044f929538311b6028b7b1d376b7fb01f0c715870	bf9045556c4b56ff	2020-07-10 20:33:52.459884+10	56	2020-07-11 06:33:52.459419+10	b5aeeee4
eafb6a9d56fa46f1b6b20264f61aa0ea48f79ca60649335bd76fe62b96d3e38d66625cf43af75c95c3f3e01bdc5d0970e58cb755f8c86bcd4ce603fa364336c1	81a0c5b2619cc5d1	2020-07-10 20:38:55.79973+10	56	2020-07-11 06:38:55.799408+10	e87ba806
06cbdb0967d7ac6c823bac3c51ebf14386c1c0269cfcb5601c4f22c0179bd14e63de7f44c94f18f2f4b77395e7b2de02050e3e0840402e3cba038be9890780a7	dcd705898d01cd9a	2020-07-10 20:45:02.786439+10	56	2020-07-11 06:45:02.786141+10	1fcf0400
30490f5315b2642c07ac621ff22b8f32965c29ff61245426e0c9bb6f4328642f2899cd0fe3a16ba3fa3e80cc8580c425ff2c33e3cf1d623e8915875e6e1c990c	d90cc57305ba8bf1	2020-07-10 21:05:44.398233+10	56	2020-07-11 07:05:44.397638+10	3e4b3a38
19b5e8754506c16c067da118cb8ee90db50acfca69acf39cfb22356a867c8196ae8102be716a6f7bce38e2ce8f447f03818689a76d15a4a8a56011230f8c9121	a8328fd8976bb560	2020-07-10 22:30:01.116206+10	56	2020-07-11 08:30:01.115558+10	a7cd0e7d
4abf4718f1972119fc1da861f940f3eb6ea676b811846c318d184577fa785b782959d8a8950f823fa46e6a59d65ac48e1f050bda542ad18ea88f5c6033aed87c	6b306a3580f77f38	2020-07-10 22:45:41.530965+10	56	2020-07-11 08:45:41.530599+10	d9ae0010
6cb321a5eb3b7dcc480dafba1f00d21cc2b84760537ca7bd65a054f380991a33428a3d8a9ccae96b4b53f1b89931f32869bc36cf2e7fd96d3c567e15de885c1a	da3763c8aafb39ea	2020-07-10 22:45:50.642924+10	56	2020-07-11 08:45:50.642554+10	9a0410f9
8abf7fac62d04d76cf28c8dd63f37845a25185757975ce37481158b3328ffbb9a617785ce56089b260d57032eeff92d6721aed968a52e2a1742bff607aabeffe	34d9a0407ee3439c	2020-07-10 22:47:47.318092+10	56	2020-07-11 08:47:47.317769+10	4db30cd2
106a82ce2423a45fd32eb73904848a1c4fc4704e1712d070c6714476b43a907485bd12fa83229461ab67a8d25f258eace5b7da7ee3fc5f0d44643d7b830fa20e	37f581d7495b7b02	2020-07-10 22:48:47.55039+10	56	2020-07-11 08:48:47.549975+10	b7d9f762
aac22c81bb63553040158103e872f9c8955e119843d223999482f6b19c3b9ea3be2a2304adc04bd70ee18cd15819f19cccde89f9265082fd8b5016e5745c5e9b	5fd014c01b1c71bc	2020-07-10 22:57:25.468631+10	56	2020-07-11 08:57:25.4683+10	c2a17d38
4487e3acb84dfd14ccc08a84afe183dbe35a2c690215b9ca6bd40f6226c43f444d91f71cc69bff738e8a659af5137f1e5ed2929f8cef402823222ba286a77923	26119230faaad6b1	2020-07-10 23:12:19.745259+10	56	2020-07-11 09:12:19.744945+10	a75c13cc
12b43a20bbe6c372adf54f629794794d5e4f3dba88a740389686a58a63f117b3c70fee109991db5cf7690b597add21bd36dbbcb88cd5b193333490d99fba1a96	a1906d4106961b61	2020-07-10 23:28:03.914897+10	56	2020-07-11 09:28:03.914583+10	98b321f1
4eace9e6da5ff5ed985f903db80dda2c55d1dd66286e98dad2487cfda990e9961406c5b8931aec79158227559e73491c892a1168e2ced52c2f4d9dd4dd45baf0	bb4977dd6b56c43f	2020-07-10 23:43:39.409389+10	56	2020-07-11 09:43:39.409071+10	451ed96c
10a9348dcdb62f53f6b127dc44a2746c718fc33f99aa27cd81f2d1e4bf62cc0f2cbb1a5f8dff03fd0065d90c7d5f2a4b653e2a2cdff5ef555e34ccd796b31117	dfc778056196f8ea	2020-07-10 23:43:54.503395+10	56	2020-07-11 09:43:54.503081+10	4f5de0ba
c437d2bd334e0b93f566482b9e0098df180f83263b3fad059a66d10a3b46b96d655e7f0443ad00c44ddda768a26fa7bbc59dfab116543c728c1779c4118366cf	2fc8c7a167b3100d	2020-07-10 23:47:08.324641+10	56	2020-07-11 09:47:08.32432+10	b7795346
32379fad45e20b89b17c62a37b26673be8678ef32e7844ce21f048564e97d0ed90e07fbb8279d59bb5a1adc4e71d65ce2d15246e154c2cb4cbf987d4e9733b09	7dd22b01fa9097e4	2020-07-11 00:42:14.160754+10	56	2020-07-11 10:42:14.160386+10	cda9b80b
1f2c1c525f667f7913bec3a0a7e7768dbf470de1a5f0379435ebe2e31700ec75060199d096599b6d250811a4679557e3b877ba5bcb41edd53c00a40a539cb941	8c980a60b22853d8	2020-07-11 11:16:10.414145+10	56	2020-07-11 21:16:10.413834+10	7bb8d270
67f1a71bec49d593932198910fa848fa3d029b2971bc8ab6482ba36dac4702e949cdae3430af8afc55c127f35365e52ccf217a1654234041b71b1eb0a1e70660	8350b7da465e078e	2020-07-11 11:40:26.002808+10	56	2020-07-11 21:40:26.002442+10	e8efffe9
82bf971f46b49b6fc3580d936df16f37ecfb0f2df820db3386a22aec35792bcd240be093045eb519326b20d665c5b182117315beebb53f1e63a6b488e7f52752	601fdab07df51ca8	2020-07-11 11:41:32.841102+10	56	2020-07-11 21:41:32.840684+10	c1bcd1a9
65160676f08926d675140c481e547f8cf6bc777ddf121af3635751279cbcf035d74b5a7e7a61a6b3e8007b775613c32e529f9198fcdccf24cfd545dcba79730f	a871c186bfd28607	2020-07-11 11:53:21.26944+10	56	2020-07-11 21:53:21.269132+10	4222205b
65ad486d0af70383120f95b311906cb13316c150934035a937496718891e9fef283f55c57e345aeabe3f2cb73e644863cad1a0204ec3784424d1503ff475207e	b5fa8f4c6d51a3f9	2020-07-11 11:53:30.262537+10	56	2020-07-11 21:53:30.262204+10	08830c6e
ef9496072244f0e87bc78d439efd376742e00e212eafc61ad00cf447980250afa135b48f376d612954a7bde6a6be92af93813b139b993ae7774563abfea89b17	4aae92334b55dae9	2020-07-11 12:01:21.631213+10	56	2020-07-11 22:01:21.630894+10	04e2a475
9bb04c2b12551f76b77ffca40d4367a369090ae95e4bb4383831f0665453a6e6fce867a5387177fd8ffff2d69219d43377203feef3daad73b40d4bc633963377	be58d4416aed4760	2020-07-11 12:05:19.998645+10	56	2020-07-11 22:05:19.998257+10	424d5562
f7a41dc67689876d6a01ff5ab70244a00a6763b4f4efaeab5da615943e3797eb67274b81b79705b137308c603edeb1f103426e9616739f67c0518e83a5d6750a	d674d8982cee8dcf	2020-07-11 12:08:39.025324+10	56	2020-07-11 22:08:39.025011+10	ee536437
f1d3319b0b36440b1a146f6e4c9dd502ed753a5674e37d59a78ea51803d36e4dbf2267e27ee3077a3fa9c788bbf3aaff407c35554f60c9dc2f6fc972e1dbdc85	dfc3075548103523	2020-07-11 12:09:30.412416+10	56	2020-07-11 22:09:30.412124+10	af696b68
7f2395e363cf14c8a73d59644242b88b9dc5d0f89eefcc12212d8556d402b22406f00681b486c5382de11db416b1eab46af5430651ffba1ebbc3117d6e625ce5	0fc9a097cacb61b3	2020-07-11 12:09:49.77515+10	56	2020-07-11 22:09:49.774823+10	b046dbe5
84ad90671ce439f34578d73b23291fabfc5da1855b9dfd6e8b3887749ea62db93d2e58c8dcfd1552dccf37076c9a09428a27974e523e1f9d561a0a946ed4711e	fed8571ee6e3e75b	2020-07-11 12:10:55.308834+10	56	2020-07-11 22:10:55.308376+10	d9a269a3
68630adb8187dea6eecccd5b68ffa601286a9c3ca0b012e8d00227967a9efde1fec7788476600864cf726ed1d4c062a02a6dee190441aa20f20ed778e08adc29	39e1a8df92b7b886	2020-07-11 12:12:12.573304+10	56	2020-07-11 22:12:12.572929+10	ac83bbd2
b92da472960328af188bca6a35996593d4dc4a969487710c3f74cfbe73915e1595c84c83b60e17a9185d74c8d87c515df6d40b6486859616cee3e70386711978	adcdf0d2b92703af	2020-07-11 12:12:33.858129+10	56	2020-07-11 22:12:33.857751+10	05015ee0
e236975f0ecf8cfdc1a8281a248e9cf1d515843bc664906d0a9d5e0775d59d1c61c164f6c15f258a5c32c405017cebb5bffc99d348014e3a54ec244d51acbdcf	146282f5c37f1b0d	2020-07-11 12:13:59.840004+10	56	2020-07-11 22:13:59.839419+10	3ba7a5ad
6db643bc29e09476e25205595f8a567e29979c80962530c62d9d439ae4c947acaa3872b3d0c38be926a732527d93ec0e7fc21bf71deb3809d3887c667711f8ea	e79bfab083311d4c	2020-07-11 12:31:42.015621+10	56	2020-07-11 22:31:42.015287+10	b8f20d48
c51caaceb286ced773fdec0406c9ba283bd3c326953bddaff059432dfbaa8bcf5003c7b45ee1fef28e8c960fb0c95ab08f3abb3d2e6804bf54fd34ec017eb269	c559f8804782120e	2020-07-11 12:36:13.928772+10	56	2020-07-11 22:36:13.928239+10	2420e664
b1c2206c8e304875090f0a0b9e30d6a91a5455ba86c6c5b06fb43ac85cc35efdfbc83927bbbe22b6f40dc70b284f5875a5ed2bc9354806136de5ec2561b86692	85057053b4dae434	2020-07-11 12:42:10.744029+10	56	2020-07-11 22:42:10.74367+10	0393cc30
1e8968f1c11f0e0305b220ad815abd2f1cfd4770672a42ff2e2a8799f37b89aeb2b918ff2c9325200b4ab7dc67c05bb5bdb2728238680dc658b282ad8eb10eb4	3266f16723f8a0d4	2020-07-11 12:47:27.166842+10	56	2020-07-11 22:47:27.166525+10	a5456308
6aac6b9c0102c9ca92f50dab937f32d955064ad84caff5872d1a0d0c10f4b0b2ebfac03ef4e3e22a771917130983e8ac3e401ef2a55fa2b3e38362c6de44d965	7923b623e8178951	2020-07-11 12:51:02.10308+10	56	2020-07-11 22:51:02.102764+10	d3d88e18
c889a297f66c544fe13159db16b3d0bb3ce84693c680d5f7f823b273cc7641fac76b6594116a8ab9f4bbf57331c276cf017c42352f074cb04bd35105185737f5	6d6c7d4428a59774	2020-07-11 12:56:33.164064+10	56	2020-07-11 22:56:33.163694+10	b5b18fe2
c82cfe7c072d9731ab2e747b6fcf96382be4bf87465fc51765e1915451495cc841ef983cbcd92f21786ac0e02f7a80b6781adc6c2d411d60ef0d5e8a888189d8	15e0dafa54e87f96	2020-07-11 13:08:29.915816+10	56	2020-07-11 23:08:29.915501+10	a79627b7
8dc4eceae4a35337b52bce94e8b1aa41136c53a1ef0c1a1238fecd7cd275aa7ca98710792d6040341555b85ed19bd9d6f9859acf415adf373d94bcf6615ee2ed	810aed955429f580	2020-07-11 13:08:44.745957+10	56	2020-07-11 23:08:44.745572+10	e330ad19
b9e3c2c57059c8afc9518f10f6dc908c8c0ee311056ceddf06445f36c21d896a7a8e51e298a867052da0b31af842497226a4d17efd2353f549e35eb478366c58	57e16270750c8837	2020-07-11 13:10:00.482536+10	56	2020-07-11 23:10:00.482224+10	1fdc806b
a9ff0b41f06b7e627dbed1c78c805c9b1ccf580fc0f198fa9de6825928734bfccac3c64435eeb0d6a45ecd3f09cc018389b7ae8ec201f9f7ec466df8b4f276a5	99c728bf2d8fa23e	2020-07-11 13:10:08.444911+10	56	2020-07-11 23:10:08.444579+10	c463568b
eddbd9dca3699054dadf68f78f10a00295650f5e9004eba51da1795232b0c7508eb7bda25e5571aaa9bf494a7daa70380456e8d7e7c876002c8ec24f8a8cd2d8	126da6b8f66fa30a	2020-07-11 13:31:48.06206+10	56	2020-07-11 23:31:48.061733+10	3655f018
951823a85540a44971ef28124f671b83f552c31e103529c9d7bea510ca1c5b258d4ffebdc6f4d342438ca7a7d9cc51c599f272df88799b77318ba51dccd00373	a1d93c974e52ee41	2020-07-11 13:35:49.271421+10	56	2020-07-11 23:35:49.27111+10	c1c0ef01
d0ad7c381fb0404404b733cdee4544d2df5c4b13e19ddf723ec323fb577c92d8f2508242d4ed97f62313ecdff20800a156b8838f52eb039ba16b48f1946e8130	a206bbf966531a1e	2020-07-11 13:37:53.834961+10	56	2020-07-11 23:37:53.834311+10	1e82362e
80e60f081a5479a26d26772c43496bb03b8172321b34bda8d337e168c2c02b84c52a72dd7aee77298c01cac69a533e4f276c00999b9d21e3e784834bcac89537	26965a97ed77040e	2020-07-11 13:43:16.124947+10	56	2020-07-11 23:43:16.12456+10	bfbb66c0
cd75d2dd766c896732222d2b2575f66a62ca4570bbac314d7eabbf399cc761bcfd0bedfb08e9971354e3b15f3b86a769fb241c5cf58839f640f18b70fdba0e26	ad590fd0af07534a	2020-07-11 13:49:39.370884+10	56	2020-07-11 23:49:39.370567+10	caa0ddf4
29075fb7993245a0ef27f2f9453ce7d3dd9873041e95eab25d7eea28f18a78d854425af3677506313f4fa04acabe4c2dfceac26ba41cb2eaac72b47d912167f7	15b78f3673aa93b9	2020-07-11 13:56:38.550192+10	56	2020-07-11 23:56:38.549871+10	62b588cc
dfaaec3453d24a52b49b90dc26f8bb65328ad006711c999a1ec5c3f2e788ca9d1ee5fcb932fdedb365a4e3946c0f551fa119ce4fa639ff8faa957a39268f060d	627eb5a00b67a7b7	2020-07-11 15:24:50.342679+10	56	2020-07-12 01:24:50.342362+10	733d3e7b
c18fbcdf8e18478060a50d830d70e46b56c2bb9c2263ebfa565e8f254e3c42785a6d9ecb9dab398fc6f5eae0bd0b87b15991559a60583cac9cd3b77ea804a69f	d63fe288c4d13904	2020-07-11 15:35:40.610359+10	56	2020-07-12 01:35:40.609994+10	63709c84
b43c9bf7cdebd07e99e8222d71e5829a8a03141e78fa8c5990330bdc2bd00134556f7e1ae3a16af7678522b12264f8d73848002756587aeeee3af95bcfa13a60	dc5380692ab93645	2020-07-11 15:40:31.086788+10	56	2020-07-12 01:40:31.086451+10	2eed8444
fcbef2ceefdfbd19cc38c0ebbf60ca3143adb10e0e1fec15121aeb1e0f3581f09e8ace696815df2476dec5ab062391962eff0ce0bb88d7d276ca101d2b165ae2	6b39c03348bcd769	2020-07-11 15:44:46.169544+10	56	2020-07-12 01:44:46.169222+10	5f4100cf
030f35e01334e6d9a9f823f0c35ec259398b7c5504f228868ef5383e903165c473956b9f182888bb4355def1fac3c27abf6c4163e6fb022f9f50faee13397735	8a64e7127488f8dd	2020-07-11 15:45:40.187814+10	56	2020-07-12 01:45:40.187421+10	35a3c3de
ef80c3e2b68be557a72e6e42bb1f4f7756667c2bcb7ef07a04df42da207976aa8891f46a465752f8b74322f7ca8b8615e3865a95d47507a18a83d505e48eb65c	4f27d69dfd85ae8b	2020-07-11 15:45:51.749165+10	56	2020-07-12 01:45:51.748676+10	cff36620
b574cea85844634c1acde3623186997a87a5579fb3154e77016c0149a3204420e0cad71bafccc5bce105ade42b9cee8ec657755bb793ff11fae58ecb44631b09	359689bea9a3baa2	2020-07-11 15:46:38.892927+10	56	2020-07-12 01:46:38.892588+10	91da598e
b17204a0717929a46f76a3217cb794e78da8596b45353e6c785ac57a07b350c5f19eafc41684a017040be8ce86a25d98de0d9fefdb3e871e71d35e01f0a69588	0aeb1a91ee1ecdef	2020-07-11 15:54:10.583896+10	56	2020-07-12 01:54:10.583445+10	7a583341
9e264a90e186080388b931d53f6778bc12083eec743900f4a33aba76de3a5155c33cc06cd0d473ff70940aed778330a8de60f1bcf5bef543485e197a8696f1a9	51153b1f0409d7c4	2020-07-11 15:54:32.271296+10	56	2020-07-12 01:54:32.270992+10	b839b720
7f7562dcb21b03ef6766cfdd958f319f45cda942b5db4e2e689c20ada95e57b82726bfa6565bc5004641f8a6e522bee46d033e634a9867b1fc3673c6ca15f304	1fc590424b72836f	2020-07-12 00:06:47.353694+10	56	2020-07-12 10:06:47.352988+10	c39b9368
a20c47ebf77aeeb3dfae3978a27f3ca3d107d0d41f8139be182028135311eee72c835a50bd557f3618ab1b21da9de55ae1044122f882fcd850ba2ad74185251b	cc8b8c6843ac3445	2020-07-12 00:07:01.524449+10	56	2020-07-12 10:07:01.523962+10	13b1188d
09298b0d31b2f6d089fd5aad42e862113308f6bc1eebd1244f144f62f58372f5ee6acb0c46ee0014d0c700225f2688358070e66ea1b923faaddc401e9a75e8bb	a61997d4a197f8ea	2020-07-12 00:07:26.199323+10	56	2020-07-12 10:07:26.198871+10	952993ab
de134f33ec9aeb01a943ef1c3a72166b8c11e75674b234d22ff79c4b3877da9de2cd08e1498e07ce3d137b6fc3f04e7ff816a596b88628b1b8e0e30aa22fa231	2ab6f2871985ca58	2020-07-12 00:20:11.838497+10	56	2020-07-12 10:20:11.838184+10	25970fec
5492752d5838aa1fbf6fee0f9b6d05eab7a593b58a1d7b97bb4c36ad3b45248b8489d5b5001c11cc69b0aad9341084bfbc85e092b1fde49df741b281ad15d63f	bf8dbbec48aa3210	2020-07-12 00:21:06.491754+10	56	2020-07-12 10:21:06.491403+10	68f97196
edc96ca784eb6bae9b14f7733b3a713fd353a0f81230dbb8adf4f5330c6eda9de68fb9772ab24b9ce36b8d893a55551d8e3e856bde1a860caa4232fa952be4f6	7b4313f974e0720b	2020-07-12 00:21:17.377494+10	56	2020-07-12 10:21:17.377151+10	c92402e6
b11d9293bae5d7211f61b6cc0850eaf7c85feb129687a533c4e4e9f9b98079d7c81d3a3c43140bc571adf967f2fe980cecf943804d562dc2ed6428305a87a6f6	930ea02b19fe4d01	2020-07-12 00:22:30.193032+10	56	2020-07-12 10:22:30.192714+10	64d03ef5
e812b465a1a4494a71fb82dca2f98da8eafce780535524f8ac0e58bcfdc1ae39f43d765a765de4a1c1bbb70b9a5e7e98db13e4e2582b30818c2f8c1171fa0ac3	1ace90ed7b1e7080	2020-07-12 00:26:31.046426+10	56	2020-07-12 10:26:31.046033+10	3a6172de
be59846e6049394e0f53c9d772bc1482a4ef6741eb37e0331375ea3dbbdb93383d1f1190f6a6d1db340f351d256f1390060060e64bd390314d9d8978d0d6b5a8	8ff52def08f6fbf1	2020-07-12 00:27:33.87365+10	56	2020-07-12 10:27:33.873183+10	076607ff
5f5cb0dc1845e705411d6ccaecc6cc20815bd52cf950091a412b719fbdb4e20d89bcdd970ee978920b5b52700d9e53ed88df308a62fe4a6cbd216531fad17eb4	efd191d42359429a	2020-07-12 00:29:56.81126+10	56	2020-07-12 10:29:56.810908+10	fda41d4b
9026f0e7cc8dba9e41b74860eba948f842d3fa6532d4e591311edf1f1032fd010058560efeabff278ee51b0b0098470049ef8b4dbfc75384ba76df530a804254	dbf37ffa17449f08	2020-07-12 00:31:43.31812+10	56	2020-07-12 10:31:43.317809+10	0771ecf0
5c112c39ea43ecd2584414e34a85a8d34849f5f98a5bf756b155e91bc396b1624fd8ba07403991ffeeea20f300bdc4eaeb557da470e8cb950ba86e69f01199dd	fcabbddec2e7661c	2020-07-12 00:33:32.513856+10	56	2020-07-12 10:33:32.513371+10	19853d0c
0bd9c58b541e9395740ebe6d65e75e2412eb1e94ab1cf3e7385bffef64a78b7bfb914db20a299924d1e0bbc42cfc30dae41e9a1c648fdeb4aca8ce126dabdb9b	f6bd0b272bd3419c	2020-07-12 00:36:27.777038+10	56	2020-07-12 10:36:27.776724+10	31ad7a3f
1724c7f8d287c64dcd1b5494a1f6b1a4522d1175f25c8a1ca8907028034b0a0f16d6f15d9586faa26f927fb0d840a8f2cc03d671b88264f63ee9c1f09e4010a7	437bd883ea54ff39	2020-07-12 00:41:36.894174+10	56	2020-07-12 10:41:36.893784+10	1301a88b
ba1ebd48ebbde91cfea0c7658cc6f4b4e3f5e93107066af14678dd037ec15c6d7c97f4e4ffb4a9538358a34c57023f04153a78c4f118e89e103f670aeaa9c7f7	6982ec14db23fa00	2020-07-12 00:46:48.690816+10	56	2020-07-12 10:46:48.690488+10	86c95f4c
46af097458a422586b4b5cc24cd5d9747684958dd67468e886ba33be3be2c2b5724c4cbd03ed42726f9756a906115b7213b5f13f9208b217fbe6d3dd79eb4d03	23134058436f24b8	2020-07-12 00:57:51.479274+10	56	2020-07-12 10:57:51.478932+10	5480afe8
46392ef19e8ffc1ba7057b23cd4e2855c10e335611a06c4203282f79489a7b7198a47e2c55449b3455c3de07c0a38993becd51fd7d86d10626870e59b6c3c6dd	4fdbb1f97e1e734d	2020-07-12 01:02:52.944603+10	56	2020-07-12 11:02:52.944274+10	87b5faec
289a25599b65cf17a653c77d51e393dd820fbd39a9bfaa904133d889374a77e49dd32533811fdbebeba71d12238f9f017c8f18df1c57973d64b829767a712f2b	1243080c772e1bfc	2020-07-12 01:05:07.816567+10	56	2020-07-12 11:05:07.816163+10	0a2bf7f2
83a0570cc4b05b4c8c3bff342471aca0dce3ed1f7ff1a7c2f7b6b7d7918782c20429cc8b06dc80280f1b930d5a1ce943d0587d24cd374ce517fd711bed7b2a30	2049e06276608729	2020-07-12 01:11:08.382919+10	56	2020-07-12 11:11:08.382602+10	9902b3f2
e59924e6098b7c7d794b68be2e9251faca5ab3180d37357fc6cca93fccf20da8d30d292d0b6f5f07599dcfe6aaeeaaefad7553f355ffe6c00fd7a1d1624a75ab	a4639347e8b813d2	2020-07-12 01:11:49.283195+10	56	2020-07-12 11:11:49.282885+10	bfeca606
96c7960157913d73c0d8bf79299ce2ecb8aaaec37909320663dc3bd912b0761ed884916560fb1a7f771e9af65cab1a16a17f6ed6f2507e30e013df940252f45f	75430bb6cdfbf192	2020-07-12 01:13:19.444855+10	56	2020-07-12 11:13:19.444546+10	72841109
25ff07eb0af99fb9fd96df842e429824736031031e93cd7fbd5c8cf3b055b44a7b8bec3fd455dfa8a34b5f44c5d2233ddf2a30e6da32de0bab6fb37bbc80ca5a	332db93c091550ac	2020-07-12 01:23:49.450194+10	56	2020-07-12 11:23:49.449855+10	5d878a8d
0389a4817609da80a50083bc76eca40f2e60393195c07dcc1b53f9e7cc51b7387ed4fdc78b73a6f08ad5b6ed209f9095a827329dae4ede0065df64047fb48e20	7bdb9b4a38b172be	2020-07-12 01:24:00.490611+10	56	2020-07-12 11:24:00.490212+10	7c3de242
c7b10a823c1cfb35d5ea162d4d221f2c0a17b32c9e886aa89b2df96ee27a65c2e40340704ddfaedff560457220c0bd8b71765577d9c542af19f2195d06872442	14ab485b7d58d2dc	2020-07-12 01:26:22.703744+10	56	2020-07-12 11:26:22.70333+10	868ddcc9
60f29d058730b2f0a42e7155dd1484f8b2d6dca90e3f7c8ccdfdd831e9248a848ca044fbbe94ce6111da54fa68c476ecc7bf2009bffb52bccaf190648d17eb03	cb601dc982b811c2	2020-07-12 01:47:53.33993+10	56	2020-07-12 11:47:53.339606+10	3d177719
cda217b0af86d895cde6620c99069dd0313e19e0255b8249eab295cfe67362b3a2289ba4e008ecfb4ef8e5d5ad0f2df0858554ebe8da49db7bfeb486e1348aeb	49995a84fead199b	2020-07-12 01:52:25.836136+10	56	2020-07-12 11:52:25.835744+10	fe7c4c1f
49861ad2b038c6a4fe8ec8ad2d04599658015c8d10fbd3ecb126548de8b41ba9a31435d48848f46c3bc0bfeeb80fe6af59569da00f03d86f8d36b6817f78fb19	c0ae7056c9ea2dc6	2020-07-12 02:04:22.241716+10	56	2020-07-12 12:04:22.241313+10	e2e3866f
9036bafc8e9b3b51c172c3543479c319362e70eaaf2b505560cf48114fd7ff669ca0bf61efa504fa3f582b6ec8e40711509a29a75c51710b4b8f4c79571b8688	ac7bd1bb6a2a2ea0	2020-07-12 02:06:22.272733+10	56	2020-07-12 12:06:22.272402+10	13cf0e80
27e3ec6ee3dfd74cb35d2b00007abd057d10c98065a0883a4e43a39459875ce9693ebfdc11ae8d6138ecfcc8010ab4b4dc6a70f1e058aa67f34598fa4cd220aa	46adb0832bbeabd2	2020-07-12 02:12:14.844957+10	56	2020-07-12 12:12:14.844633+10	974747df
19084cce8e6a6790eb78d290bef58d9520735b12f9b4e10840df5eb8d487d915e03008f60ccb03c5348bab1a16293bce7e4ff0f552d56da966d0fe87a35bed78	e413d09f1a131a9d	2020-07-12 07:57:42.531551+10	56	2020-07-12 17:57:42.531246+10	371c6da7
fe155f5b10c56574f8b34bd6bf41e6453949e715ecbe113ce7c9c35ff9fbec0b5076a1bc4a3b86a901f26a7af54b7e0bfbe042c5fafc1dbd4045c381e00e67f5	e8c97eb1168ff40f	2020-07-12 08:02:13.636814+10	56	2020-07-12 18:02:13.63643+10	33b4e0ee
7e56a3df8a9a75f8954ed6ae1f5c1ded1aa0c9543f4b00e77c182a7955fa881d1a1b9853fdfbb55a25dec9168712befa1322eaaa144ecd76b9540d7d44031006	c5da5d68859d624f	2020-07-12 08:05:12.795587+10	56	2020-07-12 18:05:12.795274+10	e3e1ecb7
de589affb266ae7173b90ee475bb1dbe28fb0917b500016a7aee0bcc6b69af70ddeba5645fadb7b211b06022a7e1152b28c5c0f1b83e357d06c3483be7113290	92b7380a08058aca	2020-07-12 08:06:47.905735+10	56	2020-07-12 18:06:47.905382+10	66e2b13b
66d8d57ea300ccf32fe3fdc93e8506e929a795b2fec2ee6638b0050ef054ff8784d67dfd91b5cf3555b6b3142a1cfbd9b194fcb1cdc8548b55c8f1992b0070a0	d39ed6e8c587580e	2020-07-12 08:13:30.459951+10	56	2020-07-12 18:13:30.459595+10	f3f31bc7
76585434295d79218927522e8627b43939b0989d21a10a8cbd575ae0d3261c47d35c75d6d87c7c1c3ef06f60e29ccb80d0e3c2090ee7ac7a85b5ce0b438168f0	b445e0a3e6802a0d	2020-07-12 08:13:46.272768+10	56	2020-07-12 18:13:46.272432+10	cd63f879
8f1af71496ad0858049aaa6bac8c748d9bd7de4427bfd512571428781be03997dc893b47082cceec053102d46b41784402b76dbe845e49c6f5ec3697839c28ad	62dbaf2988177bf3	2020-07-12 08:30:55.341648+10	56	2020-07-12 18:30:55.341343+10	4698d254
060b48be66c8dff9d805d0bccd2123ab7b3c10eb535a4cadfd18de5c76f6f6ffdb6f89c678f92ba25339fd9af6cb57200f84c6c670bfb48ffe8e9649d2fbfcba	526fb8fc6aa1c8c2	2020-07-12 08:31:15.152542+10	56	2020-07-12 18:31:15.152183+10	99caab13
73e6abef51c2dc5b258c023df418b92ed1789e837ab25eadda60c5e9c8d0cea6ea8c5eebbefa88a609e7f3ef02c50a1b586daa2da12d4d4c87d46180bf4095f8	d546475d668fec78	2020-07-12 08:43:50.285047+10	56	2020-07-12 18:43:50.284676+10	5e186649
3ebb287e7d66a18b2706d6f908bb474959d1d18838fa3401408b0c5310432d0e2ac379aba818708dc50d1da065d108761d0f59bb30b7ebb3feb04d207d8cc23b	f94a21b34d7ddf79	2020-07-12 08:48:19.27234+10	56	2020-07-12 18:48:19.271968+10	fa970ab4
049abe7010fc564f81411d2fe53302adf55776a5cfe3518f60744c60a9f1d109d51b5dc6e862b774c8bc3e7ac5a7cb31de18d6639cfdc26a9a5325917e79c9ea	d09915bb04b1ade9	2020-07-12 08:52:10.098512+10	56	2020-07-12 18:52:10.098198+10	31c4da3f
10a532516594ebc13935ef864cecbab48a110c157e167efa21a47ba9d36839c2caf73fcae66a9a0681785f015ac8cd6d83dbb6cd7c27df154425603750e7518c	37020df0da404f0e	2020-07-12 08:57:59.981389+10	56	2020-07-12 18:57:59.981068+10	351bf9ce
731f35f5dc5ecd0aeaed7840ad1c035893eb2827ec14007886258e5d1f8a123315ac2aca08360cffd17d11eddbbc9fbe6abcb4d8a249b93e24fa545a79ee2575	2581f038ef0348ef	2020-07-12 09:04:46.669814+10	56	2020-07-12 19:04:46.669457+10	32c34666
5b9bd12a3de3451035228fd76b6a4f30a09f4343126825fec25252a35414936f9b8257534813836345840d1b030da20142d813e372c7581883eb1aba52d46720	f3f5e425a101e169	2020-07-12 09:26:51.877759+10	56	2020-07-12 19:26:51.877436+10	ad243ccf
5f3a43e0985a31a228ce0a7843ccec52e361bf355e9fd7fc993db57611fe9f35d098c0935d0edd6a3d75ba07c72a4719d9d9f69a5d6618a1bae49430c07cba72	1c666849802aab1d	2020-07-12 09:35:41.828291+10	56	2020-07-12 19:35:41.827903+10	aaa243cd
d4b0ee7c01cc76c6393fc7944348ddc62f04564933adfd61eed18e9eef5fa8c57d781979827dd9def473df0dc202647a5060ef43233066884709fc4ece1b5482	51360efd6ca35048	2020-07-12 09:41:22.229474+10	56	2020-07-12 19:41:22.229159+10	db1da917
fcede288ac7bd70a3d28e88f1f8c0623b93fe1ba80c66a951937c541e0c03449b51049c7676e3b31558bf0755ccda6b4a09ff3d97cbb01c01c81ae7d41252f24	5d68bf14e4407d87	2020-07-12 09:42:29.109217+10	56	2020-07-12 19:42:29.108902+10	85055bd1
f364707d2675bfff210f54d3c22fec812bcd0b37e2b0f233e619b09a615c6730065ad1a388db60e1795b504a5092941ed43f5017918ef17555648be7e3045800	0c2848feb8d773ef	2020-07-12 09:45:00.257701+10	56	2020-07-12 19:45:00.257383+10	67c51b81
499a722ccd834688c93b836ac1f064271e5594524fe09816da1c7e68190e5302a008aa917aadbb6ad811711766e9b96508fd633244d21b642dd6bbbfc35e6288	2e8d448bfab72b53	2020-07-12 09:48:46.145499+10	56	2020-07-12 19:48:46.145184+10	396d6220
ea0524958a422463f9956cf9372fb8856f0d21fdba9c5cf6ab150874329c0613bfd2b11914da9690f22e0ac65173694726e32770ed4d60baabdc126f61bf32d9	6a500e858fdd0853	2020-07-12 10:01:04.386341+10	56	2020-07-12 20:01:04.385808+10	a2d46654
8eb0a2a2efa457b494497401cfe7342b6519c26a76b88e84ce7d3b12e17f6dcf6e57d60ca534936dc38d397455230691570c606ba6f2322c5cf7a6be33dfa02b	dd0b9c4fe6f9352e	2020-07-12 10:05:26.972433+10	56	2020-07-12 20:05:26.972108+10	ba6974d4
f8435cf2a8062864c0051c71b47d9d704222e4e8b23a5626b0315f86af79bcac780e17d3d2c57f8fad84c33fe4e623a401a3a381c13c22d1d304d67ce54f617c	293e000472c74012	2020-07-12 10:15:24.141486+10	56	2020-07-12 20:15:24.141117+10	95846a49
fd3e52726975b20bd3bcedad937b41e0a07070739f3c2369ea9ccbb707419d93295847ee213b9674ab22553ab622bca91a713a5f86a22fdacb46e37e9f2a6387	0f82007b20a0aa37	2020-07-12 10:30:18.502959+10	56	2020-07-12 20:30:18.502436+10	fb2fad14
81e7ed5bf83ee5796d00a2f9dd87cd6fc5617e7d0e6f52754bb2df9d5be349b9ee655348681eabb27ac95889d1c2e4f6a29f9049498af0e0865a0a0a7e52c2d1	e5c69b083f11b764	2020-07-12 10:35:54.639266+10	56	2020-07-12 20:35:54.638889+10	5aad8705
94c0bfb33eb29b99bbd9fd79f4581739f262249d11cbecc497221367753b59ac7dd94f05aa3da1c85719e9805e583baa581d1a149728530801dbc53797de801c	c1f1431836f97ccc	2020-07-12 10:44:29.885495+10	56	2020-07-12 20:44:29.88517+10	f5383a9a
fc884f9235dcc4fb754d3222fd8d17cba0889bad98ce11e529da8876db986ee811b45cd091560871d5e5c18872e5710b5b90ca12a01317adc1654fa833ea05e9	0ef495f6a37ae7d9	2020-07-12 10:53:51.159058+10	56	2020-07-12 20:53:51.158694+10	6172401e
4ac6ad7235d747093e33ecf64c407784d40d2ec49b2bf20eb4ed776d2c5dfb38ede6184927e25b80b35247763067926715278e5a778a5aaa24a413e19ca676a9	e49a39508a5eec3e	2020-07-12 10:58:13.54257+10	56	2020-07-12 20:58:13.542223+10	75131909
ec08b7c8a6a7b79420aa7d7b5daa18c81f9affc43a9b9596591e2ce71322b057ead50acbd224458114b6859b88e47d4f868cf426133f83ab71ad72a951011b24	de5ee1c3f79f6d7b	2020-07-12 11:02:11.431437+10	56	2020-07-12 21:02:11.431111+10	964a7919
563eedf2945b426f5954175bd47c846d563b1b28dcb80c34760f9075a5f61945599f4bce40b99862ad50db7d4e0245242ac92d44172e13c2e358f97d4d549638	427e13e2bb7ff2f2	2020-07-12 11:03:53.793021+10	56	2020-07-12 21:03:53.792638+10	ba3c00e9
229205b1b21359088803a2a408ec1ae2137979450f97ba4c3dfc127c578831f3278618f3225bea24eeb1a52a2c5a4d4a1f35b1c551a25806f4c4d06cc9be9aa3	e0143143ce99be33	2020-07-12 11:05:37.302483+10	56	2020-07-12 21:05:37.302166+10	b60e74b5
9bf36b9a74a1639e04c5312e022b6b170552dbca90447eb3e1fcd103070cf6f72269f6a8802844dae42ca2d8a03b2b064663a9d166b20354c99bf33ab89f25f4	8d8f95004e26ef7f	2020-07-12 11:07:40.438298+10	56	2020-07-12 21:07:40.437968+10	b152d13b
ead830c68844769f4b00759c28245564cd1f87852b1f624913ed525efd9b147bee3680a14425dd0c1449e7266414c9514044881b018b5eb13603e51e3d3b9090	4614e46309b58d22	2020-07-12 11:13:14.140654+10	56	2020-07-12 21:13:14.140337+10	f9deefa2
9a002baff853321dbda8f8b722e48bb33c35bf3f108eba0ab531e04ca5729eaaa96023b0eb57e092991ae256d720a35b8ded3db2f0c9b2daac2b589fc0be60be	f94d83383af84ac7	2020-07-12 11:20:27.210392+10	56	2020-07-12 21:20:27.210071+10	f20b4690
2e311911f0ad4116df11dffab87b62a478b60b27721277b6064af5c8a7258f4f59c8a836939555ac122226f6b99e202a398e0e4b3a3a79c2555ca50379671f9f	686ac01a4b5facab	2020-07-12 11:24:18.665328+10	56	2020-07-12 21:24:18.664976+10	02cd5db7
b5718001d07fe2c8671df507ba9dd725022e7f25b5c037f5533ccdd9f82719c230993e5dd2b40a01bfbd10f30dedef99be40401f643a8b0b310eebcec5569fd5	25da492ac015bcf6	2020-07-12 11:29:43.570566+10	56	2020-07-12 21:29:43.570165+10	6dcca4f6
0c04bed17beffb1a2a464efa9d7881df22980c0f6b76662702c76c88d704d67a541f2d15b7c9852979d194588cb76949ce0fe910e2e96c2de7bfe1736d97a162	8275cb03f19d642d	2020-07-12 11:42:56.355708+10	56	2020-07-12 21:42:56.355372+10	b8cfb440
d66ad3da02089097e8e03eebe33bc446666047207b8e8933e9e0f06713d851a6cf351251da10e04aa9282e368bbd27a58d60af8ed3ee08fe4c57ee6efa361b9f	74388b3b028fe0be	2020-07-12 12:14:42.363291+10	56	2020-07-12 22:14:42.362959+10	e47eb049
de128a64a4245caa4c51836ba3509d1d13acdcb4ab98303b5577904ace9b6410a6db792ba15e3e5aff43a49857c71950040574bf473d224f9c3cd46a273b8a8e	c25c65fe8bcb3713	2020-07-12 12:14:56.56163+10	56	2020-07-12 22:14:56.56128+10	fd8f6956
f1e5975a44d53d39724cfa7bedf151cd10f062c84b2c2c4a432fc6794ed480c688f0b347dfaba4d11e665c72dbdcb2404de00a360059ad6090cf8d31f5badbbf	513a3ec1991287b7	2020-07-12 14:44:54.511372+10	56	2020-07-13 00:44:54.510809+10	20b0eacc
75aac5bdc91420fb549cfc43f525058f1392c0a2799bbdcaff9693a0923159ebb3d54782f6576b4dc798b243bc4d69cb82b2ba6a7566de76a7e950904ed7beeb	04ebf92060f67a2c	2020-07-12 14:51:19.686668+10	56	2020-07-13 00:51:19.686051+10	1986e32a
323be2c31c41af3865be9bbfad0f36e8ccc11ab2804f390ff4942edd7b4c1ad9e4fd57edcbeda858e00cd7172ae93220b8c9080b14849dc6ea5e55f004b9f452	82686dc8320b936d	2020-07-12 14:52:02.50591+10	56	2020-07-13 00:52:02.505592+10	a3a17967
5ee6f0e0874c499e1d9a869e21c7fe7bbcfc33d8c236b36ebb520e2de2235f6c049819f8cf098e3e90f30013e254cca32c3b7651082dcca6ddbd37300a6bd746	3b0405e886e783e8	2020-07-12 14:57:12.081081+10	56	2020-07-13 00:57:12.080752+10	d1e81dc2
dc274e0cb16889d2b31f0d2b8eef8c269fa47bc6692cabbd1fc3291327683d73224d762c52e5de8cfb0d5d59ebbb8cd4368a218b2ff7e9e0481b868101fb51aa	44399eaa67dac873	2020-07-12 15:03:03.540941+10	56	2020-07-13 01:03:03.540581+10	2f776877
a80cd25090d547654db97b8ff81dcf8c30d4afaa239bbdd524d194893b973ec094e16d2260be80d6762acf37d221f8e76c91e27afb5cef8398031b1e6f6424e3	6c6a93e554f1c496	2020-07-12 15:09:01.152128+10	56	2020-07-13 01:09:01.151756+10	2968b48a
d338c4c7f942a6a746ddf98a3acd884d8de71d2ba6e22b2e158662f21bfc2193e97155451a109c8721f227e0fda88b00a06147b1c9d830399d56440b9347df7b	32de231828d0b3ea	2020-07-12 15:12:42.646976+10	56	2020-07-13 01:12:42.646656+10	87ed56c2
2abfcdd85ad361eb82339eedbaf231e229c97ea441b140687fb4c0f8ce024195f5b269af24a35a6544835e7902095749471e4c5967234f4359729658f27ff1b9	18791b8b090d7a7d	2020-07-12 15:18:18.012575+10	56	2020-07-13 01:18:18.012212+10	f04ecd83
1ba1655d9b8c3ba72d0307a46be4a10ea2c248296c384b207e08ef3924a07a3c5f970bccb5f9ddb8c08611b4244ea562d1cfcfef7f1438c63a2216b1c572e7d8	8c76feadca85750f	2020-07-12 15:19:37.74885+10	56	2020-07-13 01:19:37.748482+10	23c80864
e687f0f9980335abadfa4a572a7658b1a5708334fc2f1a8a4b621c8d6eeacaf30d05974e40628317b9f47027df3ce304ee21dd752c19dadd1081c280a6ce9bd6	29c720a5b6b8c23e	2020-07-12 15:44:01.092421+10	56	2020-07-13 01:44:01.092053+10	96123dbb
34d4d9541b3b376289a72cfd123c5c303076c9f3c5de45967e65f3d49c76453da3fa44aff81d0d6bbe16f7ff9e9ae6362142e916bda46775ce90ed1655d470ea	8d299ff5ce5df6b8	2020-07-12 15:44:30.828787+10	56	2020-07-13 01:44:30.828382+10	60bcd68e
a3fddb23dcc8106d36ecd09b76926128be241721e812fe78e329cec23a04088f064cb98228022c1dd7b1f2196566b0ccc7e6d12aea20d5f367d16550f2b97b4d	f893e03dfc680194	2020-07-12 15:47:25.715697+10	56	2020-07-13 01:47:25.715386+10	55f0d8bc
ebe8a2a48565e0ae9b36356ee249f8c0d9d29761892bce97576a30d973b74d698474bd64821a8da94b1d424201ce2caf08ec39ae4fca5a1afc2c6789ff69bb3c	b8b265dc27c8a41f	2020-07-12 15:49:05.707826+10	56	2020-07-13 01:49:05.7075+10	1e521609
c83aedaeb4b2f7545cc93f6eb0c005388510cee303a7f69acc9985c33bfb2be5c5d4753841425ca26e8e0fa75fdbab5bafcc9dae244b3bf9c9549746439e68bd	76dcef302c3a6146	2020-07-12 15:49:49.015758+10	56	2020-07-13 01:49:49.015244+10	4a18c6f4
8deff3ff4c8ab1a77d565915cddfb6a97f46b6ec4495b6c82d84dbf979f9ebd05c4ea85740d05219f0125f6cadd4a06c697e80a46c1b76694eb3bf51d811b1f3	a0304b878fafe308	2020-07-12 15:50:33.291939+10	56	2020-07-13 01:50:33.291528+10	4c8e91df
5aff2a76f347d6077133a66bb7ef6510dfa1bcc5b6f53b5e8cb6263e05bf9c0a6bb4dae975004a465e435b39277ef07c383d38fff48d12afbe29d7ca6f27d5db	33a6fa4bc5e57342	2020-07-12 15:51:44.604542+10	56	2020-07-13 01:51:44.604179+10	03a59246
8c4e939e89ca2e85a36a5c9013034cdc17759c8bd4b350f73b7bb3805f2331fb60b72833ba6f8bec7b60daa6b5641fe2ec285b85d51ed95bfd9f096ab7a1d11f	56255c753ad9a682	2020-07-12 15:52:41.24508+10	56	2020-07-13 01:52:41.244772+10	e85e96a5
9a3e96bccbee051e54bac8add3efcddf11188186d40e1bea5c0f5f95216cccaf56b9d528f890131e15b1df332093dc861f1d1301d46cf5d2f9427cf1d80e32b5	cd743c5f8dcc7be7	2020-07-12 15:56:21.593617+10	56	2020-07-13 01:56:21.593276+10	c4a5b26b
0f9184e63d08b1d0283536623798eaea613daf8b50cfa169c7d25e773365ea6b3d473115971ea5191244c31cd6309a76af6523a47908839edbbe0a55240c7ddf	b4a639e027fecd1c	2020-07-12 16:11:31.935074+10	56	2020-07-13 02:11:31.934726+10	5fe71144
40e26df896e3633d8ce7e640437d86f4ee4b54fc394ae41648ea8f6612888f1c8af052725354accf10fa0f7caebd0bbea9097d764d5874d6bfe77b2f2eb11f8d	8501dd65b78fff6f	2020-07-12 16:21:46.446972+10	56	2020-07-13 02:21:46.446597+10	1b92034a
5d1da9b69a882bca13f8be1f55715378d27d2df8a2d75c201f716ef403c1df8c1e3567f7f4345e381e9d47ccb4f1ccefcbe03120a284eebb0a761e102ea84b44	25bd65250c99b96f	2020-07-12 16:27:19.533471+10	56	2020-07-13 02:27:19.533144+10	e08329e8
7359dcbe70a27200b128c17d0befaea2f1e84733fe9640bac61bd21acb8f5fdf64e253079271ded1ceb4f2e323fc0be6c22c9c48cbd2c3b94195b7d5012f9950	362755b269327549	2020-07-12 16:33:59.922568+10	56	2020-07-13 02:33:59.922204+10	070db692
207cc7caed8b9200f50259f22be452dd8ba8acc2ee925c0468b0d52576d70f5367d17044c38c3939cf50359cf2787983d35a0db9e729ca1f4b64152a047e0a48	2965c4bec8f3668f	2020-07-12 16:34:21.36395+10	56	2020-07-13 02:34:21.363616+10	83bf54f0
088c7e8c573ce5fa143a5ae29fb0a6e35d04afa7667e9dee2a92c98d1277c2001b2d431c718bd1c695069eedfd0f306d0551587d8c471be05012b857b895126b	96904e8c960925f0	2020-07-12 16:39:46.08404+10	56	2020-07-13 02:39:46.083714+10	8aa38a97
512c92e12abf6bbfbfbf1cf281d9662732e01d6c6fadfe9393e48f5015afefecb32b9ceabb720d1a29d47c71423c2245d86e02660f6db200afaa5eaf86f77f8d	df8265e77aeb9abd	2020-07-12 16:57:33.521618+10	56	2020-07-13 02:57:33.521312+10	d5a1102d
45b68d2793f2eaf8fd3e99709eaacaf488e0c0d316895f3e984a3521c7296edee9e258e272cff36becf3b3c0390712be9f5f10f6428223009586180e9304c526	736deb43965c01ab	2020-07-12 16:58:14.130826+10	56	2020-07-13 02:58:14.130461+10	3a4ce38c
4ffa2ffa9f850c5c9be669795a9745a7931d85d2045dbd939c2e2bd1ee0edfb65abddd242b3f4c11c281b848a029a63ed86208308e32c28ad180f04937fca517	73be5db78d0b5f7c	2020-07-12 17:02:10.915349+10	56	2020-07-13 03:02:10.914954+10	c0c3152d
bd1aeb585482878d23ff147893ac58a30b00473e2b5419a28856ba3b8f7a1fbc5181915681d5f6725da4e4b7152cb32dcc89ff74112ec8faff40ae04b979778d	5a6f84b889f40aaa	2020-07-12 17:06:35.73894+10	56	2020-07-13 03:06:35.738464+10	2ea3e5ad
e51d3161d86a06c35b996d909fa71c4a755ba6a15e4056227be8e870d01cf0a0cd9b12708402b4098556f2d1f4c45227ee24079ae1aab1fa1081dd42d1458dc0	a865bc520457cc4c	2020-07-12 17:12:39.471545+10	56	2020-07-13 03:12:39.471222+10	71585e9e
7db0edda633d71ebd8ddaaddf4845148bcfdaac7010d026ddd1e66605b1804e9a63750342009df0dc6060001b25ae67d79e944fff1b7589902840abfb578a901	c95b86a3f4be50ae	2020-07-12 17:14:43.840372+10	56	2020-07-13 03:14:43.839985+10	27dae3e2
d227d5d935d3f7f892b19e646aca23434dce652879c1a30630306d11aee51bf279fd84103628814197f5921dc5866b68de4a3175157986449474b51e0668fcf1	5e48bf5055cd291b	2020-07-12 17:22:05.619683+10	56	2020-07-13 03:22:05.61936+10	2aea9c9c
0fbdfc997fdf155bea2369416dbcbcb6cd5d39d1a93f9d408c19861d9e7eba894a3ec9739d8289c5017897e7f1bea01a5391d7ccae0c626e18474a3764a714df	f13a6608385615a9	2020-07-12 17:24:57.819256+10	56	2020-07-13 03:24:57.818933+10	e5fc341a
362655e2a5bbbe847f6a459b46d6ca93da6e64b38fd5d2125fbdc4fef3d885262cf2735e77114761acf06cf8f83e0179935aa8dd660093fa155839656fb6e3d8	a3673c575be23341	2020-07-12 17:33:17.275743+10	56	2020-07-13 03:33:17.275424+10	ea9f2283
7de12807872923a01cbb15dfabd5d96d3ae08b99320456abaabbbb62ac050eaed46be4e8b19cce4d7d450d2c875bff51aa9aad5189a6d5b7d6b1c272d02d9ee3	ec9e80b3832e8103	2020-07-12 17:43:13.041425+10	56	2020-07-13 03:43:13.041098+10	77cb7080
59ff98cb6e59b2d8ab7f41728d1b60f25fc3f76547642363857625f46668d5d05e64e5278ecd1e80c6fae7a305126af25b50d09096779e11471069a36e79a5f2	037ee01432a45cd6	2020-07-12 17:46:20.526124+10	56	2020-07-13 03:46:20.525694+10	2cb895de
2f98cdc746bfdee608e28c83c3ecee400de45cdd3981ddcbf3ce0dde356efadeb39de2156681e069a1b07806fa798d018c40485a6804567cdee32c0f308cd3a4	5d7f575fc07fc2f7	2020-07-12 18:03:02.710816+10	56	2020-07-13 04:03:02.710508+10	cf256661
a81a3dee374f4f0e36b5cea3bf224f1d584fe4bae91c54fedec4319f361806b80d3198caeb1da2407c8ec94cd0e62633bbd5cfed23adcddcc0e8d5d786b35083	9251299e0de3597d	2020-07-12 18:15:46.213623+10	56	2020-07-13 04:15:46.213169+10	3aaf8680
292d5a07d14ce524157cba709c55a17c7934e55d1471b8dc243fd44b5b10f303abf35ebb65c703f2f8a5f1de74eeae933475e89549c0c1372a2f980582a8e3dc	2589149a4bea9df2	2020-07-12 18:19:54.413532+10	56	2020-07-13 04:19:54.413219+10	9334e891
6af4ff10e0658e47ada7bd06375f891e82b7020c16ab0596c942fae189777c5b3fe33599630ab227db74d9d31be6eab733c4854ff320ad912214266e91940d92	272519a77a3f9816	2020-07-12 18:26:27.071674+10	56	2020-07-13 04:26:27.071269+10	98c5942f
9598c6242d6d604d81b148506b634ca3a865f4da64bbfefc6d194562bd3f09ee404657916c503b17f47a886517eb949f436db4eb7a356af6174a2fcbfcb02192	b1dd3770b9a08148	2020-07-12 18:33:41.004259+10	56	2020-07-13 04:33:41.003911+10	1f336afa
2ab681f82748fc28ced36c2537d7480c7d01a5ca5dd61cb6b84d8eb4b090994ab70cd1d91f4955881dfbca6f4135ecb6c94163a722b074a72c7b3213fab2ceab	8f3a910e5bf72862	2020-07-12 18:40:30.846228+10	56	2020-07-13 04:40:30.845908+10	57a0fa63
678c8ef109c02b7ba362a0d473c6049bc01d905ce060a71be611c5e4393fb94e24c259986ee4a1791445a4f07b553963a29be4e201c3f5166dfff2a4ea46af6b	b970a4bda95b3274	2020-07-12 18:52:01.800522+10	56	2020-07-13 04:52:01.800197+10	7f236522
878ad1b90040a365cd4fe03e23511c1f874134275d52a81c9efcb0349808f98046fe0cec35812629102f5d3ed3da7b9cd369d24185138a485f7d26d16b63d9d8	b95c966365fd4a61	2020-07-12 19:04:26.121877+10	56	2020-07-13 05:04:26.121524+10	f024a1ca
541e80fa051b4c283bad7091cf870de36e14c831963203217d567c677d28740dbe74800c5f5e25b5cf5780d75f06aea8d58ed868205e43a55df5389cd90a96a9	6822cc91eacc9c8f	2020-07-12 19:06:14.688832+10	56	2020-07-13 05:06:14.688516+10	6683c1e5
9dbe4ca5496b9f64a58ed3831294d6281f4fc0f1313fb0f8c19384971ee1edaad8fdb455baa614a12364a8996e56e7edb83495cff2b8020666878884e0c2b356	c81e4e2dd035f74e	2020-07-12 19:08:28.297038+10	56	2020-07-13 05:08:28.296722+10	13496939
c418f8c27fe0382b121a0bf17da86f57ba3552a846675ad6cfc0f609bc3492576baecbacd66206d527572628c9ceb849fa1f20835fd136b1514204ae64a8c330	07d25d0375312724	2020-07-12 19:22:17.911071+10	56	2020-07-13 05:22:17.910693+10	e606eb09
60a9c66afa4bf95262e642e8ea7e757c520a1e1d8ca2150fe5537f3029bd03cf8838a8c6bb6e7711eef96587dba197e9015c89e01d678d91334a8a82707e8435	5526fb93d3ee0d60	2020-07-12 19:30:59.846715+10	56	2020-07-13 05:30:59.846397+10	954fe8c4
28d65a638114fe98df5d3bca9d70e752ada5facdea0cd66dc8c551bc7f6e1062d74059ec4b0d7fd58758edcfe01c0419abafa573dade851b05e1fe63c6353219	3a4b92d93983ff25	2020-07-12 19:36:59.622744+10	56	2020-07-13 05:36:59.622385+10	f7c737fb
36b8128f871f895680b9eef38397d72d50f4a0dc82a5ab1da1e35d6e5deaa97e75e9fb082c8617ecc1912543e0ecefd3d18c3000e620c28d345905b252d30797	552ba52d8e9390c5	2020-07-12 19:41:11.571707+10	56	2020-07-13 05:41:11.571361+10	7d51cdfd
0a01cb24315d53163c21b232caac9f0550d3a1fb6656a24f0917b60d83dd32f2650dfdbdfda57f9d9274f726199636b277dd01c030d9167b23744e0027beebce	55b563d1e67d845e	2020-07-12 19:56:21.96043+10	56	2020-07-13 05:56:21.960064+10	1d8ea7c1
3da1fa0235e86897b0500abe2e802a89a0014834583d70d41ceeaf6939f0de0e901e2d7b81a811645cf5bf85c5e33ec698cc4c81c94e4056b7578f2cb1a66d88	7dc5427d91d1ed0f	2020-07-12 19:57:31.087624+10	56	2020-07-13 05:57:31.087295+10	730ebac4
c9280bdd45c2b463b6598dc53606670e20ad44e3434f9cec9735ad5263a3a81aa027ce44de01c739a40283db2ed0bf99607af6dafeffd8da5dbbc38fe7b09336	056ac8f5163b4e24	2020-07-12 20:03:13.177946+10	56	2020-07-13 06:03:13.177319+10	f0dcfd4a
32921ef1e2ad1fd3a209df7a6edbb146d89ee05d523ca0012ace0ebfb52cc84ce0d2138b9409c06df89fa207d4b9ecd6721fd7ed0a9d28fab64a8503fe6c7c53	9d118bd9a31a3865	2020-07-12 20:13:03.622546+10	56	2020-07-13 06:13:03.622199+10	6b0c3d1d
66cb8b8b300cdaff0e8b82dd1c0837e79458af82a63032435d24b170b10d9d4b73563315a9b2681187050394c370b3654b829c2ca778fc7049522d21c4c519fa	9043b09172ea31cd	2020-07-12 20:38:24.850166+10	56	2020-07-13 06:38:24.849695+10	86d95848
eee495a917607c408babb3219ffa475bad79af7e0fc09584b1509bdd3d646dc076baca575928456055d92e1292b1fea7a6b2836754d49554758efd8ea17bb9b6	db5c88e9fc0bfff8	2020-07-12 21:01:38.121242+10	56	2020-07-13 07:01:38.120706+10	b2630da0
300001ed9617f4756e38cfd260365bb213ed6e66a85a9754937316b219569e1816996c6997771bcde831ed0294532c8583fc1d49a03c511c95175f199ec7f3de	c3646d5614a5b2a2	2020-07-12 21:06:55.766111+10	56	2020-07-13 07:06:55.765741+10	01aebefd
b7a34c4505bbd0a580f3ec1062305e49a4579a1750311038130ad6de2967e70106f2a6908f1f33709ef605e266ceb4232ab714ac2d7e5ba382a6d50fee267090	9ebf020c48f26fe9	2020-07-12 21:09:53.843863+10	56	2020-07-13 07:09:53.843537+10	fc8baa0c
7d3434487a5629646cfb7c46e626aa6980d3e21fd5a4ab42b865ef85c9681bd6c7045451eef76c75335f1adbf5c559c4f79a36c43969d3691413a9ccf33a7028	b0e4bd954948a4b3	2020-07-12 21:24:33.481485+10	56	2020-07-13 07:24:33.481121+10	28c3907a
644f025c3e7f57b5c24e00aae4f077324d5c0eceb7463805627f9c30912a9836d937839229cf94fdb8f597a0704df328af7dc6d695e68ac60616ce085632d1ec	5627d294b3f18062	2020-07-12 21:45:54.447827+10	56	2020-07-13 07:45:54.447462+10	1bb82dff
e6472f1382f8a4eed098c6107f5ed51fcea7e1ff4389b19129197931f6789acf9c8c62981319c0047767cda0c55f62351340eafd2daf531f07f9e1c09a5ad87e	5c06d3dd987849df	2020-07-12 21:49:45.289363+10	56	2020-07-13 07:49:45.289057+10	b66aea44
dc7dbe51c1d365d60ddaa3e7f41ca12c2efd99dadaffe74b2e29321a46b6a00d726af6062f3f780626815cb6575087dd31851cc75606488b9b13fbb491179427	f6017cfe786630ea	2020-07-12 21:53:26.693298+10	56	2020-07-13 07:53:26.692987+10	c92c5119
bf31dd41e504cc9b130d48204ba59268210c4fbc1e375f58aea0b059246804a8167e732570c81120f9fdaf10c82c6d89a18ba6fdba73b6d8d517897de2e7adfe	27871273eda23544	2020-07-12 22:03:31.609444+10	56	2020-07-13 08:03:31.609124+10	57a708cc
932c3676145db3539ce9c5bc6b86a88b11dc64dadee4646ff43f08b92bcbf1aee17855f3e3accc36e7b9b38dfdca56746e1399d71ab5aed66fa4f93dbf21d7a9	2180b5ad9b47e1e3	2020-07-12 22:09:42.559057+10	56	2020-07-13 08:09:42.558692+10	05511f89
e933c4dc53eb7a38486f618495953303de9e7fec40811d991579350fe3d56c0e494d343ba9752c0e8145b0dcbdd61128787055606970aae27595c23266dee52f	5a60cf59ddf02bb5	2020-07-12 22:15:07.167615+10	56	2020-07-13 08:15:07.167281+10	5f6e5521
016060c26111bfccafef54687184b2489c9d712bf92b00f3910bb62c0d53e3a9f9a94683440b3c185dd8f9beea7fe3c659992b37513c3018dd17c45d2f6c5c7d	7b9e06304821713e	2020-07-12 22:20:35.652884+10	56	2020-07-13 08:20:35.652524+10	d5ca00fb
74395e506a662d51f1ebf764b31be0a0c42fd54195cd80d4ed1ef17f92e7da7eb768542199acd6a16280088fc498ac744dd28f9c11f86e302c2604ef1d97d461	a6b6fa279234a70a	2020-07-12 22:27:59.111891+10	56	2020-07-13 08:27:59.111563+10	c5523223
812a1252e107ea721a2d9438f230baf8042c4a238a2e4c405166a0fea13e55b39ac7f861dd654344b9b9f3ba55025092422badfbdf7523239d1efae40920b590	fc19edd8e6e99e3f	2020-07-12 22:31:14.676262+10	56	2020-07-13 08:31:14.675949+10	ccd1218c
2d0766656b6e56678540a8d8efe742dff74c294e12fe920bad6270bfc24ff6d50a792e0f6387ce1c05ea68c523f4ba80fd4ebe3c3af63ee8d7a99dfd6bbf446d	7bb306cc293811dd	2020-07-12 22:48:12.293106+10	56	2020-07-13 08:48:12.2928+10	34d57793
0078eff15d1339ada3c5ba9d350e0cbe923703ae40cfee8a8c1648123f1d082d823567c1bc156d7a074a3c24faedd64b4c0b71ee277a8dbdab5887aa6275e954	3c89353747a9221e	2020-07-12 22:54:00.798928+10	56	2020-07-13 08:54:00.798624+10	840da783
f46d85b6e12113eb157cc8f4f91e4aa949c1fbdf85a490ff3a14fc0d10506ffb660600996d385814f5d083f23a8a3b9cf3fd848906adff48561158ec1c979c53	ed9396e4be11e102	2020-07-12 22:54:08.244216+10	56	2020-07-13 08:54:08.243905+10	b500ae36
ca43cd03f796e5e73e5f499eba36f43c5967f954d9f83def052ba23db0ddd672109e8bdb4fda606bb74e21ee984242925139dd5bbe995a25e537f2cbb2f92b1e	6a61f28f5842098d	2020-07-12 23:01:24.521889+10	56	2020-07-13 09:01:24.52158+10	fd3a4acd
f5c644bb44e580f5c1f6e8d1cc7df09291e26ebcae0ec62dcdd99b886302fe7d493a09e62df2bc919712190d8a13d0302cdf25d88a03fe44d89d401747619679	1d56f76db73fb723	2020-07-12 23:11:42.566058+10	56	2020-07-13 09:11:42.565707+10	843ade02
c7d7a06bb70d91af85fda2c1f558aaa6566b8b9be05bcd8cba720a1223543d01d8de203b1c7113ac7c5b0746ba86f4263d41b85dd00f41069c98f0b101294384	1da839061f6dffa2	2020-07-12 23:22:25.561412+10	56	2020-07-13 09:22:25.561042+10	3635d234
5a4e6521fcf4b4c490390c72da54e93abf49878b2ba2f26ff28f3ad998410fd22e9f4081de20c6e037f64d97594c30bde47380a84433750c70937555431d76fd	cbe70f03fbddbd27	2020-07-12 23:29:15.428995+10	56	2020-07-13 09:29:15.428651+10	88748ea1
7d0631921914694f20babc4eca8992e38b09f65b698f42f733dc4aa8d498911b2651569afea8a0503ee2c32aa7576b011f09e5158d1a663e9556fb1691df4ed0	b9f1005dbc967859	2020-07-12 23:34:49.525113+10	56	2020-07-13 09:34:49.524788+10	5286350f
864bbe5bae34457dbca020f37093355045708a93dccbb85f826fa35f76ae09044b7d750ad7f99b4723ce3156fb698ff7f78419b4e19c4c108b230a7955f2d061	75311cf9245b8d5c	2020-07-13 01:10:42.652346+10	56	2020-07-13 11:10:42.651433+10	c9f5e131
fb009d3c17d2514f137cc0420c30be8ba46949babd223d6df0059ab6a412fb8305a58442fd0f0a4834ebcce0c7f2b23a51f0fa534e015ed1248cc7eb39d73875	0a841a654982c85f	2020-07-13 01:11:51.77998+10	56	2020-07-13 11:11:51.779171+10	45c137b4
3d6323b25bf0776c095750636741c7a75042a120496cee928ead0cdac93063a0aba1fab5a937fae1530fce9cf8acff08ba01f9f5ac0ce4897ff7d50fd916304a	7c1dd68c3f7c4afc	2020-07-13 11:01:09.874345+10	56	2020-07-13 21:01:09.874038+10	4b6f93cd
f6bc4a3b26b41271b99c10a9aee3d44ff4cb08152d2b8f94099a7cf3426e7779dc27b861c4507a06d0af23ce108e1da8f6b14f3ee4caa322c8cce950712e12cf	e889bb8ea165f536	2020-07-13 11:04:19.494817+10	56	2020-07-13 21:04:19.494489+10	a6e16733
bf17f35dd08679ffdfc8e90209fd10a4938a7efa4fe8672753e4817fa6a626d1e2d28f91a7be3227511a978f0cc8c16bd4f5480734f7e68f08338e992f0a6a40	76a0c2eacae031a9	2020-07-13 11:12:39.430251+10	56	2020-07-13 21:12:39.42994+10	95ccdc15
77bbd709da815e2a2a24fffbb74e5de2f63b6003f24ca5ee124b1af2473f01017a85aa372dbbe88923a2234b52be17ee84519efdf39bc40de055d0c0f5b1c9c2	5cb787c71705fdd6	2020-07-13 11:21:41.457188+10	56	2020-07-13 21:21:41.456871+10	991fd1ce
bafdc9324094d5e28602c0025e705d19184545d7d946e01103b8c5e4a19699b000b5eec51f24fb2ab475553cc84bf3213b4b87243564d7c2dbb623cf771b7d48	5b596aacdb00750c	2020-07-13 11:27:17.397012+10	56	2020-07-13 21:27:17.396687+10	a517b962
398ca35d61472c62a7bdd81759446ab96aac77bc60b33f9adcce43a9b1a1a72d978500b8797be36e78e49c3fbb8298dae5d924f382591a59de202acf88eb77b6	5c9a534a91ba2711	2020-07-13 11:33:00.57737+10	56	2020-07-13 21:33:00.577+10	cb4427d9
3a0fb996bc206b451a04ed20b121f9d9bd18fa9afa8606c1fa1c0d20edd596473e20b54a5a5233703b87ceb4300f4642bc4cc256a4e7358343827fbc59860f50	cb9ddde8204f3678	2020-07-13 11:41:20.114639+10	56	2020-07-13 21:41:20.114272+10	6c03c05c
047adf2f4c3924117337ee54f8ffa9cfa929eabdab976d479aac08524162aceedaecc8416e284535744d1de0aa53ec672373d9a483eba5aba302e63008e16b2a	c059d8234eaea5de	2020-07-13 11:41:26.43164+10	56	2020-07-13 21:41:26.431316+10	cf4f8a8c
8ab0b03a7c62baa47f32ba7672ce0e214984d0d226fe0debc5111aa579c8b0f0adbaf64aecadd27fe44526dc4874cc57f89e48cb56d47322336028ab96daecc6	431f0a2f5ea8ccd3	2020-07-13 11:46:54.404841+10	56	2020-07-13 21:46:54.404525+10	c1a03d55
bbd451fd347b6c662b45605152ad9c4d158ba18a4a079a20cb25015c894fd3238149a86a23cc0fe7bbd3823f4e0c4504f5887c8a16c479b0ce349f529267fe58	5a036b0810902acf	2020-07-13 11:48:30.224783+10	56	2020-07-13 21:48:30.224469+10	b4994c3c
37916d626e2f765713676444d8b94cce3245a99fb1c24ceece696ed5514c7816005fa4de44fb35b7f655a999f29ce4bc5ae655f13e4ddbfe6f766740dc29281e	b89fead197361113	2020-07-13 11:50:12.646113+10	56	2020-07-13 21:50:12.645767+10	abc7d0a5
7d02be6a6f29dd5c9a0f507ade107373c204ed4240cd66db0ac02277d5576af006a97a91b9c63d0ba8b3f7f31e5178ea9ee8177bc83a7442082b981f092a355f	86ced089679000ed	2020-07-13 20:10:35.171517+10	56	2020-07-14 06:10:35.171184+10	45c434ea
8244f8ed71e47df2960b923a259dfdfbef13f77d0e881779898f096ae22a5abfd01772eb858c65521ae596a7f2f0c5107ee1f471b4ea2d2076ae6ffa8b311b27	fd4e0928645b8b41	2020-07-13 20:10:46.375701+10	56	2020-07-14 06:10:46.375384+10	13b03010
48a736aedc4d35fb7ee7130c91c58d9a974b252a0da7351c63d242862d0840405d1e486274668ef8d1aa6c4c3b03036f95f599f016cb49291c923e4a4b56cc7d	78e8c6ace8534dbe	2020-07-13 20:22:08.370972+10	56	2020-07-14 06:22:08.37064+10	cf282981
bb256e15808f6a144b6653f519c3348ec1e3c6e4f860224db74ab82143f6b6c4f7ab87dad0f6238f19e93961db5f3ddd05ef78932e1127a7864d3a923c556b92	4a7f48fd995bc465	2020-07-13 20:22:59.273077+10	56	2020-07-14 06:22:59.272695+10	5b1b5e46
3308076930b10a778cd779fc1b2de5c1b9c9f89c571c4c0d04d10a41a38050ece1190438ba854e25337ae63a08a0bfd12f537aa22025e155bc56a452e5cff6e0	b0b2c9d1c4b9fd4c	2020-07-13 20:42:32.267942+10	56	2020-07-14 06:42:32.267609+10	e3258182
75a214486c76d28dcfeb7130e28d67740010b64ce09efbe6e38cd966ed02120d69170d6ae14ad101753ace46ac57aa83b552008f1d00fea2b253c41ef6192236	af9397ee2688555e	2020-07-13 20:43:26.57759+10	56	2020-07-14 06:43:26.577271+10	0743d3fa
139c18cafd3fb6d715cdca87ae240ae1af535addf5d0b8c4592f040eb0fb9e9f3d6aaa556783ca23150305d52a9b8c22f1fa15ceaa17767d088770a523dd6aa0	481e1ed09ad05882	2020-07-13 20:47:58.029664+10	56	2020-07-14 06:47:58.029347+10	db9c84f4
dec3ad9786f2222a38c2a457f7f0a9e628e0a49c46d7fdf576d092cdb297aeaa28b7bd379868687ed8fae8b67554abf405b5cda0a7841ac272608e886a92f862	7d7ca045403a2866	2020-07-13 20:53:13.386528+10	56	2020-07-14 06:53:13.386208+10	4e2f01fb
d6e644d0f570ef4e37328e9ac54e1e7cb9d91e218e2132454d38da4b7d1c61094f4faf4831cd7b6ea7fe124a785194e6c650a33b87b623ab9d4e9b673b597ac7	1f16e85078ca995e	2020-07-13 20:58:46.401319+10	56	2020-07-14 06:58:46.400998+10	a4f806d5
79045194535891f81798a24463ee3a3bf738434ffbe056b1c80a6192d7cd6b89da6e326759bb002bdeaa51c2fe2a04121e680ce95aa234b8c0d66aa7c3c3b434	61283510603ecbc6	2020-07-13 21:06:12.155407+10	56	2020-07-14 07:06:12.155089+10	5fc623ed
c47947c1b34e985c077980a664314ca2a7c1e7692677c96b385ca055ba1df1c25f569f403cb8294c1690199e3699b77d826c3d71b12323fcc568b2acedfe0ef7	1330ba1a50924e4b	2020-07-13 21:15:27.722552+10	56	2020-07-14 07:15:27.722217+10	b8a658ac
72855f6664ffbd8a301bea3f49e1ff85df43ca64b1689ed8ff156534b135cde73c9b26efaa37059bdbeeb9726a8c23e111785270a064255e07a9a0d0a5abced3	e8c51907a36f15e9	2020-07-13 21:17:53.984838+10	56	2020-07-14 07:17:53.984523+10	3febc5e4
c5df5626f293a0f31758ccc6c226f841d0c5ec1af8ffb7450939e6e520b4f871c27e700cb4985b0d5ea46313b376e35516864781af263e7d871eae5aa52cdd39	acd191d619d951c4	2020-07-13 21:21:45.870421+10	56	2020-07-14 07:21:45.870068+10	cd4bde8b
74e9312ea8489f5566578085febd08daecf98f0994dc4c0ab35ba28f8c1b5bd8e76a200eae566f37b2c8760f9be95f10dc6f70d1d12501b99a72628fd91514f1	687e23046dc2b179	2020-07-13 21:22:44.590748+10	56	2020-07-14 07:22:44.590292+10	0a5efe74
c00f84c8043e33f119740a37a3a20b99235f291110a8bb2c6eb666b18849048c4e1c3277c260dc699f4bb9c578a91dc1ba2f55e4266677a2489702a0056b6f06	0b1e812a72be9be4	2020-07-13 21:25:38.941137+10	56	2020-07-14 07:25:38.940825+10	d6fc5e54
069af3190d278cb4ae52a57316ad129520045b18d92cff226a680d7fe2714363425c7886a01825055a1c754734fade09d159101901ea52c7a43cc56251ee30cd	ee674c3e22aad302	2020-07-13 21:28:29.458923+10	56	2020-07-14 07:28:29.458612+10	6ddb5c54
e97e4052ae0bdb2329c51808e744c9b3a29b8276119cf8df5ae5800da4c26f46f0bff32d9f946ebac8a5967a9d43aae17b66bb2fc2ce003fa6aad88bf29866f1	4b3c5e4e24e255cd	2020-07-13 21:29:42.767905+10	56	2020-07-14 07:29:42.767269+10	2833d11a
a071b533f6dc8a250f3cf6ec70e4c0afd72f3829305befeaebf82c8d6e5f1257e29c68f5af5e90804ad87182d6b36ce739f95b4a764ad03a7bf795d8a7b11f07	0463548af6125ee7	2020-07-13 21:30:44.990101+10	56	2020-07-14 07:30:44.989787+10	084aaad4
5b61955bdad32e4eb75f44734020121c007f5f6f20855a83b7ed1aa4d241887a8abc78a69f67739516c61ce1b8741d900b0ef2e200e5989227c2d848b145b847	f691ba8e0e3f2aee	2020-07-13 21:35:09.285319+10	56	2020-07-14 07:35:09.285006+10	99e0672f
c5d0564654c662ebab38cdbb9e7d49c7989238ea40498904e63067602f7ba372b456ddafd6764ddedce90ce91b4e8230cd5826b575a2655e307e195b9898f2ab	25cc9ec012e8b2af	2020-07-13 21:36:29.265616+10	56	2020-07-14 07:36:29.26515+10	01bb92cb
dcefd16531341e413cdfac8d97136d60c71d56e2bd863598c1aef74252bb1800d8fac35a07b09c551489b707250ba13dfeb799d50d28fe1246e47e86aa55c17f	b42cd80ab47644c7	2020-07-13 21:37:37.172988+10	56	2020-07-14 07:37:37.17262+10	12b4e61d
4690acc40ea489464b709f3e0dd2dc3fa1c86f8c81d7eb62bc9e310a1c693cd87784d5c07b8ae34f16e6888df224bfba87d3beacfa74eddaa4e1de9b0b4bb7bb	75f33ebdebdfddbe	2020-07-13 21:40:18.172296+10	56	2020-07-14 07:40:18.17196+10	9432237a
29bcbe8c6aeb2ed6f92310c4fce25e30e333c0c963a73137c089e57c6bff21339b861f43d61eb6eecd70ec153dc3d2dfbb81cc6d0aaa0b4d7dc436f855cc53b0	122148da977dee4f	2020-07-13 21:41:59.016488+10	56	2020-07-14 07:41:59.016144+10	ecf28e62
ec950e145c6558576a59003da75e234b522231454cd84925fbfe99b1d4442d612f873cd4e47899826b82bef6d7270d3e9161717c6f6838278be0c4eff8979c3b	f55a64ef1e957912	2020-07-13 21:44:38.261314+10	56	2020-07-14 07:44:38.261007+10	1ed361c0
6c2563e71b796837912f25c154fe0a389f7ea70c21fef06e0650f4a51606a406937908d66e2c7edc118593518de05879989639ec0f6c57d3a8a8feea42585da6	3d110a7912393fa0	2020-07-13 21:53:46.888636+10	56	2020-07-14 07:53:46.888317+10	b446f08e
7e3ab457b953f65035ce16cbd27a864b1cc6be6a302f66e47f76cbe71f5bdcdad72816aef178d191963422f63c1fd2158347f2c803cebb12d28bc42bde3202d5	0b1fd3b04673d929	2020-07-13 22:01:18.018459+10	56	2020-07-14 08:01:18.01814+10	36e1db00
6b752798a37afb44190e4c4c8986cf21b5f13fc2ac53ee1d9ef9d81b978ee4716504379506306f8dbdc32335e4130372839fee1eddad7a078e16d15664408938	0b1f6fc20609c0f4	2020-07-13 22:15:21.403496+10	56	2020-07-14 08:15:21.403137+10	0f7436d7
0ea5924667fe036349f02330c8cf60d62dad57d911ce60f43cbaec4ae2e3943b6a3310a14983dae1dbc667bcfb0529d51abf5f49f69892a486f541e0e1d58b45	7fce2213faea3022	2020-07-13 22:21:42.771061+10	56	2020-07-14 08:21:42.770746+10	208b4671
4d585c6e11f8a37f7d975e81b081c48545e38c69171234f87e7ba96a6a311fc0a072efe1a3a31337a43adfcd60f6247b4f3bbab949d12291fd2710892e2a70eb	0d89dc63886e5568	2020-07-13 22:21:53.25285+10	56	2020-07-14 08:21:53.252232+10	16679568
8e856c30e05d98affe084c34ba2fc54b120309a6c10f4c7e0e806c2f5d8ec96673bd97482f7363141afba58137f66b6626c4e6c70f2f7e2d6e01cdbdedbd38c7	dd26750038569ed9	2020-07-13 22:50:48.581336+10	56	2020-07-14 08:50:48.581028+10	de11776d
60b6f2517f5819a38c65cc69cf4112db1cbf8f959cdb7a35024627477a65f76a25406adaeaeffa215cf9452b5a0710f616e19004f3c975470ce726ec305df913	f2123aa4d797f07f	2020-07-13 23:00:28.648171+10	56	2020-07-14 09:00:28.647869+10	cdef52be
1649e224d7127dbd922c9b6344cb6bd7a65bc795c5ecb6d83005fd1cd53c5b089c6d1ea3890f41725875ee5ca77f96394acd9677e3fd640059c1fe017501a8dd	73e43e168f652d64	2020-07-13 23:14:25.46927+10	56	2020-07-14 09:14:25.468956+10	ddde3e02
878536236fbf36f4120a57e934225d0ed9888b52750c6ded4adaa623523aff2d697a44882ef7d4805e4defceaffe3a8dac453ff0b09881216a18d4d9e915d799	7a47a726b0e4e1ca	2020-07-13 23:49:56.96542+10	56	2020-07-14 09:49:56.965108+10	d2ffe62c
85eebc4a7a86de69235fb546548b27f6127d20d69215c2c8ea6a79359606aa9ed9f28d5f54a86f2ddc03dfbef8eb63295e4c2b7791618df074ed35fa37685f17	ec5766a1da698e82	2020-07-13 23:56:48.549979+10	56	2020-07-14 09:56:48.54967+10	a5eb1d96
d6960f52675957829a42901cddc71eb39613894aabf0ec660ffbfb42ce1aecc431de7882e4fabef3b7f91b649adf569ac8fa63f8db160dfd34cb7c650878753b	abaa0bf7b1a05c91	2020-07-14 00:08:08.522259+10	56	2020-07-14 10:08:08.521895+10	469ab99d
584a6a92f70166b434df14f156669d0310917271dfd9b1d04324e22b2b205afff89699d4cab5d6c357f50d933c6fa17e2d19e2efadcf8f1ab75b66f7dc2c8e7b	9ee4d31d419dab4c	2020-07-14 00:13:28.206899+10	56	2020-07-14 10:13:28.206516+10	47e4fa06
72dcd1aea8185a359957f7399a065c0138122a22b10293227c0cecd872eef40af95ffe9ac97ed40f4ad4080889e29a4b06f355bc5742366daaee07337ce584d3	0192443e94193036	2020-07-14 00:18:48.619453+10	56	2020-07-14 10:18:48.619117+10	5001d92f
f77f34f0fc5007165136d404b9eba81a1613f2071f220d3d0d1e423a1387a4a31f0c52a2caadeae700861012637508f3a23ad09f9dc4918037b29b13bbd3aa12	b61c699fdeb58ba5	2020-07-14 10:34:03.177079+10	56	2020-07-14 20:34:03.176761+10	d68645a5
86369e9e671c3165df7aa2aec2460967caca75a6250f1b7b7cbf247f7fabe1efd0c6df1b1445390d48702901e0376807c8d840739f7918518c748c0b38fc6b2e	866e564d4217c700	2020-07-14 10:34:16.300496+10	56	2020-07-14 20:34:16.299904+10	25463917
b571465b304143dd499d521ce84040d3f85e3440abdda7fdcba4a662e26f56c7df2a80d0ff1241cd520e596f66a76b819a5dd3a2aaf38000ccd1028d72f31ddf	d1da31dfa7ad50db	2020-07-14 10:41:36.276078+10	56	2020-07-14 20:41:36.275499+10	42a931ff
ad825c1a7d8480058a81fcb75146c13fc20d53dee07a772979f6546aae8ec2e129793c0feee3c6b9c65f3768c487188d7bbfd91127e85a1152b0fac9bb83b19c	0edcc705f3d1cff5	2020-07-14 10:44:11.737336+10	56	2020-07-14 20:44:11.737011+10	0c31430b
f347a695c48c59c3e1f41b3bf781218400274dd8b2b8acdfc0d353287f1aa051e392f3e928e928a69a20462f48b6116e2e562b97f9a87dd85e04c492a9df7196	d91a9e565e31007c	2020-07-14 10:45:52.75494+10	56	2020-07-14 20:45:52.754629+10	f84d4e13
0b40268e1976ef7a5050919f2729b8b6a91f2f027ed655ae65baea3d9f78406581413466c340b2a6dc042c73c051dd5f21747c3c4a1e9d4cb7562c65b566235c	5f634145324fa15c	2020-07-14 10:47:23.032285+10	56	2020-07-14 20:47:23.031969+10	dd1545e9
83afde2d8d12e2e16d7cf105647673209c24d31d37fe354305ec5ddc832fe5e1f2538c6714751abebb3257c187f8b46feeae317ebbf8ecef1005b7360877cd96	e1e812e58bcfb084	2020-07-14 10:49:20.021562+10	56	2020-07-14 20:49:20.021084+10	4c9d0133
6d357f80cdcbeb71bdc75c742a49e7633045f08b7680173f1bf5429e22cab21a9df6ccfe7c877b9f111a6822c6084e17e757f314f0dbf6351e6085241be79d78	83f2421b2ecfb711	2020-07-14 10:53:58.859503+10	56	2020-07-14 20:53:58.859187+10	0b8c05db
a3c58142b4a35937600f944012a5c2287daa9fad1d9388b1b512e0ed5b6b4eb9ff4de9b11ab7982307e234cb2fc73c6a1d9a5147ca3404c175d08feed01b1730	1e2d9e7d5a699266	2020-07-14 10:56:47.328135+10	56	2020-07-14 20:56:47.327762+10	4359aa07
f414ce223075e63c38c74f9323045955bc9fb3dd1d326420f607da00905b734522324476974554f58753392c7964356cca4acaf42f84f4b16cb1b06db3d42225	8625ff993339c099	2020-07-14 11:04:52.633221+10	56	2020-07-14 21:04:52.63285+10	929cb7a1
eb64b048f2647437bdd6591590fd5f8c5347f27278cc12c89c382d7fe607368069c4ffd120cacb31c47271750d2fc767c089d67df4d66732290fc80e00713b31	f2ecad2dfb369468	2020-07-14 11:12:46.134583+10	56	2020-07-14 21:12:46.134018+10	d9827310
2f9e8251e770c6a6f679dbfe069d577b16b075fc09e4bbb428df30a87ca5d0bf31a1ba2b0e203e7d14b27f61936012e92e6202c34ed86808561661eb0a72d69d	9d00d308a16f6080	2020-07-14 12:17:50.516404+10	56	2020-07-14 22:17:50.516061+10	6a0dbc09
d883b04408e3f756bccc8c2a6fcd797a2ad6f6b3de583539e6c5c104c3d9bdeee430c26feb3839cb760be0f4595fe4b80e6ac6729399d81799105e88340f8e37	2371d85e4e079928	2020-07-14 12:49:19.830223+10	56	2020-07-14 22:49:19.82991+10	1d318e97
e956e8968c34f4964521110cc7402419f3c4d5515f95f73ec152cbc0d4d623e30fb3e999edb851af208f69de3bad9d98e642ad458269033cdb11607fffbab987	0cd80061717dc112	2020-07-14 12:56:40.920876+10	56	2020-07-14 22:56:40.920564+10	66b32251
dacc00c0056ef77fba8cd43ee5bd754cb04d4198448424f333ae518eb1e54dd7477472f6f17224f95f402f3ff105acc402e69b5e631f7cd8c5b5b6c2d7226762	e0ffc7c5ee3feac3	2020-07-14 12:57:55.525518+10	56	2020-07-14 22:57:55.525187+10	30a31c86
c882b0d3e27bce1d8b31a0e71cdf31fe81088e5189e9118a13367f54dd1fbe25a98a00f549bb867631457f411d38b91d0f8351fc34190a0363e7f5d624c13af2	f10df145384e5575	2020-07-14 12:58:10.519478+10	56	2020-07-14 22:58:10.519162+10	eb587507
379269675149d756bbd49f7925db491e88eee7c59f6838c3bdb71ec8c520492986133ff2d9ddbcaa01969e88cae2b20d45ac20148c995ad1c6718325908f011a	9c163ac65b3c169a	2020-07-14 13:04:10.222139+10	56	2020-07-14 23:04:10.221827+10	cfbaa0cb
602235ed69ef37155e9b9f3b0fe0dd630fce40db661e185cbd299edeca1ad7b17170b4c3a472a392871c2bacaf07caf60cfd411ea90fad7a7a35c5e05bd94f18	d4e83e230b83aa7d	2020-07-14 13:09:10.921662+10	56	2020-07-14 23:09:10.921318+10	bd5cbaa2
60c4077875b9c1613e16a213ab4683ef0721ec04655af7b692bd781d89649ee1a5370b0dabcdd178700074309da07218901b090f6d579166bdc021ed71395633	b2636f66f9af7bd3	2020-07-14 13:10:49.673127+10	56	2020-07-14 23:10:49.672767+10	1ff7f97c
c278a4e78118872a1f403d3fcb324a4692c41c20aafec4d3720d2883d1186487886dbbf8f6f2eb42e67c1606eea894f2b0650c5c899e862c543d67998d83a9a7	89dfcdbf667dbdd2	2020-07-14 13:11:39.234149+10	56	2020-07-14 23:11:39.233827+10	c5189688
0b4b00d609017056af920144b585b521d8ef8fdf3bca06cb33049088271479170cdd3488094fd8d8378d540a570d7927e1874d43cfde21f2cacd979b29d99816	2adb1f07019b7eb4	2020-07-14 13:16:17.107498+10	56	2020-07-14 23:16:17.106995+10	34e91015
891df08d63d40b5570820610339b7bad408782064acf194b72a4be7c5c0c0b014839816a5cc19be7491c5f09a14450139088ee2a48837fc5c22e5f81ada94464	f2c1ed0ca6322b44	2020-07-14 13:17:27.488098+10	56	2020-07-14 23:17:27.4877+10	c0b99902
66a67b4fe8687a655b623b45116293c9949ebcd44a5513c39fd63f7be7f3c800c232615941036bea4a1f6a51e5ad4786da4674b1d6126f66a325bae34be5ca50	081e8ddd5eb91e9a	2020-07-14 13:19:37.05354+10	56	2020-07-14 23:19:37.053206+10	be929c13
4c0c76e2771fd8f2b1db1ef512b1ed02f988eb9a6ae7da650a0f69bad2fbb1eb4bd335d93656bae33024680e145602699d8b2bdd19ac011e0dca6c4f81166715	465a11558908a7f8	2020-07-14 13:26:45.217113+10	56	2020-07-14 23:26:45.216795+10	0cec1958
485c9a1a9a58ee3283417848ecf5cbf51e16576b43b9588b6ed2cb8dd9ddc7cba1f31a7a48c17a935c6b91d0c87e2ce5a924efb330b838a65c1e11982d31401a	64c0b58da7b41712	2020-07-14 13:45:36.173028+10	56	2020-07-14 23:45:36.172715+10	9584de51
a0f5d926043f33e56c540e5000e8330ab789fd533730b20c54d2f04ae744de2a9ad91f8a00e89313b7560d1379f8cf7040595be911b65cfbe41de7467a69793f	da370707a7618571	2020-07-14 13:45:53.995336+10	57	2020-07-14 23:45:53.99502+10	6abccd63
0b981c9c14d06e73ca3d85d6e20da19ab8938cc5b9a7b88f0c21e1b428551e083b13c6cd4d2bb852888c00595af2370023525a6a54ec217dd21ec1a89803cf0c	fbf409fba098480f	2020-07-14 13:46:05.433495+10	56	2020-07-14 23:46:05.43296+10	d0c3c39e
4d189ec0c6da122d1824ad695aade888f06dd54aae196f4b7708d417c8877b51146dcea4767f86d777cbaa8b69c4f499b3929d0e1249959aea9e3597b4bf2a09	54907136f0964784	2020-07-14 13:49:03.67892+10	56	2020-07-14 23:49:03.678599+10	56e314d8
099da469bf99fd4a3d943093a32a46fc4c80d268fc291205afa9384469a42427f502979f85d0a068f0b16a8c0ae601a8a42bb867f323e37e75001716be11e0ae	1ef03279e7643362	2020-07-14 13:50:14.126742+10	58	2020-07-14 23:50:14.126314+10	738efe3f
07e367b537ad00bec465f89758957aadb7ca7357aea1986d9982cf428567a14d6f71cf97c4369f470395687b32928766c8024309611a4a40ed34074ab5e9e457	e7a62709aa3b0edb	2020-07-23 22:13:15.247405+10	56	2020-07-24 08:13:15.246916+10	577bbd59
2e4c3761cefe854f30cc187f8e21b1bc6a4ecc183ce0a6ffba0d6113a3d5f2790b5cd5d4ab8409132461f853362318031018ce387d0f07a8367263586e5a2a1e	9d5e61c1c276d6b6	2020-07-23 22:16:40.975384+10	57	2020-07-24 08:16:40.974626+10	6fc05313
ba01760b145dd11efbc76baa148889ad191438252ce7fad9a041d9488dfdd6f6f56bac57fabd86e4c7f6200bd8128b6ef722d940620ef6651fde14b1e842c35e	ae0c547f32f6c7a2	2020-07-23 22:28:20.632612+10	56	2020-07-24 08:28:20.632022+10	ce45e815
4975e325b2e66d8bf402329263a321ef223bef9d9a194e0a6c05d554d00a2c65752dd27e8ff9c8beb9047bd3b6428b840e3a49e5e24a8f4a677758491e4521c2	88c93a96e2a8849c	2020-07-23 22:30:41.295793+10	57	2020-07-24 08:30:41.295458+10	3333d02a
5feb8f2e9246f375a09cdf4f456420efb9b55f740ba3410d0ca59da210d63227a50fe80ae32629d8f6535fafefe1299d3f8fbdf06de9bb61f35a15e314ffa2e4	e63480f7d96cb218	2020-07-23 22:30:55.182241+10	56	2020-07-24 08:30:55.181876+10	2226e6be
f4ef07760fcb73c1047885ba2aa0d73107b4d65147149c2a36ea02f5ea59a4f633e9419f1142dbd9f55130236370095cbd981ff2826034c34eca1e7816fe57d2	20d7ee7b4cc04ca6	2020-07-23 22:31:10.833338+10	56	2020-07-24 08:31:10.832988+10	fa1d054e
7bb33cb90af8232468104310a8d781490811601c35c102c03762d822605c186ee055a772d854762f04bc7d26146c6dc4d130ef9c08d07317feed00d6f41d6839	01ad570e00b0bbe9	2020-07-23 22:31:28.581578+10	57	2020-07-24 08:31:28.581159+10	73a532d2
9af1b6ba36b1046aacb3e8d198b9fcf033bf279b786257b9da8144e1ecb460754030d1be64c146c50e8afd4a51f1e49d08d3c7f4c69316bd003aa673b919d280	9e7e978510bd5201	2020-07-23 22:32:29.662637+10	56	2020-07-24 08:32:29.662317+10	120d936d
81cb534e58c9368fc620274773e98ba261c3e04ec793439fb3b6e91b33a0c101666de0edce071bf57f07bf39bb7472a32874558c0601aa83be8f43fdb51b0430	145312181ec5aadb	2020-07-23 22:33:49.986761+10	57	2020-07-24 08:33:49.986355+10	c4d01273
c5009c259b5b27003cee5c8b56c6ed08be9a8e03f2425a8082d5bde6e5d0535cc3b2272aa557afad8e8bdf96b3436d6414eca8eb2cc26b2f461de830c251bfae	0ea301131aa86fce	2020-07-23 22:45:34.17796+10	56	2020-07-24 08:45:34.177343+10	e0f42fa6
325e1f4844562063d5e1abfbb876b4e94c3cb627925219a6abfc0aeffd78cd169bcf9772ce7cdc94fd15852c90b8d74577a177084b8d52b02caf211ad1833baf	bb2cdcae13783864	2020-07-23 22:47:04.584915+10	59	2020-07-24 08:47:04.584514+10	03ad2472
ffa124122cac7cd532218998a8bf2db2d89ab1f780ac3ac547d4326887b4cf03f7713313057aa8e7530b7d6da1bbce8d5f3a80aac084ffea41f062577c596c4c	a95711ac399b9ac2	2020-07-23 22:47:55.737215+10	59	2020-07-24 08:47:55.736884+10	a901a224
6c2215c5b31660b4806286824aed53bf2f35bae0da961014f915e2b1f9f5ae9a4a27aed9dd792900159cfc8402548f9fa6ea9c7c1a316a6ad3c5de603dec0b94	0bfaea727a0fc836	2020-07-23 23:29:12.349219+10	57	2020-07-24 09:29:12.348848+10	31b0edc5
9d1860b5f67a00bc5be173a891aaffa911b253356d93b0756d7090359b278fa904382cc604c0fe48420c05753066570d8ebdedf97038df59dbd5737dc862bdf1	627a41b878980785	2020-07-23 23:34:50.38663+10	56	2020-07-24 09:34:50.386119+10	773e895e
c4ecd15b886e4d0f1ffc86b8942a97cd70beaa7ff0d385c0e29cae3cf4ac56130bf2a8133c9f60773a81090a65e34efc171a3b53069a14d2bd8cce16539b2ee5	99b8db4a48e4111c	2020-07-23 23:35:27.069559+10	57	2020-07-24 09:35:27.069104+10	fd2283ac
cd399428affc5131801b93f5d8e6bebdad6e94e34bc6b3b16d45a860c1f13cbc64f7c9471571c74c904993178e8ab6679c26beeea69eb3a401af5606050c39ea	8471313e67f06fef	2020-07-23 23:38:30.946677+10	60	2020-07-24 09:38:30.946332+10	fa6a06c7
733851960d7c47a69f9b5a2222739ed223595b804fe57ba89e04c06389bd80a7c4e16cd021b57b39c8b86a19887b3ea4c2f52008797d674c13cb478ad26f8973	9b7664999ad7cca6	2020-07-23 23:39:02.752223+10	60	2020-07-24 09:39:02.751866+10	3fa701e1
ea44dda7af1b4625737dbdc13e433d7f39f5566403bed846d17067cbccf17d86c622e4957c0cc3c91e0bbd0d1bea1e8f761b79314fe3a2dc0cde83a90e982083	2c8fae5a1dd65e0d	2020-07-23 23:49:00.291672+10	56	2020-07-24 09:49:00.291207+10	f71eaf17
fe6b08cbf10895038a33f155acbcbf01fa751856deb11e74ca2ab01c15acf299dfe61fce9eec2a9aa6af21e0b2aeff6db6485c867b34bee09e66392dd7d20822	28d0cfffe2491773	2020-07-24 00:17:45.884283+10	56	2020-07-24 10:17:45.883702+10	ce78581c
0824b62fe176f050211178882902e42c373934855617e7f34e0cc3f525a36b4e72d76968e7549658e618c9bb4d04b1dc9ade59a27eb3aa6fc9521ce576b2eccd	d2d7eaee24b6c6c7	2020-07-24 08:50:26.315357+10	61	2020-07-24 18:50:26.314926+10	f576255f
1d06de1e4c428066c2f2f7d385e0c27ee9c14fc95e02747ce7f1a232b0d89addea95aa80dc17486a2c4747db104f882a2b4477c0452d3db7e79d2e9fd6f78695	2e7284d5b179fac7	2020-07-24 08:51:15.217207+10	61	2020-07-24 18:51:15.216839+10	a7288210
7a278adcd309830685666dc73013bb7af44410abe29dc45633fd37c8b211f40b19ab819e0a83456ae7207e50f0392d618e318b87beaffb41e491bc41292ffeb1	e511be04e97aa234	2020-07-24 09:03:47.806309+10	61	2020-07-24 19:03:47.805868+10	2630ac26
e326198492c15bbb107eea7141d7c43c818387f61e8f274160a330f87faa11a53a6fc3c845ebcce841d4f82c5696eeefbc3b06b482c4941e893c8d8abbbf4b18	e406d0730f249531	2020-07-24 09:04:16.646519+10	56	2020-07-24 19:04:16.646213+10	40697fc2
727b2b29175889b56c613de3fecda54602a4d306a612130b7d70a7220bcd03ca736ddc9a98226552762b0a333a434e06cab3f6beabe7c0dc7537e6053c25e92c	b0b8f1e1757d5db5	2020-07-24 10:12:06.148017+10	62	2020-07-24 20:12:06.147536+10	d1a7ffcd
f5fb4dafb361a441174045e14c5bce058daa9c611e5e5c406643f7fc3383d4fa9d6ac88074dbc5597eee741561a2deb28b14efd4cf614326848e487192228f80	bbadf329dfe62602	2020-07-24 10:12:49.182241+10	62	2020-07-24 20:12:49.181904+10	9f31081f
f09e7ef8c0e32e0576d733eba4b448a707197287ea90e6c08ae7d16d19f144467cc3404f67f5c10eb3721ee6fd524e752620ef35566fe41b0e803673b3350978	6f8fa04b8780f2df	2020-07-24 10:20:30.179934+10	56	2020-07-24 20:20:30.179602+10	21416769
07ff5dc1171e1445dd59858ca5145ae2dd59a84665978fc61148b75b127e8775db23dfe2ac03945d0a744638da841852b22e88fc59c368bd23b8e11b3e8b23cc	1c304dd058c9cfda	2020-07-24 10:25:50.005486+10	56	2020-07-24 20:25:50.005062+10	5c51e8f9
a5402620200ef5ef7ea98ddf526dca53c1fa4523cb34bd77b75028d0af2ff67cf224a2ce709f13556b1acb265ec99b9ca554466e03951faae3296e90b843f597	211524d6a2d3ac4a	2020-07-24 10:53:26.426958+10	56	2020-07-24 20:53:26.426617+10	91cab98c
94a2d27bdf9348a42ac0bf84702e01d29a4a73b998d99cfbd52af4305b40c9b6fcb9c254d85c25be6da2f7fef273f0f53f1ae09b1f43aca27835b591b5c1c82e	29121d7391f10a82	2020-07-24 11:13:40.408442+10	56	2020-07-24 21:13:40.407904+10	677079dc
65a45b8cd85c463d11dff9b2bd2c7b2d569357aef9e2dd7b5a1a56dd66c5382b402cc34e6a042efd5a769b60e1726ff058a3d24c7300c46335b70f85b18c5bfc	7d9851be55d5f77c	2020-07-24 15:24:42.974609+10	56	2020-07-25 01:24:42.974133+10	36be8122
0f7a0edfb5570475a39b9123b6d814793a8deadfd6264e604498b03b80bd245d5c12e7c1c5ec68cc77bafc7f8ecefda4a4b8de8f739f0a1a0c1ae1242350619e	78de1105788a8137	2020-07-24 15:54:28.341154+10	56	2020-07-25 01:54:28.340608+10	0a51ea2f
174e67da79c7a965080802ecdc4efaf3e4329f761bdaa6335ee6962a43cf682dd72d7239ea827603abeeb1551bf3054ddbcf8d31bb3c4ad8c318025e6390e9e0	117555ab2c87a501	2020-07-24 15:57:10.054157+10	63	2020-07-25 01:57:10.053785+10	6018c2e4
ea4f0f2385205bbad1419bdcba05792e5bbf80c4f22135a96b4cecb3885fbd90b84f2274de99889733395b5ae4ed0fef32153975134582ce37c26a00f982a40e	d94903c88c144996	2020-07-24 16:12:17.164932+10	56	2020-07-25 02:12:17.164599+10	0f123afd
5f9ff1d2e1ad7b8203794da2591a42909dc461499bb7857f89403a8bd17f97f039a7dac1c3c1253901006f8b54f18bedf27a74d40f74c31b94cc93ddfc00253b	d203c35c185f9005	2020-07-24 16:13:11.524592+10	56	2020-07-25 02:13:11.524216+10	04fc47e8
13b257962938b1183467a9854344f7930b7ebc9fd6670ad930dfdd096d9c42eb1201210ac263504e832fd9b6ac2bfa225c53cced839c723398fef9fc7b2fd964	05c37b562414860d	2020-07-24 16:18:35.853862+10	56	2020-07-25 02:18:35.853549+10	6c9cee3b
776984fd2adc37595492a05ba42734163383e222b325059cada977e70fa722fe011445ab212c8e2dfc2af0a20b7b5bc9398464871d42a9048bfd1f0239aa8abe	eef6d6698735c239	2020-07-24 16:42:39.648511+10	57	2020-07-25 02:42:39.648175+10	00c833a4
475cf53c092c2202380cfab0c0d85309e006757e628f96a273a3061b4680de366752755e5e85f7e631a475229db02b22be64a3036bb4fcf56231dab2d9137f04	7ffe980015de6c7a	2020-07-24 16:42:47.280555+10	56	2020-07-25 02:42:47.280241+10	6e04a063
45b46f875f70279b7d5bac4ea1f5ab41e3c3db010aef8df0f097cf43c0790873bf877b7cf94268757b92703bfd6645d0b36ceb4a9ca6c8b37007d7eb72e63785	81246a479b925611	2020-07-24 16:42:55.599383+10	56	2020-07-25 02:42:55.599042+10	dfb7e37b
3000d013bea2b53962d8c564d8405505f571ae39e1eee0958523e150a12d1517a74bbcfb57606bb94a35706071df978da99a15fd09ef3b6aa2fba99fea1bb3cd	393aac63dd113dd5	2020-07-24 16:44:30.328509+10	56	2020-07-25 02:44:30.328182+10	360c2c80
cd1af9ff13e95fc616cbd16e5c86f200e2e7e6481d79bd922006e56fececa97ea19824b846de55b69039942cc8cb8b45428b6e18911fe810e824997f08da59fd	f107e1ad24878695	2020-07-24 16:50:18.156719+10	56	2020-07-25 02:50:18.156397+10	d354b15e
84e5f958de9712e59a552f471c689f2670ebc325df8c617bb930847a89d8b7b85e0fadd3e2acf78a3b9a06b8797c0ea87605ded041c6811984837e9fa9df3ab4	36b42f3f27af6d09	2020-07-24 16:57:20.515451+10	57	2020-07-25 02:57:20.515125+10	e72fc32d
bc262227f53b039bc410b912cbb7b5fe735a10c8644017d64c884530dcb70fc88c1e819fd32002167f7b831b1dd434a57bc9ad0b08d0d146fcd2aeae92b72001	e011b6ba356961ef	2020-07-24 16:57:54.983051+10	56	2020-07-25 02:57:54.982729+10	8599739d
a5a574beb484d11b2d71c68b428e42dd81959c750c39be20e3c4e334856da74c3f4014db358f58594a8febbec0c9629ed28cb7fde048edb67006e52f3669db11	c325e3553e2301db	2020-07-24 16:59:42.546532+10	56	2020-07-25 02:59:42.546104+10	24e43946
1b4eaab78b88e0e97b4c82f112afa3fc6cce8af610bff51d372f811683111f2772f45e825d59a7a87b59f225a788e6d9fcf7912caae929404878c61d65a6b360	184cc99123f2137c	2020-07-24 19:59:52.041941+10	56	2020-07-25 05:59:52.041617+10	abc458ce
8581cc76428089751b4c46cee563d57d50f30b83d0a38794714ac0302b97cc0e91b7f53568b86d911c96d16a0cc65c595300320a1a3ceff56a5437d9867fd64e	fa76e6a321f5282b	2020-07-24 20:07:03.924135+10	56	2020-07-25 06:07:03.923805+10	b8a2e1ba
83b30d61d8c20586175a0095c86542ddfdba906ca16d9574cf9138a89b85d5a1078a0a1748143d3258ac801d76ae39042a5cc179d79ef281a2bfd52cd2b8622b	63fb1e01a64f1ff3	2020-07-24 20:07:26.881067+10	56	2020-07-25 06:07:26.880659+10	6e9554e9
bd123642dbcbd2505cc494d7ee52b8d0bdb97f7666e80f1096b07e39d4993c49cd7033e817eac9918c254369384418058ed6222164a9938dc68aa1f9fc019a86	f1611272638c377b	2020-07-24 20:12:56.855166+10	56	2020-07-25 06:12:56.854803+10	6bcd24aa
130c54cc41a44819d7a13b717c4a9291f76314951b7e6d6dc56c07882fe64f2dce6fa20310d653378f8c9246c48e56cd7f8aee5392d5fd0ef53b3c7d5aed70f0	dfc386ed29144708	2020-07-24 23:33:09.904515+10	56	2020-07-25 09:33:09.90419+10	b7dbebc7
95194fe272244433acaa420a6d7f923731a205dfd3c805b929959f3343931e7b6eef96866eeeebd0038f314cea0344c44e86de23e225945d5123115341fb7da8	ac376628ba295226	2020-07-24 23:43:20.058339+10	56	2020-07-25 09:43:20.057997+10	cbd8606b
62578752a6c8ab0f53791aa50955cc40353c7490517563f3e886c8f6e04c5077037a001337500b22d00023647671e528e6dff5193a0d16f5c0bcdc7af01885ca	3fccdd8255455c94	2020-07-25 00:48:21.236165+10	56	2020-07-25 10:48:21.235699+10	41685e5e
b077dca6b7a6f152ef95f1a965a5e00aaebd0064d4ae1ca20735d02694f4807eab9267a808baa523c4ea0c09e90b69a8dbdebfef6de5c745d67abdcaeb6ebadd	241e03f49ed8b619	2020-07-25 11:18:24.421239+10	56	2020-07-25 21:18:24.420891+10	fabbe8c6
9930f72de34cd26cef19a0a0dbab0cd1ce9cc75c165a18bd2bb3325ddec0a2d18d85fdc8d23bc039f7582635863e8093da97484382e282bf3735d760bbd958b9	c3ee2a0a971482c6	2020-07-25 11:59:23.04744+10	57	2020-07-25 21:59:23.04699+10	3444fa77
54b0931afe79f2bba4a5e104436a5f4a3fdca3b5ccc149cc7e406878f468de20fdee6fddac9df24cdaf5a344c8bd18670d26401131b88b45059650b79a22a7be	9ee1e5c2ac120888	2020-07-25 11:59:36.802686+10	62	2020-07-25 21:59:36.80237+10	59760a97
d9950fe583c05a80517c76566206e7090277ad20360d6309067dfc4c497dc32fc928c4d6ce9c0e366169e529282192a3584ba158726692a3fd6f706070ff4947	da79becc4d944e7d	2020-07-25 11:59:50.08384+10	56	2020-07-25 21:59:50.083515+10	6af6bbea
184fbd62d574a75e7ce82cfcd39dd56bf30e085bffbfeaeab18d15cb55ecbacc38f7b3e23d851a47d9e004205c501dada9bc3c1f780bc26e2c5a7b3e8b0b88f1	90b9fb03e499e413	2020-07-25 12:00:30.866632+10	62	2020-07-25 22:00:30.866317+10	6ee1d725
054e78ce55bddd1d5ca887ba37fee2ce740f3256f44d55ff316dd0b2840cf044c55c6c813c0c93e9f5fee2821c2b64d75831981e1ded67c8d87c7faa2715e011	7ccd25d630a077e6	2020-07-25 12:00:44.788889+10	56	2020-07-25 22:00:44.788535+10	ae110cd6
bb6e3bda1d9d833af5059e0814c9c1595618690a35b9f5f4347bf820a8e0ecb388b93116a2e07974b403865d6aba6a9d0cee57c2ae9af758bfd4531a069c0671	a49f7e4ab0d96554	2020-07-25 12:04:16.789213+10	56	2020-07-25 22:04:16.788838+10	7906fa5f
212dab1ccc216b57e474bd60376ffe566abd73085d5b19685cb74351d485762a1c50c4066f067c1b3f36c53d4e8d551921ead563fceb7847176fafbdbd3d1da5	0950bcf5399c9cb3	2020-07-25 23:41:20.019057+10	56	2020-07-26 09:41:20.018589+10	b7a6d422
2d3b4a1b57b95fd8d0190b0a1d97d47e021de3c995179f87ae5c4cae960bca15d3df5268a5b54f7220de6e55816679284041ab8c9e8257e1c12dca63c7b4a23b	27d713a2e0b90ac2	2020-07-25 23:56:41.914675+10	57	2020-07-26 09:56:41.914295+10	13bcf7bb
c409893501a1f6de06bee118f818bee35cac2f537e8f121dad82182f8d57d8f50946387f07e25307927bb4558d2f95802a527c3650a87f1051f7fa118831d0e0	d769375bad93b199	2020-07-26 10:40:54.799711+10	56	2020-07-26 20:40:54.799398+10	26bcdc8e
72b60f76b329b19141ea61c58a773ab9eb411e468e70999e2b5f2037c19bd8591aeb6bfd419782389a8ef7881de1105c898ebd7c5ae5754ba664c2581bb54cb6	84f96f2dd774a04a	2020-07-26 11:01:12.021606+10	56	2020-07-26 21:01:12.021263+10	c2ef9d66
232c3bb64a173cf62a7c6ebad1a1d3c0f147defd686e76dc8a40c09ffc091848c251c45512a0e28ea8babc184d67cc79315552563e0e389625aebd39f50782d0	01081917628bfa66	2020-07-26 11:01:25.756311+10	56	2020-07-26 21:01:25.755973+10	fa4fd68d
990e26d0e00980d91c3e8a8c2ae96ce922f569e3cfcc3354fba9d382d7a1113f0b5260afbf4e386fa5d47204683c366853d42bc1001f9872bd58067c855e2350	bbce695752dd117c	2020-07-26 11:04:43.02956+10	56	2020-07-26 21:04:43.029173+10	77164263
d8527b94b6b8636997cdf4ce7be93894f5f5929c14668a09e2da062c89aa4ae98a5b3c00960ea3f1333ca3a0d7a7a93319b109e4c6347892e471487c9136de4e	02c86eab8550a475	2020-07-26 11:31:17.589386+10	56	2020-07-26 21:31:17.588933+10	715361dc
3960a7b4f147d50c36acb1bc54f587336b313f8d904fa043648038138dcb2500941f5c12f611cacc34c724db6fdcded207de1115179d0b602f2e901a962be43e	f5642b6cc0b78225	2020-07-26 11:39:43.206972+10	56	2020-07-26 21:39:43.206385+10	db67ee95
9aac976e1d280f94767e17bb0791594e3a054283d7c5f5fc8c69c99d56bc480922d1e0a7b1161f01e3c3f9d3a2016e8ab076aa00c39d87fac0909f69c987c583	d1afce31486b3ed9	2020-07-26 11:44:44.614052+10	56	2020-07-26 21:44:44.61365+10	4f2e24d2
34179a274160b2555e16d9426f94bc261c47977b7372d3f201d217d0e2547ebd5dff9eb08a97cf3c8e8800fa2aa0307ea99c7cd09d575da91e7cc759f1f10b50	43d7a336c5e7afc2	2020-07-26 11:46:07.739978+10	56	2020-07-26 21:46:07.739657+10	169e93ad
30ca5c272b51c2d982135aee89e28c329003fe2033eedcd88e1b5d93858d7ba0d2b86fbf3fb955fd8aa77ae320c6a1f75ce03a2e7e2141ad2e344b295797192e	17f449750a78e8fd	2020-07-26 11:47:56.04244+10	56	2020-07-26 21:47:56.041977+10	5fa32840
b3c16684779868270e3e53d2f3de6d40459d5df4042dab48e309c7240b5cbbbfe312f0ba6df92ed0e6270ca5ef16e4855dff3663c875946a057a9ab31be1ba63	41d8b98297c1bcc7	2020-07-26 11:48:47.716965+10	56	2020-07-26 21:48:47.716639+10	bc5fba2d
95ba2db19d2a27d9fcad8ca75597324d67a6e0c8be2de5824af5391d26307712c45b5e8f5edcec3b00dd057b1c66222b05f7165293c44ff526ffe8fc658c6371	145f62f19cd987c6	2020-07-26 11:51:54.474247+10	56	2020-07-26 21:51:54.473196+10	fc301e2d
e98fc2ef044affccc568a115d634a2a2a8c4643f3494d679f6108a7dc69165bfa084259a0977bb02f2df9dfa69710de7ccc1329ee1d00b63e87cd2ab37ebb09c	c38150c7d4e57985	2020-07-26 11:53:42.568626+10	56	2020-07-26 21:53:42.568158+10	951ee976
8874802332e8f97503c18daab57f68014258a30b364c3d77e5dfba386292aad34d930c9d7895c5e493244cb5a6f84f9681fda46398b1bb7e199f59910d194f12	818dc57a3e189837	2020-07-26 11:56:12.898256+10	56	2020-07-26 21:56:12.897907+10	e0477d4a
c8b06f2759453aee114f430775fd14dba215695d9bed1d18afe01d27c1d7462e93fbe909ab9fc4fc94ef2dfd71b45ea43dee08672d774d43c692c58354889cf6	246d6bcd359c4535	2020-07-26 11:57:49.695169+10	56	2020-07-26 21:57:49.69485+10	a822a9cb
ee8fb2ed1c315fe669f3bb7eea109a90d24be52a4bff54ffeeabb4af13fe41afce3bfc84c5cb796e3e60b17b95be414f3bcdf87f7de9fbbccbb0b0eebf93d5a3	de47e4f85d8f4c5b	2020-07-26 12:04:14.68588+10	56	2020-07-26 22:04:14.685526+10	c4a74d55
d163976de4eccb8ce17bc0bb252b2d4f40955cac8a8fe40150c4e35d889c1502c0f7991085061911281c84f3308fc374e97ccf72b1ab2d0217736f58f9036898	63319a61305d57db	2020-07-26 12:10:05.526792+10	56	2020-07-26 22:10:05.52646+10	ceb3ae85
f555fed3f86a963353ea804cad5ffb2c4c5412d4e00d0731be2b2d7226fe9360703bdbd9a907cabcc1453fd8ad891b9645b5dcd708b410654e775edb030b5f35	c6b6c112d36e788b	2020-07-26 12:18:40.010609+10	56	2020-07-26 22:18:40.010136+10	42d38905
cb50d2b35d4d2ae87f47959042ddd00220648ab00cb5da0d2d7e28fbff405e2534007af7628785deeb0ea35e5625c05135b12c4b93721c6743768f2069a53c40	da92437c1a06a912	2020-07-26 12:19:13.421517+10	56	2020-07-26 22:19:13.421191+10	4894989e
8fa8ffb9610d0336eff1b8900cfe2b79399a4d9de9346fd2d7dab9ae09e646e98865add4f5d52f99ade888e72854522c43eb48973e32c3bbcfaaa3b4128afcd6	e303f8e7e7b1776d	2020-07-26 12:19:20.359165+10	56	2020-07-26 22:19:20.358783+10	531ef597
f644aa36f8ec40a8369a56c753f0d18faf00a67002d3bb65992583e29ffac568bf583b73e21ac5347fba184d76d905ac4219d9f44ac3e8769fd3a1f17c2bdae0	3043b01723e95bae	2020-07-26 12:27:03.960133+10	64	2020-07-26 22:27:03.959155+10	25ba500f
899bba00805fc4528c5a867091519de5858738449d55ac10510eca69ad6e56c14ad2bd73bd042738601d402d02bb59a9ebefefaa6e8230a2094951290876eb02	71cd0ac5bca2ec6c	2020-07-26 12:33:31.932857+10	56	2020-07-26 22:33:31.932534+10	2a71aafb
acf39a139c9635b2d623d26a9fb63f0d746f03482877723be8f379a9e4c5af7172d011eb41c745d5cdc49e551a40eca6859dfeecb0bbc239ecaf8929da578ebc	357370c22e6f5bd6	2020-07-26 12:34:09.353438+10	56	2020-07-26 22:34:09.35311+10	cb5786e3
000481c88f6e85e4750063e6e00048a26722070c7519add3a3238d092882768281154b7622faffd30f8a6fba39b070c6e5bcc45cf623dc9f71aac18b62a42350	adfad715fa79d3f6	2020-07-26 12:35:45.876162+10	56	2020-07-26 22:35:45.875792+10	df726095
46bef87f88a950f4825b1c63221d083506a3834f28e20a86f59d7d0b744a0e1190dc26266aafe5f9f1f61c696ecd92f56c9b766e0f4ba9ae007c9be51e8bee18	078fed1424a92cd6	2020-07-26 12:36:54.790861+10	56	2020-07-26 22:36:54.790539+10	5b5782ea
f1487ce006903795a5624b94c029be69170ec04951b942fbabfd14698a4cb6c674b69611b7e1074cbb1e6550ae70f455f5384184d08f9cfc0948deeefec8003d	2e2b40f1ffa54468	2020-07-26 12:41:31.782331+10	56	2020-07-26 22:41:31.782+10	9b159ba4
bfd4a414543365dcdebf8d8f27aea7dcf8e84d4a0a939acc224cb30a16e4737fe01f76c0f748cf29c748a4f3e5866f75d38cfbe1492404a7d8d6709e45a9b611	7ecd67ac5ade0578	2020-07-26 12:46:36.306967+10	57	2020-07-26 22:46:36.306624+10	54a270da
8027b2d0b3ff505566553d5a122f3bfd0f52d67c2d3757e0f5aa91b1df232de324d5cf8cb50299c6b2c737abc3d95387fe9389165bc7aefd3e4a23861b8ad3ab	32fca7c064dd95f1	2020-07-26 12:46:45.964938+10	56	2020-07-26 22:46:45.964521+10	718566ce
bcf00b618c976d5a5ca1a5df449779ecebe84d551a109748b741c6065edfd629e5f722413aebbe1e93695f089a6d6e93f5c31fc5d962a77b9014472e8a178658	91db6f6590d4b886	2020-07-26 12:46:56.828344+10	56	2020-07-26 22:46:56.828012+10	d2743248
b990f6e7ea92da40b2f5bab98cc5f72d561d887cc7c195c0b9b3f5c791c40af307255cc45965ed811c803a9b20696cc6f390f3dd9ba4be12e7dfc78a5703d2de	d4c53fd9f844ae9d	2020-07-26 12:47:36.347925+10	57	2020-07-26 22:47:36.34751+10	8702ec6f
b9f6ce2dedd850c1a441b81275364ce97bb6d678cea16b35356ccbca4e84c8d77f7d544958a46e3a04e92b215386d1a516fab74d05ec07a8f5112d56361e5573	d3adc31ece4f8aa9	2020-07-26 12:47:57.000332+10	56	2020-07-26 22:47:56.999979+10	47dfa6db
2926ce9dd682a1c9193fc6b8c70637098ae4a5450301ef11b3f329bfe3b23d38e6de917192c4f73c8f43df8a37ad98e957731badc66b02abb066f1f9935dc9b2	3ca00b5b4d690e2d	2020-07-26 12:48:16.831456+10	57	2020-07-26 22:48:16.831121+10	58abd132
e8c7a7e433b5c643d93b804a1a60c506f59ed90d9b763a337351ca9e6d3569ef2f55102dbb576b6770755a5f8ed3478411da897672498ea71bd458f825c7883c	6110190f085c1d8f	2020-07-26 12:48:38.110922+10	56	2020-07-26 22:48:38.110547+10	fdd1e37e
12fdd8c180fab3016404db8c7c0fefec8643af38a18c8bd7753568682b556768faff61f5e685f983d7d335afadd2d2cb17877b6e0ea3261301b3207afb2803fc	a0d9ea0f8d15c650	2020-07-26 12:52:34.079438+10	56	2020-07-26 22:52:34.07911+10	bd9fd43e
4472fb223af51a6299351e3ea18096affa036dcc5d9a64591a95bc9b694e68780b163b6bfd1d826553f83461b3460e98a1261d1001eb4022d444f58aa1d6fc1b	8a4ae3307645b02f	2020-07-26 12:55:04.719083+10	56	2020-07-26 22:55:04.718766+10	50424156
2d463fb73fb863ea8333bc96e9a659461ad0b432db5b644a8b3e049de3e02ecab0183ea1877424036d858bccf0ca1b5241d04ddcd79474a7fbe1960e258a2ed2	180be8afde07be71	2020-07-26 12:56:39.629018+10	56	2020-07-26 22:56:39.628709+10	41d097b9
952ef81cb64c1f8d7cd9602d20ab6565adb87eaf1959084d3311ed86d36209cbd30fbbd9e7be13a51d128ef2c47a5b70c876e2a9f0f855b933320c1f11d582bb	b542ac79c1a9db5b	2020-07-26 12:58:41.271757+10	56	2020-07-26 22:58:41.271386+10	82ca2c4f
7687e4c317174048ac0f6d58d0d23494d5016bb28271a3e057cb63f4356dfe142623e8b03fd10ddf63877763257e8b4639e4423d4cc1e499dada9270e8cf4826	ae7daffd2467739b	2020-07-26 12:59:29.804938+10	56	2020-07-26 22:59:29.804612+10	10c85517
ce61690dd9680aa7e66705e8c7a6e177e14c662dc2678b09083c2b079e8752595191c804193556e1c8b616f3fb3d41d373796ae8b907fcd1c8b189b80c2855f9	ed9e985b914f7e76	2020-07-26 13:02:43.414547+10	56	2020-07-26 23:02:43.414229+10	9bed9913
656027fa69f7c70b999263883114138a37f9a8986d3111b2ceec78192bb117cf14b25620e60094eebd11b0ee4a806606d1153f239bf316db6e44bcc0819b4dfe	24ddb94f898d9534	2020-07-26 13:04:29.409774+10	56	2020-07-26 23:04:29.409455+10	f6805ca9
02dd515029c9c6408d6c57dd8a2c0dc48861f9d92468adfd68cfecf158c6ea3710c244e59183e438aed726ffb5e953c97dfb7739e63021a27745056f4e7d32ba	f1c7ef6c8817d785	2020-07-26 13:20:40.384915+10	56	2020-07-26 23:20:40.384486+10	ae3bce26
ab77d83633c821231e989171748a088b37ad5d6c31ed1f4f7d1df2fee259f0d865d563837cc43448d087609573876288afa16da5b5c89a7b0b8b80fb39fc088b	580cbbb7995283d3	2020-07-26 13:24:35.72202+10	56	2020-07-26 23:24:35.721617+10	139f4d01
4fc4f6e6fb7587d82c3890062d4f6079bb203a98f6fc69130ad10611542b3ac672cae2aafc503db103189bd35dda21dc0f3bd3d6671268b2a1f7e9df4cb8be91	8dd7fb1316aa0c6c	2020-07-26 13:57:29.108009+10	56	2020-07-26 23:57:29.107584+10	53c62d7d
75ca3448d74f46241d0f3f023ee166bc96bc2db4a614d519bff108dd12293cb051cfd802bd5efe8e6eed791f2680f5a7c9a0fe29a5bb35d4950fa59a97726499	b4443e6dc0d73b11	2020-07-26 13:57:40.006087+10	56	2020-07-26 23:57:40.005761+10	5d267889
f38d33a62f55826d1abbd39d23461d561b6b798ff7bcb9ab13913d195353f2db233f9d97d4139d5f7139e3c21fd163b557f23f3326e8cee8328d9fc5a73926cf	18e5a40a2d495554	2020-07-26 14:33:51.692747+10	56	2020-07-27 00:33:51.692209+10	e9703e1a
64d4b87ffed9076a3b49ed9cc28b24b911f6f0a85c4d658430c2ee82d8e067de7e331ac5961c7162a44ec742b0ac879ef4e7c71e5994f03829d6721ea1b117bc	3beac59d077c9769	2020-07-26 14:38:05.023139+10	56	2020-07-27 00:38:05.022806+10	e7d5132b
31d36b58dfba887f1d436efeb7ef97e028714c856fa9e8fbab623450de1686b2cc8fd1b90e9db5bc50dd8f12677b5dd31b158a1d6e88fcadc73d4b7b96f9e7c0	13532e543bba4c36	2020-07-26 14:40:23.427923+10	56	2020-07-27 00:40:23.42758+10	36a79e02
c8c4bb8c0b560fd0261e5c04cca6731641d234fb207f30d5a19f9f6eeb4e6736641a093e24f585294c52ad9ba38f915ce72b5057ae21d126ba646580714ebfbc	4754d113295c082b	2020-07-26 15:51:01.978232+10	56	2020-07-27 01:51:01.977897+10	db4673a7
80121c66641945d041068bcddbf26020c42cbf3a94aa90c2799ee71d0a82a4b176ed80e88a92bb498ffe78fc0bccb94db41992856442fe0d9a33e75833ca6eab	8bc5573cd6777772	2020-07-26 16:03:28.135382+10	56	2020-07-27 02:03:28.135026+10	a9b82992
8c923c1523b7eb72aaa471aa2eaf797258490a21f7a69532b606a17e724f18060c4c2242e5e1ab4aece07de4b56c9a1a50e2aa08850163c873f54ec28f381700	051391253bbd659f	2020-07-26 16:48:32.213537+10	56	2020-07-27 02:48:32.212931+10	eaf5a05e
00aad22a721416d3e56837b9b60118fb13dcc22f70e3085ab07f50409544523f861df8ebd0ebba79d5b09c5a1f9ca7e43fd88f34e7f2c524d5047199c3b93718	4175ff10afacb7f2	2020-07-26 16:49:16.999248+10	56	2020-07-27 02:49:16.998907+10	5a7a4baa
7a214335595a1c724cc7339fffd0b55293e045a70545a82035566d689e6367196cedfd9553eaa0ec20d9c2bf0dd72800ca1a008b0cb60086652f612b6f706a6b	bc00177702df07bf	2020-07-26 16:49:41.132429+10	56	2020-07-27 02:49:41.132102+10	2bfa7592
72a637f6262f59262116ab7b5e6923b854fa679ace8b905e078b4f01618c084921a257b5495c395cc9125e0a166bda9761a7c02a058f40a584ff671017236ad2	91748fe67a938b1f	2020-07-26 16:50:30.384832+10	56	2020-07-27 02:50:30.38451+10	9bbbb468
505006607ce60e2397bb30a802a995fc4b19072c677b6afefaf9443bcd851ae02ae9b692d1650a73c6fa3c3652f7a704c349e60ac5a896f9cb0ee552a88f6b24	09365344d79e615d	2020-07-26 16:51:32.780385+10	56	2020-07-27 02:51:32.78006+10	5d1c4dec
0ccfeb42b0e9ca34a3841385c1fe83665d044efae54db5529b92bd55e6b063489f553b01a8ddf9735b8c0627f077723ff88cc04a4d81a5746f4198b483484319	7c70e0f03770f798	2020-07-26 16:53:38.702782+10	56	2020-07-27 02:53:38.702301+10	03404abf
1a84a9e4adf0225e20c082f77bbae8543f7847c295cb85038ebf2e6d1bee9fcc84a9eb31f0fc8ef5ee3e4a412d5397c70ef1483b6ac9823b6a9411d003f2b5f0	08b992ae16b26793	2020-07-26 16:58:40.024529+10	56	2020-07-27 02:58:40.024031+10	26f55ad4
5b3f5eba8d745ff5ca358fe17975f5a7e8263fd7e2b5262dd64adad4c94e604ec00665d72fe2620747385ab3718083c7aebf684fb02dbae9c40102b1dac3819c	2a23f2e898800a66	2020-07-26 17:00:32.276275+10	56	2020-07-27 03:00:32.275777+10	41bd19b8
2013ad51765c4a61bb3aa2d319cacd97443ae21810c65e28ba3b5360ac9b1c8107ff0fe26adb308a451b25a6656b4d9b7362c18b2088abc9d366ec09901db266	c57e967d05ac60e6	2020-07-26 17:02:45.498562+10	56	2020-07-27 03:02:45.497833+10	b9cb7eac
1f86b9b79696d60ab00aca16f4a7f9f8b876d0e21b8c516531e708024ac28c84e182374f8f3478a64d674f80ec2b73b1291b50eb190287818188bcaa8a7cc228	5c6e1d6e0c3ac583	2020-07-26 17:27:53.493031+10	56	2020-07-27 03:27:53.492613+10	1a58ad7f
8956a4be00164477ac8dad9ee56a01ec0539738f046285126a5c73f22ce8a55bc7d77b4cf5a4e40ddc2a6fc07d7d3fc83252418ebd15aa7fde939c57576645c9	d55349b716729bf6	2020-07-26 17:29:53.063894+10	56	2020-07-27 03:29:53.063355+10	14d663e4
3750aba12f9d4e116fc2ecdefa920eba062d2f918bfa469eea568042cfe621a247e6b1e66c30e68c3133e183777663d33f163af484c8dfdaa556fd096cb11cee	dcc1c5db24b5d028	2020-07-26 17:58:39.328859+10	56	2020-07-27 03:58:39.328385+10	5d4ba68e
6bb5933f48a8ede0fe23cb8f7953e5c3e2cf241f6935c0bd3011e391897c78b3b651aea449b194e10ffdcc38b049e112ed48ef72f66e071fa56d5dc03fd88fbc	a53c4db14fe44e5a	2020-07-26 17:59:56.86607+10	56	2020-07-27 03:59:56.865615+10	87317ff4
dc0de711c50aaabf8be440b4186afdf09abdd5ea36ad2997137fadfc95c19b9a97faae53d3c9ad600a83a45db6d32256ba69025b6ff4457df546d0795cea925c	e47bbb455e0ef879	2020-07-26 18:03:29.98641+10	56	2020-07-27 04:03:29.985981+10	8629716f
44a87d6ee9173de91b456807851975b17e4b9f0bc681fcdf09c35afc22ff67b98251df8fa617c8bbead28732fd3c3756085ecc4fd7afea91468f7c4dfca59707	37114e413e3c8017	2020-07-26 18:06:06.528557+10	56	2020-07-27 04:06:06.528164+10	8952fe10
72372633fe5bd5b8ffe7af8f8cf28c4add2650b5e57885cb016482ccb41a46c66c69a8e2a549fc113f9336b1cd20cab351801cda02810ac321e549863adaba0b	c6b82c8b98c81d8f	2020-07-26 18:08:31.95287+10	56	2020-07-27 04:08:31.952559+10	f2e20432
72b6f0f7506731050d28fc9dcbd61f38b9ab70b466e9cdaa0d78addd7b68a4cfcfed3197a8dce97ca3f473981f171b492d56e7d203f45f17fd18e6ab703d912b	a6d83d792db7ba1f	2020-07-26 18:11:18.351251+10	56	2020-07-27 04:11:18.350828+10	e6f71cdf
96d1772b693dfa8e8a16ead259927bf7bcdc7390081d5f1a328746f9831c136be464aedf4390aaa26e0627d780dffc1bebbab17690615f6102f249fb859ec841	bc8757e7e2937b38	2020-07-26 18:13:49.713974+10	56	2020-07-27 04:13:49.713629+10	f7816790
6e0c8983d31c392da10fc7853091078fb806e74ef61dedf167e9738a8330cf9f9fdd7cf22e57180966007b06e57bcd0c164a0afb4ddadc52ef6612651e6695ef	35d4de4efd46f72c	2020-07-26 18:15:05.32579+10	56	2020-07-27 04:15:05.325389+10	52142bc7
952e9b2c23a34963630c89a82d7f652eb0b1bde843028de35de7c90324fbad029155332711b6b4559d3d626c3659617fae5abf7e682a43bc39c934fc6fb2c9c8	181385515c77ce6c	2020-07-26 18:16:10.768873+10	56	2020-07-27 04:16:10.768512+10	d5316124
2d2b60077a07c12083a28f4a89836e6bfb9360e496a1011646ceda71827de4cdfee8f06cfe7ff7d9d99459d6d8338299a7674eb3a518a821097b548e42a3acd1	c0b3c0db4924e801	2020-07-26 18:20:31.982769+10	56	2020-07-27 04:20:31.982423+10	ca56b59a
1978109a22234a990911fc537458cfef59801334cbcbd5f8063ac197f18cf01655a5550081885a81c846cd2a801c18032b51652d3686306ef1722b1c7f77a5bb	2b4db5808359eb1c	2020-07-26 18:43:00.023351+10	56	2020-07-27 04:43:00.022735+10	d4a504f6
285821d6ee9575ae93643591a06427b2c5f86d67699e254371e4289f70c89147bc3be838a61e067f62a4e02aab0e58a9498060f268e092de42748a43cc86068c	c9c3e0ab985a469b	2020-07-26 18:43:46.784232+10	56	2020-07-27 04:43:46.783903+10	06e5a288
896167881784f23c7ba57299063376ef817948719542aed6de473c8f458007735fa84e965dc00482b59f59ad9210e7b2bf40bb2a08571a393fd05d392e545191	ba76a6a4c7c2ba90	2020-07-26 18:45:43.1867+10	56	2020-07-27 04:45:43.186295+10	0fcf7a59
34d4b13796bac3c9c720cc39ae39b7b691047d03d2f050d6c9c10aebfa8080712254947070e0031985fbda88b19d35774e86ba8424937b541a17261495c3933d	29084f2daa611823	2020-07-26 18:49:45.218694+10	56	2020-07-27 04:49:45.218261+10	2f283106
ea66fe32da50cffe52bddb08fc451bcbef9c921684d27e58895b27cd68dbebd6a1722cf8aa56bc977609dae8946a3a7fc1ce2edb693733791f9b87d5056bc7dc	080cef6ebbf5ab95	2020-07-26 18:50:45.943583+10	56	2020-07-27 04:50:45.943253+10	237cd9c3
5985dadbee509abf626521f953d25bf8a21352a1093d227bfd02c50477b1df797396dbb4c181e43e241a5cd0a0866257ecc2c150596d3aed5d6464cbb93b06b0	01bf5a3c79457508	2020-07-26 18:52:29.150365+10	56	2020-07-27 04:52:29.149977+10	7d32cdb2
361ac5d78410f9d541ef326ffeb50fc667120eb8eeb50a6ea03586b1edc8d2805b0ca22c2db4c9ea1afb85960c92ea8e0adde8e8ff6c9a2e6bf66dbd837d7f5e	580743103a7415c4	2020-07-26 19:05:43.138249+10	56	2020-07-27 05:05:43.13786+10	1fc8362c
6ad63cd543a97037d2cc3130599227bf3fd2ed69ff0f9ff6f0e3cf3ece6178793ea18d8a4528f771598a4c0ab9bb4f9b3e51b4ad1d98c4b8367b8c812d55e49b	03e803ff4e06581d	2020-07-26 19:06:31.072939+10	56	2020-07-27 05:06:31.072622+10	9e14acab
fdb8b9f44db64aa0b5a501070eade8770b5c28e68071c8116004f8a362b42268e89ad2e945e7ed611a89f1db0509ea3f68afa9747fd9bbc0f2da82409b6b0020	0ed7f560d5396316	2020-07-26 19:40:58.286482+10	56	2020-07-27 05:40:58.286096+10	0bb0b574
71a3427374973acc0a8e3ad6a0c5688d5dfd21a1bf320d8b91602f5403b9591a091514f5bc7cf2b499ff3ec51654b26135892996e37c23bbd999f2bfaa978f35	e09bf538a86b518f	2020-07-26 20:03:24.263292+10	56	2020-07-27 06:03:24.262961+10	85380a06
c4d6e69ac177c97b9f17bf69012aa5c5d7a252cb0c8b7f78395a3a9eb5ed5e086c1060842dd1a45e6ea7d554365c9cc511004d7589dc780d12c14b1d8162dfe5	ad9e036dda34e9ef	2020-07-26 20:05:38.469916+10	56	2020-07-27 06:05:38.469606+10	fc03206f
f1cffb14050601d95963b35c6fa26bd05a298130956b53d4605e16e642a7383e9d9085040106eaf84a45a2f54f055895c9cb94c649f7cd5cb90a07b99b55d772	09a6f3cb9eb83f6d	2020-07-26 20:06:49.675303+10	56	2020-07-27 06:06:49.674999+10	0cf37611
9d9901288c58a67b37db125d4e798310a4afe3687306bc2f478d4606c96799d5bc74a53f6e3a52f20022547d0f957d9b79849d7aa43df6f5529e4eec6d2376dc	f5ad6c544b07d8c3	2020-07-26 20:17:24.017814+10	56	2020-07-27 06:17:24.017406+10	0edf9fae
c243ace4a5cbb2bfaa4b4c888ce2bf1d8658cf78010dd19407b7deb20b2052fb5ac108e346ad8bbf2e842ccead24a3df506b79f83ee28067ba405f0e7456c850	2a5392db8a8d1222	2020-07-26 20:17:58.051341+10	57	2020-07-27 06:17:58.05097+10	2b28882a
c233d7f99179d2f8a88cb5b32f83366484833f0ce7785553fbc190c8afc36c0d2c8c72ca8eee9c6c0f603dbe6351e0c910d18238ab2e74d0d84449d0c5d09e03	ffaeecb0b631c719	2020-07-26 20:58:19.163447+10	65	2020-07-27 06:58:19.162475+10	6614255f
b8572106d7fb2dda123f85e031746f90d6ae003190d023925a0557b3a588af2f9943e7db51a65e901db8b73ca303315f732ee2ddd8be6124b91d00736553de83	27fcbb9e4a4e6ee4	2020-07-26 20:58:51.285418+10	65	2020-07-27 06:58:51.285025+10	55a5a396
4762d8ef017fb956d60b198e5d6ebf69ecb51251cfb19a89d5396d9ae9cc59ecb028e06eacc74c6ea8fbfed07cb03f59a1cbf00fca933c134b1a274a86464832	b16c5f09ee336798	2020-07-26 21:04:16.146262+10	56	2020-07-27 07:04:16.14549+10	e5d4409b
fe16ee67e8e3620c4731ee5ab4fa6cff56d8ac556fdcc06679bea7fb170c2260465ac60491e1f775a8485d15746c2b1cb459ef13b0b9efb6597312da5ed7ade2	f36a8dcc23a8fe9b	2020-07-26 21:35:01.958892+10	62	2020-07-27 07:35:01.958561+10	c1f91708
fcbac7b4835cd36e6b4a343f93a749fadc8305f8693ce47506c302ad2ff6d2f0ba562c78275a0030bec6c6fa488aee89c9c4206b7a778c328ea5e733db45b544	2e8478e137a9194c	2020-07-26 21:58:51.799648+10	56	2020-07-27 07:58:51.79932+10	c33f35fa
ed2be4d8f612b238689e343442a104e1b10e15d8dfe0c0b9decae64f78a0bf0d712b521efa11b3d4e3d3b96dab06c3a56597bf47dab3eb70d45cfadb2a507185	073165d69c6e44a3	2020-07-26 21:59:31.545953+10	62	2020-07-27 07:59:31.545563+10	2537bd2f
12fb1c47e1b11b49e65ae35b9d8855949bfe87ee176a5fce75a4862088ff33d0d0847f8cd1fc181a0d695207499edee8e0b3b11342df777576d91bf17000cd47	2c709b1e347c30e3	2020-07-26 22:03:01.889986+10	62	2020-07-27 08:03:01.889664+10	12ffa876
61959e5885718907e97e8ceb5edbc0e341cb4664e16df612dc4feecb3e6a559dd5b7b43f4fd45946d83fef7aa006d8fee03a0f91afb2d9a986cae5ef22f8f127	7de315c9037a7644	2020-07-26 22:08:51.238108+10	56	2020-07-27 08:08:51.237726+10	29e0ab37
0dab06ab4d48900e0787b34f774f9ea3869db521c65f0f934f8e021c2ac7556511a50e552693dce6156de9816fea8a0caca7cdfcfe06403c8ed7440fc92dfb14	9ea599609ded4a1c	2020-07-26 22:16:19.566012+10	62	2020-07-27 08:16:19.565647+10	29307589
1dadde8a326f89330d2d6c88e3363280784ba36eb4dbb5edd723873ea67de934225d7ddfe88359296bc74987b13b8a3b53fbdf67831cb47ebaeee281e56e1ca9	3b3513f978f066ff	2020-07-26 23:44:20.798944+10	56	2020-07-27 09:44:20.798625+10	5d4f87f6
1b343a72790b028331f5d8e09c310d91b79307df6f90d0e3a89bb8f27c7d99dd0f7399906e53ea353cc1f5e1c333b5db1982a4a0e9262916d11b9d0607ff4519	b49d6a58077a7ed0	2020-07-26 23:50:37.231591+10	62	2020-07-27 09:50:37.231259+10	d4b70de9
a3eeae52202b66b4fdd5c2b4f8aaeb0e1ccda139f70da73df167be5636b5404d3f96ba719b43cc47eb1f173c9df4807206a709e49d01ac759ca9321b99f29aad	0ba68934dd735d1d	2020-07-27 00:02:01.705245+10	56	2020-07-27 10:02:01.70492+10	c78a5891
4f848b31dae077fe11aa40a70fb92753b0302dfa7b429e66a94853490b47f7a266278f2fa3afc929373ffb165030121cab32c0b30e7e00bd1f1f869ebf589072	b5d35a9be46869a9	2020-07-27 00:59:25.68733+10	56	2020-07-27 10:59:25.686966+10	e6d2e15c
9d43fdf30a8a0e69f442f4857d5f6af276973e4244b52af9b04ff6b65e9edb053886b8539e8c9e4449cabcccf44db35cbcf701c1fb0eb3908e30c5a249e0887e	73f62d183b68858f	2020-07-27 01:02:14.965519+10	56	2020-07-27 11:02:14.965104+10	12d1ba48
3a92a45ce6a019f2ea5979f3fa7b1f36ea7faec4438d066a95df91f886eae9c23eda65b9fdcad76ff53cbba6b4e66c35568a2e0126bb7b5fcb1d7a78a5e26cde	4c13ead71e9ac861	2020-07-27 09:13:54.601852+10	56	2020-07-27 19:13:54.60153+10	f2822956
6ec06bb7ddb8a2653922b2d709dc154b00e7961abbba7f18c3a163a3337dbdcd5c638850b676bea5dfabbcc199c1bc395a333ca042b14f7a708db00f010730c8	554b9e0e02f54602	2020-07-27 09:35:24.285793+10	62	2020-07-27 19:35:24.285471+10	c6832453
03e497a2ca516387a14d315b4f60718757890e57d51adb76601634c4b2cb2d341db4cafbd938bccd3d42f1f3b3a8ff08e842546797755d570fb0aa904cfbfbca	8bd6ed63fda45871	2020-07-27 18:52:24.289456+10	56	2020-07-28 04:52:24.289138+10	1b6c9354
c31568c39192c565adb36790347e2f90aa8b9bf2691c8c4747eed33013561841b4fe690108fa348fa931720547d14a3c18d13e2b3ad36fd012608df60c358396	d79bef14bebdebf7	2020-07-27 20:09:49.405111+10	56	2020-07-28 06:09:49.404707+10	aa55cd42
b8386967cc73dfd1f347d043266816889a36404b8785247668ad724791232774e0a5c0b7a97528f1188ddeb0004c99599222cce0bf447fca9912b76ad1bc4edc	ba0de498c8201122	2020-07-27 20:53:42.418467+10	56	2020-07-28 06:53:42.417858+10	092bf779
ff7633575886140961ad43031fc963a593e0d729ce5c0c37674300021cde351700729705f4d1af579b1fcfd04f3a218c66322e5da392f53fc4c229ebccf2c74c	cfa62539130d480b	2020-07-27 20:55:06.554751+10	56	2020-07-28 06:55:06.554343+10	45c8ea1b
adf6eb4425884d89ad25fd23f873f7da029199acdfc127f4cd74891d78c57cca9a169670b767eff2c487fdaae8422dfbc19acc67e5c25bab050d79f32c136a9c	61da3ac5ab3a465d	2020-07-27 20:58:47.862788+10	56	2020-07-28 06:58:47.862351+10	56a037b6
4279d419f1f2f9ac9e74081d5b41028ee5164163fae45fe994259b218703055f380be7d677abccfcd735bccd5a7c15e00ca48c8336a9ce849b6c552f7ff56b3f	d9118d8c4812cf94	2020-07-27 21:05:57.286446+10	56	2020-07-28 07:05:57.28612+10	9e2bde64
a834e6ed8c631ea84931bdebaae6304658aa21842b51045fd50d7e5f77debb9b1ec8851cd0bdada14ce4d7403e17f87c22d9757d7103cdbd135e9a467045e3fb	f447f2e97f0adb8f	2020-07-27 21:09:25.725829+10	56	2020-07-28 07:09:25.725513+10	e8b757c1
732b2ce50e0c7e918c877016674a15ec0b3dc29ec4b32c802f5c301aab28e9ad25b6444f4086285a887f2b7ff15ff1c9f17d55c1a6479afd7764c6654cc93880	7baa39dfc9a0dbe7	2020-07-27 21:15:06.85825+10	56	2020-07-28 07:15:06.857852+10	8462f470
eede66cdc559a90f6b90d9e98067cc73477ec4b9d06c88a7ec7b8876dc903466d967a72f5ecceeb972dd84d9b6ff918ef0a1f6fa39c3024dd4fbf3d36eddef07	b88631cb463f2099	2020-07-27 23:37:27.144188+10	56	2020-07-28 09:37:27.143771+10	8245943d
71417ab2f9667e3f996ca0777dc5b371d7e1b41a3a2c8242d91d8de5e9a403c059315847432c90fd4d3775d541c610d518a5b25675d3acfb2f90b0ce05f5a9e7	70fba32a2d8e95ec	2020-07-27 23:44:21.867459+10	56	2020-07-28 09:44:21.867133+10	71dd6138
a7fbb0570d51f556d99a94bd4c36df97e86b977e4486a075507835ebf9a02b4105dd5761dcd56521b14a1ad99d70b8ca57b72071b25e1b10b41435640053ed2b	c237fcf6db614707	2020-07-27 23:45:04.479608+10	56	2020-07-28 09:45:04.479272+10	e8756a0f
93036b041d4f9b3927c3d692a818f8c5aefae1616f9fdc9812f84260b97ecfa006aac23e53c598501ad512e84ec525cf76cb9da79a13eb270a28093c513ed7b8	e0ddb284c9cc148e	2020-07-28 00:39:52.737409+10	62	2020-07-28 10:39:52.737024+10	d4196d81
b07e91147534e6173bbb09c2f34496d4e137d702a063c767bbc0cbfa13f0022e905b79cd43adae469afcc961a52b9618626b458bb2e6e0b825a4cc8861642704	6d6dedc6a9d39432	2020-07-28 00:40:17.540599+10	56	2020-07-28 10:40:17.540278+10	742a6210
718e63ff0d600c7a705bf5cd43a565f50ec27989e6f8e4b9fe694f55f56ee2a88c5319a14d696e5b9385a42889d2c4c180a2f07dad5412df5665179f468ed7cd	38f7d8d49ac325ed	2020-07-28 01:21:14.301836+10	56	2020-07-28 11:21:14.301182+10	ee75f5bf
1a8d729276bb05ed79716e2bbe54d1fc4fb59088e66a02acccf3901b22e192ff3c27418a82b929a3da1bda5fca3bde955b2ac337e5f24f510e43c0ab761d0b66	243a2b7a28de806a	2020-07-28 11:16:41.911192+10	56	2020-07-28 21:16:41.910685+10	9019cf56
42c10fdf9b770a28817227a3142057963059272db21ab6e2014ad934d78dace7fe1d6fc8c31942b0f82613f1e4a42642d72cb3bcdf53e04d78bfdf2e57633259	fc677cd031796e77	2020-07-28 12:17:12.067539+10	56	2020-07-28 22:17:12.067122+10	d508f557
eaff7f611bcd56843b2fa8b4cee3013d115e84c1929fb6d8ffd8a08043e83df9ffa7b8bc72d458e61e379e8e2abe87265c051b757cc70594b0ba209faf5bb4b1	16aef9f72a9f2ea6	2020-07-28 13:17:18.984466+10	56	2020-07-28 23:17:18.984049+10	e3e03d3d
315ce15673b263b8f0d9760b3498e6f8f49428c215c23da933ae1ef21bdc3d4f742de30fdbf8d3313a153220c182215e6ab77e8d0aac02e325a0aa5dd834d565	2d43d707f52a6e99	2020-07-28 13:44:01.576913+10	56	2020-07-28 23:44:01.576113+10	c241db67
b9f75f1080e0c709cf4f5f440eb39f31f31b8609f5e7c09ab8edc6a7fc24a4b18e795705e4a247595a9c97343ac4516c8af7353fb033868536469eb5a7068f27	2187c43ab1b2a8df	2020-07-28 13:44:09.992155+10	62	2020-07-28 23:44:09.991829+10	c5c8d99c
b46cc1a651f5e9a4fa74b9e114050161051537c81e55d4329e044746d56f5b8fa74724b99c0277d891073f053b4d83170a665e598628138e02c8cd9c8b990429	109e4b146bc126ae	2020-07-28 13:44:48.402873+10	56	2020-07-28 23:44:48.402525+10	00ce463b
863cd1aa81baf1f3d88d74e346020b1774bce9cc6be0c3c33b3cc2b9d6543d4f06b94d87623976cdb3ee4f2570cde3493cfa88557315ef260e276d3b98e4c942	0255629935da3bdf	2020-07-28 14:29:21.58847+10	62	2020-07-29 00:29:21.587928+10	a68e806b
aeefbcec8aaa82dfbf5ef29e06b7d1097bc63c26fa8bdbb8bf009353e82d2211f5e2a1181362f06e01307d19d5559fe88c5348ae3beafa1a90103b641efb305c	6338840fb1cde5a4	2020-07-28 14:31:54.156278+10	56	2020-07-29 00:31:54.155937+10	f41a767c
5f79564c5b7a9903972d80ad451ee2d8b767fc9217b65d466fbc200c42cf48646d38337837a8a0c0e0d6ecec0e90ae36785bc8033150cc98705fb87c36244d7d	de8c797caa9160fe	2020-07-28 14:33:38.055055+10	56	2020-07-29 00:33:38.054561+10	4c118bc2
10faf75822c91e17f388276aee3e805f9e94e9342818e3c2ecfee259a23e317fab0fb083b8ad61fe18d06d5349857aaf4ad01fdda4cb28dfe163cc83cac480c9	a78647da0eb9a552	2020-07-28 14:33:49.004504+10	56	2020-07-29 00:33:49.004168+10	8376145b
8fe86668c765633d41762b84a0797ac5006ddb7f05fcd489e63fd4d499b7666cd6ec6f20f49ffb153fb58a594e650daf5247c1beff13a146119b739cb5da4345	09fabc656a095b25	2020-07-28 14:33:59.72684+10	61	2020-07-29 00:33:59.726506+10	d0aedf59
0bf2ccf4f3ce3c117b39bae53c976423ac388fb82c20b0c2fd30e04ac90c920abe0a983e3b49ce49fac726295f31d2b9c26389ccbe08ca118fb44ad7bac4ad8c	35c2cebced0ad6a3	2020-07-28 14:34:15.542706+10	56	2020-07-29 00:34:15.542348+10	7bd8325a
dc3b5b04cd94c10953aabcde1ca8702b618b79416ae61a092050887077de227616003a3dce6a53257fabdcdc31a8f16a3eff997566eaedcc7270a87787ec3e5b	7429f34f43699d26	2020-07-28 14:34:36.871199+10	61	2020-07-29 00:34:36.870838+10	653c52ac
b56940fc5221ae8c46b7bee2d5ca0071a788089b4acf45b8de2f12438a21ea569d380732df11328e90b683e6fb5ab4258c0fd51848ae140d1e38451c2f99d5d1	a4f0e3a71c737251	2020-07-28 14:34:44.253468+10	56	2020-07-29 00:34:44.253133+10	71d10323
82f0714b1e0f52e03dc8656ddbd03201a90818caf6e0a2a0e1175639d811555beeffa9e8c09b0d0465502bdb564e14150914f1947f05aa2826033c05ecc76e3f	76ecdceea6604f5e	2020-07-28 14:34:55.66572+10	62	2020-07-29 00:34:55.665363+10	1b491b31
d5a977c2b8dec683060e8646bff405504b76331f9b2ebe7f4ef31dc74afb11cd559a7393d811ca035d20852b5037d1a43842a5aae91b37a6e2d29891a96b9c7d	7bcf9ffe72204c7c	2020-07-28 14:35:08.229397+10	56	2020-07-29 00:35:08.229033+10	5cb57166
d81710bc08544b9a6838e1ef77e5e125cdcba1c72de0629960c8880c6eda394165ec79a09b8de4e73924a841c8a48bfa545218ba416c2a5abe22cb9d37acfb01	14a894895f72b9d9	2020-07-28 14:46:11.804667+10	62	2020-07-29 00:46:11.804244+10	65d24766
e4b8730c59afe6b565eda10a3ea21f489acb602e1ee31937678d96e6b3810551c36e76b48fe868c227e36969d70a246b39ae3a6d5fc8f81de872f0f0d4975e81	8aaecfc031bed684	2020-07-28 14:46:24.411575+10	56	2020-07-29 00:46:24.411242+10	2cc07445
7fd1a647bfb15889af595f3e0f7f6f11b8dbfc7ad1ff7824813b3f15548d8fcc207b056288f08f51bb9a7c9ea48f8a0e66cb308d63474e67d6b951c5d1189874	1029d391153b3588	2020-07-28 14:46:36.3386+10	56	2020-07-29 00:46:36.33824+10	39007d33
51feda1523d3590d1c3ccc748887a5c57a0b3316026b42d0dc9494523256d71e3629d29c62e949461df8db624659807d95689a12dfdabd62a83f976665d8d7bd	c488d7a04e994c6f	2020-07-28 14:46:44.828671+10	62	2020-07-29 00:46:44.8283+10	22183d13
0366086c43fbb508211154b932f93371d34e0ee3161f38f82bec3702f0242b1ce4670381dbb439d9e8dfc8eead3c43683bc40a613e667f3728cf71f42a151433	4610c206087789b8	2020-07-28 14:46:56.817893+10	56	2020-07-29 00:46:56.817557+10	e5110772
c70b1a988beccf04b013e048588075c76dc8b2e9abca2a1b9869a3f463adaa7e2df46337cd6bb5a2f61154e2dba4e7f87834ee4efacb4b90e2acb0ada166e263	ab1a64bd3e3795c2	2020-07-28 14:47:11.399296+10	62	2020-07-29 00:47:11.398963+10	de6559d8
69a60cebe4c6cc4eb12ee908b651a5e55522454ee909097c9aa8b2ca61a364dcf6e7d5f7b392e5ab7fbbfa3e7ef2e2f818d5a5daf1f027c007f5ba7438263b04	6a008e2536631ebf	2020-07-28 14:47:33.271723+10	56	2020-07-29 00:47:33.271398+10	f4ecd287
b6487b4dcd04fa55b59fb479c472816d85948349fe74d0353544034b75092dac9931bd10453c68966aa21c66584897c3127d2ecedc319deeae1d946483febe66	36aa60553a5411d6	2020-07-28 14:49:34.43552+10	62	2020-07-29 00:49:34.435111+10	9c3a2130
f2d732a787ea0aa0a18d7afea2d53867e002057acf8b780b3cb724d6c9ddbe7658ac6589e3fae2b94aa2471352eeb24595810dc8284b1e01ace7ad38a76c1b9b	854913b460ef3ca2	2020-07-28 15:06:55.167952+10	56	2020-07-29 01:06:55.167479+10	463da2ad
f3867a5dcee39b9ee7c587f809a7a7c47bd2e3865ed86fbacc6ac89a7414f3bfae95cff08ea2698668380cbc00dc76937f126f7af829b6ed2e41542bc1fd8b8c	ba44c475346f249f	2020-07-28 15:29:50.041332+10	56	2020-07-29 01:29:50.04069+10	b53c9516
e1e0c5bb8ff9bfa6ab3f5b98b2443b47c60b1e9921f5356e08afa1bf8f19eda5a7a095ea669df5778adfcc15a13149b595b8787f74b0a07ea2727e08dce532ca	0b99658756f0833b	2020-07-28 15:46:13.456938+10	56	2020-07-29 01:46:13.456506+10	3151a84a
546c8b43c2984b0de7cd61567b21ce3de767b5728f7a5cc107f2c69b655a0e28d916ed83d8e34de791f675f5c635d6c85341c3effd91b51d61d6e621328e32cb	d39234d744bd904b	2020-07-28 18:15:25.151896+10	56	2020-07-29 04:15:25.15157+10	559d7985
836a42965d7f5eb51ed0bbcbf6d99ddb7d66ce451f8dbc366179cf0c55fac89a10791bee7b56ee469c75d423bb1b510e552fd30479820d7250b500b41e928c73	3a219e6c5c06f8fe	2020-07-28 18:21:47.115575+10	56	2020-07-29 04:21:47.115176+10	268f22d2
06053518a545e23e1752ad373bef58a8767664d565aabd95291643d19f5e02d63f3dd5f28f15a5e1810e0f597cdf1427892e0b2a9f123b50efc832dc653853f5	f8782204daaecc7a	2020-07-28 18:48:46.98375+10	56	2020-07-29 04:48:46.983429+10	415f28b7
c63a12f209c53c1a1c587720c65b40ba717cda301cc0e016a13e1fd85c16488d0cb736576ccb5ea372aa90db74289905904450a1f7e531cbd0140d5c4cc78579	a6c9214d3113e281	2020-07-28 19:28:45.366404+10	56	2020-07-29 05:28:45.366015+10	ede060af
6091f72106810fa616da1e25f554b0bd7a3064bf56c39f1c7b4c565c3943b3b2cbe989d2f888b57f501e02b728fcc5fecb23f88e02f8cb6349816adf6cb1c70a	40fb7a39253333e5	2020-07-28 21:20:57.260618+10	56	2020-07-29 07:20:57.260298+10	ffe0262c
2d60d70aef2f068a7fed1d20356f489e2e589cd0c85d0f1fbdf085c862f164dda09445c83a2b4c9642f6f725c080105569375ae1f3facdbfe56dfb0654cfa257	03722ff26b18560e	2020-07-28 22:14:49.907668+10	56	2020-07-29 08:14:49.907335+10	8191b75c
aa8e4e7bf1cde85c7c4a778054147b815e9faceed6066c3b8750bdedffbded73db5b621345d94a51e0f5a327aac0c6700ce49e01c6604073f38c9838104bfd39	221b51a7fc5b28f4	2020-07-28 23:03:25.772251+10	66	2020-07-29 09:03:25.771809+10	6e83a7a1
a5aa70846bd9d2abc7572d89918880dadbaee91ecc11a056313dfab60f17d5b62acdd9c0a05d3eb32dd480790ed340cda522a6c143a207d803a65dd69daf1e63	00325a85add94719	2020-07-28 23:03:55.030093+10	66	2020-07-29 09:03:55.029691+10	5242d32a
70c6d49865158c344abbd729862666fbf16b084efe97971124f0329f7c0ec8c2d2b0b1a0a0cca368f7f35b9c8b1f28d5999236e359cfd23b3002b46c64212b9d	5c0f03b737669c48	2020-07-28 23:04:27.698503+10	56	2020-07-29 09:04:27.697993+10	7acf69fa
2ef6ed5ccabfb46b05392c35ebdfd871ad3d33c2b36094fc23fd0471269f21a71cad53071fde6df4f97be57bf61db644c781080d4052ea2cfec1bee9ef083fa5	2c0e8ed33db59f96	2020-07-28 23:08:11.43645+10	56	2020-07-29 09:08:11.436122+10	e2a5ca59
a2766c60445b825e8687d468e2866156cfffd0663776a2977729e496843046c9a2593853ef04e2e21f753db7bae27cb7a49e933eb09c23cd7f2aed849efedaa3	3e216229d03845c2	2020-07-28 23:17:09.750655+10	56	2020-07-29 09:17:09.750241+10	06494b3b
267a5f3322cd33dc9981810943d426b9359038952fa9d5f88cc85f55b4de7233f5a179f08e5ac5ec3b1c92b1762ed5ed65784497702828117d13bdb9f75d0f89	063bb8cf8a92b7f9	2020-07-28 23:18:20.038133+10	67	2020-07-29 09:18:20.037726+10	84d3e87d
ff36777932f7fa8f6242f179b49903de4b3775f4fd692f83abffa57488031111ac9834d333d26537afecb86a4130103c7b614c60652e9697662a34b6d8d908f7	ce615035c03b65f1	2020-07-28 23:18:41.526682+10	67	2020-07-29 09:18:41.526354+10	65f9fc59
a09ab0a2678699382c190fc103bb6ee5e2dc00b5cf59f5c155d8ed02088dda406b6133c4e60f2ac30f10362c30d6928c41726f105dd91979072ea5d41cead1cd	e8c3a31468cac2b2	2020-07-28 23:19:58.596344+10	56	2020-07-29 09:19:58.59596+10	e41bf310
7f7ae467584c23e75034379da9ecf7037f3071260eef85d3923fe414b6e400d64906724cf4e90b8c697e412db63acbfaa74ff6c1c5878359a391f5e5ae63e173	deb94093cd0d30f0	2020-07-28 23:22:56.156505+10	68	2020-07-29 09:22:56.155519+10	062f09f8
00f8cd0d9510267fc8cc225390606c5e1a00df3903696f52bd7913df45a90bf4481b95070f234cd6ae8e3683dac8d54a2f8ee2e357b1b43b0d1e78e9315d2456	0b3d7521b7d1080c	2020-07-28 23:23:01.351254+10	68	2020-07-29 09:23:01.350938+10	d52aee47
5789d7bcc7845c9229a88c4774250a36313b7f23983a1202e5ddd026ad51d2ba12117693e880a0a31951aa2f568deccabd8d38a26919a82c91b41fc8cd31c96d	c478f4eebc101366	2020-07-28 23:28:18.415447+10	56	2020-07-29 09:28:18.415137+10	0ddabb25
df7c57a0e3c9a8d188d3ae127be7d32cbfaa8201f0eb06d4d6cba0ca2bfa2b05380e3bea0363a6319dc7f5676c97e4a529557c40901766a680d377ec14b055a1	6b83510703307318	2020-07-29 00:31:50.427296+10	56	2020-07-29 10:31:50.426969+10	0139f05f
2b29f805e5f2d928416eff8f46f6b3be2e6718831fd6a4e2581a26924951d6fe23cd89eb17f6d5c1e9f0a5e09c4d9c3c053a28a95e095dfd1d0477b096b38ffb	7596a63dfe34c502	2020-07-29 00:33:41.439422+10	56	2020-07-29 10:33:41.439102+10	479fe97a
5e177507481cd23ef11d1476e30b8cb0ebcea13ca3483ab2986f1f0f6bfd8aceca063f61cbaa94cafa1663cb10f1f8cfa31eb21f7ccd15374a60d0f395974d40	563e8283974d91c9	2020-07-29 00:58:32.60387+10	56	2020-07-29 10:58:32.603462+10	f00aa068
24fba03ba704c09c711dcfb4217bce3166273dd2af3b629269a92f6d3175c9615e81f83130a9e8bda5551cdf6652082e963f2b94d7ac03f5ab3a6fc0c53d0343	f411bd3f393da7af	2020-07-29 01:49:32.680844+10	56	2020-07-29 11:49:32.679408+10	79f87355
2db836574862e15bd53fb44e29f38d108d36ded67e5cddd043f6dd02522225b4f3e794c2664fb090fc53b2c12954419396e85d169c19efbe104bd405851bd7fb	47167b52aa3d0ef3	2020-07-29 01:56:55.367267+10	62	2020-07-29 11:56:55.366941+10	0391af4d
c0a06b775b83cd1eabb5f4b4ccdba7a44e79d796ec196fd7511bcf8c31e22ab8ee484ef82bce05c97729fed103f02ce4cdd180bbfb4ffd7d68124740c206936d	e423a316c384a54d	2020-07-29 01:57:22.411335+10	61	2020-07-29 11:57:22.410928+10	796428b0
0c9b62ebdda14135e00cbfdc3a51b553d876e94754c237464cc3b8f606f5c7c4d3b83a75c8d87c03a645bbfac611b36c55f31e1a1db00e6802c41f2de96acff3	58066e61fa94328a	2020-07-29 01:57:32.851405+10	56	2020-07-29 11:57:32.851053+10	74a3bf52
cb9ed25d7700bb0b2f231b6cc89d22508512af38ceda8266938bd465c32fb7ab4e0be7b9355916a288ac8c38ede78a61bd22540994c518430e6eae612a2dead5	3423b83d579c3482	2020-07-29 02:02:20.462358+10	62	2020-07-29 12:02:20.461909+10	f25e66af
82d5f821bd31023c82e0660790d2f9b6825d93903de530e9ca468dc942a4a76460eda508f3dd5e64402ec040c0137a0967b364938319703ce77144a6a6102bd9	99ae007fbd3525fe	2020-07-29 02:02:40.213948+10	56	2020-07-29 12:02:40.213516+10	3293a30c
6e4abf08b010a5c2c6d071677d1b3afbd03dd09e9576c866186c3f50a9e4a79d46de8407c43df738fb29b519fd6709d28abc05f18fe58a2a785aa4939b6b7ce3	fcbcf3b68f6f0811	2020-07-29 02:32:45.272516+10	62	2020-07-29 12:32:45.27209+10	c4162e5f
0c7a8657fbac18faa0cf819adf0467535050907100c0368f4f797a5eb6c7d94cc774e767b58201a6b25ee6ff4e31936852b039df055fc4419639d328cc593cac	64a0d821f3261a39	2020-07-29 02:33:18.323632+10	56	2020-07-29 12:33:18.322959+10	550663b7
e7353c2ecff1d5193165ab63b5801513f5699740d8574046ceb481914797605906edfaaa120615b96aea8e5d062c825c390d8e273928613ca341dabc5f57ba03	e1327b87827bde01	2020-07-29 11:11:37.95039+10	56	2020-07-29 21:11:37.949212+10	fd03dc42
ea73ff34718fd5d0e4245b867e08af28c2ac810d94c944add737a69232a560770920de1c24ac8b24db8bd6cd259cf3481578e9cc19abca07526ef7c9782e9fb4	f0a881efb84fb04b	2020-07-29 19:50:53.657164+10	56	2020-07-30 05:50:53.65664+10	fc6df302
6fb7e277cb5559088abc5bb3266100a9dd1d24602146c932cc1b3ff823ef17698b6fe8aee765e251bd6491dd9eb1a2e9cfd99303173bc11f0556edd2a752f939	5b51308ca043dd73	2020-07-29 23:10:09.967304+10	56	2020-07-30 09:10:09.966937+10	e9e99d5b
01d27b515807b8f4aabc0f7a0ad02b85f5cf355fcb009d33d123a3b5cfb76f622ca328e176d714cca55524d3e6731c5bbc15485b27634ef4b714abf9ba73a941	0e44843b7207655a	2020-07-29 23:14:51.596649+10	62	2020-07-30 09:14:51.596257+10	4e6193e5
d3e8b24441b559c1dc826898d81c6dcdd1623d832e66b06133f61bf9150a61e1a2825d6592e7583a11e3cd2f90f3b829653d5742d764b3a70168e4b862299c71	712246ab515cbd26	2020-07-29 23:17:34.647518+10	61	2020-07-30 09:17:34.647198+10	52f32324
b4dca01fbb64939f46d6e4404b38a59344883136b1a43192a654cb4b657478028afcf4b4b4f841da1c0a2552d5be03ebe74eecedd77c95eae0c538a78d0fe1ef	6c6f5602cfed8b22	2020-07-30 02:34:57.187884+10	56	2020-07-30 12:34:57.18719+10	7473dbbc
05c8d26a3700c84c94140913dfb4910ed9b6f175931d0da59f4af36d361136dc744fc469f6ef489499bea9963a5820acf335b4f14be549f0ca068354042f37e7	883d8c7cefda1bc8	2020-07-30 02:43:22.645312+10	56	2020-07-30 12:43:22.644865+10	26af9a2f
fdb405a561f2bf9d9ff1eab7a0638cf05a48fd7362abfc3fc9bed4fa9c741e8b959f7595b27c7e6c4d9691f76411b6d4e7c7eb3412629769879432d6a466ce43	11aa60949516516e	2020-07-30 02:59:06.697826+10	56	2020-07-30 12:59:06.697388+10	3e7f7293
275ea8e59d80b573437e469bca36c4eddda5bd912efe23b700289a91d811104e03701b01ce0129dcf7ec6b65757b13203b25da108f638df3753f1b1766521997	a42535daa264fb73	2020-07-30 03:05:00.582613+10	56	2020-07-30 13:05:00.58212+10	265d5f65
ccd8bcd0b74380857ed011297d5de2a7fa6278434f1637024d8538a0940d1d4e65830e13bf6a9be7683c11d23d3950c7bc9d950106cdbd07b225c824dcd49cf6	a7ca952a0b94d45d	2020-07-30 03:09:46.903211+10	56	2020-07-30 13:09:46.902902+10	f5a99a10
6c562a1a434aa7262efe3bd3942f57a95d99b603163cf0c5f8559c2b03575a42eda7d4a955b359b1463e314c5ff64f6024dd26cb83be7990fc40bb3975d47412	7d7ae13d07cc837d	2020-07-30 03:21:18.986481+10	56	2020-07-30 13:21:18.986171+10	80708bde
e947a32e759389e75cfc9781726716b1adb48bb35d304e54c722c4b143cf8a376ebf53e34724dfce00e90064cbc3526e2bcef5eb6021e25a6376c1ee063a60c4	4a6baad98b09c942	2020-07-30 05:14:17.312794+10	56	2020-07-30 15:14:17.312083+10	b09d9a67
4c6772695b97169703b4d09b5018932fffe0652d24fac439b91177aa1586ce00fc6820455248046b6d7c8bdfe001a34071d4038b7eed4d5c00dfa7335502e4cc	fd1ac38a25c91e51	2020-07-30 05:33:01.132837+10	56	2020-07-30 15:33:01.132426+10	b3e9359b
\.


--
-- Data for Name: profiles; Type: TABLE DATA; Schema: public; Owner: 3900user
--

COPY public.profiles (id, verification_code, user_id) FROM stdin;
1	MBngZmFfyitI	59
2	Rmr5yIzhpSdF	60
3	cL7ZJDsJ3Yum	61
4	EwrEUHIrPovN	62
5	2TenOOfzWxHd	63
6	PWegUB8xDUuT	65
7	0wzbwM9HeSKq	66
8	Y7rtuofml3Hl	67
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
1	farhansghazi@outlook.com	MBngZmFfyitI	2020-07-23 22:47:00.345014+10	\N	59
2	farhansghazi@outlook.com	Rmr5yIzhpSdF	2020-07-23 23:38:25.704771+10	\N	60
3	farhansghazi@outlook.com	cL7ZJDsJ3Yum	2020-07-24 08:50:21.298666+10	\N	61
4	farhansghazi@outlook.com	EwrEUHIrPovN	2020-07-24 10:12:01.684194+10	\N	62
5	farhansghazi@outlook.com	2TenOOfzWxHd	2020-07-24 15:57:05.510982+10	\N	63
6	farhansghazi@outlook.com	fGrlJboIvWtX	2020-07-26 12:26:58.679762+10	\N	64
7	farhansghazi@outlook.com	PWegUB8xDUuT	2020-07-26 20:58:14.104563+10	\N	65
8	farhansghazi@outlook.com	0wzbwM9HeSKq	2020-07-28 23:03:21.68278+10	\N	66
9	farhansghazi@outlook.com	Y7rtuofml3Hl	2020-07-28 23:18:15.834014+10	\N	67
10	farhansghazi@outlook.com	6nCswxVXqUyu	2020-07-28 23:22:51.967572+10	\N	68
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

SELECT pg_catalog.setval('public.auth_user_id_seq', 68, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: 3900user
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: authors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: 3900user
--

SELECT pg_catalog.setval('public.authors_id_seq', 1, false);


--
-- Name: books_id_seq; Type: SEQUENCE SET; Schema: public; Owner: 3900user
--

SELECT pg_catalog.setval('public.books_id_seq', 76, true);


--
-- Name: collection_id_seq; Type: SEQUENCE SET; Schema: public; Owner: 3900user
--

SELECT pg_catalog.setval('public.collection_id_seq', 228, true);


--
-- Name: contains_id_seq; Type: SEQUENCE SET; Schema: public; Owner: 3900user
--

SELECT pg_catalog.setval('public.contains_id_seq', 222, true);


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

SELECT pg_catalog.setval('public.django_migrations_id_seq', 45, true);


--
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: 3900user
--

SELECT pg_catalog.setval('public.django_site_id_seq', 1, true);


--
-- Name: profiles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: 3900user
--

SELECT pg_catalog.setval('public.profiles_id_seq', 8, true);


--
-- Name: reads_id_seq; Type: SEQUENCE SET; Schema: public; Owner: 3900user
--

SELECT pg_catalog.setval('public.reads_id_seq', 1, false);


--
-- Name: reviews_id_seq; Type: SEQUENCE SET; Schema: public; Owner: 3900user
--

SELECT pg_catalog.setval('public.reviews_id_seq', 27, true);


--
-- Name: simple_email_confirmation_emailaddress_id_seq; Type: SEQUENCE SET; Schema: public; Owner: 3900user
--

SELECT pg_catalog.setval('public.simple_email_confirmation_emailaddress_id_seq', 10, true);


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

SELECT pg_catalog.setval('public.written_by_id_seq', 1, false);


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

