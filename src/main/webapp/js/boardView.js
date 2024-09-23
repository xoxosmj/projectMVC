$(function () {
    /*
    alert($('#memId').val()); // input 태그 안에있는값은 val
    alert($('#id').text());  // span 태그 안에있어서 text
    */

    //자기가 작성한 글인지 확인하기
    if ($('#memId').val() == $('#id').text()) {
        $('#boardViewSpan').show();
    } else {
        $('#boardViewSpan').hide();
    }

    //글 수정
    $('#boardUpdateFormBtn').click(function () {
        $('#boardViewForm').attr('action', '/projectMVC/board/boardUpdateForm.do');
        $('#boardViewForm').submit(); //seq , pg 를 가지고 이동한다 (memID는 name이 아니라 id속성이라 안가지고간다하는데 몰루?)
    });


    //글 삭제 - 삭제한 후에는 1페이지로 이동
    $('#boardDeleteFormBtn').click(function () {
        $('#boardViewForm').attr('action', '/projectMVC/board/boardDeleteForm.do');
        $('#boardViewForm').submit(); //seq , pg 를 가지고 이동한다 (memID는 name이 아니라 id속성이라 안가지고간다하는데 몰루?)
    });


});