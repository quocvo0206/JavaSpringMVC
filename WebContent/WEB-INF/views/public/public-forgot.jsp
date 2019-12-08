<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h2 class="title text-center">Forgot password</h2>
<div class="col-md-3">
</div>
<div class="col-md-6 login-form">
  <form class="form-horizontal" method="POST" action="https://demo.s-cart.org/password/email">
    <input type="hidden" name="_token" value="NA7GR94rFKxGyG0Xpeu4OXhoj639wMbHv4cs2WQB">
    <div class="form-group">
      <label for="email" class="col-md-4 control-label">Your email</label>
      <div class="col-md-6">
        <input id="email" type="email" class="form-control" name="email" value="" required="required" />
        <button type="submit" name="SubmitLogin" class="btn btn-default">
          <span>
            <i class="glyphicon glyphicon-wrench"></i>
            Submit
          </span>
        </button>
      </div>
    </div>
  </form>
</div>
