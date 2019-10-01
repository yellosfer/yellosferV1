package fr.yellosfer.dal;

import java.sql.Connection;
import java.util.List;

import fr.yellosfer.bo.Image;

public interface ImageDAO {

	public void insert(Image image, Connection cnx) throws DALException;
	public void delete(int id, Connection cnx) throws DALException;
	public List<Image> selectAll(Connection cnx) throws DALException;
	public Image selectById(int id, Connection cnx) throws DALException;
	public void update(Image image, Connection cnx) throws DALException;
}
