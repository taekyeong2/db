--1문제)
SELECT employee_id 사원번호, 
    first_name 이름, 
    job_id 업무,
    hire_date 입사일
FROM employees;

--문제2) 
SELECT DISTINCT manager_id 매니저
FROM employees
WHERE manager_id IS NOT NULL;

--문제3)
SELECT employee_id 사원번호, 
    first_name 이름, 
    salary 급여, 
    department_id 부서번호
FROM employees
WHERE (salary >= 7000 AND salary <= 12000) AND first_name LIKE 'H%';

--문제4) 
SELECT employee_id 사번, 
    first_name 이름, 
    hire_date 입사일,
    SUBSTR(email, 1, 3) as "EMAIL",
    LENGTH(email) as "EMAIL LENGTH"
FROM employees
WHERE hire_date >= '2005-01-01';
    
--문제5) 
SELECT first_name 이름,
    hire_date 입사일,
    ADD_MONTHS(hire_date, 6) "입사 6개월 뒤",
    NEXT_DAY(hire_date, '금') "입사 후 첫 금요일",
    TRUNC(MONTHS_BETWEEN(sysdate, hire_date), 0) || '개월' as "총 근무개월",
    TRUNC(ADD_MONTHS(hire_date, 1), 'MON') "첫 급여일"
FROM employees
ORDER BY hire_date;

--문제6) 
SELECT employee_id as 사원번호, 
    first_name as 이름, 
    TO_CHAR(hire_date, 'dd/MM/RRRR DAY') as 입사일,
    TO_CHAR((salary * commission_pct), '$999,999.99') as 수당
FROM employees
WHERE commission_pct IS NOT NULL
ORDER BY "수당" DESC;
    
--문제7)
SELECT employee_id 사원번호, 
    first_name 이름, 
    job_id "업무ID", 
    salary 급여, 
    department_id 부서번호
FROM employees
WHERE department_id IN (50, 60) AND salary > 5000;

--문제8)
SELECT employee_id 사원번호, 
    job_id "업무ID", 
    phone_number 전화번호, 
    department_id 부서번호
FROM employees
WHERE SUBSTR(phone_number, 1, 3) = 515;

--문제9)
SELECT employee_id 사원번호, 
    first_name 이름,
    (salary + salary * NVL(commission_pct, 0))*12 연봉,
    TO_CHAR(TRUNC(hire_date, 'year'), 'yyyy"년도"') "입사한 연도",
    NVL2(TO_CHAR(commission_pct), 'COMM', 'NOCOMM') 비고,
    department_id 부서번호
FROM employees
ORDER BY department_id, "연봉";

--문제10)
SELECT employee_id as 사원번호, first_name as 사원이름, department_id as 부서번호,
    CASE department_id
        WHEN 20 THEN 'Canada'
        WHEN 80 THEN 'UK'
        ELSE 'USA'
    END 근무지역
FROM employees;    