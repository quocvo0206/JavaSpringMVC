<%@page import="com.itquocvv.util.SlugUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/taglib.jsp" %>        
<div class="col-sm-9 padding-right">
  <div class="features_items">
    <h2 class="title text-center">Search for: ${searchString}</h2>
    
    <c:choose>
      <c:when test="${not empty listProducts}">
        <c:forEach items="${listProducts}" var="itemProduct">
          <c:set var="urlDetail" value="${pageContext.request.contextPath}/${SlugUtil.makeSlug(itemProduct.name)}-${itemProduct.id}.html" />
          <div class="col-sm-4 col-xs-6">
            <div class="product-image-wrapper">
              <div class="single-products">
                <div class="productinfo text-center product-box-${itemProduct.id}">
                  <a href="${urlDetail}">
                    <img style="height: 180px" src="${pageContext.request.contextPath}/files/${itemProduct.image}" alt=""></a>
                  <div class="price-row">
                    <span class="price"><fmt:formatNumber type="number" groupingUsed = "true" maxFractionDigits="3" value="${objProduct.price}" /></span>
                  </div>
                  <a href="${urlDetail}">
                    <p style="height: 80px">${itemProduct.name}</p>
                  </a>
                  <a href="#" class="btn btn-default add-to-cart" onclick="addToCart(${itemProduct.id})">
                    <i class="fa fa-shopping-cart"></i>Add to cart
                  </a>
                </div>
                <img src="${pageContext.request.contextPath}/publicUrl/assets/s-cart/images/home/new.png" class="new" alt="">
              </div>
            </div>
          </div>
        </c:forEach>
      </c:when>
      <c:otherwise>Không có kết quả phù hợp với ${searchString}</c:otherwise>
    </c:choose>
    
    <div style="clear: both; ">
      <ul class="pagination" role="navigation">
      <c:if test="${not empty paginations}">
      
        <c:choose>
          <c:when test="${page == 1}">
            <li class="page-item disabled" aria-disabled="true" aria-label="&amp;laquo; Previous"><span class="page-link" aria-hidden="true">‹</span></li>
          </c:when>
          <c:otherwise>
            <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/category/${categoryId}/${searchString}-${page - 1}" rel="next" aria-label="Next &amp;raquo;">‹</a></li>
          </c:otherwise>
        </c:choose>
      
        <c:forEach items="${paginations }" var="itemPagination">
          <c:choose>
            <c:when test="${itemPagination == page }">
              <li class="page-item active" aria-current="page"><span class="page-link">${itemPagination}</span></li>
            </c:when>
            <c:when test="${itemPagination == -1 }">
              <li class="page-item disabled"><a class="page-link " href="">...</a></li>
            </c:when>
            <c:when test="${itemPagination == -2 }">
              <li class="page-item disabled"><a class="page-link " href="">...</a></li>
            </c:when>
            <c:otherwise>
              <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/category/${categoryId}/${searchString}-${itemPagination}">${itemPagination}</a></li>
            </c:otherwise>
          </c:choose>
        </c:forEach>
        
        <c:choose>
          <c:when test="${page == numberOfPages}">
            <li class="page-item disabled" aria-disabled="true" aria-label="&amp;laquo; Previous"><span class="page-link" aria-hidden="true">›</span></li>
          </c:when>
          <c:otherwise>
            <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/category/${categoryId}/${searchString}-${page + 1}" rel="next" aria-label="Next &amp;raquo;">›</a></li>
          </c:otherwise>
        </c:choose>
        
      </c:if>  
      </ul>
    </div>
  </div>
</div>