<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

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
            main.style.display="none";
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
  			console.log($(this).is(':valid'));
  			  if((!($(this).is(':valid') && !$(this).is('required'))) ){
  				$(this).effect('shake',{times: 2}, 700); 
  				$(this).css('border-color','#ff0000');
  				flag=false;
  			  }
  		 });
  		 if(flag) showforms(curTab+1);
	}
	
	//validation color         	
	function colorIndecation(thisObj){
		console.log(( thisObj.is(':valid') && !( $(this).is('required') )  ));
		if( (!(thisObj.is(':valid') && !$(this).is('required')))){
			thisObj.css('border-color','#ff0000');
			return false;
		}
		else{
			thisObj.css('border-color','#00ff40');
		}
		$(this).focusout(function() {
			thisObj.css('border-color','#ccc');
		});
	}
	
	// Remove on Change
	function changeOnRemove(changeSelector){
		changeSelector.css('border-color','#ccc');
	}
    });
</script>
<style>
hr {
  border: 2px solid #f1f1f1;
  margin-bottom: 25px;
}

    .navbar {
        display:flex;
        flex-direction:row;
      border-style: solid; 
        overflow: hidden;
  /* background-color:#a9f5df; */
 
}
.navbar a{
font-family: Arial, Helvetica, sans-serif;
    color:rgb(88, 88, 36);
    font-size:21px;
    text-decoration: none;
    padding:3px;
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
   /* #rb:hover{
       color: rgb(216, 44, 44);
   } */
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
<body style="background-image:url('http://localhost:8080/log/image/wall.jpg'); background-repeat: no-repeat; background-size: cover;">
    
    <div class="navbar">
     <div>
        <a class="active" style="  color:rgb(5, 5, 49)" href="#">Home </a>
        <a href="Profile.jsp">Profile  </a> 
        <a href="http://localhost:8080/log/Contact.html">ContactUs</a>
        <button id="rb" type="button" onmouseup="showresume()" style="font-size:21px;boarder:none;" >ResumeBuilder </button> 
      <a href="Preview.jsp">UpdateResume</a>
         </div>
         
     <div style="display:flex-end; padding-left:491px;padding-top:9px;">
      <span style="color:#201d26;float: right;">WelCome:${FirstName}</span><br>
        <span style="color:lavender;float: right; padding-top:4px;"> <a href="http://localhost:8080/log/">logout</a></span>
       </div>
       <div>
     <img style="float: right;width:50px; padding-top:9px;" src="http://localhost:8080/log/image/User_icon.png" ></div>
     </div>
     <hr>
     <form action="ResumeServlet" method="post">
     <div>
					
				<span style="color: black">${error}</span>
				</div>
     <div class="main" style="display:none;" >
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
                <h1 style="padding-left: 90px;">Personal Details</h1>
                <div class="first">
                    <input type="text" id="name" pattern="^[a-zA-Z]*$" 
                        placeholder="First Name *" name="first_name" required >
                        <input type="text" id="name" pattern="^[a-zA-Z]*$" 
                        placeholder="Last Name " name="last_name" >
                </div>
                <div class="first">
                   
                     <input type="text" id="email" pattern="^([a-zA-z_+%]+@[a-z]+\.[a-z]{2,4})$"
                        placeholder="Enter email * " name="email"  required>
                        <input type="text" id="email"  pattern="^[0-9]{10,15}$" 
                        placeholder="Phone Number" name="phone_number" required>
                </div>
                <div class="first">
                    <input type="text" id="wl" 
                       placeholder="Your Website " name="website">
                       <input type="text" id="wl" 
                       placeholder="Linked In " name="linked_in">
               </div>
               </div>
               <div class="b" style="padding-left: 190px;">
                <button type="button"  id="personalNextBtn" style="padding-left:25px;padding-right:25px">Next</button>        
            </div>
            
            
            </div>
       
     <div class="content"  style="display:none">
        <h1 style="padding-left: 100px; ">Educational Details</h1>
        <div class="right-contents-form2">
        <div class="first" style="padding-bottom: 10px;">
           <div style="padding-left:50px;"> <input type="text" id="name"  pattern="^[a-zA-Z ]*$" 
                placeholder="College/University *" name="College" required></div>
                <div style="padding-left:50px; padding-top: 20px;">
                <input id="name" type="text" placeholder="Joining date" onfocus="(this.type='date')" onblur="if(this.value==''){this.type='text'}" name="college_joining_date" required>
                <input id="name" type="text" placeholder="Completion date" onfocus="(this.type='date')" onblur="if(this.value==''){this.type='text'}" name="college_completion_date" required>
            </div>
            <div id="list" style="padding-left:15px;"><ul>
                <li style="list-style:none; outline: none;border-color: green; padding-right:15px;">
                    <select name="college_qualification"  id="name" class="degree" required>
                    <option  selected disabled hidden>DEGREE</option> 
                    <option value="B.Tech">B.Tech</option> 
                    <option value="B.Arts">B.Arts</option> 
                    <option value="B.Sc">B.Sc</option> 
                    </select></li>
                <li style="list-style:none; outline: none;border-color: green; ">
                    <select name="college_description"  id="name" onfocus="showDept()" required>
                    <option  selected disabled hidden>DEPARTMENT</option> 
                    <optgroup class="Dept" label="B.TECH" style="display:none;">
                        <option value="CSE">CSE</option>
                        <option value="ECE">ECE</option>
                        <option value="IT">IT</option>
                        <option value="MECH">MECH</option>
                        <option value="CIVIL">CIVIL</option>
                      </optgroup> 
                      <optgroup class="Dept" label="B.ARTS" style="display:none;">
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
                    </select></li>
                    </ul>
                </div>
        </div>
        <hr>
        <div class="first">
            <div style="padding-left:50px;padding-bottom:20px;"><input type="text" id="name"  pattern="^[a-zA-Z]*$" 
                placeholder="School *" name="school" required></div>
                <div  style="padding-left:50px;" >
                <input id="name" type="text" placeholder="Joining date" onfocus="(this.type='date')" onblur="if(this.value==''){this.type='text'}" name="school_joining_date" required>
                <input id="name" type="text" placeholder="Completion date" onfocus="(this.type='date')" onblur="if(this.value==''){this.type='text'}" name="school_completion_date" required>
            </div>
            <div id="list" style="padding-left:10px;"><ul >
                    <li  style="list-style:none; outline: none; padding-right: 15px;border-color: green;"  >
                        <select  name="school_qualification"  id="name" required>
                            <option  selected disabled hidden>BOARDS</option> 
                            <option value="CBSE">CBSE</option> 
                            <option value="ICSE">ICSE</option> 
                            <option value="NIOS">NIOS</option> 
                            <option value="STATE BOARD">STATE BOARD</option> </select></li> 
          
                    <li style="list-style:none; outline: none;border-color: green;">
                    <select name="school_description"  id="name" required>
                            <option  selected disabled hidden>STREAM</option> 
                            <option value="SCINCE">SCINCE</option> 
                            <option value="ARTS">ARTS</option> 
                            <option value="COMMERCE">COMMERCE</option> 
                             </select></li>
                             </ul>
        </div>
    </div>
       </div>
       <div class="b" style="padding-left:  200px; margin-top:-30px">
        <button type="button" onmouseup="showforms(0)">Previous</button> 
        <button type="button" id="eduNextBtn" style="padding-left:25px;padding-right:25px">Next</button>        
    </div>
    
    
    </div>
    <div class="content"style="margin-right:200px; float: left; display:none">
    <div style=" margin-right: 100px;
        float: right;
        padding-left: 150px">
        <h1 style="padding-left: 20px;">Project Developed</h1>
        <div class="first">
            <input type="text" id="name" style="padding-right:100px"
                placeholder="Title " name="project_title">
        </div>
        <div class="first">
         <input type="text" id="email" style="padding-right:100px"
                placeholder="Link " name="project_link" >
        </div>
        <div class="first">
            <input type="text" id="wl" style="padding-right:100px"
               placeholder="Description   " name="project_description">
       </div>
       <div class="b" style="padding-left: 100px;">
       
        <button  type="button" onmouseup="showforms(1)">Previous</button> 
        <button type="button" onmouseup="showforms(3)" style="padding-left:25px;padding-right:25px">Next</button> 
            
    </div>
    </div>
    
    </div>
    <div class="content" style="display: none;">
        <h1 style="padding-left: 100px;">Experience Details</h1>
        <div class="first">
            <h2>Experience1</h2>
            <input type="text" id="name" pattern="^[a-zA-Z ]*$" 
                placeholder="Institution/Organization  " name="organisation">
                <input type="text" id="name" pattern="^[a-zA-Z ]*$" 
                placeholder="Position " name="position">
               
        </div>
            <div>
                <div class="first" style="margin-top:30px">
                   
                    <input type="text" id="name" pattern="^[a-zA-Z ]*$" 
                placeholder="Duration " name="duration">
                       <input type="text" id="name" pattern="^[a-zA-Z ]*$" 
                       placeholder="Description" name="experiance_description">
               </div>

            </div>
            <div class="first">
                <h2>Experince2</h2>
                <input type="text" id="name" pattern="^[a-zA-Z ]*$" 
                    placeholder="Institution/Organization  " name="organisation1">
                    <input type="text" id="name" pattern="^[a-zA-Z ]*$" 
                    placeholder="Position " name="position1">
                   
            </div>
                <div>
                    <div class="first" style="margin-top:30px">
                       
                        <input type="text" id="name" pattern="^[a-zA-Z ]*$" 
                    placeholder="Duration " name="duration1">
                           <input type="text" id="name" pattern="^[a-zA-Z ]*$"  
                           placeholder="Description" name="experiance_description1">
                   </div>
    
                </div>
    
                <div class="b" style="padding-left: 160px;">
                    <button type="button" onmouseup="showforms(2)">Previous</button> 
                    <button type="button" onmouseup="showforms(4)" style="padding-left:25px;padding-right:25px">Next</button>        
                </div>

    </div>
    <div class="content" style="display: none;">
        <h1 style="padding-left: 110px;">Extra Details</h1>
        <div class="first">
            <h2>Skills/Languages</h2>
            <input type="text" id="name" pattern="^[a-zA-Z ]*$" 
                placeholder="Skill1 * " name="Skill1" required>
                <input type="text" id="name" pattern="^[a-zA-Z ]*$" 
                placeholder="Skill2 *" name="Skill2" required>
               
        </div>
            <div>
                <div class="first" style="margin-top:30px">
                   
                    <input type="text" id="name" pattern="^[a-zA-Z ]*$" 
                placeholder="Skill3 " name="Skill3">
                       <input type="text" id="name" pattern="^[a-zA-Z ]*$" 
                       placeholder="Skill4" name="Skill4">
               </div>

            </div>
            <div>
                <div class="first" style="margin-top:30px">
                   
                    <input type="text" id="name" pattern="^[a-zA-Z ]*$" 
                placeholder="Skill5 " name="Skill5">
                       <input type="text" id="name" pattern="^[a-zA-Z ]*$"  
                       placeholder="Skill6" name="Skill6">
               </div>

            </div>
            <div class="first">
                <h2>Interest</h2>
                <input type="text" id="name" pattern="^[a-zA-Z ]*$" 
                    placeholder="Interest1 *" name="Interest1" required>
                    <input type="text" id="name" pattern="^[a-zA-Z ]*$" 
                    placeholder="Interest2 *" name="Interest2" required>
                   
            </div>
                <div>
                    <div class="first" style="margin-top:30px">
                       
                        <input type="text" id="name" pattern="^[a-zA-Z ]*$"  
                    placeholder="Interest3 " name="Interest3">
                           <input type="text" id="name" pattern="^[a-zA-Z ]*$" 
                           placeholder="Interest4" name="Interest4">
                   </div>
    
                </div>
    
                <div class="b" style="padding-left: 160px;">
                    <button type="button" onmouseup="showforms(3)">Previous</button> 
                    <button type="submit">SUBMIT</button>         
                </div>

    </div>





</div>

</div>
</form> 
    

</body>
</html>