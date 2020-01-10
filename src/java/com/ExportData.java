/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.FileWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.RequestDispatcher;

/**
 *
 * @author rumit
 */
public class ExportData extends HttpServlet {

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
            try{
                FileWriter fw = new FileWriter("/home/rumit/Downloads/xyz.csv");
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/AMS","root","mysql");
                 // take data from database
                 
                 String name=request.getParameter("val");
                 
                 if(name=="")
                 {
                        String sql = "Select * from AMS.manage ";
                        Statement stmt = con.createStatement();
                        ResultSet rs = stmt.executeQuery(sql);
                        //Create header inside Csv file
                        fw.append("id"); 
                        fw.append(","); 
                        fw.append("email"); 
                        fw.append(","); 
                        fw.append("date"); 
                        fw.append(","); 
                        fw.append("punch in "); 
                        fw.append(","); 
                        fw.append("punch out"); 
                        fw.append(","); 
                        fw.append("working hour");
                        fw.append('\n');
                        // extract data from databse
                        while (rs.next()) {
                         fw.append(rs.getString(1));
                         fw.append(",");
                         fw.append(rs.getString(2));
                         fw.append(",");
                         fw.append(rs.getString(3));
                         fw.append(",");
                         fw.append(rs.getString(4));
                         fw.append(",");
                         fw.append(rs.getString(5));
                         fw.append(",");
                         fw.append(rs.getString(6));
                         fw.append('\n');
                        }
                        fw.flush(); fw.close(); con.close();
                        
                 }
                 else
                 {
                    String sql = "Select * from AMS.manage where date like '"+name+"'";
                    Statement stmt = con.createStatement();
                    ResultSet rs = stmt.executeQuery(sql);
                    //Create header inside Csv file
                    fw.append("id"); 
                    fw.append(","); 
                    fw.append("email"); 
                    fw.append(","); 
                    fw.append("date"); 
                    fw.append(","); 
                    fw.append("punch in "); 
                    fw.append(","); 
                    fw.append("punch out"); 
                    fw.append(","); 
                    fw.append("working hour");
                    fw.append('\n');
                  // extract data from databse
                        while (rs.next()) {
                         fw.append(rs.getString(1));
                         fw.append(",");
                         fw.append(rs.getString(2));
                         fw.append(",");
                         fw.append(rs.getString(3));
                         fw.append(",");
                         fw.append(rs.getString(4));
                         fw.append(",");
                         fw.append(rs.getString(5));
                         fw.append(",");
                         fw.append(rs.getString(6));
                         fw.append('\n');
                        }
                        fw.flush(); fw.close(); con.close();
                        
                 }
                  out.println("<p>Data Exported</p>"); 
            }catch(Exception e)
            {
                System.out.println(e);
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
