<%-- 
    Document   : display
    Created on : 06-Jul-2022, 8:12:14 pm
    Author     : Kumar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
    <meta charset="utf-8">
    <title>Ticket Summary</title>
    <link rel="stylesheet" href="ticket.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto+Slab:wght@500&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/e4eecd86d3.js"></script>
   
    <script type="text/javascript">
        function print_ticket() {
            var prtContent = " ";
            var no = document.getElementsByClassName("row").length - 1;
            for (var i = 0; i < no; i++) {
                prtContent += document.getElementsByClassName("row")[i].innerHTML;
            }
            var WinPrint = window.open('', '', 'left=0,top=0,width=850,height=900,toolbar=0,scrollbars=0,status=0');
            WinPrint.document.write(prtContent);
            WinPrint.document.close();
            WinPrint.focus();
            WinPrint.print();
            WinPrint.close();
        }
    </script>
</head>

<body>

    <section class="header">
        <section id="nav-bar">
            <nav class="navbar navbar-expand-lg navbar-light">
                <a class="navbar-brand" href="#"><img class="img" src="travel.png">Airline reservation system</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
                    aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item">

                            <!-- <?php if(isset($_SESSION['uname'])): ?> -->

                            <a class="nav-link" id="user" href="#">

                                <!-- <?php echo "Welcome " .$_SESSION['uname']; ?></a> -->


                                <!-- <?php endif ?> -->
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="home1.jsp"><i class="fa fa-home"
                                    aria-hidden="true"></i>Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="booking.jsp"><i class="fa fa-plane"
                                    aria-hidden="true"></i>flight schedules</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#"><i class="fa fa-question-circle" aria-hidden="true"></i>about
                                us</a>
                        </li>

                        <!-- <?php if(isset($_SESSION['uname'])): ?> -->

                        <li class="nav-item">
                            <a class="nav-link" href="home1.jsp"><i class="fa fa-sign-out"
                                    aria-hidden="true"></i>Sign Out</a>
                        </li>

                        <!-- <?php else: ?> -->

                       

                        <!-- <?php endif ?> -->

                    </ul>
                </div>
            </nav>
        </section>
    </section>

    <section id="container">
        <div class="container text-center w-100">
            <h1 class="py-4 m-0 bg-primary text-light "><i class="fas fa-receipt"></i> Your Bookings</h1>
        </div>

        <div class="text-center">
            <div class="alert alert-primary" role="alert">
                Have a happy journey!! 
            </div>
        </div>

        
        
        
            <%
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
            PreparedStatement ps=con.prepareStatement("select * from passengers where bkg_id=?");
            PreparedStatement tps=con.prepareStatement("select * from booking where bkg_id=?");
            Statement del_tkt=con.createStatement();
            del_tkt.executeUpdate("delete from booking where bkg_id not in (select bkg_id from tickets)");
            String bid=request.getParameter("bid");
            ps.setString(1, bid);
            ResultSet rs=ps.executeQuery();
            tps.setString(1, bid);
            ResultSet tkt=tps.executeQuery();
            String tkt_id=null;
            String src=null;
            String dst=null;
            String tdate=null;
            if(tkt.next()){
            src=tkt.getString(6);
            dst=tkt.getString(7);
            tdate=tkt.getString(4);
            
                }
            if(rs.next()==false) {
                out.print("INVALID BOOKING");
            }
            else {
                out.println("<center><h1>Booking Id:"+bid+"</h1>");
                out.print("<table border=2px id='table'><tr><th width='150px'>Ticket id</th><th width='150px'>From</th><th width='150px'>To</th><th width='150px'>Travel date</th><th width='150px'>Name</th><th width='150px'>Mobile number</th><th width='150px'>Age</th><th width='150px'>Gender</th>");
            do{
                String b_id=rs.getString(1);
                tkt_id=rs.getString(7);
                String name=rs.getString(2);
                String numb=rs.getString(4);
                int age=rs.getInt(5);
                String gen=rs.getString(6);
              out.print("<tr><td>"+tkt_id+"</td><td>"+src+"</td><td>"+dst+"</td><td>"+tdate+"</td><td>"+name+"</td><td>"+numb+"</td><td>"+age+"</td><td>"+gen+"</td>");%>
<!--              <td><input type="button" value="download" onclick="download()"></td></tr>-->
       <%     }while(rs.next());
                out.println("</center>");
            }
            %>
    
    
<!--       <div id="ticket">
        ticket id:<%//out.println(tkt_id);%>
        travel date:<%//out.println(tdate);%>
        booking id:<%//out.println(bkg_id);%>
        booking date:<%//out.println(bdate);%>
        name:<%//out.println(name);%>
        email id:<%//out.println(email_id);%>
        age:<%//out.println(age);%>
        from:<%//out.println(src);%>
        to:<%//out.println(dest);%>
        flight id:<%//out.println(flt_id);%>
        flight name:<%//out.println(fname);%>
        arrival time:<%//out.println(atime);%>
        departure time:<%//out.println(dtime);%>
    </div>-->
    
</body>
        <script>
            
            function download(){
                var table=document.getElementById('table');
                for(var i=0;i<table.rows.length;i++){
                    table.rows[i].onclick=function(){
                       

                    };
                }
            }
            </script>
</html>
