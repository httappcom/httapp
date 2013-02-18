/*CUSTOM ADDED*/
.st_round-btn {
border-radius:10px !important; 
-webkit-border-radius:10px !important; 
-moz-border-radius:10px !important;
}

.st_padding-top{
	padding-top: 25px;
}

.st_margin-auto{
	margin: auto !important;
}
.st_align-center{
	text-align:center;
}

.zen .zen-page {
min-width:989px;
}

.mouseOverInfo {
position:absolute;
display:none;
left:22px;
bottom:20px;
width:20em;
border:1px solid #000;
z-index:11;
opacity:0;
white-space:normal;
font-weight:400;
color:#000;
background-color:#ffffd0;
-moz-border-radius:3px;
-webkit-border-radius:3px;
border-radius:3px;
font-size:1em;
border-color:#333;
padding:8px 10px;
}

.message {
background-color:#ffc;
color:#000;
-moz-border-radius:4px;
-webkit-border-radius:4px;
border-radius:4px;
border-style:solid;
border-width:1px;
margin:4px 20px;
padding:6px 8px 6px 6px;
}

.infoM6,.infoM4,.infoM3,.infoM2,.infoS1 {
border-color:#39f;
}

.infoM4 .msgIcon,.infoSmall {
background-image:url(/img/sprites/master.png);
background-position:0 -222px;
width:16px;
height:16px;
}

.dialogClose,.dialogCloseOn {
background-image:url(/img/func_icons/util/dialogClose16.gif);
width:16px;
height:16px;
float:right;
cursor:pointer;
background-position:top left;
overflow:hidden;
text-indent:-999em;
}

.dialogCloseOn {
background-position:top right;
}

.dialogCloseOn:focus {
outline:1px dotted #000;
}

.dialogResize {
background:transparent url(/img/func_icons/util/rescale11.gif) no-repeat bottom right;
cursor:se-resize;
position:absolute;
bottom:5px;
right:5px;
height:11px;
width:11px;
}

.overlayBackground {
display:none;
opacity:.6;
position:absolute;
top:0;
left:0;
z-index:50100;
background-color:#000;
border:none;
}

.overlayDialog {
position:fixed;
display:none;
visibility:hidden;
z-index:50101;
top:40px;
left:150px;
}

.absolutePositionedOverlayDialog {
position:absolute;
}

.cssDialog {
top:25%;
left:50%;
}

.overlayDialog .topLeft,.inlineOverlayDialog .topLeft {
background:transparent url(/img/overlaytopleft.gif) no-repeat top left;
padding:4px 2px 6px 12px;
}

.overlayDialog .movable {
cursor:move;
}

.overlayDialog .topLeft h2,.inlineOverlayDialog .topLeft h2 {
color:#fff;
font-size:1.1em;
}

.overlayDialog .topRight,.inlineOverlayDialog .topRight {
padding-right:6px;
background:transparent url(/img/overlaytopright.gif) no-repeat top right;
}

.overlayDialog .middle,.inlineOverlayDialog .middle {
background-color:#f5f5f5;
border-left:1px solid #393a3c;
border-right:1px solid #393a3c;
}

.overlayDialog .innerContent,.inlineOverlayDialog .innerContent {
padding:12px 16px;
}

.overlayDialog .innerContent h2,.inlineOverlayDialog .innerContent h2 {
font-family:Arial;
font-size:1.4em;
}

.overlayDialog .innerContent p,.inlineOverlayDialog .innerContent p {
margin:8px 0;
}

.overlayDialog .innerContent .split,.inlineOverlayDialog .innerContent .split {
border-left:1px solid #919191;
border-right:1px solid #919191;
background:transparent url(/img/overlaysplit.gif) repeat-x top;
height:16px;
padding-left:20px;
}

.overlayDialog .innerContent .pointer,.inlineOverlayDialog .innerContent .pointer {
background:url(/img/overlaypointer.gif) no-repeat;
width:27px;
height:16px;
}

.overlayDialog .innerContent .infoImage,.inlineOverlayDialog .innerContent .infoImage {
float:left;
height:100%;
width:60px;
}

.overlayDialog .scrollableArea,.overlayDialog .scrollableAreaBottomBorder,.inlineOverlayDialog .scrollableArea,.overlayDialog .scrollableAreaBottomBorder {
border:1px solid #919191;
background-color:#fff;
overflow-y:auto;
}

.overlayDialog .scrollableArea,.inlineOverlayDialog .scrollableArea {
border-bottom:none;
}

.overlayDialog .summaryArea,.inlineOverlayDialog .summaryArea {
margin-top:-13px;
border:1px solid #919191;
border-top:none;
background-color:#f3f3ec;
height:50px;
padding:12px 8px 4px;
}

.overlayDialog .bottomLeft,.inlineOverlayDialog .bottomLeft {
background:url(/img/alohaSkin/overlayBtmLft.png) left bottom no-repeat;
height:5px;
}

.overlayDialog .bottomRight,.inlineOverlayDialog .bottomRight {
background:url(/img/alohaSkin/overlay_crns.png) right -235px no-repeat;
height:5px;
padding-left:0;
padding-right:6px;
}

.accessibleDialogPopup {
margin:12px;
padding:12px;
}

.backgroundConfirm {
background-color:#e7f8e6;
}

.backgroundWarn {
background-color:#f7f2d8;
}

.backgroundInfo {
background-color:#dae5f2;
}

.backgroundError {
background-color:#f1d7d7;
}

.contentConfirm {
border:1px solid #3ca500;
}

.contentWarn {
border:1px solid #f90;
}

.contentInfo {
border:1px solid #287fe1;
}

.contentError {
border:1px solid #c00;
}

.datePicker {
z-index:100;
position:absolute;
display:none;
top:0;
left:0;
border-bottom:1px solid #000;
width:auto;
border:0;
-moz-box-shadow:0 2px 6px #111;
-webkit-box-shadow:0 2px 6px #111;
box-shadow:0 2px 6px #111;
-moz-border-radius:5px;
-webkit-border-radius:5px;
border-radius:5px;
background-image:url(/img/alohaSkin/cal_sprite.png);
background-position:left -109px;
background-repeat:repeat-x;
background-color:#ededed;
border-left:1px solid #d6d6d6;
border-right:1px solid #d6d6d6;
margin:0;
padding:7px 5px 6px;
}

.datePicker .dateBar {
text-align:center;
white-space:nowrap;
overflow:hidden;
margin:0;
padding:0 0 4px;
}

.datePicker select {
vertical-align:top;
}

.datePicker .calBody {
border-bottom:none;
border:0;
padding:0 10px;
}

.datePicker .calDays {
font-weight:400;
width:100%;
font-family:Arial,Helvetica,sans-serif;
color:#4a4a56;
border:0;
font-size:1em;
}

.datePicker .calDays .prevMonth,.datePicker .calDays .nextMonth {
color:#999;
}

.datePicker .calDays th,.datePicker .calDays td {
text-align:center;
width:14%;
}

.datePicker .calDays .dayOfWeek {
background:#ececec url(/img/func_icons/cal/dp_daysbg.gif) repeat-x top;
border-bottom:1px solid #e0dee0;
color:#4a4a56;
font-size:.9em;
font-weight:400;
padding:2px;
}

.datePicker .calDays .weekend,.datePicker .calDays .weekday {
border-right:1px solid #e0f0fb;
border-bottom:1px solid #e0f0fb;
cursor:pointer;
padding:5px 0;
}

.datePicker .calDays .weekend {
background-color:#f2f3f7;
}

.datePicker .calDays .weekday {
background-color:#fff;
}

.datePicker .calDays .dueDate {
font-weight:700;
color:#000;
background-color:#f10;
}

.datePicker .calDays .todayDate {
border:1px solid #000;
color:#fff;
background-color:#1797c0;
font-weight:700;
}

.datePicker .calDays .startDate,.datePicker .calDays .endDate,.datePicker .calDays .selectedDate {
background-color:#fbfae3;
color:#000;
font-weight:700;
}

.datePicker .calDays .highlight {
background-color:#e3f3ff;
color:#000;
font-weight:700;
}

.datePicker .buttonBar {
background-color:#ececec;
border-top:1px solid #e1e2e9;
text-align:center;
clear:both;
background:none;
border:0;
padding:2px 0 0;
}

.datePicker .buttonBar .calToday {
font-size:91%;
font-weight:400;
color:#015ba7;
text-decoration:none;
}

.datePicker .dateBar .calLeft,.datePicker .dateBar .calLeftOn,.datePicker .dateBar .calRight,.datePicker .dateBar .calRightOn {
margin:2px 2px 0;
}

.datePicker .dateBar .calLeft {
background-image:url(/img/func_icons/cal/dp_left.gif);
width:13px;
height:21px;
background-position:top left;
}

.datePicker .dateBar .calLeftOn {
background-image:url(/img/func_icons/cal/dp_left.gif);
width:13px;
height:21px;
background-position:-18px -61px;
}

.datePicker .dateBar .calRight {
background-image:url(/img/func_icons/cal/dp_right.gif);
width:13px;
height:21px;
background-position:top left;
}

.datePicker .dateBar .calRightOn {
background-image:url(/img/func_icons/cal/dp_right.gif);
width:13px;
height:21px;
background-position:-18px -84px;
}

h2#docViewerOverlayTitle div {
overflow:hidden;
margin-right:35px;
}

.overlayDialog.docViewerOverlay {
position:fixed;
}

.docViewerOverlay .innerContent {
padding:4px 4px 0;
}

.docViewerContainerParent {
height:484px;
margin-left:auto;
margin-right:auto;
}

.docViewerContainer {
width:100%;
height:100%;
}

a .contentThumbnail {
border:1px solid #d0d0d0;
padding:3px;
}

a:hover .contentThumbnail {
border:2px #1797c0 solid;
padding:2px;
}

img.contentThumbnail {
margin:4px 3px 3px 0;
}

.contentActionIcon {
width:16px;
padding-right:2px;
margin-left:-1px;
}

.contentActionElement {
width:18px;
vertical-align:middle;
display:inline-block;
}

.contentActionLabel {
white-space:nowrap;
vertical-align:top;
font-size:.9em;
line-height:18px;
}

.contentPost {
width:100%;
}

.contentPost .rightSideCell {
vertical-align:top;
padding-left:9px;
}

.contentPost td {
padding:1px;
}

.contentPost .thumbnailCell {
vertical-align:top;
width:1px;
}

.contentPost .linkCell {
padding-right:4px;
white-space:nowrap;
}

.contentTitle {
font-weight:700;
color:#333435;
font-size:1em;
}

.contentTitleLink {
font-weight:700;
font-size:1em;
}

.contentDescription {
vertical-align:top;
color:#222;
font-size:1em;
}

.mouseOverInfoOuter {
position:absolute;
display:inline;
text-decoration:none;
}

.colorPicker {
display:none;
left:0;
position:absolute;
top:0;
z-index:200000;
background-color:#fff;
border:1px solid #b6b6b6;
-moz-box-shadow:0 2px 5px #a0a6ab;
box-shadow:0 2px 5px #a0a6ab;
width:234px;
margin:0;
padding:0;
}

.colorPickerColorView,.colorPickerHexView {
cursor:default;
margin:4px 3px 2px;
}

.colorPickerColorView {
border:1px solid #000;
width:3em;
}

.colorPickerHexView {
border:none;
background-color:#fff;
color:#000;
padding-left:5px;
width:7em;
}

.colorPickerContent {
background-color:#fff;
margin:4px;
}

.colorPickerPalette {
border:2px solid #fff;
margin:2px auto;
}

.colorPickerPalette td {
cursor:pointer;
}

.colorPickerPaletteChoice {
display:block;
height:7px;
width:7px;
margin:2px;
}

td.highlight .colorPickerPaletteChoice {
border-color:#fff;
border-style:solid;
border-width:1px;
margin:1px;
}

.colorBox {
border:1px solid #000;
cursor:pointer;
float:left;
height:1em;
width:1em;
margin:4px;
}

.errorColorBox {
background-image:url(/img/x.gif);
background-position:center center;
border-color:red;
}

.zen h1,.zen h2,.zen h3,.zen h4,.zen h5,.zen h6 {
display:inline;
font-size:100%;
margin:0;
}

input {
padding-top:0;
}

.clearingBox {
clear:both;
font-size:1%;
}

.btn,.button,.formulaButton,.btnWhatsNew {
background-image:url(/img/bgButton.gif);
background-repeat:repeat-x;
border-right:1px solid #5c5d61;
cursor:pointer;
display:inline;
}

.btnImportant {
background-image:url(/img/bgButtonImportant.gif);
background-position:left top;
background-repeat:repeat-x;
border-right:1px solid #5c5d61;
cursor:pointer;
font-weight:700;
border-color:0 #5c5d61 #5c5d61 0;
border-style:none solid solid none;
border-width:medium 1px 1px medium;
}

.btnDisabled {
background-image:url(/img/bgButtonDisabled.gif);
background-repeat:repeat-x;
border-right:1px solid #999;
cursor:default;
}

.pageTitleIcon {
display:inline;
float:left;
margin-right:5px;
}

.requiredExample {
border-left:3px solid #c00;
font-size:80%;
vertical-align:1px;
width:100%;
}

.waitingSearchDiv {
left:0;
position:absolute;
text-align:center;
top:0;
}

.waitingSearchDiv .waitingHolder {
position:relative;
top:45%;
white-space:nowrap;
margin:auto;
}

a.chatterFollowUnfollowAction,img.chatterFollowUnfollowAction,.groupmembership .nonmember img,.groupmembership .check,.grouprole .check,.grouprequest .acceptedIcon,.grouprequest .declinedIcon {
height:15px;
vertical-align:text-top;
width:15px;
}

img.chatterFollowUnfollowAction,a.chatterFollowUnfollowAction {
background:url(/img/feeds/follow12.png) no-repeat scroll 2px 1px transparent;
}

.groupmembership .member .check {
background:url(/img/feeds/follow_sprite.png) no-repeat scroll 0 -27px transparent;
}

.quickfindContainer .quickfindInput {
background-image:url(/img/func_icons/util/search16.png);
background-repeat:no-repeat;
padding-left:22px;
padding-top:2px;
}

a.chatterFollowUnfollowAction,.groupmembership .nonmember img {
background:transparent url(/img/feeds/follow_sprite.png) no-repeat 0 0;
}

div.groupmembership a .actionIcon {
height:15px;
width:15px;
margin-left:2px;
background:transparent url(/img/feeds/follow_sprite.png) no-repeat 0 -54px;
vertical-align:text-top;
}

div.groupmembership a:hover .actionIcon,div.groupmembership a .actionIcon.active {
background:transparent url(/img/feeds/follow_sprite.png) no-repeat 0 -75px;
}

body .btnPrimary:hover {
background:none repeat scroll 0 0 #1797c0;
border:2px solid #fff;
color:#fff;
}

.chatterPage .viralInviteButton:hover {
background:none repeat scroll 0 0 #f29724;
}

.listViewport {
border:0;
margin:0;
}

.listViewport .topNav {
background-repeat:repeat-x;
background-color:#fff;
color:#000;
}

.listViewport .topNav a {
color:#fff;
text-decoration:underline;
}

.listViewport .topNav span {
padding-right:5px;
}

.listViewport .topNav .backLink {
padding-bottom:8px;
padding-left:4px;
}

.listViewport .topNav .backLink a {
font-size:1.1em;
color:#015ba7;
text-decoration:none;
}

.listViewport .topNav .controls {
position:relative;
padding:5px;
}

.listViewport .topNav .controls .divisionLabel {
float:left;
margin:3px 15px;
}

.listViewport .topNav .title {
font-size:120%;
font-weight:700;
margin-right:4px;
}

.listViewport .topNav .btn {
margin-top:.3em;
}

.listViewport .subNav .linkBar {
background-color:#f3f3f3;
color:#333;
padding:0 5px;
}

.listViewport .topNav .filterLinks {
padding:3px 0;
}

.listViewport .subNav .rolodex {
padding:4px 0;
}

.refreshLink {
display:inline-block;
padding:2px 0;
}

.piped li {
float:left;
border-right:1px solid #cfcece;
padding-left:0;
padding-right:3px;
margin-left:3px;
margin-top:2px;
margin-bottom:2px;
}

.piped .lastItem {
border-right:none;
}

.listViewport .topNav .topNavTab {
float:right;
padding-right:4px;
color:#333;
white-space:nowrap;
}

.listViewport .topNav .topNavTab .tab {
cursor:pointer;
border-right:1px solid #c2c2c2;
margin-left:1px;
padding:0 8px;
}

.listViewport .topNav .topNavTab .tabOver {
cursor:pointer;
background-color:#f9f9f9;
border:1px solid #c2c2c2;
border-bottom:none;
margin:0;
padding:0 8px 8px;
}

.listViewport .topNav .topNavTab img {
cursor:pointer;
vertical-align:middle;
margin-left:8px;
}

.listViewport .topNav .drawer {
border:1px solid #9a9a9a;
background-color:#f9f9f9;
background-image:url(/img/topshadow.gif);
background-repeat:repeat-x;
text-align:center;
color:#333;
overflow:hidden;
margin:0 2px 2px;
}

.listViewport .listBody {
background-color:#f3f3ec;
border-top:1px solid #c2c2c2;
border-bottom:1px solid #d8d8d8;
height:175px;
}

.listViewport .refreshListButton {
background-color:#9096a1;
background:url(/img/alohaSkin/sync.png) top left no-repeat;
width:22px;
height:20px;
background-position:2px 2px;
vertical-align:bottom;
}

.listViewport .refreshListButtonNeeded {
background-color:#4aa508;
background-position:2px -42px;
}

.listViewport .listBody .exception {
position:absolute;
z-index:2;
top:0;
left:0;
width:100%;
background-color:#fff;
display:none;
}

.listViewport .listBody .exception .title {
font-weight:700;
font-size:1.5em;
}

.listViewport .bottomNav {
background-color:#f3f3f3;
border-top:1px solid #fff;
border:1px solid #e0e3e5;
background:#f2f3f3;
padding:5px;
}

.listViewport .ASC,.listViewport .DESC {
background:#e0e3e6;
}

.listViewport .ASC .x-grid3-sort-icon {
background-image:url(/img/colTitle_uparrow.gif);
display:inline;
background-position:0 -16px;
}

.listViewport .DESC .x-grid3-sort-icon {
background-image:url(/img/colTitle_downarrow.gif);
display:inline;
background-position:0 top;
}

.listViewport .x-grid3-cell-inner,.listViewport .x-grid3-hd-inner {
padding-left:3px;
}

.listViewport .x-grid3-header,.errorConsole .x-grid3-header {
background:#f2f3f3;
border:1px solid #e0e3e5;
color:#000;
font-size:.9em;
font-weight:700;
border-width:1px 0;
padding:0;
}

.listViewport .x-grid3-hd-row td,.listViewport .x-grid3-row td,.listViewport .x-grid3-summary-row td {
font-family:Arial,Helvetica,sans-serif;
font-size:100%;
line-height:normal;
-moz-user-select:text;
}

.errorConsole .x-grid3-hd-row td,.errorConsole .x-grid3-row td {
font-family:Arial,Helvetica,sans-serif;
line-height:normal;
-moz-user-select:text;
font-size:75%;
}

.errorConsole .x-grid3-row td a {
vertical-align:top;
margin-left:4px;
}

.listViewport .x-grid3-row-over,.errorConsole .x-grid3-row-over {
background-color:#e3f3ff;
}

.listViewport .x-grid3-row-selected,.errorConsole .x-grid3-row-selected {
background:#b0e1fa!important;
}

.listViewport .x-panel-body {
border:0;
}

.x-dd-drop-icon {
left:13px;
top:10px;
}

.x-dd-drop-nodrop .x-dd-drop-icon {
background-image:url(/img/permissions_deny16.gif);
}

.x-dd-drop-ok .x-dd-drop-icon {
background-image:url(/img/permissions_confirm16.gif);
}

.x-dd-drag-ghost {
border-color:#ccc #aaa #aaa #ccc;
border-style:solid;
border-width:1px;
padding:6px 6px 6px 40px;
}

.x-dd-drag-ghost .dragElement {
background:#fff;
border:1px solid #ccc;
font-size:110%;
margin:0;
padding:3px;
}

.x-dd-drag-proxy .x-grid3-hd-inner {
background:#fff;
border:1px solid #ccc;
}

#refreshList {
display:none;
margin:4px 0;
}

.errorConsole .errorConsoleHeader {
font-family:Verdana,Geneva,sans-serif;
padding:4px 8px;
}

.errorConsole .errorConsoleHeader .errorSummary {
padding-bottom:4px;
}

.errorConsole .errorConsoleHeader .errorSummary img {
vertical-align:top;
margin-right:6px;
}

.errorConsole .viewedError .errorSmall {
visibility:hidden;
}

.paginator {
white-space:nowrap;
text-align:center;
position:relative;
margin:0;
}

.paginator .left {
position:absolute;
left:0;
}

.paginator .right {
position:absolute;
right:0;
}

.paginator .pageInput {
width:2em;
font-size:98%;
text-align:center;
vertical-align:middle;
margin:0 3px;
}

.paginator .first {
background-image:url(/img/paginationArrows.gif);
background-repeat:no-repeat;
background-position:0 1px;
width:9px;
height:10px;
}

.paginator .firstoff {
background-image:url(/img/paginationArrows.gif);
background-repeat:no-repeat;
background-position:0 -10px;
width:9px;
height:10px;
}

.paginator .prev {
background-image:url(/img/paginationArrows.gif);
background-repeat:no-repeat;
background-position:-10px 1px;
width:9px;
height:10px;
margin:0;
padding:0;
}

.paginator .prevoff {
background-image:url(/img/paginationArrows.gif);
background-repeat:no-repeat;
background-position:-10px -10px;
width:9px;
height:10px;
margin:0;
padding:0;
}

.paginator .next {
background-image:url(/img/paginationArrows.gif);
background-repeat:no-repeat;
background-position:-17px 1px;
width:9px;
height:10px;
}

.paginator .nextoff {
background-image:url(/img/paginationArrows.gif);
background-repeat:no-repeat;
background-position:-17px -10px;
width:9px;
height:10px;
}

.paginator .last {
background-image:url(/img/paginationArrows.gif);
background-repeat:no-repeat;
background-position:-27px 1px;
width:9px;
height:10px;
}

.paginator .lastoff {
background-image:url(/img/paginationArrows.gif);
background-repeat:no-repeat;
background-position:-27px -10px;
width:9px;
height:10px;
}

.paginator .prevNextLinks {
color:#a8a8a8;
}

.paginator .prevNextLinks a {
color:#333;
text-decoration:none;
}

.paginator .prevNextLinks .prevNext {
margin:0 3px;
}

.paginator .selectCount {
margin:0 2em;
padding:0 .3em;
}

.paginator .selectCountHi {
background-color:#ffe324;
}

.paginator .selectorTarget {
cursor:pointer;
position:relative;
}

.paginator .selectArrow {
background-image:url(/img/func_icons/util/selectArrow12.gif);
background-position:left;
background-repeat:no-repeat;
height:12px;
width:14px;
position:relative;
left:2px;
top:1px;
}

.paginator .selector {
display:none;
position:absolute;
bottom:1.5em;
left:0;
cursor:pointer;
border:2px solid #ccc;
}

.paginator .selectorHover .selectArrow,.paginator .selectorOpen .selectArrow {
background-position:-15px 0;
}

.paginator .selector .opt {
padding:3px;
}

.paginator .selector tr.optSelected td,.paginator .selector tr.optSelected td.rppOpt {
background-color:#b0e1fa;
color:#333;
}

.paginator .selector tr.optUnselected,.paginator .selector tr.optUnselected td {
background-color:#ddd;
color:#ddd;
white-space:nowrap;
}

.paginator .selector tr.optUnselected td.rppOpt {
background-color:#fff;
color:#333;
}

.paginator .selector tr.optHover td.rppOpt,.paginator .selector tr.optHover td {
background-color:#e1f6ff;
color:#333;
}

.paginator .selector .rppOpt {
background-color:#FFF;
font-weight:700;
color:#333;
padding:0 5px;
}

.paginator .selection {
text-align:left;
background-color:#fff;
color:#333;
}

.paginator .toolbar {
display:none;
position:absolute;
width:100%;
left:0;
top:-2.5em;
background-color:#333;
opacity:0;
text-align:left;
padding:5px 0;
}

.duelingListBox table.layout td {
vertical-align:middle;
text-align:center;
}

.duelingListBox .selectTitle {
font-weight:700;
padding:.5em 0;
}

.duelingListBox .text {
padding:.1em 0;
}

.zen .duelingListBox select {
line-height:1.4em;
}

a {
color:#333435;
}

body .x-btn button,body .btn,body .btnImportant,body .btnDisabled,body .btnCancel,body .menuButton .menuButtonButton,body .menuButton .menuButtonMenu a,body .menuButton .menuButtonMenu input.theOption,h1,h2,h3,h4,h5,h6 {
font-family:Arial,Helvetica,sans-serif;
}

body button,body .x-btn,body .btn,body .btnDisabled,body .btnCancel {
background:url(/img/alohaSkin/btn_sprite.png) repeat-x scroll right top #e8e8e9;
font-weight:700;
border-style:solid;
border-width:1px;
}

body .x-btn-pressed,body .x-btn-click,body .x-btn-menu-active,body button:active,body .btn:active,body .btnPressed,body .btnCancel:active,body .menuButton .menuButtonButton:active {
background-position:right -60px;
border-color:#585858 #585858 #939393;
}

body .btnPrimary {
-moz-border-radius:5px;
-webkit-border-radius:5px;
border-radius:5px;
box-shadow:0 2px 4px #aaa;
-moz-box-shadow:0 2px 4px #aaa;
-webkit-box-shadow:0 2px 4px #aaa;
background-position:right -120px;
font-size:1em;
padding:2px 10px;
}

body .btnPrimary,body .btnPrimary.btnDisabled {
border:2px solid #fff;
color:#fff;
}

body a:hover {
text-decoration:underline;
color:#015ba7;
}

body .btnSharing,body .btnImportant {
background:transparent url(/img/alohaSkin/btn_important.png) repeat-x;
border:0;
height:21px;
font-size:.95em;
color:#fff;
-moz-border-radius:5px;
-webkit-border-radius:5px;
border-radius:5px;
-moz-box-shadow:0 2px 4px #aaa;
-webkit-box-shadow:0 2px 4px #aaa;
box-shadow:0 2px 4px #aaa;
padding:0 7px 3px;
}

.errorStyle,.errorMsg,.importantWarning,.pbBody .errorStyle a,.pbBody .errorMsg a {
color:#d74c3b;
}

body .btnDisabled {
background-position:0 -90px;
color:#909090;
border-color:#c4c4c4;
}

body .btnPrimary.btnDisabled {
background:#e3e2e2;
}

.waitingSearchDiv .waitingHolder,.waitingSearchDiv .waitingSearchHolder {
border:none;
background-color:transparent;
font-size:1em;
font-weight:400;
padding:0;
}

.waitingDescription {
margin-left:6px;
font-weight:700;
color:#666;
}

.ext-el-mask {
background-color:#000;
opacity:.6;
}

.overlayDialog .topRight,.inlineOverlayDialog .topRight,div.x-window div.x-window-tl {
background:url(/img/alohaSkin/overlay_crns.png) right top no-repeat;
padding-left:0;
padding-right:6px;
}

.overlayDialog .topLeft,.inlineOverlayDialog .topLeft,div.x-window div.x-window-tr {
background:url(/img/alohaSkin/overlayTopLft.png) left top no-repeat;
padding:8px 6px 8px 12px;
}

div.x-window div.x-window-tl div.x-window-header {
font-family:inherit;
padding:0;
}

.dialogClose,.dialogCloseOn,div.x-window .x-tool-close,div.x-window .x-tool-close-over {
background:transparent url(/img/alohaSkin/closeX.png);
width:20px;
height:20px;
}

.dialogCloseOn,div.x-window div.x-tool-close-over {
background-position:left -20px;
}

.overlayDialog .topLeft h2,.inlineOverlayDialog .topLeft h2,div.x-window .x-window-header-text {
color:#000;
font-size:1.25em;
}

.overlayDialog .middle h3 {
color:#000;
font-size:1.125em;
}

.overlayDialog .middle,.inlineOverlayDialog .middle,div.x-window div.x-window-mr {
background:#fff url(/img/alohaSkin/overlay_crns.png) left -240px repeat-x;
border:none;
padding:0;
}

div.x-window div.x-window-mc {
background-color:transparent;
font-family:inherit;
border:0 none;
padding:12px 16px 0;
}

div.x-window div.x-panel-body {
background-color:transparent;
}

div.x-window div.x-window-bwrap,div.x-window div.x-window-tc,div.x-window div.x-window-ml,div.x-window div.x-window-bl,div.x-window div.x-window-br,div.x-window div.x-window-bc,div.x-window-bc div.x-window-footer,div.x-window div.x-panel-btns-ct {
background:transparent none;
padding:0;
}

.overlayDialog.loadingOverlay .topLeft {
padding:2px 6px 3px 12px;
}

.overlayDialog.loadingOverlay .middle {
background-image:none;
background-color:#fff;
}

.loadingOverlay .loadingContent {
vertical-align:middle;
padding:10px;
}

.loadingOverlay .loadingContent .loadingIcon {
background:url(/img/loading32.gif) no-repeat 0 0;
float:left;
width:32px;
height:32px;
margin-top:-5px;
margin-left:10px;
}

.loadingOverlay .loadingContent .loadingText {
margin-left:20px;
font-weight:700;
font-size:1.4em;
}

div.x-window div.x-window-footer {
background:url(/img/alohaSkin/overlay_crns_ext.png) right bottom no-repeat;
padding-right:6px;
}

div.x-window div.x-panel-btns {
background:url(/img/alohaSkin/overlayBtmLft.png) left bottom no-repeat;
padding:8px 0 12px;
}

div.x-window div.x-window-br {
background:url(/img/alohaSkin/overlay_crns_ext.png) right bottom no-repeat;
}

.RPPDialog .innerContent .radioDiv {
border:none;
}

.personalSetupOverlay .innerContent {
overflow:hidden;
padding:0;
}

.datePicker .dateBar .calLeft,.datePicker .dateBar .calLeftOn {
background-image:url(/img/alohaSkin/cal_sprite.png);
background-position:0 -61px;
width:18px;
height:16px;
margin:2px 4px 0 0;
}

.datePicker .dateBar .calRight,.datePicker .dateBar .calRightOn {
background-image:url(/img/alohaSkin/cal_sprite.png);
background-position:0 -84px;
width:18px;
height:16px;
margin:2px 9px 0 4px;
}

.datePicker .calDays .dayOfWeek,.datePicker .calDays .weekday,.datePicker .calDays .weekend {
background:none;
border:0;
padding:2px 0;
}

.datePicker .calRow {
font-size:.81em;
}

.datePicker .calDays td {
font-size:1.15em;
}

.datePicker .calDays .selectedDate {
background-color:#c6e1ff;
border:1px solid #9cf;
color:#000;
}

body .infoIcon {
background-image:url(/img/alohaSkin/info_sprite.png);
background-position:left top;
height:15px;
}

.listViewportWrapper .listViewport .topNav,.listViewportWrapper.individualPalette .listViewport .topNav {
background-color:transparent;
margin:5px 0 0;
}

.listViewportWrapper .listViewport .topNav .pageTitleIcon {
margin-top:-5px;
}

body .bodyDiv .bFilterView select,.listViewportWrapper .listViewport .topNav .title {
font-size:1.1em;
}

.listViewportWrapper .listViewport .topNav h2.title {
font-size:2em;
}

.listViewportWrapper .listViewport .topNav .btn {
margin:0 3px 2px 0;
}

.listViewportWrapper .listViewport .subNav .linkBar {
background-color:#f8f8f8;
border-left:1px solid #e0e3e5;
border-right:1px solid #e0e3e5;
border-bottom:0;
margin-top:5px;
-moz-border-radius-topleft:4px;
-moz-border-radius-topright:4px;
-webkit-border-top-left-radius:4px;
-webkit-border-top-right-radius:4px;
border-top-left-radius:4px;
border-top-right-radius:4px;
padding:2px 5px 10px;
}

.listViewportWrapper .listViewport .listBody {
background-color:#f8f8f8;
border:1px solid #e0e3e5;
border-width:0 1px;
}

.listViewport .x-grid3-hd-row td.over {
background:#e6eaea;
color:#015ba7;
cursor:pointer;
}

.listViewport .x-grid3-hd-inner {
padding:0 6px;
}

.listViewport .x-grid3-hd-checkbox {
padding:0 2px 0 3px;
}

.listViewport .x-grid3-td-checkbox {
padding-left:0;
}

.listViewportWrapper .listViewport .x-grid3-hd-row .x-grid3-hd-inner {
padding-top:2px;
padding-bottom:3px;
}

.listViewportWrapper .listViewport .x-grid3-hd-row>td {
border:0;
border-right:1px solid #e0e3e5;
vertical-align:top;
padding:0;
}

.listViewportWrapper .listViewport .x-grid3-hd-row>.over .x-grid3-hd-inner,.listViewportWrapper .listViewport .x-grid3-hd-row>.x-grid3-hd-menu-open .x-grid3-hd-inner {
background:none;
}

.listViewportWrapper .listViewport .x-grid3-hd-row .x-grid3-hd-menu-open .x-grid3-hd-inner .x-grid3-hd-btn,.listViewportWrapper .listViewport .x-grid3-hd-row .x-grid3-hd-menu-open .x-grid3-hd-inner a.x-grid3-hd-btn:hover {
background-color:#eee;
}

.listViewportWrapper .listViewport .x-grid3-hd-row .x-grid3-hd-btn {
background-image:url(/EXT/theme/sfdc/images/grid/arrows-sprite.png);
height:0;
width:16px;
background-color:transparent;
background-position:0 center;
border-left:1px solid #e0e3e5;
}

.listViewportWrapper .listViewport .x-grid3-hd-row .over a.x-grid3-hd-btn:hover {
background-color:#e0e3e6;
background-position:-20px center;
}

.listViewportWrapper .listViewport .x-grid3-hd-row a {
color:#000;
}

.listViewport .chatterListToggle {
border-top:1px solid #b5b5b5;
border-bottom:1px solid #b5b5b5;
background:#e8e8e9 url(/img/alohaSkin/togglePill_bg.png) repeat-x right top;
display:inline-block;
padding:2px;
}

.listViewport .topNav .chatterToggle {
border-right:1px solid #b5b5b5;
-moz-border-radius-bottomright:3px;
-moz-border-radius-topright:3px;
-webkit-border-bottom-right-radius:3px;
-webkit-border-top-right-radius:3px;
border-bottom-right-radius:3px;
border-top-right-radius:3px;
}

.listViewport .topNav .listToggle {
border-left:1px solid #b5b5b5;
-moz-border-radius-bottomleft:3px;
-moz-border-radius-topleft:3px;
-webkit-border-bottom-left-radius:3px;
-webkit-border-top-left-radius:3px;
border-bottom-left-radius:3px;
border-top-left-radius:3px;
}

.listViewport .topNav .toggleButton .selected {
background-position:left -120px;
}

.listViewport .topNav .toggleIcon {
height:16px;
background:transparent url(/img/alohaSkin/listtoggle_icons.png) repeat-x right top;
margin-left:6px;
display:inline-block;
float:left;
}

.listViewport .topNav .listIcon {
width:18px;
background-position:left 0;
}

.listViewport .topNav .toggleButton .selected .listIcon {
width:18px;
background-position:left -24px;
}

.listViewport .topNav .chatterIcon {
width:16px;
background-position:left -49px;
margin-right:4px;
}

.listViewport .topNav .toggleButton .selected .chatterIcon {
width:16px;
background-position:left -73px;
}

.listViewport .topNav .toggleButton .linkText {
color:#333;
font-weight:700;
font-size:.9em;
margin-top:1px;
float:left;
display:inline-block;
text-decoration:none;
}

