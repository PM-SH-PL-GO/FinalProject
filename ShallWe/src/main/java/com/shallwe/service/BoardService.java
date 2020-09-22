package com.shallwe.service;

import java.rmi.RemoteException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.shallwe.dao.StudyBoardDAO;
import com.shallwe.exception.AddException;
import com.shallwe.exception.FindException;
import com.shallwe.exception.ModifyException;
import com.shallwe.model.BoardPageBean;
import com.shallwe.vo.StudyBoard;

@Service(value = "boardService")
public class BoardService {
	@Autowired
	StudyBoardDAO studyBoardDAO;
	
	/**
	 * 게시글 전체조회
	 * @author 박성운
	 * @param 페이지 번호
	 * @return 페이지 번호에 해당하는 게시글
	 * @throws FindException
	 */
	public BoardPageBean<StudyBoard> findAll(int page) throws FindException{
		if(page<1) {
			throw new FindException(page+"페이지가 존재하지 않습니다.");
		}
		BoardPageBean<StudyBoard> boardPageBean = new BoardPageBean(page);
		Map<String, Object> map = new HashMap<String, Object>();
		
		int startRow = boardPageBean.getStartRow();
		int endRow = boardPageBean.getEndRow();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		List<StudyBoard> list = studyBoardDAO.selectAll(map);

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
		String toc = "%"+titleOrContent+"%";
		List<StudyBoard> list = studyBoardDAO.selectByTitleAndContent(toc);

		int rowCnt = list.size();
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
}
