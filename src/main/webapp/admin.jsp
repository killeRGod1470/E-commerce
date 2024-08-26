<%@page import="com.mycompany.ecommerce.helper.FactoryProvider"%>
<%@page import="com.mycompany.ecommerce.helper.Helper "%>
<%@page import="com.mycompany.ecommerce.dao.CategoryDao"%>
<%@page import="com.mycompany.ecommerce.entities.User"%>
<%@page import="com.mycompany.ecommerce.entities.Category"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%
    User user = (User) session.getAttribute("current-user");
    if (user == null) {
        session.setAttribute("message", "You are not logged in !! ");
        response.sendRedirect("login.jsp");
        return;
    }
    if (user.getUserType().equals("normal")) {
        session.setAttribute("message", "You do not have permission to access this page");
        response.sendRedirect("login.jsp");
        return;
    }
%>
<%
    CategoryDao cd = new CategoryDao(FactoryProvider.getFactory());
    List<Category> list = cd.getCategories();
    Map<String,Long>m=Helper.getCounts(FactoryProvider.getFactory());
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
        <%@include file="components/common_css_js.jsp"%>
        <style>
            .admin .card{
                border: 1px solid #41b3a3;
            }
            .admin .card:hover{
                background: #e2e2e2;
                cursor: pointer;
            }

        </style>
    </head>
    <body class="new">
        <%@include file="components/navbar.jsp" %>
        <div class="container admin">
            <div class="row mt-3">
                <div class="container-fluid mt-3">
                    <%@include file="components/message.jsp"%>
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 125px" class="img-fluid rounded-circle" src="img/user.png" alt="user_icon">
                                <h1><%= m.get("userCount") %></h1>
                                <h1 class="text-uppercase text-muted">Users</h1>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 125px" class="img-fluid rounded-circle" src="img/categories.png" alt="categories_icon">   
                                <h1><%= list.size() %></h1>
                                <h1 class="text-uppercase text-muted">Categories</h1>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 125px" class="img-fluid rounded-circle" src="img/products.png" alt="product_icon">   
                                <h1><%= m.get("productCount") %></h1>
                                <h1 class="text-uppercase text-muted">Products</h1>
                            </div>
                        </div>
                    </div>
                </div>               
            </div>
            <div class="row mt-3">
                <div class="col-md-6">
                    <div class="card" data-toggle="modal" data-target="#add-category-modal">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 125px" class="img-fluid rounded-circle" src="img/addcategory.png" alt="add_category_icon">
                                <h1 class="text-uppercase text-muted">Add Category</h1>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card" data-toggle="modal" data-target="#add-product-modal">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 125px" class="img-fluid rounded-circle" src="img/add-product.png" alt="add_product_icon">
                                <h1 class="text-uppercase text-muted">add product</h1>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--add category model-->
    <!-- Modal -->
    <div class="modal fade" id="add-category-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header custom-bg text-white">
                    <h5 class="modal-title" id="exampleModalLabel">Fill category details</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form action="/ecommerce/ProductOperationServlet" method="post">
                        <input type="hidden" name="operation" value="addcategory">
                        <div class="form-group">
                            <input type="text" class="form-control" name="catTitle" placeholder="Enter category title" required/>
                        </div>
                        <div class="form-group">
                            <textarea style="height: 150px" class="form-control" placeholder="Enter category description" name="catDescription" required></textarea>
                        </div>
                        <div class="container text-center">
                            <button class="btn btn-outline-success">Add category</button>
                            <button type="button" class="btn btn-outline-danger" data-dismiss="modal">Close</button>
                        </div>
                    </form>
                </div>               
            </div>
        </div>
    </div>
    <!--end category model-->
    <!--product model: start-->
    <!-- Modal -->
    <div class="modal fade" id="add-product-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Product Details</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form action="/ecommerce/ProductOperationServlet" method="post" enctype="multipart/form-data">
                        <input type="hidden" name="operation" value="addproduct">
                        <div class="form-group">
                            <input type="text" class="form-control" name="pName" placeholder="Enter product title" required/>
                        </div>
                        <div class="form-group">
                            <textarea style="height: 150px" class="form-control" placeholder="Enter product description" name="pDescription" required></textarea>
                        </div>               
                        <div class="form-group">
                            <input type="number" class="form-control" name="pPrice" placeholder="Enter product price" required/>
                        </div>
                        <div class="form-group">
                            <input type="number" class="form-control" name="pDiscount" placeholder="Enter product discount" required/>
                        </div>
                        <div class="form-group">
                            <input type="number" class="form-control" name="pQuantity" placeholder="Enter product quantity" required/>
                        </div>
                        <!--product category-->

                        <div class="form-group">
                            <select name="cId" id="" class="form-control">
                                <%                                    for (Category c : list) {
                                %>
                                <option value="<%=c.getCategoryId()%>"><%= c.getCategoryTitle()%></option>
                                <% }%>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="pPic">Select picture of product</label>
                            <input type="file" class="form-control" id="pPic" name="pPic" required/>
                        </div>
                        <div class="container text-center">
                            <button class="btn btn-outline-success">Add product</button>
                            <button type="button" class="btn btn-outline-danger" data-dismiss="modal">Close</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!--end-->
</body>
</html>