<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

</div>
</div>
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
    <!-- jQuery -->
    <script src="/resources/assets/bootstrap/js/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="/resources/assets/bootstrap/js/bootstrap.min.js"></script>
 	
    <script src="/resources/assets/js/jquery.mCustomScrollbar.concat.min.js"></script>
    
    <!--  DataTables JavaScript -->
    <script src="/resources/assets/bootstrap/js/jquery.dataTables.min.js"></script>
    <script src="/resources/assets/bootstrap/js/dataTables.bootstrap.min.js"></script> 

    <!-- Custom Theme Scripts -->
    <script src="/resources/assets/js/ad.custom.min.js"></script>
    <script src="/resources/assets/js/admin-modal.js"></script>
    
    <!-- Bootstrap datatable buttons -->
    <script src="/resources/assets/bootstrap/js/dataTables.buttons.min.js"></script>
    <script src="/resources/assets/bootstrap/js/buttons.bootstrap.min.js"></script>
    <script src="/resources/assets/bootstrap/js/buttons.flash.min.js"></script>
    <script src="/resources/assets/bootstrap/js/buttons.html5.min.js"></script>
    <script src="/resources/assets/bootstrap/js/buttons.print.min.js"></script>

</body>

</html>