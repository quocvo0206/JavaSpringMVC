<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="assets/img/logo-fav.png">
    <title>Beagle</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/adminUrl/assets/lib/perfect-scrollbar/css/perfect-scrollbar.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/adminUrl/assets/lib/material-design-icons/css/material-design-iconic-font.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/adminUrl/assets/css/app.css" type="text/css"/>
  </head>
  <body class="be-splash-screen">
    <div class="be-wrapper be-login be-signup">
      <div class="be-content">
        <div class="main-content container-fluid">
          <div class="splash-container sign-up">
            <div class="card card-border-color card-border-color-primary">
              <div class="card-header"><img class="logo-img" src="${pageContext.request.contextPath}/adminUrl/assets/img/logo-xx.png" alt="logo" width="102" height="27"><span class="splash-description">Please enter your user information.</span></div>
              <div class="card-body">
                <form action="index.html" method="get"><span class="splash-title pb-4">Sign Up</span>
                  <div class="form-group">
                    <input class="form-control" type="text" name="nick" required="required" placeholder="Username" autocomplete="off">
                  </div>
                  <div class="form-group">
                    <input class="form-control" type="email" name="email" required="required" placeholder="E-mail" autocomplete="off">
                  </div>
                  <div class="form-group row signup-password">
                    <div class="col-6">
                      <input class="form-control" id="password" type="password" required="required" placeholder="Password">
                    </div>
                    <div class="col-6">
                      <input class="form-control" required="required" oninput="check(this)" placeholder="Confirm">
                    </div>
                    <script type='text/javascript'>
					    function check(input) {
					        if (input.value != document.getElementById('password').value) {
					            input.setCustomValidity('Password Must be Matching.');
					        } else {
					            input.setCustomValidity('');
					        }
					    }
					</script>
                  </div>
                  <div class="form-group pt-2">
                    <button class="btn btn-block btn-primary btn-xl" type="submit">Sign Up</button>
                  </div>
                  <div class="title"><span class="splash-title pb-3">Or</span></div>
                  <div class="form-group row social-signup pt-0">
                    <div class="col-6">
                      <button class="btn btn-lg btn-block btn-social btn-facebook btn-color" type="button"><i class="mdi mdi-facebook icon icon-left"></i>Facebook</button>
                    </div>
                    <div class="col-6">
                      <button class="btn btn-lg btn-block btn-social btn-google-plus btn-color" type="button"><i class="mdi mdi-google-plus icon icon-left"></i>Google Plus</button>
                    </div>
                  </div>
                  <div class="form-group pt-3 mb-3">
                    <label class="custom-control custom-checkbox">
                      <input class="custom-control-input" type="checkbox"><span class="custom-control-label">By creating an account, you agree the <a href="#">terms and conditions</a>.</span>
                    </label>
                  </div>
                </form>
              </div>
            </div>
            <div class="splash-footer">&copy; 2018 Your Company</div>
          </div>
        </div>
      </div>
    </div>
    <script src="${pageContext.request.contextPath}/adminUrl/assets/lib/jquery/jquery.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/adminUrl/assets/lib/perfect-scrollbar/js/perfect-scrollbar.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/adminUrl/assets/lib/bootstrap/dist/js/bootstrap.bundle.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/adminUrl/assets/js/app.js" type="text/javascript"></script>
    <script type="text/javascript">
      $(document).ready(function(){
      	//-initialize the javascript
      	App.init();
      });
      
    </script>
  </body>
</html>