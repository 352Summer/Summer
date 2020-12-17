package com.kh.summer.user.attachment.model.vo;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class Attachment {
	
	private int aNo;
	private String oldFileName;
	private String newFileName;
	private String filePath;
	private int fIndex;
	private String pCode;
	private int bNo;
	private int bcNo;

}
