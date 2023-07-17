<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="/resources/sum/summernote-lite.js"></script>
<script src="/resources/sum/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="/resources/sum/summernote-lite.css">
<style>
form {
	text-align: center;
}
</style>
<body>
	<form action="/" method="post">
		<textarea id="summernote" name="editordata"></textarea>
		<input type="button" class="btn btn-secondary mt-3 mx-2" value="작성취소" />
		<input type="submit" class="btn btn-primary mt-3 mx-2" value="작성완료" />
	</form>

	<script>

    $(document).ready(function(){ 
        $('#summernote').summernote({ 
            height : 300, 
            width : 700, 
            lang : "ko-KR", 
            callbacks:{ 
                onImageUpload : function(files){ 
                   uploadSummernoteImageFile(files[0],this); 
               } 
            } 
        }); 
        function uploadSummernoteImageFile(file,editor){ 
            data = new FormData(); 
            data.append("file",file); 
            $.ajax({ 
         data:data, 
         type:"POST", 
         url:"../board/uploadSummernoteImageFile", 
         dataType:"JSON", 
         contentType:false, 
         processData:false, 
         success:function(data){ 
             $(editor).summernote("insertImage",data.url); 
             $("#thumbnailPath").append("<option value="+data.url+">"+data.originName+"</option>"); 

         } 

     }); 


        } 


    }); 

</script>