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
                                       String fname=(String)sc.getAttribute("name");
                                       String uid=(String)sc.getAttribute("uid");
                                     
                                   %>


                                    <a class="nav-link" id="user" href="#">


                                         <%if(fname != null) out.println( "Welcome " +fname); %> 


                                    </a>




                                </li>
                                <li class="nav-item">

                                    <a class="nav-link" href="#"><i class="fa fa-home"
                                            aria-hidden="true"></i>Home</a>


                                </li>
                                <li class="nav-item">

                                    <a class="nav-link"  onclick="booknow()" style="cursor: pointer;"><i class="fa fa-plane"
                                            aria-hidden="true"></i>flight
                                        schedules</a>


                                </li>



                                <li class="nav-item">
                                    <a class="nav-link" onclick="getticket()" style="cursor: pointer;"><i class="fas fa-receipt"
                                            aria-hidden="true"></i>Get Ticket</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" onclick="cancelticket()" style="cursor: pointer;"><i class="fas fa-receipt"
                                            aria-hidden="true"></i>Cancel Ticket</a>
                                </li>

                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" onclick="signout()" style="cursor: pointer;"><i class="fa fa-sign-out"
                                            aria-hidden="true"></i>Sign Out</a>
                                </li>


                                <li class="nav-item">
                                    <a class="nav-link" href="index.html"><i class="fa fa-sign-in"
                                            aria-hidden="true"></i>Sign In</a>
                                </li>


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
                    <a onclick="booknow()" class="btn btn-book">Book Now</a>
                </div>
                <img src="whitewaves.png" class="fluid">
            </section>



            <section id=bestsellers>
                <h3>Our Bestsellers</h3>
                <div class="row justify-content-center">
                    <div class="col-md-3">
                        <div class="card shadow ">
                            <div class="inner">
                                <img class="card-img-top" src="temple.jpg" alt="">
                            </div>
                            <div class="card-body text-center">
                                <h5>Chennai</h5>
                                <p>Chennai, on the Bay of Bengal in eastern India, is the capital of the state Tamil
                                    Nadu. The city is home to Fort St.George, built in 1644 and now a museum showcasing
                                    the city’s roots as a British military garrison and East India Company trading
                                    outpost, when it was called Madras. Religious sites include Kapaleeshwarar Temple,
                                    with carved and painted gods, and St. Mary’s, a 17th-century Anglican
                                    church.</p>


                                <a onclick="booknow()" class="btn btn-primary">Book Now</a>


                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="card shadow">
                            <div class="inner">
                                <img class="card-img-top" src="kerala.jpg" alt="">
                            </div>
                            <div class="card-body text-center">
                                <h5>Kerala</h5>
                                <p>Kerala, a state on India's tropical Malabar Coast, has nearly 600km of Arabian Sea
                                    shoreline. It's known for its palm-lined as a network of canals. Inland are the
                                    Western Ghats, mountains whose slopes support tea, coffee and spice plantations as
                                    well as wildlife. National parks like Eravikulam and Periyar, plus Wayanad and other
                                    sanctuaries, are home to elephants, langur monkeys and tigers.</p>


                                <a onclick="booknow()" class="btn btn-primary">Book Now</a>


                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="card shadow ">
                            <div class="inner">
                                <img class="card-img-top" src="Mumbai.jpg" alt="">
                            </div>
                            <div class="card-body text-center">
                                <h5>Mumbai</h5>
                                <p>Mumbai (formerly called Bombay) is a densely populated city on India’s west coast. A
                                    financial center, it's India's largest city. On the Mumbai Harbour waterfront stands
                                    the iconic Gateway of India stone arch, built by the British Raj in 1924. Offshore,
                                    nearby Elephanta Island holds ancient cave temples dedicated to the Hindu god Shiva.
                                    The city's also famous as the heart of the Bollywood film industry.</p>

                                <a onclick="booknow()" class="btn btn-primary">Book Now</a>


                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="card shadow">
                            <div class="inner">
                                <img class="card-img-top" src="kashmir.jpg" alt="">
                            </div>
                            <div class="card-body text-center">
                                <h5>Kashmir</h5>
                                <p>Jammu and Kashmir, union territory of India (until October 31, 2019, a state),
                                    located in the northern part of the Indian subcontinent centred on the plains around
                                    Jammu to the south and the Vale of Kashmir to the north. The union territory is part
                                    of the larger region of Kashmir, which has been the subject of dispute between
                                    India, Pakistan, and China since the partition of the subcontinent in 1947.</p>
                                <a onclick="booknow()" class="btn btn-primary">Book Now</a>
                            </div>
                        </div>
                    </div>
                </div>
                
            </section>

        <script>
                function booknow(){
                    <%
                        if(fname!=null){%>
                      
                       window.location="booking.jsp";
                    <%}
                    else{%>
                            alert('signin to continue');
                            window.location="index.html";

                    <%}%>
                }
                function getticket(){
                    <%
                        if(fname!=null){%>
                       window.location="ticket.html";
                    <%}
                    else{%>
                            alert('signin to continue');
                            window.location="index.html";

                    <%}%>
                }
                function cancelticket(){
                    <%
                        if(fname!=null){%>
                       window.location="cancel.html";
                    <%}
                    else{%>
                            alert('signin to continue');
                            window.location="index.html";

                    <%}%>
                }
                function signout(){
                    <%
                        if(fname!=null){
                       sc.setAttribute("name",null);
                    %>
                               alert("you have logged out");
                               window.location='home1.jsp';
                    <%}
                    else{%>
                            alert('you have not logged in');
                            window.location="index.html";

                    <%}%>
                }
            </script>                   
        </body>
        </html>