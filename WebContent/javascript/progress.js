/**
 * 
 */
 
 
 var f = 1;
function handleClick() {
  var bar = document.getElementById('progressbar');
  bar.style.display="absolute";
  prevWidth = (bar.style.width);
  var x = (((parseInt(prevWidth.substring(0, 2)) + 10)));
  if (x <= 100 && f == 1) {
    bar.style.width = (((parseInt(prevWidth.substring(0, 2)) + 10) + '%').toString());
    bar.innerHTML = detemineMessage(x, bar);
    if (x == 100) { f = 0; }
  }
}

function detemineMessage(x, bar) {
  var tb = document.getElementById('taskbtn');
  switch (x) {
    case 30:
      tb.innerHTML = "Requirements fetched (40%)";
      return "Requirements fetched (30%)";
      break;
    case 40:
      tb.innerHTML = "Development Started (50%)";
      return "Requirements fetched (40%)";
      break;
    case 50:
      tb.innerHTML = "Development Started (60%)";
      bar.className = "progress-bar progress-bar-warning progress-bar-striped";
      return "Development Started (50%)";
      break;
    case 60:
      tb.innerHTML = "Modules Assigned and Tested (70%)";
      return "Development Started (60%)";
      break;
    case 70:
      tb.innerHTML = "Testing and Integration (80%)";
      return "Modules Assigned and Tested (70%)";
      break;
    case 80:
      tb.innerHTML = "Testing and Integration (90%)";
      bar.className = "progress-bar progress-bar-info progress-bar-striped"
      return "Testing and Integration (80%)";
      break;
    case 90:
      tb.innerHTML = "Task Completed (100%)";
      return "Testing and Integration (90%)";
      break;
    case 100:
      tb.innerHTML = "Done";
      bar.className = "progress-bar progress-bar-success progress-bar-striped"
      tb.style.display = "none";
      return "Task Completed (100%)";
      break;

  }
}