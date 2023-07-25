<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>'
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<div class="body">
	메인페이지입니다
	<div id="boxoff"></div>
</div>




<script>
$(document).ready(function(){
 var date={
		"serviceKey":"VfowJ6Nu%2BT59459RM3tPRtjF65qPY67RHswtVf%2FetRJeaGsWme7F89Cl9TSI5nz5%2FWiNMuLTyx77QkyHWJt%2B5g%3D%3D",
		"numOfRows":1,
		"pageNo":1,
		"dataType":"JSON",
		"stnId":109,
		"tmFc":"202307250600"		
 }
 $.ajax({ 
	  data:date, 
    type:"get", 
    url:"http://apis.data.go.kr/1360000/MidFcstInfoService/getMidFcst", 
    dataType:"json",
   success:function(data){
	   console.log(data);	   
	},
   error:function(error){
	   console.log(error);
   }
}); 
});
</script>