.listViewport .topNav .toggleButton .selected a {
cursor:default;
}

.listViewport .topNav .toggleButton .clickable a:hover span {
color:#015ba7;
}

.listViewportWrapper .feedContainer {
border-left:1px solid #eaeaea;
border-right:1px solid #eaeaea;
border-bottom:1px solid #eaeaea;
background-color:#fff;
min-height:200px;
padding:6px;
}

.listViewport .ASC .x-grid3-sort-icon,.listViewport .DESC .x-grid3-sort-icon {
width:11px;
height:11px;
vertical-align:-2px;
background:transparent url(/img/alohaSkin/sortArrows_sprite.png) no-repeat 0 top;
margin:0 5px;
}

.listViewport .over.ASC .x-grid3-sort-icon {
background-position:0 -48px;
}

.listViewport .over.DESC .x-grid3-sort-icon {
background-position:0 -32px;
}

.waitingSearchDivOpacity {
background-color:#fff;
opacity:1;
}

.waitingSearchDiv .waitingSearchHolder .waitingDescription {
padding:0;
}

.waitingSearchDiv .waitingSearchHolder .waitingCancel {
vertical-align:middle;
margin-left:6px;
}

div.mainContentHeader,.listViewport .offPageIds {
display:none;
}

.message .messageText,.errorConsole .errorConsoleHeader .errorTitle input {
margin-left:8px;
}

.message .messageTable .messageCell,.waitingSearchDiv .waitingHolder .waitingImage,.listViewportWrapper .listViewport .x-grid3-hd-row .x-grid3-td-checkbox {
vertical-align:middle;
}

.overlayDialog .innerContent .buttons,.inlineOverlayDialog .innerContent .buttons,.accessibleDialogPopup .buttons {
text-align:center;
padding-top:12px;
}

.overlayDialog .innerContent .buttons .btn,.overlayDialog .innerContent .buttons .btnDisabled,.inlineOverlayDialog .innerContent .buttons .btn,.overlayDialog .innerContent .buttons .btnDisabled,.accessibleDialogPopup .buttons .btn,.accessibleDialogPopup .buttons .btnDisabled {
min-width:50px;
margin:0 10px 0 0;
}

.datePicker .calDays .startDate,.datePicker .calDays .endDate,.groupmembership a:hover span,.listViewport .topNav a:HOVER span,.listViewport .topNav .backLink a:hover,.listViewportWrapper .listViewport .subNav a:hover,.listViewportWrapper .listViewport .topNav a:hover,.listViewportWrapper .listViewport .x-grid3-td-ACTION_COLUMN a:hover {
text-decoration:underline;
}

a.mouseOverInfoOuter,a.mouseOverInfoOuter:hover,a.mouseOverInfoOuter:active,a.mouseOverInfoOuter:focus,.groupmembership a:hover,.listViewport .topNav .toggleButton a:hover {
text-decoration:none;
}

.colorPickerHeader,.duelingListBox .errorMsg {
text-align:center;
}

.bPageTitle h2,.paginator .selectorOpen .selector {
display:block;
}

a.chatterFollowUnfollowAction,.listViewport .topNav .toggleLink {
display:inline-block;
}

.listViewport .topNav .title,.listViewport .topNav .btn,.listViewport .topNav .filterLinks,.listViewportWrapper .listViewport .subNav .listButtons,.listViewport .topNav .toggleButton {
float:left;
}

.listViewport .subNav .rolodex,.listViewport .subNav .rolodex a,.listViewport .topNav .drawer a {
color:#333;
}

.listViewport .bottomNav a,.listViewport .topNav .toggleButton .selected .linkText {
color:#fff;
}

.listViewport .x-grid3-hd-row td,.errorConsole .x-grid3-hd-row td,.errorConsole .errorConsoleHeader .errorTitle {
font-weight:700;
}

.errorConsole .viewedError,.errorConsole .viewedError a {
text-decoration:line-through;
color:#ccc;
}

body .secondaryPalette.bPageBlock,.overlayDialog .secondaryPalette.bPageBlock {
background-color:#f8f8f8;
border-bottom:1px solid #eaeaea;
border-left:1px solid #eaeaea;
border-right:1px solid #eaeaea;
-moz-border-radius:4px;
-webkit-border-radius:4px;
border-radius:4px;
}

.listViewportWrapper .listViewport .subNav a,.listViewportWrapper .listViewport .topNav a,.listViewportWrapper .listViewport .x-grid3-td-ACTION_COLUMN a {
color:#015ba7;
text-decoration:none;
font-weight:400;
}






.chatterFilesTabPage {
width:965px;
position:relative;
}

.UserFileListPage #bodyTable,.GroupFileListPage #bodyTable {
width:965px;
}

.chatterFilesTabPage .rightContent {
margin-left:200px;
}

.chatterFilesTabPage .chatterFilesTabPageHeader {
margin:7px 5px 0;
}

.chatterFilesTabPage .browseLabel {
background:transparent url(/img/icon/files16.png) no-repeat left top;
padding-left:21px;
font-weight:400;
}

.chatterFilesTabPageHeader .btn {
margin-top:5px;
margin-left:17px;
}

.rightContent .browseLabelPanel {
padding-left:3px;
margin-top:6px;
}

.rightContent .browseLabelPanel .browseLabel {
font-size:1.2em;
font-weight:700;
color:#222;
}

.rightContent .browseLabelPanel .browseDesc {
color:#222;
padding-left:10px;
}

.rightContent .browseLabelPanel .browseDesc .browseLink {
color:#015ba7;
font-size:1em;
font-weight:400;
text-decoration:none;
}

.chatterFilesTabPageHeader .pageHelpIconPanel {
margin-right:5px;
position:absolute;
right:0;
top:0;
}

.chatterFilesTabPageHeader .chatterBreadcrumbs {
line-height:21px;
text-decoration:none;
}

.chatterFilesTabPageActionLink {
text-decoration:none;
color:#015ba7;
display:inline;
}

.chatterFilesTabPageActionLink .chatterFilesTabPageActionLinkLabel,.chatterFilesTabPageActionLink .chatterFilesTabPageActionLinkLabelOver,.thumbnailPanel .sharingStatusIcon img,.sharedWithStatusBadge .sharingStatusIcon img {
background:transparent url(/img/chatterfiles/chatterfiles16_sprite.png) no-repeat;
}

.chatterFilesTabPageActionLink .chatterFilesTabPageActionLinkLabel,.chatterFilesTabPageActionLink .chatterFilesTabPageActionLinkLabelOver {
display:inline-block;
vertical-align:middle;
background-position:45px -164px;
border:1px solid transparent;
padding:3px 17px 2px 5px;
}

.chatterFilesTabPageActionLink .chatterFilesTabPageActionLinkLabelOver {
background-color:#c6e1ff;
background-position:45px -182px;
border:1px solid #9cf;
cursor:pointer;
}

.chatterFileBrowsePanel {
font-size:1em;
width:100%;
margin-top:2px;
margin-left:-9px;
}

.chatterFileBrowsePanel ul {
list-style:none;
margin-bottom:5px;
}

.chatterFileBrowsePanel .liItem {
margin:-1px 0 -2px 10px;
}

.chatterFileBrowsePanel .liItem a.selectedLinkItem:hover,.chatterFileBrowsePanel .liItem a.selectedSubLinkItem:hover {
text-decoration:none;
color:#333435;
cursor:default;
}

.chatterFileBrowsePanel .liItemZeroMargin {
margin-top:0;
margin-bottom:0;
}

.chatterFileBrowsePanel .chatterBoxLiItem {
border-top:1px solid #b4b4b4;
margin-top:10px;
padding-top:10px;
}

.chatterFileBrowsePanel .chatterBoxLiItem .chatterBoxHyperlinkTextSpan {
background:url(/img/chatter/filters_sprite.png?v=180-3) no-repeat scroll left top transparent;
background-position:0 -463px;
height:16px;
padding-left:21px;
display:inline-block;
}

.chatterFileBrowsePanel .linkItem,.chatterFileBrowsePanel .selectedLinkItem,.chatterFileBrowsePanel .subLinkItem,.chatterFileBrowsePanel .selectedSubLinkItem {
text-decoration:none;
display:block;
white-space:nowrap;
overflow:hidden;
text-overflow:ellipsis;
color:#222;
padding:6px 10px 4px;
}

.chatterFileBrowsePanel .fileBrowseSubHeader.selectedLinkItem {
color:#222;
}

.chatterFileBrowsePanel .subHeaderSpacer {
margin-top:16px;
}

.chatterFileBrowsePanel a.linkItem:hover,.chatterFileBrowsePanel a.subLinkItem:hover {
color:#015ba7;
}

.chatterFileBrowsePanel .selectedLinkItem,.chatterFileBrowsePanel .selectedSubLinkItem,.chatterFileBrowsePanel .autoUl .selectedSubLinkItem {
background-color:#c4e7f2;
border-radius:5px;
font-weight:700;
outline:none;
outline-style:none;
-moz-outline-style:none;
}

.chatterFileBrowsePanel .spanItem {
padding-top:12px;
padding-left:10px;
font-weight:700;
display:block;
}

.chatterFileBrowsePanel .emptyGroupSpan {
padding-top:7px;
padding-left:10px;
font-weight:400;
display:block;
margin-left:10px;
color:#7d7d84;
font-size:1em;
}

.chatterFileBrowsePanel .selectedSubLinkItem .hyperlinkTextSpan {
display:block;
overflow:hidden;
text-overflow:ellipsis;
}

.chatterFileBrowsePanel .autoUl {
overflow-y:auto;
padding-top:2px;
padding-right:2px;
}

.chatterFileBrowsePanel .autoDiv {
overflow-y:auto;
padding-right:5px;
height:404px;
}

.chatterFileBrowsePanel .autoDivWithMyFilesFilter {
height:364px;
}

.chatterFileBrowsePanel .autoUlHeightWithContent {
height:214px;
}

.chatterFileBrowsePanel .autoUlHeightWithContentMyFileFilter {
height:164px;
}

.chatterFileBrowsePanel .autoUlHeightWithoutContent {
height:350px;
}

.chatterFileBrowsePanel .autoUlHeightWithoutContentMyFileFilter {
height:300px;
}

.chatterFileBrowsePanel .autoUl .selectedSubLinkItem {
background-position:2px -64px;
}

.chatterFileBrowsePanel .moreItemLink {
margin-left:20px;
margin-bottom:10px;
color:#015ba7;
font-size:.92em;
width:20px;
text-decoration:none;
}

.fileListLoadingDiv {
width:100%;
height:100%;
}

.fileListLoadingDiv .waitingHolder {
padding-top:50px;
top:84.8px;
width:74px;
}

.chatterFileListView {
min-height:150px;
}

.chatterFileListView .x-grid-empty {
font-size:1em;
color:#222;
}

.chatterFileListView .listViewportWrapper .listViewport .listBody {
background-color:#fff;
}

.chatterFileListView .listViewport .bottomNav {
padding:5px 5px 8px;
}

.FileDetailPage .waitingSearchDiv {
z-index:5000;
}

.FileDetailPage .blueButton {
background:#e8e8e9 url(/img/alohaSkin/btn_sprite.png) repeat-x right -180px;
}

.FileDetailPage .blueButton:active {
background:url(/img/alohaSkin/btn_sprite.png) repeat-x right -270px;
}

.FileDetailPage a.headerSearchOptionsLink,.FileDetailPage a.headerSearchOptionsLink:hover {
color:#fff;
}

.chatterFilesTabPage .errorMsg {
text-align:center;
font-weight:700;
}

.chatterFileDetailFollowUnfollowLinks {
padding-bottom:4px;
}

.FileDetailPage .rightContent {
overflow:visible;
}

.FileDetailPage .saveButtonBar {
text-align:center;
}

.FileDetailPage .threecolumn .headerContent .chatterBreadcrumbs {
max-width:600px;
}

.FileDetailPage .threecolumn .headerContent .headerRightContent {
white-space:nowrap;
padding-right:0;
max-width:280px;
position:absolute;
top:0;
right:0;
}

.FileDetailPage .threecolumn .headerContent .helpLinkElement {
white-space:normal;
}

.FileDetailPage h3 {
color:#333435;
}

.FileDetailPage .vfButtonBar {
position:relative;
background-color:transparent;
border-bottom:1px solid #d7dbde;
line-height:20px;
margin:0 0 7px;
}

.FileDetailPage .vfButtonBar a {
color:#015ba7;
font-size:.9em;
text-decoration:none;
float:right;
}

.chatterFileViewerPanel {
border:1px solid #d4dadc;
width:538px;
height:338px;
overflow:hidden;
}

.chatterFileViewerPreviewPanel {
background-color:#f7f8f8;
height:100%;
width:100%;
position:relative;
}

.chatterFileViewerPreviewContent {
position:absolute;
top:50%;
left:50%;
}

.chatterFileVeiwerProcessingContent {
height:35px;
margin-top:-35px;
width:81%;
margin-left:-40%;
}

.chatterFileViewerNopreviewContent {
height:1.3em;
margin-top:-1.3em;
width:100%;
margin-left:-50%;
text-align:center;
}

.chatterFileViewerPreviewContent .uploadProgress {
background:url(/img/loading32.gif) no-repeat 0 0;
float:left;
width:32px;
height:32px;
}

.chatterFileViewerPreviewContent .panelLabel {
margin-left:42px;
}

.chatterFileViewerPreviewContent .title {
font-weight:700;
font-size:1.3em;
}

.chatterFileViewerNopreviewContent a {
text-decoration:none;
color:#015ba7;
padding-left:5px;
}

.thumbnailPanel .thumbnailIcon,.thumbnailPanel .sharingStatusIcon {
float:left;
position:relative;
}

.thumbnailPanel .sharingStatusIcon .lockItemIcon,.sharedWithStatusBadge .sharingStatusIcon .lockItemIcon {
background:url(/img/chatter/chatter_photo_icons.png?v=182-1) no-repeat 0 -83px;
}

.thumbnailPanel .sharingStatusIcon .sharedItemIcon,.sharedWithStatusBadge .sharingStatusIcon .sharedItemIcon {
background-position:0 -236px;
}

.thumbnailPanel .thumbnailLabel {
margin-left:22px;
}

.sharedWithStatusBadge .thumbnailLabel {
color:#222;
vertical-align:25%;
}

.thumbnailPanel .itemList ul {
list-style-type:none;
padding-left:0;
margin:0;
}

.thumbnailPanel .itemList li {
height:21px;
margin-left:0;
}

.versionListOverlayPanel {
border:1px solid transparent;
margin-bottom:10px;
}

.sharedWithListOverlayPanel .sharedWithListContainer {
margin-top:10px;
border:1px solid #d4dadc;
height:300px;
}

.sharedWithListOverlayPanel .sharedWithButtonBar {
margin-top:15px;
text-align:center;
}

.sharedWithListOverlayPanel .sharedWithStatusText {
color:#000;
}

.versionListOverlayPanel .chatterListOverlay .overlayList {
border-left:1px solid #e0e3e5;
border-right:1px solid #e0e3e5;
}

.chatterListOverlay .overlayListHeader .firstVersionColumn,.chatterListOverlay .overlayListTable .firstVersionColumn {
width:50px;
}

.chatterListOverlay .overlayListHeader .secondVersionColumn {
width:296px;
}

.chatterListOverlay .overlayListTable .secondVersionColumn {
width:293px;
}

.chatterListOverlay .overlayListTable .secondVersionColumnPanel {
max-width:293px;
}

.chatterListOverlay .overlayListTable .secondVersionColumnPanel .versionLabelWithBadge {
margin-bottom:5px;
}

.chatterListOverlay .overlayListHeader .thirdVersionColumn {
width:100px;
}

.chatterListOverlay .overlayListTable .thirdVersionColumn {
width:80px;
}

.chatterListOverlay .overlayListHeader .secondVersionColumn,.chatterListOverlay .overlayListHeader .thirdVersionColumn {
border-left:1px solid #e0e3e5;
}

.versionOverlayList .versionReasonForChange,.versionOverlayList .updatedByLabel {
font-size:1em;
color:#7d7d84;
}

.versionOverlayList .versionReasonForChange {
margin:4px 0;
}

.chatterListOverlay .overlayListEntity img {
display:block;
overflow:hidden;
}

.chatterListOverlay .inaccessibleMessageSpan {
font-weight:700;
font-style:italic;
}

.sharedWithSummaryList .thumbnailLabel,.versionOverlayList .thumbnailLabel {
overflow:hidden;
text-overflow:ellipsis;
white-space:nowrap;
height:17px;
}

.sharedWithSummaryList .inaccessibleLink {
font-style:italic;
}

.versionOverlayList .thumbnailLabel,.versionOverlayList .updatedByLabel {
margin-right:5px;
margin-top:2px;
}

.versionOverlayList .thumbnailLabel {
font-size:1em;
}

.sharedWithStatusBadge {
vertical-align:-20%;
padding-left:3px;
white-space:nowrap;
}

.overlayList a:hover .deleteIconClass {
background:transparent url(/img/feeds/follow_sprite.png) no-repeat scroll 0 -75px;
}

.FindLinkedFilesPage .rightContent {
margin-left:200px;
width:714px;
}

.headerContent .fileTitle {
white-space:normal;
word-wrap:break-word;
width:710px;
}

.headerContent td {
vertical-align:top;
}

.headerContent .fileTitleNarrow {
white-space:normal;
word-wrap:break-word;
width:600px;
margin-right:6px;
}

.headerContent .fileTitleText {
font-size:1.5em;
color:#222;
font-weight:400;
margin-right:4px;
}

.fileTailNode {
display:inline;
vertical-align:middle;
margin-left:6px;
}

.fileTailNode .fileNameLabel {
font-size:1.35em;
padding-right:3px;
}

.fileTailNode .sharingBadgeLabel {
margin-left:3px;
}

.fileTailNode .sharingStatusIcon {
position:relative;
top:3px;
}

.fileTailNode .sharedWithStatusBadge {
vertical-align:middle;
}

.chatterFileDetailLeftPanel .userInfoPanel {
padding-top:10px;
padding-left:3px;
}

.chatterFileDetailLeftPanel .externalDocumentLogo .imgLargeLogo {
width:auto;
height:auto;
max-width:150px;
max-height:75px;
}

.chatterFileDetailLeftPanel .userNameLastModifiedAtPanel {
margin-left:38px;
height:35px;
}

.chatterFileDetailLeftPanel .descriptionLabel,.chatterFileDetailLeftPanel .descriptionValue {
font-size:.88em;
}

.chatterFileDetailLeftPanel .allVersionsLink {
font-size:1em;
margin-left:3px;
}

.chatterFileDetailLeftPanel .userNameLabel {
text-decoration:none;
color:#4a4a56;
font-size:.92em;
}

.chatterFileDetailLeftPanel .userNameValue {
white-space:nowrap;
width:145px;
overflow:hidden;
text-overflow:ellipsis;
}

.chatterFileDetailLeftPanel .lastModifiedAt {
text-decoration:none;
color:#7d7d84;
font-size:.92em;
}

.chatterFileDetailLeftPanel .descriptionLabel,.chatterFileDetailLeftPanel .numberVersionLabel {
font-size:1em;
color:#333435;
padding-left:3px;
font-weight:700;
}

.chatterFileDetailLeftPanel .descriptionValue {
margin-top:5px;
padding-left:3px;
width:185px;
overflow-x:hidden;
word-wrap:break-word;
}

.chatterFileDetailLeftPanel .vfButtonBar {
width:190px;
}

.FileDetailPage .lowerMainContent {
background:none;
width:770px;
}

.FileDetailPage .centerContent {
margin-left:0;
width:542px;
}

.chatterFileDetailActionListPanel .editItemIcon {
background-position:0 -146px;
}

.chatterFileDetailActionListPanel .deleteItemIcon {
background-position:0 -344px;
}

.chatterFileDetailActionListPanel .groupItemIcon {
background-position:0 -110px;
}

.chatterFileDetailActionListPanel .recordItemIcon {
background-position:0 -128px;
}

.chatterFileDetailActionListPanel .openItemIcon {
background-position:0 -2px;
}

.chatterFileDetailLeftPanel .editDescIcon {
background:transparent url(/img/chatterfiles/chatterfiles16_sprite.png) no-repeat;
background-position:0 -146px;
width:16px;
height:16px;
}

.chatterFileDetailActionListPanel .grayoutText {
color:#7d7d84;
padding-right:5px;
}

#chatterFilesEditPanel .textAreaFullSize {
width:414px;
}

#chatterFilesEditPanel .textAreaNormalSize {
width:350px;
}

#chatterFilesEditPanel .fileFormInputElement {
width:350px;
height:19px;
margin-top:1px;
}

#chatterFilesTabPageUploadPanel .fileFormInputElement {
width:310px;
height:21px;
}

.FileDetailPage div.progressOverlay {
opacity:.45;
background:#000;
}

.FileDetailPage div.progressMessage {
background:#fff;
-moz-border-radius:5px;
-webkit-border-radius:5px;
padding:8px;
}

.FileDetailPage .docViewerOverlay {
z-index:60000;
}

.hidden {
display:none;
}

.hiddenVisibility {
visibility:hidden;
}

.FileDetailPage .fileImgRendition {
display:block;
margin-left:auto;
margin-right:auto;
margin-top:0;
}

.FileDetailPage .filePreviewHeading {
position:absolute;
left:-500px;
}

.chatterPage .centerContent {
-webkit-border-top-right-radius:0;
-webkit-border-top-left-radius:0;
margin-right:0;
padding-left:0;
background:none;
}

.FileDetailPage .privateFileLabel {
overflow:hidden;
display:inline-block;
}

.FileDetailPage .publishBannerForChatterFile {
background:url(/img/chatterfiles/pubLibrarywatermark48.png) no-repeat 488px 2px #e0e8eb;
border-left:1px solid #dbdbdb;
border-right:1px solid #dbdbdb;
border-top:1px solid #dbdbdb;
height:32px;
width:538px;
}

.FileDetailPage .publishBannerForChatterFile .publishBannerForChatterFileTitle {
margin:8px;
}

.FileDetailPage .publishedInfoForLibraryFile {
background:url(/img/chatterfiles/pubLibrarywatermark48.png) no-repeat 150px 2px #e0e8eb;
border:1px solid #d4dadc;
-moz-border-radius:3px;
-webkit-border-radius:3px;
margin:0 0 18px;
padding:11px 12px;
}

.FileDetailPage .publishedInfoForLibraryFile .publishedLibraryFileTitle {
margin-bottom:8px;
}

.FileDetailPage .publishedInfoForLibraryFile .publishedLibraryFileTitle span {
color:#666;
font-size:1.2em;
font-weight:700;
}

.FileDetailPage .publishedInfoForLibraryFile .publishedLibraryFileTitle .pubLibraryWaterMark {
height:48px;
top:-5px;
right:-6px;
}

.FileDetailPage .publishedInfoForLibraryFile .publishedLibraryFileFromInfo {
margin-bottom:10px;
overflow:hidden;
text-overflow:ellipsis;
}

.FileDetailPage .publishBannerForChatterFile span {
vertical-align:middle;
margin:10px;
}

.FileDetailPage .publishBannerForChatterFile span a {
font-weight:700;
margin:5px;
}

.chatterFileListView .listViewport .DESC .x-grid3-sort-icon,body .pbBody .sortDesc,.chatterFileListView .listViewport .ASC .x-grid3-sort-icon,body .pbBody .sortAsc {
background:none;
}

.chatterFileListView .listViewport .DESC,.chatterFileListView .listViewport .ASC {
background-color:transparent;
}

.userFilesPageTitleIcon,.groupFilesPageTitleIcon {
float:left;
margin-right:3px;
}

#docViewerOverlay,#chatterFileVersionListDialog {
position:absolute;
}

#chatterTab .chatterFileListBlock .controls .uploadFile {
margin-top:0;
}

#chatterTab .chatterFileListBlock .multiUploadControl .dragDropZoneDivNoBorder {
margin-top:-2px;
}

.FileDetailPage .threecolumn .headerContent .externalDocumentLogo {
display:inline;
}

.FileDetailPage .threecolumn .headerContent .externalDocumentLogo .imgLargeLogo {
width:150px;
height:20px;
vertical-align:middle;
margin-left:.4em;
}

.recommend.similarFiles ul>li {
margin-bottom:5px;
margin-left:0;
}

.chatterFilesTabPage .leftContent,.FindLinkedFilesPage .leftContent {
float:left;
width:200px;
}

.chatterFileBrowsePanel .liItem a:hover,.rightContent .browseLabelPanel .browseDesc a.browseLink:hover,.FileDetailPage .vfButtonBar a:hover,.chatterFileViewerNopreviewContent a:hover,.helpBubbleContainer a {
text-decoration:underline;
}

.chatterFileBrowsePanel .liItem .groupAndWorkspaceTitle,.chatterFileBrowsePanel .fileBrowseSubHeader,.FileDetailPage .publishedInfoForLibraryFile .publishedLibraryFileFromTitle span {
color:#7d7d84;
}

.threecolumn .headerContent,.FileDetailPage .publishedInfoForLibraryFile .publishedLibraryFileFromTitle {
white-space:nowrap;
}

.thumbnailPanel .sharingStatusIcon img,.sharedWithStatusBadge .sharingStatusIcon img,.sharedWithSummaryList .thumbnailIcon img.followerIcon,.sharedWithSummaryList .thumbnailIcon img.entityIcon {
width:16px;
height:16px;
}

.thumbnailPanel .sharingStatusIcon .orgItemIcon,.sharedWithStatusBadge .sharingStatusIcon .orgItemIcon,.chatterFileDetailActionListPanel .orgItemIcon {
background-position:0 -92px;
}

.versionOverlayList .updatedByLabel,.chatterFileDetailLeftPanel .userThumbnail {
float:left;
}














.feedcontainer .feeditemcommentphoto img,.PeopleListPage .chatterlisticon img {
display:block;
overflow:hidden;
}

.groupListPage .groupicon img,.searchResults .groupicon img,.searchResults .chatterlisticon img,.homeTab .bPageTitle .thumbnail_visible,.feedcontainer .feeditemusericon,.thumbnailPanel .groupThumbnail img,.streamPhoto img.profilePhoto {
border:1px solid #d4dadc;
display:block;
overflow:hidden;
}

.searchResults .chatterlisticon img,.homeTab .bPageTitle .thumbnail_visible,.feedcontainer .feeditemusericon {
height:45px;
width:45px;
}

.feedcontainer .feeditemcommentphoto img {
width:30px;
height:30px;
float:left;
}

.thumbnailPanel .thumbnailTable.guests img {
border-color:#f07e05;
}

.fileTypeIcon img.filePrivateIcon {
position:absolute;
width:8px;
height:8px;
top:19px;
left:20px;
background:#fff url(/img/chatter/chatter_photo_icons.png?v=182-1);
background-position:0 -57px;
}

.expandoFeedContainer {
background-color:#f3f3ec;
clear:both;
width:100%;
}

.expandoFeedContainer .feedpage {
padding-left:10px;
width:817px;
}

.feedpage .feedmain {
float:left;
padding-bottom:5px;
width:546px;
}

.feedpage .feedrightbar {
width:157px;
margin-right:43px;
padding:15px 5px 30px;
}

.feedpage .feedrightbarwider {
width:200px;
padding-top:15px;
line-height:normal;
white-space:normal;
}

.homeTab .bodyDiv .bPageTitle {
padding-top:9px;
}

.homeTab .bPageTitle .thumbnail_visible {
float:left;
margin-right:10px;
}

.homeTab .bPageTitle .pageType {
margin-bottom:4px;
}

.homeTab .bPageTitle h1.currentStatusUserName {
display:inline;
padding-right:4px;
}

.currentStatusUserName a {
font-size:.72em;
font-weight:400;
}

.actionsOnHoverEnabled .feeditembody {
padding-right:40px;
}

.actionsOnHoverEnabled .bookmarkLink,.actionsOnHoverEnabled .unbookmarkLink {
background-image:url(/img/chatter/sprites/sprite_images/chattersupersprite.png?v=182-4);
background-position:0 -289px;
width:16px;
height:16px;
display:block;
text-indent:-999em;
position:absolute;
right:21px;
top:2px;
}

.actionsOnHoverEnabled .bookmarkLink {
background-image:url(/img/chatter/sprites/sprite_images/chattersupersprite.png?v=182-4);
background-position:0 -289px;
width:16px;
height:16px;
}

.actionsOnHoverEnabled .unbookmarkLink {
background-image:url(/img/chatter/sprites/sprite_images/chattersupersprite.png?v=182-4);
background-position:0 -329px;
width:16px;
height:16px;
}

.actionsOnHoverEnabled a.bookmarkLink:hover {
background-image:url(/img/chatter/sprites/sprite_images/chattersupersprite.png?v=182-4);
background-position:0 -309px;
width:16px;
height:16px;
}

.actionsOnHoverEnabled a.unbookmarkLink:hover {
background-image:url(/img/chatter/sprites/sprite_images/chattersupersprite.png?v=182-4);
background-position:0 -349px;
width:16px;
height:16px;
}

.actionsOnHoverEnabled .bookmarkLink .toolkit-el-mask,.actionsOnHoverEnabled .unbookmarkLink .toolkit-el-mask {
background-color:transparent;
}

.actionsOnHoverEnabled .feedDeleteLink,.actionsOnHoverEnabled .commentDeleteLink {
background-image:url(/img/feeds/x_sprite.png);
width:9px;
height:8px;
display:block;
border:4px solid #fff;
text-indent:-999em;
position:absolute;
right:2px;
top:0;
}

.actionsOnHoverEnabled .commentDeleteLink {
border:4px solid #eff7fa;
top:2px;
}

.actionsOnHoverEnabled a.feedDeleteLink:hover,.actionsOnHoverEnabled a.commentDeleteLink:hover {
background-position:0 -8px;
}

.feeditemextras {
padding-right:20px;
}

.feedcontainer .feeditemseparatingdot {
margin:0 3px;
}

.feedcontainer .feeditemcontent {
display:block;
margin-left:58px;
border-bottom:none;
}

.contentdetails {
white-space:normal;
word-wrap:break-word;
table-layout:fixed;
width:100%;
}

.feedcontainer .feeditemcontent img.mruIcon,.linkPostLinkContainer a.linkPostLink img,.richPost .thumbContainer.default {
margin-right:4px;
vertical-align:middle;
}

.feedcointainer .feeditemcontentlink img {
border:medium none;
}

.feedcontainer .feeditemfooter,.feedcontainer .feedcommentfooter {
display:block;
font-size:.92em;
line-height:13px;
margin:4px 0;
}

.feedcontainer .feeditemextras {
margin:3px 0 0;
}

.feedcontainer .feedArrow,.feedcontainer .feeditemcomments {
background:none;
border-top:1px solid #dee4e9;
margin:0;
padding:0;
}

.feedcontainer .feedcommentarrow {
height:5px;
background:url(/img/alohaSkin/feeds/comment_topArrow.gif) no-repeat left top;
margin-left:10px;
}

.feedcontainer .feeditemcomment,.feedcontainer .feedcommentsshowmore,.feedcontainer .feeditemcommentplaceholder,.feedcontainer .feeditemlike {
background:#eff7fa;
border-bottom:1px solid #dee5ea;
border-top:1px solid #FFF;
}

.feedcontainer .feeditemlike .like-icon,.feedcontainer .commentlike .like-icon {
display:inline-block;
margin-right:3px;
background-image:url(/img/chatter/sprites/sprite_images/chattersupersprite.png?v=182-4);
background-position:0 -569px;
width:16px;
height:16px;
}

.feedcontainer .commentlike .small-like-icon {
background-image:url(/img/chatter/sprites/sprite_images/chattersupersprite.png?v=182-4);
background-position:0 -42px;
width:12px;
height:12px;
display:inline-block;
margin-right:6px;
}

.feedcontainer .feedcommentsshowmore {
padding:6px;
}

.feedcontainer .feeditemcomment,.feedcontainer .feeditemcommentplaceholder,.feedcontainer .feeditemlike {
padding:4px 6px;
}

.feedcontainer .feeditemcomment {
min-height:34px;
padding-right:18px;
}

.feedcontainer .feeditemcommentphotocontainer {
height:0;
}

.feedcontainer .feeditemcommentaction {
float:left;
margin-right:8px;
border:1px solid #999;
}

.feedcontainer .feeditemcommentbody {
display:block;
margin-left:42px;
}

.feedcontainer .feeditemcommentnew {
margin-left:42px;
}

.feedcontainer .feeditemcommentnew .newcommentbutton {
float:right;
margin:0 -10px 0 0;
}

.feedcontainer .feeditemcommentplaceholder input {
border:1px solid #c0d0d0;
background:transparent url(/img/alohaSkin/feeds/textfield_bg80opacity.png) repeat-x scroll center top;
color:#999;
height:1.3em;
min-height:1.3em;
}

.feedcontainer .feeditemcommenttext textarea.foobar {
background:#fff url(/img/alohaSkin/feeds/textfield_bg80opacity.png) repeat-x scroll center top;
}

.feedcontainer .singlefeeditemheader {
line-height:28px;
vertical-align:middle;
margin:0 0 8px;
padding:0 0 5px;
}

.feedcontainer .singlefeeditemheader .thisupdatespan {
font-weight:700;
color:#222;
background:#cfeef8;
font-size:1.17em;
-moz-border-radius:5px;
-webkit-border-radius:5px;
padding:6px;
}

.feedcontainer .singlefeeditemheader a {
font-size:1.17em;
font-weight:700;
color:#015ba7;
margin-right:9px;
}

.feedcontainer .singlefeeditemheader .thisupdatespanarrow {
display:inline-block;
height:28px;
width:6px;
margin-right:6px;
}

.feedcontainer .singlefeeditemheader .thisupdatespanarrowimage_ltr {
background:url(/img/chatter/divider.png) 0 2px no-repeat;
}

.feedcontainer .singlefeeditemheader .thisupdatespanarrowimage_rtl {
background:url(/img/chatter/divider_rtl.png) 0 2px no-repeat;
}

.feedcontainer .feeditemlinkpost {
padding-left:20px;
}

.feedclearfloat {
clear:both;
height:0;
font-size:.01em;
line-height:0;
}

.feeddata {
height:0;
font-size:0;
line-height:0;
}

.feedcontainer .linkPostLinkContainer {
padding:4px 0 5px;
}

.feedcontainer .linkPostLinkContainer a {
font-size:1.1em;
font-weight:400;
}

.feedcontainer .feedSearchHighlight {
font-weight:700;
background-color:#fef49b;
}

.feedcontainer a.feedMessageMentionSelfHighlight {
background-color:#fef49b;
}

.feedcontainer .feeditemcontent .trackedChangeRollover.cxhover {
background-color:#eee;
}

.feedcontainer .feeditemcontent ul.expandedchanges li {
list-style:disc;
}

.toolkit-el-mask {
z-index:100;
position:absolute;
top:0;
left:0;
-moz-opacity:.5;
opacity:.50;
filter:alpha(opacity=50);
width:100%;
height:100%;
zoom:1;
background:#ccc;
}

.toolkit-masked {
overflow:hidden!important;
}

.toolkit-masked-relative {
position:relative!important;
}

.toolkit-masked select,.toolkit-masked object,.toolkit-masked embed {
visibility:hidden;
}

.chattertextareacontainer .chattermessagecontainer {
margin-bottom:6px;
}

.chattertextareacontainer .chattermessagecontainer div {
-webkit-line-break:after-white-space;
word-wrap:break-word;
white-space:normal;
margin:4px 6px;
}

.chattertextareacontainer .chattertextareanotice {
color:#222;
background-color:#fffcdd;
border:1px solid #f6eac1;
-moz-border-radius:5px;
border-radius:5px;
padding:4px;
}

