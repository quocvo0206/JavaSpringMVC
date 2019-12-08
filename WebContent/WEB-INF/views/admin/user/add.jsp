<%@page import="com.itquocvv.constant.MessageEnum"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/taglib.jsp" %>  
<script type="text/javascript">
document.getElementById('user').classList.add('active');
</script> 
        <div class="page-head">
          <h2 class="page-head-title">User</h2>
          <nav aria-label="breadcrumb" role="navigation">
            <ol class="breadcrumb page-head-nav">
              <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin">Admin</a></li>
              <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin/user">User</a></li>
              <li class="breadcrumb-item active">Add</li>
            </ol>
          </nav>
        </div>
        <div class="main-content container-fluid">
        
      	  <c:if test="${not empty  eMsg}">
            <c:set var="alertClass" value="" />
            <c:set var="alertMessage" value="" />
            <!-- START với mỗi loại thông báo edit, add, delete thì có mỗi màu sắc cho alert riêng -->
      		<c:choose>
      	      <c:when test="${eMsg eq MessageEnum.MSG_ERROR}">
                <c:set var="alertClass" value="danger" />
                <c:set var="alertMessage" value="Error" />
      	      </c:when>
      		  <c:otherwise>
      		  </c:otherwise>
      		</c:choose>
            <!-- END với mỗi loại thông báo edit, add, delete thì có mỗi màu sắc cho alert riêng -->
            
            <!-- START alert message when add, edit, delete success -->          
  		    <div class="row">
  		      <div class="col-sm-12">
  		        <div class="alert alert-${alertClass} alert-icon alert-icon-border alert-dismissible" role="alert">
                  <div class="icon"><span class="mdi mdi-check"></span></div>
                  <div class="message">
                    <button class="close" type="button" data-dismiss="alert" aria-label="Close">
                      <span class="mdi mdi-close" aria-hidden="true"></span>
                    </button>
                    <strong>${alertMessage}! </strong>${eMsg.status } 
                  </div>
                </div>
  		      </div>	
  		    </div>
            <!-- END alert message when add, edit, delete success -->     
      	  </c:if>
        
          <div class="row">
            <div class="col-md-12">
              <div class="card card-border-color card-border-color-primary">
                <div class="card-header card-header-divider">Thêm người dùng<span class="card-subtitle">Thêm người dùng với một quyền nhất định</span></div>
                <div class="card-body">
                  <form action="" method="post">
                  
                    <div class="form-group row pt-1">
                      <label class="col-12 col-sm-2 col-form-label text-sm-right" for="roleId">Role</label>
                      <div class="col-12 col-sm-10 col-lg-10">
                        <select name="roleId" id="roleId" class="form-control">
                          <c:forEach items="${listRoles}" var="itemRole">
                            <c:choose>
                              <c:when test="${objUser.role.id !=  itemRole.id}">
                                <option value="${itemRole.id}">${itemRole.name}</option> 
                              </c:when>
                              <c:otherwise>
                                <option value="${itemRole.id}" selected="selected">${itemRole.name}</option> 
                              </c:otherwise>
                            </c:choose>
                          </c:forEach>
                        </select>
                        <form:errors path="objUser.role" cssClass="parsley-errors-list filled d-block mt-2" />
                      </div>
                    </div>
                  
                    <div class="form-group row">
                      <label class="col-12 col-sm-2 col-form-label text-sm-right" for="username">Username</label>
                      <div class="col-12 col-sm-10 col-lg-10">
                        <input class="form-control" id="username" name="username" value="${objUser.username}" type="text" placeholder="Username">
                        <form:errors path="objUser.username" cssClass="parsley-errors-list filled d-block mt-2" />
                      </div>
                    </div>
                    
                    <div class="form-group row">
                      <label class="col-12 col-sm-2 col-form-label text-sm-right" for="fullname">Fullname</label>
                      <div class="col-12 col-sm-10 col-lg-10">
                        <input class="form-control" id="fullname" name="fullname" value="${objUser.fullname}" type="text" placeholder="Fullname">
                        <form:errors path="objUser.fullname" cssClass="parsley-errors-list filled d-block mt-2" />
                      </div>
                    </div>
                    
                    <div class="form-group row">
                      <label class="col-12 col-sm-2 col-form-label text-sm-right" for="password">Password</label>
                      <div class="col-12 col-sm-10 col-lg-10">
                        <input class="form-control" id="password" name="password" value="${objUser.password}" type="password" placeholder="Password">
                        <form:errors path="objUser.password" cssClass="parsley-errors-list filled d-block mt-2" />
                      </div>
                    </div>

                    <div class="form-group row">
                      <label class="col-12 col-sm-2 col-form-label text-sm-right" for="email">Email</label>
                      <div class="col-12 col-sm-10 col-lg-10">
                        <input class="form-control" id="email" name="email" value="${objUser.email}" type="text" placeholder="Email">
                        <form:errors path="objUser.email" cssClass="parsley-errors-list filled d-block mt-2" />
                      </div>
                    </div>
                    
                    <div class="form-group row">
                      <label class="col-12 col-sm-2 col-form-label text-sm-right" for="phoneNumber">Phone Number</label>
                      <div class="col-12 col-sm-10 col-lg-10">
                        <input class="form-control" id="phoneNumber" name="phoneNumber" value="${objUser.phoneNumber}" type="text" placeholder="Phone Number">
                        <form:errors path="objUser.phoneNumber" cssClass="parsley-errors-list filled d-block mt-2" />
                      </div>
                    </div>
                    
                    <div class="form-group row">
                      <label class="col-12 col-sm-2 col-form-label text-sm-right" for="address">Address</label>
                      <div class="col-12 col-sm-10 col-lg-10">
                        <input class="form-control" id="address" name="address" value="${objUser.address}" type="text" placeholder="Address">
                        <form:errors path="objUser.address" cssClass="parsley-errors-list filled d-block mt-2" />
                      </div>
                    </div>
                    
                    <div class="row pt-3">
                      <div class="col-sm-12">
                        <p class="text-right">
                          <button class="btn btn-space btn-primary" type="submit"><i class="icon icon-left mdi mdi-plus"></i> Add</button>
                        </p>
                      </div>
                    </div>
                    
                  </form>
                </div>
              </div>
            </div>
          </div>
        </div>
     