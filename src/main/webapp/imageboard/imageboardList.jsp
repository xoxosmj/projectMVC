<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
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

        th, td{
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

        .imageboardListDiv {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin: 30px auto;
            text-align: left;
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
        <hr style="border-color: #483D8B; border-width: 3px;" />
    </div>

    <div id="container">
        <jsp:include page="../main/imageboardMenu.jsp" />

        <div id="section" class="imageboardListDiv">

            <input type="hidden" id="pg" value="${requestScope.pg }" />

            <table border="1" frame="hsides" rules="rows">
                <tr align="center">
                    <th width="150">
                        <input type="checkbox"> 번호
                    </th>
                    <th width="300">이미지</th>
                    <th width="450">상품명</th>
                    <th width="150">단가</th>
                    <th width="100">개수</th>
                    <th width="200">합계</th>
                </tr>

                <c:if test="${requestScope.list != null }">
                    <c:forEach var="imageboardDTO" items="${list }">
                        <tr>
                            <td align="center">
                                <input type="checkbox"> ${imageboardDTO.seq }
                            </td>

                            <td align="center">
                                <a href="#">
                                    <!-- src="가상폴더의 위치" -->
                                    <img src="http://localhost:8080/projectMVC/storage/${imageboardDTO.image1 }"
                                         alt="${imageboardDTO.imageName }"
                                         width="70"
                                         height="70" />
                                </a>
                            </td>

                            <td align="center">${imageboardDTO.imageName }</td>
                            <td align="center">
                                <fmt:formatNumber pattern="#,###" value="${imageboardDTO.imagePrice }"/>
                            </td>
                            <td align="center">
                                <fmt:formatNumber pattern="#,###" value="${imageboardDTO.imageQty }"/>
                            </td>
                            <td align="center">
                                <fmt:formatNumber pattern="#,###"
                                                  value="${imageboardDTO.imagePrice * imageboardDTO.imageQty }"/>
                            </td>
                        </tr>
                    </c:forEach>
                </c:if>
            </table>

            <div style="width: 700px; text-align: center;">
                <div style="float: left; margin-top: 5px;"><input type="button" value="선택삭제" /></div>
                <div style="float: left; text-align: center; width: 620px; margin-top: 15px;">
                    ${imageboardPaging.pagingHTML }
                </div>
            </div>
        </div> <!-- id="section" -->
    </div> <!-- id="container" -->
</div>	<!-- id="wrap" -->

<script type="text/javascript">
    function imageboardPaging(pg){
        location.href = "/projectMVC/imageboard/imageboardList.do?pg=" + pg;
    }
</script>
</body>
</html>










