/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
import java.sql.*;
import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;


/**
 *
 * @author Kumar
 */
public class Cancel extends HttpServlet {

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
            PrintWriter out=response.getWriter();
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
            out.println("<script src='setalldetails.js'></script>");
            String bid=request.getParameter("bid");
            String tkt_id=request.getParameter("tkt_id");
            PreparedStatement details=con.prepareStatement("select * from tickets where bkg_id=? and tkt_id=?");
            PreparedStatement cancel=con.prepareStatement("delete from tickets where bkg_id=? and tkt_id=?");
            details.setString(1, bid);
            details.setString(2, tkt_id);
            ResultSet rs=details.executeQuery();
            cancel.setString(1, bid);
            cancel.setString(2, tkt_id);
            cancel.executeUpdate();
            if(rs.next()){
                out.println("<script>alert('your cancellation was success');window.location='home1.jsp'</script>");
              //  response.sendRedirect("home1.jsp");
            }
            else{
                out.println("<script>alert('Invalid Booking id or Ticket id');window.location='cancel.html';</script>");
              //  response.sendRedirect("cancel.html");
            }
        }
        catch(Exception e){
            PrintWriter out=response.getWriter();
            out.println("can not cancel ticket");
            System.out.println(e);
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
