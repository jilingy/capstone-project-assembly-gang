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
    average_rating double precision NOT NULL
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
    description text NOT NULL,
    collection_name character varying(200) NOT NULL,
    collection_list_id integer NOT NULL,
    is_private boolean NOT NULL
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
-- Name: collection_lists; Type: TABLE; Schema: public; Owner: 3900user
--

CREATE TABLE public.collection_lists (
    id integer NOT NULL
);


ALTER TABLE public.collection_lists OWNER TO "3900user";

--
-- Name: collection_lists_id_seq; Type: SEQUENCE; Schema: public; Owner: 3900user
--

CREATE SEQUENCE public.collection_lists_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.collection_lists_id_seq OWNER TO "3900user";

--
-- Name: collection_lists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: 3900user
--

ALTER SEQUENCE public.collection_lists_id_seq OWNED BY public.collection_lists.id;


--
-- Name: contains; Type: TABLE; Schema: public; Owner: 3900user
--

CREATE TABLE public.contains (
    id integer NOT NULL,
    book_id integer NOT NULL,
    collection_id integer NOT NULL,
    time_added timestamp with time zone NOT NULL
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
    rating numeric(1,1) NOT NULL,
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
-- Name: users; Type: TABLE; Schema: public; Owner: 3900user
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    email character varying(254) NOT NULL,
    username character varying(200) NOT NULL,
    collection_list_id integer NOT NULL
);


ALTER TABLE public.users OWNER TO "3900user";

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: 3900user
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO "3900user";

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: 3900user
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


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
-- Name: collection_lists id; Type: DEFAULT; Schema: public; Owner: 3900user
--

ALTER TABLE ONLY public.collection_lists ALTER COLUMN id SET DEFAULT nextval('public.collection_lists_id_seq'::regclass);


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
-- Name: reads id; Type: DEFAULT; Schema: public; Owner: 3900user
--

ALTER TABLE ONLY public.reads ALTER COLUMN id SET DEFAULT nextval('public.reads_id_seq'::regclass);


--
-- Name: reviews id; Type: DEFAULT; Schema: public; Owner: 3900user
--

ALTER TABLE ONLY public.reviews ALTER COLUMN id SET DEFAULT nextval('public.reviews_id_seq'::regclass);


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
-- Name: users id; Type: DEFAULT; Schema: public; Owner: 3900user
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


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
25	Can add authors	7	add_authors
26	Can change authors	7	change_authors
27	Can delete authors	7	delete_authors
28	Can view authors	7	view_authors
29	Can add books	8	add_books
30	Can change books	8	change_books
31	Can delete books	8	delete_books
32	Can view books	8	view_books
33	Can add collection	9	add_collection
34	Can change collection	9	change_collection
35	Can delete collection	9	delete_collection
36	Can view collection	9	view_collection
37	Can add collection lists	10	add_collectionlists
38	Can change collection lists	10	change_collectionlists
39	Can delete collection lists	10	delete_collectionlists
40	Can view collection lists	10	view_collectionlists
41	Can add written by	11	add_writtenby
42	Can change written by	11	change_writtenby
43	Can delete written by	11	delete_writtenby
44	Can view written by	11	view_writtenby
45	Can add users	12	add_users
46	Can change users	12	change_users
47	Can delete users	12	delete_users
48	Can view users	12	view_users
49	Can add reviews	13	add_reviews
50	Can change reviews	13	change_reviews
51	Can delete reviews	13	delete_reviews
52	Can view reviews	13	view_reviews
53	Can add reads	14	add_reads
54	Can change reads	14	change_reads
55	Can delete reads	14	delete_reads
56	Can view reads	14	view_reads
57	Can add contains	15	add_contains
58	Can change contains	15	change_contains
59	Can delete contains	15	delete_contains
60	Can view contains	15	view_contains
61	Can add Token	16	add_token
62	Can change Token	16	change_token
63	Can delete Token	16	delete_token
64	Can view Token	16	view_token
65	Can add collections	9	add_collections
66	Can change collections	9	change_collections
67	Can delete collections	9	delete_collections
68	Can view collections	9	view_collections
69	Can add site	17	add_site
70	Can change site	17	change_site
71	Can delete site	17	delete_site
72	Can view site	17	view_site
73	Can add email address	18	add_emailaddress
74	Can change email address	18	change_emailaddress
75	Can delete email address	18	delete_emailaddress
76	Can view email address	18	view_emailaddress
77	Can add email confirmation	19	add_emailconfirmation
78	Can change email confirmation	19	change_emailconfirmation
79	Can delete email confirmation	19	delete_emailconfirmation
80	Can view email confirmation	19	view_emailconfirmation
81	Can add social account	20	add_socialaccount
82	Can change social account	20	change_socialaccount
83	Can delete social account	20	delete_socialaccount
84	Can view social account	20	view_socialaccount
85	Can add social application	21	add_socialapp
86	Can change social application	21	change_socialapp
87	Can delete social application	21	delete_socialapp
88	Can view social application	21	view_socialapp
89	Can add social application token	22	add_socialtoken
90	Can change social application token	22	change_socialtoken
91	Can delete social application token	22	delete_socialtoken
92	Can view social application token	22	view_socialtoken
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: 3900user
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
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

