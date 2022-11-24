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
public class Signin extends HttpServlet {

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
            PrintWriter out=response.getWriter();
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
            PreparedStatement ptst=con.prepareStatement("select * from users where uname=? or email=?");
            out.println("<script src='setdetails.js'></script>");
            String uname=request.getParameter("uname");
            String password=request.getParameter("pwd");
            HttpSession sc=request.getSession();
            ptst.setString(1, uname);
            ptst.setString(2, uname);
            ResultSet rs=ptst.executeQuery();
            if(rs.next()){
                String pwd=rs.getString(4);
                if(password.equals(pwd)){
                    String uid=rs.getString(3);
                    String name=rs.getString(1);
                    sc.setAttribute("uid",uid);
                    sc.setAttribute("name", name);
                    response.sendRedirect("home1.jsp");
                }
                else{
                    out.println("<script language='javascript'>alert( 'Invalid Password' );window.location='index.html';</script>");
                }
            }
            else{
                ptst=con.prepareStatement("select * from admins where admin_id=?");   
                uname=request.getParameter("uname");
                password=request.getParameter("pwd");
                ptst.setString(1, uname);
                rs=ptst.executeQuery();
            if(rs.next()){
                String pwd=rs.getString(2);
                if(password.equals(pwd)){
                    
                    String name=uname;
                    sc.setAttribute("uid", null);
                    sc.setAttribute("name", name);
                   response.sendRedirect("adminhome.jsp");
                }
                else{
                    out.println("<script language='javascript'>alert( 'Invalid Password' );window.location='index.html';</script>");
                }
            }
            else{
                  out.println("<script language='javascript'>alert( 'Invalid Credentials' );window.location='index.html';</script>");
                //
                out.println(uname+"  "+password);                  
             
            }
             
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
