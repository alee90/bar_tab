console.log('wat')



$(document).ready(function(){
	function init() {
	    var input = document.getElementById('bar-name-id')
	    var opts = {
	  		types: ['establishment']
		};

	    var autocomplete = new google.maps.places.Autocomplete(input, opts);
	}

google.maps.event.addDomListener(window, 'load', init);

	// var x = function(e){
	// 	e.preventDefault();
	// 	console.log(e.target.value)
	// 	var str = $('#bar-name-id').val();
	// 	str = e.target.value
	// 	$.ajax({
	// 		url: '/yelp/search/'+str,
	// 		method: 'GET',
	// 		datatype: 'JSON'
	// 	}).done(function(cool){
	// 		console.log('!!!==== SUCCESS ====!!!')
	// 		// console.log(cool.business);
	// 	}).fail(function(){
	// 		console.log('!!!==== FAILURE ====!!!')
	// 	})
	// }

	// $('#bar-name-id').keyup(_.debounce(x, 500));

	// $('#bar-name-id').click(function(){
	// 	$.ajax({
	// 		url: '/yelp/search',
	// 		method: 'GET',
	// 		datatype: 'JSON'
	// 	}).done(function(y){
	// 		console.log(y)
	// 	}).fail(function(){
	// 		console.log('failure')
	// 	})
	// })
	// var x = $('#bar-name-id');

	// $("#bar-name-id").geocomplete();  // Option 1: Call on element.
	// // $.fn.geocomplete("#bar-name-id");

	// var autocomplete = new google.maps.places.Autocomplete(x);


	// $("#bar-name-id")
 //  	.geocomplete()
 //  		.bind("geocode:result", function(event, result){
 //   		console.log(result);
 //  });
 //  	$("#bar-name-id").geocomplete({ details: "form" });
})
;
