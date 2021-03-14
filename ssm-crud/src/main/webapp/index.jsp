<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<%
	pageContext.setAttribute("APP_PATH",request.getContextPath());
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"/>
<script type="text/javascript" src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/jquery.js"></script>
<script type="text/javascript" src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

<title>Insert title here</title>
</head>

<body>


	<div class="container">
		<!-- 标题 -->
		<div class="row">
		  	<div class="col-md-12">
		  		<h1>SSM-CRUD</h1>
		  	</div>
		</div>
		
		<!-- 按钮 -->
		<div class="row">
			  <div class="col-md-4 col-md-offset-10">
			  		<button type="button" id="emp_add_button" class="btn btn-success">
				  		<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
				  		新增
			  		</button>	
			  		<button type="button" id="emp_delete_button" class="btn btn-danger">
				  		<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
				  		删除
				  	</button>
			  </div>
		</div>
		
	<!-- 显示表格数据 -->
		<div class="row">
			<div class="col-md-12">
				<table class="table table-hover" id="emps_table">
					<thead>
						<tr>
							<th>
								<input type="checkbox" id="check_all">
							</th>
							<th>id</th>
							<th>empName</th>
							<th>gender</th>
							<th>email</th>
							<th>deptName</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>
			</div>
		</div>
			
		<div class="row">
			<div class="col-md-6" id="page_info_area">
				
			</div>
			<div class="col-md-6 " id="page_nav_area">
 
			</div>
		</div>
		
		
		
		<!-- 新增员工 -->
<div class="modal fade" id="empaddModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">员工添加</h4>
      </div>
      <div class="modal-body">
       			

<form>
  <div class="form-group">
    <label>名字</label>
    <input name="lastName" type="text" class="form-control" id="empName_add_input" placeholder="lastName">
    <span class="help-block"></span>
  </div>
  <div class="form-group">
    <label>邮箱</label>
    <input name="email" type="email" class="form-control" id="" placeholder="email">
  </div>
  
  <div class="form-group">
      <label>性别</label>
	  <label class="radio-inline">
  		<input name="gender" type="radio" name="inlineRadioOptions" id="gender1_add_input" value="1" checked="checked ">男
	  </label>
	  <label class="radio-inline">
	    <input name="gender" type="radio" name="inlineRadioOptions" id="gender0_add_input" value="0">女
	  </label>
  </div>

  <div class="form-group">
      <label>部门名</label>
	  <select class="form-control" name="dId" id="dept_add_select">
		  
	  </select>
    </div>
</form>

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
        <button id="emp_save_btn" type="button" class="btn btn-primary">保存</button>
      </div>
    </div>
  </div>
</div>





<!-- 信息修改 -->
<div class="modal fade" id="empUpdateModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">员工信息修改</h4>
      </div>
      <div class="modal-body">
       			
<form>
  <div class="form-group">
    <label>名字</label>
   	<p class="form-control-satatic" id="empName_update_static"> </p>
  </div>
  <div class="form-group">
    <label>邮箱</label>
    <input name="email" type="email" class="form-control" id="email_update" placeholder="email" >
  </div>
  
  <div class="form-group">
      <label>性别</label>
	  <label class="radio-inline">
  		<input name="gender" type="radio" id="gender1_update_input" value="1">男
	  </label>
	  <label class="radio-inline">
	    <input name="gender" type="radio"  id="gender0_update_input" value="0">女
	  </label>
  </div>

  <div class="form-group">
      <label>部门名</label>
	  <select class="form-control" name="dId" id="dept_update_select">
		  
	  </select>
    </div>
</form>

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
        <button id="emp_update_btn" type="button" class="btn btn-primary">保存</button>
      </div>
    </div>
  </div>
</div>



</body> 

