--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.4

-- Started on 2026-06-23 00:18:01

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
-- TOC entry 229 (class 1259 OID 42586)
-- Name: dim_ingrediente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dim_ingrediente (
    id_ingrediente_sk integer NOT NULL,
    id_muestra_sk integer,
    nombre character varying(500),
    porcentaje real
);


ALTER TABLE public.dim_ingrediente OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 42585)
-- Name: dim_ingrediente_id_ingrediente_sk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dim_ingrediente_id_ingrediente_sk_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.dim_ingrediente_id_ingrediente_sk_seq OWNER TO postgres;

--
-- TOC entry 4968 (class 0 OID 0)
-- Dependencies: 228
-- Name: dim_ingrediente_id_ingrediente_sk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dim_ingrediente_id_ingrediente_sk_seq OWNED BY public.dim_ingrediente.id_ingrediente_sk;


--
-- TOC entry 239 (class 1259 OID 51046)
-- Name: aditivo_muestra; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.aditivo_muestra (
    id_aditivo_sk integer DEFAULT nextval('public.dim_ingrediente_id_ingrediente_sk_seq'::regclass) NOT NULL,
    id_muestra_sk integer,
    nombre_aditivo character varying(100)
);


ALTER TABLE public.aditivo_muestra OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 51036)
-- Name: analisis_estadistico; Type: TABLE; Schema: public; Owner: ambical
--

CREATE TABLE public.analisis_estadistico (
    id_proyecto_nk bigint,
    nombre_producto text,
    atributo text,
    id_muestra_sk bigint,
    n bigint,
    media double precision,
    desv_std double precision,
    pct_gusta double precision,
    pct_medio double precision,
    pct_disgusta double precision,
    chi_stat double precision,
    p_normalidad double precision,
    normal double precision,
    test_aplicado text,
    p_valor_test double precision,
    resultado_binomial text,
    letra text,
    es_binario bigint,
    nombre_marca text,
    conclusion text
);


ALTER TABLE public.analisis_estadistico OWNER TO ambical;

--
-- TOC entry 220 (class 1259 OID 42526)
-- Name: dim_atributo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dim_atributo (
    id_atributo_sk integer NOT NULL,
    nombre_atributo character varying(150),
    jar boolean
);


ALTER TABLE public.dim_atributo OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 42525)
-- Name: dim_atributo_id_atributo_sk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dim_atributo_id_atributo_sk_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.dim_atributo_id_atributo_sk_seq OWNER TO postgres;

--
-- TOC entry 4972 (class 0 OID 0)
-- Dependencies: 219
-- Name: dim_atributo_id_atributo_sk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dim_atributo_id_atributo_sk_seq OWNED BY public.dim_atributo.id_atributo_sk;


--
-- TOC entry 218 (class 1259 OID 42518)
-- Name: dim_catador; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dim_catador (
    id_catador_sk integer NOT NULL,
    id_catador_nk character varying(20),
    perfil character varying(100),
    fecha_nacimiento date,
    sexo character varying(10)
);


ALTER TABLE public.dim_catador OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 42517)
-- Name: dim_catador_id_catador_sk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dim_catador_id_catador_sk_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.dim_catador_id_catador_sk_seq OWNER TO postgres;

--
-- TOC entry 4975 (class 0 OID 0)
-- Dependencies: 217
-- Name: dim_catador_id_catador_sk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dim_catador_id_catador_sk_seq OWNED BY public.dim_catador.id_catador_sk;


--
-- TOC entry 233 (class 1259 OID 42612)
-- Name: dim_categoria; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dim_categoria (
    id_categoria_sk integer NOT NULL,
    id_muestra_sk integer,
    categoria character varying(250)
);


ALTER TABLE public.dim_categoria OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 42611)
-- Name: dim_categoria_id_categoria_sk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dim_categoria_id_categoria_sk_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.dim_categoria_id_categoria_sk_seq OWNER TO postgres;

