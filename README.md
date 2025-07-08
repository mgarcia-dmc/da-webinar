# Webinar: Arquitectura de Datos Moderna en la Práctica

Este repositorio contiene los recursos y el guion para el ejercicio práctico del webinar "Arquitectura de Datos Moderna en la Práctica".

## Descripción del Ejercicio

En este laboratorio práctico de 40 minutos, construiremos una solución de arquitectura de datos de extremo a extremo (end-to-end) en la nube. El objetivo es simular un caso de negocio real donde se ingieren datos crudos, se procesan y se transforman en insights de valor listos para ser consumidos por el negocio.

### Escenario de Negocio

Trabajaremos con el caso de "Retail Andino", una empresa de retail ficticia que necesita analizar los datos de ventas de sus tiendas para entender qué productos y regiones tienen mejor rendimiento.

**Fuente de datos:** Un archivo de transacciones (`ventas.csv`) que simula la data extraída de los sistemas de punto de venta (POS).

### Arquitectura a Implementar

Implementaremos una arquitectura de datos moderna y simplificada utilizando servicios de la nube. 

## Requisitos Previos

Para poder seguir el ejercicio en tiempo real, asegúrate de tener lo siguiente:

1.  **Suscripción a Microsoft Azure:** Necesitarás una cuenta activa. Puedes utilizar el nivel gratuito (`Free Tier`).
2.  **Software Local:**
      * [Power BI Desktop](https://powerbi.microsoft.com/es-es/downloads/) instalado en tu máquina.
3.  **Datos de Muestra:**
      * Descarga el archivo `ventas.csv` que se encuentra en la carpeta `data` de este repositorio.

## Pasos del Ejercicio

Sigue estos pasos para construir la solución de arquitectura de datos.

### 1\. Configuración del Entorno (Setup)

  - **Crea un Grupo de Recursos** en Azure para mantener todos los servicios organizados.
  - **Crea los Servicios Necesarios:**
      - Una cuenta de **Azure Storage** (con funcionalidad de Data Lake Gen2).
      - Un espacio de trabajo de **Azure Data Factory**.
      - Un espacio de trabajo de **Azure Synapse Analytics**.
  - **Sube el archivo `ventas.csv`** a un contenedor en tu cuenta de Azure Storage.

### 2\. Ingesta de Datos con Data Factory

En esta etapa, moveremos los datos desde su origen hasta nuestro Data Lake.

  - Abre **Azure Data Factory** y crea un nuevo Pipeline.
  - Utiliza la actividad `Copy data` para configurar el flujo:
      - **Origen (Source):** El archivo `ventas.csv` en tu cuenta de almacenamiento.
      - **Destino (Sink):** Una nueva carpeta (`/raw/`) dentro de tu Data Lake.
  - Ejecuta el pipeline y verifica que el archivo se haya copiado correctamente.

### 3\. Almacenamiento y Exploración en el Data Lake

Nuestro Data Lake servirá como el repositorio central para los datos en su formato crudo.

  - Navega a tu cuenta de **Azure Storage** y confirma que el archivo `ventas.csv` se encuentra en la carpeta `/raw/`.
  - **Explora** el contenido del archivo directamente desde el portal de Azure para validar su integridad.

### 4\. Transformación y Análisis con Synapse Analytics

Ahora, convertiremos los datos crudos en información útil usando SQL.

  - Abre tu espacio de trabajo de **Azure Synapse Analytics**.
  - Crea un nuevo **SQL Script**.
  - Utiliza la función `OPENROWSET` para leer el archivo `ventas.csv` directamente desde el Data Lake sin necesidad de moverlo.
  - Escribe una consulta SQL para agregar los datos (ej. `SUM(Ventas) GROUP BY Region, Categoria`).
  - Guarda esta consulta como una vista (`VIEW`) para que Power BI pueda consumirla fácilmente.

### 5\. Visualización con Power BI

Finalmente, conectaremos una herramienta de Business Intelligence para visualizar los resultados.

  - Abre **Power BI Desktop**.
  - Selecciona **"Obtener datos"** y conéctate a tu espacio de trabajo de **Azure Synapse Analytics**.
  - Importa los datos desde la vista que creaste en el paso anterior.
  - **Crea un reporte visual** (ej. un gráfico de barras) que muestre las ventas totales por región y categoría de producto.

## Resultado Final

Al completar este ejercicio, habrás construido un pipeline de datos funcional que demuestra los principios de una arquitectura moderna, transformando datos crudos en un reporte interactivo que genera valor para el negocio.
