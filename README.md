# 🎓 School Database – MySQL Academic System

This repository contains a complete SQL script to set up and manage a school database using **MySQL**. The database models a basic academic system including students, courses, subjects, professors, and payment methods.

---

## 🗂️ Project Structure

The script creates and populates the following **tables**:

- **`aluno`**: Stores student details, including GPA and nationality.
- **`curso`**: Stores course information and duration.
- **`disciplina`**: Stores subject data, linked to courses and professors.
- **`professor`**: Stores professor details and teaching area.
- **`tipo_pagamento`**: Stores payment methods accepted by the institution.
- **`aluno_disciplina`**: Links students to subjects and their grades.

In addition, the script includes:

- 📊 **Views** – For reporting and easier data querying  
- ⚙️ **Stored Procedures** – To calculate student age and course duration  
- 🔁 **Trigger** – To automatically update a student's GPA after inserting grades  

---

## ⚙️ Requirements

- **MySQL Server** (version 5.7 or higher recommended)
- A MySQL client, such as:
  - MySQL Workbench
  - phpMyAdmin
  - DBeaver
  - Terminal (`mysql` CLI)

---

## 🚀 Setup Instructions

### 1. Clone the Repository

```bash
git clone https://github.com/FranciscoLemos03/GestaoEscola.git
cd GestaoEscola
```

### 2. Open MySQL

Use your preferred MySQL client and log in:

```bash
mysql -u root -p
```

### 3. Execute the SQL Script

You can execute the script in parts (recommended in GUI clients like MySQL Workbench) or all at once.

**Start by creating the database:**

```sql
CREATE DATABASE dbescola
DEFAULT CHARACTER SET utf8
DEFAULT COLLATE utf8_general_ci;

USE dbescola;
```

**Then:**
- Run the **table creation** commands
- Run the **INSERTs** to populate the data
- Run the **VIEWS**, **STORED PROCEDURES**, and **TRIGGERS** at the end

Or, to run everything via terminal:

```bash
mysql -u root -p < script.sql
```

> ⚠️ Make sure all `DELIMITER` statements are correctly used for procedures and triggers to avoid syntax errors.

---

## 🔍 Features

### 📄 Views

- **`Aluno_por_disciplina`**  
  Lists each student with their respective subjects.

- **`aluno_curso_disciplina_prof`**  
  Lists students with their course, subject, and professor details.

- **`Reprovados` / `Aprovados`**  
  Displays students based on whether their GPA is below or above 10.

- **`aluno_merito`**  
  Shows the top-performing student.

- **`disciplinas_com_numero_alunos`**  
  Displays each subject with the number of students enrolled.

### 🧠 Stored Procedures

- **`calcula_idade(id INT)`**  
  Calculates the age of a student given their ID.

- **`calcula_tempo_curso(id INT)`**  
  Calculates the duration (in years) of a course by ID.

### 🔁 Trigger

- **`media_das_notas`**  
  Automatically updates a student's GPA after new grades are inserted.

---
