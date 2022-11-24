--data => infromation
/* SELECT : ����� �÷��� ����
            ����� ����, ��ĵ� �Բ� ����
   FROM : ��ȸ�� ���
   WHERE : �˻�����, ����
   ORDER BY : ���� ���(���� �÷�����)

  ���, ���� -> SELECT 
  ��, is null, like, inbetween ��
  ** ����� boolean Ÿ���̶� select������ ��������. (����Ŭ�� booleanŸ�� ����)
  => WHERE ���� �� ��� ���� */
  
--�Ի����� 2003�� 10�� ������ ����� �̸���, ����, �Ŵ����� ���
SELECT first_name, job_id, manager_id
FROM employees
WHERE hire_date > '2003-10-31';

--�޿��� 15000�޷� �̻��� ����� �μ��� �̸��� �Ի����� ���
--�� �μ��� �������� �����ϼ���.
SELECT department_id, first_name, hire_date
FROM employees
WHERE salary >= 15000
ORDER BY department_id;

--�����ȣ�� 150���� 230������ ������� �̸��� ������ �޿� �׸��� ������ ����ϼ���
--��, ������ ���������� �޿��� �������� �����������ּ���
SELECT first_name, job_id, salary, salary * 12 as annsal
FROM employees
WHERE employee_id BETWEEN 150 AND 230
ORDER BY job_id ASC, salary;

--�޿��� 5000���� 12000���̿� ���ԵǴ� ��� ����� �̸��� �μ�, ���������� ���
--�� ���� �μ��� ��� ������� ����ϵ��� SQL���� �����ϼ���.
SELECT first_name, department_id, job_id
FROM employees
WHERE salary BETWEEN 5000 AND 12000
ORDER BY department_id;

-- �Ŵ����� 100���̰ų� 103�� ����� �����ȣ�� �̸� �Ի��� ���
SELECT employee_id, first_name, hire_date
FROM employees
WHERE manager_id IN (100 , 103);
--between�� ���� in�� ������ ��������

-- ������ it_prog �̰ų� fi_mgr�� ����� �����ȣ�� �̸� �ҼӺμ� ���
--�� ���ı��� �޿� ��������
SELECT employee_id, first_name, department_id
FROM employees
WHERE job_id IN ('IT_PROG','FI_MGR')
ORDER BY salary DESC; 
--order by�� �ش� SELECT���� �����ϴ°� �ƴ϶� ��� ���̺� �����͵��� ������

-- *** like������ '%'�� '_'�� ���ȴ�.
--�̸��� �빮�� k�� �����ϰų� �빮�� d�� �����ϴ� ����� ���� ���
SELECT *
FROM employees 
WHERE first_name LIKE 'K%' OR first_name Like 'D%';
--***LIKE�� ������ �÷����� �����
--***AND OR �� �÷��� �����ڸ� �ѽ����� �ؼ� �����ϴ°�

--ȸ���� ���� �߿� ����(Sales)�� ������ ������ �Ա� �ּ� ������ �ִ뿬�� ���
--���ı����� �ִ뿬�� ������������ ����
SELECT job_title as ����, min_salary as �ּҿ���, max_salary as �ִ뿬��
FROM jobs
WHERE job_title LIKE '%Sales%'
ORDER BY max_salary DESC;

-- ���� �Ŵ����� �������� �ʴ� ����� ������ ��� ���
SELECT * 
FROM employees
WHERE manager_id IS NULL;

--Ŀ�̼��� �����ϴ� ������� �μ��� �ߺ����� ���
SELECT DISTINCT department_id
FROM employees
WHERE commission_pct IS NOT NULL AND department_id IS NOT NULL;

--������ �������(SA_REP)�Ǵ� �ܼ��繫��(ST_CLERK)�̸鼭 
--�޿��� 2500�̰ų� 3500Ȥ�� 7000�� �ƴ� 
--��� ����� �̸��� ���� �޿����
--���ı��� �����ȣ
SELECT first_name, job_id, salary
FROM employees
WHERE job_id IN ('SA_REP','ST_CLERK') AND salary NOT IN (2500, 3500, 7000)
ORDER BY employee_id;
-- OR�� AND���� �켱���� ���� OR ���� �����ų���� ()

