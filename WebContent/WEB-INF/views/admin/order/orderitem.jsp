<%@page import="com.itquocvv.constant.MessageEnum"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/taglib.jsp" %>    
<script type="text/javascript">
document.getElementById('order').classList.add('active');
</script>  
        <div class="page-head">
          <h2 class="page-head-title">Order details</h2>
          <nav aria-label="breadcrumb" role="navigation">
            <ol class="breadcrumb page-head-nav">
              <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin">Admin</a></li>
              <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin/order">Order</a></li>
              <li class="breadcrumb-item active">Order details</li>
            </ol>
          </nav>
        </div>
        <div class="main-content container-fluid">
          <div class="row">
            <div class="col-md-12">
              <div class="card card-border-color card-border-color-primary">
                <div class="card-header card-header-divider">Order<span class="card-subtitle">Bạn có thể chỉnh trạng thái của order.</span></div>
                <div class="card-body">
                  <form action="" method="post">

                    <div class="form-group row pt-1">
                      <label class="col-12 col-sm-2 col-form-label text-sm-right">Status</label>
                      <div class="col-12 col-sm-10 col-lg-6">
                        <select name="status" class="form-control">
                            <c:forEach items="${listOrderStatus}" var="itemOrderStatus">
                              <c:choose>
                                <c:when test="${itemOrderStatus.id == objOrder.status}">
                                  <option selected="selected" value="${itemOrderStatus.id}">${itemOrderStatus.name}</option>
                                </c:when>
                                <c:otherwise>
                                  <option value="${itemOrderStatus.id}">${itemOrderStatus.name}</option>
                                </c:otherwise>
                              </c:choose>
                            </c:forEach>
                        </select>
                      </div>
                    </div>
                    
                    <div class="form-group row pt-1">
                      <label class="col-12 col-sm-2 col-form-label text-sm-right">Thanh toán Payment</label>
                      <div class="col-12 col-sm-10 col-lg-6">
                        <select disabled="disabled" name="status" class="form-control">
                            <c:forEach items="${listPaymentStatus}" var="itemPaymentStatus">
                              <c:choose>
                                <c:when test="${itemPaymentStatus.id == objOrder.payment}">
                                  <option selected="selected" value="${itemPaymentStatus.id}">${itemPaymentStatus.name}</option>
                                </c:when>
                                <c:otherwise>
                                  <option value="${itemPaymentStatus.id}">${itemPaymentStatus.name}</option>
                                </c:otherwise>
                              </c:choose>
                            </c:forEach>
                        </select>
                      </div>
                    </div>
                    
                    <div class="form-group row">
                      <label class="col-12 col-sm-2 col-form-label text-sm-right" for="id">Id</label>
                      <div class="col-12 col-sm-10 col-lg-10">
                        <input readonly="readonly" class="form-control" id="id" name="id" value="${objOrder.id}" type="text" />
                      </div>
                    </div>
                    
                    <div class="form-group row">
                      <label class="col-12 col-sm-2 col-form-label text-sm-right" for="fullname">Fullname</label>
                      <div class="col-12 col-sm-10 col-lg-10">
                        <input readonly="readonly" class="form-control" id="fullname" name="fullname" value="${objOrder.fullname}" type="text" />
                      </div>
                    </div>
                    
                    <div class="form-group row">
                      <label class="col-12 col-sm-2 col-form-label text-sm-right" for="address">Address</label>
                      <div class="col-12 col-sm-10 col-lg-10">
                        <input readonly="readonly" class="form-control" id="address" name="address" value="${objOrder.address}" type="text" />
                      </div>
                    </div>
                    
                    <div class="form-group row">
                      <label class="col-12 col-sm-2 col-form-label text-sm-right" for="email">Email</label>
                      <div class="col-12 col-sm-10 col-lg-10">
                        <input readonly="readonly" class="form-control" id="email" name="email" value="${objOrder.email}" type="text" />
                      </div>
                    </div>
                    
                    <div class="form-group row">
                      <label class="col-12 col-sm-2 col-form-label text-sm-right" for="phone">Phone</label>
                      <div class="col-12 col-sm-10 col-lg-10">
                        <input readonly="readonly" class="form-control" id="phone" name="phone" value="${objOrder.phone}" type="text" />
                      </div>
                    </div>
                    
                    <div class="form-group row">
                      <label class="col-12 col-sm-2 col-form-label text-sm-right" for="message">Message</label>
                      <div class="col-12 col-sm-10 col-lg-10">
                        <textarea readonly="readonly" class="form-control" id="message" name="message">${objOrder.message}</textarea>
                      </div>
                    </div>
                    
                    <div class="form-group row">
                      <label class="col-12 col-sm-2 col-form-label text-sm-right" for="amount">Amount</label>
                      <div class="col-12 col-sm-10 col-lg-10">
                        <input readonly="readonly" class="form-control" id="amount" name="amount" value="${objOrder.amount}" type="text" />
                      </div>
                    </div>
                    
                    <div class="form-group row">
                      <label class="col-12 col-sm-2 col-form-label text-sm-right" for="dateCreated">Date created</label>
                      <div class="col-12 col-sm-10 col-lg-10">
                        <input readonly="readonly" class="form-control" id="dateCreated" name="dateCreated" value="${objOrder.dateCreated}" type="text" />
                      </div>
                    </div>

                    <div class="row pt-3">
                      <div class="col-sm-12">
                        <p class="text-right">
                          <button class="btn btn-space btn-primary" type="submit"><i class="icon icon-left mdi mdi-edit"></i> Edit</button>
                        </p>
                      </div>
                    </div>
                    
                  </form>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-sm-12">
              <div class="card card-table">
                <div class="card-header">Order details table
                </div>
                <div class="card-body">
                  <div class="table-responsive noSwipe">
                    <table class="table table-striped table-hover table-bordered" style="border: 1px solid #dee2e6;">
                      <thead>
                        <tr>
                          <th style="width:10%;">Id</th>
                          <th style="width:10%;">Product name</th>
                          <th style="width:10%;">Image</th>
                          <th style="width:10%;">Quantity</th>
                          <th style="width:10%;">Unit price</th>
                          <th style="width:10%;">Total price</th>
                        </tr>
                      </thead>
                      <tbody>
                        <c:choose>
                          <c:when test="${not empty listOrderItems}">
                            <c:forEach items="${listOrderItems}" var="itemOrderItem">
                              <tr class="${rowClass}">
                                <td class="cell-detail"><span>${itemOrderItem.id}</span></td>
                                <td class="cell-detail"><span>${itemOrderItem.product.name}</span></td>
                                <td class="cell-detail">
                                  <img class="w-100 img-thumbnail rounded" src="${pageContext.request.contextPath}/files/${itemOrderItem.product.image}">
                                </td>
                                <td class="cell-detail"><span>${itemOrderItem.quantity}</span></td>
                                <td class="cell-detail"><span>${itemOrderItem.product.price}</span></td>
                                <td class="cell-detail"><span>${itemOrderItem.product.price * itemOrderItem.quantity}</span></td>
                              </tr>
                            </c:forEach>
                          </c:when>
                          <c:otherwise>
                            <td class="cell-detail text-center" colspan="11"><span>Không order item nào</span></td>
                          </c:otherwise>
                        </c:choose>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
