<%@include file="/includes/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/param.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/visualiserMesAchats.css">

<title>LOSNA - Liste Enchère</title>
</head>
<body>

	<c:choose>
		<c:when test="${!empty utilisateurCourant}">
			<%@include file="/includes/navbarConnecte.jsp"%>
		</c:when>
		<c:otherwise>
			<%@include file="/includes/navbarDeconnecte.jsp"%>
		</c:otherwise>
	</c:choose>


	<div class="container">
		<div class="page-header text-center  mb-3">
			<h1>Liste des enchères</h1>
			<hr>
		</div>
		<div class="row mb-3">
			<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12"></div>
			<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 text-center">${message}</div>
			<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12"></div>
		</div>
		<div class="page-header text-left mb-3"></div>
		<form method="post"
			action="${pageContext.request.contextPath}/visualiserMesAchatsServlet">
			<div class="row mb-5">
				<div class="row col-lg-6 col-md-6 col-sm-6 col-xs-12 mt-2">
					<div class="input-group mb-0">
						<div class="input-group-prepend">
							<div class="input-group-text">
							<c:if test="${empty encheresOuvertes}">
								<input type="checkbox"
									aria-label="Checkbox for following text input"
									name="encheresOuvertes" id="encheresOuvertes" value="1">
							</c:if>
							
							<c:if test="${!empty encheresOuvertes}">
								<input type="checkbox"
									aria-label="Checkbox for following text input"
									name="encheresOuvertes" id="encheresOuvertes" value="1" checked>
							</c:if>
							
								
							</div>
						</div>
						<label class="form-control">Les Enchères Ouvertes</label>
					</div>
					<div class="input-group mb-0">
						<div class="input-group-prepend">
							<div class="input-group-text">
							<c:if test="${empty mesEncheresEnCours}">
								<input type="checkbox"
									aria-label="Checkbox for following text input"
									name="mesEncheresEnCours" id="mesEncheresEnCours" value="1">
							</c:if>
							
							<c:if test="${!empty mesEncheresEnCours}">
								<input type="checkbox"
									aria-label="Checkbox for following text input"
									name="mesEncheresEnCours" id="mesEncheresEnCours" value="1" checked>
							</c:if>
							
							
							
								
							</div>
						</div>
						<label class="form-control">Mes Enchères En Cours</label>
					</div>
					<div class="input-group mb-0">
						<div class="input-group-prepend">
							<div class="input-group-text">
							
							<c:if test="${empty mesEncheresTermines}">
								<input type="checkbox"
									aria-label="Checkbox for following text input"
									name="mesEncheresTermines" id="mesEncheresTermines" value="1">
							</c:if>
							
							<c:if test="${!empty mesEncheresTermines}">
								<input type="checkbox"
									aria-label="Checkbox for following text input"
									name="mesEncheresTermines" id="mesEncheresTermines" value="1"
									checked>
							</c:if>
							
								
							</div>
						</div>
						<label class="form-control">Mes Enchères Terminées <span
							class="badge badgeAcheteurNonRetire">${nbArticleAcheteur}</span>
						</label>
					</div>
				</div>
				<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 mb-3">
					<div class="col-12">
						<input type="submit" class="btn btn-md mt-2" value="Rechercher">
					</div>
				</div>
			</div>
		</form>




		<c:if test="${!empty encheresOuvertes}">
			<h4 class="">Les Enchères Ouvertes</h4>
			<hr>
			<c:forEach items="${listeArticleEncheresOuvertes}" var="enchereO">
				<div
					class="card col-md-5 col-sm-5 col-xs-12 mr-5 my-2 p-0 d-inline-block">
					<div class="card-horizontal">

						<div class="img-square-wrapper">

							<img class="card-img m-2 img-thumbnail"
								src="images/encheres/${enchereO.image}" alt="Image introuvable">

						</div>
						<div class="card-body">
							<div>
								<h3>
									<span
										class="badge badge-light float-right badge-noncommence ml-2">
										<i class="fa fa-hourglass-1"></i>
									</span>
								</h3>

								<h3>
									<a
										href="${pageContext.request.contextPath}/modifierEnchereServlet?no_article=${enchereO.no_article}">
										<span
										class="badge badge-light float-right badge-modifier ml-2">
											<i class="fa fa-pencil"></i>
									</span>
									</a>
								</h3>
							</div>
							<h4 class="card-title">${enchereO.nom_article}</h4>
							<p class="card-text">${enchereO.description}</p>
						</div>
					</div>
					<div class="card-footer">
						<fmt:parseDate pattern="yyyy-MM-dd"
							value="${enchereO.date_debut_enchere}" var="datedebut" />
						<fmt:parseDate pattern="yyyy-MM-dd"
							value="${enchereO.date_fin_enchere}" var="datefin" />

						<small class="text-muted">Début Enchère : <fmt:formatDate
								type="date" value="${datedebut}" /> > Fin Enchère : <fmt:formatDate
								type="date" value="${datefin}" /></small>

					</div>
				</div>
			</c:forEach>
		</c:if>

		<c:if test="${!empty mesEncheresEnCours}">
			<h4 class="mt-5">Mes Encheres En Cours</h4>
			<hr>
			<c:forEach items="${listeArticleMesEncheresEnCours}" var="encheresEC">
				<div
					class="card col-md-5 col-sm-5 col-xs-12 mr-5 my-2 p-0 d-inline-block">
					<div class="card-horizontal">

						<div class="img-square-wrapper">

							<img class="card-img m-2 img-thumbnail"
								src="images/encheres/${encheresEC.image}"
								alt="Image introuvable">

						</div>
						<div class="card-body">
							<div>
								<h3>
									<span class="badge badge-light float-right badge-encours mr-2">
										<i class="fa fa-hourglass-2"></i>
									</span>
								</h3>
								<h3>
									<span class="badge badge-light float-right badge-prix mr-2">
										${encheresEC.prix_vente}</span>
								</h3>
							</div>

							<h4 class="card-title">${encheresEC.nom_article}</h4>
							<p class="card-text">${encheresEC.description}</p>
						</div>
					</div>
					<div class="card-footer">

						<fmt:parseDate pattern="yyyy-MM-dd"
							value="${encheresEC.date_debut_enchere}" var="datedebut" />
						<fmt:parseDate pattern="yyyy-MM-dd"
							value="${encheresEC.date_fin_enchere}" var="datefin" />

						<small class="text-muted">Début Enchère : <fmt:formatDate
								type="date" value="${datedebut}" /> > Fin Enchère : <fmt:formatDate
								type="date" value="${datefin}" /></small>
					</div>
				</div>
			</c:forEach>
		</c:if>

		<c:if test="${!empty mesEncheresTermines}">
			<h4 class="mt-5">Mes Enchères Terminées</h4>
			<hr>
			<c:forEach items="${listeArticleMesEncheresGagne}" var="encheresT">
				<div
					class="card col-md-5 col-sm-5 col-xs-12 mr-5 my-2 p-0 d-inline-block">
					<div class="card-horizontal">

						<div class="img-square-wrapper">

							<img class="card-img m-2 img-thumbnail"
								src="images/encheres/${encheresT.image}" alt="Image introuvable">

						</div>
						<div class="card-body">
							<div>
								<h3>
									<span class="badge badge-light float-right badge-termine ml-2">
										<i class="fa fa-hourglass-3"></i>
									</span>
								</h3>

								<h3>
									<span class="badge badge-light float-right badge-prix ml-2">
										${encheresT.prix_vente}</span>
								</h3>

								<h3>
									<c:if test="${encheresT.etat_vente == 4}">
										<span class="badge badge-light float-right badge-retire ml-2">
											<i class="fa fa-check-square-o"></i>
										</span>
									</c:if>
									<c:if test="${encheresT.etat_vente == 3}">
										<span
											class="badge badge-light float-right badge-nonretire ml-2">
											<i class="fa fa-times-rectangle-o"></i>
										</span>
									</c:if>
									<c:if test="${encheresT.etat_vente == 5}">
										<span
											class="badge badge-light float-right badge-nonencheri ml-2">
											<i class="fa fa-retweet"></i>
										</span>
									</c:if>
								</h3>
							</div>
							<a
								href="${pageContext.request.contextPath}/gagnerEnchereAcheteurServlet?no_article=${encheresT.no_article}">
								<h4 class="card-title">${encheresT.nom_article}</h4></a>
							<p class="card-text">${encheresT.description}</p>
						</div>
					</div>
					<div class="card-footer">

						<fmt:parseDate pattern="yyyy-MM-dd"
							value="${encheresT.date_debut_enchere}" var="datedebut" />
						<fmt:parseDate pattern="yyyy-MM-dd"
							value="${encheresT.date_fin_enchere}" var="datefin" />

						<small class="text-muted">Début Enchère : <fmt:formatDate
								type="date" value="${datedebut}" /> > Fin Enchère : <fmt:formatDate
								type="date" value="${datefin}" /></small>
					</div>
				</div>
			</c:forEach>
		</c:if>





	</div>
	<%@include file="/includes/footer.jsp"%>