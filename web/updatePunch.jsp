<%-- 
    Document   : insertPunch
    Created on : 18 Dec, 2019, 11:28:36 AM
    Author     : rumit
--%>


<%@page import="java.util.Calendar"%>
<%@page import="java.util.TimeZone"%>
<%@page import="sun.util.calendar.LocalGregorianCalendar"%>
<%@page import="sun.util.calendar.LocalGregorianCalendar.Date"%>
<%@page import="java.sql.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <%  try{
            Calendar calendar = Calendar.getInstance();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        //System.out.println(formatter.format(calendar.getTime()));
        Class.forName("com.mysql.jdbc.Driver"); 
            Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/AMS","root","mysql");
            Statement st=cn.createStatement(); 
          //  System.out.println(formatter.format(calendar.getTime()));
          String punch_in="";
          String punch_out="";
          String workinghour="";
           String q3="UPDATE AMS.manage SET punch_out='"+formatter.format(calendar.getTime())+"' where idmanage='"+session.getAttribute("id")+"'";
            int i =st.executeUpdate(q3);
          String q1="SELECT * FROM AMS.manage WHERE idmanage='"+session.getAttribute("id")+"'";
          ResultSet rs = st.executeQuery(q1);
          while(rs.next())
            {
                punch_in=rs.getString("punch_in");
                punch_out=rs.getString("punch_out");
                workinghour=rs.getString("workinghour");
               
            }
          
          String q2=" SELECT TIMEDIFF('"+punch_out+"','"+punch_in+"')";
           ResultSet rs1 = st.executeQuery(q2);
               
            String wh1="";
            while(rs1.next())
            {
                wh1=rs1.getString("TIMEDIFF('"+punch_out+"','"+punch_in+"')");
               
            }
            
            
            String[] firstTimeParts = workinghour.split(":");
				// Converting String to Integer
				int hours1 = Integer.parseInt(firstTimeParts[0]);
				int minutes1 = Integer.parseInt(firstTimeParts[1]);
				int seconds1 = Integer.parseInt(firstTimeParts[2]);

				// Separating second String using delimiter ":"
				String[] secondTimeParts = wh1.split(":");
				// Converting String to Integer
				int hours2 = Integer.parseInt(secondTimeParts[0]);
				int minutes2 = Integer.parseInt(secondTimeParts[1]);
				int seconds2 = Integer.parseInt(secondTimeParts[2]);

				int hours = hours1 + hours2;
				int minutes = minutes1 + minutes2;
				int seconds = seconds1 + seconds2;
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
				String finalTime = String.valueOf(hours) + ":" + String.valueOf(minutes) + ":" + String.valueOf(seconds);
				
				

            
            
       
        String q4="UPDATE AMS.manage SET tempworkinghour='"+wh1+"', workinghour='"+finalTime+"' where idmanage='"+session.getAttribute("id")+"'";
           
            int i1 =st.executeUpdate(q4);
        }catch (ClassNotFoundException ex) {
            System.out.println(ex);
        } catch (SQLException ex) {
            System.out.println(ex);
        }
       
    %>
    </body>
</html>
