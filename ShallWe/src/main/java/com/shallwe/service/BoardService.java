package com.shallwe.service;

import java.rmi.RemoteException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.shallwe.dao.FreeBoardDAO;
import com.shallwe.dao.FreeReplyDAO;
import com.shallwe.dao.StudyBoardDAO;
import com.shallwe.dao.StudyReplyDAO;
import com.shallwe.exception.AddException;
import com.shallwe.exception.FindException;
import com.shallwe.exception.ModifyException;
import com.shallwe.exception.RemoveException;
import com.shallwe.model.BoardPageBean;
import com.shallwe.vo.FreeBoard;
import com.shallwe.vo.StudyBoard;
import com.shallwe.vo.StudyReply;

@Service(value = "boardService")
public class BoardService {
	@Autowired
	StudyBoardDAO studyBoardDAO;
	@Autowired
	StudyReplyDAO studyReplyDAO;
	@Autowired
	FreeBoardDAO freeBoardDAO;
	@Autowired
	FreeReplyDAO freeReplyDAO;
	/**
	 * 게시글 전체조회
	 * @author 박성운
	 * @param 페이지 번호
	 * @return 페이지 번호에 해당하는 게시글
	 * @throws FindException
	 */
	@Transactional
	public BoardPageBean<StudyBoard> findAll(int page) throws FindException{
		if(page<1) {
			throw new FindException(page+"페이지가 존재하지 않습니다.");
		}
		StudyBoard sb = new StudyBoard();
		BoardPageBean<StudyBoard> boardPageBean = new BoardPageBean(page);
		Map<String, Object> map = new HashMap<String, Object>();
		
		int startRow = boardPageBean.getStartRow();
		int endRow = boardPageBean.getEndRow();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		List<StudyBoard> list = studyBoardDAO.selectAll(map);
		
		for(StudyBoard s : list) {
			List<StudyReply> studyReply = studyReplyDAO.selectById(s.getStudyBoard_id());
			s.setReplylist(studyReply);
		}
		
		int rowCnt = studyBoardDAO.selectCount();
		int totalPage = (rowCnt % boardPageBean.CNT_PER_PAGE <= 0)? rowCnt/boardPageBean.CNT_PER_PAGE : rowCnt/boardPageBean.CNT_PER_PAGE+1;
		
		boardPageBean.setTotalPage(totalPage);
		boardPageBean.setList(list);
		boardPageBean.setStartRow(startRow);
		boardPageBean.setEndRow(endRow);
		boardPageBean.setCurrentPage(page);
		boardPageBean.setStartPage(((page-1)/10)*10+1);	
		boardPageBean.setEndPage(((page-1)/10+1)*10);
		return boardPageBean;
	}
	
	/**
	 * 게시글 검색(제목or내용)
	 * @author 박성운
	 * @param 검색내용
	 * @return 검색된 게시글(페이징)
	 * @throws FindException
	 */
	@Transactional(rollbackFor = FindException.class)
	public BoardPageBean<StudyBoard> search(String titleOrContent, int page) throws FindException{
		if(page<1) {
			throw new FindException(page+"페이지가 존재하지 않습니다.");
		}
		BoardPageBean<StudyBoard> boardPageBean = new BoardPageBean(page);
		Map<String, Object> map = new HashMap<String, Object>();
		String toc = "%"+titleOrContent+"%";
		
		int startRow = boardPageBean.getStartRow();
		int endRow = boardPageBean.getEndRow();
		map.put("studyBoard_title", toc);
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		List<StudyBoard> list = studyBoardDAO.selectByTitleAndContent(map);
		
		for(StudyBoard s : list) {
			List<StudyReply> studyReply = studyReplyDAO.selectById(s.getStudyBoard_id());
			s.setReplylist(studyReply);
		}
		
		int rowCnt = studyBoardDAO.SearchSelectCount(map);
		int totalPage = (rowCnt % boardPageBean.CNT_PER_PAGE <= 0)? rowCnt/boardPageBean.CNT_PER_PAGE : rowCnt/boardPageBean.CNT_PER_PAGE+1;
			
		boardPageBean.setTotalPage(totalPage);
		boardPageBean.setList(list);
		boardPageBean.setCurrentPage(page);
		boardPageBean.setStartPage(((page-1)/10)*10+1);	
		boardPageBean.setEndPage(((page-1)/10+1)*10);
		return boardPageBean;
		
	}
	
	/**
	 * 게시글 번호로 검색
	 * @author 박성운
	 * @param 게시글 번호
	 * @return 게시글 번호에 해당하는 게시글
	 * @throws FindException
	 */
	public StudyBoard FindByNo(int board_id) throws FindException {
		StudyBoard studyBoard = studyBoardDAO.selectByNo(board_id);
		return studyBoard;
	}
	
	/**
	 * 게시글 작성
	 * @author 박성운
	 * @param 작성할 게시글
	 * @return 
	 * @throws AddException
	 */
	public void writeBoard(StudyBoard board) throws AddException {
		studyBoardDAO.insert(board);
		
	}
	
	/**
	 * 게시글 변경
	 * @author 박성운
	 * @param 변경할 게시글
	 * @return 
	 * @throws ModifyException
	 */
	public void updateBoard(StudyBoard board) throws ModifyException {
		studyBoardDAO.update(board);
	}
	
	/**
	 * 게시글 삭제
	 * @author 박성운
	 * @param 삭제할 게시글 번호
	 * @return 
	 * @throws RemoteException
	 */	
	public void deleteBoard(int board_id) throws RemoteException {
		studyBoardDAO.delete(board_id);
	}

	/**
	 * 게시글 보기
	 * @author 박성운
	 * @param 게시글 번호
	 * @return 번호로 조회된 게시글
	 * @throws RemoteException
	 */	
	public StudyBoard detail(int board_id) throws FindException {
		StudyBoard studyBoard = studyBoardDAO.selectByNo(board_id);
		return studyBoard;
		
	}
	
	// FreeBoard Service Start
	
	/**
	 * freeboard
	 * 리스트 조회
	 * @author 김상하
	 * @param listAll
	 * @return 리스트페이지
	 * @throws FindException
	 */
	public List<FreeBoard> listAll()throws FindException{
		return freeBoardDAO.listAll();
	}
	
	/**
	 * freeboard
	 * 게시글 조회
	 * @author 김상하
	 * @param freeboard_id
	 * @return 게시글 페이지
	 * @throws FindException 
	 */
	public FreeBoard read(int freeboard_id)throws FindException{
		return freeBoardDAO.read(freeboard_id);
	}
	
	/**
	 * freeboard
	 * 게시글 쓰기
	 * @author 김상하
	 * @param 작성할 게시글 요소들
	 * @return
	 * @throws AddException
	 */
	public void insertFreeBoard(FreeBoard freeboard)throws AddException{
		freeBoardDAO.insert(freeboard);
	}

	/**
	 * freeboard
	 * 게시글 수정
	 * @author 김상하
	 * @param 수정할 게시글 
	 * @return
	 * @throws ModifyException
	 */
	public void updateFreeBoard(FreeBoard freeboard)throws ModifyException{
		freeBoardDAO.update(freeboard);
	}
	
	/**
	 * freeboard
	 * 게시글 삭제
	 * @author 김상하
	 * @param 삭제할 게시글 번호
	 * @return
	 * @throws RemoveException
	 */
	public void deleteFreeBoard(int freeboard_id)throws Exception{
		freeBoardDAO.delete(freeboard_id);
	}
	

}
