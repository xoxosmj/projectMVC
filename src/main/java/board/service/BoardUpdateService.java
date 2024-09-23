package board.service;

import board.dao.BoardDAO;
import com.control.CommandProcess;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

public class BoardUpdateService implements CommandProcess {
    @Override
    public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
        int seq = Integer.parseInt(request.getParameter("seq"));
        String subject = request.getParameter("subject");
        String content = request.getParameter("content");


        Map<String, String> map = new HashMap<String, String>();
        map.put("seq", String.valueOf(seq));
        map.put("subject", subject);
        map.put("content", content);

        //DB

        BoardDAO boardDAO = BoardDAO.getInstance();
        boardDAO.boardUpdate(map);

        return "none";
    }
}
