package com.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bean.Department;
import com.bean.Msg;
import com.service.DepartmentService;
import com.service.EmployeeService;

@Controller
public class DeptController {
	@Autowired
	DepartmentService departmentService;
	
	@ResponseBody
	@RequestMapping("depts")
	public Msg getDept(){
		List<Department> dept = departmentService.getDept();
		return Msg.success().add("depts", dept);
	}
}
