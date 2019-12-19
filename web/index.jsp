<%-- 
    Document   : index
    Created on : 17 Dec, 2019, 9:59:25 AM
    Author     : rumit
--%>

<%@page import="java.sql.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.*"%>
<%@page import="java.util.Date"%>
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
        int id=0;
        int hours1=0;
        int minutes1=0;
        int seconds1=0;
        String workinghour="";
        String punch_in="";
        String punch_out="";
        String email1=(String)session.getAttribute("user");  
             Calendar calendar = Calendar.getInstance();
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        if(email1==null)
        {
            response.sendRedirect("login.jsp");
        }
        else
        {
            try{
                Class.forName("com.mysql.jdbc.Driver"); 
            Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/AMS","root","mysql");
            Statement st=cn.createStatement(); 
            
            
            String q1="SELECT * FROM AMS.manage where date='"+formatter.format(calendar.getTime())+"'";
            ResultSet rs = st.executeQuery(q1);

            while(rs.next())
                {
                    
                        if(rs.getString("date").equals(formatter.format(calendar.getTime())))
                        {
                            
                            String qSelect="select * from AMS.manage where date='"+rs.getString("date")+"' and email='"+email1+"'";
                            ResultSet rsSelect = st.executeQuery(qSelect);
                            
                            while(rsSelect.next())
                            {
                               
                                if(rsSelect.getString("email").equalsIgnoreCase(email1))
                                {
                                    id=rsSelect.getInt("idmanage");
                                    session.setAttribute("id",id);
                                    workinghour=rsSelect.getString("workinghour");
                                    punch_in=rsSelect.getString("punch_in");
                                    punch_out=rsSelect.getString("punch_out");
                                    session.setAttribute("workinghour",workinghour);

                                    String[] firstTimeParts = workinghour.split(":");
                                   // Converting String to Integer
                                   hours1 = Integer.parseInt(firstTimeParts[0]);
                                   minutes1 = Integer.parseInt(firstTimeParts[1]);
                                   seconds1 = Integer.parseInt(firstTimeParts[2]);
                                   

                                }
                            } 
                        }
                        else
                        {
                            String qinsert="insert into AMS.manage(email,date,workinghour) select '"+email1+"','"+formatter.format(calendar.getTime())+"','00:00:00' where not exists (Select date From AMS.manage where date='"+formatter.format(calendar.getTime())+"') LIMIT 1";
                            int i =st.executeUpdate(qinsert);
                            if(i>0)
                            {
                                String q2="SELECT idmanage,workinghour FROM AMS.manage ORDER BY idmanage DESC LIMIT 1";
                                ResultSet rs1 = st.executeQuery(q2);
                                if(rs1.next())
                                {
                                   session.setAttribute("id",rs1.getInt("idmanage"));
                                   session.setAttribute("workinghour",rs1.getString("workinghour"));
                                }
                            }
  
                        } 
               }
            
 }catch (ClassNotFoundException ex) {
            System.out.println(ex);
        } catch (SQLException ex) {
            System.out.println(ex);
        }
       
 

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
       
        
        <% 
            
             	SimpleDateFormat format2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
             
                Date d1 = null;
		Date d2 = null;
		//Date d3 = null;
                String wh1="";
                String diffSeconds1="";
                String diffMinutes1="";
                String diffHours1="";
                long diffSeconds=0;
                long diffMinutes=0;
                long diff=0;
                int hours3=0;
                int minutes3=0;
                int seconds3=0;
                String finalTime="";
		try {
                        Class.forName("com.mysql.jdbc.Driver"); 
                           Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/AMS","root","mysql");
                           Statement st=cn.createStatement(); 
                        
			d1 = format2.parse(punch_in);
			d2 = format2.parse(punch_out);
			//d3 = format2.format(calendar.getTime());

			//in milliseconds
			diff = d2.getTime() - d1.getTime();

			diffSeconds = diff / 1000 % 60;
                        diffSeconds1 =Long.toString(diffSeconds);
			diffMinutes = diff / (60 * 1000) % 60;
                        diffMinutes1 =Long.toString(diffMinutes);
			long diffHours = diff / (60 * 60 * 1000) % 24;
			diffHours1 =Long.toString(diffHours);

               String q2=" SELECT TIMEDIFF('"+format2.format(calendar.getTime())+"','"+punch_in+"')";
               ResultSet rstimepunch = st.executeQuery(q2);

                
                while(rstimepunch.next())
                {
                    wh1=rstimepunch.getString("TIMEDIFF('"+format2.format(calendar.getTime())+"','"+punch_in+"')");

                }
                
                
            
            String[] firstTimeParts = workinghour.split(":");
				// Converting String to Integer
				hours3 = Integer.parseInt(firstTimeParts[0]);
				minutes3 = Integer.parseInt(firstTimeParts[1]);
				seconds3 = Integer.parseInt(firstTimeParts[2]);

				// Separating second String using delimiter ":"
				String[] secondTimeParts = wh1.split(":");
				// Converting String to Integer
				int hours2 = Integer.parseInt(secondTimeParts[0]);
				int minutes2 = Integer.parseInt(secondTimeParts[1]);
				int seconds2 = Integer.parseInt(secondTimeParts[2]);

				int hours = hours3 + hours2;
				int minutes = minutes3 + minutes2;
				int seconds = seconds3 + seconds2;
				int days = 0;

				/*
				 * 
				 * 60 seconds=1 minute. So if value of seconds>59 adding 1
				 * minute to minutes. 60 minutes=1 hour So if value of
				 * minutes>59 adding 1 hour to hours. 24 hours=1 day So if value
				 * of hours>23 adding 1 day to days.
				 * 
				 */
				if (seconds > 59) {
					seconds = seconds - 60;
					minutes = minutes + 1;
					if (minutes > 59) {
						minutes = minutes - 60;
						hours = hours + 1;
						if (hours > 23) {
							hours = hours - 24;
							days = days + 1;
						}
					} else {

						if (hours > 23) {
							hours = hours - 24;
							days = days + 1;
						}

					}
				} else {
					if (minutes > 59) {
						minutes = minutes - 60;
						hours = hours + 1;
						if (hours > 23) {
							hours = hours - 24;
							days = days + 1;
						}
					} else {

						if (hours > 23) {
							hours = hours - 24;
							days = days + 1;
						}

					}
				}

				// Converting each integer value of String and combining all Strings.
				finalTime = String.valueOf(hours) + ":" + String.valueOf(minutes) + ":" + String.valueOf(seconds);
				
				
                
               

		} catch (Exception e) {
			e.printStackTrace();
		}
                %>
      
		<div id="page-wrapper">
		  <div class="header"> 
                        <h1 class="page-header">
                            Dashboard <small>Welcome Rumit Shah  <%=wh1 %> <%=finalTime%> </small>
                        </h1>
						<ol class="breadcrumb">
					  <li><a href="#">Home</a></li>
					  <li><a href="#">Dashboard</a></li>
					  <li class="active">Data</li>
					</ol> 
									
		</div>
            <div id="page-inner">

                <!-- /. ROW  -->
	
               
                
                <%
//                   
                   if( diffSeconds1.startsWith("-") || diffMinutes1.startsWith("-") || diffHours1.startsWith("-"))
                   {
                        try {
                         Class.forName("com.mysql.jdbc.Driver"); 
                            Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/AMS","root","mysql");
                            Statement st=cn.createStatement(); 
                        String addworking="update AMS.manage SET workinghour='"+finalTime+"' where idmanage='"+session.getAttribute("id")+"'";
                                 int i1 =st.executeUpdate(addworking);
                         session.setAttribute("workinghour",finalTime);
                        } catch (Exception e) {
                         e.printStackTrace();
                         }   
                       %>
                      
                       
                        <center>
                            
				 <input name="button" class="btn btn-primary" onclick="change()" type="button" value="Punch Out" id="start1"></input>
				</center>
                        
                      <%   
                   }
                    else if(punch_out==null)
                    {
                         %>
                        <center>
				 <input name="button" class="btn btn-primary" onclick="change()" type="button" value="Punch Out" id="start1"></input>
				</center>
                        
                      <%  
                    }
                    else
                    {
                        %>
                        
                        <center>
				 <input name="button" class="btn btn-primary" onclick="change()" type="button" value="Punch In" id="start1"></input>
				</center>
                        
                      <%   

                    }
//                               
               %>
					
				
				
	
			
		
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
    <script type="text/javascript" >
     
    var h3 = document.getElementsByTagName ('h3')[0],
    seconds = <%=seconds3 %>, minutes = <%=minutes3 %>, hours = <%=hours3 %>, t;

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
    </script>
</body>
</html>
<%
    
        }

%>