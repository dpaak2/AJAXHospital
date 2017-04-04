package com.hospital.web.domain;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Component;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
@Component @Data @Lazy
public class Admin extends Info{
		@Getter@Setter
		private String permission;

		@Override
		public String getGroup() {
			return "Admin";
		}
}
