
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
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
    <script>
        function validateForm() {
            var name = document.getElementById("name").value;
            var password = document.getElementById("password").value;
            var confirmPassword = document.getElementById("confirmPassword").value;
            var errorDisplay = document.getElementById("errorDisplay");
            if (name === "" || email === "" || dob === "" || gender === "" || userName === "" || password === "" || confirmPassword === "") {
                errorDisplay.innerHTML = "All fields must be filled out";
                return false;
            }
            if (name.length > 10||name.length<6) {
                errorDisplay.innerHTML = "Username must from 6 to 10 characters";
                return false;
            }
            if (password !== confirmPassword) {
                errorDisplay.innerHTML = "Password and Confirm Password do not match";
                return false;
            }
            // Check name
            if (/[\d~`!@#$%\^&*+=\-\[\]\\';,/{}|\\":<>\?]/.test(name)) {
                errorDisplay.innerHTML = "Name should not contain numbers or special characters";
                return false;
            }

            // Check password criteria
            if (password.length < 8 || !/[A-Z]/.test(password) || !/[a-z]/.test(password) || !/[!@#\$%\^&\*(),.?":{}|<>]/.test(password)) {
                errorDisplay.innerHTML = "Password must be at least 8 characters long and contain at least one uppercase letter, one lowercase letter, and one special character";
                return false;
            }

            // Check if passwords match
            if (password !== confirmPassword) {
                errorDisplay.innerHTML = "Password and Confirm Password do not match";
                return false;
            }

            errorDisplay.innerHTML = "";

            return true;
        }

    </script>
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
                                    String errormessage = (String)session.getAttribute("errormessage");
                                    session.removeAttribute("errormessage");
                                    if (errormessage != null) {
                                %>
                                <div style="color: red; margin-bottom: 10px;">
                                    <%= errormessage %>
                                </div>
                                <%
                                    }
                                %>
                                <div class="d-flex align-items-center justify-content-between m-b-30">
                                    <img class="img-fluid" alt="" src="../admin/assets/images/logo/logo.png">
                                    <h2 class="m-b-0">Sign Up</h2>
                                </div>
                                <form method="post" action="../register" onsubmit="return validateForm()">
                                    <div class="form-group">
                                        <label class="font-weight-semibold" for="userName">YourName:</label>
                                        <input name="name" type="text" class="form-control" id="name" placeholder="Username">
                                    </div>
                                    <div class="form-group">
                                        <label class="font-weight-semibold" for="email">Email:</label>
                                        <input name="email" type="email" class="form-control" id="email" placeholder="Email">
                                    </div>
                                    <div class="form-group">
                                        <label class="font-weight-semibold" for="userName">Your Date of birth:</label>
                                        <input name="dob" type="date" class="form-control" id="dob" placeholder="Username">
                                    </div>
                                    <div class="form-group">
                                        <label class="font-weight-semibold" for="userName">Gender:</label>
                                        <div class="cols-sm-10">
                                            <div class="input-group">
                                                <select class="form-control" name="gender" id="gender">
                                                    <option value="male">Male</option>
                                                    <option value="female">Female</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="font-weight-semibold" for="userName">Username:</label>
                                        <input name="username" type="text" class="form-control" id="userName" placeholder="Username">
                                    </div>
                                    <div class="form-group">
                                        <label class="font-weight-semibold" for="password">Password:</label>
                                        <input name="password" type="password" class="form-control" id="password" placeholder="Password">
                                    </div>
                                    <div class="form-group">
                                        <label class="font-weight-semibold" for="confirmPassword">Confirm Password:</label>
                                        <input name="confirm" type="password" class="form-control" id="confirmPassword" placeholder="Confirm Password">
                                    </div>
                                    <div id="errorDisplay" style="color: red; margin-bottom: 10px;"></div>
                                    <div class="form-group mb-0">
                                        <div class="d-flex align-items-center justify-content-between p-t-15">
                                           <div>
                                            	<div class="checkbox">
                                                <input id="checkbox" type="checkbox">
                                                <label for="checkbox"><span>I have read the <a href="">agreement</a></span></label>
                                                </div>
                                           </div>
                                        </div>
                                    </div>
                                    <div class="form-group pt-0">
                                        <div class="d-flex align-items-center justify-content-between p-t-15">
                                            <span class="font-size-14 text-muted">
                                                    You have an account?
                                                    <a class="normal" href="Login.jsp"> Login</a>
                                            </span>
                                            <button type="submit" class="btn btn-primary">Sign Up</button>
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
