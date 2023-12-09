<%@page import="model.bean.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Thông tin tài khoản</title>
<link rel="shortcut icon" href="assets/images/logo/favicon.png">

<!-- CSS here -->
<%@include file="component/allcss.jsp"%>
</head>
    
<body>
<%@include file="component/header.jsp"%>
<main>
	<% 
		User user = (User)request.getAttribute("user"); 
		String passMessage = request.getAttribute("pass-message") != null ? (String) request.getAttribute("pass-message") : "";
		String updateMessage = request.getAttribute("update-message") != null ? (String) request.getAttribute("update-message") : "";
	%>
    <!-- About US Start -->
    <div class="about-area2 gray-bg pt-60 pb-60">
        <div class="container">
        	<div class="main-content">
                    <div class="container">
                            <div class="tab-pane fade show active" >
                                <div class="card">
                                    <div class="card-header">
                                        <h4 class="card-title mb-0">Thông tin cơ bản</h4>
                                    </div>
                                    <div class="card-body">
                                        <div class="media align-items-center">
                                            <div class="avatar avatar-image  m-h-10 mr-20"
											style="height: 80px; width: 80px">
											<img class="rounded-circle w-100 h-100" src="assets/img/avatars/thumb-3.jpg" alt="">
										</div>
                                            <div class="m-l-20 mr-20">
                                                <h5 class="font-size-18">Cập nhật tài khoản</h5>
                                                <p class="opacity-07 font-size-13 mb-0">
                                                    <%=user.getUsername() %>
                                                </p>
                                            </div>
                                        </div>
                                        <hr class="m-v-25">
                                        <form name="update-account" action="../client/account?action=update" method="post">
                                        	<div class="form-row justify-content-center">
                                                <h5 class="error pl-2 mb-3 text-primary font-italic"><%=updateMessage %></h5>
                                            </div>
                                            <div class="form-row">
                                                <div class="form-group col-md-6">
                                                    <label class="font-weight-semibold" for="name">Họ tên:</label>
													<input type="text" class="form-control" name="name"
														placeholder="Họ tên"  value="<%=user.getName() %>">
													<span class="error pl-2 text-danger"></span>
                                                </div>
                                                <div class="form-group col-md-6">
                                                    <label class="font-weight-semibold" for="email">Email:</label>
													<input type="text" class="form-control" name="email"
														placeholder="Email" value="<%=user.getEmail() %>" required="required">
													<span class="error pl-2 text-danger"></span>
                                                </div>
                                            </div>
                                            <% String role = user.getRoleName();
                                            	if (role.equals("User"))
                                            		role = "Người dùng";
                                            	else if (role.equals("Admin"))
                                            		role = "Quản trị viên";
                                           	%>
                                            <div class="form-row">
                                                <div class="form-group col-md-4">
                                                    <label class="font-weight-semibold" for="role">Chức vụ:</label>
													<input type="text" class="form-control" id="role"
														placeholder="Chức vụ" value="<%=role %>" readonly>
                                                </div>
                                                <div class="form-group col-md-4">
                                                    <label class="font-weight-semibold" for="dob">Ngày sinh:</label> 
													<input type="date" class="form-control" name="dob"
														placeholder="Date of Birth" value="<%=user.getDob()%>" required="required">
													<span class="error pl-2 text-danger"></span>
                                                </div>
                                                <div class="form-group col-md-4">
                                                    <label class="font-weight-semibold" for="gender">Giới tính:</label>
													<select class="form-control" name="gender">
													<% if (user.getGender() == 0) { %>
														<option value="1">Nam</option>
														<option value="0" selected>Nữ</option>
													<% } else { %>
														<option value="1" selected>Nam</option>
														<option value="0">Nữ</option>
													<% } %>
													</select>
													<span class="error pl-2 text-danger"></span>
                                                </div>
                                            </div>
                                            <div class="form-group text-center">
                                                    <button type="submit" class="btn btn-primary mt-2" style="padding: 20px;" onclick="validateSubmit()">Cập nhật</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                                <div class="card">
                                    <div class="card-header">
                                        <h4 class="card-title mb-0">Đổi mật khẩu</h4>
                                    </div>
                                    <div class="card-body">
                                        <form name="change-password" action="../client/account?action=change-password" method="post">
                                            <div class="form-row">
                                                <div class="form-group col-md-4 mb-0">
                                                    <label class="font-weight-semibold" for="oldPassword">Mật khẩu cũ:</label>
                                                    <input type="password" class="form-control" name="oldPassword" id="oldPassword" placeholder="Mật khẩu cũ">
                                                    <span class="error pl-2 text-danger"></span>
                                                </div>
                                                <div class="form-group col-md-4 mb-0">
                                                    <label class="font-weight-semibold" for="newPassword">Mật khẩu mới:</label>
                                                    <input type="password" class="form-control" name="newPassword" placeholder="Mật khẩu mới">
                                                    <span class="error pl-2 text-danger"></span>
                                                </div>
                                                <div class="form-group col-md-4 mb-0">
                                                    <label class="font-weight-semibold" for="confirmPassword">Xác nhận mật khẩu:</label>
                                                    <input type="password" class="form-control" name="confirmPassword" placeholder="Xác nhận mật khẩu">
                                                    <span class="error pl-2 text-danger"></span>
                                                </div>
                                            </div>
                                            <div class="form-row justify-content-center">
                                                <h5 class="error pl-2 text-danger font-italic"><%=passMessage %></h5>
                                            </div>
                                            <div class="form-group text-center">
                                    	        <button type="submit" class="btn btn-primary mt-3" style="padding: 20px;"  onclick="submitPassword()">Đổi mật khẩu</button>
                                           	</div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                    </div>
                </div>
                <!-- Content Wrapper END -->
        </div>
    </div>
    <!-- About US End -->
