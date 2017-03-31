<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!--#include file="../../ioRDFunctions.asp"-->
<html>
	<head>
		<title>Tool: Show Current Session</title>
		<meta http-equiv="expires" content="0" />
		<meta name="developer" content="Thomas Pollinger" />
		<meta name="version" content="1.0.0.6" />
		<link rel="stylesheet" type="text/css" href="css/showSession.css" />
		<script type="text/javascript" src="js/showSession.js"></script>
	</head>
	<body>
<%
	function bubblesort(arrSortieren)
		for i = 0 to ubound(arrSortieren)
			for j = i+1 to ubound(arrSortieren)
				if arrSortieren(i)>arrSortieren(j) then
					arrTemp = arrSortieren(i)
					arrSortieren(i) = arrSortieren(j)
					arrSortieren(j) = arrTemp
				end if
			next
		next
		bubblesort = arrSortieren
	end function
	z = 0
	redim arrData(Session.Contents.Count-1)
	for each x in Session.Contents
		if (x <> "PageHtmlCode") then
			arrData(z) = x
			z = z + 1
		end if
	next
	arrDataSort = bubblesort(arrData)
	response.write "<select class='ioSelect' onchange='jumpTo(this.value)'>"
	response.write "<option>...select session variable for direct jump...</option>"
	for x = 0 to ubound(arrDataSort)
		response.write "<option value='id" & arrDataSort(x) & "'>" & arrDataSort(x) & "</option>"
	next
	response.write "</select>"	
	for x = 0 to ubound(arrDataSort)
		response.write "<a name='id" & arrDataSort(x) & "'><br /></a><b>" & arrDataSort(x) & "</b><hr /><textarea onfocus='this.select()'>" & Session(arrDataSort(x)) & "</textarea><hr />"
	next
%>
	</body>
</html>
