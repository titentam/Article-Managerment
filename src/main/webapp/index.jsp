<%@ page import="java.util.ArrayList" %>
<%@ page import="model.bean.Article" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	Hi all!
	<a href="TestController">Di test</a>
	<%
		String mess = (String)request.getAttribute("test");
		var list = (ArrayList<Article>)request.getAttribute("list");
	%>
	<span><%=mess %></span>
	<h2>Test article db</h2>
	<% if (list!=null){%>
	<ul>
		<%for (var item:list) { %>
			<li>
				<h5><%=item.getTitle()%></h5>
				<h5><%=item.getContent()%></h5>
			</li>
		<%}  %>
	</ul>
	<%}%>

</body>
</html>