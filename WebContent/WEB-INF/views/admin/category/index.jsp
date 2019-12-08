<%@page import="com.itquocvv.constant.MessageEnum"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/taglib.jsp" %>
<script type="text/javascript">
document.getElementById('category').classList.add('active');
</script>  
        <div class="page-head">
          <h2 class="page-head-title">Category</h2>
          <nav aria-label="breadcrumb" role="navigation">
            <ol class="breadcrumb page-head-nav">
              <li class="breadcrumb-item"><a href="#">Admin</a></li>
              <li class="breadcrumb-item active">Category</li>
            </ol>
          </nav>
        </div>
        <div class="main-content container-fluid">
      	  <c:if test="${not empty  eMsg}">
            <c:set var="alertClass" value="" />
            <c:set var="message" value="" />
            <!-- START với mỗi loại thông báo edit, add, delete thì có mỗi màu sắc cho alert riêng -->
      		<c:choose>
      	      <c:when test="${eMsg eq MessageEnum.MSG_ADD_SUCCESS}">
                <c:set var="alertClass" value="primary" />
                <c:set var="alertMessage" value="Success" />
      	      </c:when>
      	      <c:when test="${eMsg eq MessageEnum.MSG_UPDATE_SUCCESS}">
                <c:set var="alertClass" value="success" />
                <c:set var="alertMessage" value="Success" />
      	      </c:when>
      	      <c:when test="${eMsg eq MessageEnum.MSG_DELETE_SUCCESS}">
                <c:set var="alertClass" value="warning" />
                <c:set var="alertMessage" value="Success" />
      	      </c:when>
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
		  <div class="row mb-1">
		    <div class="col-sm-6">
	       	  <a href="${pageContext.request.contextPath}/admin/category/add"><button class="btn btn-space btn-primary"><i class="icon icon-left mdi mdi-plus"></i>Add</button></a>
	       	  <a href="${pageContext.request.contextPath}/admin/category/table-arange"><button class="btn btn-space btn-primary"><i class="icon icon-left mdi mdi-view-subtitles"></i>Table Arange</button></a>
            </div>
		  </div>	
          <div class="row">
            <div class="col-sm-12">
              <div class="card card-table">
                <div class="card-header">Category Table
                </div>
                <div class="card-body">
                  <div class="table-responsive noSwipe">
                    <table id="categoryTable" class="table table-striped table-hover table-bordered" style="border: 1px solid #dee2e6;">
                      <thead>
                        <tr>
                          <th style="width:10%;">Id</th>
                          <th style="width:30%;">Name</th>
                          <th style="width:30%;">Sort</th>
                          <th style="width:30%;">Chức năng</th>
                        </tr>
                      </thead>
                      <tbody>
                        <c:forEach items="${mapCategories}" var="item">
                        <!-- START Tô màu cho row mà vừa thêm hoặc vừa sửa -->
                        <c:set var="rowClass" value="" />
                        <c:choose>
                          <c:when test="${item.key.id == objCategory.id}">
                            <c:set var="rowClass" value="table-warning" />
                          </c:when>
                          <c:otherwise>
                            <c:set var="rowClass" value="" />
                          </c:otherwise>
                        </c:choose>
                        <!-- END Tô màu cho row mà vừa thêm hoặc vừa sửa -->
                        
                        <tr class="primary ${rowClass}">
                          <td class="cell-detail"> <span>${item.key.id}</span></td>
                          <td class="cell-detail"> <span>${item.key.name}</span><span class="cell-detail-description">None</span></td>
                          <td class="cell-detail"> <span>${item.key.sort}</span></td>
                          <td class="text-center">
                            <a href="${pageContext.request.contextPath}/admin/category/edit/${item.key.id}"><button class="btn btn-space btn-success"><i class="icon icon-left mdi mdi-edit"></i>Edit</button></a>
                            <a href="${pageContext.request.contextPath}/admin/category/delete/${item.key.id}" onclick="return confirm('Bạn có muốn xóa danh mục cha ${item.key.name}')"><button class="btn btn-space btn-danger"><i class="icon icon-left mdi mdi-delete"></i>Delete</button></a>
                          </td>
                        </tr>
                          <c:forEach items="${item.value}" var="itemOfItem">
                          
                          <!-- START Tô màu cho row mà vừa thêm hoặc vừa sửa -->
                          <c:choose>
                            <c:when test="${itemOfItem.id == objCategory.id}">
                              <c:set var="rowClass" value="table-warning" />
                            </c:when>
                            <c:otherwise>
                              <c:set var="rowClass" value="" />
                            </c:otherwise>
                          </c:choose>
                          <!-- END Tô màu cho row mà vừa thêm hoặc vừa sửa -->
                          
                          <tr class="${rowClass}">
                            <td class="cell-detail"> <span>${itemOfItem.id}</span></td>
                            <td class="cell-detail"> <span>${itemOfItem.name}</span><span class="cell-detail-description">${item.key.name}</span></td>
                            <td class="cell-detail"> <span>${itemOfItem.sort}</span></td>
                            <td class="text-center">
                              <a href="${pageContext.request.contextPath}/admin/category/edit/${itemOfItem.id}"><button class="btn btn-space btn-success"><i class="icon icon-left mdi mdi-edit"></i>Edit</button></a>
                              <a href="${pageContext.request.contextPath}/admin/category/delete/${itemOfItem.id}" onclick="return confirm('Bạn có muốn xóa ${itemOfItem.name}')" ><button class="btn btn-space btn-danger"><i class="icon icon-left mdi mdi-delete"></i>Delete</button></a>
                            </td>
                          </tr>
                          </c:forEach>
                        </c:forEach>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
