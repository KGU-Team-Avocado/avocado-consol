Avocado ConSol 프로젝트
=============
경기대학교 소프트웨어중심대학 산학협력 상상기업 프로젝트

[홈페이지에서 확인하기](http://)

🟥🟧🟨🟩🟦🟪🟫⬛⬜
>경기대학교 소프트웨어중심대학
> >이은정 지도교수님 (경기대학교 AI컴퓨터공학부)<br>이종민 지도교수님 (경기대학교 산학협력단)

>기업 전문가
> >박영송 대표님 (위드경영컨설팅)

* * *
## Team Avocado ConSol
### Developers
- 윤주현(201713919) [Project Manager]
  > [Front-end] [Back-end] [Server Management] [Test] <br>
  > github@gabrielyoon7


***
## Update Log
- 2021.10.03
  - [윤주현]
    - 프로젝트 생성

* * *
## Project Structure

* .idea
  > IntelliJ 관련 설정. 컴퓨터마다 환경이 달라질 수 있습니다.
  > >❌❌❌절대로 Github에 전송하지 마세요.❌❌❌
* lib
  > 자바 프로젝트에서 사용 하는 외부 라이브러리(*.jar)를 모아 놓은 폴더입니다. 특정 클래스를 사용하려면 해당 라이브러리가 필요하며, 추가되는 경우 이 폴더에 등록해줘야 합니다. 최초 클론 시, 인텔리제이에 라이브러리 등록이 필요합니다.
* out
  >  컴파일 시 생성되는 임시 폴더로, 이 폴더를 기반으로 프로그램을 실행하게 됩니다. 예를들어 실행 후, 파일을 첨부하는 경우 이 폴더에 저장이 됩니다. run 할때마다 out 폴더가 새롭게 생성됩니다. WAR파일을 생성하는 경우에도 out폴더에 들어오게됩니다.
  > > ❌❌❌절대로 Github에 전송하지 마세요.❌❌❌
* ### src
  >  Web Server를 담당합니다. Java로 작성합니다.
  * kr.ac.kyonggi.avocado-consol
    * common
      > 이 프로젝트의 뼈대를 잡고 있는 클래스들입니다. 절대로 수정하지 말아주세요.
      > >수정 시 반드시 수정 사유를 공유할 것
      * controller
        > 요청으로 인해 실행되는 클래스인 Controller가 들어있습니다. Tomcat과 직접 통신합니다. 또, Action Interface가 들어있어 Controller를 조금 더 쉽게 다룰 수 있도록 돕습니다.
      * filter
        > UTF-8설정 등을 담당합니다. 모든 페이지가 실행될 때 이 클래스가 영향을 끼치곤 합니다.
      * index
        > 레거시 코드
      * sql
        > sql 로그인을 대신 해주는 Config클래스가 있습니다.
    * handler
      > 이 패키지는 저희가 100% 구현해야하는 부분입니다.
      * action
        > Controller 클래스로부터 실행이 되는 Action 클래스들이 모여있습니다.
        ```java
        //action 코드 예시
        public class TestAction implements Action {
            @Override
            public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
                Gson gson = new Gson();
                request.setAttribute("getSomething", gson.toJson(TestDAO.getInstance().getSomething(1)));
                return "RequestDispatcher:test.jsp";
            }
        }
        ```
      * dao
        > 쿼리문을 직접 작성하는 클래스들 입니다.
        > > DBUtils 라이브러리를 사용하며, mariaDB와 직접 통신합니다.
           ```java
           //DAO클래스 예시
           public class TestDAO {
               public static TestDAO it;
               public static TestDAO getInstance() { //인스턴스 생성
                   if (it == null)
                        it = new TestDAO();
                   return it;
               }
           //테스트 메소드
           public ArrayList<TestDTO> getSomething(int num) {
               ArrayList<TestDTO> result = null;
               List<Map<String, Object>> list = null;
               Connection conn = Config.getInstance().sqlLogin();
               try {
               QueryRunner queryRunner = new QueryRunner();
               list = queryRunner.query(conn, "SELECT * FROM customer WHERE oid=?", new MapListHandler(), num);
               } catch (SQLException e) {
               e.printStackTrace();
               } finally {
               DbUtils.closeQuietly(conn);
               }
               Gson gson = new Gson();
               result = gson.fromJson(gson.toJson(list), new TypeToken<List<TestDTO>>() {
               }.getType());
               return result;
               }
           }
           ```
        * DTO
          > mariaDB로 부터 받은 DB를 자바 클래스에 태우기 위한 클래스입니다.
          > > DB 테이블 하나 당 DTO 한 개가 존재한다고 생각하시면 편합니다.
          ```java
          public class TestDTO {
              private String oid;
              private String name;
              private String phoneNumber;
              public String getOid() {return oid;}
              public void setOid(String oid) {this.oid = oid;}
              public String getName() {return name;}
              public void setName(String name) {this.name = name;}
              public String getPhoneNumber() {return phoneNumber; }
              public void setPhoneNumber(String phoneNumber) {this.phoneNumber = phoneNumber;}
          }
          ```


* ### web
  > View를 담당합니다. JSP로 작성합니다.
  * css
    > JSP에서 사용 할 css를 모아놓은 폴더입니다.
  * js
    > JSP에서 사용 할 js를 모아놓은 폴더입니다.
  * WEB-INF
    * jsp
      > JSP에서 *.kgu 형식으로 된 action클래스를 요청합니다.
      > > *.kgu 형식의 경로는 class.properties에서 찾을 수 있습니다.
      
      > 앞선 Action 클래스에서 정의된 DB를 받아와서 JS로 가공한 후, HTML에 삽입합니다.
      ```html
      //앞선 설정으로 setAttribute 된 자바 변수를 JSP에서 받는 예시 (JQuery와 JSP문법을 사용하여 데이터를 가공한 후, id에 넘겨서 삽입함.)
      <script> 
      $(document).ready(function(){
          makeinfo1();
      })
      function makeinfo1(){
          var data = <%=getSomething%>;
          var list = $('#testDataPrinter');
          var text = '';
          text+= '<div>'+'oid : '+data[0].oid+'/ name : '+data[0].name+'/ phoneNumber : '+data[0].phoneNumber+'</div>';
          list.append(text);
      }
      </script>
      ```
    * lib
      > 웹에서 사용할 라이브러리를 넣습니다.
* * *
## How To Deploy
- 프로젝트 생성 방법 (나중에 비슷한 방법으로 새 프로젝트로 독립하고 싶은 경우 참고)
  > https://leirbag.tistory.com/80
- 프로젝트 실행 방법
  > https://leirbag.tistory.com/81
- mariaDB 설치 방법
  > https://leirbag.tistory.com/46
  - db 적용 방법
    > https://leirbag.tistory.com/47
  - 컴파일러에서 db 오류 발생 시
    > https://leirbag.tistory.com/48
* * *
## How it works
- 메인화면이 뜨기까지의 동작과정
- 로그인
- ㅇㅇ


* * *
## Tools
- IntelliJ Ultimate 2021.1
- Tomcat 9.0.48
  > 현 시점의 Tomcat 10에서는 javax를 지원하지 않아 업데이트하면 안됩니다. server api를 인식하지 못하는 문제가 있음.
- JSP
- MariaDB 10.5
  > mysql과 다르게 대소문자를 확실히 지켜야 합니다.
- DBUtils  
- Java EE8
- Bootstrap 5.0
- JQuery
- Ajax
* * *
## References
- JSP와 Servlet(서블릿) 비교
  > https://m.blog.naver.com/acornedu/221128616501
- Ajax는 왜 필요한가?
  > https://www.youtube.com/watch?v=_Kh5Kdha3Ww
- js, jQuery, Ajax에 관한 설명
  > https://www.nextree.co.kr/p9521/
* * *
