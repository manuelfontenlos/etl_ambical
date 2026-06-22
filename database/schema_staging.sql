--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.4

-- Started on 2026-06-23 00:24:20

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- TOC entry 219 (class 1259 OID 36581)
-- Name: staging_productos_ean; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.staging_productos_ean (
    id_muestra integer,
    nombre_producto text,
    ean text,
    id_cliente integer,
    marca text,
    fecha_caducidad date,
    formato text,
    fabricante text,
    id_proyecto integer,
    tipo_proyecto text,
    descripcion_proyecto text
);


ALTER TABLE public.staging_productos_ean OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 36519)
-- Name: staging_valoraciones; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.staging_valoraciones (
    id integer NOT NULL,
    id_muestra integer NOT NULL,
    catador text,
    fecha date,
    nombre_producto text,
    grupo text,
    valor_inicial_rango integer,
    valor_final_rango integer,
    valor integer,
    orden integer,
    comentario text,
    marca text,
    id_proyecto integer
);


ALTER TABLE public.staging_valoraciones OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 36518)
-- Name: staging_valoraciones_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.staging_valoraciones_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.staging_valoraciones_id_seq OWNER TO postgres;

--
-- TOC entry 4858 (class 0 OID 0)
-- Dependencies: 217
-- Name: staging_valoraciones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.staging_valoraciones_id_seq OWNED BY public.staging_valoraciones.id;


--
-- TOC entry 4701 (class 2604 OID 36522)
-- Name: staging_valoraciones id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staging_valoraciones ALTER COLUMN id SET DEFAULT nextval('public.staging_valoraciones_id_seq'::regclass);


--
-- TOC entry 4704 (class 2606 OID 36526)
-- Name: staging_valoraciones staging_valoraciones_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staging_valoraciones
    ADD CONSTRAINT staging_valoraciones_pkey PRIMARY KEY (id);


--
-- TOC entry 4702 (class 1259 OID 42686)
-- Name: idx_valoracion_unique; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX idx_valoracion_unique ON public.staging_valoraciones USING btree (id_muestra, catador, grupo);


--
-- TOC entry 4855 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: pg_database_owner
--

GRANT ALL ON SCHEMA public TO ambical;


--
-- TOC entry 4856 (class 0 OID 0)
-- Dependencies: 219
-- Name: TABLE staging_productos_ean; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,TRUNCATE,UPDATE ON TABLE public.staging_productos_ean TO ambical;


--
-- TOC entry 4857 (class 0 OID 0)
-- Dependencies: 218
-- Name: TABLE staging_valoraciones; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,TRUNCATE,UPDATE ON TABLE public.staging_valoraciones TO ambical;


--
-- TOC entry 4859 (class 0 OID 0)
-- Dependencies: 217
-- Name: SEQUENCE staging_valoraciones_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,USAGE ON SEQUENCE public.staging_valoraciones_id_seq TO ambical;


--
-- TOC entry 2049 (class 826 OID 36411)
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT SELECT,USAGE ON SEQUENCES TO ambical;


--
-- TOC entry 2048 (class 826 OID 36410)
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT SELECT,INSERT,DELETE,UPDATE ON TABLES TO ambical;


-- Completed on 2026-06-23 00:24:20

--
-- PostgreSQL database dump complete
--

