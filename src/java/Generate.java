/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.sql.*;
import java.util.*;

/**
 *
 * @author Kumar
 */
public class Generate extends HttpServlet {

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
        try {
            /* TODO output your page here. You may use following sample code. */
            PrintWriter out = response.getWriter();
           Class.forName("com.mysql.cj.jdbc.Driver");
           Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
           Statement st=con.createStatement();
           PreparedStatement ptst=con.prepareStatement("select flt_id from booking where bkg_id=?");
           PreparedStatement psg_count=con.prepareStatement("select count(*) from passengers where bkg_id=?");
           PreparedStatement tkt_vals=con.prepareStatement("insert into tickets values (?,?)");
           PreparedStatement passenger_tkt=con.prepareStatement("update  passengers set tkt_id=? where bkg_id=? and tkt_id is null limit 1;");
           ResultSet rs=null;
           ResultSet rs1=null;
           int count=0;
           String fid=null;
           HttpSession s=request.getSession();
           String bid=(String)s.getAttribute("bid");
           ptst.setString(1,bid);
           psg_count.setString(1,bid);
           rs1=psg_count.executeQuery();
           if(rs1.next())
            count=rs1.getInt(1);
           rs=ptst.executeQuery();
           if(rs.next())
               fid=rs.getString(1);
           fid=fid.replace("22","");
           fid=fid.replaceAll("[^A-Z]","");
           String tkt="22"+fid;
           String last_tkt=null,str;
           int id=1;
           ptst=con.prepareStatement("select tkt_id from tickets where tkt_id like ? order by tkt_id desc limit 1");
           ptst.setString(1, tkt+"%");
           rs=ptst.executeQuery();
           if(rs.next()){
               last_tkt=rs.getString(1);
               last_tkt=last_tkt.replaceFirst("22","");
               last_tkt=last_tkt.replaceAll("[^0-9]","");
               id=Integer.parseInt(last_tkt)+1;
           }
           String psg_tkt=null;
           while(count>0){
           str=String.format("%03d",id);
           psg_tkt=tkt+"T"+str;
           tkt_vals.setString(1, psg_tkt);
           tkt_vals.setString(2, bid);
           tkt_vals.executeUpdate();
           passenger_tkt.setString(1, psg_tkt);
           passenger_tkt.setString(2,bid);
           passenger_tkt.executeUpdate();
           id++;
           count--;
           }
           out.println(tkt);
           s.removeAttribute(bid);
           RequestDispatcher rd=request.getRequestDispatcher("ticket.html");
           rd.forward(request, response);
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
