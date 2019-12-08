<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <script data-cfasync="false" src="${pageContext.request.contextPath}/publicUrl/assets/s-cart/js/email-decode.min.js">
  </script><script src="${pageContext.request.contextPath}/publicUrl/assets/s-cart/js/jquery.js"></script>
  <script src="${pageContext.request.contextPath}/publicUrl/assets/s-cart/js/jquery-ui.min.js"></script>
  <script src="${pageContext.request.contextPath}/publicUrl/assets/s-cart/js/bootstrap.min.js"></script>
  <script src="${pageContext.request.contextPath}/publicUrl/assets/s-cart/js/jquery.scrollUp.min.js"></script>
  <script src="${pageContext.request.contextPath}/publicUrl/assets/s-cart/js/jquery.prettyPhoto.js"></script>
  <script src="${pageContext.request.contextPath}/publicUrl/assets/s-cart/js/main.js"></script>
  <script src="${pageContext.request.contextPath}/publicUrl/assets/s-cart/js/jquery.validate.min.js"></script>
  <script type="text/javascript">
      function formatNumber (num) {
          return num.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,")
      }
      $('#shipping').change(function(){
          $('#total').html(formatNumber(parseInt(0)+ parseInt($('#shipping').val())));
      });
  </script>
  <script>
  $('document').ready(function() {
    /*Trần Hữu Hồng Sơn*/
    $('#frmContact').validate({
      rules:{
        "fullname":{
          required: true,
        },
        "email":{
          required: true,
          email: true,
        },
        "numberphone":{
          required: true,
          digits: true,
          minlength: 9,
          maxlength: 11
        },
        "subject":{
          required: true,
        },
        "message":{
          required: true,
        },
      },
      submitHandler: function(form) {
        $.ajax({
          url: '<%=request.getContextPath()%>/contact',
          type: 'POST',
          cache: false,
          data: $('#frmContact').serialize(),
          success: function(response){
          	var msg = '';
  			if (response == 1) {
  				msg = 'Gởi liên hệ thành công';
  			}
  			else 
  				msg = 'Gởi liên hệ thất bại';
  			$('#msg-send-contact').html(msg).fadeIn( "slow" );
  			$('#frmContact')[0].reset();
          },
          error: function (){
            console.log('lỗi ajax gởi liên hệ');
          }
        });
      }
    });
  }) ;
  </script>