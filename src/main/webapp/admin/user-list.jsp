<%@page import="model.bean.Role"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.bean.User"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Danh sách người dùng</title>

    <!-- Favicon -->
    <link rel="shortcut icon" href="assets/images/logo/favicon.png">

    <!-- page css -->

    <!-- Core css -->
    <link href="assets/css/app.min.css" rel="stylesheet">
	<style>
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
	<%!
		public String formatDate(Date date) {
			SimpleDateFormat format = new SimpleDateFormat("dd-MM-yyyy");
			return format.format(date);
		}
	%>
	<% 
		ArrayList<User> listUser = (ArrayList<User>) request.getAttribute("listUser"); 
		ArrayList<Role> listRole = (ArrayList<Role>) request.getAttribute("listRole"); 
		int numOfPage = (int) request.getAttribute("numOfPage");
		int currentPage = (int) request.getAttribute("currentPage");
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
                                <span class="breadcrumb-item active">Quản lí người dùng</span>
                            </nav>
                        </div>
                    </div>
                    
                    <div class="card" style="min-height: 500px">
                        <div class="card-body">
                            <div class="row m-b-20 rounded">
                                <div class="col-lg-9">
                                    <div class="d-md-flex">
                                        <div class="m-b-10 m-t-10 w-100">
                                            <form name="search-and-filter" action="../admin/manage-user" method="get" 
                                            	class="d-flex justify-content-between" onsubmit="c()">
                                            	<input type="hidden" name="action" value="list-user"/>
                                            	<select class="border-dark rounded" name="role-category" onchange="optimizeURL()" 
                                            		class="custom-select" style="width: 200px;">
                                                	<option value="all" selected>Tất cả</option>
                                                	<% for (Role role : listRole) { %>
                                                		<option value="<%=role.getRoleID() %>"><%=role.getName() %></option>
                                                	<% } %>
                                            	</select>
                                            	
                                            	<div class="my-2 my-lg-0 d-flex align-items-center w-60">
      												<input class="form-control w-50 border-dark" type="search" name="search-text" placeholder="Nhập mã, email, tên người dùng, ..." aria-label="Search">
      												<button type="submit" style="background: #333" class="btn btn-tone btn-outline-light my-2 my-sm-0" type="submit">Search</button>
    												<p class="text-danger font-italic m-b-0 ml-2" id='empty-search-error'></p>
    											</div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="table-responsive">
                                <table class="table table-hover e-commerce-table">
                                    <thead style="background: lightskyblue">
                                        <tr class="text-center">
                                            <th>Tên người dùng</th>
                                            <th>Họ và tên</th>
                                            <th>Email</th>
                                            <th>Ngày sinh</th>
                                            <th>Giới tính</th>
                                            <th>Chức vụ</th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <% for (int i = 0; i < listUser.size(); i++) { %>
                                        	<tr>
                                            <td>
                                                <h6 class="m-b-0 pl-3"><%=listUser.get(i).getUsername() %></h6>
                                            </td>
                                            <td>
                                                <div class="d-flex align-items-center">
                                                    <div class="avatar avatar-image avatar-sm m-r-10">
                                                        <img src="assets/images/avatars/thumb-1.jpg" alt="">
                                                    </div>
                                                    <h6 class="m-b-0"><%=listUser.get(i).getName() %></h6>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="d-flex align-items-center">
                                                    <div class="m-b-0"><%=listUser.get(i).getEmail() %></div>
                                                </div>
                                            </td>
                                            <td><div class="text-center"><%=formatDate(listUser.get(i).getDob()) %></div></td>
                                            <td>
                                            	<% if (listUser.get(i).getGender() == 1) {%>
                                            		<div class="text-center">Nam</div>
                                            	<% } else { %>
                                            		<div class="text-center">Nữ</div>
                                            	<% } %>
                                            </td>
                                            <td>
                                                <% if (listUser.get(i).getRoleName().equals("Quản trị viên")) { %>
                                                	<div class="d-flex align-items-center justify-content-center">
                                                    <div class="badge badge-success badge-dot m-r-10"></div>
                                                    <div class="text-center">Quản trị viên</div>
                                                    </div>
                                                <% } else { %>
                                                    <div class="text-center"><%=listUser.get(i).getRoleName() %></div>
                                                <% } %>
                                                
                                            </td>
                                            <td class="text-right d-flex">
                                                <form action="../admin/manage-user?action=user-update" method="post">
                                                	<input type="hidden" name="username" value="<%=listUser.get(i).getUsername() %>">
                                                	<button type="submit" title="Update" class="btn btn-icon btn-hover btn-sm btn-rounded pull-right">
                                                    	<i class="anticon anticon-edit"></i>
                                                	</button>
                                                </form>
                                                <form action="../admin/manage-user?action=user-delete" method="post">
                                                	<input type="hidden" name="username" value="<%=listUser.get(i).getUsername() %>">
                                                	<button type="submit" title="Block" class="btn btn-icon btn-hover btn-sm btn-rounded">
                                                    	<i class="anticon anticon-delete"></i>
                                                	</button>
                                                </form>
                                            </td>
                                        </tr>	
                                        <% } %>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="">
                        <nav>
                            <ul class="pagination justify-content-center">
                                <% for (int i = 1; i <= numOfPage; i++) { %>
                                	<% if (currentPage == i) {%>
                                	<li class="page-item active"><a class="page-link" onclick="changePageLink(<%=i%>)"><%=i %></a></li>
                                	<% } else { %>
                                	<li class="page-item"><a class="page-link" onclick="changePageLink(<%=i%>)"><%=i %></a></li>
                                	<% } %>
                                <% } %>
                            </ul>
                        </nav>
                    </div>
                </div>
                <!-- Content Wrapper END -->

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
	var role_select = document.querySelector('select[name=\'role-category\']');
	var search_input = document.querySelector('input[name=\'search-text\']');
	var empty_search_error = document.querySelector('#empty-search-error');
	
	window.onload = function(e) {
		const queryString = window.location.search;
		const urlParams = new URLSearchParams(queryString);
		const role_category = urlParams.get('role-category');
		const search_text = urlParams.get('search-text');
		role_select.value = role_category !== null ? role_category : "all" ;
		search_input.value = search_text !== "#" ? search_text : "" ;
	}
	
	function roleCategoryChange() {
		optimizeURL();
	}
	
	 // Hàm thay đổi href của các thẻ <a> khi click vào
    function changePageLink(page) {
    	const queryString = window.location.search;
		const urlParams = new URLSearchParams(queryString);
		const role_category = urlParams.get('role-category');
		const search_text = urlParams.get('search-text');
		
		currentHref = '?page=' + page;
		if (role_category != null && role_category !== "")
        	currentHref += '&role-category=' + role_category;
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
		if (role_select.value !== "")
        	currentHref += '&role-category=' + role_select.value;
		if (search_input.value.trim() !== '')
	        currentHref += '&search-text=' + search_input.value.trim();

		window.location.href = currentHref;
    }
</script>
</html>