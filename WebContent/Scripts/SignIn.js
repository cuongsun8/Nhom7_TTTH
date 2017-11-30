$(document).ready(function() {
	
	$('[data-toggle="popover"]').popover();
	
	$('#submit-btn').click(function(event) {
		usernameInput = $('#username')[0];
		passwordInput = $('#password')[0];
		var username = 'sky';
		var password = '123';
		if(usernameInput.value.trim() != username){
			usernameInput.setAttribute('data-content', 'Ten nguoi dung hoac e-mail khong ton tai');
			$('#username').popover('show');
			event.preventDefault();
		}
		else{
			if(passwordInput.value.trim() != password){
				passwordInput.setAttribute('data-content', 'Mat khau khong dung');
				$('#password').popover('show');
				event.preventDefault();
			}
			else{
				window.location.href = "http://localhost:8080/TrungTamTinHoc/Home-page";
				return false;
			}
		}
		
	});
});