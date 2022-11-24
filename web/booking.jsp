<%-- 
    Document   : index.jsp
    Created on : 28-Jun-2022, 6:06:09 pm
    Author     : Kumar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        .head {
    text-align: center;
    background-color: lightgray;
    padding:-10px;
    border-radius: 10px;
}

.head .left {
    position: absolute;
    left: 25px;
    top: 30px;
    height: 40px;
}


.head .center {
    display: inline-block;
}

.head .right {
    position: absolute;
    height: 40px;
    right: 25px;
    top: 30px;
}
.block{
    border:0.5px solid lightgrey;
    border-radius: 10px;
    padding:10px 5px 10px 5px;
    display: flex;
    flex-direction: row;
    justify-content: space-between;
    margin:60px 20px;
    font-size: 25px;
}
.block select,.block input[type="date"]{
     margin-left: -60px; 
    margin-top: 25px;
}
 .block input[type="button"]{
    margin:  auto 0px; 
    padding: 5px 16px;
} 
th{
    width:130px;
}
body{
background-color: lightblue;
}
    </style>
</head>
<body>
    <header class="head">
        <a href="home1.jsp"> <img class="left" src="travel.png" alt="logo"></a>
        <h1 class="center" style="color: red; font-family:Cambria Math">airline booking</h1>
        <a href="home1.jsp"><img class="right" src="travel.png" alt="left"></a>
    </header>
    <div class="middle" align="center">
        <p style="font-size:25px;">Book Your Tickets</p>
    </div>
    <form class="block" action="Search">
        <label for="src" class="from">From City</label>
        <select name="src" id="src" class="from">
            <option>--choose city--</option>
           
            <%
                 Class.forName("com.mysql.cj.jdbc.Driver");
                 Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
                 Statement stmt=con.createStatement();
                 ResultSet rs=stmt.executeQuery("select apt_id,city from airport order by city");
                 String id,city;
                 while(rs.next()){
                 id=rs.getString(1);
                 city=rs.getString(2);
                 out.println("<option val="+id+">" +city+ "</option>");
                }%>
            
        </select>
        <label for="dest" class="to">To City</label>
        <select name="to" id="dest" class="to">
            <option>--choose city--</option>
            
            <%
            
                 rs=stmt.executeQuery("select apt_id,city from airport order by city");
               
                 while(rs.next()){
                 id=rs.getString(1);
                 city=rs.getString(2);
                 out.println("<option val="+id+">" +city+ "</option>");
                }%>
                
        </select>
        <label for="date">Date</label>
        <input type="date" id="date" name="date">
        <input type="submit" value="search">
    </form>
                
<!--                <a href="adminhome.jsp">Home</a>-->
                
                
                <script>
                    var today = new Date();
var dd = today.getDate();
var mm = today.getMonth()+1; //January is 0 so need to add 1 to make it 1!
var yyyy = today.getFullYear();
if(dd<10){
  dd='0'+dd
} 
if(mm<10){
  mm='0'+mm
} 

today = yyyy+'-'+mm+'-'+dd;
document.getElementById("date").setAttribute("min", today);
                    </script>
              
</body>
</html>