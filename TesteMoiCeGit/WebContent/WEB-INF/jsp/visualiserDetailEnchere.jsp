<%@include file="/includes/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/param.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/visualiserDetailEnchere.css">

<title>LOSNA - Login</title>
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
			<h1>Détail de l'Enchère</h1>
			<hr>
		</div>
		<div class="row mb-3">
			<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12"></div>
			<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 text-center">${message}</div>
			<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12"></div>
		</div>

		<form method="post"
			action="${pageContext.request.contextPath}/visualiserDetailEnchereServlet">
			<div class="row">
				<div
					class="image col-lg-3 col-md-3 col-sm-3 col-xs-12 mb-4 ml-4 mr-4">
					<img src="images/encheres/${articleVisu.image}" alt="..."
						class="img-thumbnail rounded">
				</div>

				<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text" id="basic-addon1">Article</span>
						</div>
						<div class="form-control">${articleVisu.nom_article}</div>
					</div>

					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text">Description</span>
						</div>
						<div class="form-control">${articleVisu.description}</div>
					</div>

					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text" id="basic-addon1">Catégorie</span>
						</div>
						<div class="form-control">${categorieVisu.libelle}</div>
					</div>

					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text" id="basic-addon1">Meilleure
								offre</span>
						</div>
						<c:if test="${empty enchereVisu.montant_enchere}">
							<div class="form-control">Aucune enchère en cours.</div>
						</c:if>
						<c:if test="${!empty enchereVisu.montant_enchere}">
							<input type="hidden" value="${enchereVisu.montant_enchere}"
								name="derniereEnchere" id="derniereEnchere">
							<div class="form-control">${enchereVisu.montant_enchere}
								par <a
									href="${pageContext.request.contextPath}/visualiserAutreProfilServlet?no_utilisateur=${acheteurVisu.no_utilisateur}">
									${acheteurVisu.pseudo} </a>
							</div>
						</c:if>
					</div>

					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text" id="basic-addon1">Mise à
								prix</span>
						</div>
						<div class="form-control">${articleVisu.prix_initial }</div>
					</div>

					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text" id="basic-addon1">Fin de
								l'enchère</span>
						</div>
							<fmt:parseDate pattern="yyyy-MM-dd"
							value="${articleVisu.date_fin_enchere}" var="datefin" />

						<div class="form-control"><fmt:formatDate
								type="date" value="${datefin}" /></div>
					</div>

					<div class="panel panel-info">
						<!-- Contenu avec la classe .panel-default -->
						<div class="panel-heading">Retrait</div>
						<div class="panel-body">
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text" id="basic-addon1">Rue</span>
								</div>
								<div class="form-control">${retraitVisu.rue}</div>
							</div>
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text" id="basic-addon1">Code
										Postal</span>
								</div>
								<div class="form-control">${retraitVisu.code_postal}</div>
							</div>
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text" id="basic-addon1">Ville</span>
								</div>
								<div class="form-control">${retraitVisu.ville}</div>
							</div>
						</div>
					</div>

					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text" id="basic-addon1">Vendeur</span>
						</div>
						<a
							href="${pageContext.request.contextPath}/visualiserAutreProfilServlet?no_utilisateur=${vendeurVisu.no_utilisateur}"
							class="form-control"> ${vendeurVisu.pseudo}</a>
					</div>

					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text" id="basic-addon1">Ma
								proposition</span>
						</div>
						<c:if test="${empty enchereVisu.montant_enchere}">
							<input class="form-control" type="number" name="montant_enchere"
								id="montant_enchere" min="${articleVisu.prix_initial}"
								value="${articleVisu.prix_initial}" step="10"
								id="example-number-input">
						</c:if>
						<c:if test="${!empty enchereVisu.montant_enchere}">
							<input class="form-control" type="number" name="montant_enchere"
								id="montant_enchere" min="${enchereVisu.montant_enchere}"
								value="${enchereVisu.montant_enchere}" step="10"
								id="example-number-input">
						</c:if>
						<small class="form-text text-muted">Les enchères se font
							par pas de 10 points.</small>
					</div>

					<div class="row">
						<div class="col-lg-2 col-md-2 col-sm-2 col-xs-12"></div>
						<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 input-group-append">
							<input type="submit" class="input-group-append btn btn-md mb-2"
								value="Enchérir">
						</div>
						<div class="col-lg-2 col-md-2 col-sm-2 col-xs-12"></div>
						<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
							<a href="${pageContext.request.contextPath}/accueilServlet" class="btn btn-md mb-2">Retour</a>
						</div>
						<div class="col-lg-2 col-md-2 col-sm-2 col-xs-12"></div>
					</div>




				</div>
			</div>
		</form>
	</div>

	<%@include file="/includes/footer.jsp"%>