<%-- 
    Document   : schedule
    Created on : 29-Jun-2022, 9:27:37 pm
    Author     : Kumar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
                 Class.forName("com.mysql.cj.jdbc.Driver");
                 Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
%>
<!DOCTYPE html>
<!DOCTYPE html>
<html>

<head>
    <title>Welcome To Registration Form</title>
</head>

<body>
    <!-- Main div code -->
    <div id="main">
        <div class="h-tag">
            <h2>Create a Schedule</h2>
        </div>
        <!-- create account div -->
        <form action="NewSchedule" method="post">
            <div class="login">
                <table cellspacing="2" align="center" cellpadding="8" border="0">
                    <tr>
                        <td align="right">Enter Flight Id :</td>
                        <td>
                            <select class="tb" name="flt_id" required>
                                <%
                                    Statement stmt=con.createStatement();
                                    ResultSet rs=stmt.executeQuery("select flt_id from flight order by flt_id");
                                    while(rs.next()){
                                    String fid=rs.getString(1);
                                    out.println("<option>"+ fid+" </option>");
                                    }
                                %>
                            </select>
                        </td>
                    </tr>
    
                 <!--       <tr>
                        <td align="right">Flight Name :</td>
                        <td>
                            <select class="tb" name="fid">
                            <option>--choose city--</option>
                            <%
                                String fid=request.getParameter("fid");
                                String fname=null;
                                PreparedStatement ptst=con.prepareStatement("select flt_name from flight where flt_id=?");
                                ptst.setString(1,fid);
                                rs=ptst.executeQuery();
                                if(rs.next())fname=rs.getString(1);
                                out.println("<option>"+fname+"</option>");
                            %>
                            </select>
                        </td>
                    </tr>
                  -->
                    <tr>
                        <td align="right">From City :</td>
                        <td>
                            <select class="tb" name="src" required>
                                <option>--choose city--</option>
                                <%
                                    rs=stmt.executeQuery("select * from airport order by city");
                                    while(rs.next()){
                                    String city=rs.getString(3);
                                    String cid=rs.getString(1);
                                    out.println("<option value= "+ cid +">"+ city +" </option>");
                                    }
                                %>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">To City :</td>
                        <td>
                            <select class="tb" name="dest" required>
                                <option>--choose city--</option>
                                <%
                                    rs=stmt.executeQuery("select * from airport order by city");
                                    while(rs.next()){
                                    String city=rs.getString(3);
                                    String cid=rs.getString(1);
                                    out.println("<option value= "+ cid +">"+ city +" </option>");
                                    }
                                %>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">Select Departure Date :</td>
                        <td>
                            <input type="date" id="date" class="tb" name="dep_date" required/>
                        </td>
                    </tr>

                    <tr>
                        <td align="right">First Class Price :</td>
                        <td>
                            <input type="number" placeholder="Enter Amount" class="tb" name="famt" required/>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">Business Class Price :</td>
                        <td>
                            <input type="number" placeholder="Enter Amount" class="tb" name="bamt" required/>
                        </td>
                    </tr>
                    <tr>
                    <td align="right">Enter Arrival Time :</td>
                    <td><input type="time" name="arrival_time" required/></td>
                    </tr>
                    <tr>
                        <td align="right">Enter Departure Time :</td>
                        <td><input type="time" name="departure_time" required/></td>
                    </tr>
                    <tr>
                        <td align="center"><input type="reset" value="Clear Form" id="res" class="btn" /></td>
                        <td align="center">
                            <input type="submit" value="Create Schedule" class="btn" />
                        </td>
                    </tr>
                </table>
            </div>
            <!-- create account box ending here.. -->
        </form>
    </div>
    <!-- Main div ending here... -->
</body>
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
<style>
    body {
        margin: 0px;
        background-color: lightblue;
        background-image: url(image/background.jpg);
        color: #f9fcf5;
        font-family: Arial, Helvetica, sans-serif;
    }

    #main {
        width: 600px;
        height: auto;
        overflow: hidden;
        padding-bottom: 20px;
        margin-left: auto;
        margin-right: auto;
        border-radius: 5px;
        padding-left: 10px;
        margin-top: 30px;
        border-top: 3px double #f1f1f1;
        border-bottom: 3px double #f1f1f1;
        padding-top: 20px;
    }

    #main table {
        font-family: "Comic Sans MS", cursive;
    }

    /* css code for textbox */
    #main .tb {
        height: 28px;
        width: 230px;
        border: 1px solid #f26724;
        color: #fd7838;
        font-weight: bold;
        border-left: 5px solid #f7f7f7;
        opacity: 0.9;
    }

    #main .tb:focus {
        height: 28px;
        border: 1px solid #f26724;
        outline: none;
        border-left: 5px solid #f7f7f7;
    }

    /* css code for button*/
    #main .btn {
        width: 150px;
        height: 32px;
        outline: none;
        color: #f7f7f7;
        font-weight: bold;
        border: 0px solid #f26724;
        text-shadow: 0px 0.5px 0.5px #fff;
        border-radius: 2px;
        font-weight: 600;
        color: #f26724;
        letter-spacing: 1px;
        font-size: 14px;
        background-color: #f1f1f1;
        -webkit-transition: 1s;
        -moz-transition: 1s;
        transition: 1s;
    }

    #main .btn:hover {
        background-color: #f26724;
        outline: none;
        border-radius: 2px;
        color: #f1f1f1;
        border: 1px solid #f1f1f1;
        -webkit-transition: 1s;
        -moz-transition: 1s;
        transition: 1s;
    }
</style>

</html>