package fr.yellosfer.dal;

import java.sql.Connection;
import java.util.List;

import fr.yellosfer.bo.Annonce;

public interface AnnonceDAO {

	public void insert(Annonce annonce, Connection cnx) throws DALException;
	public void delete(int id, Connection cnx) throws DALException;
	public List<Annonce> selectAll(Connection cnx) throws DALException;
	public Annonce selectById(int id, Connection cnx) throws DALException;
	public void update(Annonce annonce, Connection cnx) throws DALException;
}
