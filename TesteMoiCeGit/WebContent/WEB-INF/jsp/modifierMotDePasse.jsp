<%@include file="/includes/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/param.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/modifierProfil.css">

<title>LOSNA - Modifier Profil</title>
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
			<h1>Modifier mon mot de passe</h1>
			<hr>
		</div>
		<div class="row mb-3">
			<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12"></div>
			<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 text-center">${message}</div>
			<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12"></div>
		</div>
		<form method="post"
			action="${pageContext.request.contextPath}/modifierMotDePasseServlet">
			<div class="row">
				<div class=col-3></div>
				<div class="input-group mb-3 col-lg-6 col-md-6 col-sm-6 col-xs-12">
					<div class="input-group-prepend">
						<span class="input-group-text" id="basic-addon1">Mot de
							passe actuel</span>
					</div>
					<input type="password" class="form-control"
						placeholder="Mot de passe actuel" aria-label="Username"
						aria-describedby="basic-addon1" name="motDePasseActuel">
				</div>
				<div class=col-3></div>
				<div class="input-group mb-3 col-lg-6 col-md-6 col-sm-6 col-xs-12">
					<div class="input-group-prepend">
						<span class="input-group-text" id="basic-addon1">Nouveau
							mot de passe</span>
					</div>
					<input type="password" class="form-control"
						placeholder="Nouveau mot de passe" aria-label="Username"
						aria-describedby="basic-addon1" name="nouveauMotDePasse">
				</div>
				<div class="input-group mb-3 col-lg-6 col-md-6 col-sm-6 col-xs-12">
					<div class="input-group-prepend">
						<span class="input-group-text" id="basic-addon1">Confirmation</span>
					</div>
					<input type="password" class="form-control"
						placeholder="Confirmation" aria-label="Username"
						aria-describedby="basic-addon1"
						name="confirmationNouveauMotDePasse">
				</div>
			</div>
			<div class="form-group mt-3 text-center">
				<input type="submit" class="btn btn-md mx-3"
					value="Valider Modification">
			</div>
		</form>
	</div>

	<%@include file="/includes/footer.jsp"%>