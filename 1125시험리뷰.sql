--3)
SELECT employee_id 사원번호, 
    first_name 이름, 
    salary 급여, 
    department_id 부서번호
FROM employees
WHERE (salary BETWEEN 7000 AND 12000) 
--검색 조건으로 대문자 H라서 UPPER 사용 (혹시 소문자가 들어가 있을수도 있으니까)
    AND UPPER(first_name) LIKE 'H%';
    
--5) 
SELECT first_name 이름,
    hire_date 입사일,
    ADD_MONTHS(hire_date, 6) "입사 6개월 뒤",
    NEXT_DAY(hire_date, '금') "입사 후 첫 금요일",
    --절삭(내림)/ 절상(올림)
    TRUNC(MONTHS_BETWEEN(sysdate, hire_date), 0) || '개월' as "총 근무개월",
-- 말일 + 1 => 다음달 1일
    LAST_DAY(hire_date) + 1 "첫 급여일"
FROM employees
ORDER BY hire_date;

--9)
SELECT employee_id 사원번호, 
    first_name 이름,
--산술 연산식에 null이 존재하면 값이 나오지 않음 => 반드시 null연산자로 처리 해줘야함
--NVL은 칼럼과 나타나는 값이 타입이 맞아야한다. 칼럼값이랑 같이 출력되니까
    (salary + salary * NVL(commission_pct, 0))*12 연봉,
-- 그냥 형식 정해주고 출력 // (날짜 숫자 타입은 입력받은 것을 형식없이 그냥 출력해줌)
    TO_CHAR(hire_date, 'yyyy"년도"') "입사한 연도",
--NVL2는 칼럼과 형식 안맞춰줘도 뒤의 두개의 값만 맞춰줘도 됨다. (칼럼은 출력안되니까)
    NVL2(commission_pct, 'COMM', 'NOCOMM') 비고,
    department_id 부서번호
FROM employees
ORDER BY department_id, 연봉;