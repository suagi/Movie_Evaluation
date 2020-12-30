<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="views/common/10_header.jsp"></jsp:include>
<%
	String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
%>
<header class="masthead" style="background-image: url('img/home-bg.jpg')">
<div class="overlay"></div>
    <div class="container">
   		<div class="row">
    		<div class="col-lg-8 col-md-10 mx-auto">
    		<div class="site-heading">
    			<h1>JSP Portfolio</h1>
    			<span class="subheading">Movie Evaluation</span>
    		</div>
    		</div>
    	</div>
	</div>
</header>
  <section class="featured spad">
        <div class="container">
<form method="get" action="./index.jsp" class="form-inline mt-3">
			<select name="lectureDivide" class="form-control mx-1 mt-2">
				<option value="All">All</option>
				<option value="Title">Title</option>
				<option value="Director">Director</option>
			</select>
			<input type="text" name="search" class="form-control mx-1 mt-2">
			<button type="submit" class="btn btn-secondary mx-1 mt-2">Search</button>
			<%
				if (userID != null && userID.equals("KING")) {
			%>
			<a class="btn btn-secondary ml-auto" href="moviePosting.jsp">Posting</a>
			<%
				}
			%>
		</form>
		<hr>
            <div class="row">
                <div class="col-lg-12">
                    <div class="post-title">
                        <h2>All Movie</h2>
                    </div>
                </div>
            </div>
		<div class="row featured__filter">
			<div class="col-lg-3 col-md-4 col-sm-6 mix oranges fresh-meat">
				<div class="featured__item">
					<div class="featured__item__pic set-bg"
						data-setbg="img/featured/feature-1.jpg">
						<ul class="featured__item__pic__hover">

						</ul>
					</div>
					<div class="featured__item__text">
						<h5>
							<a href="movieDetail.jsp">기생충</a>
						</h5>
					</div>
				</div>
			</div>
			<div class="col-lg-3 col-md-4 col-sm-6 mix vegetables fastfood">
				<div class="featured__item">
					<div class="featured__item__pic set-bg"
						data-setbg="img/featured/feature-2.jpg">
						<ul class="featured__item__pic__hover">

						</ul>
					</div>
					<div class="featured__item__text">
						<h5>
							<a href="#">Crab Pool Security</a>
						</h5>
					</div>
				</div>
			</div>
			<div class="col-lg-3 col-md-4 col-sm-6 mix vegetables fresh-meat">
				<div class="featured__item">
					<div class="featured__item__pic set-bg"
						data-setbg="img/featured/feature-3.jpg">
						<ul class="featured__item__pic__hover">

						</ul>
					</div>
					<div class="featured__item__text">
						<h5>
							<a href="#">Crab Pool Security</a>
						</h5>
					</div>
				</div>
			</div>
			<div class="col-lg-3 col-md-4 col-sm-6 mix fastfood oranges">
				<div class="featured__item">
					<div class="featured__item__pic set-bg"
						data-setbg="img/featured/feature-4.jpg">
						<ul class="featured__item__pic__hover">

						</ul>
					</div>
					<div class="featured__item__text">
						<h5>
							<a href="#">Crab Pool Security</a>
						</h5>
					</div>
				</div>
			</div>
		</div>
	</div>
    </section>
<jsp:include page="views/common/90_footer.jsp"></jsp:include>
