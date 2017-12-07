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

	$("#image").change(function() {
		 readURL(this);
		 if(this.value != "")
		 $('#image-name').text(this.value.replace(/C:\\fakepath\\/i, ''))
	});
	
	$('#btn-select-image').click(function(){		
		   $("input[type='file']").trigger('click');	
		   $('.popover').remove();
		   event.preventDefault();
		   
	});
	
	
	$('[data-toggle="popover"]').popover();
	var flag = true;
	$(document).on('click', '.btnSave', function(event) {
		subjectInput = $('#subject')[0];
		titleInput = $('#title')[0];
		urlInput = $('#url')[0];
		imageInput = $('#image')[0];
		
		validator.validate(subjectInput, titleInput, urlInput, imageInput);
		flag = validator.isValid();
		if(!validator.isValid()) {
			urlInput.setAttribute('data-content', '');
			
			subjectInput.setAttribute('data-content', validator.subjecErr);
			titleInput.setAttribute('data-content', validator.titleErr);
			urlInput.setAttribute('data-content', validator.urlErr);
			$('#btn-select-image').attr('data-content', validator.imageErr);
			
			event.preventDefault();
		}		
	});
	$(document).click(function(event) {
		var btn = $('.btnSave');
		if(btn.is(event.target) && !flag) {
			$('#subject, #title, #url, #btn-select-image').popover('show');
		}
		else{
			$('#subject, #title, #url, #btn-select-image').popover('hide');
		}
	});
});
var validator = {
		subjecErr: '',
		titleErr: '',
		urlErr: '',
		imageErr: '',
		validate: function(subjectInput, titleInput, passwordInput, confirmPassInput) {
			this.subjecErr = subjectValidate(subjectInput);
			this.titleErr = titleValidate(titleInput);
			this.urlErr = urlValidate(urlInput);
			this.imageErr = imageValidate(imageInput);
		},
		isValid: function() {
			return !this.subjecErr && !this.titleErr && !this.urlErr && !this.imageErr;
		}
}

function checkEmpty(input) {
	if(input.value.trim()) {
		return false;
	}
	return true;
}
function subjectValidate(input) {
	if(checkEmpty(input)) {
		return 'Vui lòng nhập chủ đề';
	}
	return '';
}
function titleValidate(input) {
	if(checkEmpty(input)) {
		return 'Vui lòng nhập tiêu đề';
	}
	return '';
}
function urlValidate(input) {
	if(checkEmpty(input)) {
		return 'Vui lòng nhập đường dẫn';
	}
	if(input.value.indexOf(' ') != -1)
		return 'Cấu trúc đường dẫn hợp lệ: duong-dan-example)';
	return '';
}
function imageValidate(input, password) {
	if(input.files.length == 0) {
		return 'Vui lòng chọn hình ảnh';
	}
	return '';
}