# Gompang.com

Gompang.com은 Spring Boot, Spring Security, JSP, MariaDB를 기반으로 개발된 웹 애플리케이션입니다. 이 프로젝트는 사용자 관리, 제품 관리 등의 기능을 제공하며, Spring 프레임워크의 강력한 기능을 활용하여 개발되었습니다.

## 목차
- [기술 스택](#기술-스택)
- [설치 및 실행](#설치-및-실행)
- [주요 기능](#주요-기능)
- [기여 방법](#기여-방법)
- [라이선스](#라이선스)

## 기술 스택
- **Spring Boot**
- **Spring Security**
- **JSP (JavaServer Pages)**
- **MariaDB**

## 설치 및 실행

### 사전 요구 사항
- Java 8 이상
- Gradle 6.0 이상
- MariaDB 설치 및 설정

### 설치 방법
1. 레포지토리를 클론합니다.
    ```sh
    git clone https://github.com/Sunny-window/Gompang.com.git
    cd Gompang.com/gompang
    ```

2. 데이터베이스 설정
    - MariaDB에 접속하여 SQL 파일들을 실행해 데이터베이스와 테이블을 설정합니다.
    ```sh
    mysql -u root -p < gompang_0530_2150.sql
    ```

3. `application.properties` 파일을 수정하여 데이터베이스 연결 정보를 입력합니다.
    ```properties
    spring.datasource.url=jdbc:mariadb://localhost:3306/yourdbname
    spring.datasource.username=yourusername
    spring.datasource.password=yourpassword
    spring.jpa.hibernate.ddl-auto=update
    ```

4. 프로젝트를 빌드하고 실행합니다.
    ```sh
    ./gradlew clean build
    ./gradlew bootRun
    ```

5. 웹 브라우저에서 `http://localhost:8080`에 접속합니다.

## 주요 기능
- **사용자 관리**: 회원가입, 로그인, 사용자 정보 수정
- **상품 관리**: 제품 추가, 조회, 수정, 삭제, 장바구니에 추가, 조회, 수정, 삭제
- **보안**: Spring Security를 이용한 사용자 인증 및 권한 관리

## 기여 방법
1. 레포지토리를 포크합니다.
2. 새로운 브랜치를 만듭니다.
    ```sh
    git checkout -b feature/your-feature-name
    ```
3. 변경 사항을 커밋합니다.
    ```sh
    git commit -m "Add some feature"
    ```
4. 브랜치에 푸시합니다.
    ```sh
    git push origin feature/your-feature-name
    ```
5. Pull Request를 생성합니다.
