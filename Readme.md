# RetailPro — Análisis de Ventas y Comportamiento de Clientes

RetailPro es una solución integral de análisis de datos diseñada para evaluar el rendimiento comercial, la regionalización de las transacciones y los patrones de consumo de los clientes para optimizar la toma de decisiones estratégicas.

## 🛠️ Herramientas y Ecosistema Tecnológico
* **Almacenamiento y Modelado:** Microsoft SQL Server (Transact-SQL)
* **Visualización y Business Intelligence:** Power BI (Modelado de datos y paneles interactivos)
* **Control de Versiones y Documentación:** GitHub

## 📁 Estructura del Repositorio
El proyecto se organiza de manera modular para garantizar su escalabilidad:
* `/sql/01_database_schema.sql` — Creación de la estructura de tablas relacionales.
* `/sql/02_analysis_queries.sql` — Consultas analíticas (Core Query con INNER JOIN de 4 tablas).
* `/dashboards/RetailPro_Report.pbix` — Archivo original de Power BI con los dashboards de ventas.

## 🚀 Instrucciones de Ejecución (Paso a Paso)

Para replicar el entorno de análisis localmente, siga estas instrucciones:

### 1. Despliegue de la Base de Datos (SQL Server)
1. Conéctese a su instancia de SQL Server utilizando SSMS o Azure Data Studio.
2. Abra y ejecute el archivo `01_database_schema.sql` para construir el esquema. *Nota: Este script utiliza la directiva `GO` para procesar de forma segura la creación por lotes.*
3. Ejecute la consulta analítica principal en `02_analysis_queries.sql`. Este script consolida las tablas de Ventas, Clientes, Productos y Categorías, calculando al vuelo la métrica clave de negocio: `total_venta = cantidad * precio_unitario`.

### 2. Conexión del Tablero (Power BI)
1. Descargue y abra el archivo `/dashboards/RetailPro_Report.pbix` en Power BI Desktop.
2. Actualice las credenciales de origen de datos para apuntar a su servidor local de SQL Server.
3. Explore las métricas avanzadas de comportamiento de clientes y ventas regionales distribuidas en los paneles interactivos.
