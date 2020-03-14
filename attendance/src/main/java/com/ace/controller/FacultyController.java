package com.ace.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ace.dao.FacultyDAOInt;
import com.ace.model.Vw_Cource_Batch_Schedule_Registration_Student;
import com.ace.model.Vw_Course_Batch;

@Controller
public class FacultyController {
	@Autowired
	private FacultyDAOInt facdao;
	
	@RequestMapping("/reqFacPage")
	public String displayFacPage(Model m){
		List<Vw_Course_Batch> batches = facdao.getRunningBatchesForAttendance();
		m.addAttribute("batches", batches);
		return "facpage";
	}
	
	@RequestMapping("/reqGetAttendancePage")
	public String getAttendancepage(@RequestParam("batchid")String batchid, Model m) {
		List<Vw_Cource_Batch_Schedule_Registration_Student> att = facdao.getAttScreenForBatch(batchid);
		AttForm form = new AttForm();
		form.setStudentrecords(att);
		m.addAttribute("form",form);		
		return "attpage";		
	}
	
	
//	@RequestMapping("/reqGetAttendancePage")
//	public String getAttendancepage(@RequestParam("batchid")String batchid, Model m) {
//		List<Vw_Cource_Batch_Schedule_Registration_Student> att = facdao.getAttScreenForBatch(batchid);
//		List<Vw_Cource_Batch_Schedule_Registration_Student> data = facdao.getAttScreenForBatch(batchid);
//		m.addAttribute("att",att);
//		
//		m.addAttribute("data",data);
//		return "attpage";		
//	}
	
	@RequestMapping("/reqMarkAttendance")
	public String markAttendance(@ModelAttribute("form")AttForm form,Model m) {
	
		facdao.markAttendance(form);		
		return "redirect:/reqFacPage";
	}
	
	
	
}
