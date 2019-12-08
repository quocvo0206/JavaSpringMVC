<%@page import="com.itquocvv.util.SlugUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/taglib.jsp" %>        
<div class="col-sm-9 padding-right">
  <div class="features_items">
  
    <!--features_items-->
    <h2 class="title text-center">Features Items</h2>
    <c:forEach items="${listTopProducts}" var="itemProduct">
    <c:set var="urlDetail" value="${pageContext.request.contextPath}/${SlugUtil.makeSlug(itemProduct.name)}-${itemProduct.id}.html" />
    <div class="col-sm-3">
      <div class="product-image-wrapper">
        <div class="single-products product-box-${itemProduct.id}">
          <div class="productinfo text-center">
            <a href="${urlDetail}">
              <img src="${pageContext.request.contextPath}/files/${itemProduct.image}" alt="" style="height: 180px" />
            </a>
            <div class="price-row">
              <span class="price"><fmt:formatNumber type="number" groupingUsed = "true" maxFractionDigits="3" value="${itemProduct.price}" /></span>
            </div>
            <a href="${urlDetail}">
              <p style="height: 70px">${itemProduct.name}</p>
            </a>
            <a href="javascript:void(0)" class="btn btn-default add-to-cart" onClick="addToCart(${itemProduct.id})"><i class="fa fa-shopping-cart"></i>Add to cart</a>
          </div>
          <img src="${pageContext.request.contextPath}/publicUrl/assets/s-cart/images/home/new.png" class="new" alt="" />
        </div>
      </div>
    </div>
    </c:forEach>
    
  </div>
  <!--features_items-->
  
  <div class="category-tab">
    <!--category-tab-->
    <div class="col-sm-12">
      <ul class="nav nav-tabs">
        <c:forEach items="${mapProductByParentCateogy}" var="item" varStatus="count">
          <c:choose>
            <c:when test="${count.index == 0}">
              <c:set var="cssclass" value="active" />
            </c:when>
            <c:otherwise>
              <c:set var="cssclass" value="" />
            </c:otherwise>
          </c:choose>
          <li class="${cssclass}"><a href="#cate${count.index}" data-toggle="tab">${item.key.name}</a></li>
        </c:forEach>
      </ul>
    </div>
    <div class="tab-content">
    
      <c:forEach items="${mapProductByParentCateogy}" var="itemCategory" varStatus="count">
      
        <c:choose>
          <c:when test="${count.index == 0}">
            <c:set var="cssclass" value="active" />
          </c:when>
          <c:otherwise>
            <c:set var="cssclass" value="" />
          </c:otherwise>
        </c:choose>
      
      <div class="tab-pane fade ${cssclass} in" id="cate${count.index}">
        <c:forEach items="${itemCategory.value}" var="itemProduct">
        <c:set var="urlDetail" value="${pageContext.request.contextPath}/${SlugUtil.makeSlug(itemProduct.name)}-${itemProduct.id}.html" />
        <div class="col-sm-3">
          <div class="product-image-wrapper">
            <div class="single-products  product-box-${itemProduct.id}">
              <div class="productinfo text-center">
                <a href="${urlDetail}">
                  <img height="180px" src="${pageContext.request.contextPath}/files/${itemProduct.image}" alt="" />
                 </a>
                <div class="price-row">
                  <span class="price"><fmt:formatNumber type="number" groupingUsed = "true" maxFractionDigits="3" value="${itemProduct.price}" /></span>
                </div>
                <a href="${urlDetail}"><p style="height: 80px" >${itemProduct.name}</p></a>
                <a href="javascript:void(0)" class="btn btn-default add-to-cart" onClick="addToCart(${itemProduct.id})"><i class="fa fa-shopping-cart"></i>Add to
                  cart</a>
              </div>
              <img src="${pageContext.request.contextPath}/publicUrl/assets/s-cart/images/home/new.png" class="new" alt="" />
            </div>
          </div>
        </div>
        </c:forEach>
        
      </div>
      </c:forEach>
      
    </div>
  </div>
  <!--/category-tab-->
  <div class="recommended_items">
    <!--recommended_items-->
    <h2 class="title text-center">recommended items</h2>
    <div id="recommended-item-carousel" class="carousel slide" data-ride="carousel">
      <div class="carousel-inner">
        
        <div class="item active">
          <c:forEach begin="0" end="2" step="1" var="i">
          <c:set var="urlDetail" value="${pageContext.request.contextPath}/${SlugUtil.makeSlug(listRandProducts[i].name)}-${listRandProducts[i].id}.html" />
          <div class="col-sm-4">
            <div class="product-image-wrapper">
              <div class="single-products product-box-${listRandProducts[i].id}">
                <div class="productinfo text-center">
                  <a href="${urlDetail}">
                    <img style="height: 180px" src="${pageContext.request.contextPath}/files/${listRandProducts[i].image}" alt="" />
                  </a>
                  <div class="price-row">
                    <span class="price"><fmt:formatNumber type="number" groupingUsed = "true" maxFractionDigits="3" value="${listRandProducts[i].price}" /></span>
                  </div>
                  <a href="${urlDetail}">
                    <p style="height: 80px">${listRandProducts[i].name}</p>
                   </a>
                  <a href="javascript:void(0)" class="btn btn-default add-to-cart" onClick="addToCart(${listRandProducts[i].id})">
                    <i class="fa fa-shopping-cart"></i>Add to cart
                  </a>
                </div>
                <img src="${pageContext.request.contextPath}/publicUrl/assets/s-cart/images/home/new.png" class="new" alt="" />
              </div>
            </div>
          </div>
          </c:forEach>
        </div>
        
        <div class="item">
          <c:forEach begin="3" end="5" step="1" var="i">
          <c:set var="urlDetail" value="${pageContext.request.contextPath}/${SlugUtil.makeSlug(listRandProducts[i].name)}-${listRandProducts[i].id}.html" />
          <div class="col-sm-4">
            <div class="product-image-wrapper">
              <div class="single-products product-box-${listRandProducts[i].id}">
                <div class="productinfo text-center">
                  <a href="${urlDetail}">
                    <img style="height: 180px" src="${pageContext.request.contextPath}/files/${listRandProducts[i].image}" alt="" />
                  </a>
                  <div class="price-row">
                    <span class="price"><fmt:formatNumber type="number" groupingUsed = "true" maxFractionDigits="3" value="${listRandProducts[i].price}" /></span>
                  </div>
                  <a href="${urlDetail}">
                    <p style="height: 80px" >${listRandProducts[i].name}</p>
                   </a>
                  <a href="javascript:void(0)" class="btn btn-default add-to-cart" onClick="addToCart(${listRandProducts[i].id})">
                    <i class="fa fa-shopping-cart"></i>Add to cart
                  </a>
                </div>
                <img src="${pageContext.request.contextPath}/publicUrl/assets/s-cart/images/home/new.png" class="new" alt="" />
              </div>
            </div>
          </div>
          </c:forEach>
        </div>
        
      </div>
      <a class="left recommended-item-control" href="#recommended-item-carousel" data-slide="prev">
        <i class="fa fa-angle-left"></i>
      </a>
      <a class="right recommended-item-control" href="#recommended-item-carousel" data-slide="next">
        <i class="fa fa-angle-right"></i>
      </a>
    </div>
  </div>
  <!--/recommended_items-->
</div>