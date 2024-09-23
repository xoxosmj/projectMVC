package imageboard.dao;

import imageboard.bean.ImageboardDTO;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
import java.io.Reader;

public class ImageboardDAO {

    private SqlSessionFactory sqlSessionFactory;
    private static ImageboardDAO instance = new ImageboardDAO();

    public static ImageboardDAO getInstance() {
        return instance;
    }

    public ImageboardDAO() {
        Reader reader = null;
        try {
            reader = Resources.getResourceAsReader("mybatis-config.xml");
            sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
        } catch (IOException e) {
            e.printStackTrace();
        }


    }

    public void imageboardWrite(ImageboardDTO imageboardDTO) {
    SqlSession sqlSession = sqlSessionFactory.openSession();
    sqlSession.insert("imageboardSQL.imageboardWrite",imageboardDTO);
    sqlSession.commit();
    sqlSession.close();


    }
}
