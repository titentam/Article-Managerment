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

    <!-- Core css -->
    <link href="assets/css/app.min.css" rel="stylesheet">

</head>

<body>
<%
    var record = (Article)request.getAttribute("record");
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
                        <h2 class="header-title">Blog Post</h2>
                        <div class="header-sub-title">
                            <nav class="breadcrumb breadcrumb-dash">
                                <a href="#" class="breadcrumb-item"><i class="anticon anticon-home m-r-5"></i>Home</a>
                                <a class="breadcrumb-item" href="#">Pages</a>
                                <span class="breadcrumb-item active">Blog Post</span>
                            </nav>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-body">

                            <div class="container">
                                <div class="card-toolbar float-right">
                                    <ul>
                                        <li>
                                            <a class="text-gray" href="javascript:void(0)">
                                                <i class="anticon anticon-lock font-size-20" data-toggle="modal" data-target="#exampleModalLock"></i>

                                                <!-- Modal -->
                                                <div class="modal fade" id="exampleModalLock">
                                                    <div class="modal-dialog">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <h5 class="modal-title">Xác nhận ẩn bài báo</h5>
                                                                <button type="button" class="close" data-dismiss="modal">
                                                                    <i class="anticon anticon-close"></i>
                                                                </button>
                                                            </div>
                                                            <div class="modal-body">
                                                                Bạn có muốn ẩn bài báo này không ?
                                                            </div>
                                                            <div class="modal-footer">
                                                                <button type="button" class="btn btn-default" data-dismiss="modal">Hủy</button>
                                                                <form action="#">
                                                                    <input type="submit" class="btn btn-primary" value="Xác nhận">
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </a>
                                        </li>
                                        <li>
                                            <a class="text-gray" href="article-form.jsp">
                                                <i class="anticon anticon-edit font-size-20"></i>
                                            </a>
                                        </li>
                                        <li>
                                            <a class="text-gray" href="javascript:void(0)">
                                                <i class="anticon anticon-delete font-size-20" data-toggle="modal" data-target="#exampleModalDelete"></i>
                                                <!-- Modal -->
                                                <div class="modal fade" id="exampleModalDelete">
                                                    <div class="modal-dialog">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <h5 class="modal-title">Xác nhận xóa bài báo</h5>
                                                                <button type="button" class="close" data-dismiss="modal">
                                                                    <i class="anticon anticon-close"></i>
                                                                </button>
                                                            </div>
                                                            <div class="modal-body">
                                                                Bạn có muốn xóa bài báo này không ?
                                                            </div>
                                                            <div class="modal-footer">
                                                                <button type="button" class="btn btn-default" data-dismiss="modal">Hủy</button>
                                                                <form action="#">
                                                                    <input type="submit" class="btn btn-primary" value="Xác nhận">
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                                <h2 class="font-weight-normal m-b-10"><%=record.getTitle()%>></h2>
                                <div class="d-flex m-b-30">
                                    <div class="avatar avatar-cyan avatar-img">
                                        <img src="assets/images/avatars/thumb-6.jpg" alt="">
                                    </div>
                                    <div class="m-l-15">
                                        <a href="javascript:void(0);" class="text-dark m-b-0 font-weight-semibold">Author</a>
                                        <p class="m-b-0 text-muted font-size-13">Jan 2, 2019</p>
                                    </div>
                                </div>
                                <img alt="" class="img-fluid w-100" src="assets/images/others/img-8.jpg">
                                <div class="m-t-30">
                                    <p><%=record.getContent()%></p>
                                </div>
                                <div class="d-flex m-t-40 align-items-center">
                                    <span class="m-r-15">Share this post: </span>
                                    <ul class="list-inline m-b-0">
                                        <li class="list-inline-item">
                                            <button class="font-size-16 btn btn-hover btn-icon btn-rounded">
                                                <i class="anticon anticon-facebook"></i>
                                            </button>
                                        </li>
                                        <li class="list-inline-item">
                                            <button class="font-size-16 btn btn-hover btn-icon btn-rounded">
                                                <i class="anticon anticon-twitter"></i>
                                            </button>
                                        </li>
                                        <li class="list-inline-item">
                                            <button class="font-size-16 btn btn-hover btn-icon btn-rounded">
                                                <i class="anticon anticon-instagram"></i>
                                            </button>
                                        </li>
                                    </ul>
                                </div>
                                <hr>
                                <h5>Comments (số bình luận)</h5>
                                <div class="m-t-20">
                                    <ul class="list-group list-group-flush">
                                        <li class="list-group-item p-h-0">
                                            <div class="media m-b-15">
                                                <div class="avatar avatar-image">
                                                    <img src="assets/images/avatars/thumb-8.jpg" alt="">
                                                </div>
                                                <div class="media-body m-l-20">
                                                    <h6 class="m-b-0">
                                                        <a href="" class="text-dark">Tên người dùng</a>
                                                    </h6>
                                                    <span class="font-size-13 text-gray">Thời gian</span>
                                                </div>
                                            </div>
                                            <span>Nội dung bình luận</span>
                                        </li>
                                    </ul> 
                                </div> 
                                <div class="m-t-30">
                                    <nav>
                                        <ul class="pagination justify-content-end">
                                            <li class="page-item"><a class="page-link" href="#">Previous</a></li>
                                            <li class="page-item active"><a class="page-link" href="#">1</a></li>
                                            <li class="page-item"><a class="page-link" href="#">2</a></li>
                                            <li class="page-item"><a class="page-link" href="#">3</a></li>
                                            <li class="page-item"><a class="page-link" href="#">Next</a></li>
                                        </ul>
                                    </nav>
                                </div>           
                            </div>
                        </div>
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