COPY public.books (id, book_title, book_synopsis, book_publisher, publication_date, genre, average_rating) FROM stdin;
1	WALK THE WIRE	The sixth book in the Memory Man series. Decker and Jamison investigate a murder in a North Dakota town in a fracking boom.	Grand Central	2020-06-28	Adventure	0
3	WHERE THE CRAWDADS SING	In a quiet town on the North Carolina coast in 1969, a young woman who survived alone in the marsh becomes a murder suspect.	Putnam	2020-06-28	Adventure	0
7	CAMINO WINDS	The line between fact and fiction becomes blurred when an author of thrillers is found dead after a hurricane hits Camino Island.	Doubleday	2020-06-28	Adventure	0
8	FAIR WARNING	The third book in the Jack McEvoy series. A reporter tracks a killer who uses genetic data to pick his victims.	Little, Brown	2020-06-28	Adventure	0
4	THE DAUGHTERS OF ERIETOWN	The story of four generations of an Ohio family brings to life the tribulations encountered and bonds formed by women in the 20th century.	Random House	2020-06-28	Adventure	0
9	DADDY'S GIRLS	After a California rancher‘s sudden death, his three daughters discover things they did not know about their father.	Delacorte	2020-06-28	Adventure	0
10	THE VANISHING HALF	The lives of twin sisters who run away from a Southern black community at age 16 diverge as one returns and the other takes on a different racial identity but their fates intertwine.	Riverhead	2020-06-28	Adventure	0
11	THE SUMMER HOUSE	Jeremiah Cook, a veteran and former N.Y.P.D. cop, investigates a mass murder near a lake in Georgia.	Little, Brown	2020-06-28	Adventure	0
12	TOM CLANCY: FIRING POINT	When an old friend is killed during the bombing of a Barcelona cafe, Jack Ryan Jr. searches for those responsible.	Putnam	2020-06-28	Adventure	0
13	HIDEAWAY	A child star escapes her abductors, gathers herself in western Ireland and returns to Hollywood.	St. Martin's	2020-06-28	Adventure	0
14	IF IT BLEEDS	Four novellas: “Mr. Harrigan’s Phone,” “The Life of Chuck,” “Rat” and “If It Bleeds.”	Scribner	2020-06-28	Adventure	0
15	THE GUEST LIST	A wedding between a TV star and a magazine publisher on an island off the coast of Ireland turns deadly.	Morrow	2020-06-28	Adventure	0
5	AMERICAN DIRT	A bookseller flees Mexico for the United States with her son while pursued by the head of a drug cartel.	Flatiron	2020-06-28	Adventure	0
6	THE LIES THAT BIND	When the new man in her life disappears on 9/11, the budding reporter Cecily Gardner questions what she knew about him.	Ballantine	2020-06-28	Adventure	0
2	BIG SUMMER	Daphne Berg’s former best friend asks her to be the maid of honor at her wedding in Cape Cod.	Atria	2020-06-28	Adventure	0
\.


