module Video_Image_Processor(
    input         clk,    //cmos 像素时钟
    input         rst_n,  
    
    //预处理图像
    input         pre_image_vsync, //预处理图像场同步信号
    input         pre_image_clken, //预处理图像时钟使能信号
    input         pre_data_valid,  //预处理图像数据有效信号
    input [23:0]  pre_image_data,  //预处理图像数据
        
    //处理后图像
    output        pos_image_vsync, //处理后图像场同步信号
    output        pos_image_clken, //处理后图像时钟使能信号  
    output        pos_data_valid, //处理后图像数据有效信号
    output [23:0] pos_image_data  //处理后图像数据

);

//wire define 
wire [7:0] gray_data ;
wire       ycbcb_vsync;
wire       ycbcbr_clken;
wire       ycbcr_valid;

//*****************************************************
//**                    main code
//*****************************************************
//rgb转ycbcr模块
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

//中值滤波模块
gray_median_filter  u_gray_median_filter(
    .clk             (clk),  
    .rst_n          (rst_n),

//预处理图像
    .pre_gray_vsync (ycbcb_vsync),
    .pe_gray_valid  (ycbcr_valid),
    .pe_gray_clken  (ycbcbr_clken),
    .pre_gray_data (gray_data),

//处理后图像
    .pos_gray_vsync (pos_image_vsync),
    .pos_gray_valid (pos_data_valid),
    .pos_gray_clken (pos_image_clken),
    .pos_pixel_data (pos_image_data)
);

endmodule 