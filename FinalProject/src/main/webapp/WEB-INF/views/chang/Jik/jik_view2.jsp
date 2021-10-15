<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>MVC 게시판 - view</title>
 <jsp:include page="../../main/header.jsp" />
  <script src="../resources/js/jquery-3.6.0.min.js"></script>
 <script src="../resources/js/chang/jik_comm.js"></script>
 <link rel="stylesheet" href="../resources/css/chang/view.css">
</head>
<body>
  <input type="hidden" id="Loginid" value="${id}" name="loginid">
  <input type="hidden" id="Loginnick" value="${nick}" name="Loginnick">
  <input type="hidden" id="Jik_id" value="${jikdata.jik_id}" name="Jik_id">
  <input type="hidden" id="jik_subject" value="${jikdata.jik_subject}">
  <input type="hidden" id="jik_content" value="${jikdata.jik_content}" >
  <br><br><br><br><br><br><br><br><br><br>
  

  <div class="container">
 	<table class="table table-striped">
 		<tr>
 			<th colspan="2">직거래 장터</th></tr>
 		<tr>
 			
 			<td colspan="2"><div id="nick"> <img  src="${pageContext.request.contextPath}/resources/image/chang/${jikdata.p}" alt="프로필 사진" width="25px">&nbsp;&nbsp;${jikdata.nick}
 							<a href="#" class="report_button" onclick=" window.open('../jik/report', '신고하기', 'width=500, height=700, scrollbars=no, resizable=no')">신고하기</a>
 			</div></td>
 		</tr>
 		<tr>
 			<td colspan="2"><c:out value="${jikdata.jik_subject}" /></td>
 		</tr>
 		<tr>
 			<td colspan="2" style="padding-right:0px">	
 			<div contentEditable="false" >
 			<img width="90" height="90" class="display" src="display?fileName=${jikdata.jik_file}">
 			${jikdata.jik_content}
 			${resourceFolder}
 			</div>
 			</td>
 		</tr>
 		
 	
 		<tr>
 			<td><div>첨부파일</div></td>
 		<c:if test="${!empty jikdata.jik_file}"><%--파일 첨부한 경우 --%>
 		<td><img src="../resources/image/chang/down.png" width="10px">
 			<form method="post" action="down">
 				<input type="hidden" value="${jikdata.jik_file}" name="filename">
 				<input type="hidden" value="${jikdata.jik_original}" name="original">
 				<input type="submit" value="${jikdata.jik_original}" >
 			</form>
 			</td>
 		</c:if>
 		<c:if test="${empty jikdata.jik_file}"><%-- 파일첨부하지 않은 경우 --%>
 			<td></td>
 		</c:if>
 		</tr>
 		
 	<tr>
 		<td colspan="2" class="center">
 			
 			<c:if test="${jikdata.jik_id == id || id =='admin' }">
 			 <a href="modifyView?num=${jikdata.jik_num}">
 			 	<button class="btn btn-warning">수정</button>
 			 </a>
 			 <a href="#">
 			 	<button class="btn btn-danger" data-toggle="modal"
 			 			data-target="#myModal">삭제</button>
 			 </a>
 			 </c:if>
 			
 			<a href="list">
 				<button class="btn btn-secondary">목록</button>
 			</a>
 			</td>
 		</tr>
 	</table>
<%-- 게시판 view end --%>

		<%-- modal 시작 --%>
		<div class="modal" id="myModal">
		 <div class="modal-dialog">
		  <div class="modal-content">
		  	<%-- Modal body --%>
		  	<div class="modal-body">
		  	 <form name="deleteForm" action="delete" method="post">
		  	 	<%--http://localhost:8088/myhome5/detail?num=22
		  	 		주소를 보면 num을 파라미터로 넘기고 있습니다.
		  	 		이 값을 가져와서 ${param.num}를 사용
		  	 		또는 ${boarddata.BOARD_NUM}
		  	 	 --%>
		  	 	 <input type="hidden" name="jik_num" value="${param.num}"
		  	 	 	  id="jik_num">
					정말로 삭제하시겠습니까?<br><br>
		  	 	 	<button type="submit" class="btn btn-primary">삭제</button>
		  	 	 	<button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
		  		 </form>
		  		</div><!-- class="modal-body" -->
		  </div><!-- class="modal-content" -->
		</div><!-- class="modal-dialog" -->
	</div><!-- class="modal" id="myModal"-->
	
	
	<div class="CommentBox">
		<div class="comment_option">
			<h3 class="comment_title">
				댓글	<span id="count">${count}</span>
			</h3>
			<div class="comment_tab">
				<ul class="comment_tab_list">
				</ul>
			</div>
		</div><!--  comment option end -->
		<ul class="comment_list">
		</ul>
		<span id="message"></span>
		<div class="CommentWriter">
			<div class="comment_inbox">
				<b class="comment_inbox_name">${nick}</b><span
				   class="comment_inbox_count">0/200</span>
				  <textarea placeholder="로그인 후 댓글을 남겨보세요" rows="3"
				  class="comment_inbox_text" maxLength="200"></textarea> 
			</div>
		<c:if test="${id!=null}">
			<div class="register_box">
				<input type="checkbox" class="secret" />비밀댓글
				<div class="button btn_cancel">취소</div>
				<div class="button btn_register" id="write">등록</div>
			</div>
		</c:if>
		</div><!-- CommentWriter end -->
	</div><!-- CommentBox end -->
  </div><!-- class="container" -->

</body>
</html>