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
      
      <%-- <div id="similar-product" class="carousel slide" data-ride="carousel">
        <!-- Wrapper for slides -->
        <div class="carousel-inner">
          <div class="item active">
          <%
             Product objProduct = (Product) request.getAttribute("objProduct");
             List<String> images = objProduct.getImageListFromJson();
             for (String item : images) {
          %>
            <a href="#" class="col-sm-4">
              <img src="${pageContext.request.contextPath}/files/<%=item%>" alt="">
            </a>
          <%}%>
          </div>
        </div>
        <!-- Controls -->
        <a class="left item-control" href="#similar-product" data-slide="prev">
          <i class="fa fa-angle-left"></i>
        </a>
        <a class="right item-control" href="#similar-product" data-slide="next">
          <i class="fa fa-angle-right"></i>
        </a>
      </div> --%>
    </div>
    <form id="buy_block" action="http://demo.s-cart.org/cart.html" method="post">
      <input type="hidden" name="_token" value="K51aYltmBpBRxSLPRtjETuvaKq29877yHK5AYBvZ">
      <input type="hidden" name="product_id" value="49">
      <div class="col-sm-7">
        <div class="product-information">
          <!--/product-information-->
          <img src="${pageContext.request.contextPath}/publicUrl/assets/s-cart/images/home/sale.png" class="newarrival" alt="">
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
        <!-- <div class="col-sm-12">
          <p><b>Write Your Review</b></p>

          <form action="#">
            <span>
              <input type="text" placeholder="Your Name">
              <input type="email" placeholder="Email Address">
            </span>
            <textarea name=""></textarea>
            <b>Rating: </b> <img src="${pageContext.request.contextPath}/publicUrl/assets/s-cart/images/home/rating.png" alt="">
            <button type="button" class="btn btn-default pull-right">
              Submit
            </button>
          </form>
        </div> -->
        
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

    <div id="recommended-item-carousel" class="carousel slide">
      <div class="carousel-inner">
        <div class="item active">
          <div class="col-sm-3">
            <div class="product-image-wrapper">
              <div class="single-products   product-box-49">
                <div class="productinfo text-center">
                  <a href="easy-polo-black-edition_49.html"><img src="${pageContext.request.contextPath}/publicUrl/assets/documents/website/thumb/product/0950df6d59696ad39a8e5505735f578c.jpeg"
                      alt="Easy Polo Black Edition"></a>
                  <div class="price-row">
                    <span class="price"> 10,000 </span>
                    <span class="price-old"> 15,000 </span>
                  </div>
                  <a href="easy-polo-black-edition_49.html"><p>Easy Polo Black Edition</p></a>
                </div>
                <img src="${pageContext.request.contextPath}/publicUrl/assets/s-cart/images/home/sale.png" class="new" alt="">
              </div>
            </div>
          </div>
          <div class="col-sm-3">
            <div class="product-image-wrapper">
              <div class="single-products   product-box-35">
                <div class="productinfo text-center">
                  <a href="easy-polo-black-edition_35.html"><img src="${pageContext.request.contextPath}/publicUrl/assets/documents/website/thumb/product/41c8f0d0111cd5a3f0538604233cbed8.jpeg"
                      alt="Easy Polo Black Edition"></a>
                  <div class="price-row">
                    <span class="price">15,000</span>
                  </div>
                  <a href="easy-polo-black-edition_35.html"><p>Easy Polo Black Edition</p></a>
                </div>
                <img src="${pageContext.request.contextPath}/publicUrl/assets/s-cart/images/home/new.png" class="new" alt="">
              </div>
            </div>
          </div>
          <div class="col-sm-3">
            <div class="product-image-wrapper">
              <div class="single-products   product-box-33">
                <div class="productinfo text-center">
                  <a href="easy-polo-black-edition_33.html"><img src="${pageContext.request.contextPath}/publicUrl/assets/documents/website/thumb/product/a635cc2bdf5485ccb2c0cc9d186968b2.jpeg"
                      alt="Easy Polo Black Edition"></a>
                  <div class="price-row">
                    <span class="price">15,000</span>
                  </div>
                  <a href="easy-polo-black-edition_33.html"><p>Easy Polo Black Edition</p></a>
                </div>
              </div>
            </div>
          </div>
          <div class="col-sm-3">
            <div class="product-image-wrapper">
              <div class="single-products   product-box-27">
                <div class="productinfo text-center">
                  <a href="easy-polo-black-edition_27.html"><img src="${pageContext.request.contextPath}/publicUrl/assets/documents/website/thumb/product/ea88b7078652909f3d6c5d445aa05f59.jpeg"
                      alt="Easy Polo Black Edition"></a>
                  <div class="price-row">
                    <span class="price">7,990,000</span>
                  </div>
                  <a href="easy-polo-black-edition_27.html"><p>Easy Polo Black Edition</p></a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!--/recommended_items-->
</div>