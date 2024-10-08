<%--<%@page import="com.mycompany.ecommerce.entities.User"%>--%>
<%

    User user = (User) session.getAttribute("current-user");
    if (user == null) {

        session.setAttribute("message", "You are not logged in !! Login first to access checkout page");
        response.sendRedirect("login.jsp");
        return;

    }

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Checkout</title>
        <%@include file="components/common_css_js.jsp" %>
<!--        <link rel="stylesheet" href="css/checkout.css"> -->
        <script src="https://code.jquery.com/jquery-2.2.4.min.js" integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44=" crossorigin="anonymous"></script>
        <script src="https://checkout.razorpay.com/v1/checkout.js"></script>

    </head>
    <body style=" background-image: url('images/bg-light.png');

          background-repeat: repeat;
          background-attachment: fixed;
          background-position: center;
          ">
        <%@include  file="components/navbar.jsp" %>

        <div class="container">

            <div class="row mt-5">                

                <div class="col-md-6">
                    <!--card-->
                    <div class="card">
                        <div class="card-body">

                            <h3 class="text-center mb-5">Your selected items</h3>

                            <div class="cart-body">

                            </div>
                        </div>
                    </div>

                </div>
                <div class="col-md-6">
                    <!--form details-->
                    <!--card-->
                    <div class="card">
                        <div class="card-body">

                            <h3 class="text-center mb-5">Your details for order</h3>
                            <form action="#!">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input value="<%= user.getUserEmail()%>" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                </div>
                                <div class="form-group">
                                    <label for="name">Your name</label>
                                    <input value="<%= user.getUserName()%>" type="text" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter name">
                                </div>


                                <div class="form-group">
                                    <label for="name">Your contact</label>
                                    <input value="<%= user.getUserPhone()%>" type="text" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter contact number">
                                </div>



                                <label for="exampleFormControlTextarea1" >Your shipping address</label>
                                <textarea value="" class="form-control" id="exampleFormControlTextarea1" rows="3"><%=user.getUserAddress()%></textarea>


                                <div class="container text-center">
                                    <button class="btn btn-success" onclick="handlePayment()"> <i class="fas fa-clipboard-check"></i>&nbsp;Order Now</button>
                                    <a class="btn btn-outline-primary" href="index.jsp">
                                        <i class="fas fa-shopping-cart"></i> &nbsp;Continue Shopping
                                    </a>
                                </div>

                            </form>    

                        </div>
                    </div>
                </div>
            </div>

        </div>
        <!-- Modal -->
        <div id="paymentSuccessModal" class="modal" style="display: none; position: fixed; z-index: 1000; top: 50%; left: 50%; transform: translate(-50%, -50%); background-color: rgba(0, 0, 0, 0.5); width: 300px; padding: 20px; text-align: center;">
            <img src="images/logo/preview.gif" alt="Payment Success" style="width: 100%; max-width: 200px;">
            <p style="color: white; font-size: 24px; margin-top: 20px;">Payment Successful! Wait Redirecting to Home page</p>
        </div>



        <%@include  file="components/common_modal.jsp" %>
        
    </body>
</html>
