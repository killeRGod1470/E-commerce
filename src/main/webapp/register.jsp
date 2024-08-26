
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration</title>
        <%@include file="components/common_css_js.jsp"%>
        <style>
            body{
                background: #037971;
            }
        </style>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>        
        <div class="container-fluid">
            <div class="row mt-5">
                <div class="col-md-4 offset-md-4">
                    <div class="card">
                        <%@include file="components/message.jsp" %>
                        <div class="card-body">
                            <h3 class="text-center my-3">Sign up here</h3>
                            <form action="/ecommerce/RegisterServlet" method="post">
                                <div class="form-group">
                                    <label for="name">Name</label>
                                    <input name="user_name" type="text" class="form-control" id="name" placeholder="Enter here..." aria-describedby="emailHelp">
                                </div>
                                <div class="form-group">
                                    <label for="email">Email</label>
                                    <input name="user_email" type="email" class="form-control" id="email" placeholder="123@abc.com" aria-describedby="emailHelp">
                                </div>
                                <div class="form-group">
                                    <label for="password">Password</label>
                                    <input name="user_password" type="password" class="form-control" id="password" placeholder="Enter here..." aria-describedby="emailHelp">
                                </div>
                                <div class="form-group">
                                    <label for="phone">Mobile Number</label>
                                    <input name="user_mobile" type="number" class="form-control" id="phone" placeholder="Enter here..." aria-describedby="emailHelp">
                                </div>
                                <div class="form-group">
                                    <label for="phone">Address</label>
                                    <textarea name="user_address" style="height:90px " class="form-control" placeholder="Enter your address"></textarea>
                                </div>
                                <div class="container text-center">
                                    <button class="btn btn-outline-success">Register Here</button>
                                    <button class="btn btn-outline-warning">Reset</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>      
            </div>
        </div>
    </body>
</html>