--
-- TOC entry 4978 (class 0 OID 0)
-- Dependencies: 232
-- Name: dim_categoria_id_categoria_sk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dim_categoria_id_categoria_sk_seq OWNED BY public.dim_categoria.id_categoria_sk;


--
-- TOC entry 225 (class 1259 OID 42559)
-- Name: dim_marca; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dim_marca (
    id_marca_sk integer NOT NULL,
    nombre_marca character varying(100)
);


ALTER TABLE public.dim_marca OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 42558)
-- Name: dim_marca_id_marca_sk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dim_marca_id_marca_sk_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.dim_marca_id_marca_sk_seq OWNER TO postgres;

--
-- TOC entry 4981 (class 0 OID 0)
-- Dependencies: 224
-- Name: dim_marca_id_marca_sk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dim_marca_id_marca_sk_seq OWNED BY public.dim_marca.id_marca_sk;


--
-- TOC entry 227 (class 1259 OID 42566)
-- Name: dim_muestra; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dim_muestra (
    id_muestra_sk integer NOT NULL,
    id_muestra_nk integer,
    id_marca_sk integer,
    id_proyecto_sk integer,
    nombre_producto character varying(255),
    codigo_cliente character varying(100),
    ean character varying(50),
    fabricante character varying(100),
    formato character varying(100),
    fecha_caducidad date,
    url_foto text,
    orden integer,
    n_aditivos integer,
    nutriscore character varying(20)
);


ALTER TABLE public.dim_muestra OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 42565)
-- Name: dim_muestra_id_muestra_sk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dim_muestra_id_muestra_sk_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.dim_muestra_id_muestra_sk_seq OWNER TO postgres;

--
-- TOC entry 4984 (class 0 OID 0)
-- Dependencies: 226
-- Name: dim_muestra_id_muestra_sk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dim_muestra_id_muestra_sk_seq OWNED BY public.dim_muestra.id_muestra_sk;


--
-- TOC entry 231 (class 1259 OID 42600)
-- Name: dim_nutriente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dim_nutriente (
    id_nutriente_sk integer NOT NULL,
    id_muestra_sk integer,
    nombre character varying(100),
    cantidad_por100g real,
    unidad character varying(50)
);


ALTER TABLE public.dim_nutriente OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 42599)
-- Name: dim_nutriente_id_nutriente_sk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dim_nutriente_id_nutriente_sk_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.dim_nutriente_id_nutriente_sk_seq OWNER TO postgres;

--
-- TOC entry 4987 (class 0 OID 0)
-- Dependencies: 230
-- Name: dim_nutriente_id_nutriente_sk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dim_nutriente_id_nutriente_sk_seq OWNED BY public.dim_nutriente.id_nutriente_sk;


--
-- TOC entry 222 (class 1259 OID 42534)
-- Name: dim_proyecto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dim_proyecto (
    id_proyecto_sk integer NOT NULL,
    id_proyecto_nk integer,
    tipo character varying(100),
    descripcion character varying(300),
    familia character varying(100)
);


ALTER TABLE public.dim_proyecto OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 42533)
-- Name: dim_proyecto_id_proyecto_sk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dim_proyecto_id_proyecto_sk_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.dim_proyecto_id_proyecto_sk_seq OWNER TO postgres;

--
-- TOC entry 4990 (class 0 OID 0)
-- Dependencies: 221
-- Name: dim_proyecto_id_proyecto_sk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dim_proyecto_id_proyecto_sk_seq OWNED BY public.dim_proyecto.id_proyecto_sk;


--
-- TOC entry 237 (class 1259 OID 42866)
-- Name: fact_consumo_marcas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fact_consumo_marcas (
    id_consumomarca_sk integer NOT NULL,
    id_catador_sk integer,
    id_proyecto_sk integer,
    id_catador_nk character varying(40),
    id_proyecto_nk integer,
    marca character varying(100),
    supermercado character varying(50),
    tipo_marca character varying(40)
);


