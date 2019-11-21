<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>회원관리</title>

  <!-- Custom fonts for this template-->
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css">
  <script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>

  <!-- Page level plugin CSS-->
  <link href="/tour/resources/css/dataTables.bootstrap4.css" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="/tour/resources/css/sb-admin.css" rel="stylesheet">
  <link rel='stylesheet' href='https://cdn.datatables.net/fixedheader/3.1.2/css/fixedHeader.dataTables.min.css'>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  
  <script>
	function changeType(num, txt) {
		if(confirm("변경하시겠습니까?")) {
			$.ajax({
				url : "/Hye/project/manage/typeChange.do",
				data : "num=" + num + "&memType=" + txt,
				success : function(result) {
					$("#memList").html(result);
				}
			});
		}
	}
  </script>
</head>
<body id="page-top">

  <nav class="navbar navbar-expand navbar-dark bg-dark static-top">

    <a class="navbar-brand mr-1" href="main">GOOTTOUR관리</a>

    <button class="btn btn-link btn-sm text-white order-1 order-sm-0" id="sidebarToggle" href="#">
      <i class="fas fa-bars"></i>
    </button>

  </nav>

  <div id="wrapper">

    <!-- Sidebar -->
    <ul class="sidebar navbar-nav">
      <li class="nav-item">
        <a class="nav-link" href="main">
          <i class="fas fa-fw fa-home"></i>
          <span>홈</span>
        </a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="tables">
          <i class="fas fa-fw fa-table"></i>
          <span>회원관리</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#" data-toggle="modal" data-target="#logoutModal">
          <i class="fas fa-fw fa-user-circle"></i>
          <span>로그아웃</span></a>
      </li>
    </ul>

    <div id="content-wrapper">

      <div class="container-fluid">

        <!-- Breadcrumbs-->
        <ol class="breadcrumb">
          <li class="breadcrumb-item">
            <a href="main">홈</a>
          </li>
          <li class="breadcrumb-item active">회원관리</li>
        </ol>

        <!-- DataTables Example -->
        <div class="card mb-3">
          <div class="card-header">
            <i class="fas fa-table"></i>
            회원목록</div>
          <div class="card-body">
            <div class="table-responsive">
              <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                  <tr>
                  	<th>아이디</th>
                    <th>이름</th>
                    <th>회원등록일</th>
                    <th>나이</th>
                    <th>전화번호</th>
                    <th>주소</th>
                    <th>이메일</th>
                    <th>예약 수</th>
                    <th>권한</th>
                    <th>권한변경</th>
                  </tr>
                </thead>
                <tfoot></tfoot>
                <tbody id="memList">
                  <c:forEach var="l" items="${lst }">
	                  <tr id="user${l.num }">
	                    <td>${l.userId }</td>
	                    <td>${l.userName }</td>
	                    <td>${l.regDate }</td>
	                    <td>${l.age }</td>
	                    <td>${l.tel }</td>
	                    <td>${l.addr }</td>
	                    <td>${l.email }</td>
	                    <td>${l.resCnt }</td>
	                    <td>${l.memType }</td>
	                    <td>
							<c:if test="${l.memType=='관리자'}">
								<input type="button" id="pub" name="pub" style="width:100px;" class="checkBtn btn btn-light" value="일반" onclick="changeType(${l.num}, '일반')"/>
								<input type="button" id="emp" name="emp" style="width:100px;" class="checkBtn btn btn-light" value="직원" onclick="changeType(${l.num}, '직원')"/>
							</c:if>
							<c:if test="${l.memType=='일반'}">
								<input type="button" id="man" name="man" style="width:100px;" class="checkBtn btn btn-light" value="관리자" onclick="changeType(${l.num}, '관리자')"/>
								<input type="button" id="emp" name="emp" style="width:100px;" class="checkBtn btn btn-light" value="직원" onclick="changeType(${l.num}, '직원')"/>
							</c:if>
							<c:if test="${l.memType=='직원'}">
								<input type="button" id="man" name="man" style="width:100px;" class="checkBtn btn btn-light" value="관리자" onclick="changeType(${l.num}, '관리자')"/>
								<input type="button" id="pub" name="pub" style="width:100px;" class="checkBtn btn btn-light" value="일반" onclick="changeType(${l.num}, '일반')"/>
							</c:if>
						</td>
	                  </tr>
                  </c:forEach>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
          <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
        </div>
      </div>
      <!-- /.container-fluid -->

      <!-- Sticky Footer -->
      <footer class="sticky-footer">
        <div class="container my-auto">
          <div class="copyright text-center my-auto">
            <span>Copyright © GOOTTOUR 2019</span>
          </div>
        </div>
      </footer>

    </div>
    <!-- /.content-wrapper -->

  </div>
  <!-- /#wrapper -->

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <!-- Logout Modal-->
  <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">로그아웃  하시겠습니까?</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">"Logout"버튼을 누르면 로그아웃 됩니다.</div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
          <a class="btn btn-primary" href="logout">Logout</a>
        </div>
      </div>
    </div>
  </div>

  <!-- Bootstrap core JavaScript-->
  <script src="/tour/resources/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="/tour/resources/js/jquery.easing.min.js"></script>

  <!-- Page level plugin JavaScript-->
  <script src="/tour/resources/js/jquery.dataTables.js"></script>
  <script src="/tour/resources/js/dataTables.bootstrap4.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="/tour/resources/js/sb-admin.min.js"></script>

  <!-- Demo scripts for this page-->
  <script src='https://cdn.datatables.net/fixedheader/3.1.2/js/dataTables.fixedHeader.min.js'></script>
  <script>
   $(document).ready(function() {
	  $('#dataTable').DataTable({
			  'fixedHeader': true
	  });
	});
</script>
</body>
</html>