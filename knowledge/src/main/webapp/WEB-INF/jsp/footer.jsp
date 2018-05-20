<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

	<div class="go-up"><i class="fa fa-chevron-up" style="margin-top: 10px;"></i></div>
	<!-- jQuery -->
	<script>
		jQuery(window).scroll(function () {
			if(jQuery(this).scrollTop() > 100 ) {
				jQuery(".go-up").css("right","40px");
			}else {
				jQuery(".go-up").css("right","-60px");
			}
		});
		jQuery(".go-up").click(function(){
			jQuery("html,body").animate({scrollTop:0},500);
			return false;
		});</script>
    <script src="/resources/assets/bootstrap/js/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="/resources/assets/bootstrap/js/bootstrap.min.js"></script>
    
    <!-- Custom Theme Scripts -->
  	<script src="/resources/assets/js/custom.js"></script>
  	<script src="/resources/assets/js/app.js"></script>
  	
</body>
</html>