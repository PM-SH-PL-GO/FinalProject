package test;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import com.shallwe.dao.TutorDAO;
import com.shallwe.exception.FindException;

@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = {"file:src\\main\\webapp\\WEB-INF\\spring\\root-context.xml"})
public class jun6Test {
	@Autowired
	private TutorDAO tutorDAO;
	
	
	@Test
	void ppap() {	
		try {
			tutorDAO.selectAllPreTutor();
		}catch(FindException e)
		{
			e.printStackTrace();
		}
		
	}
}
