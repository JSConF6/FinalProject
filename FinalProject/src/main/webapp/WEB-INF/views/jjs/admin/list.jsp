<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html>
<jsp:include page="include/head.jsp" />
<body class="hold-transition sidebar-mini">
<div class="wrapper">

  <jsp:include page="include/header.jsp" />

  <jsp:include page="include/aside.jsp" />

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0 text-dark">회원 목록</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin/main">Home</a></li>
              <li class="breadcrumb-item active">회원 목록</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <div class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-12">
            <div class="card">
              <div class="card-header">
                <h3 class="card-title">회원목록</h3>

                <div class="card-tools">
                  <div class="input-group input-group-sm" style="width: 150px;">
                    <input type="text" name="table_search" class="form-control float-right" placeholder="Search">

                    <div class="input-group-append">
                      <button type="submit" class="btn btn-default"><i class="fas fa-search"></i></button>
                    </div>
                  </div>
                </div>
              </div>
              <!-- /.card-header -->
              <div class="card-body table-responsive p-0" style="height: 480px;">
                <table class="table table-head-fixed text-nowrap table-hover">
                  <thead>
                    <tr>
                      <th>아이디</th>
                      <th>이름</th>
                      <th>닉네임</th>
                      <th>농장이름</th>
                      <th>회원등급</th>
                      <th>삭제</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td><a href="userInfo">javas</a></td>
						<td>자바</td>
						<td>javaSCR</td>
						<td>JavaFarm</td>
						<td>농장멤버</td>
                      <td><button type="button" class="btn btn-danger">삭제</button></td>
                    </tr>
                    <tr>
                      <td><a href="userInfo">javas</a></td>
						<td>자바</td>
						<td>javaSCR</td>
						<td>JavaFarm</td>
						<td>농장멤버</td>
                      <td><button type="button" class="btn btn-danger">삭제</button></td>
                    </tr>
                    <tr>
                      <td><a href="userInfo">javas</a></td>
						<td>자바</td>
						<td>javaSCR</td>
						<td>JavaFarm</td>
						<td>농장멤버</td>
                      <td><button type="button" class="btn btn-danger">삭제</button></td>
                    </tr>
                    <tr>
                      <td><a href="userInfo">javas</a></td>
						<td>자바</td>
						<td>javaSCR</td>
						<td>JavaFarm</td>
						<td>농장멤버</td>
                      <td><button type="button" class="btn btn-danger">삭제</button></td>
                    </tr>
                    <tr>
                      <td><a href="userInfo">javas</a></td>
						<td>자바</td>
						<td>javaSCR</td>
						<td>JavaFarm</td>
						<td>농장멤버</td>
                      <td><button type="button" class="btn btn-danger">삭제</button></td>
                    </tr>
                    <tr>
                      <td><a href="userInfo">javas</a></td>
						<td>자바</td>
						<td>javaSCR</td>
						<td>JavaFarm</td>
						<td>농장멤버</td>
                      <td><button type="button" class="btn btn-danger">삭제</button></td>
                    </tr>
                    <tr>
                      <td><a href="userInfo">javas</a></td>
						<td>자바</td>
						<td>javaSCR</td>
						<td>JavaFarm</td>
						<td>농장멤버</td>
                      <td><button type="button" class="btn btn-danger">삭제</button></td>
                    </tr>
                    <tr>
                      <td><a href="userInfo">javas</a></td>
						<td>자바</td>
						<td>javaSCR</td>
						<td>JavaFarm</td>
						<td>농장멤버</td>
                      <td><button type="button" class="btn btn-danger">삭제</button></td>
                    </tr>
                  </tbody>
                </table>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
          </div>
        </div>
        <!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
    <div class="p-3">
      <h5>Title</h5>
      <p>Sidebar content</p>
    </div>
  </aside>
  <!-- /.control-sidebar -->

  <jsp:include page="include/footer.jsp" />
</div>
<!-- ./wrapper -->

<!-- REQUIRED SCRIPTS -->
<jsp:include page="include/plugin_js.jsp" />

</body>
</html>