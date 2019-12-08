<%@page import="java.util.List"%>
<%@page import="com.itquocvv.model.bean.Product"%>
<%@include file="/WEB-INF/templates/taglib.jsp" %>

<div class="col-sm-9 padding-right">
  <div class="product-details">
    <!--product-details-->
    <div class="col-sm-5">
      <div class=" view-product product-box-${objProduct.id}">
        <img class="xzoom" src="${pageContext.request.contextPath}/files/${objProduct.image}" xoriginal="${pageContext.request.contextPath}/files/${objProduct.image}" alt="">
      </div>
      <div class="xzoom-thumbs" style="padding-top: 10px">
        <%
           Product objProduct = (Product) request.getAttribute("objProduct");
           List<String> images = objProduct.getImageListFromJson();
           for (int i = 0; i < 3 && i < images.size(); i++) {
        %>
        <a href="${pageContext.request.contextPath}/files/<%=images.get(i)%>">
          <img class="xzoom-gallery" width="80" height="90" src="${pageContext.request.contextPath}/files/<%=images.get(i)%>"
            <%if(i == 0) out.print(" xpreview=" + request.getContextPath() + "/files/" + images.get(i) ); %>
           >
        </a>
        <%}%>
      </div>
   </div>
    <form id="buy_block" action="http://demo.s-cart.org/cart.html" method="post">
      <input type="hidden" name="_token" value="K51aYltmBpBRxSLPRtjETuvaKq29877yHK5AYBvZ">
      <input type="hidden" name="product_id" value="49">
      <div class="col-sm-7">
        <div class="product-information">
          <!--/product-information-->
          <h2>${objProduct.name}</h2>
          <!-- <p>SKU: BX-5UTbnv</p> -->
          <div class="price-row">
            <span class="price"><fmt:formatNumber type="number" groupingUsed = "true" maxFractionDigits="3" value="${objProduct.price}" /></span>
            <span class="price-old"> 15,000 </span>
          </div>
          <span>
            <label>Quantity:</label>
            <input id="qty_in_detail_page" type="number" name="qty" value="1">
            <button onclick="return addToCartInDetailPage(${objProduct.id})" type="button" class="btn btn-fefault cart">
              <i class="fa fa-shopping-cart"></i>
              Add to cart
            </button>
          </span>
          <!-- <p><b>Availability:</b>
            In Stock
          </p>
          <p><b>Condition:</b> New</p>
          <p><b>Brand:</b> Ideal</p> -->
          <div class="short-description">
            <b>Quick Overview:</b>
            <p>${objProduct.description}</p>
          </div>
        </div>
        <!--/product-information-->
      </div>
    </form>
  </div>
  <!--/product-details-->


  <div class="category-tab shop-details-tab">
    <!--category-tab-->
    <div class="col-sm-12">
      <ul class="nav nav-tabs">
        <li class="active"><a href="#details" data-toggle="tab">Details</a></li>
        <li class=""><a href="#reviews" data-toggle="tab">Comment</a></li>
      </ul>
    </div>
    <div class="tab-content">
    
      <div class="tab-pane fade active in" id="details">
        <p>${objProduct.content}</p>
      </div>

      <div class="tab-pane fade" id="reviews">
        
      <div id="fb-root"></div>
      <script>(function(d, s, id) {
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id)) return;
        js = d.createElement(s); js.id = id;
        js.src = 'https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v3.2&appId=273756119885473&autoLogAppEvents=1';
        fjs.parentNode.insertBefore(js, fjs);
      }(document, 'script', 'facebook-jssdk'));</script>
              
      <div class="fb-comments" data-width="100%" data-href="https://developers.facebook.com/docs/plugins/comments#configurator-${objProduct.id}" data-numposts="5"></div>
        
      </div>

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