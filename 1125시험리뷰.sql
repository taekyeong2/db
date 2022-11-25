--3)
SELECT employee_id �����ȣ, 
    first_name �̸�, 
    salary �޿�, 
    department_id �μ���ȣ
FROM employees
WHERE (salary BETWEEN 7000 AND 12000) 
--�˻� �������� �빮�� H�� UPPER ��� (Ȥ�� �ҹ��ڰ� �� �������� �����ϱ�)
    AND UPPER(first_name) LIKE 'H%';
    
--5) 
SELECT first_name �̸�,
    hire_date �Ի���,
    ADD_MONTHS(hire_date, 6) "�Ի� 6���� ��",
    NEXT_DAY(hire_date, '��') "�Ի� �� ù �ݿ���",
    --����(����)/ ����(�ø�)
    TRUNC(MONTHS_BETWEEN(sysdate, hire_date), 0) || '����' as "�� �ٹ�����",
-- ���� + 1 => ������ 1��
    LAST_DAY(hire_date) + 1 "ù �޿���"
FROM employees
ORDER BY hire_date;

--9)
SELECT employee_id �����ȣ, 
    first_name �̸�,
--��� ����Ŀ� null�� �����ϸ� ���� ������ ���� => �ݵ�� null�����ڷ� ó�� �������
--NVL�� Į���� ��Ÿ���� ���� Ÿ���� �¾ƾ��Ѵ�. Į�����̶� ���� ��µǴϱ�
    (salary + salary * NVL(commission_pct, 0))*12 ����,
-- �׳� ���� �����ְ� ��� // (��¥ ���� Ÿ���� �Է¹��� ���� ���ľ��� �׳� �������)
    TO_CHAR(hire_date, 'yyyy"�⵵"') "�Ի��� ����",
--NVL2�� Į���� ���� �ȸ����൵ ���� �ΰ��� ���� �����൵ �ʴ�. (Į���� ��¾ȵǴϱ�)
    NVL2(commission_pct, 'COMM', 'NOCOMM') ���,
    department_id �μ���ȣ
FROM employees
ORDER BY department_id, ����;