</main>

<%@include file="component/footer.jsp"%>

<!-- JS here -->
<%@include file="component/alljs.jsp"%>
    
</body>
<script type="text/javascript">
	function validateSubmit () {
		event.preventDefault();
		var name_input = document.querySelector('input[name=\'name\']');
		var email_input = document.querySelector('input[name=\'email\']');
		var dob_input = document.querySelector('input[name=\'dob\']');
		var gender_select = document.querySelector('select[name=\'gender\']');
		
		var isCorrectName = validateEmpty(name_input);
		var isCorrectEmail = validateEmail(email_input);
		var isCorrectDob = validateEmpty(dob_input);
		var isCorrectGender = validateEmpty(gender_select);
		
		var isCorrect = isCorrectName && isCorrectDob && isCorrectGender && isCorrectEmail;
		if (isCorrect)
			document.forms["update-account"].submit();
	}
	

	function submitPassword () {
		event.preventDefault();
		var oldPassword = document.querySelector('input[name=\'oldPassword\']');
		var newPassword = document.querySelector('input[name=\'newPassword\']');
		var confirmPassword = document.querySelector('input[name=\'confirmPassword\']');
		
		var isCorrect = false;
		var isCorrectOldPass = validateEmpty(oldPassword);
		var isCorrectNewPass = validatePassword(newPassword);
		var isCorrectConfirmPass = validateConfirmPwd(newPassword, confirmPassword);
		
		var isCorrect = isCorrectOldPass && isCorrectNewPass && isCorrectConfirmPass;
		if (isCorrect)
			document.forms["change-password"].submit();
	}
	
	function validateEmpty(element) {
		var errorSpan = element.parentElement.querySelector(".error");
		if (element.value.trim() === "") {
			errorSpan.innerHTML = "Vui lòng nhập trường này";
			return false;
		} else {
			errorSpan.innerHTML = "";
		}
		return true;
	}
	
	function validateEmail(element) {
		var errorSpan = element.parentElement.querySelector(".error");
		var pattern = /^\S+@\S+\.\S+$/;
		if (!pattern.test(element.value)) {
			errorSpan.innerHTML = "Vui lòng đúng định dạng email";
			return false;
		} else {
			errorSpan.innerHTML = "";
		}
		return true;
	}
	
	function validatePassword(element) {
		const passwordRegex = /^.{8,}$/;
		var isCorrect = false;
		var errorSpan = element.parentElement.querySelector(".error");
		var password = element.value;
		
		if (password.match(passwordRegex)) {
			isCorrect = true;
			errorSpan.innerHTML = "";
		} else {
			errorSpan.innerHTML = "Mật khẩu phải có ít nhất 8 ký tự";
		}
		return isCorrect;
	}
	
	function validateConfirmPwd(newPassElement, confirmPassElement) {
		var confirm_pwd = confirmPassElement.value;
		var pwd = newPassElement.value;
		var confirm_pwd_error = confirmPassElement.parentElement.querySelector(".error");
		
		var isCorrect = false;

		if (pwd == confirm_pwd) {
			isCorrect = true;
			confirm_pwd_error.innerHTML = "";
		} else {
			confirm_pwd_error.innerHTML = "* Mật khẩu xác thực không trùng khớp";
		}

		return isCorrect;
	}
</script>
</html>