DESC employees;

SELECT *
FROM employees;

SELECT employee_id, first_name || last_name "�̸�"
--   �ΰ��� column �ٿ��� ������ ===           ===== ��Ī
FROM employees;

SELECT DISTINCT job_id, department_id
--    ========= �ߺ��Ǵ°� ���� (�����) , ����Ʈ �ڿ��� �����ؾ���
FROM employees
ORDER BY department_id DESC;

SELECT DISTINCT job_id  -- job�� ����� �� �� �ִ�.(job�� �׸񿡼��� �ߺ�����)
FROM employees;  

--�����δ� 1000�� �����ִ°��� �ƴ�
--SELECT������ �Ͼ�� ��� ������ ���������͸� �ٲ�������
SELECT first_name, salary, (salary + 1000) *55
FROM employees;

SELECT first_name, salary
FROM employees;

-- ���� �˼� ���� �� 
SELECT first_name, salary, commission_pct, salary * commission_pct as �󿩱� 
FROM employees;

--������ ' '�� ǥ�� ����
SELECT employee_id, first_name ||' '|| last_name "full name"
FROM employees;

--���ͷ� : ��¥, ����, ���� => ���� ��¥, ���ڴ� ''�� ��������Ѵ�
SELECT '�����ȣ ' || employee_id || '�� ' || first_name || '�̰� ' || job_id || ' ���� �ϰ� �ֽ��ϴ�.' 
FROM employees;


--SELECT�ؼ� �ѰǸ� �������� �������� ���������� WHERE���� ���ǿ� ���� �޶�����.
SELECT *
FROM employees
WHERE first_name = 'Steven';

SELECT *
FROM employees
WHERE employee_id = 100; 

SELECT employee_id, last_name
FROM employees
WHERE department_id = 90;

--''�ȿ��� ��ҹ���, ������ �ν��Ѵ�.
--("" => ��Ī�� ���)
SELECT DISTINCT job_id
FROM employees
WHERE first_name = 'Steven';

--TO DATE �Լ� 
SELECT first_name, hire_date
FROM employees
WHERE hire_date = TO_DATE('2006-11-15', 'yyyy-MM-dd');

--where�� �񱳿����� ���
--�񱳿����� => ����, ����, ������Ÿ�� �� ����
SELECT *
FROM departments
WHERE department_name > 'A';

SELECT *
FROM departments
WHERE location_id <> 1700;

--��������
SELECT employee_id, first_name, job_id, hire_date
FROM employees
WHERE hire_date NOT BETWEEN '2002-01-01' AND '2002-12-31'; --2002�⵵�� �Ի��� ��� ������ �����

--IN : ���ǵ� �� �ϳ��� ����
SELECT employee_id, first_name, job_id, hire_date
FROM employees
WHERE job_id IN ('IT_PROG', 'PU_CLERK', 'SA_MAN'); 

SELECT employee_id, first_name, job_id, hire_date
FROM employees
--WHERE first_name LIKE 'K%e%'; =>�빮�� K�� �����ϰ� ���ο� ������ e�� ����
WHERE first_name LIKE 'K__e%' -- �빮��K�� �����ϰ� �׹�°�� ������ e�� �����ϰ� �� ũ��� �������� �ʾҴ�.










