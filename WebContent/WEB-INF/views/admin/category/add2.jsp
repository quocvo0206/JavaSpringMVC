<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/taglib.jsp" %>    
        <div class="page-head">
          <h2 class="page-head-title">Category</h2>
          <nav aria-label="breadcrumb" role="navigation">
            <ol class="breadcrumb page-head-nav">
              <li class="breadcrumb-item"><a href="#">Admin</a></li>
              <li class="breadcrumb-item"><a href="#">Category</a></li>
              <li class="breadcrumb-item active">Add</li>
            </ol>
          </nav>
        </div>
        <div class="main-content container-fluid">
          <div class="row">
            <div class="col-md-12">
              <div class="card card-border-color card-border-color-primary">
                <div class="card-header card-header-divider">Basic Elements<span class="card-subtitle">These are the basic bootstrap form elements</span></div>
                <div class="card-body">
                  <form action="" method="post" enctype="multipart/form-data">
                    <div class="form-group row">
                      <label class="col-12 col-sm-2 col-form-label text-sm-right" for="inputText3">Input Text</label>
                      <div class="col-12 col-sm-10 col-lg-10">
                        <input class="form-control" id="inputText3" type="text">
                      </div>
                    </div>
                    <div class="form-group row">
                      <label class="col-12 col-sm-2 col-form-label text-sm-right" for="inputPassword3">Input Password</label>
                      <div class="col-12 col-sm-10 col-lg-10">
                        <input class="form-control" id="inputPassword3" type="password" oninput="check(this)">
                      </div>
                    </div>
                    <div class="form-group row">
                      <label class="col-12 col-sm-2 col-form-label text-sm-right" for="inputPlaceholder3">Placeholder Input</label>
                      <div class="col-12 col-sm-10 col-lg-10">
                        <input class="form-control" id="inputPlaceholder3" type="text" placeholder="Placeholder text">
                      </div>
                    </div>
                    <div class="form-group row">
                      <label class="col-12 col-sm-2 col-form-label text-sm-right" for="inputDisabled3">Disabled Input</label>
                      <div class="col-12 col-sm-10 col-lg-10">
                        <input class="form-control" id="inputDisabled3" type="text" disabled="disabled" placeholder="Disabled input text">
                      </div>
                    </div>
                    <div class="form-group row">
                      <label class="col-12 col-sm-2 col-form-label text-sm-right" for="inputReadonly3">Readonly Input</label>
                      <div class="col-12 col-sm-10 col-lg-10">
                        <input class="form-control" id="inputReadonly3" type="text" readonly="readonly" value="Readonly input text">
                      </div>
                    </div>
                    <div class="form-group row pt-1">
                      <label class="col-12 col-sm-2 col-form-label text-sm-right">Basic Select</label>
                      <div class="col-12 col-sm-10 col-lg-6">
                        <select class="form-control">
                          <option value="1" selected="selected">1</option>
                          <option value="2">2</option>
                          <option value="3">3</option>
                          <option value="4">4</option>
                          <option value="5">5</option>
                        </select>
                      </div>
                    </div>
                    <div class="form-group row pt-1">
                      <label class="col-12 col-sm-2 col-form-label text-sm-right">Basic Select</label>
                      <div class="col-12 col-sm-10 col-lg-6">
                        <select name="" class="form-control">
                          <c:forEach items="${mapCategories}" var="item">
                          <optgroup label="${item.key.name}">
                            <c:forEach items="${item.value}" var="itemOfItem">
                            <option value="">${item.key.name} - ${itemOfItem.name}</option>
                            </c:forEach>
                          </optgroup>
                          </c:forEach>
                        </select>
                      </div>
                    </div>
                    <div class="form-group row">
                      <label class="col-12 col-sm-2 col-form-label text-sm-right" for="file-1">Images</label>
                      <div class="col-12 col-sm-2">
                        <input onchange="changeInput(this)" accept="image/gif, image/jpeg, image/png" class="inputfile" id="file-1" type="file" name="file-1" data-multiple-caption="{count} files selected" multiple>
                        <label class="btn-secondary" for="file-1"> <i class="mdi mdi-upload"></i><span>Browse images...					</span></label>
                      </div>
                    </div>
                    <div class="form-group row d-none" id="filePreview">
                      <div class="col-12 col-sm-2"></div>
                      <div class="col-12 col-sm-10">
                      	<div class="row">
                      	  <label id="filename" class="col-12 col-sm-12 col-form-label text-sm-left" for="file-1"></label>
                      	</div>
                      	<div class="row">
                      	  <div class="col-12 col-sm-2">
                      	    <img id="imgPreview" class="w-100 img-thumbnail rounded" src="" alt="" />
                      	  </div>
                      	</div>
                      </div>
                    </div>
                    <script type="text/javascript">
                    	function readURL(input) {
                   			if (input.files && input.files[0]) {
                   		    	var reader = new FileReader();
                   		    	reader.onload = function(e) {
                   		      		$('#imgPreview').attr('src', e.target.result);
                   		    	}
                   		    	reader.readAsDataURL(input.files[0]);
                   		  	}
                   		}
                    	function changeInput(input) {
                    		$('#filePreview').removeClass('d-none');
                    		if (input.value != '')
                    			$('#filename').html(input.value);
                    		readURL(input);
                    	}
                    </script>
                    <div class="form-group row">
                      <label class="col-12 col-sm-2 col-form-label text-sm-right" for="">Textarea</label>
                      <div class="col-12 col-sm-10 col-lg-10">
                        <textarea class="form-control" id=""></textarea>
                      </div>
                    </div>
                    <div class="form-group row">
                      <label class="col-12 col-sm-2 col-form-label text-sm-right" for="inputTextarea3">Textarea</label>
                      <div class="col-12 col-sm-10 col-lg-10">
                        <textarea class="form-control" id="editor"></textarea>
                      </div>
                    </div>
                    <div class="row pt-3">
                      <div class="col-sm-12">
                        <p class="text-right">
                          <button class="btn btn-space btn-primary" type="submit">Submit</button>
                        </p>
                      </div>
                    </div>
                  </form>
                </div>
              </div>
            </div>
          </div>
        </div>
     