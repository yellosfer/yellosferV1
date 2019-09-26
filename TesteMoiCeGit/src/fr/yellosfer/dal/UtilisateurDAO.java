package fr.yellosfer.dal;

import java.util.List;

import fr.yellosfer.bo.Utilisateur;


public interface UtilisateurDAO {
	public void insert(Utilisateur utilisateur) throws DALException;
	public void delete(int id) throws DALException;
	public List<Utilisateur> selectAll() throws DALException;
	public Utilisateur selectById(int id) throws DALException;
	public void update(Utilisateur utilisateur) throws DALException;
	public Utilisateur selectByIdentifiant(String pseudo) throws DALException;
	
}
