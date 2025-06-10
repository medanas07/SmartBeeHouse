
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<html>
<head><title>Liste des Ruches</title></head>
<body>
<h2>Liste des Ruches</h2>
<table border="1">
    <tr><th>ID</th><th>Code</th><th>Site ID</th><th>Farmer ID</th></tr>
    <c:forEach var="hive" items="${hives}">
        <tr>
            <td>${hive.id}</td>
            <td>${hive.code}</td>
            <td>${hive.siteId}</td>
            <td>${hive.farmerId}</td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
