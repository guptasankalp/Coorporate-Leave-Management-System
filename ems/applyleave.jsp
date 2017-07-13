<%@ page  contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <title>EMS</title>
     <link rel="stylesheet"  href="datepicker.css">


  <script src="datepicker.js"></script>
  <script src="datepicker2.js"></script>
  <style>
 

.holiday a {
    background-color: #42B373 !important;
    background-image :none !important;
    color: #ffffff !important;
}

.sunday a {
    background-color: #FF0000 !important;
    background-image :none !important;
    color: #ffffff !important;
}
  </style>
 <script>
     $( function() {
         
        var dates = [
    [2016, 1, 15], 

    [2016, 2, 12], 

    [2016, 3, 07],

    [2016, 3, 23],

    [2016, 3, 24],

    [2016, 4, 08],

    [2016, 4, 08],

    [2016, 4, 13], 

    [2016, 4, 13], 

    [2016, 4, 14], 

    [2016, 4, 15], 

    [2016, 4, 22], 
    
    [2016, 5, 09], 

    [2016, 6, 04], 

    [2016, 7, 06], 

    [2016, 7, 19], 
    
    [2016, 8, 07], 
    
    [2016, 8, 12], 

    [2016, 8, 18], 

    [2016, 8, 25], 

    [2016, 9, 05], 

    [2016, 9, 14], 

    [2016, 9, 16], 

    [2016, 9, 30], 

    [2016, 10, 01],

    [2016, 10, 10],

    [2016, 10, 11],

    [2016, 10, 15],

    [2016, 10, 19], 

    [2016, 10, 28], 

    [2016, 10, 30], 
    
    [2016, 11, 01], 
    
    [2016, 11, 06],
    
    [2016, 11, 14], 

    [2016, 12, 10],

    [2016,12, 15 ]




];

var tips  = ['Makarsankranti / Pongal','Vasant Panchami','Maha Shivaratri','Holika Dahan','Holi','Hindi New Year ',' Telugu New Year/ Ugadi/ Gudi Padwa','  Tamil New Year',' Vaisakhi / Baisakhi / Vishu','Bengali New Year / Bihu','Ramanavami','Hanuman Jayanti','Akshaya Tritiy','Savitri Pooja','    Puri Rath Yatra','Guru Purnima ','   Nag Panchami','    Varalakshmi Vrat  ','  Raksha-Bandhan ','   Krishna Janmashtami  ','  Ganesh Chaturthi ','  Onam ','   Vishwakarma Puja ','Mahalaya Amavasya  ','  Navaratri begins   ',' Navaratri ends   ','Dusshera ','Shardad Purnima',' Karwa Chauth ','Dhanteras ',' Diwali',' Bhai Dooj ','Chhath Puja',' Kartik Poornima',' Geeta Jayanti ','Dhanu Sankranti'];

$('#datepicker').datepicker({
    beforeShowDay: function (date){
                
        var day = date.getDay();
            if (day==0)
                return [true, 'sunday'];
            else
            {   
                
                var year = date.getFullYear(), month = date.getMonth(), day = date.getDate();
                for (var i=0; i < dates.length; ++i)
                     if (year === dates[i][0] && month === dates[i][1] - 1 &&  day === dates[i][2])
                            return [true, 'holiday', tips[i]];

                    return [true];
                    
            }
        }
            
});

$('#datepicker1').datepicker({
    beforeShowDay: function (date){
                
        var day = date.getDay();
            if (day==0)
                return [true, 'sunday'];
            else
            {   
                
                var year = date.getFullYear(), month = date.getMonth(), day = date.getDate();
                for (var i=0; i < dates.length; ++i)
                     if (year === dates[i][0] && month === dates[i][1] - 1 &&  day === dates[i][2])
                            return [true, 'holiday', tips[i]];

                    return [true];
                    
            }
        }
            
});

} );
      
  </script>
 
    <script>
       			
				
       			function validation()
				{
					if(document.form2.eid.value.trim()=="")
					{
						alert("Type employee id");
						return false;
					}
					if(document.form2.pass.value.trim()=="")
					{
						alert("Type password");
						return false;
					}
					if(document.form2.startdate.value.trim()=="")
					{
						alert("Type startdate");
						return false;
					}
					if(document.form2.enddate.value.trim()=="")
					{
						alert("Type enddate");
						return false;
					}
					if(document.form2.description.value.trim()=="")
					{
						alert("Type description");
						return false;
					}
				}
     
       </script> 
    <meta name="keywords" content="" />
