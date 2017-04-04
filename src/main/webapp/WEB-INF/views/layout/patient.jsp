<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/xml" prefix="x"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<title><tiles:getAsString name="title"></tiles:getAsString></title>
<link rel="stylsheet" href="${context.css}/hanbit.css"></link>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="${context.js}/hospital.js"></script>
<style type="text/css">
@CHARSET "UTF-8";
/* reset style */
html, body {
margin: 0;padding: 0;border: 0;font-size: 12px;color:#666;font-family:'Dotum', tahoma,arial,sans-serif,verdana,helvetica;
background: transparent;} 
h1,h2,h3,h4,h5,h6,p{margin-top:0;}
fieldset, img{border:0;}
table{border-collapse:collapse;border-spacing :0;}
caption, th, td{text-align : left;vertical-align : top;font-weight : normal;}
input, textarea, select{font-size:110%;line-height:1.1;}
abbr, acronym{border-bottom : .1em dotted;cursor : help;}
sup{vertical-align : text-top;}
sub{vertical-align : text-bottom;}
blockquote, q {quotes: none;}  
a:link {color: #808080;} /* unvisited link */
a:visited {color: #808080;}/* visited link */  
a:hover {color: #808080;}/* mouse over link */
a:active {color: #408080;} /* selected link */  
/* customized style */
.bg_color_black{background-color: black;}
.bg_color_skyblue{background-color:skyblue;}
.bg_color_darkgrey{background-color:#5a5a5a;}
.border_dotted {border-style: dotted;}
.border_dashed {border-style: dashed;}
.border_solid {border-style: solid;}
.border_double {border-style: double;}
.border_groove {border-style: groove;}
.border_ridge {border-style: ridge;}
.border_inset {border-style: inset;}
.border_outset {border-style: outset;}
.border_none {border-style: none;}
.border_hidden {border-style: hidden;}
.border_mix {border-style: dotted dashed solid double;}
.color_blue{color: blue;}
.color_red{color: red;}
.color_yellow{color: yellow;}
.color_white{color: #c0c0c0;}
.display_block{display: block;}
.display_inline{display: inline;}
.display_none{display: none;} /* no space */
.display_hidden{visibility: hidden;} /* taking space */
.event_hover:hover{background-color: blue;}
.font_bold{ font-weight: bold;}
.font_italic{font-style: italic;}
.height_full_size{height:100%;}
.list_circle{list-style-type: circle;}
.list_square{list-style-type: square;}
.list_upper_roman{list-style-type: upper-roman;}
.list_lower_alpha{list-style-type: lower-alpha;}
.margin_center{margin: 0 auto;}
.position_fix{position: fixed;}
.position_abs{position: absolute;}
.position_rel{position: relative;}
.table_default{border:1px solid #585858;border-collapse: collapse;}
.table_default tr{border:1px solid #585858;border-collapse: collapse;}
.table_default tr>th{border:1px solid #585858;border-collapse: collapse;}
.table_default tr>td{border:1px solid #585858;border-collapse: collapse;}
.table_bottom{border-bottom:1px solid #585858;border-collapse: collapse;}
.table_bottom tr{border-bottom:1px solid #585858;border-collapse: collapse;}
.table_bottom tr th{border-bottom:1px solid #585858;border-collapse: collapse;}
.table_bottom tr td{border-bottom:1px solid #585858;border-collapse: collapse;}
.table_even tr:nth-child(even){background-color:#ffffb9}
.table_odd tr:nth-child(odd){background-color:#ffffb9}
.text_center{text-align: center;}
.text_left{text-align: left;}
.text_right{text-align: right;}
.text_no_underline{text-decoration: none;}
.text_overline{text-decoration: overline;}
.text_line_through{text-decoration: line-through;}
.width_full_size{width: 100%;}

/* referenced by W3school*/

.dropdown {
    position: relative;
    display: inline-block;
}

.dropdown_content {
    display: none;
    position: absolute;
    background-color: #ff80c0;
    color:#c0c0c0;
    min-width: 80px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    padding: 2px;
    z-index: 1;
}


.dropdown:hover .dropdown_content {
    display: block;
}
.dropdown_content p a {color: balck;}

.tooltip {
    position: relative;
    display: inline-block;
   /*  border-bottom: 1px dotted black; */
}

.tooltip .tooltiptext {
    visibility: hidden;
    width: 120px;
    background-color: #ff8080;
    color: #fff;
    text-align: center;
    border-radius: 6px;
    padding: 5px 0;

    /* Position the tooltip */
    position: absolute;
    z-index: 1;
}

.tooltip:hover .tooltiptext {
    visibility: visible;
}

div.gallery {
    margin: 5px;
    border: 3px solid #8080c0;
    float: left;
    width: 200px;
}

div.gallery:hover {
    border: 5px solid #ff80c0;
}

div.gallery img {
    width: 100%;
    height: 300px;
}

div.gallery_desc {
    padding: 15px;
    text-align: center;
}

.textarea_bbs {
    width: 100%;
    height: 150px;
    padding: 12px 20px;
    box-sizing: border-box;
    border: 2px solid #ccc;
    border-radius: 4px;
    background-color: #f8f8f8;
    font-size: 16px;
    resize: none;
}

/*나중에 jQuery 에 의해 제거될 대상*/

.notice>dd{float: left;}
.policy>dd{float: left;}
.gnb {
    list-style-type: none;
    margin: 0;
    padding: 0;
    /* overflow: hidden; */
    background-color: #333;
}
.gnb li {
    float: left;
}
.gnb li a {
    display: block;
    color: #c0c0c0;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
}
/* Change the link color to #111 (black) on hover */
.gnb li a:hover {
    background-color: #ff80c0;
}

.lnb {
    list-style-type: none;
    margin: 0;
    padding: 0;
    width: 200px;
    background-color: #c0c0c0;
    border: 1px solid #555;
}

.lnb li a {
    display: block;
    color: #000;
    padding: 8px 16px;
    text-decoration: none;
}

.lnb li {
    text-align: center;
    border-bottom: 1px solid #555;
}

.lnb li:last-child {
    border-bottom: none;
}

.lnb li a.active {
    background-color: #4CAF50;
    color: white;
}

.lnb li a:hover:not(.active) {
    background-color: #ffbfdf;
    color: #c0c0c0;
}
.paging {
    list-style-type: none;
    margin: 0;
    padding: 0;
    /* overflow: hidden; */
    background-color: #333;
}
.paging li {
    float: left;
}
.paging li a {
    display: block;
    color: #c0c0c0;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
}
/* Change the link color to #111 (black) on hover */
.paging li a:hover {
    background-color: #ff80c0;
}



#admin_tab tr td{height:40px;}
#admin_tab tr th{height:40px;}


</style>
</head>
<body>
	<header>
		<div id="publicHeader">
			<tiles:insertAttribute name="header" />
		</div>
	</header>
	<section>
		<article id="patientGnb">
			<tiles:insertAttribute name="gnb" />
		</article>
		<article id="patientArticle">
			<tiles:insertAttribute name="container" />
		</article>
	</section>
	<footer>
		<div id="publicFooter">
			<tiles:insertAttribute name="footer" />
		</div>
	</footer>
</body>
</html>

