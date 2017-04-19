var app = app || {};
/*
 * Model app.context app.session aap.util app.algorithm app.loop
 * 
 * 
 * 2017.04.19
 */
app.context = (function() {
	var init = function(context) {
		app.session.init(context);
		onCreate();
		alert('contenxt :' + app.session.getContextPath());
	};
	var onCreate = function() {
		setContentView();
		app.component.init();
		app.algorithm.init();
		app.oop.init();
		app.person.init();
	};
	var setContentView = function() {
	};
	return {
		init : init,
		setContentView : setContentView,
		onCreate : onCreate

	};
})();
app.session = (function() { // Template Method Pattern
	var init = function(context) {
		sessionStorage.setItem('context', context);
		sessionStorage.setItem('js', context + '/resources/js');
		sessionStorage.setItem('css', context + '/resources/css');
		sessionStorage.setItem('img', context + '/resources/iamges');
	};
	var getContextPath = function() {
		return sessionStorage.getItem('context');
	};
	var getJavascriptPath = function() {
		return sessionStorage.getItem('js');
	};
	var getStylePath = function() {
		return sessionStorage.getItem('css');
	};
	var getImagePath = function() {
		return sessionStorage.getItem('img');
	};
	return {
		init : init,
		getContextPath : getContextPath,
		getJavascriptPath : getJavascriptPath,
		getStylePath : getStylePath,
		getImagePath : getImagePath
	};
})();
/*
========= app-ui ====
@AUTHOR : pakjkwan@gmail.com
@CREATE DATE : 2017-4-1
@UPDATE DATE : 2017-4-1
@DESC : 
==============================
*/
app.ui={}

app.util = (function() {
})();

