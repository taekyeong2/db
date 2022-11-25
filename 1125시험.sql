--1����)
SELECT employee_id �����ȣ, 
    first_name �̸�, 
    job_id ����,
    hire_date �Ի���
FROM employees;

--����2) 
SELECT DISTINCT manager_id �Ŵ���
FROM employees
WHERE manager_id IS NOT NULL;

--����3)
SELECT employee_id �����ȣ, 
    first_name �̸�, 
    salary �޿�, 
    department_id �μ���ȣ
FROM employees
WHERE (salary >= 7000 AND salary <= 12000) AND first_name LIKE 'H%';

--����4) 
SELECT employee_id ���, 
    first_name �̸�, 
    hire_date �Ի���,
    SUBSTR(email, 1, 3) as "EMAIL",
    LENGTH(email) as "EMAIL LENGTH"
FROM employees
WHERE hire_date >= '2005-01-01';
    
--����5) 
SELECT first_name �̸�,
    hire_date �Ի���,
    ADD_MONTHS(hire_date, 6) "�Ի� 6���� ��",
    NEXT_DAY(hire_date, '��') "�Ի� �� ù �ݿ���",
    TRUNC(MONTHS_BETWEEN(sysdate, hire_date), 0) || '����' as "�� �ٹ�����",
    TRUNC(ADD_MONTHS(hire_date, 1), 'MON') "ù �޿���"
FROM employees
ORDER BY hire_date;

--����6) 
SELECT employee_id as �����ȣ, 
    first_name as �̸�, 
    TO_CHAR(hire_date, 'dd/MM/RRRR DAY') as �Ի���,
    TO_CHAR((salary * commission_pct), '$999,999.99') as ����
FROM employees
WHERE commission_pct IS NOT NULL
ORDER BY "����" DESC;
    
--����7)
SELECT employee_id �����ȣ, 
    first_name �̸�, 
    job_id "����ID", 
    salary �޿�, 
    department_id �μ���ȣ
FROM employees
WHERE department_id IN (50, 60) AND salary > 5000;

--����8)
SELECT employee_id �����ȣ, 
    job_id "����ID", 
    phone_number ��ȭ��ȣ, 
    department_id �μ���ȣ
FROM employees
WHERE SUBSTR(phone_number, 1, 3) = 515;

--����9)
SELECT employee_id �����ȣ, 
    first_name �̸�,
    (salary + salary * NVL(commission_pct, 0))*12 ����,
    TO_CHAR(TRUNC(hire_date, 'year'), 'yyyy"�⵵"') "�Ի��� ����",
    NVL2(TO_CHAR(commission_pct), 'COMM', 'NOCOMM') ���,
    department_id �μ���ȣ
FROM employees
ORDER BY department_id, "����";

--����10)
SELECT employee_id as �����ȣ, first_name as ����̸�, department_id as �μ���ȣ,
    CASE department_id
        WHEN 20 THEN 'Canada'
        WHEN 80 THEN 'UK'
        ELSE 'USA'
    END �ٹ�����
FROM employees;    