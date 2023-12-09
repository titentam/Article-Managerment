<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Enlink - Admin Dashboard Template</title>
    <!-- Favicon -->
    <link rel="shortcut icon" href="../admin/assets/images/logo/favicon.png">
    <!-- page css -->
    <!-- Core css -->
    <link href="../admin/assets/css/app.min.css" rel="stylesheet">
</head>
<body>
<div class="app">
    <div class="container-fluid p-h-0 p-v-20 bg full-height d-flex" style="background-image: url('../admin/assets/images/others/login-3.png')">
        <div class="d-flex flex-column justify-content-between w-100">
            <div class="container d-flex h-100">
                <div class="row align-items-center w-100">
                    <div class="col-md-7 col-lg-5 m-h-auto">
                        <div class="card shadow-lg">
                            <div class="card-body">
                                <%
                                    String loginMessage = (String) request.getAttribute("loginMessage");
                                    if (loginMessage != null) {
                                %>
                                <div style="color: red; margin-bottom: 10px;">
                                    <%= loginMessage %>
                                </div>
                                <%
                                    }
                                %>
                                <div class="d-flex align-items-center justify-content-between m-b-30">
                                    <img class="img-fluid" alt="" src="../admin/assets/images/logo/logo.png">
                                    <h2 class="m-b-0">Sign In</h2>
                                </div>
                                <form action="../login" method="post">
                                    <div class="form-group">
                                        <label class="font-weight-semibold" for="userName">Username:</label>
                                        <div class="input-affix">
                                            <i class="prefix-icon anticon anticon-user"></i>
                                            <input name="username" type="text" class="form-control" id="userName" placeholder="Username">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label  class="font-weight-semibold" for="password">Password:</label>
                                        <a class="float-right font-size-13 text-muted" href="">Forget Password?</a>
                                        <div class="input-affix m-b-10">
                                            <i class="prefix-icon anticon anticon-lock"></i>
                                            <input name="password" type="password" class="form-control" id="password" placeholder="Password">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="d-flex align-items-center justify-content-between">
                                                <span class="font-size-13 text-muted">
                                                    Don't have an account?
                                                    <a class="small" href="Register.jsp"> Signup</a>
                                                </span>
                                            <button type="submit" class="btn btn-primary">Sign In</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="d-none d-md-flex p-h-40 justify-content-between">
                <span class="">© 2019 ThemeNate</span>
                <ul class="list-inline">
                    <li class="list-inline-item">
                        <a class="text-dark text-link" href="">Legal</a>
                    </li>
                    <li class="list-inline-item">
                        <a class="text-dark text-link" href="">Privacy</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
<!-- Core Vendors JS -->
<script src="../admin/assets/js/vendors.min.js"></script>
<!-- page js -->
<!-- Core JS -->
<script src="../admin/assets/js/app.min.js"></script>
</body>
</html>
