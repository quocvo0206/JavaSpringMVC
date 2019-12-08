<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		  <div class="row">
		    <div class="col-sm-12">
	       	  <div class="alert alert-primary alert-dismissible" role="alert">
	            <button class="close" type="button" data-dismiss="alert" aria-label="Close"><span class="mdi mdi-close" aria-hidden="true"></span></button>
	            <div class="icon"><span class="mdi mdi-check"></span></div>
	            <div class="message"><strong>Good!</strong> Better check yourself, you're not looking too good.</div>
	          </div> 
            </div>
		  </div>	
		  <div class="row">
		    <div class="col-sm-12">
		      <div class="alert alert-primary alert-icon alert-icon-border alert-dismissible" role="alert">
                <div class="icon"><span class="mdi mdi-notifications"></span></div>
                <div class="message">
                  <button class="close" type="button" data-dismiss="alert" aria-label="Close"><span class="mdi mdi-close" aria-hidden="true"></span></button><strong>Primary!</strong> Better check yourself, you're not looking too good.
                </div>
              </div>
		    </div>	
		  </div>
		  <div class="row">
		    <div class="col-sm-12">
		      <div class="alert alert-success alert-icon alert-icon-colored alert-dismissible" role="alert">
                <div class="icon"><span class="mdi mdi-check"></span></div>
                <div class="message">
                  <button class="close" type="button" data-dismiss="alert" aria-label="Close"><span class="mdi mdi-close" aria-hidden="true"></span></button><strong>Good!</strong> Better check yourself, you're not looking too good.
                </div>
              </div>
            </div>
		  </div>
		  <div class="row">
		    <div class="col-sm-12">
	       	  <a href="${pageContext.request.contextPath}/admin/category/add"><button class="btn btn-space btn-primary"><i class="icon icon-left mdi mdi-plus"></i>Add</button></a>
	       	  <button id="deleteSelected" class="btn btn-space btn-danger"><i class="icon icon-left mdi mdi-delete"></i>Delete</button>
            </div>
		  </div>	
          <div class="row">
            <div class="col-sm-12">
              <div class="card card-table">
                <div class="card-header">Responsive Table
                  <div class="tools dropdown"><span class="icon mdi mdi-download"></span><a class="dropdown-toggle" href="#" role="button" data-toggle="dropdown"><span class="icon mdi mdi-more-vert"></span></a>
                    <div class="dropdown-menu" role="menu"><a class="dropdown-item" href="#">Action</a><a class="dropdown-item" href="#">Another action</a><a class="dropdown-item" href="#">Something else here</a>
                      <div class="dropdown-divider"></div><a class="dropdown-item" href="#">Separated link</a>
                    </div>
                  </div>
                </div>
                <div class="card-body">
                  <div class="table-responsive noSwipe">
                    <table class="table table-striped table-hover table-bordered">
                      <thead>
                        <tr>
                          <th style="width:4%;">
                            <label class="custom-control custom-control-sm custom-checkbox">
                              <input id="checkAll" class="custom-control-input" type="checkbox"><span class="custom-control-label"></span>
                            </label>
                          </th>
                          <th style="width:20%;">User</th>
                          <th style="width:17%;">Last Commit</th>
                          <th style="width:15%;">Milestone</th>
                          <th style="width:10%;">Branch</th>
                          <th style="width:10%;">Date</th>
                          <th style="width:10%;">Chức năng</th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr class="primary">
                          <td>
                            <label class="custom-control custom-control-sm custom-checkbox">
                              <input value="0" name="aRow" class="custom-control-input" type="checkbox"><span class="custom-control-label"></span>
                            </label>
                          </td>
                          <td class="user-avatar cell-detail user-info"><img src="${pageContext.request.contextPath}/adminUrl/assets/img/avatar.png" alt="Avatar"><span>Kristopher Donny</span><span class="cell-detail-description">Designer</span></td>
                          <td class="cell-detail"> <span>Right sidebar adjusments</span><span class="cell-detail-description">CLI Connector</span></td>
                          <td class="milestone"><span class="completed">38 / 40</span><span class="version">v1.0.1</span>
                            <div class="progress">
                              <div class="progress-bar progress-bar-primary" style="width: 98%;"></div>
                            </div>
                          </td>
                          <td class="cell-detail"><span>master</span><span class="cell-detail-description">65bc2da</span></td>
                          <td class="cell-detail"><span>Mars 18, 2018</span><span class="cell-detail-description">13:02</span></td>
                          <td class="text-right">
                            <a href="${pageContext.request.contextPath}/admin/category/add"><button class="btn btn-space btn-danger"><i class="icon icon-left mdi mdi-edit"></i>Edit</button></a>
                            <a href="${pageContext.request.contextPath}/admin/category/add"><button class="btn btn-space btn-success"><i class="icon icon-left mdi mdi-delete"></i>Delete</button></a>
                          </td>
                        </tr>
                        <tr class="">
                          <td>
                            <label class="custom-control custom-control-sm custom-checkbox">
                              <input value="1" name="aRow" class="custom-control-input" type="checkbox"><span class="custom-control-label"></span>
                            </label>
                          </td>
                          <td class="user-avatar cell-detail user-info"><img src="${pageContext.request.contextPath}/adminUrl/assets/img/avatar.png" alt="Avatar"><span>Kristopher Donny</span><span class="cell-detail-description">Designer</span></td>
                          <td class="cell-detail"> <span>Right sidebar adjusments</span><span class="cell-detail-description">CLI Connector</span></td>
                          <td class="milestone"><span class="completed">38 / 40</span><span class="version">v1.0.1</span>
                            <div class="progress">
                              <div class="progress-bar progress-bar-primary" style="width: 98%;"></div>
                            </div>
                          </td>
                          <td class="cell-detail"><span>master</span><span class="cell-detail-description">65bc2da</span></td>
                          <td class="cell-detail"><span>Mars 18, 2018</span><span class="cell-detail-description">13:02</span></td>
                          <td class="text-right">
                            <div class="btn-group btn-hspace">
                              <button class="btn btn-secondary dropdown-toggle" type="button" data-toggle="dropdown">Open <span class="icon-dropdown mdi mdi-chevron-down"></span></button>
                              <div class="dropdown-menu" role="menu">
                              	<a class="dropdown-item" href="#">Action</a>
                              	<a class="dropdown-item" href="#">Another action</a>
                              	<a class="dropdown-item" href="#">Something else here</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#">Separated link</a>
                              </div>
                            </div>
                          </td>
                        </tr>
                        <tr class="">
                          <td>
                            <label class="custom-control custom-control-sm custom-checkbox">
                              <input value="2" name="aRow" class="custom-control-input" type="checkbox"><span class="custom-control-label"></span>
                            </label>
                          </td>
                          <td class="user-avatar cell-detail user-info"><img src="${pageContext.request.contextPath}/adminUrl/assets/img/avatar.png" alt="Avatar"><span>Kristopher Donny</span><span class="cell-detail-description">Designer</span></td>
                          <td class="cell-detail"> <span>Right sidebar adjusments</span><span class="cell-detail-description">CLI Connector</span></td>
                          <td class="milestone"><span class="completed">38 / 40</span><span class="version">v1.0.1</span>
                            <div class="progress">
                              <div class="progress-bar progress-bar-primary" style="width: 98%;"></div>
                            </div>
                          </td>
                          <td class="cell-detail"><span>master</span><span class="cell-detail-description">65bc2da</span></td>
                          <td class="cell-detail"><span>Mars 18, 2018</span><span class="cell-detail-description">13:02</span></td>
                          <td class="text-right">
                            <div class="btn-group btn-hspace">
                              <button class="btn btn-secondary dropdown-toggle" type="button" data-toggle="dropdown">Open <span class="icon-dropdown mdi mdi-chevron-down"></span></button>
                              <div class="dropdown-menu" role="menu">
                              	<a class="dropdown-item" href="#">Action</a>
                              	<a class="dropdown-item" href="#">Another action</a>
                              	<a class="dropdown-item" href="#">Something else here</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#">Separated link</a>
                              </div>
                            </div>
                          </td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
		    <div class="col-sm-12 d-sm-flex justify-content-sm-center">
                <ul class="pagination">
                  <li class="page-item"><a class="page-link" href="#" aria-label="Previous"><span class="mdi mdi-chevron-left" aria-hidden="true"></span></a></li>
                  <li class="page-item"><a class="page-link" href="#">1</a></li>
                  <li class="page-item"><a class="page-link " href="#">...</a></li>
                  <li class="page-item active"><a class="page-link" href="#">2</a></li>
                  <li class="page-item"><a class="page-link" href="#">3</a></li>
                  <li class="page-item"><a class="page-link" href="#">4</a></li>
                  <li class="page-item"><a class="page-link" href="#">5</a></li>
                  <li class="page-item"><a class="page-link" href="#">6</a></li>
                  <li class="page-item"><a class="page-link" href="#">...</a></li>
                  <li class="page-item"><a class="page-link" href="#">7</a></li>
                  <li class="page-item"><a class="page-link" href="#" aria-label="Next"><span class="mdi mdi-chevron-right" aria-hidden="true"></span></a></li>
                </ul>
            </div>
		  </div>
        </div>
