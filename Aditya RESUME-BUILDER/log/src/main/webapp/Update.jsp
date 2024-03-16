<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="ral.DB.DBconnection"%>
<%@page import="ral.dao.ResumeDAO"%>
<%
Statement statement = null;
ResultSet resultSet = null;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Welcome</title>
<script src="http://localhost:8080/log/JQuery/jquery-3.6.0.min.js"></script>
<script src="http://localhost:8080/log/JQuery/jquery-ui.js"></script>
<script src="http://localhost:8080/log/JQuery/query.validate.min.js"></script>
<script>
     function showresume(){
        var main=document.querySelector(".main");
        if(main.style.display="none"){
            main.style.display="block";
        }
        else{
            main.style.display="block";
        }
    } 
     let curTab = 0;
     function showforms(n){
         var form = document.getElementsByClassName("content");
         var btn = document.getElementsByClassName("leftbtn");
         form[curTab].style.display="none";
         btn[curTab].style.backgroundColor="";
         form[n].style.display="block";
         btn[n].style.backgroundColor="rgba(94, 241, 217, 0.767)";
         curTab=n;
      }
    function showDept(){
        var degree=document.querySelector('.degree').value;
        var Dept=document.getElementsByClassName('Dept');
        if(degree==='B.Tech'){
            Dept[0].style.display="block";
            Dept[1].style.display="none";
            Dept[2].style.display="none";
    }
    else if(degree==='B.Arts'){
        Dept[0].style.display="none";
        Dept[1].style.display="block";
        Dept[2].style.display="none";
    }
    else if(degree==='B.Sc'){
        Dept[0].style.display="none";
        Dept[1].style.display="none";
        Dept[2].style.display="block";
    }
    }
    $(document).ready(function(){ 
    	//personal details validation
    $("#personalNextBtn").click(function(){
		shakeValidate(".right-contents-form1");
	});
	
	$(".right-contents-form1").find('input').on('focus keyup',function(){
		colorIndecation($(this));
	});
	
	$(".right-contents-form1").find('input').on('change',function(){
		changeOnRemove($(this));
	});
	
	//educational details validation
    $("#eduNextBtn").click(function(){
		shakeValidate(".right-contents-form2");
	});
	
	$(".right-contents-form2").find('input,select').on('focus keyup',function(){
		colorIndecation($(this));
	});
	
	$(".right-contents-form2").find('input,select').on('change',function(){
		changeOnRemove($(this));
	});
	//error shake and validation 
	function shakeValidate(shakeSelector){
			var flag=true;
		$(shakeSelector).find('input').each(function(){
  			/* console.log($(this).is(':valid')); */
  			  if((!($(this).is(':valid') && !$(this).is('required'))) ){
  				$(this).effect('shake',{times: 2}, 700); 
  				$(this).css('border-color','#ff0000');
  				flag=false;
  			  }
  		 });
  		 if(flag) showforms(curTab+1);
	}
    });
</script>
<style>
hr {
  border: 2px solid #f1f1f1;
  margin-bottom: 25px;
}

    .navbar {
        
      border-style: solid; 
        overflow: hidden;
  /* background-color:#a9f5df; */
 
}
.navbar a{
font-family: Arial, Helvetica, sans-serif;
    color:rgb(88, 88, 36);
    font-size:30px;
    text-decoration: none;
}
button{
    border-radius: 50px;
    padding:11px;
}

.v{
    border-left: 8px solid rgb(59, 30, 30);
 
    height: 550px;
    position:absolute;
    left:15%;
    margin-left:33px;
}
.pd {
   color:white;
   padding:10px;
   font-size: 18px;
}
.main{ 
    
   /*  background-color: rgb(242,243,243); */
    border-style: ;
    width: 100%;
    height: 800px;
}
.main .left{ 

    padding-left: 0px;
    float:left;
    border-style: none;
}
.main .right{
    float: ;
    width: ;
    padding-right: 20px;
    padding-left: 200px;
    border-style: none; 
   /*  position:absolute;
    top:10%;
    left:35%;
    transform; translate(-80%,-50%);
    border-style: dotted;
     padding-right: 100px; */
}
#name{
        width:calc(200px);
         height:calc(30px);
         margin-right: 20px;

    }
    #email{
        width:calc(200px);
         height:calc(30px);
         margin-right: 20px;
         margin-top: 40px;
    }
    #wl{
        width:calc(200px);
         height:calc(30px);
         margin-right: 20px;
        margin-top: 40px;
    }
 .content{
     margin-right: 200px;
        float: right;
        padding-left: 150px;
        /* background-color: rgb(142, 163, 131); */
    }
   

    
   button{
    border-radius: 50px;
    padding:12px;
    color:#121112;
    background-color:#3eb9e6;
   margin-top: 19px;
   }
   .b{
       padding-left: 80px;
       padding-top: 5%;
   }
   .first{
       padding-right: 50px;
   }
   
   #rb{
    background:none;border: none; color:rgb(88, 88, 36);
        font-size:30px;
   }
  input:focus{
   outline:none;
   }
    #list ul li{
   display:inline;
   width:calc(100%/2 -10px);
   }

