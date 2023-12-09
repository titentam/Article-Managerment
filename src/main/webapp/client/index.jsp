<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.bean.Article" %>
<%@ page import="model.bean.Category" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!doctype html>
<html class="no-js" lang="zxx">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>News  HTML-5 Template </title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <%@include file="component/allcss.jsp"%>
</head>

<body>

<%@include file="component/header.jsp"%>

<main>
    <!-- Trending Area Start -->
        <div style="margin-top: 7rem" class="container">
            <div class="trending-main">
                <div class="row">
                    <div class="col-lg-8">
                        <div class="slider-active">
                            <%
                                ArrayList<Article> top5Articles = (ArrayList<Article>) request.getAttribute("top5Articles");
                                var listAuthorsTop5 = (ArrayList<ArrayList<String>>)request.getAttribute("listAuthorsTop5");
                                for (int i = 0; i < Math.min(3, top5Articles.size()); i++) {
                                    Article article = top5Articles.get(i);
                                    String  author=Arrays.toString(listAuthorsTop5.get(i).toArray()).replace("[", "").replace("]", "");
                            %>
                            <!-- Single -->
                            <div class="single-slider">
                                <div class="trending-top mb-30">
                                    <div class="trend-top-img">
                                          <img style="width:100%;"  src="../img/<%= article.getImage() %>" alt="">
                                        <div class="trend-top-cap">
                                            <span class="bgr" data-animation="fadeInUp" data-delay=".2s" data-duration="1000ms"><%= article.getCategories() %></span>
                                            <h2><a href="../client/article?action=detail&articleID=<%=article.getArticleID()%>" data-animation="fadeInUp" data-delay=".4s" data-duration="1000ms"><%= article.getTitle() %></a></h2>
                                            <p data-animation="fadeInUp" data-delay=".6s" data-duration="1000ms">by  <%=author %> - <%= article.getTime() %></p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%
                                }
                            %>
                        </div>
                    </div>
                    <!-- Right content -->
                    <div class="col-lg-4">
                        <div class="row">
                            <%
                                for (int i = 3; i < top5Articles.size(); i++) {
                                    Article article = top5Articles.get(i);
                                    String  author=Arrays.toString(listAuthorsTop5.get(i).toArray()).replace("[", "").replace("]", "");
                            %>
                            <div class="col-lg-12 col-md-6 col-sm-6">
                                <div class="trending-top mb-30">
                                    <div class="trend-top-img">
                                          <img style="width:100%;"  src="../img/<%= article.getImage() %>" alt="">
                                        <div class="trend-top-cap trend-top-cap2">
                                            <span class="bgb"><%= article.getCategories() %></span>
                                            <h2><a href="../client/article?action=detail&articleID=<%=article.getArticleID()%>"><%= article.getTitle() %></a></h2>
                                            <p>by  <%=author %> - <%= article.getTime() %></p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%
                                }
                            %>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    <!-- Trending Area End -->
    <!-- Whats New Start -->
    <section class="whats-news-area pt-50 pb-20 gray-bg">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <%
                        var map = (Map<Category, ArrayList<Article>>)request.getAttribute("map");
                        var entry = map.entrySet();
                        boolean firstCategory = true;
                    %>
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
                    <!-- Most Recent Area -->
                    <div class="most-recent-area">
                        <!-- Section Tittle -->
                        <div class="small-tittle mb-20">
                            <h4>Most Recent</h4>
                        </div>
                        <%
                            ArrayList<Article> topArticles = (ArrayList<Article>) request.getAttribute("top5Articles");
                            var listAuthorsTop = (ArrayList<ArrayList<String>>)request.getAttribute("listAuthorsTop5");
                            int i=0;
                            Article article = topArticles.get(i);
                            String  author=Arrays.toString(listAuthorsTop.get(i).toArray()).replace("[", "").replace("]", "");
                        %>
                        <!-- Details -->
                        <div class="most-recent mb-40">
                            <div class="most-recent-img">
                                <img  style="width:100%;" src="../img/<%=article.getImage()%>" alt="">
                                <div class="most-recent-cap">
                                    <span class="bgbeg"><%=article.getCategories()%></span>
                                    <h4><a href="../client/article?action=detail&articleID=<%=article.getArticleID()%>"><%=article.getTitle()%> </a></h4>
                                    <p> <%=author %> - <%= article.getTime() %></p>
                                </div>
                            </div>
                        </div>
                        <%i++;%>
                        <!-- Single -->
                        <div class="most-recent-single">
                            <div class="most-recent-images">
                                <img  style="width:100%;" src="../img/<%=article.getImage()%>" alt="">
                            </div>
                            <div class="most-recent-capt">
                                <h4><a href="../client/article?action=detail&articleID=<%=article.getArticleID()%>"><%=article.getTitle()%></a></h4>
                                <p> <%=author %> - <%= article.getTime() %></p>
                            </div>
                        </div>
                        <%i++;%>
                        <!-- Single -->
                        <div class="most-recent-single">
                            <div class="most-recent-images">
                                <img style="width:100%;" src="../img/<%=article.getImage()%>" alt="">
                            </div>
                            <div class="most-recent-capt">
                                <h4><a href="../client/article?action=detail&articleID=<%=article.getArticleID()%>"><%=article.getTitle()%></a></h4>
                                <p> <%=author %> - <%= article.getTime() %></p>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Banner -->
                <div class="banner-one mt-20 mb-30">
                      <img style="width:100%;"  src="assets/img/gallery/body_card1.png" alt="">
                </div>

            </div>
        </div>
    </section>
    <!-- Whats New End -->
    <!--   Weekly2-News start -->
    <div class="weekly2-news-area pt-50 pb-30 gray-bg">
        <div class="container">
            <div class="weekly2-wrapper">
                <div class="row">
                    <!-- Banner -->
                    <div class="col-lg-3">
                        <div class="home-banner2 d-none d-lg-block">
                              <img  style="width:100%;" src="assets/img/gallery/body_card2.png" alt="">
                        </div>
                    </div>
                    <div class="col-lg-9">
                        <div class="slider-wrapper">
                            <!-- section Tittle -->
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="small-tittle mb-30">
                                        <h4>Most Popular</h4>
                                    </div>
                                </div>
                            </div>
                            <!-- Slider -->
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="weekly2-news-active d-flex">
                                        <!-- Single -->
                                        <%
                                        ArrayList<Article> mostPopular = (ArrayList<Article>) request.getAttribute("top3MostPopular");
                                                var listAuthorsPopular = (ArrayList<ArrayList<String>>)request.getAttribute("listAuthorsTop3MostPopular");
                                                for (int j = 0; i <  top5Articles.size(); i++) {
                                                Article articlemostPopular = mostPopular.get(i);
                                                String  AuthorsPopular=Arrays.toString(listAuthorsPopular.get(i).toArray()).replace("[", "").replace("]", "");

                                        %>
                                        <div class="weekly2-single">
                                            <div class="weekly2-img">
                                                  <img style="width:100%;" src="../img/<%=articlemostPopular.getImage()%>" alt="">
                                            </div>
                                            <div class="weekly2-caption">
                                                <h4><a href="../client/article?action=detail&articleID=<%=articlemostPopular.getArticleID()%>"><%=articlemostPopular.getTitle()%></a></h4>
                                                <p><%=AuthorsPopular %> - <%= articlemostPopular.getTime() %></p>
                                            </div>
                                        </div>
                                        <%}%>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Weekly-News -->

    <!-- banner-last Start -->
    <div class="banner-area gray-bg pt-90 pb-90">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-10 col-md-10">
                    <div class="banner-one">
                          <img style="width:100%;"  src="assets/img/gallery/body_card3.png" alt="">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- banner-last End -->
</main>

<%@include file="component/footer.jsp"%>

<!-- JS here -->
<%@include file="component/alljs.jsp"%>


</body>
</html>