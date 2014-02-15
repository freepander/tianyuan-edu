package com.myivcre.tianyuan.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.myivcre.tianyuan.model.StudentUser;
import com.myivcre.tianyuan.model.TeacherUser;
import com.myivcre.tianyuan.service.BaseService;

@Component("fileUploadAction")
@Scope("prototype")
public class FileUpload {
	private String username;
	private File myFile;
	private long id;
	private String myFileContentType;
	private String myFileFileName;
	@Resource
	private BaseService baseService;
	private List list;
	private boolean asex;
	public String studentLogo() throws Exception{
		//文件上传
		InputStream is=new FileInputStream(myFile);
		String uploadPath=ServletActionContext.getServletContext().getRealPath("/upload/studentlogo");
		String s=this.myFileFileName.substring(this.getMyFileFileName().indexOf("."));
		File toFile=new File(uploadPath, this.getUsername()+s);
		OutputStream os=new FileOutputStream(toFile);  
        byte[] buffer = new byte[1024];  
        int length = 0;    
        while ((length = is.read(buffer)) > 0) {  
            os.write(buffer, 0, length);  
        }  
        is.close();    
        os.close();  
        //将文件名存入数据库中
        StudentUser studentUser=(StudentUser)this.baseService.get(StudentUser.class, id);
        studentUser.setLogo(this.getUsername()+s);
        this.baseService.update(studentUser);
        //返回信息
		HttpServletResponse response=ServletActionContext.getResponse();
		try {
			String result="{error: '',msg: 'success'}";
			response.getOutputStream().print(result);
			response.getOutputStream().close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	public String teacherLogo() throws Exception{
		//文件上传
		InputStream is=new FileInputStream(myFile);
		String uploadPath=ServletActionContext.getServletContext().getRealPath("/upload/teacherlogo");
		String s=this.myFileFileName.substring(this.getMyFileFileName().indexOf("."));
		File toFile=new File(uploadPath, this.getUsername()+s);
		OutputStream os=new FileOutputStream(toFile);  
        byte[] buffer = new byte[1024];  
        int length = 0;  
        while ((length = is.read(buffer)) > 0) {  
            os.write(buffer, 0, length);  
        }  
        is.close();    
        os.close();  
        //将文件名与老师关联  存如数据库
        TeacherUser teacherUser=(TeacherUser)this.baseService.get(TeacherUser.class, id);
        teacherUser.setLogo(this.getUsername()+s);
        this.baseService.update(teacherUser);
        //返回数据
//		HttpServletResponse response=ServletActionContext.getResponse();
//		try {
//			response.getOutputStream().print("{}");
//			response.getOutputStream().close();
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
		return null;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getMyFileContentType() {
		return myFileContentType;
	}
	public void setMyFileContentType(String myFileContentType) {
		this.myFileContentType = myFileContentType;
	}

	public String getMyFileFileName() {
		return myFileFileName;
	}
	public void setMyFileFileName(String myFileFileName) {
		this.myFileFileName = myFileFileName;
	}
	public File getMyFile() {
		return myFile;
	}
	public void setMyFile(File myFile) {
		this.myFile = myFile;
	}
	public BaseService getBaseService() {
		return baseService;
	}
	public void setBaseService(BaseService baseService) {
		this.baseService = baseService;
	}
	
}
