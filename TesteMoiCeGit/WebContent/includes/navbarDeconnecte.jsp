<nav class="navbar navbar-expand-lg navbar-light bg-light mb-5">
	<div class="container-fluid">
		<div class="navbar-header">

			<a class="navbar-brand"
				href="${pageContext.request.contextPath}/accueilServlet"> <img
				src="images/logoicon.png" alt="" width=30 height=30>LOSNA
			</a>
		</div>

		<div class="nav navbar-nav navbar-right">
			<div class="dropdown d-block d-sm-none">
				<a class="btn mx-2 dropdown-toggle" href="#" role="button"
					id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false">
					<button class="btn">
						<span class="white-text"><i class="fas fa-bars"></i></span>
					</button>
				</a>
				<div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
					<a
						href="${pageContext.request.contextPath}/inscrireUtilisateurServlet"
						class="dropdown-item align-middle">S'inscrire</a> <a
						href="${pageContext.request.contextPath}/connecterUtilisateurServlet"
						class="dropdown-item align-middle">Se connecter</a>
				</div>
			</div>

			<a
				href="${pageContext.request.contextPath}/inscrireUtilisateurServlet"
				class="btn mx-2 d-none d-sm-block">S'inscrire</a> <a
				href="${pageContext.request.contextPath}/connecterUtilisateurServlet"
				class="btn mx-2 d-none d-sm-block">Se connecter</a>
		</div>
	</div>
</nav>
<div class="logo row">
	<div class="col-3"></div>
	<div class="col-6 text-center">
		<img class="center-block" src="images/losnalogo.png">
	</div>
</div>