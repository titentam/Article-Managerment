<%@ page import="java.util.ArrayList" %>
<%@ page import="model.bean.Article" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="model.bean.Category" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Danh sách bài báo</title>

    <!-- Favicon -->
    <link rel="shortcut icon" href="assets/images/logo/favicon.png">

    <!-- page css -->

    <!-- Core css -->
    <link href="assets/css/app.min.css" rel="stylesheet">
	<style>
	.card {
		box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;
		border-radius: 10px;
	}
	.card-body {
		background-color: lightblue;	
		border-radius: 10px;
	}
	.page-item:first-child .page-link,
	.page-item:last-child .page-link {
		border-radius: 50%;
	}
	table {
		background: aliceblue;
	}
</style>
</head>

<body>
<	<%! public String arrayToString(ArrayList<Category> categories) { 
		StringBuilder builder = new StringBuilder();
		for (Category category1 : categories) {
			builder.append(category1.getName()).append(", ");
		}
		builder.deleteCharAt(builder.length() - 2);
		return builder.toString();
	}%>
	
    <%
        var list = (ArrayList<Article>)request.getAttribute("list");
        var categories = (ArrayList<Category>)request.getAttribute("categories");
        var listAuthors = (ArrayList<ArrayList<String>>)request.getAttribute("listAuthors");
        int numOfPage = (int) request.getAttribute("numOfPage");
		int currentPage = (int) request.getAttribute("currentPage");
        int i=0;
    %>
    <div class="app">
        <div class="layout">
            <!-- Header START -->
            <%@include file="component/header.jsp"%>
            <!-- Header END -->

            <!-- Side Nav START -->
            <%@include file="component/sideNav.jsp"%>
            <!-- Side Nav END -->

            <!-- Page Container START -->
            <div class="page-container">
                <!-- Content Wrapper START -->
                <div class="main-content">
                    <div class="page-header">
                        <h2 class="header-title">Danh sách bài báo</h2>
                        <div class="header-sub-title">
                            <nav class="breadcrumb breadcrumb-dash">
                                <a href="#" class="breadcrumb-item"><i class="anticon anticon-home m-r-5"></i>Trang chủ</a>
                                <a class="breadcrumb-item" href="#">Quản lí bài báo</a>
                                <span class="breadcrumb-item active">Danh sách</span>
                            </nav>
                        </div>
                    </div>
                    <div class="container">
                        <div class="row m-b-30">
                            <div class="col-lg-9 d-flex">
                                <div class="d-md-flex">
                                    <div class="m-b-10 m-r-15">
                                        <select name="category" id="category" class="custom-select border-primary" 
                                        	style="min-width: 150px" onchange="optimizeURL()">
                                            <option selected value="all">Thể loại</option>
                                            <%for (var item : categories) {%>
                                            <option value="<%=item.getCategoryID()%>"><%=item.getName()%></option>
                                            <%}%>
                                        </select>
                                    </div>
                                </div>
                                
                                <div class="d-md-flex">
                                    <div class="m-b-10 m-r-15">
                                        <select name="sort-by" id="sort-by" class="custom-select border-primary" 
                                        style="min-width: 180px;"  onchange="optimizeURL()">
                                            <option value="none" selected>Sắp xếp: Thời gian</option>
                                            <option value="most-viewers">Lượt xem cao nhất</option>
                                            <option value="less-viewers">Lượt xem thấp nhất</option>
                                            <option value="a-z">Tiêu đề A-Z</option>
                                            <option value="z-a">Tiêu đề Z-A</option>
                                        </select>
                                    </div>
                                </div>
                                
                                <div class="d-md-flex m-b-10 m-r-15">
                                        <input class="form-control border-primary" type="search" name="search-text" placeholder="Nhập tiêu đề ..." aria-label="Search">
      									<button type="button" onclick="optimizeURL()" class="btn btn-primary btn-outline-light my-2 my-sm-0" type="submit">
      										<i class="anticon anticon-search"></i>
      									</button>
                                </div>
                            </div>
                            <div class="col-lg-3 text-right">
                                <a href="./article?action=insert">
                                    <button class="btn btn-primary">
                                        <i class="anticon anticon-plus-circle m-r-5"></i>
                                        <span>Thêm bài báo</span>
                                    </button>
                                </a>
                            </div>
                        </div>
                        <% for (var item :list) {%>
                        <div class="card">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-4">
                                        <img class="img-fluid" style="border-radius: 10px" src="assets/images/others/img-2.jpg" alt="">
                                    </div>
                                    <div class="col-md-8">
                                        <h4 class="m-b-10"><%=item.getTitle()%></h4>
                                        <div class="d-flex align-items-center m-t-5 m-b-15">
                                            <div class="font-size-16" style="line-height: 1.8">
                                                <span class="text-black font-weight-semibold">
                                                    Tác giả:
                                                </span>
                                                <span class="text-gray">
                                                    <%=Arrays.toString(listAuthors.get(i).toArray()).replace("[", "").replace("]", "")%>
                                                    <% i++; %>
                                                </span>
                                                <br>
                                                
                                                <span class="text-black font-weight-semibold">
                                                    Thể loại :
                                                </span>
                                                <span class="text-gray">
                                                    <%=arrayToString(item.getCategories()) %>
                                                </span>
                                                <br>
                                                
                                                <span class="text-black font-weight-semibold">
                                                    Xuất bản lúc:
                                                </span>
                                                <span class="text-gray">
                                                    <%
                                                        SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy MM:HH");
                                                        String time = dateFormat.format(item.getTime());
                                                    %>
                                                    <%=time%>
                                                </span>
                                            </div>
                                        </div>
                                        <div class="d-flex justify-content-between">
											<div class="d-flex align-items-center">
												<div
													class="badge badge-<%=item.isLocked() ? "danger" : "success"%> badge-dot m-r-10"></div>
												<div><%=item.isLocked() ? "Không phát hành" : "Phát hành"%></div>
											</div>
											<div class="text-right">
												<a class="btn btn-hover font-weight-semibold"
													href="./article?action=detail&articleID=<%=item.getArticleID()%>">
													<span>Xem chi tiết</span>
												</a>
											</div>
										</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%
                        }
                        %>

                    </div>
                    <div class="m-t-30">
                        <nav>
                        	<ul class="pagination justify-content-center">
                                <% for (int k = 1; k <= numOfPage; k++) { %>
                                	<% if (currentPage == k) {%>
                                	<li class="page-item active"><a class="page-link" onclick="changePageLink(<%=k%>)"><%=k %></a></li>
                                	<% } else { %>
                                	<li class="page-item"><a class="page-link" onclick="changePageLink(<%=k%>)"><%=k %></a></li>
                                	<% } %>
                                <% } %>
                            </ul>
                        </nav>
                    </div>
                </div>
                <!-- Content Wrapper END -->

                <!-- Footer START -->
                <%@include file="component/footer.jsp"%>
                <!-- Footer END -->

            </div>
            <!-- Page Container END -->

        </div>
    </div>

    
    <!-- Core Vendors JS -->
    <script src="assets/js/vendors.min.js"></script>

    <!-- page js -->

    <!-- Core JS -->
    <script src="assets/js/app.min.js"></script>

