package com.khie.model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository
public class ProductDAOImpl implements ProductDAO {
	
//	@Inject 써도 된다.
	@Autowired
	private JdbcTemplate template;
	
	String sql = null;

	@Override
	public List<ProductDTO> getProductList() {
		List<ProductDTO> list = null;
		sql = "select * from products order by pnum desc";
		return list = this.template.query(sql, new RowMapper<ProductDTO>() {
			@Override
			public ProductDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
				ProductDTO dto = new ProductDTO();
				dto.setPnum(rs.getInt("pnum"));
				dto.setCategory_fk(rs.getString("category_fk"));
				dto.setProducts_name(rs.getString("products_name"));
				dto.setEp_code_fk(rs.getString("ep_code_fk"));
				dto.setInput_price(rs.getInt("input_price"));
				dto.setOutput_price(rs.getInt("output_price"));
				dto.setTrans_cost(rs.getInt("trans_cost"));
				dto.setMileage(rs.getInt("mileage"));

				
				String showCompany = rs.getString("company");
				if(rs.getString("company") == null){
				    showCompany = "";
				}
				dto.setCompany(showCompany);
				
				return dto;
			}
		});

	}

	@Override
	public int insertProduct(final ProductDTO dto) {
		final int pno = this.template.queryForObject("select max(pnum) from products", Integer.class);
		sql = "insert into products values(?, ?, ?, ?, ?, ?, ?, ?, ?)";
		return this.template.update(sql, new PreparedStatementSetter() {
			
			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setInt(1, pno+1);
				ps.setString(2, dto.getCategory_fk());
		        ps.setString(3, dto.getProducts_name());
		        ps.setString(4, dto.getEp_code_fk());
		        ps.setInt(5, dto.getInput_price());
		        ps.setInt(6, dto.getOutput_price());
		        ps.setInt(7, dto.getTrans_cost());
		        ps.setInt(8, dto.getMileage());
		        ps.setString(9, dto.getCompany());
				
			}
		});
	}

	@Override
	public ProductDTO getProductCont(int pnum) {
		sql = "select * from products where pnum = ?";
		return this.template.queryForObject(sql, new RowMapper<ProductDTO>() {
			
			@Override
			public ProductDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
				ProductDTO dto = new ProductDTO();
				dto.setPnum(rs.getInt("pnum"));
				dto.setCategory_fk(rs.getString("category_fk"));
				dto.setProducts_name(rs.getString("products_name"));
				dto.setEp_code_fk(rs.getString("ep_code_fk"));
				dto.setInput_price(rs.getInt("input_price"));
				dto.setOutput_price(rs.getInt("output_price"));
				dto.setTrans_cost(rs.getInt("trans_cost"));
				dto.setMileage(rs.getInt("mileage"));
				dto.setCompany(rs.getString("company"));
				return dto;
			}
		}, pnum);
	}

	@Override
	public int updateProduct(final ProductDTO dto) {
		sql = "update products set input_price=?, output_price=?, trans_cost=?, mileage=? where pnum=?";
		return this.template.update(sql, new PreparedStatementSetter() {
			
			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setInt(1, dto.getInput_price());
				ps.setInt(2, dto.getOutput_price());
				ps.setInt(3, dto.getTrans_cost());
				ps.setInt(4, dto.getMileage());
				ps.setInt(5, dto.getPnum());
			}
		});
	}

	@Override
	public int deleteProduct(final int pnum) {
		sql = "delete from products where pnum=?";
		return this.template.update(sql, new PreparedStatementSetter() {
			
			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setInt(1, pnum);
			}
		});
	}

	@Override
	public void updateSeq(final int pnum) {
		sql = "update products set pnum = pnum-1 where pnum > ?";
		this.template.update(sql, new PreparedStatementSetter() {
			
			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setInt(1, pnum);
			}
		});
	}

	@Override
	public List<CategoryDTO> getCategoryList() {
		List<CategoryDTO> clist = null;
		sql = "select * from category order by category_code";
		clist = this.template.query(sql, new RowMapper<CategoryDTO>() {
			@Override
			public CategoryDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
				CategoryDTO dto = new CategoryDTO();
				
				dto.setCnum(rs.getInt("cnum"));
				dto.setCategory_code(rs.getString("category_code"));
				dto.setCategory_name(rs.getString("category_name"));
				
				return dto;
			}
		});
		return clist;
	}

	@Override
	public String getCategoryName(String category_fk) {
		sql = "select category_name from category where category_code = ?";
		return this.template.queryForObject(sql, String.class, category_fk);
	}
	

}