ALTER TABLE public.fact_consumo_marcas OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 42865)
-- Name: fact_consumo_marcas_id_consumomarca_sk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.fact_consumo_marcas_id_consumomarca_sk_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.fact_consumo_marcas_id_consumomarca_sk_seq OWNER TO postgres;

--
-- TOC entry 4993 (class 0 OID 0)
-- Dependencies: 236
-- Name: fact_consumo_marcas_id_consumomarca_sk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.fact_consumo_marcas_id_consumomarca_sk_seq OWNED BY public.fact_consumo_marcas.id_consumomarca_sk;


--
-- TOC entry 223 (class 1259 OID 42543)
-- Name: fact_escala_atributo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fact_escala_atributo (
    id_proyecto_sk integer NOT NULL,
    id_atributo_sk integer NOT NULL,
    valor_min real,
    valor_max real
);


ALTER TABLE public.fact_escala_atributo OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 42648)
-- Name: fact_valoracion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fact_valoracion (
    id_valoracion_sk bigint NOT NULL,
    id_catador_sk integer NOT NULL,
    id_muestra_sk integer NOT NULL,
    id_atributo_sk integer NOT NULL,
    id_proyecto_sk integer NOT NULL,
    fecha date,
    valor real,
    valor_normalizado real,
    comentario text
);


ALTER TABLE public.fact_valoracion OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 42647)
-- Name: fact_valoracion_id_valoracion_sk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.fact_valoracion_id_valoracion_sk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.fact_valoracion_id_valoracion_sk_seq OWNER TO postgres;

--
-- TOC entry 4997 (class 0 OID 0)
-- Dependencies: 234
-- Name: fact_valoracion_id_valoracion_sk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.fact_valoracion_id_valoracion_sk_seq OWNED BY public.fact_valoracion.id_valoracion_sk;


--
-- TOC entry 4755 (class 2604 OID 42529)
-- Name: dim_atributo id_atributo_sk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_atributo ALTER COLUMN id_atributo_sk SET DEFAULT nextval('public.dim_atributo_id_atributo_sk_seq'::regclass);


--
-- TOC entry 4754 (class 2604 OID 42521)
-- Name: dim_catador id_catador_sk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_catador ALTER COLUMN id_catador_sk SET DEFAULT nextval('public.dim_catador_id_catador_sk_seq'::regclass);


--
-- TOC entry 4761 (class 2604 OID 42615)
-- Name: dim_categoria id_categoria_sk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_categoria ALTER COLUMN id_categoria_sk SET DEFAULT nextval('public.dim_categoria_id_categoria_sk_seq'::regclass);


--
-- TOC entry 4759 (class 2604 OID 42589)
-- Name: dim_ingrediente id_ingrediente_sk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_ingrediente ALTER COLUMN id_ingrediente_sk SET DEFAULT nextval('public.dim_ingrediente_id_ingrediente_sk_seq'::regclass);


--
-- TOC entry 4757 (class 2604 OID 42562)
-- Name: dim_marca id_marca_sk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_marca ALTER COLUMN id_marca_sk SET DEFAULT nextval('public.dim_marca_id_marca_sk_seq'::regclass);


--
-- TOC entry 4758 (class 2604 OID 42569)
-- Name: dim_muestra id_muestra_sk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_muestra ALTER COLUMN id_muestra_sk SET DEFAULT nextval('public.dim_muestra_id_muestra_sk_seq'::regclass);


--
-- TOC entry 4760 (class 2604 OID 42603)
-- Name: dim_nutriente id_nutriente_sk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_nutriente ALTER COLUMN id_nutriente_sk SET DEFAULT nextval('public.dim_nutriente_id_nutriente_sk_seq'::regclass);


--
-- TOC entry 4756 (class 2604 OID 42537)
-- Name: dim_proyecto id_proyecto_sk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_proyecto ALTER COLUMN id_proyecto_sk SET DEFAULT nextval('public.dim_proyecto_id_proyecto_sk_seq'::regclass);


