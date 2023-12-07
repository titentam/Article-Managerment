<%@page import="model.bean.Category"%>
<%@ page import="model.bean.Article" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="model.bean.CommentView" %>
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
<%!public String arrayToString(ArrayList<Category> categories) { 
		StringBuilder builder = new StringBuilder();
		for (Category category1 : categories) {
			builder.append(category1.getName()).append(", ");
		}
		builder.deleteCharAt(builder.length() - 2);
		return builder.toString();
}%>
	
<%
    var record = (Article)request.getAttribute("record");
    var authors = (ArrayList<String>)request.getAttribute("authors");
    var comments = (ArrayList<CommentView>)request.getAttribute("comments");
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
                                <a class="breadcrumb-item" href="./article">List Article</a>
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
                                            <% if (!record.isLocked()) { %>
                                            	<a class="text-gray" href="javascript:void(0)" title="Tạm ẩn">
                                                <i class="anticon anticon-lock font-size-20" data-toggle="modal" data-target="#modalLock"></i>

                                                <!-- Modal -->
                                                <div class="modal fade" id="modalLock">
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
                                                                <form action="./article?action=submitLock&articleID=<%=record.getArticleID()%>" method="post">
                                                                    <input type="hidden" name="locked" value="true">
                                                                    <input type="submit" class="btn btn-primary" value="Xác nhận">
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </a>
                                            <% } else { %>
                                            <a class="text-gray" href="javascript:void(0)" title="Mở khóa">
                                                <i class="anticon anticon-unlock font-size-20" data-toggle="modal" data-target="#modalUnLock"></i>

                                                <!-- Modal -->
                                                <div class="modal fade" id="modalUnLock">
                                                    <div class="modal-dialog">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <h5 class="modal-title">Xác nhận mở khóa bài báo</h5>
                                                                <button type="button" class="close" data-dismiss="modal">
                                                                    <i class="anticon anticon-close"></i>
                                                                </button>
                                                            </div>
                                                            <div class="modal-body">
                                                                Bạn có muốn mở khóa bài báo này không ?
                                                            </div>
                                                            <div class="modal-footer">
                                                                <button type="button" class="btn btn-default" data-dismiss="modal">Hủy</button>
                                                                <form action="./article?action=submitLock&articleID=<%=record.getArticleID()%>" method="post">
                                                                    <input type="hidden" name="locked" value="false">
                                                                    <input type="submit" class="btn btn-primary" value="Xác nhận">
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </a>
                                            <% } %>
                                        </li>
                                        <li>
                                            <a class="text-gray" href="./article?action=update&articleID=<%=record.getArticleID()%>">
                                                <i class="anticon anticon-edit font-size-20"></i>
                                            </a>
                                        </li>
                                        <li>
                                            <a class="text-gray" href="javascript:void(0)" title="Xóa">
                                                <i class="anticon anticon-delete font-size-20" data-toggle="modal" data-target="#modalDelete"></i>

                                                <!-- Modal -->
                                                <div class="modal fade" id="modalDelete">
                                                    <div class="modal-dialog">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <h5 class="modal-title">Xác nhận xóa bài báo</h5>
                                                                <button type="button" class="close" data-dismiss="modal">
                                                                    <i class="anticon anticon-close"></i>
                                                                </button>
                                                            </div>
                                                            <div class="modal-body">
                                                                Bạn có muốn xóa vĩnh viễn bài báo này không ?
                                                            </div>
                                                            <div class="modal-footer">
                                                                <button type="button" class="btn btn-default" data-dismiss="modal">Hủy</button>
                                                                <form action="./article?action=submitDelete&articleID=<%=record.getArticleID()%>" method="post">
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
                                <h1 class="font-weight-normal m-b-10"><%=record.getTitle()%></h1>
                                <div class="d-flex m-b-30 justify-content-between align-items-end">
                                    <div class="d-flex align-items-center">
                                    	<div class="avatar avatar-cyan avatar-img">
                                        <img src="assets/images/avatars/thumb-6.jpg" alt="">
                                    </div>
                                    <div class="m-l-15">
                                    	<div class="d-flex align-items-center font-size-14">
											<p class="m-b-0 text-black">
                                                    Tác giả: 
                                            </p>
                                            <p class="m-b-0 ml-2 text-muted">
                                                    <%=Arrays.toString(authors.toArray()).replace("[", "").replace("]", "")%>
                                             </p>
										</div>
                                        
                                        <div class="d-flex align-items-center font-size-14">
											<p class="m-b-0 text-black">
                                                    Thể loại: 
                                            </p>
                                            <p class="m-b-0 ml-2 text-muted">
                                                    <%=arrayToString(record.getCategories()) %>
                                             </p>
										</div>
										
                                        <div class="m-b-0 d-flex align-items-center font-size-14">
												<p class="m-b-0 text-black">
                                                    Trạng thái: 
                                            	</p>
												<p class="m-b-0 ml-2 text-muted"><%=record.isLocked() ? "Không phát hành" : "Phát hành"%></p>
										</div>
                                    </div>
                                    </div>
                                    
                                    <p class="m-b-0 pr-2 text-muted font-size-14 font-italic">
                                            <%
                                                SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy MM:HH");
                                                String time = dateFormat.format(record.getTime());
                                            %>
                                            <%=time%>
                                    </p>
                                </div>
                                <img alt="" class="img-fluid w-100 rounded-lg" src="assets/images/others/img-8.jpg">
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
                                <h5>Bình luận (<%=comments.size()%>)</h5>
                                <% for (var comment: comments) {%>
                                <div class="m-t-20">
                                    <ul class="list-group list-group-flush">
                                        <li class="list-group-item p-h-0">
                                            <div class="media m-b-15">
                                                <div class="avatar avatar-image">
                                                    <img src="assets/images/avatars/thumb-8.jpg" alt="">
                                                </div>
                                                <div class="media-body m-l-20">
                                                    <h6 class="m-b-0">
                                                        <a href="" class="text-dark"><%=comment.getNameUser()%></a>
                                                    </h6>
                                                    <span class="font-size-13 text-gray">
                                                        <%
                                                            time = dateFormat.format(comment.getTime());
                                                        %>
                                                        <%=time%>
                                                    </span>
                                                </div>
                                            </div>
                                            <span><%=comment.getContent()%></span>
                                        </li>
                                    </ul>
                                </div>
                                <%}%>

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