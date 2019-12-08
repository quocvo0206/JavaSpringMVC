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
    $('#frmOrder').validate({
      rules:{
        "fullname":{
          required: true,
        },
        "email":{
          required: true,
          email: true,
        },
        "phone":{
          required: true,
          digits: true,
          minlength: 9,
          maxlength: 11
        },
        "address":{
          required: true,
        }
      },
      submitHandler: function(form) {
        $.ajax({
          url: '<%=request.getContextPath()%>/cart/order',
          type: 'POST',
          cache: false,
          data: $('#frmOrder').serialize(),
          success: function(response){
          	alert('Order thành công.');
          	window.location.reload(true);
        	console.log('order thành công');
          	$('#msg-checkout').show('slow');
          	$('#frmOrder')[0].reset();
          	
          },
          error: function (){
            console.log('lỗi ajax order');
          }
        });
      }
    });
  }) ;
  </script>
  
  <script type="text/javascript">
      function formatNumber (num) {
          return num.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,")
      }
      $('#shipping').change(function(){
          $('#total').html(formatNumber(parseInt(0)+ parseInt($('#shipping').val())));
      });
  </script>
  <script type="text/javascript">
    function effectAddToCart(id, instance) {
          if(instance == null || instance ==''){
            var cart = $('.shopping-cart');
          } else{
            var cart = $('.shopping-'+instance);
          }
          var imgtodrag = $('.product-box-'+id).find("img").eq(0);
          if (imgtodrag) {
              var imgclone = imgtodrag.clone()
              .offset({
                  top: imgtodrag.offset().top,
                  left: imgtodrag.offset().left
              })
                  .css({
                  'opacity': '0.5',
                      'position': 'absolute',
                      'width': '150px',
                      'z-index': '99999999'
              })
                  .appendTo($('body'))
                  .animate({
                  'top': cart.offset().top,
                      'left': cart.offset().left,
                      'width': 75,
                      'height': 75
              }, 1000, 'easeInOutExpo');

              imgclone.animate({
                  'width': 0,
                      'height': 0
              }, function () {
                  $(this).detach()
              });
          }
          $(window).scrollTop(0);
    }
  
    function addToCart(id) {
        $.ajax({
            url: '${pageContext.request.contextPath}/cart/add',
            type: 'POST',
            dataType: 'html',
            data: { productId: id },
            success: function(data){
              console.log('thêm giỏ hàng thành công: ' + data);
              effectAddToCart(id);
              $('#count_cart').html(data);
           },
           error: function() {
             console.log('có lỗi thêm item ajax giỏ hàng');
           }
        });
    }
    function removeToCart(id) {
        $.ajax({
            url: '${pageContext.request.contextPath}/cart/remove',
            type: 'POST',
            dataType: 'JSON',
            data: { productId: id },
            success: function(json){
              console.log('xoa một item giỏ hàng thành công: ');
              $('#row_cart_' + id).remove();
              $('#count_cart').html(json.countCartItem); //cập nhật số giỏ hàng
                     
              if (json.countCartItem != 0) {
                $('#total_pay').html('Tổng tiền: ' + json.total + 'VNĐ');     //cập nhật tổng số tiền trong giỏ hàng
                $('#totalPrice').html(json.total);  //tổng tiền
                if ($('input[type=radio][name=payment]').val() == 1) {
                	$('#total').html(parseInt(json.total) + 40000); //tổng tiền có phí ship  
                } else {
                	$('#total').html(parseInt(json.total));
                }
              } else {
                $('#total_pay').remove();
              }
           },
           error: function() {
             console.log('có lỗi remove item ajax giỏ hàng');
           }
        });
    }
    function removeAllCart() {
        $.ajax({
            url: '${pageContext.request.contextPath}/cart/removeAll',
            type: 'POST',
            dataType: 'html',
            data: {},
            success: function(data){
              console.log('xoa all item giỏ hàng thành công: ');
              $('#count_cart').html(0);
              $('#tbody_cart').empty();
              $('#totalPrice').html(0);
           },
           error: function() {
             console.log('có lỗi remove all item ajax giỏ hàng');
           }
        });
    }
    function updateCartItem(id, input) {
        $.ajax({
            url: '${pageContext.request.contextPath}/cart/updateCartItem',
            type: 'POST',
            dataType: 'JSON',
            data: { productId: id, quantity: input.value },
            success: function(json){
              console.log('update  item giỏ hàng thành công: ');
              $('#row_cart_' + id + ' .totalPriceItem').html(json.totalPriceCartItem + 'VNĐ');
              $('#total_pay').html('Tổng tiền: ' + json.total + 'VNĐ');   
              $('#totalPrice').html(json.total);  //tổng tiền
              
              if ($('input[type=radio][name=payment]').val() == 1) {
              	$('#total').html(parseInt(json.total) + 40000); //tổng tiền có phí ship  
              } else {
              	$('#total').html(parseInt(json.total));
              }
           },
           error: function() {
             console.log('có lỗi update item ajax giỏ hàng');
           }
        });
    }
    function addToCartInDetailPage(id) {
      console.log('hehaa');
      console.log($('#qty_in_detail_page').val());
        $.ajax({
            url: '${pageContext.request.contextPath}/cart/addToCartInDetailPage',
            type: 'POST',
            dataType: 'html',
            data: { productId: id, quantity: $('#qty_in_detail_page').val() },
            success: function(data){
              console.log('theem  item giỏ hàng thành công detail page: ');
              effectAddToCart(id);
              $('#count_cart').html(data);
           },
           error: function() {
             console.log('có lỗi update item ajax giỏ hàng');
           }
        });
    }
    
    
    /* chọn thanh toán */
    $('input[type=radio][name=payment]').change(function() {
      var method = this.value;
      var totalPrice = parseInt($('#totalPrice').html());
      //console.log(totalPrice);
      if (method == 1) { /* paypal */
        $('#total').html(totalPrice);
        $('#shipping').html(0);
        
        $('.paypal-button-div').show();
        $('.paypal-checkout-div').hide();
        
      } else if (method == 2) { /* thanh toán khi nhận hàng */
        $('#total').html(totalPrice + 40000);
        $('#shipping').html(40000);
        
        $('.paypal-button-div').hide();
        $('.paypal-checkout-div').show();
      }
    });
  </script>
  
