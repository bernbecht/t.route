//init the MAP
function initialize() {
	var mapOptions = {
		center: new google.maps.LatLng(50.234602, 17.421875),
		zoom: 4
	};
	map = new google.maps.Map(document.getElementById("map"),
		mapOptions);
}

//set the heigth for content on LOAD
function setHeightForMapCitiesCanvas(){
	var map_index_height = $( window ).height() - $('.navbar').height();
	var percente = map_index_height/$( window ).height()*100;
	percente = percente+'%';
	$('.map_index_content').css('height',percente);

	var map_list_citie_height = $('.map-cities-canvas').height() - 110-10-10;
	var percente = map_list_citie_height/$('.map-cities-canvas').height()*100;
	percente = percente+'%';
	$('.map-list-cities-canvas').css('height',percente);

}

//set the heigth for content on RESIZE
function onResizeWindow(){
	$( window ).resize(function(){
		setHeightForMapCitiesCanvas();
	});
}

function autoComplete(){
	$( "#city-input" ).keyup(function(e){
		if (e.keyCode != 13) {
			var query = $("#city-input").val();
			if(query!=''){
				$.ajax({
					url: "http://localhost:3000/city/autocomplete",
					type: "GET",
					data: { query : query }
				}).done(function(data) {
					if(data == 'null'){
						$('.city-li').remove();
						$("<li class='city-li'>No city found</li>").appendTo('.autocomplete-container ul');
						$('.autocomplete-container').css('visibility','visible');

					}
					else{
						cities_json = data;
						$('.city-li').remove();
						for (var i in data){
							$("<li class='city-li'>"+data[i].name+'</li>').appendTo('.autocomplete-container ul');
						}
						$('.autocomplete-container').css('visibility','visible');

						insertCityOnCitiesList();
					}
				}).error(function(){
					
				}).complete(function(){
				});

			}
			else{
				$('.city-li').remove();
				$('.autocomplete-container').css('visibility','hidden');
			}
		}	
	});
}

//main behavior of autocomplete
function autoCompleteStandartEvents(){
	$( "#city-input" ).blur(function(e){
		$('.autocomplete-container').css('visibility','hidden');
	});
	$( "#city-input" ).focus(function(e){
		if($('.autocomplete-container ul li').length>0)
			$('.autocomplete-container').css('visibility','visible');
	});
}

function insertMarkerOnMap(lat,longit){
	var myLatlng = new google.maps.LatLng(lat,longit);	
	var marker = new google.maps.Marker({
		position: myLatlng,
		map: map
	});

	marker.setMap(map);
	return;
}

function insertCityOnCitiesList(){

	//avoid the autocomplete container desapears when clicked
	$('.city-li').hover(function(){
		$( "#city-input" ).blur(function(e){
			$('.autocomplete-container').css('visibility','visible');
		});
	});

	//the main behavior
	$('.city-li').click(function(){
		var city_name = $(this).html();
		$.each(cities_json, function(i, v) {
			if (v.name == city_name ) {
				$('<li><div><img alt="'+v.country+'" class="city-flag" src="/assets/flags/'+v.country+'.png"><div class="city-name">'+city_name+'</div><div class="city-delete"><span class="glyphicon glyphicon-remove-sign"></span></div><div class="city-date"><span class="glyphicon glyphicon-calendar"></span><input class="city-date-input" type="text" placeholder="When?"/></span></div><div class="clearfix"></div></div></li>').appendTo('.map-list-cities-canvas ul');
				insertMarkerOnMap(v.latitude,v.longitude);
			}
		});
		$('.city-li').remove();
		$('.autocomplete-container').css('visibility','hidden');
		$('#city-input').val('');
		$('#city-input').attr('placeholder', "Which city do you want to go?");

		autoCompleteStandartEvents();
		removeCityOnCitiesList();
		insertDateCity();
	});

	//come back to autocomplete standart behavior
	$('.city-li').mouseleave(function() {
		autoCompleteStandartEvents();
	});
}

function removeCityOnCitiesList(){
	$('.city-delete').click(function(){
		$(this).parent().parent().remove();

		if($('.map-list-cities li').length==0)
			$('#city-input').attr('placeholder', "Where are you?");
	});
}

function insertDateCity(){
	$('.city-date-input').datepicker();
}

function searchTickets(){
	$('#search-tickets-btn').click(function(){
		// alert('oi');
		$('.map-list-cities li').each(function(index){
			alert($('.city-name',$(this)).html());
			alert($('.city-country',$(this)).val());
			alert($('.city-date-input',$(this)).val());

		});
	});
}

$(document).ready(function(){
	initialize();
	setHeightForMapCitiesCanvas();
	onResizeWindow();
	autoCompleteStandartEvents();
	autoComplete();
	removeCityOnCitiesList();
	insertDateCity();
	searchTickets();

});