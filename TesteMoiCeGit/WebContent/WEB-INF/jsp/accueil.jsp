<%@include file="/includes/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/param.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/accueil.css">

<title>YELLOSFER</title>
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
		<div class="page-header text-center mb-3">
			<h1>Liste des enchères</h1>
			<hr>
		</div>
		<div class="row mb-3">
			<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12"></div>
			<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 text-center">${message}</div>
			<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12"></div>
		</div>
		<div class="page-header text-left mb-3">
			<h3>Filtres :</h3>
		</div>
		<form method="post"
			action="${pageContext.request.contextPath}/accueilServlet">
			<div class="row">
				<div class="col-lg-2 col-md-2 col-sm-2 d-xs-none"></div>
				<div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
					<div class="col-12">

						<div class="input-group">
							<div class="input-group-prepend">
								<span class="input-group-text" id="basic-addon1">Mots
									clés :</span>
							</div>
							<input type="text" class="form-control"
								placeholder="Samsung Galaxy S12" aria-label="text"
								aria-describedby="Search" name="recherche" id="recherche">
						</div>
					</div>
					<div class="col-lg-12 mt-3 mb-3">
						<div class="input-group">
							<div class="input-group-prepend">
								<label class="input-group-text" for="categorie">Catégories
									:</label>
							</div>
							<select class="form-control" data-toggle="dropdown"
								id="categorie" name="categorie">
								<option class="form-control" value=0 selected>Toutes</option>
								<option class="form-control" value=1>Informatique</option>
								<option class="form-control" value=2>Ameublement</option>
								<option class="form-control" value=3>Vêtement</option>
								<option class="form-control" value=4>Sport&Loisirs</option>
							</select>
						</div>
					</div>
				</div>
				<div class="col-lg-2 col-md-2 col-sm-2 col-xs-12 mb-2">
					<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
						<input type="submit" class="btn btn-md" value="Rechercher">
					</div>
				</div>
			</div>
		</form>


		<c:if test="${!empty listeArticleRecherche}">
			<c:forEach items="${listeArticleRecherche}" var="articleRecherche">
				<div
					class="card col-md-5 col-sm-5 col-xs-12 mr-5 my-2 p-0 d-inline-block">
					<div class="card-horizontal">

						<div class="img-square-wrapper">
							<c:if test="${empty articleRecherche.image}">
								<img class="card-img m-2 img-thumbnail"
									src="images/encheres/generic.png" alt="Image introuvable">
							</c:if>
							<c:if test="${!empty articleRecherche.image}">
								<img class="card-img m-2 img-thumbnail"
									src="images/encheres/${articleRecherche.image}"
									alt="Image introuvable">
							</c:if>

						</div>
						<div class="card-body">
							<div>
								<h3>
									<c:if
										test="${utilisateurCourant.no_utilisateur == articleRecherche.no_utilisateur}">
										<a
											href="${pageContext.request.contextPath}/modifierEnchereServlet?no_article=${articleRecherche.no_article}"><span
											class="badge badge-light float-right badge-modifier">
												<i class="fa fa-pencil" title="Modifier l'enchère"></i>
										</span></a>
									</c:if>
									<c:if
										test="${utilisateurCourant.no_utilisateur != articleRecherche.no_utilisateur}">
										<a
											href="${pageContext.request.contextPath}/visualiserDetailEnchereServlet?no_article=${articleRecherche.no_article}"><span
											class="badge badge-light float-right badge-detail"> <i
												class="fa fa-eye" title="Visualiser l'enchère"></i></span></a>
									</c:if>
								</h3>
							</div>
							<h4 class="card-title">${articleRecherche.nom_article}</h4>
							<p class="card-text">Prix Initial :
								${articleRecherche.prix_initial}</p>
							<p class="card-text">Dernière Enchère :
								${articleRecherche.prix_vente}</p>
							<p class="card-text">Description :
								${articleRecherche.description}</p>
						</div>
					</div>
					<div class="card-footer">
					<fmt:parseDate pattern="yyyy-MM-dd" value="${articleRecherche.date_debut_enchere}" var="datedebut" />
					<fmt:parseDate pattern="yyyy-MM-dd" value="${articleRecherche.date_fin_enchere}" var="datefin" />
					
						<small class="text-muted">Début Enchère : <fmt:formatDate type = "date" value = "${datedebut}" /> > Fin Enchère : <fmt:formatDate type = "date" value = "${datefin}" /></small>
						
					
					</div>
				</div>
			</c:forEach>
		</c:if>
	</div>

	<%@include file="/includes/footer.jsp"%>