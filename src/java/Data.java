/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.sql.*;
import java.time.format.DateTimeFormatter;  
import java.time.LocalDateTime;
/**
 *
 * @author Kumar
 */
public class Data extends HttpServlet {

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
           Class.forName("com.mysql.cj.jdbc.Driver");
           PrintWriter out=response.getWriter();
           Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
           Statement stmt=con.createStatement();
           PreparedStatement ps=con.prepareStatement("insert into booking(bkg_id,bdate,flt_id,tdate,class,src,dest,uname) values(?,?,?,?,?,?,?,?)");
           PreparedStatement psg=con.prepareStatement("insert into passengers(bkg_id,pname,eid,mobile,age,gender) values(?,?,?,?,?,?)");
           PreparedStatement amt=con.prepareStatement("select * from schedules where flt_id=? and src=? and dest=? and dep_date=?");
           PreparedStatement cityid=con.prepareStatement("select apt_id from airport where city=?");
           HttpSession sc=request.getSession();
           DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");  
           LocalDateTime now = LocalDateTime.now();  
           String bdt=dtf.format(now); 
           String uname=(String)sc.getAttribute("uid");
           if(uname == null){
               out.println("<script>alert('signin to continue');window.location='index.html'</script>");
           }
           int id=1;
           int psg_count=0;
           int amount=0;
           String srcid=null;
           String destid=null;
           String bid="22AB";
           String s=null;
           stmt.executeUpdate("delete from booking where bkg_id not in (select bkg_id from tickets)");
           ResultSet rs=stmt.executeQuery("select bkg_id from booking order by bkg_id desc limit 1;");
           if(rs.next()){
               s=rs.getString(1);
               s=s.replaceFirst("22","");
               s=s.replaceAll("[^0-9]","");
               id=Integer.parseInt(s)+1;
           }
           s=String.format("%03d", id);
           bid+=s;
           String src=request.getParameter("src");
           String dest=request.getParameter("dest");
           String fid=request.getParameter("fid");
           String tdate=request.getParameter("tdate");
           String Class=request.getParameter("Class");
           
           ps.setString(1, bid);
           ps.setString(2, bdt);
           ps.setString(3, fid); 
           ps.setString(4, tdate); 
           ps.setString(5, Class);
           ps.setString(6, src);
           ps.setString(7, dest);
           ps.setString(8, uname);
           ps.executeUpdate();
           
           cityid.setString(1, src);
           ResultSet cid=cityid.executeQuery();
           if(cid.next())srcid=cid.getString(1);
           cityid.setString(1, dest);
           cid=cityid.executeQuery();
           if(cid.next())destid=cid.getString(1);
           amt.setString(1,fid);
           amt.setString(2,srcid);
           amt.setString(3,destid);
           amt.setString(4,tdate);
           ResultSet price=amt.executeQuery();
         //  System.out.println(fid+srcid+destid+tdate);
           if(price.next()){
            //   System.out.println(Class);
               if(Class.equals("First")){
             //      System.out.println(price.getInt(5));
                   amount=price.getInt(5);
               }
           else if(Class.equals("Business")){
               System.out.println(price.getInt(6));
               amount=price.getInt(6);
           }
           }
        //   String src=request.getParameter("src");
        //   String to=request.getParameter("to");
           String names[]=request.getParameterValues("names");
           String mails[]=request.getParameterValues("mails");
           String number[]=request.getParameterValues("number");
           String ages[]=request.getParameterValues("age");
           String genders[]=request.getParameterValues("gender");
           int age;
           int sz=names.length,i;
           for(i=0;i<sz;i++){
               age=Integer.parseInt(ages[i]);
               psg.setString(1,bid);
               psg.setString(2, names[i]);
               psg.setString(3,mails[i]);
               psg.setString(4, number[i]);
               psg.setInt(5,age);
               psg.setString(6,genders[i]);
               psg.executeUpdate();
               psg_count++;
           }
           amount*=psg_count;
          HttpSession s1=request.getSession();
          s1.setAttribute("bid",bid);
          s1.setAttribute("amount",amount+"");
          response.sendRedirect("payment.jsp");
           con.close();
           ps.close();
        }
        catch(Exception e){
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
