<%@page import="com.itquocvv.model.bean.Cart"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/taglib.jsp" %>  
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
  <header id="header">
    <!--header-->
    <div class="header_top">
      <!--header_top-->
      <div class="container">
        <div class="row">
          <div class="col-sm-6">
            <div class="contactinfo">
              <ul class="nav nav-pills">
              <li><a href="#"><i class="fa fa-phone"></i> 01627053245</a></li>
                <li><a href="#"><i class="fa fa-envelope"></i> <span class="" data-cfemail="">tranhuuhongson@gmail.com</span></a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!--/header_top-->
    
    <div class="header-middle">
      <!--header-middle-->
      <div class="container">
        <div class="row">
          <div class="col-sm-4">
            <div class="logo pull-left">
              <a href="${pageContext.request.contextPath}/">
                <img style="width: 150px;" src="${pageContext.request.contextPath}/publicUrl/assets/documents/website/images/scart-mid.png" alt="" />
              </a>
            </div>
          </div>
          <div class="col-sm-8">
            <div class="shop-menu pull-right">
              <ul class="nav navbar-nav">
               <li>
                  <%
                    Cart cart = (Cart) session.getAttribute("cart");
                    if (cart == null) {
                        cart = new Cart();
                        session.setAttribute("cart", cart);
                    }
                  %>
                  <a href="${pageContext.request.contextPath}/cart">
                    <span style="border-radius: 3px;padding: 5px;" class="label_top label-warning shopping-cart" id="count_cart"><%=cart.countItems()%></span>
                    <i class="fa fa-shopping-cart"></i> Cart
                   </a>
                </li>
                
                <security:authorize access="isAuthenticated()">
                  <li><a href="${pageContext.request.contextPath}/auth/logout"><i class="fa fa-sign-out"></i> Logout</a></li>
                </security:authorize>
                <security:authorize access="isAnonymous()">
                  <li><a href="${pageContext.request.contextPath}/auth/login"><i class="fa fa-lock"></i> Login</a></li>
                </security:authorize>
                
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!--/header-middle-->
    
    <div class="header-bottom">
      <!--header-bottom-->
      <div class="container">
        <div class="row">
          <div class="col-sm-6">
            <div class="navbar-header">
              <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </button>
            </div>
            <div class="mainmenu pull-left">
              <ul class="nav navbar-nav collapse navbar-collapse">
                <li><a href="${pageContext.request.contextPath}/" class="active">Home</a></li>
                <li><a href="${pageContext.request.contextPath}/about">About</a></li>
                <li><a href="${pageContext.request.contextPath}/contact">Contact</a></li>
              </ul>
            </div>
          </div>

          <div class="col-sm-6">
            <div class="search_box pull-right">
              <form id="searchbox" method="get" action="${pageContext.request.contextPath}/search">
                <div class="col-sm-8">
                    <select name="categoryId" class="form-control">
                      <c:forEach items="${mapCategories}" var="item">
                      <optgroup label="${item.key.name}">
                        <c:forEach items="${item.value}" var="itemOfItem">
                          <c:choose>
                            <c:when test="${categoryId == itemOfItem.id}">
                              <option selected="selected" value="${itemOfItem.id}">${item.key.name} - ${itemOfItem.name}</option>
                            </c:when>
                            <c:otherwise>
                              <option value="${itemOfItem.id}">${item.key.name} - ${itemOfItem.name}</option>
                            </c:otherwise>
                          </c:choose>
                        </c:forEach>
                      </optgroup>
                      </c:forEach>
                    </select>
                </div>
                
                <div class="input-group">
                  <input type="text" class="form-control" placeholder="Search..." name="name">
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!--/header-bottom-->
  </header>
  <!--/header-->