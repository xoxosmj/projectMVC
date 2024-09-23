package board.dao;

import board.bean.BoardDTO;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
import java.io.Reader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class BoardDAO {
    private SqlSessionFactory sqlSessionFactory;
    public static BoardDAO instance = new BoardDAO();

    public static BoardDAO getInstance() {
        return instance;
    }

    public BoardDAO() {
        try {
            Reader reader = Resources.getResourceAsReader("mybatis-config.xml");
            sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public void hitUpdate(int seq) {
        SqlSession sqlSession = sqlSessionFactory.openSession();
        sqlSession.update("boardSQL.hitUpdate", seq);
        sqlSession.commit();
        sqlSession.close();
    }

    public void boardWrite(Map<String, String> map) {
        SqlSession sqlSession = sqlSessionFactory.openSession();
        sqlSession.insert("boardSQL.boardWrite", map);
        sqlSession.commit();
        sqlSession.close();
    }

    public List<BoardDTO> boardList(int startNum, int endNum) {
        Map<String, Integer> map = new HashMap<String, Integer>();
        map.put("startNum", startNum);
        map.put("endNum", endNum);

        SqlSession sqlSession = sqlSessionFactory.openSession();
        List<BoardDTO> list = sqlSession.selectList("boardSQL.boardList", map);
        sqlSession.close();
        return list;
    }


    public int getTotalA() {
        int totalA = 0;
        SqlSession sqlSession = sqlSessionFactory.openSession();
        totalA = sqlSession.selectOne("boardSQL.getTotalA");
        sqlSession.close();
        return totalA;
    }

    public BoardDTO getBoard(int seq) {
        SqlSession sqlSession = sqlSessionFactory.openSession();
        BoardDTO boardDTO = sqlSession.selectOne("boardSQL.getBoard", seq);
        sqlSession.close();
        return boardDTO;
    }

    public void boardUpdate(Map<String, String> map) {
        SqlSession sqlSession = sqlSessionFactory.openSession();
        sqlSession.update("boardSQL.boardUpdate", map);
        sqlSession.commit();
        sqlSession.close();
    }
}














