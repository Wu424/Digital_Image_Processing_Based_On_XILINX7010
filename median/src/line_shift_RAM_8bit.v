//****************************************Copyright (c)***********************************//
//����֧�֣�www.openedv.com
//�Ա����̣�http://openedv.taobao.com 
//��ע΢�Ź���ƽ̨΢�źţ�"����ԭ��"����ѻ�ȡFPGA & STM32���ϡ�
//��Ȩ���У�����ؾ���
//Copyright(C) ����ԭ�� 2018-2028
//All rights reserved
//----------------------------------------------------------------------------------------
// File name:           line_shift_RAM_8bit
// Last modified Date:  2019/7/19 10:55:56
// Last Version:        V1.0
// Descriptions:        line_shift_RAM_8bit
//----------------------------------------------------------------------------------------
// Created by:          ����ԭ��
// Created date:        2019/7/19 10:55:56
// Version:             V1.0
// Descriptions:        The original version
//		����α˫�˿�RAM���ڴ洢 �����е����ݡ�
//		����һ�е����ݵ���ʱ�����ӳٴ��ĵ�ʱ���£�
//		�Ƚ�RAM�еľ�һ�����ݶ������ٽ���һ������д�뵽RAM��
//----------------------------------------------------------------------------------------
//****************************************************************************************//

module line_shift_RAM_8bit(
	input clock,

	input          clken,
	input          per_frame_href,
	
	input   [7:0]  shiftin,  //��ǰ�е�����
	output  [7:0]  taps0x,   //ǰһ�е�����
	output  [7:0]  taps1x    //ǰǰһ�е�����
);

//reg define
reg  [2:0]  clken_dly;
reg  [9:0]  ram_rd_addr;
reg  [9:0]  ram_rd_addr_d0;
reg  [9:0]  ram_rd_addr_d1;
reg  [7:0]  shiftin_d0;
reg  [7:0]  shiftin_d1;
reg  [7:0]  shiftin_d2;
reg  [7:0]  taps0x_d0;

//*****************************************************
//**                    main code
//*****************************************************

//�����ݵ���ʱ��RAM�Ķ���ַ�ۼ�
always@(posedge clock)begin
	if(per_frame_href)
		if(clken)
			ram_rd_addr <= ram_rd_addr + 1 ;
		else
			ram_rd_addr <= ram_rd_addr ;
	else
		ram_rd_addr <= 0 ;
end

//��ʱ���ӳ�3��
always@(posedge clock) begin
	clken_dly <= { clken_dly[1:0] , clken };
end

//��RAM��ַ�ӳ�2��
always@(posedge clock ) begin
	ram_rd_addr_d0 <= ram_rd_addr;
	ram_rd_addr_d1 <= ram_rd_addr_d0;
end

//���������ӳ�3������RAM
always@(posedge clock)begin
	shiftin_d0 <= shiftin;
	shiftin_d1 <= shiftin_d0;
	shiftin_d2 <= shiftin_d1;
end

//���ڴ洢ǰһ��ͼ���RAM
blk_mem_gen_0  u_ram_1024x8_0(
  .clka   (clock),
  .wea    (clken_dly[2]),
  .addra  (ram_rd_addr_d1),     //���ӳٵĵ�����ʱ�����ڣ���ǰ�е�����д��RAM0
  .dina   (shiftin_d2),
  
  .clkb   (clock),
  .addrb  (ram_rd_addr),    
  .doutb  (taps0x)              //�ӳ�һ��ʱ�����ڣ����RAM0��ǰһ��ͼ�������
);

//�Ĵ�ǰһ��ͼ�������
always@(posedge clock)begin
	taps0x_d0  <= taps0x;
end

//���ڴ洢ǰǰһ��ͼ���RAM
blk_mem_gen_0  u_ram_1024x8_1(
	.clka   (clock),
	.wea    (clken_dly[1]),
	.addra  (ram_rd_addr_d0),
	.dina   (taps0x_d0),       //���ӳٵĵڶ���ʱ�����ڣ���ǰһ��ͼ�������д��RAM1

	.clkb   (clock),
	.addrb  (ram_rd_addr),
	.doutb  (taps1x)           //�ӳ�һ��ʱ�����ڣ����RAM1��ǰǰһ��ͼ�������
);

endmodule