app.algorithm = (function() {
	var init = function() {
		onCreate();
	};
	var onCreate = function() {
		setContentView();
		series();
		arr();
		matrix();
		math();
	};
	var setContentView = function() {
	};
	var series = function() {
		var wrapper = app.component.getWrapper();
		$('#series')
				.on(
						'click',
						function() {
							alert('#series...');
							wrapper.empty();
							wrapper.append(app.algorithm.TABLE);
							$('#tableLeft').html(app.algorithm.SERIES_MENU);
							var tableRight = $('#tableRight');
							app.component.inputText('inputText').attr(
									'placeholder', '시작값 한계값 공차(공백으로 구분)입력')
									.appendTo(tableRight);
							app.component.aButton('aButton', 'btn-primary')
									.html('등차수열의 합').appendTo(tableRight).css(
											'margin', '10px auto').on(
											'click',
											function() {
												var inputVal = $('#inputText')
														.val();
												console.log('inputVal:'
														+ inputVal);
												var arr = inputVal.split(' ');
												var start = arr[0];
												var limit = arr[1];
												var diff = arr[2];
												console.log('start:' + start
														+ ',limit:' + limit
														+ ',diff:' + diff);
												app.component.divAlert(
														'alert-danger').html(
														app.algorithm.aSeries(
																start, limit,
																diff))
														.appendTo(tableRight);
											});
							$('#aSeries')
									.on(
											'click',
											function() {
												alert('aSeries !!!');
												tableRight.empty();
												app.component.inputText(
														'inputText').attr(
														'placeholder',
														'시작값 한계값(공백으로 구분)입력 ')
														.appendTo(tableRight);
												app.component
														.aButton('aButton',
																'btn-primary')
														.html('등차수열의 합')
														.appendTo(tableRight)
														.css('margin',
																'10px auto')
														.on(
																'click',
																function() {
																	var i = $(
																			'#inputText')
																			.val();
																	var j = i
																			.split(' ');
																	var k = arr[0];
																	var l = arr[1];
																	console
																			.log('k:'
																					+ k
																					+ ',l:'
																					+ l);
																	app.component
																			.divAlert(
																					'alert-primary')
																			.html(
																					k
																							+ '부터'
																							+ l
																							+ '까지 등차수열의 합은'
																							+ aSeries(
																									k,
																									l)
																							+ '입니다.')
																			.appendTo(
																					tableRight);
																});
											});
							$('#swSeries')
									.on(
											'click',
											function() {
												tableRight.empty();
												app.component.inputText(
														'inputText')
														.attr('placeholder',
																'한계값 입력')
														.appendTo(tableRight);
												app.component
														.aButton('aButton',
																'btn-success')
														.html('스위치수열의 합')
														.appendTo(tableRight)
														.css('margin',
																'10px auto')
														.on(
																'click',
																function() {
																	var limit = $(
																			'#inputText')
																			.val();
																	app.component
																			.divAlert(
																					'alert-success')
																			.html(
																					'1부터'
																							+ limit
																							+ '스위치수열의 합은'
																							+ swSeries(limit)
																							+ '입니다.')
																			.appendTo(
																					tableRight);
																});
											});
							$('#dSeries')
									.on(
											'click',
											function() {
												tableRight.empty();
												app.component.inputText(
														'inputText')
														.attr('placeholder',
																'한계값 입력')
														.appendTo(tableRight);
												app.component
														.aButton('aButton',
																'btn-info')
														.html('계차수열의 합')
														.appendTo(tableRight)
														.css('margin',
																'10px auto')
														.on(
																'click',
																function() {
																	var limit = $(
																			'#inputText')
																			.val();
																	app.component
																			.divAlert(
																					'alert-info')
																			.html(
																					'1부터'
																							+ limit
																							+ '계차수열의 합은'
																							+ dSeries(limit)
																							+ '입니다.')
																			.appendTo(
																					tableRight);
																});
											});

							$('#factorial')
									.on(
											'click',
											function() {
												tableRight.empty();
												app.component.inputText(
														'inputText')
														.attr('placeholder',
																'한계값 입력')
														.appendTo(tableRight);
												app.component
														.aButton('aButton',
																'btn-warning')
														.html('팩토리수열의 합')
														.appendTo(tableRight)
														.css('margin',
																'10px auto')
														.on(
																'click',
																function() {
																	var limit = $(
																			'#inputText')
																			.val();
																	app.component
																			.divAlert(
																					'alert-warning')
																			.html(
																					'1부터'
																							+ limit
																							+ '팩토리수열의 합은'
																							+ factorial(limit)
																							+ '입니다.')
																			.appendTo(
																					tableRight);
																});
											});
							$('#fibonacci')
									.on(
											'click',
											function() {
												tableRight.empty();
												app.component.inputText(
														'inputText')
														.attr('placeholder',
																'한계값 입력')
														.appendTo(tableRight);
												app.component
														.aButton('aButton',
																'btn-danger')
														.html('피보나치수열의 합')
														.appendTo(tableRight)
														.css('margin',
																'10px auto')
														.on(
																'click',
																function() {
																	var limit = $(
																			'#inputText')
																			.val();
																	app.component
																			.divAlert(
																					'alert-danger')
																			.html(
																					'1부터'
																							+ limit
																							+ '피보나치수열의 합은'
																							+ fibonacci(limit)
																							+ '입니다.')
																			.appendTo(
																					tableRight);
																});
											});
						});
	};
	var aSeries = function(start, limit, diff) {
		var start = start * 1, limit = limit * 1, diff = diff * 1;
		var sum = 0;
		var rs = "";
		var i = start;
		while (i <= limit) {
			rs += (i + diff > limit) ? i + "=" : i + "+";
			sum += i;
			i += diff;
		}
		return rs + sum;
	};

	// var wrapper = app.component.wrapper();

	var swSeries = function swSeries(limit) {
		var sum = 0, sw = 0;
		for (i = 0; i <= limit; i++) {
			if (i % 2 == 0) {
				sw = -i;
			} else {
				sw = i;
			}
			sum += sw;
		}
		return sum;

	};
	var dSeries = function(limit) {
		var sum = 1, d = 1;
		for (i = 1; i < limit; i++) {
			d += i;
			sum += d;
		}
		return sum;
	};
	var factorial = function(limit) {
		var sum = 0, fact = 1;
		for (i = 1; i <= limit; i++) {
			fact *= i;
			sum += fact;
		}
		return sum;
	};
	var fibonacci = function(limit) {
		var sum = 2, num1 = 1, num2 = 1, num3 = 2;
		for (i = 3; i <= limit; i++) {
			num3 = num1 + num2;
			num1 = num2;
			num2 = num3;
			sum += num3;
		}
		return sum;
	};
	/* 알고리즘 배열 */
	var arr = function() {
		var wrapper = app.component.getWrapper();
		$('#arr')
				.on(
						'click',
						function() {
							wrapper.empty();
							wrapper.append(app.algorithm.TABLE);
							var tableRight = $('#tableRight');
							var arr = [ {
								id : 'selectSort',
								txt : '선택정렬'
							}, {
								id : 'bubbleSort',
								txt : '버블정렬'
							}, {
								id : 'insertSort',
								txt : '삽입정렬'
							}, {
								id : 'ranking',
								txt : '석차구하기'
							}, {
								id : 'binSearch',
								txt : '이분검색'
							}, {
								id : 'merge',
								txt : '병합'
							}, {
								id : 'stack',
								txt : '스택'
							} ];
							var str = '';
							$
									.each(
											arr,
											function(i, j) {
												str += '<li id="'
														+ j.id
														+ '" class="list-group-item"><a href="#">'
														+ j.txt + '</a></li>';
											});
							$('#tableLeft').html(str);
							$('#selectSort').on(
									'click',
									function() {
										var arr = randomGen();
										var num = 0;
										for (i = 0; i < arr.length; i++) {
											for (j = i; j < arr.length; j++) {
												if (arr[i] > arr[j]) {
													num = arr[i];
													arr[i] = arr[j];
													arr[j] = num;
												}

											}
										}
										$('#tableRight').html(
												app.component.horList(arr,
														'default'));

									});
							$('#bubbleSort').on(
									'click',
									function() {
										var arr = randomGen();
										for (i = 0; i < arr.length; i++) {
											for (j = 0; j < arr.length; j++) {
												if (arr[j] > arr[j + 1]) {
													num = arr[j];
													arr[j] = arr[j + 1];
													arr[j + 1] = num;
												}
											}
										}
										$('#tableRight').html(
												app.component.horList(arr,
														'default'));
									});
							$('#insertSort').on(
									'click',
									function() {
										var arr = randomGen();
										var num = 0;
										for (i = 1; i <= arr.length; i++) {
											for (j = 0; j <= i; j++) {
												if (arr[j] > arr[i]) {
													num = arr[i];
													arr[i] = arr[j];
													arr[j] = num;
												}
											}
										}
										$('#tableRight').html(
												app.component.horList(arr,
														'default'));
									});
							$('#ranking').on(
									'click',
									function() {
										var arr = randomGen();
										var rank = [ 1, 1, 1, 1, 1, 1 ];
										for (i = 0; i < arr.length; i++) {
											for (j = 0; j < arr.length; j++) {
												if (arr[i] < arr[j]) {
													rank[i]++;
												}
											}
										}

										$('#tableRight').html(
												app.component.horList(arr,
														'default'));
										tableRight.append(app.component
												.horList(rank, 'default'));
									});
							$('#binSearch')
									.on(
											'click',
											function() {
												var arr = randomGen();
												var bin = sort(arr);
												var result = 0;
												$('#tableRight')
														.html(
																app.component
																		.horList(
																				arr,
																				'default'));
												app.component.inputText(
														'inputText').attr(
														'placeholder',
														'찾을 숫자를 입력').appendTo(
														tableRight);
												app.component
														.aButton('aButton',
																'btn-danger')
														.html('숫자의 위치')
														.appendTo(tableRight)
														.css('margin',
																'10px auto')
														.on(
																'click',
																function() {
																	var val = $(
																			'#inputText')
																			.val();
																	var fnum = (bin.length - 1)
																			- bin.length
																			- 2;
																	var pnum = bin.length - 1;
																	var num = val * 1;
																	for (i = 0; i < pnum; i++) {
																		if (fnum <= pnum) {
																			var m = Math
																					.floor((fnum + pnum) / 2);
																			app.component
																					.divAlert(
																							'alert-primary')
																					.html(
																							'중간 값 :'
																									+ m)
																					.appendTo(
																							tableRight);
																			if (val == bin[m]) {
																				result = m * 1;
																				app.component
																						.divAlert(
																								'alert-primary')
																						.html(
																								'당신이 생각한 숫자의 위치는 '
																										+ result
																										+ ' 찾으시는 숫자는 '
																										+ bin[m]
																										+ ' 입니다.')
																						.appendTo(
																								tableRight);
																				break;
																			}
																			if (bin[m] < val) {
																				pnum = m - 1;

																			} else {
																				fnum = m + 1;
																			}
																		} else {
																			app.component
																					.divAlert(
																							'alert-primary')
																					.html(
																							'숫자를 찾을 수 없습니다.')
																					.appendTo(
																							tableRight)

																			break;
																		}
																	}
																});
											});
							$('#merge')
									.on(
											'click',
											function() {
												var arr1 = randomGen();
												var arr2 = randomGen();
												var arra = sort(arr1);
												var arrb = sort(arr2);
												var arrc = [];
												var i = 0;
												var j = 0;
												$('#tableRight')
														.html(
																app.component
																		.horList(
																				arra,
																				'default'));
												tableRight.append(app.component
														.horList(arrb,
																'default'));
												app.component
														.aButton('aButton',
																'btn-danger')
														.html('병합')
														.appendTo(tableRight)
														.css('margin',
																'10px auto')
														.on(
																'click',
																function() {
																	for (k = 0; k < 12; k++) {
																		if (arra[i] < arrb[j]) {
																			arrc[k] = arra[i];
																			i++;
																		} else if (arra[i] == arrb[j]) {
																			arrc[k] = arra[i];
																			i++;
																		} else {
																			arrc[k] = arrb[j];
																			j++;
																		}
																	}
																	tableRight
																			.append(app.component
																					.horList(
																							arrc,
																							'default'));
																});
											});

							$('#stack')
									.on(
											'click',
											function() {
												alert('aaa');
												var tableRight = $('#tableRight');
												// var num=randomGen();
												var stack = [ 1, 1, 1, 1, 1, 1 ];
												var i = 0;
												app.component.inputText(
														'inputText').attr(
														'placeholder', '입력 값')
														.appendTo(tableRight);
												app.component
														.aButton('aButton',
																'btn-danger')
														.html('입력')
														.appendTo(tableRight)
														.css('margin',
																'10px auto')
														.on(
																'click',
																function() {

																	var val = $(
																			'#inputText')
																			.val();
																	if (6 < i) {
																		stack[i] = val;
																		i++;

																	} else {
																		app.component
																				.inputText(
																						'inputText')
																				.attr(
																						'placeholder',
																						'스택이 넘처납니다.')
																				.appendTo(
																						tableRight);
																	}
																	$(
																			'#tableRight')
																			.append(
																					app.component
																							.horList(
																									stack,
																									'default'));

																});
												app.component
														.aButton('aButton',
																'btn-danger')
														.html('삭제')
														.appendTo(tableRight)
														.css('margin',
																'10px auto')
														.on(
																'click',
																function() {
																	if (0 < i) {
																		stack[--i] = ' ';
																	} else {
																		app.component
																				.inputText(
																						'inputText')
																				.attr(
																						'placeholder',
																						'스택값이 없습니다..')
																				.appendTo(
																						tableRight);
																	}
																	$(
																			'#tableRight')
																			.append(
																					app.component
																							.horList(
																									stack,
																									'default'));
																});
											});
						});
	};

	var randomGen = function() {
		var i = 0;
		var arr = [];
		for (; i < 6; i++) {
			arr[i] = Math.floor(Math.random() * 45) + 1;

		}

		return arr;
	};
	var sort = function(arr) {
		var num = 0;
		for (i = 1; i <= arr.length; i++) {
			for (j = 0; j <= i; j++) {
				if (arr[j] > arr[i]) {
					num = arr[i];
					arr[i] = arr[j];
					arr[j] = num;
				}
			}
		}
		return arr;
	};
	var horizontalTable = function(arr) {
		var table = '';
		table += '<table style="width:360px;height:280px;border-collapse: collapse;border: 1px solid black;margin:0 auto"><tbody><tr>';
		$.each(arr, function(i, j) {
			table += '<td>' + arr[i] + '</td>';
		});
		table += '</tr></tbody></table>';
		return table;
	};
	/* 알고리즘 행열 */
	var matrix = function() {
		var wrapper = app.component.getWrapper();
		$('#matrix').on(
				'click',
				function() {
					wrapper.empty();
					wrapper.append(app.algorithm.TABLE);
					var arr = [ {
						id : 'basic',
						txt : '기본5X5'
					}, {
						id : 'zigzag',
						txt : '지그재그'
					}, {
						id : 'diamond',
						txt : '다이아몬드'
					}, {
						id : 'sandGlass',
						txt : '모래시계'
					}, {
						id : 'snail',
						txt : '달팽이'
					}, {
						id : 'magicSquare',
						txt : '마방진'
					} ];
					var str = '';
					$.each(arr, function(i, j) {
						str += '<li id="' + j.id
								+ '" class="list-group-item"><a href="#">'
								+ j.txt + '</a></li>';
					});
					$('#tableLeft').html(str);
					basic();
				});
	};
	var basic = function() {
		$('#basic').on(
				'click',
				function() {
					var mtx = new Array(new Array(5), new Array(5),
							new Array(5), new Array(5), new Array(5));
					var jason = [ {
						a : 1,
						b : 2,
						c : 3,
						d : 4,
						e : 5
					},// {}은 jason표시이다.
					{
						a : 6,
						b : 7,
						c : 8,
						d : 9,
						e : 10
					}, {
						a : 11,
						b : 12,
						c : 13,
						d : 14,
						e : 15
					}, {
						a : 16,
						b : 17,
						c : 18,
						d : 19,
						e : 20
					}, {
						a : 21,
						b : 22,
						c : 23,
						d : 24,
						e : 25
					}, ]
					$('#tableRight')
							.html(
									app.component.panelTable(jason, 'basic',
											'default'));

				});
	};
	/* 알고리즘 수학 */
	var math = function() {
		var wrapper = app.component.getWrapper();
		$('#math').on(
				'click',
				function() {
					wrapper.empty();
					wrapper.append(app.algorithm.TABLE);
					var arr = [ {
						id : 'determinePrime',
						txt : '소수판별'
					}, {
						id : 'primeSum',
						txt : '소수의 합'
					}, {
						id : 'primeCount',
						txt : '소수의 개수'
					}, {
						id : 'lcmGcd',
						txt : '최대공약수/최소공양수'
					}, {
						id : 'euclid',
						txt : '유클리드 호제법'
					}, {
						id : 'factorization',
						txt : '약수구하기'
					}, {
						id : 'primefactor',
						txt : '소인수분해'
					}, {
						id : 'multiplSum',
						txt : '배수의 합'
					}, {
						id : 'approx',
						txt : '근사값구하기'
					}, ];
					var str = '';
					$.each(arr, function(i, j) {
						str += '<li id="' + j.id
								+ '" class="list-group-item"><a href="#">'
								+ j.txt + '</a></li>';
					});
					$('#tableLeft').html(str);
					determinePrime();
					primefactor();
					multiplSum();
					approx();
				});
	};
	var determinePrime = function() {
		$('#determinePrime').on('click', function() {
			alert('determinePrime click!!!');
		});
	};
	var primefactor = function() {
		$('#primefactor')
				.on(
						'click',
						function() {
							alert('primefactor click!!!');
							app.component.inputText('inputText').attr(
									'placeholder', '입력 값').appendTo(tableRight);
							app.component
									.aButton('aButton', 'btn-danger')
									.html('분해')
									.appendTo(tableRight)
									.css('margin', '10px auto')
									.on(
											'click',
											function() {
												var val = $('#inputText').val() * 1;
												var result = '';
												var prime = 2;
												var sqrt = val;
												for (i = 2; i <= sqrt; i++) {
													if (val % prime != 0) {
														prime++;

													} else {
														val = val / prime;
														result += prime + '*';

													}

												}
												app.component
														.divAlert(
																'alert-primary')
														.html(
																num
																		+ '의 소인수 분해 결과는'
																		+ result
																				.substr(
																						0,
																						result
																								.lastIndexOf('*'))
																		+ '입니다.')
														.appendTo(tableRight);
											});

						});
	};
	var multiplSum = function() {
		$('#multiplSum').on(
				'click',
				function() {
					alert('배수의 합');
					app.component.inputText('inputText').attr('placeholder',
							'입력 값').appendTo(tableRight);
					app.component.aButton('aButton', 'btn-danger')
							.html('배수의 합').appendTo(tableRight).css('margin',
									'10px auto').on(
									'click',
									function() {
										var val = $('#inputText').val();
										var d = 0;
										var sum = 0;
										for (i = 0; i < 100; i++) {
											if (i % val == 0) {
												sum += i;
											}
										}
										app.component.divAlert('alert-primary')
												.html(
														val + '의 배수의 합는' + sum
																+ '입니다.')
												.appendTo(tableRight);
									});
				});
	};
	var approx = function() {
		$('#approx').on(
				'click',
				function() {
					alert('근사값 구하기');
					app.component.inputText('inputText').attr('placeholder',
							'입력 값').appendTo(tableRight);
					app.component.aButton('aButton', 'btn-danger').html(
							'근사값 구하기').appendTo(tableRight).css('margin',
							'10px auto').on(
							'click',
							function() {
								var arr = [];
								var val = $('#inputText').val() * 1;
								var m = 0;
								var j = 99;
								var result = 0;
								for (i = 0; i <= 100; i++) {
									if (val <= arr[i]) {
										m = arr[i] - val;
									} else {
										m = val - arr[i];
									}
									if (m <= j) {
										j = m;
										result = arr[i];
									}
								}
								app.component.divAlert('alert-primary').html(
										val + '의 근사값은' + result + '입니다.')
										.appendTo(tableRight);
							});
				});
	};
	var number = function() {
		var num = [];
		for (i = 0; i <= 100; i++) {
			num += i;
		}
		return num;
	};
	/* 알고리즘 응용 */
	var appl = function() {
	};
	return {
		init : init,
		aSeries : aSeries,
		series : series,
		swSeries : swSeries,
		dSeries : dSeries,
		factorial : factorial,
		fibonacci : fibonacci,
		arr : arr,
		randomGen : randomGen,
		horizontalTable : horizontalTable,
		matrix : matrix,
		basic : basic,
		sort : sort,
		math : math,
		determinePrime : determinePrime,
		primefactor : primefactor,
		multiplSum : multiplSum,
		approx : approx,
		appl : appl
	};
})();
app.oop = (function() {
	var init = function() {
		onCreate();
	};
	var onCreate = function() {
		setContentView();
		encap();
	};
	var setContentView = function() {
	};
	var encap = function() {
		var wrapper = app.component.getWrapper();
		$('#encap').on(
				'click',
				function() {
					wrapper.empty();
					wrapper.append(app.algorithm.TABLE);
					$('#tableLeft').html(app.oop.OOP_MENU);
					var tableRight = $('#tableRight');
					app.component.inputText('inputText').attr('placeholder',
							'이름 나이 성별 직업(공백으로 구분)입력').appendTo(tableRight);
					app.component.aButton('aButton', 'btn-primary')
							.html('스펙보기').appendTo(tableRight).css('margin',
									'10px auto').on(
									'click',
									function() {
										var inputVal = $('#inputText').val();
										var arr = inputVal.split(' ');
										console.log(inputVal);
										app.person.setName(arr[0]);
										app.person.setAge(arr[1]);
										app.person.setGender(arr[2]);
										app.person.setJob(arr[3]);
										console.log(app.person);
										var spec = '<h5>'
												+ app.person.toString()
												+ '</h5>';
										app.component.divAlert('alert-danger')
												.html(spec)
												.appendTo(tableRight);
									});
				});
	};

	return {
		init : init,
		encap : encap,
		inherit : function() {
		},
		poly : function() {
		}
	};
})();
app.info = (function() {
	var _name, _age, _gender, _job;
	return {
		setName : function(name) {
			this._name = name;
		},
		setAge : function(age) {
			this._age = age;
		},
		setGender : function(gender) {
			this._gender = gender;
		},
		setJob : function(job) {
			this._job = job;
		},
		getName : function() {
			return this._name;
		},
		getAge : function() {
			return this._age;
		},
		getGender : function() {
			return this._gender;
		},
		getJob : function() {
			return this._job;
		},
		toString : function() {
			return this._name + ',' + this._age + ',' + this._gender + ','
					+ this._job;
		}
	};

})();
app.person = (function() {
	var wrapper, ctx, img, js, ccs;
	var init = function() {
		wrapper = app.component.getWrapper();
		ctx = app.session.getContextPath();
		img = app.session.getImagePath();
		js = app.session.getJavascriptPath();
		css = app.session.getStylePath();
		$('#wrapper').load(ctx + '/permission/form');

	};

	return {
		init : init,

	};
})();
app.component = (function() {
	var _body, _wrapper;
	var setBody = function(body) {
		this._body = body;
	}
	var getBody = function() {
		return this._body;
	}
	var setWrapper = function(wrapper) {
		this._wrapper = wrapper;
	}
	var getWrapper = function() {
		return this._wrapper;
	}
	var init = function() {
		onCreate();
	};
	var onCreate = function() {
		setContentView();
	};
	var setContentView = function() {
		app.component.setWrapper($('#wrapper'));
		app.component.setBody($('body'));
	};
	return {
		init : init,
		getWrapper : getWrapper,
		setWrapper : setWrapper,
		getBody : getBody,
		setBody : setBody,
		div : function(id) {
			return $(id);
		},
		aButton : function(id, type) {
			return $('<a href="#" id="' + id + '" class="btn ' + type
					+ '" role="button">example</a>');
		},
		bButton : function() {
			return $('<button id="bButton" type="button" class="btn btn-default">example</button>');
		},
		inputText : function(id) {
			return $('<input id="'
					+ id
					+ '" type="text" class="form-control" placeholder="example" aria-describedby="basic-addon1">');
		},
		divAlert : function(type) { // alert-danger
			return $('<div class="alert ' + type
					+ '" role="alert">example</div>');
		},
		horList : function(arr, type) {
			var list = '<div class="btn-group" role="group" aria-label="...">';
			$.each(arr, function(i, j) {
				list += '<button id="list-button-"' + i
						+ ' type="button" class="btn btn-' + type + '">'
						+ arr[i] + '</button>';
			});
			list += '</div>';
			return list;
		},
		panelTable : function(jason, txt, type) {
			var table = '<div class="panel panel-' + type + '">'
					+ '<div calss="panel-heading">행렬</div>'
					+ '<table id="table">' + '<tr style="width:250px">'
					+ '<th colspan="5">' + txt + '</th>' + '</tr>' + '<tbody>';
			$.each(jason, function(i, j) {
				table += '<tr>' + '<td style="width:200%">' + j.a + '</td>'
						+ '<td style="width:200%">' + j.b + '</td>'
						+ '<td style="width:200%">' + j.c + '</td>'
						+ '<td style="width:200%">' + j.d + '</td>'
						+ '<td style="width:200%">' + j.e + '</td>' + '</tr>';

			});
			table += '<tbody></table>'
			return table;
		},

	};
})();
app.permission = (function() {
	var execute = function() {
		var context = app.session.getContextPath();
		console.log('context:' + context);
		$('#login-submit').on('click', function(e) {
			alert('login-submit click!!!');
			e.preventDefault();
			$.ajax({
				url : context + "/login",
				method : "POST",
				data : JSON.stringify({
					id : $('#username').val(),
					pass : $('#password').val()
				}),
				dataType : "json",
				contentType : 'application/json',
				success : function(data) {
					if (data.result === 'success') {
						$('#wrapper').html(app.patient.ui.gnb());
						alert('환영합니다: ' + data.name + ',' + data.group + '님');
						/* 환영합니다 홍길동 환자님, or 한석규 의사님 */
					} else {
						alert('존재하지 않는 아이디 입니다.');
					}
				},
				error : function(xhr, status, msg) {
					alert('로그인 실패이유' + msg);
				}
			});
		});
		$('#login-form-link').click(function(e) {
			alert('login-form-click-form');
			$("#login-form").delay(100).fadeIn(100);
			$("#register-form").fadeOut(100);
			$('#register-form-link').removeClass('active');
			$(this).addClass('active');
			e.preventDefault();
			$.ajax({});
		});
		$('#register-form-link').click(function(e) {
			alert('register-click-form');
			$("#register-form").delay(100).fadeIn(100);
			$("#login-form").fadeOut(100);
			$('#login-form-link').removeClass('active');
			$(this).addClass('active');
			e.preventDefault();
			$.ajax({});
		});
		/* radio 체크 할때마다 incommon-info 의 화면이 변통됨
		 * */
		$('#register-patient').on('click', function(e) {
			alert('register-patient');
			e.preventDafault();
			var _id=$('#id').val();
			var _pass=$('#pass').val();
			var _name=$('#name').val();
			var _phone=$('#phone').val();
			if(app.util.validation(_id)
					&&app.util.validation(_pass)
					&&app.util.validation(_name)
					&&app.util.validation(_phone)){
				var json={
						'id':_id,
						'name':_name,
						'pass':_pass,
						'phone':_phone,
						'email':$('#email').val()
				};
				$.ajax({
					url : context + '/post/patient',
					method:'POST',
					data:JSON.stringify(json),
					dataType:"json",
					contentType:'applicaiton/json',
					success : function(data){
						console.log(data.name);
						alert('회원가입 성공 .. 로그인 바랍니다');
						location.reload();
					},
						error : function(xhr, status, msg) {
							alert('환자 가입시 발생에러' + msg);
						}
				});
			}else{
				alert('반드시 입력되야 하는 값이 비워져 있습니다.');
			};
		});
		$('#register-doctor').on('click', function(e) {
			alert('register-doctor');
			e.preventDafault();
			$.ajax({
				url : context + "/post/doctor",
				method:'POST',
				data:JSON.stringify({}),
				dataType:'json',
				contentType:'application/json',
				success: function(data){},
				error:function(xhr,status,msg){alert('의사 가입시 에러:'+msg);}
			});
		});
		$('#register-nurse').on('click', function(e) {
			alert('register-nurse');
			e.preventDafault();
			$.ajax({
				url : context + "/post/nurse",
				method : "POST",
				data : JSON.stringify({
					id : $('#id').val(),
					pass :$('#password').val(),
				
					name:$('#name').val()
										
				}),
				dataType:'json',
				contentType:'application/json',
				success:function(data){},
				error:function(xhr,status,msg){alert('환자가입시 에러:'+msg);}

			});
		});
		$('#register-admin').on('click', function(e) {
			alert('register-admin');
			e.preventDafault();
			$.ajax({
				url : context + "/post/admin",
				method:'POST',
				data: JSON.stringify({}),
				dataType:'json',
				contentType:'application/json',
				success:function(data){},
				error:function(xhr,status,msg){alert('admin가입시 에러'+msg);}
			});
		});

	};
	return {
		execute : execute
	};
})();

