<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
 <sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"
url="jdbc:mysql://localhost:3306/trungtamtinhoc" user="root"
password="123456789" />
<sql:query var="news" dataSource="${db}" maxRows="4">select * from news</sql:query>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<jsp:include page="/WEB-INF/Fragment/LibImport.jsp"/>
<script>
$(document).ready(function(){
	$('#data-container').empty();
	$('#data-container').append(`${content}`);
	$('#data-container img').removeAttr("style");
	$('#data-container img').attr('style', 
			`height:auto;
			 max-height:100% !important;
			 max-width: 100% !important;
			 vertical-align: middle;
			 display: block;
			 margin-right: auto;
			 margin-left: auto;
			 padding-top: 10px;
			 padding-right: 10px;
			 padding-left: 10px;
			`);
	
});
</script>
<style>
.tin-tuc .tieu-de-muc{
	font-size: 35px;
    padding: 20px 0px 20px 0px;
    color: #FD6504;
    line-height: 50px;
    text-align: center;
}
.tencungmuc{
	color: #FD6504;
}
.tin-tuc .card-body {
    padding: 1rem;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/Fragment/Header.jsp"/>
	
	<div class="tin-tuc">
		<h1 class="tieu-de-muc">${subject}</h1>
		<div id="data-container" class="mx-auto" style="width:90vw;">	
		</div>	
		<div class="cung-chuyen-muc mx-auto mb-3" style="width:90vw;">
			<h3 class="tencungmuc">
				<a>Tin cùng chuyên mục</a>
			</h3>
			<hr>
			<div class="row">
			<c:forEach items="${news.rows}" var="tintuc">
				<div class="col-md-3 col-sm-6 col-12 sub">
					<div class="card">
						<img class="card-img-top" src="${tintuc.Image}" title="${tintuc.TuaDe}">
						<div class="card-body">
							<a href="${tintuc.Url}">[${tintuc.ChuDe}]
								${tintuc.TuaDe}
							</a>
						</div>
					</div>
				</div>
			</c:forEach>
			</div>
		</div>
</div>
<jsp:include page="/WEB-INF/Fragment/Footer.jsp"/>
</body>
</html>