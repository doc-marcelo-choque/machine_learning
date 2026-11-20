CREATE TABLE public.clientes_historicos (
    id bigint NOT NULL,
    edad smallint NOT NULL,
    ingreso_mensual numeric(12,2) NOT NULL,
    antiguedad_meses smallint NOT NULL,
    visitas_web_mes integer NOT NULL,
    minutos_web_mes integer NOT NULL,
    productos_vistos_mes integer NOT NULL,
    productos_carrito_mes integer NOT NULL,
    compras_previas integer NOT NULL,
    gasto_historico numeric(12,2) NOT NULL,
    descuentos_utilizados integer NOT NULL,
    canal_adquisicion character varying(20) NOT NULL,
    dispositivo character varying(12) NOT NULL,
    compro smallint NOT NULL,
    fecha_registro timestamp with time zone DEFAULT now() NOT NULL,
    CONSTRAINT clientes_historicos_antiguedad_meses_check CHECK ((antiguedad_meses >= 0)),
    CONSTRAINT clientes_historicos_canal_adquisicion_check CHECK (((canal_adquisicion)::text = ANY ((ARRAY['organico'::character varying, 'redes'::character varying, 'referido'::character varying, 'publicidad'::character varying])::text[]))),
    CONSTRAINT clientes_historicos_compras_previas_check CHECK ((compras_previas >= 0)),
    CONSTRAINT clientes_historicos_compro_check CHECK ((compro = ANY (ARRAY[0, 1]))),
    CONSTRAINT clientes_historicos_descuentos_utilizados_check CHECK ((descuentos_utilizados >= 0)),
    CONSTRAINT clientes_historicos_dispositivo_check CHECK (((dispositivo)::text = ANY ((ARRAY['movil'::character varying, 'desktop'::character varying, 'tablet'::character varying])::text[]))),
    CONSTRAINT clientes_historicos_edad_check CHECK (((edad >= 18) AND (edad <= 85))),
    CONSTRAINT clientes_historicos_gasto_historico_check CHECK ((gasto_historico >= (0)::numeric)),
    CONSTRAINT clientes_historicos_ingreso_mensual_check CHECK ((ingreso_mensual >= (0)::numeric)),
    CONSTRAINT clientes_historicos_minutos_web_mes_check CHECK ((minutos_web_mes >= 0)),
    CONSTRAINT clientes_historicos_productos_carrito_mes_check CHECK ((productos_carrito_mes >= 0)),
    CONSTRAINT clientes_historicos_productos_vistos_mes_check CHECK ((productos_vistos_mes >= 0)),
    CONSTRAINT clientes_historicos_visitas_web_mes_check CHECK ((visitas_web_mes >= 0))
);


ALTER TABLE public.clientes_historicos OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 58879)
-- Name: clientes_historicos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.clientes_historicos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.clientes_historicos_id_seq OWNER TO postgres;

--
-- TOC entry 4850 (class 0 OID 0)
-- Dependencies: 217
-- Name: clientes_historicos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.clientes_historicos_id_seq OWNED BY public.clientes_historicos.id;


--
-- TOC entry 220 (class 1259 OID 58901)
-- Name: clientes_nuevos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clientes_nuevos (
    id bigint NOT NULL,
    edad smallint NOT NULL,
    ingreso_mensual numeric(12,2) NOT NULL,
    antiguedad_meses smallint NOT NULL,
    visitas_web_mes integer NOT NULL,
    minutos_web_mes integer NOT NULL,
    productos_vistos_mes integer NOT NULL,
    productos_carrito_mes integer NOT NULL,
    compras_previas integer NOT NULL,
    gasto_historico numeric(12,2) NOT NULL,
    descuentos_utilizados integer NOT NULL,
    canal_adquisicion character varying(20) NOT NULL,
    dispositivo character varying(12) NOT NULL,
    fecha_registro timestamp with time zone DEFAULT now() NOT NULL,
    CONSTRAINT clientes_nuevos_antiguedad_meses_check CHECK ((antiguedad_meses >= 0)),
    CONSTRAINT clientes_nuevos_canal_adquisicion_check CHECK (((canal_adquisicion)::text = ANY ((ARRAY['organico'::character varying, 'redes'::character varying, 'referido'::character varying, 'publicidad'::character varying])::text[]))),
    CONSTRAINT clientes_nuevos_compras_previas_check CHECK ((compras_previas >= 0)),
    CONSTRAINT clientes_nuevos_descuentos_utilizados_check CHECK ((descuentos_utilizados >= 0)),
    CONSTRAINT clientes_nuevos_dispositivo_check CHECK (((dispositivo)::text = ANY ((ARRAY['movil'::character varying, 'desktop'::character varying, 'tablet'::character varying])::text[]))),
    CONSTRAINT clientes_nuevos_edad_check CHECK (((edad >= 18) AND (edad <= 85))),
    CONSTRAINT clientes_nuevos_gasto_historico_check CHECK ((gasto_historico >= (0)::numeric)),
    CONSTRAINT clientes_nuevos_ingreso_mensual_check CHECK ((ingreso_mensual >= (0)::numeric)),
    CONSTRAINT clientes_nuevos_minutos_web_mes_check CHECK ((minutos_web_mes >= 0)),
    CONSTRAINT clientes_nuevos_productos_carrito_mes_check CHECK ((productos_carrito_mes >= 0)),
    CONSTRAINT clientes_nuevos_productos_vistos_mes_check CHECK ((productos_vistos_mes >= 0)),
    CONSTRAINT clientes_nuevos_visitas_web_mes_check CHECK ((visitas_web_mes >= 0))
);


ALTER TABLE public.clientes_nuevos OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 58900)
-- Name: clientes_nuevos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.clientes_nuevos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.clientes_nuevos_id_seq OWNER TO postgres;

--
-- TOC entry 4851 (class 0 OID 0)
-- Dependencies: 219
-- Name: clientes_nuevos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.clientes_nuevos_id_seq OWNED BY public.clientes_nuevos.id;


--
-- TOC entry 222 (class 1259 OID 58921)
-- Name: predicciones_clientes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.predicciones_clientes (
    id bigint NOT NULL,
    cliente_id bigint NOT NULL,
    prediccion smallint NOT NULL,
    probabilidad_compra numeric(7,6) NOT NULL,
    version_modelo character varying(50) NOT NULL,
    fecha_prediccion timestamp with time zone DEFAULT now() NOT NULL,
    CONSTRAINT predicciones_clientes_prediccion_check CHECK ((prediccion = ANY (ARRAY[0, 1]))),
    CONSTRAINT predicciones_clientes_probabilidad_compra_check CHECK (((probabilidad_compra >= (0)::numeric) AND (probabilidad_compra <= (1)::numeric)))
);


ALTER TABLE public.predicciones_clientes OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 58920)
-- Name: predicciones_clientes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.predicciones_clientes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.predicciones_clientes_id_seq OWNER TO postgres;

--
-- TOC entry 4852 (class 0 OID 0)
-- Dependencies: 221
-- Name: predicciones_clientes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.predicciones_clientes_id_seq OWNED BY public.predicciones_clientes.id;


--
-- TOC entry 4651 (class 2604 OID 58883)
-- Name: clientes_historicos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes_historicos ALTER COLUMN id SET DEFAULT nextval('public.clientes_historicos_id_seq'::regclass);


--
-- TOC entry 4653 (class 2604 OID 58904)
-- Name: clientes_nuevos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes_nuevos ALTER COLUMN id SET DEFAULT nextval('public.clientes_nuevos_id_seq'::regclass);


--
-- TOC entry 4655 (class 2604 OID 58924)
-- Name: predicciones_clientes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.predicciones_clientes ALTER COLUMN id SET DEFAULT nextval('public.predicciones_clientes_id_seq'::regclass);


