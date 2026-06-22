# Diccionario de datos — Datamart AMBICAL

Descripción de las tablas y columnas del modelo dimensional implementado en PostgreSQL.
Esquema: `public`. Base de datos: `datamart_ambical`.

---

## Tabla de hechos principal

### `fact_valoracion`
Tabla central del modelo estrella. Cada fila representa una valoración de un catador sobre una muestra para un atributo concreto dentro de un proyecto.

| Columna | Tipo | Descripción |
|---|---|---|
| `id_valoracion_sk` | bigint PK | Clave surrogada de la valoración |
| `id_catador_sk` | integer FK | Referencia a `dim_catador` |
| `id_muestra_sk` | integer FK | Referencia a `dim_muestra` |
| `id_atributo_sk` | integer FK | Referencia a `dim_atributo` |
| `id_proyecto_sk` | integer FK | Referencia a `dim_proyecto` |
| `fecha` | date | Fecha de realización de la cata |
| `valor` | real | Puntuación original en la escala del proyecto |
| `valor_normalizado` | real | Puntuación normalizada al rango [0, 10] para comparabilidad entre proyectos |
| `comentario` | text | Observación libre del catador (puede ser nulo) |

---

### `fact_consumo_marcas`
Registra los hábitos de consumo declarados por los catadores: qué marcas consumen habitualmente y dónde las compran.

| Columna | Tipo | Descripción |
|---|---|---|
| `id_consumomarca_sk` | integer PK | Clave surrogada |
| `id_catador_sk` | integer FK | Referencia a `dim_catador` |
| `id_proyecto_sk` | integer FK | Referencia a `dim_proyecto` |
| `id_catador_nk` | varchar(40) | Identificador natural del catador |
| `id_proyecto_nk` | integer | Identificador natural del proyecto |
| `marca` | varchar(100) | Nombre de la marca consumida habitualmente |
| `supermercado` | varchar(50) | Canal de compra habitual |
| `tipo_marca` | varchar(40) | Clasificación de la marca (blanca, fabricante, etc.) |

---

### `fact_escala_atributo`
Define el rango de valoración válido para cada atributo dentro de cada proyecto, necesario para la normalización de `valor_normalizado` en `fact_valoracion`.

| Columna | Tipo | Descripción |
|---|---|---|
| `id_proyecto_sk` | integer PK/FK | Referencia a `dim_proyecto` |
| `id_atributo_sk` | integer PK/FK | Referencia a `dim_atributo` |
| `valor_min` | real | Valor mínimo de la escala en este proyecto |
| `valor_max` | real | Valor máximo de la escala en este proyecto |

---

## Dimensiones

### `dim_catador`
Perfil sociodemográfico del catador. Los campos identificativos (DNI, fecha de nacimiento completa) no se almacenan; solo se cargan las variables analíticamente relevantes.

| Columna | Tipo | Descripción |
|---|---|---|
| `id_catador_sk` | integer PK | Clave surrogada |
| `id_catador_nk` | varchar(20) | Identificador natural (no identificativo, generado por el sistema fuente) |
| `perfil` | varchar(100) | Perfil sociolaboral normalizado (Empleado, Estudiante, Jubilado, etc.) |
| `fecha_nacimiento` | date | Fecha de nacimiento — solo se usa para calcular el tramo de edad; no se expone en informes |
| `sexo` | varchar(10) | Sexo del catador (H / M) |

---

### `dim_muestra`
Cada muestra es un producto físico evaluado en uno o varios proyectos. Integra la información del sistema de gestión de catas con los datos nutricionales de OpenFoodFacts.

| Columna | Tipo | Descripción |
|---|---|---|
| `id_muestra_sk` | integer PK | Clave surrogada |
| `id_muestra_nk` | integer | Identificador natural del sistema de catas |
| `id_marca_sk` | integer FK | Referencia a `dim_marca` |
| `id_proyecto_sk` | integer FK | Referencia a `dim_proyecto` |
| `nombre_producto` | varchar(255) | Nombre descriptivo del producto |
| `codigo_cliente` | varchar(100) | Código interno del cliente que encargó el estudio |
| `ean` | varchar(50) | Código EAN/GTIN del producto, usado para cruzar con OpenFoodFacts |
| `fabricante` | varchar(100) | Nombre del fabricante |
| `formato` | varchar(100) | Presentación o gramaje del producto |
| `fecha_caducidad` | date | Fecha de caducidad del lote evaluado |
| `url_foto` | text | URL de la imagen del producto |
| `orden` | integer | Orden de presentación en la cata |
| `n_aditivos` | integer | Número de aditivos presentes (calculado desde OpenFoodFacts) |
| `nutriscore` | varchar(20) | Categoría Nutri-Score (A, B, C, D, E o UNKNOWN) |

---

