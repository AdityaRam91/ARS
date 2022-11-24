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
public class Search extends HttpServlet {

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
            PrintWriter out = response.getWriter();
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
            String date=null;
            String src=request.getParameter("src");
            String dest=request.getParameter("to");
            date=request.getParameter("date");
            if(date.equals(""))date=null;
            String db_src=null,db_dest=null,db_date=null;
            Statement stmt=con.createStatement();
            PreparedStatement ptst=con.prepareStatement("select flt_name from flight where flt_id=?");
            PreparedStatement cities=con.prepareStatement("select city from airport where apt_id=?");
            ResultSet rs=stmt.executeQuery("select * from schedules");
            RequestDispatcher rd=request.getRequestDispatcher("booking.jsp");
            rd.include(request, response);
            if(rs!=null){
                out.println("<script src='details_setting.js'></script>");
                out.println("<table border=2px cellspacing=0px id='table' align=center>");
                out.println("<tr><th>flight No</th><th>Flight Name</th><th>From</th><th>To</th><th>Date</th><th>Select Class</th><th>First Class</th><th>Business Class</th></tr>");
                while(rs.next()){
                    String flt_id=rs.getString(1);
                    db_src=rs.getString(2);
                    db_dest=rs.getString(3);
                    db_date=rs.getString(4);
                  
                    cities.setString(1,db_src);
                    ResultSet city=cities.executeQuery();
                    if(city.next())
                       db_src=city.getString(1);
                    cities.setString(1,db_dest);
                    city=cities.executeQuery();
                    if(city.next())
                       db_dest=city.getString(1);
                    
                    int famt=rs.getInt(5);
                    int bamt=rs.getInt(6);
                    String fname=null;
                    ptst.setString(1,flt_id);
                    ResultSet name=ptst.executeQuery();
                    if(name.next()){
                     fname=name.getString(1);
                    }
                    if(db_src.equals(src) && db_dest.equals(dest) && (date==null || db_date.equals(date))){
                        out.println("<tr>");
                        out.println("<td>"+flt_id+"</td>");
                        out.println("<td>"+fname+"</td>");
                        out.println("<td>"+src+"</td>");
                        out.println("<td>"+dest+"</td>");
                        out.println("<td>"+db_date+"</td>");
                        out.println("<td><select name='Classes'><option value='First'>First Class</option><option value='Business'>Business Class</option></td>");
                        out.println("<td>"+famt+"</td>");
                        out.println("<td>"+bamt+"</td>");
                        out.println("<td><input type=submit value='Book now' onclick='setdetails()'></td>");
                        out.println("</tr>");
                    }
                }
                out.println("</table>");
            }
        }catch(Exception e){System.out.println(e);}
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
