<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<jsp:include page="/WEB-INF/Fragment/LibImport.jsp"/>
<link rel="stylesheet" href="/TrungTamTinHoc/Styles/Fragment/Interactive-Form.css">
<script type="text/javascript">
$(document).ready(function(){
	
	$(".tab").click(function() {
	$(".active").addClass("inactive");
	$(".active").removeClass("active");	
	$(this).parent().addClass("active");
    $(this).parent().removeClass("inactive");
    });
	
	function readURL(input) {

		  if (input.files && input.files[0]) {
		    var reader = new FileReader();

		    reader.onload = function(e) {
		      $('.subject-image').attr('src', e.target.result);
		    }

		    reader.readAsDataURL(input.files[0]);
		  }
		}

	$("#image-input").change(function() {
		 readURL(this);
		 if(this.value != "")
		 $('#image-name').text(this.value.replace(/C:\\fakepath\\/i, ''))
	});
	
	$('#btn-select-image').click(function(){
		   $("input[type='file']").trigger('click');
		   return false;
	})    
});
</script>
<style type="text/css">

</style>
</head>
<body class="interact-body">
<div class="interact row mx-auto">
	  <div class="col-lg-4 col-md-3 col-sm-3"></div>
	  <div class="frame col-lg-4 col-md-5 col-sm-6 my-auto">
		  	<div class="nav">
		      <ul class="links  mx-auto">
		        <li class="active"><a class="tab">Hoàn tất</a></li>
		        <li class="inactive"><a class="tab">Công việc khác</a></li>
		      </ul>
		    </div>
		    <div>
				<form class="form-interact" action="" method="post" name="form">
			          <label for="username">Chủ đề</label>
			          <input class="form-styling" type="text" name="subject" placeholder=""/>
			          <label for="password">Tựa đề</label>
			          <input class="form-styling" type="text" name="tilte" placeholder=""/>
			          <label for="password">Đường dẫn</label>
			          <input class="form-styling" type="text" name="path" placeholder=""/>
			          <label for="password">Ảnh chủ đề</label>
			          <input type="file" name="image" id="image-input" accept="image/x-png,image/gif,image/jpeg"/>			          
    				  <button id="btn-select-image" class="btn btn-success">Chọn ảnh</button>
    				  <span id="image-name">Chưa có ảnh</span>
			          <br>
			          <br>
					  <img class="subject-image" src="#" alt="Ảnh chủ đề" >										  
			          <div class="btn-container">
			            <a class="btn-save">Lưu bài viết</a>
			          </div>
		          </form>
		     </div>
		</div>
	</div>
</body>
</html>