package com.kh.summer.user.board.model.vo;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class Attachment implements Serializable {
	
	private static final long serialVersionUID = 202012142234L;

	private int aNo;
	private String oldFileName;
	private String newFileName;
	private String filePath;
	private int fIndex;
	private String pCode;
	private int bNo;
	private int bcNo;
}
