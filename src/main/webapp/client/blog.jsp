<!doctype html>
<%@page import="java.awt.event.ItemEvent"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="model.bean.Category"%>
<%@page import="model.bean.Article"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html class="no-js" lang="zxx">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Bài báo </title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="manifest" href="site.webmanifest">
    <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">

    <!-- CSS here -->
    <%@include file="component/allcss.jsp"%>
    <style>
    	.card-img {
    		max-height: 450px;
    	}
    </style>
</head>

<body>
    <%@include file="component/header.jsp"%>
    <!--================Blog Area =================-->
    <%
        var listArticle = (ArrayList<Article>)request.getAttribute("listArticle");
        var categories = (ArrayList<Category>)request.getAttribute("categories");
        var listAuthors = (ArrayList<ArrayList<String>>)request.getAttribute("listAuthors");
        int numOfPage = (int) request.getAttribute("numOfPage");
		int currentPage = (int) request.getAttribute("currentPage");
		ArrayList<Article> topArticles = (ArrayList<Article>) request.getAttribute("top5Articles");
        int i=0;
    %>
    
    <%! public String arrayToString(ArrayList<Category> categories) { 
		StringBuilder builder = new StringBuilder();
		for (Category category1 : categories) {
			builder.append(category1.getName()).append(", ");
		}
		if (builder.length() > 0)
			builder.deleteCharAt(builder.length() - 2);
		else 
			builder.append("Không có");
		return builder.toString();
	}%>
    
    <%!
		public Object[] getDate(Date date) {
    		SimpleDateFormat format = new SimpleDateFormat("MMM");
    		int dayOfMonth = date.getDate();
    		String month = format.format(date);
			return new Object[] { dayOfMonth, month };
		}
	%>
	
	<%! public String formatDateString(Date date) {
    		SimpleDateFormat format = new SimpleDateFormat("dd MMM yyyy");
    		return format.format(date); 
		}
	%>
	
    <section class="blog_area section-padding">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 mb-5 mb-lg-0">
                    <div class="blog_left_sidebar">
                        <% for (Article item : listArticle) { %>
						<article class="blog_item">
							<div class="blog_item_img">
								<img class="card-img rounded-0"
									src="../img/<%=item.getImage() %>" alt="">
								<% Object[] publishedDay = getDate(item.getTime()); %>
								<a href="#" class="blog_item_date">
									<h3 class="text-center"><%=publishedDay[0] %></h3>
									<p><%=publishedDay[1] %></p>
								</a>
							</div>

							<div class="blog_details">
								<a class="d-inline-block" href="../client/article?action=detail&articleID=<%=item.getArticleID()%>">
									<h2><%=item.getTitle() %></h2>
								</a>
								
								<ul class="blog-info-link">
									<li>
									<% String author = Arrays.toString(listAuthors.get(i).toArray()).replace("[", "").replace("]", ""); %>
									<a href="../client/article?action=detail&articleID=<%=item.getArticleID()%>"><i class="fa fa-user"></i>
										<%=author.length() > 0 ? author : "Không xác định"%>
										<% i++; %>
									</a></li>
									<li>
									<a href="../client/article?action=detail&articleID=<%=item.getArticleID()%>"><i class="fa fa-newspaper"></i>
										<%=arrayToString(item.getCategories()) %>
									</a></li>
								</ul>
							</div>
						</article>
						<% } %>
                        <nav class="blog-pagination justify-content-center d-flex">
                            <ul class="pagination">
                                <li class="page-item">
                                	<% int previous = (currentPage - 1) > 0 ? currentPage - 1 : currentPage; %>
                                    <a class="page-link" onclick="changePageLink(<%=previous%>)" aria-label="Previous">
                                        <i class="ti-angle-left"></i>
                                    </a>
                                </li>
                                <% for (int k = 1; k <= numOfPage; k++) { %>
                                	<% if (currentPage == k) {%>
                                	<li class="page-item active">
                                		<a class="page-link" onclick="changePageLink(<%=k%>)"><%=k %></a></li>
                                	<% } else { %>
                                	<li class="page-item">
                                		<a class="page-link" onclick="changePageLink(<%=k%>)"><%=k %></a></li>
                                	<% } %>
                                <% } %>
                                <li class="page-item">
                                	<% int next = (currentPage + 1) <= numOfPage ? currentPage + 1 : currentPage; %>
                                    <a  class="page-link" onclick="changePageLink(<%=next%>)" aria-label="Next">
                                        <i class="ti-angle-right"></i>
                                    </a>
                                </li>
                            </ul>
                        </nav>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="blog_right_sidebar">
                        <aside class="single_sidebar_widget search_widget">
                            <form action="#">
                                <div class="form-group">
                                    <div class="input-group mb-3">
                                        <input type="text" name="search-input" class="form-control" placeholder='Nhập bài báo, tác giả,...'
                                            onfocus="this.placeholder = ''"
                                            onblur="this.placeholder = 'Nhập bài báo, tác giả,...'">
                                        <div class="input-group-append">
                                            <button class="btns" onclick="searchHandler()"><i class="ti-search"></i></button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </aside>

                        <aside class="single_sidebar_widget post_category_widget">
                            <h4 class="widget_title">Category</h4>
                            <ul class="list cat-list">
                                <% for (Category item : categories) { %>
                                <li>
                                    <a href="../client/article?action=list-article&category=<%=item.getCategoryID() %>" class="d-flex">
                                        <p><%=item.getName() %></p>
                                    </a>
                                </li>
                                <% } %>
                            </ul>
                        </aside>

                        <aside class="single_sidebar_widget popular_post_widget">
                            <h3 class="widget_title">Phổ biến</h3>
                            <% for (Article item : topArticles) { %>
                            <div class="media post_item">
                                <img style="width:80px; height: 80px" src="../img/<%=item.getImage() %>" alt="post">
                                <div class="media-body">
                                    <a href="../client/article?action=detail&articleID=<%=item.getArticleID()%>">
                                        <h3><%=item.getTitle() %></h3>
                                    </a>
                                    <p><%=formatDateString(item.getTime()) %></p>
                                </div>
                            </div>
                            <% } %>
                        </aside>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--================Blog Area =================-->

    <%@include file="component/footer.jsp"%>
    <!-- Search model end -->

    <!-- JS here -->
    <%@include file="component/alljs.jsp"%>

</body>
<script type="text/javascript">

window.onload = function(e) {
	var search_input = document.querySelector('input[name=\'search-input\']');
	const queryString = window.location.search;
	const urlParams = new URLSearchParams(queryString);
	const search_text = urlParams.get('search-text');

	search_input.value = search_text !== "#" ? search_text : "" ;
}

function changePageLink(page) {
	const queryString = window.location.search;
	const urlParams = new URLSearchParams(queryString);
	const category = urlParams.get('category');
	const search_text = urlParams.get('search-text');
	
	currentHref = '../client/article?action=list-article&page=' + page;
	if (category != null && category !== "")
    	currentHref += '&category=' + category;
	if (search_text != null && search_text !== "")
        currentHref += '&search-text=' + search_text;

	event.target.setAttribute('href', currentHref);
}

function searchHandler() {
	event.preventDefault();
	const queryString = window.location.search;
	const urlParams = new URLSearchParams(queryString);
	const category = urlParams.get('category');
	
	var search_text = document.querySelector('input[name=\'search-input\']').value;
	var currentHref = "../client/article?action=list-article&search-text=" + search_text;
	if (category != null && category !== "")
    	currentHref += '&category=' + category;
	window.location.href = currentHref;
}
</script>
</html>