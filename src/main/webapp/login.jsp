
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ecommerce Login</title>
        <%@include file="components/common_css_js.jsp"%>
    </head>
    <body style="background:#037971">
        <%@include file="components/navbar.jsp" %>
        <div class="container ">
            <div class="row">
                <div class="col-md-6 offset-md-3">
                    <div class="card mt-3 border-0">
                        <div class="card-header custom-bg text-white">
                            <center> <img src="img/logging.png" alt="Logo" class="img-fluid mb-3 stroked" style="height: 80px "/></center>
                            <center><h3>Login Here</h3></center>
                        </div>
                        <div class="card-body">
                            <%@include file="components/message.jsp" %>
                            <form action="/ecommerce/LoginServlet" method="post">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input name="email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label>
                                    <input name="password" type="password" class="form-control" id="exampleInputPassword1">
                                </div>
                                <a href="register.jsp" class="text-center d-block mb-2">Click to Register</a>
                                <div class="container text-center">
                                    <button type="submit" class="btn btn-outline-success">Submit</button>
                                    <button type="reset" class="btn btn-outline-warning">Reset</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
