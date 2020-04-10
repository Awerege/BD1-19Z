package bdlab;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

import javax.management.Query;

public class DBTest {
	public static class Klienci {
		private int id;
		
		private String first_name;

		private String last_name;
		
		private int client_type_id;

		public int getclient_type_id() {
			return client_type_id;
		}

		public void setclient_type_id(int client_type_id) {
			this.client_type_id = client_type_id;
		}

		public int getid() {
			return id;
		}

		public void setid(int id) {
			this.id = id;
		}

		public String getfirst_name() {
			return first_name;
		}

		public void setfirst_name(String first_name) {
			this.first_name = first_name;
		}

		public String getlast_name() {
			return last_name;
		}

		public void setlast_name(String last_name) {
			this.last_name = last_name;
		}


		public Klienci(int id, String firstName, String lastName) {
			super();
			this.id = id;
			this.first_name = first_name;
			this.last_name = last_name;
			this.client_type_id = client_type_id;
		}

		public Klienci() {
		}
		
		public String toString() {
			return String.format("Klienci(%d, %s, %s, %d)", id, first_name, last_name, client_type_id); 
		}
	}

	public final static ResultSetToBean<Klienci> KlienciConverter = new ResultSetToBean<Klienci>() {
		public Klienci convert(ResultSet rs) throws Exception {
			Klienci w = new Klienci();
			w.setid(rs.getInt("id"));
			w.setfirst_name(rs.getString("first_name"));
			w.setlast_name(rs.getString("last_name"));
			w.setclient_type_id(rs.getInt("client_type_id"));
			return w;
		}
	};

	public static void main(String[] args) {

		List<Klienci> client = DBManager
				.run(new Query() {
					public void prepareQuery(PreparedStatement ps)
							throws Exception {
						ps.setInt(1, 1);
					}
				}, KlienciConverter,
						"select id, first_name, last_name, client_type_id from client where client_type_id = ?");

		for (Klienci w: client) {
			System.out.println(w);
		}
		
		boolean result = DBManager.run(new Task<Boolean>() {
			public Boolean execute(PreparedStatement ps) throws Exception {
				ps.setInt(1, 1);
				ps.setInt(2, 8);
				return ps.executeUpdate() > 0;
			}
		}, "update client set client_type_id = ? where id = ?");
	
		System.out.println(result ? "Udalo sie" : "Nie udalo sie");
		
		client = DBManager
				.run(new Query() {
					public void prepareQuery(PreparedStatement ps)
							throws Exception {
						ps.setInt(1, 1);
					}
				}, KlienciConverter,
						"select id, first_name, last_name, client_type_id from client where client_type_id = ?");

		
		for (Klienci w: client) {
			System.out.println(w);
		}
		
		// INSERT
		result = DBManager.run(new Task<Boolean>() {
			public Boolean execute(PreparedStatement ps) throws Exception {
				//ps.setInt(1, 3);
				//ps.setInt(2, 8);
				return ps.executeUpdate() > 0;
			}
		}, "insert into client (id, first_name, last_name, client_type_id) values (client_seq.nextval, 'Aaron', 'Reld', 2)");
	
		System.out.println(result ? "Udalo sie" : "Nie udalo sie");
		
		// SELECT
		client = DBManager
				.run(new Query() {
					public void prepareQuery(PreparedStatement ps)
							throws Exception {
						//ps.setInt(1, 1);
					}
				}, KlienciConverter,
						"select id, first_name, last_name, client_type_id from client");

		
		for (Klienci w: client) {
			System.out.println(w);
		}
		
		// DELETE
				result = DBManager.run(new Task<Boolean>() {
					public Boolean execute(PreparedStatement ps) throws Exception {
						ps.setString(1, "Aaron");
						//ps.setInt(2, 8);
						return ps.executeUpdate() > 0;
					}
				}, "Delete from client where first_name = ?");
			
				System.out.println(result ? "Udalo sie" : "Nie udalo sie");
				
				// SELECT
				client = DBManager
						.run(new Query() {
							public void prepareQuery(PreparedStatement ps)
									throws Exception {
								//ps.setInt(1, 1);
							}
						}, KlienciConverter,
								"select id, first_name, last_name, client_type_id from client");

				
				for (Klienci w: client) {
					System.out.println(w);
				}
	}

}
