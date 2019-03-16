--
-- PostgreSQL database dump
--

-- Dumped from database version 10.1
-- Dumped by pg_dump version 11.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

DROP INDEX public.index_users_on_reset_password_token;
DROP INDEX public.index_users_on_email;
DROP INDEX public.index_user_groups_on_user_id_and_group_id;
DROP INDEX public.index_user_groups_on_user_id;
DROP INDEX public.index_user_groups_on_group_id;
DROP INDEX public.index_room_chats_on_sender_id_and_conversation_id;
DROP INDEX public.index_room_chats_on_sender_id;
DROP INDEX public.index_room_chats_on_conversation_id;
DROP INDEX public.index_posts_on_vehicle_kind_id;
DROP INDEX public.index_posts_on_user_id;
DROP INDEX public.index_messages_on_sender_id;
DROP INDEX public.index_messages_on_conversation_id;
DROP INDEX public.index_likes_on_user_id_and_likeable_id_and_likeable_type;
DROP INDEX public.index_likes_on_user_id;
DROP INDEX public.index_groups_on_user_id;
DROP INDEX public.index_groups_on_name;
DROP INDEX public.index_follows_on_user_id_and_target_user_id;
DROP INDEX public.index_follows_on_user_id;
DROP INDEX public.index_follows_on_target_user_id;
DROP INDEX public.index_cities_on_province_id;
DROP INDEX public.index_active_admin_comments_on_resource_type_and_resource_id;
DROP INDEX public.index_active_admin_comments_on_namespace;
DROP INDEX public.index_active_admin_comments_on_author_type_and_author_id;
ALTER TABLE ONLY public.vehicle_kinds DROP CONSTRAINT vehicle_kinds_pkey;
ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
ALTER TABLE ONLY public.user_groups DROP CONSTRAINT user_groups_pkey;
ALTER TABLE ONLY public.schema_migrations DROP CONSTRAINT schema_migrations_pkey;
ALTER TABLE ONLY public.room_chats DROP CONSTRAINT room_chats_pkey;
ALTER TABLE ONLY public.provinces DROP CONSTRAINT provinces_pkey;
ALTER TABLE ONLY public.posts DROP CONSTRAINT posts_pkey;
ALTER TABLE ONLY public.post_images DROP CONSTRAINT post_images_pkey;
ALTER TABLE ONLY public.messages DROP CONSTRAINT messages_pkey;
ALTER TABLE ONLY public.likes DROP CONSTRAINT likes_pkey;
ALTER TABLE ONLY public.groups DROP CONSTRAINT groups_pkey;
ALTER TABLE ONLY public.follows DROP CONSTRAINT follows_pkey;
ALTER TABLE ONLY public.enterprises DROP CONSTRAINT enterprises_pkey;
ALTER TABLE ONLY public.conversations DROP CONSTRAINT conversations_pkey;
ALTER TABLE ONLY public.comments DROP CONSTRAINT comments_pkey;
ALTER TABLE ONLY public.cities DROP CONSTRAINT cities_pkey;
ALTER TABLE ONLY public.blogs DROP CONSTRAINT blogs_pkey;
ALTER TABLE ONLY public.ar_internal_metadata DROP CONSTRAINT ar_internal_metadata_pkey;
ALTER TABLE ONLY public.activities DROP CONSTRAINT activities_pkey;
ALTER TABLE ONLY public.active_admin_comments DROP CONSTRAINT active_admin_comments_pkey;
ALTER TABLE public.vehicle_kinds ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.user_groups ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.room_chats ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.provinces ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.posts ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.post_images ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.messages ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.likes ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.groups ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.follows ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.enterprises ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.conversations ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.comments ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.cities ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.blogs ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.activities ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.active_admin_comments ALTER COLUMN id DROP DEFAULT;
DROP SEQUENCE public.vehicle_kinds_id_seq;
DROP TABLE public.vehicle_kinds;
DROP SEQUENCE public.users_id_seq;
DROP TABLE public.users;
DROP SEQUENCE public.user_groups_id_seq;
DROP TABLE public.user_groups;
DROP TABLE public.schema_migrations;
DROP SEQUENCE public.room_chats_id_seq;
DROP TABLE public.room_chats;
DROP SEQUENCE public.provinces_id_seq;
DROP TABLE public.provinces;
DROP SEQUENCE public.posts_id_seq;
DROP TABLE public.posts;
DROP SEQUENCE public.post_images_id_seq;
DROP TABLE public.post_images;
DROP SEQUENCE public.messages_id_seq;
DROP TABLE public.messages;
DROP SEQUENCE public.likes_id_seq;
DROP TABLE public.likes;
DROP SEQUENCE public.groups_id_seq;
DROP TABLE public.groups;
DROP SEQUENCE public.follows_id_seq;
DROP TABLE public.follows;
DROP SEQUENCE public.enterprises_id_seq;
DROP TABLE public.enterprises;
DROP SEQUENCE public.conversations_id_seq;
DROP TABLE public.conversations;
DROP SEQUENCE public.comments_id_seq;
DROP TABLE public.comments;
DROP SEQUENCE public.cities_id_seq;
DROP TABLE public.cities;
DROP SEQUENCE public.blogs_id_seq;
DROP TABLE public.blogs;
DROP TABLE public.ar_internal_metadata;
DROP SEQUENCE public.activities_id_seq;
DROP TABLE public.activities;
DROP SEQUENCE public.active_admin_comments_id_seq;
DROP TABLE public.active_admin_comments;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: active_admin_comments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.active_admin_comments (
    id integer NOT NULL,
    namespace character varying,
    body text,
    resource_type character varying,
    resource_id integer,
    author_type character varying,
    author_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: active_admin_comments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.active_admin_comments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: active_admin_comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.active_admin_comments_id_seq OWNED BY public.active_admin_comments.id;


--
-- Name: activities; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.activities (
    id integer NOT NULL,
    user_id bigint NOT NULL,
    target_user_id bigint NOT NULL,
    kind character varying,
    message character varying,
    url character varying,
    read boolean DEFAULT false,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: activities_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.activities_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: activities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.activities_id_seq OWNED BY public.activities.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: blogs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.blogs (
    id integer NOT NULL,
    title character varying,
    content text,
    img_data text,
    user_id bigint,
    kind character varying DEFAULT 'newfeed'::character varying,
    mod character varying DEFAULT 'public'::character varying,
    like_count integer,
    view_count integer,
    comment_count integer,
    slug_title character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: blogs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.blogs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: blogs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.blogs_id_seq OWNED BY public.blogs.id;


--
-- Name: cities; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cities (
    id integer NOT NULL,
    name character varying,
    province_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: cities_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cities_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cities_id_seq OWNED BY public.cities.id;


--
-- Name: comments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.comments (
    id integer NOT NULL,
    context character varying(500) NOT NULL,
    commentable_id integer,
    commentable_type character varying,
    user_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.comments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.comments_id_seq OWNED BY public.comments.id;


--
-- Name: conversations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.conversations (
    id integer NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: conversations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.conversations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: conversations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.conversations_id_seq OWNED BY public.conversations.id;


--
-- Name: enterprises; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.enterprises (
    id integer NOT NULL,
    name character varying,
    address character varying,
    phone character varying,
    user_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: enterprises_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.enterprises_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: enterprises_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.enterprises_id_seq OWNED BY public.enterprises.id;


--
-- Name: follows; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.follows (
    id integer NOT NULL,
    user_id bigint NOT NULL,
    target_user_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: follows_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.follows_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: follows_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.follows_id_seq OWNED BY public.follows.id;


--
-- Name: groups; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.groups (
    id integer NOT NULL,
    name character varying,
    address character varying,
    user_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: groups_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.groups_id_seq OWNED BY public.groups.id;


--
-- Name: likes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.likes (
    id integer NOT NULL,
    user_id bigint,
    likeable_id integer,
    likeable_type character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: likes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.likes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: likes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.likes_id_seq OWNED BY public.likes.id;


--
-- Name: messages; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.messages (
    id integer NOT NULL,
    msg text,
    attachment_data text,
    conversation_id bigint NOT NULL,
    sender_id bigint NOT NULL,
    read boolean DEFAULT false,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: messages_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.messages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.messages_id_seq OWNED BY public.messages.id;


--
-- Name: post_images; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.post_images (
    id integer NOT NULL,
    post_image_data text,
    post_imageable_id integer,
    post_imageable_type character varying,
    url character varying DEFAULT 'Unknow'::character varying,
    public_id character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: post_images_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.post_images_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: post_images_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.post_images_id_seq OWNED BY public.post_images.id;


--
-- Name: posts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.posts (
    id integer NOT NULL,
    title character varying,
    describe character varying,
    user_id bigint NOT NULL,
    vehicle_kind_id bigint NOT NULL,
    status character varying DEFAULT 'spending'::character varying NOT NULL,
    featured_image_data text,
    car_life character varying DEFAULT 'Unknown'::character varying,
    capacity character varying DEFAULT 'Unknown'::character varying,
    range_of_vehicle character varying DEFAULT 'Unknown'::character varying,
    status_of_vehicle character varying,
    price double precision DEFAULT 0.0 NOT NULL,
    year_of_registration character varying DEFAULT 'Unknown'::character varying,
    km character varying DEFAULT 'Unknown'::character varying,
    slug_title character varying,
    city_id bigint,
    color character varying DEFAULT 'Unknown'::character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: posts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.posts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.posts_id_seq OWNED BY public.posts.id;


--
-- Name: provinces; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.provinces (
    id integer NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: provinces_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.provinces_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: provinces_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.provinces_id_seq OWNED BY public.provinces.id;


--
-- Name: room_chats; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.room_chats (
    id integer NOT NULL,
    conversation_id bigint NOT NULL,
    sender_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: room_chats_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.room_chats_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: room_chats_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.room_chats_id_seq OWNED BY public.room_chats.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


--
-- Name: user_groups; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.user_groups (
    id integer NOT NULL,
    user_id bigint,
    group_id bigint,
    role character varying DEFAULT 'member'::character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.user_groups_id_seq OWNED BY public.user_groups.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    email character varying,
    phone character varying,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    address character varying,
    username character varying,
    avatar_data text,
    slug_name character varying,
    range character varying,
    status character varying DEFAULT 'offline'::character varying,
    followers_count integer,
    following_count integer,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    provider character varying,
    uid character varying,
    type_account character varying
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: vehicle_kinds; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.vehicle_kinds (
    id integer NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: vehicle_kinds_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.vehicle_kinds_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vehicle_kinds_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.vehicle_kinds_id_seq OWNED BY public.vehicle_kinds.id;


--
-- Name: active_admin_comments id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_admin_comments ALTER COLUMN id SET DEFAULT nextval('public.active_admin_comments_id_seq'::regclass);


--
-- Name: activities id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.activities ALTER COLUMN id SET DEFAULT nextval('public.activities_id_seq'::regclass);


--
-- Name: blogs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.blogs ALTER COLUMN id SET DEFAULT nextval('public.blogs_id_seq'::regclass);


--
-- Name: cities id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cities ALTER COLUMN id SET DEFAULT nextval('public.cities_id_seq'::regclass);


--
-- Name: comments id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comments ALTER COLUMN id SET DEFAULT nextval('public.comments_id_seq'::regclass);


--
-- Name: conversations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.conversations ALTER COLUMN id SET DEFAULT nextval('public.conversations_id_seq'::regclass);


--
-- Name: enterprises id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.enterprises ALTER COLUMN id SET DEFAULT nextval('public.enterprises_id_seq'::regclass);


--
-- Name: follows id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.follows ALTER COLUMN id SET DEFAULT nextval('public.follows_id_seq'::regclass);


--
-- Name: groups id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.groups ALTER COLUMN id SET DEFAULT nextval('public.groups_id_seq'::regclass);


--
-- Name: likes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.likes ALTER COLUMN id SET DEFAULT nextval('public.likes_id_seq'::regclass);


--
-- Name: messages id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.messages ALTER COLUMN id SET DEFAULT nextval('public.messages_id_seq'::regclass);


--
-- Name: post_images id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.post_images ALTER COLUMN id SET DEFAULT nextval('public.post_images_id_seq'::regclass);


--
-- Name: posts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.posts ALTER COLUMN id SET DEFAULT nextval('public.posts_id_seq'::regclass);


--
-- Name: provinces id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.provinces ALTER COLUMN id SET DEFAULT nextval('public.provinces_id_seq'::regclass);


--
-- Name: room_chats id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.room_chats ALTER COLUMN id SET DEFAULT nextval('public.room_chats_id_seq'::regclass);


--
-- Name: user_groups id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_groups ALTER COLUMN id SET DEFAULT nextval('public.user_groups_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: vehicle_kinds id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vehicle_kinds ALTER COLUMN id SET DEFAULT nextval('public.vehicle_kinds_id_seq'::regclass);


--
-- Data for Name: active_admin_comments; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.active_admin_comments (id, namespace, body, resource_type, resource_id, author_type, author_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: activities; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.activities (id, user_id, target_user_id, kind, message, url, read, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2019-03-16 15:26:08.199781	2019-03-16 15:26:08.199781
\.


--
-- Data for Name: blogs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.blogs (id, title, content, img_data, user_id, kind, mod, like_count, view_count, comment_count, slug_title, created_at, updated_at) FROM stdin;
1	BLV Quang Huy: ‘Tuyển Việt Nam phải kiên nhẫn nếu muốn hạ Jordan	BLV Quang Huy: Tuyển Việt Nam phải kiên nhẫn nếu muốn hạ Jordan	\N	1	newfeed	motosg	\N	\N	\N	blv-quang-huy-tuy-n-vi-t-nam-ph-i-kien-nh-n-n-u-mu-n-h-jordan	2019-03-16 15:26:14.985758	2019-03-16 15:26:14.985758
\.


--
-- Data for Name: cities; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.cities (id, name, province_id, created_at, updated_at) FROM stdin;
1	Quận Ba Đình	1	2019-03-16 15:26:08.606088	2019-03-16 15:26:08.606088
2	Quận Hoàn Kiếm	1	2019-03-16 15:26:08.61569	2019-03-16 15:26:08.61569
3	Quận Hai Bà Trưng	1	2019-03-16 15:26:08.625653	2019-03-16 15:26:08.625653
4	Quận Đống Đa	1	2019-03-16 15:26:08.631711	2019-03-16 15:26:08.631711
5	Quận Tây Hồ	1	2019-03-16 15:26:08.634494	2019-03-16 15:26:08.634494
6	Quận Cầu Giấy	1	2019-03-16 15:26:08.637465	2019-03-16 15:26:08.637465
7	Quận Thanh Xuân	1	2019-03-16 15:26:08.640293	2019-03-16 15:26:08.640293
8	Quận Hoàng Mai	1	2019-03-16 15:26:08.644399	2019-03-16 15:26:08.644399
9	Quận Long Biên	1	2019-03-16 15:26:08.647694	2019-03-16 15:26:08.647694
10	Huyện Từ Liêm	1	2019-03-16 15:26:08.662419	2019-03-16 15:26:08.662419
11	Huyện Thanh Trì	1	2019-03-16 15:26:08.666386	2019-03-16 15:26:08.666386
12	Huyện Gia Lâm	1	2019-03-16 15:26:08.668842	2019-03-16 15:26:08.668842
13	Huyện Đông Anh	1	2019-03-16 15:26:08.671355	2019-03-16 15:26:08.671355
14	Huyện Sóc Sơn	1	2019-03-16 15:26:08.673617	2019-03-16 15:26:08.673617
15	Quận Hà Đông	1	2019-03-16 15:26:08.676863	2019-03-16 15:26:08.676863
16	Thị xã Sơn Tây	1	2019-03-16 15:26:08.679764	2019-03-16 15:26:08.679764
17	Huyện Ba Vì	1	2019-03-16 15:26:08.681999	2019-03-16 15:26:08.681999
18	Huyện Phúc Thọ	1	2019-03-16 15:26:08.684345	2019-03-16 15:26:08.684345
19	Huyện Thạch Thất	1	2019-03-16 15:26:08.68685	2019-03-16 15:26:08.68685
20	Huyện Quốc Oai	1	2019-03-16 15:26:08.689874	2019-03-16 15:26:08.689874
21	Huyện Chương Mỹ	1	2019-03-16 15:26:08.694075	2019-03-16 15:26:08.694075
22	Huyện Đan Phượng	1	2019-03-16 15:26:08.697749	2019-03-16 15:26:08.697749
23	Huyện Hoài Đức	1	2019-03-16 15:26:08.700313	2019-03-16 15:26:08.700313
24	Huyện Thanh Oai	1	2019-03-16 15:26:08.703038	2019-03-16 15:26:08.703038
25	Huyện Mỹ Đức	1	2019-03-16 15:26:08.705441	2019-03-16 15:26:08.705441
26	Huyện Ứng Hoà	1	2019-03-16 15:26:08.70795	2019-03-16 15:26:08.70795
27	Huyện Thường Tín	1	2019-03-16 15:26:08.711537	2019-03-16 15:26:08.711537
28	Huyện Phú Xuyên	1	2019-03-16 15:26:08.713887	2019-03-16 15:26:08.713887
29	Huyện Mê Linh	1	2019-03-16 15:26:08.716022	2019-03-16 15:26:08.716022
30	Quận/Huyện khác	1	2019-03-16 15:26:08.718275	2019-03-16 15:26:08.718275
31	Quận 1	2	2019-03-16 15:26:08.72352	2019-03-16 15:26:08.72352
32	Quận 2	2	2019-03-16 15:26:08.728335	2019-03-16 15:26:08.728335
33	Quận 3	2	2019-03-16 15:26:08.73186	2019-03-16 15:26:08.73186
34	Quận 4	2	2019-03-16 15:26:08.734433	2019-03-16 15:26:08.734433
35	Quận 5	2	2019-03-16 15:26:08.736731	2019-03-16 15:26:08.736731
36	Quận 6	2	2019-03-16 15:26:08.738894	2019-03-16 15:26:08.738894
37	Quận 7	2	2019-03-16 15:26:08.741083	2019-03-16 15:26:08.741083
38	Quận 8	2	2019-03-16 15:26:08.744834	2019-03-16 15:26:08.744834
39	Quận 9	2	2019-03-16 15:26:08.747239	2019-03-16 15:26:08.747239
40	Quận 10	2	2019-03-16 15:26:08.749609	2019-03-16 15:26:08.749609
41	Quận 11	2	2019-03-16 15:26:08.752074	2019-03-16 15:26:08.752074
42	Quận 12	2	2019-03-16 15:26:08.754551	2019-03-16 15:26:08.754551
43	Quận Gò Vấp	2	2019-03-16 15:26:08.757976	2019-03-16 15:26:08.757976
44	Quận Tân Bình	2	2019-03-16 15:26:08.762973	2019-03-16 15:26:08.762973
45	Quận Tân Phú	2	2019-03-16 15:26:08.765767	2019-03-16 15:26:08.765767
46	Quận Bình Thạnh	2	2019-03-16 15:26:08.768513	2019-03-16 15:26:08.768513
47	Quận Phú Nhuận	2	2019-03-16 15:26:08.771069	2019-03-16 15:26:08.771069
48	Quận Thủ Đức	2	2019-03-16 15:26:08.773427	2019-03-16 15:26:08.773427
49	Quận Bình Tân	2	2019-03-16 15:26:08.775866	2019-03-16 15:26:08.775866
50	Huyện Bình Chánh	2	2019-03-16 15:26:08.779311	2019-03-16 15:26:08.779311
51	Huyện Củ Chi	2	2019-03-16 15:26:08.781533	2019-03-16 15:26:08.781533
52	Huyện Hóc Môn	2	2019-03-16 15:26:08.783826	2019-03-16 15:26:08.783826
53	Huyện Nhà Bè	2	2019-03-16 15:26:08.786204	2019-03-16 15:26:08.786204
54	Huyện Cần Giờ	2	2019-03-16 15:26:08.788644	2019-03-16 15:26:08.788644
55	Quận/Huyện khác	2	2019-03-16 15:26:08.794153	2019-03-16 15:26:08.794153
56	Quận Hồng Bàng	3	2019-03-16 15:26:08.800398	2019-03-16 15:26:08.800398
57	Quận Lê Chân	3	2019-03-16 15:26:08.802815	2019-03-16 15:26:08.802815
58	Quận Ngô Quyền	3	2019-03-16 15:26:08.805129	2019-03-16 15:26:08.805129
59	Quận Kiến An	3	2019-03-16 15:26:08.807354	2019-03-16 15:26:08.807354
60	Quận Hải An	3	2019-03-16 15:26:08.810239	2019-03-16 15:26:08.810239
61	Quận Đồ Sơn	3	2019-03-16 15:26:08.813014	2019-03-16 15:26:08.813014
62	Huyện An Lão	3	2019-03-16 15:26:08.815129	2019-03-16 15:26:08.815129
63	Huyện Kiến Thụy	3	2019-03-16 15:26:08.817843	2019-03-16 15:26:08.817843
64	Huyện Thủy Nguyên	3	2019-03-16 15:26:08.820388	2019-03-16 15:26:08.820388
65	Huyện An Dương	3	2019-03-16 15:26:08.823783	2019-03-16 15:26:08.823783
66	Huyện Tiên Lãng	3	2019-03-16 15:26:08.828199	2019-03-16 15:26:08.828199
67	Huyện Vĩnh Bảo	3	2019-03-16 15:26:08.831812	2019-03-16 15:26:08.831812
68	Huyện Cát Hải	3	2019-03-16 15:26:08.834671	2019-03-16 15:26:08.834671
69	Huyện Bạch Long Vĩ	3	2019-03-16 15:26:08.837012	2019-03-16 15:26:08.837012
70	Quận Dương Kinh	3	2019-03-16 15:26:08.839412	2019-03-16 15:26:08.839412
71	Quận/Huyện khác	3	2019-03-16 15:26:08.842033	2019-03-16 15:26:08.842033
72	Quận Hải Châu	4	2019-03-16 15:26:08.848072	2019-03-16 15:26:08.848072
73	Quận Thanh Khê	4	2019-03-16 15:26:08.850365	2019-03-16 15:26:08.850365
74	Quận Sơn Trà	4	2019-03-16 15:26:08.852612	2019-03-16 15:26:08.852612
75	Quận Ngũ Hành Sơn	4	2019-03-16 15:26:08.854848	2019-03-16 15:26:08.854848
76	Quận Liên Chiểu	4	2019-03-16 15:26:08.858549	2019-03-16 15:26:08.858549
77	Huyện Hoà Vang	4	2019-03-16 15:26:08.864058	2019-03-16 15:26:08.864058
78	Quận Cẩm Lệ	4	2019-03-16 15:26:08.866747	2019-03-16 15:26:08.866747
79	Quận/Huyện khác	4	2019-03-16 15:26:08.869241	2019-03-16 15:26:08.869241
80	Thành phố Hà Giang	5	2019-03-16 15:26:08.873781	2019-03-16 15:26:08.873781
81	Huyện Đồng Văn	5	2019-03-16 15:26:08.876286	2019-03-16 15:26:08.876286
82	Huyện Mèo Vạc	5	2019-03-16 15:26:08.879635	2019-03-16 15:26:08.879635
83	Huyện Yên Minh	5	2019-03-16 15:26:08.881968	2019-03-16 15:26:08.881968
84	Huyện Quản Bạ	5	2019-03-16 15:26:08.884416	2019-03-16 15:26:08.884416
85	Huyện Vị Xuyên	5	2019-03-16 15:26:08.887029	2019-03-16 15:26:08.887029
86	Huyện Bắc Mê	5	2019-03-16 15:26:08.890504	2019-03-16 15:26:08.890504
87	Huyện Hoàng Su Phì	5	2019-03-16 15:26:08.895311	2019-03-16 15:26:08.895311
88	Huyện Xín Mần	5	2019-03-16 15:26:08.898781	2019-03-16 15:26:08.898781
89	Huyện Bắc Quang	5	2019-03-16 15:26:08.901137	2019-03-16 15:26:08.901137
90	Huyện Quang Bình	5	2019-03-16 15:26:08.903463	2019-03-16 15:26:08.903463
91	Quận/Huyện khác	5	2019-03-16 15:26:08.905739	2019-03-16 15:26:08.905739
92	Thành phố Cao Bằng	6	2019-03-16 15:26:08.912109	2019-03-16 15:26:08.912109
93	Huyện Bảo Lạc	6	2019-03-16 15:26:08.914688	2019-03-16 15:26:08.914688
94	Huyện Thông Nông	6	2019-03-16 15:26:08.916953	2019-03-16 15:26:08.916953
95	Huyện Hà Quảng	6	2019-03-16 15:26:08.919421	2019-03-16 15:26:08.919421
96	Huyện Trà Lĩnh	6	2019-03-16 15:26:08.921928	2019-03-16 15:26:08.921928
97	Huyện Trùng Khánh	6	2019-03-16 15:26:08.926562	2019-03-16 15:26:08.926562
98	Huyện Nguyên Bình	6	2019-03-16 15:26:08.930734	2019-03-16 15:26:08.930734
99	Huyện Hoà An	6	2019-03-16 15:26:08.933223	2019-03-16 15:26:08.933223
100	Huyện Quảng Uyên	6	2019-03-16 15:26:08.935648	2019-03-16 15:26:08.935648
101	Huyện Thạch An	6	2019-03-16 15:26:08.937897	2019-03-16 15:26:08.937897
102	Huyện Hạ Lang	6	2019-03-16 15:26:08.940272	2019-03-16 15:26:08.940272
103	Huyện Bảo Lâm	6	2019-03-16 15:26:08.942556	2019-03-16 15:26:08.942556
104	Huyện Phục Hoà	6	2019-03-16 15:26:08.945937	2019-03-16 15:26:08.945937
105	Quận/Huyện khác	6	2019-03-16 15:26:08.948289	2019-03-16 15:26:08.948289
106	Thành Phố Lai Châu	7	2019-03-16 15:26:08.953241	2019-03-16 15:26:08.953241
107	Huyện Tam Đường	7	2019-03-16 15:26:08.956963	2019-03-16 15:26:08.956963
108	Huyện Phong Thổ	7	2019-03-16 15:26:08.960966	2019-03-16 15:26:08.960966
109	Huyện Sìn Hồ	7	2019-03-16 15:26:08.964451	2019-03-16 15:26:08.964451
110	Huyện Mường Tè	7	2019-03-16 15:26:08.967227	2019-03-16 15:26:08.967227
111	Huyện Than Uyên	7	2019-03-16 15:26:08.969585	2019-03-16 15:26:08.969585
112	Huyện Tân Uyên	7	2019-03-16 15:26:08.971762	2019-03-16 15:26:08.971762
113	Huyện Nậm Nhùm	7	2019-03-16 15:26:08.973971	2019-03-16 15:26:08.973971
114	Quận/Huyện khác	7	2019-03-16 15:26:08.976956	2019-03-16 15:26:08.976956
115	Thành phố Lào Cai	8	2019-03-16 15:26:08.983102	2019-03-16 15:26:08.983102
116	Huyện Xi Ma Cai	8	2019-03-16 15:26:08.985571	2019-03-16 15:26:08.985571
117	Huyện Bát Xát	8	2019-03-16 15:26:08.98785	2019-03-16 15:26:08.98785
118	Huyện Bảo Thắng	8	2019-03-16 15:26:08.991407	2019-03-16 15:26:08.991407
119	Huyện Sa Pa	8	2019-03-16 15:26:08.995413	2019-03-16 15:26:08.995413
120	Huyện Văn Bàn	8	2019-03-16 15:26:08.999218	2019-03-16 15:26:08.999218
121	Huyện Bảo Yên	8	2019-03-16 15:26:09.001766	2019-03-16 15:26:09.001766
122	Huyện Bắc Hà	8	2019-03-16 15:26:09.004445	2019-03-16 15:26:09.004445
123	Huyện Mường Khương	8	2019-03-16 15:26:09.006682	2019-03-16 15:26:09.006682
124	Quận/Huyện khác	8	2019-03-16 15:26:09.009042	2019-03-16 15:26:09.009042
125	Th. phố Tuyên Quang	9	2019-03-16 15:26:09.015252	2019-03-16 15:26:09.015252
126	Huyện Lâm Bình	9	2019-03-16 15:26:09.017859	2019-03-16 15:26:09.017859
127	Huyện Na Hang	9	2019-03-16 15:26:09.020272	2019-03-16 15:26:09.020272
128	Huyện Chiêm Hoá	9	2019-03-16 15:26:09.023342	2019-03-16 15:26:09.023342
129	Huyện Hàm Yên	9	2019-03-16 15:26:09.026349	2019-03-16 15:26:09.026349
130	Huyện Yên Sơn	9	2019-03-16 15:26:09.030769	2019-03-16 15:26:09.030769
131	Huyện Sơn Dương	9	2019-03-16 15:26:09.033176	2019-03-16 15:26:09.033176
132	Quận/Huyện khác	9	2019-03-16 15:26:09.035753	2019-03-16 15:26:09.035753
133	Thành phố Lạng Sơn	10	2019-03-16 15:26:09.040383	2019-03-16 15:26:09.040383
134	Huyện Tràng Định	10	2019-03-16 15:26:09.043063	2019-03-16 15:26:09.043063
135	Huyện Bình Gia	10	2019-03-16 15:26:09.046271	2019-03-16 15:26:09.046271
136	Huyện Văn Lãng	10	2019-03-16 15:26:09.048553	2019-03-16 15:26:09.048553
137	Huyện Bắc Sơn	10	2019-03-16 15:26:09.051176	2019-03-16 15:26:09.051176
138	Huyện Văn Quan	10	2019-03-16 15:26:09.0538	2019-03-16 15:26:09.0538
139	Huyện Cao Lộc	10	2019-03-16 15:26:09.056985	2019-03-16 15:26:09.056985
140	Huyện Lộc Bình	10	2019-03-16 15:26:09.061104	2019-03-16 15:26:09.061104
141	Huyện Chi Lăng	10	2019-03-16 15:26:09.064477	2019-03-16 15:26:09.064477
142	Huyện Đình Lập	10	2019-03-16 15:26:09.066784	2019-03-16 15:26:09.066784
143	Huyện Hữu Lũng	10	2019-03-16 15:26:09.06918	2019-03-16 15:26:09.06918
144	Quận/Huyện khác	10	2019-03-16 15:26:09.071658	2019-03-16 15:26:09.071658
145	Thị xã Bắc Kạn	11	2019-03-16 15:26:09.07728	2019-03-16 15:26:09.07728
146	Huyện Chợ Đồn	11	2019-03-16 15:26:09.080105	2019-03-16 15:26:09.080105
147	Huyện Bạch Thông	11	2019-03-16 15:26:09.082289	2019-03-16 15:26:09.082289
148	Huyện Na Rì	11	2019-03-16 15:26:09.084874	2019-03-16 15:26:09.084874
149	Huyện Ngân Sơn	11	2019-03-16 15:26:09.087423	2019-03-16 15:26:09.087423
150	Huyện Ba Bể	11	2019-03-16 15:26:09.090853	2019-03-16 15:26:09.090853
151	Huyện Chợ Mới	11	2019-03-16 15:26:09.097294	2019-03-16 15:26:09.097294
152	Huyện Pác Nặm	11	2019-03-16 15:26:09.100094	2019-03-16 15:26:09.100094
153	Quận/Huyện khác	11	2019-03-16 15:26:09.102379	2019-03-16 15:26:09.102379
154	Thành phố Thái Nguyên	12	2019-03-16 15:26:09.107087	2019-03-16 15:26:09.107087
155	Thị xã Sông Công	12	2019-03-16 15:26:09.110486	2019-03-16 15:26:09.110486
156	Huyện Định Hoá	12	2019-03-16 15:26:09.113165	2019-03-16 15:26:09.113165
157	Huyện Phú Lương	12	2019-03-16 15:26:09.115406	2019-03-16 15:26:09.115406
158	Huyện Võ Nhai	12	2019-03-16 15:26:09.117651	2019-03-16 15:26:09.117651
159	Huyện Đại Từ	12	2019-03-16 15:26:09.120401	2019-03-16 15:26:09.120401
160	Huyện Đồng Hỷ	12	2019-03-16 15:26:09.12355	2019-03-16 15:26:09.12355
161	Huyện Phú Bình	12	2019-03-16 15:26:09.128227	2019-03-16 15:26:09.128227
162	Huyện Phổ Yên	12	2019-03-16 15:26:09.131371	2019-03-16 15:26:09.131371
163	Quận/Huyện khác	12	2019-03-16 15:26:09.133576	2019-03-16 15:26:09.133576
164	Thành phố Yên Bái	13	2019-03-16 15:26:09.13871	2019-03-16 15:26:09.13871
165	Thị xã Nghĩa Lộ	13	2019-03-16 15:26:09.141099	2019-03-16 15:26:09.141099
166	Huyện Văn Yên	13	2019-03-16 15:26:09.14471	2019-03-16 15:26:09.14471
167	Huyện Yên Bình	13	2019-03-16 15:26:09.147036	2019-03-16 15:26:09.147036
168	Huyện Mù Cang Chải	13	2019-03-16 15:26:09.149219	2019-03-16 15:26:09.149219
169	Huyện Văn Chấn	13	2019-03-16 15:26:09.151654	2019-03-16 15:26:09.151654
170	Huyện Trấn Yên	13	2019-03-16 15:26:09.154081	2019-03-16 15:26:09.154081
171	Huyện Trạm Tấu	13	2019-03-16 15:26:09.158304	2019-03-16 15:26:09.158304
172	Huyện Lục Yên	13	2019-03-16 15:26:09.163353	2019-03-16 15:26:09.163353
173	Quận/Huyện khác	13	2019-03-16 15:26:09.166211	2019-03-16 15:26:09.166211
174	Thành phố Sơn La	14	2019-03-16 15:26:09.170989	2019-03-16 15:26:09.170989
175	Huyện Quỳnh Nhai	14	2019-03-16 15:26:09.173375	2019-03-16 15:26:09.173375
176	Huyện Mường La	14	2019-03-16 15:26:09.175842	2019-03-16 15:26:09.175842
177	Huyện Thuận Châu	14	2019-03-16 15:26:09.179438	2019-03-16 15:26:09.179438
178	Huyện Bắc Yên	14	2019-03-16 15:26:09.181831	2019-03-16 15:26:09.181831
179	Huyện Phù Yên	14	2019-03-16 15:26:09.185122	2019-03-16 15:26:09.185122
180	Huyện Mai Sơn	14	2019-03-16 15:26:09.188705	2019-03-16 15:26:09.188705
181	Huyện Yên Châu	14	2019-03-16 15:26:09.192808	2019-03-16 15:26:09.192808
182	Huyện Sông Mã	14	2019-03-16 15:26:09.19782	2019-03-16 15:26:09.19782
183	Huyện Mộc Châu	14	2019-03-16 15:26:09.200214	2019-03-16 15:26:09.200214
184	huyện Sốp Cộp	14	2019-03-16 15:26:09.202562	2019-03-16 15:26:09.202562
185	Huyện Vân Hồ	14	2019-03-16 15:26:09.205073	2019-03-16 15:26:09.205073
186	Quận/Huyện khác	14	2019-03-16 15:26:09.207466	2019-03-16 15:26:09.207466
187	Thành phố Việt Trì	15	2019-03-16 15:26:09.214821	2019-03-16 15:26:09.214821
188	Thị xã Phú Thọ	15	2019-03-16 15:26:09.217641	2019-03-16 15:26:09.217641
189	Huyện Đoan Hùng	15	2019-03-16 15:26:09.22579	2019-03-16 15:26:09.22579
190	Huyện Thanh Ba	15	2019-03-16 15:26:09.230934	2019-03-16 15:26:09.230934
191	Huyện Hạ Hoà	15	2019-03-16 15:26:09.233791	2019-03-16 15:26:09.233791
192	Huyện Cẩm Khê	15	2019-03-16 15:26:09.236773	2019-03-16 15:26:09.236773
193	Huyện Yên Lập	15	2019-03-16 15:26:09.239726	2019-03-16 15:26:09.239726
194	Huyện Thanh Sơn	15	2019-03-16 15:26:09.242679	2019-03-16 15:26:09.242679
195	Huyện Phù Ninh	15	2019-03-16 15:26:09.246127	2019-03-16 15:26:09.246127
196	Huyện Lâm Thao	15	2019-03-16 15:26:09.248896	2019-03-16 15:26:09.248896
197	Huyện Tam Nông	15	2019-03-16 15:26:09.251749	2019-03-16 15:26:09.251749
198	Huyện Thanh Thủy	15	2019-03-16 15:26:09.254266	2019-03-16 15:26:09.254266
199	Huyện Tân Sơn	15	2019-03-16 15:26:09.25848	2019-03-16 15:26:09.25848
200	Quận/Huyện khác	15	2019-03-16 15:26:09.263649	2019-03-16 15:26:09.263649
201	Thành phố Vĩnh Yên	16	2019-03-16 15:26:09.269182	2019-03-16 15:26:09.269182
202	Huyện Tam Dương	16	2019-03-16 15:26:09.27252	2019-03-16 15:26:09.27252
203	Huyện Lập Thạch	16	2019-03-16 15:26:09.27492	2019-03-16 15:26:09.27492
204	Huyện Vĩnh Tường	16	2019-03-16 15:26:09.277853	2019-03-16 15:26:09.277853
205	Huyện Yên Lạc	16	2019-03-16 15:26:09.281089	2019-03-16 15:26:09.281089
206	Huyện Bình Xuyên	16	2019-03-16 15:26:09.284182	2019-03-16 15:26:09.284182
207	Huyện Sông Lô	16	2019-03-16 15:26:09.286938	2019-03-16 15:26:09.286938
208	Thị xã Phúc Yên	16	2019-03-16 15:26:09.290199	2019-03-16 15:26:09.290199
209	Huyện Tam Đảo	16	2019-03-16 15:26:09.293782	2019-03-16 15:26:09.293782
210	Quận/Huyện khác	16	2019-03-16 15:26:09.298759	2019-03-16 15:26:09.298759
211	Thành phố Hạ Long	17	2019-03-16 15:26:09.304124	2019-03-16 15:26:09.304124
212	Thành phố Cẩm Phả	17	2019-03-16 15:26:09.306974	2019-03-16 15:26:09.306974
213	Thành phố Uông Bí	17	2019-03-16 15:26:09.310048	2019-03-16 15:26:09.310048
214	Thành phố Móng Cái	17	2019-03-16 15:26:09.31364	2019-03-16 15:26:09.31364
215	Huyện Bình Liêu	17	2019-03-16 15:26:09.316241	2019-03-16 15:26:09.316241
216	Huyện Đầm Hà	17	2019-03-16 15:26:09.319198	2019-03-16 15:26:09.319198
217	Huyện Hải Hà	17	2019-03-16 15:26:09.322417	2019-03-16 15:26:09.322417
218	Huyện Tiên Yên	17	2019-03-16 15:26:09.329715	2019-03-16 15:26:09.329715
219	Huyện Ba Chẽ	17	2019-03-16 15:26:09.333347	2019-03-16 15:26:09.333347
220	Huyện Đông Triều	17	2019-03-16 15:26:09.336602	2019-03-16 15:26:09.336602
221	Thị xã Quảng Yên	17	2019-03-16 15:26:09.33936	2019-03-16 15:26:09.33936
222	Huyện Hoành Bồ	17	2019-03-16 15:26:09.342724	2019-03-16 15:26:09.342724
223	Huyện Vân Đồn	17	2019-03-16 15:26:09.346289	2019-03-16 15:26:09.346289
224	Huyện Cô Tô	17	2019-03-16 15:26:09.348887	2019-03-16 15:26:09.348887
225	Quận/Huyện khác	17	2019-03-16 15:26:09.352185	2019-03-16 15:26:09.352185
226	Thành phố Bắc Giang	18	2019-03-16 15:26:09.358572	2019-03-16 15:26:09.358572
227	Huyện Yên Thế	18	2019-03-16 15:26:09.368374	2019-03-16 15:26:09.368374
228	Huyện Lục Ngạn	18	2019-03-16 15:26:09.372684	2019-03-16 15:26:09.372684
229	Huyện Sơn Động	18	2019-03-16 15:26:09.376213	2019-03-16 15:26:09.376213
230	Huyện Lục Nam	18	2019-03-16 15:26:09.38019	2019-03-16 15:26:09.38019
231	Huyện Tân Yên	18	2019-03-16 15:26:09.383142	2019-03-16 15:26:09.383142
232	Huyện Hiệp Hoà	18	2019-03-16 15:26:09.385834	2019-03-16 15:26:09.385834
233	Huyện Lạng Giang	18	2019-03-16 15:26:09.388781	2019-03-16 15:26:09.388781
234	Huyện Việt Yên	18	2019-03-16 15:26:09.392759	2019-03-16 15:26:09.392759
235	Huyện Yên Dũng	18	2019-03-16 15:26:09.399152	2019-03-16 15:26:09.399152
236	Quận/Huyện khác	18	2019-03-16 15:26:09.401431	2019-03-16 15:26:09.401431
237	Thành phố Bắc Ninh	19	2019-03-16 15:26:09.406151	2019-03-16 15:26:09.406151
238	Huyện Yên Phong	19	2019-03-16 15:26:09.409034	2019-03-16 15:26:09.409034
239	Huyện Quế Võ	19	2019-03-16 15:26:09.412513	2019-03-16 15:26:09.412513
240	Huyện Tiên Du	19	2019-03-16 15:26:09.415223	2019-03-16 15:26:09.415223
241	Thị xã Từ Sơn	19	2019-03-16 15:26:09.418243	2019-03-16 15:26:09.418243
242	Huyện Thuận Thành	19	2019-03-16 15:26:09.421699	2019-03-16 15:26:09.421699
243	Huyện Gia Bình	19	2019-03-16 15:26:09.428785	2019-03-16 15:26:09.428785
244	Huyện Lương Tài	19	2019-03-16 15:26:09.43275	2019-03-16 15:26:09.43275
245	Quận/Huyện khác	19	2019-03-16 15:26:09.435868	2019-03-16 15:26:09.435868
246	Thành phố Hải Dương	20	2019-03-16 15:26:09.441768	2019-03-16 15:26:09.441768
247	Thị xã Chí Linh	20	2019-03-16 15:26:09.445897	2019-03-16 15:26:09.445897
248	Huyện Nam Sách	20	2019-03-16 15:26:09.448882	2019-03-16 15:26:09.448882
249	Huyện Kinh Môn	20	2019-03-16 15:26:09.451608	2019-03-16 15:26:09.451608
250	Huyện Gia Lộc	20	2019-03-16 15:26:09.454259	2019-03-16 15:26:09.454259
251	Huyện Tứ Kỳ	20	2019-03-16 15:26:09.458094	2019-03-16 15:26:09.458094
252	Huyện Thanh Miện	20	2019-03-16 15:26:09.46478	2019-03-16 15:26:09.46478
253	Huyện Ninh Giang	20	2019-03-16 15:26:09.467838	2019-03-16 15:26:09.467838
254	Huyện Cẩm Giàng	20	2019-03-16 15:26:09.470318	2019-03-16 15:26:09.470318
255	Huyện Thanh Hà	20	2019-03-16 15:26:09.473259	2019-03-16 15:26:09.473259
256	Huyện Kim Thành	20	2019-03-16 15:26:09.477093	2019-03-16 15:26:09.477093
257	Huyện Bình Giang	20	2019-03-16 15:26:09.480259	2019-03-16 15:26:09.480259
258	Quận/Huyện khác	20	2019-03-16 15:26:09.483106	2019-03-16 15:26:09.483106
259	Thành phố Hưng Yên	21	2019-03-16 15:26:09.48958	2019-03-16 15:26:09.48958
260	Huyện Kim Động	21	2019-03-16 15:26:09.49608	2019-03-16 15:26:09.49608
261	Huyện Ân Thi	21	2019-03-16 15:26:09.49983	2019-03-16 15:26:09.49983
262	Huyện Khoái Châu	21	2019-03-16 15:26:09.502694	2019-03-16 15:26:09.502694
263	Huyện Yên Mỹ	21	2019-03-16 15:26:09.505203	2019-03-16 15:26:09.505203
264	Huyện Tiên Lữ	21	2019-03-16 15:26:09.508594	2019-03-16 15:26:09.508594
265	Huyện Phù Cừ	21	2019-03-16 15:26:09.512211	2019-03-16 15:26:09.512211
266	Huyện Mỹ Hào	21	2019-03-16 15:26:09.514518	2019-03-16 15:26:09.514518
267	Huyện Văn Lâm	21	2019-03-16 15:26:09.517052	2019-03-16 15:26:09.517052
268	Huyện Văn Giang	21	2019-03-16 15:26:09.519511	2019-03-16 15:26:09.519511
269	Quận/Huyện khác	21	2019-03-16 15:26:09.523497	2019-03-16 15:26:09.523497
270	Thành phố Hoà Bình	22	2019-03-16 15:26:09.53374	2019-03-16 15:26:09.53374
271	Huyện Đà Bắc	22	2019-03-16 15:26:09.536553	2019-03-16 15:26:09.536553
272	Huyện Mai Châu	22	2019-03-16 15:26:09.539351	2019-03-16 15:26:09.539351
273	Huyện Tân Lạc	22	2019-03-16 15:26:09.542713	2019-03-16 15:26:09.542713
274	Huyện Lạc Sơn	22	2019-03-16 15:26:09.546244	2019-03-16 15:26:09.546244
275	Huyện Kỳ Sơn	22	2019-03-16 15:26:09.548857	2019-03-16 15:26:09.548857
276	Huyện Lư­ơng Sơn	22	2019-03-16 15:26:09.552277	2019-03-16 15:26:09.552277
277	Huyện Kim Bôi	22	2019-03-16 15:26:09.555066	2019-03-16 15:26:09.555066
278	Huyện Lạc Thuỷ	22	2019-03-16 15:26:09.558855	2019-03-16 15:26:09.558855
279	Huyện Yên Thuỷ	22	2019-03-16 15:26:09.565565	2019-03-16 15:26:09.565565
280	Huyện Cao Phong	22	2019-03-16 15:26:09.568751	2019-03-16 15:26:09.568751
281	Quận/Huyện khác	22	2019-03-16 15:26:09.571402	2019-03-16 15:26:09.571402
282	Thành phố Phủ Lý	23	2019-03-16 15:26:09.577342	2019-03-16 15:26:09.577342
283	Huyện Duy Tiên	23	2019-03-16 15:26:09.580278	2019-03-16 15:26:09.580278
284	Huyện Kim Bảng	23	2019-03-16 15:26:09.582704	2019-03-16 15:26:09.582704
285	Huyện Lý Nhân	23	2019-03-16 15:26:09.586009	2019-03-16 15:26:09.586009
286	Huyện Thanh Liêm	23	2019-03-16 15:26:09.588305	2019-03-16 15:26:09.588305
287	Huyện Bình Lục	23	2019-03-16 15:26:09.595202	2019-03-16 15:26:09.595202
288	Quận/Huyện khác	23	2019-03-16 15:26:09.598614	2019-03-16 15:26:09.598614
289	Thành phố Nam Định	24	2019-03-16 15:26:09.603803	2019-03-16 15:26:09.603803
290	Huyện Mỹ Lộc	24	2019-03-16 15:26:09.606861	2019-03-16 15:26:09.606861
291	Huyện Xuân Trường	24	2019-03-16 15:26:09.60978	2019-03-16 15:26:09.60978
292	Huyện Giao Thủy	24	2019-03-16 15:26:09.61331	2019-03-16 15:26:09.61331
293	Huyện Ý Yên	24	2019-03-16 15:26:09.616139	2019-03-16 15:26:09.616139
294	Huyện Vụ Bản	24	2019-03-16 15:26:09.619141	2019-03-16 15:26:09.619141
295	Huyện Nam Trực	24	2019-03-16 15:26:09.622614	2019-03-16 15:26:09.622614
296	Huyện Trực Ninh	24	2019-03-16 15:26:09.62548	2019-03-16 15:26:09.62548
297	Huyện Nghĩa Hưng	24	2019-03-16 15:26:09.632572	2019-03-16 15:26:09.632572
298	Huyện Hải Hậu	24	2019-03-16 15:26:09.635838	2019-03-16 15:26:09.635838
299	Quận/Huyện khác	24	2019-03-16 15:26:09.63846	2019-03-16 15:26:09.63846
300	Thành phố Thái Bình	25	2019-03-16 15:26:09.644237	2019-03-16 15:26:09.644237
301	Huyện Quỳnh Phụ	25	2019-03-16 15:26:09.647615	2019-03-16 15:26:09.647615
302	Huyện Hưng Hà	25	2019-03-16 15:26:09.650016	2019-03-16 15:26:09.650016
303	Huyện Đông Hưng	25	2019-03-16 15:26:09.653204	2019-03-16 15:26:09.653204
304	Huyện Vũ Thư	25	2019-03-16 15:26:09.657309	2019-03-16 15:26:09.657309
305	Huyện Kiến Xương	25	2019-03-16 15:26:09.664788	2019-03-16 15:26:09.664788
306	Huyện Tiền Hải	25	2019-03-16 15:26:09.669011	2019-03-16 15:26:09.669011
307	Huyện Thái Thuỵ	25	2019-03-16 15:26:09.672188	2019-03-16 15:26:09.672188
308	Quận/Huyện khác	25	2019-03-16 15:26:09.674847	2019-03-16 15:26:09.674847
309	Thành phố Ninh Bình	26	2019-03-16 15:26:09.682009	2019-03-16 15:26:09.682009
310	Thị xã Tam Điệp	26	2019-03-16 15:26:09.6853	2019-03-16 15:26:09.6853
311	Huyện Nho Quan	26	2019-03-16 15:26:09.68848	2019-03-16 15:26:09.68848
312	Huyện Gia Viễn	26	2019-03-16 15:26:09.692511	2019-03-16 15:26:09.692511
313	Huyện Hoa Lư	26	2019-03-16 15:26:09.698368	2019-03-16 15:26:09.698368
314	Huyện Yên Mô	26	2019-03-16 15:26:09.701778	2019-03-16 15:26:09.701778
315	Huyện Kim Sơn	26	2019-03-16 15:26:09.704284	2019-03-16 15:26:09.704284
316	Huyện Yên Khánh	26	2019-03-16 15:26:09.707206	2019-03-16 15:26:09.707206
317	Quận/Huyện khác	26	2019-03-16 15:26:09.710598	2019-03-16 15:26:09.710598
318	Thành phố Thanh Hoá	27	2019-03-16 15:26:09.716805	2019-03-16 15:26:09.716805
319	Thị xã Bỉm Sơn	27	2019-03-16 15:26:09.719997	2019-03-16 15:26:09.719997
320	Thị xã Sầm Sơn	27	2019-03-16 15:26:09.724244	2019-03-16 15:26:09.724244
321	Huyện Quan Hoá	27	2019-03-16 15:26:09.728635	2019-03-16 15:26:09.728635
322	Huyện Quan Sơn	27	2019-03-16 15:26:09.731469	2019-03-16 15:26:09.731469
323	Huyện Mường Lát	27	2019-03-16 15:26:09.734996	2019-03-16 15:26:09.734996
324	Huyện Bá Thước	27	2019-03-16 15:26:09.737459	2019-03-16 15:26:09.737459
325	Huyện Thường Xuân	27	2019-03-16 15:26:09.740189	2019-03-16 15:26:09.740189
326	Huyện Như Xuân	27	2019-03-16 15:26:09.743345	2019-03-16 15:26:09.743345
327	Huyện Như Thanh	27	2019-03-16 15:26:09.746629	2019-03-16 15:26:09.746629
328	Huyện Lang Chánh	27	2019-03-16 15:26:09.749111	2019-03-16 15:26:09.749111
329	Huyện Ngọc Lặc	27	2019-03-16 15:26:09.751655	2019-03-16 15:26:09.751655
330	Huyện Thạch Thành	27	2019-03-16 15:26:09.754537	2019-03-16 15:26:09.754537
331	Huyện Cẩm Thủy	27	2019-03-16 15:26:09.759103	2019-03-16 15:26:09.759103
332	Huyện Thọ Xuân	27	2019-03-16 15:26:09.768769	2019-03-16 15:26:09.768769
333	Huyện Vĩnh Lộc	27	2019-03-16 15:26:09.773924	2019-03-16 15:26:09.773924
334	Huyện Thiệu Hoá	27	2019-03-16 15:26:09.776866	2019-03-16 15:26:09.776866
335	Huyện Triệu Sơn	27	2019-03-16 15:26:09.781645	2019-03-16 15:26:09.781645
336	Huyện Nông Cống	27	2019-03-16 15:26:09.784662	2019-03-16 15:26:09.784662
337	Huyện Đông Sơn	27	2019-03-16 15:26:09.787329	2019-03-16 15:26:09.787329
338	Huyện Hà Trung	27	2019-03-16 15:26:09.792257	2019-03-16 15:26:09.792257
339	Huyện Hoằng Hoá	27	2019-03-16 15:26:09.800546	2019-03-16 15:26:09.800546
340	Huyện Nga Sơn	27	2019-03-16 15:26:09.803217	2019-03-16 15:26:09.803217
341	Huyện Hậu Lộc	27	2019-03-16 15:26:09.806524	2019-03-16 15:26:09.806524
342	Huyện Quảng Xương	27	2019-03-16 15:26:09.809484	2019-03-16 15:26:09.809484
343	Huyện Tĩnh Gia	27	2019-03-16 15:26:09.813863	2019-03-16 15:26:09.813863
344	Huyện Yên Định	27	2019-03-16 15:26:09.816906	2019-03-16 15:26:09.816906
345	Quận/Huyện khác	27	2019-03-16 15:26:09.820518	2019-03-16 15:26:09.820518
346	Thành phố Vinh	28	2019-03-16 15:26:09.830836	2019-03-16 15:26:09.830836
347	Thị xã Cửa Lò	28	2019-03-16 15:26:09.835234	2019-03-16 15:26:09.835234
348	Huyện Quỳ Châu	28	2019-03-16 15:26:09.838986	2019-03-16 15:26:09.838986
349	Huyện Quỳ Hợp	28	2019-03-16 15:26:09.841625	2019-03-16 15:26:09.841625
350	Huyện Nghĩa Đàn	28	2019-03-16 15:26:09.846352	2019-03-16 15:26:09.846352
351	Huyện Quỳnh Lưu	28	2019-03-16 15:26:09.848954	2019-03-16 15:26:09.848954
352	Huyện Kỳ Sơn	28	2019-03-16 15:26:09.852447	2019-03-16 15:26:09.852447
353	Huyện Tương Dương	28	2019-03-16 15:26:09.856052	2019-03-16 15:26:09.856052
354	Huyện Con Cuông	28	2019-03-16 15:26:09.863425	2019-03-16 15:26:09.863425
355	Huyện Tân Kỳ	28	2019-03-16 15:26:09.868626	2019-03-16 15:26:09.868626
356	Huyện Yên Thành	28	2019-03-16 15:26:09.871637	2019-03-16 15:26:09.871637
357	Huyện Diễn Châu	28	2019-03-16 15:26:09.874568	2019-03-16 15:26:09.874568
358	Huyện Anh Sơn	28	2019-03-16 15:26:09.87913	2019-03-16 15:26:09.87913
359	Huyện Đô Lương	28	2019-03-16 15:26:09.88185	2019-03-16 15:26:09.88185
360	Huyện Thanh Chương	28	2019-03-16 15:26:09.885837	2019-03-16 15:26:09.885837
361	Huyện Nghi Lộc	28	2019-03-16 15:26:09.888976	2019-03-16 15:26:09.888976
362	Huyện Nam Đàn	28	2019-03-16 15:26:09.903347	2019-03-16 15:26:09.903347
363	Huyện Hưng Nguyên	28	2019-03-16 15:26:09.916499	2019-03-16 15:26:09.916499
364	Huyện Quế Phong	28	2019-03-16 15:26:09.9188	2019-03-16 15:26:09.9188
365	Thị Xã Thái Hòa	28	2019-03-16 15:26:09.921036	2019-03-16 15:26:09.921036
366	Thị Xã Hoàng Mai	28	2019-03-16 15:26:09.92656	2019-03-16 15:26:09.92656
367	Quận/Huyện khác	28	2019-03-16 15:26:09.932598	2019-03-16 15:26:09.932598
368	Thành phố Hà Tĩnh	29	2019-03-16 15:26:09.941239	2019-03-16 15:26:09.941239
369	Thị xã Hồng Lĩnh	29	2019-03-16 15:26:09.944586	2019-03-16 15:26:09.944586
370	Huyện Hương Sơn	29	2019-03-16 15:26:09.947913	2019-03-16 15:26:09.947913
371	Huyện Đức Thọ	29	2019-03-16 15:26:09.950304	2019-03-16 15:26:09.950304
372	Huyện Nghi Xuân	29	2019-03-16 15:26:09.952939	2019-03-16 15:26:09.952939
373	Huyện Can Lộc	29	2019-03-16 15:26:09.956692	2019-03-16 15:26:09.956692
374	Huyện Hương Khê	29	2019-03-16 15:26:09.959569	2019-03-16 15:26:09.959569
375	Huyện Thạch Hà	29	2019-03-16 15:26:09.966669	2019-03-16 15:26:09.966669
376	Huyện Cẩm Xuyên	29	2019-03-16 15:26:09.969106	2019-03-16 15:26:09.969106
377	Huyện Kỳ Anh	29	2019-03-16 15:26:09.97233	2019-03-16 15:26:09.97233
378	Huyện Vũ Quang	29	2019-03-16 15:26:09.97472	2019-03-16 15:26:09.97472
379	Huyện Lộc Hà	29	2019-03-16 15:26:09.977546	2019-03-16 15:26:09.977546
380	Quận/Huyện khác	29	2019-03-16 15:26:09.981442	2019-03-16 15:26:09.981442
381	Thành phố Đồng Hới	30	2019-03-16 15:26:09.986875	2019-03-16 15:26:09.986875
382	Huyện Tuyên Hoá	30	2019-03-16 15:26:09.990316	2019-03-16 15:26:09.990316
383	Huyện Minh Hoá	30	2019-03-16 15:26:09.995704	2019-03-16 15:26:09.995704
384	Huyện Quảng Trạch	30	2019-03-16 15:26:09.999602	2019-03-16 15:26:09.999602
385	Huyện Bố Trạch	30	2019-03-16 15:26:10.002525	2019-03-16 15:26:10.002525
386	Huyện Quảng Ninh	30	2019-03-16 15:26:10.005112	2019-03-16 15:26:10.005112
387	Huyện Lệ Thuỷ	30	2019-03-16 15:26:10.007627	2019-03-16 15:26:10.007627
388	Quận/Huyện khác	30	2019-03-16 15:26:10.011292	2019-03-16 15:26:10.011292
389	Thành phố Đông Hà	31	2019-03-16 15:26:10.016335	2019-03-16 15:26:10.016335
390	Thị xã Quảng Trị	31	2019-03-16 15:26:10.019466	2019-03-16 15:26:10.019466
391	Huyện Vĩnh Linh	31	2019-03-16 15:26:10.022893	2019-03-16 15:26:10.022893
392	Huyện Gio Linh	31	2019-03-16 15:26:10.053612	2019-03-16 15:26:10.053612
393	Huyện Cam Lộ	31	2019-03-16 15:26:10.057717	2019-03-16 15:26:10.057717
394	Huyện Triệu Phong	31	2019-03-16 15:26:10.06346	2019-03-16 15:26:10.06346
395	Huyện Hải Lăng	31	2019-03-16 15:26:10.067451	2019-03-16 15:26:10.067451
396	Huyện Hướng Hóa	31	2019-03-16 15:26:10.080305	2019-03-16 15:26:10.080305
397	Huyện Đăk Rông	31	2019-03-16 15:26:10.083114	2019-03-16 15:26:10.083114
398	Huyện đảo Cồn Cỏ	31	2019-03-16 15:26:10.085863	2019-03-16 15:26:10.085863
399	Quận/Huyện khác	31	2019-03-16 15:26:10.089962	2019-03-16 15:26:10.089962
400	Thành phố Huế	32	2019-03-16 15:26:10.100984	2019-03-16 15:26:10.100984
401	Huyện Phong Điền	32	2019-03-16 15:26:10.105048	2019-03-16 15:26:10.105048
402	Huyện Quảng Điền	32	2019-03-16 15:26:10.107846	2019-03-16 15:26:10.107846
403	Thị xã Hương Trà	32	2019-03-16 15:26:10.111602	2019-03-16 15:26:10.111602
404	Huyện Phú Vang	32	2019-03-16 15:26:10.114048	2019-03-16 15:26:10.114048
405	Thị xã Hương Thủy	32	2019-03-16 15:26:10.116456	2019-03-16 15:26:10.116456
406	Huyện Phú Lộc	32	2019-03-16 15:26:10.119506	2019-03-16 15:26:10.119506
407	Huyện Nam Đông	32	2019-03-16 15:26:10.123345	2019-03-16 15:26:10.123345
408	Huyện A Lưới	32	2019-03-16 15:26:10.12635	2019-03-16 15:26:10.12635
409	Quận/Huyện khác	32	2019-03-16 15:26:10.131608	2019-03-16 15:26:10.131608
410	Thành phố Tam Kỳ	33	2019-03-16 15:26:10.13726	2019-03-16 15:26:10.13726
411	Thành phố Hội An	33	2019-03-16 15:26:10.140227	2019-03-16 15:26:10.140227
412	Huyện Duy Xuyên	33	2019-03-16 15:26:10.144588	2019-03-16 15:26:10.144588
413	Huyện Điện Bàn	33	2019-03-16 15:26:10.14793	2019-03-16 15:26:10.14793
414	Huyện Đại Lộc	33	2019-03-16 15:26:10.150915	2019-03-16 15:26:10.150915
415	Huyện Quế Sơn	33	2019-03-16 15:26:10.153667	2019-03-16 15:26:10.153667
416	Huyện Hiệp Đức	33	2019-03-16 15:26:10.157412	2019-03-16 15:26:10.157412
417	Huyện Thăng Bình	33	2019-03-16 15:26:10.163536	2019-03-16 15:26:10.163536
418	Huyện Núi Thành	33	2019-03-16 15:26:10.169898	2019-03-16 15:26:10.169898
419	Huyện Tiên Phước	33	2019-03-16 15:26:10.172408	2019-03-16 15:26:10.172408
420	Huyện Bắc Trà My	33	2019-03-16 15:26:10.175018	2019-03-16 15:26:10.175018
421	Huyện Đông Giang	33	2019-03-16 15:26:10.179059	2019-03-16 15:26:10.179059
422	Huyện Nam Giang	33	2019-03-16 15:26:10.182021	2019-03-16 15:26:10.182021
423	Huyện Phước Sơn	33	2019-03-16 15:26:10.185615	2019-03-16 15:26:10.185615
424	Huyện Nam Trà My	33	2019-03-16 15:26:10.189266	2019-03-16 15:26:10.189266
425	Huyện Tây Giang	33	2019-03-16 15:26:10.192733	2019-03-16 15:26:10.192733
426	Huyện Phú Ninh	33	2019-03-16 15:26:10.1999	2019-03-16 15:26:10.1999
427	Huyện Nông Sơn	33	2019-03-16 15:26:10.20323	2019-03-16 15:26:10.20323
428	Quận/Huyện khác	33	2019-03-16 15:26:10.206066	2019-03-16 15:26:10.206066
429	Thành phố Quảng Ngãi	34	2019-03-16 15:26:10.213729	2019-03-16 15:26:10.213729
430	Huyện Lý Sơn	34	2019-03-16 15:26:10.216789	2019-03-16 15:26:10.216789
431	Huyện Bình Sơn	34	2019-03-16 15:26:10.219664	2019-03-16 15:26:10.219664
432	Huyện Trà Bồng	34	2019-03-16 15:26:10.223045	2019-03-16 15:26:10.223045
433	Huyện Sơn Tịnh	34	2019-03-16 15:26:10.228482	2019-03-16 15:26:10.228482
434	Huyện Sơn Hà	34	2019-03-16 15:26:10.233292	2019-03-16 15:26:10.233292
435	Huyện Tư Nghĩa	34	2019-03-16 15:26:10.235952	2019-03-16 15:26:10.235952
436	Huyện Nghĩa Hành	34	2019-03-16 15:26:10.238856	2019-03-16 15:26:10.238856
437	Huyện Minh Long	34	2019-03-16 15:26:10.243488	2019-03-16 15:26:10.243488
438	Huyện Mộ Đức	34	2019-03-16 15:26:10.247934	2019-03-16 15:26:10.247934
439	Huyện Đức Phổ	34	2019-03-16 15:26:10.251817	2019-03-16 15:26:10.251817
440	Huyện Ba Tơ	34	2019-03-16 15:26:10.254449	2019-03-16 15:26:10.254449
441	Huyện Sơn Tây	34	2019-03-16 15:26:10.260091	2019-03-16 15:26:10.260091
442	Huyện Tây Trà	34	2019-03-16 15:26:10.267916	2019-03-16 15:26:10.267916
443	Quận/Huyện khác	34	2019-03-16 15:26:10.271205	2019-03-16 15:26:10.271205
444	Thành phố Kon Tum	35	2019-03-16 15:26:10.277601	2019-03-16 15:26:10.277601
445	Huyện Đăk Glei	35	2019-03-16 15:26:10.281338	2019-03-16 15:26:10.281338
446	Huyện Ngọc Hồi	35	2019-03-16 15:26:10.284387	2019-03-16 15:26:10.284387
447	Huyện Đăk Tô	35	2019-03-16 15:26:10.286977	2019-03-16 15:26:10.286977
448	Huyện Sa Thầy	35	2019-03-16 15:26:10.291358	2019-03-16 15:26:10.291358
449	Huyện Kon Plông	35	2019-03-16 15:26:10.297986	2019-03-16 15:26:10.297986
450	Huyện Đăk Hà	35	2019-03-16 15:26:10.301647	2019-03-16 15:26:10.301647
451	Huyện Kon Rẫy	35	2019-03-16 15:26:10.305512	2019-03-16 15:26:10.305512
452	Huyện Tu Mơ Rông	35	2019-03-16 15:26:10.308008	2019-03-16 15:26:10.308008
453	Quận/Huyện khác	35	2019-03-16 15:26:10.31328	2019-03-16 15:26:10.31328
454	Thành phố Quy Nhơn	36	2019-03-16 15:26:10.318519	2019-03-16 15:26:10.318519
455	Huyện An Lão	36	2019-03-16 15:26:10.323713	2019-03-16 15:26:10.323713
456	Huyện Hoài Ân	36	2019-03-16 15:26:10.326648	2019-03-16 15:26:10.326648
457	Huyện Hoài Nhơn	36	2019-03-16 15:26:10.36093	2019-03-16 15:26:10.36093
458	Huyện Phù Mỹ	36	2019-03-16 15:26:10.374581	2019-03-16 15:26:10.374581
459	Huyện Phù Cát	36	2019-03-16 15:26:10.383294	2019-03-16 15:26:10.383294
460	Huyện Vĩnh Thạnh	36	2019-03-16 15:26:10.391692	2019-03-16 15:26:10.391692
461	Huyện Tây Sơn	36	2019-03-16 15:26:10.396688	2019-03-16 15:26:10.396688
462	Huyện Vân Canh	36	2019-03-16 15:26:10.40063	2019-03-16 15:26:10.40063
463	Thị xã An Nhơn	36	2019-03-16 15:26:10.403059	2019-03-16 15:26:10.403059
464	Huyện Tuy Phước	36	2019-03-16 15:26:10.405482	2019-03-16 15:26:10.405482
465	Quận/Huyện khác	36	2019-03-16 15:26:10.408301	2019-03-16 15:26:10.408301
466	Thành phố Pleiku	37	2019-03-16 15:26:10.414133	2019-03-16 15:26:10.414133
467	Huyện Chư Păh	37	2019-03-16 15:26:10.416733	2019-03-16 15:26:10.416733
468	Huyện Mang Yang	37	2019-03-16 15:26:10.419509	2019-03-16 15:26:10.419509
469	Huyện Kbang	37	2019-03-16 15:26:10.42308	2019-03-16 15:26:10.42308
470	Thị xã An Khê	37	2019-03-16 15:26:10.426027	2019-03-16 15:26:10.426027
471	Huyện Kông Chro	37	2019-03-16 15:26:10.431711	2019-03-16 15:26:10.431711
472	Huyện Đức Cơ	37	2019-03-16 15:26:10.434225	2019-03-16 15:26:10.434225
473	Huyện Chư Prông	37	2019-03-16 15:26:10.436424	2019-03-16 15:26:10.436424
474	Huyện Chư Sê	37	2019-03-16 15:26:10.438938	2019-03-16 15:26:10.438938
475	Thị xã Ayun Pa	37	2019-03-16 15:26:10.441232	2019-03-16 15:26:10.441232
476	Huyện Krông Pa	37	2019-03-16 15:26:10.444444	2019-03-16 15:26:10.444444
477	Huyện Ia Grai	37	2019-03-16 15:26:10.447379	2019-03-16 15:26:10.447379
478	Huyện Đak Đoa	37	2019-03-16 15:26:10.44959	2019-03-16 15:26:10.44959
479	Huyện Ia Pa	37	2019-03-16 15:26:10.45172	2019-03-16 15:26:10.45172
480	Huyện Đak Pơ	37	2019-03-16 15:26:10.453834	2019-03-16 15:26:10.453834
481	Huyện Phú Thiện	37	2019-03-16 15:26:10.457538	2019-03-16 15:26:10.457538
482	Huyện Chư Pưh	37	2019-03-16 15:26:10.459964	2019-03-16 15:26:10.459964
483	Quận/Huyện khác	37	2019-03-16 15:26:10.465715	2019-03-16 15:26:10.465715
484	Thành phố Tuy Hòa	38	2019-03-16 15:26:10.470627	2019-03-16 15:26:10.470627
485	Huyện Đồng Xuân	38	2019-03-16 15:26:10.473183	2019-03-16 15:26:10.473183
486	Thị Xã Sông Cầu	38	2019-03-16 15:26:10.475367	2019-03-16 15:26:10.475367
487	Huyện Tuy An	38	2019-03-16 15:26:10.478564	2019-03-16 15:26:10.478564
488	Huyện Sơn Hòa	38	2019-03-16 15:26:10.481191	2019-03-16 15:26:10.481191
489	Huyện Sông Hinh	38	2019-03-16 15:26:10.483534	2019-03-16 15:26:10.483534
490	Huyện Đông Hòa	38	2019-03-16 15:26:10.485904	2019-03-16 15:26:10.485904
491	Huyện Phú Hòa	38	2019-03-16 15:26:10.489377	2019-03-16 15:26:10.489377
492	Huyện Tây Hòa	38	2019-03-16 15:26:10.491896	2019-03-16 15:26:10.491896
493	Quận/Huyện khác	38	2019-03-16 15:26:10.497837	2019-03-16 15:26:10.497837
494	Thành phố Buôn Ma Thuột	39	2019-03-16 15:26:10.502618	2019-03-16 15:26:10.502618
495	Huyện Ea H Leo	39	2019-03-16 15:26:10.504951	2019-03-16 15:26:10.504951
496	Huyện Krông Buk	39	2019-03-16 15:26:10.507211	2019-03-16 15:26:10.507211
497	Huyện Krông Năng	39	2019-03-16 15:26:10.509709	2019-03-16 15:26:10.509709
498	Huyện Ea Súp	39	2019-03-16 15:26:10.51422	2019-03-16 15:26:10.51422
499	Huyện Cư Mgar	39	2019-03-16 15:26:10.517149	2019-03-16 15:26:10.517149
500	Huyện Krông Pắc	39	2019-03-16 15:26:10.519405	2019-03-16 15:26:10.519405
501	Huyện Ea Kar	39	2019-03-16 15:26:10.522564	2019-03-16 15:26:10.522564
502	Huyện M Đrăk	39	2019-03-16 15:26:10.525584	2019-03-16 15:26:10.525584
503	Huyện Krông Ana	39	2019-03-16 15:26:10.530092	2019-03-16 15:26:10.530092
504	Huyện Krông Bông	39	2019-03-16 15:26:10.532304	2019-03-16 15:26:10.532304
505	Huyện Lăk	39	2019-03-16 15:26:10.534736	2019-03-16 15:26:10.534736
506	Huyện Buôn Đôn	39	2019-03-16 15:26:10.537218	2019-03-16 15:26:10.537218
507	Huyện Cư Kuin	39	2019-03-16 15:26:10.53973	2019-03-16 15:26:10.53973
508	Thị Xã Buôn Hồ	39	2019-03-16 15:26:10.54193	2019-03-16 15:26:10.54193
509	Quận/Huyện khác	39	2019-03-16 15:26:10.545283	2019-03-16 15:26:10.545283
510	Thành phố Nha Trang	40	2019-03-16 15:26:10.583059	2019-03-16 15:26:10.583059
511	Huyện Vạn Ninh	40	2019-03-16 15:26:10.591654	2019-03-16 15:26:10.591654
512	Huyện Ninh Hoà	40	2019-03-16 15:26:10.596171	2019-03-16 15:26:10.596171
513	Huyện Diên Khánh	40	2019-03-16 15:26:10.600192	2019-03-16 15:26:10.600192
514	Huyện Khánh Vĩnh	40	2019-03-16 15:26:10.602479	2019-03-16 15:26:10.602479
515	Thị xã Cam Ranh	40	2019-03-16 15:26:10.604891	2019-03-16 15:26:10.604891
516	Huyện Khánh Sơn	40	2019-03-16 15:26:10.607286	2019-03-16 15:26:10.607286
517	Huyện đảo Trường Sa	40	2019-03-16 15:26:10.609448	2019-03-16 15:26:10.609448
518	Huyện Cam Lâm	40	2019-03-16 15:26:10.63676	2019-03-16 15:26:10.63676
519	Quận/Huyện khác	40	2019-03-16 15:26:10.663311	2019-03-16 15:26:10.663311
520	Thành phố Đà Lạt	41	2019-03-16 15:26:10.671015	2019-03-16 15:26:10.671015
521	Thành phố Bảo Lộc	41	2019-03-16 15:26:10.673651	2019-03-16 15:26:10.673651
522	Huyện Đức Trọng	41	2019-03-16 15:26:10.677473	2019-03-16 15:26:10.677473
523	Huyện Di Linh	41	2019-03-16 15:26:10.681161	2019-03-16 15:26:10.681161
524	Huyện Đơn Dương	41	2019-03-16 15:26:10.684435	2019-03-16 15:26:10.684435
525	Huyện Lạc Dương	41	2019-03-16 15:26:10.6883	2019-03-16 15:26:10.6883
526	Huyện Đạ Huoai	41	2019-03-16 15:26:10.692671	2019-03-16 15:26:10.692671
527	Huyện Đạ Tẻh	41	2019-03-16 15:26:10.69886	2019-03-16 15:26:10.69886
528	Huyện Cát Tiên	41	2019-03-16 15:26:10.703247	2019-03-16 15:26:10.703247
529	Huyện Lâm Hà	41	2019-03-16 15:26:10.706385	2019-03-16 15:26:10.706385
530	Huyện Bảo Lâm	41	2019-03-16 15:26:10.709557	2019-03-16 15:26:10.709557
531	Huyện Đam Rông	41	2019-03-16 15:26:10.71401	2019-03-16 15:26:10.71401
532	Quận/Huyện khác	41	2019-03-16 15:26:10.716856	2019-03-16 15:26:10.716856
533	Thị xã Đồng Xoài	42	2019-03-16 15:26:10.724671	2019-03-16 15:26:10.724671
534	Huyện Đồng Phú	42	2019-03-16 15:26:10.73482	2019-03-16 15:26:10.73482
535	Huyện Chơn Thành	42	2019-03-16 15:26:10.737567	2019-03-16 15:26:10.737567
536	Huyện Bình Long	42	2019-03-16 15:26:10.740348	2019-03-16 15:26:10.740348
537	Huyện Lộc Ninh	42	2019-03-16 15:26:10.745683	2019-03-16 15:26:10.745683
538	Huyện Bù Đốp	42	2019-03-16 15:26:10.751073	2019-03-16 15:26:10.751073
539	Huyện Phước Long	42	2019-03-16 15:26:10.75497	2019-03-16 15:26:10.75497
540	Huyện Bù Đăng	42	2019-03-16 15:26:10.763225	2019-03-16 15:26:10.763225
541	Huyện Hớn Quản	42	2019-03-16 15:26:10.769417	2019-03-16 15:26:10.769417
542	Huyện Bù Gia Mập	42	2019-03-16 15:26:10.772501	2019-03-16 15:26:10.772501
543	Quận/Huyện khác	42	2019-03-16 15:26:10.775952	2019-03-16 15:26:10.775952
544	Th. phố Thủ Dầu Một	43	2019-03-16 15:26:10.784629	2019-03-16 15:26:10.784629
545	Huyện Bến Cát	43	2019-03-16 15:26:10.789496	2019-03-16 15:26:10.789496
546	Huyện Tân Uyên	43	2019-03-16 15:26:10.798654	2019-03-16 15:26:10.798654
547	Thị xã Thuận An	43	2019-03-16 15:26:10.838485	2019-03-16 15:26:10.838485
548	Thị xã Dĩ An	43	2019-03-16 15:26:10.854138	2019-03-16 15:26:10.854138
549	Huyện Phú Giáo	43	2019-03-16 15:26:10.858225	2019-03-16 15:26:10.858225
550	Huyện Dầu Tiếng	43	2019-03-16 15:26:10.866171	2019-03-16 15:26:10.866171
551	Quận/Huyện khác	43	2019-03-16 15:26:10.879911	2019-03-16 15:26:10.879911
552	Thành phố Phan Rang -Tháp Chàm	44	2019-03-16 15:26:10.890837	2019-03-16 15:26:10.890837
553	Huyện Ninh Sơn	44	2019-03-16 15:26:10.898193	2019-03-16 15:26:10.898193
554	Huyện Ninh Hải	44	2019-03-16 15:26:10.901606	2019-03-16 15:26:10.901606
555	Huyện Ninh Phước	44	2019-03-16 15:26:10.903981	2019-03-16 15:26:10.903981
556	Huyện Bác Ái	44	2019-03-16 15:26:10.906269	2019-03-16 15:26:10.906269
557	Huyện Thuận Bắc	44	2019-03-16 15:26:10.910034	2019-03-16 15:26:10.910034
558	Huyện Thuận Nam	44	2019-03-16 15:26:10.913457	2019-03-16 15:26:10.913457
559	Quận/Huyện khác	44	2019-03-16 15:26:10.916533	2019-03-16 15:26:10.916533
560	Thị xã Tây Ninh	45	2019-03-16 15:26:10.921409	2019-03-16 15:26:10.921409
561	Huyện Tân Biên	45	2019-03-16 15:26:10.925837	2019-03-16 15:26:10.925837
562	Huyện Tân Châu	45	2019-03-16 15:26:10.930389	2019-03-16 15:26:10.930389
563	Huyện Dương Minh Châu	45	2019-03-16 15:26:10.933355	2019-03-16 15:26:10.933355
564	Huyện Châu Thành	45	2019-03-16 15:26:10.93576	2019-03-16 15:26:10.93576
565	Huyện Hòa Thành	45	2019-03-16 15:26:10.938343	2019-03-16 15:26:10.938343
566	Huyện Bến Cầu	45	2019-03-16 15:26:10.941247	2019-03-16 15:26:10.941247
567	Huyện Gò Dầu	45	2019-03-16 15:26:10.944193	2019-03-16 15:26:10.944193
568	Huyện Trảng Bàng	45	2019-03-16 15:26:10.947782	2019-03-16 15:26:10.947782
569	Quận/Huyện khác	45	2019-03-16 15:26:10.950853	2019-03-16 15:26:10.950853
570	Thành phố Phan Thiết	46	2019-03-16 15:26:10.957265	2019-03-16 15:26:10.957265
571	Huyện Tuy Phong	46	2019-03-16 15:26:10.966145	2019-03-16 15:26:10.966145
572	Huyện Bắc Bình	46	2019-03-16 15:26:10.970752	2019-03-16 15:26:10.970752
573	Huyện Hàm Thuận Bắc	46	2019-03-16 15:26:10.973567	2019-03-16 15:26:10.973567
574	Huyện Hàm Thuận Nam	46	2019-03-16 15:26:10.97583	2019-03-16 15:26:10.97583
575	Huyện Hàm Tân	46	2019-03-16 15:26:10.980095	2019-03-16 15:26:10.980095
576	Huyện Đức Linh	46	2019-03-16 15:26:10.982328	2019-03-16 15:26:10.982328
577	Huyện Tánh Linh	46	2019-03-16 15:26:10.984658	2019-03-16 15:26:10.984658
578	Huyện đảo Phú Quý	46	2019-03-16 15:26:10.987027	2019-03-16 15:26:10.987027
579	Thị xã La Gi	46	2019-03-16 15:26:10.991036	2019-03-16 15:26:10.991036
580	Quận/Huyện khác	46	2019-03-16 15:26:10.993491	2019-03-16 15:26:10.993491
581	Thành phố Biên Hoà	47	2019-03-16 15:26:11.002538	2019-03-16 15:26:11.002538
582	Huyện Vĩnh Cửu	47	2019-03-16 15:26:11.005378	2019-03-16 15:26:11.005378
583	Huyện Tân Phú	47	2019-03-16 15:26:11.007707	2019-03-16 15:26:11.007707
584	Huyện Định Quán	47	2019-03-16 15:26:11.010066	2019-03-16 15:26:11.010066
585	Huyện Thống Nhất	47	2019-03-16 15:26:11.013841	2019-03-16 15:26:11.013841
586	Thị xã Long Khánh	47	2019-03-16 15:26:11.016139	2019-03-16 15:26:11.016139
587	Huyện Xuân Lộc	47	2019-03-16 15:26:11.018915	2019-03-16 15:26:11.018915
588	Huyện Long Thành	47	2019-03-16 15:26:11.022306	2019-03-16 15:26:11.022306
589	Huyện Nhơn Trạch	47	2019-03-16 15:26:11.025997	2019-03-16 15:26:11.025997
590	Huyện Trảng Bom	47	2019-03-16 15:26:11.032401	2019-03-16 15:26:11.032401
591	Huyện Cẩm Mỹ	47	2019-03-16 15:26:11.035036	2019-03-16 15:26:11.035036
592	Quận/Huyện khác	47	2019-03-16 15:26:11.037555	2019-03-16 15:26:11.037555
593	Thành phố Tân An	48	2019-03-16 15:26:11.041992	2019-03-16 15:26:11.041992
594	Huyện Vĩnh Hưng	48	2019-03-16 15:26:11.046333	2019-03-16 15:26:11.046333
595	Huyện Mộc Hoá	48	2019-03-16 15:26:11.048652	2019-03-16 15:26:11.048652
596	Huyện Tân Thạnh	48	2019-03-16 15:26:11.051243	2019-03-16 15:26:11.051243
597	Huyện Thạnh Hoá	48	2019-03-16 15:26:11.053627	2019-03-16 15:26:11.053627
598	Huyện Đức Huệ	48	2019-03-16 15:26:11.057115	2019-03-16 15:26:11.057115
599	Huyện Đức Hoà	48	2019-03-16 15:26:11.059996	2019-03-16 15:26:11.059996
600	Huyện Bến Lức	48	2019-03-16 15:26:11.066026	2019-03-16 15:26:11.066026
601	Huyện Thủ Thừa	48	2019-03-16 15:26:11.068978	2019-03-16 15:26:11.068978
602	Huyện Châu Thành	48	2019-03-16 15:26:11.071628	2019-03-16 15:26:11.071628
603	Huyện Tân Trụ	48	2019-03-16 15:26:11.073946	2019-03-16 15:26:11.073946
604	Huyện Cần Đước	48	2019-03-16 15:26:11.076562	2019-03-16 15:26:11.076562
605	Huyện Cần Giuộc	48	2019-03-16 15:26:11.080307	2019-03-16 15:26:11.080307
606	Huyện Tân Hưng	48	2019-03-16 15:26:11.08317	2019-03-16 15:26:11.08317
607	Thị xã Kiến Tường	48	2019-03-16 15:26:11.085929	2019-03-16 15:26:11.085929
608	Quận/Huyện khác	48	2019-03-16 15:26:11.088448	2019-03-16 15:26:11.088448
609	Thành phố Cao Lãnh	49	2019-03-16 15:26:11.106219	2019-03-16 15:26:11.106219
610	Thành phố Sa Đéc	49	2019-03-16 15:26:11.120354	2019-03-16 15:26:11.120354
611	Huyện Tân Hồng	49	2019-03-16 15:26:11.124437	2019-03-16 15:26:11.124437
612	Huyện Hồng Ngự	49	2019-03-16 15:26:11.133754	2019-03-16 15:26:11.133754
613	Huyện Tam Nông	49	2019-03-16 15:26:11.136291	2019-03-16 15:26:11.136291
614	Huyện Thanh Bình	49	2019-03-16 15:26:11.139445	2019-03-16 15:26:11.139445
615	Huyện Cao Lãnh	49	2019-03-16 15:26:11.143055	2019-03-16 15:26:11.143055
616	Huyện Lấp Vò	49	2019-03-16 15:26:11.148314	2019-03-16 15:26:11.148314
617	Huyện Tháp Mười	49	2019-03-16 15:26:11.150805	2019-03-16 15:26:11.150805
618	Huyện Lai Vung	49	2019-03-16 15:26:11.153442	2019-03-16 15:26:11.153442
619	Huyện Châu Thành	49	2019-03-16 15:26:11.157571	2019-03-16 15:26:11.157571
620	Thị Xã Hồng Ngự	49	2019-03-16 15:26:11.160021	2019-03-16 15:26:11.160021
621	Quận/Huyện khác	49	2019-03-16 15:26:11.167244	2019-03-16 15:26:11.167244
622	Thành phố Long Xuyên	50	2019-03-16 15:26:11.172591	2019-03-16 15:26:11.172591
623	Thị xã Châu Đốc	50	2019-03-16 15:26:11.174913	2019-03-16 15:26:11.174913
624	Huyện An Phú	50	2019-03-16 15:26:11.177093	2019-03-16 15:26:11.177093
625	Huyện Tân Châu	50	2019-03-16 15:26:11.181339	2019-03-16 15:26:11.181339
626	Huyện Phú Tân	50	2019-03-16 15:26:11.183566	2019-03-16 15:26:11.183566
627	Huyện Tịnh Biên	50	2019-03-16 15:26:11.186691	2019-03-16 15:26:11.186691
628	Huyện Tri Tôn	50	2019-03-16 15:26:11.189977	2019-03-16 15:26:11.189977
629	Huyện Châu Phú	50	2019-03-16 15:26:11.192753	2019-03-16 15:26:11.192753
630	Huyện Chợ Mới	50	2019-03-16 15:26:11.200103	2019-03-16 15:26:11.200103
631	Huyện Châu Thành	50	2019-03-16 15:26:11.203083	2019-03-16 15:26:11.203083
632	Huyện Thoại Sơn	50	2019-03-16 15:26:11.205548	2019-03-16 15:26:11.205548
633	Quận/Huyện khác	50	2019-03-16 15:26:11.207771	2019-03-16 15:26:11.207771
634	Thành phố Vũng Tàu	51	2019-03-16 15:26:11.215563	2019-03-16 15:26:11.215563
635	Thành phố Bà Rịa	51	2019-03-16 15:26:11.219869	2019-03-16 15:26:11.219869
636	Huyện Xuyên Mộc	51	2019-03-16 15:26:11.224492	2019-03-16 15:26:11.224492
637	Huyện Long Điền	51	2019-03-16 15:26:11.236488	2019-03-16 15:26:11.236488
638	Huyện Côn Đảo	51	2019-03-16 15:26:11.246505	2019-03-16 15:26:11.246505
639	Huyện Tân Thành	51	2019-03-16 15:26:11.250118	2019-03-16 15:26:11.250118
640	Huyện Châu Đức	51	2019-03-16 15:26:11.254197	2019-03-16 15:26:11.254197
641	Huyện Đất Đỏ	51	2019-03-16 15:26:11.259029	2019-03-16 15:26:11.259029
642	Quận/Huyện khác	51	2019-03-16 15:26:11.268251	2019-03-16 15:26:11.268251
643	Thành phố Mỹ Tho	52	2019-03-16 15:26:11.275026	2019-03-16 15:26:11.275026
644	Thị xã Gò Công	52	2019-03-16 15:26:11.2803	2019-03-16 15:26:11.2803
645	Huyện Cái bè	52	2019-03-16 15:26:11.283751	2019-03-16 15:26:11.283751
646	Huyện Cai lậy	52	2019-03-16 15:26:11.286793	2019-03-16 15:26:11.286793
647	Huyện Châu thành	52	2019-03-16 15:26:11.290098	2019-03-16 15:26:11.290098
648	Huyện Chợ Gạo	52	2019-03-16 15:26:11.29278	2019-03-16 15:26:11.29278
649	Huyện Gò Công Tây	52	2019-03-16 15:26:11.297191	2019-03-16 15:26:11.297191
650	Huyện Gò Công Đông	52	2019-03-16 15:26:11.300423	2019-03-16 15:26:11.300423
651	Huyện Tân Phước	52	2019-03-16 15:26:11.30372	2019-03-16 15:26:11.30372
652	Huyện Tân Phú Đông	52	2019-03-16 15:26:11.30667	2019-03-16 15:26:11.30667
653	Quận/Huyện khác	52	2019-03-16 15:26:11.30906	2019-03-16 15:26:11.30906
654	Thành phố Rạch Giá	53	2019-03-16 15:26:11.315705	2019-03-16 15:26:11.315705
655	Thị xã Hà Tiên	53	2019-03-16 15:26:11.318244	2019-03-16 15:26:11.318244
656	Huyện Kiên Lương	53	2019-03-16 15:26:11.320707	2019-03-16 15:26:11.320707
657	Huyện Hòn Đất	53	2019-03-16 15:26:11.32402	2019-03-16 15:26:11.32402
658	Huyện Tân Hiệp	53	2019-03-16 15:26:11.326625	2019-03-16 15:26:11.326625
659	Huyện Châu Thành	53	2019-03-16 15:26:11.330858	2019-03-16 15:26:11.330858
660	Huyện Giồng Riềng	53	2019-03-16 15:26:11.33337	2019-03-16 15:26:11.33337
661	Huyện Gò Quao	53	2019-03-16 15:26:11.335704	2019-03-16 15:26:11.335704
662	Huyện An Biên	53	2019-03-16 15:26:11.338026	2019-03-16 15:26:11.338026
663	Huyện An Minh	53	2019-03-16 15:26:11.340575	2019-03-16 15:26:11.340575
664	Huyện Vĩnh Thuận	53	2019-03-16 15:26:11.342971	2019-03-16 15:26:11.342971
665	Huyện Phú Quốc	53	2019-03-16 15:26:11.346733	2019-03-16 15:26:11.346733
666	Huyện Kiên Hải	53	2019-03-16 15:26:11.349236	2019-03-16 15:26:11.349236
667	Huyện U Minh Thượng	53	2019-03-16 15:26:11.351502	2019-03-16 15:26:11.351502
668	Huyện Giang Thành	53	2019-03-16 15:26:11.353789	2019-03-16 15:26:11.353789
669	Quận/Huyện khác	53	2019-03-16 15:26:11.357412	2019-03-16 15:26:11.357412
670	Thành phố Trà Vinh	54	2019-03-16 15:26:11.368711	2019-03-16 15:26:11.368711
671	Huyện Càng Long	54	2019-03-16 15:26:11.372328	2019-03-16 15:26:11.372328
672	Huyện Cầu Kè	54	2019-03-16 15:26:11.374548	2019-03-16 15:26:11.374548
673	Huyện Tiểu Cần	54	2019-03-16 15:26:11.376892	2019-03-16 15:26:11.376892
674	Huyện Châu Thành	54	2019-03-16 15:26:11.380542	2019-03-16 15:26:11.380542
675	Huyện Trà Cú	54	2019-03-16 15:26:11.382737	2019-03-16 15:26:11.382737
676	Huyện Cầu Ngang	54	2019-03-16 15:26:11.385427	2019-03-16 15:26:11.385427
677	Huyện Duyên Hải	54	2019-03-16 15:26:11.387637	2019-03-16 15:26:11.387637
678	Quận/Huyện khác	54	2019-03-16 15:26:11.391196	2019-03-16 15:26:11.391196
679	Thành phố Bến Tre	55	2019-03-16 15:26:11.399222	2019-03-16 15:26:11.399222
680	Huyện Châu Thành	55	2019-03-16 15:26:11.401683	2019-03-16 15:26:11.401683
681	Huyện Chợ Lách	55	2019-03-16 15:26:11.403905	2019-03-16 15:26:11.403905
682	Huyện Mỏ Cày Bắc	55	2019-03-16 15:26:11.406128	2019-03-16 15:26:11.406128
683	Huyện Giồng Trôm	55	2019-03-16 15:26:11.408617	2019-03-16 15:26:11.408617
684	Huyện Bình Đại	55	2019-03-16 15:26:11.41268	2019-03-16 15:26:11.41268
685	Huyện Ba Tri	55	2019-03-16 15:26:11.414959	2019-03-16 15:26:11.414959
686	Huyện Thạnh Phú	55	2019-03-16 15:26:11.417788	2019-03-16 15:26:11.417788
687	Huyện Mỏ Cày Nam	55	2019-03-16 15:26:11.420472	2019-03-16 15:26:11.420472
688	Quận/Huyện khác	55	2019-03-16 15:26:11.424067	2019-03-16 15:26:11.424067
689	Thành phố Vĩnh Long	56	2019-03-16 15:26:11.432432	2019-03-16 15:26:11.432432
690	Huyện Long Hồ	56	2019-03-16 15:26:11.434966	2019-03-16 15:26:11.434966
691	Huyện Mang Thít	56	2019-03-16 15:26:11.437278	2019-03-16 15:26:11.437278
692	Thị xã Bình Minh	56	2019-03-16 15:26:11.439873	2019-03-16 15:26:11.439873
693	Huyện Tam Bình	56	2019-03-16 15:26:11.442417	2019-03-16 15:26:11.442417
694	Huyện Trà Ôn	56	2019-03-16 15:26:11.446295	2019-03-16 15:26:11.446295
695	Huyện Vũng Liêm	56	2019-03-16 15:26:11.448607	2019-03-16 15:26:11.448607
696	Huyện Bình Tân	56	2019-03-16 15:26:11.450918	2019-03-16 15:26:11.450918
697	Quận/Huyện khác	56	2019-03-16 15:26:11.453217	2019-03-16 15:26:11.453217
698	Thành phố Sóc Trăng	57	2019-03-16 15:26:11.458902	2019-03-16 15:26:11.458902
699	Huyện Kế Sách	57	2019-03-16 15:26:11.464841	2019-03-16 15:26:11.464841
700	Huyện Mỹ Tú	57	2019-03-16 15:26:11.467729	2019-03-16 15:26:11.467729
701	Huyện Mỹ Xuyên	57	2019-03-16 15:26:11.470101	2019-03-16 15:26:11.470101
702	Huyện Thạnh Trị	57	2019-03-16 15:26:11.472408	2019-03-16 15:26:11.472408
703	Huyện Long Phú	57	2019-03-16 15:26:11.47465	2019-03-16 15:26:11.47465
704	Thị xã Vĩnh Châu	57	2019-03-16 15:26:11.47684	2019-03-16 15:26:11.47684
705	Huyện Cù Lao Dung	57	2019-03-16 15:26:11.480584	2019-03-16 15:26:11.480584
706	Huyện Ngã Năm	57	2019-03-16 15:26:11.482851	2019-03-16 15:26:11.482851
707	Huyện Châu Thành	57	2019-03-16 15:26:11.485407	2019-03-16 15:26:11.485407
708	Huyện Trần Đề	57	2019-03-16 15:26:11.488225	2019-03-16 15:26:11.488225
709	Quận/Huyện khác	57	2019-03-16 15:26:11.491817	2019-03-16 15:26:11.491817
710	Thành phố Bạc Liêu	58	2019-03-16 15:26:11.500685	2019-03-16 15:26:11.500685
711	Huyện Vĩnh Lợi	58	2019-03-16 15:26:11.503082	2019-03-16 15:26:11.503082
712	Huyện Hồng Dân	58	2019-03-16 15:26:11.505336	2019-03-16 15:26:11.505336
713	Huyện Giá Rai	58	2019-03-16 15:26:11.507576	2019-03-16 15:26:11.507576
714	Huyện Phước Long	58	2019-03-16 15:26:11.509788	2019-03-16 15:26:11.509788
715	Huyện Đông Hải	58	2019-03-16 15:26:11.513962	2019-03-16 15:26:11.513962
716	Huyện Hoà Bình	58	2019-03-16 15:26:11.516413	2019-03-16 15:26:11.516413
717	Quận/Huyện khác	58	2019-03-16 15:26:11.519082	2019-03-16 15:26:11.519082
718	Thành phố Cà Mau	59	2019-03-16 15:26:11.524999	2019-03-16 15:26:11.524999
719	Huyện Thới Bình	59	2019-03-16 15:26:11.531436	2019-03-16 15:26:11.531436
720	Huyện U Minh	59	2019-03-16 15:26:11.534073	2019-03-16 15:26:11.534073
721	Huyện Trần Văn Thời	59	2019-03-16 15:26:11.536574	2019-03-16 15:26:11.536574
722	Huyện Cái Nước	59	2019-03-16 15:26:11.539055	2019-03-16 15:26:11.539055
723	Huyện Đầm Dơi	59	2019-03-16 15:26:11.544107	2019-03-16 15:26:11.544107
724	Huyện Ngọc Hiển	59	2019-03-16 15:26:11.547335	2019-03-16 15:26:11.547335
725	Huyện Năm Căn	59	2019-03-16 15:26:11.549835	2019-03-16 15:26:11.549835
726	Huyện Phú Tân	59	2019-03-16 15:26:11.552416	2019-03-16 15:26:11.552416
727	Quận/Huyện khác	59	2019-03-16 15:26:11.556373	2019-03-16 15:26:11.556373
728	TP. Điện Biên Phủ	60	2019-03-16 15:26:11.567299	2019-03-16 15:26:11.567299
729	Thị xã Mường Lay	60	2019-03-16 15:26:11.571196	2019-03-16 15:26:11.571196
730	Huyện Điện Biên	60	2019-03-16 15:26:11.573585	2019-03-16 15:26:11.573585
731	Huyện Tuần Giáo	60	2019-03-16 15:26:11.575784	2019-03-16 15:26:11.575784
732	Huyện Mường Chà	60	2019-03-16 15:26:11.581376	2019-03-16 15:26:11.581376
733	Huyện Tủa Chùa	60	2019-03-16 15:26:11.583847	2019-03-16 15:26:11.583847
734	Huyện Điện Biên Đông	60	2019-03-16 15:26:11.586164	2019-03-16 15:26:11.586164
735	Huyện Mường Nhé	60	2019-03-16 15:26:11.589849	2019-03-16 15:26:11.589849
736	Huyện Mường Ảng	60	2019-03-16 15:26:11.592422	2019-03-16 15:26:11.592422
737	Quận/Huyện khác	60	2019-03-16 15:26:11.598916	2019-03-16 15:26:11.598916
738	Thị xã Gia Nghĩa	61	2019-03-16 15:26:11.603674	2019-03-16 15:26:11.603674
739	Huyện Đăk RLấp	61	2019-03-16 15:26:11.60616	2019-03-16 15:26:11.60616
740	Huyện Đăk Mil	61	2019-03-16 15:26:11.608577	2019-03-16 15:26:11.608577
741	Huyện Cư Jút	61	2019-03-16 15:26:11.610874	2019-03-16 15:26:11.610874
742	Huyện Đăk Song	61	2019-03-16 15:26:11.614521	2019-03-16 15:26:11.614521
743	Huyện Krông Nô	61	2019-03-16 15:26:11.617148	2019-03-16 15:26:11.617148
744	Huyện Đăk GLong	61	2019-03-16 15:26:11.619722	2019-03-16 15:26:11.619722
745	Huyện Tuy Đức	61	2019-03-16 15:26:11.624208	2019-03-16 15:26:11.624208
746	Quận/Huyện khác	61	2019-03-16 15:26:11.626716	2019-03-16 15:26:11.626716
747	Thành phố Vị Thanh	62	2019-03-16 15:26:11.635079	2019-03-16 15:26:11.635079
748	Huyện Vị Thuỷ	62	2019-03-16 15:26:11.637339	2019-03-16 15:26:11.637339
749	Huyện Long Mỹ	62	2019-03-16 15:26:11.639671	2019-03-16 15:26:11.639671
750	Huyện Phụng Hiệp	62	2019-03-16 15:26:11.64179	2019-03-16 15:26:11.64179
751	Huyện Châu Thành	62	2019-03-16 15:26:11.645329	2019-03-16 15:26:11.645329
752	Huyện Châu Thành A	62	2019-03-16 15:26:11.647733	2019-03-16 15:26:11.647733
753	Thị xã Ngã Bảy	62	2019-03-16 15:26:11.65058	2019-03-16 15:26:11.65058
754	Quận/Huyện khác	62	2019-03-16 15:26:11.652866	2019-03-16 15:26:11.652866
\.


--
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.comments (id, context, commentable_id, commentable_type, user_id, created_at, updated_at) FROM stdin;
1	Facilis aut aliquam. Quia nisi culpa. Sed esse in.	1	Blog	1	2019-03-16 15:26:15.014899	2019-03-16 15:26:15.014899
2	In aperiam et. Dolorem sit exercitationem. Autem nam et.	1	Blog	7	2019-03-16 15:26:15.096673	2019-03-16 15:26:15.096673
3	Voluptatum dolor ea. Ipsa eos voluptas. Qui repellat delectus.	1	Blog	4	2019-03-16 15:26:15.110753	2019-03-16 15:26:15.110753
4	Ipsam et unde. Necessitatibus et quas. Perferendis nostrum at.	1	Blog	1	2019-03-16 15:26:15.123996	2019-03-16 15:26:15.123996
5	Sint libero omnis. Animi voluptatibus est. Eligendi aut quo.	1	Blog	5	2019-03-16 15:26:15.148558	2019-03-16 15:26:15.148558
6	Sint animi sit. Explicabo totam iusto. Aspernatur fugit nam.	1	Blog	5	2019-03-16 15:26:15.183162	2019-03-16 15:26:15.183162
7	Repellendus quia in. Culpa maxime neque. Non et harum.	1	Blog	4	2019-03-16 15:26:15.209549	2019-03-16 15:26:15.209549
8	Suscipit quaerat libero. Cum voluptatum quia. Cumque voluptate aut.	1	Blog	1	2019-03-16 15:26:15.273398	2019-03-16 15:26:15.273398
9	Perspiciatis fuga laudantium. Numquam minus vel. Dolores dolorem quaerat.	1	Blog	3	2019-03-16 15:26:15.369475	2019-03-16 15:26:15.369475
10	Quis perspiciatis quia. Numquam quibusdam magnam. Excepturi expedita sit.	1	Blog	4	2019-03-16 15:26:15.409495	2019-03-16 15:26:15.409495
11	Incidunt quae harum. Ratione placeat et. Quisquam est earum.	1	Blog	6	2019-03-16 15:26:15.582878	2019-03-16 15:26:15.582878
12	Quia sed ipsa. Eveniet aut tempora. Cum nam similique.	1	Blog	8	2019-03-16 15:26:15.611828	2019-03-16 15:26:15.611828
13	Ut corrupti nemo. Qui rerum explicabo. Dolorem error facilis.	1	Blog	8	2019-03-16 15:26:15.647007	2019-03-16 15:26:15.647007
14	Voluptatem et autem. Qui dolorum eos. Eveniet ex fugiat.	1	Blog	6	2019-03-16 15:26:15.68165	2019-03-16 15:26:15.68165
15	Odio ea autem. Perferendis aperiam esse. Inventore modi accusamus.	1	Blog	6	2019-03-16 15:26:15.703394	2019-03-16 15:26:15.703394
16	Dicta vitae quos. Ex ad rerum. Fuga omnis voluptatem.	1	Blog	7	2019-03-16 15:26:15.732624	2019-03-16 15:26:15.732624
17	Reiciendis beatae quidem. Et quidem quas. Architecto id et.	1	Blog	1	2019-03-16 15:26:15.766108	2019-03-16 15:26:15.766108
18	Dignissimos et nam. Ab ea repellendus. Sunt odit ex.	1	Blog	2	2019-03-16 15:26:15.818042	2019-03-16 15:26:15.818042
19	Quis officia magni. Dolor reprehenderit sint. Voluptate est voluptates.	1	Blog	1	2019-03-16 15:26:15.828038	2019-03-16 15:26:15.828038
20	Quo enim nesciunt. Sapiente voluptates recusandae. Ea repellat cupiditate.	1	Blog	7	2019-03-16 15:26:15.859139	2019-03-16 15:26:15.859139
21	Numquam dicta sapiente. Pariatur id veritatis. Voluptatem repellendus blanditiis.	1	Blog	1	2019-03-16 15:26:15.889121	2019-03-16 15:26:15.889121
22	Maxime quam occaecati. Dicta perspiciatis et. Nesciunt eos iure.	1	Blog	2	2019-03-16 15:26:15.942996	2019-03-16 15:26:15.942996
23	Cumque corrupti asperiores. Distinctio optio est. A quae quo.	1	Blog	8	2019-03-16 15:26:15.977245	2019-03-16 15:26:15.977245
24	Iure ipsa enim. Sunt nesciunt et. In ut omnis.	1	Blog	1	2019-03-16 15:26:16.006541	2019-03-16 15:26:16.006541
25	Dolor et rerum. Eius assumenda laudantium. Voluptas numquam eaque.	1	Blog	4	2019-03-16 15:26:16.016064	2019-03-16 15:26:16.016064
26	Voluptatem numquam nostrum. Quia nam nisi. Mollitia eveniet ipsa.	1	Blog	8	2019-03-16 15:26:16.071544	2019-03-16 15:26:16.071544
27	Dolorem ut facilis. Tenetur qui ea. Voluptatem nihil harum.	1	Blog	2	2019-03-16 15:26:16.100267	2019-03-16 15:26:16.100267
28	Qui repudiandae nesciunt. Et at aut. Rerum iusto et.	1	Blog	4	2019-03-16 15:26:16.107755	2019-03-16 15:26:16.107755
29	Ut qui doloremque. Rerum nesciunt accusantium. Delectus ducimus quidem.	1	Blog	2	2019-03-16 15:26:16.164836	2019-03-16 15:26:16.164836
30	Doloribus culpa natus. Illo corporis ratione. Reprehenderit id et.	1	Blog	1	2019-03-16 15:26:16.193064	2019-03-16 15:26:16.193064
31	Quo corrupti enim. Odio numquam aut. Atque quod rerum.	1	Blog	4	2019-03-16 15:26:16.226188	2019-03-16 15:26:16.226188
32	Debitis fugiat ut. Enim ea officiis. Dignissimos repellat blanditiis.	1	Blog	8	2019-03-16 15:26:16.259755	2019-03-16 15:26:16.259755
33	Et atque animi. Blanditiis explicabo ducimus. Debitis nam qui.	1	Blog	1	2019-03-16 15:26:16.294408	2019-03-16 15:26:16.294408
34	Et quis ipsum. Porro totam molestias. Quod et nesciunt.	1	Blog	2	2019-03-16 15:26:16.326821	2019-03-16 15:26:16.326821
35	Iusto exercitationem debitis. Sit quis temporibus. Recusandae quisquam rerum.	1	Blog	7	2019-03-16 15:26:16.360092	2019-03-16 15:26:16.360092
36	Magni quo nisi. Alias aliquid magnam. Perferendis et vero.	1	Blog	1	2019-03-16 15:26:16.392795	2019-03-16 15:26:16.392795
37	Ab dolores quas. Error incidunt suscipit. Reiciendis quia illum.	1	Blog	8	2019-03-16 15:26:16.426053	2019-03-16 15:26:16.426053
38	Ut animi saepe. Eius nihil sit. Omnis saepe et.	1	Blog	3	2019-03-16 15:26:16.456485	2019-03-16 15:26:16.456485
39	Est totam ipsam. Dolore impedit molestiae. Ex consequuntur quos.	1	Blog	3	2019-03-16 15:26:16.467651	2019-03-16 15:26:16.467651
40	Ducimus nisi sed. Et corporis explicabo. Quibusdam veritatis ipsa.	1	Blog	1	2019-03-16 15:26:16.500317	2019-03-16 15:26:16.500317
41	Officiis fuga distinctio. Deleniti ullam eum. Est aut distinctio.	1	Blog	7	2019-03-16 15:26:16.55833	2019-03-16 15:26:16.55833
42	Impedit harum quaerat. Magni voluptas veniam. Iure modi ad.	1	Blog	3	2019-03-16 15:26:16.590895	2019-03-16 15:26:16.590895
43	Ea officia ab. Quae voluptatem omnis. Delectus praesentium necessitatibus.	1	Blog	3	2019-03-16 15:26:16.620975	2019-03-16 15:26:16.620975
44	Quisquam fugit nisi. Deserunt voluptates pariatur. Qui et magni.	1	Blog	7	2019-03-16 15:26:16.653858	2019-03-16 15:26:16.653858
45	Placeat atque ducimus. Sunt sed officia. Repellendus culpa laborum.	1	Blog	1	2019-03-16 15:26:16.683779	2019-03-16 15:26:16.683779
46	Corporis nam aliquid. Et deserunt natus. Nulla est iusto.	1	Blog	2	2019-03-16 15:26:16.694006	2019-03-16 15:26:16.694006
47	Iste ea et. Voluptatem ut voluptatibus. Doloribus laborum natus.	1	Blog	2	2019-03-16 15:26:16.744669	2019-03-16 15:26:16.744669
48	Et aut odit. Exercitationem rerum quisquam. Atque maiores quo.	1	Blog	2	2019-03-16 15:26:16.774867	2019-03-16 15:26:16.774867
49	Libero corrupti blanditiis. Quos corporis accusamus. Provident nam ex.	1	Blog	3	2019-03-16 15:26:16.783208	2019-03-16 15:26:16.783208
50	Rem natus sapiente. Dolores sed quisquam. Iure qui ut.	1	Blog	2	2019-03-16 15:26:16.838256	2019-03-16 15:26:16.838256
\.


--
-- Data for Name: conversations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.conversations (id, name, created_at, updated_at) FROM stdin;
1	thien-kim	2019-03-16 15:26:16.888453	2019-03-16 15:26:16.888453
2	thanh-cong	2019-03-16 15:26:16.901088	2019-03-16 15:26:16.901088
3	test1	2019-03-16 15:26:16.903538	2019-03-16 15:26:16.903538
\.


--
-- Data for Name: enterprises; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.enterprises (id, name, address, phone, user_id, created_at, updated_at) FROM stdin;
1	Cửa hàng Thành Công	244 Cống Quỳnh, Quận 1	912819284	1	2019-03-16 15:26:19.720592	2019-03-16 15:26:19.720592
\.


--
-- Data for Name: follows; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.follows (id, user_id, target_user_id, created_at, updated_at) FROM stdin;
1	1	2	2019-03-16 15:26:14.943308	2019-03-16 15:26:14.943308
2	2	1	2019-03-16 15:26:14.951928	2019-03-16 15:26:14.951928
\.


--
-- Data for Name: groups; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.groups (id, name, address, user_id, created_at, updated_at) FROM stdin;
1	motosg	Quận 1 Hồ Chí Minh	1	2019-03-16 15:26:19.74498	2019-03-16 15:26:19.74498
2	damme	Quận 1 Hồ Chí Minh	2	2019-03-16 15:26:19.755663	2019-03-16 15:26:19.755663
\.


--
-- Data for Name: likes; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.likes (id, user_id, likeable_id, likeable_type, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: messages; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.messages (id, msg, attachment_data, conversation_id, sender_id, read, created_at, updated_at) FROM stdin;
1	Quia et sequi. Voluptatem nulla atque. Sunt excepturi fuga.	\N	1	2	f	2019-03-16 15:26:16.958114	2019-03-16 15:26:16.958114
2	Aperiam vel voluptate. Labore quisquam dolor. Nam et sed.	\N	1	1	f	2019-03-16 15:26:16.971115	2019-03-16 15:26:16.971115
3	Dolor nemo sed. Similique voluptate quae. Aut sed est.	\N	1	2	f	2019-03-16 15:26:17.008689	2019-03-16 15:26:17.008689
4	Quaerat ut recusandae. Animi vel incidunt. Eum velit exercitationem.	\N	1	1	f	2019-03-16 15:26:17.113689	2019-03-16 15:26:17.113689
5	Eum qui et. Totam voluptate ut. Quo velit aut.	\N	1	1	f	2019-03-16 15:26:17.194283	2019-03-16 15:26:17.194283
6	Est amet ipsa. Facilis deleniti sint. Itaque voluptas dolore.	\N	1	1	f	2019-03-16 15:26:17.236766	2019-03-16 15:26:17.236766
7	Et minima quos. Quas qui repellat. Temporibus voluptatem aut.	\N	1	1	f	2019-03-16 15:26:17.275653	2019-03-16 15:26:17.275653
8	Voluptate et incidunt. Sit et voluptatem. Eligendi cum facilis.	\N	1	1	f	2019-03-16 15:26:17.305817	2019-03-16 15:26:17.305817
9	Modi rerum debitis. Iste qui ipsa. Nisi quia voluptas.	\N	1	1	f	2019-03-16 15:26:17.382389	2019-03-16 15:26:17.382389
10	Nobis quaerat quidem. Porro consequatur ut. Quos et voluptatem.	\N	1	1	f	2019-03-16 15:26:17.456598	2019-03-16 15:26:17.456598
11	Veniam mollitia autem. Ab a officiis. Qui ex fugit.	\N	1	2	f	2019-03-16 15:26:17.503861	2019-03-16 15:26:17.503861
12	Qui ea tempora. Consequuntur aut quibusdam. Est perspiciatis maxime.	\N	1	2	f	2019-03-16 15:26:17.531805	2019-03-16 15:26:17.531805
13	Sunt nostrum quidem. Culpa sed quidem. Provident id eum.	\N	1	1	f	2019-03-16 15:26:17.601816	2019-03-16 15:26:17.601816
14	Fugit facilis sapiente. Nemo qui cupiditate. Modi est rerum.	\N	1	1	f	2019-03-16 15:26:17.651541	2019-03-16 15:26:17.651541
15	Rerum et omnis. Dicta culpa voluptas. Numquam doloremque similique.	\N	1	1	f	2019-03-16 15:26:17.708226	2019-03-16 15:26:17.708226
16	Dolor quis ducimus. Voluptas iure laborum. Natus accusantium quae.	\N	2	3	f	2019-03-16 15:26:17.75529	2019-03-16 15:26:17.75529
17	Ratione consequatur ut. Distinctio sit atque. Esse ut quas.	\N	2	1	f	2019-03-16 15:26:17.762196	2019-03-16 15:26:17.762196
18	Ut et qui. Deleniti dignissimos quia. Alias non modi.	\N	2	1	f	2019-03-16 15:26:17.859166	2019-03-16 15:26:17.859166
19	Aut eum aliquid. Eos ipsa totam. Non earum sint.	\N	2	3	f	2019-03-16 15:26:17.867051	2019-03-16 15:26:17.867051
20	Rerum laboriosam et. Modi reiciendis quae. Culpa voluptates quae.	\N	2	3	f	2019-03-16 15:26:17.919806	2019-03-16 15:26:17.919806
21	Ipsum exercitationem minus. Reiciendis aut aspernatur. Eum quis ea.	\N	2	3	f	2019-03-16 15:26:18.032894	2019-03-16 15:26:18.032894
22	Dignissimos est blanditiis. Exercitationem nesciunt et. Ut molestiae aliquam.	\N	2	1	f	2019-03-16 15:26:18.046915	2019-03-16 15:26:18.046915
23	Earum dolorem eos. Sint facilis magnam. Pariatur qui voluptas.	\N	2	3	f	2019-03-16 15:26:18.109541	2019-03-16 15:26:18.109541
24	Nam adipisci cupiditate. Illum sit incidunt. Ex sunt suscipit.	\N	2	3	f	2019-03-16 15:26:18.309138	2019-03-16 15:26:18.309138
25	Quam et libero. Quisquam et neque. Modi similique suscipit.	\N	2	3	f	2019-03-16 15:26:18.411494	2019-03-16 15:26:18.411494
26	Blanditiis et qui. Dicta hic pariatur. Sed esse commodi.	\N	2	1	f	2019-03-16 15:26:18.456937	2019-03-16 15:26:18.456937
27	Alias exercitationem nemo. Ea labore nihil. Enim quaerat at.	\N	2	1	f	2019-03-16 15:26:18.5075	2019-03-16 15:26:18.5075
28	Aut omnis voluptate. Necessitatibus laboriosam perspiciatis. Qui fugit non.	\N	2	3	f	2019-03-16 15:26:18.551887	2019-03-16 15:26:18.551887
29	Velit ut quia. Minima perspiciatis nihil. Pariatur illum consequatur.	\N	2	1	f	2019-03-16 15:26:18.686139	2019-03-16 15:26:18.686139
30	Vitae deserunt et. Similique impedit dolore. Voluptatibus quia et.	\N	2	3	f	2019-03-16 15:26:18.716295	2019-03-16 15:26:18.716295
31	Voluptas assumenda molestias. Iste quidem fugit. Eum eos cum.	\N	3	3	f	2019-03-16 15:26:18.769332	2019-03-16 15:26:18.769332
32	Totam itaque voluptate. Sunt dolores culpa. Rerum quia quibusdam.	\N	3	3	f	2019-03-16 15:26:18.839105	2019-03-16 15:26:18.839105
33	Pariatur magnam maxime. Fugiat aspernatur nisi. Aut possimus itaque.	\N	3	2	f	2019-03-16 15:26:18.870056	2019-03-16 15:26:18.870056
34	Non qui explicabo. Labore repudiandae molestias. Mollitia saepe provident.	\N	3	2	f	2019-03-16 15:26:18.939282	2019-03-16 15:26:18.939282
35	Odio inventore nam. Inventore officiis facere. Repudiandae nostrum tenetur.	\N	3	3	f	2019-03-16 15:26:18.972144	2019-03-16 15:26:18.972144
36	Velit illum pariatur. Dolorem odio ullam. Consequuntur quos voluptatibus.	\N	3	3	f	2019-03-16 15:26:19.024163	2019-03-16 15:26:19.024163
37	Blanditiis neque atque. Minima corporis possimus. Tempora unde ut.	\N	3	3	f	2019-03-16 15:26:19.059069	2019-03-16 15:26:19.059069
38	Facilis quaerat voluptas. Repudiandae quia molestiae. Alias id ut.	\N	3	3	f	2019-03-16 15:26:19.135586	2019-03-16 15:26:19.135586
39	Qui qui nihil. Aliquam voluptas sit. Earum iure ut.	\N	3	3	f	2019-03-16 15:26:19.209034	2019-03-16 15:26:19.209034
40	Et sint quia. Asperiores odit culpa. Excepturi dolorem et.	\N	3	2	f	2019-03-16 15:26:19.245403	2019-03-16 15:26:19.245403
41	Dolor sed iusto. Et amet enim. Est odio debitis.	\N	3	2	f	2019-03-16 15:26:19.279429	2019-03-16 15:26:19.279429
42	Omnis reprehenderit dolores. Hic consequatur cupiditate. Iure et eveniet.	\N	3	2	f	2019-03-16 15:26:19.373352	2019-03-16 15:26:19.373352
43	Sapiente iusto ut. In error veniam. Voluptatem nemo iusto.	\N	3	3	f	2019-03-16 15:26:19.440995	2019-03-16 15:26:19.440995
44	Commodi sint est. Suscipit vel consequatur. Dolor fuga dolorem.	\N	3	3	f	2019-03-16 15:26:19.534758	2019-03-16 15:26:19.534758
45	Debitis dolor facere. Eum accusamus nesciunt. Suscipit esse numquam.	\N	3	3	f	2019-03-16 15:26:19.594059	2019-03-16 15:26:19.594059
\.


--
-- Data for Name: post_images; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.post_images (id, post_image_data, post_imageable_id, post_imageable_type, url, public_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: posts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.posts (id, title, describe, user_id, vehicle_kind_id, status, featured_image_data, car_life, capacity, range_of_vehicle, status_of_vehicle, price, year_of_registration, km, slug_title, city_id, color, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: provinces; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.provinces (id, name, created_at, updated_at) FROM stdin;
1	Hà Nội	2019-03-16 15:26:08.573778	2019-03-16 15:26:08.573778
2	Hồ Chí Minh	2019-03-16 15:26:08.72049	2019-03-16 15:26:08.72049
3	Hải Phòng	2019-03-16 15:26:08.79753	2019-03-16 15:26:08.79753
4	Đà Nẵng	2019-03-16 15:26:08.845701	2019-03-16 15:26:08.845701
5	Hà Giang	2019-03-16 15:26:08.871472	2019-03-16 15:26:08.871472
6	Cao Bằng	2019-03-16 15:26:08.908334	2019-03-16 15:26:08.908334
7	Lai Châu	2019-03-16 15:26:08.950481	2019-03-16 15:26:08.950481
8	Lào Cai	2019-03-16 15:26:08.980375	2019-03-16 15:26:08.980375
9	Tuyên Quang	2019-03-16 15:26:09.012449	2019-03-16 15:26:09.012449
10	Lạng Sơn	2019-03-16 15:26:09.037924	2019-03-16 15:26:09.037924
11	Bắc Kạn	2019-03-16 15:26:09.074238	2019-03-16 15:26:09.074238
12	Thái Nguyên	2019-03-16 15:26:09.104683	2019-03-16 15:26:09.104683
13	Yên Bái	2019-03-16 15:26:09.136155	2019-03-16 15:26:09.136155
14	Sơn La	2019-03-16 15:26:09.168703	2019-03-16 15:26:09.168703
15	Phú Thọ	2019-03-16 15:26:09.210798	2019-03-16 15:26:09.210798
16	Vĩnh Phúc	2019-03-16 15:26:09.266391	2019-03-16 15:26:09.266391
17	Quảng Ninh	2019-03-16 15:26:09.301344	2019-03-16 15:26:09.301344
18	Bắc Giang	2019-03-16 15:26:09.355095	2019-03-16 15:26:09.355095
19	Bắc Ninh	2019-03-16 15:26:09.403576	2019-03-16 15:26:09.403576
20	Hải Dương	2019-03-16 15:26:09.438761	2019-03-16 15:26:09.438761
21	Hưng Yên	2019-03-16 15:26:09.486143	2019-03-16 15:26:09.486143
22	Hòa Bình	2019-03-16 15:26:09.530348	2019-03-16 15:26:09.530348
23	TỈNH HÀ NAM	2019-03-16 15:26:09.573604	2019-03-16 15:26:09.573604
24	Nam Định	2019-03-16 15:26:09.600911	2019-03-16 15:26:09.600911
25	Thái Bình	2019-03-16 15:26:09.640714	2019-03-16 15:26:09.640714
26	Ninh Bình	2019-03-16 15:26:09.679432	2019-03-16 15:26:09.679432
27	Thanh Hóa	2019-03-16 15:26:09.713688	2019-03-16 15:26:09.713688
28	Nghệ An	2019-03-16 15:26:09.824629	2019-03-16 15:26:09.824629
29	Hà Tĩnh	2019-03-16 15:26:09.935127	2019-03-16 15:26:09.935127
30	Quảng Bình	2019-03-16 15:26:09.983957	2019-03-16 15:26:09.983957
31	Quảng Trị	2019-03-16 15:26:10.014017	2019-03-16 15:26:10.014017
32	Thừa Thiên Huế	2019-03-16 15:26:10.093396	2019-03-16 15:26:10.093396
33	Quảng Nam	2019-03-16 15:26:10.134514	2019-03-16 15:26:10.134514
34	Quảng Ngãi	2019-03-16 15:26:10.210189	2019-03-16 15:26:10.210189
35	Kon Tum	2019-03-16 15:26:10.274483	2019-03-16 15:26:10.274483
36	Bình Định	2019-03-16 15:26:10.315731	2019-03-16 15:26:10.315731
37	Gia Lai	2019-03-16 15:26:10.411197	2019-03-16 15:26:10.411197
38	Phú Yên	2019-03-16 15:26:10.468333	2019-03-16 15:26:10.468333
39	Đăk Lăk	2019-03-16 15:26:10.500409	2019-03-16 15:26:10.500409
40	Khánh Hòa	2019-03-16 15:26:10.547885	2019-03-16 15:26:10.547885
41	Lâm Đồng	2019-03-16 15:26:10.667768	2019-03-16 15:26:10.667768
42	Bình Phước	2019-03-16 15:26:10.719955	2019-03-16 15:26:10.719955
43	Bình Dương	2019-03-16 15:26:10.780486	2019-03-16 15:26:10.780486
44	Ninh Thuận	2019-03-16 15:26:10.887002	2019-03-16 15:26:10.887002
45	Tây Ninh	2019-03-16 15:26:10.919084	2019-03-16 15:26:10.919084
46	Bình Thuận	2019-03-16 15:26:10.953674	2019-03-16 15:26:10.953674
47	Đồng Nai	2019-03-16 15:26:10.999867	2019-03-16 15:26:10.999867
48	Long An	2019-03-16 15:26:11.039767	2019-03-16 15:26:11.039767
49	Đồng Tháp	2019-03-16 15:26:11.092043	2019-03-16 15:26:11.092043
50	An Giang	2019-03-16 15:26:11.169838	2019-03-16 15:26:11.169838
51	Bà Rịa Vũng Tàu	2019-03-16 15:26:11.211358	2019-03-16 15:26:11.211358
52	Tiền Giang	2019-03-16 15:26:11.271921	2019-03-16 15:26:11.271921
53	Kiên Giang	2019-03-16 15:26:11.31304	2019-03-16 15:26:11.31304
54	Trà Vinh	2019-03-16 15:26:11.363081	2019-03-16 15:26:11.363081
55	Bến Tre	2019-03-16 15:26:11.395916	2019-03-16 15:26:11.395916
56	Vĩnh Long	2019-03-16 15:26:11.428687	2019-03-16 15:26:11.428687
57	Sóc Trăng	2019-03-16 15:26:11.456087	2019-03-16 15:26:11.456087
58	Bạc Liêu	2019-03-16 15:26:11.498105	2019-03-16 15:26:11.498105
59	Cà Mau	2019-03-16 15:26:11.521485	2019-03-16 15:26:11.521485
60	Điện Biên	2019-03-16 15:26:11.559502	2019-03-16 15:26:11.559502
61	Đắk Nông	2019-03-16 15:26:11.601115	2019-03-16 15:26:11.601115
62	Hậu Giang	2019-03-16 15:26:11.632434	2019-03-16 15:26:11.632434
\.


--
-- Data for Name: room_chats; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.room_chats (id, conversation_id, sender_id, created_at, updated_at) FROM stdin;
1	1	1	2019-03-16 15:26:16.91416	2019-03-16 15:26:16.91416
2	1	2	2019-03-16 15:26:16.923786	2019-03-16 15:26:16.923786
3	2	1	2019-03-16 15:26:16.934039	2019-03-16 15:26:16.934039
4	2	3	2019-03-16 15:26:16.936354	2019-03-16 15:26:16.936354
5	3	2	2019-03-16 15:26:16.938885	2019-03-16 15:26:16.938885
6	3	3	2019-03-16 15:26:16.941073	2019-03-16 15:26:16.941073
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.schema_migrations (version) FROM stdin;
20190302080811
20181224122649
20190103145736
20190218090721
20190102142435
20190112161853
20181223151746
20190302080757
20190102142456
20190220015755
20181224084643
20190220015018
20181224035502
20181221155254
20181221082533
20181226135827
20190102142421
20181225152544
20181228031957
\.


--
-- Data for Name: user_groups; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.user_groups (id, user_id, group_id, role, created_at, updated_at) FROM stdin;
1	1	1	member	2019-03-16 15:26:19.771856	2019-03-16 15:26:19.771856
2	2	1	member	2019-03-16 15:26:19.781181	2019-03-16 15:26:19.781181
3	3	1	member	2019-03-16 15:26:19.785892	2019-03-16 15:26:19.785892
4	1	2	member	2019-03-16 15:26:19.788176	2019-03-16 15:26:19.788176
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.users (id, email, phone, encrypted_password, address, username, avatar_data, slug_name, range, status, followers_count, following_count, reset_password_token, reset_password_sent_at, remember_created_at, created_at, updated_at, provider, uid, type_account) FROM stdin;
3	user3@gmail.com	0338529347	$2a$11$BNM4yWv2wu/WxJXo3EDbBOVtfVfwGV983muPCxxPDqJgdTIGDU4ze	aaaa	Trung Tâm Nhắn Tin	{"id":"8400094f7fa8b73ac23405751a8c70dd.png","storage":"store","metadata":{"filename":"240.png","size":1607,"mime_type":"image/png"}}	trung-tam-nh-n-tin	\N	offline	\N	\N	\N	\N	\N	2019-03-16 15:26:13.499823	2019-03-16 15:26:13.581481	\N	\N	\N
4	erikametz@ruecker.org	8645529968	$2a$11$xpEIPow1y3YzJmKXTJ3GEuzqZ.7XSYoK8Q0iKkBJNRXIJS/k8prvi	\N	Edra Wehner	{"id":"0132d729295b38178074c19e07374a5d.png","storage":"store","metadata":{"filename":"240.png","size":1993,"mime_type":"image/png"}}	edra-wehner	\N	offline	\N	\N	\N	\N	\N	2019-03-16 15:26:13.747097	2019-03-16 15:26:13.826593	\N	\N	\N
5	galenschmitt@stamm.info	5891852877	$2a$11$oGHHu5uA7EtxnB9jPUI7CuVvPzn4KcN3g.ZTHRspDZEnndz/IL1xq	\N	Renata Hermann	{"id":"a56f367c094af9c05969fa767c0512e2.png","storage":"store","metadata":{"filename":"240.png","size":3432,"mime_type":"image/png"}}	renata-hermann	\N	offline	\N	\N	\N	\N	\N	2019-03-16 15:26:13.993127	2019-03-16 15:26:14.083271	\N	\N	\N
6	cedriclubowitz@heel.name	4421666780	$2a$11$UnVNMDgvC2M9HUX490LA5OqmJLiRAdfPbZ1fKqpudrTg7r6gJ1/w2	\N	Jeanett Dare	{"id":"a0cf93cd66729b8781d7a3888021b764.png","storage":"store","metadata":{"filename":"240.png","size":2528,"mime_type":"image/png"}}	jeanett-dare	\N	offline	\N	\N	\N	\N	\N	2019-03-16 15:26:14.255915	2019-03-16 15:26:14.375791	\N	\N	\N
7	lorretta@wolf.net	3564582196	$2a$11$/KZOuKZWD1jCC9C5OO1g/OnSFDvw1UaC.NSSQf8AHbFNwH1ZZne8S	\N	Orval Erdman	{"id":"0da3c61f65a6123d535124bd891de660.png","storage":"store","metadata":{"filename":"240.png","size":5068,"mime_type":"image/png"}}	orval-erdman	\N	offline	\N	\N	\N	\N	\N	2019-03-16 15:26:14.555425	2019-03-16 15:26:14.66086	\N	\N	\N
8	hazelwill@barrows.net	4080568970	$2a$11$.fwRLcvR/.LI/IroVj87c.KAH8HexHB7Iy9FKwv.M10q/7AljjqT2	\N	Saran Schroeder III	{"id":"4404bd861b1f62b0381dd4da29ed02fc.png","storage":"store","metadata":{"filename":"240.png","size":5321,"mime_type":"image/png"}}	saran-schroeder-iii	\N	offline	\N	\N	\N	\N	\N	2019-03-16 15:26:14.816944	2019-03-16 15:26:14.915469	\N	\N	\N
1	user1@gmail.com	0338529345	$2a$11$sNgCKlFfEQr1XT4iSHqDuuik6ql5VcokJ0wPp25JA0xrx/5QHdZki	aaaa	Nguyễn Thành Công	{"id":"92e28b36c3fd79dda0d0e20daddcb479.png","storage":"store","metadata":{"filename":"240.png","size":3107,"mime_type":"image/png"}}	nguy-n-thanh-cong	\N	offline	1	1	\N	\N	\N	2019-03-16 15:26:11.89235	2019-03-16 15:26:13.085752	\N	\N	\N
2	user2@gmail.com	0338529346	$2a$11$AbdTzKY3V0oKgx45q9kE.OFXSzPThUCZOwW5HuNL8r2K1pb9hqAT2	aaaa	Thiên Kim	{"id":"85b2943feb164241b1568fd617f268f2.png","storage":"store","metadata":{"filename":"240.png","size":1577,"mime_type":"image/png"}}	thien-kim	\N	offline	1	1	\N	\N	\N	2019-03-16 15:26:13.254467	2019-03-16 15:26:13.333974	\N	\N	\N
\.


--
-- Data for Name: vehicle_kinds; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.vehicle_kinds (id, name, created_at, updated_at) FROM stdin;
1	oto	2019-03-16 15:26:11.669424	2019-03-16 15:26:11.669424
2	moto	2019-03-16 15:26:11.679664	2019-03-16 15:26:11.679664
3	bike	2019-03-16 15:26:11.68203	2019-03-16 15:26:11.68203
4	other	2019-03-16 15:26:11.684522	2019-03-16 15:26:11.684522
\.


--
-- Name: active_admin_comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.active_admin_comments_id_seq', 1, false);


--
-- Name: activities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.activities_id_seq', 1, false);


--
-- Name: blogs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.blogs_id_seq', 1, true);


--
-- Name: cities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cities_id_seq', 754, true);


--
-- Name: comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.comments_id_seq', 50, true);


--
-- Name: conversations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.conversations_id_seq', 3, true);


--
-- Name: enterprises_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.enterprises_id_seq', 1, true);


--
-- Name: follows_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.follows_id_seq', 2, true);


--
-- Name: groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.groups_id_seq', 2, true);


--
-- Name: likes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.likes_id_seq', 1, false);


--
-- Name: messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.messages_id_seq', 45, true);


--
-- Name: post_images_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.post_images_id_seq', 1, false);


--
-- Name: posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.posts_id_seq', 1, false);


--
-- Name: provinces_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.provinces_id_seq', 62, true);


--
-- Name: room_chats_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.room_chats_id_seq', 6, true);


--
-- Name: user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.user_groups_id_seq', 4, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 8, true);


--
-- Name: vehicle_kinds_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.vehicle_kinds_id_seq', 4, true);


--
-- Name: active_admin_comments active_admin_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_admin_comments
    ADD CONSTRAINT active_admin_comments_pkey PRIMARY KEY (id);


--
-- Name: activities activities_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.activities
    ADD CONSTRAINT activities_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: blogs blogs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.blogs
    ADD CONSTRAINT blogs_pkey PRIMARY KEY (id);


--
-- Name: cities cities_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (id);


--
-- Name: comments comments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- Name: conversations conversations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.conversations
    ADD CONSTRAINT conversations_pkey PRIMARY KEY (id);


--
-- Name: enterprises enterprises_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.enterprises
    ADD CONSTRAINT enterprises_pkey PRIMARY KEY (id);


--
-- Name: follows follows_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.follows
    ADD CONSTRAINT follows_pkey PRIMARY KEY (id);


--
-- Name: groups groups_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_pkey PRIMARY KEY (id);


--
-- Name: likes likes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT likes_pkey PRIMARY KEY (id);


--
-- Name: messages messages_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id);


--
-- Name: post_images post_images_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.post_images
    ADD CONSTRAINT post_images_pkey PRIMARY KEY (id);


--
-- Name: posts posts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (id);


--
-- Name: provinces provinces_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.provinces
    ADD CONSTRAINT provinces_pkey PRIMARY KEY (id);


--
-- Name: room_chats room_chats_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.room_chats
    ADD CONSTRAINT room_chats_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: user_groups user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_groups
    ADD CONSTRAINT user_groups_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: vehicle_kinds vehicle_kinds_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vehicle_kinds
    ADD CONSTRAINT vehicle_kinds_pkey PRIMARY KEY (id);


--
-- Name: index_active_admin_comments_on_author_type_and_author_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_active_admin_comments_on_author_type_and_author_id ON public.active_admin_comments USING btree (author_type, author_id);


--
-- Name: index_active_admin_comments_on_namespace; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_active_admin_comments_on_namespace ON public.active_admin_comments USING btree (namespace);


--
-- Name: index_active_admin_comments_on_resource_type_and_resource_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_active_admin_comments_on_resource_type_and_resource_id ON public.active_admin_comments USING btree (resource_type, resource_id);


--
-- Name: index_cities_on_province_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_cities_on_province_id ON public.cities USING btree (province_id);


--
-- Name: index_follows_on_target_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_follows_on_target_user_id ON public.follows USING btree (target_user_id);


--
-- Name: index_follows_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_follows_on_user_id ON public.follows USING btree (user_id);


--
-- Name: index_follows_on_user_id_and_target_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_follows_on_user_id_and_target_user_id ON public.follows USING btree (user_id, target_user_id);


--
-- Name: index_groups_on_name; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_groups_on_name ON public.groups USING btree (name);


--
-- Name: index_groups_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_groups_on_user_id ON public.groups USING btree (user_id);


--
-- Name: index_likes_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_likes_on_user_id ON public.likes USING btree (user_id);


--
-- Name: index_likes_on_user_id_and_likeable_id_and_likeable_type; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_likes_on_user_id_and_likeable_id_and_likeable_type ON public.likes USING btree (user_id, likeable_id, likeable_type);


--
-- Name: index_messages_on_conversation_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_messages_on_conversation_id ON public.messages USING btree (conversation_id);


--
-- Name: index_messages_on_sender_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_messages_on_sender_id ON public.messages USING btree (sender_id);


--
-- Name: index_posts_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_posts_on_user_id ON public.posts USING btree (user_id);


--
-- Name: index_posts_on_vehicle_kind_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_posts_on_vehicle_kind_id ON public.posts USING btree (vehicle_kind_id);


--
-- Name: index_room_chats_on_conversation_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_room_chats_on_conversation_id ON public.room_chats USING btree (conversation_id);


--
-- Name: index_room_chats_on_sender_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_room_chats_on_sender_id ON public.room_chats USING btree (sender_id);


--
-- Name: index_room_chats_on_sender_id_and_conversation_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_room_chats_on_sender_id_and_conversation_id ON public.room_chats USING btree (sender_id, conversation_id);


--
-- Name: index_user_groups_on_group_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_user_groups_on_group_id ON public.user_groups USING btree (group_id);


--
-- Name: index_user_groups_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_user_groups_on_user_id ON public.user_groups USING btree (user_id);


--
-- Name: index_user_groups_on_user_id_and_group_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_user_groups_on_user_id_and_group_id ON public.user_groups USING btree (user_id, group_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_email ON public.users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON public.users USING btree (reset_password_token);


--
-- PostgreSQL database dump complete
--

