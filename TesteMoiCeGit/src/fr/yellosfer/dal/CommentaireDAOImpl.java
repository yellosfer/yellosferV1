package fr.yellosfer.dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import fr.yellosfer.bo.Commentaire;

public class CommentaireDAOImpl implements CommentaireDAO{

	private final static String SQL_INSERT_COMMENTAIRE = "INSERT INTO COMMENTAIRE values (?)";
	private final static String SQL_SELECT_COMMENTAIRE_BY_ID = "SELECT * FROM COMMENTAIRE WHERE idCommentaire=?";
	private final static String SQL_SELECT_COMMENTAIRE_ALL = "SELECT * FROM COMMENTAIRE";
	private final static String SQL_UPDATE_COMMENTAIRE = "UPDATE COMMENTAIRE SET texteCommentaire=? WHERE idCommentaire=?";
	private final static String SQL_DELETE_COMMENTAIRE = "DELETE FROM COMMENTAIRE WHERE idCommentaire=?";

	@Override
	public void insert(Commentaire c, Connection cnx) throws DALException {

		try {

			PreparedStatement pstmt = cnx.prepareStatement(SQL_INSERT_COMMENTAIRE, Statement.RETURN_GENERATED_KEYS);
			pstmt.setString(1, c.getTexteCommentaire());
			
			pstmt.executeUpdate();

			ResultSet rs = pstmt.getGeneratedKeys();
			if (rs.next()) {
				c.setIdCommentaire(rs.getInt(1));
			}
		} catch (SQLException e) {
			throw new DALException("CommentaireDAOImpl - insert : " + e.getMessage());
		}
	}

	@Override
	public Commentaire selectById(int id, Connection cnx) throws DALException {
		Commentaire c = null;
		try {

			PreparedStatement pstmt = cnx.prepareStatement(SQL_SELECT_COMMENTAIRE_BY_ID);
			pstmt.setInt(1, id);
			ResultSet rs = pstmt.executeQuery();

			if (rs.next()) {
				c = commentaireBuilder(rs);
			}

		} catch (SQLException e) {
			throw new DALException("CommentaireDAOImpl - selectById : " + e.getMessage());
		}

		return c;
	}	
	
	@Override
	public List<Commentaire> selectAll(Connection cnx) throws DALException {
		List<Commentaire> listeC = new ArrayList<>();

		try {

			Statement stmt = cnx.createStatement();
			ResultSet rs = stmt.executeQuery(SQL_SELECT_COMMENTAIRE_ALL);		

			while (rs.next()) {
				Commentaire c = commentaireBuilder(rs);
				listeC.add(c);
			}

		} catch (SQLException e) {
			throw new DALException("CommentaireDAOImpl - selectAll : " + e.getMessage());
		}

		return listeC;
	}
	

	@Override
	public void delete(int id, Connection cnx) throws DALException {
		
		try {
			
			PreparedStatement pstmt = cnx.prepareStatement(SQL_UPDATE_COMMENTAIRE);
			
			pstmt.setInt(1, id);
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			throw new DALException("CommentaireDAOImpl - delete " + e.getMessage());
		}
	}

	@Override
	public void update(Commentaire c, Connection cnx) throws DALException {

		try {
			
			PreparedStatement pstmt = cnx.prepareStatement(SQL_DELETE_COMMENTAIRE);
			pstmt.setString(1, c.getTexteCommentaire());
			pstmt.setInt(2, c.getIdCommentaire());
			
			pstmt.executeUpdate();

		} catch (SQLException e) {
			throw new DALException("CommentaireDAOImpl - update : " + e.getMessage());
		}
	}
	

	public Commentaire commentaireBuilder(ResultSet rs) throws SQLException {
		Commentaire c = new Commentaire();
		
		c.setIdCommentaire(rs.getInt("idCommentaire"));
		c.setTexteCommentaire(rs.getString("texteCommentaire"));

		return c;
	}
	
}
