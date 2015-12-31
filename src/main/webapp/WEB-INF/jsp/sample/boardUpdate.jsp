<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
</head>
<body>
    <form id="frm">
        <table class="board_view">
            <colgroup>
                <col width="12%"/>
                <col width="8%"/>
                <col width="10%"/>
                <col width="20%"/>
                <col width="15%"/>
                <col width="*%"/>
            </colgroup>
            <caption>방명록 수정</caption>
                 
            <tbody>
                <tr>
                    <th scope="row">글 번호</th>
                    <td>
                        ${map.idx}
                        <input type="hidden" id="idx" name="idx" value="${map.idx }">
                    </td>
                    <th scope="row">이메일</th>
               		<td>${map.email }</td>
               		<th scope="row">비밀번호</th>
                    <td><input type="text" id="pass" name="pass" class="wdp_90"></input></td>
               		
                </tr>
                <tr>
                    <td colspan="6" class="view_text">
                        <textarea rows="20" cols="100" title="내용" id="contents" name="contents">${map.contents }</textarea>
                    </td>
                </tr>
            </tbody>
        </table>
    </form>
     
    <a href="#this" class="btn" id="list">목록으로</a>
    <a href="#this" class="btn" id="update">저장하기</a>
    <a href="#this" class="btn" id="delete">삭제하기</a>
     
    <%@ include file="/WEB-INF/include/include-body.jspf" %>
    <script type="text/javascript">
        $(document).ready(function(){
            $("#list").on("click", function(e){ //목록으로 버튼
                e.preventDefault();
                fn_openBoardList();
            });
             
            $("#update").on("click", function(e){ //저장하기 버튼
                e.preventDefault();
                fn_updateBoard();
            });
             
            $("#delete").on("click", function(e){ //삭제하기 버튼
                e.preventDefault();
                fn_deleteBoard();
            });
        });
         
        function fn_openBoardList(){
            var comSubmit = new ComSubmit();
            comSubmit.setUrl("<c:url value='/sample/openBoardList.do' />");
            comSubmit.submit();
        }
         
        function fn_updateBoard(){
            var comSubmit = new ComSubmit("frm");
            comSubmit.setUrl("<c:url value='/sample/updateBoard.do' />");
            comSubmit.submit();
        }
         
        function fn_deleteBoard(){
            var comSubmit = new ComSubmit();
            comSubmit.setUrl("<c:url value='/sample/deleteBoard.do' />");
            comSubmit.addParam("idx", $("#idx").val());
            comSubmit.submit();
             
        }
    </script>
</body>
</html>