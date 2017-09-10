<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp" %>
<c:set var="red" value="빨강이야~~"/>
<title>게시판</title>
<script>
function callback(result){
//	result = JSON.parse(result);
	/** Bootstrap 통한 속성값 불러오기 **/
	$("#table").bootstrapTable(
		{data : result}		
	);
	/* var str = "";
	for(var i=0, max=result.length;i<max;i++){
		var b = result[i];
		str +="<tr align='center'>";
		str +="<td>"+ b.bNum + "</td>";
		str +="<td>"+ b.title + "</td>";
		str +="<td>"+ b.content + "</td>";
		str +="<td>"+ b.writer + "</td>";
		str +="<td>"+ b.regDate + "</td>";
		//str +=b.bNum+","+ b.title +"," + b.content + "," + b.writer + "<br>";
	} 
	$("#r_tbody").html(str); */
}

function getBoardList(content){
	var param ={};
	param["command"]= "list";
	if(content){
		param["content"]= content;
	}
	param = JSON.stringify(param);
	var ja = new JqAjax("list.board",param);
	ja.changeFunc(callback);
	ja.send();
}	
$(document).ready(function(){
	getBoardList();
	$("#btnSearch").click(function(){
		var searchStr = $("#searchStr").val().trim();
		if(!searchStr){
			alert("검색할 내용을 적어 주세요!");
			$("#seachStr").val("");
			$("#seachStr").focus();
			return;
		}
		getBoardList(searchStr);
	});
})
</script>
</head>
<body>
내용 : <input type="text" name="searchStr" id="searchStr"/>
<input type="button" value="검색" id="btnSearch"/>
<table id="table" data-height="450" class="table table-bordered table-hover"  border="1">
	<thead>
		<tr align="center">
			<th data-field="bNum" class="text-center">번호</th>
			<th data-field="title" class="text-center">이름</th>
			<th data-field="writer" class="text-center">생성자</th>
			<th data-field="regDate" class="text-center">생성일자</th>
			<th data-field="content" class="text-center">내용</th>			
		 </tr>
	</thead>
	<tbody id="r_tbody">
	</tbody>
</table>
</body>
</html>