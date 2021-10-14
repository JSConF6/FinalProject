<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>멤버게시판 view</title>
<jsp:include page="../../main/header.jsp" /> 
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/oky/view3.js"></script>
<script>
    var result="${result}";
    if(result == 'passFail') {
    	alert("비밀번호가 일치하지 않습니다.")
    }
   $(function() {
	   $("form[action=delete]").submit(function(){
		   if ($("#board_pass").val() == '') {
			   alert("비밀번호를 입력하세요");
			   $("#board_pass").focus();
			   return false;
		   }
	   })
   })

</script>
<style>
body > div > table > tbody >tr:nth-child(1) {
	text-align: center
}

td:nth-child(1) {
	width: 20%
}

a {
	color: white
}

body > div > table > tbody tr:last-child {
	text-align: center;
}

.btn-primary {
	background-color: #4f97e5
}

#myModal {
	display: none
}

#comment > table > tbody > tr > td:nth-child(2){
 width:60%
}
#count{
    position: relative;
    top: -10px;
    left: -10px;
    background: orange;
    color: white;
    border-radius: 30%;
}

textarea{resize:none}

form[action=down] > input[type=submit]{
    position: relative;
    top: -20;
    left: 10px;
    border: none;
    cursor : pointer;
}

</style>

</head>
<body>
<br><br><br>
<input type="hidden" id="id" value="${id}" name="id">
<input type="hidden" id="nongname" value="${name}" name="name">
<input type="hidden" id="path" value="${pageContext.request.contextPath}" name="path">
 <div class="container">
   <table class="table table-striped">
     <tr><th colspan="2">멤버게시판 상세보기</th></tr>
     <tr>
         <td><div>글쓴이</div></td>
         <td><div>${boarddata.id}</div></td>
     </tr>
     <tr>
         <td><div>제목</div></td>
         <td><c:out value="${boarddata.nong_sub}" /></td>
     </tr>     
     <tr>
         <td><div>내용</div></td>
         <td style="padding-right:0px"><textarea class="form-control" rows="5"
               readOnly >${boarddata.nong_con}</textarea></td>
     </tr>     
     
   <c:if test="${boarddata.nong_re_lev==0}"><%--원문글인 경우에만 첨부파일을 추가 할 수 있습니다. --%>
    <tr>
      <td><div>첨부파일</div></td>
     <c:if test="${!empty boarddata.nong_file}"><%-- 파일첨부한 경우 --%>
      <td><img src="${pageContext.request.contextPath}/resources/image/oky/down.png" width="10px">
          <form method="post" action="down">
            <input type="hidden" value="${boarddata.nong_file}" name="filename">
            <input type="hidden" value="${boarddata.nong_ori}" name="original">
            <input type="submit" value="${boarddata.nong_ori}">          
          </form>
      </td>
      </c:if>
      <c:if test= "${empty boarddata.nong_file}"><%-- 파일첨부하지 않은 경우 --%>
          <td></td>
      </c:if>
      </tr>
   </c:if>
     
     <tr>
         <td colspan="2" class="center">
           <button class="btn btn-primary start">댓글</button>
            <span id="count">${count}</span>          
           <c:if test="${boarddata.id == id || level == 1 }">
            <a href="nongmodifyView?name=${name}&num=${boarddata.nong_num}">
              <button class="btn btn-warning">수정</button>
            </a>
            <%-- href의 주소를 #으로 설정합니다. --%>
            <a href="#">
            <button class="btn btn-danger" data-toggle="modal"
                   data-target="#myModal">삭제</button>
            </a>
           </c:if>
           
           <a href="nongreplyView?name=${name}&num=${boarddata.nong_num}">
               <button class="btn btn-info">답변</button>
           </a>
           
           
           <a href="nong?name=${name}">
              <button class="btn btn-secondary">목록</button>
           </a>
         </td>
      </tr>              
   </table>
          <%-- 게시판 수정 end --%>

             <%-- modal 시작 --%>
             <div class="modal" id="myModal">
              <div class="modal-dialog">
               <div class="modal-content">
                 <%-- Modal body --%>
                 <div class="modal-body">
                  <form name="deleteForm" action="nongdelete" method="post">
                    <%-- http://localhost:8888/myhome6/detail?num=22
                                                 주소를 보면 num을 파라미터로 넘기고 있습니다.
                                                 이 값을 가져와서 ${param.num}를 사용
                                                 또는 ${boarddata.BOARD_NUM}
                     --%>
                     <input type="hidden" name="num" value="${param.num}" id="board_num">
                     <input type="hidden" id="nongname" value="${name}" name="name">
                     <div class="form-group">
                        <label for="pwd">비밀번호</label>
                        <input type="password"
                               class="form-control" placeholder="Enter password"
                               name="nong_pass" id="board_pass">
                     </div>
                     <button type="submit" class="btn btn-primary">전송</button>
                     <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
                  </form>
                 </div><!-- class="modal-body" -->
               </div><!-- class="modal-content" -->
              </div><!-- class="modal-dialog" -->
             </div>
             <!-- class="modal" -->
             
             <div id="comment">
             	<input type="hidden" id="loginid" value="${id}" name="loginid">
                <button class="btn btn-info float-left">총 50자 까지 가능합니다.</button>
                <button id="write" class="btn btn-info float-right">등록</button>
                <textarea rows=3 class="form-control"
                          id="content" maxLength="50"></textarea>
                <table class="table table-striped">
                  <thead>
                    <tr><td>아이디</td><td>내용</td><td>날짜</td></tr>
                  </thead>
                  <tbody>
                  
                  </tbody>
                </table>
                  <div id="message"></div>           
             </div><!-- comment end -->
          </div><!-- container end -->
<jsp:include page="../../main/footer.jsp" />           
</body>
</html>