--Ŀ�̼� ������ �޿��� 20%�� ��� ����� �̸��� �޿� �� Ŀ�̼� ���
SELECT first_name, salary, commission_pct * salary as commission
FROM employees
WHERE commission_pct = .2;


-------------------------------------------------------------------------------------------------------------------
--UNION
--employees_id�� ���� ���� ���� department_id ���Ǽ��� ��� ���(�ߺ��� �ȵǴϱ�)
--�÷����� ù��° SELECT �̸� �������� ǥ�õ�
--���� ORDER BY�� ù��° ����Ʈ������ �ִ� �÷��� ���� ���� => ���Ͽ��� ����Ʈ ������ ǥ���� ���� �����ؼ� �������°��̱⶧��
--(SELECT ���� ORDER BY�� select�� �� �ִ� ��� �÷��� �����ϴ� �Ŵϱ� ���� ���� ���÷��� ����������..)
SELECT employee_id, first_name
FROM employees
WHERE commission_pct IS NOT NULL
UNION
SELECT department_id, department_name
FROM departments
ORDER BY employee_id;

--UNION ALL 
--�ߺ��� ���žȵ�, ���ľȵ�
SELECT employee_id, first_name
FROM employees
WHERE manager_id = 103
UNION ALL
SELECT employee_id, first_name
FROM employees
WHERE employee_id BETWEEN 100 AND 105
ORDER BY employee_id;

--MINUS (�����߿�)
SELECT employee_id, first_name
FROM employees
WHERE hire_date BETWEEN '2005-01-01' AND '2005-06-30'
MINUS
SELECT employee_id, first_name
FROM employees
WHERE manager_id = 103
ORDER BY employee_id;

--INTERSECT
SELECT employee_id, first_name
FROM employees
WHERE hire_date BETWEEN '2005-01-01' AND '2005-06-30'
INTERSECT
SELECT employee_id, first_name
FROM employees
WHERE manager_id = 103
ORDER BY employee_id;


-------------------------------------------------------------------------------------------------------------------
--�Լ�
--DUAL TABLE
--sysdate : ���糯¥ �Լ� (��Ư�� �Լ��� ()�� ����)
SELECT sysdate FROM dual;
SELECT * FROM dual;
SELECT 100 + 100 FROM dual;

--------------------------------------------------------------------------------
--�������� �Լ�
--'hElLo WoRLd'
SELECT LOWER('hElLo WoRLd')
FROM dual;

SELECT LOWER(first_name)
FROM employees;

SELECT UPPER('hElLo WoRLd')
FROM dual;

SELECT UPPER(first_name)
FROM employees;
 
--initcap : �ܾ������ ������ ù���ڸ� �빮�� ������ �ҹ��� 
--          ������ �������� �ܾ �ν�
SELECT INITCAP('hElLo WoRLd')
FROM dual;

--CONCAT // �����δ� ���Ῥ����||�� ���� ����.
SELECT CONCAT(first_name, last_name)
FROM employees;

SELECT CONCAT (CONCAT(first_name,' '), last_name)
FROM employees;
SELECT first_name || ' ' || last_name
FROM employees;

--SUBSTR(����������, ������ġ, �߶󳾱��ڼ�)
--��sql���� index�� ������ ��� 1���� ������
SELECT SUBSTR('Hello World', 5, 3 )
FROM dual;

SELECT SUBSTR(first_name, 1,3)
FROM employees;

--length 
--���鵵 �ν� => TRIM�Լ� ���� ���
SELECT LENGTH (TRIM('     Hello World'))
FROM dual;

SELECT first_name, LENGTH(first_name)
FROM employees;

--LENGTHB : ����Ʈ �������� ���� (�ѱ� �ѱ��ڰ� 3����Ʈ)
SELECT LENGTH('�ȳ��ϼ���'), LENGTHB('�ȳ��ϼ���')
FROM dual;

