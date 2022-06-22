package Servlet;

import JavaBean.Lrx_CzDao;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;


import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

@WebServlet(name = "Lrx_CzAddServlet", value = "/Lrx_CzAddServlet")
public class Lrx_CzAddServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setContentType("textml;charset=utf-8");

        Lrx_CzDao cz=new Lrx_CzDao();

        String user_id="2";


        FileItemFactory factory = new DiskFileItemFactory();
        // 文件上传处理器
        ServletFileUpload upload = new ServletFileUpload(factory);

        // 解析请求信息
        List items = null;
        try {
            items = upload.parseRequest(request);
        }
        catch (FileUploadException e) {
            e.printStackTrace();
        }

        // 对请求信息进行判断
        Iterator iter = items.iterator();

        while (iter.hasNext()) {//遍历所有form中的控件

            FileItem item = (FileItem) iter.next();
            // 获取表单文本内容
            if (item.isFormField()) {//非文件
                String fieldName = item.getFieldName();
                String value = item.getString("UTF-8");
               // System.out.println(fieldName+","+value);
                request.getSession().setAttribute(fieldName, value);
            }
            // 获取表单中文件内容
            else {//文件
                //获得所有文本内容
                String name=(String) request.getSession().getAttribute("h_name");
                String location=(String) request.getSession().getAttribute("h_location");
                String price=(String) request.getSession().getAttribute("h_price");
                String layout=(String) request.getSession().getAttribute("h_layout");
                String type=(String) request.getSession().getAttribute("h_type");
                String area=(String) request.getSession().getAttribute("h_area");
                String elevator=(String) request.getSession().getAttribute("h_elevator");
                String toward=(String) request.getSession().getAttribute("h_toward");
                String traffic=(String) request.getSession().getAttribute("h_traffic");
                String floor=(String) request.getSession().getAttribute("h_floor");
                String fileName = item.getName();//获得上传图片的名称
                int index = fileName.lastIndexOf("\\");
                fileName = fileName.substring(index + 1);
                cz.AddHouse(user_id,name,location,price,layout,type,area,elevator,toward,traffic,floor);
                cz.AddPhoto(name,fileName);
               // System.out.println((String) request.getSession().getAttribute("h_name"));
                request.setAttribute("realFileName", fileName);
                String basePath =  "C:/Web/LFouse/main/web/Image";
                System.out.println(basePath+"\n"+fileName);//打印当前位置
                File file = new File(basePath, fileName);
                try {
                    item.write(file);
                }
                catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        request.getRequestDispatcher("Lrx_Cz.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
}
