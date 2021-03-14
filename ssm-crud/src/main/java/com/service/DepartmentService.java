package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bean.Department;
import com.bean.Msg;
import com.dao.DepartmentMapper;
import com.dao.EmployeeMapper;


@Service
public class DepartmentService {
	
	@Autowired
	DepartmentMapper departmentMapper;
	

	public List<Department> getDept(){
		List<Department> depts = departmentMapper.selectByExample(null);
		return depts;
	}
}
