<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/taglib.jsp" %>    
<div id="contact-page" class="container">
  <div class="bg">
    <div class="row">
      <div class="col-sm-12">
        <h2 class="title text-center">Contact <strong>Us</strong></h2>
      </div>
    </div>
    <div class="row">
      <div class="col-sm-8">
        <div class="contact-form">
          <h2 class="title text-center">Get In Touch</h2>
          <p></p>
          <form method="post" action="javascript:void(0)" id="frmContact" class="contact-form">
            <input type="hidden" name="_token" value="">
            <div id="contactFormWrapper" style="margin: 30px;">
              <div class="row">
                <div class="col-md-12 col-xs-12">
                  <div class="row">
                    <div class="col-sm-12">
                      <!-- message send contact success -->
                      <p style="display: none;" class="alert alert-warning" style="" id="msg-send-contact"></p>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-sm-4 form-group ">
                      <label>Name:</label>
                      <input type="text" class="form-control " name="fullname" placeholder="Your fullname..." value="${objContact.fullname}">
                    </div>
                    <div class="col-sm-4 form-group ">
                      <label>Email:</label>
                      <input type="text" class="form-control " name="email" placeholder="Your email..." value="${objContact.email}">
                    </div>
                    <div class="col-sm-4 form-group ">
                      <label>Phone:</label>
                      <input type="text" class="form-control " name="numberphone"  placeholder="Your phone..." value="${objContact.numberphone}">
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-sm-12 form-group ">
                      <label class="control-label">Subject:</label>
                      <input type="text" class="form-control " name="subject" placeholder="Subject..." value="${objContact.subject}">
                    </div>
                    <div class="col-sm-12 form-group ">
                      <label class="control-label">Content:</label>
                      <textarea style="height: 90px" class="form-control " rows="5" cols="75" name="message" placeholder="Your Message...">${objContact.message}</textarea>
                    </div>
                  </div>
                  <div class="btn-toolbar form-group">
                    <input type="submit" value="Submit" class="btn btn-primary">
                  </div>
                </div>
              </div>
            </div><!-- contactFormWrapper -->
          </form>
        </div>
      </div>
      <div class="col-sm-4">
        <div class="contact-info">
          <h2 class="title text-center">Contact Info</h2>
          <address>
            <p>S-Shop - Fashion shop</p>
            <p>Address: 54 Nguyễn Lương Bằng Đà Nẵng</p>
            <p>Support: 01627053245</p>
            <p>Email: tranhuuhongson@gmail.com</p>
          </address>
          <div class="social-networks">
            <h2 class="title text-center">Social Networking</h2>
            <ul>
              <li>
                <a href="#"><i class="fa fa-facebook"></i></a>
              </li>
              <li>
                <a href="#"><i class="fa fa-twitter"></i></a>
              </li>
              <li>
                <a href="#"><i class="fa fa-google-plus"></i></a>
              </li>
              <li>
                <a href="#"><i class="fa fa-youtube"></i></a>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<!--/#contact-page-->
<!-- Main Container -->
<div class="main-container col1-layout">
  <div class="container">
    <div class="row">
      <div class="col-md-12">
        <div class="page_content">
        </div>
      </div>
    </div>
  </div>
</div>
