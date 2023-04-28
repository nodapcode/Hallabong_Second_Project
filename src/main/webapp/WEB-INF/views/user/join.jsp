<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>미니 프로젝트</title>
<!-- Bootstrap CDN -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
	<script type="text/javascript">
	/* 로그인 */
	function checkUserIDExist() {
	      
	      var id = $("#id").val()
	      
	      if(id.length==0){
	         alert('아이디를 입력해주세요')
	         return
	      }
	   
	      $.ajax({
	         url : '${root}user/checkUserIDExist/'+id,
	         type : 'get',
	         dataType : 'text',
	         success : function (result) {
	            if(result.trim() == "true"){
	               alert('사용할 수 있는 아이디입니다.')
	               $("#custIdExist").val('true')
	            } else {
	               alert('사용할 수 없는 아이디입니다.')
	               $("#custIdExist").val('false')
	            }
	         }
	               
	      });   // ajax
	   } // checkUserIdExist
	   
	   // 사용자가 아이디란에 입력하면 무조건 false
	   function resetUserIdExist() {
	      $("#custIdExist").val('false')
	   }
	</script>
	<!-- 주소 api -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
							<script>
							window.onload = function(){
							    document.getElementById("addr1").addEventListener("click", function(){ //주소입력칸을 클릭하면
							        //카카오 지도 발생
							        new daum.Postcode({
							            oncomplete: function(data) { //선택시 입력값 세팅
							                document.getElementById("addr1").value = data.address; // 주소 넣기
							                document.querySelector("input[name=addr_detail]").focus(); //상세입력 포커싱
							            }
							        }).open();
							    });
							    
							}
							</script>
						
 <!-- 휴대폰인증 api -->
<script type="text/javascript">
$(function(){
	//휴대폰 번호 인증var code2 = "";
	
	$("#tell").click(function(){
		
		var phone = $("#tel").val();

		if(phone.length==0){
			alert('휴대번호를 확인해주세요')
			return
		}else{
	    	alert('인증번호 발송이 완료되었습니다.\n휴대폰에서 인증번호 확인을 해주십시오.');
		}
		
	    $.ajax({
	        type:"POST", // post 형식으로 발송
	        url:"${root}user/sendSMS1.do", // controller 위치
	        data: {tel:phone}, // 전송할 ㅔ이터값
	        cache : false,
	        success:function(data){
	            if(data == "error"){ //실패시 
	                alert("휴대폰 번호가 올바르지 않습니다.")
	            }else{            //성공시        
	            	console.log(phone)
	                alert("휴대폰 전송이  됨.")
	                code2 = data; // 성공하면 데이터저장
	            }
	        }
	        
	    });
	});

	//휴대폰 인증번호 대조
	  $("#tell2").click(function(){
	      if($("#tel2").val() == code2){ // 위에서 저장한값을 ㅣ교함
	           alert('인증성공')
	           $("#custtelExist").val('true')
	      }else{
	          alert('인증실패')
	          $("#custtelExist").val('false')
	      }
	  });
});
function resetUsertelExist() {
    $("#custtelExist").val('true')
 }
 
</script>

</head>
<body>
	<c:import url="/WEB-INF/views/include/top.jsp" />
<div class="container" style="margin-top:100px">
	<div class="row">
		<div class="col-sm-3"></div>
		<div class="col-sm-6">
			<div class="card shadow">
				<div class="card-body">
					<form:form action="${root }user/join_pro" method="post" modelAttribute="joinusecuCustBean">
					<form:hidden path="custIdExist"/>
					<form:hidden path="custtelExist"/>
						<div class="form-group">
							<form:label path="id">아이디</form:label>
							<div class="input-group">
							<!-- onkeypress : 클라이언트가 이벤트(키보드 또는 마우스)를 발생시키면 자동으로 동작 -->
								<form:input path="id" class="form-control" onkeypress="resetUserIdExist()"/>
								<div class="input-group-append">
									<button type="button" class="btn btn-primary" onclick='checkUserIDExist()'>중복확인</button>
								</div>
							</div>
							<form:errors path="id" style="color:red"/>
						</div>
						<div class="form-group">
							<form:label path="pw">비밀번호</form:label>
							<form:password path="pw" class="form-control"/>
							<form:errors path="pw" style="color:red"/>
						</div>
						<div class="form-group">
							<form:label path="pw2">비밀번호 확인</form:label>
							<form:password path="pw2" class="form-control"/>
							<form:errors path="pw2" style="color:red"/>
						</div>
						<div class="form-group">
							<form:label path="name">이름</form:label>
							<form:input path="name" class="form-control"/>
							<form:errors path="name" style="color:red"/>
						</div>
						<div class="form-group">
							<form:label path="email">이메일</form:label>
							<form:input path="email" class="form-control"/>
							<form:errors path="email" style="color:red"/>
						</div>

						<div class="form-group">
							<form:label path="tel">전화번호</form:label>
							<form:input path="tel" class="form-control"/>
							<form:errors path="tel" style="color:red"/>
						</div>
						<div>
							<input type="button" id="tell" value="인증번호 전송"/>
							
						</div>
						<div class="form-group">
							<form:label path="tel2">인증번호 입력</form:label>
							<form:input path="tel2" class="form-control"/>
							<form:errors path="tel2" style="color:red"/>
						</div>
						<div>
							<input type="button" id="tell2" onclick='resetUsertelExist()' value="인증번호 확인"/>
						</div>
						<div class="form-group">
						<form:label path="addr1">주소</form:label>
							<form:input path="addr1" size="30" readonly="true" />
							<form:errors path="addr1" style="color:red"/>
						</div>
						<div>
						<form:label path="addr_detail">상세주소</form:label>
							<form:input path="addr_detail" size="30" />	
							<form:errors path="addr_detail"  style="color:red"/>
						</div>
					
						<div class="form-group">
							<form:label path="gender">성별</form:label>
							
							<p>
							<form:label path="gender">남자</form:label> 
							<form:radiobutton path="gender" class="form-control" value="m"/>
							<form:label path="gender">여자</form:label>
							<form:radiobutton path="gender" class="form-control" value="f"/>
							<form:errors path="gender" style="color:red"/>
						</div>
						
						<div class="form-group">
							<form:label path="dob">생일</form:label>
							<form:input path="dob" class="form-control"/>
							<form:errors path="dob" style="color:red"/>
						</div>
						
						<div class="form-group">
							<div class="text-right">
								<form:button class="btn btn-primary">회원가입</form:button>
							</div>
						</div>
	
					</form:form>
				</div>
			</div>
		</div>
		<div class="col-sm-3"></div>
	</div>
</div>
	<c:import url="/WEB-INF/views/include/bottom_info.jsp" />
</body>
</html>








