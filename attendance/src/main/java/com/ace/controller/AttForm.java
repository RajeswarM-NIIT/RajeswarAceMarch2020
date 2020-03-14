package com.ace.controller;

import java.util.ArrayList;
import java.util.List;

import com.ace.model.Vw_Cource_Batch_Schedule_Registration_Student;

public class AttForm {
	private List<Vw_Cource_Batch_Schedule_Registration_Student> studentrecords;
	
	public AttForm() {
		studentrecords = new ArrayList<Vw_Cource_Batch_Schedule_Registration_Student> ();
	}

	public List<Vw_Cource_Batch_Schedule_Registration_Student> getStudentrecords() {
		return studentrecords;
	}

	public void setStudentrecords(List<Vw_Cource_Batch_Schedule_Registration_Student> studentrecords) {
		this.studentrecords = studentrecords;
	}
	
	
	
}
