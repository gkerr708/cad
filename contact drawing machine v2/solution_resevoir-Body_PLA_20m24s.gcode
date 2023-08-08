; HEADER_BLOCK_START
; BambuStudio 01.06.02.04
; model printing time: 14m 35s; total estimated time: 20m 24s
; total layer number: 154
; HEADER_BLOCK_END

; CONFIG_BLOCK_START
; additional_cooling_fan_speed = 70
; auxiliary_fan = 0
; bed_custom_model = 
; bed_custom_texture = 
; bed_exclude_area = 0x0,18x0,18x28,0x28
; bed_temperature_difference = 10
; before_layer_change_gcode = 
; bottom_shell_layers = 3
; bottom_shell_thickness = 0
; bottom_surface_pattern = monotonic
; bridge_angle = 0
; bridge_flow = 1
; bridge_no_support = 0
; bridge_speed = 50
; brim_object_gap = 0.1
; brim_type = auto_brim
; brim_width = 5
; change_filament_gcode = M620 S[next_extruder]A\nM204 S9000\n{if toolchange_count > 1 && (z_hop_types[current_extruder] == 0 || z_hop_types[current_extruder] == 3)}\nG17\nG2 Z{z_after_toolchange + 0.4} I0.86 J0.86 P1 F10000 ; spiral lift a little from second lift\n{endif}\nG1 Z{max_layer_z + 3.0} F1200\n\nG1 X70 F21000\nG1 Y245\nG1 Y265 F3000\nM400\nM106 P1 S0\nM106 P2 S0\n{if old_filament_temp > 142 && next_extruder < 255}M104 S[old_filament_temp]{endif}\nG1 X90 F3000\nG1 Y255 F4000\nG1 X100 F5000\nG1 X120 F15000\n\nG1 X20 Y50 F21000\nG1 Y-3\n{if toolchange_count == 2}\n; get travel path for change filament\nM620.1 X[travel_point_1_x] Y[travel_point_1_y] F21000 P0\nM620.1 X[travel_point_2_x] Y[travel_point_2_y] F21000 P1\nM620.1 X[travel_point_3_x] Y[travel_point_3_y] F21000 P2\n{endif}\nM620.1 E F[old_filament_e_feedrate] T{nozzle_temperature_range_high[previous_extruder]}\nT[next_extruder]\nM620.1 E F[new_filament_e_feedrate] T{nozzle_temperature_range_high[next_extruder]}\n\n{if next_extruder < 255}\nM400\n\nG92 E0\n{if flush_length_1 > 1}\n; FLUSH_START\n; always use highest temperature to flush\nM400\nM109 S[nozzle_temperature_range_high]\n{if flush_length_1 > 23.7}\nG1 E23.7 F{old_filament_e_feedrate} ; do not need pulsatile flushing for start part\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{old_filament_e_feedrate}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{new_filament_e_feedrate}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{new_filament_e_feedrate}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{new_filament_e_feedrate}\n{else}\nG1 E{flush_length_1} F{old_filament_e_feedrate}\n{endif}\n; FLUSH_END\nG1 E-[old_retract_length_toolchange] F1800\nG1 E[old_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_2 > 1}\n; FLUSH_START\nG1 E{flush_length_2 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_2 * 0.02} F50\n; FLUSH_END\nG1 E-[new_retract_length_toolchange] F1800\nG1 E[new_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_3 > 1}\n; FLUSH_START\nG1 E{flush_length_3 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_3 * 0.02} F50\n; FLUSH_END\nG1 E-[new_retract_length_toolchange] F1800\nG1 E[new_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_4 > 1}\n; FLUSH_START\nG1 E{flush_length_4 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_4 * 0.02} F50\n; FLUSH_END\n{endif}\n; FLUSH_START\nM400\nM109 S[new_filament_temp]\nG1 E2 F{new_filament_e_feedrate} ;Compensate for filament spillage during waiting temperature\n; FLUSH_END\nM400\nG92 E0\nG1 E-[new_retract_length_toolchange] F1800\nM106 P1 S255\nM400 S3\nG1 X80 F15000\nG1 X60 F15000\nG1 X80 F15000\nG1 X60 F15000; shake to put down garbage\n\nG1 X70 F5000\nG1 X90 F3000\nG1 Y255 F4000\nG1 X100 F5000\nG1 Y265 F5000\nG1 X70 F10000\nG1 X100 F5000\nG1 X70 F10000\nG1 X100 F5000\nG1 X165 F15000; wipe and shake\nG1 Y256 ; move Y to aside, prevent collision\nM400\nG1 Z{max_layer_z + 3.0} F3000\n{if layer_z <= (initial_layer_print_height + 0.001)}\nM204 S[initial_layer_acceleration]\n{else}\nM204 S[default_acceleration]\n{endif}\n{else}\nG1 X[x_after_toolchange] Y[y_after_toolchange] Z[z_after_toolchange] F12000\n{endif}\nM621 S[next_extruder]A
; close_fan_the_first_x_layers = 1
; cool_plate_temp = 35
; cool_plate_temp_initial_layer = 35
; curr_bed_type = Textured PEI Plate
; default_acceleration = 10000
; default_filament_colour = ""
; default_filament_profile = "Bambu PLA Basic @BBL X1"
; default_print_profile = 0.20mm Standard @BBL P1P
; deretraction_speed = 30
; detect_narrow_internal_solid_infill = 1
; detect_overhang_wall = 1
; detect_thin_wall = 0
; different_settings_to_system = enable_support;support_type;;
; draft_shield = disabled
; elefant_foot_compensation = 0.15
; enable_arc_fitting = 1
; enable_overhang_bridge_fan = 1
; enable_overhang_speed = 1
; enable_prime_tower = 0
; enable_support = 1
; enforce_support_layers = 0
; eng_plate_temp = 0
; eng_plate_temp_initial_layer = 0
; ensure_vertical_shell_thickness = 1
; extruder_clearance_height_to_lid = 90
; extruder_clearance_height_to_rod = 36
; extruder_clearance_max_radius = 56
; extruder_clearance_radius = 57
; extruder_colour = #018001
; extruder_offset = 0x2
; fan_cooling_layer_time = 80
; fan_max_speed = 100
; fan_min_speed = 50
; filament_colour = #FFFFFF
; filament_cost = 24.99
; filament_density = 1.26
; filament_diameter = 1.75
; filament_end_gcode = "; filament end gcode \nM106 P3 S0\n"
; filament_flow_ratio = 0.98
; filament_ids = GFA00
; filament_is_support = 0
; filament_max_volumetric_speed = 21
; filament_minimal_purge_on_wipe_tower = 15
; filament_settings_id = "Bambu PLA Basic @BBL P1P"
; filament_soluble = 0
; filament_start_gcode = "; filament start gcode\n{if  (bed_temperature[current_extruder] >45)||(bed_temperature_initial_layer[current_extruder] >45)}M106 P3 S255\n{elsif(bed_temperature[current_extruder] >35)||(bed_temperature_initial_layer[current_extruder] >35)}M106 P3 S180\n{endif}"
; filament_type = PLA
; filament_vendor = "Bambu Lab"
; filename_format = {input_filename_base}_{filament_type[0]}_{print_time}.gcode
; flush_into_infill = 0
; flush_into_objects = 0
; flush_into_support = 1
; flush_multiplier = 1
; flush_volumes_matrix = 0
; flush_volumes_vector = 140,140
; full_fan_speed_layer = 0
; fuzzy_skin = none
; fuzzy_skin_point_distance = 0.8
; fuzzy_skin_thickness = 0.3
; gap_infill_speed = 250
; gcode_add_line_number = 0
; gcode_flavor = marlin
; host_type = octoprint
; hot_plate_temp = 65
; hot_plate_temp_initial_layer = 65
; independent_support_layer_height = 1
; infill_combination = 0
; infill_direction = 45
; infill_wall_overlap = 15%
; initial_layer_acceleration = 500
; initial_layer_infill_speed = 105
; initial_layer_line_width = 0.5
; initial_layer_print_height = 0.2
; initial_layer_speed = 50
; inner_wall_line_width = 0.45
; inner_wall_speed = 300
; interface_shells = 0
; internal_bridge_support_thickness = 0.8
; internal_solid_infill_line_width = 0.42
; internal_solid_infill_speed = 250
; ironing_flow = 10%
; ironing_spacing = 0.15
; ironing_speed = 30
; ironing_type = no ironing
; layer_change_gcode = ; layer num/total_layer_count: {layer_num+1}/[total_layer_count]\nM622.1 S1 ; for prev firware, default turned on\nM1002 judge_flag timelapse_record_flag\nM622 J1\n{if timelapse_type == 0} ; timelapse without wipe tower\nM971 S11 C10 O0\n{elsif timelapse_type == 1} ; timelapse with wipe tower\nG92 E0\nG1 E-[retraction_length] F1800\nG17\nG2 Z{layer_z + 0.4} I0.86 J0.86 P1 F20000 ; spiral lift a little\nG1 X65 Y245 F20000 ; move to safe pos\nG17\nG2 Z{layer_z} I0.86 J0.86 P1 F20000\nG1 Y265 F3000\nM400 P300\nM971 S11 C11 O0\nG92 E0\nG1 E[retraction_length] F300\nG1 X100 F5000\nG1 Y255 F20000\n{endif}\nM623\n; update layer progress\nM73 L{layer_num+1}\nM991 S0 P{layer_num} ;notify layer change
; layer_height = 0.2
; line_width = 0.42
; machine_end_gcode = ;===== date: 20230118 =====================\nM400 ; wait for buffer to clear\nG92 E0 ; zero the extruder\nG1 E-0.8 F1800 ; retract\nG1 Z{max_layer_z + 0.5} F900 ; lower z a little\nG1 X65 Y245 F12000 ; move to safe pos \nG1 Y265 F3000\nM991 S0 P-1 ;end smooth timelapse at safe pos\nM400 S2 ;wait for last picture to be taken\n\nG1 X65 Y245 F12000\nG1 Y265 F3000\nM140 S0 ; turn off bed\nM106 S0 ; turn off fan\nM106 P2 S0 ; turn off remote part cooling fan\nM106 P3 S0 ; turn off chamber cooling fan\n\nG1 X100 F12000 ; wipe\n; pull back filament to AMS\nM620 S255\nG1 X20 Y50 F12000\nG1 Y-3\nT255\nG1 X65 F12000\nG1 Y265\nG1 X100 F12000 ; wipe\nM621 S255\nM104 S0 ; turn off hotend\n\nM400 ; wait all motion done\nM17 S\nM17 Z0.4 ; lower z motor current to reduce impact if there is something in the bottom\n{if (max_layer_z + 100.0) < 250}\n    G1 Z{max_layer_z + 100.0} F600\n    G1 Z{max_layer_z +98.0}\n{else}\n    G1 Z250 F600\n    G1 Z248\n{endif}\nM400 P100\nM17 R ; restore z current\n\nG90\nG1 X128 Y250 F3600\n\nM220 S100  ; Reset feedrate magnitude\nM201.2 K1.0 ; Reset acc magnitude\nM73.2   R1.0 ;Reset left time magnitude\nM1002 set_gcode_claim_speed_level : 0\n\nM17 X0.8 Y0.8 Z0.5 ; lower motor current to 45% power\n\n
; machine_load_filament_time = 29
; machine_max_acceleration_e = 5000,5000
; machine_max_acceleration_extruding = 20000,20000
; machine_max_acceleration_retracting = 5000,5000
; machine_max_acceleration_travel = 9000,9000
; machine_max_acceleration_x = 20000,20000
; machine_max_acceleration_y = 20000,20000
; machine_max_acceleration_z = 500,200
; machine_max_jerk_e = 2.5,2.5
; machine_max_jerk_x = 9,9
; machine_max_jerk_y = 9,9
; machine_max_jerk_z = 3,3
; machine_max_speed_e = 30,30
; machine_max_speed_x = 500,200
; machine_max_speed_y = 500,200
; machine_max_speed_z = 20,20
; machine_min_extruding_rate = 0,0
; machine_min_travel_rate = 0,0
; machine_pause_gcode = M400 U1
; machine_start_gcode = ;===== machine: P1P ========================\n;===== date: 20230425 =====================\n;===== turn on the HB fan =================\nM104 S75 ;set extruder temp to turn on the HB fan and prevent filament oozing from nozzle\n;===== reset machine status =================\nG91\nM17 Z0.4 ; lower the z-motor current\nG0 Z12 F300 ; lower the hotbed , to prevent the nozzle is below the hotbed\nG0 Z-6;\nG90\nM17 X1.2 Y1.2 Z0.75 ; reset motor current to default\nM960 S5 P1 ; turn on logo lamp\nG90\nM220 S100 ;Reset Feedrate\nM221 S100 ;Reset Flowrate\nM73.2   R1.0 ;Reset left time magnitude\nM1002 set_gcode_claim_speed_level : 5\nM221 X0 Y0 Z0 ; turn off soft endstop to prevent protential logic problem\nG29.1 Z{+0.0} ; clear z-trim value first\n\n;===== heatbed preheat ====================\nM1002 gcode_claim_action : 2\nM140 S[bed_temperature_initial_layer_single] ;set bed temp\nM190 S[bed_temperature_initial_layer_single] ;wait for bed temp\n\n\n\n;=============turn on fans to prevent PLA jamming=================\n{if filament_type[initial_extruder]=="PLA"}\n    {if (bed_temperature[initial_extruder] >45)||(bed_temperature_initial_layer[initial_extruder] >45)}\n    M106 P3 S180\n    {elsif (bed_temperature[initial_extruder] >50)||(bed_temperature_initial_layer[initial_extruder] >50)}\n    M106 P3 S255\n    {endif};Prevent PLA from jamming\n{endif}\nM106 P2 S100 ; turn on big fan ,to cool down toolhead\n\n;===== prepare print temperature and material ==========\nM104 S[nozzle_temperature_initial_layer] ;set extruder temp\nG91\nG0 Z10 F1200\nG90\nG28 X\nM975 S1 ; turn on\nG1 X60 F12000\nG1 Y245\nG1 Y265 F3000\nM620 M\nM620 S[initial_extruder]A   ; switch material if AMS exist\n    M109 S[nozzle_temperature_initial_layer]\n    G1 X120 F12000\n\n    G1 X20 Y50 F12000\n    G1 Y-3\n    T[initial_extruder]\n    G1 X54 F12000\n    G1 Y265\n    M400\nM621 S[initial_extruder]A\nM620.1 E F{filament_max_volumetric_speed[initial_extruder]/2.4053*60} T{nozzle_temperature_range_high[initial_extruder]}\n\n\nM412 S1 ; ===turn on filament runout detection===\n\nM109 S250 ;set nozzle to common flush temp\nM106 P1 S0\nG92 E0\nG1 E50 F200\nM400\nM104 S[nozzle_temperature_initial_layer]\nG92 E0\nG1 E50 F200\nM400\nM106 P1 S255\nG92 E0\nG1 E5 F300\nM109 S{nozzle_temperature_initial_layer[initial_extruder]-20} ; drop nozzle temp, make filament shink a bit\nG92 E0\nG1 E-0.5 F300\n\nG1 X70 F9000\nG1 X76 F15000\nG1 X65 F15000\nG1 X76 F15000\nG1 X65 F15000; shake to put down garbage\nG1 X80 F6000\nG1 X95 F15000\nG1 X80 F15000\nG1 X165 F15000; wipe and shake\nM400\nM106 P1 S0\n;===== prepare print temperature and material end =====\n\n\n;===== wipe nozzle ===============================\nM1002 gcode_claim_action : 14\nM975 S1\nM106 S255\nG1 X65 Y230 F18000\nG1 Y264 F6000\nM109 S{nozzle_temperature_initial_layer[initial_extruder]-20}\nG1 X100 F18000 ; first wipe mouth\n\nG0 X135 Y253 F20000  ; move to exposed steel surface edge\nG28 Z P0 T300; home z with low precision,permit 300deg temperature\nG29.2 S0 ; turn off ABL\nG0 Z5 F20000\n\nG1 X60 Y265\nG92 E0\nG1 E-0.5 F300 ; retrack more\nG1 X100 F5000; second wipe mouth\nG1 X70 F15000\nG1 X100 F5000\nG1 X70 F15000\nG1 X100 F5000\nG1 X70 F15000\nG1 X100 F5000\nG1 X70 F15000\nG1 X90 F5000\nG0 X128 Y261 Z-1.5 F20000  ; move to exposed steel surface and stop the nozzle\nM104 S140 ; set temp down to heatbed acceptable\nM106 S255 ; turn on fan (G28 has turn off fan)\n\nM221 S; push soft endstop status\nM221 Z0 ;turn off Z axis endstop\nG0 Z0.5 F20000\nG0 X125 Y259.5 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y262.5\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y260.0\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y262.0\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y260.5\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y261.5\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y261.0\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 X128\nG2 I0.5 J0 F300\nG2 I0.5 J0 F300\nG2 I0.5 J0 F300\nG2 I0.5 J0 F300\n\nM109 S140 ; wait nozzle temp down to heatbed acceptable\nG2 I0.5 J0 F3000\nG2 I0.5 J0 F3000\nG2 I0.5 J0 F3000\nG2 I0.5 J0 F3000\n\nM221 R; pop softend status\nG1 Z10 F1200\nM400\nG1 Z10\nG1 F30000\nG1 X230 Y15\nG29.2 S1 ; turn on ABL\n;G28 ; home again after hard wipe mouth\nM106 S0 ; turn off fan , too noisy\n;===== wipe nozzle end ================================\n\n\n;===== bed leveling ==================================\nM1002 judge_flag g29_before_print_flag\nM622 J1\n\n    M1002 gcode_claim_action : 1\n    G29 A X{first_layer_print_min[0]} Y{first_layer_print_min[1]} I{first_layer_print_size[0]} J{first_layer_print_size[1]}\n    M400\n    M500 ; save cali data\n\nM623\n;===== bed leveling end ================================\n\n;===== home after wipe mouth============================\nM1002 judge_flag g29_before_print_flag\nM622 J0\n\n    M1002 gcode_claim_action : 13\n    G28\n\nM623\n;===== home after wipe mouth end =======================\n\nM975 S1 ; turn on vibration supression\n\n\n;=============turn on fans to prevent PLA jamming=================\n{if filament_type[initial_extruder]=="PLA"}\n    {if (bed_temperature[initial_extruder] >45)||(bed_temperature_initial_layer[initial_extruder] >45)}\n    M106 P3 S180\n    {elsif (bed_temperature[initial_extruder] >50)||(bed_temperature_initial_layer[initial_extruder] >50)}\n    M106 P3 S255\n    {endif};Prevent PLA from jamming\n{endif}\nM106 P2 S100 ; turn on big fan ,to cool down toolhead\n\n\nM104 S{nozzle_temperature_initial_layer[initial_extruder]} ; set extrude temp earlier, to reduce wait time\n\n;===== mech mode fast check============================\nG1 X128 Y128 Z10 F20000\nM400 P200\nM970.3 Q1 A7 B30 C80  H15 K0\nM974 Q1 S2 P0\n\nG1 X128 Y128 Z10 F20000\nM400 P200\nM970.3 Q0 A7 B30 C90 Q0 H15 K0\nM974 Q0 S2 P0\n\nM975 S1\nG1 F30000\nG1 X230 Y15\nG28 X ; re-home XY\n;===== fmech mode fast check============================\n\n\n;===== noozle load line ===============================\nM975 S1\nG90\nM83\nT1000\nG1 X18.0 Y1.0 Z0.8 F18000;Move to start position\nM109 S{nozzle_temperature_initial_layer[initial_extruder]}\nG1 Z0.2\nG0 E2 F300\nG0 X240 E15 F{outer_wall_volumetric_speed/(0.3*0.5)     * 60}\nG0 Y11 E0.700 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\nG0 X239.5\nG0 E0.2\nG0 Y1.5 E0.700\nG0 X18 E15 F{outer_wall_volumetric_speed/(0.3*0.5)     * 60}\nM400\n\n;===== for Textured PEI Plate , lower the nozzle as the nozzle was touching topmost of the texture when homing ==\n;curr_bed_type={curr_bed_type}\n{if curr_bed_type=="Textured PEI Plate"}\nG29.1 Z{-0.04} ; for Textured PEI Plate\n{endif}\n;========turn off light and wait extrude temperature =============\nM1002 gcode_claim_action : 0\nM106 S0 ; turn off fan\nM106 P2 S0 ; turn off big fan\nM106 P3 S0 ; turn off chamber fan\n\nM975 S1 ; turn on mech mode supression
; machine_unload_filament_time = 28
; max_bridge_length = 10
; max_layer_height = 0.28
; max_travel_detour_distance = 0
; min_bead_width = 85%
; min_feature_size = 25%
; min_layer_height = 0.08
; minimum_sparse_infill_area = 15
; nozzle_diameter = 0.4
; nozzle_hrc = 20
; nozzle_temperature = 220
; nozzle_temperature_initial_layer = 220
; nozzle_temperature_range_high = 240
; nozzle_temperature_range_low = 190
; nozzle_type = stainless_steel
; nozzle_volume = 107
; only_one_wall_top = 1
; ooze_prevention = 0
; outer_wall_acceleration = 5000
; outer_wall_line_width = 0.42
; outer_wall_speed = 200
; overhang_1_4_speed = 0
; overhang_2_4_speed = 50
; overhang_3_4_speed = 30
; overhang_4_4_speed = 10
; overhang_fan_speed = 100
; overhang_fan_threshold = 50%
; post_process = 
; prime_tower_brim_width = 3
; prime_tower_width = 35
; prime_volume = 45
; print_compatible_printers = "Bambu Lab P1P 0.4 nozzle"
; print_host = 
; print_sequence = by layer
; print_settings_id = 0.20mm Standard @BBL P1P
; printable_area = 0x0,256x0,256x256,0x256
; printable_height = 250
; printer_model = Bambu Lab P1P
; printer_settings_id = Bambu Lab P1P 0.4 nozzle
; printer_technology = FFF
; printer_variant = 0.4
; printhost_apikey = 
; printhost_authorization_type = key
; printhost_cafile = 
; printhost_password = 
; printhost_port = 
; printhost_ssl_ignore_revoke = 0
; printhost_user = 
; raft_contact_distance = 0.1
; raft_expansion = 1.5
; raft_first_layer_density = 90%
; raft_first_layer_expansion = 2
; raft_layers = 0
; reduce_crossing_wall = 0
; reduce_fan_stop_start_freq = 1
; reduce_infill_retraction = 1
; required_nozzle_HRC = 3
; resolution = 0.012
; retract_before_wipe = 0%
; retract_length_toolchange = 2
; retract_restart_extra = 0
; retract_restart_extra_toolchange = 0
; retract_when_changing_layer = 1
; retraction_length = 0.8
; retraction_minimum_travel = 1
; retraction_speed = 30
; scan_first_layer = 0
; seam_position = aligned
; silent_mode = 0
; single_extruder_multi_material = 1
; skirt_distance = 2
; skirt_height = 1
; skirt_loops = 0
; slice_closing_radius = 0.049
; slicing_mode = regular
; slow_down_for_layer_cooling = 1
; slow_down_layer_time = 8
; slow_down_min_speed = 20
; solid_infill_filament = 1
; sparse_infill_density = 15%
; sparse_infill_filament = 1
; sparse_infill_line_width = 0.45
; sparse_infill_pattern = grid
; sparse_infill_speed = 270
; spiral_mode = 0
; standby_temperature_delta = -5
; start_end_points = 30x-3,54x245
; support_angle = 0
; support_base_pattern = default
; support_base_pattern_spacing = 2.5
; support_bottom_interface_spacing = 0.5
; support_bottom_z_distance = 0.2
; support_critical_regions_only = 0
; support_expansion = 0
; support_filament = 0
; support_interface_bottom_layers = 2
; support_interface_filament = 0
; support_interface_loop_pattern = 0
; support_interface_pattern = auto
; support_interface_spacing = 0.5
; support_interface_speed = 80
; support_interface_top_layers = 2
; support_line_width = 0.42
; support_object_xy_distance = 0.35
; support_on_build_plate_only = 0
; support_speed = 150
; support_style = default
; support_threshold_angle = 30
; support_top_z_distance = 0.2
; support_type = tree(manual)
; temperature_vitrification = 55
; template_custom_gcode = 
; textured_plate_temp = 65
; textured_plate_temp_initial_layer = 65
; thick_bridges = 0
; timelapse_type = 0
; top_shell_layers = 3
; top_shell_thickness = 0.6
; top_surface_acceleration = 2000
; top_surface_line_width = 0.42
; top_surface_pattern = monotonicline
; top_surface_speed = 200
; travel_speed = 500
; travel_speed_z = 0
; tree_support_branch_angle = 45
; tree_support_branch_diameter = 2
; tree_support_branch_distance = 5
; tree_support_wall_count = 1
; upward_compatible_machine = "Bambu Lab X1 0.4 nozzle";"Bambu Lab X1 Carbon 0.4 nozzle"
; wall_distribution_count = 1
; wall_filament = 1
; wall_generator = classic
; wall_infill_order = inner wall/outer wall/infill
; wall_loops = 2
; wall_transition_angle = 10
; wall_transition_filter_deviation = 25%
; wall_transition_length = 100%
; wipe = 1
; wipe_distance = 2
; wipe_tower_no_sparse_layers = 0
; wipe_tower_rotation_angle = 0
; wipe_tower_x = 155
; wipe_tower_y = 220
; xy_contour_compensation = 0
; xy_hole_compensation = 0
; z_hop = 0.4
; z_hop_types = Spiral Lift
; CONFIG_BLOCK_END

; EXECUTABLE_BLOCK_START
M73 P0 R20
M201 X20000 Y20000 Z500 E5000
M203 X500 Y500 Z20 E30
M204 P20000 R5000 T20000
M205 X9.00 Y9.00 Z3.00 E2.50
M106 S0
M106 P2 S0
; FEATURE: Custom
;===== machine: P1P ========================
;===== date: 20230425 =====================
;===== turn on the HB fan =================
M104 S75 ;set extruder temp to turn on the HB fan and prevent filament oozing from nozzle
;===== reset machine status =================
G91
M17 Z0.4 ; lower the z-motor current
G0 Z12 F300 ; lower the hotbed , to prevent the nozzle is below the hotbed
G0 Z-6;
G90
M17 X1.2 Y1.2 Z0.75 ; reset motor current to default
M960 S5 P1 ; turn on logo lamp
G90
M220 S100 ;Reset Feedrate
M221 S100 ;Reset Flowrate
M73.2   R1.0 ;Reset left time magnitude
M1002 set_gcode_claim_speed_level : 5
M221 X0 Y0 Z0 ; turn off soft endstop to prevent protential logic problem
G29.1 Z0 ; clear z-trim value first

;===== heatbed preheat ====================
M1002 gcode_claim_action : 2
M140 S65 ;set bed temp
M190 S65 ;wait for bed temp



;=============turn on fans to prevent PLA jamming=================

    
    M106 P3 S180
    ;Prevent PLA from jamming

M106 P2 S100 ; turn on big fan ,to cool down toolhead

;===== prepare print temperature and material ==========
M104 S220 ;set extruder temp
G91
G0 Z10 F1200
G90
G28 X
M975 S1 ; turn on
G1 X60 F12000
M73 P21 R16
G1 Y245
G1 Y265 F3000
M620 M
M620 S0A   ; switch material if AMS exist
    M109 S220
    G1 X120 F12000

    G1 X20 Y50 F12000
    G1 Y-3
    T0
M73 P21 R15
    G1 X54 F12000
    G1 Y265
    M400
M621 S0A
M620.1 E F523.843 T240


M412 S1 ; ===turn on filament runout detection===

M109 S250 ;set nozzle to common flush temp
M106 P1 S0
G92 E0
G1 E50 F200
M400
M104 S220
G92 E0
G1 E50 F200
M400
M106 P1 S255
G92 E0
G1 E5 F300
M109 S200 ; drop nozzle temp, make filament shink a bit
G92 E0
G1 E-0.5 F300

G1 X70 F9000
M73 P23 R15
G1 X76 F15000
M73 P24 R15
G1 X65 F15000
G1 X76 F15000
G1 X65 F15000; shake to put down garbage
G1 X80 F6000
G1 X95 F15000
G1 X80 F15000
G1 X165 F15000; wipe and shake
M400
M106 P1 S0
;===== prepare print temperature and material end =====


;===== wipe nozzle ===============================
M1002 gcode_claim_action : 14
M975 S1
M106 S255
G1 X65 Y230 F18000
G1 Y264 F6000
M109 S200
G1 X100 F18000 ; first wipe mouth

G0 X135 Y253 F20000  ; move to exposed steel surface edge
G28 Z P0 T300; home z with low precision,permit 300deg temperature
G29.2 S0 ; turn off ABL
G0 Z5 F20000

G1 X60 Y265
G92 E0
G1 E-0.5 F300 ; retrack more
G1 X100 F5000; second wipe mouth
G1 X70 F15000
G1 X100 F5000
G1 X70 F15000
G1 X100 F5000
G1 X70 F15000
G1 X100 F5000
G1 X70 F15000
G1 X90 F5000
G0 X128 Y261 Z-1.5 F20000  ; move to exposed steel surface and stop the nozzle
M104 S140 ; set temp down to heatbed acceptable
M106 S255 ; turn on fan (G28 has turn off fan)

M221 S; push soft endstop status
M221 Z0 ;turn off Z axis endstop
G0 Z0.5 F20000
G0 X125 Y259.5 Z-1.01
G0 X131 F211
G0 X124
G0 Z0.5 F20000
G0 X125 Y262.5
G0 Z-1.01
G0 X131 F211
G0 X124
G0 Z0.5 F20000
G0 X125 Y260.0
G0 Z-1.01
G0 X131 F211
G0 X124
G0 Z0.5 F20000
G0 X125 Y262.0
G0 Z-1.01
G0 X131 F211
G0 X124
G0 Z0.5 F20000
G0 X125 Y260.5
G0 Z-1.01
G0 X131 F211
G0 X124
G0 Z0.5 F20000
G0 X125 Y261.5
G0 Z-1.01
G0 X131 F211
G0 X124
G0 Z0.5 F20000
G0 X125 Y261.0
G0 Z-1.01
G0 X131 F211
G0 X124
G0 X128
G2 I0.5 J0 F300
G2 I0.5 J0 F300
G2 I0.5 J0 F300
G2 I0.5 J0 F300

M109 S140 ; wait nozzle temp down to heatbed acceptable
G2 I0.5 J0 F3000
G2 I0.5 J0 F3000
G2 I0.5 J0 F3000
M73 P25 R15
G2 I0.5 J0 F3000

M221 R; pop softend status
G1 Z10 F1200
M400
G1 Z10
G1 F30000
G1 X230 Y15
G29.2 S1 ; turn on ABL
;G28 ; home again after hard wipe mouth
M106 S0 ; turn off fan , too noisy
;===== wipe nozzle end ================================


;===== bed leveling ==================================
M1002 judge_flag g29_before_print_flag
M622 J1

    M1002 gcode_claim_action : 1
    G29 A X119.058 Y104.617 I23.2326 J29.1593
    M400
    M500 ; save cali data

M623
;===== bed leveling end ================================

;===== home after wipe mouth============================
M1002 judge_flag g29_before_print_flag
M622 J0

    M1002 gcode_claim_action : 13
    G28

M623
;===== home after wipe mouth end =======================

M975 S1 ; turn on vibration supression


;=============turn on fans to prevent PLA jamming=================

    
    M106 P3 S180
    ;Prevent PLA from jamming

M106 P2 S100 ; turn on big fan ,to cool down toolhead


M104 S220 ; set extrude temp earlier, to reduce wait time

;===== mech mode fast check============================
G1 X128 Y128 Z10 F20000
M400 P200
M970.3 Q1 A7 B30 C80  H15 K0
M974 Q1 S2 P0

G1 X128 Y128 Z10 F20000
M400 P200
M970.3 Q0 A7 B30 C90 Q0 H15 K0
M974 Q0 S2 P0

M975 S1
G1 F30000
G1 X230 Y15
G28 X ; re-home XY
;===== fmech mode fast check============================


;===== noozle load line ===============================
M975 S1
G90
M83
T1000
G1 X18.0 Y1.0 Z0.8 F18000;Move to start position
M109 S220
G1 Z0.2
G0 E2 F300
G0 X240 E15 F6033.27
G0 Y11 E0.700 F1508.32
G0 X239.5
G0 E0.2
G0 Y1.5 E0.700
G0 X18 E15 F6033.27
M400

;===== for Textured PEI Plate , lower the nozzle as the nozzle was touching topmost of the texture when homing ==
;curr_bed_type=Textured PEI Plate

G29.1 Z-0.04 ; for Textured PEI Plate

;========turn off light and wait extrude temperature =============
M1002 gcode_claim_action : 0
M106 S0 ; turn off fan
M106 P2 S0 ; turn off big fan
M106 P3 S0 ; turn off chamber fan

M975 S1 ; turn on mech mode supression
G90
G21
M83 ; only support relative e
; filament start gcode
M106 P3 S255
M981 S1 P20000 ;open spaghetti detector
M106 S0
M106 P2 S0
; CHANGE_LAYER
; Z_HEIGHT: 0.2
; LAYER_HEIGHT: 0.2
G1 E-.8 F1800
; layer num/total_layer_count: 1/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L1
M991 S0 P0 ;notify layer change
M204 S500
G1 X121.517 Y104.823 F30000
G1 Z.4
G1 Z.2
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.5
M73 P26 R15
G1 F3000
G3 X125.694 Y102.855 I3.881 J2.822 E.17941
G3 X129.344 Y110.348 I-.316 J4.79 E.37599
G1 X122.828 Y110.348 E.24273
G1 X122.694 Y110.482 E.00705
G1 X122.694 Y117.405 E.25785
G3 X120.821 Y109.303 I1.403 J-4.592 E.3745
G3 X120.609 Y107.338 I17.873 J-2.921 E.07363
G3 X121.482 Y104.872 I4.789 J.307 E.0987
M73 P26 R14
G1 X121.874 Y105.138 F30000
G1 F3000
G1 X122.058 Y104.881 E.01179
G3 X125.665 Y103.312 I3.35 J2.772 E.15201
G3 X129.096 Y109.891 I-.275 J4.328 E.33163
G1 X122.638 Y109.891 E.24053
G1 X122.237 Y110.293 E.02116
G1 X122.237 Y116.763 E.24101
G3 X121.232 Y109.537 I1.893 J-3.946 E.32125
M73 P27 R14
G2 X121.193 Y108.717 I-.713 J-.377 E.03208
G3 X121.6 Y105.554 I4.216 J-1.065 E.12163
G1 X121.841 Y105.188 E.01632
G1 X122.216 Y105.443 F30000
G1 F3000
G1 X122.41 Y105.172 E.01243
G3 X125.636 Y103.768 I2.997 J2.479 E.13598
G3 X128.829 Y109.434 I-.257 J3.877 E.28698
G1 X122.449 Y109.434 E.23765
G1 X121.857 Y110.026 E.03118
G1 X121.779 Y109.982 E.00332
G1 X121.779 Y115.958 E.22261
G3 X121.644 Y109.772 I2.352 J-3.146 E.26539
G2 X121.636 Y108.604 I-.992 J-.577 E.04566
G3 X122 Y105.774 I3.771 J-.953 E.1088
G1 X122.184 Y105.493 E.01248
G1 X122.579 Y105.711 F30000
G1 F3000
G1 X122.626 Y105.629 E.00352
G3 X125.608 Y104.225 I2.78 J2.035 E.128
G3 X128.546 Y108.977 I-.231 J3.427 E.24302
G1 X122.22 Y108.977 E.23559
G3 X122.209 Y106.379 I3.186 J-1.313 E.09922
G1 X122.55 Y105.764 E.02619
M73 P28 R14
G1 X122.942 Y106.012 F30000
G1 F3000
G1 X123.11 Y105.751 E.01158
G3 X125.579 Y104.681 I2.285 J1.889 E.10402
G3 X128.222 Y108.52 I-.189 J2.959 E.19971
G1 X122.564 Y108.52 E.21075
G3 X122.712 Y106.378 I2.831 J-.88 E.08183
G1 X122.91 Y106.063 E.01385
G1 X123.28 Y106.298 F30000
G1 F3000
G3 X125.55 Y105.137 I2.126 J1.358 E.09958
G3 X127.869 Y108.063 I-.174 J2.52 E.15647
G1 X122.916 Y108.063 E.18449
G3 X123.248 Y106.349 I2.489 J-.407 E.06639
G1 X123.637 Y106.631 F30000
G1 F3000
G1 X123.99 Y106.146 E.02237
G3 X125.522 Y105.594 I1.407 J1.504 E.06232
G3 X127.447 Y107.606 I-.136 J2.057 E.11387
G1 X123.338 Y107.606 E.15303
G3 X123.537 Y106.766 I2.059 J.044 E.03238
G1 X123.601 Y106.679 E.004
G1 X123.996 Y106.912 F30000
G1 F3000
G1 X124.161 Y106.62 E.01251
G3 X125.493 Y106.05 I1.245 J1.069 E.05588
G3 X126.929 Y107.148 I-.121 J1.646 E.07125
G1 X123.857 Y107.148 E.11442
G1 X123.966 Y106.964 E.00797
G1 X121.322 Y111.315 F30000
G1 F3000
G1 X121.322 Y114.322 E.112
G1 X121.031 Y114.382 E.01109
G3 X121.031 Y111.255 I3.166 J-1.564 E.12069
G1 X121.264 Y111.303 E.00885
; WIPE_START
G1 F24000
G1 X121.303 Y113.302 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I.477 J1.119 P1  F30000
G1 X135.733 Y107.148 Z.6
G1 Z.2
G1 E.8 F1800
G1 F3000
G3 X137.369 Y106.05 I1.549 J.54 E.07872
G3 X138.805 Y107.148 I-.121 J1.646 E.07125
G1 X135.793 Y107.148 E.11218
G1 X135.349 Y107.043 F30000
G1 F3000
G1 X135.414 Y106.766 E.01058
G3 X137.398 Y105.594 I1.861 J.884 E.09109
G3 X139.323 Y107.606 I-.136 J2.057 E.11387
G1 X135.215 Y107.606 E.15303
G1 X135.335 Y107.101 E.01932
G1 X134.857 Y107.01 F30000
G1 F3000
G1 X134.887 Y106.865 E.0055
G3 X137.426 Y105.137 I2.395 J.791 E.12302
G3 X139.746 Y108.063 I-.174 J2.52 E.15647
G1 X134.792 Y108.063 E.18449
G3 X134.765 Y107.482 I2.489 J-.407 E.02171
G1 X134.846 Y107.069 E.01567
G1 X134.409 Y106.927 F30000
G1 F3000
G1 X134.589 Y106.378 E.02151
G3 X137.455 Y104.681 I2.683 J1.262 E.13175
G3 X140.098 Y108.52 I-.189 J2.959 E.19971
G1 X134.44 Y108.52 E.21075
G3 X134.359 Y107.084 I2.831 J-.88 E.0541
G1 X134.391 Y106.984 E.00391
G1 X133.961 Y106.874 F30000
G1 F3000
G1 X134.093 Y106.382 E.01897
G3 X137.484 Y104.225 I3.189 J1.27 E.1599
G3 X140.422 Y108.977 I-.231 J3.427 E.24302
G1 X134.116 Y108.977 E.23487
G3 X133.878 Y107.211 I3.166 J-1.325 E.06714
G1 X133.947 Y106.932 E.0107
G1 X133.503 Y106.847 F30000
G1 F3000
G1 X133.587 Y106.443 E.01539
G3 X137.513 Y103.768 I3.693 J1.203 E.19035
G3 X140.705 Y109.434 I-.257 J3.877 E.28698
G1 X133.833 Y109.434 E.25599
G3 X133.404 Y107.396 I3.448 J-1.788 E.07852
G1 X133.492 Y106.906 E.01853
G1 X133.033 Y106.803 F30000
G1 F3000
G1 X133.148 Y106.3 E.01924
G3 X137.541 Y103.312 I4.124 J1.339 E.21302
G3 X140.836 Y110.121 I-.282 J4.338 E.34173
G1 X140.606 Y109.891 E.01212
M73 P29 R14
G1 X133.566 Y109.891 E.26223
G3 X132.97 Y107.096 I3.706 J-2.252 E.10847
G1 X133.02 Y106.862 E.00891
G1 X132.572 Y106.791 F30000
G1 F3000
G1 X132.635 Y106.449 E.01295
G3 X137.57 Y102.855 I4.647 J1.196 E.24644
G3 X140.551 Y111.133 I-.305 J4.785 E.41488
G1 X140.551 Y110.482 E.02424
G1 X140.417 Y110.348 E.00705
G1 X133.318 Y110.348 E.26442
G3 X132.494 Y107.339 I3.965 J-2.703 E.11836
G1 X132.563 Y106.851 E.01836
; WIPE_START
G1 F24000
G1 X132.635 Y106.449 E-.15489
G1 X133.069 Y105.33 E-.45615
G1 X133.299 Y105.013 E-.14897
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-.983 J.718 P1  F30000
G1 X139.265 Y113.177 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3000
G1 X139.265 Y113.634 E.01702
G1 X141.265 Y113.634 E.07449
G1 X141.265 Y128.919 E.56934
G1 X139.265 Y128.919 E.07449
G1 X139.265 Y130.919 E.07449
G1 X123.979 Y130.919 E.56934
G1 X123.979 Y111.634 E.71832
G1 X139.265 Y111.634 E.56934
G1 X139.265 Y113.117 E.05523
G1 X139.722 Y113.177 F30000
; FEATURE: Outer wall
G1 F3000
G1 X141.722 Y113.177 E.07449
G1 X141.722 Y129.377 E.60339
G1 X139.722 Y129.377 E.07449
G1 X139.722 Y131.377 E.07449
G1 X123.522 Y131.377 E.60339
G1 X123.522 Y111.177 E.75237
G1 X139.722 Y111.177 E.60339
G1 X139.722 Y113.117 E.07226
G1 X140.149 Y113.816 F30000
; FEATURE: Bottom surface
; LINE_WIDTH: 0.504331
G1 F6300
G1 X140.877 Y114.544 E.03868
G1 X140.877 Y115.196 E.02453
G1 X139.497 Y113.816 E.07338
; WIPE_START
G1 F24000
G1 X140.877 Y115.196 E-.74162
G1 X140.877 Y115.148 E-.01838
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I.974 J-.729 P1  F30000
G1 X139.082 Y112.75 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6300
G1 X138.355 Y112.022 E.03868
G1 X137.702 Y112.022 E.02453
G1 X139.082 Y113.402 E.07338
; WIPE_START
G1 F24000
G1 X137.702 Y112.022 E-.74162
G1 X137.751 Y112.022 E-.01838
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I.269 J-1.187 P1  F30000
G1 X136.844 Y111.816 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6300
G1 X140.877 Y115.849 E.21442
G1 X140.877 Y116.501 E.02453
G1 X136.397 Y112.022 E.23818
G1 X135.745 Y112.022 E.02453
G1 X140.877 Y117.154 E.27288
G1 X140.877 Y117.807 E.02453
G1 X135.092 Y112.022 E.30758
G1 X134.44 Y112.022 E.02453
G1 X140.877 Y118.459 E.34228
G1 X140.877 Y119.112 E.02453
G1 X133.787 Y112.022 E.37697
G1 X133.135 Y112.022 E.02453
G1 X140.877 Y119.764 E.41167
G1 X140.877 Y120.417 E.02453
G1 X132.482 Y112.022 E.44637
G1 X131.829 Y112.022 E.02453
G1 X140.877 Y121.069 E.48107
G1 X140.877 Y121.722 E.02453
G1 X131.177 Y112.022 E.51576
G1 X130.524 Y112.022 E.02453
G1 X140.877 Y122.374 E.55046
G1 X140.877 Y123.027 E.02453
G1 X129.872 Y112.022 E.58516
G1 X129.219 Y112.022 E.02453
G1 X140.877 Y123.679 E.61985
G1 X140.877 Y124.332 E.02453
G1 X128.567 Y112.022 E.65455
G1 X127.914 Y112.022 E.02453
G1 X140.877 Y124.984 E.68925
G1 X140.877 Y125.637 E.02453
G1 X127.262 Y112.022 E.72395
G1 X126.609 Y112.022 E.02453
G1 X140.877 Y126.29 E.75864
G1 X140.877 Y126.942 E.02453
G1 X125.957 Y112.022 E.79334
G1 X125.304 Y112.022 E.02453
G1 X140.877 Y127.595 E.82804
G1 X140.877 Y128.247 E.02453
G1 X124.652 Y112.022 E.86274
G1 X124.368 Y112.022 E.01067
G1 X124.368 Y112.391 E.01386
G1 X140.508 Y128.531 E.85822
G1 X139.855 Y128.531 E.02453
G1 X124.368 Y113.043 E.82353
G1 X124.368 Y113.696 E.02453
G1 X139.203 Y128.531 E.78883
G1 X138.877 Y128.531 E.01227
G1 X138.877 Y128.857 E.01227
G1 X124.368 Y114.348 E.77148
G1 X124.368 Y115.001 E.02453
G1 X138.877 Y129.51 E.77148
G1 X138.877 Y130.162 E.02453
G1 X124.368 Y115.653 E.77148
G1 X124.368 Y116.306 E.02453
G1 X138.593 Y130.531 E.75639
G1 X137.94 Y130.531 E.02453
G1 X124.368 Y116.959 E.72169
M73 P30 R14
G1 X124.368 Y117.611 E.02453
G1 X137.288 Y130.531 E.68699
G1 X136.635 Y130.531 E.02453
G1 X124.368 Y118.264 E.65229
G1 X124.368 Y118.916 E.02453
G1 X135.983 Y130.531 E.6176
G1 X135.33 Y130.531 E.02453
G1 X124.368 Y119.569 E.5829
G1 X124.368 Y120.221 E.02453
G1 X134.677 Y130.531 E.5482
G1 X134.025 Y130.531 E.02453
G1 X124.368 Y120.874 E.5135
G1 X124.368 Y121.526 E.02453
G1 X133.372 Y130.531 E.47881
G1 X132.72 Y130.531 E.02453
G1 X124.368 Y122.179 E.44411
G1 X124.368 Y122.831 E.02453
G1 X132.067 Y130.531 E.40941
G1 X131.415 Y130.531 E.02453
G1 X124.368 Y123.484 E.37471
G1 X124.368 Y124.136 E.02453
G1 X130.762 Y130.531 E.34002
G1 X130.11 Y130.531 E.02453
G1 X124.368 Y124.789 E.30532
G1 X124.368 Y125.441 E.02453
G1 X129.457 Y130.531 E.27062
G1 X128.805 Y130.531 E.02453
G1 X124.368 Y126.094 E.23593
G1 X124.368 Y126.747 E.02453
G1 X128.152 Y130.531 E.20123
G1 X127.5 Y130.531 E.02453
G1 X124.368 Y127.399 E.16653
G1 X124.368 Y128.052 E.02453
G1 X126.847 Y130.531 E.13183
G1 X126.195 Y130.531 E.02453
G1 X124.368 Y128.704 E.09714
G1 X124.368 Y129.357 E.02453
G1 X125.542 Y130.531 E.06244
G1 X124.889 Y130.531 E.02453
G1 X124.162 Y129.804 E.03868
M106 S252.45
M106 P2 S178
; CHANGE_LAYER
; Z_HEIGHT: 0.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X124.889 Y130.531 E-.39091
G1 X125.542 Y130.531 E-.24796
G1 X125.317 Y130.306 E-.12113
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 2/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L2
M991 S0 P1 ;notify layer change
; open powerlost recovery
M1003 S1
M204 S10000
G17
G3 Z.6 I.941 J.772 P1  F30000
G1 X139.52 Y112.987 Z.6
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7899
G1 X139.52 Y113.379 E.01301
G1 X141.52 Y113.379 E.06634
G1 X141.52 Y129.174 E.52398
G1 X139.52 Y129.174 E.06634
G1 X139.52 Y131.174 E.06634
G1 X123.724 Y131.174 E.52398
G1 X123.724 Y111.379 E.65666
G1 X139.52 Y111.379 E.52398
G1 X139.52 Y112.927 E.05135
G1 X139.912 Y112.987 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7899
G1 X141.912 Y112.987 E.06145
G1 X141.912 Y129.567 E.50946
G1 X139.912 Y129.567 E.06145
G1 X139.912 Y131.567 E.06145
G1 X123.332 Y131.567 E.50946
G1 X123.332 Y110.987 E.63237
G1 X139.912 Y110.987 E.50946
G1 X139.912 Y112.927 E.05961
M204 S10000
; WIPE_START
G1 F24000
M73 P31 R14
G1 X141.911 Y112.986 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I.102 J-1.213 P1  F30000
G1 X124.658 Y111.542 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423808
G1 F7899
G1 X124.058 Y112.143 E.02636
G1 X124.058 Y112.681 E.01672
G1 X125.027 Y111.712 E.04256
G1 X125.566 Y111.712 E.01672
G1 X124.058 Y113.22 E.0662
G1 X124.058 Y113.759 E.01672
G1 X126.104 Y111.712 E.08985
G1 X126.643 Y111.712 E.01672
G1 X124.058 Y114.297 E.11349
G1 X124.058 Y114.836 E.01672
G1 X127.182 Y111.712 E.13713
G1 X127.72 Y111.712 E.01672
G1 X124.058 Y115.375 E.16078
G1 X124.058 Y115.913 E.01672
G1 X128.259 Y111.712 E.18442
G1 X128.798 Y111.712 E.01672
G1 X124.058 Y116.452 E.20806
G1 X124.058 Y116.991 E.01672
G1 X129.336 Y111.712 E.23171
G1 X129.875 Y111.712 E.01672
G1 X124.058 Y117.529 E.25535
G1 X124.058 Y118.068 E.01672
G1 X130.414 Y111.712 E.27899
G1 X130.952 Y111.712 E.01672
G1 X124.058 Y118.607 E.30264
G1 X124.058 Y119.145 E.01672
G1 X131.491 Y111.712 E.32628
G1 X132.03 Y111.712 E.01672
G1 X124.058 Y119.684 E.34993
G1 X124.058 Y120.223 E.01672
G1 X132.568 Y111.712 E.37357
G1 X133.107 Y111.712 E.01672
G1 X124.058 Y120.761 E.39721
G1 X124.058 Y121.3 E.01672
G1 X133.646 Y111.712 E.42086
G1 X134.184 Y111.712 E.01672
G1 X124.058 Y121.839 E.4445
G1 X124.058 Y122.377 E.01672
G1 X134.723 Y111.712 E.46814
G1 X135.262 Y111.712 E.01672
G1 X124.058 Y122.916 E.49179
G1 X124.058 Y123.455 E.01672
G1 X135.8 Y111.712 E.51543
G1 X136.339 Y111.712 E.01672
G1 X124.058 Y123.993 E.53908
G1 X124.058 Y124.532 E.01672
G1 X136.878 Y111.712 E.56272
G1 X137.416 Y111.712 E.01672
G1 X124.058 Y125.071 E.58636
G1 X124.058 Y125.609 E.01672
G1 X137.955 Y111.712 E.61001
G1 X138.494 Y111.712 E.01672
G1 X124.058 Y126.148 E.63365
G1 X124.058 Y126.687 E.01672
G1 X139.032 Y111.712 E.65729
G1 X139.187 Y111.712 E.0048
G1 X139.187 Y112.096 E.01192
G1 X124.058 Y127.225 E.66408
G1 X124.058 Y127.764 E.01672
G1 X139.187 Y112.635 E.66408
G1 X139.187 Y113.173 E.01672
G1 X124.058 Y128.302 E.66408
G1 X124.058 Y128.841 E.01672
G1 X139.187 Y113.712 E.66408
G1 X139.725 Y113.712 E.01672
G1 X124.058 Y129.38 E.68772
G1 X124.058 Y129.918 E.01672
G1 X140.264 Y113.712 E.71137
G1 X140.803 Y113.712 E.01672
G1 X124.058 Y130.457 E.73501
G1 X124.058 Y130.841 E.01192
G1 X124.212 Y130.841 E.0048
G1 X141.187 Y113.866 E.74508
G1 X141.187 Y114.405 E.01672
G1 X124.751 Y130.841 E.72144
G1 X125.289 Y130.841 E.01672
G1 X141.187 Y114.944 E.6978
G1 X141.187 Y115.482 E.01672
G1 X125.828 Y130.841 E.67415
G1 X126.367 Y130.841 E.01672
G1 X141.187 Y116.021 E.65051
M73 P31 R13
G1 X141.187 Y116.56 E.01672
G1 X126.905 Y130.841 E.62687
G1 X127.444 Y130.841 E.01672
G1 X141.187 Y117.098 E.60322
G1 X141.187 Y117.637 E.01672
G1 X127.983 Y130.841 E.57958
G1 X128.521 Y130.841 E.01672
G1 X141.187 Y118.176 E.55593
G1 X141.187 Y118.714 E.01672
G1 X129.06 Y130.841 E.53229
G1 X129.599 Y130.841 E.01672
G1 X141.187 Y119.253 E.50865
G1 X141.187 Y119.792 E.01672
G1 X130.137 Y130.841 E.485
G1 X130.676 Y130.841 E.01672
G1 X141.187 Y120.33 E.46136
G1 X141.187 Y120.869 E.01672
G1 X131.215 Y130.841 E.43772
G1 X131.753 Y130.841 E.01672
G1 X141.187 Y121.408 E.41407
G1 X141.187 Y121.946 E.01672
G1 X132.292 Y130.841 E.39043
G1 X132.831 Y130.841 E.01672
G1 X141.187 Y122.485 E.36678
G1 X141.187 Y123.024 E.01672
G1 X133.369 Y130.841 E.34314
G1 X133.908 Y130.841 E.01672
G1 X141.187 Y123.562 E.3195
G1 X141.187 Y124.101 E.01672
G1 X134.447 Y130.841 E.29585
G1 X134.985 Y130.841 E.01672
G1 X141.187 Y124.64 E.27221
G1 X141.187 Y125.178 E.01672
G1 X135.524 Y130.841 E.24857
G1 X136.063 Y130.841 E.01672
G1 X141.187 Y125.717 E.22492
G1 X141.187 Y126.256 E.01672
G1 X136.601 Y130.841 E.20128
G1 X137.14 Y130.841 E.01672
G1 X141.187 Y126.794 E.17764
G1 X141.187 Y127.333 E.01672
G1 X139.679 Y128.841 E.0662
G1 X139.187 Y128.841 E.01526
G1 X139.187 Y129.333 E.01526
G1 X137.679 Y130.841 E.0662
G1 X138.217 Y130.841 E.01672
G1 X139.187 Y129.872 E.04256
G1 X139.187 Y130.41 E.01672
G1 X138.586 Y131.011 E.02637
G1 X140.048 Y129.011 F30000
G1 F7899
G1 X141.187 Y127.872 E.05001
G1 X141.187 Y128.41 E.01672
G1 X140.586 Y129.011 E.02637
; CHANGE_LAYER
; Z_HEIGHT: 0.476667
; LAYER_HEIGHT: 0.0766667
; WIPE_START
G1 F24000
G1 X141.187 Y128.41 E-.3228
G1 X141.187 Y127.872 E-.20469
G1 X140.754 Y128.304 E-.23251
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 3/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L3
M991 S0 P2 ;notify layer change
G17
G3 Z.8 I.736 J-.969 P1  F30000
G1 X122.542 Y114.481 Z.8
G1 Z.477
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.276667
G1 F8368
G3 X122.542 Y111.156 I1.551 J-1.662 E.15156
G1 X122.542 Y114.421 E.1327
; WIPE_START
G1 F24000
G1 X122.031 Y113.783 E-.31059
G1 X121.886 Y113.382 E-.16201
G1 X121.815 Y112.819 E-.21577
G1 X121.839 Y112.631 E-.07163
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.877 I.865 J.856 P1  F30000
G1 X124.537 Y109.907 Z.877
G1 Z.477
G1 E.8 F1800
G1 F8368
G1 X124.201 Y109.716 E.01568
G3 X123.199 Y108.37 I1.21 J-1.947 E.06987
G3 X125.535 Y105.48 I2.234 J-.583 E.17554
G3 X124.842 Y109.99 I-.123 J2.289 E.31115
G1 X124.595 Y109.923 E.01044
; WIPE_START
G1 F24000
G1 X124.201 Y109.716 E-.16877
G1 X123.743 Y109.38 E-.21606
G1 X123.409 Y108.91 E-.21913
G1 X123.26 Y108.527 E-.15604
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.877 I.024 J1.217 P1  F30000
G1 X135.064 Y108.299 Z.877
G1 Z.477
G1 E.8 F1800
G1 F8368
G1 X135.005 Y107.938 E.01488
G3 X137.411 Y105.48 I2.303 J-.152 E.15774
G3 X135.075 Y108.369 I-.123 J2.289 E.40944
G1 X135.074 Y108.358 E.00044
; CHANGE_LAYER
; Z_HEIGHT: 0.6
; LAYER_HEIGHT: 0.123333
; WIPE_START
M73 P32 R13
G1 F24000
G1 X135.005 Y107.938 E-.16189
G1 X135.044 Y107.357 E-.22116
G1 X135.22 Y106.804 E-.2205
G1 X135.437 Y106.454 E-.15646
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 4/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L4
M991 S0 P3 ;notify layer change
G17
G3 Z.877 I-1.032 J.645 P1  F30000
G1 X139.52 Y112.987 Z.877
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F8368
G1 X139.52 Y113.379 E.01301
G1 X141.52 Y113.379 E.06634
G1 X141.52 Y129.174 E.52398
G1 X139.52 Y129.174 E.06634
G1 X139.52 Y131.174 E.06634
G1 X123.724 Y131.174 E.52398
G1 X123.724 Y111.379 E.65666
G1 X139.52 Y111.379 E.52398
G1 X139.52 Y112.927 E.05135
G1 X139.912 Y112.987 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8368
G1 X141.912 Y112.987 E.06145
G1 X141.912 Y129.567 E.50946
G1 X139.912 Y129.567 E.06145
G1 X139.912 Y131.567 E.06145
G1 X123.332 Y131.567 E.50946
G1 X123.332 Y110.987 E.63237
G1 X139.912 Y110.987 E.50946
G1 X139.912 Y112.927 E.05961
M204 S10000
; WIPE_START
G1 F24000
G1 X141.911 Y112.986 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I.485 J-1.116 P1  F30000
G1 X138.586 Y111.542 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423808
G1 F8368
G1 X139.187 Y112.143 E.02637
G1 X139.187 Y112.681 E.01672
G1 X138.217 Y111.712 E.04256
G1 X137.679 Y111.712 E.01672
G1 X139.187 Y113.22 E.0662
G1 X139.187 Y113.712 E.01526
G1 X139.679 Y113.712 E.01526
G1 X141.187 Y115.22 E.0662
G1 X141.187 Y114.681 E.01672
G1 X140.217 Y113.712 E.04256
G1 X140.756 Y113.712 E.01672
G1 X141.357 Y114.313 E.02637
G1 X141.357 Y115.928 F30000
G1 F8368
G1 X137.14 Y111.712 E.18508
G1 X136.601 Y111.712 E.01672
G1 X141.187 Y116.297 E.20128
G1 X141.187 Y116.836 E.01672
G1 X136.063 Y111.712 E.22492
G1 X135.524 Y111.712 E.01672
G1 X141.187 Y117.375 E.24857
G1 X141.187 Y117.913 E.01672
G1 X134.985 Y111.712 E.27221
G1 X134.447 Y111.712 E.01672
G1 X141.187 Y118.452 E.29585
G1 X141.187 Y118.991 E.01672
G1 X133.908 Y111.712 E.3195
G1 X133.369 Y111.712 E.01672
G1 X141.187 Y119.529 E.34314
G1 X141.187 Y120.068 E.01672
G1 X132.831 Y111.712 E.36678
G1 X132.292 Y111.712 E.01672
G1 X141.187 Y120.607 E.39043
G1 X141.187 Y121.145 E.01672
G1 X131.753 Y111.712 E.41407
G1 X131.215 Y111.712 E.01672
G1 X141.187 Y121.684 E.43772
G1 X141.187 Y122.223 E.01672
G1 X130.676 Y111.712 E.46136
G1 X130.137 Y111.712 E.01672
G1 X141.187 Y122.761 E.485
G1 X141.187 Y123.3 E.01672
G1 X129.599 Y111.712 E.50865
G1 X129.06 Y111.712 E.01672
G1 X141.187 Y123.839 E.53229
G1 X141.187 Y124.377 E.01672
G1 X128.521 Y111.712 E.55593
G1 X127.983 Y111.712 E.01672
G1 X141.187 Y124.916 E.57958
G1 X141.187 Y125.455 E.01672
G1 X127.444 Y111.712 E.60322
G1 X126.905 Y111.712 E.01672
G1 X141.187 Y125.993 E.62687
G1 X141.187 Y126.532 E.01672
G1 X126.367 Y111.712 E.65051
G1 X125.828 Y111.712 E.01672
G1 X141.187 Y127.071 E.67415
G1 X141.187 Y127.609 E.01672
G1 X125.289 Y111.712 E.6978
G1 X124.751 Y111.712 E.01672
G1 X141.187 Y128.148 E.72144
G1 X141.187 Y128.687 E.01672
G1 X124.212 Y111.712 E.74508
G1 X124.058 Y111.712 E.0048
G1 X124.058 Y112.096 E.01192
G1 X140.803 Y128.841 E.73501
G1 X140.264 Y128.841 E.01672
G1 X124.058 Y112.635 E.71137
G1 X124.058 Y113.173 E.01672
G1 X139.725 Y128.841 E.68772
G1 X139.187 Y128.841 E.01672
G1 X124.058 Y113.712 E.66408
G1 X124.058 Y114.251 E.01672
G1 X139.187 Y129.38 E.66408
G1 X139.187 Y129.919 E.01672
G1 X124.058 Y114.789 E.66408
G1 X124.058 Y115.328 E.01672
G1 X139.187 Y130.457 E.66408
G1 X139.187 Y130.841 E.01192
G1 X139.032 Y130.841 E.0048
G1 X124.058 Y115.867 E.65729
G1 X124.058 Y116.405 E.01672
G1 X138.494 Y130.841 E.63365
G1 X137.955 Y130.841 E.01672
G1 X124.058 Y116.944 E.61001
G1 X124.058 Y117.482 E.01672
G1 X137.416 Y130.841 E.58636
G1 X136.878 Y130.841 E.01672
G1 X124.058 Y118.021 E.56272
G1 X124.058 Y118.56 E.01672
G1 X136.339 Y130.841 E.53908
G1 X135.8 Y130.841 E.01672
G1 X124.058 Y119.098 E.51543
G1 X124.058 Y119.637 E.01672
G1 X135.262 Y130.841 E.49179
G1 X134.723 Y130.841 E.01672
G1 X124.058 Y120.176 E.46814
G1 X124.058 Y120.714 E.01672
G1 X134.184 Y130.841 E.4445
G1 X133.646 Y130.841 E.01672
G1 X124.058 Y121.253 E.42086
G1 X124.058 Y121.792 E.01672
G1 X133.107 Y130.841 E.39721
G1 X132.568 Y130.841 E.01672
G1 X124.058 Y122.33 E.37357
G1 X124.058 Y122.869 E.01672
G1 X132.03 Y130.841 E.34993
G1 X131.491 Y130.841 E.01672
G1 X124.058 Y123.408 E.32628
G1 X124.058 Y123.946 E.01672
G1 X130.952 Y130.841 E.30264
G1 X130.414 Y130.841 E.01672
G1 X124.058 Y124.485 E.27899
G1 X124.058 Y125.024 E.01672
G1 X129.875 Y130.841 E.25535
G1 X129.336 Y130.841 E.01672
G1 X124.058 Y125.562 E.23171
G1 X124.058 Y126.101 E.01672
G1 X128.798 Y130.841 E.20806
G1 X128.259 Y130.841 E.01672
G1 X124.058 Y126.64 E.18442
G1 X124.058 Y127.178 E.01672
G1 X127.72 Y130.841 E.16078
G1 X127.182 Y130.841 E.01672
G1 X124.058 Y127.717 E.13713
G1 X124.058 Y128.256 E.01672
G1 X126.643 Y130.841 E.11349
G1 X126.104 Y130.841 E.01672
G1 X124.058 Y128.794 E.08985
G1 X124.058 Y129.333 E.01672
G1 X125.566 Y130.841 E.0662
G1 X125.027 Y130.841 E.01672
G1 X124.058 Y129.872 E.04256
G1 X124.058 Y130.41 E.01672
G1 X124.658 Y131.011 E.02636
; CHANGE_LAYER
; Z_HEIGHT: 0.753333
; LAYER_HEIGHT: 0.153333
; WIPE_START
G1 F24000
G1 X124.058 Y130.41 E-.32277
G1 X124.058 Y129.872 E-.20469
G1 X124.49 Y130.304 E-.23255
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 5/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L5
M991 S0 P4 ;notify layer change
G17
G3 Z1 I1.208 J-.148 P1  F30000
G1 X122.542 Y114.448 Z1
G1 Z.753
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.276667
G1 F3386
G3 X122.542 Y111.189 I1.552 J-1.629 E.14814
G1 X122.542 Y114.388 E.13003
; WIPE_START
G1 F24000
G1 X122.188 Y114.019 E-.19416
G1 X121.997 Y113.643 E-.16028
G1 X121.839 Y112.819 E-.31914
G1 X121.882 Y112.595 E-.08643
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.153 I.874 J.847 P1  F30000
G1 X124.437 Y109.961 Z1.153
G1 Z.753
G1 E.8 F1800
G1 F3386
G3 X125.393 Y105.603 I.954 J-2.075 E.25174
G1 X125.533 Y105.608 E.00572
G3 X124.491 Y109.986 I-.143 J2.279 E.32335
; WIPE_START
G1 F24000
G1 X123.76 Y109.452 E-.34394
G1 X123.31 Y108.729 E-.32372
G1 X123.265 Y108.49 E-.09234
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.153 I.05 J1.216 P1  F30000
G1 X135.051 Y108.006 Z1.153
G1 Z.753
G1 E.8 F1800
G1 F3386
G1 X134.983 Y107.886 E.00562
G3 X137.269 Y105.602 I2.283 J-.001 E.14592
G1 X137.41 Y105.607 E.00572
G3 X135.15 Y108.742 I-.143 J2.279 E.39584
G1 X135.059 Y108.066 E.02774
; CHANGE_LAYER
; Z_HEIGHT: 0.8
; LAYER_HEIGHT: 0.0466667
; WIPE_START
G1 F24000
G1 X134.983 Y107.886 E-.07419
G1 X135.186 Y107.044 E-.32899
G1 X135.637 Y106.321 E-.32367
G1 X135.707 Y106.269 E-.03315
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 6/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L6
M991 S0 P5 ;notify layer change
G17
G3 Z1.153 I-1.058 J.601 P1  F30000
G1 X139.52 Y112.987 Z1.153
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F3386
G1 X139.52 Y113.379 E.01301
G1 X141.52 Y113.379 E.06634
G1 X141.52 Y129.174 E.52398
G1 X139.52 Y129.174 E.06634
G1 X139.52 Y131.174 E.06634
G1 X123.724 Y131.174 E.52398
G1 X123.724 Y111.379 E.65666
G1 X139.52 Y111.379 E.52398
G1 X139.52 Y112.927 E.05135
G1 X139.912 Y112.987 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3386
G1 X141.912 Y112.987 E.06145
G1 X141.912 Y129.567 E.50946
G1 X139.912 Y129.567 E.06145
G1 X139.912 Y131.567 E.06145
G1 X123.332 Y131.567 E.50946
G1 X123.332 Y110.987 E.63237
G1 X139.912 Y110.987 E.50946
G1 X139.912 Y112.927 E.05961
M204 S10000
; WIPE_START
G1 F24000
G1 X141.911 Y112.986 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I-.293 J-1.181 P1  F30000
G1 X139.172 Y113.667 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3386
G1 X139.172 Y111.727 E.06435
G1 X124.073 Y111.727 E.50087
G1 X124.073 Y114.021 E.07609
G1 X138.878 Y114.021 E.49112
G1 X138.878 Y122.532 E.28234
G1 X124.073 Y122.532 E.49112
G1 X124.073 Y130.826 E.27512
G1 X139.172 Y130.826 E.50087
G1 X139.172 Y128.826 E.06634
G1 X141.172 Y128.826 E.06634
G1 X141.172 Y113.727 E.50087
G1 X139.172 Y113.727 E.06634
G1 X140.765 Y114.762 F30000
G1 F3386
G1 X140.765 Y114.134 E.02084
G1 X139.765 Y114.134 E.03317
G1 X139.285 Y114.614 E.0225
G1 X139.285 Y120.263 E.18741
G1 X140.765 Y121.743 E.06942
G1 X140.765 Y120.81 E.03096
G1 X139.285 Y122.29 E.06942
G1 X139.285 Y122.939 E.02155
G1 X138.635 Y122.939 E.02155
M73 P33 R13
G1 X131.156 Y130.419 E.35089
G1 X134.089 Y130.419 E.0973
G1 X126.609 Y122.939 E.35089
G1 X124.981 Y122.939 E.05401
G1 X124.073 Y118.775 F30000
G1 F3386
G1 X124.073 Y120.403 E.05401
G1 X125.795 Y122.125 E.0808
G1 X124.098 Y122.125 E.05631
G1 X131.795 Y114.428 E.3611
G1 X133.449 Y114.428 E.05488
G1 X138.471 Y119.449 E.23556
G1 X138.471 Y115.428 E.1334
G1 X131.773 Y122.125 E.31419
G1 X133.471 Y122.125 E.05631
G1 X125.773 Y114.428 E.3611
G1 X124.145 Y114.428 E.05401
G1 X125.108 Y112.134 F30000
G1 F3386
G1 X124.48 Y112.134 E.02084
G1 X124.48 Y113.134 E.03317
G1 X124.933 Y113.614 E.0219
G1 X126.413 Y112.134 E.06942
G1 X131.156 Y112.134 E.15733
G1 X132.635 Y113.614 E.06942
G1 X134.089 Y112.134 E.0688
G1 X135.717 Y112.134 E.05401
G1 X138.765 Y129.047 F30000
G1 F3386
G1 X138.765 Y128.419 E.02084
G1 X139.765 Y128.419 E.03317
G1 X134.285 Y122.939 E.25706
G1 X130.959 Y122.939 E.11032
G1 X124.48 Y129.419 E.30398
G1 X124.48 Y128.486 E.03096
G1 X126.413 Y130.419 E.09069
G1 X128.041 Y130.419 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X126.413 Y130.419 E-.61876
G1 X126.15 Y130.156 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 7/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L7
M991 S0 P6 ;notify layer change
G17
G3 Z1.2 I.96 J.748 P1  F30000
G1 X139.52 Y112.987 Z1.2
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3016
G1 X139.52 Y113.379 E.01301
G1 X141.52 Y113.379 E.06634
G1 X141.52 Y129.174 E.52398
G1 X139.52 Y129.174 E.06634
G1 X139.52 Y131.174 E.06634
G1 X123.724 Y131.174 E.52398
G1 X123.724 Y111.379 E.65666
G1 X139.52 Y111.379 E.52398
G1 X139.52 Y112.927 E.05135
G1 X139.912 Y112.987 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3016
G1 X141.912 Y112.987 E.06145
G1 X141.912 Y129.567 E.50946
G1 X139.912 Y129.567 E.06145
G1 X139.912 Y131.567 E.06145
G1 X123.332 Y131.567 E.50946
G1 X123.332 Y110.987 E.63237
G1 X139.912 Y110.987 E.50946
G1 X139.912 Y112.927 E.05961
M204 S10000
; WIPE_START
G1 F24000
G1 X141.911 Y112.986 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I-.293 J-1.181 P1  F30000
G1 X139.172 Y113.667 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3016
G1 X139.172 Y111.727 E.06435
G1 X124.073 Y111.727 E.50087
G1 X124.073 Y114.021 E.07609
G1 X138.878 Y114.021 E.49112
G1 X138.878 Y122.532 E.28234
G1 X124.073 Y122.532 E.49112
G1 X124.073 Y130.826 E.27512
G1 X139.172 Y130.826 E.50087
G1 X139.172 Y128.826 E.06634
G1 X141.172 Y128.826 E.06634
G1 X141.172 Y113.727 E.50087
G1 X139.172 Y113.727 E.06634
G1 X140.765 Y114.762 F30000
G1 F3016
G1 X140.765 Y114.134 E.02084
G1 X139.765 Y114.134 E.03317
G1 X139.285 Y114.614 E.0225
G1 X139.285 Y120.263 E.18741
G1 X140.765 Y121.743 E.06942
G1 X140.765 Y120.81 E.03096
G1 X139.285 Y122.29 E.06942
G1 X139.285 Y122.939 E.02155
G1 X138.635 Y122.939 E.02155
G1 X131.156 Y130.419 E.35089
G1 X134.089 Y130.419 E.0973
G1 X126.609 Y122.939 E.35089
G1 X124.981 Y122.939 E.05401
G1 X124.073 Y118.775 F30000
G1 F3016
G1 X124.073 Y120.403 E.05401
G1 X125.795 Y122.125 E.0808
G1 X124.098 Y122.125 E.05631
G1 X131.795 Y114.428 E.3611
G1 X133.449 Y114.428 E.05488
G1 X138.471 Y119.449 E.23556
G1 X138.471 Y115.428 E.1334
G1 X131.773 Y122.125 E.31419
G1 X133.471 Y122.125 E.05631
G1 X125.773 Y114.428 E.3611
G1 X124.145 Y114.428 E.05401
G1 X125.108 Y112.134 F30000
G1 F3016
G1 X124.48 Y112.134 E.02084
G1 X124.48 Y113.134 E.03317
G1 X124.933 Y113.614 E.0219
G1 X126.413 Y112.134 E.06942
G1 X131.156 Y112.134 E.15733
G1 X132.635 Y113.614 E.06942
G1 X134.089 Y112.134 E.0688
G1 X135.717 Y112.134 E.05401
G1 X138.765 Y129.047 F30000
G1 F3016
G1 X138.765 Y128.419 E.02084
G1 X139.765 Y128.419 E.03317
G1 X134.285 Y122.939 E.25706
G1 X130.959 Y122.939 E.11032
G1 X124.48 Y129.419 E.30398
G1 X124.48 Y128.486 E.03096
M73 P34 R13
G1 X126.413 Y130.419 E.09069
G1 X128.041 Y130.419 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 1.03
; LAYER_HEIGHT: 0.03
; WIPE_START
G1 F24000
G1 X126.413 Y130.419 E-.61876
G1 X126.15 Y130.156 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 8/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L8
M991 S0 P7 ;notify layer change
G17
G3 Z1.4 I1.186 J-.272 P1  F30000
G1 X122.542 Y114.414 Z1.4
G1 Z1.03
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.276667
G1 F3379
G3 X122.542 Y111.223 I1.55 J-1.595 E.14462
G1 X122.542 Y114.354 E.12725
; WIPE_START
G1 F24000
G1 X122.019 Y113.635 E-.33785
G1 X121.863 Y112.819 E-.31569
G1 X121.916 Y112.543 E-.10646
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.43 I.825 J.895 P1  F30000
G1 X124.594 Y110.077 Z1.43
G1 Z1.03
G1 E.8 F1800
G1 F3379
G1 X124.094 Y109.832 E.02262
G3 X125.532 Y105.745 I1.348 J-1.822 E.23441
G3 X125.943 Y110.196 I-.198 J2.263 E.25698
G1 X124.842 Y110.196 E.04473
G1 X124.648 Y110.103 E.00878
; WIPE_START
G1 F24000
G1 X124.094 Y109.832 E-.2342
G1 X123.522 Y109.218 E-.31893
G1 X123.325 Y108.71 E-.20687
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.43 I.029 J1.217 P1  F30000
G1 X135.091 Y108.427 Z1.43
G1 Z1.03
G1 E.8 F1800
G1 F3379
G3 X137.408 Y105.744 I2.227 J-.418 E.16548
G3 X137.809 Y110.196 I-.197 J2.262 E.25738
G1 X136.719 Y110.194 E.04432
G3 X135.103 Y108.485 I.6 J-2.186 E.10053
; CHANGE_LAYER
; Z_HEIGHT: 1.2
; LAYER_HEIGHT: 0.17
; WIPE_START
G1 F24000
G1 X135.07 Y107.718 E-.29167
G1 X135.327 Y106.911 E-.322
G1 X135.57 Y106.612 E-.14633
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 9/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L9
M991 S0 P8 ;notify layer change
G17
G3 Z1.43 I-1.034 J.641 P1  F30000
G1 X139.52 Y112.987 Z1.43
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F3379
G1 X139.52 Y113.379 E.01301
G1 X141.52 Y113.379 E.06634
G1 X141.52 Y129.174 E.52398
G1 X139.52 Y129.174 E.06634
G1 X139.52 Y131.174 E.06634
G1 X123.724 Y131.174 E.52398
G1 X123.724 Y111.379 E.65666
G1 X139.52 Y111.379 E.52398
G1 X139.52 Y112.927 E.05135
G1 X139.912 Y112.987 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3379
G1 X141.912 Y112.987 E.06145
G1 X141.912 Y129.567 E.50946
G1 X139.912 Y129.567 E.06145
G1 X139.912 Y131.567 E.06145
G1 X123.332 Y131.567 E.50946
G1 X123.332 Y110.987 E.63237
G1 X139.912 Y110.987 E.50946
G1 X139.912 Y112.927 E.05961
M204 S10000
; WIPE_START
G1 F24000
G1 X141.911 Y112.986 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I-.293 J-1.181 P1  F30000
G1 X139.172 Y113.667 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3379
G1 X139.172 Y111.727 E.06435
G1 X124.073 Y111.727 E.50087
G1 X124.073 Y114.021 E.07609
G1 X138.878 Y114.021 E.49112
G1 X138.878 Y122.532 E.28234
G1 X124.073 Y122.532 E.49112
G1 X124.073 Y130.826 E.27512
G1 X139.172 Y130.826 E.50087
G1 X139.172 Y128.826 E.06634
G1 X141.172 Y128.826 E.06634
G1 X141.172 Y113.727 E.50087
G1 X139.172 Y113.727 E.06634
G1 X140.765 Y114.762 F30000
G1 F3379
G1 X140.765 Y114.134 E.02084
G1 X139.765 Y114.134 E.03317
G1 X139.285 Y114.614 E.0225
G1 X139.285 Y120.263 E.18741
G1 X140.765 Y121.743 E.06942
G1 X140.765 Y120.81 E.03096
G1 X139.285 Y122.29 E.06942
G1 X139.285 Y122.939 E.02155
G1 X138.635 Y122.939 E.02155
G1 X131.156 Y130.419 E.35089
G1 X134.089 Y130.419 E.0973
G1 X126.609 Y122.939 E.35089
G1 X124.981 Y122.939 E.05401
G1 X124.073 Y118.775 F30000
G1 F3379
G1 X124.073 Y120.403 E.05401
G1 X125.795 Y122.125 E.0808
G1 X124.098 Y122.125 E.05631
G1 X131.795 Y114.428 E.3611
G1 X133.449 Y114.428 E.05488
G1 X138.471 Y119.449 E.23556
G1 X138.471 Y115.428 E.1334
G1 X131.773 Y122.125 E.31419
G1 X133.471 Y122.125 E.05631
G1 X125.773 Y114.428 E.3611
G1 X124.145 Y114.428 E.05401
G1 X125.108 Y112.134 F30000
G1 F3379
G1 X124.48 Y112.134 E.02084
G1 X124.48 Y113.134 E.03317
G1 X124.933 Y113.614 E.0219
G1 X126.413 Y112.134 E.06942
G1 X131.156 Y112.134 E.15733
G1 X132.635 Y113.614 E.06942
G1 X134.089 Y112.134 E.0688
G1 X135.717 Y112.134 E.05401
G1 X138.765 Y129.047 F30000
G1 F3379
G1 X138.765 Y128.419 E.02084
G1 X139.765 Y128.419 E.03317
G1 X134.285 Y122.939 E.25706
G1 X130.959 Y122.939 E.11032
G1 X124.48 Y129.419 E.30398
G1 X124.48 Y128.486 E.03096
G1 X126.413 Y130.419 E.09069
G1 X128.041 Y130.419 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 1.30667
; LAYER_HEIGHT: 0.106667
; WIPE_START
G1 F24000
G1 X126.413 Y130.419 E-.61876
G1 X126.15 Y130.156 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 10/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L10
M991 S0 P9 ;notify layer change
G17
G3 Z1.6 I1.186 J-.271 P1  F30000
G1 X122.542 Y114.379 Z1.6
G1 Z1.307
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.276667
G1 F3380
G3 X122.542 Y111.258 I1.549 J-1.561 E.1411
G1 X122.542 Y114.319 E.12447
; WIPE_START
G1 F24000
G1 X122.042 Y113.626 E-.32504
G1 X121.888 Y112.819 E-.31225
G1 X121.948 Y112.501 E-.12271
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.707 I.799 J.918 P1  F30000
G1 X124.598 Y110.196 Z1.707
G1 Z1.307
G1 E.8 F1800
G1 F3380
G3 X125.53 Y105.879 I.847 J-2.077 E.25456
G3 X126.188 Y110.196 I-.195 J2.239 E.24347
G1 X124.658 Y110.196 E.0622
; WIPE_START
G1 F24000
G1 X123.997 Y109.836 E-.28608
G1 X123.472 Y109.191 E-.31614
G1 X123.346 Y108.795 E-.15779
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.707 I.042 J1.216 P1  F30000
G1 X135.095 Y108.389 Z1.707
M73 P35 R13
G1 Z1.307
G1 E.8 F1800
G1 F3380
G3 X137.407 Y105.876 I2.226 J-.273 E.15777
G3 X138.056 Y110.196 I-.195 J2.238 E.24378
G1 X136.482 Y110.196 E.06401
G3 X135.103 Y108.448 I.839 J-2.079 E.0947
; CHANGE_LAYER
; Z_HEIGHT: 1.4
; LAYER_HEIGHT: 0.0933334
; WIPE_START
G1 F24000
G1 X135.116 Y107.689 E-.28849
G1 X135.348 Y107.03 E-.26567
G1 X135.69 Y106.609 E-.20584
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 11/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L11
M991 S0 P10 ;notify layer change
G17
G3 Z1.707 I-1.2 J.204 P1  F30000
G1 X139.52 Y129.174 Z1.707
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F3380
G1 X139.52 Y131.174 E.06634
G1 X123.724 Y131.174 E.52398
G1 X123.724 Y111.379 E.65666
G1 X139.52 Y111.379 E.52398
G1 X139.52 Y113.379 E.06634
G1 X141.52 Y113.379 E.06634
G1 X141.52 Y129.174 E.52398
G1 X139.58 Y129.174 E.06435
G1 X139.912 Y129.567 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3380
G1 X139.912 Y131.567 E.06145
G1 X123.332 Y131.567 E.50946
G1 X123.332 Y110.987 E.63237
G1 X139.912 Y110.987 E.50946
G1 X139.912 Y112.987 E.06145
G1 X141.912 Y112.987 E.06145
G1 X141.912 Y129.567 E.50946
G1 X139.972 Y129.567 E.05961
M204 S10000
; WIPE_START
G1 F24000
G1 X139.912 Y131.566 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I1.107 J-.505 P1  F30000
G1 X138.765 Y129.047 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3380
G1 X138.765 Y128.419 E.02084
G1 X139.765 Y128.419 E.03317
G1 X134.285 Y122.939 E.25706
G1 X130.959 Y122.939 E.11032
G1 X124.48 Y129.419 E.30398
G1 X124.48 Y128.486 E.03096
G1 X126.413 Y130.419 E.09069
G1 X128.041 Y130.419 E.05401
G1 X124.981 Y122.939 F30000
G1 F3380
G1 X126.609 Y122.939 E.05401
G1 X134.089 Y130.419 E.35089
G1 X131.156 Y130.419 E.0973
G1 X138.635 Y122.939 E.35089
G1 X139.285 Y122.939 E.02155
G1 X139.285 Y122.29 E.02155
G1 X140.765 Y120.81 E.06942
G1 X140.765 Y121.743 E.03096
G1 X139.285 Y120.263 E.06942
G1 X139.285 Y114.614 E.18741
G1 X139.765 Y114.134 E.0225
G1 X140.765 Y114.134 E.03317
G1 X140.765 Y114.762 E.02084
G1 X139.172 Y113.727 F30000
G1 F3380
G1 X141.172 Y113.727 E.06634
G1 X141.172 Y128.826 E.50087
G1 X139.172 Y128.826 E.06634
G1 X139.172 Y130.826 E.06634
G1 X124.073 Y130.826 E.50087
G1 X124.073 Y122.532 E.27512
G1 X138.878 Y122.532 E.49112
G1 X138.878 Y114.021 E.28234
G1 X124.073 Y114.021 E.49112
G1 X124.073 Y111.727 E.07609
G1 X139.172 Y111.727 E.50087
G1 X139.172 Y113.667 E.06435
G1 X135.717 Y112.134 F30000
G1 F3380
G1 X134.089 Y112.134 E.05401
G1 X132.635 Y113.614 E.0688
G1 X131.156 Y112.134 E.06942
G1 X126.413 Y112.134 E.15733
G1 X124.933 Y113.614 E.06942
G1 X124.48 Y113.134 E.0219
G1 X124.48 Y112.134 E.03317
G1 X125.108 Y112.134 E.02084
G1 X124.145 Y114.428 F30000
G1 F3380
G1 X125.773 Y114.428 E.05401
G1 X133.471 Y122.125 E.3611
G1 X131.773 Y122.125 E.05631
G1 X138.471 Y115.428 E.31419
G1 X138.471 Y119.449 E.1334
G1 X133.449 Y114.428 E.23556
G1 X131.795 Y114.428 E.05488
G1 X124.098 Y122.125 E.3611
G1 X125.795 Y122.125 E.05631
G1 X124.073 Y120.403 E.0808
G1 X124.073 Y118.775 E.05401
M106 S249.9
; CHANGE_LAYER
; Z_HEIGHT: 1.58333
; LAYER_HEIGHT: 0.183333
; WIPE_START
G1 F24000
G1 X124.073 Y120.403 E-.61876
G1 X124.335 Y120.666 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 12/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L12
M991 S0 P11 ;notify layer change
G17
G3 Z1.8 I1.171 J-.332 P1  F30000
G1 X122.542 Y114.345 Z1.8
G1 Z1.583
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.276667
G1 F9000
G3 X122.542 Y111.292 I1.549 J-1.527 E.13759
G1 X122.542 Y114.285 E.12169
; WIPE_START
G1 F24000
G1 X122.064 Y113.617 E-.31225
G1 X121.912 Y112.819 E-.3088
G1 X121.98 Y112.459 E-.13896
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.983 I.828 J.891 P1  F30000
G1 X124.416 Y110.196 Z1.983
G1 Z1.583
G1 E.8 F1800
G1 F9000
G3 X125.529 Y106.013 I1.029 J-1.966 E.24333
G3 X126.37 Y110.196 I-.194 J2.215 E.23233
G1 X124.476 Y110.196 E.07702
; WIPE_START
G1 F24000
G1 X123.813 Y109.738 E-.30599
G1 X123.431 Y109.165 E-.26161
G1 X123.308 Y108.674 E-.1924
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.983 I.033 J1.217 P1  F30000
G1 X135.106 Y108.358 Z1.983
G1 Z1.583
G1 E.8 F1800
G1 F9000
G3 X137.405 Y106.01 I2.215 J-.131 E.15043
G3 X138.24 Y110.196 I-.194 J2.215 E.23262
G1 X136.298 Y110.196 E.07892
G3 X135.11 Y108.417 I1.022 J-1.969 E.09077
; CHANGE_LAYER
; Z_HEIGHT: 1.6
; LAYER_HEIGHT: 0.0166667
; WIPE_START
G1 F24000
G1 X135.169 Y107.667 E-.28564
G1 X135.439 Y107.031 E-.26255
G1 X135.817 Y106.621 E-.2118
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 13/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L13
M991 S0 P12 ;notify layer change
G17
G3 Z1.983 I-1.052 J.612 P1  F30000
G1 X139.52 Y112.987 Z1.983
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X139.52 Y113.379 E.01301
G1 X141.52 Y113.379 E.06634
G1 X141.52 Y129.174 E.52398
G1 X139.52 Y129.174 E.06634
G1 X139.52 Y131.174 E.06634
G1 X123.724 Y131.174 E.52398
G1 X123.724 Y111.379 E.65666
G1 X139.52 Y111.379 E.52398
G1 X139.52 Y112.927 E.05135
G1 X139.912 Y112.987 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X141.912 Y112.987 E.06145
G1 X141.912 Y129.567 E.50946
G1 X139.912 Y129.567 E.06145
G1 X139.912 Y131.567 E.06145
G1 X123.332 Y131.567 E.50946
G1 X123.332 Y110.987 E.63237
G1 X139.912 Y110.987 E.50946
G1 X139.912 Y112.927 E.05961
M204 S10000
; WIPE_START
G1 F24000
G1 X141.911 Y112.986 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I.529 J-1.096 P1  F30000
G1 X139.353 Y111.75 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.403637
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X124.094 Y111.75 E.79553
G1 X124.094 Y112.204 E.02365
G1 X139.15 Y112.204 E.78497
G1 X139.15 Y112.657 E.02365
G1 X124.094 Y112.657 E.78497
G1 X124.094 Y113.111 E.02365
G1 X139.15 Y113.111 E.78497
G1 X139.15 Y113.565 E.02365
G1 X124.094 Y113.565 E.78497
G1 X124.094 Y113.999 E.02266
G1 X138.899 Y113.999 E.77189
G1 X138.899 Y114.018 E.001
G1 X141.15 Y114.018 E.11735
G1 X141.15 Y114.472 E.02365
G1 X138.899 Y114.472 E.11735
G1 X138.899 Y114.926 E.02365
G1 X141.15 Y114.926 E.11735
G1 X141.15 Y115.379 E.02365
G1 X138.899 Y115.379 E.11735
G1 X138.899 Y115.833 E.02365
G1 X141.15 Y115.833 E.11735
G1 X141.15 Y116.287 E.02365
G1 X138.899 Y116.287 E.11735
G1 X138.899 Y116.74 E.02365
G1 X141.15 Y116.74 E.11735
G1 X141.15 Y117.194 E.02365
G1 X138.899 Y117.194 E.11735
G1 X138.899 Y117.647 E.02365
G1 X141.15 Y117.647 E.11735
G1 X141.15 Y118.101 E.02365
G1 X138.899 Y118.101 E.11735
G1 X138.899 Y118.555 E.02365
G1 X141.15 Y118.555 E.11735
G1 X141.15 Y119.008 E.02365
G1 X138.899 Y119.008 E.11735
G1 X138.899 Y119.462 E.02365
G1 X141.15 Y119.462 E.11735
G1 X141.15 Y119.916 E.02365
G1 X138.899 Y119.916 E.11735
G1 X138.899 Y120.369 E.02365
G1 X141.15 Y120.369 E.11735
M73 P36 R13
G1 X141.15 Y120.823 E.02365
G1 X138.899 Y120.823 E.11735
G1 X138.899 Y121.277 E.02365
G1 X141.15 Y121.277 E.11735
G1 X141.15 Y121.73 E.02365
G1 X138.899 Y121.73 E.11735
G1 X138.899 Y122.184 E.02365
G1 X141.15 Y122.184 E.11735
G1 X141.15 Y122.637 E.02365
G1 X124.094 Y122.637 E.88924
G1 X124.094 Y123.091 E.02365
G1 X141.15 Y123.091 E.88924
G1 X141.15 Y123.545 E.02365
G1 X124.094 Y123.545 E.88924
G1 X124.094 Y123.998 E.02365
G1 X141.15 Y123.998 E.88924
G1 X141.15 Y124.452 E.02365
G1 X124.094 Y124.452 E.88924
G1 X124.094 Y124.906 E.02365
G1 X141.15 Y124.906 E.88924
G1 X141.15 Y125.359 E.02365
G1 X124.094 Y125.359 E.88924
G1 X124.094 Y125.813 E.02365
G1 X141.15 Y125.813 E.88924
G1 X141.15 Y126.267 E.02365
G1 X124.094 Y126.267 E.88924
G1 X124.094 Y126.72 E.02365
G1 X141.15 Y126.72 E.88924
G1 X141.15 Y127.174 E.02365
G1 X124.094 Y127.174 E.88924
G1 X124.094 Y127.627 E.02365
G1 X141.15 Y127.627 E.88924
G1 X141.15 Y128.081 E.02365
G1 X124.094 Y128.081 E.88924
G1 X124.094 Y128.535 E.02365
G1 X141.15 Y128.535 E.88924
G1 X141.15 Y128.805 E.01407
G1 X139.15 Y128.805 E.10427
G1 X139.15 Y128.988 E.00958
G1 X124.094 Y128.988 E.78497
G1 X124.094 Y129.442 E.02365
G1 X139.15 Y129.442 E.78497
G1 X139.15 Y129.896 E.02365
G1 X124.094 Y129.896 E.78497
G1 X124.094 Y130.349 E.02365
G1 X139.15 Y130.349 E.78497
G1 X139.15 Y130.803 E.02365
G1 X123.891 Y130.803 E.79553
M106 S249.9
G1 X124.073 Y118.775 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X124.073 Y120.403 E.05401
G1 X125.795 Y122.125 E.0808
G1 X124.098 Y122.125 E.0563
G1 X131.795 Y114.428 E.3611
G1 X133.449 Y114.428 E.05489
G1 X138.471 Y119.449 E.23556
G1 X138.471 Y115.428 E.1334
G1 X131.774 Y122.125 E.31419
G1 X133.471 Y122.125 E.0563
G1 X125.774 Y114.428 E.3611
G1 X124.145 Y114.428 E.05401
M106 S252.45
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X125.774 Y114.428 E-.61876
G1 X126.036 Y114.691 E-.14124
; WIPE_END
M73 P36 R12
G1 E-.04 F1800
; layer num/total_layer_count: 14/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L14
M991 S0 P13 ;notify layer change
G17
G3 Z2 I.153 J1.207 P1  F30000
G1 X139.52 Y112.987 Z2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5876
G1 X139.52 Y113.379 E.01301
G1 X141.52 Y113.379 E.06634
G1 X141.52 Y129.174 E.52398
G1 X139.52 Y129.174 E.06634
G1 X139.52 Y131.174 E.06634
G1 X123.724 Y131.174 E.52398
G1 X123.724 Y111.379 E.65666
G1 X139.52 Y111.379 E.52398
G1 X139.52 Y112.927 E.05135
G1 X139.912 Y112.987 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5876
G1 X141.912 Y112.987 E.06145
G1 X141.912 Y129.567 E.50946
G1 X139.912 Y129.567 E.06145
G1 X139.912 Y131.567 E.06145
G1 X123.332 Y131.567 E.50946
G1 X123.332 Y110.987 E.63237
G1 X139.912 Y110.987 E.50946
G1 X139.912 Y112.927 E.05961
M204 S10000
; WIPE_START
G1 F24000
G1 X141.911 Y112.986 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-.416 J-1.144 P1  F30000
G1 X138.556 Y114.205 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423808
G1 F5876
G1 X136.063 Y111.712 E.10945
G1 X135.524 Y111.712 E.01672
G1 X137.848 Y114.036 E.102
G1 X137.309 Y114.036 E.01672
G1 X134.985 Y111.712 E.102
G1 X134.447 Y111.712 E.01672
G1 X136.77 Y114.036 E.102
G1 X136.232 Y114.036 E.01672
G1 X133.908 Y111.712 E.102
G1 X133.369 Y111.712 E.01672
G1 X135.693 Y114.036 E.102
G1 X135.155 Y114.036 E.01672
G1 X132.831 Y111.712 E.102
G1 X132.292 Y111.712 E.01672
G1 X134.616 Y114.036 E.102
G1 X134.077 Y114.036 E.01672
G1 X131.753 Y111.712 E.102
G1 X131.215 Y111.712 E.01672
G1 X133.539 Y114.036 E.102
G1 X133 Y114.036 E.01672
G1 X130.676 Y111.712 E.102
G1 X130.137 Y111.712 E.01672
G1 X132.461 Y114.036 E.102
G1 X131.923 Y114.036 E.01672
G1 X129.599 Y111.712 E.102
G1 X129.06 Y111.712 E.01672
G1 X131.384 Y114.036 E.102
G1 X130.845 Y114.036 E.01672
G1 X128.521 Y111.712 E.102
G1 X127.983 Y111.712 E.01672
G1 X130.307 Y114.036 E.102
G1 X129.768 Y114.036 E.01672
G1 X127.444 Y111.712 E.102
G1 X126.905 Y111.712 E.01672
G1 X129.229 Y114.036 E.102
G1 X128.691 Y114.036 E.01672
G1 X126.367 Y111.712 E.102
G1 X125.828 Y111.712 E.01672
G1 X128.152 Y114.036 E.102
G1 X127.613 Y114.036 E.01672
G1 X125.289 Y111.712 E.102
M73 P37 R12
G1 X124.751 Y111.712 E.01672
G1 X127.075 Y114.036 E.102
G1 X126.536 Y114.036 E.01672
G1 X124.212 Y111.712 E.102
G1 X124.058 Y111.712 E.0048
G1 X124.058 Y112.096 E.01192
G1 X125.997 Y114.036 E.08515
G1 X125.459 Y114.036 E.01672
G1 X124.058 Y112.635 E.0615
G1 X124.058 Y113.173 E.01672
G1 X124.92 Y114.036 E.03786
G1 X124.381 Y114.036 E.01672
G1 X123.888 Y113.542 E.02166
G1 X124.145 Y114.428 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5876
G1 X125.774 Y114.428 E.05401
G1 X133.471 Y122.125 E.3611
G1 X131.774 Y122.125 E.0563
G1 X138.471 Y115.428 E.31419
G1 X138.471 Y119.449 E.1334
G1 X133.449 Y114.428 E.23556
G1 X131.795 Y114.428 E.05489
G1 X124.098 Y122.125 E.3611
G1 X125.795 Y122.125 E.0563
G1 X124.073 Y120.403 E.0808
G1 X124.073 Y118.775 E.05401
G1 X124.658 Y131.011 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423808
G1 F5876
G1 X124.058 Y130.41 E.02636
G1 X124.058 Y129.872 E.01672
G1 X125.027 Y130.841 E.04256
G1 X125.566 Y130.841 E.01672
G1 X124.058 Y129.333 E.0662
G1 X124.058 Y128.794 E.01672
G1 X126.104 Y130.841 E.08985
G1 X126.643 Y130.841 E.01672
G1 X124.058 Y128.256 E.11349
G1 X124.058 Y127.717 E.01672
G1 X127.182 Y130.841 E.13713
G1 X127.72 Y130.841 E.01672
G1 X124.058 Y127.178 E.16078
G1 X124.058 Y126.64 E.01672
G1 X128.259 Y130.841 E.18442
G1 X128.798 Y130.841 E.01672
G1 X124.058 Y126.101 E.20806
G1 X124.058 Y125.562 E.01672
G1 X129.336 Y130.841 E.23171
G1 X129.875 Y130.841 E.01672
G1 X124.058 Y125.024 E.25535
G1 X124.058 Y124.485 E.01672
G1 X130.414 Y130.841 E.27899
G1 X130.952 Y130.841 E.01672
G1 X124.058 Y123.946 E.30264
G1 X124.058 Y123.408 E.01672
G1 X131.491 Y130.841 E.32628
G1 X132.03 Y130.841 E.01672
G1 X124.058 Y122.869 E.34993
G1 X124.058 Y122.517 E.01092
G1 X124.244 Y122.517 E.0058
G1 X132.568 Y130.841 E.36537
G1 X133.107 Y130.841 E.01672
G1 X124.783 Y122.517 E.36537
G1 X125.322 Y122.517 E.01672
G1 X133.646 Y130.841 E.36537
G1 X134.184 Y130.841 E.01672
G1 X125.86 Y122.517 E.36537
G1 X126.399 Y122.517 E.01672
G1 X134.723 Y130.841 E.36537
G1 X135.262 Y130.841 E.01672
G1 X126.938 Y122.517 E.36537
G1 X127.476 Y122.517 E.01672
G1 X135.8 Y130.841 E.36537
G1 X136.339 Y130.841 E.01672
G1 X128.015 Y122.517 E.36537
G1 X128.554 Y122.517 E.01672
G1 X136.878 Y130.841 E.36537
G1 X137.416 Y130.841 E.01672
G1 X129.092 Y122.517 E.36537
G1 X129.631 Y122.517 E.01672
G1 X137.955 Y130.841 E.36537
G1 X138.494 Y130.841 E.01672
G1 X130.17 Y122.517 E.36537
G1 X130.708 Y122.517 E.01672
G1 X139.032 Y130.841 E.36537
G1 X139.187 Y130.841 E.0048
G1 X139.187 Y130.457 E.01192
G1 X131.247 Y122.517 E.34851
G1 X131.786 Y122.517 E.01672
G1 X139.187 Y129.919 E.32487
G1 X139.187 Y129.38 E.01672
G1 X132.324 Y122.517 E.30122
G1 X132.863 Y122.517 E.01672
G1 X139.187 Y128.841 E.27758
G1 X139.725 Y128.841 E.01672
G1 X133.402 Y122.517 E.27758
G1 X133.94 Y122.517 E.01672
G1 X140.264 Y128.841 E.27758
G1 X140.803 Y128.841 E.01672
G1 X134.479 Y122.517 E.27758
G1 X135.018 Y122.517 E.01672
G1 X141.187 Y128.687 E.27079
G1 X141.187 Y128.148 E.01672
G1 X135.556 Y122.517 E.24715
G1 X136.095 Y122.517 E.01672
G1 X141.187 Y127.609 E.22351
G1 X141.187 Y127.071 E.01672
G1 X136.634 Y122.517 E.19986
G1 X137.172 Y122.517 E.01672
G1 X141.187 Y126.532 E.17622
G1 X141.187 Y125.993 E.01672
G1 X137.711 Y122.517 E.15257
G1 X138.249 Y122.517 E.01672
G1 X141.187 Y125.455 E.12893
G1 X141.187 Y124.916 E.01672
G1 X138.788 Y122.517 E.10529
G1 X138.863 Y122.517 E.00232
G1 X138.863 Y122.053 E.0144
G1 X141.187 Y124.377 E.102
G1 X141.187 Y123.839 E.01672
G1 X138.863 Y121.515 E.102
G1 X138.863 Y120.976 E.01672
G1 X141.187 Y123.3 E.102
G1 X141.187 Y122.761 E.01672
G1 X138.863 Y120.437 E.102
G1 X138.863 Y119.899 E.01672
G1 X141.187 Y122.223 E.102
G1 X141.187 Y121.684 E.01672
G1 X138.863 Y119.36 E.102
G1 X138.863 Y118.821 E.01672
G1 X141.187 Y121.145 E.102
G1 X141.187 Y120.607 E.01672
G1 X138.863 Y118.283 E.102
G1 X138.863 Y117.744 E.01672
G1 X141.187 Y120.068 E.102
G1 X141.187 Y119.529 E.01672
G1 X138.863 Y117.206 E.102
G1 X138.863 Y116.667 E.01672
G1 X141.187 Y118.991 E.102
G1 X141.187 Y118.452 E.01672
G1 X138.863 Y116.128 E.102
G1 X138.863 Y115.59 E.01672
G1 X141.187 Y117.913 E.102
G1 X141.187 Y117.375 E.01672
G1 X138.863 Y115.051 E.102
G1 X138.863 Y114.512 E.01672
G1 X141.187 Y116.836 E.102
G1 X141.187 Y116.297 E.01672
G1 X136.601 Y111.712 E.20128
G1 X137.14 Y111.712 E.01672
G1 X141.357 Y115.928 E.18508
G1 X141.357 Y114.313 F30000
G1 F5876
G1 X140.756 Y113.712 E.02637
G1 X140.217 Y113.712 E.01672
G1 X141.187 Y114.681 E.04256
G1 X141.187 Y115.22 E.01672
G1 X139.679 Y113.712 E.0662
G1 X139.187 Y113.712 E.01526
G1 X139.187 Y113.22 E.01526
G1 X137.679 Y111.712 E.0662
G1 X138.217 Y111.712 E.01672
G1 X139.187 Y112.681 E.04256
G1 X139.187 Y112.143 E.01672
G1 X138.586 Y111.542 E.02637
; CHANGE_LAYER
; Z_HEIGHT: 1.86
; LAYER_HEIGHT: 0.0600001
; WIPE_START
G1 F24000
G1 X139.187 Y112.143 E-.3228
G1 X139.187 Y112.681 E-.20469
G1 X138.754 Y112.249 E-.23251
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 15/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L15
M991 S0 P14 ;notify layer change
G17
G3 Z2.2 I1.197 J-.218 P1  F30000
G1 X138.381 Y110.196 Z2.2
G1 Z1.86
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.276667
G1 F7215
G1 X136.158 Y110.196 E.09037
G3 X137.404 Y106.142 I1.158 J-1.863 E.23409
G3 X138.431 Y110.164 I-.187 J2.19 E.22079
; WIPE_START
G1 F24000
G1 X136.431 Y110.192 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.26 I.232 J-1.195 P1  F30000
G1 X127.534 Y108.467 Z2.26
G1 Z1.86
G1 E.8 F1800
G1 F7215
G3 X126.511 Y110.196 I-2.194 J-.132 E.08481
G1 X124.275 Y110.196 E.09091
G3 X125.527 Y106.145 I1.165 J-1.859 E.2338
G3 X127.537 Y108.408 I-.188 J2.19 E.13568
; WIPE_START
G1 F24000
G1 X127.386 Y109.136 E-.2827
G1 X127.044 Y109.726 E-.25904
G1 X126.613 Y110.106 E-.21826
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.26 I-.349 J-1.166 P1  F30000
G1 X122.542 Y111.326 Z2.26
G1 Z1.86
G1 E.8 F1800
G1 F7215
G1 X122.542 Y114.311 E.12135
G3 X122.501 Y111.369 I1.55 J-1.493 E.13168
; CHANGE_LAYER
; Z_HEIGHT: 2
; LAYER_HEIGHT: 0.14
; WIPE_START
G1 F24000
G1 X122.529 Y113.369 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 16/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L16
M991 S0 P15 ;notify layer change
G17
G3 Z2.26 I-.037 J1.216 P1  F30000
G1 X138.685 Y113.854 Z2.26
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F7215
G1 X139.044 Y113.854 E.01192
G1 X139.044 Y122.699 E.29339
G1 X123.724 Y122.699 E.5082
G1 X123.724 Y113.854 E.29339
G1 X138.625 Y113.854 E.49428
; WIPE_START
G1 F24000
G1 X139.044 Y113.854 E-.15939
G1 X139.044 Y115.435 E-.60061
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I1.147 J.407 P1  F30000
G1 X139.912 Y112.987 Z2.4
G1 Z2
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7215
G1 X141.912 Y112.987 E.06145
G1 X141.912 Y129.567 E.50946
G1 X139.912 Y129.567 E.06145
G1 X139.912 Y131.567 E.06145
G1 X123.332 Y131.567 E.50946
G1 X123.332 Y110.987 E.63237
G1 X139.912 Y110.987 E.50946
G1 X139.912 Y112.927 E.05961
M204 S10000
; WIPE_START
G1 F24000
G1 X141.911 Y112.986 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-.668 J-1.017 P1  F30000
G1 X127.648 Y122.35 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7215
G1 X126.02 Y122.35 E.05401
G1 X124.073 Y120.403 E.09137
G1 X124.073 Y122.15 E.05796
G1 X132.02 Y114.203 E.37284
G1 X133.224 Y114.203 E.03994
G1 X138.696 Y119.675 E.2567
G1 X138.696 Y115.203 E.14834
G1 X131.548 Y122.35 E.33532
G1 X133.696 Y122.35 E.07125
G1 X125.548 Y114.203 E.38223
G1 X124.344 Y114.203 E.03994
G1 X124.073 Y114.474 E.01274
G1 X124.073 Y116.103 E.05401
; WIPE_START
G1 F24000
G1 X124.073 Y114.474 E-.61876
G1 X124.335 Y114.211 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-.789 J.927 P1  F30000
G1 X141.705 Y128.992 Z2.4
G1 Z2
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F7215
G1 X141.338 Y129.359 E.01596
G1 X140.804 Y129.359
G1 X141.705 Y128.459 E.03913
G1 X141.705 Y127.925
G1 X140.271 Y129.359 E.06231
G1 X139.738 Y129.359
G1 X141.705 Y127.392 E.08548
M204 S10000
; WIPE_START
G1 F24000
G1 X140.291 Y128.806 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-1.14 J-.426 P1  F30000
G1 X139.338 Y131.359 Z2.4
G1 Z2
G1 E.8 F1800
M204 S2000
G1 F7215
G1 X139.705 Y130.992 E.01596
G1 X139.705 Y130.459
G1 X138.804 Y131.359 E.03913
G1 X138.271 Y131.359
G1 X139.705 Y129.925 E.06231
G1 X139.705 Y129.392
G1 X137.738 Y131.359 E.08548
G1 X137.204 Y131.359
G1 X141.705 Y126.859 E.19556
G1 X141.705 Y126.326
G1 X136.671 Y131.359 E.21874
G1 X136.138 Y131.359
G1 X141.705 Y125.792 E.24191
G1 X141.705 Y125.259
G1 X135.605 Y131.359 E.26508
G1 X135.071 Y131.359
G1 X141.705 Y124.726 E.28825
G1 X141.705 Y124.192
G1 X134.538 Y131.359 E.31143
G1 X134.005 Y131.359
G1 X141.705 Y123.659 E.3346
G1 X141.705 Y123.126
G1 X133.472 Y131.359 E.35777
G1 X132.938 Y131.359
G1 X141.705 Y122.593 E.38095
G1 X141.705 Y122.059
G1 X132.405 Y131.359 E.40412
G1 X131.872 Y131.359
G1 X141.705 Y121.526 E.42729
G1 X141.705 Y120.993
G1 X131.338 Y131.359 E.45047
G1 X130.805 Y131.359
G1 X139.243 Y122.921 E.36667
G1 X138.71 Y122.921
M73 P38 R12
G1 X130.272 Y131.359 E.36667
G1 X129.739 Y131.359
G1 X138.177 Y122.921 E.36667
G1 X137.643 Y122.921
G1 X129.205 Y131.359 E.36667
G1 X128.672 Y131.359
G1 X137.11 Y122.921 E.36667
G1 X136.577 Y122.921
G1 X128.139 Y131.359 E.36667
G1 X127.606 Y131.359
G1 X136.044 Y122.921 E.36667
G1 X135.51 Y122.921
G1 X127.072 Y131.359 E.36667
G1 X126.539 Y131.359
G1 X134.977 Y122.921 E.36667
G1 X134.444 Y122.921
G1 X126.006 Y131.359 E.36667
G1 X125.472 Y131.359
G1 X133.91 Y122.921 E.36667
G1 X133.377 Y122.921
G1 X124.939 Y131.359 E.36667
G1 X124.406 Y131.359
G1 X132.844 Y122.921 E.36667
G1 X132.311 Y122.921
G1 X123.873 Y131.359 E.36667
G1 X123.54 Y131.159
G1 X131.777 Y122.921 E.35797
G1 X131.244 Y122.921
G1 X123.54 Y130.626 E.3348
G1 X123.54 Y130.092
G1 X130.711 Y122.921 E.31163
G1 X130.178 Y122.921
G1 X123.54 Y129.559 E.28845
G1 X123.54 Y129.026
G1 X129.644 Y122.921 E.26528
G1 X129.111 Y122.921
G1 X123.54 Y128.493 E.24211
G1 X123.54 Y127.959
G1 X128.578 Y122.921 E.21893
G1 X128.045 Y122.921
G1 X123.54 Y127.426 E.19576
G1 X123.54 Y126.893
G1 X127.511 Y122.921 E.17259
G1 X126.978 Y122.921
G1 X123.54 Y126.36 E.14941
G1 X123.54 Y125.826
G1 X126.445 Y122.921 E.12624
G1 X125.911 Y122.921
G1 X123.54 Y125.293 E.10307
G1 X123.54 Y124.76
G1 X125.378 Y122.921 E.0799
G1 X124.845 Y122.921
G1 X123.54 Y124.226 E.05672
G1 X123.54 Y123.693
G1 X124.312 Y122.921 E.03355
M204 S10000
G1 X139.267 Y122.898 F30000
M204 S2000
G1 F7215
G1 X141.705 Y120.46 E.10594
G1 X141.705 Y119.926
G1 X139.267 Y122.364 E.10594
G1 X139.267 Y121.831
G1 X141.705 Y119.393 E.10594
G1 X141.705 Y118.86
G1 X139.267 Y121.298 E.10594
G1 X139.267 Y120.764
G1 X141.705 Y118.326 E.10594
G1 X141.705 Y117.793
G1 X139.267 Y120.231 E.10594
G1 X139.267 Y119.698
G1 X141.705 Y117.26 E.10594
G1 X141.705 Y116.727
G1 X139.267 Y119.165 E.10594
G1 X139.267 Y118.631
G1 X141.705 Y116.193 E.10594
G1 X141.705 Y115.66
G1 X139.267 Y118.098 E.10594
G1 X139.267 Y117.565
G1 X141.705 Y115.127 E.10594
G1 X141.705 Y114.594
G1 X139.267 Y117.032 E.10594
G1 X139.267 Y116.498
G1 X141.705 Y114.06 E.10594
G1 X141.705 Y113.527
G1 X139.267 Y115.965 E.10594
G1 X139.267 Y115.432
G1 X141.505 Y113.194 E.09724
G1 X140.971 Y113.194
G1 X139.267 Y114.898 E.07407
G1 X139.267 Y114.365
G1 X140.438 Y113.194 E.0509
G1 X139.905 Y113.194
G1 X139.267 Y113.832 E.02772
G1 X138.934 Y113.632
G1 X139.705 Y112.861 E.03351
G1 X139.705 Y112.327
G1 X138.4 Y113.632 E.05669
G1 X137.867 Y113.632
G1 X139.705 Y111.794 E.07986
G1 X139.705 Y111.261
G1 X137.334 Y113.632 E.10303
G1 X136.8 Y113.632
G1 X139.238 Y111.194 E.10594
G1 X138.705 Y111.194
G1 X136.267 Y113.632 E.10594
G1 X135.734 Y113.632
G1 X138.172 Y111.194 E.10594
G1 X137.639 Y111.194
G1 X135.201 Y113.632 E.10594
G1 X134.667 Y113.632
G1 X137.105 Y111.194 E.10594
G1 X136.572 Y111.194
G1 X134.134 Y113.632 E.10594
G1 X133.601 Y113.632
G1 X136.039 Y111.194 E.10594
G1 X135.506 Y111.194
G1 X133.068 Y113.632 E.10594
G1 X132.534 Y113.632
G1 X134.972 Y111.194 E.10594
G1 X134.439 Y111.194
G1 X132.001 Y113.632 E.10594
G1 X131.468 Y113.632
G1 X133.906 Y111.194 E.10594
G1 X133.372 Y111.194
G1 X130.934 Y113.632 E.10594
G1 X130.401 Y113.632
G1 X132.839 Y111.194 E.10594
G1 X132.306 Y111.194
G1 X129.868 Y113.632 E.10594
G1 X129.335 Y113.632
G1 X131.773 Y111.194 E.10594
G1 X131.239 Y111.194
G1 X128.801 Y113.632 E.10594
G1 X128.268 Y113.632
G1 X130.706 Y111.194 E.10594
G1 X130.173 Y111.194
G1 X127.735 Y113.632 E.10594
G1 X127.202 Y113.632
G1 X129.64 Y111.194 E.10594
G1 X129.106 Y111.194
G1 X126.668 Y113.632 E.10594
G1 X126.135 Y113.632
G1 X128.573 Y111.194 E.10594
G1 X128.04 Y111.194
G1 X125.602 Y113.632 E.10594
G1 X125.069 Y113.632
G1 X127.507 Y111.194 E.10594
G1 X126.973 Y111.194
G1 X124.535 Y113.632 E.10594
G1 X124.002 Y113.632
G1 X126.44 Y111.194 E.10594
G1 X125.907 Y111.194
G1 X123.54 Y113.561 E.10286
G1 X123.54 Y113.028
G1 X125.373 Y111.194 E.07969
G1 X124.84 Y111.194
G1 X123.54 Y112.495 E.05652
G1 X123.54 Y111.961
G1 X124.307 Y111.194 E.03334
M204 S10000
; WIPE_START
G1 F24000
G1 X123.54 Y111.961 E-.41236
G1 X123.54 Y112.495 E-.20264
G1 X123.809 Y112.225 E-.145
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-.084 J1.214 P1  F30000
G1 X141.635 Y113.457 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.152335
G1 F7215
G1 X141.673 Y113.363 E.00091
G1 X141.673 Y113.175 E.00167
; WIPE_START
G1 F24000
G1 X141.673 Y113.363 E-.49281
G1 X141.635 Y113.457 E-.26719
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-1.208 J-.146 P1  F30000
G1 X139.707 Y129.362 Z2.4
G1 Z2
G1 E.8 F1800
; LINE_WIDTH: 0.0894706
G1 F7215
G1 X139.588 Y129.242 E.00064
; CHANGE_LAYER
; Z_HEIGHT: 2.13667
; LAYER_HEIGHT: 0.136667
; WIPE_START
G1 F24000
G1 X139.707 Y129.362 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 17/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L17
M991 S0 P16 ;notify layer change
G17
G3 Z2.4 I.803 J-.914 P1  F30000
G1 X122.542 Y114.277 Z2.4
G1 Z2.137
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.276667
G1 F1622
G1 X122.535 Y114.27 E.00041
G3 X122.542 Y111.36 I1.549 J-1.451 E.13032
G1 X122.542 Y114.217 E.11612
; WIPE_START
G1 F24000
G1 X122.535 Y114.27 E-.02028
G1 X122.109 Y113.599 E-.3019
G1 X121.96 Y112.819 E-.3019
G1 X122.027 Y112.467 E-.13591
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.537 I.887 J.833 P1  F30000
G1 X124.159 Y110.196 Z2.537
G1 Z2.137
G1 E.8 F1800
G1 F1622
G3 X125.526 Y106.277 I1.284 J-1.75 E.22469
G3 X126.627 Y110.196 I-.19 J2.168 E.21393
G1 X124.219 Y110.196 E.09791
; WIPE_START
G1 F24000
G1 X123.679 Y109.711 E-.27597
G1 X123.377 Y109.107 E-.25644
G1 X123.285 Y108.515 E-.22759
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.537 I.002 J1.217 P1  F30000
G1 X135.159 Y108.496 Z2.537
G1 Z2.137
G1 E.8 F1800
G1 F1622
G1 X135.149 Y108.433 E.00259
G3 X137.402 Y106.273 I2.17 J.009 E.14158
G3 X138.497 Y110.196 I-.19 J2.167 E.21424
G1 X136.042 Y110.196 E.09981
G3 X135.252 Y109.103 I1.277 J-1.754 E.05575
G1 X135.168 Y108.555 E.02253
; CHANGE_LAYER
; Z_HEIGHT: 2.2
; LAYER_HEIGHT: 0.0633333
; WIPE_START
G1 F24000
G1 X135.149 Y108.433 E-.04701
G1 X135.253 Y107.763 E-.25751
G1 X135.555 Y107.16 E-.25641
G1 X135.922 Y106.786 E-.19907
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 18/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L18
M991 S0 P17 ;notify layer change
G17
G3 Z2.537 I-1.068 J.583 P1  F30000
G1 X139.52 Y113.379 Z2.537
M73 P39 R12
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1622
G1 X139.52 Y123.174 E.32495
G1 X123.724 Y123.174 E.52398
G1 X123.724 Y113.379 E.32495
G1 X139.46 Y113.379 E.52199
G1 X139.912 Y112.987 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1622
G1 X139.912 Y123.567 E.32509
G1 X123.332 Y123.567 E.50946
G1 X123.332 Y112.987 E.32509
G1 X139.852 Y112.987 E.50761
M204 S10000
; WIPE_START
G1 F24000
G1 X139.864 Y114.986 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I.84 J-.88 P1  F30000
G1 X138.544 Y113.727 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1622
G1 X139.172 Y113.727 E.02084
G1 X139.172 Y114.727 E.03317
G1 X131.073 Y122.826 E.37996
G1 X134.172 Y122.826 E.10281
G1 X125.073 Y113.727 E.42687
G1 X124.82 Y113.727 E.00838
G1 X124.073 Y114.474 E.03506
G1 X124.073 Y116.103 E.05401
G1 X128.124 Y122.826 F30000
G1 F1622
G1 X126.496 Y122.826 E.05401
G1 X124.073 Y120.403 E.11368
G1 X124.073 Y122.15 E.05796
G1 X132.496 Y113.727 E.39516
G1 X132.748 Y113.727 E.00838
G1 X139.172 Y120.15 E.30133
G1 X139.172 Y122.403 E.07472
G1 X138.748 Y122.826 E.01986
G1 X137.12 Y122.826 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 2.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X138.748 Y122.826 E-.61876
G1 X139.011 Y122.563 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 19/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L19
M991 S0 P18 ;notify layer change
G17
G3 Z2.6 I1.215 J.067 P1  F30000
G1 X139.52 Y113.379 Z2.6
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1312
G1 X139.52 Y123.174 E.32495
G1 X123.724 Y123.174 E.52398
G1 X123.724 Y113.379 E.32495
G1 X139.46 Y113.379 E.52199
G1 X139.912 Y112.987 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1312
G1 X139.912 Y123.567 E.32509
G1 X123.332 Y123.567 E.50946
G1 X123.332 Y112.987 E.32509
G1 X139.852 Y112.987 E.50761
M204 S10000
; WIPE_START
G1 F24000
G1 X139.864 Y114.986 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I.84 J-.88 P1  F30000
G1 X138.544 Y113.727 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1312
G1 X139.172 Y113.727 E.02084
G1 X139.172 Y114.727 E.03317
G1 X131.073 Y122.826 E.37996
G1 X134.172 Y122.826 E.10281
G1 X125.073 Y113.727 E.42687
G1 X124.82 Y113.727 E.00838
G1 X124.073 Y114.474 E.03506
G1 X124.073 Y116.103 E.05401
G1 X128.124 Y122.826 F30000
G1 F1312
G1 X126.496 Y122.826 E.05401
G1 X124.073 Y120.403 E.11368
G1 X124.073 Y122.15 E.05796
G1 X132.496 Y113.727 E.39516
G1 X132.748 Y113.727 E.00838
G1 X139.172 Y120.15 E.30133
G1 X139.172 Y122.403 E.07472
G1 X138.748 Y122.826 E.01986
G1 X137.12 Y122.826 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 2.41333
; LAYER_HEIGHT: 0.0133333
; WIPE_START
G1 F24000
G1 X138.748 Y122.826 E-.61876
G1 X139.011 Y122.563 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 20/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L20
M991 S0 P19 ;notify layer change
G17
G3 Z2.8 I.817 J-.902 P1  F30000
G1 X127.548 Y112.188 Z2.8
G1 Z2.413
G1 E.8 F1800
; FEATURE: Support interface
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.2
G1 F1737
G1 X128.154 Y112.188 E.01861
G2 X127.36 Y111.108 I-2.044 J.671 E.04188
G1 X127.36 Y112.188 E.03318
G1 X126.483 Y112.188 E.02695
G1 X126.483 Y110.965 E.03758
G1 X125.606 Y110.965 E.02695
G1 X125.606 Y112.188 E.03758
G1 X124.728 Y112.188 E.02695
G1 X124.728 Y110.965 E.03758
G1 X123.851 Y110.965 E.02695
G1 X123.851 Y112.188 E.03758
G1 X123.311 Y112.188 E.01661
G1 X123.311 Y110.965 E.03758
G1 X123.663 Y110.965 E.01082
M73 P40 R12
G1 X122.942 Y111.059 F30000
; FEATURE: Support
; LAYER_HEIGHT: 0.276667
G1 F1737
G1 X122.942 Y112.196 E.04621
G2 X122.542 Y112.302 I-.147 J.253 E.01868
G1 X122.542 Y114.241 E.07884
G3 X122.893 Y111.092 I1.549 J-1.421 E.14588
; WIPE_START
G1 F24000
G1 X122.942 Y112.196 E-.41987
G1 X122.647 Y112.196 E-.11186
G1 X122.542 Y112.302 E-.05676
G1 X122.542 Y112.753 E-.17151
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.813 I1.096 J.529 P1  F30000
G1 X123.864 Y110.012 Z2.813
G1 Z2.413
G1 E.8 F1800
G1 F1737
G3 X125.524 Y106.408 I1.578 J-1.457 E.20562
G3 X126.301 Y110.479 I-.187 J2.145 E.22678
G1 X126.324 Y110.596 E.00484
G1 X124.427 Y110.596 E.0771
G1 X124.469 Y110.469 E.00542
G3 X123.904 Y110.055 I.973 J-1.915 E.0286
; WIPE_START
G1 F24000
G1 X123.497 Y109.455 E-.27532
G1 X123.301 Y108.678 E-.30468
G1 X123.345 Y108.206 E-.18
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.813 I-.075 J1.215 P1  F30000
G1 X135.21 Y108.94 Z2.813
G1 Z2.413
G1 E.8 F1800
G1 F1737
G3 X137.401 Y106.404 I2.105 J-.396 E.15644
G3 X137.838 Y110.596 I-.182 J2.138 E.24109
G1 X136.701 Y110.596 E.04623
G3 X135.222 Y108.998 I.614 J-2.052 E.09285
; CHANGE_LAYER
; Z_HEIGHT: 2.6
; LAYER_HEIGHT: 0.186666
; WIPE_START
G1 F24000
G1 X135.211 Y108.137 E-.32722
G1 X135.434 Y107.507 E-.25401
G1 X135.73 Y107.142 E-.17877
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 21/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L21
M991 S0 P20 ;notify layer change
G17
G3 Z2.813 I-1.04 J.632 P1  F30000
G1 X139.52 Y113.379 Z2.813
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1737
G1 X139.52 Y123.174 E.32495
G1 X123.724 Y123.174 E.52398
G1 X123.724 Y113.379 E.32495
G1 X139.46 Y113.379 E.52199
G1 X139.912 Y112.987 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1737
G1 X139.912 Y123.567 E.32509
G1 X123.332 Y123.567 E.50946
G1 X123.332 Y112.987 E.32509
G1 X139.852 Y112.987 E.50761
M204 S10000
; WIPE_START
G1 F24000
G1 X139.864 Y114.986 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I.84 J-.88 P1  F30000
G1 X138.544 Y113.727 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1737
G1 X139.172 Y113.727 E.02084
G1 X139.172 Y114.727 E.03317
G1 X131.073 Y122.826 E.37996
G1 X134.172 Y122.826 E.10281
G1 X125.073 Y113.727 E.42687
G1 X124.82 Y113.727 E.00838
G1 X124.073 Y114.474 E.03506
G1 X124.073 Y116.103 E.05401
G1 X128.124 Y122.826 F30000
G1 F1737
G1 X126.496 Y122.826 E.05401
G1 X124.073 Y120.403 E.11368
G1 X124.073 Y122.15 E.05796
G1 X132.496 Y113.727 E.39516
G1 X132.748 Y113.727 E.00838
G1 X139.172 Y120.15 E.30133
G1 X139.172 Y122.403 E.07472
G1 X138.748 Y122.826 E.01986
G1 X137.12 Y122.826 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 2.69
; LAYER_HEIGHT: 0.0900002
; WIPE_START
G1 F24000
G1 X138.748 Y122.826 E-.61876
G1 X139.011 Y122.563 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 22/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L22
M991 S0 P21 ;notify layer change
G17
G3 Z3 I.817 J-.902 P1  F30000
G1 X127.548 Y112.188 Z3
G1 Z2.69
G1 E.8 F1800
; FEATURE: Support interface
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.2
G1 F1732
G1 X128.127 Y112.181 E.01777
G2 X127.36 Y111.138 I-1.973 J.647 E.04046
G1 X127.36 Y112.188 E.03228
G1 X126.483 Y112.188 E.02695
G1 X126.483 Y110.965 E.03758
G1 X125.606 Y110.965 E.02695
G1 X125.606 Y112.188 E.03758
G1 X124.728 Y112.188 E.02695
G1 X124.728 Y110.965 E.03758
G1 X123.851 Y110.965 E.02695
G1 X123.851 Y112.188 E.03758
G1 X123.311 Y112.188 E.01661
G1 X123.311 Y110.965 E.03758
G1 X123.663 Y110.965 E.01082
G1 X122.942 Y111.089 F30000
; FEATURE: Support
; LAYER_HEIGHT: 0.276667
G1 F1732
G1 X122.942 Y112.196 E.04502
G2 X122.542 Y112.302 I-.147 J.253 E.01868
G1 X122.542 Y114.205 E.07735
G3 X122.893 Y111.122 I1.548 J-1.385 E.14242
; WIPE_START
G1 F24000
G1 X122.942 Y112.196 E-.40861
G1 X122.647 Y112.196 E-.11186
G1 X122.542 Y112.302 E-.05676
G1 X122.542 Y112.783 E-.18277
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.09 I1.101 J.518 P1  F30000
G1 X123.837 Y110.031 Z3.09
G1 Z2.69
M73 P41 R12
G1 E.8 F1800
G1 F1732
G1 X123.795 Y110 E.00216
G3 X125.523 Y106.538 I1.65 J-1.339 E.19773
G3 X126.369 Y110.515 I-.182 J2.117 E.22035
G1 X126.385 Y110.596 E.00338
G1 X124.343 Y110.596 E.08298
G1 X124.376 Y110.498 E.00422
G1 X123.883 Y110.071 E.02651
; WIPE_START
G1 F24000
G1 X123.795 Y110 E-.04294
G1 X123.467 Y109.428 E-.25053
G1 X123.322 Y108.648 E-.30133
G1 X123.388 Y108.219 E-.1652
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.09 I-.057 J1.216 P1  F30000
G1 X135.2 Y108.776 Z3.09
G1 Z2.69
G1 E.8 F1800
G1 F1732
G3 X137.399 Y106.533 I2.115 J-.126 E.14384
G3 X138.061 Y110.596 I-.181 J2.115 E.22852
G1 X136.479 Y110.596 E.06428
G3 X135.205 Y108.835 I.836 J-1.947 E.09281
; CHANGE_LAYER
; Z_HEIGHT: 2.8
; LAYER_HEIGHT: 0.11
; WIPE_START
G1 F24000
G1 X135.263 Y108.116 E-.274
G1 X135.521 Y107.509 E-.25083
G1 X135.941 Y107.054 E-.23517
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 23/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L23
M991 S0 P22 ;notify layer change
G17
G3 Z3.09 I-1.059 J.599 P1  F30000
G1 X139.52 Y113.379 Z3.09
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1732
G1 X139.52 Y123.174 E.32495
G1 X123.724 Y123.174 E.52398
G1 X123.724 Y113.379 E.32495
G1 X139.46 Y113.379 E.52199
G1 X139.912 Y112.987 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1732
G1 X139.912 Y123.567 E.32509
G1 X123.332 Y123.567 E.50946
G1 X123.332 Y112.987 E.32509
G1 X139.852 Y112.987 E.50761
M204 S10000
; WIPE_START
G1 F24000
G1 X139.864 Y114.986 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I.84 J-.88 P1  F30000
G1 X138.544 Y113.727 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1732
G1 X139.172 Y113.727 E.02084
G1 X139.172 Y114.727 E.03317
G1 X131.073 Y122.826 E.37996
G1 X134.172 Y122.826 E.10281
G1 X125.073 Y113.727 E.42687
M73 P41 R11
G1 X124.82 Y113.727 E.00838
G1 X124.073 Y114.474 E.03506
G1 X124.073 Y116.103 E.05401
G1 X128.124 Y122.826 F30000
G1 F1732
G1 X126.496 Y122.826 E.05401
G1 X124.073 Y120.403 E.11368
G1 X124.073 Y122.15 E.05796
G1 X132.496 Y113.727 E.39516
G1 X132.748 Y113.727 E.00838
G1 X139.172 Y120.15 E.30133
G1 X139.172 Y122.403 E.07472
G1 X138.748 Y122.826 E.01986
G1 X137.12 Y122.826 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 2.96667
; LAYER_HEIGHT: 0.166667
; WIPE_START
G1 F24000
G1 X138.748 Y122.826 E-.61876
G1 X139.011 Y122.563 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 24/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L24
M991 S0 P23 ;notify layer change
G17
G3 Z3.2 I1.204 J-.179 P1  F30000
G1 X137.27 Y110.834 Z3.2
G1 Z2.967
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.276667
G1 F1651
G3 X137.27 Y106.656 I-.003 J-2.089 E.26697
G1 X137.398 Y106.66 E.00522
G3 X137.329 Y110.833 I-.131 J2.085 E.25891
; WIPE_START
G1 F24000
G1 X136.399 Y110.637 E-.36097
G1 X135.778 Y110.177 E-.29351
G1 X135.632 Y109.941 E-.10552
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.367 I-.35 J-1.166 P1  F30000
G1 X128.114 Y112.196 Z3.367
G1 Z2.967
G1 E.8 F1800
G1 F1651
G1 X122.647 Y112.196 E.22223
G1 X122.542 Y112.302 E.00607
G1 X122.542 Y114.168 E.07586
G3 X124.217 Y110.775 I1.544 J-1.347 E.19598
G1 X124.302 Y110.519 E.01096
G3 X125.521 Y106.666 I1.14 J-1.759 E.22194
G3 X126.427 Y110.559 I-.185 J2.095 E.21444
G1 X126.473 Y110.791 E.00958
G3 X128.095 Y112.14 I-.336 J2.054 E.08995
; CHANGE_LAYER
; Z_HEIGHT: 3
; LAYER_HEIGHT: 0.0333333
; WIPE_START
G1 F24000
G1 X126.095 Y112.16 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 25/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L25
M991 S0 P24 ;notify layer change
G17
G3 Z3.367 I-.11 J1.212 P1  F30000
G1 X139.52 Y113.379 Z3.367
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1651
G1 X139.52 Y123.174 E.32495
G1 X123.724 Y123.174 E.52398
G1 X123.724 Y113.379 E.32495
G1 X139.46 Y113.379 E.52199
G1 X139.912 Y112.987 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1651
G1 X139.912 Y123.567 E.32509
G1 X123.332 Y123.567 E.50946
G1 X123.332 Y112.987 E.32509
G1 X139.852 Y112.987 E.50761
M204 S10000
; WIPE_START
G1 F24000
G1 X139.864 Y114.986 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.84 J-.88 P1  F30000
G1 X138.544 Y113.727 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1651
G1 X139.172 Y113.727 E.02084
G1 X139.172 Y114.727 E.03317
G1 X131.073 Y122.826 E.37996
G1 X134.172 Y122.826 E.10281
G1 X125.073 Y113.727 E.42687
G1 X124.82 Y113.727 E.00838
G1 X124.073 Y114.474 E.03506
G1 X124.073 Y116.103 E.05401
G1 X128.124 Y122.826 F30000
G1 F1651
G1 X126.496 Y122.826 E.05401
G1 X124.073 Y120.403 E.11368
G1 X124.073 Y122.15 E.05796
G1 X132.496 Y113.727 E.39516
G1 X132.748 Y113.727 E.00838
G1 X139.172 Y120.15 E.30133
G1 X139.172 Y122.403 E.07472
G1 X138.748 Y122.826 E.01986
G1 X137.12 Y122.826 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 3.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X138.748 Y122.826 E-.61876
G1 X139.011 Y122.563 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 26/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L26
M991 S0 P25 ;notify layer change
G17
G3 Z3.4 I1.215 J.067 P1  F30000
G1 X139.52 Y113.379 Z3.4
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1312
G1 X139.52 Y123.174 E.32495
G1 X123.724 Y123.174 E.52398
G1 X123.724 Y113.379 E.32495
M73 P42 R11
G1 X139.46 Y113.379 E.52199
G1 X139.912 Y112.987 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1312
G1 X139.912 Y123.567 E.32509
G1 X123.332 Y123.567 E.50946
G1 X123.332 Y112.987 E.32509
G1 X139.852 Y112.987 E.50761
M204 S10000
; WIPE_START
G1 F24000
G1 X139.864 Y114.986 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I.84 J-.88 P1  F30000
G1 X138.544 Y113.727 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1312
G1 X139.172 Y113.727 E.02084
G1 X139.172 Y114.727 E.03317
G1 X131.073 Y122.826 E.37996
G1 X134.172 Y122.826 E.10281
G1 X125.073 Y113.727 E.42687
G1 X124.82 Y113.727 E.00838
G1 X124.073 Y114.474 E.03506
G1 X124.073 Y116.103 E.05401
G1 X128.124 Y122.826 F30000
G1 F1312
G1 X126.496 Y122.826 E.05401
G1 X124.073 Y120.403 E.11368
G1 X124.073 Y122.15 E.05796
G1 X132.496 Y113.727 E.39516
G1 X132.748 Y113.727 E.00838
G1 X139.172 Y120.15 E.30133
G1 X139.172 Y122.403 E.07472
G1 X138.748 Y122.826 E.01986
G1 X137.12 Y122.826 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 3.24333
; LAYER_HEIGHT: 0.0433333
; WIPE_START
G1 F24000
G1 X138.748 Y122.826 E-.61876
G1 X139.011 Y122.563 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 27/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L27
M991 S0 P26 ;notify layer change
G17
G3 Z3.6 I1.204 J-.18 P1  F30000
G1 X137.27 Y110.91 Z3.6
G1 Z3.243
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.276667
G1 F1645
G3 X137.27 Y106.782 I-.003 J-2.064 E.26378
G1 X137.397 Y106.786 E.00516
G3 X137.329 Y110.909 I-.129 J2.06 E.25578
; WIPE_START
G1 F24000
G1 X136.41 Y110.715 E-.35696
G1 X135.796 Y110.261 E-.29003
G1 X135.639 Y110.009 E-.11301
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.643 I-.339 J-1.169 P1  F30000
G1 X128.089 Y112.196 Z3.643
G1 Z3.243
G1 E.8 F1800
G1 F1645
G1 X122.647 Y112.196 E.22121
G1 X122.542 Y112.302 E.00607
G1 X122.542 Y114.131 E.07438
G3 X124.163 Y110.793 I1.544 J-1.313 E.19066
G1 X124.242 Y110.553 E.01025
G3 X125.52 Y106.793 I1.195 J-1.691 E.21608
G3 X126.479 Y110.595 I-.181 J2.068 E.2087
G1 X126.524 Y110.827 E.00958
G3 X128.07 Y112.14 I-.38 J2.014 E.08624
; CHANGE_LAYER
; Z_HEIGHT: 3.4
; LAYER_HEIGHT: 0.156667
; WIPE_START
G1 F24000
G1 X126.07 Y112.161 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 28/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L28
M991 S0 P27 ;notify layer change
G17
G3 Z3.643 I-.11 J1.212 P1  F30000
G1 X139.52 Y113.379 Z3.643
M73 P43 R11
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1645
G1 X139.52 Y123.174 E.32495
G1 X123.724 Y123.174 E.52398
G1 X123.724 Y113.379 E.32495
G1 X139.46 Y113.379 E.52199
G1 X139.912 Y112.987 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1645
G1 X139.912 Y123.567 E.32509
G1 X123.332 Y123.567 E.50946
G1 X123.332 Y112.987 E.32509
G1 X139.852 Y112.987 E.50761
M204 S10000
; WIPE_START
G1 F24000
G1 X139.864 Y114.986 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I.84 J-.88 P1  F30000
G1 X138.544 Y113.727 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1645
G1 X139.172 Y113.727 E.02084
G1 X139.172 Y114.727 E.03317
G1 X131.073 Y122.826 E.37996
G1 X134.172 Y122.826 E.10281
G1 X125.073 Y113.727 E.42687
G1 X124.82 Y113.727 E.00838
G1 X124.073 Y114.474 E.03506
G1 X124.073 Y116.103 E.05401
G1 X128.124 Y122.826 F30000
G1 F1645
G1 X126.496 Y122.826 E.05401
G1 X124.073 Y120.403 E.11368
G1 X124.073 Y122.15 E.05796
G1 X132.496 Y113.727 E.39516
G1 X132.748 Y113.727 E.00838
G1 X139.172 Y120.15 E.30133
G1 X139.172 Y122.403 E.07472
G1 X138.748 Y122.826 E.01986
G1 X137.12 Y122.826 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 3.52
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F24000
G1 X138.748 Y122.826 E-.61876
G1 X139.011 Y122.563 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 29/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L29
M991 S0 P28 ;notify layer change
G17
G3 Z3.8 I1.203 J-.181 P1  F30000
G1 X137.27 Y110.984 Z3.8
G1 Z3.52
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.276667
G1 F1639
G3 X137.27 Y106.907 I-.003 J-2.039 E.26058
G1 X137.395 Y106.911 E.0051
G3 X137.329 Y110.983 I-.128 J2.035 E.25265
; WIPE_START
G1 F24000
G1 X136.42 Y110.792 E-.35295
G1 X135.814 Y110.343 E-.28654
G1 X135.646 Y110.074 E-.12051
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.92 I-.328 J-1.172 P1  F30000
G1 X128.064 Y112.196 Z3.92
G1 Z3.52
G1 E.8 F1800
G1 F1639
G1 X122.647 Y112.196 E.22017
G1 X122.542 Y112.302 E.00607
G1 X122.54 Y114.093 E.0728
G3 X124.108 Y110.819 I1.547 J-1.271 E.18473
G1 X124.192 Y110.59 E.00991
G3 X125.519 Y106.918 I1.249 J-1.625 E.21026
G3 X126.523 Y110.639 I-.175 J2.043 E.20372
G1 X126.565 Y110.854 E.00894
G3 X128.044 Y112.14 I-.438 J1.997 E.08305
; CHANGE_LAYER
; Z_HEIGHT: 3.6
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F24000
G1 X126.044 Y112.161 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 30/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L30
M991 S0 P29 ;notify layer change
G17
G3 Z3.92 I-.11 J1.212 P1  F30000
G1 X139.52 Y113.379 Z3.92
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1639
G1 X139.52 Y123.174 E.32495
G1 X123.724 Y123.174 E.52398
G1 X123.724 Y113.379 E.32495
G1 X139.46 Y113.379 E.52199
G1 X139.912 Y112.987 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1639
G1 X139.912 Y123.567 E.32509
G1 X123.332 Y123.567 E.50946
G1 X123.332 Y112.987 E.32509
G1 X139.852 Y112.987 E.50761
M204 S10000
; WIPE_START
G1 F24000
G1 X139.864 Y114.986 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I.84 J-.88 P1  F30000
G1 X138.544 Y113.727 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1639
G1 X139.172 Y113.727 E.02084
G1 X139.172 Y114.727 E.03317
G1 X131.073 Y122.826 E.37996
G1 X134.172 Y122.826 E.10281
G1 X125.073 Y113.727 E.42687
G1 X124.82 Y113.727 E.00838
G1 X124.073 Y114.474 E.03506
G1 X124.073 Y116.103 E.05401
G1 X128.124 Y122.826 F30000
G1 F1639
G1 X126.496 Y122.826 E.05401
G1 X124.073 Y120.403 E.11368
G1 X124.073 Y122.15 E.05796
G1 X132.496 Y113.727 E.39516
G1 X132.748 Y113.727 E.00838
G1 X139.172 Y120.15 E.30133
G1 X139.172 Y122.403 E.07472
G1 X138.748 Y122.826 E.01986
M73 P44 R11
G1 X137.12 Y122.826 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 3.79667
; LAYER_HEIGHT: 0.196667
; WIPE_START
G1 F24000
G1 X138.748 Y122.826 E-.61876
G1 X139.011 Y122.563 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 31/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L31
M991 S0 P30 ;notify layer change
G17
G3 Z4 I1.203 J-.182 P1  F30000
G1 X137.271 Y111.056 Z4
G1 Z3.797
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.276667
G1 F1945
G3 X137.27 Y107.029 I-.003 J-2.014 E.25737
G1 X137.394 Y107.033 E.00503
G3 X137.329 Y111.055 I-.126 J2.01 E.2495
; WIPE_START
G1 F24000
G1 X136.431 Y110.866 E-.34894
G1 X135.832 Y110.423 E-.28306
G1 X135.654 Y110.137 E-.128
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.197 I-.318 J-1.175 P1  F30000
G1 X128.038 Y112.196 Z4.197
G1 Z3.797
G1 E.8 F1800
G1 F1945
G1 X122.647 Y112.196 E.21913
G1 X122.542 Y112.302 E.00607
G1 X122.542 Y114.056 E.0713
G3 X124.072 Y110.837 I1.547 J-1.238 E.1802
G1 X124.146 Y110.613 E.00958
G3 X125.517 Y107.04 I1.291 J-1.554 E.2043
G3 X126.561 Y110.675 I-.171 J2.016 E.19851
G1 X126.603 Y110.891 E.00894
G3 X128.018 Y112.14 I-.467 J1.954 E.07985
; CHANGE_LAYER
; Z_HEIGHT: 3.8
; LAYER_HEIGHT: 0.00333333
; WIPE_START
G1 F24000
G1 X126.018 Y112.161 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 32/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L32
M991 S0 P31 ;notify layer change
G17
G3 Z4.197 I-.109 J1.212 P1  F30000
G1 X139.52 Y113.379 Z4.197
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1945
G1 X139.52 Y123.174 E.32495
G1 X123.724 Y123.174 E.52398
G1 X123.724 Y113.379 E.32495
G1 X139.46 Y113.379 E.52199
G1 X139.912 Y112.987 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1945
G1 X139.912 Y123.567 E.32509
G1 X123.332 Y123.567 E.50946
G1 X123.332 Y112.987 E.32509
G1 X139.852 Y112.987 E.50761
M204 S10000
; WIPE_START
G1 F24000
G1 X139.864 Y114.986 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I.84 J-.88 P1  F30000
G1 X138.544 Y113.727 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1945
G1 X139.172 Y113.727 E.02084
G1 X139.172 Y114.727 E.03317
G1 X134.773 Y119.125 E.20634
G1 X134.773 Y122.826 E.12277
G1 X138.748 Y122.826 E.13186
G1 X139.172 Y122.403 E.01986
G1 X139.172 Y120.15 E.07472
G1 X132.748 Y113.727 E.30133
G1 X132.496 Y113.727 E.00838
G1 X130.598 Y115.625 E.08906
G1 X126.971 Y115.625 E.1203
G1 X125.073 Y113.727 E.08906
G1 X124.82 Y113.727 E.00838
G1 X124.073 Y114.474 E.03506
G1 X124.073 Y120.403 E.19666
G1 X125.471 Y121.801 E.0656
G1 X125.471 Y120.752 E.03481
G1 X124.073 Y122.15 E.0656
G1 X124.073 Y122.826 E.02242
G1 X125.025 Y122.826 E.03159
G1 X126.285 Y121.566 F30000
G1 F1945
G1 X126.285 Y119.938 E.05401
G1 X129.783 Y116.439 E.16411
G1 X127.785 Y116.439 E.06629
G1 X133.765 Y122.419 E.28052
G1 X131.48 Y122.419 E.0758
G1 X133.959 Y119.939 E.11633
G1 X133.959 Y118.311 E.05401
G1 X133.749 Y116.05 F30000
G1 F1945
G1 X134.366 Y116.691 E.02952
G1 X134.366 Y122.826 E.20352
G1 X125.878 Y122.826 E.28158
G1 X125.878 Y116.691 E.20352
G1 X126.495 Y116.05 E.02952
G1 X133.693 Y116.032 E.23877
; CHANGE_LAYER
; Z_HEIGHT: 4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X131.693 Y116.037 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 33/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L33
M991 S0 P32 ;notify layer change
G17
G3 Z4.2 I.391 J1.152 P1  F30000
G1 X139.52 Y113.379 Z4.2
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
M73 P45 R11
G1 F1617
G1 X139.52 Y123.174 E.32495
G1 X123.724 Y123.174 E.52398
G1 X123.724 Y113.379 E.32495
G1 X139.46 Y113.379 E.52199
G1 X139.912 Y112.987 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1617
G1 X139.912 Y123.567 E.32509
G1 X123.332 Y123.567 E.50946
G1 X123.332 Y112.987 E.32509
G1 X139.852 Y112.987 E.50761
M204 S10000
; WIPE_START
G1 F24000
G1 X139.864 Y114.986 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I.84 J-.88 P1  F30000
G1 X138.544 Y113.727 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1617
G1 X139.172 Y113.727 E.02084
G1 X139.172 Y114.727 E.03317
G1 X134.773 Y119.125 E.20634
G1 X134.773 Y122.826 E.12277
G1 X138.748 Y122.826 E.13186
G1 X139.172 Y122.403 E.01986
G1 X139.172 Y120.15 E.07472
G1 X132.748 Y113.727 E.30133
G1 X132.496 Y113.727 E.00838
G1 X130.598 Y115.625 E.08906
G1 X126.971 Y115.625 E.1203
G1 X125.073 Y113.727 E.08906
G1 X124.82 Y113.727 E.00838
G1 X124.073 Y114.474 E.03506
G1 X124.073 Y120.403 E.19666
G1 X125.471 Y121.801 E.0656
G1 X125.471 Y120.752 E.03481
G1 X124.073 Y122.15 E.0656
G1 X124.073 Y122.826 E.02242
G1 X125.025 Y122.826 E.03159
G1 X126.285 Y121.566 F30000
G1 F1617
G1 X126.285 Y119.938 E.05401
G1 X129.783 Y116.439 E.16411
G1 X127.785 Y116.439 E.06629
G1 X133.765 Y122.419 E.28052
G1 X131.48 Y122.419 E.0758
G1 X133.959 Y119.939 E.11633
G1 X133.959 Y118.311 E.05401
G1 X133.749 Y116.05 F30000
G1 F1617
G1 X134.366 Y116.691 E.02952
G1 X134.366 Y122.826 E.20352
G1 X125.878 Y122.826 E.28158
G1 X125.878 Y116.691 E.20352
G1 X126.495 Y116.05 E.02952
G1 X133.693 Y116.032 E.23877
; CHANGE_LAYER
; Z_HEIGHT: 4.07333
; LAYER_HEIGHT: 0.0733333
; WIPE_START
G1 F24000
G1 X131.693 Y116.037 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 34/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L34
M991 S0 P33 ;notify layer change
G17
G3 Z4.4 I.973 J.73 P1  F30000
G1 X135.835 Y110.516 Z4.4
G1 Z4.073
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.276667
G1 F1938
G3 X137.271 Y107.15 I1.433 J-1.378 E.18896
G1 X137.393 Y107.154 E.00497
G3 X135.876 Y110.558 I-.125 J1.984 E.31153
; WIPE_START
G1 F24000
G1 X135.458 Y109.872 E-.30554
G1 X135.32 Y109.138 E-.28347
G1 X135.403 Y108.696 E-.171
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.473 I-.521 J-1.1 P1  F30000
G1 X128.012 Y112.196 Z4.473
G1 Z4.073
G1 E.8 F1800
G1 F1938
G1 X122.647 Y112.196 E.21808
G1 X122.542 Y112.302 E.00607
G1 X122.542 Y114.016 E.06969
G3 X124.034 Y110.865 I1.543 J-1.198 E.17513
G1 X124.112 Y110.651 E.00926
G3 X125.516 Y107.161 I1.321 J-1.496 E.19952
G3 X126.592 Y110.719 I-.173 J1.994 E.19374
G1 X126.639 Y110.926 E.00863
G3 X127.992 Y112.14 I-.497 J1.914 E.07676
; CHANGE_LAYER
; Z_HEIGHT: 4.2
; LAYER_HEIGHT: 0.126667
; WIPE_START
G1 F24000
G1 X125.992 Y112.161 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 35/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L35
M991 S0 P34 ;notify layer change
G17
G3 Z4.473 I-.109 J1.212 P1  F30000
G1 X139.52 Y113.379 Z4.473
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1938
G1 X139.52 Y123.174 E.32495
G1 X123.724 Y123.174 E.52398
G1 X123.724 Y113.379 E.32495
G1 X139.46 Y113.379 E.52199
G1 X139.912 Y112.987 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1938
G1 X139.912 Y123.567 E.32509
G1 X123.332 Y123.567 E.50946
G1 X123.332 Y112.987 E.32509
G1 X139.852 Y112.987 E.50761
M204 S10000
; WIPE_START
G1 F24000
G1 X139.864 Y114.986 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I.84 J-.88 P1  F30000
M73 P46 R11
G1 X138.544 Y113.727 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1938
G1 X139.172 Y113.727 E.02084
G1 X139.172 Y114.727 E.03317
G1 X134.773 Y119.125 E.20634
G1 X134.773 Y122.826 E.12277
G1 X138.748 Y122.826 E.13186
G1 X139.172 Y122.403 E.01986
G1 X139.172 Y120.15 E.07472
G1 X132.748 Y113.727 E.30133
G1 X132.496 Y113.727 E.00838
G1 X130.598 Y115.625 E.08906
G1 X126.971 Y115.625 E.1203
G1 X125.073 Y113.727 E.08906
G1 X124.82 Y113.727 E.00838
G1 X124.073 Y114.474 E.03506
G1 X124.073 Y120.403 E.19666
G1 X125.471 Y121.801 E.0656
G1 X125.471 Y120.752 E.03481
G1 X124.073 Y122.15 E.0656
G1 X124.073 Y122.826 E.02242
G1 X125.025 Y122.826 E.03159
G1 X126.285 Y121.566 F30000
G1 F1938
G1 X126.285 Y119.938 E.05401
G1 X129.783 Y116.439 E.16411
G1 X127.785 Y116.439 E.06629
G1 X133.765 Y122.419 E.28052
G1 X131.48 Y122.419 E.0758
G1 X133.959 Y119.939 E.11633
G1 X133.959 Y118.311 E.05401
G1 X133.749 Y116.05 F30000
M73 P46 R10
G1 F1938
G1 X134.366 Y116.691 E.02952
G1 X134.366 Y122.826 E.20352
G1 X125.878 Y122.826 E.28158
G1 X125.878 Y116.691 E.20352
G1 X126.495 Y116.05 E.02952
G1 X133.693 Y116.032 E.23877
; CHANGE_LAYER
; Z_HEIGHT: 4.35
; LAYER_HEIGHT: 0.15
; WIPE_START
G1 F24000
G1 X131.693 Y116.037 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 36/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L36
M991 S0 P35 ;notify layer change
G17
G3 Z4.6 I.967 J.739 P1  F30000
G1 X135.853 Y110.591 Z4.6
G1 Z4.35
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.276667
G1 F1933
G3 X137.271 Y107.268 I1.415 J-1.36 E.18655
G1 X137.392 Y107.272 E.00491
G3 X135.895 Y110.633 I-.123 J1.959 E.30755
; WIPE_START
G1 F24000
G1 X135.481 Y109.955 E-.30194
G1 X135.345 Y109.231 E-.27988
G1 X135.431 Y108.77 E-.17819
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.75 I-.509 J-1.106 P1  F30000
G1 X127.986 Y112.196 Z4.75
G1 Z4.35
G1 E.8 F1800
G1 F1933
G1 X122.647 Y112.196 E.21704
G1 X122.542 Y112.302 E.00607
G1 X122.542 Y113.977 E.06809
G3 X124.004 Y110.892 I1.541 J-1.158 E.17041
G1 X124.082 Y110.678 E.00926
G3 X125.515 Y107.28 I1.349 J-1.432 E.19426
G3 X126.624 Y110.751 I-.169 J1.967 E.18872
G2 X126.873 Y111.027 I.207 J.064 E.0182
G3 X127.966 Y112.141 I-.737 J1.817 E.06522
; CHANGE_LAYER
; Z_HEIGHT: 4.4
; LAYER_HEIGHT: 0.0500002
; WIPE_START
G1 F24000
G1 X125.966 Y112.162 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 37/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L37
M991 S0 P36 ;notify layer change
G17
G3 Z4.75 I-.109 J1.212 P1  F30000
G1 X139.52 Y113.379 Z4.75
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1933
G1 X139.52 Y123.174 E.32495
G1 X123.724 Y123.174 E.52398
G1 X123.724 Y113.379 E.32495
G1 X139.46 Y113.379 E.52199
G1 X139.912 Y112.987 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1933
G1 X139.912 Y123.567 E.32509
G1 X123.332 Y123.567 E.50946
G1 X123.332 Y112.987 E.32509
G1 X139.852 Y112.987 E.50761
M204 S10000
; WIPE_START
G1 F24000
G1 X139.864 Y114.986 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I.84 J-.88 P1  F30000
G1 X138.544 Y113.727 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1933
G1 X139.172 Y113.727 E.02084
G1 X139.172 Y114.727 E.03317
G1 X134.773 Y119.125 E.20634
G1 X134.773 Y122.826 E.12277
G1 X138.748 Y122.826 E.13186
G1 X139.172 Y122.403 E.01986
G1 X139.172 Y120.15 E.07472
G1 X132.748 Y113.727 E.30133
G1 X132.496 Y113.727 E.00838
G1 X130.598 Y115.625 E.08906
G1 X126.971 Y115.625 E.1203
G1 X125.073 Y113.727 E.08906
G1 X124.82 Y113.727 E.00838
G1 X124.073 Y114.474 E.03506
G1 X124.073 Y120.403 E.19666
G1 X125.471 Y121.801 E.0656
G1 X125.471 Y120.752 E.03481
G1 X124.073 Y122.15 E.0656
G1 X124.073 Y122.826 E.02242
G1 X125.025 Y122.826 E.03159
G1 X126.285 Y121.566 F30000
G1 F1933
G1 X126.285 Y119.938 E.05401
G1 X129.783 Y116.439 E.16411
G1 X127.785 Y116.439 E.06629
G1 X133.765 Y122.419 E.28052
G1 X131.48 Y122.419 E.0758
G1 X133.959 Y119.939 E.11633
G1 X133.959 Y118.311 E.05401
G1 X133.749 Y116.05 F30000
G1 F1933
G1 X134.366 Y116.691 E.02952
G1 X134.366 Y122.826 E.20352
G1 X125.878 Y122.826 E.28158
G1 X125.878 Y116.691 E.20352
G1 X126.495 Y116.05 E.02952
G1 X133.693 Y116.032 E.23877
; CHANGE_LAYER
; Z_HEIGHT: 4.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X131.693 Y116.037 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 38/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L38
M991 S0 P37 ;notify layer change
G17
G3 Z4.8 I.391 J1.152 P1  F30000
M73 P47 R10
G1 X139.52 Y113.379 Z4.8
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1857
G1 X139.52 Y123.174 E.32495
G1 X123.724 Y123.174 E.52398
G1 X123.724 Y113.379 E.32495
G1 X139.46 Y113.379 E.52199
G1 X139.912 Y112.987 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1857
G1 X139.912 Y123.567 E.32509
G1 X123.332 Y123.567 E.50946
G1 X123.332 Y112.987 E.32509
G1 X139.852 Y112.987 E.50761
M204 S10000
; WIPE_START
G1 F24000
G1 X139.864 Y114.986 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I.84 J-.88 P1  F30000
G1 X138.544 Y113.727 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1857
G1 X139.172 Y113.727 E.02084
G1 X139.172 Y114.727 E.03317
G1 X134.774 Y119.125 E.20634
G1 X134.774 Y122.826 E.12277
G1 X138.748 Y122.826 E.13186
G1 X139.172 Y122.403 E.01986
G1 X139.172 Y120.15 E.07472
G1 X132.748 Y113.727 E.30133
G1 X132.496 Y113.727 E.00838
G1 X130.598 Y115.625 E.08905
G1 X126.971 Y115.625 E.1203
G1 X125.073 Y113.727 E.08905
G1 X124.82 Y113.727 E.00838
G1 X124.073 Y114.474 E.03506
G1 X124.073 Y120.403 E.19666
G1 X125.471 Y121.801 E.0656
G1 X125.471 Y120.752 E.03481
G1 X124.073 Y122.15 E.0656
G1 X124.073 Y122.826 E.02242
G1 X125.025 Y122.826 E.03159
G1 X125.908 Y116.38 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.418186
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X125.908 Y122.805 E.35954
G1 X126.377 Y122.805 E.0262
G1 X126.377 Y116.198 E.36971
G1 X126.541 Y116.054 E.01223
G1 X126.845 Y116.054 E.01702
G1 X126.845 Y122.805 E.37779
G1 X127.313 Y122.805 E.0262
G1 X127.313 Y116.054 E.37779
G1 X127.781 Y116.054 E.0262
G1 X127.781 Y122.805 E.37779
G1 X128.249 Y122.805 E.0262
G1 X128.249 Y116.054 E.37779
G1 X128.718 Y116.054 E.0262
G1 X128.718 Y122.805 E.37779
G1 X129.186 Y122.805 E.0262
G1 X129.186 Y116.054 E.37779
G1 X129.654 Y116.054 E.0262
G1 X129.654 Y122.805 E.37779
G1 X130.122 Y122.805 E.0262
G1 X130.122 Y116.054 E.37779
G1 X130.59 Y116.054 E.0262
G1 X130.59 Y122.805 E.37779
G1 X131.059 Y122.805 E.0262
G1 X131.059 Y116.054 E.37779
G1 X131.527 Y116.054 E.0262
G1 X131.527 Y122.805 E.37779
G1 X131.995 Y122.805 E.0262
G1 X131.995 Y116.054 E.37779
G1 X132.463 Y116.054 E.0262
G1 X132.463 Y122.805 E.37779
G1 X132.931 Y122.805 E.0262
G1 X132.931 Y116.054 E.37779
G1 X133.399 Y116.054 E.0262
G1 X133.399 Y122.805 E.37779
G1 X133.868 Y122.805 E.0262
G1 X133.868 Y116.198 E.36972
G1 X134.336 Y116.673 E.03732
G1 X134.336 Y123.007 E.35447
M106 S252.45
G1 X134.226 Y116.061 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
; LAYER_HEIGHT: 0.2
G1 F1857
G1 X134.296 Y116.13 E.00273
G1 X125.906 Y116.173 F30000
G1 F1857
G1 X125.976 Y116.103 E.00273
; CHANGE_LAYER
; Z_HEIGHT: 4.62667
; LAYER_HEIGHT: 0.0266666
; WIPE_START
G1 F24000
G1 X125.906 Y116.173 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 39/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L39
M991 S0 P38 ;notify layer change
G17
G3 Z5 I1.217 J0 P1  F30000
G1 X125.906 Y112.196 Z5
G1 Z4.627
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.276667
G1 F2797
G1 X122.647 Y112.196 E.13248
G1 X122.542 Y112.302 E.00607
G1 X122.541 Y113.937 E.06645
G3 X123.976 Y110.919 I1.546 J-1.115 E.16559
G1 X124.057 Y110.715 E.00894
G3 X125.513 Y107.396 I1.377 J-1.374 E.18949
G3 X126.646 Y110.795 I-.163 J1.943 E.1847
G2 X126.974 Y111.097 I.359 J-.06 E.01952
G3 X127.961 Y112.196 I-.816 J1.725 E.06164
G1 X125.966 Y112.196 E.08108
; WIPE_START
G1 F24000
G1 X123.966 Y112.196 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.027 I.223 J1.196 P1  F30000
G1 X135.473 Y110.049 Z5.027
G1 Z4.627
G1 E.8 F1800
G1 F2797
G3 X137.272 Y107.384 I1.796 J-.727 E.15415
G1 X137.391 Y107.387 E.00485
G3 X135.496 Y110.103 I-.122 J1.934 E.33356
; CHANGE_LAYER
; Z_HEIGHT: 4.8
; LAYER_HEIGHT: 0.173334
; WIPE_START
G1 F24000
M73 P48 R10
G1 X135.37 Y109.322 E-.30075
G1 X135.504 Y108.607 E-.27625
G1 X135.758 Y108.199 E-.183
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 40/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L40
M991 S0 P39 ;notify layer change
G17
G3 Z5.027 I-.985 J.715 P1  F30000
G1 X139.52 Y113.379 Z5.027
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F2797
G1 X139.52 Y123.174 E.32495
G1 X123.724 Y123.174 E.52398
G1 X123.724 Y113.379 E.32495
G1 X139.46 Y113.379 E.52199
G1 X139.912 Y112.987 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2797
G1 X139.912 Y123.567 E.32509
G1 X123.332 Y123.567 E.50946
G1 X123.332 Y112.987 E.32509
G1 X139.852 Y112.987 E.50761
M204 S10000
; WIPE_START
G1 F24000
G1 X139.864 Y114.986 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I.84 J-.88 P1  F30000
G1 X138.544 Y113.727 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2797
G1 X139.172 Y113.727 E.02084
G1 X139.172 Y114.727 E.03317
G1 X134.774 Y119.125 E.20634
G1 X134.774 Y122.826 E.12277
G1 X138.748 Y122.826 E.13186
G1 X139.172 Y122.403 E.01986
G1 X139.172 Y120.15 E.07472
G1 X132.748 Y113.727 E.30133
G1 X132.496 Y113.727 E.00838
G1 X130.598 Y115.625 E.08905
G1 X126.971 Y115.625 E.1203
G1 X125.073 Y113.727 E.08905
G1 X124.82 Y113.727 E.00838
G1 X124.073 Y114.474 E.03506
G1 X124.073 Y120.403 E.19666
G1 X125.471 Y121.801 E.0656
G1 X125.471 Y120.752 E.03481
G1 X124.073 Y122.15 E.0656
G1 X124.073 Y122.826 E.02242
G1 X125.025 Y122.826 E.03159
G1 X125.8 Y116.371 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.424056
G1 F2797
G1 X126.047 Y116.124 E.01088
G1 X126.399 Y116.124 E.01094
G1 X126.486 Y116.037 E.00382
G3 X126.693 Y116.017 I.127 J.239 E.00661
G1 X125.863 Y116.847 E.03645
G1 X125.863 Y117.386 E.01674
G1 X127.232 Y116.017 E.06013
G1 X127.771 Y116.017 E.01674
G1 X125.863 Y117.925 E.0838
G1 X125.863 Y118.464 E.01674
G1 X128.31 Y116.017 E.10747
G1 X128.849 Y116.017 E.01674
G1 X125.863 Y119.003 E.13115
G1 X125.863 Y119.542 E.01674
G1 X129.388 Y116.017 E.15482
G1 X129.927 Y116.017 E.01674
G1 X125.863 Y120.081 E.1785
G1 X125.863 Y120.62 E.01674
G1 X130.466 Y116.017 E.20217
G1 X131.005 Y116.017 E.01674
G1 X125.863 Y121.159 E.22585
G1 X125.863 Y121.698 E.01674
G1 X131.544 Y116.017 E.24952
G1 X132.083 Y116.017 E.01674
G1 X125.863 Y122.237 E.2732
G1 X125.863 Y122.776 E.01674
G1 X132.622 Y116.017 E.29687
G1 X133.161 Y116.017 E.01674
G1 X126.337 Y122.841 E.29972
G1 X126.876 Y122.841 E.01674
G1 X133.7 Y116.017 E.29972
G3 X133.845 Y116.124 I-.04 J.206 E.00577
G1 X134.132 Y116.124 E.00893
G1 X127.415 Y122.841 E.29504
G1 X127.954 Y122.841 E.01674
G1 X134.275 Y116.52 E.27763
G1 X134.275 Y116.554 E.00104
G3 X134.381 Y116.688 I-.109 J.196 E.00546
G1 X134.381 Y116.953 E.00823
G1 X128.493 Y122.841 E.25863
G1 X129.032 Y122.841 E.01674
G1 X134.381 Y117.492 E.23495
G1 X134.381 Y118.031 E.01674
G1 X129.571 Y122.841 E.21128
G1 X130.11 Y122.841 E.01674
G1 X134.381 Y118.57 E.18761
G1 X134.381 Y119.109 E.01674
G1 X130.649 Y122.841 E.16393
G1 X131.188 Y122.841 E.01674
G1 X134.381 Y119.648 E.14026
G1 X134.381 Y120.187 E.01674
G1 X131.727 Y122.841 E.11658
G1 X132.266 Y122.841 E.01674
G1 X134.381 Y120.726 E.09291
G1 X134.381 Y121.265 E.01674
G1 X132.805 Y122.841 E.06923
G1 X133.344 Y122.841 E.01674
G1 X134.381 Y121.804 E.04556
G1 X134.381 Y122.343 E.01674
G1 X133.713 Y123.011 E.02934
; CHANGE_LAYER
; Z_HEIGHT: 4.90333
; LAYER_HEIGHT: 0.103333
; WIPE_START
G1 F24000
G1 X134.381 Y122.343 E-.35895
G1 X134.381 Y121.804 E-.20482
G1 X134.016 Y122.169 E-.19622
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 41/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L41
M991 S0 P40 ;notify layer change
G17
G3 Z5.2 I1.187 J.27 P1  F30000
G1 X136.523 Y111.152 Z5.2
G1 Z4.903
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.276667
G1 F2920
G1 X136.471 Y111.147 E.00209
G3 X137.272 Y107.497 I.798 J-1.738 E.21087
G1 X137.39 Y107.501 E.00479
G3 X137.273 Y111.322 I-.12 J1.909 E.23923
G1 X136.581 Y111.166 E.02882
; WIPE_START
G1 F24000
G1 X136.471 Y111.147 E-.04229
G1 X135.905 Y110.72 E-.26961
G1 X135.527 Y110.115 E-.27123
G1 X135.441 Y109.657 E-.17687
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.303 I-.39 J-1.153 P1  F30000
G1 X127.935 Y112.196 Z5.303
G1 Z4.903
G1 E.8 F1800
G1 F2920
G1 X122.647 Y112.196 E.21495
G1 X122.542 Y112.302 E.00607
G1 X122.542 Y113.894 E.06474
G3 X123.955 Y110.945 I1.544 J-1.073 E.16118
G1 X124.037 Y110.741 E.00894
G3 X125.512 Y107.509 I1.396 J-1.315 E.18462
G3 X126.666 Y110.828 I-.159 J1.915 E.1802
G2 X126.964 Y111.119 I.323 J-.032 E.01839
G3 X127.915 Y112.141 I-.805 J1.703 E.05811
; CHANGE_LAYER
; Z_HEIGHT: 5
; LAYER_HEIGHT: 0.0966668
; WIPE_START
G1 F24000
G1 X125.915 Y112.162 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 42/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L42
M991 S0 P41 ;notify layer change
G17
G3 Z5.303 I-.108 J1.212 P1  F30000
G1 X139.52 Y113.379 Z5.303
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F2920
G1 X139.52 Y123.174 E.32495
G1 X134.2 Y123.174 E.17648
G1 X134.2 Y116.199 E.2314
G1 X126.044 Y116.199 E.27054
G1 X126.044 Y123.174 E.2314
G1 X123.724 Y123.174 E.07696
G1 X123.724 Y113.379 E.32495
G1 X139.46 Y113.379 E.52199
G1 X139.912 Y112.987 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2920
G1 X139.912 Y123.567 E.32509
G1 X123.332 Y123.567 E.50946
G1 X123.332 Y112.987 E.32509
G1 X139.852 Y112.987 E.50761
M204 S10000
; WIPE_START
G1 F24000
G1 X139.864 Y114.986 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I.84 J-.88 P1  F30000
G1 X138.544 Y113.727 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2920
G1 X139.172 Y113.727 E.02084
G1 X139.172 Y114.727 E.03317
G1 X134.548 Y119.35 E.2169
G1 X134.548 Y122.826 E.1153
G1 X138.748 Y122.826 E.13933
G1 X139.172 Y122.403 E.01986
G1 X139.172 Y120.15 E.07472
G1 X132.748 Y113.727 E.30133
G1 X132.496 Y113.727 E.00838
G1 X130.372 Y115.85 E.09962
G1 X127.196 Y115.85 E.10536
G1 X125.073 Y113.727 E.09962
G1 X124.82 Y113.727 E.00838
G1 X124.073 Y114.474 E.03506
G1 X124.073 Y120.403 E.19666
G1 X125.696 Y122.026 E.07617
G1 X125.696 Y120.527 E.04975
G1 X124.073 Y122.15 E.07617
G1 X124.073 Y122.826 E.02242
G1 X125.025 Y122.826 E.03159
; WIPE_START
G1 F24000
G1 X124.073 Y122.826 E-.36189
G1 X124.073 Y122.15 E-.25687
G1 X124.335 Y121.887 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I.63 J1.041 P1  F30000
G1 X133.366 Y116.421 Z5.4
G1 Z5
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F2920
G1 X133.978 Y117.033 E.02657
G1 X133.978 Y117.566
G1 X132.833 Y116.421 E.04975
G1 X132.3 Y116.421
M73 P49 R10
G1 X133.978 Y118.099 E.07292
G1 X133.978 Y118.632
G1 X131.766 Y116.421 E.09609
G1 X131.233 Y116.421
G1 X133.978 Y119.166 E.11927
G1 X133.978 Y119.699
G1 X130.7 Y116.421 E.14244
G1 X130.166 Y116.421
G1 X133.978 Y120.232 E.16561
G1 X133.978 Y120.766
G1 X129.633 Y116.421 E.18878
G1 X129.1 Y116.421
G1 X133.978 Y121.299 E.21196
G1 X133.978 Y121.832
G1 X128.567 Y116.421 E.23513
G1 X128.033 Y116.421
G1 X133.978 Y122.365 E.2583
G1 X133.978 Y122.899
G1 X127.5 Y116.421 E.28148
G1 X126.967 Y116.421
G1 X133.905 Y123.359 E.30149
G1 X133.372 Y123.359
G1 X126.512 Y116.499 E.29809
G1 X126.267 Y116.788
G1 X132.838 Y123.359 E.28556
G1 X132.305 Y123.359
G1 X126.267 Y117.321 E.26239
G1 X126.267 Y117.854
G1 X131.772 Y123.359 E.23922
G1 X131.238 Y123.359
G1 X126.267 Y118.387 E.21604
G1 X126.267 Y118.921
G1 X130.705 Y123.359 E.19287
G1 X130.172 Y123.359
G1 X126.267 Y119.454 E.1697
G1 X126.267 Y119.987
G1 X129.639 Y123.359 E.14652
G1 X129.105 Y123.359
G1 X126.267 Y120.521 E.12335
G1 X126.267 Y121.054
G1 X128.572 Y123.359 E.10018
G1 X128.039 Y123.359
G1 X126.267 Y121.587 E.077
G1 X126.267 Y122.12
G1 X127.506 Y123.359 E.05383
G1 X126.972 Y123.359
G1 X126.267 Y122.654 E.03066
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 5.18
; LAYER_HEIGHT: 0.18
; WIPE_START
G1 F24000
G1 X126.972 Y123.359 E-.37914
G1 X127.506 Y123.359 E-.20264
G1 X127.174 Y123.027 E-.17822
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 43/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L43
M991 S0 P42 ;notify layer change
G17
G3 Z5.4 I1.086 J-.548 P1  F30000
G1 X122.542 Y113.851 Z5.4
G1 Z5.18
G1 E.8 F1800
; FEATURE: Support
; LAYER_HEIGHT: 0.276667
G1 F1712
G3 X123.942 Y110.965 I1.545 J-1.033 E.15734
G2 X123.831 Y110.517 I-.335 J-.154 E.02025
G3 X125.511 Y107.62 I1.593 J-1.011 E.16744
G3 X126.683 Y110.87 I-.162 J1.895 E.1761
G2 X127.057 Y111.194 I.459 J-.151 E.02113
G3 X127.909 Y112.196 I-.932 J1.656 E.0546
G1 X122.647 Y112.196 E.2139
G1 X122.542 Y112.302 E.00607
G1 X122.542 Y113.791 E.06055
; WIPE_START
G1 F24000
G1 X122.317 Y113.391 E-.17431
G1 X122.23 Y112.935 E-.17658
G1 X122.259 Y112.471 E-.17657
G1 X122.403 Y112.029 E-.17657
G1 X122.482 Y111.905 E-.05598
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.58 I.158 J1.207 P1  F30000
G1 X135.521 Y110.203 Z5.58
G1 Z5.18
G1 E.8 F1800
G1 F1712
G3 X137.273 Y107.608 I1.749 J-.708 E.15009
G1 X137.389 Y107.612 E.00473
G3 X135.544 Y110.257 I-.119 J1.883 E.32478
; CHANGE_LAYER
; Z_HEIGHT: 5.2
; LAYER_HEIGHT: 0.02
; WIPE_START
G1 F24000
G1 X135.419 Y109.495 E-.29337
G1 X135.55 Y108.799 E-.269
G1 X135.825 Y108.358 E-.19763
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 44/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L44
M991 S0 P43 ;notify layer change
G17
G3 Z5.58 I-.811 J-.907 P1  F30000
G1 X126.52 Y116.674 Z5.58
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1712
G1 X126.52 Y123.174 E.21562
G1 X123.724 Y123.174 E.09274
G1 X123.724 Y113.379 E.32495
G1 X139.52 Y113.379 E.52398
G1 X139.52 Y123.174 E.32495
G1 X133.724 Y123.174 E.19226
G1 X133.724 Y116.674 E.21562
G1 X126.58 Y116.674 E.23698
G1 X126.912 Y117.067 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1712
G1 X126.912 Y123.567 E.19973
G1 X123.332 Y123.567 E.11
G1 X123.332 Y112.987 E.32509
G1 X139.912 Y112.987 E.50946
G1 X139.912 Y123.567 E.32509
G1 X133.332 Y123.567 E.20219
G1 X133.332 Y117.067 E.19973
G1 X126.972 Y117.067 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X126.954 Y119.066 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I.774 J-.939 P1  F30000
G1 X126.172 Y118.423 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1712
G1 X126.172 Y120.051 E.05401
G1 X124.073 Y122.15 E.09848
G1 X124.073 Y120.403 E.05796
G1 X126.172 Y122.502 E.09848
G1 X126.172 Y122.826 E.01075
G1 X124.868 Y122.826 E.04327
G1 X124.073 Y116.103 F30000
G1 F1712
G1 X124.073 Y114.474 E.05401
G1 X124.82 Y113.727 E.03506
G1 X125.073 Y113.727 E.00838
G1 X127.672 Y116.326 E.12194
G1 X129.897 Y116.326 E.0738
G1 X132.496 Y113.727 E.12194
G1 X132.748 Y113.727 E.00838
G1 X139.172 Y120.15 E.30133
G1 X139.172 Y122.403 E.07472
G1 X138.748 Y122.826 E.01986
G1 X134.172 Y122.826 E.15182
G1 X134.073 Y122.727 E.00466
G1 X134.073 Y119.826 E.09622
G1 X139.172 Y114.727 E.23922
G1 X139.172 Y113.727 E.03317
G1 X138.544 Y113.727 E.02084
; CHANGE_LAYER
; Z_HEIGHT: 5.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X139.172 Y113.727 E-.23876
G1 X139.172 Y114.727 E-.38
G1 X138.909 Y114.99 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 45/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L45
M991 S0 P44 ;notify layer change
G17
G3 Z5.6 I-.164 J-1.206 P1  F30000
G1 X126.52 Y116.674 Z5.6
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1414
G1 X126.52 Y123.174 E.21562
G1 X123.724 Y123.174 E.09274
G1 X123.724 Y113.379 E.32495
G1 X139.52 Y113.379 E.52398
G1 X139.52 Y123.174 E.32495
M73 P50 R10
G1 X133.724 Y123.174 E.19226
G1 X133.724 Y116.674 E.21562
G1 X126.58 Y116.674 E.23698
G1 X126.912 Y117.067 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1414
G1 X126.912 Y123.567 E.19973
G1 X123.332 Y123.567 E.11
G1 X123.332 Y112.987 E.32509
G1 X139.912 Y112.987 E.50946
G1 X139.912 Y123.567 E.32509
G1 X133.332 Y123.567 E.20219
G1 X133.332 Y117.067 E.19973
G1 X126.972 Y117.067 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X126.954 Y119.066 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I.774 J-.939 P1  F30000
G1 X126.172 Y118.423 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1414
G1 X126.172 Y120.051 E.05401
G1 X124.073 Y122.15 E.09848
G1 X124.073 Y120.403 E.05796
G1 X126.172 Y122.502 E.09848
G1 X126.172 Y122.826 E.01075
G1 X124.868 Y122.826 E.04327
G1 X124.073 Y116.103 F30000
G1 F1414
G1 X124.073 Y114.474 E.05401
G1 X124.82 Y113.727 E.03506
G1 X125.073 Y113.727 E.00838
G1 X127.672 Y116.326 E.12194
G1 X129.897 Y116.326 E.0738
G1 X132.496 Y113.727 E.12194
G1 X132.748 Y113.727 E.00838
G1 X139.172 Y120.15 E.30133
G1 X139.172 Y122.403 E.07472
G1 X138.748 Y122.826 E.01986
G1 X134.172 Y122.826 E.15182
G1 X134.073 Y122.727 E.00466
G1 X134.073 Y119.826 E.09622
G1 X139.172 Y114.727 E.23922
G1 X139.172 Y113.727 E.03317
G1 X138.544 Y113.727 E.02084
; CHANGE_LAYER
; Z_HEIGHT: 5.45667
; LAYER_HEIGHT: 0.0566664
; WIPE_START
G1 F24000
G1 X139.172 Y113.727 E-.23876
G1 X139.172 Y114.727 E-.38
G1 X138.909 Y114.99 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 46/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L46
M991 S0 P45 ;notify layer change
G17
G3 Z5.8 I1.186 J-.272 P1  F30000
G1 X138.054 Y111.267 Z5.8
G1 Z5.457
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.276667
G1 F1699
G3 X137.274 Y107.716 I-.783 J-1.689 E.27068
G1 X137.388 Y107.72 E.00467
G3 X138.107 Y111.241 I-.117 J1.858 E.19775
; WIPE_START
G1 F24000
G1 X137.275 Y111.44 E-.32529
G1 X136.497 Y111.263 E-.30319
G1 X136.218 Y111.058 E-.13152
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.857 I-.165 J-1.206 P1  F30000
G1 X127.884 Y112.196 Z5.857
G1 Z5.457
G1 E.8 F1800
G1 F1699
G1 X122.647 Y112.196 E.21286
G1 X122.542 Y112.302 E.00607
G1 X122.535 Y113.799 E.06085
G3 X123.93 Y110.991 I1.556 J-.977 E.15267
G1 X124.007 Y110.801 E.00832
G3 X125.51 Y107.729 I1.42 J-1.209 E.17596
G3 X126.697 Y110.9 I-.158 J1.867 E.17188
G1 X126.745 Y111.084 E.00772
G3 X127.862 Y112.14 I-.582 J1.736 E.06452
; CHANGE_LAYER
; Z_HEIGHT: 5.6
; LAYER_HEIGHT: 0.143333
; WIPE_START
G1 F24000
G1 X125.862 Y112.162 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 47/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L47
M991 S0 P46 ;notify layer change
G17
G3 Z5.857 I-1.204 J.175 P1  F30000
G1 X126.52 Y116.674 Z5.857
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1699
G1 X126.52 Y123.174 E.21562
G1 X123.724 Y123.174 E.09274
G1 X123.724 Y113.379 E.32495
G1 X139.52 Y113.379 E.52398
G1 X139.52 Y123.174 E.32495
G1 X133.724 Y123.174 E.19226
G1 X133.724 Y116.674 E.21562
G1 X126.58 Y116.674 E.23698
G1 X126.912 Y117.067 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1699
G1 X126.912 Y123.567 E.19973
G1 X123.332 Y123.567 E.11
G1 X123.332 Y112.987 E.32509
G1 X139.912 Y112.987 E.50946
G1 X139.912 Y123.567 E.32509
G1 X133.332 Y123.567 E.20219
G1 X133.332 Y117.067 E.19973
G1 X126.972 Y117.067 E.19543
M204 S10000
; WIPE_START
G1 F24000
M73 P51 R10
G1 X126.954 Y119.066 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I.774 J-.939 P1  F30000
G1 X126.172 Y118.423 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
M73 P51 R9
G1 F1699
G1 X126.172 Y120.051 E.05401
G1 X124.073 Y122.15 E.09848
G1 X124.073 Y120.403 E.05796
G1 X126.172 Y122.502 E.09848
G1 X126.172 Y122.826 E.01075
G1 X124.868 Y122.826 E.04327
G1 X124.073 Y116.103 F30000
G1 F1699
G1 X124.073 Y114.474 E.05401
G1 X124.82 Y113.727 E.03506
G1 X125.073 Y113.727 E.00838
G1 X127.672 Y116.326 E.12194
G1 X129.897 Y116.326 E.0738
G1 X132.496 Y113.727 E.12194
G1 X132.748 Y113.727 E.00838
G1 X139.172 Y120.15 E.30133
G1 X139.172 Y122.403 E.07472
G1 X138.748 Y122.826 E.01986
G1 X134.172 Y122.826 E.15182
G1 X134.073 Y122.727 E.00466
G1 X134.073 Y119.826 E.09622
G1 X139.172 Y114.727 E.23922
G1 X139.172 Y113.727 E.03317
G1 X138.544 Y113.727 E.02084
; CHANGE_LAYER
; Z_HEIGHT: 5.73333
; LAYER_HEIGHT: 0.133333
; WIPE_START
G1 F24000
G1 X139.172 Y113.727 E-.23876
G1 X139.172 Y114.727 E-.38
G1 X138.909 Y114.99 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 48/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L48
M991 S0 P47 ;notify layer change
G17
G3 Z6 I1.184 J-.279 P1  F30000
G1 X138.045 Y111.323 Z6
G1 Z5.733
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.276667
G1 F1695
G3 X137.275 Y107.821 I-.772 J-1.666 E.267
G1 X137.388 Y107.825 E.0046
G3 X138.098 Y111.298 I-.116 J1.833 E.19498
; WIPE_START
G1 F24000
G1 X137.276 Y111.495 E-.32126
G1 X136.508 Y111.32 E-.29918
G1 X136.213 Y111.102 E-.13956
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.133 I-.158 J-1.207 P1  F30000
G1 X127.858 Y112.196 Z6.133
G1 Z5.733
G1 E.8 F1800
G1 F1695
G1 X122.647 Y112.196 E.21181
G1 X122.542 Y112.302 E.00607
G1 X122.542 Y113.762 E.05936
G3 X123.921 Y111.017 I1.549 J-.941 E.14904
G1 X123.997 Y110.827 E.00832
G3 X125.509 Y107.834 I1.428 J-1.157 E.17164
G3 X126.71 Y110.928 I-.153 J1.839 E.16767
G2 X127.034 Y111.237 I.395 J-.09 E.01927
G3 X127.836 Y112.141 I-.909 J1.614 E.05006
; CHANGE_LAYER
; Z_HEIGHT: 5.8
; LAYER_HEIGHT: 0.0666671
; WIPE_START
G1 F24000
G1 X125.836 Y112.162 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 49/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L49
M991 S0 P48 ;notify layer change
G17
G3 Z6.133 I-1.203 J.182 P1  F30000
G1 X126.52 Y116.674 Z6.133
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1695
G1 X126.52 Y123.174 E.21562
G1 X123.724 Y123.174 E.09274
G1 X123.724 Y113.379 E.32495
G1 X139.52 Y113.379 E.52398
G1 X139.52 Y123.174 E.32495
G1 X133.724 Y123.174 E.19226
G1 X133.724 Y116.674 E.21562
G1 X126.58 Y116.674 E.23698
G1 X126.912 Y117.067 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1695
G1 X126.912 Y123.567 E.19973
G1 X123.332 Y123.567 E.11
G1 X123.332 Y112.987 E.32509
G1 X139.912 Y112.987 E.50946
G1 X139.912 Y123.567 E.32509
G1 X133.332 Y123.567 E.20219
G1 X133.332 Y117.067 E.19973
G1 X126.972 Y117.067 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X126.954 Y119.066 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I.774 J-.939 P1  F30000
G1 X126.172 Y118.423 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1695
G1 X126.172 Y120.051 E.05401
G1 X124.073 Y122.15 E.09848
G1 X124.073 Y120.403 E.05796
G1 X126.172 Y122.502 E.09848
G1 X126.172 Y122.826 E.01075
G1 X124.868 Y122.826 E.04327
G1 X124.073 Y116.103 F30000
G1 F1695
G1 X124.073 Y114.474 E.05401
G1 X124.82 Y113.727 E.03506
G1 X125.073 Y113.727 E.00838
G1 X127.672 Y116.326 E.12194
G1 X129.897 Y116.326 E.0738
G1 X132.496 Y113.727 E.12194
G1 X132.748 Y113.727 E.00838
G1 X139.172 Y120.15 E.30133
G1 X139.172 Y122.403 E.07472
G1 X138.748 Y122.826 E.01986
G1 X134.172 Y122.826 E.15182
G1 X134.073 Y122.727 E.00466
G1 X134.073 Y119.826 E.09622
G1 X139.172 Y114.727 E.23922
G1 X139.172 Y113.727 E.03317
G1 X138.544 Y113.727 E.02084
; CHANGE_LAYER
; Z_HEIGHT: 6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X139.172 Y113.727 E-.23876
G1 X139.172 Y114.727 E-.38
G1 X138.909 Y114.99 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 50/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L50
M991 S0 P49 ;notify layer change
G17
G3 Z6.2 I-.164 J-1.206 P1  F30000
G1 X126.52 Y116.674 Z6.2
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
M73 P52 R9
G1 F1414
G1 X126.52 Y123.174 E.21562
G1 X123.724 Y123.174 E.09274
G1 X123.724 Y113.379 E.32495
G1 X139.52 Y113.379 E.52398
G1 X139.52 Y123.174 E.32495
G1 X133.724 Y123.174 E.19226
G1 X133.724 Y116.674 E.21562
G1 X126.58 Y116.674 E.23698
G1 X126.912 Y117.067 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1414
G1 X126.912 Y123.567 E.19973
G1 X123.332 Y123.567 E.11
G1 X123.332 Y112.987 E.32509
G1 X139.912 Y112.987 E.50946
G1 X139.912 Y123.567 E.32509
G1 X133.332 Y123.567 E.20219
G1 X133.332 Y117.067 E.19973
G1 X126.972 Y117.067 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X126.954 Y119.066 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I.774 J-.939 P1  F30000
G1 X126.172 Y118.423 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1414
G1 X126.172 Y120.051 E.05401
G1 X124.073 Y122.15 E.09848
G1 X124.073 Y120.403 E.05796
G1 X126.172 Y122.502 E.09848
G1 X126.172 Y122.826 E.01075
G1 X124.868 Y122.826 E.04327
G1 X124.073 Y116.103 F30000
G1 F1414
G1 X124.073 Y114.474 E.05401
G1 X124.82 Y113.727 E.03506
G1 X125.073 Y113.727 E.00838
G1 X127.672 Y116.326 E.12194
G1 X129.897 Y116.326 E.0738
G1 X132.496 Y113.727 E.12194
G1 X132.748 Y113.727 E.00838
G1 X139.172 Y120.15 E.30133
G1 X139.172 Y122.403 E.07472
G1 X138.748 Y122.826 E.01986
G1 X134.172 Y122.826 E.15182
G1 X134.073 Y122.727 E.00466
G1 X134.073 Y119.826 E.09622
G1 X139.172 Y114.727 E.23922
G1 X139.172 Y113.727 E.03317
G1 X138.544 Y113.727 E.02084
; CHANGE_LAYER
; Z_HEIGHT: 6.01
; LAYER_HEIGHT: 0.0100002
; WIPE_START
G1 F24000
G1 X139.172 Y113.727 E-.23876
G1 X139.172 Y114.727 E-.38
G1 X138.909 Y114.99 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 51/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L51
M991 S0 P50 ;notify layer change
G17
G3 Z6.4 I1.183 J-.286 P1  F30000
G1 X138.036 Y111.377 Z6.4
G1 Z6.01
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.276667
G1 F1690
G3 X137.276 Y107.924 I-.762 J-1.642 E.26331
G1 X137.388 Y107.928 E.00454
G3 X138.089 Y111.351 I-.114 J1.807 E.19222
; WIPE_START
G1 F24000
G1 X137.277 Y111.546 E-.3172
G1 X136.52 Y111.374 E-.29518
G1 X136.207 Y111.144 E-.14761
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.41 I-.152 J-1.207 P1  F30000
G1 X127.832 Y112.196 Z6.41
G1 Z6.01
G1 E.8 F1800
G1 F1690
G1 X122.647 Y112.196 E.21077
G1 X122.542 Y112.302 E.00607
G1 X122.542 Y113.715 E.05743
G3 X123.913 Y111.043 I1.548 J-.894 E.14496
G2 X123.837 Y110.618 I-.304 J-.165 E.01894
G3 X125.508 Y107.937 I1.588 J-.871 E.15599
G3 X126.718 Y110.967 I-.148 J1.816 E.16435
G2 X127.022 Y111.258 I.373 J-.087 E.01811
G3 X127.81 Y112.141 I-.898 J1.593 E.04899
; CHANGE_LAYER
; Z_HEIGHT: 6.2
; LAYER_HEIGHT: 0.19
; WIPE_START
G1 F24000
G1 X125.81 Y112.162 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 52/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L52
M991 S0 P51 ;notify layer change
G17
G3 Z6.41 I-1.202 J.189 P1  F30000
G1 X126.52 Y116.674 Z6.41
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1690
G1 X126.52 Y123.174 E.21562
G1 X123.724 Y123.174 E.09274
G1 X123.724 Y113.379 E.32495
G1 X139.52 Y113.379 E.52398
M73 P53 R9
G1 X139.52 Y123.174 E.32495
G1 X133.724 Y123.174 E.19226
G1 X133.724 Y116.674 E.21562
G1 X126.58 Y116.674 E.23698
G1 X126.912 Y117.067 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1690
G1 X126.912 Y123.567 E.19973
G1 X123.332 Y123.567 E.11
G1 X123.332 Y112.987 E.32509
G1 X139.912 Y112.987 E.50946
G1 X139.912 Y123.567 E.32509
G1 X133.332 Y123.567 E.20219
G1 X133.332 Y117.067 E.19973
G1 X126.972 Y117.067 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X126.954 Y119.066 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I.774 J-.939 P1  F30000
G1 X126.172 Y118.423 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1690
G1 X126.172 Y120.051 E.05401
G1 X124.073 Y122.15 E.09848
G1 X124.073 Y120.403 E.05796
G1 X126.172 Y122.502 E.09848
G1 X126.172 Y122.826 E.01075
G1 X124.868 Y122.826 E.04327
G1 X124.073 Y116.103 F30000
G1 F1690
G1 X124.073 Y114.474 E.05401
G1 X124.82 Y113.727 E.03506
G1 X125.073 Y113.727 E.00838
G1 X127.672 Y116.326 E.12194
G1 X129.897 Y116.326 E.0738
G1 X132.496 Y113.727 E.12194
G1 X132.748 Y113.727 E.00838
G1 X139.172 Y120.15 E.30133
G1 X139.172 Y122.403 E.07472
G1 X138.748 Y122.826 E.01986
G1 X134.172 Y122.826 E.15182
G1 X134.073 Y122.727 E.00466
G1 X134.073 Y119.826 E.09622
G1 X139.172 Y114.727 E.23922
G1 X139.172 Y113.727 E.03317
G1 X138.544 Y113.727 E.02084
; CHANGE_LAYER
; Z_HEIGHT: 6.28667
; LAYER_HEIGHT: 0.0866671
; WIPE_START
G1 F24000
G1 X139.172 Y113.727 E-.23876
G1 X139.172 Y114.727 E-.38
G1 X138.909 Y114.99 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 53/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L53
M991 S0 P52 ;notify layer change
G17
G3 Z6.6 I1.181 J-.293 P1  F30000
G1 X138.027 Y111.428 Z6.6
G1 Z6.287
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.276667
G1 F1686
G3 X137.278 Y108.024 I-.752 J-1.619 E.25963
G1 X137.388 Y108.028 E.00448
G3 X138.08 Y111.402 I-.113 J1.782 E.18945
; WIPE_START
G1 F24000
G1 X137.279 Y111.595 E-.31317
G1 X136.532 Y111.426 E-.29118
G1 X136.202 Y111.182 E-.15565
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.687 I-.146 J-1.208 P1  F30000
G1 X127.806 Y112.196 Z6.687
G1 Z6.287
G1 E.8 F1800
G1 F1686
G1 X122.647 Y112.196 E.20972
G1 X122.542 Y112.302 E.00607
G1 X122.541 Y113.665 E.05541
G3 X123.91 Y111.067 I1.544 J-.846 E.14117
G2 X123.859 Y110.68 I-.243 J-.165 E.0174
G3 X125.508 Y108.037 I1.566 J-.859 E.15382
G3 X126.723 Y110.996 I-.144 J1.788 E.16057
G2 X127.106 Y111.335 I.535 J-.218 E.02155
G3 X127.784 Y112.141 I-.95 J1.489 E.04349
; CHANGE_LAYER
; Z_HEIGHT: 6.4
; LAYER_HEIGHT: 0.113333
; WIPE_START
G1 F24000
G1 X125.785 Y112.162 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 54/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L54
M991 S0 P53 ;notify layer change
G17
G3 Z6.687 I-1.201 J.196 P1  F30000
G1 X126.52 Y116.674 Z6.687
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1686
G1 X126.52 Y123.174 E.21562
G1 X123.724 Y123.174 E.09274
G1 X123.724 Y113.379 E.32495
G1 X139.52 Y113.379 E.52398
G1 X139.52 Y123.174 E.32495
G1 X133.724 Y123.174 E.19226
G1 X133.724 Y116.674 E.21562
G1 X126.58 Y116.674 E.23698
G1 X126.912 Y117.067 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1686
G1 X126.912 Y123.567 E.19973
G1 X123.332 Y123.567 E.11
G1 X123.332 Y112.987 E.32509
G1 X139.912 Y112.987 E.50946
G1 X139.912 Y123.567 E.32509
G1 X133.332 Y123.567 E.20219
G1 X133.332 Y117.067 E.19973
G1 X126.972 Y117.067 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X126.954 Y119.066 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I.774 J-.939 P1  F30000
G1 X126.172 Y118.423 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1686
G1 X126.172 Y120.051 E.05401
G1 X124.073 Y122.15 E.09848
G1 X124.073 Y120.403 E.05796
G1 X126.172 Y122.502 E.09848
G1 X126.172 Y122.826 E.01075
G1 X124.868 Y122.826 E.04327
G1 X124.073 Y116.103 F30000
G1 F1686
G1 X124.073 Y114.474 E.05401
G1 X124.82 Y113.727 E.03506
G1 X125.073 Y113.727 E.00838
G1 X127.672 Y116.326 E.12194
G1 X129.897 Y116.326 E.0738
G1 X132.496 Y113.727 E.12194
G1 X132.748 Y113.727 E.00838
G1 X139.172 Y120.15 E.30133
G1 X139.172 Y122.403 E.07472
G1 X138.748 Y122.826 E.01986
G1 X134.172 Y122.826 E.15182
G1 X134.073 Y122.727 E.00466
G1 X134.073 Y119.826 E.09622
G1 X139.172 Y114.727 E.23922
G1 X139.172 Y113.727 E.03317
G1 X138.544 Y113.727 E.02084
; CHANGE_LAYER
; Z_HEIGHT: 6.56333
; LAYER_HEIGHT: 0.163333
; WIPE_START
G1 F24000
G1 X139.172 Y113.727 E-.23876
G1 X139.172 Y114.727 E-.38
G1 X138.909 Y114.99 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 55/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L55
M991 S0 P54 ;notify layer change
G17
G3 Z6.8 I1.18 J-.299 P1  F30000
M73 P54 R9
G1 X138.019 Y111.476 Z6.8
G1 Z6.563
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.276667
G1 F1681
G3 X137.279 Y108.121 I-.742 J-1.596 E.25595
G1 X137.388 Y108.124 E.00442
G3 X138.072 Y111.451 I-.111 J1.756 E.18668
; WIPE_START
G1 F24000
G1 X137.281 Y111.641 E-.30913
G1 X136.544 Y111.474 E-.28718
G1 X136.197 Y111.218 E-.1637
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.963 I-.14 J-1.209 P1  F30000
G1 X127.781 Y112.196 Z6.963
G1 Z6.563
G1 E.8 F1800
G1 F1681
G1 X122.647 Y112.196 E.20868
G1 X122.542 Y112.302 E.00607
G1 X122.542 Y113.614 E.05335
G3 X123.906 Y111.093 I1.542 J-.796 E.13716
G2 X123.832 Y110.64 I-.365 J-.172 E.01983
G3 X125.507 Y108.134 I1.588 J-.752 E.14732
G3 X126.726 Y111.024 I-.14 J1.761 E.15692
G2 X127.093 Y111.356 I.508 J-.193 E.02087
G3 X127.758 Y112.141 I-.938 J1.47 E.04249
; CHANGE_LAYER
; Z_HEIGHT: 6.6
; LAYER_HEIGHT: 0.0366664
; WIPE_START
G1 F24000
G1 X125.758 Y112.163 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 56/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L56
M991 S0 P55 ;notify layer change
G17
G3 Z6.963 I-1.2 J.203 P1  F30000
G1 X126.52 Y116.674 Z6.963
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1681
G1 X126.52 Y123.174 E.21562
G1 X123.724 Y123.174 E.09274
G1 X123.724 Y113.379 E.32495
G1 X139.52 Y113.379 E.52398
G1 X139.52 Y123.174 E.32495
G1 X133.724 Y123.174 E.19226
G1 X133.724 Y116.674 E.21562
G1 X126.58 Y116.674 E.23698
G1 X126.912 Y117.067 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1681
G1 X126.912 Y123.567 E.19973
G1 X123.332 Y123.567 E.11
G1 X123.332 Y112.987 E.32509
G1 X139.912 Y112.987 E.50946
G1 X139.912 Y123.567 E.32509
G1 X133.332 Y123.567 E.20219
G1 X133.332 Y117.067 E.19973
G1 X126.972 Y117.067 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X126.954 Y119.066 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7 I.774 J-.939 P1  F30000
G1 X126.172 Y118.423 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1681
G1 X126.172 Y120.051 E.05401
G1 X124.073 Y122.15 E.09848
G1 X124.073 Y120.403 E.05796
G1 X126.172 Y122.502 E.09848
G1 X126.172 Y122.826 E.01075
G1 X124.868 Y122.826 E.04327
G1 X124.073 Y116.103 F30000
G1 F1681
G1 X124.073 Y114.474 E.05401
G1 X124.82 Y113.727 E.03506
G1 X125.073 Y113.727 E.00838
G1 X127.672 Y116.326 E.12194
G1 X129.897 Y116.326 E.0738
G1 X132.496 Y113.727 E.12194
G1 X132.748 Y113.727 E.00838
G1 X139.172 Y120.15 E.30133
G1 X139.172 Y122.403 E.07472
G1 X138.748 Y122.826 E.01986
G1 X134.172 Y122.826 E.15182
G1 X134.073 Y122.727 E.00466
G1 X134.073 Y119.826 E.09622
G1 X139.172 Y114.727 E.23922
G1 X139.172 Y113.727 E.03317
G1 X138.544 Y113.727 E.02084
; CHANGE_LAYER
; Z_HEIGHT: 6.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X139.172 Y113.727 E-.23876
G1 X139.172 Y114.727 E-.38
G1 X138.909 Y114.99 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 57/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L57
M991 S0 P56 ;notify layer change
G17
G3 Z7 I-.164 J-1.206 P1  F30000
G1 X126.52 Y116.674 Z7
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1414
G1 X126.52 Y123.174 E.21562
G1 X123.724 Y123.174 E.09274
G1 X123.724 Y113.379 E.32495
G1 X139.52 Y113.379 E.52398
G1 X139.52 Y123.174 E.32495
G1 X133.724 Y123.174 E.19226
G1 X133.724 Y116.674 E.21562
G1 X126.58 Y116.674 E.23698
G1 X126.912 Y117.067 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1414
M73 P55 R9
G1 X126.912 Y123.567 E.19973
G1 X123.332 Y123.567 E.11
G1 X123.332 Y112.987 E.32509
G1 X139.912 Y112.987 E.50946
G1 X139.912 Y123.567 E.32509
G1 X133.332 Y123.567 E.20219
G1 X133.332 Y117.067 E.19973
G1 X126.972 Y117.067 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X126.954 Y119.066 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.2 I.774 J-.939 P1  F30000
G1 X126.172 Y118.423 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1414
G1 X126.172 Y120.051 E.05401
G1 X124.073 Y122.15 E.09848
G1 X124.073 Y120.403 E.05796
G1 X126.172 Y122.502 E.09848
G1 X126.172 Y122.826 E.01075
G1 X124.868 Y122.826 E.04327
G1 X124.073 Y116.103 F30000
G1 F1414
G1 X124.073 Y114.474 E.05401
G1 X124.82 Y113.727 E.03506
G1 X125.073 Y113.727 E.00838
G1 X127.672 Y116.326 E.12194
G1 X129.897 Y116.326 E.0738
G1 X132.496 Y113.727 E.12194
G1 X132.748 Y113.727 E.00838
G1 X139.172 Y120.15 E.30133
G1 X139.172 Y122.403 E.07472
G1 X138.748 Y122.826 E.01986
G1 X134.172 Y122.826 E.15182
G1 X134.073 Y122.727 E.00466
G1 X134.073 Y119.826 E.09622
G1 X139.172 Y114.727 E.23922
G1 X139.172 Y113.727 E.03317
G1 X138.544 Y113.727 E.02084
; CHANGE_LAYER
; Z_HEIGHT: 6.84
; LAYER_HEIGHT: 0.04
; WIPE_START
G1 F24000
G1 X139.172 Y113.727 E-.23876
G1 X139.172 Y114.727 E-.38
G1 X138.909 Y114.99 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 58/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L58
M991 S0 P57 ;notify layer change
G17
G3 Z7.2 I1.178 J-.305 P1  F30000
G1 X138.01 Y111.522 Z7.2
G1 Z6.84
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.276667
G1 F1677
G3 X137.281 Y108.215 I-.732 J-1.572 E.25228
G1 X137.388 Y108.219 E.00436
G3 X138.064 Y111.496 I-.11 J1.731 E.18391
; WIPE_START
G1 F24000
G1 X137.283 Y111.685 E-.30507
G1 X136.557 Y111.52 E-.28319
G1 X136.193 Y111.251 E-.17174
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.24 I-.135 J-1.209 P1  F30000
G1 X127.755 Y112.196 Z7.24
G1 Z6.84
G1 E.8 F1800
G1 F1677
G1 X122.647 Y112.196 E.20763
G1 X122.542 Y112.302 E.00607
G1 X122.542 Y113.561 E.05118
G3 X123.91 Y111.116 I1.542 J-.742 E.13339
G2 X123.855 Y110.697 I-.306 J-.173 E.01844
G3 X125.507 Y108.227 I1.565 J-.741 E.14522
G3 X126.728 Y111.051 I-.136 J1.734 E.15339
G2 X127.08 Y111.376 I.485 J-.171 E.02025
G3 X127.732 Y112.141 I-.927 J1.452 E.04149
; CHANGE_LAYER
; Z_HEIGHT: 7
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F24000
G1 X125.732 Y112.163 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 59/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L59
M991 S0 P58 ;notify layer change
G17
G3 Z7.24 I-1.199 J.209 P1  F30000
G1 X126.52 Y116.674 Z7.24
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1677
G1 X126.52 Y123.174 E.21562
G1 X123.724 Y123.174 E.09274
G1 X123.724 Y113.379 E.32495
G1 X139.52 Y113.379 E.52398
G1 X139.52 Y123.174 E.32495
G1 X133.724 Y123.174 E.19226
G1 X133.724 Y116.674 E.21562
G1 X126.58 Y116.674 E.23698
G1 X126.912 Y117.067 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1677
G1 X126.912 Y123.567 E.19973
G1 X123.332 Y123.567 E.11
G1 X123.332 Y112.987 E.32509
G1 X139.912 Y112.987 E.50946
G1 X139.912 Y123.567 E.32509
G1 X133.332 Y123.567 E.20219
G1 X133.332 Y117.067 E.19973
G1 X126.972 Y117.067 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X126.954 Y119.066 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I.774 J-.939 P1  F30000
G1 X126.172 Y118.423 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1677
G1 X126.172 Y120.051 E.05401
G1 X124.073 Y122.15 E.09848
G1 X124.073 Y120.403 E.05796
G1 X126.172 Y122.502 E.09848
G1 X126.172 Y122.826 E.01075
G1 X124.868 Y122.826 E.04327
G1 X124.073 Y116.103 F30000
G1 F1677
G1 X124.073 Y114.474 E.05401
G1 X124.82 Y113.727 E.03506
M73 P55 R8
G1 X125.073 Y113.727 E.00838
G1 X127.672 Y116.326 E.12194
G1 X129.897 Y116.326 E.0738
G1 X132.496 Y113.727 E.12194
G1 X132.748 Y113.727 E.00838
G1 X139.172 Y120.15 E.30133
G1 X139.172 Y122.403 E.07472
G1 X138.748 Y122.826 E.01986
G1 X134.172 Y122.826 E.15182
G1 X134.073 Y122.727 E.00466
G1 X134.073 Y119.826 E.09622
G1 X139.172 Y114.727 E.23922
G1 X139.172 Y113.727 E.03317
M73 P56 R8
G1 X138.544 Y113.727 E.02084
; CHANGE_LAYER
; Z_HEIGHT: 7.11667
; LAYER_HEIGHT: 0.116667
; WIPE_START
G1 F24000
G1 X139.172 Y113.727 E-.23876
G1 X139.172 Y114.727 E-.38
G1 X138.909 Y114.99 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 60/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L60
M991 S0 P59 ;notify layer change
G17
G3 Z7.4 I1.176 J-.311 P1  F30000
G1 X138.003 Y111.564 Z7.4
G1 Z7.117
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.276667
G1 F1673
G3 X137.284 Y108.307 I-.721 J-1.549 E.24861
G1 X137.389 Y108.31 E.00429
G3 X138.056 Y111.538 I-.108 J1.705 E.18114
; WIPE_START
G1 F24000
G1 X137.286 Y111.725 E-.30103
G1 X136.57 Y111.562 E-.27918
G1 X136.189 Y111.282 E-.17979
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.517 I-.131 J-1.21 P1  F30000
G1 X127.729 Y112.196 Z7.517
G1 Z7.117
G1 E.8 F1800
G1 F1673
G1 X122.647 Y112.196 E.20658
G1 X122.542 Y112.302 E.00607
G1 X122.542 Y113.503 E.04881
G3 X123.916 Y111.14 I1.548 J-.681 E.12938
G2 X123.837 Y110.653 I-.45 J-.177 E.02104
G3 X125.507 Y108.318 I1.587 J-.63 E.13862
G3 X126.727 Y111.086 I-.139 J1.714 E.15025
G2 X127.238 Y111.521 I.819 J-.446 E.02789
G3 X127.705 Y112.141 I-1.164 J1.364 E.03184
; CHANGE_LAYER
; Z_HEIGHT: 7.2
; LAYER_HEIGHT: 0.083333
; WIPE_START
G1 F24000
G1 X125.705 Y112.163 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 61/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L61
M991 S0 P60 ;notify layer change
G17
G3 Z7.517 I-1.198 J.216 P1  F30000
G1 X126.52 Y116.674 Z7.517
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1673
G1 X126.52 Y123.174 E.21562
G1 X123.724 Y123.174 E.09274
G1 X123.724 Y113.379 E.32495
G1 X139.52 Y113.379 E.52398
G1 X139.52 Y123.174 E.32495
G1 X133.724 Y123.174 E.19226
G1 X133.724 Y116.674 E.21562
G1 X126.58 Y116.674 E.23698
G1 X126.912 Y117.067 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1673
G1 X126.912 Y123.567 E.19973
G1 X123.332 Y123.567 E.11
G1 X123.332 Y112.987 E.32509
G1 X139.912 Y112.987 E.50946
G1 X139.912 Y123.567 E.32509
G1 X133.332 Y123.567 E.20219
G1 X133.332 Y117.067 E.19973
G1 X126.972 Y117.067 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X126.954 Y119.066 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.6 I.774 J-.939 P1  F30000
G1 X126.172 Y118.423 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1673
G1 X126.172 Y120.051 E.05401
G1 X124.073 Y122.15 E.09848
G1 X124.073 Y120.403 E.05796
G1 X126.172 Y122.502 E.09848
G1 X126.172 Y122.826 E.01075
G1 X124.868 Y122.826 E.04327
G1 X124.073 Y116.103 F30000
G1 F1673
G1 X124.073 Y114.474 E.05401
G1 X124.82 Y113.727 E.03506
G1 X125.073 Y113.727 E.00838
G1 X127.672 Y116.326 E.12194
G1 X129.897 Y116.326 E.0738
G1 X132.496 Y113.727 E.12194
G1 X132.748 Y113.727 E.00838
G1 X139.172 Y120.15 E.30133
G1 X139.172 Y122.403 E.07472
G1 X138.748 Y122.826 E.01986
G1 X134.172 Y122.826 E.15182
G1 X134.073 Y122.727 E.00466
G1 X134.073 Y119.826 E.09622
G1 X139.172 Y114.727 E.23922
G1 X139.172 Y113.727 E.03317
G1 X138.544 Y113.727 E.02084
; CHANGE_LAYER
; Z_HEIGHT: 7.39333
; LAYER_HEIGHT: 0.193334
; WIPE_START
G1 F24000
G1 X139.172 Y113.727 E-.23876
G1 X139.172 Y114.727 E-.38
G1 X138.909 Y114.99 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 62/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L62
M991 S0 P61 ;notify layer change
G17
G3 Z7.6 I1.175 J-.317 P1  F30000
G1 X137.995 Y111.604 Z7.6
G1 Z7.393
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.276667
G1 F1668
G3 X137.287 Y108.395 I-.711 J-1.526 E.24495
G1 X137.391 Y108.399 E.00423
G3 X138.049 Y111.578 I-.107 J1.68 E.17838
; WIPE_START
G1 F24000
G1 X137.289 Y111.763 E-.29698
G1 X136.583 Y111.603 E-.27519
M73 P57 R8
G1 X136.185 Y111.31 E-.18783
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.793 I-.127 J-1.21 P1  F30000
G1 X127.703 Y112.196 Z7.793
G1 Z7.393
G1 E.8 F1800
G1 F1668
G1 X122.647 Y112.196 E.20551
G1 X122.542 Y112.302 E.00607
G1 X122.537 Y113.43 E.04585
G3 X123.924 Y111.163 I1.549 J-.61 E.12507
G1 X124.005 Y110.991 E.00774
G3 X125.507 Y108.406 I1.418 J-.905 E.14969
G3 X126.724 Y111.111 I-.136 J1.687 E.14696
G2 X127.222 Y111.539 I.777 J-.401 E.02736
G3 X127.679 Y112.141 I-1.146 J1.342 E.03095
; CHANGE_LAYER
; Z_HEIGHT: 7.4
; LAYER_HEIGHT: 0.00666666
; WIPE_START
G1 F24000
G1 X125.679 Y112.163 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 63/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L63
M991 S0 P62 ;notify layer change
G17
G3 Z7.793 I-1.196 J.223 P1  F30000
G1 X126.52 Y116.674 Z7.793
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1668
G1 X126.52 Y123.174 E.21562
G1 X123.724 Y123.174 E.09274
G1 X123.724 Y113.379 E.32495
G1 X139.52 Y113.379 E.52398
G1 X139.52 Y123.174 E.32495
G1 X133.724 Y123.174 E.19226
G1 X133.724 Y116.674 E.21562
G1 X126.58 Y116.674 E.23698
G1 X126.912 Y117.067 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1668
G1 X126.912 Y123.567 E.19973
G1 X123.332 Y123.567 E.11
G1 X123.332 Y112.987 E.32509
G1 X139.912 Y112.987 E.50946
G1 X139.912 Y123.567 E.32509
G1 X133.332 Y123.567 E.20219
G1 X133.332 Y117.067 E.19973
G1 X126.972 Y117.067 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X126.954 Y119.066 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.8 I.774 J-.939 P1  F30000
G1 X126.172 Y118.423 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1668
G1 X126.172 Y120.051 E.05401
G1 X124.073 Y122.15 E.09848
G1 X124.073 Y120.403 E.05796
G1 X126.172 Y122.502 E.09848
G1 X126.172 Y122.826 E.01075
G1 X124.868 Y122.826 E.04327
G1 X124.073 Y116.103 F30000
G1 F1668
G1 X124.073 Y114.474 E.05401
G1 X124.82 Y113.727 E.03506
G1 X125.073 Y113.727 E.00838
G1 X127.672 Y116.326 E.12194
G1 X129.897 Y116.326 E.0738
G1 X132.496 Y113.727 E.12194
G1 X132.748 Y113.727 E.00838
G1 X139.172 Y120.15 E.30133
G1 X139.172 Y122.403 E.07472
G1 X138.748 Y122.826 E.01986
G1 X134.172 Y122.826 E.15182
G1 X134.073 Y122.727 E.00466
G1 X134.073 Y119.826 E.09622
G1 X139.172 Y114.727 E.23922
G1 X139.172 Y113.727 E.03317
G1 X138.544 Y113.727 E.02084
; CHANGE_LAYER
; Z_HEIGHT: 7.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X139.172 Y113.727 E-.23876
G1 X139.172 Y114.727 E-.38
G1 X138.909 Y114.99 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 64/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L64
M991 S0 P63 ;notify layer change
G17
G3 Z7.8 I-.164 J-1.206 P1  F30000
G1 X126.52 Y116.674 Z7.8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1414
G1 X126.52 Y123.174 E.21562
G1 X123.724 Y123.174 E.09274
G1 X123.724 Y113.379 E.32495
G1 X139.52 Y113.379 E.52398
G1 X139.52 Y123.174 E.32495
G1 X133.724 Y123.174 E.19226
G1 X133.724 Y116.674 E.21562
G1 X126.58 Y116.674 E.23698
G1 X126.912 Y117.067 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1414
G1 X126.912 Y123.567 E.19973
G1 X123.332 Y123.567 E.11
G1 X123.332 Y112.987 E.32509
G1 X139.912 Y112.987 E.50946
G1 X139.912 Y123.567 E.32509
G1 X133.332 Y123.567 E.20219
G1 X133.332 Y117.067 E.19973
G1 X126.972 Y117.067 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X126.954 Y119.066 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8 I.774 J-.939 P1  F30000
G1 X126.172 Y118.423 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1414
G1 X126.172 Y120.051 E.05401
G1 X124.073 Y122.15 E.09848
G1 X124.073 Y120.403 E.05796
G1 X126.172 Y122.502 E.09848
G1 X126.172 Y122.826 E.01075
G1 X124.868 Y122.826 E.04327
G1 X124.073 Y116.103 F30000
G1 F1414
G1 X124.073 Y114.474 E.05401
G1 X124.82 Y113.727 E.03506
G1 X125.073 Y113.727 E.00838
G1 X127.672 Y116.326 E.12194
G1 X129.897 Y116.326 E.0738
G1 X132.496 Y113.727 E.12194
G1 X132.748 Y113.727 E.00838
G1 X139.172 Y120.15 E.30133
G1 X139.172 Y122.403 E.07472
G1 X138.748 Y122.826 E.01986
G1 X134.172 Y122.826 E.15182
G1 X134.073 Y122.727 E.00466
G1 X134.073 Y119.826 E.09622
G1 X139.172 Y114.727 E.23922
G1 X139.172 Y113.727 E.03317
G1 X138.544 Y113.727 E.02084
; CHANGE_LAYER
; Z_HEIGHT: 7.67
; LAYER_HEIGHT: 0.0700002
; WIPE_START
G1 F24000
G1 X139.172 Y113.727 E-.23876
G1 X139.172 Y114.727 E-.38
M73 P58 R8
G1 X138.909 Y114.99 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 65/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L65
M991 S0 P64 ;notify layer change
G17
G3 Z8 I1.173 J-.323 P1  F30000
G1 X137.989 Y111.642 Z8
G1 Z7.67
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.276667
G1 F1664
G3 X137.29 Y108.481 I-.701 J-1.502 E.2413
G1 X137.392 Y108.485 E.00417
G3 X138.042 Y111.616 I-.105 J1.655 E.17562
; WIPE_START
G1 F24000
G1 X137.293 Y111.798 E-.29293
G1 X136.597 Y111.64 E-.2712
G1 X136.182 Y111.335 E-.19588
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.07 I-.123 J-1.211 P1  F30000
G1 X127.676 Y112.196 Z8.07
G1 Z7.67
G1 E.8 F1800
G1 F1664
G1 X122.647 Y112.196 E.20443
G1 X122.542 Y112.302 E.00607
G1 X122.542 Y113.373 E.04353
G3 X123.93 Y111.187 I1.543 J-.554 E.12133
G2 X123.886 Y110.757 I-.34 J-.183 E.01866
G3 X125.508 Y108.492 I1.539 J-.611 E.13455
G3 X126.721 Y111.136 I-.132 J1.661 E.14379
G2 X127.207 Y111.558 I.742 J-.364 E.02687
G3 X127.652 Y112.142 I-1.128 J1.322 E.0301
; CHANGE_LAYER
; Z_HEIGHT: 7.8
; LAYER_HEIGHT: 0.13
; WIPE_START
G1 F24000
G1 X125.653 Y112.164 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 66/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L66
M991 S0 P65 ;notify layer change
G17
G3 Z8.07 I-1.195 J.23 P1  F30000
G1 X126.52 Y116.674 Z8.07
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1664
G1 X126.52 Y123.174 E.21562
G1 X123.724 Y123.174 E.09274
G1 X123.724 Y113.379 E.32495
G1 X139.52 Y113.379 E.52398
G1 X139.52 Y123.174 E.32495
G1 X133.724 Y123.174 E.19226
G1 X133.724 Y116.674 E.21562
G1 X126.58 Y116.674 E.23698
G1 X126.912 Y117.067 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1664
G1 X126.912 Y123.567 E.19973
G1 X123.332 Y123.567 E.11
G1 X123.332 Y112.987 E.32509
G1 X139.912 Y112.987 E.50946
G1 X139.912 Y123.567 E.32509
G1 X133.332 Y123.567 E.20219
G1 X133.332 Y117.067 E.19973
G1 X126.972 Y117.067 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X126.954 Y119.066 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.2 I.774 J-.939 P1  F30000
G1 X126.172 Y118.423 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1664
G1 X126.172 Y120.051 E.05401
G1 X124.073 Y122.15 E.09848
G1 X124.073 Y120.403 E.05796
G1 X126.172 Y122.502 E.09848
G1 X126.172 Y122.826 E.01075
G1 X124.868 Y122.826 E.04327
G1 X124.073 Y116.103 F30000
G1 F1664
G1 X124.073 Y114.474 E.05401
G1 X124.82 Y113.727 E.03506
G1 X125.073 Y113.727 E.00838
G1 X127.672 Y116.326 E.12194
G1 X129.897 Y116.326 E.0738
G1 X132.496 Y113.727 E.12194
G1 X132.748 Y113.727 E.00838
G1 X139.172 Y120.15 E.30133
G1 X139.172 Y122.403 E.07472
G1 X138.748 Y122.826 E.01986
G1 X134.172 Y122.826 E.15182
G1 X134.073 Y122.727 E.00466
G1 X134.073 Y119.826 E.09622
G1 X139.172 Y114.727 E.23922
G1 X139.172 Y113.727 E.03317
G1 X138.544 Y113.727 E.02084
; CHANGE_LAYER
; Z_HEIGHT: 7.94667
; LAYER_HEIGHT: 0.146667
; WIPE_START
G1 F24000
G1 X139.172 Y113.727 E-.23876
G1 X139.172 Y114.727 E-.38
G1 X138.909 Y114.99 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 67/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L67
M991 S0 P66 ;notify layer change
G17
G3 Z8.2 I1.172 J-.328 P1  F30000
G1 X137.982 Y111.677 Z8.2
G1 Z7.947
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.276667
G1 F1661
G3 X137.294 Y108.565 I-.691 J-1.479 E.23765
G1 X137.395 Y108.568 E.00411
G3 X138.035 Y111.651 I-.104 J1.629 E.17286
; WIPE_START
M73 P59 R8
G1 F24000
G1 X137.297 Y111.831 E-.28887
G1 X136.611 Y111.676 E-.26721
G1 X136.179 Y111.358 E-.20392
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.347 I-.119 J-1.211 P1  F30000
G1 X127.65 Y112.196 Z8.347
G1 Z7.947
G1 E.8 F1800
G1 F1661
G1 X122.647 Y112.196 E.20336
G1 X122.561 Y112.283 E.00497
G3 X123.943 Y111.209 I1.539 J.555 E.07503
G2 X123.877 Y110.708 I-.502 J-.189 E.02142
G3 X125.509 Y108.574 I1.545 J-.509 E.12847
G3 X126.716 Y111.16 I-.129 J1.635 E.14074
G2 X127.191 Y111.577 I.712 J-.334 E.02643
G3 X127.626 Y112.143 I-1.111 J1.302 E.02921
G1 X122.542 Y112.34 F30000
G1 F1661
G1 X122.542 Y113.298 E.03894
G3 X122.526 Y112.397 I1.6 J-.479 E.03707
; CHANGE_LAYER
; Z_HEIGHT: 8
; LAYER_HEIGHT: 0.0533333
; WIPE_START
G1 F24000
G1 X122.542 Y113.298 E-.37805
G1 X122.469 Y112.819 E-.2034
G1 X122.526 Y112.397 E-.17855
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 68/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L68
M991 S0 P67 ;notify layer change
G17
G3 Z8.347 I-.889 J.831 P1  F30000
G1 X126.52 Y116.674 Z8.347
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1661
G1 X126.52 Y123.174 E.21562
G1 X123.724 Y123.174 E.09274
G1 X123.724 Y113.379 E.32495
G1 X139.52 Y113.379 E.52398
G1 X139.52 Y123.174 E.32495
G1 X133.724 Y123.174 E.19226
G1 X133.724 Y116.674 E.21562
G1 X126.58 Y116.674 E.23698
G1 X126.912 Y117.067 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1661
G1 X126.912 Y123.567 E.19973
G1 X123.332 Y123.567 E.11
G1 X123.332 Y112.987 E.32509
G1 X139.912 Y112.987 E.50946
G1 X139.912 Y123.567 E.32509
G1 X133.332 Y123.567 E.20219
G1 X133.332 Y117.067 E.19973
G1 X126.972 Y117.067 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X126.954 Y119.066 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.4 I.774 J-.939 P1  F30000
G1 X126.172 Y118.423 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1661
G1 X126.172 Y120.051 E.05401
G1 X124.073 Y122.15 E.09848
G1 X124.073 Y120.403 E.05796
G1 X126.172 Y122.502 E.09848
G1 X126.172 Y122.826 E.01075
G1 X124.868 Y122.826 E.04327
G1 X124.073 Y116.103 F30000
G1 F1661
G1 X124.073 Y114.474 E.05401
G1 X124.82 Y113.727 E.03506
G1 X125.073 Y113.727 E.00838
G1 X127.672 Y116.326 E.12194
G1 X129.897 Y116.326 E.0738
G1 X132.496 Y113.727 E.12194
G1 X132.748 Y113.727 E.00838
G1 X139.172 Y120.15 E.30133
G1 X139.172 Y122.403 E.07472
G1 X138.748 Y122.826 E.01986
G1 X134.172 Y122.826 E.15182
G1 X134.073 Y122.727 E.00466
G1 X134.073 Y119.826 E.09622
G1 X139.172 Y114.727 E.23922
G1 X139.172 Y113.727 E.03317
G1 X138.544 Y113.727 E.02084
; CHANGE_LAYER
; Z_HEIGHT: 8.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X139.172 Y113.727 E-.23876
G1 X139.172 Y114.727 E-.38
G1 X138.909 Y114.99 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 69/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L69
M991 S0 P68 ;notify layer change
G17
G3 Z8.4 I-.164 J-1.206 P1  F30000
G1 X126.52 Y116.674 Z8.4
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1414
G1 X126.52 Y123.174 E.21562
G1 X123.724 Y123.174 E.09274
G1 X123.724 Y113.379 E.32495
G1 X139.52 Y113.379 E.52398
G1 X139.52 Y123.174 E.32495
G1 X133.724 Y123.174 E.19226
G1 X133.724 Y116.674 E.21562
G1 X126.58 Y116.674 E.23698
G1 X126.912 Y117.067 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1414
G1 X126.912 Y123.567 E.19973
G1 X123.332 Y123.567 E.11
G1 X123.332 Y112.987 E.32509
G1 X139.912 Y112.987 E.50946
G1 X139.912 Y123.567 E.32509
G1 X133.332 Y123.567 E.20219
G1 X133.332 Y117.067 E.19973
G1 X126.972 Y117.067 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X126.954 Y119.066 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.6 I.774 J-.939 P1  F30000
G1 X126.172 Y118.423 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1414
G1 X126.172 Y120.051 E.05401
G1 X124.073 Y122.15 E.09848
G1 X124.073 Y120.403 E.05796
G1 X126.172 Y122.502 E.09848
G1 X126.172 Y122.826 E.01075
G1 X124.868 Y122.826 E.04327
G1 X124.073 Y116.103 F30000
G1 F1414
M73 P60 R8
G1 X124.073 Y114.474 E.05401
G1 X124.82 Y113.727 E.03506
G1 X125.073 Y113.727 E.00838
G1 X127.672 Y116.326 E.12194
G1 X129.897 Y116.326 E.0738
G1 X132.496 Y113.727 E.12194
G1 X132.748 Y113.727 E.00838
G1 X139.172 Y120.15 E.30133
G1 X139.172 Y122.403 E.07472
G1 X138.748 Y122.826 E.01986
G1 X134.172 Y122.826 E.15182
G1 X134.073 Y122.727 E.00466
G1 X134.073 Y119.826 E.09622
G1 X139.172 Y114.727 E.23922
G1 X139.172 Y113.727 E.03317
G1 X138.544 Y113.727 E.02084
; CHANGE_LAYER
; Z_HEIGHT: 8.22333
; LAYER_HEIGHT: 0.0233335
; WIPE_START
G1 F24000
G1 X139.172 Y113.727 E-.23876
G1 X139.172 Y114.727 E-.38
G1 X138.909 Y114.99 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 70/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L70
M991 S0 P69 ;notify layer change
G17
G3 Z8.6 I1.171 J-.333 P1  F30000
G1 X137.976 Y111.709 Z8.6
G1 Z8.223
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.276667
G1 F1670
G3 X137.298 Y108.646 I-.682 J-1.456 E.23402
G1 X137.397 Y108.649 E.00405
G3 X138.03 Y111.683 I-.102 J1.604 E.17011
; WIPE_START
G1 F24000
G1 X137.302 Y111.862 E-.28482
G1 X136.626 Y111.709 E-.26322
G1 X136.177 Y111.378 E-.21196
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.623 I-.116 J-1.211 P1  F30000
G1 X127.624 Y112.196 Z8.623
G1 Z8.223
G1 E.8 F1800
G1 F1670
G1 X122.604 Y112.234 E.20406
G3 X123.957 Y111.232 I1.49 J.597 E.07204
G2 X123.903 Y110.754 I-.451 J-.191 E.02042
G3 X125.51 Y108.654 I1.521 J-.501 E.1265
G3 X126.71 Y111.194 I-.125 J1.612 E.13834
G2 X127.176 Y111.595 I.705 J-.346 E.02569
G3 X127.599 Y112.143 I-1.096 J1.283 E.02832
; WIPE_START
G1 F24000
G1 X125.599 Y112.179 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.623 I-.098 J-1.213 P1  F30000
G1 X122.542 Y112.427 Z8.623
G1 Z8.223
G1 E.8 F1800
G1 F1670
G1 X122.542 Y113.21 E.03183
G3 X122.529 Y112.484 I1.643 J-.392 E.02973
; CHANGE_LAYER
; Z_HEIGHT: 8.4
; LAYER_HEIGHT: 0.176666
; WIPE_START
G1 F24000
G1 X122.542 Y113.21 E-.38
G1 X122.529 Y112.484 E-.38
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 71/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L71
M991 S0 P70 ;notify layer change
G17
G3 Z8.623 I-.881 J.839 P1  F30000
G1 X126.52 Y116.674 Z8.623
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1670
G1 X126.52 Y123.174 E.21562
G1 X123.724 Y123.174 E.09274
G1 X123.724 Y113.379 E.32495
G1 X139.52 Y113.379 E.52398
G1 X139.52 Y123.174 E.32495
G1 X133.724 Y123.174 E.19226
G1 X133.724 Y116.674 E.21562
G1 X126.58 Y116.674 E.23698
G1 X126.912 Y117.067 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1670
G1 X126.912 Y123.567 E.19973
G1 X123.332 Y123.567 E.11
G1 X123.332 Y112.987 E.32509
G1 X139.912 Y112.987 E.50946
G1 X139.912 Y123.567 E.32509
G1 X133.332 Y123.567 E.20219
G1 X133.332 Y117.067 E.19973
G1 X126.972 Y117.067 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X126.954 Y119.066 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.8 I.774 J-.939 P1  F30000
G1 X126.172 Y118.423 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1670
G1 X126.172 Y120.051 E.05401
G1 X124.073 Y122.15 E.09848
G1 X124.073 Y120.403 E.05796
G1 X126.172 Y122.502 E.09848
G1 X126.172 Y122.826 E.01075
M73 P60 R7
G1 X124.868 Y122.826 E.04327
G1 X124.073 Y116.103 F30000
G1 F1670
G1 X124.073 Y114.474 E.05401
G1 X124.82 Y113.727 E.03506
G1 X125.073 Y113.727 E.00838
G1 X127.672 Y116.326 E.12194
G1 X129.897 Y116.326 E.0738
G1 X132.496 Y113.727 E.12194
G1 X132.748 Y113.727 E.00838
G1 X139.172 Y120.15 E.30133
G1 X139.172 Y122.403 E.07472
G1 X138.748 Y122.826 E.01986
G1 X134.172 Y122.826 E.15182
G1 X134.073 Y122.727 E.00466
G1 X134.073 Y119.826 E.09622
G1 X139.172 Y114.727 E.23922
G1 X139.172 Y113.727 E.03317
G1 X138.544 Y113.727 E.02084
; CHANGE_LAYER
; Z_HEIGHT: 8.5
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F24000
G1 X139.172 Y113.727 E-.23876
G1 X139.172 Y114.727 E-.38
G1 X138.909 Y114.99 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 72/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L72
M991 S0 P71 ;notify layer change
G17
G3 Z8.8 I1.169 J-.337 P1  F30000
G1 X137.971 Y111.74 Z8.8
M73 P61 R7
G1 Z8.5
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.276667
G1 F1663
G3 X137.303 Y108.725 I-.672 J-1.433 E.2304
G1 X137.401 Y108.728 E.00399
G3 X138.024 Y111.714 I-.101 J1.579 E.16736
; WIPE_START
G1 F24000
G1 X137.307 Y111.89 E-.28076
G1 X136.642 Y111.739 E-.25924
G1 X136.175 Y111.396 E-.22
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.9 I-.113 J-1.212 P1  F30000
G1 X127.597 Y112.196 Z8.9
G1 Z8.5
G1 E.8 F1800
G1 F1663
G1 X122.647 Y112.197 E.20126
G3 X123.973 Y111.254 I1.45 J.634 E.06949
G2 X123.929 Y110.798 I-.408 J-.191 E.01951
G3 X125.512 Y108.731 I1.497 J-.493 E.12453
G3 X126.703 Y111.217 I-.121 J1.586 E.1355
G2 X127.161 Y111.614 I.687 J-.329 E.02535
G3 X127.572 Y112.143 I-1.081 J1.266 E.02743
; WIPE_START
G1 F24000
G1 X125.572 Y112.165 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.9 I-.151 J-1.208 P1  F30000
G1 X122.542 Y112.543 Z8.9
G1 Z8.5
G1 E.8 F1800
G1 F1663
G1 X122.542 Y113.094 E.0224
G3 X122.533 Y112.602 I1.726 J-.276 E.02008
; CHANGE_LAYER
; Z_HEIGHT: 8.6
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F24000
G1 X122.542 Y113.094 E-.38
G1 X122.533 Y112.602 E-.38
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 73/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L73
M991 S0 P72 ;notify layer change
G17
G3 Z8.9 I-.87 J.851 P1  F30000
G1 X126.52 Y116.674 Z8.9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1663
G1 X126.52 Y123.174 E.21562
G1 X123.724 Y123.174 E.09274
G1 X123.724 Y113.379 E.32495
G1 X139.52 Y113.379 E.52398
G1 X139.52 Y123.174 E.32495
G1 X133.724 Y123.174 E.19226
G1 X133.724 Y116.674 E.21562
G1 X126.58 Y116.674 E.23698
G1 X126.912 Y117.067 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1663
G1 X126.912 Y123.567 E.19973
G1 X123.332 Y123.567 E.11
G1 X123.332 Y112.987 E.32509
G1 X139.912 Y112.987 E.50946
G1 X139.912 Y123.567 E.32509
G1 X133.332 Y123.567 E.20219
G1 X133.332 Y117.067 E.19973
G1 X126.972 Y117.067 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X126.954 Y119.066 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9 I.774 J-.939 P1  F30000
G1 X126.172 Y118.423 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1663
G1 X126.172 Y120.051 E.05401
G1 X124.073 Y122.15 E.09848
G1 X124.073 Y120.403 E.05796
G1 X126.172 Y122.502 E.09848
G1 X126.172 Y122.826 E.01075
G1 X124.868 Y122.826 E.04327
G1 X124.073 Y116.103 F30000
G1 F1663
G1 X124.073 Y114.474 E.05401
G1 X124.82 Y113.727 E.03506
G1 X125.073 Y113.727 E.00838
G1 X127.672 Y116.326 E.12194
G1 X129.897 Y116.326 E.0738
G1 X132.496 Y113.727 E.12194
G1 X132.748 Y113.727 E.00838
G1 X139.172 Y120.15 E.30133
G1 X139.172 Y122.403 E.07472
G1 X138.748 Y122.826 E.01986
G1 X134.172 Y122.826 E.15182
G1 X134.073 Y122.727 E.00466
G1 X134.073 Y119.826 E.09622
G1 X139.172 Y114.727 E.23922
G1 X139.172 Y113.727 E.03317
G1 X138.544 Y113.727 E.02084
; CHANGE_LAYER
; Z_HEIGHT: 8.77667
; LAYER_HEIGHT: 0.176666
; WIPE_START
G1 F24000
G1 X139.172 Y113.727 E-.23876
G1 X139.172 Y114.727 E-.38
G1 X138.909 Y114.99 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 74/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L74
M991 S0 P73 ;notify layer change
G17
G3 Z9 I1.168 J-.342 P1  F30000
G1 X137.967 Y111.768 Z9
G1 Z8.777
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.276667
G1 F1634
G3 X137.308 Y108.801 I-.662 J-1.41 E.22679
G1 X137.405 Y108.805 E.00393
G3 X138.02 Y111.742 I-.1 J1.554 E.16462
; WIPE_START
G1 F24000
G1 X137.313 Y111.917 E-.2767
G1 X136.658 Y111.768 E-.25526
G1 X136.191 Y111.425 E-.22042
G1 X136.18 Y111.408 E-.00762
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.177 I-.111 J-1.212 P1  F30000
G1 X127.571 Y112.196 Z9.177
G1 Z8.777
G1 E.8 F1800
G1 F1634
M73 P62 R7
G1 X122.673 Y112.196 E.1991
G3 X123.983 Y111.283 I1.418 J.637 E.06818
G1 X124.075 Y111.116 E.00775
G3 X125.515 Y108.806 I1.36 J-.756 E.13465
G3 X126.694 Y111.239 I-.118 J1.56 E.13276
G2 X127.218 Y111.697 I.829 J-.421 E.02895
G3 X127.546 Y112.143 I-1.07 J1.131 E.02263
; CHANGE_LAYER
; Z_HEIGHT: 8.8
; LAYER_HEIGHT: 0.0233335
; WIPE_START
G1 F24000
G1 X125.546 Y112.165 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 75/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L75
M991 S0 P74 ;notify layer change
G17
G3 Z9.177 I-1.19 J.257 P1  F30000
G1 X126.52 Y116.674 Z9.177
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1634
G1 X126.52 Y123.174 E.21562
G1 X123.724 Y123.174 E.09274
G1 X123.724 Y113.379 E.32495
G1 X139.52 Y113.379 E.52398
G1 X139.52 Y123.174 E.32495
G1 X133.724 Y123.174 E.19226
G1 X133.724 Y116.674 E.21562
G1 X126.58 Y116.674 E.23698
G1 X126.912 Y117.067 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1634
G1 X126.912 Y123.567 E.19973
G1 X123.332 Y123.567 E.11
G1 X123.332 Y112.987 E.32509
G1 X139.912 Y112.987 E.50946
G1 X139.912 Y123.567 E.32509
G1 X133.332 Y123.567 E.20219
G1 X133.332 Y117.067 E.19973
G1 X126.972 Y117.067 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X126.954 Y119.066 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.2 I.774 J-.939 P1  F30000
G1 X126.172 Y118.423 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1634
G1 X126.172 Y120.051 E.05401
G1 X124.073 Y122.15 E.09848
G1 X124.073 Y120.403 E.05796
G1 X126.172 Y122.502 E.09848
G1 X126.172 Y122.826 E.01075
G1 X124.868 Y122.826 E.04327
G1 X124.073 Y116.103 F30000
G1 F1634
G1 X124.073 Y114.474 E.05401
G1 X124.82 Y113.727 E.03506
G1 X125.073 Y113.727 E.00838
G1 X127.672 Y116.326 E.12194
G1 X129.897 Y116.326 E.0738
G1 X132.496 Y113.727 E.12194
G1 X132.748 Y113.727 E.00838
G1 X139.172 Y120.15 E.30133
G1 X139.172 Y122.403 E.07472
G1 X138.748 Y122.826 E.01986
G1 X134.172 Y122.826 E.15182
G1 X134.073 Y122.727 E.00466
G1 X134.073 Y119.826 E.09622
G1 X139.172 Y114.727 E.23922
G1 X139.172 Y113.727 E.03317
G1 X138.544 Y113.727 E.02084
; CHANGE_LAYER
; Z_HEIGHT: 9
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X139.172 Y113.727 E-.23876
G1 X139.172 Y114.727 E-.38
G1 X138.909 Y114.99 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 76/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L76
M991 S0 P75 ;notify layer change
G17
G3 Z9.2 I-.164 J-1.206 P1  F30000
G1 X126.52 Y116.674 Z9.2
G1 Z9
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1414
G1 X126.52 Y123.174 E.21562
G1 X123.724 Y123.174 E.09274
G1 X123.724 Y113.379 E.32495
G1 X139.52 Y113.379 E.52398
G1 X139.52 Y123.174 E.32495
G1 X133.724 Y123.174 E.19226
G1 X133.724 Y116.674 E.21562
G1 X126.58 Y116.674 E.23698
G1 X126.912 Y117.067 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1414
G1 X126.912 Y123.567 E.19973
G1 X123.332 Y123.567 E.11
G1 X123.332 Y112.987 E.32509
G1 X139.912 Y112.987 E.50946
G1 X139.912 Y123.567 E.32509
G1 X133.332 Y123.567 E.20219
G1 X133.332 Y117.067 E.19973
G1 X126.972 Y117.067 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X126.954 Y119.066 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I.774 J-.939 P1  F30000
G1 X126.172 Y118.423 Z9.4
G1 Z9
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1414
G1 X126.172 Y120.051 E.05401
G1 X124.073 Y122.15 E.09848
G1 X124.073 Y120.403 E.05796
G1 X126.172 Y122.502 E.09848
G1 X126.172 Y122.826 E.01075
G1 X124.868 Y122.826 E.04327
G1 X124.073 Y116.103 F30000
G1 F1414
G1 X124.073 Y114.474 E.05401
G1 X124.82 Y113.727 E.03506
G1 X125.073 Y113.727 E.00838
G1 X127.672 Y116.326 E.12194
G1 X129.897 Y116.326 E.0738
G1 X132.496 Y113.727 E.12194
G1 X132.748 Y113.727 E.00838
G1 X139.172 Y120.15 E.30133
G1 X139.172 Y122.403 E.07472
G1 X138.748 Y122.826 E.01986
G1 X134.172 Y122.826 E.15182
G1 X134.073 Y122.727 E.00466
G1 X134.073 Y119.826 E.09622
G1 X139.172 Y114.727 E.23922
G1 X139.172 Y113.727 E.03317
G1 X138.544 Y113.727 E.02084
; CHANGE_LAYER
; Z_HEIGHT: 9.05333
; LAYER_HEIGHT: 0.0533333
; WIPE_START
G1 F24000
G1 X139.172 Y113.727 E-.23876
G1 X139.172 Y114.727 E-.38
G1 X138.909 Y114.99 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 77/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L77
M991 S0 P76 ;notify layer change
G17
G3 Z9.4 I1.167 J-.345 P1  F30000
M73 P63 R7
G1 X137.963 Y111.795 Z9.4
G1 Z9.053
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.276667
G1 F1630
G3 X137.314 Y108.876 I-.652 J-1.387 E.22321
G1 X137.409 Y108.879 E.00386
G3 X138.016 Y111.769 I-.098 J1.529 E.16189
; WIPE_START
G1 F24000
G1 X137.32 Y111.942 E-.27264
G1 X136.675 Y111.795 E-.25129
G1 X136.215 Y111.457 E-.21698
G1 X136.188 Y111.415 E-.01909
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.453 I-.11 J-1.212 P1  F30000
G1 X127.545 Y112.196 Z9.453
G1 Z9.053
G1 E.8 F1800
G1 F1630
G1 X122.7 Y112.196 E.19695
G3 X123.999 Y111.305 I1.393 J.639 E.06727
G2 X123.984 Y110.879 I-.322 J-.202 E.0184
G3 X125.517 Y108.879 I1.448 J-.478 E.1206
G3 X126.686 Y111.262 I-.115 J1.534 E.13011
G2 X127.201 Y111.714 I.812 J-.406 E.02859
G3 X127.519 Y112.143 I-1.056 J1.116 E.0218
; CHANGE_LAYER
; Z_HEIGHT: 9.2
; LAYER_HEIGHT: 0.146667
; WIPE_START
G1 F24000
G1 X125.519 Y112.165 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 78/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L78
M991 S0 P77 ;notify layer change
G17
G3 Z9.453 I-1.188 J.264 P1  F30000
G1 X126.52 Y116.674 Z9.453
G1 Z9.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1630
G1 X126.52 Y123.174 E.21562
G1 X123.724 Y123.174 E.09274
G1 X123.724 Y113.379 E.32495
G1 X139.52 Y113.379 E.52398
G1 X139.52 Y123.174 E.32495
G1 X133.724 Y123.174 E.19226
G1 X133.724 Y116.674 E.21562
G1 X126.58 Y116.674 E.23698
G1 X126.912 Y117.067 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1630
G1 X126.912 Y123.567 E.19973
G1 X123.332 Y123.567 E.11
G1 X123.332 Y112.987 E.32509
G1 X139.912 Y112.987 E.50946
G1 X139.912 Y123.567 E.32509
G1 X133.332 Y123.567 E.20219
G1 X133.332 Y117.067 E.19973
G1 X126.972 Y117.067 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X126.954 Y119.066 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.6 I.774 J-.939 P1  F30000
G1 X126.172 Y118.423 Z9.6
G1 Z9.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1630
G1 X126.172 Y120.051 E.05401
G1 X124.073 Y122.15 E.09848
G1 X124.073 Y120.403 E.05796
G1 X126.172 Y122.502 E.09848
G1 X126.172 Y122.826 E.01075
G1 X124.868 Y122.826 E.04327
G1 X124.073 Y116.103 F30000
G1 F1630
G1 X124.073 Y114.474 E.05401
G1 X124.82 Y113.727 E.03506
G1 X125.073 Y113.727 E.00838
G1 X127.672 Y116.326 E.12194
G1 X129.897 Y116.326 E.0738
G1 X132.496 Y113.727 E.12194
G1 X132.748 Y113.727 E.00838
G1 X139.172 Y120.15 E.30133
G1 X139.172 Y122.403 E.07472
G1 X138.748 Y122.826 E.01986
G1 X134.172 Y122.826 E.15182
G1 X134.073 Y122.727 E.00466
G1 X134.073 Y119.826 E.09622
G1 X139.172 Y114.727 E.23922
G1 X139.172 Y113.727 E.03317
G1 X138.544 Y113.727 E.02084
; CHANGE_LAYER
; Z_HEIGHT: 9.33
; LAYER_HEIGHT: 0.13
; WIPE_START
G1 F24000
G1 X139.172 Y113.727 E-.23876
G1 X139.172 Y114.727 E-.38
G1 X138.909 Y114.99 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 79/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L79
M991 S0 P78 ;notify layer change
G17
G3 Z9.6 I1.166 J-.349 P1  F30000
G1 X137.96 Y111.82 Z9.6
G1 Z9.33
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.276667
G1 F1627
G3 X137.322 Y108.949 I-.642 J-1.364 E.21963
G1 X137.415 Y108.952 E.0038
G3 X138.014 Y111.794 I-.097 J1.504 E.15917
; WIPE_START
G1 F24000
G1 X137.328 Y111.965 E-.26859
G1 X136.693 Y111.821 E-.24732
G1 X136.24 Y111.488 E-.21356
M73 P64 R7
G1 X136.197 Y111.42 E-.03053
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.73 I-.108 J-1.212 P1  F30000
G1 X127.518 Y112.196 Z9.73
G1 Z9.33
G1 E.8 F1800
G1 F1627
G1 X122.731 Y112.184 E.19459
G3 X124.021 Y111.328 I1.356 J.642 E.06612
G2 X124.012 Y110.917 I-.296 J-.199 E.01779
G3 X125.521 Y108.949 I1.424 J-.47 E.11864
G3 X126.676 Y111.284 I-.113 J1.509 E.12756
G2 X127.185 Y111.732 I.799 J-.394 E.02824
G3 X127.492 Y112.143 I-1.045 J1.103 E.02097
; CHANGE_LAYER
; Z_HEIGHT: 9.4
; LAYER_HEIGHT: 0.0699997
; WIPE_START
G1 F24000
G1 X125.492 Y112.16 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 80/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L80
M991 S0 P79 ;notify layer change
G17
G3 Z9.73 I-1.187 J.27 P1  F30000
G1 X126.52 Y116.674 Z9.73
G1 Z9.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1627
G1 X126.52 Y123.174 E.21562
G1 X123.724 Y123.174 E.09274
G1 X123.724 Y113.379 E.32495
G1 X139.52 Y113.379 E.52398
G1 X139.52 Y123.174 E.32495
G1 X133.724 Y123.174 E.19226
G1 X133.724 Y116.674 E.21562
G1 X126.58 Y116.674 E.23698
G1 X126.912 Y117.067 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1627
G1 X126.912 Y123.567 E.19973
G1 X123.332 Y123.567 E.11
G1 X123.332 Y112.987 E.32509
G1 X139.912 Y112.987 E.50946
G1 X139.912 Y123.567 E.32509
G1 X133.332 Y123.567 E.20219
G1 X133.332 Y117.067 E.19973
G1 X126.972 Y117.067 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X126.954 Y119.066 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.8 I.774 J-.939 P1  F30000
G1 X126.172 Y118.423 Z9.8
G1 Z9.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1627
G1 X126.172 Y120.051 E.05401
G1 X124.073 Y122.15 E.09848
G1 X124.073 Y120.403 E.05796
G1 X126.172 Y122.502 E.09848
G1 X126.172 Y122.826 E.01075
G1 X124.868 Y122.826 E.04327
G1 X124.073 Y116.103 F30000
G1 F1627
G1 X124.073 Y114.474 E.05401
G1 X124.82 Y113.727 E.03506
G1 X125.073 Y113.727 E.00838
G1 X127.672 Y116.326 E.12194
G1 X129.897 Y116.326 E.0738
G1 X132.496 Y113.727 E.12194
G1 X132.748 Y113.727 E.00838
G1 X139.172 Y120.15 E.30133
G1 X139.172 Y122.403 E.07472
G1 X138.748 Y122.826 E.01986
G1 X134.172 Y122.826 E.15182
G1 X134.073 Y122.727 E.00466
G1 X134.073 Y119.826 E.09622
G1 X139.172 Y114.727 E.23922
G1 X139.172 Y113.727 E.03317
G1 X138.544 Y113.727 E.02084
; CHANGE_LAYER
; Z_HEIGHT: 9.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X139.172 Y113.727 E-.23876
G1 X139.172 Y114.727 E-.38
G1 X138.909 Y114.99 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 81/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L81
M991 S0 P80 ;notify layer change
G17
G3 Z9.8 I-.164 J-1.206 P1  F30000
G1 X126.52 Y116.674 Z9.8
G1 Z9.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1414
G1 X126.52 Y123.174 E.21562
G1 X123.724 Y123.174 E.09274
G1 X123.724 Y113.379 E.32495
G1 X139.52 Y113.379 E.52398
G1 X139.52 Y123.174 E.32495
G1 X133.724 Y123.174 E.19226
G1 X133.724 Y116.674 E.21562
G1 X126.58 Y116.674 E.23698
G1 X126.912 Y117.067 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1414
G1 X126.912 Y123.567 E.19973
G1 X123.332 Y123.567 E.11
G1 X123.332 Y112.987 E.32509
G1 X139.912 Y112.987 E.50946
G1 X139.912 Y123.567 E.32509
G1 X133.332 Y123.567 E.20219
G1 X133.332 Y117.067 E.19973
G1 X126.972 Y117.067 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X126.954 Y119.066 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10 I.774 J-.939 P1  F30000
G1 X126.172 Y118.423 Z10
G1 Z9.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1414
G1 X126.172 Y120.051 E.05401
G1 X124.073 Y122.15 E.09848
G1 X124.073 Y120.403 E.05796
G1 X126.172 Y122.502 E.09848
G1 X126.172 Y122.826 E.01075
G1 X124.868 Y122.826 E.04327
G1 X124.073 Y116.103 F30000
G1 F1414
G1 X124.073 Y114.474 E.05401
G1 X124.82 Y113.727 E.03506
G1 X125.073 Y113.727 E.00838
G1 X127.672 Y116.326 E.12194
G1 X129.897 Y116.326 E.0738
G1 X132.496 Y113.727 E.12194
G1 X132.748 Y113.727 E.00838
G1 X139.172 Y120.15 E.30133
G1 X139.172 Y122.403 E.07472
G1 X138.748 Y122.826 E.01986
G1 X134.172 Y122.826 E.15182
G1 X134.073 Y122.727 E.00466
G1 X134.073 Y119.826 E.09622
G1 X139.172 Y114.727 E.23922
G1 X139.172 Y113.727 E.03317
G1 X138.544 Y113.727 E.02084
; CHANGE_LAYER
; Z_HEIGHT: 9.60667
; LAYER_HEIGHT: 0.00666618
; WIPE_START
G1 F24000
G1 X139.172 Y113.727 E-.23876
G1 X139.172 Y114.727 E-.38
G1 X138.909 Y114.99 E-.14124
; WIPE_END
M73 P65 R7
G1 E-.04 F1800
; layer num/total_layer_count: 82/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L82
M991 S0 P81 ;notify layer change
G17
G3 Z10 I1.165 J-.352 P1  F30000
G1 X137.958 Y111.844 Z10
G1 Z9.607
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.276667
G1 F1624
G3 X137.329 Y109.021 I-.633 J-1.341 E.21607
G1 X137.421 Y109.024 E.00374
G3 X138.012 Y111.818 I-.096 J1.479 E.15645
; WIPE_START
G1 F24000
G1 X137.336 Y111.987 E-.26452
G1 X136.712 Y111.845 E-.24336
G1 X136.266 Y111.518 E-.21016
G1 X136.207 Y111.424 E-.04196
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.007 I-.107 J-1.212 P1  F30000
G1 X127.492 Y112.196 Z10.007
G1 Z9.607
G1 E.8 F1800
G1 F1624
G1 X122.753 Y112.194 E.19263
G3 X124.044 Y111.35 I1.337 J.635 E.06597
G2 X124.016 Y110.863 I-.457 J-.217 E.02068
G3 X125.525 Y109.018 I1.429 J-.371 E.11278
G3 X126.667 Y111.307 I-.11 J1.484 E.1251
G2 X127.168 Y111.75 I.786 J-.384 E.0279
G3 X127.465 Y112.143 I-1.037 J1.093 E.02014
; CHANGE_LAYER
; Z_HEIGHT: 9.8
; LAYER_HEIGHT: 0.193334
; WIPE_START
G1 F24000
G1 X125.466 Y112.165 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 83/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L83
M991 S0 P82 ;notify layer change
G17
G3 Z10.007 I-1.185 J.277 P1  F30000
G1 X126.52 Y116.674 Z10.007
G1 Z9.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1624
G1 X126.52 Y123.174 E.21562
G1 X123.724 Y123.174 E.09274
G1 X123.724 Y113.379 E.32495
G1 X139.52 Y113.379 E.52398
G1 X139.52 Y123.174 E.32495
G1 X133.724 Y123.174 E.19226
G1 X133.724 Y116.674 E.21562
G1 X126.58 Y116.674 E.23698
G1 X126.912 Y117.067 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1624
G1 X126.912 Y123.567 E.19973
G1 X123.332 Y123.567 E.11
G1 X123.332 Y112.987 E.32509
G1 X139.912 Y112.987 E.50946
G1 X139.912 Y123.567 E.32509
G1 X133.332 Y123.567 E.20219
G1 X133.332 Y117.067 E.19973
G1 X126.972 Y117.067 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X126.954 Y119.066 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.2 I.774 J-.939 P1  F30000
G1 X126.172 Y118.423 Z10.2
G1 Z9.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1624
G1 X126.172 Y120.051 E.05401
G1 X124.073 Y122.15 E.09848
G1 X124.073 Y120.403 E.05796
G1 X126.172 Y122.502 E.09848
G1 X126.172 Y122.826 E.01075
G1 X124.868 Y122.826 E.04327
G1 X124.073 Y116.103 F30000
G1 F1624
G1 X124.073 Y114.474 E.05401
G1 X124.82 Y113.727 E.03506
G1 X125.073 Y113.727 E.00838
G1 X127.672 Y116.326 E.12194
G1 X129.897 Y116.326 E.0738
G1 X132.496 Y113.727 E.12194
G1 X132.748 Y113.727 E.00838
G1 X139.172 Y120.15 E.30133
G1 X139.172 Y122.403 E.07472
M73 P65 R6
G1 X138.748 Y122.826 E.01986
G1 X134.172 Y122.826 E.15182
G1 X134.073 Y122.727 E.00466
G1 X134.073 Y119.826 E.09622
G1 X139.172 Y114.727 E.23922
G1 X139.172 Y113.727 E.03317
G1 X138.544 Y113.727 E.02084
; CHANGE_LAYER
; Z_HEIGHT: 9.88333
; LAYER_HEIGHT: 0.083333
; WIPE_START
G1 F24000
G1 X139.172 Y113.727 E-.23876
G1 X139.172 Y114.727 E-.38
G1 X138.909 Y114.99 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 84/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L84
M991 S0 P83 ;notify layer change
G17
G3 Z10.2 I1.164 J-.355 P1  F30000
G1 X137.957 Y111.867 Z10.2
G1 Z9.883
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.276667
G1 F1622
G3 X137.338 Y109.091 I-.623 J-1.318 E.21252
G1 X137.429 Y109.094 E.00368
G3 X138.01 Y111.841 I-.095 J1.455 E.15375
; WIPE_START
G1 F24000
G1 X137.346 Y112.008 E-.26046
M73 P66 R6
G1 X136.732 Y111.868 E-.23941
G1 X136.293 Y111.546 E-.20675
G1 X136.218 Y111.427 E-.05339
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.283 I-.107 J-1.212 P1  F30000
G1 X127.465 Y112.196 Z10.283
G1 Z9.883
G1 E.8 F1800
G1 F1622
G1 X122.779 Y112.196 E.19047
G3 X124.069 Y111.372 I1.315 J.636 E.0655
G2 X124.046 Y110.898 I-.431 J-.216 E.02013
G3 X125.53 Y109.085 I1.405 J-.365 E.11089
G3 X126.657 Y111.329 I-.108 J1.459 E.12272
G2 X127.151 Y111.767 I.774 J-.375 E.02756
G3 X127.437 Y112.144 I-1.131 J1.156 E.01928
; CHANGE_LAYER
; Z_HEIGHT: 10
; LAYER_HEIGHT: 0.116667
; WIPE_START
G1 F24000
G1 X125.437 Y112.166 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 85/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L85
M991 S0 P84 ;notify layer change
G17
G3 Z10.283 I-1.183 J.284 P1  F30000
G1 X126.52 Y116.674 Z10.283
G1 Z10
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1622
G1 X126.52 Y123.174 E.21562
G1 X123.724 Y123.174 E.09274
G1 X123.724 Y113.379 E.32495
G1 X139.52 Y113.379 E.52398
G1 X139.52 Y123.174 E.32495
G1 X133.724 Y123.174 E.19226
G1 X133.724 Y116.674 E.21562
G1 X126.58 Y116.674 E.23698
G1 X126.912 Y117.067 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1622
G1 X126.912 Y123.567 E.19973
G1 X123.332 Y123.567 E.11
G1 X123.332 Y112.987 E.32509
G1 X139.912 Y112.987 E.50946
G1 X139.912 Y123.567 E.32509
G1 X133.332 Y123.567 E.20219
G1 X133.332 Y117.067 E.19973
G1 X126.972 Y117.067 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X126.954 Y119.066 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.4 I.774 J-.939 P1  F30000
G1 X126.172 Y118.423 Z10.4
G1 Z10
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1622
G1 X126.172 Y120.051 E.05401
G1 X124.073 Y122.15 E.09848
G1 X124.073 Y120.403 E.05796
G1 X126.172 Y122.502 E.09848
G1 X126.172 Y122.826 E.01075
G1 X124.868 Y122.826 E.04327
G1 X124.073 Y116.103 F30000
G1 F1622
G1 X124.073 Y114.474 E.05401
G1 X124.82 Y113.727 E.03506
G1 X125.073 Y113.727 E.00838
G1 X127.672 Y116.326 E.12194
G1 X129.897 Y116.326 E.0738
G1 X132.496 Y113.727 E.12194
G1 X132.748 Y113.727 E.00838
G1 X139.172 Y120.15 E.30133
G1 X139.172 Y122.403 E.07472
G1 X138.748 Y122.826 E.01986
G1 X134.172 Y122.826 E.15182
G1 X134.073 Y122.727 E.00466
G1 X134.073 Y119.826 E.09622
G1 X139.172 Y114.727 E.23922
G1 X139.172 Y113.727 E.03317
G1 X138.544 Y113.727 E.02084
; CHANGE_LAYER
; Z_HEIGHT: 10.16
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F24000
G1 X139.172 Y113.727 E-.23876
G1 X139.172 Y114.727 E-.38
G1 X138.909 Y114.99 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 86/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L86
M991 S0 P85 ;notify layer change
G17
G3 Z10.4 I1.163 J-.357 P1  F30000
G1 X137.957 Y111.889 Z10.4
G1 Z10.16
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.276667
G1 F1619
G3 X137.348 Y109.16 I-.614 J-1.295 E.209
G1 X137.437 Y109.163 E.00362
G3 X138.01 Y111.862 I-.093 J1.43 E.15105
; WIPE_START
G1 F24000
G1 X137.356 Y112.028 E-.2564
G1 X136.752 Y111.89 E-.23545
G1 X136.321 Y111.574 E-.20336
G1 X136.23 Y111.429 E-.06479
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.56 I-.106 J-1.212 P1  F30000
G1 X127.438 Y112.196 Z10.56
G1 Z10.16
G1 E.8 F1800
G1 F1619
G1 X122.807 Y112.196 E.18827
G3 X124.088 Y111.4 I1.284 J.637 E.06458
G2 X124.102 Y111.019 I-.228 J-.199 E.01678
G3 X125.536 Y109.15 I1.352 J-.447 E.11277
G3 X126.649 Y111.348 I-.106 J1.435 E.12028
G2 X126.998 Y111.671 I.567 J-.262 E.01982
G3 X127.41 Y112.144 I-.904 J1.205 E.0257
; CHANGE_LAYER
; Z_HEIGHT: 10.2
; LAYER_HEIGHT: 0.04
; WIPE_START
G1 F24000
G1 X125.41 Y112.167 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 87/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L87
M991 S0 P86 ;notify layer change
G17
G3 Z10.56 I-1.182 J.291 P1  F30000
G1 X126.52 Y116.674 Z10.56
G1 Z10.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1619
G1 X126.52 Y123.174 E.21562
G1 X123.724 Y123.174 E.09274
G1 X123.724 Y113.379 E.32495
G1 X139.52 Y113.379 E.52398
G1 X139.52 Y123.174 E.32495
G1 X133.724 Y123.174 E.19226
G1 X133.724 Y116.674 E.21562
G1 X126.58 Y116.674 E.23698
M73 P67 R6
G1 X126.912 Y117.067 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1619
G1 X126.912 Y123.567 E.19973
G1 X123.332 Y123.567 E.11
G1 X123.332 Y112.987 E.32509
G1 X139.912 Y112.987 E.50946
G1 X139.912 Y123.567 E.32509
G1 X133.332 Y123.567 E.20219
G1 X133.332 Y117.067 E.19973
G1 X126.972 Y117.067 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X126.954 Y119.066 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.6 I.774 J-.939 P1  F30000
G1 X126.172 Y118.423 Z10.6
G1 Z10.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1619
G1 X126.172 Y120.051 E.05401
G1 X124.073 Y122.15 E.09848
G1 X124.073 Y120.403 E.05796
G1 X126.172 Y122.502 E.09848
G1 X126.172 Y122.826 E.01075
G1 X124.868 Y122.826 E.04327
G1 X124.073 Y116.103 F30000
G1 F1619
G1 X124.073 Y114.474 E.05401
G1 X124.82 Y113.727 E.03506
G1 X125.073 Y113.727 E.00838
G1 X127.672 Y116.326 E.12194
G1 X129.897 Y116.326 E.0738
G1 X132.496 Y113.727 E.12194
G1 X132.748 Y113.727 E.00838
G1 X139.172 Y120.15 E.30133
G1 X139.172 Y122.403 E.07472
G1 X138.748 Y122.826 E.01986
G1 X134.172 Y122.826 E.15182
G1 X134.073 Y122.727 E.00466
G1 X134.073 Y119.826 E.09622
G1 X139.172 Y114.727 E.23922
G1 X139.172 Y113.727 E.03317
G1 X138.544 Y113.727 E.02084
; CHANGE_LAYER
; Z_HEIGHT: 10.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X139.172 Y113.727 E-.23876
G1 X139.172 Y114.727 E-.38
G1 X138.909 Y114.99 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 88/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L88
M991 S0 P87 ;notify layer change
G17
G3 Z10.6 I-.164 J-1.206 P1  F30000
G1 X126.52 Y116.674 Z10.6
G1 Z10.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1414
G1 X126.52 Y123.174 E.21562
G1 X123.724 Y123.174 E.09274
G1 X123.724 Y113.379 E.32495
G1 X139.52 Y113.379 E.52398
G1 X139.52 Y123.174 E.32495
G1 X133.724 Y123.174 E.19226
G1 X133.724 Y116.674 E.21562
G1 X126.58 Y116.674 E.23698
G1 X126.912 Y117.067 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1414
G1 X126.912 Y123.567 E.19973
G1 X123.332 Y123.567 E.11
G1 X123.332 Y112.987 E.32509
G1 X139.912 Y112.987 E.50946
G1 X139.912 Y123.567 E.32509
G1 X133.332 Y123.567 E.20219
G1 X133.332 Y117.067 E.19973
G1 X126.972 Y117.067 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X126.954 Y119.066 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.8 I.774 J-.939 P1  F30000
G1 X126.172 Y118.423 Z10.8
G1 Z10.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1414
G1 X126.172 Y120.051 E.05401
G1 X124.073 Y122.15 E.09848
G1 X124.073 Y120.403 E.05796
G1 X126.172 Y122.502 E.09848
G1 X126.172 Y122.826 E.01075
G1 X124.868 Y122.826 E.04327
G1 X124.073 Y116.103 F30000
G1 F1414
G1 X124.073 Y114.474 E.05401
G1 X124.82 Y113.727 E.03506
G1 X125.073 Y113.727 E.00838
G1 X127.672 Y116.326 E.12194
G1 X129.897 Y116.326 E.0738
G1 X132.496 Y113.727 E.12194
G1 X132.748 Y113.727 E.00838
G1 X139.172 Y120.15 E.30133
G1 X139.172 Y122.403 E.07472
G1 X138.748 Y122.826 E.01986
G1 X134.172 Y122.826 E.15182
G1 X134.073 Y122.727 E.00466
G1 X134.073 Y119.826 E.09622
G1 X139.172 Y114.727 E.23922
G1 X139.172 Y113.727 E.03317
G1 X138.544 Y113.727 E.02084
; CHANGE_LAYER
; Z_HEIGHT: 10.4367
; LAYER_HEIGHT: 0.0366669
; WIPE_START
G1 F24000
G1 X139.172 Y113.727 E-.23876
G1 X139.172 Y114.727 E-.38
G1 X138.909 Y114.99 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 89/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L89
M991 S0 P88 ;notify layer change
G17
G3 Z10.8 I1.163 J-.359 P1  F30000
G1 X137.958 Y111.91 Z10.8
G1 Z10.437
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.276667
G1 F1616
G3 X137.359 Y109.229 I-.604 J-1.273 E.20548
G1 X137.446 Y109.232 E.00356
G3 X138.011 Y111.884 I-.092 J1.406 E.14837
; WIPE_START
M73 P68 R6
G1 F24000
G1 X137.368 Y112.048 E-.25234
G1 X136.774 Y111.912 E-.2315
G1 X136.35 Y111.601 E-.19999
G1 X136.243 Y111.431 E-.07618
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.837 I-.105 J-1.212 P1  F30000
G1 X127.411 Y112.196 Z10.837
G1 Z10.437
G1 E.8 F1800
G1 F1616
G1 X122.834 Y112.196 E.18606
G3 X124.116 Y111.424 I1.259 J.639 E.06415
G2 X124.108 Y110.965 I-.371 J-.223 E.01964
G3 X125.542 Y109.214 I1.356 J-.353 E.10712
G3 X126.64 Y111.37 I-.104 J1.41 E.11804
G2 X126.983 Y111.691 I.558 J-.254 E.0196
G3 X127.383 Y112.144 I-.889 J1.185 E.02473
; CHANGE_LAYER
; Z_HEIGHT: 10.6
; LAYER_HEIGHT: 0.163334
; WIPE_START
G1 F24000
G1 X125.383 Y112.167 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 90/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L90
M991 S0 P89 ;notify layer change
G17
G3 Z10.837 I-1.18 J.298 P1  F30000
G1 X126.52 Y116.674 Z10.837
G1 Z10.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1616
G1 X126.52 Y123.174 E.21562
G1 X123.724 Y123.174 E.09274
G1 X123.724 Y113.379 E.32495
G1 X139.52 Y113.379 E.52398
G1 X139.52 Y123.174 E.32495
G1 X133.724 Y123.174 E.19226
G1 X133.724 Y116.674 E.21562
G1 X126.58 Y116.674 E.23698
G1 X126.912 Y117.067 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1616
G1 X126.912 Y123.567 E.19973
G1 X123.332 Y123.567 E.11
G1 X123.332 Y112.987 E.32509
G1 X139.912 Y112.987 E.50946
G1 X139.912 Y123.567 E.32509
G1 X133.332 Y123.567 E.20219
G1 X133.332 Y117.067 E.19973
G1 X126.972 Y117.067 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X126.954 Y119.066 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11 I.774 J-.939 P1  F30000
G1 X126.172 Y118.423 Z11
G1 Z10.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1616
G1 X126.172 Y120.051 E.05401
G1 X124.073 Y122.15 E.09848
G1 X124.073 Y120.403 E.05796
G1 X126.172 Y122.502 E.09848
G1 X126.172 Y122.826 E.01075
G1 X124.868 Y122.826 E.04327
G1 X124.073 Y116.103 F30000
G1 F1616
G1 X124.073 Y114.474 E.05401
G1 X124.82 Y113.727 E.03506
G1 X125.073 Y113.727 E.00838
G1 X127.672 Y116.326 E.12194
G1 X129.897 Y116.326 E.0738
G1 X132.496 Y113.727 E.12194
G1 X132.748 Y113.727 E.00838
G1 X139.172 Y120.15 E.30133
G1 X139.172 Y122.403 E.07472
G1 X138.748 Y122.826 E.01986
G1 X134.172 Y122.826 E.15182
G1 X134.073 Y122.727 E.00466
G1 X134.073 Y119.826 E.09622
G1 X139.172 Y114.727 E.23922
G1 X139.172 Y113.727 E.03317
G1 X138.544 Y113.727 E.02084
; CHANGE_LAYER
; Z_HEIGHT: 10.7133
; LAYER_HEIGHT: 0.113333
; WIPE_START
G1 F24000
G1 X139.172 Y113.727 E-.23876
G1 X139.172 Y114.727 E-.38
G1 X138.909 Y114.99 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 91/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L91
M991 S0 P90 ;notify layer change
G17
G3 Z11 I1.162 J-.361 P1  F30000
G1 X137.96 Y111.931 Z11
G1 Z10.713
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.276667
G1 F1613
G3 X137.37 Y109.297 I-.595 J-1.25 E.20199
G1 X137.456 Y109.3 E.0035
G3 X138.013 Y111.904 I-.091 J1.381 E.14569
; WIPE_START
G1 F24000
G1 X137.38 Y112.067 E-.24828
G1 X136.797 Y111.933 E-.22756
G1 X136.38 Y111.627 E-.19661
G1 X136.257 Y111.432 E-.08755
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.113 I-.104 J-1.212 P1  F30000
G1 X127.383 Y112.196 Z11.113
G1 Z10.713
G1 E.8 F1800
G1 F1613
G1 X122.861 Y112.196 E.18385
G3 X124.146 Y111.447 I1.236 J.643 E.06378
G2 X124.141 Y110.997 I-.357 J-.221 E.01932
G3 X125.55 Y109.277 I1.331 J-.347 E.10524
G3 X126.631 Y111.393 I-.102 J1.386 E.11586
G2 X126.969 Y111.71 I.548 J-.245 E.01938
G3 X127.355 Y112.145 I-.875 J1.166 E.02376
; CHANGE_LAYER
; Z_HEIGHT: 10.8
; LAYER_HEIGHT: 0.0866671
; WIPE_START
G1 F24000
G1 X125.355 Y112.168 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 92/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L92
M991 S0 P91 ;notify layer change
G17
G3 Z11.113 I-1.178 J.305 P1  F30000
G1 X126.52 Y116.674 Z11.113
G1 Z10.8
M73 P69 R6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1613
G1 X126.52 Y123.174 E.21562
G1 X123.724 Y123.174 E.09274
G1 X123.724 Y113.379 E.32495
G1 X139.52 Y113.379 E.52398
G1 X139.52 Y123.174 E.32495
G1 X133.724 Y123.174 E.19226
G1 X133.724 Y116.674 E.21562
G1 X126.58 Y116.674 E.23698
G1 X126.912 Y117.067 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1613
G1 X126.912 Y123.567 E.19973
G1 X123.332 Y123.567 E.11
G1 X123.332 Y112.987 E.32509
G1 X139.912 Y112.987 E.50946
G1 X139.912 Y123.567 E.32509
G1 X133.332 Y123.567 E.20219
G1 X133.332 Y117.067 E.19973
G1 X126.972 Y117.067 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X126.954 Y119.066 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.2 I.774 J-.939 P1  F30000
G1 X126.172 Y118.423 Z11.2
G1 Z10.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1613
G1 X126.172 Y120.051 E.05401
G1 X124.073 Y122.15 E.09848
G1 X124.073 Y120.403 E.05796
G1 X126.172 Y122.502 E.09848
G1 X126.172 Y122.826 E.01075
G1 X124.868 Y122.826 E.04327
G1 X124.073 Y116.103 F30000
G1 F1613
G1 X124.073 Y114.474 E.05401
G1 X124.82 Y113.727 E.03506
G1 X125.073 Y113.727 E.00838
G1 X127.672 Y116.326 E.12194
G1 X129.897 Y116.326 E.0738
G1 X132.496 Y113.727 E.12194
G1 X132.748 Y113.727 E.00838
G1 X139.172 Y120.15 E.30133
G1 X139.172 Y122.403 E.07472
G1 X138.748 Y122.826 E.01986
G1 X134.172 Y122.826 E.15182
G1 X134.073 Y122.727 E.00466
G1 X134.073 Y119.826 E.09622
G1 X139.172 Y114.727 E.23922
G1 X139.172 Y113.727 E.03317
G1 X138.544 Y113.727 E.02084
; CHANGE_LAYER
; Z_HEIGHT: 10.99
; LAYER_HEIGHT: 0.19
; WIPE_START
G1 F24000
G1 X139.172 Y113.727 E-.23876
G1 X139.172 Y114.727 E-.38
G1 X138.909 Y114.99 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 93/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L93
M991 S0 P92 ;notify layer change
G17
G3 Z11.2 I1.162 J-.362 P1  F30000
G1 X137.963 Y111.952 Z11.2
G1 Z10.99
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.276667
G1 F1611
G3 X137.383 Y109.364 I-.585 J-1.228 E.19851
G1 X137.468 Y109.367 E.00344
G3 X138.017 Y111.925 I-.09 J1.357 E.14303
; WIPE_START
G1 F24000
G1 X137.394 Y112.086 E-.24423
G1 X136.821 Y111.954 E-.22363
G1 X136.411 Y111.653 E-.19325
G1 X136.272 Y111.433 E-.0989
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.39 I-.104 J-1.213 P1  F30000
G1 X127.356 Y112.196 Z11.39
G1 Z10.99
G1 E.8 F1800
G1 F1611
G1 X122.888 Y112.196 E.18164
G3 X124.177 Y111.47 I1.214 J.648 E.06348
G2 X124.175 Y111.027 I-.345 J-.22 E.01902
G3 X125.558 Y109.338 I1.307 J-.341 E.10337
G3 X126.622 Y111.415 I-.1 J1.362 E.11375
G2 X126.955 Y111.73 I.538 J-.236 E.01914
G3 X127.327 Y112.145 I-.863 J1.149 E.0228
; CHANGE_LAYER
; Z_HEIGHT: 11
; LAYER_HEIGHT: 0.0100002
; WIPE_START
G1 F24000
G1 X125.327 Y112.168 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 94/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L94
M991 S0 P93 ;notify layer change
G17
G3 Z11.39 I-1.176 J.311 P1  F30000
G1 X126.52 Y116.674 Z11.39
G1 Z11
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1611
G1 X126.52 Y123.174 E.21562
G1 X123.724 Y123.174 E.09274
G1 X123.724 Y113.379 E.32495
G1 X139.52 Y113.379 E.52398
G1 X139.52 Y123.174 E.32495
G1 X133.724 Y123.174 E.19226
G1 X133.724 Y116.674 E.21562
G1 X126.58 Y116.674 E.23698
G1 X126.912 Y117.067 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1611
G1 X126.912 Y123.567 E.19973
G1 X123.332 Y123.567 E.11
G1 X123.332 Y112.987 E.32509
G1 X139.912 Y112.987 E.50946
G1 X139.912 Y123.567 E.32509
G1 X133.332 Y123.567 E.20219
G1 X133.332 Y117.067 E.19973
G1 X126.972 Y117.067 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X126.954 Y119.066 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.4 I.774 J-.939 P1  F30000
G1 X126.172 Y118.423 Z11.4
G1 Z11
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1611
G1 X126.172 Y120.051 E.05401
G1 X124.073 Y122.15 E.09848
G1 X124.073 Y120.403 E.05796
G1 X126.172 Y122.502 E.09848
G1 X126.172 Y122.826 E.01075
G1 X124.868 Y122.826 E.04327
G1 X124.073 Y116.103 F30000
G1 F1611
G1 X124.073 Y114.474 E.05401
G1 X124.82 Y113.727 E.03506
G1 X125.073 Y113.727 E.00838
G1 X127.672 Y116.326 E.12194
G1 X129.897 Y116.326 E.0738
G1 X132.496 Y113.727 E.12194
G1 X132.748 Y113.727 E.00838
G1 X139.172 Y120.15 E.30133
G1 X139.172 Y122.403 E.07472
G1 X138.748 Y122.826 E.01986
G1 X134.172 Y122.826 E.15182
G1 X134.073 Y122.727 E.00466
G1 X134.073 Y119.826 E.09622
G1 X139.172 Y114.727 E.23922
G1 X139.172 Y113.727 E.03317
G1 X138.544 Y113.727 E.02084
; CHANGE_LAYER
; Z_HEIGHT: 11.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X139.172 Y113.727 E-.23876
G1 X139.172 Y114.727 E-.38
G1 X138.909 Y114.99 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 95/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L95
M991 S0 P94 ;notify layer change
G17
M73 P70 R6
G3 Z11.4 I-.164 J-1.206 P1  F30000
G1 X126.52 Y116.674 Z11.4
G1 Z11.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1414
G1 X126.52 Y123.174 E.21562
G1 X123.724 Y123.174 E.09274
G1 X123.724 Y113.379 E.32495
G1 X139.52 Y113.379 E.52398
G1 X139.52 Y123.174 E.32495
G1 X133.724 Y123.174 E.19226
G1 X133.724 Y116.674 E.21562
G1 X126.58 Y116.674 E.23698
G1 X126.912 Y117.067 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1414
G1 X126.912 Y123.567 E.19973
G1 X123.332 Y123.567 E.11
G1 X123.332 Y112.987 E.32509
G1 X139.912 Y112.987 E.50946
G1 X139.912 Y123.567 E.32509
G1 X133.332 Y123.567 E.20219
G1 X133.332 Y117.067 E.19973
G1 X126.972 Y117.067 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X126.954 Y119.066 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.6 I.774 J-.939 P1  F30000
G1 X126.172 Y118.423 Z11.6
G1 Z11.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1414
G1 X126.172 Y120.051 E.05401
G1 X124.073 Y122.15 E.09848
G1 X124.073 Y120.403 E.05796
G1 X126.172 Y122.502 E.09848
G1 X126.172 Y122.826 E.01075
G1 X124.868 Y122.826 E.04327
G1 X124.073 Y116.103 F30000
G1 F1414
G1 X124.073 Y114.474 E.05401
G1 X124.82 Y113.727 E.03506
G1 X125.073 Y113.727 E.00838
G1 X127.672 Y116.326 E.12194
G1 X129.897 Y116.326 E.0738
G1 X132.496 Y113.727 E.12194
G1 X132.748 Y113.727 E.00838
G1 X139.172 Y120.15 E.30133
G1 X139.172 Y122.403 E.07472
G1 X138.748 Y122.826 E.01986
G1 X134.172 Y122.826 E.15182
G1 X134.073 Y122.727 E.00466
G1 X134.073 Y119.826 E.09622
G1 X139.172 Y114.727 E.23922
G1 X139.172 Y113.727 E.03317
G1 X138.544 Y113.727 E.02084
; CHANGE_LAYER
; Z_HEIGHT: 11.2667
; LAYER_HEIGHT: 0.0666666
; WIPE_START
G1 F24000
G1 X139.172 Y113.727 E-.23876
G1 X139.172 Y114.727 E-.38
G1 X138.909 Y114.99 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 96/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L96
M991 S0 P95 ;notify layer change
G17
G3 Z11.6 I1.162 J-.362 P1  F30000
M73 P70 R5
G1 X137.968 Y111.973 Z11.6
G1 Z11.267
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.276667
G1 F1608
G3 X137.397 Y109.432 I-.576 J-1.205 E.19505
G1 X137.48 Y109.435 E.00338
G3 X138.021 Y111.946 I-.089 J1.333 E.14037
; WIPE_START
G1 F24000
G1 X137.409 Y112.105 E-.24017
G1 X136.846 Y111.976 E-.21969
G1 X136.443 Y111.68 E-.1899
G1 X136.288 Y111.434 E-.11024
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.667 I-.103 J-1.213 P1  F30000
M73 P71 R5
G1 X127.329 Y112.196 Z11.667
G1 Z11.267
G1 E.8 F1800
G1 F1608
G1 X122.922 Y112.182 E.17914
G3 X124.202 Y111.501 I1.169 J.655 E.06225
G2 X124.233 Y111.138 I-.185 J-.199 E.01626
G3 X125.568 Y109.399 I1.256 J-.418 E.105
G3 X126.614 Y111.448 I-.105 J1.345 E.11198
G2 X127.006 Y111.801 I.875 J-.579 E.02169
G3 X127.3 Y112.145 I-.861 J1.032 E.01847
; CHANGE_LAYER
; Z_HEIGHT: 11.4
; LAYER_HEIGHT: 0.133333
; WIPE_START
G1 F24000
G1 X125.3 Y112.162 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 97/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L97
M991 S0 P96 ;notify layer change
G17
G3 Z11.667 I-1.175 J.318 P1  F30000
G1 X126.52 Y116.674 Z11.667
G1 Z11.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1608
G1 X126.52 Y123.174 E.21562
G1 X123.724 Y123.174 E.09274
G1 X123.724 Y113.379 E.32495
G1 X139.52 Y113.379 E.52398
G1 X139.52 Y123.174 E.32495
G1 X133.724 Y123.174 E.19226
G1 X133.724 Y116.674 E.21562
G1 X126.58 Y116.674 E.23698
G1 X126.912 Y117.067 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1608
G1 X126.912 Y123.567 E.19973
G1 X123.332 Y123.567 E.11
G1 X123.332 Y112.987 E.32509
G1 X139.912 Y112.987 E.50946
G1 X139.912 Y123.567 E.32509
G1 X133.332 Y123.567 E.20219
G1 X133.332 Y117.067 E.19973
G1 X126.972 Y117.067 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X126.954 Y119.066 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.8 I.774 J-.939 P1  F30000
G1 X126.172 Y118.423 Z11.8
G1 Z11.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1608
G1 X126.172 Y120.051 E.05401
G1 X124.073 Y122.15 E.09848
G1 X124.073 Y120.403 E.05796
G1 X126.172 Y122.502 E.09848
G1 X126.172 Y122.826 E.01075
G1 X124.868 Y122.826 E.04327
G1 X124.073 Y116.103 F30000
G1 F1608
G1 X124.073 Y114.474 E.05401
G1 X124.82 Y113.727 E.03506
G1 X125.073 Y113.727 E.00838
G1 X127.672 Y116.326 E.12194
G1 X129.897 Y116.326 E.0738
G1 X132.496 Y113.727 E.12194
G1 X132.748 Y113.727 E.00838
G1 X139.172 Y120.15 E.30133
G1 X139.172 Y122.403 E.07472
G1 X138.748 Y122.826 E.01986
G1 X134.172 Y122.826 E.15182
G1 X134.073 Y122.727 E.00466
G1 X134.073 Y119.826 E.09622
G1 X139.172 Y114.727 E.23922
G1 X139.172 Y113.727 E.03317
G1 X138.544 Y113.727 E.02084
; CHANGE_LAYER
; Z_HEIGHT: 11.5433
; LAYER_HEIGHT: 0.143333
; WIPE_START
G1 F24000
G1 X139.172 Y113.727 E-.23876
G1 X139.172 Y114.727 E-.38
G1 X138.909 Y114.99 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 98/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L98
M991 S0 P97 ;notify layer change
G17
G3 Z11.8 I1.162 J-.363 P1  F30000
G1 X137.973 Y111.994 Z11.8
G1 Z11.543
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.276667
G1 F1605
G3 X137.412 Y109.499 I-.567 J-1.183 E.1916
G1 X137.494 Y109.502 E.00332
G3 X138.026 Y111.967 I-.087 J1.309 E.13772
; WIPE_START
G1 F24000
G1 X137.425 Y112.124 E-.2361
G1 X136.872 Y111.997 E-.21577
G1 X136.476 Y111.706 E-.18657
G1 X136.305 Y111.436 E-.12156
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.943 I-.102 J-1.213 P1  F30000
G1 X127.302 Y112.196 Z11.943
G1 Z11.543
G1 E.8 F1800
G1 F1605
G1 X122.944 Y112.194 E.17718
G3 X124.236 Y111.526 I1.153 J.648 E.06262
G1 X124.348 Y111.363 E.00806
G3 X125.578 Y109.459 I1.155 J-.603 E.11175
G3 X126.606 Y111.471 I-.103 J1.321 E.10996
G2 X126.991 Y111.819 I.847 J-.549 E.02134
G3 X127.272 Y112.145 I-.854 J1.021 E.01757
; CHANGE_LAYER
; Z_HEIGHT: 11.6
; LAYER_HEIGHT: 0.0566673
; WIPE_START
G1 F24000
G1 X125.272 Y112.167 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 99/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L99
M991 S0 P98 ;notify layer change
G17
G3 Z11.943 I-1.173 J.325 P1  F30000
G1 X126.52 Y116.674 Z11.943
G1 Z11.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1605
G1 X126.52 Y123.174 E.21562
G1 X123.724 Y123.174 E.09274
G1 X123.724 Y113.379 E.32495
G1 X139.52 Y113.379 E.52398
G1 X139.52 Y123.174 E.32495
G1 X133.724 Y123.174 E.19226
G1 X133.724 Y116.674 E.21562
G1 X126.58 Y116.674 E.23698
G1 X126.912 Y117.067 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1605
G1 X126.912 Y123.567 E.19973
G1 X123.332 Y123.567 E.11
G1 X123.332 Y112.987 E.32509
G1 X139.912 Y112.987 E.50946
G1 X139.912 Y123.567 E.32509
G1 X133.332 Y123.567 E.20219
G1 X133.332 Y117.067 E.19973
G1 X126.972 Y117.067 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X126.954 Y119.066 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12 I.774 J-.939 P1  F30000
G1 X126.172 Y118.423 Z12
G1 Z11.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1605
G1 X126.172 Y120.051 E.05401
G1 X124.073 Y122.15 E.09848
G1 X124.073 Y120.403 E.05796
G1 X126.172 Y122.502 E.09848
G1 X126.172 Y122.826 E.01075
G1 X124.868 Y122.826 E.04327
G1 X124.073 Y116.103 F30000
G1 F1605
G1 X124.073 Y114.474 E.05401
G1 X124.82 Y113.727 E.03506
G1 X125.073 Y113.727 E.00838
G1 X127.672 Y116.326 E.12194
G1 X129.897 Y116.326 E.0738
G1 X132.496 Y113.727 E.12194
G1 X132.748 Y113.727 E.00838
G1 X139.172 Y120.15 E.30133
M73 P72 R5
G1 X139.172 Y122.403 E.07472
G1 X138.748 Y122.826 E.01986
G1 X134.172 Y122.826 E.15182
G1 X134.073 Y122.727 E.00466
G1 X134.073 Y119.826 E.09622
G1 X139.172 Y114.727 E.23922
G1 X139.172 Y113.727 E.03317
G1 X138.544 Y113.727 E.02084
; CHANGE_LAYER
; Z_HEIGHT: 11.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X139.172 Y113.727 E-.23876
G1 X139.172 Y114.727 E-.38
G1 X138.909 Y114.99 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 100/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L100
M991 S0 P99 ;notify layer change
G17
G3 Z12 I-.164 J-1.206 P1  F30000
G1 X126.52 Y116.674 Z12
G1 Z11.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1414
G1 X126.52 Y123.174 E.21562
G1 X123.724 Y123.174 E.09274
G1 X123.724 Y113.379 E.32495
G1 X139.52 Y113.379 E.52398
G1 X139.52 Y123.174 E.32495
G1 X133.724 Y123.174 E.19226
G1 X133.724 Y116.674 E.21562
G1 X126.58 Y116.674 E.23698
G1 X126.912 Y117.067 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1414
G1 X126.912 Y123.567 E.19973
G1 X123.332 Y123.567 E.11
G1 X123.332 Y112.987 E.32509
G1 X139.912 Y112.987 E.50946
G1 X139.912 Y123.567 E.32509
G1 X133.332 Y123.567 E.20219
G1 X133.332 Y117.067 E.19973
G1 X126.972 Y117.067 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X126.954 Y119.066 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.2 I.774 J-.939 P1  F30000
G1 X126.172 Y118.423 Z12.2
G1 Z11.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1414
G1 X126.172 Y120.051 E.05401
G1 X124.073 Y122.15 E.09848
G1 X124.073 Y120.403 E.05796
G1 X126.172 Y122.502 E.09848
G1 X126.172 Y122.826 E.01075
G1 X124.868 Y122.826 E.04327
G1 X124.073 Y116.103 F30000
G1 F1414
G1 X124.073 Y114.474 E.05401
G1 X124.82 Y113.727 E.03506
G1 X125.073 Y113.727 E.00838
G1 X127.672 Y116.326 E.12194
G1 X129.897 Y116.326 E.0738
G1 X132.496 Y113.727 E.12194
G1 X132.748 Y113.727 E.00838
G1 X139.172 Y120.15 E.30133
G1 X139.172 Y122.403 E.07472
G1 X138.748 Y122.826 E.01986
G1 X134.172 Y122.826 E.15182
G1 X134.073 Y122.727 E.00466
G1 X134.073 Y119.826 E.09622
G1 X139.172 Y114.727 E.23922
G1 X139.172 Y113.727 E.03317
G1 X138.544 Y113.727 E.02084
; CHANGE_LAYER
; Z_HEIGHT: 11.82
; LAYER_HEIGHT: 0.0199995
; WIPE_START
G1 F24000
G1 X139.172 Y113.727 E-.23876
G1 X139.172 Y114.727 E-.38
G1 X138.909 Y114.99 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 101/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L101
M991 S0 P100 ;notify layer change
G17
G3 Z12.2 I1.162 J-.363 P1  F30000
G1 X137.98 Y112.016 Z12.2
G1 Z11.82
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.276667
G1 F1603
G3 X137.429 Y109.567 I-.558 J-1.161 E.18817
G1 X137.509 Y109.57 E.00325
G3 X138.033 Y111.989 I-.086 J1.285 E.13509
; WIPE_START
G1 F24000
G1 X137.443 Y112.144 E-.23205
G1 X136.899 Y112.019 E-.21184
G1 X136.511 Y111.734 E-.18324
M73 P73 R5
G1 X136.324 Y111.438 E-.13287
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.22 I-.102 J-1.213 P1  F30000
G1 X127.274 Y112.196 Z12.22
G1 Z11.82
G1 E.8 F1800
G1 F1603
G1 X122.97 Y112.196 E.17496
G3 X124.264 Y111.558 I1.113 J.627 E.06233
G1 X124.385 Y111.392 E.00836
G3 X125.59 Y109.519 I1.13 J-.597 E.10991
G3 X126.599 Y111.495 I-.101 J1.297 E.10798
G2 X127.035 Y111.891 I1.042 J-.709 E.02418
G3 X127.244 Y112.145 I-.905 J.953 E.01339
; CHANGE_LAYER
; Z_HEIGHT: 12
; LAYER_HEIGHT: 0.18
; WIPE_START
G1 F24000
G1 X125.244 Y112.169 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 102/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L102
M991 S0 P101 ;notify layer change
G17
G3 Z12.22 I-1.171 J.332 P1  F30000
G1 X126.52 Y116.674 Z12.22
G1 Z12
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1603
G1 X126.52 Y123.174 E.21562
G1 X123.724 Y123.174 E.09274
G1 X123.724 Y113.379 E.32495
G1 X139.52 Y113.379 E.52398
G1 X139.52 Y123.174 E.32495
G1 X133.724 Y123.174 E.19226
G1 X133.724 Y116.674 E.21562
G1 X126.58 Y116.674 E.23698
G1 X126.912 Y117.067 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1603
G1 X126.912 Y123.567 E.19973
G1 X123.332 Y123.567 E.11
G1 X123.332 Y112.987 E.32509
G1 X139.912 Y112.987 E.50946
G1 X139.912 Y123.567 E.32509
G1 X133.332 Y123.567 E.20219
G1 X133.332 Y117.067 E.19973
G1 X126.972 Y117.067 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X126.954 Y119.066 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.4 I.774 J-.939 P1  F30000
G1 X126.172 Y118.423 Z12.4
G1 Z12
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1603
G1 X126.172 Y120.051 E.05401
G1 X124.073 Y122.15 E.09848
G1 X124.073 Y120.403 E.05796
G1 X126.172 Y122.502 E.09848
G1 X126.172 Y122.826 E.01075
G1 X124.868 Y122.826 E.04327
G1 X124.073 Y116.103 F30000
G1 F1603
G1 X124.073 Y114.474 E.05401
G1 X124.82 Y113.727 E.03506
G1 X125.073 Y113.727 E.00838
G1 X127.672 Y116.326 E.12194
G1 X129.897 Y116.326 E.0738
G1 X132.496 Y113.727 E.12194
G1 X132.748 Y113.727 E.00838
G1 X139.172 Y120.15 E.30133
G1 X139.172 Y122.403 E.07472
G1 X138.748 Y122.826 E.01986
G1 X134.172 Y122.826 E.15182
G1 X134.073 Y122.727 E.00466
G1 X134.073 Y119.826 E.09622
G1 X139.172 Y114.727 E.23922
G1 X139.172 Y113.727 E.03317
G1 X138.544 Y113.727 E.02084
; CHANGE_LAYER
; Z_HEIGHT: 12.0967
; LAYER_HEIGHT: 0.0966663
; WIPE_START
G1 F24000
G1 X139.172 Y113.727 E-.23876
G1 X139.172 Y114.727 E-.38
G1 X138.909 Y114.99 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 103/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L103
M991 S0 P102 ;notify layer change
G17
G3 Z12.4 I1.162 J-.362 P1  F30000
G1 X137.988 Y112.038 Z12.4
G1 Z12.097
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.276667
G1 F1600
G3 X137.446 Y109.636 I-.549 J-1.139 E.18476
G1 X137.525 Y109.638 E.00319
G3 X138.041 Y112.011 I-.085 J1.261 E.13246
; WIPE_START
G1 F24000
G1 X137.461 Y112.165 E-.22799
G1 X136.928 Y112.042 E-.20792
G1 X136.547 Y111.762 E-.17992
G1 X136.344 Y111.441 E-.14418
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.497 I-.101 J-1.213 P1  F30000
G1 X127.246 Y112.196 Z12.497
G1 Z12.097
G1 E.8 F1800
G1 F1600
G1 X122.998 Y112.196 E.17267
G3 X124.302 Y111.586 I1.09 J.631 E.0623
G1 X124.423 Y111.42 E.00836
G3 X125.603 Y109.578 I1.106 J-.59 E.10802
G3 X126.593 Y111.519 I-.099 J1.273 E.10604
G2 X127.074 Y111.964 I1.267 J-.887 E.02685
G3 X127.214 Y112.146 I-1.267 J1.116 E.00932
; CHANGE_LAYER
; Z_HEIGHT: 12.2
; LAYER_HEIGHT: 0.103333
; WIPE_START
G1 F24000
G1 X125.214 Y112.17 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 104/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L104
M991 S0 P103 ;notify layer change
G17
G3 Z12.497 I-1.169 J.339 P1  F30000
G1 X126.52 Y116.674 Z12.497
G1 Z12.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1600
G1 X126.52 Y123.174 E.21562
G1 X123.724 Y123.174 E.09274
G1 X123.724 Y113.379 E.32495
G1 X139.52 Y113.379 E.52398
G1 X139.52 Y123.174 E.32495
G1 X133.724 Y123.174 E.19226
G1 X133.724 Y116.674 E.21562
G1 X126.58 Y116.674 E.23698
G1 X126.912 Y117.067 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1600
G1 X126.912 Y123.567 E.19973
G1 X123.332 Y123.567 E.11
G1 X123.332 Y112.987 E.32509
G1 X139.912 Y112.987 E.50946
G1 X139.912 Y123.567 E.32509
G1 X133.332 Y123.567 E.20219
G1 X133.332 Y117.067 E.19973
G1 X126.972 Y117.067 E.19543
M204 S10000
; WIPE_START
G1 F24000
M73 P74 R5
G1 X126.954 Y119.066 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.6 I.774 J-.939 P1  F30000
G1 X126.172 Y118.423 Z12.6
G1 Z12.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1600
G1 X126.172 Y120.051 E.05401
G1 X124.073 Y122.15 E.09848
G1 X124.073 Y120.403 E.05796
G1 X126.172 Y122.502 E.09848
G1 X126.172 Y122.826 E.01075
G1 X124.868 Y122.826 E.04327
G1 X124.073 Y116.103 F30000
G1 F1600
G1 X124.073 Y114.474 E.05401
G1 X124.82 Y113.727 E.03506
G1 X125.073 Y113.727 E.00838
G1 X127.672 Y116.326 E.12194
G1 X129.897 Y116.326 E.0738
G1 X132.496 Y113.727 E.12194
G1 X132.748 Y113.727 E.00838
G1 X139.172 Y120.15 E.30133
G1 X139.172 Y122.403 E.07472
G1 X138.748 Y122.826 E.01986
G1 X134.172 Y122.826 E.15182
G1 X134.073 Y122.727 E.00466
G1 X134.073 Y119.826 E.09622
G1 X139.172 Y114.727 E.23922
G1 X139.172 Y113.727 E.03317
G1 X138.544 Y113.727 E.02084
; CHANGE_LAYER
; Z_HEIGHT: 12.3733
; LAYER_HEIGHT: 0.173333
; WIPE_START
G1 F24000
G1 X139.172 Y113.727 E-.23876
G1 X139.172 Y114.727 E-.38
G1 X138.909 Y114.99 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 105/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L105
M991 S0 P104 ;notify layer change
G17
G3 Z12.6 I1.153 J-.39 P1  F30000
G1 X137.928 Y112.093 Z12.6
G1 Z12.373
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.276667
G1 F1598
G3 X137.465 Y109.705 I-.47 J-1.148 E.17826
G1 X137.542 Y109.708 E.00313
G3 X137.982 Y112.069 I-.084 J1.237 E.13295
; WIPE_START
G1 F24000
G1 X137.481 Y112.186 E-.19561
G1 X136.958 Y112.066 E-.204
G1 X136.584 Y111.79 E-.1766
G1 X136.335 Y111.396 E-.1774
G1 X136.331 Y111.379 E-.00639
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.773 I-.109 J-1.212 P1  F30000
G1 X127.218 Y112.196 Z12.773
G1 Z12.373
G1 E.8 F1800
G1 F1598
G1 X123.026 Y112.196 E.17039
G3 X124.341 Y111.614 I1.069 J.639 E.06232
G1 X124.462 Y111.448 E.00833
G3 X125.617 Y109.638 I1.083 J-.583 E.10618
G3 X126.588 Y111.543 I-.098 J1.25 E.10413
G2 X127.108 Y112.038 I1.524 J-1.08 E.02934
G3 X127.186 Y112.145 I-1.017 J.827 E.00541
; CHANGE_LAYER
; Z_HEIGHT: 12.4
; LAYER_HEIGHT: 0.0266666
; WIPE_START
G1 F24000
G1 X125.186 Y112.17 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 106/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L106
M991 S0 P105 ;notify layer change
G17
G3 Z12.773 I-1.167 J.346 P1  F30000
G1 X126.52 Y116.674 Z12.773
G1 Z12.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1598
G1 X126.52 Y123.174 E.21562
G1 X123.724 Y123.174 E.09274
G1 X123.724 Y113.379 E.32495
G1 X139.52 Y113.379 E.52398
G1 X139.52 Y123.174 E.32495
G1 X133.724 Y123.174 E.19226
G1 X133.724 Y116.674 E.21562
G1 X126.58 Y116.674 E.23698
G1 X126.912 Y117.067 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1598
G1 X126.912 Y123.567 E.19973
G1 X123.332 Y123.567 E.11
G1 X123.332 Y112.987 E.32509
G1 X139.912 Y112.987 E.50946
G1 X139.912 Y123.567 E.32509
G1 X133.332 Y123.567 E.20219
G1 X133.332 Y117.067 E.19973
G1 X126.972 Y117.067 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X126.954 Y119.066 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.8 I.774 J-.939 P1  F30000
G1 X126.172 Y118.423 Z12.8
G1 Z12.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1598
G1 X126.172 Y120.051 E.05401
G1 X124.073 Y122.15 E.09848
G1 X124.073 Y120.403 E.05796
G1 X126.172 Y122.502 E.09848
G1 X126.172 Y122.826 E.01075
G1 X124.868 Y122.826 E.04327
G1 X124.073 Y116.103 F30000
G1 F1598
G1 X124.073 Y114.474 E.05401
G1 X124.82 Y113.727 E.03506
G1 X125.073 Y113.727 E.00838
G1 X127.672 Y116.326 E.12194
G1 X129.897 Y116.326 E.0738
G1 X132.496 Y113.727 E.12194
G1 X132.748 Y113.727 E.00838
G1 X139.172 Y120.15 E.30133
G1 X139.172 Y122.403 E.07472
G1 X138.748 Y122.826 E.01986
G1 X134.172 Y122.826 E.15182
G1 X134.073 Y122.727 E.00466
G1 X134.073 Y119.826 E.09622
G1 X139.172 Y114.727 E.23922
G1 X139.172 Y113.727 E.03317
G1 X138.544 Y113.727 E.02084
; CHANGE_LAYER
; Z_HEIGHT: 12.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X139.172 Y113.727 E-.23876
G1 X139.172 Y114.727 E-.38
G1 X138.909 Y114.99 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 107/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L107
M991 S0 P106 ;notify layer change
G17
G3 Z12.8 I-.164 J-1.206 P1  F30000
G1 X126.52 Y116.674 Z12.8
G1 Z12.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1414
M73 P75 R5
G1 X126.52 Y123.174 E.21562
G1 X123.724 Y123.174 E.09274
G1 X123.724 Y113.379 E.32495
G1 X139.52 Y113.379 E.52398
G1 X139.52 Y123.174 E.32495
G1 X133.724 Y123.174 E.19226
G1 X133.724 Y116.674 E.21562
G1 X126.58 Y116.674 E.23698
G1 X126.912 Y117.067 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1414
G1 X126.912 Y123.567 E.19973
G1 X123.332 Y123.567 E.11
G1 X123.332 Y112.987 E.32509
G1 X139.912 Y112.987 E.50946
G1 X139.912 Y123.567 E.32509
G1 X133.332 Y123.567 E.20219
G1 X133.332 Y117.067 E.19973
G1 X126.972 Y117.067 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X126.954 Y119.066 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13 I.774 J-.939 P1  F30000
G1 X126.172 Y118.423 Z13
G1 Z12.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1414
G1 X126.172 Y120.051 E.05401
G1 X124.073 Y122.15 E.09848
G1 X124.073 Y120.403 E.05796
G1 X126.172 Y122.502 E.09848
G1 X126.172 Y122.826 E.01075
G1 X124.868 Y122.826 E.04327
G1 X124.073 Y116.103 F30000
G1 F1414
G1 X124.073 Y114.474 E.05401
G1 X124.82 Y113.727 E.03506
G1 X125.073 Y113.727 E.00838
G1 X127.672 Y116.326 E.12194
G1 X129.897 Y116.326 E.0738
G1 X132.496 Y113.727 E.12194
G1 X132.748 Y113.727 E.00838
G1 X139.172 Y120.15 E.30133
G1 X139.172 Y122.403 E.07472
G1 X138.748 Y122.826 E.01986
G1 X134.172 Y122.826 E.15182
G1 X134.073 Y122.727 E.00466
G1 X134.073 Y119.826 E.09622
G1 X139.172 Y114.727 E.23922
G1 X139.172 Y113.727 E.03317
G1 X138.544 Y113.727 E.02084
; CHANGE_LAYER
; Z_HEIGHT: 12.65
; LAYER_HEIGHT: 0.0499992
; WIPE_START
G1 F24000
G1 X139.172 Y113.727 E-.23876
G1 X139.172 Y114.727 E-.38
G1 X138.909 Y114.99 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 108/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L108
M991 S0 P107 ;notify layer change
G17
G3 Z13 I1.133 J-.444 P1  F30000
G1 X137.795 Y112.149 Z13
M73 P75 R4
G1 Z12.65
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.276667
G1 F1595
G3 X137.485 Y109.775 I-.317 J-1.166 E.1676
G1 X137.561 Y109.778 E.00307
G3 X137.852 Y112.132 I-.083 J1.205 E.13547
; WIPE_START
G1 F24000
G1 X137.335 Y112.196 E-.19791
G1 X136.922 Y112.056 E-.16587
G1 X136.572 Y111.763 E-.17349
G1 X136.351 Y111.361 E-.17415
G1 X136.335 Y111.234 E-.04858
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.05 I-.127 J-1.21 P1  F30000
G1 X127.19 Y112.196 Z13.05
G1 Z12.65
G1 E.8 F1800
G1 F1595
G1 X123.055 Y112.196 E.1681
G3 X124.376 Y111.651 I1.038 J.64 E.06208
G1 X124.506 Y111.482 E.00867
G3 X125.633 Y109.697 I1.055 J-.582 E.10457
G3 X126.584 Y111.559 I-.09 J1.22 E.10195
G2 X127.039 Y111.997 I1.053 J-.639 E.02597
G3 X127.156 Y112.147 I-1.346 J1.175 E.00773
; CHANGE_LAYER
; Z_HEIGHT: 12.8
; LAYER_HEIGHT: 0.150001
; WIPE_START
G1 F24000
G1 X125.156 Y112.171 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 109/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L109
M991 S0 P108 ;notify layer change
G17
G3 Z13.05 I-1.165 J.353 P1  F30000
G1 X126.52 Y116.674 Z13.05
G1 Z12.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1595
G1 X126.52 Y123.174 E.21562
G1 X123.724 Y123.174 E.09274
G1 X123.724 Y113.379 E.32495
G1 X139.52 Y113.379 E.52398
M73 P76 R4
G1 X139.52 Y123.174 E.32495
G1 X133.724 Y123.174 E.19226
G1 X133.724 Y116.674 E.21562
G1 X126.58 Y116.674 E.23698
G1 X126.912 Y117.067 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1595
G1 X126.912 Y123.567 E.19973
G1 X123.332 Y123.567 E.11
G1 X123.332 Y112.987 E.32509
G1 X139.912 Y112.987 E.50946
G1 X139.912 Y123.567 E.32509
G1 X133.332 Y123.567 E.20219
G1 X133.332 Y117.067 E.19973
G1 X126.972 Y117.067 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X126.954 Y119.066 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.2 I.774 J-.939 P1  F30000
G1 X126.172 Y118.423 Z13.2
G1 Z12.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1595
G1 X126.172 Y120.051 E.05401
G1 X124.073 Y122.15 E.09848
G1 X124.073 Y120.403 E.05796
G1 X126.172 Y122.502 E.09848
G1 X126.172 Y122.826 E.01075
G1 X124.868 Y122.826 E.04327
G1 X124.073 Y116.103 F30000
G1 F1595
G1 X124.073 Y114.474 E.05401
G1 X124.82 Y113.727 E.03506
G1 X125.073 Y113.727 E.00838
G1 X127.672 Y116.326 E.12194
G1 X129.897 Y116.326 E.0738
G1 X132.496 Y113.727 E.12194
G1 X132.748 Y113.727 E.00838
G1 X139.172 Y120.15 E.30133
G1 X139.172 Y122.403 E.07472
G1 X138.748 Y122.826 E.01986
G1 X134.172 Y122.826 E.15182
G1 X134.073 Y122.727 E.00466
G1 X134.073 Y119.826 E.09622
G1 X139.172 Y114.727 E.23922
G1 X139.172 Y113.727 E.03317
G1 X138.544 Y113.727 E.02084
; CHANGE_LAYER
; Z_HEIGHT: 12.9267
; LAYER_HEIGHT: 0.126666
; WIPE_START
G1 F24000
G1 X139.172 Y113.727 E-.23876
G1 X139.172 Y114.727 E-.38
G1 X138.909 Y114.99 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 110/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L110
M991 S0 P109 ;notify layer change
G17
G3 Z13.2 I1.135 J-.44 P1  F30000
G1 X137.819 Y112.181 Z13.2
G1 Z12.927
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.276667
G1 F1592
G3 X137.506 Y109.847 I-.321 J-1.145 E.16538
G1 X137.58 Y109.849 E.00301
G3 X137.877 Y112.163 I-.082 J1.186 E.1329
; WIPE_START
G1 F24000
G1 X137.239 Y112.196 E-.24251
G1 X136.891 Y112.044 E-.14422
G1 X136.566 Y111.735 E-.17036
G1 X136.375 Y111.329 E-.17089
G1 X136.369 Y111.244 E-.03203
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.327 I-.125 J-1.211 P1  F30000
G1 X127.162 Y112.196 Z13.327
G1 Z12.927
G1 E.8 F1800
G1 F1592
G1 X123.087 Y112.188 E.16563
G3 X124.411 Y111.688 I1 J.645 E.06159
G1 X124.552 Y111.518 E.00899
G3 X125.65 Y109.756 I1.028 J-.582 E.10303
G3 X126.581 Y111.585 I-.088 J1.196 E.10008
G2 X127.116 Y112.127 I1.519 J-.962 E.0312
G1 X127.128 Y112.146 E.00093
; CHANGE_LAYER
; Z_HEIGHT: 13
; LAYER_HEIGHT: 0.0733337
; WIPE_START
G1 F24000
G1 X125.128 Y112.167 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 111/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L111
M991 S0 P110 ;notify layer change
G17
G3 Z13.327 I-1.163 J.359 P1  F30000
G1 X126.52 Y116.674 Z13.327
G1 Z13
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1592
G1 X126.52 Y123.174 E.21562
G1 X123.724 Y123.174 E.09274
G1 X123.724 Y113.379 E.32495
G1 X139.52 Y113.379 E.52398
G1 X139.52 Y123.174 E.32495
G1 X133.724 Y123.174 E.19226
G1 X133.724 Y116.674 E.21562
G1 X126.58 Y116.674 E.23698
G1 X126.912 Y117.067 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1592
G1 X126.912 Y123.567 E.19973
G1 X123.332 Y123.567 E.11
G1 X123.332 Y112.987 E.32509
G1 X139.912 Y112.987 E.50946
G1 X139.912 Y123.567 E.32509
G1 X133.332 Y123.567 E.20219
G1 X133.332 Y117.067 E.19973
G1 X126.972 Y117.067 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X126.954 Y119.066 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.4 I.774 J-.939 P1  F30000
G1 X126.172 Y118.423 Z13.4
G1 Z13
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1592
G1 X126.172 Y120.051 E.05401
G1 X124.073 Y122.15 E.09848
G1 X124.073 Y120.403 E.05796
G1 X126.172 Y122.502 E.09848
G1 X126.172 Y122.826 E.01075
G1 X124.868 Y122.826 E.04327
G1 X124.073 Y116.103 F30000
G1 F1592
G1 X124.073 Y114.474 E.05401
G1 X124.82 Y113.727 E.03506
G1 X125.073 Y113.727 E.00838
G1 X127.672 Y116.326 E.12194
G1 X129.897 Y116.326 E.0738
G1 X132.496 Y113.727 E.12194
G1 X132.748 Y113.727 E.00838
G1 X139.172 Y120.15 E.30133
G1 X139.172 Y122.403 E.07472
G1 X138.748 Y122.826 E.01986
G1 X134.172 Y122.826 E.15182
G1 X134.073 Y122.727 E.00466
G1 X134.073 Y119.826 E.09622
G1 X139.172 Y114.727 E.23922
G1 X139.172 Y113.727 E.03317
G1 X138.544 Y113.727 E.02084
; CHANGE_LAYER
; Z_HEIGHT: 13.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X139.172 Y113.727 E-.23876
G1 X139.172 Y114.727 E-.38
G1 X138.909 Y114.99 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 112/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L112
M991 S0 P111 ;notify layer change
G17
G3 Z13.4 I-.164 J-1.206 P1  F30000
M73 P77 R4
G1 X126.52 Y116.674 Z13.4
G1 Z13.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1414
G1 X126.52 Y123.174 E.21562
G1 X123.724 Y123.174 E.09274
G1 X123.724 Y113.379 E.32495
G1 X139.52 Y113.379 E.52398
G1 X139.52 Y123.174 E.32495
G1 X133.724 Y123.174 E.19226
G1 X133.724 Y116.674 E.21562
G1 X126.58 Y116.674 E.23698
G1 X126.912 Y117.067 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1414
G1 X126.912 Y123.567 E.19973
G1 X123.332 Y123.567 E.11
G1 X123.332 Y112.987 E.32509
G1 X139.912 Y112.987 E.50946
G1 X139.912 Y123.567 E.32509
G1 X133.332 Y123.567 E.20219
G1 X133.332 Y117.067 E.19973
G1 X126.972 Y117.067 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X126.954 Y119.066 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.6 I.774 J-.939 P1  F30000
G1 X126.172 Y118.423 Z13.6
G1 Z13.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1414
G1 X126.172 Y120.051 E.05401
G1 X124.073 Y122.15 E.09848
G1 X124.073 Y120.403 E.05796
G1 X126.172 Y122.502 E.09848
G1 X126.172 Y122.826 E.01075
G1 X124.868 Y122.826 E.04327
G1 X124.073 Y116.103 F30000
G1 F1414
G1 X124.073 Y114.474 E.05401
G1 X124.82 Y113.727 E.03506
G1 X125.073 Y113.727 E.00838
G1 X127.672 Y116.326 E.12194
G1 X129.897 Y116.326 E.0738
G1 X132.496 Y113.727 E.12194
G1 X132.748 Y113.727 E.00838
G1 X139.172 Y120.15 E.30133
G1 X139.172 Y122.403 E.07472
G1 X138.748 Y122.826 E.01986
G1 X134.172 Y122.826 E.15182
G1 X134.073 Y122.727 E.00466
G1 X134.073 Y119.826 E.09622
G1 X139.172 Y114.727 E.23922
G1 X139.172 Y113.727 E.03317
G1 X138.544 Y113.727 E.02084
; CHANGE_LAYER
; Z_HEIGHT: 13.2033
; LAYER_HEIGHT: 0.00333309
; WIPE_START
G1 F24000
G1 X139.172 Y113.727 E-.23876
G1 X139.172 Y114.727 E-.38
G1 X138.909 Y114.99 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 113/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L113
M991 S0 P112 ;notify layer change
G17
G3 Z13.6 I1.148 J-.403 P1  F30000
G1 X137.921 Y112.174 Z13.6
G1 Z13.203
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.276667
G1 F1590
G3 X137.529 Y109.919 I-.4 J-1.092 E.1654
G1 X137.602 Y109.922 E.00295
G3 X137.976 Y112.152 I-.081 J1.16 E.1262
; WIPE_START
G1 F24000
G1 X137.181 Y112.196 E-.30244
G1 X136.81 Y111.986 E-.1623
G1 X136.53 Y111.646 E-.16736
G1 X136.416 Y111.329 E-.1279
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.603 I-.113 J-1.212 P1  F30000
G1 X127.133 Y112.196 Z13.603
G1 Z13.203
G1 E.8 F1800
G1 F1590
G1 X123.111 Y112.196 E.1635
G3 X124.457 Y111.723 I.982 J.644 E.06231
G1 X124.598 Y111.553 E.00899
G3 X125.668 Y109.816 I1.001 J-.581 E.10147
G3 X126.579 Y111.611 I-.087 J1.173 E.09823
G2 X127.096 Y112.142 I1.371 J-.818 E.03038
G1 X127.099 Y112.147 E.00025
; CHANGE_LAYER
; Z_HEIGHT: 13.4
; LAYER_HEIGHT: 0.196667
; WIPE_START
G1 F24000
M73 P78 R4
G1 X125.1 Y112.171 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 114/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L114
M991 S0 P113 ;notify layer change
G17
G3 Z13.603 I-1.161 J.366 P1  F30000
G1 X126.52 Y116.674 Z13.603
G1 Z13.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1590
G1 X126.52 Y123.174 E.21562
G1 X123.724 Y123.174 E.09274
G1 X123.724 Y113.379 E.32495
G1 X139.52 Y113.379 E.52398
G1 X139.52 Y123.174 E.32495
G1 X133.724 Y123.174 E.19226
G1 X133.724 Y116.674 E.21562
G1 X126.58 Y116.674 E.23698
G1 X126.912 Y117.067 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1590
G1 X126.912 Y123.567 E.19973
G1 X123.332 Y123.567 E.11
G1 X123.332 Y112.987 E.32509
G1 X139.912 Y112.987 E.50946
G1 X139.912 Y123.567 E.32509
G1 X133.332 Y123.567 E.20219
G1 X133.332 Y117.067 E.19973
G1 X126.972 Y117.067 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X126.954 Y119.066 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.8 I.774 J-.939 P1  F30000
G1 X126.172 Y118.423 Z13.8
G1 Z13.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1590
G1 X126.172 Y120.051 E.05401
G1 X124.073 Y122.15 E.09848
G1 X124.073 Y120.403 E.05796
G1 X126.172 Y122.502 E.09848
G1 X126.172 Y122.826 E.01075
G1 X124.868 Y122.826 E.04327
G1 X124.073 Y116.103 F30000
G1 F1590
G1 X124.073 Y114.474 E.05401
G1 X124.82 Y113.727 E.03506
G1 X125.073 Y113.727 E.00838
G1 X127.672 Y116.326 E.12194
G1 X129.897 Y116.326 E.0738
G1 X132.496 Y113.727 E.12194
G1 X132.748 Y113.727 E.00838
G1 X139.172 Y120.15 E.30133
G1 X139.172 Y122.403 E.07472
G1 X138.748 Y122.826 E.01986
G1 X134.172 Y122.826 E.15182
G1 X134.073 Y122.727 E.00466
G1 X134.073 Y119.826 E.09622
G1 X139.172 Y114.727 E.23922
G1 X139.172 Y113.727 E.03317
G1 X138.544 Y113.727 E.02084
; CHANGE_LAYER
; Z_HEIGHT: 13.48
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F24000
G1 X139.172 Y113.727 E-.23876
G1 X139.172 Y114.727 E-.38
G1 X138.909 Y114.99 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 115/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L115
M991 S0 P114 ;notify layer change
G17
G3 Z13.8 I1.16 J-.369 P1  F30000
G1 X138.019 Y112.196 Z13.8
G1 Z13.48
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.276667
G1 F1587
G1 X137.14 Y112.196 E.03573
G3 X137.624 Y109.997 I.43 J-1.058 E.13016
G3 X138.073 Y112.17 I-.085 J1.151 E.12135
; WIPE_START
G1 F24000
G1 X137.14 Y112.196 E-.3545
G1 X136.796 Y111.97 E-.15656
G1 X136.543 Y111.62 E-.1642
G1 X136.48 Y111.406 E-.08475
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.88 I-.097 J-1.213 P1  F30000
G1 X127.076 Y112.156 Z13.88
G1 Z13.48
G1 E.8 F1800
G1 F1587
G1 X123.14 Y112.196 E.16001
G3 X124.496 Y111.766 I.947 J.631 E.06247
G1 X124.648 Y111.594 E.00931
G3 X125.687 Y109.876 I.972 J-.585 E.10017
G3 X126.579 Y111.638 I-.085 J1.15 E.09639
G2 X127.026 Y112.124 I1.225 J-.679 E.02709
; CHANGE_LAYER
; Z_HEIGHT: 13.6
; LAYER_HEIGHT: 0.120001
; WIPE_START
G1 F24000
G1 X125.026 Y112.161 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 116/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L116
M991 S0 P115 ;notify layer change
G17
G3 Z13.88 I-1.155 J.382 P1  F30000
G1 X126.52 Y116.674 Z13.88
G1 Z13.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1587
G1 X126.52 Y123.174 E.21562
G1 X123.724 Y123.174 E.09274
G1 X123.724 Y113.379 E.32495
G1 X139.52 Y113.379 E.52398
G1 X139.52 Y123.174 E.32495
G1 X133.724 Y123.174 E.19226
G1 X133.724 Y116.674 E.21562
G1 X126.58 Y116.674 E.23698
G1 X126.912 Y117.067 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1587
G1 X126.912 Y123.567 E.19973
G1 X123.332 Y123.567 E.11
G1 X123.332 Y112.987 E.32509
G1 X139.912 Y112.987 E.50946
G1 X139.912 Y123.567 E.32509
G1 X133.332 Y123.567 E.20219
G1 X133.332 Y117.067 E.19973
G1 X126.972 Y117.067 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X126.954 Y119.066 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14 I.774 J-.939 P1  F30000
G1 X126.172 Y118.423 Z14
G1 Z13.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1587
G1 X126.172 Y120.051 E.05401
G1 X124.073 Y122.15 E.09848
G1 X124.073 Y120.403 E.05796
G1 X126.172 Y122.502 E.09848
G1 X126.172 Y122.826 E.01075
G1 X124.868 Y122.826 E.04327
G1 X124.073 Y116.103 F30000
G1 F1587
G1 X124.073 Y114.474 E.05401
G1 X124.82 Y113.727 E.03506
G1 X125.073 Y113.727 E.00838
G1 X127.672 Y116.326 E.12194
G1 X129.897 Y116.326 E.0738
G1 X132.496 Y113.727 E.12194
G1 X132.748 Y113.727 E.00838
G1 X139.172 Y120.15 E.30133
G1 X139.172 Y122.403 E.07472
G1 X138.748 Y122.826 E.01986
G1 X134.172 Y122.826 E.15182
G1 X134.073 Y122.727 E.00466
G1 X134.073 Y119.826 E.09622
G1 X139.172 Y114.727 E.23922
G1 X139.172 Y113.727 E.03317
G1 X138.544 Y113.727 E.02084
; CHANGE_LAYER
; Z_HEIGHT: 13.7567
; LAYER_HEIGHT: 0.156667
; WIPE_START
G1 F24000
G1 X139.172 Y113.727 E-.23876
G1 X139.172 Y114.727 E-.38
G1 X138.909 Y114.99 E-.14124
; WIPE_END
M73 P79 R4
G1 E-.04 F1800
; layer num/total_layer_count: 117/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L117
M991 S0 P116 ;notify layer change
G17
G3 Z14 I1.169 J-.338 P1  F30000
G1 X138.102 Y112.196 Z14
G1 Z13.757
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.276667
G1 F1585
G1 X137.109 Y112.196 E.04035
G3 X137.647 Y110.072 I.487 J-1.007 E.12439
G3 X138.154 Y112.166 I-.087 J1.129 E.11571
; WIPE_START
G1 F24000
G1 X137.109 Y112.196 E-.39696
G1 X136.788 Y111.955 E-.15265
G1 X136.59 Y111.662 E-.13439
G1 X136.534 Y111.47 E-.076
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.157 I-.093 J-1.213 P1  F30000
G1 X127.075 Y112.196 Z14.157
G1 Z13.757
G1 E.8 F1800
G1 F1585
G1 X123.17 Y112.196 E.15874
G3 X124.542 Y111.813 I.918 J.636 E.06284
G1 X124.705 Y111.629 E.00997
G3 X125.708 Y109.937 I.938 J-.588 E.09851
G3 X126.58 Y111.666 I-.084 J1.126 E.09456
G2 X127.014 Y112.115 I.892 J-.427 E.02587
G3 X127.04 Y112.147 I-.614 J.52 E.00167
; CHANGE_LAYER
; Z_HEIGHT: 13.8
; LAYER_HEIGHT: 0.0433331
; WIPE_START
G1 F24000
G1 X125.04 Y112.173 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 118/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L118
M991 S0 P117 ;notify layer change
G17
G3 Z14.157 I-1.156 J.38 P1  F30000
G1 X126.52 Y116.674 Z14.157
G1 Z13.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1585
G1 X126.52 Y123.174 E.21562
G1 X123.724 Y123.174 E.09274
G1 X123.724 Y113.379 E.32495
G1 X139.52 Y113.379 E.52398
G1 X139.52 Y123.174 E.32495
G1 X133.724 Y123.174 E.19226
G1 X133.724 Y116.674 E.21562
G1 X126.58 Y116.674 E.23698
G1 X126.912 Y117.067 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1585
G1 X126.912 Y123.567 E.19973
G1 X123.332 Y123.567 E.11
G1 X123.332 Y112.987 E.32509
G1 X139.912 Y112.987 E.50946
G1 X139.912 Y123.567 E.32509
G1 X133.332 Y123.567 E.20219
G1 X133.332 Y117.067 E.19973
G1 X126.972 Y117.067 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X126.954 Y119.066 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.2 I.774 J-.939 P1  F30000
G1 X126.172 Y118.423 Z14.2
G1 Z13.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1585
G1 X126.172 Y120.051 E.05401
G1 X124.073 Y122.15 E.09848
G1 X124.073 Y120.403 E.05796
G1 X126.172 Y122.502 E.09848
G1 X126.172 Y122.826 E.01075
G1 X124.868 Y122.826 E.04327
G1 X124.073 Y116.103 F30000
G1 F1585
G1 X124.073 Y114.474 E.05401
G1 X124.82 Y113.727 E.03506
G1 X125.073 Y113.727 E.00838
G1 X127.672 Y116.326 E.12194
G1 X129.897 Y116.326 E.0738
G1 X132.496 Y113.727 E.12194
G1 X132.748 Y113.727 E.00838
G1 X139.172 Y120.15 E.30133
G1 X139.172 Y122.403 E.07472
G1 X138.748 Y122.826 E.01986
G1 X134.172 Y122.826 E.15182
G1 X134.073 Y122.727 E.00466
G1 X134.073 Y119.826 E.09622
G1 X139.172 Y114.727 E.23922
G1 X139.172 Y113.727 E.03317
G1 X138.544 Y113.727 E.02084
; CHANGE_LAYER
; Z_HEIGHT: 14
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X139.172 Y113.727 E-.23876
G1 X139.172 Y114.727 E-.38
G1 X138.909 Y114.99 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 119/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L119
M991 S0 P118 ;notify layer change
G17
G3 Z14.2 I-.164 J-1.206 P1  F30000
G1 X126.52 Y116.674 Z14.2
G1 Z14
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1414
G1 X126.52 Y123.174 E.21562
G1 X123.724 Y123.174 E.09274
G1 X123.724 Y113.379 E.32495
G1 X139.52 Y113.379 E.52398
G1 X139.52 Y123.174 E.32495
G1 X133.724 Y123.174 E.19226
G1 X133.724 Y116.674 E.21562
M73 P80 R4
G1 X126.58 Y116.674 E.23698
G1 X126.912 Y117.067 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1414
G1 X126.912 Y123.567 E.19973
G1 X123.332 Y123.567 E.11
G1 X123.332 Y112.987 E.32509
G1 X139.912 Y112.987 E.50946
G1 X139.912 Y123.567 E.32509
G1 X133.332 Y123.567 E.20219
G1 X133.332 Y117.067 E.19973
G1 X126.972 Y117.067 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X126.954 Y119.066 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.4 I.774 J-.939 P1  F30000
G1 X126.172 Y118.423 Z14.4
G1 Z14
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1414
G1 X126.172 Y120.051 E.05401
G1 X124.073 Y122.15 E.09848
G1 X124.073 Y120.403 E.05796
G1 X126.172 Y122.502 E.09848
G1 X126.172 Y122.826 E.01075
G1 X124.868 Y122.826 E.04327
G1 X124.073 Y116.103 F30000
G1 F1414
G1 X124.073 Y114.474 E.05401
G1 X124.82 Y113.727 E.03506
G1 X125.073 Y113.727 E.00838
G1 X127.672 Y116.326 E.12194
G1 X129.897 Y116.326 E.0738
G1 X132.496 Y113.727 E.12194
G1 X132.748 Y113.727 E.00838
G1 X139.172 Y120.15 E.30133
G1 X139.172 Y122.403 E.07472
G1 X138.748 Y122.826 E.01986
G1 X134.172 Y122.826 E.15182
G1 X134.073 Y122.727 E.00466
G1 X134.073 Y119.826 E.09622
G1 X139.172 Y114.727 E.23922
G1 X139.172 Y113.727 E.03317
G1 X138.544 Y113.727 E.02084
; CHANGE_LAYER
; Z_HEIGHT: 14.0333
; LAYER_HEIGHT: 0.0333338
; WIPE_START
G1 F24000
G1 X139.172 Y113.727 E-.23876
G1 X139.172 Y114.727 E-.38
G1 X138.909 Y114.99 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 120/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L120
M991 S0 P119 ;notify layer change
G17
G3 Z14.4 I1.177 J-.308 P1  F30000
G1 X138.179 Y112.196 Z14.4
M73 P80 R3
G1 Z14.033
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.276667
G1 F1582
G1 X137.086 Y112.196 E.04441
G3 X137.672 Y110.15 I.533 J-.954 E.11908
G3 X138.228 Y112.163 I-.085 J1.107 E.11051
; WIPE_START
G1 F24000
G1 X137.086 Y112.196 E-.43416
G1 X136.787 Y111.941 E-.14961
G1 X136.611 Y111.642 E-.13173
G1 X136.585 Y111.528 E-.04449
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.433 I-.085 J-1.214 P1  F30000
G1 X127.045 Y112.196 Z14.433
G1 Z14.033
G1 E.8 F1800
G1 F1582
G1 X123.207 Y112.184 E.15603
G3 X124.598 Y111.859 I.887 J.656 E.06316
G1 X124.76 Y111.674 E.00997
G3 X125.73 Y109.998 I.906 J-.595 E.09739
G3 X126.583 Y111.691 I-.082 J1.103 E.09261
G2 X126.996 Y112.131 I1.221 J-.733 E.02468
G1 X127.009 Y112.148 E.00091
; CHANGE_LAYER
; Z_HEIGHT: 14.2
; LAYER_HEIGHT: 0.166666
; WIPE_START
G1 F24000
G1 X125.009 Y112.167 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 121/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L121
M991 S0 P120 ;notify layer change
G17
G3 Z14.433 I-1.154 J.387 P1  F30000
G1 X126.52 Y116.674 Z14.433
G1 Z14.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1582
G1 X126.52 Y123.174 E.21562
G1 X123.724 Y123.174 E.09274
G1 X123.724 Y113.379 E.32495
G1 X139.52 Y113.379 E.52398
G1 X139.52 Y123.174 E.32495
G1 X133.724 Y123.174 E.19226
G1 X133.724 Y116.674 E.21562
G1 X126.58 Y116.674 E.23698
G1 X126.912 Y117.067 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1582
G1 X126.912 Y123.567 E.19973
G1 X123.332 Y123.567 E.11
G1 X123.332 Y112.987 E.32509
G1 X139.912 Y112.987 E.50946
G1 X139.912 Y123.567 E.32509
G1 X133.332 Y123.567 E.20219
G1 X133.332 Y117.067 E.19973
G1 X126.972 Y117.067 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X126.954 Y119.066 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.6 I.774 J-.939 P1  F30000
G1 X126.172 Y118.423 Z14.6
G1 Z14.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1582
G1 X126.172 Y120.051 E.05401
G1 X124.073 Y122.15 E.09848
G1 X124.073 Y120.403 E.05796
G1 X126.172 Y122.502 E.09848
G1 X126.172 Y122.826 E.01075
G1 X124.868 Y122.826 E.04327
G1 X124.073 Y116.103 F30000
G1 F1582
G1 X124.073 Y114.474 E.05401
M73 P81 R3
G1 X124.82 Y113.727 E.03506
G1 X125.073 Y113.727 E.00838
G1 X127.672 Y116.326 E.12194
G1 X129.897 Y116.326 E.0738
G1 X132.496 Y113.727 E.12194
G1 X132.748 Y113.727 E.00838
G1 X139.172 Y120.15 E.30133
G1 X139.172 Y122.403 E.07472
G1 X138.748 Y122.826 E.01986
G1 X134.172 Y122.826 E.15182
G1 X134.073 Y122.727 E.00466
G1 X134.073 Y119.826 E.09622
G1 X139.172 Y114.727 E.23922
G1 X139.172 Y113.727 E.03317
G1 X138.544 Y113.727 E.02084
; CHANGE_LAYER
; Z_HEIGHT: 14.31
; LAYER_HEIGHT: 0.110001
; WIPE_START
G1 F24000
G1 X139.172 Y113.727 E-.23876
G1 X139.172 Y114.727 E-.38
G1 X138.909 Y114.99 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 122/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L122
M991 S0 P121 ;notify layer change
G17
G3 Z14.6 I1.185 J-.279 P1  F30000
G1 X138.251 Y112.196 Z14.6
G1 Z14.31
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.276667
G1 F1580
G1 X137.07 Y112.196 E.04801
G3 X137.697 Y110.229 I.578 J-.899 E.11368
G3 X138.297 Y112.16 I-.088 J1.086 E.10532
; WIPE_START
G1 F24000
G1 X137.07 Y112.196 E-.46664
G1 X136.792 Y111.927 E-.14694
G1 X136.638 Y111.625 E-.12902
G1 X136.63 Y111.58 E-.0174
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.71 I-.078 J-1.214 P1  F30000
G1 X127.016 Y112.196 Z14.71
G1 Z14.31
G1 E.8 F1800
G1 F1580
G1 X123.228 Y112.196 E.15397
G3 X124.648 Y111.915 I.866 J.649 E.06445
G1 X124.822 Y111.73 E.01031
G3 X125.753 Y110.059 I.871 J-.61 E.09675
G3 X126.586 Y111.721 I-.081 J1.08 E.09083
G2 X126.968 Y112.16 I1.322 J-.764 E.0238
; CHANGE_LAYER
; Z_HEIGHT: 14.4
; LAYER_HEIGHT: 0.0899992
; WIPE_START
G1 F24000
G1 X124.968 Y112.179 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 123/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L123
M991 S0 P122 ;notify layer change
G17
G3 Z14.71 I-1.15 J.397 P1  F30000
G1 X126.52 Y116.674 Z14.71
G1 Z14.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1580
G1 X126.52 Y123.174 E.21562
G1 X123.724 Y123.174 E.09274
G1 X123.724 Y113.379 E.32495
G1 X139.52 Y113.379 E.52398
G1 X139.52 Y123.174 E.32495
G1 X133.724 Y123.174 E.19226
G1 X133.724 Y116.674 E.21562
G1 X126.58 Y116.674 E.23698
G1 X126.912 Y117.067 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1580
G1 X126.912 Y123.567 E.19973
G1 X123.332 Y123.567 E.11
G1 X123.332 Y112.987 E.32509
G1 X139.912 Y112.987 E.50946
G1 X139.912 Y123.567 E.32509
G1 X133.332 Y123.567 E.20219
G1 X133.332 Y117.067 E.19973
G1 X126.972 Y117.067 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X126.954 Y119.066 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.8 I.774 J-.939 P1  F30000
G1 X126.172 Y118.423 Z14.8
G1 Z14.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1580
G1 X126.172 Y120.051 E.05401
G1 X124.073 Y122.15 E.09848
G1 X124.073 Y120.403 E.05796
G1 X126.172 Y122.502 E.09848
G1 X126.172 Y122.826 E.01075
G1 X124.868 Y122.826 E.04327
G1 X124.073 Y116.103 F30000
G1 F1580
G1 X124.073 Y114.474 E.05401
G1 X124.82 Y113.727 E.03506
G1 X125.073 Y113.727 E.00838
G1 X127.672 Y116.326 E.12194
G1 X129.897 Y116.326 E.0738
G1 X132.496 Y113.727 E.12194
G1 X132.748 Y113.727 E.00838
G1 X139.172 Y120.15 E.30133
G1 X139.172 Y122.403 E.07472
G1 X138.748 Y122.826 E.01986
G1 X134.172 Y122.826 E.15182
G1 X134.073 Y122.727 E.00466
G1 X134.073 Y119.826 E.09622
G1 X139.172 Y114.727 E.23922
G1 X139.172 Y113.727 E.03317
G1 X138.544 Y113.727 E.02084
; CHANGE_LAYER
; Z_HEIGHT: 14.5867
; LAYER_HEIGHT: 0.186667
; WIPE_START
G1 F24000
G1 X139.172 Y113.727 E-.23876
G1 X139.172 Y114.727 E-.38
G1 X138.909 Y114.99 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 124/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L124
M991 S0 P123 ;notify layer change
G17
G3 Z14.8 I1.191 J-.251 P1  F30000
G1 X138.319 Y112.196 Z14.8
G1 Z14.587
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.276667
G1 F1578
G1 X137.059 Y112.196 E.05122
G3 X137.724 Y110.311 I.614 J-.844 E.10863
G3 X138.363 Y112.158 I-.086 J1.064 E.1004
; WIPE_START
G1 F24000
G1 X137.059 Y112.196 E-.49578
M73 P82 R3
G1 X136.803 Y111.916 E-.14426
G1 X136.677 Y111.626 E-.11996
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.987 I-.071 J-1.215 P1  F30000
G1 X126.985 Y112.196 Z14.987
G1 Z14.587
G1 E.8 F1800
G1 F1578
G1 X123.259 Y112.196 E.15148
G3 X124.699 Y111.988 I.827 J.637 E.06544
G1 X124.897 Y111.79 E.01138
G3 X125.778 Y110.122 I.818 J-.634 E.09642
G3 X126.59 Y111.752 I-.08 J1.057 E.08905
G2 X126.936 Y112.162 I1.052 J-.537 E.022
; CHANGE_LAYER
; Z_HEIGHT: 14.6
; LAYER_HEIGHT: 0.0133333
; WIPE_START
G1 F24000
G1 X124.936 Y112.18 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 125/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L125
M991 S0 P124 ;notify layer change
G17
G3 Z14.987 I-1.148 J.404 P1  F30000
G1 X126.52 Y116.674 Z14.987
G1 Z14.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1578
G1 X126.52 Y123.174 E.21562
G1 X123.724 Y123.174 E.09274
G1 X123.724 Y113.379 E.32495
G1 X139.52 Y113.379 E.52398
G1 X139.52 Y123.174 E.32495
G1 X133.724 Y123.174 E.19226
G1 X133.724 Y116.674 E.21562
G1 X126.58 Y116.674 E.23698
G1 X126.912 Y117.067 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1578
G1 X126.912 Y123.567 E.19973
G1 X123.332 Y123.567 E.11
G1 X123.332 Y112.987 E.32509
G1 X139.912 Y112.987 E.50946
G1 X139.912 Y123.567 E.32509
G1 X133.332 Y123.567 E.20219
G1 X133.332 Y117.067 E.19973
G1 X126.972 Y117.067 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X126.954 Y119.066 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15 I.774 J-.939 P1  F30000
G1 X126.172 Y118.423 Z15
G1 Z14.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1578
G1 X126.172 Y120.051 E.05401
G1 X124.073 Y122.15 E.09848
G1 X124.073 Y120.403 E.05796
G1 X126.172 Y122.502 E.09848
G1 X126.172 Y122.826 E.01075
G1 X124.868 Y122.826 E.04327
G1 X124.073 Y116.103 F30000
G1 F1578
G1 X124.073 Y114.474 E.05401
G1 X124.82 Y113.727 E.03506
G1 X125.073 Y113.727 E.00838
G1 X127.672 Y116.326 E.12194
G1 X129.897 Y116.326 E.0738
G1 X132.496 Y113.727 E.12194
G1 X132.748 Y113.727 E.00838
G1 X139.172 Y120.15 E.30133
G1 X139.172 Y122.403 E.07472
G1 X138.748 Y122.826 E.01986
G1 X134.172 Y122.826 E.15182
G1 X134.073 Y122.727 E.00466
G1 X134.073 Y119.826 E.09622
G1 X139.172 Y114.727 E.23922
G1 X139.172 Y113.727 E.03317
G1 X138.544 Y113.727 E.02084
; CHANGE_LAYER
; Z_HEIGHT: 14.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X139.172 Y113.727 E-.23876
G1 X139.172 Y114.727 E-.38
G1 X138.909 Y114.99 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 126/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L126
M991 S0 P125 ;notify layer change
G17
G3 Z15 I-.164 J-1.206 P1  F30000
G1 X126.52 Y116.674 Z15
G1 Z14.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1414
G1 X126.52 Y123.174 E.21562
G1 X123.724 Y123.174 E.09274
G1 X123.724 Y113.379 E.32495
G1 X139.52 Y113.379 E.52398
G1 X139.52 Y123.174 E.32495
G1 X133.724 Y123.174 E.19226
G1 X133.724 Y116.674 E.21562
G1 X126.58 Y116.674 E.23698
G1 X126.912 Y117.067 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1414
G1 X126.912 Y123.567 E.19973
G1 X123.332 Y123.567 E.11
G1 X123.332 Y112.987 E.32509
G1 X139.912 Y112.987 E.50946
G1 X139.912 Y123.567 E.32509
G1 X133.332 Y123.567 E.20219
G1 X133.332 Y117.067 E.19973
G1 X126.972 Y117.067 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X126.954 Y119.066 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.2 I.774 J-.939 P1  F30000
G1 X126.172 Y118.423 Z15.2
G1 Z14.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1414
G1 X126.172 Y120.051 E.05401
G1 X124.073 Y122.15 E.09848
G1 X124.073 Y120.403 E.05796
G1 X126.172 Y122.502 E.09848
G1 X126.172 Y122.826 E.01075
G1 X124.868 Y122.826 E.04327
G1 X124.073 Y116.103 F30000
G1 F1414
G1 X124.073 Y114.474 E.05401
G1 X124.82 Y113.727 E.03506
M73 P83 R3
G1 X125.073 Y113.727 E.00838
G1 X127.672 Y116.326 E.12194
G1 X129.897 Y116.326 E.0738
G1 X132.496 Y113.727 E.12194
G1 X132.748 Y113.727 E.00838
G1 X139.172 Y120.15 E.30133
G1 X139.172 Y122.403 E.07472
G1 X138.748 Y122.826 E.01986
G1 X134.172 Y122.826 E.15182
G1 X134.073 Y122.727 E.00466
G1 X134.073 Y119.826 E.09622
G1 X139.172 Y114.727 E.23922
G1 X139.172 Y113.727 E.03317
G1 X138.544 Y113.727 E.02084
; CHANGE_LAYER
; Z_HEIGHT: 14.8633
; LAYER_HEIGHT: 0.0633335
; WIPE_START
G1 F24000
G1 X139.172 Y113.727 E-.23876
G1 X139.172 Y114.727 E-.38
G1 X138.909 Y114.99 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 127/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L127
M991 S0 P126 ;notify layer change
G17
G3 Z15.2 I1.196 J-.225 P1  F30000
G1 X138.384 Y112.196 Z15.2
G1 Z14.863
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.276667
G1 F1572
G1 X137.054 Y112.196 E.05407
G3 X137.752 Y110.394 I.65 J-.785 E.10345
G3 X138.425 Y112.155 I-.089 J1.043 E.09539
; WIPE_START
G1 F24000
G1 X137.054 Y112.196 E-.5214
G1 X136.724 Y111.665 E-.23776
G1 X136.724 Y111.662 E-.00085
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.263 I-.066 J-1.215 P1  F30000
G1 X126.955 Y112.196 Z15.263
G1 Z14.863
G1 E.8 F1800
G1 F1572
G1 X123.305 Y112.177 E.14838
G3 X124.441 Y111.876 I.781 J.651 E.05097
G1 X124.593 Y111.715 E.00899
G3 X125.804 Y110.185 I1.033 J-.426 E.09641
G3 X126.595 Y111.783 I-.078 J1.034 E.08727
G2 X126.909 Y112.158 I1.342 J-.804 E.01993
; CHANGE_LAYER
; Z_HEIGHT: 15
; LAYER_HEIGHT: 0.136666
; WIPE_START
G1 F24000
G1 X124.909 Y112.168 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 128/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L128
M991 S0 P127 ;notify layer change
G17
G3 Z15.263 I-1.146 J.41 P1  F30000
G1 X126.52 Y116.674 Z15.263
G1 Z15
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1572
G1 X126.52 Y123.174 E.21562
G1 X123.724 Y123.174 E.09274
G1 X123.724 Y113.379 E.32495
G1 X139.52 Y113.379 E.52398
G1 X139.52 Y123.174 E.32495
G1 X133.724 Y123.174 E.19226
G1 X133.724 Y116.674 E.21562
G1 X126.58 Y116.674 E.23698
G1 X126.912 Y117.067 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1572
G1 X126.912 Y123.567 E.19973
G1 X123.332 Y123.567 E.11
G1 X123.332 Y112.987 E.32509
G1 X139.912 Y112.987 E.50946
G1 X139.912 Y123.567 E.32509
G1 X133.332 Y123.567 E.20219
G1 X133.332 Y117.067 E.19973
G1 X126.972 Y117.067 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X126.954 Y119.066 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.4 I.774 J-.939 P1  F30000
G1 X126.172 Y118.423 Z15.4
G1 Z15
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1572
G1 X126.172 Y120.051 E.05401
G1 X124.073 Y122.15 E.09848
G1 X124.073 Y120.403 E.05796
G1 X126.172 Y122.502 E.09848
G1 X126.172 Y122.826 E.01075
G1 X124.868 Y122.826 E.04327
G1 X124.073 Y116.103 F30000
G1 F1572
G1 X124.073 Y114.474 E.05401
G1 X124.82 Y113.727 E.03506
G1 X125.073 Y113.727 E.00838
G1 X127.672 Y116.326 E.12194
G1 X129.897 Y116.326 E.0738
G1 X132.496 Y113.727 E.12194
G1 X132.748 Y113.727 E.00838
G1 X139.172 Y120.15 E.30133
G1 X139.172 Y122.403 E.07472
G1 X138.748 Y122.826 E.01986
G1 X134.172 Y122.826 E.15182
G1 X134.073 Y122.727 E.00466
G1 X134.073 Y119.826 E.09622
G1 X139.172 Y114.727 E.23922
G1 X139.172 Y113.727 E.03317
G1 X138.544 Y113.727 E.02084
; CHANGE_LAYER
; Z_HEIGHT: 15.14
; LAYER_HEIGHT: 0.14
; WIPE_START
G1 F24000
G1 X139.172 Y113.727 E-.23876
G1 X139.172 Y114.727 E-.38
G1 X138.909 Y114.99 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 129/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L129
M991 S0 P128 ;notify layer change
G17
G3 Z15.4 I1.201 J-.199 P1  F30000
G1 X138.445 Y112.196 Z15.4
G1 Z15.14
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.276667
M73 P84 R3
G1 F1569
G1 X137.054 Y112.196 E.05657
G3 X137.781 Y110.478 I.677 J-.726 E.09854
G3 X138.484 Y112.152 I-.087 J1.021 E.09065
; WIPE_START
G1 F24000
G1 X137.054 Y112.196 E-.54372
G1 X136.784 Y111.695 E-.21628
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.54 I-.062 J-1.215 P1  F30000
G1 X126.924 Y112.196 Z15.54
G1 Z15.14
G1 E.8 F1800
G1 F1569
G1 X123.323 Y112.192 E.14638
G3 X124.372 Y111.878 I.765 J.644 E.04712
G1 X124.513 Y111.718 E.00867
G3 X125.831 Y110.249 I1.064 J-.371 E.09771
G3 X126.603 Y111.813 I-.077 J1.011 E.08537
G2 X126.877 Y112.159 I.964 J-.48 E.01807
; CHANGE_LAYER
; Z_HEIGHT: 15.2
; LAYER_HEIGHT: 0.0599995
; WIPE_START
G1 F24000
G1 X124.877 Y112.178 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 130/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L130
M991 S0 P129 ;notify layer change
G17
G3 Z15.54 I-1.143 J.418 P1  F30000
G1 X126.52 Y116.674 Z15.54
G1 Z15.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1569
G1 X126.52 Y123.174 E.21562
G1 X123.724 Y123.174 E.09274
G1 X123.724 Y113.379 E.32495
G1 X139.52 Y113.379 E.52398
G1 X139.52 Y123.174 E.32495
G1 X133.724 Y123.174 E.19226
G1 X133.724 Y116.674 E.21562
G1 X126.58 Y116.674 E.23698
G1 X126.912 Y117.067 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1569
G1 X126.912 Y123.567 E.19973
G1 X123.332 Y123.567 E.11
G1 X123.332 Y112.987 E.32509
G1 X139.912 Y112.987 E.50946
G1 X139.912 Y123.567 E.32509
G1 X133.332 Y123.567 E.20219
G1 X133.332 Y117.067 E.19973
G1 X126.972 Y117.067 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X126.954 Y119.066 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.6 I.774 J-.939 P1  F30000
G1 X126.172 Y118.423 Z15.6
G1 Z15.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1569
G1 X126.172 Y120.051 E.05401
G1 X124.073 Y122.15 E.09848
G1 X124.073 Y120.403 E.05796
G1 X126.172 Y122.502 E.09848
G1 X126.172 Y122.826 E.01075
G1 X124.868 Y122.826 E.04327
G1 X124.073 Y116.103 F30000
G1 F1569
G1 X124.073 Y114.474 E.05401
G1 X124.82 Y113.727 E.03506
G1 X125.073 Y113.727 E.00838
G1 X127.672 Y116.326 E.12194
G1 X129.897 Y116.326 E.0738
G1 X132.496 Y113.727 E.12194
G1 X132.748 Y113.727 E.00838
G1 X139.172 Y120.15 E.30133
G1 X139.172 Y122.403 E.07472
G1 X138.748 Y122.826 E.01986
G1 X134.172 Y122.826 E.15182
G1 X134.073 Y122.727 E.00466
G1 X134.073 Y119.826 E.09622
G1 X139.172 Y114.727 E.23922
G1 X139.172 Y113.727 E.03317
G1 X138.544 Y113.727 E.02084
; CHANGE_LAYER
; Z_HEIGHT: 15.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X139.172 Y113.727 E-.23876
G1 X139.172 Y114.727 E-.38
G1 X138.909 Y114.99 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 131/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L131
M991 S0 P130 ;notify layer change
G17
G3 Z15.6 I-.164 J-1.206 P1  F30000
G1 X126.52 Y116.674 Z15.6
G1 Z15.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1414
G1 X126.52 Y123.174 E.21562
G1 X123.724 Y123.174 E.09274
G1 X123.724 Y113.379 E.32495
G1 X139.52 Y113.379 E.52398
G1 X139.52 Y123.174 E.32495
G1 X133.724 Y123.174 E.19226
G1 X133.724 Y116.674 E.21562
G1 X126.58 Y116.674 E.23698
G1 X126.912 Y117.067 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1414
G1 X126.912 Y123.567 E.19973
G1 X123.332 Y123.567 E.11
G1 X123.332 Y112.987 E.32509
G1 X139.912 Y112.987 E.50946
G1 X139.912 Y123.567 E.32509
G1 X133.332 Y123.567 E.20219
G1 X133.332 Y117.067 E.19973
G1 X126.972 Y117.067 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X126.954 Y119.066 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.8 I.774 J-.939 P1  F30000
G1 X126.172 Y118.423 Z15.8
G1 Z15.4
M73 P85 R3
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1414
G1 X126.172 Y120.051 E.05401
G1 X124.073 Y122.15 E.09848
G1 X124.073 Y120.403 E.05796
G1 X126.172 Y122.502 E.09848
G1 X126.172 Y122.826 E.01075
G1 X124.868 Y122.826 E.04327
G1 X124.073 Y116.103 F30000
G1 F1414
G1 X124.073 Y114.474 E.05401
G1 X124.82 Y113.727 E.03506
G1 X125.073 Y113.727 E.00838
G1 X127.672 Y116.326 E.12194
G1 X129.897 Y116.326 E.0738
G1 X132.496 Y113.727 E.12194
G1 X132.748 Y113.727 E.00838
G1 X139.172 Y120.15 E.30133
G1 X139.172 Y122.403 E.07472
G1 X138.748 Y122.826 E.01986
G1 X134.172 Y122.826 E.15182
G1 X134.073 Y122.727 E.00466
G1 X134.073 Y119.826 E.09622
G1 X139.172 Y114.727 E.23922
G1 X139.172 Y113.727 E.03317
G1 X138.544 Y113.727 E.02084
; CHANGE_LAYER
; Z_HEIGHT: 15.4167
; LAYER_HEIGHT: 0.0166674
; WIPE_START
G1 F24000
G1 X139.172 Y113.727 E-.23876
G1 X139.172 Y114.727 E-.38
G1 X138.909 Y114.99 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 132/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L132
M991 S0 P131 ;notify layer change
G17
G3 Z15.8 I1.204 J-.175 P1  F30000
G1 X138.503 Y112.196 Z15.8
G1 Z15.417
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.276667
M73 P85 R2
G1 F1566
G1 X137.058 Y112.196 E.05872
G3 X137.81 Y110.565 I.704 J-.664 E.09351
G3 X138.538 Y112.149 I-.09 J1.001 E.08579
; WIPE_START
G1 F24000
G1 X137.058 Y112.196 E-.56277
G1 X136.841 Y111.725 E-.19723
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.817 I-.058 J-1.216 P1  F30000
G1 X126.892 Y112.196 Z15.817
G1 Z15.417
G1 E.8 F1800
G1 F1566
G1 X123.352 Y112.196 E.14391
G3 X124.269 Y111.874 I.742 J.648 E.0413
G1 X124.39 Y111.718 E.00806
G3 X125.678 Y110.318 I1.069 J-.309 E.09271
G3 X125.859 Y110.313 I.115 J1.071 E.00738
G3 X126.61 Y111.847 I-.076 J.988 E.08365
G2 X126.847 Y112.157 I1.025 J-.538 E.01594
; CHANGE_LAYER
; Z_HEIGHT: 15.6
; LAYER_HEIGHT: 0.183333
; WIPE_START
G1 F24000
G1 X124.847 Y112.179 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 133/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L133
M991 S0 P132 ;notify layer change
G17
G3 Z15.817 I-1.141 J.424 P1  F30000
G1 X126.52 Y116.674 Z15.817
G1 Z15.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1566
G1 X126.52 Y123.174 E.21562
G1 X123.724 Y123.174 E.09274
G1 X123.724 Y113.379 E.32495
G1 X139.52 Y113.379 E.52398
G1 X139.52 Y123.174 E.32495
G1 X133.724 Y123.174 E.19226
G1 X133.724 Y116.674 E.21562
G1 X126.58 Y116.674 E.23698
G1 X126.912 Y117.067 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1566
G1 X126.912 Y123.567 E.19973
G1 X123.332 Y123.567 E.11
G1 X123.332 Y112.987 E.32509
G1 X139.912 Y112.987 E.50946
G1 X139.912 Y123.567 E.32509
G1 X133.332 Y123.567 E.20219
G1 X133.332 Y117.067 E.19973
G1 X126.972 Y117.067 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X126.954 Y119.066 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16 I.774 J-.939 P1  F30000
G1 X126.172 Y118.423 Z16
G1 Z15.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1566
G1 X126.172 Y120.051 E.05401
G1 X124.073 Y122.15 E.09848
G1 X124.073 Y120.403 E.05796
G1 X126.172 Y122.502 E.09848
G1 X126.172 Y122.826 E.01075
G1 X124.868 Y122.826 E.04327
G1 X124.073 Y116.103 F30000
G1 F1566
G1 X124.073 Y114.474 E.05401
G1 X124.82 Y113.727 E.03506
G1 X125.073 Y113.727 E.00838
G1 X127.672 Y116.326 E.12194
G1 X129.897 Y116.326 E.0738
G1 X132.496 Y113.727 E.12194
G1 X132.748 Y113.727 E.00838
G1 X139.172 Y120.15 E.30133
G1 X139.172 Y122.403 E.07472
G1 X138.748 Y122.826 E.01986
G1 X134.172 Y122.826 E.15182
G1 X134.073 Y122.727 E.00466
G1 X134.073 Y119.826 E.09622
G1 X139.172 Y114.727 E.23922
G1 X139.172 Y113.727 E.03317
G1 X138.544 Y113.727 E.02084
; CHANGE_LAYER
; Z_HEIGHT: 15.6933
; LAYER_HEIGHT: 0.0933332
; WIPE_START
G1 F24000
G1 X139.172 Y113.727 E-.23876
G1 X139.172 Y114.727 E-.38
G1 X138.909 Y114.99 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 134/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L134
M991 S0 P133 ;notify layer change
G17
G3 Z16 I1.207 J-.152 P1  F30000
M73 P86 R2
G1 X138.557 Y112.196 Z16
G1 Z15.693
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.276667
G1 F1562
G1 X137.068 Y112.196 E.06053
G3 X137.841 Y110.654 I.723 J-.602 E.08871
G3 X138.589 Y112.147 I-.088 J.978 E.08117
; WIPE_START
G1 F24000
G1 X137.068 Y112.196 E-.57846
G1 X136.895 Y111.751 E-.18154
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.093 I-.054 J-1.216 P1  F30000
G1 X126.86 Y112.196 Z16.093
G1 Z15.693
G1 E.8 F1800
G1 F1562
G1 X123.399 Y112.179 E.14068
G3 X124.173 Y111.888 I.692 J.664 E.03477
G2 X124.222 Y111.48 I-.306 J-.244 E.01758
G3 X125.596 Y110.404 I1.09 J-.023 E.08219
G3 X125.888 Y110.379 I.228 J.942 E.01198
G3 X126.618 Y111.881 I-.075 J.965 E.08193
G2 X126.814 Y112.157 I.749 J-.325 E.01387
; CHANGE_LAYER
; Z_HEIGHT: 15.8
; LAYER_HEIGHT: 0.106667
; WIPE_START
G1 F24000
G1 X124.814 Y112.17 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 135/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L135
M991 S0 P134 ;notify layer change
G17
G3 Z16.093 I-1.138 J.431 P1  F30000
G1 X126.52 Y116.674 Z16.093
G1 Z15.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1562
G1 X126.52 Y123.174 E.21562
G1 X123.724 Y123.174 E.09274
G1 X123.724 Y113.379 E.32495
G1 X139.52 Y113.379 E.52398
G1 X139.52 Y123.174 E.32495
G1 X133.724 Y123.174 E.19226
G1 X133.724 Y116.674 E.21562
G1 X126.58 Y116.674 E.23698
G1 X126.912 Y117.067 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1562
G1 X126.912 Y123.567 E.19973
G1 X123.332 Y123.567 E.11
G1 X123.332 Y112.987 E.32509
G1 X139.912 Y112.987 E.50946
G1 X139.912 Y123.567 E.32509
G1 X133.332 Y123.567 E.20219
G1 X133.332 Y117.067 E.19973
G1 X126.972 Y117.067 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X126.954 Y119.066 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.2 I.774 J-.939 P1  F30000
G1 X126.172 Y118.423 Z16.2
G1 Z15.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1562
G1 X126.172 Y120.051 E.05401
G1 X124.073 Y122.15 E.09848
G1 X124.073 Y120.403 E.05796
G1 X126.172 Y122.502 E.09848
G1 X126.172 Y122.826 E.01075
G1 X124.868 Y122.826 E.04327
G1 X124.073 Y116.103 F30000
G1 F1562
G1 X124.073 Y114.474 E.05401
G1 X124.82 Y113.727 E.03506
G1 X125.073 Y113.727 E.00838
G1 X127.672 Y116.326 E.12194
G1 X129.897 Y116.326 E.0738
G1 X132.496 Y113.727 E.12194
G1 X132.748 Y113.727 E.00838
G1 X139.172 Y120.15 E.30133
G1 X139.172 Y122.403 E.07472
G1 X138.748 Y122.826 E.01986
G1 X134.172 Y122.826 E.15182
G1 X134.073 Y122.727 E.00466
G1 X134.073 Y119.826 E.09622
G1 X139.172 Y114.727 E.23922
G1 X139.172 Y113.727 E.03317
G1 X138.544 Y113.727 E.02084
; CHANGE_LAYER
; Z_HEIGHT: 15.97
; LAYER_HEIGHT: 0.17
; WIPE_START
G1 F24000
G1 X139.172 Y113.727 E-.23876
G1 X139.172 Y114.727 E-.38
G1 X138.909 Y114.99 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 136/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L136
M991 S0 P135 ;notify layer change
G17
G3 Z16.2 I1.21 J-.131 P1  F30000
G1 X138.607 Y112.196 Z16.2
G1 Z15.97
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.276667
G1 F1560
G1 X137.082 Y112.196 E.06199
G3 X137.872 Y110.744 I.742 J-.537 E.08378
G3 X138.636 Y112.145 I-.091 J.958 E.07644
; WIPE_START
G1 F24000
G1 X137.082 Y112.196 E-.59069
G1 X136.935 Y111.776 E-.16931
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.37 I-.051 J-1.216 P1  F30000
G1 X126.828 Y112.196 Z16.37
M73 P87 R2
G1 Z15.97
G1 E.8 F1800
G1 F1560
G1 X123.417 Y112.196 E.13865
G3 X124.087 Y111.905 I.687 J.664 E.03046
G2 X124.123 Y111.519 I-.326 J-.225 E.01643
G3 X125.524 Y110.504 I1.042 J-.037 E.08298
G3 X125.918 Y110.445 I.33 J.861 E.01632
G3 X126.628 Y111.915 I-.074 J.942 E.08011
G2 X126.784 Y112.156 I.648 J-.248 E.01174
; CHANGE_LAYER
; Z_HEIGHT: 16
; LAYER_HEIGHT: 0.0299997
; WIPE_START
G1 F24000
G1 X124.784 Y112.179 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 137/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L137
M991 S0 P136 ;notify layer change
G17
G3 Z16.37 I-1.135 J.438 P1  F30000
G1 X126.52 Y116.674 Z16.37
G1 Z16
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1560
G1 X126.52 Y123.174 E.21562
G1 X123.724 Y123.174 E.09274
G1 X123.724 Y113.379 E.32495
G1 X139.52 Y113.379 E.52398
G1 X139.52 Y123.174 E.32495
G1 X133.724 Y123.174 E.19226
G1 X133.724 Y116.674 E.21562
G1 X126.58 Y116.674 E.23698
G1 X126.912 Y117.067 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1560
G1 X126.912 Y123.567 E.19973
G1 X123.332 Y123.567 E.11
G1 X123.332 Y112.987 E.32509
G1 X139.912 Y112.987 E.50946
G1 X139.912 Y123.567 E.32509
G1 X133.332 Y123.567 E.20219
G1 X133.332 Y117.067 E.19973
G1 X126.972 Y117.067 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X126.954 Y119.066 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.4 I.774 J-.939 P1  F30000
G1 X126.172 Y118.423 Z16.4
G1 Z16
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1560
G1 X126.172 Y120.051 E.05401
G1 X124.073 Y122.15 E.09848
G1 X124.073 Y120.403 E.05796
G1 X126.172 Y122.502 E.09848
G1 X126.172 Y122.826 E.01075
G1 X124.868 Y122.826 E.04327
G1 X124.073 Y116.103 F30000
G1 F1560
G1 X124.073 Y114.474 E.05401
G1 X124.82 Y113.727 E.03506
G1 X125.073 Y113.727 E.00838
G1 X127.672 Y116.326 E.12194
G1 X129.897 Y116.326 E.0738
G1 X132.496 Y113.727 E.12194
G1 X132.748 Y113.727 E.00838
G1 X139.172 Y120.15 E.30133
G1 X139.172 Y122.403 E.07472
G1 X138.748 Y122.826 E.01986
G1 X134.172 Y122.826 E.15182
G1 X134.073 Y122.727 E.00466
G1 X134.073 Y119.826 E.09622
G1 X139.172 Y114.727 E.23922
G1 X139.172 Y113.727 E.03317
G1 X138.544 Y113.727 E.02084
; CHANGE_LAYER
; Z_HEIGHT: 16.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X139.172 Y113.727 E-.23876
G1 X139.172 Y114.727 E-.38
G1 X138.909 Y114.99 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 138/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L138
M991 S0 P137 ;notify layer change
G17
G3 Z16.4 I-.164 J-1.206 P1  F30000
G1 X126.52 Y116.674 Z16.4
G1 Z16.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1414
G1 X126.52 Y123.174 E.21562
G1 X123.724 Y123.174 E.09274
G1 X123.724 Y113.379 E.32495
G1 X139.52 Y113.379 E.52398
G1 X139.52 Y123.174 E.32495
G1 X133.724 Y123.174 E.19226
G1 X133.724 Y116.674 E.21562
G1 X126.58 Y116.674 E.23698
G1 X126.912 Y117.067 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1414
G1 X126.912 Y123.567 E.19973
G1 X123.332 Y123.567 E.11
G1 X123.332 Y112.987 E.32509
G1 X139.912 Y112.987 E.50946
G1 X139.912 Y123.567 E.32509
G1 X133.332 Y123.567 E.20219
G1 X133.332 Y117.067 E.19973
G1 X126.972 Y117.067 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X126.954 Y119.066 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.6 I.774 J-.939 P1  F30000
G1 X126.172 Y118.423 Z16.6
G1 Z16.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1414
G1 X126.172 Y120.051 E.05401
G1 X124.073 Y122.15 E.09848
G1 X124.073 Y120.403 E.05796
G1 X126.172 Y122.502 E.09848
G1 X126.172 Y122.826 E.01075
G1 X124.868 Y122.826 E.04327
G1 X124.073 Y116.103 F30000
G1 F1414
G1 X124.073 Y114.474 E.05401
G1 X124.82 Y113.727 E.03506
G1 X125.073 Y113.727 E.00838
G1 X127.672 Y116.326 E.12194
G1 X129.897 Y116.326 E.0738
G1 X132.496 Y113.727 E.12194
G1 X132.748 Y113.727 E.00838
G1 X139.172 Y120.15 E.30133
G1 X139.172 Y122.403 E.07472
G1 X138.748 Y122.826 E.01986
G1 X134.172 Y122.826 E.15182
G1 X134.073 Y122.727 E.00466
G1 X134.073 Y119.826 E.09622
G1 X139.172 Y114.727 E.23922
G1 X139.172 Y113.727 E.03317
G1 X138.544 Y113.727 E.02084
; CHANGE_LAYER
; Z_HEIGHT: 16.2467
; LAYER_HEIGHT: 0.0466652
; WIPE_START
G1 F24000
G1 X139.172 Y113.727 E-.23876
G1 X139.172 Y114.727 E-.38
G1 X138.909 Y114.99 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 139/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L139
M991 S0 P138 ;notify layer change
G17
M73 P88 R2
G3 Z16.6 I1.212 J-.111 P1  F30000
G1 X138.653 Y112.196 Z16.6
G1 Z16.247
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.276667
G1 F1557
G1 X137.088 Y112.174 E.06359
G3 X137.904 Y110.836 I.767 J-.451 E.07797
G3 X138.678 Y112.143 I-.091 J.936 E.07185
; WIPE_START
G1 F24000
G1 X137.088 Y112.174 E-.604
G1 X136.984 Y111.777 E-.156
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.647 I-.05 J-1.216 P1  F30000
G1 X126.794 Y112.196 Z16.647
G1 Z16.247
G1 E.8 F1800
G1 F1557
G1 X123.451 Y112.196 E.13589
G3 X123.997 Y111.936 I.638 J.634 E.02509
G2 X124.027 Y111.558 I-.343 J-.217 E.016
G3 X125.468 Y110.614 I1.003 J-.041 E.0842
G3 X125.949 Y110.511 I.418 J.781 E.02029
G3 X126.637 Y111.952 I-.073 J.919 E.07845
G2 X126.746 Y112.159 I.344 J-.048 E.00971
; CHANGE_LAYER
; Z_HEIGHT: 16.4
; LAYER_HEIGHT: 0.153334
; WIPE_START
G1 F24000
G1 X124.746 Y112.182 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 140/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L140
M991 S0 P139 ;notify layer change
G17
G3 Z16.647 I-1.132 J.447 P1  F30000
G1 X126.52 Y116.674 Z16.647
G1 Z16.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1557
G1 X126.52 Y123.174 E.21562
G1 X123.724 Y123.174 E.09274
G1 X123.724 Y113.379 E.32495
G1 X139.52 Y113.379 E.52398
G1 X139.52 Y123.174 E.32495
G1 X133.724 Y123.174 E.19226
G1 X133.724 Y116.674 E.21562
G1 X126.58 Y116.674 E.23698
G1 X126.912 Y117.067 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1557
G1 X126.912 Y123.567 E.19973
G1 X123.332 Y123.567 E.11
G1 X123.332 Y112.987 E.32509
G1 X139.912 Y112.987 E.50946
G1 X139.912 Y123.567 E.32509
G1 X133.332 Y123.567 E.20219
G1 X133.332 Y117.067 E.19973
G1 X126.972 Y117.067 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X126.954 Y119.066 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.8 I.774 J-.939 P1  F30000
G1 X126.172 Y118.423 Z16.8
G1 Z16.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1557
G1 X126.172 Y120.051 E.05401
G1 X124.073 Y122.15 E.09848
G1 X124.073 Y120.403 E.05796
G1 X126.172 Y122.502 E.09848
G1 X126.172 Y122.826 E.01075
G1 X124.868 Y122.826 E.04327
G1 X124.073 Y116.103 F30000
G1 F1557
G1 X124.073 Y114.474 E.05401
G1 X124.82 Y113.727 E.03506
G1 X125.073 Y113.727 E.00838
G1 X127.672 Y116.326 E.12194
G1 X129.897 Y116.326 E.0738
G1 X132.496 Y113.727 E.12194
G1 X132.748 Y113.727 E.00838
G1 X139.172 Y120.15 E.30133
G1 X139.172 Y122.403 E.07472
G1 X138.748 Y122.826 E.01986
G1 X134.172 Y122.826 E.15182
G1 X134.073 Y122.727 E.00466
G1 X134.073 Y119.826 E.09622
G1 X139.172 Y114.727 E.23922
G1 X139.172 Y113.727 E.03317
G1 X138.544 Y113.727 E.02084
; CHANGE_LAYER
; Z_HEIGHT: 16.5233
; LAYER_HEIGHT: 0.123333
; WIPE_START
G1 F24000
G1 X139.172 Y113.727 E-.23876
G1 X139.172 Y114.727 E-.38
G1 X138.909 Y114.99 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 141/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L141
M991 S0 P140 ;notify layer change
G17
G3 Z16.8 I1.213 J-.093 P1  F30000
G1 X138.694 Y112.196 Z16.8
G1 Z16.523
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.276667
G1 F1554
G1 X137.118 Y112.182 E.06404
G3 X137.936 Y110.929 I.767 J-.393 E.07367
G3 X138.715 Y112.141 I-.087 J.912 E.06735
; WIPE_START
G1 F24000
G1 X137.118 Y112.182 E-.60689
G1 X137.04 Y111.787 E-.15311
; WIPE_END
M73 P89 R2
G1 E-.04 F1800
G17
G3 Z16.923 I.025 J-1.217 P1  F30000
G1 X126.803 Y111.575 Z16.923
G1 Z16.523
G1 E.8 F1800
G1 F1554
G3 X126.648 Y111.988 I-.893 J-.1 E.01811
G2 X126.759 Y112.196 I.258 J-.005 E.00997
G1 X123.491 Y112.191 E.13288
G2 X123.99 Y111.83 I-.511 J-1.234 E.02528
G3 X125.436 Y110.723 I.923 J-.292 E.09634
G3 X125.981 Y110.579 I.49 J.749 E.02334
G3 X126.808 Y111.517 I-.071 J.896 E.05619
; CHANGE_LAYER
; Z_HEIGHT: 16.6
; LAYER_HEIGHT: 0.0766678
; WIPE_START
G1 F24000
G1 X126.648 Y111.988 E-.18914
G1 X126.759 Y112.196 E-.08972
G1 X125.493 Y112.194 E-.48114
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 142/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L142
M991 S0 P141 ;notify layer change
G17
G3 Z16.923 I-1.186 J.272 P1  F30000
G1 X126.52 Y116.674 Z16.923
G1 Z16.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1554
G1 X126.52 Y123.174 E.21562
G1 X123.724 Y123.174 E.09274
G1 X123.724 Y113.379 E.32495
G1 X139.52 Y113.379 E.52398
G1 X139.52 Y123.174 E.32495
G1 X133.724 Y123.174 E.19226
G1 X133.724 Y116.674 E.21562
G1 X126.58 Y116.674 E.23698
G1 X126.912 Y117.067 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1554
G1 X126.912 Y123.567 E.19973
G1 X123.332 Y123.567 E.11
G1 X123.332 Y112.987 E.32509
G1 X139.912 Y112.987 E.50946
G1 X139.912 Y123.567 E.32509
G1 X133.332 Y123.567 E.20219
G1 X133.332 Y117.067 E.19973
G1 X126.972 Y117.067 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X126.954 Y119.066 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17 I.774 J-.939 P1  F30000
G1 X126.172 Y118.423 Z17
G1 Z16.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1554
G1 X126.172 Y120.051 E.05401
G1 X124.073 Y122.15 E.09848
G1 X124.073 Y120.403 E.05796
G1 X126.172 Y122.502 E.09848
G1 X126.172 Y122.826 E.01075
G1 X124.868 Y122.826 E.04327
G1 X124.073 Y116.103 F30000
G1 F1554
G1 X124.073 Y114.474 E.05401
G1 X124.82 Y113.727 E.03506
G1 X125.073 Y113.727 E.00838
G1 X127.672 Y116.326 E.12194
G1 X129.897 Y116.326 E.0738
G1 X132.496 Y113.727 E.12194
G1 X132.748 Y113.727 E.00838
G1 X139.172 Y120.15 E.30133
G1 X139.172 Y122.403 E.07472
G1 X138.748 Y122.826 E.01986
G1 X134.172 Y122.826 E.15182
G1 X134.073 Y122.727 E.00466
G1 X134.073 Y119.826 E.09622
G1 X139.172 Y114.727 E.23922
G1 X139.172 Y113.727 E.03317
G1 X138.544 Y113.727 E.02084
; CHANGE_LAYER
; Z_HEIGHT: 16.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X139.172 Y113.727 E-.23876
G1 X139.172 Y114.727 E-.38
G1 X138.909 Y114.99 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 143/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L143
M991 S0 P142 ;notify layer change
G17
G3 Z17 I1.214 J-.078 P1  F30000
G1 X138.73 Y112.196 Z17
G1 Z16.8
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.276667
G1 F1551
G1 X137.153 Y112.192 E.06412
G3 X137.969 Y111.024 I.767 J-.333 E.06934
G3 X138.747 Y112.139 I-.09 J.892 E.06277
; WIPE_START
G1 F24000
G1 X137.153 Y112.192 E-.60603
G1 X137.098 Y111.791 E-.15397
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.2 I.021 J-1.217 P1  F30000
G1 X126.811 Y111.616 Z17.2
G1 Z16.8
G1 E.8 F1800
G1 F1551
G3 X126.658 Y112.019 I-.867 J-.1 E.01771
G2 X126.723 Y112.196 I.134 J.051 E.00839
G1 X123.521 Y112.196 E.13019
G2 X123.898 Y111.879 I-.52 J-1 E.02018
G3 X125.3 Y110.846 I.852 J-.312 E.09494
G3 X126.014 Y110.647 I.734 J1.248 E.03046
G3 X126.816 Y111.558 I-.07 J.87 E.05456
; WIPE_START
G1 F24000
G1 X126.658 Y112.019 E-.18536
G1 X126.723 Y112.196 E-.07185
G1 X125.4 Y112.196 E-.50279
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.2 I-1.181 J.295 P1  F30000
G1 X126.52 Y116.674 Z17.2
G1 Z16.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1551
G1 X126.52 Y123.174 E.21562
G1 X123.724 Y123.174 E.09274
G1 X123.724 Y113.379 E.32495
G1 X139.52 Y113.379 E.52398
G1 X139.52 Y123.174 E.32495
G1 X133.724 Y123.174 E.19226
G1 X133.724 Y116.674 E.21562
G1 X126.58 Y116.674 E.23698
G1 X126.912 Y117.067 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1551
G1 X126.912 Y123.567 E.19973
G1 X123.332 Y123.567 E.11
G1 X123.332 Y112.987 E.32509
G1 X139.912 Y112.987 E.50946
G1 X139.912 Y123.567 E.32509
M73 P90 R2
G1 X133.332 Y123.567 E.20219
G1 X133.332 Y117.067 E.19973
G1 X126.972 Y117.067 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X126.954 Y119.066 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.2 I.774 J-.939 P1  F30000
G1 X126.172 Y118.423 Z17.2
G1 Z16.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1551
G1 X126.172 Y120.051 E.05401
G1 X124.073 Y122.15 E.09848
G1 X124.073 Y120.403 E.05796
G1 X126.172 Y122.502 E.09848
G1 X126.172 Y122.826 E.01075
G1 X124.868 Y122.826 E.04327
G1 X124.073 Y116.103 F30000
G1 F1551
G1 X124.073 Y114.474 E.05401
G1 X124.82 Y113.727 E.03506
G1 X125.073 Y113.727 E.00838
G1 X127.672 Y116.326 E.12194
G1 X129.897 Y116.326 E.0738
G1 X132.496 Y113.727 E.12194
G1 X132.748 Y113.727 E.00838
G1 X139.172 Y120.15 E.30133
G1 X139.172 Y122.403 E.07472
G1 X138.748 Y122.826 E.01986
G1 X134.172 Y122.826 E.15182
G1 X134.073 Y122.727 E.00466
G1 X134.073 Y119.826 E.09622
G1 X139.172 Y114.727 E.23922
G1 X139.172 Y113.727 E.03317
G1 X138.544 Y113.727 E.02084
; CHANGE_LAYER
; Z_HEIGHT: 17
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X139.172 Y113.727 E-.23876
G1 X139.172 Y114.727 E-.38
G1 X138.909 Y114.99 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 144/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L144
M991 S0 P143 ;notify layer change
G17
G3 Z17.2 I1.217 J0 P1  F30000
G1 X138.909 Y112.188 Z17.2
G1 Z17
M73 P90 R1
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F1618
G1 X136.919 Y112.188 E.06116
G1 X136.919 Y111.573 E.01889
G2 X137.519 Y111.243 I-.126 J-.939 E.02153
G3 X138.003 Y111.122 I.429 J.691 E.01558
G3 X138.771 Y111.573 I-.168 J1.166 E.02806
G1 X139.326 Y111.573 E.01705
G1 X139.326 Y112.188 E.01889
G1 X138.969 Y112.188 E.01096
G1 X138.762 Y112.169 F30000
G1 F1618
G1 X138.762 Y111.762 E.01252
G3 X138.254 Y111.393 I8.959 J-12.867 E.01929
G2 X137.885 Y111.311 I-.319 J.568 E.01179
G1 X137.885 Y112.169 E.02636
; WIPE_START
G1 F24000
G1 X137.885 Y111.311 E-.32604
G1 X138.254 Y111.393 E-.14372
G1 X138.593 Y111.703 E-.17441
G1 X138.762 Y111.762 E-.0681
G1 X138.762 Y111.887 E-.04774
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.4 I.029 J-1.217 P1  F30000
G1 X126.83 Y111.607 Z17.4
G1 Z17
G1 E.8 F1800
G1 F1618
G3 X126.712 Y112.151 I-.98 J.073 E.01735
G1 X123.564 Y112.188 E.09673
G2 X123.732 Y111.575 I-.225 J-.391 E.02165
G3 X125.264 Y110.94 I.93 J.079 E.06275
G3 X126.048 Y110.717 I.792 J1.294 E.02535
G3 X126.823 Y111.547 I-.198 J.962 E.03723
G1 X126.483 Y112.169 F30000
G1 F1618
G1 X126.462 Y111.113 E.03247
G2 X125.606 Y111.022 I-.48 J.447 E.02888
G1 X125.606 Y111.999 E.03003
G1 X124.728 Y111.999 E.02695
G1 X124.728 Y110.76 E.0381
; WIPE_START
G1 F24000
G1 X124.728 Y111.999 E-.47115
G1 X125.489 Y111.999 E-.28885
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.4 I-1.188 J.262 P1  F30000
G1 X126.52 Y116.674 Z17.4
G1 Z17
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1618
G1 X126.52 Y123.174 E.21562
G1 X123.724 Y123.174 E.09274
G1 X123.724 Y113.379 E.32495
G1 X139.52 Y113.379 E.52398
G1 X139.52 Y123.174 E.32495
G1 X133.724 Y123.174 E.19226
G1 X133.724 Y116.674 E.21562
G1 X126.58 Y116.674 E.23698
G1 X126.912 Y117.067 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1618
G1 X126.912 Y123.567 E.19973
G1 X123.332 Y123.567 E.11
G1 X123.332 Y112.987 E.32509
G1 X139.912 Y112.987 E.50946
G1 X139.912 Y123.567 E.32509
G1 X133.332 Y123.567 E.20219
G1 X133.332 Y117.067 E.19973
G1 X126.972 Y117.067 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X126.954 Y119.066 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.4 I.774 J-.939 P1  F30000
G1 X126.172 Y118.423 Z17.4
G1 Z17
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1618
G1 X126.172 Y120.051 E.05401
G1 X124.073 Y122.15 E.09848
G1 X124.073 Y120.403 E.05796
G1 X126.172 Y122.502 E.09848
G1 X126.172 Y122.826 E.01075
G1 X124.868 Y122.826 E.04327
G1 X124.073 Y116.103 F30000
G1 F1618
G1 X124.073 Y114.474 E.05401
G1 X124.82 Y113.727 E.03506
G1 X125.073 Y113.727 E.00838
G1 X127.672 Y116.326 E.12194
G1 X129.897 Y116.326 E.0738
G1 X132.496 Y113.727 E.12194
G1 X132.748 Y113.727 E.00838
G1 X139.172 Y120.15 E.30133
G1 X139.172 Y122.403 E.07472
G1 X138.748 Y122.826 E.01986
G1 X134.172 Y122.826 E.15182
G1 X134.073 Y122.727 E.00466
G1 X134.073 Y119.826 E.09622
G1 X139.172 Y114.727 E.23922
G1 X139.172 Y113.727 E.03317
G1 X138.544 Y113.727 E.02084
; CHANGE_LAYER
; Z_HEIGHT: 17.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X139.172 Y113.727 E-.23876
G1 X139.172 Y114.727 E-.38
G1 X138.909 Y114.99 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 145/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L145
M991 S0 P144 ;notify layer change
G17
G3 Z17.4 I1.217 J.018 P1  F30000
G1 X138.95 Y112.188 Z17.4
G1 Z17.2
G1 E.8 F1800
; FEATURE: Support interface
; LINE_WIDTH: 0.42
M73 P91 R1
G1 F1573
G1 X139.326 Y112.188 E.01153
G1 X139.326 Y111.573 E.01889
G1 X138.762 Y111.573 E.01733
G1 X138.762 Y112.188 E.01889
G1 X137.885 Y112.188 E.02695
G1 X137.884 Y111.195 E.03051
G2 X137.249 Y111.573 I.155 J.983 E.02327
G1 X137.008 Y111.573 E.00741
G1 X137.008 Y112.188 E.01889
; WIPE_START
G1 F24000
G1 X137.008 Y111.573 E-.23367
G1 X137.249 Y111.573 E-.09167
G1 X137.596 Y111.287 E-.17108
G1 X137.884 Y111.195 E-.11472
G1 X137.884 Y111.587 E-.14886
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.6 I-.065 J-1.215 P1  F30000
G1 X126.671 Y112.188 Z17.6
G1 Z17.2
G1 E.8 F1800
G1 F1573
G1 X126.72 Y112.166 E.00166
G2 X126.483 Y110.899 I-.769 J-.511 E.04384
G1 X126.483 Y112.188 E.0396
G1 X125.606 Y112.188 E.02695
G1 X125.606 Y110.874 E.04037
G1 X125.273 Y111.069 E.01185
G2 X124.728 Y110.802 I-.999 J1.351 E.01873
G1 X124.728 Y112.188 E.04257
G1 X123.851 Y112.188 E.02695
G1 X123.851 Y111.057 E.03474
G2 X123.667 Y112.061 I.694 J.646 E.03309
G1 X123.555 Y112.188 E.00522
G1 X123.663 Y112.188 E.00332
; WIPE_START
G1 F24000
G1 X123.555 Y112.188 E-.04101
G1 X123.667 Y112.061 E-.06457
G1 X123.621 Y111.516 E-.20785
G1 X123.851 Y111.057 E-.19493
G1 X123.851 Y111.72 E-.25165
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.6 I-1.071 J.577 P1  F30000
G1 X126.52 Y116.674 Z17.6
G1 Z17.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1573
G1 X126.52 Y123.174 E.21562
G1 X123.724 Y123.174 E.09274
G1 X123.724 Y113.379 E.32495
G1 X139.52 Y113.379 E.52398
G1 X139.52 Y123.174 E.32495
G1 X133.724 Y123.174 E.19226
G1 X133.724 Y116.674 E.21562
G1 X126.58 Y116.674 E.23698
G1 X126.912 Y117.067 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1573
G1 X126.912 Y123.567 E.19973
G1 X123.332 Y123.567 E.11
G1 X123.332 Y112.987 E.32509
G1 X139.912 Y112.987 E.50946
G1 X139.912 Y123.567 E.32509
G1 X133.332 Y123.567 E.20219
G1 X133.332 Y117.067 E.19973
G1 X126.972 Y117.067 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X126.954 Y119.066 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.6 I.774 J-.939 P1  F30000
G1 X126.172 Y118.423 Z17.6
G1 Z17.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1573
G1 X126.172 Y120.051 E.05401
G1 X124.073 Y122.15 E.09848
G1 X124.073 Y120.403 E.05796
G1 X126.172 Y122.502 E.09848
G1 X126.172 Y122.826 E.01075
G1 X124.868 Y122.826 E.04327
G1 X124.073 Y116.103 F30000
G1 F1573
G1 X124.073 Y114.474 E.05401
G1 X124.82 Y113.727 E.03506
G1 X125.073 Y113.727 E.00838
G1 X127.672 Y116.326 E.12194
G1 X129.897 Y116.326 E.0738
G1 X132.496 Y113.727 E.12194
G1 X132.748 Y113.727 E.00838
G1 X139.172 Y120.15 E.30133
G1 X139.172 Y122.403 E.07472
G1 X138.748 Y122.826 E.01986
G1 X134.172 Y122.826 E.15182
G1 X134.073 Y122.727 E.00466
G1 X134.073 Y119.826 E.09622
G1 X139.172 Y114.727 E.23922
G1 X139.172 Y113.727 E.03317
G1 X138.544 Y113.727 E.02084
; CHANGE_LAYER
; Z_HEIGHT: 17.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X139.172 Y113.727 E-.23876
G1 X139.172 Y114.727 E-.38
G1 X138.909 Y114.99 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 146/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L146
M991 S0 P145 ;notify layer change
G17
G3 Z17.6 I1.217 J.018 P1  F30000
G1 X138.95 Y112.188 Z17.6
G1 Z17.4
G1 E.8 F1800
; FEATURE: Support interface
; LINE_WIDTH: 0.42
G1 F1575
G1 X139.326 Y112.188 E.01153
G1 X139.326 Y111.573 E.01889
G1 X138.762 Y111.573 E.01733
G1 X138.762 Y112.188 E.01889
G1 X137.885 Y112.188 E.02695
G1 X137.873 Y111.283 E.02782
G2 X137.358 Y111.573 I.219 J.991 E.01843
G1 X137.008 Y111.573 E.01076
G1 X137.008 Y112.188 E.01889
; WIPE_START
G1 F24000
G1 X137.008 Y111.573 E-.23367
G1 X137.358 Y111.573 E-.13311
G1 X137.873 Y111.283 E-.22467
G1 X137.879 Y111.726 E-.16855
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.8 I-.05 J-1.216 P1  F30000
G1 X126.671 Y112.188 Z17.8
G1 Z17.4
G1 E.8 F1800
G1 F1575
G1 X126.766 Y112.188 E.00292
G2 X126.483 Y110.924 I-.758 J-.494 E.04438
G1 X126.483 Y112.188 E.03885
G1 X125.606 Y112.188 E.02695
G1 X125.606 Y110.948 E.03809
G1 X125.233 Y111.201 E.01382
G2 X124.728 Y110.891 I-1.79 J2.35 E.01822
G1 X124.728 Y112.188 E.03986
G1 X123.851 Y112.188 E.02695
G1 X123.829 Y110.963 E.03765
M73 P92 R1
G2 X123.382 Y112.188 I.274 J.795 E.04589
G1 X123.663 Y112.188 E.00864
; WIPE_START
G1 F24000
G1 X123.382 Y112.188 E-.10691
G1 X123.27 Y111.785 E-.15868
G1 X123.326 Y111.436 E-.13451
G1 X123.525 Y111.143 E-.13451
G1 X123.829 Y110.963 E-.13451
G1 X123.834 Y111.202 E-.09087
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.8 I-1.092 J.536 P1  F30000
G1 X126.52 Y116.674 Z17.8
G1 Z17.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1575
G1 X126.52 Y123.174 E.21562
G1 X123.724 Y123.174 E.09274
G1 X123.724 Y113.379 E.32495
G1 X139.52 Y113.379 E.52398
G1 X139.52 Y123.174 E.32495
G1 X133.724 Y123.174 E.19226
G1 X133.724 Y116.674 E.21562
G1 X126.58 Y116.674 E.23698
G1 X126.912 Y117.067 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1575
G1 X126.912 Y123.567 E.19973
G1 X123.332 Y123.567 E.11
G1 X123.332 Y112.987 E.32509
G1 X139.912 Y112.987 E.50946
G1 X139.912 Y123.567 E.32509
G1 X133.332 Y123.567 E.20219
G1 X133.332 Y117.067 E.19973
G1 X126.972 Y117.067 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X126.954 Y119.066 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.8 I.774 J-.939 P1  F30000
G1 X126.172 Y118.423 Z17.8
G1 Z17.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1575
G1 X126.172 Y120.051 E.05401
G1 X124.073 Y122.15 E.09848
G1 X124.073 Y120.403 E.05796
G1 X126.172 Y122.502 E.09848
G1 X126.172 Y122.826 E.01075
G1 X124.868 Y122.826 E.04327
G1 X124.073 Y116.103 F30000
G1 F1575
G1 X124.073 Y114.474 E.05401
G1 X124.82 Y113.727 E.03506
G1 X125.073 Y113.727 E.00838
G1 X127.672 Y116.326 E.12194
G1 X129.897 Y116.326 E.0738
G1 X132.496 Y113.727 E.12194
G1 X132.748 Y113.727 E.00838
G1 X139.172 Y120.15 E.30133
G1 X139.172 Y122.403 E.07472
G1 X138.748 Y122.826 E.01986
G1 X134.172 Y122.826 E.15182
G1 X134.073 Y122.727 E.00466
G1 X134.073 Y119.826 E.09622
G1 X139.172 Y114.727 E.23922
G1 X139.172 Y113.727 E.03317
G1 X138.544 Y113.727 E.02084
; CHANGE_LAYER
; Z_HEIGHT: 17.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X139.172 Y113.727 E-.23876
G1 X139.172 Y114.727 E-.38
G1 X138.909 Y114.99 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 147/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L147
M991 S0 P146 ;notify layer change
G17
G3 Z17.8 I-.164 J-1.206 P1  F30000
G1 X126.52 Y116.674 Z17.8
G1 Z17.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1414
G1 X126.52 Y123.174 E.21562
G1 X123.724 Y123.174 E.09274
G1 X123.724 Y113.379 E.32495
G1 X139.52 Y113.379 E.52398
G1 X139.52 Y123.174 E.32495
G1 X133.724 Y123.174 E.19226
G1 X133.724 Y116.674 E.21562
G1 X126.58 Y116.674 E.23698
G1 X126.912 Y117.067 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1414
G1 X126.912 Y123.567 E.19973
G1 X123.332 Y123.567 E.11
G1 X123.332 Y112.987 E.32509
G1 X139.912 Y112.987 E.50946
G1 X139.912 Y123.567 E.32509
G1 X133.332 Y123.567 E.20219
G1 X133.332 Y117.067 E.19973
G1 X126.972 Y117.067 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X126.954 Y119.066 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18 I.774 J-.939 P1  F30000
G1 X126.172 Y118.423 Z18
G1 Z17.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1414
G1 X126.172 Y120.051 E.05401
G1 X124.073 Y122.15 E.09848
G1 X124.073 Y120.403 E.05796
G1 X126.172 Y122.502 E.09848
G1 X126.172 Y122.826 E.01075
G1 X124.868 Y122.826 E.04327
G1 X124.073 Y116.103 F30000
G1 F1414
G1 X124.073 Y114.474 E.05401
G1 X124.82 Y113.727 E.03506
G1 X125.073 Y113.727 E.00838
G1 X127.672 Y116.326 E.12194
G1 X129.897 Y116.326 E.0738
G1 X132.496 Y113.727 E.12194
G1 X132.748 Y113.727 E.00838
G1 X139.172 Y120.15 E.30133
G1 X139.172 Y122.403 E.07472
G1 X138.748 Y122.826 E.01986
G1 X134.172 Y122.826 E.15182
G1 X134.073 Y122.727 E.00466
G1 X134.073 Y119.826 E.09622
G1 X139.172 Y114.727 E.23922
G1 X139.172 Y113.727 E.03317
G1 X138.544 Y113.727 E.02084
; CHANGE_LAYER
; Z_HEIGHT: 17.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X139.172 Y113.727 E-.23876
G1 X139.172 Y114.727 E-.38
G1 X138.909 Y114.99 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 148/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L148
M991 S0 P147 ;notify layer change
G17
G3 Z18 I-.164 J-1.206 P1  F30000
G1 X126.52 Y116.674 Z18
G1 Z17.8
M73 P93 R1
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1856
G1 X126.52 Y123.174 E.21562
G1 X123.724 Y123.174 E.09274
G1 X123.724 Y113.379 E.32495
G1 X124.724 Y113.379 E.03317
G1 X124.724 Y112.577 E.02661
M204 S5000
; FEATURE: Overhang wall
M106 S255
G1 F3000
G1 X124.724 Y112.379 E.00657
G1 X125.52 Y112.379 E.0264
G1 X125.52 Y112.577 E.00657
M106 S252.45
M204 S10000
; FEATURE: Inner wall
G1 F1856
G1 X125.52 Y113.379 E.02661
G1 X137.724 Y113.379 E.40483
G1 X137.724 Y112.577 E.02661
M204 S5000
; FEATURE: Overhang wall
M106 S255
G1 F3000
G1 X137.724 Y112.379 E.00657
G1 X138.52 Y112.379 E.0264
G1 X138.52 Y112.577 E.00657
M106 S252.45
M204 S10000
; FEATURE: Inner wall
G1 F1856
G1 X138.52 Y112.959 E.01269
G1 X138.52 Y113.379 E.01392
G1 X139.52 Y113.379 E.03317
G1 X139.52 Y123.174 E.32495
G1 X133.724 Y123.174 E.19226
G1 X133.724 Y116.674 E.21562
G1 X126.58 Y116.674 E.23698
G1 X126.912 Y117.067 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1856
G1 X126.912 Y123.567 E.19973
G1 X123.332 Y123.567 E.11
G1 X123.332 Y112.987 E.32509
G1 X124.332 Y112.987 E.03073
G1 X124.332 Y112.577 E.0126
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X124.332 Y111.987 E.01957
G1 X125.912 Y111.987 E.05241
G1 X125.912 Y112.577 E.01957
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1856
G1 X125.912 Y112.987 E.0126
G1 X137.332 Y112.987 E.3509
G1 X137.332 Y112.577 E.0126
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X137.332 Y111.987 E.01957
G1 X138.912 Y111.987 E.05241
G1 X138.912 Y112.577 E.01957
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1856
G1 X138.912 Y112.946 E.01134
G1 X138.912 Y112.987 E.00126
G1 X139.912 Y112.987 E.03073
G1 X139.912 Y123.567 E.32509
G1 X133.332 Y123.567 E.20219
G1 X133.332 Y117.067 E.19973
G1 X126.972 Y117.067 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X126.954 Y119.066 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18.2 I.238 J-1.194 P1  F30000
G1 X125.765 Y118.83 Z18.2
G1 Z17.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1856
G1 X125.765 Y120.458 E.05401
G1 X124.48 Y121.743 E.06029
G1 X124.48 Y120.81 E.03096
G1 X125.765 Y122.095 E.06029
G1 X125.765 Y122.419 E.01075
G1 X124.48 Y122.4 E.04264
; WIPE_START
G1 F24000
G1 X125.765 Y122.419 E-.48841
G1 X125.765 Y122.095 E-.12313
G1 X125.489 Y121.819 E-.14845
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18.2 I1.216 J-.048 P1  F30000
G1 X125.122 Y112.582 Z18.2
G1 Z17.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1856
G1 X125.122 Y113.582 E.03168
G1 X124.48 Y114.762 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1856
G1 X124.48 Y114.337 E.01409
G1 X125.683 Y114.337 E.03992
G1 X127.265 Y115.919 E.0742
G1 X130.304 Y115.919 E.10081
G1 X132.089 Y114.134 E.08375
G1 X133.156 Y114.134 E.03539
G1 X138.765 Y119.743 E.26314
G1 X138.765 Y115.134 E.1529
G1 X134.48 Y119.419 E.20103
G1 X134.48 Y121.047 E.05401
G1 X137.558 Y113.93 F30000
G1 F1856
G1 X139.172 Y113.93 E.05353
G1 X139.172 Y122.826 E.29509
G1 X134.073 Y122.826 E.16915
G1 X134.073 Y116.326 E.21562
G1 X126.172 Y116.326 E.26208
G1 X126.172 Y122.826 E.21562
G1 X124.073 Y122.826 E.06964
G1 X124.073 Y113.93 E.29509
G1 X125.686 Y113.93 E.05353
G1 X125.686 Y113.727 E.00675
G1 X137.558 Y113.727 E.39381
G1 X137.558 Y113.87 E.00476
G1 X138.122 Y113.582 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1856
G1 X138.122 Y112.582 E.03168
; CHANGE_LAYER
; Z_HEIGHT: 18
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X138.122 Y113.582 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 149/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L149
M991 S0 P148 ;notify layer change
G17
G3 Z18.2 I-.313 J-1.176 P1  F30000
G1 X126.52 Y116.674 Z18.2
G1 Z18
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1860
G1 X126.52 Y123.174 E.21562
G1 X123.724 Y123.174 E.09274
G1 X123.724 Y113.379 E.32495
G1 X124.724 Y113.379 E.03317
G1 X124.724 Y112.379 E.03317
G1 X125.52 Y112.379 E.0264
G1 X125.52 Y113.379 E.03317
G1 X137.724 Y113.379 E.40483
G1 X137.724 Y112.379 E.03317
G1 X138.52 Y112.379 E.0264
G1 X138.52 Y113.379 E.03317
G1 X139.52 Y113.379 E.03317
G1 X139.52 Y123.174 E.32495
G1 X133.724 Y123.174 E.19226
G1 X133.724 Y116.674 E.21562
G1 X126.58 Y116.674 E.23698
G1 X126.912 Y117.067 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1860
G1 X126.912 Y123.567 E.19973
G1 X123.332 Y123.567 E.11
G1 X123.332 Y112.987 E.32509
G1 X124.332 Y112.987 E.03073
G1 X124.332 Y111.987 E.03073
G1 X125.912 Y111.987 E.04855
M73 P94 R1
G1 X125.912 Y112.987 E.03073
G1 X137.332 Y112.987 E.3509
G1 X137.332 Y111.987 E.03073
G1 X138.912 Y111.987 E.04855
G1 X138.912 Y112.987 E.03073
G1 X139.912 Y112.987 E.03073
G1 X139.912 Y123.567 E.32509
G1 X133.332 Y123.567 E.20219
G1 X133.332 Y117.067 E.19973
G1 X126.972 Y117.067 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X126.954 Y119.066 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18.4 I.238 J-1.194 P1  F30000
G1 X125.765 Y118.83 Z18.4
G1 Z18
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1860
G1 X125.765 Y120.458 E.05401
G1 X124.48 Y121.743 E.06029
G1 X124.48 Y120.81 E.03096
G1 X125.765 Y122.095 E.06029
G1 X125.765 Y122.419 E.01075
G1 X124.48 Y122.4 E.04264
G1 X125.122 Y112.582 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1860
G1 X125.122 Y113.582 E.03168
G1 X124.48 Y114.762 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1860
G1 X124.48 Y114.337 E.01409
G1 X125.683 Y114.337 E.03992
G1 X127.265 Y115.919 E.0742
G1 X130.304 Y115.919 E.10081
G1 X132.089 Y114.134 E.08375
G1 X133.156 Y114.134 E.03539
G1 X138.765 Y119.743 E.26314
G1 X138.765 Y115.134 E.1529
G1 X134.48 Y119.419 E.20103
G1 X134.48 Y121.047 E.05401
G1 X137.558 Y113.93 F30000
G1 F1860
G1 X139.172 Y113.93 E.05353
G1 X139.172 Y122.826 E.29509
G1 X134.073 Y122.826 E.16915
G1 X134.073 Y116.326 E.21562
G1 X126.172 Y116.326 E.26208
G1 X126.172 Y122.826 E.21562
G1 X124.073 Y122.826 E.06964
G1 X124.073 Y113.93 E.29509
G1 X125.686 Y113.93 E.05353
G1 X125.686 Y113.727 E.00675
G1 X137.558 Y113.727 E.39381
G1 X137.558 Y113.87 E.00476
G1 X138.122 Y113.582 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1860
G1 X138.122 Y112.582 E.03168
; CHANGE_LAYER
; Z_HEIGHT: 18.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X138.122 Y113.582 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 150/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L150
M991 S0 P149 ;notify layer change
G17
G3 Z18.4 I-.313 J-1.176 P1  F30000
G1 X126.52 Y116.674 Z18.4
G1 Z18.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1860
G1 X126.52 Y123.174 E.21562
G1 X123.724 Y123.174 E.09274
G1 X123.724 Y113.379 E.32495
G1 X124.724 Y113.379 E.03317
G1 X124.724 Y112.379 E.03317
G1 X125.52 Y112.379 E.0264
G1 X125.52 Y113.379 E.03317
G1 X137.724 Y113.379 E.40483
G1 X137.724 Y112.379 E.03317
G1 X138.52 Y112.379 E.0264
G1 X138.52 Y113.379 E.03317
G1 X139.52 Y113.379 E.03317
G1 X139.52 Y123.174 E.32495
G1 X133.724 Y123.174 E.19226
G1 X133.724 Y116.674 E.21562
G1 X126.58 Y116.674 E.23698
G1 X126.912 Y117.067 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1860
G1 X126.912 Y123.567 E.19973
G1 X123.332 Y123.567 E.11
G1 X123.332 Y112.987 E.32509
G1 X124.332 Y112.987 E.03073
G1 X124.332 Y111.987 E.03073
G1 X125.912 Y111.987 E.04855
G1 X125.912 Y112.987 E.03073
G1 X137.332 Y112.987 E.3509
G1 X137.332 Y111.987 E.03073
G1 X138.912 Y111.987 E.04855
G1 X138.912 Y112.987 E.03073
G1 X139.912 Y112.987 E.03073
G1 X139.912 Y123.567 E.32509
G1 X133.332 Y123.567 E.20219
G1 X133.332 Y117.067 E.19973
G1 X126.972 Y117.067 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X126.954 Y119.066 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18.6 I.238 J-1.194 P1  F30000
G1 X125.765 Y118.83 Z18.6
G1 Z18.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1860
G1 X125.765 Y120.458 E.05401
G1 X124.48 Y121.743 E.06029
G1 X124.48 Y120.81 E.03096
G1 X125.765 Y122.095 E.06029
G1 X125.765 Y122.419 E.01075
G1 X124.48 Y122.4 E.04264
G1 X125.122 Y112.582 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1860
G1 X125.122 Y113.582 E.03168
G1 X124.48 Y114.762 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1860
G1 X124.48 Y114.337 E.01409
G1 X125.683 Y114.337 E.03992
G1 X127.265 Y115.919 E.0742
G1 X130.304 Y115.919 E.10081
G1 X132.089 Y114.134 E.08375
G1 X133.156 Y114.134 E.03539
G1 X138.765 Y119.743 E.26314
M73 P95 R1
G1 X138.765 Y115.134 E.1529
G1 X134.48 Y119.419 E.20103
G1 X134.48 Y121.047 E.05401
G1 X137.558 Y113.93 F30000
G1 F1860
G1 X139.172 Y113.93 E.05353
G1 X139.172 Y122.826 E.29509
G1 X134.073 Y122.826 E.16915
G1 X134.073 Y116.326 E.21562
G1 X126.172 Y116.326 E.26208
G1 X126.172 Y122.826 E.21562
G1 X124.073 Y122.826 E.06964
G1 X124.073 Y113.93 E.29509
M73 P95 R0
G1 X125.686 Y113.93 E.05353
G1 X125.686 Y113.727 E.00675
G1 X137.558 Y113.727 E.39381
G1 X137.558 Y113.87 E.00476
G1 X138.122 Y113.582 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1860
G1 X138.122 Y112.582 E.03168
; CHANGE_LAYER
; Z_HEIGHT: 18.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X138.122 Y113.582 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 151/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L151
M991 S0 P150 ;notify layer change
G17
G3 Z18.6 I-.313 J-1.176 P1  F30000
G1 X126.52 Y116.674 Z18.6
G1 Z18.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1860
G1 X126.52 Y123.174 E.21562
G1 X123.724 Y123.174 E.09274
G1 X123.724 Y113.379 E.32495
G1 X124.724 Y113.379 E.03317
G1 X124.724 Y112.379 E.03317
G1 X125.52 Y112.379 E.0264
G1 X125.52 Y113.379 E.03317
G1 X137.724 Y113.379 E.40483
G1 X137.724 Y112.379 E.03317
G1 X138.52 Y112.379 E.0264
G1 X138.52 Y113.379 E.03317
G1 X139.52 Y113.379 E.03317
G1 X139.52 Y123.174 E.32495
G1 X133.724 Y123.174 E.19226
G1 X133.724 Y116.674 E.21562
G1 X126.58 Y116.674 E.23698
G1 X126.912 Y117.067 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1860
G1 X126.912 Y123.567 E.19973
G1 X123.332 Y123.567 E.11
G1 X123.332 Y112.987 E.32509
G1 X124.332 Y112.987 E.03073
G1 X124.332 Y111.987 E.03073
G1 X125.912 Y111.987 E.04855
G1 X125.912 Y112.987 E.03073
G1 X137.332 Y112.987 E.3509
G1 X137.332 Y111.987 E.03073
G1 X138.912 Y111.987 E.04855
G1 X138.912 Y112.987 E.03073
G1 X139.912 Y112.987 E.03073
G1 X139.912 Y123.567 E.32509
G1 X133.332 Y123.567 E.20219
G1 X133.332 Y117.067 E.19973
G1 X126.972 Y117.067 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X126.954 Y119.066 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18.8 I.238 J-1.194 P1  F30000
G1 X125.765 Y118.83 Z18.8
G1 Z18.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1860
G1 X125.765 Y120.458 E.05401
G1 X124.48 Y121.743 E.06029
G1 X124.48 Y120.81 E.03096
G1 X125.765 Y122.095 E.06029
G1 X125.765 Y122.419 E.01075
G1 X124.48 Y122.4 E.04264
G1 X125.122 Y112.582 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1860
G1 X125.122 Y113.582 E.03168
G1 X124.48 Y114.762 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1860
G1 X124.48 Y114.337 E.01409
G1 X125.683 Y114.337 E.03992
G1 X127.265 Y115.919 E.0742
G1 X130.304 Y115.919 E.10081
G1 X132.089 Y114.134 E.08375
G1 X133.156 Y114.134 E.03539
G1 X138.765 Y119.743 E.26314
G1 X138.765 Y115.134 E.1529
G1 X134.48 Y119.419 E.20103
G1 X134.48 Y121.047 E.05401
G1 X137.558 Y113.93 F30000
G1 F1860
G1 X139.172 Y113.93 E.05353
G1 X139.172 Y122.826 E.29509
G1 X134.073 Y122.826 E.16915
G1 X134.073 Y116.326 E.21562
G1 X126.172 Y116.326 E.26208
G1 X126.172 Y122.826 E.21562
G1 X124.073 Y122.826 E.06964
G1 X124.073 Y113.93 E.29509
G1 X125.686 Y113.93 E.05353
G1 X125.686 Y113.727 E.00675
G1 X137.558 Y113.727 E.39381
G1 X137.558 Y113.87 E.00476
G1 X138.122 Y113.582 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1860
G1 X138.122 Y112.582 E.03168
; CHANGE_LAYER
; Z_HEIGHT: 18.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X138.122 Y113.582 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 152/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L152
M991 S0 P151 ;notify layer change
G17
G3 Z18.8 I-.313 J-1.176 P1  F30000
G1 X126.52 Y116.674 Z18.8
G1 Z18.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2414
G1 X126.52 Y123.174 E.21562
G1 X123.724 Y123.174 E.09274
G1 X123.724 Y113.379 E.32495
G1 X124.724 Y113.379 E.03317
G1 X124.724 Y112.379 E.03317
G1 X125.52 Y112.379 E.0264
G1 X125.52 Y113.379 E.03317
M73 P96 R0
G1 X137.724 Y113.379 E.40483
G1 X137.724 Y112.379 E.03317
G1 X138.52 Y112.379 E.0264
G1 X138.52 Y113.379 E.03317
G1 X139.52 Y113.379 E.03317
G1 X139.52 Y123.174 E.32495
G1 X133.724 Y123.174 E.19226
G1 X133.724 Y116.674 E.21562
G1 X126.58 Y116.674 E.23698
G1 X126.912 Y117.067 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2414
G1 X126.912 Y123.567 E.19973
G1 X123.332 Y123.567 E.11
G1 X123.332 Y112.987 E.32509
G1 X124.332 Y112.987 E.03073
G1 X124.332 Y111.987 E.03073
G1 X125.912 Y111.987 E.04855
G1 X125.912 Y112.987 E.03073
G1 X137.332 Y112.987 E.3509
G1 X137.332 Y111.987 E.03073
G1 X138.912 Y111.987 E.04855
G1 X138.912 Y112.987 E.03073
G1 X139.912 Y112.987 E.03073
G1 X139.912 Y123.567 E.32509
G1 X133.332 Y123.567 E.20219
G1 X133.332 Y117.067 E.19973
G1 X126.972 Y117.067 E.19543
M204 S10000
G1 X126.353 Y116.792 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.411652
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X124.094 Y119.051 E.17323
G1 X124.094 Y119.704 E.0354
G1 X126.15 Y117.648 E.1577
G1 X126.15 Y118.301 E.0354
G1 X124.094 Y120.357 E.1577
G1 X124.094 Y121.01 E.0354
G1 X126.15 Y118.953 E.1577
G1 X126.15 Y119.606 E.0354
G1 X124.094 Y121.663 E.1577
G1 X124.094 Y122.316 E.0354
G1 X126.15 Y120.259 E.1577
G1 X126.15 Y120.912 E.0354
G1 X124.258 Y122.805 E.14514
G1 X124.911 Y122.805 E.0354
G1 X126.15 Y121.565 E.09507
G1 X126.15 Y122.218 E.0354
G1 X125.361 Y123.007 E.06053
M106 S252.45
G1 X123.891 Y114.684 F30000
M106 S255
G1 F3000
G1 X124.623 Y113.952 E.05612
G1 X125.276 Y113.952 E.0354
G1 X124.094 Y115.134 E.09066
G1 X124.094 Y115.787 E.0354
G1 X126.133 Y113.748 E.15633
G1 X126.785 Y113.748 E.0354
G1 X124.094 Y116.44 E.2064
G1 X124.094 Y117.093 E.0354
G1 X127.438 Y113.748 E.25647
G1 X128.091 Y113.748 E.0354
G1 X124.094 Y117.745 E.30653
G1 X124.094 Y118.398 E.0354
G1 X128.744 Y113.748 E.3566
G1 X129.397 Y113.748 E.0354
G1 X126.841 Y116.305 E.19604
G1 X127.493 Y116.305 E.0354
G1 X130.05 Y113.748 E.19604
G1 X130.703 Y113.748 E.0354
G1 X128.146 Y116.305 E.19604
G1 X128.799 Y116.305 E.0354
G1 X131.356 Y113.748 E.19604
G1 X132.008 Y113.748 E.0354
G1 X129.452 Y116.305 E.19604
G1 X130.105 Y116.305 E.0354
G1 X132.661 Y113.748 E.19604
G1 X133.314 Y113.748 E.0354
G1 X130.758 Y116.305 E.19604
G1 X131.411 Y116.305 E.0354
G1 X133.967 Y113.748 E.19604
G1 X134.62 Y113.748 E.0354
G1 X132.064 Y116.305 E.19604
G1 X132.716 Y116.305 E.0354
G1 X135.273 Y113.748 E.19604
G1 X135.926 Y113.748 E.0354
G1 X133.369 Y116.305 E.19604
G1 X134.022 Y116.305 E.0354
G1 X136.579 Y113.748 E.19604
G1 X137.231 Y113.748 E.0354
G1 X134.094 Y116.886 E.2406
G1 X134.094 Y117.539 E.0354
G1 X137.681 Y113.952 E.27506
G1 X138.334 Y113.952 E.0354
G1 X134.094 Y118.191 E.32513
G1 X134.094 Y118.844 E.0354
G1 X138.986 Y113.952 E.37519
G1 X139.15 Y113.952 E.00889
G1 X139.15 Y114.441 E.02652
G1 X134.094 Y119.497 E.38776
G1 X134.094 Y120.15 E.0354
G1 X139.15 Y115.094 E.38776
G1 X139.15 Y115.747 E.0354
G1 X134.094 Y120.803 E.38776
G1 X134.094 Y121.456 E.0354
G1 X139.15 Y116.399 E.38776
G1 X139.15 Y117.052 E.0354
G1 X134.094 Y122.109 E.38776
G1 X134.094 Y122.762 E.0354
G1 X139.15 Y117.705 E.38776
G1 X139.15 Y118.358 E.0354
G1 X134.704 Y122.805 E.341
G1 X135.357 Y122.805 E.0354
G1 X139.15 Y119.011 E.29093
G1 X139.15 Y119.664 E.0354
G1 X136.009 Y122.805 E.24087
G1 X136.662 Y122.805 E.0354
G1 X139.15 Y120.317 E.1908
G1 X139.15 Y120.97 E.0354
G1 X137.315 Y122.805 E.14073
G1 X137.968 Y122.805 E.0354
G1 X139.15 Y121.622 E.09066
G1 X139.15 Y122.275 E.0354
G1 X138.418 Y123.007 E.05613
M106 S252.45
G1 X138.614 Y113.654 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
; LAYER_HEIGHT: 0.2
G1 F2414
G1 X139.184 Y113.654 E.0158
G1 X138.122 Y113.582 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F2414
G1 X138.122 Y112.582 E.03168
; WIPE_START
G1 F24000
G1 X138.122 Y113.582 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z19 I.093 J-1.213 P1  F30000
G1 X125.122 Y112.582 Z19
G1 Z18.6
G1 E.8 F1800
G1 F2414
G1 X125.122 Y113.582 E.03168
G1 X124 Y113.654 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
G1 F2414
G1 X124.57 Y113.654 E.0158
; CHANGE_LAYER
; Z_HEIGHT: 18.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X124 Y113.654 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 153/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L153
M991 S0 P152 ;notify layer change
G17
G3 Z19 I-.934 J.78 P1  F30000
G1 X126.52 Y116.674 Z19
G1 Z18.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3085
G1 X126.52 Y123.174 E.21562
G1 X123.724 Y123.174 E.09274
G1 X123.724 Y113.379 E.32495
G1 X124.724 Y113.379 E.03317
G1 X124.724 Y112.379 E.03317
G1 X125.52 Y112.379 E.0264
G1 X125.52 Y113.379 E.03317
G1 X137.724 Y113.379 E.40483
G1 X137.724 Y112.379 E.03317
G1 X138.52 Y112.379 E.0264
G1 X138.52 Y113.379 E.03317
G1 X139.52 Y113.379 E.03317
G1 X139.52 Y123.174 E.32495
G1 X133.724 Y123.174 E.19226
G1 X133.724 Y116.674 E.21562
G1 X126.58 Y116.674 E.23698
G1 X126.912 Y117.067 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3085
G1 X126.912 Y123.567 E.19973
G1 X123.332 Y123.567 E.11
G1 X123.332 Y112.987 E.32509
G1 X124.332 Y112.987 E.03073
G1 X124.332 Y111.987 E.03073
G1 X125.912 Y111.987 E.04855
G1 X125.912 Y112.987 E.03073
G1 X137.332 Y112.987 E.3509
G1 X137.332 Y111.987 E.03073
G1 X138.912 Y111.987 E.04855
G1 X138.912 Y112.987 E.03073
G1 X139.912 Y112.987 E.03073
G1 X139.912 Y123.567 E.32509
G1 X133.332 Y123.567 E.20219
G1 X133.332 Y117.067 E.19973
G1 X126.972 Y117.067 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X126.954 Y119.066 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z19.2 I1.168 J-.342 P1  F30000
G1 X125.812 Y115.162 Z19.2
G1 Z18.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.585956
G1 F3085
G1 X126.031 Y115.099 E.01012
G1 X125.24 Y116.001 F30000
; LINE_WIDTH: 0.403952
M73 P97 R0
G1 F3085
G1 X125.529 Y115.422 E.01903
G1 X125.599 Y115.357 E.00283
; LINE_WIDTH: 0.449453
G1 X125.67 Y115.292 E.00318
; LINE_WIDTH: 0.494954
G1 X125.741 Y115.227 E.00354
; LINE_WIDTH: 0.540455
G1 X125.812 Y115.162 E.0039
; LINE_WIDTH: 0.585956
G1 X125.669 Y115.146 E.00637
; LINE_WIDTH: 0.540455
G1 X125.526 Y115.13 E.00584
; LINE_WIDTH: 0.494954
G1 X125.383 Y115.114 E.0053
; LINE_WIDTH: 0.410585
G1 X125.24 Y115.097 E.00431
G1 X125.24 Y115.941 E.02527
; WIPE_START
G1 F24000
G1 X125.24 Y115.097 E-.64922
G1 X125.383 Y115.114 E-.11078
; WIPE_END
G1 E-.04 F1800
G17
G3 Z19.2 I-.803 J.914 P1  F30000
G1 X134.116 Y122.782 Z19.2
G1 Z18.8
G1 E.8 F1800
; LINE_WIDTH: 0.419999
G1 F3085
G1 X139.128 Y122.782 E.15399
G1 X139.128 Y113.771 E.2769
G1 X138.73 Y113.786 E.01224
G1 X138.704 Y113.882 E.00308
G1 X138.542 Y113.974 E.00572
G1 X137.703 Y113.974 E.02577
G1 X137.63 Y113.96 E.00228
G1 X137.499 Y113.771 E.00706
G1 X125.73 Y113.771 E.36163
G1 X125.609 Y113.962 E.00694
G1 X124.703 Y113.974 E.02786
G1 X124.541 Y113.882 E.00572
G1 X124.499 Y113.771 E.00366
G1 X124.116 Y113.771 E.01177
G1 X124.116 Y122.782 E.2769
G1 X126.128 Y122.782 E.06181
G1 X126.128 Y116.471 E.19393
G1 X126.249 Y116.295 E.00655
G1 X126.481 Y116.282 E.00716
G1 X133.928 Y116.282 E.22881
G1 X134.035 Y116.316 E.00344
G1 X134.116 Y116.471 E.00539
G1 X134.116 Y122.722 E.19209
G1 X134.493 Y122.405 F30000
G1 F3085
G1 X138.751 Y122.405 E.13082
G1 X138.751 Y114.232 E.25113
G1 X138.542 Y114.351 E.0074
G1 X137.703 Y114.351 E.02577
G1 X137.485 Y114.307 E.00684
G1 X137.378 Y114.148 E.0059
G1 X125.901 Y114.148 E.35265
G1 X125.831 Y114.272 E.00438
G1 X125.65 Y114.341 E.00594
G1 X124.703 Y114.351 E.02912
G1 X124.493 Y114.232 E.0074
G1 X124.493 Y122.405 E.25113
G1 X125.751 Y122.405 E.03864
G1 X125.751 Y116.471 E.18235
G1 X125.977 Y116.019 E.01553
G1 X126.225 Y115.913 E.0083
G1 X126.481 Y115.905 E.00787
G1 X133.928 Y115.905 E.22881
G1 X134.248 Y116.005 E.01031
G1 X134.435 Y116.22 E.00876
G1 X134.493 Y116.471 E.00791
G1 X134.493 Y122.345 E.1805
G1 X134.87 Y122.028 F30000
G1 F3085
G1 X138.374 Y122.028 E.10765
G1 X138.374 Y114.728 E.2243
G1 X137.703 Y114.728 E.02062
G1 X137.339 Y114.655 E.0114
G1 X137.252 Y114.525 E.00482
G1 X126.064 Y114.525 E.34377
G1 X126.024 Y114.596 E.0025
G1 X125.723 Y114.711 E.0099
G1 X124.87 Y114.728 E.0262
G1 X124.87 Y115.278 E.01689
G1 X124.886 Y115.874 E.01833
; LINE_WIDTH: 0.481586
G1 X124.902 Y116.471 E.02133
G1 X124.902 Y121.997 E.19752
G1 X125.342 Y121.997 E.01574
G1 X125.342 Y116.471 E.19752
; LINE_WIDTH: 0.483144
G1 X125.546 Y116.094 E.01537
; LINE_WIDTH: 0.420866
G1 X125.75 Y115.717 E.0132
G1 X126.043 Y115.569 E.01012
G1 X126.481 Y115.528 E.01355
G1 X133.928 Y115.528 E.22934
G1 X134.462 Y115.694 E.01722
G1 X134.773 Y116.053 E.01463
G1 X134.87 Y116.471 E.01322
G1 X134.87 Y121.968 E.1693
G1 X135.248 Y121.651 F30000
; LINE_WIDTH: 0.419999
G1 F3085
G1 X137.997 Y121.651 E.08448
G1 X137.997 Y115.105 E.20113
G1 X137.703 Y115.105 E.00903
G1 X137.194 Y115.003 E.01596
G1 X137.126 Y114.902 E.00374
G1 X134.825 Y114.902 E.07071
G1 X134.376 Y114.886 E.01379
; LINE_WIDTH: 0.357882
G1 X133.928 Y114.87 E.01152
G1 X126.481 Y114.87 E.19112
; LINE_WIDTH: 0.356065
G1 X126.421 Y114.892 E.00164
; LINE_WIDTH: 0.395357
G1 X126.361 Y114.915 E.00184
; LINE_WIDTH: 0.434648
G1 X126.301 Y114.937 E.00205
; LINE_WIDTH: 0.47394
G1 X126.241 Y114.96 E.00225
; LINE_WIDTH: 0.513231
G1 X126.165 Y115.021 E.00374
; LINE_WIDTH: 0.554144
G1 X126.089 Y115.082 E.00406
; LINE_WIDTH: 0.595056
G1 X126.165 Y115.094 E.00346
; LINE_WIDTH: 0.558366
G1 X126.241 Y115.106 E.00323
; LINE_WIDTH: 0.521675
G1 X126.317 Y115.119 E.003
; LINE_WIDTH: 0.484984
G1 X126.371 Y115.14 E.00212
; LINE_WIDTH: 0.442011
G1 X126.426 Y115.162 E.00192
; LINE_WIDTH: 0.356403
G1 X126.481 Y115.183 E.00151
G1 X133.928 Y115.183 E.19022
; LINE_WIDTH: 0.356065
G1 X134.302 Y115.283 E.00987
; LINE_WIDTH: 0.418174
G1 X134.675 Y115.383 E.01183
G1 X135.111 Y115.886 E.02033
G1 X135.244 Y116.377 E.01558
G1 X135.248 Y121.591 E.15943
G1 X135.625 Y121.274 F30000
; LINE_WIDTH: 0.419999
G1 F3085
G1 X137.62 Y121.274 E.0613
G1 X137.62 Y115.466 E.17847
G1 X137.048 Y115.351 E.01792
G1 X137 Y115.279 E.00266
G1 X135.068 Y115.279 E.05937
G1 X135.449 Y115.719 E.01787
G1 X135.62 Y116.351 E.02013
G1 X135.625 Y121.214 E.14943
G1 X136.002 Y120.897 F30000
G1 F3085
G1 X137.243 Y120.897 E.03813
G1 X137.243 Y115.767 E.15762
G1 X136.902 Y115.699 E.01066
G1 X136.874 Y115.656 E.00158
G1 X135.815 Y115.656 E.03253
G1 X135.997 Y116.324 E.02127
G1 X136.002 Y120.837 E.13867
G1 X136.406 Y120.492 F30000
; LINE_WIDTH: 0.475147
G1 F3085
G1 X136.838 Y120.492 E.01521
G2 X136.836 Y116.092 I-492.57 J-2.011 E.15499
G1 X136.338 Y116.062 E.01757
G1 X136.406 Y116.471 E.01459
G1 X136.406 Y120.432 E.13953
G1 X138.122 Y113.582 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F3085
G1 X138.122 Y112.582 E.03168
; WIPE_START
G1 F24000
G1 X138.122 Y113.582 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z19.2 I.093 J-1.213 P1  F30000
G1 X125.122 Y112.582 Z19.2
G1 Z18.8
G1 E.8 F1800
G1 F3085
G1 X125.122 Y113.582 E.03168
; CHANGE_LAYER
; Z_HEIGHT: 19
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X125.122 Y112.582 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 154/154
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L154
M991 S0 P153 ;notify layer change
G17
G3 Z19.2 I-1.13 J.451 P1  F30000
G1 X126.912 Y117.067 Z19.2
G1 Z19
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3441
G1 X126.912 Y123.567 E.19973
G1 X123.332 Y123.567 E.11
G1 X123.332 Y112.987 E.32509
G1 X124.332 Y112.987 E.03073
G1 X124.332 Y111.987 E.03073
G1 X125.912 Y111.987 E.04855
G1 X125.912 Y112.987 E.03073
G1 X137.332 Y112.987 E.3509
G1 X137.332 Y111.987 E.03073
G1 X138.912 Y111.987 E.04855
G1 X138.912 Y112.987 E.03073
G1 X139.912 Y112.987 E.03073
G1 X139.912 Y123.567 E.32509
G1 X133.332 Y123.567 E.20219
G1 X133.332 Y117.067 E.19973
G1 X126.972 Y117.067 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X126.954 Y119.066 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z19.4 I.634 J1.039 P1  F30000
G1 X138.204 Y112.194 Z19.4
G1 Z19
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
G1 F3441
G1 X138.705 Y112.694 E.02174
G1 X139.204 Y113.194
G1 X139.705 Y113.694 E.02174
G1 X139.705 Y114.228
G1 X137.671 Y112.194 E.08837
G1 X137.54 Y112.596
G1 X139.705 Y114.761 E.09409
G1 X139.705 Y115.294
G1 X137.54 Y113.129 E.09409
G1 X137.071 Y113.194
G1 X139.705 Y115.827 E.11444
G1 X139.705 Y116.361
G1 X136.538 Y113.194 E.13761
G1 X136.005 Y113.194
G1 X139.705 Y116.894 E.16078
G1 X139.705 Y117.427
G1 X135.472 Y113.194 E.18396
G1 X134.938 Y113.194
G1 X139.705 Y117.96 E.20713
G1 X139.705 Y118.494
G1 X134.405 Y113.194 E.2303
G1 X133.872 Y113.194
G1 X139.705 Y119.027 E.25347
G1 X139.705 Y119.56
G1 X133.338 Y113.194 E.27665
G1 X132.805 Y113.194
G1 X139.705 Y120.094 E.29982
G1 X139.705 Y120.627
G1 X132.272 Y113.194 E.32299
G1 X131.739 Y113.194
G1 X139.705 Y121.16 E.34617
G1 X139.705 Y121.693
G1 X131.205 Y113.194 E.36934
G1 X130.672 Y113.194
G1 X139.705 Y122.227 E.39251
G1 X139.705 Y122.76
G1 X130.139 Y113.194 E.41569
G1 X129.606 Y113.194
G1 X133.271 Y116.859 E.15927
G1 X132.738 Y116.859
G1 X129.072 Y113.194 E.15927
M73 P98 R0
G1 X128.539 Y113.194
G1 X132.204 Y116.859 E.15927
G1 X131.671 Y116.859
G1 X128.006 Y113.194 E.15927
G1 X127.472 Y113.194
G1 X131.138 Y116.859 E.15927
G1 X130.604 Y116.859
G1 X126.939 Y113.194 E.15927
G1 X126.406 Y113.194
G1 X130.071 Y116.859 E.15927
G1 X129.538 Y116.859
G1 X125.873 Y113.194 E.15927
G1 X125.705 Y113.026
G1 X124.873 Y112.194 E.03616
G1 X124.54 Y112.394
G1 X129.005 Y116.859 E.19403
G1 X128.471 Y116.859
G1 X124.54 Y112.927 E.17085
G1 X124.273 Y113.194
G1 X127.938 Y116.859 E.15927
G1 X127.405 Y116.859
G1 X123.74 Y113.194 E.15927
G1 X123.54 Y113.527
G1 X126.872 Y116.859 E.14479
G1 X126.705 Y117.226
G1 X123.54 Y114.06 E.13754
G1 X123.54 Y114.594
G1 X126.705 Y117.759 E.13754
G1 X126.705 Y118.292
G1 X123.54 Y115.127 E.13754
G1 X123.54 Y115.66
G1 X126.705 Y118.825 E.13754
G1 X126.705 Y119.359
G1 X123.54 Y116.194 E.13754
G1 X123.54 Y116.727
G1 X126.705 Y119.892 E.13754
G1 X126.705 Y120.425
G1 X123.54 Y117.26 E.13754
G1 X123.54 Y117.793
G1 X126.705 Y120.959 E.13754
G1 X126.705 Y121.492
G1 X123.54 Y118.327 E.13754
G1 X123.54 Y118.86
G1 X126.705 Y122.025 E.13754
G1 X126.705 Y122.558
G1 X123.54 Y119.393 E.13754
G1 X123.54 Y119.926
G1 X126.705 Y123.092 E.13754
G1 X126.439 Y123.359
G1 X123.54 Y120.46 E.126
G1 X123.54 Y120.993
G1 X125.906 Y123.359 E.10282
G1 X125.372 Y123.359
G1 X123.54 Y121.526 E.07965
G1 X123.54 Y122.059
G1 X124.839 Y123.359 E.05648
G1 X124.306 Y123.359
G1 X123.54 Y122.593 E.0333
M204 S10000
; WIPE_START
G1 F24000
G1 X124.306 Y123.359 E-.41185
G1 X124.839 Y123.359 E-.20264
G1 X124.568 Y123.088 E-.1455
; WIPE_END
G1 E-.04 F1800
G17
G3 Z19.4 I.673 J1.014 P1  F30000
G1 X133.54 Y117.128 Z19.4
G1 Z19
G1 E.8 F1800
M204 S2000
G1 F3441
G1 X139.705 Y123.293 E.26791
G1 X139.238 Y123.359
G1 X133.54 Y117.661 E.2476
G1 X133.54 Y118.194
G1 X138.704 Y123.359 E.22443
G1 X138.171 Y123.359
G1 X133.54 Y118.728 E.20126
G1 X133.54 Y119.261
G1 X137.638 Y123.359 E.17808
G1 X137.104 Y123.359
G1 X133.54 Y119.794 E.15491
G1 X133.54 Y120.328
G1 X136.571 Y123.359 E.13174
G1 X136.038 Y123.359
G1 X133.54 Y120.861 E.10856
G1 X133.54 Y121.394
G1 X135.505 Y123.359 E.08539
G1 X134.971 Y123.359
G1 X133.54 Y121.927 E.06222
G1 X133.54 Y122.461
G1 X134.438 Y123.359 E.03904
G1 X133.905 Y123.359
G1 X133.54 Y122.994 E.01587
M204 S10000
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F24000
G1 X133.905 Y123.359 E-.19628
G1 X134.438 Y123.359 E-.20264
G1 X133.766 Y122.687 E-.36108
; WIPE_END
G1 E-.04 F1800
M106 S0
M106 P2 S0
M981 S0 P20000 ; close spaghetti detector
; FEATURE: Custom
; filament end gcode 
M106 P3 S0
;===== date: 20230118 =====================
M400 ; wait for buffer to clear
G92 E0 ; zero the extruder
G1 E-0.8 F1800 ; retract
G1 Z19.5 F900 ; lower z a little
G1 X65 Y245 F12000 ; move to safe pos 
G1 Y265 F3000
M991 S0 P-1 ;end smooth timelapse at safe pos
M400 S2 ;wait for last picture to be taken

G1 X65 Y245 F12000
G1 Y265 F3000
M140 S0 ; turn off bed
M106 S0 ; turn off fan
M106 P2 S0 ; turn off remote part cooling fan
M106 P3 S0 ; turn off chamber cooling fan

G1 X100 F12000 ; wipe
; pull back filament to AMS
M620 S255
G1 X20 Y50 F12000
G1 Y-3
T255
G1 X65 F12000
G1 Y265
G1 X100 F12000 ; wipe
M621 S255
M104 S0 ; turn off hotend

M400 ; wait all motion done
M17 S
M17 Z0.4 ; lower z motor current to reduce impact if there is something in the bottom

    G1 Z119 F600
    G1 Z117

M400 P100
M17 R ; restore z current

G90
G1 X128 Y250 F3600

M220 S100  ; Reset feedrate magnitude
M201.2 K1.0 ; Reset acc magnitude
M73.2   R1.0 ;Reset left time magnitude
M1002 set_gcode_claim_speed_level : 0

M17 X0.8 Y0.8 Z0.5 ; lower motor current to 45% power

M73 P100 R0
; EXECUTABLE_BLOCK_END

