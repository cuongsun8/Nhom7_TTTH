$(document).ready(function() {
	$('[data-toggle="popover"]').popover();
	
	$('.hoantat').click(function(event) {
		$('#hoten, #email, #dienthoai, #doituong, #ghichu').popover('hide');
		
		hotenInput = $('#hoten')[0];
		emailInput = $('#email')[0];
		sdtInput= $('#dienthoai')[0];
		noteInput = $('#ghichu')[0];
		
		validator.validate(hotenInput, emailInput, sdtInput, noteInput);
		if(!validator.isValid()) {
			hotenInput.setAttribute('data-content', validator.hotenErr);
			emailInput.setAttribute('data-content', validator.emailErr);
			sdtInput.setAttribute('data-content', validator.sdtErr);
			noteInput.setAttribute('data-content', validator.noteErr);
			$('#hoten, #email, #dienthoai, #ghichu').popover('show');
			event.preventDefault();
		}else{
			var flag = true;
			
			var s = $('#doituong')[0].selectedIndex;
			if($('#doituong')[0].selectedIndex == 0){
				$('#doituong')[0].setAttribute('data-content', 'Bạn chưa chọn đối tượng');
				$('#cboMonHoc').popover('show');
				flag = false;
			}
			else{
				$('#doituong')[0].setAttribute('data-content', '');		
			}
			
			if($('#cboMonHoc')[0].selectedIndex == 0){
				$('#cboMonHoc')[0].setAttribute('data-content', 'Bạn chưa chọn môn học');
				$('#doituong').popover('show');
				flag = false;
			}
			else{
				$('#cboMonHoc')[0].setAttribute('data-content', '');		
			}
			
			if(!$('.lblLich').hasClass('lich-check')){
				alert("Bạn chưa chon lịch học!");
				flag = false;
				event.preventDefault();
			};
			if(flag){
				$('#doituong2').val($('#doituong :selected').text());
				$('#maMH').val($('#cboMonHoc :selected').attr('id'));
				$('#maLichHoc').val($('.lich-check').attr('id'));
				$('#DKMH').submit();
			}
		}
		
	});
	
	$(document).click(function(event) {
		var btn = $('.hoantat');
		if(!btn.is(event.target)) {
			$('#hoten, #email, #dienthoai, #doituong, #ghichu, #cboMonHoc').popover('hide');
		}
		
	});	
});

var validator = {
		hotenErr: '',
		emailErr: '',
		sdtErr: '',
		noteErr: '',
		validate: function(hotenInput, emailInput, sdtInput, noteInput) {
			this.hotenErr = hotenValidate(hotenInput);
			this.emailErr = emailValidate(emailInput);
			this.sdtErr = sdtValidate(sdtInput);
			this.noteErr = noteValidate(noteInput);
		},
		isValid: function() {
			return !this.hotenErr && !this.emailErr && !this.sdtErr && !this.noteErr;
		}
}

function checkEmpty(input) {
	if(input.value.trim()) {
		return false;
	}
	return true;
}
function hotenValidate(input) {
	if(checkEmpty(input)) {
		return 'Vui lòng nhập họ và tên';
	}
	return '';
}
function emailValidate(input) {
	if(checkEmpty(input)) {
		return 'Vui lòng nhập email';
	}
	if(!input.checkValidity()) {
		return 'Vui lòng nhập email hợp lệ';
	}
	return '';
}
function sdtValidate(input) {
	if(checkEmpty(input)) {
		return 'Vui lòng nhập số điện thoại';
	}
	if(input.value.length < 9) {
		return 'Số điện thoại không hợp lệ (9-11 chữ số)';
	}
	if(isNaN(input.value))
		return ('Số điện thoại chỉ bao gồm chữ số');
	return '';
}
function noteValidate(input) {
	if(input.value.length > 400) {
		return 'Ghi chú không được quá 400 kí tự';
	}
	return '';
}