app.navi = (function() {
})();
app.util={
		validation :function(x){return (x !="");}
};



app.patient = (function() {
})();
app.patient.ui= {
		gnb:function(){
			var hrefArr=['','','','','',''];
			var txtArr=['홈으로','마이페이지','진료기록','게시판','로그아웃'];
			var gnb='<ul id="patGnb"> class="gnb width_full_size" style="margin: 0px;">';
			for(var i=0;i5;i++){
				gnb+='<li><a class="text_no_underline color_black"></a></li>';
			}
			gnb+='</ul>';
			$('#patGnb').attr('href','').text('홈으로');
			+'<li><a>홈으로</a></li>'
			+'<li><a>마이페이지</a></li>'
			+'<li><a>진료기록</a></li>'
			+'<li><a>게시판</a></li>'
			+'<li><a>로그아웃</a></li>'
			+'<li>'
				+'<div class="tooltip"><a href="#">병원소개</a>'
			    +'<span class="tooltiptext"> 구현되지 않는 작업입니다.</span>'
			    +'</div>'
			+'</li>'
			+'</ul>'
	         return gnb;
		},
		
		detail: function(){
			var detail='';
			var table='<table>';
			var tr = 'tr';
			var td= 'td';
			/*
			<style>
			.pat_detail {text-align: center; margin:0 auto;}
			.pat_detail tr td{border: 1px solid #bbbbbb}
			</style*///>


			'<div class="con_setting" style="position: relative; top: 10px; text-align:center; width:100%">'
			  +    '<div>'
			   +         '<table class="pat_detail">'
			    +              '<tr style="text-align: left;">'
			    +                  '<td colspan="5"><div><img src="${context.img}/common/defaultimg.jpg" alt="" width="160px"/></div></td>'
			     +             '</tr>'
			      +            '<tr>'
			       +                 '<td style="width: 60px" rowspan="5"><span style="font-size: 20px">환<br />자<br />정<br />보</span></td>'
			        +                '<td style="width: 100px">이름</td>'
			         +               '<td style="width: 150px">${user.name}</td>'
			          +              '<td style="width: 100px">직업</td>'
			           +             '<td style="width: 150px"></td>'
			            +      '</tr>'
			             +     '<tr>'
			              +          '<td>생년월일</td>'
			               +         '<td><%-- ${user.birth} --%></td>'
			                +        '<td>키</td>'
			                 +       '<td>180Cm</td>'
			                 + '</tr>'
			                  +'<tr>'
			                  +      '<td>성별</td>'
			                   +     '<td>${user.gen}</td>'
			                   +     '<td>나이/몸무게</td>'
			                    +    '<td>/80kg</td>'
			                  + '</tr>'
			                 + '<tr>'
			                  +      '<td>전화번호</td>'
			                   +     '<td>${user.phone}</td>'
			                    +    '<td>혈액형</td>'
			                     +   '<td>A형</td>'
			                 + '</tr>'
			                 + '<tr>'
			                  +      '<td>주소</td>'
			                  +      '<td>${user.addr}</td>'
			                   +     '<td>주치의</td>'
			                    +    '<td >'
			                    +	'<a onclick="docDetail()" href="#">${user.docID}</a></td>'
			                  + '</tr>'
			                  +'</table>'
			            +'<button onclick="getPatId()" >뿌잉뿌잉</button>'
			           + '</div>'
			           + '</div>'
		}
};
	

