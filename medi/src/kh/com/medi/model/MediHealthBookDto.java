package kh.com.medi.model;

import java.io.Serializable;
/*
CREATE TABLE `medi`.`medi_health_book` (
`seq` INT(8) NOT NULL AUTO_INCREMENT,
`mem_seq` INT(8) NOT NULL,
`birth` VARCHAR(20) NOT NULL,
`gender` VARCHAR(10) NOT NULL,
`height` INT(20) NOT NULL,
`weight` INT(20) NOT NULL,
`bloodtype` VARCHAR(10) NOT NULL,
`allergy` VARCHAR(2000) NOT NULL,
PRIMARY KEY (`seq`),
INDEX `FK_medi_health_book_mem_seq_idx` (`mem_seq` ASC),
CONSTRAINT `FK_medi_health_book_mem_seq`
  FOREIGN KEY (`mem_seq`)
  REFERENCES `medi`.`medi_member` (`seq`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION);
 */

/*INSERT INTO `medi`.`medi_health_book` 
(`seq`, `mem_seq`, `birth`, `gender`, `height`, `weight`, `bloodtype`, `allergy`) 
VALUES (null,1, '1983-05-13', 'm', '170', '55','A','복숭아 알러지');
*/


public class MediHealthBookDto implements Serializable {
	
	private int seq;
	private int mem_seq;
	private String birth;
	private String gender;
	private int height;
	private int weight;
	private String bloodtype;
	private String allergy;
	
	public MediHealthBookDto() {
		
	}
	
	
	public MediHealthBookDto(int seq, int mem_seq, String birth, String gender, int height, int weight,
			String bloodtype, String allergy) {
		super();
		this.seq = seq;
		this.mem_seq = mem_seq;
		this.birth = birth;
		this.gender = gender;
		this.height = height;
		this.weight = weight;
		this.bloodtype = bloodtype;
		this.allergy = allergy;
	}


	public int getSeq() {
		return seq;
	}


	public void setSeq(int seq) {
		this.seq = seq;
	}


	public int getMem_seq() {
		return mem_seq;
	}


	public void setMem_seq(int mem_seq) {
		this.mem_seq = mem_seq;
	}


	public String getBirth() {
		return birth;
	}


	public void setBirth(String birth) {
		this.birth = birth;
	}


	public String getGender() {
		return gender;
	}


	public void setGender(String gender) {
		this.gender = gender;
	}


	public int getHeight() {
		return height;
	}


	public void setHeight(int height) {
		this.height = height;
	}


	public int getWeight() {
		return weight;
	}


	public void setWeight(int weight) {
		this.weight = weight;
	}


	public String getBloodtype() {
		return bloodtype;
	}


	public void setBloodtype(String bloodtype) {
		this.bloodtype = bloodtype;
	}


	public String getAllergy() {
		return allergy;
	}


	public void setAllergy(String allergy) {
		this.allergy = allergy;
	}


	@Override
	public String toString() {
		return "MediHealthBookDto [seq=" + seq + ", mem_seq=" + mem_seq + ", birth=" + birth + ", gender=" + gender
				+ ", height=" + height + ", weight=" + weight + ", bloodtype=" + bloodtype + ", allergy=" + allergy
				+ "]";
	}
	
	
	

}
