<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/taglib.jsp" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
    
      <div class="be-left-sidebar">
        <div class="left-sidebar-wrapper"><a class="left-sidebar-toggle" href="#">General Tables</a>
          <div class="left-sidebar-spacer">
            <div class="left-sidebar-scroll">
              <div class="left-sidebar-content">
                <security:authorize access="isAuthenticated()">
                <ul class="sidebar-elements">
                  <li class="divider">Quản lí</li>
                  <li id="dashboard"><a href="${pageContext.request.contextPath}/admin"><i class="icon mdi mdi-home"></i><span>Dashboard</span></a></li>
                  <li id="category" class=""><a href="${pageContext.request.contextPath}/admin/category"><i class="icon mdi mdi-storage"></i><span>Category</span></a></li>
                  <li id="product" class=""><a href="${pageContext.request.contextPath}/admin/product"><i class="icon mdi mdi-shopping-basket"></i><span>Product</span></a></li>
                 
                  <security:authorize access="hasRole('ROLE_ADMIN')">
                  <li id="order" class=""><a href="${pageContext.request.contextPath}/admin/order"><i class="icon mdi mdi-shopping-cart"></i><span>Order</span></a></li>
                  </security:authorize>
                  
                  
                  <security:authorize access="hasRole('ROLE_ADMIN')">
                  <li id="user" class=""><a href="${pageContext.request.contextPath}/admin/user"><i class="icon mdi mdi-accounts"></i><span>User</span></a> </li>
                  </security:authorize>
                  
                  <li id="contact" class=""><a href="${pageContext.request.contextPath}/admin/contact"><i class="icon mdi mdi-phone-in-talk"></i><span>Contact</span></a></li>
                </ul>
                </security:authorize>
              </div>
            </div>
          </div>
        </div>
      </div>