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

            <!-- Page Container START -->
            <div class="page-container">
                <!-- Content Wrapper START -->
                <div class="main-content">
                    <div class="page-header">
                        <h2 class="header-title">Danh sách bài báo</h2>
                        <div class="header-sub-title">
                            <nav class="breadcrumb breadcrumb-dash">
                                <a href="#" class="breadcrumb-item"><i class="anticon anticon-home m-r-5"></i>Trang chủ</a>
                                <a class="breadcrumb-item" href="#">Quản lí người dùng</a>
                                <span class="breadcrumb-item active">Danh sách</span>
                            </nav>
                        </div>
                    </div>
                    
                    <div class="card">
                        <div class="card-body">
                            <div class="row m-b-30">
                                <div class="col-lg-8">
                                    <div class="d-md-flex">
                                        <div class="m-b-10">
                                            <select class="custom-select" style="min-width: 180px;">
                                                <option selected>Chức vụ</option>
                                                <option value="all">Tất cả</option>
                                                <option value="R1">Quản trị viên</option>
                                                <option value="R2">Độc giả</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="table-responsive">
                                <table class="table table-hover e-commerce-table">
                                    <thead>
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
                                        <% for (int i = 0; i < 6; i++) { %>
                                        	<tr>
                                            <!-- <td>
                                                <div class="checkbox">
                                                    <input id="check-item-1" type="checkbox">
                                                    <label for="check-item-1" class="m-b-0"></label>
                                                </div>
                                            </td> -->
                                            <td>
                                                <h6 class="m-b-0">mymymy</h6>
                                            </td>
                                            <td>
                                                <div class="d-flex align-items-center">
                                                    <div class="avatar avatar-image avatar-sm m-r-10">
                                                        <img src="assets/images/avatars/thumb-1.jpg" alt="">
                                                    </div>
                                                    <h6 class="m-b-0">Nguyễn Thị Trà My</h6>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="d-flex align-items-center">
                                                    <div class="m-b-0">nguyentramy19112003@gmail.com</div>
                                                </div>
                                            </td>
                                            <td>19-11-2003</td>
                                            <td>Nam</td>
                                            <td>
                                                <div class="d-flex align-items-center">
                                                    <div class="badge badge-success badge-dot m-r-10"></div>
                                                    <div>Quản trị viên</div>
                                                </div>
                                            </td>
                                            <td class="text-right">
                                                <a href="user-form.jsp">
                                                <button title="Update" class="btn btn-icon btn-hover btn-sm btn-rounded pull-right">
                                                    <i class="anticon anticon-edit"></i>
                                                </button>
                                                </a>
                                                <a href="article-form.jsp">
                                                <button title="Block" class="btn btn-icon btn-hover btn-sm btn-rounded">
                                                    <i class="anticon anticon-delete"></i>
                                                </button>
                                                </a>
                                            </td>
                                        </tr>	
                                        <% } %>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
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