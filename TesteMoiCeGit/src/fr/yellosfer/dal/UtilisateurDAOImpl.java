package fr.yellosfer.dal;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import fr.eni.javaee.commun.ConnectionProvider;
import fr.eni.javaee.commun.DAOException;
import fr.eni.javaee.connexion.dal.UtilisateurDAOJdbcImpl;
import fr.eni.javaee.encheres.bo.Enchere;
import fr.yellosfer.bo.Utilisateur;

public class UtilisateurDAOImpl implements UtilisateurDAO {

	private final static String SQL_INSERT_UTILISATEUR = "Insert into Encheres values (?,?,?,?,?,?,?,?)";
	private final static String SQL_SELECT_UTILISATEUR_BYID = "Select * From Encheres WHERE no_enchere=?";
	private final static String SQL_SELECT_UTILISATEUR_ALL = "Select * From Encheres";
	private final static String SQL_UPDATE_UTILISATEUR = "Update Encheres SET date_debut_enchere=?,date_fin_enchere=?,"
			+ "montant_debut_enchere=?,montant_actuel_enchere=?,vente_fini=?,no_utilisateur_vendeur=?,no_utilisateur_acquereur=?,no_article=?"
			+ " WHERE no_enchere=? ";
	private final static String DELETE_UTILISATEUR = "Delete from Encheres WHERE no_enchere=?";

	@Override
	public void insert(Utilisateur u) throws DALException {

		try (Connection cnx = ConnectionProvider.getConnection()) {

			PreparedStatement pstmt = cnx.prepareStatement(SQL_INSERT_UTILISATEUR, Statement.RETURN_GENERATED_KEYS);

			pstmt.setDate(1, Date.valueOf(u.getDateDebutEnchere()));
			pstmt.setDate(2, Date.valueOf(u.getDateFinEnchere()));
			pstmt.setInt(3, en.getMontantDebutEnchere());
			pstmt.setInt(4, en.getMontantActuelEnchere());
			pstmt.setBoolean(5, en.isVenteFini());
			pstmt.setInt(6, en.getUtilisateurVendeur().getNoUtilisateur());
			pstmt.setInt(7, en.getUtilisateurAcquereur().getNoUtilisateur());
			pstmt.setInt(8, en.getArticleVendu().getNoArticle());
			pstmt.executeUpdate();

			ResultSet rs = pstmt.getGeneratedKeys();
			if (rs.next()) {
				en.setNoEnchere(1);
			}
		} catch (SQLException e) {
			throw new DAOException("EnchereDAOJdbcImpl : insert : " + e.getMessage());
		}
	}

	@Override
	public Enchere selectById(int id) throws DAOException {
		Enchere en = null;
		try (Connection cnx = ConnectionProvider.getConnection();) {

			PreparedStatement pstmt = cnx.prepareStatement(SELECT_ENCHERE_ID);
			pstmt.setInt(1, id);
			ResultSet rs = pstmt.executeQuery();

			if (rs.next()) {
				en = enchereBuilder(rs);
			}

		} catch (SQLException e) {
			throw new DAOException("EnchereDAOJdbcImpl : selectById : " + e.getMessage());
		}

		return en;
	}

	@Override
	public List<Enchere> selectAll() throws DAOException {
		List<Enchere> listeE = new ArrayList<>();

		try (Connection cnx = ConnectionProvider.getConnection()) {

			Statement stmt = cnx.createStatement();
			ResultSet rs = stmt.executeQuery(SELECT_ENCHERE_ALL);		

			while (rs.next()) {
				Enchere e = enchereBuilder(rs);
				listeE.add(e);
			}

		} catch (SQLException e) {
			throw new DAOException("EnchereDAOJdbcImpl : selectAll : " + e.getMessage());
		}

		return listeE;
	}

	@Override
	public List<Enchere> selectByCategory(String categorie) throws DAOException {
		List<Enchere> listeE = new ArrayList<>();

		try (Connection cnx = ConnectionProvider.getConnection()) {

			PreparedStatement pstmt = cnx.prepareStatement(SELECT_ENCHERE_CATEGORY);
			
			pstmt.setString(1, categorie);
			
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				Enchere e = enchereBuilder(rs);
				listeE.add(e);
			}

		} catch (SQLException e) {
			throw new DAOException("EnchereDAOJdbcImpl : selectAll : " + e.getMessage());
		}

