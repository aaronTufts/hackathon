
var FORM_ID = "practice_form";

function make_alert(){
  alert("greetings!");
}

function check_form(){
  var form = document.getElementById(FORM_ID)
  if(all_boxes_filled(form)){
     append_form_data_to_page(form);
  }
  else{
    alert("You must fill in all the boxes!");
  }
}

  /* given a reference to a form, checks that the value of it's members is != "" 
     hint: theForm.elements[i].value != "", where theForm.length is how many elements it has */
function all_boxes_filled(theForm){
    var length = theForm.length;  // whoa, my intuition from 40 is to pull this out of
                                  // the loop for performance...but does it
                                  // matter for web stuff?
    for (var i = 0; i < length; i++) {
        if (theForm.elements[i].value == "") {
            return false;
        }
    }
    return true;
}

 /* adds a new paragraph to the page's div for each entry, filling with data
 	from one of the field's forms 
 	hint: theParagraph.innerHTML = theData; */
 	/*NOTE THIS IS NON-PERSISTENT*/
function append_form_data_to_page(theForm){
  var name=theForm.getElementById(name).value;
  var city=theForm.getElementById(city).value;
  var food=theForm.getElementById(food).value;
  
  //var msg=name+" is from "+city+", and their favorite food is "+food".";
  
  //var mainContent=getElementById(main_content);
  //para=document.createElement("p");
  //node=document.createTextNode(name);
  //para.appendChild(node);
  
  //document.getElementById(results).insert(para);
  
}


/* called when the browser gets all text, including this file, from the server */
make_alert();

/*	To test working together on git and writing code that works together, let's make this form on our index page:

	Please enter your...
	name:
	city:
	favorite food:

Jayme: please add the form on the html page and assign its id to FORM_ID above so it will work with my check_form 
	function, then write all_boxes_filled - document.getElementByID(FORM_ID) in the caller gets you a reference to 
	the form, so you just have to access it's members

Caroline: please write a function to append what the user enters into the form to the page.
*/
