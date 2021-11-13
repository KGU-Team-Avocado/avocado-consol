<%--
  Created by IntelliJ IDEA.
  User: gabri
  Date: 2021-10-05
  Time: 오후 10:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String team = (String)request.getAttribute("team");
%>
<!DOCTYPE html>
<html lang="en">
<body id="page-top">
<%@include file="header.jsp" %>
<!-- Masthead-->
<header class="masthead">
    <div class="container">
        <div class="masthead-subheading">아보카도 콘솔에 오신 것을</div>
        <div class="masthead-heading text-uppercase">환영합니다</div>
        <%
            if (user == null) {
        %>
        <a class="btn btn-primary btn-xl text-uppercase" href="loginPage.avocado">로그인</a>
        <%
            } else {
        %>
        <a class="btn btn-primary btn-xl text-uppercase" href="logout.avocado">로그아웃</a>
        <%
            }
        %>
    </div>
</header>

<!-- Services-->
<section class="page-section" id="services">
    <div class="container">
        <div class="text-center">
            <h2 class="section-heading text-uppercase">Services</h2>
            <h3 class="section-subheading text-muted">Lorem ipsum dolor sit amet consectetur.</h3>
        </div>
        <div class="row text-center">
            <div class="col-md-4">
                        <span class="fa-stack fa-4x">
                            <i class="fas fa-circle fa-stack-2x text-primary"></i>
                            <i class="fas fa-shopping-cart fa-stack-1x fa-inverse"></i>
                        </span>
                <h4 class="my-3">E-Commerce</h4>
                <p class="text-muted">온라인 거래 플랫폼이 필요하세요?</p>
            </div>
            <div class="col-md-4">
                        <span class="fa-stack fa-4x">
                            <i class="fas fa-circle fa-stack-2x text-primary"></i>
                            <i class="fas fa-laptop fa-stack-1x fa-inverse"></i>
                        </span>
                <h4 class="my-3">Workstation</h4>
                <p class="text-muted">업무용 플랫폼이 필요하세요?</p>
            </div>
            <div class="col-md-4">
                        <span class="fa-stack fa-4x">
                            <i class="fas fa-circle fa-stack-2x text-primary"></i>
                            <i class="fas fa-lock fa-stack-1x fa-inverse"></i>
                        </span>
                <h4 class="my-3">Security</h4>
                <p class="text-muted">저희 아보카도 콘솔은 뛰어난 보안을 자랑합니다.</p>
            </div>
        </div>
    </div>
</section>
<!-- Portfolio Grid-->
<section class="page-section bg-light" id="portfolio">
    <div class="container">
        <div class="text-center">
            <h2 class="section-heading text-uppercase">Family</h2>
            <h3 class="section-subheading text-muted">아보카도 콘솔에서 지원하고 있는 홈페이지 입니다.</h3>
        </div>
        <div class="row">
            <div class="col-lg-4 col-sm-6 mb-4">
                <!-- Portfolio item 1-->
                <div class="portfolio-item">
                    <a class="portfolio-link" href="withHome.avocado">
                        <div class="portfolio-hover">
                            <div class="portfolio-hover-content"><i class="fas fa-plus fa-3x"></i></div>
                        </div>
                        <img class="img-fluid" src="/theme/main/assets/img/portfolio/1.jpg" alt="..."/>
                    </a>
                    <div class="portfolio-caption">
                        <div class="portfolio-caption-heading">위드경영컨설팅</div>
                        <div class="portfolio-caption-subheading text-muted">(주)위드경영컨설팀</div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-sm-6 mb-4">
                <!-- Portfolio item 2-->
                <div class="portfolio-item">
                    <a class="portfolio-link" href="http://cs.kyonggi.ac.kr:8080/webp/Index">
                        <div class="portfolio-hover">
                            <div class="portfolio-hover-content"><i class="fas fa-plus fa-3x"></i></div>
                        </div>
                        <img class="img-fluid" src="/theme/main/assets/img/portfolio/1.jpg" alt="..."/>
                    </a>
                    <div class="portfolio-caption">
                        <div class="portfolio-caption-heading">AI컴퓨터공학부 컴퓨터공학전공</div>
                        <div class="portfolio-caption-subheading text-muted">경기대학교</div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-sm-6 mb-4">
                <!-- Portfolio item 3-->
                <div class="portfolio-item">
                    <a class="portfolio-link" href="http://ai.kyonggi.ac.kr:8080/webp/Index">
                        <div class="portfolio-hover">
                            <div class="portfolio-hover-content"><i class="fas fa-plus fa-3x"></i></div>
                        </div>
                        <img class="img-fluid" src="/theme/main/assets/img/portfolio/1.jpg" alt="..."/>
                    </a>
                    <div class="portfolio-caption">
                        <div class="portfolio-caption-heading">AI컴퓨터공학부 인공지능전공</div>
                        <div class="portfolio-caption-subheading text-muted">경기대학교</div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-sm-6 mb-4">
                <!-- Portfolio item 4-->
                <div class="portfolio-item">
                    <a class="portfolio-link" href="http://swaig.kyonggi.ac.kr:8080/main.kgu">
                        <div class="portfolio-hover">
                            <div class="portfolio-hover-content"><i class="fas fa-plus fa-3x"></i></div>
                        </div>
                        <img class="img-fluid" src="/theme/main/assets/img/portfolio/1.jpg" alt="..."/>
                    </a>
                    <div class="portfolio-caption">
                        <div class="portfolio-caption-heading">소프트웨어중심대학 SWAIG</div>
                        <div class="portfolio-caption-subheading text-muted">경기대학교</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- About-->
