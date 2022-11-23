package com.spring.board;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.model.BoardDAO;
import com.spring.model.BoardDTO;

@Controller
public class BoardController {

	@Autowired
	private BoardDAO dao;
	
	
	@RequestMapping("board_list.do")
	public String list(Model model) {
		
		List<BoardDTO> list = this.dao.getBoardList();
		
		model.addAttribute("List", list);
		
		return "board_list";
		
	}
	
	
	@RequestMapping("board_write.do")
	public String insert() {
		
		return "board_write";
		
	}
	
	
	@RequestMapping("board_write_ok.do")
	public void insertOk(BoardDTO dto,
			HttpServletResponse response) throws IOException {
		
		int check = this.dao.insertBoard(dto);
		
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		if(check > 0) {
			out.println("<script>");
			out.println("alert('게시글 추가 성공!!!')");
			out.println("location.href='board_list.do'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('게시글 추가 실패~~~')");
			out.println("histpry.back()");
			out.println("</script>");
		}
		
	}
	
	@RequestMapping("board_content.do")
	public String cont(@RequestParam("no") int no,
			Model model) {
		
		// 조회수를 증가시켜 주는 메서드 호출
		this.dao.readCount(no);
		
		// 글번호에 해당하는 게시글의 상세 내역을 조회하는
		// 메서드 호출
		BoardDTO dto = this.dao.boardCont(no);
		
		model.addAttribute("Cont", dto);
		
		return "board_content";
		
	}
	
	
	@RequestMapping("board_modify.do")
	public String update(@RequestParam("no") int no,
			Model model) {
		
		BoardDTO dto = this.dao.boardCont(no);
		
		model.addAttribute("Modify", dto);
		
		return "board_modify";
		
	}
	
	
	@RequestMapping("board_modify_ok.do")
	public void updateOk(BoardDTO dto, 
			@RequestParam("db_pwd") String db_pwd,
			HttpServletResponse response) throws IOException {
		
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		if(dto.getBoard_pwd().equals(db_pwd)) {
			
			this.dao.updateBoard(dto);
			
			out.println("<script>");
			out.println("alert('게시물 수정 성공!!!')");
			out.println("location.href='board_content.do?no="+dto.getBoard_no()+"'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('비밀번호가 틀립니다.~~~')");
			out.println("history.back()");
			out.println("</script>");
		}
		
	}
	
	
	@RequestMapping("board_delete.do")
	public String delete(@RequestParam("no") int no,
			Model model) {
		
		BoardDTO dto = this.dao.boardCont(no);
		
		model.addAttribute("Delete", dto);
		
		return "board_delete";
		
	}
	
	
	@RequestMapping("board_delete_ok.do")
	public void deleteOk(@RequestParam("board_pwd") String pwd,
			@RequestParam("board_no") int no,
			@RequestParam("db_pwd") String db_pwd,
			HttpServletResponse response) throws IOException {
		
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		if(pwd.equals(db_pwd)) {
			
			this.dao.deleteBoard(no);
			this.dao.updateSeq(no);
			
			out.println("<script>");
			out.println("alert('게시글 삭제 성공!!!')");
			out.println("location.href='board_list.do'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('비밀번호가 틀립니다.!!!')");
			out.println("history.back()");
			out.println("</script>");
		}
		
	}
	
	
	
}
