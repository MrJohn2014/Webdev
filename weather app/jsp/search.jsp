<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Show Weather</title>
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<!--<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>-->
<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.0.js"></script>
<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>
<style style="text/css">
body{
    background-image:url(https://static.pexels.com/photos/401640/pexels-photo-401640.jpeg);
    background-position:60% 60%;
    background-repeat:no-repeat;
    background-size:cover;
}

#mybutton
{
    height:40px;
    width:38px;
    margin-left:-10px;
    cursor: pointer;
}

.sunmoon{
    position:relative;
}

.sun-times{
     margin-top:40px;
     width:230px;
     height:60px;
     border-bottom:1px solid #999;
     overflow-y:hidden;
}

.sun-path{
        margin-left: 25px;
        width: 170px;
        height: 170px;
        overflow: hidden;
        border: 1px dashed #999;
        border-radius: 50%;
}

.sun-symbol-path{
        position:absolute;
        color:yellow;
        text-shadow:0 0 5px black;
        height:85px;
        -webkit-transition: -webkit-transform 2s linear;
        -webkit-transform-origin:50% 100%;
        -webkit-transform:rotateZ(-75deg);
        left:110px;
        bottom:0;
}

.symbol{
        position:relative;
        font-size: 18px;
        top:-11px;
}

.sun-animation{
        width:0px;
        height:150px;
        background-color:rgba(255,255,0,0.4);
        -webkit-transition:width 2s linear;
        transition:width 2s linear;
}

.astronomy{
     position: absoulute;
     bottom:1em;
     
}

.astronomy > div{
     position:absolute;
     font-size:12px;
     width:80px;
}
       
.sunrise{
     left:15px;
}

.sunset{
     left:185px;
}


</style>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=3ycSEDi2zMrDQgSlYInYvyFHH21varMm"></script>
</head>
<body>
<div id="city" style="font-size:25px;margin-left:10px;"></div><br>
<div id="country" style="margin-left:10px;"></div><br>
<div id="date" style="margin-left:10px;"></div><br><br>
<div id="condition" style="margin-left:10px;"></div><img id="image1" src="?" style="margin-left:10px;"/><br><br>
<div class="row">
	<div class="col-xs-1" id="temperature" style="font-size:32px;margin-left:10px;"></div>
	<!--<span class="col-xs-1" style="font-size:28px">°</span>-->
	<div class="col-xs-2" style="position:absolute; margin-left:85px;">
	    <!--<button id="fbutton" style="height:24px;width:30px;" disabled>F</button>-->
	    <button id="mybutton" class="btn btn-default" type="button" onclick="display()">F</button>
	</div>
</div><br><br>
<div class="container-fluid">
     <div class="row">
     	<div class="col-md-4" style="border-style:groove;margin-left:10px;background-color:rgba(0,0,0,.54);color:white;">
     	    <h4 style="border-style:none none solid none; border-width:1.5px;">Forecast</h4>
     	    <div class="row">
	     		<div id="day1" class="col-md-2"></div>
	     		<div id="condition1" class="col-md-5"></div>
	     		<div id="high1" class="col-md-2"></div>
	     		<div id="low1" class="col-sm-2"></div>
	     	</div>
	     	<div class="row" style="border-style:dotted none none none; border-width:0.5px">
	     	     <div id="day2" class="col-md-2"></div>
	     		 <div id="condition2" class="col-md-5"></div>
	     		 <div id="high2" class="col-md-2"></div>
	     		 <div id="low2" class="col-sm-2"></div>
	     	</div>
	     	<div class="row" style="border-style:dotted none none none; border-width:0.5px;">
	     	     <div id="day3" class="col-md-2"></div>
	     		 <div id="condition3" class="col-md-5"></div>
	     		 <div id="high3" class="col-md-2"></div>
	     		 <div id="low3" class="col-sm-2"></div>
	     	</div>
	     	<div class="row" style="border-style:dotted none none none; border-width:0.5px;">
	     	     <div id="day4" class="col-md-2"></div>
	     		 <div id="condition4" class="col-md-5"></div>
	     		 <div id="high4" class="col-md-2"></div>
	     		 <div id="low4" class="col-sm-2"></div>
	     	</div>
	     	<div class="row" style="border-style:dotted none none none; border-width:0.5px;">
	     	     <div id="day5" class="col-md-2"></div>
	     		 <div id="condition5" class="col-md-5"></div>
	     		 <div id="high5" class="col-md-2"></div>
	     		 <div id="low5" class="col-sm-2"></div>
	     	</div>
	     	<div class="row" style="border-style:dotted none none none; border-width:0.5px;">
	     	     <div id="day6" class="col-md-2"></div>
	     		 <div id="condition6" class="col-md-5"></div>
	     		 <div id="high6" class="col-md-2"></div>
	     		 <div id="low6" class="col-sm-2"></div>
	     	</div>
	     	<div class="row" style="border-style:dotted none none none; border-width:0.5px;">
	     	     <div id="day7" class="col-md-2"></div>
	     		 <div id="condition7" class="col-md-5"></div>
	     		 <div id="high7" class="col-md-2"></div>
	     		 <div id="low7" class="col-sm-2"></div>
	     	</div>
     	</div>&nbsp;
     	<div class="col-md-3" style="border-style:groove; margin-left:10px;height:120px;background-color:rgba(0,0,0,.54);color:white;">
     	   <h4 style="border-style:none none solid none; border-width:1.5px;">Details</h4>
     	   <img id="image2" src="?"/>
     	   <!--<div style="width:100%;">-->
	     	   <ul style="list-style-type:none">
	     	   <li id="humidity" style="margin-left:30%;margin-top:-60px;width:50%"></li>
	     	   <li id="visibility" style="margin-left:30%;margin-top:5px;border-style:dotted none none none; border-width:0.5px;"></li>
     	   	   </ul>
     	   <!--</div>-->
     	</div>&nbsp;
	    <div class="col-md-4 sunmoon" style="border-style:groove;margin-left:10px;background-color:rgba(0,0,0,.54);color:white;">
	    	     <h4 style="border-style:none none solid none; border-width:1.5px;">Sun &amp; Moon</h4>
	    	     <div class="sun-times">
	    	          <div class="sun-path">
	    	              <div class="sun-animation">
	    	              </div>
	    	          </div>
	    	          <div class="sun-symbol-path"><span class="symbol">☀</span></div>
	    	     </div>
	    	     <div class="astronomy">
	    	          <div id="sunrise" class="sunrise"></div>
	    	          <div id="sunset" class="sunset"></div>
	    	     </div>
	    	     <div class="clear">&nbsp;</div>
	    </div>
     </div>&nbsp;
     <div class="row">
	     <div id="mapcontainer" class="col-md-4" style="border-style:groove;margin-left:10px;background-color:rgba(0,0,0,.54);color:white;">
	     	    <h4 style="border-style:none none solid none; border-width:1.5px;">Map</h4>
	     	    <div id="map" style="width:100%;height:210px;border:1px solid gray;"></div>
	     </div>
     </div>
</div><br>
<div id="test"></div>
<script>
    var callbackFunction = function(data) {
    //get city
    var city = data.query.results.channel.location.city;
    document.getElementById("city").innerHTML=city;
    //get country
    var country = data.query.results.channel.location.country;
    document.getElementById("country").innerHTML=country; 
    
    //get date
    /*var date= new Date();
    if(date.getHours()>=0&&date.getHours()<12&&date.getMinutes<10){
    document.getElementById("date").innerHTML= date.getMonth()+1+"/"+date.getDate()+","+" "+date.getHours()+":"+"0"+date.getMinutes()+" "+"AM";
    }
    else if(date.getHours()>=0&&date.getHours()<12&&date.getMinutes>=10){
         document.getElementById("date").innerHTML= date.getMonth()+1+"/"+date.getDate()+","+" "+date.getHours()+":"+date.getMinutes()+" "+"AM";
        }
    else if(date.getHours()>=12&&date.getMinutes<10){
        document.getElementById("date").innerHTML= date.getMonth()+1+"/"+date.getDate()+","+" "+date.getHours()+":"+"0"+date.getMinutes()+" "+"PM";
        }
    else{
    	document.getElementById("date").innerHTML= date.getMonth()+1+"/"+date.getDate()+","+" "+date.getHours()+":"+date.getMinutes()+" "+"PM";
    }*/
    var date = data.query.results.channel.lastBuildDate;
    date = date.substring(5,16)+", "+date.substring(17,25);
    document.getElementById("date").innerHTML = date;
    
    //get condition
	var condition = data.query.results.channel.item.condition.text;
    document.getElementById("condition").innerHTML=condition;
    
    //get temperature
    var temperature = data.query.results.channel.item.condition.temp;
    temperature = temperature+'°';
    document.getElementById("temperature").innerHTML=temperature;
    
    //get forecast
    var day1 = data.query.results.channel.item.forecast[0].day;
    var condition1 = data.query.results.channel.item.forecast[0].text;
    var high1 = data.query.results.channel.item.forecast[0].high;
    high1 = high1 + "°";
    var low1 = data.query.results.channel.item.forecast[0].low;
    low1 = low1 + "°";
    //var forecast1 = day1+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+condition1;
    //document.getElementById("forecast1").innerHTML=forecast1;
    document.getElementById("day1").innerHTML=day1;
    document.getElementById("condition1").innerHTML=condition1;
    document.getElementById("high1").innerHTML=high1;
    document.getElementById("low1").innerHTML=low1;
    
    var day2 = data.query.results.channel.item.forecast[1].day;
    var condition2 = data.query.results.channel.item.forecast[1].text;
    var high2 = data.query.results.channel.item.forecast[1].high;
    high2 = high2 + "°";
    var low2 = data.query.results.channel.item.forecast[1].low;
    low2 = low2 + "°";
    document.getElementById("day2").innerHTML=day2;
    document.getElementById("condition2").innerHTML=condition2;
    document.getElementById("high2").innerHTML=high2;
    document.getElementById("low2").innerHTML=low2;
    
    var day3 = data.query.results.channel.item.forecast[2].day;
    var condition3 = data.query.results.channel.item.forecast[2].text;
    var high3 = data.query.results.channel.item.forecast[2].high;
    high3 = high3 + "°";
    var low3 = data.query.results.channel.item.forecast[2].low;
    low3 = low3 + "°";
    document.getElementById("day3").innerHTML=day3;
    document.getElementById("condition3").innerHTML=condition3;
    document.getElementById("high3").innerHTML=high3;
    document.getElementById("low3").innerHTML=low3;
    
    var day4 = data.query.results.channel.item.forecast[3].day;
    var condition4 = data.query.results.channel.item.forecast[3].text;
    var high4 = data.query.results.channel.item.forecast[3].high;
    high4 = high4 + "°";
    var low4 = data.query.results.channel.item.forecast[3].low;
    low4 = low4 + "°";
    document.getElementById("day4").innerHTML=day4;
    document.getElementById("condition4").innerHTML=condition4;
    document.getElementById("high4").innerHTML=high4;
    document.getElementById("low4").innerHTML=low4;
    
    var day5 = data.query.results.channel.item.forecast[4].day;
    var condition5 = data.query.results.channel.item.forecast[4].text;
    var high5 = data.query.results.channel.item.forecast[4].high;
    high5 = high5 + "°";
    var low5 = data.query.results.channel.item.forecast[4].low;
    low5 = low5 + "°";
    document.getElementById("day5").innerHTML=day5;
    document.getElementById("condition5").innerHTML=condition5;
    document.getElementById("high5").innerHTML=high5;
    document.getElementById("low5").innerHTML=low5;
    
    var day6 = data.query.results.channel.item.forecast[5].day;
    var condition6 = data.query.results.channel.item.forecast[5].text;
    var high6 = data.query.results.channel.item.forecast[5].high;
    high6 = high6 + "°";
    var low6 = data.query.results.channel.item.forecast[5].low;
    low6 = low6 + "°";
    document.getElementById("day6").innerHTML=day6;
    document.getElementById("condition6").innerHTML=condition6;
    document.getElementById("high6").innerHTML=high6;
    document.getElementById("low6").innerHTML=low6;
    
    var day7 = data.query.results.channel.item.forecast[6].day;
    var condition7 = data.query.results.channel.item.forecast[6].text;
    var high7 = data.query.results.channel.item.forecast[6].high;
    high7 = high7 + "°";
    var low7 = data.query.results.channel.item.forecast[6].low;
    low7 = low7 + "°";
    document.getElementById("day7").innerHTML=day7;
    document.getElementById("condition7").innerHTML=condition7;
    document.getElementById("high7").innerHTML=high7;
    document.getElementById("low7").innerHTML=low7;
    
    //get humidity
    var humidity = data.query.results.channel.atmosphere.humidity;
    humidity = "Humidity:"+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+humidity+"%";
    document.getElementById("humidity").innerHTML=humidity;
    
    //get visibility
    var visibility =data.query.results.channel.atmosphere.visibility;
    visibility = "Visibility:"+"&nbsp;&nbsp;"+visibility+" miles";
    document.getElementById("visibility").innerHTML=visibility;
    
    //get sunrise and sunset
    var sunrise = data.query.results.channel.astronomy.sunrise;
    document.getElementById("sunrise").innerHTML=sunrise;
    var sunset = data.query.results.channel.astronomy.sunset;
    document.getElementById("sunset").innerHTML=sunset;
    
    //sunset and sunrise controller
	var percent = 50+"%";
    var deg;
	var interval,difference;
	var sunRise = document.getElementById('sunrise').innerHTML;
	var rise_lpart = Number(sunRise.slice(0,1));
	var rise_rpart = Number(sunRise.slice(2,4));
	var sunSet = document.getElementById('sunset').innerHTML; 
	var set_lpart = Number(sunSet.slice(0,1))+12;
	var set_rpart = Number(sunSet.slice(2,4));
    var rise_mins = rise_lpart*60+rise_rpart;
    var set_mins = set_lpart*60+set_rpart;
    interval = set_mins-rise_mins;
    var current = document.getElementById('date').innerHTML;
    var cur_lpart,cur_rpart,cur_mins;
    cur_lpart = Number(current.slice(13,15));
    cur_rpart = Number(current.slice(16,18));
    var check =current.slice(19,21);
    //check whether AM or PM
    if(check == "AM" || cur_lpart==12)
      {
    	if(cur_lpart < rise_lpart)
    	{
    		percent = 0;
    		deg = -75;
    	}
    	else if(cur_lpart == rise_lpart &&cur_rpart < rise_rpart)
    	{
    		percent = 0;
    		deg = -75;
    	}
    	else
    	{
	    	cur_mins = cur_lpart*60+cur_rpart; 
	    	difference = cur_mins-rise_mins;
	    	percent = (difference/interval)*100;
	    	deg = (percent/100)*150-75;
	    	percent = percent+'%';
    	}
      }
    else
    	{
    	  if(cur_lpart > Number(sunSet.slice(0,1)))
    		{
    		  percent = 100+'%';
    		  deg = 75;
    		}
    	  else if(cur_lpart == Number(sunSet.slice(0,1)) && cur_rpart > Number(sunSet.slice(2,4)))
    		 {
    		   percent = 100+'%'
    		   deg = 75;
    		 }
    	  else
    		 {
    		   cur_mins = (cur_lpart+12)*60 + cur_rpart;
    		   difference = cur_mins - rise_mins;
    		   percent = (difference/interval)*100;
    		   deg = (percent/100)*150-75;
           	   percent = percent+'%';
    		 }
    	}
    var degree = "rotateZ("+deg+"deg)";
    $('.sun-animation').css('width',percent);
    $('.sun-symbol-path').css('-webkit-transform',degree);
  };
  
    //exchange between F and Celsius
    var temp = new Array(15);
	var toCelsius = function(temp){
		for(var i=0;i<temp.length;i++)
			{
			  temp[i] = parseInt(temp[i]);
			}
		if(document.getElementById('mybutton').innerHTML=='F'){
			document.getElementById("mybutton").innerHTML = 'C';
			document.getElementById('temperature').innerHTML = ((5/9)*(temp[0]-32)).toFixed(0)+"°";
			document.getElementById('high1').innerHTML= ((5/9)*(temp[1]-32)).toFixed(0)+"°";
			document.getElementById('low1').innerHTML= ((5/9)*(temp[2]-32)).toFixed(0)+"°";
			document.getElementById('high2').innerHTML= ((5/9)*(temp[3]-32)).toFixed(0)+"°";
			document.getElementById('low2').innerHTML= ((5/9)*(temp[4]-32)).toFixed(0)+"°";
			document.getElementById('high3').innerHTML= ((5/9)*(temp[5]-32)).toFixed(0)+"°";
			document.getElementById('low3').innerHTML= ((5/9)*(temp[6]-32)).toFixed(0)+"°";
			document.getElementById('high4').innerHTML= ((5/9)*(temp[7]-32)).toFixed(0)+"°";
			document.getElementById('low4').innerHTML= ((5/9)*(temp[8]-32)).toFixed(0)+"°";
			document.getElementById('high5').innerHTML= ((5/9)*(temp[9]-32)).toFixed(0)+"°";
			document.getElementById('low5').innerHTML= ((5/9)*(temp[10]-32)).toFixed(0)+"°";
			document.getElementById('high6').innerHTML= ((5/9)*(temp[11]-32)).toFixed(0)+"°";
			document.getElementById('low6').innerHTML= ((5/9)*(temp[12]-32)).toFixed(0)+"°";
			document.getElementById('high7').innerHTML= ((5/9)*(temp[13]-32)).toFixed(0)+"°";
			document.getElementById('low7').innerHTML= ((5/9)*(temp[14]-32)).toFixed(0)+"°";
			//return ((5/9)*(ftemp-32)).toFixed(0)+"°";
		}
		else{
			//document.getElementById("cbutton").disabled = true;
			//document.getElementById("fbutton").disabled = false;
			document.getElementById("mybutton").innerHTML = 'F';
			document.getElementById('temperature').innerHTML = parseInt((temp[0]*(9/5)+32))+"°";
			document.getElementById('high1').innerHTML= parseInt((temp[1]*(9/5)+32))+"°";
			document.getElementById('low1').innerHTML= parseInt((temp[2]*(9/5)+32))+"°";
			document.getElementById('high2').innerHTML= parseInt((temp[3]*(9/5)+32))+"°";
			document.getElementById('low2').innerHTML= parseInt((temp[4]*(9/5)+32))+"°";
			document.getElementById('high3').innerHTML= parseInt((temp[5]*(9/5)+32))+"°";
			document.getElementById('low3').innerHTML= parseInt((temp[6]*(9/5)+32))+"°";
			document.getElementById('high4').innerHTML= parseInt((temp[7]*(9/5)+32))+"°";
			document.getElementById('low4').innerHTML= parseInt((temp[8]*(9/5)+32))+"°";
			document.getElementById('high5').innerHTML= parseInt((temp[9]*(9/5)+32))+"°";
			document.getElementById('low5').innerHTML= parseInt((temp[10]*(9/5)+32))+"°";
			document.getElementById('high6').innerHTML= parseInt((temp[11]*(9/5)+32))+"°";
			document.getElementById('low6').innerHTML= parseInt((temp[12]*(9/5)+32))+"°";
			document.getElementById('high7').innerHTML= parseInt((temp[13]*(9/5)+32))+"°";
			document.getElementById('low7').innerHTML= parseInt((temp[14]*(9/5)+32))+"°";
		    //return parseInt((ftemp*(9/5)+32))+"°";
		}
	};
  	
  	//load weather image
  	window.onload = function(){
  		var pic;
  		if(document.getElementById('condition').innerHTML=="Rain"){
  			pic = "Raining_weather.png";
  			document.getElementById("image1").src=pic;
  			document.getElementById("image2").src=pic;
  		}
  		else if(document.getElementById('condition').innerHTML=="Mostly Cloudy"){
  			pic = "Mostly_Cloudy_weather.png";
  			document.getElementById("image1").src=pic;
  			document.getElementById("image2").src=pic;
  		}
  		else if(document.getElementById('condition').innerHTML=="Thunderstorms"||document.getElementById('condition').innerHTML=="Scattered Thunderstorms"){
  			pic = "Storm_weather.png";
  			document.getElementById("image1").src=pic;
  			document.getElementById("image2").src=pic;
  		}
  		else if(document.getElementById('condition').innerHTML=="Partly Cloudy"||document.getElementById('condition').innerHTML=="Cloudy"){
  			pic = "Cloudy_weather.png";
  			document.getElementById("image1").src=pic;
  			document.getElementById("image2").src=pic;
  		}
  		else if(document.getElementById('condition').innerHTML=="Mostly Sunny"||document.getElementById('condition').innerHTML=="Sunny"){
  			pic = "Sun_weather.png";
  			document.getElementById("image1").src=pic;
  			document.getElementById("image2").src=pic;
  		}
  		else if(document.getElementById('condition').innerHTML=="Scattered Showers"){
  			pic = "Showers_scattered.png";
  			document.getElementById("image1").src=pic;
  			document.getElementById("image2").src=pic;
  		}
  		else if(document.getElementById('condition').innerHTML=="Showers"){
  			pic = "Showers.png";
  			document.getElementById("image1").src=pic;
  			document.getElementById("image2").src=pic;
  		}
  		else if(document.getElementById('condition').innerHTML=="Mostly Clear"||document.getElementById('condition').innerHTML=="Clear"){
  			pic = "Clear_weather.png";
  			document.getElementById("image1").src=pic;
  			document.getElementById("image2").src=pic;
  		}
  	};
  	    /*
  	    //initial baidu map     
  	    var map = new BMap.Map("map");    
  	    var city = '+${param.city}+';
		map.centerAndZoom(city, 11);  
		map.addControl(new BMap.MapTypeControl());   
		map.setCurrentCity(city);         
		map.enableScrollWheelZoom(true);     
  	   */

//display temperature information
var display=function(){
			temp[0] = document.getElementById('temperature').innerHTML;
			temp[1] = document.getElementById('high1').innerHTML;
			temp[2]  = document.getElementById('low1').innerHTML;
			temp[3] = document.getElementById('high2').innerHTML;
			temp[4] = document.getElementById('low2').innerHTML;
			temp[5] = document.getElementById('high3').innerHTML;
			temp[6] = document.getElementById('low3').innerHTML;
			temp[7] = document.getElementById('high4').innerHTML;
			temp[8] = document.getElementById('low4').innerHTML;
			temp[9] = document.getElementById('high5').innerHTML;
			temp[10] = document.getElementById('low5').innerHTML;
			temp[11] = document.getElementById('high6').innerHTML;
			temp[12] = document.getElementById('low6').innerHTML;
			temp[13] = document.getElementById('high7').innerHTML;
			temp[14] = document.getElementById('low7').innerHTML;
			toCelsius(temp);
};		

//initial google map
function initMap(){
	var geocoder = new google.maps.Geocoder();
	var city = '+${param.city}+';
	var lati,longti;
	geocoder.geocode({'address':city}, function(results,status){
		if(status == google.maps.GeocoderStatus.OK){
			lati = results[0].geometry.location.lat();
			longti = results[0].geometry.location.lng();
			var location = {lat:lati,lng:longti};
			var map = new google.maps.Map(document.getElementById('map'),{
				zoom:6,
			    center:location,
			    mapTypeId:'hybrid',
			});
			
			var marker = new google.maps.Marker({
				position:location,
				map: map
			});
		}
	});
} 	   
</script>
<script src="https://query.yahooapis.com/v1/public/yql?q=select * from weather.forecast where woeid in (select woeid from geo.places(1) where text='+${param.city}+')
&format=json&callback=callbackFunction"></script>
<script async defer
src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAeiu7n6eaFVUqgPvn4EV-6lr3LLzun3MY&callback=initMap">
</script>
</body>
</html>