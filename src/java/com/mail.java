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
            String link="http://localhost:8084/AMS/changePassword.jsp";
            String code= getSaltString();
            String user = "shah.rumit99@gmail.com";
            String pass = "Rumit@57";
            
            SendMail.send1(to,subject, code,link, user, pass);
            String qinsert="insert into AMS.forgot_password(email,code,status) select '"+to+"','"+code+"','Active' where not exists (Select email From AMS.forgot_password where email='"+to+"') LIMIT 1";
//                            String qinsert="insert into AMS.manage(email,date,workinghour) values('"+email1+"','"+formatter.format(calendar.getTime())+"','00:00:00') ";
                            int i =st.executeUpdate(qinsert);
                            if(i==0)
                            {
                                String q="UPDATE AMS.forgot_password SET code='"+code+"',status='Active' where email='"+to+"'";
                                int i1 =st.executeUpdate(q);
                            }
            out.println("Mail send successfully");

            out.println("</body>");
            out.println("</html>");
            }catch(Exception ex){
                System.out.println(ex);
            }
            
            RequestDispatcher dis=request.getRequestDispatcher("index.jsp");
            dis.forward(request, response);
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