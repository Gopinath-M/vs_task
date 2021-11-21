// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
import 'bootstrap'
import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import jquery from "jquery";
global.$ = jQuery;

require("bootstrap");
require("jquery");
require("channels");
// require("bootstrap-sprockets")



Rails.start()
Turbolinks.start()
ActiveStorage.start()


$(document).ready(function() {
	$(document).on('click','.take_case',function(){
		var case_id = $(this).data("case");
		// var url = $(this).data("url");
		// $.ajax({
		// 	url: url,
		// 	type: 'post',
		// 	dataType: 'script',
		// 	data: {case_id: case_id}
		// })
		$('#case_id').val(case_id);
		// $('#caseModal').modal('show');
	});
	$(document).on('click','.make_assitant',function(){
		var advocate_id = $(this).data("advocate");
		var url = $(this).data("url");
		$.ajax({
			url: url,
			type: 'post',
			dataType: 'script',
			data: {advocate_id: advocate_id}
		})
	});
	$(document).on('click','.remove_assitant',function(){
		var advocate_id = $(this).data("advocate");
		var url = $(this).data("url");
		$.ajax({
			url: url,
			type: 'post',
			dataType: 'script',
			data: {advocate_id: advocate_id}
		})
	});
	$(document).on('click','.nav-link',function(){
		$('ul.navbar-nav li').removeClass('active');
		$(this).parent().addClass('active');
	})

	$(document).on('change','.new_case_state',function(){
		var state_id = $(this).val();
		var url = $(this).data('url');
		$.ajax({
			url: url,
			type: "get",
			dataType: "script",
			data: {state_id: state_id}
		})
	})

	$(document).on('click','.reject_case',function(){
		var case_id = $(this).data('case');
		var url = $(this).data('url');
		$.ajax({
			url: url,
			type: "post",
			dataType: "script",
			data: {case_id: case_id}
		})
	})

	$(document).on('click','.close_case',function(){
		var case_id = $(this).data('case');
		var url = $(this).data('url');
		$.ajax({
			url: url,
			type: "post",
			dataType: "script",
			data: {case_id: case_id}
		})
	})
})