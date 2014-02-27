package com.myivcre.tianyuan.action;

import java.io.File;
import java.io.PrintWriter;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.opensymphony.xwork2.ActionSupport;

@Component("fileAction")
@Scope("prototype")
public class FileAction extends ActionSupport {

	private File uploadify;
	private String uploadifyFileName;

	public String organizationlogo() {
		PrintWriter out = null;
		try {
			String filePath = ServletActionContext.getRequest().getRealPath(
					"/upload/organizationlogo");
			out = ServletActionContext.getResponse().getWriter();
			File path = new File(filePath);
			if (!path.exists()) {
				path.mkdirs();
			}
			FileUtils.copyFile(uploadify, new File(filePath + "/"
					+ uploadifyFileName));
			out.print("success");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (out != null) {
				out.close();
			}
		}
		return null;
	}
	public String artivitiespic() {
		PrintWriter out = null;
		try {
			String filePath = ServletActionContext.getRequest().getRealPath(
					"/upload/artivitiespic");
			out = ServletActionContext.getResponse().getWriter();
			File path = new File(filePath);
			if (!path.exists()) {
				path.mkdirs();
			}
			FileUtils.copyFile(uploadify, new File(filePath + "/"
					+ uploadifyFileName));
			out.print("success");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (out != null) {
				out.close();
			}
		}
		return null;
	}
	public String newspic() {
		PrintWriter out = null;
		try {
			String filePath = ServletActionContext.getRequest().getRealPath(
					"/upload/newspic");
			out = ServletActionContext.getResponse().getWriter();
			File path = new File(filePath);
			if (!path.exists()) {
				path.mkdirs();
			}
			FileUtils.copyFile(uploadify, new File(filePath + "/"
					+ uploadifyFileName));
			out.print("success");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (out != null) {
				out.close();
			}
		}
		return null;
	}
	public String inscribes() {
		PrintWriter out = null;
		try {
			String filePath = ServletActionContext.getRequest().getRealPath(
					"/upload/inscribes");
			out = ServletActionContext.getResponse().getWriter();
			File path = new File(filePath);
			if (!path.exists()) {
				path.mkdirs();
			}
			FileUtils.copyFile(uploadify, new File(filePath + "/"
					+ uploadifyFileName));
			out.print("success");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (out != null) {
				out.close();
			}
		}
		return null;
	}
	public String teacherLogo() {
		PrintWriter out = null;
		try {
			String filePath = ServletActionContext.getRequest().getRealPath(
					"/upload/teacherlogo");
			out = ServletActionContext.getResponse().getWriter();
			File path = new File(filePath);
			if (!path.exists()) {
				path.mkdirs();
			}
			FileUtils.copyFile(uploadify, new File(filePath + "/"
					+ uploadifyFileName));
			out.print("success");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (out != null) {
				out.close();
			}
		}
		return null;
	}
	public String studentLogo() {
		PrintWriter out = null;
		try {
			String filePath = ServletActionContext.getRequest().getRealPath(
					"/upload/studentlogo");
			out = ServletActionContext.getResponse().getWriter();
			File path = new File(filePath);
			if (!path.exists()) {
				path.mkdirs();
			}
			FileUtils.copyFile(uploadify, new File(filePath + "/"
					+ uploadifyFileName));
			out.print("success");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (out != null) {
				out.close();
			}
		}
		return null;
	}
	public String booklogo() {
		PrintWriter out = null;
		try {
			String filePath = ServletActionContext.getRequest().getRealPath(
					"/upload/books");
			out = ServletActionContext.getResponse().getWriter();
			File path = new File(filePath);
			if (!path.exists()) {
				path.mkdirs();
			}
			FileUtils.copyFile(uploadify, new File(filePath + "/"
					+ uploadifyFileName));
			out.print("success");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (out != null) {
				out.close();
			}
		}
		return null;
	}
	public File getUploadify() {
		return uploadify;
	}
	public void setUploadify(File uploadify) {
		this.uploadify = uploadify;
	}
	public String getUploadifyFileName() {
		return uploadifyFileName;
	}
	public void setUploadifyFileName(String uploadifyFileName) {
		this.uploadifyFileName = uploadifyFileName;
	}

}
