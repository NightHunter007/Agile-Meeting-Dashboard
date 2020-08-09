var slaves = [{ name: "Aron", role: "BUSINESS ANALYST" },{ name: "Barry", role: "FRONT END DEVELOPER" },{ name: "Charles", role: "BACK END DEVELOPER" }];


slaves.map((slave) => {

  var form1 = document.createElement('form');
  form1.method = "POST";
  form1.action = "/virtusa/AssignController"; //// change this
  form1.style.display="absolute";


  var Div1 = document.createElement('div');
  Div1.className = 'container';
  Div1.style.display = "inline-block";
  document.getElementById('newcontentcards').appendChild(form1);

  var Div2 = document.createElement('div');
  Div2.className = 'row text-center';

  form1.appendChild(Div1);
  Div1.appendChild(Div2);

  var Div3 = document.createElement('div');
  Div3.className = 'col-xl-3 col-sm-6 mb-5';

  Div2.appendChild(Div3);

  var Div4 = document.createElement('div');
  Div4.className = 'bg-white rounded shadow-sm py-5 px-4';

  Div3.appendChild(Div4);

  var img1 = document.createElement('img');
  img1.src = "https://d19m59y37dris4.cloudfront.net/university/1-1-1/img/teacher-4.jpg";
  img1.width = 100;
  img1.className = "img-fluid rounded-circle mb-3 img-thumbnail shadow-sm";

  Div4.appendChild(img1);

  var name1 = document.createElement('h5');
  name1.className = "mb-0";
  name1.innerHTML = slave.name;
  name1.value=slave.name;
  name1.name = "InputName"
  name1.style.color="black";

  Div4.appendChild(name1);

  var span1 = document.createElement('span');
  span1.className = "small text-uppercase text-muted";
  span1.innerHTML = slave.role;
  span1.name = "InputRole";

  Div4.appendChild(span1);

  var temp="#";
  var temp1="&";
  var input1 = document.createElement('input');
  input1.className = "form-control";
  input1.placeholder = "Task details";
  input1.style.marginTop = "20px";
  input1.style.textAlign = "center"
  input1.name = "InputTask";

  Div4.appendChild(input1);

  var button1 = document.createElement('BUTTON');
  button1.className = "btn";
  button1.style.marginTop = "20px";
  button1.innerHTML = "Assign";
  button1.type = "submit";
  button1.addEventListener('click', (event) => { input1.value=temp1+input1.value+temp+slave.name; })
  

  Div4.appendChild(button1);
  
  

})
