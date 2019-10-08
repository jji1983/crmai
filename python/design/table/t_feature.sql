drop table t_feature;

/***********************************************************************
 * 작 성 일 : 2019.6.19
 * 작 성 자 : Target AI 
 * 내   용 : 학습데이터 Feature 명과 속성을 저장하는 테이블
************************************************************************/

create table t_feature(
created				timestamp			default now(),
created_by			varchar(30)			default "current_user"(),
last_upd			timestamp			default now(),
last_upd_by			varchar(30)			default "current_user"(),
src_id				varchar(30),
feature_name		varchar(200),
feature_type		varchar(30)
);