--
-- Data for Name: collection; Type: TABLE DATA; Schema: public; Owner: 3900user
--

COPY public.collection (id, collection_type, description, collection_name, collection_list_id, is_private) FROM stdin;
\.


--
-- Data for Name: collection_lists; Type: TABLE DATA; Schema: public; Owner: 3900user
--

COPY public.collection_lists (id) FROM stdin;
1
\.


--
-- Data for Name: contains; Type: TABLE DATA; Schema: public; Owner: 3900user
--

COPY public.contains (id, book_id, collection_id, time_added) FROM stdin;
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
7	app	authors
8	app	books
10	app	collectionlists
11	app	writtenby
12	app	users
13	app	reviews
14	app	reads
15	app	contains
16	authtoken	token
9	app	collections
17	sites	site
18	account	emailaddress
19	account	emailconfirmation
20	socialaccount	socialaccount
21	socialaccount	socialapp
22	socialaccount	socialtoken
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: 3900user
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2020-06-27 12:00:09.832307+10
2	auth	0001_initial	2020-06-27 12:00:09.935349+10
3	admin	0001_initial	2020-06-27 12:00:10.10187+10
4	admin	0002_logentry_remove_auto_add	2020-06-27 12:00:10.148585+10
5	admin	0003_logentry_add_action_flag_choices	2020-06-27 12:00:10.169838+10
6	app	0001_initial	2020-06-27 12:00:10.378063+10
7	app	0002_auto_20200627_0132	2020-06-27 12:00:10.482689+10
8	contenttypes	0002_remove_content_type_name	2020-06-27 12:00:10.525652+10
9	auth	0002_alter_permission_name_max_length	2020-06-27 12:00:10.533182+10
10	auth	0003_alter_user_email_max_length	2020-06-27 12:00:10.545463+10
11	auth	0004_alter_user_username_opts	2020-06-27 12:00:10.55665+10
12	auth	0005_alter_user_last_login_null	2020-06-27 12:00:10.567826+10
13	auth	0006_require_contenttypes_0002	2020-06-27 12:00:10.572005+10
14	auth	0007_alter_validators_add_error_messages	2020-06-27 12:00:10.593548+10
15	auth	0008_alter_user_username_max_length	2020-06-27 12:00:10.612362+10
16	auth	0009_alter_user_last_name_max_length	2020-06-27 12:00:10.623473+10
17	auth	0010_alter_group_name_max_length	2020-06-27 12:00:10.635347+10
18	auth	0011_update_proxy_permissions	2020-06-27 12:00:10.652127+10
19	sessions	0001_initial	2020-06-27 12:00:10.669447+10
20	authtoken	0001_initial	2020-06-27 12:05:44.406138+10
21	authtoken	0002_auto_20160226_1747	2020-06-27 12:05:44.460013+10
22	app	0003_auto_20200627_0246	2020-06-27 12:47:04.338975+10
23	account	0001_initial	2020-06-27 14:13:45.596548+10
24	account	0002_email_max_length	2020-06-27 14:13:45.673006+10
25	sites	0001_initial	2020-06-27 14:13:45.687045+10
26	sites	0002_alter_domain_unique	2020-06-27 14:13:45.703613+10
27	socialaccount	0001_initial	2020-06-27 14:13:45.827769+10
28	socialaccount	0002_token_max_lengths	2020-06-27 14:13:45.913161+10
29	socialaccount	0003_extra_data_default_dict	2020-06-27 14:13:45.927217+10
30	app	0004_auto_20200627_1157	2020-06-27 21:57:41.418718+10
31	app	0005_auto_20200627_1213	2020-06-27 22:13:55.164398+10
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
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: 3900user
--

COPY public.users (id, name, email, username, collection_list_id) FROM stdin;
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

SELECT pg_catalog.setval('public.auth_permission_id_seq', 92, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: 3900user
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: 3900user
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, false);


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

