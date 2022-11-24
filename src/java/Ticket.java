/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.sql.*;

/**
 *
 * @author Kumar
 */
public class Ticket extends HttpServlet {

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
        try{
            PrintWriter out=response.getWriter();
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
            PreparedStatement ps=con.prepareStatement("select * from passengers where bkg_id=?");
            PreparedStatement tps=con.prepareStatement("select * from tickets where bkg_id=?");
            String bid=request.getParameter("bid");
            ps.setString(1, bid);
            ResultSet rs=ps.executeQuery();
            tps.setString(1, bid);
            ResultSet tkt=tps.executeQuery();
            if(rs.next()==false) {
                out.print("INVALID BOOKING");
            }
            else {
                out.print("<table border=2px><tr><th>Name</th><th>Mobile number</th><th>Age</th>");
            do{
                String name=rs.getString(2);
                String numb=rs.getString(4);
                int age=rs.getInt(5);
              out.print("<tr><td>"+name+"</td><td>"+numb+"</td><td>"+age+"</td></tr>");
            }while(rs.next());
            if(tkt.next())
            out.println(tkt.getString(1));
            }
            response.sendRedirect("display.jsp");
        }
        catch(Exception e){System.out.println(e);}
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
