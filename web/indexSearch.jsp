<%@ page import="java.sql.*" %>
<%
String name=request.getParameter("val");

if(name==null||name.trim().equals(""))
{
    out.print("<p>Please select date!</p>");
}
else
{
    try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/AMS","root","mysql");
        PreparedStatement ps=con.prepareStatement("select * from AMS.manage where idmanage like '"+name+"%' or email like '%"+name+"%' or date like '%"+name+"%'" );
        ResultSet rs=ps.executeQuery();

        if(!rs.isBeforeFirst()) 
        {    
            out.println("<p>No Record Found!</p>"); 
        }
        else
        {
            out.print("<table border='1' cellpadding='2' width='100%'>");
            out.print("<tr><th>Id</th><th>Email</th><th>Date</th><th>Punch In</th><th>Punch Out</th><th>working time</th></tr>");
            while(rs.next())
            {
                out.print("<tr><td>"+rs.getString(1)+"</td><td>"+rs.getString(2)+"</td><td>"+rs.getString(3)+"</td><td>"+rs.getString(4)+"</td><td>"+rs.getString(5)+"</td><td>"+rs.getString(6)+"</td></tr>");
            }
            out.print("</table>");
        }
       
    }catch(Exception e)
    {
        out.print(e);
    }
}
%>