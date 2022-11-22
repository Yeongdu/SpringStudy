package com.khie.jdbc02;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.khie.model.CategoryDTO;
import com.khie.model.ProductDAO;
import com.khie.model.ProductDTO;

@Controller
public class ProductController {
	
	@Autowired
	private ProductDAO dao;
	
	@RequestMapping("product_list.do")
	public String list(Model model) {
		List<ProductDTO> list = this.dao.getProductList();
		model.addAttribute("productList", list);
		return "product_list";
	}
	
	@RequestMapping("product_insert.do")
	public String product_insert(Model model) {
		List<CategoryDTO> clist = this.dao.getCategoryList();
		model.addAttribute("CategoryList", clist);
		return "product_insert";
	}
	
	@RequestMapping("product_insert_ok.do")
	public void productInsertOk(ProductDTO dto, HttpServletResponse response) throws IOException {
		int res = this.dao.insertProduct(dto);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		if(res > 0) {
			out.println("<script> alert('제품등록성공'); location.href='product_list.do'; </script>");
		}else {
			out.println("<script> alert('제품등록실패 8^8'); history.back(); </script>");
		}
	}
	
	@RequestMapping("product_content.do")
	public String cont(@RequestParam("pnum") int pno, Model model) {
		

		ProductDTO dto = this.dao.getProductCont(pno);
		String categoryName = this.dao.getCategoryName(dto.getCategory_fk());
		model.addAttribute("Cont", dto);
		model.addAttribute("Cate", categoryName);
		return "product_content";
	}
	
	@RequestMapping("product_update.do")
	public String update(@RequestParam("pnum") int pno, Model model) {
		ProductDTO dto = this.dao.getProductCont(pno);
		String categoryName = this.dao.getCategoryName(dto.getCategory_fk());
		model.addAttribute("Update", dto);
		model.addAttribute("Cate", categoryName);
		return "product_update";
	}
	
	@RequestMapping("product_update_ok.do")
	public void updateOk(ProductDTO dto, HttpServletResponse response) throws IOException {
		int res = this.dao.updateProduct(dto);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		if(res > 0) {
			out.println("<script> alert('제품수정성공'); location.href='product_content.do?pnum="+dto.getPnum()+"';</script>");
		}else {
			out.println("<script> alert('제품수정실패 8^8'); history.back(); </script>");
		}
	}
	
	@RequestMapping("product_delete.do")
	public void delete(@RequestParam("pnum") int pno, HttpServletResponse response) throws IOException {
		int res = this.dao.deleteProduct(pno);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		if(res > 0) {
			this.dao.updateSeq(pno);
			out.println("<script> alert('제품삭제성공'); location.href='product_list.do';</script>");
		}else {
			out.println("<script> alert('제품삭제실패 8^8'); history.back(); </script>");
		}
	}
	

}
