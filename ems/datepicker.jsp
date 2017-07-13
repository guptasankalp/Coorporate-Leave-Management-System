<%-- 
    Document   : datepicker
    Created on : 12 Aug, 2016, 5:13:11 PM
    Author     : root
    @master    : sankalp gupta
                 JECRC
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
 /* $( function() {
    $( "#datepicker" ).datepicker({
        beforeshowday : function(date)
        {
            var day = date.getDay();
            
                if(day==2)
                {
                    return [false, 'ui-state-highlight ui-state-deactive'];
                }
                else
                {
                    return [true];
                }
            
                     
        }
    });
    
  } );*/
  </script>
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
} );
      
  </script>
  <script>
 /*$( function() {
  var dates = [
    [2016, 9, 12],
    [2016, 8, 12],
    [2016, 8, 25]
 
];
var tips  = ['some description','some other description','some other description']; 

$('#datepicker').datepicker({
    beforeShowDay: function (date){
        var year = date.getFullYear(), month = date.getMonth(), day = date.getDate();

       
        for (var i=0; i < dates.length; ++i)
        {   if (year === dates[i][0] && month === dates[i][1] - 1 &&  day === dates[i][2])
            return [true , 'event', tips[i]];
            else
            return[true];
         }   
        }
});
 } );*/
  </script>
  <script>
     /* 
$(document).ready(function() {

    var dates = ['22/07/2016', '23/08/2016','23/09/2016','23/10/2016','23/11/2016']; //
            //tips are optional but good to have
    var tips  = ['some description','some other description','some other description','some other description','some other description'];      

    $('#datepicker').datepicker({                
        dateFormat: 'dd/mm/yy',
        beforeShowDay: highlightDays,
        showOtherMonths: true,
        numberOfMonths: 3,
    });

    function highlightDays(date) {
        for (var i = 0; i < dates.length; i++) {
            if (new Date(dates[i]).toString() == date.toString()) {              
                return [false,'ui-state-highlight ui-state-active', tips[i]];
            }
        }
        return [true, ''];
     } 

});*/
</script>
   
  
  
  
</head>
<body>
 
<p>Date: <input type="text" id="datepicker"></p>
 
 
</body>
</html>
