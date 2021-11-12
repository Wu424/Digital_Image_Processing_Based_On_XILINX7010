//****************************************Copyright (c)***********************************//
//����֧�֣�www.openedv.com
//�Ա����̣�http://openedv.taobao.com 
//��ע΢�Ź���ƽ̨΢�źţ�"����ԭ��"����ѻ�ȡFPGA & STM32���ϡ�
//��Ȩ���У�����ؾ���
//Copyright(C) ����ԭ�� 2018-2028
//All rights reserved
//----------------------------------------------------------------------------------------
// File name:           VIP_matrix_generate_3x3_8bit
// Last modified Date:  2019/7/19 10:55:56
// Last Version:        V1.0
// Descriptions:        VIP_matrix_generate_3x3_8bit
//----------------------------------------------------------------------------------------
// Created by:          ����ԭ��
// Created date:        2019/7/19 10:55:56
// Version:             V1.0
// Descriptions:        The original version
//----------------------------------------------------------------------------------------
//****************************************************************************************//

module  VIP_matrix_generate_3x3_8bit
(
	input				clk,  		
	input				rst_n,				

	//׼��Ҫ���д����ͼ������
	input				per_frame_vsync,
	input				per_frame_href,
	input				per_frame_clken,
	input        [7:0]  per_img_Y,

	//���󻯺��ͼ�����ݺͿ����ź�
	output				matrix_frame_vsync,
	output				matrix_frame_href,
	output				matrix_frame_clken,
	output	reg  [7:0]  matrix_p11, 
	output	reg  [7:0]  matrix_p12,
	output	reg  [7:0]  matrix_p13,
	output	reg	 [7:0]  matrix_p21, 
	output	reg  [7:0]  matrix_p22, 
	output	reg  [7:0]  matrix_p23,
	output	reg	 [7:0]  matrix_p31, 
	output	reg  [7:0]  matrix_p32, 
	output	reg  [7:0]  matrix_p33
);

//wire define
wire  [7:0]  row1_data;        //��һ������
wire  [7:0]  row2_data;        //�ڶ�������
wire	     read_frame_href ;
wire	     read_frame_clken;

//reg define
reg  [7:0]  row3_data;         //���������ݣ�����ǰ���ڽ��ܵ�����
reg  [1:0]  per_frame_vsync_r;
reg  [1:0]  per_frame_href_r;
reg  [1:0]  per_frame_clken_r;

//*****************************************************
//**                    main code
//*****************************************************

assign	read_frame_href    = per_frame_href_r[0] ;
assign	read_frame_clken   = per_frame_clken_r[0];
assign	matrix_frame_vsync = per_frame_vsync_r[1];
assign	matrix_frame_href  = per_frame_href_r[1] ;
assign	matrix_frame_clken = per_frame_clken_r[1];

//��ǰ���ݷ��ڵ�3��
always@(posedge clk or negedge rst_n) begin
	if(!rst_n)
		row3_data <= 0;
	else begin		
		if(per_frame_clken)
			row3_data <= per_img_Y ;
		else
			row3_data <= row3_data ;
	end
end

//���ڴ洢�����ݵ�RAM
line_shift_RAM_8bit  u_Line_Shift_RAM_8Bit
(
	.clock		    (clk),
	.clken		    (per_frame_clken),
	.per_frame_href (per_frame_href),

	.shiftin	    (per_img_Y),   //��ǰ�е�����
	.taps0x		    (row2_data),   //ǰһ�е�����
	.taps1x		    (row1_data)    //ǰǰһ�е�����
);

//��ͬ���ź��ӳ����ģ�����ͬ��������
always@(posedge clk or negedge rst_n) begin
	if(!rst_n) begin		
		per_frame_vsync_r <= 0;
		per_frame_href_r  <= 0;
		per_frame_clken_r <= 0;
	end
	else begin		
		per_frame_vsync_r <= { per_frame_vsync_r[0], per_frame_vsync };
		per_frame_href_r  <= { per_frame_href_r[0],  per_frame_href  };
		per_frame_clken_r <= { per_frame_clken_r[0], per_frame_clken };
	end
end

//��ͬ�������Ŀ����ź��£����ͼ�����
always@(posedge clk or negedge rst_n) begin
	if(!rst_n) begin		
		{matrix_p11, matrix_p12, matrix_p13} <= 24'h0;
		{matrix_p21, matrix_p22, matrix_p23} <= 24'h0;
		{matrix_p31, matrix_p32, matrix_p33} <= 24'h0;
	end
	else if(read_frame_href) begin
		if(read_frame_clken) begin			
			{matrix_p11, matrix_p12, matrix_p13} <= {matrix_p12, matrix_p13, row1_data};
			{matrix_p21, matrix_p22, matrix_p23} <= {matrix_p22, matrix_p23, row2_data};
			{matrix_p31, matrix_p32, matrix_p33} <= {matrix_p32, matrix_p33, row3_data};
		end
		else begin			
			{matrix_p11, matrix_p12, matrix_p13} <= {matrix_p11, matrix_p12, matrix_p13};
			{matrix_p21, matrix_p22, matrix_p23} <= {matrix_p21, matrix_p22, matrix_p23};
			{matrix_p31, matrix_p32, matrix_p33} <= {matrix_p31, matrix_p32, matrix_p33};
		end	
	end
	else begin		
		{matrix_p11, matrix_p12, matrix_p13} <= 24'h0;
		{matrix_p21, matrix_p22, matrix_p23} <= 24'h0;
		{matrix_p31, matrix_p32, matrix_p33} <= 24'h0;
	end
end

endmodule
