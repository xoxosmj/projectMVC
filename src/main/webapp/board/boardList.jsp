<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" href="${ pageContext.request.contextPath }/css/index.css">
    <style type="text/css">
        table {
            border-collapse: collapse;
        }

        th, td {
            padding: 10px;
        }

        #currentPaging {
            border: 1px solid blue;
            color: red;
            font-size: 15pt;
            padding: 5px 8px;
            margin: 3px;
        }

        #paging {
            color: black;
            font-size: 15pt;
            padding: 5px 8px;
            margin: 3px;
        }

        span:hover {
            text-decoration: underline;
        }

        .subjectA:link {
            color: black;
            text-decoration: none;
        }

        .subjectA:visited {
            color: black;
            text-decoration: none;
        }

        .subjectA:hover {
            color: yellowgreen;
            text-decoration: underline;
        }

        .subjectA:active {
            color: black;
            text-decoration: none;
        }

    </style>
</head>
<body>
<div id="wrap">
    <div id="header">
        <h1>
            <img alt="사과" src="${ pageContext.request.contextPath }/image/apple.png"
                 width="50" height="50"
                 onclick="location.href='${ pageContext.request.contextPath }/index.do'"
                 style="cursor: pointer;">
            MVC를 활용한 미니프로젝트
        </h1>
        <hr style="border-color: #483D8B; border-width: 3px;"/>
    </div>

    <div id="container" class="boardListDiv">
        <jsp:include page="../main/boardMenu.jsp"/>

        <div id="section">

            <input type="hidden" id="memId" value="${sessionScope.memId }"/>
            <input type="hidden" id="pg" value="${requestScope.pg }"/>
            <table border="1" frame="hsides" rules="rows">
                <tr>
                    <th width="100">글번호</th>
                    <th width="400">제목</th>
                    <th width="150">작성자</th>
                    <th width="150">작성일</th>
                    <th width="100">조회수</th>
                </tr>

                <c:if test="${requestScope.list != null }">
                    <c:forEach var="boardDTO" items="${list }">
                        <tr>
                            <td align="center">${boardDTO.seq }</td>

                            <td><a href="#" class="subjectA">${boardDTO.subject }</a></td>


                            <td align="center">${boardDTO.id }</td>
                            <td align="center">
                                <fmt:formatDate pattern="yyyy.MM.dd" value="${boardDTO.logtime }"/>
                            </td>
                            <td align="center">${boardDTO.hit }</td>
                        </tr>
                    </c:forEach>
                </c:if>
            </table>

            <div style="text-align: center; width: 700px; margin-top: 15px;">
                ${boardPaging.pagingHTML }
            </div>
        </div> <!-- id="section" -->
    </div> <!-- id="container" -->
</div>    <!-- id="wrap" -->
<script type="text/javascript">
    function boardPaging(pg) {
        location.href = "/projectMVC/board/boardList.do?pg=" + pg;
    }
</script>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="../js/boardList.js">

</script>

</body>
</html>





