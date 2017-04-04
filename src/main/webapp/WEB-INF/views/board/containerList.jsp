<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div style="width: 90%; margin-top: 10%">
	<table id="articlelist">
		<tr>
			<th colspan="5" style="">총게시글수: ${count} 건</th>
		</tr>
		<tr>
			<td>No</td>
			<td>ID</td>
			<td>제목</td>
			<td>등록일</td>
			<td>조회수</td>
		</tr>

		<c:forEach var="article" items="${requestScope.list}">
			<!-- sevelet 에서 list 담아서 준다 -->

			<tr>
				<td>${article.seq}</td>
				<td>${article.id}</td>
				<td><a
					href="${context}/board.do?action=detail&page=articleDetail&seq='${article.seq}">${article.title}</a></td>
				<td>${article.regdate}</td>
				<td>${article.readCount}</td>
			</tr>
		</c:forEach>
	</table>
	</div>
	<nav id="pagination">
		<ul>
		<c:if test="${requestScope.prevBlock gt 0 }">
		<a  style="color:white" href="${context}/board.do?action=list&page=articleList&pageNO=${requestScope.prevBlock}">◀ PREV</a>
		</c:if>
			<c:forEach  begin="${requestScope.blockStart}" end="${requestScope.blockEnd}" step="1" varStatus="i" >
			<li style="text-align: center; width: 20px">
			<c:choose>
				<c:when test="${i.index eq pageNO}">			
					<a href="#"><font style="color: red">${i.index}</font></a>
			</c:when>
			<c:otherwise>
			 <a style="color:white" href="${context}/board.do?action=list&page=articleList&pageNO=${i.index}">${i.index}</a>
			</c:otherwise>
			</c:choose>
				</li>
			</c:forEach>
			<c:if test="${requestScope.nextBlock le count}">
			<li>
			<a style="color:white" href="${context}/board.do?action=list&page=articleList&pageNO=${requestScope.nextBlock}">NEXT▶</a>
			</li>
			</c:if>
		</ul>
	</nav>
	이전블록-시작페이지 ${blockStart}, 다음블록-시작페이지${nextBlock}
	

 
<script>
	$(function() {
		var $articleList = $('#articlelist');
		$articleList.addClass('table_default').addClass('table_bottom')
				.addClass('margin_center').css('text-align', ' right').css(
						'width', '500px').css('margin-top','15px');
		$articelList.find('th:nth-child(1)').css('text-align', 'left');
		var $pagination=$('#pagination');
		$pagination.addClass('margin_center').css('margin','0 auto').css('width','500px').css('height','50px');
		$pagination.find('ul:nth-child(1)').addClass('gnb').css('height','50px'); 	/*고치기*/
	});
</script>
<script>

</script>
