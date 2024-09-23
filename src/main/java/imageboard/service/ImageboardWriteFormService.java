package imageboard.service;

import com.control.CommandProcess;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ImageboardWriteFormService implements CommandProcess {
    @Override
    public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

        return "/imageboard/imageboardWriteForm.jsp";

    }
}
