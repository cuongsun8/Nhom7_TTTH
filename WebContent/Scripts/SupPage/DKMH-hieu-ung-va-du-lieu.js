$(document).ready(function(){
	
	TimeCounter();
	
	var color = ["#706D3C", "#E65527", "#37A5B3", "#363948", "#716F84", "#D5BC3A", "#5EA07F", "#86B3BB", "#CA58D2", "#A31AFF"];
	
	$.ajax({
		url: "/TrungTamTinHoc/json/chon-CTDT",		
		success: function(data) {
				var array = data.CTDT;
				console.log(array);
				$.each(array, function(i, item){
					var div = $('<div>').appendTo('.myRadio');
					div.addClass("cthoc");								
					
					var label = $('<label>').appendTo(div);
					label.addClass("chuongtrinh");
					
					var span = $('<span>').appendTo(label);
					span.addClass("btnCTDT");	
					span.attr("id", array[i].MaCTDT);
					span.text(array[i].TenCTDT);
					span.css("background-color", color[i]);
				});								
		}
	});
	
	if($(window).width() <= 1228){
    	$('#dang-ky-banner').height($('#chuongtrinhhoc').css("height"));
	}
	else{
		$('#dang-ky-banner').height(441);
	}
	
	window.onresize = function(event) {
		if($(window).width() <= 1228){
	    	$('#dang-ky-banner').height($('#chuongtrinhhoc').css("height"));
		}
		else{
			$('#dang-ky-banner').height(441);
		}
	};
});
function TimeCounter(){
	var bg = document.getElementById("myCanvas");		
	var ctx = bg.getContext("2d");
	var dayRemaining = 15;
	var allTime = 21;
	
	ctx.beginPath();
	ctx.arc(70, 75, 45, 0, 2*Math.PI);
	ctx.strokeStyle = 'grey';
	ctx.shadowOffsetX = 0;
	ctx.shadowOffsetY = 0;
	ctx.lineWidth = 5;
	ctx.stroke();
	
	ctx.beginPath();
	ctx.arc(70, 75, 45, ((allTime - dayRemaining)/allTime - 0.5)*Math.PI, 1.5*Math.PI);
	ctx.strokeStyle = 'white';
	ctx.shadowOffsetX = 0;
	ctx.shadowOffsetY = 0;
	ctx.lineWidth = 5;
	ctx.stroke();
};
$(document).on("click", '.btnCTDT', function(event){	
	$('#cboMonHoc optgroup').remove();
	$.ajax({
		url: "/TrungTamTinHoc/json/chon-mon?id=" + $(this).attr('id'),
		success: function(data) {
				var array = data.CTDT;
				console.log(array);
				$.each(array, function(i, item){
					var optgroup = $('<optgroup>').appendTo('#cboMonHoc');
					optgroup.attr("label", array[i].TenMH);
					optgroup.css('background-color', 'lightblue');
					var opt = $('<option>').text(array[i].TenMH).appendTo(optgroup);
					opt.css('background-color', 'white');
					opt.attr('id', array[i].MaMH);
				});									
		}
	});
	
	$('#chon-mon').show();	
	$('.thong-tin-hoc-vien').show();
    $('html, body').animate({
        scrollTop: $('#chon-mon').offset().top
    }, 1000);
    $('.btnCTDT').removeClass("active");
    $(this).addClass("active");		    
});	
	
	
$(document).on("click", '.chkLick', function(){
	$('.lich-check').removeClass('lich-check');			
	$(this).parent().parent().addClass('lich-check');
	
	$('.fa-check-square-o').removeClass('fa-check-square-o').addClass('fa-square-o');
	$(this).parent().parent().children().children('.fa-square-o').removeClass('fa-square-o').addClass('fa-check-square-o');
});
function displayChonLich(){
	$('.tkb div').remove();
	$.ajax({
		url: "/TrungTamTinHoc/json/chon-lich?id=" + $("#cboMonHoc option:selected").attr('id'),		
		success: function(data) {
				var array = data.LichHoc;
				console.log(array);
				$.each(array, function(i, item){
					var div = $('<div>').appendTo('.tkb');
					div.addClass("col-sm-6 col-12 lblLich mb-4");
					div.attr('id', array[i].MaLichHoc);
					
					var label = $('<label>').appendTo(div);
					
					
					var input= $('<input>').appendTo(label);
					input.attr("type", "radio");
					input.addClass("chkLick");					
					
					var span = $('<span>').appendTo(label);
					span.addClass("fa fa-square-o");					
					span.css("font-size", "18px");
					span.css("width", "20px");
					
					label.append(array[i].ThoiGian);
					$('<br>').appendTo(label);
					
					var subDiv = $('<div>').appendTo(div);
					var subDiv2 = $('<div>').appendTo(subDiv);
					subDiv2.text(array[i].DiaDiem);
					subDiv2.addClass("chkLick");
				});									
		}
	});
	
	$('#chon-lich').show();	
	
    $('html, body').animate({
        scrollTop: $('#chon-lich').offset().top
    }, 1000);
};