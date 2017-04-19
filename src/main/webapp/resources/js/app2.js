/*
========= app-meta ==========
app-algorithm 
	app-algorithm-series
	app-algorithm-array
	app-algorithm-matrix
	app-algorithm-math
	app-algorithm-application
app-component
	app-component-button
	app-component-input
	app-component-alert
	app-component-list
	app-component-table
app-context
app-oop
	app-oop-encapsulation
	app-oop-inheritance
	app-oop-polymorphism
app-permission
app-person
	app-person-patient
	app-person-doctor
	app-person-nurse
	app-person-admin
app-session
app-ui
app-util
==============================
*/
var app=app || {};
/*
========= app-algorithm ====
@AUTHOR : pakjkwan@gmail.com
@CREATE DATE : 2017-4-1
@UPDATE DATE : 2017-4-1
@DESC : 
==============================
*/



/*Model
 * app.context
 * app.session
 * app.util
 * app.algorithm
 * app.oop
 * 
 */

app.context=(function(){
	var init=function(context){
		app.session.init(context);
		onCreate();
	};
	var onCreate=function(){
		setContentView();
		app.component.init();
		app.algorithm.init();
		app.oop.init();
	};
	var setContentView= function(){
		
	};
	return {
		init : init,
		setContentView:setContentView,
		onCreate :onCreate
	};
	
})();
app.session=(function(){
	var init = function(context){
		sessionStorage.setItem('context',context);
		sessionStorage.setItem('js',context+'/resources/js');
		sessionStorage.setItem('css',context+'/resources/css');
		sessionStorage.setItem('img',context+'/resources/img');
	};
	var getContextPath= function(){return sessionStorage.getItem('context');};
	var getJavascriptPath=function(){return sessionStorage.getItem('js');};
	var getStylePath=function(){return session.getItem('css');};
	var getImagePath=function(){return session.getItem('img');};
	return{
		init : init,
		getContextPath:getContextPath,
	    getJavascriptPath:getJavascriptPath,
	    getStylePath:getStylePath,
	    getImagePath:getImagePath
	};
})();
app.util=(function(){})();
app.algorithm=(function(){
	/*알고리즘 수열*/
	var init=function(){
		onCreate();
	};
	var onCreate=function(){
		setOnContentView();
		series();
	};
	var setContentView=function(){};
	var series=function(){
		var wrapper=app.comonent.getWrapper();
		$('#series').on('click',function(){
			wrapper.empty();
			wrapper.append(app.algorithm.TABLE);
			$('#tableLeft').html(app.algorithm.SERIES_MENU);
			var tableRight=$('#tableRight');
			app.component.inputText('inputText').attr('placeholder','시작값과 한계값 공차(공백으로 구분)입력').appendTo(tableRight);
			app.component.aButton('aButton','btn-primary').html('등차수열의 합').appendTo(tableRight)
			.css('margin','10px auto')
			.on('click',function(){
				var inputVal=$('#inputText').val();
				console.log('limit'+inputVal);
				var arr=inputVal.split(' ');
				var start=arr[0];
				var limit=arr[1];
				var diff=arr[2];
				console.log('start:'+start+'limit'+limit+'diff'+diff);
				app.component.divAlert('alert-danger').html(app.algorithm.aSeries(start,limit,diff)).appendTo(tableRight);
				
				$('#aSeries').on('click',function(){
					app.component.imputText('inputText').attr('placeholder','시작값과 한계값 공차(공백으로 구분)입력').appendTO(tableRight);
					app.component.aButton('aButton','btn-primary').html('등차수열의 합').apendTo(tableRight)
					.css('margin','10px auto')
					.on('click',function(){
						var inputVal=$('#inputText').val();
						console.log('limit'+inputVal);
						var arr=val.split(' ');
						var start=arr[0];
						var limit= arr[1];
						var diff=arr[2];
						console.log('start'+start+',limit'+limit+',diff'+diff);
						app.component.divAlert('alert-danger').html(start+'부터'+limit+'까지 등차수열의 합은'+aSeries(start,limit,diff)).appendTo(tableRight);
					});
				});
				$('#swSeries').on('click',function(){
					app.component.inputText('inputText').arr('placeholder','limit').appenTo(tableRight);
					app.component.aButton('aButton','btn-success').html('스위치수열의 합').appendTo(tableRight)
					.css('margin','10px auto')
					.on('click',function(){
						var limit=$('#inputText').val();
						app.component.divAlert('alert-success').html('1부터'+limit+'스위치수열의 합은'+swSeries(limit)+'입니다').appendTo(tableRight);
					});
				});
				$('#dSeries').on('click',function(){
					app.component.inputText('inputText').arr('placeholder','limit').appendTo(tableRight);
					  app.component.aButton('aButton','btn-info').html('계차수열의 합').appendTo(talbeRight);
					
				});
			});
			
		
		})
	};
})();


/*View
 * app.component
 * app..navi
 * app.patient
 */
app.component=(function(){
	var _body,_wrapper;
	var setBody=function(body){this._body=body;};
	var getBody=function(){return this._body;};
	var setWrapper=function(wrapper){this._wrapper=wrapper;};
	var getWrapper=function(){return this._wrapper;};
	
	
})();



/*Controller
 * 
 */