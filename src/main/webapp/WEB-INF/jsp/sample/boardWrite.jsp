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
                <col width="15%">
                <col width="*"/>
            </colgroup>
            <caption>방명록 작성</caption>
            <tbody>
                <tr>
                    <th scope="row">이메일</th>
                    <td><input type="text" id="email" name="email" class="wdp_90"></input></td>
                    <th scope="row">비밀번호</th>
                    <td><input type="password" id="pass" name="pass" class="wdp_90"></input></td>
                    
                </tr>
                <tr>
                    <td colspan="4" class="view_text">
                        <textarea rows="20" cols="100" title="내용" id="contents" name="contents"></textarea>
                    </td>
                </tr>
            </tbody>
        </table>
         
        <a href="#this" class="btn" id="write" >작성하기</a>
        <a href="#this" class="btn" id="list" >목록으로</a>
    </form>
     
    <%@ include file="/WEB-INF/include/include-body.jspf" %>
   <script type="text/javascript">
   $(document).ready(function(){
	    $("#list").on("click", function(e){ //목록으로 버튼
	        e.preventDefault();
	        fn_openBoardList();
	    });
	     
	    $("#write").on("click", function(e){ //작성하기 버튼
	        if(validateEmail($("#email").val())){
	        	e.preventDefault();
		        fn_insertBoard();
	        }
	    });
	});
	 
   	function validateEmail(inputText){
   		var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;  
   		
   		if(mailformat.test(inputText))  
   		{  
   			return true;  
   		}  
   		else  
   		{  
   			alert("이메일형식!");    
   			return false;  
   		}
   	} 
	function fn_openBoardList(){
	    var comSubmit = new ComSubmit();
	    comSubmit.setUrl("<c:url value='/sample/openBoardList.do' />");
	    comSubmit.submit();
	}
	 
	function fn_insertBoard(){
	    var comSubmit = new ComSubmit("frm");
	    comSubmit.setUrl("<c:url value='/sample/insertBoard.do' />");
	    comSubmit.submit();
	}
	</script>
</body>
</html>