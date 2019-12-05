(function() {
	'use strict';
	renderCountries();

	// Валидация формы
	window.addEventListener('load', function() {
		var forms = document.getElementsByClassName('needs-validation');
		var validation = Array.prototype.filter.call(forms, function(form) {
			$("#country_send_ajax_btn").attr("disabled", false);
			form.addEventListener('submit', function(event) {
			form.classList.remove('was-validated');
			event.preventDefault();
			event.stopPropagation();
			if (form.checkValidity()) { 
				sendCountryForm();
			}
			else		
				form.classList.add('was-validated');
			}, false);
		});
	}, false);

	// Ввод в поле "Площадь страны" только цифр
	$('#country_area').on('input', function() {
		var area = $(this).val();
		area = area.replace(/[^0-9]/g, '');
		$(this).val(area);
	});

	// Прокрутка вниз при открытии формы
	$("#show_add_country_btn").click(function(){
		$("html, body").animate({scrollTop: $(document).height()}, "slow");
	});
})();

// jQuery Grid
function renderCountriesGrid(response) {
	var data = JSON.parse(response);

	var source = {
		localdata: data,
		datafields: [
			{ name: 'name', type: 'string' },
			{ name: 'capital_name', type: 'string' },
			{ name: 'area', type: 'number' },
			{ name: 'region_name', type: 'string' }
		],
		datatype: "array"
	};
	var dataAdapter = new $.jqx.dataAdapter(source);
	$("#grid").jqxGrid({
		width: '100%',
		source: dataAdapter,
		sortable: true,
		pageable: true,
		autoheight: true,
		theme: 'bootstrap',
		ready: function () {
			$("#grid").jqxGrid('sortby', 'name', 'asc');
		},
		columns: [
			{ text: 'Страна', datafield: 'name', width: '25%' },
			{ text: 'Столица', datafield: 'capital_name', width: '25%' },
			{ text: 'Площадь', datafield: 'area', width: '25%', cellsalign: 'right', cellsformat: 'n' },
			{ text: 'Регион', datafield: 'region_name', width: '25%' }
		]
	});
}

// AJAX Получение и отображение данных из БД
function renderCountries() {
	$.ajax({
		url: "get_countries_ajax.php",
		method: "get",
		type: "json",
		success: function(response) {
			renderCountriesGrid(response)       
		},
		error: function(response) {
			alert('Ошибка. Данные не получены.');
		}
	});
}

// AJAX Отправка данных в БД
function sendCountryForm() {
	$.ajax({
		url: "send_country_form_ajax.php",
		type: "post",
		dataType: "html",
		data: $("#country_send_ajax_form").serialize(),
		success: function(response) {
			renderCountries();
			document.getElementById("country_send_ajax_form").reset();
		},
		error: function(response) {
			alert('Ошибка. Данные не отправлены.');
		}
	});
}