</style>
</head>
<body style="background-image:url('http://localhost:8080/log/image/wall.jpg') ;">


  
     <form action="Res.jsp" method="post">
     <%
try{
	Connection con = DBconnection.getConn();
statement=con.createStatement();
String sql ="select * from resume where user_name='"+ResumeDAO.user+"';";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
     <div class="main" style="display:block;" >

        <div class="left">
            <button type="button"onmouseup="showforms(0)" class="leftbtn" style="padding-left:38px;padding-right:38px">Personal Details</button>  <br> 
            <button type="button"onmouseup="showforms(1)" class="leftbtn" style="padding-left:30px;padding-right:32px">Educational Details</button> <br> 
            <button type="button"onmouseup="showforms(2)" class="leftbtn" style="padding-left:26px;padding-right:26px">Project Development</button> <br> 
            <button type="button"onmouseup="showforms(3)" class="leftbtn" style="padding-left:32px;padding-right:32px">Experience Details</button> <br> 
            <button type="button"onmouseup="showforms(4)" class="leftbtn" style="padding-left:47px;padding-right:47px">Extra Details</button> 
        </div>
        <div class="right">
            <div class="content" style="display: block;">
              <div class="right-contents-form1">
                <h1 style="padding-left: 50px;">Personal Details</h1>
                <div class="first">
                 <input type="text" name="user_name" <%out.print( "value=\""+ResumeDAO.user+"\""); %> hidden>
                    <input type="text" id="name" pattern="^[a-zA-Z]*$" 
                        placeholder="First Name *" name="first_name"  value="<%=resultSet.getString("first_name") %>" required>
                        <input type="text" id="name" pattern="^[a-zA-Z]*$" 
                        placeholder="Last Name " name="last_name"  value="<%=resultSet.getString("last_name") %>" >
                </div>
                <div class="first">
                   
                     <input type="text" id="email" pattern="^([a-zA-z_+%]+@[a-z]+\.[a-z]{2,4})$" placeholder="Email *"
                         name="email"  value="<%=resultSet.getString("email") %>" required>
                        <input type="number" id="email"  pattern="^[0-9]{10-15}$"
                        placeholder="Phone Number *" name="phone_number"  value="<%=resultSet.getString("phone_number") %>" required>
                </div>
                <div class="first">
                    <input type="text" id="wl" 
                       placeholder="Your Website " name="website"  value="<%=resultSet.getString("website") %>">
                       <input type="text" id="wl" 
                       placeholder="Linked In " name="linked_in" value="<%=resultSet.getString("linked_in") %>">
               </div>
               </div>
               <div class="b" style="padding-left: 200px;">
                <button type="button" id="personalNextBtn" style="padding-left:25px;padding-right:25px">Next</button>        
            </div>
            
            
            </div>
       
     <div class="content"  style="display:none">
        <h1 style="padding-left: 100px; ">Educational Details</h1>
         <div class="right-contents-form2">
        <div class="first" style="padding-bottom: 3px;">
        <div style="padding-left:50px;">
            <input type="text" id="name"  pattern="^[a-zA-Z]*$" 
                placeholder="College/University *" name="college" value="<%=resultSet.getString("college") %>" required>
               </div> <div style="padding-left:50px; padding-top: 20px;">
                <input id="name" type="text" placeholder="Joining date" onfocus="(this.type='date')" onblur="if(this.value==''){this.type='text'}" name="college_joining_date"  value="<%=resultSet.getString("college_joining_date") %>">
                <input id="name" type="text" placeholder="Completion date" onfocus="(this.type='date')" onblur="if(this.value==''){this.type='text'}" name="college_completion_date" value="<%=resultSet.getString("college_completion_date") %>">
            </div>
            <div id="list" style="padding-left:15px;"><ul>
            <%String course = resultSet.getString("college_qualification"); %>
                <li style="list-style:none; outline: none;border-color: green;">
                
                    <select name="college_qualification"  id="name" class="degree" >
                     <option value="<%=resultSet.getString("college_qualification") %>" selected  hidden><%out.print(course);%></option> 
                    <option value="B.Tech">B.Tech</option> 
                    <option value="B.Arts">B.Arts</option> 
                    <option value="B.Sc">B.Sc</option> 
                    </select></li>
                     <%String dept = resultSet.getString("college_description"); %>
                <li style="list-style:none; outline: none;border-color: green;">
                    <select name="college_description" value="<%=resultSet.getString("college_description") %>"  id="name" onfocus="showDept()" >
                    <option value="<%=resultSet.getString("college_description") %>" selected  hidden><%out.print(dept);%></option> 
                    <optgroup class="Dept" label="B.TECH" style="display:none;">
                        <option value="CSE">CSE</option>
                        <option value="ECE">ECE</option>
                        <option value="IT">IT</option>
                        <option value="MECH">MECH</option>
                        <option value="CIVIL">CIVIL</option>
                      </optgroup> 
                      <optgroup class="Dept" label="B.ARTS" style="display:none;" >
                        <option value="English">English</option>
                        <option value="Psychology">Psychology</option>
                        <option value="Archaeology">Archaeology</option>
                        <option value="Music">Music</option>
                        <option value="Social Work">Social Work</option>
                      </optgroup> 
                      <optgroup class="Dept" label="B.Sc" style="display:none;">
                        <option value="Statistics">Statistics</option>
                        <option value="Mathematics">Mathematics</option>
                        <option value="Microbiology">Microbiology</option>
                        <option value="Biotechnology">Biotechnology</option>
                        <option value="Botany">Botany</option>
                      </optgroup> 
                    </select></li></ul>
                </div>
        </div>
        <hr>
        <div class="first">
        <div style="padding-left:50px;padding-bottom:20px;">
            <input type="text" id="name"  pattern="^[a-z A-Z ]*$" 
                placeholder="School *" name="school" value="<%=resultSet.getString("school") %>">
                </div> 
                 <div  style="padding-left:50px;" >
                <input id="name" type="text" placeholder="Joining date" onfocus="(this.type='date')" onblur="if(this.value==''){this.type='text'}" name="school_joining_date" value="<%=resultSet.getString("school_joining_date") %>">
                <input id="name" type="text" placeholder="Completion date" onfocus="(this.type='date')" onblur="if(this.value==''){this.type='text'}" name="school_completion_date" value="<%=resultSet.getString("school_completion_date") %>">
            </div>
            <div id="list" style="padding-left:10px;"><ul >
             <%String board = resultSet.getString("school_qualification"); %>
                    <li  style="list-style:none; outline: none; padding-right: 15px;border-color: green;" >
                        <select  name="school_qualification"  id="name">
                            <option value="<%=resultSet.getString("school_qualification") %>" selected  hidden><%out.print(board);%></option> 
                            <option value="CBSE" >CBSE</option> 
                            <option value="ICSE">ICSE</option> 
                            <option value="NIOS">NIOS</option> 
                            <option value="STATE BOARD">STATE BOARD</option> </select></li>
            <%String stream = resultSet.getString("school_description"); %>
                    <li style="list-style:none; outline: none;border-color: green;"><select name="school_description"  id="name">
                            <option value="<%=resultSet.getString("school_description") %>" selected  hidden><%out.print(stream);%></option> 
                            <option value="SCINCE">SCINCE</option> 
                            <option value="ARTS">ARTS</option> 
                            <option value="COMMERCE">COMMERCE</option> 
                             </select></li>
                                </ul>
        </div>
    </div>
       </div>
       <div class="b" style="padding-left: 200px; margin-top:-30px">
        <button type="button" onmouseup="showforms(0)">Previous</button> 
        <button type="button" id="eduNextBtn" style="padding-left:25px;padding-right:25px">Next</button>        
    </div>
    
    
    </div>
    <div class="content"style="margin-right:200px;  display:none">
    <div style=" margin-right: 100px;
        float: right;
        padding-left: 150px">
        <h1 style="padding-left: 10px;">Project Developed</h1>
        <div class="first">
            <input type="text" id="name" style="padding-right:100px"
                placeholder="Title " name="project_title" value="<%=resultSet.getString("project_title") %>">
        </div>
        <div class="first">
         <input type="text " id="email" style="padding-right:100px"
                placeholder="Link " name="project_link" value="<%=resultSet.getString("project_link") %>" >
        </div>
        <div class="first">
            <input type="text" id="wl" style="padding-right:100px"
               placeholder="Description   " name="project_description" value="<%=resultSet.getString("project_description") %>">
       </div>
       <div class="b" style="padding-left: 200px;" >
       
        <button style=" margin-left:-120px" type="button" onmouseup="showforms(1)">Previous</button> 
        <button type="button" onmouseup="showforms(3)" style="padding-left:25px;padding-right:25px">Next</button> 
            </div>
    </div>
    
    
    </div>
    <div class="content" style="display: none;">
        <h1 style="padding-left: 100px;">Experience Details</h1>
        <div class="first">
            <h2>Experince1</h2>
            <input type="text" id="name" pattern="^[a-z A-Z ]*$" 
                placeholder="Institution/Organization  " name="organisation" value="<%=resultSet.getString("organisation") %>" required>
                <input type="text" id="name" pattern="^[a-z A-Z ]*$" 
                placeholder="Position " name="position" value="<%=resultSet.getString("position") %>">
               
        </div>
            <div>
                <div class="first" style="margin-top:30px">
                   
                    <input type="text" id="name" pattern="^[a-zA-Z]*$" 
                placeholder="Duration " name="duration" value="<%=resultSet.getString("duration") %>">
                       <input type="text" id="name" 
                       placeholder="Description" name="experiance_description" value="<%=resultSet.getString("experiance_description") %>">
               </div>

            </div>
            <div class="first">
                <h2>Experince2</h2>
                <input type="text" id="name" pattern="^[a-zA-Z]*$" 
                    placeholder="Institution/Organization  " name="organisation1" value="<%=resultSet.getString("organisation1") %>">
                    <input type="text" id="name" pattern="^[a-zA-Z]*$" 
                    placeholder="Position " name="position1" value="<%=resultSet.getString("position1") %>">
                   
            </div>
                <div>
                    <div class="first" style="margin-top:30px">
                       
                        <input type="text" id="name" pattern="^[a-zA-Z]*$" 
                    placeholder="Duration " name="duration1" value="<%=resultSet.getString("duration1") %>">
                           <input type="text" id="name" 
                           placeholder="Description" name="experiance_description1" value="<%=resultSet.getString("experiance_description1") %>">
                   </div>
    
                </div>
    
                <div class="b" style="padding-left: 200px;">
                    <button type="button" onmouseup="showforms(2)">Previous</button> 
                    <button type="button" onmouseup="showforms(4)" style="padding-left:25px;padding-right:25px">Next</button>        
                </div>

    </div>
    <div class="content" style="display: none;">
        <h1 style="padding-left: 100px;">Extra Details</h1>
        <div class="first">
            <h2>Skills/Languages</h2>
            <input type="text" id="name" pattern="^[a-zA-Z]*$" 
                placeholder="Skill1  *" name="Skill1" value="<%=resultSet.getString("Skill1") %>">
                <input type="text" id="name" pattern="^[a-zA-Z]*$" 
                placeholder="Skill2 *" name="Skill2" value="<%=resultSet.getString("Skill2") %>">
               
        </div>
            <div>
                <div class="first" style="margin-top:30px">
                   
                    <input type="text" id="name" pattern="^[a-zA-Z]*$" 
                placeholder="Skill3 " name="Skill3" value="<%=resultSet.getString("Skill3") %>">
                       <input type="text" id="name" 
                       placeholder="Skill4" name="Skill4" value="<%=resultSet.getString("Skill4") %>">
               </div>

            </div>
            <div>
                <div class="first" style="margin-top:30px">
                   
                    <input type="text" id="name" pattern="^[a-zA-Z]*$" 
                placeholder="Skill5 " name="Skill5" value="<%=resultSet.getString("Skill5") %>">
                       <input type="text" id="name" 
                       placeholder="Skill6" name="Skill6" value="<%=resultSet.getString("Skill6") %>">
               </div>

            </div>
            <div class="first">
                <h2>Interest</h2>
                <input type="text" id="name" pattern="^[a-zA-Z]*$" placeholder="Interest1 *" 
                     name="Interest1" value="<%=resultSet.getString("Interest1") %>">
                    <input type="text" id="name" pattern="^[a-zA-Z]*$"  placeholder="Interest2 *" 
                     name="Interest2" value="<%=resultSet.getString("Interest2") %>">
                   
            </div>
                <div>
                    <div class="first" style="margin-top:30px">
                       
                        <input type="text" id="name" pattern="^[a-zA-Z]*$" 
                    placeholder="Interest3 " name="Interest3" value="<%=resultSet.getString("Interest3") %>">
                           <input type="text" id="name" 
                            name="Interest4" value="<%=resultSet.getString("Interest4") %>">
                   </div>
    
                </div>
    
                <div class="b" style="padding-left: 160px;">
                    <button type="button" onmouseup="showforms(3)">Previous</button> 
                    <button type="submit">Update</button>         
                </div>

    </div>





</div>
<%
}
con.close();
} catch (Exception e) {
e.printStackTrace();
}
     %>

</div>
</form> 
    

</body>
</html>