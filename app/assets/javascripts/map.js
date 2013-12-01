function initialize() {
	// alert('ini');
	var mapOptions = {
		center: new google.maps.LatLng(-34.397, 150.644),
		zoom: 8
	};
	map = new google.maps.Map(document.getElementById("map"),
		mapOptions);
}

function setMapIndexContentHeight(){
	var map_index_height = $( window ).height() - $('.navbar').height();
	var percente = map_index_height/$( window ).height()*100;
	percente = percente+'%';
	$('.map_index_content').css('height',percente);

	var map_list_citie_height = $('.map-cities-canvas').height() - 110-10-10;
	// alert(map_list_citie_height);
	var percente = map_list_citie_height/$('.map-cities-canvas').height()*100;
	percente = percente+'%';
	// alert(percente);
	$('.map-list-cities-canvas').css('height',percente);

}

function onResizeWindow(){
	$( window ).resize(function(){
		setMapIndexContentHeight();
	});
}

$(document).ready(function(){
	initialize();
	setMapIndexContentHeight();
	onResizeWindow();
});