<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Hello Page</title>
</head>
<body>
    <h1>Hello from JSP!</h1>
<c:forEach var="item" items="${list}">
    <span>${item}</span>
</c:forEach>
</body>
</html>
