package board.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import board.bean.BoardDTO;
import board.bean.BoardPaging;
import board.dao.BoardDAO;

public class BoardListService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		//데이터
		int pg = 1;
		if(request.getParameter("pg") != null) pg = Integer.parseInt(request.getParameter("pg"));
		
		//1페이지당 5개씩
		/*
		//오라클
		int endNum = pg * 5;
		int startNum = endNum - 4;
		*/

		//MySQL
		int endNum = 5; // 개수
		int startNum = pg*endNum -endNum; //시작위치, 0부터 시작 - 0,5,10

		//DB
		BoardDAO boardDAO = BoardDAO.getInstance();
		List<BoardDTO> list = boardDAO.boardList(startNum, endNum);
		
		//페이징 처리
		int totalA = boardDAO.getTotalA();
		
		BoardPaging boardPaging = new BoardPaging();
		boardPaging.setCurrentPage(pg);
		boardPaging.setPageBlock(3);
		boardPaging.setPageSize(5);
		boardPaging.setTotalA(totalA);
		
		boardPaging.makePagingHTML();

		request.setAttribute("pg",pg);
		request.setAttribute("list", list);
		request.setAttribute("boardPaging", boardPaging);
		return "/board/boardList.jsp";
	}

}












