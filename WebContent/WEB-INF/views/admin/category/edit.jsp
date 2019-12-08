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
              <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin">Admin</a></li>
              <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin/category">Category</a></li>
              <li class="breadcrumb-item active">Edit</li>
            </ol>
          </nav>
        </div>
        <div class="main-content container-fluid">
          <div class="row">
            <div class="col-md-12">
              <div class="card card-border-color card-border-color-success">
                <div class="card-header card-header-divider">Sửa danh mục<span class="card-subtitle">Sửa một danh mục sẽ hiển thị trên menu của trang chủ</span></div>
                <div class="card-body">
                  <form action="" method="post">
                    <div class="form-group row">
                      <label class="col-12 col-sm-2 col-form-label text-sm-right" for="name">Name</label>
                      <div class="col-12 col-sm-10 col-lg-10">
                        <input class="form-control" id="name" name="name" value="${objCategory.name}" type="text" placeholder="Name">
                        <form:errors path="objCategory.name" cssClass="parsley-errors-list filled d-block mt-2" />
                      </div>
                    </div>
                    <div class="form-group row pt-1">
                      <label class="col-12 col-sm-2 col-form-label text-sm-right" for="parentId">Parent Category</label>
                      <div class="col-12 col-sm-10 col-lg-10">
                        <select name="parentId" id="parentId" class="form-control">
                          <option value="0">None</option>
                          <c:if test="${objCategory.parentId != 0}">
                            <c:forEach items="${mapCategories}" var="item">
                              <c:choose>
                                <c:when test="${objCategory.parentId !=  item.key.id}">
                                  <option value="${item.key.id}">${item.key.name}</option> 
                                </c:when>
                                <c:otherwise>
                                  <option value="${item.key.id}" selected="selected">${item.key.name}</option> 
                                </c:otherwise>
                              </c:choose>
                            </c:forEach>
                          </c:if>
                        </select>
                        <form:errors path="objCategory.parentId" cssClass="parsley-errors-list filled d-block mt-2" />
                      </div>
                    </div>
                    <div class="form-group row pt-1">
                      <label class="col-12 col-sm-2 col-form-label text-sm-right" for="sort">Sort</label>
                      <div class="col-12 col-sm-10 col-lg-10">
                        <input class="form-control" name="sort" id="sort" type="number" min="1" value="${objCategory.sort}">
                        <form:errors path="objCategory.sort" cssClass="parsley-errors-list filled d-block mt-2" />
                      </div>
                    </div>
                    <div class="row pt-3">
                      <div class="col-sm-12">
                        <p class="text-right">
                          <button class="btn btn-space btn-success" type="submit"><i class="icon icon-left mdi mdi-edit"></i> Edit</button>
                        </p>
                      </div>
                    </div>
                  </form>
                </div>
              </div>
            </div>
          </div>
        </div>
     