package fr.yellosfer.dal;

import java.sql.Connection;
import java.util.List;

import fr.yellosfer.bo.Commentaire;


public interface CommentaireDAO {

	public void insert(Commentaire commentaire, Connection cnx) throws DALException;
	public void delete(int id, Connection cnx) throws DALException;
	public List<Commentaire> selectAll(Connection cnx) throws DALException;
	public Commentaire selectById(int id, Connection cnx) throws DALException;
	public void update(Commentaire commentaire, Connection cnx) throws DALException;
}
