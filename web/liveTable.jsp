<%-- 
    Document   : liveTable
    Created on : 3 Jan, 2020, 11:19:06 AM
    Author     : rumit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>



  
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
      <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<meta content="" name="description" />
    <meta content="webthemez" name="author" />
    <title>AMS</title>
	<!-- Bootstrap Styles-->
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
     <!-- FontAwesome Styles-->
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
        <!-- Custom Styles-->
    <link href="assets/css/custom-styles.css" rel="stylesheet" />
     <!-- Google Fonts-->
   <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
  
   <script>
var request=new XMLHttpRequest();
function searchInfo(){
    var name=document.vinform.name.value;
    var url="indexSearch.jsp?val="+name;
    

    try
    {
        request.onreadystatechange=function()
        {
            if(request.readyState==4)
            {
                var val=request.responseText;
                document.getElementById('mylocation').innerHTML=val;
            }
        }
        request.open("GET",url,true);
        request.send();
    }catch(e)
    {
        alert("Unable to connect to server");
    }
}

function searchInfo1(){
    var name=document.vinform.name.value;
    var url="ExportData?val="+name;

    try
    {
        request.onreadystatechange=function()
        {
            if(request.readyState==4)
            {
                var val=request.responseText;
                document.getElementById('mylocation').innerHTML=val;
            }
        }
        request.open("GET",url,true);
        request.send();
    }catch(e)
    {
        alert("Unable to connect to server");
    }
}
</script>




</head>
<body onload="searchInfo()">
    
    <div id="wrapper">
         <%@include file="header1.jsp" %>
        <!--/. NAV TOP  -->
         <nav class="navbar-default navbar-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav" id="main-menu">

                    <li>
                        <a  href="index.jsp"><i class="fa fa-dashboard"></i> Dashboard</a>
                    </li>
                   
                    <li>
                        <a  href="#"><i class="fa fa-desktop"></i> Users<span class="fa arrow"></span> </a>
                           <ul class="nav nav-second-level">
                            <li>
                                <a href="user.jsp">Create User</a>
                            </li>
                            <li>
                                <a href="user.jsp">All User</a>
                            </li>
                            </ul>
                    </li> 
			
                      <li>
                        <a href="#"><i class="fa fa-edit"></i> Edit Information<span class="fa arrow"></span> </a>
                           <ul class="nav nav-second-level">
                            <li>
                                <a href="#">Update User Info.</a>
                            </li>
                            <li>
                                <a href="#">Password Change</a>
                            </li>
                            </ul>
                    </li> 		 
		
                    <li>
                        <a class="active-menu" href="#"><i class="fa fa-table"></i>Live Activity Tables</a>
                    </li>
                    <li>
                        <a href="leave.jsp"><i class="fa fa-edit"></i> Leave </a>
                    </li>
                       

                    <li>
                        <a href="#"><i class="fa fa-sitemap"></i>Reports<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="#">Full Calender report</a>
                            </li>
                            <li>
                                <a href="#">Table Report Individual</a>
                            </li>
                             <li>
                                <a href="#">Summary Report</a>
                            </li>


                                </ul>

                            </li>

                         <li>
                        <a href="login.jsp"><i class="glyphicon glyphicon-off"></i> Logout </a>
                    </li>
                        </ul>
                    </li>
                 
                </ul>

            </div>

        </nav>
        <!-- /. NAV SIDE  -->
        <div id="page-wrapper">
		 
            <div id="page-inner"> 
				 
			<h3>Search Employee</h3>
                        <br>
                            <form name="vinform" class="form-inline"  >
                            
                         <div class="form-group" >
                            <input class="form-control" type="date" name="name" id="name" onfocusin="searchInfo()"/>
                            &emsp;&emsp;&emsp;&emsp;&emsp;
                            <input class="login100-form-btn" type="button" name="button" value="Export" onclick="searchInfo1()">
                        </div>
                        </form>
                           
                       
                        <span id="mylocation"></span>	

                        
       
                <!-- /. ROW  -->
				 <%@include file="footer.jsp" %>
				</div>
             <!-- /. PAGE INNER  -->
            </div>
         <!-- /. PAGE WRAPPER  -->
        </div>
     <!-- /. WRAPPER  -->
    <!-- JS Scripts-->
    <!-- jQuery Js -->
    <script src="assets/js/jquery-1.10.2.js"></script>
      <!-- Bootstrap Js -->
    <script src="assets/js/bootstrap.min.js"></script>
    <!-- Metis Menu Js -->
    <script src="assets/js/jquery.metisMenu.js"></script>
      <!-- Custom Js -->
    <script src="assets/js/custom-scripts.js"></script>
    
 
 


</body>
</html>