.feedcontainer .feeditemcommentplaceholder input,.feedcontainer .feeditemcommentnew .foobar {
resize:none;
overflow:hidden;
width:100%;
background-color:#fff;
border:1px solid #c7ccce;
line-height:16px;
-webkit-line-break:after-white-space;
word-wrap:break-word;
outline-style:none;
border-radius:5px;
-moz-border-radius:5px;
margin:0;
padding:4px;
}

.shadowDiv {
-webkit-line-break:after-white-space;
word-wrap:break-word;
}

.feedcontainer .feeditemcommentnew .foobar {
color:#222;
background-color:#fff;
}

.feedcontainer .feeditemcommenttext textarea.externalGroupInput {
background:#fff6e8;
border:1px solid #da7600;
}

.externalGroupWarning {
color:#fe8b20;
}

.linkedContentDetailsContainer,.contentDetails,.selectedFileDetailsContainer,.fileDetails {
overflow:hidden;
zoom:1;
white-space:normal;
word-wrap:break-word;
}

.selectedFileDetailsContainer .fileDetails input {
vertical-align:middle;
margin:0 2px 2px;
}

.linkedContentDetailsContainer .imgBlock,.selectedFileDetailsContainer .imgBlock {
float:left;
margin:0 10px;
}

.linkedContentDetailsContainer .title,.selectedFileDetailsContainer .title {
overflow:hidden;
white-space:normal;
margin-bottom:5px;
font-weight:700;
font-size:1.08em;
display:block;
}

.selectedFileDetailsContainer .title .size {
font-weight:400;
color:#888;
font-size:.84em;
}

.selectedFileDetailsContainer .title {
margin-left:2px;
}

.linkedContentDetailsContainer .action {
color:#015ba7;
margin-bottom:5px;
overflow:hidden;
white-space:normal;
}

.linkedContentDetailsContainer .description {
display:block;
overflow:hidden;
white-space:normal;
color:#888;
font-size:.91em;
padding:5px 0;
}

.feeditemcomment .externalGroupWarning {
float:right;
padding-top:3px;
padding-right:5px;
}

.feeditemcomment .contentPost .rightSideCell {
padding-left:2px;
}

.feeditemcomment img.contentThumbnail {
max-width:60px;
max-height:60px;
padding:0;
}

.feeditemcomment img.contentThumbnailNoPreview {
margin:0 7px 0 10px;
}

.feeditemcomment .linkedContentDetailsContainer .previewContainer {
max-width:60px;
padding:0;
}

.feeditemcomment .linkedContentDetailsContainer img.contentThumbnailNoPreview {
margin:-4px 0 0;
}

.feeditemcomment .linkedContentDetailsContainer .contentdetails {
max-width:230px;
margin-top:-2px;
padding:0 0 0 9px;
}

.feeditemcomment .linkedContentDetailsContainer .title {
font-size:1em;
white-space:normal;
word-wrap:break-word;
}

.feeditemcomment .linkedContentDetailsContainer .action {
display:block;
padding:0;
}

#chatterFindExistingContentContent .helpLink {
vertical-align:top;
padding-right:5px;
}

#chatterFindExistingContentContent .quickfindContainer {
float:left;
padding-top:0;
}

.detailPage .feedpage .feedmain {
line-height:16px;
}

.cxshowmorefeeditemscontainer a {
margin-top:12px;
font-size:.92em;
font-weight:700;
color:#333;
display:block;
border:1px solid #d4dadc;
text-align:center;
-moz-border-radius:3px;
-webkit-border-radius:3px;
text-decoration:none;
background:url(/img/alohaSkin/btn_sprite.png) repeat-x scroll right top #e8e8e9;
padding:4px 0;
}

.cxshowmorefeeditemscontainer a:hover {
text-decoration:none;
color:#333;
background-position:right -30px;
}

.cxshowmorefeeditemscontainer a:active {
background-position:right -60px;
}

.videoLinkPostOuterContainer {
position:relative;
padding:4px 0 5px;
}

.videoImages {
position:relative;
width:140px;
height:97px;
float:left;
}

.videoImages .thumbnail {
padding-right:10px;
position:absolute;
top:0;
left:0;
height:97px;
width:130px;
cursor:pointer;
}

.videoImages .play {
background:url(/img/chatter/play.png) no-repeat scroll 0 0 transparent;
width:70px;
height:50px;
position:absolute;
margin-top:-23px;
margin-left:-35px;
top:50%;
left:50%;
cursor:pointer;
}

.videoLinkMetaClass {
word-wrap:break-word;
overflow:hidden;
}

.videoLinkMetaClass>.videoLinkPostLinkTitle {
color:#015ba7;
font-weight:400;
font-size:1em;
padding-bottom:5px;
}

.videoLinkMetaClass>.videoLinkDescription {
color:#7d7d84;
font-weight:400;
font-size:1em;
line-height:15px;
padding-bottom:5px;
}

.videoLinkMetaClass>.videoLinkLengthClass {
color:#222;
font-weight:400;
font-size:1em;
line-height:15px;
}

.guestUserMessage {
background:#fff url(/img/alohaSkin/feeds/feedbg.png) repeat-x scroll left -40px;
-moz-border-radius:5px;
-webkit-border-radius:5px;
-moz-box-shadow:0 2px 4px #aaa;
padding:15px;
}

.guestUserMessageHeader {
font-size:1.2em;
font-weight:700;
color:#222;
padding:5px;
}

.guestUserMessageContent {
font-size:1em;
color:#222;
padding:5px 5px 5px 50px;
}

.guestUserMessageFooter {
font-size:1em;
color:#008040;
padding:5px 5px 5px 50px;
}

.guestUserMessage .lockIcon {
background:url(/img/chatterservice/lock24.png) no-repeat;
padding:11px 0 11px 35px;
}

.feedcontainer .newFeedItemsMessage {
background-color:#ffffdc;
color:#000;
cursor:pointer;
line-height:23px;
whitespace:normal;
-moz-border-radius:5px;
text-align:center;
border-color:#fceeb4;
border-style:solid;
border-width:1px;
margin:4px 3px 20px 0;
padding:0 14px;
}

.feedcontainer .newFeedItemsMessageHover {
background:url(/img/chatter/feedupdate_bgGradient.png) repeat-x scroll 0 0;
border-color:#e9eded;
}

.chatterexpando {
border:transparent;
-moz-border-radius-bottomleft:5px;
-moz-border-radius-bottomright:5px;
-webkit-border-bottom-right-radius:5px;
-webkit-border-bottom-left-radius:5px;
border-top:1px solid #fff;
background:#fff;
width:100%;
}

.chatterexpando .feedpage {
padding-left:10px;
width:760px;
}

.docViewerOverlay .innerContent {
padding:4px 4px 0;
}

.feedcontainer .contentActionLabel {
padding:2px;
}

.feedcontainer a.contentActionLink img {
height:16px;
width:16px;
background:transparent url(/img/chatterfiles/chatterfiles16_sprite.png) no-repeat;
}

.feedcontainer a.contentActionLink .previewItemIcon,.feedcontainer a.contentActionLink .openUrlItemIcon {
background-position:0 -2px;
}

.feedcontainer a.contentActionLink .uploadIcon {
background-position:0 -40px;
}

.feedcontainer a.contentActionLink .shareItemIcon {
background-position:0 -56px;
vertical-align:middle;
}

.feedcontainer span.fileSize,.postInput span.fileSize {
color:#999;
font-size:.9em;
}

.postInput div.uploadFileSizeLimit {
padding-top:4px;
}

.contentPost .moreFileActions-td .linkText,.contentPost .moreFileActions-td .contentActionLabel {
vertical-align:baseline;
}

.contentPost .moreFileActions-td .followicon {
margin-top:-2px;
}

.contentPost .moreFileActions-td .followLink,.contentPost .moreFileActions-td .unfollowLink {
display:inline;
vertical-align:baseline;
}

.contentActionMenu {
border-radius:5px;
-moz-border-radius:5px;
-moz-box-shadow:0 2px 5px #a0acab;
-webkit-border-radius:5px;
-webkit-box-shadow:0 2px 5px #a0acab;
display:none;
background-color:#fff;
position:absolute;
z-index:5;
border:1px solid #b6b6b6;
padding:5px 5px 5px 13px;
}

#contentCommentDropdown {
border-radius:5px;
-moz-border-radius:5px;
-moz-box-shadow:0 2px 5px #a0acab;
-webkit-border-radius:5px;
-webkit-box-shadow:0 2px 5px #a0acab;
background-color:#fff;
border:1px solid #b6b6b6;
z-index:5;
width:auto;
padding:5px;
}

#contentCommentDropdown .contentCommentMenuItem a.contentCommentLink {
margin-top:1px;
margin-bottom:1px;
padding-left:5px;
padding-right:5px;
font-size:1em;
line-height:23px;
font-weight:400;
text-decoration:none;
color:#015ba7;
display:block;
}

#contentCommentDropdown .contentCommentMenuItem a.contentCommentLink:hover {
text-decoration:none;
color:#015ba7;
border-radius:9px;
-moz-border-radius:9px;
-webkit-border-radius:9px;
background-color:#cfeef8;
height:23px;
}

.contentActionMenuItem .contentActionLabel {
font-size:1em;
padding:0 5px;
}

.contentActionMenuItem>.contentActionLink {
white-space:nowrap;
text-decoration:none;
}

.contentActionMenuItem>.contentActionLink>img {
margin-top:4px;
}

.contentActionMenu>.upload.hover {
border-top:none;
}

.contentActionMenu>.hr {
margin-left:-9px;
border-top:1px solid #d4dadc;
}

.contentActionMenu .noIcon {
padding-left:19px;
}

.more-file-actions>.contentActionLabel {
padding-right:5px;
vertical-align:baseline;
}

.more-file-actions>.content-action-link-arrow,.chatterFileDetailActionListPanel .content-action-link-arrow {
background:transparent url(/img/feeds/arrow_sprite.png) no-repeat scroll 0 -14px;
height:9px;
width:9px;
vertical-align:baseline;
margin-bottom:-2px;
}

.chatterFileDetailActionListPanel .content-action-link-arrow {
margin-bottom:3px;
margin-left:5px;
}

a.more-file-actions:hover .content-action-link-arrow,.chatterFileDetailActionListPanel a:hover .content-action-link-arrow {
background-position:0 -22px;
}

.contentActionMenuItem {
margin-top:1px;
margin-bottom:1px;
margin-left:-9px;
padding-left:8px;
padding-top:3px;
padding-bottom:3px;
}

.contentActionMenuItem.hover {
border-radius:9px;
-moz-border-radius:9px;
-webkit-border-radius:9px;
background-color:#cfeef8;
}

.contentActionMenu a.unchecked:hover span.contentActionLabel,.contentActionMenu a.disabled:hover span.contentActionLabel {
text-decoration:none;
cursor:default;
}

a.contentThumbnail-a {
display:block;
height:100%;
}

.contentThumbnail+.previewHover {
background-image:url(/img/chatterfiles/zoom24withbg.png);
background-position:center center;
background-repeat:no-repeat;
}

.feeditemcomment .contentThumbnail+.previewHover {
background-image:url(/img/chatterfiles/zoom12withbg.png);
}

iframe.x-hidden {
position:absolute!important;
left:-10000px;
top:-10000px;
visibility:hidden;
}

body .userProfileHoverUserBlock .userProfileHoverPageBlock .userProfileHoverBody.pbBody.chatterUserProfileHoverBody {
margin:0;
padding:16px;
}

.chatterUserProfileHoverCol1 {
width:64px;
float:left;
margin-right:14px;
}

.chatterUserProfileHoverPhoto img {
width:64px;
height:64px;
}

.chatterUserHoverName a {
font-size:1.67em;
color:#014ba7;
font-weight:700;
text-decoration:none;
}

.chatterUserHoverTitle {
font-size:1em;
color:#7d7d84;
font-style:italic;
}

.chatterUserHoverPhoneList {
margin-top:10px;
line-height:16px;
}

.chatterUserHoverPhoneNumber {
color:#222;
float:left;
margin-right:8px;
}

.chatterUserHoverTool {
padding-top:8px;
margin-top:8px;
border-top:1px solid #e9eaea;
}

.chatterUserGuestBadge,.chatterGroupGuestBadge,.nonTailBreadCrumbGuestBadge {
color:#888;
font-weight:400;
}

.nonTailBreadCrumbGuestBadge {
margin-left:0;
margin-right:5px;
}

.sendPrivateMessage img {
background-image:url(/img/chatter/sprites/sprite_images/chattersupersprite.png?v=182-4);
background-position:0 -389px;
width:16px;
height:16px;
vertical-align:middle;
}

.feedcontainer .dbrdCmpLabel {
font-size:.92em;
padding:2px;
}

.feedcontainer a.dbrdCmpViewLink img {
height:16px;
width:16px;
background-repeat:no-repeat;
background-color:transparent;
background-position:0 -2px;
background-image:url(/img/chatterfiles/chatterfiles16_sprite.png);
}

.feedcontainer img.dbrdThumbnail {
width:140px;
border:1px solid transparent;
}

.dbrdThumbnail-a {
display:block;
height:100%;
position:relative;
}

.dbrdThumbnail+.previewHover {
background-image:url(/img/chatterfiles/zoom24withbg.png);
background-position:center center;
background-repeat:no-repeat;
top:0;
left:1px;
margin-top:4px;
position:absolute;
padding:0;
}

.dbrdSnapshotDialog .middle .innerContent {
height:auto;
max-height:580px;
overflow:auto;
}

.dbrdThumbnailSubtitle {
font-size:.92em;
color:#7d7d84;
}

.feedcontainer a.dbrdCmpGotoDashLink img {
height:16px;
width:16px;
background-repeat:no-repeat;
background-color:transparent;
background-position:0 -325px;
background-image:url(/img/chatterfiles/chatterfiles16_sprite.png);
}

.chatterListOverlay {
background:transparent;
}

.chatterListOverlay .filterBy {
color:#4a4a56;
font-size:1em;
font-weight:700;
margin-right:2px;
}

.chatterListOverlay .overlayList {
overflow-y:auto;
overflow-x:auto;
height:325px;
margin-top:10px;
position:relative;
border-top:1px solid #e0e3e5;
border-bottom:1px solid #e0e3e5;
}

.chatterListOverlay .displayName {
overflow:hidden;
text-overflow:ellipsis;
width:280px;
}

.chatterListOverlay .entityDisplayName {
width:326px;
padding-top:8px;
padding-bottom:8px;
}

.chatterListOverlay .entitySelect,.entitySelect option {
width:100px;
}

.chatterListOverlay .overlayListTable td {
border-bottom:1px solid #ededed;
vertical-align:top;
}

.chatterListOverlay .overlayListPhoto {
width:36px;
padding-right:10px;
}

.chatterListOverlay .overlayListLink {
white-space:nowrap;
}

.chatterListOverlay .paginator {
text-align:right;
margin-top:6px;
}

.chatterListOverlay .paginator.withExternalInvite {
position:absolute;
right:15px;
}

.chatterListOverlay .externalInvite {
margin-top:6px;
margin-bottom:10px;
padding-left:40px;
background:transparent url(/img/chatter/invite_icon.png) no-repeat scroll left top;
height:33px;
}

.externalGroupAdminMailToLink {
width:240px;
margin-bottom:10px;
}

.displayName a,.memberDisplayName a {
color:#015ba7;
text-decoration:none;
font-weight:700;
}

.infoGrey {
background:transparent url(/img/feeds/info_grey.png) no-repeat;
height:16px;
width:16px;
vertical-align:middle;
}

.overlayList.groupList .overlayListPhoto a {
display:block;
position:relative;
}

.rechatSharing {
left:145px;
border-right:1px solid #dedede;
white-space:nowrap;
position:absolute;
top:0;
}

.rechatSharing .selectorLabel {
display:inline-block;
padding-top:12px;
}

.sharedWithListOverlayPanel {
border:1px solid transparent;
margin-bottom:10px;
}

.sharedWithListOverlayPanel .sharedWithStatusBar,.filesDetailPage .sharedWithStatusBar {
margin-top:25px;
margin-bottom:16px;
padding-left:10px;
padding-top:6px;
padding-bottom:6px;
-moz-border-radius:5px;
-webkit-border-radius:5px;
border:1px solid #fceeb4;
background-color:#ffffdc;
}

.sharedWithListOverlayPanel .notificationEmailPanel .sharedWithStatusBar {
margin-top:0;
margin-bottom:0;
}

.filesDetailPage .sharedWithStatusBar {
margin-top:0;
margin-bottom:5px;
}

.sharedWithListOverlayPanel .pageHelpIconPanel .helpIcon,.chatterFilesTabPageHeader .pageHelpIconPanel .helpIcon,.sharedWithListOverlayPanel .overlayListHeader .infoIcon,.publishToLibContentOverlayPanel .pageHelpIconPanel .helpIcon,.actionProgressPanel .pageHelpIconPanel .helpIcon {
vertical-align:bottom;
}

.sharedWithListOverlayPanel .pageHelpIconPanel .helpLink,.chatterFilesTabPageHeader .pageHelpIconPanel .helpLink,.actionProgressPanel .pageHelpIconPanel .helpLink {
font-size:.9em;
padding-right:5px;
}

.sharedWithListOverlayPanel .sharedWithStatusBar .sharingStatusIcon,.filesDetailPage .sharedWithStatusBar .sharingStatusIcon {
float:left;
position:relative;
}

.sharedWithListOverlayPanel .sharedWithStatusBar .sharingStatusIcon .lockItemIcon {
background-position:0 -308px;
}

.sharedWithListOverlayPanel .sharedWithStatusBar .thumbnailLabel,.filesDetailPage .sharedWithStatusBar .thumbnailLabel {
margin-left:22px;
}

.sharedWithListOverlayPanel .chatterListOverlay .overlayList {
border-left:1px solid #e0e3e5;
border-right:1px solid #e0e3e5;
}

.sharedWithListOverlayPanel .sharedWithMessage {
margin:8px 2px 0;
}

.sharedWithListOverlayPanel .chatterListOverlay .overlayListHeader,.versionListOverlayPanel .chatterListOverlay .overlayListHeader {
background:#f2f3f3;
font-weight:700;
border-top:1px solid #e0e3e5;
border-left:1px solid #e0e3e5;
border-right:1px solid #e0e3e5;
margin-top:8px;
margin-bottom:-10px;
}

.sharedWithListOverlayPanel .chatterListOverlay .overlayListTable,.versionListOverlayPanel .chatterListOverlay .overlayListTable {
table-layout:fixed;
}

.sharedWithListOverlayPanel .chatterListOverlay .overlayListTable {
border-collapse:collapse;
}

.sharedWithListOverlayPanel .chatterListOverlay .overlayListHeader .firstColumn {
width:477px;
}

.sharedWithListOverlayPanel .chatterListOverlay .overlayListHeader .secondColumn {
width:145px;
border-left:1px solid #e0e3e5;
}

.sharedWithListOverlayPanel .chatterListOverlay .overlayListTable .displayName,.versionListOverlayPanel .chatterListOverlay .overlayListTable .displayName {
overflow:hidden;
text-overflow:ellipsis;
white-space:nowrap;
height:17px;
width:290px;
}

.sharedWithListOverlayPanel .chatterListOverlay .overlayListTable .displayName {
width:418px;
}

.sharedWithListOverlayPanel .chatterListOverlay .overlayListTable .overlayListPermission {
width:140px;
white-space:nowrap;
}

.sharedWithListOverlayPanel .chatterListOverlay .overlayListTable .permissionLabel {
margin-top:9px;
float:left;
white-space:nowrap;
}

.sharedWithListOverlayPanel .chatterListOverlay .overlayListTable .shareWithCompanyRow {
background-color:#e0e8eb;
}

.sharedWithListOverlayPanel .chatterListOverlay .overlayList,.versionListOverlayPanel .chatterListOverlay .overlayList {
height:205px;
}

.sharedWithListOverlayPanel .whiteSpaceAboveShareList {
height:30px;
}

.sharedWithListOverlayPanel .sharedWithLinkBar .sharedWithMoreLabel {
font-weight:700;
color:#222;
}

.sharedWithListOverlayPanel .sharedWithLinkBar .makePrivateLinkPanel {
float:right;
width:144px;
text-align:left;
}

.sharedWithListOverlayPanel .entitySearchBoxWithViewCollaborator {
width:240px;
}

.makePrivateMsgPanel .makePrivateMsgForChatterFile {
float:right;
width:95%;
margin-bottom:15px;
}

.sharedWithListOverlayPanel .entitySearchBox {
width:477px;
height:20px;
font-family:Arial,Helvetica,sans-serif;
font-size:100%;
margin:3px;
}

.sharedWithListOverlayPanel .notificationEmailPanel {
width:618px;
margin:35px 0 5px;
}

.sharedWithListOverlayPanel .notificationEmailPanel .sendEmailOption {
float:left;
margin-top:0;
margin-right:5px;
}

.sharedWithListOverlayPanel .notificationEmailPanel .optionalMsg {
width:607px;
height:70px;
margin-top:5px;
padding:3px;
}

.sharedWithListOverlayPanel .chatterListOverlay .overlayListHeader .thirdColumn {
width:143px;
border-left:1px solid #e0e3e5;
}

.sharedWithListOverlayPanel .chatterListOverlay .overlayList .overlayListWrapper {
margin-bottom:3px;
}

.sharedWithListWizard .chatterListOverlay .overlayList {
height:100%;
overflow:hidden;
}

.sharedWithStatusBar .sharingStatusIcon .orgItemIcon {
background-position:0 -92px;
}

.sharedWithStatusBar .sharingStatusIcon .warningIcon {
background-position:0 -200px;
}

.sharedWithStatusBar .sharingStatusIcon .sharedItemIcon {
background-position:0 -239px;
}

.sharedWithStatusBar .sharingStatusIcon img {
height:16px;
width:16px;
}

#chatterFileSharedWithListDialog {
position:absolute;
word-wrap:break-word;
}

#chatterFileSharedWithListDialogTitle,#chatterFilePublicLinkDialogTitle {
display:block;
width:460px;
white-space:nowrap;
overflow:hidden;
text-overflow:ellipsis;
}

#shareWithEntityForm .overlayListTable {
table-layout:fixed;
width:100%;
}

#shareWithEntityForm .chatterListOverlay {
margin-top:25px;
}

#shareWithEntityForm .overlayListName {
color:#222;
font-weight:700;
text-decoration:none;
}

#shareWithEntityForm .overlayListOwner {
width:230px;
vertical-align:middle;
border-left:3px solid #fff;
}

#shareWithEntityForm .overlayOwnerSpan {
font-size:.92em;
background:#ffc url(/img/msg_icons/info16.gif) 2px 2px no-repeat;
border:1px solid #ccc;
position:relative;
white-space:nowrap;
margin:2px 2px 2px 11px;
padding:3px 3px 4px 20px;
}

#shareWithEntityForm .overlayListViewer {
width:106px;
border-left:3px solid #fff;
}

#shareWithEntityForm .overlayListCollaborator {
width:119px;
border-left:3px solid #fff;
}

#shareWithEntityForm .overlayListLink {
width:35px;
}

#shareWithEntityForm .chatterListOverlay .overlayListTable td {
border-bottom:none;
padding-top:5px;
overflow:hidden;
text-overflow:ellipsis;
}

#shareWithEntityForm .chatterListOverlay .overlayListTable td.notFirstRow {
border-top:1px solid #ededed;
}

.sharedWithListWizard .chatterListOverlay .overlayScrollList {
height:125px;
overflow-x:hidden;
overflow-y:auto;
}

.sharedWithListWizard .chatterListOverlay .sharingOptionRadio {
margin:9px 45px;
}

.sharedWithListWizard .maxSharedWithPeopleCntMsg {
color:#ea9800;
padding:5px 8px;
}

#selectedPeopleToShareList {
border-bottom:1px solid #ededed;
}

#selectedPeopleToShareList.noBottomBorder {
border-bottom:0;
}

.sharedWithNoGroupMembershipMessage img {
background-position:0 -200px;
width:16px;
height:16px;
margin-right:10px;
vertical-align:bottom;
}

.sharedWithListOverlayPanel a:hover .permissionLabel {
text-decoration:underline;
cursor:hand;
}

.sharedWithListOverlayPanel .tinyDownArrowIcon,.sharedWithPermissionDropdown .tinyDownArrowIcon,.chatterFileDetailActionListPanel .tinyDownArrowIcon,.sharedWithOptionPanel .sharedWithStatusBar a .tinyDownArrowIcon,.sharedWithOptionPanel .sharedWithStatusBar a:hover .tinyDownArrowIcon {
padding-right:15px;
height:10px;
}

.sharedWithOptionPanel .sharedWithStatusBar a .tinyDownArrowIcon {
background-position:0 -168px;
float:right;
}

.FileDetailPage .dropdownPanel {
border:1px solid #b6b6b6;
-moz-border-radius:5px;
radius:5px;
-moz-box-shadow:0 2px 5px #a0a6ab;
}

.FileDetailPage .dropdownPanel .sharedWithOptionLi a {
color:#222;
display:block;
padding-bottom:5px;
padding-top:5px;
text-decoration:none;
}

.sharedWithPermissionDropdown .tinyDownArrowIcon {
height:11px;
margin-left:-3px;
}

.sharedWithListOverlayPanel .permissionActionLink {
white-space:nowrap;
float:left;
}

.permissionActionLinkPanel {
padding-top:8px;
}

.permissionActionLinkPanel a {
color:#222;
text-decoration:none;
width:81%;
}

.permissionLabelPanel .permissionLabel {
padding-left:10px;
color:#015ba7;
}

.sharedWithPermissionDropdown {
border:1px solid #d4dadc;
position:absolute;
z-index:60005;
background-color:#fff;
border-radius:5px;
box-shadow:0 2px 5px #acacac;
-moz-border-radius:5px;
-moz-box-shadow:0 2px 5px #acacac;
-webkit-border-radius:5px;
-webkit-box-shadow:0 2px 5px #acacac;
padding:9px 4px;
}

.sharedWithPermissionDropdown a.permissionActionLink,.sharedWithPermissionDropdown a.permissionActionLink:hover {
white-space:nowrap;
float:left;
font:normal #222;
text-decoration:none;
-moz-border-radius:7px;
-webkit-border-radius:7px;
background-color:#fff;
cursor:pointer;
padding:4px 10px;
}

.sharedWithPermissionDropdown a.permissionActionLink:hover {
color:#015ba7;
text-decoration:none;
background-color:#cfeef8;
}

.makePrivateMsgPanel .makePrivateMsgForContentFile,.makePrivateMsgPanel .stopSharingMsg,.changePermissionMsgPanel .changePermissionMsg {
white-space:normal;
word-wrap:break-word;
margin-bottom:15px;
}

.makePrivateMsgPanel .stopSharingMsg .stopSharingWithCompanyDescription {
margin:20px;
}

.confirmationMsgPanel img {
height:32px;
width:32px;
background:transparent url(/img/chatterfiles/chatterfiles32_sprite.png) no-repeat;
}

.confirmationMsgPanel .confirmationMsg {
padding-top:4px;
padding-bottom:15px;
width:360px;
float:right;
}

.chatterListOverlay .overlayListTable .permissionLink a .deleteIconClass {
margin-top:9px;
margin-right:5px;
}

.overlayList a .deleteIconClass {
background:transparent url(/img/feeds/follow_sprite.png) no-repeat scroll 0 -54px;
border:medium none;
cursor:pointer;
margin-top:6px;
height:15px;
width:15px;
}

.chatterListOverlay .overlayListTable .shortSharedWithName,.chatterListOverlay .overlayListTable .longSharedWithName {
white-space:nowrap;
word-wrap:normal;
width:415px;
}

.chatterListOverlay .overlayListTable .shortSharedWithName {
width:275px;
}

.chatterListOverlay .overlayListTable .longSharedWithName {
width:380px;
}

.chatterListOverlay .overlayListTable .displayNameWidthWithViewCollaborator {
width:279px;
}

.dropdownPanel {
border:1px solid #d4dadc;
position:absolute;
background-color:#fff;
border-radius:0 0 5px 5px;
box-shadow:0 2px 5px #acacac;
-moz-border-radius:0 0 5px 5px;
-moz-box-shadow:0 2px 5px #acacac;
-webkit-border-radius:0 0 5px 5px;
-webkit-box-shadow:0 2px 5px #acacac;
z-index:60005;
width:100px;
}

.dropdownPanel .sharedWithStatusBar a {
padding-left:41px;
}

.dropdownPanel .sharedWithStatusBar a.lockItemIcon {
background-position:20px -304px;
}

.dropdownPanel .sharedWithStatusBar.checked {
background:transparent url(/img/chatterfiles/chatterfiles16_sprite.png) no-repeat 2px -378px;
}

.dropdownPanel .sharedWithStatusBar a:hover {
background-color:#d0eef8;
}

.sharedWithOptionPanel .sharedWithStatusBar a,.dropdownPanel .sharedWithStatusBar a {
background:transparent url(/img/chatterfiles/chatterfiles16_sprite.png) no-repeat;
padding-top:5px;
padding-bottom:5px;
display:block;
color:#222;
text-decoration:none;
}

.sharedWithOptionPanel .sharedWithStatusBar a {
padding-left:26px;
}

#contentPublisherSlideDown div.sharedWithOptionPanel a {
text-decoration:none;
color:#222;
}

#chatterFilesTabPageUploadDialog.show {
opacity:1;
-moz-opacity:1;
filter:alpha(opacity=100);
position:fixed;
}

#chatterFilesTabPageUploadDialog.invisible {
opacity:0;
-moz-opacity:0;
filter:alpha(opacity=0);
top:-1000px;
position:absolute;
}

#chatterFilesTabPageUploadDialog table.postInput {
margin:0 27px;
}

#chatterFilesTabPageUploadDialog .fileFormInputElement {
width:310px;
}

#chatterFileNewLabel_upload {
margin:0 19px 3px;
}

.chatterFilesTabPageUploadPanel .uploadFileMsgPanel {
margin:10px 0 15px 50px;
}

.chatterFilesTabPageUploadPanel .uploadFileMsg {
margin-left:18px;
width:90%;
}

.chatterFilesTabPageUploadPanel .uploadNewVersionMsg {
background-position:0 -200px;
padding-left:23px;
width:90%;
height:22px;
}

.sharedWithOptionPanel .sharedWithStatusBar {
border:1px solid #c7c7c7;
background-color:#fafafa;
margin:6px 0;
}

.sharedWithOptionPanel .sharedWithStatusBar a.lockItemIcon {
background-position:5px -304px;
}

.sharedWithLinkBar .shareFileWithItemIcon {
background:transparent url(/img/chatterfiles/chatterfiles16_sprite.png) no-repeat;
background-position:0 -56px;
height:16px;
width:16px;
maring-bottom:-4px;
vertical-align:top;
}

#sideBarShareWithOption {
padding-top:5px;
padding-bottom:5px;
}

#sideBarShareWithOption .contentActionMenuItem {
margin-left:5px;
margin-right:5px;
height:23px;
}

.publicLinkValueDiv .publicLinkInfoMessage {
position:relative;
margin-left:0;
margin-right:0;
margin-bottom:15px;
}

.publicLinkValueDiv .publicLinkValueInput {
background:none repeat scroll 0 0 #fff;
width:485px;
margin-top:10px;
margin-bottom:10px;
border:#959595 1px solid;
-moz-box-shadow:0 1px 1px #d9d9d9 inset;
padding:4px 4px 4px 3px;
}

.filePublicLinkButton {
margin-top:16px;
margin-bottom:10px;
}

.filePublicLinkButton .btn {
min-width:48px;
width:48px;
}

.docViewerPanel {
z-index:100;
width:100%;
height:100%;
display:block;
top:0;
left:0;
background:none repeat scroll 0 0 rgba(0,0,0,.5);
overflow-x:auto;
overflow-y:auto;
position:fixed;
}

.bodyForDocViewerPanel {
overflow-x:hidden;
overflow-y:hidden;
}

.feedPostEntityDetails {
padding-top:6px;
padding-bottom:6px;
}

.feedPostTemplateDetails {
padding-top:2px;
padding-bottom:0;
}

.approvalPostTable .approvalDetailsLabel {
font-size:91%;
font-weight:700;
color:#4a4a56;
padding-left:12px;
}

.approvalPostTable .labelCell {
text-align:right;
vertical-align:top;
}

.approvalPostTable .labelCellTpl {
text-align:right;
vertical-align:top;
width:120px;
}

.approvalPostTable .approvalDetails {
color:#222;
padding-left:0;
}

.approvalPostTable .valueCell {
padding-left:13px;
padding-right:12px;
}

.feedPostEntityDetails .Pending {
font-weight:700;
color:#bfa704;
}

.feedPostEntityDetails .Approved {
font-weight:700;
color:#08a705;
}

.feedPostEntityDetails .Rejected {
color:#da0000;
font-weight:700;
}

.feedPostEntityDetails .Removed,.Reassigned {
color:#8a3bcd;
font-weight:700;
}

.actionBar {
margin-top:4px;
margin-bottom:5px;
}

.actionBar .approved {
border:1px solid #9bebb3;
background-color:#edfff1;
height:23px;
color:#222;
line-height:23px;
display:inline-block;
padding-left:10px;
padding-right:10px;
border-radius:5px;
-moz-border-radius:5px;
-webkit-border-radius:5px;
}

.actionBar .approvedIcon {
color:#000;
background:url(/img/msg_icons/confirm16.gif) left center no-repeat;
margin:0;
padding:12px 0 10px 22px;
}

.actionBar .rejected {
border:1px solid #f2a199;
background-color:#fdedea;
height:23px;
color:#222;
line-height:23px;
display:inline-block;
padding-left:10px;
padding-right:10px;
border-radius:5px;
-moz-border-radius:5px;
-webkit-border-radius:5px;
}

.actionBar .rejectedIcon {
color:#000;
background:url(/img/feeds/rejected16.png) left center no-repeat;
margin:0;
padding:12px 0 10px 22px;
}

.actionBar .info {
border:1px solid #bee6ff;
background-color:#f5fcff;
height:23px;
color:#222;
line-height:23px;
display:inline-block;
padding-left:10px;
padding-right:10px;
border-radius:5px;
-moz-border-radius:5px;
-webkit-border-radius:5px;
}

.actionBar .infoIcon {
color:#000;
background:url(/img/msg_icons/info16.gif) left center no-repeat;
margin:0;
padding:12px 0 10px 22px;
}

.overlayPanel {
width:450px;
height:120px;
background-position:center center;
}

.overlayPanel .messageText {
margin-left:30px;
}

.spinner {
border:none;
background-color:#fff;
background-image:url(/img/dataCategories/spinner.gif);
background-position:center center;
background-repeat:no-repeat;
width:450px;
height:120px;
}

.nextApproverOverlay .nextApproverPrompt {
margin-top:5px;
text-align:center;
}

.nextApproverOverlay .requiredInput {
margin-top:10px;
margin-bottom:10px;
}

.nextApproverOverlay .requiredInput * .errorMsg {
white-space:normal;
position:relative;
}

.nextApproverOverlay .lookupInput {
margin-left:10px;
position:relative;
top:-1px;
}

.nextApproverOverlay .lookupInput input {
width:179px;
height:18px;
}

.nextApproverOverlay .lookupInput a {
position:relative;
top:-1px;
margin-left:3px;
}

.nextApproverOverlay .errorMsg {
text-indent:8px;
margin-top:5px;
text-align:center;
}

.feedPostComment {
width:430px;
height:80px;
}

.bestReplyIndicator {
color:#4fa525;
}

.caseEventBody,.caseCommentEventBody {
display:block;
margin:6px 0 6px 3px;
}

.caseEventRow,.caseCommentEventRow,.bestReplyIndicator {
display:block;
margin-left:28px;
}

.communityAnswerEventRow {
margin-left:44px;
}

.caseChangeStatusEventBody {
display:block;
margin-top:3px;
margin-left:0;
}

.caseEventLabel {
color:#7d7d84;
padding-right:3px;
}

.replyOwnerIcon {
margin-right:10px;
}

