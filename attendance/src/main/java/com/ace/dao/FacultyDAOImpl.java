package com.ace.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ace.controller.AttForm;
import com.ace.model.Att_Batch_Schedule_Students;
import com.ace.model.Batch_Schedule_Students;
import com.ace.model.Vw_Att_Present;
import com.ace.model.Vw_Cource_Batch_Schedule_Registration_Student;
import com.ace.model.Vw_Course_Batch;

@Repository
public class FacultyDAOImpl implements FacultyDAOInt {

	@Autowired
	private SessionFactory sf;	
	
	public List<Vw_Att_Present> getPresentData() {
		Session s = sf.openSession();
		SQLQuery qr = s.createSQLQuery("select * from VW_ATT_PRESENT ");
		List<Vw_Att_Present> data = qr.list();		
		s.close();
		return data;
	}
	
	
	public List<Vw_Course_Batch> getRunningBatchesForAttendance() {
		Session ses = sf.openSession();
		Query q = ses.createQuery("from Vw_Course_Batch where status='Running'");
		List<Vw_Course_Batch> batches = q.list();
		ses.close();
		return batches;
	}
	
	public List<Vw_Cource_Batch_Schedule_Registration_Student> getAttScreenForBatch(String bid) {
		Session ses = sf.openSession();
		String qry = "FROM Vw_Cource_Batch_Schedule_Registration_Student where sessionno=(select min(sessionno) from Vw_Cource_Batch_Schedule_Registration_Student  where batchid=? and batchschedulestudentsstatus='pending' ) and batchid=?";		
		Query q = ses.createQuery(qry);
		q.setString(0, bid);
		q.setString(1, bid);		
		List<Vw_Cource_Batch_Schedule_Registration_Student> att = q.list();
		ses.close();
		return att;
	}
	public boolean markAttendance(AttForm att) {
		boolean result=false;
		Session ses = sf.openSession();
		for(Vw_Cource_Batch_Schedule_Registration_Student at : att.getStudentrecords()) {
			Att_Batch_Schedule_Students tempatt = new Att_Batch_Schedule_Students();
			tempatt.setAttid(generateAttendanceId());
			tempatt.setBatchid(at.getBatchid());
			tempatt.setAttstatus(at.getAttst());
			tempatt.setBatchschstid(at.getBatchschstid());
			tempatt.setCrsid(at.getCrsid());
			tempatt.setRegid(at.getRegid());
			tempatt.setSessionno(at.getSessionno());
			Batch_Schedule_Students tb = ses.get(Batch_Schedule_Students.class, at.getBatchschstid());
			tb.setBatchschedulestudentsstatus("finished");			
			ses.beginTransaction();
			ses.update(tb);
			ses.save(tempatt);
			ses.getTransaction().commit();			
		}
		ses.close();
		result=true;
		return result;		
	}
	
	private String generateAttendanceId() {
		String newid="";
		Session ses = sf.openSession();
		Query qry = ses.createQuery(" from Att_Batch_Schedule_Students");
		int nor = qry.list().size();
		ses.close();
		if(nor>0) {	 // if table is not empty		
			Session ses1 = sf.openSession();			
			String qr = "select max(attid) from Att_Batch_Schedule_Students";
			System.out.println(qr);
			Query qry1 = ses1.createQuery(qr);
			List<String> data = qry1.list();
			ses1.close();
			String existingId = data.get(0);
			System.out.print("\nExisting id : " + existingId);
			int id = Integer.parseInt(existingId.substring(4));
			System.out.println(id);
			id++;
			if(id<=9) {
				newid = "ATTN0000"+id;				
			}
			else if(id<=99) {
				newid = "ATTN000"+id;	
			}
			else if(id<=999) {
				newid = "ATTN00"+id;	
			}
			else if(id<=9999) {
				newid = "ATTN0"+id;	
			}
			else {
				newid = "ATTN"+id;
			}	
		}
		else { // if table is empty
			newid="ATTN00001";
		}
		return newid;
	}
}
