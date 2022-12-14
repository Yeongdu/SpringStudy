package com.spring.model;

import java.util.List;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class EmpDAOImpl implements EmpDAO{
	
	@Inject
	private SqlSessionTemplate sqlSession;

	@Override
	public List<EmpDTO> getEmpList() {
		return this.sqlSession.selectList("list");
	}

	@Override
	public int insertEmp(EmpDTO dto) {
		return this.sqlSession.insert("add", dto);
	}

	@Override
	public EmpDTO getEmp(int empno) {
		return this.sqlSession.selectOne("cont", empno);
	}

	@Override
	public int updateEmp(EmpDTO dto) {
		return this.sqlSession.update("modify", dto);
	}

	@Override
	public int deleteEmp(int no) {
		return this.sqlSession.delete("del", no);
	}

	@Override
	public List<DeptDTO> getDeptList() {
		return this.sqlSession.selectList("deptList");
	}

	@Override
	public List<EmpDTO> getMgrList() {
		return this.sqlSession.selectList("mgrList");
	}

	@Override
	public List<String> getJobList() {
		return this.sqlSession.selectList("jobList");
	}

	@Override
	public String getMgrName(int mgr) {
		return this.sqlSession.selectOne("mName",mgr);
	}

}