.replyOwnerIcon img {
border:1px solid #f07e05;
}

.caseEventWideSeparator {
padding-left:12px;
}

.caseEventAttachments {
display:block;
margin-top:6px;
}

.caseEventAttachment a {
font-weight:700;
margin-bottom:6px;
display:block;
margin-left:22px;
}

.caseEventAction,.caseCommentEventAction {
font-size:.92em;
font-weight:400;
}

.caseCommentEventOriginalPostByLabel {
color:#4a4a56;
}

.caseEventUnavailable {
color:#7b797b;
font-style:italic;
font-weight:400;
font-size:.9em;
}

.caseCommentPostEventIcon img {
height:16px;
width:22px;
background:transparent url(/img/support/caseinteraction/caseIcon_sprite.png) 0 -237px no-repeat;
}

.replyPostEventIcon img {
height:22px;
width:22px;
background:transparent url(/img/chatterservice/icon_sprite_serviceSupport.png) -148px -90px no-repeat;
}

.caseCommentRemoveEventIcon img {
height:16px;
width:22px;
background:transparent url(/img/support/caseinteraction/caseIcon_sprite.png) 0 -301px no-repeat;
}

.emailMessageInboundEventIcon img {
height:16px;
width:22px;
background:transparent url(/img/support/caseinteraction/caseIcon_sprite.png) 0 -252px no-repeat;
}

.emailMessageOutboundEventIcon img {
height:16px;
width:22px;
background:transparent url(/img/support/caseinteraction/caseIcon_sprite.png) 0 -285px no-repeat;
}

.caseAttachArticleEventIcon img {
height:16px;
width:16px;
background:transparent url(/img/knowledge/knowledge16.png) 0 0 no-repeat;
}

.twitterPostEventIcon img {
height:16px;
width:22px;
background:transparent url(/img/support/caseinteraction/caseIcon_sprite.png) 0 -428px no-repeat;
}

.facebookPostEventIcon img {
height:16px;
width:22px;
background:transparent url(/img/support/caseinteraction/caseIcon_sprite.png) 0 -445px no-repeat;
}

.youtubePostEventIcon img {
height:16px;
width:22px;
background:transparent url(/img/support/caseinteraction/caseIcon_sprite.png) 0 -461px no-repeat;
}

.linkedinPostEventIcon img {
height:16px;
width:22px;
background:transparent url(/img/support/caseinteraction/caseIcon_sprite.png) 0 -480px no-repeat;
}

.rypplePostEventIcon img {
height:16px;
width:22px;
background:transparent url(/img/support/caseinteraction/caseIcon_sprite.png) 0 -496px no-repeat;
}

.kloutPostEventIcon img {
height:16px;
width:22px;
background:transparent url(/img/support/caseinteraction/caseIcon_sprite.png) 0 -512px no-repeat;
}

.otherSocialPostEventIcon img {
height:16px;
width:22px;
background:transparent url(/img/support/caseinteraction/caseIcon_sprite.png) 0 -532px no-repeat;
}

.caseEventActionRow {
padding:8px 0 2px;
}

.chatterShowHideFeed {
font-size:.95em;
display:inline;
}

.chatterShowHideFeed .innerLink img {
display:inline-block;
background-image:url(/img/chatter/sprites/sprite_images/chattersupersprite.png?v=182-4);
background-position:0 -229px;
width:16px;
height:16px;
}

.chatterShowHideFeed a {
font-weight:400;
color:#015ba7;
text-decoration:none;
}

.feedToggleGuidedTourContainer {
padding:0 15px 15px;
}

.feedToggleGuidedTourTitle {
font-size:1.15em;
font-weight:700;
}

.feedToggleGuidedTourTitle.new {
color:#c46602;
}

.feedToggleGuidedTourLink {
text-decoration:none;
color:#015ba7;
}

.chatterShowHideFeed span.showFeedLink,.chatterShowHideFeed span.hideFeedLink {
vertical-align:middle;
display:inline-block;
padding:3px;
}

.chatterShowHideFeed span.newFlag {
display:inline-block;
margin-left:6px;
}

.chatterShowHideFeed .linkText {
vertical-align:middle;
margin-left:6px;
}

a.chatterFollowUnfollowAction.unfollow {
background:transparent url(/img/feeds/follow_sprite.png) no-repeat 0 -27px;
}

a.chatterFollowUnfollowAction,img.chatterFollowUnfollowAction {
background:transparent url(/img/feeds/follow12.png) no-repeat 2px 1px;
height:15px;
width:15px;
vertical-align:text-top;
}

a.chatterFollowUnfollowAction div.toolkit-el-mask {
opacity:.50;
width:100%;
height:100%;
background-color:#ccc;
}

a.chatterFollowUnfollowAction,img.chatterFollowUnfollowAction,.groupmembership .nonmember img,.groupmembership .check,.grouprole .check,.grouprequest .acceptedIcon,.grouprequest .declinedIcon {
height:15px;
width:15px;
vertical-align:text-top;
}

a.chatterFollowUnfollowAction,.groupmembership .nonmember img {
background:transparent url(/img/feeds/follow_sprite.png) no-repeat 0 0;
}

.chatter-clear {
display:block;
height:1px;
overflow:hidden;
clear:both;
}

.checkedMenu {
color:#222;
display:inline;
line-height:11px;
position:relative;
}

.checkedMenu a.checkedMenuButton {
cursor:pointer;
background:url(/img/mink_arrow.png) no-repeat right -10px;
display:inline;
color:#015ba7;
font-size:.9em;
white-space:nowrap;
padding:2px 16px 3px 3px;
}

.checkedMenu a.checkedMenuButton:hover {
background-position:right 6px;
text-decoration:underline;
}

.checkedMenu .checkedMenuMenu {
-moz-border-radius:5px;
-webkit-border-radius:5px;
border-radius:5px;
-moz-box-shadow:0 2px 5px #acacac;
-webkit-box-shadow:0 2px 5px #acacac;
box-shadow:0 2px 5px #acacac;
background-color:#fff;
border:1px solid;
display:none;
margin-top:2px;
position:absolute;
left:auto;
right:0;
text-align:left;
z-index:50;
white-space:nowrap;
border-color:#d4dadc;
padding:7px 5px;
}

.checkedMenu .checkedMenuOptionIcon {
float:left;
height:12px;
margin-top:6px;
width:12px;
}

.checkedMenu .checkedMenuChecked {
background:#fff url(/img/mink_arrow.png) no-repeat;
background-position:0 -28px;
}

.checkedMenu a.checkedMenuMenuLink:hover {
-moz-border-radius:11px;
-webkit-border-radius:11px;
border-radius:11px;
}

.checkedMenu .checkedMenuMenu a,.checkedMenu .checkedMenuMenu input.theOption {
color:#015ba7;
display:block;
font-size:.9em;
margin-left:12px;
text-decoration:none;
white-space:nowrap;
word-wrap:normal;
padding:5px 6px;
}

.checkedMenu span.checkedMenuLabel {
cursor:default;
font-size:.9em;
white-space:nowrap;
}

.publisherWrapper {
position:relative;
border-top-left-radius:3px;
border-top-right-radius:3px;
}

.publishercontainer input[type=text] {
border:1px solid #c7ccce;
-moz-border-radius:3px;
border-radius:3px;
background-image:url(/img/chatter/innershadow-normal.png);
background-position:0 0;
width:407px;
height:auto;
background-color:#fff;
background-repeat:repeat-x;
padding:7px;
}

.publishercontainer {
line-height:normal;
padding-top:10px;
max-width:640px;
overflow:visible;
position:relative;
border-bottom:1px solid #e6e6e6;
padding-bottom:15px;
padding-right:10px;
margin-bottom:15px;
min-height:75px;
}

.publishercontainer .customPanel label {
color:#222;
font-weight:700;
height:30px;
line-height:30px;
display:inline-block;
}

.publishercontainer .requiredLegendContainer {
position:absolute;
right:30px;
top:-18px;
}

.publishercontainer .publisherFeedItemTypeChoices a.publisherattach,a.cxcontentcommentaction,span.cxcontentcommentactiontext {
color:#015ba7;
font-weight:700;
text-decoration:none;
padding:1px;
}

.publishercontainer li.publisherFeedItemTypeChoice {
display:inline;
height:14px;
margin-right:13px;
}

.publishercontainer .publisherattach span.pArrow {
position:absolute;
bottom:-9px;
left:50%;
margin-left:-8px;
display:none;
background-image:url(/img/chatter/sprites/sprite_images/chattersupersprite.png?v=182-4);
background-position:0 -187px;
width:13px;
height:9px;
z-index:2;
}

.publishercontainer.chattertextareahaserror .publisherattachTextPost span.pArrow,.publishercontainer.chattertextareahaserror .publisherattachPollPost span.pArrow {
background-image:url(/img/chatter/sprites/sprite_images/chattersupersprite.png?v=182-4);
background-position:0 -161px;
width:13px;
height:9px;
}

.publishercontainer a.publisherattach {
height:16px;
display:inline-block;
position:relative;
}

.publishercontainer a.publisherattach span,a.cxcontentcommentaction span {
margin-left:5px;
line-height:16px;
vertical-align:top;
}

.publishercontainer a.publisherattach img {
background-image:url(/img/chatter/sprites/sprite_images/chattersupersprite.png?v=182-4);
background-position:0 -789px;
width:16px;
height:16px;
position:relative;
top:2px;
left:2px;
}

.publishercontainer a.publisherattachContentPost img.publishericon {
background-image:url(/img/chatter/sprites/sprite_images/chattersupersprite.png?v=182-4);
background-position:0 -669px;
width:16px;
height:16px;
background-repeat:no-repeat;
}

.publishercontainer a.publisherattachLinkPost img.publishericon {
background-image:url(/img/chatter/sprites/sprite_images/chattersupersprite.png?v=182-4);
background-position:0 -689px;
width:16px;
height:16px;
}

.publishercontainer a.publisherattachPollPost img.publishericon {
background-image:url(/img/chatter/sprites/sprite_images/chattersupersprite.png?v=182-4);
background-position:0 -709px;
width:16px;
height:16px;
}

.publishercontainer .publishersharebutton {
float:right;
font-weight:400;
margin:0 0 6px;
padding:3px 10px;
}

.publishercontainer.externalGroup .alignTop .publisherTextAreaInner {
border:1px solid #fe8b20;
border-bottom:1px solid #c7ccce;
}

.publishercontainer.externalGroup .publisherattach .pArrow {
background-image:url(/img/chatter/sprites/sprite_images/chattersupersprite.png?v=182-4);
background-position:0 -122px;
width:13px;
height:9px;
}

.publishercontainer .externalGroupWarning {
text-align:right;
padding-top:10px;
}

.publishercontainer .contentPublisherSlideDown table.postInput {
width:500px;
}

.publishertextarea a.isMention,.cxnewcommenttext a.isMention {
cursor:default;
color:#015ba7;
white-space:nowrap;
text-decoration:none;
font-weight:400;
}

.publisherAC_box {
box-shadow:0 1px 4px 1px #96969c;
-moz-box-shadow:0 1px 4px 1px #96969c;
-webkit-box-shadow:0 1px 4px 1px #96969c;
margin-top:1px;
border-color:#a7b0b4;
border-style:solid;
border-width:1px;
}

.publisherAC_box.publisherAC_boxForOverlay {
position:fixed;
}

.publisherAC_box .publisherAC_help {
color:#cf700b;
font-weight:400;
font-size:100%;
padding-left:6px;
padding-top:3px;
padding-bottom:3px;
}

.publisherAC_box .publisherAC_userRole {
color:#7d7d84;
font-style:normal;
padding-left:8px;
display:inline-block;
}

.publisherAC_box .publisherAC_noMatch {
color:#999;
font-style:italic;
margin-left:3px;
padding:2px 6px;
}

.publisherAC_box .autoCompleteRow {
padding-top:.1em;
padding-left:10px;
}

.publisherAC_box .publisherAC_title {
color:#222;
height:1.8em;
line-height:1.8em;
background-color:#f2f5f7;
font-size:100%;
padding-left:10px;
padding-top:.2em;
padding-bottom:.1em;
}

.publisherAC_box .publisherAC_title_selected {
height:1.8em;
line-height:1.8em;
font-size:100%;
white-space:nowrap;
padding-left:10px;
cursor:pointer;
background-color:#c6e1ff;
border:1px solid #9cf;
padding-top:.2em;
margin:.3em 0 0;
}

.publisherAC_box .publisherAC_clickableTitle {
height:1.8em;
line-height:1.8em;
font-size:100%;
white-space:nowrap;
padding-left:10px;
cursor:pointer;
background-color:#f2f5f7;
margin:0;
}

.publisherAC_box .publisherAC_hr {
margin-top:.3em;
padding-top:.2em;
}

.publisherAC_box .publisherAC_profilePic {
margin-left:10px;
margin-right:8px;
vertical-align:top;
}

.publisherAC_box .publisherAC_expanded {
background:transparent url(/img/feeds/arrow_sprite.png) no-repeat scroll 0 -8px;
border:0;
height:8px;
width:9px;
margin-left:5px;
}

.publishercontainer .publishertextarea {
color:#999;
border:none;
resize:none;
width:100%;
overflow:hidden;
background-color:#fff;
line-height:16px;
-webkit-line-break:after-white-space;
word-wrap:break-word;
outline-style:none;
height:48px;
display:block;
}

.publishercontainer .publisherTextAreaInner {
background-image:url(/img/chatter/innershadow-normal.png);
background-position:0 0;
width:auto;
height:auto;
background-color:#fff;
background-repeat:repeat-x;
position:relative;
border:1px solid #c7ccce;
padding:7px 7px 6px;
}

.publishercontainer .alignTop .publisherTextAreaInner {
border-top-left-radius:3px;
border-top-right-radius:3px;
}

.publishercontainer .customPanel {
border:1px solid #c7ccce;
background-image:url(/img/chatter/innershadow-normal.png);
background-position:0 0;
background-color:#fff;
background-repeat:repeat-x;
width:auto;
height:auto;
}

.publishercontainer.externalGroup .customPanel {
border:1px #da7600 solid;
border-bottom:none;
}

.publishercontainer .customPanel.alignTop {
border-bottom:0;
border-top-left-radius:3px;
border-top-right-radius:3px;
-moz-border-radius:3px 3px 0 0;
}

.publishercontainer .customPanel.alignCenter {
border-top:0;
border-bottom:1px solid #c7ccce;
}

.publishercontainer.chattertextareahaserror .publisherTextAreaInner,.publishercontainer.chattertextareahaserror .publishertextarea {
background:#fce8e8;
}

.publishercontainer.chattertextareahaserror .publisherTextAreaInner {
border:1px solid #c00000!important;
}

.publishercontainer.chattertextareacontainer .chattermessagecontainer {
margin:0;
padding:2px 0;
}

.publishercontainer ul.publisherFeedItemTypeChoices {
margin-bottom:4px;
position:relative;
height:20px;
}

.publishercontainer .bottomBar {
height:30px;
line-height:30px;
background:#f5f6f6;
border:1px solid #c7ccce;
border-top:none;
-moz-border-radius:3px;
border-radius:3px;
border-top-left-radius:0;
border-top-right-radius:0;
padding:9px;
}

.externalGroup.publishercontainer .bottomBar {
border-left:1px solid #fe8b20;
border-right:1px solid #fe8b20;
border-bottom:1px solid #fe8b20;
margin-bottom:0;
}

.publishercontainer .chattermessagecontainer {
border:1px solid #c7ccce;
border-top:none;
background:#f5f6f6;
}

.defaultState .publisherTextAreaInner {
margin-right:76px;
}

.defaultState #publishersharebutton {
position:absolute;
right:0;
top:0;
}

.publishercontainer.defaultState #publishersharebutton:hover,.publishercontainer.defaultState #publishersharebutton:active,.publishercontainer.defaultState #publishersharebutton:focus,.publishercontainer.defaultState #publishersharebutton.onHover {
background-color:#8ab529;
background-image:linear-gradient(top,#8AB5290,#87AC31100%);
border:1px solid #6c8049;
}

.publishercontainer.defaultState #publishersharebutton {
cursor:default;
}

.defaultState.publishercontainer .bottomBar {
background:none;
border:none;
height:0;
padding:0;
}

.defaultState .publishertextarea {
height:16px;
}

.defaultState .TextPost .publisherTextAreaInner {
border-bottom-left-radius:3px;
border-bottom-right-radius:3px;
}

.defaultState.publishercontainer.externalGroup .TextPost .publisherTextAreaInner {
border-bottom:1px solid #fe8b20;
}

.bottomBarLeft .visibilityWidgetParent {
display:inline-block;
padding-left:10px;
}

.zen .publisherTypeOverflow {
display:inline-block;
text-decoration:none;
font-weight:700;
height:15px;
margin-left:0;
border:none;
z-index:auto;
}

.zen .publisherTypeOverflow.zen-select {
top:2px;
position:absolute;
margin-left:3px;
}

.zen .publisherTypeOverflow .zen-trigger {
left:-5px;
padding-left:15px;
height:16px;
position:relative;
min-width:10px;
max-width:300px;
border-radius:2px 2px 0 0;
border-color:#dadada;
border-width:1px;
}

.zen .publisherTypeOverflow.zen-open .zen-trigger {
bottom:10px;
padding-top:9px;
padding-left:14px;
width:auto;
border:solid;
border-bottom:none;
z-index:3;
border-color:#dadada;
border-width:1px;
}

.zen .publisherTypeOverflow .publisherArrowContainer {
width:20px;
float:left;
position:relative;
}

.zen .publisherTypeOverflow .zen-options {
position:relative;
top:-13px;
left:-5px;
padding-top:10px;
padding-bottom:10px;
min-width:10px;
max-width:300px;
width:auto;
overflow:visible;
border-radius:0 0 2px 2px;
border-top:none;
z-index:2;
box-shadow:none;
-moz-box-shadow:none;
-webkit-box-shadow:none;
border-color:#dadada;
}

.zen .publisherTypeOverflow.zen-select .zen-trigger b.zen-selectArrow {
border:0;
float:none;
position:relative;
background-image:url(/img/chatter/sprites/sprite_images/chattersupersprite.png?v=182-4);
background-position:0 -1372px;
width:7px;
height:5px;
background-repeat:no-repeat;
top:0;
margin-left:1px;
}

.zen .publisherTypeOverflow.withArrowAttached span.pArrow {
display:block;
position:absolute;
}

.zen .publisherTypeOverflow.zen-open .zen-options .publisherFeedItemTypeChoice {
width:100%;
padding:7px 15px 7px 10px;
}

.zen .publisherTypeOverflow a,.publisherTypeOverflow span,.publisherTypeOverflow div {
color:#015ba7;
margin:0;
padding:0;
}

.zen .publisherTypeOverflow span.triggerText {
position:relative;
float:left;
min-width:10px;
width:auto;
padding-right:5px;
}

.zen .publisherTypeOverflow span.publisherTypeOverflowSelected {
position:relative;
float:left;
width:auto;
padding-right:5px;
}

.zen .publisherTypeOverflow .zen-options img.publishericon {
position:relative;
top:3px;
text-decoration:none;
float:left;
left:0;
}

.publisherTypeOverflow.zen-select a.publisherattach:hover .publisherattachtext,.publisherTypeOverflow.zen-select a.publisherattach:active .publisherattachtext,.publisherTypeOverflow.zen-select a.publisherattach:link .publisherattachtext,.publisherTypeOverflow.zen-select a.publisherattach:visited .publisherattachtext {
text-decoration:none;
font-weight:400;
color:#222;
}

.contentPublisherSlideDown .panelTitle {
float:left;
padding:5px;
}

.contentPublisherSlideDown .panelHeader {
padding-bottom:29px;
border-bottom:1px solid #d7dbde;
}

.contentPublisherSlideDown .clearContentPanelButtonContainer {
position:absolute;
right:10px;
top:10px;
z-index:20;
}

.contentPublisherSlideDown a.clearContentPanelButton {
background:transparent url(/img/alohaSkin/closeX.png);
width:20px;
height:20px;
display:block;
text-decoration:none;
}

.contentPublisherSlideDown a.clearContentPanelButton:hover {
background-position:left -20px;
text-decoration:none;
}

.contentPublisherSlideDown .contentPublisherTitle {
margin-left:7px;
font-weight:700;
text-decoration:none;
color:#000;
line-height:18px;
font-size:1.1em;
}

.contentPublisherSlideDown .contentPublisherTitleImage {
background:transparent url(/img/feeds/publisher_icon16.png) no-repeat scroll left top;
height:16px;
width:16px;
}

.contentPublisherSlideDown .contentPublisherTitleImageFile {
background-position:0 -16px;
float:left;
}

.contentPublisherSlideDown table.postInput {
margin-left:10px;
width:300px;
}

.contentPublisherSlideDown table.postInput td {
padding-bottom:10px;
text-align:right;
}

.contentPublisherSlideDown table.postInput th {
text-align:left;
vertical-align:top;
padding:0 7px 0 0;
}

.contentPublisherSlideDown table.postInput label,.contentPublisherSlideDown div.sharedWithOptionPanel label {
color:#4a4a56;
font-weight:700;
height:30px;
line-height:30px;
display:inline-block;
white-space:nowrap;
}

.contentPublisherSlideDown div.sharedWithOptionPanel {
padding:5px 24px 10px;
}

.fileFormInputElement {
width:400px;
}

.contentPublisherSlideDown .requiredLegendContainer {
display:none;
height:18px;
font-size:.9em;
margin-top:5px;
margin-right:10px;
}

.contentPublisherSlideDown table.postInput textarea {
overflow:auto;
}

.contentPublisherSlideDown .slideDownError {
padding:0 17px;
}

.contentPublisherSlideDown .slideDownError * {
color:#f10;
}

.contentPublisherSlideDown .requiredInput {
height:100%;
position:relative;
}

.contentPublisherSlideDown .chatterPublisherActionsContainer {
width:100%;
margin:auto;
padding:0;
}

.contentPublisherSlideDown .chatterPublisherActionsContainer td {
width:50%;
text-align:center;
text-decoration:none;
white-space:normal;
}

.contentPublisherSlideDown td a {
margin-left:5px;
margin-right:10px;
text-decoration:none;
color:#015ba7;
display:block;
border-radius:5px;
-moz-border-radius:5px;
border:1px solid #c7ccce;
padding:15px 0;
}

.contentPublisherSlideDown td.chatterPublisherFileActionContainerLeft a {
margin-right:5px;
margin-left:10px;
}

.contentPublisherSlideDown td a:hover,.contentPublisherSlideDown td a.ahover {
background:#ebf4f7;
text-decoration:underline;
}

.contentPublisherSlideDown .sharedWithStatusBar .thumbnailLabel {
margin-left:8px;
vertical-align:bottom;
}

.contentPublisherSlideDown .sharedWithStatusBar {
background:transparent url(/img/chatter/tablesGradient.png) repeat-x scroll 0 0;
margin-left:3px;
border-radius:5px;
-moz-border-radius:5px;
-webkit-border-radius:5px;
}

.contentPublisherSlideDown .sharedWithStatusBar a.lockItemIcon:hover {
background-color:#e3f3ff;
padding-left:25px;
margin-left:1px;
margin-right:1px;
background-position:4px -304px;
}

.contentPublisherSlideDown .shareOptionRadio {
margin-top:0;
vertical-align:top;
}

.contentPublisherSlideDown .sharedWithStatusBarFirstRow .thumbnailLabel,.contentPublisherSlideDown .sharedWithStatusBarSecondRow .thumbnailLabel {
margin-left:48px;
margin-top:-18px;
}

.contentPublisherSlideDown .sharedWithStatusBar .infoIcon {
vertical-align:text-bottom;
margin-left:4px;
}

.publishercontainer .errorMsg {
padding-top:5px;
padding-left:14px;
text-align:left;
}

#chatterFileRow td,#chatterFileRow_upload td {
text-align:left;
}

.feedcontainer {
padding-bottom:5px;
line-height:15px;
max-width:560px;
overflow:visible;
}

.feedcontainer a {
color:#015ba7;
font-weight:400;
text-decoration:none;
}

.feedcontainer .contentActionMenuItem a {
color:#000;
width:100%;
}

.feedcontainer .feeditem .preamblecontainer,.feeditemcommentbody .feedcommentuser {
padding-bottom:4px;
}

.feedcontainer .morechatterlink {
display:block;
margin-top:15px;
margin-bottom:15px;
}

.feedcontainer ul.expandedchanges {
list-style-type:disc;
padding-left:40px;
margin:12px 0;
}

.feedcontainer h3 {
color:#666;
display:block;
font-size:1.1em;
margin:0 0 8px;
}

.feedcontainer h3.feedtitle {
font-size:1em;
color:#222;
font-weight:700;
margin-bottom:15px;
line-height:11px;
}

.feedtitle .alignright {
padding-top:2px;
float:right;
}

.feedcontainer .feedtitle .thisupdatespanarrow {
display:inline-block;
height:18px;
width:6px;
margin-right:6px;
margin-left:6px;
}

.feedcontainer .feedtitle .thisupdatespanarrowimage_ltr {
background:url(/img/chatter/divider.png) center no-repeat;
position:relative;
top:-2px;
}

.feedcontainer .feedtitle .thisupdatespanarrowimage_rtl {
background:url(/img/chatter/divider_rtl.png) center no-repeat;
}

.feedcontainer .feedtitle .allCompanyFilterHelpIcon {
position:relative;
display:inline;
vertical-align:middle;
margin-right:6px;
margin-left:6px;
}

.feedcontainer .feeditem {
min-height:47px;
white-space:normal;
word-wrap:break-word;
border-top:1px solid #fff;
border-bottom:1px solid #e6e6e6;
margin:0 10px 8px 0;
padding:0 4px 8px 0;
}

.feedcontainer .checkedMenu a.checkedMenuButton {
background-image:url(/img/feeds/menuArrows.png);
padding:0 16px 0 3px;
}

.feedSortMenuContainer {
margin-bottom:15px;
margin-right:15px;
}

.feedcontainer .dropDownFilters .zen-select {
color:#222;
line-height:11px;
}

.feedcontainer .dropDownFilters .zen-options,.feedcontainer .feedSortMenuContainer .zen-options {
-moz-border-radius:5px;
-webkit-border-radius:5px;
border-radius:5px;
-moz-box-shadow:0 2px 5px #acacac;
-webkit-box-shadow:0 2px 5px #acacac;
box-shadow:0 2px 5px #acacac;
background-color:#fff;
border:1px solid;
margin-top:2px;
z-index:50;
white-space:nowrap;
border-color:#d4dadc;
padding:7px 5px;
}

.feedcontainer .dropDownFilters .zen-options,.feedcontainer .feedSortMenuContainer .zen-options,.feedcontainer .feedSortMenuContainer .zen-select {
left:0;
right:auto;
}

.feedcontainer .dropDownFilters .zen-options a,.feedcontainer .feedSortMenuContainer .zen-options a {
color:#015ba7;
font-size:.9em;
margin-left:3px;
margin-right:3px;
text-decoration:none;
white-space:nowrap;
word-wrap:normal;
padding:5px 6px;
}

.feedcontainer .dropDownFilters .zen-select,.feedcontainer .feedSortMenu .zen-select {
display:inline;
border:none;
z-index:60;
margin:0 3px;
}

.feedcontainer .dropDownFilters .zen-trigger .zen-selectArrow,.feedcontainer .feedSortMenuContainer .zen-trigger .zen-selectArrow {
border:0;
float:none;
position:absolute;
background-image:url(/img/chatter/sprites/sprite_images/chattersupersprite.png?v=182-4);
background-position:0 -1372px;
width:7px;
height:5px;
background-repeat:no-repeat;
right:-13px;
top:0;
}

.feedcontainer .feedSortMenuContainer .feedSortText {
font-size:.9em;
white-space:nowrap;
}

.feedcontainer .feedSortMenuContainer .zen-trigger {
color:#015ba7;
cursor:pointer;
font-size:.9em;
white-space:nowrap;
}

.linkPostLinkContainer a.linkPostLink img,.richPost .thumbnail.default img {
background-image:url(/img/chatter/sprites/sprite_images/chattersupersprite.png?v=182-4);
background-position:0 -729px;
width:16px;
height:16px;
top:-2px;
}

a.cxcontentcommentaction img {
top:1px;
left:3px;
background-image:url(/img/chatter/sprites/sprite_images/chattersupersprite.png?v=182-4);
background-position:0 -669px;
width:16px;
height:16px;
}

.linkDirections {
clear:both;
margin-top:10px;
}

.rechatItemRow,.rechatResponseMessageContainer {
margin-top:10px;
}

.rechatSelector .rechatTargetSelector {
margin-top:11px;
border:1px solid #dedede;
border-radius:5px;
-moz-border-radius:5px;
font-size:1em;
}

.rechatSelector .selectorLabel {
padding-left:5px;
font-size:1em;
}

.composeRechatButtons {
width:200px;
text-align:center;
margin:10px auto 0;
}

.rechatOkDialogButtonCls,.rechatClose {
width:50px;
text-align:center;
}

.rechatResponseMessageContainer .rechatResponseMessage {
padding:10px;
}

.rechatResponseMessageContainer .success {
border:1px solid #9bebb3;
background:#edfff1;
}

.rechatResponseMessageContainer .failed {
border:1px solid #f2a199;
background:#fdedea;
}

a.rechatSuccessLink {
word-wrap:break-word;
text-decoration:underline;
}

.rechatMainContainer .hr {
border-bottom:1px solid #dedede;
}

.rechatLinkTargetContainer {
float:right;
margin-bottom:15px;
display:block;
height:15px;
}

input.rechatUrlCls {
width:100%;
border:none;
height:23px;
padding:0;
}

.urlBox {
margin-top:10px;
border:1px solid #959595;
height:23px;
padding:4px;
}

.rechatCompanyIcon {
background-image:url(/img/chatter/sprites/sprite_images/chattersupersprite.png?v=182-4);
background-position:0 -249px;
width:16px;
height:16px;
margin-right:5px;
vertical-align:middle;
display:inline-block;
}

.rechatSecureLinkContainer {
margin-top:12px;
font-style:italic;
font-size:.9em;
border:1px solid #f8e38e;
background:#ffffdc;
padding:5px;
}

.rechatWithGroup {
border-left:1px solid #dedede;
border-right:1px solid #dedede;
vertical-align:middle;
height:48px;
position:absolute;
left:135px;
width:150px;
}

.rechatRecipientSelector a.remove {
background:transparent url(/img/feeds/follow_sprite.png) no-repeat 0 -54px;
height:15px;
width:15px;
float:right;
}

.rechatRecipientListCls {
line-height:22px;
overflow:hidden;
}

.rechatRecipientSelector .composeInput {
cursor:text;
border:none;
-moz-box-shadow:none;
}

input.rechatRecipientInput {
width:138px;
height:31px;
border:1px solid #dedede;
line-height:31px;
margin:8px 2px 2px;
}

input.rechatRecipientInput.focus {
width:142px;
}

.rechatSelector {
position:absolute;
top:6px;
left:0;
padding-right:5px;
height:37px;
}

.rechatSelectionBox {
position:relative;
height:48px;
background:#f5f6f6;
border:1px solid #c7ccce;
border-top:0;
border-bottom-left-radius:5px;
border-bottom-right-radius:5px;
-moz-border-radius:0 0 5px 5px;
margin:0;
}

.rechatMainContainer .recipientSelectionContainer {
position:relative;
font-size:1em;
padding-left:5px;
margin-top:6px;
}

.rechatMainContainer .recipientSelectionContainer .groupicon {
position:absolute;
float:left;
width:20px;
}

.rechatMainContainer .rechatWithGroup .recipientSelectionContainer div.groupinfo {
position:absolute;
top:10px;
left:26px;
padding-left:5px;
width:95px;
overflow:hidden;
white-space:nowrap;
height:20px;
line-height:20px;
}

.recipientSelectionContainer .removegroup {
position:absolute;
top:12px;
right:5px;
}

.selectionBlock .shareButton {
position:absolute;
top:9px;
right:9px;
}

.chattertextareacontainer .rechattextareacontainer {
margin-top:30px;
position:relative;
}

.rechatMainContainer .rechatPreview {
position:relative;
z-index:1;
overflow:hidden;
border-bottom:0;
margin-left:19px;
margin-right:19px;
}

.rechatMainContainer .rechatPreviewMaskElement {
background-image:url(/img/tree/empty.gif);
position:absolute;
height:100%;
width:100%;
z-index:2;
top:0;
left:0;
}

.rechatMainContainer.feedcontainer .feeditem {
border:0;
}

.accessibleInlineMenuItems a {
margin-right:5px;
}

.rechatMainContainer .feeditemextras .feeditemcomment {
border:none;
margin:0;
}

.rechatMainContainer .feeditemcomment .newcommenttextwrapper textarea,.rechatMainContainer .feeditemcommentplaceholder input {
border:none;
background:#fff;
padding:0;
}

.rechatMainContainer .feeditemcomment .newcommenttextwrapper,.rechatMainContainer .feeditemextras .feeditemcommentplaceholder {
border:1px solid #c7ccce;
border-top-left-radius:5px;
border-top-right-radius:5px;
-moz-border-radius:5px 5px 0 0;
background:#fff;
}

.rechatMainContainer .feeditemcomment .newcommenttextwrapper {
padding:11px 7px 13px;
}

.rechatMainContainer .feeditemcommentplaceholder input {
height:20px;
width:480px;
}

.rechatMainContainer .rArrow {
position:absolute;
margin-top:-12px;
left:40px;
width:22px;
height:14px;
background-image:url(/static/178/img/chatter/chatter-sprites.png);
background-position:-48px 0;
}

.rechatMainContainer .chattertextareahaserror .selectionBlock .rArrow {
background-position:-136px 0;
}

.rechatMainContainer .chattertextareacontainer .chattermessagecontainer {
border-left:1px solid #c7ccce;
border-right:1px solid #c7ccce;
border-bottom:1px solid #c7ccce;
background-color:#f5f6f6;
padding-top:2px;
padding-bottom:2px;
margin:0;
}

.followersAndGroupContainer .customerGroupMessage {
color:#da7600;
position:absolute;
margin-top:-20px;
right:10px;
height:14px;
}

.rechatMainContainer .customerGroup .feeditemcomment .newcommenttextwrapper,.rechatMainContainer .customerGroup .feeditemextras .feeditemcommentplaceholder {
border:1px solid #da7600;
}

.rechatMainContainer .customerGroup .feeditemcomment .newcommenttextwrapper,.rechatMainContainer .customerGroup .feeditemcomment .newcommenttextwrapper textarea,.rechatMainContainer .customerGroup .feeditemextras .feeditemcommentplaceholder,.rechatMainContainer .customerGroup .feeditemextras .feeditemcommentplaceholder input {
background-color:#fff6e8;
}

.rechatMainContainer .selectionBlock.customerGroup .rArrow {
background-position:-114px 0;
}

.rechatMainContainer .chattertextareahaserror .selectionBlock.customerGroup .rArrow {
background-position:-158px 0;
}

.postTo {
display:inline-block;
vertical-align:top;
line-height:30px;
}

.postTo .postToText {
display:inline-block;
vertical-align:top;
margin-right:3px;
}

.postTo .postToTextTarget {
font-weight:700;
max-width:360px;
overflow-x:hidden;
white-space:nowrap;
display:inline-block;
vertical-align:top;
position:relative;
}

.postTo .postToTextTarget .nameFadeOut {
left:340px;
top:4px;
background-image:url(/img/chatter/sprites/sprite_images/chattersupersprite.png?v=182-4);
background-position:0 -971px;
width:20px;
height:22px;
}

.postTo .postToDropdown {
display:inline-block;
vertical-align:top;
margin-left:2px;
}

.postTo .postToDropdown.postToGroupDropdown {
max-width:150px;
}

.postTo .postToDropdown.internalExternalDropdown {
max-width:300px;
}

.postTo .grouprecipient .removeGroup {
right:10px;
}

