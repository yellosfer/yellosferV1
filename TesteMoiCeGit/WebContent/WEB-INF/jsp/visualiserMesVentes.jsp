<%@include file="/includes/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/param.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/visualiserMesVentes.css">

<title>LOSNA - Mes Ventes</title>
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
			<h1>Mes ventes</h1>
			<hr>
		</div>
		<div class="row mb-3">
			<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12"></div>
			<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 text-center">${message}</div>
			<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12"></div>
		</div>
		<div class="page-header text-left mb-3">
			<h3>Mes Ventes</h3>
		</div>
		<form method="post"
			action="${pageContext.request.contextPath}/visualiserMesVentesServlet">
			<div class="row mb-5">
				<div class="row col-lg-6 col-md-6 col-sm-6 col-xs-12 mt-2">
					<div class="input-group mb-0">
						<div class="input-group-prepend">
							<div class="input-group-text">
							<c:if test="${empty venteNonDebutee}">
								<input type="checkbox"
									aria-label="Checkbox for following text input"
									name="venteNonDebutee" id="venteNonDebutee" value="1">
							</c:if>
							
							<c:if test="${!empty venteNonDebutee}">
								<input type="checkbox"
									aria-label="Checkbox for following text input"
									name="venteNonDebutee" id="venteNonDebutee" value="1" checked>
							</c:if>
							
							
							</div>
						</div>
						<label class="form-control">Mes Ventes Non Débutées</label>
					</div>
					<div class="input-group mb-0">
						<div class="input-group-prepend">
							<div class="input-group-text">
							<c:if test="${empty venteEnCours}">
								<input type="checkbox"
									aria-label="Checkbox for following text input"
									name="venteEnCours" id="venteEnCours" value="1">
							</c:if>
							
							<c:if test="${!empty venteEnCours}">
								<input type="checkbox"
									aria-label="Checkbox for following text input"
									name="venteEnCours" id="venteEnCours" value="1" checked>
							</c:if>
							
							
								
							</div>
						</div>
						<label class="form-control">Mes Ventes En Cours</label>
					</div>
					<div class="input-group mb-0">
						<div class="input-group-prepend">
							<div class="input-group-text">
							
							<c:if test="${empty venteTerminee}">
							<input type="checkbox"
									aria-label="Checkbox for following text input"
									name="venteTerminee" id="venteTerminee" value="1">
							</c:if>
							
							<c:if test="${!empty venteTerminee}">
							<input type="checkbox"
									aria-label="Checkbox for following text input"
									name="venteTerminee" id="venteTerminee" value="1" checked>
							</c:if>
							
								
							</div>
						</div>
						<label class="form-control">Mes Ventes Terminées <span
							class="badge badgeVendeurNonRetire">${nbArticleVendeurNonRetire}</span>
							<span class="badge badgeVendeurNonGagne">${nbArticleVendeurNonGagne}</span>
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

		<c:if test="${!empty venteNonDebutee}">
			<h4 class="">Mes Ventes Non Débutées</h4>
			<hr>
			<c:forEach items="${listeArticleNonDebutee}" var="articleNonDebutee">
				<div
					class="card col-md-5 col-sm-5 col-xs-12 mr-5 my-2 p-0 d-inline-block">
					<div class="card-horizontal">

						<div class="img-square-wrapper">

							<img class="card-img m-2 img-thumbnail"
								src="images/encheres/${articleNonDebutee.image}"
								alt="Image introuvable">

						</div>
						<div class="card-body">
							<div>
								<h3>
									<span
										class="badge badge-light float-right badge-noncommence ml-2">
										<i class="fa fa-hourglass-1" title="Enchère non commencée"></i>
									</span>
								</h3>

								<h3>
									<a
										href="${pageContext.request.contextPath}/modifierEnchereServlet?no_article=${articleNonDebutee.no_article}">
										<span
										class="badge badge-light float-right badge-modifier ml-2">
											<i class="fa fa-pencil" title="Modifier l'enchère"></i>
									</span>
									</a>
								</h3>
							</div>
							<h4 class="card-title">${articleNonDebutee.nom_article}</h4>
							<p class="card-text">Prix Initial :
								${articleNonDebutee.prix_initial}</p>
							<p class="card-text">Dernière Enchère :
								${articleNonDebutee.prix_vente}</p>
							<p class="card-text">Description :
								${articleNonDebutee.description}</p>
						</div>
					</div>
					<div class="card-footer">

						<fmt:parseDate pattern="yyyy-MM-dd"
							value="${articleNonDebutee.date_debut_enchere}" var="datedebut" />
						<fmt:parseDate pattern="yyyy-MM-dd"
							value="${articleNonDebutee.date_fin_enchere}" var="datefin" />

						<small class="text-muted">Début Enchère : <fmt:formatDate
								type="date" value="${datedebut}" /> > Fin Enchère : <fmt:formatDate
								type="date" value="${datefin}" /></small>
					</div>
				</div>
			</c:forEach>
		</c:if>

		<c:if test="${!empty venteEnCours}">
			<h4 class="mt-5">Mes Ventes En Cours</h4>
			<hr>
			<c:forEach items="${listeArticleEnCours}" var="articleEnCours">
				<div
					class="card col-md-5 col-sm-5 col-xs-12 mr-5 my-2 p-0 d-inline-block">
					<div class="card-horizontal">

						<div class="img-square-wrapper">

							<img class="card-img m-2 img-thumbnail"
								src="images/encheres/${articleEnCours.image}"
								alt="Image introuvable">

						</div>
						<div class="card-body">
							<div>
								<h3>
									<span class="badge badge-light float-right badge-encours mr-2">
										<i class="fa fa-hourglass-2" title="Enchère en cours"></i>
									</span>
								</h3>
								<h3>
									<span class="badge badge-light float-right badge-prix mr-2" title="Meilleure enchère à date">
										${articleEnCours.prix_vente}</span>
								</h3>
							</div>

							<h4 class="card-title">${articleEnCours.nom_article}</h4>
							<p class="card-text">Prix Initial :
								${articleEnCours.prix_initial}</p>
							<p class="card-text">Dernière Enchère :
								${articleEnCours.prix_vente}</p>
							<p class="card-text">Description :
								${articleEnCours.description}</p>
						</div>
					</div>
					<div class="card-footer">
						<fmt:parseDate pattern="yyyy-MM-dd"
							value="${articleEnCours.date_debut_enchere}" var="datedebut" />
						<fmt:parseDate pattern="yyyy-MM-dd"
							value="${articleEnCours.date_fin_enchere}" var="datefin" />

						<small class="text-muted">Début Enchère : <fmt:formatDate
								type="date" value="${datedebut}" /> > Fin Enchère : <fmt:formatDate
								type="date" value="${datefin}" /></small>
					</div>
				</div>
			</c:forEach>
		</c:if>

		<c:if test="${!empty venteTerminee}">
			<h4 class="mt-5">Mes Ventes Terminées</h4>
			<hr>
			<c:forEach items="${listeArticleTermine}" var="articleTermine">
				<div
					class="card col-md-5 col-sm-5 col-xs-12 mr-5 my-2 p-0 d-inline-block">
					<div class="card-horizontal">

						<div class="img-square-wrapper">

							<img class="card-img m-2 img-thumbnail"
								src="images/encheres/${articleTermine.image}"
								alt="Image introuvable">

						</div>
						<div class="card-body">
							<div>
								<h3>
									<span class="badge badge-light float-right badge-termine ml-2">
										<i class="fa fa-hourglass-3" title="Enchère terminée"></i>
									</span>
								</h3>

								<h3>
									<span class="badge badge-light float-right badge-prix ml-2" title="Prix de vente (meilleure enchère)">
										${articleTermine.prix_vente}</span>
								</h3>

								<h3>
									<c:if test="${articleTermine.etat_vente == 4}">
										<span class="badge badge-light float-right badge-retire ml-2">
											<i class="fa fa-check-square-o" title="Article retiré"></i>
										</span>
									</c:if>
									<c:if test="${articleTermine.etat_vente == 3}">
										<span
											class="badge badge-light float-right badge-nonretire ml-2">
											<i class="fa fa-times-rectangle-o" title="Article non retiré"></i>
										</span>
									</c:if>
									<c:if test="${articleTermine.etat_vente == 5}">
										<span
											class="badge badge-light float-right badge-nonencheri ml-2">
											<i class="fa fa-retweet" title="Article non vendu"></i>
										</span>
									</c:if>
								</h3>
							</div>
							<a
								href="${pageContext.request.contextPath}/gagnerEnchereVendeurServlet?no_article=${articleTermine.no_article}">
								<h4 class="card-title">${articleTermine.nom_article}</h4></a>
							<p class="card-text">Prix Initial :
								${articleTermine.prix_initial}</p>
							<p class="card-text">Dernière Enchère :
								${articleTermine.prix_vente}</p>
							<p class="card-text">Description :
								${articleTermine.description}</p>
						</div>
					</div>
					<div class="card-footer">

						<fmt:parseDate pattern="yyyy-MM-dd"
							value="${articleTermine.date_debut_enchere}" var="datedebut" />
						<fmt:parseDate pattern="yyyy-MM-dd"
							value="${articleTermine.date_fin_enchere}" var="datefin" />

						<small class="text-muted">Début Enchère : <fmt:formatDate
								type="date" value="${datedebut}" /> > Fin Enchère : <fmt:formatDate
								type="date" value="${datefin}" /></small>
					</div>
				</div>
			</c:forEach>
		</c:if>

	</div>
	<%@include file="/includes/footer.jsp"%>