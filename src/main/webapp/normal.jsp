<%@page import="com.mycompany.ecommerce.entities.User"%>
<%
    User user=(User)session.getAttribute("current-user");
    if(user==null){
    session.setAttribute("message", "You are not logged in !! ");
    response.sendRedirect("login.jsp");
    return;
    }
    if(user.getUserType().equals("admin")){
    session.setAttribute("message", "You do not have permission to access this page");
    response.sendRedirect("login.jsp");
    return;
    }
    %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>This is normal user page</h1>
    </body>
</html>
