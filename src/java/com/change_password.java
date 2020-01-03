/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author rumit
 */
public class change_password extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            
            try{
                Class.forName("com.mysql.jdbc.Driver"); 
                Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/AMS","root","mysql");
            Statement st=cn.createStatement(); 
            String code = request.getParameter("code");
           String email = request.getParameter("email");
           String new_password = request.getParameter("new_password");
           String c_password = request.getParameter("confirm_password");
         
           int count1=0;
         
           
           String q1="SELECT * FROM AMS.USER_DETAILS where EMAIL='"+email+"' AND CODE='"+code+"'";
            ResultSet rs = st.executeQuery(q1);
            
            if(rs.next())
                {
                    String email1=rs.getString("EMAIL");
                    String code1=rs.getString("CODE");
                    String status1=rs.getString("STATUS");
                    
                    if(email.equalsIgnoreCase(email1) && code1.equals(code) && status1.equals("Active") && new_password.equals(c_password) && !new_password.equals("") && !c_password.equals(""))
                    {
                        String q="UPDATE AMS.USER_DETAILS SET STATUS='Deactive',PASSWORD='"+c_password+"' where EMAIL='"+email1+"'";
                        int i1 =st.executeUpdate(q);
                    }
                    else
                    {
                        count1=count1+1;
                    }
                    if(count1==0)
                    {
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('Password change successfully');");
                        out.println("location='index.jsp';");
                        out.println("</script>");
                        
                    }
                    
                    else
                    {
                        out.println("<html>");
                        out.println("<body>");
                        out.println("<center>");
                        out.println("<h2 style='color:red'><b>Invalid Password</b></h2>");
                        out.println("</center>");   
                        out.println("</body>");   
                        out.println("</html>");
                        RequestDispatcher dis=request.getRequestDispatcher("changePassword.jsp");
                        dis.include(request, response);
                    }
                    
                }
            else
            {
                RequestDispatcher dis=request.getRequestDispatcher("pageNotFound.jsp");
                dis.forward(request, response);
            }
              
          
           
        }catch(Exception ex)
        {
            System.out.println(ex);
        }
    }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
