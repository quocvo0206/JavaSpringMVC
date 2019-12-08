<%@page import="com.itquocvv.util.SlugUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/taglib.jsp" %>    
        <div class="col-sm-3">
          <div class="left-sidebar">
            <h2>Category</h2>
            <div class="panel-group category-products" id="accordian">
              <!--category-productsr-->
              <c:forEach items="${mapCategories}" var="item" varStatus="count">
              <div class="panel panel-default">
                <div class="panel-heading">
                  <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordian" href="#${count.index}">
                      <span class="badge pull-right"><i class="fa fa-plus"></i></span>
                      ${item.key.name }
                    </a>
                  </h4>
                </div>
                <div id="${count.index}" class="panel-collapse collapse">
                  <div class="panel-body">
                    <ul>
                      <c:forEach items="${item.value}" var="itemOfItem">
                      <li>
                        <a href="${pageContext.request.contextPath}/category/${SlugUtil.makeSlug(itemOfItem.name)}-${itemOfItem.id}.html">${itemOfItem.name}</a>
                      </li>
                      </c:forEach>
                    </ul>
                  </div>
                </div>
              </div>
              </c:forEach>
            </div>
            <!--/category-products-->

            <div class="shipping text-center">
              <!--shipping-->
              <img src="${pageContext.request.contextPath}/publicUrl/assets/s-cart/images/home/shipping.jpg" alt="" />
            </div>
            <!--/shipping-->

          </div>
        </div>