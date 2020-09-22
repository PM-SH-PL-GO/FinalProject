package shallwe;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import com.shallwe.dao.MemberDAO;
import com.shallwe.exception.FindException;

import lombok.extern.log4j.Log4j;

@ExtendWith(SpringExtension.class)
@ContextConfiguration({           //테스트할 설정파일들
	   "file:src\\main\\webapp\\WEB-INF\\spring\\root-context.xml"
	})
@Log4j
public class jun6Test {
	@Autowired
	private MemberDAO memberDAO;
	
	@Test
	@DisplayName("memberdao")
	void a() throws FindException {
		memberDAO.selectAllMember();
	}
}
