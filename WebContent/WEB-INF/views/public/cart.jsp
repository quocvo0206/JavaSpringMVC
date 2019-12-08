<%@page import="com.itquocvv.security.UserDetailsSecurityUtils"%>
<%@page import="com.itquocvv.util.SlugUtil"%>
<%@page import="com.itquocvv.model.bean.Cart"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/taglib.jsp" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>        
<h2 class="title text-center">
  Shopping cart</h2>
<style>
  .shipping_address td {
    padding: 3px !important;
  }

  .shipping_address textarea,
  .shipping_address input[type="text"] {
    width: 100%;
    padding: 7px !important;
  }

  .row_cart>td {
    vertical-align: middle !important;
  }

  input[type="number"] {
    text-align: center;
    padding: 2px;
  }
</style>
<div class="table-responsive">
  <table class="table box table-bordered">
    <thead>
      <tr style="background: #eaebec">
        <th style="width: 50px;">No.</th>
        <th>Name</th>
        <th>Price</th>
        <th>Qty</th>
        <th>Total price</th>
        <th>Remove</th>
      </tr>
    </thead>
    
    <tbody id="tbody_cart">
      <c:choose>
         <c:when test="${not empty sessionScope.cart.listCartItems}">
            <c:forEach items="${sessionScope.cart.listCartItems}" var="cartItem" varStatus="index" >
            <tr class="row_cart" id="row_cart_${cartItem.key}">
              <td>${index.count}</td>
              <td>
                ${cartItem.value.product.name}<br>
                <a href="${pageContext.request.contextPath}/${SlugUtil.makeSlug(cartItem.value.product.name)}-${cartItem.value.product.id}.html"><img width="100" src="${pageContext.request.contextPath}/files/${cartItem.value.product.image}" alt=""></a>
              </td>
              <td>
                <span class="new-price">${cartItem.value.product.price}</span>
                <!-- <span class="old-price">15,000</span> -->
              </td>
              <td>
                <input style="width: 70px;" type="number"  class="item-qty" id="item-49" min="1"
                name="qty-49" onchange="return updateCartItem(${cartItem.key}, this)" value="${cartItem.value.quantity}">
                
                 <span class="text-danger item-qty-49" style="display: none;"></span>
              </td>
              <td class="totalPriceItem" align="right">
                <fmt:formatNumber type="number" groupingUsed = "true" maxFractionDigits="3" value="${cartItem.value.quantity * cartItem.value.product.price}" /> VNĐ
               </td>
              <td>
                <a href="javascript:void(0)" onclick="return removeToCart(${cartItem.key})" title="Remove Item" alt="Remove Item" class="cart_quantity_delete" >
                  <i class="fa fa-times"></i>
                </a>
              </td>
            </tr>
            </c:forEach>
            <tr>
              <td colspan="6" class="text-center" id="total_pay">Tổng tiền:
                <fmt:formatNumber type="number" groupingUsed = "true" maxFractionDigits="3" value="${sessionScope.cart.totalCart}" /> VNĐ
               </td>
            </tr>
         </c:when>
         <c:otherwise><td colspan="6" class="text-center">Giỏ hàng trống, mời bạn <a href="${pageContext.request.contextPath}/" >quay lại</a> mua hàng.</td></c:otherwise>
      </c:choose>
    </tbody>
    
    <tfoot>
      <tr style="background: #eaebec">
        <td colspan="7">
          <div class="pull-left">
            <button class="btn btn-default" type="button" style="cursor: pointer;padding:10px 30px" onclick="window.history.back();">
              <i class="fa fa-arrow-left"></i> Back
            </button>
          </div>
          <div class="pull-right">
            <a onclick="removeAllCart()" href="javascript:void(0)">
              <button class="btn" type="button" style="cursor: pointer;padding:10px 30px">Remove all </button>
            </a>
          </div>
        </td>
      </tr>
    </tfoot>
    
  </table>
