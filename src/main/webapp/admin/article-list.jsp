<%@ page import="java.util.ArrayList" %>
<%@ page import="model.bean.Article" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="java.text.SimpleDateFormat" %>
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

</head>

<body>
    <%
        var list = (ArrayList<Article>)request.getAttribute("list");
        var listAuthors = (ArrayList<ArrayList<String>>)request.getAttribute("listAuthors");
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
                            <div class="col-lg-8">
                                <div class="d-md-flex">
                                    <div class="m-b-10 m-r-15">
                                        <select id="category" class="custom-select" style="min-width: 180px;">
                                            <option selected>Loại báo</option>
                                            <option value="all">Tất cả</option>
                                            <option value="homeDeco">Home Decoration</option>
                                            <option value="eletronic">Eletronic</option>
                                            <option value="jewellery">Jewellery</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 text-right">
                                <a href="article-form.jsp">
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
                                        <img class="img-fluid" src="assets/images/others/img-2.jpg" alt="">
                                    </div>
                                    <div class="col-md-8">
                                        <h4 class="m-b-10"><%=item.getTitle()%></h4>
                                        <div class="d-flex align-items-center m-t-5 m-b-15">
                                            <div class="m-l-10">
                                                <span class="text-gray font-weight-semibold">
                                                    Tác giả:
                                                </span>
                                                <span class="text-gray">
                                                    <%=Arrays.toString(listAuthors.get(i).toArray()).replace("[", "").replace("]", "")%>
                                                    <% i++; %>
                                                </span>
                                                <br>
                                                <span class="text-gray font-weight-semibold">
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
                                        <p class="m-b-20"><%=item.getContent()%></p>
                                        <div class="text-right">
                                            <a class="btn btn-hover font-weight-semibold" href="./article?action=detail&articleID=<%=item.getArticleID()%>">
                                                <span>Xem chi tiết</span>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%}%>

                    </div>
                    <div class="m-t-30">
                        <nav>
                            <ul class="pagination justify-content-center">
                                <li class="page-item"><a class="page-link" href="#">Previous</a></li>
                                <li class="page-item active"><a class="page-link" href="#">1</a></li>
                                <li class="page-item"><a class="page-link" href="#">2</a></li>
                                <li class="page-item"><a class="page-link" href="#">3</a></li>
                                <li class="page-item"><a class="page-link" href="#">Next</a></li>
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

</html>