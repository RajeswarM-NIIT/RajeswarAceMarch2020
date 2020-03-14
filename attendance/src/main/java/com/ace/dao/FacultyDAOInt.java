package com.ace.dao;

import java.util.List;

import com.ace.controller.AttForm;
import com.ace.model.Course;
import com.ace.model.Vw_Att_Present;
import com.ace.model.Vw_Cource_Batch_Schedule_Registration_Student;
import com.ace.model.Vw_Course_Batch;

public interface FacultyDAOInt {
	public abstract List<Vw_Course_Batch> getRunningBatchesForAttendance();
	public abstract List<Vw_Cource_Batch_Schedule_Registration_Student> getAttScreenForBatch(String bid);
	public abstract boolean markAttendance(AttForm att);
	public abstract List<Vw_Att_Present> getPresentData();
	
}