		return listeE;
	}
	
	@Override
	public List<Enchere> selectByNomArticle(String nomArticle) throws DAOException {
		List<Enchere> listeE = new ArrayList<>();

		try (Connection cnx = ConnectionProvider.getConnection()) {

			PreparedStatement pstmt = cnx.prepareStatement(SELECT_ENCHERE_NOM_ARTICLE);
			
			pstmt.setString(1, nomArticle);
			
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				Enchere e = enchereBuilder(rs);
				listeE.add(e);
			}

		} catch (SQLException e) {
			throw new DAOException("EnchereDAOJdbcImpl : selectAll : " + e.getMessage());
		}

		return listeE;
	}
	
	@Override
	public List<Enchere> selectByCategorieAndName(String categorie, String nomArticle) throws DAOException {
		List<Enchere> listeE = new ArrayList<>();

		try (Connection cnx = ConnectionProvider.getConnection()) {

			PreparedStatement pstmt = cnx.prepareStatement(SELECT_ENCHERE_CATEGORY_AND_NAME);
			
			pstmt.setString(1, categorie);
			pstmt.setString(2, nomArticle);
			
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				Enchere e = enchereBuilder(rs);
				listeE.add(e);
			}

		} catch (SQLException e) {
			throw new DAOException("EnchereDAOJdbcImpl : selectAll : " + e.getMessage());
		}

		return listeE;
	}
	

	@Override
	public void delete(int id) throws DAOException {
		
		try (Connection cnx = ConnectionProvider.getConnection()) {
			
			PreparedStatement pstmt = cnx.prepareStatement(DELETE_ENCHERE);
			
			pstmt.setInt(1, id);
			pstmt.executeQuery(DELETE_ENCHERE);
			
		} catch (SQLException e) {
			throw new DAOException("EnchereDAOJdbcImpl : delete " + e.getMessage());
		}
	}

	@Override
	public void update(Enchere en) throws DAOException {

		try (Connection cnx = ConnectionProvider.getConnection()) {
			
			PreparedStatement pstmt = cnx.prepareStatement(UPDATE_ENCHERE);

			pstmt.setDate(1, Date.valueOf(en.getDateDebutEnchere()));
			pstmt.setDate(2, Date.valueOf(en.getDateFinEnchere()));
			pstmt.setInt(3, en.getMontantDebutEnchere());
			pstmt.setInt(4, en.getMontantActuelEnchere());
			pstmt.setBoolean(5, en.isVenteFini());
			pstmt.setInt(6, en.getUtilisateurVendeur().getNoUtilisateur());
			pstmt.setInt(7, en.getUtilisateurAcquereur().getNoUtilisateur());
			pstmt.setInt(8, en.getArticleVendu().getNoArticle());
			pstmt.setInt(9, en.getNoEnchere());
			pstmt.executeUpdate();

		} catch (SQLException e) {
			throw new DAOException("EnchereDAOJdbcImpl : update : " + e.getMessage());
		}
	}
	
	@Override
	public void updateSansConnexion(Enchere en, Connection cnx) throws DAOException {

		try {
			
			PreparedStatement pstmt = cnx.prepareStatement(UPDATE_ENCHERE);

			pstmt.setDate(1, Date.valueOf(en.getDateDebutEnchere()));
			pstmt.setDate(2, Date.valueOf(en.getDateFinEnchere()));
			pstmt.setInt(3, en.getMontantDebutEnchere());
			pstmt.setInt(4, en.getMontantActuelEnchere());
			pstmt.setBoolean(5, en.isVenteFini());
			pstmt.setInt(6, en.getUtilisateurVendeur().getNoUtilisateur());
			pstmt.setInt(7, en.getUtilisateurAcquereur().getNoUtilisateur());
			pstmt.setInt(8, en.getArticleVendu().getNoArticle());
			pstmt.setInt(9, en.getNoEnchere());
			pstmt.executeUpdate();

		} catch (SQLException e) {
			throw new DAOException("EnchereDAOJdbcImpl : update : " + e.getMessage());
		}
	}

	public Enchere enchereBuilder(ResultSet rs) throws SQLException, DAOException {
		Enchere e = new Enchere();
		UtilisateurDAOJdbcImpl u = new UtilisateurDAOJdbcImpl();
		ArticleVenduDAOJdbcImpl a = new ArticleVenduDAOJdbcImpl();

		e.setNoEnchere(rs.getInt("no_enchere"));
		e.setDateDebutEnchere(rs.getDate("date_debut_enchere").toLocalDate());
		e.setDateFinEnchere(rs.getDate("date_fin_enchere").toLocalDate());
		e.setMontantDebutEnchere(rs.getInt("montant_debut_enchere"));
		e.setMontantActuelEnchere(rs.getInt("montant_actuel_enchere"));
		e.setVenteFini(rs.getBoolean("vente_fini"));
		e.setUtilisateurVendeur(u.selectById(rs.getInt("no_utilisateur_vendeur")));
		e.setUtilisateurAcquereur(u.selectById(rs.getInt("no_utilisateur_acquereur")));
		e.setArticleVendu(a.selectById(rs.getInt("no_article")));

		return e;
	}
	
}