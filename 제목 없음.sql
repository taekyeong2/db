DESC employees;

SELECT
    *
FROM
    employees;

SELECT
    employee_id,
    first_name || last_name "이름"
--   두개의 column 붙여서 보여줌 ===           ===== 별칭
FROM
    employees;

SELECT DISTINCT
    job_id,
    department_id
--    ========= 중복되는거 삭제 (행단위) , 셀렉트 뒤에만 존재해야함
FROM
    employees
ORDER BY
    department_id DESC;

SELECT DISTINCT
    job_id  -- job의 목록을 볼 수 있다.(job의 항목에서의 중복제거)
FROM
    employees;  

--실제로는 1000이 더해주는것이 아님
--SELECT절에서 일어나는 모든 연산은 원본데이터를 바꾸지못함
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

-- 널은 알수 없는 값 
SELECT
    first_name,
    salary,
    commission_pct,
    salary * commission_pct AS 상여금
FROM
    employees;

--공백은 ' '로 표시 가능
SELECT
    employee_id,
    first_name
    || ' '
    || last_name "full name"
FROM
    employees;

--리터럴 : 날짜, 문자, 숫자 => 그중 날짜, 문자는 ''로 묶어줘야한다
SELECT
    '사원번호 '
    || employee_id
    || '는 '
    || first_name
    || '이고 '
    || job_id
    || ' 일을 하고 있습니다.'
FROM
    employees;


--SELECT해서 한건만 가져올지 여러개를 가져올지는 WHERE절의 조건에 따라 달라진다.
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

--''안에는 대소문자, 공백을 인식한다.
--("" => 별칭에 사용)
SELECT DISTINCT
    job_id
FROM
    employees
WHERE
    first_name = 'Steven';

--TO DATE 함수 
SELECT
    first_name,
    hire_date
FROM
    employees
WHERE
    hire_date = TO_DATE('2006-11-15', 'yyyy-MM-dd');

--where절 비교연산자 사용
--비교연산자 => 숫자, 문자, 데이터타입 다 가능
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

--범위지정
SELECT
    employee_id,
    first_name,
    job_id,
    hire_date
FROM
    employees
WHERE
    hire_date NOT BETWEEN '2002-01-01' AND '2002-12-31'; --2002년도에 입사한 사람 제외한 모든사람

--IN : 조건들 중 하나만 만족
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
--WHERE first_name LIKE 'K%e%'; =>대문자 K로 시작하고 내부에 무조건 e가 존재
WHERE
    first_name LIKE 'K__e%'; -- 대문자K로 시작하고 네번째에 무조건 e가 존재하고 총 크기는 정해지지 않았다.

--논리연산자(적절한 위치에 ())
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
    commission_pct IS NULL; --상여금이 존재하는 사람들을 알수있다.

--odeer_by
SELECT employee_id, first_name, hire_date
FROM employees 
ORDER BY hire_date DESC; 

SELECT employee_id, first_name, hire_date 
FROM employees 
ORDER BY employee_id DESC, hire_date ASC; 

SELECT employee_id, first_name, hire_date 
FROM employees 
ORDER BY hire_date DESC, employee_id ASC; --hiredate먼저 내림한 후 그안에서 employeeid로 오름차순

--DESC : 내림차순, ASC: 오름차순 / 둘다 안쓰면 기본으로 오름차순이 기본

SELECT employee_id, first_name, salary, salary * 12 
FROM employees
ORDER BY 4 DESC; --4번째 칼럼에 대해 내림차순으로 출력하겟따.

SELECT employee_id, first_name, salary, salary * 12 annsal
FROM employees
ORDER BY annsal DESC; --4번째 칼럼에 대해 내림차순으로 출력하겠다.

SELECT employee_id, first_name
FROM employees
ORDER BY hire_date; --select절에 없는 컬럼이라도 가능

-- 회사의 부서 정보를 전부 확인하라 
SELECT *
FROM departments;

-- 사원번호와 이름과 월급을 출력하라
SELECT employee_id 사원번호, first_name || ' ' || last_name 이름, salary 월급
FROM employees;

DESC employees; --해당되는 테이블의 컬럼 확인

--사원번호, 이름, 업무코드, 입사일 출력
SELECT employee_id, first_name, job_id, hire_date "start date"
FROM employees;
-- 별칭 대소문자 구분 / 공백 / 특수문사 사용 할 경우 ""사용해야한다.

--현재 매니저직책을 맡고 있는 사원 번호를 구하세요
--단 중복값을 제거하고 출력
SELECT DISTINCT manager_id
FROM employees
WHERE manager_id IS NOT NULL
ORDER BY manager_id;

-- 매니저 아이디는 사원들을 관리하는 사람이 누군지 붙여놓은거
SELECT e.*, m.*
FROM employees e join employees m
 ON e.manager_id = m.employee_id
WHERE e.department_id = 50;

-- 사원들이 어떤 업무를 하고 있는지 출력
-- (단, 중복되는 값을 제거하고 출력)
SELECT DISTINCT job_id
FROM employees;