--
-- TOC entry 4763 (class 2604 OID 42869)
-- Name: fact_consumo_marcas id_consumomarca_sk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fact_consumo_marcas ALTER COLUMN id_consumomarca_sk SET DEFAULT nextval('public.fact_consumo_marcas_id_consumomarca_sk_seq'::regclass);


--
-- TOC entry 4762 (class 2604 OID 42651)
-- Name: fact_valoracion id_valoracion_sk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fact_valoracion ALTER COLUMN id_valoracion_sk SET DEFAULT nextval('public.fact_valoracion_id_valoracion_sk_seq'::regclass);


--
-- TOC entry 4769 (class 2606 OID 42531)
-- Name: dim_atributo dim_atributo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_atributo
    ADD CONSTRAINT dim_atributo_pkey PRIMARY KEY (id_atributo_sk);


--
-- TOC entry 4766 (class 2606 OID 42523)
-- Name: dim_catador dim_catador_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_catador
    ADD CONSTRAINT dim_catador_pkey PRIMARY KEY (id_catador_sk);


--
-- TOC entry 4788 (class 2606 OID 42617)
-- Name: dim_categoria dim_categoria_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_categoria
    ADD CONSTRAINT dim_categoria_pkey PRIMARY KEY (id_categoria_sk);


--
-- TOC entry 4782 (class 2606 OID 42593)
-- Name: dim_ingrediente dim_ingrediente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_ingrediente
    ADD CONSTRAINT dim_ingrediente_pkey PRIMARY KEY (id_ingrediente_sk);


--
-- TOC entry 4777 (class 2606 OID 42564)
-- Name: dim_marca dim_marca_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_marca
    ADD CONSTRAINT dim_marca_pkey PRIMARY KEY (id_marca_sk);


--
-- TOC entry 4779 (class 2606 OID 42573)
-- Name: dim_muestra dim_muestra_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_muestra
    ADD CONSTRAINT dim_muestra_pkey PRIMARY KEY (id_muestra_sk);


--
-- TOC entry 4785 (class 2606 OID 42605)
-- Name: dim_nutriente dim_nutriente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_nutriente
    ADD CONSTRAINT dim_nutriente_pkey PRIMARY KEY (id_nutriente_sk);


--
-- TOC entry 4772 (class 2606 OID 42541)
-- Name: dim_proyecto dim_proyecto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_proyecto
    ADD CONSTRAINT dim_proyecto_pkey PRIMARY KEY (id_proyecto_sk);


--
-- TOC entry 4801 (class 2606 OID 42871)
-- Name: fact_consumo_marcas fact_consumo_marcas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fact_consumo_marcas
    ADD CONSTRAINT fact_consumo_marcas_pkey PRIMARY KEY (id_consumomarca_sk);


--
-- TOC entry 4775 (class 2606 OID 42547)
-- Name: fact_escala_atributo fact_escala_atributo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fact_escala_atributo
    ADD CONSTRAINT fact_escala_atributo_pkey PRIMARY KEY (id_proyecto_sk, id_atributo_sk);


--
-- TOC entry 4791 (class 2606 OID 42653)
-- Name: fact_valoracion fact_valoracion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fact_valoracion
    ADD CONSTRAINT fact_valoracion_pkey PRIMARY KEY (id_valoracion_sk);


--
-- TOC entry 4803 (class 2606 OID 42873)
-- Name: fact_consumo_marcas uq_catador_marca_proyecto; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fact_consumo_marcas
    ADD CONSTRAINT uq_catador_marca_proyecto UNIQUE (id_catador_nk, id_proyecto_nk, marca);


--
-- TOC entry 4799 (class 2606 OID 42655)
-- Name: fact_valoracion uq_valoracion; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fact_valoracion
    ADD CONSTRAINT uq_valoracion UNIQUE (id_catador_sk, id_muestra_sk, id_atributo_sk, id_proyecto_sk);


