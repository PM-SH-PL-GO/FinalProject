


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import com.shallwe.dao.MemberDAO;
import com.shallwe.dao.WishListDAO;
import com.shallwe.exception.AddException;
import com.shallwe.exception.FindException;
import com.shallwe.exception.ModifyException;
import com.shallwe.exception.RemoveException;
import com.shallwe.model.MemberInfoBean;
import com.shallwe.vo.Lecture;
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
	@Autowired
	WishListDAO wishDAO;
	
//	@Test
	 void Join() { // 회원가입 : 상하
		String memberId ="nanana";
		String memberPwd ="22352";
		String memberName ="나나나";
		String memberEmail ="jbmb@gmail.com";
		String memberPhone ="010-3031-0030";
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
	 void selectById() { //아이디로 내 정보 찾기 : 상하
		String memberId ="member1";
		try {
			memberDAO.selectById(memberId);
		} catch (FindException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
//	@Test
	 void updatePassword() { // 비밀번호 수정: 상하
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
	 void updateEmail() { // 이메일 수정: 상하
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
	 void updatePhone() { // 핸드폰번호 수정: 상하
		String memberId = "member1";
		String memberPhone= "010-1331-9798";
		try {
			memberDAO.updatePhone(memberId, memberPhone);
		} catch (ModifyException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
	@Test  //테스트 실패이니 점검
	 void updateFavorites() { // Favorites 수정: 상하
		String member_id = "member2";
//		String favorite1 = "LE";
//		String favorite2 = "HO";
//		String favorite3 = "";
//		Map<String, String>map = new HashMap<>();
//		map.put("member_id", member_id);
//		map.put("favorite1", favorite1);
//		map.put("favorite2", favorite2);
//		map.put("favorite3", favorite3);
		List<LectureCategory> favorite_list = new ArrayList<>();
		LectureCategory favorite1 = new LectureCategory();
		LectureCategory favorite2 = new LectureCategory();
		LectureCategory favorite3 = new LectureCategory();
		favorite1.setLecture_category_id("HO");
		favorite2.setLecture_category_id("SP");
		favorite3.setLecture_category_id("DE");
		favorite_list.add(favorite1);
		favorite_list.add(favorite2);
		favorite_list.add(favorite3);
		
		try {
			memberDAO.updateFavorites(member_id, favorite_list);
		} catch (ModifyException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
//	@Test
	 void insertWishList() { //찜목록에 추가 : 상하
		String member_id = "member3";
		String lecture_category_id = "MA";
		int lecture_id = 4; 
		
		LectureCategory lectureCategory = new LectureCategory();
		lectureCategory.setLecture_category_id(lecture_category_id);
		
		Lecture lecture = new Lecture();
		lecture.setLectureCategory(lectureCategory);
		lecture.setLecture_id(lecture_id);
		
		Map<String, Object>map = new HashMap<String, Object>();
		map.put("member_id", member_id);
		map.put("lecture", lecture);
		
		
		try {
			wishDAO.addFavLec(map);
		}catch(AddException e) {
			e.printStackTrace();
		}
	}
//	@Test
	 void deleteWishList() { //찜목록 삭제 : 상하
		String member_id = "member1";
		int lecture_id = 4;

		Map<String, Object>map = new HashMap<String, Object>();
		map.put("member_id", member_id);
		map.put("lecture_id", lecture_id);
		
		try {
			wishDAO.deleteFavLec(map);
		}catch(RemoveException e) {
			e.printStackTrace();
		}
	}
	@Test
	 void selectWishListById(){
		String member_id = "member3";
		List<Lecture> wishall = new ArrayList<Lecture>();
		try {
			wishall=wishDAO.selectWishListById(member_id);
			if ( wishall.size() == 0  ) {
				throw new FindException("검색 결과가 없습니다.");
			}
		}catch(FindException e) {
			e.printStackTrace();
		}
//		return wishall;
	}
}