app.algorithm.TABLE = '<table id="table" style="width:800px;height:300px;border-collapse: collapse;border: 1px solid black;margin:0 auto">'
		+ '<tr style="border: 1px solid black;">'
		+ '<td id="tableLeft" style="width: 50%;border: 1px solid black;"></td>'
		+ '<td id="tableRight" style="width: 50%;border: 1px solid black;"></td>'
		+ '</tr>' + '</table>';

app.algorithm.SERIES_MENU = '<ul class="list-group">'
		+ '<li id="aSeries" class="list-group-item"><a href="#">등차수열 합</a></li>'
		+ '<li id="swSeries" class="list-group-item"><a href="#">스위치수열 합</a></li>'
		+ '<li id="dSeries" class="list-group-item"><a href="#">계차수열 합</a></li>'
		+ '<li id="factorial" class="list-group-item"><a href="#">팩토리얼</a></li>'
		+ '<li id="fibonacci" class="list-group-item"><a href="#">피보나치수열 합</a></li>'
		+ '</ul>';
app.oop.OOP_MENU = '<ul class="list-group">'
		+ '<li id="encap" class="list-group-item"><a href="#">캡슐화</a></li>'
		+ '<li id="inherit" class="list-group-item"><a href="#">상 속</a></li>'
		+ '<li id="poly" class="list-group-item"><a href="#">다형성</a></li>'
		+ '</ul>';

/*
 * 알고리즘 클래스
 */
function aSequence(i) {
	var j = 1, k = '';
	for (; j <= i; j++) {
		k += j + '+';
	}
	return k;
}

function dSeries(limit) {
	var sum = 0;

	return sum;
}
function factorial(limit) {
	var sum = 0;

	return sum;
}
function fibonacci(limit) {
	var sum = 0;

	return sum;
}
