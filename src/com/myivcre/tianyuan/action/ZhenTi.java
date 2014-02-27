package com.myivcre.tianyuan.action;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

@Component("zhenTiAction")
@Scope("prototype")
public class ZhenTi extends BaseAction {
	
	public String index(){
		this.list=this.baseService.getByHal("from inscribescategoryone");
		return "wanglianzhenti";
	}

}
