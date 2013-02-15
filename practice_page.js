
var FORM_ID = "";

function make_alert(){
  alert("greetings!");
}

function check_form(){
  if(all_boxes_filled(document.getElementByID(FORM_ID))){
    alert("You filled in all the boxes.  Great.");
  }
  else{
    alert("You must fill in all the boxes!");
  }
}

function all_boxes_filled(theForm){
  /* Jayme: please add the form on the html page and assign it's id to FORM_ID above 
  	so it will work with my function */
}


/* called when the browser gets all text, including this file, from the server */
make_alert();
