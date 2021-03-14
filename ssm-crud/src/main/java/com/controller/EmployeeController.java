package com.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bean.Employee;
import com.bean.Msg;
import com.dao.EmployeeMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.service.EmployeeService;

@Controller
public class EmployeeController {
	@Autowired
	EmployeeService employeeService;
	
	
	@RequestMapping("emp")
	public String getEmp(Model model){
		Employee selectByPrimaryKey = employeeService.selectByPrimaryKey(1);

		model.addAttribute("emp",selectByPrimaryKey);
		return "list";
		
	}
	
	@ResponseBody
	@RequestMapping(value="/emp/{id}",method=RequestMethod.GET)
	public Msg getEmpValue(@PathVariable("id")Integer id){
		Employee selectByPrimaryKey = employeeService.selectByPrimaryKey(id);
	
		return Msg.success().add("emp", selectByPrimaryKey);
		
	}
	
	@ResponseBody
	@RequestMapping("emps")
	public Msg getEmpsWithJsojn(@RequestParam(value="pn",defaultValue="2")Integer pn) {
		//分页工具
				PageHelper.startPage(pn, 5);
				
				List<Employee> allEmps = employeeService.selectByExampleWithDept();
				
				PageInfo pageInfo = new PageInfo(allEmps,5);
				
				return Msg.success().add("pageInfo",pageInfo);
	}
	
	
	@ResponseBody
	@RequestMapping(value="emps",method=RequestMethod.POST)
	public Msg saveEmp(@Valid Employee emp,BindingResult result) {
		if(result.hasErrors()){
			Map<String,Object> map=new HashMap<>();
			List<FieldError> fieldErrors = result.getFieldErrors();
			for(FieldError error:fieldErrors){
				System.out.println(error.getField()+"  "+error.getDefaultMessage());
				map.put(error.getField(), error.getDefaultMessage());
			
			}
			return Msg.fail().add("errorfield", map);
		}
		employeeService.saveEmp(emp);
						
		return Msg.success();
	}
	
	
	//检查用户名是否可用
	@ResponseBody
	@RequestMapping(value="checkuser")
	public Msg check(String empName) {
		boolean check = employeeService. check(empName);
		
		String regx = "(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})";
		if(!empName.matches(regx)){
			return Msg.fail().add("va_msg", "用户名必须是6-16位数字和字母的组合或者2-5位中文");
		}
		
		if(check)
			return Msg.success();
		else
			return Msg.fail().add("va_msg", "用户名重复");
	}
	
	@ResponseBody
	@RequestMapping(value="/emp/{id}",method=RequestMethod.PUT)
	public Msg updateEmp(Employee emp) {
		employeeService.updateEmp(emp);
		return Msg.success();
		
	}
	
	@ResponseBody
	@RequestMapping(value="/emp/{ids}",method=RequestMethod.DELETE)
	public Msg deleteEmp(@PathVariable("ids")String ids) {
		
		if(ids.contains("-")){
			System.out.println(ids);
			String[] str_ids=ids.split("-");
			
			for(String id:str_ids){
				employeeService.deleteEmp(Integer.parseInt(id));
			}
			}
		else
			employeeService.deleteEmp(Integer.parseInt(ids));
		return Msg.success();
		
	}
	
	//@RequestMapping("emps")
	public String getEmps(@RequestParam(value="pn",defaultValue="2")Integer pn,Model model){
		
		//分页工具
		PageHelper.startPage(pn, 5);
		
		List<Employee> allEmps = employeeService.selectByExampleWithDept();
		
		PageInfo pageInfo = new PageInfo(allEmps,5);
		
		model.addAttribute("emps", pageInfo);
		return "list";
	}
}
