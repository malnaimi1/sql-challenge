-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/cfIt15
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

CREATE TABLE "employees" (
    "employees_num" int   NOT NULL,
    "employees_title_id" varchar   NOT NULL,
    "birth_date" varchar   NOT NULL,
    "First_name" varchar   NOT NULL,
    "Last_name" varchar   NOT NULL,
    "sex" varchar   NOT NULL,
    "hire_date" varchar   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "employees_num"
     )
);

CREATE TABLE "departments" (
    "departments_number" int   NOT NULL,
    "departments_name" varchar   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "departments_number"
     )
);

CREATE TABLE "salaries" (
    "Salary" int   NOT NULL,
    "employee_number" varchar   NOT NULL
);

CREATE TABLE "dept_emp" (
    "emp_no" varchar   NOT NULL,
    "dept_no" varchar   NOT NULL
);

CREATE TABLE "dept_manager" (
    "dept_no" varchar   NOT NULL,
    "emp_no" varchar   NOT NULL
);

CREATE TABLE "titles" (
    "title_id" varchar   NOT NULL,
    "title" varchar   NOT NULL
);

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_employees_num" FOREIGN KEY("employees_num")
REFERENCES "dept_emp" ("emp_no");

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_employees_title_id" FOREIGN KEY("employees_title_id")
REFERENCES "titles" ("title_id");

ALTER TABLE "departments" ADD CONSTRAINT "fk_departments_departments_number" FOREIGN KEY("departments_number")
REFERENCES "dept_emp" ("dept_no");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_employee_number" FOREIGN KEY("employee_number")
REFERENCES "dept_emp" ("emp_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("departments_number");

CREATE INDEX "idx_employees_employees_title_id"
ON "employees" ("employees_title_id");

