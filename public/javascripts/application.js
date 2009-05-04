// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

function toggleDiv(e, id, flagit) {
if (flagit=="1"){
	var object = document.getElementById(''+id+'');
	object.style.display = "block";
	getMouseXY(e);
	object.style.left = tempX
	object.style.top = tempY
}
else
	if (flagit=="0"){
		var object = document.getElementById(''+id+'')
		//object.style.visibility = "hidden"
		object.style.display = "none";
	}
}

var IE = document.all?true:false
if (!IE) document.captureEvents(Event.MOUSEMOVE)


function getMouseXY(e) {
      if (IE) { // grab the x-y pos.s if browser is IE
        tempX = event.clientX + document.body.scrollLeft
        tempY = event.clientY + document.body.scrollTop
      } else {  // grab the x-y pos.s if browser is NS
        tempX = e.pageX
        tempY = e.pageY
      }  
      // catch possible negative values in NS4
      if (tempX < 0){tempX = 0}
      if (tempY < 0){tempY = 0}  
      // show the position values in the form named Show
      // in the text fields named MouseX and MouseY
      //document.Show.MouseX.value = tempX
      //document.Show.MouseY.value = tempY
      return tempX, tempY
}
