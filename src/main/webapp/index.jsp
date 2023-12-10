<%--
  Created by IntelliJ IDEA.
  User: A Ti
  Date: 12/10/2023
  Time: 5:17 PM
  To change this template use File | Settings | File Templates.
--%>
<%
    String requestURI = request.getRequestURI();
    String path = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
    String redirectURL = path + "/client/article";
    response.sendRedirect(redirectURL);
%>