<section class="page-section" id="about">
    <div class="container">
        <div class="text-center">
            <h2 class="section-heading text-uppercase">About</h2>
            <h3 class="section-subheading text-muted">저희 아보카도 콘솔이 걸어온 길 입니다.</h3>
        </div>
        <ul class="timeline">
            <li>
                <div class="timeline-image"><img class="rounded-circle img-fluid"
                                                 src="/theme/main/assets/img/about/1.jpg" alt="..."/></div>
                <div class="timeline-panel">
                    <div class="timeline-heading">
                        <h4>2021.08</h4>
                        <h4 class="subheading">팀 결성</h4>
                    </div>
                    <div class="timeline-body"><p class="text-muted">CS-HOME에서 활동하는 학생 4명에서 처음으로 팀을 만들었습니다.</p></div>
                </div>
            </li>
            <li class="timeline-inverted">
                <div class="timeline-image"><img class="rounded-circle img-fluid"
                                                 src="/theme/main/assets/img/about/2.jpg" alt="..."/></div>
                <div class="timeline-panel">
                    <div class="timeline-heading">
                        <h4>2021.09</h4>
                        <h4 class="subheading">팀 확장</h4>
                    </div>
                    <div class="timeline-body"><p class="text-muted">팀원 10명을 충원하여 아보카도 팀을 구성했습니다.</p></div>
                </div>
            </li>
            <li>
                <div class="timeline-image"><img class="rounded-circle img-fluid"
                                                 src="/theme/main/assets/img/about/3.jpg" alt="..."/></div>
                <div class="timeline-panel">
                    <div class="timeline-heading">
                        <h4>2021.10</h4>
                        <h4 class="subheading">웹 기술 학습</h4>
                    </div>
                    <div class="timeline-body"><p class="text-muted">웹 서버를 구성하기 위해 여러가지 학습을 경험했습니다.</p></div>
                </div>
            </li>
            <li class="timeline-inverted">
                <div class="timeline-image"><img class="rounded-circle img-fluid"
                                                 src="/theme/main/assets/img/about/4.jpg" alt="..."/></div>
                <div class="timeline-panel">
                    <div class="timeline-heading">
                        <h4>2021.10</h4>
                        <h4 class="subheading">프로젝트 구현</h4>
                    </div>
                    <div class="timeline-body"><p class="text-muted">한 달여간 학습했던 기술을 가지고 실제로 프로젝트를 구현했습니다.</p></div>
                </div>
            </li>
            <li class="timeline-inverted">
                <div class="timeline-image">
                    <h4>
                        저희와<br>
                        함께<br>
                        하세요!
                    </h4>
                </div>
            </li>
        </ul>
    </div>
</section>
<!-- Team-->
<section class="page-section bg-light" id="team">
    <div class="container">
        <div class="text-center">
            <h2 class="section-heading text-uppercase">Team Members</h2>
            <h3 class="section-subheading text-muted">아보카도 콘솔 팀원을 소개합니다.</h3>
        </div>
        <%--        팀원 명단이 등장할 위치 --%>
        <div class="row" id="team_members"></div>
        <div class="row">
            <div class="col-lg-8 mx-auto text-center"><p class="large text-muted">함께 하실 분들을 찾습니다.</p></div>
        </div>
    </div>