</body>
<script type="text/javascript">
	var category_select = document.querySelector('select[name=\'category\']');
	var sort_select = document.querySelector('select[name=\'sort-by\']');
	var search_input = document.querySelector('input[name=\'search-text\']');
	var switch_input = document.querySelector('input[name=\'published\']');
	
	window.onload = function(e) {
		const queryString = window.location.search;
		const urlParams = new URLSearchParams(queryString);
		const category = urlParams.get('category');
		const sort_by = urlParams.get('sort-by');
		const search_text = urlParams.get('search-text');
		category_select.value = category !== null ? category : "all" ;
		sort_select.value = sort_by !== null ? sort_by : "none" ;
		search_input.value = search_text !== "#" ? search_text : "" ;
	}
	
	 // Hàm thay đổi href của các thẻ <a> khi click vào
    function changePageLink(page) {
    	const queryString = window.location.search;
		const urlParams = new URLSearchParams(queryString);
		const category = urlParams.get('category');
		const sort_by = urlParams.get('sort-by');
		const search_text = urlParams.get('search-text');
		
		currentHref = '?page=' + page;
		if (category != null && category !== "")
        	currentHref += '&category=' + category;
		if (sort_by != null && sort_by !== "")
        	currentHref += '&sort-by=' + sort_by;
		if (search_text != null && search_text !== "")
	        currentHref += '&search-text=' + search_text;

		event.target.setAttribute('href', currentHref);
    }
    
    function optimizeURL() {
    	event.preventDefault()
    	const queryString = window.location.search;
		const urlParams = new URLSearchParams(queryString);
		const page = urlParams.get('page') != null ? urlParams.get('page') : 1;
		
		currentHref = '?';
		if (category_select.value !== "")
        	currentHref += '&category=' + category_select.value;
		if (sort_select.value !== "")
        	currentHref += '&sort-by=' + sort_select.value;
		if (search_input.value.trim() !== '')
	        currentHref += '&search-text=' + search_input.value.trim();

		window.location.href = currentHref;
    }
</script>
</html>