--
-- TOC entry 4789 (class 1259 OID 42679)
-- Name: idx_cat_muestra; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_cat_muestra ON public.dim_categoria USING btree (id_muestra_sk);


--
-- TOC entry 4792 (class 1259 OID 42674)
-- Name: idx_fecha; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fecha ON public.fact_valoracion USING btree (fecha);


--
-- TOC entry 4783 (class 1259 OID 42677)
-- Name: idx_ing_muestra; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_ing_muestra ON public.dim_ingrediente USING btree (id_muestra_sk);


--
-- TOC entry 4770 (class 1259 OID 42532)
-- Name: idx_nk_atributo; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX idx_nk_atributo ON public.dim_atributo USING btree (nombre_atributo);


--
-- TOC entry 4767 (class 1259 OID 42524)
-- Name: idx_nk_catador; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX idx_nk_catador ON public.dim_catador USING btree (id_catador_nk);


--
-- TOC entry 4780 (class 1259 OID 42584)
-- Name: idx_nk_muestra; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX idx_nk_muestra ON public.dim_muestra USING btree (id_muestra_nk);


--
-- TOC entry 4773 (class 1259 OID 42542)
-- Name: idx_nk_proyecto; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX idx_nk_proyecto ON public.dim_proyecto USING btree (id_proyecto_nk);


--
-- TOC entry 4786 (class 1259 OID 42678)
-- Name: idx_nut_muestra; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_nut_muestra ON public.dim_nutriente USING btree (id_muestra_sk);


--
-- TOC entry 4793 (class 1259 OID 42675)
-- Name: idx_val_atributo; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_val_atributo ON public.fact_valoracion USING btree (id_atributo_sk);


--
-- TOC entry 4794 (class 1259 OID 42672)
-- Name: idx_val_catador; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_val_catador ON public.fact_valoracion USING btree (id_catador_sk);


--
-- TOC entry 4795 (class 1259 OID 42676)
-- Name: idx_val_combo; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_val_combo ON public.fact_valoracion USING btree (id_muestra_sk, id_atributo_sk);


--
-- TOC entry 4796 (class 1259 OID 42671)
-- Name: idx_val_muestra; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_val_muestra ON public.fact_valoracion USING btree (id_muestra_sk);


--
-- TOC entry 4797 (class 1259 OID 42673)
-- Name: idx_val_proyecto; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_val_proyecto ON public.fact_valoracion USING btree (id_proyecto_sk);


--
-- TOC entry 4810 (class 2606 OID 42618)
-- Name: dim_categoria dim_categoria_id_muestra_sk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_categoria
    ADD CONSTRAINT dim_categoria_id_muestra_sk_fkey FOREIGN KEY (id_muestra_sk) REFERENCES public.dim_muestra(id_muestra_sk);


--
-- TOC entry 4808 (class 2606 OID 42594)
-- Name: dim_ingrediente dim_ingrediente_id_muestra_sk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_ingrediente
    ADD CONSTRAINT dim_ingrediente_id_muestra_sk_fkey FOREIGN KEY (id_muestra_sk) REFERENCES public.dim_muestra(id_muestra_sk);


--
-- TOC entry 4806 (class 2606 OID 42579)
-- Name: dim_muestra dim_muestra_id_marca_sk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_muestra
    ADD CONSTRAINT dim_muestra_id_marca_sk_fkey FOREIGN KEY (id_marca_sk) REFERENCES public.dim_marca(id_marca_sk);


--
-- TOC entry 4807 (class 2606 OID 42574)
-- Name: dim_muestra dim_muestra_id_proyecto_sk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_muestra
    ADD CONSTRAINT dim_muestra_id_proyecto_sk_fkey FOREIGN KEY (id_proyecto_sk) REFERENCES public.dim_proyecto(id_proyecto_sk);


--
-- TOC entry 4809 (class 2606 OID 42606)
-- Name: dim_nutriente dim_nutriente_id_muestra_sk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_nutriente
    ADD CONSTRAINT dim_nutriente_id_muestra_sk_fkey FOREIGN KEY (id_muestra_sk) REFERENCES public.dim_muestra(id_muestra_sk);


