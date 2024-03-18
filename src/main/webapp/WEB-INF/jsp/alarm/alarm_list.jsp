<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>this is alarm page</title>
</head>
<body>
    <h1>Hello from JSP!</h1>
    <c:forEach var="alarm" items="${alarms}">
        <p>${alarm.message}</p>
    </c:forEach>
</body>
</html>