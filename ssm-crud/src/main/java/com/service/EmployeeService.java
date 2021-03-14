package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bean.Employee;
import com.bean.EmployeeExample;
import com.bean.EmployeeExample.Criteria;
import com.bean.Msg;
import com.dao.EmployeeMapper;

@Service
public class EmployeeService {
	
	@Autowired
	EmployeeMapper employeeMapper;
	
	public List<Employee> selectByExampleWithDept(){
		List<Employee> selectByExampleWithDept = employeeMapper.selectByExampleWithDept(null);
		return selectByExampleWithDept;
	}
	
	public List<Employee> getAllEmps(){
		List<Employee> selectByExampleWithDept = employeeMapper.selectByExample(null);
		return selectByExampleWithDept;
	}
	
	public Employee selectByPrimaryKey(Integer id){
	 Employee selectByPrimaryKey = employeeMapper.selectByPrimaryKey(id);
		return selectByPrimaryKey;
	}

	public void saveEmp(Employee emp) {
		employeeMapper.insertSelective(emp);
		
	}
	
	public boolean check(String empName) {
		EmployeeExample example = new EmployeeExample();
		
		//加条件
		Criteria createCriteria = example.createCriteria();
		createCriteria.andLastNameEqualTo(empName);
		
		//查询符合条件的数
		long countByExample = employeeMapper.countByExample(example);
		return countByExample==0;
	}   

	public void updateEmp(Employee emp) {
		employeeMapper.updateByPrimaryKeySelective(emp);
		
	}

	public void deleteEmp(Integer id) {
		employeeMapper.deleteByPrimaryKey(id);
		
	}


}
