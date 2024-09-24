<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
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
            padding: 5px;
        }

        #boardWriteForm {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin: 30px auto;
            text-align: left;
        }

        #boardWriteForm div{
            color: red;
            font-size: 8pt;
            font-weight: bold;
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

        <div id="section">
            <form id="imageboardWriteForm">
                <table border="1">
                    <tr>
                        <th width="100">상품코드</th>
                        <td>
                            <input type="text" id="imageId" name="imageId" size="50">
                            <div id="subjectDiv"></div>
                        </td>
                    </tr>

                    <tr>
                        <th width="100">상품명</th>
                        <td>
                            <input type="text" id="imageName" name="imageName" size="50">
                            <div id="imageNameDiv"></div>
                        </td>
                    </tr>

                    <tr>
                        <th width="100">단가</th>
                        <td>
                            <input type="text" id="imagePrice" name="imagePrice" size="50">
                            <div id="imagePriceDiv"></div>
                        </td>
                    </tr>

                    <tr>
                        <th width="100">개수</th>
                        <td>
                            <input type="text" id="imageQty" name="imageQty" size="50">
                            <div id="imageQtyDiv"></div>
                        </td>
                    </tr>

                    <tr>
                        <th>내용</th>
                        <td>
                            <textarea id="imageContent" name="imageContent" rows="15" cols="50"></textarea>
                            <div id="imageContentDiv"></div>
                        </td>
                    </tr>

                    <tr>
                        <td colspan="2">
                            <img id="showImg" width="70" height="70" />
                            <img src="../image/camera.jpg" alt="카메라" id="camera" width="50" height="50" />
                            <input type="file" name="image1" id="image1" style="visibility: hidden;">
                            <div id="image1Div"></div>
                        </td>
                    </tr>

                    <tr>
                        <td colspan="2" align="center">
                            <input type="button" value="이미지 등록" id="imageboardWriteBtn">
                            <input type="reset" value="다시작성">
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
</div> <!-- id="wrap" -->

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
    $('#camera').click(function(){
        $('#image1').trigger('click');//강제 이벤트 발생
    });

    //선택한 이미지 확인하기
    $('#image1').change(function(){
        readURL(this);
    });

    function readURL(input){
        var reader = new FileReader();

        reader.onload = function(e){
            $('#showImg').attr('src', e.target.result); //e.target - 이벤트가 발생하는 요소를 반환해준다.
        }

        reader.readAsDataURL(input.files[0]);
    }

    $('#imageboardWriteBtn').click(function(){
        let formData = new FormData($('#imageboardWriteForm')[0]);

        $.ajax({
            type: 'post',
            enctype: 'multipart/form-data',
            processData: false,
            contentType: false,
            url: '/projectMVC/imageboard/imageboardWriteAJax.do',
            data: formData,
            success: function(){
                alert('이미지 등록 완료');
                location.href = "/projectMVC/imageboard/imageboardList.do?pg=1";
            },
            error: function(e){
                console.log(e);
            }
        }); //$.ajax
    });

</script>
</body>
</html>

<!--
FileReader 란?
FileReader는 <input type="file" /> 또는 API 요청과 같은 인터페이스를 통해
File 또는 Blob 객체를 편리하게 처리할수있는 방법을 제공하는 객체이며
abort, load, error와 같은 이벤트에서 발생한 프로세스를 처리하는데 주로 사용되며,
File 또는 Blob 객체를 읽어서 result 속성에 저장한다.

FileReader도 비동기로 동작한다.

FileReader.onload()
load 이벤트의 핸들러. 이 이벤트는 읽기 동작이 성공적으로 완료되었을 때마다 발생한다.

processData
- 기본값은 true
- 기본적으로 Query String으로 변환해서 보내진다('변수=값&변수=값')
- 파일 전송시에는 반드시 false로 해야 한다.(formData를 문자열로 변환하지 않는다)

contentType
- 기본적으로 "application/x-www-form-urlencoded; charset=UTF-8"
- 파일 전송시에는 'multipart/form-data'로 전송이 될 수 있도록 false로 설정한다
-->

















