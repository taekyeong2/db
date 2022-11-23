DESC employees;

SELECT
    *
FROM
    employees;

SELECT
    employee_id,
    first_name || last_name "�̸�"
--   �ΰ��� column �ٿ��� ������ ===           ===== ��Ī
FROM
    employees;

SELECT DISTINCT
    job_id,
    department_id
--    ========= �ߺ��Ǵ°� ���� (�����) , ����Ʈ �ڿ��� �����ؾ���
FROM
    employees
ORDER BY
    department_id DESC;

SELECT DISTINCT
    job_id  -- job�� ����� �� �� �ִ�.(job�� �׸񿡼��� �ߺ�����)
FROM
    employees;  

--�����δ� 1000�� �����ִ°��� �ƴ�
--SELECT������ �Ͼ�� ��� ������ ���������͸� �ٲ�������
SELECT
    first_name,
    salary,
    ( salary + 1000 ) * 55
FROM
    employees;

SELECT
    first_name,
    salary
FROM
    employees;

-- ���� �˼� ���� �� 
SELECT
    first_name,
    salary,
    commission_pct,
    salary * commission_pct AS �󿩱�
FROM
    employees;

--������ ' '�� ǥ�� ����
SELECT
    employee_id,
    first_name
    || ' '
    || last_name "full name"
FROM
    employees;

--���ͷ� : ��¥, ����, ���� => ���� ��¥, ���ڴ� ''�� ��������Ѵ�
SELECT
    '�����ȣ '
    || employee_id
    || '�� '
    || first_name
    || '�̰� '
    || job_id
    || ' ���� �ϰ� �ֽ��ϴ�.'
FROM
    employees;


--SELECT�ؼ� �ѰǸ� �������� �������� ���������� WHERE���� ���ǿ� ���� �޶�����.
SELECT
    *
FROM
    employees
WHERE
    first_name = 'Steven';

SELECT
    *
FROM
    employees
WHERE
    employee_id = 100;

SELECT
    employee_id,
    last_name
FROM
    employees
WHERE
    department_id = 90;

--''�ȿ��� ��ҹ���, ������ �ν��Ѵ�.
--("" => ��Ī�� ���)
SELECT DISTINCT
    job_id
FROM
    employees
WHERE
    first_name = 'Steven';

--TO DATE �Լ� 
SELECT
    first_name,
    hire_date
FROM
    employees
WHERE
    hire_date = TO_DATE('2006-11-15', 'yyyy-MM-dd');

--where�� �񱳿����� ���
--�񱳿����� => ����, ����, ������Ÿ�� �� ����
SELECT
    *
FROM
    departments
WHERE
    department_name > 'A';

SELECT
    *
FROM
    departments
WHERE
    location_id <> 1700;

--��������
SELECT
    employee_id,
    first_name,
    job_id,
    hire_date
FROM
    employees
WHERE
    hire_date NOT BETWEEN '2002-01-01' AND '2002-12-31'; --2002�⵵�� �Ի��� ��� ������ �����

--IN : ���ǵ� �� �ϳ��� ����
SELECT
    employee_id,
    first_name,
    job_id,
    hire_date
FROM
    employees
WHERE
    job_id IN ( 'IT_PROG', 'PU_CLERK', 'SA_MAN' );

SELECT
    employee_id,
    first_name,
    job_id,
    hire_date
FROM
    employees
--WHERE first_name LIKE 'K%e%'; =>�빮�� K�� �����ϰ� ���ο� ������ e�� ����
WHERE
    first_name LIKE 'K__e%'; -- �빮��K�� �����ϰ� �׹�°�� ������ e�� �����ϰ� �� ũ��� �������� �ʾҴ�.

--��������(������ ��ġ�� ())
SELECT
    employee_id,
    first_name,
    job_id,
    salary,
    department_id
FROM
    employees
WHERE
    department_id = 100
    OR salary > 10000;

SELECT
    employee_id,
    first_name,
    job_id,
    salary,
    department_id
FROM
    employees
WHERE
    ( employee_id NOT BETWEEN 100 AND 190 )
    AND ( department_id = 100
          OR salary > 10000 );

SELECT
    employee_id,
    first_name,
    job_id,
    salary,
    commission_pct
FROM
    employees
WHERE
    commission_pct IS NULL; --�󿩱��� �����ϴ� ������� �˼��ִ�.

--odeer_by
SELECT employee_id, first_name, hire_date
FROM employees 
ORDER BY hire_date DESC; 

SELECT employee_id, first_name, hire_date 
FROM employees 
ORDER BY employee_id DESC, hire_date ASC; 

SELECT employee_id, first_name, hire_date 
FROM employees 
ORDER BY hire_date DESC, employee_id ASC; --hiredate���� ������ �� �׾ȿ��� employeeid�� ��������

--DESC : ��������, ASC: �������� / �Ѵ� �Ⱦ��� �⺻���� ���������� �⺻

SELECT employee_id, first_name, salary, salary * 12 
FROM employees
ORDER BY 4 DESC; --4��° Į���� ���� ������������ ����ϰٵ�.

SELECT employee_id, first_name, salary, salary * 12 annsal
FROM employees
ORDER BY annsal DESC; --4��° Į���� ���� ������������ ����ϰڴ�.

SELECT employee_id, first_name
FROM employees
ORDER BY hire_date; --select���� ���� �÷��̶� ����

-- ȸ���� �μ� ������ ���� Ȯ���϶� 
SELECT *
FROM departments;

-- �����ȣ�� �̸��� ������ ����϶�
SELECT employee_id �����ȣ, first_name || ' ' || last_name �̸�, salary ����
FROM employees;

DESC employees; --�ش�Ǵ� ���̺��� �÷� Ȯ��

--�����ȣ, �̸�, �����ڵ�, �Ի��� ���
SELECT employee_id, first_name, job_id, hire_date "start date"
FROM employees;
-- ��Ī ��ҹ��� ���� / ���� / Ư������ ��� �� ��� ""����ؾ��Ѵ�.

--���� �Ŵ�����å�� �ð� �ִ� ��� ��ȣ�� ���ϼ���
--�� �ߺ����� �����ϰ� ���
SELECT DISTINCT manager_id
FROM employees
WHERE manager_id IS NOT NULL
ORDER BY manager_id;

-- �Ŵ��� ���̵�� ������� �����ϴ� ����� ������ �ٿ�������
SELECT e.*, m.*
FROM employees e join employees m
 ON e.manager_id = m.employee_id
WHERE e.department_id = 50;

-- ������� � ������ �ϰ� �ִ��� ���
-- (��, �ߺ��Ǵ� ���� �����ϰ� ���)
SELECT DISTINCT job_id
FROM employees;







