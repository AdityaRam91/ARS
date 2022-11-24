<%-- Document : home1 Created on : 05-Jul-2022, 7:03:29 pm Author : Kumar --%>

    <%@page contentType="text/html" pageEncoding="UTF-8" %>



        <!DOCTYPE html>

        <html lang="en" dir="ltr">

        <head>
            <meta charset="utf-8">
            <title>Welcome To Airline Reservation System</title>
            <link rel="stylesheet" href="homestyle.css">
            <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
            <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
            <link rel="stylesheet"
                href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
            <!--  <script src="https://kit.fontawesome.com/e4eecd86d3.js"></script>-->
        </head>

        <body>
            <section class="header">
                <section id="nav-bar">
                    <nav class="navbar navbar-expand-lg navbar-light">
                        <!-- LOGO -->
                        <a class="navbar-brand" href="#"><img class="img" src="travel.png">Airline reservation
                            system</a>

                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
                            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarNav">
                            <ul class="navbar-nav ml-auto">
                                <li class="nav-item">


                                    <% 
                                       HttpSession sc=request.getSession();
                                       String name=(String)sc.getAttribute("name");
                                    
                                   %>


                                    <a class="nav-link" id="user" href="#">


                                         <%if(name!=null) out.println("Welcome " +name); %>


                                    </a>


                                    <!-- <?php endif ?> -->


                                </li>
                                <li class="nav-item">

                                    <a class="nav-link" href="#" style="cursor: pointer;"><i class="fa fa-home"
                                            aria-hidden="true"></i>Home</a>


                                </li>
                                <li class="nav-item">

                                    <a class="nav-link" onclick="addairport()" style="cursor: pointer;"><i class="fa fa-plane"
                                            aria-hidden="true"></i>Add Airport</a>


                                </li>

                                <li class="nav-item">
                                    <a class="nav-link" onclick="addflight()" style="cursor: pointer;"><i class="fa fa-plane"
                                            aria-hidden="true"></i>Add Flight</a>
                                </li>
                               <li class="nav-item">
                                    <a class="nav-link" onclick="addschedule()" style="cursor: pointer;"><i class="fa fa-address-card"
                                            aria-hidden="true"></i>Schedule</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" onclick="signout()" style="cursor: pointer;"><i class="fa fa-sign-out"
                                            aria-hidden="true"></i>Sign Out</a>
                                </li>

                                <!-- <?php else: ?> -->

                                <li class="nav-item">
                                    <a class="nav-link" href="index.html"><i class="fa fa-sign-in"
                                            aria-hidden="true"></i>Sign In</a>
                                </li>

                                <!-- <?php endif ?> -->

                            </ul>
                        </div>
                    </nav>
                </section>
                <video autoplay loop class="video-bg" muted plays-inline>
                    <source src="videou.mp4" type="video/mp4">
                </video>
                <div class="welcome-msg">
                    <h1>Welcome to airline reservation system</h1>
                    <p>We are a digital marketing agency that specializes in getting our clients results – from boosting
                        online
                        traffic and brand awareness, to generating qualified leads – ultimately increasing sales. Let
                        our online
                        marketing company help your business grow with successful marketing, advertising, design, and
                        website services.
                    </p>
                    
                </div>
                <img src="whitewaves.png" class="fluid">
            </section>
            <script>
                function addairport(){
                    <%
                        if(name!=null){%>
                       window.location="airport.html";
                    <%}
                    else{%>
                            alert('signin to continue');
                    //        window.location="index.html";

                    <%}%>
                }
                function addflight(){
                    <%
                        if(name!=null){%>
                       window.location="flight.html";
                    <%}
                    else{%>
                            alert('signin to continue');
                           // window.location="login.html";

                    <%}%>
                }
              
               function addschedule(){
                    <%
                        if(name!=null){%>
                       window.location="schedule.jsp";
                    <%}
                    else{%>
                            alert('signin to continue');
                           // window.location="login.html";

                    <%}%>
                }
                function signout(){
                    <%
                        if(name!=null){
                       sc.setAttribute("name",null);
                    %>
                               alert("you have logged out");
                               window.location="adminhome.jsp";
                    <%}
                    else{%>
                            alert('you have not logged in');
                            //window.location="index.html";

                    <%}%>
                }
            </script>
        </body>
        </html>