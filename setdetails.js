/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/ClientSide/javascript.js to edit this template
 */

function details(){
            var table=document.getElementById('table');
            for(var i=0;i<table.rows.length;i++){
                table.rows[i].onclick = function(){
                  var fid=this.cells[0].innerText;
                  var src=this.cells[2].innerText;
                  var dest=this.cells[3].innerText;
                  var tdate=this.cells[4].innerText;
                  var Class=this.cells[5].value;
                  localStorage.setItem('fid',fid);
                  localStorage.setItem('src',src);
                  localStorage.setItem('dest',dest);
                  localStorage.setItem('tdate',tdate);
                  localStorage.setItem('Class',Class);
                  document.write(Class);
                 // window.location='details.html';
                };
            }
        }

