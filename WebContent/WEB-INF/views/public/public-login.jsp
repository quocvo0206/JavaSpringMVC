<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h2 class="title text-center">
  Login</h2>
<div class="col-sm-4 col-sm-offset-1">
  <div class="login-form">
    <!--login form-->
    <h2>Login to your account</h2>
    <form action="${pageContext.request.contextPath}/auth/login" method="post" class="box">
      <div class="form-group">
        <label for="username" class="control-label">Username</label>
        <input class="is_required validate account_input form-control " type="text" id="username" name="username " value=" ">
      </div>
      <div class="form-group ">
        <label for="password " class="control-label ">Password</label>
        <input class="is_required validate account_input form-control " type="password" id="password" name="password" value="">
      </div>
        <!-- <input class="" type="checkbox" id="rememberme" name="rememberme" value=""> -->
      <p class="lost_password form-group">
        <a class="btn btn-link" href="${pageContext.request.contextPath}/auth/public-forgot">
          Forgot password?
        </a>
        <br>
      </p>
      <button type="submit" name="submit" class="btn btn-default">Login</button>
    </form>
  </div>
  <!--/login form-->
</div>
<div class="col-sm-1">
  <h2 class="or">OR</h2>
</div>
<div class="col-sm-4">
  <div class="signup-form">
    <!--sign up form-->
    <h2>New User Signup!</h2>
    <form action="https://demo.s-cart.org/register" method="post" class="box">
      <input type="hidden" name="_token" value="ocbtCtYNiwt73no0ZjhRYMlzvRtEjyGahrPDdAH3">
      <div class="form_content " id="collapseExample">
        <div class="form-group">
          <input type="text" class="is_required validate account_input form-control " name="reg_name" placeholder="Name" value="">
        </div>
        <div class="form-group">
          <input type="text" class="is_required validate account_input form-control " name="reg_email" placeholder="Email" value="">
        </div>
        <div class="form-group">
          <input type="text" class="is_required validate account_input form-control " name="reg_phone" placeholder="Phone" value="">
        </div>
        <div class="form-group">
          <input type="text" class="is_required validate account_input form-control " name="reg_address1" placeholder="Address 1" value="">
        </div>
        <div class="form-group">
          <input type="text" class="is_required validate account_input form-control " name="reg_address2" placeholder="Address 2" value="">
        </div>
        <div class="form-group">
          <input type="password" class="is_required validate account_input form-control " name="reg_password" placeholder="Password" value="">
        </div>
        <div class="form-group">
          <input type="password" class="is_required validate account_input form-control " placeholder="Password confirm" name="reg_password_confirmation" value="">
        </div>
        <input type="hidden" name="check_red" value="1">
        <div class="submit">
          <button type="submit" name="SubmitCreate" class="btn btn-default">Signup</button>
        </div>
      </div>
    </form>
  </div>
  <!--/sign up form-->
</div>