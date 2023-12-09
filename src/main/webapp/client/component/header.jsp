<%--
  Created by IntelliJ IDEA.
  User: A Ti
  Date: 12/2/2023
  Time: 5:02 PM
  To change this template use File | Settings | File Templates.
--%>
<!-- Preloader Start -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<div id="preloader-active">
    <div class="preloader d-flex align-items-center justify-content-center">
        <div class="preloader-inner position-relative">
            <div class="preloader-circle"></div>
            <div class="preloader-img pere-text">
                <img src="assets/img/logo/logo.png" alt="">
            </div>
        </div>
    </div>
</div>
<!-- Preloader Start -->
<header>
    <!-- Header Start -->
    <div class="header-area">
        <div class="main-header ">
            <div class="header-top black-bg d-none d-sm-block">
                <div class="container">
                    <div class="col-xl-12">
                        <div class="row d-flex justify-content-between align-items-center">
                            <div class="header-info-left">
                                <ul>
                                    <li class="title"><span class="flaticon-energy"></span> bknews</li>
                                    <li>Bài thực hành CNW</li>
                                </ul>
                            </div>
                            <div class="header-info-right">
                                <ul class="header-date">
                                    <li><span class="flaticon-calendar"></span> 0931211369</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="header-mid gray-bg">
                <div class="container">
                    <div class="row d-flex align-items-center">
                        <!-- Logo -->
                        <div class="col-xl-3 col-lg-3 col-md-3 d-none d-md-block">
                            <div class="logo">
                                <a href="index.html"><img src="assets/img/logo/logo.png" alt=""></a>
                            </div>
                        </div>
                        <div class="col-xl-9 col-lg-9 col-md-9">
                            <div class="header-banner f-right ">
                                <img src="assets/img/gallery/header_card.png" alt="">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="header-bottom header-sticky">
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col-xl-8 col-lg-8 col-md-12 header-flex">
                            <!-- sticky -->
                            <div class="sticky-logo">
                                <a href="index.html"><img src="assets/img/logo/logo.png" alt=""></a>
                            </div>
                            <!-- Main-menu -->
                            <div class="main-menu d-none d-md-block">
                                <nav>
                                    <ul id="navigation">
                                        <li><a href="../article-detail.jsp">Home</a></li>
                                        <li><a href="categori.html">Category</a>
                                            <ul class="submenu">
                                                <li><a href="../blog.jsp">Blog</a></li>
                                                <li><a href="blog_details.html">Blog Details</a></li>
                                                <li><a href="elements.html">Element</a></li>
                                            </ul>
                                        </li>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                        <div class="col-xl-4 col-lg-4 col-md-4">
                            <div class="header-right f-right d-none d-lg-block main-menu ">
                                <!-- Heder social -->
                                <%
                                	String username = (String) session.getAttribute("username");
                                %>
                                <ul class="header-social">
                                    <li><a href="categori.html">Tài khoản</a>
                                        <% if (username == null) { %>
                                        <ul class="submenu">
                                        	<li><a href="">Đăng nhập</a></li>
                                            <li><a href="blog_details.html">Đăng ký</a></li>
                                        </ul>
                                        <% } else { %>
                                        <ul class="submenu">
                                        	<li><a href="../client/account?action=account-setting">Tài khoản</a></li>
                                            <li><a href="../logout">Đăng xuất</a></li>
                                        </ul>
                                        <% } %>
                                    </li>
                                </ul>
                                
                                <!-- Search Nav -->
                                <div class="nav-search search-switch">
                                    <i class="fa fa-search"></i>
                                </div>
                            </div>
                        </div>
                        <!-- Mobile Menu -->
                        <div class="col-12">
                            <div class="mobile_menu d-block d-md-none"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Header End -->
</header>