--INSTR(���ڿ�, ã�� ���ڿ� [,������ġ [,�˻�����]])
SELECT INSTR('Hello World', 'l')
FROM dual;

SELECT INSTR('Hello World', 'l', 5)
FROM dual;

SELECT INSTR('Hello World', 'l', 1, 3)
FROM dual;

--LPAD / RPAD (���ڿ�, ���ڼ�, ����ä���)
--������ �տ�
SELECT LPAD('hello', 10, ' '), RPAD('hello', 10, ' ')
FROM dual;

SELECT RPAD(last_name, 20, ' ') || LPAD(first_name, 20,' ')
FROM employees
UNION
SELECT last_name || ' ' || first_name
FROM employees;

--TRIM( [ [ LEADING | TRAILING | BOTH | trim_character FROM ] trim_source )
-- trim_source : ���������� (�ʼ�)
--(��������) trim_character: �����ϰ��� �ϴ� ���� (' '�� ����Ʈ)
--          LEADING(��) | TRAILING(��) | BOTH(�յ� -> ����Ʈ) => ������ ��ġ ����
SELECT TRIM('          Hello World       ')
FROM dual;

SELECT TRIM(' ' FROM '          Hello World       ')
FROM dual;

SELECT TRIM(BOTH ' ' FROM '          Hello World       ')
FROM dual;

--'ddddYEDAMdddd'
SELECT TRIM(TRAILING 'd' FROM 'ddddYDEAMdddd')
FROM dual;

--�̸��� �빮�� k�� �����ϰų� �빮�� d�� �����ϴ� ����� ���� ���
SELECT employee_id, first_name
FROM employees 
WHERE UPPER(SUBSTR(first_name, 1, 1)) IN ('K', 'D');

--------------------------------------------------------------------------------
--�����Լ� 
--ROUND (�Ǽ� [, ����(�ݿø���ġ)]) 
--TRUNC (�Ǽ� [, ����(������ġ)])
SELECT ROUND(345.678)  --(345.678 ,0)
FROM dual;

SELECT ROUND(345.658, 1)
FROM dual;

SELECT ROUND(345.658, -1)
FROM dual;

SELECT ROUND(345456.658, 0), TRUNC(345456.658, 0)
FROM dual;

SELECT ROUND(345456.658, 2), TRUNC(345456.658, 2)
FROM dual;

SELECT ROUND(345456.658, -1), TRUNC(345456.658, -1)
FROM dual;

--MOD => ������
--TRUNC => ������ �� ���ϰ� ���� TRUNC���
SELECT TRUNC(15/2),MOD(15, 2)
FROM dual;

--------------------------------------------------------------------------------
--**cf) �����Լ����� ������ ������ġ�� �δ°��� �ڿ��� ���� �Ѵٴ� �� 
SELECT first_name, SUBSTR(first_name, -3, 2)
FROM employees;

--���ڴ�ü
SELECT REPLACE('oracle database', 'oracle', 'mysql')
FROM dual;

-------------------------------------------------------------------------------------------------------------------


--���� ��¥�� ǥ���ϼ���, �÷��� �̸��� Date�� �մϴ�.
SELECT sysdate as "Date"
FROM dual;

--Ŀ�̼��� ���� ����� ��� 15%�λ����� �����ϰ� ������ ǥ���ϵ��� �ϰھ��ϴ�.
-- ��� ��ȣ, �̸�, �޿�, 15�� �λ�� �޿������� ���
-- �λ�� �޿��� ��Ī�� New Salary ��� ���� 
SELECT employee_id, first_name, salary, TRUNC(salary + salary * 0.15 ) as "New Salary"
FROM employees
WHERE commission_pct IS NULL;

--Ŀ�̼��� �ִ� ��� �� ����� ������ ���ϰ� ����(�ݿø�, ǥ�ü��ڴ����� ���ڸ�)�� ǥ��
--�����ȣ, �̸�, ����, �޿���, ���������� ��� ���� ��Ī Year Salary
--������ ���� ������ ����
SELECT employee_id, first_name, salary, ROUND(((salary + salary * commission_pct) * 12), -2) as "Year Salary"
FROM employees
WHERE commission_pct IS NOT NULL
ORDER BY "Year Salary" DESC;
--ORDER BY 5 DESC;

