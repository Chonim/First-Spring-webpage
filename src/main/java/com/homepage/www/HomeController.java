package com.homepage.www;

import com.homepage.www.Member;
import com.homepage.www.List;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping("/")
	public String home(Locale locale, Model model) {

		return "home";
	}

	@RequestMapping("/home")
	public String home(HttpServletRequest re, Model mo) {
		String name = (String) re.getSession().getAttribute("name").toString();
		
		mo.addAttribute("name", name);

		return "home";
	}

	@RequestMapping("/test")
	public String test(Model mo) {
		mo.addAttribute("id", 10);
		return "test";
	}

	@RequestMapping("/test1")
	public String test1(HttpServletRequest re, Model mo) {
		String id = re.getParameter("id");
		String pw = re.getParameter("pw");

		mo.addAttribute("id", id);
		mo.addAttribute("pw", pw);
		return "test";
	}

	@RequestMapping("/test2")
	public String test2(@RequestParam("id") String id, @RequestParam("pw") String pw, Model mo) {

		mo.addAttribute("id", id);
		mo.addAttribute("pw", pw);
		return "test";
	}

	@RequestMapping("/test3/10/{stu}")
	public String test3(@PathVariable String stu, Model mo) {
		mo.addAttribute("stu", stu);
		return "test";
	}

	@RequestMapping(method = RequestMethod.GET, value = "/test4")
	public String test4(HttpServletRequest hr, Model mo) {
		String id = hr.getParameter("id");
		String pw = hr.getParameter("pw");
		mo.addAttribute("id", id);
		mo.addAttribute("pw", pw);
		return "test";
	}

	@RequestMapping("/test5")
	public String test5(HttpServletRequest hr, Model mo) {
		String id = hr.getParameter("id");
		String pw = hr.getParameter("pw");
		String com = "";
		if (id.equals("jhs")) {
			if (pw.equals("123")) {
				// com = "success";
				mo.addAttribute("id", id);
				mo.addAttribute("pw", pw);
				return "redirect:suc";
			} else {
				com = "fail";
			}
		} else {
			com = "fail";
		}
		return "redirect:fail";
	}

	@RequestMapping("/success")
	public String suc() {
		return "success";
	}

	@RequestMapping("/fail")
	public String fail() {
		return "fail";
	}

	@RequestMapping("/main")
	public String main(HttpServletRequest re, Model mo) {
		Oracle a = new Oracle();

		String id = re.getParameter("id");
		String pw = re.getParameter("pw");
		String name = re.getParameter("name");
		String age = re.getParameter("age");
		String email = re.getParameter("email");

		mo.addAttribute("id", id);
		mo.addAttribute("pw", pw);
		mo.addAttribute("name", name);
		mo.addAttribute("age", age);
		mo.addAttribute("email", email);

		a.dbConnection();
		a.insert("insert into test values('" + id + "','" + pw + "','" + name + "','" + age + "','" + email + "')");
		a.dbClose();

		return "main";
	}

	@RequestMapping("join")
	public String join(Model mo) {
		return "join";
	}

	@RequestMapping("join_check")
	public String join_check(HttpServletRequest re, Model mo) {

		Oracle ora = new Oracle();

		String id = re.getParameter("id");
		String pw = re.getParameter("pw");
		String birthday = re.getParameter("birthday");
		String email = re.getParameter("email");
		String name = re.getParameter("name");
		String age = re.getParameter("age");
		String phone = re.getParameter("phone");

		mo.addAttribute("id", id);
		mo.addAttribute("pw", pw);
		mo.addAttribute("birthday", birthday);
		mo.addAttribute("email", email);
		mo.addAttribute("name", name);
		mo.addAttribute("age", age);
		mo.addAttribute("phone", phone);

		ora.dbConnection();
		ora.insert("insert into springmember values(springmember_seq.nextval,'" + id + "','" + pw + "','" + birthday
				+ "','" + email + "','" + name + "','" + age + "','" + phone + "')");
		ora.dbClose();

		return "home";
	}

	@RequestMapping("/bbs/list")
	public String list(HttpServletRequest re, Model mo) {
		
		String sessionName = (String) re.getSession().getAttribute("name").toString();

		Oracle ora = new Oracle();

		ora.dbConnection();

		ResultSet rs = ora.select("select springbbs_seq, name, title, contents, day from springbbs order by springbbs_seq desc, isreply asc");

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
				if(name.equals(sessionName)||sessionName.equals("adrien")) {
					l.setIsDeletable("O");
				} else {
					l.setIsDeletable("");
				}
				list.add(l);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("디비 문제");
		}

		mo.addAttribute("list", list);

		ora.dbClose();

		return "bbs/list";
	}
	
	@RequestMapping("/bbs/search")
	public String search(HttpServletRequest re, Model mo) {
		
		String sessionName = (String) re.getSession().getAttribute("name").toString();
		String keyword = (String) re.getParameter("keyword");

		Oracle ora = new Oracle();

		ora.dbConnection();

		ResultSet rs = ora.select("select springbbs_seq, name, title, contents, day from springbbs order by springbbs_seq desc");

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
				
				if(title.contains(keyword)) {
					l.setSeq(seq);
					l.setName(name);
					l.setTitle(title);
					l.setContents(contents);
					l.setDay(day);
					if(name.equals(sessionName)||sessionName.equals("adrien")) {
						l.setIsDeletable("O");
					} else {
						l.setIsDeletable("");
					}
					list.add(l);
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("디비 문제");
		}

		mo.addAttribute("list", list);
		ora.dbClose();

		return "bbs/list";
	}
	
	@RequestMapping("/bbs/contents/{seq}") 
	public String contents(@PathVariable String seq, HttpServletRequest re, Model mo) {
		
		String sessionName = (String) re.getSession().getAttribute("name");
		Oracle ora = new Oracle();
		
		mo.addAttribute("seq", seq);
		
		ora.dbConnection();
		
		ResultSet rs = ora.select("select * from springbbs where springbbs_seq='" + seq + "'");

		String name = "";
		String title = "";
		String contents = "";

		try {
			while (rs.next()) {
				name = rs.getString("name");
				title = rs.getString("title");
				contents = rs.getString("contents");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("디비 문제");
		}

		mo.addAttribute("sessionname", sessionName);
		mo.addAttribute("name", name);
		mo.addAttribute("title", title);
		mo.addAttribute("contents", contents);

		ora.dbClose();

		return "bbs/contents";
	}
	
	@RequestMapping("/bbs/delete/{seq}")
	public String delete(@PathVariable String seq, HttpServletRequest re, Model mo) {
		
		Oracle ora = new Oracle();
		
		mo.addAttribute("seq", seq);
		mo.addAttribute("type", "delete");
		
		System.out.println(seq);
		
		ora.dbConnection();
		ora.insert("delete from springbbs where springbbs_seq='" + seq + "'");
		ora.dbClose();

		return "bbs/blank";
	}

	@RequestMapping("/bbs/write")
	public String write(HttpServletRequest re, Model mo) {

		// 이름 넘겨주기
		String name = re.getSession().getAttribute("name").toString();
		mo.addAttribute("name", name);
		mo.addAttribute("seq", 0);

		return "bbs/write";
	}
	
	@RequestMapping("/bbs/modify/{seq}")
	public String modify(@PathVariable int seq, HttpServletRequest re, Model mo) {

		String name = re.getSession().getAttribute("name").toString();
		mo.addAttribute("name", name);
		mo.addAttribute("seq", seq);

		return "bbs/modify";
	}
	
	//////////////////// 제목 가져오기 할것
	@RequestMapping("/bbs/reply/{seq}")
	public String reply(@PathVariable int seq, HttpServletRequest re, Model mo) {
		
		String name = re.getSession().getAttribute("name").toString();
		String title = (String) re.getAttribute("title");
		System.out.println();
		
		mo.addAttribute("name", name);
		mo.addAttribute("title", title);
		mo.addAttribute("seq", seq);
		
		return "bbs/reply";
	}

	@RequestMapping(value={"/bbs/write_check","/bbs/write_check/{seq}"})
	public String write_check(@PathVariable int seq, HttpServletRequest re, Model mo) {
		
		Oracle ora = new Oracle();

		String name = re.getParameter("name");
		String title = re.getParameter("title");
		String contents = re.getParameter("contents");
		String isreply = re.getParameter("isreply");
		
		// 글 읽을 때 시퀀스 번호를 불러와야 함
//		String seq = re.getParameter("seq");

		DecimalFormat df = new DecimalFormat("00");
		Calendar currentCalendar = Calendar.getInstance();
		// 현재 날짜 구하기
		String strYear = df.format(currentCalendar.get(Calendar.YEAR));
		String strMonth = df.format(currentCalendar.get(Calendar.MONTH) + 1);
		String strDay = df.format(currentCalendar.get(Calendar.DATE));
		String date = strYear + "/" + strMonth + "/" + strDay;
		
		String sql="";
		
		if (isreply.equals("1")) {
			sql = "insert into springbbs values(springbbs_seq.nextval,'" + name + "','" + title + "','" + contents
					+ "','" + date + "','" + isreply + "')";
			mo.addAttribute("type", "write");
		} else {
			sql = "insert into springbbs values('"+ seq +"','" + name + "','" + title + "','" + contents
					+ "','" + date + "','" + isreply + "')";
			mo.addAttribute("type", "reply");
		}
		ora.dbConnection();
		ora.insert(sql);
		ora.dbClose();

		return "bbs/blank";
	}

	@RequestMapping("logincheck")
	public String logincheck(HttpServletRequest re, Model mo) {

		Oracle ora = new Oracle();

		String id = re.getParameter("id");
		String pw = re.getParameter("pw");

		ora.dbConnection();
		ResultSet rs = ora.select("select * from springmember where id='" + id + "'");

		String dbId = "";
		String dbPw = "";
		String dbName = "";

		try {
			while (rs.next()) {
				dbId = rs.getString("id");
				dbPw = rs.getString("pw");
				dbName = rs.getString("name");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("디비 문제");
		}
		if (dbId.equals(id) && dbPw.equals(pw)) {
			System.out.println("로그인 성공");
			re.getSession().setAttribute("id", id);
			re.getSession().setAttribute("name", dbName);
		} else {
			System.out.println("실패");
		}

		mo.addAttribute("id", id);
		mo.addAttribute("pw", pw);
		mo.addAttribute("name", dbName);

		ora.dbClose();

		System.out.println(id);
		return "home";
	}

	@RequestMapping("/include/top")
	public String top(HttpServletRequest re, Model mo) {
		return "include/top";
	}

	@RequestMapping("../myinfo")
	public String myinfo(Model mo) {
		return "../myinfo";
	}

	@RequestMapping("logout")
	public String logout(HttpServletRequest re, Model mo) {
		re.getSession().invalidate();
		return "home";
	}

	@RequestMapping("myinfo")
	public String myinfo(HttpServletRequest re, Model mo) {

		Oracle ora = new Oracle();

		String id = (String) re.getSession().getAttribute("id");
		System.out.println(id);

		ora.dbConnection();
		ResultSet rs = ora.select("select * from springmember where id='" + id + "'");

		String pw = "";
		String name = "";
		String birthday = "";
		String email = "";
		String age = "";
		String phone = "";

		try {
			while (rs.next()) {
				pw = rs.getString("pw");
				name = rs.getString("name");
				birthday = rs.getString("birthday");
				email = rs.getString("email");
				age = rs.getString("age");
				phone = rs.getString("phone");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("디비 문제");
		}

		mo.addAttribute("id", id);
		mo.addAttribute("pw", pw);
		mo.addAttribute("name", name);
		mo.addAttribute("birthday", birthday);
		mo.addAttribute("email", email);
		mo.addAttribute("age", age);
		mo.addAttribute("phone", phone);

		ora.dbClose();

		System.out.println(id);

		return "myinfo";
	}

	@RequestMapping("admininfo")
	public String admininfo(HttpServletRequest re, Model mo) {

		Oracle ora = new Oracle();

		ora.dbConnection();

		ResultSet rs = ora.select("select id, name from springmember");

		String id = "";
		String name = "";

		ArrayList<Member> list = new ArrayList<Member>();

		try {
			while (rs.next()) {
				Member m = new Member();
				id = rs.getString("id");
				name = rs.getString("name");

				m.setId(id);
				m.setName(name);

				list.add(m);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("디비 문제");
		}

		mo.addAttribute("list", list);

		ora.dbClose();

		return "admininfo";
	}
	
	@RequestMapping("deletemember/{id}")
	public String deletemember(@PathVariable String id, HttpServletRequest re, Model mo) {
		
		Oracle ora = new Oracle();
		
		mo.addAttribute("id", id);
		mo.addAttribute("type", "deletemember");
		
		ora.dbConnection();
		ora.insert("delete from springmember where id='" + id + "'");
		ora.dbClose();

		return "bbs/blank";
	}
}
