   
    parameter PROC_NUM = 26;
    parameter ST_IDLE = 2'b0;
    parameter ST_DL_DETECTED = 2'b1;
    parameter ST_DL_REPORT = 2'b10;
   

    reg find_df_deadlock = 0;
    reg [1:0] CS_fsm;
    reg [1:0] NS_fsm;
    reg [PROC_NUM - 1:0] dl_detect_reg;
    reg [PROC_NUM - 1:0] dl_done_reg;
    reg [PROC_NUM - 1:0] origin_reg;
    reg [PROC_NUM - 1:0] dl_in_vec_reg;
    integer i;
    integer fp;

    // FSM State machine
    always @ (negedge reset or posedge clock) begin
        if (~reset) begin
            CS_fsm <= ST_IDLE;
        end
        else begin
            CS_fsm <= NS_fsm;
        end
    end
    always @ (CS_fsm or dl_in_vec or dl_detect_reg or dl_done_reg or dl_in_vec or origin_reg) begin
        NS_fsm = CS_fsm;
        case (CS_fsm)
            ST_IDLE : begin
                if (|dl_in_vec) begin
                    NS_fsm = ST_DL_DETECTED;
                end
            end
            ST_DL_DETECTED: begin
                // has unreported deadlock cycle
                if (dl_detect_reg != dl_done_reg) begin
                    NS_fsm = ST_DL_REPORT;
                end
            end
            ST_DL_REPORT: begin
                if (|(dl_in_vec & origin_reg)) begin
                    NS_fsm = ST_DL_DETECTED;
                end
            end
        endcase
    end

    // dl_detect_reg record the procs that first detect deadlock
    always @ (negedge reset or posedge clock) begin
        if (~reset) begin
            dl_detect_reg <= 'b0;
        end
        else begin
            if (CS_fsm == ST_IDLE) begin
                dl_detect_reg <= dl_in_vec;
            end
        end
    end

    // dl_detect_out keeps in high after deadlock detected
    assign dl_detect_out = |dl_detect_reg;

    // dl_done_reg record the cycles has been reported
    always @ (negedge reset or posedge clock) begin
        if (~reset) begin
            dl_done_reg <= 'b0;
        end
        else begin
            if ((CS_fsm == ST_DL_REPORT) && (|(dl_in_vec & dl_detect_reg) == 'b1)) begin
                dl_done_reg <= dl_done_reg | dl_in_vec;
            end
        end
    end

    // clear token once a cycle is done
    assign token_clear = (CS_fsm == ST_DL_REPORT) ? ((|(dl_in_vec & origin_reg)) ? 'b1 : 'b0) : 'b0;

    // origin_reg record the current cycle start id
    always @ (negedge reset or posedge clock) begin
        if (~reset) begin
            origin_reg <= 'b0;
        end
        else begin
            if (CS_fsm == ST_DL_DETECTED) begin
                origin_reg <= origin;
            end
        end
    end
   
    // origin will be valid for only one cycle
    always @ (CS_fsm or dl_detect_reg or dl_done_reg) begin
        if (CS_fsm == ST_DL_DETECTED) begin
            for (i = 0; i < PROC_NUM; i = i + 1) begin
                if (dl_detect_reg[i] & ~dl_done_reg[i] & ~(|origin)) begin
                    origin = 'b1 << i;
                end
            end
        end
        else begin
            origin = 'b0;
        end
    end
    
    // dl_in_vec_reg record the current cycle dl_in_vec
    always @ (negedge reset or posedge clock) begin
        if (~reset) begin
            dl_in_vec_reg <= 'b0;
        end
        else begin
            if (CS_fsm == ST_DL_DETECTED) begin
                dl_in_vec_reg <= origin;
            end
            else if (CS_fsm == ST_DL_REPORT) begin
                dl_in_vec_reg <= dl_in_vec;
            end
        end
    end
    
    // get the first valid proc index in dl vector
    function integer proc_index(input [PROC_NUM - 1:0] dl_vec);
        begin
            proc_index = 0;
            for (i = 0; i < PROC_NUM; i = i + 1) begin
                if (dl_vec[i]) begin
                    proc_index = i;
                end
            end
        end
    endfunction

    // get the proc path based on dl vector
    function [1920:0] proc_path(input [PROC_NUM - 1:0] dl_vec);
        integer index;
        begin
            index = proc_index(dl_vec);
            case (index)
                0 : begin
                    proc_path = "canny_accel_canny_accel.Block_split11_proc72_U0";
                end
                1 : begin
                    proc_path = "canny_accel_canny_accel.Array2xfMat_64_0_800_1280_8_2_U0";
                end
                2 : begin
                    proc_path = "canny_accel_canny_accel.Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.Axi2AxiStream_U0";
                end
                3 : begin
                    proc_path = "canny_accel_canny_accel.Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.AxiStream2Mat_U0";
                end
                4 : begin
                    proc_path = "canny_accel_canny_accel.Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.AxiStream2Mat_U0.cols_npc_aligned47_U0";
                end
                5 : begin
                    proc_path = "canny_accel_canny_accel.Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.AxiStream2Mat_U0.last_blk_pxl_width_1_U0";
                end
                6 : begin
                    proc_path = "canny_accel_canny_accel.Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.AxiStream2Mat_U0.AxiStream2MatStream_2_U0";
                end
                7 : begin
                    proc_path = "canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0";
                end
                8 : begin
                    proc_path = "canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_entry53_U0";
                end
                9 : begin
                    proc_path = "canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFAverageGaussianMask3x3_0_0_800_1280_0_8_2_2_24_160_U0";
                end
                10 : begin
                    proc_path = "canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFSobel_0_3_800_1280_0_4_8_2_2_2_24_32_3_false_U0";
                end
                11 : begin
                    proc_path = "canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFDuplicate_rows_3_800_1280_4_8_2_2_2_2_2_2_32_160_U0";
                end
                12 : begin
                    proc_path = "canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_Block_split26_proc_U0";
                end
                13 : begin
                    proc_path = "canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFMagnitudeKernel_3_3_800_1280_4_4_8_2_2_2_32_32_160_U0";
                end
                14 : begin
                    proc_path = "canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFAngleKernel_3_0_800_1280_4_0_8_2_2_32_24_160_480_U0";
                end
                15 : begin
                    proc_path = "canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFSuppression3x3_3_0_11_800_1280_4_0_13_8_2_32_24_6_160_480_2_U0";
                end
                16 : begin
                    proc_path = "canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFPackNMS_11_11_800_1280_13_13_8_32_2_2_6_24_U0";
                end
                17 : begin
                    proc_path = "canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0";
                end
                18 : begin
                    proc_path = "canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2Axi_entry67_U0";
                end
                19 : begin
                    proc_path = "canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.addrbound_U0";
                end
                20 : begin
                    proc_path = "canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2Axi_Block_split13_proc_U0";
                end
                21 : begin
                    proc_path = "canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2AxiStream_U0";
                end
                22 : begin
                    proc_path = "canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2AxiStream_U0.cols_npc_aligned63_U0";
                end
                23 : begin
                    proc_path = "canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2AxiStream_U0.last_blk_pxl_width_U0";
                end
                24 : begin
                    proc_path = "canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2AxiStream_U0.MatStream2AxiStream_2_U0";
                end
                25 : begin
                    proc_path = "canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.AxiStream2Axi_U0";
                end
                default : begin
                    proc_path = "unknown";
                end
            endcase
        end
    endfunction

    // print the headlines of deadlock detection
    task print_dl_head;
        begin
            $display("\n//////////////////////////////////////////////////////////////////////////////");
            $display("// ERROR!!! DEADLOCK DETECTED at %0t ns! SIMULATION WILL BE STOPPED! //", $time);
            $display("//////////////////////////////////////////////////////////////////////////////");
            fp = $fopen("deadlock_db.dat", "w");
        end
    endtask

    // print the start of a cycle
    task print_cycle_start(input reg [1920:0] proc_path, input integer cycle_id);
        begin
            $display("/////////////////////////");
            $display("// Dependence cycle %0d:", cycle_id);
            $display("// (1): Process: %0s", proc_path);
            $fdisplay(fp, "Dependence_Cycle_ID %0d", cycle_id);
            $fdisplay(fp, "Dependence_Process_ID 1");
            $fdisplay(fp, "Dependence_Process_path %0s", proc_path);
        end
    endtask

    // print the end of deadlock detection
    task print_dl_end(input integer num, input integer record_time);
        begin
            $display("////////////////////////////////////////////////////////////////////////");
            $display("// Totally %0d cycles detected!", num);
            $display("////////////////////////////////////////////////////////////////////////");
            $display("// ERROR!!! DEADLOCK DETECTED at %0t ns! SIMULATION WILL BE STOPPED! //", record_time);
            $display("//////////////////////////////////////////////////////////////////////////////");
            $fdisplay(fp, "Dependence_Cycle_Number %0d", num);
            $fclose(fp);
        end
    endtask

    // print one proc component in the cycle
    task print_cycle_proc_comp(input reg [1920:0] proc_path, input integer cycle_comp_id);
        begin
            $display("// (%0d): Process: %0s", cycle_comp_id, proc_path);
            $fdisplay(fp, "Dependence_Process_ID %0d", cycle_comp_id);
            $fdisplay(fp, "Dependence_Process_path %0s", proc_path);
        end
    endtask

    // print one channel component in the cycle
    task print_cycle_chan_comp(input [PROC_NUM - 1:0] dl_vec1, input [PROC_NUM - 1:0] dl_vec2);
        reg [1864:0] chan_path;
        integer index1;
        integer index2;
        begin
            index1 = proc_index(dl_vec1);
            index2 = proc_index(dl_vec2);
            case (index1)
                0 : begin
                    case(index2)
                    1: begin
                        if (~Block_split11_proc72_U0.in_mat_rows_out_blk_n) begin
                            if (~in_mat_rows_c_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'canny_accel_canny_accel.in_mat_rows_c_U' written by process 'canny_accel_canny_accel.Array2xfMat_64_0_800_1280_8_2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.in_mat_rows_c_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~in_mat_rows_c_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'canny_accel_canny_accel.in_mat_rows_c_U' read by process 'canny_accel_canny_accel.Array2xfMat_64_0_800_1280_8_2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.in_mat_rows_c_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                        if (~Block_split11_proc72_U0.in_mat_cols_out_blk_n) begin
                            if (~in_mat_cols_c_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'canny_accel_canny_accel.in_mat_cols_c_U' written by process 'canny_accel_canny_accel.Array2xfMat_64_0_800_1280_8_2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.in_mat_cols_c_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~in_mat_cols_c_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'canny_accel_canny_accel.in_mat_cols_c_U' read by process 'canny_accel_canny_accel.Array2xfMat_64_0_800_1280_8_2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.in_mat_cols_c_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                        if (~Block_split11_proc72_U0.img_inp_out_blk_n) begin
                            if (~img_inp_c_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'canny_accel_canny_accel.img_inp_c_U' written by process 'canny_accel_canny_accel.Array2xfMat_64_0_800_1280_8_2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.img_inp_c_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~img_inp_c_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'canny_accel_canny_accel.img_inp_c_U' read by process 'canny_accel_canny_accel.Array2xfMat_64_0_800_1280_8_2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.img_inp_c_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                        if (ap_sync_Block_split11_proc72_U0_ap_ready & Block_split11_proc72_U0.ap_idle & ~ap_sync_Array2xfMat_64_0_800_1280_8_2_U0_ap_ready) begin
                            $display("//      Blocked by input sync logic with process : 'canny_accel_canny_accel.Array2xfMat_64_0_800_1280_8_2_U0'");
                        end
                    end
                    17: begin
                        if (~Block_split11_proc72_U0.dst_mat_rows_out_blk_n) begin
                            if (~dst_mat_rows_c_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'canny_accel_canny_accel.dst_mat_rows_c_U' written by process 'canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.dst_mat_rows_c_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~dst_mat_rows_c_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'canny_accel_canny_accel.dst_mat_rows_c_U' read by process 'canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.dst_mat_rows_c_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                        if (~Block_split11_proc72_U0.dst_mat_cols_out_blk_n) begin
                            if (~dst_mat_cols_c_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'canny_accel_canny_accel.dst_mat_cols_c_U' written by process 'canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.dst_mat_cols_c_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~dst_mat_cols_c_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'canny_accel_canny_accel.dst_mat_cols_c_U' read by process 'canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.dst_mat_cols_c_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                        if (~Block_split11_proc72_U0.img_out_out_blk_n) begin
                            if (~img_out_c_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'canny_accel_canny_accel.img_out_c_U' written by process 'canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.img_out_c_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~img_out_c_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'canny_accel_canny_accel.img_out_c_U' read by process 'canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.img_out_c_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                        if (~start_for_xfMat2Array_64_11_800_1280_32_2_1_U0_U.if_full_n & Block_split11_proc72_U0.ap_start & ~Block_split11_proc72_U0.real_start & (trans_in_cnt_2 == trans_out_cnt_2) & ~start_for_xfMat2Array_64_11_800_1280_32_2_1_U0_U.if_read) begin
                            $display("//      Blocked by full output start propagation FIFO 'canny_accel_canny_accel.start_for_xfMat2Array_64_11_800_1280_32_2_1_U0_U' read by process 'canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0',");
                        end
                    end
                    7: begin
                        if (~Block_split11_proc72_U0.low_threshold_out_blk_n) begin
                            if (~low_threshold_c_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'canny_accel_canny_accel.low_threshold_c_U' written by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.low_threshold_c_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~low_threshold_c_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'canny_accel_canny_accel.low_threshold_c_U' read by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.low_threshold_c_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                        if (~Block_split11_proc72_U0.high_threshold_out_blk_n) begin
                            if (~high_threshold_c_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'canny_accel_canny_accel.high_threshold_c_U' written by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.high_threshold_c_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~high_threshold_c_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'canny_accel_canny_accel.high_threshold_c_U' read by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.high_threshold_c_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                        if (~start_for_Canny_3_0_0_11_800_1280_8_32_false_2_2_U0_U.if_full_n & Block_split11_proc72_U0.ap_start & ~Block_split11_proc72_U0.real_start & (trans_in_cnt_2 == trans_out_cnt_2) & ~start_for_Canny_3_0_0_11_800_1280_8_32_false_2_2_U0_U.if_read) begin
                            $display("//      Blocked by full output start propagation FIFO 'canny_accel_canny_accel.start_for_Canny_3_0_0_11_800_1280_8_32_false_2_2_U0_U' read by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0',");
                        end
                    end
                    endcase
                end
                1 : begin
                    case(index2)
                    7: begin
                        if (~Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.AxiStream2Mat_U0.AxiStream2MatStream_2_U0.in_mat_421_blk_n) begin
                            if (~in_mat_data_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'canny_accel_canny_accel.in_mat_data_U' written by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.in_mat_data_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~in_mat_data_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'canny_accel_canny_accel.in_mat_data_U' read by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.in_mat_data_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                        if (~Array2xfMat_64_0_800_1280_8_2_U0.dstMat_rows_out_blk_n) begin
                            if (~in_mat_rows_c20_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'canny_accel_canny_accel.in_mat_rows_c20_U' written by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.in_mat_rows_c20_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~in_mat_rows_c20_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'canny_accel_canny_accel.in_mat_rows_c20_U' read by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.in_mat_rows_c20_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                        if (~Array2xfMat_64_0_800_1280_8_2_U0.dstMat_cols_out_blk_n) begin
                            if (~in_mat_cols_c21_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'canny_accel_canny_accel.in_mat_cols_c21_U' written by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.in_mat_cols_c21_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~in_mat_cols_c21_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'canny_accel_canny_accel.in_mat_cols_c21_U' read by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.in_mat_cols_c21_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                    end
                    0: begin
                        if (~Array2xfMat_64_0_800_1280_8_2_U0.srcPtr_blk_n) begin
                            if (~img_inp_c_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'canny_accel_canny_accel.img_inp_c_U' written by process 'canny_accel_canny_accel.Block_split11_proc72_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.img_inp_c_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~img_inp_c_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'canny_accel_canny_accel.img_inp_c_U' read by process 'canny_accel_canny_accel.Block_split11_proc72_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.img_inp_c_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                        if (~Array2xfMat_64_0_800_1280_8_2_U0.dstMat_rows_blk_n) begin
                            if (~in_mat_rows_c_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'canny_accel_canny_accel.in_mat_rows_c_U' written by process 'canny_accel_canny_accel.Block_split11_proc72_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.in_mat_rows_c_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~in_mat_rows_c_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'canny_accel_canny_accel.in_mat_rows_c_U' read by process 'canny_accel_canny_accel.Block_split11_proc72_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.in_mat_rows_c_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                        if (~Array2xfMat_64_0_800_1280_8_2_U0.dstMat_cols_blk_n) begin
                            if (~in_mat_cols_c_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'canny_accel_canny_accel.in_mat_cols_c_U' written by process 'canny_accel_canny_accel.Block_split11_proc72_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.in_mat_cols_c_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~in_mat_cols_c_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'canny_accel_canny_accel.in_mat_cols_c_U' read by process 'canny_accel_canny_accel.Block_split11_proc72_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.in_mat_cols_c_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                        if (ap_sync_Array2xfMat_64_0_800_1280_8_2_U0_ap_ready & Array2xfMat_64_0_800_1280_8_2_U0.ap_idle & ~ap_sync_Block_split11_proc72_U0_ap_ready) begin
                            $display("//      Blocked by input sync logic with process : 'canny_accel_canny_accel.Block_split11_proc72_U0'");
                        end
                    end
                    endcase
                end
                2 : begin
                    case(index2)
                    6: begin
                        if (~Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.Axi2AxiStream_U0.ldata_blk_n) begin
                            if (~Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.ldata_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'canny_accel_canny_accel.Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.ldata_U' written by process 'canny_accel_canny_accel.Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.AxiStream2Mat_U0.AxiStream2MatStream_2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.ldata_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.ldata_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'canny_accel_canny_accel.Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.ldata_U' read by process 'canny_accel_canny_accel.Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.AxiStream2Mat_U0.AxiStream2MatStream_2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.ldata_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                    end
                    4: begin
                        if (~Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.Axi2AxiStream_U0.rows_out_blk_n) begin
                            if (~Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.rows_c_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'canny_accel_canny_accel.Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.rows_c_U' written by process 'canny_accel_canny_accel.Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.AxiStream2Mat_U0.cols_npc_aligned47_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.rows_c_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.rows_c_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'canny_accel_canny_accel.Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.rows_c_U' read by process 'canny_accel_canny_accel.Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.AxiStream2Mat_U0.cols_npc_aligned47_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.rows_c_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                        if (~Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.Axi2AxiStream_U0.cols_out_blk_n) begin
                            if (~Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.cols_c_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'canny_accel_canny_accel.Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.cols_c_U' written by process 'canny_accel_canny_accel.Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.AxiStream2Mat_U0.cols_npc_aligned47_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.cols_c_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.cols_c_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'canny_accel_canny_accel.Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.cols_c_U' read by process 'canny_accel_canny_accel.Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.AxiStream2Mat_U0.cols_npc_aligned47_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.cols_c_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                    end
                    3: begin
                        if (~Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.start_for_AxiStream2Mat_U0_U.if_full_n & Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.Axi2AxiStream_U0.ap_start & ~Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.Axi2AxiStream_U0.real_start & (trans_in_cnt_0 == trans_out_cnt_0) & ~Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.start_for_AxiStream2Mat_U0_U.if_read) begin
                            $display("//      Blocked by full output start propagation FIFO 'canny_accel_canny_accel.Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.start_for_AxiStream2Mat_U0_U' read by process 'canny_accel_canny_accel.Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.AxiStream2Mat_U0',");
                        end
                    end
                    endcase
                end
                3 : begin
                    case(index2)
                    2: begin
                        if (~Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.AxiStream2Mat_U0.AxiStream2MatStream_2_U0.ldata1_blk_n) begin
                            if (~Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.ldata_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'canny_accel_canny_accel.Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.ldata_U' written by process 'canny_accel_canny_accel.Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.Axi2AxiStream_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.ldata_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.ldata_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'canny_accel_canny_accel.Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.ldata_U' read by process 'canny_accel_canny_accel.Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.Axi2AxiStream_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.ldata_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                        if (~Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.AxiStream2Mat_U0.cols_npc_aligned47_U0.rows_blk_n) begin
                            if (~Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.rows_c_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'canny_accel_canny_accel.Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.rows_c_U' written by process 'canny_accel_canny_accel.Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.Axi2AxiStream_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.rows_c_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.rows_c_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'canny_accel_canny_accel.Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.rows_c_U' read by process 'canny_accel_canny_accel.Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.Axi2AxiStream_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.rows_c_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                        if (~Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.AxiStream2Mat_U0.cols_npc_aligned47_U0.cols_blk_n) begin
                            if (~Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.cols_c_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'canny_accel_canny_accel.Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.cols_c_U' written by process 'canny_accel_canny_accel.Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.Axi2AxiStream_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.cols_c_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.cols_c_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'canny_accel_canny_accel.Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.cols_c_U' read by process 'canny_accel_canny_accel.Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.Axi2AxiStream_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.cols_c_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                        if (~Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.start_for_AxiStream2Mat_U0_U.if_empty_n & Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.AxiStream2Mat_U0.ap_idle & ~Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.start_for_AxiStream2Mat_U0_U.if_write) begin
                            $display("//      Blocked by missing 'ap_start' from start propagation FIFO 'canny_accel_canny_accel.Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.start_for_AxiStream2Mat_U0_U' written by process 'canny_accel_canny_accel.Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.Axi2AxiStream_U0',");
                        end
                    end
                    endcase
                end
                4 : begin
                    case(index2)
                    2: begin
                        if (~Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.AxiStream2Mat_U0.cols_npc_aligned47_U0.cols_blk_n) begin
                            if (~Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.cols_c_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'canny_accel_canny_accel.Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.cols_c_U' written by process 'canny_accel_canny_accel.Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.Axi2AxiStream_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.cols_c_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.cols_c_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'canny_accel_canny_accel.Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.cols_c_U' read by process 'canny_accel_canny_accel.Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.Axi2AxiStream_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.cols_c_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                        if (~Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.AxiStream2Mat_U0.cols_npc_aligned47_U0.rows_blk_n) begin
                            if (~Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.rows_c_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'canny_accel_canny_accel.Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.rows_c_U' written by process 'canny_accel_canny_accel.Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.Axi2AxiStream_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.rows_c_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.rows_c_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'canny_accel_canny_accel.Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.rows_c_U' read by process 'canny_accel_canny_accel.Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.Axi2AxiStream_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.rows_c_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                    end
                    5: begin
                        if (~Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.AxiStream2Mat_U0.cols_npc_aligned47_U0.cols_out_blk_n) begin
                            if (~Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.AxiStream2Mat_U0.cols_c_i_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'canny_accel_canny_accel.Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.AxiStream2Mat_U0.cols_c_i_U' written by process 'canny_accel_canny_accel.Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.AxiStream2Mat_U0.last_blk_pxl_width_1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.AxiStream2Mat_U0.cols_c_i_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.AxiStream2Mat_U0.cols_c_i_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'canny_accel_canny_accel.Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.AxiStream2Mat_U0.cols_c_i_U' read by process 'canny_accel_canny_accel.Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.AxiStream2Mat_U0.last_blk_pxl_width_1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.AxiStream2Mat_U0.cols_c_i_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                        if (~Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.AxiStream2Mat_U0.cols_npc_aligned47_U0.ret_out_blk_n) begin
                            if (~Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.AxiStream2Mat_U0.p_c_i_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'canny_accel_canny_accel.Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.AxiStream2Mat_U0.p_c_i_U' written by process 'canny_accel_canny_accel.Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.AxiStream2Mat_U0.last_blk_pxl_width_1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.AxiStream2Mat_U0.p_c_i_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.AxiStream2Mat_U0.p_c_i_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'canny_accel_canny_accel.Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.AxiStream2Mat_U0.p_c_i_U' read by process 'canny_accel_canny_accel.Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.AxiStream2Mat_U0.last_blk_pxl_width_1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.AxiStream2Mat_U0.p_c_i_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                        if (~Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.AxiStream2Mat_U0.start_for_last_blk_pxl_width_1_U0_U.if_full_n & Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.AxiStream2Mat_U0.cols_npc_aligned47_U0.ap_start & ~Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.AxiStream2Mat_U0.cols_npc_aligned47_U0.real_start & (trans_in_cnt_1 == trans_out_cnt_1) & ~Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.AxiStream2Mat_U0.start_for_last_blk_pxl_width_1_U0_U.if_read) begin
                            $display("//      Blocked by full output start propagation FIFO 'canny_accel_canny_accel.Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.AxiStream2Mat_U0.start_for_last_blk_pxl_width_1_U0_U' read by process 'canny_accel_canny_accel.Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.AxiStream2Mat_U0.last_blk_pxl_width_1_U0',");
                        end
                    end
                    6: begin
                        if (~Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.AxiStream2Mat_U0.cols_npc_aligned47_U0.rows_out_blk_n) begin
                            if (~Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.AxiStream2Mat_U0.rows_c_i_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'canny_accel_canny_accel.Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.AxiStream2Mat_U0.rows_c_i_U' written by process 'canny_accel_canny_accel.Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.AxiStream2Mat_U0.AxiStream2MatStream_2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.AxiStream2Mat_U0.rows_c_i_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.AxiStream2Mat_U0.rows_c_i_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'canny_accel_canny_accel.Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.AxiStream2Mat_U0.rows_c_i_U' read by process 'canny_accel_canny_accel.Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.AxiStream2Mat_U0.AxiStream2MatStream_2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.AxiStream2Mat_U0.rows_c_i_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                    end
                    endcase
                end
                5 : begin
                    case(index2)
                    4: begin
                        if (~Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.AxiStream2Mat_U0.last_blk_pxl_width_1_U0.cols_blk_n) begin
                            if (~Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.AxiStream2Mat_U0.cols_c_i_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'canny_accel_canny_accel.Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.AxiStream2Mat_U0.cols_c_i_U' written by process 'canny_accel_canny_accel.Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.AxiStream2Mat_U0.cols_npc_aligned47_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.AxiStream2Mat_U0.cols_c_i_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.AxiStream2Mat_U0.cols_c_i_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'canny_accel_canny_accel.Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.AxiStream2Mat_U0.cols_c_i_U' read by process 'canny_accel_canny_accel.Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.AxiStream2Mat_U0.cols_npc_aligned47_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.AxiStream2Mat_U0.cols_c_i_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                        if (~Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.AxiStream2Mat_U0.last_blk_pxl_width_1_U0.cols_bound_per_npc_blk_n) begin
                            if (~Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.AxiStream2Mat_U0.p_c_i_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'canny_accel_canny_accel.Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.AxiStream2Mat_U0.p_c_i_U' written by process 'canny_accel_canny_accel.Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.AxiStream2Mat_U0.cols_npc_aligned47_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.AxiStream2Mat_U0.p_c_i_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.AxiStream2Mat_U0.p_c_i_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'canny_accel_canny_accel.Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.AxiStream2Mat_U0.p_c_i_U' read by process 'canny_accel_canny_accel.Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.AxiStream2Mat_U0.cols_npc_aligned47_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.AxiStream2Mat_U0.p_c_i_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                        if (~Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.AxiStream2Mat_U0.start_for_last_blk_pxl_width_1_U0_U.if_empty_n & Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.AxiStream2Mat_U0.last_blk_pxl_width_1_U0.ap_idle & ~Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.AxiStream2Mat_U0.start_for_last_blk_pxl_width_1_U0_U.if_write) begin
                            $display("//      Blocked by missing 'ap_start' from start propagation FIFO 'canny_accel_canny_accel.Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.AxiStream2Mat_U0.start_for_last_blk_pxl_width_1_U0_U' written by process 'canny_accel_canny_accel.Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.AxiStream2Mat_U0.cols_npc_aligned47_U0',");
                        end
                    end
                    6: begin
                        if (~Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.AxiStream2Mat_U0.last_blk_pxl_width_1_U0.cols_bound_per_npc_out_blk_n) begin
                            if (~Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.AxiStream2Mat_U0.p_c11_i_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'canny_accel_canny_accel.Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.AxiStream2Mat_U0.p_c11_i_U' written by process 'canny_accel_canny_accel.Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.AxiStream2Mat_U0.AxiStream2MatStream_2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.AxiStream2Mat_U0.p_c11_i_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.AxiStream2Mat_U0.p_c11_i_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'canny_accel_canny_accel.Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.AxiStream2Mat_U0.p_c11_i_U' read by process 'canny_accel_canny_accel.Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.AxiStream2Mat_U0.AxiStream2MatStream_2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.AxiStream2Mat_U0.p_c11_i_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                    end
                    endcase
                end
                6 : begin
                    case(index2)
                    2: begin
                        if (~Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.AxiStream2Mat_U0.AxiStream2MatStream_2_U0.ldata1_blk_n) begin
                            if (~Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.ldata_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'canny_accel_canny_accel.Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.ldata_U' written by process 'canny_accel_canny_accel.Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.Axi2AxiStream_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.ldata_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.ldata_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'canny_accel_canny_accel.Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.ldata_U' read by process 'canny_accel_canny_accel.Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.Axi2AxiStream_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.ldata_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                    end
                    4: begin
                        if (~Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.AxiStream2Mat_U0.AxiStream2MatStream_2_U0.rows_blk_n) begin
                            if (~Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.AxiStream2Mat_U0.rows_c_i_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'canny_accel_canny_accel.Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.AxiStream2Mat_U0.rows_c_i_U' written by process 'canny_accel_canny_accel.Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.AxiStream2Mat_U0.cols_npc_aligned47_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.AxiStream2Mat_U0.rows_c_i_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.AxiStream2Mat_U0.rows_c_i_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'canny_accel_canny_accel.Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.AxiStream2Mat_U0.rows_c_i_U' read by process 'canny_accel_canny_accel.Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.AxiStream2Mat_U0.cols_npc_aligned47_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.AxiStream2Mat_U0.rows_c_i_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                    end
                    5: begin
                        if (~Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.AxiStream2Mat_U0.AxiStream2MatStream_2_U0.cols_bound_per_npc_blk_n) begin
                            if (~Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.AxiStream2Mat_U0.p_c11_i_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'canny_accel_canny_accel.Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.AxiStream2Mat_U0.p_c11_i_U' written by process 'canny_accel_canny_accel.Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.AxiStream2Mat_U0.last_blk_pxl_width_1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.AxiStream2Mat_U0.p_c11_i_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.AxiStream2Mat_U0.p_c11_i_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'canny_accel_canny_accel.Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.AxiStream2Mat_U0.p_c11_i_U' read by process 'canny_accel_canny_accel.Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.AxiStream2Mat_U0.last_blk_pxl_width_1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.AxiStream2Mat_U0.p_c11_i_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                        if (~Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.AxiStream2Mat_U0.p_channel_U.if_empty_n & Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.AxiStream2Mat_U0.AxiStream2MatStream_2_U0.ap_idle & ~Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.AxiStream2Mat_U0.p_channel_U.if_write) begin
                            if (~Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.AxiStream2Mat_U0.p_channel_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'canny_accel_canny_accel.Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.AxiStream2Mat_U0.p_channel_U' written by process 'canny_accel_canny_accel.Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.AxiStream2Mat_U0.last_blk_pxl_width_1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.AxiStream2Mat_U0.p_channel_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.AxiStream2Mat_U0.p_channel_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'canny_accel_canny_accel.Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.AxiStream2Mat_U0.p_channel_U' read by process 'canny_accel_canny_accel.Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.AxiStream2Mat_U0.last_blk_pxl_width_1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Array2xfMat_64_0_800_1280_8_2_U0.grp_Axi2Mat_fu_82.AxiStream2Mat_U0.p_channel_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                    end
                    endcase
                end
                7 : begin
                    case(index2)
                    1: begin
                        if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFAverageGaussianMask3x3_0_0_800_1280_0_8_2_2_24_160_U0.in_mat_421_blk_n) begin
                            if (~in_mat_data_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'canny_accel_canny_accel.in_mat_data_U' written by process 'canny_accel_canny_accel.Array2xfMat_64_0_800_1280_8_2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.in_mat_data_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~in_mat_data_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'canny_accel_canny_accel.in_mat_data_U' read by process 'canny_accel_canny_accel.Array2xfMat_64_0_800_1280_8_2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.in_mat_data_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                        if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.in_mat_rows_blk_n) begin
                            if (~in_mat_rows_c20_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'canny_accel_canny_accel.in_mat_rows_c20_U' written by process 'canny_accel_canny_accel.Array2xfMat_64_0_800_1280_8_2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.in_mat_rows_c20_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~in_mat_rows_c20_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'canny_accel_canny_accel.in_mat_rows_c20_U' read by process 'canny_accel_canny_accel.Array2xfMat_64_0_800_1280_8_2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.in_mat_rows_c20_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                        if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.in_mat_cols_blk_n) begin
                            if (~in_mat_cols_c21_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'canny_accel_canny_accel.in_mat_cols_c21_U' written by process 'canny_accel_canny_accel.Array2xfMat_64_0_800_1280_8_2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.in_mat_cols_c21_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~in_mat_cols_c21_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'canny_accel_canny_accel.in_mat_cols_c21_U' read by process 'canny_accel_canny_accel.Array2xfMat_64_0_800_1280_8_2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.in_mat_cols_c21_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                    end
                    17: begin
                        if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFPackNMS_11_11_800_1280_13_13_8_32_2_2_6_24_U0.dst_mat_422_blk_n) begin
                            if (~dst_mat_data_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'canny_accel_canny_accel.dst_mat_data_U' written by process 'canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.dst_mat_data_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~dst_mat_data_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'canny_accel_canny_accel.dst_mat_data_U' read by process 'canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.dst_mat_data_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                    end
                    0: begin
                        if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.low_threshold_blk_n) begin
                            if (~low_threshold_c_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'canny_accel_canny_accel.low_threshold_c_U' written by process 'canny_accel_canny_accel.Block_split11_proc72_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.low_threshold_c_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~low_threshold_c_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'canny_accel_canny_accel.low_threshold_c_U' read by process 'canny_accel_canny_accel.Block_split11_proc72_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.low_threshold_c_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                        if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.high_threshold_blk_n) begin
                            if (~high_threshold_c_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'canny_accel_canny_accel.high_threshold_c_U' written by process 'canny_accel_canny_accel.Block_split11_proc72_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.high_threshold_c_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~high_threshold_c_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'canny_accel_canny_accel.high_threshold_c_U' read by process 'canny_accel_canny_accel.Block_split11_proc72_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.high_threshold_c_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                        if (~start_for_Canny_3_0_0_11_800_1280_8_32_false_2_2_U0_U.if_empty_n & Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.ap_idle & ~start_for_Canny_3_0_0_11_800_1280_8_32_false_2_2_U0_U.if_write) begin
                            $display("//      Blocked by missing 'ap_start' from start propagation FIFO 'canny_accel_canny_accel.start_for_Canny_3_0_0_11_800_1280_8_32_false_2_2_U0_U' written by process 'canny_accel_canny_accel.Block_split11_proc72_U0',");
                        end
                    end
                    endcase
                end
                8 : begin
                    case(index2)
                    15: begin
                        if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_entry53_U0.p_lowthreshold_out_blk_n) begin
                            if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.p_lowthreshold_c_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.p_lowthreshold_c_U' written by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFSuppression3x3_3_0_11_800_1280_4_0_13_8_2_32_24_6_160_480_2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.p_lowthreshold_c_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.p_lowthreshold_c_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.p_lowthreshold_c_U' read by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFSuppression3x3_3_0_11_800_1280_4_0_13_8_2_32_24_6_160_480_2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.p_lowthreshold_c_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                        if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_entry53_U0.p_highthreshold_out_blk_n) begin
                            if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.p_highthreshold_c_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.p_highthreshold_c_U' written by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFSuppression3x3_3_0_11_800_1280_4_0_13_8_2_32_24_6_160_480_2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.p_highthreshold_c_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.p_highthreshold_c_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.p_highthreshold_c_U' read by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFSuppression3x3_3_0_11_800_1280_4_0_13_8_2_32_24_6_160_480_2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.p_highthreshold_c_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                        if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.start_for_xFSuppression3x3_3_0_11_800_1280_4_0_13_8_2_32_24_6_160_480_2_U0_U.if_full_n & Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_entry53_U0.ap_start & ~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_entry53_U0.real_start & (trans_in_cnt_3 == trans_out_cnt_3) & ~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.start_for_xFSuppression3x3_3_0_11_800_1280_4_0_13_8_2_32_24_6_160_480_2_U0_U.if_read) begin
                            $display("//      Blocked by full output start propagation FIFO 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.start_for_xFSuppression3x3_3_0_11_800_1280_4_0_13_8_2_32_24_6_160_480_2_U0_U' read by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFSuppression3x3_3_0_11_800_1280_4_0_13_8_2_32_24_6_160_480_2_U0',");
                        end
                    end
                    9: begin
                        if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_entry53_U0.img_height_out_blk_n) begin
                            if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_height_c_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_height_c_U' written by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFAverageGaussianMask3x3_0_0_800_1280_0_8_2_2_24_160_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_height_c_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_height_c_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_height_c_U' read by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFAverageGaussianMask3x3_0_0_800_1280_0_8_2_2_24_160_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_height_c_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                        if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_entry53_U0.img_width_out_blk_n) begin
                            if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_width_c_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_width_c_U' written by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFAverageGaussianMask3x3_0_0_800_1280_0_8_2_2_24_160_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_width_c_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_width_c_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_width_c_U' read by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFAverageGaussianMask3x3_0_0_800_1280_0_8_2_2_24_160_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_width_c_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                        if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.start_for_xFAverageGaussianMask3x3_0_0_800_1280_0_8_2_2_24_160_U0_U.if_full_n & Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_entry53_U0.ap_start & ~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_entry53_U0.real_start & (trans_in_cnt_3 == trans_out_cnt_3) & ~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.start_for_xFAverageGaussianMask3x3_0_0_800_1280_0_8_2_2_24_160_U0_U.if_read) begin
                            $display("//      Blocked by full output start propagation FIFO 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.start_for_xFAverageGaussianMask3x3_0_0_800_1280_0_8_2_2_24_160_U0_U' read by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFAverageGaussianMask3x3_0_0_800_1280_0_8_2_2_24_160_U0',");
                        end
                    end
                    12: begin
                        if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_entry53_U0.img_height_out1_blk_n) begin
                            if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_height_c20_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_height_c20_U' written by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_Block_split26_proc_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_height_c20_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_height_c20_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_height_c20_U' read by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_Block_split26_proc_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_height_c20_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                        if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_entry53_U0.img_width_out2_blk_n) begin
                            if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_width_c21_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_width_c21_U' written by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_Block_split26_proc_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_width_c21_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_width_c21_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_width_c21_U' read by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_Block_split26_proc_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_width_c21_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                        if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.start_for_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_falsebkb_U.if_full_n & Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_entry53_U0.ap_start & ~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_entry53_U0.real_start & (trans_in_cnt_3 == trans_out_cnt_3) & ~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.start_for_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_falsebkb_U.if_read) begin
                            $display("//      Blocked by full output start propagation FIFO 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.start_for_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_falsebkb_U' read by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_Block_split26_proc_U0',");
                        end
                    end
                    endcase
                end
                9 : begin
                    case(index2)
                    10: begin
                        if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFAverageGaussianMask3x3_0_0_800_1280_0_8_2_2_24_160_U0.gaussian_mat_41_blk_n) begin
                            if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.gaussian_mat_data_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.gaussian_mat_data_U' written by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFSobel_0_3_800_1280_0_4_8_2_2_2_24_32_3_false_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.gaussian_mat_data_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.gaussian_mat_data_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.gaussian_mat_data_U' read by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFSobel_0_3_800_1280_0_4_8_2_2_2_24_32_3_false_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.gaussian_mat_data_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                        if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFAverageGaussianMask3x3_0_0_800_1280_0_8_2_2_24_160_U0.img_height_out_blk_n) begin
                            if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_height_c22_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_height_c22_U' written by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFSobel_0_3_800_1280_0_4_8_2_2_2_24_32_3_false_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_height_c22_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_height_c22_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_height_c22_U' read by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFSobel_0_3_800_1280_0_4_8_2_2_2_24_32_3_false_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_height_c22_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                        if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFAverageGaussianMask3x3_0_0_800_1280_0_8_2_2_24_160_U0.img_width_out_blk_n) begin
                            if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_width_c23_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_width_c23_U' written by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFSobel_0_3_800_1280_0_4_8_2_2_2_24_32_3_false_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_width_c23_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_width_c23_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_width_c23_U' read by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFSobel_0_3_800_1280_0_4_8_2_2_2_24_32_3_false_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_width_c23_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                        if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.start_for_xFSobel_0_3_800_1280_0_4_8_2_2_2_24_32_3_false_U0_U.if_full_n & Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFAverageGaussianMask3x3_0_0_800_1280_0_8_2_2_24_160_U0.ap_start & ~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFAverageGaussianMask3x3_0_0_800_1280_0_8_2_2_24_160_U0.real_start & (trans_in_cnt_4 == trans_out_cnt_4) & ~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.start_for_xFSobel_0_3_800_1280_0_4_8_2_2_2_24_32_3_false_U0_U.if_read) begin
                            $display("//      Blocked by full output start propagation FIFO 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.start_for_xFSobel_0_3_800_1280_0_4_8_2_2_2_24_32_3_false_U0_U' read by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFSobel_0_3_800_1280_0_4_8_2_2_2_24_32_3_false_U0',");
                        end
                    end
                    8: begin
                        if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFAverageGaussianMask3x3_0_0_800_1280_0_8_2_2_24_160_U0.img_height_blk_n) begin
                            if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_height_c_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_height_c_U' written by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_entry53_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_height_c_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_height_c_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_height_c_U' read by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_entry53_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_height_c_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                        if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFAverageGaussianMask3x3_0_0_800_1280_0_8_2_2_24_160_U0.img_width_blk_n) begin
                            if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_width_c_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_width_c_U' written by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_entry53_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_width_c_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_width_c_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_width_c_U' read by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_entry53_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_width_c_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                        if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.start_for_xFAverageGaussianMask3x3_0_0_800_1280_0_8_2_2_24_160_U0_U.if_empty_n & Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFAverageGaussianMask3x3_0_0_800_1280_0_8_2_2_24_160_U0.ap_idle & ~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.start_for_xFAverageGaussianMask3x3_0_0_800_1280_0_8_2_2_24_160_U0_U.if_write) begin
                            $display("//      Blocked by missing 'ap_start' from start propagation FIFO 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.start_for_xFAverageGaussianMask3x3_0_0_800_1280_0_8_2_2_24_160_U0_U' written by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_entry53_U0',");
                        end
                    end
                    endcase
                end
                10 : begin
                    case(index2)
                    9: begin
                        if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFSobel_0_3_800_1280_0_4_8_2_2_2_24_32_3_false_U0.grp_xFSobel3x3_0_3_800_1280_0_4_8_2_2_2_24_32_161_3_9_false_s_fu_70.gaussian_mat_41_blk_n) begin
                            if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.gaussian_mat_data_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.gaussian_mat_data_U' written by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFAverageGaussianMask3x3_0_0_800_1280_0_8_2_2_24_160_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.gaussian_mat_data_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.gaussian_mat_data_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.gaussian_mat_data_U' read by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFAverageGaussianMask3x3_0_0_800_1280_0_8_2_2_24_160_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.gaussian_mat_data_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                        if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFSobel_0_3_800_1280_0_4_8_2_2_2_24_32_3_false_U0.imgheight_blk_n) begin
                            if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_height_c22_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_height_c22_U' written by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFAverageGaussianMask3x3_0_0_800_1280_0_8_2_2_24_160_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_height_c22_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_height_c22_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_height_c22_U' read by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFAverageGaussianMask3x3_0_0_800_1280_0_8_2_2_24_160_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_height_c22_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                        if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFSobel_0_3_800_1280_0_4_8_2_2_2_24_32_3_false_U0.imgwidth_blk_n) begin
                            if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_width_c23_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_width_c23_U' written by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFAverageGaussianMask3x3_0_0_800_1280_0_8_2_2_24_160_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_width_c23_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_width_c23_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_width_c23_U' read by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFAverageGaussianMask3x3_0_0_800_1280_0_8_2_2_24_160_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_width_c23_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                        if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.start_for_xFSobel_0_3_800_1280_0_4_8_2_2_2_24_32_3_false_U0_U.if_empty_n & Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFSobel_0_3_800_1280_0_4_8_2_2_2_24_32_3_false_U0.ap_idle & ~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.start_for_xFSobel_0_3_800_1280_0_4_8_2_2_2_24_32_3_false_U0_U.if_write) begin
                            $display("//      Blocked by missing 'ap_start' from start propagation FIFO 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.start_for_xFSobel_0_3_800_1280_0_4_8_2_2_2_24_32_3_false_U0_U' written by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFAverageGaussianMask3x3_0_0_800_1280_0_8_2_2_24_160_U0',");
                        end
                    end
                    11: begin
                        if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFSobel_0_3_800_1280_0_4_8_2_2_2_24_32_3_false_U0.grp_xFSobel3x3_0_3_800_1280_0_4_8_2_2_2_24_32_161_3_9_false_s_fu_70.gradx_mat_42_blk_n) begin
                            if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.gradx_mat_data_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.gradx_mat_data_U' written by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFDuplicate_rows_3_800_1280_4_8_2_2_2_2_2_2_32_160_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.gradx_mat_data_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.gradx_mat_data_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.gradx_mat_data_U' read by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFDuplicate_rows_3_800_1280_4_8_2_2_2_2_2_2_32_160_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.gradx_mat_data_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                        if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFSobel_0_3_800_1280_0_4_8_2_2_2_24_32_3_false_U0.grp_xFSobel3x3_0_3_800_1280_0_4_8_2_2_2_24_32_161_3_9_false_s_fu_70.grady_mat_45_blk_n) begin
                            if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.grady_mat_data_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.grady_mat_data_U' written by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFDuplicate_rows_3_800_1280_4_8_2_2_2_2_2_2_32_160_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.grady_mat_data_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.grady_mat_data_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.grady_mat_data_U' read by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFDuplicate_rows_3_800_1280_4_8_2_2_2_2_2_2_32_160_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.grady_mat_data_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                        if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFSobel_0_3_800_1280_0_4_8_2_2_2_24_32_3_false_U0.imgheight_out_blk_n) begin
                            if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_height_c24_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_height_c24_U' written by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFDuplicate_rows_3_800_1280_4_8_2_2_2_2_2_2_32_160_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_height_c24_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_height_c24_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_height_c24_U' read by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFDuplicate_rows_3_800_1280_4_8_2_2_2_2_2_2_32_160_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_height_c24_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                        if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFSobel_0_3_800_1280_0_4_8_2_2_2_24_32_3_false_U0.imgwidth_out_blk_n) begin
                            if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_width_c25_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_width_c25_U' written by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFDuplicate_rows_3_800_1280_4_8_2_2_2_2_2_2_32_160_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_width_c25_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_width_c25_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_width_c25_U' read by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFDuplicate_rows_3_800_1280_4_8_2_2_2_2_2_2_32_160_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_width_c25_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                        if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.start_for_xFDuplicate_rows_3_800_1280_4_8_2_2_2_2_2_2_32_160_U0_U.if_full_n & Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFSobel_0_3_800_1280_0_4_8_2_2_2_24_32_3_false_U0.ap_start & ~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFSobel_0_3_800_1280_0_4_8_2_2_2_24_32_3_false_U0.real_start & (trans_in_cnt_5 == trans_out_cnt_5) & ~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.start_for_xFDuplicate_rows_3_800_1280_4_8_2_2_2_2_2_2_32_160_U0_U.if_read) begin
                            $display("//      Blocked by full output start propagation FIFO 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.start_for_xFDuplicate_rows_3_800_1280_4_8_2_2_2_2_2_2_32_160_U0_U' read by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFDuplicate_rows_3_800_1280_4_8_2_2_2_2_2_2_32_160_U0',");
                        end
                    end
                    endcase
                end
                11 : begin
                    case(index2)
                    10: begin
                        if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFDuplicate_rows_3_800_1280_4_8_2_2_2_2_2_2_32_160_U0.gradx_mat_42_blk_n) begin
                            if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.gradx_mat_data_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.gradx_mat_data_U' written by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFSobel_0_3_800_1280_0_4_8_2_2_2_24_32_3_false_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.gradx_mat_data_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.gradx_mat_data_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.gradx_mat_data_U' read by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFSobel_0_3_800_1280_0_4_8_2_2_2_24_32_3_false_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.gradx_mat_data_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                        if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFDuplicate_rows_3_800_1280_4_8_2_2_2_2_2_2_32_160_U0.grady_mat_45_blk_n) begin
                            if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.grady_mat_data_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.grady_mat_data_U' written by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFSobel_0_3_800_1280_0_4_8_2_2_2_24_32_3_false_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.grady_mat_data_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.grady_mat_data_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.grady_mat_data_U' read by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFSobel_0_3_800_1280_0_4_8_2_2_2_24_32_3_false_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.grady_mat_data_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                        if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFDuplicate_rows_3_800_1280_4_8_2_2_2_2_2_2_32_160_U0.img_height_blk_n) begin
                            if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_height_c24_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_height_c24_U' written by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFSobel_0_3_800_1280_0_4_8_2_2_2_24_32_3_false_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_height_c24_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_height_c24_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_height_c24_U' read by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFSobel_0_3_800_1280_0_4_8_2_2_2_24_32_3_false_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_height_c24_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                        if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFDuplicate_rows_3_800_1280_4_8_2_2_2_2_2_2_32_160_U0.img_width_blk_n) begin
                            if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_width_c25_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_width_c25_U' written by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFSobel_0_3_800_1280_0_4_8_2_2_2_24_32_3_false_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_width_c25_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_width_c25_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_width_c25_U' read by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFSobel_0_3_800_1280_0_4_8_2_2_2_24_32_3_false_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_width_c25_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                        if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.start_for_xFDuplicate_rows_3_800_1280_4_8_2_2_2_2_2_2_32_160_U0_U.if_empty_n & Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFDuplicate_rows_3_800_1280_4_8_2_2_2_2_2_2_32_160_U0.ap_idle & ~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.start_for_xFDuplicate_rows_3_800_1280_4_8_2_2_2_2_2_2_32_160_U0_U.if_write) begin
                            $display("//      Blocked by missing 'ap_start' from start propagation FIFO 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.start_for_xFDuplicate_rows_3_800_1280_4_8_2_2_2_2_2_2_32_160_U0_U' written by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFSobel_0_3_800_1280_0_4_8_2_2_2_24_32_3_false_U0',");
                        end
                    end
                    13: begin
                        if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFDuplicate_rows_3_800_1280_4_8_2_2_2_2_2_2_32_160_U0.gradx1_mat_43_blk_n) begin
                            if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.p_src_matx_data_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.p_src_matx_data_U' written by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFMagnitudeKernel_3_3_800_1280_4_4_8_2_2_2_32_32_160_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.p_src_matx_data_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.p_src_matx_data_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.p_src_matx_data_U' read by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFMagnitudeKernel_3_3_800_1280_4_4_8_2_2_2_32_32_160_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.p_src_matx_data_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                        if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFDuplicate_rows_3_800_1280_4_8_2_2_2_2_2_2_32_160_U0.grady1_mat_46_blk_n) begin
                            if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.p_src_maty_data_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.p_src_maty_data_U' written by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFMagnitudeKernel_3_3_800_1280_4_4_8_2_2_2_32_32_160_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.p_src_maty_data_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.p_src_maty_data_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.p_src_maty_data_U' read by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFMagnitudeKernel_3_3_800_1280_4_4_8_2_2_2_32_32_160_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.p_src_maty_data_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                    end
                    14: begin
                        if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFDuplicate_rows_3_800_1280_4_8_2_2_2_2_2_2_32_160_U0.gradx2_mat_44_blk_n) begin
                            if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.p_src1_data_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.p_src1_data_U' written by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFAngleKernel_3_0_800_1280_4_0_8_2_2_32_24_160_480_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.p_src1_data_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.p_src1_data_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.p_src1_data_U' read by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFAngleKernel_3_0_800_1280_4_0_8_2_2_32_24_160_480_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.p_src1_data_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                        if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFDuplicate_rows_3_800_1280_4_8_2_2_2_2_2_2_32_160_U0.grady2_mat_47_blk_n) begin
                            if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.p_src2_data_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.p_src2_data_U' written by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFAngleKernel_3_0_800_1280_4_0_8_2_2_32_24_160_480_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.p_src2_data_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.p_src2_data_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.p_src2_data_U' read by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFAngleKernel_3_0_800_1280_4_0_8_2_2_32_24_160_480_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.p_src2_data_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                        if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFDuplicate_rows_3_800_1280_4_8_2_2_2_2_2_2_32_160_U0.img_height_out_blk_n) begin
                            if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_height_c26_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_height_c26_U' written by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFAngleKernel_3_0_800_1280_4_0_8_2_2_32_24_160_480_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_height_c26_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_height_c26_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_height_c26_U' read by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFAngleKernel_3_0_800_1280_4_0_8_2_2_32_24_160_480_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_height_c26_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                    end
                    15: begin
                        if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFDuplicate_rows_3_800_1280_4_8_2_2_2_2_2_2_32_160_U0.img_height_out1_blk_n) begin
                            if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_height_c27_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_height_c27_U' written by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFSuppression3x3_3_0_11_800_1280_4_0_13_8_2_32_24_6_160_480_2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_height_c27_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_height_c27_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_height_c27_U' read by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFSuppression3x3_3_0_11_800_1280_4_0_13_8_2_32_24_6_160_480_2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_height_c27_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                        if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFDuplicate_rows_3_800_1280_4_8_2_2_2_2_2_2_32_160_U0.img_width_out_blk_n) begin
                            if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_width_c28_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_width_c28_U' written by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFSuppression3x3_3_0_11_800_1280_4_0_13_8_2_32_24_6_160_480_2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_width_c28_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_width_c28_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_width_c28_U' read by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFSuppression3x3_3_0_11_800_1280_4_0_13_8_2_32_24_6_160_480_2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_width_c28_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                    end
                    endcase
                end
                12 : begin
                    case(index2)
                    8: begin
                        if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_Block_split26_proc_U0.img_width_blk_n) begin
                            if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_width_c21_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_width_c21_U' written by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_entry53_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_width_c21_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_width_c21_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_width_c21_U' read by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_entry53_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_width_c21_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                        if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_Block_split26_proc_U0.img_height_blk_n) begin
                            if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_height_c20_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_height_c20_U' written by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_entry53_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_height_c20_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_height_c20_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_height_c20_U' read by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_entry53_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_height_c20_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                        if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.start_for_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_falsebkb_U.if_empty_n & Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_Block_split26_proc_U0.ap_idle & ~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.start_for_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_falsebkb_U.if_write) begin
                            $display("//      Blocked by missing 'ap_start' from start propagation FIFO 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.start_for_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_falsebkb_U' written by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_entry53_U0',");
                        end
                    end
                    13: begin
                        if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_Block_split26_proc_U0.imgwidth_out_blk_n) begin
                            if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.imgwidth_c_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.imgwidth_c_U' written by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFMagnitudeKernel_3_3_800_1280_4_4_8_2_2_2_32_32_160_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.imgwidth_c_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.imgwidth_c_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.imgwidth_c_U' read by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFMagnitudeKernel_3_3_800_1280_4_4_8_2_2_2_32_32_160_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.imgwidth_c_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                        if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_Block_split26_proc_U0.height_out_blk_n) begin
                            if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.height_c_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.height_c_U' written by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFMagnitudeKernel_3_3_800_1280_4_4_8_2_2_2_32_32_160_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.height_c_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.height_c_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.height_c_U' read by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFMagnitudeKernel_3_3_800_1280_4_4_8_2_2_2_32_32_160_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.height_c_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                        if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.start_for_xFMagnitudeKernel_3_3_800_1280_4_4_8_2_2_2_32_32_160_U0_U.if_full_n & Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_Block_split26_proc_U0.ap_start & ~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_Block_split26_proc_U0.real_start & (trans_in_cnt_6 == trans_out_cnt_6) & ~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.start_for_xFMagnitudeKernel_3_3_800_1280_4_4_8_2_2_2_32_32_160_U0_U.if_read) begin
                            $display("//      Blocked by full output start propagation FIFO 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.start_for_xFMagnitudeKernel_3_3_800_1280_4_4_8_2_2_2_32_32_160_U0_U' read by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFMagnitudeKernel_3_3_800_1280_4_4_8_2_2_2_32_32_160_U0',");
                        end
                    end
                    14: begin
                        if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_Block_split26_proc_U0.imgwidth_2_cast_out_out_blk_n) begin
                            if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.imgwidth_2_cast_loc_c_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.imgwidth_2_cast_loc_c_U' written by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFAngleKernel_3_0_800_1280_4_0_8_2_2_32_24_160_480_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.imgwidth_2_cast_loc_c_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.imgwidth_2_cast_loc_c_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.imgwidth_2_cast_loc_c_U' read by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFAngleKernel_3_0_800_1280_4_0_8_2_2_32_24_160_480_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.imgwidth_2_cast_loc_c_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                        if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.start_for_xFAngleKernel_3_0_800_1280_4_0_8_2_2_32_24_160_480_U0_U.if_full_n & Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_Block_split26_proc_U0.ap_start & ~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_Block_split26_proc_U0.real_start & (trans_in_cnt_6 == trans_out_cnt_6) & ~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.start_for_xFAngleKernel_3_0_800_1280_4_0_8_2_2_32_24_160_480_U0_U.if_read) begin
                            $display("//      Blocked by full output start propagation FIFO 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.start_for_xFAngleKernel_3_0_800_1280_4_0_8_2_2_32_24_160_480_U0_U' read by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFAngleKernel_3_0_800_1280_4_0_8_2_2_32_24_160_480_U0',");
                        end
                    end
                    endcase
                end
                13 : begin
                    case(index2)
                    11: begin
                        if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFMagnitudeKernel_3_3_800_1280_4_4_8_2_2_2_32_32_160_U0.gradx1_mat_43_blk_n) begin
                            if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.p_src_matx_data_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.p_src_matx_data_U' written by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFDuplicate_rows_3_800_1280_4_8_2_2_2_2_2_2_32_160_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.p_src_matx_data_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.p_src_matx_data_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.p_src_matx_data_U' read by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFDuplicate_rows_3_800_1280_4_8_2_2_2_2_2_2_32_160_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.p_src_matx_data_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                        if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFMagnitudeKernel_3_3_800_1280_4_4_8_2_2_2_32_32_160_U0.grady1_mat_46_blk_n) begin
                            if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.p_src_maty_data_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.p_src_maty_data_U' written by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFDuplicate_rows_3_800_1280_4_8_2_2_2_2_2_2_32_160_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.p_src_maty_data_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.p_src_maty_data_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.p_src_maty_data_U' read by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFDuplicate_rows_3_800_1280_4_8_2_2_2_2_2_2_32_160_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.p_src_maty_data_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                    end
                    15: begin
                        if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFMagnitudeKernel_3_3_800_1280_4_4_8_2_2_2_32_32_160_U0.magnitude_mat_48_blk_n) begin
                            if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.p_dst_mat_data_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.p_dst_mat_data_U' written by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFSuppression3x3_3_0_11_800_1280_4_0_13_8_2_32_24_6_160_480_2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.p_dst_mat_data_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.p_dst_mat_data_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.p_dst_mat_data_U' read by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFSuppression3x3_3_0_11_800_1280_4_0_13_8_2_32_24_6_160_480_2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.p_dst_mat_data_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                    end
                    12: begin
                        if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFMagnitudeKernel_3_3_800_1280_4_4_8_2_2_2_32_32_160_U0.imgheight_blk_n) begin
                            if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.height_c_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.height_c_U' written by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_Block_split26_proc_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.height_c_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.height_c_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.height_c_U' read by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_Block_split26_proc_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.height_c_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                        if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFMagnitudeKernel_3_3_800_1280_4_4_8_2_2_2_32_32_160_U0.imgwidth_blk_n) begin
                            if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.imgwidth_c_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.imgwidth_c_U' written by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_Block_split26_proc_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.imgwidth_c_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.imgwidth_c_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.imgwidth_c_U' read by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_Block_split26_proc_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.imgwidth_c_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                        if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.start_for_xFMagnitudeKernel_3_3_800_1280_4_4_8_2_2_2_32_32_160_U0_U.if_empty_n & Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFMagnitudeKernel_3_3_800_1280_4_4_8_2_2_2_32_32_160_U0.ap_idle & ~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.start_for_xFMagnitudeKernel_3_3_800_1280_4_4_8_2_2_2_32_32_160_U0_U.if_write) begin
                            $display("//      Blocked by missing 'ap_start' from start propagation FIFO 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.start_for_xFMagnitudeKernel_3_3_800_1280_4_4_8_2_2_2_32_32_160_U0_U' written by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_Block_split26_proc_U0',");
                        end
                    end
                    endcase
                end
                14 : begin
                    case(index2)
                    11: begin
                        if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFAngleKernel_3_0_800_1280_4_0_8_2_2_32_24_160_480_U0.p_src1_data_blk_n) begin
                            if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.p_src1_data_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.p_src1_data_U' written by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFDuplicate_rows_3_800_1280_4_8_2_2_2_2_2_2_32_160_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.p_src1_data_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.p_src1_data_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.p_src1_data_U' read by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFDuplicate_rows_3_800_1280_4_8_2_2_2_2_2_2_32_160_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.p_src1_data_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                        if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFAngleKernel_3_0_800_1280_4_0_8_2_2_32_24_160_480_U0.p_src2_data_blk_n) begin
                            if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.p_src2_data_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.p_src2_data_U' written by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFDuplicate_rows_3_800_1280_4_8_2_2_2_2_2_2_32_160_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.p_src2_data_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.p_src2_data_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.p_src2_data_U' read by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFDuplicate_rows_3_800_1280_4_8_2_2_2_2_2_2_32_160_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.p_src2_data_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                        if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFAngleKernel_3_0_800_1280_4_0_8_2_2_32_24_160_480_U0.img_height_blk_n) begin
                            if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_height_c26_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_height_c26_U' written by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFDuplicate_rows_3_800_1280_4_8_2_2_2_2_2_2_32_160_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_height_c26_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_height_c26_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_height_c26_U' read by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFDuplicate_rows_3_800_1280_4_8_2_2_2_2_2_2_32_160_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_height_c26_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                    end
                    15: begin
                        if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFAngleKernel_3_0_800_1280_4_0_8_2_2_32_24_160_480_U0.p_dst_data_blk_n) begin
                            if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.p_dst_data_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.p_dst_data_U' written by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFSuppression3x3_3_0_11_800_1280_4_0_13_8_2_32_24_6_160_480_2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.p_dst_data_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.p_dst_data_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.p_dst_data_U' read by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFSuppression3x3_3_0_11_800_1280_4_0_13_8_2_32_24_6_160_480_2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.p_dst_data_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                    end
                    12: begin
                        if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFAngleKernel_3_0_800_1280_4_0_8_2_2_32_24_160_480_U0.imgwidth_2_cast_loc_blk_n) begin
                            if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.imgwidth_2_cast_loc_c_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.imgwidth_2_cast_loc_c_U' written by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_Block_split26_proc_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.imgwidth_2_cast_loc_c_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.imgwidth_2_cast_loc_c_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.imgwidth_2_cast_loc_c_U' read by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_Block_split26_proc_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.imgwidth_2_cast_loc_c_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                        if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.start_for_xFAngleKernel_3_0_800_1280_4_0_8_2_2_32_24_160_480_U0_U.if_empty_n & Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFAngleKernel_3_0_800_1280_4_0_8_2_2_32_24_160_480_U0.ap_idle & ~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.start_for_xFAngleKernel_3_0_800_1280_4_0_8_2_2_32_24_160_480_U0_U.if_write) begin
                            $display("//      Blocked by missing 'ap_start' from start propagation FIFO 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.start_for_xFAngleKernel_3_0_800_1280_4_0_8_2_2_32_24_160_480_U0_U' written by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_Block_split26_proc_U0',");
                        end
                    end
                    endcase
                end
                15 : begin
                    case(index2)
                    13: begin
                        if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFSuppression3x3_3_0_11_800_1280_4_0_13_8_2_32_24_6_160_480_2_U0.magnitude_mat_48_blk_n) begin
                            if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.p_dst_mat_data_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.p_dst_mat_data_U' written by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFMagnitudeKernel_3_3_800_1280_4_4_8_2_2_2_32_32_160_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.p_dst_mat_data_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.p_dst_mat_data_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.p_dst_mat_data_U' read by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFMagnitudeKernel_3_3_800_1280_4_4_8_2_2_2_32_32_160_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.p_dst_mat_data_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                    end
                    14: begin
                        if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFSuppression3x3_3_0_11_800_1280_4_0_13_8_2_32_24_6_160_480_2_U0.phase_mat_49_blk_n) begin
                            if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.p_dst_data_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.p_dst_data_U' written by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFAngleKernel_3_0_800_1280_4_0_8_2_2_32_24_160_480_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.p_dst_data_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.p_dst_data_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.p_dst_data_U' read by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFAngleKernel_3_0_800_1280_4_0_8_2_2_32_24_160_480_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.p_dst_data_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                    end
                    16: begin
                        if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFSuppression3x3_3_0_11_800_1280_4_0_13_8_2_32_24_6_160_480_2_U0.nms_mat_410_blk_n) begin
                            if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.nms_mat_data_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.nms_mat_data_U' written by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFPackNMS_11_11_800_1280_13_13_8_32_2_2_6_24_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.nms_mat_data_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.nms_mat_data_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.nms_mat_data_U' read by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFPackNMS_11_11_800_1280_13_13_8_32_2_2_6_24_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.nms_mat_data_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                        if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFSuppression3x3_3_0_11_800_1280_4_0_13_8_2_32_24_6_160_480_2_U0.imgheight_out_blk_n) begin
                            if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_height_c29_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_height_c29_U' written by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFPackNMS_11_11_800_1280_13_13_8_32_2_2_6_24_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_height_c29_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_height_c29_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_height_c29_U' read by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFPackNMS_11_11_800_1280_13_13_8_32_2_2_6_24_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_height_c29_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                        if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFSuppression3x3_3_0_11_800_1280_4_0_13_8_2_32_24_6_160_480_2_U0.imgwidth_out_blk_n) begin
                            if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_width_c30_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_width_c30_U' written by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFPackNMS_11_11_800_1280_13_13_8_32_2_2_6_24_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_width_c30_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_width_c30_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_width_c30_U' read by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFPackNMS_11_11_800_1280_13_13_8_32_2_2_6_24_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_width_c30_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                        if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.start_for_xFPackNMS_11_11_800_1280_13_13_8_32_2_2_6_24_U0_U.if_full_n & Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFSuppression3x3_3_0_11_800_1280_4_0_13_8_2_32_24_6_160_480_2_U0.ap_start & ~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFSuppression3x3_3_0_11_800_1280_4_0_13_8_2_32_24_6_160_480_2_U0.real_start & (trans_in_cnt_7 == trans_out_cnt_7) & ~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.start_for_xFPackNMS_11_11_800_1280_13_13_8_32_2_2_6_24_U0_U.if_read) begin
                            $display("//      Blocked by full output start propagation FIFO 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.start_for_xFPackNMS_11_11_800_1280_13_13_8_32_2_2_6_24_U0_U' read by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFPackNMS_11_11_800_1280_13_13_8_32_2_2_6_24_U0',");
                        end
                    end
                    8: begin
                        if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFSuppression3x3_3_0_11_800_1280_4_0_13_8_2_32_24_6_160_480_2_U0.low_threshold_blk_n) begin
                            if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.p_lowthreshold_c_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.p_lowthreshold_c_U' written by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_entry53_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.p_lowthreshold_c_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.p_lowthreshold_c_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.p_lowthreshold_c_U' read by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_entry53_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.p_lowthreshold_c_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                        if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFSuppression3x3_3_0_11_800_1280_4_0_13_8_2_32_24_6_160_480_2_U0.high_threshold_blk_n) begin
                            if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.p_highthreshold_c_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.p_highthreshold_c_U' written by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_entry53_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.p_highthreshold_c_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.p_highthreshold_c_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.p_highthreshold_c_U' read by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_entry53_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.p_highthreshold_c_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                        if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.start_for_xFSuppression3x3_3_0_11_800_1280_4_0_13_8_2_32_24_6_160_480_2_U0_U.if_empty_n & Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFSuppression3x3_3_0_11_800_1280_4_0_13_8_2_32_24_6_160_480_2_U0.ap_idle & ~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.start_for_xFSuppression3x3_3_0_11_800_1280_4_0_13_8_2_32_24_6_160_480_2_U0_U.if_write) begin
                            $display("//      Blocked by missing 'ap_start' from start propagation FIFO 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.start_for_xFSuppression3x3_3_0_11_800_1280_4_0_13_8_2_32_24_6_160_480_2_U0_U' written by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_entry53_U0',");
                        end
                    end
                    11: begin
                        if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFSuppression3x3_3_0_11_800_1280_4_0_13_8_2_32_24_6_160_480_2_U0.imgheight_blk_n) begin
                            if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_height_c27_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_height_c27_U' written by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFDuplicate_rows_3_800_1280_4_8_2_2_2_2_2_2_32_160_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_height_c27_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_height_c27_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_height_c27_U' read by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFDuplicate_rows_3_800_1280_4_8_2_2_2_2_2_2_32_160_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_height_c27_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                        if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFSuppression3x3_3_0_11_800_1280_4_0_13_8_2_32_24_6_160_480_2_U0.imgwidth_blk_n) begin
                            if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_width_c28_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_width_c28_U' written by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFDuplicate_rows_3_800_1280_4_8_2_2_2_2_2_2_32_160_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_width_c28_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_width_c28_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_width_c28_U' read by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFDuplicate_rows_3_800_1280_4_8_2_2_2_2_2_2_32_160_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_width_c28_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                    end
                    endcase
                end
                16 : begin
                    case(index2)
                    15: begin
                        if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFPackNMS_11_11_800_1280_13_13_8_32_2_2_6_24_U0.nms_mat_410_blk_n) begin
                            if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.nms_mat_data_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.nms_mat_data_U' written by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFSuppression3x3_3_0_11_800_1280_4_0_13_8_2_32_24_6_160_480_2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.nms_mat_data_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.nms_mat_data_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.nms_mat_data_U' read by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFSuppression3x3_3_0_11_800_1280_4_0_13_8_2_32_24_6_160_480_2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.nms_mat_data_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                        if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFPackNMS_11_11_800_1280_13_13_8_32_2_2_6_24_U0.imgheight_blk_n) begin
                            if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_height_c29_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_height_c29_U' written by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFSuppression3x3_3_0_11_800_1280_4_0_13_8_2_32_24_6_160_480_2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_height_c29_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_height_c29_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_height_c29_U' read by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFSuppression3x3_3_0_11_800_1280_4_0_13_8_2_32_24_6_160_480_2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_height_c29_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                        if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFPackNMS_11_11_800_1280_13_13_8_32_2_2_6_24_U0.imgwidth_blk_n) begin
                            if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_width_c30_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_width_c30_U' written by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFSuppression3x3_3_0_11_800_1280_4_0_13_8_2_32_24_6_160_480_2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_width_c30_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_width_c30_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_width_c30_U' read by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFSuppression3x3_3_0_11_800_1280_4_0_13_8_2_32_24_6_160_480_2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.img_width_c30_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                        if (~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.start_for_xFPackNMS_11_11_800_1280_13_13_8_32_2_2_6_24_U0_U.if_empty_n & Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFPackNMS_11_11_800_1280_13_13_8_32_2_2_6_24_U0.ap_idle & ~Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.start_for_xFPackNMS_11_11_800_1280_13_13_8_32_2_2_6_24_U0_U.if_write) begin
                            $display("//      Blocked by missing 'ap_start' from start propagation FIFO 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.start_for_xFPackNMS_11_11_800_1280_13_13_8_32_2_2_6_24_U0_U' written by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0.grp_xFCannyKernel_0_11_0_800_1280_0_13_8_32_2_2_24_24_160_2_480_3_false_s_fu_58.xFSuppression3x3_3_0_11_800_1280_4_0_13_8_2_32_24_6_160_480_2_U0',");
                        end
                    end
                    endcase
                end
                17 : begin
                    case(index2)
                    7: begin
                        if (~xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2AxiStream_U0.MatStream2AxiStream_2_U0.dst_mat_422_blk_n) begin
                            if (~dst_mat_data_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'canny_accel_canny_accel.dst_mat_data_U' written by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.dst_mat_data_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~dst_mat_data_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'canny_accel_canny_accel.dst_mat_data_U' read by process 'canny_accel_canny_accel.Canny_3_0_0_11_800_1280_8_32_false_2_2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.dst_mat_data_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                    end
                    0: begin
                        if (~xfMat2Array_64_11_800_1280_32_2_1_U0.srcMat_rows_blk_n) begin
                            if (~dst_mat_rows_c_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'canny_accel_canny_accel.dst_mat_rows_c_U' written by process 'canny_accel_canny_accel.Block_split11_proc72_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.dst_mat_rows_c_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~dst_mat_rows_c_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'canny_accel_canny_accel.dst_mat_rows_c_U' read by process 'canny_accel_canny_accel.Block_split11_proc72_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.dst_mat_rows_c_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                        if (~xfMat2Array_64_11_800_1280_32_2_1_U0.srcMat_cols_blk_n) begin
                            if (~dst_mat_cols_c_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'canny_accel_canny_accel.dst_mat_cols_c_U' written by process 'canny_accel_canny_accel.Block_split11_proc72_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.dst_mat_cols_c_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~dst_mat_cols_c_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'canny_accel_canny_accel.dst_mat_cols_c_U' read by process 'canny_accel_canny_accel.Block_split11_proc72_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.dst_mat_cols_c_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                        if (~xfMat2Array_64_11_800_1280_32_2_1_U0.dstPtr_blk_n) begin
                            if (~img_out_c_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'canny_accel_canny_accel.img_out_c_U' written by process 'canny_accel_canny_accel.Block_split11_proc72_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.img_out_c_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~img_out_c_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'canny_accel_canny_accel.img_out_c_U' read by process 'canny_accel_canny_accel.Block_split11_proc72_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.img_out_c_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                        if (~start_for_xfMat2Array_64_11_800_1280_32_2_1_U0_U.if_empty_n & xfMat2Array_64_11_800_1280_32_2_1_U0.ap_idle & ~start_for_xfMat2Array_64_11_800_1280_32_2_1_U0_U.if_write) begin
                            $display("//      Blocked by missing 'ap_start' from start propagation FIFO 'canny_accel_canny_accel.start_for_xfMat2Array_64_11_800_1280_32_2_1_U0_U' written by process 'canny_accel_canny_accel.Block_split11_proc72_U0',");
                        end
                    end
                    endcase
                end
                18 : begin
                    case(index2)
                    25: begin
                        if (~xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2Axi_entry67_U0.dout_out_blk_n) begin
                            if (~xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.dout_c_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.dout_c_U' written by process 'canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.AxiStream2Axi_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.dout_c_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.dout_c_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.dout_c_U' read by process 'canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.AxiStream2Axi_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.dout_c_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                    end
                    19: begin
                        if (~xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2Axi_entry67_U0.rows_out_blk_n) begin
                            if (~xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.rows_c_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.rows_c_U' written by process 'canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.addrbound_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.rows_c_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.rows_c_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.rows_c_U' read by process 'canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.addrbound_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.rows_c_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                        if (~xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2Axi_entry67_U0.cols_out_blk_n) begin
                            if (~xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.cols_c_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.cols_c_U' written by process 'canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.addrbound_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.cols_c_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.cols_c_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.cols_c_U' read by process 'canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.addrbound_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.cols_c_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                        if (~xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.start_for_addrbound_U0_U.if_full_n & xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2Axi_entry67_U0.ap_start & ~xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2Axi_entry67_U0.real_start & (trans_in_cnt_8 == trans_out_cnt_8) & ~xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.start_for_addrbound_U0_U.if_read) begin
                            $display("//      Blocked by full output start propagation FIFO 'canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.start_for_addrbound_U0_U' read by process 'canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.addrbound_U0',");
                        end
                    end
                    22: begin
                        if (~xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2Axi_entry67_U0.rows_out1_blk_n) begin
                            if (~xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.rows_c10_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.rows_c10_U' written by process 'canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2AxiStream_U0.cols_npc_aligned63_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.rows_c10_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.rows_c10_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.rows_c10_U' read by process 'canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2AxiStream_U0.cols_npc_aligned63_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.rows_c10_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                        if (~xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2Axi_entry67_U0.cols_out2_blk_n) begin
                            if (~xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.cols_c11_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.cols_c11_U' written by process 'canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2AxiStream_U0.cols_npc_aligned63_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.cols_c11_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.cols_c11_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.cols_c11_U' read by process 'canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2AxiStream_U0.cols_npc_aligned63_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.cols_c11_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                    end
                    21: begin
                        if (~xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.start_for_Mat2AxiStream_U0_U.if_full_n & xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2Axi_entry67_U0.ap_start & ~xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2Axi_entry67_U0.real_start & (trans_in_cnt_8 == trans_out_cnt_8) & ~xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.start_for_Mat2AxiStream_U0_U.if_read) begin
                            $display("//      Blocked by full output start propagation FIFO 'canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.start_for_Mat2AxiStream_U0_U' read by process 'canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2AxiStream_U0',");
                        end
                    end
                    endcase
                end
                19 : begin
                    case(index2)
                    18: begin
                        if (~xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.addrbound_U0.rows_blk_n) begin
                            if (~xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.rows_c_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.rows_c_U' written by process 'canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2Axi_entry67_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.rows_c_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.rows_c_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.rows_c_U' read by process 'canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2Axi_entry67_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.rows_c_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                        if (~xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.addrbound_U0.cols_blk_n) begin
                            if (~xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.cols_c_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.cols_c_U' written by process 'canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2Axi_entry67_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.cols_c_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.cols_c_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.cols_c_U' read by process 'canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2Axi_entry67_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.cols_c_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                        if (~xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.start_for_addrbound_U0_U.if_empty_n & xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.addrbound_U0.ap_idle & ~xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.start_for_addrbound_U0_U.if_write) begin
                            $display("//      Blocked by missing 'ap_start' from start propagation FIFO 'canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.start_for_addrbound_U0_U' written by process 'canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2Axi_entry67_U0',");
                        end
                    end
                    endcase
                end
                20 : begin
                    case(index2)
                    19: begin
                        if (~xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.p_channel_U.if_empty_n & xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2Axi_Block_split13_proc_U0.ap_idle & ~xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.p_channel_U.if_write) begin
                            if (~xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.p_channel_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.p_channel_U' written by process 'canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.addrbound_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.p_channel_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.p_channel_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.p_channel_U' read by process 'canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.addrbound_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.p_channel_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                    end
                    endcase
                end
                21 : begin
                    case(index2)
                    25: begin
                        if (~xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2AxiStream_U0.MatStream2AxiStream_2_U0.ldata1_blk_n) begin
                            if (~xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.ldata_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.ldata_U' written by process 'canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.AxiStream2Axi_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.ldata_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.ldata_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.ldata_U' read by process 'canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.AxiStream2Axi_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.ldata_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                    end
                    18: begin
                        if (~xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2AxiStream_U0.cols_npc_aligned63_U0.rows_blk_n) begin
                            if (~xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.rows_c10_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.rows_c10_U' written by process 'canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2Axi_entry67_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.rows_c10_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.rows_c10_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.rows_c10_U' read by process 'canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2Axi_entry67_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.rows_c10_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                        if (~xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2AxiStream_U0.cols_npc_aligned63_U0.cols_blk_n) begin
                            if (~xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.cols_c11_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.cols_c11_U' written by process 'canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2Axi_entry67_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.cols_c11_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.cols_c11_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.cols_c11_U' read by process 'canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2Axi_entry67_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.cols_c11_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                        if (~xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.start_for_Mat2AxiStream_U0_U.if_empty_n & xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2AxiStream_U0.ap_idle & ~xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.start_for_Mat2AxiStream_U0_U.if_write) begin
                            $display("//      Blocked by missing 'ap_start' from start propagation FIFO 'canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.start_for_Mat2AxiStream_U0_U' written by process 'canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2Axi_entry67_U0',");
                        end
                    end
                    endcase
                end
                22 : begin
                    case(index2)
                    18: begin
                        if (~xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2AxiStream_U0.cols_npc_aligned63_U0.cols_blk_n) begin
                            if (~xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.cols_c11_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.cols_c11_U' written by process 'canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2Axi_entry67_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.cols_c11_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.cols_c11_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.cols_c11_U' read by process 'canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2Axi_entry67_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.cols_c11_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                        if (~xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2AxiStream_U0.cols_npc_aligned63_U0.rows_blk_n) begin
                            if (~xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.rows_c10_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.rows_c10_U' written by process 'canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2Axi_entry67_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.rows_c10_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.rows_c10_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.rows_c10_U' read by process 'canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2Axi_entry67_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.rows_c10_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                    end
                    23: begin
                        if (~xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2AxiStream_U0.cols_npc_aligned63_U0.cols_out_blk_n) begin
                            if (~xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2AxiStream_U0.cols_c_i_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2AxiStream_U0.cols_c_i_U' written by process 'canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2AxiStream_U0.last_blk_pxl_width_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2AxiStream_U0.cols_c_i_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2AxiStream_U0.cols_c_i_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2AxiStream_U0.cols_c_i_U' read by process 'canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2AxiStream_U0.last_blk_pxl_width_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2AxiStream_U0.cols_c_i_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                        if (~xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2AxiStream_U0.cols_npc_aligned63_U0.ret_out_blk_n) begin
                            if (~xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2AxiStream_U0.p_c_i_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2AxiStream_U0.p_c_i_U' written by process 'canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2AxiStream_U0.last_blk_pxl_width_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2AxiStream_U0.p_c_i_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2AxiStream_U0.p_c_i_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2AxiStream_U0.p_c_i_U' read by process 'canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2AxiStream_U0.last_blk_pxl_width_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2AxiStream_U0.p_c_i_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                        if (~xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2AxiStream_U0.start_for_last_blk_pxl_width_U0_U.if_full_n & xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2AxiStream_U0.cols_npc_aligned63_U0.ap_start & ~xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2AxiStream_U0.cols_npc_aligned63_U0.real_start & (trans_in_cnt_9 == trans_out_cnt_9) & ~xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2AxiStream_U0.start_for_last_blk_pxl_width_U0_U.if_read) begin
                            $display("//      Blocked by full output start propagation FIFO 'canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2AxiStream_U0.start_for_last_blk_pxl_width_U0_U' read by process 'canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2AxiStream_U0.last_blk_pxl_width_U0',");
                        end
                    end
                    24: begin
                        if (~xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2AxiStream_U0.cols_npc_aligned63_U0.rows_out_blk_n) begin
                            if (~xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2AxiStream_U0.rows_c_i_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2AxiStream_U0.rows_c_i_U' written by process 'canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2AxiStream_U0.MatStream2AxiStream_2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2AxiStream_U0.rows_c_i_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2AxiStream_U0.rows_c_i_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2AxiStream_U0.rows_c_i_U' read by process 'canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2AxiStream_U0.MatStream2AxiStream_2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2AxiStream_U0.rows_c_i_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                    end
                    endcase
                end
                23 : begin
                    case(index2)
                    22: begin
                        if (~xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2AxiStream_U0.last_blk_pxl_width_U0.cols_blk_n) begin
                            if (~xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2AxiStream_U0.cols_c_i_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2AxiStream_U0.cols_c_i_U' written by process 'canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2AxiStream_U0.cols_npc_aligned63_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2AxiStream_U0.cols_c_i_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2AxiStream_U0.cols_c_i_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2AxiStream_U0.cols_c_i_U' read by process 'canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2AxiStream_U0.cols_npc_aligned63_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2AxiStream_U0.cols_c_i_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                        if (~xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2AxiStream_U0.last_blk_pxl_width_U0.cols_bound_per_npc_blk_n) begin
                            if (~xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2AxiStream_U0.p_c_i_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2AxiStream_U0.p_c_i_U' written by process 'canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2AxiStream_U0.cols_npc_aligned63_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2AxiStream_U0.p_c_i_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2AxiStream_U0.p_c_i_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2AxiStream_U0.p_c_i_U' read by process 'canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2AxiStream_U0.cols_npc_aligned63_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2AxiStream_U0.p_c_i_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                        if (~xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2AxiStream_U0.start_for_last_blk_pxl_width_U0_U.if_empty_n & xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2AxiStream_U0.last_blk_pxl_width_U0.ap_idle & ~xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2AxiStream_U0.start_for_last_blk_pxl_width_U0_U.if_write) begin
                            $display("//      Blocked by missing 'ap_start' from start propagation FIFO 'canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2AxiStream_U0.start_for_last_blk_pxl_width_U0_U' written by process 'canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2AxiStream_U0.cols_npc_aligned63_U0',");
                        end
                    end
                    24: begin
                        if (~xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2AxiStream_U0.last_blk_pxl_width_U0.cols_bound_per_npc_out_blk_n) begin
                            if (~xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2AxiStream_U0.p_c11_i_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2AxiStream_U0.p_c11_i_U' written by process 'canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2AxiStream_U0.MatStream2AxiStream_2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2AxiStream_U0.p_c11_i_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2AxiStream_U0.p_c11_i_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2AxiStream_U0.p_c11_i_U' read by process 'canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2AxiStream_U0.MatStream2AxiStream_2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2AxiStream_U0.p_c11_i_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                    end
                    endcase
                end
                24 : begin
                    case(index2)
                    25: begin
                        if (~xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2AxiStream_U0.MatStream2AxiStream_2_U0.ldata1_blk_n) begin
                            if (~xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.ldata_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.ldata_U' written by process 'canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.AxiStream2Axi_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.ldata_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.ldata_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.ldata_U' read by process 'canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.AxiStream2Axi_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.ldata_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                    end
                    22: begin
                        if (~xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2AxiStream_U0.MatStream2AxiStream_2_U0.rows_blk_n) begin
                            if (~xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2AxiStream_U0.rows_c_i_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2AxiStream_U0.rows_c_i_U' written by process 'canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2AxiStream_U0.cols_npc_aligned63_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2AxiStream_U0.rows_c_i_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2AxiStream_U0.rows_c_i_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2AxiStream_U0.rows_c_i_U' read by process 'canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2AxiStream_U0.cols_npc_aligned63_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2AxiStream_U0.rows_c_i_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                    end
                    23: begin
                        if (~xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2AxiStream_U0.MatStream2AxiStream_2_U0.cols_bound_per_npc_blk_n) begin
                            if (~xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2AxiStream_U0.p_c11_i_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2AxiStream_U0.p_c11_i_U' written by process 'canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2AxiStream_U0.last_blk_pxl_width_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2AxiStream_U0.p_c11_i_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2AxiStream_U0.p_c11_i_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2AxiStream_U0.p_c11_i_U' read by process 'canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2AxiStream_U0.last_blk_pxl_width_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2AxiStream_U0.p_c11_i_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                        if (~xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2AxiStream_U0.p_channel_U.if_empty_n & xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2AxiStream_U0.MatStream2AxiStream_2_U0.ap_idle & ~xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2AxiStream_U0.p_channel_U.if_write) begin
                            if (~xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2AxiStream_U0.p_channel_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2AxiStream_U0.p_channel_U' written by process 'canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2AxiStream_U0.last_blk_pxl_width_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2AxiStream_U0.p_channel_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2AxiStream_U0.p_channel_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2AxiStream_U0.p_channel_U' read by process 'canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2AxiStream_U0.last_blk_pxl_width_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2AxiStream_U0.p_channel_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                    end
                    endcase
                end
                25 : begin
                    case(index2)
                    24: begin
                        if (~xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.AxiStream2Axi_U0.ldata1_blk_n) begin
                            if (~xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.ldata_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.ldata_U' written by process 'canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2AxiStream_U0.MatStream2AxiStream_2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.ldata_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.ldata_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.ldata_U' read by process 'canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2AxiStream_U0.MatStream2AxiStream_2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.ldata_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                    end
                    18: begin
                        if (~xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.AxiStream2Axi_U0.dout_blk_n) begin
                            if (~xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.dout_c_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.dout_c_U' written by process 'canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2Axi_entry67_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.dout_c_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.dout_c_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.dout_c_U' read by process 'canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2Axi_entry67_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.dout_c_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                    end
                    20: begin
                        if (~xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.axibound_V_U.if_empty_n & xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.AxiStream2Axi_U0.ap_idle & ~xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.axibound_V_U.if_write) begin
                            if (~xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.axibound_V_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.axibound_V_U' written by process 'canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2Axi_Block_split13_proc_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.axibound_V_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.axibound_V_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.axibound_V_U' read by process 'canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.Mat2Axi_Block_split13_proc_U0'");
                                $fdisplay(fp, "Dependence_Channel_path canny_accel_canny_accel.xfMat2Array_64_11_800_1280_32_2_1_U0.grp_Mat2Axi_fu_62.axibound_V_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                    end
                    endcase
                end
            endcase
        end
    endtask

    // report
    initial begin : report_deadlock
        integer cycle_id;
        integer cycle_comp_id;
        integer record_time;
        wait (reset == 1);
        cycle_id = 1;
        record_time = 0;
        while (1) begin
            @ (negedge clock);
            case (CS_fsm)
                ST_DL_DETECTED: begin
                    cycle_comp_id = 2;
                    if (dl_detect_reg != dl_done_reg) begin
                        if (dl_done_reg == 'b0) begin
                            print_dl_head;
                            record_time = $time;
                        end
                        print_cycle_start(proc_path(origin), cycle_id);
                        cycle_id = cycle_id + 1;
                    end
                    else begin
                        print_dl_end((cycle_id - 1),record_time);
                        find_df_deadlock = 1;
                        @(negedge clock);
                        $finish;
                    end
                end
                ST_DL_REPORT: begin
                    if ((|(dl_in_vec)) & ~(|(dl_in_vec & origin_reg))) begin
                        print_cycle_chan_comp(dl_in_vec_reg, dl_in_vec);
                        print_cycle_proc_comp(proc_path(dl_in_vec), cycle_comp_id);
                        cycle_comp_id = cycle_comp_id + 1;
                    end
                    else begin
                        print_cycle_chan_comp(dl_in_vec_reg, dl_in_vec);
                    end
                end
            endcase
        end
    end
 
