<%--
  Created by IntelliJ IDEA.
  User: bitcamp
  Date: 2024-09-20
  Time: PM 4:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>Title</title>
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

        <div id="section" class="boardViewDiv">
            <form id="boardViewForm">

                <table border="1" frame="hsides" rules="rows">
                    <tr>
                        <td colspan="3">${boardDTO.subject }</td>
                    </tr>

                    <tr>
                        <td>글번호 : ${boardDTO.seq }</td>
                        <td>작성자 : ${boardDTO.id }</td>
                        <td>조회수 : ${boardDTO.hit }</td>
                    </tr>

                    <tr>
                        <td>
                            <pre>
                                ${boardDTO.content }
                            </pre>
                        </td>
                    </tr>
                </table>

                <div>
                    <input type="button" value="목록"
                           onclick="location.href='/projectMVC/board/boardList.do?pg=${pg}'">
                    <input type="button" value="글수정">
                    <input type="button" value="글삭제">
                </div>

            </form>

        </div> <!-- id="section" -->
    </div> <!-- id="container" -->
</div>    <!-- id="wrap" -->
</body>
</html>
