<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
    <title>Hello Page</title>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=63e52530f05ff3afd5fe6e56e3f067a4&libraries=services,clusterer,drawing"></script>
</head>
<body>
<h1>Hello this is index page!</h1>
<form action="/login">
    <input type="submit" value="Login" />
</form>
<form action="/signup">
    <input type="submit" value="signup" />
</form>
<div id="map" style="width: 500px; height: 400px;"></div>
<script>
 var postData = JSON.parse('${post}');
</script>
<script src="${pageContext.request.contextPath}/resource/js/index.js"></script>
</body>
</html>