.postTo .groupSelection .groupIconContainer {
left:10px;
top:4px;
}

.postTo .groupSection .groupInfo {
padding-left:32px;
}

.zen .postToDropdown .zen-select {
display:inline-block;
width:100%;
border:0;
z-index:1;
margin:0;
}

.zen .postToDropdown .zen-select .zen-options {
width:auto;
top:-1px;
left:-10px;
right:inherit;
border:1px solid #c7ccce;
border-bottom:0;
}

.zen .postToDropdown .zen-select .zen-options a {
color:#015ba7;
border-bottom:1px solid #c7ccce;
white-space:nowrap;
padding:0 9px;
}

.zen .postToDropdown .zen-select .zen-selectArrow {
border:0;
float:none;
position:absolute;
background-image:url(/img/chatter/sprites/sprite_images/chattersupersprite.png?v=182-4);
background-position:0 -1363px;
width:7px;
height:5px;
background-repeat:no-repeat;
top:8px;
right:0;
}

.zen .postToDropdown .zen-select .zen-trigger {
color:#015ba7;
text-decoration:none;
margin-right:13px;
white-space:nowrap;
overflow-x:hidden;
}

.groupSelection {
position:relative;
height:30px;
display:none;
padding-left:8px;
}

.groupSelection input.groupSelectionInput,.groupSelection .groupRecipient {
font-size:1em;
background-image:url(/img/chatter/innershadow-normal.png);
background-position:0 0;
background-repeat:repeat-x;
background-color:#fff;
height:22px;
width:203px;
-moz-border-radius:3px;
border-radius:3px;
line-height:22px;
margin:0;
padding:3px;
}

.groupSelection input.groupSelectionInput {
color:#999;
display:inline-block;
}

.groupSelection .groupRecipient {
display:none;
position:relative;
}

.groupSelection .groupIconContainer {
position:absolute;
top:5px;
left:7px;
}

.groupIconContainer .groupPrivateIcon {
background-image:url(/img/chatter/sprites/sprite_images/chattersupersprite.png?v=182-4);
background-position:0 -58px;
width:12px;
height:12px;
background-repeat:no-repeat;
position:absolute;
top:7px;
left:8px;
border-bottom:1px solid #d4dadc;
border-right:1px solid #d4dadc;
display:none;
background-color:#FFF;
}

.groupSelection .groupInfo {
padding-left:35px;
overflow:hidden;
white-space:nowrap;
line-height:22px;
width:145px;
display:inline-block;
}

.groupSelection a.removeGroup {
background:transparent url(/img/feeds/follow_sprite.png) no-repeat 0 -54px;
height:15px;
width:15px;
position:absolute;
top:7px;
right:8px;
}

.groupSelection .groupSelectionInput,.groupSelection .groupRecipient,.groupSelection .autoCompleteBox,.groupSelection .autoCompleteBoxScrolling {
border:1px solid #c7ccce;
}

.groupSelection .nameFadeOut {
background-image:url(/img/chatter/sprites/sprite_images/chattersupersprite.png?v=182-4);
background-position:0 -997px;
width:20px;
height:22px;
right:25px;
top:4px;
}

.influence-widget {
font-size:1em;
color:#7d7d84;
margin:6px 0 0;
}

.hoverInfo .influence-widget {
margin:8px 0 0;
}

.influence-bar,.influence-header {
width:99%;
overflow:hidden;
}

.influence-bar {
height:12px;
border:1px solid #c7ccce;
background:#f8f8f8;
-moz-border-radius:3px;
-webkit-border-radius:3px;
margin-top:3px;
}

.influence-widget .section {
height:12px;
border:none;
float:left;
}

.influence-widget .observer {
width:25%;
}

.influence-widget .active {
width:55%;
}

.influence-widget .top {
width:20%;
float:right;
margin-left:-3px;
}

.influence-bar .observer.highlight {
background:url(/img/chatter/influenceGradient.png) 0 0;
}

.influence-bar .active.highlight {
background:url(/img/chatter/influenceGradient.png) 0 24px;
}

.influence-bar .top.highlight {
background:url(/img/chatter/influenceGradient.png) 0 12px;
}

.influence-bar .marker {
background:url(/img/chatter/youdot.png) no-repeat 0 0;
width:12px;
height:12px;
position:relative;
left:50%;
margin-left:-6px;
}

.influence-header {
margin:0 0 3px;
}

.topicOfInfluence {
color:#7d7d84;
margin-left:0;
}

.topicUl {
list-style-type:none;
}

.pollchoicebargraphcontainer {
height:10px;
display:inline-block;
}

.pollchoicebargraph {
background-color:#bee6ff;
height:10px;
display:block;
}

ul.pollchoices {
list-style-type:none;
margin:10px 0;
padding:0;
}

ul.pollchoices li {
margin-top:6px;
margin-left:5px;
}

.pollviewfooter {
border:1px;
vertical-align:middle;
margin-bottom:15px;
}

.publisherpolladdchoice {
margin-left:10px;
margin-bottom:16px;
}

.publisherpollchoices label.publisherpollchoicelabel {
margin-right:8px;
color:#4a4a56;
}

.publisherpollchoiceinput {
display:inline-block;
width:410px;
}

label.publisherpollchoicelabel {
width:58px;
}

.visibilityicon {
text-decoration:none;
cursor:pointer;
position:absolute;
top:50%;
margin-top:-7px;
background-image:url(/img/chatter/sprites/sprite_images/chattersupersprite.png?v=182-4);
background-position:0 -829px;
width:16px;
height:16px;
}

a.iconParent.disable:hover .visibilityicon {
background-image:url(/img/chatter/sprites/sprite_images/chattersupersprite.png?v=182-4);
background-position:0 -829px;
width:16px;
height:16px;
cursor:default;
}

a.iconParent:hover .visibilityicon {
background-image:url(/img/chatter/sprites/sprite_images/chattersupersprite.png?v=182-4);
background-position:0 -809px;
width:16px;
height:16px;
}

.visibilityWidgetParent {
position:relative;
margin:0;
padding:0;
}

.visibilityWidgetParent .iconParent {
display:block;
height:30px;
width:16px;
position:relative;
}

.visibilityWidgetParent div.visibilityHelpContainer {
width:300px;
position:absolute;
right:-150px;
top:18px;
z-index:1000;
}

.visibilityHelpContainer div.visibilityHelpBody {
padding:0 15px;
}

.visibilityFooter {
border-top:1px solid #e9eaeb;
padding-bottom:0;
padding-right:0;
padding-left:15px;
background-color:#f5f6f6;
margin-top:15px;
}

.visibilityHelpContainer .visibilityHelpBody .visibilityMessage {
line-height:18px;
white-space:normal;
}

.visibilitylearnmorelink {
color:#015ba7;
padding-top:10px;
padding-bottom:10px;
text-decoration:none;
}

.visibilityHelpBody .visibilityMessage .visibilityMessageTitle {
font-size:100%;
margin:0;
}

.publishercontainer a.publisherattachRypplePost img.publishericon {
background-position:0 -729px;
}

.badgeNameText {
font-size:1em;
font-weight:700;
color:#105ba7;
line-height:15px;
}

.oauthMessage {
margin-top:8px;
margin-bottom:20px;
}

.ryppleFeedItemContainer {
float:left;
padding-right:10px;
padding-top:5px;
}

.thanksThumbnail {
height:65px;
width:65px;
}

.thanksFeed {
float:clear;
min-height:75px;
}

#thanksRecipientContainer {
cursor:text;
padding:2px;
}

#thanksRecipient {
overflow:hidden;
line-height:22px;
}

#thanksRecipient .item {
overflow:hidden;
line-height:16px;
text-decoration:none;
white-space:nowrap;
border:1px solid #d4dadc;
background:#eff7fa;
color:#222;
-moz-border-radius:4px;
-webkit-border-radius:4px;
border-radius:4px;
padding:0 5px;
}

#thanksRecipient .guestItem {
background:#fff6e8;
color:#f07e05;
}

#thanksRecipient .invalid {
background-color:#ffedef;
border-color:#ff6678;
}

#thanksRecipient span {
float:left;
padding:2px 0;
}

.rypple-thanksRecipientRemove {
float:right;
margin-top:6px;
margin-right:2px;
margin-left:5px;
height:8px;
}

.rypple-thanksRecipientRemove a.remove,.rypple-thanksRecipientRemove a.remove img {
display:block;
width:8px;
height:8px;
}

.rypple-thanksRecipientRemove a.remove img {
background:transparent url(/img/chatter/message_item_x.png) no-repeat scroll left top;
}

.rypple-thanksRecipientRemove a.remove:hover img {
background-position:0 50%;
}

#thanksRecipient input {
border:0;
height:21px;
background-image:none;
margin:0;
padding:0;
}

#thanksRecipient input:focus {
border:0;
outline:none;
}

.publisherBadge {
width:75px;
height:75px;
display:block;
cursor:pointer;
margin:0 auto;
}

.changeBadge {
margin-top:4px;
text-align:center;
}

.changeBadge a,.changeBadge a:hover,.changeBadge a:active,.listitem .ryppleBadgeInner a,.listitem .ryppleBadgeInner a:hover,.listitem .ryppleBadgeInner a:active {
color:#015ba7;
font-family:Arial;
font-weight:400;
}

.publishercontainer #showingrypplethanks {
max-width:none;
min-height:0;
margin:0;
padding:0;
}

.thanksContainer {
margin-top:0;
width:100%;
position:relative;
border-bottom:1px solid #c7ccce;
border-top:1px solid #c7ccce;
padding:0;
}

.thanksContainer .publisherTextAreaPlaceholder {
float:left;
width:78%;
}

.thanksContainer .publisherTextAreaContainer .publisherTextAreaInner {
border:0;
border-radius:0;
background:none;
min-height:108px;
}

.chattertextareahaserror .thanksContainer .publisherTextAreaInner {
background-color:#fce8e8;
border:0!important;
}

.thanksContainer #publishereditablearea {
border:0;
background-image:none;
width:100%;
}

.thanksContainer .chattermessagecontainer {
border:0;
border-top:1px solid #c7ccce;
}

.badgeContainer {
position:relative;
width:22%;
height:95px;
float:left;
background-color:#FFF;
text-align:center;
padding:9px 0 6px;
}

.changeBadgeAnchor {
background-color:transparent;
border-bottom-left-radius:0;
border-bottom-right-radius:0;
border-collapse:separate;
border-top-left-radius:0;
border-top-right-radius:0;
color:#2d6a91;
cursor:pointer;
display:block;
float:left;
font-size:.917em;
font-weight:700;
height:13px;
line-height:normal;
min-height:0;
outline-color:#2d6a91;
outline-style:none;
outline-width:0;
text-align:center;
text-decoration:none;
white-space:normal;
width:95px;
border-color:#2d6a91;
margin:0;
padding:0;
}

.allowdeny {
background-image:url(images/bg-rypple.png);
background-repeat:repeat-x;
background-color:#005688;
margin:0 auto;
}

.rypplecenter {
width:980px;
margin:0 auto;
}

.rypplemain {
margin-top:10px;
height:auto;
background:#fff;
}

.rypplemain-content {
margin-left:35px;
padding:20px 80px 30px;
}

.main-messaging {
margin-left:90px;
margin-top:5px;
}

.subhead {
font-size:1.25em;
font-weight:700;
padding-bottom:10px;
}

.welcome-buttons {
padding-top:5px;
margin:8px 0;
}

a.selectBadge {
color:#015ba7;
text-transform:none;
text-decoration:none;
font-size:1em;
}

.badgeSelectionDescription {
display:block;
padding-top:3px;
}

.badgeSmallImage {
width:75px;
height:75px;
border:1px;
cursor:pointer;
}

.badgeLargeImage {
width:128px;
height:128px;
border:1px;
}

.container {
width:470px;
background:linear-gradient(top,#f5f5f50,#fdfdfd5%,#ffffff100%);
}

.container1 {
width:470px;
height:280px;
background:linear-gradient(top,#f5f5f50,#fdfdfd5%,#ffffff100%);
overflow:scroll;
}

.listitem {
text-align:center;
font-size:1.167em;
float:left;
clear:both;
width:460px;
height:80px;
padding:0;
}

.listitem-img {
margin-bottom:4px;
display:block;
padding:20px 20px 0;
}

.listitem a {
color:#666;
text-decoration:none;
}

.listitem a:hover {
color:#1679c9;
text-decoration:none;
}

.badgeLeft {
width:130px;
float:left;
padding-right:20px;
padding-left:20px;
padding-top:20px;
}

.rightBadge {
margin-top:32px;
float:left;
width:300px;
}

.badgeSection {
margin-bottom:20px;
}

.sectionHead {
font-size:1em;
text-transform:uppercase;
color:#999;
font-weight:700;
}

.badgeTitle {
font-size:1.5em;
color:#666;
font-weight:700;
font-family:Arial;
}

.paraText {
font-size:1.083em;
color:#333;
}

.skillspan {
height:20px;
margin-top:8px;
}

.skillPink {
font-size:.917em;
color:#4a4a4a;
margin:0 5px;
padding:5px 10px;
}

.badgeButtonsContainer .zen-btn {
font-family:Arial;
font-size:1.08em;
height:30px;
border-radius:10px; -webkit-border-radius:10px; -moz-border-radius:10px;
-webkit-box-shadow:0 1px 2px 0 #adadad;
-moz-box-shadow:0 1px 2px 0 #adadad;
box-shadow:0 1px 2px 0 #adadad;
margin-right:20px;
padding:0 10px 1px;
}

.ryppleBadgeList {
height:100%;
margin-left:9px;
margin-bottom:20px;
font-size:1em;
}

.ryppleBadgeContent {
height:250px;
overflow:auto;
}

.ryppleBadgeDetail {
height:50px;
}

.ryppleBadgeInner {
text-align:center;
float:left;
display:block;
overflow:hidden;
}

.overlayDialog .bottomLeft {
background:url(/img/alohaSkin/overlayBtmLft.png) no-repeat scroll left bottom transparent;
height:4px;
}

.overlayDialog .bottomRight {
background:url(/img/alohaSkin/overlay_crns.png) no-repeat scroll right -235px transparent;
height:4px;
padding-left:0;
padding-right:6px;
}

.publishercontainer a.publisherattachActivityEvent img.publishericon {
background-image:url(/img/chatter/sprites/sprite_images/chattersupersprite.png?v=182-4);
background-position:0 -769px;
width:16px;
height:16px;
}

div#taskCreatePanel {
padding-left:10px;
padding-right:10px;
padding-bottom:10px;
-moz-border-radius:3px 3px 0 0;
border-top-left-radius:3px;
border-top-right-radius:3px;
}

input#taskCreatePanel_due {
width:237px;
}

div#taskCreatePanel_due_date_wrapper {
width:237px;
position:relative;
}

a#taskCreatePanel_due_date_icon {
background-image:url(/img/chatter/sprites/sprite_images/chattersupersprite.png?v=182-4);
background-position:0 -429px;
width:16px;
height:16px;
position:absolute;
right:-7px;
top:29px;
z-index:1;
display:block;
}

input#taskCreatePanel_sub {
width:498px;
}

.publishercontainer .ActivityEvent div.errorMsg {
color:#c00000;
padding-top:6px;
padding-bottom:2px;
padding-left:0;
width:auto;
}

.publishercontainer .customPanel .taskCreateFieldDiv label {
height:auto;
line-height:normal;
padding-top:7px;
padding-bottom:2px;
}

.recommend .recBox {
margin-bottom:22px;
}

.recommend .recBox .recNameAndTitle {
margin-top:0;
margin-right:11px;
}

.recommend .recBox .explanation,.recommend .recBox .recNameAndTitle {
padding-top:0;
padding-right:0;
padding-bottom:0;
}

.recommend .recBoxHeader {
height:1.2em;
padding-bottom:3px;
}

.recommend .blueLink {
float:right;
line-height:1.4em;
font-size:.92em;
white-space:nowrap;
}

.recommend .recBox .recElement {
border-top:1px solid #d4dadc;
background-color:transparent;
overflow:hidden;
outline:none;
clear:left;
padding:4px 0 5px;
}

.recommend .recInfo {
padding-left:10px;
overflow:hidden;
word-wrap:break-word;
float:left;
}

.recommend .recBox .recElement .recInfo {
padding-left:6px;
}

.recommend .recBox img.records {
height:24px;
width:24px;
border:none;
margin:3px 0 0 4px;
}

.recommend img.account {
background:url(/img/sprites/icons24.png) no-repeat 1px -2px;
}

.recommend img.opportunity {
background:url(/img/sprites/icons24.png) no-repeat 1px -422px;
}

.recommend img.lead {
background:url(/img/sprites/icons24.png) no-repeat 1px -336px;
}

.recommend img.contact {
background:url(/img/sprites/icons24.png) no-repeat 1px -142px;
}

.recommend img.article {
background-image:url(/img/knowledge/knowledge24.png);
}

.recommend img.personAccount {
background:url(/img/icon/perAccounts32.png) -3px -2px no-repeat;
}

.recommend .recDismissImage {
background:transparent url(/img/feeds/x_sprite.png) no-repeat;
height:8px;
width:9px;
margin-right:2px;
float:right;
visibility:hidden;
}

.recommend .recDismissLink:focus .recDismissImage,.recommend .recDismissLink .recDismissVisible {
visibility:visible;
}

.recBox .joinWrapper .asktojoin>img {
background-image:url(/img/feeds/follow_sprite.png);
background-position:-1px -148px;
vertical-align:middle;
width:12px;
height:12px;
}

.recommend .recBox .selected .feedfilterheader a {
text-decoration:none;
cursor:default;
color:#333435;
font-weight:700;
}

.recommend .recBox .recDismissImage {
margin-top:2px;
}

.recommend .arrow-img {
width:0;
height:0;
border:5px solid transparent;
}

.recommend .expandedExplanation .blueLink {
float:none;
}

.recommend .mruIcon {
padding-right:0;
margin-left:1px;
vertical-align:middle;
}

.recommend .recExpl ul>li {
white-space:nowrap;
overflow:hidden;
text-overflow:ellipsis;
list-style-type:none;
}

.recommend .explanation-ul {
padding-left:0;
word-wrap:normal;
margin:0;
}

.recommend .explanation-ul>li {
margin-top:3px;
margin-bottom:3px;
}

.recommend .recBox .arrow-img {
margin-right:2px;
}

.recommend .recBox .recExpl {
margin-left:16px;
}

.recommend .recBox .thumb {
height:24px;
width:24px;
margin:2px 2px 0 0;
}

.jitRecs {
background-color:#eff7fa;
border:2px solid #1797c0;
border-radius:5px;
-moz-border-radius:5px;
-webkit-border-radius:5px;
color:#222;
font-size:1em;
line-height:15px;
margin:4px 4px 18px 2px;
padding:8px 6px 5px;
}

.jitRecs-p {
margin-bottom:7px;
margin-top:0;
}

.jitRecs .recBox .recInfo {
margin-left:0;
width:130px;
}

.recommend .recBox .noTopics {
margin-top:6px;
color:#000;
}

.recBox .topicElement .todoList {
padding:16px 14px;
}

.recBox .topicElement .suggestion {
padding-top:2px;
word-wrap:break-word;
}

.recBox .topicElement .suggestions {
padding:10px 0;
}

.topicSpinner {
width:100%;
height:60px;
background:transparent url(/sfc/images/spinner_large.gif) center no-repeat;
}

.todoList {
background:url(/img/chatter/wtdNowGradientbg.png) repeat-x 0 0 scroll;
background-color:#ffe5a7;
}

.todoList p {
padding-top:4px;
margin:0;
}

.todoElement .recImage,.recommend .recBox .todoElement .recImage {
float:right;
height:40px;
width:40px;
border:0;
margin-left:6px;
}

.recommend .recBox .todoElement {
padding:1px 0 2px!important;
}

#todoItem {
padding:16px 14px 10px;
}

.todoElement .dismiss {
font-size:.9em;
margin-top:14px;
}

#todoItem.success img {
background:url(/img/msg_icons/confirm24.png) no-repeat 0 0;
width:25px;
}

.todoList img.user {
background:url(/img/chatter/wtdNowIcon_sprite.png) no-repeat 0 -52px;
}

.todoList img.group {
background:url(/img/chatter/wtdNowIcon_sprite.png) no-repeat 0 -2px;
}

.todoList img.desktop {
background:url(/img/chatter/wtdNowIcon_sprite.png) no-repeat 0 -142px;
}

.todoList img.mobile {
background:url(/img/chatter/wtdNowIcon_sprite.png) no-repeat 0 -192px;
}

.todoList img.photo {
background:url(/img/chatter/wtdNowIcon_sprite.png) no-repeat 0 -242px;
}

.richPost {
position:relative;
margin:10px 0;
}

.richPost h4,.richPost h5 {
font-size:1em;
margin:0;
}

.richPost .thumbnail {
position:relative;
display:block;
}

.richPost .thumbContainer {
float:left;
margin-right:15px;
display:block;
}

.richPost .thumbnail .thumb {
max-width:120px;
max-height:120px;
border:1px solid #b5b5b5;
}

.richPost .thumbnail .play {
width:33px;
position:absolute;
left:5px;
bottom:7px;
}

.richPost .title a {
font-weight:700;
display:block;
}

.richPost .provider a {
color:#7d7d84;
margin-bottom:10px;
}

.richPost .provider .embedlyIcon {
position:relative;
top:-1px;
display:inline-block;
text-indent:-999em;
background-image:url(/img/chatter/sprites/sprite_images/chattersupersprite.png?v=182-4);
background-position:0 -449px;
width:16px;
height:16px;
margin-left:5px;
}

.richPost .content {
display:table-cell;
}

.feedSortInSearch {
padding-top:7px;
}

.feedSearch {
float:right;
padding-left:3px;
border-left:1px dotted #e6e6e6;
margin:5px 5px 0 10px;
}

.feedSearch.feedSearchOpen {
border:1px solid #c7ccce;
border-radius:3px;
box-shadow:0 2px 2px #eee inset;
margin:0 0 0 18px;
padding:2px;
}

.feedSearchForm {
display:none;
-moz-border-radius:3px;
-webkit-border-radius:3px;
border-radius:3px;
padding:2px 2px 2px 6px;
}

a.feedSearchOpenButton {
display:inline-block;
vertical-align:top;
border:none;
background:none;
cursor:pointer;
border-left:1px dotted #e6e6e6;
-moz-border-radius:0;
-webkit-border-radius:0;
border-radius:0;
margin:0;
padding:4px 10px;
}

.feedSearch .feedSearchTerm {
border:none;
outline:none;
display:inline;
padding-left:7px;
vertical-align:top;
width:128px;
font-size:100%;
margin:0;
}

.feedSearchClosedButton {
padding:3px 9px 4px 7px;
}

.feedSearchClear {
display:none;
margin-top:2px;
}

.feedSearchClearIcon {
background-image:url(/img/alohaSkin/search_clear_sprite.png);
background-position:1px 1px;
background-repeat:no-repeat;
display:inline;
height:17px;
padding-right:8px;
vertical-align:middle;
width:17px;
}

.feedSearchIcon {
background-image:url(/img/chatter/searchMagnifyingGlass.png);
background-position:0 -16px;
height:12px;
width:12px;
border:none;
margin:0;
padding:0;
}

.basicTemplateFeedItemAuxBody {
padding-top:5px;
padding-bottom:5px;
float:left;
}

.basicTemplateFeedItemAuxBody .icon {
float:left;
padding-right:5px;
}

.chatterFileDetailActionListPanel img {
background:transparent url(/img/chatterfiles/chatterfiles16_sprite.png) no-repeat;
height:16px;
width:16px;
}

.chatterFileDetailActionListPanel ul {
list-style:none;
padding-top:9px;
padding-bottom:4px;
}

.chatterFileDetailActionListPanel li {
min-height:16px;
margin:4px 0;
}

.chatterFileDetailActionListPanel .actionLabel {
vertical-align:top;
white-space:nowrap;
margin-left:3px;
}

.chatterFileDetailActionListPanel .fileSizeLabel {
vertical-align:top;
color:#7d7d84;
font-size:.9em;
}

.chatterFileDetailActionListPanel .shareFileWithItemIcon {
background-position:0 -56px;
}

.chatterFileDetailActionListPanel .updateVersionItemIcon {
background-position:0 -38px;
}

.chatterHover {
position:relative;
font-weight:400;
line-height:14.4px;
}

.mruList .chatter-hover-highlight {
background-color:#e3f3ff;
-moz-border-radius:5px;
border-radius:5px;
}

.chatterHover.chatterHover-right {
padding-left:11px;
}

.chatterHover.chatterHover-left {
padding-right:11px;
}

.chatterHover.chatterHover-above {
padding-bottom:11px;
}

.chatterHover.chatterHover-below {
padding-top:11px;
}

.chatterHover>.arrow {
background:transparent url(/img/chatter/dialogbox_arrows.png) no-repeat scroll left top;
position:absolute;
width:25px;
height:25px;
}

.chatterHover.chatterHover-above>.arrow {
background-position:-4px -34px;
bottom:0;
left:13px;
}

.chatterHover.chatterHover-below>.arrow {
background-position:0 -243px;
left:13px;
top:0;
}

.chatterHover.chatterHover-right>.arrow {
background-position:-25px -85px;
left:0;
top:0;
}

.chatterHover.chatterHover-left>.arrow {
background-position:11px -2px;
right:0;
top:0;
}

.chatterHover>.wrapper {
border:1px solid #b6b6b6;
background-color:#fff;
-moz-border-radius:5px;
border-radius:5px;
-moz-box-shadow:0 2px 5px #a0acab;
box-shadow:0 2px 5px #a0acab;
position:relative;
overflow:hidden;
min-width:272px;
min-height:35px;
white-space:normal;
margin:0;
padding:14px;
}

.chatterHover.chatterHover-right>.wrapper,.chatterHover.chatterHover-left>.wrapper {
top:-20px;
}

.chatterHover .loadHover {
background:url(/img/loading.gif) no-repeat scroll 0 2px transparent;
height:38px;
padding-top:3px;
text-indent:20px;
}

.chatterHover .hoverInfo {
padding-bottom:1px;
margin-left:12px;
word-wrap:break-word;
float:left;
max-width:211px;
width:210px;
overflow:hidden;
white-space:normal;
}

.chatterHover .hoverInfo>.nameAndInfo {
margin-bottom:10px;
max-width:210px;
}

.chatterHover .thumbHover,.chatterHover .chatter-avatar,.chatterHover .chatter-avatar .chatter-photo {
float:left;
width:45px!important;
height:45px!important;
}

.chatterHover>.wrapper>a.chatter-avatar {
display:block!important;
position:relative;
}

.chatterHover .thumbHover.file {
width:auto!important;
height:auto!important;
border:none;
}

.chatterHover .thumbHover.file.loading {
background:url(/img/loading.gif) no-repeat scroll 10px 10px transparent;
width:32px!important;
height:32px!important;
}

.chatterHover .hoverInfo>.nameAndInfo>.name,.chatterHover .hoverInfo>.nameAndInfo>.nameDiv>.name {
font-size:1.2em;
color:#015ba7;
font-weight:700;
text-decoration:none;
}

.chatterHover .hoverInfo>.withPresence>.name,.chatterHover .hoverInfo>.withPresence>.nameDiv {
max-width:190px;
display:inline-block;
float:left;
}

.chatterHover .hoverInfo>.nameAndInfo>.chatterHover-userTitle,.chatterHover .hoverInfo>.nameAndInfo>.company,.chatterHover .hoverInfo>.misc {
color:#7d7d84;
padding-botton:10px;
}

.chatterHover .hoverInfo>.nameAndInfo>.chatterHover-userTitle,.chatterHover .hoverInfo>.nameAndInfo>.company {
font-style:italic;
}

.chatterHover .hoverInfo>.misc {
font-style:normal;
line-height:1.2em;
}

.chatterHover .hoverInfo .date {
white-space:nowrap;
color:#7d7d84!important;
}

.chatterHover .actions {
padding-top:4px;
margin-top:10px;
border-top:1px solid #e9eaea;
width:210px;
white-space:nowrap;
}

.chatterHover .actions.file ul>li {
margin:0!important;
padding:0!important;
}

.chatterHover .followLink,.chatterHover .unfollowLink {
padding:2px 0!important;
}

.chatterHover .sendPrivateMessage>a {
text-decoration:none;
font-size:1em;
color:#015ba7;
font-weight:400!important;
}

.chatterHover .message {
padding-top:10px;
margin:10px 0 0;
}

.chatterHover .actions>a {
text-decoration:none;
font-size:1em;
color:#015ba7;
}

.chatterHover .unfollowicon,.chatterHover .followicon {
width:15px!important;
height:15px!important;
}

.chatterHover .groupmanagementlink {
padding-top:0!important;
padding-bottom:0!important;
}

.chatterHover .chatIcon {
background:transparent url(/img/chatter/chat16.png) no-repeat scroll left top;
width:19px!important;
height:16px!important;
vertical-align:middle;
margin-left:1px;
margin-right:-1px;
}

.chatterHover .chatLabel {
margin-left:-1px;
}

.chatterHover .offline .chatIcon {
background:transparent url(/img/chatter/chatoffline_16.png) no-repeat scroll left top;
}

.chatterHover .away .chatIcon {
background:transparent url(/img/chatter/chataway_16.png) no-repeat scroll left top;
}

.chatterHover .hoverInfo img {
display:inline;
border:none;
}

.chatterHover .chatStatus {
background:url(/img/chatter/statusIcons.png) no-repeat scroll 0 0 transparent;
width:16px!important;
height:15px!important;
vertical-align:bottom!important;
}

.chatterHover .online {
background-position:0 .5px;
}

.chatterHover .away {
background-position:0 -16px;
}

.chatterHover .actions .chat {
display:block;
color:#015ba7;
text-overflow:ellipsis;
overflow:hidden;
}

.chatterHover .sendPrivateMessage img {
width:19px!important;
height:16px!important;
}

.chatterHover .actions a.chat.online:hover .chatLabel,.chatterHover .actions a.chat.away:hover .chatLabel {
text-decoration:underline;
cursor:pointer;
}

.chatterHover .wrapper .pbBody a {
color:#000;
}

.chatterHover .bPageBlock {
background-color:#fff!important;
width:370px;
margin:-14px;
}

.chatterHover table {
table-layout:fixed;
word-wrap:break-word;
}

.chatterHover .pbBody {
background-image:none!important;
}

.publishToLibBadgePanel {
background-color:#afc3ca;
color:#fff;
text-align:center;
border-radius:3px;
display:inline;
font-size:.8em;
padding:3px 4px 2px;
}

.chatterFileListBlock .publishToLibBadgePanel {
display:inline-block;
float:right;
}

.chatterFileListBlock .publishToLibBadgePanel.withMargin {
margin:-17px 0 -1px;
}

#FilePublishToLibraryDialogContent {
min-height:250px;
max-height:420px;
}

#publishToLibContent {
overflow:auto;
padding-left:10px;
padding-right:10px;
padding-top:10px;
height:380px;
position:relative;
}

#FilePublishToLibraryDialogContent .buttonBar .publishCancelButtons {
width:600px;
}

#global_form_error_msg ul {
list-style:circle;
}

.publishToLibContentOverlayPanel .publishFormBlock .overlayListHeader {
background:url(/img/alohaSkin/grid_headerbg.gif) repeat-x scroll 0 bottom #fff;
border-bottom:1px solid #dbdbdb;
font-weight:700;
padding:5px;
}

#publishToLibContent .publishFormBlock {
border:1px solid #dbdbdb;
padding-bottom:5px;
display:table;
width:100%;
}

#publishToLibContent .publishToLibCommonFieldsPlaceHolder {
height:24px;
}

.stdInformationSectionHelpText {
width:200px;
float:right;
font-size:1.1em;
padding:5px 2px 0;
}

.publishToLibCommonFields td,.publishToLibCommonFields th {
padding:4px 3px;
}

.publishToLibCommonFields .requiredInput .requiredBlock {
background-color:#c00;
bottom:0;
left:-4px;
position:absolute;
top:1px;
width:3px;
}

.publishToLibCommonFields .publishInputNormalSize {
width:342px;
}

.publishToLibCommonFields .publishDescripiton {
resize:none;
}

.publishToLibCommonFields select.publishInputNormalSize {
width:220px;
}

.publishToLibCommonFields .publishToLibLabelCell {
vertical-align:top;
text-align:right;
color:#4a4a56;
font-weight:700;
width:120px;
}

#publishFancyTagsContainer {
cursor:text;
border:1px solid #959595;
-moz-box-shadow:0 1px 1px #d9d9d9 inset;
width:334px;
background-color:#fff;
padding:2px 4px;
}

#publishFancyTagsList input {
border:0 none;
height:16px;
max-width:320px;
margin:1px 0 0;
padding:0;
}

#publishFancyTagsList .tagItem {
-moz-border-radius:4px;
background:none repeat scroll 0 0 #eef7fa;
border:1px solid #d4dadc;
color:#222;
text-decoration:none;
font-size:.92em;
display:inline-block;
margin:1px 0;
padding:2px 5px 1px;
}

#publishFancyTagsList .tagItem .tagItemText {
max-width:300px;
overflow:hidden;
display:inline-block;
white-space:nowrap;
float:left;
text-overflow:ellipsis;
margin:-2px 0;
}

#publishFancyTagsList span {
padding:2px 0;
}

#publishFancyTagsList a {
margin-left:5px;
padding-top:2px;
display:inline-block;
}

#publishFancyTagsList a.remove img {
background:url(/img/chatter/message_item_x.png) no-repeat scroll left top transparent;
height:8px;
width:8px;
border:0 none;
}

.tagACRow {
height:16px;
padding-left:2px;
}

.tagACRowSelected {
padding-left:2px;
height:16px;
}

.tagACRowHover {
color:#015ba7;
background-color:#e3f3ff;
}

.tagACRow.tagACHintRow {
background-color:#f7f8f8;
text-align:center;
padding-top:5px;
font-weight:700;
height:25px;
cursor:default;
}

#publishCustomFieldsBlock {
margin-top:10px;
border-top:1px solid #eaeaea;
}

#customFieldsBody {
margin-top:5px;
}

#customFieldsBody .detailList .helpOrb {
right:-21px;
}

.requiredLegend_publish {
float:left;
display:inline;
}

#customFieldsBody .mouseOverInfo {
left:-245px;
}

#customFieldsBody .helpOrb {
background-image:url(/img/alohaSkin/info_sprite.png);
background-position:left top;
height:15px;
width:15px;
}

#gotoContentLinkBox {
margin-top:3px;
color:#7d7d84;
}

#FilePublishToLibraryDialogContent .publishProgress {
background:url(/img/loading32.gif) no-repeat 0 0;
float:left;
width:32px;
height:32px;
}

#FilePublishToLibraryDialogContent .publishProgressPanel {
margin:100px 150px;
}

#FilePublishToLibraryDialogContent .publishText {
font-size:1.05em;
padding:5px 45px;
}

#actionProgressPanel #contentContainer {
width:442px;
}

#actionProgressPanel #progressIcon {
background:url(/img/loading32.gif) no-repeat 0 0;
float:left;
width:32px;
height:32px;
margin-top:25px;
}

#actionProgressPanel #progressMsgContainer {
float:left;
width:395px;
padding-left:10px;
}

#progressMsgContainer #progressMsgTitle {
font-size:1.2em;
font-weight:700;
white-space:nowrap;
overflow:hidden;
text-overflow:ellipsis;
}

.swfbtn-panel {
cursor:pointer;
z-index:10000;
position:absolute;
top:0;
left:0;
width:98px;
height:24px;
filter:alpha(opacity=0);
opacity:0;
}

.multifile-upload-input-button,.singlefile-upload-input-button {
position:absolute;
top:0;
cursor:pointer;
opacity:0;
font-size:10em;
margin:0;
padding:0;
}

.multifile-upload-input-button {
right:0;
}

.singlefile-upload-input-button {
right:26px;
height:100px;
}

