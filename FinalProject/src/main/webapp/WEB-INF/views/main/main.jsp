<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>임시메인</title>
<link href="${pageContext.request.contextPath}/resources/css/main.css" type="text/css" rel ="stylesheet">
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.js"></script>
<style>
/* 고객센터 / 공지사항 버튼 */
.btn-group button {
  text-align:left;
  height:150px;
  background-color:#94b8b8; 
  border: none; 
  padding: 10px 24px;
  cursor: pointer;
  float: left;
  color: white; 
  font-size:20px;
}

.btn-group button p{
  font-size:16px;
  font-style:regular;
  padding-top:4px;
}

/* Clear floats (clearfix hack) */
.btn-group:after {
  content: "";
  clear: both;
  display: table;
}

.btn-group button:not(:last-child) {
  border-right: none;
}

.btn-group button:hover {
  background-color:#75a3a3;
  text-decoration:none; 
}/* text-decoration:none; hover시 하얀 밑줄 생기는거 없앰 */

a {width:50%}
a button {width:100%}

</style>
</head>
<body>
<br><br><br><br><br>
<h1>임시메인 페이지</h1>
<jsp:include page="header.jsp" />  

<div class="container">

  <h4>내 농장 일정</h4>
  <p>오늘 우리 농장의 할일을 확인해요</p>


<div class="row" style="margin:20px 20px 50px 20px">
  <div class="col-sm-4">
    <div class="card">
      <div class="card-body">
        <h5 class="card-title">2021.09.19</h5>
        <p class="card-text">오전 9시:약치기</p>
        <a href="#" class="btn btn-primary">상세보기</a>
      </div>
    </div>
  </div>
  <div class="col-sm-4">
    <div class="card">
      <div class="card-body">
        <h5 class="card-title">2021.09.20</h5>
        <p class="card-text">일정 내용 적는 부분</p>
        <a href="#" class="btn btn-primary">상세보기</a>
      </div>
    </div>
  </div>
  <div class="col-sm-4">
    <div class="card">
      <div class="card-body">
        <h5 class="card-title">2021.09.21</h5>
        <p class="card-text">일정 내용 적는 부분</p>
        <a href="#" class="btn btn-primary">상세보기</a>
      </div>
    </div>
  </div>
</div>

</div>

		<!-- 고객센터, 공지사항 버튼 링크 -->
		<div class="btn-group a">

				<a href="/cs"><button type="button">
				&nbsp;&nbsp;&nbsp;&nbsp;고객센터<br>
				<p>
				&nbsp;&nbsp;&nbsp;&nbsp;고객의 소리를 적극 경청하고 고객만족 향상 활동<br>
				&nbsp;&nbsp;&nbsp;&nbsp;을 지속적으로 실천합니다.
				</p>
				</button>
				</a>
				
				<a href="/notice"><button type="button">
				&nbsp;&nbsp;&nbsp;&nbsp;공지사항
				<p>
				&nbsp;&nbsp;&nbsp;&nbsp;주말농장의 공지사항을 확인하세요.
				</p>
				</button>
				</a>
		</div>
		
		
<jsp:include page="footer.jsp" />  
</body>
</html>



