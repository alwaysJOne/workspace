/*
    <시퀀스 SEQUENCE>
    자동으로 번호를 발생시켜주는 역할을 하는 객체
    정수값을 순차적으로 일정값씩 증가시키면서 생성해줌
    
    EX) 회원번호, 사원번호, 게시글번호...
*/

/*
    1. 시퀀스 객체 생성
    
    [표현식]
    CREATE SEQUENCE 시퀀스명
    [START WITH 시작숫자] --> 처음 발생시킬 시작값 지정[기본값 1]
    [INCREMENT BY 숫자] --> 몇씩 증가시킬 건지[기본값 1]
    [MAXVALUE 숫자] --> 최대값지정[기본값 엄청크다]
    [MINVALUE 숫자] --> 최소값 지정 [기본값 1]
    [CYCLE | NOCYCLE] --> 값 순환여부 지정 [기본값 NOCYCLE]
    [NOCACHE | CACHE 2] --> 캐시메모리 할당(기본값 CACHE 20)
    
    *캐시메모리 : 미리 발생될 값들을 생성해서 저장해두는 공간
                매번 호출될때마다 새로 번호를 생성하는게 아니라
                캐시메모리 공간에 미리 생성된 값들을 가져다 쓸 수 있다(속도가 빨라진다.)
                접속이 해제되면 --> 캐시메모리에 미리 만들어 둔, 번호들은 다 날라감
                
    테이블명 : TB_
    뷰명 : VW_
    시퀀스 : SEQ_
    트리거 : TRG_
*/

CREATE SEQUENCE SEQ_TEST;
--[참고] 현재 계정이 소유하고있는 시퀀스들의 구조를 보고자할 때
SELECT * FROM USER_SEQUENCES;

CREATE SEQUENCE SEQ_EMPNO
START WITH 300
INCREMENT BY 5
MAXVALUE 310
NOCYCLE
NOCACHE;

/*
    2. 시쿼스 사용
    
    시퀀스명.CURRVAL : 현재 시퀀스 값(마지막으로 성공한 NEXTVAL의 수행한 값)
    시퀀스명.NEXTVAL : 시퀀스값에 일정값을 증가시켜 발생한 값
                      현재 시퀀스 값에서 INCREMENT BY 값 만큼 증가된 값
*/

SELECT * FROM USER_SEQUENCES;

SELECT SEQ_EMPNO.CURRVAL FROM DUAL; -- ERROR
--> NEXTVAL를 한번도 수행하지 않은 이상 CURRVAL를 할 수 없음
--> 왜? CURRVAL는 마지막으로 성공한 NEXTVAL의 값을 저장해서 보여주는 임시값
SELECT SEQ_EMPNO.NEXTVAL FROM DUAL; --300
SELECT SEQ_EMPNO.CURRVAL FROM DUAL; --300
SELECT SEQ_EMPNO.NEXTVAL FROM DUAL; --305
SELECT SEQ_EMPNO.NEXTVAL FROM DUAL; --310

SELECT * FROM USER_SEQUENCES;
SELECT SEQ_EMPNO.NEXTVAL FROM DUAL; --315

/*
    3.시퀀스의 구조 변경
    
    ALTER SEQUENCE 시퀀스
    [INCREMENT BY 숫자] --> 몇씩 증가시킬 건지[기본값 1]
    [MAXVALUE 숫자] --> 최대값지정[기본값 엄청크다]
    [MINVALUE 숫자] --> 최소값 지정 [기본값 1]
    [CYCLE | NOCYCLE] --> 값 순환여부 지정 [기본값 NOCYCLE]
    [NOCACHE | CACHE 바이트크기] --> 캐시메모리 할당(기본값 CACHE 20)
    
    *START WITH는 변경이 불가
*/

ALTER SEQUENCE SEQ_EMPNO
INCREMENT BY 10
MAXVALUE 400;

SELECT SEQ_EMPNO.NEXTVAL FROM DUAL;

--4. 시퀀스 삭제
DROP SEQUENCE SEQ_EMPNO;

----------------------------------------------------------------------------------------
-- 사원번호로 사용할 시쿼스 생성
CREATE SEQUENCE SEQ_EID
START WITH 400
NOCACHE;

INSERT INTO EMPLOYEE(EMP_ID, EMP_NAME, EMP_NO, JOB_CODE, HIRE_DATE)
        VALUES(SEQ_EID.NEXTVAL, '김말똥', '111111-2111111', 'J6', SYSDATE);
