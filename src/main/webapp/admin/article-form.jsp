<%@ page import="java.util.ArrayList" %>
<%@ page import="model.bean.Category" %>
<%@ page import="model.bean.Article" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Enlink - Admin Dashboard Template</title>

    <!-- Favicon -->
    <link rel="shortcut icon" href="assets/images/logo/favicon.png">

    <!-- page css -->
    <link href="assets/vendors/select2/select2.css" rel="stylesheet">

    <!-- Core css -->
    <link href="assets/css/app.min.css" rel="stylesheet">

</head>

<body>
<%
    String function = (String)request.getAttribute("function");
    String action = (String)request.getAttribute("action");
    var categories = (ArrayList<Category>)request.getAttribute("categories");
    var article = (Article)request.getAttribute("article");
    var categoryOld = (String) request.getAttribute("categoryOld");

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
                    <h2 class="header-title">Thêm bài báo</h2>
                    <div class="header-sub-title">
                        <nav class="breadcrumb breadcrumb-dash">
                            <a href="#" class="breadcrumb-item"><i class="anticon anticon-home m-r-5"></i>Trang chủ</a>
                            <a class="breadcrumb-item" href="#">Quản lí bài báo</a>
                            <span class="breadcrumb-item active"><%=function%>></span>
                        </nav>
                    </div>
                </div>
                <div class="container">

                    <form action="./article?action=<%=action%>" method="post" onsubmit="processSubmit(event)">
                        <div class="card">
                            <div class="card-body">
                                <div class="form-group">
                                    <label class="font-weight-semibold" for="title">Title</label>
                                    <input type="text" class="form-control" name="title" id="title" placeholder="Title"
                                           value="<%=article!=null?article.getTitle():""%>">
                                </div>
                                <div class="form-group">
                                    <label class="font-weight-semibold" for="category">Danh mục</label>
                                    <select class="custom-select" id="category" name="category">
                                        <%for (var item : categories) {%>
                                        <option value="<%=item.getCategoryID()%>"
                                        <% if(item.getCategoryID().equals(categoryOld)){%>
                                            <%="selected"%>
                                        <%}%>>
                                            <%=item.getName()%>
                                        </option>
                                        <%}%>

                                    </select>
                                </div>
                                <div class="form-group">
                                    <label class="font-weight-semibold" for="productDescription">Nội dung</label>
                                    <div id="productDescription">
                                        <%=article!=null?article.getContent():""%>
                                    </div>
                                </div>
                                <input type="hidden" id="content" name="content">
                                <input type="hidden" name="articleID" value="<%=article!=null?article.getArticleID():""%>">
                                <input type="hidden" name="categoryOld" value="<%=categoryOld!=null?categoryOld:""%>">
                                <div class="form-group">
                                    <input type="submit" class="btn btn-primary" value="Submit">
                                </div>
                            </div>
                        </div>
                    </form>
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

<script>
    function processSubmit(event){
        var content = document.getElementsByClassName("ql-editor")[0].innerHTML;
        document.getElementById('content').value = content;
        event.target.submit(); // Gửi yêu cầu sau khi đã xử lý
    }
</script>
<!-- Core Vendors JS -->
<script src="assets/js/vendors.min.js"></script>

<!-- page js -->
<script src="assets/vendors/select2/select2.min.js"></script>
<script src="assets/vendors/quill/quill.min.js"></script>
<script src="assets/js/pages/e-commerce-product-edit.js"></script>

<!-- Core JS -->
<script src="assets/js/app.min.js"></script>

</body>

</html>