#singleFileInput {
width:250px;
margin-right:-15px;
}

#multiUploadBtn {
padding-left:0;
padding-right:3px;
box-shadow:0 0;
}

.multifile-upload-button {
display:block;
width:105px;
text-align:center;
background:#c6e1ff;
border-bottom:1px solid #ddd;
color:#000;
padding:7px 0;
}

.multifile-upload-button-hover {
background:#9cf;
}

.multifile-upload-button-focus {
outline:1px dotted #000;
}

.singleProgress,.overallProgress {
border:1px solid #cfd4d6;
background-color:#fff;
margin-bottom:-4px;
display:inline-block;
padding:1px;
}

.singleProgress span,.overallProgress span {
display:block;
width:0;
height:11px;
background-color:#a4dcef;
}

.overallProgress {
width:330px;
display:none;
margin:4px 0 2px;
}

.multifile-upload-list {
list-style:none;
padding:0;
}

.multifile-upload-list li.multi-item,.multifile-upload-list li.single-item {
font-size:1.1em;
line-height:25px;
border-bottom:1px solid #d4dadc;
margin:0;
padding:2px 10px;
}

.multifile-upload-type img {
background:url(/sfc/images/docicons/doctype_16_sprite.png) no-repeat scroll 0 0 transparent;
width:16px;
height:16px;
vertical-align:middle;
margin-right:.4em;
}

.multifile-upload-type .sprite-doctype-ai-16 {
background-position:0 -26px;
}

.multifile-upload-type .sprite-doctype-audio-16 {
background-position:0 -52px;
}

.multifile-upload-type .sprite-doctype-csv-16 {
background-position:0 -78px;
}

.multifile-upload-type .sprite-doctype-eps-16 {
background-position:0 -104px;
}

.multifile-upload-type .sprite-doctype-excel-16 {
background-position:0 -130px;
}

.multifile-upload-type .sprite-doctype-exe-16 {
background-position:0 -156px;
}

.multifile-upload-type .sprite-doctype-flash-16 {
background-position:0 -182px;
}

.multifile-upload-type .sprite-doctype-gdoc-16 {
background-position:0 -208px;
}

.multifile-upload-type .sprite-doctype-gpres-16 {
background-position:0 -234px;
}

.multifile-upload-type .sprite-doctype-gsheet-16 {
background-position:0 -260px;
}

.multifile-upload-type .sprite-doctype-html-16 {
background-position:0 -286px;
}

.multifile-upload-type .sprite-doctype-image-16 {
background-position:0 -312px;
}

.multifile-upload-type .sprite-doctype-link-16 {
background-position:0 -338px;
}

.multifile-upload-type .sprite-doctype-mp4-16 {
background-position:0 -364px;
}

.multifile-upload-type .sprite-doctype-pack-16 {
background-position:0 -390px;
}

.multifile-upload-type .sprite-doctype-pdf-16 {
background-position:0 -416px;
}

.multifile-upload-type .sprite-doctype-ppt-16 {
background-position:0 -442px;
}

.multifile-upload-type .sprite-doctype-psd-16 {
background-position:0 -468px;
}

.multifile-upload-type .sprite-doctype-rtf-16 {
background-position:0 -494px;
}

.multifile-upload-type .sprite-doctype-slide-16 {
background-position:0 -520px;
}

.multifile-upload-type .sprite-doctype-unknown-16 {
background-position:0 -572px;
}

.multifile-upload-type .sprite-doctype-video-16 {
background-position:0 -598px;
}

.multifile-upload-type .sprite-doctype-visio-16 {
background-position:0 -624px;
}

.multifile-upload-type .sprite-doctype-webex-16 {
background-position:0 -650px;
}

.multifile-upload-type .sprite-doctype-word-16 {
background-position:0 -676px;
}

.multifile-upload-type .sprite-doctype-xml-16 {
background-position:0 -702px;
}

.multifile-upload-type .sprite-doctype-zip-16 {
background-position:0 -728px;
}

.fileType32x32Icon img {
background:url(/sfc/images/docicons/doctype_32_sprite.png) no-repeat scroll 0 0 transparent;
width:32px;
height:32px;
}

.fileType32x32Icon .sprite-doctype-ai-32 {
background-position:0 -42px;
}

.fileType32x32Icon .sprite-doctype-audio-32 {
background-position:0 -84px;
}

.fileType32x32Icon .sprite-doctype-csv-32 {
background-position:0 -126px;
}

.fileType32x32Icon .sprite-doctype-eps-32 {
background-position:0 -168px;
}

.fileType32x32Icon .sprite-doctype-excel-32 {
background-position:0 -210px;
}

.fileType32x32Icon .sprite-doctype-exe-32 {
background-position:0 -252px;
}

.fileType32x32Icon .sprite-doctype-flash-32 {
background-position:0 -294px;
}

.fileType32x32Icon .sprite-doctype-gdoc-32 {
background-position:0 -336px;
}

.fileType32x32Icon .sprite-doctype-gpres-32 {
background-position:0 -378px;
}

.fileType32x32Icon .sprite-doctype-gsheet-32 {
background-position:0 -420px;
}

.fileType32x32Icon .sprite-doctype-html-32 {
background-position:0 -462px;
}

.fileType32x32Icon .sprite-doctype-image-32 {
background-position:0 -504px;
}

.fileType32x32Icon .sprite-doctype-mp4-32 {
background-position:0 -588px;
}

.fileType32x32Icon .sprite-doctype-pack-32 {
background-position:0 -630px;
}

.fileType32x32Icon .sprite-doctype-pdf-32 {
background-position:0 -672px;
}

.fileType32x32Icon .sprite-doctype-ppt-32 {
background-position:0 -714px;
}

.fileType32x32Icon .sprite-doctype-psd-32 {
background-position:0 -756px;
}

.fileType32x32Icon .sprite-doctype-rtf-32 {
background-position:0 -798px;
}

.fileType32x32Icon .sprite-doctype-slide-32 {
background-position:0 -840px;
}

.fileType32x32Icon .sprite-doctype-txt-32 {
background-position:0 -882px;
}

.fileType32x32Icon .sprite-doctype-unknown-32 {
background-position:0 -924px;
}

.fileType32x32Icon .sprite-doctype-video-32 {
background-position:0 -966px;
}

.fileType32x32Icon .sprite-doctype-visio-32 {
background-position:0 -1008px;
}

.fileType32x32Icon .sprite-doctype-webex-32 {
background-position:0 -1050px;
}

.fileType32x32Icon .sprite-doctype-word-32 {
background-position:0 -1092px;
}

.fileType32x32Icon .sprite-doctype-xml-32 {
background-position:0 -1134px;
}

.fileType32x32Icon .sprite-doctype-zip-32 {
background-position:0 -1176px;
}

.multifile-upload-file {
width:230px;
}

.multifile-upload-size,.multifile-upload-cancel {
font-size:.8em;
}

.multifile-upload-status {
margin-left:10px;
}

.multifile-upload-size {
margin-left:5px;
color:#a8a8a8;
}

.fileMultiUploadOverlay progress {
margin-top:5px;
width:95%;
}

.fileMultiUploadOverlay .chatterListOverlay {
margin-top:30px;
font-size:.9em;
}

.fileMultiUploadOverlay .maximumSizeLabelSpan {
display:inline-block;
color:#a8a8a8;
font-size:.9em;
float:left;
margin-top:4px;
}

.fileMultiUploadOverlay .overlayList {
border-bottom:0;
border-top:0;
}

.fileMultiUploadOverlay .overlayListTableHeader {
width:100%;
border-top:1px solid #d4dadc;
border-bottom:1px solid #d4dadc;
}

.fileMultiUploadOverlay .sharedWithListOverlayPanel .chatterListOverlay .overlayList {
border-left:1px solid #d4dadc;
border-right:1px solid #d4dadc;
}

.fileMultiUploadOverlay .canceledAllBackGround {
background-color:#ffffe2;
}

.fileMultiUploadOverlay .finshedBackGroud {
background-color:#ffffdc;
}

.fileMultiUploadOverlay .overlayListTableHeader td {
text-align:center;
padding:6px 0;
}

.fileMultiUploadOverlay .overlayListTableHeader .uploadingStatusInfo,.fileMultiUploadOverlay .overlayListTableHeader .canceledAllStatusInfo {
font-weight:700;
font-size:1.03em;
}

.fileMultiUploadOverlay .btn,.multiUploadConfirmDialog .btn {
color:#333;
border:1px solid #b5b5b5;
border-bottom-color:#7f7f7f;
background:#e8e8e9 url(/img/alohaSkin/btn_sprite.png) repeat-x right top;
font-weight:700;
font-size:.9em;
-moz-border-radius:3px;
-webkit-border-radius:3px;
border-radius:3px;
margin:1px;
padding:2px 3px;
}

.fileMultiUploadOverlay .uploadDoneIconClass {
height:15px;
width:15px;
background:transparent url(/img/feeds/icons_sprite.png) no-repeat 0 -34px;
float:right;
margin-top:5px;
}

.fileMultiUploadOverlay .uploadWarningIconClass {
height:16px;
width:16px;
background:transparent url(/img/msg_icons/error16.png);
float:right;
margin-top:5px;
}

.fileMultiUploadOverlay .fileSizeLabel {
color:#7d7d84;
font-size:.9em;
margin-top:5px;
}

.dragAndDropTargetDiv {
color:#fff;
width:400px;
text-align:center;
}

.dragAndDropTargetDiv .dragAndDropTargetImg {
background:url(/img/chatterfiles/Dropzone.png) no-repeat transparent;
height:400px;
}

.dragAndDropTargetDiv .dragAndDropTargetTextDiv {
font-size:2em;
}

.multiUploadWarningMessage .msgIcon {
background:url(/img/chatterfiles/chatterfiles16_sprite.png) no-repeat scroll 0 -200px transparent;
height:16px;
width:16px;
}

.multiUploadConfirmDialog .message {
border-radius:4px;
padding:6px 8px 6px 6px;
}

.multiUploadConfirmDialog .messageText {
margin-left:8px;
}

.chatterbox_onboarding_download,#chatterbox_onboarding_download_1,#chatterbox_onboarding_download_2 {
height:355px;
width:650px;
}

.chatterbox_onboarding_download {
color:#3e4041;
position:relative;
background:transparent url(/img/filesync/chatterbox_onboarding_download_bg_clouds.png) no-repeat right 8em;
margin:2.5em 2.5em 1.25em;
}

.chatterbox_onboarding_download_bkground {
background-color:#fff;
}

.overlayDialog .chatterbox_onboarding_download h2,.chatterbox_onboarding_download h2 {
font-size:2.8em;
padding-bottom:.5em;
letter-spacing:-.03em;
font-weight:700;
}

.chatterbox_onboarding_download ul {
margin-top:1.2em;
padding-left:1.4em;
list-style:disc outside none;
}

.chatterbox_onboarding_download li {
font-size:1em;
line-height:1.5em;
list-style:disc outside none;
}

#chatterbox_onboarding_download_1 {
background:url(/img/filesync/chatterbox_onboarding_download_bg_devices.png) no-repeat left 15.25em;
}

.chatterbox_onboarding_download_links a,.chatterbox_onboarding_download_restart a {
cursor:pointer;
text-decoration:none;
color:#015ba7;
}

.chatterbox_onboarding_download_links_steps {
font-weight:700;
color:#f9ae54;
text-transform:uppercase;
}

#chatterbox_onboarding_download_1 .chatterbox_onboarding_download_links {
position:absolute;
left:0;
font-size:1em;
bottom:.625em;
}

#chatterbox_onboarding_download_2 .chatterbox_onboarding_download_links {
margin-top:2em;
}

#chatterbox_onboarding_download_1 p,#chatterbox_onboarding_download_2 p.chatterbox_onboarding_download_restart,.chatterbox_onboarding_download h3 {
font-size:1.16em;
font-weight:700;
line-height:1.3em;
}

.chatterbox_onboarding_download .group:before,.chatterbox_onboarding_download .group:after {
content:"";
display:table;
}

.chatterbox_onboarding_download .group {
zoom:1;
}

#chatterbox_onboarding_download_button {
position:absolute;
bottom:1.75em;
right:0;
display:inline-block;
height:2.75em;
background-color:#f29724;
border:1px solid #c56900;
border-radius:2px;
color:#fff;
text-shadow:0 -1px 0 rgba(0,0,0,.2);
font-size:1.3em;
font-weight:700;
line-height:2.75em;
cursor:pointer;
text-decoration:none;
white-space:nowrap;
margin:0;
padding:0 1.25em;
}

a.chatterbox_onboarding_download_button:hover {
background:linear-gradient(tobottom,#f9ae541%,#eb8a0a100%);
filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#f9ae54',endColorstr='#eb8a0a',GradientType=0);
box-shadow:0 2px 2px rgba(0,0,0,.3);
text-decoration:none;
}

a.chatterbox_onboarding_download_button:active {
background:linear-gradient(tobottom,#d579000,#ec9322100%);
filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#d57900',endColorstr='#ec9322',GradientType=0);
box-shadow:inset 0 1px 1px rgba(0,0,0,.3);
text-decoration:none;
}

.chatterbox_onboarding_download_label_win,.chatterbox_onboarding_download_label_mac {
padding-left:17px;
}

.chatterbox_onboarding_download_label_win {
background:url(/img/filesync/chatterbox_onboarding_download_sprite.png) no-repeat 0 0;
}

.chatterbox_onboarding_download_button_label .chatterbox_onboarding_download_label_win {
background:url(/img/filesync/chatterbox_onboarding_download_sprite.png) no-repeat 0 -26px;
}

.chatterbox_onboarding_download_label_mac {
background:url(/img/filesync/chatterbox_onboarding_download_sprite.png) no-repeat 0 -56px;
}

.chatterbox_onboarding_download_button_label .chatterbox_onboarding_download_label_mac {
background:url(/img/filesync/chatterbox_onboarding_download_sprite.png) no-repeat 0 -82px;
}

#chatterbox_onboarding_download_instructions_win,#chatterbox_onboarding_download_instructions_mac {
margin-top:1em;
}

.chatterbox_onboarding_download_instruction {
padding-top:150px;
float:left;
display:inline-block;
z-index:999;
}

.chatterbox_onboarding_download_instructions_1 {
padding-right:10px;
width:180px;
}

.chatterbox_onboarding_download_instructions_2 {
padding-left:20px;
padding-right:40px;
width:180px;
}

.chatterbox_onboarding_download_instructions_3 {
padding-left:20px;
width:190px;
}

.chatterbox_onboarding_download_os_win .chatterbox_onboarding_download_instructions_1 {
background:transparent url(/img/filesync/chatterbox_onboarding_download_instructions_win.png) no-repeat -30px 0;
}

.chatterbox_onboarding_download_os_win .chatterbox_onboarding_download_instructions_2 {
background:transparent url(/img/filesync/chatterbox_onboarding_download_instructions_win.png) no-repeat -226px 0;
}

.chatterbox_onboarding_download_os_win .chatterbox_onboarding_download_instructions_3 {
background:transparent url(/img/filesync/chatterbox_onboarding_download_instructions_win.png) no-repeat -496px 0;
}

.chatterbox_onboarding_download_os_mac .chatterbox_onboarding_download_instructions_1 {
background:transparent url(/img/filesync/chatterbox_onboarding_download_instructions_mac.png) no-repeat -30px 0;
}

.chatterbox_onboarding_download_os_mac .chatterbox_onboarding_download_instructions_2 {
background:transparent url(/img/filesync/chatterbox_onboarding_download_instructions_mac.png) no-repeat -226px 0;
}

.chatterbox_onboarding_download_os_mac .chatterbox_onboarding_download_instructions_3 {
background:transparent url(/img/filesync/chatterbox_onboarding_download_instructions_mac.png) no-repeat -496px 0;
}

.chatterFilesTabPage .rightContent .fileSyncDowloadAndFeedbackHeaderDiv {
font-size:1em;
right:0;
position:absolute;
}

.chatterPage .mainContent .chatterListViewHeader .fileSyncDowloadAndFeedbackHeaderDiv {
font-size:1em;
float:right;
height:10px;
}

.FileTabPage .fileSyncDowloadAndFeedbackHeaderDiv {
top:30px;
}

.fileSyncDowloadAndFeedbackHeaderDiv a {
color:#015ba7;
text-decoration:underline;
}

.chatterTabNavigation .fileSync .icon {
background-image:url(/img/chatter/filters_sprite.png);
background-position:0 -463px;
height:16px;
}

.chatterbox_onboarding_download_instructions_img_preloader_for_chrome {
height:0;
width:0;
overflow:hidden;
}

.topics {
color:#888;
font-size:.9em;
width:440px;
margin:3px 0;
}

.topics .suggestions {
margin-left:-4px;
}

.topics .highlight {
font-style:italic;
font-size:1.05em;
margin:0 0 10px;
padding:8px 10px;
}

.topics .highlight .editLink {
font-style:normal;
}

.topicsEditor,.topics .highlight {
background-color:#ffffdc;
border-bottom:1px solid #fceeb4;
border-top:1px solid #fceeb4;
}

.topicInput {
background-color:#fff;
border:1px solid #959595;
float:left;
overflow:hidden;
width:366px;
box-shadow:inset 0 0 1px #e7eaea;
-moz-box-shadow:inset 0 0 1px #e7eaea;
-webkit-box-shadow:inset 0 0 1px #e7eaea;
padding:2px 0;
}

.topics .topicsEditor .topicEditDone {
float:right;
margin-right:10px;
margin-bottom:0;
margin-top:0;
font-size:1em;
height:28px;
width:46px;
}

.topics .topicInput .topic {
background-color:#f1f3f5;
border-radius:3px;
-moz-border-radius:3px;
margin-left:5px;
margin-top:1px;
margin-bottom:2px;
float:left;
border:1px solid #d4dadc;
padding:2px 0;
}

.topic .name {
color:#222;
padding:0 0 0 5px;
}

.topicInput .input {
border:0;
float:left;
outline:none;
resize:none;
height:16px;
width:30px;
overflow:hidden;
margin:0;
padding:5px;
}

.topicInput .ghost {
color:#999;
width:350px;
}

.topics .delete {
background:transparent url(/img/feeds/x_sprite.png) no-repeat;
height:8px;
width:9px;
margin-left:10px;
padding-right:5px;
}

.topics .topicHover .delete {
background:transparent url(/img/feeds/x_sprite.png) 0 -8px no-repeat;
}

.topics .topicInput .topic.topicHover,.topics .topicInput .topic.selected {
background-color:#e7f5ff;
}

.topics .success {
border:1px solid #9bebb3;
background-color:#edfff1;
color:#222;
border-radius:3px;
-moz-border-radius:3px;
-webkit-border-radius:3px;
width:100%;
height:28px;
}

.topics .success .title {
font-weight:700;
margin-left:10px;
margin-right:3px;
}

.topics .success>div {
margin-top:8px;
float:left;
}

.topics .confirm {
color:#000;
background:url(/img/msg_icons/confirm16.gif) left center no-repeat;
margin-top:4px;
margin-left:10px;
float:left;
padding:10px 8px;
}

#hotTopicsWidget>ul li.hotTopicRank {
background:none repeat scroll 0 0 #f5f6f9;
border-radius:3px 3px 3px 3px;
clear:both;
color:#aaabb1;
float:left;
font-size:12px;
font-weight:700;
height:25px;
overflow:hidden;
text-align:center;
white-space:nowrap;
width:25px;
margin:0 8px 8px 0;
padding:9px 4px 0;
}

#hotTopicsWidget ul li.hotTopicHeading {
margin:0 0 10px;
}

#hotTopicsWidget>ul li.hotTopicItem {
white-space:nowrap;
overflow:hidden;
text-overflow:ellipsis;
float:left;
width:130px;
font-weight:700;
color:#015ba7;
margin:3px 0;
padding:0;
}

#hotTopicsWidget .hotTopicInterested {
color:#939a9d;
text-align:left;
line-height:.8em;
clear:both;
font-weight:400;
margin:0;
padding:0;
}

#hotTopicsWidget>ul.mytopics a {
font-size:11px;
}

#hotTopicsWidget {
position:relative;
width:100%;
margin:0;
}

#hotTopicsWidget>ul {
margin:0 0 10px;
padding:0;
}

#hotTopicsWidget>ul li {
list-style-type:none;
display:block;
}

#hotTopicsWidget>ul li.hotTopicHeading {
border-bottom:1px solid #d8d9da;
color:#585959;
display:block;
font-weight:700;
height:1.2em;
padding-bottom:3px;
width:100%;
}

#hotTopicsWidget>ul li.hotTopicHeading h3 {
color:#333435;
float:left;
font-size:1em;
margin:0;
padding:0;
}

.hotTopicActions a {
font-size:.9em;
line-height:1.4em;
position:absolute;
right:0;
top:0;
white-space:nowrap;
}

.topicsAc .autoCompleteBoxScrolling {
background-color:#fff;
border:1px solid #959595;
margin-top:-1px;
overflow-x:hidden;
overflow-y:auto;
box-shadow:0 2px 2px #aaa;
-moz-box-shadow:0 2px 2px #aaa;
-webkit-box-shadow:0 2px 2px #aaa;
padding:8px 0;
}

.topicsAc .autoCompleteRow,.topicsAc .autoCompleteHoverRow,.topicsAc .autoCompleteSelectedRow,.topicsAc .nosuggestions {
font-size:1.05em;
padding:6px 10px;
}

.topicsAc .nosuggestions {
color:#999;
}

.topicsAc .loadingsuggestions>img {
background-image:url(/img/dataCategories/spinner.gif);
background-position:0 0;
width:16px;
height:16px;
margin-left:45%;
}

.topicsAc .line {
border-top:1px solid #e9ebec;
height:0;
margin:10px 0;
}

.topicsAc {
margin-top:-1px;
color:#222;
postion:absolute;
}

.topicsAc .autoCompleteHoverRow,.topicsAc .autoCompleteSelectedRow {
background-color:#c4e7f3;
border:1px solid #c4e7f3;
}

.topicGuide {
background:none repeat scroll 0 0 #f9edd2;
border-radius:3px 3px 3px 3px;
font-size:.92em;
margin:23px 0 2px;
padding:16px 5px 8px 10px;
}

.topicGuide .topicGuideHeading>h3 {
color:#e0a168;
font-size:1.8em;
font-weight:400;
}

.topicGuide .topicGuideSubHeading,.topicGuide .topicGuideHeading {
text-align:center;
list-style:none;
margin:0 0 5px;
padding:0;
}

.topicGuideReasonsList {
padding:5px 0 0 15px;
}

.topicGuideConnector {
background:none repeat scroll 0 0 #e0a168;
border:1px solid #c68e44;
overflow:visible;
position:absolute;
width:5px;
height:45px;
z-index:2;
margin:-40px 0 0 13px;
}

.topicGuide .topicGuideTruth {
clear:both;
display:block;
margin:0 0 0 -13px;
}

.topicGuide .topicGuideCircle {
background:none repeat scroll 0 0 #e0a168;
border:1px solid #c68e44;
border-radius:50% 50% 50% 50%;
color:#fff;
font-size:1.3em;
height:20px;
line-height:1.3em;
text-align:center;
vertical-align:middle;
width:20px;
z-index:3;
position:absolute;
margin:-2px 10px 15px 0;
padding:5px;
}

.topicGuide .topicGuideTruth>p {
letter-spacing:-.03em;
text-align:left;
margin-top:0;
margin-left:35px;
padding:0 0 8px 8px;
}

.topicGuide .topicGuideBig {
font-size:1.2em;
font-weight:700;
line-height:1.3em;
}

.topicsGuideActionsBottom a {
bottom:-20px;
font-size:.9em;
line-height:1.4em;
right:-20px;
white-space:nowrap;
color:#015ba7;
float:right;
}

.zen .chatter-icon {
width:15px;
height:15px;
}

.zen .chatter-iconSmall {
width:12px;
height:12px;
}

.zen .chatter-followIcon {
background-image:url(/img/feeds/follow_sprite.png);
background-repeat:no-repeat;
background-position:0 0;
background-color:#fff;
}

.zen .chatter-iconSmall.chatter-followIcon {
background-position:-1px -148px;
}

.zen .chatter-unfollowIcon {
background-repeat:no-repeat;
background-image:url(/img/feeds/follow_sprite.png);
background-position:0 -54px;
}

.zen .active .chatter-unfollowIcon {
background-position:0 -75px;
}

.zen .chatter-checkedIcon {
background-repeat:no-repeat;
background-image:url(/img/feeds/follow_sprite.png);
background-position:0 -27px;
}

.chatter-avatar {
display:block;
position:relative;
border:none!important;
}

.chatter-avatar img {
border:none!important;
padding-bottom:10px;
}

.chatter-avatar .chatter-avatarStyle {
position:absolute;
top:0;
left:0;
z-index:1;
background:url(/img/chatter/avatar-sprite.png?v=182-1) 0 -9999px no-repeat;
}

.chatter-avatarRegular,.chatter-avatarRegular .chatter-photo,.chatter-avatarRegular .chatter-avatarStyle {
width:45px;
height:45px;
}

.chatter-avatarMedium,.chatter-avatarMedium .chatter-photo,.chatter-avatarMedium .chatter-avatarStyle {
width:30px;
height:30px;
}

.chatter-avatarTiny,.chatter-avatarTiny .chatter-photo,.chatter-avatarTiny .chatter-avatarStyle {
width:16px;
height:16px;
}

.chatter-avatarRegular .chatter-avatarStyle {
background-position:0 -159px;
}

.chatter-avatarMedium .chatter-avatarStyle {
background-position:0 -206px;
}

.chatter-avatarSmall .chatter-avatarStyle {
background-position:0 -361px;
}

.chatter-avatarTiny .chatter-avatarStyle {
background-position:0 -238px;
}

.chatter-avatarRegular.chatter-externalIndicator .chatter-avatarStyle {
background-position:0 -62px;
}

.chatter-avatarMedium.chatter-externalIndicator .chatter-avatarStyle {
background-position:0 -109px;
}

.chatter-avatarSmall.chatter-externalIndicator .chatter-avatarStyle {
background-position:0 -340px;
}

.chatter-avatarTiny.chatter-externalIndicator .chatter-avatarStyle {
background-position:0 -141px;
}

.chatter-avatarFull.chatter-externalIndicator .chatter-avatarStyle {
background-position:0 0;
width:19px;
height:19px;
top:-1px;
left:-1px;
}

.chatter-avatar .chatter-photoInfoIcon {
width:12px;
height:12px;
position:absolute;
bottom:0;
right:0;
background-color:#fff;
background-repeat:no-repeat;
background-image:url(/img/chatter/chatter_photo_icons.png?v=182-1);
z-index:10;
}

.chatter-avatarMedium .chatter-photoInfoIcon {
width:10px;
height:10px;
}

.chatter-avatarSmall .chatter-photoInfoIcon,.chatter-avatarTiny .chatter-photoInfoIcon {
width:8px;
height:8px;
}

.chatter-avatarMedium .chatter-ownerIcon {
background-position:0 -13px;
}

.chatter-avatarSmall .chatter-ownerIcon,.chatter-avatarTiny .chatter-ownerIcon {
background-position:0 -24px;
}

.chatter-avatarRegular .chatter-privateIcon {
background-position:0 -33px;
}

.chatter-avatarMedium .chatter-privateIcon {
background-position:0 -46px;
}

.chatter-avatarSmall .chatter-privateIcon,.chatter-avatarTiny .chatter-privateIcon {
background-position:0 -57px;
}

div.taskContent {
border:1px solid #ededed;
-webkit-border-radius:2px;
-moz-border-radius:2px;
border-radius:2px;
margin-top:10px;
margin-bottom:10px;
width:421px;
overflow:hidden;
padding:8px 10px 6px;
}

div.taskContent div.taskIcon {
background-image:url(/img/chatter/sprites/sprite_images/chattersupersprite.png?v=182-4);
background-position:0 -909px;
float:left;
width:16px;
height:16px;
margin:2px 10px 0 0;
}

div.taskContent div.taskInnerContent {
width:395px;
float:right;
}

div.taskContent div.taskNameAndDueDate {
padding-top:1px;
}

div.taskContent div.taskNameAndDueDate a.taskName {
font-weight:700;
font-family:Arial;
font-size:12px;
color:#015ba7;
}

div.taskContent div.taskDetails {
margin-top:3px;
color:#888;
}

div.taskContent div.taskNameAndDueDate span.taskDueDate {
font-style:italic;
font-family:Arial;
font-size:12px;
color:#888;
text-transform:capitalize;
margin-left:10px;
}

div.taskContent span.insufficientPrivileges {
font-style:italic;
font-family:Arial;
font-size:12px;
color:#888;
margin:3px 0;
}

div.taskContent div.taskInnerContent div.taskDetails {
font-family:Arial;
font-size:11px;
}

div.taskContent div.taskInnerContent div.taskDetails a:link,div.taskContent div.taskInnerContent div.taskDetails a:visited,div.taskContent div.taskInnerContent div.taskDetails a:active {
text-decoration:none;
color:#888;
}

.feedpage .feedrightbar,.feedpage .feedrightbarwider,#chatterFindExistingContentContent .helpLinkContainer,.sharedWithListOverlayPanel .pageHelpIconPanel,.chatterFilesTabPageHeader .pageHelpIconPanel,.publishToLibContentOverlayPanel .pageHelpIconPanel,.actionProgressPanel .pageHelpIconPanel,.chatterListOverlay .overlayListTable .permissionLink,.publishercontainer .bottomBarRight,.contentPublisherSlideDown .requiredLegend,.feedcontainer .feedSortMenuContainer,.feedcontainer .feedSortMenuContainer .feedSortMenu,.recommend .recDismissLink,.multifile-upload-cancel {
float:right;
}

.actionsOnHoverEnabled .feeditemcomment,.feedcontainer .feeditembodyandfooter,.sharedWithListOverlayPanel .overlayListPhoto div,.versionListOverlayPanel .overlayListPhoto div,.firstColumn>div.mouseOverInfoOuter,.secondColumn>div.mouseOverInfoOuter,.thirdColumn>div.mouseOverInfoOuter,.nextApproverOverlay .nextApproverWrapper,.publishercontainer .panelBody,.linkPostLinkContainer a.linkPostLink img,.richPost .thumbnail.default img,a.cxcontentcommentaction img,.rechatMainContainer,.publishToLibCommonFields .requiredInput {
position:relative;
}

.actionsOnHoverEnabled .bookmarkDot,.actionsOnHoverEnabled .deleteDot,.feeditemcomment .contentDescription,.feeditemcomment .linkedContentDetailsContainer .description,.contentActionMenu .unchecked,.contentActionMenu .disabled,.contentActionMenu .inverification,.publishercontainer .publisherFeedItemTypeChoices.ishidden,.publishercontainer .publisherTemplate,.listeningForPublisherFocus,.defaultState .visibilityWidgetParent,.defaultState .bottomBarLeft,.externalGroupWarning,.defaultState.externalGroup .externalGroupWarning,.zen .publisherTypeOverflow.withArrowAttached.zen-open span.pArrow,.zen .publisherTypeOverflow.withArrowAttached .triggerText,.contentPublisherSlideDown .hidden,.contentPublisherSlideDown #descRow,.contentPublisherSlideDown .requiredMark,.contentPublisherSlideDown .requiredInput .requiredBlock,.feedcontainer .contentActionMenuItem .emptyIcon,.feedcontainer .contentActionMenuItem .chatterFileIcon,.rechatMainContainer .feedcommentarrow,.recBox .topicElement .suggested span,.recBox .topicElement .selected a,.recBox .topicElement .new .done,.recBox .topicElement .used .skip,.feedSearch.feedSearchOpen .feedSearchClosedButton,.multifile-upload-cancel.hidden,.fileMultiUploadOverlay .overlayListTableHeader .inProgressUploadSpan,.fileMultiUploadOverlay .overlayListTableHeader .inProgressUploadSpan,.chatterbox_onboarding_download_os_win .chatterbox_onboarding_download_button_label .chatterbox_onboarding_download_label_mac,.chatterbox_onboarding_download_os_mac .chatterbox_onboarding_download_button_label .chatterbox_onboarding_download_label_win,.chatterbox_onboarding_download_os_mac #chatterbox_onboarding_download_instructions_win,.chatterbox_onboarding_download_os_win #chatterbox_onboarding_download_instructions_mac,.topics .mouseOver,.feedcontainer .topics .extra {
display:none;
}

.actionsOnHoverEnabled .feeditem.cxhover .bookmarkLink,.actionsOnHoverEnabled .feeditem.cxhover .feedDeleteLink,.actionsOnHoverEnabled .feeditemcomment.cxhover .commentDeleteLink,.chatterGroupGuestBadge,.nonTailBreadCrumbGuestBadge,.PeopleListPage .chatterUserGuestBadge,.feedcontainer .feeditem .preamblecontainer,.zen.feedcontainer .zen-select .zen-trigger,.privateGroup .groupIconContainer .groupPrivateIcon,.actionsOnHoverEnabled .feeditem.cxhover .topics .mouseOver,.topics .accessible .mouseOver,.topics.focus .mouseOver {
display:inline;
}

.actionsOnHoverEnabled .feeditem.cxhover .bookmarkLink,.actionsOnHoverEnabled .feeditem.cxhover .unbookmarkLink,.actionsOnHoverEnabled .feeditem.cxhover .feedDeleteLink,.actionsOnHoverEnabled .feeditemcomment.cxhover .commentDeleteLink,a:hover .contentContainer,.feedcontainer a.contentActionLink:hover,.feedcontainer a.cxcontentcommentaction:hover,.contentActionMenuItem a:hover .contentActionLabel,.feedcontainer .contentActionMenu a.contentActionLink:hover .contentActionLabel,.sendPrivateMessage a:hover,.feedcontainer a.dbrdCmpViewLink:hover,.feedcontainer a.dbrdCmpGotoDashLink:hover,.sharedWithListOverlayPanel .pageHelpIconPanel a,.sharedWithListOverlayPanel .pageHelpIconPanel a:hover,.chatterFilesTabPageHeader .pageHelpIconPanel a,.chatterFilesTabPageHeader .pageHelpIconPanel a:hover,.publishToLibContentOverlayPanel .pageHelpIconPanel a,.publishToLibContentOverlayPanel .pageHelpIconPanel a:hover,.actionProgressPanel .pageHelpIconPanel a,.actionProgressPanel .pageHelpIconPanel a:hover,.sharedWithPermissionDropdown .permissionLabelPanel a,div.chatterShowHideFeed span.showFeedLink a,div.chatterShowHideFeed span.hideFeedLink a,div.chatterShowHideFeed span.showFeedLink a:hover,div.chatterShowHideFeed span.hideFeedLink a:hover,.publishercontainer .publisherFeedItemTypeChoices a.publisherattach:hover,a.cxcontentcommentaction:hover,.publishertextarea a.isMention:hover,.cxnewcommenttext a.isMention:hover,a.zen-trigger:hover,a.zen-trigger:active,a.zen-trigger:link,a.zen-trigger:visited,.feedSearch a:hover,.feedSearch a,.chatterHover .asktojoin,.topicsAc a.autoCompleteRowLink:hover {
text-decoration:none;
}

.feeditemextras .cxfeedcomment,.feedcontainer .feeditemextras .feeditemcommentplaceholder,.feedcontainer .feeditemcommentnew {
padding-right:15px;
}

.feedcontainer .feeditemusericon,.feedcontainer .feeditemcomment a.feeditemcommentphoto,.chatterUserProfileHoverCol2,.overlayPanel .msgIcon,.caseEventIcon,.caseCommentEventIcon,.replyOwnerIcon,.replyEventIcon,.caseEventAttchmentIcon,a.cxcontentcommentaction,.publishercontainer .bottomBarLeft,.feedtitle .alignleft,.feedcontainer .dropDownFilters,.rechatTitle,.recommend .thumbnail,.recommend .recImage,.chatterHover .hoverInfo>.withPresence>.chatStatus {
float:left;
}

