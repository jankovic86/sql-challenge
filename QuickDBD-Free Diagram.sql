-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/DrWacf
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Create table for Titles.

CREATE TABLE "titles" (
    "title_id" VARCHAR(10)   NOT NULL,
    "title" VARCHAR(20)   NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "title_id"
     )
);

-- Create table for Departments.
CREATE TABLE "departments" (
    "dept_no" VARCHAR(10)   NOT NULL,
    "dept_name" VARCHAR(30)   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"
     )
);

-- Create table for Department Employees.
CREATE TABLE "dept_empl" (
    "emp_no" INT   NULL,
    "dept_no" VARCHAR(10)   NOT NULL
);

-- Create table for Department Managers.
CREATE TABLE "dept_managers" (
    "dept_no" VARCHAR(10)   NOT NULL,
    "emp_no" INT   NULL
);

-- Create table for Employees.
CREATE TABLE "employees" (
    "emp_no" INT   NULL,
    "emp_title_id" VARCHAR(10)   NOT NULL,
    "birth_date" DATE   NULL,
    "first_name" VARCHAR(30)   NOT NULL,
    "last_name" VARCHAR(30)   NOT NULL,
    "sex" VARCHAR(5)   NOT NULL,
    "hire_date" DATE   NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no"
     )
);

-- Create table for Salaries.
CREATE TABLE "salaries" (
    "emp_no" INT   NULL,
    "salary" INT   NULL
);

ALTER TABLE "dept_empl" ADD CONSTRAINT "fk_dept_empl_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_empl" ADD CONSTRAINT "fk_dept_empl_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_managers" ADD CONSTRAINT "fk_dept_managers_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_managers" ADD CONSTRAINT "fk_dept_managers_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_title_id" FOREIGN KEY("emp_title_id")
REFERENCES "titles" ("title_id");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

