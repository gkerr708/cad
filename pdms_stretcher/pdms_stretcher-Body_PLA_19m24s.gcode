; HEADER_BLOCK_START
; BambuStudio 01.06.02.04
; model printing time: 13m 36s; total estimated time: 19m 24s
; total layer number: 58
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
; support_type = tree(auto)
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
M73 P0 R19
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
M73 P22 R15
G1 Y245
G1 Y265 F3000
M620 M
M620 S0A   ; switch material if AMS exist
    M109 S220
    G1 X120 F12000

    G1 X20 Y50 F12000
    G1 Y-3
    T0
M73 P22 R14
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
M73 P23 R14
G1 E-0.5 F300

G1 X70 F9000
M73 P24 R14
G1 X76 F15000
M73 P25 R14
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
M73 P26 R14
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
    G29 A X103.382 Y104.071 I53.3269 J51.4515
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
; layer num/total_layer_count: 1/58
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
G1 X104.353 Y103.302 F30000
M73 P27 R14
G1 Z.4
G1 Z.2
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.5
G1 F3000
G3 X106.718 Y102.305 I2.161 J1.823 E.09921
G3 X108.083 Y102.736 I-.184 J2.957 E.05387
G1 X108.071 Y107.486 E.1769
G3 X104.315 Y103.348 I-1.557 J-2.36 E.29843
G1 X104.686 Y103.595 F30000
G1 F3000
G1 X104.688 Y103.593 E.00011
G3 X106.69 Y102.761 I1.81 J1.532 E.08386
M73 P27 R13
G3 X107.614 Y102.997 I-.228 J2.824 E.03569
M73 P28 R13
G1 X107.614 Y107.217 E.1572
G3 X104.363 Y104.095 I-1.116 J-2.093 E.22171
G1 X104.653 Y103.645 E.01993
G1 X105.057 Y103.896 F30000
G1 F3000
G1 X105.109 Y103.798 E.00412
G3 X106.663 Y103.218 I1.38 J1.324 E.06389
G3 X107.157 Y103.3 I-.219 J2.828 E.0187
G1 X107.157 Y106.914 E.13459
G3 X104.676 Y104.517 I-.668 J-1.792 E.16022
G1 X105.026 Y103.947 E.02492
G1 X105.666 Y104.53 F30000
G1 F3000
G3 X106.243 Y104.109 I.864 J.578 E.02715
G1 X106.243 Y106.106 E.07439
G3 X105.635 Y104.579 I.287 J-.999 E.0706
G1 X105.305 Y104.327 F30000
G1 F3000
M73 P29 R13
G1 X105.494 Y104.046 E.0126
G3 X106.7 Y103.666 I.997 J1.061 E.04873
G1 X106.7 Y106.548 E.10732
G3 X105.17 Y104.494 I-.209 J-1.441 E.11659
G1 X105.267 Y104.373 E.00575
; WIPE_START
G1 F24000
G1 X105.494 Y104.046 E-.15129
G1 X106.074 Y103.742 E-.24908
G1 X106.7 Y103.666 E-.23959
G1 X106.7 Y103.982 E-.12004
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-1.212 J-.11 P1  F30000
G1 X105.892 Y112.899 Z.6
G1 Z.2
G1 E.8 F1800
G1 F3000
G3 X106.595 Y112.855 I.527 J2.758 E.02628
G3 X108.071 Y113.387 I-.226 J2.94 E.05918
G1 X108.069 Y117.929 E.16915
G3 X105.834 Y112.911 I-1.649 J-2.272 E.37221
G1 X105.976 Y113.349 F30000
G1 F3000
G1 X105.978 Y113.349 E.00008
G3 X106.566 Y113.311 I.443 J2.31 E.022
G3 X107.614 Y113.63 I-.171 J2.447 E.04115
G1 X107.614 Y117.684 E.15103
G3 X105.418 Y113.531 I-1.193 J-2.026 E.2832
G1 X105.919 Y113.367 E.01963
G1 X105.996 Y113.853 F30000
G1 F3000
G1 X106.537 Y113.767 E.02041
G3 X107.157 Y113.912 I-.145 J2.026 E.02381
G1 X107.157 Y117.402 E.13001
G3 X105.722 Y113.897 I-.737 J-1.745 E.22317
G1 X105.937 Y113.863 E.00811
G1 X106.007 Y114.303 F30000
G1 F3000
M73 P30 R13
G1 X106.509 Y114.224 E.01893
G1 X106.7 Y114.242 E.00717
G1 X106.7 Y117.072 E.10541
G3 X105.89 Y114.323 I-.278 J-1.412 E.1585
G1 X105.947 Y114.313 E.00215
G1 X106.192 Y114.682 F30000
G1 F3000
G1 X106.243 Y114.648 E.00227
G1 X106.243 Y116.665 E.07513
G3 X105.656 Y115.027 I.234 J-1.009 E.07703
G1 X106.142 Y114.715 E.02152
; WIPE_START
G1 F24000
G1 X106.243 Y114.648 E-.04591
G1 X106.243 Y116.528 E-.71409
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-1.214 J.079 P1  F30000
G1 X106.601 Y122.042 Z.6
G1 Z.2
G1 E.8 F1800
G1 F3000
G3 X108.071 Y122.57 I-.188 J2.834 E.05898
G1 X108.071 Y131.052 E.31592
G1 X106.185 Y131.065 E.07028
G1 X104.768 Y131.534 E.05559
G2 X104.665 Y131.621 I.13 J.258 E.00508
G3 X104.103 Y128.039 I1.921 J-2.136 E.14615
G3 X103.622 Y126.515 I7.577 J-3.228 E.05964
G2 X103.638 Y124.492 I-12.038 J-1.11 E.07541
G3 X106.541 Y122.039 I2.799 J.368 E.1553
G1 X106.57 Y122.498 F30000
G1 F3000
G1 X106.572 Y122.498 E.00006
G3 X107.614 Y122.814 I-.17 J2.441 E.04091
G1 X107.614 Y130.598 E.28994
G1 X106.145 Y130.608 E.05472
G2 X104.752 Y131.057 I.708 J4.58 E.05474
G3 X104.564 Y128.153 I1.852 J-1.578 E.11618
G2 X104.297 Y127.339 I-1.333 J-.014 E.0325
G3 X104.167 Y125.515 I2.575 J-1.101 E.06937
G3 X105.984 Y122.538 I2.268 J-.659 E.14618
G1 X106.51 Y122.502 E.01964
G1 X106.539 Y122.955 F30000
G1 F3000
G1 X106.543 Y122.955 E.00016
G3 X107.157 Y123.097 I-.143 J2.017 E.02358
G1 X107.157 Y130.144 E.26248
G2 X104.92 Y130.519 I-.496 J3.907 E.0857
G3 X105.026 Y128.267 I1.706 J-1.048 E.08916
G1 X105.002 Y127.611 E.02445
G3 X104.624 Y125.465 I2.246 J-1.501 E.08355
G3 X106.07 Y122.987 I1.812 J-.603 E.12088
G1 X106.479 Y122.959 E.01527
G1 X106.514 Y123.411 F30000
G1 F3000
G1 X106.7 Y123.429 E.00695
G1 X106.7 Y129.69 E.23322
G2 X105.146 Y129.961 I-.281 J2.981 E.05947
G3 X105.488 Y128.381 I1.676 J-.464 E.0626
G1 X105.453 Y127.463 E.03423
G3 X105.081 Y125.768 I1.201 J-1.152 E.06801
G3 X105.059 Y124.4 I4.085 J-.751 E.05117
G3 X106.455 Y123.409 I1.368 J.447 E.06833
G1 X106.243 Y123.839 F30000
G1 F3000
G1 X106.243 Y127.353 E.13089
G1 X105.985 Y127.432 E.01006
G3 X105.538 Y125.818 I1.003 J-1.146 E.06604
G2 X105.453 Y124.721 I-4.195 J-.227 E.04109
G3 X106.187 Y123.855 I1.078 J.17 E.04447
G1 X105.972 Y128.457 F30000
G1 F3000
G1 X106.243 Y128.529 E.01046
G1 X106.243 Y129.236 E.02633
G2 X105.469 Y129.33 I-.092 J2.467 E.02916
G1 X105.942 Y128.509 E.0353
; WIPE_START
G1 F24000
G1 X106.243 Y128.529 E-.11473
G1 X106.243 Y129.236 E-.26858
G1 X105.469 Y129.33 E-.29622
G1 X105.575 Y129.147 E-.08047
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-.032 J1.217 P1  F30000
G1 X116.757 Y129.438 Z.6
G1 Z.2
G1 E.8 F1800
G1 F3000
G1 X117.086 Y129.651 E.01462
G3 X116.984 Y131.314 I-.543 J.801 E.07472
G1 X116.757 Y130.9 E.01757
G1 X116.757 Y129.498 E.05222
G1 X116.849 Y129.066 F30000
G1 F3000
G1 X117.02 Y129.088 E.00643
G3 X116.756 Y131.849 I-.485 J1.347 E.14084
G1 X116.3 Y131.017 E.03535
G1 X116.3 Y128.996 E.07528
G1 X116.554 Y129.004 E.00947
G1 X116.79 Y129.054 E.00899
G1 X116.895 Y128.624 F30000
G1 F3000
G1 X117.294 Y128.708 E.01519
G3 X116.5 Y132.334 I-.766 J1.732 E.19322
G1 X115.843 Y131.134 E.05095
G1 X115.843 Y128.63 E.09328
G3 X116.581 Y128.547 I.628 J2.269 E.0278
G1 X116.837 Y128.61 E.0098
G1 X116.944 Y128.173 F30000
G1 F3000
G1 X117.482 Y128.289 E.02051
G3 X116.758 Y132.769 I-.946 J2.146 E.22989
G3 X116.224 Y132.78 I-.33 J-3.116 E.01991
G1 X115.386 Y131.251 E.06494
G1 X115.386 Y128.326 E.10894
G3 X116.609 Y128.091 I1.105 J2.441 E.04682
G1 X116.886 Y128.158 E.01062
G1 X116.993 Y127.721 F30000
G1 F3000
G1 X117.669 Y127.872 E.02581
G3 X116.812 Y133.223 I-1.133 J2.563 E.27416
G3 X115.928 Y133.196 I-.335 J-3.513 E.03304
G1 X114.929 Y131.368 E.0776
G1 X114.929 Y128.057 E.12333
G3 X116.636 Y127.634 I1.559 J2.635 E.06646
G1 X116.934 Y127.707 E.01144
; WIPE_START
G1 F24000
G1 X117.669 Y127.872 E-.28616
G1 X118.536 Y128.491 E-.4049
G1 X118.651 Y128.631 E-.06894
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I1.15 J-.398 P1  F30000
G1 X116.757 Y123.161 Z.6
G1 Z.2
G1 E.8 F1800
G1 F3000
G1 X116.757 Y121.072 E.07782
G1 X117.188 Y121.453 E.02143
G3 X117.232 Y122.836 I-.672 J.713 E.05724
G3 X116.811 Y123.136 I-1.117 J-1.121 E.01936
G1 X116.757 Y118.624 F30000
G1 F3000
G1 X116.757 Y116.535 E.07782
G1 X117.043 Y116.704 E.01238
G3 X117.188 Y118.243 I-.526 J.826 E.0664
G1 X116.802 Y118.584 E.0192
G1 X117.104 Y118.927 F30000
G1 F3000
G1 X116.879 Y119.126 E.01118
G1 X116.879 Y120.57 E.05381
G3 X117.943 Y122.346 I-.99 J1.8 E.0808
G3 X116.3 Y123.595 I-1.445 J-.196 E.08542
G1 X116.3 Y116.101 E.27913
G3 X116.609 Y116.097 I.187 J2.454 E.01151
G3 X117.502 Y118.577 I-.091 J1.434 E.1243
G1 X117.149 Y118.887 E.0175
G1 X117.451 Y119.23 F30000
G1 F3000
G1 X117.336 Y119.332 E.00573
G1 X117.336 Y120.364 E.03843
G3 X117.215 Y123.926 I-.96 J1.751 E.16406
G3 X115.843 Y123.94 I-.705 J-1.812 E.05226
G1 X115.843 Y115.756 E.30484
G3 X116.637 Y115.64 I.709 J2.09 E.03008
G3 X117.815 Y118.91 I-.12 J1.89 E.16388
G1 X117.496 Y119.191 E.0158
G1 X117.811 Y119.521 F30000
G1 F3000
G1 X117.793 Y119.538 E.00092
G1 X117.793 Y120.158 E.02306
G3 X115.386 Y124.226 I-1.28 J1.989 E.27013
G1 X115.386 Y115.47 E.32609
G3 X116.666 Y115.184 I1.139 J2.089 E.04951
G3 X118.344 Y119.04 I-.169 J2.367 E.19249
G1 X117.855 Y119.481 E.02452
G1 X118.25 Y119.745 F30000
G1 F3000
G2 X118.565 Y120.244 I.62 J-.043 E.02291
G3 X118.682 Y123.956 I-2.052 J1.922 E.15109
G3 X114.929 Y124.479 I-2.165 J-1.808 E.15477
G1 X114.929 Y115.217 E.34495
M73 P31 R13
G3 X116.695 Y114.728 I1.595 J2.324 E.06953
G3 X118.297 Y119.707 I-.187 J2.807 E.2501
; WIPE_START
G1 F24000
G1 X118.25 Y119.951 E-.09429
G1 X118.565 Y120.244 E-.16344
G1 X119.059 Y120.97 E-.33383
G1 X119.169 Y121.4 E-.16844
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I1.2 J-.203 P1  F30000
G1 X116.757 Y107.11 Z.6
G1 Z.2
G1 E.8 F1800
G1 F3000
G1 X116.757 Y104.136 E.11079
G1 X117.086 Y104.349 E.01462
G3 X117.484 Y105.445 I-.571 J.827 E.0463
G3 X117.151 Y106.897 I-1.341 J.457 E.05842
G3 X116.812 Y107.086 I-1.27 J-1.871 E.0145
G1 X116.907 Y107.456 F30000
G1 F3000
G1 X116.576 Y107.541 E.01272
G3 X116.3 Y107.52 I.024 J-2.205 E.01031
G1 X116.3 Y103.694 E.14252
G1 X116.554 Y103.701 E.00947
G3 X117.942 Y105.453 I-.059 J1.473 E.09451
G3 X117.246 Y107.327 I-1.501 J.508 E.08055
G1 X116.963 Y107.435 E.0113
G1 X117.086 Y107.913 F30000
G1 F3000
G1 X116.813 Y107.983 E.01048
G3 X115.843 Y107.852 I-.24 J-1.88 E.03689
G1 X115.843 Y103.328 E.16851
G3 X116.581 Y103.245 I.628 J2.269 E.0278
G3 X118.412 Y105.645 I-.109 J1.981 E.12773
G3 X117.273 Y107.865 I-1.839 J.459 E.10146
G1 X117.144 Y107.898 E.00496
G1 X117.231 Y108.354 F30000
G1 F3000
G1 X116.723 Y108.448 E.01922
G3 X115.386 Y108.135 I-.155 J-2.351 E.05192
G1 X115.386 Y103.024 E.19036
G3 X116.609 Y102.788 I1.105 J2.441 E.04682
G3 X118.885 Y105.664 I-.163 J2.468 E.15387
G3 X117.301 Y108.337 I-2.316 J.433 E.12633
G1 X117.289 Y108.34 E.00046
G1 X117.36 Y108.788 F30000
G1 F3000
G1 X116.576 Y108.908 E.02955
G3 X114.929 Y108.379 I-.005 J-2.811 E.06551
G1 X114.929 Y102.756 E.20941
G3 X116.636 Y102.332 I1.536 J2.533 E.06654
G3 X119.334 Y105.579 I-.163 J2.879 E.17638
G3 X117.442 Y108.77 I-2.763 J.519 E.15093
G1 X117.419 Y108.775 E.00089
; WIPE_START
G1 F24000
G1 X116.576 Y108.908 E-.32421
G1 X115.708 Y108.775 E-.33358
G1 X115.468 Y108.653 E-.10221
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I.06 J1.215 P1  F30000
G1 X153.757 Y106.754 Z.6
G1 Z.2
G1 E.8 F1800
G1 F3000
G1 X153.757 Y104.198 E.0952
G1 X154.055 Y104.321 E.01201
G3 X154.547 Y105.871 I-.622 J1.05 E.06629
G3 X153.813 Y106.737 I-1.078 J-.17 E.04447
G1 X153.828 Y107.143 F30000
G1 F3000
G1 X153.3 Y107.164 E.01971
G1 X153.3 Y103.788 E.12574
G3 X153.694 Y103.77 I.301 J2.212 E.01472
G3 X155 Y105.928 I-.139 J1.558 E.10932
G3 X153.933 Y107.141 I-1.435 J-.187 E.06383
G1 X153.888 Y107.142 E.00167
G1 X154.006 Y107.547 F30000
G1 F3000
G1 X153.695 Y107.638 E.01209
G3 X152.843 Y107.496 I-.122 J-1.893 E.03246
G1 X152.843 Y103.453 E.15056
G3 X153.721 Y103.313 I.764 J1.965 E.0334
G3 X155.454 Y105.986 I-.1 J1.963 E.13829
G3 X154.487 Y107.407 I-1.881 J-.241 E.06643
G1 X154.064 Y107.53 E.01644
G1 X154.214 Y107.993 F30000
G1 F3000
G1 X154.016 Y108.054 E.00773
G3 X152.386 Y107.779 I-.447 J-2.318 E.0629
G1 X152.386 Y103.164 E.17186
G3 X153.749 Y102.857 I1.222 J2.239 E.05273
G3 X155.885 Y106.189 I-.205 J2.482 E.17039
G3 X154.575 Y107.871 I-2.317 J-.453 E.0824
G1 X154.271 Y107.974 E.01194
G1 X154.385 Y108.417 F30000
G1 F3000
G1 X153.927 Y108.529 E.01755
G3 X151.929 Y108.022 I-.356 J-2.792 E.07862
G1 X151.931 Y102.913 E.19029
G3 X153.776 Y102.4 I1.673 J2.442 E.07262
G3 X156.334 Y106.274 I-.192 J2.908 E.20005
G3 X154.607 Y108.354 I-2.762 J-.537 E.105
G1 X154.442 Y108.4 E.00638
; WIPE_START
G1 F24000
G1 X153.927 Y108.529 E-.20185
G1 X153.224 Y108.534 E-.26721
G1 X152.542 Y108.359 E-.26747
G1 X152.488 Y108.329 E-.02347
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I.154 J-1.207 P1  F30000
G1 X145.071 Y107.383 Z.6
G1 Z.2
G1 E.8 F1800
G1 F3000
G3 X143.559 Y102.305 I-1.711 J-2.255 E.40701
G3 X145.071 Y102.834 I-.218 J3.052 E.0604
G1 X145.071 Y107.323 E.1672
G1 X144.614 Y107.136 F30000
G1 F3000
G3 X143.531 Y102.761 I-1.258 J-2.01 E.33345
G3 X144.614 Y103.078 I-.173 J2.6 E.04237
G1 X144.614 Y107.076 E.14892
G1 X144.157 Y106.85 F30000
G1 F3000
G3 X143.504 Y103.218 I-.824 J-1.727 E.26195
G3 X144.157 Y103.364 I-.151 J2.2 E.02504
G1 X144.157 Y106.79 E.1276
G1 X143.7 Y106.52 F30000
G1 F3000
G3 X143.477 Y103.674 I-.375 J-1.402 E.1896
G1 X143.7 Y103.694 E.00836
G1 X143.7 Y106.46 E.10302
G1 X143.243 Y106.102 F30000
G1 F3000
G3 X143.243 Y104.112 I.088 J-.995 E.11031
G1 X143.243 Y106.042 E.07187
; WIPE_START
G1 F24000
G1 X142.867 Y105.96 E-.14638
G1 X142.564 Y105.722 E-.14626
G1 X142.401 Y105.46 E-.11739
G1 X142.33 Y105.107 E-.13672
G1 X142.401 Y104.754 E-.13672
G1 X142.507 Y104.583 E-.07652
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-1.204 J.179 P1  F30000
G1 X143.622 Y112.06 Z.6
G1 Z.2
G1 E.8 F1800
G1 F3000
G1 X143.658 Y112.058 E.00134
G3 X145.071 Y112.548 I-.185 J2.819 E.05639
G1 X145.071 Y117.173 E.17228
G3 X142.955 Y112.102 I-1.59 J-2.314 E.37168
G1 X143.562 Y112.064 E.02264
G1 X143.59 Y112.517 F30000
G1 F3000
G1 X143.629 Y112.514 E.00144
G3 X144.614 Y112.801 I-.161 J2.394 E.03851
G1 X144.614 Y116.92 E.15342
G3 X143.041 Y112.552 I-1.132 J-2.06 E.30247
G1 X143.531 Y112.521 E.01827
G1 X143.6 Y112.971 F30000
G1 F3000
G3 X144.157 Y113.086 I-.255 J2.634 E.02122
M73 P32 R13
G1 X144.157 Y116.635 E.13217
G3 X143.541 Y112.968 I-.67 J-1.772 E.24926
G1 X143.573 Y113.44 F30000
G1 F3000
G1 X143.7 Y113.431 E.00476
G1 X143.7 Y116.29 E.10646
G3 X143.123 Y113.464 I-.208 J-1.429 E.16283
G1 X143.513 Y113.443 E.01454
G1 X143.243 Y113.865 F30000
G1 F3000
G1 X143.243 Y115.856 E.07415
G3 X143.189 Y113.883 I.302 J-.995 E.09677
; WIPE_START
G1 F24000
G1 X143.243 Y115.856 E-.74995
G1 X143.222 Y115.84 E-.01005
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-.422 J1.142 P1  F30000
G1 X151.929 Y119.057 Z.6
G1 Z.2
G1 E.8 F1800
G1 F3000
G3 X153.695 Y118.567 I1.595 J2.324 E.06953
G3 X153.87 Y124.155 I-.178 J2.802 E.30875
G3 X151.929 Y123.682 I-.332 J-2.859 E.07603
G1 X151.929 Y119.117 E.17005
G1 X152.386 Y119.31 F30000
G1 F3000
G3 X153.666 Y119.023 I1.139 J2.089 E.04951
G3 X153.813 Y123.701 I-.149 J2.346 E.25846
G3 X152.386 Y123.429 I-.276 J-2.429 E.05496
G1 X152.386 Y119.37 E.15119
G1 X152.843 Y119.595 F30000
G1 F3000
G3 X153.637 Y119.48 I.709 J2.09 E.03008
G3 X153.756 Y123.248 I-.12 J1.89 E.20818
G3 X152.843 Y123.144 I-.235 J-1.998 E.03453
G1 X152.843 Y119.655 E.12993
G1 X153.3 Y119.94 F30000
G1 F3000
G3 X153.609 Y119.936 I.187 J2.454 E.01151
G3 X153.698 Y122.794 I-.091 J1.433 E.1579
G3 X153.3 Y122.799 I-.223 J-2.113 E.01487
G1 X153.3 Y120 E.10422
G1 X153.757 Y120.374 F30000
G1 F3000
G1 X154.043 Y120.543 E.01238
G3 X154.094 Y122.161 I-.526 J.826 E.07098
G3 X153.757 Y122.365 I-1.789 J-2.577 E.01467
G1 X153.757 Y120.434 E.07192
; WIPE_START
G1 F24000
G1 X154.043 Y120.543 E-.11635
G1 X154.345 Y120.845 E-.16225
G1 X154.495 Y121.308 E-.18497
G1 X154.404 Y121.786 E-.18499
G1 X154.217 Y122.012 E-.11145
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-1.208 J-.149 P1  F30000
G1 X153.639 Y126.706 Z.6
G1 Z.2
G1 E.8 F1800
G1 F3000
G3 X155.354 Y131.617 I-.139 J2.804 E.24786
G1 X153.972 Y131.084 E.05519
G1 X151.929 Y131.055 E.07611
G1 X151.929 Y127.19 E.14396
G3 X153.58 Y126.704 I1.613 J2.434 E.06508
G1 X153.62 Y127.163 F30000
G1 F3000
G1 X153.622 Y127.163 E.00007
G3 X155.241 Y131.082 I-.107 J2.339 E.19762
G2 X154.019 Y130.627 I-1.863 J3.135 E.04882
G1 X152.386 Y130.604 E.06086
G1 X152.386 Y127.444 E.11771
G3 X153.027 Y127.219 I1.185 J2.348 E.02538
G1 X153.56 Y127.168 E.01994
G1 X153.604 Y127.619 F30000
G1 F3000
G3 X155.086 Y130.53 I-.086 J1.877 E.14748
G2 X154.067 Y130.171 I-1.499 J2.624 E.04047
G1 X152.843 Y130.154 E.0456
G1 X152.843 Y127.741 E.08987
G3 X153.545 Y127.619 I.727 J2.111 E.02665
G1 X153.561 Y128.077 F30000
G1 F3000
G1 X153.586 Y128.076 E.00095
G3 X154.867 Y129.953 I-.058 J1.415 E.09822
G2 X153.3 Y129.703 I-1.199 J2.475 E.05996
G1 X153.3 Y128.087 E.0602
G1 X153.501 Y128.079 E.0075
G1 X153.757 Y128.489 F30000
G1 F3000
G1 X154.086 Y128.708 E.01473
G3 X154.5 Y129.262 I-.779 J1.013 E.0261
G1 X153.757 Y129.252 E.02769
G1 X153.757 Y128.549 E.0262
; WIPE_START
G1 F24000
G1 X154.086 Y128.708 E-.13895
G1 X154.5 Y129.262 E-.26294
G1 X153.757 Y129.252 E-.28248
G1 X153.757 Y129.053 E-.07563
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I.071 J-1.215 P1  F30000
G1 X145.071 Y128.549 Z.6
G1 Z.2
G1 E.8 F1800
G1 F3000
G1 X145.071 Y131.368 E.10502
G1 X144.088 Y133.166 E.07633
G3 X143.718 Y127.607 I-.608 J-2.751 E.36138
G3 X145.071 Y128.03 I-.232 J3.121 E.05329
G1 X145.071 Y128.489 E.01706
G1 X144.614 Y128.489 F30000
G1 F3000
G1 X144.614 Y131.251 E.10291
G1 X143.796 Y132.746 E.06348
G3 X143.69 Y128.064 I-.321 J-2.335 E.2958
G3 X144.614 Y128.3 I-.228 J2.824 E.03569
G1 X144.614 Y128.429 E.0048
G1 X144.157 Y128.603 F30000
G1 F3000
G1 X144.157 Y131.135 E.09429
G1 X143.515 Y132.308 E.04983
G3 X143.663 Y128.52 I-.038 J-1.898 E.2305
G3 X144.099 Y128.589 I-.219 J2.828 E.01647
G1 X143.243 Y129.411 F30000
G1 F3000
G1 X143.243 Y130.901 E.05548
G1 X143.027 Y131.296 E.01677
G3 X143.188 Y129.428 I.487 J-.899 E.08835
G1 X143.006 Y129.08 F30000
G1 F3000
G1 X143.065 Y129.014 E.00328
G3 X143.7 Y128.969 I.417 J1.384 E.02391
G1 X143.7 Y131.018 E.0763
G1 X143.258 Y131.826 E.03433
G3 X142.562 Y129.284 I.225 J-1.428 E.12358
G1 X142.952 Y129.105 E.01597
; WIPE_START
G1 F24000
G1 X143.065 Y129.014 E-.05518
G1 X143.7 Y128.969 E-.24193
G1 X143.7 Y130.187 E-.46289
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-.36 J1.163 P1  F30000
G1 X150.643 Y132.335 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3000
G1 X153.452 Y132.335 E.10462
G3 X155.46 Y135.254 I.009 J2.144 E.15532
G3 X104.473 Y135.052 I-25.454 J-9.901 E2.44918
G3 X106.548 Y132.335 I2.066 J-.573 E.14739
G1 X109.357 Y132.335 E.10462
G1 X109.357 Y103.899 E1.05911
G1 X113.643 Y103.899 E.15963
G1 X113.643 Y131.652 E1.03368
G2 X146.357 Y131.652 I16.357 J-6.309 E1.57066
G1 X146.357 Y103.899 E1.03368
G1 X150.643 Y103.899 E.15963
G1 X150.643 Y132.275 E1.05688
G1 X151.1 Y131.878 F30000
; FEATURE: Outer wall
G1 F3000
M73 P33 R13
G1 X153.458 Y131.878 E.08781
G3 X155.886 Y135.42 I.003 J2.601 E.18816
G3 X104.033 Y135.175 I-25.88 J-10.065 E2.49171
G3 X106.542 Y131.878 I2.507 J-.696 E.17854
G1 X108.9 Y131.878 E.08781
G1 X108.9 Y103.442 E1.05911
G1 X114.1 Y103.442 E.19368
G1 X114.1 Y131.559 E1.04724
G2 X145.9 Y131.559 I15.9 J-6.21 E1.52389
G1 X145.9 Y103.442 E1.04725
G1 X151.1 Y103.442 E.19368
G1 X151.1 Y131.818 E1.05688
; WIPE_START
G1 F24000
G1 X153.099 Y131.869 E-.76
; WIPE_END
M73 P33 R12
G1 E-.04 F1800
G17
G3 Z.6 I1.207 J-.155 P1  F30000
G1 X149.536 Y104.082 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.500114
G1 F6300
G1 X150.254 Y104.801 E.03786
G1 X150.254 Y105.447 E.02409
G1 X149.095 Y104.288 E.06109
G1 X148.448 Y104.288 E.02409
G1 X150.254 Y106.094 E.09515
G1 X150.254 Y106.741 E.02409
G1 X147.802 Y104.288 E.12922
G1 X147.155 Y104.288 E.02409
G1 X150.254 Y107.387 E.16328
G1 X150.254 Y108.034 E.02409
G1 X146.746 Y104.525 E.18487
G1 X146.746 Y105.171 E.02409
G1 X150.254 Y108.68 E.18487
G1 X150.254 Y109.327 E.02409
G1 X146.746 Y105.818 E.18487
G1 X146.746 Y106.465 E.02409
G1 X150.254 Y109.973 E.18487
G1 X150.254 Y110.62 E.02409
G1 X146.746 Y107.111 E.18487
G1 X146.746 Y107.758 E.02409
G1 X150.254 Y111.266 E.18487
G1 X150.254 Y111.913 E.02409
G1 X146.746 Y108.404 E.18487
G1 X146.746 Y109.051 E.02409
G1 X150.254 Y112.56 E.18487
G1 X150.254 Y113.206 E.02409
G1 X146.746 Y109.697 E.18487
G1 X146.746 Y110.344 E.02409
G1 X150.254 Y113.853 E.18487
G1 X150.254 Y114.499 E.02409
G1 X146.746 Y110.991 E.18487
G1 X146.746 Y111.637 E.02409
G1 X150.254 Y115.146 E.18487
G1 X150.254 Y115.792 E.02409
G1 X146.746 Y112.284 E.18487
G1 X146.746 Y112.93 E.02409
G1 X150.254 Y116.439 E.18487
G1 X150.254 Y117.086 E.02409
G1 X146.746 Y113.577 E.18487
G1 X146.746 Y114.223 E.02409
G1 X150.254 Y117.732 E.18487
M73 P34 R12
G1 X150.254 Y118.379 E.02409
G1 X146.746 Y114.87 E.18487
G1 X146.746 Y115.517 E.02409
G1 X150.254 Y119.025 E.18487
G1 X150.254 Y119.672 E.02409
G1 X146.746 Y116.163 E.18487
G1 X146.746 Y116.81 E.02409
G1 X150.254 Y120.318 E.18487
G1 X150.254 Y120.965 E.02409
G1 X146.746 Y117.456 E.18487
G1 X146.746 Y118.103 E.02409
G1 X150.254 Y121.612 E.18487
G1 X150.254 Y122.258 E.02409
G1 X146.746 Y118.749 E.18487
G1 X146.746 Y119.396 E.02409
G1 X150.254 Y122.905 E.18487
G1 X150.254 Y123.551 E.02409
G1 X146.746 Y120.042 E.18487
G1 X146.746 Y120.689 E.02409
G1 X150.254 Y124.198 E.18487
G1 X150.254 Y124.844 E.02409
G1 X146.746 Y121.336 E.18487
G1 X146.746 Y121.982 E.02409
G1 X150.254 Y125.491 E.18487
G1 X150.254 Y126.138 E.02409
G1 X146.746 Y122.629 E.18487
G1 X146.746 Y123.275 E.02409
G1 X150.254 Y126.784 E.18487
G1 X150.254 Y127.431 E.02409
G1 X146.746 Y123.922 E.18487
G1 X146.746 Y124.568 E.02409
G1 X150.254 Y128.077 E.18487
G1 X150.254 Y128.724 E.02409
G1 X146.746 Y125.215 E.18487
G1 X146.746 Y125.862 E.02409
G1 X150.254 Y129.37 E.18487
G1 X150.254 Y130.017 E.02409
G1 X146.746 Y126.508 E.18487
G1 X146.746 Y127.155 E.02409
G1 X150.254 Y130.664 E.18487
G1 X150.254 Y131.31 E.02409
G1 X146.746 Y127.801 E.18487
G1 X146.746 Y128.448 E.02409
G1 X150.46 Y132.162 E.19571
; WIPE_START
G1 F24000
G1 X149.046 Y130.748 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-.458 J1.127 P1  F30000
G1 X153.404 Y132.521 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6300
G1 X155.208 Y134.324 E.095
G3 X155.156 Y134.919 I-1.287 J.188 E.02245
G1 X152.963 Y132.726 E.11553
G1 X152.316 Y132.725 E.02411
G1 X154.982 Y135.391 E.14045
G1 X154.791 Y135.847 E.01842
G1 X151.669 Y132.724 E.16452
G1 X151.021 Y132.724 E.02411
G1 X154.601 Y136.303 E.18859
G3 X154.394 Y136.743 I-4.598 J-1.9 E.01811
G1 X146.746 Y129.094 E.40296
G1 X146.746 Y129.741 E.02409
G1 X154.185 Y137.181 E.39197
G3 X153.972 Y137.614 I-4.507 J-1.943 E.01801
G1 X146.746 Y130.388 E.38076
G1 X146.746 Y131.034 E.02409
G1 X153.746 Y138.035 E.36884
G1 X153.52 Y138.455 E.01779
G1 X146.746 Y131.681 E.35693
G1 X146.746 Y131.731 E.00188
G1 X146.568 Y132.15 E.01694
G1 X153.287 Y138.869 E.354
G1 X153.044 Y139.272 E.01755
G1 X146.375 Y132.604 E.35135
G3 X146.171 Y133.046 I-4.578 J-1.849 E.01815
G1 X152.801 Y139.676 E.34931
G3 X152.546 Y140.068 I-4.155 J-2.415 E.01742
G1 X145.96 Y133.481 E.34702
G3 X145.735 Y133.903 I-4.347 J-2.057 E.0178
G1 X152.287 Y140.455 E.34523
G1 X152.027 Y140.842 E.01736
G1 X145.506 Y134.321 E.34359
G3 X145.261 Y134.722 I-4.154 J-2.259 E.01753
G1 X151.754 Y141.215 E.34208
G1 X151.477 Y141.585 E.01721
G1 X145.014 Y135.122 E.34052
G1 X144.751 Y135.506 E.01733
G1 X151.201 Y141.955 E.3398
G3 X150.91 Y142.311 I-3.87 J-2.857 E.01713
G1 X144.487 Y135.887 E.33846
G1 X144.207 Y136.255 E.01719
G1 X150.618 Y142.666 E.33778
G3 X150.325 Y143.019 I-3.758 J-2.833 E.01711
G1 X143.925 Y136.619 E.33718
G1 X143.629 Y136.97 E.0171
G1 X150.017 Y143.357 E.33653
G1 X149.709 Y143.696 E.01705
G1 X143.33 Y137.317 E.3361
G1 X143.018 Y137.652 E.01704
M73 P35 R12
G1 X149.397 Y144.031 E.33609
G1 X149.073 Y144.353 E.01703
G1 X142.701 Y137.982 E.33569
G1 X142.373 Y138.3 E.01703
G1 X148.748 Y144.675 E.33588
G3 X148.42 Y144.994 I-3.499 J-3.276 E.01704
G1 X142.04 Y138.613 E.33617
G1 X141.696 Y138.916 E.01707
G1 X148.081 Y145.301 E.33639
G1 X147.741 Y145.608 E.01705
G1 X141.345 Y139.212 E.33698
G1 X140.985 Y139.498 E.01714
G1 X147.394 Y145.907 E.33766
G1 X147.038 Y146.198 E.01712
G1 X140.617 Y139.777 E.33831
G1 X140.241 Y140.047 E.01726
G1 X146.683 Y146.489 E.33942
G3 X146.318 Y146.77 I-3.053 J-3.583 E.01718
G1 X139.855 Y140.308 E.3405
G1 X139.462 Y140.561 E.01743
G1 X145.946 Y147.045 E.34163
G1 X145.574 Y147.32 E.01722
G1 X139.057 Y140.803 E.34336
G1 X138.647 Y141.04 E.01764
G1 X145.191 Y147.583 E.34475
G1 X144.803 Y147.842 E.01737
G1 X138.223 Y141.263 E.34664
G1 X137.796 Y141.481 E.0179
G1 X144.415 Y148.1 E.34874
G3 X144.011 Y148.344 I-2.684 J-3.99 E.01755
G1 X137.352 Y141.684 E.35089
G3 X136.904 Y141.883 I-2.235 J-4.419 E.01825
G1 X143.607 Y148.586 E.35314
G3 X143.2 Y148.826 I-2.651 J-4.026 E.0176
G1 X136.44 Y142.065 E.3562
G3 X135.969 Y142.241 I-2.013 J-4.667 E.01873
G1 X142.779 Y149.051 E.35878
G1 X142.357 Y149.275 E.0178
G1 X135.485 Y142.403 E.36206
G3 X134.989 Y142.554 I-1.769 J-4.934 E.01932
G1 X141.929 Y149.494 E.36565
G1 X141.49 Y149.701 E.0181
G1 X134.484 Y142.696 E.36909
G3 X133.961 Y142.819 I-1.488 J-5.155 E.02004
G1 X141.05 Y149.909 E.37353
G3 X140.599 Y150.104 I-2.22 J-4.5 E.01832
G1 X133.429 Y142.934 E.37777
G1 X132.88 Y143.031 E.02079
G1 X140.142 Y150.293 E.38263
G1 X139.685 Y150.482 E.01844
G1 X132.314 Y143.112 E.38831
G3 X131.738 Y143.183 I-1.003 J-5.804 E.02163
G1 X139.209 Y150.653 E.39358
G1 X138.732 Y150.823 E.01885
G1 X131.137 Y143.228 E.40018
G3 X130.518 Y143.255 I-.588 J-6.287 E.0231
G1 X138.248 Y150.986 E.40731
G1 X137.752 Y151.136 E.01932
G1 X129.881 Y143.265 E.41472
G1 X129.218 Y143.249 E.02469
G1 X137.256 Y151.287 E.42348
G3 X136.742 Y151.42 I-1.613 J-5.169 E.01977
G1 X128.525 Y143.202 E.43296
G3 X127.804 Y143.127 I.376 J-7.164 E.02702
G1 X136.225 Y151.549 E.4437
G3 X135.7 Y151.67 I-1.502 J-5.294 E.02009
G1 X127.048 Y143.018 E.45585
G3 X126.25 Y142.867 I1.093 J-7.943 E.03027
G1 X135.16 Y151.777 E.46946
G1 X134.621 Y151.885 E.02049
G1 X125.4 Y142.664 E.48582
G3 X124.482 Y142.392 I2.286 J-9.418 E.03568
G1 X134.059 Y151.969 E.50458
G1 X133.496 Y152.052 E.02121
G1 X123.474 Y142.031 E.52801
G3 X122.342 Y141.546 I4.313 J-11.624 E.04589
G1 X132.916 Y152.12 E.55711
G1 X132.328 Y152.178 E.02204
G1 X120.336 Y140.185 E.63183
; WIPE_START
G1 F24000
G1 X121.75 Y141.6 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I1.187 J-.268 P1  F30000
G1 X113.46 Y104.861 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6300
G1 X112.887 Y104.288 E.03019
G1 X112.241 Y104.288 E.02409
G1 X113.254 Y105.302 E.05342
G1 X113.254 Y105.948 E.02409
M73 P36 R12
G1 X111.594 Y104.288 E.08749
G1 X110.947 Y104.288 E.02409
G1 X113.254 Y106.595 E.12155
G1 X113.254 Y107.242 E.02409
G1 X110.301 Y104.288 E.15562
G1 X109.746 Y104.288 E.02068
G1 X109.746 Y104.379 E.0034
G1 X113.254 Y107.888 E.18487
G1 X113.254 Y108.535 E.02409
G1 X109.746 Y105.026 E.18487
G1 X109.746 Y105.672 E.02409
G1 X113.254 Y109.181 E.18487
G1 X113.254 Y109.828 E.02409
G1 X109.746 Y106.319 E.18487
G1 X109.746 Y106.966 E.02409
G1 X113.254 Y110.474 E.18487
G1 X113.254 Y111.121 E.02409
G1 X109.746 Y107.612 E.18487
G1 X109.746 Y108.259 E.02409
G1 X113.254 Y111.768 E.18487
G1 X113.254 Y112.414 E.02409
G1 X109.746 Y108.905 E.18487
G1 X109.746 Y109.552 E.02409
G1 X113.254 Y113.061 E.18487
G1 X113.254 Y113.707 E.02409
G1 X109.746 Y110.198 E.18487
G1 X109.746 Y110.845 E.02409
G1 X113.254 Y114.354 E.18487
G1 X113.254 Y115 E.02409
G1 X109.746 Y111.492 E.18487
G1 X109.746 Y112.138 E.02409
G1 X113.254 Y115.647 E.18487
G1 X113.254 Y116.294 E.02409
G1 X109.746 Y112.785 E.18487
G1 X109.746 Y113.431 E.02409
G1 X113.254 Y116.94 E.18487
G1 X113.254 Y117.587 E.02409
G1 X109.746 Y114.078 E.18487
G1 X109.746 Y114.724 E.02409
G1 X113.254 Y118.233 E.18487
G1 X113.254 Y118.88 E.02409
G1 X109.746 Y115.371 E.18487
G1 X109.746 Y116.018 E.02409
G1 X113.254 Y119.526 E.18487
G1 X113.254 Y120.173 E.02409
G1 X109.746 Y116.664 E.18487
G1 X109.746 Y117.311 E.02409
G1 X113.254 Y120.82 E.18487
G1 X113.254 Y121.466 E.02409
G1 X109.746 Y117.957 E.18487
G1 X109.746 Y118.604 E.02409
G1 X113.254 Y122.113 E.18487
G1 X113.254 Y122.759 E.02409
G1 X109.746 Y119.25 E.18487
G1 X109.746 Y119.897 E.02409
G1 X113.254 Y123.406 E.18487
G1 X113.254 Y124.052 E.02409
G1 X109.746 Y120.544 E.18487
G1 X109.746 Y121.19 E.02409
G1 X113.254 Y124.699 E.18487
G1 X113.254 Y125.346 E.02409
G1 X109.746 Y121.837 E.18487
G1 X109.746 Y122.483 E.02409
G1 X113.254 Y125.992 E.18487
G1 X113.254 Y126.639 E.02409
G1 X109.746 Y123.13 E.18487
G1 X109.746 Y123.776 E.02409
G1 X113.254 Y127.285 E.18487
G1 X113.254 Y127.932 E.02409
G1 X109.746 Y124.423 E.18487
G1 X109.746 Y125.07 E.02409
G1 X113.254 Y128.578 E.18487
G1 X113.254 Y129.225 E.02409
G1 X109.746 Y125.716 E.18487
G1 X109.746 Y126.363 E.02409
G1 X113.254 Y129.872 E.18487
G1 X113.254 Y130.518 E.02409
G1 X109.746 Y127.009 E.18487
G1 X109.746 Y127.656 E.02409
G1 X113.254 Y131.165 E.18487
G1 X113.254 Y131.731 E.0211
G1 X113.313 Y131.87 E.00564
G1 X109.746 Y128.302 E.18798
G1 X109.746 Y128.949 E.02409
G1 X113.817 Y133.02 E.21451
G2 X114.528 Y134.378 I20.763 J-10.009 E.05711
G1 X109.746 Y129.596 E.25197
G1 X109.746 Y130.242 E.02409
G1 X131.728 Y152.224 E1.15818
G1 X131.111 Y152.254 E.02299
G1 X109.746 Y130.889 E1.1257
G1 X109.746 Y131.535 E.02409
G1 X130.487 Y152.277 E1.0928
G1 X129.84 Y152.277 E.02409
G1 X109.746 Y132.182 E1.05874
G1 X109.746 Y132.723 E.02016
M73 P37 R12
G1 X109.64 Y132.723 E.00392
G1 X129.186 Y152.269 E1.02982
G1 X128.506 Y152.236 E.02536
G1 X108.994 Y132.724 E1.02803
G1 X108.349 Y132.724 E.02406
G1 X127.816 Y152.192 E1.02567
G1 X127.099 Y152.121 E.02684
G1 X107.703 Y132.725 E1.02192
G1 X107.057 Y132.726 E.02406
G1 X126.36 Y152.03 E1.01707
G1 X125.603 Y151.919 E.02852
G1 X106.416 Y132.731 E1.01093
G2 X105.89 Y132.853 I.082 J1.552 E.02018
G1 X124.809 Y151.771 E.99677
G3 X123.995 Y151.604 I1.302 J-8.386 E.03098
G1 X105.478 Y133.087 E.97562
G2 X105.154 Y133.409 I1.104 J1.432 E.01708
G1 X123.133 Y151.388 E.94727
G3 X122.228 Y151.13 I2.178 J-9.352 E.03506
G1 X104.917 Y133.819 E.91209
G2 X104.794 Y134.342 I1.696 J.675 E.02011
G1 X121.278 Y150.827 E.86853
G3 X120.268 Y150.463 I3.209 J-10.49 E.04005
G1 X104.9 Y135.095 E.80966
G1 X105.355 Y136.197 E.04441
G1 X119.166 Y150.007 E.72761
G1 X117.947 Y149.436 E.05012
G1 X105.927 Y137.415 E.63333
G1 X106.683 Y138.818 E.05938
G1 X116.537 Y148.671 E.51915
G3 X114.786 Y147.568 I10.379 J-18.399 E.07712
G1 X107.793 Y140.574 E.36846
G1 X108.013 Y140.903 E.01473
G2 X110.526 Y143.954 I24.582 J-17.682 E.14737
G1 X113.36 Y146.788 E.14928
M106 S247.35
M106 P2 S178
; CHANGE_LAYER
; Z_HEIGHT: 0.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X111.945 Y145.373 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 2/58
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
G3 Z.6 I.393 J1.152 P1  F30000
G1 X150.898 Y132.08 Z.6
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X153.455 Y132.08 E.08483
G3 X155.697 Y135.347 I.006 J2.399 E.15464
G3 X104.228 Y135.122 I-25.692 J-9.993 E2.20235
G3 X106.545 Y132.08 I2.311 J-.643 E.14678
G1 X109.102 Y132.08 E.08483
G1 X109.102 Y103.366 E.95249
G1 X113.898 Y103.366 E.15909
G1 X113.898 Y131.6 E.93658
G2 X146.102 Y131.601 I16.102 J-6.256 E1.37552
G1 X146.102 Y103.366 E.93659
G1 X150.898 Y103.366 E.15909
G1 X150.898 Y132.02 E.9505
G1 X151.29 Y131.688 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X153.46 Y131.688 E.06668
G3 X156.063 Y135.489 I.001 J2.791 E.16649
G3 X103.891 Y135.36 I-26.061 J-10.136 E2.06616
G3 X106.54 Y131.688 I2.654 J-.877 E.16218
G1 X108.71 Y131.688 E.06668
G1 X108.71 Y103.211 E.875
G1 X108.71 Y103.047 E.00504
M106 S255
G1 F1800
G1 X108.71 Y102.974 E.00226
G1 X114.29 Y102.974 E.17146
G1 X114.29 Y103.047 E.00226
M106 S247.35
G1 F12000
G1 X114.29 Y103.211 E.00504
G1 X114.29 Y131.521 E.86986
G2 X145.71 Y131.521 I15.71 J-6.173 E1.24102
G1 X145.71 Y103.211 E.86987
G1 X145.71 Y103.047 E.00504
M106 S255
G1 F1800
G1 X145.71 Y102.974 E.00226
M73 P38 R12
G1 X151.29 Y102.974 E.17146
G1 X151.29 Y103.047 E.00226
M106 S247.35
G1 F12000
G1 X151.29 Y103.211 E.00504
G1 X151.29 Y131.628 E.87316
M204 S10000
; WIPE_START
G1 F24000
G1 X153.289 Y131.683 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I-.548 J-1.086 P1  F30000
G1 X143.141 Y136.805 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42148
G1 F15000
G1 X150.565 Y129.381 E.32386
G1 X150.565 Y128.846 E.01651
G1 X145.227 Y134.183 E.23284
G2 X145.823 Y133.052 I-23.136 J-12.91 E.03945
G1 X150.565 Y128.31 E.20684
G1 X150.565 Y127.775 E.01651
G1 X146.261 Y132.079 E.18776
G1 X146.435 Y131.669 E.01376
G1 X146.435 Y131.369 E.00924
G1 X150.565 Y127.24 E.18014
G1 X150.565 Y126.704 E.01651
G1 X146.435 Y130.834 E.18014
G1 X146.435 Y130.298 E.01651
G1 X150.565 Y126.169 E.18014
M73 P38 R11
G1 X150.565 Y125.634 E.01651
G1 X146.435 Y129.763 E.18014
G1 X146.435 Y129.228 E.01651
G1 X150.565 Y125.098 E.18014
G1 X150.565 Y124.563 E.01651
G1 X146.435 Y128.692 E.18014
G1 X146.435 Y128.157 E.01651
G1 X150.565 Y124.027 E.18014
G1 X150.565 Y123.492 E.01651
G1 X146.435 Y127.621 E.18014
G1 X146.435 Y127.086 E.01651
G1 X150.565 Y122.957 E.18014
G1 X150.565 Y122.421 E.01651
G1 X146.435 Y126.551 E.18014
G1 X146.435 Y126.015 E.01651
G1 X150.565 Y121.886 E.18014
G1 X150.565 Y121.351 E.01651
G1 X146.435 Y125.48 E.18014
G1 X146.435 Y124.945 E.01651
G1 X150.565 Y120.815 E.18014
G1 X150.565 Y120.28 E.01651
G1 X146.435 Y124.409 E.18014
G1 X146.435 Y123.874 E.01651
G1 X150.565 Y119.745 E.18014
G1 X150.565 Y119.209 E.01651
G1 X146.435 Y123.339 E.18014
G1 X146.435 Y122.803 E.01651
G1 X150.565 Y118.674 E.18014
G1 X150.565 Y118.138 E.01651
G1 X146.435 Y122.268 E.18014
G1 X146.435 Y121.732 E.01651
G1 X150.565 Y117.603 E.18014
G1 X150.565 Y117.068 E.01651
G1 X146.435 Y121.197 E.18014
G1 X146.435 Y120.662 E.01651
G1 X150.565 Y116.532 E.18014
G1 X150.565 Y115.997 E.01651
G1 X146.435 Y120.126 E.18014
G1 X146.435 Y119.591 E.01651
G1 X150.565 Y115.462 E.18014
G1 X150.565 Y114.926 E.01651
G1 X146.435 Y119.056 E.18014
G1 X146.435 Y118.52 E.01651
G1 X150.565 Y114.391 E.18014
G1 X150.565 Y113.856 E.01651
G1 X146.435 Y117.985 E.18014
G1 X146.435 Y117.45 E.01651
G1 X150.565 Y113.32 E.18014
G1 X150.565 Y112.785 E.01651
G1 X146.435 Y116.914 E.18014
G1 X146.435 Y116.379 E.01651
G1 X150.565 Y112.249 E.18014
G1 X150.565 Y111.714 E.01651
G1 X146.435 Y115.843 E.18014
G1 X146.435 Y115.308 E.01651
G1 X150.565 Y111.179 E.18014
G1 X150.565 Y110.643 E.01651
G1 X146.435 Y114.773 E.18014
G1 X146.435 Y114.237 E.01651
G1 X150.565 Y110.108 E.18014
G1 X150.565 Y109.573 E.01651
G1 X146.435 Y113.702 E.18014
G1 X146.435 Y113.167 E.01651
G1 X150.565 Y109.037 E.18014
G1 X150.565 Y108.502 E.01651
G1 X146.435 Y112.631 E.18014
G1 X146.435 Y112.096 E.01651
G1 X150.565 Y107.967 E.18014
G1 X150.565 Y107.431 E.01651
G1 X146.435 Y111.561 E.18014
G1 X146.435 Y111.025 E.01651
G1 X150.565 Y106.896 E.18014
G1 X150.565 Y106.36 E.01651
G1 X146.435 Y110.49 E.18014
G1 X146.435 Y109.954 E.01651
G1 X150.565 Y105.825 E.18014
G1 X150.565 Y105.29 E.01651
G1 X146.435 Y109.419 E.18014
G1 X146.435 Y108.884 E.01651
G1 X150.565 Y104.754 E.18014
G1 X150.565 Y104.219 E.01651
G1 X146.435 Y108.348 E.18014
G1 X146.435 Y107.813 E.01651
G1 X150.549 Y103.699 E.17946
G1 X150.014 Y103.699 E.01651
G1 X146.435 Y107.278 E.1561
G1 X146.435 Y106.742 E.01651
G1 X149.478 Y103.699 E.13275
G1 X148.943 Y103.699 E.01651
G1 X146.435 Y106.207 E.10939
G1 X146.435 Y105.671 E.01651
G1 X148.408 Y103.699 E.08604
G1 X147.872 Y103.699 E.01651
G1 X146.435 Y105.136 E.06268
G1 X146.435 Y104.601 E.01651
G1 X147.337 Y103.699 E.03933
G1 X146.801 Y103.699 E.01651
G1 X146.266 Y104.235 E.02337
; WIPE_START
G1 F24000
G1 X146.801 Y103.699 E-.28793
G1 X147.337 Y103.699 E-.20344
G1 X146.837 Y104.199 E-.26864
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I.022 J-1.217 P1  F30000
G1 X110.031 Y103.53 Z.8
G1 Z.4
G1 E.8 F1800
G1 F15000
G1 X109.435 Y104.125 E.02598
G1 X109.435 Y104.661 E.01651
G1 X110.397 Y103.699 E.04194
G1 X110.932 Y103.699 E.01651
G1 X109.435 Y105.196 E.06529
G1 X109.435 Y105.731 E.01651
G1 X111.467 Y103.699 E.08865
G1 X112.003 Y103.699 E.01651
G1 X109.435 Y106.267 E.112
G1 X109.435 Y106.802 E.01651
G1 X112.538 Y103.699 E.13536
G1 X113.073 Y103.699 E.01651
G1 X109.435 Y107.337 E.15871
G1 X109.435 Y107.873 E.01651
G1 X113.565 Y103.743 E.18014
G1 X113.565 Y104.279 E.01651
G1 X109.435 Y108.408 E.18014
G1 X109.435 Y108.944 E.01651
G1 X113.565 Y104.814 E.18014
G1 X113.565 Y105.35 E.01651
G1 X109.435 Y109.479 E.18014
G1 X109.435 Y110.014 E.01651
G1 X113.565 Y105.885 E.18014
G1 X113.565 Y106.42 E.01651
G1 X109.435 Y110.55 E.18014
G1 X109.435 Y111.085 E.01651
G1 X113.565 Y106.956 E.18014
G1 X113.565 Y107.491 E.01651
G1 X109.435 Y111.62 E.18014
G1 X109.435 Y112.156 E.01651
G1 X113.565 Y108.026 E.18014
G1 X113.565 Y108.562 E.01651
G1 X109.435 Y112.691 E.18014
G1 X109.435 Y113.226 E.01651
G1 X113.565 Y109.097 E.18014
G1 X113.565 Y109.632 E.01651
G1 X109.435 Y113.762 E.18014
G1 X109.435 Y114.297 E.01651
G1 X113.565 Y110.168 E.18014
G1 X113.565 Y110.703 E.01651
G1 X109.435 Y114.833 E.18014
G1 X109.435 Y115.368 E.01651
G1 X113.565 Y111.239 E.18014
G1 X113.565 Y111.774 E.01651
G1 X109.435 Y115.903 E.18014
G1 X109.435 Y116.439 E.01651
G1 X113.565 Y112.309 E.18014
G1 X113.565 Y112.845 E.01651
G1 X109.435 Y116.974 E.18014
G1 X109.435 Y117.509 E.01651
G1 X113.565 Y113.38 E.18014
G1 X113.565 Y113.915 E.01651
G1 X109.435 Y118.045 E.18014
G1 X109.435 Y118.58 E.01651
G1 X113.565 Y114.451 E.18014
G1 X113.565 Y114.986 E.01651
G1 X109.435 Y119.115 E.18014
G1 X109.435 Y119.651 E.01651
G1 X113.565 Y115.522 E.18014
G1 X113.565 Y116.057 E.01651
G1 X109.435 Y120.186 E.18014
G1 X109.435 Y120.722 E.01651
G1 X113.565 Y116.592 E.18014
G1 X113.565 Y117.128 E.01651
G1 X109.435 Y121.257 E.18014
G1 X109.435 Y121.792 E.01651
G1 X113.565 Y117.663 E.18014
G1 X113.565 Y118.198 E.01651
G1 X109.435 Y122.328 E.18014
G1 X109.435 Y122.863 E.01651
G1 X113.565 Y118.734 E.18014
G1 X113.565 Y119.269 E.01651
G1 X109.435 Y123.398 E.18014
G1 X109.435 Y123.934 E.01651
G1 X113.565 Y119.804 E.18014
G1 X113.565 Y120.34 E.01651
G1 X109.435 Y124.469 E.18014
G1 X109.435 Y125.004 E.01651
G1 X113.565 Y120.875 E.18014
G1 X113.565 Y121.411 E.01651
G1 X109.435 Y125.54 E.18014
G1 X109.435 Y126.075 E.01651
G1 X113.565 Y121.946 E.18014
G1 X113.565 Y122.481 E.01651
G1 X109.435 Y126.611 E.18014
G1 X109.435 Y127.146 E.01651
G1 X113.565 Y123.017 E.18014
G1 X113.565 Y123.552 E.01651
G1 X109.435 Y127.681 E.18014
G1 X109.435 Y128.217 E.01651
G1 X113.565 Y124.087 E.18014
G1 X113.565 Y124.623 E.01651
G1 X109.435 Y128.752 E.18014
G1 X109.435 Y129.287 E.01651
G1 X113.565 Y125.158 E.18014
G1 X113.565 Y125.693 E.01651
G1 X109.435 Y129.823 E.18014
G1 X109.435 Y130.358 E.01651
G1 X113.565 Y126.229 E.18014
G1 X113.565 Y126.764 E.01651
G1 X109.435 Y130.893 E.18014
G1 X109.435 Y131.429 E.01651
G1 X113.565 Y127.3 E.18014
G1 X113.565 Y127.835 E.01651
G1 X109.266 Y132.134 E.18755
G1 X105.809 Y132.378 F30000
G1 F15000
G1 X104.775 Y133.413 E.04515
G2 X104.489 Y134.233 I1.609 J1.019 E.02703
G1 X106.282 Y132.441 E.07821
G3 X106.842 Y132.416 I.363 J1.866 E.01736
G1 X104.498 Y134.761 E.10229
G2 X104.604 Y135.189 I2.439 J-.378 E.01365
G1 X107.378 Y132.415 E.12103
G1 X107.914 Y132.415 E.01653
G1 X104.761 Y135.568 E.13758
G1 X104.917 Y135.947 E.01265
G1 X108.45 Y132.414 E.15414
G1 X108.986 Y132.413 E.01653
G1 X105.074 Y136.326 E.17069
G2 X105.24 Y136.695 I3.517 J-1.367 E.01249
G1 X113.565 Y128.37 E.36316
G1 X113.565 Y128.906 E.01651
G1 X105.413 Y137.057 E.35562
G1 X105.586 Y137.42 E.01239
G1 X113.565 Y129.441 E.34807
G1 X113.565 Y129.976 E.01651
G1 X105.763 Y137.778 E.34037
G1 X105.95 Y138.127 E.01219
G1 X113.565 Y130.512 E.33221
G1 X113.565 Y131.047 E.01651
G1 X106.137 Y138.475 E.32404
G2 X106.325 Y138.822 I3.669 J-1.759 E.01219
G1 X113.565 Y131.582 E.31584
G1 X113.565 Y131.668 E.00264
G1 X113.699 Y131.984 E.01059
G1 X106.526 Y139.157 E.31291
G1 X106.727 Y139.491 E.01203
G1 X113.858 Y132.36 E.31109
G2 X114.022 Y132.731 I3.729 J-1.423 E.01253
G1 X106.928 Y139.825 E.30947
G2 X107.136 Y140.153 I3.412 J-1.935 E.01197
G1 X114.197 Y133.092 E.30803
G2 X114.372 Y133.452 I3.776 J-1.62 E.01235
G1 X107.351 Y140.473 E.30631
G1 X107.566 Y140.793 E.0119
G1 X114.562 Y133.798 E.30519
G1 X114.751 Y134.144 E.01217
G1 X107.783 Y141.112 E.30399
M73 P39 R11
G1 X108.011 Y141.419 E.0118
G1 X114.953 Y134.477 E.30284
G1 X115.156 Y134.809 E.01201
G1 X108.239 Y141.726 E.30175
G1 X108.468 Y142.033 E.0118
G1 X115.369 Y135.132 E.30106
G1 X115.586 Y135.45 E.01188
G1 X108.705 Y142.331 E.30021
G1 X108.946 Y142.625 E.01173
G1 X115.809 Y135.763 E.29937
G1 X116.04 Y136.067 E.01179
G1 X109.188 Y142.919 E.29891
G2 X109.431 Y143.211 I3.097 J-2.334 E.01173
G1 X116.272 Y136.37 E.29843
G1 X116.516 Y136.661 E.01172
G1 X109.686 Y143.491 E.29797
G1 X109.941 Y143.772 E.01169
G1 X116.761 Y136.952 E.29752
G2 X117.016 Y137.232 I2.935 J-2.413 E.0117
G1 X110.196 Y144.052 E.29753
G2 X110.459 Y144.325 I2.909 J-2.542 E.01168
G1 X117.274 Y137.51 E.29731
G2 X117.538 Y137.781 I2.786 J-2.452 E.01168
G1 X110.727 Y144.592 E.29715
G1 X110.995 Y144.86 E.01168
G1 X117.81 Y138.045 E.2973
G2 X118.082 Y138.308 I2.752 J-2.58 E.01168
G1 X111.264 Y145.126 E.29745
G1 X111.545 Y145.38 E.01169
G1 X118.367 Y138.558 E.29762
G1 X118.652 Y138.808 E.0117
G1 X111.826 Y145.634 E.29779
G1 X112.107 Y145.889 E.01169
G1 X118.947 Y139.048 E.29841
G1 X119.246 Y139.285 E.01175
G1 X112.396 Y146.135 E.29884
G1 X112.69 Y146.377 E.01174
G1 X119.551 Y139.516 E.2993
G1 X119.862 Y139.739 E.01183
G1 X112.984 Y146.618 E.30006
G2 X113.279 Y146.858 I2.598 J-2.887 E.01174
G1 X120.178 Y139.959 E.30098
G1 X120.504 Y140.169 E.01194
G1 X113.587 Y147.086 E.30174
G1 X113.895 Y147.313 E.01181
G1 X120.829 Y140.379 E.30251
G2 X121.168 Y140.575 I2.084 J-3.213 E.01209
G1 X114.202 Y147.541 E.30388
G2 X114.518 Y147.761 I2.401 J-3.103 E.01187
G1 X121.508 Y140.771 E.30495
G2 X121.858 Y140.956 I2.048 J-3.458 E.01223
G1 X114.839 Y147.975 E.30622
G1 X115.16 Y148.19 E.01191
G1 X122.212 Y141.137 E.30766
G2 X122.575 Y141.31 I1.909 J-3.545 E.0124
G1 X115.483 Y148.402 E.30941
G1 X115.817 Y148.603 E.01204
G1 X122.944 Y141.476 E.31089
G2 X123.319 Y141.637 I1.725 J-3.508 E.01258
G1 X116.152 Y148.803 E.31263
G1 X116.487 Y149.004 E.01204
G1 X123.704 Y141.787 E.31483
G2 X124.092 Y141.935 I1.701 J-3.886 E.0128
G1 X116.832 Y149.194 E.31671
G1 X117.181 Y149.381 E.01221
G1 X124.493 Y142.069 E.31899
G2 X124.897 Y142.2 I1.451 J-3.773 E.01311
G1 X117.53 Y149.567 E.32138
G2 X117.884 Y149.749 I2.029 J-3.513 E.01227
G1 X125.316 Y142.316 E.32424
G1 X125.736 Y142.432 E.01342
G1 X118.247 Y149.92 E.32667
G1 X118.611 Y150.092 E.01241
G1 X126.172 Y142.531 E.32983
G2 X126.612 Y142.626 I1.194 J-4.479 E.01391
G1 X118.975 Y150.264 E.33319
G1 X119.353 Y150.42 E.01264
G1 X127.067 Y142.707 E.33651
G2 X127.529 Y142.78 I.97 J-4.63 E.01444
G1 X119.732 Y150.577 E.34015
G1 X120.111 Y150.734 E.01264
G1 X128.004 Y142.84 E.34436
G2 X128.492 Y142.888 I.7 J-4.659 E.01513
G1 X120.501 Y150.879 E.34861
G1 X120.896 Y151.02 E.01292
G1 X128.991 Y142.925 E.35315
G2 X129.505 Y142.945 I.46 J-5 E.01589
G1 X121.29 Y151.161 E.35839
G2 X121.694 Y151.292 I1.546 J-4.046 E.0131
G1 X130.029 Y142.957 E.36363
G2 X130.578 Y142.943 I.131 J-5.551 E.01697
G1 X122.104 Y151.417 E.36968
G1 X122.515 Y151.541 E.01324
G1 X131.14 Y142.917 E.37625
G2 X131.72 Y142.873 I-.168 J-6.007 E.01794
G1 X122.934 Y151.658 E.38328
G1 X123.362 Y151.765 E.01362
G1 X132.331 Y142.797 E.39125
G2 X132.961 Y142.702 I-.593 J-6.07 E.01968
G1 X123.79 Y151.872 E.40007
G2 X124.226 Y151.972 I1.232 J-4.393 E.0138
G1 X133.619 Y142.579 E.40977
G1 X134.313 Y142.42 E.02197
G1 X124.673 Y152.061 E.42056
G1 X125.12 Y152.149 E.01405
G1 X135.057 Y142.212 E.43353
G2 X135.851 Y141.953 I-2.248 J-8.247 E.02577
G1 X125.577 Y152.228 E.44823
G1 X126.045 Y152.295 E.01459
G1 X136.716 Y141.624 E.46554
G2 X137.688 Y141.187 I-10.765 J-25.255 E.03288
G1 X126.513 Y152.362 E.48754
G2 X126.988 Y152.422 I.9 J-5.253 E.0148
G1 X138.84 Y140.57 E.51704
G2 X140.383 Y139.563 I-8.829 J-15.206 E.05686
G1 X127.476 Y152.47 E.56307
G1 X127.963 Y152.518 E.01511
G1 X150.565 Y129.917 E.98599
G1 X150.565 Y130.452 E.01651
G1 X128.472 Y152.545 E.9638
G1 X128.982 Y152.57 E.01576
G1 X150.565 Y130.987 E.94154
G1 X150.565 Y131.523 E.01651
G1 X129.5 Y152.587 E.91894
G1 X130.036 Y152.587 E.01651
G1 X150.565 Y132.058 E.89558
G1 X150.565 Y132.412 E.01091
G1 X150.745 Y132.413 E.00558
G1 X130.571 Y152.587 E.88011
G2 X131.129 Y152.564 I.048 J-5.699 E.01723
G1 X151.279 Y132.415 E.87902
G1 X151.812 Y132.417 E.01644
G1 X131.692 Y152.537 E.87772
G2 X132.269 Y152.495 I-.135 J-5.902 E.01785
G1 X152.345 Y132.419 E.87581
G1 X152.878 Y132.422 E.01644
G1 X132.863 Y152.437 E.87316
G2 X133.464 Y152.371 I-.37 J-6.16 E.01866
G1 X153.411 Y132.424 E.87019
G3 X153.899 Y132.471 I.123 J1.292 E.01523
G1 X134.092 Y152.278 E.86409
G2 X134.725 Y152.18 I-.678 J-6.501 E.01976
G1 X154.308 Y132.597 E.85432
G3 X154.648 Y132.793 I-.615 J1.453 E.01212
G1 X135.393 Y152.047 E.83997
G2 X136.069 Y151.908 I-1.086 J-6.95 E.02127
G1 X154.939 Y133.037 E.82325
G3 X155.178 Y133.334 I-1.061 J1.095 E.01178
G1 X136.782 Y151.729 E.8025
G2 X137.515 Y151.532 I-1.641 J-7.562 E.0234
G1 X155.364 Y133.683 E.77868
G3 X155.486 Y134.096 I-2.402 J.933 E.01331
G1 X138.283 Y151.3 E.7505
G2 X139.095 Y151.023 I-2.413 J-8.414 E.02647
G1 X155.521 Y134.597 E.7166
G3 X155.358 Y135.296 I-1.965 J-.091 E.02225
G1 X139.941 Y150.712 E.67256
G1 X140.854 Y150.335 E.03047
G1 X154.974 Y136.215 E.61599
G3 X154.516 Y137.208 I-10.444 J-4.21 E.03373
G1 X141.849 Y149.875 E.5526
G2 X142.947 Y149.312 I-5.183 J-11.47 E.03806
G1 X153.949 Y138.31 E.47997
G3 X153.231 Y139.564 I-13.261 J-6.765 E.04458
G1 X144.206 Y148.589 E.39373
G1 X144.553 Y148.381 E.01248
G1 X145.763 Y147.566 E.04502
G1 X152.214 Y141.116 E.2814
G3 X149.715 Y144.15 I-24.441 J-17.583 E.12133
G1 X147.086 Y146.779 E.11471
M106 S244.8
; CHANGE_LAYER
; Z_HEIGHT: 0.46
; LAYER_HEIGHT: 0.06
; WIPE_START
G1 F24000
G1 X148.5 Y145.365 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 3/58
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
G3 Z.8 I1.183 J-.286 P1  F30000
G1 X144.902 Y130.5 Z.8
G1 Z.46
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.26
G1 F9000
G1 X142.424 Y130.5 E.09562
G1 X142.445 Y130.497 F30000
G1 F9000
G1 X142.462 Y130.283 E.00827
G3 X143.143 Y129.31 I1.28 J.171 E.04761
G3 X143.787 Y129.199 I.562 J1.329 E.02541
G3 X144.918 Y129.961 I-.093 J1.359 E.05512
G1 X144.915 Y130.993 E.03981
G3 X142.525 Y130.885 I-1.173 J-.539 E.1181
G1 X142.457 Y130.556 E.01295
; WIPE_START
G1 F24000
G1 X142.462 Y130.283 E-.10354
G1 X142.646 Y129.703 E-.23123
G1 X143.143 Y129.31 E-.24088
G1 X143.621 Y129.227 E-.18435
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.86 I-.176 J1.204 P1  F30000
G1 X152.321 Y130.5 Z.86
G1 Z.46
G1 E.8 F1800
G1 F9000
G1 X154.208 Y130.5 E.07279
G1 X154.216 Y130.511 F30000
G1 F9000
G1 X153.922 Y130.788 E.01561
G3 X152.186 Y129.071 I-.598 J-1.131 E.12507
G3 X153.425 Y128.381 I1.201 J.7 E.05737
G3 X154.269 Y130.519 I-.101 J1.276 E.11014
; WIPE_START
G1 F24000
G1 X153.922 Y130.788 E-.16707
G1 X153.516 Y130.897 E-.15959
G1 X153.106 Y130.918 E-.15618
G1 X152.724 Y130.816 E-.15007
G1 X152.445 Y130.632 E-.1271
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.86 I1.217 J.012 P1  F30000
G1 X152.542 Y120.5 Z.86
G1 Z.46
G1 E.8 F1800
G1 F9000
G1 X154.331 Y120.5 E.06901
G1 X154.338 Y120.495 F30000
G1 F9000
G1 X154.594 Y120.838 E.01652
G3 X153.597 Y122.609 I-1.129 J.531 E.0917
G3 X153.517 Y120.122 I-.184 J-1.239 E.16301
G3 X154.305 Y120.446 I-.052 J1.247 E.03354
; WIPE_START
G1 F24000
G1 X154.594 Y120.838 E-.18519
G1 X154.711 Y121.291 E-.17797
G1 X154.651 Y121.755 E-.17761
G1 X154.422 Y122.165 E-.17867
G1 X154.339 Y122.232 E-.04056
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.86 I.601 J-1.058 P1  F30000
G1 X142.485 Y115.5 Z.86
G1 Z.46
G1 E.8 F1800
G1 F9000
G1 X144.642 Y115.5 E.08319
G1 X144.638 Y115.498 F30000
G1 F9000
G1 X144.551 Y115.658 E.00702
G3 X143.724 Y116.101 I-.959 J-.798 E.03711
G3 X143.644 Y113.613 I-.184 J-1.239 E.16301
G3 X144.779 Y115.246 I-.052 J1.247 E.08878
G1 X144.667 Y115.445 E.00883
; WIPE_START
G1 F24000
G1 X144.551 Y115.658 E-.09198
G1 X144.18 Y115.955 E-.18067
G1 X143.724 Y116.101 E-.18191
G1 X143.245 Y116.071 E-.18234
G1 X142.955 Y115.926 E-.12309
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.86 I1.215 J-.071 P1  F30000
G1 X142.342 Y105.5 Z.86
G1 Z.46
G1 E.8 F1800
G1 F9000
G1 X144.776 Y105.5 E.0939
G1 X144.788 Y105.509 F30000
G1 F9000
G1 X144.422 Y106.038 E.02483
G3 X142.779 Y106.083 I-.848 J-.956 E.06887
G3 X143.672 Y103.809 I.753 J-1.017 E.12765
G3 X144.796 Y105.454 I-.099 J1.274 E.08814
; WIPE_START
G1 F24000
G1 X144.422 Y106.038 E-.26389
G1 X143.883 Y106.272 E-.22325
G1 X143.304 Y106.296 E-.21997
G1 X143.175 Y106.243 E-.0529
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.86 I.101 J1.213 P1  F30000
G1 X152.129 Y105.5 Z.86
G1 Z.46
G1 E.8 F1800
G1 F9000
G1 X154.677 Y105.5 E.09832
G1 X154.714 Y105.5 F30000
G1 F9000
G1 X154.714 Y105.658 E.0061
G3 X152.114 Y105.374 I-1.316 J.001 E.17068
G3 X153.473 Y103.907 I1.223 J-.229 E.08955
G3 X154.708 Y105.021 I-.185 J1.447 E.06827
G1 X154.714 Y105.44 E.01615
; WIPE_START
G1 F24000
G1 X154.714 Y105.658 E-.0829
G1 X154.629 Y106.193 E-.20599
G1 X154.312 Y106.642 E-.20878
G1 X153.82 Y106.919 E-.21423
G1 X153.694 Y106.93 E-.0481
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.86 I.028 J-1.217 P1  F30000
G1 X117.682 Y106.109 Z.86
G1 Z.46
G1 E.8 F1800
G1 F9000
G3 X115.143 Y105.685 I-1.297 J-.044 E.17051
G3 X115.082 Y105.566 I.908 J-.542 E.00517
G1 X115.087 Y104.541 E.03954
G3 X116.347 Y103.838 I1.15 J.58 E.05911
G3 X117.56 Y105.514 I-.076 J1.332 E.09133
G3 X117.683 Y106.05 I-1.175 J.551 E.02139
G1 X117.542 Y105.5 F30000
G1 F9000
G1 X115.098 Y105.5 E.09429
; WIPE_START
G1 F24000
G1 X117.098 Y105.5 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.86 I0 J-1.217 P1  F30000
G1 X107.918 Y105.5 Z.86
G1 Z.46
G1 E.8 F1800
G1 F9000
G1 X107.918 Y105.538 E.00147
G3 X106.818 Y103.809 I-1.192 J-.457 E.21757
G3 X107.918 Y104.525 I-.054 J1.284 E.05313
G1 X107.918 Y105.44 E.0353
G1 X107.902 Y105.5 F30000
G1 F9000
G1 X105.493 Y105.5 E.09293
; WIPE_START
G1 F24000
G1 X107.493 Y105.5 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.86 I-1.211 J-.124 P1  F30000
M73 P40 R11
G1 X106.581 Y114.417 Z.86
G1 Z.46
G1 E.8 F1800
G1 F9000
G1 X106.643 Y114.409 E.00241
G3 X106.724 Y116.897 I-.028 J1.246 E.14575
G3 X106.153 Y114.457 I-.209 J-1.238 E.14609
G1 X106.521 Y114.423 E.01425
G1 X107.835 Y115.5 F30000
G1 F9000
G1 X105.286 Y115.5 E.09836
; WIPE_START
G1 F24000
G1 X107.286 Y115.5 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.86 I-1.208 J-.15 P1  F30000
G1 X106.276 Y123.634 Z.86
G1 Z.46
G1 E.8 F1800
G1 F9000
G3 X106.688 Y123.594 I.342 J1.385 E.01602
G3 X107.688 Y125.549 I-.02 J1.243 E.10382
G3 X107.665 Y127.091 I-1.498 J.749 E.06182
G3 X105.508 Y125.641 I-1.05 J-.768 E.15363
G3 X105.897 Y123.789 I1.241 J-.707 E.07982
G3 X106.219 Y123.65 I.722 J1.23 E.01358
G1 X107.703 Y125.5 F30000
G1 F9000
G1 X105.503 Y125.5 E.08488
; WIPE_START
G1 F24000
G1 X107.503 Y125.5 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.86 I-1.137 J-.433 P1  F30000
G1 X106.385 Y128.438 Z.86
G1 Z.46
G1 E.8 F1800
G1 F9000
G1 X106.585 Y128.377 E.00806
G3 X106.748 Y128.381 I.053 J1.319 E.00629
G3 X107.918 Y129.27 I-.12 J1.372 E.05979
G1 X107.917 Y130.148 E.03387
G3 X106 Y128.591 I-1.195 J-.487 E.18583
G1 X106.329 Y128.46 E.01367
G1 X107.684 Y130.5 F30000
G1 F9000
G1 X105.806 Y130.5 E.07248
; WIPE_START
G1 F24000
G1 X107.684 Y130.5 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.86 I0 J1.217 P1  F30000
G1 X115.098 Y130.5 Z.86
G1 Z.46
G1 E.8 F1800
G1 F9000
G1 X117.579 Y130.5 E.09572
G1 X117.574 Y130.499 F30000
G1 F9000
G1 X117.491 Y130.918 E.01646
G3 X115.432 Y131.449 I-1.206 J-.419 E.09692
G3 X115.082 Y131.008 I.829 J-1.017 E.02189
G1 X115.082 Y129.997 E.039
G3 X116.382 Y129.225 I1.23 J.591 E.06183
G3 X117.557 Y130.386 I-.098 J1.273 E.06926
G1 X117.565 Y130.44 E.00212
; WIPE_START
G1 F24000
G1 X117.491 Y130.918 E-.18372
G1 X117.112 Y131.431 E-.24246
G1 X116.596 Y131.687 E-.21875
G1 X116.294 Y131.699 E-.11507
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.86 I1.212 J-.11 P1  F30000
G1 X115.507 Y123 Z.86
G1 Z.46
G1 E.8 F1800
G1 F9000
G1 X117.366 Y123 E.0717
G1 X117.369 Y123.004 F30000
G1 F9000
G1 X117.055 Y123.265 E.01574
G3 X116.597 Y123.406 I-.59 J-1.1 E.01862
G3 X116.517 Y120.918 I-.184 J-1.239 E.16301
G3 X117.424 Y122.964 I-.052 J1.247 E.10705
G1 X117.417 Y122.969 E.00033
; WIPE_START
G1 F24000
G1 X117.055 Y123.265 E-.17775
G1 X116.597 Y123.406 E-.18224
G1 X116.118 Y123.376 E-.18234
G1 X115.621 Y123.128 E-.21116
G1 X115.61 Y123.115 E-.00651
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.86 I1.214 J-.081 P1  F30000
G1 X115.271 Y118 Z.86
G1 Z.46
G1 E.8 F1800
G1 F9000
G1 X117.602 Y118 E.08996
G1 X117.604 Y118.001 F30000
G1 F9000
G1 X117.424 Y118.328 E.01438
G3 X116.597 Y118.77 I-.959 J-.798 E.03711
G3 X116.517 Y116.282 I-.184 J-1.239 E.16301
G3 X117.652 Y117.915 I-.052 J1.247 E.08878
G1 X117.633 Y117.949 E.00147
; CHANGE_LAYER
; Z_HEIGHT: 0.6
; LAYER_HEIGHT: 0.14
; WIPE_START
G1 F24000
G1 X117.424 Y118.328 E-.16448
G1 X117.053 Y118.625 E-.18067
G1 X116.597 Y118.77 E-.18191
G1 X116.118 Y118.741 E-.18234
G1 X115.999 Y118.681 E-.0506
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 4/58
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
G3 Z.86 I-.436 J1.136 P1  F30000
G1 X150.898 Y132.08 Z.86
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X153.455 Y132.08 E.08483
G3 X155.697 Y135.346 I.006 J2.399 E.15464
G3 X104.228 Y135.123 I-25.692 J-9.993 E2.20232
G3 X106.545 Y132.08 I2.311 J-.644 E.14681
G1 X109.102 Y132.08 E.08483
G1 X109.102 Y103.214 E.95753
G1 X113.898 Y103.214 E.15909
G1 X113.898 Y131.6 E.94161
G2 X146.102 Y131.601 I16.102 J-6.254 E1.37558
G1 X146.102 Y103.214 E.94164
G1 X150.898 Y103.214 E.15909
G1 X150.898 Y132.02 E.95554
G1 X151.29 Y131.688 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X153.46 Y131.688 E.06668
G3 X156.063 Y135.489 I.001 J2.791 E.16649
G3 X103.891 Y135.361 I-26.061 J-10.137 E2.06611
G3 X106.54 Y131.688 I2.653 J-.878 E.16221
G1 X108.71 Y131.688 E.06668
G1 X108.71 Y102.933 E.88356
G1 X108.71 Y102.851 E.00252
G1 F3000
G1 X108.71 Y102.822 E.00089
G1 X114.29 Y102.822 E.17146
G1 X114.29 Y102.851 E.00089
G1 F12000
G1 X114.29 Y102.933 E.00252
G1 X114.29 Y131.521 E.87842
G2 X145.71 Y131.521 I15.71 J-6.171 E1.24108
G1 X145.71 Y102.933 E.87842
G1 X145.71 Y102.851 E.00252
G1 F3000
G1 X145.71 Y102.822 E.00089
G1 X151.29 Y102.822 E.17146
G1 X151.29 Y102.851 E.00089
G1 F12000
G1 X151.29 Y102.933 E.00252
G1 X151.29 Y131.628 E.88171
M204 S10000
; WIPE_START
G1 F24000
G1 X153.289 Y131.683 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I-.898 J.821 P1  F30000
G1 X155.69 Y134.309 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.422184
G1 F15000
G1 X153.83 Y132.449 E.08128
G2 X153.265 Y132.421 I-.388 J2.078 E.01753
G1 X155.514 Y134.67 E.09831
G3 X155.42 Y135.112 I-1.523 J-.091 E.01403
G1 X152.727 Y132.419 E.11773
G1 X152.189 Y132.417 E.01663
G1 X155.272 Y135.5 E.13475
G1 X155.114 Y135.879 E.01267
G1 X151.651 Y132.416 E.15136
G1 X151.113 Y132.414 E.01663
G1 X155.085 Y136.387 E.17363
G1 X132.215 Y152.671 F30000
G1 F15000
G1 X109.435 Y129.891 E.99564
G1 X109.435 Y130.427 E.01658
G1 X131.552 Y152.543 E.96663
G1 X131.04 Y152.569 E.01582
G1 X109.435 Y130.963 E.94428
G1 X109.435 Y131.5 E.01658
G1 X130.522 Y152.587 E.92164
G1 X129.986 Y152.587 E.01658
G1 X109.435 Y132.036 E.8982
G1 X109.435 Y132.413 E.01164
G1 X109.276 Y132.413 E.00493
G1 X129.45 Y152.587 E.88173
G3 X128.892 Y152.565 I-.059 J-5.696 E.01726
G1 X108.74 Y132.414 E.88076
G1 X108.204 Y132.414 E.01656
G1 X128.328 Y152.537 E.87952
G3 X127.751 Y152.497 I.125 J-5.911 E.01788
G1 X107.669 Y132.415 E.87772
G1 X107.133 Y132.415 E.01656
G1 X127.156 Y152.439 E.87514
G3 X126.545 Y152.364 I.573 J-7.231 E.01903
G1 X106.597 Y132.416 E.87185
G2 X106.111 Y132.466 I-.075 J1.657 E.01516
G1 X125.92 Y152.276 E.8658
G3 X125.292 Y152.184 I.51 J-5.676 E.01964
G1 X105.705 Y132.596 E.85609
G2 X105.361 Y132.789 I.535 J1.356 E.01221
G1 X124.623 Y152.051 E.84185
G3 X123.947 Y151.912 I1.077 J-6.949 E.02131
G1 X105.07 Y133.035 E.82505
G2 X104.827 Y133.328 I.855 J.959 E.01181
G1 X123.232 Y151.733 E.80443
G3 X122.499 Y151.537 I1.632 J-7.56 E.02344
G1 X104.64 Y133.677 E.7806
G2 X104.517 Y134.09 I1.299 J.611 E.01338
G1 X121.73 Y151.303 E.75233
G3 X120.918 Y151.028 I2.404 J-8.413 E.02652
G1 X104.481 Y134.591 E.71838
G2 X104.647 Y135.293 I2.14 J-.134 E.0224
G1 X120.071 Y150.717 E.67414
G1 X119.156 Y150.339 E.0306
G1 X105.025 Y136.208 E.61763
G2 X105.482 Y137.201 I9.41 J-3.729 E.03382
G1 X118.16 Y149.879 E.5541
G3 X117.061 Y149.317 I5.179 J-11.474 E.03816
G1 X106.04 Y138.295 E.4817
G2 X106.771 Y139.562 I13.423 J-6.896 E.04521
G1 X115.801 Y148.593 E.39471
G1 X115.441 Y148.378 E.01297
G1 X114.245 Y147.573 E.04458
G1 X107.781 Y141.109 E.2825
G2 X110.273 Y144.137 I24.614 J-17.715 E.12128
G1 X112.92 Y146.784 E.11569
G1 X113.734 Y104.154 F30000
G1 F15000
G1 X113.128 Y103.547 E.02649
G1 X112.592 Y103.547 E.01658
G1 X113.565 Y104.52 E.04252
G1 X113.565 Y105.057 E.01658
G1 X112.056 Y103.547 E.06596
G1 X111.519 Y103.547 E.01658
G1 X113.565 Y105.593 E.0894
G1 X113.565 Y106.129 E.01658
G1 X110.983 Y103.547 E.11284
G1 X110.446 Y103.547 E.01658
G1 X113.565 Y106.666 E.13629
G1 X113.565 Y107.202 E.01658
G1 X109.91 Y103.547 E.15973
G1 X109.435 Y103.547 E.01467
G1 X109.435 Y103.609 E.0019
G1 X113.565 Y107.738 E.18048
G1 X113.565 Y108.275 E.01658
G1 X109.435 Y104.145 E.18048
G1 X109.435 Y104.682 E.01658
G1 X113.565 Y108.811 E.18048
G1 X113.565 Y109.347 E.01658
G1 X109.435 Y105.218 E.18048
G1 X109.435 Y105.755 E.01658
G1 X113.565 Y109.884 E.18048
G1 X113.565 Y110.42 E.01658
G1 X109.435 Y106.291 E.18048
G1 X109.435 Y106.827 E.01658
G1 X113.565 Y110.957 E.18048
G1 X113.565 Y111.493 E.01658
G1 X109.435 Y107.364 E.18048
G1 X109.435 Y107.9 E.01658
G1 X113.565 Y112.029 E.18048
G1 X113.565 Y112.566 E.01658
G1 X109.435 Y108.436 E.18048
G1 X109.435 Y108.973 E.01658
G1 X113.565 Y113.102 E.18048
G1 X113.565 Y113.638 E.01658
G1 X109.435 Y109.509 E.18048
G1 X109.435 Y110.045 E.01658
G1 X113.565 Y114.175 E.18048
G1 X113.565 Y114.711 E.01658
G1 X109.435 Y110.582 E.18048
G1 X109.435 Y111.118 E.01658
G1 X113.565 Y115.247 E.18048
G1 X113.565 Y115.784 E.01658
G1 X109.435 Y111.654 E.18048
G1 X109.435 Y112.191 E.01658
G1 X113.565 Y116.32 E.18048
G1 X113.565 Y116.857 E.01658
G1 X109.435 Y112.727 E.18048
G1 X109.435 Y113.264 E.01658
G1 X113.565 Y117.393 E.18048
G1 X113.565 Y117.929 E.01658
G1 X109.435 Y113.8 E.18048
G1 X109.435 Y114.336 E.01658
G1 X113.565 Y118.466 E.18048
G1 X113.565 Y119.002 E.01658
G1 X109.435 Y114.873 E.18048
G1 X109.435 Y115.409 E.01658
G1 X113.565 Y119.538 E.18048
G1 X113.565 Y120.075 E.01658
G1 X109.435 Y115.945 E.18048
G1 X109.435 Y116.482 E.01658
G1 X113.565 Y120.611 E.18048
G1 X113.565 Y121.147 E.01658
G1 X109.435 Y117.018 E.18048
G1 X109.435 Y117.554 E.01658
G1 X113.565 Y121.684 E.18048
G1 X113.565 Y122.22 E.01658
G1 X109.435 Y118.091 E.18048
G1 X109.435 Y118.627 E.01658
G1 X113.565 Y122.756 E.18048
G1 X113.565 Y123.293 E.01658
G1 X109.435 Y119.164 E.18048
G1 X109.435 Y119.7 E.01658
G1 X113.565 Y123.829 E.18048
G1 X113.565 Y124.366 E.01658
G1 X109.435 Y120.236 E.18048
G1 X109.435 Y120.773 E.01658
G1 X113.565 Y124.902 E.18048
G1 X113.565 Y125.438 E.01658
G1 X109.435 Y121.309 E.18048
G1 X109.435 Y121.845 E.01658
G1 X113.565 Y125.975 E.18048
G1 X113.565 Y126.511 E.01658
G1 X109.435 Y122.382 E.18048
G1 X109.435 Y122.918 E.01658
G1 X113.565 Y127.047 E.18048
G1 X113.565 Y127.584 E.01658
M73 P41 R11
G1 X109.435 Y123.454 E.18048
G1 X109.435 Y123.991 E.01658
G1 X113.565 Y128.12 E.18048
G1 X113.565 Y128.656 E.01658
G1 X109.435 Y124.527 E.18048
G1 X109.435 Y125.063 E.01658
G1 X113.565 Y129.193 E.18048
G1 X113.565 Y129.729 E.01658
G1 X109.435 Y125.6 E.18048
G1 X109.435 Y126.136 E.01658
G1 X113.565 Y130.266 E.18048
G1 X113.565 Y130.802 E.01658
G1 X109.435 Y126.673 E.18048
G1 X109.435 Y127.209 E.01658
G1 X113.565 Y131.338 E.18048
G1 X113.565 Y131.668 E.01019
G1 X113.717 Y132.027 E.01204
G1 X109.435 Y127.745 E.18712
G1 X109.435 Y128.282 E.01658
G1 X114.151 Y132.998 E.20612
G2 X114.738 Y134.121 I11.971 J-5.54 E.03918
G1 X109.435 Y128.818 E.23177
G1 X109.435 Y129.354 E.01658
G1 X115.705 Y135.624 E.27403
G2 X119.715 Y139.634 I14.174 J-10.164 E.17602
G1 X132.549 Y152.468 E.56093
G1 X133.037 Y152.419 E.01516
G1 X121.226 Y140.609 E.51619
G2 X122.372 Y141.218 I11.859 J-20.924 E.04009
G1 X133.517 Y152.363 E.48711
G1 X133.984 Y152.294 E.01459
G1 X123.333 Y141.643 E.46551
G2 X124.194 Y141.968 I3.68 J-8.458 E.02845
G1 X134.451 Y152.225 E.4483
G2 X134.907 Y152.144 I-.592 J-4.685 E.01431
G1 X124.988 Y142.225 E.43352
G1 X125.727 Y142.428 E.02369
G1 X135.354 Y152.055 E.42077
G1 X135.802 Y151.966 E.0141
G1 X126.425 Y142.589 E.40983
G2 X127.081 Y142.709 I1.581 J-6.792 E.02063
G1 X136.237 Y151.866 E.40018
G1 X136.666 Y151.758 E.01367
G1 X127.711 Y142.803 E.3914
G2 X128.319 Y142.875 I1.031 J-6.129 E.01893
G1 X137.095 Y151.651 E.38358
G2 X137.514 Y151.533 I-.995 J-4.319 E.01344
G1 X128.901 Y142.92 E.37644
G2 X129.461 Y142.944 I.523 J-5.701 E.01734
G1 X137.925 Y151.408 E.36994
G1 X138.337 Y151.283 E.01329
G1 X130.009 Y142.955 E.36399
G1 X130.532 Y142.942 E.01619
G1 X138.74 Y151.15 E.35872
G1 X139.135 Y151.009 E.01297
G1 X131.05 Y142.924 E.35337
G1 X131.548 Y142.885 E.01542
G1 X139.53 Y150.867 E.34889
G2 X139.92 Y150.721 I-1.297 J-4.045 E.01288
G1 X132.034 Y142.835 E.34465
G1 X132.51 Y142.775 E.01482
G1 X140.299 Y150.564 E.34044
G1 X140.679 Y150.407 E.01269
G1 X132.972 Y142.7 E.33685
G1 X133.427 Y142.619 E.01429
G1 X141.057 Y150.249 E.33347
G1 X141.421 Y150.077 E.01245
G1 X133.867 Y142.522 E.33017
G1 X134.303 Y142.422 E.01383
G1 X141.786 Y149.905 E.32702
G1 X142.15 Y149.733 E.01245
G1 X134.723 Y142.306 E.32459
G1 X135.141 Y142.187 E.01342
G1 X142.503 Y149.549 E.32176
G1 X142.853 Y149.363 E.01225
G1 X135.546 Y142.056 E.31935
G1 X135.947 Y141.921 E.01308
G1 X143.202 Y149.176 E.3171
G2 X143.546 Y148.984 I-1.787 J-3.601 E.01219
G1 X136.336 Y141.773 E.31515
G1 X136.721 Y141.622 E.01279
G1 X143.882 Y148.783 E.31297
G1 X144.217 Y148.582 E.01209
G1 X137.095 Y141.459 E.31131
G1 X137.465 Y141.293 E.01254
G1 X144.553 Y148.381 E.30979
G2 X144.875 Y148.167 I-2.025 J-3.39 E.01196
G1 X137.825 Y141.117 E.30813
G1 X138.18 Y140.936 E.01233
G1 X145.196 Y147.952 E.30664
G1 X145.518 Y147.737 E.01195
G1 X138.53 Y140.749 E.30544
G1 X138.87 Y140.553 E.01214
G1 X145.833 Y147.515 E.30431
G1 X146.141 Y147.287 E.01185
G1 X139.209 Y140.355 E.30297
G1 X139.535 Y140.145 E.01199
G1 X146.449 Y147.059 E.30218
G2 X146.756 Y146.83 I-2.178 J-3.248 E.01185
G1 X139.861 Y139.935 E.30136
G2 X140.175 Y139.712 I-2.087 J-3.267 E.01189
G1 X147.051 Y146.589 E.30055
G1 X147.346 Y146.347 E.01178
G1 X140.487 Y139.488 E.29978
G2 X140.791 Y139.256 I-2.1 J-3.068 E.01183
G1 X147.641 Y146.105 E.29936
G2 X147.929 Y145.857 I-2.433 J-3.107 E.01176
G1 X141.09 Y139.018 E.2989
G2 X141.385 Y138.777 I-2.307 J-3.127 E.01179
G1 X148.21 Y145.602 E.29831
G1 X148.492 Y145.348 E.01174
G1 X141.67 Y138.526 E.29817
G1 X141.955 Y138.274 E.01174
G1 X148.767 Y145.086 E.29772
G1 X149.037 Y144.82 E.01172
G1 X142.227 Y138.01 E.29763
G1 X142.499 Y137.746 E.01172
G1 X149.307 Y144.553 E.29755
G1 X149.577 Y144.287 E.01172
G1 X142.761 Y137.471 E.29789
G1 X143.02 Y137.194 E.01173
G1 X149.84 Y144.013 E.29806
G1 X150.095 Y143.732 E.01173
G1 X143.274 Y136.911 E.29814
G1 X143.519 Y136.62 E.01176
G1 X150.35 Y143.451 E.29858
G1 X150.605 Y143.17 E.01173
G1 X143.763 Y136.327 E.29907
G1 X143.994 Y136.023 E.01183
G1 X150.848 Y142.876 E.29954
G1 X151.09 Y142.582 E.01178
G1 X144.226 Y135.718 E.3
G2 X144.446 Y135.402 I-3.092 J-2.384 E.01191
G1 X151.332 Y142.287 E.30095
G1 X151.562 Y141.981 E.01184
G1 X144.664 Y135.083 E.30149
G2 X144.875 Y134.758 I-3.076 J-2.227 E.01199
G1 X151.792 Y141.675 E.30233
G1 X152.023 Y141.369 E.01184
G1 X145.079 Y134.425 E.30349
G2 X145.279 Y134.089 I-3.287 J-2.185 E.0121
G1 X152.253 Y141.063 E.30481
G1 X152.468 Y140.742 E.01195
G1 X145.469 Y133.742 E.30592
G2 X145.657 Y133.395 I-3.425 J-2.087 E.01223
G1 X152.683 Y140.42 E.30706
G1 X152.898 Y140.099 E.01195
G1 X145.832 Y133.033 E.30882
G1 X146.007 Y132.672 E.01241
G1 X153.106 Y139.771 E.31026
G1 X153.307 Y139.435 E.01208
G1 X146.168 Y132.296 E.31203
G1 X146.328 Y131.92 E.01263
G1 X153.508 Y139.1 E.31381
G2 X153.708 Y138.764 I-3.479 J-2.297 E.0121
G1 X146.435 Y131.491 E.31787
G1 X146.435 Y130.955 E.01658
G1 X153.896 Y138.415 E.32607
G1 X154.083 Y138.066 E.01224
G1 X146.435 Y130.418 E.33426
G1 X146.435 Y129.882 E.01658
G1 X154.271 Y137.717 E.34246
G2 X154.445 Y137.355 I-3.747 J-2.019 E.01243
G1 X146.435 Y129.346 E.35005
G1 X146.435 Y128.809 E.01658
G1 X154.618 Y136.992 E.35764
G1 X154.791 Y136.629 E.01243
G1 X146.435 Y128.273 E.36522
G1 X146.435 Y127.736 E.01658
G1 X150.565 Y131.866 E.18048
G1 X150.565 Y131.329 E.01658
G1 X146.435 Y127.2 E.18048
G1 X146.435 Y126.664 E.01658
G1 X150.565 Y130.793 E.18048
G1 X150.565 Y130.257 E.01658
G1 X146.435 Y126.127 E.18048
G1 X146.435 Y125.591 E.01658
G1 X150.565 Y129.72 E.18048
G1 X150.565 Y129.184 E.01658
G1 X146.435 Y125.055 E.18048
G1 X146.435 Y124.518 E.01658
G1 X150.565 Y128.648 E.18048
G1 X150.565 Y128.111 E.01658
G1 X146.435 Y123.982 E.18048
G1 X146.435 Y123.446 E.01658
G1 X150.565 Y127.575 E.18048
G1 X150.565 Y127.038 E.01658
G1 X146.435 Y122.909 E.18048
G1 X146.435 Y122.373 E.01658
G1 X150.565 Y126.502 E.18048
G1 X150.565 Y125.966 E.01658
G1 X146.435 Y121.836 E.18048
G1 X146.435 Y121.3 E.01658
G1 X150.565 Y125.429 E.18048
G1 X150.565 Y124.893 E.01658
G1 X146.435 Y120.764 E.18048
G1 X146.435 Y120.227 E.01658
G1 X150.565 Y124.357 E.18048
G1 X150.565 Y123.82 E.01658
G1 X146.435 Y119.691 E.18048
G1 X146.435 Y119.155 E.01658
G1 X150.565 Y123.284 E.18048
G1 X150.565 Y122.748 E.01658
G1 X146.435 Y118.618 E.18048
G1 X146.435 Y118.082 E.01658
G1 X150.565 Y122.211 E.18048
G1 X150.565 Y121.675 E.01658
G1 X146.435 Y117.546 E.18048
G1 X146.435 Y117.009 E.01658
G1 X150.565 Y121.139 E.18048
G1 X150.565 Y120.602 E.01658
G1 X146.435 Y116.473 E.18048
G1 X146.435 Y115.937 E.01658
G1 X150.565 Y120.066 E.18048
G1 X150.565 Y119.529 E.01658
G1 X146.435 Y115.4 E.18048
G1 X146.435 Y114.864 E.01658
G1 X150.565 Y118.993 E.18048
G1 X150.565 Y118.457 E.01658
G1 X146.435 Y114.327 E.18048
G1 X146.435 Y113.791 E.01658
G1 X150.565 Y117.92 E.18048
G1 X150.565 Y117.384 E.01658
G1 X146.435 Y113.255 E.18048
G1 X146.435 Y112.718 E.01658
G1 X150.565 Y116.848 E.18048
G1 X150.565 Y116.311 E.01658
G1 X146.435 Y112.182 E.18048
G1 X146.435 Y111.646 E.01658
G1 X150.565 Y115.775 E.18048
G1 X150.565 Y115.239 E.01658
G1 X146.435 Y111.109 E.18048
G1 X146.435 Y110.573 E.01658
G1 X150.565 Y114.702 E.18048
G1 X150.565 Y114.166 E.01658
G1 X146.435 Y110.037 E.18048
G1 X146.435 Y109.5 E.01658
G1 X150.565 Y113.629 E.18048
G1 X150.565 Y113.093 E.01658
G1 X146.435 Y108.964 E.18048
G1 X146.435 Y108.427 E.01658
G1 X150.565 Y112.557 E.18048
G1 X150.565 Y112.02 E.01658
G1 X146.435 Y107.891 E.18048
G1 X146.435 Y107.355 E.01658
G1 X150.565 Y111.484 E.18048
G1 X150.565 Y110.948 E.01658
G1 X146.435 Y106.818 E.18048
G1 X146.435 Y106.282 E.01658
G1 X150.565 Y110.411 E.18048
G1 X150.565 Y109.875 E.01658
G1 X146.435 Y105.746 E.18048
G1 X146.435 Y105.209 E.01658
G1 X150.565 Y109.339 E.18048
G1 X150.565 Y108.802 E.01658
G1 X146.435 Y104.673 E.18048
G1 X146.435 Y104.137 E.01658
G1 X150.565 Y108.266 E.18048
G1 X150.565 Y107.73 E.01658
G1 X146.435 Y103.6 E.18048
G1 X146.435 Y103.547 E.00163
G1 X146.919 Y103.547 E.01495
G1 X150.565 Y107.193 E.15934
G1 X150.565 Y106.657 E.01658
G1 X147.455 Y103.547 E.1359
G1 X147.992 Y103.547 E.01658
G1 X150.565 Y106.12 E.11246
G1 X150.565 Y105.584 E.01658
G1 X148.528 Y103.547 E.08901
G1 X149.064 Y103.547 E.01658
G1 X150.565 Y105.048 E.06557
G1 X150.565 Y104.511 E.01658
G1 X149.601 Y103.547 E.04213
G1 X150.137 Y103.547 E.01658
G1 X150.734 Y104.145 E.0261
M106 S252.45
; CHANGE_LAYER
; Z_HEIGHT: 0.72
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F24000
G1 X150.137 Y103.547 E-.32095
G1 X149.601 Y103.547 E-.20382
G1 X150.038 Y103.985 E-.23524
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 5/58
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
G3 Z1 I-.721 J.98 P1  F30000
G1 X152.098 Y105.5 Z1
G1 Z.72
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.26
G1 F9000
G1 X154.541 Y105.5 E.09425
G1 X154.567 Y105.499 F30000
G1 F9000
G1 X154.569 Y105.569 E.0027
G3 X152.082 Y106.08 I-1.276 J.097 E.14258
G1 X152.082 Y104.685 E.05382
G3 X153.356 Y103.903 I1.165 J.469 E.06175
G3 X154.56 Y104.913 I-.112 J1.357 E.06466
G1 X154.566 Y105.439 E.02029
; WIPE_START
G1 F24000
G1 X154.569 Y105.569 E-.04941
G1 X154.541 Y106.026 E-.17387
G1 X154.34 Y106.44 E-.1748
G1 X153.993 Y106.754 E-.17778
G1 X153.548 Y106.923 E-.18115
G1 X153.54 Y106.923 E-.00299
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.12 I.218 J-1.197 P1  F30000
G1 X144.896 Y105.35 Z1.12
G1 Z.72
G1 E.8 F1800
G1 F9000
G3 X142.686 Y105.826 I-1.22 J-.295 E.10856
G3 X143.783 Y103.804 I.98 J-.777 E.11265
G3 X144.909 Y105.292 I-.107 J1.25 E.08113
G1 X144.846 Y105.5 F30000
G1 F9000
G1 X142.505 Y105.5 E.09029
; WIPE_START
G1 F24000
G1 X144.505 Y105.5 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.12 I-1.208 J-.146 P1  F30000
G1 X143.519 Y113.657 Z1.12
G1 Z.72
G1 E.8 F1800
G1 F9000
G1 X143.693 Y113.636 E.00678
G3 X143.772 Y116.078 I-.055 J1.224 E.14129
G3 X143.226 Y113.688 I-.177 J-1.217 E.14144
G1 X143.46 Y113.664 E.00906
G1 X144.663 Y115.5 F30000
G1 F9000
G1 X142.567 Y115.5 E.08086
; WIPE_START
G1 F24000
G1 X144.567 Y115.5 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.12 I-.703 J.993 P1  F30000
G1 X152.222 Y120.918 Z1.12
G1 Z.72
G1 E.8 F1800
G1 F9000
G3 X153.464 Y120.145 I1.144 J.452 E.06047
G3 X153.542 Y122.587 I-.055 J1.224 E.14129
G3 X152.201 Y120.974 I-.177 J-1.217 E.09694
G1 X154.244 Y120.5 F30000
G1 F9000
G1 X152.526 Y120.5 E.06627
; WIPE_START
G1 F24000
G1 X154.244 Y120.5 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.12 I-1.209 J-.139 P1  F30000
G1 X153.325 Y128.472 Z1.12
G1 Z.72
G1 E.8 F1800
G1 F9000
G3 X153.481 Y130.923 I-.082 J1.236 E.13767
G3 X152.082 Y130.315 I-.324 J-1.169 E.06366
G1 X152.082 Y129.212 E.04254
G3 X153.267 Y128.472 I1.195 J.593 E.05675
G1 X154.144 Y130.5 F30000
G1 F9000
G1 X152.22 Y130.5 E.07425
; WIPE_START
G1 F24000
G1 X154.144 Y130.5 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.12 I0 J-1.217 P1  F30000
G1 X144.918 Y130.5 Z1.12
G1 Z.72
G1 E.8 F1800
G1 F9000
G1 X144.918 Y131.139 E.02466
G3 X143.816 Y129.242 I-1.077 J-.643 E.20105
G1 X143.897 Y129.245 E.00312
M73 P42 R11
G3 X144.918 Y129.845 I-.096 J1.333 E.04734
G1 X144.918 Y130.44 E.02295
G1 X144.902 Y130.5 F30000
G1 F9000
G1 X142.565 Y130.5 E.09016
; WIPE_START
G1 F24000
G1 X144.565 Y130.5 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.12 I.514 J-1.103 P1  F30000
G1 X117.575 Y117.908 Z1.12
G1 Z.72
G1 E.8 F1800
G1 F9000
G3 X116.542 Y118.748 I-1.165 J-.379 E.05426
G3 X116.464 Y116.305 I-.177 J-1.217 E.1597
G3 X117.592 Y117.852 I-.055 J1.224 E.08474
G1 X117.522 Y118 F30000
G1 F9000
G1 X115.248 Y118 E.08773
; WIPE_START
G1 F24000
G1 X117.248 Y118 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.12 I-1.123 J-.469 P1  F30000
G1 X115.996 Y120.994 Z1.12
G1 Z.72
G1 E.8 F1800
G1 F9000
G3 X116.464 Y120.941 I.369 J1.173 E.01826
G3 X116.542 Y123.383 I-.055 J1.224 E.14129
G3 X115.941 Y121.013 I-.177 J-1.217 E.13916
G1 X117.28 Y123 F30000
G1 F9000
G1 X115.49 Y123 E.06904
; WIPE_START
G1 F24000
G1 X117.28 Y123 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.12 I-1.201 J-.194 P1  F30000
G1 X116.269 Y129.273 Z1.12
G1 Z.72
G1 E.8 F1800
G1 F9000
G3 X115.082 Y131.162 I-.108 J1.249 E.19796
G1 X115.082 Y129.882 E.04936
G3 X116.211 Y129.271 I1.122 J.725 E.05165
G1 X117.439 Y130.5 F30000
G1 F9000
G1 X115.098 Y130.5 E.09031
; WIPE_START
G1 F24000
G1 X117.098 Y130.5 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.12 I0 J-1.217 P1  F30000
G1 X105.869 Y130.5 Z1.12
G1 Z.72
G1 E.8 F1800
G1 F9000
G1 X107.786 Y130.5 E.07396
G1 X107.781 Y130.496 F30000
G1 F9000
G1 X107.62 Y130.687 E.00964
G3 X107.213 Y130.905 I-.77 J-.946 E.01791
G3 X105.536 Y129.528 I-.367 J-1.263 E.09847
G3 X106.843 Y128.471 I1.195 J.142 E.07181
G3 X107.918 Y129.19 I-.113 J1.331 E.05207
G1 X107.914 Y130.337 E.04424
G1 X107.82 Y130.45 E.00568
; WIPE_START
G1 F24000
G1 X107.62 Y130.687 E-.1177
G1 X107.213 Y130.905 E-.17533
G1 X106.494 Y130.91 E-.27342
G1 X106.042 Y130.674 E-.19355
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.12 I1.213 J-.092 P1  F30000
G1 X105.651 Y125.5 Z1.12
G1 Z.72
G1 E.8 F1800
G1 F9000
G1 X107.777 Y125.5 E.08202
G1 X107.815 Y125.516 F30000
G1 F9000
G1 X107.754 Y125.664 E.0062
G3 X107.918 Y125.984 I-1.419 J.929 E.0139
G1 X107.918 Y126.762 E.02999
G3 X105.655 Y125.652 I-1.195 J-.426 E.16483
G3 X105.676 Y124.123 I1.454 J-.746 E.06141
G3 X106.797 Y123.616 I1.044 J.817 E.04937
G3 X107.918 Y124.414 I-.063 J1.275 E.05606
G1 X107.918 Y125.265 E.03285
G1 X107.838 Y125.46 E.00814
; WIPE_START
G1 F24000
G1 X107.754 Y125.664 E-.0839
G1 X107.918 Y125.984 E-.13662
G1 X107.918 Y126.762 E-.29534
G1 X107.643 Y127.206 E-.19852
G1 X107.542 Y127.271 E-.04561
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.12 I1.197 J-.217 P1  F30000
G1 X105.405 Y115.5 Z1.12
G1 Z.72
G1 E.8 F1800
G1 F9000
G1 X107.892 Y115.5 E.09595
G1 X107.878 Y115.502 F30000
G1 F9000
G1 X107.875 Y115.731 E.00883
G3 X106.648 Y114.43 I-1.224 J-.075 E.21989
G1 X106.729 Y114.432 E.00309
G3 X107.797 Y115.22 I-.077 J1.224 E.05411
G1 X107.862 Y115.445 E.00903
; WIPE_START
G1 F24000
G1 X107.875 Y115.731 E-.10901
G1 X107.763 Y116.246 E-.20031
G1 X107.46 Y116.601 E-.17714
G1 X107.042 Y116.824 E-.17989
G1 X106.798 Y116.854 E-.09364
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.12 I1.211 J-.123 P1  F30000
G1 X105.648 Y105.5 Z1.12
G1 Z.72
G1 E.8 F1800
G1 F9000
G1 X107.902 Y105.5 E.08694
G1 X107.918 Y105.5 F30000
G1 F9000
G1 X107.918 Y105.651 E.00582
G3 X106.922 Y103.804 I-1.105 J-.596 E.2086
G3 X107.918 Y104.368 I-.063 J1.272 E.0458
G1 X107.918 Y105.44 E.04135
; WIPE_START
G1 F24000
G1 X107.918 Y105.651 E-.08008
G1 X107.432 Y106.104 E-.25257
G1 X106.81 Y106.264 E-.24386
G1 X106.341 Y106.152 E-.18349
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.12 I.098 J1.213 P1  F30000
G1 X115.083 Y105.448 Z1.12
G1 Z.72
G1 E.8 F1800
G1 F9000
G1 X115.085 Y104.391 E.0408
G3 X116.239 Y103.833 I1.054 J.707 E.05187
G3 X117.41 Y105.5 I-.081 J1.301 E.09022
G3 X115.082 Y106.499 I-1.127 J.585 E.16106
G1 X115.083 Y105.508 E.03823
G1 X115.098 Y105.5 F30000
G1 F9000
G1 X117.394 Y105.5 E.08858
; CHANGE_LAYER
; Z_HEIGHT: 0.8
; LAYER_HEIGHT: 0.08
; WIPE_START
G1 F24000
G1 X115.394 Y105.5 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 6/58
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
G3 Z1.12 I-.729 J.974 P1  F30000
G1 X150.898 Y132.08 Z1.12
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F10513
G1 X153.455 Y132.08 E.08483
G3 X155.697 Y135.346 I.006 J2.399 E.15464
G3 X104.228 Y135.124 I-25.692 J-9.993 E2.2023
G3 X106.545 Y132.08 I2.311 J-.645 E.14685
G1 X109.102 Y132.08 E.08483
G1 X109.102 Y103.126 E.96045
G1 X113.898 Y103.126 E.15909
G1 X113.898 Y131.6 E.94453
G2 X146.102 Y131.601 I16.102 J-6.257 E1.3755
G1 X146.102 Y103.126 E.94456
G1 X150.898 Y103.126 E.15909
G1 X150.898 Y132.02 E.95846
G1 X151.29 Y131.688 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F10513
G1 X153.46 Y131.688 E.06668
G3 X156.063 Y135.489 I.001 J2.791 E.16649
G3 X103.851 Y135.229 I-26.057 J-10.122 E2.07043
G3 X106.54 Y131.688 I2.689 J-.75 E.15809
G1 X108.71 Y131.688 E.06668
G1 X108.71 Y102.781 E.88822
G1 X108.71 Y102.734 E.00144
G1 X114.29 Y102.734 E.17146
G1 X114.29 Y102.781 E.00144
G1 X114.29 Y131.521 E.88308
G2 X145.71 Y131.521 I15.71 J-6.171 E1.2411
G1 X145.71 Y102.781 E.88309
G1 X145.71 Y102.734 E.00144
G1 X151.29 Y102.734 E.17146
G1 X151.29 Y102.781 E.00144
G1 X151.29 Y131.628 E.88638
M204 S10000
G1 X150.55 Y132.164 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F10513
G1 X150.55 Y103.474 E.95169
G1 X146.45 Y103.474 E.13598
G1 X146.45 Y132.722 E.9702
G1 X150.55 Y132.722 E.13598
G1 X150.55 Y132.224 E.01652
G1 X150.143 Y129.257 F30000
G1 F10513
G1 X150.143 Y130.885 E.05401
G1 X148.713 Y132.315 E.06707
G1 X149.667 Y132.315 E.03165
G1 X146.857 Y129.506 E.1318
G1 X146.857 Y126.494 E.09988
G1 X150.143 Y123.209 E.15411
G1 X150.143 Y125.115 E.0632
G1 X146.857 Y121.83 E.15411
G1 X146.857 Y118.819 E.09988
G1 X150.143 Y115.533 E.15411
G1 X150.143 Y117.439 E.0632
G1 X146.857 Y114.154 E.15411
G1 X146.857 Y111.143 E.09988
G1 X150.143 Y107.857 E.15411
G1 X150.143 Y109.763 E.0632
G1 X146.857 Y106.478 E.15411
G1 X146.857 Y104.849 E.05401
; WIPE_START
G1 F24000
G1 X146.857 Y106.478 E-.61876
G1 X147.12 Y106.74 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I-1.176 J.313 P1  F30000
G1 X153.981 Y132.504 Z1.2
G1 Z.8
G1 E.8 F1800
G1 F10513
G3 X155.238 Y133.466 I-.658 J2.161 E.05364
G1 X137.06 Y151.644 E.85278
G2 X138.014 Y151.365 I-2.362 J-9.853 E.03298
G1 X129.611 Y142.963 E.39417
G2 X130.392 Y142.96 I.36 J-7.197 E.02592
G1 X121.986 Y151.365 E.39433
G2 X122.94 Y151.644 I3.316 J-9.574 E.03298
G1 X104.762 Y133.466 E.85277
G2 X104.52 Y134.831 I1.827 J1.029 E.04688
G2 X105.482 Y137.166 I17.177 J-5.716 E.08383
G1 X109.519 Y133.129 E.18937
G1 X112.101 Y133.129 E.08566
G1 X131.503 Y152.531 E.91017
G3 X128.497 Y152.531 I-1.503 J-27.518 E.09976
G1 X147.899 Y133.129 E.91017
G1 X150.481 Y133.129 E.08566
G1 X154.518 Y137.166 E.18937
G3 X153.772 Y138.613 I-15.932 J-7.289 E.05402
G1 X143.759 Y136.356 F30000
G1 F10513
G2 X144.713 Y135.037 I-19.917 J-15.408 E.05401
G1 X151.591 Y141.915 E.32262
G3 X147.88 Y145.88 I-21.44 J-16.34 E.18045
G1 X141.06 Y139.06 E.31994
G3 X136.176 Y141.852 I-11.133 J-13.812 E.18741
G1 X143.385 Y149.061 E.3382
G3 X141.942 Y149.814 I-8.39 J-14.32 E.05403
G1 X118.058 Y149.814 F30000
G1 F10513
G3 X116.615 Y149.061 I6.947 J-15.073 E.05403
G1 X123.824 Y141.852 E.3382
G3 X118.939 Y139.061 I6.233 J-16.582 E.18742
G1 X112.12 Y145.88 E.31991
G3 X108.403 Y141.921 I18.509 J-21.101 E.18042
G1 X115.286 Y135.038 E.32292
G2 X116.241 Y136.356 I20.113 J-13.561 E.05401
G1 X113.55 Y131.63 F30000
G1 F10513
G1 X113.55 Y132.722 E.03624
G1 X109.45 Y132.722 E.13598
G1 X109.45 Y103.474 E.9702
G1 X113.55 Y103.474 E.13598
G1 X113.55 Y131.57 E.93196
G1 X109.857 Y129.257 F30000
G1 F10513
G1 X109.857 Y130.885 E.05401
G1 X111.287 Y132.315 E.06707
G1 X110.333 Y132.315 E.03165
G1 X113.143 Y129.505 E.1318
G1 X113.143 Y126.495 E.09988
G1 X109.857 Y123.209 E.15411
G1 X109.857 Y125.115 E.0632
G1 X113.143 Y121.83 E.15411
G1 X113.143 Y118.819 E.09988
G1 X109.857 Y115.533 E.15411
G1 X109.857 Y117.439 E.0632
G1 X113.143 Y114.154 E.15411
G1 X113.143 Y111.143 E.09988
G1 X109.857 Y107.857 E.15411
G1 X109.857 Y109.763 E.0632
G1 X113.143 Y106.478 E.15411
G1 X113.143 Y104.849 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 0.98
; LAYER_HEIGHT: 0.18
; WIPE_START
G1 F24000
G1 X113.143 Y106.478 E-.61876
G1 X112.88 Y106.74 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 7/58
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
G3 Z1.2 I.594 J1.062 P1  F30000
G1 X115.098 Y105.5 Z1.2
G1 Z.98
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.26
G1 F9000
G1 X117.235 Y105.5 E.08243
G1 X117.251 Y105.501 F30000
G1 F9000
G3 X115.082 Y106.737 I-1.096 J.599 E.14957
G1 X115.082 Y104.219 E.09718
G3 X116.103 Y103.82 I.923 J.858 E.04375
G3 X117.267 Y105.444 I-.082 J1.288 E.08818
; WIPE_START
G1 F24000
G1 X117.422 Y105.974 E-.20965
G1 X117.392 Y106.422 E-.17067
G1 X117.191 Y106.83 E-.17284
G1 X116.847 Y107.141 E-.17646
G1 X116.771 Y107.167 E-.03038
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.38 I.233 J-1.195 P1  F30000
G1 X107.918 Y105.444 Z1.38
G1 Z.98
G1 E.8 F1800
G1 F9000
G1 X107.918 Y105.761 E.01221
G3 X107.056 Y103.791 I-.983 J-.743 E.19795
G3 X107.918 Y104.192 I-.057 J1.25 E.03764
G1 X107.918 Y105.384 E.04599
M73 P43 R11
G1 X107.902 Y105.5 F30000
G1 F9000
G1 X105.818 Y105.5 E.08039
; WIPE_START
G1 F24000
G1 X107.818 Y105.5 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.38 I-1.21 J-.133 P1  F30000
G1 X106.836 Y114.455 Z1.38
G1 Z.98
G1 E.8 F1800
G1 F9000
G3 X107.918 Y115.21 I-.074 J1.259 E.05357
G1 X107.918 Y116.104 E.03451
G3 X106.777 Y114.453 I-1.154 J-.423 E.20726
G1 X107.902 Y115.5 F30000
G1 F9000
G1 X105.533 Y115.5 E.09139
; WIPE_START
G1 F24000
G1 X107.533 Y115.5 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.38 I-1.214 J-.09 P1  F30000
G1 X106.933 Y123.637 Z1.38
G1 Z.98
G1 E.8 F1800
G1 F9000
G3 X107.918 Y124.191 I-.069 J1.277 E.04517
G1 X107.918 Y125.485 E.04994
G2 X107.899 Y125.738 I.133 J.137 E.01073
G1 X107.918 Y127.002 E.04877
G3 X105.82 Y125.651 I-1.063 J-.653 E.15329
G3 X105.707 Y124.33 I1.692 J-.81 E.05231
G3 X106.874 Y123.634 I1.138 J.583 E.05526
G1 X107.888 Y125.5 F30000
G1 F9000
G1 X105.815 Y125.5 E.07998
; WIPE_START
G1 F24000
G1 X107.815 Y125.5 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.38 I-1.129 J-.454 P1  F30000
G1 X106.566 Y128.604 Z1.38
G1 Z.98
G1 E.8 F1800
G1 F9000
G3 X106.952 Y128.572 I.294 J1.17 E.01501
G3 X107.918 Y129.127 I-.114 J1.316 E.04436
G1 X107.918 Y130.548 E.05484
G3 X107.478 Y130.903 I-.972 J-.754 E.02199
G1 X106.453 Y130.911 E.03957
G3 X106.509 Y128.62 I.407 J-1.136 E.11648
G1 X107.902 Y130.5 F30000
G1 F9000
G1 X105.945 Y130.5 E.07552
; WIPE_START
G1 F24000
G1 X107.902 Y130.5 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.38 I0 J1.217 P1  F30000
G1 X117.287 Y130.5 Z1.38
G1 Z.98
G1 E.8 F1800
G1 F9000
G1 X115.098 Y130.5 E.08444
G1 X115.082 Y130.5 F30000
G1 F9000
G1 X115.082 Y129.768 E.02823
G3 X116.136 Y129.326 I.987 J.874 E.04561
G3 X115.082 Y131.329 I-.099 J1.227 E.1875
G1 X115.082 Y130.56 E.02968
; WIPE_START
G1 F24000
G1 X115.082 Y129.768 E-.30082
G1 X115.589 Y129.414 E-.23485
G1 X116.136 Y129.326 E-.21067
G1 X116.171 Y129.335 E-.01366
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.38 I1.209 J-.136 P1  F30000
G1 X115.457 Y123 Z1.38
G1 Z.98
G1 E.8 F1800
G1 F9000
G1 X117.185 Y123 E.06666
G1 X117.186 Y123.001 F30000
G1 F9000
G1 X116.917 Y123.225 E.0135
G3 X116.476 Y123.361 I-.569 J-1.059 E.01792
G3 X116.399 Y120.964 I-.176 J-1.194 E.15698
G3 X117.272 Y122.934 I-.051 J1.201 E.10311
G1 X117.234 Y122.964 E.00188
; WIPE_START
G1 F24000
G1 X116.917 Y123.225 E-.15573
G1 X116.476 Y123.361 E-.17544
G1 X116.015 Y123.332 E-.17555
G1 X115.536 Y123.093 E-.20333
G1 X115.452 Y122.992 E-.04995
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.38 I1.216 J-.06 P1  F30000
G1 X115.207 Y118 Z1.38
G1 Z.98
G1 E.8 F1800
G1 F9000
G1 X117.436 Y118 E.08598
G1 X117.436 Y118 F30000
G1 F9000
G1 X117.272 Y118.299 E.01313
G3 X116.476 Y118.725 I-.924 J-.769 E.03573
G3 X116.399 Y116.328 I-.176 J-1.194 E.15698
G3 X117.491 Y117.901 I-.051 J1.201 E.08551
G1 X117.465 Y117.948 E.00206
; WIPE_START
G1 F24000
G1 X117.272 Y118.299 E-.1521
G1 X116.915 Y118.585 E-.17398
G1 X116.476 Y118.725 E-.17514
G1 X116.015 Y118.696 E-.17555
G1 X115.819 Y118.598 E-.08322
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.38 I-.492 J1.113 P1  F30000
G1 X142.718 Y130.5 Z1.38
G1 Z.98
G1 E.8 F1800
G1 F9000
G1 X144.902 Y130.5 E.08425
G1 X144.918 Y130.5 F30000
G1 F9000
G1 X144.918 Y131.309 E.03122
G3 X144.029 Y129.297 I-.947 J-.784 E.19299
G3 X144.918 Y129.731 I-.091 J1.313 E.0391
G1 X144.918 Y130.44 E.02736
; WIPE_START
G1 F24000
G1 X144.918 Y131.309 E-.33026
G1 X144.369 Y131.653 E-.24612
G1 X143.886 Y131.678 E-.18361
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.38 I.173 J1.205 P1  F30000
G1 X152.098 Y130.5 Z1.38
G1 Z.98
G1 E.8 F1800
G1 F9000
G1 X154.068 Y130.5 E.07602
G1 X154.072 Y130.503 F30000
G1 F9000
G1 X153.886 Y130.735 E.01147
G3 X153.537 Y130.924 I-.742 J-.955 E.01538
G1 X152.535 Y130.91 E.03867
G3 X152.082 Y130.541 I.53 J-1.113 E.02275
G1 X152.082 Y129.145 E.05388
G3 X153.214 Y128.573 I1.086 J.744 E.05103
G3 X154.159 Y130.438 I-.069 J1.207 E.09747
G1 X154.12 Y130.467 E.00187
; WIPE_START
G1 F24000
G1 X153.886 Y130.735 E-.13513
G1 X153.537 Y130.924 E-.15078
G1 X152.535 Y130.91 E-.38083
G1 X152.345 Y130.755 E-.09326
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.38 I1.217 J.018 P1  F30000
G1 X152.494 Y120.5 Z1.38
G1 Z.98
G1 E.8 F1800
G1 F9000
G1 X154.149 Y120.5 E.06385
G1 X154.157 Y120.488 F30000
G1 F9000
G1 X154.168 Y120.489 E.00043
G3 X153.476 Y122.564 I-.82 J.88 E.10601
G3 X153.399 Y120.167 I-.176 J-1.194 E.15698
G3 X153.777 Y120.245 I-.051 J1.201 E.01496
G1 X154.106 Y120.455 E.01506
; WIPE_START
G1 F24000
G1 X154.168 Y120.489 E-.0267
G1 X154.435 Y120.858 E-.17299
G1 X154.549 Y121.294 E-.17136
G1 X154.491 Y121.741 E-.17115
G1 X154.27 Y122.136 E-.17214
G1 X154.177 Y122.212 E-.04566
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.38 I.613 J-1.052 P1  F30000
G1 X142.656 Y115.5 Z1.38
G1 Z.98
G1 E.8 F1800
G1 F9000
G1 X144.702 Y115.5 E.07893
G1 X144.699 Y115.499 F30000
G1 F9000
G1 X144.629 Y115.629 E.0057
G3 X143.833 Y116.055 I-.924 J-.769 E.03573
G3 X143.756 Y113.658 I-.176 J-1.194 E.15698
G3 X144.849 Y115.232 I-.051 J1.201 E.08551
G1 X144.728 Y115.446 E.00949
; WIPE_START
G1 F24000
G1 X144.629 Y115.629 E-.07894
G1 X144.272 Y115.915 E-.17398
G1 X143.833 Y116.055 E-.17514
G1 X143.372 Y116.027 E-.17555
G1 X143.004 Y115.843 E-.15639
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.38 I1.216 J-.038 P1  F30000
G1 X142.684 Y105.5 Z1.38
G1 Z.98
G1 E.8 F1800
G1 F9000
M73 P43 R10
G1 X144.902 Y105.5 E.08556
G1 X144.918 Y105.5 F30000
G1 F9000
G1 X144.918 Y105.588 E.00339
G3 X143.926 Y103.791 I-1.093 J-.569 E.20509
G3 X144.918 Y104.358 I-.058 J1.253 E.04575
G1 X144.918 Y105.44 E.04175
; WIPE_START
G1 F24000
G1 X144.918 Y105.588 E-.05619
G1 X144.428 Y106.049 E-.25559
G1 X143.813 Y106.206 E-.24126
G1 X143.283 Y106.081 E-.20696
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.38 I.088 J1.214 P1  F30000
G1 X152.082 Y105.44 Z1.38
G1 Z.98
G1 E.8 F1800
G1 F9000
G1 X152.082 Y104.416 E.03952
G3 X153.208 Y103.891 I1.024 J.727 E.05014
G3 X154.408 Y105.483 I-.095 J1.32 E.08708
G3 X152.082 Y106.296 I-1.243 J.177 E.13327
G1 X152.082 Y105.5 E.03071
G1 X152.098 Y105.5 F30000
G1 F9000
G1 X154.394 Y105.5 E.08859
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.02
; WIPE_START
G1 F24000
G1 X152.394 Y105.5 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 8/58
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
G3 Z1.38 I-1.215 J-.068 P1  F30000
G1 X150.898 Y132.08 Z1.38
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F10399
G1 X153.451 Y132.08 E.08469
G3 X155.698 Y135.346 I.01 J2.399 E.15478
G3 X104.229 Y135.125 I-25.692 J-9.986 E2.2025
G3 X106.545 Y132.08 I2.311 J-.646 E.14688
G1 X109.102 Y132.08 E.08483
G1 X109.102 Y103.085 E.96182
G1 X113.898 Y103.085 E.15909
G1 X113.898 Y131.6 E.9459
G2 X146.102 Y131.6 I16.102 J-6.249 E1.37575
G1 X146.102 Y103.085 E.9459
G1 X150.898 Y103.085 E.15909
G1 X150.898 Y132.02 E.95983
G1 X151.29 Y131.688 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F10399
G1 X153.458 Y131.688 E.06663
G3 X156.063 Y135.489 I.003 J2.791 E.16654
G3 X103.851 Y135.231 I-26.057 J-10.127 E2.07025
G3 X106.54 Y131.688 I2.688 J-.751 E.15812
G1 X108.71 Y131.688 E.06668
G1 X108.71 Y102.693 E.89093
G1 X114.29 Y102.693 E.17146
G1 X114.29 Y131.52 E.88579
G2 X145.71 Y131.52 I15.71 J-6.173 E1.24101
G1 X145.71 Y102.693 E.88579
G1 X151.29 Y102.693 E.17146
G1 X151.29 Y131.628 E.88908
M204 S10000
G1 X150.55 Y132.164 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F10399
G1 X150.55 Y103.433 E.95305
G1 X146.45 Y103.433 E.13598
G1 X146.45 Y132.722 E.97156
G1 X150.55 Y132.722 E.13598
G1 X150.55 Y132.224 E.01652
G1 X150.143 Y129.257 F30000
G1 F10399
G1 X150.143 Y130.885 E.05401
G1 X148.713 Y132.315 E.06707
G1 X149.667 Y132.315 E.03165
G1 X146.857 Y129.506 E.1318
G1 X146.857 Y126.494 E.09988
G1 X150.143 Y123.209 E.15411
G1 X150.143 Y125.115 E.0632
G1 X146.857 Y121.83 E.15411
G1 X146.857 Y118.819 E.09988
G1 X150.143 Y115.533 E.15411
G1 X150.143 Y117.439 E.0632
G1 X146.857 Y114.154 E.15411
G1 X146.857 Y111.143 E.09988
G1 X150.143 Y107.857 E.15411
G1 X150.143 Y109.763 E.0632
G1 X146.857 Y106.478 E.15411
G1 X146.857 Y104.849 E.05401
; WIPE_START
G1 F24000
G1 X146.857 Y106.478 E-.61876
G1 X147.12 Y106.74 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I-1.176 J.313 P1  F30000
G1 X153.98 Y132.504 Z1.4
G1 Z1
G1 E.8 F1800
G1 F10399
G3 X155.241 Y133.463 I-.524 J1.996 E.05393
G1 X137.06 Y151.644 E.85292
G2 X138.014 Y151.365 I-2.36 J-9.848 E.03298
G1 X129.611 Y142.963 E.39417
G2 X130.393 Y142.959 I.352 J-7.044 E.02595
G1 X121.986 Y151.365 E.39437
G2 X122.94 Y151.644 I3.314 J-9.569 E.03298
G1 X104.762 Y133.466 E.85276
G2 X104.52 Y134.832 I1.829 J1.029 E.04691
G2 X105.482 Y137.166 I17.257 J-5.754 E.08379
G1 X109.519 Y133.129 E.18936
G1 X112.101 Y133.129 E.08566
G1 X131.503 Y152.531 E.91017
G3 X128.497 Y152.531 I-1.503 J-27.515 E.09976
G1 X147.899 Y133.129 E.91017
G1 X150.481 Y133.129 E.08566
G1 X154.518 Y137.166 E.18936
G3 X153.773 Y138.613 I-16.191 J-7.415 E.05402
G1 X143.759 Y136.356 F30000
G1 F10399
G2 X144.713 Y135.037 I-19.629 J-15.198 E.05401
G1 X151.597 Y141.921 E.32294
G3 X147.88 Y145.88 I-22.272 J-17.183 E.18042
G1 X141.06 Y139.06 E.31996
G3 X136.176 Y141.852 I-11.139 J-13.82 E.18741
G1 X143.385 Y149.061 E.33819
G3 X141.942 Y149.814 I-8.388 J-14.315 E.05403
G1 X118.058 Y149.814 F30000
G1 F10399
G3 X116.615 Y149.061 I6.944 J-15.067 E.05403
G1 X123.824 Y141.852 E.33819
G3 X118.939 Y139.061 I6.236 J-16.586 E.18742
G1 X112.12 Y145.88 E.31991
G3 X108.403 Y141.921 I18.538 J-21.128 E.18042
G1 X115.287 Y135.037 E.32293
G2 X116.241 Y136.356 I19.7 J-13.264 E.05401
G1 X113.55 Y131.63 F30000
G1 F10399
G1 X113.55 Y132.722 E.03624
G1 X109.45 Y132.722 E.13598
G1 X109.45 Y103.433 E.97156
G1 X113.55 Y103.433 E.13598
G1 X113.55 Y131.57 E.93333
G1 X109.857 Y129.257 F30000
G1 F10399
G1 X109.857 Y130.885 E.05401
G1 X111.287 Y132.315 E.06707
G1 X110.333 Y132.315 E.03165
G1 X113.143 Y129.505 E.1318
G1 X113.143 Y126.495 E.09988
G1 X109.857 Y123.209 E.15411
G1 X109.857 Y125.115 E.0632
G1 X113.143 Y121.83 E.15411
G1 X113.143 Y118.819 E.09988
G1 X109.857 Y115.533 E.15411
G1 X109.857 Y117.439 E.0632
G1 X113.143 Y114.154 E.15411
G1 X113.143 Y111.143 E.09988
G1 X109.857 Y107.857 E.15411
G1 X109.857 Y109.763 E.0632
G1 X113.143 Y106.478 E.15411
G1 X113.143 Y104.849 E.05401
M106 S239.7
; CHANGE_LAYER
; Z_HEIGHT: 1.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X113.143 Y106.478 E-.61876
G1 X112.88 Y106.74 E-.14124
; WIPE_END
M73 P44 R10
G1 E-.04 F1800
; layer num/total_layer_count: 9/58
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
G3 Z1.4 I-.675 J1.013 P1  F30000
G1 X150.898 Y132.08 Z1.4
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X153.452 Y132.08 E.08472
G3 X155.698 Y135.346 I.009 J2.399 E.15474
G3 X104.229 Y135.126 I-25.692 J-9.986 E2.20247
G3 X106.545 Y132.08 I2.31 J-.647 E.14692
G1 X109.102 Y132.08 E.08483
G1 X109.102 Y103.08 E.96198
G1 X113.898 Y103.08 E.15909
G1 X113.898 Y131.6 E.94607
G2 X146.102 Y131.6 I16.102 J-6.25 E1.37574
G1 X146.102 Y103.08 E.94607
G1 X150.898 Y103.08 E.15909
G1 X150.898 Y132.02 E.95999
G1 X151.29 Y131.688 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X153.459 Y131.688 E.06664
G3 X156.063 Y135.489 I.002 J2.791 E.16652
G3 X103.851 Y135.232 I-26.057 J-10.127 E2.07022
G3 X106.54 Y131.688 I2.688 J-.753 E.15816
G1 X108.71 Y131.688 E.06668
G1 X108.71 Y102.688 E.89109
G1 X114.29 Y102.688 E.17146
G1 X114.29 Y131.52 E.88595
G2 X145.71 Y131.52 I15.71 J-6.174 E1.24101
G1 X145.71 Y102.688 E.88595
G1 X151.29 Y102.688 E.17146
G1 X151.29 Y131.628 E.88925
M204 S10000
; WIPE_START
G1 F24000
G1 X153.289 Y131.683 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I-.648 J-1.03 P1  F30000
G1 X151.895 Y132.559 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.579326
G1 F11744.836
G1 X151.992 Y132.556 E.00426
G1 X150.914 Y132.444 F30000
; LINE_WIDTH: 0.363619
G1 F15000
G1 X150.914 Y132.765 E.0084
G1 X151.501 Y132.766 E.01535
; LINE_WIDTH: 0.3627
G1 X151.56 Y132.743 E.00166
; LINE_WIDTH: 0.401683
G1 X151.62 Y132.721 E.00186
; LINE_WIDTH: 0.440666
G1 X151.68 Y132.698 E.00206
; LINE_WIDTH: 0.479649
G1 F14425.447
G1 X151.739 Y132.676 E.00227
; LINE_WIDTH: 0.518631
G1 F13243.336
G1 X151.817 Y132.618 E.00378
; LINE_WIDTH: 0.548979
G1 F12449.153
G1 X151.895 Y132.559 E.00402
; LINE_WIDTH: 0.579326
G1 F11744.836
G1 X151.816 Y132.537 E.00358
; LINE_WIDTH: 0.536001
G1 F12776.81
G1 X151.738 Y132.514 E.00329
; LINE_WIDTH: 0.492676
G1 F14007.608
G1 X151.659 Y132.491 E.003
; LINE_WIDTH: 0.449351
G1 F15000
G1 X151.58 Y132.469 E.00271
; LINE_WIDTH: 0.368518
G1 X151.502 Y132.446 E.00217
G1 X150.974 Y132.444 E.01401
G1 X150.731 Y132.701 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.400014
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X146.472 Y132.701 E.21807
G1 X146.472 Y132.251 E.02304
G1 X150.528 Y132.251 E.2077
G1 X150.528 Y131.801 E.02304
G1 X146.472 Y131.801 E.2077
G1 X146.472 Y131.351 E.02304
G1 X150.528 Y131.351 E.2077
G1 X150.528 Y130.901 E.02304
G1 X146.472 Y130.901 E.2077
G1 X146.472 Y130.451 E.02304
G1 X150.528 Y130.451 E.2077
G1 X150.528 Y130.001 E.02304
G1 X146.472 Y130.001 E.2077
G1 X146.472 Y129.551 E.02304
G1 X150.528 Y129.551 E.2077
G1 X150.528 Y129.1 E.02304
G1 X146.472 Y129.1 E.2077
G1 X146.472 Y128.65 E.02304
G1 X150.528 Y128.65 E.2077
G1 X150.528 Y128.2 E.02304
G1 X146.472 Y128.2 E.2077
G1 X146.472 Y127.75 E.02304
G1 X150.528 Y127.75 E.2077
G1 X150.528 Y127.3 E.02304
G1 X146.472 Y127.3 E.2077
G1 X146.472 Y126.85 E.02304
G1 X150.528 Y126.85 E.2077
G1 X150.528 Y126.4 E.02304
G1 X146.472 Y126.4 E.2077
G1 X146.472 Y125.95 E.02304
G1 X150.528 Y125.95 E.2077
G1 X150.528 Y125.5 E.02304
G1 X146.472 Y125.5 E.2077
G1 X146.472 Y125.05 E.02304
G1 X150.528 Y125.05 E.2077
G1 X150.528 Y124.6 E.02304
G1 X146.472 Y124.6 E.2077
G1 X146.472 Y124.15 E.02304
G1 X150.528 Y124.15 E.2077
G1 X150.528 Y123.7 E.02304
G1 X146.472 Y123.7 E.2077
G1 X146.472 Y123.25 E.02304
G1 X150.528 Y123.25 E.2077
G1 X150.528 Y122.8 E.02304
G1 X146.472 Y122.8 E.2077
G1 X146.472 Y122.35 E.02304
G1 X150.528 Y122.35 E.2077
G1 X150.528 Y121.9 E.02304
G1 X146.472 Y121.9 E.2077
G1 X146.472 Y121.45 E.02304
G1 X150.528 Y121.45 E.2077
G1 X150.528 Y121 E.02304
G1 X146.472 Y121 E.2077
G1 X146.472 Y120.55 E.02304
G1 X150.528 Y120.55 E.2077
G1 X150.528 Y120.1 E.02304
G1 X146.472 Y120.1 E.2077
G1 X146.472 Y119.65 E.02304
G1 X150.528 Y119.65 E.2077
G1 X150.528 Y119.2 E.02304
G1 X146.472 Y119.2 E.2077
G1 X146.472 Y118.75 E.02304
G1 X150.528 Y118.75 E.2077
G1 X150.528 Y118.3 E.02304
G1 X146.472 Y118.3 E.2077
G1 X146.472 Y117.85 E.02304
G1 X150.528 Y117.85 E.2077
G1 X150.528 Y117.4 E.02304
G1 X146.472 Y117.4 E.2077
G1 X146.472 Y116.95 E.02304
G1 X150.528 Y116.95 E.2077
G1 X150.528 Y116.5 E.02304
G1 X146.472 Y116.5 E.2077
G1 X146.472 Y116.05 E.02304
G1 X150.528 Y116.05 E.2077
G1 X150.528 Y115.6 E.02304
G1 X146.472 Y115.6 E.2077
G1 X146.472 Y115.15 E.02304
G1 X150.528 Y115.15 E.2077
G1 X150.528 Y114.7 E.02304
G1 X146.472 Y114.7 E.2077
G1 X146.472 Y114.25 E.02304
G1 X150.528 Y114.25 E.2077
G1 X150.528 Y113.8 E.02304
G1 X146.472 Y113.8 E.2077
G1 X146.472 Y113.35 E.02304
G1 X150.528 Y113.35 E.2077
G1 X150.528 Y112.9 E.02304
G1 X146.472 Y112.9 E.2077
G1 X146.472 Y112.45 E.02304
G1 X150.528 Y112.45 E.2077
G1 X150.528 Y112 E.02304
G1 X146.472 Y112 E.2077
G1 X146.472 Y111.55 E.02304
G1 X150.528 Y111.55 E.2077
G1 X150.528 Y111.1 E.02304
G1 X146.472 Y111.1 E.2077
G1 X146.472 Y110.65 E.02304
G1 X150.528 Y110.65 E.2077
G1 X150.528 Y110.2 E.02304
G1 X146.472 Y110.2 E.2077
G1 X146.472 Y109.75 E.02304
G1 X150.528 Y109.75 E.2077
G1 X150.528 Y109.3 E.02304
G1 X146.472 Y109.3 E.2077
G1 X146.472 Y108.85 E.02304
G1 X150.528 Y108.85 E.2077
G1 X150.528 Y108.4 E.02304
G1 X146.472 Y108.4 E.2077
G1 X146.472 Y107.95 E.02304
G1 X150.528 Y107.95 E.2077
G1 X150.528 Y107.5 E.02304
G1 X146.472 Y107.5 E.2077
G1 X146.472 Y107.05 E.02304
G1 X150.528 Y107.05 E.2077
G1 X150.528 Y106.6 E.02304
G1 X146.472 Y106.6 E.2077
G1 X146.472 Y106.15 E.02304
G1 X150.528 Y106.15 E.2077
G1 X150.528 Y105.7 E.02304
G1 X146.472 Y105.7 E.2077
G1 X146.472 Y105.25 E.02304
G1 X150.528 Y105.25 E.2077
G1 X150.528 Y104.8 E.02304
G1 X146.472 Y104.8 E.2077
G1 X146.472 Y104.35 E.02304
G1 X150.528 Y104.35 E.2077
G1 X150.528 Y103.9 E.02304
G1 X146.472 Y103.9 E.2077
G1 X146.472 Y103.45 E.02304
G1 X150.731 Y103.45 E.21807
M106 S239.7
; WIPE_START
G1 F24000
G1 X148.731 Y103.45 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I-1.205 J.173 P1  F30000
G1 X153.773 Y138.613 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G2 X154.517 Y137.165 I-15.712 J-8.991 E.05402
G1 X150.481 Y133.129 E.18935
G1 X147.899 Y133.129 E.08566
G1 X128.497 Y152.531 E.91017
G2 X131.503 Y152.531 I1.503 J-27.512 E.09975
G1 X112.101 Y133.129 E.91017
G1 X109.519 Y133.129 E.08566
G1 X105.483 Y137.165 E.18935
G3 X104.52 Y134.834 I16.379 J-8.125 E.08375
G3 X104.762 Y133.466 I2.073 J-.338 E.04694
G1 X122.94 Y151.644 E.85276
G3 X121.987 Y151.365 I2.358 J-9.841 E.03297
G1 X130.394 Y142.958 E.39441
G3 X129.611 Y142.963 I-.439 J-6.889 E.02597
G1 X138.013 Y151.365 E.39416
G3 X137.06 Y151.644 I-3.312 J-9.563 E.03297
G1 X155.241 Y133.463 E.8529
G2 X153.981 Y132.504 I-1.864 J1.141 E.05374
G1 X146.073 Y132.685 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.439102
G1 F15000
G1 X145.999 Y132.728 E.00277
G1 X146.064 Y132.765 E.00243
G1 X143.759 Y136.356 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X144.713 Y135.037 I-19.366 J-15.003 E.05401
G1 X151.597 Y141.921 E.32296
G3 X147.881 Y145.881 I-22.304 J-17.213 E.18042
G1 X141.06 Y139.06 E.31998
G3 X136.176 Y141.852 I-11.141 J-13.82 E.1874
G1 X143.385 Y149.061 E.33818
G3 X141.942 Y149.814 I-8.384 J-14.306 E.05403
; WIPE_START
G1 F24000
G1 X143.385 Y149.061 E-.61864
M73 P45 R10
G1 X143.122 Y148.798 E-.14136
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I.51 J-1.105 P1  F30000
G1 X107.949 Y132.552 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.57727
G1 F11790.026
G1 X108.04 Y132.557 E.00398
G1 X109.086 Y132.444 F30000
; LINE_WIDTH: 0.363898
G1 F15000
G1 X108.494 Y132.445 E.01548
; LINE_WIDTH: 0.363649
G1 X108.415 Y132.468 E.00215
; LINE_WIDTH: 0.405816
G1 X108.336 Y132.491 E.00243
; LINE_WIDTH: 0.447982
G1 X108.258 Y132.514 E.00271
; LINE_WIDTH: 0.490148
G1 F14086.788
G1 X108.179 Y132.537 E.003
; LINE_WIDTH: 0.532314
G1 F12873.068
G1 X108.1 Y132.56 E.00328
; LINE_WIDTH: 0.57448
G1 F11851.908
G1 X108.179 Y132.601 E.00385
; LINE_WIDTH: 0.532314
G1 F12873.068
G1 X108.258 Y132.642 E.00355
; LINE_WIDTH: 0.490148
G1 F14086.788
G1 X108.337 Y132.683 E.00324
; LINE_WIDTH: 0.447982
G1 F15000
G1 X108.416 Y132.724 E.00294
; LINE_WIDTH: 0.3677
G1 X108.494 Y132.765 E.00235
G1 X109.086 Y132.765 E.01566
G1 X109.086 Y132.504 E.00691
G1 X118.058 Y149.814 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X116.615 Y149.061 I6.941 J-15.059 E.05403
G1 X123.824 Y141.852 E.33818
G3 X118.941 Y139.059 I6.197 J-16.501 E.18741
G1 X112.12 Y145.88 E.31999
G3 X108.403 Y141.921 I18.568 J-21.156 E.18042
G1 X115.287 Y135.037 E.32294
G2 X116.242 Y136.356 I19.32 J-12.992 E.05401
G1 X113.973 Y132.688 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.433516
G1 F15000
G1 X113.9 Y132.73 E.00269
G1 X113.963 Y132.767 E.00234
G1 X113.731 Y132.701 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.400014
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X109.472 Y132.701 E.21807
G1 X109.472 Y132.251 E.02304
G1 X113.528 Y132.251 E.2077
G1 X113.528 Y131.801 E.02304
G1 X109.472 Y131.801 E.2077
G1 X109.472 Y131.351 E.02304
G1 X113.528 Y131.351 E.2077
G1 X113.528 Y130.901 E.02304
G1 X109.472 Y130.901 E.2077
G1 X109.472 Y130.451 E.02304
G1 X113.528 Y130.451 E.2077
G1 X113.528 Y130.001 E.02304
G1 X109.472 Y130.001 E.2077
G1 X109.472 Y129.551 E.02304
G1 X113.528 Y129.551 E.2077
G1 X113.528 Y129.1 E.02304
G1 X109.472 Y129.1 E.2077
G1 X109.472 Y128.65 E.02304
G1 X113.528 Y128.65 E.2077
G1 X113.528 Y128.2 E.02304
G1 X109.472 Y128.2 E.2077
G1 X109.472 Y127.75 E.02304
G1 X113.528 Y127.75 E.2077
G1 X113.528 Y127.3 E.02304
G1 X109.472 Y127.3 E.2077
G1 X109.472 Y126.85 E.02304
G1 X113.528 Y126.85 E.2077
G1 X113.528 Y126.4 E.02304
G1 X109.472 Y126.4 E.2077
G1 X109.472 Y125.95 E.02304
G1 X113.528 Y125.95 E.2077
G1 X113.528 Y125.5 E.02304
G1 X109.472 Y125.5 E.2077
G1 X109.472 Y125.05 E.02304
G1 X113.528 Y125.05 E.2077
G1 X113.528 Y124.6 E.02304
G1 X109.472 Y124.6 E.2077
G1 X109.472 Y124.15 E.02304
G1 X113.528 Y124.15 E.2077
G1 X113.528 Y123.7 E.02304
G1 X109.472 Y123.7 E.2077
G1 X109.472 Y123.25 E.02304
G1 X113.528 Y123.25 E.2077
G1 X113.528 Y122.8 E.02304
G1 X109.472 Y122.8 E.2077
G1 X109.472 Y122.35 E.02304
G1 X113.528 Y122.35 E.2077
G1 X113.528 Y121.9 E.02304
G1 X109.472 Y121.9 E.2077
G1 X109.472 Y121.45 E.02304
G1 X113.528 Y121.45 E.2077
G1 X113.528 Y121 E.02304
G1 X109.472 Y121 E.2077
G1 X109.472 Y120.55 E.02304
G1 X113.528 Y120.55 E.2077
G1 X113.528 Y120.1 E.02304
G1 X109.472 Y120.1 E.2077
G1 X109.472 Y119.65 E.02304
G1 X113.528 Y119.65 E.2077
G1 X113.528 Y119.2 E.02304
G1 X109.472 Y119.2 E.2077
G1 X109.472 Y118.75 E.02304
G1 X113.528 Y118.75 E.2077
G1 X113.528 Y118.3 E.02304
G1 X109.472 Y118.3 E.2077
G1 X109.472 Y117.85 E.02304
G1 X113.528 Y117.85 E.2077
G1 X113.528 Y117.4 E.02304
G1 X109.472 Y117.4 E.2077
G1 X109.472 Y116.95 E.02304
G1 X113.528 Y116.95 E.2077
G1 X113.528 Y116.5 E.02304
G1 X109.472 Y116.5 E.2077
G1 X109.472 Y116.05 E.02304
G1 X113.528 Y116.05 E.2077
G1 X113.528 Y115.6 E.02304
G1 X109.472 Y115.6 E.2077
G1 X109.472 Y115.15 E.02304
G1 X113.528 Y115.15 E.2077
G1 X113.528 Y114.7 E.02304
G1 X109.472 Y114.7 E.2077
G1 X109.472 Y114.25 E.02304
G1 X113.528 Y114.25 E.2077
G1 X113.528 Y113.8 E.02304
G1 X109.472 Y113.8 E.2077
G1 X109.472 Y113.35 E.02304
G1 X113.528 Y113.35 E.2077
G1 X113.528 Y112.9 E.02304
G1 X109.472 Y112.9 E.2077
G1 X109.472 Y112.45 E.02304
G1 X113.528 Y112.45 E.2077
G1 X113.528 Y112 E.02304
G1 X109.472 Y112 E.2077
G1 X109.472 Y111.55 E.02304
G1 X113.528 Y111.55 E.2077
G1 X113.528 Y111.1 E.02304
G1 X109.472 Y111.1 E.2077
G1 X109.472 Y110.65 E.02304
G1 X113.528 Y110.65 E.2077
G1 X113.528 Y110.2 E.02304
G1 X109.472 Y110.2 E.2077
G1 X109.472 Y109.75 E.02304
G1 X113.528 Y109.75 E.2077
G1 X113.528 Y109.3 E.02304
G1 X109.472 Y109.3 E.2077
G1 X109.472 Y108.85 E.02304
G1 X113.528 Y108.85 E.2077
G1 X113.528 Y108.4 E.02304
G1 X109.472 Y108.4 E.2077
G1 X109.472 Y107.95 E.02304
G1 X113.528 Y107.95 E.2077
G1 X113.528 Y107.5 E.02304
G1 X109.472 Y107.5 E.2077
G1 X109.472 Y107.05 E.02304
G1 X113.528 Y107.05 E.2077
G1 X113.528 Y106.6 E.02304
G1 X109.472 Y106.6 E.2077
G1 X109.472 Y106.15 E.02304
G1 X113.528 Y106.15 E.2077
G1 X113.528 Y105.7 E.02304
G1 X109.472 Y105.7 E.2077
G1 X109.472 Y105.25 E.02304
G1 X113.528 Y105.25 E.2077
G1 X113.528 Y104.8 E.02304
G1 X109.472 Y104.8 E.2077
G1 X109.472 Y104.35 E.02304
G1 X113.528 Y104.35 E.2077
G1 X113.528 Y103.9 E.02304
G1 X109.472 Y103.9 E.2077
G1 X109.472 Y103.45 E.02304
G1 X113.731 Y103.45 E.21807
M106 S239.7
M106 S252.45
; CHANGE_LAYER
; Z_HEIGHT: 1.24
; LAYER_HEIGHT: 0.04
; WIPE_START
G1 F24000
G1 X111.731 Y103.45 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 10/58
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
G3 Z1.6 I-.633 J1.039 P1  F30000
G1 X115.098 Y105.5 Z1.6
G1 Z1.24
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.26
G1 F9000
G1 X117.08 Y105.5 E.07647
G1 X117.094 Y105.494 F30000
G1 F9000
G1 X117.246 Y105.914 E.01722
G3 X115.082 Y106.871 I-1.206 J.197 E.12414
G1 X115.082 Y104.101 E.10687
G3 X115.979 Y103.81 I.804 J.952 E.03731
G3 X117.11 Y105.438 I-.077 J1.26 E.08796
; WIPE_START
G1 F24000
G1 X117.246 Y105.914 E-.18795
G1 X117.266 Y106.351 E-.1662
G1 X117.096 Y106.762 E-.16908
G1 X116.779 Y107.087 E-.17249
G1 X116.625 Y107.157 E-.06427
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.64 I.236 J-1.194 P1  F30000
G1 X107.918 Y105.438 Z1.64
G1 Z1.24
G1 E.8 F1800
G1 F9000
G1 X107.918 Y105.82 E.01471
G3 X107.176 Y103.782 I-.866 J-.839 E.18817
G3 X107.918 Y104.074 I-.059 J1.237 E.03132
G1 X107.918 Y105.378 E.05032
G1 X107.902 Y105.5 F30000
G1 F9000
G1 X105.984 Y105.5 E.07399
; WIPE_START
G1 F24000
G1 X107.902 Y105.5 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.64 I-1.21 J-.13 P1  F30000
G1 X106.935 Y114.478 Z1.64
G1 Z1.24
G1 E.8 F1800
G1 F9000
G3 X107.918 Y115.064 I-.077 J1.246 E.04588
G1 X107.918 Y116.25 E.04574
G3 X106.876 Y114.475 I-1.06 J-.571 E.19669
G1 X107.902 Y115.5 F30000
G1 F9000
G1 X105.658 Y115.5 E.08658
; WIPE_START
G1 F24000
G1 X107.658 Y115.5 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.64 I-1.214 J-.089 P1  F30000
G1 X107.057 Y123.658 Z1.64
G1 Z1.24
G1 E.8 F1800
G1 F9000
G3 X107.918 Y124.067 I-.072 J1.261 E.03769
G1 X107.915 Y127.144 E.11872
G3 X105.978 Y125.653 I-.944 J-.777 E.14517
G3 X105.891 Y124.272 I1.559 J-.792 E.05489
G3 X106.999 Y123.656 I1.088 J.653 E.05121
G1 X107.902 Y125.5 F30000
G1 F9000
G1 X105.971 Y125.5 E.07449
; WIPE_START
G1 F24000
G1 X107.902 Y125.5 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.64 I-1.136 J-.436 P1  F30000
G1 X106.675 Y128.698 Z1.64
G1 Z1.24
G1 E.8 F1800
G1 F9000
G3 X107.054 Y128.667 I.284 J1.145 E.01472
G3 X107.918 Y129.106 I-.112 J1.29 E.03831
G1 X107.916 Y130.706 E.06171
G3 X107.668 Y130.902 I-.847 J-.814 E.01224
G1 X106.445 Y130.904 E.04721
G3 X106.618 Y128.714 I.515 J-1.061 E.10907
G1 X107.902 Y130.5 F30000
G1 F9000
G1 X106.022 Y130.5 E.07253
; WIPE_START
G1 F24000
G1 X107.902 Y130.5 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.64 I0 J1.217 P1  F30000
G1 X117.139 Y130.5 Z1.64
G1 Z1.24
G1 E.8 F1800
G1 F9000
G1 X115.098 Y130.5 E.07874
G1 X115.082 Y130.5 F30000
G1 F9000
G1 X115.082 Y129.705 E.03065
G3 X116.012 Y129.377 I.865 J.968 E.03902
G3 X115.193 Y131.532 I-.081 J1.202 E.17361
G1 X115.082 Y131.329 E.00891
G1 X115.082 Y130.56 E.02968
; WIPE_START
G1 F24000
G1 X115.082 Y129.705 E-.32472
G1 X115.549 Y129.437 E-.20454
G1 X116.012 Y129.377 E-.17738
G1 X116.147 Y129.414 E-.05335
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.64 I1.209 J-.135 P1  F30000
G1 X115.43 Y123 Z1.64
G1 Z1.24
G1 E.8 F1800
G1 F9000
G1 X117.093 Y123 E.06416
G1 X117.092 Y122.999 F30000
G1 F9000
G1 X116.846 Y123.205 E.01237
G3 X116.413 Y123.338 I-.558 J-1.039 E.01759
G3 X116.337 Y120.987 I-.145 J-1.172 E.15145
G3 X117.195 Y122.92 I-.05 J1.179 E.10118
G1 X117.14 Y122.963 E.00268
; WIPE_START
G1 F24000
G1 X116.846 Y123.205 E-.14461
G1 X116.413 Y123.338 E-.1722
G1 X115.96 Y123.31 E-.1723
G1 X115.551 Y123.121 E-.17151
G1 X115.37 Y122.932 E-.09938
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.64 I1.216 J-.049 P1  F30000
G1 X115.172 Y118 Z1.64
G1 Z1.24
G1 E.8 F1800
G1 F9000
G1 X117.351 Y118 E.08405
G1 X117.35 Y118 F30000
G1 F9000
G1 X117.195 Y118.284 E.0125
G3 X116.413 Y118.702 I-.907 J-.755 E.03507
G3 X116.337 Y116.351 I-.145 J-1.172 E.15145
G3 X117.41 Y117.894 I-.05 J1.179 E.08391
G1 X117.38 Y117.948 E.00236
; WIPE_START
G1 F24000
G1 X117.195 Y118.284 E-.14593
G1 X116.844 Y118.565 E-.17074
G1 X116.413 Y118.702 E-.1719
G1 X115.96 Y118.674 E-.1723
G1 X115.724 Y118.565 E-.09914
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.64 I-.49 J1.114 P1  F30000
G1 X142.867 Y130.5 Z1.64
G1 Z1.24
G1 E.8 F1800
M73 P46 R10
G1 F9000
G1 X144.902 Y130.5 E.07852
G1 X144.918 Y130.5 F30000
G1 F9000
G1 X144.918 Y131.328 E.03196
G1 X144.828 Y131.492 E.00721
G3 X144.152 Y129.347 I-.744 J-.944 E.17937
G3 X144.918 Y129.668 I-.091 J1.295 E.0326
G1 X144.918 Y130.44 E.0298
; WIPE_START
G1 F24000
G1 X144.918 Y131.328 E-.33762
G1 X144.828 Y131.492 E-.07103
G1 X144.257 Y131.705 E-.23144
G1 X143.943 Y131.674 E-.11991
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.64 I.173 J1.205 P1  F30000
G1 X152.098 Y130.5 Z1.64
G1 Z1.24
G1 E.8 F1800
G1 F9000
G1 X153.99 Y130.5 E.07301
G1 X153.992 Y130.501 F30000
G1 F9000
G1 X153.883 Y130.681 E.00811
G3 X153.536 Y130.924 I-.84 J-.831 E.01644
G1 X152.341 Y130.907 E.0461
G3 X152.082 Y130.699 I.713 J-1.15 E.01288
G1 X152.082 Y129.121 E.06087
G3 X153.109 Y128.669 I.981 J.837 E.04476
G3 X154.109 Y130.36 I-.066 J1.18 E.08949
G1 X154.03 Y130.455 E.00476
; WIPE_START
G1 F24000
G1 X153.883 Y130.681 E-.10244
G1 X153.536 Y130.924 E-.16102
G1 X152.341 Y130.907 E-.45403
G1 X152.254 Y130.837 E-.04251
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.64 I1.217 J.025 P1  F30000
G1 X152.469 Y120.5 Z1.64
G1 Z1.24
G1 E.8 F1800
G1 F9000
G1 X154.054 Y120.5 E.06116
G1 X154.06 Y120.491 F30000
G1 F9000
G1 X154.092 Y120.506 E.00137
G3 X153.413 Y122.542 I-.804 J.863 E.10402
G3 X153.337 Y120.19 I-.145 J-1.172 E.15145
G3 X153.708 Y120.266 I-.05 J1.179 E.01468
G1 X154.009 Y120.459 E.01377
; WIPE_START
G1 F24000
G1 X154.092 Y120.506 E-.03621
G1 X154.354 Y120.867 E-.16975
G1 X154.466 Y121.295 E-.16812
G1 X154.409 Y121.734 E-.1679
G1 X154.192 Y122.121 E-.16889
G1 X154.092 Y122.203 E-.04913
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.64 I.619 J-1.048 P1  F30000
G1 X142.744 Y115.5 Z1.64
G1 Z1.24
G1 E.8 F1800
G1 F9000
G1 X144.734 Y115.5 E.07679
G1 X144.743 Y115.509 F30000
G1 F9000
G1 X144.444 Y115.808 E.01633
G3 X143.739 Y113.679 I-.704 J-.949 E.1722
G1 X143.815 Y113.681 E.00293
G3 X144.761 Y115.454 I-.074 J1.179 E.09272
; WIPE_START
G1 F24000
G1 X144.444 Y115.808 E-.18086
G1 X144.04 Y116.005 E-.17086
G1 X143.663 Y116.04 E-.14383
G1 X143.224 Y115.929 E-.17205
G1 X143.026 Y115.788 E-.0924
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.64 I1.217 J-.02 P1  F30000
G1 X142.859 Y105.5 Z1.64
G1 Z1.24
G1 E.8 F1800
G1 F9000
G1 X144.902 Y105.5 E.07883
G1 X144.911 Y105.5 F30000
G1 F9000
G1 X144.91 Y105.707 E.00799
G3 X144.055 Y103.782 I-.973 J-.72 E.19499
G3 X144.918 Y104.191 I-.055 J1.231 E.03782
G1 X144.911 Y105.44 E.0482
; WIPE_START
G1 F24000
G1 X144.91 Y105.707 E-.10149
G1 X144.405 Y106.062 E-.23449
G1 X143.788 Y106.143 E-.23632
G1 X143.325 Y105.971 E-.1877
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.64 I.068 J1.215 P1  F30000
G1 X152.088 Y105.482 Z1.64
G1 Z1.24
G1 E.8 F1800
G1 F9000
G1 X152.095 Y104.244 E.04774
G3 X153.074 Y103.882 I.891 J.903 E.04153
G3 X154.264 Y105.473 I-.183 J1.377 E.08544
G3 X152.082 Y106.41 I-1.216 J.178 E.12424
G1 X152.087 Y105.542 E.03351
G1 X152.098 Y105.5 F30000
G1 F9000
G1 X154.253 Y105.5 E.08313
; CHANGE_LAYER
; Z_HEIGHT: 1.4
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F24000
G1 X152.253 Y105.5 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 11/58
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
G3 Z1.64 I-1.215 J-.062 P1  F30000
G1 X150.898 Y132.08 Z1.64
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X153.453 Y132.08 E.08477
G3 X155.698 Y135.346 I.008 J2.399 E.15469
G3 X104.229 Y135.127 I-25.692 J-9.986 E2.20244
G3 X106.545 Y132.08 I2.31 J-.648 E.14695
G1 X109.102 Y132.08 E.08483
G1 X109.102 Y103.08 E.96198
G1 X113.898 Y103.08 E.15909
G1 X113.898 Y131.6 E.94607
G2 X146.102 Y131.6 I16.102 J-6.252 E1.37567
G1 X146.102 Y103.08 E.94607
G1 X150.898 Y103.08 E.15909
G1 X150.898 Y132.02 E.95999
G1 X151.29 Y131.688 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X153.459 Y131.688 E.06666
G3 X156.063 Y135.488 I.001 J2.791 E.1665
G3 X103.852 Y135.233 I-26.057 J-10.128 E2.07017
G3 X106.54 Y131.688 I2.688 J-.754 E.1582
G1 X108.71 Y131.688 E.06668
G1 X108.71 Y102.688 E.89109
G1 X114.29 Y102.688 E.17146
G1 X114.29 Y131.52 E.88595
G2 X145.71 Y131.52 I15.71 J-6.174 E1.241
G1 X145.71 Y102.688 E.88595
G1 X151.29 Y102.688 E.17146
G1 X151.29 Y131.628 E.88925
M204 S10000
; WIPE_START
G1 F24000
G1 X153.289 Y131.683 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-.648 J-1.03 P1  F30000
G1 X151.895 Y132.559 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.579334
G1 F11744.66
G1 X151.992 Y132.556 E.00425
G1 X148.346 Y130.886 F30000
; LINE_WIDTH: 0.351907
G1 F15000
G1 X148.654 Y130.886 E.00778
G1 X148.654 Y105.323 E.64362
G1 X148.346 Y105.323 E.00778
G1 X148.346 Y130.826 E.64211
G1 X148.002 Y131.229 F30000
; LINE_WIDTH: 0.419999
G1 F15000
G1 X148.998 Y131.229 E.03058
G1 X148.998 Y104.98 E.80654
G1 X148.002 Y104.98 E.03058
G1 X148.002 Y131.169 E.8047
G1 X147.625 Y131.606 F30000
G1 F15000
G1 X149.375 Y131.606 E.05375
G1 X149.375 Y104.603 E.82971
G1 X147.625 Y104.603 E.05375
G1 X147.625 Y131.546 E.82787
G1 X147.248 Y131.642 F30000
G1 F15000
G1 X147.178 Y131.983 E.0107
G1 X149.752 Y131.983 E.07908
G1 X149.752 Y104.226 E.85289
G1 X147.248 Y104.226 E.07692
G1 X147.248 Y131.582 E.84057
G1 X146.613 Y132.36 F30000
G1 F15000
G1 X150.206 Y132.36 E.11041
G1 X150.129 Y132.283 E.00336
G1 X150.129 Y103.849 E.87368
G1 X146.871 Y103.849 E.10009
G1 X146.871 Y131.642 E.854
G1 X146.825 Y131.865 E.00701
G1 X146.636 Y132.305 E.0147
G1 X146.04 Y132.737 F30000
G1 F15000
G1 X150.051 Y132.737 E.12325
G1 X150.372 Y132.751 E.00987
; LINE_WIDTH: 0.372344
G2 X151.501 Y132.766 I.739 J-13.363 E.03031
; LINE_WIDTH: 0.362705
G1 X151.561 Y132.743 E.00166
; LINE_WIDTH: 0.401685
G1 X151.62 Y132.721 E.00186
; LINE_WIDTH: 0.440664
G1 X151.68 Y132.698 E.00206
; LINE_WIDTH: 0.479644
G1 F14425.602
G1 X151.739 Y132.676 E.00227
; LINE_WIDTH: 0.518623
G1 F13243.558
G1 X151.817 Y132.618 E.00378
; LINE_WIDTH: 0.548979
G1 F12449.153
G1 X151.895 Y132.559 E.00402
; LINE_WIDTH: 0.579334
G1 F11744.66
G1 X151.817 Y132.537 E.00358
; LINE_WIDTH: 0.536009
G1 F12776.619
G1 X151.738 Y132.514 E.00329
; LINE_WIDTH: 0.492683
G1 F14007.396
G1 X151.659 Y132.491 E.003
; LINE_WIDTH: 0.449357
G1 F15000
G1 X151.58 Y132.469 E.00271
; LINE_WIDTH: 0.366693
G1 X151.502 Y132.446 E.00216
G1 X150.694 Y132.443 E.02132
; LINE_WIDTH: 0.364443
G1 X150.6 Y132.363 E.00324
; LINE_WIDTH: 0.419944
G1 X150.506 Y132.283 E.0038
G1 X150.506 Y103.472 E.88514
G1 X146.494 Y103.472 E.12325
G1 X146.494 Y131.642 E.86546
G1 X146.479 Y131.716 E.00233
G1 X146.064 Y132.682 E.03229
G1 X143.759 Y136.356 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X144.713 Y135.037 I-19.08 J-14.793 E.05401
G1 X151.597 Y141.921 E.32297
G3 X147.881 Y145.881 I-22.338 J-17.244 E.18042
G1 X141.06 Y139.06 E.31999
G3 X136.176 Y141.852 I-11.084 J-13.718 E.18741
G1 X143.385 Y149.061 E.33817
G3 X141.942 Y149.814 I-8.381 J-14.3 E.05403
G1 X153.762 Y138.609 F30000
G1 F15476.087
G2 X154.52 Y137.168 I-13.581 J-8.055 E.05403
G1 X150.481 Y133.129 E.18946
G1 X147.899 Y133.129 E.08566
G1 X128.497 Y152.531 E.91017
G2 X131.503 Y152.531 I1.503 J-27.511 E.09975
G1 X112.101 Y133.129 E.91017
G1 X109.519 Y133.129 E.08566
G1 X105.483 Y137.165 E.18934
G3 X104.52 Y134.835 I16.467 J-8.165 E.08371
G3 X104.762 Y133.466 I2.075 J-.338 E.04698
G1 X122.94 Y151.644 E.85275
G3 X121.987 Y151.365 I2.356 J-9.837 E.03297
G1 X130.395 Y142.957 E.39445
G3 X129.612 Y142.964 I-.448 J-6.742 E.02599
G1 X138.013 Y151.365 E.39414
G3 X137.06 Y151.644 I-3.31 J-9.558 E.03297
G1 X155.241 Y133.463 E.8529
G2 X153.98 Y132.504 I-1.756 J.999 E.05399
; WIPE_START
G1 F24000
G1 X154.701 Y132.846 E-.30324
G1 X155.241 Y133.463 E-.31147
G1 X154.97 Y133.733 E-.14528
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-.082 J-1.214 P1  F30000
G1 X116.242 Y136.355 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F15476.087
G3 X115.287 Y135.037 I18.017 J-14.06 E.05401
G1 X108.403 Y141.921 E.32295
G2 X112.119 Y145.881 I22.316 J-17.226 E.18042
G1 X118.939 Y139.061 E.31992
G2 X123.824 Y141.852 I11.126 J-13.803 E.18742
G1 X116.615 Y149.061 E.33817
G2 X118.058 Y149.814 I8.381 J-14.3 E.05403
G1 X107.949 Y132.552 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.577284
G1 F11789.717
G1 X108.04 Y132.557 E.00398
G1 X111.654 Y130.886 F30000
; LINE_WIDTH: 0.351907
G1 F15000
G1 X111.654 Y105.323 E.64362
G1 X111.346 Y105.323 E.00778
G1 X111.346 Y130.886 E.64362
G1 X111.594 Y130.886 E.00627
G1 X111.998 Y131.229 F30000
; LINE_WIDTH: 0.419999
G1 F15000
G1 X111.998 Y104.98 E.80654
G1 X111.002 Y104.98 E.03058
G1 X111.002 Y131.229 E.80654
G1 X111.938 Y131.229 E.02873
G1 X112.375 Y131.606 F30000
G1 F15000
G1 X112.375 Y104.603 E.82971
G1 X110.625 Y104.603 E.05375
G1 X110.625 Y131.606 E.82971
G1 X112.315 Y131.606 E.0519
G1 X112.752 Y131.641 F30000
G1 F15000
G1 X112.752 Y104.226 E.84239
G1 X110.248 Y104.226 E.07692
G1 X110.248 Y131.983 E.85289
G1 X112.821 Y131.983 E.07905
G1 X112.764 Y131.7 E.00886
G1 X113.385 Y132.36 F30000
G1 F15000
G1 X113.174 Y131.862 E.01662
G1 X113.129 Y131.641 E.00692
G1 X113.129 Y103.849 E.85398
G1 X109.871 Y103.849 E.10009
G1 X109.871 Y132.283 E.8737
G1 X109.807 Y132.36 E.00308
G1 X113.325 Y132.36 E.10809
G1 X113.506 Y130.731 F30000
G1 F15000
G1 X113.506 Y103.472 E.8376
G1 X109.494 Y103.472 E.12327
G1 X109.494 Y132.283 E.88529
G1 X109.4 Y132.364 E.0038
; LINE_WIDTH: 0.367819
G1 X109.306 Y132.444 E.00328
G1 X108.494 Y132.445 E.02149
; LINE_WIDTH: 0.363655
G1 X108.415 Y132.468 E.00215
; LINE_WIDTH: 0.405822
G1 X108.336 Y132.491 E.00243
; LINE_WIDTH: 0.447989
G1 X108.258 Y132.514 E.00271
; LINE_WIDTH: 0.490155
G1 F14086.56
G1 X108.179 Y132.537 E.003
; LINE_WIDTH: 0.532322
G1 F12872.869
G1 X108.1 Y132.56 E.00328
; LINE_WIDTH: 0.574488
G1 F11851.73
G1 X108.179 Y132.601 E.00385
; LINE_WIDTH: 0.532322
G1 F12872.869
G1 X108.258 Y132.642 E.00355
; LINE_WIDTH: 0.490155
G1 F14086.56
G1 X108.337 Y132.683 E.00324
; LINE_WIDTH: 0.447989
G1 F15000
G1 X108.416 Y132.724 E.00294
; LINE_WIDTH: 0.36782
G1 X108.494 Y132.765 E.00235
G1 X109.306 Y132.765 E.02149
; LINE_WIDTH: 0.364122
G1 X109.627 Y132.751 E.00841
; LINE_WIDTH: 0.41859
G1 X109.948 Y132.737 E.00984
G1 X113.959 Y132.737 E.12279
G3 X113.521 Y131.715 I10.606 J-5.156 E.03406
G1 X113.507 Y130.791 E.02828
M106 S249.9
; CHANGE_LAYER
; Z_HEIGHT: 1.5
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F24000
G1 X113.521 Y131.715 E-.35106
G1 X113.945 Y132.704 E-.40894
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 12/58
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
G3 Z1.8 I1.078 J.564 P1  F30000
G1 X115.098 Y130.5 Z1.8
G1 Z1.5
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.26
G1 F9000
G1 X116.99 Y130.5 E.07301
G1 X116.983 Y130.5 F30000
M73 P47 R10
G1 F9000
G1 X116.965 Y130.862 E.014
G3 X115.25 Y131.638 I-1.15 J-.258 E.08413
G1 X115.082 Y131.329 E.01356
G1 X115.09 Y129.658 E.06449
G3 X115.886 Y129.429 I.734 J1.051 E.03255
G3 X116.969 Y130.363 I-.07 J1.176 E.0593
G1 X116.977 Y130.44 E.003
; WIPE_START
G1 F24000
G1 X116.965 Y130.862 E-.16045
G1 X116.724 Y131.317 E-.19573
G1 X116.301 Y131.634 E-.20081
G1 X115.78 Y131.751 E-.20284
G1 X115.78 Y131.751 E-.00017
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.9 I1.216 J-.053 P1  F30000
G1 X115.399 Y123 Z1.9
G1 Z1.5
G1 E.8 F1800
G1 F9000
G1 X116.998 Y123 E.06168
G1 X116.996 Y122.998 F30000
G1 F9000
G1 X116.772 Y123.185 E.01124
G3 X116.347 Y123.316 I-.547 J-1.02 E.01728
G3 X115.082 Y122.554 I-.148 J-1.185 E.06142
G1 X115.082 Y121.778 E.02994
G3 X116.273 Y121.009 I1.111 J.415 E.0586
G3 X117.115 Y122.905 I-.047 J1.156 E.09929
G1 X117.043 Y122.961 E.0035
; WIPE_START
G1 F24000
G1 X116.772 Y123.185 E-.13345
G1 X116.347 Y123.316 E-.16912
G1 X115.975 Y123.304 E-.1413
G1 X115.562 Y123.144 E-.16862
G1 X115.284 Y122.903 E-.1396
G1 X115.274 Y122.885 E-.00791
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.9 I1.216 J-.035 P1  F30000
G1 X115.133 Y118 Z1.9
G1 Z1.5
G1 E.8 F1800
G1 F9000
G1 X117.264 Y118 E.0822
G1 X117.263 Y118 F30000
G1 F9000
G1 X117.115 Y118.27 E.01188
G3 X116.347 Y118.68 I-.889 J-.74 E.03443
G3 X115.082 Y117.918 I-.148 J-1.185 E.06142
G1 X115.082 Y117.142 E.02994
G3 X116.273 Y116.373 I1.111 J.415 E.0586
G3 X117.326 Y117.887 I-.047 J1.156 E.08234
G1 X117.292 Y117.947 E.00266
; WIPE_START
G1 F24000
G1 X117.115 Y118.27 E-.13976
G1 X116.77 Y118.545 E-.1676
G1 X116.347 Y118.68 E-.16881
G1 X115.975 Y118.668 E-.1413
G1 X115.626 Y118.533 E-.14254
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.9 I1.211 J.121 P1  F30000
G1 X116.927 Y105.5 Z1.9
G1 Z1.5
G1 E.8 F1800
G1 F9000
G1 X115.098 Y105.5 E.07057
G1 X115.082 Y105.5 F30000
G1 F9000
G1 X115.082 Y104 E.05785
G3 X115.852 Y103.799 I.68 J1.031 E.03127
G3 X116.935 Y105.482 I-.076 J1.238 E.08978
G3 X115.082 Y106.975 I-1.013 J.639 E.13449
G1 X115.082 Y105.56 E.05459
; WIPE_START
G1 F24000
G1 X115.082 Y104 E-.59262
G1 X115.473 Y103.83 E-.16212
G1 X115.487 Y103.829 E-.00526
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.9 I-.267 J-1.187 P1  F30000
G1 X107.912 Y105.532 Z1.9
G1 Z1.5
G1 E.8 F1800
G1 F9000
G1 X107.911 Y105.863 E.01277
G3 X107.3 Y103.771 I-.739 J-.92 E.1787
G3 X107.918 Y103.974 I-.061 J1.228 E.0254
G1 X107.912 Y105.472 E.0578
G1 X107.902 Y105.5 F30000
G1 F9000
G1 X106.153 Y105.5 E.0675
; WIPE_START
G1 F24000
G1 X107.902 Y105.5 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.9 I-1.211 J-.116 P1  F30000
G1 X107.037 Y114.5 Z1.9
G1 Z1.5
G1 E.8 F1800
G1 F9000
G3 X107.918 Y114.954 I-.08 J1.237 E.03934
G1 X107.918 Y116.36 E.05422
G3 X106.978 Y114.498 I-.963 J-.682 E.18741
G1 X107.902 Y115.5 F30000
G1 F9000
G1 X105.784 Y115.5 E.08172
; WIPE_START
G1 F24000
G1 X107.784 Y115.5 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.9 I-1.208 J-.144 P1  F30000
G1 X106.803 Y123.711 Z1.9
G1 Z1.5
G1 E.8 F1800
G1 F9000
G3 X107.185 Y123.679 I.29 J1.176 E.01485
G3 X107.918 Y123.971 I-.073 J1.249 E.03097
G1 X107.918 Y127.248 E.12643
G3 X106.136 Y125.664 I-.828 J-.863 E.13763
G3 X105.912 Y124.621 I2.785 J-1.143 E.04138
G3 X106.746 Y123.726 I1.181 J.266 E.04946
G1 X107.902 Y125.5 F30000
G1 F9000
G1 X106.129 Y125.5 E.0684
; WIPE_START
G1 F24000
G1 X107.902 Y125.5 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.9 I-1.152 J-.391 P1  F30000
G1 X106.785 Y128.794 Z1.9
G1 Z1.5
G1 E.8 F1800
G1 F9000
G3 X107.156 Y128.764 I.277 J1.12 E.01444
G3 X107.918 Y129.105 I-.124 J1.297 E.03278
G1 X107.918 Y130.843 E.06707
G3 X107.845 Y130.901 I-.476 J-.528 E.00357
G1 X106.481 Y130.911 E.05263
G3 X106.727 Y128.81 I.581 J-.997 E.10327
G1 X107.902 Y130.5 F30000
G1 F9000
G1 X106.105 Y130.5 E.06933
; WIPE_START
G1 F24000
G1 X107.902 Y130.5 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.9 I0 J1.217 P1  F30000
G1 X143.017 Y130.5 Z1.9
G1 Z1.5
G1 E.8 F1800
G1 F9000
G1 X144.902 Y130.5 E.07274
G1 X144.918 Y130.5 F30000
G1 F9000
G1 X144.918 Y131.328 E.03196
G1 X144.768 Y131.601 E.01201
G3 X144.276 Y129.398 I-.579 J-1.027 E.16958
G3 X144.918 Y129.625 I-.093 J1.284 E.02656
G1 X144.918 Y130.44 E.03145
; WIPE_START
G1 F24000
G1 X144.918 Y131.328 E-.33758
G1 X144.768 Y131.601 E-.11829
G1 X144.228 Y131.719 E-.21007
G1 X143.986 Y131.665 E-.09405
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.9 I.173 J1.205 P1  F30000
G1 X152.098 Y130.5 Z1.9
G1 Z1.5
G1 E.8 F1800
G1 F9000
G1 X153.907 Y130.5 E.06979
G1 X153.909 Y130.501 F30000
G1 F9000
G1 X153.813 Y130.681 E.00786
G3 X153.517 Y130.924 I-.87 J-.761 E.01485
G1 X152.162 Y130.905 E.05227
G3 X152.082 Y130.841 I.449 J-.643 E.00394
G1 X152.097 Y129.104 E.06704
G3 X153.003 Y128.766 I.861 J.927 E.03827
G3 X154.015 Y130.354 I-.06 J1.154 E.08491
G1 X153.944 Y130.452 E.00466
; WIPE_START
G1 F24000
G1 X153.813 Y130.681 E-.10004
G1 X153.517 Y130.924 E-.14562
G1 X152.163 Y130.905 E-.51435
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.9 I1.217 J.032 P1  F30000
G1 X152.44 Y120.5 Z1.9
G1 Z1.5
G1 E.8 F1800
G1 F9000
G1 X153.957 Y120.5 E.05853
G1 X153.96 Y120.494 F30000
G1 F9000
G1 X154.014 Y120.522 E.00234
G3 X153.347 Y122.519 I-.788 J.847 E.10207
G3 X152.082 Y121.758 I-.148 J-1.185 E.06142
G1 X152.082 Y120.981 E.02995
G3 X153.273 Y120.213 I1.111 J.415 E.0586
G3 X153.637 Y120.287 I-.047 J1.156 E.01442
G1 X153.91 Y120.462 E.01248
; WIPE_START
G1 F24000
G1 X154.014 Y120.522 E-.04578
G1 X154.271 Y120.877 E-.16657
G1 X154.381 Y121.297 E-.16487
G1 X154.326 Y121.727 E-.16464
G1 X154.112 Y122.107 E-.16567
G1 X154.005 Y122.194 E-.05248
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.9 I.625 J-1.044 P1  F30000
G1 X142.833 Y115.5 Z1.9
G1 Z1.5
G1 E.8 F1800
G1 F9000
G1 X144.77 Y115.5 E.07472
G1 X144.749 Y115.485 F30000
G1 F9000
G1 X144.569 Y115.765 E.01284
G3 X143.876 Y113.704 I-.763 J-.891 E.17688
G3 X144.918 Y114.472 I-.067 J1.181 E.05284
G1 X144.918 Y115.248 E.02994
G1 X144.784 Y115.436 E.00889
; WIPE_START
G1 F24000
G1 X144.569 Y115.765 E-.14921
G1 X143.951 Y116.01 E-.25286
G1 X143.296 Y115.909 E-.25179
G1 X143.085 Y115.726 E-.10613
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.9 I1.217 J-.006 P1  F30000
G1 X143.036 Y105.5 Z1.9
G1 Z1.5
G1 E.8 F1800
G1 F9000
G1 X144.902 Y105.5 E.072
G1 X144.918 Y105.5 F30000
G1 F9000
G1 X144.918 Y105.769 E.01038
G3 X144.188 Y103.771 I-.855 J-.82 E.18526
G3 X144.918 Y104.058 I-.058 J1.22 E.03082
G1 X144.918 Y105.44 E.05332
; WIPE_START
G1 F24000
G1 X144.918 Y105.769 E-.12505
G1 X144.383 Y106.055 E-.23049
G1 X143.849 Y106.077 E-.20315
G1 X143.364 Y105.862 E-.20132
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.9 I.057 J1.216 P1  F30000
G1 X152.084 Y105.451 Z1.9
G1 Z1.5
G1 E.8 F1800
G1 F9000
G1 X152.086 Y104.128 E.05104
G3 X152.937 Y103.871 I.768 J1.006 E.03506
G3 X154.103 Y105.393 I-.095 J1.281 E.08351
G3 X152.082 Y106.495 I-1.174 J.251 E.11879
G1 X152.084 Y105.511 E.03796
G1 X152.098 Y105.5 F30000
G1 F9000
G1 X154.11 Y105.5 E.07763
; CHANGE_LAYER
; Z_HEIGHT: 1.6
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F24000
G1 X152.11 Y105.5 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 13/58
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
G3 Z1.9 I-1.215 J-.076 P1  F30000
G1 X150.422 Y132.556 Z1.9
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X152.818 Y132.556 E.07947
G1 X152.818 Y132.08 E.01578
G3 X154.053 Y132.154 I.319 J5.025 E.04116
G3 X155.698 Y135.346 I-.599 J2.328 E.1345
G3 X104.23 Y135.128 I-25.692 J-9.986 E2.2024
G3 X106.545 Y132.08 I2.31 J-.649 E.14699
G1 X107.182 Y132.08 E.02114
G1 X107.182 Y132.556 E.01578
G1 X114.307 Y132.556 E.23635
G2 X145.694 Y132.556 I15.693 J-7.206 E1.30645
G1 X150.362 Y132.556 E.15487
; WIPE_START
G1 F24000
G1 X152.362 Y132.556 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I.766 J-.946 P1  F30000
G1 X151.29 Y131.688 Z2
G1 Z1.6
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X153.46 Y131.688 E.06668
G3 X156.063 Y135.488 I.001 J2.791 E.16648
G3 X103.852 Y135.234 I-26.057 J-10.128 E2.07012
G3 X106.54 Y131.688 I2.687 J-.755 E.15824
G1 X108.71 Y131.688 E.06668
G1 X108.71 Y102.688 E.89109
G1 X114.29 Y102.688 E.17146
G1 X114.29 Y131.52 E.88595
G2 X145.71 Y131.52 I15.71 J-6.174 E1.241
G1 X145.71 Y102.688 E.88595
G1 X151.29 Y102.688 E.17146
G1 X151.29 Y131.628 E.88925
M204 S10000
G1 X150.997 Y132.333 F30000
M204 S2000
; FEATURE: Top surface
G1 F12000
G1 X151.435 Y131.895 E.01903
G1 X151.083 Y131.714
G1 X150.464 Y132.333 E.02689
G1 X149.931 Y132.333
G1 X151.083 Y131.181 E.05006
G1 X151.083 Y130.648
G1 X149.397 Y132.333 E.07324
G1 X148.864 Y132.333
G1 X151.083 Y130.115 E.09641
G1 X151.083 Y129.581
G1 X148.331 Y132.333 E.11958
G1 X147.797 Y132.333
G1 X151.083 Y129.048 E.14276
G1 X151.083 Y128.515
G1 X147.264 Y132.333 E.16593
G1 X146.731 Y132.333
G1 X151.083 Y127.981 E.1891
G1 X151.083 Y127.448
G1 X146.198 Y132.333 E.21228
G1 X145.664 Y132.333
G1 X151.083 Y126.915 E.23545
G1 X151.083 Y126.382
G1 X145.917 Y131.547 E.22445
G1 X145.917 Y131.014
G1 X151.083 Y125.848 E.22445
G1 X151.083 Y125.315
G1 X145.917 Y130.48 E.22445
G1 X145.917 Y129.947
G1 X151.083 Y124.782 E.22445
G1 X151.083 Y124.249
G1 X145.917 Y129.414 E.22445
G1 X145.917 Y128.881
G1 X151.083 Y123.715 E.22445
G1 X151.083 Y123.182
G1 X145.917 Y128.347 E.22445
G1 X145.917 Y127.814
G1 X151.083 Y122.649 E.22445
G1 X151.083 Y122.116
G1 X145.917 Y127.281 E.22445
G1 X145.917 Y126.747
G1 X151.083 Y121.582 E.22445
G1 X151.083 Y121.049
G1 X145.917 Y126.214 E.22445
G1 X145.917 Y125.681
G1 X151.083 Y120.516 E.22445
G1 X151.083 Y119.982
G1 X145.917 Y125.148 E.22445
G1 X145.917 Y124.614
G1 X151.083 Y119.449 E.22445
G1 X151.083 Y118.916
G1 X145.917 Y124.081 E.22445
G1 X145.917 Y123.548
G1 X151.083 Y118.383 E.22445
G1 X151.083 Y117.849
G1 X145.917 Y123.015 E.22445
G1 X145.917 Y122.481
G1 X151.083 Y117.316 E.22445
G1 X151.083 Y116.783
G1 X145.917 Y121.948 E.22445
G1 X145.917 Y121.415
G1 X151.083 Y116.25 E.22445
G1 X151.083 Y115.716
G1 X145.917 Y120.882 E.22445
G1 X145.917 Y120.348
G1 X151.083 Y115.183 E.22445
G1 X151.083 Y114.65
G1 X145.917 Y119.815 E.22445
G1 X145.917 Y119.282
G1 X151.083 Y114.116 E.22445
G1 X151.083 Y113.583
G1 X145.917 Y118.748 E.22445
G1 X145.917 Y118.215
G1 X151.083 Y113.05 E.22445
G1 X151.083 Y112.517
G1 X145.917 Y117.682 E.22445
G1 X145.917 Y117.149
G1 X151.083 Y111.983 E.22445
G1 X151.083 Y111.45
G1 X145.917 Y116.615 E.22445
G1 X145.917 Y116.082
G1 X151.083 Y110.917 E.22445
G1 X151.083 Y110.384
G1 X145.917 Y115.549 E.22445
G1 X145.917 Y115.016
G1 X151.083 Y109.85 E.22445
G1 X151.083 Y109.317
G1 X145.917 Y114.482 E.22445
G1 X145.917 Y113.949
G1 X151.083 Y108.784 E.22445
G1 X151.083 Y108.251
G1 X145.917 Y113.416 E.22445
G1 X145.917 Y112.882
G1 X151.083 Y107.717 E.22445
G1 X151.083 Y107.184
G1 X145.917 Y112.349 E.22445
G1 X145.917 Y111.816
G1 X151.083 Y106.651 E.22445
G1 X151.083 Y106.117
M73 P48 R10
G1 X145.917 Y111.283 E.22445
G1 X145.917 Y110.749
G1 X151.083 Y105.584 E.22445
G1 X151.083 Y105.051
G1 X145.917 Y110.216 E.22445
G1 X145.917 Y109.683
G1 X151.083 Y104.518 E.22445
G1 X151.083 Y103.984
G1 X145.917 Y109.15 E.22445
G1 X145.917 Y108.616
G1 X151.083 Y103.451 E.22445
G1 X150.878 Y103.122
G1 X145.917 Y108.083 E.21556
G1 X145.917 Y107.55
G1 X150.345 Y103.122 E.19239
G1 X149.811 Y103.122
G1 X145.917 Y107.016 E.16921
G1 X145.917 Y106.483
G1 X149.278 Y103.122 E.14604
G1 X148.745 Y103.122
G1 X145.917 Y105.95 E.12287
G1 X145.917 Y105.417
G1 X148.212 Y103.122 E.09969
G1 X147.678 Y103.122
G1 X145.917 Y104.883 E.07652
G1 X145.917 Y104.35
G1 X147.145 Y103.122 E.05335
G1 X146.612 Y103.122
G1 X145.917 Y103.817 E.03017
M204 S10000
; WIPE_START
G1 F24000
G1 X146.612 Y103.122 E-.37317
G1 X147.145 Y103.122 E-.20264
G1 X146.802 Y103.465 E-.18419
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-1.216 J-.035 P1  F30000
G1 X145.982 Y131.611 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.20579
G1 F15000
G1 X145.905 Y131.726 E.00183
; LINE_WIDTH: 0.166583
G1 X145.828 Y131.84 E.00139
; LINE_WIDTH: 0.127377
G1 X145.751 Y131.954 E.00095
G1 X143.759 Y136.356 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X144.713 Y135.037 I-18.806 J-14.592 E.05401
G1 X151.598 Y141.922 E.32298
G3 X147.881 Y145.881 I-22.351 J-17.258 E.18042
G1 X141.061 Y139.061 E.31991
G3 X136.176 Y141.852 I-11.208 J-13.947 E.18741
G1 X143.385 Y149.061 E.33816
G3 X141.941 Y149.814 I-8.378 J-14.292 E.05403
G1 X152.259 Y132.12 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.506246
G1 F13597.337
G1 X152.321 Y132.119 E.0023
; WIPE_START
G1 F24000
G1 X152.259 Y132.12 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I1.216 J-.049 P1  F30000
G1 X151.094 Y102.99 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.255134
G1 F15000
G1 X145.906 Y102.99 E.08971
; WIPE_START
G1 F24000
G1 X147.906 Y102.99 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I0 J-1.217 P1  F30000
G1 X114.094 Y102.99 Z2
G1 Z1.6
G1 E.8 F1800
G1 F15000
G1 X108.906 Y102.99 E.08971
; WIPE_START
G1 F24000
G1 X110.906 Y102.99 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-1.201 J-.199 P1  F30000
G1 X106.018 Y132.502 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X104.762 Y133.466 I.781 J2.316 E.05349
G1 X122.94 Y151.644 E.85275
G3 X121.987 Y151.365 I2.354 J-9.831 E.03297
G1 X130.392 Y142.96 E.39433
G1 X129.608 Y142.96 E.02602
G1 X138.013 Y151.365 E.39433
G3 X137.06 Y151.644 I-3.308 J-9.552 E.03297
G1 X155.24 Y133.464 E.85287
G3 X155.368 Y135.232 I-1.829 J1.021 E.06071
G3 X154.517 Y137.165 I-18.847 J-7.142 E.0701
G1 X150.256 Y132.904 E.1999
G1 X148.124 Y132.904 E.07072
G1 X128.497 Y152.531 E.92074
G2 X131.503 Y152.531 I1.503 J-27.507 E.09975
G1 X111.876 Y132.904 E.92074
G1 X109.744 Y132.904 E.07072
G1 X105.48 Y137.168 E.20003
G2 X106.228 Y138.614 I17.687 J-8.222 E.05402
G1 X113.668 Y132.333 F30000
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X114.189 Y131.813 E.02262
G1 X114.083 Y131.385
G1 X113.135 Y132.333 E.04118
G1 X112.602 Y132.333
G1 X114.083 Y130.852 E.06436
G1 X114.083 Y130.319
G1 X112.068 Y132.333 E.08753
G1 X111.535 Y132.333
G1 X114.083 Y129.786 E.1107
G1 X114.083 Y129.252
G1 X111.002 Y132.333 E.13388
G1 X110.468 Y132.333
G1 X114.083 Y128.719 E.15705
G1 X114.083 Y128.186
G1 X109.935 Y132.333 E.18022
G1 X109.402 Y132.333
G1 X114.083 Y127.653 E.2034
M73 P48 R9
G1 X114.083 Y127.119
G1 X108.869 Y132.333 E.22657
G1 X108.335 Y132.333
G1 X108.773 Y131.895 E.01903
G1 X108.917 Y131.751
G1 X114.083 Y126.586 E.22445
G1 X114.083 Y126.053
G1 X108.917 Y131.218 E.22445
G1 X108.917 Y130.685
G1 X114.083 Y125.519 E.22445
G1 X114.083 Y124.986
G1 X108.917 Y130.151 E.22445
G1 X108.917 Y129.618
G1 X114.083 Y124.453 E.22445
G1 X114.083 Y123.92
G1 X108.917 Y129.085 E.22445
G1 X108.917 Y128.552
G1 X114.083 Y123.386 E.22445
G1 X114.083 Y122.853
G1 X108.917 Y128.018 E.22445
G1 X108.917 Y127.485
G1 X114.083 Y122.32 E.22445
G1 X114.083 Y121.787
G1 X108.917 Y126.952 E.22445
G1 X108.917 Y126.419
G1 X114.083 Y121.253 E.22445
G1 X114.083 Y120.72
G1 X108.917 Y125.885 E.22445
G1 X108.917 Y125.352
G1 X114.083 Y120.187 E.22445
G1 X114.083 Y119.654
G1 X108.917 Y124.819 E.22445
G1 X108.917 Y124.285
G1 X114.083 Y119.12 E.22445
G1 X114.083 Y118.587
G1 X108.917 Y123.752 E.22445
G1 X108.917 Y123.219
G1 X114.083 Y118.054 E.22445
G1 X114.083 Y117.52
G1 X108.917 Y122.686 E.22445
G1 X108.917 Y122.152
G1 X114.083 Y116.987 E.22445
G1 X114.083 Y116.454
G1 X108.917 Y121.619 E.22445
G1 X108.917 Y121.086
G1 X114.083 Y115.921 E.22445
G1 X114.083 Y115.387
G1 X108.917 Y120.553 E.22445
G1 X108.917 Y120.019
G1 X114.083 Y114.854 E.22445
G1 X114.083 Y114.321
G1 X108.917 Y119.486 E.22445
G1 X108.917 Y118.953
G1 X114.083 Y113.788 E.22445
G1 X114.083 Y113.254
G1 X108.917 Y118.419 E.22445
G1 X108.917 Y117.886
G1 X114.083 Y112.721 E.22445
G1 X114.083 Y112.188
G1 X108.917 Y117.353 E.22445
G1 X108.917 Y116.82
G1 X114.083 Y111.654 E.22445
G1 X114.083 Y111.121
G1 X108.917 Y116.286 E.22445
G1 X108.917 Y115.753
G1 X114.083 Y110.588 E.22445
G1 X114.083 Y110.055
G1 X108.917 Y115.22 E.22445
G1 X108.917 Y114.687
G1 X114.083 Y109.521 E.22445
G1 X114.083 Y108.988
G1 X108.917 Y114.153 E.22445
G1 X108.917 Y113.62
G1 X114.083 Y108.455 E.22445
G1 X114.083 Y107.922
G1 X108.917 Y113.087 E.22445
G1 X108.917 Y112.554
G1 X114.083 Y107.388 E.22445
G1 X114.083 Y106.855
G1 X108.917 Y112.02 E.22445
G1 X108.917 Y111.487
G1 X114.083 Y106.322 E.22445
G1 X114.083 Y105.789
G1 X108.917 Y110.954 E.22445
G1 X108.917 Y110.42
G1 X114.083 Y105.255 E.22445
G1 X114.083 Y104.722
G1 X108.917 Y109.887 E.22445
G1 X108.917 Y109.354
G1 X114.083 Y104.189 E.22445
G1 X114.083 Y103.655
G1 X108.917 Y108.821 E.22445
G1 X108.917 Y108.287
G1 X114.082 Y103.122 E.22444
G1 X113.549 Y103.122
G1 X108.917 Y107.754 E.20127
G1 X108.917 Y107.221
G1 X113.016 Y103.122 E.17809
M73 P49 R9
G1 X112.482 Y103.122
G1 X108.917 Y106.688 E.15492
G1 X108.917 Y106.154
G1 X111.949 Y103.122 E.13175
G1 X111.416 Y103.122
G1 X108.917 Y105.621 E.10857
G1 X108.917 Y105.088
G1 X110.883 Y103.122 E.0854
G1 X110.349 Y103.122
G1 X108.917 Y104.554 E.06223
G1 X108.917 Y104.021
G1 X109.816 Y103.122 E.03905
G1 X109.283 Y103.122
G1 X108.917 Y103.488 E.01588
M204 S10000
; WIPE_START
G1 F24000
G1 X109.283 Y103.122 E-.19641
G1 X109.816 Y103.122 E-.20264
G1 X109.144 Y103.794 E-.36095
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-1.189 J.259 P1  F30000
G1 X116.242 Y136.355 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X115.287 Y135.037 I17.693 J-13.828 E.05401
G1 X108.402 Y141.922 E.32296
G2 X112.119 Y145.881 I22.348 J-17.256 E.18042
G1 X118.94 Y139.06 E.31997
G2 X123.824 Y141.852 I11.102 J-13.75 E.18741
G1 X116.615 Y149.061 E.33816
G2 X118.059 Y149.814 I8.379 J-14.293 E.05403
M106 S252.45
; CHANGE_LAYER
; Z_HEIGHT: 1.76
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F24000
G1 X116.615 Y149.061 E-.61864
G1 X116.878 Y148.798 E-.14136
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 14/58
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
G3 Z2 I1.217 J-.002 P1  F30000
G1 X116.842 Y130.5 Z2
G1 Z1.76
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.26
G1 F7437
G1 X114.698 Y130.5 E.08273
G1 X114.682 Y130.5 F30000
G1 F7437
G1 X114.682 Y129.696 E.03103
G1 X114.869 Y129.789 E.00807
G3 X115.762 Y129.48 I.843 J.989 E.03732
G3 X115.187 Y131.606 I-.039 J1.13 E.15719
G1 X114.911 Y130.956 E.02723
G2 X114.682 Y130.896 I-.16 J.143 E.00968
G1 X114.682 Y130.56 E.01295
; WIPE_START
G1 F24000
G1 X114.682 Y129.696 E-.32838
G1 X114.869 Y129.789 E-.07953
G1 X115.317 Y129.538 E-.19502
G1 X115.727 Y129.485 E-.15707
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.16 I1.215 J-.067 P1  F30000
G1 X115.369 Y123 Z2.16
G1 Z1.76
G1 E.8 F1800
G1 F7437
G1 X116.899 Y123 E.05904
G1 X116.897 Y122.998 F30000
G1 F7437
G1 X116.698 Y123.165 E.01004
G3 X116.281 Y123.293 I-.536 J-1 E.01696
G3 X114.98 Y122.354 I-.148 J-1.165 E.06814
G1 X114.682 Y122.397 E.01161
G1 X114.682 Y121.935 E.01785
G1 X114.98 Y121.978 E.01161
G3 X116.208 Y121.032 I1.156 J.231 E.06525
G3 X117.034 Y122.891 I-.045 J1.133 E.09738
G1 X116.945 Y122.961 E.00438
; WIPE_START
G1 F24000
G1 X116.698 Y123.165 E-.12168
G1 X116.281 Y123.293 E-.166
G1 X115.844 Y123.266 E-.16612
G1 X115.449 Y123.084 E-.16527
G1 X115.193 Y122.816 E-.14093
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.16 I1.217 J-.025 P1  F30000
G1 X115.093 Y118 Z2.16
G1 Z1.76
G1 E.8 F1800
G1 F7437
G1 X117.175 Y118 E.08034
G1 X117.174 Y117.999 F30000
G1 F7437
G1 X117.034 Y118.255 E.01125
G3 X116.281 Y118.657 I-.872 J-.726 E.03379
G3 X114.98 Y117.718 I-.148 J-1.165 E.06814
G1 X114.682 Y117.761 E.01161
G1 X114.682 Y117.299 E.01785
G1 X114.98 Y117.342 E.01161
G3 X116.208 Y116.396 I1.156 J.231 E.06525
G3 X117.241 Y117.88 I-.045 J1.133 E.08076
G1 X117.203 Y117.947 E.00296
; WIPE_START
G1 F24000
G1 X117.034 Y118.255 E-.13359
G1 X116.696 Y118.525 E-.16444
G1 X116.281 Y118.657 E-.16568
G1 X115.844 Y118.63 E-.16612
G1 X115.533 Y118.487 E-.13018
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.16 I1.211 J.115 P1  F30000
G1 X116.771 Y105.5 Z2.16
G1 Z1.76
G1 E.8 F1800
G1 F7437
G1 X114.698 Y105.5 E.07998
G1 X114.682 Y105.5 F30000
G1 F7437
G1 X114.682 Y104.56 E.03627
G2 X115.082 Y104.453 I.147 J-.253 E.01774
G1 X115.082 Y103.921 E.02052
G3 X115.729 Y103.789 I.56 J1.093 E.02579
G3 X116.78 Y105.485 I-.08 J1.223 E.08992
G3 X114.889 Y106.881 I-.984 J.646 E.13761
G1 X114.682 Y106.969 E.00869
G1 X114.682 Y105.56 E.05436
; WIPE_START
G1 F24000
G1 X114.682 Y104.56 E-.38002
G1 X114.975 Y104.56 E-.11146
G1 X115.082 Y104.453 E-.05733
G1 X115.082 Y103.921 E-.20208
G1 X115.106 Y103.917 E-.00911
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.16 I-.286 J-1.183 P1  F30000
G1 X108.318 Y105.56 Z2.16
G1 Z1.76
G1 E.8 F1800
G1 F7437
G1 X108.318 Y105.822 E.0101
G1 X108.131 Y105.728 E.00808
G3 X107.42 Y103.761 I-.828 J-.813 E.1808
G3 X107.918 Y103.896 I-.065 J1.228 E.02003
G1 X107.918 Y104.453 E.02152
G2 X108.318 Y104.56 I.253 J-.147 E.01774
G1 X108.318 Y105.5 E.03627
G1 X108.302 Y105.5 F30000
G1 F7437
G1 X106.322 Y105.5 E.07639
; WIPE_START
G1 F24000
G1 X108.302 Y105.5 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.16 I-1.207 J-.156 P1  F30000
G1 X107.137 Y114.523 Z2.16
G1 Z1.76
G1 E.8 F1800
G1 F7437
G3 X108.089 Y115.076 I-.087 J1.243 E.04398
G1 X108.318 Y114.996 E.00937
G1 X108.318 Y116.318 E.05101
G1 X108.089 Y116.237 E.00937
G3 X107.078 Y114.521 I-1.017 J-.557 E.18873
G1 X108.302 Y115.5 F30000
G1 F7437
G1 X105.909 Y115.5 E.09232
; WIPE_START
G1 F24000
G1 X107.909 Y115.5 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.16 I-1.208 J-.146 P1  F30000
G1 X106.912 Y123.748 Z2.16
G1 Z1.76
G1 E.8 F1800
G1 F7437
G1 X107.31 Y123.7 E.01547
G3 X108.121 Y124.064 I-.081 J1.265 E.03505
G1 X108.318 Y123.973 E.00836
G1 X108.318 Y127.249 E.12639
G1 X108.111 Y127.161 E.00869
G3 X106.294 Y125.667 I-.895 J-.763 E.14094
G3 X106.043 Y124.764 I3.316 J-1.41 E.03628
G3 X106.853 Y123.753 I1.173 J.11 E.05292
G1 X108.302 Y125.5 F30000
G1 F7437
G1 X106.286 Y125.5 E.0778
; WIPE_START
G1 F24000
G1 X108.286 Y125.5 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.16 I-1.125 J-.463 P1  F30000
G1 X106.891 Y128.887 Z2.16
G1 Z1.76
G1 E.8 F1800
G1 F7437
G3 X107.255 Y128.859 I.267 J1.095 E.01416
G3 X108.108 Y129.299 I-.128 J1.296 E.03793
G1 X108.318 Y129.211 E.00876
G1 X108.318 Y130.887 E.06464
G1 X108.119 Y130.796 E.00843
G1 X108 Y130.899 E.00606
G1 X106.504 Y130.899 E.05775
G3 X106.833 Y128.903 I.654 J-.918 E.09695
G1 X108.302 Y130.5 F30000
G1 F7437
G1 X106.191 Y130.5 E.08146
; WIPE_START
G1 F24000
G1 X108.191 Y130.5 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.16 I0 J1.217 P1  F30000
G1 X143.164 Y130.5 Z2.16
G1 Z1.76
G1 E.8 F1800
G1 F7437
G1 X145.302 Y130.5 E.08248
G1 X145.318 Y130.5 F30000
G1 F7437
G1 X145.318 Y130.893 E.01516
G2 X144.993 Y131.193 I-.018 J.307 E.01904
G1 X144.713 Y131.673 E.02144
G3 X144.398 Y129.449 I-.408 J-1.076 E.15926
G3 X145.131 Y129.749 I-.109 J1.311 E.03103
G1 X145.318 Y129.656 E.00807
G1 X145.318 Y130.44 E.03027
; WIPE_START
G1 F24000
G1 X145.318 Y130.893 E-.17212
G1 X145.139 Y130.94 E-.07022
G1 X144.993 Y131.193 E-.11091
G1 X144.713 Y131.673 E-.2112
G1 X144.201 Y131.714 E-.19542
G1 X144.2 Y131.714 E-.00014
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.16 I.194 J1.201 P1  F30000
G1 X151.698 Y130.5 Z2.16
G1 Z1.76
G1 E.8 F1800
G1 F7437
G1 X153.821 Y130.5 E.08189
G1 X153.831 Y130.507 F30000
G1 F7437
G1 X153.645 Y130.797 E.01327
G3 X153.343 Y131.013 I-.804 J-.802 E.01441
G1 X152.131 Y130.995 E.04676
G3 X151.892 Y130.794 I.852 J-1.254 E.0121
G1 X151.682 Y130.881 E.00876
G1 X151.682 Y129.225 E.0639
G1 X151.892 Y129.312 E.00876
G3 X152.901 Y128.861 I.978 J.834 E.04409
G3 X153.873 Y130.469 I-.06 J1.134 E.08534
; WIPE_START
G1 F24000
G1 X153.645 Y130.797 E-.15174
G1 X153.343 Y131.013 E-.14128
G1 X152.131 Y130.995 E-.4606
G1 X152.118 Y130.984 E-.00638
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.16 I1.216 J.034 P1  F30000
G1 X152.411 Y120.5 Z2.16
G1 Z1.76
G1 E.8 F1800
G1 F7437
G1 X153.857 Y120.5 E.05579
G1 X153.859 Y120.497 F30000
G1 F7437
G1 X153.935 Y120.539 E.00335
G3 X153.281 Y122.497 I-.773 J.83 E.10011
G3 X151.98 Y121.558 I-.148 J-1.165 E.06813
G1 X151.682 Y121.601 E.01161
G1 X151.682 Y121.138 E.01786
G1 X151.98 Y121.181 E.01161
G3 X153.208 Y120.235 I1.156 J.231 E.06524
G3 X153.565 Y120.308 I-.045 J1.133 E.01416
G1 X153.809 Y120.465 E.01115
; WIPE_START
G1 F24000
G1 X153.935 Y120.539 E-.05573
G1 X154.187 Y120.887 E-.16337
G1 X154.295 Y121.298 E-.16161
G1 X154.241 Y121.719 E-.16138
G1 X154.032 Y122.092 E-.16245
G1 X153.918 Y122.184 E-.05547
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.16 I.632 J-1.04 P1  F30000
G1 X142.924 Y115.5 Z2.16
G1 Z1.76
G1 E.8 F1800
G1 F7437
G1 X144.807 Y115.5 E.07263
G1 X144.79 Y115.491 F30000
G1 F7437
G1 X144.733 Y115.654 E.00664
G3 X143.939 Y113.726 I-.853 J-.776 E.17912
G3 X145.02 Y114.672 I-.075 J1.177 E.0596
G1 X145.318 Y114.629 E.01161
G1 X145.318 Y115.092 E.01785
G1 X145.02 Y115.049 E.01161
G1 X144.818 Y115.438 E.01694
; WIPE_START
G1 F24000
G1 X144.733 Y115.654 E-.088
G1 X144.156 Y115.961 E-.24852
G1 X143.505 Y115.941 E-.24732
G1 X143.119 Y115.684 E-.17616
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.16 I1.217 J.011 P1  F30000
G1 X143.214 Y105.5 Z2.16
G1 Z1.76
G1 E.8 F1800
G1 F7437
G1 X145.302 Y105.5 E.08057
G1 X145.318 Y105.5 F30000
G1 F7437
G1 X145.318 Y105.735 E.00908
G1 X145.121 Y105.644 E.00838
G3 X144.316 Y103.761 I-.904 J-.727 E.1845
G3 X144.918 Y104.453 I.136 J.489 E.04414
G2 X145.318 Y104.56 I.253 J-.147 E.01774
G1 X145.318 Y105.44 E.03395
; WIPE_START
G1 F24000
G1 X145.318 Y105.735 E-.11228
G1 X145.121 Y105.644 E-.08253
G1 X144.58 Y105.979 E-.24172
G1 X143.984 Y106.022 E-.22723
G1 X143.752 Y105.919 E-.09625
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.16 I.073 J1.215 P1  F30000
G1 X151.682 Y105.44 Z2.16
G1 Z1.76
G1 E.8 F1800
G1 F7437
G1 X151.682 Y104.56 E.03395
G2 X152.082 Y104.453 I.147 J-.253 E.01774
G1 X152.089 Y104.03 E.01635
G3 X152.804 Y103.861 I.636 J1.095 E.02874
G3 X153.94 Y105.317 I-.083 J1.236 E.08043
G3 X151.889 Y106.38 I-1.136 J.318 E.1243
G1 X151.682 Y106.468 E.00869
G1 X151.682 Y105.5 E.03736
G1 X151.698 Y105.5 F30000
G1 F7437
G1 X153.969 Y105.5 E.08762
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.04
; WIPE_START
G1 F24000
G1 X151.969 Y105.5 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 15/58
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
G3 Z2.16 I.636 J-1.038 P1  F30000
G1 X148.5 Y103.376 Z2.16
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F7437
G1 X146.102 Y103.376 E.07954
G1 X146.102 Y103.08 E.00981
G1 X150.898 Y103.08 E.15909
G1 X150.898 Y103.376 E.00981
G1 X148.56 Y103.376 E.07755
G1 X148.5 Y103.768 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7437
G1 X145.71 Y103.768 E.08573
G1 X145.71 Y102.688 E.03319
G1 X151.29 Y102.688 E.17146
G1 X151.29 Y103.768 E.03319
G1 X148.56 Y103.768 E.08389
M204 S10000
; WIPE_START
G1 F24000
G1 X146.56 Y103.768 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I.013 J-1.217 P1  F30000
G1 X109.102 Y103.376 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7437
G1 X109.102 Y103.08 E.00981
G1 X113.898 Y103.08 E.15909
G1 X113.898 Y103.376 E.00981
G1 X109.162 Y103.376 E.1571
G1 X108.71 Y103.768 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7437
G1 X108.71 Y102.688 E.03319
G1 X114.29 Y102.688 E.17146
G1 X114.29 Y103.768 E.03319
G1 X108.77 Y103.768 E.16961
M204 S10000
; WIPE_START
G1 F24000
G1 X108.71 Y102.688 E-.41103
G1 X109.628 Y102.688 E-.34897
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-.726 J.976 P1  F30000
G1 X149.143 Y132.08 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7437
G1 X153.454 Y132.08 E.14299
G3 X155.698 Y135.346 I.007 J2.399 E.15467
G3 X104.23 Y135.13 I-25.692 J-9.993 E2.20209
G3 X106.545 Y132.08 I2.308 J-.652 E.14708
G1 X114.101 Y132.08 E.25066
G1 X114.27 Y132.479 E.01439
G2 X145.899 Y132.08 I15.727 J-7.121 E1.3266
G1 X149.083 Y132.08 E.10563
G1 X149.143 Y131.688 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7437
G1 X153.46 Y131.688 E.13263
G3 X156.063 Y135.488 I.001 J2.791 E.1665
G3 X103.853 Y135.236 I-26.057 J-10.134 E2.06988
G3 X106.54 Y131.688 I2.686 J-.757 E.1583
G1 X114.361 Y131.688 E.24032
G1 X114.473 Y131.952 E.00883
G2 X145.639 Y131.688 I15.528 J-6.598 E1.22088
G1 X149.083 Y131.688 E.10582
M204 S10000
; WIPE_START
G1 F24000
G1 X151.083 Y131.688 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-.654 J-1.026 P1  F30000
G1 X143.759 Y136.356 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7437
G2 X144.713 Y135.037 I-12.66 J-10.161 E.05402
G1 X149.404 Y139.728 E.22006
G1 X148.976 Y139.728 E.01417
G1 X155.234 Y133.47 E.29355
G3 X155.37 Y135.227 I-2.063 J1.044 E.05998
G3 X154.517 Y137.165 I-18.725 J-7.088 E.07025
G1 X149.78 Y132.428 E.22221
G1 X148.6 Y132.428 E.03916
G1 X141.3 Y139.728 E.34243
G1 X141.728 Y139.728 E.01417
G1 X141.061 Y139.061 E.03125
G2 X142.279 Y137.981 I-12.619 J-15.449 E.054
G1 X134.946 Y142.68 F30000
G1 F7437
G2 X136.491 Y142.167 I-4.402 J-15.843 E.05401
G1 X143.084 Y148.76 E.30927
G2 X147.588 Y145.588 I-14.327 J-25.138 E.18302
G1 X142.542 Y140.542 E.23675
G1 X140.486 Y140.542 E.06818
G1 X128.886 Y152.142 E.54421
G2 X130.975 Y152.149 I1.2 J-47.148 E.0693
G1 X131.114 Y152.142 E.00464
G1 X119.514 Y140.542 E.5442
M73 P50 R9
G1 X117.458 Y140.542 E.06819
G1 X112.407 Y145.593 E.23695
G3 X108.693 Y141.631 I18.044 J-20.637 E.18044
G1 X109.782 Y140.542 E.05108
G1 X111.838 Y140.542 E.06819
G1 X122.345 Y151.049 E.49291
G1 X129.976 Y143.376 E.35897
G1 X137.655 Y151.049 E.3601
G1 X148.162 Y140.542 E.49291
G1 X150.218 Y140.542 E.06818
G1 X151.307 Y141.631 E.05108
G3 X150.281 Y142.895 I-35.854 J-28.015 E.05401
G1 X115.52 Y147.923 F30000
G1 F7437
G2 X116.916 Y148.759 I23.466 J-37.611 E.05401
G1 X123.509 Y142.167 E.30927
G2 X125.052 Y142.684 I6.059 J-15.528 E.05401
G1 X120.622 Y140.264 F30000
G1 F7437
G1 X120.846 Y140.407 E.00881
G2 X139.575 Y140.135 I9.148 J-15.032 E.65522
G1 X152.852 Y140.135 E.44041
G3 X113.753 Y147.19 I-22.852 J-14.774 E1.47738
G1 X113.753 Y147.19 E0
G3 X107.15 Y140.135 I16.218 J-21.796 E.32227
G1 X120.42 Y140.135 E.44019
G1 X120.572 Y140.232 E.00596
G1 X117.724 Y137.979 F30000
G1 F7437
G2 X118.94 Y139.06 I10.567 J-10.658 E.05401
G1 X118.272 Y139.728 E.03132
G1 X118.7 Y139.728 E.01417
G1 X111.401 Y132.429 E.34238
G1 X110.218 Y132.43 E.03925
G1 X105.483 Y137.165 E.22213
G3 X104.536 Y134.917 I20.104 J-9.792 E.08094
G3 X104.759 Y133.463 I2.254 J-.399 E.04969
G1 X111.024 Y139.728 E.2939
G1 X110.596 Y139.728 E.01417
G1 X115.287 Y135.037 E.22004
G3 X114.457 Y133.637 I16.269 J-10.589 E.054
; CHANGE_LAYER
; Z_HEIGHT: 2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X115.287 Y135.037 E-.61847
G1 X115.024 Y135.301 E-.14153
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 16/58
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
G3 Z2.2 I.84 J.881 P1  F30000
G1 X148.5 Y103.376 Z2.2
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5252
G1 X146.102 Y103.376 E.07954
G1 X146.102 Y103.08 E.00981
G1 X150.898 Y103.08 E.15909
G1 X150.898 Y103.376 E.00981
G1 X148.56 Y103.376 E.07755
G1 X148.5 Y103.768 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5252
G1 X145.71 Y103.768 E.08573
G1 X145.71 Y102.688 E.03319
G1 X151.29 Y102.688 E.17146
G1 X151.29 Y103.768 E.03319
G1 X148.56 Y103.768 E.08389
M204 S10000
; WIPE_START
G1 F24000
G1 X146.56 Y103.768 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I.013 J-1.217 P1  F30000
G1 X109.102 Y103.376 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5252
G1 X109.102 Y103.08 E.00981
G1 X113.898 Y103.08 E.15909
G1 X113.898 Y103.376 E.00981
G1 X109.162 Y103.376 E.1571
G1 X108.71 Y103.768 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5252
G1 X108.71 Y102.688 E.03319
G1 X114.29 Y102.688 E.17146
G1 X114.29 Y103.768 E.03319
G1 X108.77 Y103.768 E.16961
M204 S10000
; WIPE_START
G1 F24000
G1 X108.71 Y102.688 E-.41103
G1 X109.628 Y102.688 E-.34897
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-.725 J.978 P1  F30000
G1 X149.272 Y132.08 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5252
G1 X153.453 Y132.08 E.13867
G3 X155.698 Y135.346 I.008 J2.399 E.15471
G3 X104.231 Y135.131 I-25.692 J-9.993 E2.20205
G3 X106.545 Y132.08 I2.308 J-.653 E.14712
G1 X114.101 Y132.08 E.25066
G1 X114.27 Y132.478 E.01434
G2 X145.899 Y132.08 I15.727 J-7.121 E1.32661
G1 X149.212 Y132.08 E.10991
G1 X149.272 Y131.688 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5252
G1 X153.459 Y131.688 E.12865
G3 X156.063 Y135.488 I.002 J2.791 E.16651
G3 X103.853 Y135.237 I-26.057 J-10.134 E2.06984
G3 X106.54 Y131.688 I2.686 J-.758 E.15834
G1 X114.361 Y131.688 E.24032
G1 X114.455 Y131.909 E.00737
G2 X145.639 Y131.688 I15.547 J-6.554 E1.22234
G1 X149.212 Y131.688 E.10979
M204 S10000
; WIPE_START
G1 F24000
G1 X151.212 Y131.688 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-.646 J-1.031 P1  F30000
G1 X143.759 Y136.355 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5252
G2 X144.712 Y135.036 I-12.619 J-10.129 E.05402
G1 X149.404 Y139.728 E.22007
G1 X148.976 Y139.728 E.01417
G1 X155.234 Y133.469 E.29358
G3 X155.37 Y135.227 I-2.083 J1.045 E.05998
G3 X154.517 Y137.165 I-18.57 J-7.021 E.07025
G1 X149.78 Y132.428 E.2222
G1 X148.6 Y132.428 E.03916
G1 X141.3 Y139.728 E.34243
G1 X141.728 Y139.728 E.01417
G1 X141.062 Y139.062 E.03124
G2 X142.279 Y137.981 I-12.797 J-15.649 E.054
G1 X134.946 Y142.68 F30000
G1 F5252
G2 X136.491 Y142.167 I-4.408 J-15.865 E.05401
G1 X143.084 Y148.76 E.30927
G2 X144.928 Y147.623 I-15.237 J-26.8 E.07188
G1 X144.928 Y147.623 E0
G2 X147.588 Y145.588 I-14.436 J-21.63 E.11118
G1 X142.542 Y140.542 E.23675
G1 X140.486 Y140.542 E.06818
G1 X128.886 Y152.142 E.54421
G2 X130.953 Y152.15 I1.212 J-46.465 E.06859
G1 X131.114 Y152.142 E.00535
G1 X119.514 Y140.542 E.5442
G1 X117.458 Y140.542 E.06819
G1 X112.407 Y145.593 E.23695
G3 X108.693 Y141.631 I18.067 J-20.658 E.18044
G1 X109.782 Y140.542 E.05108
G1 X111.838 Y140.542 E.06819
G1 X122.345 Y151.049 E.49291
G1 X129.975 Y143.377 E.35893
G1 X137.655 Y151.049 E.3601
G1 X148.162 Y140.542 E.49291
G1 X150.218 Y140.542 E.06818
G1 X151.307 Y141.631 E.05109
G3 X150.281 Y142.895 I-35.571 J-27.793 E.05401
G1 X115.52 Y147.923 F30000
G1 F5252
G2 X116.916 Y148.759 I23.465 J-37.617 E.05401
G1 X123.509 Y142.167 E.30927
G2 X125.052 Y142.684 I6.048 J-15.49 E.05401
G1 X120.611 Y140.257 F30000
G1 F5252
G1 X120.846 Y140.408 E.00928
G2 X139.575 Y140.135 I9.147 J-15.036 E.65518
G1 X152.852 Y140.135 E.44042
G3 X117.15 Y149.347 I-22.862 J-14.817 E1.3434
G1 X117.15 Y149.347 E0
G3 X113.747 Y147.185 I12.47 J-23.39 E.13389
G1 X113.747 Y147.185 E0
G3 X107.15 Y140.135 I16.219 J-21.786 E.32198
G1 X120.42 Y140.135 E.44019
G1 X120.56 Y140.224 E.00552
G1 X117.724 Y137.978 F30000
G1 F5252
G2 X118.94 Y139.06 I10.422 J-10.491 E.05401
G1 X118.272 Y139.728 E.03132
G1 X118.7 Y139.728 E.01417
G1 X111.401 Y132.429 E.34238
G1 X110.218 Y132.43 E.03925
G1 X105.483 Y137.165 E.22213
G3 X104.536 Y134.915 I20.088 J-9.785 E.081
G3 X104.759 Y133.463 I2.254 J-.398 E.04963
G1 X111.024 Y139.728 E.29389
M73 P51 R9
G1 X110.596 Y139.728 E.01417
G1 X115.288 Y135.036 E.22008
G3 X114.457 Y133.637 I15.39 J-10.083 E.054
M106 S249.9
; CHANGE_LAYER
; Z_HEIGHT: 2.02
; LAYER_HEIGHT: 0.02
; WIPE_START
G1 F24000
G1 X115.288 Y135.036 E-.61844
G1 X115.024 Y135.3 E-.14156
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 17/58
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
G3 Z2.4 I1.214 J-.083 P1  F30000
G1 X114.698 Y130.5 Z2.4
G1 Z2.02
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.26
G1 F9000
G1 X116.696 Y130.5 E.07707
G1 X116.684 Y130.501 F30000
G1 F9000
G1 X116.706 Y130.771 E.01045
G3 X115.269 Y131.735 I-1.119 J-.116 E.07615
G2 X114.82 Y130.896 I-4.718 J1.99 E.03678
G1 X114.682 Y130.896 E.00531
G1 X114.682 Y129.664 E.0475
G2 X115.066 Y129.642 I.179 J-.234 E.01618
G3 X115.641 Y129.531 I.528 J1.193 E.02276
G3 X116.653 Y130.294 I-.053 J1.124 E.05195
G1 X116.675 Y130.442 E.00576
; WIPE_START
G1 F24000
G1 X116.706 Y130.771 E-.12567
G1 X116.533 Y131.231 E-.18677
G1 X116.23 Y131.541 E-.16456
G1 X115.759 Y131.741 E-.19467
G1 X115.526 Y131.738 E-.08833
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.42 I1.217 J-.026 P1  F30000
G1 X115.338 Y123 Z2.42
G1 Z2.02
G1 E.8 F1800
G1 F9000
G1 X116.8 Y123 E.0564
G1 X116.797 Y122.997 F30000
G1 F9000
G1 X116.622 Y123.145 E.00885
G3 X116.212 Y123.271 I-.524 J-.98 E.01665
G3 X114.957 Y122.461 I-.143 J-1.157 E.06254
G1 X114.682 Y122.519 E.01083
G1 X114.682 Y121.812 E.02727
G1 X114.957 Y121.87 E.01083
G3 X116.14 Y121.055 I1.117 J.354 E.0597
G3 X116.952 Y122.876 I-.043 J1.111 E.09549
G1 X116.845 Y122.96 E.00525
; WIPE_START
G1 F24000
G1 X116.622 Y123.145 E-.10991
G1 X116.212 Y123.271 E-.16293
G1 X115.854 Y123.26 E-.13613
G1 X115.456 Y123.105 E-.16239
G1 X115.144 Y122.819 E-.16073
G1 X115.11 Y122.754 E-.0279
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.42 I1.217 J-.015 P1  F30000
G1 X115.052 Y118 Z2.42
G1 Z2.02
G1 E.8 F1800
G1 F9000
G1 X117.085 Y118 E.07846
G1 X117.084 Y117.999 F30000
G1 F9000
G1 X116.952 Y118.241 E.01062
G3 X116.212 Y118.635 I-.854 J-.711 E.03316
G3 X114.957 Y117.825 I-.143 J-1.157 E.06254
G1 X114.682 Y117.883 E.01083
G1 X114.682 Y117.177 E.02727
G1 X114.957 Y117.235 E.01083
G3 X116.14 Y116.419 I1.117 J.354 E.0597
G3 X117.155 Y117.873 I-.043 J1.111 E.0792
G1 X117.113 Y117.947 E.00326
; WIPE_START
G1 F24000
G1 X116.952 Y118.241 E-.12736
G1 X116.62 Y118.505 E-.1613
G1 X116.212 Y118.635 E-.16259
G1 X115.854 Y118.624 E-.13613
G1 X115.456 Y118.469 E-.16239
G1 X115.436 Y118.451 E-.01023
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.42 I.336 J-1.17 P1  F30000
G1 X108.318 Y116.406 Z2.42
G1 Z2.02
G1 E.8 F1800
G1 F9000
G1 X108.1 Y116.321 E.00903
G3 X107.238 Y114.546 I-.94 J-.641 E.18358
G3 X108.1 Y114.993 I-.074 J1.195 E.03854
G1 X108.318 Y114.908 E.00903
G1 X108.318 Y116.346 E.05547
G1 X108.302 Y115.5 F30000
G1 F9000
G1 X106.034 Y115.5 E.08748
; WIPE_START
G1 F24000
G1 X108.034 Y115.5 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.42 I-1.208 J-.145 P1  F30000
G1 X107.04 Y123.769 Z2.42
G1 Z2.02
G1 E.8 F1800
G1 F9000
G1 X107.435 Y123.721 E.01535
G3 X108.142 Y123.991 I-.088 J1.288 E.02963
G1 X108.318 Y123.896 E.00774
G1 X108.318 Y127.339 E.13284
G1 X108.131 Y127.245 E.00805
G3 X106.455 Y125.668 I-.798 J-.831 E.13517
G3 X106.192 Y124.764 I5.613 J-2.122 E.03636
G3 X106.981 Y123.775 I1.15 J.108 E.05165
G1 X108.302 Y125.5 F30000
G1 F9000
G1 X106.444 Y125.5 E.0717
; WIPE_START
G1 F24000
G1 X108.302 Y125.5 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.42 I-1.139 J-.428 P1  F30000
G1 X106.995 Y128.98 Z2.42
G1 Z2.02
G1 E.8 F1800
G1 F9000
G3 X107.352 Y128.953 I.259 J1.07 E.01388
G3 X108.118 Y129.311 I-.112 J1.239 E.03331
G1 X108.318 Y129.221 E.00845
G1 X108.318 Y130.899 E.06474
G1 X106.541 Y130.889 E.06857
G3 X106.937 Y128.995 I.713 J-.839 E.09115
G1 X106.279 Y130.5 F30000
G1 F9000
G1 X108.302 Y130.5 E.07804
G1 X108.689 Y130.401 F30000
; FEATURE: Support interface
; LAYER_HEIGHT: 0.2
G1 F4800
G1 X108.689 Y130.892 E.01508
G1 X108.95 Y130.892 E.00804
G1 X108.95 Y104.566 E.80891
G1 X109.827 Y104.566 E.02695
G1 X109.827 Y130.891 E.8089
G1 X110.704 Y130.891 E.02695
G1 X110.704 Y104.566 E.80888
G1 X111.581 Y104.566 E.02695
G1 X111.581 Y130.891 E.80887
G1 X112.458 Y130.89 E.02695
G1 X112.458 Y104.566 E.80886
G1 X113.336 Y104.566 E.02695
G1 X113.335 Y130.89 E.80885
G1 X114.213 Y130.889 E.02695
G1 X114.213 Y104.566 E.80883
; WIPE_START
G1 F24000
G1 X114.213 Y106.566 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.42 I1.108 J.504 P1  F30000
G1 X114.698 Y105.5 Z2.42
G1 Z2.02
G1 E.8 F1800
; FEATURE: Support
; LAYER_HEIGHT: 0.26
G1 F9000
G1 X116.618 Y105.5 E.07408
G1 X116.63 Y105.494 F30000
G1 F9000
G1 X116.785 Y105.817 E.01383
G3 X114.869 Y106.961 I-1.106 J.325 E.11727
G1 X114.682 Y107.055 E.00805
G1 X114.682 Y104.56 E.09627
G2 X115.082 Y104.453 I.147 J-.253 E.01774
G1 X115.082 Y103.859 E.02293
G3 X115.607 Y103.779 I.451 J1.197 E.02062
G3 X116.636 Y105.44 I-.081 J1.2 E.08804
; WIPE_START
G1 F24000
G1 X116.785 Y105.817 E-.15383
G1 X116.856 Y106.223 E-.15665
G1 X116.747 Y106.626 E-.15853
G1 X116.49 Y106.965 E-.16161
G1 X116.199 Y107.142 E-.12938
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.42 I.257 J-1.19 P1  F30000
G1 X108.318 Y105.44 Z2.42
G1 Z2.02
G1 E.8 F1800
G1 F9000
G1 X108.318 Y105.849 E.01577
G2 X107.934 Y105.872 I-.179 J.233 E.01616
G3 X107.539 Y103.751 I-.523 J-1 E.1627
G3 X107.918 Y103.833 I-.096 J1.352 E.01499
G1 X107.918 Y104.453 E.02391
G2 X108.318 Y104.56 I.253 J-.147 E.01774
G1 X108.318 Y105.38 E.03165
G1 X108.302 Y105.5 F30000
G1 F9000
G1 X106.493 Y105.5 E.0698
; WIPE_START
G1 F24000
G1 X108.302 Y105.5 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.42 I-.337 J1.169 P1  F30000
G1 X143.017 Y115.5 Z2.42
G1 Z2.02
G1 E.8 F1800
G1 F9000
G1 X144.846 Y115.5 E.07056
G1 X144.83 Y115.49 F30000
G1 F9000
G1 X144.734 Y115.692 E.00862
G3 X144.003 Y113.749 I-.79 J-.812 E.17324
G3 X145.043 Y114.565 I-.08 J1.172 E.05416
G1 X145.318 Y114.507 E.01083
G1 X145.318 Y115.214 E.02727
G1 X145.043 Y115.156 E.01083
G1 X144.862 Y115.439 E.01297
; WIPE_START
G1 F24000
G1 X144.734 Y115.692 E-.10754
G1 X144.146 Y115.954 E-.24485
G1 X143.51 Y115.895 E-.24268
G1 X143.164 Y115.633 E-.16494
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.42 I1.217 J.027 P1  F30000
G1 X143.393 Y105.5 Z2.42
G1 Z2.02
G1 E.8 F1800
G1 F9000
G1 X145.302 Y105.5 E.07366
G1 X145.318 Y105.5 F30000
G1 F9000
G1 X145.318 Y105.78 E.0108
G1 X145.131 Y105.686 E.00807
G3 X144.443 Y103.751 I-.807 J-.803 E.17717
G3 X144.918 Y103.876 I-.062 J1.204 E.01907
G1 X144.918 Y104.453 E.02227
G2 X145.318 Y104.56 I.253 J-.147 E.01774
G1 X145.318 Y105.44 E.03395
; WIPE_START
G1 F24000
G1 X145.318 Y105.78 E-.12914
G1 X145.131 Y105.686 E-.07949
G1 X144.63 Y105.946 E-.21428
G1 X144.045 Y105.952 E-.22237
G1 X143.777 Y105.813 E-.11471
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.42 I.057 J1.216 P1  F30000
G1 X151.682 Y105.44 Z2.42
G1 Z2.02
G1 E.8 F1800
G1 F9000
G1 X151.682 Y104.56 E.03395
G2 X152.082 Y104.453 I.147 J-.253 E.01774
G1 X152.1 Y103.949 E.01948
G3 X152.672 Y103.85 I.498 J1.18 E.02261
G3 X153.799 Y105.312 I-.097 J1.24 E.08024
G3 X151.869 Y106.442 I-1.112 J.314 E.1174
G1 X151.682 Y106.535 E.00806
G1 X151.682 Y105.5 E.03995
G1 X153.829 Y105.5 F30000
G1 F9000
G1 X151.698 Y105.5 E.08221
G1 X151.311 Y105.057 F30000
; FEATURE: Support interface
; LAYER_HEIGHT: 0.2
G1 F4800
G1 X151.311 Y104.566 E.01508
G1 X151.05 Y104.566 E.00804
G1 X151.05 Y130.973 E.81139
G1 X150.173 Y130.959 E.02695
G1 X150.173 Y104.566 E.81098
G1 X149.296 Y104.566 E.02695
G1 X149.296 Y130.946 E.81058
G1 X148.419 Y130.933 E.02695
G1 X148.419 Y104.566 E.81017
G1 X147.542 Y104.566 E.02695
G1 X147.542 Y130.92 E.80977
G1 X146.665 Y130.907 E.02695
G1 X146.665 Y104.566 E.80937
G1 X145.787 Y104.566 E.02695
G1 X145.787 Y130.894 E.80896
G1 X145.302 Y130.5 F30000
; FEATURE: Support
; LAYER_HEIGHT: 0.26
G1 F9000
G1 X143.312 Y130.5 E.07678
G1 X143.321 Y130.501 F30000
G1 F9000
G1 X143.379 Y130.196 E.01199
G3 X144.518 Y129.5 I1.042 J.424 E.05514
G3 X145.15 Y129.722 I-.122 J1.357 E.02612
G1 X145.318 Y129.625 E.00747
G1 X145.318 Y130.893 E.04892
G2 X144.993 Y131.192 I-.018 J.307 E.01904
G1 X144.69 Y131.712 E.02319
G3 X143.297 Y130.669 I-.27 J-1.092 E.07681
G1 X143.312 Y130.561 E.00421
; WIPE_START
G1 F24000
G1 X143.379 Y130.196 E-.1409
G1 X143.648 Y129.793 E-.18402
G1 X144.083 Y129.549 E-.18958
G1 X144.518 Y129.5 E-.16641
G1 X144.714 Y129.569 E-.07909
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.42 I-.161 J1.206 P1  F30000
G1 X151.698 Y130.5 Z2.42
G1 Z2.02
G1 E.8 F1800
G1 F9000
G1 X153.732 Y130.5 E.07846
G1 X153.742 Y130.506 F30000
G1 F9000
G1 X153.578 Y130.795 E.01283
G3 X153.318 Y131.013 I-.834 J-.732 E.01312
G1 X151.969 Y130.993 E.05205
G1 X151.87 Y130.918 E.00479
G3 X151.682 Y130.989 I-.163 J-.147 E.00805
G1 X151.682 Y129.233 E.06772
G1 X151.882 Y129.324 E.00845
G3 X152.801 Y128.956 I.88 J.866 E.03931
G3 X153.779 Y130.462 I-.058 J1.108 E.08072
; WIPE_START
G1 F24000
G1 X153.578 Y130.795 E-.14808
G1 X153.318 Y131.013 E-.12874
G1 X152.046 Y130.994 E-.48317
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.42 I1.216 J.039 P1  F30000
M73 P52 R9
G1 X152.382 Y120.5 Z2.42
G1 Z2.02
G1 E.8 F1800
G1 F9000
G1 X153.755 Y120.5 E.05294
G1 X153.755 Y120.499 F30000
G1 F9000
G1 X153.855 Y120.555 E.00441
G3 X153.212 Y122.474 I-.757 J.814 E.09816
G3 X151.957 Y121.665 I-.143 J-1.157 E.06253
G1 X151.682 Y121.723 E.01083
G1 X151.682 Y121.016 E.02728
G1 X151.957 Y121.074 E.01083
G3 X153.14 Y120.258 I1.117 J.355 E.0597
G3 X153.492 Y120.329 I-.043 J1.111 E.0139
G1 X153.705 Y120.467 E.00977
; CHANGE_LAYER
; Z_HEIGHT: 2.2
; LAYER_HEIGHT: 0.18
; WIPE_START
G1 F24000
G1 X153.855 Y120.555 E-.06623
G1 X154.102 Y120.897 E-.16018
G1 X154.208 Y121.3 E-.15835
G1 X154.154 Y121.712 E-.15812
G1 X153.949 Y122.078 E-.15922
G1 X153.831 Y122.174 E-.05789
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 18/58
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
G3 Z2.42 I1.171 J-.332 P1  F30000
G1 X148.5 Y103.376 Z2.42
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X146.102 Y103.376 E.07954
G1 X146.102 Y103.08 E.00981
G1 X150.898 Y103.08 E.15909
G1 X150.898 Y103.376 E.00981
G1 X148.56 Y103.376 E.07755
G1 X148.5 Y103.768 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X145.71 Y103.768 E.08573
G1 X145.71 Y102.688 E.03319
G1 X151.29 Y102.688 E.17146
G1 X151.29 Y103.768 E.03319
G1 X148.56 Y103.768 E.08389
M204 S10000
; WIPE_START
G1 F24000
G1 X146.56 Y103.768 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I.013 J-1.217 P1  F30000
G1 X109.102 Y103.376 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X109.102 Y103.08 E.00981
G1 X113.898 Y103.08 E.15909
G1 X113.898 Y103.376 E.00981
G1 X109.162 Y103.376 E.1571
G1 X108.71 Y103.768 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X108.71 Y102.688 E.03319
G1 X114.29 Y102.688 E.17146
G1 X114.29 Y103.768 E.03319
G1 X108.77 Y103.768 E.16961
M204 S10000
; WIPE_START
G1 F24000
G1 X108.71 Y102.688 E-.41103
G1 X109.628 Y102.688 E-.34897
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I-.723 J.979 P1  F30000
G1 X149.416 Y132.08 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X153.452 Y132.08 E.13389
G3 X155.698 Y135.346 I.009 J2.399 E.15474
G3 X104.231 Y135.133 I-25.692 J-9.986 E2.20224
G3 X106.545 Y132.08 I2.308 J-.654 E.14716
G1 X114.101 Y132.08 E.25066
G1 X114.269 Y132.477 E.0143
G2 X145.899 Y132.08 I15.728 J-7.12 E1.32665
G1 X149.356 Y132.08 E.11466
G1 X149.416 Y131.688 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X153.459 Y131.688 E.12424
G3 X156.063 Y135.488 I.002 J2.791 E.16652
G3 X104.141 Y135.967 I-26.057 J-10.134 E2.04572
G3 X103.749 Y134.385 I3.114 J-1.61 E.05054
G3 X106.54 Y131.688 I2.79 J.095 E.13185
G1 X114.361 Y131.688 E.24032
G1 X114.436 Y131.865 E.00592
G2 X145.639 Y131.688 I15.565 J-6.511 E1.2238
G1 X149.356 Y131.688 E.11419
M204 S10000
; WIPE_START
G1 F24000
G1 X151.356 Y131.688 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I-.637 J-1.037 P1  F30000
G1 X143.758 Y136.355 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X144.712 Y135.036 I-12.576 J-10.097 E.05402
G1 X149.404 Y139.728 E.22008
G1 X148.976 Y139.728 E.01417
G1 X155.235 Y133.469 E.2936
G3 X155.37 Y135.227 I-2.088 J1.044 E.05998
G3 X154.516 Y137.165 I-18.42 J-6.957 E.07026
G1 X149.78 Y132.428 E.22219
G1 X148.6 Y132.428 E.03916
G1 X141.3 Y139.728 E.34243
G1 X141.728 Y139.728 E.01417
G1 X141.062 Y139.062 E.03124
G2 X142.279 Y137.981 I-13.077 J-15.964 E.054
G1 X134.946 Y142.68 F30000
G1 F15476.087
G2 X135.586 Y142.491 I-1.699 J-6.938 E.02212
G2 X136.225 Y142.271 I-33.022 J-96.906 E.02244
G1 X136.491 Y142.167 E.00946
G1 X143.084 Y148.76 E.30927
G2 X143.816 Y148.33 I-4.085 J-7.803 E.02819
G1 X143.816 Y148.33 E0
G2 X147.588 Y145.588 I-15.283 J-24.995 E.15484
G1 X142.542 Y140.542 E.23675
G1 X140.486 Y140.542 E.06818
G1 X128.886 Y152.142 E.54421
G2 X130.956 Y152.15 I1.211 J-46.544 E.06867
G1 X131.114 Y152.142 E.00527
G1 X119.514 Y140.542 E.5442
G1 X117.458 Y140.542 E.06819
G1 X112.407 Y145.593 E.23696
G3 X108.693 Y141.631 I18.091 J-20.68 E.18044
G1 X109.782 Y140.542 E.05109
G1 X111.838 Y140.542 E.06819
G1 X122.345 Y151.049 E.49291
G1 X129.975 Y143.377 E.35894
G1 X137.655 Y151.049 E.3601
G1 X148.162 Y140.542 E.49291
G1 X150.218 Y140.542 E.06818
G1 X151.307 Y141.631 E.0511
G3 X150.281 Y142.895 I-35.311 J-27.589 E.05401
G1 X115.52 Y147.923 F30000
G1 F15476.087
G2 X116.183 Y148.33 I4.498 J-6.605 E.02582
G1 X116.183 Y148.33 E0
G2 X116.916 Y148.759 I4.773 J-7.3 E.02821
G1 X123.509 Y142.167 E.30927
G2 X125.052 Y142.684 I6.035 J-15.445 E.05401
G1 X120.587 Y140.241 F30000
G1 F15476.087
G1 X120.848 Y140.409 E.01031
G2 X139.575 Y140.135 I9.145 J-15.033 E.65511
G1 X152.852 Y140.135 E.44042
G3 X150.225 Y143.566 I-22.388 J-14.42 E.14349
G1 X150.225 Y143.566 E0
G3 X117.14 Y149.342 I-20.219 J-18.17 E1.20088
G1 X117.14 Y149.342 E0
G3 X114.839 Y147.958 I12.934 J-24.107 E.08911
G1 X114.839 Y147.958 E0
G3 X113.738 Y147.179 I7.449 J-11.698 E.04477
G1 X113.738 Y147.179 E0
G3 X107.15 Y140.135 I16.221 J-21.774 E.32163
G1 X120.42 Y140.135 E.44019
G1 X120.536 Y140.209 E.00456
G1 X117.724 Y137.978 F30000
G1 F15476.087
G2 X118.94 Y139.06 I10.286 J-10.333 E.05401
G1 X118.272 Y139.728 E.03132
G1 X118.7 Y139.728 E.01417
G1 X111.401 Y132.429 E.34238
G1 X110.218 Y132.43 E.03925
G1 X105.484 Y137.165 E.22212
G3 X104.536 Y134.914 I20.096 J-9.787 E.08106
G3 X104.759 Y133.463 I2.255 J-.396 E.04957
G1 X111.024 Y139.728 E.29389
G1 X110.596 Y139.728 E.01417
G1 X115.288 Y135.036 E.22009
G3 X114.457 Y133.637 I15.253 J-10.004 E.054
; CHANGE_LAYER
; Z_HEIGHT: 2.28
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F24000
G1 X115.288 Y135.036 E-.61843
G1 X115.025 Y135.3 E-.14157
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 19/58
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
G3 Z2.6 I1.214 J-.083 P1  F30000
G1 X114.698 Y130.5 Z2.6
G1 Z2.28
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.26
G1 F9000
G1 X116.549 Y130.5 E.07143
G1 X116.539 Y130.502 F30000
G1 F9000
G1 X116.572 Y130.729 E.00885
G3 X115.293 Y131.762 I-1.097 J-.049 E.07174
G2 X114.82 Y130.896 I-5.12 J2.231 E.03815
G1 X114.682 Y130.896 E.00531
G1 X114.682 Y129.652 E.048
G2 X115.025 Y129.663 I.177 J-.183 E.0145
G3 X115.521 Y129.582 I.439 J1.143 E.01953
G3 X116.492 Y130.265 I-.046 J1.097 E.0484
G1 X116.527 Y130.443 E.00698
; WIPE_START
G1 F24000
G1 X116.572 Y130.729 E-.10997
G1 X116.431 Y131.187 E-.18236
G1 X116.155 Y131.508 E-.16067
G1 X115.776 Y131.711 E-.16348
G1 X115.401 Y131.751 E-.14352
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.68 I1.217 J-.013 P1  F30000
G1 X115.305 Y123 Z2.68
G1 Z2.28
G1 E.8 F1800
G1 F9000
G1 X116.697 Y123 E.05368
G1 X116.695 Y122.997 F30000
G1 F9000
G1 X116.544 Y123.125 E.00762
G3 X116.142 Y123.248 I-.513 J-.96 E.01633
G3 X114.945 Y122.549 I-.137 J-1.139 E.05741
G1 X114.682 Y122.613 E.01046
G1 X114.682 Y121.719 E.0345
G1 X114.945 Y121.783 E.01046
G3 X116.072 Y121.077 I1.056 J.433 E.05474
G3 X116.868 Y122.862 I-.04 J1.088 E.0936
G1 X116.742 Y122.96 E.00617
; WIPE_START
G1 F24000
G1 X116.544 Y123.125 E-.0978
G1 X116.142 Y123.248 E-.15986
G1 X115.791 Y123.237 E-.13357
G1 X115.4 Y123.086 E-.1593
G1 X115.137 Y122.86 E-.13168
G1 X115.03 Y122.685 E-.07779
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.68 I1.217 J-.005 P1  F30000
G1 X115.009 Y118 Z2.68
G1 Z2.28
G1 E.8 F1800
G1 F9000
G1 X116.993 Y118 E.07656
G1 X116.991 Y117.999 F30000
G1 F9000
G1 X116.868 Y118.226 E.00998
G3 X116.142 Y118.612 I-.836 J-.697 E.03253
G3 X114.945 Y117.913 I-.137 J-1.139 E.05741
G1 X114.682 Y117.977 E.01046
G1 X114.682 Y117.083 E.0345
G1 X114.945 Y117.147 E.01046
G3 X116.072 Y116.441 I1.056 J.433 E.05474
G3 X117.067 Y117.866 I-.04 J1.088 E.07764
G1 X117.021 Y117.947 E.00358
; WIPE_START
G1 F24000
G1 X116.868 Y118.226 E-.12104
G1 X116.542 Y118.485 E-.15817
G1 X116.142 Y118.612 E-.15951
G1 X115.791 Y118.601 E-.13357
G1 X115.4 Y118.45 E-.1593
G1 X115.343 Y118.401 E-.02841
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.68 I.321 J-1.174 P1  F30000
G1 X108.318 Y116.479 Z2.68
G1 Z2.28
G1 E.8 F1800
G1 F9000
G1 X108.121 Y116.388 E.00838
G3 X107.339 Y114.568 I-.862 J-.707 E.17625
G3 X108.121 Y114.926 I-.081 J1.209 E.03391
G1 X108.318 Y114.835 E.00838
G1 X108.318 Y116.419 E.06109
G1 X108.302 Y115.5 F30000
G1 F9000
G1 X106.16 Y115.5 E.08266
; WIPE_START
G1 F24000
G1 X108.16 Y115.5 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.68 I-1.212 J-.109 P1  F30000
G1 X107.418 Y123.763 Z2.68
G1 Z2.28
G1 E.8 F1800
G1 F9000
G1 X107.558 Y123.741 E.00548
G3 X108.151 Y123.938 I-.098 J1.29 E.02435
G1 X108.318 Y123.841 E.00744
G1 X108.318 Y127.412 E.13779
G2 X107.937 Y127.431 I-.179 J.232 E.01602
G3 X106.611 Y125.68 I-.503 J-.996 E.11974
G2 X106.346 Y124.967 I-36.623 J13.195 E.02937
G3 X107.059 Y123.813 I1.117 J-.108 E.0562
G1 X107.358 Y123.771 E.01166
G1 X108.302 Y125.5 F30000
G1 F9000
G1 X106.599 Y125.5 E.06569
; WIPE_START
G1 F24000
G1 X108.302 Y125.5 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.68 I-1.174 J-.322 P1  F30000
G1 X107.321 Y129.071 Z2.68
G1 Z2.28
G1 E.8 F1800
G1 F9000
G1 X107.445 Y129.046 E.00488
G3 X108.138 Y129.334 I-.121 J1.271 E.02937
G1 X108.318 Y129.239 E.00785
G1 X108.318 Y130.899 E.06404
G1 X106.6 Y130.892 E.06629
G3 X106.838 Y129.172 I.751 J-.773 E.07795
G1 X107.263 Y129.083 E.01672
G1 X106.37 Y130.5 F30000
G1 F9000
G1 X108.302 Y130.5 E.07456
G1 X108.689 Y130.401 F30000
; FEATURE: Support interface
; LAYER_HEIGHT: 0.2
G1 F4800
G1 X108.689 Y130.892 E.01508
G1 X108.95 Y130.892 E.00804
G1 X108.95 Y104.566 E.80891
G1 X109.827 Y104.566 E.02695
G1 X109.827 Y130.891 E.8089
G1 X110.704 Y130.891 E.02695
G1 X110.704 Y104.566 E.80888
G1 X111.581 Y104.566 E.02695
G1 X111.581 Y130.891 E.80887
G1 X112.458 Y130.89 E.02695
G1 X112.458 Y104.566 E.80886
G1 X113.336 Y104.566 E.02695
G1 X113.335 Y130.89 E.80885
G1 X114.213 Y130.889 E.02695
G1 X114.213 Y104.566 E.80883
; WIPE_START
G1 F24000
G1 X114.213 Y106.566 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.68 I1.108 J.504 P1  F30000
G1 X114.698 Y105.5 Z2.68
G1 Z2.28
G1 E.8 F1800
; FEATURE: Support
; LAYER_HEIGHT: 0.26
G1 F9000
G1 X116.463 Y105.5 E.06809
G1 X116.475 Y105.493 F30000
G1 F9000
G1 X116.645 Y105.832 E.01463
G3 X114.859 Y107.025 I-1.076 J.323 E.11043
G1 X114.682 Y107.121 E.00774
G1 X114.682 Y104.56 E.0988
G2 X115.082 Y104.453 I.147 J-.253 E.01774
G1 X115.082 Y103.81 E.02481
G3 X115.487 Y103.769 I.336 J1.278 E.01576
G3 X116.483 Y105.439 I-.157 J1.226 E.08638
; WIPE_START
G1 F24000
G1 X116.645 Y105.832 E-.16146
G1 X116.715 Y106.23 E-.15335
G1 X116.608 Y106.624 E-.1553
G1 X116.407 Y106.907 E-.13197
G1 X116.066 Y107.146 E-.15792
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.68 I.262 J-1.188 P1  F30000
G1 X108.318 Y105.439 Z2.68
G1 Z2.28
G1 E.8 F1800
G1 F9000
G1 X108.318 Y105.858 E.01616
G2 X107.976 Y105.847 I-.177 J.182 E.01448
G3 X107.656 Y103.741 I-.449 J-1.009 E.15662
G3 X107.918 Y103.785 I-.127 J1.575 E.01025
G1 X107.918 Y104.453 E.02578
G2 X108.318 Y104.56 I.253 J-.147 E.01774
G1 X108.318 Y105.379 E.03162
G1 X108.302 Y105.5 F30000
G1 F9000
G1 X106.665 Y105.5 E.06317
; WIPE_START
G1 F24000
G1 X108.302 Y105.5 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.68 I-.336 J1.17 P1  F30000
G1 X143.112 Y115.5 Z2.68
M73 P53 R9
G1 Z2.28
G1 E.8 F1800
G1 F9000
G1 X144.886 Y115.5 E.06842
G1 X144.871 Y115.489 F30000
G1 F9000
G1 X144.731 Y115.719 E.01039
G3 X144.07 Y113.772 I-.724 J-.84 E.16732
G3 X145.055 Y114.478 I-.071 J1.139 E.04929
G1 X145.318 Y114.413 E.01046
G1 X145.318 Y115.308 E.0345
G1 X145.055 Y115.243 E.01046
G1 X144.907 Y115.441 E.00953
; WIPE_START
G1 F24000
G1 X144.731 Y115.719 E-.12506
G1 X144.14 Y115.943 E-.24019
G1 X143.521 Y115.847 E-.23799
G1 X143.208 Y115.577 E-.15675
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.68 I1.216 J.044 P1  F30000
G1 X143.573 Y105.5 Z2.68
G1 Z2.28
G1 E.8 F1800
G1 F9000
G1 X145.302 Y105.5 E.06672
G1 X145.318 Y105.5 F30000
G1 F9000
G1 X145.318 Y105.808 E.01189
G2 X144.955 Y105.818 I-.176 J.202 E.01537
G3 X144.568 Y103.742 I-.517 J-.978 E.15982
G3 X144.918 Y103.813 I-.104 J1.4 E.01383
G1 X144.918 Y104.453 E.02469
G2 X145.318 Y104.56 I.253 J-.147 E.01774
G1 X145.318 Y105.44 E.03395
; WIPE_START
G1 F24000
G1 X145.318 Y105.808 E-.13992
G1 X145.15 Y105.711 E-.0736
G1 X144.955 Y105.818 E-.08448
G1 X144.463 Y105.929 E-.19183
G1 X143.975 Y105.829 E-.18936
G1 X143.804 Y105.703 E-.08081
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.68 I.041 J1.216 P1  F30000
G1 X151.682 Y105.44 Z2.68
G1 Z2.28
G1 E.8 F1800
G1 F9000
G1 X151.682 Y104.56 E.03395
G2 X152.082 Y104.453 I.147 J-.253 E.01774
G1 X152.082 Y103.898 E.02143
G3 X152.544 Y103.839 I.379 J1.134 E.01807
G3 X153.636 Y105.243 I-.082 J1.19 E.07743
G3 X151.859 Y106.486 I-1.058 J.38 E.11317
G1 X151.682 Y106.582 E.00776
G1 X151.682 Y105.5 E.04174
G1 X153.69 Y105.5 F30000
G1 F9000
G1 X151.698 Y105.5 E.07686
G1 X151.311 Y105.057 F30000
; FEATURE: Support interface
; LAYER_HEIGHT: 0.2
G1 F4800
G1 X151.311 Y104.566 E.01508
G1 X151.05 Y104.566 E.00804
G1 X151.05 Y130.973 E.81139
G1 X150.173 Y130.959 E.02695
G1 X150.173 Y104.566 E.81098
G1 X149.296 Y104.566 E.02695
G1 X149.296 Y130.946 E.81058
G1 X148.419 Y130.933 E.02695
G1 X148.419 Y104.566 E.81017
G1 X147.542 Y104.566 E.02695
G1 X147.542 Y130.92 E.80977
G1 X146.665 Y130.907 E.02695
G1 X146.665 Y104.566 E.80937
G1 X145.787 Y104.566 E.02695
G1 X145.787 Y130.894 E.80896
G1 X145.302 Y130.5 F30000
; FEATURE: Support
; LAYER_HEIGHT: 0.26
G1 F9000
G1 X143.457 Y130.5 E.07117
G1 X143.463 Y130.501 F30000
G1 F9000
G1 X143.545 Y130.169 E.01318
G3 X144.635 Y129.551 I.99 J.474 E.0515
G3 X145.16 Y129.71 I-.098 J1.26 E.02131
G1 X145.318 Y129.612 E.00718
G1 X145.318 Y130.893 E.0494
G2 X144.993 Y131.192 I-.018 J.307 E.01904
G1 X144.664 Y131.734 E.02444
G3 X143.437 Y130.627 I-.129 J-1.09 E.07216
G1 X143.451 Y130.56 E.00265
; WIPE_START
G1 F24000
G1 X143.545 Y130.169 E-.15264
G1 X143.783 Y129.838 E-.1552
G1 X144.209 Y129.599 E-.18565
G1 X144.635 Y129.551 E-.163
G1 X144.896 Y129.63 E-.10352
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.68 I-.154 J1.207 P1  F30000
G1 X151.698 Y130.5 Z2.68
G1 Z2.28
G1 E.8 F1800
G1 F9000
G1 X153.64 Y130.5 E.07494
G1 X153.646 Y130.504 F30000
G1 F9000
G1 X153.282 Y131.013 E.02414
G1 X151.682 Y130.989 E.06172
G1 X151.682 Y129.253 E.06694
G1 X151.872 Y129.346 E.00815
G3 X152.704 Y129.049 I.8 J.925 E.03489
G3 X153.684 Y130.461 I-.052 J1.082 E.07657
; WIPE_START
G1 F24000
G1 X153.282 Y131.013 E-.25959
G1 X151.965 Y130.993 E-.50041
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.68 I1.216 J.045 P1  F30000
G1 X152.352 Y120.5 Z2.68
G1 Z2.28
G1 E.8 F1800
G1 F9000
G1 X153.65 Y120.5 E.05007
G1 X153.649 Y120.501 F30000
G1 F9000
G1 X153.773 Y120.571 E.00549
G3 X153.142 Y122.452 I-.741 J.797 E.09621
G3 X151.945 Y121.752 I-.137 J-1.139 E.0574
G1 X151.682 Y121.817 E.01046
G1 X151.682 Y120.922 E.03451
G1 X151.945 Y120.987 E.01046
G3 X153.072 Y120.281 I1.056 J.433 E.05474
G3 X153.416 Y120.35 I-.04 J1.088 E.01363
G1 X153.599 Y120.469 E.00838
; CHANGE_LAYER
; Z_HEIGHT: 2.4
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F24000
G1 X153.773 Y120.571 E-.07681
G1 X154.015 Y120.906 E-.157
G1 X154.118 Y121.301 E-.1551
G1 X154.066 Y121.705 E-.15486
G1 X153.865 Y122.063 E-.156
G1 X153.742 Y122.163 E-.06023
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 20/58
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
G3 Z2.68 I1.172 J-.327 P1  F30000
G1 X148.5 Y103.376 Z2.68
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X146.102 Y103.376 E.07954
G1 X146.102 Y103.08 E.00981
G1 X150.898 Y103.08 E.15909
G1 X150.898 Y103.376 E.00981
G1 X148.56 Y103.376 E.07755
G1 X148.5 Y103.768 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X145.71 Y103.768 E.08573
G1 X145.71 Y102.688 E.03319
G1 X151.29 Y102.688 E.17146
G1 X151.29 Y103.768 E.03319
G1 X148.56 Y103.768 E.08389
M204 S10000
; WIPE_START
G1 F24000
G1 X146.56 Y103.768 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I.013 J-1.217 P1  F30000
G1 X109.102 Y103.376 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X109.102 Y103.08 E.00981
G1 X113.898 Y103.08 E.15909
G1 X113.898 Y103.376 E.00981
G1 X109.162 Y103.376 E.1571
G1 X108.71 Y103.768 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X108.71 Y102.688 E.03319
G1 X114.29 Y102.688 E.17146
G1 X114.29 Y103.768 E.03319
G1 X108.77 Y103.768 E.16961
M204 S10000
; WIPE_START
G1 F24000
G1 X108.71 Y102.688 E-.41103
G1 X109.628 Y102.688 E-.34897
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I-.721 J.98 P1  F30000
G1 X149.571 Y132.08 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X153.451 Y132.08 E.12871
G3 X155.698 Y135.346 I.01 J2.399 E.15477
G3 X104.522 Y135.86 I-25.691 J-9.984 E2.17622
G3 X104.141 Y134.548 I2.986 J-1.578 E.04565
G3 X106.545 Y132.08 I2.404 J-.063 E.1274
G1 X114.101 Y132.08 E.25066
G1 X114.269 Y132.476 E.01425
G2 X145.899 Y132.08 I15.729 J-7.116 E1.32679
G1 X149.511 Y132.08 E.11981
G1 X149.571 Y131.688 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X153.458 Y131.688 E.11946
G3 X156.063 Y135.488 I.003 J2.791 E.16653
G3 X104.16 Y136.013 I-26.056 J-10.126 E2.0444
G3 X103.749 Y134.558 I3.318 J-1.724 E.04678
G3 X106.54 Y131.688 I2.797 J-.072 E.13708
G1 X114.361 Y131.688 E.24032
G1 X114.418 Y131.822 E.00447
G2 X145.639 Y131.688 I15.583 J-6.466 E1.22528
G1 X149.511 Y131.688 E.11896
M204 S10000
; WIPE_START
G1 F24000
G1 X151.511 Y131.688 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I-.628 J-1.043 P1  F30000
G1 X143.758 Y136.355 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X144.712 Y135.036 I-12.531 J-10.063 E.05402
G1 X149.404 Y139.728 E.22009
G1 X148.976 Y139.728 E.01417
G1 X155.235 Y133.469 E.29362
G3 X155.37 Y135.227 I-2.093 J1.045 E.05998
G3 X154.516 Y137.164 I-18.276 J-6.895 E.07026
G1 X149.78 Y132.428 E.22219
G1 X148.6 Y132.428 E.03916
G1 X141.3 Y139.728 E.34243
G1 X141.728 Y139.728 E.01417
G1 X141.062 Y139.062 E.03124
G2 X142.279 Y137.981 I-13.264 J-16.175 E.054
G1 X134.946 Y142.679 F30000
G1 F15476.087
G2 X136.097 Y142.315 I-3.31 J-12.441 E.04007
G1 X136.491 Y142.167 E.01394
G1 X143.084 Y148.76 E.30927
G2 X147.586 Y145.586 I-13.299 J-23.653 E.18304
G1 X142.542 Y140.542 E.23666
G1 X140.486 Y140.542 E.06818
G1 X128.886 Y152.142 E.54421
M73 P53 R8
G2 X130.935 Y152.151 I1.222 J-45.938 E.068
G1 X131.114 Y152.142 E.00594
G1 X119.514 Y140.542 E.5442
G1 X117.458 Y140.542 E.06819
G1 X112.407 Y145.593 E.23697
G3 X108.693 Y141.631 I18.116 J-20.704 E.18044
G1 X109.782 Y140.542 E.0511
G1 X111.838 Y140.542 E.06819
G1 X122.345 Y151.049 E.49291
G1 X129.976 Y143.376 E.35895
G1 X137.655 Y151.049 E.3601
G1 X148.162 Y140.542 E.49291
G1 X150.218 Y140.542 E.06818
G1 X151.307 Y141.631 E.0511
G3 X150.281 Y142.895 I-35.065 J-27.396 E.05401
G1 X115.519 Y147.924 F30000
G1 F15476.087
G2 X116.916 Y148.759 I23.464 J-37.63 E.05401
G1 X123.509 Y142.167 E.30927
G2 X125.052 Y142.684 I6.019 J-15.39 E.05401
G1 X120.514 Y140.195 F30000
G1 F15476.087
G2 X139.575 Y140.135 I9.483 J-14.823 E.66815
G1 X152.852 Y140.135 E.44043
G3 X117.902 Y149.739 I-22.853 J-14.769 E1.31578
G1 X117.902 Y149.739 E0
G3 X114.837 Y147.956 I15.284 J-29.794 E.11769
G1 X114.837 Y147.956 E0
G3 X111.66 Y145.463 I23.523 J-33.254 E.134
G1 X111.66 Y145.463 E0
G3 X107.15 Y140.135 I18.24 J-20.01 E.23222
G1 X120.464 Y140.163 E.44164
G1 X117.725 Y137.978 F30000
G1 F15476.087
G2 X118.94 Y139.06 I10.144 J-10.167 E.05401
G1 X118.272 Y139.728 E.03132
G1 X118.7 Y139.728 E.01417
G1 X111.401 Y132.429 E.34238
G1 X110.218 Y132.43 E.03924
G1 X105.484 Y137.164 E.22211
G3 X104.535 Y134.912 I20.09 J-9.784 E.08111
G3 X104.759 Y133.463 I2.255 J-.394 E.04951
G1 X111.024 Y139.728 E.29389
G1 X110.596 Y139.728 E.01417
G1 X115.288 Y135.036 E.22009
G3 X114.457 Y133.637 I15.118 J-9.927 E.054
M106 S229.5
; CHANGE_LAYER
; Z_HEIGHT: 2.54
; LAYER_HEIGHT: 0.14
; WIPE_START
G1 F24000
G1 X115.288 Y135.036 E-.61843
G1 X115.025 Y135.299 E-.14157
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 21/58
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
G3 Z2.8 I.595 J-1.062 P1  F30000
G1 X106.462 Y130.5 Z2.8
G1 Z2.54
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.26
G1 F9000
G1 X116.259 Y130.5 E.378
G2 X114.815 Y129.929 I-.931 J.242 E.06975
G1 X114.509 Y129.726 E.01414
G1 X114.509 Y128 E.0666
G1 X108.491 Y128 E.23218
G1 X108.491 Y127.388 E.0236
G1 X108.171 Y127.188 E.01457
G3 X106.927 Y125.749 I-.599 J-.74 E.11299
G1 X106.934 Y125.5 E.0096
G1 X114.509 Y125.5 E.29224
G1 X114.509 Y123 E.09645
G1 X108.491 Y123 E.23218
G1 X108.491 Y120.5 E.09645
G1 X114.509 Y120.5 E.23218
G1 X114.509 Y118 E.09645
G1 X108.491 Y118 E.23218
G1 X108.491 Y116.443 E.06006
G1 X108.114 Y116.255 E.01626
G3 X106.429 Y115.5 I-.725 J-.639 E.09467
G1 X114.509 Y115.5 E.31172
M73 P54 R8
G1 X114.509 Y113 E.09645
G1 X108.491 Y113 E.23218
G1 X108.491 Y110.5 E.09645
G1 X114.509 Y110.5 E.23218
G1 X114.509 Y108 E.09645
G1 X108.491 Y108 E.23218
G1 X108.491 Y105.786 E.0854
G1 X108.202 Y105.583 E.01365
G3 X107.044 Y105.5 I-.516 J-.916 E.04744
G1 X116.31 Y105.5 E.35747
G1 X116.352 Y105.48 F30000
G1 F9000
G1 X116.507 Y105.846 E.01534
G3 X116.223 Y106.949 I-1.263 J.263 E.04548
G3 X114.839 Y107.077 I-.781 J-.892 E.05731
G1 X114.668 Y107.184 E.00779
G1 X114.668 Y116.999 E.3787
G1 X114.934 Y117.074 E.01067
G3 X115.003 Y118.101 I.999 J.449 E.22416
G1 X114.934 Y117.986 E.00515
G1 X114.668 Y118.061 E.01067
G1 X114.668 Y121.635 E.13791
G1 X114.934 Y121.71 E.01067
G3 X115.003 Y122.737 I.999 J.449 E.22416
G1 X114.934 Y122.622 E.00515
G1 X114.668 Y122.697 E.01067
G1 X114.668 Y129.641 E.26792
G1 X114.831 Y129.749 E.00755
G3 X115.312 Y131.774 I.526 J.945 E.154
G2 X114.82 Y130.896 I-4.91 J2.176 E.03891
G1 X106.661 Y130.893 E.31477
G3 X108.148 Y129.367 I.799 J-.709 E.12347
G1 X108.332 Y129.262 E.00818
G1 X108.332 Y127.476 E.06891
G1 X108.161 Y127.369 E.00778
G3 X106.77 Y125.685 I-.602 J-.92 E.12383
G2 X106.486 Y124.896 I-7.815 J2.359 E.03236
G3 X108.17 Y123.896 I1.127 J-.019 E.09154
G1 X108.332 Y123.788 E.00751
G1 X108.332 Y116.541 E.27957
G1 X108.131 Y116.441 E.00868
G3 X108.131 Y114.873 I-.772 J-.784 E.19946
G1 X108.332 Y114.773 E.00868
G1 X108.332 Y105.869 E.34351
G2 X107.948 Y105.837 I-.213 J.24 E.01593
G3 X107.771 Y103.732 I-.306 J-1.034 E.14765
G3 X107.917 Y103.749 I-.093 J1.447 E.0057
G1 X107.918 Y104.453 E.02718
G1 X108.025 Y104.56 E.00582
G1 X114.975 Y104.56 E.26817
G1 X115.082 Y104.453 E.00582
G1 X115.088 Y103.772 E.02627
G3 X116.297 Y105.365 I.221 J1.087 E.09608
G1 X116.326 Y105.426 E.0026
; WIPE_START
G1 F24000
G1 X116.507 Y105.846 E-.17388
G1 X116.575 Y106.237 E-.1507
G1 X116.47 Y106.623 E-.15208
G1 X116.223 Y106.949 E-.15515
G1 X115.935 Y107.124 E-.12819
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.94 I-1.212 J-.109 P1  F30000
G1 X114.961 Y118 Z2.94
G1 Z2.54
G1 E.8 F1800
G1 F9000
G1 X116.899 Y118 E.07477
; WIPE_START
G1 F24000
G1 X114.961 Y118 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.94 I-1.157 J.377 P1  F30000
G1 X116.59 Y123 Z2.94
G1 Z2.54
G1 E.8 F1800
G1 F9000
G1 X115.273 Y123 E.05083
; WIPE_START
G1 F24000
G1 X116.59 Y123 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.94 I-.326 J1.173 P1  F30000
G1 X143.602 Y130.5 Z2.94
G1 Z2.54
G1 E.8 F1800
G1 F9000
G1 X153.397 Y130.5 E.37789
G2 X151.854 Y129.561 I-.871 J-.305 E.09696
G1 X151.509 Y129.365 E.01532
G1 X151.509 Y128 E.05267
G1 X145.491 Y128 E.23218
G1 X145.491 Y125.5 E.09645
G1 X151.509 Y125.5 E.23218
G1 X151.509 Y123 E.09645
G1 X145.491 Y123 E.23218
G1 X145.491 Y120.5 E.09645
G1 X151.509 Y120.5 E.23218
G1 X151.509 Y118 E.09645
G1 X145.491 Y118 E.23218
G1 X145.491 Y115.5 E.09645
G1 X151.509 Y115.5 E.23218
G1 X151.509 Y113 E.09645
G1 X145.491 Y113 E.23218
G1 X145.491 Y110.5 E.09645
G1 X151.509 Y110.5 E.23218
G1 X151.509 Y108 E.09645
G1 X145.491 Y108 E.23218
G1 X145.491 Y105.739 E.08725
G1 X145.168 Y105.539 E.01466
G3 X143.972 Y105.51 I-.578 J-.852 E.04924
G1 X153.553 Y105.5 E.36962
G1 X153.56 Y105.498 F30000
G1 F9000
G1 X153.563 Y105.566 E.00261
G3 X151.84 Y106.52 I-1.099 J.049 E.09418
G1 X151.668 Y106.627 E.0078
G1 X151.668 Y120.839 E.54831
G1 X151.934 Y120.913 E.01067
G3 X152.003 Y121.94 I.999 J.449 E.22417
G1 X151.934 Y121.826 E.00515
G1 X151.668 Y121.9 E.01067
G1 X151.668 Y129.272 E.28443
G2 X152.068 Y129.253 I.189 J-.232 E.01695
G3 X153.237 Y131.012 I.49 J.942 E.11992
G1 X145.225 Y130.892 E.30914
G2 X144.638 Y131.738 I17.561 J12.817 E.03977
G3 X145.178 Y129.708 I.019 J-1.082 E.15138
G1 X145.332 Y129.6 E.00728
G1 X145.332 Y115.391 E.54818
G1 X145.066 Y115.317 E.01067
G3 X145.066 Y114.404 I-.997 J-.456 E.22944
G1 X145.332 Y114.33 E.01067
G1 X145.332 Y105.827 E.32804
G1 X145.16 Y105.72 E.00783
G3 X144.69 Y103.732 I-.595 J-.909 E.16076
G3 X144.918 Y103.767 I-.149 J1.744 E.00892
G1 X144.918 Y104.453 E.02648
G1 X145.025 Y104.56 E.00582
G1 X151.975 Y104.56 E.26817
G1 X152.082 Y104.453 E.00582
G1 X152.082 Y103.853 E.02317
G3 X153.499 Y105.24 I.246 J1.166 E.09037
G1 X153.546 Y105.44 E.00791
; WIPE_START
G1 F24000
G1 X153.563 Y105.566 E-.04829
G1 X153.544 Y105.896 E-.12555
G1 X153.408 Y106.201 E-.12692
G1 X153.178 Y106.451 E-.12894
G1 X152.877 Y106.621 E-.13139
G1 X152.534 Y106.693 E-.1333
G1 X152.362 Y106.677 E-.06562
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.94 I-.845 J-.876 P1  F30000
G1 X143.21 Y115.5 Z2.94
G1 Z2.54
G1 E.8 F1800
G1 F9000
G1 X144.927 Y115.5 E.06625
; WIPE_START
G1 F24000
G1 X143.21 Y115.5 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.94 I-.585 J1.067 P1  F30000
G1 X152.323 Y120.5 Z2.94
G1 Z2.54
G1 E.8 F1800
G1 F9000
G1 X153.54 Y120.5 E.04695
; CHANGE_LAYER
; Z_HEIGHT: 2.6
; LAYER_HEIGHT: 0.0599999
; WIPE_START
G1 F24000
G1 X152.323 Y120.5 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 22/58
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
G3 Z2.94 I1.188 J-.265 P1  F30000
G1 X148.5 Y103.376 Z2.94
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X146.102 Y103.376 E.07954
G1 X146.102 Y103.08 E.00981
G1 X150.898 Y103.08 E.15909
G1 X150.898 Y103.376 E.00981
G1 X148.56 Y103.376 E.07755
G1 X148.5 Y103.768 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X145.71 Y103.768 E.08573
G1 X145.71 Y102.688 E.03319
G1 X151.29 Y102.688 E.17146
G1 X151.29 Y103.768 E.03319
G1 X148.56 Y103.768 E.08389
M204 S10000
; WIPE_START
G1 F24000
G1 X146.56 Y103.768 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I.013 J-1.217 P1  F30000
G1 X109.102 Y103.376 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X109.102 Y103.08 E.00981
G1 X113.898 Y103.08 E.15909
G1 X113.898 Y103.376 E.00981
G1 X109.162 Y103.376 E.1571
G1 X108.71 Y103.768 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X108.71 Y102.688 E.03319
G1 X114.29 Y102.688 E.17146
G1 X114.29 Y103.768 E.03319
G1 X108.77 Y103.768 E.16961
M204 S10000
; WIPE_START
G1 F24000
G1 X108.71 Y102.688 E-.41103
G1 X109.628 Y102.688 E-.34897
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I-.719 J.982 P1  F30000
G1 X149.735 Y132.08 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X153.45 Y132.08 E.12322
G3 X155.698 Y135.346 I.007 J2.402 E.15469
G3 X104.541 Y135.906 I-25.691 J-9.982 E2.17459
G3 X104.178 Y134.903 I3.682 J-1.902 E.03549
G3 X106.545 Y132.08 I2.363 J-.423 E.13931
G1 X114.101 Y132.08 E.25066
G1 X114.268 Y132.474 E.0142
G2 X145.899 Y132.08 I15.729 J-7.119 E1.32671
G1 X149.675 Y132.08 E.12527
G1 X149.735 Y131.688 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X153.458 Y131.688 E.11439
G3 X156.063 Y135.488 I-.002 J2.794 E.16643
G3 X104.18 Y136.059 I-26.056 J-10.121 E2.04301
G3 X103.77 Y134.834 I3.742 J-1.932 E.03983
G3 X106.54 Y131.688 I2.777 J-.347 E.14555
G1 X114.361 Y131.688 E.24032
G1 X114.399 Y131.778 E.003
G2 X145.639 Y131.688 I15.602 J-6.417 E1.22693
G1 X149.675 Y131.688 E.12402
M204 S10000
; WIPE_START
G1 F24000
G1 X151.675 Y131.688 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I-.618 J-1.048 P1  F30000
G1 X143.758 Y136.355 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X144.712 Y135.036 I-12.435 J-9.99 E.05402
G1 X149.403 Y139.728 E.2201
G1 X148.976 Y139.728 E.01417
G1 X155.234 Y133.47 E.29354
G3 X155.37 Y135.227 I-2.022 J1.04 E.06002
G3 X154.516 Y137.164 I-18.136 J-6.834 E.07026
G1 X149.78 Y132.428 E.22218
G1 X148.6 Y132.428 E.03916
G1 X141.3 Y139.728 E.34243
G1 X141.728 Y139.728 E.01417
G1 X141.062 Y139.062 E.03123
G2 X142.279 Y137.982 I-13.458 J-16.393 E.054
G1 X140.204 Y139.723 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.385276
G1 F15000
G1 X140.14 Y139.76 E.00207
G1 X140.189 Y139.788 E.00159
G1 X126.583 Y152.546 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.40872
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X130.758 Y152.546 E.22318
G2 X134.665 Y152.155 I-1.05 J-30.248 E.21007
G1 X134.996 Y152.087 E.01804
G1 X124.993 Y152.087 E.53472
G3 X122.968 Y151.628 I3.641 J-20.773 E.11104
G1 X137.033 Y151.628 E.75186
G1 X138.579 Y151.17 E.08622
G1 X121.421 Y151.17 E.91718
G1 X120.149 Y150.711 E.07228
G1 X139.851 Y150.711 E1.0532
G1 X140.954 Y150.252 E.06387
G1 X119.066 Y150.252 E1.1701
G3 X118.066 Y149.794 I4.785 J-11.746 E.05882
G1 X141.919 Y149.794 E1.27511
G2 X142.828 Y149.335 I-4.82 J-10.675 E.05442
G1 X117.173 Y149.335 E1.37141
G3 X116.344 Y148.876 I4.238 J-8.643 E.05069
G1 X143.656 Y148.876 E1.46005
G1 X144.418 Y148.417 E.04755
G1 X115.582 Y148.417 E1.54153
G3 X114.88 Y147.959 I4.301 J-7.348 E.04484
G1 X145.12 Y147.959 E1.61657
G2 X145.795 Y147.5 I-4.315 J-7.067 E.04361
G1 X114.205 Y147.5 E1.68865
G1 X113.59 Y147.041 E.04104
G1 X146.41 Y147.041 E1.75447
G2 X147 Y146.583 I-3.84 J-5.543 E.03995
G1 X112.997 Y146.583 E1.81765
G1 X112.441 Y146.124 E.03854
G1 X147.549 Y146.124 E1.87674
G2 X148.088 Y145.665 I-4.948 J-6.361 E.03785
G1 X111.913 Y145.665 E1.93379
G1 X111.41 Y145.206 E.03641
G1 X148.591 Y145.206 E1.98757
G2 X149.067 Y144.748 I-4.494 J-5.143 E.03536
G1 X110.933 Y144.748 E2.03851
G1 X110.477 Y144.289 E.03458
G1 X149.523 Y144.289 E2.08729
G2 X149.958 Y143.83 I-4.435 J-4.64 E.0338
G1 X110.042 Y143.83 E2.13379
G1 X109.629 Y143.372 E.03301
G1 X150.644 Y143.372 E2.19255
M106 S229.5
G1 X153.052 Y140.16 F30000
M106 S255
G1 F3000
G1 X139.574 Y140.16 E.72048
G3 X138.824 Y140.619 I-4.242 J-6.094 E.04703
G1 X152.507 Y140.619 E.73141
G3 X152.194 Y141.078 I-4.621 J-2.816 E.0297
G1 X137.987 Y141.078 E.75943
G3 X137.004 Y141.537 I-5.025 J-9.485 E.05801
G1 X151.856 Y141.537 E.79391
G1 X151.518 Y141.995 E.03046
G1 X135.841 Y141.995 E.83803
G3 X134.321 Y142.454 I-8.409 J-25.116 E.08489
G1 X151.146 Y142.454 E.89941
G1 X150.772 Y142.913 E.03164
G1 X109.228 Y142.913 E2.2208
G1 X108.854 Y142.454 E.03164
G1 X125.679 Y142.454 E.89941
G1 X125.55 Y142.424 E.00708
G3 X124.16 Y141.995 I3.779 J-14.738 E.0778
G1 X108.482 Y141.995 E.83807
M73 P55 R8
G1 X108.144 Y141.537 E.03046
G1 X122.995 Y141.537 E.79386
G3 X122.013 Y141.078 I3.925 J-9.679 E.05795
G1 X107.806 Y141.078 E.75945
G3 X107.494 Y140.619 I4.144 J-3.155 E.02967
G1 X121.17 Y140.619 E.73105
G3 X120.421 Y140.16 I4.52 J-8.221 E.04697
G1 X106.95 Y140.16 E.72009
M106 S229.5
G1 X114.457 Y133.637 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G2 X115.288 Y135.036 I15.818 J-8.452 E.054
G1 X110.597 Y139.728 E.2201
G1 X111.024 Y139.728 E.01417
G1 X104.759 Y133.463 E.29389
G2 X104.535 Y134.91 I2.031 J1.055 E.04945
G2 X105.484 Y137.164 I21.037 J-7.528 E.08117
G1 X110.218 Y132.43 E.22211
G1 X111.401 Y132.429 E.03925
G1 X118.7 Y139.728 E.34238
G1 X118.272 Y139.728 E.01417
G1 X118.94 Y139.06 E.03131
G3 X117.725 Y137.977 I8.811 J-11.113 E.05401
G1 X119.842 Y139.72 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.389504
G1 F15000
G1 X119.777 Y139.758 E.00212
G1 X119.828 Y139.787 E.00165
M106 S252.45
; CHANGE_LAYER
; Z_HEIGHT: 2.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X119.777 Y139.758 E-.33249
G1 X119.842 Y139.72 E-.42751
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 23/58
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
G3 Z3 I.694 J-1 P1  F30000
G1 X106.555 Y130.5 Z3
G1 Z2.8
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.26
G1 F9000
G1 X116.115 Y130.5 E.36885
G2 X114.781 Y129.932 I-.904 J.272 E.06378
G1 X114.509 Y129.727 E.01314
G1 X114.509 Y128 E.06663
M73 P56 R8
G1 X108.491 Y128 E.23218
G1 X108.491 Y127.443 E.02149
G1 X108.206 Y127.239 E.01353
G3 X106.876 Y125.996 I-.511 J-.787 E.09608
G2 X107.092 Y125.5 I-.508 J-.517 E.02139
G1 X114.509 Y125.5 E.28614
G1 X114.509 Y123 E.09645
G1 X108.491 Y123 E.23218
G1 X108.491 Y120.5 E.09645
G1 X114.652 Y120.5 E.2377
; WIPE_START
G1 F24000
G1 X112.652 Y120.5 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I-.846 J.875 P1  F30000
G1 X115.238 Y123 Z3.2
G1 Z2.8
G1 E.8 F1800
G1 F9000
G1 X116.481 Y123 E.04794
; WIPE_START
G1 F24000
G1 X115.238 Y123 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I1.161 J.363 P1  F30000
G1 X116.803 Y118 Z3.2
G1 Z2.8
G1 E.8 F1800
G1 F9000
G1 X108.491 Y118 E.32067
G1 X108.491 Y116.499 E.05792
G1 X108.152 Y116.301 E.01515
G3 X106.554 Y115.5 I-.656 J-.686 E.0899
G1 X114.509 Y115.5 E.30691
G1 X114.509 Y113 E.09645
G1 X108.491 Y113 E.23218
G1 X108.491 Y110.5 E.09645
G1 X114.509 Y110.5 E.23218
G1 X114.509 Y108 E.09645
G1 X108.491 Y108 E.23218
G1 X108.491 Y105.775 E.08583
G1 X108.219 Y105.571 E.01315
G3 X107.239 Y105.5 I-.425 J-.929 E.03952
G1 X116.154 Y105.5 E.34396
G1 X116.189 Y105.486 F30000
G1 F9000
G1 X116.39 Y106.115 E.02548
G3 X116.229 Y106.793 I-1.361 J.034 E.02715
G3 X114.83 Y107.115 I-.901 J-.71 E.05986
G1 X114.668 Y107.223 E.0075
G1 X114.668 Y116.927 E.37438
G1 X114.912 Y117.012 E.00998
G3 X115.029 Y118.195 I.949 J.503 E.21182
G1 X114.912 Y118.048 E.00724
G1 X114.668 Y118.133 E.00998
G1 X114.668 Y121.563 E.13234
G1 X114.912 Y121.648 E.00998
G3 X115.029 Y122.83 I.949 J.503 E.21182
G1 X114.912 Y122.684 E.00724
G1 X114.668 Y122.769 E.00998
G1 X114.668 Y129.648 E.2654
G2 X115.081 Y129.693 I.244 J-.318 E.01687
G3 X115.317 Y131.771 I.172 J1.033 E.13119
G1 X114.858 Y131.076 E.03213
G1 X106.724 Y130.893 E.3139
G3 X108.157 Y129.408 I.821 J-.641 E.11502
G1 X108.332 Y129.301 E.0079
G1 X108.332 Y127.525 E.06855
G2 X107.957 Y127.487 I-.213 J.232 E.01561
G3 X106.927 Y125.696 I-.302 J-1.018 E.10955
G2 X106.663 Y125.085 I-1.294 J.196 E.02598
G3 X108.179 Y123.869 I1.061 J-.231 E.09289
G1 X108.332 Y123.76 E.00724
G1 X108.332 Y116.59 E.27662
G2 X107.937 Y116.602 I-.191 J.228 E.01667
G3 X108.151 Y114.829 I-.482 J-.957 E.17844
G1 X108.332 Y114.724 E.00809
G1 X108.332 Y105.855 E.34218
G2 X107.92 Y105.81 I-.243 J.315 E.01682
G3 X107.883 Y103.723 I-.163 J-1.041 E.13891
G1 X107.918 Y104.453 E.02822
G1 X108.025 Y104.56 E.00582
G1 X114.975 Y104.56 E.26817
G1 X115.082 Y104.453 E.00582
G1 X115.082 Y103.749 E.02715
G3 X116.14 Y105.364 I.121 J1.075 E.092
G1 X116.167 Y105.431 E.00277
; WIPE_START
G1 F24000
G1 X116.39 Y106.115 E-.27368
G1 X116.384 Y106.501 E-.14646
G1 X116.229 Y106.793 E-.12564
G1 X115.928 Y107.063 E-.15369
G1 X115.781 Y107.125 E-.06054
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I-.781 J.934 P1  F30000
G1 X143.745 Y130.5 Z3.2
G1 Z2.8
G1 E.8 F1800
G1 F9000
G1 X153.309 Y130.49 E.36901
G2 X151.837 Y129.599 I-.868 J-.227 E.08885
G1 X151.509 Y129.4 E.0148
G1 X151.509 Y128 E.05402
G1 X145.491 Y128 E.23218
G1 X145.491 Y125.5 E.09645
G1 X151.509 Y125.5 E.23218
G1 X151.509 Y123 E.09645
G1 X145.491 Y123 E.23218
G1 X145.491 Y120.5 E.09645
G1 X151.509 Y120.5 E.23218
G1 X151.509 Y118 E.09645
G1 X145.491 Y118 E.23218
G1 X145.491 Y115.5 E.09645
G1 X151.509 Y115.5 E.23218
G1 X151.509 Y113 E.09645
G1 X145.491 Y113 E.23218
G1 X145.491 Y110.5 E.09645
G1 X151.509 Y110.5 E.23218
G1 X151.509 Y108 E.09645
G1 X145.491 Y108 E.23218
G1 X145.491 Y105.745 E.08702
G1 X145.202 Y105.541 E.01364
G3 X144.163 Y105.5 I-.485 J-.915 E.04204
G1 X153.416 Y105.5 E.35701
G1 X153.431 Y105.5 F30000
G1 F9000
G1 X153.408 Y105.814 E.01212
G3 X151.83 Y106.54 I-1.049 J-.202 E.07823
G1 X151.668 Y106.648 E.00753
G1 X151.668 Y120.766 E.54469
G1 X151.912 Y120.852 E.00998
G3 X152.029 Y122.034 I.949 J.503 E.21182
G1 X151.912 Y121.887 E.00724
G1 X151.668 Y121.972 E.00998
G1 X151.668 Y129.311 E.28313
G2 X152.053 Y129.313 I.194 J-.219 E.01623
G3 X153.187 Y131.011 I.417 J.949 E.1117
G1 X145.225 Y130.892 E.3072
G2 X144.676 Y131.736 I1.683 J1.696 E.03915
G3 X145.187 Y129.72 I.09 J-1.05 E.14092
G1 X145.332 Y129.611 E.00701
G1 X145.332 Y115.463 E.54584
G1 X145.088 Y115.378 E.00998
G3 X145.088 Y114.343 I-.945 J-.518 E.21948
G1 X145.332 Y114.258 E.00998
G1 X145.332 Y105.827 E.32526
G2 X144.915 Y105.798 I-.231 J.307 E.01707
G3 X144.809 Y103.723 I-.234 J-1.029 E.1419
G3 X144.918 Y103.734 I-.038 J.902 E.00424
G1 X144.918 Y104.453 E.02775
G1 X145.025 Y104.56 E.00582
G1 X151.975 Y104.56 E.26817
G1 X152.082 Y104.453 E.00582
G1 X152.087 Y103.82 E.02443
G3 X153.326 Y105.158 I.136 J1.117 E.08199
G3 X153.415 Y105.447 I-.968 J.454 E.0117
; WIPE_START
G1 F24000
G1 X153.408 Y105.814 E-.13955
G1 X153.308 Y106.122 E-.12317
G1 X153.1 Y106.38 E-.12579
G1 X152.818 Y106.564 E-.1282
G1 X152.487 Y106.655 E-.13025
G1 X152.194 Y106.604 E-.11304
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I-.861 J-.86 P1  F30000
G1 X143.31 Y115.5 Z3.2
G1 Z2.8
G1 E.8 F1800
G1 F9000
G1 X144.971 Y115.5 E.06408
; WIPE_START
G1 F24000
G1 X143.31 Y115.5 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I-.592 J1.063 P1  F30000
G1 X152.292 Y120.5 Z3.2
G1 Z2.8
G1 E.8 F1800
G1 F9000
G1 X153.427 Y120.5 E.0438
; WIPE_START
G1 F24000
G1 X152.292 Y120.5 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I1.188 J-.263 P1  F30000
G1 X148.5 Y103.376 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X146.102 Y103.376 E.07954
G1 X146.102 Y103.08 E.00981
G1 X150.898 Y103.08 E.15909
G1 X150.898 Y103.376 E.00981
G1 X148.56 Y103.376 E.07755
G1 X148.5 Y103.768 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X145.71 Y103.768 E.08573
G1 X145.71 Y102.688 E.03319
G1 X151.29 Y102.688 E.17146
G1 X151.29 Y103.768 E.03319
G1 X148.56 Y103.768 E.08389
M204 S10000
; WIPE_START
G1 F24000
G1 X146.56 Y103.768 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I.013 J-1.217 P1  F30000
G1 X109.102 Y103.376 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X109.102 Y103.08 E.00981
G1 X113.898 Y103.08 E.15909
G1 X113.898 Y103.376 E.00981
G1 X109.162 Y103.376 E.1571
G1 X108.71 Y103.768 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X108.71 Y102.688 E.03319
G1 X114.29 Y102.688 E.17146
G1 X114.29 Y103.768 E.03319
G1 X108.77 Y103.768 E.16961
M204 S10000
; WIPE_START
G1 F24000
G1 X108.71 Y102.688 E-.41103
G1 X109.628 Y102.688 E-.34897
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I-.717 J.983 P1  F30000
G1 X149.908 Y132.08 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X153.455 Y132.08 E.11767
G3 X155.698 Y135.346 I.006 J2.399 E.15461
G3 X104.889 Y136.74 I-25.698 J-10.001 E2.14451
G3 X104.232 Y135.136 I36.45 J-15.88 E.0575
G3 X106.545 Y132.08 I2.307 J-.658 E.14729
G1 X114.101 Y132.08 E.25066
G1 X114.267 Y132.473 E.01416
G2 X145.899 Y132.08 I15.73 J-7.119 E1.3267
G1 X149.848 Y132.08 E.13099
G1 X149.908 Y131.688 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X153.46 Y131.688 E.10915
G3 X156.063 Y135.488 I.001 J2.791 E.16648
G3 X104.531 Y136.9 I-26.063 J-10.144 E2.01478
G3 X103.854 Y135.242 I33.636 J-14.704 E.05502
G3 X106.54 Y131.688 I2.684 J-.763 E.1585
G1 X114.361 Y131.688 E.24032
G1 X114.381 Y131.734 E.00155
G2 X145.639 Y131.688 I15.62 J-6.373 E1.22842
G1 X149.848 Y131.688 E.12932
M204 S10000
; WIPE_START
G1 F24000
G1 X151.848 Y131.688 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I-.608 J-1.054 P1  F30000
G1 X143.758 Y136.355 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X144.712 Y135.036 I-12.319 J-9.907 E.05402
G1 X149.403 Y139.728 E.22011
G1 X148.976 Y139.728 E.01417
G1 X155.238 Y133.466 E.29376
G3 X155.37 Y135.227 I-2.118 J1.044 E.06005
G3 X154.516 Y137.164 I-18 J-6.775 E.07026
G1 X149.78 Y132.428 E.22218
G1 X148.6 Y132.428 E.03916
G1 X141.3 Y139.728 E.34243
G1 X141.728 Y139.728 E.01417
G1 X141.062 Y139.062 E.03123
G2 X142.279 Y137.982 I-13.658 J-16.618 E.054
G1 X147.088 Y146.778 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42208
G1 F15000
G2 X149.786 Y144.076 I-434.131 J-436.128 E.11798
G2 X152.201 Y141.13 I-21.868 J-20.383 E.11777
G1 X145.755 Y147.575 E.28163
G1 X144.623 Y148.337 E.04216
G1 X144.206 Y148.588 E.01503
G1 X152.674 Y140.12 E.37001
G1 X152.138 Y140.12 E.01657
G1 X142.944 Y149.313 E.40172
G3 X141.853 Y149.868 I-6.603 J-11.632 E.03784
G1 X151.602 Y140.12 E.42597
G1 X151.066 Y140.12 E.01657
G1 X140.85 Y150.335 E.44636
G1 X139.932 Y150.717 E.03073
M73 P57 R8
G1 X150.53 Y140.12 E.46305
G1 X149.993 Y140.12 E.01657
G1 X139.087 Y151.026 E.47655
G3 X138.276 Y151.301 I-3.194 J-8.088 E.02648
G1 X149.457 Y140.12 E.48857
G1 X148.921 Y140.12 E.01657
G1 X137.505 Y151.536 E.49883
G3 X136.773 Y151.731 I-2.353 J-7.343 E.0234
G1 X148.385 Y140.12 E.50737
G1 X147.848 Y140.12 E.01657
G1 X136.06 Y151.908 E.51511
G1 X135.386 Y152.046 E.02124
G1 X147.312 Y140.12 E.52111
G1 X146.776 Y140.12 E.01657
G1 X134.713 Y152.183 E.52711
G3 X134.08 Y152.279 I-1.22 J-5.885 E.01978
G1 X146.24 Y140.12 E.53132
G1 X145.704 Y140.12 E.01657
G1 X133.45 Y152.373 E.53542
G3 X132.849 Y152.438 I-.955 J-6.058 E.01868
G1 X145.167 Y140.12 E.53824
G1 X144.631 Y140.12 E.01657
G1 X132.254 Y152.497 E.54081
G3 X131.678 Y152.537 I-.699 J-5.826 E.01787
G1 X144.095 Y140.12 E.54258
G1 X143.559 Y140.12 E.01657
G1 X131.114 Y152.565 E.54379
G3 X130.555 Y152.587 I-.5 J-5.646 E.01726
G1 X143.023 Y140.12 E.54474
G1 X142.486 Y140.12 E.01657
G1 X130.019 Y152.587 E.54474
G1 X129.483 Y152.587 E.01657
G1 X141.95 Y140.12 E.54474
G1 X141.414 Y140.12 E.01657
G1 X128.965 Y152.569 E.54396
G1 X128.454 Y152.544 E.01581
G1 X140.878 Y140.12 E.54286
G1 X140.342 Y140.12 E.01657
G1 X127.945 Y152.516 E.54167
G1 X127.457 Y152.468 E.01515
G1 X140.164 Y139.76 E.55525
G1 X140.155 Y139.729 E.00101
G3 X138.795 Y140.594 I-12.075 J-17.489 E.04981
G1 X126.969 Y152.42 E.51673
G3 X126.488 Y152.364 I.325 J-4.899 E.01495
G1 X137.642 Y141.21 E.48736
G1 X136.675 Y141.642 E.03273
G1 X126.022 Y152.295 E.46548
G1 X125.555 Y152.225 E.01458
G1 X135.824 Y141.956 E.44869
G3 X135.029 Y142.215 I-2.332 J-5.819 E.02584
G1 X125.098 Y152.146 E.43392
G1 X124.651 Y152.056 E.01408
G1 X134.282 Y142.426 E.4208
G3 X133.584 Y142.588 I-2.123 J-7.562 E.02215
G1 X124.204 Y151.967 E.40982
G3 X123.768 Y151.867 I.793 J-4.476 E.01384
G1 X132.923 Y142.712 E.40003
G1 X132.297 Y142.802 E.01953
G1 X123.339 Y151.76 E.39141
G1 X122.911 Y151.652 E.01365
G1 X131.691 Y142.872 E.38365
G3 X131.106 Y142.921 I-.819 J-6.21 E.01816
G1 X122.492 Y151.535 E.37638
G1 X122.081 Y151.41 E.01327
G1 X130.544 Y142.946 E.36982
G3 X130.001 Y142.954 I-.359 J-6.13 E.01681
G1 X121.67 Y151.284 E.36401
G3 X121.265 Y151.153 I1.134 J-4.165 E.01315
G1 X129.471 Y142.947 E.35856
G1 X128.958 Y142.924 E.01588
G1 X120.871 Y151.011 E.35336
G1 X120.476 Y150.869 E.01295
G1 X128.461 Y142.884 E.34889
G1 X127.971 Y142.838 E.0152
G1 X120.085 Y150.724 E.34458
G1 X119.706 Y150.567 E.01267
G1 X127.498 Y142.775 E.34046
G3 X127.034 Y142.703 I.556 J-5.16 E.01453
G1 X119.328 Y150.409 E.3367
G1 X118.949 Y150.252 E.01267
G1 X126.582 Y142.619 E.33351
G3 X126.139 Y142.525 I.773 J-4.76 E.01399
G1 X118.584 Y150.08 E.3301
G1 X118.221 Y149.907 E.01243
G1 X125.705 Y142.423 E.32703
G3 X125.284 Y142.308 I.834 J-3.875 E.01349
G1 X117.857 Y149.735 E.32452
G3 X117.503 Y149.553 I1.662 J-3.69 E.01232
G1 X124.87 Y142.185 E.32194
G3 X124.459 Y142.061 I1.083 J-4.335 E.0133
G1 X117.154 Y149.366 E.31918
G1 X116.805 Y149.179 E.01223
G1 X124.061 Y141.923 E.31705
G3 X123.67 Y141.777 I1.67 J-5.079 E.01288
G1 X116.459 Y148.988 E.3151
G1 X116.124 Y148.787 E.01207
G1 X123.285 Y141.626 E.3129
G3 X122.915 Y141.46 I1.416 J-3.665 E.01255
G1 X115.79 Y148.585 E.31133
G1 X115.455 Y148.384 E.01207
G1 X122.546 Y141.293 E.30984
G3 X122.179 Y141.123 I1.44 J-3.595 E.01249
G1 X115.131 Y148.171 E.30797
G1 X114.81 Y147.956 E.01194
G1 X121.826 Y140.94 E.30656
G3 X121.476 Y140.754 I1.896 J-3.983 E.01225
G1 X114.489 Y147.741 E.30529
G3 X114.173 Y147.521 I2.066 J-3.321 E.01191
G1 X121.136 Y140.558 E.30427
G3 X120.798 Y140.359 I1.96 J-3.72 E.01211
G1 X113.865 Y147.292 E.30294
G1 X113.558 Y147.063 E.01184
G1 X120.472 Y140.15 E.30208
G3 X120.146 Y139.939 I1.648 J-2.912 E.01199
G1 X113.251 Y146.834 E.30126
G3 X112.954 Y146.594 I2.278 J-3.124 E.01179
G1 X119.429 Y140.12 E.28292
G1 X118.893 Y140.12 E.01657
G1 X112.661 Y146.352 E.27232
G1 X112.367 Y146.11 E.01177
G1 X118.357 Y140.12 E.26173
G1 X117.821 Y140.12 E.01657
G1 X112.077 Y145.864 E.25098
G1 X111.796 Y145.608 E.01173
G1 X117.284 Y140.12 E.23981
G1 X116.748 Y140.12 E.01657
G1 X111.516 Y145.352 E.22863
G1 X111.235 Y145.096 E.01173
G1 X116.212 Y140.12 E.21746
G1 X115.676 Y140.12 E.01657
G1 X110.964 Y144.831 E.20586
G1 X110.697 Y144.562 E.01171
G1 X115.139 Y140.12 E.19411
G1 X114.603 Y140.12 E.01657
G1 X110.43 Y144.293 E.18236
G3 X110.165 Y144.022 I2.621 J-2.82 E.01172
G1 X114.067 Y140.12 E.1705
G1 X113.531 Y140.12 E.01657
G1 X109.911 Y143.74 E.15817
G1 X109.657 Y143.457 E.01173
G1 X112.995 Y140.12 E.14584
G1 X112.458 Y140.12 E.01657
G1 X109.403 Y143.175 E.13351
G3 X109.158 Y142.884 I2.826 J-2.632 E.01176
G1 X111.922 Y140.12 E.1208
G1 X111.386 Y140.12 E.01657
G1 X108.917 Y142.589 E.10789
G1 X108.676 Y142.293 E.01178
G1 X110.85 Y140.12 E.09498
G1 X110.314 Y140.12 E.01657
G1 X108.437 Y141.996 E.08199
G1 X108.21 Y141.687 E.01185
G1 X109.777 Y140.12 E.0685
G1 X109.241 Y140.12 E.01657
G1 X107.982 Y141.378 E.055
G1 X107.755 Y141.069 E.01185
G1 X108.705 Y140.12 E.0415
G1 X108.169 Y140.12 E.01657
G1 X107.535 Y140.753 E.02768
G1 X107.32 Y140.432 E.01194
G1 X107.802 Y139.95 E.02108
G1 X114.457 Y133.637 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X115.288 Y135.036 I15.688 J-8.377 E.054
G1 X110.597 Y139.728 E.22011
G1 X111.024 Y139.728 E.01417
G1 X104.76 Y133.464 E.29386
G2 X104.522 Y134.847 I1.866 J1.032 E.04744
G2 X105.484 Y137.164 I20.381 J-7.098 E.08328
G1 X110.218 Y132.43 E.2221
G1 X111.401 Y132.429 E.03925
G1 X118.7 Y139.728 E.34238
G1 X118.272 Y139.728 E.01417
G1 X118.94 Y139.06 E.03131
G3 X117.725 Y137.977 I8.702 J-10.985 E.05401
M106 S242.25
; CHANGE_LAYER
; Z_HEIGHT: 3
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X118.94 Y139.06 E-.61838
G1 X118.676 Y139.324 E-.14162
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 24/58
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
G3 Z3.2 I1.169 J-.339 P1  F30000
G1 X116.118 Y130.5 Z3.2
G1 Z3
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
G1 X115.055 Y130.5 E.03266
G1 X114.661 Y130.5 F30000
G1 F9000
G1 X114.661 Y131.022 E.01603
G1 X108.339 Y130.933 E.1943
G1 X108.339 Y104.566 E.81018
G1 X114.661 Y104.566 E.19429
G1 X114.661 Y130.44 E.79502
G1 X114.213 Y130.997 F30000
G1 F9000
G1 X114.213 Y104.755 E.80633
G1 X113.336 Y104.755 E.02695
G1 X113.335 Y130.815 E.80074
G1 X112.458 Y130.802 E.02695
G1 X112.458 Y104.755 E.80036
G1 X111.581 Y104.755 E.02695
G1 X111.581 Y130.79 E.79999
G1 X110.704 Y130.778 E.02695
G1 X110.704 Y104.755 E.79961
G1 X109.827 Y104.755 E.02695
G1 X109.827 Y130.766 E.79923
G1 X108.95 Y130.753 E.02695
G1 X108.95 Y104.585 E.80407
; WIPE_START
G1 F24000
G1 X108.95 Y106.585 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I1.077 J-.567 P1  F30000
G1 X107.918 Y104.624 Z3.4
G1 Z3
G1 E.8 F1800
G1 F9000
G1 X107.961 Y105.761 E.03497
G3 X107.911 Y103.714 I-.095 J-1.022 E.1034
G1 X107.911 Y104.456 E.0228
G1 X107.916 Y104.564 E.00333
G1 X107.945 Y105.5 F30000
G1 F9000
G1 X107.198 Y105.5 E.02296
; WIPE_START
G1 F24000
G1 X107.945 Y105.5 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I0 J1.217 P1  F30000
G1 X115.039 Y105.5 Z3.4
G1 Z3
G1 E.8 F1800
G1 F9000
G1 X115.039 Y104.506 E.03054
G1 X115.089 Y103.737 E.02367
G1 X115.141 Y103.74 E.00163
G3 X115.985 Y105.349 I-.038 J1.045 E.06766
G3 X116.291 Y106.316 I-2.437 J1.305 E.03134
G3 X115.039 Y107.201 I-1.066 J-.179 E.0524
G1 X115.039 Y105.56 E.05043
G1 X115.055 Y105.5 F30000
G1 F9000
G1 X115.998 Y105.5 E.02899
; WIPE_START
G1 F24000
G1 X115.055 Y105.5 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.217 J.006 P1  F30000
G1 X115.176 Y129.736 Z3.4
G1 Z3
G1 E.8 F1800
G1 F9000
G3 X115.321 Y131.755 I-.03 J1.017 E.09184
G1 X115.039 Y131.269 E.01728
G1 X115.041 Y129.738 E.04704
G3 X115.116 Y129.735 I.078 J1.114 E.00231
; WIPE_START
G1 F24000
G1 X115.503 Y129.804 E-.14932
G1 X115.838 Y130.007 E-.14885
G1 X116.068 Y130.313 E-.14568
G1 X116.162 Y130.681 E-.14436
G1 X116.109 Y131.061 E-.14566
G1 X116.076 Y131.122 E-.02612
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I1.21 J-.129 P1  F30000
G1 X115.208 Y123 Z3.4
G1 Z3
G1 E.8 F1800
G1 F9000
M73 P58 R8
G1 X116.363 Y123 E.03551
G1 X116.366 Y123.003 F30000
G1 F9000
G1 X116.298 Y123.065 E.00283
G3 X115.918 Y123.179 I-.478 J-.9 E.01225
G3 X115.039 Y122.885 I-.133 J-1.067 E.02947
G1 X115.039 Y121.446 E.04422
G3 X115.852 Y121.147 I.753 J.79 E.0274
G3 X116.602 Y122.818 I-.032 J1.018 E.06996
G1 X116.413 Y122.966 E.00739
; WIPE_START
G1 F24000
G1 X116.298 Y123.065 E-.05772
G1 X115.918 Y123.179 E-.15059
G1 X115.459 Y123.137 E-.17541
G1 X115.039 Y122.885 E-.18605
G1 X115.039 Y122.385 E-.19023
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I1.138 J.432 P1  F30000
G1 X116.702 Y118 Z3.4
G1 Z3
G1 E.8 F1800
G1 F9000
G1 X115.055 Y118 E.05061
G1 X115.039 Y118 F30000
G1 F9000
G1 X115.039 Y116.811 E.03655
G3 X115.852 Y116.511 I.753 J.79 E.0274
G3 X115.918 Y118.543 I-.032 J1.018 E.09434
G3 X115.039 Y118.249 I-.133 J-1.067 E.02947
G1 X115.039 Y118.06 E.00582
; WIPE_START
G1 F24000
G1 X115.039 Y116.811 E-.4748
G1 X115.396 Y116.581 E-.16149
G1 X115.718 Y116.531 E-.12371
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.012 J-1.217 P1  F30000
G1 X107.961 Y116.608 Z3.4
G1 Z3
G1 E.8 F1800
G1 F9000
G3 X107.64 Y114.638 I-.421 J-.943 E.11603
G3 X107.961 Y114.706 I-.075 J1.143 E.01015
G1 X107.961 Y116.548 E.05658
G1 X107.945 Y115.5 F30000
G1 F9000
G1 X106.535 Y115.5 E.04331
; WIPE_START
G1 F24000
G1 X107.945 Y115.5 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.217 J-.021 P1  F30000
G1 X107.803 Y123.822 Z3.4
G1 Z3
G1 E.8 F1800
G1 F9000
G1 X107.919 Y123.804 E.00359
G1 X107.961 Y127.5 E.11357
G3 X107.085 Y125.704 I-.199 J-1.015 E.08325
G2 X106.793 Y125.015 I-2.104 J.485 E.02314
G3 X107.45 Y123.869 I1.031 J-.17 E.04393
G1 X107.744 Y123.83 E.00911
G1 X107.945 Y125.5 F30000
G1 F9000
G1 X107.065 Y125.5 E.02703
; WIPE_START
G1 F24000
G1 X107.945 Y125.5 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.215 J-.076 P1  F30000
G1 X107.705 Y129.318 Z3.4
G1 Z3
G1 E.8 F1800
G1 F9000
G3 X107.961 Y129.37 I-.162 J1.438 E.00805
G1 X107.961 Y130.928 E.04787
G1 X106.805 Y130.912 E.03553
G3 X107.647 Y129.314 I.811 J-.593 E.06894
G1 X107.945 Y130.5 F30000
G1 F9000
G1 X106.65 Y130.5 E.03979
; WIPE_START
G1 F24000
G1 X107.945 Y130.5 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I0 J1.217 P1  F30000
G1 X143.889 Y130.5 Z3.4
G1 Z3
G1 E.8 F1800
G1 F9000
G1 X144.945 Y130.5 E.03246
G1 X144.961 Y130.5 F30000
G1 F9000
G1 X144.961 Y131.233 E.02253
G1 X144.666 Y131.716 E.01741
G3 X144.961 Y129.705 I.201 J-.998 E.09498
G1 X144.961 Y130.44 E.02259
; WIPE_START
G1 F24000
G1 X144.961 Y131.233 E-.30138
G1 X144.666 Y131.716 E-.21529
G1 X144.355 Y131.584 E-.12825
G1 X144.131 Y131.381 E-.11508
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.142 J1.209 P1  F30000
G1 X152.039 Y130.449 Z3.4
G1 Z3
G1 E.8 F1800
G1 F9000
G1 X152.041 Y129.377 E.03294
G3 X152.434 Y129.321 I.366 J1.155 E.01225
G3 X153.136 Y131.004 I-.047 J1.008 E.06998
G1 X152.039 Y130.987 E.03374
G1 X152.039 Y130.509 E.01469
G1 X153.358 Y130.5 F30000
G1 F9000
G1 X152.055 Y130.5 E.04004
G1 X151.661 Y130.5 F30000
G1 F9000
G1 X151.661 Y130.982 E.0148
G1 X145.339 Y130.887 E.19431
G1 X145.339 Y104.566 E.80875
G1 X151.661 Y104.566 E.19429
G1 X151.661 Y130.44 E.79502
G1 X151.05 Y130.954 F30000
G1 F9000
G1 X151.05 Y104.755 E.80502
G1 X150.173 Y104.755 E.02695
G1 X150.173 Y130.771 E.7994
G1 X149.296 Y130.758 E.02695
G1 X149.296 Y104.755 E.79899
G1 X148.419 Y104.755 E.02695
G1 X148.419 Y130.745 E.79859
G1 X147.542 Y130.731 E.02695
G1 X147.542 Y104.755 E.79818
G1 X146.665 Y104.755 E.02695
G1 X146.665 Y130.718 E.79778
G1 X145.787 Y130.705 E.02695
G1 X145.787 Y104.585 E.80259
G1 X144.933 Y104.606 F30000
G1 F9000
G1 X144.961 Y105.754 E.03529
G3 X144.911 Y103.715 I-.163 J-1.016 E.1079
G1 X144.932 Y104.546 E.02555
G1 X144.945 Y105.5 F30000
G1 F9000
G1 X144.128 Y105.5 E.02511
; WIPE_START
G1 F24000
G1 X144.945 Y105.5 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I0 J1.217 P1  F30000
G1 X152.039 Y105.5 Z3.4
G1 Z3
G1 E.8 F1800
G1 F9000
G1 X152.039 Y104.506 E.03054
G1 X152.089 Y103.803 E.02165
G1 X152.175 Y103.806 E.00267
G3 X153.202 Y105.18 I-.096 J1.142 E.05956
G3 X152.039 Y106.612 I-.935 J.429 E.0703
G1 X152.039 Y105.56 E.03233
G1 X152.055 Y105.5 F30000
G1 F9000
G1 X153.28 Y105.5 E.03764
; WIPE_START
G1 F24000
G1 X152.055 Y105.5 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.941 J-.772 P1  F30000
G1 X144.961 Y114.141 Z3.4
G1 Z3
G1 E.8 F1800
G1 F9000
G1 X144.961 Y115.58 E.04422
G3 X144.281 Y113.841 I-.756 J-.707 E.12824
G3 X144.917 Y114.101 I-.075 J1.093 E.02148
G1 X144.945 Y115.5 F30000
G1 F9000
G1 X143.414 Y115.5 E.04704
; WIPE_START
G1 F24000
G1 X144.945 Y115.5 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.715 J.985 P1  F30000
G1 X152.039 Y120.65 Z3.4
G1 Z3
G1 E.8 F1800
G1 F9000
G3 X152.852 Y120.35 I.753 J.79 E.0274
G3 X152.918 Y122.383 I-.032 J1.018 E.09434
G3 X152.039 Y122.089 I-.133 J-1.067 E.02946
G1 X152.039 Y120.71 E.04237
; WIPE_START
G1 F24000
G1 X152.396 Y120.42 E-.17483
G1 X152.852 Y120.35 E-.17531
G1 X153.175 Y120.42 E-.12562
G1 X153.509 Y120.627 E-.14904
G1 X153.722 Y120.912 E-.13521
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I1.166 J-.347 P1  F30000
G1 X148.5 Y103.376 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X146.102 Y103.376 E.07954
G1 X146.102 Y103.08 E.00981
G1 X150.898 Y103.08 E.15909
G1 X150.898 Y103.376 E.00981
G1 X148.56 Y103.376 E.07755
G1 X148.5 Y103.768 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X145.71 Y103.768 E.08573
G1 X145.71 Y102.688 E.03319
G1 X151.29 Y102.688 E.17146
G1 X151.29 Y103.768 E.03319
G1 X148.56 Y103.768 E.08389
M204 S10000
; WIPE_START
G1 F24000
G1 X146.56 Y103.768 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.013 J-1.217 P1  F30000
G1 X109.102 Y103.376 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X109.102 Y103.08 E.00981
G1 X113.898 Y103.08 E.15909
G1 X113.898 Y103.376 E.00981
G1 X109.162 Y103.376 E.1571
G1 X108.71 Y103.768 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X108.71 Y102.688 E.03319
G1 X114.29 Y102.688 E.17146
G1 X114.29 Y103.768 E.03319
G1 X108.77 Y103.768 E.16961
M204 S10000
; WIPE_START
G1 F24000
G1 X108.71 Y102.688 E-.41103
G1 X109.628 Y102.688 E-.34897
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.164 J.355 P1  F30000
G1 X121.051 Y140.125 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X121 Y140.301 E.00608
G1 X106.831 Y140.301 E.47
G3 X104.232 Y135.137 I24.229 J-15.431 E.19208
G3 X106.545 Y132.08 I2.306 J-.659 E.14733
G1 X114.101 Y132.08 E.25066
G1 X114.267 Y132.472 E.01411
G2 X121 Y140.094 I15.798 J-7.17 E.34239
; WIPE_START
G1 F24000
G1 X121 Y140.301 E-.07874
G1 X119.207 Y140.301 E-.68126
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.313 J1.176 P1  F30000
G1 X150.085 Y132.082 Z3.4
G1 Z3
G1 E.8 F1800
G1 F15476.087
G1 X153.582 Y132.083 E.11598
G3 X155.698 Y135.346 I-.126 J2.399 E.1503
G3 X153.159 Y140.301 I-25.433 J-9.901 E.18502
G1 X139 Y140.301 E.46968
G1 X138.951 Y140.121 E.0062
G2 X145.899 Y132.08 I-8.921 J-14.73 E.35836
G1 X150.025 Y132.082 E.13688
G1 X150.086 Y131.688 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X153.46 Y131.688 E.10369
G3 X156.063 Y135.488 I.001 J2.791 E.16648
G3 X104.536 Y136.911 I-26.063 J-10.144 E2.01441
G3 X103.855 Y135.243 I35.951 J-15.669 E.05535
G3 X106.54 Y131.688 I2.684 J-.765 E.15854
G1 X114.362 Y131.691 E.24035
G2 X145.639 Y131.688 I15.638 J-6.335 E1.22973
G1 X150.026 Y131.688 E.13478
M204 S10000
; WIPE_START
G1 F24000
G1 X152.026 Y131.688 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.598 J-1.06 P1  F30000
G1 X143.758 Y136.355 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X144.713 Y135.037 I-11.811 J-9.562 E.05402
G1 X149.629 Y139.953 E.23063
G1 X148.751 Y139.953 E.02911
G1 X155.24 Y133.464 E.30442
G3 X155.37 Y135.227 I-1.888 J1.025 E.06044
G3 X154.521 Y137.169 I-21.837 J-8.389 E.07033
G1 X149.782 Y132.43 E.22233
G1 X148.599 Y132.429 E.03925
G1 X141.075 Y139.953 E.35294
G1 X141.953 Y139.953 E.02912
G1 X141.062 Y139.062 E.04179
G2 X142.277 Y137.98 I-12.772 J-15.566 E.054
G1 X140.121 Y139.874 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.304322
G1 F15000
G1 X139.439 Y140.081 E.01518
G1 X138.787 Y140.265 F30000
; LINE_WIDTH: 0.323572
G1 F15000
G1 X137.968 Y140.481 E.01937
G1 X137.967 Y140.477 F30000
; LINE_WIDTH: 0.135898
G1 F15000
G1 X138.789 Y140.273 E.00642
G1 X152.389 Y140.523 F30000
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X152.898 Y141.033 E.02214
G1 X152.682 Y141.349
G1 X151.856 Y140.523 E.0359
G1 X151.322 Y140.523
G1 X152.456 Y141.657 E.04925
G1 X152.23 Y141.964
G1 X150.789 Y140.523 E.0626
G1 X150.256 Y140.523
G1 X152.004 Y142.271 E.07596
G1 X151.768 Y142.569
G1 X149.723 Y140.523 E.08887
G1 X149.189 Y140.523
G1 X151.528 Y142.863 E.10164
G1 X151.289 Y143.156
G1 X148.656 Y140.523 E.11442
G1 X148.123 Y140.523
G1 X151.048 Y143.448 E.12711
G1 X150.795 Y143.729
G1 X147.589 Y140.523 E.13931
G1 X147.056 Y140.523
G1 X150.543 Y144.01 E.1515
G1 X150.29 Y144.291
G1 X146.523 Y140.523 E.1637
G1 X145.99 Y140.523
G1 X150.031 Y144.564 E.1756
G1 X149.765 Y144.832
M73 P58 R7
G1 X145.456 Y140.523 E.18723
G1 X144.923 Y140.523
G1 X149.499 Y145.1 E.19885
G1 X149.234 Y145.367
G1 X144.39 Y140.523 E.21048
G1 X143.857 Y140.523
G1 X148.956 Y145.623 E.2216
G1 X148.677 Y145.877
G1 X143.323 Y140.523 E.23266
G1 X142.79 Y140.523
G1 X148.398 Y146.132 E.24371
G1 X148.115 Y146.381
G1 X142.257 Y140.523 E.25455
G1 X141.723 Y140.523
G1 X147.823 Y146.623 E.26505
G1 X147.531 Y146.864
G1 X141.19 Y140.523 E.27555
G1 X140.657 Y140.523
G1 X147.239 Y147.106 E.28604
G1 X146.939 Y147.339
G1 X140.124 Y140.523 E.29615
G1 X139.59 Y140.523
G1 X146.633 Y147.566 E.30605
G1 X146.328 Y147.794
G1 X139.057 Y140.523 E.31595
G1 X138.524 Y140.523
G1 X146.022 Y148.021 E.32581
G1 X145.703 Y148.236
G1 X137.991 Y140.523 E.33513
G1 X137.592 Y140.658
G1 X145.384 Y148.45 E.3386
G1 X145.065 Y148.664
G1 X137.231 Y140.83 E.34042
G1 X136.865 Y140.998
G1 X144.739 Y148.871 E.34214
G1 X144.406 Y149.072
G1 X136.492 Y141.158 E.34391
G1 X136.108 Y141.308
G1 X144.073 Y149.273 E.34611
G1 X143.741 Y149.473
G1 X135.719 Y141.451 E.34859
G1 X135.322 Y141.588
G1 X143.394 Y149.66 E.35074
G1 X143.047 Y149.846
G1 X134.917 Y141.716 E.35328
G1 X134.501 Y141.834
G1 X142.7 Y150.032 E.35628
G1 X142.344 Y150.21
G1 X134.076 Y141.942 E.35928
G1 X133.645 Y142.044
G1 X141.983 Y150.382 E.36233
G1 X141.622 Y150.555
G1 X133.201 Y142.133 E.36597
M73 P59 R7
G1 X132.75 Y142.216
G1 X141.26 Y150.725 E.36979
G1 X140.884 Y150.882
G1 X132.283 Y142.282 E.37373
G1 X131.809 Y142.341
G1 X140.507 Y151.039 E.37798
G1 X140.13 Y151.196
G1 X131.321 Y142.386 E.38283
G1 X130.817 Y142.416
G1 X139.742 Y151.341 E.38785
G1 X139.35 Y151.482
G1 X130.304 Y142.435 E.39311
G1 X129.77 Y142.435
G1 X138.958 Y151.623 E.39924
G1 X138.558 Y151.756
G1 X129.219 Y142.417 E.40584
G1 X128.652 Y142.383
G1 X138.149 Y151.881 E.41273
G1 X137.741 Y152.006
G1 X128.063 Y142.328 E.42054
G1 X127.446 Y142.244
G1 X137.328 Y152.126 E.4294
G1 X136.902 Y152.233
G1 X126.802 Y142.133 E.43889
G1 X126.125 Y141.99
G1 X136.476 Y152.34 E.44977
G1 X136.045 Y152.443
G1 X125.412 Y141.809 E.46209
G1 X124.648 Y141.579
G1 X135.601 Y152.533 E.47598
G1 X135.158 Y152.622
G1 X123.812 Y141.276 E.49303
G1 X122.89 Y140.888
G1 X134.711 Y152.709 E.51368
G1 X134.247 Y152.778
G1 X121.992 Y140.523 E.53252
G1 X121.459 Y140.523
G1 X133.783 Y152.847 E.53553
G1 X133.315 Y152.912
G1 X120.926 Y140.523 E.53835
G1 X120.393 Y140.523
G1 X132.829 Y152.96 E.54044
G1 X132.344 Y153.008
G1 X119.859 Y140.523 E.54252
G1 X119.326 Y140.523
G1 X131.85 Y153.047 E.54421
G1 X131.342 Y153.072
G1 X118.793 Y140.523 E.5453
G1 X118.26 Y140.523
G1 X130.833 Y153.097 E.54639
G1 X130.308 Y153.105
G1 X117.726 Y140.523 E.54671
G1 X117.193 Y140.523
G1 X129.774 Y153.105 E.54671
G1 X129.237 Y153.101
G1 X116.66 Y140.523 E.54654
G1 X116.127 Y140.523
G1 X128.676 Y153.073 E.54534
G1 X128.115 Y153.045
G1 X115.593 Y140.523 E.54414
G1 X115.06 Y140.523
G1 X127.533 Y152.996 E.54199
G1 X126.941 Y152.937
G1 X114.527 Y140.523 E.53945
G1 X113.993 Y140.523
G1 X126.334 Y152.864 E.53627
G1 X125.707 Y152.77
G1 X113.46 Y140.523 E.53216
G1 X112.927 Y140.523
G1 X125.072 Y152.668 E.52776
G1 X124.405 Y152.535
G1 X112.394 Y140.523 E.52197
G1 X111.86 Y140.523
G1 X123.728 Y152.391 E.51572
G1 X123.016 Y152.212
G1 X111.327 Y140.523 E.50793
G1 X110.794 Y140.523
G1 X122.283 Y152.013 E.49927
G1 X121.516 Y151.779
G1 X110.261 Y140.523 E.48911
G1 X109.727 Y140.523
G1 X120.706 Y151.502 E.47707
G1 X119.863 Y151.193
G1 X109.194 Y140.523 E.46364
G1 X108.661 Y140.523
G1 X118.947 Y150.81 E.447
G1 X117.961 Y150.357
G1 X108.127 Y140.523 E.42734
G1 X107.594 Y140.523
G1 X116.875 Y149.804 E.40328
M204 S10000
; WIPE_START
G1 F24000
G1 X115.46 Y148.39 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.182 J.289 P1  F30000
G1 X115.633 Y149.095 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X107.061 Y140.523 E.3725
G1 X107.225 Y141.221
G1 X114.122 Y148.117 E.29968
M204 S10000
; WIPE_START
G1 F24000
G1 X112.707 Y146.703 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.264 J1.188 P1  F30000
G1 X133.619 Y142.049 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.115369
G1 F15000
G1 X133.466 Y142.132 E.00102
; WIPE_START
G1 F24000
G1 X133.619 Y142.049 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.051 J-1.216 P1  F30000
G1 X127.378 Y142.312 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.126053
G1 F15000
G1 X127.154 Y142.197 E.00171
; WIPE_START
G1 F24000
G1 X127.378 Y142.312 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.349 J-1.166 P1  F30000
G1 X122.828 Y140.95 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.214005
G1 F15000
G1 X122.697 Y140.858 E.00223
; LINE_WIDTH: 0.17206
G1 X122.566 Y140.766 E.00169
; LINE_WIDTH: 0.130114
G1 X122.435 Y140.673 E.00114
G1 X106.969 Y140.525 F30000
; LINE_WIDTH: 0.0881693
G1 F15000
M73 P60 R7
G1 X106.87 Y140.536 E.00037
; LINE_WIDTH: 0.118562
G1 X106.823 Y140.559 E.00032
G1 X106.83 Y140.578 E.00012
; LINE_WIDTH: 0.141273
G1 X106.864 Y140.656 E.00068
; LINE_WIDTH: 0.114721
G1 X106.898 Y140.734 E.0005
; WIPE_START
G1 F24000
G1 X106.864 Y140.656 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.894 J.826 P1  F30000
G1 X112.983 Y147.276 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.0881696
G1 F15000
G1 X112.835 Y147.147 E.00072
; LINE_WIDTH: 0.113009
G1 X112.509 Y146.851 E.00252
; LINE_WIDTH: 0.154843
G1 X112.183 Y146.554 E.00402
; LINE_WIDTH: 0.196676
G1 X111.857 Y146.258 E.00552
; LINE_WIDTH: 0.238508
G1 X111.364 Y145.787 E.01087
; LINE_WIDTH: 0.290609
G3 X109.909 Y144.35 I28.404 J-30.231 E.04128
; LINE_WIDTH: 0.296329
G1 X109.439 Y143.855 E.01409
; LINE_WIDTH: 0.260344
G1 X108.97 Y143.361 E.01209
; LINE_WIDTH: 0.224359
G1 X108.667 Y143.025 E.00669
; LINE_WIDTH: 0.178962
G1 X108.363 Y142.689 E.00502
; LINE_WIDTH: 0.133566
G1 X108.06 Y142.353 E.00334
; WIPE_START
G1 F24000
G1 X108.363 Y142.689 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.82 J.899 P1  F30000
G1 X114.84 Y148.598 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.0881706
G1 F15000
G1 X114.621 Y148.418 E.00105
; LINE_WIDTH: 0.135604
G1 X114.402 Y148.237 E.00215
; LINE_WIDTH: 0.183038
G1 X114.182 Y148.057 E.00324
; WIPE_START
G1 F24000
G1 X114.402 Y148.237 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.674 J1.013 P1  F30000
G1 X116.23 Y149.454 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.0881694
G1 F15000
G1 X116.051 Y149.314 E.00084
; LINE_WIDTH: 0.133938
G1 X115.873 Y149.174 E.00168
; LINE_WIDTH: 0.179707
G1 X115.694 Y149.035 E.00253
; WIPE_START
G1 F24000
G1 X115.873 Y149.174 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.624 J1.045 P1  F30000
G1 X117.391 Y150.081 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.0881697
G1 F15000
G1 X117.239 Y149.968 E.0007
; LINE_WIDTH: 0.132274
G1 X117.087 Y149.855 E.00138
; LINE_WIDTH: 0.176378
G1 X116.936 Y149.743 E.00205
; WIPE_START
G1 F24000
G1 X117.087 Y149.855 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.541 J1.09 P1  F30000
G1 X119.362 Y150.984 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.0881701
G1 F15000
G1 X119.245 Y150.905 E.00052
; LINE_WIDTH: 0.128987
G1 X119.127 Y150.826 E.00099
; LINE_WIDTH: 0.169805
G1 X119.01 Y150.748 E.00146
; WIPE_START
G1 F24000
G1 X119.127 Y150.826 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.138 J1.209 P1  F30000
G1 X134.896 Y152.627 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.0957468
G1 F15000
G1 X134.733 Y152.709 E.00078
; WIPE_START
G1 F24000
G1 X134.896 Y152.627 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.836 J-.885 P1  F30000
G1 X122.036 Y140.479 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.21329
G1 F15000
G1 X121.213 Y140.269 E.01179
G1 X120.561 Y140.082 F30000
; LINE_WIDTH: 0.312934
G1 F15000
G1 X119.879 Y139.874 E.01568
G1 X117.721 Y137.983 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X118.943 Y139.057 I11.593 J-11.957 E.054
G1 X118.047 Y139.953 E.04203
G1 X118.925 Y139.953 E.02912
G1 X111.401 Y132.429 E.35294
G1 X110.218 Y132.43 E.03924
G1 X105.484 Y137.164 E.2221
G3 X104.522 Y134.848 I19.571 J-9.481 E.08325
G3 X104.76 Y133.464 I2.103 J-.352 E.04747
G1 X111.249 Y139.953 E.30442
G1 X110.371 Y139.953 E.02912
G1 X115.289 Y135.035 E.23068
G3 X114.457 Y133.637 I14.73 J-9.703 E.054
M106 S249.9
; CHANGE_LAYER
; Z_HEIGHT: 3.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X115.289 Y135.035 E-.61841
G1 X115.025 Y135.299 E-.14159
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 25/58
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
G3 Z3.4 I1.204 J-.174 P1  F30000
G1 X114.401 Y130.975 Z3.4
G1 Z3.2
G1 E.8 F1800
; FEATURE: Support interface
; LINE_WIDTH: 0.42
G1 F4800
G1 X114.661 Y130.978 E.008
G1 X114.661 Y104.566 E.81154
G1 X114.213 Y104.566 E.01379
G1 X114.213 Y130.974 E.81142
G1 X113.335 Y130.966 E.02695
G1 X113.336 Y104.566 E.81119
G1 X112.458 Y104.566 E.02695
G1 X112.458 Y130.958 E.81095
G1 X111.581 Y130.951 E.02695
G1 X111.581 Y104.566 E.81072
G1 X110.704 Y104.566 E.02695
G1 X110.704 Y130.943 E.81048
G1 X109.827 Y130.935 E.02695
G1 X109.827 Y104.566 E.81025
G1 X108.95 Y104.566 E.02695
G1 X108.95 Y130.928 E.81001
G1 X108.339 Y130.922 E.01879
G1 X108.339 Y104.566 E.80984
G1 X108.762 Y104.566 E.013
G1 X107.917 Y104.6 F30000
; FEATURE: Support
G1 F9000
G1 X107.961 Y105.714 E.03427
G3 X107.911 Y103.708 I.009 J-1.004 E.09483
G1 X107.911 Y104.456 E.02299
G1 X107.915 Y104.54 E.00258
G1 X107.945 Y105.5 F30000
G1 F9000
G1 X107.375 Y105.5 E.01751
; WIPE_START
G1 F24000
G1 X107.945 Y105.5 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I-.023 J1.217 P1  F30000
G1 X115.066 Y105.632 Z3.6
G1 Z3.2
G1 E.8 F1800
G1 F9000
G1 X115.098 Y103.731 E.05841
G3 X115.837 Y105.337 I-.096 J1.017 E.06561
G3 X116.168 Y106.137 I-36.873 J15.702 E.0266
G3 X115.039 Y107.207 I-1.046 J.027 E.05391
G1 X115.065 Y105.692 E.04656
G1 X115.055 Y105.5 F30000
G1 F9000
G1 X115.853 Y105.5 E.02451
; WIPE_START
G1 F24000
G1 X115.055 Y105.5 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I-.932 J-.783 P1  F30000
G1 X106.654 Y115.5 Z3.6
G1 Z3.2
G1 E.8 F1800
G1 F9000
G1 X107.945 Y115.5 E.03966
G1 X107.961 Y115.5 F30000
G1 F9000
G1 X107.961 Y116.622 E.03447
G3 X107.74 Y114.655 I-.322 J-.96 E.11085
G3 X107.961 Y114.692 I-.148 J1.566 E.00691
G1 X107.961 Y115.44 E.02298
; WIPE_START
G1 F24000
G1 X107.961 Y116.622 E-.44906
G1 X107.541 Y116.653 E-.16017
G1 X107.166 Y116.523 E-.15077
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I-.036 J1.216 P1  F30000
G1 X115.046 Y116.758 Z3.6
G1 Z3.2
G1 E.8 F1800
G1 F9000
G3 X115.775 Y116.528 I.671 J.857 E.02399
G3 X115.84 Y118.526 I-.03 J1.001 E.09282
G3 X115.039 Y118.296 I-.125 J-1.076 E.0263
G1 X115.046 Y116.818 E.0454
G1 X115.055 Y118 F30000
G1 F9000
G1 X116.607 Y118 E.04769
; WIPE_START
G1 F24000
G1 X115.055 Y118 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I-1.175 J.316 P1  F30000
G1 X115.913 Y121.194 Z3.6
G1 Z3.2
G1 E.8 F1800
G1 F9000
G1 X116.095 Y121.227 E.00569
G3 X115.84 Y123.162 I-.35 J.938 E.08274
G3 X115.039 Y122.931 I-.125 J-1.076 E.0263
G1 X115.046 Y121.394 E.04724
G3 X115.775 Y121.164 I.671 J.857 E.02399
G1 X115.854 Y121.181 E.0025
G1 X116.256 Y123 F30000
G1 F9000
G1 X115.163 Y123 E.03358
; WIPE_START
G1 F24000
G1 X116.256 Y123 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I-1.199 J-.21 P1  F30000
G1 X115.066 Y129.782 Z3.6
G1 Z3.2
G1 E.8 F1800
G1 F9000
G3 X115.303 Y131.74 I-.027 J.997 E.08721
G1 X115.039 Y131.256 E.01696
G1 X115.065 Y129.842 E.04345
G1 X115.055 Y130.5 F30000
G1 F9000
G1 X115.982 Y130.5 E.02849
; WIPE_START
G1 F24000
G1 X115.055 Y130.5 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I0 J-1.217 P1  F30000
G1 X106.739 Y130.5 Z3.6
G1 Z3.2
G1 E.8 F1800
G1 F9000
G1 X107.945 Y130.5 E.03706
G1 X107.961 Y130.5 F30000
G1 F9000
G1 X107.961 Y130.919 E.01288
G1 X106.851 Y130.889 E.03412
G3 X107.785 Y129.399 I.846 J-.507 E.06666
G3 X107.961 Y129.429 I-.102 J1.145 E.00551
G1 X107.961 Y130.44 E.03106
; WIPE_START
G1 F24000
G1 X107.961 Y130.919 E-.18203
G1 X106.851 Y130.889 E-.42198
G1 X106.742 Y130.493 E-.15599
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I1.126 J.46 P1  F30000
G1 X107.961 Y127.51 Z3.6
G1 Z3.2
G1 E.8 F1800
G1 F9000
G3 X107.232 Y125.719 I-.093 J-1.006 E.07923
G2 X107.01 Y125.247 I-.934 J.151 E.01627
G3 X107.961 Y123.817 I.921 J-.418 E.06301
G1 X107.961 Y127.45 E.11163
G1 X107.945 Y125.5 F30000
G1 F9000
G1 X107.21 Y125.5 E.02258
; WIPE_START
G1 F24000
G1 X107.945 Y125.5 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I-.167 J1.205 P1  F30000
G1 X144.023 Y130.5 Z3.6
G1 Z3.2
G1 E.8 F1800
G1 F9000
G1 X144.945 Y130.5 E.02834
G1 X144.961 Y130.5 F30000
G1 F9000
G1 X144.961 Y131.238 E.02267
G1 X144.715 Y131.71 E.01636
G3 X144.961 Y129.75 I.258 J-.963 E.08786
G1 X144.961 Y130.44 E.02121
; WIPE_START
G1 F24000
G1 X144.961 Y131.238 E-.30311
G1 X144.715 Y131.71 E-.20236
G1 X144.419 Y131.562 E-.12574
G1 X144.182 Y131.319 E-.12879
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I.135 J1.209 P1  F30000
G1 X152.039 Y130.44 Z3.6
G1 Z3.2
G1 E.8 F1800
G1 F9000
G1 X152.039 Y129.436 E.03084
G3 X152.351 Y129.403 I.271 J1.052 E.0097
G3 X153.157 Y130.89 I-.042 J.985 E.06249
G1 X152.039 Y130.89 E.03438
G1 X152.039 Y130.5 E.01198
G1 X153.268 Y130.5 F30000
G1 F9000
G1 X152.055 Y130.5 E.03728
G1 X151.238 Y130.89 F30000
; FEATURE: Support interface
G1 F4800
G1 X151.661 Y130.89 E.013
G1 X151.661 Y104.566 E.80885
G1 X151.05 Y104.566 E.01879
G1 X151.05 Y130.89 E.80885
G1 X150.173 Y130.89 E.02695
G1 X150.173 Y104.566 E.80884
G1 X149.296 Y104.566 E.02695
G1 X149.296 Y130.89 E.80884
G1 X148.419 Y130.89 E.02695
G1 X148.419 Y104.566 E.80884
G1 X147.542 Y104.566 E.02695
G1 X147.542 Y130.889 E.80884
G1 X146.665 Y130.889 E.02695
G1 X146.665 Y104.566 E.80883
G1 X145.787 Y104.566 E.02695
G1 X145.787 Y130.889 E.80883
G1 X145.339 Y130.889 E.01379
G1 X145.339 Y104.566 E.80883
G1 X145.599 Y104.566 E.008
G1 X144.914 Y104.582 F30000
; FEATURE: Support
G1 F9000
G1 X144.94 Y105.715 E.03482
G3 X144.911 Y103.702 I-.029 J-1.006 E.09807
G1 X144.911 Y104.456 E.02317
G1 X144.913 Y104.522 E.00203
G1 X144.945 Y105.5 F30000
G1 F9000
G1 X144.312 Y105.5 E.01945
; WIPE_START
G1 F24000
G1 X144.945 Y105.5 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I0 J1.217 P1  F30000
G1 X152.039 Y105.5 Z3.6
G1 Z3.2
G1 E.8 F1800
G1 F9000
G1 X152.039 Y104.506 E.03054
G1 X152.126 Y103.795 E.02201
G3 X153.044 Y105.121 I-.138 J1.076 E.05587
G3 X152.039 Y106.601 I-.881 J.483 E.06781
G1 X152.039 Y105.56 E.032
G1 X152.055 Y105.5 F30000
G1 F9000
G1 X153.152 Y105.5 E.03372
; WIPE_START
G1 F24000
G1 X152.055 Y105.5 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I-.939 J-.775 P1  F30000
G1 X144.961 Y114.095 Z3.6
G1 Z3.2
G1 E.8 F1800
G1 F9000
G1 X144.954 Y115.632 E.04724
G3 X144.356 Y113.859 I-.676 J-.76 E.12327
G3 X144.914 Y114.059 I-.066 J1.061 E.01845
G1 X144.945 Y115.5 F30000
G1 F9000
G1 X143.513 Y115.5 E.04399
; WIPE_START
M73 P61 R7
G1 F24000
G1 X144.945 Y115.5 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I-.71 J.989 P1  F30000
G1 X152.046 Y120.598 Z3.6
G1 Z3.2
G1 E.8 F1800
G1 F9000
G3 X152.775 Y120.368 I.671 J.857 E.02399
G3 X152.84 Y122.365 I-.03 J1.001 E.09282
G3 X152.039 Y122.135 I-.125 J-1.076 E.0263
G1 X152.046 Y120.658 E.0454
; WIPE_START
G1 F24000
G1 X152.387 Y120.415 E-.15915
G1 X152.775 Y120.368 E-.14836
G1 X153.093 Y120.437 E-.1237
G1 X153.421 Y120.639 E-.14669
G1 X153.649 Y120.944 E-.14442
G1 X153.674 Y121.04 E-.03767
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I-.327 J-1.172 P1  F30000
G1 X114.101 Y132.08 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X114.266 Y132.47 E.01407
G2 X121.876 Y140.59 I15.821 J-7.2 E.37576
G1 X121.83 Y140.777 E.00636
G1 X107.149 Y140.777 E.48701
G3 X104.6 Y136.044 I21.627 J-14.7 E.17861
G3 X104.232 Y135.136 I5.51 J-2.763 E.03255
G3 X106.545 Y132.08 I2.312 J-.654 E.14718
G1 X114.041 Y132.08 E.24866
G1 X114.361 Y131.688 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X114.624 Y132.309 E.02072
G2 X124.105 Y141.169 I15.402 J-6.979 E.40924
G1 X106.94 Y141.169 E.52744
G3 X104.239 Y136.197 I22.137 J-15.245 E.17419
G3 X103.855 Y135.244 I5.814 J-2.897 E.03161
G3 X106.54 Y131.688 I2.69 J-.761 E.15845
G1 X114.301 Y131.688 E.23847
M204 S10000
; WIPE_START
G1 F24000
G1 X114.624 Y132.309 E-.26597
G1 X114.979 Y133.046 E-.31083
G1 X115.209 Y133.469 E-.1832
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I-.265 J-1.188 P1  F30000
G1 X114.456 Y133.638 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X115.287 Y135.037 I17.013 J-9.169 E.05401
G1 X110.49 Y139.834 E.22506
G1 X111.13 Y139.834 E.02123
G1 X104.762 Y133.465 E.29876
G2 X104.517 Y134.812 I2.214 J1.098 E.04601
G2 X105.484 Y137.164 I18.881 J-6.391 E.08442
G1 X110.218 Y132.43 E.2221
G1 X111.401 Y132.429 E.03925
G1 X118.806 Y139.834 E.34737
G1 X118.166 Y139.834 E.02123
G1 X118.938 Y139.062 E.03622
G3 X117.721 Y137.981 I17.403 J-20.808 E.054
G1 X120.572 Y140.342 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.348722
G1 F15000
G1 X121.346 Y140.559 E.02003
G1 X122.043 Y140.733 F30000
; LINE_WIDTH: 0.368666
G1 F15000
G1 X123.007 Y140.96 E.02629
G1 X123.008 Y140.953 F30000
; LINE_WIDTH: 0.159054
G1 F15000
G1 X122.041 Y140.742 E.00937
G1 X107.401 Y140.305 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.578616
G1 F11760.402
G1 X119.494 Y140.305 E.52788
G1 X120.217 Y140.081 F30000
; LINE_WIDTH: 0.460266
G1 F15000
G1 X119.839 Y139.819 E.01566
G1 X119.734 Y140.105 E.01038
; LINE_WIDTH: 0.428709
G1 X119.674 Y140.172 E.00282
; LINE_WIDTH: 0.478678
G1 F14457.567
G1 X119.614 Y140.239 E.00319
; LINE_WIDTH: 0.528647
G1 F12970.249
G1 X119.554 Y140.305 E.00355
; LINE_WIDTH: 0.578616
G1 F11760.402
G1 X119.687 Y140.325 E.00589
; LINE_WIDTH: 0.539166
G1 F12695.316
G1 X119.821 Y140.345 E.00545
; LINE_WIDTH: 0.469881
G1 F14755.467
G2 X120.138 Y140.365 I.225 J-1.064 E.0111
G1 X120.201 Y140.139 E.00816
; WIPE_START
G1 F24000
G1 X120.138 Y140.365 E-.32254
G1 X119.821 Y140.345 E-.43746
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I1.169 J-.339 P1  F30000
G1 X109.102 Y103.376 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X109.102 Y103.08 E.00981
G1 X113.898 Y103.08 E.15909
G1 X113.898 Y103.376 E.00981
G1 X109.162 Y103.376 E.1571
G1 X108.71 Y103.768 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X108.71 Y102.688 E.03319
G1 X114.29 Y102.688 E.17146
G1 X114.29 Y103.768 E.03319
G1 X108.77 Y103.768 E.16961
M204 S10000
; WIPE_START
G1 F24000
G1 X108.71 Y102.688 E-.41103
G1 X109.628 Y102.688 E-.34897
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I-.022 J1.217 P1  F30000
G1 X148.5 Y103.376 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X146.102 Y103.376 E.07954
G1 X146.102 Y103.08 E.00981
G1 X150.898 Y103.08 E.15909
G1 X150.898 Y103.376 E.00981
G1 X148.56 Y103.376 E.07755
G1 X148.5 Y103.768 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X145.71 Y103.768 E.08573
G1 X145.71 Y102.688 E.03319
G1 X151.29 Y102.688 E.17146
G1 X151.29 Y103.768 E.03319
G1 X148.56 Y103.768 E.08389
M204 S10000
; WIPE_START
G1 F24000
G1 X146.56 Y103.768 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I-1.207 J.158 P1  F30000
G1 X150.267 Y132.08 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X153.485 Y132.081 E.10676
G3 X155.698 Y135.346 I-.023 J2.398 E.15361
G3 X152.846 Y140.777 I-25.544 J-9.95 E.20392
G1 X138.172 Y140.777 E.48675
G1 X138.125 Y140.593 E.00628
G2 X145.899 Y132.08 I-8.19 J-15.285 E.38985
G1 X150.207 Y132.08 E.14289
G1 X150.267 Y131.688 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X153.49 Y131.689 E.09904
G3 X156.063 Y135.488 I-.028 J2.79 E.16555
G3 X153.057 Y141.169 I-26.181 J-10.219 E.19792
G1 X135.894 Y141.169 E.52737
G2 X145.639 Y131.688 I-5.896 J-15.809 E.42999
G1 X150.207 Y131.688 E.14035
M204 S10000
; WIPE_START
G1 F24000
G1 X152.207 Y131.688 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I-.588 J-1.065 P1  F30000
G1 X143.758 Y136.355 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X144.711 Y135.035 I-12.222 J-9.833 E.05402
G1 X149.51 Y139.834 E.22512
G1 X148.87 Y139.834 E.02123
G1 X155.24 Y133.464 E.29884
G3 X155.37 Y135.227 I-1.888 J1.025 E.06043
G3 X154.521 Y137.169 I-21.945 J-8.434 E.07034
G1 X149.781 Y132.429 E.22239
G1 X148.599 Y132.428 E.03918
G1 X141.194 Y139.834 E.34741
G1 X141.834 Y139.834 E.02123
G1 X141.062 Y139.062 E.03622
G2 X142.279 Y137.982 I-14.012 J-17.016 E.054
G1 X140.446 Y140.305 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.578616
G1 F11760.402
G1 X152.528 Y140.305 E.52744
G1 X139.886 Y139.937 F30000
; LINE_WIDTH: 0.348929
G1 F15000
G1 X139.965 Y140.04 E.00324
; LINE_WIDTH: 0.351246
G1 X139.974 Y140.081 E.00105
; LINE_WIDTH: 0.385329
G1 X139.984 Y140.121 E.00117
; LINE_WIDTH: 0.450534
G1 X139.993 Y140.162 E.00139
G1 X139.916 Y140.368 E.0073
G1 X140.135 Y140.368 E.0073
; LINE_WIDTH: 0.453493
G1 X140.239 Y140.347 E.00353
; LINE_WIDTH: 0.495201
G1 F13929.405
G1 X140.342 Y140.326 E.00389
; LINE_WIDTH: 0.536909
G1 F12753.338
G1 X140.446 Y140.305 E.00425
; LINE_WIDTH: 0.578616
G1 F11760.402
G1 X140.386 Y140.25 E.00354
; LINE_WIDTH: 0.536909
G1 F12753.338
G1 X140.327 Y140.195 E.00326
; LINE_WIDTH: 0.495201
G1 F13929.405
G1 X140.268 Y140.14 E.00299
; LINE_WIDTH: 0.453493
G1 F15000
G1 X140.267 Y140.085 E.00182
; LINE_WIDTH: 0.419411
G1 X140.266 Y140.031 E.00167
; LINE_WIDTH: 0.353053
G1 X140.266 Y139.976 E.00138
G1 X140.191 Y139.725 E.00664
G1 X139.935 Y139.902 E.00786
G1 X139.36 Y140.106 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.407079
G1 F15000
G1 X139.253 Y140.391 E.00901
G1 X138.657 Y140.558 E.01837
G1 X137.959 Y140.734 F30000
; LINE_WIDTH: 0.325288
G1 F15000
G1 X136.994 Y140.957 E.02279
; CHANGE_LAYER
; Z_HEIGHT: 3.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X137.959 Y140.734 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 26/58
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
G3 Z3.6 I.976 J.727 P1  F30000
G1 X144.705 Y131.674 Z3.6
G1 Z3.4
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
G3 X144.961 Y129.805 I.371 J-.901 E.07888
G1 X144.961 Y131.238 E.04401
G1 X144.735 Y131.623 E.01372
G1 X144.945 Y130.5 F30000
G1 F9000
G1 X144.156 Y130.5 E.02424
; WIPE_START
G1 F24000
G1 X144.945 Y130.5 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I0 J1.217 P1  F30000
G1 X152.039 Y130.5 Z3.8
G1 Z3.4
G1 E.8 F1800
G1 F9000
G1 X152.039 Y129.5 E.03073
G3 X152.273 Y129.483 I.217 J1.374 E.00722
G3 X153.093 Y130.89 I-.038 J.965 E.05953
G1 X152.039 Y130.89 E.03241
G1 X152.039 Y130.56 E.01013
G1 X153.178 Y130.5 F30000
G1 F9000
G1 X152.055 Y130.5 E.03451
G1 X151.238 Y130.89 F30000
; FEATURE: Support interface
G1 F4800
G1 X151.661 Y130.89 E.013
G1 X151.661 Y104.566 E.80884
G1 X151.05 Y104.566 E.01879
G1 X151.05 Y130.89 E.80884
G1 X150.173 Y130.89 E.02695
G1 X150.173 Y104.566 E.80884
G1 X149.296 Y104.566 E.02695
G1 X149.296 Y130.889 E.80884
G1 X148.419 Y130.889 E.02695
G1 X148.419 Y104.566 E.80883
G1 X147.542 Y104.566 E.02695
G1 X147.542 Y130.889 E.80883
G1 X146.665 Y130.889 E.02695
G1 X146.665 Y104.566 E.80883
G1 X145.787 Y104.566 E.02695
G1 X145.787 Y130.889 E.80883
G1 X145.339 Y130.889 E.01379
G1 X145.339 Y104.566 E.80883
G1 X145.599 Y104.566 E.008
G1 X144.917 Y104.595 F30000
; FEATURE: Support
G1 F9000
G1 X144.961 Y105.663 E.03285
G3 X144.911 Y103.702 I.056 J-.983 E.09002
G1 X144.911 Y104.456 E.02317
G1 X144.915 Y104.535 E.00242
; WIPE_START
G1 F24000
G1 X144.961 Y105.663 E-.42906
G1 X144.612 Y105.576 E-.13695
G1 X144.302 Y105.361 E-.1431
G1 X144.226 Y105.251 E-.05089
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I.111 J1.212 P1  F30000
G1 X152.039 Y104.535 Z3.8
G1 Z3.4
G1 E.8 F1800
G1 F9000
G1 X152.039 Y104.506 E.00088
G1 X152.089 Y103.791 E.02203
G1 X152.141 Y103.803 E.00165
G3 X152.909 Y105.103 I-.266 J1.035 E.05156
G3 X152.039 Y106.581 I-.85 J.495 E.06403
G1 X152.039 Y104.595 E.06103
G1 X152.055 Y105.5 F30000
G1 F9000
G1 X153.026 Y105.5 E.02985
; WIPE_START
G1 F24000
G1 X152.055 Y105.5 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I-.937 J-.777 P1  F30000
G1 X144.961 Y114.057 Z3.8
G1 Z3.4
G1 E.8 F1800
G1 F9000
G1 X144.961 Y115.664 E.04937
G3 X144.434 Y113.876 I-.609 J-.792 E.11904
G3 X144.912 Y114.025 I-.066 J1.051 E.01554
G1 X144.945 Y115.5 F30000
G1 F9000
G1 X143.615 Y115.5 E.04087
; WIPE_START
G1 F24000
G1 X144.945 Y115.5 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I-.707 J.99 P1  F30000
G1 X152.039 Y120.566 Z3.8
G1 Z3.4
G1 E.8 F1800
M73 P62 R7
G1 F9000
G3 X152.695 Y120.385 I.593 J.87 E.0213
G3 X152.759 Y122.348 I-.028 J.983 E.0913
G3 X152.039 Y122.173 I-.122 J-1.069 E.02326
G1 X152.039 Y120.626 E.04753
; WIPE_START
G1 F24000
G1 X152.375 Y120.414 E-.15107
G1 X152.695 Y120.385 E-.122
G1 X153.008 Y120.453 E-.12179
G1 X153.331 Y120.652 E-.14435
G1 X153.555 Y120.951 E-.14198
G1 X153.608 Y121.152 E-.07881
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I.464 J-1.125 P1  F30000
G1 X115.702 Y105.5 Z3.8
G1 Z3.4
G1 E.8 F1800
G1 F9000
G1 X115.055 Y105.5 E.01988
G1 X115.039 Y105.5 F30000
G1 F9000
G1 X115.039 Y104.506 E.03054
G1 X115.119 Y103.741 E.02362
G3 X115.686 Y105.337 I-.217 J.976 E.06208
G3 X116.033 Y106.087 I-9.978 J5.072 E.0254
G3 X115.039 Y107.201 I-1.011 J.099 E.05156
G1 X115.039 Y105.56 E.05043
; WIPE_START
G1 F24000
G1 X115.039 Y104.506 E-.40055
G1 X115.119 Y103.741 E-.29215
G1 X115.274 Y103.825 E-.0673
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I-.296 J-1.18 P1  F30000
G1 X107.961 Y105.658 Z3.8
G1 Z3.4
G1 E.8 F1800
G1 F9000
G3 X107.911 Y103.713 I.112 J-.976 E.08637
G1 X107.911 Y104.456 E.02284
G1 X107.959 Y105.598 E.03511
; WIPE_START
G1 F24000
G1 X107.611 Y105.548 E-.13363
G1 X107.36 Y105.361 E-.119
G1 X107.183 Y105.109 E-.11707
G1 X107.093 Y104.753 E-.1394
G1 X107.145 Y104.386 E-.14092
G1 X107.282 Y104.131 E-.10999
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I-.343 J1.167 P1  F30000
G1 X108.762 Y104.566 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Support interface
G1 F4800
G1 X108.339 Y104.566 E.013
G1 X108.339 Y130.911 E.80951
G1 X108.95 Y130.913 E.01879
G1 X108.95 Y104.566 E.80957
G1 X109.827 Y104.566 E.02695
G1 X109.827 Y130.917 E.80967
G1 X110.704 Y130.92 E.02695
G1 X110.704 Y104.566 E.80976
G1 X111.581 Y104.566 E.02695
G1 X111.581 Y130.923 E.80986
G1 X112.458 Y130.926 E.02695
G1 X112.458 Y104.566 E.80995
G1 X113.336 Y104.566 E.02695
G1 X113.335 Y130.929 E.81004
G1 X114.213 Y130.932 E.02695
G1 X114.213 Y104.566 E.81014
G1 X114.661 Y104.566 E.01379
G1 X114.661 Y130.933 E.81019
G1 X114.401 Y130.933 E.008
G1 X115.039 Y130.933 F30000
; FEATURE: Support
G1 F9000
G1 X115.039 Y129.834 E.03375
G1 X115.088 Y129.841 E.00155
G3 X115.285 Y131.716 I-.15 J.963 E.07856
G1 X115.039 Y131.246 E.01629
G1 X115.039 Y130.993 E.00779
G1 X115.055 Y130.5 F30000
G1 F9000
G1 X115.849 Y130.5 E.02439
; WIPE_START
G1 F24000
G1 X115.055 Y130.5 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I0 J-1.217 P1  F30000
G1 X106.828 Y130.5 Z3.8
G1 Z3.4
G1 E.8 F1800
G1 F9000
G1 X107.945 Y130.5 E.03431
G1 X107.961 Y130.5 F30000
G1 F9000
G1 X107.961 Y130.91 E.0126
G1 X106.914 Y130.887 E.03219
G3 X107.861 Y129.48 I.859 J-.444 E.06355
G3 X107.961 Y129.493 I-.059 J.82 E.00313
G1 X107.961 Y130.44 E.02909
; WIPE_START
G1 F24000
G1 X107.961 Y130.91 E-.1786
G1 X106.914 Y130.887 E-.39814
G1 X106.815 Y130.415 E-.18325
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I1.132 J.447 P1  F30000
G1 X107.961 Y127.51 Z3.8
G1 Z3.4
G1 E.8 F1800
G1 F9000
G1 X107.956 Y127.51 E.00017
G3 X107.386 Y125.724 I.019 J-.99 E.07562
G2 X107.095 Y125.122 I-1.147 J.183 E.02082
G3 X107.961 Y123.84 I.948 J-.294 E.05454
G1 X107.961 Y127.45 E.11094
G1 X107.945 Y125.5 F30000
G1 F9000
G1 X107.356 Y125.5 E.0181
; WIPE_START
G1 F24000
G1 X107.945 Y125.5 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I.409 J1.146 P1  F30000
G1 X115.039 Y122.969 Z3.8
G1 Z3.4
G1 E.8 F1800
G1 F9000
G1 X115.039 Y121.363 E.04937
G3 X115.695 Y121.182 I.593 J.87 E.0213
G3 X115.759 Y123.144 I-.028 J.983 E.0913
G3 X115.089 Y123.001 I-.122 J-1.069 E.02143
; WIPE_START
G1 F24000
G1 X115.039 Y121.363 E-.62298
G1 X115.367 Y121.214 E-.13702
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I1.147 J.407 P1  F30000
G1 X116.509 Y118 Z3.8
G1 Z3.4
G1 E.8 F1800
G1 F9000
G1 X115.055 Y118 E.04469
G1 X115.039 Y118 F30000
G1 F9000
G1 X115.039 Y116.727 E.03913
G3 X115.695 Y116.546 I.593 J.87 E.0213
G3 X115.759 Y118.508 I-.028 J.983 E.0913
G3 X115.039 Y118.333 I-.122 J-1.069 E.02326
G1 X115.039 Y118.06 E.0084
; WIPE_START
G1 F24000
G1 X115.039 Y116.727 E-.5067
G1 X115.375 Y116.575 E-.14029
G1 X115.671 Y116.548 E-.11301
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I-.012 J-1.217 P1  F30000
G1 X107.961 Y116.627 Z3.8
G1 Z3.4
G1 E.8 F1800
G1 F9000
G3 X107.84 Y114.673 I-.224 J-.967 E.10588
G3 X107.961 Y114.687 I-.059 J1.011 E.00377
G1 X107.961 Y116.567 E.05775
G1 X107.945 Y115.5 F30000
G1 F9000
G1 X106.773 Y115.5 E.03601
; WIPE_START
G1 F24000
G1 X107.945 Y115.5 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I-.442 J1.134 P1  F30000
G1 X150.449 Y132.08 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X153.47 Y132.08 E.10022
G3 X155.698 Y135.345 I-.009 J2.398 E.15411
G3 X152.977 Y140.577 I-25.258 J-9.815 E.19599
G1 X138.532 Y140.577 E.47916
G1 X138.484 Y140.396 E.00622
G2 X145.899 Y132.08 I-8.509 J-15.052 E.37631
G1 X150.389 Y132.08 E.14893
G1 X150.449 Y131.688 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X153.475 Y131.688 E.09299
G3 X156.063 Y135.488 I-.014 J2.791 E.16601
G3 X153.188 Y140.969 I-25.806 J-10.044 E.19057
G1 X136.406 Y140.969 E.51566
G2 X145.639 Y131.688 I-6.411 J-15.611 E.4131
G1 X150.389 Y131.688 E.14594
M204 S10000
; WIPE_START
G1 F24000
G1 X152.389 Y131.688 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I-.579 J-1.071 P1  F30000
G1 X143.758 Y136.355 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X144.711 Y135.035 I-12.17 J-9.794 E.05402
G1 X149.386 Y139.71 E.21929
G1 X148.994 Y139.71 E.01299
G1 X155.24 Y133.464 E.29301
G3 X155.37 Y135.227 I-1.888 J1.025 E.06043
G3 X154.521 Y137.169 I-22.054 J-8.479 E.07034
G1 X149.78 Y132.428 E.2224
G1 X148.6 Y132.428 E.03917
G1 X141.318 Y139.71 E.34158
G1 X141.71 Y139.71 E.01299
G1 X141.062 Y139.062 E.03038
G2 X142.279 Y137.982 I-14.234 J-17.266 E.054
G1 X137.426 Y140.758 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.422627
G1 F15000
G2 X138.318 Y140.535 I-11.988 J-49.799 E.02845
G1 X138.999 Y140.355 F30000
; LINE_WIDTH: 0.195216
G1 F15000
G1 X139.732 Y140.147 E.00946
G1 X140.251 Y139.931 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.752626
G1 F8876.915
G1 X140.277 Y140.018 E.00522
; LINE_WIDTH: 0.754152
G1 F8857.869
G1 X140.334 Y140.039 E.0035
; LINE_WIDTH: 0.712278
G1 F9412.004
G1 X140.39 Y140.059 E.00329
; LINE_WIDTH: 0.670404
G1 F10040.096
G1 X140.447 Y140.08 E.00309
; LINE_WIDTH: 0.62853
G1 F10758.014
G1 X140.503 Y140.101 E.00288
; LINE_WIDTH: 0.586656
G1 F11586.506
G1 X140.56 Y140.122 E.00268
; LINE_WIDTH: 0.503117
G1 F13689.801
G1 X140.617 Y140.143 E.00227
G1 X152.683 Y140.143 E.45248
; WIPE_START
G1 F24000
G1 X150.683 Y140.143 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I1.215 J-.072 P1  F30000
G1 X148.5 Y103.376 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X146.102 Y103.376 E.07954
G1 X146.102 Y103.08 E.00981
G1 X150.898 Y103.08 E.15909
G1 X150.898 Y103.376 E.00981
G1 X148.56 Y103.376 E.07755
G1 X148.5 Y103.768 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X145.71 Y103.768 E.08573
G1 X145.71 Y102.688 E.03319
G1 X151.29 Y102.688 E.17146
G1 X151.29 Y103.768 E.03319
G1 X148.56 Y103.768 E.08389
M204 S10000
; WIPE_START
G1 F24000
G1 X146.56 Y103.768 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I.013 J-1.217 P1  F30000
G1 X109.102 Y103.376 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X109.102 Y103.08 E.00981
G1 X113.898 Y103.08 E.15909
G1 X113.898 Y103.376 E.00981
G1 X109.162 Y103.376 E.1571
G1 X108.71 Y103.768 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X108.71 Y102.688 E.03319
G1 X114.29 Y102.688 E.17146
G1 X114.29 Y103.768 E.03319
G1 X108.77 Y103.768 E.16961
M204 S10000
; WIPE_START
G1 F24000
G1 X108.71 Y102.688 E-.41103
G1 X109.628 Y102.688 E-.34897
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I-1.203 J.183 P1  F30000
G1 X114.101 Y132.08 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X114.266 Y132.469 E.01402
G2 X121.522 Y140.396 I15.752 J-7.135 E.36247
G1 X121.473 Y140.577 E.00622
G1 X107.014 Y140.577 E.47965
G3 X104.62 Y136.09 I21.753 J-14.491 E.16895
G3 X104.268 Y135.252 I7.505 J-3.64 E.03019
G3 X106.545 Y132.08 I2.275 J-.77 E.15119
G1 X114.041 Y132.08 E.24866
G1 X114.361 Y131.688 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X114.623 Y132.308 E.02068
G2 X123.596 Y140.969 I15.4 J-6.976 E.39247
G1 X106.805 Y140.969 E.51594
G3 X104.259 Y136.243 I21.947 J-14.875 E.16524
G3 X103.896 Y135.377 I7.744 J-3.747 E.02885
G3 X106.54 Y131.688 I2.648 J-.894 E.16274
G1 X114.301 Y131.688 E.23847
M204 S10000
; WIPE_START
G1 F24000
G1 X114.623 Y132.308 E-.26545
G1 X114.978 Y133.044 E-.31055
G1 X115.209 Y133.47 E-.184
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I-.264 J-1.188 P1  F30000
G1 X114.457 Y133.636 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X115.289 Y135.035 I15.317 J-8.164 E.054
G1 X110.614 Y139.71 E.21929
G1 X111.006 Y139.71 E.01299
G1 X104.762 Y133.465 E.29293
G2 X104.516 Y134.81 I2.216 J1.099 E.04595
G2 X105.484 Y137.164 I18.898 J-6.394 E.08448
G1 X110.218 Y132.43 E.2221
G1 X111.401 Y132.429 E.03925
G1 X118.682 Y139.71 E.34154
G1 X118.29 Y139.71 E.01299
G1 X118.944 Y139.056 E.03065
G3 X117.723 Y137.98 I6.876 J-9.024 E.05403
G1 X120.269 Y140.149 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.1334
G1 F15000
G1 X121.001 Y140.354 E.0056
G1 X121.685 Y140.543 F30000
; LINE_WIDTH: 0.163794
G1 F15000
G1 X122.578 Y140.753 E.00903
G1 X121.951 Y140.773 F30000
; LINE_WIDTH: 0.145955
G1 F15000
G1 X121.75 Y140.302 E.00429
G1 X107.253 Y140.143 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502906
G1 F13696.068
G1 X119.379 Y140.143 E.45449
; LINE_WIDTH: 0.502908
G1 X119.436 Y140.122 E.0023
; LINE_WIDTH: 0.545833
G1 F12527.018
G1 X119.493 Y140.1 E.00251
; LINE_WIDTH: 0.588758
G1 F11541.886
G1 X119.551 Y140.079 E.00272
; LINE_WIDTH: 0.631683
G1 F10700.401
G1 X119.608 Y140.057 E.00294
; LINE_WIDTH: 0.674608
G1 F9973.278
G1 X119.665 Y140.036 E.00315
; LINE_WIDTH: 0.728867
G1 F9184.39
G1 X119.723 Y140.014 E.00342
G1 X119.729 Y139.993 E.00123
M106 S252.45
; CHANGE_LAYER
; Z_HEIGHT: 3.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X119.723 Y140.014 E-.20066
G1 X119.665 Y140.036 E-.55934
; WIPE_END
M73 P63 R7
G1 E-.04 F1800
; layer num/total_layer_count: 27/58
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
G3 Z3.8 I1.124 J-.466 P1  F30000
G1 X115.716 Y130.5 Z3.8
G1 Z3.6
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F4138
G1 X115.055 Y130.5 E.0203
G1 X115.041 Y130.5 F30000
G1 F4138
G1 X115.044 Y129.899 E.01846
G3 X115.261 Y131.685 I-.209 J.932 E.07212
G1 X115.039 Y131.28 E.0142
G1 X115.041 Y130.56 E.02214
; WIPE_START
G1 F24000
G1 X115.044 Y129.899 E-.25113
G1 X115.526 Y130.171 E-.21037
G1 X115.784 Y130.708 E-.22636
G1 X115.751 Y130.895 E-.07214
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I.054 J-1.216 P1  F30000
G1 X106.918 Y130.5 Z4
G1 Z3.6
G1 E.8 F1800
G1 F4138
G1 X107.945 Y130.5 E.03156
G1 X107.952 Y130.5 F30000
G1 F4138
G1 X107.961 Y130.941 E.01356
G1 X106.994 Y130.92 E.02974
G3 X107.933 Y129.558 I.854 J-.416 E.06169
G1 X107.951 Y130.44 E.02709
; WIPE_START
G1 F24000
G1 X107.961 Y130.941 E-.19049
G1 X106.994 Y130.92 E-.36776
G1 X106.907 Y130.396 E-.20176
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I1.144 J.416 P1  F30000
G1 X107.961 Y127.499 Z4
G1 Z3.6
G1 E.8 F1800
G1 F4138
G1 X107.938 Y127.495 E.00072
G3 X107.533 Y125.74 I.134 J-.955 E.07139
G2 X107.371 Y125.383 I-.396 J-.035 E.01261
G3 X107.961 Y123.875 I.773 J-.567 E.0593
G1 X107.961 Y127.439 E.10952
G1 X107.945 Y125.5 F30000
G1 F4138
G1 X107.5 Y125.5 E.01369
; WIPE_START
G1 F24000
G1 X107.945 Y125.5 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I.405 J1.148 P1  F30000
G1 X115.039 Y123 Z4
G1 Z3.6
G1 E.8 F1800
G1 F4138
G1 X115.039 Y121.332 E.05125
G3 X115.613 Y121.199 I.52 J.941 E.01834
G3 X115.676 Y123.127 I-.025 J.966 E.08978
G3 X115.091 Y123.028 I-.125 J-1.032 E.01847
; WIPE_START
G1 F24000
G1 X115.039 Y121.332 E-.6447
G1 X115.334 Y121.264 E-.1153
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I1.156 J.381 P1  F30000
G1 X116.409 Y118 Z4
G1 Z3.6
G1 E.8 F1800
G1 F4138
G1 X115.055 Y118 E.04159
G1 X115.039 Y118 F30000
G1 F4138
G1 X115.039 Y116.696 E.04007
G3 X115.613 Y116.563 I.52 J.941 E.01834
G3 X115.676 Y118.491 I-.025 J.966 E.08978
G3 X115.039 Y118.364 I-.125 J-1.032 E.02031
G1 X115.039 Y118.06 E.00934
; WIPE_START
G1 F24000
G1 X115.039 Y116.696 E-.51829
G1 X115.613 Y116.563 E-.22392
G1 X115.658 Y116.573 E-.01779
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I-.008 J-1.217 P1  F30000
G1 X107.939 Y116.624 Z4
G1 Z3.6
G1 E.8 F1800
G1 F4138
G3 X107.939 Y114.69 I-.104 J-.967 E.10025
G1 X107.939 Y116.564 E.05758
G1 X107.945 Y115.5 F30000
G1 F4138
G1 X106.892 Y115.5 E.03237
; WIPE_START
G1 F24000
G1 X107.945 Y115.5 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I1.217 J.002 P1  F30000
G1 X107.958 Y105.59 Z4
G1 Z3.6
G1 E.8 F1800
G1 F4138
G3 X107.911 Y103.729 I.216 J-.936 E.07789
G1 X107.911 Y104.456 E.02234
G1 X107.955 Y105.53 E.03302
; WIPE_START
G1 F24000
G1 X107.435 Y105.273 E-.22039
G1 X107.215 Y104.721 E-.22599
G1 X107.376 Y104.138 E-.22989
G1 X107.525 Y103.975 E-.08374
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I-.247 J1.192 P1  F30000
G1 X115.039 Y105.53 Z4
G1 Z3.6
G1 E.8 F1800
G1 F4138
G1 X115.039 Y104.506 E.03146
G1 X115.133 Y103.766 E.02293
G3 X115.539 Y105.325 I-.328 J.918 E.05828
G2 X115.897 Y106.041 I5.366 J-2.234 E.02461
G3 X115.039 Y107.185 I-.978 J.16 E.04909
G1 X115.039 Y105.59 E.04902
G1 X115.055 Y105.5 F30000
G1 F4138
G1 X115.555 Y105.5 E.01538
; WIPE_START
G1 F24000
G1 X115.055 Y105.5 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I0 J1.217 P1  F30000
G1 X152.902 Y105.5 Z4
G1 Z3.6
G1 E.8 F1800
G1 F4138
G1 X152.055 Y105.5 E.02604
G1 X152.058 Y105.5 F30000
G1 F4138
G1 X152.09 Y103.802 E.05218
G3 X152.799 Y105.128 I-.422 J1.078 E.05027
G3 X152.039 Y106.551 I-.841 J.466 E.05886
G1 X152.057 Y105.56 E.03046
; WIPE_START
G1 F24000
G1 X152.09 Y103.802 E-.66814
G1 X152.303 Y103.917 E-.09186
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I-.272 J-1.186 P1  F30000
G1 X144.961 Y105.601 Z4
G1 Z3.6
G1 E.8 F1800
G1 F4138
G3 X144.911 Y103.714 I.162 J-.948 E.08131
G1 X144.911 Y104.456 E.02281
G1 X144.959 Y105.541 E.03336
; WIPE_START
G1 F24000
G1 X144.618 Y105.471 E-.13212
G1 X144.384 Y105.273 E-.11658
G1 X144.163 Y104.721 E-.22594
G1 X144.214 Y104.361 E-.13836
G1 X144.361 Y104.087 E-.11797
G1 X144.416 Y104.034 E-.02902
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I-1.217 J.012 P1  F30000
G1 X144.514 Y113.894 Z4
G1 Z3.6
G1 E.8 F1800
G1 F4138
G3 X144.961 Y114.027 I-.083 J1.096 E.01444
G1 X144.961 Y115.694 E.05125
G3 X144.455 Y113.89 I-.53 J-.824 E.11252
G1 X144.945 Y115.5 F30000
G1 F4138
G1 X143.719 Y115.5 E.03768
; WIPE_START
G1 F24000
G1 X144.945 Y115.5 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I-.704 J.992 P1  F30000
G1 X152.039 Y120.535 Z4
G1 Z3.6
G1 E.8 F1800
G1 F4138
G3 X152.613 Y120.402 I.52 J.941 E.01834
G3 X152.676 Y122.331 I-.025 J.966 E.08978
G3 X152.039 Y122.203 I-.125 J-1.032 E.02031
G1 X152.039 Y120.595 E.04941
; WIPE_START
G1 F24000
G1 X152.613 Y120.402 E-.23012
G1 X152.921 Y120.469 E-.11989
G1 X153.239 Y120.665 E-.14201
G1 X153.459 Y120.959 E-.13954
G1 X153.546 Y121.286 E-.12845
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I-1.215 J-.06 P1  F30000
G1 X153.088 Y130.5 Z4
G1 Z3.6
G1 E.8 F1800
G1 F4138
G1 X152.055 Y130.5 E.03174
G1 X152.039 Y130.5 F30000
G1 F4138
G1 X152.039 Y129.568 E.02865
G3 X152.198 Y129.562 I.12 J1.068 E.0049
G3 X153.026 Y130.893 I-.038 J.947 E.05673
G1 X152.039 Y130.892 E.03036
G1 X152.039 Y130.56 E.01021
; WIPE_START
G1 F24000
G1 X152.039 Y129.568 E-.37712
G1 X152.198 Y129.562 E-.06053
G1 X152.61 Y129.674 E-.16233
G1 X152.918 Y129.961 E-.16001
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I-.091 J-1.214 P1  F30000
G1 X144.961 Y130.56 Z4
G1 Z3.6
G1 E.8 F1800
G1 F4138
G1 X144.961 Y131.238 E.02084
G1 X144.749 Y131.653 E.01433
G3 X144.961 Y129.872 I.43 J-.852 E.07169
G1 X144.961 Y130.5 E.01931
G1 X144.945 Y130.5 F30000
G1 F4138
G1 X144.288 Y130.5 E.0202
; WIPE_START
G1 F24000
G1 X144.945 Y130.5 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I-.062 J-1.215 P1  F30000
G1 X114.101 Y132.08 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4138
G1 X114.265 Y132.468 E.01397
G2 X121.175 Y140.196 I15.758 J-7.137 E.34925
G1 X121.127 Y140.377 E.00622
G1 X106.88 Y140.377 E.4726
G3 X104.222 Y135.098 I21.691 J-14.23 E.19647
G3 X106.545 Y132.08 I2.319 J-.618 E.14592
G1 X114.041 Y132.08 E.24867
G1 X114.361 Y131.688 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4138
G1 X114.389 Y131.755 E.00223
G2 X123.133 Y140.769 I15.605 J-6.389 E.3954
G1 X106.67 Y140.769 E.50584
G3 X104.278 Y136.289 I22.149 J-14.705 E.15629
G3 X103.88 Y135.327 I7.238 J-3.558 E.03202
G3 X106.54 Y131.688 I2.673 J-.838 E.16094
G1 X114.301 Y131.688 E.23847
M204 S10000
; WIPE_START
G1 F24000
G1 X114.389 Y131.755 E-.04206
G1 X114.623 Y132.306 E-.22764
G1 X114.976 Y133.041 E-.31004
G1 X115.203 Y133.458 E-.18026
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I-.283 J-1.184 P1  F30000
G1 X114.457 Y133.636 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4138
G2 X115.289 Y135.035 I15.198 J-8.096 E.054
G1 X110.806 Y139.51 E.21012
G1 X104.76 Y133.464 E.28361
G2 X104.506 Y134.743 I1.821 J1.027 E.044
G2 X105.484 Y137.164 I17.26 J-5.564 E.08668
G1 X110.218 Y132.43 E.2221
G1 X111.401 Y132.429 E.03925
G1 X118.482 Y139.51 E.33216
G1 X118.938 Y139.062 E.02119
G3 X117.721 Y137.981 I18.964 J-22.556 E.054
G1 X119.987 Y139.946 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.384658
G1 F4138
G2 X120.68 Y140.16 I9.708 J-30.274 E.02021
G1 X121.339 Y140.341 F30000
; LINE_WIDTH: 0.298056
G1 F4138
G1 X122.181 Y140.557 E.01807
G1 X107.121 Y139.943 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502906
G1 F4138
G1 X119.245 Y139.943 E.45447
G1 X119.326 Y139.922 E.00312
; LINE_WIDTH: 0.545174
G1 X119.406 Y139.901 E.00341
; LINE_WIDTH: 0.612421
G1 X119.487 Y139.88 E.00386
G1 X119.522 Y139.765 E.00558
; WIPE_START
G1 F24000
G1 X119.487 Y139.88 E-.44916
G1 X119.406 Y139.901 E-.31084
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I1.171 J-.33 P1  F30000
G1 X109.102 Y103.376 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4138
G1 X109.102 Y103.08 E.00981
G1 X113.898 Y103.08 E.15909
G1 X113.898 Y103.376 E.00981
G1 X109.162 Y103.376 E.1571
G1 X108.71 Y103.768 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4138
G1 X108.71 Y102.688 E.03319
G1 X114.29 Y102.688 E.17146
G1 X114.29 Y103.768 E.03319
G1 X108.77 Y103.768 E.16961
M204 S10000
; WIPE_START
G1 F24000
G1 X108.71 Y102.688 E-.41103
G1 X109.628 Y102.688 E-.34897
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I-.022 J1.217 P1  F30000
G1 X148.5 Y103.376 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4138
G1 X146.102 Y103.376 E.07954
G1 X146.102 Y103.08 E.00981
G1 X150.898 Y103.08 E.15909
G1 X150.898 Y103.376 E.00981
G1 X148.56 Y103.376 E.07755
G1 X148.5 Y103.768 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4138
G1 X145.71 Y103.768 E.08573
G1 X145.71 Y102.688 E.03319
G1 X151.29 Y102.688 E.17146
G1 X151.29 Y103.768 E.03319
G1 X148.56 Y103.768 E.08389
M204 S10000
; WIPE_START
G1 F24000
G1 X146.56 Y103.768 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I-1.205 J.173 P1  F30000
G1 X150.63 Y132.082 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4138
G1 X153.582 Y132.083 E.09794
G3 X155.698 Y135.345 I-.125 J2.399 E.1503
G1 X155.09 Y136.785 E.05185
G3 X153.108 Y140.377 I-24.186 J-11.006 E.13621
G1 X138.871 Y140.377 E.47225
G1 X138.822 Y140.197 E.00619
G2 X145.899 Y132.08 I-8.828 J-14.84 E.36328
G1 X150.57 Y132.082 E.15493
G1 X150.63 Y131.69 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4138
G1 X153.601 Y131.691 E.09131
G3 X156.063 Y135.488 I-.146 J2.791 E.16203
G1 X155.448 Y136.946 E.04862
G3 X153.319 Y140.769 I-24.628 J-11.209 E.13459
G1 X136.873 Y140.769 E.50535
G2 X145.639 Y131.688 I-6.933 J-15.465 E.39742
G1 X150.57 Y131.69 E.1515
M204 S10000
; WIPE_START
G1 F24000
G1 X152.57 Y131.691 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I-.569 J-1.076 P1  F30000
G1 X143.759 Y136.356 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4138
G2 X144.711 Y135.035 I-16.207 J-12.684 E.05401
G1 X149.194 Y139.51 E.21012
G1 X155.24 Y133.464 E.28363
G3 X155.37 Y135.227 I-1.888 J1.025 E.06043
G3 X154.521 Y137.169 I-22.16 J-8.523 E.07035
G1 X149.782 Y132.43 E.22235
G1 X148.599 Y132.429 E.03925
G1 X141.518 Y139.51 E.33216
G1 X141.062 Y139.062 E.0212
G2 X142.279 Y137.982 I-14.461 J-17.52 E.054
G1 X137.82 Y140.554 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.205226
G1 F4138
G1 X138.659 Y140.345 E.01144
G1 X139.322 Y140.158 F30000
; LINE_WIDTH: 0.380203
G1 F4138
G2 X140.016 Y139.946 I-12.894 J-43.524 E.01995
G1 X140.527 Y139.729 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.739884
G1 F4138
G1 X140.557 Y139.824 E.0057
; LINE_WIDTH: 0.74064
G1 X140.623 Y139.848 E.004
; LINE_WIDTH: 0.693094
G1 X140.689 Y139.872 E.00372
; LINE_WIDTH: 0.645548
G1 X140.755 Y139.896 E.00345
; LINE_WIDTH: 0.598001
G1 X140.821 Y139.919 E.00318
; LINE_WIDTH: 0.503187
G1 X140.888 Y139.943 E.00264
G1 X152.814 Y139.943 E.44732
M106 S232.05
; CHANGE_LAYER
; Z_HEIGHT: 3.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X150.814 Y139.943 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 28/58
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
G3 Z4 I1.206 J.165 P1  F30000
G1 X152.105 Y130.5 Z4
G1 Z3.8
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
G1 X152.998 Y130.5 E.02743
G1 X152.997 Y130.5 F30000
G1 F9000
G1 X153.019 Y130.583 E.00265
G3 X152.908 Y131.015 I-.935 J-.01 E.01381
G1 X152.089 Y130.94 E.02529
G1 X152.127 Y129.639 E.04002
G3 X152.903 Y130.122 I-.043 J.935 E.02937
G1 X152.982 Y130.442 E.01012
; WIPE_START
M73 P63 R6
G1 F24000
M73 P64 R6
G1 X153.019 Y130.583 E-.05555
G1 X152.908 Y131.015 E-.16919
G1 X152.089 Y130.94 E-.31277
G1 X152.106 Y130.355 E-.22249
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I-.015 J-1.217 P1  F30000
G1 X144.911 Y130.442 Z4.2
G1 Z3.8
G1 E.8 F1800
G1 F9000
G1 X144.911 Y131.336 E.02747
G1 X144.761 Y131.607 E.00951
G3 X144.911 Y129.97 I.516 J-.778 E.06176
G1 X144.911 Y130.382 E.01267
G1 X144.895 Y130.5 F30000
G1 F9000
G1 X144.418 Y130.5 E.01465
; WIPE_START
G1 F24000
G1 X144.895 Y130.5 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I.917 J.8 P1  F30000
G1 X152.089 Y122.249 Z4.2
G1 Z3.8
G1 E.8 F1800
G1 F9000
G1 X152.099 Y120.486 E.05417
G3 X152.528 Y120.42 I.369 J.977 E.01341
G3 X152.59 Y122.313 I-.023 J.948 E.08826
G3 X152.144 Y122.269 I-.123 J-1.027 E.01389
; WIPE_START
G1 F24000
G1 X152.099 Y120.486 E-.67776
G1 X152.313 Y120.453 E-.08224
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I.613 J-1.051 P1  F30000
G1 X143.825 Y115.5 Z4.2
G1 Z3.8
G1 E.8 F1800
G1 F9000
G1 X144.895 Y115.5 E.03287
G1 X144.902 Y115.5 F30000
G1 F9000
G1 X144.9 Y115.744 E.0075
G3 X144.597 Y113.911 I-.392 J-.877 E.10786
G3 X144.911 Y113.981 I-.098 J1.179 E.00993
G1 X144.902 Y115.44 E.04483
; WIPE_START
G1 F24000
G1 X144.9 Y115.744 E-.11559
G1 X144.472 Y115.81 E-.16468
G1 X144.056 Y115.693 E-.16427
G1 X143.733 Y115.417 E-.16137
G1 X143.567 Y115.047 E-.15409
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I1.205 J.17 P1  F30000
G1 X144.911 Y105.51 Z4.2
G1 Z3.8
G1 E.8 F1800
G1 F9000
G1 X144.9 Y105.506 E.00036
G3 X144.911 Y103.738 I.329 J-.882 E.07056
G1 X144.911 Y105.45 E.05259
; WIPE_START
G1 F24000
G1 X144.9 Y105.506 E-.02178
G1 X144.467 Y105.184 E-.20489
G1 X144.286 Y104.63 E-.22172
G1 X144.447 Y104.117 E-.20414
G1 X144.666 Y103.938 E-.10746
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I-.246 J1.192 P1  F30000
G1 X152.092 Y105.473 Z4.2
G1 Z3.8
G1 E.8 F1800
G1 F9000
G1 X152.097 Y103.829 E.05051
G3 X152.648 Y105.081 I-.449 J.944 E.04579
G3 X152.089 Y106.498 I-.788 J.508 E.05462
G1 X152.092 Y105.533 E.02963
G1 X152.105 Y105.5 F30000
G1 F9000
G1 X152.78 Y105.5 E.02074
; WIPE_START
G1 F24000
G1 X152.105 Y105.5 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I-.028 J-1.217 P1  F30000
G1 X115.775 Y106.351 Z4.2
G1 Z3.8
G1 E.8 F1800
G1 F9000
G3 X115.089 Y107.144 I-.951 J-.129 E.0341
G1 X115.089 Y103.777 E.10346
G1 X115.14 Y103.803 E.00178
G3 X115.389 Y105.317 I-.423 J.847 E.05494
G2 X115.741 Y105.941 I1.69 J-.541 E.02219
G3 X115.781 Y106.291 I-.917 J.281 E.01089
; WIPE_START
G1 F24000
G1 X115.664 Y106.69 E-.15773
G1 X115.424 Y106.967 E-.13917
G1 X115.089 Y107.144 E-.14418
G1 X115.089 Y106.305 E-.31891
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I.137 J-1.209 P1  F30000
G1 X107.911 Y105.492 Z4.2
G1 Z3.8
G1 E.8 F1800
G1 F9000
G1 X107.888 Y105.483 E.00078
G3 X107.911 Y103.757 I.388 J-.858 E.06709
G1 X107.911 Y105.432 E.05148
; WIPE_START
G1 F24000
G1 X107.888 Y105.483 E-.02113
G1 X107.479 Y105.136 E-.20379
G1 X107.332 Y104.63 E-.20022
G1 X107.492 Y104.116 E-.20419
G1 X107.753 Y103.893 E-.13068
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I-1.214 J-.078 P1  F30000
G1 X107.01 Y115.5 Z4.2
G1 Z3.8
G1 E.8 F1800
G1 F9000
G1 X107.895 Y115.5 E.0272
G1 X107.911 Y115.5 F30000
G1 F9000
G1 X107.911 Y116.606 E.03399
G3 X107.911 Y114.708 I.019 J-.949 E.09048
G1 X107.911 Y115.44 E.0225
; WIPE_START
G1 F24000
G1 X107.911 Y116.606 E-.4432
G1 X107.549 Y116.517 E-.14194
G1 X107.247 Y116.306 E-.14003
G1 X107.196 Y116.229 E-.03482
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I-.064 J1.215 P1  F30000
G1 X115.1 Y116.646 Z4.2
G1 Z3.8
G1 E.8 F1800
G1 F9000
G3 X115.528 Y116.581 I.369 J.977 E.01341
G3 X115.59 Y118.474 I-.023 J.948 E.08826
G3 X115.089 Y118.409 I-.123 J-1.026 E.0157
G1 X115.099 Y116.706 E.05233
G1 X115.105 Y118 F30000
G1 F9000
G1 X116.305 Y118 E.03689
; WIPE_START
G1 F24000
G1 X115.105 Y118 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I-1.203 J.186 P1  F30000
G1 X115.606 Y121.233 Z4.2
G1 Z3.8
G1 E.8 F1800
G1 F9000
G1 X115.834 Y121.275 E.00712
G3 X115.59 Y123.11 I-.329 J.89 E.07864
G3 X115.089 Y123.045 I-.123 J-1.026 E.0157
G1 X115.1 Y121.282 E.05417
G3 X115.528 Y121.216 I.369 J.977 E.01341
G1 X115.547 Y121.221 E.00061
; WIPE_START
G1 F24000
G1 X115.834 Y121.275 E-.1109
G1 X116.145 Y121.474 E-.14025
G1 X116.361 Y121.763 E-.1371
G1 X116.452 Y122.107 E-.13508
G1 X116.406 Y122.458 E-.13475
G1 X116.274 Y122.691 E-.10193
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I-1.212 J-.107 P1  F30000
G1 X115.584 Y130.5 Z4.2
G1 Z3.8
G1 E.8 F1800
G1 F9000
G1 X115.105 Y130.5 E.01472
G1 X115.105 Y130.5 F30000
G1 F9000
G1 X115.114 Y130.003 E.01527
G3 X115.244 Y131.64 I-.378 J.854 E.06166
G1 X115.089 Y131.336 E.0105
G1 X115.103 Y130.56 E.02385
; WIPE_START
G1 F24000
G1 X115.114 Y130.003 E-.21168
G1 X115.489 Y130.302 E-.18229
G1 X115.67 Y130.797 E-.20031
G1 X115.581 Y131.224 E-.16573
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I.105 J-1.212 P1  F30000
G1 X107.911 Y130.56 Z4.2
G1 Z3.8
G1 E.8 F1800
G1 F9000
G1 X107.911 Y130.903 E.01053
G1 X107.058 Y130.922 E.02624
G3 X107.911 Y129.633 I.859 J-.359 E.05608
G1 X107.911 Y130.5 E.02664
G1 X107.895 Y130.5 F30000
G1 F9000
G1 X107.007 Y130.5 E.02727
; WIPE_START
G1 F24000
G1 X107.895 Y130.5 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I1.217 J.007 P1  F30000
G1 X107.911 Y127.461 Z4.2
G1 Z3.8
G1 E.8 F1800
G1 F9000
G3 X107.688 Y125.747 I.264 J-.906 E.06716
G2 X107.537 Y125.417 I-.325 J-.05 E.01178
G3 X107.911 Y123.943 I.709 J-.605 E.05469
G1 X107.911 Y127.401 E.10627
; WIPE_START
G1 F24000
G1 X107.461 Y127.161 E-.19388
G1 X107.238 Y126.671 E-.20448
G1 X107.319 Y126.151 E-.20016
G1 X107.605 Y125.837 E-.16148
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I-.174 J1.205 P1  F30000
G1 X150.898 Y132.08 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X153.455 Y132.08 E.08483
G3 X155.698 Y135.345 I.006 J2.399 E.1546
G1 X155.085 Y136.796 E.05225
G3 X153.239 Y140.177 I-24.248 J-11.047 E.12788
G1 X139.197 Y140.177 E.46578
G1 X139.146 Y140.001 E.00606
G2 X146.102 Y131.575 I-9.118 J-14.612 E.36882
G1 X146.102 Y131.278 E.00987
M204 S5000
; FEATURE: Overhang wall
M106 S255
G1 F3000
G1 X146.102 Y104.178 E.89896
M106 S232.05
M204 S10000
; FEATURE: Inner wall
G1 F15476.087
G1 X146.102 Y103.08 E.03642
G1 X150.898 Y103.08 E.15909
G1 X150.898 Y104.178 E.03642
M204 S5000
; FEATURE: Overhang wall
M106 S255
G1 F3000
G1 X150.898 Y131.278 E.89896
M106 S232.05
M204 S10000
; FEATURE: Inner wall
G1 F15476.087
G1 X150.898 Y131.66 E.01269
G1 X150.898 Y132.02 E.01193
G1 X151.29 Y131.688 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X153.46 Y131.688 E.06668
G3 X156.063 Y135.488 I.001 J2.791 E.16647
G1 X155.443 Y136.957 E.04899
G3 X153.45 Y140.569 I-24.457 J-11.136 E.12687
G1 X137.302 Y140.569 E.49618
G2 X145.71 Y131.52 I-7.373 J-15.282 E.38846
G1 X145.71 Y131.278 E.00745
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X145.71 Y104.178 E.89896
M106 S232.05
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X145.71 Y102.688 E.04578
G1 X151.29 Y102.688 E.17146
G1 X151.29 Y104.178 E.04578
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X151.29 Y131.278 E.89896
M106 S232.05
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X151.29 Y131.628 E.01075
M204 S10000
; WIPE_START
G1 F24000
G1 X153.289 Y131.683 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I-.297 J-1.18 P1  F30000
G1 X150.37 Y132.419 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.431162
M106 S255
G1 F3000
G1 X150.37 Y103.413 E.91765
G1 X149.981 Y103.413 E.01228
G1 X149.981 Y132.249 E.91228
G1 X149.593 Y132.249 E.01228
G1 X149.593 Y103.413 E.91228
G1 X149.205 Y103.413 E.01228
G1 X149.205 Y132.249 E.91228
G1 X148.817 Y132.249 E.01228
G1 X148.817 Y103.413 E.91228
G1 X148.428 Y103.413 E.01228
G1 X148.428 Y132.249 E.91228
G1 X148.04 Y132.249 E.01228
G1 X148.04 Y103.413 E.91228
G1 X147.652 Y103.413 E.01228
G1 X147.652 Y132.249 E.91228
G1 X147.264 Y132.249 E.01228
G1 X147.264 Y103.413 E.91228
G1 X146.875 Y103.413 E.01228
G1 X146.875 Y132.249 E.91228
G1 X146.487 Y132.249 E.01228
G1 X146.487 Y103.243 E.91765
M106 S232.05
; WIPE_START
G1 F24000
G1 X146.487 Y105.243 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I-1.212 J-.106 P1  F30000
G1 X143.759 Y136.356 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X144.712 Y135.036 I-54.189 J-40.129 E.05399
G1 X148.986 Y139.31 E.20049
G1 X149.394 Y139.31 E.01356
G1 X155.242 Y133.462 E.27431
G3 X155.37 Y135.226 I-1.853 J1.022 E.06053
G3 X154.516 Y137.164 I-17.382 J-6.504 E.07028
G1 X149.993 Y132.641 E.21217
G1 X148.387 Y132.641 E.0533
G1 X141.718 Y139.31 E.31282
G1 X141.31 Y139.31 E.01355
G1 X141.062 Y139.062 E.01161
G2 X142.277 Y137.979 I-13.266 J-16.109 E.054
G1 X138.198 Y140.354 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.225206
G1 F15000
G1 X138.984 Y140.146 E.01208
G1 X139.632 Y139.955 F30000
; LINE_WIDTH: 0.151716
G1 F15000
G1 X140.293 Y139.755 E.00613
G1 X140.743 Y139.743 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502938
G1 F13695.115
G1 X152.941 Y139.743 E.45727
; WIPE_START
G1 F24000
G1 X150.941 Y139.743 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I.219 J-1.197 P1  F30000
G1 X109.102 Y132.08 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X109.102 Y131.278 E.02661
M204 S5000
; FEATURE: Overhang wall
M106 S255
M73 P65 R6
G1 F3000
G1 X109.102 Y104.178 E.89896
M106 S232.05
M204 S10000
; FEATURE: Inner wall
G1 F15476.087
G1 X109.102 Y103.08 E.03642
G1 X113.898 Y103.08 E.15909
G1 X113.898 Y104.178 E.03642
M204 S5000
; FEATURE: Overhang wall
M106 S255
G1 F3000
G1 X113.898 Y131.278 E.89896
M106 S232.05
M204 S10000
; FEATURE: Inner wall
G1 F15476.087
G1 X113.898 Y131.575 E.00987
G2 X113.923 Y131.66 I.113 J.012 E.00302
G2 X120.857 Y140.001 I16.097 J-6.329 E.36597
G1 X120.806 Y140.177 E.00607
G1 X106.755 Y140.177 E.46609
G3 X104.234 Y135.142 I24.278 J-15.307 E.18708
G3 X106.545 Y132.08 I2.309 J-.661 E.14741
G1 X109.042 Y132.08 E.08284
G1 X108.71 Y131.688 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X108.71 Y131.278 E.0126
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X108.71 Y104.178 E.89896
M106 S232.05
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X108.71 Y102.688 E.04578
G1 X114.29 Y102.688 E.17146
G1 X114.29 Y104.178 E.04578
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X114.29 Y131.278 E.89896
M106 S232.05
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X114.29 Y131.483 E.0063
G2 X114.343 Y131.647 I.356 J-.025 E.00535
G2 X122.7 Y140.569 I15.718 J-6.347 E.38427
G1 X106.539 Y140.569 E.49656
G3 X103.856 Y135.248 I22.931 J-14.901 E.18346
G3 X106.54 Y131.688 I2.686 J-.767 E.15863
G1 X108.65 Y131.688 E.06484
M204 S10000
; WIPE_START
G1 F24000
G1 X108.71 Y131.278 E-.15746
G1 X108.71 Y129.692 E-.60254
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I-.601 J1.058 P1  F30000
G1 X113.513 Y132.419 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.431162
M106 S255
G1 F3000
G1 X113.513 Y103.413 E.91765
G1 X113.125 Y103.413 E.01228
G1 X113.125 Y132.249 E.91228
G1 X112.736 Y132.249 E.01228
G1 X112.736 Y103.413 E.91228
G1 X112.348 Y103.413 E.01228
G1 X112.348 Y132.249 E.91228
G1 X111.96 Y132.249 E.01228
G1 X111.96 Y103.413 E.91228
G1 X111.572 Y103.413 E.01228
G1 X111.572 Y132.249 E.91228
G1 X111.183 Y132.249 E.01228
G1 X111.184 Y103.413 E.91228
G1 X110.795 Y103.413 E.01228
G1 X110.795 Y132.249 E.91228
G1 X110.407 Y132.249 E.01228
G1 X110.407 Y103.413 E.91228
G1 X110.019 Y103.413 E.01228
G1 X110.019 Y132.249 E.91228
G1 X109.631 Y132.249 E.01228
G1 X109.631 Y103.243 E.91765
M106 S232.05
; WIPE_START
G1 F24000
G1 X109.631 Y105.243 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I-1.19 J.253 P1  F30000
G1 X116.244 Y136.353 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X115.288 Y135.036 I30.398 J-23.05 E.05399
G1 X111.014 Y139.31 E.20049
G1 X110.606 Y139.31 E.01355
G1 X104.759 Y133.463 E.27427
G2 X104.507 Y134.744 I2.299 J1.119 E.04379
G2 X105.479 Y137.17 I17.688 J-5.68 E.08675
G1 X110.007 Y132.641 E.21242
G1 X111.613 Y132.641 E.0533
G1 X118.282 Y139.31 E.31282
G1 X116.653 Y139.31 E.05401
G1 X119.703 Y139.753 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.162812
G1 F15000
G1 X120.369 Y139.955 E.0068
G1 X121.086 Y139.916 F30000
; LINE_WIDTH: 0.1412
G1 F15000
G1 X121.263 Y140.373 E.00392
G1 X106.996 Y139.743 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502898
G1 F13696.308
G1 X118.856 Y139.743 E.44454
G1 X118.92 Y139.718 E.00258
; LINE_WIDTH: 0.546233
G1 F12517.066
G1 X118.984 Y139.693 E.00283
; LINE_WIDTH: 0.589568
G1 F11524.792
G1 X119.049 Y139.669 E.00307
; LINE_WIDTH: 0.632903
G1 F10678.285
G1 X119.113 Y139.644 E.00331
; LINE_WIDTH: 0.695114
G1 F9659.71
G2 X119.193 Y139.568 I.01 J-.07 E.00673
M106 S252.45
; CHANGE_LAYER
; Z_HEIGHT: 4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X119.177 Y139.619 E-.33105
G1 X119.113 Y139.644 E-.42895
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 29/58
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
G3 Z4.2 I.278 J1.185 P1  F30000
G1 X151.29 Y132.08 Z4.2
M73 P66 R6
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9784
G1 X153.455 Y132.08 E.07182
G3 X155.698 Y135.345 I.006 J2.399 E.1546
G1 X155.08 Y136.807 E.05265
G3 X153.37 Y139.977 I-24.723 J-11.292 E.11955
G1 X139.509 Y139.977 E.45981
G1 X139.457 Y139.801 E.00606
G2 X146.102 Y131.6 I-9.54 J-14.522 E.35577
G1 X146.102 Y103.08 E.94606
G1 X150.898 Y103.08 E.15909
G1 X150.898 Y132.08 E.96198
G1 X151.23 Y132.08 E.01102
G1 X151.29 Y131.688 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9784
G1 X153.46 Y131.688 E.06668
G3 X156.063 Y135.488 I.001 J2.791 E.16647
G1 X155.438 Y136.968 E.04937
G3 X153.581 Y140.369 I-24.535 J-11.185 E.11915
G1 X137.703 Y140.369 E.4879
G2 X145.71 Y131.52 I-7.774 J-15.082 E.3747
G1 X145.71 Y102.688 E.88595
G1 X151.29 Y102.688 E.17146
G1 X151.29 Y131.628 E.88925
M204 S10000
; WIPE_START
G1 F24000
G1 X153.289 Y131.683 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I.187 J-1.202 P1  F30000
G1 X148.346 Y130.913 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.351907
G1 F9784
G1 X148.654 Y130.913 E.00778
G1 X148.654 Y105.323 E.6443
G1 X148.346 Y105.323 E.00778
G1 X148.346 Y130.853 E.64279
G1 X148.002 Y131.256 F30000
; LINE_WIDTH: 0.419999
G1 F9784
G1 X148.998 Y131.256 E.03058
G1 X148.998 Y104.98 E.80737
G1 X148.002 Y104.98 E.03058
G1 X148.002 Y131.196 E.80553
G1 X147.625 Y131.633 F30000
G1 F9784
G1 X149.375 Y131.633 E.05375
G1 X149.375 Y104.603 E.83054
G1 X147.625 Y104.603 E.05375
G1 X147.625 Y131.573 E.8287
G1 X147.248 Y131.641 F30000
G1 F9784
G1 X147.171 Y132.01 E.01157
G1 X149.752 Y132.01 E.07929
G1 X149.752 Y104.226 E.85371
G1 X147.248 Y104.226 E.07692
G1 X147.248 Y131.581 E.84054
G1 X146.597 Y132.387 F30000
G1 F9784
G1 X150.232 Y132.387 E.1117
G1 X150.129 Y132.283 E.00451
G1 X150.129 Y103.849 E.8737
G1 X146.871 Y103.849 E.10009
G1 X146.871 Y131.641 E.85397
G1 X146.824 Y131.868 E.00711
G1 X146.621 Y132.332 E.01557
G1 X146.021 Y132.764 F30000
; LINE_WIDTH: 0.41865
G1 F9784
G1 X150.025 Y132.764 E.1226
G2 X151.202 Y132.785 I.929 J-18.735 E.03605
G1 X151.32 Y132.736 E.00392
G1 X151.597 Y132.455 E.01208
G1 X150.694 Y132.451 E.02764
G1 X150.506 Y132.283 E.00771
G1 X150.506 Y103.472 E.88212
G1 X146.494 Y103.472 E.12283
G1 X146.494 Y131.641 E.86246
G1 X146.478 Y131.717 E.00236
G1 X146.045 Y132.709 E.03316
G1 X143.759 Y136.355 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F9784
G2 X144.712 Y135.036 I-49.471 J-36.705 E.05399
G1 X148.786 Y139.11 E.19112
G1 X149.594 Y139.11 E.02682
G1 X155.24 Y133.464 E.26486
G3 X155.37 Y135.226 I-2.036 J1.036 E.0602
G3 X154.522 Y137.17 I-22.372 J-8.61 E.07036
G1 X150.508 Y133.156 E.18829
G1 X147.872 Y133.156 E.08745
G1 X141.918 Y139.11 E.2793
G1 X141.11 Y139.11 E.02682
G1 X141.062 Y139.062 E.00223
G2 X142.277 Y137.979 I-13.419 J-16.278 E.054
G1 X138.552 Y140.158 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.353546
G1 F9784
G1 X139.295 Y139.947 E.01956
G1 X139.928 Y139.755 F30000
; LINE_WIDTH: 0.189662
G1 F9784
G1 X140.56 Y139.554 E.00794
G1 X141.012 Y139.543 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502918
G1 F9784
G1 X153.062 Y139.543 E.45169
; WIPE_START
G1 F24000
G1 X151.062 Y139.543 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I.213 J-1.198 P1  F30000
G1 X109.102 Y132.08 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9784
G1 X109.102 Y103.08 E.96198
G1 X113.898 Y103.08 E.15909
G1 X113.898 Y131.6 E.94606
G2 X120.544 Y139.801 I16.138 J-6.285 E.35582
G1 X120.493 Y139.977 E.00607
G1 X106.628 Y139.977 E.45991
G3 X104.234 Y135.143 I24.621 J-15.204 E.17918
G3 X106.545 Y132.08 I2.318 J-.655 E.14726
G1 X109.042 Y132.08 E.08284
G1 X108.71 Y131.688 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9784
G1 X108.71 Y102.688 E.89109
G1 X114.29 Y102.688 E.17146
G1 X114.29 Y131.52 E.88595
G2 X122.298 Y140.369 I15.726 J-6.184 E.37479
G1 X106.412 Y140.369 E.48815
G3 X103.857 Y135.25 I22.924 J-14.639 E.17613
G3 X106.54 Y131.688 I2.698 J-.759 E.15845
G1 X108.65 Y131.688 E.06484
M204 S10000
; WIPE_START
G1 F24000
G1 X108.654 Y129.688 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I-.46 J1.127 P1  F30000
G1 X111.654 Y130.913 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.351907
G1 F9784
G1 X111.654 Y105.323 E.6443
G1 X111.346 Y105.323 E.00778
G1 X111.346 Y130.913 E.6443
G1 X111.594 Y130.913 E.00627
G1 X111.998 Y131.256 F30000
; LINE_WIDTH: 0.419999
G1 F9784
G1 X111.998 Y104.98 E.80737
G1 X111.002 Y104.98 E.03058
G1 X111.002 Y131.256 E.80737
G1 X111.938 Y131.256 E.02873
G1 X112.375 Y131.633 F30000
G1 F9784
G1 X112.375 Y104.603 E.83054
G1 X110.625 Y104.603 E.05375
G1 X110.625 Y131.633 E.83054
G1 X112.315 Y131.633 E.0519
G1 X112.752 Y131.641 F30000
G1 F9784
G1 X112.752 Y104.226 E.84239
G1 X110.248 Y104.226 E.07692
G1 X110.248 Y132.01 E.85371
G2 X112.825 Y132.009 I1.067 J-567.506 E.07918
G1 X112.763 Y131.7 E.00968
G1 X113.396 Y132.387 F30000
G1 F9784
G1 X113.173 Y131.862 E.01753
G1 X113.129 Y131.641 E.00691
G1 X113.129 Y103.849 E.85397
G1 X109.871 Y103.849 E.10009
G1 X109.871 Y132.283 E.8737
G1 X109.784 Y132.387 E.00416
G1 X113.336 Y132.387 E.10913
G1 X113.973 Y132.764 F30000
; LINE_WIDTH: 0.418396
G1 F9784
G1 X113.521 Y131.715 E.03496
G1 X113.506 Y130.758 E.02927
G1 X113.506 Y103.472 E.83486
G1 X109.494 Y103.472 E.12274
G1 X109.494 Y132.283 E.88152
G1 X109.306 Y132.451 E.00771
G2 X108.404 Y132.461 I-.238 J18.389 E.02759
G1 X108.761 Y132.785 E.01475
G3 X113.913 Y132.764 I3.672 J264.548 E.15763
G1 X114.457 Y133.636 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F9784
G2 X115.288 Y135.036 I12.143 J-6.269 E.05402
G1 X111.214 Y139.11 E.19112
G1 X110.406 Y139.11 E.02682
G1 X104.76 Y133.463 E.26488
G2 X104.507 Y134.745 I2.296 J1.118 E.04383
M73 P67 R6
G2 X105.478 Y137.17 I17.873 J-5.756 E.0867
G1 X109.492 Y133.156 E.18829
G1 X112.128 Y133.156 E.08745
G1 X118.082 Y139.11 E.2793
G1 X118.89 Y139.11 E.02682
G1 X118.939 Y139.061 E.0023
G3 X117.724 Y137.978 I9.916 J-12.357 E.054
G1 X119.516 Y139.333 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.218444
G1 F9784
G1 X119.655 Y139.773 E.0066
G1 X120.705 Y139.948 F30000
; LINE_WIDTH: 0.28175
G1 F9784
G1 X121.452 Y140.157 E.01509
G1 X106.876 Y139.543 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50291
G1 F9784
G1 X118.951 Y139.543 E.4526
; CHANGE_LAYER
; Z_HEIGHT: 4.08
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F24000
G1 X116.951 Y139.543 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 30/58
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
G3 Z4.4 I1.189 J-.26 P1  F30000
G1 X115.212 Y131.597 Z4.4
G1 Z4.08
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.28
G1 F9000
G1 X115.08 Y131.338 E.01192
G1 X115.115 Y130.101 E.05084
G3 X115.257 Y131.558 I-.477 J.782 E.06969
; WIPE_START
G1 F24000
G1 X115.08 Y131.338 E-.10729
G1 X115.115 Y130.101 E-.47048
G1 X115.411 Y130.386 E-.15633
G1 X115.432 Y130.451 E-.02589
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.48 I-.074 J-1.215 P1  F30000
G1 X107.92 Y130.911 Z4.48
G1 Z4.08
G1 E.8 F1800
G1 F9000
G1 X107.122 Y130.929 E.0328
G3 X107.92 Y129.709 I.862 J-.307 E.06927
G1 X107.92 Y130.851 E.04687
; WIPE_START
G1 F24000
G1 X107.122 Y130.929 E-.3049
G1 X107.076 Y130.518 E-.1571
G1 X107.21 Y130.132 E-.15535
G1 X107.476 Y129.867 E-.14265
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.48 I1.197 J.218 P1  F30000
G1 X107.92 Y127.426 Z4.48
G1 Z4.08
G1 E.8 F1800
G1 F9000
G3 X107.84 Y125.76 I.358 J-.852 E.08542
G2 X107.662 Y125.404 I-.374 J-.035 E.01724
G3 X107.92 Y124.008 I.692 J-.594 E.06683
G1 X107.92 Y127.366 E.13789
; WIPE_START
G1 F24000
G1 X107.542 Y127.124 E-.17072
G1 X107.353 Y126.631 E-.20044
G1 X107.467 Y126.126 E-.19684
G1 X107.828 Y125.773 E-.19199
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.48 I.427 J1.14 P1  F30000
G1 X115.08 Y123.056 Z4.48
G1 Z4.08
G1 E.8 F1800
G1 F9000
G1 X115.08 Y121.276 E.07309
G3 X115.441 Y121.232 I.315 J1.091 E.015
G3 X115.502 Y123.094 I-.021 J.932 E.11609
G3 X115.137 Y123.072 I-.121 J-1.024 E.0151
; WIPE_START
G1 F24000
G1 X115.08 Y121.276 E-.68274
G1 X115.282 Y121.252 E-.07726
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.48 I1.213 J.096 P1  F30000
G1 X115.502 Y118.458 Z4.48
G1 Z4.08
G1 E.8 F1800
G1 F9000
G3 X115.08 Y118.42 I-.121 J-1.024 E.01754
G1 X115.08 Y116.64 E.07309
G3 X115.441 Y116.596 I.315 J1.091 E.015
G3 X115.561 Y118.451 I-.021 J.932 E.11366
; WIPE_START
G1 F24000
G1 X115.08 Y118.42 E-.18324
G1 X115.08 Y116.902 E-.57676
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.48 I.055 J-1.216 P1  F30000
G1 X107.92 Y116.58 Z4.48
G1 Z4.08
G1 E.8 F1800
G1 F9000
G3 X107.92 Y114.734 I.106 J-.923 E.1111
G1 X107.92 Y116.52 E.07334
; WIPE_START
G1 F24000
G1 X107.601 Y116.475 E-.12245
G1 X107.318 Y116.251 E-.13726
G1 X107.163 Y115.999 E-.11223
G1 X107.095 Y115.657 E-.13252
G1 X107.163 Y115.315 E-.13252
G1 X107.318 Y115.063 E-.11223
G1 X107.34 Y115.046 E-.01078
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.48 I1.215 J.073 P1  F30000
G1 X107.92 Y105.401 Z4.48
G1 Z4.08
G1 E.8 F1800
G1 F9000
G3 X107.92 Y103.793 I.451 J-.804 E.08021
G1 X107.92 Y105.341 E.06356
; WIPE_START
G1 F24000
G1 X107.561 Y105.047 E-.17632
G1 X107.447 Y104.599 E-.17553
G1 X107.573 Y104.146 E-.17869
G1 X107.92 Y103.793 E-.18812
G1 X107.92 Y103.902 E-.04134
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.48 I-.242 J1.193 P1  F30000
G1 X115.084 Y105.358 Z4.48
G1 Z4.08
G1 E.8 F1800
G1 F9000
G1 X115.088 Y103.816 E.06331
G3 X115.237 Y105.312 I-.465 J.802 E.07199
G2 X115.446 Y105.653 I.527 J-.088 E.01685
G3 X115.08 Y107.103 I-.707 J.592 E.07157
G1 X115.084 Y105.418 E.06919
; WIPE_START
G1 F24000
G1 X115.088 Y103.816 E-.60877
G1 X115.374 Y104.093 E-.15123
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.48 I-.052 J1.216 P1  F30000
G1 X152.085 Y105.67 Z4.48
G1 Z4.08
G1 E.8 F1800
G1 F9000
G1 X152.098 Y103.867 E.07406
G3 X152.52 Y105.068 I-.56 J.872 E.0563
G3 X152.08 Y106.446 I-.76 J.516 E.06834
G1 X152.085 Y105.73 E.02936
; WIPE_START
G1 F24000
G1 X152.098 Y103.867 E-.70818
G1 X152.201 Y103.956 E-.05182
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.48 I-.24 J-1.193 P1  F30000
G1 X144.92 Y105.421 Z4.48
G1 Z4.08
G1 E.8 F1800
G1 F9000
G1 X144.9 Y105.411 E.00094
G3 X144.92 Y103.77 I.432 J-.815 E.08306
G1 X144.92 Y105.361 E.06533
; WIPE_START
G1 F24000
G1 X144.9 Y105.411 E-.02057
G1 X144.551 Y105.096 E-.17848
G1 X144.407 Y104.599 E-.19685
G1 X144.532 Y104.146 E-.17863
G1 X144.883 Y103.806 E-.18547
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.48 I-1.217 J-.024 P1  F30000
G1 X144.682 Y113.927 Z4.48
G1 Z4.08
G1 E.8 F1800
G1 F9000
G3 X144.92 Y113.97 I-.122 J1.34 E.00995
G1 X144.92 Y115.75 E.07309
G3 X144.623 Y113.923 I-.327 J-.885 E.13666
; WIPE_START
G1 F24000
G1 X144.92 Y113.97 E-.11422
G1 X144.92 Y115.67 E-.64578
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.48 I-.679 J1.01 P1  F30000
G1 X152.08 Y120.479 Z4.48
G1 Z4.08
G1 E.8 F1800
G1 F9000
G3 X152.441 Y120.436 I.315 J1.091 E.01499
G3 X152.502 Y122.297 I-.021 J.932 E.11609
G3 X152.08 Y122.259 I-.121 J-1.024 E.01753
G1 X152.08 Y120.539 E.07063
; WIPE_START
G1 F24000
G1 X152.441 Y120.436 E-.14271
G1 X152.74 Y120.5 E-.11623
G1 X153.048 Y120.69 E-.13753
G1 X153.262 Y120.973 E-.13489
G1 X153.352 Y121.311 E-.13282
G1 X153.319 Y121.561 E-.09582
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.48 I-1.204 J-.177 P1  F30000
G1 X152.119 Y129.717 Z4.48
G1 Z4.08
G1 E.8 F1800
G1 F9000
G3 X152.85 Y131.018 I-.103 J.914 E.07149
G1 X152.08 Y130.948 E.03176
G1 X152.117 Y129.777 E.04811
; WIPE_START
G1 F24000
G1 X152.507 Y129.851 E-.15084
G1 X152.824 Y130.187 E-.17573
G1 X152.933 Y130.582 E-.1557
G1 X152.85 Y131.018 E-.16851
G1 X152.564 Y130.992 E-.10922
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.48 I.147 J-1.208 P1  F30000
G1 X144.92 Y130.061 Z4.48
G1 Z4.08
G1 E.8 F1800
G1 F9000
G1 X144.92 Y131.338 E.05244
G1 X144.801 Y131.57 E.0107
G3 X144.87 Y130.092 I.57 J-.714 E.07081
; CHANGE_LAYER
; Z_HEIGHT: 4.2
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F24000
G1 X144.92 Y131.338 E-.47395
G1 X144.801 Y131.57 E-.09905
G1 X144.53 Y131.203 E-.17374
G1 X144.524 Y131.168 E-.01327
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 31/58
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
G3 Z4.48 I-.099 J1.213 P1  F30000
G1 X150.898 Y131.688 Z4.48
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F12003
G1 X150.898 Y132.08 E.01301
G1 X153.455 Y132.08 E.08483
G3 X155.698 Y135.345 I.006 J2.399 E.1546
G1 X155.075 Y136.818 E.05306
G3 X153.5 Y139.777 I-32.218 J-15.258 E.11121
G1 X139.805 Y139.777 E.45428
G1 X139.751 Y139.605 E.00596
G2 X146.102 Y131.6 I-9.85 J-14.335 E.34403
G1 X146.102 Y103.08 E.94606
G1 X150.898 Y103.08 E.15909
G1 X150.898 Y131.628 E.94699
G1 X151.29 Y131.688 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X153.46 Y131.688 E.06668
G3 X156.063 Y135.488 I.001 J2.791 E.16647
G1 X155.433 Y136.979 E.04974
G3 X153.712 Y140.169 I-25.04 J-11.445 E.11143
G1 X138.081 Y140.169 E.48032
G2 X145.71 Y131.52 I-8.117 J-14.85 E.36161
G1 X145.71 Y102.688 E.88594
G1 X151.29 Y102.688 E.17146
G1 X151.29 Y131.628 E.88925
M204 S10000
; WIPE_START
G1 F24000
G1 X153.289 Y131.683 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I.187 J-1.202 P1  F30000
G1 X148.346 Y130.913 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.351907
G1 F12003
G1 X148.654 Y130.913 E.00778
G1 X148.654 Y105.323 E.6443
G1 X148.346 Y105.323 E.00778
G1 X148.346 Y130.853 E.64279
G1 X148.002 Y131.256 F30000
; LINE_WIDTH: 0.419999
G1 F12003
G1 X148.998 Y131.256 E.03058
G1 X148.998 Y104.98 E.80737
G1 X148.002 Y104.98 E.03058
G1 X148.002 Y131.196 E.80553
G1 X147.625 Y131.633 F30000
G1 F12003
G1 X149.375 Y131.633 E.05375
G1 X149.375 Y104.603 E.83054
G1 X147.625 Y104.603 E.05375
G1 X147.625 Y131.573 E.8287
G1 X147.248 Y131.641 F30000
G1 F12003
G1 X147.171 Y132.01 E.01157
G1 X149.752 Y132.01 E.07929
G1 X149.752 Y104.226 E.85371
G1 X147.248 Y104.226 E.07692
G1 X147.248 Y131.581 E.84054
G1 X146.597 Y132.387 F30000
G1 F12003
G1 X150.232 Y132.387 E.1117
G1 X150.129 Y132.283 E.00451
G1 X150.129 Y103.849 E.8737
G1 X146.871 Y103.849 E.10009
G1 X146.871 Y131.641 E.85397
G1 X146.824 Y131.868 E.00711
G1 X146.621 Y132.332 E.01557
G1 X146.021 Y132.764 F30000
; LINE_WIDTH: 0.41865
G1 F12003
G1 X150.025 Y132.764 E.1226
G2 X151.202 Y132.785 I.929 J-18.735 E.03605
G1 X151.32 Y132.736 E.00392
G1 X151.597 Y132.455 E.01208
G1 X150.694 Y132.451 E.02764
G1 X150.506 Y132.283 E.00771
G1 X150.506 Y103.472 E.88212
G1 X146.494 Y103.472 E.12283
G1 X146.494 Y131.641 E.86246
G1 X146.478 Y131.717 E.00236
G1 X146.045 Y132.709 E.03316
G1 X143.759 Y136.355 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12003
G2 X144.711 Y135.035 I-43.954 J-32.721 E.05399
G1 X148.586 Y138.91 E.18175
G1 X149.794 Y138.91 E.04009
G1 X155.237 Y133.467 E.25535
G3 X155.368 Y135.23 I-2.122 J1.044 E.06013
G3 X154.522 Y137.17 I-22.432 J-8.637 E.07022
G1 X150.508 Y133.156 E.18829
G1 X147.872 Y133.156 E.08745
G1 X142.118 Y138.91 E.26991
G1 X143.747 Y138.91 E.05401
G1 X138.89 Y139.954 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.139192
G1 F12003
G1 X139.592 Y139.754 E.00573
G1 X140.841 Y139.343 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502868
G1 F12003
G1 X153.189 Y139.343 E.46282
; WIPE_START
G1 F24000
G1 X151.189 Y139.343 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I.207 J-1.199 P1  F30000
G1 X109.102 Y132.08 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F12003
G1 X109.102 Y103.08 E.96198
G1 X113.898 Y103.08 E.15909
G1 X113.898 Y131.6 E.94606
G2 X120.253 Y139.606 I16.139 J-6.284 E.3442
G1 X120.199 Y139.777 E.00593
G1 X106.504 Y139.777 E.45427
G3 X104.233 Y135.141 I22.918 J-14.1 E.17149
G3 X106.545 Y132.08 I2.31 J-.659 E.14736
G1 X109.042 Y132.08 E.08284
G1 X108.71 Y131.688 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X108.71 Y102.688 E.89109
G1 X114.29 Y102.688 E.17146
G1 X114.29 Y131.52 E.88594
G2 X121.915 Y140.169 I15.787 J-6.233 E.36147
G1 X106.286 Y140.169 E.48022
G3 X103.856 Y135.25 I22.984 J-14.414 E.16888
G3 X106.54 Y131.688 I2.688 J-.767 E.15864
G1 X108.65 Y131.688 E.06484
M204 S10000
; WIPE_START
G1 F24000
G1 X108.654 Y129.688 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I-.46 J1.127 P1  F30000
M73 P68 R6
G1 X111.654 Y130.913 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.351907
G1 F12003
G1 X111.654 Y105.323 E.6443
G1 X111.346 Y105.323 E.00778
G1 X111.346 Y130.913 E.6443
G1 X111.594 Y130.913 E.00627
G1 X111.998 Y131.256 F30000
; LINE_WIDTH: 0.419999
G1 F12003
G1 X111.998 Y104.98 E.80737
G1 X111.002 Y104.98 E.03058
G1 X111.002 Y131.256 E.80737
G1 X111.938 Y131.256 E.02873
G1 X112.375 Y131.633 F30000
G1 F12003
G1 X112.375 Y104.603 E.83054
G1 X110.625 Y104.603 E.05375
G1 X110.625 Y131.633 E.83054
G1 X112.315 Y131.633 E.0519
G1 X112.752 Y131.641 F30000
G1 F12003
G1 X112.752 Y104.226 E.84239
G1 X110.248 Y104.226 E.07692
G1 X110.248 Y132.01 E.85371
G2 X112.825 Y132.009 I1.067 J-547.284 E.07918
G1 X112.763 Y131.7 E.00968
G1 X113.396 Y132.387 F30000
G1 F12003
G1 X113.173 Y131.862 E.01753
G1 X113.129 Y131.641 E.00691
G1 X113.129 Y103.849 E.85397
G1 X109.871 Y103.849 E.10009
G1 X109.871 Y132.283 E.8737
G1 X109.784 Y132.387 E.00416
G1 X113.336 Y132.387 E.10913
G1 X113.973 Y132.764 F30000
; LINE_WIDTH: 0.418396
G1 F12003
G1 X113.521 Y131.715 E.03496
G1 X113.506 Y130.758 E.02927
G1 X113.506 Y103.472 E.83486
G1 X109.494 Y103.472 E.12274
G1 X109.494 Y132.283 E.88152
G1 X109.306 Y132.451 E.00771
G2 X108.404 Y132.461 I-.238 J18.382 E.02759
G1 X108.761 Y132.785 E.01475
G3 X113.913 Y132.764 I3.672 J264.542 E.15763
G1 X116.177 Y136.272 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12003
G3 X115.652 Y135.574 I6.888 J-5.724 E.029
G1 X115.541 Y135.645 E.00436
G1 X115.202 Y135.122 E.02067
G1 X111.414 Y138.91 E.17768
G1 X110.206 Y138.91 E.04009
G1 X104.762 Y133.466 E.2554
G2 X104.502 Y134.703 I1.841 J1.032 E.0426
G2 X105.484 Y137.164 I12.918 J-3.727 E.08804
G1 X109.492 Y133.156 E.18802
G1 X112.128 Y133.156 E.08745
G1 X117.882 Y138.91 E.26991
G1 X116.253 Y138.91 E.05401
G1 X119.184 Y139.357 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.221742
G1 F12003
G1 X119.792 Y139.557 E.00932
G1 X106.756 Y139.343 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50291
G1 F12003
G1 X118.673 Y139.343 E.44669
; CHANGE_LAYER
; Z_HEIGHT: 4.36
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F24000
G1 X116.673 Y139.343 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 32/58
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
G3 Z4.6 I1.195 J-.229 P1  F30000
G1 X115.179 Y131.531 Z4.6
G1 Z4.36
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.28
G1 F9000
G1 X115.08 Y131.338 E.0089
G1 X115.101 Y130.215 E.04613
G3 X115.219 Y131.488 I-.558 J.693 E.05854
; WIPE_START
G1 F24000
G1 X115.08 Y131.338 E-.07742
G1 X115.101 Y130.215 E-.42693
G1 X115.323 Y130.475 E-.13009
G1 X115.415 Y130.793 E-.12556
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.76 I-.018 J-1.217 P1  F30000
G1 X107.92 Y130.902 Z4.76
G1 Z4.36
G1 E.8 F1800
G1 F9000
G1 X107.186 Y130.906 E.03013
G3 X107.92 Y129.798 I.859 J-.228 E.06166
G1 X107.92 Y130.842 E.04287
; WIPE_START
G1 F24000
G1 X107.186 Y130.906 E-.2799
G1 X107.172 Y130.522 E-.14633
G1 X107.294 Y130.202 E-.12984
G1 X107.573 Y129.923 E-.1501
G1 X107.707 Y129.875 E-.05382
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.76 I1.213 J.103 P1  F30000
G1 X107.92 Y127.363 Z4.76
G1 Z4.36
G1 E.8 F1800
G1 F9000
G3 X107.92 Y125.827 I.45 J-.768 E.07608
G1 X107.92 Y127.303 E.06061
G1 X107.92 Y125.509 F30000
G1 F9000
G1 X107.918 Y125.507 E.0001
G3 X107.92 Y124.109 I.542 J-.699 E.06625
G1 X107.92 Y125.449 E.05503
; WIPE_START
G1 F24000
G1 X107.918 Y125.507 E-.02223
G1 X107.663 Y125.193 E-.15358
G1 X107.574 Y124.809 E-.15013
G1 X107.664 Y124.423 E-.15041
G1 X107.92 Y124.109 E-.15407
G1 X107.92 Y124.45 E-.12958
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.76 I.233 J1.194 P1  F30000
G1 X115.08 Y123.054 Z4.76
G1 Z4.36
G1 E.8 F1800
G1 F9000
G1 X115.08 Y121.278 E.0729
G3 X115.351 Y121.257 I.215 J.99 E.01121
G3 X115.411 Y123.07 I-.018 J.908 E.11321
G3 X115.139 Y123.064 I-.112 J-1.111 E.01121
; WIPE_START
G1 F24000
G1 X115.08 Y121.278 E-.67888
G1 X115.293 Y121.261 E-.08112
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.76 I1.217 J.03 P1  F30000
G1 X115.362 Y118.431 Z4.76
G1 Z4.36
G1 E.8 F1800
G1 F9000
G1 X115.08 Y118.418 E.0116
G1 X115.08 Y116.642 E.0729
G3 X115.351 Y116.621 I.215 J.99 E.01121
G3 X115.422 Y118.433 I-.018 J.908 E.11277
; WIPE_START
G1 F24000
G1 X115.08 Y118.418 E-.12999
G1 X115.08 Y116.76 E-.63001
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.76 I.038 J-1.216 P1  F30000
G1 X107.92 Y116.534 Z4.76
G1 Z4.36
G1 E.8 F1800
G1 F9000
G3 X107.92 Y114.78 I.202 J-.877 E.09939
G1 X107.92 Y116.474 E.06958
; WIPE_START
G1 F24000
G1 X107.611 Y116.392 E-.12144
G1 X107.4 Y116.19 E-.11102
G1 X107.22 Y115.657 E-.21371
G1 X107.4 Y115.124 E-.21371
G1 X107.591 Y114.942 E-.10012
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.76 I1.216 J.041 P1  F30000
G1 X107.92 Y105.279 Z4.76
G1 Z4.36
G1 E.8 F1800
G1 F9000
G1 X107.901 Y105.265 E.00097
G3 X107.92 Y103.86 I.565 J-.695 E.06633
G1 X107.92 Y105.219 E.05581
; WIPE_START
G1 F24000
G1 X107.901 Y105.265 E-.01885
G1 X107.653 Y104.954 E-.15104
G1 X107.569 Y104.569 E-.14995
G1 X107.663 Y104.179 E-.15239
G1 X107.92 Y103.86 E-.15574
G1 X107.92 Y104.207 E-.13204
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.76 I-.212 J1.198 P1  F30000
G1 X115.081 Y105.475 Z4.76
G1 Z4.36
G1 E.8 F1800
G1 F9000
G3 X115.08 Y107.035 I-.444 J.78 E.07762
G1 X115.081 Y105.535 E.06158
G1 X115.08 Y105.297 F30000
G1 F9000
G1 X115.08 Y103.877 E.0583
G1 X115.122 Y103.913 E.00228
G3 X115.126 Y105.259 I-.586 J.675 E.06259
; WIPE_START
G1 F24000
G1 X115.08 Y103.877 E-.52555
G1 X115.122 Y103.913 E-.02114
G1 X115.36 Y104.248 E-.15609
G1 X115.386 Y104.397 E-.05722
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.76 I-.03 J1.217 P1  F30000
G1 X152.081 Y105.312 Z4.76
G1 Z4.36
G1 E.8 F1800
G1 F9000
G1 X152.083 Y103.921 E.05713
G3 X152.384 Y105.055 I-.65 J.779 E.05137
G3 X152.08 Y106.368 I-.723 J.524 E.06268
G1 X152.081 Y105.372 E.04089
; WIPE_START
G1 F24000
G1 X152.083 Y103.921 E-.55148
G1 X152.387 Y104.378 E-.20852
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.76 I-.15 J-1.208 P1  F30000
G1 X144.92 Y105.304 Z4.76
G1 Z4.36
G1 E.8 F1800
G1 F9000
G1 X144.913 Y105.299 E.00036
G3 X144.92 Y103.833 I.517 J-.73 E.07053
G1 X144.92 Y105.244 E.05791
; WIPE_START
G1 F24000
G1 X144.913 Y105.299 E-.02117
G1 X144.644 Y105.004 E-.15161
G1 X144.533 Y104.569 E-.17083
G1 X144.628 Y104.179 E-.15233
G1 X144.92 Y103.833 E-.17203
G1 X144.92 Y104.076 E-.09203
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.76 I-1.217 J-.019 P1  F30000
G1 X144.769 Y113.951 Z4.76
G1 Z4.36
G1 E.8 F1800
G1 F9000
G3 X144.92 Y113.973 I-.073 J1.057 E.00627
G1 X144.92 Y115.748 E.0729
G3 X144.71 Y113.947 I-.244 J-.884 E.12983
; WIPE_START
G1 F24000
G1 X144.92 Y113.973 E-.08049
G1 X144.92 Y115.748 E-.67466
G1 X144.907 Y115.748 E-.00484
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.76 I-.67 J1.016 P1  F30000
G1 X152.08 Y120.482 Z4.76
G1 Z4.36
G1 E.8 F1800
G1 F9000
G3 X152.351 Y120.46 I.215 J.99 E.01121
G3 X152.411 Y122.273 I-.018 J.908 E.11321
G3 X152.08 Y122.257 I-.112 J-1.111 E.01366
G1 X152.08 Y120.542 E.07044
; WIPE_START
G1 F24000
G1 X152.351 Y120.46 E-.10763
G1 X152.643 Y120.523 E-.11349
G1 X152.944 Y120.708 E-.13418
G1 X153.153 Y120.984 E-.13145
G1 X153.24 Y121.313 E-.1293
G1 X153.196 Y121.649 E-.12895
G1 X153.176 Y121.683 E-.015
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.76 I-1.207 J-.158 P1  F30000
G1 X152.111 Y129.806 Z4.76
G1 Z4.36
G1 E.8 F1800
G1 F9000
G3 X152.794 Y130.993 I-.158 J.881 E.06404
G1 X152.08 Y130.94 E.02939
G1 X152.109 Y129.866 E.04411
; WIPE_START
G1 F24000
G1 X152.478 Y129.96 E-.14474
G1 X152.739 Y130.256 E-.15009
G1 X152.845 Y130.641 E-.15169
G1 X152.794 Y130.993 E-.13536
G1 X152.326 Y130.958 E-.17811
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.76 I.127 J-1.21 P1  F30000
G1 X144.92 Y130.183 Z4.76
G1 Z4.36
G1 E.8 F1800
G1 F9000
G1 X144.92 Y131.338 E.04742
G1 X144.834 Y131.507 E.00776
G3 X144.874 Y130.222 I.631 J-.623 E.05904
; CHANGE_LAYER
; Z_HEIGHT: 4.4
; LAYER_HEIGHT: 0.04
; WIPE_START
G1 F24000
G1 X144.92 Y131.338 E-.42473
G1 X144.834 Y131.507 E-.0718
G1 X144.628 Y131.169 E-.15049
G1 X144.586 Y130.874 E-.11299
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 33/58
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
G3 Z4.76 I-.215 J1.198 P1  F30000
G1 X151.29 Y132.08 Z4.76
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F11933
G1 X153.455 Y132.08 E.07182
G3 X155.698 Y135.345 I.006 J2.399 E.15459
G1 X155.07 Y136.829 E.05346
G3 X153.615 Y139.577 I-31.365 J-14.854 E.10316
G1 X140.087 Y139.577 E.44872
G1 X140.032 Y139.408 E.00587
G2 X146.102 Y131.6 I-10.058 J-14.082 E.33271
G1 X146.102 Y103.08 E.94606
G1 X150.898 Y103.08 E.15909
G1 X150.898 Y132.08 E.96198
G1 X151.23 Y132.08 E.01102
G1 X151.29 Y131.688 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11933
G1 X153.46 Y131.688 E.06668
G3 X156.063 Y135.488 I.001 J2.791 E.16647
G1 X155.427 Y136.99 E.05012
G3 X153.841 Y139.969 I-32.601 J-15.454 E.10374
G1 X138.439 Y139.969 E.47325
G2 X145.71 Y131.52 I-8.548 J-14.709 E.34894
G1 X145.71 Y102.688 E.88594
G1 X151.29 Y102.688 E.17146
G1 X151.29 Y131.628 E.88925
M204 S10000
; WIPE_START
G1 F24000
G1 X153.289 Y131.683 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I-.651 J-1.028 P1  F30000
G1 X151.915 Y132.554 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.581416
G1 F11699.251
G1 X151.992 Y132.553 E.00336
G1 X148.346 Y130.886 F30000
; LINE_WIDTH: 0.351907
G1 F11933
G1 X148.654 Y130.886 E.00778
G1 X148.654 Y105.323 E.64362
G1 X148.346 Y105.323 E.00778
G1 X148.346 Y130.826 E.64211
G1 X148.002 Y131.229 F30000
; LINE_WIDTH: 0.419999
G1 F11933
G1 X148.998 Y131.229 E.03058
G1 X148.998 Y104.98 E.80654
G1 X148.002 Y104.98 E.03058
G1 X148.002 Y131.169 E.8047
G1 X147.625 Y131.606 F30000
G1 F11933
G1 X149.375 Y131.606 E.05375
G1 X149.375 Y104.603 E.82971
G1 X147.625 Y104.603 E.05375
G1 X147.625 Y131.546 E.82787
G1 X147.248 Y131.641 F30000
G1 F11933
G1 X147.177 Y131.983 E.01073
G1 X149.752 Y131.983 E.07911
G1 X149.752 Y104.226 E.85289
G1 X147.248 Y104.226 E.07692
G1 X147.248 Y131.581 E.84054
G1 X146.609 Y132.36 F30000
G1 F11933
G1 X150.205 Y132.36 E.1105
G1 X150.129 Y132.283 E.00334
G1 X150.129 Y103.849 E.8737
G1 X146.871 Y103.849 E.10009
G1 X146.871 Y131.641 E.85397
G1 X146.824 Y131.867 E.00709
G1 X146.633 Y132.305 E.01468
G1 X146.034 Y132.737 F30000
G1 F11933
G1 X150.052 Y132.737 E.12347
G1 X150.373 Y132.751 E.00987
; LINE_WIDTH: 0.37205
G2 X151.506 Y132.765 I.731 J-13.095 E.03039
; LINE_WIDTH: 0.363648
G1 X151.564 Y132.743 E.00164
; LINE_WIDTH: 0.401875
G1 X151.623 Y132.721 E.00183
; LINE_WIDTH: 0.440102
G1 X151.681 Y132.699 E.00203
; LINE_WIDTH: 0.478329
G1 X151.74 Y132.677 E.00222
; LINE_WIDTH: 0.516555
G1 X151.827 Y132.615 E.00412
; LINE_WIDTH: 0.570844
G1 X151.915 Y132.554 E.00459
G1 X151.697 Y132.521 E.0095
; LINE_WIDTH: 0.516555
G1 X151.649 Y132.502 E.00198
; LINE_WIDTH: 0.478329
G1 X151.601 Y132.483 E.00182
; LINE_WIDTH: 0.440102
M73 P69 R6
G1 X151.553 Y132.464 E.00166
; LINE_WIDTH: 0.365926
G1 X151.506 Y132.445 E.00135
G1 X150.694 Y132.444 E.02136
; LINE_WIDTH: 0.364126
G1 X150.6 Y132.364 E.00324
; LINE_WIDTH: 0.419944
G1 X150.506 Y132.283 E.0038
G1 X150.506 Y103.472 E.88516
G1 X146.494 Y103.472 E.12325
G1 X146.494 Y131.641 E.86543
G1 X146.478 Y131.717 E.00236
G1 X146.058 Y132.682 E.03236
G1 X143.758 Y136.354 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F11933
G2 X144.71 Y135.034 I-11.889 J-9.582 E.05402
G1 X148.386 Y138.71 E.17242
G1 X149.994 Y138.71 E.05336
G1 X155.24 Y133.464 E.2461
G3 X155.368 Y135.23 I-1.829 J1.021 E.06066
G3 X154.522 Y137.17 I-25.726 J-10.074 E.07022
G1 X150.481 Y133.129 E.18956
G1 X147.899 Y133.129 E.08566
G1 X142.318 Y138.71 E.2618
G1 X143.947 Y138.71 E.05401
G1 X139.206 Y139.756 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.284711
G1 F11933
G1 X139.874 Y139.554 E.01374
G1 X141.088 Y139.143 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502898
G1 F11933
G1 X153.304 Y139.143 E.45789
; WIPE_START
G1 F24000
G1 X151.304 Y139.143 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I.201 J-1.2 P1  F30000
G1 X109.102 Y132.08 Z4.8
G1 Z4.4
M73 P69 R5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F11933
G1 X109.102 Y103.08 E.96198
G1 X113.898 Y103.08 E.15909
G1 X113.898 Y131.6 E.94606
G2 X119.968 Y139.406 I16.124 J-6.275 E.33267
G1 X119.914 Y139.577 E.00593
G1 X106.381 Y139.577 E.44893
G3 X104.234 Y135.142 I23.232 J-13.986 E.16367
G3 X106.545 Y132.08 I2.31 J-.66 E.14739
G1 X109.042 Y132.08 E.08284
G1 X108.71 Y131.688 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11933
G1 X108.71 Y102.688 E.89109
G1 X114.29 Y102.688 E.17146
G1 X114.29 Y131.52 E.88594
G2 X121.566 Y139.969 I15.729 J-6.189 E.34914
G1 X106.161 Y139.969 E.47336
G3 X103.857 Y135.251 I23.178 J-14.24 E.16159
G3 X106.54 Y131.688 I2.687 J-.768 E.15868
G1 X108.65 Y131.688 E.06484
M204 S10000
; WIPE_START
G1 F24000
G1 X108.654 Y129.688 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I-1.182 J-.291 P1  F30000
G1 X107.949 Y132.552 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.577278
G1 F11789.848
G1 X108.04 Y132.557 E.00398
G1 X111.654 Y130.886 F30000
; LINE_WIDTH: 0.351907
G1 F11933
G1 X111.654 Y105.323 E.64362
G1 X111.346 Y105.323 E.00778
G1 X111.346 Y130.886 E.64362
G1 X111.594 Y130.886 E.00627
G1 X111.998 Y131.229 F30000
; LINE_WIDTH: 0.419999
G1 F11933
G1 X111.998 Y104.98 E.80654
G1 X111.002 Y104.98 E.03058
G1 X111.002 Y131.229 E.80654
G1 X111.938 Y131.229 E.02873
G1 X112.375 Y131.606 F30000
G1 F11933
G1 X112.375 Y104.603 E.82971
G1 X110.625 Y104.603 E.05375
G1 X110.625 Y131.606 E.82971
G1 X112.315 Y131.606 E.0519
G1 X112.752 Y131.641 F30000
G1 F11933
G1 X112.752 Y104.226 E.84239
G1 X110.248 Y104.226 E.07692
G1 X110.248 Y131.983 E.85289
G1 X112.821 Y131.983 E.07905
G1 X112.764 Y131.7 E.00887
G1 X113.384 Y132.36 F30000
G1 F11933
G1 X113.173 Y131.862 E.01663
G1 X113.129 Y131.641 E.00691
G1 X113.129 Y103.849 E.85397
G1 X109.871 Y103.849 E.10009
G1 X109.871 Y132.283 E.8737
G1 X109.807 Y132.36 E.00308
G1 X113.324 Y132.36 E.10808
G1 X113.506 Y130.731 F30000
G1 F11933
G1 X113.506 Y103.472 E.8376
G1 X109.494 Y103.472 E.12327
G1 X109.494 Y132.283 E.88529
G1 X109.4 Y132.364 E.0038
; LINE_WIDTH: 0.367819
G1 X109.306 Y132.444 E.00328
G1 X108.494 Y132.445 E.02149
; LINE_WIDTH: 0.363653
G1 X108.415 Y132.468 E.00215
; LINE_WIDTH: 0.40582
G1 X108.336 Y132.491 E.00243
; LINE_WIDTH: 0.447987
G1 X108.258 Y132.514 E.00271
; LINE_WIDTH: 0.490154
G1 X108.179 Y132.537 E.003
; LINE_WIDTH: 0.532321
G1 X108.1 Y132.56 E.00328
; LINE_WIDTH: 0.574488
G1 F11851.73
G1 X108.179 Y132.601 E.00385
; LINE_WIDTH: 0.532321
G1 F11933
G1 X108.258 Y132.642 E.00355
; LINE_WIDTH: 0.490154
G1 X108.337 Y132.683 E.00324
; LINE_WIDTH: 0.447987
G1 X108.416 Y132.724 E.00294
; LINE_WIDTH: 0.367818
G1 X108.494 Y132.765 E.00235
G1 X109.306 Y132.765 E.02148
; LINE_WIDTH: 0.364122
G1 X109.627 Y132.751 E.00841
; LINE_WIDTH: 0.41859
G1 X109.948 Y132.737 E.00984
G1 X113.96 Y132.737 E.12281
G1 X113.521 Y131.715 E.03406
G1 X113.507 Y130.791 E.02827
G1 X116.251 Y136.347 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F11933
G3 X115.29 Y135.034 I8.645 J-7.34 E.05403
G1 X111.614 Y138.71 E.17242
G1 X110.006 Y138.71 E.05336
G1 X104.762 Y133.466 E.24601
G2 X104.502 Y134.701 I1.841 J1.032 E.04254
G2 X105.484 Y137.164 I12.878 J-3.708 E.08809
G1 X109.519 Y133.129 E.18929
G1 X112.101 Y133.129 E.08566
G1 X117.682 Y138.71 E.2618
G1 X116.053 Y138.71 E.05401
G1 X120.127 Y139.554 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.294932
G1 F11933
G1 X120.796 Y139.758 E.01436
G1 X106.634 Y139.143 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F11933
G1 X118.848 Y139.143 E.45784
; CHANGE_LAYER
; Z_HEIGHT: 4.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X116.848 Y139.143 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 34/58
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
G3 Z4.8 I.26 J1.189 P1  F30000
G1 X150.898 Y131.688 Z4.8
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9682
G1 X150.898 Y132.08 E.01301
G1 X153.455 Y132.08 E.08483
G3 X155.698 Y135.345 I.006 J2.399 E.15459
G1 X155.065 Y136.84 E.05387
G3 X153.73 Y139.377 I-30.822 J-14.605 E.09511
G1 X140.36 Y139.377 E.44348
G1 X140.305 Y139.209 E.00587
G2 X146.102 Y131.6 I-10.397 J-13.934 E.32144
G1 X146.102 Y103.08 E.94606
G1 X150.898 Y103.08 E.15909
G1 X150.898 Y131.628 E.94699
G1 X151.29 Y131.688 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9682
G1 X153.46 Y131.688 E.06668
G3 X156.063 Y135.488 I.001 J2.791 E.16647
G1 X155.422 Y137.001 E.05049
G3 X153.956 Y139.769 I-31.75 J-15.052 E.09628
G1 X138.776 Y139.769 E.46643
G2 X145.71 Y131.52 I-8.824 J-14.456 E.33696
G1 X145.71 Y102.688 E.88594
G1 X151.29 Y102.688 E.17146
G1 X151.29 Y131.628 E.88925
M204 S10000
; WIPE_START
G1 F24000
G1 X153.289 Y131.683 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I-.651 J-1.028 P1  F30000
G1 X151.915 Y132.554 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.581416
G1 F9682
G1 X151.992 Y132.553 E.00336
G1 X148.346 Y130.886 F30000
; LINE_WIDTH: 0.351907
G1 F9682
G1 X148.654 Y130.886 E.00778
G1 X148.654 Y105.323 E.64362
G1 X148.346 Y105.323 E.00778
G1 X148.346 Y130.826 E.64211
G1 X148.002 Y131.229 F30000
; LINE_WIDTH: 0.419999
G1 F9682
G1 X148.998 Y131.229 E.03058
G1 X148.998 Y104.98 E.80654
G1 X148.002 Y104.98 E.03058
G1 X148.002 Y131.169 E.8047
G1 X147.625 Y131.606 F30000
G1 F9682
G1 X149.375 Y131.606 E.05375
G1 X149.375 Y104.603 E.82971
G1 X147.625 Y104.603 E.05375
G1 X147.625 Y131.546 E.82787
G1 X147.248 Y131.641 F30000
G1 F9682
G1 X147.177 Y131.983 E.01073
G1 X149.752 Y131.983 E.07911
G1 X149.752 Y104.226 E.85289
G1 X147.248 Y104.226 E.07692
G1 X147.248 Y131.581 E.84054
G1 X146.609 Y132.36 F30000
G1 F9682
G1 X150.205 Y132.36 E.1105
G1 X150.129 Y132.283 E.00334
G1 X150.129 Y103.849 E.8737
G1 X146.871 Y103.849 E.10009
G1 X146.871 Y131.641 E.85397
G1 X146.824 Y131.867 E.00709
G1 X146.633 Y132.305 E.01468
G1 X146.034 Y132.737 F30000
G1 F9682
G1 X150.052 Y132.737 E.12347
G1 X150.373 Y132.751 E.00987
; LINE_WIDTH: 0.37205
G2 X151.506 Y132.765 I.731 J-13.095 E.03039
; LINE_WIDTH: 0.363648
G1 X151.564 Y132.743 E.00164
; LINE_WIDTH: 0.401875
G1 X151.623 Y132.721 E.00183
; LINE_WIDTH: 0.440102
G1 X151.681 Y132.699 E.00203
; LINE_WIDTH: 0.478329
G1 X151.74 Y132.677 E.00222
; LINE_WIDTH: 0.516555
G1 X151.827 Y132.615 E.00412
; LINE_WIDTH: 0.570844
G1 X151.915 Y132.554 E.00459
G1 X151.697 Y132.521 E.0095
; LINE_WIDTH: 0.516555
G1 X151.649 Y132.502 E.00198
; LINE_WIDTH: 0.478329
G1 X151.601 Y132.483 E.00182
; LINE_WIDTH: 0.440102
G1 X151.553 Y132.464 E.00166
; LINE_WIDTH: 0.365926
G1 X151.506 Y132.445 E.00135
G1 X150.694 Y132.444 E.02136
; LINE_WIDTH: 0.364126
G1 X150.6 Y132.364 E.00324
; LINE_WIDTH: 0.419944
G1 X150.506 Y132.283 E.0038
G1 X150.506 Y103.472 E.88516
G1 X146.494 Y103.472 E.12325
G1 X146.494 Y131.641 E.86543
G1 X146.478 Y131.717 E.00236
G1 X146.058 Y132.682 E.03236
G1 X143.758 Y136.354 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F9682
G2 X144.71 Y135.034 I-11.827 J-9.535 E.05402
G1 X148.186 Y138.51 E.16304
G1 X150.194 Y138.51 E.06662
G1 X155.235 Y133.469 E.23647
G3 X155.407 Y135.124 I-1.833 J1.026 E.05675
G3 X154.522 Y137.17 I-23.73 J-9.051 E.07396
G1 X150.481 Y133.129 E.18955
G1 X147.899 Y133.129 E.08566
G1 X142.518 Y138.51 E.25241
G1 X144.147 Y138.51 E.05401
G1 X141.331 Y138.943 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F9682
G1 X153.417 Y138.943 E.45303
; WIPE_START
G1 F24000
G1 X151.417 Y138.943 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I.195 J-1.201 P1  F30000
G1 X109.102 Y132.08 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9682
G1 X109.102 Y103.08 E.96198
M73 P70 R5
G1 X113.898 Y103.08 E.15909
G1 X113.898 Y131.6 E.94606
G2 X119.696 Y139.211 I16.242 J-6.359 E.3215
G1 X119.64 Y139.377 E.00581
G1 X106.267 Y139.377 E.44359
G3 X104.218 Y135.086 I21.69 J-12.991 E.15794
G3 X106.545 Y132.08 I2.325 J-.604 E.14548
G1 X109.042 Y132.08 E.08284
G1 X108.71 Y131.688 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9682
G1 X108.71 Y102.688 E.89109
G1 X114.29 Y102.688 E.17146
G1 X114.29 Y131.52 E.88594
G2 X121.222 Y139.769 I15.834 J-6.27 E.33686
G1 X106.04 Y139.769 E.4665
G3 X103.877 Y135.318 I23.726 J-14.279 E.15226
G3 X106.54 Y131.688 I2.662 J-.839 E.16092
G1 X108.65 Y131.688 E.06484
M204 S10000
; WIPE_START
G1 F24000
G1 X108.654 Y129.688 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I-1.182 J-.291 P1  F30000
G1 X107.949 Y132.552 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.57728
G1 F9682
G1 X108.04 Y132.557 E.00398
G1 X111.654 Y130.886 F30000
; LINE_WIDTH: 0.351907
G1 F9682
G1 X111.654 Y105.323 E.64362
G1 X111.346 Y105.323 E.00778
G1 X111.346 Y130.886 E.64362
G1 X111.594 Y130.886 E.00627
G1 X111.998 Y131.229 F30000
; LINE_WIDTH: 0.419999
G1 F9682
G1 X111.998 Y104.98 E.80654
G1 X111.002 Y104.98 E.03058
G1 X111.002 Y131.229 E.80654
G1 X111.938 Y131.229 E.02873
G1 X112.375 Y131.606 F30000
G1 F9682
G1 X112.375 Y104.603 E.82971
G1 X110.625 Y104.603 E.05375
G1 X110.625 Y131.606 E.82971
G1 X112.315 Y131.606 E.0519
G1 X112.752 Y131.641 F30000
G1 F9682
G1 X112.752 Y104.226 E.84239
G1 X110.248 Y104.226 E.07692
G1 X110.248 Y131.983 E.85289
G1 X112.821 Y131.983 E.07905
G1 X112.764 Y131.7 E.00887
G1 X113.384 Y132.36 F30000
G1 F9682
G1 X113.173 Y131.861 E.01663
G1 X113.129 Y131.641 E.00691
G1 X113.129 Y103.849 E.85397
G1 X109.871 Y103.849 E.10009
G1 X109.871 Y132.283 E.8737
G1 X109.807 Y132.36 E.00308
G1 X113.324 Y132.36 E.10808
G1 X113.506 Y130.731 F30000
G1 F9682
G1 X113.506 Y103.472 E.8376
G1 X109.494 Y103.472 E.12327
G1 X109.494 Y132.283 E.88529
G1 X109.4 Y132.364 E.0038
; LINE_WIDTH: 0.367819
G1 X109.306 Y132.444 E.00328
G1 X108.494 Y132.445 E.02149
; LINE_WIDTH: 0.363653
G1 X108.415 Y132.468 E.00215
; LINE_WIDTH: 0.40582
G1 X108.336 Y132.491 E.00243
; LINE_WIDTH: 0.447987
G1 X108.258 Y132.514 E.00271
; LINE_WIDTH: 0.490154
G1 X108.179 Y132.537 E.003
; LINE_WIDTH: 0.532321
G1 X108.1 Y132.56 E.00328
; LINE_WIDTH: 0.574488
G1 X108.179 Y132.601 E.00385
; LINE_WIDTH: 0.532321
G1 X108.258 Y132.642 E.00355
; LINE_WIDTH: 0.490154
G1 X108.337 Y132.683 E.00324
; LINE_WIDTH: 0.447987
G1 X108.416 Y132.724 E.00294
; LINE_WIDTH: 0.367818
G1 X108.494 Y132.765 E.00235
G1 X109.306 Y132.765 E.02148
; LINE_WIDTH: 0.364122
G1 X109.627 Y132.751 E.00841
; LINE_WIDTH: 0.41859
G1 X109.948 Y132.737 E.00984
G1 X113.96 Y132.737 E.12281
G1 X113.521 Y131.715 E.03406
G1 X113.507 Y130.791 E.02827
G1 X116.251 Y136.347 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F9682
G3 X115.29 Y135.034 I8.655 J-7.343 E.05403
G1 X111.814 Y138.51 E.16304
G1 X109.806 Y138.51 E.06662
G1 X104.762 Y133.466 E.23663
G2 X104.515 Y134.805 I2.339 J1.123 E.04573
G2 X105.478 Y137.17 I18.534 J-6.173 E.08475
G1 X109.519 Y133.129 E.18954
G1 X112.101 Y133.129 E.08566
G1 X117.482 Y138.51 E.25241
G1 X115.853 Y138.51 E.05401
G1 X106.52 Y138.943 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502906
G1 F9682
G1 X118.608 Y138.943 E.4531
; CHANGE_LAYER
; Z_HEIGHT: 4.64
; LAYER_HEIGHT: 0.04
; WIPE_START
G1 F24000
G1 X116.608 Y138.943 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 35/58
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
G3 Z5 I1.194 J-.235 P1  F30000
G1 X115.137 Y131.458 Z5
G1 Z4.64
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.28
G1 F9000
G1 X115.08 Y131.342 E.0053
G1 X115.112 Y130.378 E.03961
G3 X115.172 Y131.409 I-.658 J.556 E.04549
; WIPE_START
G1 F24000
G1 X115.08 Y131.342 E-.04329
G1 X115.112 Y130.378 E-.36662
G1 X115.314 Y130.883 E-.20676
G1 X115.284 Y131.159 E-.10549
G1 X115.244 Y131.25 E-.03784
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.04 I.058 J-1.216 P1  F30000
G1 X107.92 Y130.902 Z5.04
G1 Z4.64
G1 E.8 F1800
G1 F9000
G1 X107.258 Y130.906 E.02718
G3 X107.92 Y129.889 I.848 J-.172 E.05524
G1 X107.92 Y130.842 E.03913
; WIPE_START
G1 F24000
G1 X107.258 Y130.906 E-.25275
G1 X107.255 Y130.582 E-.12306
G1 X107.374 Y130.271 E-.12641
G1 X107.6 Y130.031 E-.12545
G1 X107.918 Y129.889 E-.13234
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.04 I1.217 J.001 P1  F30000
G1 X107.92 Y127.278 Z5.04
G1 Z4.64
G1 E.8 F1800
G1 F9000
G1 X107.905 Y127.266 E.00079
G3 X107.92 Y125.95 I.563 J-.652 E.06148
G1 X107.92 Y127.218 E.05206
; WIPE_START
G1 F24000
G1 X107.905 Y127.266 E-.01892
G1 X107.698 Y126.993 E-.13017
G1 X107.607 Y126.615 E-.14761
G1 X107.691 Y126.241 E-.14572
G1 X107.92 Y125.95 E-.14082
G1 X107.92 Y126.415 E-.17677
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.04 I1.217 J0 P1  F30000
G1 X107.92 Y125.369 Z5.04
G1 Z4.64
G1 E.8 F1800
G1 F9000
G1 X107.919 Y125.367 E.00009
G3 X107.92 Y124.243 I.647 J-.561 E.05032
G1 X107.92 Y125.309 E.04373
; WIPE_START
G1 F24000
G1 X107.919 Y125.367 E-.02223
G1 X107.772 Y125.129 E-.10629
G1 X107.707 Y124.806 E-.12534
G1 X107.773 Y124.482 E-.12555
G1 X107.92 Y124.243 E-.10646
G1 X107.92 Y124.965 E-.27414
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.04 I.315 J1.175 P1  F30000
G1 X115.08 Y123.045 Z5.04
G1 Z4.64
G1 E.8 F1800
G1 F9000
G1 X115.084 Y121.287 E.07219
G3 X115.26 Y121.281 I.121 J1.084 E.00723
G3 X115.318 Y123.045 I-.015 J.883 E.11032
G3 X115.14 Y123.05 I-.116 J-1.018 E.00733
; WIPE_START
G1 F24000
G1 X115.084 Y121.287 E-.67046
G1 X115.26 Y121.281 E-.0668
G1 X115.318 Y121.294 E-.02274
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.04 I1.215 J-.07 P1  F30000
G1 X115.151 Y118.409 Z5.04
G1 Z4.64
G1 E.8 F1800
G1 F9000
G1 X115.08 Y118.409 E.00292
G1 X115.084 Y116.651 E.07219
G3 X115.26 Y116.645 I.121 J1.084 E.00723
G3 X115.318 Y118.409 I-.015 J.883 E.11032
G1 X115.211 Y118.409 E.00439
; WIPE_START
G1 F24000
G1 X115.08 Y118.409 E-.04985
G1 X115.084 Y116.651 E-.66809
G1 X115.194 Y116.647 E-.04206
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.04 I.029 J-1.217 P1  F30000
G1 X107.92 Y116.476 Z5.04
G1 Z4.64
G1 E.8 F1800
G1 F9000
G3 X107.92 Y114.838 I.297 J-.819 E.08747
G1 X107.92 Y116.416 E.06479
; WIPE_START
G1 F24000
G1 X107.487 Y116.129 E-.19724
G1 X107.344 Y115.657 E-.18748
G1 X107.487 Y115.185 E-.18748
G1 X107.873 Y114.876 E-.1878
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.04 I1.217 J.006 P1  F30000
G1 X107.92 Y105.132 Z5.04
G1 Z4.64
G1 E.8 F1800
G1 F9000
G3 X107.92 Y103.953 I.638 J-.59 E.05323
G1 X107.92 Y105.072 E.04596
; WIPE_START
G1 F24000
G1 X107.748 Y104.863 E-.10307
G1 X107.687 Y104.538 E-.12536
G1 X107.756 Y104.211 E-.12717
G1 X107.92 Y103.953 E-.11629
G1 X107.92 Y104.711 E-.28811
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.04 I-.149 J1.208 P1  F30000
G1 X115.08 Y105.595 Z5.04
G1 Z4.64
G1 E.8 F1800
G1 F9000
G1 X115.121 Y105.63 E.0022
G3 X115.08 Y106.945 I-.574 J.641 E.06154
G1 X115.08 Y105.655 E.05296
G1 X115.08 Y105.147 F30000
G1 F9000
G1 X115.092 Y103.983 E.04779
G3 X115.119 Y105.101 I-.646 J.575 E.04997
; WIPE_START
G1 F24000
G1 X115.092 Y103.983 E-.42524
G1 X115.243 Y104.226 E-.10858
G1 X115.311 Y104.554 E-.1273
G1 X115.264 Y104.81 E-.09888
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.04 I-.019 J1.217 P1  F30000
G1 X152.087 Y105.382 Z5.04
G1 Z4.64
G1 E.8 F1800
G1 F9000
G1 X152.097 Y104.025 E.05569
G3 X152.253 Y105.057 I-.822 J.652 E.04483
G3 X152.08 Y106.273 I-.681 J.523 E.05619
G1 X152.086 Y105.442 E.03413
; WIPE_START
G1 F24000
G1 X152.097 Y104.025 E-.53818
G1 X152.308 Y104.486 E-.19279
G1 X152.301 Y104.563 E-.02903
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.04 I-.099 J-1.213 P1  F30000
G1 X144.92 Y105.162 Z5.04
G1 Z4.64
G1 E.8 F1800
G1 F9000
G3 X144.92 Y103.921 I.606 J-.621 E.05682
G1 X144.92 Y105.102 E.04852
; WIPE_START
G1 F24000
G1 X144.717 Y104.863 E-.11938
G1 X144.657 Y104.539 E-.12529
G1 X144.725 Y104.211 E-.12712
G1 X144.92 Y103.921 E-.13296
G1 X144.92 Y104.592 E-.25525
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.04 I-1.217 J-.008 P1  F30000
G1 X144.858 Y113.976 Z5.04
G1 Z4.64
G1 E.8 F1800
G1 F9000
G1 X144.92 Y113.982 E.00257
G1 X144.916 Y115.74 E.07219
G3 X144.799 Y113.971 I-.153 J-.878 E.12271
; WIPE_START
G1 F24000
G1 X144.92 Y113.982 E-.0463
G1 X144.916 Y115.74 E-.66809
G1 X144.796 Y115.733 E-.04561
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.04 I-.665 J1.019 P1  F30000
G1 X152.084 Y120.49 Z5.04
G1 Z4.64
G1 E.8 F1800
G1 F9000
G3 X152.259 Y120.485 I.121 J1.084 E.00723
G3 X152.318 Y122.249 I-.015 J.883 E.11032
G3 X152.08 Y122.248 I-.116 J-1.018 E.00979
G1 X152.084 Y120.55 E.06972
; WIPE_START
G1 F24000
G1 X152.259 Y120.485 E-.07128
G1 X152.544 Y120.546 E-.11074
G1 X152.838 Y120.725 E-.13083
G1 X153.041 Y120.994 E-.128
G1 X153.126 Y121.314 E-.12578
G1 X153.084 Y121.641 E-.12542
G1 X152.995 Y121.797 E-.06794
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.04 I-1.21 J-.133 P1  F30000
G1 X152.102 Y129.897 Z5.04
G1 Z4.64
G1 E.8 F1800
G1 F9000
G3 X152.728 Y130.988 I-.21 J.846 E.05774
G1 X152.08 Y130.94 E.02667
G1 X152.101 Y129.957 E.04038
; WIPE_START
G1 F24000
G1 X152.404 Y130.035 E-.11911
G1 X152.658 Y130.323 E-.14606
G1 X152.757 Y130.642 E-.12668
G1 X152.728 Y130.988 E-.1322
G1 X152.108 Y130.942 E-.23594
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.04 I.103 J-1.213 P1  F30000
G1 X144.92 Y130.332 Z5.04
G1 Z4.64
G1 E.8 F1800
G1 F9000
G1 X144.92 Y131.342 E.04147
G1 X144.874 Y131.435 E.00424
G3 X144.883 Y130.376 I.689 J-.524 E.04675
; CHANGE_LAYER
; Z_HEIGHT: 4.8
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F24000
G1 X144.92 Y131.342 E-.36721
G1 X144.874 Y131.435 E-.03927
G1 X144.728 Y131.136 E-.12617
G1 X144.698 Y130.86 E-.10564
G1 X144.812 Y130.561 E-.12171
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 36/58
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
G3 Z5.04 I-.408 J1.147 P1  F30000
G1 X150.422 Y132.556 Z5.04
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X152.818 Y132.556 E.07947
G1 X152.818 Y132.08 E.01578
G3 X153.582 Y132.083 I.319 J15.348 E.02535
G3 X155.698 Y135.345 I-.125 J2.399 E.15029
G1 X155.06 Y136.851 E.05427
G3 X153.845 Y139.177 I-30.816 J-14.621 E.08705
G1 X140.622 Y139.177 E.43862
G1 X140.565 Y139.013 E.00576
G2 X145.692 Y132.556 I-10.64 J-13.714 E.27616
G1 X150.362 Y132.556 E.1549
; WIPE_START
G1 F24000
G1 X152.362 Y132.556 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I.766 J-.946 P1  F30000
G1 X151.29 Y131.688 Z5.2
G1 Z4.8
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X153.46 Y131.688 E.06668
G3 X156.063 Y135.488 I.001 J2.791 E.16647
G1 X155.417 Y137.012 E.05086
G3 X154.071 Y139.569 I-31.205 J-14.802 E.08881
G1 X139.095 Y139.569 E.46018
G2 X145.71 Y131.52 I-9.2 J-14.305 E.32535
G1 X145.71 Y102.688 E.88594
G1 X151.29 Y102.688 E.17146
G1 X151.29 Y131.628 E.88925
M204 S10000
G1 X150.997 Y132.333 F30000
M204 S2000
; FEATURE: Top surface
G1 F12000
G1 X151.435 Y131.895 E.01903
G1 X151.083 Y131.714
G1 X150.464 Y132.333 E.02689
G1 X149.931 Y132.333
G1 X151.083 Y131.181 E.05006
G1 X151.083 Y130.648
G1 X149.397 Y132.333 E.07324
G1 X148.864 Y132.333
G1 X151.083 Y130.115 E.09641
G1 X151.083 Y129.581
G1 X148.331 Y132.333 E.11958
G1 X147.797 Y132.333
G1 X151.083 Y129.048 E.14276
G1 X151.083 Y128.515
G1 X147.264 Y132.333 E.16593
G1 X146.731 Y132.333
G1 X151.083 Y127.981 E.1891
G1 X151.083 Y127.448
G1 X146.198 Y132.333 E.21228
G1 X145.664 Y132.333
G1 X151.083 Y126.915 E.23545
G1 X151.083 Y126.382
G1 X145.917 Y131.547 E.22445
G1 X145.917 Y131.014
G1 X151.083 Y125.848 E.22445
G1 X151.083 Y125.315
G1 X145.917 Y130.48 E.22445
G1 X145.917 Y129.947
G1 X151.083 Y124.782 E.22445
G1 X151.083 Y124.249
M73 P71 R5
G1 X145.917 Y129.414 E.22445
G1 X145.917 Y128.881
G1 X151.083 Y123.715 E.22445
G1 X151.083 Y123.182
G1 X145.917 Y128.347 E.22445
G1 X145.917 Y127.814
G1 X151.083 Y122.649 E.22445
G1 X151.083 Y122.116
G1 X145.917 Y127.281 E.22445
G1 X145.917 Y126.747
G1 X151.083 Y121.582 E.22445
G1 X151.083 Y121.049
G1 X145.917 Y126.214 E.22445
G1 X145.917 Y125.681
G1 X151.083 Y120.516 E.22445
G1 X151.083 Y119.982
G1 X145.917 Y125.148 E.22445
G1 X145.917 Y124.614
G1 X151.083 Y119.449 E.22445
G1 X151.083 Y118.916
G1 X145.917 Y124.081 E.22445
G1 X145.917 Y123.548
G1 X151.083 Y118.383 E.22445
G1 X151.083 Y117.849
G1 X145.917 Y123.015 E.22445
G1 X145.917 Y122.481
G1 X151.083 Y117.316 E.22445
G1 X151.083 Y116.783
G1 X145.917 Y121.948 E.22445
G1 X145.917 Y121.415
G1 X151.083 Y116.25 E.22445
G1 X151.083 Y115.716
G1 X145.917 Y120.881 E.22445
G1 X145.917 Y120.348
G1 X151.083 Y115.183 E.22445
G1 X151.083 Y114.65
G1 X145.917 Y119.815 E.22445
G1 X145.917 Y119.282
G1 X151.083 Y114.116 E.22445
G1 X151.083 Y113.583
G1 X145.917 Y118.748 E.22445
G1 X145.917 Y118.215
G1 X151.083 Y113.05 E.22445
G1 X151.083 Y112.517
G1 X145.917 Y117.682 E.22445
G1 X145.917 Y117.149
G1 X151.083 Y111.983 E.22445
G1 X151.083 Y111.45
G1 X145.917 Y116.615 E.22445
G1 X145.917 Y116.082
G1 X151.083 Y110.917 E.22445
G1 X151.083 Y110.384
G1 X145.917 Y115.549 E.22445
G1 X145.917 Y115.016
G1 X151.083 Y109.85 E.22445
G1 X151.083 Y109.317
G1 X145.917 Y114.482 E.22445
G1 X145.917 Y113.949
G1 X151.083 Y108.784 E.22445
G1 X151.083 Y108.251
G1 X145.917 Y113.416 E.22445
G1 X145.917 Y112.882
G1 X151.083 Y107.717 E.22445
G1 X151.083 Y107.184
G1 X145.917 Y112.349 E.22445
G1 X145.917 Y111.816
G1 X151.083 Y106.651 E.22445
G1 X151.083 Y106.117
G1 X145.917 Y111.283 E.22445
G1 X145.917 Y110.749
G1 X151.083 Y105.584 E.22445
G1 X151.083 Y105.051
G1 X145.917 Y110.216 E.22445
G1 X145.917 Y109.683
G1 X151.083 Y104.518 E.22445
G1 X151.083 Y103.984
G1 X145.917 Y109.15 E.22445
G1 X145.917 Y108.616
G1 X151.083 Y103.451 E.22445
G1 X150.878 Y103.122
G1 X145.917 Y108.083 E.21556
G1 X145.917 Y107.55
G1 X150.345 Y103.122 E.19239
G1 X149.811 Y103.122
G1 X145.917 Y107.016 E.16921
G1 X145.917 Y106.483
G1 X149.278 Y103.122 E.14604
G1 X148.745 Y103.122
G1 X145.917 Y105.95 E.12287
G1 X145.917 Y105.417
G1 X148.212 Y103.122 E.09969
G1 X147.678 Y103.122
G1 X145.917 Y104.883 E.07652
G1 X145.917 Y104.35
G1 X147.145 Y103.122 E.05335
G1 X146.612 Y103.122
G1 X145.917 Y103.817 E.03017
M204 S10000
; WIPE_START
G1 F24000
G1 X146.612 Y103.122 E-.37317
G1 X147.145 Y103.122 E-.20264
G1 X146.802 Y103.465 E-.18419
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I-1.216 J-.035 P1  F30000
G1 X145.982 Y131.611 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.20578
G1 F15000
G1 X145.905 Y131.725 E.00183
; LINE_WIDTH: 0.166576
G1 X145.828 Y131.84 E.00139
; LINE_WIDTH: 0.127373
G1 X145.751 Y131.954 E.00095
G1 X143.756 Y136.351 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X144.706 Y135.03 I-12.163 J-9.751 E.054
G1 X147.986 Y138.31 E.15384
G1 X150.394 Y138.31 E.07989
G1 X155.235 Y133.469 E.22709
G3 X155.368 Y135.23 I-1.835 J1.025 E.06047
G3 X154.521 Y137.169 I-23.237 J-8.996 E.07022
G1 X150.256 Y132.904 E.2001
G1 X148.124 Y132.904 E.07072
G1 X142.718 Y138.31 E.2536
G1 X144.347 Y138.31 E.05401
G1 X141.575 Y138.743 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F13696.009
G1 X153.532 Y138.743 E.44821
G1 X152.259 Y132.12 F30000
; LINE_WIDTH: 0.506246
G1 F13597.337
G1 X152.321 Y132.119 E.0023
; WIPE_START
G1 F24000
G1 X152.259 Y132.12 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I1.216 J-.049 P1  F30000
G1 X151.094 Y102.99 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.255134
G1 F15000
G1 X145.906 Y102.99 E.08971
; WIPE_START
G1 F24000
G1 X147.906 Y102.99 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I-.743 J-.964 P1  F30000
G1 X109.578 Y132.556 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X114.308 Y132.556 E.15689
G2 X119.435 Y139.011 I15.684 J-7.194 E.27613
G1 X119.379 Y139.177 E.00581
G1 X106.152 Y139.177 E.43874
G3 X104.218 Y135.085 I20.918 J-12.391 E.15035
G3 X106.545 Y132.08 I2.325 J-.603 E.14543
G1 X107.182 Y132.08 E.02114
G1 X107.182 Y132.556 E.01578
G1 X109.518 Y132.556 E.07748
; WIPE_START
G1 F24000
G1 X111.518 Y132.556 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I.359 J-1.163 P1  F30000
G1 X108.71 Y131.688 Z5.2
G1 Z4.8
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X108.71 Y102.688 E.89109
G1 X114.29 Y102.688 E.17146
G1 X114.29 Y131.52 E.88594
G2 X120.908 Y139.569 I15.81 J-6.255 E.32542
G1 X105.925 Y139.569 E.46039
G3 X103.877 Y135.316 I23.347 J-13.866 E.14523
G3 X106.54 Y131.688 I2.662 J-.837 E.16086
G1 X108.65 Y131.688 E.06484
M204 S10000
; WIPE_START
G1 F24000
G1 X108.654 Y129.688 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I-.568 J1.076 P1  F30000
G1 X113.668 Y132.333 Z5.2
G1 Z4.8
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
G1 F12000
G1 X114.188 Y131.813 E.02261
G1 X114.083 Y131.385
G1 X113.135 Y132.333 E.04118
G1 X112.602 Y132.333
G1 X114.083 Y130.852 E.06436
G1 X114.083 Y130.319
G1 X112.068 Y132.333 E.08753
G1 X111.535 Y132.333
G1 X114.083 Y129.786 E.1107
G1 X114.083 Y129.252
G1 X111.002 Y132.333 E.13388
G1 X110.468 Y132.333
G1 X114.083 Y128.719 E.15705
G1 X114.083 Y128.186
G1 X109.935 Y132.333 E.18022
G1 X109.402 Y132.333
G1 X114.083 Y127.653 E.2034
G1 X114.083 Y127.119
G1 X108.869 Y132.333 E.22657
G1 X108.335 Y132.333
G1 X108.773 Y131.895 E.01903
G1 X108.917 Y131.751
G1 X114.083 Y126.586 E.22445
G1 X114.083 Y126.053
G1 X108.917 Y131.218 E.22445
G1 X108.917 Y130.685
G1 X114.083 Y125.519 E.22445
G1 X114.083 Y124.986
G1 X108.917 Y130.151 E.22445
G1 X108.917 Y129.618
G1 X114.083 Y124.453 E.22445
G1 X114.083 Y123.92
G1 X108.917 Y129.085 E.22445
G1 X108.917 Y128.552
G1 X114.083 Y123.386 E.22445
G1 X114.083 Y122.853
G1 X108.917 Y128.018 E.22445
G1 X108.917 Y127.485
G1 X114.083 Y122.32 E.22445
G1 X114.083 Y121.787
G1 X108.917 Y126.952 E.22445
G1 X108.917 Y126.419
G1 X114.083 Y121.253 E.22445
M73 P72 R5
G1 X114.083 Y120.72
G1 X108.917 Y125.885 E.22445
G1 X108.917 Y125.352
G1 X114.083 Y120.187 E.22445
G1 X114.083 Y119.654
G1 X108.917 Y124.819 E.22445
G1 X108.917 Y124.285
G1 X114.083 Y119.12 E.22445
G1 X114.083 Y118.587
G1 X108.917 Y123.752 E.22445
G1 X108.917 Y123.219
G1 X114.083 Y118.054 E.22445
G1 X114.083 Y117.52
G1 X108.917 Y122.686 E.22445
G1 X108.917 Y122.152
G1 X114.083 Y116.987 E.22445
G1 X114.083 Y116.454
G1 X108.917 Y121.619 E.22445
G1 X108.917 Y121.086
G1 X114.083 Y115.921 E.22445
G1 X114.083 Y115.387
G1 X108.917 Y120.553 E.22445
G1 X108.917 Y120.019
G1 X114.083 Y114.854 E.22445
G1 X114.083 Y114.321
G1 X108.917 Y119.486 E.22445
G1 X108.917 Y118.953
G1 X114.083 Y113.788 E.22445
G1 X114.083 Y113.254
G1 X108.917 Y118.419 E.22445
G1 X108.917 Y117.886
G1 X114.083 Y112.721 E.22445
G1 X114.083 Y112.188
G1 X108.917 Y117.353 E.22445
G1 X108.917 Y116.82
G1 X114.083 Y111.654 E.22445
G1 X114.083 Y111.121
G1 X108.917 Y116.286 E.22445
G1 X108.917 Y115.753
G1 X114.083 Y110.588 E.22445
G1 X114.083 Y110.055
G1 X108.917 Y115.22 E.22445
G1 X108.917 Y114.687
G1 X114.083 Y109.521 E.22445
G1 X114.083 Y108.988
G1 X108.917 Y114.153 E.22445
G1 X108.917 Y113.62
G1 X114.083 Y108.455 E.22445
G1 X114.083 Y107.922
G1 X108.917 Y113.087 E.22445
G1 X108.917 Y112.554
G1 X114.083 Y107.388 E.22445
G1 X114.083 Y106.855
G1 X108.917 Y112.02 E.22445
G1 X108.917 Y111.487
G1 X114.083 Y106.322 E.22445
G1 X114.083 Y105.789
G1 X108.917 Y110.954 E.22445
G1 X108.917 Y110.42
G1 X114.083 Y105.255 E.22445
G1 X114.083 Y104.722
G1 X108.917 Y109.887 E.22445
G1 X108.917 Y109.354
G1 X114.083 Y104.189 E.22445
G1 X114.083 Y103.655
G1 X108.917 Y108.821 E.22445
G1 X108.917 Y108.287
G1 X114.082 Y103.122 E.22444
G1 X113.549 Y103.122
G1 X108.917 Y107.754 E.20127
G1 X108.917 Y107.221
G1 X113.016 Y103.122 E.17809
G1 X112.482 Y103.122
G1 X108.917 Y106.688 E.15492
G1 X108.917 Y106.154
G1 X111.949 Y103.122 E.13175
G1 X111.416 Y103.122
G1 X108.917 Y105.621 E.10857
G1 X108.917 Y105.088
G1 X110.883 Y103.122 E.0854
G1 X110.349 Y103.122
G1 X108.917 Y104.554 E.06223
G1 X108.917 Y104.021
G1 X109.816 Y103.122 E.03905
G1 X109.283 Y103.122
G1 X108.917 Y103.488 E.01588
M204 S10000
G1 X108.906 Y102.99 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.255134
G1 F15000
G1 X114.094 Y102.99 E.08971
; WIPE_START
G1 F24000
G1 X112.094 Y102.99 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I-1.208 J.15 P1  F30000
G1 X116.243 Y136.352 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X115.294 Y135.03 I12.44 J-9.942 E.054
G1 X112.014 Y138.31 E.15384
G1 X109.606 Y138.31 E.07989
G1 X104.762 Y133.465 E.22725
G2 X104.532 Y134.895 I1.768 J1.017 E.04909
G2 X105.479 Y137.169 I33.939 J-12.793 E.08174
G1 X109.744 Y132.904 E.2001
G1 X111.876 Y132.904 E.07072
G1 X117.282 Y138.31 E.2536
G1 X115.653 Y138.31 E.05401
G1 X106.405 Y138.743 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F13696.009
G1 X118.367 Y138.743 E.44836
; CHANGE_LAYER
; Z_HEIGHT: 4.92
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F24000
G1 X116.367 Y138.743 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 37/58
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
G3 Z5.2 I1.199 J-.207 P1  F30000
G1 X115.092 Y131.366 Z5.2
G1 Z4.92
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.28
G1 F3427
G1 X115.093 Y130.553 E.03338
G3 X115.119 Y131.313 I-.742 J.405 E.03239
; WIPE_START
G1 F24000
G1 X115.093 Y130.553 E-.37463
G1 X115.198 Y130.965 E-.20951
G1 X115.119 Y131.313 E-.17586
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.32 I.069 J-1.215 P1  F30000
G1 X107.92 Y130.902 Z5.32
G1 Z4.92
G1 E.8 F1800
G1 F3427
G1 X107.33 Y130.905 E.02423
G3 X107.92 Y129.983 I.833 J-.118 E.04898
G1 X107.92 Y130.842 E.03527
; WIPE_START
G1 F24000
G1 X107.33 Y130.905 E-.22551
G1 X107.347 Y130.588 E-.12081
G1 X107.451 Y130.339 E-.10255
G1 X107.671 Y130.105 E-.12197
G1 X107.92 Y129.983 E-.10558
G1 X107.92 Y130.203 E-.08358
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.32 I1.217 J0 P1  F30000
G1 X107.92 Y127.16 Z5.32
G1 Z4.92
G1 E.8 F1800
G1 F3427
G1 X107.909 Y127.146 E.00069
G3 X107.92 Y126.108 I.656 J-.512 E.04602
G1 X107.92 Y127.1 E.04069
; WIPE_START
G1 F24000
G1 X107.909 Y127.146 E-.01828
G1 X107.733 Y126.638 E-.20461
G1 X107.92 Y126.108 E-.21337
G1 X107.92 Y126.96 E-.32375
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.32 I1.217 J0 P1  F30000
G1 X107.92 Y125.156 Z5.32
G1 Z4.92
G1 E.8 F1800
G1 F3427
G3 X107.92 Y124.45 I.755 J-.353 E.02994
G1 X107.92 Y125.096 E.02653
; WIPE_START
G1 F24000
G1 X107.84 Y124.802 E-.17655
G1 X107.92 Y124.45 E-.20918
G1 X107.92 Y125.096 E-.37427
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.32 I.338 J1.169 P1  F30000
G1 X115.08 Y123.027 Z5.32
G1 Z4.92
G1 E.8 F1800
G1 F3427
G1 X115.08 Y121.305 E.07071
G1 X115.166 Y121.306 E.00352
G3 X115.223 Y123.021 I-.013 J.859 E.10742
G3 X115.14 Y123.027 I-.114 J-1.008 E.0034
; WIPE_START
G1 F24000
G1 X115.08 Y121.305 E-.6548
G1 X115.166 Y121.306 E-.03258
G1 X115.353 Y121.346 E-.07262
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.32 I1.212 J-.112 P1  F30000
G1 X115.08 Y118.391 Z5.32
G1 Z4.92
G1 E.8 F1800
G1 F3427
G1 X115.08 Y116.669 E.07071
G1 X115.166 Y116.67 E.00352
G3 X115.223 Y118.385 I-.013 J.859 E.10742
G3 X115.14 Y118.391 I-.114 J-1.008 E.0034
; WIPE_START
G1 F24000
G1 X115.08 Y116.669 E-.6548
G1 X115.166 Y116.67 E-.03258
G1 X115.353 Y116.71 E-.07262
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.32 I.05 J-1.216 P1  F30000
G1 X107.92 Y116.402 Z5.32
G1 Z4.92
G1 E.8 F1800
G1 F3427
G3 X107.92 Y114.912 I.392 J-.745 E.07509
G1 X107.92 Y116.342 E.05871
; WIPE_START
G1 F24000
G1 X107.579 Y116.069 E-.16582
G1 X107.469 Y115.657 E-.16226
G1 X107.579 Y115.245 E-.16226
G1 X107.92 Y114.912 E-.18094
G1 X107.92 Y115.146 E-.08873
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.32 I1.217 J0 P1  F30000
G1 X107.92 Y104.94 Z5.32
G1 Z4.92
G1 E.8 F1800
G1 F3427
G1 X107.909 Y104.921 E.00089
G3 X107.92 Y104.091 I.737 J-.405 E.03566
G1 X107.92 Y104.88 E.0324
; WIPE_START
G1 F24000
G1 X107.909 Y104.921 E-.01927
G1 X107.804 Y104.509 E-.19117
G1 X107.92 Y104.091 E-.19497
G1 X107.92 Y104.88 E-.35459
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.32 I0 J1.217 P1  F30000
G1 X115.08 Y104.88 Z5.32
G1 Z4.92
G1 E.8 F1800
G1 F3427
G1 X115.08 Y104.106 E.03176
G1 X115.105 Y104.153 E.00217
G3 X115.08 Y104.952 I-.758 J.376 E.03419
G1 X115.08 Y104.94 E.0005
G1 X115.08 Y105.741 F30000
G1 F3427
G1 X115.113 Y105.782 E.00216
G3 X115.08 Y106.823 I-.664 J.5 E.0462
G1 X115.08 Y105.801 E.04194
; WIPE_START
G1 F24000
G1 X115.113 Y105.782 E-.01449
G1 X115.281 Y106.285 E-.20119
G1 X115.235 Y106.55 E-.1022
G1 X115.08 Y106.823 E-.11943
G1 X115.08 Y105.974 E-.3227
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.32 I.005 J1.217 P1  F30000
G1 X152.08 Y105.829 Z5.32
G1 Z4.92
G1 E.8 F1800
G1 F3427
G1 X152.081 Y104.142 E.06926
G3 X152.118 Y105.046 I-.97 J.492 E.03833
G3 X152.08 Y106.15 I-.649 J.53 E.04954
G1 X152.08 Y105.889 E.01076
; WIPE_START
G1 F24000
G1 X152.081 Y104.142 E-.66376
G1 X152.149 Y104.386 E-.09624
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.32 I-.1 J-1.213 P1  F30000
G1 X144.92 Y104.981 Z5.32
G1 Z4.92
G1 E.8 F1800
G1 F3427
G1 X144.911 Y104.967 E.00068
G3 X144.92 Y104.049 I.714 J-.452 E.03985
G1 X144.92 Y104.921 E.03579
; WIPE_START
G1 F24000
G1 X144.911 Y104.967 E-.01919
G1 X144.778 Y104.509 E-.19311
G1 X144.92 Y104.049 E-.19485
G1 X144.92 Y104.921 E-.35285
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.32 I-1.217 J0 P1  F30000
G1 X144.92 Y113.999 Z5.32
G1 Z4.92
G1 E.8 F1800
G1 F3427
G1 X144.891 Y115.722 E.07076
G3 X144.861 Y113.997 I-.04 J-.862 E.1134
; WIPE_START
G1 F24000
G1 X144.891 Y115.722 E-.65588
G1 X144.622 Y115.673 E-.10412
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.32 I-.662 J1.021 P1  F30000
G1 X152.08 Y120.508 Z5.32
G1 Z4.92
G1 E.8 F1800
G1 F3427
G1 X152.166 Y120.509 E.00352
G3 X152.223 Y122.224 I-.013 J.859 E.10742
G3 X152.08 Y122.23 I-.114 J-1.008 E.00587
G1 X152.08 Y120.568 E.06825
; WIPE_START
G1 F24000
G1 X152.166 Y120.509 E-.03957
G1 X152.443 Y120.569 E-.10797
G1 X152.73 Y120.743 E-.12745
G1 X152.928 Y121.005 E-.12455
G1 X153.011 Y121.316 E-.12227
G1 X152.969 Y121.634 E-.12188
M73 P73 R5
G1 X152.817 Y121.899 E-.1163
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.32 I-1.212 J-.109 P1  F30000
G1 X152.092 Y129.989 Z5.32
G1 Z4.92
G1 E.8 F1800
G1 F3427
G3 X152.661 Y130.983 I-.258 J.808 E.05166
G1 X152.08 Y130.94 E.02391
G1 X152.091 Y130.049 E.03659
; WIPE_START
G1 F24000
G1 X152.376 Y130.141 E-.11375
G1 X152.58 Y130.389 E-.12201
G1 X152.676 Y130.699 E-.12324
G1 X152.661 Y130.983 E-.10817
G1 X152.08 Y130.94 E-.22127
G1 X152.082 Y130.752 E-.07155
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.32 I.038 J-1.216 P1  F30000
G1 X144.92 Y130.528 Z5.32
G1 Z4.92
G1 E.8 F1800
G1 F3427
G1 X144.92 Y131.342 E.03343
G1 X144.918 Y131.345 E.00014
G3 X144.893 Y130.58 I.731 J-.407 E.03263
; CHANGE_LAYER
; Z_HEIGHT: 5
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F24000
G1 X144.92 Y131.342 E-.37297
G1 X144.918 Y131.345 E-.0017
G1 X144.812 Y130.945 E-.20247
G1 X144.893 Y130.58 E-.18285
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 38/58
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
G3 Z5.32 I-.313 J1.176 P1  F30000
G1 X150.54 Y132.081 Z5.32
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F3427
G1 X153.559 Y132.083 E.10015
G3 X155.698 Y135.345 I-.102 J2.399 E.15104
G1 X155.055 Y136.862 E.05467
G3 X153.96 Y138.977 I-31.882 J-15.168 E.07899
G1 X140.874 Y138.977 E.43408
G1 X140.817 Y138.813 E.00576
G2 X145.899 Y132.08 I-10.874 J-13.492 E.28267
G1 X150.48 Y132.081 E.15196
G1 X150.54 Y131.69 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3427
G1 X153.577 Y131.691 E.09332
G3 X156.063 Y135.488 I-.121 J2.792 E.16276
G1 X155.412 Y137.023 E.05124
G3 X154.186 Y139.369 I-26.659 J-12.445 E.08135
G1 X139.403 Y139.369 E.45426
G2 X145.639 Y131.688 I-9.45 J-14.045 E.30852
G1 X150.48 Y131.69 E.14875
M204 S10000
; WIPE_START
G1 F24000
G1 X152.48 Y131.69 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I-.329 J-1.172 P1  F30000
G1 X145.543 Y133.636 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3427
G3 X144.71 Y135.034 I-14.505 J-7.701 E.054
G1 X147.786 Y138.11 E.14429
G1 X150.594 Y138.11 E.09316
G1 X155.234 Y133.47 E.21765
G3 X155.37 Y135.226 I-2.083 J1.045 E.0599
G3 X154.521 Y137.169 I-22.207 J-8.547 E.07037
G1 X149.781 Y132.43 E.22234
G1 X148.599 Y132.429 E.03923
G1 X142.918 Y138.11 E.26649
G1 X144.547 Y138.11 E.05401
G1 X140.082 Y139.157 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.322402
G1 F3427
G1 X140.661 Y138.961 E.01392
G1 X141.801 Y138.543 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F3427
G1 X153.647 Y138.543 E.44402
; WIPE_START
G1 F24000
G1 X151.647 Y138.543 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I1.212 J-.108 P1  F30000
G1 X148.5 Y103.376 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3427
G1 X146.102 Y103.376 E.07954
G1 X146.102 Y103.08 E.00981
G1 X150.898 Y103.08 E.15909
G1 X150.898 Y103.376 E.00981
G1 X148.56 Y103.376 E.07755
G1 X148.5 Y103.768 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3427
G1 X145.71 Y103.768 E.08573
G1 X145.71 Y102.688 E.03319
G1 X151.29 Y102.688 E.17146
G1 X151.29 Y103.768 E.03319
G1 X148.56 Y103.768 E.08389
M204 S10000
; WIPE_START
G1 F24000
G1 X146.56 Y103.768 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I.013 J-1.217 P1  F30000
G1 X109.102 Y103.376 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3427
G1 X109.102 Y103.08 E.00981
G1 X113.898 Y103.08 E.15909
G1 X113.898 Y103.376 E.00981
G1 X109.162 Y103.376 E.1571
G1 X108.71 Y103.768 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3427
G1 X108.71 Y102.688 E.03319
G1 X114.29 Y102.688 E.17146
G1 X114.29 Y103.768 E.03319
G1 X108.77 Y103.768 E.16961
M204 S10000
; WIPE_START
G1 F24000
G1 X108.71 Y102.688 E-.41103
G1 X109.628 Y102.688 E-.34897
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I-1.203 J.183 P1  F30000
G1 X114.101 Y132.08 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3427
G1 X114.261 Y132.459 E.01365
G2 X119.374 Y138.977 I15.947 J-7.246 E.27743
G1 X106.038 Y138.977 E.44239
G3 X104.25 Y135.195 I22.72 J-13.057 E.13891
G3 X106.545 Y132.08 I2.289 J-.717 E.14932
G1 X114.041 Y132.08 E.24866
G1 X114.361 Y131.688 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3427
G1 X114.619 Y132.298 E.02034
G2 X120.597 Y139.369 I15.418 J-6.972 E.2882
G1 X105.811 Y139.369 E.45433
G3 X103.876 Y135.314 I23.03 J-13.479 E.13821
G3 X106.54 Y131.688 I2.663 J-.835 E.1608
G1 X114.301 Y131.688 E.23847
M204 S10000
; WIPE_START
G1 F24000
G1 X114.619 Y132.298 E-.26129
G1 X114.968 Y133.024 E-.30636
G1 X115.208 Y133.47 E-.19235
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I-.259 J-1.189 P1  F30000
G1 X114.46 Y133.633 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3427
G2 X115.293 Y135.031 I10.672 J-5.415 E.05403
G1 X112.214 Y138.11 E.14444
G1 X109.406 Y138.11 E.09316
G1 X104.76 Y133.464 E.21793
G2 X104.515 Y134.802 I1.823 J1.026 E.04597
G2 X105.484 Y137.164 I21.362 J-7.384 E.08474
G1 X110.22 Y132.428 E.22218
G1 X111.4 Y132.428 E.03916
G1 X117.082 Y138.11 E.26653
G1 X115.453 Y138.11 E.05401
G1 X106.291 Y138.543 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F3427
G1 X118.138 Y138.543 E.44407
; CHANGE_LAYER
; Z_HEIGHT: 5.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X116.138 Y138.543 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 39/58
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
G3 Z5.4 I1.204 J-.175 P1  F30000
G1 X115.102 Y131.4 Z5.4
G1 Z5.2
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.28
G1 F4995
G2 X114.833 Y130.966 I-.483 J-.001 E.0221
G1 X114.68 Y130.965 E.00627
G1 X114.693 Y130.253 E.02924
G3 X115.126 Y131.345 I-.367 J.778 E.05313
; WIPE_START
G1 F24000
G1 X114.833 Y130.966 E-.18216
G1 X114.68 Y130.965 E-.05806
G1 X114.693 Y130.253 E-.27063
G1 X114.953 Y130.442 E-.12229
G1 X115.124 Y130.729 E-.12687
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I.633 J-1.039 P1  F30000
G1 X114.213 Y130.173 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Support interface
; LAYER_HEIGHT: 0.2
G1 F4800
G1 X114.213 Y130.953 E.02395
G1 X113.345 Y130.946 E.02665
G3 X114.004 Y130.202 I.873 J.109 E.03245
G1 X114.026 Y130.197 E.0007
; WIPE_START
G1 F24000
G1 X114.004 Y130.202 E-.00863
G1 X113.545 Y130.486 E-.20515
G1 X113.345 Y130.946 E-.19045
G1 X114.213 Y130.953 E-.32959
G1 X114.213 Y130.884 E-.02618
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I-.006 J-1.217 P1  F30000
G1 X108.762 Y130.911 Z5.6
G1 Z5.2
G1 E.8 F1800
G1 F4800
G1 X108.689 Y130.911 E.00224
G1 X108.689 Y130.108 E.02466
G3 X108.94 Y130.233 I-.331 J.981 E.00865
G1 X108.95 Y130.913 E.02089
G1 X109.331 Y130.915 E.0117
G2 X109.111 Y130.384 I-.847 J.038 E.01804
G1 X109.092 Y130.364 E.00084
G1 X108.301 Y130.392 F30000
; FEATURE: Support
; LAYER_HEIGHT: 0.28
G1 F4995
G1 X108.32 Y130.916 E.02153
G1 X107.402 Y130.909 E.03768
G3 X108.288 Y130.026 I.815 J-.068 E.05846
G1 X108.299 Y130.332 E.01258
; WIPE_START
G1 F24000
G1 X108.32 Y130.916 E-.22205
G1 X107.402 Y130.909 E-.34869
G1 X107.455 Y130.546 E-.13932
G1 X107.528 Y130.437 E-.04994
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I1.178 J.307 P1  F30000
G1 X108.32 Y127.403 Z5.6
G1 Z5.2
G1 E.8 F1800
G1 F4995
G3 X108.32 Y125.924 I.358 J-.739 E.07553
G1 X108.32 Y127.343 E.05824
; WIPE_START
G1 F24000
G1 X107.997 Y127.111 E-.15106
G1 X107.857 Y126.661 E-.17923
G1 X107.987 Y126.216 E-.17601
G1 X108.32 Y125.924 E-.16834
G1 X108.32 Y126.149 E-.08536
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I1.217 J0 P1  F30000
G1 X108.32 Y125.466 Z5.6
G1 Z5.2
G1 E.8 F1800
G1 F4995
G3 X108.32 Y124.133 I.464 J-.666 E.0642
G1 X108.32 Y125.406 E.05226
; WIPE_START
G1 F24000
G1 X108.052 Y125.152 E-.13995
G1 X107.97 Y124.799 E-.13789
G1 X108.054 Y124.445 E-.13819
G1 X108.32 Y124.133 E-.15604
G1 X108.32 Y124.627 E-.18794
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I.493 J1.113 P1  F30000
G1 X108.689 Y124.464 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Support interface
; LAYER_HEIGHT: 0.2
G1 F4800
G1 X108.689 Y123.984 E.01474
G3 X108.95 Y123.973 I.177 J1.086 E.00806
G1 X108.95 Y127.484 E.10786
G2 X109.122 Y127.428 I-.315 J-1.267 E.00556
G2 X109.412 Y125.937 I-.575 J-.885 E.05208
G1 X109.827 Y125.655 E.01543
G1 X109.827 Y124.293 E.04185
G3 X109.967 Y125.529 I-.476 J.68 E.04322
; WIPE_START
G1 F24000
G1 X110.14 Y125.231 E-.13098
G1 X110.177 Y124.87 E-.13818
G1 X110.055 Y124.529 E-.13728
G1 X109.827 Y124.293 E-.12475
G1 X109.827 Y124.895 E-.22882
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I-.232 J1.195 P1  F30000
G1 X113.163 Y125.543 Z5.6
G1 Z5.2
G1 E.8 F1800
G1 F4800
G3 X113.325 Y124.039 I.393 J-.718 E.05926
G1 X113.335 Y125.617 E.04849
G2 X114.205 Y125.497 I.333 J-.79 E.0283
G1 X114.213 Y124.223 E.03914
; WIPE_START
G1 F24000
G1 X114.205 Y125.497 E-.48401
G1 X113.779 Y125.679 E-.17577
G1 X113.518 Y125.643 E-.10022
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I1.197 J.219 P1  F30000
G1 X114.213 Y121.842 Z5.6
G1 Z5.2
G1 E.8 F1800
G1 F4800
G1 X114.213 Y122.489 E.01988
G2 X114.307 Y122.65 I1.016 J-.491 E.00574
G1 X114.308 Y121.68 E.0298
G1 X114.687 Y121.682 F30000
; FEATURE: Support
; LAYER_HEIGHT: 0.28
G1 F4995
G1 X114.688 Y121.388 E.01208
G3 X115.071 Y121.33 I.329 J.88 E.01599
G3 X115.126 Y122.997 I-.01 J.835 E.10452
G3 X114.68 Y122.94 I-.11 J-.924 E.01865
G1 X114.686 Y121.742 E.04918
; WIPE_START
G1 F24000
G1 X114.688 Y121.388 E-.13464
G1 X115.071 Y121.33 E-.14691
G1 X115.341 Y121.388 E-.10521
G1 X115.62 Y121.558 E-.1241
G1 X115.813 Y121.812 E-.1211
G1 X115.894 Y122.114 E-.11874
G1 X115.89 Y122.138 E-.00929
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I1.152 J-.392 P1  F30000
G1 X114.213 Y117.206 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Support interface
; LAYER_HEIGHT: 0.2
G1 F4800
G1 X114.213 Y117.854 E.01988
G2 X114.307 Y118.014 I1.016 J-.491 E.00574
G1 X114.308 Y117.045 E.0298
G1 X114.687 Y117.047 F30000
; FEATURE: Support
; LAYER_HEIGHT: 0.28
G1 F4995
G1 X114.688 Y116.752 E.01208
G3 X115.071 Y116.694 I.329 J.88 E.01599
G3 X115.126 Y118.361 I-.01 J.835 E.10452
G3 X114.68 Y118.304 I-.11 J-.924 E.01865
G1 X114.686 Y117.107 E.04918
; WIPE_START
G1 F24000
G1 X114.688 Y116.752 E-.13464
G1 X115.071 Y116.694 E-.14691
G1 X115.341 Y116.752 E-.10521
G1 X115.62 Y116.922 E-.1241
G1 X115.813 Y117.176 E-.1211
G1 X115.894 Y117.478 E-.11874
G1 X115.89 Y117.502 E-.00929
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I.409 J-1.146 P1  F30000
G1 X109.099 Y115.077 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Support interface
; LAYER_HEIGHT: 0.2
G1 F4800
G3 X108.95 Y116.352 I-.554 J.582 E.04571
G1 X108.95 Y114.962 E.04273
G2 X108.694 Y114.855 I-.532 J.914 E.00855
G1 X108.689 Y115.452 E.01837
G1 X108.32 Y115.452 F30000
; FEATURE: Support
; LAYER_HEIGHT: 0.28
G1 F4995
G1 X108.32 Y116.481 E.04224
G1 X108.308 Y116.479 E.0005
G3 X108.32 Y114.833 I.115 J-.822 E.09815
G1 X108.32 Y115.392 E.02298
; WIPE_START
G1 F24000
G1 X108.32 Y116.481 E-.41375
G1 X108.308 Y116.479 E-.00464
G1 X108.047 Y116.389 E-.10503
G1 X107.792 Y116.188 E-.12334
G1 X107.653 Y115.963 E-.10055
G1 X107.647 Y115.93 E-.01269
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I1.215 J.075 P1  F30000
G1 X108.31 Y105.217 Z5.6
G1 Z5.2
G1 E.8 F1800
G1 F4995
G3 X107.92 Y104.028 I.364 J-.778 E.05755
M73 P74 R5
G1 X107.92 Y104.452 E.01741
G2 X108.32 Y104.558 I.253 J-.147 E.01886
G1 X108.311 Y105.157 E.02461
G1 X108.763 Y105.297 F30000
; FEATURE: Support interface
; LAYER_HEIGHT: 0.2
G1 F4800
G1 X108.689 Y105.294 E.00229
G1 X108.689 Y104.566 E.02234
G1 X108.95 Y104.566 E.00804
G1 X108.95 Y105.279 E.02189
G2 X109.65 Y104.566 I-.174 J-.871 E.0326
G1 X109.139 Y104.566 E.01572
; WIPE_START
G1 F24000
G1 X109.65 Y104.566 E-.19445
G1 X109.419 Y105.023 E-.19451
G1 X108.95 Y105.279 E-.20305
G1 X108.95 Y104.837 E-.16799
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I-1.215 J-.064 P1  F30000
G1 X108.689 Y109.798 Z5.6
G1 Z5.2
G1 E.8 F1800
G1 F4800
G3 X108.937 Y109.313 I.367 J-.118 E.01859
G1 X108.95 Y110.821 E.04634
G2 X109.827 Y110.813 I.429 J-1.018 E.02771
G1 X109.827 Y109.311 E.04614
G3 X110.012 Y110.699 I-.322 J.749 E.05174
G1 X109.989 Y110.717 E.0009
; WIPE_START
G1 F24000
G1 X110.012 Y110.699 E-.01117
G1 X110.262 Y110.365 E-.15836
G1 X110.315 Y109.959 E-.15585
G1 X110.16 Y109.577 E-.15667
G1 X109.827 Y109.311 E-.16167
G1 X109.827 Y109.617 E-.11628
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I-.416 J1.144 P1  F30000
G1 X113.171 Y110.833 Z5.6
G1 Z5.2
G1 E.8 F1800
G1 F4800
G3 X113.331 Y109.417 I.475 J-.663 E.05325
G1 X113.336 Y110.925 E.04633
G2 X114.195 Y110.866 I.366 J-.962 E.02731
G1 X114.213 Y109.423 E.04435
; WIPE_START
G1 F24000
G1 X114.195 Y110.866 E-.54843
G1 X113.742 Y110.992 E-.17871
G1 X113.657 Y110.978 E-.03286
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I1.178 J.306 P1  F30000
G1 X114.68 Y107.044 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Support
; LAYER_HEIGHT: 0.28
G1 F4995
G1 X114.707 Y105.57 E.06051
G3 X114.732 Y107.017 I-.372 J.73 E.07284
; WIPE_START
G1 F24000
G1 X114.707 Y105.57 E-.54995
G1 X115.023 Y105.854 E-.16143
G1 X115.06 Y105.977 E-.04862
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I.981 J-.72 P1  F30000
G1 X114.024 Y104.566 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Support interface
; LAYER_HEIGHT: 0.2
G1 F4800
G1 X113.348 Y104.566 E.02079
G2 X113.871 Y105.4 I1.391 J-.293 E.03089
G1 X113.536 Y105.87 E.01775
G2 X114.21 Y107.135 I.683 J.447 E.05368
G1 X114.213 Y104.566 E.07891
G1 X114.68 Y104.566 F30000
; FEATURE: Support
; LAYER_HEIGHT: 0.28
G1 F4995
G1 X114.68 Y104.558 E.00035
G2 X115.08 Y104.452 I.147 J-.253 E.01886
G1 X115.085 Y104.048 E.01662
G3 X114.68 Y105.232 I-.763 J.4 E.05751
G1 X114.68 Y104.626 E.02485
; WIPE_START
G1 F24000
G1 X114.68 Y104.558 E-.02606
G1 X114.975 Y104.558 E-.11194
G1 X115.08 Y104.452 E-.05665
G1 X115.085 Y104.048 E-.15383
G1 X115.185 Y104.4 E-.13923
G1 X115.142 Y104.716 E-.12109
G1 X114.949 Y105.038 E-.14239
G1 X114.93 Y105.051 E-.00881
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I.029 J1.217 P1  F30000
G1 X144.805 Y104.339 Z5.6
G1 Z5.2
G1 E.8 F1800
G1 F4995
G3 X144.92 Y104 I.855 J.1 E.01482
G1 X144.92 Y104.452 E.01859
G2 X145.32 Y104.558 I.253 J-.147 E.01886
G1 X145.32 Y105.23 E.02762
G3 X144.8 Y104.398 I.34 J-.791 E.04286
; WIPE_START
G1 F24000
G1 X144.92 Y104 E-.15818
G1 X144.92 Y104.452 E-.17202
G1 X145.025 Y104.558 E-.05665
G1 X145.32 Y104.558 E-.11194
G1 X145.32 Y105.23 E-.25561
G1 X145.308 Y105.222 E-.0056
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I.982 J.718 P1  F30000
G1 X145.787 Y104.566 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Support interface
; LAYER_HEIGHT: 0.2
G1 F4800
G1 X145.787 Y105.296 E.02242
G2 X146.633 Y104.566 I-.03 J-.889 E.03709
G1 X145.976 Y104.566 E.02017
; WIPE_START
G1 F24000
G1 X146.633 Y104.566 E-.24949
G1 X146.362 Y105.061 E-.21417
G1 X146.083 Y105.234 E-.12486
G1 X145.787 Y105.296 E-.11462
G1 X145.787 Y105.146 E-.05686
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I.119 J1.211 P1  F30000
G1 X151.68 Y104.566 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Support
; LAYER_HEIGHT: 0.28
G1 F4995
G1 X151.68 Y104.558 E.00035
G2 X152.08 Y104.452 I.147 J-.253 E.01886
G1 X152.087 Y104.074 E.01553
G3 X152.024 Y105.085 I-.985 J.446 E.0433
G3 X151.68 Y106.337 I-.664 J.49 E.06131
G1 X151.68 Y104.626 E.07024
; WIPE_START
G1 F24000
G1 X151.68 Y104.558 E-.02606
G1 X151.975 Y104.558 E-.11194
G1 X152.08 Y104.452 E-.05665
G1 X152.087 Y104.074 E-.14376
G1 X152.185 Y104.535 E-.17902
G1 X152.024 Y105.085 E-.21798
G1 X152.05 Y105.145 E-.0246
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I-.858 J-.863 P1  F30000
G1 X151.311 Y105.88 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Support interface
; LAYER_HEIGHT: 0.2
G1 F4800
G1 X151.311 Y106.407 E.01622
G3 X151.05 Y106.37 I.019 J-1.078 E.00814
G1 X151.05 Y104.566 E.05543
G1 X150.347 Y104.566 E.02161
G2 X150.546 Y105.1 I1.407 J-.22 E.01763
G2 X150.876 Y106.299 I.749 J.438 E.04258
; WIPE_START
G1 F24000
G1 X150.6 Y106.063 E-.13804
G1 X150.462 Y105.783 E-.11844
G1 X150.442 Y105.476 E-.11697
G1 X150.546 Y105.1 E-.14811
G1 X150.347 Y104.566 E-.21652
G1 X150.404 Y104.566 E-.02192
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I-1.199 J.207 P1  F30000
G1 X151.311 Y109.826 Z5.6
G1 Z5.2
G1 E.8 F1800
G1 F4800
G2 X151.05 Y109.335 I-.324 J-.142 E.01965
G1 X151.05 Y110.909 E.04836
G3 X150.189 Y110.865 I-.388 J-.868 E.02748
G1 X150.173 Y109.484 E.04245
G2 X150.026 Y110.734 I.449 J.686 E.04407
G1 X150.027 Y110.735 E.00007
; WIPE_START
G1 F24000
G1 X150.026 Y110.734 E-.00091
G1 X149.839 Y110.424 E-.13725
G1 X149.806 Y110.066 E-.13668
G1 X149.934 Y109.725 E-.13837
G1 X150.173 Y109.484 E-.12897
G1 X150.18 Y110.057 E-.21783
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I-.272 J-1.186 P1  F30000
G1 X146.835 Y110.823 Z5.6
G1 Z5.2
G1 E.8 F1800
G1 F4800
G2 X146.665 Y109.339 I-.417 J-.704 E.05782
G1 X146.665 Y110.902 E.04801
G3 X145.787 Y110.79 I-.318 J-1.004 E.02804
G1 X145.787 Y109.443 E.0414
; WIPE_START
M73 P74 R4
G1 F24000
G1 X145.787 Y110.79 E-.51205
G1 X146.171 Y110.94 E-.15662
G1 X146.411 Y110.922 E-.09134
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I-1.113 J-.491 P1  F30000
G1 X145.041 Y114.025 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Support
; LAYER_HEIGHT: 0.28
G1 F4995
G3 X145.32 Y114.086 I-.088 J1.064 E.01177
G1 X145.312 Y115.638 E.06373
G3 X144.982 Y114.021 I-.356 J-.77 E.12562
G1 X145.692 Y114.375 F30000
; FEATURE: Support interface
; LAYER_HEIGHT: 0.2
G1 F4800
G1 X145.689 Y115.35 E.02996
G2 X145.775 Y115.211 I-1.139 J-.807 E.00505
G1 X145.787 Y114.537 E.0207
; WIPE_START
G1 F24000
G1 X145.775 Y115.211 E-.28247
G1 X145.689 Y115.35 E-.06881
G1 X145.692 Y114.375 E-.40871
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I-.876 J.845 P1  F30000
G1 X151.688 Y120.592 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Support
; LAYER_HEIGHT: 0.28
G1 F4995
G3 X152.071 Y120.534 I.329 J.88 E.01599
G3 X152.126 Y122.2 I-.01 J.835 E.10452
G3 X151.68 Y122.144 I-.11 J-.924 E.01865
G1 X151.688 Y120.652 E.06126
; WIPE_START
G1 F24000
G1 X152.071 Y120.534 E-.15213
G1 X152.341 Y120.592 E-.10521
G1 X152.62 Y120.761 E-.12411
G1 X152.813 Y121.015 E-.12111
G1 X152.894 Y121.317 E-.11874
G1 X152.853 Y121.626 E-.11835
G1 X152.826 Y121.673 E-.02036
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I-.109 J-1.212 P1  F30000
G1 X151.311 Y121.809 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Support interface
; LAYER_HEIGHT: 0.2
G1 F4800
G1 X151.311 Y120.88 E.02855
G2 X151.307 Y121.854 I.629 J.49 E.03219
; WIPE_START
G1 F24000
G1 X151.143 Y121.369 E-.19844
G1 X151.311 Y120.88 E-.20092
G1 X151.311 Y121.809 E-.36064
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I-1.217 J0 P1  F30000
G1 X151.311 Y124.656 Z5.6
G1 Z5.2
G1 E.8 F1800
G1 F4800
G2 X151.064 Y124.173 I-.401 J-.1 E.0182
G1 X151.05 Y125.692 E.04668
G3 X150.173 Y125.617 I-.362 J-.94 E.02799
G1 X150.173 Y124.183 E.04406
G2 X150.021 Y125.506 I.386 J.714 E.04796
; WIPE_START
G1 F24000
G1 X149.808 Y125.204 E-.14034
G1 X149.752 Y124.795 E-.1568
G1 X149.874 Y124.458 E-.13643
G1 X150.173 Y124.183 E-.15414
G1 X150.173 Y124.637 E-.17229
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I-.285 J-1.183 P1  F30000
G1 X146.827 Y125.444 Z5.6
G1 Z5.2
G1 E.8 F1800
G1 F4800
G2 X146.683 Y124.037 I-.466 J-.663 E.05279
G1 X146.665 Y125.539 E.04616
G3 X145.808 Y125.543 I-.432 J-.826 E.02735
G1 X145.787 Y124.098 E.0444
; WIPE_START
G1 F24000
G1 X145.808 Y125.543 E-.54904
G1 X146.208 Y125.646 E-.15706
G1 X146.346 Y125.613 E-.0539
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I-1.188 J-.264 P1  F30000
G1 X145.32 Y130.235 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Support
; LAYER_HEIGHT: 0.28
G1 F4995
G1 X145.32 Y130.898 E.02721
G2 X145.139 Y130.946 I-.049 J.181 E.00803
G1 X144.894 Y131.365 E.01994
G3 X145.267 Y130.262 I.792 J-.347 E.05242
G1 X145.787 Y130.156 F30000
; FEATURE: Support interface
; LAYER_HEIGHT: 0.2
G1 F4800
G1 X145.787 Y130.889 E.02254
G1 X146.657 Y130.89 E.02672
G2 X146.003 Y130.185 I-.867 J.149 E.03124
G1 X145.974 Y130.178 E.00092
; WIPE_START
G1 F24000
G1 X146.003 Y130.185 E-.01133
G1 X146.426 Y130.43 E-.18553
G1 X146.657 Y130.89 E-.1955
G1 X145.787 Y130.889 E-.33045
G1 X145.787 Y130.792 E-.03718
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I-.024 J1.217 P1  F30000
G1 X150.861 Y130.891 Z5.6
G1 Z5.2
G1 E.8 F1800
G1 F4800
G1 X150.673 Y130.891 E.00579
G3 X151.05 Y130.245 I.871 J.075 E.02375
G1 X151.05 Y130.891 E.01986
G1 X151.311 Y130.891 E.00804
G1 X151.311 Y130.111 E.02396
G2 X151.214 Y130.15 I.281 J.86 E.00322
G1 X151.213 Y130.15 E.00004
G1 X151.68 Y130.15 F30000
; FEATURE: Support
; LAYER_HEIGHT: 0.28
G1 F4995
G1 X151.68 Y130.033 E.00481
G3 X151.822 Y130.028 I.106 J.914 E.00584
G3 X152.601 Y130.9 I-.035 J.815 E.05354
G1 X151.68 Y130.9 E.03782
G1 X151.68 Y130.21 E.02831
; WIPE_START
G1 F24000
G1 X151.68 Y130.033 E-.06728
G1 X151.822 Y130.028 E-.054
G1 X152.129 Y130.102 E-.12007
G1 X152.382 Y130.284 E-.11862
G1 X152.548 Y130.55 E-.1188
G1 X152.601 Y130.9 E-.13473
G1 X152.216 Y130.9 E-.14651
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I-.712 J-.987 P1  F30000
G1 X150.579 Y132.081 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F4995
G1 X153.543 Y132.082 E.09832
G3 X155.698 Y135.345 I-.085 J2.399 E.15156
G1 X155.05 Y136.873 E.05508
G3 X154.075 Y138.777 I-35.581 J-17.02 E.07094
G1 X140.871 Y138.777 E.43801
G2 X145.899 Y132.08 I-10.919 J-13.435 E.28058
G1 X150.519 Y132.081 E.15326
G1 X150.579 Y131.689 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4995
G1 X153.556 Y131.69 E.09145
G3 X156.063 Y135.488 I-.099 J2.792 E.16342
G1 X155.407 Y137.034 E.05161
G3 X154.301 Y139.169 I-32.199 J-15.332 E.07388
G1 X139.693 Y139.169 E.44887
G2 X145.639 Y131.688 I-9.737 J-13.843 E.29769
G1 X150.519 Y131.689 E.14995
M204 S10000
; WIPE_START
G1 F24000
G1 X152.519 Y131.69 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I-.327 J-1.172 P1  F30000
G1 X145.543 Y133.636 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4995
G3 X144.71 Y135.034 I-14.402 J-7.642 E.054
G1 X147.586 Y137.91 E.13492
G1 X150.794 Y137.91 E.10643
G1 X155.234 Y133.47 E.20827
G3 X155.37 Y135.226 I-2.083 J1.045 E.0599
G3 X154.516 Y137.164 I-16.656 J-6.179 E.07031
G1 X149.781 Y132.43 E.22213
G1 X148.599 Y132.429 E.03923
G1 X143.118 Y137.91 E.25711
G1 X142.347 Y137.91 E.02558
G2 X142.946 Y137.297 I-6.205 J-6.672 E.02844
G1 X142.023 Y138.343 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F4995
G1 X153.762 Y138.343 E.44001
; WIPE_START
G1 F24000
G1 X151.762 Y138.343 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I1.212 J-.113 P1  F30000
G1 X148.5 Y103.376 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4995
G1 X146.102 Y103.376 E.07954
G1 X146.102 Y103.08 E.00981
G1 X150.898 Y103.08 E.15909
G1 X150.898 Y103.376 E.00981
G1 X148.56 Y103.376 E.07755
G1 X148.5 Y103.768 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4995
G1 X145.71 Y103.768 E.08573
G1 X145.71 Y102.688 E.03319
G1 X151.29 Y102.688 E.17146
G1 X151.29 Y103.768 E.03319
G1 X148.56 Y103.768 E.08389
M204 S10000
; WIPE_START
G1 F24000
G1 X146.56 Y103.768 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I.013 J-1.217 P1  F30000
G1 X109.102 Y103.376 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4995
G1 X109.102 Y103.08 E.00981
G1 X113.898 Y103.08 E.15909
G1 X113.898 Y103.376 E.00981
G1 X109.162 Y103.376 E.1571
G1 X108.71 Y103.768 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4995
G1 X108.71 Y102.688 E.03319
G1 X114.29 Y102.688 E.17146
G1 X114.29 Y103.768 E.03319
G1 X108.77 Y103.768 E.16961
M204 S10000
; WIPE_START
G1 F24000
G1 X108.71 Y102.688 E-.41103
G1 X109.628 Y102.688 E-.34897
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I-1.203 J.183 P1  F30000
G1 X114.101 Y132.08 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4995
G1 X114.26 Y132.457 E.01358
G2 X119.136 Y138.777 I15.794 J-7.144 E.26717
G1 X105.924 Y138.777 E.43826
G3 X104.249 Y135.194 I22.231 J-12.571 E.13133
G3 X106.545 Y132.08 I2.298 J-.709 E.14908
G1 X114.041 Y132.08 E.24866
G1 X114.361 Y131.688 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4995
G1 X114.618 Y132.296 E.02029
G2 X120.312 Y139.169 I15.412 J-6.973 E.27753
G1 X105.697 Y139.169 E.44908
G3 X103.876 Y135.312 I22.338 J-12.906 E.1312
G3 X106.54 Y131.688 I2.673 J-.826 E.16056
G1 X114.301 Y131.688 E.23847
M204 S10000
; WIPE_START
G1 F24000
G1 X114.618 Y132.296 E-.26068
G1 X114.967 Y133.022 E-.30606
G1 X115.208 Y133.47 E-.19326
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I-.262 J-1.188 P1  F30000
G1 X114.456 Y133.635 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4995
G2 X115.293 Y135.031 I12.236 J-6.386 E.05401
G1 X112.414 Y137.91 E.13505
G1 X109.206 Y137.91 E.10643
G1 X104.759 Y133.463 E.20861
G2 X104.508 Y134.757 I1.807 J1.022 E.0445
G2 X105.484 Y137.164 I19.087 J-6.332 E.08622
G1 X110.22 Y132.428 E.22219
G1 X111.4 Y132.428 E.03916
G1 X116.882 Y137.91 E.25715
G1 X117.649 Y137.91 E.02544
G3 X117.05 Y137.29 I5.898 J-6.295 E.02858
G1 X106.177 Y138.343 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502906
G1 F4995
G1 X117.917 Y138.343 E.44005
; CHANGE_LAYER
; Z_HEIGHT: 5.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X115.917 Y138.343 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 40/58
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
G3 Z5.6 I1.209 J-.141 P1  F30000
G1 X115.109 Y131.396 Z5.6
G1 Z5.4
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F8589
G2 X114.845 Y130.992 I-.464 J.015 E.01561
G1 X113.278 Y130.944 E.04818
G3 X113.942 Y130.119 I1.345 J.402 E.03337
G1 X113.942 Y125.881 E.1302
G1 X113.858 Y125.778 E.00409
G3 X112.716 Y125.195 I.001 J-1.413 E.04088
G1 X112.6 Y125.174 E.00362
G3 X110.395 Y125.192 I-1.118 J-1.911 E.07093
G2 X109.506 Y125.884 I100.903 J130.56 E.03464
G1 X109.472 Y126.004 E.00383
G3 X109.099 Y127.546 I-.779 J.627 E.05629
G1 X109.058 Y130.195 E.08143
G3 X109.437 Y130.928 I-.822 J.888 E.02586
G1 X107.478 Y130.906 E.0602
G3 X108.604 Y130.015 I1.018 J.13 E.04887
G1 X108.689 Y129.912 E.00411
G1 X108.689 Y127.631 E.07008
G3 X107.983 Y126.634 I.753 J-1.281 E.03867
G3 X108.526 Y125.783 I1.152 J.136 E.03208
G1 X108.534 Y125.65 E.00409
G3 X108.689 Y123.917 I.663 J-.814 E.06299
G1 X108.689 Y116.658 E.22306
G1 X108.625 Y116.563 E.00351
G3 X107.913 Y115.143 I.057 J-.917 E.05895
G3 X108.625 Y114.751 I.996 J.968 E.02535
G1 X108.689 Y114.656 E.00351
G1 X108.689 Y110.681 E.12214
G3 X108.689 Y109.444 I.767 J-.619 E.04111
G1 X108.689 Y105.409 E.12397
G3 X108.118 Y105.057 I7.852 J-13.358 E.0206
G3 X107.911 Y104.031 I.529 J-.64 E.03477
M73 P75 R4
G1 X107.911 Y104.456 E.01305
G1 X108.022 Y104.566 E.0048
G1 X109.714 Y104.572 E.05199
G3 X109.058 Y105.349 I-1.479 J-.583 E.03179
G1 X109.058 Y109.075 E.11449
G1 X109.149 Y109.181 E.00429
G3 X110.402 Y109.716 I.083 J1.54 E.04336
G2 X111.25 Y109.485 I-1.253 J-6.266 E.02703
G3 X112.718 Y109.809 I.19 J2.625 E.04683
G3 X113.873 Y109.233 I1.889 J2.344 E.03996
G1 X113.942 Y109.135 E.00368
G1 X113.942 Y107.238 E.0583
G3 X113.359 Y106.079 I.58 J-1.017 E.04223
G3 X113.805 Y105.454 I1.595 J.664 E.02379
G1 X113.801 Y105.314 E.0043
G3 X113.283 Y104.566 I.735 J-1.061 E.02854
G1 X114.978 Y104.566 E.05208
G1 X115.089 Y104.456 E.0048
G1 X115.089 Y104.04 E.01278
G3 X114.62 Y105.331 I-.924 J.395 E.04648
G1 X114.608 Y105.469 E.00423
G3 X114.357 Y107.179 I-.59 J.787 E.06488
G1 X114.311 Y109.431 E.06922
G3 X114.311 Y110.813 I-.689 J.691 E.04719
G1 X114.311 Y116.594 E.17762
G1 X114.418 Y116.704 E.0047
G3 X115.767 Y117.429 I.283 J1.091 E.05175
G3 X115.772 Y117.58 I-.86 J.104 E.00465
G3 X114.973 Y118.34 I-.832 J-.075 E.03699
G1 X114.418 Y118.356 E.01705
G1 X114.311 Y118.466 E.0047
G1 X114.311 Y121.23 E.08492
G1 X114.418 Y121.339 E.0047
G3 X115.767 Y122.065 I.283 J1.09 E.05175
G3 X115.772 Y122.216 I-.86 J.104 E.00465
G3 X114.973 Y122.976 I-.832 J-.075 E.03699
G1 X114.418 Y122.992 E.01705
G1 X114.311 Y123.102 E.0047
G1 X114.311 Y124.288 E.03644
G3 X114.311 Y125.437 I-.789 J.575 E.03776
G1 X114.311 Y130.058 E.14197
G3 X114.884 Y130.41 I-7.677 J13.108 E.02066
G3 X115.132 Y131.342 I-.528 J.639 E.03161
; WIPE_START
G1 F24000
G1 X114.845 Y130.992 E-.17204
G1 X113.299 Y130.945 E-.58796
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I1.184 J-.283 P1  F30000
G1 X111.89 Y125.063 Z5.8
G1 Z5.4
G1 E.8 F1800
G1 F8589
G1 X111.869 Y125.074 E.00073
G1 X111.061 Y125.056 E.02485
G1 X110.359 Y124.654 E.02485
G1 X109.988 Y124.11 E.02024
G1 X109.864 Y123.391 E.02241
G1 X110.104 Y122.619 E.02485
G1 X110.677 Y122.061 E.02457
G1 X111.454 Y121.84 E.02485
G3 X112.588 Y124.703 I.043 J1.639 E.12292
G1 X111.944 Y125.036 E.02228
; WIPE_START
G1 F24000
G1 X111.869 Y125.074 E-.03179
G1 X111.061 Y125.056 E-.30729
G1 X110.359 Y124.654 E-.30728
G1 X110.191 Y124.407 E-.11364
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I.504 J1.108 P1  F30000
G1 X113.715 Y122.805 Z5.8
G1 Z5.4
G1 E.8 F1800
G1 F8589
G1 X112.753 Y121.907 E.04043
G2 X110.496 Y121.738 I-1.272 J1.826 E.07296
G1 X109.263 Y122.624 E.04664
G1 X109.058 Y122.519 E.00708
G1 X109.058 Y116.403 E.18792
G2 X109.058 Y114.911 I-.565 J-.746 E.05309
G1 X109.058 Y112.21 E.08296
G1 X109.289 Y112.113 E.00769
G1 X110.248 Y113.048 E.04115
G2 X112.504 Y113.218 I1.272 J-1.826 E.07295
G1 X113.737 Y112.332 E.04664
G1 X113.942 Y112.437 E.00708
G1 X113.942 Y122.706 E.31556
G1 X113.77 Y122.781 E.00575
; WIPE_START
G1 F24000
G1 X112.753 Y121.907 E-.50956
G1 X112.416 Y121.69 E-.1521
G1 X112.167 Y121.62 E-.09834
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I1.217 J-.02 P1  F30000
G1 X112.026 Y113.028 Z5.8
G1 Z5.4
G1 E.8 F1800
G1 F8589
G3 X110.54 Y110.15 I-.526 J-1.551 E.14302
G1 X110.974 Y109.926 E.01501
G1 X111.454 Y109.84 E.01501
G3 X112.081 Y113.008 I.045 J1.637 E.1412
; WIPE_START
G1 F24000
G1 X111.382 Y113.112 E-.26866
G1 X110.897 Y113.001 E-.18914
G1 X110.359 Y112.654 E-.24324
G1 X110.266 Y112.53 E-.05896
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I-1.104 J.512 P1  F30000
G1 X115.09 Y122.941 Z5.8
G1 Z5.4
G1 E.8 F1800
G1 F8589
G1 X115.09 Y121.391 E.04765
; WIPE_START
G1 F24000
G1 X115.09 Y122.941 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I1.217 J0 P1  F30000
G1 X115.09 Y118.305 Z5.8
G1 Z5.4
G1 E.8 F1800
G1 F8589
G1 X115.09 Y116.755 E.04765
; WIPE_START
G1 F24000
G1 X115.09 Y118.305 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I-1.214 J-.084 P1  F30000
G1 X114.213 Y130.965 Z5.8
G1 Z5.4
G1 E.8 F1800
G1 F8589
G1 X114.213 Y104.585 E.81059
; WIPE_START
G1 F24000
G1 X114.213 Y106.585 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I-1.216 J-.056 P1  F30000
G1 X113.335 Y125.644 Z5.8
G1 Z5.4
G1 E.8 F1800
G1 F8589
G1 X113.335 Y122.477 E.09733
; WIPE_START
G1 F24000
G1 X113.335 Y124.477 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I1.217 J0 P1  F30000
G1 X113.336 Y112.597 Z5.8
G1 Z5.4
G1 E.8 F1800
G1 F8589
G1 X113.317 Y109.634 E.09103
G2 X112.904 Y109.968 I1.068 J1.743 E.01636
G3 X112.458 Y109.909 I-.174 J-.4 E.0145
G1 X112.458 Y110.128 E.00671
; WIPE_START
G1 F24000
G1 X112.458 Y109.909 E-.08304
G1 X112.698 Y110.003 E-.09761
G1 X112.904 Y109.968 E-.07952
G1 X113.317 Y109.634 E-.2018
G1 X113.322 Y110.419 E-.29803
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I-1.186 J-.273 P1  F30000
G1 X109.827 Y125.611 Z5.8
G1 Z5.4
G1 E.8 F1800
G1 F8589
G1 X109.827 Y122.242 E.10352
; WIPE_START
G1 F24000
G1 X109.827 Y124.242 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I1.217 J0 P1  F30000
G1 X109.827 Y112.612 Z5.8
G1 Z5.4
G1 E.8 F1800
G1 F8589
G1 X109.827 Y109.32 E.10116
; WIPE_START
G1 F24000
G1 X109.827 Y111.32 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I-1.216 J-.054 P1  F30000
G1 X108.95 Y130.904 Z5.8
G1 Z5.4
G1 E.8 F1800
G1 F8589
G1 X108.95 Y104.585 E.8087
; WIPE_START
G1 F24000
G1 X108.95 Y106.585 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I-1.216 J-.044 P1  F30000
G1 X108.073 Y130.894 Z5.8
G1 Z5.4
G1 E.8 F1800
G1 F8589
G1 X108.073 Y130.147 E.02295
; WIPE_START
G1 F24000
G1 X108.073 Y130.894 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I1.217 J0 P1  F30000
G1 X108.073 Y116.291 Z5.8
G1 Z5.4
G1 E.8 F1800
G1 F8589
G1 X108.073 Y115.023 E.03897
; WIPE_START
G1 F24000
G1 X108.073 Y116.291 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I.045 J1.216 P1  F30000
G1 X144.233 Y114.961 Z5.8
G1 Z5.4
G1 E.8 F1800
G1 F8589
G3 X145.027 Y114.051 I.824 J-.083 E.0416
G1 X145.582 Y114.034 E.01705
G1 X145.689 Y113.924 E.0047
G1 X145.689 Y110.744 E.09773
G3 X145.688 Y109.459 I.777 J-.643 E.04278
G1 X145.689 Y105.417 E.12422
G3 X145.144 Y105.09 I13.787 J-23.573 E.01952
G3 X144.911 Y104.007 I.488 J-.671 E.03724
G1 X144.911 Y104.456 E.01379
G1 X145.022 Y104.566 E.0048
G1 X146.7 Y104.572 E.05157
G3 X146.058 Y105.338 I-1.473 J-.582 E.03126
G1 X146.058 Y109.121 E.11623
G1 X146.142 Y109.225 E.00408
G3 X147.297 Y109.763 I-.038 J1.592 E.04031
G1 X147.406 Y109.779 E.00337
G3 X149.689 Y109.797 I1.126 J1.959 E.07356
G3 X150.874 Y109.218 I1.935 J2.455 E.04082
G1 X150.942 Y109.121 E.00365
G1 X150.942 Y106.459 E.08177
G3 X150.467 Y105.008 I.547 J-.982 E.05157
G3 X150.281 Y104.566 I.993 J-.679 E.01483
G1 X151.978 Y104.566 E.05215
G1 X152.089 Y104.456 E.0048
G1 X152.089 Y104.059 E.0122
G3 X151.966 Y105.135 I-.942 J.437 E.03502
G3 X151.363 Y106.438 I-.815 J.414 E.05073
G1 X151.311 Y109.424 E.09176
G3 X151.311 Y110.812 I-.717 J.694 E.04717
G1 X151.311 Y120.433 E.29563
G1 X151.418 Y120.543 E.0047
G3 X152.767 Y121.269 I.283 J1.09 E.05175
G3 X152.772 Y121.42 I-.86 J.104 E.00465
G3 X151.973 Y122.179 I-.832 J-.075 E.03699
G1 X151.418 Y122.196 E.01705
G1 X151.311 Y122.306 E.0047
G1 X151.311 Y124.313 E.0617
G3 X151.311 Y125.557 I-.768 J.622 E.04132
G1 X151.311 Y129.914 E.13388
G1 X151.396 Y130.018 E.00411
G3 X152.525 Y130.891 I.109 J1.025 E.04843
G1 X150.569 Y130.89 E.0601
G3 X150.942 Y130.2 I1.227 J.217 E.02454
G1 X150.942 Y125.932 E.13113
G1 X150.858 Y125.829 E.00409
G3 X149.684 Y125.209 I.023 J-1.465 E.04232
G1 X149.569 Y125.188 E.0036
G3 X147.281 Y125.147 I-1.108 J-1.977 E.0737
G3 X146.134 Y125.689 I-1.742 J-2.199 E.03934
G1 X146.058 Y125.79 E.00388
G1 X146.058 Y129.948 E.12776
G3 X146.72 Y130.89 I-.622 J1.141 E.03664
G1 X145.219 Y130.889 E.04615
G1 X144.887 Y131.363 E.01776
G3 X145.633 Y130.113 I.902 J-.309 E.05087
G1 X145.689 Y130.023 E.00326
G1 X145.689 Y125.523 E.13828
G3 X145.687 Y124.122 I.718 J-.701 E.04761
G1 X145.689 Y115.797 E.25583
G1 X145.582 Y115.687 E.0047
G3 X144.254 Y115.017 I-.283 J-1.091 E.0499
; WIPE_START
G1 F24000
G1 X144.268 Y114.612 E-.15414
G1 X144.42 Y114.346 E-.11642
G1 X144.715 Y114.128 E-.13938
G1 X145.027 Y114.051 E-.12229
G1 X145.582 Y114.034 E-.2109
G1 X145.613 Y114.002 E-.01687
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I-1.173 J.326 P1  F30000
G1 X147.83 Y121.982 Z5.8
G1 Z5.4
G1 E.8 F1800
G1 F8589
G1 X148.454 Y121.84 E.01967
G1 X149.094 Y121.951 E.01995
G1 X149.636 Y122.297 E.01977
G1 X149.978 Y122.771 E.01795
G1 X150.137 Y123.401 E.01995
G1 X150.041 Y124.034 E.01967
G1 X149.704 Y124.589 E.01995
G1 X149.178 Y124.969 E.01995
G1 X148.546 Y125.116 E.01995
G1 X147.906 Y125.005 E.01995
G1 X147.359 Y124.654 E.01995
G1 X146.992 Y124.119 E.01995
G1 X146.863 Y123.549 E.01795
G1 X146.962 Y122.913 E.01977
G1 X147.302 Y122.36 E.01995
G1 X147.782 Y122.017 E.01811
G1 X147.629 Y121.678 F30000
G1 F8589
G1 X147.496 Y121.738 E.00448
G1 X146.263 Y122.624 E.04664
G1 X146.058 Y122.519 E.00708
G1 X146.058 Y112.211 E.31675
G1 X146.289 Y112.113 E.00769
G1 X147.248 Y113.048 E.04115
G2 X149.504 Y113.218 I1.272 J-1.826 E.07295
G1 X150.737 Y112.332 E.04664
G1 X150.942 Y112.437 E.00708
G1 X150.942 Y122.706 E.31556
G1 X150.715 Y122.805 E.0076
G1 X149.753 Y121.907 E.04043
G2 X147.866 Y121.595 I-1.272 J1.826 E.06073
G1 X147.685 Y121.658 E.0059
; WIPE_START
G1 F24000
G1 X147.496 Y121.738 E-.07817
G1 X146.263 Y122.624 E-.57674
G1 X146.058 Y122.519 E-.08756
G1 X146.058 Y122.473 E-.01753
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I1.176 J.313 P1  F30000
G1 X148.546 Y113.116 Z5.8
G1 Z5.4
G1 E.8 F1800
G1 F8589
G3 X147.419 Y110.246 I-.046 J-1.638 E.12331
G1 X147.83 Y109.982 E.01501
G1 X148.454 Y109.84 E.01967
G3 X148.605 Y113.113 I.046 J1.638 E.15635
; WIPE_START
G1 F24000
G1 X148.052 Y113.054 E-.21136
G1 X147.482 Y112.762 E-.24324
G1 X147.144 Y112.397 E-.18914
G1 X147.025 Y112.115 E-.11627
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I-1.177 J.308 P1  F30000
G1 X151.927 Y130.872 Z5.8
G1 Z5.4
G1 E.8 F1800
G1 F8589
G1 X151.927 Y130.149 E.02222
; WIPE_START
G1 F24000
G1 X151.927 Y130.872 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I1.217 J0 P1  F30000
G1 X151.927 Y122.162 Z5.8
G1 Z5.4
G1 E.8 F1800
G1 F8589
G1 X151.927 Y120.577 E.04869
; WIPE_START
G1 F24000
G1 X151.927 Y122.162 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I-1.211 J-.122 P1  F30000
G1 X151.05 Y130.872 Z5.8
G1 Z5.4
G1 E.8 F1800
G1 F8589
G1 X151.05 Y104.585 E.80771
; WIPE_START
G1 F24000
G1 X151.05 Y106.585 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I-1.216 J-.056 P1  F30000
G1 X150.173 Y125.626 Z5.8
G1 Z5.4
G1 E.8 F1800
G1 F8589
G1 X150.173 Y122.325 E.10144
; WIPE_START
G1 F24000
G1 X150.173 Y124.325 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I1.217 J0 P1  F30000
G1 X150.173 Y112.714 Z5.8
G1 Z5.4
G1 E.8 F1800
G1 F8589
G1 X150.173 Y109.497 E.09883
; WIPE_START
G1 F24000
G1 X150.173 Y111.497 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I-1.195 J-.229 P1  F30000
G1 X147.542 Y125.229 Z5.8
G1 Z5.4
G1 E.8 F1800
G1 F8589
G1 X147.517 Y125.018 E.00653
G3 X147.251 Y122.146 I.984 J-1.539 E.10214
G1 X146.665 Y122.568 E.02221
G1 X146.665 Y125.515 E.09054
; WIPE_START
G1 F24000
G1 X146.665 Y123.515 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I1.217 J0 P1  F30000
G1 X146.665 Y112.453 Z5.8
G1 Z5.4
G1 E.8 F1800
G1 F8589
G1 X146.665 Y109.359 E.09509
; WIPE_START
G1 F24000
G1 X146.665 Y111.359 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I-1.216 J-.055 P1  F30000
G1 X145.787 Y130.871 Z5.8
G1 Z5.4
G1 E.8 F1800
G1 F8589
G1 X145.787 Y104.585 E.80767
; WIPE_START
G1 F24000
G1 X145.787 Y106.585 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I-1.211 J-.117 P1  F30000
G1 X144.91 Y115.636 Z5.8
G1 Z5.4
G1 E.8 F1800
G1 F8589
G1 X144.91 Y114.085 E.04765
; WIPE_START
G1 F24000
G1 X144.91 Y115.636 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I-.573 J-1.074 P1  F30000
G1 X114.101 Y132.08 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8589
G1 X114.26 Y132.456 E.01356
G2 X118.886 Y138.577 I15.871 J-7.189 E.2566
G1 X105.81 Y138.577 E.43379
G3 X105.69 Y138.363 I3.81 J-2.269 E.00811
G3 X104.234 Y135.144 I24.028 J-12.806 E.11729
G3 X106.545 Y132.08 I2.312 J-.659 E.14739
G1 X114.041 Y132.08 E.24866
G1 X114.361 Y131.688 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8589
G1 X114.617 Y132.295 E.02026
G2 X120.026 Y138.969 I15.529 J-7.057 E.26683
G1 X105.582 Y138.969 E.44382
G3 X105.342 Y138.544 I7.588 J-4.569 E.01499
G3 X103.858 Y135.256 I24.254 J-12.925 E.11095
G3 X106.54 Y131.688 I2.69 J-.77 E.15876
G1 X114.301 Y131.688 E.23846
M204 S10000
; WIPE_START
G1 F24000
G1 X114.617 Y132.295 E-.26027
G1 X114.965 Y133.019 E-.30531
G1 X115.208 Y133.47 E-.19443
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I-.263 J-1.188 P1  F30000
G1 X114.457 Y133.636 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8589
G2 X115.291 Y135.034 I14.301 J-7.584 E.054
G1 X112.614 Y137.71 E.12555
G1 X109.006 Y137.71 E.1197
G1 X104.763 Y133.467 E.19905
G2 X104.5 Y134.693 I1.784 J1.023 E.04227
G2 X105.486 Y137.162 I11.996 J-3.356 E.08836
M73 P76 R4
G1 X110.22 Y132.428 E.22209
G1 X111.4 Y132.428 E.03916
G1 X116.682 Y137.71 E.24777
G1 X117.447 Y137.71 E.02539
G3 X116.858 Y137.079 I6.015 J-6.211 E.02863
G1 X106.076 Y138.143 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502906
G1 F8589
G1 X117.707 Y138.143 E.43596
; WIPE_START
G1 F24000
G1 X115.707 Y138.143 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I1.196 J-.227 P1  F30000
G1 X109.102 Y103.376 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8589
G1 X109.102 Y103.08 E.00981
G1 X113.898 Y103.08 E.15909
G1 X113.898 Y103.376 E.00981
G1 X109.162 Y103.376 E.1571
G1 X108.71 Y103.768 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8589
G1 X108.71 Y102.688 E.03319
G1 X114.29 Y102.688 E.17146
G1 X114.29 Y103.768 E.03319
G1 X108.77 Y103.768 E.16961
M204 S10000
; WIPE_START
G1 F24000
G1 X108.71 Y102.688 E-.41103
G1 X109.628 Y102.688 E-.34897
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I-.022 J1.217 P1  F30000
G1 X148.5 Y103.376 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8589
G1 X146.102 Y103.376 E.07954
G1 X146.102 Y103.08 E.00981
G1 X150.898 Y103.08 E.15909
G1 X150.898 Y103.376 E.00981
G1 X148.56 Y103.376 E.07755
G1 X148.5 Y103.768 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8589
G1 X145.71 Y103.768 E.08573
G1 X145.71 Y102.688 E.03319
G1 X151.29 Y102.688 E.17146
G1 X151.29 Y103.768 E.03319
G1 X148.56 Y103.768 E.08389
M204 S10000
; WIPE_START
G1 F24000
G1 X146.56 Y103.768 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I-1.205 J.173 P1  F30000
G1 X150.622 Y132.081 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8589
G1 X153.52 Y132.082 E.09613
G3 X155.698 Y135.345 I-.066 J2.403 E.15225
G1 X155.045 Y136.885 E.05548
G3 X154.19 Y138.577 I-49.464 J-23.917 E.06289
G1 X141.118 Y138.577 E.43363
G2 X145.899 Y132.08 I-11.377 J-13.38 E.26999
G1 X150.562 Y132.081 E.15467
G1 X150.622 Y131.689 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8589
G1 X153.531 Y131.69 E.08939
G3 X156.063 Y135.488 I-.079 J2.796 E.16408
G1 X155.402 Y137.045 E.05198
G3 X154.416 Y138.969 I-35.688 J-17.08 E.06642
G1 X139.97 Y138.969 E.44388
G2 X145.639 Y131.688 I-9.926 J-13.575 E.28722
G1 X150.562 Y131.689 E.15126
M204 S10000
; WIPE_START
G1 F24000
G1 X152.562 Y131.689 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I-.325 J-1.173 P1  F30000
G1 X145.543 Y133.636 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8589
G3 X144.709 Y135.033 I-14.228 J-7.541 E.054
G1 X147.386 Y137.71 E.12555
G1 X150.994 Y137.71 E.1197
G1 X155.237 Y133.467 E.19904
G3 X155.372 Y135.222 I-1.763 J1.018 E.06037
G3 X154.514 Y137.162 I-15.044 J-5.49 E.07043
G1 X149.781 Y132.429 E.22204
G1 X148.599 Y132.429 E.03921
G1 X143.318 Y137.71 E.24773
G1 X142.548 Y137.71 E.02554
G2 X143.139 Y137.087 I-6.298 J-6.565 E.02848
G1 X142.23 Y138.143 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F8589
G1 X153.863 Y138.143 E.43607
; CHANGE_LAYER
; Z_HEIGHT: 5.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X151.863 Y138.143 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 41/58
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
G3 Z5.8 I1.216 J.042 P1  F30000
G1 X152.116 Y130.89 Z5.8
G1 Z5.6
G1 E.8 F1800
; FEATURE: Support interface
; LINE_WIDTH: 0.42
G1 F4800
G1 X152.472 Y130.86 E.011
G2 X152.098 Y130.27 I-.787 J.085 E.02224
G1 X151.352 Y130.068 F30000
G1 F4800
G3 X151.927 Y130.192 I-.604 J4.187 E.0181
G1 X151.927 Y130.89 E.02145
G1 X151.05 Y130.89 E.02695
G1 X151.05 Y104.566 E.80886
G1 X151.927 Y104.566 E.02695
G1 X151.927 Y105.092 E.01616
G3 X151.87 Y105.968 I-3.661 J.2 E.02703
G3 X151.352 Y106.413 I-.997 J-.638 E.02128
; WIPE_START
G1 F24000
G1 X151.87 Y105.968 E-.25938
G1 X151.927 Y105.092 E-.33353
G1 X151.927 Y104.653 E-.1671
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I-1.14 J.427 P1  F30000
G1 X152.033 Y104.937 Z6
G1 Z5.6
G1 E.8 F1800
G1 F4800
G2 X152.089 Y103.965 I-.655 J-.524 E.03189
G1 X152.089 Y104.539 E.01764
; WIPE_START
G1 F24000
G1 X152.089 Y103.965 E-.27332
G1 X152.217 Y104.467 E-.2465
G1 X152.033 Y104.937 E-.24018
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I-.955 J-.755 P1  F30000
G1 X144.738 Y114.164 Z6
G1 Z5.6
G1 E.8 F1800
G1 F4800
G1 X144.714 Y114.177 E.00083
G2 X144.91 Y115.632 I.402 J.686 E.05742
G1 X144.91 Y114.089 E.0474
G3 X145.486 Y114.018 I.573 J2.259 E.01786
; WIPE_START
G1 F24000
G1 X144.91 Y114.089 E-.22034
G1 X144.91 Y115.509 E-.53967
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I1.205 J.168 P1  F30000
G1 X145.599 Y110.56 Z6
G1 Z5.6
G1 E.8 F1800
G1 F4800
G3 X145.578 Y109.658 I.67 J-.467 E.02937
G1 X146.089 Y109.24 F30000
G1 F4800
G1 X146.665 Y109.33 E.01789
G1 X146.665 Y112.48 E.0968
G1 X146.089 Y111.918 E.0247
; WIPE_START
G1 F24000
G1 X146.665 Y112.48 E-.30544
G1 X146.665 Y111.283 E-.45456
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I-1.054 J.608 P1  F30000
G1 X147.542 Y112.805 Z6
G1 Z5.6
G1 E.8 F1800
G1 F4800
G1 X147.542 Y113.238 E.01332
G2 X148.419 Y113.479 I2.006 J-5.584 E.02798
G1 X148.419 Y113.113 E.01125
G2 X149.296 Y112.909 I.037 J-1.828 E.02796
G1 X149.296 Y113.312 E.01237
G2 X150.173 Y112.737 I-.983 J-2.457 E.03244
G1 X150.173 Y109.422 E.10187
G2 X149.711 Y109.806 I1.211 J1.923 E.01851
G1 X149.296 Y109.643 E.01372
G1 X149.296 Y110.047 E.01243
G2 X148.419 Y109.843 I-.798 J1.44 E.02803
G1 X148.419 Y109.48 E.01113
G2 X147.542 Y109.717 I.096 J2.097 E.02814
G1 X147.542 Y110.149 E.01325
; WIPE_START
G1 F24000
G1 X147.542 Y109.717 E-.16387
G1 X147.86 Y109.574 E-.13284
G1 X148.419 Y109.48 E-.21514
G1 X148.419 Y109.843 E-.13762
G1 X148.708 Y109.874 E-.11052
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I1.05 J-.615 P1  F30000
G1 X145.599 Y104.566 Z6
G1 Z5.6
G1 E.8 F1800
G1 F4800
G1 X144.911 Y104.566 E.02112
G1 X144.911 Y103.93 E.01954
G1 X144.91 Y104.846 E.02812
G2 X145.486 Y105.245 I.839 J-.595 E.02196
G1 X146.089 Y105.268 F30000
G1 F4800
G2 X146.665 Y104.566 I-.111 J-.678 E.03046
G1 X145.787 Y104.566 E.02695
G1 X145.787 Y130.889 E.80883
G1 X146.665 Y130.889 E.02695
G2 X146.089 Y129.948 I-.803 J-.156 E.03723
G1 X145.486 Y130.153 F30000
G1 F4800
G2 X144.91 Y131.322 I.302 J.875 E.04441
G1 X145.16 Y130.889 E.01536
G1 X145.599 Y130.889 E.01348
; WIPE_START
G1 F24000
G1 X145.16 Y130.889 E-.16667
G1 X144.91 Y131.322 E-.18992
G1 X144.91 Y130.633 E-.26202
G1 X145.196 Y130.394 E-.14139
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I1.215 J.069 P1  F30000
G1 X145.535 Y124.395 Z6
G1 Z5.6
G1 E.8 F1800
G1 F4800
G2 X145.599 Y125.358 I.7 J.437 E.03169
G1 X146.089 Y125.744 F30000
G1 F4800
G3 X146.665 Y125.546 I2.369 J5.948 E.01871
G1 X146.665 Y122.336 E.09863
G1 X146.089 Y122.749 E.02178
; WIPE_START
G1 F24000
G1 X146.665 Y122.336 E-.2693
G1 X146.665 Y123.627 E-.4907
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I1.047 J.621 P1  F30000
G1 X147.542 Y122.149 Z6
G1 Z5.6
G1 E.8 F1800
G1 F4800
G1 X147.542 Y121.717 E.01325
G3 X148.419 Y121.48 I.973 J1.86 E.02814
G1 X148.419 Y121.843 E.01113
G3 X149.296 Y122.047 I.079 J1.644 E.02803
G1 X149.296 Y121.643 E.01243
G3 X150.173 Y122.299 I-1.103 J2.388 E.03391
G1 X150.15 Y125.659 E.10323
G3 X149.612 Y125.169 I.991 J-1.629 E.0225
G1 X149.296 Y125.312 E.01066
G1 X149.296 Y124.909 E.01237
G3 X148.419 Y125.113 I-.84 J-1.624 E.02796
G1 X148.419 Y125.479 E.01125
G3 X147.542 Y125.249 I.165 J-2.412 E.02803
G1 X147.542 Y124.805 E.01365
; WIPE_START
G1 F24000
G1 X147.542 Y125.249 E-.16883
G1 X147.956 Y125.412 E-.16914
G1 X148.419 Y125.479 E-.17772
G1 X148.419 Y125.113 E-.13917
G1 X148.694 Y125.09 E-.10515
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I1.053 J.611 P1  F30000
G1 X151.352 Y120.512 Z6
G1 Z5.6
G1 E.8 F1800
G1 F4800
G1 X151.927 Y120.564 E.01775
G1 X151.927 Y122.175 E.04949
G1 X151.352 Y122.227 E.01775
G1 X152.111 Y122.134 F30000
G1 F4800
G2 X152.111 Y120.605 I-.23 J-.764 E.0627
; WIPE_START
G1 F24000
G1 X152.519 Y120.896 E-.19046
G1 X152.68 Y121.369 E-.19015
G1 X152.519 Y121.843 E-.19015
G1 X152.113 Y122.132 E-.18924
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I-.276 J-1.185 P1  F30000
G1 X114.024 Y131.013 Z6
G1 Z5.6
G1 E.8 F1800
G1 F4800
G1 X113.335 Y131.002 E.02116
G3 X113.911 Y130.19 I.684 J-.125 E.03408
G1 X114.514 Y130.226 F30000
G1 F4800
G3 X115.088 Y130.631 I-.264 J.983 E.02205
G1 X115.09 Y131.358 E.02232
G1 X114.899 Y131.026 E.01175
G1 X114.213 Y131.016 E.02109
G1 X114.213 Y104.566 E.81271
G1 X115.089 Y104.566 E.02692
G1 X115.089 Y103.951 E.0189
G1 X115.09 Y104.833 E.0271
G3 X114.514 Y105.387 I-1.718 J-1.209 E.02469
G1 X114.831 Y105.94 E.01958
G3 X114.619 Y106.954 I-.697 J.384 E.03467
G1 X113.911 Y107.218 F30000
G1 F4800
G3 X113.347 Y106.774 I.512 J-1.23 E.02235
G1 X113.336 Y105.938 E.02567
G3 X113.791 Y105.366 I3.195 J2.073 E.02253
G3 X113.352 Y104.879 I3.728 J-3.809 E.02015
G1 X113.336 Y104.566 E.00962
G1 X114.024 Y104.566 E.02116
; WIPE_START
G1 F24000
G1 X113.336 Y104.566 E-.26165
G1 X113.352 Y104.879 E-.11899
G1 X113.791 Y105.366 E-.24909
G1 X113.578 Y105.634 E-.13027
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I-1.198 J.216 P1  F30000
G1 X114.465 Y110.559 Z6
G1 Z5.6
G1 E.8 F1800
G1 F4800
G2 X114.401 Y109.596 I-.7 J-.437 E.03169
; WIPE_START
G1 F24000
G1 X114.59 Y110.073 E-.38424
G1 X114.465 Y110.559 E-.37576
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I.164 J-1.206 P1  F30000
G1 X110.704 Y110.046 Z6
G1 Z5.6
G1 E.8 F1800
G1 F4800
G1 X110.704 Y109.644 E.01237
G3 X111.581 Y109.476 I.82 J1.911 E.02765
G1 X111.581 Y109.843 E.01125
G3 X112.458 Y110.151 I-.084 J1.641 E.02896
G1 X112.458 Y109.707 E.01365
G1 X112.706 Y109.804 E.00817
G3 X113.336 Y109.409 I1.064 J.999 E.02309
G1 X113.336 Y112.62 E.09866
G3 X112.458 Y113.238 I-1.968 J-1.86 E.03319
G1 X112.458 Y112.807 E.01325
G3 X111.581 Y113.113 I-.967 J-1.361 E.02893
G1 X111.581 Y113.475 E.01113
G3 X110.704 Y113.313 I-.078 J-2.026 E.02763
G1 X110.704 Y112.908 E.01243
; WIPE_START
G1 F24000
G1 X110.704 Y113.313 E-.15367
G1 X110.956 Y113.412 E-.10273
G1 X111.581 Y113.475 E-.23889
G1 X111.581 Y113.113 E-.13762
G1 X111.91 Y113.052 E-.12709
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I.419 J-1.143 P1  F30000
G1 X109.252 Y112.077 Z6
G1 Z5.6
G1 E.8 F1800
G1 F4800
G1 X109.827 Y112.638 E.0247
G1 X109.827 Y109.278 E.10324
G2 X109.252 Y109.214 I-.612 J2.859 E.01782
; WIPE_START
G1 F24000
G1 X109.827 Y109.278 E-.22003
G1 X109.827 Y110.699 E-.53997
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I1.162 J-.361 P1  F30000
G1 X107.911 Y104.539 Z6
G1 Z5.6
G1 E.8 F1800
G1 F4800
G1 X107.911 Y103.945 E.01825
G2 X108.073 Y105.017 I.699 J.442 E.0363
G1 X108.073 Y104.566 E.01384
G1 X108.95 Y104.566 E.02695
G1 X108.95 Y130.933 E.81017
G1 X108.073 Y130.919 E.02695
G1 X108.073 Y130.191 E.02239
G2 X107.526 Y130.91 I.242 J.752 E.02957
G1 X107.885 Y130.916 E.01103
; WIPE_START
G1 F24000
G1 X107.526 Y130.91 E-.13636
G1 X107.674 Y130.48 E-.17281
G1 X108.073 Y130.191 E-.18728
G1 X108.073 Y130.884 E-.26355
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I1.149 J.4 P1  F30000
G1 X109.252 Y127.496 Z6
G1 Z5.6
G1 E.8 F1800
G1 F4800
G2 X109.488 Y127.352 I-.622 J-1.287 E.0085
G2 X109.48 Y125.905 I-.846 J-.719 E.04844
G1 X109.827 Y125.636 E.01349
G1 X109.827 Y122.219 E.105
G1 X109.252 Y122.632 E.02178
; WIPE_START
G1 F24000
G1 X109.827 Y122.219 E-.26931
G1 X109.827 Y123.51 E-.4907
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I1.044 J.626 P1  F30000
G1 X110.704 Y122.046 Z6
G1 Z5.6
G1 E.8 F1800
G1 F4800
G1 X110.704 Y121.644 E.01237
G3 X111.581 Y121.476 I.82 J1.911 E.02765
G1 X111.581 Y121.843 E.01125
G3 X112.458 Y122.151 I-.084 J1.641 E.02896
G1 X112.458 Y121.717 E.01332
G3 X113.335 Y122.451 I-1.611 J2.817 E.03532
G1 X113.335 Y125.692 E.09958
G3 X112.637 Y125.157 I.357 J-1.19 E.02761
G1 X112.458 Y125.238 E.00603
G1 X112.458 Y124.807 E.01324
G3 X111.581 Y125.113 I-1.022 J-1.522 E.02886
G1 X111.581 Y125.475 E.01113
G3 X110.704 Y125.313 I-.078 J-2.027 E.02763
G1 X110.704 Y124.908 E.01243
; WIPE_START
G1 F24000
G1 X110.704 Y125.313 E-.15367
G1 X110.956 Y125.412 E-.10273
G1 X111.581 Y125.475 E-.23889
G1 X111.581 Y125.113 E-.13762
G1 X111.91 Y125.052 E-.12709
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I-.11 J1.212 P1  F30000
G1 X114.417 Y125.279 Z6
G1 Z5.6
G1 E.8 F1800
G1 F4800
G2 X114.413 Y124.493 I-.73 J-.39 E.02516
G1 X114.401 Y124.473 E.00072
; WIPE_START
G1 F24000
G1 X114.413 Y124.493 E-.02147
G1 X114.516 Y124.887 E-.37047
M73 P77 R4
G1 X114.417 Y125.279 E-.36806
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I1.216 J.052 P1  F30000
G1 X114.514 Y123.009 Z6
G1 Z5.6
G1 E.8 F1800
G1 F4800
G2 X115.09 Y122.937 I.003 J-2.33 E.01786
G1 X115.09 Y121.395 E.0474
G2 X114.514 Y121.323 I-.572 J2.259 E.01786
G1 X115.262 Y121.469 F30000
G1 F4800
G3 X115.286 Y122.849 I-.372 J.696 E.05158
G1 X115.262 Y122.862 E.00083
; WIPE_START
G1 F24000
G1 X115.286 Y122.849 E-.01225
G1 X115.576 Y122.554 E-.18679
G1 X115.68 Y122.166 E-.18118
G1 X115.576 Y121.778 E-.18118
G1 X115.262 Y121.469 E-.1986
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I1.217 J0 P1  F30000
G1 X115.262 Y116.834 Z6
G1 Z5.6
G1 E.8 F1800
G1 F4800
G3 X115.286 Y118.213 I-.372 J.696 E.05158
G1 X115.262 Y118.226 E.00083
G1 X114.514 Y118.373 F30000
G1 F4800
G2 X115.09 Y118.301 I.003 J-2.33 E.01786
G1 X115.09 Y116.759 E.0474
G2 X114.514 Y116.687 I-.572 J2.259 E.01786
; WIPE_START
G1 F24000
G1 X115.09 Y116.759 E-.22034
G1 X115.09 Y118.179 E-.53966
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I.392 J-1.152 P1  F30000
G1 X109.3 Y116.209 Z6
G1 Z5.6
G1 E.8 F1800
G1 F4800
G2 X109.139 Y114.951 I-.584 J-.565 E.04475
G1 X108.648 Y114.756 F30000
G1 F4800
G2 X108.082 Y115.068 I.552 J1.673 E.01998
G1 X108.073 Y116.237 E.03591
G3 X107.946 Y115.225 I.527 J-.58 E.0341
G1 X107.95 Y115.22 E.00022
; WIPE_START
G1 F24000
G1 X107.946 Y115.225 E-.00275
G1 X107.821 Y115.758 E-.2077
G1 X108.073 Y116.237 E-.20573
G1 X108.08 Y115.332 E-.34382
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I-1.145 J.412 P1  F30000
G1 X114.101 Y132.08 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5813
G1 X114.259 Y132.454 E.01349
G2 X118.659 Y138.377 I15.925 J-7.237 E.24659
G1 X105.697 Y138.377 E.42997
G3 X104.235 Y135.145 I23.913 J-12.771 E.11775
G3 X106.545 Y132.08 I2.307 J-.665 E.14754
G1 X114.041 Y132.08 E.24865
G1 X114.362 Y131.691 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5813
G2 X119.765 Y138.769 I15.603 J-6.31 E.2769
G1 X105.469 Y138.769 E.43929
G1 X105.352 Y138.563 E.00726
G3 X103.859 Y135.257 I24.183 J-12.916 E.11156
G3 X106.54 Y131.688 I2.683 J-.776 E.15892
G1 X114.302 Y131.691 E.23851
M204 S10000
; WIPE_START
G1 F24000
G1 X114.617 Y132.294 E-.25828
G1 X114.821 Y132.722 E-.18046
G1 X115.213 Y133.471 E-.32126
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I-.26 J-1.189 P1  F30000
G1 X114.457 Y133.637 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5813
G2 X115.288 Y135.036 I15.846 J-8.46 E.054
G1 X112.814 Y137.51 E.11604
G1 X116.482 Y137.51 E.12166
G1 X111.4 Y132.428 E.23838
G1 X110.22 Y132.428 E.03916
G1 X105.483 Y137.165 E.2222
G1 X105.655 Y137.51 E.01278
G1 X108.806 Y137.51 E.10452
G1 X104.763 Y133.467 E.18967
G3 X106.017 Y132.502 I1.772 J1.007 E.05391
G1 X105.966 Y137.943 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F5813
G1 X117.507 Y137.943 E.43261
; WIPE_START
G1 F24000
G1 X115.507 Y137.943 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I1.197 J-.222 P1  F30000
G1 X109.102 Y103.376 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5813
G1 X109.102 Y103.08 E.00981
G1 X113.898 Y103.08 E.15909
G1 X113.898 Y103.376 E.00981
G1 X109.162 Y103.376 E.1571
G1 X108.71 Y103.768 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5813
G1 X108.71 Y102.688 E.03319
G1 X114.29 Y102.688 E.17146
G1 X114.29 Y103.768 E.03319
G1 X108.77 Y103.768 E.16961
M204 S10000
; WIPE_START
G1 F24000
G1 X108.71 Y102.688 E-.41103
G1 X109.628 Y102.688 E-.34897
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I-.022 J1.217 P1  F30000
G1 X148.5 Y103.376 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5813
G1 X146.102 Y103.376 E.07954
G1 X146.102 Y103.08 E.00981
G1 X150.898 Y103.08 E.15909
G1 X150.898 Y103.376 E.00981
G1 X148.56 Y103.376 E.07755
G1 X148.5 Y103.768 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5813
G1 X145.71 Y103.768 E.08573
G1 X145.71 Y102.688 E.03319
G1 X151.29 Y102.688 E.17146
G1 X151.29 Y103.768 E.03319
G1 X148.56 Y103.768 E.08389
M204 S10000
; WIPE_START
G1 F24000
G1 X146.56 Y103.768 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I-1.204 J.175 P1  F30000
G1 X150.667 Y132.081 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5813
G1 X153.505 Y132.081 E.09412
G3 X155.623 Y135.53 I-.05 J2.405 E.15952
G3 X154.302 Y138.377 I-26.39 J-10.511 E.10414
G1 X141.341 Y138.377 E.42996
G2 X145.899 Y132.08 I-11.5 J-13.124 E.26004
G1 X150.607 Y132.081 E.15618
G1 X150.668 Y131.689 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5813
G1 X153.51 Y131.689 E.08733
G3 X155.984 Y135.683 I-.055 J2.798 E.17134
G3 X154.531 Y138.769 I-25.121 J-9.945 E.10488
G1 X140.241 Y138.769 E.43907
G2 X145.639 Y131.688 I-10.223 J-13.39 E.27688
G1 X150.608 Y131.689 E.15266
M204 S10000
; WIPE_START
G1 F24000
G1 X152.608 Y131.689 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I-.622 J1.046 P1  F30000
G1 X153.98 Y132.505 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5813
G3 X155.237 Y133.467 I-.539 J2.006 E.05386
G1 X151.194 Y137.51 E.18965
G1 X154.345 Y137.51 E.10452
G1 X154.517 Y137.165 E.01278
G1 X149.781 Y132.429 E.22217
G1 X148.599 Y132.429 E.03919
G1 X143.518 Y137.51 E.23836
G1 X147.186 Y137.51 E.12166
G1 X144.712 Y135.036 E.11604
G2 X145.543 Y133.637 I-15.015 J-9.86 E.054
G1 X142.439 Y137.943 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502912
G1 F5813
G1 X153.974 Y137.943 E.43236
; CHANGE_LAYER
; Z_HEIGHT: 5.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X151.974 Y137.943 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 42/58
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
G3 Z6 I1.217 J.024 P1  F30000
G1 X152.116 Y130.89 Z6
G1 Z5.8
G1 E.8 F1800
; FEATURE: Support interface
; LINE_WIDTH: 0.42
G1 F4800
G1 X152.414 Y130.864 E.0092
G2 X152.092 Y130.354 I-.782 J.138 E.01898
G1 X151.352 Y130.1 F30000
G1 F4800
G3 X151.927 Y130.265 I-.796 J3.872 E.01841
G1 X151.927 Y130.89 E.01921
G1 X151.05 Y130.89 E.02695
G1 X151.05 Y104.566 E.80884
G1 X151.927 Y104.566 E.02695
G1 X151.927 Y105.054 E.01498
G1 X151.834 Y105.159 E.00432
G3 X151.352 Y106.387 I-.964 J.33 E.04409
G1 X150.748 Y106.373 F30000
G1 F4800
G3 X150.334 Y105.009 I.303 J-.837 E.05079
G3 X150.173 Y104.566 I.372 J-.386 E.01499
G1 X150.861 Y104.566 E.02116
; WIPE_START
G1 F24000
G1 X150.173 Y104.566 E-.26164
G1 X150.334 Y105.009 E-.17906
G1 X150.177 Y105.484 E-.18989
G1 X150.21 Y105.823 E-.1294
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I.686 J1.005 P1  F30000
G1 X152.089 Y104.539 Z6.2
G1 Z5.8
G1 E.8 F1800
G1 F4800
G1 X152.099 Y103.899 E.01967
G3 X152.052 Y104.912 I-.682 J.476 E.03352
; WIPE_START
G1 F24000
G1 X152.248 Y104.431 E-.23069
G1 X152.099 Y103.899 E-.24521
G1 X152.089 Y104.539 E-.2841
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I-.97 J-.735 P1  F30000
G1 X144.749 Y114.225 Z6.2
G1 Z5.8
G1 E.8 F1800
G1 F4800
G1 X144.732 Y114.238 E.00063
G2 X144.91 Y115.592 I.488 J.625 E.05058
G1 X144.913 Y114.128 E.045
G3 X145.486 Y114.008 I.616 J1.517 E.01807
; WIPE_START
G1 F24000
G1 X144.913 Y114.128 E-.2223
G1 X144.91 Y115.543 E-.5377
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I1.206 J.166 P1  F30000
G1 X145.599 Y110.557 Z6.2
G1 Z5.8
G1 E.8 F1800
G1 F4800
G3 X145.572 Y109.646 I.665 J-.475 E.02968
G1 X146.089 Y109.135 F30000
G1 F4800
G3 X146.665 Y109.255 I-.663 J4.624 E.01807
G1 X146.665 Y112.48 E.09908
G1 X146.089 Y111.918 E.0247
; WIPE_START
G1 F24000
G1 X146.665 Y112.48 E-.30544
G1 X146.665 Y111.283 E-.45456
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I-1.054 J.608 P1  F30000
G1 X147.542 Y112.805 Z6.2
G1 Z5.8
G1 E.8 F1800
G1 F4800
G1 X147.542 Y113.238 E.01332
G2 X148.419 Y113.479 I2.006 J-5.584 E.02798
G1 X148.419 Y113.113 E.01125
G2 X149.296 Y112.909 I.037 J-1.828 E.02796
G1 X149.296 Y113.312 E.01237
G2 X150.173 Y112.737 I-.983 J-2.457 E.03244
G1 X150.165 Y109.4 E.10252
G2 X149.689 Y109.797 I1.242 J1.977 E.01911
G1 X149.296 Y109.643 E.01297
G1 X149.296 Y110.047 E.01243
G2 X148.419 Y109.843 I-.798 J1.44 E.02803
G1 X148.419 Y109.48 E.01113
G2 X147.542 Y109.717 I.096 J2.097 E.02814
G1 X147.542 Y110.13 E.01267
; WIPE_START
G1 F24000
G1 X147.542 Y109.717 E-.15673
G1 X147.86 Y109.574 E-.13284
G1 X148.419 Y109.48 E-.21514
G1 X148.419 Y109.843 E-.13762
G1 X148.726 Y109.876 E-.11767
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I1.049 J-.618 P1  F30000
G1 X145.599 Y104.566 Z6.2
G1 Z5.8
G1 E.8 F1800
G1 F4800
G1 X144.911 Y104.566 E.02112
G1 X144.911 Y103.865 E.02155
G1 X144.91 Y104.857 E.03048
G2 X145.486 Y105.228 I.837 J-.666 E.02141
G1 X146.089 Y105.264 F30000
G1 F4800
G2 X146.665 Y104.919 I-.443 J-1.391 E.0208
G1 X146.665 Y104.566 E.01084
G1 X145.787 Y104.566 E.02695
G1 X145.787 Y130.889 E.80883
G1 X146.665 Y130.889 E.02695
G1 X146.648 Y130.276 E.01885
G2 X146.089 Y129.87 I-.99 J.777 E.02151
G1 X145.486 Y130.126 F30000
G1 F4800
G2 X144.91 Y130.612 I1.356 J2.19 E.02322
G1 X144.91 Y131.324 E.02188
G1 X145.158 Y130.889 E.01537
G1 X145.599 Y130.889 E.01354
; WIPE_START
G1 F24000
G1 X145.158 Y130.889 E-.16744
G1 X144.91 Y131.324 E-.19006
G1 X144.91 Y130.612 E-.27056
G1 X145.176 Y130.388 E-.13195
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I1.215 J.075 P1  F30000
G1 X145.543 Y124.404 Z6.2
G1 Z5.8
G1 E.8 F1800
G1 F4800
G2 X145.599 Y125.355 I.697 J.436 E.03123
G1 X146.089 Y125.766 F30000
G1 F4800
G2 X146.665 Y125.605 I-1.001 J-4.676 E.01838
G1 X146.665 Y122.336 E.10045
G1 X146.089 Y122.749 E.02178
; WIPE_START
G1 F24000
G1 X146.665 Y122.336 E-.2693
G1 X146.665 Y123.627 E-.4907
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I1.047 J.621 P1  F30000
G1 X147.542 Y122.149 Z6.2
G1 Z5.8
G1 E.8 F1800
G1 F4800
G1 X147.542 Y121.717 E.01325
G3 X148.419 Y121.48 I.973 J1.86 E.02814
G1 X148.419 Y121.843 E.01113
G3 X149.296 Y122.047 I.079 J1.644 E.02803
G1 X149.296 Y121.643 E.01243
G3 X150.173 Y122.179 I-.887 J2.438 E.03179
G1 X150.167 Y125.699 E.10816
G3 X149.58 Y125.183 I.833 J-1.539 E.0242
G1 X149.296 Y125.312 E.00959
G1 X149.296 Y124.909 E.01237
G3 X148.419 Y125.113 I-.84 J-1.624 E.02796
G1 X148.419 Y125.479 E.01125
G3 X147.542 Y125.249 I.165 J-2.412 E.02803
G1 X147.542 Y124.814 E.01336
; WIPE_START
G1 F24000
G1 X147.542 Y125.249 E-.16517
G1 X147.956 Y125.412 E-.16914
G1 X148.419 Y125.479 E-.17772
G1 X148.419 Y125.113 E-.13917
G1 X148.704 Y125.089 E-.1088
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I1.055 J.607 P1  F30000
G1 X151.352 Y120.492 Z6.2
G1 Z5.8
G1 E.8 F1800
G1 F4800
G3 X151.927 Y120.582 I-.458 J4.801 E.01791
G1 X151.927 Y122.156 E.04837
G3 X151.352 Y122.247 I-1.034 J-4.712 E.01791
G1 X152.104 Y122.094 F30000
G1 F4800
G2 X152.104 Y120.645 I-.326 J-.724 E.05604
; WIPE_START
G1 F24000
G1 X152.443 Y120.938 E-.18929
G1 X152.574 Y121.369 E-.19071
G1 X152.443 Y121.801 E-.19071
G1 X152.104 Y122.094 E-.18929
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I-.262 J-1.188 P1  F30000
G1 X113.22 Y130.683 Z6.2
G1 Z5.8
G1 E.8 F1800
G1 F4800
G2 X113.105 Y130.997 I.7 J.434 E.01036
G1 X113.335 Y131.03 E.00716
G3 X113.911 Y130.194 I.625 J-.186 E.03573
G1 X114.514 Y130.238 F30000
G1 F4800
G3 X115.09 Y130.613 I-.261 J1.029 E.02149
G1 X115.09 Y131.366 E.02315
G1 X114.913 Y131.061 E.01085
G1 X114.213 Y131.047 E.02153
G1 X114.213 Y104.566 E.81367
G1 X115.089 Y104.566 E.02692
G1 X115.089 Y103.877 E.02118
G1 X115.09 Y104.85 E.0299
G3 X114.514 Y105.34 I-1.591 J-1.288 E.02334
G1 X114.443 Y105.395 E.00278
G1 X114.71 Y105.93 E.01837
G3 X114.554 Y106.936 I-.679 J.41 E.03397
; WIPE_START
G1 F24000
G1 X114.818 Y106.444 E-.23945
G1 X114.71 Y105.93 E-.22534
G1 X114.443 Y105.395 E-.25644
G1 X114.514 Y105.34 E-.03877
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I-.535 J-1.093 P1  F30000
G1 X113.224 Y105.971 Z6.2
G1 Z5.8
G1 E.8 F1800
G1 F4800
G2 X113.336 Y106.901 I.68 J.39 E.03084
G1 X113.336 Y105.82 E.03323
G1 X113.742 Y105.378 E.01846
G1 X113.336 Y104.931 E.01855
G1 X113.336 Y104.566 E.0112
G2 X113.206 Y104.759 I-.081 J.086 E.01255
G1 X113.22 Y104.783 E.00084
; WIPE_START
G1 F24000
G1 X113.206 Y104.759 E-.01039
G1 X113.125 Y104.566 E-.0794
G1 X113.336 Y104.566 E-.07993
G1 X113.336 Y104.931 E-.13854
G1 X113.742 Y105.378 E-.22946
G1 X113.346 Y105.808 E-.22227
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I-1.185 J.278 P1  F30000
G1 X114.457 Y110.551 Z6.2
G1 Z5.8
G1 E.8 F1800
G1 F4800
G2 X114.401 Y109.6 I-.696 J-.436 E.03124
; WIPE_START
G1 F24000
G1 X114.581 Y110.065 E-.37889
G1 X114.457 Y110.551 E-.38111
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I.162 J-1.206 P1  F30000
G1 X110.704 Y110.046 Z6.2
G1 Z5.8
G1 E.8 F1800
G1 F4800
G1 X110.704 Y109.609 E.01343
G3 X111.581 Y109.476 I.767 J2.103 E.02744
G1 X111.581 Y109.843 E.01125
G3 X112.458 Y110.142 I-.161 J1.909 E.02876
M73 P78 R4
G1 X112.458 Y109.707 E.01336
G1 X112.668 Y109.789 E.00692
G3 X113.325 Y109.349 I2.169 J2.528 E.02436
G1 X113.336 Y112.62 E.10051
G3 X112.458 Y113.238 I-1.968 J-1.86 E.03319
G1 X112.458 Y112.807 E.01325
G3 X111.581 Y113.113 I-.967 J-1.361 E.02893
G1 X111.581 Y113.475 E.01113
G3 X110.704 Y113.313 I-.078 J-2.026 E.02763
G1 X110.704 Y112.908 E.01243
; WIPE_START
G1 F24000
G1 X110.704 Y113.313 E-.15367
G1 X110.956 Y113.412 E-.10273
G1 X111.581 Y113.475 E-.23889
G1 X111.581 Y113.113 E-.13762
G1 X111.91 Y113.052 E-.12709
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I.419 J-1.143 P1  F30000
G1 X109.252 Y112.077 Z6.2
G1 Z5.8
G1 E.8 F1800
G1 F4800
G1 X109.827 Y112.638 E.0247
G1 X109.827 Y109.262 E.10376
G3 X109.252 Y109.155 I.418 J-3.853 E.018
; WIPE_START
G1 F24000
G1 X109.827 Y109.262 E-.22239
G1 X109.827 Y110.676 E-.53761
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I1.162 J-.363 P1  F30000
G1 X107.911 Y104.539 Z6.2
G1 Z5.8
G1 E.8 F1800
G1 F4800
G1 X107.911 Y103.873 E.02046
G2 X108.053 Y104.999 I.661 J.488 E.03847
G1 X108.073 Y104.566 E.01331
G1 X108.762 Y104.566 E.02116
G1 X109.251 Y105.187 F30000
G1 F4800
G2 X109.827 Y104.566 I-.169 J-.735 E.02762
G1 X108.95 Y104.566 E.02695
G1 X108.95 Y130.943 E.81049
G1 X108.073 Y130.926 E.02696
G1 X108.073 Y130.264 E.02035
G2 X107.58 Y130.913 I.295 J.735 E.02632
G1 X107.885 Y130.922 E.00935
; WIPE_START
G1 F24000
G1 X107.58 Y130.913 E-.11565
G1 X107.725 Y130.535 E-.15383
G1 X108.073 Y130.264 E-.16773
G1 X108.073 Y130.926 E-.25167
G1 X108.26 Y130.93 E-.07112
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I1.103 J.515 P1  F30000
G1 X108.648 Y130.099 Z6.2
G1 Z5.8
G1 E.8 F1800
G1 F4800
G1 X108.689 Y127.529 E.07896
G3 X108.403 Y126.184 I.347 J-.777 E.04922
; WIPE_START
G1 F24000
G1 X108.22 Y126.485 E-.13401
G1 X108.198 Y126.886 E-.15233
G1 X108.348 Y127.213 E-.13692
G1 X108.689 Y127.529 E-.17654
G1 X108.682 Y127.951 E-.1602
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I.687 J1.005 P1  F30000
G1 X109.252 Y127.561 Z6.2
G1 Z5.8
G1 E.8 F1800
G1 F4800
G2 X109.698 Y127.271 I-.33 J-.994 E.01653
G2 X109.497 Y125.846 I-1.058 J-.578 E.04739
G1 X109.827 Y125.62 E.01229
G1 X109.827 Y122.219 E.10452
G1 X109.252 Y122.632 E.02178
; WIPE_START
G1 F24000
G1 X109.827 Y122.219 E-.26931
G1 X109.827 Y123.51 E-.4907
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I1.044 J.626 P1  F30000
G1 X110.704 Y122.046 Z6.2
G1 Z5.8
G1 E.8 F1800
G1 F4800
G1 X110.704 Y121.644 E.01237
G3 X111.581 Y121.476 I.82 J1.911 E.02765
G1 X111.581 Y121.843 E.01125
G3 X112.458 Y122.151 I-.084 J1.641 E.02896
G1 X112.458 Y121.717 E.01332
G3 X113.335 Y122.451 I-1.611 J2.817 E.03532
G1 X113.335 Y125.731 E.10078
G3 X112.597 Y125.176 I.323 J-1.199 E.0291
G1 X112.458 Y125.238 E.00466
G1 X112.458 Y124.826 E.01267
G3 X111.581 Y125.113 I-.995 J-1.555 E.02866
G1 X111.581 Y125.475 E.01113
G3 X110.704 Y125.313 I-.078 J-2.027 E.02763
G1 X110.704 Y124.908 E.01243
; WIPE_START
G1 F24000
G1 X110.704 Y125.313 E-.15367
G1 X110.956 Y125.412 E-.10273
G1 X111.581 Y125.475 E-.23889
G1 X111.581 Y125.113 E-.13762
G1 X111.91 Y125.052 E-.12709
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I-.117 J1.211 P1  F30000
G1 X114.433 Y125.295 Z6.2
G1 Z5.8
G1 E.8 F1800
G1 F4800
G2 X114.401 Y124.462 I-.72 J-.39 E.02689
; WIPE_START
G1 F24000
G1 X114.53 Y124.852 E-.36137
G1 X114.433 Y125.295 E-.39863
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I1.189 J.259 P1  F30000
G1 X115.251 Y121.531 Z6.2
G1 Z5.8
G1 E.8 F1800
G1 F4800
G3 X115.268 Y122.789 I-.464 J.635 E.0448
G1 X115.251 Y122.801 E.00063
G1 X114.514 Y123.019 F30000
G1 F4800
G2 X115.087 Y122.899 I-.043 J-1.637 E.01807
G1 X115.09 Y121.434 E.045
G2 X114.514 Y121.313 I-.628 J1.555 E.01816
; WIPE_START
G1 F24000
G1 X115.09 Y121.434 E-.22345
G1 X115.087 Y122.846 E-.53655
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I1.217 J.034 P1  F30000
G1 X115.251 Y116.895 Z6.2
G1 Z5.8
G1 E.8 F1800
G1 F4800
G3 X115.268 Y118.153 I-.464 J.635 E.0448
G1 X115.251 Y118.165 E.00064
G1 X114.514 Y118.383 F30000
G1 F4800
G2 X115.087 Y118.263 I-.043 J-1.637 E.01807
G1 X115.09 Y116.798 E.045
G2 X114.514 Y116.677 I-.628 J1.555 E.01816
; WIPE_START
G1 F24000
G1 X115.09 Y116.798 E-.22345
G1 X115.087 Y118.21 E-.53655
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I.387 J-1.154 P1  F30000
G1 X109.324 Y116.28 Z6.2
G1 Z5.8
G1 E.8 F1800
G1 F4800
G2 X109.139 Y114.896 I-.508 J-.636 E.05153
G1 X108.648 Y114.785 F30000
G1 F4800
G2 X108.083 Y115.183 I.451 J1.241 E.02149
G1 X108.073 Y116.116 E.02868
G2 X108.648 Y116.529 I1.016 J-.81 E.02203
; WIPE_START
G1 F24000
G1 X108.073 Y116.116 E-.26903
G1 X108.083 Y115.183 E-.35463
G1 X108.377 Y114.977 E-.13634
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I-1.154 J.386 P1  F30000
G1 X114.101 Y132.08 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6152
G1 X114.259 Y132.454 E.01347
G2 X118.439 Y138.177 I15.722 J-7.095 E.23677
G1 X105.597 Y138.177 E.42597
G3 X104.963 Y136.902 I29.361 J-15.399 E.04725
G1 X104.303 Y135.348 E.05599
G3 X106.545 Y132.08 I2.243 J-.864 E.15452
G1 X114.041 Y132.08 E.24865
G1 X114.361 Y131.688 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6152
G1 X114.376 Y131.724 E.00121
G2 X119.505 Y138.569 I15.756 J-6.462 E.26566
G1 X105.356 Y138.569 E.43477
G3 X103.874 Y135.308 I24.569 J-13.128 E.11013
G3 X106.54 Y131.688 I2.667 J-.828 E.16056
G1 X114.301 Y131.688 E.23846
M204 S10000
; WIPE_START
G1 F24000
G1 X114.376 Y131.724 E-.03177
G1 X114.616 Y132.293 E-.23452
G1 X114.963 Y133.015 E-.30427
G1 X115.199 Y133.453 E-.18944
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I-.292 J-1.181 P1  F30000
G1 X114.457 Y133.637 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6152
G2 X115.288 Y135.036 I15.814 J-8.442 E.054
G1 X113.014 Y137.31 E.10666
G1 X116.282 Y137.31 E.10839
G1 X111.4 Y132.428 E.229
G1 X110.22 Y132.428 E.03916
G1 X105.483 Y137.165 E.22221
G1 X105.555 Y137.31 E.00536
G1 X108.606 Y137.31 E.1012
G1 X104.761 Y133.465 E.18035
G3 X106.017 Y132.499 I1.778 J1.012 E.05397
G1 X105.866 Y137.743 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F6152
G1 X117.3 Y137.743 E.4286
; WIPE_START
G1 F24000
G1 X115.3 Y137.743 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I1.198 J-.216 P1  F30000
G1 X109.102 Y103.376 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6152
G1 X109.102 Y103.08 E.00981
G1 X113.898 Y103.08 E.15909
G1 X113.898 Y103.376 E.00981
G1 X109.162 Y103.376 E.1571
G1 X108.71 Y103.768 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6152
G1 X108.71 Y102.688 E.03319
G1 X114.29 Y102.688 E.17146
G1 X114.29 Y103.768 E.03319
G1 X108.77 Y103.768 E.16961
M204 S10000
; WIPE_START
G1 F24000
G1 X108.71 Y102.688 E-.41103
G1 X109.628 Y102.688 E-.34897
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I-.022 J1.217 P1  F30000
G1 X148.5 Y103.376 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6152
G1 X146.102 Y103.376 E.07954
G1 X146.102 Y103.08 E.00981
G1 X150.898 Y103.08 E.15909
G1 X150.898 Y103.376 E.00981
G1 X148.56 Y103.376 E.07755
G1 X148.5 Y103.768 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6152
G1 X145.71 Y103.768 E.08573
G1 X145.71 Y102.688 E.03319
G1 X151.29 Y102.688 E.17146
G1 X151.29 Y103.768 E.03319
G1 X148.56 Y103.768 E.08389
M204 S10000
; WIPE_START
G1 F24000
G1 X146.56 Y103.768 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I-1.204 J.177 P1  F30000
G1 X150.716 Y132.08 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6152
G1 X153.48 Y132.081 E.0917
G3 X155.602 Y135.58 I-.028 J2.41 E.16218
G3 X154.917 Y137.154 I-81.346 J-34.496 E.05694
G1 X154.403 Y138.177 E.03797
G1 X141.579 Y138.177 E.42537
G2 X145.899 Y132.08 I-11.883 J-12.998 E.24976
G1 X150.656 Y132.08 E.15778
G1 X150.716 Y131.688 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6152
G1 X153.485 Y131.688 E.08509
G3 X155.963 Y135.733 I-.033 J2.802 E.1738
G3 X154.644 Y138.569 I-26.452 J-10.581 E.09615
G1 X140.494 Y138.569 E.43478
G2 X145.639 Y131.688 I-10.478 J-13.198 E.26694
G1 X150.656 Y131.688 E.15414
M204 S10000
; WIPE_START
G1 F24000
G1 X152.656 Y131.688 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I-.634 J1.039 P1  F30000
G1 X153.983 Y132.499 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6152
G3 X155.236 Y133.468 I-.799 J2.328 E.0535
G1 X151.394 Y137.31 E.18023
G1 X154.445 Y137.31 E.1012
G1 X154.517 Y137.165 E.00536
G1 X149.78 Y132.429 E.2222
G1 X148.599 Y132.428 E.03918
G1 X143.718 Y137.31 E.22899
G1 X146.986 Y137.31 E.10839
G1 X144.712 Y135.036 E.10666
G2 X145.543 Y133.637 I-14.984 J-9.841 E.054
G1 X142.636 Y137.743 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502912
G1 F6152
G1 X154.074 Y137.743 E.42874
; CHANGE_LAYER
; Z_HEIGHT: 6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X152.074 Y137.743 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 43/58
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
G3 Z6.2 I.18 J-1.204 P1  F30000
G1 X114.101 Y132.08 Z6.2
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2314
G1 X114.258 Y132.453 E.01342
G2 X118.205 Y137.977 I16.016 J-7.272 E.22664
G1 X105.497 Y137.977 E.42155
G3 X104.968 Y136.912 I24.503 J-12.847 E.03943
G1 X104.301 Y135.343 E.05655
G3 X106.545 Y132.08 I2.242 J-.862 E.15443
G1 X114.041 Y132.08 E.24865
G1 X114.361 Y131.688 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2314
G1 X114.39 Y131.757 E.00231
G2 X119.26 Y138.369 I15.567 J-6.367 E.2549
G1 X105.255 Y138.369 E.43032
G3 X104.61 Y137.073 I29.822 J-15.657 E.04447
G1 X103.937 Y135.488 E.05294
G3 X106.54 Y131.688 I2.607 J-1.005 E.16635
G1 X114.301 Y131.688 E.23846
M204 S10000
; WIPE_START
G1 F24000
G1 X114.39 Y131.757 E-.04291
G1 X114.616 Y132.291 E-.22042
G1 X114.961 Y133.012 E-.30374
G1 X115.202 Y133.459 E-.19292
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I-.282 J-1.184 P1  F30000
G1 X114.457 Y133.637 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2314
G2 X115.288 Y135.036 I15.783 J-8.424 E.054
G1 X113.214 Y137.11 E.09728
G1 X116.082 Y137.11 E.09512
G1 X111.4 Y132.428 E.21962
G1 X110.22 Y132.428 E.03916
G1 X105.538 Y137.11 E.21962
G1 X108.406 Y137.11 E.09512
G1 X104.763 Y133.467 E.17089
G3 X106.018 Y132.498 I1.839 J1.084 E.05388
G1 X105.766 Y137.543 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F2314
G1 X117.109 Y137.543 E.42518
; WIPE_START
G1 F24000
G1 X115.109 Y137.543 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I1.199 J-.211 P1  F30000
G1 X109.102 Y103.376 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2314
G1 X109.102 Y103.08 E.00981
G1 X113.898 Y103.08 E.15909
G1 X113.898 Y103.376 E.00981
G1 X109.162 Y103.376 E.1571
G1 X108.71 Y103.768 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2314
G1 X108.71 Y102.688 E.03319
G1 X114.29 Y102.688 E.17146
G1 X114.29 Y103.768 E.03319
G1 X108.77 Y103.768 E.16961
M204 S10000
; WIPE_START
G1 F24000
G1 X108.71 Y102.688 E-.41103
G1 X109.628 Y102.688 E-.34897
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I-.022 J1.217 P1  F30000
G1 X148.5 Y103.376 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2314
G1 X146.102 Y103.376 E.07954
G1 X146.102 Y103.08 E.00981
M73 P79 R4
G1 X150.898 Y103.08 E.15909
G1 X150.898 Y103.376 E.00981
G1 X148.56 Y103.376 E.07755
G1 X148.5 Y103.768 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2314
G1 X145.71 Y103.768 E.08573
G1 X145.71 Y102.688 E.03319
G1 X151.29 Y102.688 E.17146
G1 X151.29 Y103.768 E.03319
G1 X148.56 Y103.768 E.08389
M204 S10000
; WIPE_START
G1 F24000
G1 X146.56 Y103.768 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I-1.204 J.179 P1  F30000
G1 X150.766 Y132.082 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2314
G1 X153.582 Y132.083 E.09341
G3 X155.582 Y135.63 I-.141 J2.417 E.16049
G3 X154.928 Y137.131 I-87.017 J-37.024 E.05429
G1 X154.503 Y137.977 E.03141
G1 X141.786 Y137.977 E.42185
G2 X145.899 Y132.08 I-11.957 J-12.724 E.24022
G1 X150.706 Y132.082 E.15945
G1 X150.766 Y131.69 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2314
G1 X153.601 Y131.691 E.08712
G3 X155.943 Y135.783 I-.148 J2.801 E.17203
G3 X155.28 Y137.303 I-83.734 J-35.604 E.05096
G1 X154.744 Y138.369 E.03665
G1 X140.744 Y138.369 E.43019
G2 X145.639 Y131.688 I-10.899 J-13.119 E.25707
G1 X150.706 Y131.69 E.15569
M204 S10000
; WIPE_START
G1 F24000
G1 X152.706 Y131.691 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I-.655 J1.025 P1  F30000
G1 X153.98 Y132.505 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2314
G3 X155.24 Y133.464 I-.764 J2.312 E.05351
G1 X151.594 Y137.11 E.17104
G1 X154.462 Y137.11 E.09512
G1 X149.782 Y132.43 E.21954
G1 X148.599 Y132.429 E.03925
G1 X143.918 Y137.11 E.21957
G1 X146.786 Y137.11 E.09512
G1 X144.712 Y135.036 E.09728
G2 X145.543 Y133.637 I-14.952 J-9.823 E.054
G1 X142.827 Y137.543 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F2314
G1 X154.174 Y137.543 E.42533
M106 S234.6
; CHANGE_LAYER
; Z_HEIGHT: 6.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X152.174 Y137.543 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 44/58
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
G3 Z6.4 I1.182 J-.29 P1  F30000
G1 X149.191 Y125.4 Z6.4
G1 Z6.2
G1 E.8 F1800
M204 S5000
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X148.956 Y125.477 E.0082
G3 X148.245 Y121.441 I-.456 J-2 E.22057
G1 X148.449 Y121.426 E.00679
G3 X149.343 Y125.347 I.051 J2.051 E.18666
G1 X149.248 Y125.38 E.00335
M106 S234.6
M204 S10000
G1 X149.028 Y125.05 F30000
M204 S5000
M106 S255
G1 F3000
G3 X148.294 Y121.83 I-.528 J-1.573 E.18388
G1 X148.459 Y121.818 E.00549
G3 X149.085 Y125.03 I.041 J1.659 E.15446
M106 S234.6
M204 S10000
; WIPE_START
G1 F24000
G1 X148.706 Y125.125 E-.14823
G1 X148.376 Y125.133 E-.12563
G1 X148.05 Y125.076 E-.12564
G1 X147.743 Y124.955 E-.12563
G1 X147.465 Y124.776 E-.12563
G1 X147.259 Y124.575 E-.10923
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I1.203 J.184 P1  F30000
G1 X148.956 Y113.477 Z6.6
G1 Z6.2
G1 E.8 F1800
M204 S5000
M106 S255
M73 P79 R3
G1 F3000
G3 X148.245 Y109.441 I-.456 J-2 E.22058
G1 X148.449 Y109.426 E.00679
G3 X149.014 Y113.463 I.051 J2.051 E.19824
M106 S234.6
M204 S10000
G1 X148.869 Y113.094 F30000
M204 S5000
M106 S255
G1 F3000
G3 X148.294 Y109.83 I-.369 J-1.618 E.1784
G1 X148.459 Y109.818 E.00549
G3 X148.927 Y113.08 I.041 J1.659 E.15995
M106 S234.6
M204 S10000
; WIPE_START
G1 F24000
G1 X148.541 Y113.138 E-.14821
G1 X148.376 Y113.133 E-.0629
G1 X148.05 Y113.076 E-.12564
G1 X147.743 Y112.955 E-.12563
G1 X147.465 Y112.776 E-.12563
G1 X147.228 Y112.545 E-.12564
G1 X147.159 Y112.444 E-.04636
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I-1.194 J.237 P1  F30000
G1 X150.898 Y131.278 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X150.898 Y131.66 E.01269
G1 X150.898 Y132.08 E.01392
G1 X153.455 Y132.08 E.08483
G3 X155.697 Y135.349 I.006 J2.399 E.15472
G3 X154.603 Y137.777 I-29.595 J-11.872 E.08836
G1 X141.992 Y137.777 E.41832
G2 X146.102 Y131.575 I-12.034 J-12.438 E.24873
G1 X146.102 Y131.278 E.00987
M204 S5000
; FEATURE: Overhang wall
M106 S255
G1 F3000
G1 X146.102 Y104.178 E.89896
M106 S234.6
M204 S10000
; FEATURE: Inner wall
G1 F15476.087
G1 X146.102 Y103.08 E.03642
G1 X150.898 Y103.08 E.15909
G1 X150.898 Y104.178 E.03642
M204 S5000
; FEATURE: Overhang wall
M106 S255
G1 F3000
G1 X150.898 Y131.218 E.89697
M106 S234.6
M204 S10000
G1 X151.29 Y131.647 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X151.29 Y131.688 E.00126
G1 X153.46 Y131.688 E.06668
G3 X156.063 Y135.489 I.001 J2.791 E.16651
G3 X154.845 Y138.169 I-30.246 J-12.134 E.09047
G1 X140.979 Y138.169 E.42605
G2 X145.71 Y131.52 I-11.127 J-12.925 E.25319
G1 X145.71 Y131.278 E.00745
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X145.71 Y104.178 E.89896
M106 S234.6
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X145.71 Y102.688 E.04578
G1 X151.29 Y102.688 E.17146
G1 X151.29 Y104.178 E.04578
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X151.29 Y131.278 E.89896
M106 S234.6
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X151.29 Y131.587 E.00949
M204 S10000
; WIPE_START
G1 F24000
G1 X151.29 Y131.688 E-.03838
G1 X153.189 Y131.688 E-.72162
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I-.306 J-1.178 P1  F30000
G1 X150.37 Y132.419 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.431171
M106 S255
G1 F3000
G1 X150.37 Y125.163 E.22955
G1 X150.262 Y125.072 E.00448
G3 X149.982 Y125.339 I-.799 J-.559 E.0123
G1 X149.982 Y132.249 E.21864
G1 X149.594 Y132.249 E.01228
G1 X149.594 Y125.591 E.21065
G1 X149.205 Y125.754 E.01332
G1 X149.205 Y132.249 E.2055
G1 X148.817 Y132.249 E.01228
G1 X148.817 Y125.842 E.2027
G1 X148.429 Y125.856 E.01229
G1 X148.429 Y132.249 E.20226
G1 X148.041 Y132.249 E.01228
G1 X148.041 Y125.809 E.20374
G3 X147.652 Y125.697 I.083 J-1.016 E.01287
G1 X147.652 Y132.249 E.20728
G1 X147.264 Y132.249 E.01228
G1 X147.264 Y125.508 E.21328
G3 X146.876 Y125.213 I.536 J-1.108 E.01554
G1 X146.876 Y132.249 E.22263
G1 X146.488 Y132.249 E.01228
G1 X146.488 Y124.901 E.23248
M106 S234.6
G1 X146.547 Y124.651 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973911
G1 F15000
G1 X146.487 Y124.572 E.00044
; LINE_WIDTH: 0.111403
G1 X146.429 Y124.486 E.00058
; LINE_WIDTH: 0.148182
G3 X146.365 Y124.375 I.121 J-.144 E.00113
; LINE_WIDTH: 0.16145
G1 X146.346 Y124.27 E.00103
; LINE_WIDTH: 0.129185
G1 X146.328 Y124.165 E.00075
; WIPE_START
G1 F24000
G1 X146.346 Y124.27 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I1.216 J.034 P1  F30000
G1 X146.399 Y122.378 Z6.6
G1 Z6.2
G1 E.8 F1800
; LINE_WIDTH: 0.119475
G1 F15000
G2 X146.329 Y122.793 I8.168 J1.606 E.00262
G1 X146.306 Y122.615 F30000
; LINE_WIDTH: 0.181622
G1 F15000
G1 X146.403 Y122.472 E.00195
; LINE_WIDTH: 0.147258
M73 P80 R3
G1 X146.476 Y122.375 E.00103
; LINE_WIDTH: 0.111403
G1 X146.544 Y122.285 E.00063
; LINE_WIDTH: 0.0973909
G1 X146.608 Y122.209 E.00044
; WIPE_START
G1 F24000
G1 X146.544 Y122.285 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I-.656 J1.025 P1  F30000
G1 X150.392 Y124.747 Z6.6
G1 Z6.2
G1 E.8 F1800
; LINE_WIDTH: 0.129166
G1 F15000
G1 X150.524 Y124.58 E.00149
; LINE_WIDTH: 0.179228
G1 X150.593 Y124.49 E.00126
; LINE_WIDTH: 0.195636
G1 X150.694 Y124.341 E.00224
G1 X150.671 Y124.163 F30000
; LINE_WIDTH: 0.119481
G1 F15000
G3 X150.601 Y124.577 I-8.318 J-1.204 E.00262
; WIPE_START
G1 F24000
G1 X150.671 Y124.163 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I1.216 J-.046 P1  F30000
G1 X150.605 Y122.404 Z6.6
G1 Z6.2
G1 E.8 F1800
; LINE_WIDTH: 0.113039
G1 F15000
G3 X150.671 Y122.793 I-7.745 J1.517 E.00226
G1 X150.694 Y122.632 F30000
; LINE_WIDTH: 0.186692
G1 F15000
G1 X150.586 Y122.47 E.00229
; LINE_WIDTH: 0.163334
G1 X150.518 Y122.379 E.00111
; LINE_WIDTH: 0.122624
G1 X150.421 Y122.251 E.00104
G1 X150.548 Y122.047 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.452593
M106 S255
G1 F3000
G1 X150.548 Y113.19 E.29568
G1 X150.49 Y113.264 E.00315
G1 X150.262 Y113.072 E.00994
G1 X150.139 Y113.205 E.00604
G1 X150.139 Y121.752 E.28532
G2 X149.729 Y121.443 I-1.067 J.99 E.01721
G1 X149.729 Y113.52 E.26449
G1 X149.319 Y113.715 E.01514
G1 X149.319 Y121.247 E.25145
G2 X148.91 Y121.138 I-.476 J.959 E.01425
G1 X148.91 Y113.821 E.24424
G3 X148.5 Y113.854 I-.287 J-.997 E.01381
G1 X148.5 Y121.101 E.24192
G2 X148.09 Y121.134 I-.123 J1.03 E.01381
G1 X148.09 Y113.818 E.24424
G3 X147.681 Y113.709 I.066 J-1.068 E.01425
G1 X147.681 Y121.241 E.25146
G1 X147.271 Y121.435 E.01514
G1 X147.271 Y113.512 E.26449
G3 X146.861 Y113.198 I.572 J-1.17 E.01735
G1 X146.861 Y121.751 E.28551
G1 X146.738 Y121.883 E.00603
G1 X146.529 Y121.708 E.0091
G1 X146.452 Y121.796 E.00393
G1 X146.452 Y112.877 E.29777
M106 S234.6
G1 X146.547 Y112.651 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973909
G1 F15000
G1 X146.487 Y112.572 E.00044
; LINE_WIDTH: 0.111403
G1 X146.429 Y112.486 E.00058
; LINE_WIDTH: 0.148182
G3 X146.365 Y112.375 I.121 J-.144 E.00113
; LINE_WIDTH: 0.161452
G1 X146.346 Y112.27 E.00103
; LINE_WIDTH: 0.129186
G1 X146.328 Y112.165 E.00075
; WIPE_START
G1 F24000
G1 X146.346 Y112.27 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I1.216 J.034 P1  F30000
G1 X146.399 Y110.378 Z6.6
G1 Z6.2
G1 E.8 F1800
; LINE_WIDTH: 0.119477
G1 F15000
G2 X146.329 Y110.793 I8.169 J1.606 E.00262
G1 X146.306 Y110.615 F30000
; LINE_WIDTH: 0.181648
G1 F15000
G1 X146.403 Y110.472 E.00195
; LINE_WIDTH: 0.147275
G1 X146.476 Y110.375 E.00103
; LINE_WIDTH: 0.111411
G1 X146.544 Y110.285 E.00063
; LINE_WIDTH: 0.0973914
G1 X146.608 Y110.209 E.00044
; WIPE_START
G1 F24000
G1 X146.544 Y110.285 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I-.656 J1.025 P1  F30000
G1 X150.392 Y112.747 Z6.6
G1 Z6.2
G1 E.8 F1800
; LINE_WIDTH: 0.129167
G1 F15000
G1 X150.524 Y112.58 E.00149
; LINE_WIDTH: 0.179231
G1 X150.593 Y112.49 E.00126
; LINE_WIDTH: 0.195635
G1 X150.694 Y112.341 E.00224
G1 X150.671 Y112.163 F30000
; LINE_WIDTH: 0.119472
G1 F15000
G3 X150.601 Y112.577 I-8.314 J-1.203 E.00262
; WIPE_START
G1 F24000
G1 X150.671 Y112.163 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I1.217 J.001 P1  F30000
G1 X150.672 Y110.791 Z6.6
G1 Z6.2
G1 E.8 F1800
; LINE_WIDTH: 0.0969205
G1 F15000
G1 X150.654 Y110.686 E.00047
; LINE_WIDTH: 0.136065
G1 X150.629 Y110.555 E.00101
; LINE_WIDTH: 0.173108
G1 X150.571 Y110.469 E.0011
; LINE_WIDTH: 0.12678
G1 X150.453 Y110.305 E.00138
G1 X150.548 Y110.049 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.452595
M106 S255
G1 F3000
G1 X150.548 Y103.413 E.22151
G1 X150.139 Y103.413 E.01368
G1 X150.139 Y109.757 E.21179
G2 X149.729 Y109.443 I-.982 J.856 E.01735
G1 X149.729 Y103.413 E.20131
G1 X149.319 Y103.413 E.01368
G1 X149.319 Y109.247 E.19476
G2 X148.91 Y109.138 I-.476 J.958 E.01425
G1 X148.91 Y103.413 E.1911
G1 X148.5 Y103.413 E.01368
G1 X148.5 Y109.101 E.18989
G2 X148.09 Y109.134 I-.123 J1.03 E.01381
G1 X148.09 Y103.413 E.19099
G1 X147.681 Y103.413 E.01368
G1 X147.681 Y109.241 E.19455
G1 X147.271 Y109.435 E.01514
G1 X147.271 Y103.413 E.20104
G1 X146.861 Y103.413 E.01368
G1 X146.861 Y109.751 E.21157
G1 X146.738 Y109.883 E.00604
G1 X146.53 Y109.708 E.0091
G1 X146.452 Y109.797 E.00393
G1 X146.452 Y103.243 E.21876
M106 S234.6
; WIPE_START
G1 F24000
G1 X146.452 Y105.243 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I-1.173 J.324 P1  F30000
G1 X153.983 Y132.498 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X155.235 Y133.469 I-.525 J1.969 E.05397
G1 X151.794 Y136.91 E.16141
G1 X154.262 Y136.91 E.08185
G1 X149.993 Y132.641 E.20024
G1 X148.387 Y132.641 E.0533
G1 X144.118 Y136.91 E.20024
G1 X146.586 Y136.91 E.08185
G1 X144.713 Y135.037 E.08784
G2 X145.543 Y133.637 I-15.748 J-10.274 E.05401
G1 X143.018 Y137.343 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.5029
G1 F13696.248
G1 X154.274 Y137.343 E.42191
; WIPE_START
G1 F24000
G1 X152.274 Y137.343 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I.337 J-1.17 P1  F30000
G1 X110.945 Y125.452 Z6.6
G1 Z6.2
G1 E.8 F1800
M204 S5000
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G3 X111.245 Y121.441 I.555 J-1.975 E.18666
G1 X111.449 Y121.426 E.00679
G3 X111.003 Y125.467 I.051 J2.051 E.23215
M106 S234.6
M204 S10000
G1 X111.051 Y125.074 F30000
M204 S5000
M106 S255
G1 F3000
G3 X111.294 Y121.83 I.449 J-1.597 E.15096
G1 X111.459 Y121.818 E.00549
G3 X111.109 Y125.089 I.041 J1.659 E.18738
M106 S234.6
M204 S10000
; WIPE_START
G1 F24000
G1 X110.743 Y124.955 E-.14821
G1 X110.465 Y124.776 E-.12563
G1 X110.228 Y124.545 E-.12564
G1 X110.042 Y124.272 E-.12563
G1 X109.913 Y123.967 E-.12564
G1 X109.856 Y123.685 E-.10925
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I1.204 J.177 P1  F30000
G1 X111.347 Y113.522 Z6.6
G1 Z6.2
G1 E.8 F1800
M204 S5000
M106 S255
G1 F3000
G3 X111.245 Y109.441 I.153 J-2.046 E.20023
G1 X111.449 Y109.426 E.00679
G3 X111.407 Y113.526 I.051 J2.051 E.21858
M106 S234.6
M204 S10000
G1 X111.376 Y113.131 F30000
M204 S5000
M106 S255
G1 F3000
G3 X111.294 Y109.83 I.124 J-1.655 E.16194
G1 X111.459 Y109.818 E.00549
G3 X111.436 Y113.135 I.041 J1.659 E.1764
M106 S234.6
M204 S10000
; WIPE_START
G1 F24000
G1 X111.05 Y113.076 E-.14825
G1 X110.743 Y112.955 E-.12563
G1 X110.465 Y112.776 E-.12563
G1 X110.228 Y112.545 E-.12564
G1 X110.042 Y112.272 E-.12564
G1 X109.93 Y112.007 E-.10922
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I-1.216 J-.05 P1  F30000
G1 X109.102 Y132.08 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X109.102 Y131.278 E.02661
M204 S5000
; FEATURE: Overhang wall
M106 S255
G1 F3000
G1 X109.102 Y104.178 E.89896
M106 S234.6
M204 S10000
; FEATURE: Inner wall
G1 F15476.087
G1 X109.102 Y103.08 E.03642
G1 X113.898 Y103.08 E.15909
G1 X113.898 Y104.178 E.03642
M204 S5000
; FEATURE: Overhang wall
M106 S255
G1 F3000
G1 X113.898 Y131.278 E.89896
M106 S234.6
M204 S10000
; FEATURE: Inner wall
G1 F15476.087
G1 X113.898 Y131.575 E.00987
G2 X113.923 Y131.66 I.113 J.012 E.00302
G2 X118.008 Y137.777 I16.102 J-6.331 E.24585
G1 X105.397 Y137.777 E.41832
G3 X104.973 Y136.923 I19.655 J-10.3 E.03162
G1 X104.303 Y135.348 E.05678
G3 X106.545 Y132.08 I2.236 J-.869 E.15469
G1 X109.042 Y132.08 E.08284
G1 X108.71 Y131.688 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X108.71 Y131.278 E.0126
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X108.71 Y104.178 E.89896
M106 S234.6
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X108.71 Y102.688 E.04578
G1 X114.29 Y102.688 E.17146
G1 X114.29 Y104.178 E.04578
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X114.29 Y131.278 E.89896
M106 S234.6
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X114.29 Y131.483 E.0063
G2 X114.343 Y131.647 I.356 J-.025 E.00535
G2 X119.021 Y138.169 I15.672 J-6.303 E.249
G1 X105.155 Y138.169 E.42607
G3 X104.615 Y137.084 I24.974 J-13.11 E.03723
G1 X103.937 Y135.489 E.05326
G3 X106.54 Y131.688 I2.602 J-1.01 E.1665
G1 X108.65 Y131.688 E.06484
M204 S10000
; WIPE_START
G1 F24000
G1 X108.71 Y131.278 E-.15746
G1 X108.71 Y129.692 E-.60254
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I-.878 J-.842 P1  F30000
G1 X106.017 Y132.499 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X104.766 Y133.47 I.557 J2.011 E.05388
G1 X108.206 Y136.91 E.16139
G1 X105.738 Y136.91 E.08185
G1 X110.007 Y132.641 E.20024
G1 X111.613 Y132.641 E.0533
G1 X115.882 Y136.91 E.20024
G1 X113.414 Y136.91 E.08185
G1 X115.287 Y135.037 E.08784
G3 X114.457 Y133.637 I15.748 J-10.274 E.05401
G1 X113.513 Y132.419 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.431171
M106 S255
G1 F3000
G1 X113.513 Y125.235 E.22729
G1 X113.49 Y125.264 E.00116
G1 X113.262 Y125.072 E.00942
G1 X113.124 Y125.22 E.00639
G1 X113.124 Y132.249 E.22238
G1 X112.736 Y132.249 E.01228
G1 X112.736 Y125.515 E.21305
G1 X112.348 Y125.702 E.01363
G1 X112.348 Y132.249 E.20715
G1 X111.96 Y132.249 E.01228
G1 X111.96 Y125.81 E.20373
G3 X111.571 Y125.853 I-.3 J-.939 E.01244
G1 X111.571 Y132.249 E.20237
G1 X111.183 Y132.249 E.01228
G1 X111.183 Y125.834 E.20295
G1 X110.795 Y125.753 E.01255
G1 X110.795 Y132.249 E.20552
G1 X110.407 Y132.249 E.01228
G1 X110.407 Y125.6 E.21037
G1 X110.018 Y125.349 E.01462
G1 X110.018 Y132.249 E.2183
G1 X109.63 Y132.249 E.01228
G1 X109.63 Y124.793 E.2359
M106 S234.6
M73 P81 R3
G1 X109.547 Y124.651 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973912
G1 F15000
G1 X109.487 Y124.572 E.00044
; LINE_WIDTH: 0.111405
G1 X109.429 Y124.486 E.00058
; LINE_WIDTH: 0.148185
G3 X109.365 Y124.375 I.121 J-.144 E.00113
; LINE_WIDTH: 0.161454
G1 X109.346 Y124.27 E.00103
; LINE_WIDTH: 0.129187
G1 X109.328 Y124.165 E.00075
; WIPE_START
G1 F24000
G1 X109.346 Y124.27 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I1.216 J.034 P1  F30000
G1 X109.399 Y122.379 Z6.6
G1 Z6.2
G1 E.8 F1800
; LINE_WIDTH: 0.119479
G1 F15000
G2 X109.329 Y122.793 I8.248 J1.618 E.00262
G1 X109.306 Y122.615 F30000
; LINE_WIDTH: 0.181624
G1 F15000
G1 X109.403 Y122.472 E.00195
; LINE_WIDTH: 0.147259
G1 X109.476 Y122.375 E.00103
; LINE_WIDTH: 0.111404
G1 X109.544 Y122.285 E.00063
; LINE_WIDTH: 0.097391
G1 X109.608 Y122.209 E.00044
; WIPE_START
G1 F24000
G1 X109.544 Y122.285 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I-.656 J1.025 P1  F30000
G1 X113.392 Y124.747 Z6.6
G1 Z6.2
G1 E.8 F1800
; LINE_WIDTH: 0.129164
G1 F15000
G1 X113.524 Y124.58 E.00149
; LINE_WIDTH: 0.179226
G1 X113.593 Y124.49 E.00126
; LINE_WIDTH: 0.195633
G1 X113.694 Y124.341 E.00224
G1 X113.671 Y124.163 F30000
; LINE_WIDTH: 0.119476
G1 F15000
G3 X113.601 Y124.577 I-8.324 J-1.204 E.00262
; WIPE_START
G1 F24000
G1 X113.671 Y124.163 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I1.216 J-.046 P1  F30000
G1 X113.605 Y122.404 Z6.6
G1 Z6.2
G1 E.8 F1800
; LINE_WIDTH: 0.113036
G1 F15000
G3 X113.671 Y122.793 I-7.768 J1.52 E.00226
G1 X113.694 Y122.632 F30000
; LINE_WIDTH: 0.186686
G1 F15000
G1 X113.586 Y122.47 E.00229
; LINE_WIDTH: 0.163332
G1 X113.518 Y122.379 E.00111
; LINE_WIDTH: 0.122624
G1 X113.421 Y122.251 E.00104
G1 X113.548 Y122.047 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.452593
M106 S255
G1 F3000
G1 X113.548 Y113.19 E.29568
G1 X113.49 Y113.264 E.00315
G1 X113.262 Y113.072 E.00994
G1 X113.139 Y113.205 E.00604
G1 X113.139 Y121.752 E.28532
G2 X112.729 Y121.443 I-1.067 J.99 E.01721
G1 X112.729 Y113.52 E.26449
G1 X112.319 Y113.715 E.01514
G1 X112.319 Y121.247 E.25145
G2 X111.91 Y121.138 I-.476 J.958 E.01425
G1 X111.91 Y113.821 E.24424
G3 X111.5 Y113.854 I-.287 J-.997 E.01381
G1 X111.5 Y121.101 E.24192
G2 X111.09 Y121.134 I-.123 J1.03 E.01381
G1 X111.09 Y113.818 E.24424
G3 X110.681 Y113.709 I.066 J-1.068 E.01425
G1 X110.681 Y121.241 E.25146
G1 X110.271 Y121.435 E.01514
G1 X110.271 Y113.512 E.26449
G3 X109.861 Y113.198 I.572 J-1.17 E.01735
G1 X109.861 Y121.751 E.28551
G1 X109.738 Y121.883 E.00603
G1 X109.529 Y121.708 E.0091
G1 X109.452 Y121.796 E.00393
G1 X109.452 Y112.877 E.29777
M106 S234.6
G1 X109.547 Y112.651 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973913
G1 F15000
G1 X109.487 Y112.572 E.00044
; LINE_WIDTH: 0.111408
G1 X109.429 Y112.486 E.00058
; LINE_WIDTH: 0.148187
G3 X109.365 Y112.375 I.121 J-.144 E.00113
; LINE_WIDTH: 0.161456
G1 X109.346 Y112.27 E.00103
; LINE_WIDTH: 0.129188
G1 X109.328 Y112.165 E.00075
; WIPE_START
G1 F24000
G1 X109.346 Y112.27 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I1.216 J.034 P1  F30000
G1 X109.399 Y110.379 Z6.6
G1 Z6.2
G1 E.8 F1800
; LINE_WIDTH: 0.119481
G1 F15000
G2 X109.329 Y110.793 I8.249 J1.618 E.00262
G1 X109.306 Y110.615 F30000
; LINE_WIDTH: 0.18165
G1 F15000
G1 X109.403 Y110.472 E.00195
; LINE_WIDTH: 0.147278
G1 X109.476 Y110.375 E.00103
; LINE_WIDTH: 0.111416
G1 X109.544 Y110.285 E.00063
; LINE_WIDTH: 0.0973919
G1 X109.608 Y110.209 E.00044
; WIPE_START
G1 F24000
G1 X109.544 Y110.285 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I-.656 J1.025 P1  F30000
G1 X113.392 Y112.747 Z6.6
G1 Z6.2
G1 E.8 F1800
; LINE_WIDTH: 0.129166
G1 F15000
G1 X113.524 Y112.58 E.00149
; LINE_WIDTH: 0.179229
G1 X113.593 Y112.49 E.00126
; LINE_WIDTH: 0.195631
G1 X113.694 Y112.341 E.00224
G1 X113.671 Y112.163 F30000
; LINE_WIDTH: 0.119468
G1 F15000
G3 X113.601 Y112.577 I-8.318 J-1.204 E.00262
; WIPE_START
G1 F24000
G1 X113.671 Y112.163 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I1.217 J.001 P1  F30000
G1 X113.672 Y110.791 Z6.6
G1 Z6.2
G1 E.8 F1800
; LINE_WIDTH: 0.0969205
G1 F15000
G1 X113.654 Y110.686 E.00047
; LINE_WIDTH: 0.136064
G1 X113.629 Y110.555 E.00101
; LINE_WIDTH: 0.173107
G1 X113.571 Y110.469 E.0011
; LINE_WIDTH: 0.12678
G1 X113.453 Y110.305 E.00138
G1 X113.548 Y110.049 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.452595
M106 S255
G1 F3000
G1 X113.548 Y103.413 E.22151
G1 X113.139 Y103.413 E.01368
G1 X113.139 Y109.757 E.21179
G2 X112.729 Y109.443 I-.982 J.856 E.01735
G1 X112.729 Y103.413 E.20131
G1 X112.319 Y103.413 E.01368
G1 X112.319 Y109.247 E.19476
G2 X111.91 Y109.138 I-.476 J.958 E.01425
G1 X111.91 Y103.413 E.1911
G1 X111.5 Y103.413 E.01368
G1 X111.5 Y109.101 E.18989
G2 X111.09 Y109.134 I-.123 J1.03 E.01381
G1 X111.09 Y103.413 E.19099
G1 X110.681 Y103.413 E.01368
G1 X110.681 Y109.241 E.19455
G1 X110.271 Y109.435 E.01514
G1 X110.271 Y103.413 E.20104
G1 X109.861 Y103.413 E.01368
G1 X109.861 Y109.751 E.21157
G1 X109.738 Y109.883 E.00604
G1 X109.53 Y109.708 E.0091
G1 X109.452 Y109.797 E.00393
G1 X109.452 Y103.243 E.21876
M106 S234.6
; WIPE_START
G1 F24000
G1 X109.452 Y105.243 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I-1.209 J-.143 P1  F30000
G1 X105.666 Y137.343 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502896
G1 F13696.366
G1 X116.925 Y137.343 E.42201
M106 S252.45
; CHANGE_LAYER
; Z_HEIGHT: 6.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X114.925 Y137.343 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 45/58
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
G3 Z6.6 I.4 J1.149 P1  F30000
G1 X149.185 Y125.41 Z6.6
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9528
G1 X149.153 Y125.421 E.00111
G3 X148.245 Y121.441 I-.653 J-1.945 E.22736
G1 X148.449 Y121.426 E.00679
G3 X149.525 Y125.254 I.051 J2.051 E.17988
G1 X149.239 Y125.385 E.01044
G1 X148.96 Y125.067 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9528
G1 X148.706 Y125.123 E.00799
G3 X148.294 Y121.83 I-.206 J-1.646 E.16017
G1 X148.459 Y121.818 E.00509
G3 X149.028 Y125.05 I.041 J1.659 E.14492
G1 X149.018 Y125.052 E.00031
M204 S10000
; WIPE_START
G1 F24000
G1 X148.706 Y125.123 E-.12165
G1 X148.376 Y125.133 E-.12556
G1 X148.05 Y125.076 E-.12564
G1 X147.743 Y124.955 E-.12563
G1 X147.465 Y124.776 E-.12563
G1 X147.228 Y124.545 E-.12563
G1 X147.213 Y124.523 E-.01025
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I1.196 J.225 P1  F30000
G1 X149.313 Y113.36 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9528
G1 X148.956 Y113.477 E.01244
G3 X148.245 Y109.441 I-.456 J-2 E.22058
G1 X148.449 Y109.426 E.00679
G3 X149.367 Y113.336 I.051 J2.051 E.18578
G1 X149.19 Y112.987 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9528
G1 X149.182 Y112.989 E.00026
G3 X148.294 Y109.83 I-.682 J-1.513 E.17541
G1 X148.459 Y109.818 E.00508
G3 X149.468 Y112.824 I.041 J1.659 E.12967
G1 X149.242 Y112.957 E.00805
M204 S10000
; WIPE_START
G1 F24000
G1 X149.182 Y112.989 E-.02593
G1 X148.869 Y113.096 E-.12556
G1 X148.541 Y113.138 E-.12563
G1 X148.376 Y113.133 E-.0629
G1 X148.05 Y113.076 E-.12564
G1 X147.743 Y112.955 E-.12563
G1 X147.465 Y112.776 E-.12563
G1 X147.384 Y112.697 E-.04309
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I-1.193 J.24 P1  F30000
G1 X151.29 Y132.08 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9528
G1 X153.455 Y132.08 E.07182
G3 X155.697 Y135.349 I.006 J2.399 E.15472
G3 X154.703 Y137.577 I-28.145 J-11.216 E.08094
G1 X142.201 Y137.577 E.41472
G2 X146.102 Y131.6 I-12.336 J-12.313 E.23845
G1 X146.102 Y103.08 E.94606
G1 X150.898 Y103.08 E.15909
G1 X150.898 Y132.08 E.96198
G1 X151.23 Y132.08 E.01102
G1 X151.29 Y131.688 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9528
G1 X153.46 Y131.688 E.06668
G3 X156.063 Y135.489 I.001 J2.791 E.16651
G3 X154.945 Y137.969 I-28.26 J-11.25 E.0836
G1 X141.209 Y137.969 E.42205
G2 X145.71 Y131.52 I-11.284 J-12.671 E.24385
G1 X145.71 Y102.688 E.88594
G1 X151.29 Y102.688 E.17146
G1 X151.29 Y131.628 E.88925
M204 S10000
; WIPE_START
G1 F24000
G1 X153.289 Y131.683 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I-.929 J.786 P1  F30000
G1 X153.982 Y132.502 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F9528
G3 X155.234 Y133.47 I-.547 J2 E.05386
G1 X151.994 Y136.71 E.15197
G1 X154.062 Y136.71 E.06858
G1 X150.508 Y133.156 E.16671
G1 X147.872 Y133.156 E.08745
G1 X144.318 Y136.71 E.16671
G1 X146.386 Y136.71 E.06858
G1 X144.712 Y135.036 E.07851
G2 X145.543 Y133.637 I-14.876 J-9.778 E.054
G1 X146.021 Y132.764 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.416443
G1 F9528
G1 X150.025 Y132.764 E.12188
G2 X151.239 Y132.785 I.941 J-19.091 E.03696
G1 X151.598 Y132.454 E.01485
G1 X150.694 Y132.451 E.02749
G1 X150.506 Y132.283 E.00767
G1 X150.506 Y125.221 E.21496
G1 X150.387 Y125.248 E.0037
G1 X150.267 Y125.153 E.00466
G1 X150.104 Y125.323 E.00717
G1 X149.706 Y125.605 E.01482
G1 X149.261 Y125.801 E.01482
G1 X148.785 Y125.906 E.01482
G1 X148.299 Y125.915 E.01482
G1 X147.82 Y125.826 E.01482
G1 X147.368 Y125.645 E.01482
G1 X146.954 Y125.371 E.0151
G1 X146.662 Y125.055 E.01309
G1 X146.566 Y125.127 E.00364
G1 X146.494 Y125.113 E.00223
G1 X146.494 Y131.641 E.1987
G1 X146.478 Y131.716 E.00235
G1 X146.045 Y132.709 E.03297
G1 X148.346 Y127.765 F30000
; LINE_WIDTH: 0.351907
G1 F9528
G1 X148.346 Y130.913 E.07924
G1 X148.654 Y130.913 E.00778
G1 X148.654 Y127.761 E.07935
G1 X148.406 Y127.765 E.00627
G1 X148.002 Y127.429 F30000
; LINE_WIDTH: 0.419999
G1 F9528
G1 X148.002 Y131.256 E.1176
G1 X148.998 Y131.256 E.03058
G1 X148.998 Y127.392 E.11872
G3 X148.062 Y127.428 I-.853 J-10.064 E.02876
G1 X147.625 Y126.941 F30000
G1 F9528
G1 X147.625 Y131.633 E.14417
G1 X149.375 Y131.633 E.05375
G1 X149.375 Y126.936 E.14432
G1 X148.814 Y127.037 E.01752
G1 X148.102 Y127.029 E.02186
G1 X147.684 Y126.952 E.01305
G1 X147.248 Y126.412 F30000
G1 F9528
G1 X147.248 Y131.641 E.16066
G1 X147.171 Y132.01 E.01158
G1 X149.752 Y132.01 E.07929
G1 X149.752 Y126.412 E.17202
G1 X149.429 Y126.537 E.01064
G1 X148.804 Y126.66 E.01956
G1 X148.168 Y126.657 E.01956
G1 X147.544 Y126.528 E.01956
G1 X147.304 Y126.434 E.00792
G1 X146.871 Y125.773 F30000
G1 F9528
G1 X146.871 Y131.641 E.1803
G1 X146.824 Y131.867 E.00711
G1 X146.597 Y132.387 E.01742
G1 X150.232 Y132.387 E.1117
G1 X150.129 Y132.283 E.0045
G1 X150.129 Y125.77 E.20014
G1 X149.861 Y125.948 E.00988
G1 X149.345 Y126.169 E.01726
G1 X148.795 Y126.283 E.01726
G1 X148.233 Y126.286 E.01726
G1 X147.682 Y126.177 E.01726
G1 X147.163 Y125.962 E.01726
G1 X146.922 Y125.806 E.00884
G1 X146.547 Y124.651 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973912
G1 F9528
G1 X146.487 Y124.572 E.00044
; LINE_WIDTH: 0.111402
G1 X146.429 Y124.486 E.00058
; LINE_WIDTH: 0.148183
G3 X146.365 Y124.375 I.121 J-.144 E.00113
; LINE_WIDTH: 0.161456
G1 X146.346 Y124.27 E.00103
; LINE_WIDTH: 0.129189
G1 X146.328 Y124.165 E.00075
G1 X146.329 Y122.793 F30000
; LINE_WIDTH: 0.11947
G1 F9528
G3 X146.399 Y122.379 I8.322 J1.204 E.00262
G1 X146.476 Y122.375 F30000
; LINE_WIDTH: 0.147268
G1 F9528
G1 X146.403 Y122.472 E.00103
; LINE_WIDTH: 0.181639
G1 X146.306 Y122.615 E.00195
G1 X146.476 Y122.375 F30000
; LINE_WIDTH: 0.111406
G1 F9528
G1 X146.544 Y122.285 E.00063
; LINE_WIDTH: 0.0973913
G1 X146.608 Y122.209 E.00044
G1 X148.346 Y119.194 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.351907
G1 F9528
G1 X148.654 Y119.19 E.00778
M73 P82 R3
G1 X148.654 Y115.761 E.08633
G1 X148.346 Y115.765 E.00778
G1 X148.346 Y119.134 E.08482
G1 X148.002 Y119.564 F30000
; LINE_WIDTH: 0.419999
G1 F9528
G3 X148.998 Y119.527 I.892 J10.722 E.03061
G1 X148.998 Y115.392 E.12705
G3 X148.002 Y115.429 I-.891 J-10.705 E.03061
G1 X148.002 Y119.504 E.12521
G1 X147.625 Y120.02 F30000
G1 F9528
G1 X148.186 Y119.919 E.01752
G1 X148.898 Y119.927 E.02186
G1 X149.375 Y120.015 E.01489
G1 X149.375 Y114.936 E.15606
G1 X148.814 Y115.037 E.01752
G1 X148.102 Y115.029 E.02186
G1 X147.625 Y114.941 E.01489
G1 X147.625 Y119.96 E.15421
G1 X147.248 Y120.544 F30000
G1 F9528
G1 X147.571 Y120.419 E.01064
G1 X148.196 Y120.296 E.01956
G1 X148.832 Y120.298 E.01956
G1 X149.456 Y120.427 E.01956
G1 X149.752 Y120.543 E.00977
G1 X149.752 Y114.412 E.18842
G1 X149.429 Y114.537 E.01064
G1 X148.804 Y114.66 E.01956
G1 X148.168 Y114.657 E.01956
G1 X147.544 Y114.528 E.01956
G1 X147.248 Y114.412 E.00977
G1 X147.248 Y120.484 E.18657
G1 X146.871 Y121.186 F30000
G1 F9528
G1 X147.139 Y121.007 E.00988
G1 X147.655 Y120.787 E.01726
G1 X148.205 Y120.673 E.01726
G1 X148.767 Y120.67 E.01726
G1 X149.318 Y120.778 E.01726
G1 X149.837 Y120.994 E.01726
G1 X150.129 Y121.183 E.01068
G1 X150.129 Y113.77 E.22777
G1 X149.861 Y113.948 E.00988
G1 X149.345 Y114.169 E.01726
G1 X148.795 Y114.283 E.01726
G1 X148.233 Y114.286 E.01726
G1 X147.682 Y114.177 E.01726
G1 X147.163 Y113.962 E.01726
G1 X146.871 Y113.773 E.01068
G1 X146.871 Y121.126 E.22593
G1 X146.494 Y121.737 F30000
G1 F9528
G1 X146.62 Y121.718 E.00392
G1 X146.733 Y121.802 E.00433
G1 X146.896 Y121.632 E.00724
G1 X147.294 Y121.351 E.01496
G1 X147.739 Y121.154 E.01496
G1 X148.215 Y121.049 E.01496
G1 X148.701 Y121.041 E.01496
G1 X149.18 Y121.129 E.01496
G1 X149.632 Y121.311 E.01496
G1 X150.046 Y121.585 E.01525
G1 X150.338 Y121.9 E.01321
G1 X150.441 Y121.823 E.00395
G1 X150.506 Y121.834 E.00203
G1 X150.506 Y113.221 E.26465
G1 X150.387 Y113.248 E.00373
G1 X150.267 Y113.153 E.0047
G1 X150.104 Y113.323 E.00724
G1 X149.706 Y113.605 E.01496
G1 X149.261 Y113.802 E.01496
G1 X148.785 Y113.906 E.01496
G1 X148.299 Y113.915 E.01496
G1 X147.82 Y113.826 E.01496
G1 X147.368 Y113.645 E.01496
G1 X146.954 Y113.371 E.01525
G1 X146.662 Y113.055 E.01321
G1 X146.566 Y113.127 E.00367
G1 X146.494 Y113.113 E.00225
G1 X146.494 Y121.677 E.26314
G1 X150.453 Y122.305 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.126785
G1 F9528
G1 X150.571 Y122.469 E.00138
; LINE_WIDTH: 0.173117
G1 X150.629 Y122.555 E.0011
; LINE_WIDTH: 0.13607
G1 X150.654 Y122.686 E.00101
; LINE_WIDTH: 0.0969206
G1 X150.672 Y122.791 E.00047
G1 X150.671 Y124.163 F30000
; LINE_WIDTH: 0.119479
G1 F9528
G3 X150.601 Y124.577 I-8.245 J-1.192 E.00262
G1 X150.524 Y124.58 F30000
; LINE_WIDTH: 0.179235
G1 F9528
G1 X150.593 Y124.49 E.00126
; LINE_WIDTH: 0.195641
G1 X150.694 Y124.341 E.00224
G1 X150.524 Y124.58 F30000
; LINE_WIDTH: 0.129169
G1 F9528
G1 X150.392 Y124.747 E.00149
G1 X150.392 Y112.747 F30000
; LINE_WIDTH: 0.129171
G1 F9528
G1 X150.524 Y112.58 E.00149
; LINE_WIDTH: 0.17924
G1 X150.593 Y112.49 E.00126
; LINE_WIDTH: 0.195637
G1 X150.694 Y112.341 E.00224
G1 X150.671 Y112.163 F30000
; LINE_WIDTH: 0.119474
G1 F9528
G3 X150.601 Y112.577 I-8.313 J-1.203 E.00262
G1 X150.672 Y110.791 F30000
; LINE_WIDTH: 0.0969203
G1 F9528
G1 X150.654 Y110.686 E.00047
; LINE_WIDTH: 0.136061
G1 X150.629 Y110.555 E.00101
; LINE_WIDTH: 0.173099
G1 X150.571 Y110.469 E.0011
; LINE_WIDTH: 0.126774
G1 X150.453 Y110.305 E.00138
G1 X148.346 Y107.194 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.351907
G1 F9528
G1 X148.654 Y107.19 E.00778
G1 X148.654 Y105.323 E.04701
G1 X148.346 Y105.323 E.00778
G1 X148.346 Y107.134 E.0456
G1 X148.002 Y107.564 F30000
; LINE_WIDTH: 0.419999
G1 F9528
G3 X148.998 Y107.527 I.891 J10.711 E.03061
G1 X148.998 Y104.98 E.07825
G1 X148.002 Y104.98 E.03058
G1 X148.002 Y107.504 E.07753
G1 X147.625 Y108.02 F30000
G1 F9528
G1 X148.186 Y107.919 E.01752
G1 X148.898 Y107.927 E.02186
G1 X149.375 Y108.015 E.01489
G1 X149.375 Y104.603 E.10482
G1 X147.625 Y104.603 E.05375
G1 X147.625 Y107.96 E.10314
G1 X147.248 Y108.544 F30000
G1 F9528
G1 X147.571 Y108.419 E.01064
G1 X148.196 Y108.296 E.01956
G1 X148.832 Y108.298 E.01956
G1 X149.456 Y108.427 E.01956
G1 X149.752 Y108.543 E.00977
G1 X149.752 Y104.226 E.13266
G1 X147.248 Y104.226 E.07692
G1 X147.248 Y108.484 E.13084
G1 X146.871 Y109.186 F30000
G1 F9528
G1 X147.139 Y109.007 E.00988
G1 X147.655 Y108.787 E.01726
G1 X148.205 Y108.673 E.01726
G1 X148.767 Y108.67 E.01726
G1 X149.318 Y108.778 E.01726
G1 X149.837 Y108.994 E.01726
G1 X150.129 Y109.183 E.01068
G1 X150.129 Y103.849 E.16388
G1 X146.871 Y103.849 E.10009
G1 X146.871 Y109.126 E.16214
G1 X146.494 Y109.737 F30000
G1 F9528
G1 X146.621 Y109.718 E.00392
G1 X146.733 Y109.802 E.00433
G1 X146.896 Y109.632 E.00724
G1 X147.294 Y109.351 E.01496
G1 X147.739 Y109.154 E.01496
G1 X148.215 Y109.049 E.01496
G1 X148.701 Y109.041 E.01496
G1 X149.18 Y109.129 E.01496
G1 X149.632 Y109.311 E.01496
G1 X150.046 Y109.585 E.01525
G1 X150.338 Y109.9 E.01321
G1 X150.441 Y109.823 E.00395
G1 X150.506 Y109.834 E.00203
G1 X150.506 Y103.472 E.19549
G1 X146.494 Y103.472 E.12327
G1 X146.494 Y109.677 E.19065
G1 X146.608 Y110.209 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973918
G1 F9528
G1 X146.544 Y110.285 E.00044
; LINE_WIDTH: 0.111416
G1 X146.476 Y110.375 E.00063
; LINE_WIDTH: 0.147281
G1 X146.403 Y110.472 E.00103
; LINE_WIDTH: 0.181655
G1 X146.306 Y110.615 E.00195
G1 X146.329 Y110.793 F30000
; LINE_WIDTH: 0.119476
G1 F9528
G3 X146.399 Y110.379 I8.322 J1.204 E.00262
G1 X146.328 Y112.165 F30000
; LINE_WIDTH: 0.129184
G1 F9528
G1 X146.346 Y112.27 E.00075
; LINE_WIDTH: 0.161448
G1 X146.365 Y112.375 E.00103
; LINE_WIDTH: 0.148174
G2 X146.429 Y112.486 I.185 J-.032 E.00113
; LINE_WIDTH: 0.111395
G1 X146.487 Y112.572 E.00058
; LINE_WIDTH: 0.0973905
G1 X146.547 Y112.651 E.00044
; WIPE_START
G1 F24000
G1 X146.487 Y112.572 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I-1.206 J-.161 P1  F30000
G1 X143.201 Y137.143 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50291
G1 F9528
G1 X154.374 Y137.143 E.41883
; WIPE_START
G1 F24000
G1 X152.374 Y137.143 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I.341 J-1.168 P1  F30000
G1 X112.185 Y125.41 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9528
G1 X112.153 Y125.421 E.00111
G3 X111.245 Y121.441 I-.653 J-1.945 E.22736
G1 X111.449 Y121.426 E.00679
G3 X112.525 Y125.254 I.051 J2.051 E.17988
G1 X112.239 Y125.385 E.01044
G1 X111.96 Y125.067 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9528
G1 X111.706 Y125.123 E.00799
G3 X111.294 Y121.83 I-.206 J-1.646 E.16017
G1 X111.459 Y121.818 E.00509
G3 X112.028 Y125.05 I.041 J1.659 E.14492
G1 X112.018 Y125.052 E.00031
M204 S10000
; WIPE_START
G1 F24000
G1 X111.706 Y125.123 E-.12165
G1 X111.376 Y125.133 E-.12556
G1 X111.05 Y125.076 E-.12564
G1 X110.743 Y124.955 E-.12563
G1 X110.465 Y124.776 E-.12563
G1 X110.228 Y124.545 E-.12563
G1 X110.213 Y124.523 E-.01025
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I1.206 J.162 P1  F30000
G1 X112.218 Y109.558 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9528
G1 X112.25 Y109.567 E.00111
G3 X111.245 Y109.441 I-.75 J1.91 E.39364
G1 X111.449 Y109.426 E.00679
G3 X111.856 Y109.456 I.051 J2.051 E.01358
G1 X112.16 Y109.542 E.01046
G1 X112.107 Y109.932 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9528
G3 X111.294 Y109.83 I-.607 J1.544 E.2949
G1 X111.459 Y109.818 E.00508
G3 X112.05 Y109.912 I.041 J1.659 E.01851
M204 S10000
; WIPE_START
G1 F24000
G1 X112.401 Y110.083 E-.14825
G1 X112.659 Y110.289 E-.12563
G1 X112.872 Y110.543 E-.12563
G1 X113.03 Y110.833 E-.12563
G1 X113.127 Y111.149 E-.12564
G1 X113.158 Y111.408 E-.0991
G1 X113.157 Y111.434 E-.0101
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I-1.194 J-.235 P1  F30000
G1 X109.102 Y132.08 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9528
G1 X109.102 Y103.08 E.96198
G1 X113.898 Y103.08 E.15909
G1 X113.898 Y131.6 E.94606
G2 X117.807 Y137.577 I16.279 J-6.381 E.23859
G1 X105.297 Y137.577 E.41499
G3 X104.978 Y136.934 I14.795 J-7.747 E.0238
G1 X104.301 Y135.343 E.05735
G3 X106.545 Y132.08 I2.242 J-.861 E.15442
G1 X109.042 Y132.08 E.08284
G1 X108.71 Y131.688 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9528
G1 X108.71 Y102.688 E.89109
G1 X114.29 Y102.688 E.17146
G1 X114.29 Y131.52 E.88594
G2 X118.791 Y137.969 I15.781 J-6.22 E.24386
G1 X105.055 Y137.969 E.42206
G3 X104.62 Y137.095 I20.112 J-10.556 E.02999
G1 X103.937 Y135.487 E.05368
G3 X106.54 Y131.688 I2.608 J-1.005 E.16635
G1 X108.65 Y131.688 E.06484
M204 S10000
; WIPE_START
G1 F24000
G1 X108.654 Y129.688 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I-.888 J-.833 P1  F30000
G1 X106.017 Y132.499 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F9528
G2 X104.766 Y133.469 I.558 J2.012 E.05388
G1 X108.006 Y136.71 E.15201
G1 X105.938 Y136.71 E.06858
G1 X109.492 Y133.156 E.16671
G1 X112.128 Y133.156 E.08745
G1 X115.682 Y136.71 E.16671
G1 X113.614 Y136.71 E.06858
G1 X115.288 Y135.036 E.07851
G3 X114.457 Y133.637 I14.875 J-9.777 E.054
G1 X113.973 Y132.764 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.415764
G1 F9528
G1 X113.521 Y131.714 E.03472
G1 X113.506 Y130.758 E.02905
G1 X113.506 Y125.221 E.16823
G1 X113.387 Y125.248 E.00369
G1 X113.267 Y125.153 E.00465
G1 X113.104 Y125.323 E.00716
G1 X112.706 Y125.605 E.01479
G1 X112.261 Y125.801 E.01479
G1 X111.785 Y125.906 E.01479
G1 X111.299 Y125.915 E.01479
G1 X110.82 Y125.826 E.01479
G1 X110.368 Y125.645 E.01479
G1 X109.954 Y125.371 E.01508
G1 X109.662 Y125.056 E.01306
G1 X109.566 Y125.127 E.00363
G1 X109.494 Y125.113 E.00223
G1 X109.494 Y132.283 E.21785
G1 X109.306 Y132.451 E.00766
G1 X108.404 Y132.451 E.0274
G1 X108.733 Y132.774 E.01402
G2 X113.913 Y132.764 I1.099 J-781.154 E.15736
G1 X111.654 Y127.761 F30000
; LINE_WIDTH: 0.351907
G1 F9528
G1 X111.346 Y127.765 E.00778
G1 X111.346 Y130.913 E.07924
G1 X111.654 Y130.913 E.00778
G1 X111.654 Y127.821 E.07783
G1 X111.998 Y127.392 F30000
; LINE_WIDTH: 0.419999
G1 F9528
G3 X111.002 Y127.429 I-.891 J-10.712 E.03061
G1 X111.002 Y131.256 E.11759
G1 X111.998 Y131.256 E.03058
G1 X111.998 Y127.452 E.11687
G1 X112.375 Y126.936 F30000
G1 F9528
G1 X111.814 Y127.037 E.01752
G1 X111.102 Y127.029 E.02186
G1 X110.625 Y126.941 E.01489
G1 X110.625 Y131.633 E.14417
G1 X112.375 Y131.633 E.05375
G1 X112.375 Y126.996 E.14248
G1 X112.752 Y126.412 F30000
G1 F9528
G1 X112.429 Y126.537 E.01064
G1 X111.804 Y126.66 E.01956
G1 X111.168 Y126.657 E.01956
G1 X110.544 Y126.528 E.01956
G1 X110.248 Y126.412 E.00977
G1 X110.248 Y132.01 E.172
G2 X112.825 Y132.008 I1.067 J-389.817 E.07916
G1 X112.752 Y131.641 E.01151
G1 X112.752 Y126.472 E.15884
G1 X113.129 Y125.77 F30000
G1 F9528
G1 X112.861 Y125.948 E.00988
G1 X112.345 Y126.169 E.01726
G1 X111.795 Y126.283 E.01726
G1 X111.233 Y126.286 E.01726
G1 X110.682 Y126.177 E.01726
G1 X110.163 Y125.962 E.01726
G1 X109.871 Y125.773 E.01068
G1 X109.871 Y132.283 E.20004
G1 X109.784 Y132.387 E.00415
G1 X113.395 Y132.387 E.11096
G1 X113.173 Y131.861 E.01754
G1 X113.129 Y131.641 E.0069
G1 X113.129 Y125.83 E.17856
G1 X113.392 Y124.747 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.129167
G1 F9528
G1 X113.524 Y124.58 E.00149
; LINE_WIDTH: 0.179233
G1 X113.593 Y124.49 E.00126
; LINE_WIDTH: 0.195637
G1 X113.694 Y124.341 E.00224
G1 X113.671 Y124.163 F30000
; LINE_WIDTH: 0.119475
G1 F9528
G3 X113.601 Y124.577 I-8.254 J-1.194 E.00262
G1 X113.672 Y122.791 F30000
; LINE_WIDTH: 0.0969206
G1 F9528
G1 X113.654 Y122.686 E.00047
; LINE_WIDTH: 0.136068
G1 X113.629 Y122.555 E.00101
; LINE_WIDTH: 0.173114
G1 X113.571 Y122.469 E.0011
; LINE_WIDTH: 0.126784
G1 X113.453 Y122.305 E.00138
G1 X113.506 Y121.834 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F9528
G1 X113.506 Y113.221 E.26466
G1 X113.387 Y113.248 E.00373
G1 X113.267 Y113.153 E.0047
G1 X113.104 Y113.323 E.00724
G1 X112.706 Y113.605 E.01496
G1 X112.261 Y113.802 E.01496
G1 X111.785 Y113.906 E.01496
G1 X111.299 Y113.915 E.01496
G1 X110.82 Y113.826 E.01496
G1 X110.368 Y113.645 E.01496
G1 X109.954 Y113.371 E.01525
G1 X109.662 Y113.055 E.01321
G1 X109.566 Y113.127 E.00367
G1 X109.494 Y113.113 E.00225
G1 X109.494 Y121.737 E.26498
G1 X109.62 Y121.718 E.00392
G1 X109.733 Y121.802 E.00433
G1 X109.896 Y121.632 E.00724
G1 X110.294 Y121.351 E.01496
G1 X110.739 Y121.154 E.01496
G1 X111.215 Y121.049 E.01496
G1 X111.701 Y121.041 E.01496
G1 X112.18 Y121.129 E.01496
G1 X112.632 Y121.311 E.01496
G1 X113.046 Y121.585 E.01525
G1 X113.338 Y121.9 E.01321
G1 X113.447 Y121.824 E.00409
G1 X113.129 Y121.183 F30000
G1 F9528
G1 X113.129 Y113.77 E.22777
G1 X112.861 Y113.948 E.00988
G1 X112.345 Y114.169 E.01726
G1 X111.795 Y114.283 E.01726
G1 X111.233 Y114.286 E.01726
G1 X110.682 Y114.177 E.01726
G1 X110.163 Y113.962 E.01726
G1 X109.871 Y113.773 E.01068
G1 X109.871 Y121.186 E.22777
G1 X110.139 Y121.007 E.00988
G1 X110.655 Y120.787 E.01726
G1 X111.205 Y120.673 E.01726
G1 X111.767 Y120.67 E.01726
G1 X112.318 Y120.778 E.01726
G1 X112.837 Y120.994 E.01726
G1 X113.078 Y121.15 E.00884
G1 X112.752 Y120.543 F30000
G1 F9528
G1 X112.752 Y114.412 E.18842
G1 X112.429 Y114.537 E.01064
G1 X111.804 Y114.66 E.01956
G1 X111.168 Y114.657 E.01956
G1 X110.544 Y114.528 E.01956
G1 X110.248 Y114.412 E.00977
G1 X110.248 Y120.544 E.18842
G1 X110.571 Y120.419 E.01064
G1 X111.196 Y120.296 E.01956
G1 X111.832 Y120.298 E.01956
G1 X112.456 Y120.427 E.01956
G1 X112.696 Y120.522 E.00792
G1 X112.375 Y120.015 F30000
G1 F9528
G1 X112.375 Y114.936 E.15606
G1 X111.814 Y115.037 E.01752
G1 X111.102 Y115.029 E.02186
G1 X110.625 Y114.941 E.01489
G1 X110.625 Y120.02 E.15606
G1 X111.186 Y119.919 E.01752
G1 X111.898 Y119.927 E.02186
G1 X112.316 Y120.004 E.01305
G1 X111.998 Y119.527 F30000
G1 F9528
G1 X111.998 Y115.392 E.12705
G3 X111.002 Y115.429 I-.891 J-10.706 E.03061
G1 X111.002 Y119.564 E.12705
G3 X111.938 Y119.528 I.853 J10.074 E.02876
G1 X111.654 Y119.19 F30000
; LINE_WIDTH: 0.351907
G1 F9528
G1 X111.654 Y115.761 E.08633
G1 X111.346 Y115.765 E.00778
G1 X111.346 Y119.194 E.08633
G1 X111.594 Y119.191 E.00627
G1 X109.608 Y122.209 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973913
G1 F9528
G1 X109.544 Y122.285 E.00044
; LINE_WIDTH: 0.111406
G1 X109.476 Y122.375 E.00063
; LINE_WIDTH: 0.147269
G1 X109.403 Y122.472 E.00103
; LINE_WIDTH: 0.181641
G1 X109.306 Y122.615 E.00195
G1 X109.329 Y122.793 F30000
; LINE_WIDTH: 0.119475
G1 F9528
G3 X109.399 Y122.379 I8.317 J1.203 E.00262
G1 X109.328 Y124.165 F30000
; LINE_WIDTH: 0.129191
G1 F9528
G1 X109.346 Y124.27 E.00075
; LINE_WIDTH: 0.16146
G1 X109.365 Y124.375 E.00103
; LINE_WIDTH: 0.148186
G2 X109.429 Y124.486 I.185 J-.032 E.00113
; LINE_WIDTH: 0.111406
G1 X109.487 Y124.572 E.00058
; LINE_WIDTH: 0.0973916
G1 X109.547 Y124.651 E.00044
G1 X109.547 Y112.651 F30000
; LINE_WIDTH: 0.0973906
G1 F9528
G1 X109.487 Y112.572 E.00044
; LINE_WIDTH: 0.111396
G1 X109.429 Y112.486 E.00058
; LINE_WIDTH: 0.148178
G3 X109.365 Y112.375 I.121 J-.144 E.00113
; LINE_WIDTH: 0.161452
G1 X109.346 Y112.27 E.00103
; LINE_WIDTH: 0.129186
G1 X109.328 Y112.165 E.00075
G1 X109.329 Y110.793 F30000
; LINE_WIDTH: 0.119481
G1 F9528
G3 X109.399 Y110.379 I8.317 J1.203 E.00262
G1 X109.476 Y110.375 F30000
; LINE_WIDTH: 0.147282
G1 F9528
G1 X109.403 Y110.472 E.00103
; LINE_WIDTH: 0.181656
G1 X109.306 Y110.615 E.00195
G1 X109.476 Y110.375 F30000
; LINE_WIDTH: 0.111417
G1 F9528
G1 X109.544 Y110.285 E.00063
; LINE_WIDTH: 0.097392
G1 X109.608 Y110.209 E.00044
; WIPE_START
G1 F24000
G1 X109.544 Y110.285 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I-.006 J1.217 P1  F30000
G1 X113.453 Y110.305 Z6.8
G1 Z6.4
G1 E.8 F1800
; LINE_WIDTH: 0.126775
G1 F9528
G1 X113.571 Y110.469 E.00138
; LINE_WIDTH: 0.173099
G1 X113.629 Y110.555 E.0011
; LINE_WIDTH: 0.136061
G1 X113.654 Y110.686 E.00101
; LINE_WIDTH: 0.0969203
G1 X113.672 Y110.791 E.00047
G1 X113.506 Y109.834 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F9528
G1 X113.506 Y103.472 E.19549
G1 X109.494 Y103.472 E.12327
G1 X109.494 Y109.737 E.19249
G1 X109.621 Y109.718 E.00393
G1 X109.733 Y109.802 E.00433
G1 X109.896 Y109.632 E.00724
G1 X110.294 Y109.351 E.01496
G1 X110.739 Y109.154 E.01496
G1 X111.215 Y109.049 E.01496
G1 X111.701 Y109.041 E.01496
G1 X112.18 Y109.129 E.01496
G1 X112.632 Y109.311 E.01496
G1 X113.046 Y109.585 E.01525
G1 X113.338 Y109.9 E.01321
G1 X113.447 Y109.824 E.00408
G1 X113.129 Y109.183 F30000
G1 F9528
G1 X113.129 Y103.849 E.16388
G1 X109.871 Y103.849 E.10009
G1 X109.871 Y109.186 E.16398
G1 X110.139 Y109.007 E.00988
G1 X110.655 Y108.787 E.01726
G1 X111.205 Y108.673 E.01726
G1 X111.767 Y108.67 E.01726
G1 X112.318 Y108.778 E.01726
G1 X112.837 Y108.994 E.01726
G1 X113.078 Y109.15 E.00884
G1 X112.752 Y108.543 F30000
G1 F9528
G1 X112.752 Y104.226 E.13266
G1 X110.248 Y104.226 E.07692
G1 X110.248 Y108.544 E.13268
G1 X110.571 Y108.419 E.01064
G1 X111.196 Y108.296 E.01956
G1 X111.832 Y108.298 E.01956
G1 X112.456 Y108.427 E.01956
G1 X112.696 Y108.522 E.00792
G1 X112.375 Y108.015 F30000
G1 F9528
G1 X112.375 Y104.603 E.10482
G1 X110.625 Y104.603 E.05375
G1 X110.625 Y108.02 E.10498
G1 X111.186 Y107.919 E.01752
G1 X111.898 Y107.927 E.02186
G1 X112.316 Y108.004 E.01305
G1 X111.998 Y107.527 F30000
G1 F9528
G1 X111.998 Y104.98 E.07825
G1 X111.002 Y104.98 E.03058
G1 X111.002 Y107.564 E.07937
G3 X111.938 Y107.528 I.853 J10.062 E.02876
G1 X111.654 Y107.19 F30000
; LINE_WIDTH: 0.351907
G1 F9528
G1 X111.654 Y105.323 E.04701
G1 X111.346 Y105.323 E.00778
G1 X111.346 Y107.194 E.04711
G1 X111.594 Y107.191 E.00627
G1 X113.671 Y112.163 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.119469
G1 F9528
G3 X113.601 Y112.577 I-8.317 J-1.203 E.00262
G1 X113.524 Y112.58 F30000
; LINE_WIDTH: 0.179238
G1 F9528
G1 X113.593 Y112.49 E.00126
; LINE_WIDTH: 0.195634
G1 X113.694 Y112.341 E.00224
G1 X113.524 Y112.58 F30000
; LINE_WIDTH: 0.129169
G1 F9528
G1 X113.392 Y112.747 E.00149
; WIPE_START
G1 F24000
G1 X113.524 Y112.58 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I-1.158 J-.375 P1  F30000
G1 X105.566 Y137.143 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F9528
G1 X116.741 Y137.143 E.4189
; CHANGE_LAYER
; Z_HEIGHT: 6.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X114.741 Y137.143 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 46/58
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
G3 Z6.8 I.392 J1.152 P1  F30000
G1 X149.184 Y125.41 Z6.8
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9468
G1 X149.153 Y125.421 E.00111
G3 X148.245 Y121.441 I-.653 J-1.945 E.22736
G1 X148.449 Y121.426 E.00679
G3 X149.525 Y125.254 I.051 J2.051 E.17988
G1 X149.239 Y125.385 E.01045
G1 X148.986 Y125.062 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9468
G1 X148.706 Y125.123 E.00879
G3 X148.294 Y121.83 I-.206 J-1.646 E.16016
G1 X148.459 Y121.818 E.00509
G3 X149.043 Y125.045 I.041 J1.659 E.14444
M204 S10000
; WIPE_START
G1 F24000
G1 X148.706 Y125.123 E-.13146
G1 X148.376 Y125.133 E-.12555
G1 X148.05 Y125.076 E-.12565
G1 X147.743 Y124.955 E-.12563
G1 X147.465 Y124.776 E-.12563
G1 X147.228 Y124.545 E-.12564
G1 X147.228 Y124.544 E-.00045
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7 I1.196 J.225 P1  F30000
G1 X149.34 Y113.34 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9468
G1 X149.153 Y113.421 E.00677
G3 X148.245 Y109.441 I-.653 J-1.945 E.22736
G1 X148.449 Y109.426 E.00679
G3 X149.525 Y113.254 I.051 J2.051 E.17988
G1 X149.394 Y113.314 E.00478
G1 X149.189 Y112.987 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9468
G1 X149.182 Y112.989 E.00023
G3 X148.294 Y109.83 I-.682 J-1.513 E.17541
G1 X148.459 Y109.818 E.00509
G3 X149.468 Y112.824 I.041 J1.659 E.12967
G1 X149.241 Y112.957 E.00808
M204 S10000
; WIPE_START
G1 F24000
G1 X149.182 Y112.989 E-.02554
G1 X148.869 Y113.096 E-.12556
G1 X148.541 Y113.138 E-.12563
G1 X148.212 Y113.113 E-.12564
G1 X147.893 Y113.023 E-.12563
G1 X147.599 Y112.873 E-.12563
G1 X147.465 Y112.776 E-.0629
G1 X147.383 Y112.696 E-.04347
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7 I-1.193 J.24 P1  F30000
G1 X151.29 Y132.08 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9468
G1 X153.455 Y132.08 E.07182
G3 X155.697 Y135.349 I.006 J2.399 E.15471
G3 X154.803 Y137.377 I-27.385 J-10.853 E.07353
G1 X142.393 Y137.377 E.41168
G2 X146.102 Y131.6 I-12.429 J-12.06 E.22926
G1 X146.102 Y103.08 E.94606
G1 X150.898 Y103.08 E.15909
G1 X150.898 Y132.08 E.96198
G1 X151.23 Y132.08 E.01102
G1 X151.29 Y131.688 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9468
G1 X153.46 Y131.688 E.06668
G3 X156.063 Y135.489 I.001 J2.791 E.16651
G3 X155.045 Y137.769 I-26.341 J-10.395 E.07673
G1 X141.431 Y137.769 E.41833
G2 X145.71 Y131.52 I-11.518 J-12.478 E.23468
G1 X145.71 Y102.688 E.88594
G1 X151.29 Y102.688 E.17146
G1 X151.29 Y131.628 E.88925
M204 S10000
; WIPE_START
G1 F24000
G1 X153.289 Y131.683 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7 I-.931 J.783 P1  F30000
M73 P83 R3
G1 X153.981 Y132.505 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F9468
G3 X155.234 Y133.47 I-.527 J1.98 E.05384
G1 X152.194 Y136.51 E.14259
G1 X153.862 Y136.51 E.05531
G1 X150.508 Y133.156 E.15732
G1 X147.872 Y133.156 E.08745
G1 X144.518 Y136.51 E.15732
G1 X146.186 Y136.51 E.05531
G1 X144.712 Y135.036 E.06913
G2 X145.543 Y133.637 I-14.85 J-9.762 E.054
G1 X146.021 Y132.764 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.416443
G1 F9468
G1 X150.025 Y132.764 E.12188
G2 X151.239 Y132.785 I.941 J-19.091 E.03696
G1 X151.598 Y132.454 E.01485
G1 X150.694 Y132.451 E.02749
G1 X150.506 Y132.283 E.00767
G1 X150.506 Y125.221 E.21496
G1 X150.387 Y125.248 E.0037
G1 X150.267 Y125.153 E.00466
G1 X150.104 Y125.323 E.00717
G1 X149.706 Y125.605 E.01482
G1 X149.261 Y125.801 E.01482
G1 X148.785 Y125.906 E.01482
G1 X148.299 Y125.915 E.01482
G1 X147.82 Y125.826 E.01482
G1 X147.368 Y125.645 E.01482
G1 X146.954 Y125.371 E.0151
G1 X146.662 Y125.056 E.01309
G1 X146.566 Y125.127 E.00364
G1 X146.494 Y125.113 E.00223
G1 X146.494 Y131.641 E.19869
G1 X146.478 Y131.716 E.00235
G1 X146.045 Y132.709 E.03297
G1 X148.346 Y127.765 F30000
; LINE_WIDTH: 0.351907
G1 F9468
G1 X148.346 Y130.913 E.07924
G1 X148.654 Y130.913 E.00778
G1 X148.654 Y127.761 E.07935
G1 X148.406 Y127.765 E.00627
G1 X148.002 Y127.429 F30000
; LINE_WIDTH: 0.419999
G1 F9468
G1 X148.002 Y131.256 E.11759
G1 X148.998 Y131.256 E.03058
G1 X148.998 Y127.392 E.11872
G3 X148.062 Y127.428 I-.853 J-10.079 E.02876
G1 X147.625 Y126.941 F30000
G1 F9468
G1 X147.625 Y131.633 E.14417
G1 X149.375 Y131.633 E.05375
G1 X149.375 Y126.936 E.14432
G1 X148.814 Y127.037 E.01752
G1 X148.102 Y127.029 E.02186
G1 X147.684 Y126.952 E.01305
G1 X147.248 Y126.412 F30000
G1 F9468
G1 X147.248 Y131.641 E.16066
G1 X147.171 Y132.01 E.01158
G1 X149.752 Y132.01 E.07929
G1 X149.752 Y126.412 E.17202
G1 X149.429 Y126.537 E.01064
G1 X148.804 Y126.66 E.01956
G1 X148.168 Y126.657 E.01956
G1 X147.544 Y126.528 E.01956
G1 X147.304 Y126.434 E.00792
G1 X146.871 Y125.773 F30000
G1 F9468
G1 X146.871 Y131.641 E.1803
G1 X146.824 Y131.867 E.00711
G1 X146.597 Y132.387 E.01742
G1 X150.232 Y132.387 E.1117
G1 X150.129 Y132.283 E.0045
G1 X150.129 Y125.77 E.20014
G1 X149.861 Y125.948 E.00988
G1 X149.345 Y126.169 E.01726
G1 X148.795 Y126.283 E.01726
G1 X148.233 Y126.286 E.01726
G1 X147.682 Y126.177 E.01726
G1 X147.163 Y125.962 E.01726
G1 X146.922 Y125.806 E.00884
G1 X146.547 Y124.651 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973913
G1 F9468
G1 X146.487 Y124.572 E.00044
; LINE_WIDTH: 0.111403
G1 X146.429 Y124.486 E.00058
; LINE_WIDTH: 0.148184
G3 X146.365 Y124.375 I.121 J-.144 E.00113
; LINE_WIDTH: 0.161454
G1 X146.346 Y124.27 E.00103
; LINE_WIDTH: 0.129187
G1 X146.328 Y124.165 E.00075
G1 X146.329 Y122.793 F30000
; LINE_WIDTH: 0.119461
G1 F9468
G3 X146.399 Y122.379 I8.317 J1.203 E.00262
G1 X146.476 Y122.375 F30000
; LINE_WIDTH: 0.111402
G1 F9468
G1 X146.544 Y122.285 E.00063
; LINE_WIDTH: 0.0973916
G1 X146.608 Y122.209 E.00044
G1 X146.476 Y122.375 F30000
; LINE_WIDTH: 0.147262
G1 F9468
G1 X146.403 Y122.472 E.00103
; LINE_WIDTH: 0.18163
G1 X146.306 Y122.615 E.00195
G1 X148.346 Y119.194 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.351907
G1 F9468
G1 X148.654 Y119.19 E.00778
G1 X148.654 Y115.761 E.08633
G1 X148.346 Y115.765 E.00778
G1 X148.346 Y119.134 E.08482
G1 X148.002 Y119.564 F30000
; LINE_WIDTH: 0.419999
G1 F9468
G3 X148.998 Y119.527 I.892 J10.733 E.03061
G1 X148.998 Y115.392 E.12705
G3 X148.002 Y115.429 I-.892 J-10.726 E.03061
G1 X148.002 Y119.504 E.12521
G1 X147.625 Y120.02 F30000
G1 F9468
G1 X148.186 Y119.919 E.01752
G1 X148.898 Y119.927 E.02186
G1 X149.375 Y120.015 E.01489
G1 X149.375 Y114.936 E.15606
G1 X148.814 Y115.037 E.01752
G1 X148.102 Y115.029 E.02186
G1 X147.625 Y114.941 E.01489
G1 X147.625 Y119.96 E.15421
G1 X147.248 Y120.544 F30000
G1 F9468
G1 X147.571 Y120.419 E.01064
G1 X148.196 Y120.296 E.01956
G1 X148.832 Y120.298 E.01956
G1 X149.456 Y120.427 E.01956
G1 X149.752 Y120.543 E.00977
G1 X149.752 Y114.412 E.18842
G1 X149.429 Y114.537 E.01064
G1 X148.804 Y114.66 E.01956
G1 X148.168 Y114.657 E.01956
G1 X147.544 Y114.528 E.01956
G1 X147.248 Y114.412 E.00977
G1 X147.248 Y120.484 E.18657
G1 X146.871 Y121.186 F30000
G1 F9468
G1 X147.139 Y121.007 E.00988
G1 X147.655 Y120.787 E.01726
G1 X148.205 Y120.673 E.01726
G1 X148.767 Y120.67 E.01726
G1 X149.318 Y120.778 E.01726
G1 X149.837 Y120.994 E.01726
G1 X150.129 Y121.183 E.01068
G1 X150.129 Y113.77 E.22777
G1 X149.861 Y113.948 E.00988
G1 X149.345 Y114.169 E.01726
G1 X148.795 Y114.283 E.01726
G1 X148.233 Y114.286 E.01726
G1 X147.682 Y114.177 E.01726
G1 X147.163 Y113.962 E.01726
G1 X146.871 Y113.773 E.01068
G1 X146.871 Y121.126 E.22593
G1 X146.494 Y121.737 F30000
G1 F9468
G1 X146.62 Y121.718 E.00392
G1 X146.733 Y121.802 E.00433
G1 X146.896 Y121.632 E.00724
G1 X147.294 Y121.351 E.01496
G1 X147.739 Y121.154 E.01496
G1 X148.215 Y121.05 E.01496
G1 X148.701 Y121.041 E.01496
G1 X149.18 Y121.129 E.01496
G1 X149.632 Y121.311 E.01496
G1 X150.046 Y121.585 E.01525
G1 X150.338 Y121.9 E.01321
G1 X150.441 Y121.823 E.00395
G1 X150.506 Y121.834 E.00203
G1 X150.506 Y113.221 E.26466
G1 X150.387 Y113.248 E.00373
G1 X150.267 Y113.153 E.0047
G1 X150.104 Y113.323 E.00724
G1 X149.706 Y113.605 E.01496
G1 X149.261 Y113.801 E.01496
G1 X148.785 Y113.906 E.01496
G1 X148.299 Y113.915 E.01496
G1 X147.82 Y113.826 E.01496
G1 X147.368 Y113.645 E.01496
G1 X146.954 Y113.371 E.01525
G1 X146.662 Y113.055 E.01321
G1 X146.566 Y113.127 E.00367
G1 X146.494 Y113.113 E.00225
G1 X146.494 Y121.677 E.26313
G1 X150.453 Y122.305 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.126786
G1 F9468
G1 X150.571 Y122.469 E.00138
; LINE_WIDTH: 0.173118
G1 X150.629 Y122.555 E.0011
; LINE_WIDTH: 0.136069
G1 X150.654 Y122.686 E.00101
; LINE_WIDTH: 0.0969205
G1 X150.672 Y122.791 E.00047
G1 X150.671 Y124.163 F30000
; LINE_WIDTH: 0.119481
G1 F9468
G3 X150.601 Y124.577 I-8.321 J-1.204 E.00262
G1 X150.524 Y124.58 F30000
; LINE_WIDTH: 0.179219
G1 F9468
G1 X150.593 Y124.49 E.00126
; LINE_WIDTH: 0.195634
G1 X150.694 Y124.341 E.00224
G1 X150.524 Y124.58 F30000
; LINE_WIDTH: 0.129161
G1 F9468
G1 X150.392 Y124.747 E.00149
G1 X150.392 Y112.747 F30000
; LINE_WIDTH: 0.129167
G1 F9468
G1 X150.524 Y112.58 E.00149
; LINE_WIDTH: 0.179228
G1 X150.593 Y112.49 E.00126
; LINE_WIDTH: 0.195637
G1 X150.694 Y112.341 E.00224
G1 X150.671 Y112.163 F30000
; LINE_WIDTH: 0.119472
G1 F9468
G3 X150.601 Y112.577 I-8.313 J-1.203 E.00262
G1 X150.672 Y110.791 F30000
; LINE_WIDTH: 0.0969202
G1 F9468
G1 X150.654 Y110.686 E.00047
; LINE_WIDTH: 0.136063
G1 X150.629 Y110.555 E.00101
; LINE_WIDTH: 0.173105
G1 X150.571 Y110.469 E.0011
; LINE_WIDTH: 0.126778
G1 X150.453 Y110.305 E.00138
G1 X148.346 Y107.194 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.351907
G1 F9468
G1 X148.654 Y107.19 E.00778
G1 X148.654 Y105.323 E.04701
G1 X148.346 Y105.323 E.00778
G1 X148.346 Y107.134 E.0456
G1 X148.002 Y107.564 F30000
; LINE_WIDTH: 0.419999
G1 F9468
G3 X148.998 Y107.527 I.892 J10.734 E.03061
G1 X148.998 Y104.98 E.07825
G1 X148.002 Y104.98 E.03058
G1 X148.002 Y107.504 E.07753
G1 X147.625 Y108.02 F30000
G1 F9468
G1 X148.186 Y107.919 E.01752
G1 X148.898 Y107.927 E.02186
G1 X149.375 Y108.015 E.0149
G1 X149.375 Y104.603 E.10482
G1 X147.625 Y104.603 E.05375
G1 X147.625 Y107.96 E.10314
G1 X147.248 Y108.544 F30000
G1 F9468
G1 X147.571 Y108.419 E.01064
G1 X148.196 Y108.296 E.01956
G1 X148.832 Y108.298 E.01956
G1 X149.456 Y108.427 E.01956
G1 X149.752 Y108.543 E.00977
G1 X149.752 Y104.226 E.13266
G1 X147.248 Y104.226 E.07692
G1 X147.248 Y108.484 E.13084
G1 X146.871 Y109.186 F30000
G1 F9468
G1 X147.139 Y109.007 E.00988
G1 X147.655 Y108.787 E.01726
G1 X148.205 Y108.673 E.01726
G1 X148.767 Y108.67 E.01726
G1 X149.318 Y108.778 E.01726
G1 X149.837 Y108.994 E.01726
G1 X150.129 Y109.183 E.01068
G1 X150.129 Y103.849 E.16388
G1 X146.871 Y103.849 E.10009
G1 X146.871 Y109.126 E.16214
G1 X146.494 Y109.737 F30000
G1 F9468
G1 X146.621 Y109.718 E.00392
G1 X146.733 Y109.802 E.00433
G1 X146.896 Y109.632 E.00724
G1 X147.294 Y109.351 E.01496
G1 X147.739 Y109.154 E.01496
G1 X148.215 Y109.049 E.01496
G1 X148.701 Y109.041 E.01496
G1 X149.18 Y109.129 E.01496
G1 X149.632 Y109.311 E.01496
G1 X150.046 Y109.585 E.01525
G1 X150.338 Y109.9 E.01321
G1 X150.441 Y109.823 E.00395
G1 X150.506 Y109.834 E.00203
G1 X150.506 Y103.472 E.19549
G1 X146.494 Y103.472 E.12327
G1 X146.494 Y109.677 E.19065
G1 X146.608 Y110.209 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973923
G1 F9468
G1 X146.544 Y110.285 E.00044
; LINE_WIDTH: 0.111416
G1 X146.476 Y110.375 E.00063
; LINE_WIDTH: 0.147276
G1 X146.403 Y110.472 E.00103
; LINE_WIDTH: 0.181646
G1 X146.306 Y110.615 E.00195
G1 X146.329 Y110.793 F30000
; LINE_WIDTH: 0.119475
G1 F9468
G3 X146.399 Y110.379 I8.323 J1.204 E.00262
G1 X146.328 Y112.165 F30000
; LINE_WIDTH: 0.129188
G1 F9468
G1 X146.346 Y112.27 E.00075
; LINE_WIDTH: 0.161454
G1 X146.365 Y112.375 E.00103
; LINE_WIDTH: 0.148176
G2 X146.429 Y112.486 I.185 J-.032 E.00113
; LINE_WIDTH: 0.1114
G1 X146.487 Y112.572 E.00058
; LINE_WIDTH: 0.0973906
G1 X146.547 Y112.651 E.00044
; WIPE_START
G1 F24000
G1 X146.487 Y112.572 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7 I-1.207 J-.154 P1  F30000
G1 X143.38 Y136.943 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F9468
G1 X154.473 Y136.943 E.41582
; WIPE_START
G1 F24000
G1 X152.473 Y136.943 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7 I.335 J-1.17 P1  F30000
G1 X112.184 Y125.41 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9468
G1 X112.153 Y125.421 E.00111
G3 X111.245 Y121.441 I-.653 J-1.945 E.22736
G1 X111.449 Y121.426 E.00679
G3 X112.525 Y125.254 I.051 J2.051 E.17988
G1 X112.239 Y125.385 E.01045
G1 X111.986 Y125.062 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9468
G1 X111.706 Y125.123 E.00879
G3 X111.294 Y121.83 I-.206 J-1.646 E.16016
G1 X111.459 Y121.818 E.00509
G3 X112.043 Y125.045 I.041 J1.659 E.14444
M204 S10000
; WIPE_START
G1 F24000
G1 X111.706 Y125.123 E-.13146
G1 X111.376 Y125.133 E-.12555
G1 X111.05 Y125.076 E-.12565
G1 X110.743 Y124.955 E-.12563
G1 X110.465 Y124.776 E-.12563
G1 X110.228 Y124.545 E-.12564
G1 X110.228 Y124.544 E-.00045
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7 I1.206 J.163 P1  F30000
G1 X112.246 Y109.576 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9468
G1 X112.436 Y109.651 E.00678
G3 X111.245 Y109.441 I-.937 J1.825 E.38685
G1 X111.449 Y109.426 E.00679
G3 X112.056 Y109.502 I.051 J2.051 E.02037
G1 X112.19 Y109.555 E.00479
G1 X112.107 Y109.932 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9468
G3 X111.294 Y109.83 I-.607 J1.544 E.2949
G1 X111.459 Y109.818 E.00509
G3 X112.05 Y109.912 I.041 J1.659 E.01851
M204 S10000
; WIPE_START
G1 F24000
G1 X112.401 Y110.083 E-.14825
G1 X112.659 Y110.289 E-.12564
G1 X112.872 Y110.543 E-.12564
G1 X113.03 Y110.833 E-.12563
G1 X113.127 Y111.149 E-.12564
G1 X113.159 Y111.413 E-.101
G1 X113.157 Y111.434 E-.00821
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7 I-1.194 J-.235 P1  F30000
G1 X109.102 Y132.08 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9468
G1 X109.102 Y103.08 E.96198
G1 X113.898 Y103.08 E.15909
G1 X113.898 Y131.6 E.94606
G2 X117.595 Y137.377 I16.541 J-6.514 E.22895
G1 X105.197 Y137.377 E.41126
G3 X104.983 Y136.945 I9.944 J-5.198 E.01599
G1 X104.301 Y135.343 E.05775
G3 X106.545 Y132.08 I2.242 J-.861 E.15442
G1 X109.042 Y132.08 E.08284
G1 X108.71 Y131.688 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9468
G1 X108.71 Y102.688 E.89109
G1 X114.29 Y102.688 E.17146
G1 X114.29 Y131.52 E.88594
G2 X118.572 Y137.769 I15.757 J-6.208 E.23475
G1 X104.955 Y137.769 E.41842
G3 X104.625 Y137.106 I15.255 J-8.005 E.02275
G1 X103.937 Y135.487 E.05405
G3 X106.54 Y131.688 I2.608 J-1.005 E.16634
G1 X108.65 Y131.688 E.06484
M204 S10000
; WIPE_START
G1 F24000
G1 X108.654 Y129.688 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7 I-.889 J-.831 P1  F30000
G1 X106.019 Y132.505 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F9468
G2 X104.766 Y133.47 I.526 J1.979 E.05385
G1 X107.806 Y136.51 E.1426
G1 X106.138 Y136.51 E.05531
G1 X109.492 Y133.156 E.15732
G1 X112.128 Y133.156 E.08745
G1 X115.482 Y136.51 E.15732
G1 X113.814 Y136.51 E.05531
G1 X115.288 Y135.036 E.06913
G3 X114.457 Y133.637 I14.85 J-9.762 E.054
G1 X113.973 Y132.764 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.415764
G1 F9468
G1 X113.521 Y131.714 E.03472
G1 X113.506 Y130.758 E.02905
G1 X113.506 Y125.221 E.16823
G1 X113.387 Y125.248 E.00369
G1 X113.267 Y125.153 E.00465
G1 X113.104 Y125.323 E.00716
G1 X112.706 Y125.605 E.01479
G1 X112.261 Y125.801 E.01479
G1 X111.785 Y125.906 E.01479
G1 X111.299 Y125.915 E.01479
G1 X110.82 Y125.826 E.01479
G1 X110.368 Y125.645 E.01479
G1 X109.954 Y125.371 E.01508
G1 X109.662 Y125.056 E.01306
G1 X109.566 Y125.127 E.00363
G1 X109.494 Y125.113 E.00223
G1 X109.494 Y132.283 E.21785
G1 X109.306 Y132.451 E.00766
G1 X108.404 Y132.451 E.0274
G1 X108.733 Y132.774 E.01402
G2 X113.913 Y132.764 I1.1 J-781.214 E.15736
G1 X111.654 Y127.761 F30000
; LINE_WIDTH: 0.351907
G1 F9468
G1 X111.346 Y127.765 E.00778
G1 X111.346 Y130.913 E.07924
G1 X111.654 Y130.913 E.00778
G1 X111.654 Y127.821 E.07783
G1 X111.998 Y127.392 F30000
; LINE_WIDTH: 0.419999
G1 F9468
G3 X111.002 Y127.429 I-.892 J-10.728 E.03061
G1 X111.002 Y131.256 E.11759
G1 X111.998 Y131.256 E.03058
G1 X111.998 Y127.452 E.11687
G1 X112.375 Y126.936 F30000
G1 F9468
G1 X111.814 Y127.037 E.01752
G1 X111.102 Y127.029 E.02186
G1 X110.625 Y126.941 E.01489
G1 X110.625 Y131.633 E.14417
G1 X112.375 Y131.633 E.05375
G1 X112.375 Y126.996 E.14248
G1 X112.752 Y126.412 F30000
G1 F9468
G1 X112.429 Y126.537 E.01064
G1 X111.804 Y126.66 E.01956
G1 X111.168 Y126.657 E.01956
G1 X110.544 Y126.528 E.01956
G1 X110.248 Y126.412 E.00977
G1 X110.248 Y132.01 E.172
G2 X112.825 Y132.008 I1.067 J-379.133 E.07916
G1 X112.752 Y131.641 E.01151
G1 X112.752 Y126.472 E.15884
G1 X113.129 Y125.77 F30000
G1 F9468
G1 X112.861 Y125.948 E.00988
G1 X112.345 Y126.169 E.01726
G1 X111.795 Y126.283 E.01726
G1 X111.233 Y126.286 E.01726
G1 X110.682 Y126.177 E.01726
G1 X110.163 Y125.962 E.01726
G1 X109.871 Y125.773 E.01068
G1 X109.871 Y132.283 E.20004
G1 X109.784 Y132.387 E.00415
G1 X113.395 Y132.387 E.11096
G1 X113.173 Y131.861 E.01754
G1 X113.129 Y131.641 E.0069
G1 X113.129 Y125.83 E.17856
G1 X113.392 Y124.747 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.12916
G1 F9468
G1 X113.524 Y124.58 E.00149
; LINE_WIDTH: 0.179217
G1 X113.593 Y124.49 E.00126
; LINE_WIDTH: 0.19563
G1 X113.694 Y124.341 E.00224
G1 X113.671 Y124.163 F30000
; LINE_WIDTH: 0.119476
G1 F9468
G3 X113.601 Y124.577 I-8.311 J-1.203 E.00262
G1 X113.672 Y122.791 F30000
; LINE_WIDTH: 0.0969205
G1 F9468
G1 X113.654 Y122.686 E.00047
; LINE_WIDTH: 0.136067
G1 X113.629 Y122.555 E.00101
; LINE_WIDTH: 0.173112
G1 X113.571 Y122.469 E.0011
; LINE_WIDTH: 0.126782
G1 X113.453 Y122.305 E.00138
G1 X113.506 Y121.834 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F9468
G1 X113.506 Y113.221 E.26466
G1 X113.387 Y113.248 E.00373
G1 X113.267 Y113.153 E.0047
G1 X113.104 Y113.323 E.00724
G1 X112.706 Y113.605 E.01496
G1 X112.261 Y113.801 E.01496
G1 X111.785 Y113.906 E.01496
G1 X111.299 Y113.915 E.01496
G1 X110.82 Y113.826 E.01496
G1 X110.368 Y113.645 E.01496
G1 X109.954 Y113.371 E.01525
G1 X109.662 Y113.055 E.01321
G1 X109.566 Y113.127 E.00367
G1 X109.494 Y113.113 E.00225
G1 X109.494 Y121.737 E.26498
G1 X109.62 Y121.718 E.00392
G1 X109.733 Y121.802 E.00433
G1 X109.896 Y121.632 E.00724
G1 X110.294 Y121.351 E.01496
G1 X110.739 Y121.154 E.01496
G1 X111.215 Y121.05 E.01496
G1 X111.701 Y121.041 E.01496
G1 X112.18 Y121.129 E.01496
G1 X112.632 Y121.311 E.01496
G1 X113.046 Y121.585 E.01525
G1 X113.338 Y121.9 E.01321
G1 X113.447 Y121.824 E.00409
G1 X113.129 Y121.183 F30000
G1 F9468
G1 X113.129 Y113.77 E.22777
G1 X112.861 Y113.948 E.00988
G1 X112.345 Y114.169 E.01726
G1 X111.795 Y114.283 E.01726
G1 X111.233 Y114.286 E.01726
G1 X110.682 Y114.177 E.01726
G1 X110.163 Y113.962 E.01726
G1 X109.871 Y113.773 E.01068
G1 X109.871 Y121.186 E.22777
G1 X110.139 Y121.007 E.00988
G1 X110.655 Y120.787 E.01726
G1 X111.205 Y120.673 E.01726
G1 X111.767 Y120.67 E.01726
G1 X112.318 Y120.778 E.01726
G1 X112.837 Y120.994 E.01726
G1 X113.078 Y121.15 E.00884
G1 X112.752 Y120.543 F30000
G1 F9468
G1 X112.752 Y114.412 E.18842
G1 X112.429 Y114.537 E.01064
G1 X111.804 Y114.66 E.01956
G1 X111.168 Y114.657 E.01956
G1 X110.544 Y114.528 E.01956
G1 X110.248 Y114.412 E.00977
G1 X110.248 Y120.544 E.18842
G1 X110.571 Y120.419 E.01064
G1 X111.196 Y120.296 E.01956
G1 X111.832 Y120.298 E.01956
G1 X112.456 Y120.427 E.01956
G1 X112.696 Y120.522 E.00792
G1 X112.375 Y120.015 F30000
G1 F9468
G1 X112.375 Y114.936 E.15606
G1 X111.814 Y115.037 E.01752
G1 X111.102 Y115.029 E.02186
G1 X110.625 Y114.941 E.01489
G1 X110.625 Y120.02 E.15606
G1 X111.186 Y119.919 E.01752
G1 X111.898 Y119.927 E.02186
G1 X112.316 Y120.004 E.01305
G1 X111.998 Y119.527 F30000
G1 F9468
G1 X111.998 Y115.392 E.12705
G3 X111.002 Y115.429 I-.892 J-10.728 E.03061
G1 X111.002 Y119.564 E.12705
G3 X111.938 Y119.528 I.854 J10.083 E.02876
G1 X111.654 Y119.19 F30000
; LINE_WIDTH: 0.351907
G1 F9468
G1 X111.654 Y115.761 E.08633
G1 X111.346 Y115.765 E.00778
G1 X111.346 Y119.194 E.08633
G1 X111.594 Y119.191 E.00627
G1 X109.608 Y122.209 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.097392
G1 F9468
G1 X109.544 Y122.285 E.00044
; LINE_WIDTH: 0.111405
G1 X109.476 Y122.375 E.00063
; LINE_WIDTH: 0.147265
G1 X109.403 Y122.472 E.00103
; LINE_WIDTH: 0.181634
G1 X109.306 Y122.615 E.00195
G1 X109.329 Y122.793 F30000
; LINE_WIDTH: 0.119466
G1 F9468
G3 X109.399 Y122.379 I8.312 J1.203 E.00262
G1 X109.328 Y124.165 F30000
; LINE_WIDTH: 0.129189
G1 F9468
G1 X109.346 Y124.27 E.00075
; LINE_WIDTH: 0.161458
G1 X109.365 Y124.375 E.00103
; LINE_WIDTH: 0.148183
G2 X109.429 Y124.486 I.185 J-.032 E.00113
; LINE_WIDTH: 0.111405
G1 X109.487 Y124.572 E.00058
; LINE_WIDTH: 0.0973914
G1 X109.547 Y124.651 E.00044
M73 P84 R3
G1 X109.547 Y112.651 F30000
; LINE_WIDTH: 0.0973909
G1 F9468
G1 X109.487 Y112.572 E.00044
; LINE_WIDTH: 0.111405
G1 X109.429 Y112.486 E.00058
; LINE_WIDTH: 0.14818
G3 X109.365 Y112.375 I.121 J-.144 E.00113
; LINE_WIDTH: 0.161458
G1 X109.346 Y112.27 E.00103
; LINE_WIDTH: 0.12919
G1 X109.328 Y112.165 E.00075
G1 X109.329 Y110.793 F30000
; LINE_WIDTH: 0.119479
G1 F9468
G3 X109.399 Y110.379 I8.333 J1.206 E.00262
G1 X109.476 Y110.375 F30000
; LINE_WIDTH: 0.11142
G1 F9468
G1 X109.544 Y110.285 E.00063
; LINE_WIDTH: 0.097392
G1 X109.608 Y110.209 E.00044
G1 X109.476 Y110.375 F30000
; LINE_WIDTH: 0.147281
G1 F9468
G1 X109.403 Y110.472 E.00103
; LINE_WIDTH: 0.18165
G1 X109.306 Y110.615 E.00195
; WIPE_START
G1 F24000
G1 X109.403 Y110.472 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7 I.05 J1.216 P1  F30000
G1 X113.453 Y110.305 Z7
G1 Z6.6
G1 E.8 F1800
; LINE_WIDTH: 0.126779
G1 F9468
G1 X113.571 Y110.469 E.00138
; LINE_WIDTH: 0.173105
G1 X113.629 Y110.555 E.0011
; LINE_WIDTH: 0.136063
G1 X113.654 Y110.686 E.00101
; LINE_WIDTH: 0.0969202
G1 X113.672 Y110.791 E.00047
G1 X113.506 Y109.834 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F9468
G1 X113.506 Y103.472 E.19549
G1 X109.494 Y103.472 E.12327
G1 X109.494 Y109.737 E.19249
G1 X109.621 Y109.718 E.00393
G1 X109.733 Y109.802 E.00433
G1 X109.896 Y109.632 E.00724
G1 X110.294 Y109.351 E.01496
G1 X110.739 Y109.154 E.01496
G1 X111.215 Y109.049 E.01496
G1 X111.701 Y109.041 E.01496
G1 X112.18 Y109.129 E.01496
G1 X112.632 Y109.311 E.01496
G1 X113.046 Y109.585 E.01525
G1 X113.338 Y109.9 E.01321
G1 X113.447 Y109.824 E.00409
G1 X113.129 Y109.183 F30000
G1 F9468
G1 X113.129 Y103.849 E.16388
G1 X109.871 Y103.849 E.10009
G1 X109.871 Y109.186 E.16398
G1 X110.139 Y109.007 E.00988
G1 X110.655 Y108.787 E.01726
G1 X111.205 Y108.673 E.01726
G1 X111.767 Y108.67 E.01726
G1 X112.318 Y108.778 E.01726
G1 X112.837 Y108.994 E.01726
G1 X113.078 Y109.15 E.00884
G1 X112.752 Y108.543 F30000
G1 F9468
G1 X112.752 Y104.226 E.13266
G1 X110.248 Y104.226 E.07692
G1 X110.248 Y108.544 E.13268
G1 X110.571 Y108.419 E.01064
G1 X111.196 Y108.296 E.01956
G1 X111.832 Y108.298 E.01956
G1 X112.456 Y108.427 E.01956
G1 X112.696 Y108.522 E.00792
G1 X112.375 Y108.015 F30000
G1 F9468
G1 X112.375 Y104.603 E.10482
G1 X110.625 Y104.603 E.05375
G1 X110.625 Y108.02 E.10498
G1 X111.186 Y107.919 E.01752
G1 X111.898 Y107.927 E.02186
G1 X112.316 Y108.004 E.01305
G1 X111.998 Y107.527 F30000
G1 F9468
G1 X111.998 Y104.98 E.07825
G1 X111.002 Y104.98 E.03058
G1 X111.002 Y107.564 E.07937
G3 X111.938 Y107.528 I.854 J10.085 E.02876
G1 X111.654 Y107.19 F30000
; LINE_WIDTH: 0.351907
G1 F9468
G1 X111.654 Y105.323 E.04701
G1 X111.346 Y105.323 E.00778
G1 X111.346 Y107.194 E.04711
G1 X111.594 Y107.191 E.00627
G1 X113.671 Y112.163 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.119468
G1 F9468
G3 X113.601 Y112.577 I-8.318 J-1.203 E.00262
G1 X113.524 Y112.58 F30000
; LINE_WIDTH: 0.179226
G1 F9468
G1 X113.593 Y112.49 E.00126
; LINE_WIDTH: 0.195633
G1 X113.694 Y112.341 E.00224
G1 X113.524 Y112.58 F30000
; LINE_WIDTH: 0.129164
G1 F9468
G1 X113.392 Y112.747 E.00149
; WIPE_START
G1 F24000
G1 X113.524 Y112.58 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7 I-1.207 J.154 P1  F30000
G1 X116.623 Y136.943 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50291
G1 F9468
G1 X105.527 Y136.943 E.41593
; CHANGE_LAYER
; Z_HEIGHT: 6.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X107.527 Y136.943 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 47/58
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
G3 Z7 I.325 J1.173 P1  F30000
G1 X149.151 Y125.414 Z7
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5702
G1 X148.956 Y125.477 E.00677
G3 X148.245 Y121.441 I-.456 J-2 E.22058
G1 X148.449 Y121.426 E.00679
G3 X149.343 Y125.347 I.051 J2.051 E.18666
G1 X149.207 Y125.394 E.00478
G1 X149.014 Y125.055 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5702
G1 X148.706 Y125.123 E.00969
G3 X148.294 Y121.83 I-.206 J-1.646 E.16017
G1 X148.459 Y121.818 E.00509
G3 X149.07 Y125.035 I.041 J1.659 E.14355
M204 S10000
; WIPE_START
G1 F24000
G1 X148.706 Y125.123 E-.14241
G1 X148.376 Y125.133 E-.12556
G1 X148.05 Y125.076 E-.12563
G1 X147.743 Y124.955 E-.12564
G1 X147.465 Y124.776 E-.12563
G1 X147.248 Y124.564 E-.11514
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.2 I1.197 J.221 P1  F30000
G1 X149.313 Y113.36 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5702
G1 X148.956 Y113.477 E.01244
G3 X148.245 Y109.441 I-.456 J-2 E.22058
G1 X148.449 Y109.426 E.00679
G3 X149.367 Y113.336 I.051 J2.051 E.18578
G1 X149.188 Y112.988 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5702
G1 X149.182 Y112.989 E.0002
G3 X148.294 Y109.83 I-.682 J-1.513 E.17541
G1 X148.459 Y109.818 E.00509
G3 X149.468 Y112.824 I.041 J1.659 E.12967
G1 X149.24 Y112.958 E.00812
M204 S10000
; WIPE_START
G1 F24000
G1 X149.182 Y112.989 E-.02511
G1 X148.869 Y113.096 E-.12556
G1 X148.541 Y113.138 E-.12563
G1 X148.212 Y113.113 E-.12564
G1 X147.893 Y113.023 E-.12563
G1 X147.599 Y112.873 E-.12563
G1 X147.465 Y112.776 E-.06289
G1 X147.382 Y112.695 E-.0439
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.2 I-1.193 J.24 P1  F30000
G1 X151.29 Y132.08 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5702
G1 X153.455 Y132.08 E.07182
G3 X155.697 Y135.349 I.006 J2.399 E.15471
G3 X154.902 Y137.177 I-36.274 J-14.683 E.06614
G1 X142.587 Y137.177 E.40852
G2 X146.102 Y131.6 I-12.871 J-12.01 E.21999
G1 X146.102 Y103.08 E.94606
G1 X150.898 Y103.08 E.15909
G1 X150.898 Y132.08 E.96198
G1 X151.23 Y132.08 E.01102
G1 X151.29 Y131.688 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5702
G1 X153.46 Y131.688 E.06668
G3 X156.063 Y135.489 I.001 J2.791 E.16651
G3 X155.145 Y137.569 I-30.967 J-12.43 E.06986
G1 X141.644 Y137.569 E.41485
G2 X145.71 Y131.52 I-11.835 J-12.348 E.22568
G1 X145.71 Y102.688 E.88594
G1 X151.29 Y102.688 E.17146
G1 X151.29 Y131.628 E.88925
M204 S10000
; WIPE_START
G1 F24000
G1 X153.289 Y131.683 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.2 I-.929 J.786 P1  F30000
G1 X153.981 Y132.502 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5702
G3 X155.236 Y133.467 I-.557 J2.023 E.05387
G1 X152.394 Y136.31 E.13334
G1 X153.662 Y136.31 E.04204
G1 X146.45 Y129.098 E.3383
G1 X146.45 Y126.902 E.07287
G1 X147.642 Y125.71 E.05592
G2 X150.195 Y125.167 I.858 J-2.237 E.09153
G1 X150.55 Y125.522 E.01666
G1 X150.55 Y130.478 E.16442
G1 X144.718 Y136.31 E.27357
G1 X145.986 Y136.31 E.04204
G1 X144.712 Y135.036 E.05975
G2 X145.543 Y133.637 I-14.828 J-9.749 E.054
G1 X143.544 Y136.743 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50291
G1 F5702
G1 X154.567 Y136.743 E.41316
; WIPE_START
G1 F24000
G1 X152.567 Y136.743 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.2 I1.204 J-.176 P1  F30000
G1 X150.453 Y122.305 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.126786
G1 F5702
G1 X150.571 Y122.469 E.00138
; LINE_WIDTH: 0.173117
G1 X150.629 Y122.555 E.0011
; LINE_WIDTH: 0.136069
G1 X150.654 Y122.686 E.00101
; LINE_WIDTH: 0.0969199
G1 X150.672 Y122.791 E.00047
G1 X150.601 Y124.577 F30000
; LINE_WIDTH: 0.119479
G1 F5702
G2 X150.671 Y124.163 I-8.249 J-1.618 E.00262
G1 X150.694 Y124.341 F30000
; LINE_WIDTH: 0.195635
G1 F5702
G1 X150.593 Y124.49 E.00224
; LINE_WIDTH: 0.17923
G1 X150.524 Y124.58 E.00126
; LINE_WIDTH: 0.129166
G1 X150.392 Y124.747 E.00149
; WIPE_START
G1 F24000
G1 X150.524 Y124.58 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.2 I-.022 J-1.217 P1  F30000
G1 X146.547 Y124.651 Z7.2
G1 Z6.8
G1 E.8 F1800
; LINE_WIDTH: 0.097392
G1 F5702
G1 X146.487 Y124.572 E.00044
; LINE_WIDTH: 0.111416
G1 X146.429 Y124.486 E.00058
; LINE_WIDTH: 0.148194
G3 X146.365 Y124.375 I.121 J-.144 E.00113
; LINE_WIDTH: 0.161448
G1 X146.346 Y124.27 E.00103
; LINE_WIDTH: 0.129184
G1 X146.328 Y124.165 E.00075
G1 X146.399 Y122.379 F30000
; LINE_WIDTH: 0.11947
G1 F5702
G2 X146.329 Y122.793 I8.237 J1.617 E.00262
G1 X146.306 Y122.615 F30000
; LINE_WIDTH: 0.181649
G1 F5702
G1 X146.403 Y122.472 E.00195
; LINE_WIDTH: 0.147275
G1 X146.476 Y122.375 E.00103
; LINE_WIDTH: 0.111408
G1 X146.544 Y122.285 E.00063
; LINE_WIDTH: 0.0973917
G1 X146.608 Y122.209 E.00044
G1 X148.248 Y121.092 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5702
G2 X146.811 Y121.783 I.299 J2.463 E.05385
G1 X146.45 Y121.422 E.01692
G1 X146.45 Y119.226 E.07287
G1 X150.55 Y115.126 E.19231
G1 X150.55 Y117.846 E.09021
G1 X146.45 Y113.746 E.19231
G1 X146.45 Y113.161 E.01943
G1 X146.65 Y113.009 E.00833
G2 X147.252 Y113.518 I2.36 J-2.18 E.02619
G1 X146.547 Y112.651 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973915
G1 F5702
G1 X146.487 Y112.572 E.00044
; LINE_WIDTH: 0.111395
G1 X146.429 Y112.486 E.00058
; LINE_WIDTH: 0.148171
M73 P84 R2
G3 X146.365 Y112.375 I.121 J-.144 E.00113
; LINE_WIDTH: 0.161448
G1 X146.346 Y112.27 E.00103
; LINE_WIDTH: 0.129184
G1 X146.328 Y112.165 E.00075
G1 X146.399 Y110.378 F30000
; LINE_WIDTH: 0.119477
G1 F5702
G2 X146.329 Y110.793 I8.169 J1.606 E.00262
G1 X146.306 Y110.615 F30000
; LINE_WIDTH: 0.181661
G1 F5702
G1 X146.403 Y110.472 E.00195
; LINE_WIDTH: 0.147284
G1 X146.476 Y110.375 E.00103
; LINE_WIDTH: 0.111416
G1 X146.544 Y110.285 E.00063
; LINE_WIDTH: 0.0973915
G1 X146.608 Y110.209 E.00044
G1 X147.311 Y109.391 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5702
G3 X148.882 Y109.118 I1.159 J2.003 E.05404
G1 X150.55 Y107.45 E.07821
G1 X150.55 Y109.795 E.07777
G1 X150.35 Y109.946 E.00833
G3 X146.45 Y106.071 I86.694 J-91.115 E.18239
G1 X146.45 Y103.874 E.07287
G1 X146.896 Y103.428 E.0209
G1 X148.524 Y103.428 E.05401
G1 X150.453 Y110.305 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.126778
G1 F5702
G1 X150.571 Y110.469 E.00138
; LINE_WIDTH: 0.173103
G1 X150.629 Y110.555 E.0011
; LINE_WIDTH: 0.136063
G1 X150.654 Y110.686 E.00101
; LINE_WIDTH: 0.0969202
G1 X150.672 Y110.791 E.00047
G1 X150.601 Y112.577 F30000
; LINE_WIDTH: 0.119472
G1 F5702
G2 X150.671 Y112.163 I-8.243 J-1.617 E.00262
G1 X150.694 Y112.341 F30000
; LINE_WIDTH: 0.195632
G1 F5702
G1 X150.593 Y112.49 E.00224
; LINE_WIDTH: 0.179228
G1 X150.524 Y112.58 E.00126
; LINE_WIDTH: 0.129166
G1 X150.392 Y112.747 E.00149
; WIPE_START
G1 F24000
G1 X150.524 Y112.58 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.2 I-.386 J-1.154 P1  F30000
G1 X112.151 Y125.414 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5702
G1 X111.956 Y125.477 E.00677
G3 X111.245 Y121.441 I-.456 J-2 E.22058
G1 X111.449 Y121.426 E.00679
G3 X112.343 Y125.347 I.051 J2.051 E.18666
G1 X112.207 Y125.394 E.00478
G1 X112.014 Y125.055 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5702
G1 X111.706 Y125.123 E.00969
G3 X111.294 Y121.83 I-.206 J-1.646 E.16017
G1 X111.459 Y121.818 E.00509
G3 X112.07 Y125.035 I.041 J1.659 E.14355
M204 S10000
; WIPE_START
G1 F24000
G1 X111.706 Y125.123 E-.14241
G1 X111.376 Y125.133 E-.12556
G1 X111.05 Y125.076 E-.12563
G1 X110.743 Y124.955 E-.12564
G1 X110.465 Y124.776 E-.12563
G1 X110.248 Y124.564 E-.11513
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.2 I1.207 J.158 P1  F30000
G1 X112.218 Y109.558 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5702
G1 X112.25 Y109.567 E.00111
G3 X111.245 Y109.441 I-.75 J1.91 E.39364
G1 X111.449 Y109.426 E.00679
G3 X111.856 Y109.456 I.051 J2.051 E.01358
G1 X112.16 Y109.542 E.01046
G1 X112.107 Y109.932 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5702
G3 X111.294 Y109.83 I-.607 J1.544 E.2949
G1 X111.459 Y109.818 E.00509
G3 X112.05 Y109.912 I.041 J1.659 E.01851
M204 S10000
; WIPE_START
G1 F24000
G1 X112.401 Y110.083 E-.14825
G1 X112.659 Y110.289 E-.12564
G1 X112.872 Y110.543 E-.12564
G1 X113.03 Y110.833 E-.12563
G1 X113.127 Y111.149 E-.12564
G1 X113.159 Y111.418 E-.10289
G1 X113.158 Y111.434 E-.00631
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.2 I-1.194 J-.235 P1  F30000
G1 X109.102 Y132.08 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5702
G1 X109.102 Y103.08 E.96198
G1 X113.898 Y103.08 E.15909
G1 X113.898 Y131.6 E.94606
G2 X117.417 Y137.177 I16.321 J-6.399 E.22005
G1 X105.098 Y137.177 E.40862
G1 X104.986 Y136.951 E.00838
G1 X104.303 Y135.348 E.05778
G3 X106.545 Y132.08 I2.236 J-.869 E.15469
G1 X109.042 Y132.08 E.08284
G1 X108.71 Y131.688 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5702
G1 X108.71 Y102.688 E.89109
G1 X114.29 Y102.688 E.17146
G1 X114.29 Y131.52 E.88594
G2 X118.354 Y137.569 I15.773 J-6.208 E.22566
G1 X104.856 Y137.569 E.41476
G1 X104.629 Y137.115 E.01558
G1 X103.937 Y135.489 E.0543
G3 X106.54 Y131.688 I2.602 J-1.01 E.1665
G1 X108.65 Y131.688 E.06484
M204 S10000
; WIPE_START
G1 F24000
G1 X108.654 Y129.688 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.2 I-.889 J-.832 P1  F30000
G1 X106.02 Y132.503 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5702
G2 X104.763 Y133.467 I.551 J2.02 E.05387
G1 X107.606 Y136.31 E.13338
G1 X106.338 Y136.31 E.04205
G1 X113.55 Y129.098 E.3383
G1 X113.55 Y126.902 E.07287
G1 X112.361 Y125.713 E.05578
G3 X109.806 Y125.166 I-.855 J-2.247 E.0916
G1 X109.45 Y125.522 E.0167
G1 X109.45 Y130.478 E.16442
G1 X115.282 Y136.31 E.27357
G1 X114.014 Y136.31 E.04204
G1 X115.288 Y135.036 E.05975
G3 X114.457 Y133.637 I14.828 J-9.749 E.054
G1 X113.392 Y124.747 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.129166
G1 F5702
G1 X113.524 Y124.58 E.00149
; LINE_WIDTH: 0.179228
G1 X113.593 Y124.49 E.00126
; LINE_WIDTH: 0.195631
G1 X113.694 Y124.341 E.00224
G1 X113.671 Y124.163 F30000
; LINE_WIDTH: 0.119475
G1 F5702
G3 X113.601 Y124.577 I-8.24 J-1.192 E.00262
G1 X113.672 Y122.791 F30000
; LINE_WIDTH: 0.0969199
G1 F5702
G1 X113.654 Y122.686 E.00047
; LINE_WIDTH: 0.136066
G1 X113.629 Y122.555 E.00101
; LINE_WIDTH: 0.173113
G1 X113.571 Y122.469 E.0011
; LINE_WIDTH: 0.126784
G1 X113.453 Y122.305 E.00138
G1 X111.751 Y121.094 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5702
G3 X113.188 Y121.784 I-.187 J2.232 E.05407
G1 X113.55 Y121.422 E.01697
G1 X113.55 Y119.226 E.07287
G1 X109.45 Y115.126 E.19231
G1 X109.45 Y117.846 E.09021
G1 X113.55 Y113.746 E.19231
G1 X113.55 Y113.212 E.01772
G1 X113.492 Y113.285 E.00308
G1 X113.263 Y113.093 E.00991
G3 X112.726 Y113.541 I-1.376 J-1.104 E.02334
G1 X113.392 Y112.747 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.129165
G1 F5702
G1 X113.524 Y112.58 E.00149
; LINE_WIDTH: 0.179227
G1 X113.593 Y112.49 E.00126
; LINE_WIDTH: 0.195631
G1 X113.694 Y112.341 E.00224
G1 X113.671 Y112.163 F30000
; LINE_WIDTH: 0.119468
G1 F5702
G3 X113.601 Y112.577 I-8.333 J-1.206 E.00262
G1 X113.672 Y110.791 F30000
; LINE_WIDTH: 0.0969202
M73 P85 R2
G1 F5702
G1 X113.654 Y110.686 E.00047
; LINE_WIDTH: 0.136061
G1 X113.629 Y110.555 E.00101
; LINE_WIDTH: 0.173101
G1 X113.571 Y110.469 E.0011
; LINE_WIDTH: 0.126776
G1 X113.453 Y110.305 E.00138
G1 X112.683 Y109.396 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5702
G2 X111.114 Y109.114 I-1.198 J2.158 E.05385
G1 X109.45 Y107.45 E.07803
G1 X109.45 Y109.777 E.07717
G1 X109.528 Y109.687 E.00393
G1 X109.737 Y109.863 E.00907
G3 X110.03 Y109.59 I.822 J.589 E.01338
G1 X113.55 Y106.071 E.16509
G1 X113.55 Y103.874 E.07287
G1 X113.104 Y103.428 E.0209
G1 X111.476 Y103.428 E.05401
G1 X109.608 Y110.209 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973922
G1 F5702
G1 X109.544 Y110.285 E.00044
; LINE_WIDTH: 0.111416
G1 X109.476 Y110.375 E.00063
; LINE_WIDTH: 0.147283
G1 X109.403 Y110.472 E.00103
; LINE_WIDTH: 0.181661
G1 X109.306 Y110.615 E.00195
G1 X109.329 Y110.793 F30000
; LINE_WIDTH: 0.119481
G1 F5702
G3 X109.399 Y110.379 I8.32 J1.204 E.00262
G1 X109.328 Y112.165 F30000
; LINE_WIDTH: 0.129186
G1 F5702
G1 X109.346 Y112.27 E.00075
; LINE_WIDTH: 0.161452
G1 X109.365 Y112.375 E.00103
; LINE_WIDTH: 0.148171
G2 X109.429 Y112.486 I.185 J-.032 E.00113
; LINE_WIDTH: 0.111395
G1 X109.487 Y112.572 E.00058
; LINE_WIDTH: 0.0973914
G1 X109.547 Y112.651 E.00044
G1 X109.608 Y122.209 F30000
; LINE_WIDTH: 0.0973917
G1 F5702
G1 X109.544 Y122.285 E.00044
; LINE_WIDTH: 0.11141
G1 X109.476 Y122.375 E.00063
; LINE_WIDTH: 0.147277
G1 X109.403 Y122.472 E.00103
; LINE_WIDTH: 0.181652
G1 X109.306 Y122.615 E.00195
G1 X109.329 Y122.793 F30000
; LINE_WIDTH: 0.119474
G1 F5702
G3 X109.399 Y122.379 I8.304 J1.201 E.00262
G1 X109.328 Y124.165 F30000
; LINE_WIDTH: 0.129187
G1 F5702
G1 X109.346 Y124.27 E.00075
; LINE_WIDTH: 0.161454
G1 X109.365 Y124.375 E.00103
; LINE_WIDTH: 0.148191
G2 X109.429 Y124.486 I.185 J-.032 E.00113
; LINE_WIDTH: 0.111411
G1 X109.487 Y124.572 E.00058
; LINE_WIDTH: 0.0973919
G1 X109.547 Y124.651 E.00044
; WIPE_START
G1 F24000
G1 X109.487 Y124.572 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.2 I-1.153 J-.39 P1  F30000
G1 X105.373 Y136.743 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502906
G1 F5702
G1 X116.397 Y136.743 E.41319
; CHANGE_LAYER
; Z_HEIGHT: 7
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X114.397 Y136.743 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 48/58
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
G3 Z7.2 I.377 J1.157 P1  F30000
G1 X149.184 Y125.41 Z7.2
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5635
G1 X149.153 Y125.421 E.00111
G3 X148.245 Y121.441 I-.653 J-1.945 E.22736
G1 X148.449 Y121.426 E.00679
G3 X149.525 Y125.254 I.051 J2.051 E.17988
G1 X149.239 Y125.385 E.01045
G1 X149.044 Y125.045 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5635
G1 X149.028 Y125.05 E.00051
G3 X148.294 Y121.83 I-.528 J-1.573 E.17033
G1 X148.459 Y121.818 E.00509
G3 X149.329 Y124.914 I.041 J1.659 E.13476
G1 X149.098 Y125.02 E.0078
M204 S10000
; WIPE_START
G1 F24000
G1 X149.028 Y125.05 E-.02906
G1 X148.706 Y125.125 E-.12555
G1 X148.376 Y125.133 E-.12563
G1 X148.05 Y125.076 E-.12564
G1 X147.743 Y124.955 E-.12564
G1 X147.465 Y124.776 E-.12563
G1 X147.271 Y124.587 E-.10285
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I1.197 J.218 P1  F30000
G1 X149.313 Y113.36 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5635
G1 X148.956 Y113.477 E.01244
G3 X148.245 Y109.441 I-.456 J-2 E.22058
G1 X148.449 Y109.426 E.00679
G3 X149.367 Y113.336 I.051 J2.051 E.18578
G1 X149.187 Y112.989 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5635
G1 X149.182 Y112.989 E.00016
G3 X148.294 Y109.83 I-.682 J-1.513 E.17541
G1 X148.459 Y109.818 E.00509
G3 X149.468 Y112.824 I.041 J1.659 E.12967
G1 X149.239 Y112.958 E.00816
M204 S10000
; WIPE_START
G1 F24000
G1 X149.182 Y112.989 E-.02463
G1 X148.869 Y113.096 E-.12556
G1 X148.541 Y113.138 E-.12563
G1 X148.376 Y113.133 E-.06289
G1 X148.05 Y113.076 E-.12564
G1 X147.743 Y112.955 E-.12564
G1 X147.465 Y112.776 E-.12563
G1 X147.381 Y112.694 E-.04437
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I-1.193 J.241 P1  F30000
G1 X151.29 Y132.08 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5635
G1 X153.455 Y132.08 E.07182
G3 X155.696 Y135.351 I.004 J2.4 E.15476
G3 X155.003 Y136.977 I-34.657 J-13.811 E.05864
G1 X142.769 Y136.977 E.40583
G2 X146.102 Y131.6 I-12.795 J-11.653 E.21105
G1 X146.102 Y103.08 E.94606
G1 X150.898 Y103.08 E.15909
G1 X150.898 Y132.08 E.96198
G1 X151.23 Y132.08 E.01102
G1 X151.29 Y131.688 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5635
G1 X153.46 Y131.688 E.06668
G3 X156.062 Y135.49 I-.001 J2.792 E.1665
G3 X155.245 Y137.369 I-34.389 J-13.85 E.06297
G1 X141.849 Y137.369 E.4116
G2 X145.71 Y131.52 I-11.944 J-12.083 E.21689
G1 X145.71 Y102.688 E.88594
G1 X151.29 Y102.688 E.17146
G1 X151.29 Y131.628 E.88925
M204 S10000
; WIPE_START
G1 F24000
G1 X153.289 Y131.683 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I-.929 J.786 P1  F30000
G1 X153.981 Y132.502 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5635
G3 X155.237 Y133.467 I-.558 J2.024 E.05387
G1 X152.594 Y136.11 E.12396
G1 X153.462 Y136.11 E.02878
G1 X146.45 Y129.098 E.32891
G1 X146.45 Y126.902 E.07287
G1 X147.642 Y125.71 E.05592
G2 X150.195 Y125.167 I.858 J-2.237 E.09153
G1 X150.55 Y125.522 E.01666
G1 X150.55 Y130.478 E.16442
G1 X144.918 Y136.11 E.26418
G1 X145.786 Y136.11 E.02878
G1 X144.712 Y135.036 E.05037
G2 X145.543 Y133.637 I-14.826 J-9.749 E.054
G1 X143.716 Y136.543 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F5635
G1 X154.656 Y136.543 E.41007
; WIPE_START
G1 F24000
G1 X152.656 Y136.543 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I1.203 J-.186 P1  F30000
G1 X150.453 Y122.305 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.126786
G1 F5635
G1 X150.571 Y122.469 E.00138
; LINE_WIDTH: 0.173118
G1 X150.629 Y122.555 E.0011
; LINE_WIDTH: 0.13607
G1 X150.654 Y122.686 E.00101
; LINE_WIDTH: 0.0969206
G1 X150.672 Y122.791 E.00047
G1 X150.601 Y124.577 F30000
; LINE_WIDTH: 0.119476
G1 F5635
G2 X150.671 Y124.163 I-8.247 J-1.618 E.00262
G1 X150.694 Y124.341 F30000
; LINE_WIDTH: 0.195638
G1 F5635
G1 X150.593 Y124.49 E.00224
; LINE_WIDTH: 0.17923
G1 X150.524 Y124.58 E.00126
; LINE_WIDTH: 0.129167
G1 X150.392 Y124.747 E.00149
; WIPE_START
G1 F24000
G1 X150.524 Y124.58 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I-.022 J-1.217 P1  F30000
G1 X146.547 Y124.651 Z7.4
G1 Z7
G1 E.8 F1800
; LINE_WIDTH: 0.0973909
G1 F5635
G1 X146.487 Y124.572 E.00044
; LINE_WIDTH: 0.111396
G1 X146.429 Y124.486 E.00058
; LINE_WIDTH: 0.148182
G3 X146.365 Y124.375 I.121 J-.144 E.00113
; LINE_WIDTH: 0.161444
G1 X146.346 Y124.27 E.00103
; LINE_WIDTH: 0.129182
G1 X146.328 Y124.165 E.00075
G1 X146.399 Y122.379 F30000
; LINE_WIDTH: 0.119464
G1 F5635
G2 X146.329 Y122.793 I8.265 J1.621 E.00262
G1 X146.306 Y122.615 F30000
; LINE_WIDTH: 0.181633
G1 F5635
G1 X146.403 Y122.472 E.00195
; LINE_WIDTH: 0.147263
G1 X146.476 Y122.375 E.00103
; LINE_WIDTH: 0.111402
G1 X146.544 Y122.285 E.00063
; LINE_WIDTH: 0.0973916
G1 X146.608 Y122.209 E.00044
G1 X148.248 Y121.092 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5635
G2 X146.811 Y121.783 I.299 J2.463 E.05385
G1 X146.45 Y121.422 E.01692
G1 X146.45 Y119.226 E.07287
G1 X150.55 Y115.126 E.19231
G1 X150.55 Y117.846 E.09021
G1 X146.45 Y113.746 E.19231
G1 X146.45 Y113.161 E.01943
G1 X146.65 Y113.009 E.00832
G2 X147.252 Y113.518 I2.359 J-2.18 E.02619
G1 X146.547 Y112.651 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973911
G1 F5635
G1 X146.487 Y112.572 E.00044
; LINE_WIDTH: 0.11139
G1 X146.429 Y112.486 E.00058
; LINE_WIDTH: 0.148164
G3 X146.365 Y112.375 I.121 J-.144 E.00113
; LINE_WIDTH: 0.161456
G1 X146.346 Y112.27 E.00103
; LINE_WIDTH: 0.129188
G1 X146.328 Y112.165 E.00075
G1 X146.399 Y110.378 F30000
; LINE_WIDTH: 0.119479
G1 F5635
G2 X146.329 Y110.793 I8.17 J1.607 E.00262
G1 X146.306 Y110.615 F30000
; LINE_WIDTH: 0.181643
G1 F5635
G1 X146.403 Y110.472 E.00195
; LINE_WIDTH: 0.147273
G1 X146.476 Y110.375 E.00103
; LINE_WIDTH: 0.111411
G1 X146.544 Y110.285 E.00063
; LINE_WIDTH: 0.0973922
G1 X146.608 Y110.209 E.00044
G1 X147.311 Y109.391 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5635
G3 X148.882 Y109.118 I1.159 J2.003 E.05404
G1 X150.55 Y107.45 E.07821
G1 X150.55 Y109.795 E.07777
G1 X150.35 Y109.946 E.00833
G3 X146.45 Y106.071 I86.649 J-91.07 E.18239
G1 X146.45 Y103.874 E.07287
G1 X146.896 Y103.428 E.0209
G1 X148.524 Y103.428 E.05401
G1 X150.453 Y110.305 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.126781
G1 F5635
G1 X150.571 Y110.469 E.00138
; LINE_WIDTH: 0.173111
G1 X150.629 Y110.555 E.0011
; LINE_WIDTH: 0.136067
G1 X150.654 Y110.686 E.00101
; LINE_WIDTH: 0.0969205
G1 X150.672 Y110.791 E.00047
G1 X150.601 Y112.577 F30000
; LINE_WIDTH: 0.119468
G1 F5635
G2 X150.671 Y112.163 I-8.241 J-1.617 E.00262
G1 X150.694 Y112.341 F30000
; LINE_WIDTH: 0.195635
G1 F5635
G1 X150.593 Y112.49 E.00224
; LINE_WIDTH: 0.179223
G1 X150.524 Y112.58 E.00126
; LINE_WIDTH: 0.129163
G1 X150.392 Y112.747 E.00149
; WIPE_START
G1 F24000
G1 X150.524 Y112.58 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I-.386 J-1.154 P1  F30000
G1 X112.184 Y125.41 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5635
G1 X112.153 Y125.421 E.00111
G3 X111.245 Y121.441 I-.653 J-1.945 E.22736
G1 X111.449 Y121.426 E.00679
G3 X112.525 Y125.254 I.051 J2.051 E.17988
G1 X112.239 Y125.385 E.01045
G1 X112.044 Y125.045 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5635
G1 X112.028 Y125.05 E.00051
G3 X111.294 Y121.83 I-.528 J-1.573 E.17033
G1 X111.459 Y121.818 E.00509
G3 X112.329 Y124.914 I.041 J1.659 E.13476
G1 X112.098 Y125.02 E.0078
M204 S10000
; WIPE_START
G1 F24000
G1 X112.028 Y125.05 E-.02906
G1 X111.706 Y125.125 E-.12555
G1 X111.376 Y125.133 E-.12563
G1 X111.05 Y125.076 E-.12564
G1 X110.743 Y124.955 E-.12564
G1 X110.465 Y124.776 E-.12563
G1 X110.271 Y124.587 E-.10285
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I1.207 J.156 P1  F30000
G1 X112.218 Y109.558 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5635
G1 X112.25 Y109.567 E.00111
G3 X111.245 Y109.441 I-.75 J1.91 E.39364
G1 X111.449 Y109.426 E.00679
G3 X111.856 Y109.456 I.051 J2.051 E.01358
G1 X112.16 Y109.542 E.01046
G1 X112.107 Y109.932 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5635
G3 X111.294 Y109.83 I-.607 J1.544 E.2949
G1 X111.459 Y109.818 E.00509
G3 X112.05 Y109.912 I.041 J1.659 E.01851
M204 S10000
; WIPE_START
G1 F24000
G1 X112.401 Y110.083 E-.14826
G1 X112.659 Y110.289 E-.12564
G1 X112.872 Y110.543 E-.12563
G1 X113.03 Y110.833 E-.12563
G1 X113.127 Y111.149 E-.12564
G1 X113.159 Y111.423 E-.10477
G1 X113.158 Y111.434 E-.00443
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I-1.194 J-.235 P1  F30000
G1 X109.102 Y132.08 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5635
G1 X109.102 Y103.08 E.96198
G1 X113.898 Y103.08 E.15909
G1 X113.898 Y131.6 E.94606
G2 X117.235 Y136.977 I16.126 J-6.285 E.21112
G1 X104.997 Y136.977 E.40597
G1 X104.303 Y135.348 E.05872
G3 X106.545 Y132.08 I2.236 J-.869 E.15469
G1 X109.042 Y132.08 E.08284
G1 X108.71 Y131.688 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5635
G1 X108.71 Y102.688 E.89109
G1 X114.29 Y102.688 E.17146
G1 X114.29 Y131.52 E.88594
G2 X118.153 Y137.369 I15.834 J-6.259 E.21693
G1 X104.755 Y137.369 E.41168
G1 X104.634 Y137.126 E.00834
G1 X103.937 Y135.489 E.05467
G3 X106.54 Y131.688 I2.602 J-1.01 E.1665
G1 X108.65 Y131.688 E.06484
M204 S10000
; WIPE_START
G1 F24000
G1 X108.654 Y129.688 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I-.889 J-.832 P1  F30000
G1 X106.019 Y132.503 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5635
G2 X104.763 Y133.467 I.549 J2.017 E.05387
G1 X107.406 Y136.11 E.12399
G1 X106.538 Y136.11 E.02878
G1 X113.55 Y129.098 E.32891
G1 X113.55 Y126.902 E.07287
G1 X112.361 Y125.713 E.05578
G3 X109.806 Y125.166 I-.855 J-2.247 E.0916
G1 X109.45 Y125.522 E.0167
G1 X109.45 Y130.478 E.16442
G1 X115.082 Y136.11 E.26418
G1 X114.214 Y136.11 E.02878
G1 X115.288 Y135.036 E.05036
G3 X114.457 Y133.637 I14.849 J-9.761 E.054
G1 X113.392 Y124.747 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.129166
G1 F5635
G1 X113.524 Y124.58 E.00149
; LINE_WIDTH: 0.179227
G1 X113.593 Y124.49 E.00126
; LINE_WIDTH: 0.195635
G1 X113.694 Y124.341 E.00224
G1 X113.671 Y124.163 F30000
; LINE_WIDTH: 0.119472
G1 F5635
G3 X113.601 Y124.577 I-8.323 J-1.204 E.00262
G1 X113.672 Y122.791 F30000
; LINE_WIDTH: 0.0969206
G1 F5635
G1 X113.654 Y122.686 E.00047
; LINE_WIDTH: 0.136068
G1 X113.629 Y122.555 E.00101
; LINE_WIDTH: 0.173115
G1 X113.571 Y122.469 E.0011
; LINE_WIDTH: 0.126784
G1 X113.453 Y122.305 E.00138
G1 X111.751 Y121.094 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5635
G3 X113.188 Y121.784 I-.187 J2.232 E.05407
G1 X113.55 Y121.422 E.01697
G1 X113.55 Y119.226 E.07287
G1 X109.45 Y115.126 E.19231
G1 X109.45 Y117.846 E.09021
G1 X113.55 Y113.746 E.19231
G1 X113.55 Y113.212 E.01772
G1 X113.492 Y113.285 E.00308
G1 X113.263 Y113.093 E.00991
G3 X112.726 Y113.541 I-1.376 J-1.104 E.02335
G1 X113.392 Y112.747 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.129163
G1 F5635
G1 X113.524 Y112.58 E.00149
; LINE_WIDTH: 0.179221
G1 X113.593 Y112.49 E.00126
; LINE_WIDTH: 0.195631
G1 X113.694 Y112.341 E.00224
G1 X113.671 Y112.163 F30000
; LINE_WIDTH: 0.119463
G1 F5635
G3 X113.601 Y112.577 I-8.316 J-1.203 E.00262
G1 X113.672 Y110.791 F30000
; LINE_WIDTH: 0.0969205
G1 F5635
G1 X113.654 Y110.686 E.00047
; LINE_WIDTH: 0.136065
G1 X113.629 Y110.555 E.00101
; LINE_WIDTH: 0.173107
G1 X113.571 Y110.469 E.0011
; LINE_WIDTH: 0.126779
G1 X113.453 Y110.305 E.00138
G1 X112.683 Y109.396 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5635
G2 X111.114 Y109.114 I-1.198 J2.158 E.05385
G1 X109.45 Y107.45 E.07803
G1 X109.45 Y109.777 E.07717
G1 X109.528 Y109.687 E.00393
M73 P86 R2
G1 X109.737 Y109.863 E.00907
G3 X110.031 Y109.59 I.822 J.589 E.01338
G1 X113.55 Y106.071 E.16509
G1 X113.55 Y103.874 E.07287
G1 X113.104 Y103.428 E.0209
G1 X111.476 Y103.428 E.05401
G1 X109.608 Y110.209 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973925
G1 F5635
G1 X109.544 Y110.285 E.00044
; LINE_WIDTH: 0.111416
G1 X109.476 Y110.375 E.00063
; LINE_WIDTH: 0.147278
G1 X109.403 Y110.472 E.00103
; LINE_WIDTH: 0.181648
G1 X109.306 Y110.615 E.00195
G1 X109.329 Y110.793 F30000
; LINE_WIDTH: 0.119483
G1 F5635
G3 X109.399 Y110.379 I8.321 J1.204 E.00262
G1 X109.328 Y112.165 F30000
; LINE_WIDTH: 0.12919
G1 F5635
G1 X109.346 Y112.27 E.00075
; LINE_WIDTH: 0.16146
G1 X109.365 Y112.375 E.00103
; LINE_WIDTH: 0.148168
G2 X109.429 Y112.486 I.185 J-.032 E.00113
; LINE_WIDTH: 0.111394
G1 X109.487 Y112.572 E.00058
; LINE_WIDTH: 0.0973915
G1 X109.547 Y112.651 E.00044
G1 X109.608 Y122.209 F30000
; LINE_WIDTH: 0.0973915
G1 F5635
G1 X109.544 Y122.285 E.00044
; LINE_WIDTH: 0.111404
G1 X109.476 Y122.375 E.00063
; LINE_WIDTH: 0.147266
G1 X109.403 Y122.472 E.00103
; LINE_WIDTH: 0.181635
G1 X109.306 Y122.615 E.00195
G1 X109.329 Y122.793 F30000
; LINE_WIDTH: 0.119468
G1 F5635
G3 X109.399 Y122.379 I8.313 J1.203 E.00262
G1 X109.328 Y124.165 F30000
; LINE_WIDTH: 0.129185
G1 F5635
G1 X109.346 Y124.27 E.00075
; LINE_WIDTH: 0.16145
G1 X109.365 Y124.375 E.00103
; LINE_WIDTH: 0.148186
G2 X109.429 Y124.486 I.185 J-.032 E.00113
; LINE_WIDTH: 0.111399
G1 X109.487 Y124.572 E.00058
; LINE_WIDTH: 0.0973912
G1 X109.547 Y124.651 E.00044
; WIPE_START
G1 F24000
G1 X109.487 Y124.572 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I-1.148 J-.403 P1  F30000
G1 X105.284 Y136.543 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F5635
G1 X116.23 Y136.543 E.41031
; CHANGE_LAYER
; Z_HEIGHT: 7.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X114.23 Y136.543 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 49/58
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
G3 Z7.4 I.37 J1.16 P1  F30000
G1 X149.151 Y125.414 Z7.4
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5578
G1 X148.956 Y125.477 E.00677
G3 X148.245 Y121.441 I-.456 J-2 E.22058
G1 X148.449 Y121.426 E.00679
G3 X149.343 Y125.347 I.051 J2.051 E.18666
G1 X149.207 Y125.394 E.00478
G1 X149.075 Y125.031 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5578
G1 X149.028 Y125.05 E.00157
G3 X148.294 Y121.83 I-.528 J-1.573 E.17033
G1 X148.459 Y121.818 E.00509
G3 X149.329 Y124.914 I.041 J1.659 E.13476
G1 X149.13 Y125.006 E.00674
M204 S10000
; WIPE_START
G1 F24000
G1 X149.028 Y125.05 E-.04215
G1 X148.706 Y125.125 E-.12556
G1 X148.376 Y125.133 E-.12563
G1 X148.05 Y125.076 E-.12563
G1 X147.743 Y124.955 E-.12563
G1 X147.465 Y124.776 E-.12564
G1 X147.296 Y124.611 E-.08976
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.6 I1.197 J.22 P1  F30000
G1 X149.373 Y113.332 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5578
G1 X149.343 Y113.347 E.00111
G3 X148.245 Y109.441 I-.843 J-1.87 E.23415
G1 X148.449 Y109.426 E.00679
G3 X149.697 Y113.143 I.051 J2.051 E.17309
G1 X149.425 Y113.302 E.01045
G1 X149.186 Y112.989 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5578
G1 X149.182 Y112.989 E.00012
G3 X148.294 Y109.83 I-.682 J-1.513 E.17541
G1 X148.459 Y109.818 E.00509
G3 X149.468 Y112.824 I.041 J1.659 E.12967
G1 X149.238 Y112.959 E.0082
M204 S10000
; WIPE_START
G1 F24000
G1 X149.182 Y112.989 E-.02413
G1 X148.869 Y113.096 E-.12556
G1 X148.541 Y113.138 E-.12563
G1 X148.376 Y113.133 E-.06289
G1 X148.05 Y113.076 E-.12564
G1 X147.743 Y112.955 E-.12563
G1 X147.465 Y112.776 E-.12564
G1 X147.38 Y112.693 E-.04488
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.6 I-1.193 J.241 P1  F30000
G1 X151.29 Y132.08 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5578
G1 X153.455 Y132.08 E.07182
G3 X155.696 Y135.351 I.001 J2.402 E.1547
G3 X155.09 Y136.777 I-28.851 J-11.417 E.05139
G1 X142.953 Y136.777 E.40261
G2 X146.102 Y131.6 I-13.36 J-11.674 E.202
G1 X146.102 Y103.08 E.94605
G1 X150.898 Y103.08 E.15909
G1 X150.898 Y132.08 E.96198
G1 X151.23 Y132.08 E.01102
G1 X151.29 Y131.688 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5578
G1 X153.46 Y131.688 E.06668
G3 X156.062 Y135.49 I-.004 J2.795 E.16644
G3 X155.345 Y137.169 I-54.202 J-22.174 E.0561
G1 X142.049 Y137.169 E.40853
G2 X145.71 Y131.52 I-12.276 J-11.966 E.20818
G1 X145.71 Y102.688 E.88594
G1 X151.29 Y102.688 E.17146
G1 X151.29 Y131.628 E.88925
M204 S10000
; WIPE_START
G1 F24000
G1 X153.289 Y131.683 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.6 I-.929 J.786 P1  F30000
G1 X153.981 Y132.502 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5578
G3 X155.239 Y133.465 I-.763 J2.3 E.05355
G1 X152.794 Y135.91 E.1147
G1 X153.262 Y135.91 E.01551
G1 X146.45 Y129.098 E.31953
G1 X146.45 Y126.902 E.07287
G1 X147.642 Y125.71 E.05592
G2 X150.195 Y125.167 I.858 J-2.237 E.09153
G1 X150.55 Y125.522 E.01666
G1 X150.55 Y130.478 E.16442
G1 X145.118 Y135.91 E.2548
G1 X145.586 Y135.91 E.01551
G1 X144.712 Y135.036 E.04098
G2 X145.543 Y133.637 I-14.806 J-9.737 E.054
G1 X143.872 Y136.343 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F5578
G1 X154.746 Y136.343 E.40759
; WIPE_START
G1 F24000
G1 X152.746 Y136.343 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.6 I1.201 J-.196 P1  F30000
G1 X150.453 Y122.305 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.126784
G1 F5578
G1 X150.571 Y122.469 E.00138
; LINE_WIDTH: 0.173115
G1 X150.629 Y122.555 E.0011
; LINE_WIDTH: 0.136069
G1 X150.654 Y122.686 E.00101
; LINE_WIDTH: 0.0969203
G1 X150.672 Y122.791 E.00047
G1 X150.601 Y124.577 F30000
; LINE_WIDTH: 0.119477
G1 F5578
G2 X150.671 Y124.163 I-8.161 J-1.605 E.00262
G1 X150.694 Y124.341 F30000
; LINE_WIDTH: 0.195634
G1 F5578
G1 X150.593 Y124.49 E.00224
; LINE_WIDTH: 0.179229
G1 X150.524 Y124.58 E.00126
; LINE_WIDTH: 0.129165
G1 X150.392 Y124.747 E.00149
; WIPE_START
G1 F24000
G1 X150.524 Y124.58 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.6 I-.022 J-1.217 P1  F30000
G1 X146.547 Y124.651 Z7.6
G1 Z7.2
G1 E.8 F1800
; LINE_WIDTH: 0.0973913
G1 F5578
G1 X146.487 Y124.572 E.00044
; LINE_WIDTH: 0.111402
G1 X146.429 Y124.486 E.00058
; LINE_WIDTH: 0.148178
G3 X146.365 Y124.375 I.121 J-.144 E.00113
; LINE_WIDTH: 0.161462
G1 X146.346 Y124.27 E.00103
; LINE_WIDTH: 0.129191
G1 X146.328 Y124.165 E.00075
G1 X146.399 Y122.379 F30000
; LINE_WIDTH: 0.119463
G1 F5578
G2 X146.329 Y122.793 I8.251 J1.619 E.00262
G1 X146.306 Y122.615 F30000
; LINE_WIDTH: 0.181652
G1 F5578
G1 X146.403 Y122.472 E.00195
; LINE_WIDTH: 0.14728
G1 X146.476 Y122.375 E.00103
; LINE_WIDTH: 0.111416
G1 X146.544 Y122.285 E.00063
; LINE_WIDTH: 0.0973912
G1 X146.608 Y122.209 E.00044
G1 X148.248 Y121.092 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5578
G2 X146.811 Y121.783 I.299 J2.463 E.05385
G1 X146.45 Y121.422 E.01692
G1 X146.45 Y119.226 E.07287
G1 X150.55 Y115.126 E.19231
G1 X150.55 Y117.846 E.09021
G1 X146.45 Y113.746 E.19231
G1 X146.45 Y113.161 E.01943
G1 X146.65 Y113.009 E.00833
G2 X147.252 Y113.518 I2.36 J-2.181 E.02619
G1 X146.547 Y112.651 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973909
G1 F5578
G1 X146.487 Y112.572 E.00044
; LINE_WIDTH: 0.111403
G1 X146.429 Y112.486 E.00058
; LINE_WIDTH: 0.148175
G3 X146.365 Y112.375 I.121 J-.144 E.00113
; LINE_WIDTH: 0.161462
G1 X146.346 Y112.27 E.00103
; LINE_WIDTH: 0.129191
G1 X146.328 Y112.165 E.00075
G1 X146.399 Y110.378 F30000
; LINE_WIDTH: 0.119473
G1 F5578
G2 X146.329 Y110.793 I8.164 J1.606 E.00262
G1 X146.306 Y110.615 F30000
; LINE_WIDTH: 0.181642
G1 F5578
G1 X146.403 Y110.472 E.00195
; LINE_WIDTH: 0.147272
G1 X146.476 Y110.375 E.00103
; LINE_WIDTH: 0.111411
G1 X146.544 Y110.285 E.00063
; LINE_WIDTH: 0.0973916
G1 X146.608 Y110.209 E.00044
G1 X147.311 Y109.391 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5578
G3 X148.882 Y109.118 I1.159 J2.003 E.05404
G1 X150.55 Y107.45 E.07821
G1 X150.55 Y109.795 E.07777
G1 X150.35 Y109.946 E.00833
G3 X146.45 Y106.071 I86.662 J-91.084 E.18239
G1 X146.45 Y103.874 E.07287
G1 X146.896 Y103.428 E.0209
G1 X148.524 Y103.428 E.05401
G1 X150.453 Y110.305 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.12678
G1 F5578
G1 X150.571 Y110.469 E.00138
; LINE_WIDTH: 0.17311
G1 X150.629 Y110.555 E.0011
; LINE_WIDTH: 0.136066
G1 X150.654 Y110.686 E.00101
; LINE_WIDTH: 0.0969205
G1 X150.672 Y110.791 E.00047
G1 X150.601 Y112.577 F30000
; LINE_WIDTH: 0.119468
G1 F5578
G2 X150.671 Y112.163 I-8.258 J-1.619 E.00262
G1 X150.694 Y112.341 F30000
; LINE_WIDTH: 0.195637
G1 F5578
G1 X150.593 Y112.49 E.00224
; LINE_WIDTH: 0.179227
G1 X150.524 Y112.58 E.00126
; LINE_WIDTH: 0.129166
G1 X150.392 Y112.747 E.00149
; WIPE_START
G1 F24000
G1 X150.524 Y112.58 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.6 I-.386 J-1.154 P1  F30000
G1 X112.151 Y125.414 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5578
G1 X111.956 Y125.477 E.00677
G3 X111.245 Y121.441 I-.456 J-2 E.22058
G1 X111.449 Y121.426 E.00679
G3 X112.343 Y125.347 I.051 J2.051 E.18666
G1 X112.207 Y125.394 E.00478
G1 X112.075 Y125.031 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5578
G1 X112.028 Y125.05 E.00157
G3 X111.294 Y121.83 I-.528 J-1.573 E.17033
G1 X111.459 Y121.818 E.00509
G3 X112.329 Y124.914 I.041 J1.659 E.13476
G1 X112.13 Y125.006 E.00674
M204 S10000
; WIPE_START
G1 F24000
G1 X112.028 Y125.05 E-.04215
G1 X111.706 Y125.125 E-.12556
G1 X111.376 Y125.133 E-.12563
G1 X111.05 Y125.076 E-.12563
G1 X110.743 Y124.955 E-.12563
G1 X110.465 Y124.776 E-.12564
G1 X110.296 Y124.611 E-.08975
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.6 I1.206 J.159 P1  F30000
G1 X112.28 Y109.582 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5578
G1 X112.614 Y109.754 E.01245
G3 X111.245 Y109.441 I-1.114 J1.723 E.38006
G1 X111.449 Y109.426 E.00679
G3 X112.225 Y109.558 I.051 J2.051 E.02629
G1 X112.107 Y109.932 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5578
G3 X111.294 Y109.83 I-.607 J1.544 E.2949
G1 X111.459 Y109.818 E.00509
G3 X112.05 Y109.912 I.041 J1.659 E.01851
M204 S10000
; WIPE_START
G1 F24000
G1 X112.401 Y110.083 E-.14825
G1 X112.659 Y110.289 E-.12563
G1 X112.872 Y110.543 E-.12564
G1 X113.03 Y110.833 E-.12563
G1 X113.127 Y111.149 E-.12564
G1 X113.159 Y111.428 E-.10666
G1 X113.159 Y111.434 E-.00255
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.6 I-1.194 J-.235 P1  F30000
G1 X109.102 Y132.08 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5578
G1 X109.102 Y103.08 E.96198
G1 X113.898 Y103.08 E.15909
G1 X113.898 Y131.6 E.94605
G2 X117.039 Y136.777 I16.659 J-6.565 E.20183
G1 X104.912 Y136.777 E.40226
G1 X104.303 Y135.348 E.05152
G3 X106.545 Y132.08 I2.236 J-.869 E.15469
G1 X109.042 Y132.08 E.08284
G1 X108.71 Y131.688 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5578
G1 X108.71 Y102.688 E.89109
G1 X114.29 Y102.688 E.17146
G1 X114.29 Y131.52 E.88594
G2 X117.954 Y137.169 I15.671 J-6.152 E.20828
G1 X104.655 Y137.169 E.40862
G1 X103.937 Y135.489 E.05613
G3 X106.54 Y131.688 I2.602 J-1.01 E.1665
G1 X108.65 Y131.688 E.06484
M204 S10000
; WIPE_START
G1 F24000
G1 X108.654 Y129.688 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.6 I-.888 J-.832 P1  F30000
G1 X106.018 Y132.503 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5578
G2 X104.762 Y133.466 I.55 J2.019 E.05384
G1 X107.206 Y135.91 E.11466
G1 X106.738 Y135.91 E.01551
G1 X113.55 Y129.098 E.31953
G1 X113.55 Y126.902 E.07287
G1 X112.361 Y125.713 E.05578
G3 X109.806 Y125.166 I-.855 J-2.247 E.0916
G1 X109.45 Y125.522 E.0167
G1 X109.45 Y130.478 E.16442
G1 X114.882 Y135.91 E.2548
G1 X114.414 Y135.91 E.01551
G1 X115.288 Y135.036 E.04098
G3 X114.457 Y133.637 I14.806 J-9.737 E.054
G1 X113.392 Y124.747 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.129165
G1 F5578
G1 X113.524 Y124.58 E.00149
; LINE_WIDTH: 0.179227
G1 X113.593 Y124.49 E.00126
; LINE_WIDTH: 0.195632
G1 X113.694 Y124.341 E.00224
G1 X113.671 Y124.163 F30000
; LINE_WIDTH: 0.119473
G1 F5578
G3 X113.601 Y124.577 I-8.222 J-1.189 E.00262
G1 X113.672 Y122.791 F30000
; LINE_WIDTH: 0.0969203
G1 F5578
G1 X113.654 Y122.686 E.00047
; LINE_WIDTH: 0.136069
G1 X113.629 Y122.555 E.00101
; LINE_WIDTH: 0.173116
G1 X113.571 Y122.469 E.0011
; LINE_WIDTH: 0.126785
G1 X113.453 Y122.305 E.00138
G1 X111.751 Y121.094 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5578
G3 X113.188 Y121.784 I-.187 J2.232 E.05407
G1 X113.55 Y121.422 E.01697
G1 X113.55 Y119.226 E.07287
G1 X109.45 Y115.126 E.19231
G1 X109.45 Y117.846 E.09021
G1 X113.55 Y113.746 E.19231
G1 X113.55 Y113.212 E.01772
G1 X113.492 Y113.285 E.00308
G1 X113.263 Y113.093 E.00991
G3 X112.726 Y113.541 I-1.376 J-1.104 E.02334
G1 X113.392 Y112.747 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.129165
G1 F5578
G1 X113.524 Y112.58 E.00149
; LINE_WIDTH: 0.179226
G1 X113.593 Y112.49 E.00126
; LINE_WIDTH: 0.195633
G1 X113.694 Y112.341 E.00224
G1 X113.671 Y112.163 F30000
; LINE_WIDTH: 0.119464
G1 F5578
G3 X113.601 Y112.577 I-8.338 J-1.207 E.00262
G1 X113.672 Y110.791 F30000
; LINE_WIDTH: 0.0969205
G1 F5578
G1 X113.654 Y110.686 E.00047
; LINE_WIDTH: 0.136065
G1 X113.629 Y110.555 E.00101
; LINE_WIDTH: 0.173108
G1 X113.571 Y110.469 E.0011
; LINE_WIDTH: 0.12678
G1 X113.453 Y110.305 E.00138
G1 X112.683 Y109.396 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5578
G2 X111.114 Y109.114 I-1.198 J2.158 E.05385
G1 X109.45 Y107.45 E.07803
G1 X109.45 Y109.777 E.07717
G1 X109.527 Y109.687 E.00393
G1 X109.737 Y109.863 E.00908
G3 X110.03 Y109.59 I.822 J.589 E.01338
G1 X113.55 Y106.071 E.16509
G1 X113.55 Y103.874 E.07287
G1 X113.104 Y103.428 E.0209
G1 X111.476 Y103.428 E.05401
G1 X109.608 Y110.209 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973916
G1 F5578
G1 X109.544 Y110.285 E.00044
; LINE_WIDTH: 0.111413
G1 X109.476 Y110.375 E.00063
; LINE_WIDTH: 0.147275
G1 X109.403 Y110.472 E.00103
; LINE_WIDTH: 0.181646
G1 X109.306 Y110.615 E.00195
G1 X109.329 Y110.793 F30000
; LINE_WIDTH: 0.119477
G1 F5578
G3 X109.399 Y110.378 I8.231 J1.19 E.00262
G1 X109.328 Y112.165 F30000
; LINE_WIDTH: 0.129193
G1 F5578
G1 X109.346 Y112.27 E.00075
; LINE_WIDTH: 0.161466
G1 X109.365 Y112.375 E.00103
; LINE_WIDTH: 0.148174
G2 X109.429 Y112.486 I.185 J-.032 E.00113
; LINE_WIDTH: 0.111401
G1 X109.487 Y112.572 E.00058
; LINE_WIDTH: 0.0973909
G1 X109.547 Y112.651 E.00044
G1 X109.608 Y122.209 F30000
; LINE_WIDTH: 0.0973912
M73 P87 R2
G1 F5578
G1 X109.544 Y122.285 E.00044
; LINE_WIDTH: 0.111416
G1 X109.476 Y122.375 E.00063
; LINE_WIDTH: 0.14728
G1 X109.403 Y122.472 E.00103
; LINE_WIDTH: 0.181654
G1 X109.306 Y122.615 E.00195
G1 X109.329 Y122.793 F30000
; LINE_WIDTH: 0.119468
G1 F5578
G3 X109.399 Y122.379 I8.314 J1.203 E.00262
G1 X109.328 Y124.165 F30000
; LINE_WIDTH: 0.129193
G1 F5578
G1 X109.346 Y124.27 E.00075
; LINE_WIDTH: 0.161466
G1 X109.365 Y124.375 E.00103
; LINE_WIDTH: 0.148177
G2 X109.429 Y124.486 I.185 J-.032 E.00113
; LINE_WIDTH: 0.111402
G1 X109.487 Y124.572 E.00058
; LINE_WIDTH: 0.0973911
G1 X109.547 Y124.651 E.00044
; WIPE_START
G1 F24000
G1 X109.487 Y124.572 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.6 I-1.143 J-.417 P1  F30000
G1 X105.199 Y136.343 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502906
G1 F5578
G1 X116.073 Y136.343 E.4076
; CHANGE_LAYER
; Z_HEIGHT: 7.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X114.073 Y136.343 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 50/58
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
G3 Z7.6 I.362 J1.162 P1  F30000
G1 X149.151 Y125.414 Z7.6
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5523
G1 X148.956 Y125.477 E.00677
G3 X148.245 Y121.441 I-.456 J-2 E.22057
G1 X148.449 Y121.426 E.00679
G3 X149.343 Y125.347 I.051 J2.051 E.18666
G1 X149.207 Y125.394 E.00478
G1 X149.108 Y125.016 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5523
G1 X149.028 Y125.05 E.00267
G3 X148.294 Y121.83 I-.528 J-1.573 E.17033
G1 X148.459 Y121.818 E.00509
G3 X149.329 Y124.914 I.041 J1.659 E.13476
G1 X149.163 Y124.991 E.00564
M204 S10000
; WIPE_START
G1 F24000
G1 X149.028 Y125.05 E-.0558
G1 X148.706 Y125.125 E-.12556
G1 X148.376 Y125.133 E-.12563
G1 X148.05 Y125.076 E-.12564
G1 X147.743 Y124.955 E-.12564
G1 X147.465 Y124.776 E-.12564
G1 X147.321 Y124.636 E-.0761
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.8 I1.197 J.217 P1  F30000
G1 X149.373 Y113.332 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5523
G1 X149.343 Y113.347 E.00111
G3 X148.245 Y109.441 I-.843 J-1.87 E.23414
G1 X148.449 Y109.426 E.00679
G3 X149.697 Y113.143 I.051 J2.051 E.17309
G1 X149.425 Y113.302 E.01045
G1 X149.185 Y112.99 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5523
G1 X149.182 Y112.989 E.00009
G3 X148.294 Y109.83 I-.682 J-1.513 E.17541
G1 X148.459 Y109.818 E.00509
G3 X149.468 Y112.824 I.041 J1.659 E.12967
G1 X149.237 Y112.96 E.00824
M204 S10000
; WIPE_START
G1 F24000
G1 X149.182 Y112.989 E-.02361
G1 X148.869 Y113.096 E-.12556
G1 X148.541 Y113.138 E-.12563
G1 X148.212 Y113.113 E-.12564
G1 X147.893 Y113.023 E-.12563
G1 X147.599 Y112.873 E-.12563
G1 X147.465 Y112.776 E-.0629
G1 X147.379 Y112.692 E-.0454
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.8 I-1.193 J.241 P1  F30000
G1 X151.29 Y132.08 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5523
G1 X153.455 Y132.08 E.07182
G3 X155.697 Y135.348 I.001 J2.402 E.1546
G3 X155.178 Y136.577 I-23.961 J-9.394 E.04425
G1 X143.122 Y136.577 E.39992
G2 X146.102 Y131.6 I-13.412 J-11.412 E.19331
G1 X146.102 Y103.08 E.94605
G1 X150.898 Y103.08 E.15909
G1 X150.898 Y132.08 E.96198
G1 X151.23 Y132.08 E.01102
G1 X151.29 Y131.688 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5523
G1 X153.46 Y131.688 E.06668
G3 X156.063 Y135.489 I-.004 J2.795 E.1664
G3 X155.434 Y136.969 I-28.856 J-11.381 E.0494
G1 X142.242 Y136.969 E.40536
G2 X145.71 Y131.52 I-12.385 J-11.71 E.19965
G1 X145.71 Y102.688 E.88594
G1 X151.29 Y102.688 E.17146
G1 X151.29 Y131.628 E.88925
M204 S10000
; WIPE_START
G1 F24000
G1 X153.289 Y131.683 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.8 I-.93 J.785 P1  F30000
G1 X153.981 Y132.502 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5523
G3 X155.239 Y133.465 I-.725 J2.249 E.05359
G1 X152.994 Y135.71 E.1053
G1 X153.062 Y135.71 E.00224
G1 X146.45 Y129.098 E.31015
G1 X146.45 Y126.902 E.07287
G1 X147.642 Y125.71 E.05592
G2 X150.195 Y125.167 I.858 J-2.237 E.09153
G1 X150.55 Y125.522 E.01666
G1 X150.55 Y130.478 E.16442
G1 X145.318 Y135.71 E.24542
G1 X145.386 Y135.71 E.00224
G1 X144.712 Y135.036 E.0316
G2 X145.543 Y133.637 I-14.833 J-9.752 E.054
G1 X144.024 Y136.143 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F5523
G1 X154.83 Y136.143 E.40501
; WIPE_START
G1 F24000
G1 X152.83 Y136.143 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.8 I1.199 J-.206 P1  F30000
G1 X150.453 Y122.305 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.126786
G1 F5523
G1 X150.571 Y122.469 E.00138
; LINE_WIDTH: 0.173117
G1 X150.629 Y122.555 E.0011
; LINE_WIDTH: 0.13607
G1 X150.654 Y122.686 E.00101
; LINE_WIDTH: 0.0969206
G1 X150.672 Y122.791 E.00047
G1 X150.601 Y124.577 F30000
; LINE_WIDTH: 0.11947
G1 F5523
G2 X150.671 Y124.163 I-8.256 J-1.619 E.00262
G1 X150.694 Y124.341 F30000
; LINE_WIDTH: 0.195634
G1 F5523
G1 X150.593 Y124.49 E.00224
; LINE_WIDTH: 0.179228
G1 X150.524 Y124.58 E.00126
; LINE_WIDTH: 0.129165
G1 X150.392 Y124.747 E.00149
; WIPE_START
G1 F24000
G1 X150.524 Y124.58 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.8 I-.022 J-1.217 P1  F30000
G1 X146.547 Y124.651 Z7.8
G1 Z7.4
G1 E.8 F1800
; LINE_WIDTH: 0.0973914
G1 F5523
G1 X146.487 Y124.572 E.00044
; LINE_WIDTH: 0.11141
G1 X146.429 Y124.486 E.00058
; LINE_WIDTH: 0.148185
G3 X146.365 Y124.375 I.121 J-.144 E.00113
; LINE_WIDTH: 0.16146
G1 X146.346 Y124.27 E.00103
; LINE_WIDTH: 0.12919
G1 X146.328 Y124.165 E.00075
G1 X146.399 Y122.379 F30000
; LINE_WIDTH: 0.119466
G1 F5523
G2 X146.329 Y122.793 I8.245 J1.618 E.00262
G1 X146.306 Y122.615 F30000
; LINE_WIDTH: 0.181635
G1 F5523
G1 X146.403 Y122.472 E.00195
; LINE_WIDTH: 0.147267
G1 X146.476 Y122.375 E.00103
; LINE_WIDTH: 0.111407
G1 X146.544 Y122.285 E.00063
; LINE_WIDTH: 0.0973912
G1 X146.608 Y122.209 E.00044
G1 X148.248 Y121.092 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5523
G2 X146.811 Y121.783 I.299 J2.463 E.05385
G1 X146.45 Y121.422 E.01692
G1 X146.45 Y119.226 E.07287
G1 X150.55 Y115.126 E.19231
G1 X150.55 Y117.846 E.09021
G1 X146.45 Y113.746 E.19231
G1 X146.45 Y113.161 E.01943
G1 X146.65 Y113.009 E.00833
G2 X147.252 Y113.518 I2.36 J-2.18 E.02619
G1 X146.547 Y112.651 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973908
G1 F5523
G1 X146.487 Y112.572 E.00044
; LINE_WIDTH: 0.111404
G1 X146.429 Y112.486 E.00058
; LINE_WIDTH: 0.148176
G3 X146.365 Y112.375 I.121 J-.144 E.00113
; LINE_WIDTH: 0.161456
G1 X146.346 Y112.27 E.00103
; LINE_WIDTH: 0.129188
G1 X146.328 Y112.165 E.00075
G1 X146.399 Y110.379 F30000
; LINE_WIDTH: 0.119466
G1 F5523
G2 X146.329 Y110.793 I8.246 J1.618 E.00262
G1 X146.306 Y110.615 F30000
; LINE_WIDTH: 0.181633
G1 F5523
G1 X146.403 Y110.472 E.00195
; LINE_WIDTH: 0.147266
G1 X146.476 Y110.375 E.00103
; LINE_WIDTH: 0.111407
G1 X146.544 Y110.285 E.00063
; LINE_WIDTH: 0.0973915
G1 X146.608 Y110.209 E.00044
G1 X147.311 Y109.391 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5523
G3 X148.882 Y109.118 I1.159 J2.003 E.05404
G1 X150.55 Y107.45 E.07821
G1 X150.55 Y109.795 E.07777
G1 X150.35 Y109.946 E.00833
G3 X146.45 Y106.071 I86.704 J-91.126 E.18239
G1 X146.45 Y103.874 E.07287
G1 X146.896 Y103.428 E.0209
G1 X148.524 Y103.428 E.05401
G1 X150.453 Y110.305 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.126779
G1 F5523
G1 X150.571 Y110.469 E.00138
; LINE_WIDTH: 0.173107
G1 X150.629 Y110.555 E.0011
; LINE_WIDTH: 0.136065
G1 X150.654 Y110.686 E.00101
; LINE_WIDTH: 0.0969205
G1 X150.672 Y110.791 E.00047
G1 X150.601 Y112.577 F30000
; LINE_WIDTH: 0.119473
G1 F5523
G2 X150.671 Y112.163 I-8.161 J-1.605 E.00262
G1 X150.694 Y112.341 F30000
; LINE_WIDTH: 0.195637
G1 F5523
G1 X150.593 Y112.49 E.00224
; LINE_WIDTH: 0.179221
G1 X150.524 Y112.58 E.00126
; LINE_WIDTH: 0.129162
G1 X150.392 Y112.747 E.00149
; WIPE_START
G1 F24000
G1 X150.524 Y112.58 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.8 I-.386 J-1.154 P1  F30000
G1 X112.151 Y125.414 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5523
G1 X111.956 Y125.477 E.00677
G3 X111.245 Y121.441 I-.456 J-2 E.22057
G1 X111.449 Y121.426 E.00679
G3 X112.343 Y125.347 I.051 J2.051 E.18666
G1 X112.207 Y125.394 E.00478
G1 X112.108 Y125.016 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5523
G1 X112.028 Y125.05 E.00267
G3 X111.294 Y121.83 I-.528 J-1.573 E.17033
G1 X111.459 Y121.818 E.00509
G3 X112.329 Y124.914 I.041 J1.659 E.13476
G1 X112.163 Y124.991 E.00564
M204 S10000
; WIPE_START
G1 F24000
G1 X112.028 Y125.05 E-.0558
G1 X111.706 Y125.125 E-.12556
G1 X111.376 Y125.133 E-.12563
G1 X111.05 Y125.076 E-.12564
G1 X110.743 Y124.955 E-.12564
G1 X110.465 Y124.776 E-.12564
G1 X110.321 Y124.636 E-.0761
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.8 I1.207 J.152 P1  F30000
G1 X112.218 Y109.558 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5523
G1 X112.25 Y109.567 E.00111
G3 X111.245 Y109.441 I-.75 J1.91 E.39364
G1 X111.449 Y109.426 E.00679
G3 X111.856 Y109.456 I.051 J2.051 E.01358
G1 X112.16 Y109.542 E.01046
G1 X112.107 Y109.932 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5523
G3 X111.294 Y109.83 I-.607 J1.544 E.2949
G1 X111.459 Y109.818 E.00509
G3 X112.05 Y109.912 I.041 J1.659 E.01851
M204 S10000
; WIPE_START
G1 F24000
G1 X112.401 Y110.083 E-.14825
G1 X112.659 Y110.289 E-.12564
G1 X112.872 Y110.543 E-.12563
G1 X113.03 Y110.833 E-.12564
G1 X113.127 Y111.149 E-.12564
G1 X113.159 Y111.433 E-.10854
G1 X113.159 Y111.434 E-.00066
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.8 I-1.194 J-.235 P1  F30000
G1 X109.102 Y132.08 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5523
G1 X109.102 Y103.08 E.96198
G1 X113.898 Y103.08 E.15909
G1 X113.898 Y131.6 E.94605
G2 X116.876 Y136.577 I16.364 J-6.411 E.19328
G1 X104.827 Y136.577 E.39968
G1 X104.301 Y135.343 E.04451
G3 X106.545 Y132.08 I2.242 J-.861 E.1544
G1 X109.042 Y132.08 E.08284
G1 X108.71 Y131.688 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5523
G1 X108.71 Y102.688 E.89109
G1 X114.29 Y102.688 E.17146
G1 X114.29 Y131.52 E.88594
G2 X117.756 Y136.969 I15.939 J-6.314 E.19962
G1 X104.568 Y136.969 E.40524
G1 X103.936 Y135.487 E.04949
G3 X106.54 Y131.688 I2.608 J-1.005 E.16634
G1 X108.65 Y131.688 E.06484
M204 S10000
; WIPE_START
G1 F24000
G1 X108.654 Y129.688 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.8 I-.888 J-.832 P1  F30000
G1 X106.019 Y132.502 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5523
G2 X104.762 Y133.466 I.686 J2.197 E.05364
G1 X107.006 Y135.71 E.10528
G1 X106.938 Y135.71 E.00224
G1 X113.55 Y129.098 E.31015
G1 X113.55 Y126.902 E.07287
G1 X112.361 Y125.713 E.05578
G3 X109.806 Y125.166 I-.855 J-2.247 E.0916
G1 X109.45 Y125.522 E.0167
G1 X109.45 Y130.478 E.16442
G1 X114.682 Y135.71 E.24542
G1 X114.614 Y135.71 E.00224
G1 X115.288 Y135.036 E.0316
G3 X114.457 Y133.637 I14.832 J-9.752 E.054
G1 X113.392 Y124.747 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.129165
G1 F5523
G1 X113.524 Y124.58 E.00149
; LINE_WIDTH: 0.179228
G1 X113.593 Y124.49 E.00126
; LINE_WIDTH: 0.195633
G1 X113.694 Y124.341 E.00224
G1 X113.671 Y124.163 F30000
; LINE_WIDTH: 0.119466
G1 F5523
G3 X113.601 Y124.577 I-8.316 J-1.203 E.00262
G1 X113.672 Y122.791 F30000
; LINE_WIDTH: 0.0969206
G1 F5523
G1 X113.654 Y122.686 E.00047
; LINE_WIDTH: 0.136068
G1 X113.629 Y122.555 E.00101
; LINE_WIDTH: 0.173113
G1 X113.571 Y122.469 E.0011
; LINE_WIDTH: 0.126784
G1 X113.453 Y122.305 E.00138
G1 X111.751 Y121.094 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5523
G3 X113.188 Y121.784 I-.187 J2.232 E.05407
G1 X113.55 Y121.422 E.01697
G1 X113.55 Y119.226 E.07287
G1 X109.45 Y115.126 E.19231
G1 X109.45 Y117.846 E.09021
G1 X113.55 Y113.746 E.19231
G1 X113.55 Y113.212 E.01772
G1 X113.492 Y113.285 E.00308
G1 X113.263 Y113.093 E.00991
G3 X112.726 Y113.541 I-1.376 J-1.104 E.02334
G1 X113.392 Y112.747 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.129161
G1 F5523
G1 X113.524 Y112.58 E.00149
; LINE_WIDTH: 0.179219
G1 X113.593 Y112.49 E.00126
; LINE_WIDTH: 0.195633
G1 X113.694 Y112.341 E.00224
G1 X113.671 Y112.163 F30000
; LINE_WIDTH: 0.11947
G1 F5523
G3 X113.601 Y112.577 I-8.322 J-1.204 E.00262
G1 X113.672 Y110.791 F30000
; LINE_WIDTH: 0.0969205
G1 F5523
G1 X113.654 Y110.686 E.00047
; LINE_WIDTH: 0.136063
G1 X113.629 Y110.555 E.00101
; LINE_WIDTH: 0.173105
G1 X113.571 Y110.469 E.0011
; LINE_WIDTH: 0.126777
G1 X113.453 Y110.305 E.00138
G1 X112.683 Y109.396 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5523
G2 X111.114 Y109.114 I-1.198 J2.158 E.05385
G1 X109.45 Y107.45 E.07803
G1 X109.45 Y109.777 E.07717
G1 X109.528 Y109.687 E.00393
G1 X109.737 Y109.863 E.00907
G3 X110.03 Y109.59 I.822 J.589 E.01338
G1 X113.55 Y106.071 E.16509
G1 X113.55 Y103.874 E.07287
G1 X113.104 Y103.428 E.0209
G1 X111.476 Y103.428 E.05401
G1 X109.608 Y110.209 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973916
G1 F5523
G1 X109.544 Y110.285 E.00044
; LINE_WIDTH: 0.111409
G1 X109.476 Y110.375 E.00063
; LINE_WIDTH: 0.147268
G1 X109.403 Y110.472 E.00103
; LINE_WIDTH: 0.181635
G1 X109.306 Y110.615 E.00195
G1 X109.329 Y110.793 F30000
; LINE_WIDTH: 0.11947
G1 F5523
G3 X109.399 Y110.379 I8.327 J1.205 E.00262
G1 X109.328 Y112.165 F30000
; LINE_WIDTH: 0.12919
G1 F5523
G1 X109.346 Y112.27 E.00075
; LINE_WIDTH: 0.16146
G1 X109.365 Y112.375 E.00103
; LINE_WIDTH: 0.148181
G2 X109.429 Y112.486 I.185 J-.032 E.00113
; LINE_WIDTH: 0.111408
G1 X109.487 Y112.572 E.00058
; LINE_WIDTH: 0.0973911
G1 X109.547 Y112.651 E.00044
G1 X109.608 Y122.209 F30000
; LINE_WIDTH: 0.0973912
G1 F5523
G1 X109.544 Y122.285 E.00044
; LINE_WIDTH: 0.111407
G1 X109.476 Y122.375 E.00063
; LINE_WIDTH: 0.147267
G1 X109.403 Y122.472 E.00103
; LINE_WIDTH: 0.181637
G1 X109.306 Y122.615 E.00195
G1 X109.329 Y122.793 F30000
; LINE_WIDTH: 0.11947
G1 F5523
G3 X109.399 Y122.379 I8.326 J1.205 E.00262
G1 X109.328 Y124.165 F30000
; LINE_WIDTH: 0.129192
G1 F5523
G1 X109.346 Y124.27 E.00075
; LINE_WIDTH: 0.161464
G1 X109.365 Y124.375 E.00103
; LINE_WIDTH: 0.148188
G2 X109.429 Y124.486 I.185 J-.032 E.00113
; LINE_WIDTH: 0.111414
G1 X109.487 Y124.572 E.00058
; LINE_WIDTH: 0.0973916
G1 X109.547 Y124.651 E.00044
; WIPE_START
G1 F24000
G1 X109.487 Y124.572 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.8 I-1.138 J-.43 P1  F30000
G1 X105.114 Y136.143 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F5523
G1 X115.912 Y136.143 E.40474
; CHANGE_LAYER
; Z_HEIGHT: 7.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X113.912 Y136.143 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 51/58
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
G3 Z7.8 I.354 J1.164 P1  F30000
G1 X149.184 Y125.41 Z7.8
M73 P88 R2
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5566
G1 X149.153 Y125.421 E.00111
G3 X148.245 Y121.441 I-.653 J-1.945 E.22736
G1 X148.449 Y121.426 E.00679
G3 X149.525 Y125.254 I.051 J2.051 E.17988
G1 X149.239 Y125.385 E.01045
G1 X149.142 Y125.001 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5566
G1 X149.028 Y125.05 E.0038
G3 X148.294 Y121.83 I-.528 J-1.573 E.17033
G1 X148.459 Y121.818 E.00509
G3 X149.329 Y124.914 I.041 J1.659 E.13476
G1 X149.196 Y124.976 E.0045
M204 S10000
; WIPE_START
G1 F24000
G1 X149.028 Y125.05 E-.06978
G1 X148.706 Y125.125 E-.12556
G1 X148.376 Y125.133 E-.12562
G1 X148.05 Y125.076 E-.12564
G1 X147.743 Y124.955 E-.12563
G1 X147.465 Y124.776 E-.12564
G1 X147.348 Y124.662 E-.06213
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8 I1.199 J.208 P1  F30000
G1 X149.313 Y113.36 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5566
G1 X148.956 Y113.477 E.01244
G3 X148.245 Y109.441 I-.456 J-2 E.22058
G1 X148.449 Y109.426 E.00679
G3 X149.367 Y113.336 I.051 J2.051 E.18578
G1 X149.182 Y112.989 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5566
G3 X148.294 Y109.83 I-.682 J-1.513 E.17541
G1 X148.459 Y109.818 E.00509
G3 X149.236 Y112.964 I.041 J1.659 E.138
M204 S10000
; WIPE_START
G1 F24000
G1 X148.869 Y113.096 E-.14821
G1 X148.541 Y113.138 E-.12563
G1 X148.376 Y113.133 E-.06289
G1 X148.05 Y113.076 E-.12564
G1 X147.743 Y112.955 E-.12563
G1 X147.465 Y112.776 E-.12563
G1 X147.378 Y112.691 E-.04636
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8 I-1.197 J.222 P1  F30000
G1 X150.898 Y131.688 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5566
G1 X150.898 Y132.08 E.01301
G1 X153.455 Y132.08 E.08483
G3 X155.697 Y135.348 I.006 J2.399 E.15469
G3 X155.267 Y136.377 I-20.06 J-7.775 E.03699
G1 X143.295 Y136.377 E.39714
G2 X146.102 Y131.6 I-13.667 J-11.244 E.18455
G1 X146.102 Y103.08 E.94605
G1 X150.898 Y103.08 E.15909
G1 X150.898 Y131.628 E.94699
G1 X151.29 Y131.688 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5566
G1 X153.46 Y131.688 E.06668
G3 X156.063 Y135.489 I.001 J2.791 E.1665
G3 X155.524 Y136.769 I-24.954 J-9.762 E.04268
G1 X142.429 Y136.769 E.40236
G2 X145.71 Y131.52 I-12.487 J-11.457 E.19127
G1 X145.71 Y102.688 E.88594
G1 X151.29 Y102.688 E.17146
G1 X151.29 Y131.628 E.88925
M204 S10000
; WIPE_START
G1 F24000
G1 X153.289 Y131.683 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8 I-.926 J.789 P1  F30000
G1 X153.984 Y132.499 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5566
G3 X155.234 Y133.469 I-.546 J1.994 E.05388
G1 X153.194 Y135.51 E.09571
G1 X152.862 Y135.51 E.01103
G1 X146.45 Y129.098 E.30077
G1 X146.45 Y126.902 E.07287
G1 X147.642 Y125.71 E.05592
G2 X150.195 Y125.167 I.858 J-2.237 E.09153
G1 X150.55 Y125.522 E.01666
G1 X150.55 Y130.478 E.16442
G1 X145.518 Y135.51 E.23604
G1 X145.186 Y135.51 E.01103
G1 X144.712 Y135.036 E.02222
G2 X145.543 Y133.637 I-14.813 J-9.74 E.054
G1 X144.18 Y135.943 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F5566
G1 X154.918 Y135.943 E.40253
; WIPE_START
G1 F24000
G1 X152.918 Y135.943 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8 I1.187 J-.268 P1  F30000
G1 X150.392 Y124.747 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.129165
G1 F5566
G1 X150.524 Y124.58 E.00149
; LINE_WIDTH: 0.179228
G1 X150.593 Y124.49 E.00126
; LINE_WIDTH: 0.195632
G1 X150.694 Y124.341 E.00224
G1 X150.671 Y124.163 F30000
; LINE_WIDTH: 0.119468
G1 F5566
G3 X150.601 Y124.577 I-8.314 J-1.203 E.00262
G1 X150.672 Y122.791 F30000
; LINE_WIDTH: 0.0969207
G1 F5566
G1 X150.654 Y122.686 E.00047
; LINE_WIDTH: 0.136067
G1 X150.629 Y122.555 E.00101
; LINE_WIDTH: 0.17311
G1 X150.571 Y122.469 E.0011
; LINE_WIDTH: 0.126783
G1 X150.453 Y122.305 E.00138
G1 X148.248 Y121.092 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5566
G2 X146.811 Y121.783 I.299 J2.463 E.05385
G1 X146.45 Y121.422 E.01692
G1 X146.45 Y119.226 E.07287
G1 X150.55 Y115.126 E.19231
G1 X150.55 Y117.846 E.09021
G1 X146.45 Y113.746 E.19231
G1 X146.45 Y113.161 E.01943
G1 X146.65 Y113.009 E.00833
G2 X147.252 Y113.518 I2.36 J-2.18 E.02619
G1 X146.547 Y112.651 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973902
G1 F5566
G1 X146.487 Y112.572 E.00044
; LINE_WIDTH: 0.111389
G1 X146.429 Y112.486 E.00058
; LINE_WIDTH: 0.148165
G3 X146.365 Y112.375 I.121 J-.144 E.00113
; LINE_WIDTH: 0.161456
G1 X146.346 Y112.27 E.00103
; LINE_WIDTH: 0.129189
G1 X146.328 Y112.165 E.00075
G1 X146.329 Y110.793 F30000
; LINE_WIDTH: 0.119473
G1 F5566
G3 X146.399 Y110.378 I8.224 J1.189 E.00262
G1 X146.476 Y110.375 F30000
; LINE_WIDTH: 0.147281
G1 F5566
G1 X146.403 Y110.472 E.00103
; LINE_WIDTH: 0.181656
G1 X146.306 Y110.615 E.00195
G1 X146.476 Y110.375 F30000
; LINE_WIDTH: 0.111414
G1 F5566
G1 X146.544 Y110.285 E.00063
; LINE_WIDTH: 0.0973921
G1 X146.608 Y110.209 E.00044
G1 X147.75 Y109.197 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5566
G1 X148.087 Y109.12 E.01147
G1 X148.148 Y108.775 E.01162
G1 X148.501 Y108.528 E.0143
G1 X148.994 Y108.615 E.01663
G1 X146.45 Y106.071 E.11935
G1 X146.45 Y103.874 E.07287
G1 X146.896 Y103.428 E.0209
G1 X150.55 Y103.428 E.1212
G1 X150.55 Y107.45 E.13342
G1 X149.257 Y108.743 E.06066
G1 X149.242 Y108.862 E.00396
G1 X149.944 Y109.564 E.03296
G3 X150.35 Y109.946 I-3.31 J3.918 E.01848
G1 X150.55 Y109.795 E.00833
G1 X150.55 Y108.976 E.02716
G1 X150.453 Y110.305 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.126777
G1 F5566
G1 X150.571 Y110.469 E.00138
; LINE_WIDTH: 0.173104
G1 X150.629 Y110.555 E.0011
; LINE_WIDTH: 0.136064
G1 X150.654 Y110.686 E.00101
; LINE_WIDTH: 0.0969206
G1 X150.672 Y110.791 E.00047
G1 X150.671 Y112.163 F30000
; LINE_WIDTH: 0.119468
G1 F5566
G3 X150.601 Y112.577 I-8.314 J-1.203 E.00262
G1 X150.524 Y112.58 F30000
; LINE_WIDTH: 0.129166
G1 F5566
G1 X150.392 Y112.747 E.00149
G1 X150.524 Y112.58 F30000
; LINE_WIDTH: 0.179235
G1 F5566
G1 X150.593 Y112.49 E.00126
; LINE_WIDTH: 0.195631
G1 X150.694 Y112.341 E.00224
; WIPE_START
G1 F24000
G1 X150.593 Y112.49 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8 I1.058 J-.602 P1  F30000
G1 X148.604 Y108.992 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515224
G1 F5566
G1 X148.728 Y109.008 E.00482
; WIPE_START
G1 F24000
G1 X148.604 Y108.992 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8 I-1.203 J-.182 P1  F30000
G1 X146.608 Y122.209 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973915
G1 F5566
G1 X146.544 Y122.285 E.00044
; LINE_WIDTH: 0.111407
G1 X146.476 Y122.375 E.00063
; LINE_WIDTH: 0.147272
G1 X146.403 Y122.472 E.00103
; LINE_WIDTH: 0.181648
G1 X146.306 Y122.615 E.00195
G1 X146.329 Y122.793 F30000
; LINE_WIDTH: 0.119474
G1 F5566
G3 X146.399 Y122.379 I8.307 J1.202 E.00262
G1 X146.328 Y124.165 F30000
; LINE_WIDTH: 0.129186
G1 F5566
G1 X146.346 Y124.27 E.00075
; LINE_WIDTH: 0.161452
G1 X146.365 Y124.375 E.00103
; LINE_WIDTH: 0.148187
G2 X146.429 Y124.486 I.185 J-.032 E.00113
; LINE_WIDTH: 0.11141
G1 X146.487 Y124.572 E.00058
; LINE_WIDTH: 0.0973915
G1 X146.547 Y124.651 E.00044
; WIPE_START
G1 F24000
G1 X146.487 Y124.572 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8 I-.03 J-1.217 P1  F30000
G1 X112.184 Y125.41 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5566
G1 X112.153 Y125.421 E.00111
G3 X111.245 Y121.441 I-.653 J-1.945 E.22736
G1 X111.449 Y121.426 E.00679
G3 X112.525 Y125.254 I.051 J2.051 E.17988
G1 X112.239 Y125.385 E.01045
G1 X112.142 Y125.001 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5566
G1 X112.028 Y125.05 E.0038
G3 X111.294 Y121.83 I-.528 J-1.573 E.17033
G1 X111.459 Y121.818 E.00509
G3 X112.329 Y124.914 I.041 J1.659 E.13476
G1 X112.196 Y124.976 E.0045
M204 S10000
; WIPE_START
G1 F24000
G1 X112.028 Y125.05 E-.06978
G1 X111.706 Y125.125 E-.12556
G1 X111.376 Y125.133 E-.12562
G1 X111.05 Y125.076 E-.12564
G1 X110.743 Y124.955 E-.12563
G1 X110.465 Y124.776 E-.12564
G1 X110.348 Y124.662 E-.06212
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8 I1.208 J.15 P1  F30000
G1 X112.218 Y109.558 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5566
G1 X112.25 Y109.567 E.00111
G3 X111.245 Y109.441 I-.75 J1.91 E.39364
G1 X111.449 Y109.426 E.00679
G3 X111.856 Y109.456 I.051 J2.051 E.01358
G1 X112.16 Y109.542 E.01046
G1 X112.107 Y109.932 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5566
G3 X111.294 Y109.83 I-.607 J1.544 E.2949
G1 X111.459 Y109.818 E.00509
G3 X112.05 Y109.912 I.041 J1.659 E.01851
M204 S10000
; WIPE_START
G1 F24000
G1 X112.401 Y110.083 E-.14826
G1 X112.659 Y110.289 E-.12564
G1 X112.872 Y110.543 E-.12564
G1 X113.03 Y110.833 E-.12563
G1 X113.127 Y111.149 E-.12563
G1 X113.159 Y111.435 E-.10921
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8 I-1.194 J-.235 P1  F30000
G1 X109.102 Y132.08 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5566
G1 X109.102 Y103.08 E.96198
G1 X113.898 Y103.08 E.15909
G1 X113.898 Y131.6 E.94605
G2 X116.713 Y136.377 I16.327 J-6.404 E.18471
G1 X104.742 Y136.377 E.39711
G1 X104.301 Y135.342 E.0373
G3 X106.545 Y132.08 I2.242 J-.861 E.1544
G1 X109.042 Y132.08 E.08284
G1 X108.71 Y131.688 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5566
G1 X108.71 Y102.688 E.89109
G1 X114.29 Y102.688 E.17146
G1 X114.29 Y131.52 E.88594
G2 X117.575 Y136.769 I15.718 J-6.187 E.19135
G1 X104.483 Y136.769 E.4023
G1 X103.936 Y135.487 E.04281
G3 X106.54 Y131.688 I2.608 J-1.005 E.16634
G1 X108.65 Y131.688 E.06484
M204 S10000
; WIPE_START
G1 F24000
G1 X108.654 Y129.688 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8 I-.888 J-.833 P1  F30000
G1 X106.016 Y132.5 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5566
G2 X104.766 Y133.47 I.55 J2.001 E.05384
G1 X106.806 Y135.51 E.09571
G1 X107.138 Y135.51 E.01103
G1 X113.55 Y129.098 E.30077
G1 X113.55 Y126.902 E.07287
G1 X112.361 Y125.713 E.05578
G3 X109.806 Y125.166 I-.855 J-2.247 E.0916
G1 X109.45 Y125.522 E.0167
G1 X109.45 Y130.478 E.16442
G1 X114.482 Y135.51 E.23604
G1 X114.814 Y135.51 E.01103
G1 X115.288 Y135.036 E.02222
G3 X114.457 Y133.637 I14.813 J-9.74 E.054
G1 X113.392 Y124.747 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.129164
G1 F5566
G1 X113.524 Y124.58 E.00149
; LINE_WIDTH: 0.179227
G1 X113.593 Y124.49 E.00126
; LINE_WIDTH: 0.195631
G1 X113.694 Y124.341 E.00224
G1 X113.671 Y124.163 F30000
; LINE_WIDTH: 0.119466
G1 F5566
G3 X113.601 Y124.577 I-8.325 J-1.205 E.00262
G1 X113.672 Y122.791 F30000
; LINE_WIDTH: 0.0969207
G1 F5566
G1 X113.654 Y122.686 E.00047
; LINE_WIDTH: 0.136067
G1 X113.629 Y122.555 E.00101
; LINE_WIDTH: 0.173114
G1 X113.571 Y122.469 E.0011
; LINE_WIDTH: 0.126785
G1 X113.453 Y122.305 E.00138
G1 X111.751 Y121.094 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5566
G3 X113.188 Y121.784 I-.187 J2.232 E.05407
G1 X113.55 Y121.422 E.01697
G1 X113.55 Y119.226 E.07287
G1 X109.45 Y115.126 E.19231
G1 X109.45 Y117.846 E.09021
G1 X113.55 Y113.746 E.19231
G1 X113.55 Y113.212 E.01772
G1 X113.492 Y113.285 E.00308
G1 X113.263 Y113.093 E.00991
G3 X112.726 Y113.541 I-1.376 J-1.104 E.02334
G1 X113.392 Y112.747 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.129166
G1 F5566
G1 X113.524 Y112.58 E.00149
; LINE_WIDTH: 0.179234
G1 X113.593 Y112.49 E.00126
; LINE_WIDTH: 0.195627
G1 X113.694 Y112.341 E.00224
G1 X113.671 Y112.163 F30000
; LINE_WIDTH: 0.119463
G1 F5566
G3 X113.601 Y112.577 I-8.307 J-1.202 E.00262
G1 X113.672 Y110.791 F30000
; LINE_WIDTH: 0.0969206
G1 F5566
G1 X113.654 Y110.686 E.00047
; LINE_WIDTH: 0.136061
G1 X113.629 Y110.555 E.00101
; LINE_WIDTH: 0.1731
G1 X113.571 Y110.469 E.0011
; LINE_WIDTH: 0.126775
G1 X113.453 Y110.305 E.00138
G1 X111.604 Y108.992 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515224
G1 F5566
G1 X111.728 Y109.008 E.00482
G1 X110.924 Y109.157 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5566
G1 X111.092 Y109.092 E.00598
G1 X109.45 Y107.45 E.077
G1 X109.45 Y109.777 E.07717
G1 X109.528 Y109.687 E.00393
G1 X109.737 Y109.863 E.00907
G3 X110.031 Y109.59 I.822 J.589 E.01338
G1 X113.55 Y106.071 E.16509
G1 X113.55 Y103.874 E.07287
G1 X113.104 Y103.428 E.0209
G1 X111.476 Y103.428 E.05401
G1 X109.608 Y110.209 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973922
G1 F5566
G1 X109.544 Y110.285 E.00044
; LINE_WIDTH: 0.111416
G1 X109.476 Y110.375 E.00063
; LINE_WIDTH: 0.147283
G1 X109.403 Y110.472 E.00103
; LINE_WIDTH: 0.181658
G1 X109.306 Y110.615 E.00195
G1 X109.329 Y110.793 F30000
; LINE_WIDTH: 0.119477
G1 F5566
G3 X109.399 Y110.378 I8.232 J1.19 E.00262
G1 X109.328 Y112.165 F30000
; LINE_WIDTH: 0.129191
G1 F5566
G1 X109.346 Y112.27 E.00075
; LINE_WIDTH: 0.16146
G1 X109.365 Y112.375 E.00103
; LINE_WIDTH: 0.14817
G2 X109.429 Y112.486 I.185 J-.032 E.00113
; LINE_WIDTH: 0.111393
G1 X109.487 Y112.572 E.00058
; LINE_WIDTH: 0.0973904
G1 X109.547 Y112.651 E.00044
G1 X109.608 Y122.209 F30000
; LINE_WIDTH: 0.0973915
G1 F5566
G1 X109.544 Y122.285 E.00044
; LINE_WIDTH: 0.111408
G1 X109.476 Y122.375 E.00063
; LINE_WIDTH: 0.147275
G1 X109.403 Y122.472 E.00103
; LINE_WIDTH: 0.181651
G1 X109.306 Y122.615 E.00195
G1 X109.329 Y122.793 F30000
; LINE_WIDTH: 0.119476
G1 F5566
G3 X109.399 Y122.379 I8.307 J1.202 E.00262
G1 X109.328 Y124.165 F30000
; LINE_WIDTH: 0.129188
G1 F5566
G1 X109.346 Y124.27 E.00075
; LINE_WIDTH: 0.161456
G1 X109.365 Y124.375 E.00103
; LINE_WIDTH: 0.148189
G2 X109.429 Y124.486 I.185 J-.032 E.00113
; LINE_WIDTH: 0.111411
G1 X109.487 Y124.572 E.00058
; LINE_WIDTH: 0.0973916
G1 X109.547 Y124.651 E.00044
; WIPE_START
G1 F24000
G1 X109.487 Y124.572 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8 I-1.133 J-.444 P1  F30000
G1 X105.028 Y135.943 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502906
G1 F5566
G1 X115.762 Y135.943 E.40233
; CHANGE_LAYER
; Z_HEIGHT: 7.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X113.762 Y135.943 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 52/58
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
G3 Z8 I.348 J1.166 P1  F30000
G1 X149.34 Y125.34 Z8
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6669
G1 X149.153 Y125.421 E.00677
G3 X148.245 Y121.441 I-.653 J-1.945 E.22736
G1 X148.449 Y121.426 E.00679
G3 X149.525 Y125.254 I.051 J2.051 E.17988
G1 X149.395 Y125.314 E.00478
G1 X149.19 Y124.987 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6669
G1 X149.182 Y124.989 E.00026
G3 X148.294 Y121.83 I-.682 J-1.513 E.17541
G1 X148.459 Y121.818 E.00509
G3 X149.468 Y124.824 I.041 J1.659 E.12968
G1 X149.242 Y124.957 E.00806
M204 S10000
; WIPE_START
G1 F24000
G1 X149.182 Y124.989 E-.02588
G1 X148.869 Y125.096 E-.12557
G1 X148.541 Y125.138 E-.12563
G1 X148.212 Y125.113 E-.12564
G1 X147.893 Y125.023 E-.12564
G1 X147.599 Y124.873 E-.12563
M73 P89 R2
G1 X147.381 Y124.699 E-.10602
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.2 I1.198 J.213 P1  F30000
G1 X149.405 Y113.317 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6669
G1 X149.056 Y113.454 E.01245
G3 X148.252 Y109.44 I-.552 J-1.976 E.22405
G1 X148.449 Y109.426 E.00654
G3 X149.46 Y113.293 I.055 J2.051 E.18268
G1 X149.186 Y112.983 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6669
G1 X148.95 Y113.076 E.00779
G3 X148.296 Y109.83 I-.448 J-1.598 E.16786
G1 X148.459 Y109.818 E.00501
G3 X149.257 Y112.955 I.043 J1.659 E.13742
G1 X149.241 Y112.961 E.00053
M204 S10000
; WIPE_START
G1 F24000
G1 X148.95 Y113.076 E-.11908
G1 X148.627 Y113.133 E-.12462
G1 X148.376 Y113.133 E-.09528
G1 X148.05 Y113.076 E-.12564
G1 X147.743 Y112.955 E-.12563
G1 X147.465 Y112.776 E-.12563
G1 X147.382 Y112.695 E-.04412
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.2 I-1.193 J.241 P1  F30000
G1 X151.29 Y132.08 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6669
G1 X153.455 Y132.08 E.07182
G3 X155.695 Y135.352 I.006 J2.399 E.15483
G3 X155.356 Y136.177 I-16.082 J-6.127 E.02959
G1 X143.455 Y136.177 E.3948
G2 X146.102 Y131.6 I-13.845 J-11.061 E.17605
G1 X146.102 Y103.08 E.94605
G1 X150.898 Y103.08 E.15909
G1 X150.898 Y132.08 E.96198
G1 X151.23 Y132.08 E.01102
G1 X151.29 Y131.688 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6669
G1 X153.46 Y131.688 E.06668
G3 X156.062 Y135.491 I.001 J2.791 E.16655
G3 X155.613 Y136.569 I-21.026 J-8.134 E.0359
G1 X142.609 Y136.569 E.39956
G2 X145.71 Y131.52 I-12.841 J-11.363 E.18297
G1 X145.71 Y102.688 E.88594
G1 X151.29 Y102.688 E.17146
G1 X151.29 Y131.628 E.88925
M204 S10000
; WIPE_START
G1 F24000
G1 X153.289 Y131.683 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.2 I-1.157 J.376 P1  F30000
G1 X153.67 Y132.853 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6669
G3 X154.937 Y133.767 I-.236 J1.663 E.0539
G1 X154.083 Y134.621 E.04003
G1 X151.973 Y134.621 E.07
G1 X146.857 Y129.505 E.23997
G1 X146.857 Y126.495 E.09988
G1 X147.328 Y126.024 E.02209
G2 X148.85 Y126.268 I1.224 J-2.765 E.05168
G1 X150.143 Y125.973 E.04399
G1 X150.143 Y130.885 E.16295
G1 X146.406 Y134.621 E.17527
G1 X145.478 Y134.621 E.03078
G3 X145.808 Y134.003 I97.596 J51.655 E.02323
G1 X144.323 Y135.743 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50291
G1 F6669
G1 X155.006 Y135.743 E.40043
; WIPE_START
G1 F24000
G1 X153.006 Y135.743 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.2 I1.199 J-.209 P1  F30000
G1 X150.55 Y121.654 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6669
G1 X150.55 Y113.242 E.27904
G1 X149.172 Y113.783 E.0491
G3 X147.423 Y113.624 I-.657 J-2.467 E.05947
G1 X146.45 Y113.242 E.03465
G1 X146.45 Y121.493 E.27371
G1 X147.86 Y121.172 E.04795
G3 X149.308 Y121.227 I.636 J2.35 E.04883
G1 X150.55 Y121.714 E.04423
G1 X150.453 Y122.305 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.126786
G1 F6669
G1 X150.571 Y122.469 E.00138
; LINE_WIDTH: 0.173116
G1 X150.629 Y122.555 E.0011
; LINE_WIDTH: 0.13607
G1 X150.654 Y122.686 E.00101
; LINE_WIDTH: 0.0969208
G1 X150.672 Y122.791 E.00047
G1 X150.595 Y124.582 F30000
; LINE_WIDTH: 0.143973
G1 F6669
G2 X150.672 Y124.165 I-12.39 J-2.49 E.00349
G1 X150.694 Y124.342 F30000
; LINE_WIDTH: 0.195652
G1 F6669
G1 X150.59 Y124.493 E.00228
; LINE_WIDTH: 0.177988
G1 X150.523 Y124.582 E.00123
; LINE_WIDTH: 0.128678
G1 X150.392 Y124.747 E.00147
G1 X147.423 Y125.624 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6669
G2 X148.799 Y125.862 I1.124 J-2.399 E.04688
G1 X150.55 Y125.462 E.05957
G1 X150.55 Y132.428 E.23107
G3 X153.861 Y132.474 I.329 J96.851 E.10987
G3 X155.426 Y135.028 I-.41 J2.007 E.11142
G1 X144.8 Y135.029 E.35246
G2 X145.731 Y133.282 I-254.829 J-136.895 E.06563
G2 X146.45 Y131.67 I-16.929 J-8.524 E.05859
G1 X146.45 Y125.242 E.21324
G1 X147.367 Y125.602 E.03266
G1 X146.547 Y124.651 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973908
G1 F6669
G1 X146.487 Y124.572 E.00044
; LINE_WIDTH: 0.111398
G1 X146.429 Y124.486 E.00058
; LINE_WIDTH: 0.148173
G3 X146.365 Y124.375 I.121 J-.144 E.00113
; LINE_WIDTH: 0.161458
G1 X146.346 Y124.27 E.00103
; LINE_WIDTH: 0.129189
G1 X146.328 Y124.165 E.00075
G1 X146.405 Y122.373 F30000
; LINE_WIDTH: 0.143964
G1 F6669
G2 X146.328 Y122.791 I12.471 J2.504 E.00349
G1 X146.306 Y122.613 F30000
; LINE_WIDTH: 0.180108
G1 F6669
G1 X146.406 Y122.468 E.00198
; LINE_WIDTH: 0.146449
G1 X146.477 Y122.374 E.00099
; LINE_WIDTH: 0.111416
G1 X146.544 Y122.285 E.00062
; LINE_WIDTH: 0.0973917
G1 X146.608 Y122.209 E.00044
G1 X146.857 Y120.447 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6669
G1 X146.857 Y118.819 E.05401
G1 X150.143 Y115.533 E.15411
G1 X150.143 Y117.439 E.0632
G1 X146.857 Y114.154 E.15411
G1 X146.857 Y113.839 E.01044
G1 X147.274 Y114.002 E.01485
G2 X148.1 Y114.248 I1.022 J-1.92 E.02878
G1 X146.547 Y112.651 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973915
G1 F6669
G1 X146.487 Y112.572 E.00044
; LINE_WIDTH: 0.111397
G1 X146.429 Y112.486 E.00058
; LINE_WIDTH: 0.148168
G3 X146.365 Y112.375 I.121 J-.144 E.00113
; LINE_WIDTH: 0.161456
G1 X146.346 Y112.27 E.00103
; LINE_WIDTH: 0.129188
G1 X146.328 Y112.165 E.00075
G1 X146.328 Y110.791 F30000
; LINE_WIDTH: 0.129187
G1 F6669
G1 X146.346 Y110.686 E.00075
; LINE_WIDTH: 0.161453
G1 X146.365 Y110.581 E.00103
; LINE_WIDTH: 0.148172
G3 X146.429 Y110.469 I.185 J.032 E.00113
; LINE_WIDTH: 0.1114
G1 X146.487 Y110.384 E.00058
; LINE_WIDTH: 0.0973915
G1 X146.547 Y110.305 E.00044
; WIPE_START
G1 F24000
G1 X146.487 Y110.384 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.2 I-.604 J1.057 P1  F30000
G1 X150.453 Y112.651 Z8.2
G1 Z7.8
G1 E.8 F1800
; LINE_WIDTH: 0.12678
G1 F6669
G1 X150.571 Y112.486 E.00138
; LINE_WIDTH: 0.173106
G1 X150.629 Y112.401 E.0011
; LINE_WIDTH: 0.136064
G1 X150.654 Y112.27 E.00101
; LINE_WIDTH: 0.0969204
G1 X150.672 Y112.165 E.00047
G1 X150.672 Y110.791 F30000
; LINE_WIDTH: 0.0969205
G1 F6669
G1 X150.654 Y110.686 E.00047
; LINE_WIDTH: 0.136065
G1 X150.629 Y110.555 E.00101
; LINE_WIDTH: 0.173107
G1 X150.571 Y110.469 E.0011
; LINE_WIDTH: 0.12678
G1 X150.453 Y110.305 E.00138
G1 X150.55 Y109.714 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6669
G1 X148.942 Y109.128 E.05676
G2 X147.422 Y109.332 I-.463 J2.311 E.05181
G1 X146.45 Y109.718 E.03469
G1 X146.45 Y103.562 E.20419
G1 X150.55 Y103.562 E.13598
G1 X150.55 Y109.654 E.20206
G1 X150.143 Y106.229 F30000
G1 F6669
G1 X150.143 Y107.857 E.05401
G1 X149.234 Y108.766 E.04263
G1 X149.127 Y108.747 E.0036
G1 X146.857 Y106.478 E.10648
G1 X146.857 Y104.849 E.05401
; WIPE_START
G1 F24000
G1 X146.857 Y106.478 E-.61876
G1 X147.12 Y106.74 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.2 I-.574 J-1.073 P1  F30000
G1 X112.34 Y125.34 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6669
G1 X112.153 Y125.421 E.00677
G3 X111.245 Y121.441 I-.653 J-1.945 E.22736
G1 X111.449 Y121.426 E.00679
G3 X112.525 Y125.254 I.051 J2.051 E.17988
G1 X112.395 Y125.314 E.00478
G1 X112.19 Y124.987 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6669
G1 X112.182 Y124.989 E.00026
G3 X111.294 Y121.83 I-.682 J-1.513 E.17541
G1 X111.459 Y121.818 E.00509
G3 X112.468 Y124.824 I.041 J1.659 E.12968
G1 X112.242 Y124.957 E.00806
M204 S10000
; WIPE_START
G1 F24000
G1 X112.182 Y124.989 E-.02588
G1 X111.869 Y125.096 E-.12557
G1 X111.541 Y125.138 E-.12563
G1 X111.212 Y125.113 E-.12564
G1 X110.893 Y125.023 E-.12564
G1 X110.599 Y124.873 E-.12563
G1 X110.381 Y124.699 E-.10602
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.2 I1.208 J.147 P1  F30000
G1 X112.218 Y109.558 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6669
G1 X112.25 Y109.566 E.00112
G3 X111.252 Y109.44 I-.747 J1.911 E.39401
G1 X111.449 Y109.426 E.00654
G3 X111.857 Y109.456 I.055 J2.051 E.01359
G1 X112.16 Y109.541 E.01046
G1 X112.107 Y109.932 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6669
G3 X111.296 Y109.83 I-.605 J1.546 E.2951
G1 X111.459 Y109.818 E.00501
G3 X112.051 Y109.911 I.043 J1.659 E.01851
M204 S10000
; WIPE_START
G1 F24000
G1 X112.401 Y110.083 E-.14827
G1 X112.659 Y110.289 E-.12563
G1 X112.872 Y110.543 E-.12563
G1 X113.03 Y110.833 E-.12564
G1 X113.087 Y110.988 E-.0629
G1 X113.152 Y111.313 E-.12563
G1 X113.152 Y111.434 E-.0463
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.2 I-1.194 J-.234 P1  F30000
G1 X109.102 Y132.08 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6669
G1 X109.102 Y103.08 E.96198
G1 X113.898 Y103.08 E.15909
G1 X113.898 Y131.6 E.94605
G2 X116.551 Y136.177 I16.303 J-6.391 E.17616
G1 X104.657 Y136.177 E.39455
G1 X104.303 Y135.348 E.02988
G3 X106.545 Y132.08 I2.236 J-.87 E.1547
G1 X109.042 Y132.08 E.08284
G1 X108.71 Y131.688 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6669
G1 X108.71 Y102.688 E.89109
G1 X114.29 Y102.688 E.17146
G1 X114.29 Y131.52 E.88594
G2 X117.395 Y136.569 I15.707 J-6.182 E.18307
G1 X104.397 Y136.569 E.39939
G1 X103.937 Y135.489 E.03606
G3 X106.54 Y131.688 I2.602 J-1.01 E.1665
G1 X108.65 Y131.688 E.06484
M204 S10000
; WIPE_START
G1 F24000
G1 X108.654 Y129.688 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.2 I-.981 J-.72 P1  F30000
G1 X106.33 Y132.853 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6669
G2 X105.094 Y133.714 I.209 J1.618 E.05192
G1 X105.063 Y133.767 E.00205
G1 X105.918 Y134.621 E.0401
G1 X108.027 Y134.621 E.06996
G1 X109.857 Y132.835 E.08485
G1 X113.143 Y129.505 E.15516
G1 X113.143 Y126.495 E.09988
G1 X112.718 Y126.07 E.01992
G3 X110.274 Y126.002 I-1.138 J-3.083 E.08309
G1 X109.857 Y125.839 E.01485
G1 X109.857 Y130.885 E.1674
G1 X113.594 Y134.621 E.17527
G1 X114.522 Y134.621 E.03078
G2 X114.192 Y134.003 I-97.205 J51.445 E.02323
G1 X110.423 Y125.624 F30000
G1 F6669
G2 X111.799 Y125.862 I1.124 J-2.399 E.04688
G1 X113.55 Y125.462 E.05957
G1 X113.55 Y131.67 E.20592
G1 X113.625 Y131.849 E.00642
G2 X115.2 Y135.028 I24.323 J-10.065 E.1178
G1 X104.574 Y135.028 E.35248
G3 X106.402 Y132.439 I1.973 J-.547 E.12025
G3 X109.45 Y132.428 I2.9 J370.893 E.10111
G1 X109.45 Y125.242 E.23838
G1 X110.367 Y125.602 E.03266
G1 X109.547 Y124.651 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973911
G1 F6669
G1 X109.487 Y124.572 E.00044
; LINE_WIDTH: 0.111402
G1 X109.429 Y124.486 E.00058
; LINE_WIDTH: 0.148179
G3 X109.365 Y124.375 I.121 J-.144 E.00113
; LINE_WIDTH: 0.161462
G1 X109.346 Y124.27 E.00103
; LINE_WIDTH: 0.129191
G1 X109.328 Y124.165 E.00075
G1 X109.328 Y122.791 F30000
; LINE_WIDTH: 0.143968
G1 F6669
G3 X109.405 Y122.373 I12.495 J2.078 E.00349
G1 X109.477 Y122.374 F30000
; LINE_WIDTH: 0.111416
M73 P89 R1
G1 F6669
G1 X109.544 Y122.285 E.00062
; LINE_WIDTH: 0.0973917
G1 X109.608 Y122.209 E.00044
G1 X109.477 Y122.374 F30000
; LINE_WIDTH: 0.146451
G1 F6669
G1 X109.406 Y122.468 E.00099
; LINE_WIDTH: 0.18011
G1 X109.306 Y122.613 E.00198
; WIPE_START
G1 F24000
G1 X109.406 Y122.468 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.2 I.049 J1.216 P1  F30000
G1 X113.453 Y122.305 Z8.2
G1 Z7.8
G1 E.8 F1800
; LINE_WIDTH: 0.126784
G1 F6669
G1 X113.571 Y122.469 E.00138
; LINE_WIDTH: 0.173113
G1 X113.629 Y122.555 E.0011
; LINE_WIDTH: 0.136068
G1 X113.654 Y122.686 E.00101
; LINE_WIDTH: 0.0969208
G1 X113.672 Y122.791 E.00047
G1 X113.55 Y121.714 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6669
G1 X112.309 Y121.227 E.04422
G2 X110.954 Y121.15 I-.808 J2.261 E.04563
G1 X109.45 Y121.493 E.05116
G1 X109.45 Y113.242 E.27371
G1 X110.423 Y113.624 E.03465
G2 X112.172 Y113.783 I1.092 J-2.308 E.05947
G1 X113.55 Y113.242 E.0491
G1 X113.55 Y121.654 E.27904
G1 X113.143 Y120.447 F30000
G1 F6669
G1 X113.143 Y118.819 E.05401
G1 X109.857 Y115.533 E.15411
G1 X109.857 Y117.439 E.0632
G1 X113.143 Y114.154 E.15411
G1 X113.143 Y113.839 E.01044
G3 X111.901 Y114.255 I-1.943 J-3.735 E.04361
G1 X113.453 Y112.651 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.12678
G1 F6669
G1 X113.571 Y112.486 E.00138
; LINE_WIDTH: 0.173104
G1 X113.629 Y112.401 E.0011
; LINE_WIDTH: 0.136063
G1 X113.654 Y112.27 E.00101
; LINE_WIDTH: 0.0969204
G1 X113.672 Y112.165 E.00047
G1 X113.672 Y110.791 F30000
; LINE_WIDTH: 0.0969205
G1 F6669
G1 X113.654 Y110.686 E.00047
; LINE_WIDTH: 0.136064
G1 X113.629 Y110.555 E.00101
; LINE_WIDTH: 0.173107
G1 X113.571 Y110.469 E.0011
; LINE_WIDTH: 0.12678
G1 X113.453 Y110.305 E.00138
G1 X113.55 Y109.714 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6669
G1 X111.942 Y109.128 E.05676
G2 X110.422 Y109.332 I-.463 J2.311 E.0518
G1 X109.45 Y109.718 E.03469
G1 X109.45 Y103.562 E.20419
G1 X113.55 Y103.562 E.13598
G1 X113.55 Y109.654 E.20206
G1 X109.547 Y110.305 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973918
G1 F6669
G1 X109.487 Y110.384 E.00044
; LINE_WIDTH: 0.111397
G1 X109.429 Y110.469 E.00058
; LINE_WIDTH: 0.148169
G2 X109.365 Y110.581 I.121 J.144 E.00113
; LINE_WIDTH: 0.161458
G1 X109.346 Y110.686 E.00103
; LINE_WIDTH: 0.129189
G1 X109.328 Y110.791 E.00075
G1 X109.328 Y112.165 F30000
; LINE_WIDTH: 0.12919
G1 F6669
G1 X109.346 Y112.27 E.00075
; LINE_WIDTH: 0.16146
G1 X109.365 Y112.375 E.00103
; LINE_WIDTH: 0.148172
G2 X109.429 Y112.486 I.185 J-.032 E.00113
; LINE_WIDTH: 0.111399
G1 X109.487 Y112.572 E.00058
; LINE_WIDTH: 0.0973907
G1 X109.547 Y112.651 E.00044
G1 X109.857 Y106.229 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6669
G1 X109.857 Y107.857 E.05401
G1 X110.767 Y108.767 E.04266
G1 X110.875 Y108.745 E.00365
G1 X113.143 Y106.478 E.10638
G1 X113.143 Y104.849 E.05401
G1 X113.672 Y124.165 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.143968
G1 F6669
G3 X113.595 Y124.582 I-12.476 J-2.075 E.00349
G1 X113.523 Y124.582 F30000
; LINE_WIDTH: 0.177988
G1 F6669
G1 X113.59 Y124.493 E.00123
; LINE_WIDTH: 0.19565
G1 X113.694 Y124.342 E.00228
G1 X113.523 Y124.582 F30000
; LINE_WIDTH: 0.128678
G1 F6669
G1 X113.392 Y124.747 E.00147
; WIPE_START
G1 F24000
G1 X113.523 Y124.582 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.2 I-.965 J-.742 P1  F30000
G1 X104.943 Y135.743 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F6669
G1 X115.613 Y135.743 E.39993
; CHANGE_LAYER
; Z_HEIGHT: 8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X113.613 Y135.743 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 53/58
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
G3 Z8.2 I.341 J1.168 P1  F30000
G1 X149.554 Y125.236 Z8.2
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6663
G1 X149.525 Y125.254 E.00111
G3 X148.245 Y121.441 I-1.025 J-1.777 E.24092
G1 X148.449 Y121.426 E.00679
G3 X149.857 Y125.015 I.051 J2.051 E.16631
G1 X149.602 Y125.201 E.01045
M73 P90 R1
G1 X149.231 Y124.961 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6663
G1 X149.028 Y125.05 E.0068
G3 X148.294 Y121.83 I-.528 J-1.573 E.17033
G1 X148.459 Y121.818 E.00509
G3 X149.329 Y124.914 I.041 J1.659 E.13476
G1 X149.285 Y124.935 E.00151
M204 S10000
; WIPE_START
G1 F24000
G1 X149.028 Y125.05 E-.10687
G1 X148.706 Y125.125 E-.12556
G1 X148.376 Y125.133 E-.12563
G1 X148.05 Y125.076 E-.12564
G1 X147.743 Y124.955 E-.12563
G1 X147.465 Y124.776 E-.12564
G1 X147.418 Y124.73 E-.02503
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.4 I1.199 J.206 P1  F30000
G1 X149.373 Y113.332 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6663
G1 X149.343 Y113.347 E.00111
G3 X148.245 Y109.441 I-.843 J-1.87 E.23414
G1 X148.449 Y109.426 E.00679
G3 X149.697 Y113.143 I.051 J2.051 E.17309
G1 X149.425 Y113.302 E.01045
G1 X149.181 Y112.992 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6663
G1 X148.869 Y113.094 E.01009
G3 X148.294 Y109.83 I-.369 J-1.618 E.16525
G1 X148.459 Y109.818 E.00509
G3 X149.234 Y112.965 I.041 J1.659 E.13808
M204 S10000
; WIPE_START
G1 F24000
G1 X148.869 Y113.094 E-.1471
G1 X148.541 Y113.138 E-.12556
G1 X148.212 Y113.113 E-.12564
G1 X147.893 Y113.023 E-.12563
G1 X147.599 Y112.873 E-.12564
G1 X147.465 Y112.776 E-.06289
G1 X147.375 Y112.689 E-.04754
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.4 I-1.193 J.241 P1  F30000
G1 X151.29 Y132.08 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6663
G1 X153.455 Y132.08 E.07182
G3 X155.697 Y135.348 I.001 J2.402 E.15458
G1 X155.441 Y135.977 E.02254
G1 X143.619 Y135.977 E.39216
G2 X146.102 Y131.6 I-14.044 J-10.861 E.1675
G1 X146.102 Y103.08 E.94605
G1 X150.898 Y103.08 E.15909
G1 X150.898 Y132.08 E.96198
G1 X151.23 Y132.08 E.01102
G1 X151.29 Y131.688 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6663
G1 X153.46 Y131.688 E.06668
G3 X156.063 Y135.489 I-.004 J2.795 E.1664
G3 X155.702 Y136.369 I-17.148 J-6.523 E.02923
G1 X142.785 Y136.369 E.39691
G2 X145.71 Y131.52 I-12.846 J-11.058 E.17482
G1 X145.71 Y102.688 E.88594
G1 X151.29 Y102.688 E.17146
G1 X151.29 Y131.628 E.88925
M204 S10000
; WIPE_START
G1 F24000
G1 X153.289 Y131.683 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.4 I-1.157 J.377 P1  F30000
G1 X153.671 Y132.854 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6663
G3 X154.934 Y133.769 I-.196 J1.6 E.05403
G1 X154.083 Y134.621 E.03994
G1 X151.973 Y134.621 E.07
G1 X146.857 Y129.505 E.23997
G1 X146.857 Y126.495 E.09988
G1 X147.328 Y126.024 E.02209
G2 X149.2 Y126.188 I1.203 J-2.96 E.06325
G1 X150.143 Y125.973 E.03208
G1 X150.143 Y130.885 E.16295
G1 X146.406 Y134.621 E.17527
G1 X145.478 Y134.621 E.03078
G3 X145.808 Y134.004 I104.619 J55.411 E.02323
G1 X144.472 Y135.543 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F6663
G1 X155.088 Y135.543 E.39793
; WIPE_START
G1 F24000
G1 X153.088 Y135.543 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.4 I1.197 J-.219 P1  F30000
G1 X150.55 Y121.654 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6663
G1 X150.55 Y113.242 E.27904
G1 X149.429 Y113.682 E.03994
G3 X147.423 Y113.623 I-.943 J-2.109 E.06887
G1 X146.45 Y113.242 E.03465
G1 X146.45 Y121.493 E.27371
G1 X147.831 Y121.178 E.04697
G3 X149.309 Y121.227 I.64 J3.022 E.04953
G1 X150.55 Y121.714 E.04422
G1 X150.453 Y122.305 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.126789
G1 F6663
G1 X150.571 Y122.469 E.00138
; LINE_WIDTH: 0.173123
G1 X150.629 Y122.555 E.0011
; LINE_WIDTH: 0.136073
G1 X150.654 Y122.686 E.00101
; LINE_WIDTH: 0.0969205
G1 X150.672 Y122.791 E.00047
G1 X150.601 Y124.577 F30000
; LINE_WIDTH: 0.119469
G1 F6663
G2 X150.671 Y124.163 I-8.241 J-1.617 E.00262
G1 X150.694 Y124.341 F30000
; LINE_WIDTH: 0.195637
G1 F6663
G1 X150.593 Y124.49 E.00224
; LINE_WIDTH: 0.179233
G1 X150.524 Y124.58 E.00126
; LINE_WIDTH: 0.129169
G1 X150.392 Y124.747 E.00149
G1 X147.423 Y125.624 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6663
G2 X149.109 Y125.791 I1.103 J-2.527 E.05714
G1 X150.55 Y125.462 E.04902
G1 X150.55 Y132.428 E.23107
G3 X153.861 Y132.474 I.332 J96.665 E.10987
G3 X155.426 Y135.028 I-.391 J1.995 E.11168
G1 X144.8 Y135.029 E.35246
G2 X145.731 Y133.281 I-268.969 J-144.43 E.06568
G2 X146.004 Y132.71 I-6.165 J-3.298 E.021
G1 X146.45 Y131.67 E.03754
G1 X146.45 Y125.242 E.21324
G1 X147.367 Y125.602 E.03266
G1 X146.547 Y124.651 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973911
G1 F6663
G1 X146.487 Y124.572 E.00044
; LINE_WIDTH: 0.1114
G1 X146.429 Y124.486 E.00058
; LINE_WIDTH: 0.148177
G3 X146.365 Y124.375 I.121 J-.144 E.00113
; LINE_WIDTH: 0.16146
G1 X146.346 Y124.27 E.00103
; LINE_WIDTH: 0.129191
G1 X146.328 Y124.165 E.00075
G1 X146.399 Y122.378 F30000
; LINE_WIDTH: 0.119473
G1 F6663
G2 X146.329 Y122.793 I8.154 J1.604 E.00262
G1 X146.306 Y122.615 F30000
; LINE_WIDTH: 0.181646
G1 F6663
G1 X146.403 Y122.472 E.00195
; LINE_WIDTH: 0.147275
G1 X146.476 Y122.375 E.00103
; LINE_WIDTH: 0.111411
G1 X146.544 Y122.285 E.00063
; LINE_WIDTH: 0.0973917
G1 X146.608 Y122.209 E.00044
G1 X146.857 Y120.447 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6663
G1 X146.857 Y118.819 E.05401
G1 X150.143 Y115.533 E.15411
G1 X150.143 Y117.439 E.0632
G1 X146.857 Y114.154 E.15411
G1 X146.857 Y113.839 E.01044
G1 X147.274 Y114.002 E.01485
G2 X148.1 Y114.248 I1.022 J-1.92 E.02878
G1 X146.547 Y112.651 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973916
G1 F6663
G1 X146.487 Y112.572 E.00044
; LINE_WIDTH: 0.111399
G1 X146.429 Y112.486 E.00058
; LINE_WIDTH: 0.14817
G3 X146.365 Y112.375 I.121 J-.144 E.00113
; LINE_WIDTH: 0.161458
G1 X146.346 Y112.27 E.00103
; LINE_WIDTH: 0.12919
G1 X146.328 Y112.165 E.00075
G1 X146.399 Y110.379 F30000
; LINE_WIDTH: 0.119466
G1 F6663
G2 X146.329 Y110.793 I8.245 J1.618 E.00262
G1 X146.306 Y110.615 F30000
; LINE_WIDTH: 0.181646
G1 F6663
G1 X146.403 Y110.472 E.00195
; LINE_WIDTH: 0.147274
G1 X146.476 Y110.375 E.00103
; LINE_WIDTH: 0.111409
G1 X146.544 Y110.285 E.00063
; LINE_WIDTH: 0.0973914
G1 X146.608 Y110.209 E.00044
; WIPE_START
G1 F24000
G1 X146.544 Y110.285 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.4 I-.656 J1.025 P1  F30000
G1 X150.392 Y112.747 Z8.4
G1 Z8
G1 E.8 F1800
; LINE_WIDTH: 0.129163
G1 F6663
G1 X150.524 Y112.58 E.00149
; LINE_WIDTH: 0.179222
G1 X150.593 Y112.49 E.00126
; LINE_WIDTH: 0.195637
G1 X150.694 Y112.341 E.00224
G1 X150.671 Y112.163 F30000
; LINE_WIDTH: 0.119468
G1 F6663
G3 X150.601 Y112.577 I-8.327 J-1.205 E.00262
G1 X150.672 Y110.791 F30000
; LINE_WIDTH: 0.0969209
G1 F6663
G1 X150.654 Y110.686 E.00047
; LINE_WIDTH: 0.136066
G1 X150.629 Y110.555 E.00101
; LINE_WIDTH: 0.17311
G1 X150.571 Y110.469 E.0011
; LINE_WIDTH: 0.12678
G1 X150.453 Y110.305 E.00138
G1 X150.55 Y109.714 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6663
G1 X149.151 Y109.165 E.04985
G1 X148.761 Y109.096 E.01312
G2 X148.654 Y109.082 I-.088 J.258 E.0036
G1 X148.654 Y109.082 E0
G2 X147.582 Y109.269 I-.104 J2.575 E.03639
G1 X146.45 Y109.718 E.04037
G1 X146.45 Y103.562 E.20419
G1 X150.55 Y103.562 E.13598
G1 X150.55 Y109.654 E.20206
G1 X150.143 Y106.229 F30000
G1 F6663
G1 X150.143 Y107.857 E.05401
G1 X149.234 Y108.766 E.04263
G1 X149.127 Y108.747 E.0036
G1 X146.857 Y106.478 E.10648
G1 X146.857 Y104.849 E.05401
; WIPE_START
G1 F24000
G1 X146.857 Y106.478 E-.61876
G1 X147.12 Y106.74 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.4 I-.574 J-1.073 P1  F30000
G1 X112.554 Y125.236 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6663
G1 X112.525 Y125.254 E.00111
G3 X111.245 Y121.441 I-1.025 J-1.777 E.24092
G1 X111.449 Y121.426 E.00679
G3 X112.857 Y125.015 I.051 J2.051 E.16631
G1 X112.602 Y125.201 E.01045
G1 X112.231 Y124.961 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6663
G1 X112.028 Y125.05 E.0068
G3 X111.294 Y121.83 I-.528 J-1.573 E.17033
G1 X111.459 Y121.818 E.00509
G3 X112.329 Y124.914 I.041 J1.659 E.13476
G1 X112.285 Y124.935 E.00151
M204 S10000
; WIPE_START
G1 F24000
G1 X112.028 Y125.05 E-.10687
G1 X111.706 Y125.125 E-.12556
G1 X111.376 Y125.133 E-.12563
G1 X111.05 Y125.076 E-.12564
G1 X110.743 Y124.955 E-.12563
G1 X110.465 Y124.776 E-.12564
G1 X110.418 Y124.73 E-.02503
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.4 I1.208 J.143 P1  F30000
G1 X112.218 Y109.558 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6663
G1 X112.25 Y109.567 E.00111
G3 X111.245 Y109.441 I-.75 J1.91 E.39364
G1 X111.449 Y109.426 E.00679
G3 X111.856 Y109.456 I.051 J2.051 E.01358
G1 X112.16 Y109.542 E.01046
G1 X112.107 Y109.932 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6663
G3 X111.294 Y109.83 I-.607 J1.544 E.2949
G1 X111.459 Y109.818 E.00509
G3 X112.05 Y109.912 I.041 J1.659 E.01851
M204 S10000
; WIPE_START
G1 F24000
G1 X112.401 Y110.083 E-.14826
G1 X112.659 Y110.289 E-.12564
G1 X112.872 Y110.543 E-.12563
G1 X113.03 Y110.833 E-.12563
G1 X113.127 Y111.149 E-.12563
G1 X113.158 Y111.435 E-.10921
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.4 I-1.194 J-.235 P1  F30000
G1 X109.102 Y132.08 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6663
G1 X109.102 Y103.08 E.96198
G1 X113.898 Y103.08 E.15909
G1 X113.898 Y131.6 E.94605
G2 X116.381 Y135.977 I16.528 J-6.484 E.1675
G1 X104.571 Y135.977 E.39176
G3 X104.186 Y134.948 I4.347 J-2.213 E.03651
G3 X106.545 Y132.08 I2.357 J-.465 E.14077
G1 X109.042 Y132.08 E.08284
G1 X108.71 Y131.688 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6663
G1 X108.71 Y102.688 E.89109
G1 X114.29 Y102.688 E.17146
G1 X114.29 Y131.52 E.88594
G2 X117.215 Y136.369 I15.775 J-6.211 E.17481
G1 X104.312 Y136.369 E.39647
G1 X103.937 Y135.489 E.02937
G3 X106.54 Y131.688 I2.602 J-1.011 E.16651
G1 X108.65 Y131.688 E.06484
M204 S10000
; WIPE_START
G1 F24000
G1 X108.654 Y129.688 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.4 I-.981 J-.72 P1  F30000
G1 X106.33 Y132.853 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6663
G2 X105.063 Y133.767 I.271 J1.712 E.05376
G1 X105.918 Y134.621 E.04008
G1 X108.027 Y134.621 E.06996
G1 X113.143 Y129.505 E.24
G1 X113.143 Y126.495 E.09988
G1 X112.718 Y126.07 E.01992
G1 X112.096 Y126.212 E.02116
G3 X110.274 Y126.002 I-.554 J-3.209 E.06167
G1 X109.857 Y125.839 E.01485
G1 X109.857 Y130.885 E.1674
G1 X113.594 Y134.621 E.17527
G1 X114.522 Y134.621 E.03078
G2 X114.192 Y134.004 I-103.868 J55.01 E.02323
G1 X110.423 Y125.624 F30000
G1 F6663
G2 X112.005 Y125.815 I1.114 J-2.572 E.05362
G1 X113.55 Y125.462 E.05254
G1 X113.55 Y131.67 E.20592
G1 X113.996 Y132.71 E.03754
G2 X115.2 Y135.028 I26.851 J-12.472 E.08668
G1 X104.574 Y135.028 E.35248
G3 X106.402 Y132.439 I1.972 J-.547 E.12026
G3 X109.45 Y132.428 I2.9 J370.912 E.10111
G1 X109.45 Y125.242 E.23838
G1 X110.367 Y125.602 E.03266
G1 X109.547 Y124.651 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973914
G1 F6663
G1 X109.487 Y124.572 E.00044
; LINE_WIDTH: 0.111405
G1 X109.429 Y124.486 E.00058
; LINE_WIDTH: 0.148183
G3 X109.365 Y124.375 I.121 J-.144 E.00113
; LINE_WIDTH: 0.161464
G1 X109.346 Y124.27 E.00103
; LINE_WIDTH: 0.129193
G1 X109.328 Y124.165 E.00075
G1 X109.329 Y122.793 F30000
; LINE_WIDTH: 0.119477
G1 F6663
G3 X109.399 Y122.378 I8.231 J1.19 E.00262
G1 X109.476 Y122.375 F30000
; LINE_WIDTH: 0.147276
G1 F6663
G1 X109.403 Y122.472 E.00103
; LINE_WIDTH: 0.181648
G1 X109.306 Y122.615 E.00195
G1 X109.476 Y122.375 F30000
; LINE_WIDTH: 0.111413
G1 F6663
G1 X109.544 Y122.285 E.00063
; LINE_WIDTH: 0.0973918
G1 X109.608 Y122.209 E.00044
; WIPE_START
G1 F24000
G1 X109.544 Y122.285 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.4 I-.006 J1.217 P1  F30000
G1 X113.453 Y122.305 Z8.4
G1 Z8
G1 E.8 F1800
; LINE_WIDTH: 0.126787
G1 F6663
G1 X113.571 Y122.469 E.00138
; LINE_WIDTH: 0.173119
G1 X113.629 Y122.555 E.0011
; LINE_WIDTH: 0.13607
G1 X113.654 Y122.686 E.00101
; LINE_WIDTH: 0.0969205
G1 X113.672 Y122.791 E.00047
G1 X113.55 Y121.714 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6663
G1 X112.309 Y121.227 E.0442
G2 X110.902 Y121.162 I-.844 J3.012 E.04714
G1 X109.45 Y121.493 E.04938
G1 X109.45 Y113.242 E.27371
G1 X110.423 Y113.623 E.03465
G2 X112.429 Y113.682 I1.063 J-2.051 E.06887
G1 X113.55 Y113.242 E.03994
G1 X113.55 Y121.654 E.27904
G1 X113.143 Y120.447 F30000
G1 F6663
G1 X113.143 Y118.819 E.05401
G1 X109.857 Y115.533 E.15411
G1 X109.857 Y117.439 E.0632
G1 X113.143 Y114.154 E.15411
G1 X113.143 Y113.839 E.01044
G3 X112.327 Y114.159 I-4.687 J-10.739 E.02906
G3 X111.902 Y114.256 I-1.369 J-5.016 E.01447
G1 X113.392 Y112.747 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.129164
G1 F6663
G1 X113.524 Y112.58 E.00149
; LINE_WIDTH: 0.179223
G1 X113.593 Y112.49 E.00126
; LINE_WIDTH: 0.195634
G1 X113.694 Y112.341 E.00224
G1 X113.671 Y112.163 F30000
; LINE_WIDTH: 0.119464
G1 F6663
G3 X113.601 Y112.577 I-8.332 J-1.206 E.00262
G1 X113.672 Y110.791 F30000
; LINE_WIDTH: 0.0969209
G1 F6663
G1 X113.654 Y110.686 E.00047
; LINE_WIDTH: 0.136064
G1 X113.629 Y110.555 E.00101
; LINE_WIDTH: 0.173105
G1 X113.571 Y110.469 E.0011
; LINE_WIDTH: 0.126778
G1 X113.453 Y110.305 E.00138
G1 X113.55 Y109.714 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6663
G1 X112.151 Y109.165 E.04985
G1 X111.761 Y109.096 E.01312
G2 X111.654 Y109.082 I-.088 J.258 E.0036
G1 X111.654 Y109.082 E0
G2 X110.582 Y109.269 I-.104 J2.575 E.03639
G1 X109.45 Y109.718 E.04037
G1 X109.45 Y103.562 E.20419
G1 X113.55 Y103.562 E.13598
G1 X113.55 Y109.654 E.20206
G1 X109.608 Y110.209 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973915
G1 F6663
G1 X109.544 Y110.285 E.00044
; LINE_WIDTH: 0.111412
G1 X109.476 Y110.375 E.00063
; LINE_WIDTH: 0.147276
G1 X109.403 Y110.472 E.00103
; LINE_WIDTH: 0.181648
G1 X109.306 Y110.615 E.00195
G1 X109.329 Y110.793 F30000
; LINE_WIDTH: 0.11947
G1 F6663
G3 X109.399 Y110.379 I8.326 J1.205 E.00262
G1 X109.328 Y112.165 F30000
; LINE_WIDTH: 0.129192
G1 F6663
G1 X109.346 Y112.27 E.00075
; LINE_WIDTH: 0.161462
G1 X109.365 Y112.375 E.00103
; LINE_WIDTH: 0.148173
G2 X109.429 Y112.486 I.185 J-.032 E.00113
; LINE_WIDTH: 0.111401
G1 X109.487 Y112.572 E.00058
; LINE_WIDTH: 0.0973906
G1 X109.547 Y112.651 E.00044
G1 X109.857 Y106.229 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6663
G1 X109.857 Y107.857 E.05401
G1 X110.769 Y108.769 E.04276
G1 X110.873 Y108.747 E.00353
G1 X113.143 Y106.478 E.10647
G1 X113.143 Y104.849 E.05401
G1 X113.671 Y124.163 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.119466
G1 F6663
G3 X113.601 Y124.577 I-8.317 J-1.203 E.00262
G1 X113.524 Y124.58 F30000
; LINE_WIDTH: 0.129167
G1 F6663
G1 X113.392 Y124.747 E.00149
G1 X113.524 Y124.58 F30000
; LINE_WIDTH: 0.179231
G1 F6663
G1 X113.593 Y124.49 E.00126
; LINE_WIDTH: 0.195633
G1 X113.694 Y124.341 E.00224
; WIPE_START
G1 F24000
G1 X113.593 Y124.49 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.4 I-.955 J-.755 P1  F30000
G1 X104.858 Y135.543 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F6663
G1 X115.468 Y135.543 E.39771
; CHANGE_LAYER
; Z_HEIGHT: 8.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X113.468 Y135.543 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 54/58
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
M73 P91 R1
G3 Z8.4 I.334 J1.17 P1  F30000
G1 X149.496 Y125.269 Z8.4
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6645
G1 X149.153 Y125.421 E.01244
G3 X148.245 Y121.441 I-.653 J-1.945 E.22736
G1 X148.449 Y121.426 E.00679
G3 X149.548 Y125.24 I.051 J2.051 E.179
G1 X149.263 Y124.946 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6645
G1 X149.028 Y125.05 E.0079
G3 X148.294 Y121.83 I-.528 J-1.573 E.17033
G1 X148.459 Y121.818 E.00509
G3 X149.329 Y124.914 I.041 J1.659 E.13476
G1 X149.317 Y124.92 E.0004
M204 S10000
; WIPE_START
G1 F24000
G1 X149.028 Y125.05 E-.12051
G1 X148.706 Y125.125 E-.12557
G1 X148.376 Y125.133 E-.12563
G1 X148.05 Y125.076 E-.12563
G1 X147.743 Y124.955 E-.12563
G1 X147.465 Y124.776 E-.12564
G1 X147.443 Y124.755 E-.01139
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.6 I1.201 J.197 P1  F30000
G1 X149.313 Y113.36 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6645
G1 X148.956 Y113.477 E.01244
G3 X148.245 Y109.441 I-.456 J-2 E.22058
G1 X148.449 Y109.426 E.00679
G3 X149.367 Y113.336 I.051 J2.051 E.18578
G1 X149.18 Y112.992 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6645
G1 X148.869 Y113.094 E.01005
G3 X148.294 Y109.83 I-.369 J-1.618 E.16525
G1 X148.459 Y109.818 E.00509
G3 X149.233 Y112.965 I.041 J1.659 E.13811
M204 S10000
; WIPE_START
G1 F24000
G1 X148.869 Y113.094 E-.1467
G1 X148.541 Y113.138 E-.12556
G1 X148.376 Y113.133 E-.06289
G1 X148.05 Y113.076 E-.12564
G1 X147.743 Y112.955 E-.12564
G1 X147.465 Y112.776 E-.12563
G1 X147.375 Y112.688 E-.04795
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.6 I-1.197 J.222 P1  F30000
G1 X150.898 Y131.688 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6645
G1 X150.898 Y132.08 E.01301
G1 X153.455 Y132.08 E.08483
G3 X155.695 Y135.352 I.006 J2.399 E.15484
G1 X155.522 Y135.777 E.0152
G1 X143.767 Y135.777 E.38993
G2 X146.102 Y131.6 I-14.206 J-10.682 E.15922
G1 X146.102 Y103.085 E.94588
G1 X150.898 Y103.085 E.15909
G1 X150.898 Y131.628 E.94682
G1 X151.29 Y131.688 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6645
G1 X153.46 Y131.688 E.06668
G3 X156.062 Y135.491 I.001 J2.791 E.16655
G1 X155.786 Y136.169 E.0225
G1 X142.953 Y136.169 E.39432
G2 X145.71 Y131.52 I-13.311 J-11.036 E.16675
G1 X145.71 Y102.693 E.88579
G1 X151.29 Y102.693 E.17146
G1 X151.29 Y131.628 E.88909
M204 S10000
; WIPE_START
G1 F24000
G1 X153.289 Y131.683 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.6 I-1.157 J.377 P1  F30000
G1 X153.67 Y132.854 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6645
G3 X154.935 Y133.768 I-.242 J1.666 E.05386
G1 X154.201 Y134.503 E.03444
G1 X151.855 Y134.503 E.07784
G1 X146.857 Y129.505 E.23443
G1 X146.857 Y126.495 E.09988
G1 X147.328 Y126.024 E.02209
G2 X149.178 Y126.193 I1.178 J-2.682 E.0627
G1 X150.143 Y125.973 E.03282
G1 X150.143 Y130.885 E.16295
G1 X146.525 Y134.503 E.1697
G1 X145.542 Y134.503 E.03262
G3 X145.846 Y133.934 I103.852 J55.096 E.02139
G1 X144.608 Y135.343 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F6645
G1 X155.166 Y135.343 E.39576
; WIPE_START
G1 F24000
G1 X153.166 Y135.343 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.6 I1.195 J-.228 P1  F30000
G1 X150.55 Y121.654 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6645
G1 X150.55 Y113.242 E.27904
G1 X149.429 Y113.682 E.03994
G3 X147.484 Y113.647 I-.936 J-2.086 E.06666
G1 X146.45 Y113.242 E.03682
G1 X146.45 Y121.493 E.27371
G1 X147.852 Y121.173 E.04769
G3 X149.151 Y121.165 I.665 J2.424 E.04357
G1 X150.55 Y121.714 E.04985
G1 X150.453 Y122.305 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.126787
G1 F6645
G1 X150.571 Y122.469 E.00138
; LINE_WIDTH: 0.173119
G1 X150.629 Y122.555 E.0011
; LINE_WIDTH: 0.136071
G1 X150.654 Y122.686 E.00101
; LINE_WIDTH: 0.096921
G1 X150.672 Y122.791 E.00047
G1 X150.601 Y124.577 F30000
; LINE_WIDTH: 0.11947
G1 F6645
G2 X150.671 Y124.163 I-8.256 J-1.619 E.00262
G1 X150.694 Y124.341 F30000
; LINE_WIDTH: 0.195634
G1 F6645
G1 X150.593 Y124.49 E.00224
; LINE_WIDTH: 0.179229
G1 X150.524 Y124.58 E.00126
; LINE_WIDTH: 0.129167
G1 X150.392 Y124.747 E.00149
G1 X147.423 Y125.624 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6645
G2 X149.087 Y125.796 I1.066 J-2.166 E.05669
G1 X150.55 Y125.462 E.04976
G1 X150.55 Y132.428 E.23107
G3 X153.861 Y132.474 I.333 J96.526 E.10987
G3 X155.46 Y134.91 I-.4 J2.005 E.10759
G1 X144.864 Y134.91 E.35151
G2 X145.732 Y133.28 I-261.402 J-140.322 E.06127
G2 X146.45 Y131.67 I-16.945 J-8.527 E.05849
G1 X146.45 Y125.242 E.21324
G1 X147.367 Y125.602 E.03266
G1 X146.547 Y124.651 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973914
G1 F6645
G1 X146.487 Y124.572 E.00044
; LINE_WIDTH: 0.111405
G1 X146.429 Y124.486 E.00058
; LINE_WIDTH: 0.148182
G3 X146.365 Y124.375 I.121 J-.144 E.00113
; LINE_WIDTH: 0.161456
G1 X146.346 Y124.27 E.00103
; LINE_WIDTH: 0.129188
G1 X146.328 Y124.165 E.00075
G1 X146.399 Y122.379 F30000
; LINE_WIDTH: 0.119474
G1 F6645
G2 X146.329 Y122.793 I8.237 J1.617 E.00262
G1 X146.306 Y122.615 F30000
; LINE_WIDTH: 0.181649
G1 F6645
G1 X146.403 Y122.472 E.00195
; LINE_WIDTH: 0.147275
G1 X146.476 Y122.375 E.00103
; LINE_WIDTH: 0.111407
G1 X146.544 Y122.285 E.00063
; LINE_WIDTH: 0.0973916
G1 X146.608 Y122.209 E.00044
G1 X146.857 Y120.447 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6645
G1 X146.857 Y118.819 E.05401
G1 X150.143 Y115.533 E.15411
G1 X150.143 Y117.439 E.0632
G1 X146.857 Y114.154 E.15411
G1 X146.857 Y113.839 E.01044
G1 X147.335 Y114.026 E.01702
G2 X148.1 Y114.248 I.932 J-1.782 E.02661
G1 X146.547 Y112.651 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973916
G1 F6645
G1 X146.487 Y112.572 E.00044
; LINE_WIDTH: 0.111404
G1 X146.429 Y112.486 E.00058
; LINE_WIDTH: 0.148185
G3 X146.365 Y112.375 I.121 J-.144 E.00113
; LINE_WIDTH: 0.161458
G1 X146.346 Y112.27 E.00103
; LINE_WIDTH: 0.12919
G1 X146.328 Y112.165 E.00075
G1 X146.399 Y110.379 F30000
; LINE_WIDTH: 0.119476
G1 F6645
G2 X146.329 Y110.793 I8.239 J1.617 E.00262
G1 X146.306 Y110.615 F30000
; LINE_WIDTH: 0.181643
G1 F6645
G1 X146.403 Y110.472 E.00195
; LINE_WIDTH: 0.147269
G1 X146.476 Y110.375 E.00103
; LINE_WIDTH: 0.111404
G1 X146.544 Y110.285 E.00063
; LINE_WIDTH: 0.0973917
G1 X146.608 Y110.209 E.00044
; WIPE_START
G1 F24000
G1 X146.544 Y110.285 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.6 I-.656 J1.025 P1  F30000
G1 X150.392 Y112.747 Z8.6
G1 Z8.2
G1 E.8 F1800
; LINE_WIDTH: 0.129171
G1 F6645
G1 X150.524 Y112.58 E.00149
; LINE_WIDTH: 0.17924
G1 X150.593 Y112.49 E.00126
; LINE_WIDTH: 0.19564
G1 X150.694 Y112.341 E.00224
G1 X150.671 Y112.163 F30000
; LINE_WIDTH: 0.119481
G1 F6645
G3 X150.601 Y112.577 I-8.32 J-1.204 E.00262
G1 X150.672 Y110.791 F30000
; LINE_WIDTH: 0.0969202
G1 F6645
G1 X150.654 Y110.686 E.00047
; LINE_WIDTH: 0.136066
G1 X150.629 Y110.555 E.00101
; LINE_WIDTH: 0.173112
G1 X150.571 Y110.469 E.0011
; LINE_WIDTH: 0.126781
G1 X150.453 Y110.305 E.00138
G1 X150.55 Y109.714 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6645
G1 X149.151 Y109.165 E.04985
G2 X147.582 Y109.269 I-.633 J2.327 E.05314
G1 X146.45 Y109.718 E.04037
G1 X146.45 Y103.562 E.20419
G1 X150.55 Y103.562 E.13598
G1 X150.55 Y109.654 E.20206
G1 X150.143 Y106.229 F30000
G1 F6645
G1 X150.143 Y107.857 E.05401
G1 X149.234 Y108.766 E.04263
G1 X149.127 Y108.747 E.0036
G1 X146.857 Y106.478 E.10648
G1 X146.857 Y104.849 E.05401
; WIPE_START
G1 F24000
G1 X146.857 Y106.478 E-.61876
G1 X147.12 Y106.74 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.6 I-.574 J-1.073 P1  F30000
G1 X112.496 Y125.269 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6645
G1 X112.153 Y125.421 E.01244
G3 X111.245 Y121.441 I-.653 J-1.945 E.22736
G1 X111.449 Y121.426 E.00679
G3 X112.548 Y125.24 I.051 J2.051 E.179
G1 X112.263 Y124.946 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6645
G1 X112.028 Y125.05 E.0079
G3 X111.294 Y121.83 I-.528 J-1.573 E.17033
G1 X111.459 Y121.818 E.00509
G3 X112.329 Y124.914 I.041 J1.659 E.13476
G1 X112.317 Y124.92 E.0004
M204 S10000
; WIPE_START
G1 F24000
G1 X112.028 Y125.05 E-.12052
G1 X111.706 Y125.125 E-.12557
G1 X111.376 Y125.133 E-.12563
G1 X111.05 Y125.076 E-.12563
G1 X110.743 Y124.955 E-.12563
G1 X110.465 Y124.776 E-.12564
G1 X110.443 Y124.755 E-.01138
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.6 I1.208 J.146 P1  F30000
G1 X112.28 Y109.582 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6645
G1 X112.614 Y109.754 E.01245
G3 X111.245 Y109.441 I-1.114 J1.723 E.38006
G1 X111.449 Y109.426 E.00679
G3 X112.225 Y109.558 I.051 J2.051 E.02629
G1 X112.107 Y109.932 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6645
G3 X111.294 Y109.83 I-.607 J1.544 E.2949
G1 X111.459 Y109.818 E.00509
G3 X112.05 Y109.912 I.041 J1.659 E.01851
M204 S10000
; WIPE_START
G1 F24000
G1 X112.401 Y110.083 E-.14826
G1 X112.659 Y110.289 E-.12563
G1 X112.872 Y110.543 E-.12564
G1 X113.03 Y110.833 E-.12563
G1 X113.127 Y111.149 E-.12563
G1 X113.158 Y111.435 E-.1092
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.6 I-1.194 J-.235 P1  F30000
G1 X109.102 Y132.08 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6645
G1 X109.102 Y103.085 E.96182
G1 X113.898 Y103.085 E.15909
G1 X113.898 Y131.6 E.94588
G2 X116.233 Y135.777 I16.406 J-6.429 E.15923
G1 X104.486 Y135.777 E.38966
G3 X104.143 Y134.36 I2.705 J-1.406 E.04882
G3 X106.545 Y132.08 I2.397 J.119 E.12126
G1 X109.042 Y132.08 E.08284
G1 X108.71 Y131.688 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6645
G1 X108.71 Y102.693 E.89093
G1 X114.29 Y102.693 E.17146
G1 X114.29 Y131.52 E.88579
G2 X117.049 Y136.169 I15.907 J-6.297 E.1668
G1 X104.227 Y136.169 E.39398
G3 X103.863 Y135.272 I5.936 J-2.931 E.02977
G3 X106.54 Y131.688 I2.681 J-.789 E.15935
G1 X108.65 Y131.688 E.06484
M204 S10000
; WIPE_START
G1 F24000
G1 X108.654 Y129.688 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.6 I-.981 J-.72 P1  F30000
G1 X106.33 Y132.854 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6645
G2 X105.063 Y133.766 I.214 J1.634 E.05398
G1 X105.799 Y134.503 E.03454
G1 X108.145 Y134.503 E.07784
G1 X109.857 Y132.832 E.07935
G1 X113.143 Y129.505 E.15509
G1 X113.143 Y126.495 E.09988
G1 X112.718 Y126.07 E.01992
G3 X110.274 Y126.002 I-1.141 J-2.965 E.08325
G1 X109.857 Y125.839 E.01485
G1 X109.857 Y130.885 E.1674
G1 X113.475 Y134.503 E.1697
G1 X114.458 Y134.503 E.03262
G2 X114.154 Y133.934 I-102.901 J54.588 E.02139
G1 X110.423 Y125.624 F30000
G1 F6645
G2 X112.015 Y125.813 I1.064 J-2.158 E.05424
G1 X113.55 Y125.462 E.0522
G1 X113.55 Y131.67 E.20592
G1 X113.986 Y132.689 E.03678
G2 X115.136 Y134.91 I25.628 J-11.872 E.08298
G1 X104.539 Y134.91 E.35155
G3 X106.333 Y132.44 I2.007 J-.429 E.11421
G1 X109.45 Y132.427 E.1034
G1 X109.45 Y125.242 E.23834
G1 X110.367 Y125.602 E.03266
G1 X109.547 Y124.651 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973917
G1 F6645
G1 X109.487 Y124.572 E.00044
; LINE_WIDTH: 0.111409
G1 X109.429 Y124.486 E.00058
; LINE_WIDTH: 0.148185
G3 X109.365 Y124.375 I.121 J-.144 E.00113
; LINE_WIDTH: 0.16146
G1 X109.346 Y124.27 E.00103
; LINE_WIDTH: 0.12919
G1 X109.328 Y124.165 E.00075
G1 X109.329 Y122.793 F30000
; LINE_WIDTH: 0.119477
G1 F6645
G3 X109.399 Y122.379 I8.306 J1.202 E.00262
G1 X109.476 Y122.375 F30000
; LINE_WIDTH: 0.111409
G1 F6645
G1 X109.544 Y122.285 E.00063
; LINE_WIDTH: 0.0973914
G1 X109.608 Y122.209 E.00044
G1 X109.476 Y122.375 F30000
; LINE_WIDTH: 0.147276
G1 F6645
G1 X109.403 Y122.472 E.00103
; LINE_WIDTH: 0.181652
G1 X109.306 Y122.615 E.00195
; WIPE_START
G1 F24000
G1 X109.403 Y122.472 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.6 I.05 J1.216 P1  F30000
G1 X113.453 Y122.305 Z8.6
G1 Z8.2
G1 E.8 F1800
; LINE_WIDTH: 0.126788
G1 F6645
G1 X113.571 Y122.469 E.00138
; LINE_WIDTH: 0.17312
G1 X113.629 Y122.555 E.0011
; LINE_WIDTH: 0.136071
G1 X113.654 Y122.686 E.00101
; LINE_WIDTH: 0.096921
G1 X113.672 Y122.791 E.00047
G1 X113.55 Y121.714 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6645
G1 X112.151 Y121.165 E.04985
G2 X110.913 Y121.159 I-.629 J2.37 E.04151
G1 X109.45 Y121.493 E.04977
G1 X109.45 Y113.242 E.27371
G1 X110.483 Y113.647 E.03681
G2 X112.429 Y113.682 I1.009 J-2.052 E.06667
G1 X113.55 Y113.242 E.03994
G1 X113.55 Y121.654 E.27904
G1 X113.143 Y120.447 F30000
G1 F6645
G1 X113.143 Y118.819 E.05401
G1 X109.857 Y115.533 E.15411
G1 X109.857 Y117.439 E.0632
G1 X113.143 Y114.154 E.15411
G1 X113.143 Y113.839 E.01044
G3 X112.327 Y114.159 I-4.687 J-10.742 E.02906
G3 X111.902 Y114.256 I-1.368 J-5.015 E.01447
G1 X113.392 Y112.747 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.12917
G1 F6645
G1 X113.524 Y112.58 E.00149
; LINE_WIDTH: 0.179237
G1 X113.593 Y112.49 E.00126
; LINE_WIDTH: 0.195636
G1 X113.694 Y112.341 E.00224
G1 X113.671 Y112.163 F30000
; LINE_WIDTH: 0.119477
G1 F6645
G3 X113.601 Y112.577 I-8.24 J-1.192 E.00262
G1 X113.672 Y110.791 F30000
; LINE_WIDTH: 0.0969202
G1 F6645
G1 X113.654 Y110.686 E.00047
; LINE_WIDTH: 0.136064
G1 X113.629 Y110.555 E.00101
; LINE_WIDTH: 0.173107
G1 X113.571 Y110.469 E.0011
; LINE_WIDTH: 0.126779
G1 X113.453 Y110.305 E.00138
G1 X113.55 Y109.714 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6645
G1 X112.151 Y109.165 E.04985
G2 X110.582 Y109.269 I-.633 J2.327 E.05314
G1 X109.45 Y109.718 E.04037
G1 X109.45 Y103.562 E.20419
G1 X113.55 Y103.562 E.13598
G1 X113.55 Y109.654 E.20206
G1 X109.608 Y110.209 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973915
G1 F6645
G1 X109.544 Y110.285 E.00044
; LINE_WIDTH: 0.111404
G1 X109.476 Y110.375 E.00063
; LINE_WIDTH: 0.147271
G1 X109.403 Y110.472 E.00103
; LINE_WIDTH: 0.181645
G1 X109.306 Y110.615 E.00195
G1 X109.329 Y110.793 F30000
; LINE_WIDTH: 0.119481
G1 F6645
G3 X109.399 Y110.379 I8.32 J1.204 E.00262
G1 X109.328 Y112.165 F30000
; LINE_WIDTH: 0.129192
G1 F6645
G1 X109.346 Y112.27 E.00075
; LINE_WIDTH: 0.161462
G1 X109.365 Y112.375 E.00103
; LINE_WIDTH: 0.148183
G2 X109.429 Y112.486 I.185 J-.032 E.00113
; LINE_WIDTH: 0.111404
G1 X109.487 Y112.572 E.00058
; LINE_WIDTH: 0.0973915
G1 X109.547 Y112.651 E.00044
G1 X109.857 Y106.229 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6645
G1 X109.857 Y107.857 E.05401
G1 X110.769 Y108.769 E.04276
G1 X110.873 Y108.747 E.00353
G1 X113.143 Y106.478 E.10647
G1 X113.143 Y104.849 E.05401
G1 X113.671 Y124.163 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.119466
G1 F6645
M73 P92 R1
G3 X113.601 Y124.577 I-8.317 J-1.203 E.00262
G1 X113.524 Y124.58 F30000
; LINE_WIDTH: 0.129166
G1 F6645
G1 X113.392 Y124.747 E.00149
G1 X113.524 Y124.58 F30000
; LINE_WIDTH: 0.179228
G1 F6645
G1 X113.593 Y124.49 E.00126
; LINE_WIDTH: 0.195631
G1 X113.694 Y124.341 E.00224
; WIPE_START
G1 F24000
G1 X113.593 Y124.49 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.6 I-.945 J-.767 P1  F30000
G1 X104.776 Y135.343 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F6645
G1 X115.332 Y135.343 E.39568
; CHANGE_LAYER
; Z_HEIGHT: 8.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X113.332 Y135.343 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 55/58
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
G3 Z8.6 I.325 J1.173 P1  F30000
G1 X149.313 Y125.36 Z8.6
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6602
G1 X148.956 Y125.477 E.01244
G3 X148.245 Y121.441 I-.456 J-2 E.22058
G1 X148.449 Y121.426 E.00679
G3 X149.367 Y125.336 I.051 J2.051 E.18578
G1 X149.282 Y124.934 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6602
G1 X149.182 Y124.989 E.00353
G3 X148.294 Y121.83 I-.682 J-1.513 E.17541
G1 X148.459 Y121.818 E.00509
G3 X149.468 Y124.824 I.041 J1.659 E.12968
G1 X149.334 Y124.903 E.00477
M204 S10000
; WIPE_START
G1 F24000
G1 X149.182 Y124.989 E-.06644
G1 X148.869 Y125.096 E-.12557
G1 X148.541 Y125.138 E-.12563
G1 X148.212 Y125.113 E-.12564
G1 X147.893 Y125.023 E-.12563
G1 X147.599 Y124.873 E-.12563
G1 X147.465 Y124.776 E-.06289
G1 X147.46 Y124.771 E-.00256
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.8 I1.201 J.195 P1  F30000
G1 X149.313 Y113.36 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6602
G1 X148.956 Y113.477 E.01244
G3 X148.245 Y109.441 I-.456 J-2 E.22058
G1 X148.449 Y109.426 E.00679
G3 X149.367 Y113.336 I.051 J2.051 E.18578
G1 X149.178 Y112.993 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6602
G1 X148.869 Y113.094 E.01001
G3 X148.294 Y109.83 I-.369 J-1.618 E.16525
G1 X148.459 Y109.818 E.00509
G3 X149.232 Y112.966 I.041 J1.659 E.13815
M204 S10000
; WIPE_START
G1 F24000
G1 X148.869 Y113.094 E-.14625
G1 X148.541 Y113.138 E-.12556
G1 X148.212 Y113.113 E-.12563
G1 X148.05 Y113.076 E-.06289
G1 X147.743 Y112.955 E-.12564
G1 X147.465 Y112.776 E-.12563
G1 X147.374 Y112.687 E-.04839
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.8 I-1.197 J.222 P1  F30000
G1 X150.898 Y131.688 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6602
G1 X150.898 Y132.08 E.01301
G1 X153.455 Y132.08 E.08483
G3 X155.604 Y135.577 I0 J2.409 E.16295
G1 X143.913 Y135.577 E.38781
G2 X146.102 Y131.6 I-14.135 J-10.371 E.15102
G1 X146.102 Y103.126 E.94452
G1 X150.898 Y103.126 E.15909
G1 X150.898 Y131.628 E.94545
G1 X151.29 Y131.688 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6602
G1 X153.46 Y131.688 E.06668
G3 X156.063 Y135.489 I-.004 J2.795 E.16639
G1 X155.867 Y135.969 E.01593
G1 X143.12 Y135.969 E.39169
G2 X145.71 Y131.52 I-13.214 J-10.671 E.15878
G1 X145.71 Y102.734 E.88452
G1 X151.29 Y102.734 E.17146
G1 X151.29 Y131.628 E.88782
M204 S10000
; WIPE_START
G1 F24000
G1 X153.289 Y131.683 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.8 I-1.157 J.376 P1  F30000
G1 X153.67 Y132.853 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6602
G3 X154.938 Y133.766 I-.199 J1.615 E.05407
G1 X154.401 Y134.303 E.02519
G1 X151.655 Y134.303 E.09111
G1 X146.857 Y129.505 E.22504
G1 X146.857 Y126.495 E.09988
G1 X147.328 Y126.024 E.02209
G2 X149.243 Y126.178 I1.166 J-2.509 E.06507
G1 X150.143 Y125.973 E.03062
G1 X150.143 Y130.885 E.16295
G1 X146.725 Y134.303 E.16031
G1 X145.648 Y134.303 E.03572
G3 X145.909 Y133.816 I96.199 J51.167 E.01829
G1 X144.742 Y135.143 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F6602
G1 X155.236 Y135.143 E.39331
; WIPE_START
G1 F24000
G1 X153.236 Y135.143 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.8 I1.194 J-.238 P1  F30000
G1 X150.55 Y121.654 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6602
G1 X150.55 Y113.242 E.27904
G1 X149.429 Y113.682 E.03995
G3 X147.423 Y113.624 I-.943 J-2.109 E.06886
G1 X146.45 Y113.242 E.03465
G1 X146.45 Y121.493 E.27371
G1 X147.755 Y121.196 E.04438
G3 X149.276 Y121.214 I.732 J2.392 E.05129
G1 X150.55 Y121.714 E.04538
G1 X150.453 Y122.305 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.126786
G1 F6602
G1 X150.571 Y122.469 E.00138
; LINE_WIDTH: 0.173115
G1 X150.629 Y122.555 E.0011
; LINE_WIDTH: 0.136069
G1 X150.654 Y122.686 E.00101
; LINE_WIDTH: 0.0969205
G1 X150.672 Y122.791 E.00047
G1 X150.601 Y124.577 F30000
; LINE_WIDTH: 0.119472
G1 F6602
G2 X150.671 Y124.163 I-8.256 J-1.619 E.00262
G1 X150.694 Y124.341 F30000
; LINE_WIDTH: 0.195634
G1 F6602
G1 X150.593 Y124.49 E.00224
; LINE_WIDTH: 0.179235
G1 X150.524 Y124.58 E.00126
; LINE_WIDTH: 0.129169
G1 X150.392 Y124.747 E.00149
G1 X147.423 Y125.624 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6602
G2 X149.152 Y125.781 I1.069 J-2.158 E.05893
G1 X150.55 Y125.462 E.04755
G1 X150.55 Y132.427 E.23102
G1 X153.728 Y132.45 E.10545
G3 X155.492 Y134.71 I-.33 J2.076 E.10461
G1 X144.97 Y134.71 E.34904
G2 X145.733 Y133.278 I-233.726 J-125.449 E.0538
G2 X146.45 Y131.67 I-17.693 J-8.858 E.05844
G1 X146.45 Y125.242 E.21324
G1 X147.367 Y125.602 E.03266
G1 X146.547 Y124.651 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973914
G1 F6602
G1 X146.487 Y124.572 E.00044
; LINE_WIDTH: 0.111409
G1 X146.429 Y124.486 E.00058
; LINE_WIDTH: 0.148185
G3 X146.365 Y124.375 I.121 J-.144 E.00113
; LINE_WIDTH: 0.161458
G1 X146.346 Y124.27 E.00103
; LINE_WIDTH: 0.129189
G1 X146.328 Y124.165 E.00075
G1 X146.399 Y122.379 F30000
; LINE_WIDTH: 0.119474
G1 F6602
G2 X146.329 Y122.793 I8.236 J1.616 E.00262
G1 X146.306 Y122.615 F30000
; LINE_WIDTH: 0.181642
G1 F6602
G1 X146.403 Y122.472 E.00195
; LINE_WIDTH: 0.147268
G1 X146.476 Y122.375 E.00103
; LINE_WIDTH: 0.111402
G1 X146.544 Y122.285 E.00063
; LINE_WIDTH: 0.0973912
G1 X146.608 Y122.209 E.00044
G1 X146.857 Y120.447 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6602
G1 X146.857 Y118.819 E.05401
G1 X150.143 Y115.533 E.15411
G1 X150.143 Y117.439 E.0632
G1 X146.857 Y114.154 E.15411
G1 X146.857 Y113.839 E.01044
G1 X147.274 Y114.002 E.01485
G2 X148.1 Y114.248 I1.022 J-1.92 E.02878
G1 X146.547 Y112.651 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.097391
G1 F6602
G1 X146.487 Y112.572 E.00044
; LINE_WIDTH: 0.111401
G1 X146.429 Y112.486 E.00058
; LINE_WIDTH: 0.148175
G3 X146.365 Y112.375 I.121 J-.144 E.00113
; LINE_WIDTH: 0.161462
G1 X146.346 Y112.27 E.00103
; LINE_WIDTH: 0.129191
G1 X146.328 Y112.165 E.00075
G1 X146.399 Y110.379 F30000
; LINE_WIDTH: 0.119468
G1 F6602
G2 X146.329 Y110.793 I8.26 J1.62 E.00262
G1 X146.306 Y110.615 F30000
; LINE_WIDTH: 0.181657
G1 F6602
G1 X146.403 Y110.472 E.00195
; LINE_WIDTH: 0.147279
G1 X146.476 Y110.375 E.00103
; LINE_WIDTH: 0.11141
G1 X146.544 Y110.285 E.00063
; LINE_WIDTH: 0.0973917
G1 X146.608 Y110.209 E.00044
; WIPE_START
G1 F24000
G1 X146.544 Y110.285 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.8 I-.656 J1.025 P1  F30000
G1 X150.392 Y112.747 Z8.8
G1 Z8.4
G1 E.8 F1800
; LINE_WIDTH: 0.129165
G1 F6602
G1 X150.524 Y112.58 E.00149
; LINE_WIDTH: 0.179228
G1 X150.593 Y112.49 E.00126
; LINE_WIDTH: 0.195634
G1 X150.694 Y112.341 E.00224
G1 X150.671 Y112.163 F30000
; LINE_WIDTH: 0.11947
G1 F6602
G3 X150.601 Y112.577 I-8.328 J-1.205 E.00262
G1 X150.672 Y110.791 F30000
; LINE_WIDTH: 0.0969205
G1 F6602
G1 X150.654 Y110.686 E.00047
; LINE_WIDTH: 0.136064
G1 X150.629 Y110.555 E.00101
; LINE_WIDTH: 0.173106
G1 X150.571 Y110.469 E.0011
; LINE_WIDTH: 0.126778
G1 X150.453 Y110.305 E.00138
G1 X150.55 Y109.714 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6602
G1 X148.94 Y109.128 E.05683
G2 X147.582 Y109.269 I-.449 J2.282 E.04598
G1 X146.45 Y109.718 E.04037
G1 X146.45 Y103.562 E.20419
G1 X150.55 Y103.562 E.13598
G1 X150.55 Y109.654 E.20206
G1 X150.143 Y106.229 F30000
G1 F6602
G1 X150.143 Y107.857 E.05401
G1 X149.234 Y108.766 E.04263
G1 X149.127 Y108.747 E.0036
G1 X146.857 Y106.478 E.10648
G1 X146.857 Y104.849 E.05401
; WIPE_START
G1 F24000
G1 X146.857 Y106.478 E-.61876
G1 X147.12 Y106.74 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.8 I-.574 J-1.073 P1  F30000
G1 X112.373 Y125.332 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6602
G1 X112.343 Y125.347 E.00111
G3 X111.245 Y121.441 I-.843 J-1.87 E.23414
G1 X111.449 Y121.426 E.00679
G3 X112.697 Y125.143 I.051 J2.051 E.17309
G1 X112.425 Y125.302 E.01045
G1 X112.282 Y124.934 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6602
G1 X112.182 Y124.989 E.00353
G3 X111.294 Y121.83 I-.682 J-1.513 E.17541
G1 X111.459 Y121.818 E.00509
G3 X112.468 Y124.824 I.041 J1.659 E.12968
G1 X112.334 Y124.903 E.00477
M204 S10000
; WIPE_START
G1 F24000
G1 X112.182 Y124.989 E-.06644
G1 X111.869 Y125.096 E-.12557
G1 X111.541 Y125.138 E-.12563
G1 X111.212 Y125.113 E-.12564
G1 X110.893 Y125.023 E-.12563
G1 X110.599 Y124.873 E-.12563
G1 X110.465 Y124.776 E-.06289
G1 X110.46 Y124.771 E-.00256
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.8 I1.209 J.14 P1  F30000
G1 X112.218 Y109.558 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6602
G1 X112.25 Y109.567 E.00111
G3 X111.245 Y109.441 I-.75 J1.91 E.39364
G1 X111.449 Y109.426 E.00679
G3 X111.856 Y109.456 I.051 J2.051 E.01358
G1 X112.16 Y109.542 E.01046
G1 X112.107 Y109.932 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6602
G3 X111.294 Y109.83 I-.607 J1.544 E.2949
G1 X111.459 Y109.818 E.00509
G3 X112.05 Y109.912 I.041 J1.659 E.01851
M204 S10000
; WIPE_START
G1 F24000
G1 X112.401 Y110.083 E-.14826
G1 X112.659 Y110.289 E-.12563
G1 X112.872 Y110.543 E-.12564
G1 X113.03 Y110.833 E-.12564
G1 X113.127 Y111.149 E-.12564
G1 X113.157 Y111.435 E-.1092
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.8 I-1.194 J-.235 P1  F30000
G1 X109.102 Y132.08 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6602
G1 X109.102 Y103.126 E.96045
G1 X113.898 Y103.126 E.15909
G1 X113.898 Y131.6 E.94452
G2 X116.087 Y135.577 I16.324 J-6.394 E.15102
G1 X104.401 Y135.577 E.38765
G3 X106.545 Y132.08 I2.145 J-1.09 E.16289
G1 X109.042 Y132.08 E.08284
G1 X108.71 Y131.688 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6602
G1 X108.71 Y102.734 E.88967
G1 X114.29 Y102.734 E.17146
G1 X114.29 Y131.52 E.88452
G2 X116.888 Y135.969 I15.771 J-6.228 E.15891
G1 X104.142 Y135.969 E.39166
G3 X103.748 Y134.464 I3.17 J-1.634 E.04818
G3 X106.54 Y131.688 I2.798 J.022 E.13421
G1 X108.65 Y131.688 E.06484
M204 S10000
; WIPE_START
G1 F24000
G1 X108.654 Y129.688 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.8 I-.981 J-.72 P1  F30000
G1 X106.33 Y132.854 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6602
G2 X105.063 Y133.766 I.196 J1.607 E.05405
G1 X105.599 Y134.303 E.02515
G1 X108.345 Y134.303 E.09111
G1 X113.143 Y129.505 E.22504
G1 X113.143 Y126.495 E.09988
G1 X112.718 Y126.07 E.01992
G1 X112.14 Y126.202 E.01967
G3 X110.274 Y126.002 I-.61 J-3.126 E.06318
G1 X109.857 Y125.839 E.01485
G1 X109.857 Y130.885 E.1674
G1 X113.275 Y134.303 E.16031
G1 X114.352 Y134.303 E.03572
G2 X114.092 Y133.816 I-95.283 J50.678 E.01829
G1 X110.423 Y125.624 F30000
G1 F6602
G2 X112.049 Y125.805 I1.102 J-2.499 E.05514
G1 X113.55 Y125.462 E.05105
G1 X113.55 Y131.67 E.20592
G1 X113.634 Y131.871 E.00723
G2 X115.03 Y134.71 I22.177 J-9.139 E.10501
G1 X104.504 Y134.683 E.34915
G3 X106.33 Y132.44 I2.141 J-.121 E.10525
G1 X109.45 Y132.427 E.10352
G1 X109.45 Y125.242 E.23834
G1 X110.367 Y125.602 E.03266
G1 X109.547 Y124.651 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973917
G1 F6602
G1 X109.487 Y124.572 E.00044
; LINE_WIDTH: 0.111408
G1 X109.429 Y124.486 E.00058
; LINE_WIDTH: 0.148186
G3 X109.365 Y124.375 I.121 J-.144 E.00113
; LINE_WIDTH: 0.161462
G1 X109.346 Y124.27 E.00103
; LINE_WIDTH: 0.129191
G1 X109.328 Y124.165 E.00075
G1 X109.329 Y122.793 F30000
; LINE_WIDTH: 0.119477
G1 F6602
G3 X109.399 Y122.379 I8.389 J1.214 E.00262
G1 X109.476 Y122.375 F30000
; LINE_WIDTH: 0.111402
G1 F6602
G1 X109.544 Y122.285 E.00063
; LINE_WIDTH: 0.0973911
G1 X109.608 Y122.209 E.00044
G1 X109.476 Y122.375 F30000
; LINE_WIDTH: 0.147268
G1 F6602
G1 X109.403 Y122.472 E.00103
; LINE_WIDTH: 0.181644
G1 X109.306 Y122.615 E.00195
; WIPE_START
G1 F24000
G1 X109.403 Y122.472 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.8 I.05 J1.216 P1  F30000
G1 X113.453 Y122.305 Z8.8
G1 Z8.4
G1 E.8 F1800
; LINE_WIDTH: 0.126783
G1 F6602
G1 X113.571 Y122.469 E.00138
; LINE_WIDTH: 0.173112
G1 X113.629 Y122.555 E.0011
; LINE_WIDTH: 0.136067
G1 X113.654 Y122.686 E.00101
; LINE_WIDTH: 0.0969205
G1 X113.672 Y122.791 E.00047
G1 X113.55 Y121.714 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6602
G1 X112.276 Y121.214 E.04537
G2 X110.755 Y121.196 I-.79 J2.373 E.0513
G1 X109.45 Y121.493 E.04438
G1 X109.45 Y113.242 E.27371
G1 X110.423 Y113.624 E.03465
G2 X112.429 Y113.682 I1.063 J-2.051 E.06886
G1 X113.55 Y113.242 E.03995
G1 X113.55 Y121.654 E.27904
G1 X113.143 Y120.447 F30000
G1 F6602
G1 X113.143 Y118.819 E.05401
G1 X109.857 Y115.533 E.15411
G1 X109.857 Y117.439 E.0632
G1 X113.143 Y114.154 E.15411
G1 X113.143 Y113.839 E.01044
G3 X112.327 Y114.159 I-4.688 J-10.744 E.02906
G3 X111.902 Y114.256 I-1.368 J-5.015 E.01447
G1 X113.392 Y112.747 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.129164
G1 F6602
G1 X113.524 Y112.58 E.00149
; LINE_WIDTH: 0.179226
G1 X113.593 Y112.49 E.00126
; LINE_WIDTH: 0.195631
G1 X113.694 Y112.341 E.00224
G1 X113.671 Y112.163 F30000
; LINE_WIDTH: 0.119466
G1 F6602
G3 X113.601 Y112.577 I-8.318 J-1.204 E.00262
G1 X113.672 Y110.791 F30000
; LINE_WIDTH: 0.0969205
G1 F6602
G1 X113.654 Y110.686 E.00047
; LINE_WIDTH: 0.136062
G1 X113.629 Y110.555 E.00101
; LINE_WIDTH: 0.173103
G1 X113.571 Y110.469 E.0011
; LINE_WIDTH: 0.126776
G1 X113.453 Y110.305 E.00138
G1 X113.55 Y109.714 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6602
G1 X111.94 Y109.128 E.05683
G2 X110.582 Y109.269 I-.449 J2.282 E.04598
G1 X109.45 Y109.718 E.04037
G1 X109.45 Y103.562 E.20419
G1 X113.55 Y103.562 E.13598
G1 X113.55 Y109.654 E.20206
G1 X109.608 Y110.209 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973915
G1 F6602
G1 X109.544 Y110.285 E.00044
; LINE_WIDTH: 0.111411
G1 X109.476 Y110.375 E.00063
; LINE_WIDTH: 0.147281
G1 X109.403 Y110.472 E.00103
; LINE_WIDTH: 0.181659
G1 X109.306 Y110.615 E.00195
G1 X109.329 Y110.793 F30000
; LINE_WIDTH: 0.119472
G1 F6602
G3 X109.399 Y110.379 I8.327 J1.205 E.00262
G1 X109.328 Y112.165 F30000
; LINE_WIDTH: 0.129193
G1 F6602
G1 X109.346 Y112.27 E.00075
; LINE_WIDTH: 0.161466
G1 X109.365 Y112.375 E.00103
; LINE_WIDTH: 0.14818
G2 X109.429 Y112.486 I.185 J-.032 E.00113
; LINE_WIDTH: 0.111406
G1 X109.487 Y112.572 E.00058
; LINE_WIDTH: 0.0973913
G1 X109.547 Y112.651 E.00044
G1 X109.857 Y106.229 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6602
G1 X109.857 Y107.857 E.05401
M73 P93 R1
G1 X110.769 Y108.769 E.04276
G1 X110.873 Y108.747 E.00353
G1 X113.143 Y106.478 E.10647
G1 X113.143 Y104.849 E.05401
G1 X113.671 Y124.163 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.119468
G1 F6602
G3 X113.601 Y124.577 I-8.316 J-1.203 E.00262
G1 X113.524 Y124.58 F30000
; LINE_WIDTH: 0.129167
G1 F6602
G1 X113.392 Y124.747 E.00149
G1 X113.524 Y124.58 F30000
; LINE_WIDTH: 0.179231
G1 F6602
G1 X113.593 Y124.49 E.00126
; LINE_WIDTH: 0.19563
G1 X113.694 Y124.341 E.00224
; WIPE_START
G1 F24000
G1 X113.593 Y124.49 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.8 I-.934 J-.78 P1  F30000
G1 X104.703 Y135.143 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F6602
G1 X115.198 Y135.143 E.39339
M106 S242.25
; CHANGE_LAYER
; Z_HEIGHT: 8.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X113.198 Y135.143 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 56/58
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
G3 Z8.8 I.319 J1.174 P1  F30000
G1 X149.496 Y125.269 Z8.8
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X149.153 Y125.421 E.01244
G3 X148.245 Y121.441 I-.653 J-1.945 E.22736
G1 X148.449 Y121.426 E.00679
G3 X149.548 Y125.24 I.051 J2.051 E.179
G1 X149.324 Y124.918 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X149.028 Y125.05 E.00996
G3 X148.294 Y121.83 I-.528 J-1.573 E.17033
G1 X148.459 Y121.818 E.00509
G3 X149.375 Y124.887 I.041 J1.659 E.13312
M204 S10000
; WIPE_START
G1 F24000
G1 X149.028 Y125.05 E-.14567
G1 X148.706 Y125.125 E-.12557
G1 X148.376 Y125.133 E-.12563
G1 X148.05 Y125.076 E-.12563
G1 X147.743 Y124.955 E-.12564
G1 X147.495 Y124.796 E-.11187
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9 I1.203 J.185 P1  F30000
G1 X149.246 Y113.379 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X149.056 Y113.451 E.00675
G3 X148.245 Y109.441 I-.556 J-1.975 E.22399
G1 X148.449 Y109.426 E.00679
G3 X149.435 Y113.302 I.051 J2.051 E.18327
G1 X149.302 Y113.357 E.00478
G1 X149.17 Y112.991 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X149.106 Y113.021 E.0022
G3 X148.294 Y109.83 I-.606 J-1.545 E.17287
G1 X148.459 Y109.818 E.00509
G3 X149.4 Y112.871 I.041 J1.659 E.13222
G1 X149.224 Y112.963 E.00611
M204 S10000
; WIPE_START
G1 F24000
G1 X149.106 Y113.021 E-.04997
G1 X148.803 Y113.11 E-.11979
G1 X148.541 Y113.138 E-.10005
G1 X148.212 Y113.113 E-.12564
G1 X147.893 Y113.023 E-.12563
G1 X147.599 Y112.873 E-.12563
G1 X147.366 Y112.687 E-.11329
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9 I-1.193 J.241 P1  F30000
G1 X151.29 Y132.08 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X153.455 Y132.08 E.07183
G3 X155.686 Y135.377 I.001 J2.403 E.15562
G1 X144.069 Y135.377 E.38536
G2 X146.102 Y131.6 I-15.262 J-10.649 E.1426
G1 X146.102 Y103.214 E.9416
G1 X150.898 Y103.214 E.15909
G1 X150.898 Y132.08 E.95753
G1 X151.23 Y132.08 E.01102
G1 X151.29 Y131.688 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X153.46 Y131.688 E.06668
G3 X155.949 Y135.769 I-.006 J2.803 E.17589
G1 X143.279 Y135.769 E.3893
G2 X145.71 Y131.52 I-13.679 J-10.645 E.1509
G1 X145.71 Y102.822 E.88182
G1 X151.29 Y102.822 E.17146
G1 X151.29 Y131.628 E.88512
M204 S10000
; WIPE_START
G1 F24000
G1 X153.289 Y131.683 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9 I-1.16 J.368 P1  F30000
G1 X154.409 Y135.209 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.409319
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X155.482 Y134.458 E.07021
G2 X155.415 Y133.944 I-1.552 J-.059 E.02791
G1 X153.897 Y135.006 E.09931
G1 X153.096 Y135.006 E.04294
G1 X155.234 Y133.509 E.13994
G2 X154.972 Y133.132 I-1.247 J.59 E.02474
G1 X152.295 Y135.006 E.17517
G1 X151.494 Y135.007 E.04294
G1 X154.621 Y132.817 E.20465
G2 X154.163 Y132.577 I-1.14 J1.619 E.0278
G1 X150.694 Y135.007 E.22709
G1 X149.893 Y135.007 E.04294
G1 X153.529 Y132.461 E.23798
G1 X152.733 Y132.457 E.04268
G1 X149.092 Y135.007 E.2383
G1 X148.291 Y135.007 E.04294
G1 X151.937 Y132.454 E.23862
G1 X151.141 Y132.451 E.04268
G1 X147.49 Y135.007 E.23894
G1 X146.689 Y135.007 E.04294
G1 X150.528 Y132.319 E.25127
G1 X150.528 Y131.758 E.03006
G1 X145.888 Y135.007 E.30369
G1 X145.087 Y135.007 E.04293
G1 X150.528 Y131.197 E.3561
G1 X150.528 Y130.637 E.03006
G1 X145.163 Y134.393 E.35115
G1 X145.64 Y133.499 E.05433
G1 X150.528 Y130.076 E.31996
G1 X150.528 Y129.515 E.03006
G1 X146.06 Y132.644 E.29247
G2 X146.4 Y131.845 I-8.508 J-4.095 E.04657
G1 X150.528 Y128.954 E.27021
G1 X150.528 Y128.394 E.03006
G1 X146.472 Y131.234 E.26549
G1 X146.472 Y130.673 E.03006
G1 X150.528 Y127.833 E.26549
G1 X150.528 Y127.272 E.03006
G1 X146.472 Y130.113 E.26549
G1 X146.472 Y129.552 E.03006
G1 X150.528 Y126.712 E.26549
G1 X150.528 Y126.151 E.03006
G1 X146.472 Y128.991 E.26549
G1 X146.472 Y128.43 E.03006
G1 X150.528 Y125.59 E.26549
G1 X150.528 Y125.489 E.0054
G1 X149.554 Y125.712 E.05359
G1 X146.472 Y127.87 E.20171
G1 X146.472 Y127.309 E.03006
G1 X148.497 Y125.891 E.13254
G1 X148.319 Y125.895 E.00955
G1 X147.822 Y125.803 E.02711
G1 X146.472 Y126.748 E.08835
G1 X146.472 Y126.188 E.03006
G1 X147.308 Y125.602 E.05476
G1 X146.795 Y125.4 E.02956
G1 X146.269 Y125.769 E.03443
M106 S242.25
G1 X146.402 Y124.901 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
; LAYER_HEIGHT: 0.2
G1 F15000
G1 X146.338 Y124.938 E.00204
G1 X146.402 Y124.975 E.00204
G1 X146.423 Y124.938 E.00118
G1 X146.648 Y124.936 E.00624
G1 X146.648 Y125.01 E.00204
G1 X146.66 Y125.003 E.00038
G1 X146.547 Y124.651 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973915
G1 F15000
G1 X146.487 Y124.572 E.00044
; LINE_WIDTH: 0.111404
G1 X146.429 Y124.486 E.00058
; LINE_WIDTH: 0.148182
G3 X146.365 Y124.375 I.121 J-.144 E.00113
; LINE_WIDTH: 0.161458
G1 X146.346 Y124.27 E.00103
; LINE_WIDTH: 0.129189
G1 X146.328 Y124.165 E.00075
G1 X146.328 Y122.791 F30000
; LINE_WIDTH: 0.124518
G1 F15000
G1 X146.344 Y122.699 E.00062
; LINE_WIDTH: 0.152116
G1 X146.36 Y122.606 E.00083
; LINE_WIDTH: 0.153605
G1 X146.406 Y122.372 E.00215
G1 X146.478 Y122.373 F30000
; LINE_WIDTH: 0.111408
G1 F15000
G1 X146.544 Y122.285 E.00061
; LINE_WIDTH: 0.0973917
G1 X146.608 Y122.209 E.00044
G1 X146.478 Y122.373 F30000
; LINE_WIDTH: 0.145812
G1 F15000
G1 X146.408 Y122.465 E.00097
; LINE_WIDTH: 0.178937
G1 X146.306 Y122.612 E.00199
G1 X146.43 Y121.834 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
G1 F15000
G1 X146.523 Y121.791 E.00284
G1 X146.675 Y121.811 E.00425
G1 X150.352 Y121.946 F30000
G1 F15000
G1 X150.288 Y121.983 E.00204
G1 X150.337 Y122.011 E.00155
G1 X150.453 Y122.305 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.126788
G1 F15000
G1 X150.571 Y122.469 E.00138
; LINE_WIDTH: 0.173122
G1 X150.629 Y122.555 E.0011
; LINE_WIDTH: 0.136072
G1 X150.654 Y122.686 E.00101
; LINE_WIDTH: 0.0969206
G1 X150.672 Y122.791 E.00047
G1 X150.672 Y124.165 F30000
; LINE_WIDTH: 0.12452
G1 F15000
G1 X150.656 Y124.257 E.00062
; LINE_WIDTH: 0.15212
G1 X150.64 Y124.349 E.00083
; LINE_WIDTH: 0.153609
G1 X150.595 Y124.583 E.00215
G1 X150.522 Y124.583 F30000
; LINE_WIDTH: 0.177036
G1 F15000
G1 X150.589 Y124.495 E.0012
; LINE_WIDTH: 0.195615
G1 X150.694 Y124.343 E.00231
G1 X150.522 Y124.583 F30000
; LINE_WIDTH: 0.128307
G1 F15000
G1 X150.392 Y124.747 E.00145
G1 X150.266 Y125.137 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.39542
G1 F15000
G1 X150.526 Y125.156 E.00748
G1 X150.731 Y121.332 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.40346
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X149.636 Y121.332 E.05702
G1 X149.157 Y121.144 E.02683
G1 X148.681 Y121.06 E.02515
G1 X148.199 Y121.072 E.02515
G1 X147.059 Y121.332 E.06086
G1 X146.472 Y121.332 E.03061
G1 X146.472 Y120.879 E.02362
G1 X150.528 Y120.879 E.2113
G1 X150.528 Y120.425 E.02362
G1 X146.472 Y120.425 E.2113
G1 X146.472 Y119.972 E.02362
G1 X150.528 Y119.972 E.2113
G1 X150.528 Y119.518 E.02362
G1 X146.472 Y119.518 E.2113
G1 X146.472 Y119.065 E.02362
G1 X150.528 Y119.065 E.2113
G1 X150.528 Y118.611 E.02362
G1 X146.472 Y118.611 E.2113
G1 X146.472 Y118.158 E.02362
G1 X150.528 Y118.158 E.2113
G1 X150.528 Y117.705 E.02362
G1 X146.472 Y117.705 E.2113
G1 X146.472 Y117.251 E.02362
G1 X150.528 Y117.251 E.2113
G1 X150.528 Y116.798 E.02362
G1 X146.472 Y116.798 E.2113
G1 X146.472 Y116.344 E.02362
G1 X150.528 Y116.344 E.2113
G1 X150.528 Y115.891 E.02362
G1 X146.472 Y115.891 E.2113
G1 X146.472 Y115.437 E.02362
G1 X150.528 Y115.437 E.2113
G1 X150.528 Y114.984 E.02362
G1 X146.472 Y114.984 E.2113
G1 X146.472 Y114.53 E.02362
G1 X150.528 Y114.53 E.2113
G1 X150.528 Y114.077 E.02362
G1 X146.472 Y114.077 E.2113
G1 X146.472 Y113.623 E.02362
G1 X147.364 Y113.623 E.04647
G1 X147.843 Y113.812 E.02683
G2 X149.161 Y113.81 I.655 J-2.691 E.06931
G1 X149.636 Y113.623 E.02657
G1 X150.731 Y113.623 E.05701
M106 S242.25
G1 X150.353 Y112.936 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
; LAYER_HEIGHT: 0.2
G1 F15000
G1 X150.29 Y112.973 E.00204
G1 X150.338 Y113.001 E.00155
G1 X150.453 Y112.651 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.126779
G1 F15000
G1 X150.571 Y112.486 E.00138
; LINE_WIDTH: 0.173104
G1 X150.629 Y112.401 E.0011
; LINE_WIDTH: 0.136063
G1 X150.654 Y112.27 E.00101
; LINE_WIDTH: 0.0969204
G1 X150.672 Y112.165 E.00047
G1 X150.672 Y110.791 F30000
; LINE_WIDTH: 0.0969201
G1 F15000
G1 X150.654 Y110.686 E.00047
; LINE_WIDTH: 0.136066
G1 X150.629 Y110.555 E.00101
; LINE_WIDTH: 0.173112
G1 X150.571 Y110.469 E.0011
; LINE_WIDTH: 0.126781
G1 X150.453 Y110.305 E.00138
G1 X150.352 Y109.946 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
G1 F15000
G1 X150.288 Y109.983 E.00204
G1 X150.337 Y110.011 E.00155
G1 X146.689 Y109.948 F30000
G1 F15000
G1 X146.625 Y109.985 E.00204
G1 X146.674 Y110.013 E.00155
G1 X146.547 Y110.305 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973913
G1 F15000
G1 X146.487 Y110.384 E.00044
; LINE_WIDTH: 0.111391
G1 X146.429 Y110.469 E.00058
; LINE_WIDTH: 0.148169
G2 X146.365 Y110.581 I.121 J.144 E.00113
; LINE_WIDTH: 0.161453
G1 X146.346 Y110.686 E.00103
; LINE_WIDTH: 0.129186
G1 X146.328 Y110.791 E.00075
G1 X146.269 Y109.448 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.400917
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X147.128 Y109.426 E.04417
G1 X147.816 Y109.153 E.03809
G3 X149.157 Y109.144 I.688 J2.659 E.06965
G1 X149.711 Y109.362 E.03065
G1 X150.528 Y109.341 E.04203
G1 X150.528 Y108.89 E.0232
G1 X146.472 Y108.991 E.20871
G1 X146.472 Y108.54 E.0232
G1 X150.528 Y108.439 E.20871
G1 X150.528 Y107.988 E.0232
G1 X146.472 Y108.089 E.20871
G1 X146.472 Y107.638 E.0232
G1 X150.528 Y107.537 E.20871
G1 X150.528 Y107.086 E.0232
G1 X146.472 Y107.187 E.20871
G1 X146.472 Y106.736 E.0232
G1 X150.528 Y106.635 E.20871
G1 X150.528 Y106.184 E.0232
G1 X146.472 Y106.285 E.20871
G1 X146.472 Y105.834 E.0232
G1 X150.528 Y105.733 E.20871
G1 X150.528 Y105.282 E.0232
G1 X146.472 Y105.383 E.20871
G1 X146.472 Y104.932 E.0232
G1 X150.528 Y104.831 E.20871
G1 X150.528 Y104.38 E.0232
G1 X146.472 Y104.481 E.20871
G1 X146.472 Y104.03 E.0232
G1 X150.731 Y103.924 E.21913
M106 S242.25
G1 X146.328 Y112.165 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.129188
; LAYER_HEIGHT: 0.2
G1 F15000
G1 X146.346 Y112.27 E.00075
; LINE_WIDTH: 0.161454
G1 X146.365 Y112.375 E.00103
; LINE_WIDTH: 0.148173
G2 X146.429 Y112.486 I.185 J-.032 E.00113
; LINE_WIDTH: 0.111395
G1 X146.487 Y112.572 E.00058
; LINE_WIDTH: 0.0973905
G1 X146.547 Y112.651 E.00044
G1 X146.402 Y112.901 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
G1 F15000
G1 X146.338 Y112.938 E.00204
G1 X146.402 Y112.975 E.00204
G1 X146.423 Y112.938 E.00118
G1 X146.648 Y112.936 E.00624
G1 X146.648 Y113.01 E.00204
G1 X146.66 Y113.003 E.00038
; WIPE_START
G1 F24000
G1 X146.648 Y113.01 E-.0206
G1 X146.648 Y112.936 E-.11139
G1 X146.423 Y112.938 E-.34091
G1 X146.402 Y112.975 E-.06431
G1 X146.338 Y112.938 E-.11139
G1 X146.402 Y112.901 E-.11139
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9 I-.417 J-1.143 P1  F30000
G1 X112.496 Y125.269 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X112.153 Y125.421 E.01244
G3 X111.245 Y121.441 I-.653 J-1.945 E.22736
G1 X111.449 Y121.426 E.00679
G3 X112.548 Y125.24 I.051 J2.051 E.179
G1 X112.324 Y124.918 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X112.028 Y125.05 E.00996
G3 X111.294 Y121.83 I-.528 J-1.573 E.17033
G1 X111.459 Y121.818 E.00509
G3 X112.375 Y124.887 I.041 J1.659 E.13312
M204 S10000
; WIPE_START
G1 F24000
G1 X112.028 Y125.05 E-.14567
G1 X111.706 Y125.125 E-.12557
G1 X111.376 Y125.133 E-.12563
G1 X111.05 Y125.076 E-.12563
G1 X110.743 Y124.955 E-.12564
G1 X110.495 Y124.796 E-.11187
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9 I1.209 J.142 P1  F30000
G1 X112.28 Y109.582 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X112.614 Y109.754 E.01245
G3 X111.245 Y109.441 I-1.114 J1.723 E.38006
G1 X111.449 Y109.426 E.00679
G3 X112.225 Y109.558 I.051 J2.051 E.02629
G1 X112.107 Y109.932 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X111.294 Y109.83 I-.607 J1.544 E.2949
G1 X111.459 Y109.818 E.00509
G3 X112.05 Y109.912 I.041 J1.659 E.01851
M204 S10000
; WIPE_START
G1 F24000
G1 X112.401 Y110.083 E-.14826
G1 X112.659 Y110.289 E-.12564
G1 X112.872 Y110.543 E-.12564
G1 X113.03 Y110.833 E-.12563
G1 X113.127 Y111.149 E-.12562
G1 X113.156 Y111.435 E-.10921
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9 I-1.194 J-.234 P1  F30000
G1 X109.102 Y132.08 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X109.102 Y103.214 E.95753
G1 X113.898 Y103.214 E.15909
G1 X113.898 Y131.6 E.9416
G2 X115.931 Y135.377 I17.295 J-6.872 E.1426
G1 X104.313 Y135.377 E.38537
G3 X106.545 Y132.08 I2.227 J-.896 E.15571
G1 X109.042 Y132.08 E.08284
G1 X108.71 Y131.688 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X108.71 Y102.822 E.88696
G1 X114.29 Y102.822 E.17146
G1 X114.29 Y131.52 E.88182
G2 X116.725 Y135.769 I15.93 J-6.308 E.15098
G1 X104.056 Y135.769 E.38927
G3 X106.54 Y131.688 I2.491 J-1.28 E.1758
G1 X108.65 Y131.688 E.06484
M204 S10000
; WIPE_START
G1 F24000
G1 X108.654 Y129.688 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9 I-1.114 J-.489 P1  F30000
G1 X106.232 Y135.21 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.405041
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X104.514 Y134.535 E.09692
G3 X104.563 Y134.066 I1.378 J-.092 E.0249
G1 X106.962 Y135.007 E.13526
G1 X108.207 Y135.007 E.06539
G1 X104.698 Y133.63 E.19792
G1 X104.941 Y133.236 E.02427
G1 X109.453 Y135.007 E.25448
G1 X110.698 Y135.007 E.06539
G1 X105.293 Y132.885 E.30487
G3 X105.795 Y132.594 I1.344 J1.734 E.03057
G1 X111.944 Y135.007 E.3468
G1 X113.189 Y135.007 E.06539
G1 X106.699 Y132.46 E.36604
G1 X107.931 Y132.455 E.0647
G1 X114.435 Y135.007 E.36678
G1 X115.164 Y135.007 E.03827
G1 X115.027 Y134.751 E.01525
G1 X109.164 Y132.449 E.33069
G1 X109.472 Y132.448 E.01617
G1 X109.472 Y132.081 E.01925
G1 X114.698 Y134.133 E.29475
G1 X114.369 Y133.515 E.03677
G1 X109.472 Y131.593 E.27617
G1 X109.472 Y131.104 E.02566
M73 P94 R1
G1 X114.066 Y132.907 E.25909
G3 X113.797 Y132.313 I6.32 J-3.212 E.03424
G1 X109.472 Y130.615 E.24395
G1 X109.472 Y130.126 E.02566
G1 X113.55 Y131.727 E.23002
G1 X113.528 Y131.674 E.00299
G1 X113.528 Y131.229 E.02337
G1 X109.472 Y129.637 E.22877
G1 X109.472 Y129.148 E.02566
G1 X113.528 Y130.741 E.22877
G1 X113.528 Y130.252 E.02566
G1 X109.472 Y128.66 E.22877
G1 X109.472 Y128.171 E.02566
G1 X113.528 Y129.763 E.22877
G1 X113.528 Y129.274 E.02566
G1 X109.472 Y127.682 E.22877
G1 X109.472 Y127.193 E.02566
G1 X113.528 Y128.785 E.22877
G1 X113.528 Y128.296 E.02566
G1 X109.472 Y126.704 E.22877
G1 X109.472 Y126.215 E.02566
G1 X113.528 Y127.808 E.22877
G1 X113.528 Y127.319 E.02566
G1 X109.472 Y125.727 E.22877
G1 X109.472 Y125.273 E.0238
G1 X110.843 Y125.812 E.07735
G1 X111.008 Y125.841 E.00876
G1 X113.528 Y126.83 E.14215
G1 X113.528 Y126.341 E.02566
G1 X112.156 Y125.802 E.07738
G1 X112.944 Y125.623 E.04241
G1 X113.731 Y125.932 E.04439
M106 S242.25
G1 X113.266 Y125.137 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.39543
; LAYER_HEIGHT: 0.2
G1 F15000
G1 X113.526 Y125.156 E.00748
G1 X113.392 Y124.747 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.128307
G1 F15000
G1 X113.522 Y124.583 E.00145
; LINE_WIDTH: 0.177035
G1 X113.589 Y124.495 E.0012
; LINE_WIDTH: 0.195611
G1 X113.694 Y124.343 E.0023
G1 X113.64 Y124.349 F30000
; LINE_WIDTH: 0.152116
G1 F15000
G1 X113.656 Y124.257 E.00083
; LINE_WIDTH: 0.124518
G1 X113.672 Y124.165 E.00062
G1 X113.64 Y124.349 F30000
; LINE_WIDTH: 0.153605
G1 F15000
G1 X113.594 Y124.583 E.00215
G1 X113.672 Y122.791 F30000
; LINE_WIDTH: 0.0969206
G1 F15000
G1 X113.654 Y122.686 E.00047
; LINE_WIDTH: 0.136069
G1 X113.629 Y122.555 E.00101
; LINE_WIDTH: 0.173117
G1 X113.571 Y122.469 E.0011
; LINE_WIDTH: 0.126786
G1 X113.453 Y122.305 E.00138
G1 X113.352 Y121.946 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
G1 F15000
G1 X113.288 Y121.983 E.00204
G1 X113.337 Y122.011 E.00155
G1 X113.731 Y121.332 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.40346
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X112.636 Y121.332 E.05702
G1 X112.157 Y121.144 E.02683
G1 X111.681 Y121.06 E.02515
G1 X111.199 Y121.072 E.02515
G1 X110.059 Y121.332 E.06086
G1 X109.472 Y121.332 E.03061
G1 X109.472 Y120.879 E.02362
G1 X113.528 Y120.879 E.2113
G1 X113.528 Y120.425 E.02362
G1 X109.472 Y120.425 E.2113
G1 X109.472 Y119.972 E.02362
G1 X113.528 Y119.972 E.2113
G1 X113.528 Y119.518 E.02362
G1 X109.472 Y119.518 E.2113
G1 X109.472 Y119.065 E.02362
G1 X113.528 Y119.065 E.2113
G1 X113.528 Y118.611 E.02362
G1 X109.472 Y118.611 E.2113
G1 X109.472 Y118.158 E.02362
G1 X113.528 Y118.158 E.2113
G1 X113.528 Y117.705 E.02362
G1 X109.472 Y117.705 E.2113
G1 X109.472 Y117.251 E.02362
G1 X113.528 Y117.251 E.2113
G1 X113.528 Y116.798 E.02362
G1 X109.472 Y116.798 E.2113
G1 X109.472 Y116.344 E.02362
G1 X113.528 Y116.344 E.2113
G1 X113.528 Y115.891 E.02362
G1 X109.472 Y115.891 E.2113
G1 X109.472 Y115.437 E.02362
G1 X113.528 Y115.437 E.2113
G1 X113.528 Y114.984 E.02362
G1 X109.472 Y114.984 E.2113
G1 X109.472 Y114.53 E.02362
G1 X113.528 Y114.53 E.2113
G1 X113.528 Y114.077 E.02362
G1 X109.472 Y114.077 E.2113
G1 X109.472 Y113.623 E.02362
G1 X110.364 Y113.623 E.04647
G1 X110.843 Y113.812 E.02683
G2 X112.161 Y113.81 I.655 J-2.691 E.06931
G1 X112.636 Y113.623 E.02657
G1 X113.731 Y113.623 E.05701
M106 S242.25
G1 X113.353 Y112.936 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
; LAYER_HEIGHT: 0.2
G1 F15000
G1 X113.29 Y112.973 E.00204
G1 X113.338 Y113.001 E.00155
G1 X113.453 Y112.651 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.12678
G1 F15000
G1 X113.571 Y112.486 E.00138
; LINE_WIDTH: 0.173104
G1 X113.629 Y112.401 E.0011
; LINE_WIDTH: 0.136063
G1 X113.654 Y112.27 E.00101
; LINE_WIDTH: 0.0969204
G1 X113.672 Y112.165 E.00047
G1 X113.672 Y110.791 F30000
; LINE_WIDTH: 0.0969201
G1 F15000
G1 X113.654 Y110.686 E.00047
; LINE_WIDTH: 0.136066
G1 X113.629 Y110.555 E.00101
; LINE_WIDTH: 0.173111
G1 X113.571 Y110.469 E.0011
; LINE_WIDTH: 0.126781
G1 X113.453 Y110.305 E.00138
G1 X113.352 Y109.946 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
G1 F15000
G1 X113.288 Y109.983 E.00204
G1 X113.337 Y110.011 E.00155
G1 X109.689 Y109.948 F30000
G1 F15000
G1 X109.625 Y109.985 E.00204
G1 X109.674 Y110.013 E.00155
G1 X109.547 Y110.305 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973914
G1 F15000
G1 X109.487 Y110.384 E.00044
; LINE_WIDTH: 0.111395
G1 X109.429 Y110.469 E.00058
; LINE_WIDTH: 0.148173
G2 X109.365 Y110.581 I.121 J.144 E.00113
; LINE_WIDTH: 0.161457
G1 X109.346 Y110.686 E.00103
; LINE_WIDTH: 0.129189
G1 X109.328 Y110.791 E.00075
G1 X109.269 Y109.448 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.400917
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X110.128 Y109.426 E.04417
G1 X110.816 Y109.153 E.03809
G3 X112.157 Y109.144 I.688 J2.659 E.06965
G1 X112.711 Y109.362 E.03065
G1 X113.528 Y109.341 E.04203
G1 X113.528 Y108.89 E.0232
G1 X109.472 Y108.991 E.20871
G1 X109.472 Y108.54 E.0232
G1 X113.528 Y108.439 E.20871
G1 X113.528 Y107.988 E.0232
G1 X109.472 Y108.089 E.20871
G1 X109.472 Y107.638 E.0232
G1 X113.528 Y107.537 E.20871
G1 X113.528 Y107.086 E.0232
G1 X109.472 Y107.187 E.20871
G1 X109.472 Y106.736 E.0232
G1 X113.528 Y106.635 E.20871
G1 X113.528 Y106.184 E.0232
G1 X109.472 Y106.285 E.20871
G1 X109.472 Y105.834 E.0232
G1 X113.528 Y105.733 E.20871
G1 X113.528 Y105.282 E.0232
G1 X109.472 Y105.383 E.20871
G1 X109.472 Y104.932 E.0232
G1 X113.528 Y104.831 E.20871
G1 X113.528 Y104.38 E.0232
G1 X109.472 Y104.481 E.20871
G1 X109.472 Y104.03 E.0232
G1 X113.731 Y103.924 E.21913
M106 S242.25
G1 X109.328 Y112.165 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.12919
; LAYER_HEIGHT: 0.2
G1 F15000
G1 X109.346 Y112.27 E.00075
; LINE_WIDTH: 0.161458
G1 X109.365 Y112.375 E.00103
; LINE_WIDTH: 0.14817
G2 X109.429 Y112.486 I.185 J-.032 E.00113
; LINE_WIDTH: 0.111393
G1 X109.487 Y112.572 E.00058
; LINE_WIDTH: 0.0973904
G1 X109.547 Y112.651 E.00044
G1 X109.402 Y112.901 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
G1 F15000
G1 X109.338 Y112.938 E.00204
G1 X109.402 Y112.975 E.00204
G1 X109.423 Y112.938 E.00118
G1 X109.648 Y112.936 E.00624
G1 X109.648 Y113.01 E.00204
G1 X109.66 Y113.003 E.00038
G1 X109.43 Y121.834 F30000
G1 F15000
G1 X109.523 Y121.791 E.00284
G1 X109.675 Y121.811 E.00425
G1 X109.608 Y122.209 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973916
G1 F15000
G1 X109.544 Y122.285 E.00044
; LINE_WIDTH: 0.111408
G1 X109.478 Y122.373 E.00061
; LINE_WIDTH: 0.145813
G1 X109.408 Y122.465 E.00097
; LINE_WIDTH: 0.178939
G1 X109.306 Y122.612 E.00199
G1 X109.36 Y122.606 F30000
; LINE_WIDTH: 0.15212
G1 F15000
G1 X109.344 Y122.699 E.00083
; LINE_WIDTH: 0.12452
G1 X109.328 Y122.791 E.00062
G1 X109.36 Y122.606 F30000
; LINE_WIDTH: 0.153609
G1 F15000
G1 X109.406 Y122.372 E.00215
G1 X109.328 Y124.165 F30000
; LINE_WIDTH: 0.129191
G1 F15000
G1 X109.346 Y124.27 E.00075
; LINE_WIDTH: 0.161462
G1 X109.365 Y124.375 E.00103
; LINE_WIDTH: 0.14818
G2 X109.429 Y124.486 I.185 J-.032 E.00113
; LINE_WIDTH: 0.111401
G1 X109.487 Y124.572 E.00058
; LINE_WIDTH: 0.0973913
G1 X109.547 Y124.651 E.00044
G1 X109.402 Y124.901 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
G1 F15000
G1 X109.338 Y124.938 E.00204
G1 X109.402 Y124.975 E.00204
G1 X109.423 Y124.938 E.00118
G1 X109.648 Y124.936 E.00624
G1 X109.648 Y125.01 E.00204
G1 X109.66 Y125.003 E.00038
M106 S252.45
; CHANGE_LAYER
; Z_HEIGHT: 8.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X109.648 Y125.01 E-.0206
G1 X109.648 Y124.936 E-.11139
G1 X109.423 Y124.938 E-.34092
G1 X109.402 Y124.975 E-.06431
G1 X109.338 Y124.938 E-.11139
G1 X109.402 Y124.901 E-.11139
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 57/58
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
G3 Z9 I-.007 J1.217 P1  F30000
G1 X149.724 Y125.122 Z9
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9454
G1 X149.697 Y125.143 E.00111
G3 X148.245 Y121.441 I-1.197 J-1.666 E.24771
G1 X148.449 Y121.426 E.00679
G3 X150.003 Y124.873 I.051 J2.051 E.15953
G1 X149.768 Y125.082 E.01045
G1 X149.357 Y124.891 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9454
G1 X149.182 Y124.989 E.00616
G3 X148.294 Y121.83 I-.682 J-1.513 E.17541
G1 X148.459 Y121.818 E.00509
G3 X149.468 Y124.824 I.041 J1.659 E.12968
G1 X149.408 Y124.86 E.00214
M204 S10000
; WIPE_START
G1 F24000
G1 X149.182 Y124.989 E-.09899
G1 X148.869 Y125.096 E-.12556
G1 X148.541 Y125.138 E-.12563
G1 X148.212 Y125.113 E-.12564
G1 X148.05 Y125.076 E-.06289
G1 X147.743 Y124.955 E-.12563
G1 X147.531 Y124.819 E-.09565
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.2 I1.202 J.189 P1  F30000
G1 X149.34 Y113.34 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9454
G1 X149.153 Y113.421 E.00677
G3 X148.245 Y109.441 I-.653 J-1.945 E.22736
G1 X148.449 Y109.426 E.00679
G3 X149.525 Y113.254 I.051 J2.051 E.17988
G1 X149.394 Y113.314 E.00478
G1 X149.176 Y112.993 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9454
G1 X148.869 Y113.094 E.00994
G3 X148.294 Y109.83 I-.369 J-1.618 E.16525
G1 X148.459 Y109.818 E.00509
G3 X149.23 Y112.967 I.041 J1.659 E.13822
M204 S10000
; WIPE_START
G1 F24000
G1 X148.869 Y113.094 E-.14541
G1 X148.541 Y113.138 E-.12555
G1 X148.212 Y113.113 E-.12564
G1 X147.893 Y113.023 E-.12563
G1 X147.599 Y112.873 E-.12563
G1 X147.465 Y112.776 E-.0629
G1 X147.372 Y112.685 E-.04924
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.2 I-1.197 J.222 P1  F30000
G1 X150.898 Y131.688 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9454
G1 X150.898 Y132.08 E.01301
G1 X153.455 Y132.08 E.08483
G3 X155.757 Y135.177 I.001 J2.403 E.14859
G1 X144.202 Y135.177 E.38327
G2 X146.102 Y131.6 I-15.048 J-10.284 E.13463
G1 X146.102 Y103.366 E.93656
G1 X150.898 Y103.366 E.15909
G1 X150.898 Y131.628 E.9375
G1 X151.29 Y131.688 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9454
G1 X153.46 Y131.688 E.06668
G3 X156.03 Y135.569 I-.004 J2.794 E.16905
G1 X143.433 Y135.569 E.38707
G2 X145.71 Y131.52 I-13.526 J-10.27 E.14317
G1 X145.71 Y102.974 E.87715
G1 X151.29 Y102.974 E.17146
G1 X151.29 Y131.628 E.88045
M204 S10000
; WIPE_START
G1 F24000
G1 X153.289 Y131.683 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.2 I.781 J-.933 P1  F30000
G1 X147.625 Y126.941 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F9454
G1 X147.625 Y131.641 E.14441
G1 X147.57 Y132.019 E.01174
G3 X146.856 Y133.653 I-16.327 J-6.158 E.05484
G1 X149.926 Y133.653 E.09433
G1 X150.307 Y133.641 E.01172
; LINE_WIDTH: 0.462283
G1 X150.689 Y133.628 E.01304
G1 X149.998 Y133.403 E.02484
; LINE_WIDTH: 0.419999
G1 X149.56 Y132.957 E.01921
G1 X149.382 Y132.426 E.0172
G3 X149.375 Y126.936 I276.451 J-3.138 E.16869
G1 X148.814 Y127.037 E.01752
G1 X148.102 Y127.029 E.02186
G1 X147.684 Y126.952 E.01305
G1 X148.002 Y127.429 F30000
G1 F9454
G1 X148.002 Y131.641 E.12943
G1 X147.931 Y132.127 E.01509
G3 X147.454 Y133.276 I-15.223 J-5.649 E.03826
G1 X149.36 Y133.276 E.05857
G1 X149.236 Y133.149 E.00546
G1 X149.019 Y132.551 E.01955
G1 X148.998 Y132.023 E.01625
G1 X148.998 Y127.392 E.14229
G3 X148.062 Y127.428 I-.854 J-10.08 E.02876
G1 X148.346 Y127.765 F30000
; LINE_WIDTH: 0.351907
G1 F9454
G1 X148.346 Y131.641 E.09758
G1 X148.283 Y132.232 E.01496
; LINE_WIDTH: 0.398836
G1 X148.241 Y132.399 E.00499
; LINE_WIDTH: 0.475405
G3 X148.071 Y132.869 I-1.595 J-.309 E.0177
G1 X148.709 Y132.869 E.02246
G1 X148.617 Y132.616 E.0095
; LINE_WIDTH: 0.480383
G1 X148.627 Y132.418 E.00705
; LINE_WIDTH: 0.4431
G1 X148.636 Y132.22 E.00645
; LINE_WIDTH: 0.405817
G1 X148.646 Y132.023 E.00585
; LINE_WIDTH: 0.353316
G1 X148.654 Y127.761 E.10779
G1 X148.406 Y127.765 E.0063
G1 X150.689 Y133.628 F30000
; LINE_WIDTH: 0.471074
G1 F9454
G1 X153.469 Y133.634 E.09699
G1 X146.237 Y134.031 F30000
; LINE_WIDTH: 0.419999
G1 F9454
M73 P94 R0
G1 X154.615 Y134.031 E.25744
G1 X154.433 Y133.702 E.01155
G1 X154.145 Y133.439 E.01197
G2 X153.53 Y133.237 I-.716 J1.144 E.02008
G1 X150.69 Y133.225 E.08726
G1 X150.197 Y133.083 E.01579
G1 X149.884 Y132.764 E.01372
G1 X149.757 Y132.385 E.01229
G3 X149.752 Y126.412 I399.151 J-3.359 E.18355
G1 X149.429 Y126.537 E.01064
G1 X148.804 Y126.66 E.01956
G1 X148.168 Y126.657 E.01956
G1 X147.544 Y126.528 E.01956
G1 X147.248 Y126.412 E.00977
G1 X147.248 Y131.641 E.16066
G1 X147.174 Y132.007 E.01149
G3 X146.265 Y133.978 I-19.035 J-7.59 E.06671
G1 X145.594 Y134.408 F30000
G1 F9454
G1 X155.081 Y134.408 E.29152
G2 X154.982 Y133.917 I-1.339 J.016 E.01547
G1 X154.712 Y133.449 E.01661
G1 X154.375 Y133.133 E.01419
G1 X153.919 Y132.928 E.01537
G1 X153.532 Y132.86 E.01208
G1 X150.692 Y132.848 E.08726
G1 X150.396 Y132.763 E.00947
G1 X150.208 Y132.572 E.00823
G1 X150.129 Y132.283 E.00921
G1 X150.129 Y125.77 E.20012
G1 X149.861 Y125.948 E.00988
G1 X149.345 Y126.169 E.01726
G1 X148.795 Y126.283 E.01726
G1 X148.233 Y126.286 E.01726
G1 X147.682 Y126.177 E.01726
G1 X147.163 Y125.962 E.01726
G1 X146.871 Y125.773 E.01068
G1 X146.871 Y131.641 E.1803
G1 X146.782 Y131.967 E.01041
G3 X145.625 Y134.356 I-16.398 J-6.463 E.08163
G1 X144.919 Y134.785 F30000
G1 F9454
G1 X155.427 Y134.785 E.32288
G2 X155.315 Y133.739 I-1.858 J-.33 E.03273
G1 X155.07 Y133.282 E.01593
G1 X154.661 Y132.877 E.01769
G1 X154.137 Y132.591 E.01837
G1 X153.533 Y132.483 E.01883
G1 X150.694 Y132.471 E.08726
G1 X150.532 Y132.379 E.00571
G1 X150.506 Y131.641 E.0227
G1 X150.506 Y125.221 E.19726
G1 X150.387 Y125.248 E.00373
M73 P95 R0
G1 X150.267 Y125.153 E.0047
G1 X150.104 Y125.323 E.00724
G1 X149.706 Y125.605 E.01496
G1 X149.261 Y125.801 E.01496
G1 X148.785 Y125.906 E.01496
G1 X148.299 Y125.915 E.01496
G1 X147.82 Y125.826 E.01496
G1 X147.368 Y125.645 E.01496
G1 X146.954 Y125.371 E.01525
G1 X146.662 Y125.056 E.01321
G1 X146.566 Y125.127 E.00367
G1 X146.494 Y125.113 E.00225
G1 X146.494 Y131.641 E.20058
G3 X144.95 Y134.734 I-14.608 J-5.362 E.10644
; WIPE_START
G1 F24000
G1 X145.373 Y134.047 E-.30647
G1 X145.77 Y133.302 E-.32065
G1 X145.921 Y132.987 E-.13288
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.2 I1.214 J.091 P1  F30000
G1 X146.547 Y124.651 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973913
G1 F9454
G1 X146.487 Y124.572 E.00044
; LINE_WIDTH: 0.111402
G1 X146.429 Y124.486 E.00058
; LINE_WIDTH: 0.148179
G3 X146.365 Y124.375 I.121 J-.144 E.00113
; LINE_WIDTH: 0.16146
G1 X146.346 Y124.27 E.00103
; LINE_WIDTH: 0.12919
G1 X146.328 Y124.165 E.00075
G1 X146.329 Y122.793 F30000
; LINE_WIDTH: 0.119474
G1 F9454
G3 X146.399 Y122.379 I8.308 J1.202 E.00262
G1 X146.476 Y122.375 F30000
; LINE_WIDTH: 0.111398
G1 F9454
G1 X146.544 Y122.285 E.00063
; LINE_WIDTH: 0.0973911
G1 X146.608 Y122.209 E.00044
G1 X146.476 Y122.375 F30000
; LINE_WIDTH: 0.147264
G1 F9454
G1 X146.403 Y122.472 E.00103
; LINE_WIDTH: 0.181639
G1 X146.306 Y122.615 E.00195
G1 X148.346 Y119.194 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.351907
G1 F9454
G1 X148.654 Y119.19 E.00778
G1 X148.654 Y115.761 E.08633
G1 X148.346 Y115.765 E.00778
G1 X148.346 Y119.134 E.08482
G1 X148.002 Y119.564 F30000
; LINE_WIDTH: 0.419999
G1 F9454
G3 X148.998 Y119.527 I.892 J10.726 E.03061
G1 X148.998 Y115.392 E.12705
G3 X148.002 Y115.429 I-.892 J-10.728 E.03061
G1 X148.002 Y119.504 E.12521
G1 X147.625 Y120.02 F30000
G1 F9454
G1 X148.186 Y119.919 E.01752
G1 X148.898 Y119.927 E.02186
G1 X149.375 Y120.015 E.01489
G1 X149.375 Y114.936 E.15606
G1 X148.814 Y115.037 E.01752
G1 X148.102 Y115.029 E.02186
G1 X147.625 Y114.941 E.01489
G1 X147.625 Y119.96 E.15421
G1 X147.248 Y120.544 F30000
G1 F9454
G1 X147.571 Y120.419 E.01064
G1 X148.196 Y120.296 E.01956
G1 X148.832 Y120.298 E.01956
G1 X149.456 Y120.427 E.01956
G1 X149.752 Y120.543 E.00977
G1 X149.752 Y114.412 E.18842
G1 X149.429 Y114.537 E.01064
G1 X148.804 Y114.66 E.01956
G1 X148.168 Y114.657 E.01956
G1 X147.544 Y114.528 E.01956
G1 X147.248 Y114.412 E.00977
G1 X147.248 Y120.484 E.18657
G1 X146.871 Y121.186 F30000
G1 F9454
G1 X147.139 Y121.007 E.00988
G1 X147.655 Y120.787 E.01726
G1 X148.205 Y120.673 E.01726
G1 X148.767 Y120.67 E.01726
G1 X149.318 Y120.778 E.01726
G1 X149.837 Y120.994 E.01726
G1 X150.129 Y121.183 E.01068
G1 X150.129 Y113.77 E.22777
G1 X149.861 Y113.948 E.00988
G1 X149.345 Y114.169 E.01726
G1 X148.795 Y114.283 E.01726
G1 X148.233 Y114.286 E.01726
G1 X147.682 Y114.177 E.01726
G1 X147.163 Y113.962 E.01726
G1 X146.871 Y113.773 E.01068
G1 X146.871 Y121.126 E.22593
G1 X146.494 Y121.737 F30000
G1 F9454
G1 X146.62 Y121.718 E.00392
G1 X146.733 Y121.802 E.00433
G1 X146.896 Y121.632 E.00724
G1 X147.294 Y121.351 E.01496
G1 X147.739 Y121.154 E.01496
G1 X148.215 Y121.049 E.01496
G1 X148.701 Y121.041 E.01496
G1 X149.18 Y121.129 E.01496
G1 X149.632 Y121.311 E.01496
G1 X150.046 Y121.585 E.01525
G1 X150.338 Y121.9 E.01321
G1 X150.441 Y121.823 E.00395
G1 X150.506 Y121.834 E.00203
G1 X150.506 Y113.221 E.26465
G1 X150.387 Y113.248 E.00373
G1 X150.267 Y113.153 E.0047
G1 X150.104 Y113.323 E.00724
G1 X149.706 Y113.605 E.01496
G1 X149.261 Y113.801 E.01496
G1 X148.785 Y113.906 E.01496
G1 X148.299 Y113.915 E.01496
G1 X147.82 Y113.826 E.01496
G1 X147.368 Y113.645 E.01496
G1 X146.954 Y113.371 E.01525
G1 X146.662 Y113.056 E.01321
G1 X146.566 Y113.127 E.00367
G1 X146.494 Y113.113 E.00225
G1 X146.494 Y121.677 E.26314
G1 X150.453 Y122.305 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.126789
G1 F9454
G1 X150.571 Y122.469 E.00138
; LINE_WIDTH: 0.173121
G1 X150.629 Y122.555 E.0011
; LINE_WIDTH: 0.136072
G1 X150.654 Y122.686 E.00101
; LINE_WIDTH: 0.0969206
G1 X150.672 Y122.791 E.00047
G1 X150.671 Y124.163 F30000
; LINE_WIDTH: 0.119473
G1 F9454
G3 X150.601 Y124.577 I-8.244 J-1.192 E.00262
G1 X150.524 Y124.58 F30000
; LINE_WIDTH: 0.129157
G1 F9454
G1 X150.392 Y124.747 E.00149
G1 X150.524 Y124.58 F30000
; LINE_WIDTH: 0.179209
G1 F9454
G1 X150.593 Y124.49 E.00126
; LINE_WIDTH: 0.195629
G1 X150.694 Y124.341 E.00224
G1 X150.392 Y112.747 F30000
; LINE_WIDTH: 0.129165
G1 F9454
G1 X150.524 Y112.58 E.00149
; LINE_WIDTH: 0.179228
G1 X150.593 Y112.49 E.00126
; LINE_WIDTH: 0.195637
G1 X150.694 Y112.341 E.00224
G1 X150.671 Y112.163 F30000
; LINE_WIDTH: 0.119475
G1 F9454
G3 X150.601 Y112.577 I-8.232 J-1.19 E.00262
G1 X150.672 Y110.791 F30000
; LINE_WIDTH: 0.0969206
G1 F9454
G1 X150.654 Y110.686 E.00047
; LINE_WIDTH: 0.136068
G1 X150.629 Y110.555 E.00101
; LINE_WIDTH: 0.173114
G1 X150.571 Y110.469 E.0011
; LINE_WIDTH: 0.126784
G1 X150.453 Y110.305 E.00138
G1 X148.346 Y107.194 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.351907
G1 F9454
G1 X148.654 Y107.19 E.00778
G1 X148.654 Y105.609 E.0398
G1 X148.346 Y105.609 E.00778
G1 X148.346 Y107.134 E.03839
G1 X148.002 Y107.564 F30000
; LINE_WIDTH: 0.419999
G1 F9454
G3 X148.998 Y107.527 I.892 J10.735 E.03061
G1 X148.998 Y105.266 E.06946
G1 X148.002 Y105.266 E.03058
G1 X148.002 Y107.504 E.06874
G1 X147.625 Y108.02 F30000
G1 F9454
G1 X148.186 Y107.919 E.01752
G1 X148.898 Y107.927 E.02186
G1 X149.375 Y108.015 E.0149
G1 X149.375 Y104.889 E.09603
G1 X147.625 Y104.889 E.05375
G1 X147.625 Y107.96 E.09435
G1 X147.248 Y108.544 F30000
G1 F9454
G1 X147.571 Y108.419 E.01064
G1 X148.196 Y108.296 E.01956
G1 X148.832 Y108.298 E.01956
G1 X149.456 Y108.427 E.01956
G1 X149.752 Y108.543 E.00977
G1 X149.752 Y104.512 E.12387
G1 X147.248 Y104.512 E.07692
G1 X147.248 Y108.484 E.12204
G1 X146.871 Y109.186 F30000
G1 F9454
G1 X147.139 Y109.007 E.00988
G1 X147.655 Y108.787 E.01726
G1 X148.205 Y108.673 E.01726
G1 X148.767 Y108.67 E.01726
G1 X149.318 Y108.778 E.01726
G1 X149.837 Y108.994 E.01726
G1 X150.129 Y109.183 E.01068
G1 X150.129 Y104.135 E.15509
G1 X146.871 Y104.135 E.10009
G1 X146.871 Y109.126 E.15335
G1 X146.494 Y109.737 F30000
G1 F9454
G1 X146.621 Y109.718 E.00392
G1 X146.733 Y109.802 E.00433
G1 X146.896 Y109.632 E.00724
G1 X147.294 Y109.351 E.01496
G1 X147.739 Y109.154 E.01496
G1 X148.215 Y109.049 E.01496
G1 X148.701 Y109.041 E.01496
G1 X149.18 Y109.129 E.01496
G1 X149.632 Y109.311 E.01496
G1 X150.046 Y109.585 E.01525
G1 X150.338 Y109.9 E.01321
G1 X150.441 Y109.823 E.00395
G1 X150.506 Y109.834 E.00203
G1 X150.506 Y103.758 E.1867
G1 X146.494 Y103.758 E.12327
G1 X146.494 Y109.677 E.18186
G1 X146.608 Y110.209 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973916
G1 F9454
G1 X146.544 Y110.285 E.00044
; LINE_WIDTH: 0.111409
G1 X146.476 Y110.375 E.00063
; LINE_WIDTH: 0.147274
G1 X146.403 Y110.472 E.00103
; LINE_WIDTH: 0.181648
G1 X146.306 Y110.615 E.00195
G1 X146.329 Y110.793 F30000
; LINE_WIDTH: 0.119473
G1 F9454
G3 X146.399 Y110.378 I8.225 J1.19 E.00262
G1 X146.328 Y112.165 F30000
; LINE_WIDTH: 0.129188
G1 F9454
G1 X146.346 Y112.27 E.00075
; LINE_WIDTH: 0.161456
G1 X146.365 Y112.375 E.00103
; LINE_WIDTH: 0.148187
G2 X146.429 Y112.486 I.185 J-.032 E.00113
; LINE_WIDTH: 0.111411
G1 X146.487 Y112.572 E.00058
; LINE_WIDTH: 0.0973915
G1 X146.547 Y112.651 E.00044
; WIPE_START
G1 F24000
G1 X146.487 Y112.572 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.2 I-.424 J-1.141 P1  F30000
G1 X112.724 Y125.122 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9454
G1 X112.697 Y125.143 E.00111
G3 X111.245 Y121.441 I-1.197 J-1.666 E.24771
G1 X111.449 Y121.426 E.00679
G3 X113.003 Y124.873 I.051 J2.051 E.15953
G1 X112.768 Y125.082 E.01045
G1 X112.357 Y124.891 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9454
G1 X112.182 Y124.989 E.00616
G3 X111.294 Y121.83 I-.682 J-1.513 E.17541
G1 X111.459 Y121.818 E.00509
G3 X112.468 Y124.824 I.041 J1.659 E.12968
G1 X112.408 Y124.86 E.00214
M204 S10000
; WIPE_START
G1 F24000
G1 X112.182 Y124.989 E-.099
G1 X111.869 Y125.096 E-.12556
G1 X111.541 Y125.138 E-.12563
G1 X111.212 Y125.113 E-.12564
G1 X111.05 Y125.076 E-.06289
G1 X110.743 Y124.955 E-.12563
G1 X110.531 Y124.819 E-.09565
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.2 I1.209 J.139 P1  F30000
G1 X112.28 Y109.582 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9454
G1 X112.614 Y109.754 E.01245
G3 X111.245 Y109.441 I-1.114 J1.723 E.38006
G1 X111.449 Y109.426 E.00679
G3 X112.225 Y109.558 I.051 J2.051 E.02629
G1 X112.107 Y109.932 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9454
G3 X111.294 Y109.83 I-.607 J1.544 E.2949
G1 X111.459 Y109.818 E.00509
G3 X112.05 Y109.912 I.041 J1.659 E.01851
M204 S10000
; WIPE_START
G1 F24000
G1 X112.401 Y110.083 E-.14826
G1 X112.659 Y110.289 E-.12563
G1 X112.872 Y110.543 E-.12563
G1 X113.03 Y110.833 E-.12564
G1 X113.127 Y111.149 E-.12564
G1 X113.157 Y111.435 E-.1092
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.2 I-1.194 J-.235 P1  F30000
G1 X109.102 Y132.08 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9454
G1 X109.102 Y103.366 E.95249
G1 X113.898 Y103.366 E.15909
G1 X113.898 Y131.6 E.93656
G2 X115.798 Y135.177 I16.947 J-6.707 E.13463
G1 X104.243 Y135.177 E.38327
G3 X106.545 Y132.08 I2.3 J-.694 E.14859
G1 X109.042 Y132.08 E.08284
G1 X108.71 Y131.688 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9454
G1 X108.71 Y102.974 E.8823
G1 X114.29 Y102.974 E.17146
G1 X114.29 Y131.52 E.87715
G2 X116.567 Y135.569 I15.802 J-6.222 E.14317
G1 X103.971 Y135.569 E.38702
G3 X106.54 Y131.688 I2.572 J-1.088 E.16904
G1 X108.65 Y131.688 E.06484
M204 S10000
; WIPE_START
G1 F24000
G1 X108.654 Y129.688 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.2 I-1.065 J-.589 P1  F30000
G1 X106.471 Y133.634 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.45987
G1 F9454
G1 X109.48 Y133.62 E.10222
G1 X115.069 Y134.785 F30000
; LINE_WIDTH: 0.419999
G1 F9454
G3 X113.506 Y131.641 I14.814 J-9.325 E.10806
G1 X113.506 Y125.221 E.19726
G1 X113.387 Y125.248 E.00373
G1 X113.267 Y125.153 E.0047
G1 X113.104 Y125.323 E.00724
G1 X112.706 Y125.605 E.01496
G1 X112.261 Y125.801 E.01496
G1 X111.785 Y125.906 E.01496
G1 X111.299 Y125.915 E.01496
G1 X110.82 Y125.826 E.01496
G1 X110.368 Y125.645 E.01496
G1 X109.954 Y125.371 E.01525
G1 X109.662 Y125.056 E.01321
G1 X109.566 Y125.127 E.00367
G1 X109.494 Y125.113 E.00225
G1 X109.494 Y132.283 E.2203
G1 X109.468 Y132.379 E.00307
G1 X109.338 Y132.468 E.00484
G1 X109.306 Y132.471 E.00098
G1 X106.342 Y132.484 E.09109
G1 X105.863 Y132.591 E.01508
G1 X105.431 Y132.808 E.01485
G1 X104.988 Y133.207 E.01832
G1 X104.739 Y133.626 E.01498
G1 X104.565 Y134.156 E.01715
G2 X104.573 Y134.785 I1.535 J.295 E.01944
G1 X115.009 Y134.785 E.32066
G1 X114.403 Y134.408 F30000
G1 F9454
G3 X113.218 Y131.967 I16.817 J-9.671 E.08341
G1 X113.129 Y131.641 E.01041
G1 X113.129 Y125.77 E.1804
G1 X112.861 Y125.948 E.00988
G1 X112.345 Y126.169 E.01726
G1 X111.795 Y126.283 E.01726
G1 X111.233 Y126.286 E.01726
G1 X110.682 Y126.177 E.01726
G1 X110.163 Y125.962 E.01726
G1 X109.871 Y125.773 E.01068
G1 X109.871 Y132.283 E.20002
G1 X109.792 Y132.572 E.00921
G1 X109.604 Y132.763 E.00823
G1 X109.308 Y132.848 E.00947
G1 X106.384 Y132.86 E.08984
G1 X105.908 Y132.99 E.01516
G1 X105.575 Y133.185 E.01186
G1 X105.236 Y133.515 E.01453
G1 X105.093 Y133.754 E.00856
G1 X104.941 Y134.194 E.01433
G1 X104.919 Y134.408 E.00659
G1 X114.343 Y134.408 E.28957
G1 X113.763 Y134.031 F30000
G1 F9454
G3 X112.766 Y131.804 I14.038 J-7.625 E.07505
G1 X112.752 Y131.641 E.00502
G1 X112.752 Y126.412 E.16068
G1 X112.429 Y126.537 E.01064
G1 X111.804 Y126.66 E.01956
G1 X111.168 Y126.657 E.01956
G1 X110.544 Y126.528 E.01956
G1 X110.248 Y126.412 E.00977
G1 X110.248 Y132.283 E.18038
G1 X110.236 Y132.432 E.0046
G1 X110.116 Y132.764 E.01086
G1 X109.803 Y133.083 E.01372
G1 X109.468 Y133.211 E.01102
G1 X109.31 Y133.225 E.0049
G1 X106.427 Y133.237 E.08858
G1 X106.078 Y133.327 E.01108
G1 X105.828 Y133.465 E.00877
G1 X105.549 Y133.725 E.0117
G1 X105.394 Y134.031 E.01053
G1 X113.703 Y134.031 E.25531
G1 X111.654 Y127.761 F30000
; LINE_WIDTH: 0.351907
G1 F9454
G1 X111.346 Y127.765 E.00778
G1 X111.346 Y131.641 E.09758
G1 X111.369 Y132.283 E.01617
; LINE_WIDTH: 0.398836
G1 X111.376 Y132.449 E.00484
; LINE_WIDTH: 0.47591
G1 X111.383 Y132.616 E.00588
G1 X111.291 Y132.869 E.00951
G1 X111.929 Y132.869 E.02249
G1 X111.77 Y132.452 E.01573
; LINE_WIDTH: 0.448737
G1 X111.724 Y132.224 E.00772
; LINE_WIDTH: 0.408636
G1 X111.677 Y131.995 E.00696
; LINE_WIDTH: 0.35332
G1 X111.654 Y131.641 E.00897
G1 X111.654 Y127.821 E.09661
G1 X111.998 Y127.392 F30000
; LINE_WIDTH: 0.419999
G1 F9454
G3 X111.002 Y127.429 I-.892 J-10.729 E.03061
G1 X111.002 Y132.283 E.14915
G1 X110.981 Y132.551 E.00828
G1 X110.764 Y133.149 E.01955
G1 X110.64 Y133.276 E.00546
G1 X112.546 Y133.276 E.05857
G1 X112.176 Y132.407 E.02903
G1 X112.023 Y131.934 E.01528
G1 X111.998 Y131.641 E.00904
G1 X111.998 Y127.452 E.1287
G1 X112.375 Y126.936 F30000
G1 F9454
G1 X111.814 Y127.037 E.01752
G1 X111.102 Y127.029 E.02186
G1 X110.625 Y126.941 E.01489
G1 X110.625 Y132.283 E.16413
G1 X110.609 Y132.492 E.00644
G1 X110.44 Y132.957 E.01521
G1 X110.002 Y133.403 E.01921
G1 X109.771 Y133.511 E.00783
; LINE_WIDTH: 0.479921
G1 X109.54 Y133.618 E.00908
G1 X110.074 Y133.653 E.01906
; LINE_WIDTH: 0.419999
G1 X113.144 Y133.653 E.09433
G3 X112.394 Y131.869 I13.213 J-6.598 E.05952
G1 X112.375 Y131.641 E.00703
G1 X112.375 Y126.996 E.14273
G1 X113.392 Y124.747 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.129157
G1 F9454
G1 X113.524 Y124.58 E.00149
; LINE_WIDTH: 0.179208
G1 X113.593 Y124.49 E.00126
; LINE_WIDTH: 0.195627
G1 X113.694 Y124.341 E.00224
G1 X113.671 Y124.163 F30000
; LINE_WIDTH: 0.11947
G1 F9454
G3 X113.601 Y124.577 I-8.331 J-1.205 E.00262
G1 X113.672 Y122.791 F30000
; LINE_WIDTH: 0.0969206
G1 F9454
G1 X113.654 Y122.686 E.00047
; LINE_WIDTH: 0.13607
G1 X113.629 Y122.555 E.00101
; LINE_WIDTH: 0.173117
G1 X113.571 Y122.469 E.0011
; LINE_WIDTH: 0.126787
G1 X113.453 Y122.305 E.00138
G1 X113.506 Y121.834 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F9454
G1 X113.506 Y113.221 E.26465
G1 X113.387 Y113.248 E.00373
G1 X113.267 Y113.153 E.0047
G1 X113.104 Y113.323 E.00724
G1 X112.706 Y113.605 E.01496
G1 X112.261 Y113.801 E.01496
G1 X111.785 Y113.906 E.01496
G1 X111.299 Y113.915 E.01496
G1 X110.82 Y113.826 E.01496
G1 X110.368 Y113.645 E.01496
G1 X109.954 Y113.371 E.01525
G1 X109.662 Y113.056 E.01321
G1 X109.566 Y113.127 E.00367
G1 X109.494 Y113.113 E.00225
G1 X109.494 Y121.737 E.26498
G1 X109.62 Y121.718 E.00392
G1 X109.733 Y121.802 E.00433
G1 X109.896 Y121.632 E.00724
G1 X110.294 Y121.351 E.01496
G1 X110.739 Y121.154 E.01496
G1 X111.215 Y121.049 E.01496
G1 X111.701 Y121.041 E.01496
G1 X112.18 Y121.129 E.01496
G1 X112.632 Y121.311 E.01496
G1 X113.046 Y121.585 E.01525
G1 X113.338 Y121.9 E.01321
G1 X113.447 Y121.824 E.00409
G1 X113.129 Y121.183 F30000
G1 F9454
G1 X113.129 Y113.77 E.22777
G1 X112.861 Y113.948 E.00988
G1 X112.345 Y114.169 E.01726
G1 X111.795 Y114.283 E.01726
G1 X111.233 Y114.286 E.01726
G1 X110.682 Y114.177 E.01726
G1 X110.163 Y113.962 E.01726
G1 X109.871 Y113.773 E.01068
G1 X109.871 Y121.186 E.22777
G1 X110.139 Y121.007 E.00988
G1 X110.655 Y120.787 E.01726
G1 X111.205 Y120.673 E.01726
G1 X111.767 Y120.67 E.01726
G1 X112.318 Y120.778 E.01726
G1 X112.837 Y120.994 E.01726
G1 X113.078 Y121.15 E.00884
G1 X112.752 Y120.543 F30000
G1 F9454
G1 X112.752 Y114.412 E.18842
G1 X112.429 Y114.537 E.01064
G1 X111.804 Y114.66 E.01956
G1 X111.168 Y114.657 E.01956
G1 X110.544 Y114.528 E.01956
G1 X110.248 Y114.412 E.00977
G1 X110.248 Y120.544 E.18842
G1 X110.571 Y120.419 E.01064
G1 X111.196 Y120.296 E.01956
G1 X111.832 Y120.298 E.01956
G1 X112.456 Y120.427 E.01956
G1 X112.696 Y120.522 E.00792
G1 X112.375 Y120.015 F30000
G1 F9454
G1 X112.375 Y114.936 E.15606
G1 X111.814 Y115.037 E.01752
G1 X111.102 Y115.029 E.02186
G1 X110.625 Y114.941 E.01489
G1 X110.625 Y120.02 E.15606
G1 X111.186 Y119.919 E.01752
G1 X111.898 Y119.927 E.02186
G1 X112.316 Y120.004 E.01305
G1 X111.998 Y119.527 F30000
G1 F9454
G1 X111.998 Y115.392 E.12705
G3 X111.002 Y115.429 I-.892 J-10.73 E.03061
G1 X111.002 Y119.564 E.12705
G3 X111.938 Y119.528 I.853 J10.076 E.02876
G1 X111.654 Y119.19 F30000
; LINE_WIDTH: 0.351907
G1 F9454
G1 X111.654 Y115.761 E.08633
G1 X111.346 Y115.765 E.00778
G1 X111.346 Y119.194 E.08633
G1 X111.594 Y119.191 E.00627
G1 X109.608 Y122.209 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0973916
G1 F9454
G1 X109.544 Y122.285 E.00044
; LINE_WIDTH: 0.111401
G1 X109.476 Y122.375 E.00063
; LINE_WIDTH: 0.147267
G1 X109.403 Y122.472 E.00103
; LINE_WIDTH: 0.181643
G1 X109.306 Y122.615 E.00195
G1 X109.329 Y122.793 F30000
; LINE_WIDTH: 0.119476
G1 F9454
G3 X109.399 Y122.379 I8.307 J1.202 E.00262
G1 X109.328 Y124.165 F30000
; LINE_WIDTH: 0.129192
G1 F9454
G1 X109.346 Y124.27 E.00075
; LINE_WIDTH: 0.161464
G1 X109.365 Y124.375 E.00103
; LINE_WIDTH: 0.148182
G2 X109.429 Y124.486 I.185 J-.032 E.00113
; LINE_WIDTH: 0.111405
G1 X109.487 Y124.572 E.00058
; LINE_WIDTH: 0.0973915
G1 X109.547 Y124.651 E.00044
G1 X109.547 Y112.651 F30000
; LINE_WIDTH: 0.0973917
G1 F9454
G1 X109.487 Y112.572 E.00044
; LINE_WIDTH: 0.111412
G1 X109.429 Y112.486 E.00058
; LINE_WIDTH: 0.14819
G3 X109.365 Y112.375 I.121 J-.144 E.00113
; LINE_WIDTH: 0.16146
G1 X109.346 Y112.27 E.00103
; LINE_WIDTH: 0.12919
G1 X109.328 Y112.165 E.00075
G1 X109.329 Y110.793 F30000
; LINE_WIDTH: 0.119477
G1 F9454
G3 X109.399 Y110.378 I8.232 J1.191 E.00262
G1 X109.476 Y110.375 F30000
; LINE_WIDTH: 0.111411
G1 F9454
G1 X109.544 Y110.285 E.00063
; LINE_WIDTH: 0.0973918
G1 X109.608 Y110.209 E.00044
G1 X109.476 Y110.375 F30000
; LINE_WIDTH: 0.147278
G1 F9454
G1 X109.403 Y110.472 E.00103
; LINE_WIDTH: 0.181652
G1 X109.306 Y110.615 E.00195
; WIPE_START
G1 F24000
G1 X109.403 Y110.472 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.2 I.05 J1.216 P1  F30000
G1 X113.453 Y110.305 Z9.2
G1 Z8.8
G1 E.8 F1800
; LINE_WIDTH: 0.126782
G1 F9454
G1 X113.571 Y110.469 E.00138
; LINE_WIDTH: 0.17311
G1 X113.629 Y110.555 E.0011
; LINE_WIDTH: 0.136065
G1 X113.654 Y110.686 E.00101
; LINE_WIDTH: 0.0969206
G1 X113.672 Y110.791 E.00047
G1 X113.506 Y109.834 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F9454
G1 X113.506 Y103.758 E.1867
G1 X109.494 Y103.758 E.12327
G1 X109.494 Y109.737 E.1837
G1 X109.621 Y109.718 E.00393
G1 X109.733 Y109.802 E.00433
G1 X109.896 Y109.632 E.00724
G1 X110.294 Y109.351 E.01496
G1 X110.739 Y109.154 E.01496
G1 X111.215 Y109.049 E.01496
G1 X111.701 Y109.041 E.01496
G1 X112.18 Y109.129 E.01496
G1 X112.632 Y109.311 E.01496
G1 X113.046 Y109.585 E.01525
G1 X113.338 Y109.9 E.01321
G1 X113.447 Y109.824 E.00409
G1 X113.129 Y109.183 F30000
G1 F9454
G1 X113.129 Y104.135 E.15509
G1 X109.871 Y104.135 E.10009
G1 X109.871 Y109.186 E.15519
G1 X110.139 Y109.007 E.00988
G1 X110.655 Y108.787 E.01726
G1 X111.205 Y108.673 E.01726
G1 X111.767 Y108.67 E.01726
G1 X112.318 Y108.778 E.01726
G1 X112.837 Y108.994 E.01726
G1 X113.078 Y109.15 E.00884
G1 X112.752 Y108.543 F30000
G1 F9454
G1 X112.752 Y104.512 E.12387
G1 X110.248 Y104.512 E.07692
G1 X110.248 Y108.544 E.12389
G1 X110.571 Y108.419 E.01064
G1 X111.196 Y108.296 E.01956
G1 X111.832 Y108.298 E.01956
G1 X112.456 Y108.427 E.01956
G1 X112.696 Y108.522 E.00792
G1 X112.375 Y108.015 F30000
G1 F9454
G1 X112.375 Y104.889 E.09603
G1 X110.625 Y104.889 E.05375
G1 X110.625 Y108.02 E.09619
G1 X111.186 Y107.919 E.01752
G1 X111.898 Y107.927 E.02186
G1 X112.316 Y108.004 E.01305
G1 X111.998 Y107.527 F30000
G1 F9454
G1 X111.998 Y105.266 E.06946
G1 X111.002 Y105.266 E.03058
G1 X111.002 Y107.564 E.07058
G3 X111.938 Y107.528 I.854 J10.085 E.02876
G1 X111.654 Y107.19 F30000
; LINE_WIDTH: 0.351907
G1 F9454
G1 X111.654 Y105.609 E.0398
G1 X111.346 Y105.609 E.00778
G1 X111.346 Y107.194 E.0399
G1 X111.594 Y107.191 E.00627
G1 X113.671 Y112.163 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.119471
G1 F9454
G3 X113.601 Y112.577 I-8.236 J-1.191 E.00262
G1 X113.524 Y112.58 F30000
; LINE_WIDTH: 0.179228
G1 F9454
G1 X113.593 Y112.49 E.00126
; LINE_WIDTH: 0.195634
G1 X113.694 Y112.341 E.00224
G1 X113.524 Y112.58 F30000
; LINE_WIDTH: 0.129165
G1 F9454
G1 X113.392 Y112.747 E.00149
; CHANGE_LAYER
; Z_HEIGHT: 9
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X113.524 Y112.58 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 58/58
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
G3 Z9.2 I-.395 J1.151 P1  F30000
G1 X149.37 Y124.887 Z9.2
G1 Z9
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X149.329 Y124.914 E.00152
G3 X148.294 Y121.83 I-.829 J-1.437 E.18049
G1 X148.459 Y121.818 E.00509
G3 X149.597 Y124.721 I.041 J1.659 E.12459
G1 X149.419 Y124.851 E.00679
M204 S10000
; WIPE_START
G1 F24000
G1 X149.329 Y124.914 E-.04156
G1 X149.029 Y125.052 E-.12557
G1 X148.706 Y125.125 E-.12564
G1 X148.376 Y125.133 E-.12563
G1 X148.05 Y125.076 E-.12564
G1 X147.743 Y124.955 E-.12563
G1 X147.543 Y124.826 E-.09034
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I1.206 J.166 P1  F30000
G1 X149.175 Y112.994 Z9.4
G1 Z9
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X148.869 Y113.094 E.0099
G3 X148.294 Y109.83 I-.369 J-1.618 E.16525
G1 X148.459 Y109.818 E.00509
G3 X149.229 Y112.967 I.041 J1.659 E.13825
M204 S10000
; WIPE_START
G1 F24000
G1 X148.869 Y113.094 E-.14503
G1 X148.541 Y113.138 E-.12555
G1 X148.212 Y113.113 E-.12564
G1 X147.893 Y113.023 E-.12564
G1 X147.599 Y112.873 E-.12563
G1 X147.368 Y112.688 E-.11251
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I-1.192 J.246 P1  F30000
G1 X151.29 Y131.688 Z9.4
G1 Z9
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X153.46 Y131.688 E.06668
G3 X156.106 Y135.369 I.001 J2.79 E.16257
G1 X143.579 Y135.369 E.38491
G2 X145.71 Y131.52 I-13.562 J-10.024 E.13556
G1 X145.71 Y103.252 E.8686
G1 X151.29 Y103.252 E.17146
G1 X151.29 Y131.628 E.8719
M204 S10000
; WIPE_START
G1 F24000
G1 X153.289 Y131.683 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I1.213 J-.097 P1  F30000
G1 X151.083 Y104.021 Z9.4
G1 Z9
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
G1 F12000
G1 X150.521 Y103.46 E.0244
G1 X149.988 Y103.46
G1 X151.083 Y104.555 E.04758
G1 X151.083 Y105.088
G1 X149.454 Y103.46 E.07075
G1 X148.921 Y103.46
G1 X151.083 Y105.621 E.09392
G1 X151.083 Y106.154
G1 X148.388 Y103.46 E.1171
G1 X147.855 Y103.46
G1 X151.083 Y106.688 E.14027
G1 X151.083 Y107.221
G1 X147.321 Y103.46 E.16344
M73 P96 R0
G1 X146.788 Y103.46
G1 X151.083 Y107.754 E.18662
G1 X151.083 Y108.288
G1 X146.255 Y103.46 E.20979
G1 X145.917 Y103.656
G1 X151.083 Y108.821 E.22445
G1 X151.083 Y109.354
G1 X145.917 Y104.189 E.22445
G1 X145.917 Y104.722
G1 X151.083 Y109.887 E.22445
G1 X151.083 Y110.421
G1 X145.917 Y105.255 E.22445
G1 X145.917 Y105.789
G1 X151.083 Y110.954 E.22445
G1 X150.059 Y110.463
G1 X151.083 Y111.487 E.0445
G1 X151.083 Y112.02
G1 X150.352 Y111.29 E.03173
G1 X150.331 Y111.803
G1 X151.083 Y112.554 E.03264
G1 X151.083 Y113.087
G1 X150.21 Y112.215 E.0379
G1 X150.02 Y112.557
G1 X151.083 Y113.62 E.0462
G1 X151.083 Y114.153
G1 X149.771 Y112.842 E.057
G1 X149.468 Y113.072
G1 X151.083 Y114.687 E.07017
G1 X151.083 Y115.22
G1 X149.107 Y113.244 E.08587
G1 X148.663 Y113.334
G1 X151.083 Y115.753 E.10514
G1 X151.083 Y116.287
G1 X148.09 Y113.294 E.13006
M204 S10000
; WIPE_START
G1 F24000
G1 X149.504 Y114.708 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I1.217 J.003 P1  F30000
G1 X149.516 Y109.921 Z9.4
G1 Z9
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X145.917 Y106.322 E.15638
G1 X145.917 Y106.855
G1 X148.685 Y109.622 E.12024
G1 X148.174 Y109.645
G1 X145.917 Y107.388 E.09806
G1 X145.917 Y107.922
G1 X147.765 Y109.769 E.08029
G1 X147.424 Y109.961
G1 X145.917 Y108.455 E.06546
G1 X145.917 Y108.988
G1 X147.14 Y110.21 E.05311
G1 X146.91 Y110.514
G1 X145.917 Y109.522 E.04313
G1 X145.917 Y110.055
G1 X146.74 Y110.877 E.03574
G1 X146.644 Y111.315
G1 X145.917 Y110.588 E.03158
G1 X145.917 Y111.121
G1 X146.686 Y111.89 E.03341
G1 X145.917 Y111.655
G1 X151.083 Y116.82 E.22445
G1 X151.083 Y117.353
G1 X145.917 Y112.188 E.22445
G1 X145.917 Y112.721
G1 X151.083 Y117.886 E.22445
G1 X151.083 Y118.42
G1 X145.917 Y113.254 E.22445
G1 X145.917 Y113.788
G1 X151.083 Y118.953 E.22445
G1 X151.083 Y119.486
G1 X145.917 Y114.321 E.22445
G1 X145.917 Y114.854
G1 X151.083 Y120.019 E.22445
G1 X151.083 Y120.553
G1 X145.917 Y115.388 E.22445
G1 X145.917 Y115.921
G1 X151.083 Y121.086 E.22445
G1 X151.083 Y121.619
G1 X145.917 Y116.454 E.22445
G1 X145.917 Y116.987
G1 X151.083 Y122.153 E.22445
G1 X151.083 Y122.686
G1 X145.917 Y117.521 E.22445
G1 X145.917 Y118.054
G1 X151.083 Y123.219 E.22445
G1 X150.293 Y122.963
G1 X151.083 Y123.752 E.03432
G1 X151.083 Y124.286
G1 X150.359 Y123.562 E.03143
G1 X150.287 Y124.023
G1 X151.083 Y124.819 E.03458
G1 X151.083 Y125.352
G1 X150.121 Y124.391 E.04177
G1 X149.9 Y124.703
G1 X151.083 Y125.885 E.05139
G1 X151.083 Y126.419
G1 X149.624 Y124.96 E.06339
G1 X149.291 Y125.161
G1 X151.083 Y126.952 E.07784
G1 X151.083 Y127.485
G1 X148.893 Y125.295 E.09516
G1 X148.404 Y125.34
G1 X151.083 Y128.019 E.11638
G1 X151.083 Y128.552
G1 X147.687 Y125.156 E.14755
M204 S10000
; WIPE_START
G1 F24000
G1 X149.101 Y126.571 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I1.217 J-.022 P1  F30000
G1 X149.011 Y121.681 Z9.4
G1 Z9
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X145.917 Y118.587 E.13445
G1 X145.917 Y119.12
G1 X148.417 Y121.62 E.10862
G1 X147.958 Y121.694
G1 X145.917 Y119.654 E.08868
G1 X145.917 Y120.187
G1 X147.582 Y121.852 E.07235
G1 X147.27 Y122.072
G1 X145.917 Y120.72 E.05876
G1 X145.917 Y121.253
G1 X147.012 Y122.348 E.04756
G1 X146.811 Y122.681
G1 X145.917 Y121.787 E.03885
G1 X145.917 Y122.32
G1 X146.679 Y123.082 E.03311
G1 X146.643 Y123.579
G1 X145.917 Y122.853 E.03155
G1 X145.917 Y123.387
G1 X146.824 Y124.293 E.0394
G1 X145.917 Y123.92
G1 X151.083 Y129.085 E.22445
G1 X151.083 Y129.618
G1 X145.917 Y124.453 E.22445
G1 X145.917 Y124.986
G1 X151.083 Y130.152 E.22445
G1 X151.083 Y130.685
G1 X145.917 Y125.52 E.22445
G1 X145.917 Y126.053
G1 X151.083 Y131.218 E.22445
G1 X151.083 Y131.751
G1 X145.917 Y126.586 E.22445
M204 S10000
; WIPE_START
G1 F24000
G1 X147.332 Y128 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I-.624 J1.045 P1  F30000
G1 X153.945 Y131.947 Z9.4
G1 Z9
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X155.994 Y133.996 E.08905
G1 X156.037 Y134.573
G1 X153.36 Y131.895 E.11636
G1 X152.826 Y131.895
G1 X155.971 Y135.04 E.13667
G1 X155.559 Y135.161
G1 X152.293 Y131.895 E.14193
G1 X151.76 Y131.895
G1 X155.026 Y135.161 E.14193
G1 X154.493 Y135.161
G1 X151.226 Y131.895 E.14193
M204 S10000
; WIPE_START
G1 F24000
G1 X152.641 Y133.309 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I-.991 J.706 P1  F30000
G1 X153.959 Y135.161 Z9.4
G1 Z9
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X145.917 Y127.119 E.34946
G1 X145.917 Y127.653
G1 X153.426 Y135.161 E.32629
G1 X152.893 Y135.161
G1 X145.917 Y128.186 E.30312
G1 X145.917 Y128.719
G1 X152.36 Y135.161 E.27994
G1 X151.826 Y135.161
G1 X145.917 Y129.253 E.25677
G1 X145.917 Y129.786
G1 X151.293 Y135.161 E.2336
G1 X150.76 Y135.161
G1 X145.917 Y130.319 E.21042
G1 X145.917 Y130.852
G1 X150.227 Y135.161 E.18725
G1 X149.693 Y135.161
G1 X145.917 Y131.386 E.16408
G1 X145.812 Y131.813
G1 X149.16 Y135.161 E.1455
G1 X148.627 Y135.161
G1 X145.653 Y132.188 E.1292
G1 X145.487 Y132.556
G1 X148.093 Y135.161 E.11324
G1 X147.56 Y135.161
G1 X145.315 Y132.917 E.09755
G1 X145.135 Y133.269
G1 X147.027 Y135.161 E.08222
G1 X146.494 Y135.161
G1 X144.949 Y133.617 E.06712
G1 X144.756 Y133.957
G1 X145.96 Y135.161 E.05235
G1 X145.427 Y135.161
G1 X144.556 Y134.291 E.03784
G1 X144.35 Y134.618
G1 X144.894 Y135.161 E.02363
M204 S10000
G1 X144.408 Y134.942 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.172
G1 F15000
G1 X143.953 Y135.18 E.0054
; WIPE_START
G1 F24000
G1 X144.408 Y134.942 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I1.206 J.166 P1  F30000
G1 X145.953 Y123.689 Z9.4
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.131638
G1 F15000
G1 X145.917 Y123.873 E.00136
G1 X146.676 Y123.863 F30000
; LINE_WIDTH: 0.134125
G1 F15000
G1 X146.57 Y123.652 E.00175
; WIPE_START
G1 F24000
G1 X146.676 Y123.863 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I-.998 J.697 P1  F30000
G1 X147.623 Y125.22 Z9.4
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.220916
G1 F15000
G1 X147.47 Y125.096 E.00287
; LINE_WIDTH: 0.166207
G3 X147.038 Y124.697 I3.548 J-4.275 E.0059
; LINE_WIDTH: 0.151322
G1 X146.911 Y124.544 E.00176
; LINE_WIDTH: 0.179772
G1 X146.784 Y124.391 E.00222
; WIPE_START
G1 F24000
G1 X146.911 Y124.544 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I-.561 J1.08 P1  F30000
G1 X148.418 Y125.327 Z9.4
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.0924023
G1 F15000
G1 X148.203 Y125.406 E.00092
; WIPE_START
G1 F24000
G1 X148.418 Y125.327 E-.76
; WIPE_END
M73 P97 R0
G1 E-.04 F1800
G17
G3 Z9.4 I-1.118 J.48 P1  F30000
G1 X151.236 Y131.885 Z9.4
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.166495
G1 F15000
G1 X151.093 Y131.939 E.00154
G1 X151.039 Y131.885 E.00077
G1 X151.093 Y131.741 E.00154
; WIPE_START
G1 F24000
G1 X151.039 Y131.885 E-.30369
G1 X151.093 Y131.939 E-.15262
G1 X151.236 Y131.885 E-.30369
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I-.42 J1.142 P1  F30000
G1 X155.894 Y133.597 Z9.4
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.131879
G1 F15000
G1 X155.787 Y133.445 E.00135
; LINE_WIDTH: 0.174259
G1 X155.68 Y133.293 E.00199
; LINE_WIDTH: 0.216638
G1 X155.563 Y133.148 E.00263
; LINE_WIDTH: 0.257409
G1 X155.447 Y133.002 E.00325
; LINE_WIDTH: 0.311405
G2 X154.932 Y132.488 I-3.752 J3.242 E.01596
; LINE_WIDTH: 0.29718
G1 X154.744 Y132.334 E.00501
; LINE_WIDTH: 0.249328
G1 X154.611 Y132.238 E.00277
; LINE_WIDTH: 0.209136
G1 X154.478 Y132.142 E.00223
; LINE_WIDTH: 0.168944
G1 X154.344 Y132.045 E.00169
; WIPE_START
G1 F24000
G1 X154.478 Y132.142 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I1.065 J-.589 P1  F30000
G1 X148.663 Y121.622 Z9.4
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.088482
G1 F15000
G2 X148.494 Y121.543 I-.867 J1.643 E.00069
G1 X149.435 Y121.866 F30000
; LINE_WIDTH: 0.100193
G1 F15000
G2 X149.086 Y121.607 I-2.758 J3.338 E.00203
; WIPE_START
G1 F24000
G1 X149.435 Y121.866 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I-.902 J.817 P1  F30000
G1 X150.328 Y122.854 Z9.4
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.182058
G1 F15000
G1 X150.237 Y122.719 E.00184
; LINE_WIDTH: 0.128177
G1 X150.124 Y122.556 E.00138
; WIPE_START
G1 F24000
G1 X150.237 Y122.719 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I-.816 J.903 P1  F30000
G1 X151.055 Y123.458 Z9.4
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.121614
G1 F15000
G1 X151.082 Y123.282 E.00114
; WIPE_START
G1 F24000
G1 X151.055 Y123.458 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I1.214 J-.089 P1  F30000
G1 X150.099 Y110.379 Z9.4
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.213742
G1 F15000
G2 X149.577 Y109.86 I-2.975 J2.474 E.01026
; WIPE_START
G1 F24000
G1 X149.975 Y110.23 E-.55997
G1 X150.099 Y110.379 E-.20003
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I-.325 J-1.173 P1  F30000
G1 X146.644 Y111.337 Z9.4
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.100467
G1 F15000
G2 X146.567 Y111.505 I1.608 J.839 E.00087
G1 X146.805 Y112.249 F30000
; LINE_WIDTH: 0.0881695
G1 F15000
G1 X146.719 Y112.125 E.00056
; LINE_WIDTH: 0.134509
G1 X146.649 Y112.013 E.00098
G1 X145.944 Y111.414 F30000
; LINE_WIDTH: 0.119254
G1 F15000
G1 X145.918 Y111.587 E.00109
; WIPE_START
G1 F24000
G1 X145.944 Y111.414 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I.784 J.931 P1  F30000
G1 X147.97 Y109.707 Z9.4
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.115031
G1 F15000
G1 X147.898 Y109.689 E.00043
G1 X147.812 Y109.749 E.00061
; WIPE_START
G1 F24000
G1 X147.898 Y109.689 E-.44617
G1 X147.97 Y109.707 E-.31383
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I-.477 J-1.119 P1  F30000
G1 X112.37 Y124.887 Z9.4
G1 Z9
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X112.329 Y124.914 E.00152
G3 X111.294 Y121.83 I-.829 J-1.437 E.18049
G1 X111.459 Y121.818 E.00509
G3 X112.597 Y124.721 I.041 J1.659 E.12459
G1 X112.419 Y124.851 E.00679
M204 S10000
; WIPE_START
G1 F24000
G1 X112.329 Y124.914 E-.04156
G1 X112.029 Y125.052 E-.12557
G1 X111.706 Y125.125 E-.12564
G1 X111.376 Y125.133 E-.12563
G1 X111.05 Y125.076 E-.12564
G1 X110.743 Y124.955 E-.12563
G1 X110.543 Y124.826 E-.09034
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I1.21 J.127 P1  F30000
G1 X112.107 Y109.932 Z9.4
G1 Z9
G1 E.8 F1800
M204 S5000
G1 F12000
G3 X111.294 Y109.83 I-.607 J1.544 E.2949
G1 X111.459 Y109.818 E.00509
G3 X112.05 Y109.912 I.041 J1.659 E.01851
M204 S10000
; WIPE_START
G1 F24000
G1 X112.401 Y110.083 E-.14825
G1 X112.659 Y110.289 E-.12563
G1 X112.872 Y110.543 E-.12564
G1 X113.03 Y110.833 E-.12564
G1 X113.127 Y111.146 E-.12463
G1 X113.158 Y111.395 E-.09529
G1 X113.156 Y111.434 E-.01493
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I-1.189 J-.261 P1  F30000
G1 X108.71 Y131.688 Z9.4
G1 Z9
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X108.71 Y103.252 E.87374
G1 X114.29 Y103.252 E.17146
G1 X114.29 Y131.52 E.8686
G2 X116.421 Y135.369 I15.693 J-6.176 E.13556
G1 X103.896 Y135.369 E.38486
G3 X106.54 Y131.688 I2.642 J-.893 E.16257
G1 X108.65 Y131.688 E.06484
M204 S10000
; WIPE_START
G1 F24000
G1 X108.654 Y129.688 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I1.191 J.25 P1  F30000
G1 X114.083 Y103.817 Z9.4
G1 Z9
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
G1 F12000
G1 X113.725 Y103.46 E.01552
G1 X113.192 Y103.46
G1 X114.083 Y104.35 E.0387
G1 X114.083 Y104.884
G1 X112.659 Y103.46 E.06187
G1 X112.126 Y103.46
G1 X114.083 Y105.417 E.08504
G1 X114.083 Y105.95
G1 X111.592 Y103.46 E.10822
G1 X111.059 Y103.46
G1 X114.083 Y106.483 E.13139
G1 X114.083 Y107.017
G1 X110.526 Y103.46 E.15456
G1 X109.992 Y103.46
G1 X114.083 Y107.55 E.17774
G1 X114.083 Y108.083
G1 X109.459 Y103.46 E.20091
G1 X108.926 Y103.46
G1 X114.083 Y108.616 E.22408
G1 X114.083 Y109.15
G1 X108.917 Y103.984 E.22445
G1 X108.917 Y104.518
G1 X114.083 Y109.683 E.22445
G1 X114.083 Y110.216
G1 X108.917 Y105.051 E.22445
G1 X108.917 Y105.584
G1 X114.083 Y110.75 E.22445
G1 X114.083 Y111.283
G1 X108.917 Y106.118 E.22445
G1 X108.917 Y106.651
G1 X111.933 Y109.666 E.13103
G1 X111.355 Y109.621
G1 X108.917 Y107.184 E.10592
G1 X108.917 Y107.717
G1 X110.906 Y109.706 E.08642
G1 X110.543 Y109.876
G1 X108.917 Y108.251 E.07063
G1 X108.917 Y108.784
G1 X110.238 Y110.104 E.05738
G1 X109.987 Y110.387
G1 X108.917 Y109.317 E.0465
G1 X108.917 Y109.85
G1 X109.794 Y110.727 E.03811
G1 X109.671 Y111.137
G1 X108.917 Y110.384 E.03274
G1 X108.917 Y110.917
G1 X109.647 Y111.646 E.03169
G1 X109.902 Y112.435
G1 X108.917 Y111.45 E.04279
M204 S10000
; WIPE_START
G1 F24000
G1 X109.902 Y112.435 E-.5292
G1 X109.715 Y111.857 E-.2308
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I.011 J1.217 P1  F30000
G1 X114.083 Y111.816 Z9.4
G1 Z9
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X113.312 Y111.046 E.03348
G1 X113.358 Y111.625
G1 X114.083 Y112.349 E.03148
G1 X114.083 Y112.883
G1 X113.265 Y112.065 E.03553
G1 X113.097 Y112.43
G1 X114.083 Y113.416 E.04283
G1 X114.083 Y113.949
G1 X112.869 Y112.736 E.05272
G1 X112.587 Y112.987
G1 X114.083 Y114.482 E.065
G1 X114.083 Y115.016
G1 X112.247 Y113.181 E.07975
G1 X111.841 Y113.307
G1 X114.083 Y115.549 E.09741
G1 X114.083 Y116.082
G1 X111.338 Y113.337 E.11928
G1 X110.536 Y113.068
G1 X114.083 Y116.615 E.15413
G1 X114.083 Y117.149
G1 X108.917 Y111.984 E.22445
G1 X108.917 Y112.517
G1 X114.083 Y117.682 E.22445
G1 X114.083 Y118.215
G1 X108.917 Y113.05 E.22445
G1 X108.917 Y113.583
G1 X114.083 Y118.749 E.22445
G1 X114.083 Y119.282
G1 X108.917 Y114.117 E.22445
G1 X108.917 Y114.65
G1 X114.083 Y119.815 E.22445
G1 X114.083 Y120.348
G1 X108.917 Y115.183 E.22445
G1 X108.917 Y115.716
G1 X114.083 Y120.882 E.22445
G1 X114.083 Y121.415
G1 X108.917 Y116.25 E.22445
G1 X108.917 Y116.783
G1 X114.083 Y121.948 E.22445
G1 X114.083 Y122.481
G1 X108.917 Y117.316 E.22445
G1 X108.917 Y117.85
G1 X114.083 Y123.015 E.22445
G1 X113.157 Y122.623
G1 X114.083 Y123.548 E.0402
G1 X114.083 Y124.081
G1 X113.359 Y123.358 E.03143
G1 X113.321 Y123.853
G1 X114.083 Y124.615 E.03309
G1 X114.083 Y125.148
G1 X113.194 Y124.259 E.0386
G1 X112.996 Y124.595
G1 X114.083 Y125.681 E.0472
G1 X114.083 Y126.214
G1 X112.742 Y124.873 E.05827
G1 X112.432 Y125.097
G1 X114.083 Y126.748 E.07172
G1 X114.083 Y127.281
G1 X112.059 Y125.257 E.08793
G1 X111.604 Y125.335
G1 X114.083 Y127.814 E.10772
G1 X114.083 Y128.347
G1 X111.016 Y125.281 E.13327
M204 S10000
; WIPE_START
G1 F24000
G1 X112.43 Y126.695 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I1.217 J-.021 P1  F30000
G1 X112.348 Y121.813 Z9.4
G1 Z9
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X108.917 Y118.383 E.14906
G1 X108.917 Y118.916
G1 X111.616 Y121.615 E.11728
G1 X111.124 Y121.656
G1 X108.917 Y119.449 E.09591
G1 X108.917 Y119.983
G1 X110.723 Y121.788 E.07847
G1 X110.388 Y121.987
G1 X108.917 Y120.516 E.06392
G1 X108.917 Y121.049
G1 X110.11 Y122.242 E.05183
G1 X109.887 Y122.552
G1 X108.917 Y121.582 E.04213
G1 X108.917 Y122.116
G1 X109.724 Y122.922 E.03503
G1 X109.636 Y123.368
G1 X108.917 Y122.649 E.03124
G1 X108.917 Y123.182
M73 P98 R0
G1 X109.707 Y123.972 E.03431
G1 X108.917 Y123.715
G1 X114.083 Y128.881 E.22445
G1 X114.083 Y129.414
G1 X108.917 Y124.249 E.22445
G1 X108.917 Y124.782
G1 X114.083 Y129.947 E.22445
G1 X114.083 Y130.481
G1 X108.917 Y125.315 E.22445
G1 X108.917 Y125.849
G1 X114.083 Y131.014 E.22445
G1 X114.083 Y131.547
G1 X108.917 Y126.382 E.22445
G1 X108.917 Y126.915
G1 X114.471 Y132.469 E.24134
G1 X115.011 Y133.542
G1 X108.917 Y127.448 E.26478
G1 X108.917 Y127.982
G1 X115.837 Y134.901 E.3007
G1 X115.564 Y135.161
G1 X108.917 Y128.515 E.28882
G1 X108.917 Y129.048
G1 X115.031 Y135.161 E.26565
G1 X114.497 Y135.161
G1 X108.917 Y129.581 E.24248
G1 X108.917 Y130.115
G1 X113.964 Y135.161 E.21931
G1 X113.431 Y135.161
G1 X108.917 Y130.648 E.19613
G1 X108.917 Y131.181
G1 X112.898 Y135.161 E.17296
G1 X112.364 Y135.161
G1 X108.917 Y131.715 E.14979
G1 X108.565 Y131.895
G1 X111.831 Y135.161 E.14193
G1 X111.298 Y135.161
G1 X108.032 Y131.895 E.14193
G1 X107.498 Y131.895
G1 X110.765 Y135.161 E.14193
G1 X110.231 Y135.161
G1 X106.965 Y131.895 E.14193
G1 X106.44 Y131.903
G1 X109.698 Y135.161 E.14159
G1 X109.165 Y135.161
G1 X105.965 Y131.962 E.13903
G1 X105.559 Y132.089
G1 X108.631 Y135.161 E.13351
G1 X108.098 Y135.161
G1 X105.208 Y132.272 E.12558
G1 X104.894 Y132.49
G1 X107.565 Y135.161 E.11608
G1 X107.032 Y135.161
G1 X104.62 Y132.75 E.1048
G1 X104.387 Y133.05
G1 X106.498 Y135.161 E.09175
G1 X105.965 Y135.161
G1 X104.196 Y133.393 E.07686
G1 X104.054 Y133.784
G1 X105.432 Y135.161 E.05986
G1 X104.899 Y135.161
G1 X103.973 Y134.236 E.04021
G1 X103.977 Y134.773
G1 X104.365 Y135.161 E.01688
M204 S10000
; WIPE_START
G1 F24000
G1 X103.977 Y134.773 E-.20875
G1 X103.973 Y134.236 E-.20399
G1 X104.619 Y134.882 E-.34727
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I.089 J1.214 P1  F30000
G1 X115.326 Y134.096 Z9.4
G1 Z9
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0881695
G1 F15000
G1 X115.207 Y133.943 E.00072
; LINE_WIDTH: 0.134114
G1 X115.086 Y133.787 E.00147
; LINE_WIDTH: 0.179458
G1 X114.949 Y133.603 E.00255
; WIPE_START
G1 F24000
G1 X115.086 Y133.787 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I1.092 J-.537 P1  F30000
G1 X110.939 Y125.358 Z9.4
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.089825
G1 F15000
G3 X110.625 Y125.128 I2.118 J-3.22 E.00149
; WIPE_START
G1 F24000
G1 X110.939 Y125.358 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I-1.088 J.546 P1  F30000
G1 X114.248 Y131.953 Z9.4
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.0881695
G1 F15000
G1 X114.172 Y131.839 E.00051
; LINE_WIDTH: 0.127384
G1 X114.095 Y131.725 E.00095
; LINE_WIDTH: 0.166598
G1 X114.018 Y131.611 E.00138
; WIPE_START
G1 F24000
G1 X114.095 Y131.725 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I1.055 J-.607 P1  F30000
G1 X109.854 Y124.359 Z9.4
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.0881695
G1 F15000
G1 X109.784 Y124.258 E.00046
; LINE_WIDTH: 0.142121
G1 X109.714 Y124.156 E.001
G3 X109.711 Y123.997 I1.852 J-.115 E.00129
G1 X108.945 Y123.477 F30000
; LINE_WIDTH: 0.121592
G1 F15000
G1 X108.918 Y123.653 E.00114
; WIPE_START
G1 F24000
G1 X108.945 Y123.477 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I.265 J1.188 P1  F30000
G1 X113.197 Y122.53 Z9.4
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.189211
G1 F15000
G2 X112.688 Y121.978 I-4.349 J3.494 E.00896
; LINE_WIDTH: 0.171354
G1 X112.548 Y121.865 E.00188
; LINE_WIDTH: 0.199518
G1 X112.409 Y121.752 E.00229
; WIPE_START
G1 F24000
G1 X112.548 Y121.865 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I-1.007 J.683 P1  F30000
G1 X113.424 Y123.156 Z9.4
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.118717
G1 F15000
G1 X113.348 Y123.369 E.0014
; WIPE_START
G1 F24000
G1 X113.424 Y123.156 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I1.217 J-.013 P1  F30000
G1 X113.298 Y111.06 Z9.4
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.191028
G1 F15000
G1 X113.333 Y110.902 E.00195
; LINE_WIDTH: 0.187595
G1 X113.255 Y110.786 E.00166
; LINE_WIDTH: 0.137882
G1 X113.176 Y110.669 E.00109
; WIPE_START
G1 F24000
G1 X113.255 Y110.786 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I-.784 J-.93 P1  F30000
G1 X110.475 Y113.129 Z9.4
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.205976
G1 F15000
G3 X109.842 Y112.496 I2.453 J-3.085 E.01193
; WIPE_START
G1 F24000
G1 X110.03 Y112.721 E-.24872
G1 X110.292 Y112.98 E-.31163
G1 X110.475 Y113.129 E-.19965
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I1.098 J.524 P1  F30000
G1 X112.15 Y109.617 Z9.4
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.143499
G1 F15000
G1 X111.923 Y109.675 E.00192
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F24000
G1 X112.15 Y109.617 E-.76
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
G1 Z9.5 F900 ; lower z a little
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

    G1 Z109 F600
    G1 Z107

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