### `dim_marca`
Catálogo de marcas. En la capa de presentación de Power BI, los nombres reales se sustituyen por pseudónimos mediante una columna calculada DAX.

| Columna | Tipo | Descripción |
|---|---|---|
| `id_marca_sk` | integer PK | Clave surrogada — usada para generar el pseudónimo en Power BI |
| `nombre_marca` | varchar(100) | Nombre comercial real de la marca |

---

### `dim_proyecto`
Cada proyecto corresponde a un estudio sensorial encargado por un cliente de AMBICAL.

| Columna | Tipo | Descripción |
|---|---|---|
| `id_proyecto_sk` | integer PK | Clave surrogada |
| `id_proyecto_nk` | integer | Identificador natural del sistema de catas |
| `tipo` | varchar(100) | Tipo de estudio (cata ciega, comparativa, etc.) |
| `descripcion` | varchar(300) | Descripción del proyecto |
| `familia` | varchar(100) | Familia de producto analizada (Lácteos, Cárnicos, etc.) |

---

### `dim_atributo`
Atributos evaluados en las catas (valoración global, textura, sabor, aroma, etc.).

| Columna | Tipo | Descripción |
|---|---|---|
| `id_atributo_sk` | integer PK | Clave surrogada |
| `nombre_atributo` | varchar(150) | Nombre del atributo evaluado |
| `jar` | boolean | Indica si el atributo usa escala JAR (Just About Right) |

---

## Tablas de atributos multivalor

Almacenan atributos de producto con cardinalidad variable que no pueden modelarse como columnas fijas en `dim_muestra`.

### `dim_ingrediente`
| Columna | Tipo | Descripción |
|---|---|---|
| `id_ingrediente_sk` | integer PK | Clave surrogada |
| `id_muestra_sk` | integer FK | Referencia a `dim_muestra` |
| `nombre` | varchar(500) | Nombre del ingrediente según OpenFoodFacts |
| `porcentaje` | real | Porcentaje estimado en el producto (puede ser nulo) |

### `aditivo_muestra`
| Columna | Tipo | Descripción |
|---|---|---|
| `id_aditivo_sk` | integer PK | Clave surrogada |
| `id_muestra_sk` | integer FK | Referencia a `dim_muestra` |
| `nombre_aditivo` | varchar(100) | Código E del aditivo (e.g., E330, E322) |

### `dim_nutriente`
| Columna | Tipo | Descripción |
|---|---|---|
| `id_nutriente_sk` | integer PK | Clave surrogada |
| `id_muestra_sk` | integer FK | Referencia a `dim_muestra` |
| `nombre` | varchar(100) | Nombre del nutriente (e.g., energía, grasas, proteínas) |
| `cantidad_por100g` | real | Cantidad por 100 g de producto |
| `unidad` | varchar(50) | Unidad de medida (kcal, g, mg, etc.) |

### `dim_categoria`
| Columna | Tipo | Descripción |
|---|---|---|
| `id_categoria_sk` | integer PK | Clave surrogada |
| `id_muestra_sk` | integer FK | Referencia a `dim_muestra` |
| `categoria` | varchar(250) | Etiqueta de categoría OpenFoodFacts (e.g., en:dairy, en:cheeses) |

---

## Tabla auxiliar

### `analisis_estadistico`
Tabla precalculada con los resultados del análisis estadístico intraproyecto: comparaciones entre muestras, tests de normalidad, letras de diferencia significativa y conclusiones automáticas. Es la base de la página **Análisis Proyecto** del cuadro de mando.

| Columna | Tipo | Descripción |
|---|---|---|
| `id_proyecto_nk` | bigint | Identificador del proyecto |
| `nombre_producto` | text | Nombre del producto evaluado |
| `atributo` | text | Atributo analizado |
| `id_muestra_sk` | bigint FK | Referencia a `dim_muestra` |
| `n` | bigint | Tamaño muestral |
| `media` | double | Media de la valoración |
| `desv_std` | double | Desviación estándar |
| `pct_gusta` / `pct_medio` / `pct_disgusta` | double | Distribución de respuestas por zona de escala |
| `chi_stat` | double | Estadístico chi-cuadrado |
| `p_normalidad` | double | p-valor del test de normalidad |
| `normal` | double | Indicador de distribución normal (1/0) |
| `test_aplicado` | text | Test estadístico utilizado (paramétrico/no paramétrico) |
| `p_valor_test` | double | p-valor del test de comparación entre muestras |
| `resultado_binomial` | text | Resultado del test binomial sobre reconsumo |
| `letra` | text | Letra de diferencia significativa (notación compacta) |
| `es_binario` | bigint | Indica si el atributo es binario (Sí/No) |
| `nombre_marca` | text | Nombre de la marca asociada |
| `conclusion` | text | Conclusión automática generada por el sistema |
