-- DELIVERABLE 1: The Number of Retiring Employees by Title
SELECT e.emp_no, 
        e.first_name,
        e.last_name,
        ti.title,
        ti.from_date,
        ti.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles as ti
ON e.emp_no = ti.emp_no
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no
;


-- get rid of duplicates from the retirement_titles table
SELECT DISTINCT ON (emp_no) emp_no, first_name, last_name, title
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, from_date DESC
;

-- group the count of retiring employees by title
SELECT COUNT(title) count, title
INTO retiring_titles
FROM unique_titles
GROUP BY (title) 
ORDER BY count DESC
;

select * FROM unique_titles
select * FROM retiring_titles;

--Deliverable 2: The Employees Eligible for the Mentorship Program
SELECT DISTINCT ON (emp_no)
        e.emp_no, 
        e.first_name,
        e.last_name,
        e.birth_date,
        de.from_date,
        de.to_date,
        ti.title
INTO mentorship_eligibility
FROM employees as e
INNER JOIN dept_emp as de
ON e.emp_no = de.emp_no
INNER JOIN titles as ti
ON e.emp_no = ti.emp_no
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31') AND de.to_date = '9999-01-01'
ORDER BY emp_no, ti.from_date DESC
;

select * FROM mentorship_eligibility;

