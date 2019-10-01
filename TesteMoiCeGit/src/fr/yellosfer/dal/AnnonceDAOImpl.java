package fr.yellosfer.dal;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import fr.yellosfer.bo.Annonce;


public class AnnonceDAOImpl implements AnnonceDAO{

	private final static String SQL_INSERT_ANNONCE = "INSERT INTO ANNONCE values (?,?,?,?,?,?,?,?)";
	private final static String SQL_SELECT_ANNONCE_BY_ID = "SELECT * FROM ANNONCE WHERE idAnnonce=?";
	private final static String SQL_SELECT_ANNONCE_ALL = "SELECT * FROM ANNONCE";
	private final static String SQL_UPDATE_ANNONCE = "UPDATE ANNONCE SET titreAnnonce=?, descriptionAnnonce=?, dateCreationAnnonce=?,"
			+ "nbJaimeAnnonce=?, nbJaimePasAnnonce=?, nbPartageAnnonce=?, positionAnnonce=?, actifAnnonce=? WHERE idAnnonce=?";
	private final static String SQL_DELETE_ANNONCE = "DELETE FROM ANNONCE WHERE idAnnonce=?";

	@Override
	public void insert(Annonce a, Connection cnx) throws DALException {

		try {

			PreparedStatement pstmt = cnx.prepareStatement(SQL_INSERT_ANNONCE, Statement.RETURN_GENERATED_KEYS);
			pstmt.setString(1, a.getTitreAnnonce());
			pstmt.setString(2, a.getDescriptionAnnonce());
			pstmt.setDate(2, Date.valueOf(a.getDateCreationAnnonce().toString()));
			pstmt.setInt(4, a.getNbJaimeAnnonce());
			pstmt.setInt(5, a.getNbJaimePasAnnonce());
			pstmt.setInt(6, a.getNbPartageAnnonce());
			pstmt.setInt(7, a.getPositionAnnonce());
			pstmt.setBoolean(8, a.isActifAnnonce());
			
			pstmt.executeUpdate();

			ResultSet rs = pstmt.getGeneratedKeys();
			if (rs.next()) {
				a.setIdAnnonce(rs.getInt(1));
			}
		} catch (SQLException e) {
			throw new DALException("AnnonceDAOImpl - insert : " + e.getMessage());
		}
	}

	@Override
	public Annonce selectById(int id, Connection cnx) throws DALException {
		Annonce a = null;
		try {

			PreparedStatement pstmt = cnx.prepareStatement(SQL_SELECT_ANNONCE_BY_ID);
			pstmt.setInt(1, id);
			ResultSet rs = pstmt.executeQuery();

			if (rs.next()) {
				a = annonceBuilder(rs);
			}

		} catch (SQLException e) {
			throw new DALException("AnnonceDAOImpl - selectById : " + e.getMessage());
		}

		return a;
	}	
	
	@Override
	public List<Annonce> selectAll(Connection cnx) throws DALException {
		List<Annonce> listeA = new ArrayList<>();

		try {

			Statement stmt = cnx.createStatement();
			ResultSet rs = stmt.executeQuery(SQL_SELECT_ANNONCE_ALL);		

			while (rs.next()) {
				Annonce a = annonceBuilder(rs);
				listeA.add(a);
			}

		} catch (SQLException e) {
			throw new DALException("AnnonceDAOImpl - selectAll : " + e.getMessage());
		}

		return listeA;
	}
	

	@Override
	public void delete(int id, Connection cnx) throws DALException {
		
		try {
			
			PreparedStatement pstmt = cnx.prepareStatement(SQL_UPDATE_ANNONCE);
			
			pstmt.setInt(1, id);
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			throw new DALException("AnnonceDAOImpl - delete " + e.getMessage());
		}
	}

	@Override
	public void update(Annonce a, Connection cnx) throws DALException {

		try {
			
			PreparedStatement pstmt = cnx.prepareStatement(SQL_DELETE_ANNONCE);
			pstmt.setString(1, a.getTitreAnnonce());
			pstmt.setString(2, a.getDescriptionAnnonce());
			pstmt.setDate(2, Date.valueOf(a.getDateCreationAnnonce().toString()));
			pstmt.setInt(4, a.getNbJaimeAnnonce());
			pstmt.setInt(5, a.getNbJaimePasAnnonce());
			pstmt.setInt(6, a.getNbPartageAnnonce());
			pstmt.setInt(7, a.getPositionAnnonce());
			pstmt.setBoolean(8, a.isActifAnnonce());
			pstmt.setInt(9, a.getIdAnnonce());
			
			pstmt.executeUpdate();

		} catch (SQLException e) {
			throw new DALException("AnnonceDAOImpl - update : " + e.getMessage());
		}
	}
	

	public Annonce annonceBuilder(ResultSet rs) throws SQLException {
		Annonce a = new Annonce();
		
		a.setIdAnnonce(rs.getInt("idAnnonce"));
		a.setTitreAnnonce(rs.getString("titreAnnonce"));
		a.setDescriptionAnnonce(rs.getString("descriptionAnnonce"));
		a.setDateCreationAnnonce(rs.getDate("dateCreationAnnonce").toLocalDate());
		a.setNbJaimeAnnonce(rs.getInt("nbJaimeAnnonce"));
		a.setNbJaimePasAnnonce(rs.getInt("nbJaimePasAnnonce"));
		a.setNbPartageAnnonce(rs.getInt("nbPartageAnnonce"));
		a.setPositionAnnonce(rs.getInt("positionAnnonce"));
		a.setActifAnnonce(rs.getBoolean("actifAnnonce"));

		return a;
	}
}
