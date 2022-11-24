--data => infromation
/* SELECT : 출력할 컬럼을 정함
            출력할 순서, 양식도 함께 정함
   FROM : 조회할 대상
   WHERE : 검색조건, 필터
   ORDER BY : 정렬 담당(단위 컬럼별로)

  산술, 연결 -> SELECT 
  비교, is null, like, inbetween 논리
  ** 결과가 boolean 타입이라서 select에서는 쓸수없다. (오라클은 boolean타입 ㄴㄴ)
  => WHERE 에서 다 사용 가능 */
  
--입사일이 2003년 10월 이후인 사원의 이름과, 업무, 매니저를 출력
SELECT first_name, job_id, manager_id
FROM employees
WHERE hire_date > '2003-10-31';

--급여가 15000달러 이상인 사원의 부서와 이름과 입사일을 출력
--단 부서를 기준으로 정렬하세요.
SELECT department_id, first_name, hire_date
FROM employees
WHERE salary >= 15000
ORDER BY department_id;

--사원번호가 150에서 230사이인 사람들의 이름과 업무와 급여 그리고 연봉을 출력하세요
--단, 동일한 업무간에선 급여를 기준으로 내림차순해주세요
SELECT first_name, job_id, salary, salary * 12 as annsal
FROM employees
WHERE employee_id BETWEEN 150 AND 230
ORDER BY job_id ASC, salary;

--급여가 5000에서 12000사이에 포함되는 모든 사원의 이름과 부서, 업무순으로 출력
--단 같은 부서일 경우 순서대로 출력하도록 SQL문을 구성하세요.
SELECT first_name, department_id, job_id
FROM employees
WHERE salary BETWEEN 5000 AND 12000
ORDER BY department_id;

-- 매니저가 100번이거나 103인 사원의 사원번호와 이름 입사일 출력
SELECT employee_id, first_name, hire_date
FROM employees
WHERE manager_id IN (100 , 103);
--between은 범위 in은 지정한 값에서만

-- 업무가 it_prog 이거나 fi_mgr인 사원의 사원번호와 이름 소속부서 출력
--단 정렬기준 급여 내림차순
SELECT employee_id, first_name, department_id
FROM employees
WHERE job_id IN ('IT_PROG','FI_MGR')
ORDER BY salary DESC; 
--order by는 해당 SELECT절만 정렬하는게 아니라 모든 테이블 데이터들을 정렬함

-- *** like에서만 '%'와 '_'가 사용된다.
--이름이 대문자 k로 시작하거나 대문자 d로 시작하는 사원의 정보 출력
SELECT *
FROM employees 
WHERE first_name LIKE 'K%' OR first_name Like 'D%';
--***LIKE는 각각의 컬럼에만 적용됨
--***AND OR 은 컬럼과 연산자를 한쌍으로 해서 나열하는것

--회사의 업무 중에 영업(Sales)과 관려된 업무와 함깨 최소 연봉과 최대연봉 출력
--정렬기준은 최대연봉 내림차순으로 정렬
SELECT job_title as 업무, min_salary as 최소연봉, max_salary as 최대연봉
FROM jobs
WHERE job_title LIKE '%Sales%'
ORDER BY max_salary DESC;

-- 현재 매니저가 존재하지 않는 사원의 정보를 모두 출력
SELECT * 
FROM employees
WHERE manager_id IS NULL;

--커미션이 존재하는 사원들의 부서를 중복없이 출력
SELECT DISTINCT department_id
FROM employees
WHERE commission_pct IS NOT NULL AND department_id IS NOT NULL;

--업무가 영업사원(SA_REP)또는 단순사무워(ST_CLERK)이면서 
--급여가 2500이거나 3500혹은 7000이 아닌 
--모든 사원의 이름과 업무 급여출력
--정렬기준 사원번호
SELECT first_name, job_id, salary
FROM employees
WHERE job_id IN ('SA_REP','ST_CLERK') AND salary NOT IN (2500, 3500, 7000)
ORDER BY employee_id;
-- OR이 AND보다 우선순위 낮다 OR 먼저 실행시킬려면 ()

--커미션 비율이 급여의 20%인 모든 사원의 이름과 급여 및 커미션 출력
SELECT first_name, salary, commission_pct * salary as commission
FROM employees
WHERE commission_pct = .2;


-------------------------------------------------------------------------------------------------------------------
--UNION
--employees_id가 가진 행의 수와 department_id 행의수가 모두 출력(중복이 안되니까)
--컬럼명은 첫번째 SELECT 이름 기준으로 표시됨
--지금 ORDER BY는 첫번째 셀렉트절에만 있는 컬럼만 정렬 가능 => 유니온은 셀렉트 절에서 표기한 값만 복사해서 가져오는것이기때문
--(SELECT 절의 ORDER BY는 select절 에 있는 모든 컬럼을 정렬하는 거니까 절에 없느 ㄴ컬럼도 가능하지만..)
SELECT employee_id, first_name
FROM employees
WHERE commission_pct IS NOT NULL
UNION
SELECT department_id, department_name
FROM departments
ORDER BY employee_id;

