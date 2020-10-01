package com.shallwe.service;

import java.rmi.RemoteException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.shallwe.dao.StudyBoardDAO;
import com.shallwe.dao.StudyReplyDAO;
import com.shallwe.exception.AddException;
import com.shallwe.exception.FindException;
import com.shallwe.exception.ModifyException;
import com.shallwe.model.BoardPageBean;
import com.shallwe.vo.StudyBoard;
import com.shallwe.vo.StudyReply;

@Service(value = "replyService")
public class ReplyService {
	@Autowired
	StudyReplyDAO studyReplyDAO;
	
	/**
	 * 
	 * @author 박성운
	 * @param 게시글번호, 페이지 번호
	 * @return 게시글에 해당하는 댓글 찾기
	 * @throws FindException
	 */
	public BoardPageBean<StudyReply> findAll(int board_no, int page) throws FindException{
		if(page<1) {
			throw new FindException(page+"페이지가 존재하지 않습니다.");
		}
		BoardPageBean<StudyReply> boardPageBean = new BoardPageBean(page);
		Map<String, Object> map = new HashMap<String, Object>();
		
		int startRow = boardPageBean.getStartRow();
		int endRow = boardPageBean.getEndRow();
		map.put("boardNo", board_no);
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		List<StudyReply> list = studyReplyDAO.selectAll(map);

		int rowCnt = list.size();
		int totalPage = (rowCnt % boardPageBean.CNT_PER_PAGE <= 0)? rowCnt/boardPageBean.CNT_PER_PAGE : rowCnt/boardPageBean.CNT_PER_PAGE+1;
		
		boardPageBean.setTotalPage(totalPage);
		boardPageBean.setList(list);
		boardPageBean.setStartRow(startRow);
		boardPageBean.setEndRow(endRow);
		boardPageBean.setStartPage(((page-1)/10)*10+1);	
		boardPageBean.setEndPage(((page-1)/10)*10+1);	
		boardPageBean.setCurrentPage(page);
		return boardPageBean;
	}	
	/**
	 * @author 박성운
	 * @param 작성할 댓글
	 * @return 
	 * @throws AddException
	 */	
	public void writeReply(StudyReply reply) throws AddException {
		studyReplyDAO.insert(reply);
	}
	
	/**
	 * @author 박성운
	 * @param 변경할 댓글
	 * @return 
	 * @throws ModifyException
	 */	
	public void updateReply(StudyReply reply) throws ModifyException {
		studyReplyDAO.update(reply);
	}

	/**
	 * @author 박성운
	 * @param 삭제할 게시글 번호
	 * @return 
	 * @throws RemoteException
	 */	
	public void deleteReply(int reply_id) throws RemoteException {
		studyReplyDAO.delete(reply_id);
	}
	
	
}
