package board.service;

import board.bean.BoardDTO;
import board.dao.BoardDAO;
import com.control.CommandProcess;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BoardViewService implements CommandProcess {

    @Override
    public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
        //데이터
        int seq = Integer.parseInt(request.getParameter("seq"));
        int pg = Integer.parseInt(request.getParameter("pg"));

        //DB
        BoardDAO boardDAO = BoardDAO.getInstance();
        BoardDTO boardDTO = boardDAO.getBoard(seq);

        request.setAttribute("pg", pg);
        request.setAttribute("boardDTO", boardDTO);


        return "/board/boardView.jsp";
    }
}
