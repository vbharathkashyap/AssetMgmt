package com.tp.asset.dao.impl;



import javax.security.auth.login.CredentialNotFoundException;

import com.tp.asset.dao.UserDao;


/**
 * @author CENTAUR
 */
public class UserDaoImpl implements UserDao
{

		
	String Credentials;
	public String getCredentials()
	{
			return this.Credentials;
	}

	public void setCredentials(String Credentials)
	{
			this.Credentials = Credentials;
	}
	public boolean isValidUser(String username, String password) throws CredentialNotFoundException
	{
			System.out.println(Credentials);
			if (username.equalsIgnoreCase(Credentials) && password.equalsIgnoreCase(Credentials))
					return true;
			else
					return false;
	}

	/*DataSource dataSource;
		public DataSource getDataSource()
		{
				return this.dataSource;
		}

		public void setDataSource(DataSource dataSource)
		{
				this.dataSource = dataSource;
		}*/

		/*@Override
		public boolean isValidUser(String username, String password) throws SQLException
		{
				String query = "Select count(1) from user where username = ? and password = ?";
				PreparedStatement pstmt = dataSource.getConnection().prepareStatement(query);
				pstmt.setString(1, username);
				pstmt.setString(2, password);
				ResultSet resultSet = pstmt.executeQuery();
				if (resultSet.next())
						return (resultSet.getInt(1) > 0);
				else
						return false;
		}*/

}