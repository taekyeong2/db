--날짜함수
--오늘부터 10일 뒤의 날짜 
--날짜 함수에 10을 더하는건 단순히 더하는게 아니라 일수가 변함
SELECT  sysdate as today, sysdate + 10 as "After 10 Day"
FROM dual;

--시간도 같이 빠져서 정수로 나오지 않는다. => TRUNMC
SELECT TRUNC(TO_DATE('2022-12-31', 'YYYY-MM-DD') - sysdate) "올해 남은 날짜"
FROM dual;

--두 날짜 사이의 월수를 반환
--MONTHS_BETWEEN : (단위가 월) 사이값
SELECT sysdate Today, hire_date 입사일, MONTHS_BETWEEN(sysdate, hire_date)
FROM employees;

--연차구하기
SELECT sysdate Today, hire_date 입사일, 
    MONTHS_BETWEEN(sysdate, hire_date),
    TRUNC(MONTHS_BETWEEN(sysdate, hire_date)/12) || '년 ' ||
    TRUNC(MOD(MONTHS_BETWEEN(sysdate, hire_date),12)) || '개월'
FROM employees;

-- ADD_MONTHS : 현재날짜 기점으로 몇개월 후 -> 날짜로 반환되니까 반올림, 버림 할 필요없음
--              -6은 6개월 뺌
SELECT sysdate Today, 
    ADD_MONTHS(sysdate, 6) "After 6 Month"
FROM dual;

--LAST_DAY
--NEXT_DAY : 오늘로 부터 돌아오는 월요일
-- 날짜로 돌아오니까 날짜연산 사용가능
SELECT sysdate today,
    LAST_DAY(sysdate) "Month Last Day",
    NEXT_DAY(sysdate, '월'),
    NEXT_DAY(sysdate, '월') - sysdate
FROM dual;

--ROUND : 날짜타입으로 받아서 반올림 후 날짜타입으로 반환
SELECT sysdate today,
    ROUND(sysdate, 'DD') as "가까운 일",
    ROUND(sysdate, 'DAY') as "가까운 주 일요일",
    ROUND(sysdate, 'MON') as "가까운 달",
    ROUND(sysdate, 'YEAR') as "가까운 년도"
FROM dual;

--TRUNC
SELECT sysdate,
    ROUND(sysdate, 'MON'), --반올림
    TRUNC(sysdate, 'MON') --버림 (지금 지정한 날짜(기준)에서 일자와 시간 초기화(버림))
FROM dual;

--오버로딩 : 똑같은 이름이지만 내가 지정한 것에 따라 결과가 다름
--오버라이딩 : 상속관계에서 부모꺼를 다시 씀


--------------------------------------------------------------------------------
--날짜레 TO_CHAR : 날짜를 문자타입으로 출력 (내가 정해진 형식으로 한 줄이 하나인 값으로 출력)
--변환함수(문자는 ""표시)
SELECT TO_CHAR(sysdate, 'yyyy"년" MM"월" DD"일"') --날짜타입이 아니라 문자타입
FROM dual;

--2005년에 입사한 사원들 출력
SELECT employee_id, first_name, hire_date
FROM employees
WHERE TO_CHAR(hire_date, 'yyyy') = '2005';

SELECT TO_CHAR(hire_date, 'yyyy "년" DDSPTH Month HH:MI:SS PM')
FROM employees
WHERE department_id = 50;

--2022년 TWENTY-FIFTH 11월 11:05:10 오전
SELECT TO_CHAR(sysdate, 'yyyy"년" DDSPTH Month HH:MI:SS PM')
FROM dual;

--fm 공백이나 0을 제거
SELECT TO_CHAR(sysdate, 'fmyyyy"년" DDSPTH Month mon dd day dy HH24:MI:SS PM')
FROM dual;

--숫자에 TO_CHAR ( 정해준 형식으로 출력)
SELECT first_name, TO_CHAR(salary, 'L999,999.99') salary
FROM employees;

--$는 문자타입 -> 숫자로 변환해야한다. / 값은 숫자로 넣어주고 표기할때 to_char로 변환해줘야한다.
SELECT TO_CHAR((12*123), 'L99,999')
FROM dual;


--------------------------------------------------------------------------------
-- TO_NUMBER 
--타입만 문자일뿐 값이 숫자랑 같으면 그냥 쓰면됨 (포멧형식 필요 ㄴㄴ)
SELECT TO_NUMBER('10000') + 10000
FROM dual;

--정해진 형식으로 읽어서 숫자로 변환
SELECT TO_NUMBER('$1000', '$9999') +10000
FROM dual;

SELECT TO_NUMBER('$10,000', '$99,999') + 1234
FROM dual;

--------------------------------------------------------------------------------
--TO_DATE
--포멧을 정확하게 인지켜주면 인지를 못한다.
SELECT TO_DATE('2022년, 11월', 'YYYY"년", MM"월"')
FROM dual;

SELECT TO_DATE('99/05/23'),
    TO_CHAR(TO_DATE('99/05/23'), 'YYYY-MM-dd'),  --정해진 날짜 포맷이라서 형식모델은 생략가능(기본적으로 RR형식으로 읽음)
    TO_CHAR(TO_DATE('99/05/23', 'YY/MM/dd'), 'YYYY-MM-dd') -- yy는 현재 세기를 기반으로 읽는다. => 이전세기도 입력하려면 RR형식사용
FROM dual;

SELECT TO_DATE('11월 11, 99', 'MM"월" DD, RR')
FROM dual;

--각 사원의 이름과 근무 달 수 출력
--근무 달수 계산 방식 (입사일로부터 현재까지의 달 수, 반올림, 정스)
-- MONTHS_WORK로 컬럼명
-- 근무달 수가 많은 사람부터 보이도록 정렬
--ROUND(MONTHS_BETWEEN(sysdate, hire_date), 0) MONRHS_WORK => 근무달수
SELECT first_name, ROUND(MONTHS_BETWEEN(sysdate, hire_date), 0) MONTHS_WORK
FROM employees
ORDER BY MONTHS_WORK DESC;

