<%-- 
    Document   : index
    Created on : 17 Dec, 2019, 9:59:25 AM
    Author     : rumit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<meta content="" name="description" />
    <meta content="webthemez" name="author" />
    <title>Primavera systems</title>
    <!-- Bootstrap Styles-->
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
    <!-- FontAwesome Styles-->
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
    <!-- Morris Chart Styles-->
    <link href="assets/js/morris/morris-0.4.3.min.css" rel="stylesheet" />
    <!-- Custom Styles-->
    <link href="assets/css/custom-styles.css" rel="stylesheet" />
    
    <!-- Google Fonts-->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
    <link rel="stylesheet" href="assets/js/Lightweight-Chart/cssCharts.css"> 
</head>
    
    <% 
        
        String email1=(String)session.getAttribute("user");  

        if(email1==null)
        {
            response.sendRedirect("login.jsp");
        }
        else
        {

        %>

<body>
    <div id="wrapper">
        <%@include file="header1.jsp" %>
        
         <!--/. NAV TOP  -->
       <nav class="navbar-default navbar-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav" id="main-menu">

                    <li>
                        <a class="active-menu" href="index.jsp"><i class="fa fa-dashboard"></i> Dashboard</a>
                    </li>
                   
                    <li>
                        <a href="#"><i class="fa fa-desktop"></i> Users<span class="fa arrow"></span> </a>
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
                        <a href="#"><i class="fa fa-table"></i>Live Activity Tables</a>
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
                        <a href="Logout"><i class="glyphicon glyphicon-off"></i> Logout </a>
                    </li>
                        </ul>
                    </li>
                 
                </ul>

            </div>

        </nav>
        <!-- /. NAV SIDE  -->
      
		<div id="page-wrapper">
		  <div class="header"> 
                        <h1 class="page-header">
                            Dashboard <small>Welcome Rumit Shah</small>
                        </h1>
						<ol class="breadcrumb">
					  <li><a href="#">Home</a></li>
					  <li><a href="#">Dashboard</a></li>
					  <li class="active">Data</li>
					</ol> 
									
		</div>
            <div id="page-inner">

                <!-- /. ROW  -->
	
               
					
				<center>
				 <input class="btn btn-primary" onclick="change()" type="button" value="Punch In" id="start1"></input>
				</center>
				
	
			
		
				<div class="row">
				<div class="col-md-5">
						<div class="panel panel-default">
						
						<div class="panel-body">
							<div id="morris-line-chart"></div>
						</div>						
					</div>   
					</div>		
					
						<div class="col-md-7">
					<div class="panel panel-default">
					
                            <div class="panel-body">
                                <div id="morris-bar-chart"></div>
                            </div>
						
					</div>  
					</div>
					
				</div> 
			 
				
				
                <div class="row">
                    <div class="col-md-9 col-sm-12 col-xs-12">
                        <div class="panel panel-default">                            
							<div class="panel-heading">
							Area Chart
						</div>
						<div class="panel-body">
							<div id="morris-area-chart"></div>
						</div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-12 col-xs-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                Donut Chart Example
                            </div>
                            <div class="panel-body">
                                <div id="morris-donut-chart"></div>
                            </div>
                        </div>
                    </div>

                </div>
				<div class="row">
				<div class="col-md-12">
				
					</div>		
				</div> 	
                
                
                <!-- /. ROW  -->

	   
				
				
				
                <div class="row">
                    
                    <div class="col-md-8 col-sm-12 col-xs-12">

                        <div class="panel panel-default">
                            <div class="panel-heading">
                                Responsive Table Example
                            </div> 
                            <div class="panel-body">
                                <div class="table-responsive">
                                    <table class="table table-striped table-bordered table-hover">
                                        <thead>
                                            <tr>
                                                <th>S No.</th>
                                                <th>First Name</th>
                                                <th>Last Name</th>
                                                <th>User Name</th>
                                                <th>Email ID.</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>1</td>
                                                <td>John</td>
                                                <td>Doe</td>
                                                <td>John15482</td>
                                                <td>name@site.com</td>
                                            </tr>
                                            <tr>
                                                <td>2</td>
                                                <td>Kimsila</td>
                                                <td>Marriye</td>
                                                <td>Kim1425</td>
                                                <td>name@site.com</td>
                                            </tr>
                                            <tr>
                                                <td>3</td>
                                                <td>Rossye</td>
                                                <td>Nermal</td>
                                                <td>Rossy1245</td>
                                                <td>name@site.com</td>
                                            </tr>
                                            <tr>
                                                <td>4</td>
                                                <td>Richard</td>
                                                <td>Orieal</td>
                                                <td>Rich5685</td>
                                                <td>name@site.com</td>
                                            </tr>
                                            <tr>
                                                <td>5</td>
                                                <td>Jacob</td>
                                                <td>Hielsar</td>
                                                <td>Jac4587</td>
                                                <td>name@site.com</td>
                                            </tr>
                                            <tr>
                                                <td>6</td>
                                                <td>Wrapel</td>
                                                <td>Dere</td>
                                                <td>Wrap4585</td>
                                                <td>name@site.com</td>
                                            </tr>

                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
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
    <!-- Morris Chart Js -->
    <script src="assets/js/morris/raphael-2.1.0.min.js"></script>
    <script src="assets/js/morris/morris.js"></script>
	
	
	<script src="assets/js/easypiechart.js"></script>
	<script src="assets/js/easypiechart-data.js"></script>
	
	 <script src="assets/js/Lightweight-Chart/jquery.chart.js"></script>
	
    <!-- Custom Js -->
    <script src="assets/js/custom-scripts.js"></script>

      
    <!-- Chart Js -->
    <script type="text/javascript" src="assets/js/Chart.min.js"></script>  
    <script type="text/javascript" src="assets/js/chartjs.js"></script> 

</body>

<script>
  
    var h3 = document.getElementsByTagName ('h3')[0],
    startstop = document.getElementById ('start1'),
    seconds = 0, minutes = 0, hours = 0, t;

function
timer ()
{
  t = setTimeout (add, 1000);
}

function change() 
{
    
   
    
var elem = document.getElementById("start1");
    if (elem.value=="Punch Out"){ 
        
    clearTimeout (t);
     elem.value = "Punch In"
    }
    
    else {
        
    timer();
     elem.value = "Punch Out"    
    
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
    (seconds > 9 ? seconds : "0" + seconds);

  timer ();
}


</script>

</html>
<%
        }

%>