.feedcontainer .feedcommentfooter,.linkedContentDetailsContainer .imgBlock img,.selectedFileDetailsContainer .imgBlock img,.feedcontainer .contentActionMenu a.contentActionLink,.publishercontainer .withArrowAttached span.pArrow,.publishercontainer .publisherTemplate.activeTemplate,.externalGroup .externalGroupWarning,.zen .publisherTypeOverflow .pArrow .withArrowAttached,.feedcontainer .feeditem .preamblecontainer.displayblock,.badgeDescription,.feedSearch.feedSearchOpen .feedSearchForm,.basicTemplateFeedItemAuxBody .linkedTitle,.basicTemplateFeedItemAuxBody .description,.feedcontainer .feeditem .feedcommentuser .chatterHover .wrapper .chatterHoverThumbnail {
display:block;
}

.feedcontainer div.feeditemcommentnew .foobar,.chatterFileDetailActionListPanel .tinyDownArrowIcon,.feedcontainer .emptyfeed {
margin-bottom:5px;
}

body.detailPage .feedpage .feedcontainer .singlefeeditemheader,.visibilityHelpBody .visibilityMessage,.thanksBadgeTitle,#FilePublishToLibraryDialogContent .buttonBar {
padding-top:15px;
}

.feedcontainer .feeditemtimestamp,.feedcontainer .feeditemvisibilitytext,.feedcontainer .feeditemlinkpost,.feedcontainer .feeditemclientinfo,.feedcontainer .feeditemclientinfo a,.feedcontainer .pollvotecount,.feedcontainer .pollviewfooter a,.feedcontainer a.feedMessageLinkFont,.chatterUserHoverPhoneType,.groupList .memberCount,.caseOriginalCommentContents,.publishertextarea a.isMentionDisabled,.cxnewcommenttext a.isMentionDisabled,.feedcontainer .feeditem span.unlinkedactor,.basicTemplateFeedItemAuxBody .linkedTitle .linkUrl,.chatterHover .hoverInfo>.hoverData>.detail,.chatterHover .actions .offline {
color:#7d7d84;
}

.feedcontainer .feeditemclientinfo,.nextApproverOverlay .lookupInput select,#customFieldsBody .requiredInput {
margin-left:4px;
}

.feedcontainer .feeditem a.feeditemtimestamp:hover,.feedcontainer .pollviewfooter a:hover,#selectedPeopleToShareList .shareWithCompanyShortName,.FileDetailPage .dropdownPanel .sharedWithOptionLi a:hover,.publisherAC_box .publisherAC_row_hover,.publisherAC_box .publisherAC_clickableTitle a,.zen .publisherattach.publisherTypeOverflow.zen-select a.zentrigger,.zen .publisherTypeOverflow.withArrowAttached.zen-open .zen-trigger .publisherattachtext,.feedcontainer .contentActionMenuItem a:hover,#polladdchoice,.actionsOnHoverEnabled .feeditem.cxhover .topics .editLink,.topic.hover,.discreteLink.hover,#hotTopicsWidget>ul li a {
color:#015ba7;
}

.feedcontainer .chattertextareacontainer.chattertextareahaserror textarea.cxnewcommenttext,.rechatMainContainer .chattertextareahaserror .feeditemcomment div.newcommenttextwrapper {
border:1px solid #c00000;
}

.chattertextareacontainer .chattertextareaerror,.multifile-upload-list .warningLabelInRed,.fileMultiUploadOverlay .overlayListTableHeader .canceledAllStatusInfo {
color:#c00000;
}

.linkedContentDetailsContainer,.feeditemcomment .contentPost .rightSideCell .img,.feeditemcomment .linkedContentDetailsContainer img.contentThumbnail,.publisherAC_box .publisherAC_list li,.rechatPreviewContainer .rechatSelectionBox,.recommend li,.chatterHover .profileSection,.tagACList li {
margin:0;
}

.clearBoth,.videoLinkPostContainer>div.clear,.publishercontainer .clear,.rechatClear,#actionProgressPanel .clear,.chatterbox_onboarding_download .group:after {
clear:both;
}

#chatterFindExistingContentContent iframe,.zen .publisherTypeOverflow.zen-open .zen-options li,.contentPublisherSlideDown .linkedContentDetailsContainer,.contentPublisherSlideDown .selectedFileDetailsContainer {
overflow:hidden;
}

.chatterFileListBlock a.tipsLink:hover span.helpLink,.chatterFileListBlock a.fileNameLink:hover,a:hover .contentActionLabel,a:hover .contentTitleLink,.feedcontainer a.contentActionLink:hover span.contentActionLabel,.feedcontainer .contentActionMenu .hr .noIcon a.contentActionLink:hover .contentActionLabel,.sendPrivateMessage a:hover span,.feedcontainer a.dbrdCmpViewLink:hover span.dbrdCmpLabel,.feedcontainer a.dbrdCmpGotoDashLink:hover span.dbrdCmpLabel,.chatterListOverlay .externalInvite a:hover,.displayName a:hover,.sharedWithListOverlayPanel .pageHelpIconPanel a:hover span,.chatterFilesTabPageHeader .pageHelpIconPanel a:hover span,.actionProgressPanel .pageHelpIconPanel a:hover span,.sharedWithListOverlayPanel a:hover,.chatterShowHideFeed a:hover .linkText,div.chatterShowHideFeed span.showFeedLink a:hover .linkText,div.chatterShowHideFeed span.hideFeedLink a:hover .linkText,.publishercontainer .publisherFeedItemTypeChoices a.publisherattach:hover span,a.cxcontentcommentaction:hover span,a.zen-trigger:hover .publisherTypeOverflowSelected .publisherattachtext,a.zen-trigger:active .publisherTypeOverflowSelected .publisherattachtext,.feedcontainer a:hover,.rechatLinkTargetContainer a:hover,.chatterFileDetailActionListPanel li a:hover span,.stdInformationSectionHelpText .helpLink,.chatterbox_onboarding_download_links a:hover,.chatterbox_onboarding_download_restart a:hover {
text-decoration:underline;
}

.videoLinkPostOuterContainer iframe,.richPost .inlinePlayer iframe {
z-index:1;
}

.feedcontainer .newFeedItemsMessage a,a#taskCreatePanel_due_date_icon:hover {
cursor:pointer;
}

.feedcontainer a.contentActionLink .downloadItemIcon,.chatterFileDetailActionListPanel .downloadItemIcon {
background-position:0 -20px;
}

.feedcontainer a.contentActionLink .publishItemIcon,.chatterFileDetailActionListPanel .publishItemIcon {
background-position:0 -405px;
}

.contentActionMenu .noIcon>.contentActionLabel,.chatterListOverlay .entityTable .overlayListName,.chatterShowHideFeed img,.feedcontainer .moreFileActions-td .downloadItemIcon,.feedcontainer .moreFileActions-td .externalSourceSmallIcon,ul.pollchoices li input,ul.pollchoices li label {
vertical-align:middle;
}

.hr>.contentActionMenuItem,.richPost .full {
margin-left:0;
}

a.contentThumbnail-a:hover .contentThumbnail,a.dbrdThumbnail-a:hover .dbrdThumbnail {
border:1px solid #015ba7;
padding:0;
}

a.contentThumbnail-a .contentThumbnail,.dbrdThumbnail-a>.dbrdThumbnail,.feedcontainer .checkedMenu a.checkedMenuButton span,.recBox .success .todoList p,.topicGuide>ul {
padding:0;
}

.feeditemcomment .linkedContentDetailsContainer .contentThumbnail+.previewHover,.overlayList.groupList {
margin-top:0;
}

.chatterUserHoverPhoneLine,.chatterListOverlay table,.searchLowerMainContent .feedsScopeMessage,.chatterHover .hoverInfo>.hoverData,#chatterbox_onboarding_download_2 p {
font-size:1em;
}

.dbrdSnapshotDialog,.dbrdThumbnailPreview,.feedcontainer .contentActionMenuItem .zen-img {
width:auto;
}

.dbrdThumbnailCmpTitle,.chatterListOverlay .boldTitleSpan,.sharedWithListOverlayPanel .sharedWithLinkBar .sharedWithBoldLink,.makePrivateMsgPanel .stopSharingMsg .stopSharingWithCompany,.nextApproverOverlay .errorMsg .strong,.feedcontainer .feeditem .feedcommentuser a,.feedcontainer .feeditem .feeditemfirstentity a,.feedcontainer .feeditem .feeditemfirstentity,.feedcontainer .feeditem .showmorefeeditemscontainer a,.feedcontainer .feeditem .actorentitylink,.feedcontainer .feedtitle a.feedtitletopiclink,.feedFavoriteHeader h3.feedtitle a,.feedcontainer .dropDownFilters .zen-trigger,.feedcontainer .dropDownFilters .feedFilterText,.title,.recommend .recElementName,.todoList .recElementName,#publishToLibContent .publishFormHeader span,.topicGuide .topicGuideSubHeading {
font-weight:700;
}

.chatterListOverlay .titleSpan,#sharedWithInputBox_autoCompleteBoxId .ugAC_userRole {
color:#4a4a56;
font-size:.9em;
}

.chatterListOverlay select,.publicLinkValueDiv .messageTable .messageText {
font-size:.9em;
}

.chatterListOverlay .cancelButton,.modalOverlay .buttonBar,.chatterFilesTabPageUploadPanel .uploadButtonBar,.publisherpollchoice .errorMsg,.ryppleBadgeInner div {
text-align:center;
}

.chatterListOverlay .overlayListName,.sharedWithListWizard .notificationEmailPanel .sendEmailOptionLabel,.sharedWithListWizard .notificationEmailPanel .wallPostLabel,.FileDetailPage .contentActionMenuItem {
padding-left:0;
}

.chatterListOverlay .subscribeLinkErrors,.main-messaging div {
white-space:normal;
}

.chatterListOverlay .externalInvite a,.externalGroupAdminMailToLink a,.sharedWithListOverlayPanel a,.rechatLinkTargetContainer a,.recommend a,.todoList a,.chatterFileDetailActionListPanel li a,.chatterFileDetailActionListPanel li a:hover {
color:#015ba7;
text-decoration:none;
}

.sharedWithListOverlayPanel .overlayListHeader .permissionsLabel,.sharedWithListOverlayPanel .overlayListHeader .viewerColumnLabel,.sharedWithListOverlayPanel .overlayListHeader .collaboratorColumnLabel,.recBox .topicElement .selected img {
padding-right:5px;
}

.makePrivateMsgPanel .makePrivateMsgIcon,.sharedWithNoGroupMembershipMessage img,.sharedWithStatusBar .sharingStatusIcon img,.sharedWithListOverlayPanel .tinyDownArrowIcon,.sharedWithListOverlayPanel a:hover .tinyDownArrowIcon,.sharedWithPermissionDropdown .tinyDownArrowIcon,.sharedWithOptionPanel .sharedWithStatusBar a .tinyDownArrowIcon,.sharedWithOptionPanel .sharedWithStatusBar a:hover .tinyDownArrowIcon,.chatterFilesTabPageUploadPanel .uploadFileMsgIcon,.chatterFilesTabPageUploadPanel .uploadNewVersionMsg {
background:transparent url(/img/chatterfiles/chatterfiles16_sprite.png) no-repeat;
}

.sharedWithListOverlayPanel .chatterListOverlay .overlayListHeader td,.sharedWithListOverlayPanel .chatterListOverlay .overlayListTable td,.versionListOverlayPanel .chatterListOverlay .overlayListHeader td,.versionListOverlayPanel .chatterListOverlay .overlayListTable td,.publisherThanksContainer {
padding:3px;
}

.sharedWithListOverlayPanel .chatterListOverlay .overlayListPhoto img .versionListOverlayPanel .chatterListOverlay .overlayListPhoto img,.recommend .recBox .groupmanagementlink,.chatter-avatarWithIcon {
margin-bottom:2px;
}

.sharedWithListOverlayPanel .chatterListOverlay .overlayListTable .shareWithCompanyPermissionCell,.recBox .recInfo {
width:150px;
}

.sharedWithListOverlayPanel .sharedWithLinkBar,.todoList .dismiss {
margin-top:8px;
}

.makePrivateMsgPanel .makePrivateMsgIcon,.chatterFilesTabPageUploadPanel .uploadFileMsgIcon {
background-position:0 -308px;
float:left;
width:16px;
height:16px;
}

.sharedWithListOverlayPanel .notificationEmailPanel .optionalMsgGhostText,.sharedWithListOverlayPanel .entitySearchBox.ghostText {
color:#9f9f9f;
}

.sharedWithListOverlayPanel .chatterListOverlay .shareWithPeopleListHeader,.fileFormInputElementFullSize,.thanksPost,.publishToLibCommonFieldsContainer {
width:100%;
}

#shareWithEntityForm .overlayListName .titleSpan,.feedcontainer .feeditem .feeditemwithsubject a.actorentitylink,.feedcontainer .feeditem .feeditemsecondentity a,.feedcontainer .feeditem .feeditemsecondentity span,.feedcontainer h3>span,.postTo.postToEntity .postToTextTarget {
font-weight:400;
}

#shareWithEntityForm .chatterListOverlay .overlayListPhoto img,.defaultState .publisherWrapper,.jitRecs .recommend,.jitRecs .recBox {
margin-bottom:0;
}

.sharedWithNoGroupMembershipMessage,.dropDownFilters,.rechatMainContainer.feedcontainer .rechatClear {
margin-bottom:15px;
}

.sharedWithNoGroupMembershipMessage a,div.taskContent div.taskInnerContent div.taskDetails a:hover {
text-decoration:underline;
color:#015ba7;
}

.sharedWithListOverlayPanel .tinyDownArrowIcon,.sharedWithPermissionDropdown .tinyDownArrowIcon,.chatterFileDetailActionListPanel .tinyDownArrowIcon,.sharedWithOptionPanel .sharedWithStatusBar a:hover .tinyDownArrowIcon,.sharedWithListOverlayPanel a:hover .tinyDownArrowIcon {
background-position:0 -186px;
}

.sharedWithListOverlayPanel .tinyDownArrowIcon,.rechatMainContainer .recipientSelectionContainer .groupicon .chatter-avatar {
margin-top:9px;
}

.confirmationMsgPanel .icon,.contentPublisherSlideDown .contentPublisherTitleImageLink {
background-position:0 0;
float:left;
}

.chatterListOverlay .overlayListTable .displayNameWidthWithCompanyShare,.singleProgress,.chatter-avatarFull .chatter-photo {
width:200px;
}

.dropdownPanel .sharedWithStatusBar a.peopleItemIcon,.dropdownPanel .sharedWithStatusBar a.groupItemIcon,.dropdownPanel .sharedWithStatusBar a.linkItemIcon {
background-position:20px 100px;
}

.sharedWithOptionPanel ul,.dropdownPanel ul,.recElement {
list-style:none;
}

.sharedWithOptionPanel ul,.sharedWithOptionPanel li,.dropdownPanel ul,.dropdownPanel li,.rechatMainContainer.feedcontainer,.rechatMainContainer.feedcontainer .feeditem,.rechatMainContainer .feeditemcomment,.recommend ul,.chatterHover .chatterFileDetailActionListPanel>ul,#hotTopicsWidget ul li {
margin:0;
padding:0;
}

.dropdownPanel .actionBarShareWithUl,.dropdownPanel .actionBarShareWithUlWithTopBorder,div.taskContent div.taskDetails span.feeditemseparatingdot {
margin-left:5px;
margin-right:5px;
}

.dropdownPanel .actionBarShareWithUlWithTopBorder,.multifile-upload-list li.single-item {
border-top:1px solid #d4dadc;
}

.sharedWithOptionPanel .sharedWithStatusBar .sharedWithLabel,.caseEventSeparator,.rechatWithGroup input.ghostText {
padding-left:5px;
}

.sharedWithOptionPanel .sharedWithStatusBar a.peopleItemIcon,.sharedWithOptionPanel .sharedWithStatusBar a.groupItemIcon,.sharedWithOptionPanel .sharedWithStatusBar a.linkItemIcon,.sharedWithOptionPanel .sharedWithStatusBar a.companyItemIcon {
background-position:5px 100px;
}

.publicLinkValueDiv .messageTable td,.stdInformationSectionHelpTextPanel {
vertical-align:top;
}

.publicLinkValueDiv .publicLinkValueButton,.chatterlvthirdcolumn .recommend,.chatterlvthirdcolumn .todoListBox {
margin-bottom:10px;
}

.overlayDialog.docViewerOverlay,.postTo .nameFadeOut,.rypplemain-logo,#FilePublishToLibraryDialog {
position:absolute;
}

.caseEventCustomerIndicator,.topics .discreteLink,.feedcontainer .topics {
color:#888;
}

.caseCommentEventOriginalPostBy,.pollvotecount,.pollviewtogglelink,.pollresultsrefreshlink {
font-size:.92em;
}

a.chatterFollowUnfollowAction.unfollow:hover,.rechatRecipientSelector a.remove:hover,.groupSelection a.removeGroup:hover {
background:transparent url(/img/feeds/follow_sprite.png) no-repeat 0 -75px;
}

a.chatterFollowUnfollowAction,.publisherAC_box .publisherAC_list li .name,.feedcontainer .feeditem .feedcommentuser a,.feedcontainer .feeditem .showmorefeeditemscontainer a,.feedcontainer .feeditem a.actorentitylink,#publishFancyTagsList .tagItemInputContainer,.multifile-upload-type,.multifile-upload-file,.multifile-upload-name,.multifile-upload-size,.multifile-upload-cancel,.chatter-avatarInline {
display:inline-block;
}

.checkedMenu .checkedMenuMenu a:hover,.fileMultiUploadOverlay .ongoingBackGround {
background-color:#e3f3ff;
}

.publishercontainer .publisherFeedItemTypeChoices a.publisherattach.withArrowAttached,.zen .publisherTypeOverflow.zen-select.withArrowAttached,.zen .publisherTypeOverflow.withArrowAttached .zen-trigger .publisherattachtext {
color:#393939;
}

.publishercontainer.externalGroup .alignCenter .publisherTextAreaInner,.publishercontainer.externalGroup .chattermessagecontainer {
border-left:1px solid #fe8b20;
border-right:1px solid #fe8b20;
}

.publisherAC_box .publisherAC_list,.tagACList {
list-style-image:none;
list-style-position:outside;
list-style-type:none;
margin:0;
padding:0;
}

.publishercontainer .publishertextareafocus,.groupSelection input.groupSelectionInput.hasFocus {
color:#222;
}

.publishercontainer .chatterFileRowChrome .requiredInput .requiredBlock,.topicsAc .loadingsuggestions {
height:20px;
}

.zen .zen-select.publisherTypeOverflow,.rechatMainContainer.feedcontainer .chattertextareacontainer.chattertextareahaserror textarea.cxnewcommenttext,.richPost .thumbnail.default .thumb,#customFieldsBody .bPageBlock {
border:none;
}

.contentPublisherSlideDown .panel,.contentPublisherSlideDown .sharedWithStatusBarFirstRow,.publisherpollchoice,.topicsContainer {
padding-bottom:10px;
}

.contentPublisherSlideDown .panelBody,#progressMsgContainer #progressMsgText {
padding-top:10px;
}

.contentPublisherSlideDown #descRow td,#chatterLinkPost,#chatterRyppleThanksPost {
padding-bottom:0;
}

.feedtitle .alignright a,.feedcontainer h3.feedtitle .mouseOverInfo {
font-size:.85em;
}

.rechatMainContainer input.ghostText,input.ghostText,#rypplebodyarea.ghostText {
color:#999;
font-size:1em;
}

.rechatMainContainer .feeditemextras,.rechatMainContainer .feeditemextras .feeditemcommentnew {
margin:0;
padding:0;
}

.rechatBody,.recommend .recBox .recImage {
margin-top:3px;
}

.postTo .postToTarget,.feedSearchActive .feedSearchClear,.fileMultiUploadOverlay .warningMessage {
display:inline-block;
vertical-align:top;
}

.groupSelection img.groupIcon,.chatter-avatarSmall,.chatter-avatarSmall .chatter-photo,.chatter-avatarSmall .chatter-avatarStyle {
width:20px;
height:20px;
}

.influence-header .section,.basicTemplateFeedItemAuxBody .linkedTitle {
padding-bottom:3px;
}

.influence-bar .active,.influence-bar .top,.thanksContainer .publisherTextAreaContainer {
border-left:1px solid #c7ccce;
}

.influence-extra,.topicLabel {
position:absolute;
overflow:hidden;
clip:rect(0000);
height:1px;
width:1px;
border:0;
margin:1px;
padding:0;
}

.publisherpollchoices,.topicsEditor {
padding:10px 0 10px 10px;
}

.badgeSkills,.badgeSelectionSkills {
display:block;
color:#7d7d84;
}

.rypplelogo,.badgeButtonsContainer {
margin-top:20px;
}

.recBox .topicElement .suggestion p,#MultiUploadErrorHandlingDialog .buttons {
padding-top:0;
}

.recBox .success .todoList,#todoItem.success {
background:none repeat scroll 0 0 #edfff1;
border:2px solid #9bebb3;
}

.todoList .recImage,.recommend .todoElement .recImage {
float:right;
height:40px;
width:40px;
border:0;
}

.todoList img.video,.todoList img.shortVideo {
background:url(/img/chatter/wtdNowIcon_sprite.png) no-repeat 0 -102px;
}

a:hover .feedSearchIcon,.chatterHover .offline {
background-position:0 -32px;
}

.chatterHover .hoverInfo>.description,.fileMultiUploadOverlay .buttonBar {
margin-top:15px;
}

.multifile-upload-list .warningBackGround,.fileMultiUploadOverlay .cancelledRow {
background-color:#fdedea;
}

.multifile-upload-list .doneLabelInGreen,.fileMultiUploadOverlay .overlayListTableHeader .uploadingStatusInfo {
color:#008040;
}

.multifile-upload-type .sprite-doctype-txt-16,.fileType32x32Icon .sprite-doctype-link-32 {
background-position:0 -546px;
}

.fileType32x32Icon .sprite-doctype--32,.chatter-avatarRegular .chatter-ownerIcon {
background-position:0 0;
}











.threecolumn,.userProfilePage {
width:969px;
padding-bottom:50px;
}

.threecolumn .headerContent .pageTitle,.PeopleListPage .listViewportWrapper .listViewport .topNav h2.title,.chatterFilesTabPageHeader .pageIconTitlePanel .pageIconTitle {
font-size:1.8em;
color:#222;
}

.threecolumn .headerContent {
margin-bottom:12px;
position:relative;
overflow:hidden;
}

.threecolumn .leftContent,.userProfilePage .leftContent {
float:left;
width:200px;
overflow:visible;
}

.threecolumn .mainContent,.userProfilePage .mainContent {
margin-left:210px;
width:757px;
}

.chatterPage .mainContent {
margin-left:200px;
padding-left:9px;
border-left:1px solid #e9eaea;
}

.threecolumn .mainContent .lowerMainContent {
width:759px;
}

.threecolumn .centerContent,.userProfilePage .centerContent {
float:left;
overflow:visible;
width:541px;
}

.threecolumn .rightContent,.userProfilePage .rightContent {
float:right;
width:200px;
overflow:hidden;
}

.chatterPage .threecolumn .rightContent {
overflow:visible;
min-height:300px;
}

.threecolumn .headerContent .pageTitle {
font-weight:400;
display:inline-block;
text-overflow:ellipsis;
overflow:hidden;
max-width:757px;
white-space:nowrap;
float:left;
}

.threecolumn .headerContent .headerRightContent {
padding-right:5px;
padding-top:5px;
float:right;
}

.profileHeaderContent {
clear:both;
vertical-align:middle;
position:relative;
}

.chatterPage .waitingSearchDiv {
background-color:#FFF;
filter:alpha(opacity=100);
opacity:1;
-moz-opacity:1;
height:100%;
z-index:86;
}

.chatterPage .chatterUserStatus {
margin-bottom:5px;
height:auto!important;
min-height:50px;
width:200px;
}

.chatterPage .chatterUserStatus .chatterUserStatusTop {
width:200px;
}

.chatterPage .chatterUserStatus .chatterUserStatusTop .wbr:after {
content:"\00200B";
}

.chatterPage .chatterUserStatus .chatterUserStatusName {
float:left;
left:47px;
margin-top:4px;
padding-left:8px;
padding-right:8px;
padding-top:4px;
vertical-align:middle;
width:auto;
max-width:160px;
}

.chatterPage .chatterUserStatus .chatterUserStatusName a {
word-wrap:break-word;
color:#015ba7;
text-decoration:none;
line-height:16px;
white-space:normal;
font-weight:700;
}

.groupListPage .x-grid-empty {
color:#222;
font-size:1em;
}

.groupListPage .groupicon,.searchResults .groupicon,.PeopleListPage a.chatterlisticon,.searchResults a.chatterlisticon {
padding-left:6px;
padding-right:6px;
text-decoration:none;
float:left;
position:relative;
}

.groupListPage .groupinfo,.searchResults .groupinfo,.PeopleListPage .peopleInfoContent,.searchResults .peopleInfoContent {
margin-left:59px;
display:block;
}

.PeopleListPage .peopleInfoContent .displayName,.searchResults .peopleInfoContent .displayName {
overflow:hidden;
text-overflow:ellipsis;
}

.groupListPage .memberCountContainer,.searchResults .memberCountContainer {
margin-right:14px;
}

.groupListPage a.ownername,.searchResults a.ownername {
margin-left:3px;
font-weight:400;
color:#015ba7;
}

.groupListPage .memberAndOwner,.searchResults .memberAndOwner {
line-height:18px;
margin-top:3px;
}

.groupListPage .privatemarker,.searchResults .privatemarker {
padding-left:4px;
color:#d55611;
}

.groupListPage .listViewportWrapper .listViewport .topNav .btn {
margin:3px 1px 1px;
}

.PeopleListPage .rolodex {
width:740px;
text-align:right;
white-space:normal;
}

.PeopleListPage .rolodex a {
display:inline-block;
white-space:nowrap;
}

.chatterDeprecationMessage .messageText a {
text-decoration:none;
color:#015ba7;
font-size:100%;
margin:0;
}

.chatterDeprecationMessage {
border:1px solid #f8e38e;
background:#ffffdc;
max-width:865px;
margin-bottom:20px;
}

.chatterDeprecationMessage .messageText {
font-size:100%;
}

.chatterDeprecationMessage .messageText a.chatterDeprecationMessageDismiss {
margin-left:10px;
}

.groupListPage .filterHeader {
font-size:1.2em;
font-weight:700;
}

.groupListPage .filterDesc {
color:#222;
padding-left:14px;
}

.groupListPage .headerContent .pageTitle {
display:inline;
}

.groupListHeader .btn {
margin-left:24px;
position:relative;
}

line editing .groupListPage .listViewport .topNav .controls {
margin-top:-20px;
}

.groupListPage .threecolumn .centerContent {
padding:0 4px;
}

.FeedItemPage .singleFeedElementContent {
-moz-border-radius-topleft:5px;
-moz-border-radius-topright:5px;
-webkit-border-top-right-radius:5px;
-webkit-border-top-left-radius:5px;
background:#fff url(/img/alohaSkin/feeds/feedbg.png) repeat-x scroll left -40px;
}

.FeedItemPage .singleFeedElementContent,.userProfilePage .lowerCenterContent {
min-height:200px;
}

.chatterPage .publishercontainer {
margin-left:8px;
}

.chatterPage .feedcontainer {
min-height:300px;
padding-left:8px;
padding-top:1px;
}

.chatterPage .centerContent {
min-height:300px;
}

.FeedItemPage .singleFeedElementContainer {
width:515px;
margin-left:220px;
padding-left:20px;
}

body.uppEditItem {
background-color:transparent;
padding:12px 12px 0;
}

.fileSyncOnBoardBanner {
background:none repeat scroll 0 0 #464646;
height:70px;
border-radius:5px;
font-size:1.083em;
}

.fileSyncOnBoardBanner .fileSyncHr {
background-color:#fff;
height:1px;
width:100%;
margin:0;
}

.fileSyncOnBoardBanner .fileSyncOnBoardBannerInnerTable {
display:table;
height:100%;
width:100%;
}

.fileSyncOnBoardBanner .fileSyncOnBoardBannerInnerTable .fileSyncOnBoardBannerInnerCell {
display:table-cell;
vertical-align:middle;
}

.fileSyncOnBoardBanner .fileSyncOnBoardBannerInnerTable .fileSyncOnBoardBannerInnerCell .syncMsgBody {
color:#d7d7d7;
font-size:1.083em;
margin:0 7px 0 20px;
}

.fileSyncOnBoardBanner .fileSyncOnBoardBannerInnerTable .fileSyncOnBoardBannerInnerCell .syncMsgBodyBold {
color:#fff;
font-size:1.083em;
font-weight:700;
margin-left:5px;
}

.fileSyncOnBoardBanner .fileSyncOnBoardBannerInnerTable .fileSyncOnBoardBannerInnerCell .fileSyncOnBoardBannerActionDiv a.downloadSyncBtn {
background:none repeat scroll 0 0 #f29724;
border:0;
border-radius:2px;
display:inline-block;
color:#FFF;
text-shadow:0 -1px 0 rgba(0,0,0,.2);
font-size:1.083em;
font-weight:700;
height:30px;
line-height:30px;
margin:0;
padding:0 20px;
}

.fileSyncOnBoardBanner .fileSyncOnBoardBannerInnerTable .fileSyncOnBoardBannerInnerCell .fileSyncOnBoardBannerActionDiv a.downloadSyncBtn:hover {
background:linear-gradient(tobottom,#f9ae541%,#eb8a0a100%);
filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#f9ae54',endColorstr='#eb8a0a',GradientType=0);
box-shadow:0 2px 2px rgba(0,0,0,.3);
text-decoration:none;
}

.fileSyncOnBoardBanner .fileSyncOnBoardBannerInnerTable .fileSyncOnBoardBannerInnerCell .fileSyncOnBoardBannerActionDiv a.downloadSyncBtn:active {
background:linear-gradient(tobottom,#d579000,#ec9322100%);
filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#d57900',endColorstr='#ec9322',GradientType=0);
box-shadow:inset 0 1px 1px rgba(0,0,0,.3);
text-decoration:none;
}

.ChatterPage .fileSyncOnBoardBanner {
margin:1px 2px 15px;
}

.fileSyncOnBoardBanner .fileSyncOnBoardBannerActionDiv {
margin-left:10px;
display:inline;
}

.fileSyncOnBoardBanner .fileSyncOnBoardBannerActionDiv a.closeFileSyncBannerBtn {
background:none;
border:none;
color:#8a8a8a;
}

.fileSyncOnBoardBanner .fileSyncOnBoardBannerActionDiv a.closeFileSyncBannerBtn:hover {
color:#fff;
}

.chatterNavigationGroup {
margin-bottom:13px;
padding-bottom:9px;
border-bottom:1px solid #e9eaea;
}

.chatterNavigationGroup.feedFavoriteNavigation {
border-bottom:none;
}

.chatterNavigationGroup .chatterNavigationSectionTitle {
color:#7d7d84;
font-weight:400;
margin-bottom:4px;
margin-left:5px;
display:block;
}

.chatterNavigationGroup .showMore {
color:#015ba7;
display:block;
font-size:.92em;
padding:2px 0 0 5px;
}

.chatterNavigationGroup .count {
display:inline-block;
line-height:16px;
height:16px;
background:#1797c0;
color:#fff;
font-size:11px;
font-weight:700;
vertical-align:middle;
-moz-border-radius:3px;
-webkit-border-radius:3px;
border-radius:3px;
position:relative;
top:-1px;
padding:0 5px;
}

.chatterNavigationGroup a.delete {
display:none;
position:absolute;
right:10px;
top:50%;
margin-top:-4px;
width:9px;
height:8px;
background-image:url(/img/feeds/x_sprite.png);
text-decoration:none;
text-indent:-999em;
}

.chatterNavigationGroup a.delete:hover,.chatterNavigationGroup a.delete.isAccessible:focus {
background-position:0 -8px;
}

#feedFavoriteNavigation .trigger {
margin-right:30px;
}

#favoriteWidget {
width:200px;
overflow:hidden;
}

.favoriteBox {
padding-bottom:8px;
padding-top:10px;
display:block;
}

.addFavoriteButton {
width:16px;
height:16px;
background:transparent url(/img/feeds/follow_sprite.png) no-repeat 0 -104px;
}

.addFavoriteCheck {
background:transparent url(/img/feeds/follow_sprite.png) no-repeat 0 -128px;
width:22px;
height:18px;
}

.removeFavoriteButton {
width:15px;
height:15px;
margin-left:2px;
background:transparent url(/img/feeds/follow_sprite.png) no-repeat scroll 0 -54px;
}

.favoriteExplanation {
color:#7d7d84;
line-height:15px;
}

.favoriteExplanation a {
color:#7d7d84;
text-decoration:underline;
}

.listViewportWrapper #favoriteWidget {
position:absolute;
left:565px;
top:5px;
}

.listViewportWrapper .feedContainer {
position:relative;
min-width:770px;
min-height:100px;
}

.chatterNavigationGroup ul,.groupListFilters ul {
list-style:none;
margin:0;
padding:0;
}

.chatterNavigationGroup .icon {
overflow:hidden;
display:inline-block;
vertical-align:middle;
margin-right:2px;
text-decoration:none;
position:absolute;
left:4px;
top:4px;
max-height:16px;
max-width:16px;
}

#feedFavoriteNavigation span.listView {
background-image:url(/img/alohaSkin/listtoggle_icons.png);
background-position:left top;
padding-right:5px;
left:3px;
}

#feedFavoriteNavigation span.search {
background-image:url(/img/func_icons/util/search16.png);
background-repeat:no-repeat;
top:3px;
}

.directMessage .icon {
background-image:url(/img/chatter/sprites/sprite_images/chattersupersprite.png?v=182-4);
background-position:0 -389px;
width:16px;
height:16px;
}

.chatterNavigationGroup .trigger,.groupListFilters .trigger {
white-space:nowrap;
overflow:hidden;
display:block;
padding-left:5px;
}

.chatterNavigationGroup .hasIcon .trigger {
padding-left:27px;
}

.directMessage .trigger {
padding-right:5px;
display:inline-block;
overflow:visible;
}

.chatterNavigationGroup li,.groupListFilters li {
display:block;
position:relative;
margin:0;
}

.chatterNavigationGroup .subNavSection {
line-height:23px;
display:none;
}

.chatterNavigationGroup .selected a,.groupListFilters .selected .grouplistfilterheader a {
font-weight:700;
color:#333435;
text-decoration:none;
}

.groupListFilters .selected,.chatterPage ul li.selected {
background-color:#c4e7f2;
border-radius:5px;
}

.chatterPage ul li.selected {
border-top-right-radius:0;
border-bottom-right-radius:0;
}

.chatterNavigationGroup .actionFlash {
background:url(/img/chatter/filterBackgroundFlash.png) top left no-repeat;
}

.groupListFilters .selected .grouplistfilterheader a {
outline:none;
-moz-outline-style:none;
}

.fileSyncNavigation {
border:0;
padding-bottom:0;
margin-bottom:0;
}

.feedLinkSpacer {
height:1em;
}

div.metadata {
width:300px;
clear:right;
}

div.noTableFooter {
margin-left:0;
}

.profileSection {
margin-bottom:28px;
}

.profileSection a {
word-wrap:break-word;
}

.userProfilePage .vfButtonBar h3,.feedpage .vfButtonBar h3,h3.topicWidgetHeader.mostUsedTopicHeader {
font-size:1em;
color:#333435;
}

.profileSectionBody {
color:#333435;
line-height:15px;
float:none;
word-wrap:break-word;
}

.profileSectionLabelAndData {
padding-bottom:5px;
margin-bottom:5px;
line-height:130%;
width:100%;
border-bottom:1px solid gray;
}

