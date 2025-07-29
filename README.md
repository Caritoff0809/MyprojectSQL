# 🎬 DataProject - Consultas de SQL 

Este proyecto contiene el desarrollo completo de **64 consultas SQL** aplicadas sobre una base de datos estilo *Sakila* usando PostgreSQL. Las consultas cubren desde búsquedas simples hasta análisis avanzados con estadísticas, joins complejos, subconsultas, vistas y más.
---

## 📁 Estructura del Proyecto

- `BBDD_Proyecto.sql`: Script para crear las tablas, relaciones y restricciones de la base de datos.
- `consultas.sql`: Archivo con las 64 consultas SQL comentadas y organizadas.
- `esquema.png`: Diagrama Entidad-Relación (ERD) para visualizar la estructura de la BBDD.
- `README.md`: Este documento con toda la documentación del proyecto.

---

## 🛠️ Requisitos

- PostgreSQL (v12 o superior)
- Cliente SQL (como `psql`, DBeaver, pgAdmin, etc.)
- Git (opcional, para clonar el repositorio)

---

## 🚀 Cómo ejecutar el proyecto

1. Clona el repositorio:
   ```bash
   git clone https://github.com/Caritoff0809/MyprojectSQL.git
   cd DataProject-SQL
   ```

2. Carga el archivo `.sql` en PostgreSQL:
   ```bash
   MyprojetSQL
   ```

3. Explora las consultas:
   - Abre `consultas.sql` en tu editor favorito.
   - O ejecútalo directamente:
     ```bash
     MyprojectSql
     ```
---

## 🧩 Estructura de la Base de Datos

La base de datos contiene tablas como:

- `film` 🎬: Películas disponibles
- `actor` 🎭: Información de actores
- `category` 🗂️: Categorías (géneros)
- `film_actor`, `film_category`: Tablas relacionales
- `inventory`, `rental`, `payment`: Inventario, alquileres y pagos
- `customer`: Clientes registrados

🔍 Consulta el archivo `esquema.png` para ver el diagrama completo.

---

## 📊 Consultas SQL realizadas

Las consultas se agrupan en tres bloques lógicos:

- 🔹 **Consultas básicas**  
  Filtrados por texto, rangos, clasificaciones, duración, etc.

- 🔸 **Consultas intermedias**  
  Joins entre múltiples tablas, agrupamientos por categoría o cliente, operaciones estadísticas.

- 🔺 **Consultas avanzadas**  
  Vistas, subconsultas correlacionadas, tablas temporales, clientes frecuentes, análisis de pagos.

👉 Todas las consultas están en el enlace https://github.com/Caritoff0809/MyprojectSQL.git, comentadas y listas para ejecutarse.

---

## ✍️ Autor
CAROLINA FERNANDEZ
---
