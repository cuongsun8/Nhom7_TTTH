<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<jsp:include page="/WEB-INF/Fragment/LibImport.jsp"/>
<link rel="stylesheet" href="/TrungTamTinHoc/Styles/Fragment/Interactive-Form.css">
<script type="text/javascript" src="/TrungTamTinHoc/Scripts/Fragment/Interactive-Form-validate.js"></script>

<style type="text/css">

</style>
</head>
<body class="interact-body">
<%request.setCharacterEncoding("UTF-8");%>
<div class="interact row mx-auto">
	  <div class="col-lg-4 col-md-3 col-sm-3"></div>
	  <div class="frame col-lg-4 col-md-5 col-sm-6 my-auto">
		  	<div class="nav">
		      <ul class="links  mx-auto">
		        <li class="active"><a class="tab">Hoàn tất</a></li>
		      </ul>
		    </div>
		    <div>
				<form id="form-tin-tuc" class="form-interact" action="add-news" method="post" name="form" enctype='multipart/form-data'>
			          <label for="username">Chủ đề</label>
			          <input class="form-styling" type="text" name="subject" 
			          data-toggle="popover" data-content="" id="subject"/>
			          <label for="password">Tựa đề</label>
			          <input class="form-styling" type="text" name="title"
			          data-toggle="popover" data-content="" id="title"/>
			          <label for="password">Đường dẫn</label>
			          <input class="form-styling" type="text" name="url"
			          data-toggle="popover"  data-content="" id="url"/>
			          <label for="password">Ảnh chủ đề</label>
			          <input type="file" name="image" accept="image/x-png,image/gif,image/jpeg" id="image"/>			          
    				  <button id="btn-select-image" class="btn btn-success"
    				   data-toggle="popover" data-content="">Chọn ảnh</button>
    				  <span id="image-name">Chưa có ảnh</span>
			          <br>
			          <br>
			          <div class="mx-auto" style="width: 100px">
					  	<img class="subject-image" src="#" alt=" Ảnh chủ đề" >	
					  </div>									  
			          <div class="btn-container mx-auto" style="width: 50%">
			            <input class="btnSave" value="Lưu" type="submit"/>
			          </div>
			          <input class="form-styling" type="text" name="content" id="content"/>
		          </form>
		     </div>
		</div>
	</div>
</body>
</html>