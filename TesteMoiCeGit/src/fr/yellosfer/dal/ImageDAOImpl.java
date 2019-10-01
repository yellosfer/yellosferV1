package fr.yellosfer.dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import fr.yellosfer.bo.Image;

public class ImageDAOImpl implements ImageDAO{

	private final static String SQL_INSERT_IMAGE = "INSERT INTO IMAGE values (?)";
	private final static String SQL_SELECT_IMAGE_BY_ID = "SELECT * FROM IMAGE WHERE idImage=?";
	private final static String SQL_SELECT_IMAGE_ALL = "SELECT * FROM IMAGE";
	private final static String SQL_UPDATE_IMAGE = "UPDATE IMAGE SET pathImage=? WHERE idImage=?";
	private final static String SQL_DELETE_IMAGE = "DELETE FROM IMAGE WHERE idImage=?";

	@Override
	public void insert(Image i, Connection cnx) throws DALException {

		try {

			PreparedStatement pstmt = cnx.prepareStatement(SQL_INSERT_IMAGE, Statement.RETURN_GENERATED_KEYS);
			pstmt.setString(1, i.getPathImage());
			
			pstmt.executeUpdate();

			ResultSet rs = pstmt.getGeneratedKeys();
			if (rs.next()) {
				i.setIdImage(rs.getInt(1));
			}
		} catch (SQLException e) {
			throw new DALException("ImageDAOImpl - insert : " + e.getMessage());
		}
	}

	@Override
	public Image selectById(int id, Connection cnx) throws DALException {
		Image i = null;
		try {

			PreparedStatement pstmt = cnx.prepareStatement(SQL_SELECT_IMAGE_BY_ID);
			pstmt.setInt(1, id);
			ResultSet rs = pstmt.executeQuery();

			if (rs.next()) {
				i = imageBuilder(rs);
			}

		} catch (SQLException e) {
			throw new DALException("ImageDAOImpl - selectById : " + e.getMessage());
		}

		return i;
	}	
	
	@Override
	public List<Image> selectAll(Connection cnx) throws DALException {
		List<Image> listeI = new ArrayList<>();

		try {

			Statement stmt = cnx.createStatement();
			ResultSet rs = stmt.executeQuery(SQL_SELECT_IMAGE_ALL);		

			while (rs.next()) {
				Image u = imageBuilder(rs);
				listeI.add(u);
			}

		} catch (SQLException e) {
			throw new DALException("ImageDAOImpl - selectAll : " + e.getMessage());
		}

		return listeI;
	}
	

	@Override
	public void delete(int id, Connection cnx) throws DALException {
		
		try {
			
			PreparedStatement pstmt = cnx.prepareStatement(SQL_UPDATE_IMAGE);
			
			pstmt.setInt(1, id);
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			throw new DALException("ImageDAOImpl - delete " + e.getMessage());
		}
	}

	@Override
	public void update(Image i, Connection cnx) throws DALException {

		try {
			
			PreparedStatement pstmt = cnx.prepareStatement(SQL_DELETE_IMAGE);
			pstmt.setString(1, i.getPathImage());
			pstmt.setInt(2, i.getIdImage());
			
			pstmt.executeUpdate();

		} catch (SQLException e) {
			throw new DALException("ImageDAOImpl - update : " + e.getMessage());
		}
	}
	

	public Image imageBuilder(ResultSet rs) throws SQLException {
		Image i = new Image();
		
		i.setIdImage(rs.getInt("idImage"));
		i.setPathImage(rs.getString("pathImage"));

		return i;
	}
}
