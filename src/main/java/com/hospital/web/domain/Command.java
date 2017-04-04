package com.hospital.web.domain;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Component;
@Component
interface Orderable {
	public Command process(Map<?, ?> map);
}
/*brand new lambda*/
@Component @Lazy
public class Command implements Orderable {
	Map<?, ?> map;

	public Command(Map<?, ?> map) {
		this.map = map;
	}

	public Integer[] getPageInfo() {
		Pagination page = new Pagination();
		String pageNO = (String) map.get("pageNO");
		String count = (String) map.get("count");
		page.setBlockSize(5);
		page.setRowCount(5);
		page.setCount(Integer.parseInt(count));
		page.setPageNO(pageNO);
		page.setPageStart();
		page.setPageEnd();
		page.setPageCount();
		page.setBlockCount();
		page.setBlockStart();
		page.setPrevBlock();
		page.setNextBlock();
		page.setBlockEnd();
		return page.getAttribute();
	}

	/* command pattern */
	public Person<? extends Info> getPersonInfo() {
		Person<?> person = null;
		/* set- write , get-read */
		switch (map.get("type").toString()) {
		case "patient":
			person = new Person<Info>(new Patient());
			Patient patient = (Patient) person.getInfo();
			patient.setId(map.get("id").toString());
			patient.setName(map.get("name").toString());
			patient.setAddr(map.get("addr").toString());
			patient.setJob(map.get("job").toString());
			patient.setJumin(map.get("jumin").toString());
			patient.setEmail(map.get("email").toString());
			patient.setPass(map.get("pass").toString());
			patient.setPhone(map.get("phone").toString());
			break;
		case "doctor":
			person = new Person<Info>(new Doctor());
			Doctor doctor = (Doctor) person.getInfo(); /*command pattern*/
			doctor.setId(map.get("id").toString());
			doctor.setName(map.get("name").toString());
			doctor.setMajorTreat(map.get("majorTreat").toString());
			doctor.setPosition(map.get("position").toString());
			doctor.setEmail(map.get("email").toString());
			doctor.setPass(map.get("pass").toString());
			doctor.setPhone(map.get("phone").toString());
			break;
		case "Nurse":
			person = new Person<Info>(new Nurse());
			Nurse nurse = (Nurse) person.getInfo();
			nurse.setId(map.get("id").toString());
			nurse.setName(map.get("name").toString());
			nurse.setMajor(map.get("major").toString());
			nurse.setPosition(map.get("position").toString());
			nurse.setEmail(map.get("email").toString());
			nurse.setPass(map.get("pass").toString());
			nurse.setPhone(map.get("phone").toString());
			break;
		case "admin":
			person = new Person<Info>(new Admin());
			Admin admin = (Admin) person.getInfo();
			break;


		}
		return person; /* person에서 갈라쳐진 상태 */
	}

	@Override
	public Command process(Map<?, ?> map) {/* hook 데이터 값을 걸어서 다른 클래스로 넘긴다 */
		return new Command(map);
	}

	class Pagination {
		private int rowCount, pageNO, pageStart, pageEnd, count, pageCount, blockSize, blockCount, blockStart,
				prevBlock, nextBlock, blockEnd;

		public void setPageCount() {
			if (count % rowCount == 0) {
				pageCount = count / rowCount;
			} else {
				pageCount = count / rowCount + 1;
			}
		}

		public void setRowCount(int rowCount) {
			this.rowCount = rowCount;

		}

		public void setPageNO(String pageNO) {
			this.pageNO = Integer.parseInt(pageNO);
		}

		public void setPageStart() {
			this.pageStart = (pageNO - 1) * rowCount + 1;
		}

		public void setPageEnd() {
			this.pageEnd = pageNO * rowCount;
		}

		public void setCount(int count) {
			this.count = count;
		}

		public void setBlockSize(int blockSize) {
			this.blockSize = blockSize;
		}

		public void setBlockCount() {
			this.blockCount = pageCount / blockSize;
		}

		public void setBlockStart() {
			this.blockStart = pageNO - ((pageNO - 1) % blockSize);
		}

		public void setPrevBlock() {
			this.prevBlock = blockStart - blockSize;
		}

		public void setNextBlock() {
			this.nextBlock = pageStart + blockSize;
		}

		public void setBlockEnd() {
			if ((blockStart + rowCount - 1) < pageCount) {
				blockEnd = blockStart + blockSize - 1;
			} else {
				blockEnd = pageCount;
			}
		}

		public Integer[] getAttribute() {
			Integer[] arr = { count, pageCount, pageNO, pageStart, pageEnd, blockStart, blockEnd, prevBlock,
					nextBlock };
			return arr;
		}
	}

}
