import java.util.HashMap;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import com.shallwe.dao.MemberDAO;
import com.shallwe.exception.ModifyException;
import com.shallwe.vo.Member;
import lombok.extern.log4j.Log4j;


@Log4j
@ExtendWith(SpringExtension.class)
@ContextConfiguration({"file:src\\main\\webapp\\WEB-INF\\spring\\root-context.xml"})

public class MemberTest {
	
	@Autowired
	MemberDAO dao;
	
	@Test
	public void 비밀번호변경() {
		
		Member member = new Member();
		HashMap<String,Object>map = new HashMap();
		
		map.put("member_id", "member1");
		map.put("member_pwd", "1111");
		map.put("member_phone", "000-0000-0000");
		
			try {
				
				dao.changePwd(map);
				
			} catch (ModifyException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
	}
	
