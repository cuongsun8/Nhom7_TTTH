<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<jsp:include page="/WEB-INF/Fragment/LibImport.jsp"/>
<script type="text/javascript" src="/TrungTamTinHoc/Assets/tinymce/tinymce.min.js">
</script>
<script type="text/javascript">
	tinymce.init({
		selector : 'textarea.tinymce',
		height : 500,
		theme : 'modern',
		plugins : 'print preview fullpage searchreplace autolink directionality visualblocks visualchars fullscreen image link media template codesample table charmap hr pagebreak nonbreaking anchor toc insertdatetime advlist lists textcolor wordcount imagetools contextmenu colorpicker textpattern help',
		toolbar1 : 'formatselect | bold italic strikethrough forecolor backcolor | link | alignleft aligncenter alignright alignjustify  | numlist bullist outdent indent  | removeformat',
		image_advtab : true,
		templates : [ {
			title : 'Test template 1',
			content : 'Test 1'
		}, {
			title : 'Test template 2',
			content : 'Test 2'
		} ],
		content_css : [
				'//fonts.googleapis.com/css?family=Lato:300,300i,400,400i',
				'//www.tinymce.com/css/codepen.min.css' ],
	});
	
	$(document).ready(function(){
		$('#get-data-form').on("submit", function(event){
			var content = tinymce.get("texteditor").getContent();
			$('#data-container').append(content);			
			return false;
		});
	});
	
	window.onbeforeunload = function(event)
    {
        return confirm("Các dữ liệu soạn thảo của bạn sẽ bị mất!!!");
    };
</script>
<style>
.tin-tuc{
	height: 100vh;
	position: relative;
	animation: move 2s linear;
}
@keyframes move{
  from { z-index: -1;}
  to { z-index: 1;}
}
</style>
</head>
<body>
<jsp:include page="/Interactive-Form.jsp" />
<div class="tin-tuc">
	<form id="get-data-form" method="post">
		<textarea class="tinymce" id="texteditor"></textarea>
		<input id="btn-get-data" class="btn btn-primary" type="submit" value="Lấy bài viết">
	</form>
	<div id="data-container" class="mx-auto" style="width:90vw;">	
	</div>
</div>
</body>
</html>