--Ŀ�̼��� ���� ����� ��� 15%�λ����� �����ϰ� ������ ǥ���ϵ��� �ϰھ��ϴ�.
-- ��� ��ȣ, �̸�, �޿�, 15�� �λ�� �޿������� ���
-- �λ�� �޿��� ��Ī�� New Salary ��� ���� 
--  ++ ���� ������ ����(����)�� �����Ͽ� �� �޿����� ���� �޿��� ���� ���� �߰��ϰ� �̸��� Increase�� �����Ѵ�.
SELECT employee_id, first_name, salary, TRUNC(salary + salary * 0.15 ) as "New Salary",
       (TRUNC(salary + salary * 0.15 )-salary) as "Increase"
FROM employees
WHERE commission_pct IS NULL;

CREATE TABLE number_tbl(
    x NUMBER NOT NULL
);
SELECT * FROM number_tbl;
INSERT INTO number_tbl VALUES (1);

--number_tbl���� ¦���� ���
SELECT  x, '¦��'
FROM number_tbl
WHERE MOD(x, 2) = 0;

-- Ȧ���� ���
SELECT x, 'Ȧ��'
FROM number_tbl
WHERE MOD(x, 2) = 1;

--�� �ະ�� ¦�� Ȧ������ ���
SELECT  x, '¦��'
FROM number_tbl
WHERE MOD(x, 2) = 0
UNION
SELECT x, 'Ȧ��'
FROM number_tbl
WHERE MOD(x, 2) <> 0
ORDER BY x ;

-- �μ���ȣ�� 50�� ������� �޿��� �μ���ȣ�� 90�̻��� ������� �޿���
--����� �޿��� ��ȸ�ϻ���
--����� �޿���, �ݾ��� ���� ������ ����
SELECT salary
FROM employees
WHERE department_id = 50
INTERSECT
SELECT salary
FROM employees
WHERE department_id >= 90
ORDER BY salary DESC;

--�̸���  ��ҹ��� ���о��� J A �Ǵ� M ���� �����ϴ� ��� ����� 
--�̸� (��ҹ��� ����)�� �̸� ���̸� ǥ���ϴ� ���Ǹ� �ۼ��ϰ� 
-- �� ���� ������ Į������ �����ϼ���, �� ����� �̸��� �������� �������� ����
SELECT  INITCAP(first_name) as "�̸�",
        LENGTH(first_name) as "�̸�����"
FROM employees
WHERE UPPER(SUBSTR(first_name, 1, 1)) IN ('J', 'A', 'K')
--WHERE LOWER(SUBSTR(first_name, 1, 1)) IN ('j', 'a', 'k')
ORDER BY first_name;


--����� �߿��� ������ ������(MK)�� ������ �ְų� ����(SA)�� ������ �ִ� ���
-- �ش� ����� �����ȣ, �̸�, ����, �޿��� ������ �������� ���
--�����ȣ 1**�� AB**** �� ������ �ð� ������ �޿��� 123(õ����) �Դϴ�.
SELECT
'�����ȣ '
|| RPAD(SUBSTR(employee_id, 1, 1), 3, '*')
|| '�� ' || RPAD(SUBSTR(first_name, 1, 2), LENGTH(first_name), '*')
|| '�� ' || job_id || '�� �ð� ������ �޿��� ' || TRUNC(salary/1000) 
|| '(õ����) �Դϴ�.'
FROM employees
WHERE UPPER(SUBSTR(jon_id, 1, 2)) IN ('MK', 'SA');

--UPPER(job_id) LIKE '%MK%' OR UPPER(job_id) LIKE '%SA%'
-- �����ȣ TRUNK(employee_id/100) => RPAD(TRUNC(employee_id/100),3,'*')
-- �̸� (SUBSTR(first_name, 1,2) => RPAD


-------------------------------------------------------------------------------------------------------------------
--��¥�Լ� 