--
-- TOC entry 4814 (class 2606 OID 42874)
-- Name: fact_consumo_marcas fact_consumo_marcas_id_catador_sk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fact_consumo_marcas
    ADD CONSTRAINT fact_consumo_marcas_id_catador_sk_fkey FOREIGN KEY (id_catador_sk) REFERENCES public.dim_catador(id_catador_sk);


--
-- TOC entry 4815 (class 2606 OID 42879)
-- Name: fact_consumo_marcas fact_consumo_marcas_id_proyecto_sk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fact_consumo_marcas
    ADD CONSTRAINT fact_consumo_marcas_id_proyecto_sk_fkey FOREIGN KEY (id_proyecto_sk) REFERENCES public.dim_proyecto(id_proyecto_sk);


--
-- TOC entry 4804 (class 2606 OID 42553)
-- Name: fact_escala_atributo fact_escala_atributo_id_atributo_sk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fact_escala_atributo
    ADD CONSTRAINT fact_escala_atributo_id_atributo_sk_fkey FOREIGN KEY (id_atributo_sk) REFERENCES public.dim_atributo(id_atributo_sk);


--
-- TOC entry 4805 (class 2606 OID 42548)
-- Name: fact_escala_atributo fact_escala_atributo_id_proyecto_sk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fact_escala_atributo
    ADD CONSTRAINT fact_escala_atributo_id_proyecto_sk_fkey FOREIGN KEY (id_proyecto_sk) REFERENCES public.dim_proyecto(id_proyecto_sk);


--
-- TOC entry 4811 (class 2606 OID 42666)
-- Name: fact_valoracion fact_valoracion_id_atributo_sk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fact_valoracion
    ADD CONSTRAINT fact_valoracion_id_atributo_sk_fkey FOREIGN KEY (id_atributo_sk) REFERENCES public.dim_atributo(id_atributo_sk);


--
-- TOC entry 4812 (class 2606 OID 42656)
-- Name: fact_valoracion fact_valoracion_id_catador_sk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fact_valoracion
    ADD CONSTRAINT fact_valoracion_id_catador_sk_fkey FOREIGN KEY (id_catador_sk) REFERENCES public.dim_catador(id_catador_sk);


--
-- TOC entry 4813 (class 2606 OID 42661)
-- Name: fact_valoracion fact_valoracion_id_muestra_sk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fact_valoracion
    ADD CONSTRAINT fact_valoracion_id_muestra_sk_fkey FOREIGN KEY (id_muestra_sk) REFERENCES public.dim_muestra(id_muestra_sk);


--
-- TOC entry 4966 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: pg_database_owner
--

GRANT ALL ON SCHEMA public TO ambical;


--
-- TOC entry 4967 (class 0 OID 0)
-- Dependencies: 229
-- Name: TABLE dim_ingrediente; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.dim_ingrediente TO ambical;


--
-- TOC entry 4969 (class 0 OID 0)
-- Dependencies: 228
-- Name: SEQUENCE dim_ingrediente_id_ingrediente_sk_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,USAGE ON SEQUENCE public.dim_ingrediente_id_ingrediente_sk_seq TO ambical;


--
-- TOC entry 4970 (class 0 OID 0)
-- Dependencies: 239
-- Name: TABLE aditivo_muestra; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.aditivo_muestra TO ambical;


--
-- TOC entry 4971 (class 0 OID 0)
-- Dependencies: 220
-- Name: TABLE dim_atributo; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.dim_atributo TO ambical;


--
-- TOC entry 4973 (class 0 OID 0)
-- Dependencies: 219
-- Name: SEQUENCE dim_atributo_id_atributo_sk_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,USAGE ON SEQUENCE public.dim_atributo_id_atributo_sk_seq TO ambical;


--
-- TOC entry 4974 (class 0 OID 0)
-- Dependencies: 218
-- Name: TABLE dim_catador; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.dim_catador TO ambical;


