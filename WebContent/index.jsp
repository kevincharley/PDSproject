<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">


    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>e-Ration</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"> 
    <link rel="stylesheet" href="styles/style.css">
    <link href='https://fonts.googleapis.com/css?family=Sofia' rel='stylesheet'>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>

</head>
<body>

    <header class="header-area">
         <div class="logo">
             <img src="images/small.JPG" alt="">
             <div class="navigation">
                    <nav>
                        <ul>
                            <li><a href="index.jsp">Home</a></li>
                            
                            <li><a href="">AboutUs</a></li>
                            <li><a href="">Contact</a></li>
                            <li class="dropdown"><button class="dropbtn">Login</button>
                                <div class="dropdown-content">
                                        <a href="login.jsp">e-Service </a>
                                        <a href="citizenLogin.jsp">Citizen Login</a>
                                       
                                </div>
                            </li>
                        </ul>
                    </nav>
         </div>
         <div class="line"></div>
        </div>
        
    </header>
    
    <section>
        
        <div class="bg-img">
            
                
        </div>
    </section ><br>
    <div class="line"></div>
    <!-- commodity detils card -->
    <section style="    background-color: #afaaa3;     margin-top: 5px; padding-top: 11px; ">
      
            <div class="card-types">
                    <h1>Card Types</h1>
                   <!-- <img src="5.JPG" alt=""> -->
        
                </div>
        <div class="com-details"><h3>Commodity Details</h3></div>
      <div class="container">
        <div class="row">
          <div class="col-sm-4">
            <div class="container">
              <div class="row no-gutters">
                  <div class="col-sm-3">
                          <div class="card bg-light mb-3">
                                  <div class="card-body">
                                      <div class="col-md-4">
                                          <img src="images/grain.png" class="card-img" alt="">
  
                                      </div>
                                      <div class="col-md-8">
                                              <h4 class="card-title"> Rice</h4>
                                              <p class="card-text">RS 10/- per Kg for APL cards and Rs 2/- kg for BPL Cards</p>
                                              <p class="card-text"><small class="text-muted">max 35 kg per card</small> </p>
                                      </div>
                                     
                                  </div>
                      
                              </div>
  
                  </div>
              </div>
          </div>
          <div class="container">
                  <div class="row no-gutters">
                      <div class="col-sm-3">
                              <div class="card bg-light mb-3">
                                      <div class="card-body">
                                          <div class="col-md-4">
                                              <img src="images/grain.png" class="card-img" alt="">
      
                                          </div>
                                          <div class="col-md-8">
                                                  <h4 class="card-title">Wheat</h4>
                                                  <p class="card-text">RS 2/- per Kg for BPL and Rs 5/- Kg for APL</p>
                                                  <p class="card-text"><small class="text-muted">max 35 kg per card</small> </p>
                                          </div>
                                         
                                      </div>
                          
                                  </div>
      
                      </div>
                  </div>
              </div>
              <div class="container">
                      <div class="row no-gutters">
                          <div class="col-sm-3">
                                  <div class="card bg-light mb-3">
                                          <div class="card-body">
                                              <div class="col-md-4">
                                                  <img src="images/grain.png" class="card-img" alt="">
          
                                              </div>
                                              <div class="col-md-8">
                                                      <h4 class="card-title"> Sugar</h4>
                                                      <p class="card-text">RS 5/- per Kg for BPL and Rs 15/- per kg for APL</p>
                                                      <p class="card-text"><small class="text-muted">max 35 kg per card</small> </p>
                                              </div>
                                             
                                          </div>
                              
                                      </div>
          
                          </div>
                      </div>
                  </div>
                
          </div>
          <div class="col-sm-4">

          </div>
          <!-- card types -->
          <div class="col-sm-4">
            <div class="container" style="width: auto;">
              <div class="card" style="width:400px; margin-top: 21px;">
                <img class="card-img-top" src="images/c1.jpg" alt="Card image" style="width:100%">
                <br>
                <div class="card-body">
                  <h4 class="card-title">Card Types are APL & BPL</h4>
                  <p class="card-text"> The two types of cards in PDS catagorized on the basic of income. </p>
                  
                </div>
              </div>
          </div>
          </div>
        </div>
      </div>
       

    </section>
    <!-- footer section -->
    <footer class="site-footer">
      <div class="container">
        <div class="row">
          <div class="col-sm-12 col-md-6">
            <h6>About</h6>
            <p class="text-justify">PDS <i>OR </i> 
                 Food and Public Distribution to distribute food and non-food items to India's poor at subsidised rates. 
                This scheme was first started in February 1944, during the Second World War, and was launched in the current form in June 1947.
                 Major commodities distributed include staple food grains, such as wheat, rice and sugar , through a 
                 network of fair price shops  established in several states across the country. Food Corporation of India, a
                  Government-owned corporation, procures and maintains the PDS(public distribution system).</p>
          </div>

          <div class="col-xs-6 col-md-3">
            <h6>Services</h6>
            <ul class="footer-links">
              <li><a href="#">e-Services Login</a></li>
              <li><a href="#">Dept.of Food-Govt. of India</a></li>
              <li><a href="#">End-to-End Computerisation</a></li>
              <li><a href="#">Annapoorna Scheme</a></li>
              <li><a href="#">Viability of FPS</a></li>
              
            </ul>
          </div>

          <div class="col-xs-6 col-md-3">
            <h6>Quick Links</h6>
            <ul class="footer-links">
              <li><a href="#">About Us</a></li>
              <li><a href="#">Contact Us</a></li>
              <li><a href="#">Contribute</a></li>
              <li><a href="#">Privacy Policy</a></li>
              <li><a href="#">Sitemap</a></li>
            </ul>
          </div>
        </div>
        <hr>
      </div>
      <div class="container">
        <div class="row">
          <div class="col-md-8 col-sm-6 col-xs-12">
            <p class="copyright-text">Copyright &copy; 2019 All Rights Reserved by 
         <a href="#">Hex Clan</a>.
            </p>
          </div>

          <div class="col-md-4 col-sm-6 col-xs-12">
            <ul class="social-icons">
              <li><a class="facebook" href="#"><i class="fa fa-facebook"></i></a></li>
              <li><a class="twitter" href="#"><i class="fa fa-twitter"></i></a></li>
              <li><a class="dribbble" href="#"><i class="fa fa-dribbble"></i></a></li>
              <li><a class="linkedin" href="#"><i class="fa fa-linkedin"></i></a></li>   
            </ul>
          </div>
        </div>
      </div>
</footer>
</body>
</html>
