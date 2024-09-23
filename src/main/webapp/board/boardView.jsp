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


                <input type="hidden" id="memId" value="${sessionScope.memId }"/>
                <input type="hidden" name="seq" value="${boardDTO.seq }"/>
                <input type="hidden" name="pg" value="${requestScope.pg }"/>


                <table border="1" frame="hsides" rules="rows">
                    <tr>
                        <td colspan="3">${boardDTO.subject }</td>
                    </tr>

                    <tr>
                        <td>글번호 : ${boardDTO.seq }</td>
                        <td>작성자 : <span id="id">${boardDTO.id }</span></td>
                        <td>조회수 : ${boardDTO.hit }</td>
                    </tr>

                    <tr>
                        <td>
                            <div style="width: 100%; height: 100%; overflow: auto;">
                            <pre style="white-space: pre-line; word-break: break-all;">
                                ${boardDTO.content }
                            </pre>
                            </div>
                        </td>
                    </tr>
                </table>

                <div>
                    <input type="button" value="목록"
                           onclick="location.href='/projectMVC/board/boardList.do?pg=${pg}'">
                    <span id="boardViewSpan">
                    <input type="button" value="글수정" id="boardUpdateFormBtn"> <!-- seq, pg를 들고 이동해야함 -->
                    <input type="button" value="글삭제" id="boardDeleteFormBtn"> <!-- 글이 삭제됫을때의 페이징 처리가 귀찮으니 seq만 들고간다 -->
                    </span>
                </div>

            </form>

        </div> <!-- id="section" -->
    </div> <!-- id="container" -->
</div>    <!-- id="wrap" -->

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="../js/boardView.js"></script>
</body>
</html>
