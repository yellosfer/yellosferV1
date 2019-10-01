package fr.yellosfer.dal;

import java.util.List;

import fr.yellosfer.bo.Commentaire;


public interface CommentaireDAO {

	public void insert(Commentaire commentaire) throws DALException;
	public void delete(int id) throws DALException;
	public List<Commentaire> selectAll() throws DALException;
	public Commentaire selectById(int id) throws DALException;
	public void update(Commentaire commentaire) throws DALException;
}
