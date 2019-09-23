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
					aria-expanded="false"> <img
					src="${pageContext.request.contextPath}/images/male.png"
					class="img-thumbnail rounded-circle" width=30 height=30 />
					(${utilisateurCourant.credit})
				</a>

				<div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
					<a href="${pageContext.request.contextPath}/accueilServlet"
						class="dropdown-item align-middle">Liste enchères</a> <a
						href="${pageContext.request.contextPath}/creerEnchereServlet"
						class="dropdown-item align-middle">Vendre article</a>
					<div class="dropdown-divider"></div>
					<a
						href="${pageContext.request.contextPath}/visualiserMonProfilServlet"
						class="dropdown-item align-middle">Mon profil</a> <a
						href="${pageContext.request.contextPath}/visualiserMesVentesServlet"
						class="dropdown-item align-middle">Mes ventes <span
						class="badge badgeVendeurNonRetire">${nbArticleVendeurNonRetire}</span>
						<span class="badge badgeVendeurNonGagne">${nbArticleVendeurNonGagne}</span>
					</a> <a
						href="${pageContext.request.contextPath}/visualiserMesAchatsServlet"
						class="dropdown-item align-middle">Mes achats <span
						class="badge badgeAcheteurNonRetire">${nbArticleAcheteur}</span>
					</a> <a
						href="${pageContext.request.contextPath}/deconnecterUtilisateurServlet"
						class="dropdown-item align-middle">Déconnexion</a>
				</div>
			</div>

			<a href="${pageContext.request.contextPath}/accueilServlet"
				class="btn mx-2 align-middle d-none d-sm-block">Liste
				enchères</a> <a
				href="${pageContext.request.contextPath}/creerEnchereServlet"
				class="btn mx-2 align-middle d-none d-sm-block">Vendre article</a>

			<div class="dropdown d-none d-sm-block">
				<a class="btn mx-1 dropdown-toggle" href="#" role="button"
					id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <img
					src="${pageContext.request.contextPath}/images/male.png"
					class="img-thumbnail rounded-circle" width=30 height=30 />
					${utilisateurCourant.pseudo} (${utilisateurCourant.credit})
				</a>

				<div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
					<a
						href="${pageContext.request.contextPath}/visualiserMonProfilServlet"
						class="dropdown-item align-middle">Mon profil</a> <a
						href="${pageContext.request.contextPath}/visualiserMesVentesServlet"
						class="dropdown-item align-middle">Mes ventes <span
						class="badge badgeVendeurNonRetire">${nbArticleVendeurNonRetire}</span>
						<span class="badge badgeVendeurNonGagne">${nbArticleVendeurNonGagne}</span>
					</a> <a
						href="${pageContext.request.contextPath}/visualiserMesAchatsServlet"
						class="dropdown-item align-middle">Mes achats <span
						class="badge badgeAcheteurNonRetire">${nbArticleAcheteur}</span>
					</a> <a
						href="${pageContext.request.contextPath}/deconnecterUtilisateurServlet"
						class="dropdown-item align-middle">Déconnexion</a>
				</div>
			</div>
		</div>
	</div>
</nav>
<div class="logo row">
	<div class="col-3"></div>
	<div class="col-6 text-center">
		<img class="center-block" src="images/losnalogo.png">
	</div>
</div>