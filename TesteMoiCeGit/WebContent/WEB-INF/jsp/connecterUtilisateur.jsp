<%@include file="/includes/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/param.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/connecterUtilisateur.css">

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
		<div class="page-header text-center mb-3">
			<h1>Identification</h1>
		</div>

		<div class="row mb-3">
			<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12"></div>
			<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 text-center">${message}</div>
			<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12"></div>
		</div>
		<div class="row">
			<div class="col-12">
				<form method="post"
					action="${pageContext.request.contextPath}/connecterUtilisateurServlet">
					<div class="row form-group">
						<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12"></div>
						<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text" id="basic-addon1">Identifiant</span>
								</div>
								<input type="text" class="form-control"
									placeholder="Identifiant" aria-label="Identifiant"
									aria-describedby="basic-addon1" name="identifiant"
									id="identifiant">
							</div>
						</div>
					</div>
					<div class="row form-group mb-5">
						<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12"></div>
						<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text" id="basic-addon1">Mot de
										Passe</span>
								</div>
								<input type="password" class="form-control"
									placeholder="Mot de passe" aria-label="mdp"
									aria-describedby="basic-addon1" name="mot_de_passe"
									id="mot_de_passe">
							</div>
						</div>
					</div>
					<div class="row form-group">
						<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12"></div>
						<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 text-center">
							<div class="row form-group text-center">
								<div
									class="col-lg-4 col-md-4 col-sm-4 col-xs-12 form-group text-center">
									<input type="submit" class="btn btn-md" value="Connexion">
								</div>
								<div
									class="col-lg-8 col-md-8 col-sm-8 col-xs-12 form-group text-center">
		
								</div>
							</div>
						</div>
					</div>
				</form>

			</div>
		</div>
	</div>


	<%@include file="/includes/footer.jsp"%>