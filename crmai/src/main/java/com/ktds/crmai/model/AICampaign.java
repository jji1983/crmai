package com.ktds.crmai.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
public class AICampaign {
	@Getter @Setter private Integer rnum;
	@Getter @Setter private Integer pageSt;
	@Getter @Setter private Integer pageEnd;
	
	@Getter @Setter private Integer camId;
	@Getter @Setter private String admId;
	@Getter @Setter private String camName;
	@Getter @Setter private String camDesc;
	@Getter @Setter private Integer camItype;
	@Getter @Setter private String camIfileName;
	@Getter @Setter private Integer camOtype;
	@Getter @Setter private String camOfileName;
	@Getter @Setter private String camCdate;
	@Getter @Setter private String camIdate;
	@Getter @Setter private String camType;
	@Getter @Setter private String camStatus;
	@Getter @Setter private String camMsg;
	@Getter @Setter private Integer camIcNum;
	@Getter @Setter private String camAutoYn;
}
