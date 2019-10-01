package fr.yellosfer.dal;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import fr.yellosfer.bo.Utilisateur;

public class UtilisateurDAOImpl implements UtilisateurDAO {

	private final static String SQL_INSERT_UTILISATEUR = "INSERT INTO UTILISATEUR values (?,?,?,?,?,?,?,?,?,?)";
	private final static String SQL_SELECT_UTILISATEUR_BY_ID = "SELECT * FROM UTILISATEUR WHERE idUtilisateur=?";
	private final static String SQL_SELECT_UTILISATEUR_BY_IDENTIFIANT = "SELECT * FROM UTILISATEUR WHERE pseudoUtilisateur=? OR emailUtilisateur=? ";
	private final static String SQL_SELECT_UTILISATEUR_ALL = "SELECT * FROM UTILISATEUR";
	private final static String SQL_UPDATE_UTILISATEUR = "UPDATE UTILISATEUR SET imageUtilisateur=?,pseudoUtilisateur=?,prenomUtilisateur=?,"
			+ "nomUtilisateur=?,emailUtilisateur=?,mdpUtilisateur=?,dateInscriptionUtilisateur=?,meilleurPositionUtilisateur=?,"
			+ "nombreAnnonceUtilisateur=?,actifUtilisateur=? WHERE idUtilisateur=?";
	private final static String SQL_DELETE_UTILISATEUR = "DELETE FROM UTILISATEUR WHERE idUtilisateur=?";

	@Override
	public void insert(Utilisateur u) throws DALException {

		try (Connection cnx = ConnectionProvider.getConnection()) {

			PreparedStatement pstmt = cnx.prepareStatement(SQL_INSERT_UTILISATEUR, Statement.RETURN_GENERATED_KEYS);
			pstmt.setString(1, u.getImageUtilisateur());
			pstmt.setString(2, u.getPseudoUtilisateur());
			pstmt.setString(3, u.getPrenomUtilisateur());
			pstmt.setString(4, u.getNomUtilisateur());
			pstmt.setString(5, u.getEmailUtilisateur());
			pstmt.setString(6, u.getMdpUtilisateur());
			pstmt.setDate(7, Date.valueOf(u.getDateInscriptionUtilisateur().toString()));
			pstmt.setInt(8, u.getMeilleurPositionUtilisateur());
			pstmt.setInt(9, u.getNombreAnnonceUtilisateur());
			pstmt.setBoolean(10, u.isActifUtilisateur());
			
			pstmt.executeUpdate();

			ResultSet rs = pstmt.getGeneratedKeys();
			if (rs.next()) {
				u.setIdUtilisateur(rs.getInt(1));
			}
		} catch (SQLException e) {
			throw new DALException("UtilisateurDAOImpl - insert : " + e.getMessage());
		}
	}

	@Override
	public Utilisateur selectById(int id) throws DALException {
		Utilisateur u = null;
		try (Connection cnx = ConnectionProvider.getConnection();) {

			PreparedStatement pstmt = cnx.prepareStatement(SQL_SELECT_UTILISATEUR_BY_ID);
			pstmt.setInt(1, id);
			ResultSet rs = pstmt.executeQuery();

			if (rs.next()) {
				u = utilisateurBuilder(rs);
			}

		} catch (SQLException e) {
			throw new DALException("UtilisateurDAOImpl - selectById : " + e.getMessage());
		}

		return u;
	}

	
	@Override
	public Utilisateur selectByIdentifiant(String pseudo) throws DALException {
		Utilisateur u = null;
		try (Connection cnx = ConnectionProvider.getConnection();) {

			PreparedStatement pstmt = cnx.prepareStatement(SQL_SELECT_UTILISATEUR_BY_IDENTIFIANT);
			pstmt.setString(1, pseudo);
			pstmt.setString(2, pseudo);
			ResultSet rs = pstmt.executeQuery();

			if (rs.next()) {
				u = utilisateurBuilder(rs);
			}

		} catch (SQLException e) {
			throw new DALException("UtilisateurDAOImpl - selectByIdentifiant : " + e.getMessage());
		}

		return u;
	}
	
	
	@Override
	public List<Utilisateur> selectAll() throws DALException {
		List<Utilisateur> listeU = new ArrayList<>();

		try (Connection cnx = ConnectionProvider.getConnection()) {

			Statement stmt = cnx.createStatement();
			ResultSet rs = stmt.executeQuery(SQL_SELECT_UTILISATEUR_ALL);		

			while (rs.next()) {
				Utilisateur u = utilisateurBuilder(rs);
				listeU.add(u);
			}

		} catch (SQLException e) {
			throw new DALException("UtilisateurDAOImpl - selectAll : " + e.getMessage());
		}

		return listeU;
	}
	

	@Override
	public void delete(int id) throws DALException {
		
		try (Connection cnx = ConnectionProvider.getConnection()) {
			
			PreparedStatement pstmt = cnx.prepareStatement(SQL_DELETE_UTILISATEUR);
			
			pstmt.setInt(1, id);
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			throw new DALException("UtilisateurDAOImpl - delete " + e.getMessage());
		}
	}

	@Override
	public void update(Utilisateur u) throws DALException {

		try (Connection cnx = ConnectionProvider.getConnection()) {
			
			PreparedStatement pstmt = cnx.prepareStatement(SQL_UPDATE_UTILISATEUR);
			pstmt.setString(1, u.getImageUtilisateur());
			pstmt.setString(2, u.getPseudoUtilisateur());
			pstmt.setString(3, u.getPrenomUtilisateur());
			pstmt.setString(4, u.getNomUtilisateur());
			pstmt.setString(5, u.getEmailUtilisateur());
			pstmt.setString(6, u.getMdpUtilisateur());
			pstmt.setDate(7, Date.valueOf(u.getDateInscriptionUtilisateur().toString()));
			pstmt.setInt(8, u.getMeilleurPositionUtilisateur());
			pstmt.setInt(9, u.getNombreAnnonceUtilisateur());
			pstmt.setBoolean(10, u.isActifUtilisateur());
			pstmt.setInt(11, u.getIdUtilisateur());
			
			pstmt.executeUpdate();

		} catch (SQLException e) {
			throw new DALException("UtilisateurDAOImpl - update : " + e.getMessage());
		}
	}
	

	public Utilisateur utilisateurBuilder(ResultSet rs) throws SQLException {
		Utilisateur u = new Utilisateur();
		
		u.setIdUtilisateur(rs.getInt("idUtilisateur"));
		u.setImageUtilisateur(rs.getString("imageUtilisateur"));
		u.setPseudoUtilisateur(rs.getString("pseudoUtilisateur"));
		u.setPrenomUtilisateur(rs.getString("prenomUtilisateur"));
		u.setNomUtilisateur(rs.getString("nomUtilisateur"));
		u.setEmailUtilisateur(rs.getString("emailUtilisateur"));
		u.setMdpUtilisateur(rs.getString("mdpUtilisateur"));
		u.setDateInscriptionUtilisateur(rs.getDate("dateInscriptionUtilisateur").toLocalDate());
		u.setMeilleurPositionUtilisateur(rs.getInt("meilleurPositionUtilisateur"));
		u.setNombreAnnonceUtilisateur(rs.getInt("nombreAnnonceUtilisateur"));
		u.setActifUtilisateur(rs.getBoolean("actifUtilisateur"));

		return u;
	}
	
}