/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;  
import java.sql.*;
import javax.servlet.*;  
import javax.servlet.http.*;  
/**
 *
 * @author rumit
 */
public class LoginSession extends HttpServlet {

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
           
            String email=request.getParameter("email");
            String pass=request.getParameter("pass");
            
             try{
                Class.forName("com.mysql.jdbc.Driver"); 
                 Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/AMS","root","mysql");
            Statement st=cn.createStatement(); 
          
         
           String q1="SELECT * FROM AMS.USER_DETAILS where EMAIL='"+email+"'";
            ResultSet rs = st.executeQuery(q1);
            if(rs.next())
            {
                if(email.equals(rs.getString("EMAIL")) && pass.equals(rs.getString("PASSWORD")))
                {
                    HttpSession session=request.getSession();  
                    session.setAttribute("user",email);  
                    RequestDispatcher dis=request.getRequestDispatcher("index.jsp");
                     dis.forward(request, response);
                }
                else
                {
                        RequestDispatcher dis=request.getRequestDispatcher("loginInvalid.jsp");
                        dis.include(request, response);
                }
            }
            else
            {
                    RequestDispatcher dis=request.getRequestDispatcher("loginInvalid.jsp");
                    dis.include(request, response);
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
