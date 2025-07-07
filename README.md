EMR SQL Database Project
This project represents a simplified Electronic Medical Records (EMR) system modeled using SQL. It includes core entities such as patients, clinical visits, and diagnoses. The database is normalized up to 3NF and enforces referential integrity using primary and foreign key relationships.

📦 Project Structure
- `schema.sql` – SQL script to create tables: `patients`, `visits`, and `diagnoses`.
- `sample_data.sql` – Sample data inserts (20 records per table) for testing.
- `er_diagram.png` – Graphical ER diagram showing table relationships.
  
 ⚙️ Setup Instructions

1. Create a PostgreSQL database (e.g., `emr_db`).
2. Open your SQL tool (e.g., DBeaver, pgAdmin).
3. Run `schema.sql` to create the tables.
4. Run `sample_data.sql` to populate the database.
5. Use `er_diagram.png` to visualize relationships between tables.

📌 Assumptions
- The project uses PostgreSQL as the database system.
- All IDs are integers (manually assigned or SERIAL).
- Data is intentionally simplified for educational/demo purposes.

❗ Challenges
- Ensuring strict normalization up to 3NF while keeping the model easy to understand.
- Creating meaningful and unique sample data for realistic testing.

📄 License
This project is provided for educational and testing purposes.
