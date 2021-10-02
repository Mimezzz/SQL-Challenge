-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE Department (
    dept_no VARCHAR   NOT NULL,
    dept_name VARCHAR   NOT NULL,
    CONSTRAINT pk_Department PRIMARY KEY (
        dept_no
     )
);

CREATE TABLE Dep_Employee (
    emp_no INT   NOT NULL,
    emp_dept_no VARCHAR   NOT NULL,
    CONSTRAINT pk_Dep_Employee PRIMARY KEY (
        emp_no,emp_dept_no
     )
);

CREATE TABLE Dep_Manager (
    man_dept_no VARCHAR   NOT NULL,
    man_emp_no INT   NOT NULL,
    CONSTRAINT pk_Dep_Manager PRIMARY KEY (
        man_dept_no,man_emp_no
     )
);

CREATE TABLE Employee (
    emp_no INT   NOT NULL,
    emp_title_id VARCHAR   NOT NULL,
    birth_date DATE   NOT NULL,
    first_name VARCHAR   NOT NULL,
    last_name VARCHAR   NOT NULL,
    sex VARCHAR   NOT NULL,
    hire_date DATE   NOT NULL,
    CONSTRAINT pk_Employee PRIMARY KEY (
        emp_no
     )
);

CREATE TABLE Salary (
    emp_no INT   NOT NULL,
    salary INT   NOT NULL,
    CONSTRAINT pk_Salary PRIMARY KEY (
        emp_no
     )
);

CREATE TABLE Title (
    title_id VARCHAR   NOT NULL,
    title VARCHAR   NOT NULL,
    CONSTRAINT pk_Title PRIMARY KEY (
        title_id
     )
);

ALTER TABLE Dep_Employee ADD CONSTRAINT fk_Dep_Employee_emp_no FOREIGN KEY(emp_no)
REFERENCES Employee (emp_no);

ALTER TABLE Dep_Employee ADD CONSTRAINT fk_Dep_Employee_emp_dept_no FOREIGN KEY(emp_dept_no)
REFERENCES Department (dept_no);

ALTER TABLE Dep_Manager ADD CONSTRAINT fk_Dep_Manager_man_dept_no FOREIGN KEY(man_dept_no)
REFERENCES Department (dept_no);

ALTER TABLE Dep_Manager ADD CONSTRAINT fk_Dep_Manager_man_emp_no FOREIGN KEY(man_emp_no)
REFERENCES Employee (emp_no);

ALTER TABLE Employee ADD CONSTRAINT fk_Employee_emp_title_id FOREIGN KEY(emp_title_id)
REFERENCES Title (title_id);

ALTER TABLE Salary ADD CONSTRAINT fk_Salary_emp_no FOREIGN KEY(emp_no)
REFERENCES Employee (emp_no);

