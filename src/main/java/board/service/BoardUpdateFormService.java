package board.service;

import board.bean.BoardDTO;
import board.dao.BoardDAO;
import com.control.CommandProcess;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BoardUpdateFormService implements CommandProcess {
    @Override
    public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
        int seq = Integer.parseInt(request.getParameter("seq"));
        int pg  = Integer.parseInt(request.getParameter("pg"));

        BoardDAO boardDAO = BoardDAO.getInstance();
        BoardDTO boardDTO = boardDAO.getBoard(seq);

        request.setAttribute("boardDTO", boardDTO);
        request.setAttribute("pg", pg);

        return "/board/boardUpdateForm.jsp";
    }
}
