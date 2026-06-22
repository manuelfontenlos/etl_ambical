# Plataforma de análisis de preferencias alimentarias — ETL

Código fuente del flujo ETL desarrollado como parte del TFM del Máster en Análisis y Visualización de Datos Masivos (UNIR).

## Descripción

Pipeline de integración de datos en **Apache Hop** que unifica tres fuentes heterogéneas:
- Registros de valoraciones sensoriales de consumidores (CSV)
- Información de muestras y proyectos (CSV/XML)
- Datos nutricionales de **OpenFoodFacts** (volcado JSONL)

El resultado es un **modelo dimensional en estrella** sobre PostgreSQL, diseñado para su explotación mediante el cuadro de mando Power BI incluido en `/powerbi/`.

## Requisitos

| Componente | Versión mínima |
|---|---|
| Apache Hop | 2.9.0 |
| PostgreSQL | 14 |
| Power BI Desktop | Mayo 2024 |

## Estructura

```
etl_ambical/
├── pipelines/          # Pipelines (.hpl) y workflows (.hwf) de Apache Hop
├── configuracion/      # Variables de entorno (editar con tus credenciales)
├── metadata/rdbms/     # Definiciones de conexiones a base de datos
├── data/synthetic/     # Datos de prueba sintéticos (estructura idéntica a los reales)
└── README.md
```

## Configuración

1. Copia `configuracion/configuracion_datamart.json` y sustituye `CHANGE_ME` por tu contraseña de PostgreSQL.
2. Haz lo mismo con `configuracion/configuracion_staging.json`.
3. Crea las bases de datos `datamart_ambical` y `staging_ambical` en PostgreSQL.
4. Apunta las rutas de los ficheros de entrada a `data/synthetic/` (o a tus datos reales).

## Ejecución

```bash
hop-run.sh -r local -j pipelines/carga_todo.hwf
```

## Nota sobre los datos

Los datos reales cedidos por AMBICAL no se incluyen en este repositorio por razones de confidencialidad comercial, conforme al apartado 2.8 de las instrucciones para la elaboración del TFE de la UNIR. La carpeta `data/synthetic/` contiene ficheros de muestra con la misma estructura que los datos reales pero con valores inventados, suficientes para verificar el funcionamiento del ETL.
