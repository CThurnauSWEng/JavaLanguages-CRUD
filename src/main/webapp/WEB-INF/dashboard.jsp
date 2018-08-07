<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Languages</title>
 	<link rel="stylesheet" type="text/css" href="css/style.css">
</head>

<body>
	<table>
		<thead>
			<tr>
				<th>Id</th>
				<th>Language</th>
				<th>Creator</th>
				<th>Version</th>
				<th>Action</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items = "${allLanguages }" var = "language">
			<tr>
				<td><c:out value="${language.id}"/></td>
				<td>
					<a href="/${language.id}">
						<c:out value="${language.languageName}"/></a>
				</td>
				<td><c:out value="${language.creatorName}"/></td>
				<td><c:out value="${language.version}"/></td>
				<td>
					<a href="/edit/${language.id}">Edit</a>
					<a href="/delete/${language.id}">Delete</a>											
				</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	<p></p>

	<form:form method="POST" action="/new" modelAttribute="language">
		<form:label path="languageName">Language
		<form:errors path="languageName"/>
		<form:input path="languageName" id="languageInput"/></form:label>
		
		<form:label path="creatorName">Creator
		<form:errors path="creatorName"/>
		<form:input path="creatorName" id="creatorInput"/></form:label>
		
		<form:label path="version">Version
		<form:errors path="version"/>
		<form:input path="version" id="versionInput"/></form:label>
				
		<input type="submit" value="Submit" id="newSubmit"/>
	</form:form>

</body>
</html>