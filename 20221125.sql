--��¥�Լ�
--���ú��� 10�� ���� ��¥ 
--��¥ �Լ��� 10�� ���ϴ°� �ܼ��� ���ϴ°� �ƴ϶� �ϼ��� ����
SELECT  sysdate as today, sysdate + 10 as "After 10 Day"
FROM dual;

--�ð��� ���� ������ ������ ������ �ʴ´�. => TRUNMC
SELECT TRUNC(TO_DATE('2022-12-31', 'YYYY-MM-DD') - sysdate) "���� ���� ��¥"
FROM dual;

--�� ��¥ ������ ������ ��ȯ
--MONTHS_BETWEEN : (������ ��) ���̰�
SELECT sysdate Today, hire_date �Ի���, MONTHS_BETWEEN(sysdate, hire_date)
FROM employees;

--�������ϱ�
SELECT sysdate Today, hire_date �Ի���, 
    MONTHS_BETWEEN(sysdate, hire_date),
    TRUNC(MONTHS_BETWEEN(sysdate, hire_date)/12) || '�� ' ||
    TRUNC(MOD(MONTHS_BETWEEN(sysdate, hire_date),12)) || '����'
FROM employees;

-- ADD_MONTHS : ���糯¥ �������� ��� �� -> ��¥�� ��ȯ�Ǵϱ� �ݿø�, ���� �� �ʿ����
--              -6�� 6���� ��
SELECT sysdate Today, 
    ADD_MONTHS(sysdate, 6) "After 6 Month"
FROM dual;

--LAST_DAY
--NEXT_DAY : ���÷� ���� ���ƿ��� ������
-- ��¥�� ���ƿ��ϱ� ��¥���� ��밡��
SELECT sysdate today,
    LAST_DAY(sysdate) "Month Last Day",
    NEXT_DAY(sysdate, '��'),
    NEXT_DAY(sysdate, '��') - sysdate
FROM dual;

--ROUND : ��¥Ÿ������ �޾Ƽ� �ݿø� �� ��¥Ÿ������ ��ȯ
SELECT sysdate today,
    ROUND(sysdate, 'DD') as "����� ��",
    ROUND(sysdate, 'DAY') as "����� �� �Ͽ���",
    ROUND(sysdate, 'MON') as "����� ��",
    ROUND(sysdate, 'YEAR') as "����� �⵵"
FROM dual;

--TRUNC
SELECT sysdate,
    ROUND(sysdate, 'MON'), --�ݿø�
    TRUNC(sysdate, 'MON') --���� (���� ������ ��¥(����)���� ���ڿ� �ð� �ʱ�ȭ(����))
FROM dual;

--�����ε� : �Ȱ��� �̸������� ���� ������ �Ϳ� ���� ����� �ٸ�
--�������̵� : ��Ӱ��迡�� �θ𲨸� �ٽ� ��


--------------------------------------------------------------------------------
--��¥�� TO_CHAR : ��¥�� ����Ÿ������ ��� (���� ������ �������� �� ���� �ϳ��� ������ ���)
--��ȯ�Լ�(���ڴ� ""ǥ��)
SELECT TO_CHAR(sysdate, 'yyyy"��" MM"��" DD"��"') --��¥Ÿ���� �ƴ϶� ����Ÿ��
FROM dual;

--2005�⿡ �Ի��� ����� ���
SELECT employee_id, first_name, hire_date
FROM employees
WHERE TO_CHAR(hire_date, 'yyyy') = '2005';

SELECT TO_CHAR(hire_date, 'yyyy "��" DDSPTH Month HH:MI:SS PM')
FROM employees
WHERE department_id = 50;

--2022�� TWENTY-FIFTH 11�� 11:05:10 ����
SELECT TO_CHAR(sysdate, 'yyyy"��" DDSPTH Month HH:MI:SS PM')
FROM dual;

--fm �����̳� 0�� ����
SELECT TO_CHAR(sysdate, 'fmyyyy"��" DDSPTH Month mon dd day dy HH24:MI:SS PM')
FROM dual;

--���ڿ� TO_CHAR ( ������ �������� ���)
SELECT first_name, TO_CHAR(salary, 'L999,999.99') salary
FROM employees;

--$�� ����Ÿ�� -> ���ڷ� ��ȯ�ؾ��Ѵ�. / ���� ���ڷ� �־��ְ� ǥ���Ҷ� to_char�� ��ȯ������Ѵ�.
SELECT TO_CHAR((12*123), 'L99,999')
FROM dual;


--------------------------------------------------------------------------------
-- TO_NUMBER 
--Ÿ�Ը� �����ϻ� ���� ���ڶ� ������ �׳� ����� (�������� �ʿ� ����)
SELECT TO_NUMBER('10000') + 10000
FROM dual;

--������ �������� �о ���ڷ� ��ȯ
SELECT TO_NUMBER('$1000', '$9999') +10000
FROM dual;

SELECT TO_NUMBER('$10,000', '$99,999') + 1234
FROM dual;

--------------------------------------------------------------------------------
--TO_DATE
--������ ��Ȯ�ϰ� �������ָ� ������ ���Ѵ�.
SELECT TO_DATE('2022��, 11��', 'YYYY"��", MM"��"')
FROM dual;

SELECT TO_DATE('99/05/23'),
    TO_CHAR(TO_DATE('99/05/23'), 'YYYY-MM-dd'),  --������ ��¥ �����̶� ���ĸ��� ��������(�⺻������ RR�������� ����)
    TO_CHAR(TO_DATE('99/05/23', 'YY/MM/dd'), 'YYYY-MM-dd') -- yy�� ���� ���⸦ ������� �д´�. => �������⵵ �Է��Ϸ��� RR���Ļ��
FROM dual;

SELECT TO_DATE('11�� 11, 99', 'MM"��" DD, RR')
FROM dual;

--�� ����� �̸��� �ٹ� �� �� ���
--�ٹ� �޼� ��� ��� (�Ի��Ϸκ��� ��������� �� ��, �ݿø�, ����)
-- MONTHS_WORK�� �÷���
-- �ٹ��� ���� ���� ������� ���̵��� ����
--ROUND(MONTHS_BETWEEN(sysdate, hire_date), 0) MONRHS_WORK => �ٹ��޼�
SELECT first_name, ROUND(MONTHS_BETWEEN(sysdate, hire_date), 0) MONTHS_WORK
FROM employees
ORDER BY MONTHS_WORK DESC;

