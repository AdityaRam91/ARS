/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;

/**
 *
 * @author Kumar
 */
public class NewSchedule extends HttpServlet {

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
        try  {
            /* TODO output your page here. You may use following sample code. */
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
            PrintWriter out=response.getWriter();
            //flt_id varchar(10),src varchar(30),dest varchar(30),dep_date date,amt int,arrival_time time not null,departure_time time not null
            PreparedStatement ptst=con.prepareStatement("insert into schedules values(?,?,?,?,?,?,?,?)");
            String flt_id=request.getParameter("flt_id");
            String src=request.getParameter("src");
            String dest=request.getParameter("dest");
            
            String dep_date=request.getParameter("dep_date");
            
            int famt=Integer.parseInt(request.getParameter("famt"));
            int bamt=Integer.parseInt(request.getParameter("bamt"));
            String arrival_time=request.getParameter("arrival_time");
            String departure_time=request.getParameter("departure_time");
            ptst.setString(1, flt_id);
            ptst.setString(2, src);
            ptst.setString(3, dest);
            ptst.setString(4, dep_date);
            ptst.setInt(5, famt);
            ptst.setInt(6, bamt);
            ptst.setString(7, arrival_time);
            ptst.setString(8, departure_time);
            
            ptst.executeUpdate();
            out.println("<script>alert('schedule had created successfully');window.location='adminhome.jsp'</script>");
            
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
