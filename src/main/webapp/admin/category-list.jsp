<%@ page import="java.util.ArrayList" %>
<%@ page import="model.bean.Category" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Category</title>

    <!-- Favicon -->
    <link rel="shortcut icon" href="assets/images/logo/favicon.png">

    <!-- page css -->
    <link href="assets/vendors/datatables/dataTables.bootstrap.min.css" rel="stylesheet">

    <!-- Core css -->
    <link href="assets/css/app.min.css" rel="stylesheet">
</head>

<body>
<%
    var categories = (ArrayList<Category>)request.getAttribute("categories");
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
                        <h2 class="header-title">Danh sách loại báo</h2>
                        <div class="header-sub-title">
                            <nav class="breadcrumb breadcrumb-dash">
                                <a href="#" class="breadcrumb-item"><i class="anticon anticon-home m-r-5"></i>Home</a>
                                <a class="breadcrumb-item" href="#">Quản lí bài báo</a>
                                <span class="breadcrumb-item active">Danh sách loại báo</span>
                            </nav>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-body">
                            <div class="row m-b-30">
                                <div class="col-lg-4 text-right" style="margin-left: 65%;">
                                    <form name="add" action="./category?action=submitInsert" class="row" method="post">
                                        <input name="name" type="text" class="form-control col-8" placeholder="Nhập tên danh mục mới">
                                        <button type="button" class="btn btn-primary col-4" onclick="submitForm()">
                                            <i class="anticon anticon-file-excel m-r-5"></i>
                                            <span>Thêm</span>
                                        </button>
                                    </form>
									<div id="error" class="text-danger text-left m-t-5"></div>
                                </div>
                            </div>
                            <div class="table-responsive">
                                <table class="table table-hover">
                                    <thead style="background: lightskyblue">
                                    <tr>
                                        <th>ID</th>
                                        <th>Tên thể loại</th>
                                        <th>Cập nhật</th>
                                        <th class="text-center">Xác nhận cập nhật</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <%for (var category: categories) {%>
                                    <form action="./category?action=submitUpdate" method="post">
                                        <tr>

                                            <input type="hidden" name="categoryID" value="<%=category.getCategoryID()%>">
                                            <td>
                                                <%=category.getCategoryID()%>
                                            </td>
                                            <td>
                                                <%=category.getName() %>
                                            </td>
                                            <td>
                                                <div class="d-flex align-items-center">
                                                    <input class="form-control border-grey m-b-0" type="text" name="name" value="<%=category.getName()%>">
                                                </div>
                                            </td>
                                            <td class="text-center">
                                                <button type="submit" class="btn btn-icon btn-hover btn-sm btn-rounded">
                                                    <i class="anticon anticon-edit"></i>
                                                </button>
                                            </td>
                                        </tr>
                                    </form>

                                    <%}%>

                                    </tbody>
                                </table>

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
    <script src="assets/vendors/datatables/jquery.dataTables.min.js"></script>
    <script src="assets/vendors/datatables/dataTables.bootstrap.min.js"></script>
    <script src="assets/js/pages/e-commerce-order-list.js"></script>

    <!-- Core JS -->
    <script src="assets/js/app.min.js"></script>

</body>
<script type="text/javascript">
	var name_input = document.querySelector('input[name="name"]');
	var error_span = document.querySelector('#error');
	function submitForm () {
		event.preventDefault();
		if (name_input.value.trim() === "") {
			error_span.innerHTML = 'Vui lòng nhập thể loại!';
		} else {
			<% for (int i = 0; i < categories.size(); i++) { %>
				if (name_input.value.trim() == '<%=categories.get(i).getName() %>') {
					error_span.innerHTML = "Thể loại đã tồn tại!";
					return;
				}
			<% } %>
			name_input.value = name_input.value.trim();
			error_span.innerHTML = "";
			document.forms['add'].submit();
		}
	}
</script>
</html>