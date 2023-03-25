--
-- PostgreSQL database dump
--

-- Dumped from database version 14.6 (Ubuntu 14.6-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.6 (Ubuntu 14.6-0ubuntu0.22.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: academic; Type: SCHEMA; Schema: -; Owner: kampus
--

CREATE SCHEMA academic;


ALTER SCHEMA academic OWNER TO kampus;

--
-- Name: calender; Type: SCHEMA; Schema: -; Owner: kampus
--

CREATE SCHEMA calender;


ALTER SCHEMA calender OWNER TO kampus;

--
-- Name: course; Type: SCHEMA; Schema: -; Owner: kampus
--

CREATE SCHEMA course;


ALTER SCHEMA course OWNER TO kampus;

--
-- Name: curriculum; Type: SCHEMA; Schema: -; Owner: kampus
--

CREATE SCHEMA curriculum;


ALTER SCHEMA curriculum OWNER TO kampus;

--
-- Name: department; Type: SCHEMA; Schema: -; Owner: kampus
--

CREATE SCHEMA department;


ALTER SCHEMA department OWNER TO kampus;

--
-- Name: employee; Type: SCHEMA; Schema: -; Owner: kampus
--

CREATE SCHEMA employee;


ALTER SCHEMA employee OWNER TO kampus;

--
-- Name: grade; Type: SCHEMA; Schema: -; Owner: kampus
--

CREATE SCHEMA grade;


ALTER SCHEMA grade OWNER TO kampus;

--
-- Name: person; Type: SCHEMA; Schema: -; Owner: kampus
--

CREATE SCHEMA person;


ALTER SCHEMA person OWNER TO kampus;

--
-- Name: program; Type: SCHEMA; Schema: -; Owner: kampus
--

CREATE SCHEMA program;


ALTER SCHEMA program OWNER TO kampus;

--
-- Name: resume; Type: SCHEMA; Schema: -; Owner: kampus
--

CREATE SCHEMA resume;


ALTER SCHEMA resume OWNER TO kampus;

--
-- Name: student; Type: SCHEMA; Schema: -; Owner: kampus
--

CREATE SCHEMA student;


ALTER SCHEMA student OWNER TO kampus;

--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: academic_title; Type: TABLE; Schema: academic; Owner: kampus
--

CREATE TABLE academic.academic_title (
    academic_title_id smallint NOT NULL,
    title_uz character varying(99),
    title_en character varying(99),
    title_ru character varying(99)
);


ALTER TABLE academic.academic_title OWNER TO kampus;

--
-- Name: academics; Type: TABLE; Schema: academic; Owner: kampus
--

CREATE TABLE academic.academics (
    employee_id smallint NOT NULL,
    academic_title_id smallint
);


ALTER TABLE academic.academics OWNER TO kampus;

--
-- Name: academic_semester; Type: TABLE; Schema: calender; Owner: kampus
--

CREATE TABLE calender.academic_semester (
    semester_id smallint,
    semester_name_us character varying(99) DEFAULT NULL::character varying,
    emester_name_en character varying(99),
    semester_name_ru character varying(99)
);


ALTER TABLE calender.academic_semester OWNER TO kampus;

--
-- Name: academic_years; Type: TABLE; Schema: calender; Owner: kampus
--

CREATE TABLE calender.academic_years (
    academic_year_id smallint,
    academic_year character varying(99)
);


ALTER TABLE calender.academic_years OWNER TO kampus;

--
-- Name: courses; Type: TABLE; Schema: course; Owner: kampus
--

CREATE TABLE course.courses (
    course_code character varying(99),
    department_id smallint,
    name_uz character varying(99),
    name_en character varying(99),
    name_ru character varying(99),
    theory smallint,
    practice smallint,
    lab smallint,
    theory_total smallint,
    practice_total smallint,
    lab_total smallint,
    credits smallint,
    key integer
);


ALTER TABLE course.courses OWNER TO kampus;

--
-- Name: curriculum_elective_groups; Type: TABLE; Schema: curriculum; Owner: kampus
--

CREATE TABLE curriculum.curriculum_elective_groups (
    key smallint,
    elective_group_id smallint,
    curriculum_id smallint,
    semester_id smallint,
    credits smallint
);


ALTER TABLE curriculum.curriculum_elective_groups OWNER TO kampus;

--
-- Name: curriculum_mandatory_courses; Type: TABLE; Schema: curriculum; Owner: kampus
--

CREATE TABLE curriculum.curriculum_mandatory_courses (
    key integer,
    curriculum_id smallint,
    course_code character varying(99),
    semester_id smallint
);


ALTER TABLE curriculum.curriculum_mandatory_courses OWNER TO kampus;

--
-- Name: curriculums; Type: TABLE; Schema: curriculum; Owner: kampus
--

CREATE TABLE curriculum.curriculums (
    curriculum_id smallint,
    program_id smallint,
    academic_year smallint
);


ALTER TABLE curriculum.curriculums OWNER TO kampus;

--
-- Name: elective_courses; Type: TABLE; Schema: curriculum; Owner: kampus
--

CREATE TABLE curriculum.elective_courses (
    key smallint,
    elective_group_id smallint,
    course_code character varying(99)
);


ALTER TABLE curriculum.elective_courses OWNER TO kampus;

--
-- Name: elective_group; Type: TABLE; Schema: curriculum; Owner: kampus
--

CREATE TABLE curriculum.elective_group (
    elective_group_id smallint,
    name_uz character varying(99),
    name_en character varying(99),
    name_ru character varying(99)
);


ALTER TABLE curriculum.elective_group OWNER TO kampus;

--
-- Name: departments; Type: TABLE; Schema: department; Owner: kampus
--

CREATE TABLE department.departments (
    department_id smallint NOT NULL,
    faculty_id smallint,
    name_uz character varying(99),
    name_en character varying(99),
    name_ru character varying(99)
);


ALTER TABLE department.departments OWNER TO kampus;

--
-- Name: employee_title; Type: TABLE; Schema: employee; Owner: kampus
--

CREATE TABLE employee.employee_title (
    title_id smallint NOT NULL,
    title_name_uz character varying(99),
    title_name_en character varying(99),
    title_name_ru character varying(99)
);


ALTER TABLE employee.employee_title OWNER TO kampus;

--
-- Name: employees; Type: TABLE; Schema: employee; Owner: kampus
--

CREATE TABLE employee.employees (
    employee_id integer,
    department_id smallint,
    employee_title smallint,
    person_id integer NOT NULL
);


ALTER TABLE employee.employees OWNER TO kampus;

--
-- Name: people; Type: TABLE; Schema: person; Owner: kampus
--

CREATE TABLE person.people (
    person_id integer NOT NULL,
    jshshir character varying(14),
    name_uz character varying(99),
    name_en character varying(99),
    name_ru character varying(99),
    surname_uz character varying(99),
    surname_en character varying(99),
    surname_ru character varying(99)
);


ALTER TABLE person.people OWNER TO kampus;

--
-- Name: programs; Type: TABLE; Schema: program; Owner: kampus
--

CREATE TABLE program.programs (
    code smallint,
    department smallint,
    name_uz character varying(99),
    name_en character varying(99),
    name_ru character varying(99)
);


ALTER TABLE program.programs OWNER TO kampus;

--
-- Name: student_department; Type: TABLE; Schema: student; Owner: kampus
--

CREATE TABLE student.student_department (
    student_id integer,
    department_id smallint,
    program_id smallint,
    curriculum_id smallint
);


ALTER TABLE student.student_department OWNER TO kampus;

--
-- Name: students; Type: TABLE; Schema: student; Owner: kampus
--

CREATE TABLE student.students (
    person_id integer,
    student_id integer
);


ALTER TABLE student.students OWNER TO kampus;

--
-- Data for Name: academic_title; Type: TABLE DATA; Schema: academic; Owner: kampus
--

COPY academic.academic_title (academic_title_id, title_uz, title_en, title_ru) FROM stdin;
\.


--
-- Data for Name: academics; Type: TABLE DATA; Schema: academic; Owner: kampus
--

COPY academic.academics (employee_id, academic_title_id) FROM stdin;
\.


--
-- Data for Name: academic_semester; Type: TABLE DATA; Schema: calender; Owner: kampus
--

COPY calender.academic_semester (semester_id, semester_name_us, emester_name_en, semester_name_ru) FROM stdin;
\.


--
-- Data for Name: academic_years; Type: TABLE DATA; Schema: calender; Owner: kampus
--

COPY calender.academic_years (academic_year_id, academic_year) FROM stdin;
\.


--
-- Data for Name: courses; Type: TABLE DATA; Schema: course; Owner: kampus
--

COPY course.courses (course_code, department_id, name_uz, name_en, name_ru, theory, practice, lab, theory_total, practice_total, lab_total, credits, key) FROM stdin;
\.


--
-- Data for Name: curriculum_elective_groups; Type: TABLE DATA; Schema: curriculum; Owner: kampus
--

COPY curriculum.curriculum_elective_groups (key, elective_group_id, curriculum_id, semester_id, credits) FROM stdin;
\.


--
-- Data for Name: curriculum_mandatory_courses; Type: TABLE DATA; Schema: curriculum; Owner: kampus
--

COPY curriculum.curriculum_mandatory_courses (key, curriculum_id, course_code, semester_id) FROM stdin;
\.


--
-- Data for Name: curriculums; Type: TABLE DATA; Schema: curriculum; Owner: kampus
--

COPY curriculum.curriculums (curriculum_id, program_id, academic_year) FROM stdin;
\.


--
-- Data for Name: elective_courses; Type: TABLE DATA; Schema: curriculum; Owner: kampus
--

COPY curriculum.elective_courses (key, elective_group_id, course_code) FROM stdin;
\.


--
-- Data for Name: elective_group; Type: TABLE DATA; Schema: curriculum; Owner: kampus
--

COPY curriculum.elective_group (elective_group_id, name_uz, name_en, name_ru) FROM stdin;
\.


--
-- Data for Name: departments; Type: TABLE DATA; Schema: department; Owner: kampus
--

COPY department.departments (department_id, faculty_id, name_uz, name_en, name_ru) FROM stdin;
\.


--
-- Data for Name: employee_title; Type: TABLE DATA; Schema: employee; Owner: kampus
--

COPY employee.employee_title (title_id, title_name_uz, title_name_en, title_name_ru) FROM stdin;
\.


--
-- Data for Name: employees; Type: TABLE DATA; Schema: employee; Owner: kampus
--

COPY employee.employees (employee_id, department_id, employee_title, person_id) FROM stdin;
\.


--
-- Data for Name: people; Type: TABLE DATA; Schema: person; Owner: kampus
--

COPY person.people (person_id, jshshir, name_uz, name_en, name_ru, surname_uz, surname_en, surname_ru) FROM stdin;
\.


--
-- Data for Name: programs; Type: TABLE DATA; Schema: program; Owner: kampus
--

COPY program.programs (code, department, name_uz, name_en, name_ru) FROM stdin;
\.


--
-- Data for Name: student_department; Type: TABLE DATA; Schema: student; Owner: kampus
--

COPY student.student_department (student_id, department_id, program_id, curriculum_id) FROM stdin;
\.


--
-- Data for Name: students; Type: TABLE DATA; Schema: student; Owner: kampus
--

COPY student.students (person_id, student_id) FROM stdin;
\.


--
-- Name: academic_title academic_title_pk; Type: CONSTRAINT; Schema: academic; Owner: kampus
--

ALTER TABLE ONLY academic.academic_title
    ADD CONSTRAINT academic_title_pk PRIMARY KEY (academic_title_id);


--
-- Name: academics academics_pk; Type: CONSTRAINT; Schema: academic; Owner: kampus
--

ALTER TABLE ONLY academic.academics
    ADD CONSTRAINT academics_pk PRIMARY KEY (employee_id);


--
-- Name: departments departments_pk; Type: CONSTRAINT; Schema: department; Owner: kampus
--

ALTER TABLE ONLY department.departments
    ADD CONSTRAINT departments_pk PRIMARY KEY (department_id);


--
-- Name: employee_title employee_title_pk; Type: CONSTRAINT; Schema: employee; Owner: kampus
--

ALTER TABLE ONLY employee.employee_title
    ADD CONSTRAINT employee_title_pk PRIMARY KEY (title_id);


--
-- Name: employees employees_pk; Type: CONSTRAINT; Schema: employee; Owner: kampus
--

ALTER TABLE ONLY employee.employees
    ADD CONSTRAINT employees_pk UNIQUE (employee_id);


--
-- Name: employees employees_pk2; Type: CONSTRAINT; Schema: employee; Owner: kampus
--

ALTER TABLE ONLY employee.employees
    ADD CONSTRAINT employees_pk2 PRIMARY KEY (person_id);


--
-- Name: people people_pk; Type: CONSTRAINT; Schema: person; Owner: kampus
--

ALTER TABLE ONLY person.people
    ADD CONSTRAINT people_pk PRIMARY KEY (person_id);


--
-- Name: people people_pk2; Type: CONSTRAINT; Schema: person; Owner: kampus
--

ALTER TABLE ONLY person.people
    ADD CONSTRAINT people_pk2 UNIQUE (jshshir);


--
-- Name: academics academics_academic_title_code_fk; Type: FK CONSTRAINT; Schema: academic; Owner: kampus
--

ALTER TABLE ONLY academic.academics
    ADD CONSTRAINT academics_academic_title_code_fk FOREIGN KEY (academic_title_id) REFERENCES academic.academic_title(academic_title_id);


--
-- Name: academics academics_employees_code_fk; Type: FK CONSTRAINT; Schema: academic; Owner: kampus
--

ALTER TABLE ONLY academic.academics
    ADD CONSTRAINT academics_employees_code_fk FOREIGN KEY (employee_id) REFERENCES employee.employees(employee_id);


--
-- Name: employees employees_departments_code_fk; Type: FK CONSTRAINT; Schema: employee; Owner: kampus
--

ALTER TABLE ONLY employee.employees
    ADD CONSTRAINT employees_departments_code_fk FOREIGN KEY (department_id) REFERENCES department.departments(department_id);


--
-- Name: employees employees_employee_title_code_fk; Type: FK CONSTRAINT; Schema: employee; Owner: kampus
--

ALTER TABLE ONLY employee.employees
    ADD CONSTRAINT employees_employee_title_code_fk FOREIGN KEY (employee_title) REFERENCES employee.employee_title(title_id);


--
-- Name: employees employees_people_code_fk; Type: FK CONSTRAINT; Schema: employee; Owner: kampus
--

ALTER TABLE ONLY employee.employees
    ADD CONSTRAINT employees_people_code_fk FOREIGN KEY (person_id) REFERENCES person.people(person_id);


--
-- PostgreSQL database dump complete
--

