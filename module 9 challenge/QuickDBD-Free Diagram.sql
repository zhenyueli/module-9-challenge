-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/avG8Ok
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "EMP" (
    "emp_num" int   NOT NULL,
    "emp_id" varchar   NOT NULL,
    "b_day" date   NOT NULL,
    "f_name" varchar   NOT NULL,
    "l_name" varchar   NOT NULL,
    "sex" varchar   NOT NULL,
    "h_date" date   NOT NULL,
    CONSTRAINT "pk_EMP" PRIMARY KEY (
        "emp_num"
     )
);

CREATE TABLE "Salaries" (
    "emp_num" int   NOT NULL,
    "salary" int   NOT NULL,
    CONSTRAINT "pk_Salaries" PRIMARY KEY (
        "emp_num"
     )
);

CREATE TABLE "Dept_emp" (
    "emp_num" int   NOT NULL,
    "dept_num" varchar   NOT NULL,
    CONSTRAINT "pk_Dept_emp" PRIMARY KEY (
        "emp_num"
     )
);

CREATE TABLE "Departments" (
    "dept_num" varchar   NOT NULL,
    "dept_name" varchar   NOT NULL
);

CREATE TABLE "Titles" (
    "title_id" varchar   NOT NULL,
    "title" varchar   NOT NULL
);

CREATE TABLE "Dept_manager" (
    "dept_num" varchar   NOT NULL,
    "emp_num" varchar   NOT NULL,
    CONSTRAINT "pk_Dept_manager" PRIMARY KEY (
        "emp_num"
     )
);

ALTER TABLE "EMP" ADD CONSTRAINT "fk_EMP_emp_num" FOREIGN KEY("emp_num")
REFERENCES "Dept_manager" ("emp_num");

ALTER TABLE "Salaries" ADD CONSTRAINT "fk_Salaries_emp_num" FOREIGN KEY("emp_num")
REFERENCES "Dept_emp" ("emp_num");

ALTER TABLE "Dept_emp" ADD CONSTRAINT "fk_Dept_emp_emp_num" FOREIGN KEY("emp_num")
REFERENCES "EMP" ("emp_num");

ALTER TABLE "Dept_emp" ADD CONSTRAINT "fk_Dept_emp_dept_num" FOREIGN KEY("dept_num")
REFERENCES "Departments" ("dept_num");

ALTER TABLE "Titles" ADD CONSTRAINT "fk_Titles_title_id" FOREIGN KEY("title_id")
REFERENCES "EMP" ("emp_id");

ALTER TABLE "Dept_manager" ADD CONSTRAINT "fk_Dept_manager_dept_num" FOREIGN KEY("dept_num")
REFERENCES "Departments" ("dept_num");

