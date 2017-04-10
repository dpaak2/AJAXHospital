<%@ page language="java" contentType="text/html; charset=UTF-8"
     pageEncoding="UTF-8"%>
<script
     src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="${context.js}/hospital.js"></script>
<%-- <img src="${context.img}/common/loading.gif" alt="" />
<script>
 $(function() {
   goPage('${context.path}/home');
});
</script> --%>
<script
     src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<link rel="stylesheet"
     href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
     integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
     crossorigin="anonymous">
<script
     src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
     integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
     crossorigin="anonymous"></script>
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
                <a class="navbar-brand" href="#">Brand</a>
           </div>
           <!-- Collect the nav links, forms, and other content for toggling -->
           <div class="collapse navbar-collapse"
                id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                     <li class="active"><a id="" href="#">Hospital<span
                                class="sr-only">(current)</span></a></li>
                     <li><a href="#">Link</a></li>
                     <li class="dropdown"><a href="#" class="dropdown-toggle"
                           data-toggle="dropdown" role="button" aria-haspopup="true"
                           aria-expanded="false">Algorithm<span class="caret"></span></a>
                           <ul class="dropdown-menu">
                                <li><a id="series" href="#">Series</a></li>
                                <li><a id="array" href="#">Array</a></li>
                                <li><a id="matrix" href="#">Matrix</a></li>
                                <li><a id="math" href="#">Math</a></li>
                                <li><a id="appl" href="#">Application</a></li>
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
                           aria-expanded="false">OOP <span class="caret"></span></a>
                           <ul class="dropdown-menu">
                                <li><a id="encap" href="#">Encapsulation</a></li>
                                <li><a id="inherit" href="#">Inheritance</a></li>
                                <li><a id="poly" href="#">Polymorphism</a></li>
                           </ul></li>
                </ul>
           </div>
           <!-- /.navbar-collapse -->
     </div>
     <!-- /.container-fluid -->
