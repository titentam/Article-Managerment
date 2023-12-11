<%@ page import="model.bean.Article" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.bean.CommentView" %>
<%@ page import="java.text.SimpleDateFormat" %>
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
    var record = (Article)request.getAttribute("record");
    var authors = (ArrayList<String>)request.getAttribute("authors");
    var comments = (ArrayList<CommentView>)request.getAttribute("comments");
%>
<main>
    <!-- About US Start -->
    <div class="about-area2 gray-bg pt-60 pb-60">
        <div class="container">
                <div class="row">
                    <div class="col-lg-8">
                        <!-- Trending Tittle -->
                        <div class="about-right mb-90">
                            <div class="about-img">
                                <img src="../img/<%=record.getImage()%>" alt="Lỗi">
                            </div>
                            <div class="heading-news mb-30 pt-30">
                                <h3><%=record.getTitle()%></h3>
                            </div>
                            <div class="about-prea">
                                <%=record.getContent()%>
                            </div>

                            <div class="social-share pt-30">
                                <div class="section-tittle">
                                    <h4 class="mr-20">Chia sẻ:</h4>
                                    <ul>
                                        <li><a href="#"><img src="assets/img/news/icon-ins.png" alt=""></a></li>
                                        <li><a href="#"><img src="assets/img/news/icon-fb.png" alt=""></a></li>
                                        <li><a href="#"><img src="assets/img/news/icon-tw.png" alt=""></a></li>
                                        <li><a href="#"><img src="assets/img/news/icon-yo.png" alt=""></a></li>
                                    </ul>
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
                    <%if(session.getAttribute("username")!=null){%>
                    <div class="comment-form" style="width: 100%">
                        <h4>Leave a Reply</h4>
                        <form class="form-contact comment_form" action="./article?action=submitComment" id="commentForm" method="post">
                            <input type="hidden" name="articleID" value="<%=record.getArticleID()%>">
                            <input type="hidden" name="username" value="<%=session.getAttribute("username")%>">
                            <div class="row">
                                <div class="col-12">
                                    <div class="form-group">
                                        <textarea class="form-control w-100" name="comment" id="comment" cols="30" rows="9" placeholder="Write Comment"></textarea>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <button type="submit" class="button button-contactForm btn_1 boxed-btn">Send Message</button>
                            </div>
                        </form>
                    </div>
                    <%}%>
                    <div class="comments-area" style="width: 100%">
                        <h4>Bình luận (<%=comments.size()%>)</h4>
                        <% for (var comment: comments) {%>
                        <div class="comment-list">
                            <div class="single-comment justify-content-between d-flex">
                                <div class="user justify-content-between d-flex">
                                    <div class="thumb">
                                        <img src="assets/img/comment/comment_1.png" alt="">
                                    </div>
                                    <div class="desc">
                                        <p class="comment">
                                            <%=comment.getContent()%>
                                        </p>
                                        <div class="d-flex justify-content-between">
                                            <div class="d-flex align-items-center">
                                                <h5>
                                                    <a href="#"><%=comment.getNameUser()%></a>
                                                </h5>
                                                <p class="date">
                                                    <%
                                                        SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy MM:HH");
                                                        String time = dateFormat.format(comment.getTime());
                                                    %>
                                                    <%=time%>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%}%>
                    </div>
                </div>
        </div>
    </div>
    <!-- About US End -->
</main>

<%@include file="component/footer.jsp"%>

<!-- JS here -->
<%@include file="component/alljs.jsp"%>
    
</body>
</html>