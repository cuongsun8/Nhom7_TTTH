$(document).ready(function(){
		if(window.location.href == "http://localhost:8080/TrungTamTinHoc/dang-ky-mon-hoc"){
			$('.dang-ky-online').hide();
		}
		else{
			$('.dang-ky-online').show();
		}
		var link = window.location.href;
		if(link.indexOf("http://localhost:8080/TrungTamTinHoc/dang-nhap") >=0 || 
				link.indexOf("http://localhost:8080/TrungTamTinHoc/dang-ky") >= 0){
			$('.dang-ky-online').hide();
			$('.form-parent').hide();
		}
			
		$('.dang-ky-online').click(function(){
			window.location.href = "http://localhost:8080/TrungTamTinHoc/dang-ky-mon-hoc";
			$(this).hide();
			return false;
		});
		
		$('.form-parent').click(function(event){
			$('.form-parent').css('right','0');
			$('.form-parent').css('cursor','default');
			$('.scroll-btn').hide();
		});
		
		$('.form-parent').mouseleave(function(){
			$('.form-parent').css('right','-305px');
			$('.form-parent').css('cursor','pointer');
			$('.scroll-btn').show();
		});
		$('.dang-ky-online').css('top', $(window).height() - $('.form-parent').height() - 164 +"px");
		$( window ).resize(function() {
			$('.dang-ky-online').css('top', $(window).height() - $('.form-parent').height() - 164 +"px");
		});
		
		$('#feedback-form').on('submit', function(e) {
	        e.preventDefault();
	        $.ajax({
	            url : $(this).attr('action') || window.location.pathname,
	            type: "POST",
	            data: $(this).serialize(),
	            success: function (data) {
	            	$('.form-parent').css('right','-305px');
	            },
	            error: function (jXHR, textStatus, errorThrown) {
	                alert(errorThrown);
	            }
	        });
	    });
	});