</div>
<c:if test="${not empty sessionScope.cart.listCartItems}">
  <form class="shipping_address" id="frmOrder" role="form" method="POST" action="javascript:void(0)">
    <div class="row">
      
      <!-- nếu đã đăng nhập rồi thì lấy lại thông tin -->
      <security:authorize access="isAuthenticated()">
        <c:set var="fullname" value="${UserDetailsSecurityUtils.getMyUserDetails().getFullname()}" />
        <c:set var="phone" value="${UserDetailsSecurityUtils.getMyUserDetails().getPhone()}" />
        <c:set var="email" value="${UserDetailsSecurityUtils.getMyUserDetails().getEmail()}" />
        <c:set var="address" value="${UserDetailsSecurityUtils.getMyUserDetails().getAddress()}" />
      </security:authorize>
      
      <div class="col-md-6">
        <table class="table  table-bordered table-responsive">
          <tbody>
          
            <tr>
              <td class="form-group">
                <label for="fullname" class="control-label"><i class="fa fa-user"></i> Fullname:</label> 
                <input id="fullname" name="fullname" type="text" placeholder="Fullname" value="${fullname}">
              </td>
              <td class="form-group">
                <label for="phone" class="control-label"><i class="fa fa-phone"></i> Phone:</label>
                <input id="phone" name="phone" type="text" placeholder="Phone" value="${phone}">
              </td>
            </tr>
            
            <tr>
              <td class="form-group">
                <label for="email" class="control-label"><i class="fa fa-user"></i> Email:</label> 
                <input id="email" name="email" type="text" placeholder="Email" value="${email}">
              </td>
              <td class="form-group">
                <label for="address" class="control-label"><i class="fa fa-home"></i> Address:</label> 
                <input name="address" id="address" type="text" placeholder="Address" value="${address}">
              </td>
            </tr>
            
            <tr>
              <td colspan="2">
                <label for="message" class="control-label"><i class="fa fa-file-image-o"></i> Your message:</label>
                <textarea rows="5" name="message" id="message" placeholder="Your message...."></textarea>
              </td>
            </tr>
            
          </tbody>
        </table>
      </div>
      
      <div class="col-md-6">
        <div class="row">
          <div class="col-md-12">
            <table class="table box table-bordered" id="showTotal">
              <tbody>
                <tr class="showTotal">
                  <th>Total Price</th>
                  <td style="text-align: right" id="totalPrice">
                    ${sessionScope.cart.totalCart}
                  </td>
                </tr>
                <tr class="showTotal">
                  <th>Shipping</th>
                  <td style="text-align: right" id="shipping">
                    <fmt:formatNumber type="number" groupingUsed = "true" maxFractionDigits="3" value="40000" />
                  </td>
                </tr>
                <tr class="showTotal" style="background:#f5f3f3;font-weight: bold;">
                  <th>Total</th>
                  <td style="text-align: right" id="total">
                      <fmt:formatNumber type="number" groupingUsed = "true" maxFractionDigits="3" value="${sessionScope.cart.totalCart + 40000}" />
                  </td>
                </tr>
                <tr>
                  <td colspan="2">
                    <label><i class="fa fa-credit-card"></i> Payment method<br></label>
                    <div class="form-group">
                      <input type="radio" name="payment" value="1">
                      <img src="https://demo.s-cart.org/images/cash.png">
                    </div>
                    <div class="form-group">
                      <input type="radio" name="payment" value="2" checked="checked">
                      <label>Thanh toán khi nhận hàng</label>
                    </div>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
          <div class="col-md-12 text-center">
            <div class="pull-right paypal-checkout-div">
              <button class="btn btn-success" id="submit-order" type="submit" style="cursor: pointer;padding:15px 30px">
                <i class="fa fa-check"></i>
                Checkout
              </button>
            </div>
            <div class="pull-right paypal-button-div" style="display: none">
              <button type="submit"><div id="paypal-button"></div></button><!-- nut paypal -->
            </div>
            <div style="display: none" class="" id="msg-checkout">
                <div class="alert alert-warning" role="alert">
                  Mua thành công! quay lại <a href="${pageContext.request.contextPath}/">trang chủ.</a>
                </div>
            </div>
          </div>
        </div>
      </div>
      
    </div>
  </form>
</c:if>