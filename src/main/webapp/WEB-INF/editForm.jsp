<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Languages</title>
 	<link rel="stylesheet" type="text/css" href="../css/style.css">
</head>
	<div id="navbar">
		<a href="/">Dashboard</a>
		<span>x</span>
		<a href="/delete/${language.id }">Delete</a>
	</div>

	<form:form method="POST" action="/processEdit/${language.id}" modelAttribute="language">
		<form:label path="languageName">Language
		<form:errors path="languageName"/>
		<span>xxxxxxx</span>
		<form:input path="languageName"/></form:label>
		
		<form:label path="creatorName">Creator
		<form:errors path="creatorName"/>
		<span>xxxxxxxxx</span>
		<form:input path="creatorName"/></form:label>
		
		<form:label path="version">Version
		<form:errors path="version"/>
		<span>xxxxxxxxx</span>
		<form:input path="version"/></form:label>
				
		<input type="submit" value="Submit" id="editSubmit"/>
	</form:form>

</body>
</html>