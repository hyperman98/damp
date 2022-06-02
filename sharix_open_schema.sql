--
-- PostgreSQL database dump
--

-- Dumped from database version 12.7
-- Dumped by pg_dump version 12.7

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
-- Name: cars_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cars_log (
    id integer NOT NULL,
    resource_id integer NOT NULL,
    time_log_created timestamp with time zone NOT NULL,
    operation character(1) NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.cars_log OWNER TO postgres;

--
-- Name: cars_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cars_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cars_log_id_seq OWNER TO postgres;

--
-- Name: cars_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cars_log_id_seq OWNED BY public.cars_log.id;


--
-- Name: client; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client (
    id integer NOT NULL,
    user_id integer NOT NULL,
    requirements name NOT NULL,
    status character(1) DEFAULT 'A'::bpchar,
    ticket_status integer,
    id_metaservice integer NOT NULL,
    is_global character(1) NOT NULL,
    is_visible character(1) NOT NULL
);


ALTER TABLE public.client OWNER TO postgres;

--
-- Name: client_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.client_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.client_id_seq OWNER TO postgres;

--
-- Name: client_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.client_id_seq OWNED BY public.client.id;


--
-- Name: company; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.company (
    id integer NOT NULL,
    legal_name character varying(255) NOT NULL,
    repr_id integer NOT NULL,
    kpp character varying(9) NOT NULL,
    ogrn character varying(13) NOT NULL,
    bank_name character varying(255) NOT NULL,
    bik character varying(9) NOT NULL,
    ks integer NOT NULL,
    rs integer NOT NULL,
    address character varying(255) NOT NULL,
    id_metaservice integer,
    is_global character(1) NOT NULL,
    is_visible character(1) NOT NULL,
    requirements name,
    status character(1) DEFAULT 'A'::bpchar,
    ticket_status integer
);


ALTER TABLE public.company OWNER TO postgres;

--
-- Name: company_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.company_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.company_id_seq OWNER TO postgres;

--
-- Name: company_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.company_id_seq OWNED BY public.company.id;


--
-- Name: current_cars; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.current_cars (
    id integer NOT NULL,
    resource_id integer NOT NULL,
    user_id integer NOT NULL,
    order_status character(1),
    order_id character(1),
    current_token name NOT NULL,
    doors_output character(1) NOT NULL,
    engine_input character(1) NOT NULL,
    central_lock_input character(1) NOT NULL,
    ignition_input character(1) NOT NULL,
    doors_input character(1) NOT NULL,
    input4 name,
    controller_status character(1) NOT NULL,
    signal_gsm integer NOT NULL,
    operator_gsm name NOT NULL,
    signal_gps integer NOT NULL,
    location character varying(30),
    speed real NOT NULL,
    direction character(1) NOT NULL,
    address name NOT NULL,
    battery_level integer NOT NULL,
    board_voltage numeric(3,1) NOT NULL
);


ALTER TABLE public.current_cars OWNER TO postgres;

--
-- Name: current_cars_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.current_cars_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.current_cars_id_seq OWNER TO postgres;

--
-- Name: current_cars_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.current_cars_id_seq OWNED BY public.current_cars.id;


--
-- Name: current_orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.current_orders (
    id integer NOT NULL,
    service_id integer NOT NULL,
    service_type_id integer NOT NULL,
    state integer NOT NULL,
    id_metaservice integer NOT NULL,
    time_created timestamp with time zone NOT NULL,
    time_placed timestamp with time zone NOT NULL,
    time_start timestamp with time zone NOT NULL,
    time_finish_predicted timestamp with time zone NOT NULL,
    time_finish_real timestamp with time zone NOT NULL,
    provider_id integer NOT NULL,
    receiver_id integer NOT NULL,
    client_id integer NOT NULL,
    predicted_price money NOT NULL,
    real_price money NOT NULL,
    is_global character(1) NOT NULL,
    is_visible character(1) NOT NULL
);


ALTER TABLE public.current_orders OWNER TO postgres;

--
-- Name: current_orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.current_orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.current_orders_id_seq OWNER TO postgres;

--
-- Name: current_orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.current_orders_id_seq OWNED BY public.current_orders.id;


--
-- Name: current_resources; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.current_resources (
    id integer NOT NULL,
    resource_id integer NOT NULL,
    operation text NOT NULL,
    user_id integer NOT NULL,
    current_token text NOT NULL,
    state integer NOT NULL
);


ALTER TABLE public.current_resources OWNER TO postgres;

--
-- Name: current_resources_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.current_resources_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.current_resources_id_seq OWNER TO postgres;

--
-- Name: current_resources_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.current_resources_id_seq OWNED BY public.current_resources.id;


--
-- Name: current_timetable; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.current_timetable (
    id integer NOT NULL,
    order_id integer NOT NULL,
    service_type_id integer NOT NULL,
    provider_id integer NOT NULL,
    resource_id integer NOT NULL,
    time_start_predicted timestamp with time zone,
    time_finished_predicted timestamp with time zone,
    gap integer
);


ALTER TABLE public.current_timetable OWNER TO postgres;

--
-- Name: current_timetable_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.current_timetable_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.current_timetable_id_seq OWNER TO postgres;

--
-- Name: current_timetable_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.current_timetable_id_seq OWNED BY public.current_timetable.id;


--
-- Name: document; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.document (
    id integer NOT NULL,
    id_metaservice integer NOT NULL,
    doctype character varying(2) NOT NULL,
    expire_date date NOT NULL,
    datalink name,
    user_id integer NOT NULL,
    company_id integer,
    is_global character(1) NOT NULL,
    is_visible character(1) NOT NULL,
    check_level character(1),
    check_by integer,
    check_date timestamp with time zone,
    status character(1),
    ticket_status integer
);


ALTER TABLE public.document OWNER TO postgres;

--
-- Name: document_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.document_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.document_id_seq OWNER TO postgres;

--
-- Name: document_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.document_id_seq OWNED BY public.document.id;


--
-- Name: metaservice; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.metaservice (
    id integer NOT NULL,
    metaservicename text NOT NULL,
    legalname text NOT NULL,
    representative integer NOT NULL
);


ALTER TABLE public.metaservice OWNER TO postgres;

--
-- Name: metaservice_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.metaservice_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.metaservice_id_seq OWNER TO postgres;

--
-- Name: metaservice_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.metaservice_id_seq OWNED BY public.metaservice.id;


--
-- Name: metauser; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.metauser (
    id integer NOT NULL,
    email text NOT NULL,
    name text NOT NULL,
    surname text NOT NULL,
    phone text NOT NULL,
    password text NOT NULL
);


ALTER TABLE public.metauser OWNER TO postgres;

--
-- Name: metauser_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.metauser_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.metauser_id_seq OWNER TO postgres;

--
-- Name: metauser_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.metauser_id_seq OWNED BY public.metauser.id;


--
-- Name: order_list_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_list_log (
    id integer NOT NULL,
    payment_transaction_id integer NOT NULL,
    service_id integer NOT NULL,
    service_type_id integer NOT NULL,
    time_placed timestamp with time zone NOT NULL,
    time_start timestamp with time zone NOT NULL,
    time_finish_predicted timestamp with time zone,
    time_finish_real timestamp with time zone NOT NULL,
    order_place_start character varying(255) NOT NULL,
    order_place_predicted character varying(255) NOT NULL,
    order_place_real character varying(255) NOT NULL,
    price money NOT NULL,
    provider integer NOT NULL,
    receiver integer NOT NULL,
    client integer NOT NULL
);


ALTER TABLE public.order_list_log OWNER TO postgres;

--
-- Name: order_list_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_list_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_list_log_id_seq OWNER TO postgres;

--
-- Name: order_list_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_list_log_id_seq OWNED BY public.order_list_log.id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    service_id integer NOT NULL,
    service_type_id integer NOT NULL,
    state integer NOT NULL,
    id_metaservice integer NOT NULL,
    time_created timestamp with time zone NOT NULL,
    time_placed timestamp with time zone NOT NULL,
    time_start timestamp with time zone NOT NULL,
    time_finish_predicted timestamp with time zone NOT NULL,
    time_finish_real timestamp with time zone NOT NULL,
    provider_id integer NOT NULL,
    receiver_id integer NOT NULL,
    client_id integer NOT NULL,
    predicted_price numeric(10,2) NOT NULL,
    real_price numeric(10,2) NOT NULL,
    is_global character(1) NOT NULL,
    is_visible character(1) NOT NULL
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_id_seq OWNER TO postgres;

--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- Name: permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.permissions (
    id integer NOT NULL,
    id_metaservice integer NOT NULL,
    id_permission integer NOT NULL,
    user_id integer NOT NULL,
    is_global character(1) NOT NULL,
    is_visible character(1) NOT NULL,
    check_level character(1),
    check_by integer,
    check_date timestamp with time zone NOT NULL,
    status character(1),
    ticket_status integer
);


ALTER TABLE public.permissions OWNER TO postgres;

--
-- Name: permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.permissions_id_seq OWNER TO postgres;

--
-- Name: permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.permissions_id_seq OWNED BY public.permissions.id;


--
-- Name: provider; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.provider (
    id integer NOT NULL,
    type integer NOT NULL,
    id_company integer NOT NULL,
    user_id integer NOT NULL,
    requirements name NOT NULL,
    status character(1) DEFAULT 'A'::bpchar,
    ticket_status integer,
    id_metaservice integer NOT NULL,
    is_global character(1) NOT NULL,
    is_visible character(1) NOT NULL,
    location_type name NOT NULL,
    default_location name NOT NULL
);


ALTER TABLE public.provider OWNER TO postgres;

--
-- Name: provider_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.provider_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.provider_id_seq OWNER TO postgres;

--
-- Name: provider_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.provider_id_seq OWNED BY public.provider.id;


--
-- Name: relationship; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.relationship (
    id integer NOT NULL,
    user_id_who integer NOT NULL,
    user_id_whom integer NOT NULL,
    neg_type character(1) NOT NULL,
    id_metaservice integer,
    is_global character(1) NOT NULL,
    is_visible character(1) NOT NULL,
    requirements name,
    status character(1) DEFAULT 'A'::bpchar,
    ticket_status integer
);


ALTER TABLE public.relationship OWNER TO postgres;

--
-- Name: relationship_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.relationship_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.relationship_id_seq OWNER TO postgres;

--
-- Name: relationship_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.relationship_id_seq OWNED BY public.relationship.id;


--
-- Name: resource; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.resource (
    id integer NOT NULL,
    type_id integer NOT NULL,
    user_id integer NOT NULL,
    requirements name NOT NULL,
    status character(1) DEFAULT 'A'::bpchar,
    ticket_status integer,
    id_metaservice integer NOT NULL,
    is_global character(1) NOT NULL,
    is_visible character(1) NOT NULL
);


ALTER TABLE public.resource OWNER TO postgres;

--
-- Name: resource_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.resource_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.resource_id_seq OWNER TO postgres;

--
-- Name: resource_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.resource_id_seq OWNED BY public.resource.id;


--
-- Name: resource_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.resource_log (
    id integer NOT NULL,
    resource_id integer NOT NULL,
    operation text,
    user_id integer
);


ALTER TABLE public.resource_log OWNER TO postgres;

--
-- Name: resource_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.resource_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.resource_log_id_seq OWNER TO postgres;

--
-- Name: resource_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.resource_log_id_seq OWNED BY public.resource_log.id;


--
-- Name: service; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.service (
    id integer NOT NULL,
    servicetype_id integer NOT NULL,
    id_provider integer NOT NULL,
    resourse_id integer NOT NULL,
    price_alg character varying(255) NOT NULL,
    price_km money NOT NULL,
    price_min money NOT NULL,
    price_amount money NOT NULL,
    id_metaservice integer,
    is_global character(1) NOT NULL,
    is_visible character(1) NOT NULL,
    requirements name,
    status character(1) DEFAULT 'A'::bpchar,
    ticket_status integer
);


ALTER TABLE public.service OWNER TO postgres;

--
-- Name: service_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.service_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.service_id_seq OWNER TO postgres;

--
-- Name: service_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.service_id_seq OWNED BY public.service.id;


--
-- Name: servicetype; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.servicetype (
    id integer NOT NULL,
    caption character varying(255) NOT NULL,
    description text NOT NULL,
    pricetype integer NOT NULL,
    id_metaservice integer,
    is_global character(1) NOT NULL,
    is_visible character(1) NOT NULL,
    requirements name,
    status character(1) DEFAULT 'A'::bpchar,
    ticket_status integer
);


ALTER TABLE public.servicetype OWNER TO postgres;

--
-- Name: servicetype_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.servicetype_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.servicetype_id_seq OWNER TO postgres;

--
-- Name: servicetype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.servicetype_id_seq OWNED BY public.servicetype.id;


--
-- Name: tickets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tickets (
    id integer NOT NULL,
    id_reporter integer NOT NULL,
    id_asignee integer,
    time_created timestamp with time zone NOT NULL,
    time_assigned timestamp with time zone,
    time_changed timestamp with time zone,
    time_closed timestamp with time zone,
    status character(1) NOT NULL,
    description text
);


ALTER TABLE public.tickets OWNER TO postgres;

--
-- Name: tickets_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tickets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tickets_id_seq OWNER TO postgres;

--
-- Name: tickets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tickets_id_seq OWNED BY public.tickets.id;


--
-- Name: user_to_metaservice; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_to_metaservice (
    id integer NOT NULL,
    user_id integer NOT NULL,
    id_metaservice integer NOT NULL,
    is_active character(1) NOT NULL,
    status character(1) NOT NULL
);


ALTER TABLE public.user_to_metaservice OWNER TO postgres;

--
-- Name: user_to_metaservice_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_to_metaservice_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_to_metaservice_id_seq OWNER TO postgres;

--
-- Name: user_to_metaservice_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_to_metaservice_id_seq OWNED BY public.user_to_metaservice.id;


--
-- Name: cars_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cars_log ALTER COLUMN id SET DEFAULT nextval('public.cars_log_id_seq'::regclass);


--
-- Name: client id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client ALTER COLUMN id SET DEFAULT nextval('public.client_id_seq'::regclass);


--
-- Name: company id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company ALTER COLUMN id SET DEFAULT nextval('public.company_id_seq'::regclass);


--
-- Name: current_cars id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.current_cars ALTER COLUMN id SET DEFAULT nextval('public.current_cars_id_seq'::regclass);


--
-- Name: current_orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.current_orders ALTER COLUMN id SET DEFAULT nextval('public.current_orders_id_seq'::regclass);


--
-- Name: current_resources id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.current_resources ALTER COLUMN id SET DEFAULT nextval('public.current_resources_id_seq'::regclass);


--
-- Name: current_timetable id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.current_timetable ALTER COLUMN id SET DEFAULT nextval('public.current_timetable_id_seq'::regclass);


--
-- Name: document id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.document ALTER COLUMN id SET DEFAULT nextval('public.document_id_seq'::regclass);


--
-- Name: metaservice id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metaservice ALTER COLUMN id SET DEFAULT nextval('public.metaservice_id_seq'::regclass);


--
-- Name: metauser id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metauser ALTER COLUMN id SET DEFAULT nextval('public.metauser_id_seq'::regclass);


--
-- Name: order_list_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_list_log ALTER COLUMN id SET DEFAULT nextval('public.order_list_log_id_seq'::regclass);


--
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- Name: permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permissions ALTER COLUMN id SET DEFAULT nextval('public.permissions_id_seq'::regclass);


--
-- Name: provider id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.provider ALTER COLUMN id SET DEFAULT nextval('public.provider_id_seq'::regclass);


--
-- Name: relationship id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.relationship ALTER COLUMN id SET DEFAULT nextval('public.relationship_id_seq'::regclass);


--
-- Name: resource id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource ALTER COLUMN id SET DEFAULT nextval('public.resource_id_seq'::regclass);


--
-- Name: resource_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_log ALTER COLUMN id SET DEFAULT nextval('public.resource_log_id_seq'::regclass);


--
-- Name: service id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service ALTER COLUMN id SET DEFAULT nextval('public.service_id_seq'::regclass);


--
-- Name: servicetype id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.servicetype ALTER COLUMN id SET DEFAULT nextval('public.servicetype_id_seq'::regclass);


--
-- Name: tickets id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tickets ALTER COLUMN id SET DEFAULT nextval('public.tickets_id_seq'::regclass);


--
-- Name: user_to_metaservice id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_to_metaservice ALTER COLUMN id SET DEFAULT nextval('public.user_to_metaservice_id_seq'::regclass);


--
-- Name: cars_log cars_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cars_log
    ADD CONSTRAINT cars_log_pkey PRIMARY KEY (id);


--
-- Name: client client_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_pkey PRIMARY KEY (id);


--
-- Name: company company_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company
    ADD CONSTRAINT company_pkey PRIMARY KEY (id);


--
-- Name: current_cars current_cars_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.current_cars
    ADD CONSTRAINT current_cars_pkey PRIMARY KEY (id);


--
-- Name: current_orders current_orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.current_orders
    ADD CONSTRAINT current_orders_pkey PRIMARY KEY (id);


--
-- Name: current_resources current_resources_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.current_resources
    ADD CONSTRAINT current_resources_pkey PRIMARY KEY (id);


--
-- Name: current_timetable current_timetable_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.current_timetable
    ADD CONSTRAINT current_timetable_pkey PRIMARY KEY (id);


--
-- Name: document document_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.document
    ADD CONSTRAINT document_pkey PRIMARY KEY (id);


--
-- Name: metaservice metaservice_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metaservice
    ADD CONSTRAINT metaservice_pkey PRIMARY KEY (id);


--
-- Name: metauser metauser_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metauser
    ADD CONSTRAINT metauser_email_key UNIQUE (email);


--
-- Name: metauser metauser_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metauser
    ADD CONSTRAINT metauser_pkey PRIMARY KEY (id);


--
-- Name: order_list_log order_list_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_list_log
    ADD CONSTRAINT order_list_log_pkey PRIMARY KEY (id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: permissions permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_pkey PRIMARY KEY (id);


--
-- Name: provider provider_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.provider
    ADD CONSTRAINT provider_pkey PRIMARY KEY (id);


--
-- Name: relationship relationship_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.relationship
    ADD CONSTRAINT relationship_pkey PRIMARY KEY (id);


--
-- Name: resource_log resource_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_log
    ADD CONSTRAINT resource_log_pkey PRIMARY KEY (id);


--
-- Name: resource resource_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource
    ADD CONSTRAINT resource_pkey PRIMARY KEY (id);


--
-- Name: service service_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service
    ADD CONSTRAINT service_pkey PRIMARY KEY (id);


--
-- Name: servicetype servicetype_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.servicetype
    ADD CONSTRAINT servicetype_pkey PRIMARY KEY (id);


--
-- Name: tickets tickets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tickets
    ADD CONSTRAINT tickets_pkey PRIMARY KEY (id);


--
-- Name: user_to_metaservice user_to_metaservice_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_to_metaservice
    ADD CONSTRAINT user_to_metaservice_pkey PRIMARY KEY (id);


--
-- Name: client client_id_metaservice_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_id_metaservice_fkey FOREIGN KEY (id_metaservice) REFERENCES public.metaservice(id);


--
-- Name: client client_ticket_status_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_ticket_status_fkey FOREIGN KEY (ticket_status) REFERENCES public.tickets(id);


--
-- Name: client client_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.metauser(id);


--
-- Name: company company_id_metaservice_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company
    ADD CONSTRAINT company_id_metaservice_fkey FOREIGN KEY (id_metaservice) REFERENCES public.metaservice(id);


--
-- Name: company company_repr_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company
    ADD CONSTRAINT company_repr_id_fkey FOREIGN KEY (repr_id) REFERENCES public.metauser(id);


--
-- Name: company company_ticket_status_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company
    ADD CONSTRAINT company_ticket_status_fkey FOREIGN KEY (ticket_status) REFERENCES public.tickets(id);


--
-- Name: current_orders current_orders_client_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.current_orders
    ADD CONSTRAINT current_orders_client_id_fkey FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: current_orders current_orders_id_metaservice_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.current_orders
    ADD CONSTRAINT current_orders_id_metaservice_fkey FOREIGN KEY (id_metaservice) REFERENCES public.metaservice(id);


--
-- Name: current_orders current_orders_provider_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.current_orders
    ADD CONSTRAINT current_orders_provider_id_fkey FOREIGN KEY (provider_id) REFERENCES public.provider(id);


--
-- Name: current_orders current_orders_receiver_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.current_orders
    ADD CONSTRAINT current_orders_receiver_id_fkey FOREIGN KEY (receiver_id) REFERENCES public.metauser(id);


--
-- Name: current_orders current_orders_service_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.current_orders
    ADD CONSTRAINT current_orders_service_id_fkey FOREIGN KEY (service_id) REFERENCES public.service(id);


--
-- Name: current_orders current_orders_service_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.current_orders
    ADD CONSTRAINT current_orders_service_type_id_fkey FOREIGN KEY (service_type_id) REFERENCES public.servicetype(id);


--
-- Name: current_resources current_resources_resource_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.current_resources
    ADD CONSTRAINT current_resources_resource_id_fkey FOREIGN KEY (resource_id) REFERENCES public.resource(id);


--
-- Name: current_resources current_resources_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.current_resources
    ADD CONSTRAINT current_resources_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.metauser(id);


--
-- Name: current_timetable current_timetable_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.current_timetable
    ADD CONSTRAINT current_timetable_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.current_orders(id);


--
-- Name: current_timetable current_timetable_provider_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.current_timetable
    ADD CONSTRAINT current_timetable_provider_id_fkey FOREIGN KEY (provider_id) REFERENCES public.provider(id);


--
-- Name: current_timetable current_timetable_resource_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.current_timetable
    ADD CONSTRAINT current_timetable_resource_id_fkey FOREIGN KEY (resource_id) REFERENCES public.resource(id);


--
-- Name: current_timetable current_timetable_service_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.current_timetable
    ADD CONSTRAINT current_timetable_service_type_id_fkey FOREIGN KEY (service_type_id) REFERENCES public.servicetype(id);


--
-- Name: document document_check_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.document
    ADD CONSTRAINT document_check_by_fkey FOREIGN KEY (check_by) REFERENCES public.metauser(id);


--
-- Name: document document_company_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.document
    ADD CONSTRAINT document_company_id_fkey FOREIGN KEY (company_id) REFERENCES public.company(id);


--
-- Name: document document_id_metaservice_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.document
    ADD CONSTRAINT document_id_metaservice_fkey FOREIGN KEY (id_metaservice) REFERENCES public.metaservice(id);


--
-- Name: document document_ticket_status_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.document
    ADD CONSTRAINT document_ticket_status_fkey FOREIGN KEY (ticket_status) REFERENCES public.tickets(id);


--
-- Name: document document_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.document
    ADD CONSTRAINT document_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.metauser(id);


--
-- Name: metaservice metaservice_representative_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metaservice
    ADD CONSTRAINT metaservice_representative_fkey FOREIGN KEY (representative) REFERENCES public.metauser(id);


--
-- Name: order_list_log order_list_log_client_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_list_log
    ADD CONSTRAINT order_list_log_client_fkey FOREIGN KEY (client) REFERENCES public.client(id);


--
-- Name: order_list_log order_list_log_provider_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_list_log
    ADD CONSTRAINT order_list_log_provider_fkey FOREIGN KEY (provider) REFERENCES public.provider(id);


--
-- Name: order_list_log order_list_log_receiver_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_list_log
    ADD CONSTRAINT order_list_log_receiver_fkey FOREIGN KEY (receiver) REFERENCES public.metauser(id);


--
-- Name: order_list_log order_list_log_service_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_list_log
    ADD CONSTRAINT order_list_log_service_id_fkey FOREIGN KEY (service_id) REFERENCES public.service(id);


--
-- Name: order_list_log order_list_log_service_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_list_log
    ADD CONSTRAINT order_list_log_service_type_id_fkey FOREIGN KEY (service_type_id) REFERENCES public.servicetype(id);


--
-- Name: permissions permissions_check_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_check_by_fkey FOREIGN KEY (check_by) REFERENCES public.metauser(id);


--
-- Name: permissions permissions_id_metaservice_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_id_metaservice_fkey FOREIGN KEY (id_metaservice) REFERENCES public.metaservice(id);


--
-- Name: permissions permissions_ticket_status_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_ticket_status_fkey FOREIGN KEY (ticket_status) REFERENCES public.tickets(id);


--
-- Name: permissions permissions_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.metauser(id);


--
-- Name: provider provider_id_company_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.provider
    ADD CONSTRAINT provider_id_company_fkey FOREIGN KEY (id_company) REFERENCES public.company(id);


--
-- Name: provider provider_id_metaservice_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.provider
    ADD CONSTRAINT provider_id_metaservice_fkey FOREIGN KEY (id_metaservice) REFERENCES public.metaservice(id);


--
-- Name: provider provider_ticket_status_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.provider
    ADD CONSTRAINT provider_ticket_status_fkey FOREIGN KEY (ticket_status) REFERENCES public.tickets(id);


--
-- Name: provider provider_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.provider
    ADD CONSTRAINT provider_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.metauser(id);


--
-- Name: relationship relationship_id_metaservice_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.relationship
    ADD CONSTRAINT relationship_id_metaservice_fkey FOREIGN KEY (id_metaservice) REFERENCES public.metaservice(id);


--
-- Name: relationship relationship_user_id_who_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.relationship
    ADD CONSTRAINT relationship_user_id_who_fkey FOREIGN KEY (user_id_who) REFERENCES public.metauser(id);


--
-- Name: relationship relationship_user_id_whom_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.relationship
    ADD CONSTRAINT relationship_user_id_whom_fkey FOREIGN KEY (user_id_whom) REFERENCES public.metauser(id);


--
-- Name: resource resource_id_metaservice_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource
    ADD CONSTRAINT resource_id_metaservice_fkey FOREIGN KEY (id_metaservice) REFERENCES public.metaservice(id);


--
-- Name: resource_log resource_log_resource_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_log
    ADD CONSTRAINT resource_log_resource_id_fkey FOREIGN KEY (resource_id) REFERENCES public.resource(id);


--
-- Name: resource_log resource_log_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_log
    ADD CONSTRAINT resource_log_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.metauser(id);


--
-- Name: resource resource_ticket_status_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource
    ADD CONSTRAINT resource_ticket_status_fkey FOREIGN KEY (ticket_status) REFERENCES public.tickets(id);


--
-- Name: resource resource_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource
    ADD CONSTRAINT resource_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.metauser(id);


--
-- Name: service service_id_metaservice_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service
    ADD CONSTRAINT service_id_metaservice_fkey FOREIGN KEY (id_metaservice) REFERENCES public.metaservice(id);


--
-- Name: service service_id_provider_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service
    ADD CONSTRAINT service_id_provider_fkey FOREIGN KEY (id_provider) REFERENCES public.provider(id);


--
-- Name: service service_resourse_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service
    ADD CONSTRAINT service_resourse_id_fkey FOREIGN KEY (resourse_id) REFERENCES public.resource(id);


--
-- Name: service service_servicetype_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service
    ADD CONSTRAINT service_servicetype_id_fkey FOREIGN KEY (servicetype_id) REFERENCES public.servicetype(id);


--
-- Name: service service_ticket_status_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service
    ADD CONSTRAINT service_ticket_status_fkey FOREIGN KEY (ticket_status) REFERENCES public.tickets(id);


--
-- Name: servicetype servicetype_id_metaservice_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.servicetype
    ADD CONSTRAINT servicetype_id_metaservice_fkey FOREIGN KEY (id_metaservice) REFERENCES public.metaservice(id);


--
-- Name: servicetype servicetype_ticket_status_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.servicetype
    ADD CONSTRAINT servicetype_ticket_status_fkey FOREIGN KEY (ticket_status) REFERENCES public.tickets(id);


--
-- Name: tickets tickets_id_asignee_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tickets
    ADD CONSTRAINT tickets_id_asignee_fkey FOREIGN KEY (id_asignee) REFERENCES public.metauser(id);


--
-- Name: tickets tickets_id_reporter_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tickets
    ADD CONSTRAINT tickets_id_reporter_fkey FOREIGN KEY (id_reporter) REFERENCES public.metauser(id);


--
-- Name: user_to_metaservice user_to_metaservice_id_metaservice_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_to_metaservice
    ADD CONSTRAINT user_to_metaservice_id_metaservice_fkey FOREIGN KEY (id_metaservice) REFERENCES public.metaservice(id);


--
-- Name: user_to_metaservice user_to_metaservice_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_to_metaservice
    ADD CONSTRAINT user_to_metaservice_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.metauser(id);


--
-- PostgreSQL database dump complete
--