<script src="https://www.paypalobjects.com/api/checkout.js"></script>
<script>
  paypal.Button.render({
    // Configure environment
    env: 'sandbox',
    client: {
      sandbox: 'AWfkTEWPyVYTQNC8tgxT5XCrxrniaTdbBeKOyJbHoxPvd5DfLZuTRknoN5byavCRHGICcbxeWG1C74DA',
      production: 'demo_production_client_id'
    },
    // Customize button (optional)
    locale: 'en_US',
    style: {
      size: 'small',
      color: 'gold',
      shape: 'pill',
    },
    // Set up a payment
    payment: function(data, actions) {
      
      var dola = parseInt(${sessionScope.cart.totalCart}) * 0.0000428962;
      dola = Math.floor(dola);
      console.log(dola);    
      
      return actions.payment.create({
        transactions: [{
          amount: {
            total: dola + '',
            currency: 'USD'
          }
        }]
      });
    },
    // Execute the payment
    onAuthorize: function(data, actions) {
      return actions.payment.execute().then(function() {
        
      //đưa lên server
        $.ajax({
            url: '<%=request.getContextPath()%>/cart/order',
            type: 'POST',
            cache: false,
            data: $('#frmOrder').serialize(),
            success: function(response){
              console.log('order thành công');
              //$('#msg-checkout').show('slow');
              $('#frmOrder')[0].reset();
            },
            error: function (){
              console.log('lỗi ajax order');
            }
          });
        
        // Show a confirmation message to the buyer
        window.alert('Bạn đã thanh toán thành công!');
        window.location.reload(true);
      });
    }
  }, '#paypal-button');

</script>