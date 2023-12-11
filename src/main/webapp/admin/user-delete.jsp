<%@page import="model.bean.Role"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.bean.User"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Xóa người dùng</title>

<!-- Favicon -->
<link rel="shortcut icon" href="assets/images/logo/favicon.png">

<!-- page css -->
<link href="assets/vendors/select2/select2.css" rel="stylesheet">

<!-- Core css -->
<link href="assets/css/app.min.css" rel="stylesheet">
<style>
	.card {
		box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;
	}
</style>
</head>

<body>
	<div class="app">
		<div class="layout">
			<!-- Header START -->
			<%@include file="component/header.jsp"%>
			<!-- Header END -->

			<!-- Side Nav START -->
			<%@include file="component/sideNav.jsp"%>
			<!-- Side Nav END -->
			<%
			User userDeleted = (User) request.getAttribute("user");
			ArrayList<Role> listRole = (ArrayList<Role>) request.getAttribute("listRole");
			%>
			<!-- Page Container START -->
			<div class="page-container">
				<!-- Content Wrapper START -->
				<div class="main-content">
					<div class="page-header">
						<h2 class="header-title">Xóa người dùng</h2>
						<div class="header-sub-title">
							<nav class="breadcrumb breadcrumb-dash">
								<a href="#" class="breadcrumb-item"><i
									class="anticon anticon-home m-r-5"></i>Trang chủ</a> <a
									class="breadcrumb-item" href="../admin/manage-user?action=list-user">Quản lí người dùng</a> 
									<span class="breadcrumb-item active"><%=userDeleted.getUsername() %></span>
							</nav>
						</div>
					</div>
					<div class="container">
						
						<div class="tab-pane fade show active">
							<div class="card">
								<div class="card-header">
									<h4 class="card-title">Thông tin người dùng</h4>
								</div>
								<div class="card-body">
									<div class="media align-items-center">
										<div class="avatar avatar-image  m-h-10 m-r-15"
											style="height: 80px; width: 80px">
											<img src="assets/images/avatars/thumb-3.jpg" alt="">
										</div>
										<div class="m-l-20 m-r-20">
											<h5 class="m-b-0 font-size-20">Xóa người dùng</h5>
											<p class="text-center m-b-0 font-size-16 text-primary"><%=userDeleted.getUsername() %></p>
											<% if (userDeleted.getLocked() == 0) { %>
												<p class="text-center m-b-0 font-size-16 text-success font-italic">
												<%=userDeleted.getRoleName() %>
												</p>
                                        	<% } else { %>
                                        		<p class="text-center m-b-0 font-size-16 text-danger font-italic">
													(Đã xóa)
												</p>
                                        	<% } %>
										</div>
									</div>
									<hr class="m-v-25">
									<div>
										<div class="form-row">
											<div class="form-group col-md-6">
												<label class="font-weight-semibold" for="email">Họ tên:</label>
												<input type="text" class="form-control" id="name"
													placeholder="email" value="<%=userDeleted.getName() %>" readonly>
											</div>
																					
											<div class="form-group col-md-6">
												<label class="font-weight-semibold" for="userName">Tên người dùng:</label> 
												<input type="text" class="form-control" 
													placeholder="User Name" value="<%=userDeleted.getUsername() %>" readonly>
											</div>
										</div>
										<div class="form-row">
											<div class="form-group col-md-6">
												<label class="font-weight-semibold" for="email">Email:</label>
												<input type="text" class="form-control" id="email"
													placeholder="email" value="<%=userDeleted.getEmail() %>" readonly>
											</div>
											
											<div class="form-group col-md-6">
												<label class="font-weight-semibold" for="dob">Ngày sinh:</label> 
													<input type="date" class="form-control" id="dob"
													placeholder="Date of Birth" value="<%=userDeleted.getDob() %>" readonly>
											</div>
										</div>
										
										<div class="form-row">
											<div class="form-group col-md-6">
												<label class="font-weight-semibold" for="gender">Giới tính:</label>
												<select id="language" class="form-control" disabled="disabled">
													<% if (userDeleted.getGender() == 0) { %>
														<option value="1">Nam</option>
													<% } else { %>
														<option value="0">Nữ</option>
													<% } %>
												</select>
											</div>
											
											<div class="form-group col-md-6">
											<label class="font-weight-semibold" for="language">Chức vụ: </label>
											<select name="roleID" id="role" class="form-control" disabled="disabled">
											<% for (Role role : listRole) { %>
												<% if (userDeleted.getRoleID().equals(role.getRoleID())) {%>
													<option value="<%=role.getRoleID() %>" selected><%=role.getName() %></option>
												<% } else { %>
													<option value="<%=role.getRoleID() %>"><%=role.getName() %></option>
												<% } %>
                                            <% } %>
											</select>
											</div>
										</div>
										<div class="text-center">
                                        	<% if (userDeleted.getLocked() == 0) { %>
                                        		<button class="pl-5 pr-5 btn btn-danger text-white" data-toggle="modal" 
                                        			data-target="#exampleModalLock">Khóa tài khoản</button>

                                                <!-- Modal -->
                                                <div class="modal fade" id="exampleModalLock">
                                                    <div class="modal-dialog">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <h5 class="modal-title">Xác nhận khóa tài khoản</h5>
                                                                <button type="button" class="close" data-dismiss="modal">
                                                                    <i class="anticon anticon-close"></i>
                                                                </button>
                                                            </div>
                                                            <div class="modal-body">
                                                                Bạn có muốn khóa tài khoản này không ?
                                                            </div>
                                                            <div class="modal-footer">
                                                                <button type="button" class="btn btn-default" data-dismiss="modal">Hủy</button>
                                                                <form action="../admin/manage-user?action=submit-delete" method="post">
                                                                	<button type="submit" class="btn btn-primary">Xác nhận</button>
                                                                	<input type="hidden" name="username" value="<%=userDeleted.getUsername() %>">
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                        	<% } else { %>
                                        		<button class="pl-5 pr-5 btn" disabled>Xóa</button>
                                        	<% } %>
                                        </div>
									</div>
								</div>
							</div>
						</div>
					</div>
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
	<script src="assets/vendors/select2/select2.min.js"></script>
	<script src="assets/vendors/quill/quill.min.js"></script>
	<script src="assets/js/pages/e-commerce-product-edit.js"></script>

	<!-- Core JS -->
	<script src="assets/js/app.min.js"></script>

</body>

</html>