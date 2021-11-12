module Video_Image_Processor(
    input         clk,    //cmos ����ʱ��
    input         rst_n,  
    
    //Ԥ����ͼ��
    input         pre_image_vsync, //Ԥ����ͼ��ͬ���ź�
    input         pre_image_clken, //Ԥ����ͼ��ʱ��ʹ���ź�
    input         pre_data_valid,  //Ԥ����ͼ��������Ч�ź�
    input [23:0]  pre_image_data,  //Ԥ����ͼ������
        
    //�����ͼ��
    output        pos_image_vsync, //�����ͼ��ͬ���ź�
    output        pos_image_clken, //�����ͼ��ʱ��ʹ���ź�  
    output        pos_data_valid, //�����ͼ��������Ч�ź�
    output [23:0] pos_image_data  //�����ͼ������

);

//wire define 
wire [7:0] gray_data ;
wire       ycbcb_vsync;
wire       ycbcbr_clken;
wire       ycbcr_valid;

//*****************************************************
//**                    main code
//*****************************************************
//rgbתycbcrģ��
rgb2ycbcr  u_rgb2ycbcr(
	.clk          (clk),
	.rst_n        (rst_n),
	              
	.rgb_vsync    (pre_image_vsync),
	.rgb_clken    (pre_image_clken),
	.rgb_valid    (pre_data_valid),
	.rgb_data     (pre_image_data),
	              
	              
	.ycbcb_vsync  (ycbcb_vsync),
	.ycbcbr_clken (ycbcbr_clken),
	.ycbcr_valid  (ycbcr_valid),
	.gray_data    (gray_data)
);

//��ֵ�˲�ģ��
gray_median_filter  u_gray_median_filter(
    .clk             (clk),  
    .rst_n          (rst_n),

//Ԥ����ͼ��
    .pre_gray_vsync (ycbcb_vsync),
    .pe_gray_valid  (ycbcr_valid),
    .pe_gray_clken  (ycbcbr_clken),
    .pre_gray_data (gray_data),

//�����ͼ��
    .pos_gray_vsync (pos_image_vsync),
    .pos_gray_valid (pos_data_valid),
    .pos_gray_clken (pos_image_clken),
    .pos_pixel_data (pos_image_data)
);

endmodule 