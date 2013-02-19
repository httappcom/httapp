html{
	background: #dbdbdb; /* Old browsers */
	background: -moz-linear-gradient(top,  #dbdbdb 0%, #ffffff 77%); /* FF3.6+ */
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#dbdbdb), color-stop(77%,#ffffff)); /* Chrome,Safari4+ */
	background: -webkit-linear-gradient(top,  #dbdbdb 0%,#ffffff 77%); /* Chrome10+,Safari5.1+ */
	background: -o-linear-gradient(top,  #dbdbdb 0%,#ffffff 77%); /* Opera 11.10+ */
	background: -ms-linear-gradient(top,  #dbdbdb 0%,#ffffff 77%); /* IE10+ */
	background: linear-gradient(to bottom,  #dbdbdb 0%,#ffffff 77%); /* W3C */
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#dbdbdb', endColorstr='#ffffff',GradientType=0 ); /* IE6-9 */
	width:100%; height:100%;
}
body{
	min-height:100%;
	background-color:transparent !important;
}

.topPanelContainer {
	text-align:left;
	border:1px solid #ccc;
	background-color:white;
	box-shadow: 5px 5px 25px #888888;
}

.topPanel {
    border: 1px solid #ccc;
    padding: 0px;
    margin-top: 10px;
    margin-bottom: 0px;
    margin-left: 10px;
    margin-right: 10px;
}

.nuehealth-logo{cursor:pointer;}
.nuehealth-logo:hover{opacity:.8;}

a.menu-item{
	padding:7px 15px;
	-moz-border-radius: 10px; border-radius: 10px;
	font-weight:bold;
	text-decoration:none;
	background-color:silver;
}
a.menu-item:hover{
	background-color:gray;
	color:white;
}

.title {
    font-size: larger;
    font-weight: bold;
}

.poweredByImage {
	vertical-align: middle;
	margin:12px 8px 8px 0;
}
p#copyright{
	font-size:10px;
	letter-spacing:1px;
	display:block;
	float:right;
	margin-right:20px;
}
img {
    border: none;
}
.clearfix:after {
	content: ".";
	display: block;
	clear: both;
	visibility: hidden;
	line-height: 0;
	height: 0;
}