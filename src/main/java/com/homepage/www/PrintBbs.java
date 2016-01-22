package com.homepage.www;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class PrintBbs {
	
	ArrayList<List> showBbs() {
		
		Oracle ora = new Oracle();

		ora.dbConnection();

		ResultSet rs = ora.select("select springbbs_seq, name, title, contents, day from springbbs");

		String seq = "";
		String name = "";
		String title = "";
		String contents = "";
		String day = "";

		ArrayList<List> list = new ArrayList<List>();

		try {
			while (rs.next()) {
				List l = new List();

				seq = rs.getString("springbbs_seq");
				name = rs.getString("name");
				title = rs.getString("title");
				contents = rs.getString("contents");
				day = rs.getString("day");

				l.setSeq(seq);
				l.setName(name);
				l.setTitle(title);
				l.setContents(contents);
				l.setDay(day);

				list.add(l);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("디비 문제");
		}
		
		ora.dbClose();

		return list;
		
	}

}
