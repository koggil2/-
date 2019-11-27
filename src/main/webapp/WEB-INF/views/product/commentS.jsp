<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 댓글 ajax -->	
<script>
var goodCode = '${comment.goodCode}'; //게시글 번호
//댓글 등록
function commentInsert(insertData){
	console.log(insertData);
	var params = insertData
    $.ajax({
        url : '/tour/product/reply/insert',
        type : 'POST',
        data : params,
        success : function(data){
        	console.log("5555");
            if(data == 1) {
                commentList(); //댓글 작성 후 댓글 목록 reload
                $('[name=content]').val('');
            }
        }
    });
}
 
 
$('[name=commentInsertBtn]').click(function(){ //댓글 등록 버튼 클릭시 
    var insertData = $('[name=commentInsertForm]').serialize(); //commentInsertForm의 내용을 가져옴
    console.log(insertData);
    commentInsert(insertData); //Insert 함수호출(아래)
    
});

//댓글 목록 
function commentList(){
    $.ajax({
        url : 'reply/list',
        type : 'post',
        data : {'goodCode':'${vo.goodCode}'},
        dataType : 'json',
        success : function(data){
            console.log(data);
        	var a =''; 
             $.each(data, function(key, value){ 
                a += '<div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom: 15px;">';
                a += '<div class="commentInfo'+value.num+'">'+'댓글번호 : '+value.num+' / 작성자 : '+value.userId;
                a += '<a onclick="commentUpdate('+value.num+',\''+value.content+'\');"> 수정 </a>';
                a += '<a onclick="commentDelete('+value.num+');"> 삭제 </a> </div>';
                a += '<div class="commentContent'+value.num+'"> <p> 내용 : '+value.content +'</p>';
                a += '</div></div>';
            });
            
            $(".commentList").html(a); 
        }
    });
}

 
//댓글 수정 - 댓글 내용 출력을 input 폼으로 변경 
function commentUpdate(num, content){
    var a ='';
    
    a += '<div class="input-group">';
    a += '<input type="text" class="form-control" name="content_'+num+'" value="'+content+'"/>';
    a += '<span class="input-group-btn"><button class="btn btn-default" type="button" onclick="commentUpdateProc('+num+');">수정</button> </span>';
    a += '</div>';
    
    $('.commentContent'+num).html(a);
    
}
 
//댓글 수정
function commentUpdateProc(num){
    var updateContent = $('[name=content_'+num+']').val();
    
    $.ajax({
        url : 'reply/update',
        type : 'post',
        data : {'content' : updateContent, 'num' : num},
        success : function(data){
            if(data == 1) commentList(goodCode); //댓글 수정후 목록 출력 
        }
    });
}
 
//댓글 삭제 
function commentDelete(num){
    $.ajax({
        url : 'reply/delete/'+num,
        type : 'post',
        success : function(data){
            if(data == 1) commentList(goodCode); //댓글 삭제후 목록 출력 
        }
    });
}
 
 
$(document).ready(function(){
    commentList(); //페이지 로딩시 댓글 목록 출력 
});
 
</script>