<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${ pageContext.request.contextPath }/css/index.css">
</head>
<body>
	<div id="wrap">
		<div id="header">
			<h1>
				<img alt="사과" src="${ pageContext.request.contextPath }/image/apple.png" 
				     width="50" height="50" style="cursor: pointer;">
				MVC를 활용한 미니프로젝트
			</h1>
			<jsp:include page="./main/menu.jsp" />
		</div>
		<div id="container">
			<div id="nav">
				<jsp:include page="./main/nav.jsp" />
			</div>
			<div id="section">
				<h3>
					저희 홈페이지를 방문해주셔서 감사합니다.<br><br>
					Hava a nice day!! <br><br>
					<img alt="망상토끼" src="/projectMVC/image/망상토끼.gif">
				</h3>
			</div>
		</div>
		<div id="footer"></div>
	</div>
</body>
</html>












