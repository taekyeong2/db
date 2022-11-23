DESC employees;

SELECT *
FROM employees;

SELECT employee_id, first_name || last_name "이름"
--   두개의 column 붙여서 보여줌 ===           ===== 별칭
FROM employees;

SELECT DISTINCT job_id, department_id
--    ========= 중복되는거 삭제 (행단위) , 셀렉트 뒤에만 존재해야함
FROM employees
ORDER BY department_id DESC;

SELECT DISTINCT job_id  -- job의 목록을 볼 수 있다.(job의 항목에서의 중복제거)
FROM employees;  

--실제로는 1000이 더해주는것이 아님
--SELECT절에서 일어나는 모든 연산은 원본데이터를 바꾸지못함
SELECT first_name, salary, (salary + 1000) *55
FROM employees;

SELECT first_name, salary
FROM employees;

-- 널은 알수 없는 값 
SELECT first_name, salary, commission_pct, salary * commission_pct as 상여금 
FROM employees;

--공백은 ' '로 표시 가능
SELECT employee_id, first_name ||' '|| last_name "full name"
FROM employees;

--리터럴 : 날짜, 문자, 숫자 => 그중 날짜, 문자는 ''로 묶어줘야한다
SELECT '사원번호 ' || employee_id || '는 ' || first_name || '이고 ' || job_id || ' 일을 하고 있습니다.' 
FROM employees;


--SELECT해서 한건만 가져올지 여러개를 가져올지는 WHERE절의 조건에 따라 달라진다.
SELECT *
FROM employees
WHERE first_name = 'Steven';

SELECT *
FROM employees
WHERE employee_id = 100; 

SELECT employee_id, last_name
FROM employees
WHERE department_id = 90;

--''안에는 대소문자, 공백을 인식한다.
--("" => 별칭에 사용)
SELECT DISTINCT job_id
FROM employees
WHERE first_name = 'Steven';

--TO DATE 함수 
SELECT first_name, hire_date
FROM employees
WHERE hire_date = TO_DATE('2006-11-15', 'yyyy-MM-dd');

--where절 비교연산자 사용
--비교연산자 => 숫자, 문자, 데이터타입 다 가능
SELECT *
FROM departments
WHERE department_name > 'A';

SELECT *
FROM departments
WHERE location_id <> 1700;

--범위지정
SELECT employee_id, first_name, job_id, hire_date
FROM employees
WHERE hire_date NOT BETWEEN '2002-01-01' AND '2002-12-31'; --2002년도에 입사한 사람 제외한 모든사람

--IN : 조건들 중 하나만 만족
SELECT employee_id, first_name, job_id, hire_date
FROM employees
WHERE job_id IN ('IT_PROG', 'PU_CLERK', 'SA_MAN'); 

SELECT employee_id, first_name, job_id, hire_date
FROM employees
--WHERE first_name LIKE 'K%e%'; =>대문자 K로 시작하고 내부에 무조건 e가 존재
WHERE first_name LIKE 'K__e%' -- 대문자K로 시작하고 네번째에 무조건 e가 존재하고 총 크기는 정해지지 않았다.