</nav>
<div id="wrapper"></div>
<script>
var app= app || {};
app.context(function(){
     
})();
app.component(function(){
      return{
            body :$('#body'),
            app.component.wrapper : $('#wrapper')
        }
      })();
      app.complex={
    		  createButton:function(type){this._name=_name;},
      };
     var div = '</div>';
     var aButton = $('<a href="#" id="button" type="button" class="btn btn-primary">Button</a>');
     var bButton = $('<button id="button" type="button" class="btn btn-default">Button</a>');
     var inputText = $('<input id="inputText" type="text" class="form-control" placeholder="example" aria-describedby="basic-addon1">');
     var content = $(div, {id : 'content'});
     var divAlert = $('<div class="alert alert-danger" role="alert">example</div>');
     var series = $('#series');
     var encap = $('#encap');
     var arr = $('#array');
     var matrix = $('#matrix');
     var math = $('#math');
     var appl = $('#appl');
     var encap = $('#encap');
     var inherit = $('#inherit');
     var poly = $('#poly');
     var table = '<table id="table" style="width:500px;height:300px;border-collapse:collapse;border:1px solid black;margin: 0 auto;">'
                + '<tr style="border: 1px solid black">'
                + '<td id="tableLeft" style="width: 50%;border:1px solid black;"></td>'
                + '<td id="tableRight" style="width: 50%;border:1px solid black;"></td>'
                + '</tr>' + '</table>';
     var seriesMenu = '<ul class="list-group">'
                + '<li id="aSeries" class="list-group-item"><a href="#">등차수열</a></li>'
                + '<li id="swSeries" class="list-group-item"><a href="#">스위치 수열</a></li>'
                + '<li id="dSeries" class="list-group-item"><a href="#">계차수열</a></li>'
                + '<li id="factorial" class="list-group-item"><a href="#">팩토리얼</a></li>'
                + '<li id="fibonacci" class="list-group-item"><a href="#">피보나치수열 합</a></li>'
                + '</ul>';
     var oopMenu = '<ul class="list-group">'
                + '<li id="encap" class="list-group-item"><a href="#">은닉화</a></li>'
                + '<li id="inherit" class="list-group-item"><a href="#">상속</a></li>'
                + '<li id="poly" class="list-group-item"><a href="#">다양성</a></li>'
                + '</ul>';
     app.component.wrapper.empty(); /*wrapper의 full name은 app.component.wrapper 이것이되었다*/
     series.on('click',function() {
           app.component.wrapper.append(table);
         $('#tableLeft').html(seriesMenu);
           var tableRight = $('#tableRight');
           inputText.attr('placeholder', '시작값 한계값 공차(공백으로 구분)입력').appendTo(tableRight);
           aButton.html('등차수열의 합').appendTo(tableRight).css('margin','10px auto').on('click',function() {
                var inputVal = $('#inputText').val();
                var arr = inputVal.split(' ');
                var start = arr[0];
               var limit = arr[1];
                var diff = arr[2];
                console.log('start:' + start + ',limit'+ limit + ',diff' + diff);
               divAlert.html(aSeries(start, limit, diff)).appendTo(tableRight);
               });
     $('#aSeries').on('click',function() {
          inputText.attr('placeholder','limit').appendTo(tableRight);
           aButton.html('등차수열의 합').appendTo(tableRight).css('margin', '10px auto').on('click',function() {
                     var inputVal = $('#inputText').val();
                     var arr = inputVal.split(' ');
                     var start = arr[0];
                     var limit = arr[1];
                     var diff = arr[2];
                     divAlert.html(aSeries(start,limit,diff)).appendTo(tableRight);
                           });
             });
     $('#swSeries').on('click',function() {
          inputText.attr('placeholder','limit').appendTo(tableRight);
          aButton.html('swSeries').appendTo(tableRight).css('margin', '10px auto').on('click',function() {
                     var limit = $('#inputText').val();
                     divAlert.html('스위치 수열: '+ swSeries(limit)).appendTo(tableRight);
                           });
           });
     $('#dSeries').on('click',function() {inputText.attr('placeholder','limit').appendTo(tableRight);
                aButton.html('계차수열 ').appendTo(tableRight).css('margin', '10px auto').on('click',function() {  
                     var limit = $('#inputText').val();
                           divAlert.html('계차수열: '+ dSeries(limit)).appendTo(tableRight);
                           });
                });
     $('#factorial').on('click',function() {inputText.attr('placeholder','limit').appendTo(tableRight);
                aButton.html('factorial').appendTo(tableRight).css('margin', '10px auto').on('click',function() {
                     var limit = $('#inputText').val();
                     factorial($('#inputText').val());
                     divAlert.html('팩토리얼: '+ factorial(limit)).appendTo(tableRight);});});
     $('#fibonacci').on('click',function() {
                inputText.attr('placeholder','limit').appendTo(tableRight);
                aButton.html('피보나치').appendTo(tableRight).css('margin', '10px auto').on('click',function() {
                     var limit = $('#inputText').val();
     fibonacci($('#inputText').val());
           divAlert.html('피보나치: '+ fibonacci(limit)).appendTo(tableRight);
                          });
                 });
       });
     /*
        알고리즘 클래스
      */
     app.component.wrapper.empty();
     encap.on('click', function() {
           wrapper.append(table);
           $('#tableLeft').html(oopMenu);
           var tableRight = $('#tableRight');
           inputText.attr('placeholder', '이름 나이 성별 직업 (공백으로 구분)').appendTo(
                     tableRight);
          aButton.html('스펙보기').appendTo(tableRight).css('margin', '10px auto').on('click', function() {
                           var inputVal = $('#inputText').val();
                           var arr = inputVal.split(' ');
                           /*     var person= new Object(); /*생성자*/
                           console.log(inputVal);
                           /* var person = new Person(arr[0], arr[1], arr[2], arr[3]); */
                           app.person.setName(arr[0]);
                           app.person.setAge(arr[1]);
                           app.person.setGender(arr[2]);
                           app.person.setJob(arr[3]);
                           console.log(app.person);
                           /*       person.name= arr[0];
                                    person.age= arr[1];
                                    person.gender= arr[2];
                                    person.job= arr[3]; */
                           var spec = '<h5>' + app.person.toString() + '</h5>';
                          divAlert.html(spec).appendTo(tableRight);
                     });
     });
     function aSeries(start, limit, diff) {
           var start = start * 1, limit = limit * 1, diff = diff * 1;
           var sum = 0;
           var rs = "";
           var i = start;
           while (i < limit) {
                /*if(i+diff>limit){
                     rs+=i+"+";
                }else{
                     rs +=i;
                }*/
                rs += (i + diff > limit) ? i + "=" : i + "+";
                sum += i;
                i += diff;
           }
           return rs + '=' + sum;
     }
     function swSeries(limit) {
           var sum = 0, sw = 0;
           for (i = 0; i <= limit; i++) {
                if (i % 2 == 1) {
                     sw = i;
                } else {
                     sw = -i;
                }
                sum += sw
           }
           return sum;
     }
     function dSeries(limit) {
           var i = 0, d = 1, sum = 1;
           while (i <= limit) {
                i++;
                d += i;
                sum += d;
                if (i == 19) {
                     break
                }
                ;
           }
           return sum;
     }
     function factorial(limit) {
           var sum = 1;
           for (i = 2; i <= limit; i++) {
                /*      if(){}else{} */
                sum = sum + (sum * i);
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
     /*객체지향적 자바 스크립트
     JS 객체생성법
     1.constructor
     2.declation
     3.expression
     dugals가 정리한 개념이다
       자바스크립트의 아버지이다 , 자바스크립트에서의 객체지향을 만들었다*/
app.person = (function() {/*DI방식이다 */
           var _name, _age, _gender, _job;
           return {/*sigleton 이다 */
                setName :function(name){this._name=name;},
                setAge : function(age){this._age=age;},
                setGender :function(gender){this._gender=gender;},
                setJob : function(job){this._job=job;},
                getName: function(){this._name;},
                getAge : function(){this._age;},
                getGender :function(){this._gender;},
                getJob : function(){this._job;},
                toString :function(){
                     return this._name+','+this._age+','+this._gender+','+this._job;}
                };/*return 객체 , JSON type이다 */
           })();
</script>
</html>
<!-- <script>
/* $(function(){
goPage('${context.path}/home','move','mainCommon');
}); */
</script> -->