--UNION ALL 
--중복값 제거안됨, 정렬안됨
SELECT employee_id, first_name
FROM employees
WHERE manager_id = 103
UNION ALL
SELECT employee_id, first_name
FROM employees
WHERE employee_id BETWEEN 100 AND 105
ORDER BY employee_id;

--MINUS (순서중요)
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
--함수
--DUAL TABLE
--sysdate : 현재날짜 함수 (독특한 함수라서 ()가 없음)
SELECT sysdate FROM dual;
SELECT * FROM dual;
SELECT 100 + 100 FROM dual;

--------------------------------------------------------------------------------
--문자조작 함수
--'hElLo WoRLd'
SELECT LOWER('hElLo WoRLd')
FROM dual;

SELECT LOWER(first_name)
FROM employees;

SELECT UPPER('hElLo WoRLd')
FROM dual;

SELECT UPPER(first_name)
FROM employees;
 
--initcap : 단어단위로 각단의 첫글자만 대문자 나머지 소문자 
--          공백을 기준으로 단어를 인식
SELECT INITCAP('hElLo WoRLd')
FROM dual;

--CONCAT // 실제로는 연결연산자||를 많이 쓴다.
SELECT CONCAT(first_name, last_name)
FROM employees;

SELECT CONCAT (CONCAT(first_name,' '), last_name)
FROM employees;
SELECT first_name || ' ' || last_name
FROM employees;

--SUBSTR(원본데이터, 시작위치, 잘라낼글자수)
--ㄴsql에는 index의 개념이 없어서 1부터 시작함
SELECT SUBSTR('Hello World', 5, 3 )
FROM dual;

SELECT SUBSTR(first_name, 1,3)
FROM employees;

--length 
--공백도 인식 => TRIM함수 같이 사용
SELECT LENGTH (TRIM('     Hello World'))
FROM dual;

SELECT first_name, LENGTH(first_name)
FROM employees;

--LENGTHB : 바이트 기준으로 길이 (한글 한글자가 3바이트)
SELECT LENGTH('안녕하세요'), LENGTHB('안녕하세요')
FROM dual;

--INSTR(문자열, 찾을 문자열 [,시작위치 [,검색차수]])
SELECT INSTR('Hello World', 'l')
FROM dual;

SELECT INSTR('Hello World', 'l', 5)
FROM dual;

SELECT INSTR('Hello World', 'l', 1, 3)
FROM dual;

--LPAD / RPAD (문자열, 글자수, 공백채울것)
--포맷이 균열
SELECT LPAD('hello', 10, ' '), RPAD('hello', 10, ' ')
FROM dual;

SELECT RPAD(last_name, 20, ' ') || LPAD(first_name, 20,' ')
FROM employees
UNION
SELECT last_name || ' ' || first_name
FROM employees;

--TRIM( [ [ LEADING | TRAILING | BOTH | trim_character FROM ] trim_source )
-- trim_source : 원본데이터 (필수)
--(생략가능) trim_character: 제거하고자 하는 문자 (' '이 디폴트)
--          LEADING(앞) | TRAILING(뒤) | BOTH(앞뒤 -> 디폴트) => 제거할 위치 지정
SELECT TRIM('          Hello World       ')
FROM dual;

SELECT TRIM(' ' FROM '          Hello World       ')
FROM dual;

SELECT TRIM(BOTH ' ' FROM '          Hello World       ')
FROM dual;

--'ddddYEDAMdddd'
SELECT TRIM(TRAILING 'd' FROM 'ddddYDEAMdddd')
FROM dual;

--이름이 대문자 k로 시작하거나 대문자 d로 시작하는 사원의 정보 출력
SELECT employee_id, first_name
FROM employees 
WHERE UPPER(SUBSTR(first_name, 1, 1)) IN ('K', 'D');

--------------------------------------------------------------------------------
--숫자함수 
--ROUND (실수 [, 정수(반올림위치)]) 
--TRUNC (실수 [, 정수(버림위치)])
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

--MOD => 나머지
--TRUNC => 순수한 몫만 구하고 싶음 TRUNC사용
SELECT TRUNC(15/2),MOD(15, 2)
FROM dual;

--------------------------------------------------------------------------------
--**cf) 문자함수에서 음수를 시작위치로 두는것은 뒤에서 부터 한다는 뜻 
SELECT first_name, SUBSTR(first_name, -3, 2)
FROM employees;

--문자대체
SELECT REPLACE('oracle database', 'oracle', 'mysql')
FROM dual;

-------------------------------------------------------------------------------------------------------------------


