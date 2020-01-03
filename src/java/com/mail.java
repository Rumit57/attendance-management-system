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
public class mail extends HttpServlet {

     public String getSaltString() {
            String SALTCHARS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
            StringBuilder salt = new StringBuilder();
            Random rnd = new Random();
            while (salt.length() < 10) { // length of the random string.
            int index = (int) (rnd.nextFloat() * SALTCHARS.length());
            salt.append(SALTCHARS.charAt(index));
        }
        String saltStr = salt.toString();
        return saltStr;

    }
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
            String to = request.getParameter("to");
               
            String subject ="Forgot Password ";
    //        String message =  getSaltString();

            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<body>");
                  

            String code= getSaltString();
            String link="http://localhost:8084/AMS/changePassword.jsp?code="+code;
            
            String user = "shah.rumit99@gmail.com";
            String pass = "8866291338";
            
            boolean bool=SendMail.send1(to,subject, code,link, user, pass);
            if(bool)
            {
                String qinsert="insert into AMS.USER_DETAILS(email,code,status) select '"+to+"','"+code+"','Active' where not exists (Select email From AMS.USER_DETAILS where email='"+to+"') LIMIT 1";
                            int i =st.executeUpdate(qinsert);
                            if(i==0)
                            {
                                String q="UPDATE AMS.USER_DETAILS SET CODE='"+code+"',STATUS='Active' where EMAIL='"+to+"'";
                                int i1 =st.executeUpdate(q);
                            }
//                            RequestDispatcher dis=request.getRequestDispatcher("index.jsp");
//                        dis.forward(request, response);
                            out.println("<script type=\"text/javascript\">");
                            out.println("alert('Mail successfully sent');");
                            out.println("location='index.jsp';");
                            out.println("</script>");
//                out.println("<meta http-equiv='refresh' content='1;URL=index.jsp'>");//redirects after 3 seconds
//                out.println("<p style='color:red;'>User or password incorrect!</p>");
            }
            else
            {
                RequestDispatcher dis=request.getRequestDispatcher("pageNotFound.jsp");
                dis.forward(request, response);
            }
            

            out.println("</body>");
            out.println("</html>");
            }catch(Exception ex){
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
