package shallwe;

import static org.junit.Assert.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertAll;

import org.junit.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.shallwe.dao.FaqDAO;
import com.shallwe.exception.FindException;

import lombok.extern.log4j.Log4j;

@ExtendWith(SpringExtension.class)
@ContextConfiguration({           //테스트할 설정파일들
	   "file:WebContent\\WEB-INF\\spring\\root-context.xml"
	})
@Log4j
public class faq {
	@Autowired
	FaqDAO faqDAO;
	
	@Test
	public void selectAll() throws FindException {
		System.out.println(faqDAO);
		assertNotNull(faqDAO);
//		assertAll();
		assertNotNull(faqDAO.selectAll());
	}
}
