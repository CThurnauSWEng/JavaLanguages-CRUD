<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Language Details</title>
 	<link rel="stylesheet" type="text/css" href="css/style.css">
</head>

<body>
	<a href="/" class="homeIndent">Dashboard</a>
	<h1 class="detailIndent"><c:out value='${language.languageName }'/></h1>
	<h2 class="detailIndent"><c:out value='${language.creatorName }'/></h2>
	<h2 class="detailIndent"><c:out value='${language.version }'/></h2>
	<p></p>
	<a href="/edit/${language.id }" class="detailIndent">Edit</a>
	<a href="/delete/${language.id }" class="detailIndent">Delete</a>
	<p></p>
</body>
</html></html>