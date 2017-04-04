<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script><script src="${context.js}/hospital.js"></script>
<%-- <img src="${context.img}/common/loading.gif" alt="" /> 
<script>
 $(function() {
   goPage('${context.path}/home');
});
</script> --%>

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" 
    integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" 
    integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
  <nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#">Brand</a>
    </div>
    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li class="active"><a id="" href="#">Link <span class="sr-only">(current)</span></a></li>
        <li><a href="#">Link</a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Algorithm<span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a id="series" href="#">Series</a></li>
            <li><a id="array" href="#">Array</a></li>
            <li><a id="matrix" href="#">Matrix</a></li>
            <li><a id="math" href="#">Math</a></li>
            <li><a id="appl" href="#">Application</a></li>
          </ul>
        </li>
      </ul>
      <form class="navbar-form navbar-left">
        <div class="form-group">
          <input type="text" class="form-control" placeholder="Search">
        </div>
        <button type="submit" class="btn btn-default">Submit</button>
      </form>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#">Link</a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Dropdown <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">Action</a></li>
            <li><a href="#">Another action</a></li>
            <li><a href="#">Something else here</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">Separated link</a></li>
          </ul>
        </li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid --></nav><div id="wrapper">

</div>
  <script>
  var body=$('body');
  var div='</div>';
  var wrapper=$('#wrapper');
  var aButton=$('<a href="#" id="button" type="button" class="btn btn-primary">Button</a>');
  var bButton=$('<button id="button" type="button" class="btn btn-default">Button</a>');
  var inputText=$('<input id="inputText" type="text" class="form-control" placeholder="example" aria-describedby="basic-addon1">');
  var content=$(div,{id:'content'});
  var divAlert=$('<div class="alert alert-danger" role="alert">example</div>');
  var series=$('#series');
  var arr=$('#array');
  var matrix=$('#matrix');
  var math=$('#math');
  var appl=$('#appl');
  var table=
  '<table id="table" style="width:500px;height:300px;border-collapse:collapse;border:1px solid black;margin: 0 auto;">'
   + '<tr style="border: 1px solid black">'
      + '<td id="tableLeft" style="width: 50%;border:1px solid black;"></td>'
      + '<td id="tableRight" style="width: 50%;border:1px solid black;"></td>'
   + '</tr>'
   +'</table>';
  var seriesMenu=
     '<ul class="list-group">'
      + '<li id="aSeries" class="list-group-item"><a href="#">등차수열</a></li>'
      + '<li id="swSeries" class="list-group-item"><a href="#">스위치 수열</a></li>'
      + '<li id="dSeries" class="list-group-item"><a href="#">계차수열</a></li>'
      + '<li id="factorial" class="list-group-item"><a href="#">팩토리얼</a></li>'
      + '<li id="fibonacci" class="list-group-item"><a href="#">피보나치수열 합</a></li>'
     + '</ul>';
     
  var limit=limit=$('#inputText').val();
  
  wrapper.empty();
  inputText.attr('placeholder','이  름').appendTo(wrapper);
  aButton.html('CLICK ME').appendTo(wrapper).on('click',function(){
     var name=$('#inputText').val();
     wrapper.empty();
     divAlert.html('Hello '+name+' !!').appendTo(wrapper);
  });
  wrapper.empty();
  series.on('click',function(){
    /*  table.appendTo(wrapper); */
     wrapper.append(table);
     $('#tableLeft').html(seriesMenu);
     var tableRight=$('#tableRight');
     inputText.attr('placeholder','limit').appendTo(tableRight);
     aButton.html('등차수열의 합').appendTo(tableRight).css('margin','10px auto').on('click',function(){
        var limit=$('#inputText').val();
        divAlert.html('1부터 '+limit+'등차수열의 합은'+aSeries(limit)+'입니다.').appendTo(tableRight);
        });
 
  
    $('#aSeries').on('click',function(){
	     inputText.attr('placeholder','limit').appendTo(tableRight);
	     aButton.html('등차수열의 합').appendTo(tableRight).css('margin','10px auto').on('click',function(){
	        var limit=$('#inputText').val();
	        divAlert.html('1부터 '+limit+'등차수열의 합은'+aSeries(limit)+'입니다.').appendTo(tableRight);
	     });
	  });
    
	$('#swSeries').on('click',function () {
		inputText.attr('placeholder','limit').appendTo(tableRight);
		aButton.html('swSeries').appendTo(tableRight).css('margin','10px auto').on('click', function () {
		var limit=$('#inputText').val();
		divAlert.html('스위치 수열: '+swSeries(limit))
			});			
		});
	
    $('#dSeries').on('click',function(){
	     inputText.attr('placeholder','limit').appendTo(tableRight);
	     aButton.html('계차수열 ').appendTo(tableRight).css('margin','10px auto').on('click',function(){
	        var limit=$('#inputText').val();
	        divAlert.html(dSeries(limit)).appendTo(tableRight);
	     });
	  });

	$('#factorial').on('click',function() {
	inputText.attr('placeholder', 'limit').appendTo(tableRight);
	aButton.html('factorial').appendTo(tableRight).css('margin','10px auto').on('click', function() {
    var limit=$('#inputText').val();
	factorial($('#inputText').val());
	divAlert.html(factorial(limit));
		});
	});

	$('#fibonacci').on('click',	function() {
	inputText.attr('placeholder', 'limit').appendTo(tableRight);
	aButton.html('피보나치').appendTo(tableRight).css('margin','10px auto').on('click', function() {
	var limit=$('#inputText').val();
    fibonacci($('#inputText').val());
    divAlert.html(fibonacci(limit)).appendTo(tableRight);
		 });
	  });
  });

	function aSeries(limit) {
		var sum = 0;
		for (var i = 0; i <= limit; i++) {
			sum += i;
		}
		return sum;
	}

	function swSeries(limit) {
		var i = 0, sum = 0, sw = 0;
		while (true) {
			i++;
			if (i % 2 == 1) {
				sw = i;
			} else {
				sw = -i;
			}
			sum += sw;
			if (i == 100) {
				break;
			}
		}
		return sum;
	}

	function dSeries(limit) {
		var i = 0, d = 1, sum = 1;
		while (true) {
			i++;
			d += i;
			sum += d;
			if (i == 19) {
				break};
		}
		return sum;
	}

	function factorial(limit) {
		var sum = 0;
		for(var i=1;i<=limit;i++){
			if(i==3){
				sum=sum+(sum*i);
			}
		}
		return sum;
	}

	function fibonacci(limit) {
		var sum = 0;
		var a = 1, b = 1, c = 2, sum = 2;
		for (i = 3; i <= limit; i++) {
			c = a + b;
			a = b;
			b = c;
			sum += c;
		}
		return sum;
	}

 
</script>
</html>
<!-- <script>
/* $(function(){
goPage('${context.path}/home','move','mainCommon');
}); */

</script> -->