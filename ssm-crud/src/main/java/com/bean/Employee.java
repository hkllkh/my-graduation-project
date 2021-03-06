package com.bean;

import javax.validation.constraints.Pattern;

public class Employee {
    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column tbl_emplyee.id
     *
     * @mbg.generated Sun Feb 28 14:10:18 CST 2021
     */
	
    private Integer id;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column tbl_emplyee.last_name
     *
     * @mbg.generated Sun Feb 28 14:10:18 CST 2021
     */
    @Pattern(regexp="(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})",
    		message="用户名6-16位")
    private String lastName;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column tbl_emplyee.gender
     *
     * @mbg.generated Sun Feb 28 14:10:18 CST 2021
     */
    private String gender;

    public Employee() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column tbl_emplyee.email
     *
     * @mbg.generated Sun Feb 28 14:10:18 CST 2021
     */
    private String email;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column tbl_emplyee.d_id
     *
     * @mbg.generated Sun Feb 28 14:10:18 CST 2021
     */
    private Integer dId;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column tbl_emplyee.id
     *
     * @return the value of tbl_emplyee.id
     *
     * @mbg.generated Sun Feb 28 14:10:18 CST 2021
     */
    
    private Department department;
    
    @Override
	public String toString() {
		return "Employee [id=" + id + ", lastName=" + lastName + ", gender=" + gender + ", email=" + email + ", dId="
				+ dId + ", department=" + department + "]";
	}

	public Employee(Integer id, String lastName, String gender, String email, Integer dId) {
		super();
		this.id = id;
		this.lastName = lastName;
		this.gender = gender;
		this.email = email;
		this.dId = dId;
	}

	public Employee(Integer id, String lastName, String gender, String email, Integer dId, Department department) {
		super();
		this.id = id;
		this.lastName = lastName;
		this.gender = gender;
		this.email = email;
		this.dId = dId;
		this.department = department;
	}

	public Department getDepartment() {
		return department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}

	public Integer getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column tbl_emplyee.id
     *
     * @param id the value for tbl_emplyee.id
     *
     * @mbg.generated Sun Feb 28 14:10:18 CST 2021
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column tbl_emplyee.last_name
     *
     * @return the value of tbl_emplyee.last_name
     *
     * @mbg.generated Sun Feb 28 14:10:18 CST 2021
     */
    public String getLastName() {
        return lastName;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column tbl_emplyee.last_name
     *
     * @param lastName the value for tbl_emplyee.last_name
     *
     * @mbg.generated Sun Feb 28 14:10:18 CST 2021
     */
    public void setLastName(String lastName) {
        this.lastName = lastName == null ? null : lastName.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column tbl_emplyee.gender
     *
     * @return the value of tbl_emplyee.gender
     *
     * @mbg.generated Sun Feb 28 14:10:18 CST 2021
     */
    public String getGender() {
        return gender;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column tbl_emplyee.gender
     *
     * @param gender the value for tbl_emplyee.gender
     *
     * @mbg.generated Sun Feb 28 14:10:18 CST 2021
     */
    public void setGender(String gender) {
        this.gender = gender == null ? null : gender.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column tbl_emplyee.email
     *
     * @return the value of tbl_emplyee.email
     *
     * @mbg.generated Sun Feb 28 14:10:18 CST 2021
     */
    public String getEmail() {
        return email;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column tbl_emplyee.email
     *
     * @param email the value for tbl_emplyee.email
     *
     * @mbg.generated Sun Feb 28 14:10:18 CST 2021
     */
    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column tbl_emplyee.d_id
     *
     * @return the value of tbl_emplyee.d_id
     *
     * @mbg.generated Sun Feb 28 14:10:18 CST 2021
     */
    public Integer getdId() {
        return dId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column tbl_emplyee.d_id
     *
     * @param dId the value for tbl_emplyee.d_id
     *
     * @mbg.generated Sun Feb 28 14:10:18 CST 2021
     */
    public void setdId(Integer dId) {
        this.dId = dId;
    }
}