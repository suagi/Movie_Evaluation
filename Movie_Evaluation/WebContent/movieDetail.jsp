<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="content.MovieVO"%>
<%@ page import="content.MovieDAO"%>
<jsp:include page="views/common/10_header.jsp"></jsp:include>
<%
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		int movieID = 0;
		if (request.getParameter("movieID") != null) {
			movieID = Integer.parseInt(request.getParameter("movieID"));
		}
		if (movieID == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.')");
			script.println("location.href = 'bbs.jsp'");
			script.println("</script>");
		}
		MovieVO movieVO = new MovieDAO().getMovieVO(movieID);	
		
	%>
<header class="masthead"
	style="background-image: url('img/home-bg.jpg')">
	<div class="overlay"></div>
	<div class="container">
		<div class="row">
			<div class="col-lg-8 col-md-10 mx-auto">
				<div class="site-heading">
					<h1><%= movieVO.getMovieTitle() %></h1>
				</div>
			</div>
		</div>
	</div>
</header>
<main class="main-content">
	<div class="container">
		<div class="page">
			<div class="content">
				<div class="row">
					<div class="col-md-6">
						<figure class="movie-poster">
							<img src="dummy/single-image.jpg" alt="#">
						</figure>
					</div>
					<div class="col-md-6">
						<ul class="movie-meta">
							<li><strong>Rating:</strong> <%= movieVO.getMovieRating() %></li>
							<li><strong>Length:</strong> <%= movieVO.getMovieLength() %></li>
							<li><strong>Premiere:</strong> <%= movieVO.getMoviePremiere() %></li>
						</ul>
						<ul class="starring">
							<li><strong>Directors:</strong> <%= movieVO.getMovieDirector() %></li>
							<li><strong>Actors:</strong> <%= movieVO.getMovieActor() %></li>
						</ul>
						<div class="movie-summary">
							<p><%= movieVO.getMovieContent().replaceAll(" ", "&nbsp;")
							.replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("/n", "<br>") %></p>
						</div>
					</div>
				</div>
				<br>
				<hr>
				<br>
				<form method="post" action="writeCommentAction.jsp?bbsID=">
					<div class="form-group">
						<label>Comment</label>
						<textarea name="evaluationContent" class="form-control"
							maxlength="2048" style="height: 80px;"></textarea>
					</div>
					<div class="form-row">
						<div class="form-group col-sm-2 ml-auto">
							<select name="totalScore" class="form-control">
								<option value="1">★</option>
								<option value="2">★★</option>
								<option value="3">★★★</option>
								<option value="4">★★★★</option>
								<option value="5" selected>★★★★★</option>
							</select>
						</div>
						<div class="form-group">
							&nbsp;
							<button type="submit" class="btn btn-secondary ml-auto">Write</button>
							&nbsp;
						</div>
					</div>
				</form>
				<div class="card bg-light mt-3">
					<div class="card-body">
						<p class="card-text">
							<strong>작성자</strong>
						</p>
						<p class="card-text">물고기 귀여워!! 오늘 저녁은 고등어 구이 먹어야겠다</p>
						<div class="row">
							<div class="col-9 text-left">
								<p class="post-meta">
									<small>September 24, 2019&nbsp;&nbsp;&nbsp;<span
										style="color: tomato;">★★★★</span></small>
								</p>
							</div>
							<div class="col-3 text-right">
								<a onclick="return confirm('수정하시겠습니까?')"
									href="./deleteAction.jsp?evaluationID="><small>수정</small></a> <a
									onclick="return confirm('삭제하시겠습니까?')"
									href="./deleteAction.jsp?evaluationID="><small>삭제</small></a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</main>

<jsp:include page="views/common/90_footer.jsp"></jsp:include>