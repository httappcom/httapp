*{
	margin:0px; 
	padding:0px;
	color:black;
}
body{
	/* IE9 SVG, needs conditional override of 'filter' to 'none' */
		background: url(data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiA/Pgo8c3ZnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgd2lkdGg9IjEwMCUiIGhlaWdodD0iMTAwJSIgdmlld0JveD0iMCAwIDEgMSIgcHJlc2VydmVBc3BlY3RSYXRpbz0ibm9uZSI+CiAgPGxpbmVhckdyYWRpZW50IGlkPSJncmFkLXVjZ2ctZ2VuZXJhdGVkIiBncmFkaWVudFVuaXRzPSJ1c2VyU3BhY2VPblVzZSIgeDE9IjAlIiB5MT0iMCUiIHgyPSIwJSIgeTI9IjEwMCUiPgogICAgPHN0b3Agb2Zmc2V0PSIwJSIgc3RvcC1jb2xvcj0iIzc3YmFlZiIgc3RvcC1vcGFjaXR5PSIxIi8+CiAgICA8c3RvcCBvZmZzZXQ9IjElIiBzdG9wLWNvbG9yPSIjNzdiYWVmIiBzdG9wLW9wYWNpdHk9IjAuOTkiLz4KICAgIDxzdG9wIG9mZnNldD0iMTAwJSIgc3RvcC1jb2xvcj0iIzg1ZjdjNiIgc3RvcC1vcGFjaXR5PSIwIi8+CiAgPC9saW5lYXJHcmFkaWVudD4KICA8cmVjdCB4PSIwIiB5PSIwIiB3aWR0aD0iMSIgaGVpZ2h0PSIxIiBmaWxsPSJ1cmwoI2dyYWQtdWNnZy1nZW5lcmF0ZWQpIiAvPgo8L3N2Zz4=);
		background: -moz-linear-gradient(top,  rgba(119,186,239,1) 0%, rgba(119,186,239,0.99) 1%, rgba(133,247,198,0) 100%); /* FF3.6+ */
		background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,rgba(119,186,239,1)), color-stop(1%,rgba(119,186,239,0.99)), color-stop(100%,rgba(133,247,198,0))); /* Chrome,Safari4+ */
		background: -webkit-linear-gradient(top,  rgba(119,186,239,1) 0%,rgba(119,186,239,0.99) 1%,rgba(133,247,198,0) 100%); /* Chrome10+,Safari5.1+ */
		background: -o-linear-gradient(top,  rgba(119,186,239,1) 0%,rgba(119,186,239,0.99) 1%,rgba(133,247,198,0) 100%); /* Opera 11.10+ */
		background: -ms-linear-gradient(top,  rgba(119,186,239,1) 0%,rgba(119,186,239,0.99) 1%,rgba(133,247,198,0) 100%); /* IE10+ */
		background: linear-gradient(to bottom,  rgba(119,186,239,1) 0%,rgba(119,186,239,0.99) 1%,rgba(133,247,198,0) 100%); /* W3C */
		filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#77baef', endColorstr='#0085f7c6',GradientType=0 ); /* IE6-8 */
	text-align:center;
}
#body-wrapper{
	width:100%; height:100%;
	background:transparent url('../images/bg_globe-connect.png') no-repeat scroll 10px 10px;
}
#header{
	width:911px;
}
#header img{
	float:left;
}
h1{
	font-size: 30px; 
	font-weight: bold; 
	color: #01720f; 
	font-family:Arial, Tahoma, Helvetica, sans-serif;
	padding-bottom:10px;
}
#menu{
	box-shadow: 5px 5px 5px #888888;
	display:inline-block;
	font-family:Arial, Tahoma, Helvetica, sans-serif;
	font-size:15px;
	padding-top:5px;padding-bottom:5px;
	padding-left:5px; padding-right:5px;
	margin-top:15px; margin-bottom:15px;
	background-color:#fff;
	width:890px;
	-moz-border-radius: 10px; border-radius: 10px;
	margin:auto;
}

#menu .menu-item{
	float:left;
	padding-right:15px; padding-left:15px;
	padding-top:7px; padding-bottom:7px;
	margin-left:7px;margin-right:7px;
	-moz-border-radius: 10px; border-radius: 10px;
	font-weight:bold;
	cursor:pointer;
}
#menu .menu-item:hover{
	background-color:#e7e6e6;
	color:#089f1a;
}
#menu .menu-item-selected{
	float:left;
	padding-right:15px; padding-left:15px;
	padding-top:7px; padding-bottom:7px;
	margin-left:7px;margin-right:7px;
	-moz-border-radius: 10px; border-radius: 10px;
	font-weight:bold;
	background-color:gray;
	color:white;
	cursor:pointer;
}
#content-wrapper{
	box-shadow: 5px 5px 5px #888888;
	padding-top:15px;
	padding-bottom:15px;
	margin:auto;
	width:900px;
	display:inline-block;
	background-color:white;
	border-radius:10px; -moz-border-radius: 10px;
	margin-bottom:15px;
}
#content{
	text-align: justify; 
	font-family:Arial, Tahoma, Helvetica, sans-serif;
	font-size: 14px; 
	font-weight: normal; 
	font-style: normal; 
	color: #333333;
	width:850px;
	margin:auto;
}
#col1{
	float:left;
	width:520px;
}
#col2{
	float:left;
	width:280px;
	margin-left:40px;
	text-align:center;
}
.clear{
	clear:both;
}
header{
	display:block;
	margin:auto;
	padding:0px;
	width:900px;
}
footer{
	display:block;
	margin:auto;
	width:850px;
	text-align:left;
}
#footer-left{
	font-family:"Franklin Gothic Medium", "Arial Narrow", Arial, sans-serif;
	font-size:12px;
	float:left;
}
#footer-right{
float:right;
}
p{
	margin-bottom:10px;
}
