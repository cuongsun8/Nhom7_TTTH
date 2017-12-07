$(document).ready(function() {
	$('[data-toggle="popover"]').popover();
		
	$('#submit-btn').click(function(event) {
		usernameInput = $('#username')[0];
		emailInput = $('#email')[0];
		passwordInput = $('#password')[0];
		confirmPassInput = $('#confirm-password')[0];
		
		validator.validate(usernameInput, emailInput, passwordInput, confirmPassInput);
		
		if(!validator.isValid()) {
			usernameInput.setAttribute('data-content', validator.usernameErr);
			emailInput.setAttribute('data-content', validator.emailErr);
			passwordInput.setAttribute('data-content', validator.passwordErr);
			confirmPassInput.setAttribute('data-content', validator.confirmPassErr);
			
			$('#username, #email, #password, #confirm-password').popover('show');
			
			event.preventDefault();
		}		
	});
	
	$(document).click(function(event) {
		var btn = $('#submit-btn');
		if(!btn.is(event.target)) {
			$('#username, #email, #password, #confirm-password').popover('hide');
		}
		
	});	
	
	$('.show-pass').click(function(event) {
		if(this.checked)
			{
				$('#password').prop('type', 'text');
				$('#confirm-password').prop('type', 'text');
			}
		else{
			$('#password').prop('type', 'password');
			$('#confirm-password').prop('type', 'password');
		}
	});
});

var validator = {
		usernameErr: '',
		emailErr: '',
		passwordErr: '',
		confirmPassErr: '',
		validate: function(usernameInput, emailInput, passwordInput, confirmPassInput) {
			this.usernameErr = usernameValidate(usernameInput);
			this.emailErr = emailValidate(emailInput);
			this.passwordErr = passwordValidate(passwordInput);
			this.confirmPassErr = confirmPassValidate(confirmPassInput, passwordInput.value.trim());
		},
		isValid: function() {
			return !this.usernameErr && !this.emailErr && !this.passwordErr && !this.confirmPassErr;
		}
}

function checkEmpty(input) {
	if(input.value.trim()) {
		return false;
	}
	return true;
}
function usernameValidate(input) {
	if(checkEmpty(input)) {
		return 'Vui long nhap username';
	}
	return '';
}
function emailValidate(input) {
	if(checkEmpty(input)) {
		return 'Vui long nhap email';
	}
	if(!input.checkValidity()) {
		return 'Vui long nhap email hop le';
	}
	return '';
}
function passwordValidate(input) {
	if(checkEmpty(input)) {
		return 'Vui long nhap password';
	}
	if(input.value.length < 8) {
		return 'Password toi thieu co 8 ky tu';
	}
	return '';
}
function confirmPassValidate(input, password) {
	if(checkEmpty(input)) {
		return 'Vui long xac nhan password';
	}
	if(input.value.length < 8) {
		return 'Password toi thieu co 8 ky tu';
	}
	if(input.value !== password) {
		return 'Password khong chinh xac';
	}
	return '';
}



