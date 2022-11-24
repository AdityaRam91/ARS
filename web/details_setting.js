/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/ClientSide/javascript.js to edit this template
 */


function setdetails(){
            var table=document.getElementById('table');
            for(var i=0;i<table.rows.length;i++){
                table.rows[i].onclick = function(){
                  var fid=this.cells[0].innerText;
                  var src=this.cells[2].innerText;
                  var dest=this.cells[3].innerText;
                  var tdate=this.cells[4].innerText;
                
                  localStorage.setItem('fid',fid);
                  localStorage.setItem('src',src);
                  localStorage.setItem('dest',dest);
                  localStorage.setItem('tdate',tdate);
                  setclass();
                 
                };
             
            }
        }
function setclass(){
    var fid=localStorage.getItem('fid');
    var table=document.getElementById('table');
    var ind=0;
    for(i=0;i<table.rows.length;i++){
        var tfid=table.rows[i].cells[0].innerText;
        if(fid === tfid){
            ind=i;
            break;
        }
    }
    var e=document.getElementsByName('Classes')[ind-1];
    var Class=e.options[e.selectedIndex].value;
    localStorage.setItem('Class',Class);
     window.location='details.html';
}