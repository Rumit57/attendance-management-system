
     
    var h3 = document.getElementsByTagName ('h3')[0],
    seconds = 0, minutes = 2, hours = 1, t;

function
timer ()
{
  t = setTimeout (add, 1000);
}


  function change1()
  {
var elem = document.getElementById("stop1");
    if (elem.value=="Punch Out"){ 
        
    clearTimeout (t);
     elem.value = "Punch In";
     $.post( "updatePunch.jsp" );
     
    }
    
    else {
        
    timer();
     elem.value = "Punch Out";   
     $.post( "insertPunch.jsp" );
    }

  }

function
add ()
{
  seconds++;
  if (seconds >= 60)
    {
      seconds = 0;
      minutes++;
      if (minutes >= 60)
	{
	  minutes = 0;
	  hours++;
	}
    }

  h3.textContent =
          (hours ? (hours > 9 ? hours : "0" + hours) : "00") + ":" +
    (minutes ? (minutes > 9 ? minutes : "0" + minutes) : "00") + ":" +
    (seconds > 9 ? seconds : "0" + seconds) ;

  timer ();
}