<meta name="description" content="" />
<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900" rel="stylesheet" />
<link href="default.css" rel="stylesheet" type="text/css" media="all" />
<link href="fonts.css" rel="stylesheet" type="text/css" media="all" />
	 </head>
     
  <body>
  <%
 	if((session.getAttribute("user")== null) || (session.getAttribute("user")== ""))
	{
 %>
 <h1><center><br>You are Not Logged<br>
<a href="index.jsp">Login Here</a></center></h1>
	 <%
     }else{
     %>
  <div id="header-wrapper">
	<div id="header" class="container">
		<div id="menu">
			<ul>
				<li class="current_page_item"><a href="employee.jsp" accesskey="1" title="">Homepage</a></li>
				<li class="current_page_item"><a href="applyleave.jsp" accesskey="3" title="">Apply Leave</a></li>
				<li class="current_page_item"><a href="editdetail.jsp" accesskey="4" title="">Edit Details</a></li>
				<li class="current_page_item"><a href="logout.jsp" accesskey="5" title="">Logout</a></li>
               
			</ul>
		</div>
		
        <div id="logo">
			<h1><a href="#">Apply For Leave</a></h1> 	
        </div>
        </div>
        </div>
        </div>
        
        <form action="applyleavecheck.jsp" method="post" name="form2">
<center>
		<table border="0" style="border-collapse:collapse;width:50%;height:150px;text-align:center;margin:50px;">
        <tr>
		<td>Emp ID</td>
		<td><span class="before" >*    </span><Input type="text" name="eid"><br /><br /></td>
		</tr>
        <td>Password</td>
		<td><span class="before" >*    </span><Input type="password" name="pass"><br /><br /></td>
		</tr>
        <tr>
		<td>Start Date</td>
		<td><span class="before" >*  </span><Input type="text" placeholder="yyyy-mm-dd"  name="startdate" id="datepicker"><br /><br /></td>
		</tr>
        <tr>
		<td>End Date</td>
		<td><span class="before" >*  </span><Input type="text" placeholder="yyyy-mm-dd"  name="enddate" id="datepicker1"><br /><br /></td>
       
       </tr>
		<tr>
		<td>Leave Type </td>
		<td>
        <select size="1" name="leavetype" contextmenu="on" dropzone="copy">
        <option value="casual">Casual Leave</option>
         <option value="sick">Sick Leave</option>
          <option value="personal">Personal Leave</option>
          <option value="others">Others...</option>
        </select>
          
        </td>
        </tr>
			
        <tr>
		<td>Description</td>
		<td><textarea rows="1" cols="2" name="description"></textarea></td>
		</tr>
		<tr>
		<td><input type="submit" value="Save"  onclick="return validation()" border="3" height="4px"></td>
		</tr>
		</table>
		</center>
		</form>
        
<div id="wrapper4">
	<div id="footer" class="container">
		<div>
			<header class="title">
				
			<ul class="contact">
			  <li><a href="#" class="icon icon-twitter"><span>Twitter</span></a></li>
				<li><a href="#" class="icon icon-facebook"><span></span></a></li>
				<li><a href="#" class="icon icon-dribbble"><span>Pinterest</span></a></li>
				<li><a href="#" class="icon icon-tumblr"><span>Google+</span></a></li>
				<li><a href="#" class="icon icon-rss"><span>Pinterest</span></a></li>
			</ul>
		</div>
	</div>
</div>
<div id="copyright">
	<p>&copy; Untitled. All rights reserved. | Photos by <a href="http://fotogrph.com/">Fotogrph</a> | Design by <a href="http://templated.co" rel="nofollow">EMS</a>.</p>
</div>
<%}%>
  </body>
        
</body>
</html>