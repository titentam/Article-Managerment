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

    <!-- TinyMCE -->
    <script src="https://cdn.tiny.cloud/1/zihbozrq50skj1zkvy3envynkp7car0mx4yz81mv00u790wp/tinymce/6/tinymce.min.js" referrerpolicy="origin"></script>
    <script>
        tinymce.init({
            selector: 'textarea#tiny',
            plugins: [
                'a11ychecker','advlist','advcode','advtable','autolink','checklist','export',
                'lists','link','image','charmap','preview','anchor','searchreplace','visualblocks',
                'powerpaste','fullscreen','formatpainter','insertdatetime','media','table','help','wordcount'
            ],
            toolbar: 'undo redo | a11ycheck casechange blocks | bold italic backcolor | alignleft aligncenter alignright alignjustify |' +
                'bullist numlist checklist outdent indent | removeformat | code table help',

        })
    </script>
</head>

<body>
<%
    String function = (String)request.getAttribute("function");
    String action = (String)request.getAttribute("action");
    var categories = (ArrayList<Category>)request.getAttribute("categories");
    var article = (Article)request.getAttribute("article");
    var categoriesOld = (ArrayList<Category>)request.getAttribute("categoriesOld");

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

                    <form action="./article?action=<%=action%>" method="post">
                        <div class="card">
                            <div class="card-body">
                                <div class="form-group">
                                    <label class="font-weight-semibold" for="title">Title</label>
                                    <input type="text" class="form-control" name="title" id="title" placeholder="Title"
                                           value="<%=article!=null?article.getTitle():""%>">
                                </div>
                                <div class="form-group">
                                    <div class="btn-group dropright">
                                        <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            Danh mục
                                        </button>
                                        <div class="dropdown-menu">
                                            <% for (var item : categories) { %>
                                            <label class="dropdown-item">
                                                <input type="checkbox" name="category[]" value="<%= item.getCategoryID() %>"
                                                    <% if (categoriesOld!=null&&categoriesOld.contains(item.getCategoryID())) { %>
                                                       checked
                                                    <% } %>
                                                > <%= item.getName() %>
                                            </label>
                                            <% } %>
                                        </div>
                                    </div>

                                </div>
                                <div class="form-group">
                                    <label class="font-weight-semibold" for="tiny">Nội dung</label>
                                    <textarea name="content" id="tiny"></textarea>
                                </div>
                                <input type="hidden" name="articleID" value="<%=article!=null?article.getArticleID():""%>">
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



<!-- Core Vendors JS -->
<script src="assets/js/vendors.min.js"></script>

<!-- page js -->
<script src="assets/vendors/select2/select2.min.js"></script>
<script src="assets/js/pages/e-commerce-product-edit.js"></script>

<!-- Core JS -->
<script src="assets/js/app.min.js"></script>

<script>
    document.addEventListener("DOMContentLoaded", function() {
        window.onload = function() {
            tinymce.get('tiny').setContent(`<%=article!=null?article.getContent():""%>`);
        };
    });
</script>
</body>

</html>

