<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="${context.js}/hospital.js"></script>
<!DOCTYPE html>
<html>
<head>
<title></title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js">
	
</script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>

</head>
<body>
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
					aria-expanded="false">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="${context.img}/common/brand_icon.jpg}">Brand</a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li class="active"><a id="hospital" href="#">Hospital <span class="sr-only">(current)</span></a></li>
					<li><a href="#">Link</a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">Algorithm <span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a id="series" href="#">Series</a></li>
							<li><a id="array" href="#">Array</a></li>
							<li><a id="matrix" href="#">Matrix</a></li>
							<li><a id="math" href="#">Math</a></li>
							<li><a id="application" href="#">Application</a></li>
						</ul></li>
				</ul>
				<form class="navbar-form navbar-left">
					<div class="form-group">
						<input type="text" class="form-control" placeholder="Search">
					</div>
					<button type="submit" class="btn btn-default">Submit</button>
				</form>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#">Link</a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">Dropdown <span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="#">Action</a></li>
							<li><a href="#">Another action</a></li>
							<li><a href="#">Something else here</a></li>
							<li role="separator" class="divider"></li>
							<li><a href="#">Separated link</a></li>
						</ul></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>
	<div id="wrapper"></div>
	
	



</body>
<script>
	var body = $('body');
	var wrapper = $('#wrapper')
	var aButton = $('<a href="#" id="aButton" class="btn btn-primary" role="button">example</a>');
	var bButton = $('<button id="bButton" type="button" class="btn btn-default">example</button>');
	var inputText = $('<input id="inputText" type="text" class="form-control" placeholder="example" aria-describedby="basic-addon1">');
	var divAlert = $('<div class="alert alert-danger" role="alert">example</div>');
	var series=$('#series');
	var arr=$('#array');
	var matrix=$('#matirx');
	var math=$('#math');
	var appl=('#application');
	var table=
		'<table id="table" style"width:500px; height:300px; border-collapse="collapse"; border="1px solid black">'
				+	'<tr style="">'
				+		'<td id="tableLeft" style="width: 50%"border=" 1px solid black"></td>'
				+		'<td id="tableRight" style="width: 50%"border=" 1px solid black"></td>'
				+	'</tr>'
		+'</table>';
	var seriesMenu=
	'<ul class="list-group">'
	 	+	'<li id="aSeries" class="list-group-item"><a href="">등차수열 합</a></li>'
	  	+	'<li id="swSeries" class="list-group-item"><a href="">스위치수열 합</a> </li>'
	  	+	'<li id="dSeries" class="list-group-item"><a href="">계차수열</a></li>'
	  	+	'<li id="factorial" class="list-group-item"><a href="">Factorial</a></li>'
	 	+	'<li id="fibonacci" class="list-group-item"><a href="">피보나치 수열 합</a></li>'
	+'</ul>';
	
	wrapper.empty();
	
	
	series.on('click',function (){
		wrapper.append(table);
		$('#tableLeft').html(seriesMenu);
		var tableRight=$('#tableRight');
		inputText.attr('placeholder','limit').appendTo(tableRight);
		aButton.html('등차수열의 합').appendTo(tableRight).css('margin','10px auto').on('click',function (){
			var limit=$('#inputText').val();
			divAlert.html('1부터'+limit+'등차수열의 합은'+aSeries(limit)+'입니다').appendTo(tableRight)});
		
		inputText.attr('placeholder', 'limit').appendTo(tableRight);
		aButton.html('calculate').appendTo(tableRight).on('click',
	    function aSeries (limit){
			aSeries($('#inputText').val());
		});
		alert('calcluating');
		/* var limit = $('#inputText').val(); */
		/*declation - 선언문은 제일 밑에 있어도 제일먼저 실행된다*/
		var sum = 0;
		for (var i = 0; i <= limit; i++) {
			sum += i;
		}
		divAlert.html('등차수열의 합: '+sum).appendTo(tableRight);
		
		
		
		
		$('#aSeries').on(function (){
			inputText.attr('placeholder', 'limit').appendTo(tableRight);
			aButton.html('calculate').appendTo(tableRight).on('click',
		    function aSeries (limit){
				aSeries($('#inputText').val());
			});
			alert('calcluating');
			/* var limit = $('#inputText').val(); */
			/*declation - 선언문은 제일 밑에 있어도 제일먼저 실행된다*/
			var sum = 0;
			for (var i = 0; i <= limit; i++) {
				sum += i;
			}
		});
		
		$('#swSeries').on(function (){
			inputText.attr('placeholder', 'limit').appendTo(tableRight);
			aButton.html('calculate').appendTo(tableRight).on('click',
		    function swSeries (limit){
				swSeries($('#inputText').val());
			});
			alert('calcluating');
			var sum = 0;
			for (var i = 0; i <= limit; i++) {
				sum += i;
			}
			
		});
		
		$('#factorial').on(function (){
			inputText.attr('placeholder', 'limit').appendTo(tableRight);
			aButton.html('calculate').appendTo(tableRight).on('click',
		    function factorial (limit){
				factorial($('#inputText').val());
			});
			alert('calcluating');
			var sum = 0;
			for (var i = 0; i <= limit; i++) {
				sum += i;
			}
		});
		
		
	$('#fibonacci').on(function (){
	  inputText.attr('placeholder', 'limit').appendTo(tableRight);
		aButton.html('calculate').appendTo(tableRight).on('click',
			    function fibonacci (limit){
			fibonacci($('#inputText').val());
				});
				alert('calcluating');
				var sum=0;
				var a=1,b=1,c=2, sum=2;
				for(i=3;i<=limit;i++){
					c= a+b;
					a=b;
					a=c;
					sum+=c;
				}});
		
		
		
		function aSeries (){
			var sum = 0;
			for (var i = 0; i <= limit; i++) {
				sum += i;
			}			
			return sum;
		}
		
		
		function swSeries (){
			var sum=0;
			
			return sum;
		}
		
		function dSeries (){
			var sum=0;
			
			return sum;
		}
		
		function factorial(){
			var sum=0;
			
			return sum;
		}
		
		function fibonacci(){
			var sum=0;
			var a=1,b=1,c=2,sum=2;
			for(i=3;i<=limit;i++){
				c= a+b;
				a=b;
				a=c;
				sum+=c;
			}
			return sum;
		}
		
	});

</script>
</html>
<!-- <script>
/* $(function(){
	goPage('${context.path}/home','move','mainCommon');
}); */

</script> -->