--
-- TOC entry 4840 (class 0 OID 58880)
-- Dependencies: 218
-- Data for Name: clientes_historicos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.clientes_historicos VALUES (1, 68, 5578.75, 41, 23, 97, 49, 7, 6, 1505.64, 7, 'referido', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (2, 22, 12585.58, 18, 9, 174, 49, 6, 10, 3545.72, 1, 'publicidad', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (3, 67, 11616.74, 1, 0, 65, 16, 6, 6, 4138.44, 2, 'referido', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (4, 36, 5074.79, 19, 9, 50, 36, 4, 9, 3537.50, 1, 'publicidad', 'desktop', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (5, 61, 6756.40, 40, 6, 115, 22, 3, 3, 8257.66, 7, 'redes', 'desktop', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (6, 37, 3251.02, 10, 9, 69, 50, 7, 3, 5211.53, 0, 'redes', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (7, 43, 8809.20, 44, 13, 102, 4, 4, 9, 1170.72, 7, 'redes', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (8, 29, 4205.23, 27, 19, 240, 6, 5, 2, 6315.11, 4, 'referido', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (9, 38, 4592.13, 32, 25, 205, 22, 2, 5, 4346.67, 2, 'referido', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (10, 29, 10378.11, 47, 1, 222, 16, 3, 7, 8036.48, 2, 'organico', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (11, 20, 11757.02, 16, 12, 210, 49, 4, 9, 7616.14, 4, 'publicidad', 'desktop', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (12, 33, 5109.79, 18, 11, 58, 14, 3, 6, 2012.12, 2, 'publicidad', 'tablet', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (13, 44, 9923.14, 31, 11, 52, 39, 4, 7, 876.86, 3, 'referido', 'desktop', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (14, 23, 7901.22, 6, 14, 175, 31, 3, 0, 4257.99, 0, 'redes', 'movil', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (15, 60, 11692.22, 15, 7, 226, 0, 7, 7, 1975.77, 2, 'publicidad', 'desktop', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (16, 42, 5123.19, 57, 19, 229, 0, 6, 9, 3577.84, 3, 'redes', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (17, 50, 10752.47, 46, 21, 174, 3, 2, 4, 4888.64, 7, 'publicidad', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (18, 61, 5794.09, 32, 17, 30, 50, 0, 5, 7464.67, 7, 'organico', 'movil', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (19, 65, 9044.26, 41, 23, 206, 14, 8, 0, 122.98, 1, 'organico', 'desktop', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (20, 57, 9763.75, 43, 14, 28, 12, 8, 3, 2109.90, 7, 'publicidad', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (21, 22, 2576.19, 43, 24, 25, 28, 3, 4, 5449.10, 3, 'referido', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (22, 62, 12170.96, 54, 3, 193, 41, 8, 3, 3150.28, 0, 'redes', 'desktop', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (23, 28, 10410.93, 56, 2, 208, 5, 8, 0, 49.78, 7, 'organico', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (24, 47, 8928.73, 8, 11, 83, 15, 5, 12, 6039.96, 7, 'organico', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (25, 19, 7178.24, 13, 6, 193, 44, 2, 4, 5465.04, 3, 'redes', 'movil', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (26, 23, 5007.99, 28, 16, 67, 12, 6, 8, 1241.62, 5, 'referido', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (27, 61, 6446.00, 13, 6, 195, 4, 0, 3, 709.19, 0, 'redes', 'tablet', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (28, 38, 6434.79, 9, 7, 212, 19, 1, 6, 1191.94, 4, 'referido', 'movil', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (29, 53, 13070.45, 1, 5, 20, 49, 5, 11, 2708.46, 6, 'referido', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (30, 39, 6689.62, 28, 25, 166, 10, 2, 11, 1555.70, 6, 'redes', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (31, 53, 3451.85, 4, 25, 21, 38, 2, 8, 2723.21, 5, 'referido', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (32, 18, 12593.61, 25, 4, 173, 9, 0, 12, 6908.85, 2, 'referido', 'tablet', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (33, 34, 12349.52, 35, 15, 107, 31, 3, 4, 2232.65, 5, 'publicidad', 'desktop', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (34, 19, 2070.19, 29, 2, 119, 22, 4, 8, 1319.93, 1, 'referido', 'desktop', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (35, 64, 3468.24, 29, 16, 118, 20, 3, 4, 6073.51, 0, 'organico', 'desktop', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (36, 28, 3498.81, 20, 24, 107, 9, 2, 8, 7135.20, 2, 'organico', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (37, 50, 2345.78, 9, 8, 145, 37, 7, 2, 3901.91, 4, 'referido', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (38, 21, 10607.28, 54, 22, 163, 49, 7, 8, 1125.98, 5, 'referido', 'desktop', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (39, 50, 10293.23, 40, 3, 216, 23, 7, 8, 1825.09, 6, 'publicidad', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (40, 58, 2055.01, 2, 21, 144, 27, 2, 10, 1835.51, 2, 'redes', 'desktop', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (41, 43, 3669.76, 5, 8, 102, 49, 6, 0, 2.81, 1, 'redes', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (42, 28, 3680.96, 9, 23, 119, 37, 1, 9, 6191.80, 6, 'referido', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (43, 48, 9899.40, 44, 17, 124, 10, 7, 10, 571.94, 4, 'referido', 'desktop', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (44, 70, 10503.19, 17, 16, 170, 34, 8, 7, 7957.84, 6, 'redes', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (45, 69, 9605.79, 37, 3, 138, 34, 2, 6, 4838.29, 6, 'publicidad', 'tablet', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (46, 40, 3734.01, 6, 17, 177, 47, 8, 3, 7427.15, 1, 'publicidad', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (47, 32, 10525.54, 7, 7, 203, 5, 1, 11, 4818.58, 0, 'publicidad', 'tablet', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (48, 55, 1867.55, 45, 19, 19, 26, 2, 3, 435.43, 1, 'referido', 'desktop', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (49, 28, 9425.41, 19, 17, 8, 44, 6, 2, 6780.05, 6, 'publicidad', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (50, 20, 8284.22, 21, 0, 64, 27, 6, 1, 4170.12, 2, 'organico', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (51, 57, 3776.28, 49, 6, 100, 20, 7, 1, 2241.80, 6, 'publicidad', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (52, 41, 1922.39, 60, 15, 210, 9, 8, 3, 2284.95, 4, 'referido', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (53, 44, 12647.34, 7, 12, 180, 14, 6, 8, 826.85, 5, 'organico', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (54, 34, 8573.71, 2, 15, 132, 1, 5, 7, 3820.08, 0, 'organico', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (55, 35, 9804.54, 40, 19, 40, 40, 7, 10, 8467.71, 6, 'redes', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (56, 60, 2426.57, 24, 12, 14, 34, 1, 9, 7044.20, 4, 'redes', 'desktop', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (57, 50, 7298.66, 26, 5, 55, 18, 0, 9, 7500.25, 7, 'redes', 'tablet', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (58, 69, 7995.77, 21, 5, 110, 39, 4, 11, 267.13, 2, 'organico', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (59, 52, 12019.37, 36, 12, 90, 32, 0, 9, 3041.67, 6, 'redes', 'desktop', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (60, 68, 2457.36, 60, 21, 179, 17, 2, 4, 6376.29, 3, 'publicidad', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (61, 62, 4909.64, 42, 13, 109, 43, 5, 3, 7841.52, 0, 'publicidad', 'desktop', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (62, 40, 5885.28, 16, 24, 20, 38, 4, 3, 6719.09, 7, 'publicidad', 'desktop', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (63, 42, 3124.21, 15, 22, 239, 22, 2, 5, 4290.35, 0, 'redes', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (64, 54, 10992.28, 19, 4, 87, 23, 6, 4, 1942.48, 6, 'publicidad', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (65, 48, 8702.28, 1, 22, 82, 0, 4, 4, 1435.72, 7, 'referido', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (66, 57, 13057.77, 60, 14, 160, 40, 7, 5, 4335.82, 5, 'organico', 'desktop', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (67, 31, 7366.83, 21, 14, 35, 25, 1, 7, 5675.82, 0, 'organico', 'movil', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (68, 50, 7169.22, 8, 5, 190, 47, 7, 7, 4882.43, 4, 'referido', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (69, 40, 6401.88, 49, 9, 157, 14, 6, 11, 5089.43, 2, 'organico', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (70, 37, 9606.74, 55, 17, 92, 40, 0, 5, 2183.86, 7, 'organico', 'desktop', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (71, 44, 10167.83, 19, 10, 156, 18, 0, 6, 867.77, 1, 'referido', 'movil', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (72, 53, 4168.24, 29, 3, 193, 32, 1, 2, 6387.29, 7, 'organico', 'movil', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (73, 47, 9536.48, 23, 16, 132, 44, 8, 7, 3278.40, 7, 'referido', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (74, 62, 9928.49, 55, 6, 12, 30, 4, 6, 3975.61, 0, 'publicidad', 'movil', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (75, 57, 4345.97, 59, 10, 224, 22, 7, 0, 3961.64, 6, 'publicidad', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (76, 48, 2977.95, 20, 6, 140, 44, 2, 11, 4717.17, 1, 'publicidad', 'movil', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (77, 47, 8510.35, 34, 3, 73, 31, 5, 6, 7003.17, 0, 'publicidad', 'desktop', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (78, 21, 11781.67, 20, 9, 240, 31, 5, 11, 4795.35, 1, 'organico', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (79, 44, 3337.80, 19, 18, 0, 1, 2, 12, 3737.42, 7, 'publicidad', 'tablet', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (80, 54, 9359.52, 13, 23, 45, 40, 1, 0, 6332.61, 1, 'organico', 'tablet', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (81, 24, 5524.76, 35, 21, 12, 50, 1, 9, 4320.52, 1, 'organico', 'desktop', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (82, 54, 2709.86, 37, 10, 63, 24, 8, 5, 8374.77, 7, 'redes', 'desktop', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (83, 44, 4348.87, 42, 13, 64, 3, 6, 5, 3091.59, 1, 'publicidad', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (84, 40, 8215.56, 56, 8, 186, 26, 2, 10, 6873.58, 3, 'redes', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (85, 62, 3762.89, 6, 21, 22, 36, 8, 0, 5825.78, 2, 'organico', 'desktop', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (86, 57, 9662.52, 32, 1, 58, 6, 4, 12, 3840.42, 2, 'organico', 'desktop', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (87, 20, 1810.10, 25, 17, 118, 11, 6, 9, 2903.85, 7, 'publicidad', 'desktop', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (88, 24, 7684.64, 52, 4, 1, 36, 0, 7, 3621.67, 1, 'publicidad', 'movil', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (89, 37, 8438.26, 51, 19, 195, 36, 2, 12, 1413.51, 0, 'referido', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (90, 67, 4504.23, 50, 7, 99, 20, 7, 6, 6579.42, 1, 'organico', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (91, 50, 13347.34, 50, 22, 145, 0, 0, 4, 2663.82, 2, 'referido', 'desktop', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (92, 61, 10527.37, 57, 0, 178, 16, 2, 4, 2885.77, 7, 'publicidad', 'desktop', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (93, 40, 4676.07, 60, 18, 227, 34, 0, 7, 5158.77, 3, 'organico', 'desktop', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (94, 19, 7671.28, 47, 24, 30, 43, 3, 10, 612.46, 7, 'referido', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (95, 19, 10796.99, 56, 21, 53, 15, 1, 12, 5317.69, 5, 'referido', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (96, 46, 3490.58, 46, 5, 121, 19, 2, 12, 8481.31, 3, 'redes', 'desktop', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (97, 66, 11006.66, 19, 10, 5, 46, 0, 2, 5900.40, 6, 'redes', 'movil', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (98, 22, 12819.52, 55, 22, 48, 33, 0, 12, 8345.04, 1, 'referido', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (99, 39, 6455.63, 20, 9, 159, 10, 8, 12, 4395.69, 2, 'publicidad', 'desktop', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (100, 32, 12625.59, 8, 17, 173, 40, 8, 10, 8135.80, 0, 'publicidad', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (101, 47, 8005.96, 36, 25, 150, 37, 2, 10, 1135.25, 4, 'organico', 'desktop', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (102, 26, 5620.27, 28, 3, 193, 26, 2, 11, 6403.02, 2, 'organico', 'movil', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (103, 21, 3769.05, 4, 8, 164, 39, 8, 8, 4189.94, 5, 'publicidad', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (104, 21, 3281.80, 9, 23, 129, 45, 2, 12, 2137.23, 1, 'publicidad', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (105, 66, 9059.40, 36, 20, 110, 2, 3, 3, 7596.19, 6, 'publicidad', 'tablet', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (106, 39, 12863.06, 13, 7, 156, 45, 7, 10, 961.52, 2, 'redes', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (107, 44, 5690.68, 29, 6, 222, 24, 3, 2, 4573.70, 5, 'publicidad', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (108, 55, 11405.03, 5, 8, 65, 19, 8, 10, 5399.55, 6, 'publicidad', 'desktop', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (109, 40, 5031.12, 37, 19, 99, 14, 0, 7, 3526.50, 1, 'publicidad', 'tablet', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (110, 66, 11406.11, 8, 7, 47, 9, 5, 12, 4496.70, 0, 'redes', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (111, 50, 11161.83, 37, 13, 133, 48, 1, 0, 1738.33, 5, 'organico', 'desktop', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (112, 60, 8388.91, 50, 19, 192, 30, 2, 6, 2646.12, 4, 'publicidad', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (113, 42, 10408.61, 37, 21, 232, 35, 6, 1, 227.75, 0, 'organico', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (114, 48, 6196.25, 32, 22, 55, 31, 0, 5, 6240.86, 5, 'organico', 'movil', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (115, 37, 6741.95, 27, 19, 166, 3, 4, 12, 4022.31, 0, 'publicidad', 'desktop', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (116, 64, 9153.79, 2, 3, 36, 1, 1, 1, 4684.90, 6, 'referido', 'tablet', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (117, 63, 12942.46, 28, 3, 132, 6, 0, 3, 1697.48, 7, 'publicidad', 'tablet', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (118, 18, 5415.66, 16, 6, 39, 2, 3, 3, 2429.58, 6, 'referido', 'movil', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (119, 61, 7268.74, 0, 18, 82, 46, 7, 4, 1020.12, 0, 'publicidad', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (120, 50, 12807.52, 39, 15, 110, 7, 1, 10, 1269.36, 0, 'redes', 'tablet', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (121, 20, 10450.18, 18, 8, 6, 44, 2, 0, 1613.84, 2, 'redes', 'movil', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (122, 49, 12582.24, 32, 25, 38, 13, 3, 10, 3587.75, 2, 'referido', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (123, 67, 12177.17, 30, 10, 7, 41, 2, 3, 5052.87, 2, 'organico', 'desktop', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (124, 32, 10530.52, 46, 11, 55, 40, 1, 10, 4164.37, 7, 'referido', 'tablet', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (125, 40, 6468.62, 6, 16, 212, 28, 2, 7, 5513.55, 6, 'referido', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (126, 34, 8243.38, 33, 17, 144, 13, 4, 11, 3871.20, 2, 'publicidad', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (127, 50, 11987.38, 35, 18, 71, 20, 6, 2, 2984.35, 4, 'referido', 'desktop', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (128, 20, 11035.98, 42, 24, 58, 13, 7, 4, 4447.70, 7, 'publicidad', 'desktop', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (129, 59, 8166.29, 36, 10, 30, 39, 7, 7, 6371.66, 1, 'publicidad', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (130, 23, 11689.50, 51, 1, 40, 46, 8, 12, 509.79, 7, 'publicidad', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (131, 41, 5223.43, 35, 20, 111, 35, 7, 9, 5622.31, 4, 'referido', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (132, 57, 11631.05, 15, 2, 195, 22, 6, 0, 835.83, 3, 'organico', 'desktop', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (133, 42, 12665.08, 42, 9, 151, 40, 4, 0, 5628.01, 4, 'publicidad', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (134, 24, 6652.67, 49, 9, 235, 50, 1, 7, 1694.43, 1, 'redes', 'movil', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (135, 59, 3923.03, 26, 5, 61, 27, 6, 10, 3596.42, 6, 'publicidad', 'desktop', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (136, 63, 4041.61, 2, 25, 70, 20, 3, 12, 2226.42, 7, 'organico', 'desktop', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (137, 53, 9988.01, 3, 1, 77, 18, 0, 6, 6032.82, 3, 'publicidad', 'movil', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (138, 57, 12380.32, 54, 2, 87, 18, 6, 0, 7144.34, 1, 'redes', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (139, 33, 7831.09, 28, 2, 94, 7, 2, 7, 3175.14, 1, 'referido', 'movil', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (140, 18, 13096.92, 36, 14, 132, 3, 5, 11, 2027.61, 0, 'redes', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (141, 46, 8496.66, 48, 10, 207, 37, 6, 6, 3265.06, 6, 'redes', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (142, 38, 5372.98, 37, 3, 66, 16, 4, 2, 7068.07, 2, 'redes', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (143, 44, 3426.91, 46, 24, 171, 39, 4, 12, 1377.65, 6, 'publicidad', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (144, 22, 3365.42, 37, 3, 159, 17, 0, 1, 4367.10, 0, 'referido', 'tablet', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (145, 68, 5183.89, 37, 20, 131, 15, 8, 10, 4503.22, 6, 'publicidad', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (146, 21, 6931.94, 16, 0, 122, 40, 2, 3, 3924.55, 4, 'publicidad', 'tablet', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (147, 26, 12884.27, 57, 15, 55, 24, 3, 6, 1465.72, 3, 'publicidad', 'movil', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (148, 60, 8911.97, 1, 0, 38, 47, 3, 11, 7934.37, 0, 'referido', 'movil', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (149, 68, 4088.72, 36, 17, 170, 40, 2, 0, 7387.34, 5, 'redes', 'desktop', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (150, 44, 11981.77, 31, 4, 19, 7, 4, 1, 5961.16, 5, 'referido', 'tablet', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (151, 58, 8566.01, 12, 15, 95, 37, 8, 9, 5688.19, 6, 'publicidad', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (152, 58, 7178.44, 11, 5, 237, 40, 2, 4, 7012.83, 1, 'publicidad', 'tablet', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (153, 18, 5307.72, 40, 22, 28, 44, 3, 11, 470.09, 5, 'redes', 'desktop', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (154, 65, 3773.68, 43, 8, 170, 1, 2, 8, 2654.72, 0, 'redes', 'movil', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (155, 35, 2147.32, 30, 24, 46, 43, 3, 4, 5534.78, 7, 'redes', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (156, 39, 3221.17, 3, 17, 221, 30, 2, 9, 3314.45, 6, 'redes', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (157, 53, 10471.33, 1, 12, 73, 46, 8, 5, 579.73, 7, 'redes', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (158, 52, 7286.74, 55, 18, 221, 16, 3, 6, 928.37, 4, 'redes', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (159, 44, 6565.25, 55, 23, 177, 44, 5, 0, 7005.57, 6, 'publicidad', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (160, 27, 2984.10, 54, 21, 199, 4, 4, 2, 5116.64, 0, 'redes', 'desktop', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (161, 53, 11893.50, 31, 18, 7, 23, 0, 5, 7456.12, 6, 'organico', 'desktop', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (162, 25, 4137.50, 59, 21, 186, 34, 1, 2, 1885.01, 1, 'referido', 'movil', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (163, 64, 6010.74, 50, 8, 172, 5, 2, 2, 6341.49, 6, 'publicidad', 'desktop', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (164, 54, 11567.74, 28, 2, 214, 2, 1, 3, 6187.55, 7, 'referido', 'movil', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (165, 50, 9067.05, 45, 7, 96, 18, 8, 8, 165.23, 2, 'redes', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (166, 59, 8909.50, 60, 10, 218, 23, 0, 12, 5966.32, 6, 'publicidad', 'desktop', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (167, 43, 8712.05, 26, 23, 47, 21, 2, 5, 966.98, 7, 'referido', 'desktop', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (168, 27, 2975.23, 42, 16, 44, 0, 2, 4, 1852.92, 2, 'redes', 'desktop', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (169, 48, 8222.56, 6, 21, 100, 0, 7, 0, 1411.20, 4, 'organico', 'desktop', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (170, 70, 2289.21, 11, 9, 118, 46, 5, 5, 8036.99, 3, 'redes', 'desktop', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (171, 50, 7130.11, 15, 18, 109, 33, 3, 5, 7393.58, 7, 'referido', 'desktop', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (172, 65, 5710.68, 29, 15, 235, 32, 3, 9, 4835.42, 1, 'organico', 'desktop', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (173, 39, 1812.32, 39, 13, 165, 20, 2, 1, 7343.47, 7, 'referido', 'desktop', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (174, 63, 12553.86, 42, 2, 102, 36, 8, 8, 648.04, 4, 'redes', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (175, 32, 11739.18, 24, 15, 9, 35, 0, 0, 770.31, 3, 'publicidad', 'movil', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (176, 64, 13485.52, 1, 18, 209, 32, 4, 0, 2020.07, 2, 'redes', 'desktop', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (177, 68, 12546.61, 27, 11, 143, 50, 1, 5, 6815.75, 6, 'redes', 'tablet', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (178, 18, 3972.25, 42, 24, 172, 33, 6, 7, 5890.52, 1, 'publicidad', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (179, 20, 2750.48, 52, 13, 78, 8, 7, 0, 4280.40, 1, 'referido', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (180, 24, 3546.28, 45, 0, 63, 33, 5, 6, 1325.62, 0, 'publicidad', 'desktop', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (181, 18, 2245.02, 55, 3, 139, 3, 6, 2, 1451.34, 6, 'publicidad', 'desktop', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (182, 68, 8683.84, 24, 11, 21, 21, 5, 1, 7662.34, 1, 'referido', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (183, 36, 9834.19, 28, 5, 161, 38, 2, 2, 4072.90, 7, 'publicidad', 'tablet', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (184, 45, 8497.53, 40, 10, 6, 35, 6, 9, 446.78, 6, 'referido', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (185, 31, 7067.41, 35, 5, 42, 17, 2, 8, 6371.41, 1, 'redes', 'desktop', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (186, 36, 7692.88, 49, 5, 193, 8, 6, 4, 5908.99, 6, 'organico', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (187, 61, 6058.00, 13, 23, 143, 7, 6, 3, 4401.60, 1, 'redes', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (188, 62, 10676.80, 7, 8, 108, 49, 6, 4, 3854.17, 5, 'redes', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (189, 25, 4890.59, 47, 20, 160, 40, 8, 12, 3589.91, 1, 'publicidad', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (190, 65, 6677.32, 7, 8, 90, 17, 3, 3, 2979.28, 7, 'organico', 'desktop', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (191, 40, 3898.37, 16, 0, 148, 49, 6, 3, 6038.18, 7, 'referido', 'desktop', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (192, 28, 7423.78, 8, 12, 214, 27, 5, 5, 3027.90, 2, 'publicidad', 'desktop', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (193, 60, 10448.52, 37, 25, 160, 19, 7, 8, 2486.94, 4, 'referido', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (194, 54, 6184.26, 53, 22, 76, 23, 5, 6, 1701.92, 7, 'publicidad', 'desktop', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (195, 57, 10612.81, 54, 21, 114, 37, 2, 8, 5319.36, 7, 'organico', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (196, 45, 13481.02, 12, 5, 132, 29, 0, 10, 278.50, 5, 'organico', 'desktop', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (197, 44, 10659.69, 26, 23, 137, 43, 1, 6, 275.34, 6, 'referido', 'tablet', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (198, 35, 3812.63, 3, 1, 137, 39, 8, 2, 7296.11, 0, 'redes', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (199, 47, 6466.86, 46, 1, 214, 43, 6, 10, 1305.69, 0, 'referido', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (200, 21, 2740.09, 39, 22, 215, 2, 5, 10, 4534.49, 7, 'publicidad', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (201, 32, 7108.02, 22, 17, 43, 28, 2, 6, 5777.24, 6, 'publicidad', 'tablet', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (202, 68, 6044.04, 2, 23, 93, 22, 3, 7, 253.96, 3, 'publicidad', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (203, 19, 7835.64, 10, 19, 83, 36, 8, 11, 5119.89, 1, 'organico', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (204, 25, 4491.19, 20, 15, 200, 4, 3, 0, 7948.40, 1, 'redes', 'movil', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (205, 48, 6485.23, 58, 7, 25, 28, 4, 6, 1631.70, 2, 'publicidad', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (206, 38, 5140.07, 47, 6, 67, 37, 6, 11, 190.46, 3, 'redes', 'desktop', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (207, 61, 3115.68, 15, 21, 60, 4, 4, 11, 3848.40, 2, 'organico', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (208, 46, 4772.18, 20, 0, 68, 25, 8, 6, 5136.90, 6, 'organico', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (209, 51, 4704.10, 20, 15, 63, 28, 1, 4, 6077.01, 6, 'referido', 'tablet', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (210, 52, 5823.90, 40, 17, 50, 19, 8, 11, 6448.22, 5, 'organico', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (211, 55, 8252.31, 56, 20, 49, 17, 8, 0, 1059.78, 0, 'publicidad', 'desktop', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (212, 34, 12266.14, 28, 1, 32, 23, 6, 1, 3731.12, 2, 'publicidad', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (213, 42, 11406.32, 42, 21, 185, 12, 3, 10, 1589.52, 4, 'redes', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (214, 44, 10527.86, 48, 4, 147, 24, 4, 12, 6432.41, 3, 'organico', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (215, 30, 3820.86, 0, 0, 186, 4, 6, 11, 4537.74, 3, 'publicidad', 'desktop', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (216, 36, 2512.88, 19, 24, 79, 41, 0, 4, 250.39, 6, 'publicidad', 'tablet', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (217, 28, 10066.87, 9, 15, 27, 34, 4, 5, 6259.85, 4, 'referido', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (218, 35, 1948.79, 21, 18, 181, 1, 0, 7, 8178.98, 3, 'redes', 'desktop', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (219, 36, 11208.11, 21, 22, 106, 15, 4, 0, 4250.28, 7, 'redes', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (220, 54, 4765.48, 19, 7, 113, 38, 2, 10, 5862.26, 4, 'organico', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (221, 19, 5601.94, 40, 23, 45, 20, 8, 11, 8137.88, 6, 'publicidad', 'desktop', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (222, 53, 9834.01, 30, 0, 31, 25, 5, 1, 5257.79, 6, 'redes', 'tablet', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (223, 69, 8535.47, 13, 18, 141, 32, 4, 11, 21.32, 1, 'redes', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (224, 67, 8043.99, 7, 19, 90, 37, 1, 9, 3118.34, 3, 'referido', 'desktop', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (225, 61, 13544.11, 24, 18, 196, 29, 6, 9, 2259.48, 7, 'organico', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (226, 54, 1859.44, 55, 5, 144, 20, 0, 9, 7114.33, 6, 'redes', 'movil', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (227, 30, 12870.59, 0, 21, 67, 37, 0, 8, 7549.25, 0, 'redes', 'movil', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (228, 51, 4215.69, 36, 12, 108, 23, 7, 11, 2074.79, 4, 'organico', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (229, 44, 8860.80, 24, 22, 212, 30, 3, 6, 6195.24, 5, 'publicidad', 'desktop', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (230, 46, 12274.67, 38, 2, 181, 1, 4, 7, 6902.96, 3, 'publicidad', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (231, 61, 1914.83, 58, 2, 238, 44, 6, 9, 6490.65, 3, 'referido', 'desktop', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (232, 37, 2813.04, 11, 2, 147, 37, 0, 10, 4113.39, 7, 'publicidad', 'movil', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (233, 24, 8486.17, 13, 20, 224, 20, 1, 3, 215.33, 7, 'publicidad', 'tablet', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (234, 20, 12933.73, 8, 13, 193, 31, 4, 1, 2003.98, 4, 'referido', 'desktop', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (235, 20, 13405.87, 52, 13, 88, 11, 5, 0, 4062.95, 6, 'redes', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (236, 27, 8070.42, 49, 25, 56, 43, 4, 7, 1461.62, 1, 'referido', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (237, 60, 11858.63, 16, 23, 239, 19, 1, 5, 7892.52, 4, 'organico', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (238, 47, 9175.45, 23, 13, 63, 32, 8, 1, 2410.62, 1, 'redes', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (239, 38, 4097.49, 50, 23, 16, 2, 2, 12, 1376.11, 2, 'publicidad', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (240, 61, 7141.92, 44, 8, 35, 12, 6, 8, 5808.54, 0, 'referido', 'desktop', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (241, 58, 9853.70, 49, 15, 162, 2, 6, 2, 7836.06, 4, 'referido', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (242, 39, 3475.35, 19, 17, 202, 43, 2, 10, 7784.38, 6, 'publicidad', 'desktop', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (243, 51, 10579.48, 6, 14, 86, 20, 4, 10, 2470.53, 6, 'referido', 'desktop', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (244, 53, 3549.41, 51, 9, 51, 38, 7, 12, 7598.10, 7, 'redes', 'desktop', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (245, 68, 1811.90, 3, 22, 37, 16, 3, 1, 3723.94, 7, 'publicidad', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (246, 22, 4214.58, 14, 20, 81, 39, 0, 4, 5923.88, 7, 'publicidad', 'movil', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (247, 21, 2674.82, 44, 23, 110, 43, 8, 3, 949.24, 2, 'referido', 'desktop', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (248, 27, 6689.92, 45, 7, 31, 7, 2, 6, 7286.19, 0, 'organico', 'desktop', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (249, 28, 4218.37, 59, 7, 149, 16, 1, 0, 2299.75, 0, 'organico', 'desktop', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (250, 24, 6545.73, 15, 3, 51, 34, 3, 10, 4303.64, 7, 'publicidad', 'tablet', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (251, 61, 1958.73, 52, 20, 225, 41, 6, 11, 7779.84, 4, 'publicidad', 'desktop', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (252, 69, 8075.01, 38, 17, 186, 40, 0, 4, 1605.78, 1, 'organico', 'movil', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (253, 32, 11002.23, 19, 16, 143, 11, 1, 12, 696.41, 6, 'publicidad', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (254, 70, 7846.63, 48, 15, 29, 20, 6, 0, 4285.77, 6, 'organico', 'desktop', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (255, 50, 11344.20, 16, 5, 172, 49, 7, 11, 4973.57, 3, 'redes', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (256, 51, 8875.73, 46, 24, 183, 40, 5, 11, 2211.28, 4, 'organico', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (257, 41, 7616.37, 48, 1, 109, 35, 6, 4, 4695.08, 6, 'redes', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (258, 20, 5729.78, 45, 17, 114, 17, 8, 9, 504.54, 1, 'organico', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (259, 65, 6183.38, 21, 25, 186, 33, 6, 0, 1309.79, 1, 'publicidad', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (260, 34, 12857.82, 54, 18, 43, 33, 0, 6, 7643.23, 5, 'organico', 'movil', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (261, 70, 5037.26, 7, 16, 174, 39, 3, 7, 5772.76, 7, 'organico', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (262, 56, 8650.16, 5, 7, 237, 10, 6, 2, 4301.21, 3, 'redes', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (263, 19, 12926.15, 54, 14, 25, 21, 8, 9, 4868.85, 1, 'redes', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (264, 28, 8973.40, 51, 9, 134, 1, 1, 7, 245.18, 6, 'redes', 'movil', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (265, 27, 4391.97, 20, 4, 220, 24, 1, 0, 2456.84, 2, 'referido', 'movil', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (266, 56, 11645.54, 60, 9, 125, 28, 2, 9, 4500.42, 4, 'referido', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (267, 49, 13495.96, 28, 23, 111, 36, 4, 11, 3739.49, 1, 'publicidad', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (268, 52, 2867.00, 19, 20, 80, 36, 8, 12, 6877.81, 4, 'publicidad', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (269, 44, 9074.64, 9, 21, 31, 48, 3, 6, 5670.64, 1, 'organico', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (270, 69, 7320.62, 15, 7, 115, 32, 1, 3, 6441.10, 1, 'publicidad', 'desktop', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (271, 56, 9605.04, 59, 15, 175, 31, 8, 0, 4068.74, 0, 'redes', 'desktop', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (272, 56, 12124.19, 29, 20, 196, 25, 0, 2, 1180.10, 7, 'organico', 'movil', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (273, 22, 5494.71, 59, 24, 213, 13, 4, 12, 6307.57, 7, 'organico', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (274, 39, 11825.97, 7, 12, 64, 31, 1, 11, 637.05, 3, 'referido', 'tablet', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (275, 60, 4473.27, 20, 7, 208, 13, 1, 1, 253.12, 6, 'publicidad', 'movil', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (276, 59, 3949.91, 57, 5, 48, 41, 0, 9, 3140.91, 5, 'publicidad', 'desktop', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (277, 21, 12199.82, 11, 17, 158, 34, 6, 2, 1380.04, 5, 'organico', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (278, 39, 5544.73, 2, 19, 210, 29, 2, 7, 454.91, 0, 'organico', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (279, 26, 11660.98, 51, 22, 213, 22, 2, 9, 7444.54, 5, 'redes', 'desktop', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (280, 29, 9711.18, 39, 11, 121, 47, 2, 5, 5487.53, 4, 'referido', 'tablet', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (281, 64, 7574.67, 48, 1, 167, 2, 5, 3, 5705.49, 4, 'referido', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (282, 42, 3303.29, 33, 15, 87, 36, 5, 8, 5325.61, 3, 'redes', 'desktop', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (283, 42, 10692.88, 50, 16, 94, 43, 2, 7, 3186.60, 1, 'referido', 'desktop', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (284, 62, 11678.64, 9, 14, 217, 0, 2, 0, 3984.69, 6, 'redes', 'tablet', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (285, 19, 10264.53, 2, 2, 218, 16, 6, 9, 3893.73, 7, 'publicidad', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (286, 68, 12301.46, 55, 7, 62, 42, 4, 3, 5384.05, 2, 'referido', 'movil', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (287, 30, 12610.68, 30, 8, 109, 35, 8, 6, 7282.59, 6, 'organico', 'desktop', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (288, 68, 3242.72, 44, 10, 185, 31, 3, 10, 7857.09, 3, 'referido', 'desktop', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (289, 34, 9458.47, 20, 1, 132, 39, 4, 10, 889.14, 4, 'publicidad', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (290, 66, 10814.58, 19, 8, 209, 7, 3, 2, 4387.64, 3, 'publicidad', 'desktop', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (291, 45, 9241.86, 13, 16, 84, 17, 3, 2, 2735.81, 7, 'referido', 'desktop', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (292, 50, 11723.45, 17, 18, 165, 50, 4, 2, 1354.70, 3, 'publicidad', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (293, 47, 7719.62, 3, 12, 39, 16, 8, 8, 976.07, 5, 'publicidad', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (294, 68, 9997.51, 35, 1, 88, 42, 0, 3, 7781.52, 7, 'referido', 'tablet', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (295, 40, 1856.80, 7, 11, 200, 7, 3, 0, 1074.65, 6, 'organico', 'movil', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (296, 50, 4570.12, 34, 24, 177, 45, 5, 10, 77.07, 3, 'publicidad', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (297, 42, 2873.41, 39, 17, 128, 22, 7, 1, 3643.28, 7, 'redes', 'desktop', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (298, 23, 8061.77, 2, 17, 150, 41, 4, 10, 5602.17, 3, 'publicidad', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (299, 29, 6353.21, 29, 10, 13, 31, 4, 6, 241.42, 5, 'organico', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (300, 50, 3919.93, 2, 9, 57, 19, 5, 0, 314.47, 5, 'organico', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (301, 20, 7210.42, 23, 20, 121, 3, 1, 0, 5899.23, 5, 'redes', 'desktop', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (302, 56, 2893.07, 13, 1, 222, 1, 2, 11, 5533.47, 5, 'redes', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (303, 50, 12142.63, 50, 2, 90, 30, 5, 9, 6637.90, 2, 'referido', 'desktop', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (304, 34, 6815.26, 45, 5, 23, 26, 6, 2, 1828.99, 0, 'redes', 'desktop', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (305, 29, 3990.66, 60, 17, 115, 26, 7, 6, 7595.08, 7, 'redes', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (306, 68, 12593.65, 48, 6, 60, 40, 4, 8, 1049.45, 7, 'redes', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (307, 59, 12903.17, 2, 19, 169, 48, 3, 2, 6655.12, 7, 'organico', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (308, 42, 7346.36, 14, 13, 163, 28, 1, 0, 2820.61, 0, 'redes', 'desktop', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (309, 67, 3584.28, 32, 3, 117, 43, 0, 7, 4855.06, 5, 'redes', 'movil', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (310, 47, 5611.80, 16, 4, 221, 23, 4, 2, 222.44, 7, 'redes', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (311, 18, 9472.44, 21, 24, 224, 38, 0, 12, 7908.18, 6, 'redes', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (312, 58, 7012.37, 8, 19, 69, 25, 8, 12, 4177.55, 2, 'organico', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (313, 25, 7177.19, 22, 18, 16, 38, 7, 2, 897.15, 6, 'organico', 'desktop', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (314, 19, 2165.83, 22, 20, 98, 8, 2, 7, 2497.03, 6, 'referido', 'desktop', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (315, 55, 8002.04, 14, 9, 1, 17, 8, 7, 7855.73, 2, 'publicidad', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (316, 40, 10275.79, 53, 18, 114, 39, 3, 2, 1739.38, 1, 'redes', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (317, 59, 2208.59, 0, 23, 21, 5, 4, 0, 5784.69, 3, 'publicidad', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (318, 57, 10253.97, 5, 13, 45, 47, 7, 2, 3221.27, 2, 'organico', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (319, 48, 9738.68, 38, 21, 139, 5, 5, 7, 2387.99, 1, 'publicidad', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (320, 55, 11547.17, 3, 23, 168, 21, 6, 7, 666.08, 4, 'redes', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (321, 46, 4098.92, 11, 25, 35, 33, 7, 2, 5808.94, 1, 'referido', 'desktop', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (322, 38, 9216.58, 54, 15, 9, 23, 1, 2, 5738.86, 0, 'referido', 'desktop', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (323, 54, 7056.42, 59, 19, 139, 48, 6, 10, 2881.87, 0, 'redes', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (324, 65, 4037.02, 32, 18, 91, 27, 8, 8, 6205.88, 5, 'organico', 'desktop', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (325, 51, 6986.12, 55, 23, 128, 33, 2, 1, 5215.91, 7, 'referido', 'movil', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (326, 69, 6759.17, 11, 7, 148, 42, 4, 1, 8046.76, 4, 'referido', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (327, 58, 7928.72, 41, 14, 193, 49, 2, 12, 492.26, 3, 'redes', 'desktop', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (328, 64, 10152.19, 16, 13, 122, 20, 3, 12, 8378.96, 7, 'organico', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (329, 43, 3020.49, 27, 13, 103, 21, 6, 12, 3038.31, 0, 'redes', 'desktop', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (330, 49, 8346.27, 20, 23, 132, 28, 6, 12, 4837.82, 1, 'redes', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (331, 44, 7995.45, 19, 16, 123, 39, 6, 3, 1163.69, 0, 'organico', 'desktop', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (332, 59, 12445.25, 4, 19, 87, 9, 1, 11, 4917.55, 2, 'publicidad', 'tablet', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (333, 42, 9699.72, 29, 11, 136, 1, 3, 10, 2874.36, 5, 'publicidad', 'desktop', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (334, 59, 5065.34, 35, 10, 12, 1, 0, 10, 8144.83, 1, 'referido', 'desktop', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (335, 18, 12735.98, 41, 9, 213, 26, 1, 3, 2658.32, 5, 'organico', 'desktop', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (336, 29, 3029.11, 32, 24, 129, 46, 1, 7, 413.42, 5, 'referido', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (337, 45, 4857.00, 8, 6, 182, 10, 0, 1, 8328.67, 4, 'referido', 'tablet', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (338, 22, 9293.27, 52, 18, 150, 22, 8, 11, 685.78, 2, 'redes', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (339, 24, 2807.20, 29, 24, 17, 38, 2, 5, 4816.77, 7, 'referido', 'tablet', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (340, 63, 3986.13, 24, 16, 47, 48, 1, 12, 8205.25, 6, 'organico', 'movil', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (341, 36, 13589.08, 14, 18, 104, 19, 6, 5, 2851.86, 6, 'redes', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (342, 61, 8739.98, 33, 6, 80, 41, 0, 8, 5427.42, 7, 'redes', 'tablet', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (343, 57, 12281.75, 54, 25, 92, 45, 6, 12, 6986.94, 2, 'organico', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (344, 35, 6716.83, 43, 12, 1, 33, 4, 6, 356.85, 7, 'publicidad', 'desktop', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (345, 70, 8122.08, 24, 17, 41, 36, 7, 2, 1726.93, 3, 'publicidad', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (346, 63, 8576.76, 2, 9, 79, 0, 7, 3, 99.09, 4, 'publicidad', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (347, 44, 5530.09, 41, 5, 16, 23, 0, 2, 7357.97, 1, 'redes', 'tablet', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (348, 42, 1836.02, 59, 11, 79, 49, 1, 6, 2110.57, 3, 'organico', 'tablet', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (349, 31, 13282.57, 10, 7, 166, 27, 8, 5, 7619.06, 4, 'publicidad', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (350, 58, 6515.55, 10, 24, 28, 45, 4, 1, 7068.86, 7, 'organico', 'desktop', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (351, 64, 10579.48, 25, 21, 144, 19, 6, 8, 5094.07, 5, 'organico', 'desktop', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (352, 21, 12511.29, 50, 18, 89, 50, 8, 11, 1638.33, 4, 'publicidad', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (353, 32, 5810.34, 52, 5, 197, 46, 3, 8, 4537.16, 6, 'redes', 'desktop', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (354, 18, 4966.75, 31, 1, 36, 4, 3, 3, 5498.36, 3, 'publicidad', 'desktop', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (355, 43, 2368.71, 7, 13, 85, 25, 3, 2, 5655.10, 3, 'publicidad', 'tablet', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (356, 44, 5485.05, 24, 22, 181, 15, 6, 8, 2717.79, 1, 'organico', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (357, 38, 13450.90, 23, 19, 35, 50, 2, 1, 2926.66, 3, 'organico', 'desktop', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (358, 28, 9552.16, 32, 19, 6, 8, 7, 10, 7601.91, 5, 'redes', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (359, 47, 2830.77, 17, 13, 10, 0, 6, 9, 4012.07, 0, 'organico', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (360, 65, 11651.17, 56, 3, 122, 3, 5, 10, 817.73, 5, 'referido', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (361, 31, 5808.58, 25, 21, 173, 8, 0, 9, 7225.63, 4, 'publicidad', 'tablet', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (362, 30, 7607.57, 33, 4, 29, 26, 4, 9, 5402.22, 6, 'organico', 'movil', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (363, 55, 10024.81, 45, 7, 197, 2, 3, 1, 7691.58, 3, 'redes', 'desktop', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (364, 55, 11304.64, 27, 16, 90, 0, 1, 5, 4235.24, 6, 'organico', 'desktop', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (365, 52, 2824.02, 43, 12, 57, 28, 4, 12, 748.86, 2, 'redes', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (366, 44, 12644.83, 45, 9, 223, 5, 6, 8, 7770.97, 2, 'referido', 'desktop', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (367, 60, 2344.94, 8, 14, 86, 34, 7, 5, 6047.17, 3, 'publicidad', 'desktop', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (368, 30, 9622.72, 39, 23, 116, 17, 5, 12, 2470.33, 7, 'redes', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (369, 61, 12110.13, 9, 18, 168, 24, 6, 6, 2996.24, 5, 'publicidad', 'desktop', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (370, 31, 12211.75, 13, 0, 91, 27, 8, 2, 6299.73, 0, 'publicidad', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (371, 51, 8024.92, 54, 5, 89, 26, 2, 9, 7085.48, 4, 'organico', 'desktop', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (372, 45, 7375.03, 16, 25, 143, 12, 2, 12, 4025.85, 5, 'organico', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (373, 56, 8435.75, 19, 15, 231, 27, 3, 6, 3524.54, 5, 'redes', 'desktop', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (374, 52, 13316.93, 2, 4, 98, 50, 2, 0, 767.20, 7, 'publicidad', 'tablet', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (375, 33, 5981.22, 26, 14, 67, 24, 5, 10, 3910.39, 4, 'publicidad', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (376, 66, 10634.63, 30, 23, 2, 5, 5, 0, 1430.56, 1, 'referido', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (377, 38, 12783.15, 28, 24, 68, 42, 5, 3, 2994.88, 7, 'referido', 'desktop', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (378, 67, 11768.68, 54, 10, 187, 17, 8, 1, 3468.44, 2, 'organico', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (379, 23, 6122.75, 44, 20, 123, 6, 2, 10, 1683.23, 5, 'referido', 'desktop', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (380, 32, 12835.54, 60, 4, 192, 36, 5, 8, 4320.82, 1, 'redes', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (381, 28, 11124.92, 60, 16, 152, 19, 7, 9, 7891.75, 6, 'organico', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (382, 25, 12071.21, 4, 9, 89, 13, 4, 12, 1745.65, 1, 'publicidad', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (383, 54, 2811.53, 53, 8, 102, 48, 2, 2, 2467.73, 3, 'referido', 'movil', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (384, 57, 4579.03, 17, 15, 96, 0, 5, 5, 5173.10, 3, 'redes', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (385, 40, 9290.57, 15, 11, 137, 35, 3, 9, 4211.20, 1, 'referido', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (386, 62, 13350.79, 56, 16, 112, 16, 0, 10, 2220.18, 1, 'publicidad', 'movil', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (387, 68, 2904.43, 7, 20, 151, 27, 5, 0, 164.23, 1, 'referido', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (388, 29, 11138.58, 28, 17, 204, 22, 2, 1, 6640.01, 7, 'referido', 'desktop', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (389, 19, 3407.30, 40, 2, 5, 13, 2, 5, 1590.65, 5, 'referido', 'tablet', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (390, 30, 12706.94, 7, 11, 182, 24, 7, 0, 8351.72, 3, 'publicidad', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (391, 63, 5737.00, 56, 17, 102, 14, 7, 5, 1533.97, 4, 'referido', 'desktop', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (392, 27, 5055.45, 32, 17, 233, 49, 3, 1, 7233.16, 0, 'publicidad', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (393, 24, 2776.31, 37, 14, 187, 38, 8, 0, 5658.62, 6, 'referido', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (394, 28, 8999.89, 11, 6, 126, 4, 5, 2, 3536.39, 3, 'referido', 'desktop', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (395, 49, 10312.07, 23, 16, 155, 16, 2, 3, 1443.09, 6, 'organico', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (396, 49, 4760.90, 6, 4, 167, 21, 4, 2, 141.34, 4, 'redes', 'movil', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (397, 65, 12059.19, 30, 22, 101, 39, 6, 5, 4494.08, 6, 'referido', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (398, 33, 4896.98, 29, 25, 114, 14, 4, 4, 5562.74, 0, 'redes', 'desktop', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (399, 55, 3963.57, 43, 15, 164, 46, 0, 0, 3220.65, 2, 'referido', 'tablet', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (400, 19, 6494.75, 46, 11, 11, 20, 2, 7, 6839.46, 6, 'redes', 'movil', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (401, 31, 4964.08, 34, 20, 236, 39, 1, 2, 6397.61, 5, 'referido', 'desktop', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (402, 57, 7449.79, 54, 4, 130, 17, 6, 8, 5385.54, 3, 'redes', 'desktop', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (403, 55, 3775.48, 20, 20, 126, 34, 3, 2, 4248.18, 6, 'publicidad', 'movil', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (404, 48, 3967.07, 31, 20, 24, 39, 8, 1, 1166.07, 1, 'referido', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (405, 56, 10118.20, 40, 10, 74, 29, 7, 4, 3542.95, 2, 'organico', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (406, 62, 7508.07, 36, 4, 237, 18, 7, 11, 6732.87, 3, 'referido', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (407, 54, 4096.47, 17, 2, 118, 37, 1, 6, 4771.09, 4, 'referido', 'movil', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (408, 56, 4356.15, 55, 12, 26, 45, 1, 6, 5243.43, 2, 'organico', 'tablet', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (409, 48, 2340.92, 15, 18, 119, 1, 4, 9, 7735.31, 3, 'referido', 'desktop', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (410, 43, 4993.24, 54, 15, 18, 40, 0, 2, 6377.55, 3, 'organico', 'desktop', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (411, 45, 5481.08, 4, 12, 149, 45, 1, 5, 834.86, 3, 'redes', 'tablet', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (412, 20, 10439.62, 7, 22, 0, 46, 5, 2, 2481.31, 0, 'publicidad', 'desktop', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (413, 52, 4979.74, 1, 17, 186, 25, 4, 1, 8264.93, 5, 'redes', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (414, 28, 12555.54, 18, 24, 14, 48, 5, 6, 5952.60, 0, 'publicidad', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (415, 63, 13043.06, 34, 15, 138, 48, 7, 1, 1138.84, 4, 'referido', 'desktop', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (416, 38, 8895.08, 46, 5, 136, 27, 7, 11, 2486.55, 3, 'publicidad', 'desktop', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (417, 22, 2486.31, 35, 13, 203, 36, 7, 6, 3738.07, 0, 'redes', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (418, 63, 4726.07, 56, 18, 190, 11, 6, 2, 3256.07, 5, 'referido', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (419, 19, 2475.42, 32, 17, 65, 49, 6, 4, 5898.93, 2, 'referido', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (420, 59, 10439.71, 7, 8, 230, 22, 7, 3, 4423.82, 0, 'referido', 'desktop', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (421, 23, 12098.21, 46, 24, 192, 5, 5, 1, 5782.89, 5, 'publicidad', 'desktop', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (422, 62, 4526.24, 58, 13, 155, 31, 0, 7, 7722.14, 6, 'referido', 'desktop', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (423, 25, 2892.58, 40, 0, 88, 11, 8, 5, 508.55, 0, 'organico', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (424, 46, 13541.33, 55, 17, 232, 43, 1, 1, 1544.44, 4, 'publicidad', 'tablet', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (425, 59, 10806.98, 14, 19, 240, 10, 2, 7, 1398.89, 0, 'publicidad', 'desktop', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (426, 21, 6347.28, 27, 20, 0, 11, 7, 1, 3620.58, 0, 'publicidad', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (427, 53, 11957.80, 58, 16, 188, 23, 5, 8, 3376.77, 0, 'organico', 'desktop', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (428, 51, 2359.24, 33, 24, 74, 1, 6, 8, 1265.23, 7, 'organico', 'desktop', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (429, 65, 13229.62, 40, 10, 1, 40, 6, 8, 1212.46, 3, 'organico', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (430, 45, 6457.81, 47, 8, 212, 35, 1, 8, 3341.28, 3, 'organico', 'tablet', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (431, 34, 10956.69, 44, 2, 183, 17, 6, 5, 4857.43, 3, 'organico', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (432, 25, 6726.62, 32, 16, 125, 27, 0, 6, 2577.91, 2, 'referido', 'movil', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (433, 46, 12371.39, 12, 23, 16, 0, 6, 6, 4011.98, 1, 'organico', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (434, 27, 11175.33, 38, 20, 108, 33, 3, 7, 2951.99, 2, 'publicidad', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (435, 65, 10366.31, 3, 6, 140, 0, 2, 4, 5880.06, 2, 'referido', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (436, 20, 11223.45, 26, 10, 36, 9, 8, 12, 5259.53, 3, 'publicidad', 'desktop', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (437, 39, 2724.15, 41, 22, 97, 35, 2, 11, 7994.12, 3, 'publicidad', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (438, 33, 11944.65, 50, 0, 73, 44, 3, 12, 4076.62, 5, 'referido', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (439, 67, 3069.94, 35, 17, 231, 24, 1, 8, 2460.69, 5, 'organico', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (440, 23, 12395.02, 59, 10, 48, 41, 2, 9, 6239.97, 0, 'publicidad', 'movil', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (441, 50, 2360.69, 21, 16, 102, 5, 2, 2, 1509.87, 0, 'organico', 'movil', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (442, 54, 10776.65, 11, 7, 207, 27, 6, 3, 7394.88, 3, 'referido', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (443, 33, 12883.97, 24, 10, 54, 42, 8, 1, 5308.43, 0, 'organico', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (444, 43, 7628.18, 50, 22, 112, 5, 3, 4, 3197.80, 3, 'organico', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (445, 33, 5877.98, 25, 24, 11, 4, 5, 8, 6200.83, 2, 'referido', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (446, 20, 2433.84, 56, 21, 40, 19, 0, 5, 4828.21, 2, 'referido', 'movil', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (447, 56, 12806.18, 30, 4, 108, 29, 0, 12, 1654.75, 0, 'publicidad', 'tablet', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (448, 43, 11471.42, 16, 8, 144, 18, 4, 0, 5267.28, 7, 'organico', 'desktop', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (449, 30, 2252.63, 41, 3, 224, 23, 0, 0, 3752.60, 4, 'publicidad', 'desktop', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (450, 30, 4162.54, 43, 14, 60, 24, 5, 0, 2996.09, 1, 'publicidad', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (451, 45, 8545.03, 42, 5, 211, 33, 0, 3, 559.17, 2, 'redes', 'desktop', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (452, 19, 10045.32, 51, 22, 203, 39, 1, 12, 7758.29, 7, 'organico', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (453, 28, 8969.83, 33, 1, 23, 39, 6, 9, 5529.47, 2, 'redes', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (454, 20, 10143.33, 43, 15, 194, 13, 6, 10, 7006.28, 1, 'publicidad', 'desktop', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (455, 36, 2943.38, 4, 13, 25, 42, 0, 12, 1656.94, 2, 'organico', 'tablet', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (456, 18, 3644.35, 38, 24, 83, 13, 4, 1, 113.36, 1, 'publicidad', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (457, 57, 9682.02, 19, 19, 133, 43, 7, 10, 5234.22, 3, 'referido', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (458, 24, 2275.13, 41, 4, 140, 49, 3, 2, 6625.71, 5, 'referido', 'movil', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (459, 55, 2348.09, 0, 5, 41, 29, 1, 0, 5379.01, 0, 'redes', 'movil', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (460, 30, 13187.42, 31, 20, 206, 48, 2, 6, 1575.37, 3, 'publicidad', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (461, 52, 7148.19, 16, 7, 46, 37, 4, 8, 8196.75, 7, 'referido', 'desktop', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (462, 51, 9780.77, 51, 11, 193, 13, 8, 1, 8156.62, 5, 'publicidad', 'desktop', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (463, 53, 4564.15, 43, 17, 198, 46, 2, 8, 2091.64, 1, 'organico', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (464, 28, 8282.18, 14, 16, 59, 44, 6, 11, 5792.77, 7, 'referido', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (465, 46, 6698.31, 23, 7, 121, 2, 1, 11, 6705.93, 6, 'referido', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (466, 50, 6767.43, 30, 19, 50, 21, 1, 2, 1244.18, 5, 'redes', 'tablet', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (467, 41, 7234.83, 8, 21, 181, 43, 7, 12, 6528.76, 6, 'referido', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (468, 34, 12215.94, 2, 17, 240, 32, 0, 2, 4412.07, 5, 'redes', 'movil', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (469, 30, 4258.03, 16, 13, 231, 44, 8, 3, 5413.71, 1, 'publicidad', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (470, 28, 4250.63, 3, 11, 171, 11, 7, 3, 7666.48, 1, 'organico', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (471, 59, 9082.41, 60, 10, 72, 41, 1, 6, 1062.10, 1, 'organico', 'tablet', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (472, 62, 5514.60, 51, 13, 141, 18, 7, 8, 6134.16, 4, 'referido', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (473, 26, 11255.51, 32, 13, 204, 29, 7, 1, 4609.97, 0, 'redes', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (474, 52, 11346.83, 59, 8, 209, 49, 4, 12, 5518.72, 3, 'organico', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (475, 57, 3823.79, 18, 1, 81, 12, 3, 7, 6616.90, 0, 'organico', 'tablet', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (476, 46, 3155.85, 35, 24, 62, 13, 5, 12, 7868.69, 2, 'referido', 'desktop', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (477, 30, 4630.86, 48, 24, 203, 43, 1, 2, 8022.35, 1, 'referido', 'desktop', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (478, 69, 12921.11, 22, 10, 48, 33, 7, 3, 3502.55, 5, 'organico', 'desktop', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (479, 66, 13082.11, 37, 10, 212, 5, 1, 11, 798.01, 7, 'publicidad', 'tablet', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (480, 64, 4478.79, 14, 7, 80, 40, 8, 6, 757.86, 1, 'publicidad', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (481, 58, 3380.39, 31, 10, 57, 2, 6, 5, 6897.99, 3, 'redes', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (482, 56, 3774.85, 43, 14, 39, 49, 6, 0, 7807.59, 3, 'redes', 'desktop', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (483, 25, 12256.82, 46, 15, 167, 1, 0, 6, 5708.49, 6, 'organico', 'movil', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (484, 42, 11015.84, 12, 1, 209, 48, 0, 10, 1536.84, 3, 'referido', 'desktop', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (485, 37, 8977.18, 21, 7, 66, 14, 6, 11, 2995.32, 2, 'referido', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (486, 32, 3595.64, 39, 20, 158, 32, 3, 5, 7402.31, 4, 'referido', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (487, 43, 6235.83, 0, 10, 108, 45, 3, 11, 5628.11, 7, 'publicidad', 'desktop', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (488, 66, 1923.43, 11, 11, 72, 9, 3, 1, 2098.02, 7, 'redes', 'movil', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (489, 40, 12207.73, 54, 6, 10, 13, 6, 12, 7391.06, 0, 'referido', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (490, 34, 8328.22, 4, 4, 182, 41, 3, 5, 555.19, 5, 'redes', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (491, 31, 8027.13, 29, 15, 132, 24, 3, 5, 5844.45, 5, 'redes', 'desktop', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (492, 68, 7013.90, 25, 3, 114, 36, 3, 9, 7630.30, 3, 'redes', 'tablet', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (493, 49, 1905.94, 50, 24, 227, 44, 2, 4, 1077.09, 0, 'redes', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (494, 42, 5892.07, 40, 8, 48, 45, 8, 7, 2935.22, 3, 'organico', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (495, 32, 9777.11, 19, 21, 50, 14, 3, 8, 3442.36, 1, 'referido', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (496, 27, 8441.38, 28, 1, 59, 4, 6, 12, 11.49, 7, 'redes', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (497, 23, 6580.38, 12, 4, 180, 16, 4, 3, 4350.88, 6, 'publicidad', 'desktop', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (498, 48, 10738.02, 0, 24, 171, 24, 1, 9, 763.18, 3, 'organico', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (499, 35, 6021.99, 18, 1, 112, 35, 1, 0, 8280.82, 5, 'publicidad', 'tablet', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (500, 34, 8694.17, 36, 7, 201, 17, 8, 7, 4089.19, 3, 'referido', 'desktop', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (501, 67, 8325.88, 60, 0, 114, 43, 5, 7, 6527.09, 4, 'publicidad', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (502, 38, 8573.80, 3, 20, 140, 22, 3, 12, 984.20, 5, 'referido', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (503, 36, 13148.00, 0, 17, 118, 20, 6, 6, 8185.29, 7, 'referido', 'desktop', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (504, 50, 4721.53, 34, 9, 108, 20, 0, 7, 6345.64, 0, 'publicidad', 'desktop', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (505, 49, 6843.31, 60, 18, 57, 47, 1, 8, 252.48, 1, 'referido', 'tablet', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (506, 64, 10237.52, 30, 13, 29, 24, 2, 6, 5018.81, 3, 'publicidad', 'desktop', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (507, 39, 9670.32, 9, 23, 100, 49, 1, 9, 194.78, 3, 'organico', 'movil', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (508, 43, 5642.39, 1, 8, 78, 24, 3, 12, 4501.02, 4, 'redes', 'movil', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (509, 59, 12273.79, 0, 14, 174, 1, 5, 9, 1102.53, 0, 'redes', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (510, 59, 11351.06, 43, 16, 34, 16, 2, 12, 613.57, 5, 'referido', 'movil', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (511, 42, 7492.27, 26, 9, 234, 7, 8, 12, 536.18, 7, 'redes', 'desktop', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (512, 70, 8891.34, 5, 3, 39, 39, 4, 10, 4810.65, 4, 'organico', 'desktop', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (513, 47, 2103.60, 6, 5, 105, 9, 8, 9, 876.20, 3, 'referido', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (514, 57, 6110.32, 48, 2, 207, 3, 0, 6, 7638.99, 3, 'referido', 'tablet', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (515, 51, 11860.65, 19, 16, 136, 28, 3, 0, 3744.81, 2, 'organico', 'desktop', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (516, 25, 10815.04, 54, 4, 47, 23, 4, 12, 5243.35, 1, 'referido', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (517, 18, 5681.66, 19, 16, 109, 46, 2, 5, 238.51, 1, 'redes', 'movil', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (518, 23, 1821.19, 28, 16, 215, 21, 5, 4, 2455.42, 6, 'organico', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (519, 32, 1864.93, 21, 18, 18, 33, 2, 3, 5862.27, 4, 'referido', 'tablet', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (520, 70, 3174.79, 12, 10, 80, 47, 3, 11, 775.11, 3, 'referido', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (521, 64, 12070.70, 25, 6, 88, 24, 8, 3, 5888.58, 7, 'organico', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (522, 61, 8914.25, 16, 25, 209, 48, 0, 3, 8214.42, 3, 'referido', 'tablet', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (523, 55, 9849.51, 39, 0, 179, 17, 4, 8, 1795.54, 6, 'publicidad', 'desktop', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (524, 57, 12195.46, 49, 15, 143, 46, 2, 2, 7281.94, 6, 'referido', 'movil', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (525, 43, 7839.25, 10, 11, 170, 45, 6, 3, 4618.36, 6, 'publicidad', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (526, 49, 5623.07, 54, 1, 124, 8, 2, 5, 3681.97, 3, 'organico', 'movil', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (527, 32, 7658.63, 32, 0, 238, 10, 3, 1, 7710.99, 4, 'referido', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (528, 28, 2647.51, 8, 9, 32, 8, 4, 11, 2339.58, 3, 'organico', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (529, 22, 13542.56, 59, 9, 236, 16, 8, 1, 1859.00, 4, 'publicidad', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (530, 44, 12831.94, 42, 24, 195, 7, 1, 2, 3219.92, 3, 'referido', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (531, 22, 2521.64, 38, 17, 36, 48, 5, 12, 4633.56, 6, 'publicidad', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (532, 39, 11075.65, 26, 16, 212, 45, 7, 9, 8394.65, 2, 'redes', 'desktop', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (533, 56, 2871.76, 57, 4, 41, 47, 3, 8, 1342.50, 1, 'publicidad', 'desktop', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (534, 40, 8682.00, 59, 2, 154, 34, 6, 7, 6272.04, 5, 'organico', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (535, 43, 7796.12, 57, 16, 23, 4, 8, 9, 7846.31, 0, 'organico', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (536, 53, 8380.00, 45, 4, 123, 33, 2, 12, 7082.42, 1, 'publicidad', 'tablet', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (537, 70, 6034.46, 55, 5, 154, 39, 8, 9, 8039.56, 7, 'redes', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (538, 26, 3121.21, 0, 21, 234, 11, 6, 12, 4857.07, 1, 'referido', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (539, 65, 8733.28, 31, 2, 143, 2, 1, 3, 766.62, 2, 'organico', 'tablet', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (540, 39, 13293.17, 52, 24, 113, 17, 0, 9, 3136.38, 7, 'organico', 'movil', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (541, 20, 2138.16, 40, 5, 62, 10, 0, 10, 7553.13, 5, 'referido', 'tablet', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (542, 62, 4649.45, 38, 22, 175, 24, 2, 1, 2166.93, 2, 'referido', 'desktop', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (543, 48, 13423.07, 31, 2, 177, 22, 3, 1, 302.38, 4, 'referido', 'movil', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (544, 34, 9881.43, 17, 0, 98, 46, 4, 4, 5200.68, 4, 'redes', 'tablet', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (545, 67, 7184.26, 40, 15, 21, 1, 2, 10, 4545.72, 1, 'publicidad', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (546, 31, 6056.27, 22, 5, 139, 10, 1, 12, 3677.77, 5, 'organico', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (547, 37, 9546.45, 36, 8, 199, 15, 7, 8, 3542.77, 0, 'redes', 'desktop', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (548, 20, 7014.64, 57, 3, 166, 23, 0, 7, 5693.80, 5, 'referido', 'movil', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (549, 58, 4222.93, 39, 20, 66, 31, 6, 10, 4631.68, 2, 'referido', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (550, 49, 8339.86, 13, 6, 30, 22, 8, 2, 4440.34, 5, 'redes', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (551, 70, 5016.99, 10, 3, 188, 12, 8, 11, 2271.03, 2, 'publicidad', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (552, 66, 2952.43, 40, 20, 230, 8, 8, 10, 7513.37, 3, 'referido', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (553, 26, 11339.69, 1, 5, 65, 31, 1, 3, 4772.65, 2, 'redes', 'movil', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (554, 59, 2123.96, 16, 20, 210, 47, 8, 2, 301.91, 0, 'publicidad', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (555, 44, 5410.28, 27, 0, 144, 6, 5, 0, 490.79, 7, 'referido', 'tablet', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (556, 20, 4192.88, 35, 18, 84, 34, 2, 6, 4912.37, 3, 'organico', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (557, 48, 13591.81, 21, 1, 6, 49, 4, 5, 5422.01, 7, 'publicidad', 'tablet', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (558, 69, 12636.17, 27, 24, 67, 41, 0, 11, 7555.34, 0, 'organico', 'tablet', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (559, 64, 6273.73, 60, 23, 185, 3, 6, 5, 4617.75, 1, 'publicidad', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (560, 23, 3493.16, 25, 5, 9, 24, 5, 9, 4768.75, 6, 'publicidad', 'desktop', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (561, 26, 8527.78, 15, 19, 148, 46, 7, 1, 7144.85, 2, 'organico', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (562, 25, 2438.33, 48, 21, 200, 38, 4, 10, 4949.30, 1, 'referido', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (563, 60, 2012.91, 51, 17, 205, 32, 5, 5, 5291.98, 0, 'redes', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (564, 34, 6417.65, 18, 5, 166, 47, 0, 2, 5348.26, 1, 'referido', 'movil', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (565, 38, 11101.95, 37, 6, 11, 17, 4, 11, 7677.78, 1, 'redes', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (566, 19, 7533.84, 24, 24, 55, 20, 7, 12, 599.99, 3, 'referido', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (567, 69, 12232.08, 51, 14, 84, 16, 3, 11, 2609.63, 3, 'referido', 'desktop', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (568, 34, 7274.45, 44, 19, 237, 6, 1, 9, 1561.53, 4, 'publicidad', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (569, 68, 4717.54, 6, 17, 14, 30, 4, 6, 4251.43, 2, 'redes', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (570, 19, 12505.64, 41, 2, 238, 14, 6, 4, 3035.79, 3, 'redes', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (571, 57, 2196.43, 16, 4, 97, 39, 0, 0, 7755.10, 1, 'referido', 'desktop', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (572, 70, 4902.94, 55, 10, 16, 14, 4, 12, 2554.16, 7, 'publicidad', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (573, 42, 3661.06, 32, 18, 129, 24, 6, 9, 6487.04, 3, 'referido', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (574, 53, 3462.58, 35, 11, 178, 36, 8, 2, 3438.02, 0, 'publicidad', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (575, 38, 5066.75, 34, 15, 140, 1, 5, 3, 5153.93, 4, 'publicidad', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (576, 68, 12472.67, 3, 4, 142, 41, 2, 5, 1414.53, 2, 'referido', 'movil', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (577, 39, 7362.34, 32, 3, 223, 24, 1, 4, 782.77, 1, 'organico', 'desktop', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (578, 36, 2248.15, 24, 2, 109, 38, 7, 4, 6202.60, 1, 'referido', 'desktop', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (579, 19, 3143.29, 41, 5, 125, 40, 8, 2, 1098.57, 3, 'redes', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (580, 60, 4578.61, 10, 23, 147, 16, 8, 3, 4217.54, 2, 'publicidad', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (581, 47, 9139.50, 32, 8, 140, 32, 0, 12, 6369.75, 4, 'referido', 'tablet', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (582, 27, 2389.90, 35, 22, 109, 49, 8, 12, 6944.32, 2, 'redes', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (583, 53, 7834.31, 31, 1, 96, 31, 2, 1, 70.50, 2, 'organico', 'desktop', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (584, 62, 11662.41, 53, 24, 137, 1, 4, 3, 2752.82, 2, 'organico', 'desktop', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (585, 64, 4906.01, 25, 10, 59, 42, 7, 2, 4155.17, 7, 'referido', 'desktop', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (586, 52, 4432.79, 46, 2, 18, 28, 2, 9, 8013.94, 2, 'redes', 'desktop', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (587, 42, 12153.65, 21, 24, 219, 23, 0, 11, 3500.76, 6, 'organico', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (588, 55, 6597.11, 47, 10, 221, 42, 1, 11, 414.16, 4, 'referido', 'tablet', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (589, 19, 4903.59, 28, 10, 113, 43, 2, 3, 3944.61, 2, 'publicidad', 'desktop', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (590, 51, 3144.48, 23, 23, 206, 27, 2, 5, 7542.13, 1, 'referido', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (591, 51, 2714.26, 41, 6, 172, 36, 3, 0, 1945.38, 2, 'redes', 'movil', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (592, 46, 12031.93, 2, 14, 148, 2, 1, 10, 3916.19, 7, 'redes', 'movil', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (593, 43, 10020.04, 24, 13, 125, 12, 6, 4, 5543.46, 6, 'organico', 'desktop', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (594, 29, 3947.02, 43, 1, 48, 28, 4, 7, 4513.76, 0, 'publicidad', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (595, 50, 9807.99, 38, 14, 221, 13, 7, 1, 2679.96, 3, 'organico', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (596, 47, 4416.28, 51, 20, 82, 9, 0, 9, 1449.32, 4, 'publicidad', 'tablet', 0, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (597, 58, 13158.29, 0, 12, 11, 35, 7, 0, 2637.67, 5, 'publicidad', 'movil', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (598, 39, 2223.94, 47, 20, 230, 13, 7, 1, 6177.92, 0, 'organico', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (599, 32, 7810.19, 13, 12, 75, 34, 7, 10, 7284.10, 6, 'redes', 'tablet', 1, '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_historicos VALUES (600, 59, 11294.95, 5, 15, 83, 47, 6, 9, 3128.00, 4, 'referido', 'tablet', 1, '2026-11-19 18:26:54.963469-04');


--
-- TOC entry 4842 (class 0 OID 58901)
-- Dependencies: 220
-- Data for Name: clientes_nuevos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.clientes_nuevos VALUES (1, 37, 11466.39, 44, 4, 31, 22, 8, 8, 2536.57, 0, 'redes', 'movil', '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_nuevos VALUES (2, 45, 9773.72, 22, 6, 34, 8, 2, 8, 1933.59, 5, 'organico', 'desktop', '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_nuevos VALUES (3, 46, 2557.44, 5, 14, 230, 30, 6, 9, 7165.25, 1, 'referido', 'desktop', '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_nuevos VALUES (4, 20, 4412.59, 7, 18, 2, 10, 6, 3, 5010.59, 2, 'organico', 'tablet', '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_nuevos VALUES (5, 46, 7192.24, 35, 7, 24, 23, 6, 0, 6429.95, 4, 'redes', 'desktop', '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_nuevos VALUES (6, 46, 2139.61, 34, 12, 157, 13, 1, 12, 8340.17, 4, 'redes', 'movil', '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_nuevos VALUES (7, 53, 2374.55, 24, 21, 67, 42, 3, 11, 6346.86, 1, 'redes', 'tablet', '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_nuevos VALUES (8, 35, 8961.57, 2, 2, 133, 12, 1, 3, 8417.91, 5, 'publicidad', 'desktop', '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_nuevos VALUES (9, 45, 1933.29, 13, 24, 101, 17, 7, 5, 2530.78, 4, 'redes', 'movil', '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_nuevos VALUES (10, 69, 10515.22, 11, 2, 211, 49, 6, 6, 812.52, 1, 'organico', 'movil', '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_nuevos VALUES (11, 49, 11771.85, 41, 21, 11, 2, 7, 1, 5880.71, 4, 'referido', 'movil', '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_nuevos VALUES (12, 49, 9084.72, 13, 13, 201, 25, 3, 1, 2628.55, 6, 'redes', 'desktop', '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_nuevos VALUES (13, 42, 2405.21, 29, 20, 156, 5, 7, 5, 251.79, 5, 'redes', 'movil', '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_nuevos VALUES (14, 23, 10338.23, 19, 4, 145, 39, 4, 12, 1173.88, 6, 'organico', 'movil', '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_nuevos VALUES (15, 31, 9936.39, 55, 4, 101, 15, 4, 6, 5417.83, 3, 'publicidad', 'desktop', '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_nuevos VALUES (16, 19, 9578.94, 8, 8, 113, 16, 3, 5, 6137.79, 0, 'organico', 'movil', '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_nuevos VALUES (17, 53, 8662.38, 18, 16, 236, 29, 2, 10, 5595.99, 0, 'publicidad', 'tablet', '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_nuevos VALUES (18, 18, 9894.22, 50, 18, 115, 27, 3, 3, 4497.98, 0, 'publicidad', 'tablet', '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_nuevos VALUES (19, 20, 2715.43, 42, 9, 204, 24, 8, 0, 3810.42, 5, 'referido', 'tablet', '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_nuevos VALUES (20, 45, 10010.28, 17, 3, 125, 45, 7, 11, 809.29, 3, 'publicidad', 'desktop', '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_nuevos VALUES (21, 45, 5272.82, 26, 3, 237, 26, 7, 8, 6514.38, 2, 'redes', 'tablet', '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_nuevos VALUES (22, 67, 5884.04, 46, 11, 170, 17, 6, 12, 713.93, 1, 'redes', 'tablet', '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_nuevos VALUES (23, 47, 2580.94, 49, 9, 167, 36, 2, 1, 2446.71, 6, 'organico', 'tablet', '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_nuevos VALUES (24, 35, 6651.91, 1, 24, 4, 29, 1, 1, 1039.09, 0, 'organico', 'desktop', '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_nuevos VALUES (25, 49, 1917.57, 41, 2, 219, 41, 4, 5, 2354.48, 5, 'referido', 'tablet', '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_nuevos VALUES (26, 57, 2179.89, 24, 16, 13, 26, 5, 8, 4386.19, 3, 'redes', 'tablet', '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_nuevos VALUES (27, 64, 10960.94, 41, 8, 238, 18, 6, 10, 4077.62, 0, 'publicidad', 'movil', '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_nuevos VALUES (28, 37, 12349.80, 29, 22, 107, 14, 8, 8, 3653.93, 0, 'organico', 'movil', '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_nuevos VALUES (29, 37, 12447.94, 51, 17, 161, 5, 8, 10, 8468.79, 0, 'publicidad', 'tablet', '2026-11-19 18:26:54.963469-04');
INSERT INTO public.clientes_nuevos VALUES (30, 70, 11985.84, 1, 23, 20, 31, 1, 9, 4925.08, 1, 'referido', 'desktop', '2026-11-19 18:26:54.963469-04');


--
-- TOC entry 4844 (class 0 OID 58921)
-- Dependencies: 222
-- Data for Name: predicciones_clientes; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4853 (class 0 OID 0)
-- Dependencies: 217
-- Name: clientes_historicos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.clientes_historicos_id_seq', 600, true);


--
-- TOC entry 4854 (class 0 OID 0)
-- Dependencies: 219
-- Name: clientes_nuevos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.clientes_nuevos_id_seq', 30, true);


--
-- TOC entry 4855 (class 0 OID 0)
-- Dependencies: 221
-- Name: predicciones_clientes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.predicciones_clientes_id_seq', 1, false);


--
-- TOC entry 4685 (class 2606 OID 58899)
-- Name: clientes_historicos clientes_historicos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes_historicos
    ADD CONSTRAINT clientes_historicos_pkey PRIMARY KEY (id);


--
-- TOC entry 4687 (class 2606 OID 58919)
-- Name: clientes_nuevos clientes_nuevos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes_nuevos
    ADD CONSTRAINT clientes_nuevos_pkey PRIMARY KEY (id);


--
-- TOC entry 4690 (class 2606 OID 58931)
-- Name: predicciones_clientes predicciones_clientes_cliente_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.predicciones_clientes
    ADD CONSTRAINT predicciones_clientes_cliente_id_key UNIQUE (cliente_id);


--
-- TOC entry 4692 (class 2606 OID 58929)
-- Name: predicciones_clientes predicciones_clientes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.predicciones_clientes
    ADD CONSTRAINT predicciones_clientes_pkey PRIMARY KEY (id);


--
-- TOC entry 4688 (class 1259 OID 58937)
-- Name: idx_predicciones_fecha; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_predicciones_fecha ON public.predicciones_clientes USING btree (fecha_prediccion);


--
-- TOC entry 4693 (class 2606 OID 58932)
-- Name: predicciones_clientes predicciones_clientes_cliente_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.predicciones_clientes
    ADD CONSTRAINT predicciones_clientes_cliente_id_fkey FOREIGN KEY (cliente_id) REFERENCES public.clientes_nuevos(id);


-- Completed on 2026-11-19 18:30:16

--
-- PostgreSQL database dump complete
--

