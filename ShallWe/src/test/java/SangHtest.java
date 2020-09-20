


import java.util.ArrayList;
import java.util.List;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import com.shallwe.dao.MemberDAO;
import com.shallwe.exception.AddException;
import com.shallwe.exception.FindException;
import com.shallwe.exception.ModifyException;
import com.shallwe.model.MemberInfoBean;
import com.shallwe.vo.LectureCategory;

import lombok.extern.log4j.Log4j;

@ExtendWith(SpringExtension.class)
@ContextConfiguration({
	"file:src\\main\\webapp\\WEB-INF\\spring\\root-context.xml"
})
@Log4j
public class SangHtest {
	@Autowired
	MemberDAO memberDAO;
	
//	@Test
	public void Join() { // 회원가입 : 상하
		String memberId ="dms";
		String memberPwd ="22352";
		String memberName ="점보맘보";
		String memberEmail ="jbmb@gmail.com";
		String memberPhone ="010-3030-0030";
		LectureCategory favorite1 = new LectureCategory();
		LectureCategory favorite2 = new LectureCategory();
		LectureCategory favorite3 = new LectureCategory();
		String memberSex ="M";
		String tutorYN ="N";
//		Map<String,String> mib = new HashMap<String, String>();
//		mib.co
//		for(mib : c)
		MemberInfoBean mib = new MemberInfoBean();
		mib.setMemberId(memberId);
		mib.setMemberPwd(memberPwd);
		mib.setMemberName(memberName);
		mib.setMemberEmail(memberEmail);
		favorite1.setLecture_category_id("BU");
		favorite2.setLecture_category_id("HO");
		favorite3.setLecture_category_id("");
		mib.setFavorite1(favorite1);
		mib.setFavorite2(favorite2);
		mib.setFavorite3(favorite3);
		mib.setMemberPhone(memberPhone);
		mib.setMemberSex(memberSex);
		mib.setTutorYN(tutorYN);
		
			try {
				memberDAO.joinMember(mib);
			} catch (AddException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
	}
//	@Test
	public void selectById() { //아이디로 내 정보 찾기 : 상하
		String memberId ="member1";
		try {
			memberDAO.selectById(memberId);
		} catch (FindException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
//	@Test
	public void updatePassword() { // 비밀번호 수정: 상하
		String memberId = "member1";
		String memberPwd= "yalayalayalasyeong3";
		try {
			memberDAO.updatePassword(memberId, memberPwd);
		} catch (ModifyException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
	//@Test
	public void updateEmail() { // 이메일 수정: 상하
		String memberId = "member1";
		String memberEmail= "mail@lycos.yu.hu";
		try {
			memberDAO.updateEmail(memberId, memberEmail);
		} catch (ModifyException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
//	@Test
	public void updatePhone() { // 핸드폰번호 수정: 상하
		String memberId = "member1";
		String memberPhone= "010-1331-9798";
		try {
			memberDAO.updatePhone(memberId, memberPhone);
		} catch (ModifyException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
	@Test
	public void updateFavorites() { // Favorites 수정: 상하
		String memberId = "member2";
		List<LectureCategory> favoritelist = new ArrayList<>();
		LectureCategory favorite1 = new LectureCategory();
		LectureCategory favorite2 = new LectureCategory();
		LectureCategory favorite3 = new LectureCategory();
		favorite1.setLecture_category_id("LE");
		favorite2.setLecture_category_id("HO");
		favorite3.setLecture_category_id("");
		favorite1.setLecture_category_name("Lession");
		favorite2.setLecture_category_name("Hobby");
		favorite3.setLecture_category_name("");
		
		
		favoritelist.add(favorite1);
		favoritelist.add(favorite2);
		favoritelist.add(favorite3);
		try {
			memberDAO.updateFavorites(memberId, favoritelist);
		} catch (ModifyException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
	
}
