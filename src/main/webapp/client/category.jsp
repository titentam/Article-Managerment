
<%@ page import="model.bean.Category" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.bean.Article" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Arrays" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html class="no-js" lang="zxx">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>News  HTML-5 Template </title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="manifest" href="site.webmanifest">
    <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">
    
    <!-- CSS here -->
    <%@include file="component/allcss.jsp"%>
</head>

<body>
<%@include file="component/header.jsp"%>
<%
    var map = (Map<Category, ArrayList<Article>>)request.getAttribute("map");
    var entry = map.entrySet();
    boolean firstCategory = true;
%>
<main>
    <!-- About US Start -->
    <div class="about-area2 gray-bg pt-60 pb-60">
        <div class="container">
                <div class="row">
                <div class="col-lg-8">
                    <div class="whats-news-wrapper">
                        <!-- Heading & Nav Button -->
                            <div class="row justify-content-between align-items-end mb-15">
                                <div class="col-xl-4">
                                    <div class="section-tittle mb-30">
                                        <h3>Tin mới</h3>
                                    </div>
                                </div>
                                <div class="col-xl-8 col-md-9">
                                    <div class="properties__button">
                                        <!--Nav Button  -->                                            
                                        <nav>                                                 
                                            <div class="nav nav-tabs" id="nav-tab" role="tablist">
                                                <%for (Category category : map.keySet()) { %>
                                                <a class="nav-item nav-link <%=firstCategory?"active":""%>" id="nav-<%=category.getCategoryID()%>-tab" data-toggle="tab" href="#nav-<%=category.getCategoryID()%>" role="tab" aria-controls="nav-<%=category.getCategoryID()%>" aria-selected="<%=firstCategory?"true":"false"%>"><%=category.getName()%></a>
                                                <% firstCategory = false;} firstCategory=true;%>

                                            </div>
                                        </nav>
                                        <!--End Nav Button  -->
                                    </div>
                                </div>
                            </div>
                            <!-- Tab content -->
                            <div class="row">
                                <div class="col-12">
                                    <!-- Nav Card -->
                                    <div class="tab-content" id="nav-tabContent">
                                        <%for (Category category : map.keySet()) {
                                            var articles = map.get(category);
                                        %>
                                        <!-- card one -->
                                        <div class="tab-pane fade show <%=firstCategory?"active":""%>" id="nav-<%=category.getCategoryID()%>" role="tabpanel" aria-labelledby="nav-<%=category.getCategoryID()%>-tab">
                                            <div class="row">
                                                <%for (var article : articles) {%>
                                                <div class="col-xl-6 col-lg-6 col-md-6">
                                                    <div class="whats-news-single mb-40 mb-40">
                                                        <div class="whates-img">
                                                            <img src="../img/<%= article.getImage() %>" alt="">
                                                        </div>
                                                        <div class="whates-caption whates-caption2">
                                                            <h4><a href="./article?action=detail&articleID=<%=article.getArticleID()%>">
                                                                <%=article.getTitle()%>
                                                            </a></h4>
                                                            <span>
                                                                <%
                                                                    SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy MM:HH");
                                                                    String time = dateFormat.format(article.getTime());
                                                                %>
                                                                <%=time%>
                                                            </span>
                                                            <p>Nội dung</p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <%}%>
                                            </div>
                                        </div>
                                        <%firstCategory=false;}%>

                                    </div>
                                <!-- End Nav Card -->
                                </div>
                            </div>
                    </div>
                    </div>
                    <div class="col-lg-4">
                        <!-- Flow Socail -->
                        <div class="single-follow mb-45">
                            <div class="single-box">
                                <div class="follow-us d-flex align-items-center">
                                    <div class="follow-social">
                                        <a href="#"><img src="assets/img/news/icon-fb.png" alt=""></a>
                                    </div>
                                    <div class="follow-count">  
                                        <span>8,045</span>
                                        <p>Fans</p>
                                    </div>
                                </div> 
                                <div class="follow-us d-flex align-items-center">
                                    <div class="follow-social">
                                        <a href="#"><img src="assets/img/news/icon-tw.png" alt=""></a>
                                    </div>
                                    <div class="follow-count">
                                        <span>8,045</span>
                                        <p>Fans</p>
                                    </div>
                                </div>
                                    <div class="follow-us d-flex align-items-center">
                                    <div class="follow-social">
                                        <a href="#"><img src="assets/img/news/icon-ins.png" alt=""></a>
                                    </div>
                                    <div class="follow-count">
                                        <span>8,045</span>
                                        <p>Fans</p>
                                    </div>
                                </div>
                                <div class="follow-us d-flex align-items-center">
                                    <div class="follow-social">
                                        <a href="#"><img src="assets/img/news/icon-yo.png" alt=""></a>
                                    </div>
                                    <div class="follow-count">
                                        <span>8,045</span>
                                        <p>Fans</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- New Poster -->
                        <div class="news-poster d-none d-lg-block">
                            <img src="assets/img/news/news_card.jpg" alt="">
                        </div>
                    </div>
                </div>
        </div>
    </div>
    <!-- About US End -->
    <!--Start pagination -->
    <!-- End pagination  -->
</main>
<%@include file="component/footer.jsp"%>

<!-- JS here -->
<%@include file="component/alljs.jsp"%>
    
</body>
</html>