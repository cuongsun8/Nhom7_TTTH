<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<c:if test="${not empty param.login }">
	<sql:setDataSource var="db" 
		driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/trungtamtinhoc" user="root"
		password="123" />
	<sql:query var="result" dataSource="${db}">
	Select Password from accounts where UserName = '${param.username}' or Email = '${param.username}'</sql:query>
	<c:choose>
		<c:when test="${result.rowCount == 0}">
			<script>
				window.addEventListener("load", function () {
					$('[data-toggle="popover"]').popover();
					usernameInput = $('#username')[0];
					usernameInput.setAttribute('data-content', 'Tên người dùng hoặc email không tồn tại!');
					$('#username').val('${param.username}');
					$('#password').val('${param.password}');
					console.log('${param.username}');
					$('#username').popover('show');
					event.preventDefault();  
				}, true);
			</script>
		</c:when>
		
		<c:when test="${result.rowCount > 0}">
			<c:forEach items="${result.rows}" var="row">
				<c:if test="${param['password'] != row.Password }">
					<script type="text/JavaScript">					
	       				window.addEventListener("load", function () {
	       					$('[data-toggle="popover"]').popover();
							passwordInput = $('#password')[0];
							passwordInput.setAttribute('data-content', 'Mật khẩu nhập vào chưa đúng!');	
							$('#username').val('${param.username}');
							$('#password').val('${param.password}');							
							$('#password').popover('show');
							
							event.preventDefault();  
	        			}, true);
					</script>
				</c:if>
				<c:if test="${param['password'] == row.Password}">
					<c:set var="user" value="${param.username }" scope="session"></c:set>
					<c:redirect url="/Home-page"/>
				</c:if>
			</c:forEach>
		</c:when>	
	</c:choose>
</c:if>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Đăng nhập</title>
<jsp:include page="/WEB-INF/Fragment/LibImport.jsp" />
<link rel="stylesheet" href="/TrungTamTinHoc/Styles/NavBarPage/SignIn.css">
<script src="/TrungTamTinHoc/Scripts/SignIn-Validate.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/Fragment/Header.jsp"/>
	<div class="container-fluid bg">
		<div class="row">
			<div class="col-lg-4 col-md-3 col-sm-2 col-12"></div>
			<div class="col-lg-4 col-md-6 col-sm-8 col-12 my-auto">
				<form class="form-container my-auto">
					<h1>TTTH eSky</h1>
					<div class="form-group">
						<label>Username or email</label> 
						<input type="text" class="form-control" placeholder="User name or email"
						data-toggle="popover" data-content="" id="username" name="username">
						<small class="form-text">We'll never share your email with anyone else. </small>
					</div>
					<div class="form-group">
						<label>Password</label>
						<input type="password" class="form-control" placeholder="Password"
						data-toggle="popover" data-content="" id="password" name="password">
					</div>
					<div class="form-check">
						<label class="form-check-label"> <input type="checkbox"
							class="form-check-input"> Remember me
						</label>
					</div>
					<br>
					<button type="submit" class="btn btn-success btn-block" id="submit-btn" name="login" value="Sign In">Sign In</button>
					<br>
					<small class="form-text" style="text-align:center">Don't have an account? <a href="dang-ky">Sign up now!</a></small>					 
				</form>
			</div>
			<div class="col-lg-4 col-md-3 col-sm-2 col-12"></div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/Fragment/Footer.jsp" />
</body>
</html>