</section>
<!-- Clients-->
<div class="py-5">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-md-3 col-sm-6 my-3">
                <a href="#!"><img class="img-fluid img-brand d-block mx-auto"
                                  src="/theme/main/assets/img/logos/microsoft.svg" alt="..."/></a>
            </div>
            <div class="col-md-3 col-sm-6 my-3">
                <a href="#!"><img class="img-fluid img-brand d-block mx-auto"
                                  src="/theme/main/assets/img/logos/google.svg" alt="..."/></a>
            </div>
            <div class="col-md-3 col-sm-6 my-3">
                <a href="#!"><img class="img-fluid img-brand d-block mx-auto"
                                  src="/theme/main/assets/img/logos/facebook.svg" alt="..."/></a>
            </div>
            <div class="col-md-3 col-sm-6 my-3">
                <a href="#!"><img class="img-fluid img-brand d-block mx-auto" src="/theme/main/assets/img/logos/ibm.svg"
                                  alt="..."/></a>
            </div>
        </div>
    </div>
</div>
<!-- Contact-->
<section class="page-section" id="contact">
    <div class="container">
        <div class="text-center">
            <h2 class="section-heading text-uppercase">Contact Us</h2>
            <h3 class="section-subheading text-muted">Lorem ipsum dolor sit amet consectetur.</h3>
        </div>
        <!-- * * * * * * * * * * * * * * *-->
        <!-- * * SB Forms Contact Form * *-->
        <!-- * * * * * * * * * * * * * * *-->
        <!-- This form is pre-integrated with SB Forms.-->
        <!-- To make this form functional, sign up at-->
        <!-- https://startbootstrap.com/solution/contact-forms-->
        <!-- to get an API token!-->
        <form id="contactForm" data-sb-form-api-token="API_TOKEN">
            <div class="row align-items-stretch mb-5">
                <div class="col-md-6">
                    <div class="form-group">
                        <!-- Name input-->
                        <input class="form-control" id="name" type="text" placeholder="Your Name *"
                               data-sb-validations="required"/>
                        <div class="invalid-feedback" data-sb-feedback="name:required">A name is required.</div>
                    </div>
                    <div class="form-group">
                        <!-- Email address input-->
                        <input class="form-control" id="email" type="email" placeholder="Your Email *"
                               data-sb-validations="required,email"/>
                        <div class="invalid-feedback" data-sb-feedback="email:required">An email is required.</div>
                        <div class="invalid-feedback" data-sb-feedback="email:email">Email is not valid.</div>
                    </div>
                    <div class="form-group mb-md-0">
                        <!-- Phone number input-->
                        <input class="form-control" id="phone" type="tel" placeholder="Your Phone *"
                               data-sb-validations="required"/>
                        <div class="invalid-feedback" data-sb-feedback="phone:required">A phone number is required.
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group form-group-textarea mb-md-0">
                        <!-- Message input-->
                        <textarea class="form-control" id="message" placeholder="Your Message *"
                                  data-sb-validations="required"></textarea>
                        <div class="invalid-feedback" data-sb-feedback="message:required">A message is required.</div>
                    </div>
                </div>
            </div>
            <!-- Submit success message-->
            <!---->
            <!-- This is what your users will see when the form-->
            <!-- has successfully submitted-->
            <div class="d-none" id="submitSuccessMessage">
                <div class="text-center text-white mb-3">
                    <div class="fw-bolder">Form submission successful!</div>
                    To activate this form, sign up at
                    <br/>
                    <a href="https://startbootstrap.com/solution/contact-forms">https://startbootstrap.com/solution/contact-forms</a>
                </div>
            </div>
            <!-- Submit error message-->
            <!---->
            <!-- This is what your users will see when there is-->
            <!-- an error submitting the form-->
            <div class="d-none" id="submitErrorMessage">
                <div class="text-center text-danger mb-3">Error sending message!</div>
            </div>
            <!-- Submit Button-->
            <div class="text-center">
                <button class="btn btn-primary btn-xl text-uppercase disabled" id="submitButton" type="submit">Send
                    Message
                </button>
            </div>
        </form>
    </div>
</section>

<%@include file="footer.jsp" %>
</body>
<script>
    $(document).ready(function () {
        makeCards();
    })

    function makeCards() {
        let data = <%=team%>;
        let card = $('#team_members');
        let text = '';
        for (let i = 0; i < data.length; i++) {
            text += '<div class="col-lg-4">'
                + '<div class="team-member">'
                + '<img class="mx-auto rounded-circle" src="/theme/main/assets/img/team/1.jpg" alt="..." />'
                + '<h4>' + data[i].name + '</h4>'
                + '<p class="text-muted">' + data[i].group_name + '</p>'
                + '<a class="btn btn-dark btn-social mx-2" href="#!"><i class="fab fa-twitter"></i></a>'
                + '<a class="btn btn-dark btn-social mx-2" href="#!"><i class="fab fa-facebook-f"></i></a>'
                + '<a class="btn btn-dark btn-social mx-2" href="#!"><i class="fab fa-linkedin-in"></i></a>'
                + '</div>'
                + '</div>'
        }
        card.append(text);
    }


</script>
</html>