.profileSectionLabelAndData.finalLabelAndData {
border-bottom:none;
padding-bottom:0;
}

.photoActionSep {
color:#b1b7bd;
}

.contactLabel {
width:30%;
text-align:right;
font-weight:700;
color:#333;
font-size:91%;
margin-right:10px;
padding:1px;
}

.profileSectionLabel {
float:left;
height:100%;
margin-right:5px;
width:29%;
text-align:right;
vertical-align:top;
color:#333;
font-size:91%;
font-weight:700;
}

.profileSectionData {
text-align:left;
padding-bottom:4px;
position:relative;
}

span.subjectName {
font-size:1.35em;
}

.bubbleImageDiv {
background:transparent url(/img/userprofile/currentStatusUpdateBubble.png) no-repeat;
height:2.5em;
padding-left:8px;
left:8px;
position:relative;
}

.statusPromptAndInput {
border:0;
offset:0;
border-spacing:0;
color:gray;
white-space:nowrap;
padding:0;
}

input.statusPromptAndInput {
color:#000;
width:100%;
}

.userProfilePage .profileHeaderLinks a:hover span,.threecolumn .headerContent a:hover span {
color:#015ba7;
text-decoration:underline;
}

.messageSentConfirm {
position:absolute;
}

.profileHeaderLinks img {
vertical-align:middle;
}

.threecolumn .headerContent .helpLink {
padding-right:5px;
white-space:normal;
}

.currentStatusSection {
margin-left:14px;
}

.messageText {
font-size:110%;
}

.messageText>h4 {
padding-right:.5em;
}

.recentFilesItem {
white-space:nowrap;
overflow:hidden;
text-overflow:ellipsis;
display:inline-block;
width:140px;
}

.panelGridLabel {
background-color:#FFF;
font-size:80%;
margin-left:-30px;
}

.GroupProfilePage .entityDoesNotExist,.FeedItemPage .entityDoesNotExist,.groupEditPage .entityDoesNotExist {
margin:20px 0 10px;
}

.groupmembership .member a {
color:#222;
text-decoration:none;
}

.groupmembership .leavegroup {
color:#015ba7;
font-weight:700;
}

.groupmembership .nonmember img,.groupmembership .check,.grouprole .check,.grouprequest .acceptedIcon,.grouprequest .declinedIcon {
height:15px;
width:15px;
vertical-align:text-top;
}

.groupmembership .member .check {
background:transparent url(/img/feeds/follow_sprite.png) no-repeat 0 -27px;
}

.groupmembership .owner .check,.grouprole .owner .check,.groupmembership .manager .check {
background:url(/img/chatter/chatter_photo_icons.png?v=182-1) no-repeat 0 -66px;
}

.groupmembership .nonmemberrequest .check {
background:transparent url(/img/feeds/follow_disabled.png) no-repeat 0 0;
}

.grouprequest .acceptedIcon {
background:transparent url(/img/feeds/groups_requestupdated_sprite.png) no-repeat 0 0;
}

.grouprequest .declinedIcon {
background:transparent url(/img/feeds/groups_requestupdated_sprite.png) no-repeat 0 -15px;
}

div.groupmembership a .actionIcon {
height:15px;
width:15px;
margin-left:2px;
background:transparent url(/img/feeds/follow_sprite.png) no-repeat 0 -54px;
vertical-align:text-top;
}

.thumbnailPanel {
overflow-x:hidden;
overflow-y:hidden;
}

.thumbnailPanel .thumbnailTable {
border-spacing:0;
}

.thumbnailPanel .thumbnailTable td {
vertical-align:top;
padding:0 4px 4px 0;
}

.thumbnailPanel .entitiesList {
white-space:nowrap;
margin:0 0 10px;
}

.thumbnailPanel .entitiesList ul,.thumbnailPanel .entitiesList li {
padding-left:0;
margin-left:0;
list-style-type:none;
}

.thumbnailPanel .entitiesList li {
margin-bottom:3px;
}

.thumbnailPanel .entitiesList a.entityLink img {
float:left;
margin-right:3px;
}

.thumbnailPanel .entitiesList a.entityLink span {
line-height:16px;
}

.thumbnailPanel .groupList ul {
padding-left:0;
list-style-type:none;
margin:0;
}

.thumbnailPanel .groupList li {
height:32px;
margin-left:0;
margin-bottom:7px;
}

.thumbnailPanel .groupThumbnail {
float:left;
position:relative;
}

.thumbnailPanel .groupLabel {
margin-left:40px;
}

.thumbnailPanel .groupLabel>div {
white-space:nowrap;
overflow:hidden;
text-overflow:ellipsis;
}

a.contentActionLink img {
background:transparent url(/img/chatterfiles/chatterfiles16_sprite.png) no-repeat;
height:16px;
width:16px;
}

a.contentActionLink .downloadItemIcon {
background-position:0 -20px;
}

.fileTypeIcon img.filePrivateIcon {
top:6px;
left:7px;
}

.PeopleListPage .listViewport .topNav .controls,.GroupListPage .listViewport .topNav .controls {
padding-left:0;
padding-bottom:0;
}

.groupDescription {
color:#222;
}

.FileTabPage .listViewport .quickfindContainer,.PeopleListPage .listViewport .quickfindContainer,.GroupListPage .listViewport .quickfindContainer {
padding-right:7px;
padding-top:5px;
}

.PeopleListPage .listViewport .quickfindContainer,.GroupListPage .listViewport .quickfindContainer {
padding-bottom:5px;
}

.ChatterPage .listViewport .multiUploadControl .quickfindContainer {
margin-top:4px;
}

.FileTabPage .listViewport .quickfindContainer .x-form-field-wrap,.PeopleListPage .listViewport .quickfindContainer .x-form-field-wrap,.GroupListPage .listViewport .quickfindContainer .x-form-field-wrap {
background:? url(/img/func_icons/textbg.gif) repeat scroll 0 1px transparent;
}

.FileTabPage .listViewport .quickfindContainer .quickfindInput,.PeopleListPage .listViewport .quickfindContainer .quickfindInput,.GroupListPage .listViewport .quickfindContainer .quickfindInput,.chatterListOverlay .quickfindContainer .quickfindInput {
font-size:1em;
background-color:transparent;
-moz-border-radius:5px;
-moz-box-shadow:0 1px 1px #969696 inset;
border-color:#b6b6b6;
border-style:solid;
border-width:1px;
margin:0;
}

.FileTabPage .listViewport .quickfindContainer .x-form-empty-field,.PeopleListPage .listViewport .quickfindContainer .x-form-empty-field,.GroupListPage .listViewport .quickfindContainer .x-form-empty-field {
color:#666;
}

.FileTabPage .listViewportWrapper .listViewport .topNav .topNavTab img,.PeopleListPage .listViewportWrapper .listViewport .topNav .topNavTab img,.GroupListPage .listViewportWrapper .listViewport .topNav .topNavTab img {
margin:0 0 0 3px;
}

.chatterpeoplelistpage {
width:969px;
}

.chatterpeoplelistpage .peopleListView {
width:754px;
float:left;
}

.chatterthreecolumnlistview .listViewportWrapper .listViewport .topNav .topNavTab {
float:right;
font-size:93%;
margin-right:-214px;
margin-top:16px;
}

.chatterthreecolumnlistview .chatterlvthirdcolumn {
margin-top:70px;
width:205px;
float:right;
}

.privateGroupLabel,.privateFileLabel {
background:transparent url(/img/chatter/private_group_icon.gif?v=182-1) no-repeat scroll left center;
padding-left:13px;
color:#cf700b;
vertical-align:middle;
margin-left:5px;
}

.chatterFileListView .fileNameLink,.chatterFileListBlock .fileNameLink,.fileBlock .pbBody a.fileNameLink {
color:#015ba7;
font-weight:700;
text-decoration:none;
}

.chatterFileListBlock .x-grid3-row .x-grid3-cell-inner {
margin-left:4px;
}

a.contentActionLink .externalSourceSmallIcon.sprite-doctype_external_16,.externalSourceSmallIcon.sprite-doctype_external_16 {
background:url(/sfc/images/docicons/doctype_16_sprite.png) no-repeat scroll 0 0 transparent;
width:16px;
height:16px;
background-position:0 -338px;
}

.listBody .x-grid3-col-title .externalSourceSmallIcon,table.list .x-grid3-col-title .externalSourceSmallIcon {
position:relative;
float:right;
margin-right:4px;
vertical-align:middle;
}

.componentAlert {
vertical-alig:top;
}

.offscreen {
position:absolute;
left:-9999px;
}

.fileTypeIcon img {
background:url(/sfc/images/docicons/doctype_16_sprite.png) no-repeat scroll 0 0 transparent;
width:16px;
height:16px;
}

.fileTypeIcon .sprite-doctype__16 {
background-position:0 0;
}

.fileTypeIcon .sprite-doctype_ai_16 {
background-position:0 -26px;
}

.fileTypeIcon .sprite-doctype_audio_16 {
background-position:0 -52px;
}

.fileTypeIcon .sprite-doctype_csv_16 {
background-position:0 -78px;
}

.fileTypeIcon .sprite-doctype_eps_16 {
background-position:0 -104px;
}

.fileTypeIcon .sprite-doctype_excel_16 {
background-position:0 -130px;
}

.fileTypeIcon .sprite-doctype_exe_16 {
background-position:0 -156px;
}

.fileTypeIcon .sprite-doctype_flash_16 {
background-position:0 -182px;
}

.fileTypeIcon .sprite-doctype_gdoc_16 {
background-position:0 -208px;
}

.fileTypeIcon .sprite-doctype_gpres_16 {
background-position:0 -234px;
}

.fileTypeIcon .sprite-doctype_gsheet_16 {
background-position:0 -260px;
}

.fileTypeIcon .sprite-doctype_html_16 {
background-position:0 -286px;
}

.fileTypeIcon .sprite-doctype_image_16 {
background-position:0 -312px;
}

.fileTypeIcon .sprite-doctype_link_16 {
background-position:0 -338px;
}

.fileTypeIcon .sprite-doctype_mp4_16 {
background-position:0 -364px;
}

.fileTypeIcon .sprite-doctype_pack_16 {
background-position:0 -390px;
}

.fileTypeIcon .sprite-doctype_pdf_16 {
background-position:0 -416px;
}

.fileTypeIcon .sprite-doctype_ppt_16 {
background-position:0 -442px;
}

.fileTypeIcon .sprite-doctype_psd_16 {
background-position:0 -468px;
}

.fileTypeIcon .sprite-doctype_rtf_16 {
background-position:0 -494px;
}

.fileTypeIcon .sprite-doctype_slide_16 {
background-position:0 -520px;
}

.fileTypeIcon .sprite-doctype_txt_16 {
background-position:0 -546px;
}

.fileTypeIcon .sprite-doctype_unknown_16 {
background-position:0 -572px;
}

.fileTypeIcon .sprite-doctype_video_16 {
background-position:0 -598px;
}

.fileTypeIcon .sprite-doctype_visio_16 {
background-position:0 -624px;
}

.fileTypeIcon .sprite-doctype_webex_16 {
background-position:0 -650px;
}

.fileTypeIcon .sprite-doctype_word_16 {
background-position:0 -676px;
}

.fileTypeIcon .sprite-doctype_xml_16 {
background-position:0 -702px;
}

.fileTypeIcon .sprite-doctype_zip_16 {
background-position:0 -728px;
}

.chatterFileListBlock .fileTypeIcon {
display:inline-block;
width:23px;
}

.chatterFileListBlock .fileTypeIcon .orgItemIcon,.chatterFileListBlock .fileTypeIcon .lockItemIcon,.chatterFileListBlock .fileTypeIcon .sharedItemIcon {
background:#fff url(/img/chatterfiles/chatterfiles16_sprite.png) no-repeat;
position:relative;
width:14px;
height:14px;
top:9px;
left:-11px;
}

.chatterFileListBlock .fileTypeIcon .orgItemIcon {
background-position:0 -291px;
}

.chatterFileListBlock .fileTypeIcon .lockItemIcon {
background-position:0 -272px;
}

.chatterFileListBlock .fileTypeIcon .sharedItemIcon {
background-position:0 -256px;
}

.chatterFilesTabPage div.chatterFileListBlock {
margin-bottom:100px;
}

#manageUserButton {
border:0;
background:none transparent;
right:0;
left:0;
white-space:normal;
display:inline;
padding:0 0 4px;
}

#manageUserLabel {
color:#015ba7;
font-size:1.1em;
font-weight:400;
margin-right:6px;
white-space:nowrap;
}

.manageUser .mbrButtonArrow,.manageUser .menuButtonOver .mbrButtonArrow {
background:url(/img/alohaSkin/header_mutton.png) no-repeat scroll left -135px transparent;
float:right;
height:9px;
width:8px;
margin-top:2px;
}

.manageUser .menuButtonActivated .mbrButtonArrow,.manageUser .menuButtonOver .mbrButtonArrow {
background:url(/img/alohaSkin/header_mutton.png) no-repeat scroll left -143px transparent;
}

#manageUserMenu {
background:none #fff;
left:1px;
right:auto;
border:0 none;
-moz-border-radius:5px;
-webkit-border-radius:5px;
margin-top:2px;
padding:2px;
}

#manageUserMenu a {
color:#333435;
-moz-border-radius:11px;
-webkit-border-radius:11px;
text-decoration:none;
margin:0 4px;
padding:4px 16px;
}

.topicWidget {
color:#015ba7;
margin-bottom:20px;
}

.topicDescription {
padding-top:6px;
}

div.topicBoxHeader,.influenceBoxHeader {
border-bottom:1px solid #d4dadc;
height:1.2em;
padding-bottom:3px;
}

.topicsActionListPanel {
padding-top:8px;
}

.topicsActionListPanel .editItemIcon {
background:url(/img/chatterfiles/chatterfiles16_sprite.png) no-repeat scroll 0 0 transparent;
height:16px;
width:16px;
background-position:0 -146px;
text-decoration:none;
}

h3.topicWidgetHeader {
float:left;
font-weight:700;
color:#000;
}

.noTopics {
margin-top:6px;
color:#000;
}

ul.topicUl {
margin-top:2px;
padding-left:0;
margin-left:0;
}

li.topicLi {
white-space:nowrap;
overflow:hidden;
text-overflow:ellipsis;
line-height:1.5em;
margin:0;
}

li.topicLi.selected {
background:url(/img/chatter/filter_bg_active.png) top left no-repeat;
}

.selected a.topicLink.mostUsedTopicLink {
text-decoration:none;
cursor:default;
color:#333435;
font-weight:700;
}

li.mostUsedTopicLi {
background-color:transparent;
height:1.5em;
padding-top:2px;
padding-bottom:2px;
padding-left:4px;
}

table.influence {
width:200px;
padding-bottom:15px;
table-layout:fixed;
margin-top:12px;
}

td.influenceSection {
width:33.333%;
vertical-align:top;
padding:0 3px 2px;
}

td.influenceSection.border {
border-right-width:1px;
border-right-style:solid;
border-color:#d7dbde;
}

.influenceNumber {
font-size:1.24em;
font-weight:700;
line-height:15px;
}

.influenceText {
font-size:.92em;
line-height:11px;
color:#7d7d84;
overflow:hidden;
text-overflow:ellipsis;
}

.influenceNumber.dim {
font-weight:400;
color:#7d7d84;
}

.influenceInfo {
width:16px;
height:16px;
background:transparent url(/img/alohaSkin/info_sprite.png) no-repeat scroll 0 0;
float:right;
margin-top:-2px;
}

.influenceHover {
width:338px;
}

.influenceHover h3 {
fontheight:1.2em;
}

.influenceHoverInfo {
margin:0;
padding:0;
}

.influenceHoverInfo li {
margin-left:1.3em;
}

.influenceHover .influence-widget {
margin:12px 0;
}

.topicSearchNameBox a,.topicSearchDescriptionBox a {
color:#015ba7;
font-weight:400;
text-decoration:none;
}

.topicSearchNameBox,.topicSearchDescriptionBox {
padding-top:2px;
padding-bottom:4px;
}

.topicSearchAction {
color:#9d9d9d;
padding-right:5px;
}

.topicPage .profileHeaderLinks {
font-size:.9em;
white-space:nowrap;
text-decoration:none;
position:absolute;
right:0;
top:10px;
}

.chatterFileListBlock .contentActionMenu .more-file-actions {
position:absolute;
top:-18px;
left:0;
}

.chatterFileListBlock .chatterFollowUnfollowAction {
margin-right:6px;
margin-left:6px;
margin-top:-2px;
}

.chatterFileListBlock .emptyActionIcon {
width:16px;
height:16px;
margin-bottom:-2px;
}

.chatterFileListBlock .contentActionMenu {
padding:0 5px 5px 13px;
}

.chatterFileListBlock .more-file-actions>.content-action-link-arrow {
background:transparent url(/img/chatter/menuArrow.png) no-repeat scroll 0 0;
height:16px;
width:16px;
}

.chatterFileListBlock .contentActionMenu .more-file-actions>.content-action-link-arrow {
background:transparent url(/img/chatter/menuArrow.png) no-repeat scroll 0 -48px;
}

.chatterFileListBlock .x-grid3-row-over .more-file-actions>.content-action-link-arrow {
background:transparent url(/img/chatter/menuArrow.png) no-repeat scroll 0 -16px;
}

.chatterFileListBlock .externalUserSpacer {
padding-left:24px;
float:right;
}

.chatterFileListBlock .externalUserSpacerMiddle {
padding-left:6px;
}

.chatterFileListBlock a.contentActionLink .uploadIcon {
background-position:0 -40px;
}

.chatterFileListBlock a.contentActionLink .publishItemIcon {
background-position:0 -405px;
}

.chatterFileListBlock a.contentActionLink .emptyIcon {
background-position:0 100px;
}

.chatterFileListBlock .contentActionMenu .noIcon {
padding-left:23px;
}

.chatterFileListBlock .contentActionLink .previewItemIcon {
margin-bottom:-2px;
}

.chatterFileListBlock .topNav,.chatterFileListBlock .subNav,.chatterFileListBlock .bottomNav,.chatterFileListBlock .x-grid3-header {
overflow:hidden;
}

.FindLinkedFilesPage .chatterFileListBlock .listBody,.FindLinkedFilesPage .chatterFileListBlock .x-grid3,.FindLinkedFilesPage .chatterFileListBlock .listBody .x-panel-bwrap,.FindLinkedFilesPage .chatterFileListBlock .x-grid3-viewport {
overflow:auto;
}

.FindLinkedFilesPage .chatterFileListBlock .x-grid3-scroller {
overflow-y:auto;
overflow-x:hidden;
}

.fileListPage .x-grid3-row,.chatterFileListView .x-grid3-row {
border-right-width:0;
}

.fileListPage .x-grid3-row-last,.chatterFileListView .x-grid3-row-last {
border-bottom-width:0;
}

.chatterFileListBlock .x-grid-panel .x-panel-body {
overflow:visible!important;
}

.chatterFileListView a.fileNameLink {
padding-left:2px;
}

.quickfindInputNoSearchIcon {
background-color:transparent;
height:17px;
border-color:#858585 #c1c1c1 #d8d8d8;
border-style:solid;
border-width:1px;
}

.chatterFileListBlock .controls .uploadFile {
float:left;
margin-right:8px;
margin-top:5px;
}

.chatterFileListBlock .multiUploadControl .dragDropZoneDiv,.chatterFileListBlock .multiUploadControl .dragDropZoneDivNoBorder {
width:461px;
margin-top:5px;
margin-right:12px;
margin-bottom:4px;
padding:6px 1px 7px 3px;
}

.chatterFileListBlock .multiUploadControl .dragDropZoneDiv {
border:1px dashed #b6b6b6;
}

.chatterFileListBlock .controls .uploadFile .btnImportant {
padding-bottom:0;
padding-top:4px;
height:17px;
}

.chatterFileListBlock .multiUploadControl .dragDropZoneDiv .btnImportant {
padding-bottom:5px;
padding-top:5px;
height:22px;
}

.chatterFileListBlock .multiUploadControl .dragDropZoneButton {
-moz-box-shadow:0 0 0;
-webkit-box-shadow:0 0 0;
box-shadow:0 0 0;
}

.chatterFileListBlock .multiUploadControl .dragDropZoneDiv .dragDropZoneButton {
display:inline;
padding-top:6px;
}

.chatterFileListBlock .multiUploadControl .uploadFile .multifile-upload-draganddrop-indicactor {
position:absolute;
color:#7d7d84;
display:inline;
margin:4px;
}

.chatterFileListBlock .multiUploadControl .dragDropZoneDivNoBorder .dragDropZoneButton {
height:100%;
display:inline-block;
padding:6px 5px 5px;
}

.chatterFileListBlock .multiUploadControl .dragDropZoneDivNoBorder .dragDropZoneButton .uploadFileButtonLink {
margin-left:3px;
margin-right:3px;
}

.chatterFileListBlock .multiUploadControl .uploadFile .multifile-upload-draganddrop-indicactor-tip {
font-weight:700;
color:#f07e05;
}

.chatterFileListBlock .controls .uploadFile .btnImportant .uploadFileButtonLink {
color:#fff;
font-weight:700;
font-size:.95em;
text-decoration:none;
}

.chatterFileListBlock .controls .uploadFile .btnImportant .wrapper {
line-height:12px;
padding-top:4px;
}

.chatterFileListBlock .controls .uploadFile .uploadArrow {
vertical-align:middle;
padding-right:2px;
}

.chatterFileListBlock .controls .uploadFile .uploadArrowWithMorePadding {
padding-bottom:4px;
}

.chatterFileListBlock .multiUploadControl .dragDropZoneDivNoBorder .uploadArrow {
vertical-align:middle;
padding-bottom:0;
}

.chatterFileListBlock .multiUploadControl .dragDropZoneDiv .uploadArrow {
vertical-align:bottom;
padding-bottom:4px;
}

.chatterFileListBlock .blueBar {
width:100%;
background-color:#f8f8f8;
border-bottom:0;
border-top:3px solid #1797c0;
margin-top:6px;
padding:2px 5px 0;
}

.chatterFileListView .listViewportWrapper .listViewport .topNav {
margin:0;
}

.listViewportWrapper .chatterFileListBlock .topNav .controls .title {
font-size:1.2em;
font-weight:700;
color:#222;
margin-left:10px;
margin-top:6px;
}

.chatterFileListView .listViewportWrapper .listViewport .subNav .linkBar {
border-top:0;
}

.chatterFileListBlock .listBody {
margin-top:-18px;
}

.chatterFileListBlock .quickfindContainer .quickfindInput {
font-size:1em;
background-color:transparent;
border-color:#858585 #c1c1c1 #d8d8d8;
border-style:solid;
border-width:1px;
margin:0;
}

.chatterFileListBlock .fileNameWithMaxWidth {
display:inline-block;
overflow:hidden;
margin:0 0 -4px;
}

.FileTabPage .chatterFileListBlock .fileNameWithMaxWidth,.ChatterPage .chatterFileListBlock .fileNameWithMaxWidth,.UnifiedSearchResults .chatterFileListBlock .fileNameWithMaxWidth,.UserFileListPage .chatterFileListBlock .fileNameWithMaxWidth,.GroupFileListPage .chatterFileListBlock .fileNameWithMaxWidth,.FindLinkedFilesPage .chatterFileListBlock .fileNameWithMaxWidth {
text-overflow:ellipsis;
white-space:nowrap;
}

.FileTabPage .chatterFileListBlock .fileNameWithMaxWidth,.ChatterPage .chatterFileListBlock .fileNameWithMaxWidth {
max-width:310px;
}

.UserFileListPage .chatterFileListBlock .fileNameWithMaxWidth,.GroupFileListPage .chatterFileListBlock .fileNameWithMaxWidth {
max-width:520px;
}

.FindLinkedFilesPage .chatterFileListBlock .fileNameWithMaxWidth {
max-width:290px;
}

.UnifiedSearchResults .chatterFileListBlock .publishToLibBadgePanel.withMargin {
margin:0 0 -1px;
}

.UnifiedSearchResults .chatterFileListBlock .fileTypeIcon {
width:25px;
}

.canvasAppNavigationItem .icon {
background-image:none;
}

.threecolumn,.userProfilePage,.chatterFilesTabPage .chatterFilesTabPageHeader,.PeopleListPage .listViewportWrapper .listViewport .topNav,table.statusPromptAndInput {
margin-top:2px;
}

.threecolumn .centerContent,.chatterFileListBlock .contentActionMenu .blockLinkItem.emptyIcon {
padding-left:8px;
}

.threecolumn .headerContent .helpLinkElement,.threecolumn .headerContent .videoLinkElement {
font-size:.9em;
text-decoration:none;
}

.chatterPage .chatterUserStatus .chatterUserStatusImg,.chatterFileListBlock .controls .quickfindContainer {
float:left;
}

.chatterPage .chatterUserStatus .chatterUserStatusName a:hover,.chatterDeprecationMessage .messageText a:hover,.GroupProfilePage .groupDoesNotExist a:hover,.groupEditPage .groupDoesNotExist a:hover,.groupmembership a.asktojoin:hover span,.groupmembership a:hover span,.grouprole a:hover,.menuButtonOver #manageUserLabel,a.noTopicsLink,.chatterFileListView .x-grid3-col-title a:hover {
text-decoration:underline;
}

.groupListPage .listBody,.chatterFileListView .listViewportWrapper .listViewport .listBody {
margin-top:-12px;
}

.groupListPage .x-grid-empty a,.groupListPage a.ownername:hover,.searchResults a.ownername:hover,.chatterNavigationGroup a.learnMore,.groupmembership .asktojoin,#manageUserMenu a:hover,.chatterFileListView .uploadFileLink {
color:#015ba7;
}

.groupListPage .groupinfo a,.searchResults .groupinfo a,.chatterNavigationGroup .subNavSection .selected a,.topicSearchNameBox a,.chatterFileListBlock .multiUploadControl .uploadFile .multifile-upload-draganddrop-indicactor-help {
font-weight:700;
}

.groupListPage .groupinfo,.searchResults .groupinfo,.groupListPage .lastactivity,.searchResults .lastactivity {
white-space:normal;
}

.groupListPage .ownerSection,.searchResults .ownerSection,.groupListPage .memberCountContainer,.searchResults .memberCountContainer,.followingEntitiesList,.followingEntitiesList a {
white-space:nowrap;
}

.groupListPage .listViewport .topNav .title,.PeopleListPage .listViewport .topNav .title,.contentActionLabel {
font-weight:400;
}

.groupListPage .listViewportWrapper .listViewport .topNav .pageTitleIcon,.PeopleListPage .listViewportWrapper .listViewport .topNav .pageTitleIcon,.thumbnailPanel .entitiesList ul,body.PeopleListPage .listViewport .subNav div.linkBar,body.GroupListPage .listViewport .subNav div.linkBar {
margin-top:0;
}

.cantDoActionText,.profileSection .panelEmptyContent,.groupmembership .requested,.thumbnailPanel .groupList .memberCount {
color:#7d7d84;
}

.userProfilePage a,.filesDetailPage a,.GroupProfilePage .groupDoesNotExist a,.groupEditPage .groupDoesNotExist a,a.topicLink {
color:#015ba7;
text-decoration:none;
}

.chatterPage .threecolumn .centerContent,.filesDetailPage .threecolumn .centerContent,.chatterPage .feedcontainer .feedcontainer,td.influenceSection.left {
padding-left:0;
}

.chatterNavigationGroup.feedFavoriteNavigation .zeroListItemContainer,.groupListFilters .trigger {
padding-left:5px;
}

.chatterNavigationGroup .overflow,.groupmembership .invisible,.chatterPage .hide,.recentFilesPanel .entityId,.recentRecordsPanel .entityId {
display:none;
}

.chatterNavigationGroup li.cxhover a.delete,.chatterNavigationGroup .selected a.delete,.chatterNavigationGroup a.delete.isAccessible,.groupmembership .visible,.chatterFileListBlock .contentActionMenu .blockLinkItem a {
display:block;
}

.UnifiedSearchResults #favoriteWidget,.manageUser,.versionOverlayList .publishToLibBadgePanel {
float:right;
}

.removeFavoriteButton.active,div.groupmembership a:hover .actionIcon,div.groupmembership a .actionIcon.active {
background:transparent url(/img/feeds/follow_sprite.png) no-repeat 0 -75px;
}

.chatterNavigationGroup .primaryNavSection,.groupListFilters .grouplistfilterheader {
line-height:23px;
height:23px;
}

.chatterNavigationGroup a,.groupListFilters a,.userProfilePage .helpIcon,.threecolumn .headerContent .helpIcon,.panelGridLabelLink,.groupmembership a,body .grouprole a,.menuButtonActivated #manageUserLabel {
text-decoration:none;
}

.feedLinkDiv a,.threecolumn .headerContent .helpIcon {
vertical-align:bottom;
}

.followersList td,.chatterFileListBlock .topNav .controls {
padding:0;
}

.thumbnailPanel .groupOwnerContainer,.fileTypeIcon,.chatterthreecolumnlistview {
position:relative;
}

a.contentActionLink .previewItemIcon,a.contentActionLink .openUrlItemIcon {
background-position:0 -2px;
}

.PeopleListPage .listViewport .topNav .controls .pageTitleIcon,.collaborationGroupTab .pageTitleIcon,.individualPalette .collaborationGroupBlock .pageTitleIcon {
background-repeat:no-repeat;
}

.FileTabPage .listViewport .multiUploadControl .quickfindContainer,.UserFileListPage .listViewport .multiUploadControl .quickfindContainer,.GroupFileListPage .listViewport .multiUploadControl .quickfindContainer,.chatterFileListBlock .multiUploadControl .dragDropZoneDivNoBorder .multifile-upload-draganddrop-indicactor {
margin-top:7px;
}

.chatterPage .invisible,.chatterFileListBlock .controls #fileUploaderDiv {
visibility:hidden;
}

.chatterFileListView,.chatterFileListBlock .listBody,.chatterFileListBlock .x-grid3,.chatterFileListBlock .x-grid3-scroller,.chatterFileListBlock .listBody .x-panel-bwrap,.chatterFileListBlock .x-grid3-viewport {
overflow:visible;
}

.chatterFileListBlock .fileTypeIcon img.filePrivateIcon,.chatterFileListView .fileTypeIcon img.filePrivateIcon,.recentFilesPanel .fileTypeIcon img.filePrivateIcon,.recentRecordsPanel .fileTypeIcon img.filePrivateIcon {
left:9px;
top:8px;
border:0;
}







.chatterListViewHeader h2 {
font-size:1.2em;
margin-right:20px;
}

.chatterListViewHeader {
padding-bottom:6px;
border-bottom:2px solid #1797c0;
margin-bottom:8px;
}

.chatterListViewContainer .listViewport .topNav .controls,.chatterListViewContainer .quickfindContainer,.PeopleListPage .listViewport .quickfindContainer {
height:1%;
padding:0;
}

.PeopleListPage .listViewport .quickfindContainer {
clear:both;
border-top:2px solid #1797c0;
padding-top:8px;
}

.PeopleListPage .listViewportWrapper .listViewport .topNav h2.title {
font-size:1.2em;
font-weight:700;
margin:0 40px 5px 0;
}

.PeopleListPage #viralInviteMembersButtonId {
position:relative;
margin:0 0 5px;
}

.PeopleListPage .listViewportWrapper .listViewport .topNav img.pageTitleIcon {
background-image:url(/img/chatter/sprites/sprite_images/chattersupersprite.png?v=182-4);
background-position:0 -629px;
width:16px;
height:16px;
margin-top:2px;
}

.chatterListViewContainer .listViewport .topNav .controls .filterLinks,.chatterListViewContainer .listViewport .topNav .controls .divisionLabel,.chatterListViewContainer .listViewport .topNav .controls .topNavTab,.chatterListViewContainer .listViewport .topNav .controls .clearingBox,.chatterListViewContainer .subNav,.chatterFileListBlock .blueBar {
display:none;
}

.chatterListViewContainer .listViewport .topNav .controls {
margin-bottom:8px;
}

.chatterListViewContainer .listViewportWrapper .listViewport .x-grid3-hd-row>td {
padding:4px 0 5px;
}

.quickfindInput.ghost {
color:#999;
}

.lowerMainContent .centerContent .quickfindInput,.lowerMainContent .wholeContent .quickfindInput {
border:1px solid #b6b6b6;
border-radius:5px 5px 5px 5px;
box-shadow:0 1px 1px #969696 inset;
height:18px;
outline:medium none;
width:160px;
font-size:1.1em;
padding:2px 3px 2px 22px;
}

.quickfindContainer .quickfindInput {
background-position:3px 3px;
}

.chatterListViewContainer .chatterListViewHeader h2 .icon {
display:inline-block;
margin-right:5px;
vertical-align:middle;
}

.groupListPage .chatterListViewHeader h2 .icon {
background-image:url(/img/chatter/sprites/sprite_images/chattersupersprite.png?v=182-4);
background-position:0 -489px;
width:16px;
height:16px;
margin-top:2px;
}

.chatterTabNavigation .feedTypeList .icon {
background-image:url(/img/chatter/sprites/sprite_images/chattersupersprite.png?v=182-4);
background-position:0 -229px;
width:16px;
height:16px;
}

.chatterTabNavigation .peopleListView .icon {
background-image:url(/img/chatter/sprites/sprite_images/chattersupersprite.png?v=182-4);
background-position:0 -629px;
width:16px;
height:16px;
}

.chatterTabNavigation .groupListView .icon {
background-image:url(/img/chatter/sprites/sprite_images/chattersupersprite.png?v=182-4);
background-position:0 -489px;
width:16px;
height:16px;
}

div.chatterListViewContainer div.listViewportWrapper td.x-grid3-td-MyRole,div.chatterListViewContainer div.listViewportWrapper td.x-grid3-td-IS_FOLLOWING,div.chatterListViewContainer div.listViewportWrapper td.x-grid3-td-following {
border-right:none;
}

.listViewport .bottomNav {
height:15px;
}

div.fileListPage .quickfindContainer {
float:left;
}

.fileListPage .controls .uploadFileInfo {
margin-top:3px;
}

.fileListPage .topNav {
padding-bottom:5px;
}

.chatterTabBookmarkIcon {
background-image:url(/img/chatter/sprites/sprite_images/chattersupersprite.png?v=182-4);
background-position:0 -289px;
width:16px;
height:16px;
vertical-align:middle;
}

.guidedTourImpactText {
font-weight:700;
}

.x-grid3-row {
border-bottom:1px solid #ededed;
border-right:1px solid #ededed;
}

.x-grid3-scroller {
background:#fff;
}

.x-grid3-cell-inner {
white-space:nowrap;
text-overflow:ellipsis;
width:auto;
overflow:hidden;
padding:5px 3px 5px 5px;
}

.x-grid3 table {
table-layout:fixed;
}

.x-form-empty-field {
color:gray;
}

.x-form-field-wrap,.x-grid3-hd-inner {
white-space:nowrap;
}

.x-grid-empty {
color:gray;
font:1em arial;
padding:10px;
}

.listViewportWrapper .listViewport .x-grid3-hd-row a.x-grid3-hd-btn {
border:none;
}

.chatterListViewContainer .listViewportWrapper .listViewport .topNav,.groupListPage .listViewport .topNav .controls,.groupListPage .listBody,.chatterFileListBlock div.listBody,.fileListPage .controls .uploadFile {
margin-top:0;
}

.TopicListPage .chatterListViewHeader h2 .icon,.chatterTabNavigation .topicListView .icon {
background-image:url(/img/chatter/sprites/sprite_images/chattersupersprite.png?v=182-4);
background-position:0 -929px;
width:16px;
height:16px;
}

.chatterFileListView .chatterListViewHeader h2 .icon,.chatterTabNavigation .fileListView .icon {
background-image:url(/img/chatter/sprites/sprite_images/chattersupersprite.png?v=182-4);
background-position:0 -469px;
width:16px;
height:16px;
}