--
-- TOC entry 4976 (class 0 OID 0)
-- Dependencies: 217
-- Name: SEQUENCE dim_catador_id_catador_sk_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,USAGE ON SEQUENCE public.dim_catador_id_catador_sk_seq TO ambical;


--
-- TOC entry 4977 (class 0 OID 0)
-- Dependencies: 233
-- Name: TABLE dim_categoria; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.dim_categoria TO ambical;


--
-- TOC entry 4979 (class 0 OID 0)
-- Dependencies: 232
-- Name: SEQUENCE dim_categoria_id_categoria_sk_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,USAGE ON SEQUENCE public.dim_categoria_id_categoria_sk_seq TO ambical;


--
-- TOC entry 4980 (class 0 OID 0)
-- Dependencies: 225
-- Name: TABLE dim_marca; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.dim_marca TO ambical;


--
-- TOC entry 4982 (class 0 OID 0)
-- Dependencies: 224
-- Name: SEQUENCE dim_marca_id_marca_sk_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,USAGE ON SEQUENCE public.dim_marca_id_marca_sk_seq TO ambical;


--
-- TOC entry 4983 (class 0 OID 0)
-- Dependencies: 227
-- Name: TABLE dim_muestra; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.dim_muestra TO ambical;


--
-- TOC entry 4985 (class 0 OID 0)
-- Dependencies: 226
-- Name: SEQUENCE dim_muestra_id_muestra_sk_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,USAGE ON SEQUENCE public.dim_muestra_id_muestra_sk_seq TO ambical;


--
-- TOC entry 4986 (class 0 OID 0)
-- Dependencies: 231
-- Name: TABLE dim_nutriente; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.dim_nutriente TO ambical;


--
-- TOC entry 4988 (class 0 OID 0)
-- Dependencies: 230
-- Name: SEQUENCE dim_nutriente_id_nutriente_sk_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,USAGE ON SEQUENCE public.dim_nutriente_id_nutriente_sk_seq TO ambical;


--
-- TOC entry 4989 (class 0 OID 0)
-- Dependencies: 222
-- Name: TABLE dim_proyecto; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.dim_proyecto TO ambical;


--
-- TOC entry 4991 (class 0 OID 0)
-- Dependencies: 221
-- Name: SEQUENCE dim_proyecto_id_proyecto_sk_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,USAGE ON SEQUENCE public.dim_proyecto_id_proyecto_sk_seq TO ambical;


--
-- TOC entry 4992 (class 0 OID 0)
-- Dependencies: 237
-- Name: TABLE fact_consumo_marcas; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.fact_consumo_marcas TO ambical;


--
-- TOC entry 4994 (class 0 OID 0)
-- Dependencies: 236
-- Name: SEQUENCE fact_consumo_marcas_id_consumomarca_sk_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,USAGE ON SEQUENCE public.fact_consumo_marcas_id_consumomarca_sk_seq TO ambical;


--
-- TOC entry 4995 (class 0 OID 0)
-- Dependencies: 223
-- Name: TABLE fact_escala_atributo; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.fact_escala_atributo TO ambical;


--
-- TOC entry 4996 (class 0 OID 0)
-- Dependencies: 235
-- Name: TABLE fact_valoracion; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.fact_valoracion TO ambical;


--
-- TOC entry 4998 (class 0 OID 0)
-- Dependencies: 234
-- Name: SEQUENCE fact_valoracion_id_valoracion_sk_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,USAGE ON SEQUENCE public.fact_valoracion_id_valoracion_sk_seq TO ambical;


--
-- TOC entry 2102 (class 826 OID 36979)
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT SELECT,USAGE ON SEQUENCES TO ambical;


--
-- TOC entry 2101 (class 826 OID 36978)
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT SELECT,INSERT,DELETE,UPDATE ON TABLES TO ambical;


-- Completed on 2026-06-23 00:18:01

--
-- PostgreSQL database dump complete
--