<script type="text/javascript">

	 var currentCode;
	$(function(){
		to_page(1);
	});
	
	function to_page(pn){
		$.ajax({
			url:"${APP_PATH}/emps",
			data:"pn="+pn,
			type:"GET",
			success:function(result){
				//console.log(result);
				//1、解析并显示员工数据
				build_emps_table(result);
				//2、解析并显示分页信息
				build_page_nav(result);
				//3、解析显示分页条数据
				build_nav_area(result);
			}
		});
	}
	
	function build_emps_table(result){
		$("#emps_table tbody").empty();
		var emps = result.extend.pageInfo.list;
		$.each(emps,function(index,item){
			var checkBoxId=$("<td><input type='checkbox' class='check_item'></td>");
			var empIdTd = $("<td></td>").append(item.id);
			var empNameTd = $("<td></td>").append(item.lastName);
			var genderTd = $("<td></td>").append(item.gender=='1'?"男":"女");
			var emailTd = $("<td></td>").append(item.email);
			var deptNameTd = $("<td></td>").append(item.department.deptName);
			var editBtn=$("<button></button>").addClass("btn btn-success btn-sm edit_btn")
											.append($("<span></span>").addClass("glyphicon glyphicon-pencil"))
											.append("编辑");
			editBtn.attr("edit-id",item.id);
			var delBtn=$("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
											.append($("<span></span>").addClass("glyphicon glyphicon-pencil"))
											.append("删除");
			delBtn.attr("edit-id",item.id);
			
			$("<tr></tr>")
			.append(checkBoxId)
			.append(empIdTd)
			.append(empNameTd)
			.append(genderTd)
			.append(emailTd)
			.append(deptNameTd)
			.append(editBtn)
			.append(delBtn)
			.appendTo("#emps_table tbody");
	});
	}
	
	
	
	function build_page_nav(result){
		$("#page_info_area").empty();
		$("#page_info_area").append("当前 "+result.extend.pageInfo.pageNum+"页,总共"+ result.extend.pageInfo.pages +"页，总共"+ result.extend.pageInfo.total +"条记录")
		currentCode=result.extend.pageInfo.pageNum;
	}

	
	
	function build_nav_area(result){
		$("#page_nav_area").empty();
		console.log(result.extend.pageInfo.pageNum);
		var ul = $("<ul></ul>").addClass("pagination");
		
	
		var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
		var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
		
		if(!result.extend.pageInfo.hasPreviousPage)
			prePageLi.addClass("disabled");
		
		var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
		var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href","#"));
		
		if(!result.extend.pageInfo.hasNextPage)
			nextPageLi.addClass("disabled");
		
		
		firstPageLi.click(function(){
			to_page(1);
		});
		
		lastPageLi.click(function(){
			to_page(result.extend.pageInfo.pages);
		});
		
		prePageLi.click(function(){
			to_page(result.extend.pageInfo.pageNum-1);
		});
		
		nextPageLi.click(function(){
			to_page(result.extend.pageInfo.pageNum+1);
		});
		
		ul.append(firstPageLi).append(prePageLi);

		$.each(result.extend.pageInfo.navigatepageNums,function(index,item){
			var numLi = $("<li></li>").append($("<a></a>").append(item));
			if(result.extend.pageInfo.pageNum == item){
				numLi.addClass("active");
			}
			numLi.click(function(){
				to_page(item);
			});
			ul.append(numLi);
		});
		
		//添加下一页和末页 的提示
		ul.append(nextPageLi).append(lastPageLi);
		
		//把ul加入到nav
		var navEle = $("<nav></nav>").append(ul);
		navEle.appendTo("#page_nav_area");
	}
	
	function show_validate_msg(ele,status,msg){
		$(ele).parent().removeClass("has-success has-error");
		$(ele).next("span").text("");
		if("success"==status){
			$(ele).parent().addClass("has-success");
			$(ele).next("span").text(msg);
		}
		else if("error==status"){
			$(ele).parent().addClass("has-error");
			$(ele).next("span").text(msg);
		}
	}
	
	$("#emp_add_button").click(function(){
		//重置
		reset_form("#empaddModel form");
		
		getDept("#dept_add_select");
		
		$("#empaddModel").modal({
			backdrop:"static"
		});
	});

	function getDept(ele){
		$(ele).empty();
		$.ajax({
			url:"${APP_PATH}/depts",
			type:"GET",
			success:function(result){
				$.each(result.extend.depts,function(){
					var optionEle=$("<option></option>").append(this.deptName).attr("value",this.id);
					optionEle.appendTo(ele);	
				})
				
			}
		});
	}

	function validate_add_from(){
		var empName  = $("#empName_add_input").val();

		var regName  = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
		
		if(!regName.test(empName)){
			show_validate_msg("#empName_add_input","error","用户名长度不对");
			return false;
		}else{
			show_validate_msg("#empName_add_input","success","");

		};
		return true;
	
	}
	
	$("#emp_save_btn").click(function(){
		//校验数据
		if(!validate_add_from()){
			return false;
		}
		
		if($(this).attr("ajax-va")=="error")
			return false
	
		$.ajax({
			url:"${APP_PATH}/emps",
			type:"POST",
			data:$("#empaddModel form").serialize(),
			success:function(result){
		
				if(result.code==100 ){		
					$("#empaddModel").modal('hide');
					to_page(9999);
				}else{
					if(undefined!=result.extend.errorfield.lastName)
						show_validate_msg("#empName_add_input","error",undefined!=result.extend.errorfield.lastName);
				}
			}	
			}); 

		});	
	
	$("#empName_add_input").change(function(){	
		var empname=this.value;

		$.ajax({
			url:"${APP_PATH}/checkuser",
			type:"POST",
			data:"empName="+empname,
			success:function(result){
				if(result.code==100){
					show_validate_msg("#empName_add_input","success","用户名可用");
					$("#emp_save_btn").attr("ajax-va","success");
				}
				else{
					show_validate_msg("#empName_add_input","error",result.extend.va_msg);
					$("#emp_save_btn").attr("ajax-va","error");
				}
				}	
			}); 
		});	
	
	function reset_form(ele){
		$(ele)[0].reset();
		$(ele).removeClass("has-error has-success")
	}
	
	
	$(document).on("click",".edit_btn",function(){
		$("#empUpdateModel").modal({ 
			backdrop:"static"
		});
		getDept("#empUpdateModel select");
		getEmp($(this).attr("edit-id"));
		$("#emp_update_btn").attr("edit-id",$(this).attr("edit-id"));
		
	
	});
	
	function getEmp(id){
		$.ajax({
			url:"${APP_PATH}/emp/"+id,
			type:"GET",
			success:function(result){
				$("#empName_update_static").text(result.extend.emp.lastName);
				$("#email_update").val(result.extend.emp.email);
				$("#empUpdateModel input[name=gender]").val([result.extend.emp.gender]);
				$("#empUpdateModel select").val([result.extend.emp.dId]);
				}	
			}); 
	};
	
	
	$("#emp_update_btn").click(function(){
		
		$.ajax({
			url:"${APP_PATH}/emp/"+$(this).attr("edit-id"),
			type:"PUT",
			data:$("#empUpdateModel form").serialize(),
			success:function(result){
				if(result.code==100 ){		
					$("#empUpdateModel").modal('hide');
					to_page(currentCode);
				}
			}	
			}); 
	})
	
	$(document).on("click",".delete_btn",function(){
		var empname=$(this).parents("tr").find("td:eq(2)").text();
		if(confirm("确认删除"+empname+"？")){
			$.ajax({
				url:"${APP_PATH}/emp/"+$(this).attr("edit-id"),
				type:"DELETE",
				success:function(rsesult){
					if(result.code==100 ){		
						$("#empUpdateModel").modal('hide');
						to_page(currentCode);
					}
				}	
				}); 
		}
		
	});
	$(document).on("click","#check_all",function(){
		//attr获取自定义
		//prop获取dom原生
		$(".check_item").prop("checked",$(this).prop("checked"));
		
	});
	
	$(document).on("click",".check_item",function(){
		var flag=$(".check_item:checked").length==$(".check_item").length;
		$("#check_all").prop("checked",flag);
	});
	
	$("#emp_delete_button").click(function(){
		var empname="";
		var del_idstr="";
		$.each($(".check_item:checked"),function(){
			empname+= $(this).parents("tr").find("td:eq(2)").text()+",";
			del_idstr+= $(this).parents("tr").find("td:eq(1)").text()+"-";
		});
		
		var empnames=empname.substring(0,empname.length-1);
		del_idstr=del_idstr.substring(0,del_idstr.length-1);
		if(confirm("确认删除"+empnames+"？")){
			$.ajax({
				url:"${APP_PATH}/emp/"+del_idstr,
				type:"DELETE",
				success:function(rsesult){
					alert(result.code);
					if(result.code==100 ){		
						alert(currentCode);
						to_page(currentCode);
					}
				}	
				}); 
		}
		
	
	});
</script>
</html>