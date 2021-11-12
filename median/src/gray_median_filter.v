module gray_median_filter(
    input        clk,  
    input        rst_n,
    
    //Ԥ����Ҷ�����
    input         pre_gray_vsync,   //Ԥ����Ҷȳ�ͬ��
    input         pe_gray_valid,    //Ԥ����Ҷ�������Ч�ź�
    input         pe_gray_clken,    //Ԥ����Ҷ�ʱ��ʹ���ź�
    input [7:0]   pre_gray_data,    //Ԥ����Ҷ�����
    
    //�����Ҷ�����
    output        pos_gray_vsync,  //�����Ҷȳ�ͬ���ź�
    output        pos_gray_valid,  //�����Ҷ�������Ч�ź�
    output        pos_gray_clken,  //�����Ҷ�ʱ��ʹ���ź�
    output [23:0] pos_pixel_data   //�����Ҷ�����
);

//wire define
wire        matrix_frame_vsync;
wire        matrix_frame_href;
wire        matrix_frame_clken;
wire [7:0]  matrix_p11; //3X3 ��������
wire [7:0]  matrix_p12; 
wire [7:0]  matrix_p13;
wire [7:0]  matrix_p21; 
wire [7:0]  matrix_p22; 
wire [7:0]  matrix_p23;
wire [7:0]  matrix_p31; 
wire [7:0]  matrix_p32; 
wire [7:0]  matrix_p33;
wire [7:0]  mid_value ;
wire [7:0]  pos_img_Y;

//*****************************************************
//**                    main code
//*****************************************************

assign pos_img_Y = pos_gray_valid ? mid_value : 8'd0;
assign pos_pixel_data = {pos_img_Y,pos_img_Y,pos_img_Y};

 VIP_matrix_generate_3x3_8bit u_VIP_matrix_generate_3x3_8bit(
    .clk        (clk), 
    .rst_n      (rst_n),
    
    //Ԥ����Ҷ�����
    .per_frame_vsync    (pre_gray_vsync),
    .per_frame_href     (pe_gray_valid), 
    .per_frame_clken    (pe_gray_clken),
    .per_img_Y          (pre_gray_data),
    
    //���3x3����
    .matrix_frame_vsync (matrix_frame_vsync),
    .matrix_frame_href  (matrix_frame_href),
    .matrix_frame_clken (matrix_frame_clken),
    .matrix_p11         (matrix_p11),    
    .matrix_p12         (matrix_p12),    
    .matrix_p13         (matrix_p13),
    .matrix_p21         (matrix_p21),    
    .matrix_p22         (matrix_p22),    
    .matrix_p23         (matrix_p23),
    .matrix_p31         (matrix_p31),    
    .matrix_p32         (matrix_p32),    
    .matrix_p33         (matrix_p33)
);

//3x3������ֵ��ȡ
median_3x3  u_median_3x3(
    .clk                (clk),
    .rst_n              (rst_n),
    
    .median_frame_vsync (matrix_frame_vsync),
    .median_frame_href  (matrix_frame_href),
    .median_frame_clken (matrix_frame_clken),
    
    //�����һ������
    .data11     (matrix_p11), 
    .data12     (matrix_p12), 
    .data13     (matrix_p13),
    //����ڶ�������
    .data21     (matrix_p21), 
    .data22     (matrix_p22), 
    .data23     (matrix_p23),
    //�������������
    .data31     (matrix_p31), 
    .data32     (matrix_p32), 
    .data33     (matrix_p33),
    
    .pos_frame_vsync (pos_gray_vsync),
    .pos_frame_href  (pos_gray_valid),
    .pos_frame_clken (pos_gray_clken),
    .target_data     (mid_value)
);

endmodule 