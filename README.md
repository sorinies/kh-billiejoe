# Billie Joe
Spring Framework(boot 아니고...)와 mybatis를 사용한 공간 대여 시스템 연습용 프로젝트.

## 레퍼런스
* https://www.spacecloud.kr/

## 개발환경
* Java SE 1.8
* AdoptOpenJDK 8
* Apache Tomcat 8.5
* Oracle 11g

### 사용된 라이브러리
* Spring Framework 5.2.8.RELEASE
* Apache Maven 3.8.1
   - ojdbc6
   - commons-fileupload
   - commons-dbcp2
   - jackson-databind
   - spring-websocket
   - gson
   - spring-security-core
   - spring-security-config
   - spring-jdbc
   - mybatis-spring
   - ... 자세한 것은 pom.xml의 dependency 확인...
* MyBatis
* taglibs
   - jstlel 1.2.5
   - impl 1.2.5
   - spec 1.2.5

## 프로젝트 설정 방법
팀원들을 위해 써놓습니다...

### Maven 사용 설정
1. 가능하면 새로운 Workspace에서 작업을 수행합니다. 이때 새로운 Workspace를 생성하면 개발환경을 모두 다시 설정해야 하기 때문에 자신의 상황에 맞춰 작업할 Workspace를 결정합시다.
2. 개발환경인 PC에 이미 설치되어 있는 Maven을 사용해도 무관하지만 저장소에 포함된 Maven을 임의의 위치에 위치시켜 사용하려면 `apache-maven-3.8.1/conf/settings.xml` 55번째 줄의 `<localRepository/>`를 본인의 개발환경에 맞게 수정해서 사용합니다.
3. 사용하는 IDE에서 Maven의 설정 위치를 지정합니다. (Eclipse, STS의 경우  `Preference -> Maven -> User Setting`에서 'User Setting'과 'Local Repository' 변경)
4. 설정이 완료됐다면 `pom.xml`에 등록되어 있는 의존성 항목들을 모두 다운로드 합니다. 

### DB 설정
1. 기본적으로 각자의 로컬 DB에서 작업하고, 모든 작업이 완료 되었을 때 원격DB로 연결합니다. 
2. 각자의 Oracle에서 아래 SQL 구문으로 사용자를 생성합시다.
```sql
CREATE USER billiejoe IDENTIFIED BY billiejoe_a0316;
GRANT RESOURCE, CONNECT, CREATE VIEW TO billiejoe;
```
3. 이 저장소의 루트에 있는 `billiejoe_scheme.xml` 파일을 `billiejoe` 사용자 권한으로 실행합니다. DROP 구문을 포함하고 있기 때문에 **반드시 한 구문씩 정상작동이 되는지 확인하면서 실행하세요!**
4. 테이블과 시퀀스가 정상적으로 생성됐는지 확인하세요.
5. 작업 중 **테이블 구조의 변경** 혹은 **새로운 시퀀스나 VIEW의 생성/수정**이 필요한 경우에는 팀원들에게 사전에 공유합니다.
6. 이후 팀 채널에 변경에 필요한 SQL 구문을 공유하고 그와 함께 변경되는 내용(SQL 구문)을 `billiejoe_scheme.xml`에 포함하여 커밋/푸시 합니다.