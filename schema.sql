CREATE TABLE "departments" (
    "dept_no" varchar(10)   NOT NULL,
    "dept_name" varchar(255)   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "titles" (
    "title_id" varchar(10)   NOT NULL,
    "title" varchar(255)   NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "title_id"
    ),
    CONSTRAINT fk_title
      FOREIGN KEY(emp_title_id) 
		  REFERENCES titles(title_id)
);

CREATE TYPE sex AS ENUM ('M', 'F');
CREATE TABLE "employees" (
	"emp_no" int   NOT NULL,
	"emp_title_id" varchar(10)    NOT NULL,
	"birth_date" date   NOT NULL,
	"first_name" varchar(255)   NOT NULL,
	"last_name" varchar(255)   NOT NULL,
	"sex" sex   NOT NULL,
	"hire_date" date   NOT NULL,
	CONSTRAINT "pk_employees" PRIMARY KEY (
       "emp_no"
     )
);
CREATE TABLE "dept_emp" (
    "emp_no" int NOT NULL,
    "dept_no" varchar(10) NOT NULL,
	CONSTRAINT "pk_dept_emp" PRIMARY KEY (
       "emp_no",
		dept_no
    ),
	CONSTRAINT fk_employees
      FOREIGN KEY(emp_no) 
		  REFERENCES employees(emp_no),
	CONSTRAINT fk_dept
      FOREIGN KEY(dept_no) 
		  REFERENCES departments(dept_no)
);

CREATE TABLE "dept_manager" (
	"dept_no" varchar(10) NOT NULL,
	"emp_no" int NOT NULL,
	CONSTRAINT "pk_dept_mgr" PRIMARY KEY (
       "emp_no",
		dept_no
    ),
	CONSTRAINT fk_employees
      FOREIGN KEY(emp_no) 
		  REFERENCES employees(emp_no),
	CONSTRAINT fk_dept
      FOREIGN KEY(dept_no) 
		  REFERENCES departments(dept_no)
);



CREATE TABLE "salaries" (
	"emp_no" int NOT NULL,
	"salary" int  NOT NULL,
	CONSTRAINT "pk_salaries" PRIMARY KEY (
       "emp_no"
    ),
	CONSTRAINT fk_employees
      FOREIGN KEY(emp_no) 
		  REFERENCES employees(emp_no)
);
