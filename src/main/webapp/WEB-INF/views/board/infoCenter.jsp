<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	pageName = "고객센터";
	pageSideName = "공지사항";
	pageImage = "main_img_banner_6.jpg";
%>
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

<!-- Custom fonts for this template-->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css">
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>

<!-- Page level plugin CSS-->
<link href="/tour/resources/css/dataTables.bootstrap4.css" rel="stylesheet">

<!-- Custom styles for this template-->
<link href="/tour/resources/css/sb-admin.css" rel="stylesheet">
<link rel='stylesheet' href='https://cdn.datatables.net/fixedheader/3.1.2/css/fixedHeader.dataTables.min.css'>

<script>
	$(document).ready(function() {
	  $('#dataTable').DataTable({
	    'fixedHeader': true
	  });
	});
	$("#bannerImg1").prop("src","/tour/image/<%=pageImage%>");
	$("#imgBannerText>h1").text("<%=pageName%>");
	$("#imgBannerText>h2").text("<%=pageSideName%>");
</script>
<style>
	*{font-family:'Noto Sans KR',sans-serif;}
	#infoPan{width:100%; height:1000px}
	h4{text-align:left; margin-left:30px; margin-top:20px}
	#infoPage{width:100%;}
	#infoTable{border:1px solid #bbb; width:90%;margin:0px auto;margin-bottom:20px; table-layout: fixed;}
	thead{border-bottom:3px double gray}
	#searchNwrite{width:90%; margin:0px auto;}
	#infoSearch{float:left; text-align:left; width:95%; }
	#infoSearch input{text-align:left}
	#write{text-align:right; }
	hr{border:0; height: 3px; background:#ccc linear-gradient(to right, rgba(0, 0, 0, 0), rgba(0, 0, 0, 0.75), rgba(0, 0, 0, 0));}
	
	#infoTable tr th:nth-child(1), #infoTable tr th:nth-child(5){width:8%;}
	#infoTable tr th:nth-child(2){width:50%;}
	#infoTable td{white-space:nowrap; text-overflow:ellipsis; overflow:hidden;} 
	
	#sidebar-wrapper{width:200px; position:absolute; left:168px; top:633px;}
	#sidebar-top{text-align: left;  height: 50px;  line-height: 40px; font-size: 30px;}
	#sidebar-content a{text-align: left;}
	
	.dataTables_length{text-align:left;}
	.dataTables_info{text-align:left;}
</style>

<section style="padding-top:100px;">
	<div id="sidebar-wrapper">
		<div id="sidebar-top" class="sidebar-heading">커뮤니티</div>
		<div id="sidebar-content" class="list-group list-group-flush">
			<a href="list?commuPage=review" class="list-group-item list-group-item-action">여행후기</a>
			<a href="list?commuPage=trevelQ" class="list-group-item list-group-item-action">여행문의</a>
		</div>
	</div>
	<h4>여행문의</h4><hr/>
	<div class="card mb-3">
          <div class="card-header" style="text-align: left;">
            <i class="fas fa-table"></i>
            여행문의</div>
          <div class="card-body">
            <div class="table-responsive">
              <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                  <tr>
                  	<th>번호</th>
			  		<th>제목</th>
			  		<th>글쓴이</th>
			  		<th>날짜</th>
			  		<th>조회수</th>
                  </tr>
                </thead>
                <tbody>
                    <c:forEach var="v" items="${lst }">
                    	<tr>
                    		<td>${v.no}</td>
		  					<td><a href="post?num=${v.num}">${v.subject}</a></td>
		  					<td>${v.userId}</td>
		  					<td>${v.regDate}</td>
		  					<td>${v.hit}</td>
                    	</tr>
                    </c:forEach>
                </tbody>
              </table>
            </div>
             <c:if test="${memType!=null}">
          		<button id="write" onclick="location.href='write?commuPage=${vo.commuPage}'" style="float:right;width:80px;text-align:center;">글쓰기</button>
          	</c:if>
          </div>
          <div class="card-footer small text-muted" style="text-align:left;">
          	
          </div>
        </div>
     
        
        <a class="scroll-to-top rounded" href="#page-top">
	      <i class="fas fa-angle-up"></i>
	    </a>
	    
</section>
