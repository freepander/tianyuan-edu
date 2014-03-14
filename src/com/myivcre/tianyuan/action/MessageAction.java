package com.myivcre.tianyuan.action;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.myivcre.tianyuan.model.Message;

@Component("messageAction")
@Scope("prototype")
public class MessageAction extends BaseAction {

	private static final long serialVersionUID = 1L;
	private Message messages;
	public String list(){
		this.list=this.baseService.getByHal("from message order by id desc");
		return "success";
	}
	
	public String visible(){
		this.messages=(Message) this.baseService.get(Message.class, id);
		this.messages.setVisible(true);
		return "list";
	}
	public String delete(){
		System.out.println(id);
		this.messages=(Message) this.baseService.get(Message.class, id);
		this.baseService.delete(this.messages);
		return "list";
	}

	
	public Message getMessages() {
		return messages;
	}

	public void setMessages(Message messages) {
		this.messages = messages;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
	
}
