<%@page import="com.mycompany.ecommerce.dao.CategoryDao"%>
<%@page import="com.mycompany.ecommerce.dao.ProductDao"%>
<%@page import="com.mycompany.ecommerce.entities.Product"%>
<%@page import="com.mycompany.ecommerce.entities.Category"%>
<%@page import="com.mycompany.ecommerce.helper.FactoryProvider"%>
<%@page import="com.mycompany.ecommerce.helper.Helper"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ecommerce: Home</title>
        <%@include file="components/common_css_js.jsp"%>
        <style>
            .list-group-item.active{
                background: #41b3a3 !important;
                border-color: #41b3a3 !important;
            }
            .discount-label{
                font-size: 10px !important;
                font-style: italic !important;
                text-decoration: line-through;
            }
            .product-card:hover{
                background: #e2e2e2;
                cursor: pointer;
            }
        </style>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <div class="container-fluid">
            <div class="row mt-3 mx-2">
                <%                   
                    String cat = request.getParameter("category");
                    ProductDao pdao = new ProductDao(FactoryProvider.getFactory());
                    List<Product> plist = null;
                    if (cat == null || cat.trim().equals("all")) {
                        plist = pdao.getAllProducts();
                    } else {
                        int cid = Integer.parseInt(cat.trim());
                        plist = pdao.getAllProductsById(cid);
                    }
                    CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
                    List<Category> clist = cdao.getCategories();
                %>
                <!--shoe category-->
                <div class="col-md-2">        
                    <div class="list-group mt-4">
                        <a href="index.jsp?category=all" class="list-group-item list-group-item-action active">
                            All Products
                        </a>
                        <%
                            for (Category c : clist) {
                        %>
                        <a href="index.jsp?category=<%= c.getCategoryId()%>" class="list-group-item list-group-item-action"><%=c.getCategoryTitle()%></a>
                        <%
                            }
                        %>
                    </div>
                </div>
                <!--show product-->
                <div class="col-md-10">
                    <div class="row mt-4">
                        <div class="col-md-12">
                            <div class="card-columns">
                                <%
                                    for (Product p : plist) {
                                %>
                                <div class="card product-card">
                                    <div class="container text-center">
                                        <img src="img/products/<%= p.getpPhoto()%>" class="card-img-top m-2" 
                                             alt="product image" style="max-height: 200px;max-width:100%;width: auto;">
                                    </div>
                                    <div class="card-body">
                                        <h5 class="card-title"><%=p.getpName()%></h5>
                                        <p class="card-text"><%= Helper.get10Words(p.getpDesc())%></p>
                                    </div>
                                    <div class="card-footer text-center">
                                        <button class="btn custom-bg text-white" 
                                                onclick="add_to_cart(<%= p.getpID()%>, '<%= p.getpName()%>',<%= p.getPriceAfterDiscount()%>,'<%= p.getpPhoto()%>')">
                                            Add to cart</button>
                                        <button class="btn btn-outline-success"><%= "₹ " + p.getPriceAfterDiscount()%>/- 
                                            <span class="text-secondary discount-label">
                                                <%="₹ " + p.getpPrice() + " " + p.getpDiscount()%>% off
                                            </span></button>
                                    </div>
                                </div>
                                <%
                                    }
                                    if (plist.size() == 0) {
                                        out.println("Sorry, this category is empty.");
                                    }
                                %>
                            </div>
                        </div>                    
                    </div>
                </div>
            </div>
        </div>
        <%@include file="components/common_modal.jsp" %>                 
    </body>
</html>
