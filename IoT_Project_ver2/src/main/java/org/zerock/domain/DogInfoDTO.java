package org.zerock.domain;

import java.util.Date;

import lombok.Data;

@Data
public class DogInfoDTO {

	private Long dno;
	private Date regdate;
	private String age;
	private String simple;
	private Double weight;
	private String fileName;
	private String health;
	private String name;
	private String kind;
	private String feature;
	private String sex;
}