--현재 날짜를 표시하세요, 컬럼의 이름은 Date로 합니다.
SELECT sysdate as "Date"
FROM dual;

--커미션이 없는 사원의 경우 15%인상율을 적용하고 정수로 표기하도록 하겠씁니다.
-- 사원 번호, 이름, 급여, 15퍼 인상된 급여순으로 출력
-- 인상된 급여의 별칭은 New Salary 라고 지정 
SELECT employee_id, first_name, salary, TRUNC(salary + salary * 0.15 ) as "New Salary"
FROM employees
WHERE commission_pct IS NULL;

--커미션이 있는 경우 각 사원의 연봉을 구하고 정수(반올림, 표시숫자단위는 백자리)로 표기
--사원번호, 이름, 업무, 급여와, 연봉순으로 출력 연봉 별칭 Year Salary
--연봉이 높은 순으로 정렬
SELECT employee_id, first_name, salary, ROUND(((salary + salary * commission_pct) * 12), -2) as "Year Salary"
FROM employees
WHERE commission_pct IS NOT NULL
ORDER BY "Year Salary" DESC;
--ORDER BY 5 DESC;

--커미션이 없는 사원의 경우 15%인상율을 적용하고 정수로 표기하도록 하겠씁니다.
-- 사원 번호, 이름, 급여, 15퍼 인상된 급여순으로 출력
-- 인상된 급여의 별칭은 New Salary 라고 지정 
--  ++ 위의 문제의 질의(쿼리)를 수정하여 새 급여에서 이전 급여를 빼는 열을 추가하고 이름은 Increase로 지정한다.
SELECT employee_id, first_name, salary, TRUNC(salary + salary * 0.15 ) as "New Salary",
       (TRUNC(salary + salary * 0.15 )-salary) as "Increase"
FROM employees
WHERE commission_pct IS NULL;

CREATE TABLE number_tbl(
    x NUMBER NOT NULL
);
SELECT * FROM number_tbl;
INSERT INTO number_tbl VALUES (1);

--number_tbl에서 짝수만 출력
SELECT  x, '짝수'
FROM number_tbl
WHERE MOD(x, 2) = 0;

-- 홀수만 출력
SELECT x, '홀수'
FROM number_tbl
WHERE MOD(x, 2) = 1;

--각 행별로 짝수 홀수인지 출력
SELECT  x, '짝수'
FROM number_tbl
WHERE MOD(x, 2) = 0
UNION
SELECT x, '홀수'
FROM number_tbl
WHERE MOD(x, 2) <> 0
ORDER BY x ;

-- 부서번호가 50인 사원들의 급여와 부서번호가 90이상인 사원들의 급여중
--공통된 급여를 조회하새요
--출력은 급여만, 금액이 높은 순으로 정렬
SELECT salary
FROM employees
WHERE department_id = 50
INTERSECT
SELECT salary
FROM employees
WHERE department_id >= 90
ORDER BY salary DESC;

--이름이  대소문자 구분없이 J A 또는 M 으로 시작하는 모든 사원의 
--이름 (대소문자 구분)및 이름 길이를 표시하는 질의를 작성하고 
-- 각 열에 적합한 칼럼명을 지정하세요, 단 사원의 이름을 기준으로 오름차순 정열
SELECT  INITCAP(first_name) as "이름",
        LENGTH(first_name) as "이름길이"
FROM employees
WHERE UPPER(SUBSTR(first_name, 1, 1)) IN ('J', 'A', 'K')
--WHERE LOWER(SUBSTR(first_name, 1, 1)) IN ('j', 'a', 'k')
ORDER BY first_name;


--사원들 중에서 업무가 마케팅(MK)과 관련이 있거나 영업(SA)과 관련이 있는 경우
-- 해당 사원의 사원번호, 이름, 업무, 급여를 정해진 문장으로 출력
--사원번호 1**인 AB**** 는 업무를 맡고 있으며 급여는 123(천단위) 입니다.
SELECT
'사원번호 '
|| RPAD(SUBSTR(employee_id, 1, 1), 3, '*')
|| '인 ' || RPAD(SUBSTR(first_name, 1, 2), LENGTH(first_name), '*')
|| '는 ' || job_id || '를 맡고 있으며 급여는 ' || TRUNC(salary/1000) 
|| '(천단위) 입니다.'
FROM employees
WHERE UPPER(SUBSTR(jon_id, 1, 2)) IN ('MK', 'SA');

--UPPER(job_id) LIKE '%MK%' OR UPPER(job_id) LIKE '%SA%'
-- 사원번호 TRUNK(employee_id/100) => RPAD(TRUNC(employee_id/100),3,'*')
-- 이름 (SUBSTR(first_name, 1,2) => RPAD


-------------------------------------------------------------------------------------------------------------------
--날짜함수 


