<%@ page import="java.sql.*" %>

<html>
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
    </head>
    <body>
        <%
String name=request.getParameter("val");
try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/AMS","root","mysql");
if(name==null||name.trim().equals(""))
{
    PreparedStatement ps=con.prepareStatement("select * from AMS.manage" );
    ResultSet rs=ps.executeQuery();

    if(!rs.isBeforeFirst()) 
    {    
        out.println("<p>No Record Found!</p>"); 
    }
    else
    {
    %>
        <table class="table table-striped"  width="100%"> 
            <thead class="thead-dark">
                <tr><th>Id</th><th>Email</th><th>Date</th><th>Punch In</th><th>Punch Out</th><th>working time</th></tr>
            </thead>
            <tbody>

                <%
        while(rs.next())
        {
            out.print("<tr><td>"+rs.getString(1)+"</td><td>"+rs.getString(2)+"</td><td>"+rs.getString(3)+"</td><td>"+rs.getString(4)+"</td><td>"+rs.getString(5)+"</td><td>"+rs.getString(6)+"</td></tr>");
        }
                %>
            </tbody>


       </table>

            <%
    }
}
else
{
    
        PreparedStatement ps=con.prepareStatement("select * from AMS.manage where idmanage like '"+name+"%' or email like '%"+name+"%' or date like '%"+name+"%'" );
        ResultSet rs=ps.executeQuery();

        if(!rs.isBeforeFirst()) 
        {    
            out.println("<p>No Record Found!</p>"); 
        }
        else
        {
        %>
            <table class="table table-striped"  width="100%"> 
                <thead class="thead-dark">
                    <tr><th>Id</th><th>Email</th><th>Date</th><th>Punch In</th><th>Punch Out</th><th>working time</th></tr>
                </thead>
                <tbody>
                    
                    <%
            while(rs.next())
            {
                out.print("<tr><td>"+rs.getString(1)+"</td><td>"+rs.getString(2)+"</td><td>"+rs.getString(3)+"</td><td>"+rs.getString(4)+"</td><td>"+rs.getString(5)+"</td><td>"+rs.getString(6)+"</td></tr>");
            }
                    %>
                </tbody>
            
            
           </table>
                
                <%
        }
       
    }
}catch(Exception e)
    {
        out.print(e);
    }
%>
        
    </body>
</html>
