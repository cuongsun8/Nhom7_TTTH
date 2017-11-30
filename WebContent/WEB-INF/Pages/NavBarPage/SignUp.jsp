<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<c:if test="${not empty param.signup }">
	<sql:setDataSource var="db" 
		driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/trungtamtinhoc" user="root"
		password="123" />
	<sql:query var="result_username" dataSource="${db}">
	Select Password from accounts where UserName = '${param.username}'</sql:query>
	<sql:query var="result_email" dataSource="${db}">
	Select Password from accounts where Email = '${param.email}'</sql:query>
	
	<c:if test="${result_username.rowCount > 0}">
		<script>
			window.addEventListener("load", function () {
				$('[data-toggle="popover"]').popover();
				usernameInput = $('#username')[0];
				usernameInput.setAttribute('data-content', 'Tên người dùng đã tồn tại!');
				$('#username').val('${param.username}');
				$('#email').val('${param.email}');
				$('#password').val('${param.password}');
				$('#confirm-password').val('${param.confirm}');

				$('#username').popover('show');
				event.preventDefault();  
			}, true);
		</script>
	</c:if>
	
	<c:if test="${result_email.rowCount > 0}">
		<script>
			window.addEventListener("load", function () {
				$('[data-toggle="popover"]').popover();
				emailInput = $('#email')[0];
				emailInput.setAttribute('data-content', 'Email đã tồn tại!');
				$('#username').val('${param.username}');
				$('#email').val('${param.email}');
				$('#password').val('${param.password}');
				$('#confirm-password').val('${param.confirm}');
				
				$('#email').popover('show');
				event.preventDefault();  
			}, true);
		</script>
	</c:if>
		
	<c:if test="${result_username.rowCount == 0 and result_email.rowCount == 0}">
		<sql:update var="row-affect" dataSource="${db}">
			call sp_insert_account (?,?,?)
			<sql:param value="${ param.username}"/>
			<sql:param value="${ param.email}"/>
			<sql:param value="${ param.password}"/>
		</sql:update>
		
		<c:choose>
		    <c:when test="${updateCount le 0}">
			    <script>
			    	alert("Đăng ký không thành công");
			    </script>		        
		    </c:when>
		    <c:otherwise>	
		    	 <script>
			    	alert("Đăng ký thành công");
			    </script>    
		    </c:otherwise>
		</c:choose>
		
	</c:if>	
</c:if>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<jsp:include page="/WEB-INF/Fragment/LibImport.jsp" />
<link rel="stylesheet" href="/TrungTamTinHoc/Styles/NavBarPage/SignUp.css">
<script src="/TrungTamTinHoc/Scripts/SignUp-validate.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/Fragment/Header.jsp" />
	<div class="container-fluid bg">
		<div class="row my-auto">
			<div class="col-lg-4 col-md-3 col-sm-2 col-0"></div>			
			<div class="col-lg-4 col-md-6 col-sm-8 col-12 forms my-auto">
				<form class="form-container my-auto">
					<h1>TTTH eSky</h1>
					<div class="form-group">
						<label>Username</label> <input type="text" class="form-control"
							placeholder="Username" data-toggle="popover" data-content="" id="username" name="username">
					</div>
					<div class="form-group">
						<label>Email</label> <input type="email" class="form-control"
							placeholder="Example@gmail.com" data-toggle="popover"
							data-content="" id="email" name="email">
					</div>
					<div class="form-group">
						<label>Password</label> <input type="password"
							class="form-control" placeholder="Password" data-toggle="popover"
							data-content="" id="password" name="password">
					</div>
					<div class="form-group">
						<label>Confirm Password</label> <input type="password"
							class="form-control" placeholder="Confirm Password"
							data-toggle="popover" data-content="" id="confirm-password" name="confirm">
					</div>
					<div class="form-check">
						<label class="form-check-label"> <input type="checkbox"
							class="form-check-input show-pass"> Show pasword
						</label>
					</div>
					<br>
					<button type="submit" class="btn btn-warning btn-block" id="submit-btn" name="signup" value="Sign Up">Sign
						up</button>
					<br> <small class="form-text" style="text-align: center">Already
						a member? <a href="dang-nhap">Sign in!</a>
					</small>
				</form>
			</div>
			<div class="col-lg-4 col-md-3 col-sm-2 col-0"></div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/Fragment/Footer.jsp" />
</body>
</html>