SELECT pg_catalog.setval('public.books_id_seq', 15, true);


--
-- Name: collection_id_seq; Type: SEQUENCE SET; Schema: public; Owner: 3900user
--

SELECT pg_catalog.setval('public.collection_id_seq', 1, false);


--
-- Name: collection_lists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: 3900user
--

SELECT pg_catalog.setval('public.collection_lists_id_seq', 1, true);


--
-- Name: contains_id_seq; Type: SEQUENCE SET; Schema: public; Owner: 3900user
--

SELECT pg_catalog.setval('public.contains_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: 3900user
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: 3900user
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 22, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: 3900user
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 31, true);


--
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: 3900user
--

SELECT pg_catalog.setval('public.django_site_id_seq', 1, true);


--
-- Name: reads_id_seq; Type: SEQUENCE SET; Schema: public; Owner: 3900user
--

SELECT pg_catalog.setval('public.reads_id_seq', 1, false);


--
-- Name: reviews_id_seq; Type: SEQUENCE SET; Schema: public; Owner: 3900user
--

SELECT pg_catalog.setval('public.reviews_id_seq', 1, false);


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
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: 3900user
--

SELECT pg_catalog.setval('public.users_id_seq', 1, false);


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
-- Name: collection_lists collection_lists_pkey; Type: CONSTRAINT; Schema: public; Owner: 3900user
--

ALTER TABLE ONLY public.collection_lists
    ADD CONSTRAINT collection_lists_pkey PRIMARY KEY (id);


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
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: 3900user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


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
-- Name: collection_collection_list_id_cc54ff6e; Type: INDEX; Schema: public; Owner: 3900user
--

CREATE INDEX collection_collection_list_id_cc54ff6e ON public.collection USING btree (collection_list_id);


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
-- Name: users_collection_list_id_c0e214ec; Type: INDEX; Schema: public; Owner: 3900user
--

CREATE INDEX users_collection_list_id_c0e214ec ON public.users USING btree (collection_list_id);


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
-- Name: collection collection_collection_list_id_cc54ff6e_fk_collection_lists_id; Type: FK CONSTRAINT; Schema: public; Owner: 3900user
--

ALTER TABLE ONLY public.collection
    ADD CONSTRAINT collection_collection_list_id_cc54ff6e_fk_collection_lists_id FOREIGN KEY (collection_list_id) REFERENCES public.collection_lists(id) DEFERRABLE INITIALLY DEFERRED;


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
-- Name: reads reads_book_id_0376bcbf_fk_books_id; Type: FK CONSTRAINT; Schema: public; Owner: 3900user
--

ALTER TABLE ONLY public.reads
    ADD CONSTRAINT reads_book_id_0376bcbf_fk_books_id FOREIGN KEY (book_id) REFERENCES public.books(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reads reads_user_id_c209fc96_fk_users_id; Type: FK CONSTRAINT; Schema: public; Owner: 3900user
--

ALTER TABLE ONLY public.reads
    ADD CONSTRAINT reads_user_id_c209fc96_fk_users_id FOREIGN KEY (user_id) REFERENCES public.users(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews reviews_book_id_b7e9bb6d_fk_books_id; Type: FK CONSTRAINT; Schema: public; Owner: 3900user
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_book_id_b7e9bb6d_fk_books_id FOREIGN KEY (book_id) REFERENCES public.books(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews reviews_user_id_c23b0903_fk_users_id; Type: FK CONSTRAINT; Schema: public; Owner: 3900user
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_user_id_c23b0903_fk_users_id FOREIGN KEY (user_id) REFERENCES public.users(id) DEFERRABLE INITIALLY DEFERRED;


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
-- Name: users users_collection_list_id_c0e214ec_fk_collection_lists_id; Type: FK CONSTRAINT; Schema: public; Owner: 3900user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_collection_list_id_c0e214ec_fk_collection_lists_id FOREIGN KEY (collection_list_id) REFERENCES public.collection_lists(id) DEFERRABLE INITIALLY DEFERRED;


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

