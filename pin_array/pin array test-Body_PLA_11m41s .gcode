; HEADER_BLOCK_START
; BambuStudio 01.06.02.04
; model printing time: 5m 52s; total estimated time: 11m 41s
; total layer number: 55
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
; curr_bed_type = Cool Plate
; default_acceleration = 10000
; default_filament_colour = #FFFFFF
; default_filament_profile = "Bambu PLA Basic @BBL X1"
; default_print_profile = 0.20mm Standard @BBL P1P
; deretraction_speed = 30
; detect_narrow_internal_solid_infill = 1
; detect_overhang_wall = 1
; detect_thin_wall = 0
; different_settings_to_system = ;default_filament_colour;
; draft_shield = disabled
; elefant_foot_compensation = 0.15
; enable_arc_fitting = 1
; enable_overhang_bridge_fan = 1
; enable_overhang_speed = 1
; enable_prime_tower = 0
; enable_support = 0
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
; filament_settings_id = "kerr filament preset"
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
; inherits_group = ;"Bambu PLA Basic @BBL P1P";
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
; support_type = normal(auto)
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
M73 P0 R11
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
M140 S35 ;set bed temp
M190 S35 ;wait for bed temp



;=============turn on fans to prevent PLA jamming=================

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
M73 P37 R7
G1 Y245
G1 Y265 F3000
M620 M
M620 S0A   ; switch material if AMS exist
    M109 S220
    G1 X120 F12000

    G1 X20 Y50 F12000
    G1 Y-3
    T0
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
M73 P38 R7
G1 E50 F200
M400
M106 P1 S255
G92 E0
G1 E5 F300
M109 S200 ; drop nozzle temp, make filament shink a bit
G92 E0
G1 E-0.5 F300

G1 X70 F9000
M73 P40 R6
G1 X76 F15000
M73 P42 R6
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
M73 P43 R6
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
    G29 A X121.585 Y120 I16.8302 J20
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

    ;Prevent PLA from jamming

M106 P2 S100 ; turn on big fan ,to cool down toolhead


M104 S220 ; set extrude temp earlier, to reduce wait time

;===== mech mode fast check============================
M73 P44 R6
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
;curr_bed_type=Cool Plate

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
M981 S1 P20000 ;open spaghetti detector
M106 S0
M106 P2 S0
; CHANGE_LAYER
; Z_HEIGHT: 0.2
; LAYER_HEIGHT: 0.2
G1 E-.8 F1800
; layer num/total_layer_count: 1/55
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
G1 X137.558 Y137.143 F30000
G1 Z.4
M73 P45 R6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
G1 X122.442 Y137.143 E.56301
G1 X122.442 Y118.857 E.68108
G1 X137.558 Y118.857 E.56301
G1 X137.558 Y137.083 E.67884
G1 X138.015 Y137.6 F30000
; FEATURE: Outer wall
G1 F3000
G1 X121.985 Y137.6 E.59706
M73 P46 R6
G1 X121.985 Y118.4 E.71513
G1 X138.015 Y118.4 E.59706
G1 X138.015 Y137.54 E.71289
; WIPE_START
G1 F24000
G1 X136.015 Y137.547 E-.76
; WIPE_END
G1 E-.04 F1800
G17
M73 P47 R6
G3 Z.6 I1.217 J.028 P1  F30000
G1 X136.438 Y119.04 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.506244
G1 F6300
G1 X137.17 Y119.771 E.03906
G1 X137.17 Y120.427 E.02474
G1 X135.988 Y119.246 E.06306
G1 X135.333 Y119.246 E.02474
M73 P48 R6
G1 X137.17 Y121.082 E.09805
G1 X137.17 Y121.737 E.02474
G1 X134.678 Y119.246 E.13303
G1 X134.023 Y119.246 E.02474
G1 X137.17 Y122.392 E.16802
G1 X137.17 Y123.048 E.02474
G1 X133.367 Y119.246 E.20301
G1 X132.712 Y119.246 E.02474
G1 X137.17 Y123.703 E.23799
G1 X137.17 Y124.358 E.02474
G1 X132.057 Y119.246 E.27298
G1 X131.402 Y119.246 E.02474
G1 X137.17 Y125.013 E.30796
G1 X137.17 Y125.669 E.02474
G1 X130.747 Y119.246 E.34295
G1 X130.091 Y119.246 E.02474
G1 X137.17 Y126.324 E.37793
G1 X137.17 Y126.979 E.02474
M73 P48 R5
G1 X129.436 Y119.246 E.41292
M73 P49 R5
G1 X128.781 Y119.246 E.02474
G1 X137.17 Y127.634 E.4479
G1 X137.17 Y128.29 E.02474
G1 X128.126 Y119.246 E.48289
G1 X127.47 Y119.246 E.02474
G1 X137.17 Y128.945 E.51788
G1 X137.17 Y129.6 E.02474
G1 X126.815 Y119.246 E.55286
G1 X126.16 Y119.246 E.02474
G1 X137.17 Y130.255 E.58785
G1 X137.17 Y130.91 E.02474
G1 X125.505 Y119.246 E.62283
G1 X124.849 Y119.246 E.02474
G1 X137.17 Y131.566 E.65782
G1 X137.17 Y132.221 E.02474
G1 X124.194 Y119.246 E.6928
G1 X123.539 Y119.246 E.02474
G1 X137.17 Y132.876 E.72779
G1 X137.17 Y133.531 E.02474
M73 P50 R5
G1 X122.884 Y119.246 E.76278
G1 X122.83 Y119.246 E.00201
G1 X122.83 Y119.848 E.02273
G1 X137.17 Y134.187 E.76561
G1 X137.17 Y134.842 E.02474
G1 X122.83 Y120.503 E.76561
G1 X122.83 Y121.158 E.02474
G1 X137.17 Y135.497 E.76561
G1 X137.17 Y136.152 E.02474
G1 X122.83 Y121.813 E.76561
G1 X122.83 Y122.469 E.02474
G1 X137.116 Y136.754 E.76277
G1 X136.461 Y136.754 E.02474
G1 X122.83 Y123.124 E.72778
G1 X122.83 Y123.779 E.02474
G1 X135.806 Y136.754 E.6928
G1 X135.151 Y136.754 E.02474
G1 X122.83 Y124.434 E.65781
G1 X122.83 Y125.09 E.02474
G1 X134.495 Y136.754 E.62283
G1 X133.84 Y136.754 E.02474
G1 X122.83 Y125.745 E.58784
G1 X122.83 Y126.4 E.02474
G1 X133.185 Y136.754 E.55286
G1 X132.53 Y136.754 E.02474
G1 X122.83 Y127.055 E.51787
G1 X122.83 Y127.711 E.02474
G1 X131.874 Y136.754 E.48289
G1 X131.219 Y136.754 E.02474
G1 X122.83 Y128.366 E.4479
G1 X122.83 Y129.021 E.02474
G1 X130.564 Y136.754 E.41291
G1 X129.909 Y136.754 E.02474
G1 X122.83 Y129.676 E.37793
G1 X122.83 Y130.332 E.02474
G1 X129.253 Y136.754 E.34294
G1 X128.598 Y136.754 E.02474
G1 X122.83 Y130.987 E.30796
G1 X122.83 Y131.642 E.02474
G1 X127.943 Y136.754 E.27297
G1 X127.288 Y136.754 E.02474
G1 X122.83 Y132.297 E.23799
G1 X122.83 Y132.952 E.02474
G1 X126.632 Y136.754 E.203
G1 X125.977 Y136.754 E.02474
G1 X122.83 Y133.608 E.16801
G1 X122.83 Y134.263 E.02474
G1 X125.322 Y136.754 E.13303
G1 X124.667 Y136.754 E.02474
M73 P51 R5
G1 X122.83 Y134.918 E.09804
G1 X122.83 Y135.573 E.02474
G1 X124.011 Y136.754 E.06306
G1 X123.356 Y136.754 E.02474
G1 X122.625 Y136.023 E.03905
M106 S252.45
M106 P2 S178
; CHANGE_LAYER
; Z_HEIGHT: 0.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X123.356 Y136.754 E-.39308
G1 X124.011 Y136.754 E-.24899
G1 X123.792 Y136.535 E-.11793
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 2/55
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
G3 Z.6 I-.075 J1.215 P1  F30000
G1 X137.813 Y137.398 Z.6
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6777
G1 X122.187 Y137.398 E.51834
G1 X122.187 Y118.602 E.62349
G1 X137.813 Y118.602 E.51834
G1 X137.813 Y137.338 E.6215
G1 X138.205 Y137.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6777
G1 X121.795 Y137.79 E.50424
G1 X121.795 Y118.21 E.60164
G1 X138.205 Y118.21 E.50424
G1 X138.205 Y137.73 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X136.205 Y137.737 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I.726 J.976 P1  F30000
G1 X136.881 Y137.234 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42277
G1 F6777
G1 X137.48 Y136.636 E.0262
G1 X137.48 Y136.099 E.01663
G1 X136.514 Y137.065 E.04228
G1 X135.977 Y137.065 E.01663
G1 X137.48 Y135.562 E.0658
G1 X137.48 Y135.024 E.01663
M73 P52 R5
G1 X135.439 Y137.065 E.08931
G1 X134.902 Y137.065 E.01663
G1 X137.48 Y134.487 E.11283
G1 X137.48 Y133.95 E.01663
G1 X134.365 Y137.065 E.13634
G1 X133.828 Y137.065 E.01663
G1 X137.48 Y133.413 E.15986
G1 X137.48 Y132.876 E.01663
G1 X133.291 Y137.065 E.18337
G1 X132.753 Y137.065 E.01663
G1 X137.48 Y132.338 E.20689
G1 X137.48 Y131.801 E.01663
G1 X132.216 Y137.065 E.2304
G1 X131.679 Y137.065 E.01663
G1 X137.48 Y131.264 E.25392
G1 X137.48 Y130.727 E.01663
G1 X131.142 Y137.065 E.27743
G1 X130.605 Y137.065 E.01663
G1 X137.48 Y130.19 E.30095
G1 X137.48 Y129.652 E.01663
G1 X130.068 Y137.065 E.32446
G1 X129.53 Y137.065 E.01663
G1 X137.48 Y129.115 E.34798
G1 X137.48 Y128.578 E.01663
G1 X128.993 Y137.065 E.37149
G1 X128.456 Y137.065 E.01663
G1 X137.48 Y128.041 E.39501
G1 X137.48 Y127.504 E.01663
G1 X127.919 Y137.065 E.41852
G1 X127.382 Y137.065 E.01663
G1 X137.48 Y126.966 E.44204
G1 X137.48 Y126.429 E.01663
G1 X126.844 Y137.065 E.46555
G1 X126.307 Y137.065 E.01663
G1 X137.48 Y125.892 E.48907
G1 X137.48 Y125.355 E.01663
G1 X125.77 Y137.065 E.51258
G1 X125.233 Y137.065 E.01663
G1 X137.48 Y124.818 E.5361
G1 X137.48 Y124.281 E.01663
G1 X124.696 Y137.065 E.55961
G1 X124.158 Y137.065 E.01663
G1 X137.48 Y123.743 E.58313
G1 X137.48 Y123.206 E.01663
G1 X123.621 Y137.065 E.60664
G1 X123.084 Y137.065 E.01663
G1 X137.48 Y122.669 E.63016
G1 X137.48 Y122.132 E.01663
G1 X122.547 Y137.065 E.65367
G1 X122.52 Y137.065 E.00082
G1 X122.52 Y136.554 E.0158
G1 X137.48 Y121.595 E.65484
G1 X137.48 Y121.057 E.01663
G1 X122.52 Y136.017 E.65484
G1 X122.52 Y135.48 E.01663
G1 X137.48 Y120.52 E.65484
G1 X137.48 Y119.983 E.01663
G1 X122.52 Y134.943 E.65484
G1 X122.52 Y134.405 E.01663
G1 X137.48 Y119.446 E.65484
G1 X137.48 Y118.935 E.0158
G1 X137.453 Y118.935 E.00083
G1 X122.52 Y133.868 E.65367
G1 X122.52 Y133.331 E.01663
G1 X136.916 Y118.935 E.63015
G1 X136.379 Y118.935 E.01663
G1 X122.52 Y132.794 E.60664
G1 X122.52 Y132.257 E.01663
G1 X135.841 Y118.935 E.58312
G1 X135.304 Y118.935 E.01663
G1 X122.52 Y131.719 E.55961
G1 X122.52 Y131.182 E.01663
G1 X134.767 Y118.935 E.53609
G1 X134.23 Y118.935 E.01663
G1 X122.52 Y130.645 E.51258
G1 X122.52 Y130.108 E.01663
G1 X133.693 Y118.935 E.48907
G1 X133.156 Y118.935 E.01663
G1 X122.52 Y129.571 E.46555
G1 X122.52 Y129.033 E.01663
G1 X132.618 Y118.935 E.44204
G1 X132.081 Y118.935 E.01663
G1 X122.52 Y128.496 E.41852
G1 X122.52 Y127.959 E.01663
G1 X131.544 Y118.935 E.39501
G1 X131.007 Y118.935 E.01663
G1 X122.52 Y127.422 E.37149
G1 X122.52 Y126.885 E.01663
G1 X130.47 Y118.935 E.34798
G1 X129.932 Y118.935 E.01663
G1 X122.52 Y126.347 E.32446
G1 X122.52 Y125.81 E.01663
G1 X129.395 Y118.935 E.30095
G1 X128.858 Y118.935 E.01663
G1 X122.52 Y125.273 E.27743
G1 X122.52 Y124.736 E.01663
G1 X128.321 Y118.935 E.25392
G1 X127.784 Y118.935 E.01663
G1 X122.52 Y124.199 E.2304
G1 X122.52 Y123.662 E.01663
G1 X127.246 Y118.935 E.20689
G1 X126.709 Y118.935 E.01663
G1 X122.52 Y123.124 E.18337
G1 X122.52 Y122.587 E.01663
M73 P53 R5
G1 X126.172 Y118.935 E.15986
G1 X125.635 Y118.935 E.01663
G1 X122.52 Y122.05 E.13634
G1 X122.52 Y121.513 E.01663
G1 X125.098 Y118.935 E.11283
G1 X124.561 Y118.935 E.01663
G1 X122.52 Y120.976 E.08931
G1 X122.52 Y120.438 E.01663
G1 X124.023 Y118.935 E.0658
G1 X123.486 Y118.935 E.01663
G1 X122.52 Y119.901 E.04228
G1 X122.52 Y119.364 E.01663
G1 X123.119 Y118.766 E.02619
; CHANGE_LAYER
; Z_HEIGHT: 0.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X122.52 Y119.364 E-.32157
G1 X122.52 Y119.901 E-.20413
G1 X122.956 Y119.465 E-.2343
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 3/55
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
G3 Z.8 I-.937 J.776 P1  F30000
G1 X137.813 Y137.398 Z.8
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6815
G1 X122.187 Y137.398 E.51834
G1 X122.187 Y118.602 E.62349
G1 X137.813 Y118.602 E.51834
G1 X137.813 Y137.338 E.6215
G1 X138.205 Y137.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6815
G1 X121.795 Y137.79 E.50424
G1 X121.795 Y118.21 E.60164
G1 X138.205 Y118.21 E.50424
G1 X138.205 Y137.73 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X136.205 Y137.737 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I.111 J-1.212 P1  F30000
G1 X122.351 Y136.466 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42277
G1 F6815
G1 X122.949 Y137.065 E.02619
G1 X123.486 Y137.065 E.01663
G1 X122.52 Y136.099 E.04228
G1 X122.52 Y135.562 E.01663
G1 X124.023 Y137.065 E.0658
G1 X124.561 Y137.065 E.01663
G1 X122.52 Y135.024 E.08931
G1 X122.52 Y134.487 E.01663
G1 X125.098 Y137.065 E.11283
G1 X125.635 Y137.065 E.01663
G1 X122.52 Y133.95 E.13634
G1 X122.52 Y133.413 E.01663
G1 X126.172 Y137.065 E.15986
G1 X126.709 Y137.065 E.01663
G1 X122.52 Y132.876 E.18337
G1 X122.52 Y132.338 E.01663
G1 X127.246 Y137.065 E.20689
G1 X127.784 Y137.065 E.01663
G1 X122.52 Y131.801 E.2304
G1 X122.52 Y131.264 E.01663
G1 X128.321 Y137.065 E.25392
G1 X128.858 Y137.065 E.01663
G1 X122.52 Y130.727 E.27743
G1 X122.52 Y130.19 E.01663
G1 X129.395 Y137.065 E.30095
G1 X129.932 Y137.065 E.01663
G1 X122.52 Y129.653 E.32446
G1 X122.52 Y129.115 E.01663
G1 X130.47 Y137.065 E.34798
G1 X131.007 Y137.065 E.01663
G1 X122.52 Y128.578 E.37149
G1 X122.52 Y128.041 E.01663
G1 X131.544 Y137.065 E.39501
G1 X132.081 Y137.065 E.01663
G1 X122.52 Y127.504 E.41852
G1 X122.52 Y126.967 E.01663
G1 X132.618 Y137.065 E.44204
G1 X133.156 Y137.065 E.01663
G1 X122.52 Y126.429 E.46555
G1 X122.52 Y125.892 E.01663
G1 X133.693 Y137.065 E.48907
G1 X134.23 Y137.065 E.01663
G1 X122.52 Y125.355 E.51258
G1 X122.52 Y124.818 E.01663
G1 X134.767 Y137.065 E.53609
G1 X135.304 Y137.065 E.01663
G1 X122.52 Y124.281 E.55961
G1 X122.52 Y123.743 E.01663
G1 X135.841 Y137.065 E.58312
G1 X136.379 Y137.065 E.01663
G1 X122.52 Y123.206 E.60664
G1 X122.52 Y122.669 E.01663
G1 X136.916 Y137.065 E.63015
G1 X137.453 Y137.065 E.01663
G1 X122.52 Y122.132 E.65367
G1 X122.52 Y121.595 E.01663
G1 X137.48 Y136.554 E.65484
G1 X137.48 Y136.017 E.01663
G1 X122.52 Y121.057 E.65484
G1 X122.52 Y120.52 E.01663
G1 X137.48 Y135.48 E.65484
G1 X137.48 Y134.943 E.01663
G1 X122.52 Y119.983 E.65484
G1 X122.52 Y119.446 E.01663
G1 X137.48 Y134.405 E.65484
G1 X137.48 Y133.868 E.01663
G1 X122.547 Y118.935 E.65367
G1 X123.084 Y118.935 E.01663
G1 X137.48 Y133.331 E.63016
G1 X137.48 Y132.794 E.01663
G1 X123.621 Y118.935 E.60664
G1 X124.158 Y118.935 E.01663
G1 X137.48 Y132.257 E.58313
G1 X137.48 Y131.719 E.01663
G1 X124.696 Y118.935 E.55961
G1 X125.233 Y118.935 E.01663
G1 X137.48 Y131.182 E.5361
M73 P54 R5
G1 X137.48 Y130.645 E.01663
G1 X125.77 Y118.935 E.51258
G1 X126.307 Y118.935 E.01663
G1 X137.48 Y130.108 E.48907
G1 X137.48 Y129.571 E.01663
G1 X126.844 Y118.935 E.46555
G1 X127.382 Y118.935 E.01663
G1 X137.48 Y129.034 E.44204
G1 X137.48 Y128.496 E.01663
G1 X127.919 Y118.935 E.41852
G1 X128.456 Y118.935 E.01663
G1 X137.48 Y127.959 E.39501
G1 X137.48 Y127.422 E.01663
G1 X128.993 Y118.935 E.37149
G1 X129.53 Y118.935 E.01663
G1 X137.48 Y126.885 E.34798
G1 X137.48 Y126.348 E.01663
G1 X130.068 Y118.935 E.32446
G1 X130.605 Y118.935 E.01663
G1 X137.48 Y125.81 E.30095
G1 X137.48 Y125.273 E.01663
G1 X131.142 Y118.935 E.27743
G1 X131.679 Y118.935 E.01663
G1 X137.48 Y124.736 E.25392
G1 X137.48 Y124.199 E.01663
G1 X132.216 Y118.935 E.2304
G1 X132.753 Y118.935 E.01663
G1 X137.48 Y123.662 E.20689
G1 X137.48 Y123.124 E.01663
G1 X133.291 Y118.935 E.18337
G1 X133.828 Y118.935 E.01663
G1 X137.48 Y122.587 E.15986
G1 X137.48 Y122.05 E.01663
G1 X134.365 Y118.935 E.13634
G1 X134.902 Y118.935 E.01663
G1 X137.48 Y121.513 E.11283
G1 X137.48 Y120.976 E.01663
G1 X135.439 Y118.935 E.08931
G1 X135.977 Y118.935 E.01663
G1 X137.48 Y120.438 E.0658
G1 X137.48 Y119.901 E.01663
G1 X136.514 Y118.935 E.04228
G1 X137.051 Y118.935 E.01663
G1 X137.649 Y119.534 E.0262
; CHANGE_LAYER
; Z_HEIGHT: 0.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X137.051 Y118.935 E-.32161
G1 X136.514 Y118.935 E-.20413
G1 X136.95 Y119.371 E-.23425
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 4/55
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
G3 Z1 I-1.216 J.058 P1  F30000
G1 X137.813 Y137.398 Z1
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1992
G1 X122.187 Y137.398 E.51834
G1 X122.187 Y118.602 E.62349
G1 X137.813 Y118.602 E.51834
G1 X137.813 Y137.338 E.6215
G1 X138.205 Y137.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1992
G1 X121.795 Y137.79 E.50424
G1 X121.795 Y118.21 E.60164
G1 X138.205 Y118.21 E.50424
G1 X138.205 Y137.73 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X136.205 Y137.737 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I1.213 J-.099 P1  F30000
G1 X134.674 Y118.95 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1992
G1 X136.302 Y118.95 E.05401
G1 X137.465 Y120.113 E.05453
G1 X137.465 Y120.535 E.01401
G1 X122.535 Y135.465 E.70037
G1 X122.535 Y135.887 E.01401
G1 X123.698 Y137.05 E.05453
G1 X128.626 Y137.05 E.16349
G1 X137.465 Y128.211 E.41463
G1 X137.465 Y127.789 E.01401
G1 X128.626 Y118.95 E.41463
G1 X131.374 Y118.95 E.09114
G1 X122.535 Y127.789 E.41463
G1 X122.535 Y128.211 E.01401
G1 X131.374 Y137.05 E.41463
G1 X136.302 Y137.05 E.16349
G1 X137.465 Y135.887 E.05453
G1 X137.465 Y135.465 E.01401
G1 X122.535 Y120.535 E.70037
G1 X122.535 Y120.113 E.01401
G1 X123.698 Y118.95 E.05453
G1 X125.326 Y118.95 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X123.698 Y118.95 E-.61876
G1 X123.435 Y119.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 5/55
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
G3 Z1.2 I-.955 J.755 P1  F30000
G1 X137.813 Y137.398 Z1.2
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1995
G1 X122.187 Y137.398 E.51834
M73 P55 R5
G1 X122.187 Y118.602 E.62349
G1 X137.813 Y118.602 E.51834
G1 X137.813 Y137.338 E.6215
G1 X138.205 Y137.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1995
G1 X121.795 Y137.79 E.50424
G1 X121.795 Y118.21 E.60164
G1 X138.205 Y118.21 E.50424
G1 X138.205 Y137.73 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X136.205 Y137.737 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I1.213 J-.099 P1  F30000
G1 X134.674 Y118.95 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1995
G1 X136.302 Y118.95 E.05401
G1 X137.465 Y120.113 E.05453
G1 X137.465 Y120.535 E.01401
G1 X122.535 Y135.465 E.70037
G1 X122.535 Y135.887 E.01401
G1 X123.698 Y137.05 E.05453
G1 X128.626 Y137.05 E.16349
G1 X137.465 Y128.211 E.41463
G1 X137.465 Y127.789 E.01401
G1 X128.626 Y118.95 E.41463
G1 X131.374 Y118.95 E.09114
G1 X122.535 Y127.789 E.41463
G1 X122.535 Y128.211 E.01401
G1 X131.374 Y137.05 E.41463
G1 X136.302 Y137.05 E.16349
G1 X137.465 Y135.887 E.05453
G1 X137.465 Y135.465 E.01401
G1 X122.535 Y120.535 E.70037
M73 P56 R5
G1 X122.535 Y120.113 E.01401
G1 X123.698 Y118.95 E.05453
G1 X125.326 Y118.95 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 1.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X123.698 Y118.95 E-.61876
G1 X123.435 Y119.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 6/55
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
G3 Z1.4 I-.955 J.755 P1  F30000
G1 X137.813 Y137.398 Z1.4
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1995
G1 X122.187 Y137.398 E.51834
G1 X122.187 Y118.602 E.62349
G1 X137.813 Y118.602 E.51834
G1 X137.813 Y137.338 E.6215
G1 X138.205 Y137.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1995
G1 X121.795 Y137.79 E.50424
G1 X121.795 Y118.21 E.60164
G1 X138.205 Y118.21 E.50424
G1 X138.205 Y137.73 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X136.205 Y137.737 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I1.213 J-.099 P1  F30000
G1 X134.674 Y118.95 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1995
G1 X136.302 Y118.95 E.05401
G1 X137.465 Y120.113 E.05453
G1 X137.465 Y120.535 E.01401
G1 X122.535 Y135.465 E.70037
G1 X122.535 Y135.887 E.01401
G1 X123.698 Y137.05 E.05453
G1 X128.626 Y137.05 E.16349
G1 X137.465 Y128.211 E.41463
G1 X137.465 Y127.789 E.01401
G1 X128.626 Y118.95 E.41463
G1 X131.374 Y118.95 E.09114
G1 X122.535 Y127.789 E.41463
M73 P57 R5
G1 X122.535 Y128.211 E.01401
G1 X131.374 Y137.05 E.41463
G1 X136.302 Y137.05 E.16349
G1 X137.465 Y135.887 E.05453
G1 X137.465 Y135.465 E.01401
G1 X122.535 Y120.535 E.70037
G1 X122.535 Y120.113 E.01401
G1 X123.698 Y118.95 E.05453
G1 X125.326 Y118.95 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 1.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
M73 P57 R4
G1 X123.698 Y118.95 E-.61876
G1 X123.435 Y119.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 7/55
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
G3 Z1.6 I-.955 J.755 P1  F30000
G1 X137.813 Y137.398 Z1.6
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1995
G1 X122.187 Y137.398 E.51834
G1 X122.187 Y118.602 E.62349
G1 X137.813 Y118.602 E.51834
G1 X137.813 Y137.338 E.6215
G1 X138.205 Y137.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1995
G1 X121.795 Y137.79 E.50424
G1 X121.795 Y118.21 E.60164
G1 X138.205 Y118.21 E.50424
G1 X138.205 Y137.73 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X136.205 Y137.737 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I1.213 J-.099 P1  F30000
G1 X134.674 Y118.95 Z1.8
G1 Z1.4
M73 P58 R4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1995
G1 X136.302 Y118.95 E.05401
G1 X137.465 Y120.113 E.05453
G1 X137.465 Y120.535 E.01401
G1 X122.535 Y135.465 E.70037
G1 X122.535 Y135.887 E.01401
G1 X123.698 Y137.05 E.05453
G1 X128.626 Y137.05 E.16349
G1 X137.465 Y128.211 E.41463
G1 X137.465 Y127.789 E.01401
G1 X128.626 Y118.95 E.41463
G1 X131.374 Y118.95 E.09114
G1 X122.535 Y127.789 E.41463
G1 X122.535 Y128.211 E.01401
G1 X131.374 Y137.05 E.41463
G1 X136.302 Y137.05 E.16349
G1 X137.465 Y135.887 E.05453
G1 X137.465 Y135.465 E.01401
G1 X122.535 Y120.535 E.70037
G1 X122.535 Y120.113 E.01401
G1 X123.698 Y118.95 E.05453
G1 X125.326 Y118.95 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 1.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X123.698 Y118.95 E-.61876
G1 X123.435 Y119.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 8/55
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
G3 Z1.8 I-.955 J.755 P1  F30000
G1 X137.813 Y137.398 Z1.8
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1995
G1 X122.187 Y137.398 E.51834
G1 X122.187 Y118.602 E.62349
G1 X137.813 Y118.602 E.51834
G1 X137.813 Y137.338 E.6215
G1 X138.205 Y137.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1995
G1 X121.795 Y137.79 E.50424
G1 X121.795 Y118.21 E.60164
G1 X138.205 Y118.21 E.50424
G1 X138.205 Y137.73 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X136.205 Y137.737 E-.76
; WIPE_END
M73 P59 R4
G1 E-.04 F1800
G17
G3 Z2 I1.213 J-.099 P1  F30000
G1 X134.674 Y118.95 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1995
G1 X136.302 Y118.95 E.05401
G1 X137.465 Y120.113 E.05453
G1 X137.465 Y120.535 E.01401
G1 X122.535 Y135.465 E.70037
G1 X122.535 Y135.887 E.01401
G1 X123.698 Y137.05 E.05453
G1 X128.626 Y137.05 E.16349
G1 X137.465 Y128.211 E.41463
G1 X137.465 Y127.789 E.01401
G1 X128.626 Y118.95 E.41463
G1 X131.374 Y118.95 E.09114
G1 X122.535 Y127.789 E.41463
G1 X122.535 Y128.211 E.01401
G1 X131.374 Y137.05 E.41463
G1 X136.302 Y137.05 E.16349
G1 X137.465 Y135.887 E.05453
G1 X137.465 Y135.465 E.01401
G1 X122.535 Y120.535 E.70037
G1 X122.535 Y120.113 E.01401
G1 X123.698 Y118.95 E.05453
G1 X125.326 Y118.95 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X123.698 Y118.95 E-.61876
G1 X123.435 Y119.213 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 9/55
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
G3 Z2 I-.955 J.755 P1  F30000
G1 X137.813 Y137.398 Z2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2461
G1 X122.187 Y137.398 E.51834
G1 X122.187 Y118.602 E.62349
G1 X137.813 Y118.602 E.51834
G1 X137.813 Y137.338 E.6215
G1 X138.205 Y137.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2461
G1 X121.795 Y137.79 E.50424
G1 X121.795 Y118.21 E.60164
M73 P60 R4
G1 X138.205 Y118.21 E.50424
G1 X138.205 Y137.73 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X136.205 Y137.737 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I.583 J1.068 P1  F30000
G1 X137.465 Y137.05 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2461
G1 X122.535 Y137.05 E.49524
G1 X122.535 Y118.95 E.60039
G1 X137.465 Y118.95 E.49524
G1 X137.465 Y136.99 E.5984
G1 X135.081 Y119.357 F30000
G1 F2461
G1 X136.709 Y119.357 E.05401
G1 X137.058 Y119.706 E.01634
G1 X137.058 Y120.942 E.04102
G1 X122.942 Y135.058 E.66218
G1 X122.942 Y136.294 E.04102
G1 X123.291 Y136.643 E.01634
G1 X129.033 Y136.643 E.1905
G1 X137.058 Y128.618 E.37644
G1 X137.058 Y127.382 E.04102
G1 X129.033 Y119.357 E.37644
G1 X130.967 Y119.357 E.06413
G1 X122.942 Y127.382 E.37644
G1 X122.942 Y128.618 E.04102
G1 X130.967 Y136.643 E.37644
G1 X136.709 Y136.643 E.1905
G1 X137.058 Y136.294 E.01634
G1 X137.058 Y135.058 E.04102
G1 X122.942 Y120.942 E.66218
G1 X122.942 Y119.706 E.04102
G1 X123.291 Y119.357 E.01634
G1 X124.919 Y119.357 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X123.291 Y119.357 E-.61876
G1 X123.028 Y119.62 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 10/55
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
G3 Z2.2 I-.936 J.778 P1  F30000
G1 X137.813 Y137.398 Z2.2
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
M73 P61 R4
G1 F2461
G1 X122.187 Y137.398 E.51834
G1 X122.187 Y118.602 E.62349
G1 X137.813 Y118.602 E.51834
G1 X137.813 Y137.338 E.6215
G1 X138.205 Y137.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2461
G1 X121.795 Y137.79 E.50424
G1 X121.795 Y118.21 E.60164
G1 X138.205 Y118.21 E.50424
G1 X138.205 Y137.73 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X136.205 Y137.737 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I.583 J1.068 P1  F30000
G1 X137.465 Y137.05 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2461
G1 X122.535 Y137.05 E.49524
G1 X122.535 Y118.95 E.60039
G1 X137.465 Y118.95 E.49524
G1 X137.465 Y136.99 E.5984
G1 X135.081 Y119.357 F30000
G1 F2461
G1 X136.709 Y119.357 E.05401
G1 X137.058 Y119.706 E.01634
G1 X137.058 Y120.942 E.04102
G1 X122.942 Y135.058 E.66218
G1 X122.942 Y136.294 E.04102
G1 X123.291 Y136.643 E.01634
G1 X129.033 Y136.643 E.1905
G1 X137.058 Y128.618 E.37644
G1 X137.058 Y127.382 E.04102
G1 X129.033 Y119.357 E.37644
G1 X130.967 Y119.357 E.06413
G1 X122.942 Y127.382 E.37644
M73 P62 R4
G1 X122.942 Y128.618 E.04102
G1 X130.967 Y136.643 E.37644
G1 X136.709 Y136.643 E.1905
G1 X137.058 Y136.294 E.01634
G1 X137.058 Y135.058 E.04102
G1 X122.942 Y120.942 E.66218
G1 X122.942 Y119.706 E.04102
G1 X123.291 Y119.357 E.01634
G1 X124.919 Y119.357 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 2.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X123.291 Y119.357 E-.61876
G1 X123.028 Y119.62 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 11/55
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
G3 Z2.4 I-.936 J.778 P1  F30000
G1 X137.813 Y137.398 Z2.4
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2461
G1 X122.187 Y137.398 E.51834
G1 X122.187 Y118.602 E.62349
G1 X137.813 Y118.602 E.51834
G1 X137.813 Y137.338 E.6215
G1 X138.205 Y137.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2461
G1 X121.795 Y137.79 E.50424
G1 X121.795 Y118.21 E.60164
G1 X138.205 Y118.21 E.50424
G1 X138.205 Y137.73 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X136.205 Y137.737 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I.583 J1.068 P1  F30000
G1 X137.465 Y137.05 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2461
G1 X122.535 Y137.05 E.49524
G1 X122.535 Y118.95 E.60039
G1 X137.465 Y118.95 E.49524
G1 X137.465 Y136.99 E.5984
G1 X135.081 Y119.357 F30000
G1 F2461
G1 X136.709 Y119.357 E.05401
G1 X137.058 Y119.706 E.01634
G1 X137.058 Y120.942 E.04102
M73 P63 R4
G1 X122.942 Y135.058 E.66218
G1 X122.942 Y136.294 E.04102
G1 X123.291 Y136.643 E.01634
G1 X129.033 Y136.643 E.1905
G1 X137.058 Y128.618 E.37644
G1 X137.058 Y127.382 E.04102
G1 X129.033 Y119.357 E.37644
G1 X130.967 Y119.357 E.06413
G1 X122.942 Y127.382 E.37644
G1 X122.942 Y128.618 E.04102
G1 X130.967 Y136.643 E.37644
G1 X136.709 Y136.643 E.1905
G1 X137.058 Y136.294 E.01634
G1 X137.058 Y135.058 E.04102
G1 X122.942 Y120.942 E.66218
G1 X122.942 Y119.706 E.04102
G1 X123.291 Y119.357 E.01634
G1 X124.919 Y119.357 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 2.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X123.291 Y119.357 E-.61876
G1 X123.028 Y119.62 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 12/55
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
G3 Z2.6 I-.936 J.778 P1  F30000
G1 X137.813 Y137.398 Z2.6
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2461
G1 X122.187 Y137.398 E.51834
G1 X122.187 Y118.602 E.62349
G1 X137.813 Y118.602 E.51834
G1 X137.813 Y137.338 E.6215
G1 X138.205 Y137.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2461
G1 X121.795 Y137.79 E.50424
G1 X121.795 Y118.21 E.60164
G1 X138.205 Y118.21 E.50424
G1 X138.205 Y137.73 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X136.205 Y137.737 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I.583 J1.068 P1  F30000
G1 X137.465 Y137.05 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2461
G1 X122.535 Y137.05 E.49524
M73 P64 R4
G1 X122.535 Y118.95 E.60039
G1 X137.465 Y118.95 E.49524
G1 X137.465 Y136.99 E.5984
G1 X135.081 Y119.357 F30000
G1 F2461
G1 X136.709 Y119.357 E.05401
G1 X137.058 Y119.706 E.01634
G1 X137.058 Y120.942 E.04102
G1 X122.942 Y135.058 E.66218
G1 X122.942 Y136.294 E.04102
G1 X123.291 Y136.643 E.01634
G1 X129.033 Y136.643 E.1905
G1 X137.058 Y128.618 E.37644
G1 X137.058 Y127.382 E.04102
G1 X129.033 Y119.357 E.37644
G1 X130.967 Y119.357 E.06413
G1 X122.942 Y127.382 E.37644
G1 X122.942 Y128.618 E.04102
G1 X130.967 Y136.643 E.37644
G1 X136.709 Y136.643 E.1905
G1 X137.058 Y136.294 E.01634
G1 X137.058 Y135.058 E.04102
G1 X122.942 Y120.942 E.66218
G1 X122.942 Y119.706 E.04102
G1 X123.291 Y119.357 E.01634
G1 X124.919 Y119.357 E.05401
M106 S244.8
; CHANGE_LAYER
; Z_HEIGHT: 2.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X123.291 Y119.357 E-.61876
G1 X123.028 Y119.62 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 13/55
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
G3 Z2.8 I-.936 J.778 P1  F30000
G1 X137.813 Y137.398 Z2.8
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X122.187 Y137.398 E.51834
G1 X122.187 Y118.602 E.62349
G1 X137.813 Y118.602 E.51834
G1 X137.813 Y137.338 E.6215
G1 X138.205 Y137.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X121.795 Y137.79 E.50424
G1 X121.795 Y118.21 E.60164
M73 P65 R4
G1 X138.205 Y118.21 E.50424
G1 X138.205 Y137.73 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X136.205 Y137.737 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I.062 J-1.215 P1  F30000
G1 X122.354 Y137.028 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.401375
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X137.443 Y137.028 E.77788
G1 X137.443 Y136.576 E.02327
G1 X122.557 Y136.576 E.76744
G1 X122.557 Y136.125 E.02327
G1 X137.443 Y136.125 E.76744
G1 X137.443 Y135.673 E.02327
G1 X122.557 Y135.673 E.76744
G1 X122.557 Y135.222 E.02327
G1 X137.443 Y135.222 E.76744
G1 X137.443 Y134.771 E.02327
G1 X122.557 Y134.771 E.76744
G1 X122.557 Y134.319 E.02327
G1 X137.443 Y134.319 E.76744
G1 X137.443 Y133.868 E.02327
G1 X122.557 Y133.868 E.76744
G1 X122.557 Y133.417 E.02327
G1 X137.443 Y133.417 E.76744
G1 X137.443 Y132.965 E.02327
G1 X122.557 Y132.965 E.76744
G1 X122.557 Y132.514 E.02327
G1 X137.443 Y132.514 E.76744
G1 X137.443 Y132.062 E.02327
G1 X122.557 Y132.062 E.76744
G1 X122.557 Y131.611 E.02327
G1 X137.443 Y131.611 E.76744
G1 X137.443 Y131.16 E.02327
G1 X122.557 Y131.16 E.76744
G1 X122.557 Y130.708 E.02327
G1 X137.443 Y130.708 E.76744
G1 X137.443 Y130.257 E.02327
G1 X122.557 Y130.257 E.76744
G1 X122.557 Y129.806 E.02327
G1 X137.443 Y129.806 E.76744
G1 X137.443 Y129.354 E.02327
G1 X122.557 Y129.354 E.76744
G1 X122.557 Y128.903 E.02327
G1 X137.443 Y128.903 E.76744
G1 X137.443 Y128.451 E.02327
G1 X122.557 Y128.451 E.76744
G1 X122.557 Y128 E.02327
G1 X137.443 Y128 E.76744
G1 X137.443 Y127.549 E.02327
G1 X122.557 Y127.549 E.76744
G1 X122.557 Y127.097 E.02327
M73 P65 R3
G1 X137.443 Y127.097 E.76744
G1 X137.443 Y126.646 E.02327
G1 X122.557 Y126.646 E.76744
G1 X122.557 Y126.195 E.02327
G1 X137.443 Y126.195 E.76744
G1 X137.443 Y125.743 E.02327
G1 X122.557 Y125.743 E.76744
G1 X122.557 Y125.292 E.02327
G1 X137.443 Y125.292 E.76744
G1 X137.443 Y124.84 E.02327
G1 X122.557 Y124.84 E.76744
G1 X122.557 Y124.389 E.02327
G1 X137.443 Y124.389 E.76744
M73 P66 R3
G1 X137.443 Y123.938 E.02327
G1 X122.557 Y123.938 E.76744
G1 X122.557 Y123.486 E.02327
G1 X137.443 Y123.486 E.76744
G1 X137.443 Y123.035 E.02327
G1 X122.557 Y123.035 E.76744
G1 X122.557 Y122.584 E.02327
G1 X137.443 Y122.584 E.76744
G1 X137.443 Y122.132 E.02327
G1 X122.557 Y122.132 E.76744
G1 X122.557 Y121.681 E.02327
G1 X137.443 Y121.681 E.76744
G1 X137.443 Y121.229 E.02327
G1 X122.557 Y121.229 E.76744
G1 X122.557 Y120.778 E.02327
G1 X137.443 Y120.778 E.76744
G1 X137.443 Y120.327 E.02327
G1 X122.557 Y120.327 E.76744
G1 X122.557 Y119.875 E.02327
G1 X137.443 Y119.875 E.76744
G1 X137.443 Y119.424 E.02327
G1 X122.557 Y119.424 E.76744
G1 X122.557 Y118.973 E.02327
G1 X137.646 Y118.973 E.77788
M106 S244.8
M106 S252.45
; CHANGE_LAYER
; Z_HEIGHT: 2.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X135.646 Y118.973 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 14/55
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
G3 Z3 I-1.209 J.142 P1  F30000
G1 X137.813 Y137.398 Z3
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6786
G1 X122.187 Y137.398 E.51834
G1 X122.187 Y118.602 E.62349
G1 X137.813 Y118.602 E.51834
G1 X137.813 Y137.338 E.6215
G1 X138.205 Y137.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6786
G1 X121.795 Y137.79 E.50424
G1 X121.795 Y118.21 E.60164
G1 X138.205 Y118.21 E.50424
G1 X138.205 Y137.73 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X136.205 Y137.737 E-.76
; WIPE_END
M73 P67 R3
G1 E-.04 F1800
G17
G3 Z3.2 I.726 J.976 P1  F30000
G1 X136.881 Y137.234 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42277
G1 F6786
G1 X137.48 Y136.636 E.0262
G1 X137.48 Y136.099 E.01663
G1 X136.514 Y137.065 E.04228
G1 X135.977 Y137.065 E.01663
G1 X137.48 Y135.562 E.0658
G1 X137.48 Y135.024 E.01663
G1 X135.439 Y137.065 E.08931
G1 X134.902 Y137.065 E.01663
G1 X137.48 Y134.487 E.11283
G1 X137.48 Y133.95 E.01663
G1 X134.365 Y137.065 E.13634
G1 X133.828 Y137.065 E.01663
G1 X137.48 Y133.413 E.15986
G1 X137.48 Y132.876 E.01663
G1 X133.291 Y137.065 E.18337
G1 X132.753 Y137.065 E.01663
G1 X137.48 Y132.338 E.20689
G1 X137.48 Y131.801 E.01663
G1 X132.216 Y137.065 E.2304
G1 X131.679 Y137.065 E.01663
G1 X137.48 Y131.264 E.25392
G1 X137.48 Y130.727 E.01663
G1 X131.142 Y137.065 E.27743
G1 X130.605 Y137.065 E.01663
G1 X137.48 Y130.19 E.30095
G1 X137.48 Y129.652 E.01663
G1 X130.068 Y137.065 E.32446
G1 X129.53 Y137.065 E.01663
G1 X137.48 Y129.115 E.34798
G1 X137.48 Y128.578 E.01663
G1 X128.993 Y137.065 E.37149
G1 X128.456 Y137.065 E.01663
G1 X137.48 Y128.041 E.39501
G1 X137.48 Y127.504 E.01663
G1 X127.919 Y137.065 E.41852
G1 X127.382 Y137.065 E.01663
G1 X137.48 Y126.966 E.44204
G1 X137.48 Y126.429 E.01663
G1 X126.844 Y137.065 E.46555
G1 X126.307 Y137.065 E.01663
G1 X137.48 Y125.892 E.48907
G1 X137.48 Y125.355 E.01663
G1 X125.77 Y137.065 E.51258
G1 X125.233 Y137.065 E.01663
G1 X137.48 Y124.818 E.5361
G1 X137.48 Y124.281 E.01663
G1 X124.696 Y137.065 E.55961
G1 X124.158 Y137.065 E.01663
G1 X137.48 Y123.743 E.58313
G1 X137.48 Y123.206 E.01663
G1 X123.621 Y137.065 E.60664
G1 X123.084 Y137.065 E.01663
G1 X137.48 Y122.669 E.63016
G1 X137.48 Y122.132 E.01663
G1 X122.547 Y137.065 E.65367
G1 X122.52 Y137.065 E.00082
G1 X122.52 Y136.554 E.0158
G1 X137.48 Y121.595 E.65484
M73 P68 R3
G1 X137.48 Y121.057 E.01663
G1 X122.52 Y136.017 E.65484
G1 X122.52 Y135.48 E.01663
G1 X137.48 Y120.52 E.65484
G1 X137.48 Y119.983 E.01663
G1 X122.52 Y134.943 E.65484
G1 X122.52 Y134.405 E.01663
G1 X137.48 Y119.446 E.65484
G1 X137.48 Y118.935 E.0158
G1 X137.453 Y118.935 E.00083
G1 X122.52 Y133.868 E.65367
G1 X122.52 Y133.331 E.01663
G1 X136.916 Y118.935 E.63015
G1 X136.379 Y118.935 E.01663
G1 X122.52 Y132.794 E.60664
G1 X122.52 Y132.257 E.01663
G1 X135.841 Y118.935 E.58312
G1 X135.304 Y118.935 E.01663
G1 X122.52 Y131.719 E.55961
G1 X122.52 Y131.182 E.01663
G1 X134.767 Y118.935 E.53609
G1 X134.23 Y118.935 E.01663
G1 X122.52 Y130.645 E.51258
G1 X122.52 Y130.108 E.01663
G1 X133.693 Y118.935 E.48907
G1 X133.156 Y118.935 E.01663
G1 X122.52 Y129.571 E.46555
G1 X122.52 Y129.033 E.01663
G1 X132.618 Y118.935 E.44204
G1 X132.081 Y118.935 E.01663
G1 X122.52 Y128.496 E.41852
G1 X122.52 Y127.959 E.01663
G1 X131.544 Y118.935 E.39501
G1 X131.007 Y118.935 E.01663
G1 X122.52 Y127.422 E.37149
G1 X122.52 Y126.885 E.01663
G1 X130.47 Y118.935 E.34798
G1 X129.932 Y118.935 E.01663
G1 X122.52 Y126.347 E.32446
G1 X122.52 Y125.81 E.01663
G1 X129.395 Y118.935 E.30095
G1 X128.858 Y118.935 E.01663
G1 X122.52 Y125.273 E.27743
G1 X122.52 Y124.736 E.01663
G1 X128.321 Y118.935 E.25392
G1 X127.784 Y118.935 E.01663
G1 X122.52 Y124.199 E.2304
G1 X122.52 Y123.662 E.01663
G1 X127.246 Y118.935 E.20689
G1 X126.709 Y118.935 E.01663
G1 X122.52 Y123.124 E.18337
G1 X122.52 Y122.587 E.01663
G1 X126.172 Y118.935 E.15986
G1 X125.635 Y118.935 E.01663
G1 X122.52 Y122.05 E.13634
G1 X122.52 Y121.513 E.01663
G1 X125.098 Y118.935 E.11283
G1 X124.561 Y118.935 E.01663
G1 X122.52 Y120.976 E.08931
G1 X122.52 Y120.438 E.01663
G1 X124.023 Y118.935 E.0658
G1 X123.486 Y118.935 E.01663
G1 X122.52 Y119.901 E.04228
G1 X122.52 Y119.364 E.01663
G1 X123.119 Y118.766 E.02619
; CHANGE_LAYER
; Z_HEIGHT: 3
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X122.52 Y119.364 E-.32157
G1 X122.52 Y119.901 E-.20413
G1 X122.956 Y119.465 E-.2343
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 15/55
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
G3 Z3.2 I-.489 J1.115 P1  F30000
G1 X134.177 Y124.384 Z3.2
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8385
G3 X134.105 Y124.087 I-.093 J-.134 E.02103
G1 X134.141 Y124.096 E.00124
G3 X134.22 Y124.34 I-.057 J.153 E.00979
; WIPE_START
G1 F24000
G1 X134.065 Y124.413 E-.12925
G1 X133.992 Y124.385 E-.05937
G1 X133.939 Y124.325 E-.0605
G1 X133.925 Y124.211 E-.08679
G1 X133.993 Y124.114 E-.08905
G1 X134.105 Y124.087 E-.08678
G1 X134.141 Y124.096 E-.02828
G1 X134.23 Y124.174 E-.08942
G1 X134.244 Y124.289 E-.08796
G1 X134.22 Y124.34 E-.0426
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.208 J.147 P1  F30000
G1 X135.317 Y133.339 Z3.4
G1 Z3
G1 E.8 F1800
G1 F8385
G3 X135.135 Y132.589 I-.233 J-.341 E.05292
G1 X135.229 Y132.612 E.00322
G3 X135.364 Y133.301 I-.145 J.386 E.02788
; WIPE_START
G1 F24000
M73 P69 R3
G1 X135.135 Y133.411 E-.09653
G1 X135.035 Y133.411 E-.03795
G1 X134.938 Y133.387 E-.03795
G1 X134.85 Y133.341 E-.03795
G1 X134.775 Y133.275 E-.03795
G1 X134.718 Y133.193 E-.03795
G1 X134.671 Y133.003 E-.07426
G1 X134.683 Y132.899 E-.03962
G1 X134.773 Y132.728 E-.07365
G1 X134.851 Y132.658 E-.03962
G1 X135.035 Y132.589 E-.07474
G1 X135.135 Y132.589 E-.03795
G1 X135.229 Y132.612 E-.03685
G1 X135.321 Y132.66 E-.03962
G1 X135.422 Y132.773 E-.0574
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.194 J-1.201 P1  F30000
G1 X126.467 Y134.217 Z3.4
G1 Z3
G1 E.8 F1800
G1 F8385
G3 X125.695 Y133.092 I-.884 J-.221 E.13869
G1 X125.905 Y133.144 E.00716
G3 X126.48 Y134.159 I-.321 J.852 E.04199
; WIPE_START
G1 F24000
G1 X126.394 Y134.425 E-.1062
G1 X126.269 Y134.606 E-.08376
G1 X126.104 Y134.752 E-.08375
G1 X125.909 Y134.855 E-.08376
G1 X125.695 Y134.908 E-.08376
G1 X125.475 Y134.908 E-.08375
G1 X125.261 Y134.855 E-.08376
G1 X125.066 Y134.752 E-.08376
G1 X124.933 Y134.635 E-.06751
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.281 J1.184 P1  F30000
G1 X138.205 Y137.79 Z3.4
G1 Z3
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8385
G1 X121.795 Y137.79 E.50424
G1 X121.795 Y118.21 E.60164
G1 X138.205 Y118.21 E.50424
G1 X138.205 Y137.73 E.5998
M204 S10000
; WIPE_START
G1 F24000
G1 X136.205 Y137.737 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.462 J-1.126 P1  F30000
G1 X125.46 Y133.325 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
G1 F8385
G1 X126.26 Y134.126 E.03478
G1 X126.079 Y134.478
G1 X125.109 Y133.508 E.04216
G1 X124.913 Y133.846
G1 X125.736 Y134.668 E.03576
M204 S10000
G1 X125.089 Y134.501 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0996765
G1 F8385
G1 X124.906 Y134.127 E.00193
G1 X125.447 Y134.688 F30000
; LINE_WIDTH: 0.139492
G1 F8385
G1 X125.223 Y134.524 E.00218
; LINE_WIDTH: 0.193363
G3 X124.895 Y134.159 I1.358 J-1.551 E.00603
G1 X126.268 Y133.814 F30000
; LINE_WIDTH: 0.154274
G1 F8385
G2 X125.955 Y133.468 I-1.583 J1.115 E.00425
; LINE_WIDTH: 0.16412
G1 X125.859 Y133.398 E.00117
; LINE_WIDTH: 0.138732
G1 X125.763 Y133.328 E.00093
; WIPE_START
G1 F24000
G1 X125.859 Y133.398 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.925 J.791 P1  F30000
G1 X137.998 Y119.2 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F8385
G1 X137.215 Y118.417 E.034
G1 X136.682 Y118.417
G1 X137.998 Y119.733 E.05717
G1 X137.998 Y120.266
G1 X136.149 Y118.417 E.08034
G1 X135.616 Y118.417
G1 X137.998 Y120.8 E.10352
G1 X137.998 Y121.333
G1 X135.082 Y118.417 E.12669
G1 X134.549 Y118.417
G1 X137.998 Y121.866 E.14986
G1 X137.998 Y122.399
G1 X134.016 Y118.417 E.17304
G1 X133.482 Y118.417
G1 X137.998 Y122.933 E.19621
G1 X137.998 Y123.466
G1 X132.949 Y118.417 E.21938
G1 X132.416 Y118.417
G1 X137.998 Y123.999 E.24256
G1 X137.998 Y124.532
G1 X131.883 Y118.417 E.26573
G1 X131.349 Y118.417
G1 X137.998 Y125.066 E.2889
G1 X137.998 Y125.599
G1 X130.816 Y118.417 E.31208
G1 X130.283 Y118.417
G1 X137.998 Y126.132 E.33525
G1 X137.998 Y126.666
G1 X129.75 Y118.417 E.35842
G1 X129.216 Y118.417
G1 X137.998 Y127.199 E.3816
M204 S10000
; WIPE_START
G1 F24000
G1 X136.583 Y125.785 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.729 J-.975 P1  F30000
G1 X134.467 Y124.202 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
G1 F8385
G1 X137.998 Y127.732 E.15341
G1 X137.998 Y128.265
G1 X134.303 Y124.571 E.16055
G1 X134.13 Y123.864
G1 X128.683 Y118.417 E.2367
G1 X128.15 Y118.417
G1 X133.766 Y124.034 E.24405
M204 S10000
; WIPE_START
G1 F24000
G1 X132.352 Y122.619 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.898 J.821 P1  F30000
G1 X137.998 Y128.799 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
G1 F8385
G1 X127.616 Y118.417 E.45111
G1 X127.083 Y118.417
G1 X137.998 Y129.332 E.47429
G1 X137.998 Y129.865
G1 X126.55 Y118.417 E.49746
G1 X126.017 Y118.417
G1 X137.998 Y130.398 E.52063
G1 X137.998 Y130.932
G1 X125.483 Y118.417 E.54381
G1 X124.95 Y118.417
G1 X137.998 Y131.465 E.56698
G1 X137.998 Y131.998
G1 X124.417 Y118.417 E.59015
G1 X123.884 Y118.417
G1 X137.998 Y132.532 E.61333
G1 X137.998 Y133.065
G1 X123.35 Y118.417 E.6365
G1 X122.817 Y118.417
G1 X137.998 Y133.598 E.65967
G1 X137.998 Y134.131
G1 X122.284 Y118.417 E.68285
G1 X122.002 Y118.669
G1 X137.998 Y134.665 E.69508
G1 X137.998 Y135.198
G1 X135.713 Y132.913 E.0993
G1 X135.615 Y133.348
G1 X137.998 Y135.731 E.10356
G1 X137.998 Y136.264
G1 X135.324 Y133.59 E.1162
G1 X134.729 Y133.529
G1 X137.998 Y136.798 E.14205
M204 S10000
; WIPE_START
G1 F24000
G1 X136.583 Y135.383 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I1.102 J-.517 P1  F30000
G1 X135.168 Y132.368 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
G1 F8385
G1 X122.002 Y119.202 E.57209
G1 X122.002 Y119.736
G1 X134.735 Y132.468 E.55328
G1 X134.497 Y132.764
G1 X125.722 Y123.989 E.38132
G1 X125.596 Y123.863
G1 X122.002 Y120.269 E.15616
G1 X122.002 Y120.802
G1 X134.571 Y133.371 E.54617
M204 S10000
; WIPE_START
G1 F24000
G1 X133.157 Y131.957 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.904 J.814 P1  F30000
G1 X137.998 Y137.331 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
G1 F8385
G1 X122.002 Y121.336 E.69508
G1 X122.002 Y121.869
G1 X137.716 Y137.583 E.68284
G1 X137.183 Y137.583
G1 X122.002 Y122.402 E.65967
G1 X122.002 Y122.935
G1 X136.65 Y137.583 E.63649
M73 P70 R3
G1 X136.116 Y137.583
G1 X122.002 Y123.469 E.61332
G1 X122.002 Y124.002
G1 X135.583 Y137.583 E.59015
G1 X135.05 Y137.583
G1 X122.002 Y124.535 E.56697
G1 X122.002 Y125.068
G1 X134.516 Y137.583 E.5438
G1 X133.983 Y137.583
G1 X122.002 Y125.602 E.52063
G1 X122.002 Y126.135
G1 X133.45 Y137.583 E.49745
G1 X132.917 Y137.583
G1 X122.002 Y126.668 E.47428
G1 X122.002 Y127.202
G1 X132.383 Y137.583 E.45111
G1 X131.85 Y137.583
G1 X122.002 Y127.735 E.42794
G1 X122.002 Y128.268
G1 X131.317 Y137.583 E.40476
G1 X130.784 Y137.583
G1 X122.002 Y128.801 E.38159
G1 X122.002 Y129.335
G1 X125.538 Y132.87 E.15363
G1 X125.108 Y132.974
G1 X122.002 Y129.868 E.13497
G1 X122.002 Y130.401
G1 X124.794 Y133.192 E.1213
G1 X124.566 Y133.499
G1 X122.002 Y130.934 E.11143
G1 X122.002 Y131.468
G1 X124.456 Y133.921 E.10663
G1 X124.684 Y134.683
G1 X122.002 Y132.001 E.11654
M204 S10000
; WIPE_START
G1 F24000
G1 X123.417 Y133.415 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.23 J1.195 P1  F30000
G1 X126.717 Y134.05 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
G1 F8385
G1 X130.25 Y137.583 E.15353
G1 X129.717 Y137.583
G1 X126.612 Y134.478 E.13492
G1 X126.394 Y134.793
G1 X129.184 Y137.583 E.12123
G1 X128.65 Y137.583
G1 X126.083 Y135.015 E.11158
G1 X125.665 Y135.13
G1 X128.117 Y137.583 E.10658
G1 X127.584 Y137.583
G1 X124.938 Y134.936 E.115
M204 S10000
; WIPE_START
G1 F24000
G1 X126.352 Y136.35 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.059 J.6 P1  F30000
G1 X127.051 Y137.583 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
G1 F8385
G1 X122.002 Y132.534 E.21938
G1 X122.002 Y133.067
G1 X126.517 Y137.583 E.1962
G1 X125.984 Y137.583
G1 X122.002 Y133.601 E.17303
G1 X122.002 Y134.134
G1 X125.451 Y137.583 E.14986
G1 X124.918 Y137.583
G1 X122.002 Y134.667 E.12668
G1 X122.002 Y135.201
G1 X124.384 Y137.583 E.10351
G1 X123.851 Y137.583
G1 X122.002 Y135.734 E.08034
G1 X122.002 Y136.267
G1 X123.318 Y137.583 E.05716
G1 X122.785 Y137.583
G1 X122.002 Y136.8 E.03399
M204 S10000
; WIPE_START
G1 F24000
G1 X122.785 Y137.583 E-.42037
G1 X123.318 Y137.583 E-.20264
G1 X123.063 Y137.328 E-.13699
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.783 J.932 P1  F30000
G1 X125.587 Y135.207 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.100657
G1 F8385
G3 X125.41 Y135.118 I.63 J-1.482 E.00094
G1 X124.878 Y134.996 F30000
; LINE_WIDTH: 0.240642
G1 F8385
M73 P71 R3
G1 X124.686 Y134.816 E.00423
G1 X124.69 Y134.677 E.00225
G1 X125.806 Y132.888 F30000
; LINE_WIDTH: 0.121644
G1 F8385
G1 X125.613 Y132.794 E.00137
G1 X126.79 Y133.855 F30000
; LINE_WIDTH: 0.0967973
G1 F8385
G3 X126.716 Y134.029 I-1.437 J-.506 E.00083
; WIPE_START
G1 F24000
G1 X126.79 Y133.855 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.165 J1.206 P1  F30000
G1 X134.483 Y132.803 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.0949823
G1 F8385
G2 X134.404 Y132.937 I1.044 J.702 E.00066
G1 X135.789 Y132.837 F30000
; LINE_WIDTH: 0.139044
G1 F8385
G2 X135.458 Y132.453 I-1.386 J.861 E.00399
; LINE_WIDTH: 0.129704
G1 X135.332 Y132.361 E.0011
; LINE_WIDTH: 0.183011
G1 X135.232 Y132.303 E.00132
; WIPE_START
G1 F24000
G1 X135.332 Y132.361 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I1.205 J-.17 P1  F30000
G1 X134.234 Y124.587 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.0872803
G1 F8385
G1 X134.227 Y124.615 E.00011
G1 X134.137 Y124.671 E.00038
G1 X134.534 Y124.135 F30000
; LINE_WIDTH: 0.188592
G1 F8385
G2 X134.324 Y123.865 I-1.234 J.743 E.00407
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 3.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X134.534 Y124.135 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 16/55
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
G3 Z3.4 I-.866 J-.855 P1  F30000
G1 X126.074 Y132.696 Z3.4
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X125.753 Y132.617 I-.49 J1.299 E.27835
G1 X126.016 Y132.681 E.00898
G1 X126.222 Y132.331 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X126.601 Y132.528 E.01313
G1 X126.924 Y132.814 E.01324
G1 X127.169 Y133.169 E.01325
G1 X127.321 Y133.572 E.01325
G1 X127.373 Y134 E.01325
G1 X127.321 Y134.428 E.01325
G1 X127.169 Y134.831 E.01325
G1 X126.924 Y135.186 E.01325
G1 X126.601 Y135.472 E.01325
G1 X126.219 Y135.672 E.01325
G1 X125.8 Y135.775 E.01325
G1 X125.369 Y135.775 E.01325
G1 X124.951 Y135.672 E.01325
G1 X124.569 Y135.472 E.01325
G1 X124.251 Y135.19 E.01307
G1 X124.001 Y134.831 E.01343
G1 X123.848 Y134.428 E.01324
G1 X123.796 Y134 E.01325
G1 X123.848 Y133.572 E.01325
G1 X124.001 Y133.169 E.01325
G1 X124.243 Y132.819 E.01307
G1 X124.569 Y132.528 E.01343
G1 X124.951 Y132.328 E.01324
G1 X125.369 Y132.225 E.01325
G1 X125.8 Y132.225 E.01325
G1 X126.165 Y132.314 E.01153
M204 S10000
G1 X126.153 Y133.179 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X125.821 Y133.037 E.01111
G1 X125.465 Y133.009 E.01098
G1 X125.126 Y133.122 E.01098
G1 X124.835 Y133.342 E.0112
G1 X124.658 Y133.649 E.0109
G1 X124.586 Y134 E.01101
G1 X124.658 Y134.35 E.01098
G1 X124.841 Y134.665 E.0112
G1 X125.125 Y134.878 E.0109
G1 X125.465 Y134.991 E.01101
G1 X125.822 Y134.962 E.01103
G1 X126.152 Y134.822 E.01102
G1 X126.401 Y134.563 E.01103
G1 X126.554 Y134.239 E.01102
G2 X126.554 Y133.761 I-1.468 J-.239 E.01475
G1 X126.4 Y133.436 E.01107
G1 X126.195 Y133.222 E.00909
G1 X126.048 Y133.59 F30000
G1 F1200
G1 X125.8 Y133.421 E.00921
G1 X125.51 Y133.386 E.00898
G1 X125.235 Y133.49 E.00904
G1 X125.037 Y133.712 E.00916
G1 X124.966 Y134 E.0091
G1 X125.036 Y134.286 E.00904
G1 X125.233 Y134.509 E.00916
G1 X125.51 Y134.614 E.0091
G1 X125.804 Y134.578 E.0091
G1 X126.048 Y134.41 E.0091
G1 X126.186 Y134.148 E.0091
G2 X126.186 Y133.852 I-.909 J-.148 E.00914
G1 X126.076 Y133.643 E.00726
G1 X125.746 Y133.858 F30000
; LINE_WIDTH: 0.46798
G1 F1200
G1 X125.584 Y133.787 E.0061
G1 X125.44 Y133.844 E.00538
G1 X125.37 Y134 E.00591
G1 X125.445 Y134.161 E.00613
G1 X125.611 Y134.213 E.00603
G1 X125.76 Y134.121 E.00608
G2 X125.763 Y133.915 I-.132 J-.105 E.00767
; WIPE_START
G1 F24000
G1 X125.796 Y134.026 E-.07039
G1 X125.76 Y134.121 E-.06226
G1 X125.611 Y134.213 E-.10713
G1 X125.445 Y134.161 E-.10622
G1 X125.37 Y134 E-.10793
G1 X125.44 Y133.844 E-.10405
G1 X125.584 Y133.787 E-.09465
G1 X125.746 Y133.858 E-.10737
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I1.217 J.008 P1  F30000
G1 X125.806 Y124.322 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X125.632 Y123.609 I-.222 J-.323 E.05027
G1 X125.722 Y123.632 E.00308
G3 X125.853 Y124.284 I-.138 J.367 E.02636
G1 X126.029 Y124.644 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X125.68 Y123.217 I-.445 J-.647 E.09331
G1 X125.862 Y123.262 E.00576
G3 X126.077 Y124.608 I-.278 J.735 E.05073
M204 S10000
; WIPE_START
G1 F24000
G1 X125.864 Y124.737 E-.09456
G1 X125.68 Y124.783 E-.07223
G1 X125.49 Y124.783 E-.07223
G1 X125.305 Y124.737 E-.07223
G1 X125.137 Y124.649 E-.07223
G1 X124.997 Y124.525 E-.0712
G1 X124.887 Y124.366 E-.07334
G1 X124.819 Y124.189 E-.07211
G1 X124.796 Y124 E-.07223
G1 X124.819 Y123.811 E-.07223
G1 X124.834 Y123.773 E-.01542
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I-.144 J1.208 P1  F30000
G1 X133.858 Y124.847 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X134.162 Y123.611 I.226 J-.6 E.06176
G1 X134.31 Y123.648 E.00505
G3 X133.915 Y124.866 I-.226 J.6 E.0648
G1 X133.719 Y125.214 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X134.21 Y123.219 I.365 J-.968 E.09229
G1 X134.45 Y123.278 E.00759
G3 X133.776 Y125.234 I-.366 J.968 E.098
M204 S10000
G1 X133.898 Y124.351 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.468338
G1 F1200
G1 X134.007 Y124.455 E.00522
G1 X134.161 Y124.449 E.00533
G1 X134.279 Y124.352 E.00531
G2 X134.279 Y124.148 I-.304 J-.102 E.0072
G1 X134.16 Y124.051 E.00534
G1 X134.008 Y124.045 E.00528
G1 X133.872 Y124.197 E.00708
G1 X133.888 Y124.292 E.00333
; WIPE_START
G1 F24000
G1 X133.872 Y124.197 E-.05753
G1 X134.008 Y124.045 E-.12217
G1 X134.16 Y124.051 E-.09111
G1 X134.279 Y124.148 E-.09214
G1 X134.292 Y124.301 E-.09183
G1 X134.279 Y124.352 E-.03147
G1 X134.161 Y124.449 E-.09168
G1 X134.007 Y124.455 E-.09196
G1 X133.898 Y124.351 E-.09011
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I-1.212 J.104 P1  F30000
G1 X134.578 Y132.264 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X135.193 Y132.113 I.506 J.732 E.02146
G1 X135.398 Y132.164 E.00702
G3 X134.53 Y132.3 I-.314 J.833 E.15504
G1 X134.353 Y131.94 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X135.24 Y131.721 I.731 J1.055 E.0287
G1 X135.538 Y131.794 E.00941
G3 X134.305 Y131.975 I-.454 J1.201 E.20786
M204 S10000
G1 X134.713 Y132.675 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X134.605 Y132.881 E.00715
G1 X134.605 Y133.118 E.00731
G1 X134.715 Y133.328 E.00727
G1 X134.91 Y133.462 E.00727
G1 X135.145 Y133.491 E.00727
G1 X135.365 Y133.407 E.00724
G1 X135.523 Y133.23 E.0073
G1 X135.579 Y133 E.00727
G1 X135.523 Y132.77 E.00727
G1 X135.366 Y132.594 E.00724
G1 X135.144 Y132.509 E.0073
G1 X134.91 Y132.538 E.00725
G1 X134.763 Y132.64 E.00552
G1 X135.121 Y132.937 F30000
; LINE_WIDTH: 0.624956
G1 F1200
G2 X135.128 Y133.052 I-.033 J.059 E.01372
; CHANGE_LAYER
; Z_HEIGHT: 3.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X135.048 Y133.063 E-.20366
G1 X135.012 Y133 E-.18545
G1 X135.048 Y132.937 E-.18545
G1 X135.121 Y132.937 E-.18545
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 17/55
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
G3 Z3.6 I.032 J-1.217 P1  F30000
G1 X126.079 Y132.697 Z3.6
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X125.753 Y132.617 I-.493 J1.298 E.27821
G1 X126.021 Y132.683 E.00915
G1 X126.215 Y132.327 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X126.219 Y132.328 E.00013
G1 X126.601 Y132.528 E.01325
G1 X126.924 Y132.814 E.01325
G1 X127.169 Y133.169 E.01325
G1 X127.321 Y133.572 E.01325
G1 X127.373 Y134 E.01325
G1 X127.321 Y134.428 E.01325
G1 X127.169 Y134.831 E.01325
G1 X126.924 Y135.186 E.01325
G1 X126.601 Y135.472 E.01325
G1 X126.219 Y135.672 E.01325
G1 X125.8 Y135.775 E.01325
G1 X125.369 Y135.775 E.01325
G1 X124.951 Y135.672 E.01325
G1 X124.569 Y135.472 E.01325
G1 X124.246 Y135.186 E.01325
G1 X124.001 Y134.831 E.01325
G1 X123.848 Y134.428 E.01325
G1 X123.796 Y134 E.01325
G1 X123.848 Y133.572 E.01325
G1 X124.001 Y133.169 E.01325
G1 X124.246 Y132.814 E.01325
G1 X124.569 Y132.528 E.01325
G1 X124.951 Y132.328 E.01325
G1 X125.369 Y132.225 E.01325
G1 X125.8 Y132.225 E.01325
G1 X126.157 Y132.312 E.01128
M204 S10000
G1 X126.152 Y133.178 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X125.822 Y133.038 E.01102
G1 X125.465 Y133.009 E.01102
G1 X125.124 Y133.122 E.01102
G1 X124.837 Y133.338 E.01102
G1 X124.658 Y133.648 E.01102
M73 P72 R3
G1 X124.586 Y134 E.01102
G1 X124.658 Y134.352 E.01102
G1 X124.837 Y134.662 E.01102
G1 X125.124 Y134.878 E.01102
G1 X125.465 Y134.991 E.01102
G1 X125.822 Y134.962 E.01102
G1 X126.152 Y134.822 E.01102
G1 X126.401 Y134.563 E.01102
G1 X126.554 Y134.239 E.01102
G2 X126.554 Y133.761 I-1.469 J-.239 E.01475
G1 X126.401 Y133.437 E.01102
G1 X126.194 Y133.221 E.00918
G1 X126.048 Y133.59 F30000
G1 F1200
G1 X125.804 Y133.422 E.0091
G1 X125.51 Y133.386 E.0091
G1 X125.233 Y133.491 E.0091
G1 X125.037 Y133.712 E.0091
G1 X124.966 Y134 E.0091
G1 X125.037 Y134.288 E.0091
G1 X125.233 Y134.509 E.0091
G1 X125.51 Y134.614 E.0091
G1 X125.804 Y134.578 E.0091
G1 X126.048 Y134.41 E.0091
G1 X126.186 Y134.148 E.0091
G2 X126.186 Y133.852 I-.91 J-.148 E.00914
G1 X126.076 Y133.643 E.00726
G1 X125.745 Y133.858 F30000
; LINE_WIDTH: 0.468555
G1 F1200
G1 X125.585 Y133.787 E.00608
G1 X125.424 Y133.858 E.00608
G1 X125.374 Y134.026 E.00608
G1 X125.463 Y134.176 E.00608
G1 X125.636 Y134.207 E.00608
G1 X125.775 Y134.1 E.00608
G2 X125.763 Y133.915 I-.148 J-.083 E.00678
; WIPE_START
G1 F24000
G1 X125.796 Y134.026 E-.07043
G1 X125.775 Y134.1 E-.04705
G1 X125.636 Y134.207 E-.10708
G1 X125.463 Y134.176 E-.10708
G1 X125.374 Y134.026 E-.10709
G1 X125.424 Y133.858 E-.10708
G1 X125.585 Y133.787 E-.10708
G1 X125.745 Y133.858 E-.10709
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I1.217 J.008 P1  F30000
G1 X125.806 Y124.32 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X125.632 Y123.609 I-.224 J-.322 E.0504
G1 X125.718 Y123.631 E.00293
G3 X125.852 Y124.282 I-.136 J.367 E.02634
G1 X126.028 Y124.642 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X125.68 Y123.217 I-.447 J-.646 E.09344
G1 X125.857 Y123.261 E.00559
G3 X126.076 Y124.606 I-.275 J.736 E.05073
M204 S10000
; WIPE_START
G1 F24000
G1 X125.872 Y124.733 E-.09154
G1 X125.679 Y124.783 E-.07557
G1 X125.49 Y124.783 E-.07188
G1 X125.305 Y124.737 E-.07223
G1 X125.137 Y124.649 E-.07223
G1 X125.001 Y124.528 E-.06914
G1 X124.886 Y124.366 E-.07557
G1 X124.819 Y124.189 E-.07188
G1 X124.797 Y124.008 E-.06914
G1 X124.82 Y123.81 E-.07557
G1 X124.834 Y123.773 E-.01525
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I-.144 J1.208 P1  F30000
G1 X133.858 Y124.849 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X134.313 Y123.648 I.23 J-.599 E.06672
G3 X134.45 Y124.78 I-.237 J.603 E.04621
G3 X133.915 Y124.868 I-.362 J-.53 E.01859
G1 X133.718 Y125.216 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X134.453 Y123.279 I.372 J-.967 E.09973
G3 X134.675 Y125.105 I-.382 J.973 E.06907
G3 X133.775 Y125.236 I-.585 J-.855 E.02893
M204 S10000
G1 X133.964 Y124.425 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.468641
G1 F1200
G1 X134.111 Y124.468 E.00532
G1 X134.244 Y124.391 E.00532
G1 X134.292 Y124.301 E.00353
G1 X134.279 Y124.148 E.00532
G1 X134.16 Y124.051 E.00532
G1 X134.007 Y124.045 E.00532
G1 X133.896 Y124.151 E.00532
G1 X133.872 Y124.302 E.00532
G1 X133.928 Y124.377 E.00324
; WIPE_START
G1 F24000
G1 X133.872 Y124.302 E-.05592
G1 X133.896 Y124.151 E-.09186
G1 X134.007 Y124.045 E-.09187
G1 X134.16 Y124.051 E-.09186
G1 X134.279 Y124.148 E-.09187
G1 X134.292 Y124.301 E-.09186
G1 X134.244 Y124.391 E-.06104
G1 X134.111 Y124.468 E-.09186
G1 X133.964 Y124.425 E-.09187
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I-1.213 J.095 P1  F30000
G1 X134.578 Y132.266 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X135.193 Y132.113 I.508 J.731 E.02148
G1 X135.402 Y132.165 E.00715
G3 X134.53 Y132.301 I-.316 J.832 E.15492
G1 X134.354 Y131.941 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X135.24 Y131.721 I.732 J1.055 E.02869
G1 X135.542 Y131.795 E.00954
G3 X134.305 Y131.976 I-.456 J1.2 E.20776
M204 S10000
G1 X134.715 Y132.672 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X134.605 Y132.882 E.00727
G1 X134.605 Y133.118 E.00727
G1 X134.715 Y133.328 E.00727
G1 X134.91 Y133.462 E.00727
G1 X135.144 Y133.491 E.00727
G1 X135.366 Y133.407 E.00727
G1 X135.523 Y133.23 E.00727
G1 X135.579 Y133 E.00727
G1 X135.523 Y132.77 E.00727
G1 X135.366 Y132.593 E.00727
G1 X135.144 Y132.509 E.00727
G1 X134.91 Y132.538 E.00727
G1 X134.764 Y132.638 E.00543
; CHANGE_LAYER
; Z_HEIGHT: 3.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X134.91 Y132.538 E-.0671
G1 X135.144 Y132.509 E-.0899
G1 X135.366 Y132.593 E-.0899
G1 X135.523 Y132.77 E-.0899
G1 X135.579 Y133 E-.0899
G1 X135.523 Y133.23 E-.08991
G1 X135.366 Y133.407 E-.0899
G1 X135.144 Y133.491 E-.0899
G1 X134.978 Y133.471 E-.0636
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 18/55
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
G3 Z3.8 I.105 J-1.212 P1  F30000
G1 X126.079 Y132.697 Z3.8
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X126.377 Y135.147 I-.513 J1.305 E.10006
G3 X126.023 Y132.677 I-.785 J-1.148 E.18707
G1 X126.206 Y132.325 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X126.215 Y132.327 E.00026
G1 X126.601 Y132.528 E.01339
G1 X126.924 Y132.814 E.01325
G1 X127.169 Y133.169 E.01325
G1 X127.321 Y133.572 E.01325
G1 X127.373 Y134 E.01325
G1 X127.321 Y134.428 E.01325
G1 X127.169 Y134.831 E.01325
G1 X126.924 Y135.186 E.01325
G1 X126.601 Y135.472 E.01325
G1 X126.219 Y135.672 E.01325
G1 X125.8 Y135.775 E.01325
G1 X125.369 Y135.775 E.01325
G1 X124.951 Y135.672 E.01325
G1 X124.569 Y135.472 E.01325
G1 X124.246 Y135.186 E.01325
G1 X124.001 Y134.831 E.01325
G1 X123.848 Y134.428 E.01325
G1 X123.796 Y134 E.01325
G1 X123.848 Y133.572 E.01325
G1 X124.001 Y133.169 E.01325
G1 X124.246 Y132.814 E.01325
G1 X124.569 Y132.528 E.01325
G1 X124.951 Y132.328 E.01325
G1 X125.369 Y132.225 E.01325
G1 X125.8 Y132.225 E.01325
G1 X126.148 Y132.31 E.011
M204 S10000
G1 X126.152 Y133.178 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X125.822 Y133.038 E.01102
G1 X125.465 Y133.009 E.01102
G1 X125.124 Y133.122 E.01102
G1 X124.837 Y133.338 E.01102
G1 X124.658 Y133.648 E.01102
G1 X124.586 Y134 E.01102
G1 X124.658 Y134.352 E.01102
G1 X124.837 Y134.662 E.01102
G1 X125.124 Y134.878 E.01102
G1 X125.465 Y134.991 E.01102
G1 X125.822 Y134.962 E.01102
G1 X126.152 Y134.822 E.01102
G1 X126.401 Y134.563 E.01102
G1 X126.554 Y134.239 E.01102
G2 X126.554 Y133.761 I-1.469 J-.239 E.01475
G1 X126.401 Y133.437 E.01102
G1 X126.194 Y133.221 E.00918
G1 X126.048 Y133.59 F30000
G1 F1200
G1 X125.804 Y133.422 E.0091
G1 X125.51 Y133.386 E.0091
G1 X125.233 Y133.491 E.0091
G1 X125.037 Y133.712 E.0091
G1 X124.966 Y134 E.0091
G1 X125.037 Y134.288 E.0091
G1 X125.233 Y134.509 E.0091
G1 X125.51 Y134.614 E.0091
G1 X125.804 Y134.578 E.0091
G1 X126.048 Y134.41 E.0091
G1 X126.186 Y134.148 E.0091
G2 X126.186 Y133.852 I-.91 J-.148 E.00914
G1 X126.076 Y133.643 E.00726
G1 X125.745 Y133.858 F30000
; LINE_WIDTH: 0.468557
G1 F1200
G1 X125.585 Y133.787 E.00608
G1 X125.424 Y133.858 E.00608
G1 X125.374 Y134.026 E.00608
G1 X125.463 Y134.176 E.00608
G1 X125.636 Y134.207 E.00608
G1 X125.775 Y134.1 E.00608
G2 X125.763 Y133.915 I-.148 J-.083 E.00678
; WIPE_START
G1 F24000
G1 X125.796 Y134.026 E-.07044
G1 X125.775 Y134.1 E-.04705
G1 X125.636 Y134.207 E-.10708
G1 X125.463 Y134.176 E-.10709
G1 X125.374 Y134.026 E-.10709
G1 X125.424 Y133.858 E-.10708
G1 X125.585 Y133.787 E-.10709
G1 X125.745 Y133.858 E-.10709
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I1.217 J.008 P1  F30000
G1 X125.808 Y124.324 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X125.724 Y123.632 I-.222 J-.324 E.05339
G3 X125.855 Y124.286 I-.145 J.369 E.02626
G1 X126.03 Y124.645 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X125.68 Y123.217 I-.444 J-.648 E.09326
G1 X125.864 Y123.263 E.00584
G3 X126.078 Y124.609 I-.279 J.734 E.05071
M204 S10000
; WIPE_START
G1 F24000
G1 X125.865 Y124.737 E-.0947
G1 X125.68 Y124.783 E-.07223
G1 X125.49 Y124.783 E-.07223
G1 X125.305 Y124.737 E-.07223
G1 X125.137 Y124.649 E-.07223
G1 X124.995 Y124.523 E-.07223
G1 X124.887 Y124.366 E-.07223
G1 X124.819 Y124.189 E-.07223
G1 X124.796 Y124 E-.07223
G1 X124.819 Y123.811 E-.07223
G1 X124.834 Y123.774 E-.01524
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I-.144 J1.208 P1  F30000
G1 X133.858 Y124.849 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X134.313 Y123.648 I.23 J-.599 E.06672
G3 X134.45 Y124.78 I-.237 J.603 E.04621
G3 X133.915 Y124.868 I-.362 J-.53 E.01859
G1 X133.718 Y125.216 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X134.453 Y123.279 I.372 J-.967 E.09973
G3 X134.675 Y125.105 I-.382 J.973 E.06907
G3 X133.775 Y125.236 I-.585 J-.855 E.02893
M204 S10000
G1 X133.964 Y124.425 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.468641
G1 F1200
G1 X134.111 Y124.468 E.00532
G1 X134.244 Y124.391 E.00532
G1 X134.292 Y124.301 E.00353
G1 X134.279 Y124.148 E.00532
G1 X134.16 Y124.051 E.00532
G1 X134.007 Y124.045 E.00532
G1 X133.896 Y124.151 E.00532
G1 X133.872 Y124.302 E.00532
G1 X133.928 Y124.377 E.00324
; WIPE_START
G1 F24000
G1 X133.872 Y124.302 E-.05592
G1 X133.896 Y124.151 E-.09186
G1 X134.007 Y124.045 E-.09186
G1 X134.16 Y124.051 E-.09186
G1 X134.279 Y124.148 E-.09187
G1 X134.292 Y124.301 E-.09186
G1 X134.244 Y124.391 E-.06104
G1 X134.111 Y124.468 E-.09186
G1 X133.964 Y124.425 E-.09187
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I-1.213 J.095 P1  F30000
G1 X134.58 Y132.268 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X135.402 Y132.165 I.51 J.731 E.02858
G3 X135.592 Y133.735 I-.329 J.837 E.06416
G3 X134.532 Y132.304 I-.503 J-.736 E.09065
G1 X134.356 Y131.945 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X135.542 Y131.795 I.735 J1.055 E.03818
G3 X135.817 Y134.06 I-.474 J1.207 E.0857
G3 X134.308 Y131.98 I-.726 J-1.061 E.1219
M204 S10000
G1 X134.715 Y132.672 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X134.605 Y132.882 E.00727
G1 X134.605 Y133.118 E.00727
G1 X134.715 Y133.328 E.00727
M73 P73 R3
G1 X134.91 Y133.462 E.00727
G1 X135.144 Y133.491 E.00727
G1 X135.366 Y133.407 E.00727
G1 X135.523 Y133.23 E.00727
G1 X135.579 Y133 E.00727
G1 X135.523 Y132.77 E.00727
G1 X135.366 Y132.593 E.00727
G1 X135.144 Y132.509 E.00727
G1 X134.91 Y132.538 E.00727
G1 X134.764 Y132.638 E.00543
G1 X135.121 Y132.937 F30000
; LINE_WIDTH: 0.625676
G1 F1200
G2 X135.128 Y133.052 I-.033 J.06 E.01376
; CHANGE_LAYER
; Z_HEIGHT: 3.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X135.048 Y133.063 E-.20374
G1 X135.012 Y133 E-.18542
G1 X135.048 Y132.937 E-.18542
G1 X135.121 Y132.937 E-.18542
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 19/55
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
G3 Z4 I.032 J-1.217 P1  F30000
G1 X126.079 Y132.697 Z4
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X126.377 Y135.147 I-.513 J1.305 E.10006
G3 X126.023 Y132.677 I-.785 J-1.148 E.18707
G1 X126.197 Y132.322 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X126.203 Y132.324 E.00018
G1 X126.601 Y132.528 E.01375
G1 X126.924 Y132.814 E.01325
G1 X127.169 Y133.169 E.01325
G1 X127.321 Y133.572 E.01325
G1 X127.373 Y134 E.01325
G1 X127.321 Y134.428 E.01325
G1 X127.169 Y134.831 E.01325
G1 X126.924 Y135.186 E.01325
G1 X126.601 Y135.472 E.01325
G1 X126.219 Y135.672 E.01325
G1 X125.8 Y135.775 E.01325
G1 X125.369 Y135.775 E.01325
G1 X124.951 Y135.672 E.01325
G1 X124.569 Y135.472 E.01325
G1 X124.259 Y135.197 E.01274
G1 X124.001 Y134.831 E.01375
G1 X123.848 Y134.428 E.01325
G1 X123.796 Y134 E.01325
G1 X123.848 Y133.572 E.01325
G1 X124.001 Y133.169 E.01325
G1 X124.246 Y132.814 E.01325
G1 X124.569 Y132.528 E.01325
G1 X124.951 Y132.328 E.01325
G1 X125.369 Y132.225 E.01325
G1 X125.8 Y132.225 E.01325
G1 X126.139 Y132.308 E.01071
M204 S10000
G1 X126.152 Y133.178 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X125.822 Y133.038 E.01102
G1 X125.465 Y133.009 E.01102
G1 X125.124 Y133.122 E.01102
G1 X124.837 Y133.338 E.01102
G1 X124.658 Y133.648 E.01102
G1 X124.586 Y134 E.01102
G1 X124.658 Y134.352 E.01102
G1 X124.837 Y134.662 E.01102
G1 X125.124 Y134.878 E.01102
G1 X125.465 Y134.991 E.01102
G1 X125.822 Y134.962 E.01102
G1 X126.152 Y134.822 E.01102
G1 X126.401 Y134.563 E.01102
G1 X126.554 Y134.239 E.01102
G2 X126.554 Y133.761 I-1.469 J-.239 E.01475
G1 X126.401 Y133.437 E.01102
G1 X126.194 Y133.221 E.00918
G1 X126.048 Y133.59 F30000
G1 F1200
G1 X125.804 Y133.422 E.0091
G1 X125.51 Y133.386 E.0091
G1 X125.233 Y133.491 E.0091
G1 X125.037 Y133.712 E.0091
G1 X124.966 Y134 E.0091
G1 X125.037 Y134.288 E.0091
G1 X125.233 Y134.509 E.0091
G1 X125.51 Y134.614 E.0091
G1 X125.804 Y134.578 E.0091
G1 X126.048 Y134.41 E.0091
G1 X126.186 Y134.148 E.0091
G2 X126.186 Y133.852 I-.91 J-.148 E.00914
G1 X126.076 Y133.643 E.00726
G1 X125.745 Y133.858 F30000
; LINE_WIDTH: 0.468559
G1 F1200
G1 X125.585 Y133.787 E.00608
G1 X125.424 Y133.858 E.00608
G1 X125.374 Y134.026 E.00608
G1 X125.463 Y134.176 E.00608
G1 X125.636 Y134.207 E.00608
G1 X125.775 Y134.1 E.00608
G2 X125.763 Y133.915 I-.148 J-.083 E.00678
; WIPE_START
G1 F24000
G1 X125.796 Y134.026 E-.07044
G1 X125.775 Y134.1 E-.04705
G1 X125.636 Y134.207 E-.10708
G1 X125.463 Y134.176 E-.10708
G1 X125.374 Y134.026 E-.10709
G1 X125.424 Y133.858 E-.10709
G1 X125.585 Y133.787 E-.10708
G1 X125.745 Y133.858 E-.10709
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I1.217 J.008 P1  F30000
G1 X125.808 Y124.324 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X125.724 Y123.632 I-.222 J-.324 E.05339
G3 X125.855 Y124.286 I-.145 J.369 E.02626
G1 X126.033 Y124.649 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X125.865 Y123.263 I-.444 J-.649 E.09909
G3 X126.08 Y124.612 I-.29 J.739 E.0506
M204 S10000
; WIPE_START
G1 F24000
G1 X125.864 Y124.737 E-.09478
G1 X125.68 Y124.783 E-.07223
G1 X125.49 Y124.783 E-.07223
G1 X125.305 Y124.737 E-.07223
G1 X125.137 Y124.649 E-.07223
G1 X124.995 Y124.523 E-.07223
G1 X124.887 Y124.366 E-.07223
G1 X124.819 Y124.189 E-.07223
G1 X124.796 Y124 E-.07223
G1 X124.819 Y123.811 E-.07223
G1 X124.834 Y123.774 E-.01516
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I-.144 J1.208 P1  F30000
G1 X133.858 Y124.847 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X134.162 Y123.611 I.227 J-.6 E.0617
G1 X134.312 Y123.648 E.00512
G3 X133.915 Y124.866 I-.227 J.6 E.0648
G1 X133.717 Y125.221 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X134.21 Y123.219 I.368 J-.971 E.09253
G1 X134.452 Y123.279 E.00767
G1 X134.453 Y123.279 E.00003
G3 X133.773 Y125.24 I-.368 J.971 E.0984
M204 S10000
G1 X133.964 Y124.425 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.468584
G1 F1200
G1 X134.111 Y124.468 E.00531
G1 X134.244 Y124.391 E.00532
G1 X134.292 Y124.301 E.00353
G1 X134.279 Y124.148 E.00532
G1 X134.16 Y124.051 E.00532
G1 X134.007 Y124.045 E.00532
G1 X133.896 Y124.151 E.00532
G1 X133.872 Y124.302 E.00531
G1 X133.928 Y124.377 E.00325
; WIPE_START
G1 F24000
G1 X133.872 Y124.302 E-.0561
G1 X133.896 Y124.151 E-.09172
G1 X134.007 Y124.045 E-.09193
G1 X134.16 Y124.051 E-.09183
G1 X134.279 Y124.148 E-.09187
G1 X134.292 Y124.301 E-.09186
G1 X134.244 Y124.391 E-.06104
G1 X134.111 Y124.468 E-.09187
G1 X133.964 Y124.425 E-.09177
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I-1.213 J.095 P1  F30000
G1 X134.578 Y132.266 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X135.193 Y132.113 I.508 J.731 E.02148
G1 X135.402 Y132.165 E.00714
G3 X134.53 Y132.301 I-.316 J.832 E.15492
G1 X134.353 Y131.94 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X135.24 Y131.721 I.732 J1.06 E.0287
G1 X135.536 Y131.794 E.00936
G1 X135.542 Y131.795 E.00019
G3 X134.305 Y131.975 I-.457 J1.204 E.20854
M204 S10000
G1 X134.715 Y132.672 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X134.605 Y132.882 E.00727
G1 X134.605 Y133.118 E.00727
G1 X134.715 Y133.328 E.00727
G1 X134.91 Y133.462 E.00727
G1 X135.144 Y133.491 E.00727
G1 X135.366 Y133.407 E.00727
G1 X135.523 Y133.23 E.00727
G1 X135.579 Y133 E.00727
G1 X135.523 Y132.77 E.00727
G1 X135.366 Y132.593 E.00727
G1 X135.144 Y132.509 E.00727
G1 X134.91 Y132.538 E.00727
G1 X134.764 Y132.638 E.00543
G1 X135.121 Y132.937 F30000
; LINE_WIDTH: 0.625676
G1 F1200
G2 X135.128 Y133.052 I-.033 J.06 E.01376
; CHANGE_LAYER
; Z_HEIGHT: 4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X135.048 Y133.063 E-.20374
G1 X135.012 Y133 E-.18542
G1 X135.048 Y132.937 E-.18542
G1 X135.121 Y132.937 E-.18542
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 20/55
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
G3 Z4.2 I.032 J-1.217 P1  F30000
G1 X126.079 Y132.697 Z4.2
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X125.753 Y132.617 I-.493 J1.298 E.27821
G1 X126.021 Y132.683 E.00915
G1 X126.188 Y132.32 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X126.191 Y132.321 E.00012
G1 X126.601 Y132.528 E.01411
G1 X126.924 Y132.814 E.01325
G1 X127.169 Y133.169 E.01325
G1 X127.321 Y133.572 E.01325
G1 X127.373 Y134 E.01325
G1 X127.321 Y134.428 E.01325
G1 X127.169 Y134.831 E.01325
G1 X126.924 Y135.186 E.01325
G1 X126.601 Y135.472 E.01325
G1 X126.219 Y135.672 E.01325
G1 X125.8 Y135.775 E.01325
G1 X125.369 Y135.775 E.01325
G1 X124.951 Y135.672 E.01325
G1 X124.569 Y135.472 E.01325
G1 X124.246 Y135.186 E.01325
G1 X124.001 Y134.831 E.01325
G1 X123.848 Y134.428 E.01325
G1 X123.796 Y134 E.01325
G1 X123.848 Y133.572 E.01325
G1 X124.001 Y133.169 E.01325
G1 X124.246 Y132.814 E.01325
G1 X124.569 Y132.528 E.01325
G1 X124.951 Y132.328 E.01325
G1 X125.369 Y132.225 E.01325
G1 X125.8 Y132.225 E.01325
G1 X126.129 Y132.306 E.0104
M204 S10000
G1 X126.152 Y133.178 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X125.822 Y133.038 E.01102
G1 X125.465 Y133.009 E.01102
G1 X125.124 Y133.122 E.01102
G1 X124.837 Y133.338 E.01102
G1 X124.658 Y133.648 E.01102
G1 X124.586 Y134 E.01102
G1 X124.658 Y134.352 E.01102
G1 X124.837 Y134.662 E.01102
G1 X125.124 Y134.878 E.01102
G1 X125.465 Y134.991 E.01102
G1 X125.822 Y134.962 E.01102
G1 X126.152 Y134.822 E.01102
G1 X126.401 Y134.563 E.01102
G1 X126.554 Y134.239 E.01102
G2 X126.554 Y133.761 I-1.469 J-.239 E.01475
G1 X126.401 Y133.437 E.01102
G1 X126.194 Y133.221 E.00918
G1 X126.048 Y133.59 F30000
G1 F1200
G1 X125.804 Y133.422 E.0091
G1 X125.51 Y133.386 E.0091
M73 P74 R3
G1 X125.233 Y133.491 E.0091
G1 X125.037 Y133.712 E.0091
G1 X124.966 Y134 E.0091
G1 X125.037 Y134.288 E.0091
G1 X125.233 Y134.509 E.0091
G1 X125.51 Y134.614 E.0091
G1 X125.804 Y134.578 E.0091
G1 X126.048 Y134.41 E.0091
G1 X126.186 Y134.148 E.0091
G2 X126.186 Y133.852 I-.91 J-.148 E.00914
G1 X126.076 Y133.643 E.00726
G1 X125.745 Y133.858 F30000
; LINE_WIDTH: 0.468558
G1 F1200
G1 X125.585 Y133.787 E.00608
G1 X125.424 Y133.858 E.00608
G1 X125.374 Y134.026 E.00608
G1 X125.463 Y134.176 E.00608
G1 X125.636 Y134.207 E.00608
G1 X125.775 Y134.1 E.00608
G2 X125.763 Y133.915 I-.148 J-.083 E.00678
; WIPE_START
G1 F24000
G1 X125.796 Y134.026 E-.07044
G1 X125.775 Y134.1 E-.04704
G1 X125.636 Y134.207 E-.10708
G1 X125.463 Y134.176 E-.10709
G1 X125.374 Y134.026 E-.10709
G1 X125.424 Y133.858 E-.10708
G1 X125.585 Y133.787 E-.10708
G1 X125.745 Y133.858 E-.10709
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I1.217 J.008 P1  F30000
G1 X125.807 Y124.321 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X125.632 Y123.609 I-.222 J-.323 E.05028
G1 X125.723 Y123.632 E.00311
G3 X125.854 Y124.284 I-.139 J.367 E.02633
G1 X126.032 Y124.648 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X125.68 Y123.217 I-.447 J-.649 E.09362
G1 X125.863 Y123.262 E.00579
G1 X125.864 Y123.263 E.00005
G3 X126.081 Y124.612 I-.28 J.737 E.05083
M204 S10000
; WIPE_START
G1 F24000
G1 X125.864 Y124.737 E-.09479
G1 X125.68 Y124.783 E-.07223
G1 X125.49 Y124.783 E-.07223
G1 X125.305 Y124.737 E-.07223
G1 X125.137 Y124.649 E-.07223
G1 X124.995 Y124.523 E-.07223
G1 X124.887 Y124.366 E-.07223
G1 X124.819 Y124.189 E-.07223
G1 X124.796 Y124 E-.07223
G1 X124.819 Y123.811 E-.07223
G1 X124.833 Y123.774 E-.01515
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I-.144 J1.208 P1  F30000
G1 X133.858 Y124.847 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X134.162 Y123.611 I.227 J-.6 E.06168
G1 X134.313 Y123.648 E.00515
G3 X133.915 Y124.866 I-.228 J.599 E.0648
G1 X133.719 Y125.214 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X134.21 Y123.219 I.366 J-.968 E.0922
G1 X134.445 Y123.277 E.00743
G1 X134.453 Y123.279 E.00026
G3 X133.776 Y125.234 I-.367 J.967 E.09801
M204 S10000
G1 X133.964 Y124.425 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.468638
G1 F1200
G1 X134.111 Y124.468 E.00532
G1 X134.244 Y124.391 E.00532
G1 X134.292 Y124.301 E.00353
G1 X134.279 Y124.148 E.00532
G1 X134.16 Y124.051 E.00532
G1 X134.007 Y124.045 E.00532
G1 X133.896 Y124.151 E.00532
G1 X133.872 Y124.302 E.00532
G1 X133.928 Y124.377 E.00324
; WIPE_START
G1 F24000
G1 X133.872 Y124.302 E-.05592
G1 X133.896 Y124.151 E-.09186
G1 X134.007 Y124.045 E-.09187
G1 X134.16 Y124.051 E-.09186
G1 X134.279 Y124.148 E-.09186
G1 X134.292 Y124.301 E-.09187
G1 X134.244 Y124.391 E-.06104
G1 X134.111 Y124.468 E-.09186
G1 X133.964 Y124.425 E-.09187
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I-1.213 J.095 P1  F30000
G1 X134.58 Y132.268 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X135.402 Y132.165 I.51 J.731 E.02858
G3 X135.592 Y133.735 I-.329 J.837 E.06416
G3 X134.532 Y132.304 I-.503 J-.736 E.09065
G1 X134.355 Y131.942 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X135.527 Y131.792 I.732 J1.059 E.03774
G1 X135.542 Y131.795 E.00047
G3 X135.817 Y134.06 I-.474 J1.207 E.0857
G3 X134.306 Y131.977 I-.731 J-1.06 E.12237
M204 S10000
G1 X134.715 Y132.672 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X134.605 Y132.882 E.00727
G1 X134.605 Y133.118 E.00727
G1 X134.715 Y133.328 E.00727
G1 X134.91 Y133.462 E.00727
G1 X135.144 Y133.491 E.00727
G1 X135.366 Y133.407 E.00727
G1 X135.523 Y133.23 E.00727
G1 X135.579 Y133 E.00727
G1 X135.523 Y132.77 E.00727
G1 X135.366 Y132.593 E.00727
G1 X135.144 Y132.509 E.00727
G1 X134.91 Y132.538 E.00727
G1 X134.764 Y132.638 E.00543
G1 X135.121 Y132.937 F30000
; LINE_WIDTH: 0.625676
G1 F1200
G2 X135.128 Y133.052 I-.033 J.06 E.01376
; CHANGE_LAYER
; Z_HEIGHT: 4.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X135.048 Y133.063 E-.20374
G1 X135.012 Y133 E-.18542
G1 X135.048 Y132.937 E-.18542
G1 X135.121 Y132.937 E-.18542
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 21/55
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
G3 Z4.4 I.032 J-1.217 P1  F30000
G1 X126.079 Y132.697 Z4.4
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X126.377 Y135.147 I-.513 J1.305 E.10006
G3 X126.023 Y132.677 I-.785 J-1.148 E.18707
G1 X126.178 Y132.318 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X126.179 Y132.318 E.00006
G1 X126.601 Y132.528 E.01447
G1 X126.924 Y132.814 E.01325
G1 X127.169 Y133.169 E.01325
G1 X127.321 Y133.572 E.01325
G1 X127.373 Y134 E.01325
G1 X127.321 Y134.428 E.01325
M73 P74 R2
G1 X127.169 Y134.831 E.01325
G1 X126.924 Y135.186 E.01325
G1 X126.601 Y135.472 E.01325
G1 X126.219 Y135.672 E.01325
G1 X125.8 Y135.775 E.01325
G1 X125.369 Y135.775 E.01325
G1 X124.951 Y135.672 E.01325
G1 X124.569 Y135.472 E.01325
G1 X124.246 Y135.186 E.01325
G1 X124.001 Y134.831 E.01325
G1 X123.848 Y134.428 E.01325
G1 X123.796 Y134 E.01325
G1 X123.848 Y133.572 E.01325
G1 X124.001 Y133.169 E.01325
G1 X124.223 Y132.848 E.01199
G1 X124.569 Y132.528 E.01447
G1 X124.951 Y132.328 E.01325
G1 X125.369 Y132.225 E.01325
G1 X125.8 Y132.225 E.01325
G1 X126.119 Y132.303 E.01009
M204 S10000
G1 X126.152 Y133.178 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X125.822 Y133.038 E.01102
G1 X125.465 Y133.009 E.01102
G1 X125.124 Y133.122 E.01102
G1 X124.837 Y133.338 E.01102
G1 X124.658 Y133.648 E.01102
G1 X124.586 Y134 E.01102
G1 X124.658 Y134.352 E.01102
G1 X124.837 Y134.662 E.01102
G1 X125.124 Y134.878 E.01102
G1 X125.465 Y134.991 E.01102
G1 X125.822 Y134.962 E.01102
G1 X126.152 Y134.822 E.01102
G1 X126.401 Y134.563 E.01102
G1 X126.554 Y134.239 E.01102
G2 X126.554 Y133.761 I-1.469 J-.239 E.01475
G1 X126.401 Y133.437 E.01102
G1 X126.194 Y133.221 E.00918
G1 X126.048 Y133.59 F30000
G1 F1200
G1 X125.804 Y133.422 E.0091
G1 X125.51 Y133.386 E.0091
G1 X125.233 Y133.491 E.0091
G1 X125.037 Y133.712 E.0091
G1 X124.966 Y134 E.0091
G1 X125.037 Y134.288 E.0091
G1 X125.233 Y134.509 E.0091
G1 X125.51 Y134.614 E.0091
G1 X125.804 Y134.578 E.0091
G1 X126.048 Y134.41 E.0091
G1 X126.186 Y134.148 E.0091
G2 X126.186 Y133.852 I-.91 J-.148 E.00914
G1 X126.076 Y133.643 E.00726
G1 X125.745 Y133.858 F30000
; LINE_WIDTH: 0.468559
G1 F1200
G1 X125.585 Y133.787 E.00608
G1 X125.424 Y133.858 E.00608
G1 X125.374 Y134.026 E.00608
G1 X125.463 Y134.176 E.00608
G1 X125.636 Y134.207 E.00608
G1 X125.775 Y134.1 E.00608
G2 X125.763 Y133.915 I-.148 J-.083 E.00678
; WIPE_START
G1 F24000
G1 X125.796 Y134.026 E-.07044
G1 X125.775 Y134.1 E-.04704
G1 X125.636 Y134.207 E-.10708
G1 X125.463 Y134.176 E-.10709
G1 X125.374 Y134.026 E-.10709
G1 X125.424 Y133.858 E-.10708
G1 X125.585 Y133.787 E-.10708
G1 X125.745 Y133.858 E-.10709
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I1.217 J.008 P1  F30000
G1 X125.808 Y124.324 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X125.724 Y123.632 I-.222 J-.324 E.05339
G3 X125.855 Y124.286 I-.145 J.369 E.02626
G1 X126.032 Y124.648 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X124.797 Y124.008 I-.447 J-.648 E.0524
G1 X124.797 Y124.008 E0
G3 X125.857 Y123.261 I.794 J.002 E.04659
G3 X126.08 Y124.612 I-.272 J.739 E.05102
M204 S10000
; WIPE_START
G1 F24000
G1 X125.864 Y124.737 E-.09478
G1 X125.68 Y124.783 E-.07223
G1 X125.49 Y124.783 E-.07223
G1 X125.305 Y124.737 E-.07223
G1 X125.137 Y124.649 E-.07223
G1 X124.995 Y124.523 E-.07223
G1 X124.887 Y124.366 E-.07223
G1 X124.819 Y124.189 E-.07223
G1 X124.797 Y124.008 E-.06932
G1 X124.797 Y124.008 E0
G1 X124.819 Y123.811 E-.07506
G1 X124.834 Y123.774 E-.01524
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I-.144 J1.208 P1  F30000
G1 X133.858 Y124.847 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X134.162 Y123.611 I.227 J-.6 E.06168
G1 X134.313 Y123.648 E.00515
G3 X133.915 Y124.866 I-.228 J.599 E.0648
G1 X133.719 Y125.214 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X134.21 Y123.219 I.366 J-.968 E.0922
G1 X134.438 Y123.275 E.0072
G1 X134.453 Y123.279 E.00049
G3 X133.776 Y125.234 I-.367 J.967 E.09801
M204 S10000
G1 X133.964 Y124.425 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.46864
G1 F1200
G1 X134.111 Y124.468 E.00532
G1 X134.244 Y124.391 E.00532
G1 X134.292 Y124.301 E.00353
G1 X134.279 Y124.148 E.00532
G1 X134.16 Y124.051 E.00532
G1 X134.007 Y124.045 E.00532
G1 X133.896 Y124.151 E.00532
G1 X133.872 Y124.302 E.00532
G1 X133.928 Y124.377 E.00324
; WIPE_START
G1 F24000
G1 X133.872 Y124.302 E-.05592
G1 X133.896 Y124.151 E-.09186
G1 X134.007 Y124.045 E-.09187
G1 X134.16 Y124.051 E-.09186
G1 X134.279 Y124.148 E-.09186
G1 X134.292 Y124.301 E-.09187
G1 X134.244 Y124.391 E-.06104
G1 X134.111 Y124.468 E-.09186
G1 X133.964 Y124.425 E-.09187
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I-1.213 J.095 P1  F30000
G1 X134.58 Y132.268 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X135.402 Y132.165 I.51 J.731 E.02858
G3 X135.592 Y133.735 I-.329 J.837 E.06416
G3 X134.532 Y132.304 I-.503 J-.736 E.09065
G1 X134.357 Y131.946 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X135.518 Y131.789 I.733 J1.055 E.03737
G1 X135.542 Y131.795 E.00074
G3 X135.817 Y134.06 I-.474 J1.207 E.0857
G3 X134.309 Y131.981 I-.726 J-1.06 E.1219
M204 S10000
G1 X134.715 Y132.672 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X134.605 Y132.882 E.00727
G1 X134.605 Y133.118 E.00727
G1 X134.715 Y133.328 E.00727
G1 X134.91 Y133.462 E.00727
G1 X135.144 Y133.491 E.00727
G1 X135.366 Y133.407 E.00727
G1 X135.523 Y133.23 E.00727
G1 X135.579 Y133 E.00727
G1 X135.523 Y132.77 E.00727
G1 X135.366 Y132.593 E.00727
G1 X135.144 Y132.509 E.00727
G1 X134.91 Y132.538 E.00727
G1 X134.764 Y132.638 E.00543
; CHANGE_LAYER
; Z_HEIGHT: 4.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
M73 P75 R2
G1 X134.91 Y132.538 E-.0671
G1 X135.144 Y132.509 E-.0899
G1 X135.366 Y132.593 E-.0899
G1 X135.523 Y132.77 E-.0899
G1 X135.579 Y133 E-.0899
G1 X135.523 Y133.23 E-.0899
G1 X135.366 Y133.407 E-.0899
G1 X135.144 Y133.491 E-.0899
G1 X134.978 Y133.471 E-.0636
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 22/55
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
G3 Z4.6 I.105 J-1.212 P1  F30000
G1 X126.074 Y132.696 Z4.6
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X126.079 Y132.697 E.00019
G3 X125.753 Y132.617 I-.493 J1.298 E.27821
G1 X126.015 Y132.681 E.00896
G1 X126.168 Y132.315 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X126.601 Y132.528 E.01483
G1 X126.924 Y132.814 E.01325
G1 X127.169 Y133.169 E.01325
G1 X127.321 Y133.572 E.01325
G1 X127.373 Y134 E.01325
G1 X127.321 Y134.428 E.01325
G1 X127.169 Y134.831 E.01325
G1 X126.924 Y135.186 E.01325
G1 X126.601 Y135.472 E.01325
G1 X126.219 Y135.672 E.01325
G1 X125.8 Y135.775 E.01325
G1 X125.369 Y135.775 E.01325
G1 X124.951 Y135.672 E.01325
G1 X124.569 Y135.472 E.01325
G1 X124.246 Y135.186 E.01325
G1 X124.001 Y134.831 E.01325
G1 X123.848 Y134.428 E.01325
G1 X123.796 Y134 E.01325
G1 X123.848 Y133.572 E.01325
G1 X124.001 Y133.169 E.01325
G1 X124.246 Y132.814 E.01325
G1 X124.569 Y132.528 E.01325
G1 X124.951 Y132.328 E.01325
G1 X125.369 Y132.225 E.01325
G1 X125.8 Y132.225 E.01325
G1 X126.11 Y132.301 E.00978
M204 S10000
G1 X126.152 Y133.178 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X125.822 Y133.038 E.01102
G1 X125.465 Y133.009 E.01102
G1 X125.124 Y133.122 E.01102
G1 X124.837 Y133.338 E.01102
G1 X124.658 Y133.648 E.01102
G1 X124.586 Y134 E.01102
G1 X124.658 Y134.352 E.01102
G1 X124.837 Y134.662 E.01102
G1 X125.124 Y134.878 E.01102
G1 X125.465 Y134.991 E.01102
G1 X125.822 Y134.962 E.01102
G1 X126.152 Y134.822 E.01102
G1 X126.401 Y134.563 E.01102
G1 X126.554 Y134.239 E.01102
G2 X126.554 Y133.761 I-1.469 J-.239 E.01475
G1 X126.401 Y133.437 E.01102
G1 X126.194 Y133.221 E.00918
G1 X126.048 Y133.59 F30000
G1 F1200
G1 X125.804 Y133.422 E.0091
G1 X125.51 Y133.386 E.0091
G1 X125.233 Y133.491 E.0091
G1 X125.037 Y133.712 E.0091
G1 X124.966 Y134 E.0091
G1 X125.037 Y134.288 E.0091
G1 X125.233 Y134.509 E.0091
G1 X125.51 Y134.614 E.0091
G1 X125.804 Y134.578 E.0091
G1 X126.048 Y134.41 E.0091
G1 X126.186 Y134.148 E.0091
G2 X126.186 Y133.852 I-.91 J-.148 E.00914
G1 X126.076 Y133.643 E.00726
G1 X125.745 Y133.858 F30000
; LINE_WIDTH: 0.468557
G1 F1200
G1 X125.585 Y133.787 E.00608
G1 X125.424 Y133.858 E.00608
G1 X125.374 Y134.026 E.00608
G1 X125.463 Y134.176 E.00608
G1 X125.636 Y134.207 E.00608
G1 X125.775 Y134.1 E.00608
G2 X125.763 Y133.915 I-.148 J-.083 E.00678
; WIPE_START
G1 F24000
G1 X125.796 Y134.026 E-.07044
G1 X125.775 Y134.1 E-.04705
G1 X125.636 Y134.207 E-.10708
G1 X125.463 Y134.176 E-.10709
G1 X125.374 Y134.026 E-.10709
G1 X125.424 Y133.858 E-.10708
G1 X125.585 Y133.787 E-.10708
G1 X125.745 Y133.858 E-.10709
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I1.217 J.008 P1  F30000
G1 X125.808 Y124.324 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X125.724 Y123.632 I-.222 J-.324 E.05339
G3 X125.855 Y124.285 I-.145 J.369 E.02626
G1 X126.027 Y124.641 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X125.68 Y123.217 I-.448 J-.645 E.09357
G1 X125.851 Y123.26 E.00542
G3 X126.075 Y124.605 I-.272 J.736 E.05075
M204 S10000
; WIPE_START
G1 F24000
G1 X125.864 Y124.737 E-.09457
G1 X125.68 Y124.783 E-.07223
G1 X125.49 Y124.783 E-.07223
G1 X125.305 Y124.737 E-.07223
G1 X125.137 Y124.649 E-.07223
G1 X124.995 Y124.523 E-.07223
G1 X124.887 Y124.366 E-.07223
G1 X124.819 Y124.189 E-.07223
G1 X124.796 Y124 E-.07223
G1 X124.819 Y123.811 E-.07223
G1 X124.834 Y123.773 E-.01537
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I-.144 J1.208 P1  F30000
G1 X133.858 Y124.847 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X134.162 Y123.611 I.227 J-.6 E.06168
G1 X134.313 Y123.648 E.00515
G3 X133.915 Y124.866 I-.228 J.599 E.0648
G1 X133.718 Y125.218 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X134.21 Y123.219 I.368 J-.97 E.09241
G1 X134.43 Y123.273 E.00697
G1 X134.453 Y123.279 E.00072
G3 X133.774 Y125.238 I-.368 J.97 E.09826
M204 S10000
G1 X133.964 Y124.425 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.46864
G1 F1200
G1 X134.111 Y124.468 E.00532
G1 X134.244 Y124.391 E.00532
G1 X134.292 Y124.301 E.00353
G1 X134.279 Y124.148 E.00532
G1 X134.16 Y124.051 E.00532
G1 X134.007 Y124.045 E.00532
G1 X133.896 Y124.151 E.00532
G1 X133.872 Y124.302 E.00532
G1 X133.928 Y124.377 E.00324
; WIPE_START
G1 F24000
G1 X133.872 Y124.302 E-.05592
G1 X133.896 Y124.151 E-.09186
G1 X134.007 Y124.045 E-.09187
G1 X134.16 Y124.051 E-.09187
G1 X134.279 Y124.148 E-.09186
G1 X134.292 Y124.301 E-.09187
G1 X134.244 Y124.391 E-.06104
G1 X134.111 Y124.468 E-.09186
G1 X133.964 Y124.425 E-.09187
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I-1.213 J.095 P1  F30000
G1 X134.578 Y132.266 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X135.193 Y132.113 I.508 J.731 E.02148
G1 X135.402 Y132.165 E.00714
G3 X134.53 Y132.301 I-.316 J.832 E.15492
G1 X134.354 Y131.941 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X135.24 Y131.721 I.732 J1.055 E.02869
G1 X135.51 Y131.787 E.00852
G1 X135.542 Y131.795 E.00102
G3 X134.305 Y131.976 I-.456 J1.2 E.20776
M204 S10000
G1 X134.715 Y132.672 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X134.605 Y132.882 E.00727
G1 X134.605 Y133.118 E.00727
G1 X134.715 Y133.328 E.00727
G1 X134.91 Y133.462 E.00727
G1 X135.144 Y133.491 E.00727
G1 X135.366 Y133.407 E.00727
G1 X135.523 Y133.23 E.00727
G1 X135.579 Y133 E.00727
G1 X135.523 Y132.77 E.00727
G1 X135.366 Y132.593 E.00727
G1 X135.144 Y132.509 E.00727
G1 X134.91 Y132.538 E.00727
G1 X134.764 Y132.638 E.00543
G1 X135.121 Y132.937 F30000
; LINE_WIDTH: 0.625676
G1 F1200
G2 X135.128 Y133.052 I-.033 J.06 E.01376
; CHANGE_LAYER
; Z_HEIGHT: 4.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X135.048 Y133.063 E-.20374
G1 X135.012 Y133 E-.18542
G1 X135.048 Y132.937 E-.18542
G1 X135.121 Y132.937 E-.18542
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 23/55
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
G3 Z4.8 I.033 J-1.217 P1  F30000
G1 X126.063 Y132.693 Z4.8
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X126.079 Y132.697 E.00055
G3 X125.753 Y132.617 I-.493 J1.298 E.2782
G1 X126.005 Y132.679 E.0086
G1 X126.156 Y132.312 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X126.219 Y132.328 E.00199
G1 X126.601 Y132.528 E.01325
G1 X126.924 Y132.814 E.01325
G1 X127.169 Y133.169 E.01325
G1 X127.321 Y133.572 E.01325
G1 X127.373 Y134 E.01325
G1 X127.321 Y134.428 E.01325
G1 X127.169 Y134.831 E.01325
G1 X126.924 Y135.186 E.01325
G1 X126.601 Y135.472 E.01325
G1 X126.219 Y135.672 E.01325
G1 X125.8 Y135.775 E.01325
G1 X125.369 Y135.775 E.01325
G1 X124.951 Y135.672 E.01325
G1 X124.569 Y135.472 E.01325
G1 X124.246 Y135.186 E.01325
G1 X124.001 Y134.831 E.01325
G1 X123.848 Y134.428 E.01325
G1 X123.796 Y134 E.01325
G1 X123.848 Y133.572 E.01325
G1 X124.001 Y133.169 E.01325
G1 X124.209 Y132.867 E.01125
G1 X124.246 Y132.814 E.00199
G1 X124.569 Y132.528 E.01325
G1 X124.951 Y132.328 E.01325
G1 X125.369 Y132.225 E.01325
G1 X125.8 Y132.225 E.01325
G1 X126.098 Y132.298 E.00941
M204 S10000
G1 X126.154 Y133.18 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X125.818 Y133.036 E.01123
G1 X125.465 Y133.009 E.01088
G1 X125.128 Y133.12 E.0109
G1 X124.829 Y133.35 E.01158
G1 X124.658 Y133.65 E.01061
G1 X124.586 Y134 E.01098
G1 X124.658 Y134.352 E.01103
G1 X124.837 Y134.662 E.01101
G1 X125.124 Y134.878 E.01103
G1 X125.465 Y134.991 E.01102
G1 X125.822 Y134.962 E.01103
G1 X126.152 Y134.822 E.01102
G1 X126.401 Y134.563 E.01103
G1 X126.554 Y134.239 E.01102
G2 X126.554 Y133.761 I-1.467 J-.239 E.01475
G1 X126.398 Y133.434 E.01115
G1 X126.196 Y133.223 E.00899
G1 X126.048 Y133.59 F30000
G1 F1200
G1 X125.792 Y133.418 E.00947
G1 X125.51 Y133.386 E.00871
G1 X125.238 Y133.489 E.00896
G1 X125.037 Y133.712 E.00923
G1 X124.966 Y134 E.0091
G1 X125.037 Y134.288 E.0091
G1 X125.233 Y134.509 E.0091
G1 X125.51 Y134.614 E.0091
G1 X125.804 Y134.578 E.0091
G1 X126.048 Y134.41 E.0091
G1 X126.186 Y134.148 E.0091
G2 X126.186 Y133.852 I-.908 J-.148 E.00914
G1 X126.076 Y133.643 E.00726
G1 X125.746 Y133.857 F30000
; LINE_WIDTH: 0.467432
G1 F1200
G1 X125.583 Y133.787 E.00613
G1 X125.433 Y133.852 E.00567
G1 X125.37 Y134 E.00555
G1 X125.444 Y134.16 E.00609
G1 X125.611 Y134.213 E.00607
G1 X125.761 Y134.121 E.00609
G2 X125.763 Y133.915 I-.133 J-.105 E.00767
; WIPE_START
G1 F24000
G1 X125.797 Y134.025 E-.07031
G1 X125.761 Y134.121 E-.06237
G1 X125.611 Y134.213 E-.10727
G1 X125.444 Y134.16 E-.10701
G1 X125.37 Y134 E-.10724
G1 X125.433 Y133.852 E-.09785
G1 X125.583 Y133.787 E-.09995
G1 X125.746 Y133.857 E-.10799
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I1.217 J.008 P1  F30000
G1 X125.807 Y124.322 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X125.632 Y123.609 I-.222 J-.323 E.05025
M73 P76 R2
G1 X125.724 Y123.632 E.00315
G3 X125.854 Y124.284 I-.139 J.367 E.02632
G1 X126.028 Y124.642 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X125.49 Y123.217 I-.447 J-.645 E.08759
G3 X125.845 Y123.258 I.095 J.742 E.0111
G3 X126.076 Y124.606 I-.265 J.739 E.05099
M204 S10000
; WIPE_START
G1 F24000
G1 X125.865 Y124.737 E-.0946
G1 X125.68 Y124.783 E-.07223
G1 X125.49 Y124.783 E-.07223
G1 X125.305 Y124.737 E-.07223
G1 X125.137 Y124.649 E-.07223
G1 X124.995 Y124.523 E-.07223
G1 X124.887 Y124.366 E-.07223
G1 X124.819 Y124.189 E-.07223
G1 X124.796 Y124 E-.07223
G1 X124.819 Y123.811 E-.07223
G1 X124.834 Y123.774 E-.01534
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I-.144 J1.208 P1  F30000
G1 X133.858 Y124.847 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X134.162 Y123.611 I.227 J-.6 E.06168
G1 X134.313 Y123.648 E.00515
G3 X133.915 Y124.866 I-.228 J.599 E.0648
G1 X133.718 Y125.217 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X134.423 Y123.272 I.371 J-.966 E.09869
G1 X134.453 Y123.279 E.00095
G3 X134.675 Y125.105 I-.382 J.973 E.06907
G3 X133.775 Y125.237 I-.586 J-.853 E.02895
M204 S10000
G1 X133.964 Y124.425 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.468642
G1 F1200
G1 X134.111 Y124.468 E.00532
G1 X134.244 Y124.391 E.00532
G1 X134.292 Y124.301 E.00353
G1 X134.279 Y124.148 E.00532
G1 X134.16 Y124.051 E.00532
G1 X134.007 Y124.045 E.00532
G1 X133.896 Y124.151 E.00532
G1 X133.872 Y124.302 E.00532
G1 X133.928 Y124.377 E.00324
; WIPE_START
G1 F24000
G1 X133.872 Y124.302 E-.05592
G1 X133.896 Y124.151 E-.09186
G1 X134.007 Y124.045 E-.09187
G1 X134.16 Y124.051 E-.09186
G1 X134.279 Y124.148 E-.09186
G1 X134.292 Y124.301 E-.09187
G1 X134.244 Y124.391 E-.06104
G1 X134.111 Y124.468 E-.09186
G1 X133.964 Y124.425 E-.09187
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I-1.213 J.095 P1  F30000
G1 X134.578 Y132.266 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X135.193 Y132.113 I.508 J.731 E.02148
G1 X135.402 Y132.165 E.00715
G3 X134.53 Y132.301 I-.316 J.832 E.15492
G1 X134.359 Y131.948 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X135.501 Y131.785 I.735 J1.069 E.03674
G1 X135.542 Y131.795 E.0013
G3 X135.817 Y134.06 I-.474 J1.207 E.0857
G3 X133.802 Y133.042 I-.728 J-1.062 E.0846
G1 X133.796 Y133 E.0013
G3 X134.31 Y131.983 I1.297 J.016 E.03625
M204 S10000
G1 X134.715 Y132.672 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X134.605 Y132.882 E.00727
G1 X134.605 Y133.118 E.00727
G1 X134.715 Y133.328 E.00727
G1 X134.91 Y133.462 E.00727
G1 X135.144 Y133.491 E.00727
G1 X135.366 Y133.407 E.00727
G1 X135.523 Y133.23 E.00727
G1 X135.579 Y133 E.00727
G1 X135.523 Y132.77 E.00727
G1 X135.366 Y132.593 E.00727
G1 X135.144 Y132.509 E.00727
G1 X134.91 Y132.538 E.00727
G1 X134.764 Y132.638 E.00543
G1 X135.121 Y132.937 F30000
; LINE_WIDTH: 0.625668
G1 F1200
G2 X135.128 Y133.052 I-.033 J.06 E.01376
; CHANGE_LAYER
; Z_HEIGHT: 4.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X135.048 Y133.063 E-.20374
G1 X135.012 Y133 E-.18542
G1 X135.048 Y132.937 E-.18542
G1 X135.121 Y132.937 E-.18542
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 24/55
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
G3 Z5 I.033 J-1.217 P1  F30000
G1 X126.052 Y132.69 Z5
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X126.079 Y132.697 E.00092
G3 X126.377 Y135.147 I-.513 J1.305 E.10006
G3 X125.995 Y132.672 I-.791 J-1.145 E.18671
G1 X126.146 Y132.31 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X126.219 Y132.328 E.00231
G1 X126.601 Y132.528 E.01325
G1 X126.924 Y132.814 E.01325
G1 X127.169 Y133.169 E.01325
G1 X127.321 Y133.572 E.01325
G1 X127.373 Y134 E.01325
G1 X127.321 Y134.428 E.01325
G1 X127.169 Y134.831 E.01325
G1 X126.924 Y135.186 E.01325
G1 X126.601 Y135.472 E.01325
G1 X126.219 Y135.672 E.01325
G1 X125.8 Y135.775 E.01325
G1 X125.369 Y135.775 E.01325
G1 X124.951 Y135.672 E.01325
G1 X124.569 Y135.472 E.01325
G1 X124.246 Y135.186 E.01325
G1 X124.001 Y134.831 E.01325
G1 X123.848 Y134.428 E.01325
G1 X123.796 Y134 E.01325
G1 X123.848 Y133.572 E.01325
G1 X124.001 Y133.169 E.01325
G1 X124.203 Y132.877 E.01088
G1 X124.246 Y132.814 E.00236
G1 X124.569 Y132.528 E.01325
G1 X124.951 Y132.328 E.01325
G1 X125.369 Y132.225 E.01325
G1 X125.8 Y132.225 E.01325
G1 X126.088 Y132.295 E.00909
M204 S10000
G1 X126.155 Y133.181 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X125.814 Y133.036 E.01139
G1 X125.465 Y133.009 E.01077
G1 X125.124 Y133.123 E.01105
G1 X124.837 Y133.338 E.011
G1 X124.658 Y133.649 E.01103
G1 X124.586 Y134 E.01101
G1 X124.658 Y134.352 E.01103
G1 X124.837 Y134.662 E.01102
G1 X125.124 Y134.878 E.01103
G1 X125.465 Y134.991 E.01102
G1 X125.822 Y134.962 E.01103
G1 X126.152 Y134.822 E.01102
G1 X126.401 Y134.563 E.01104
G1 X126.554 Y134.239 E.01101
G2 X126.554 Y133.761 I-1.466 J-.239 E.01475
G1 X126.397 Y133.432 E.01122
G1 X126.197 Y133.224 E.00887
G1 X126.048 Y133.59 F30000
G1 F1200
G1 X125.783 Y133.416 E.00973
G1 X125.51 Y133.386 E.00843
G1 X125.233 Y133.491 E.0091
G1 X125.037 Y133.712 E.0091
G1 X124.966 Y134 E.0091
G1 X125.037 Y134.288 E.0091
G1 X125.233 Y134.509 E.0091
G1 X125.51 Y134.614 E.0091
G1 X125.804 Y134.578 E.0091
G1 X126.048 Y134.41 E.0091
G1 X126.186 Y134.148 E.0091
G2 X126.186 Y133.852 I-.907 J-.148 E.00914
G1 X126.076 Y133.643 E.00726
G1 X125.746 Y133.857 F30000
; LINE_WIDTH: 0.466817
G1 F1200
G1 X125.582 Y133.786 E.00617
G1 X125.424 Y133.857 E.006
G1 X125.373 Y134.026 E.00609
G1 X125.463 Y134.177 E.00607
G1 X125.636 Y134.207 E.00609
G1 X125.776 Y134.1 E.00607
G2 X125.764 Y133.915 I-.149 J-.083 E.00679
; WIPE_START
G1 F24000
G1 X125.797 Y134.025 E-.07014
G1 X125.776 Y134.1 E-.0475
G1 X125.636 Y134.207 E-.10692
G1 X125.463 Y134.177 E-.1072
G1 X125.373 Y134.026 E-.10692
G1 X125.424 Y133.857 E-.1072
G1 X125.582 Y133.786 E-.10559
G1 X125.746 Y133.857 E-.10854
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I1.217 J.008 P1  F30000
G1 X125.808 Y124.324 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X125.724 Y123.632 I-.222 J-.324 E.05339
G3 X125.855 Y124.286 I-.145 J.369 E.02626
G1 X126.03 Y124.644 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X124.8 Y124.026 I-.446 J-.646 E.05161
G1 X124.8 Y124.026 E0
G3 X125.84 Y123.257 I.79 J-.02 E.04656
G1 X125.84 Y123.257 E0
G3 X126.078 Y124.608 I-.256 J.742 E.05133
M204 S10000
; WIPE_START
G1 F24000
G1 X125.864 Y124.737 E-.09467
G1 X125.68 Y124.783 E-.07223
G1 X125.49 Y124.783 E-.07223
G1 X125.305 Y124.737 E-.07223
G1 X125.137 Y124.649 E-.07223
G1 X124.995 Y124.523 E-.07223
G1 X124.887 Y124.366 E-.07223
G1 X124.819 Y124.189 E-.07223
G1 X124.8 Y124.026 E-.06245
G1 X124.8 Y124.026 E0
G1 X124.819 Y123.811 E-.08176
G1 X124.834 Y123.773 E-.01552
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I-.144 J1.208 P1  F30000
G1 X133.858 Y124.849 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X134.313 Y123.648 I.23 J-.599 E.06672
G3 X134.45 Y124.78 I-.237 J.603 E.04621
G3 X133.915 Y124.868 I-.362 J-.53 E.01859
G1 X133.718 Y125.218 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X134.416 Y123.27 I.371 J-.966 E.09844
G1 X134.453 Y123.279 E.00118
G3 X134.675 Y125.105 I-.382 J.973 E.06907
G3 X133.775 Y125.237 I-.586 J-.853 E.02895
M204 S10000
G1 X133.964 Y124.425 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.468644
G1 F1200
G1 X134.111 Y124.468 E.00532
G1 X134.244 Y124.391 E.00532
G1 X134.292 Y124.301 E.00353
G1 X134.279 Y124.148 E.00532
G1 X134.16 Y124.051 E.00532
G1 X134.007 Y124.045 E.00532
G1 X133.896 Y124.151 E.00532
G1 X133.872 Y124.302 E.00532
G1 X133.928 Y124.377 E.00324
; WIPE_START
G1 F24000
G1 X133.872 Y124.302 E-.05592
G1 X133.896 Y124.151 E-.09186
G1 X134.007 Y124.045 E-.09187
G1 X134.16 Y124.051 E-.09186
G1 X134.279 Y124.148 E-.09186
G1 X134.292 Y124.301 E-.09187
G1 X134.244 Y124.391 E-.06103
G1 X134.111 Y124.468 E-.09187
G1 X133.964 Y124.425 E-.09187
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I-1.213 J.095 P1  F30000
G1 X134.58 Y132.268 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X135.402 Y132.165 I.51 J.731 E.02858
G3 X135.592 Y133.735 I-.329 J.837 E.06416
G3 X134.532 Y132.304 I-.503 J-.736 E.09065
G1 X134.356 Y131.945 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X135.492 Y131.783 I.73 J1.058 E.03653
G1 X135.542 Y131.795 E.00158
G3 X135.817 Y134.06 I-.474 J1.207 E.0857
G3 X134.308 Y131.98 I-.73 J-1.058 E.12226
M204 S10000
G1 X134.715 Y132.672 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X134.605 Y132.882 E.00727
G1 X134.605 Y133.118 E.00727
G1 X134.715 Y133.328 E.00727
G1 X134.91 Y133.462 E.00727
G1 X135.144 Y133.491 E.00727
G1 X135.366 Y133.407 E.00727
G1 X135.523 Y133.23 E.00727
G1 X135.579 Y133 E.00727
G1 X135.523 Y132.77 E.00727
G1 X135.366 Y132.593 E.00727
G1 X135.144 Y132.509 E.00727
G1 X134.91 Y132.538 E.00727
G1 X134.764 Y132.638 E.00543
G1 X135.121 Y132.937 F30000
; LINE_WIDTH: 0.625676
G1 F1200
G2 X135.128 Y133.052 I-.033 J.06 E.01376
; CHANGE_LAYER
; Z_HEIGHT: 5
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X135.048 Y133.063 E-.20374
G1 X135.012 Y133 E-.18542
G1 X135.048 Y132.937 E-.18542
G1 X135.121 Y132.937 E-.18542
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 25/55
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
G3 Z5.2 I.033 J-1.217 P1  F30000
G1 X126.041 Y132.688 Z5.2
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X126.079 Y132.697 E.0013
G3 X125.753 Y132.617 I-.494 J1.303 E.27926
G1 X125.983 Y132.673 E.00786
G1 X126.135 Y132.307 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X126.219 Y132.328 E.00266
G1 X126.601 Y132.528 E.01325
G1 X126.924 Y132.814 E.01325
G1 X127.169 Y133.169 E.01325
G1 X127.321 Y133.572 E.01325
G1 X127.373 Y134 E.01325
G1 X127.321 Y134.428 E.01325
G1 X127.169 Y134.831 E.01325
G1 X126.924 Y135.186 E.01325
G1 X126.601 Y135.472 E.01325
G1 X126.219 Y135.672 E.01325
G1 X125.8 Y135.775 E.01325
G1 X125.369 Y135.775 E.01325
G1 X124.951 Y135.672 E.01325
G1 X124.569 Y135.472 E.01325
M73 P77 R2
G1 X124.246 Y135.186 E.01325
G1 X124.001 Y134.831 E.01325
G1 X123.848 Y134.428 E.01325
G1 X123.796 Y134 E.01325
G1 X123.848 Y133.572 E.01325
G1 X124.001 Y133.169 E.01325
G1 X124.196 Y132.887 E.01051
G1 X124.246 Y132.814 E.00274
G1 X124.569 Y132.528 E.01325
G1 X124.951 Y132.328 E.01325
G1 X125.369 Y132.225 E.01325
G1 X125.8 Y132.225 E.01325
G1 X126.077 Y132.293 E.00874
M204 S10000
; WIPE_START
G1 F24000
G1 X126.219 Y132.328 E-.05573
G1 X126.601 Y132.528 E-.16384
G1 X126.924 Y132.814 E-.16384
G1 X127.169 Y133.169 E-.16384
G1 X127.321 Y133.572 E-.16384
G1 X127.337 Y133.7 E-.04892
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I-.092 J-1.213 P1  F30000
G1 X125.702 Y133.824 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.465878
G1 F1200
G1 X125.536 Y133.791 E.00582
G1 X125.394 Y133.9 E.00617
G1 X125.384 Y134.075 E.00604
G1 X125.462 Y134.178 E.00445
G1 X125.636 Y134.208 E.00607
G1 X125.761 Y134.121 E.00526
G1 X125.794 Y133.948 E.00606
G1 X125.738 Y133.873 E.00326
G1 X126.048 Y133.59 F30000
; LINE_WIDTH: 0.419999
G1 F1200
G1 X125.774 Y133.414 E.01
G1 X125.51 Y133.386 E.00815
G1 X125.243 Y133.486 E.00878
G1 X125.037 Y133.712 E.0094
G1 X124.966 Y134 E.0091
G1 X125.037 Y134.288 E.0091
G1 X125.233 Y134.509 E.0091
G1 X125.51 Y134.614 E.0091
G1 X125.804 Y134.578 E.0091
G1 X126.048 Y134.41 E.0091
G1 X126.186 Y134.148 E.0091
G1 X126.186 Y133.852 E.0091
G1 X126.076 Y133.643 E.00726
G1 X126.332 Y133.338 F30000
G1 F1200
G1 X126.022 Y133.116 E.01174
G1 X125.705 Y133.009 E.01026
G1 X125.339 Y133.04 E.01129
G1 X125.022 Y133.176 E.0106
G1 X124.762 Y133.447 E.01154
G1 X124.615 Y133.761 E.01066
G1 X124.601 Y134.121 E.01106
G1 X124.701 Y134.464 E.01099
G2 X125.018 Y134.822 I1.259 J-.796 E.01475
G1 X125.348 Y134.963 E.01103
G1 X125.705 Y134.991 E.01101
G1 X126.046 Y134.878 E.01104
G1 X126.332 Y134.662 E.01101
G1 X126.512 Y134.351 E.01105
G1 X126.583 Y134 E.011
G1 X126.511 Y133.646 E.01112
G1 X126.362 Y133.39 E.00908
; WIPE_START
G1 F24000
G1 X126.511 Y133.646 E-.11232
G1 X126.583 Y134 E-.13752
G1 X126.512 Y134.351 E-.13604
G1 X126.332 Y134.662 E-.13661
G1 X126.046 Y134.878 E-.13617
G1 X125.793 Y134.962 E-.10134
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I1.217 J.002 P1  F30000
G1 X125.807 Y124.322 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X125.632 Y123.609 I-.222 J-.323 E.05025
G1 X125.724 Y123.632 E.00315
G3 X125.854 Y124.284 I-.139 J.367 E.02632
G1 X126.027 Y124.641 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X125.49 Y123.217 I-.45 J-.644 E.0878
G3 X125.834 Y123.255 I.095 J.716 E.01073
G3 X126.075 Y124.605 I-.256 J.742 E.05124
M204 S10000
; WIPE_START
G1 F24000
G1 X125.864 Y124.737 E-.09457
G1 X125.68 Y124.783 E-.07223
G1 X125.49 Y124.783 E-.07223
G1 X125.305 Y124.737 E-.07223
G1 X125.137 Y124.649 E-.07223
G1 X124.995 Y124.523 E-.07223
G1 X124.887 Y124.366 E-.07223
G1 X124.819 Y124.189 E-.07223
G1 X124.796 Y124 E-.07223
G1 X124.819 Y123.811 E-.07223
G1 X124.834 Y123.773 E-.01537
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I-.144 J1.208 P1  F30000
G1 X133.858 Y124.849 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X134.313 Y123.648 I.23 J-.599 E.06672
G3 X134.45 Y124.78 I-.237 J.603 E.04621
G3 X133.915 Y124.868 I-.362 J-.53 E.01859
G1 X133.718 Y125.218 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X134.408 Y123.268 I.371 J-.966 E.09819
G1 X134.453 Y123.279 E.00142
G3 X134.675 Y125.105 I-.382 J.973 E.06907
G3 X133.774 Y125.238 I-.586 J-.853 E.02896
M204 S10000
G1 X133.964 Y124.425 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.468643
G1 F1200
G1 X134.111 Y124.468 E.00532
G1 X134.244 Y124.391 E.00532
G1 X134.304 Y124.25 E.00532
G1 X134.244 Y124.109 E.00532
G1 X134.111 Y124.032 E.00532
G1 X133.964 Y124.075 E.00532
G1 X133.872 Y124.198 E.00532
G1 X133.896 Y124.349 E.00532
G1 X133.924 Y124.38 E.00145
; WIPE_START
G1 F24000
G1 X133.896 Y124.349 E-.02509
G1 X133.872 Y124.198 E-.09186
G1 X133.964 Y124.075 E-.09187
G1 X134.111 Y124.032 E-.09186
G1 X134.244 Y124.109 E-.09186
G1 X134.304 Y124.25 E-.09187
G1 X134.244 Y124.391 E-.09186
G1 X134.111 Y124.468 E-.09187
G1 X133.964 Y124.425 E-.09187
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I-1.213 J.095 P1  F30000
G1 X134.578 Y132.266 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X135.193 Y132.113 I.508 J.731 E.02148
G1 X135.402 Y132.165 E.00715
G3 X134.53 Y132.301 I-.316 J.832 E.15492
G1 X134.357 Y131.945 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X135.483 Y131.781 I.73 J1.058 E.03623
G1 X135.542 Y131.795 E.00186
G3 X135.817 Y134.06 I-.474 J1.207 E.0857
G3 X134.308 Y131.98 I-.73 J-1.057 E.12223
M204 S10000
G1 X134.715 Y132.672 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X134.605 Y132.882 E.00727
G1 X134.605 Y133.118 E.00727
G1 X134.715 Y133.328 E.00727
G1 X134.91 Y133.462 E.00727
G1 X135.144 Y133.491 E.00727
G1 X135.366 Y133.407 E.00727
G1 X135.523 Y133.23 E.00727
G1 X135.579 Y133 E.00727
G1 X135.523 Y132.77 E.00727
G1 X135.366 Y132.593 E.00727
G1 X135.144 Y132.509 E.00727
G1 X134.91 Y132.538 E.00727
G1 X134.764 Y132.638 E.00543
G1 X135.121 Y132.937 F30000
; LINE_WIDTH: 0.625674
G1 F1200
G2 X135.128 Y133.052 I-.033 J.06 E.01376
; CHANGE_LAYER
; Z_HEIGHT: 5.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X135.048 Y133.063 E-.20374
G1 X135.012 Y133 E-.18542
G1 X135.048 Y132.937 E-.18542
G1 X135.121 Y132.937 E-.18542
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 26/55
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
G3 Z5.4 I.034 J-1.216 P1  F30000
G1 X126.03 Y132.685 Z5.4
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X126.079 Y132.697 E.00168
G3 X125.753 Y132.617 I-.494 J1.303 E.27926
G1 X125.972 Y132.671 E.00747
G1 X126.124 Y132.304 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X126.219 Y132.328 E.00302
G1 X126.601 Y132.528 E.01325
G1 X126.924 Y132.814 E.01325
G1 X127.169 Y133.169 E.01325
G1 X127.321 Y133.572 E.01325
G1 X127.373 Y134 E.01325
G1 X127.321 Y134.428 E.01325
G1 X127.169 Y134.831 E.01325
G1 X126.924 Y135.186 E.01325
G1 X126.601 Y135.472 E.01325
G1 X126.219 Y135.672 E.01325
G1 X125.8 Y135.775 E.01325
G1 X125.369 Y135.775 E.01325
G1 X124.951 Y135.672 E.01325
G1 X124.569 Y135.472 E.01325
G1 X124.246 Y135.186 E.01325
G1 X124.001 Y134.831 E.01325
G1 X123.848 Y134.428 E.01325
G1 X123.796 Y134 E.01325
G1 X123.848 Y133.572 E.01325
G1 X124.001 Y133.169 E.01325
G1 X124.189 Y132.897 E.01014
G1 X124.246 Y132.814 E.00311
G1 X124.569 Y132.528 E.01325
G1 X124.951 Y132.328 E.01325
G1 X125.369 Y132.225 E.01325
G1 X125.8 Y132.225 E.01325
G1 X126.065 Y132.29 E.00839
M204 S10000
G1 X126.157 Y133.183 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X125.705 Y133.009 E.01487
G1 X125.337 Y133.04 E.01135
G1 X125.023 Y133.175 E.01049
G1 X124.701 Y133.536 E.01487
G1 X124.601 Y133.883 E.0111
G1 X124.615 Y134.239 E.01095
G1 X124.77 Y134.564 E.01105
G1 X125.018 Y134.822 E.011
G1 X125.348 Y134.963 E.01104
G1 X125.705 Y134.991 E.01101
G1 X126.046 Y134.877 E.01104
G1 X126.332 Y134.662 E.01101
G1 X126.512 Y134.351 E.01105
G1 X126.569 Y134.118 E.00735
G1 X126.554 Y133.761 E.01098
G1 X126.395 Y133.428 E.01135
G1 X126.199 Y133.226 E.00865
G1 X126.048 Y133.59 F30000
G1 F1200
G1 X125.765 Y133.412 E.01028
G1 X125.51 Y133.386 E.00786
G1 X125.245 Y133.485 E.00871
G1 X125.037 Y133.712 E.00947
G1 X124.966 Y134 E.0091
G1 X125.037 Y134.288 E.0091
G1 X125.233 Y134.509 E.0091
G1 X125.51 Y134.614 E.0091
G1 X125.804 Y134.578 E.0091
G1 X126.048 Y134.41 E.0091
G1 X126.186 Y134.148 E.0091
G2 X126.186 Y133.852 I-.904 J-.148 E.00914
G1 X126.076 Y133.643 E.00726
G1 X125.747 Y133.857 F30000
; LINE_WIDTH: 0.465119
G1 F1200
G1 X125.58 Y133.785 E.00624
G1 X125.436 Y133.855 E.0055
G1 X125.369 Y134 E.00551
G1 X125.442 Y134.16 E.00606
G1 X125.585 Y134.215 E.00527
G1 X125.747 Y134.143 E.00607
G1 X125.798 Y134.025 E.00445
G1 X125.764 Y133.914 E.00397
; WIPE_START
G1 F24000
G1 X125.798 Y134.025 E-.07011
G1 X125.747 Y134.143 E-.07857
G1 X125.585 Y134.215 E-.10707
G1 X125.442 Y134.16 E-.09305
G1 X125.369 Y134 E-.10685
G1 X125.436 Y133.855 E-.09719
G1 X125.58 Y133.785 E-.09708
G1 X125.747 Y133.857 E-.11008
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I1.217 J.007 P1  F30000
G1 X125.802 Y124.314 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X125.724 Y124.365 E.0031
G3 X125.632 Y123.609 I-.138 J-.367 E.04711
G1 X125.724 Y123.632 E.00315
G3 X125.878 Y124.26 I-.139 J.367 E.02518
G1 X125.851 Y124.279 E.00112
G1 X126.03 Y124.644 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X124.801 Y124.038 I-.445 J-.645 E.05121
G1 X124.801 Y124.038 E0
G3 X125.828 Y123.254 I.793 J-.025 E.04637
G3 X126.078 Y124.608 I-.244 J.745 E.05167
M204 S10000
; WIPE_START
G1 F24000
G1 X125.865 Y124.737 E-.09467
G1 X125.68 Y124.783 E-.07223
G1 X125.49 Y124.783 E-.07223
G1 X125.305 Y124.737 E-.07223
G1 X125.137 Y124.649 E-.07223
G1 X124.995 Y124.523 E-.07223
G1 X124.887 Y124.366 E-.07223
G1 X124.819 Y124.189 E-.07223
G1 X124.801 Y124.038 E-.05787
G1 X124.801 Y124.038 E0
G1 X124.819 Y123.811 E-.08624
G1 X124.834 Y123.773 E-.01562
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I-.144 J1.208 P1  F30000
G1 X133.858 Y124.847 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X134.162 Y123.611 I.227 J-.6 E.06168
G1 X134.313 Y123.648 E.00515
G3 X133.915 Y124.866 I-.228 J.599 E.0648
G1 X133.719 Y125.214 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M73 P78 R2
G3 X134.21 Y123.219 I.366 J-.968 E.0922
G1 X134.401 Y123.266 E.00605
G1 X134.453 Y123.279 E.00165
G3 X133.776 Y125.234 I-.367 J.967 E.09801
M204 S10000
G1 X133.964 Y124.425 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.468643
G1 F1200
G1 X134.111 Y124.468 E.00532
G1 X134.244 Y124.391 E.00532
G1 X134.292 Y124.301 E.00353
G1 X134.279 Y124.148 E.00532
G1 X134.16 Y124.051 E.00532
G1 X134.007 Y124.045 E.00532
G1 X133.896 Y124.151 E.00532
G1 X133.872 Y124.302 E.00532
G1 X133.928 Y124.377 E.00324
; WIPE_START
G1 F24000
G1 X133.872 Y124.302 E-.05592
G1 X133.896 Y124.151 E-.09186
G1 X134.007 Y124.045 E-.09187
G1 X134.16 Y124.051 E-.09186
G1 X134.279 Y124.148 E-.09186
G1 X134.292 Y124.301 E-.09186
G1 X134.244 Y124.391 E-.06103
G1 X134.111 Y124.468 E-.09186
G1 X133.964 Y124.425 E-.09187
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I-1.213 J.095 P1  F30000
G1 X134.576 Y132.263 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X134.977 Y132.113 I.504 J.735 E.01434
G3 X135.381 Y132.159 I.108 J.841 E.0136
G3 X134.528 Y132.299 I-.301 J.839 E.15579
G1 X134.354 Y131.941 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X135.474 Y131.779 I.725 J1.058 E.03603
G1 X135.542 Y131.795 E.00213
G3 X135.817 Y134.06 I-.474 J1.207 E.0857
G3 X133.805 Y133.069 I-.723 J-1.069 E.08351
G1 X133.796 Y133 E.00213
G3 X134.305 Y131.976 I1.283 J-.001 E.03641
M204 S10000
G1 X134.715 Y132.672 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X134.605 Y132.882 E.00727
G1 X134.605 Y133.118 E.00727
G1 X134.715 Y133.328 E.00727
G1 X134.91 Y133.462 E.00727
G1 X135.144 Y133.491 E.00727
G1 X135.366 Y133.407 E.00727
G1 X135.523 Y133.23 E.00727
G1 X135.579 Y133 E.00727
G1 X135.523 Y132.77 E.00727
G1 X135.367 Y132.595 E.00721
G1 X135.144 Y132.509 E.00733
G1 X134.91 Y132.538 E.00726
G1 X134.764 Y132.638 E.00543
G1 X135.121 Y132.937 F30000
; LINE_WIDTH: 0.625286
G1 F1200
G2 X135.128 Y133.052 I-.033 J.06 E.01374
; CHANGE_LAYER
; Z_HEIGHT: 5.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X135.048 Y133.063 E-.2037
G1 X135.012 Y133 E-.18543
G1 X135.048 Y132.937 E-.18544
G1 X135.121 Y132.937 E-.18543
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 27/55
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
G3 Z5.6 I.034 J-1.216 P1  F30000
G1 X126.018 Y132.682 Z5.6
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X126.079 Y132.697 E.00207
G3 X125.753 Y132.617 I-.494 J1.303 E.27926
G1 X125.96 Y132.668 E.00708
G1 X126.112 Y132.301 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X126.219 Y132.328 E.00338
G1 X126.601 Y132.528 E.01325
G1 X126.924 Y132.814 E.01325
G1 X127.169 Y133.169 E.01325
G1 X127.321 Y133.572 E.01325
G1 X127.373 Y134 E.01325
G1 X127.321 Y134.428 E.01325
G1 X127.169 Y134.831 E.01325
G1 X126.924 Y135.186 E.01325
G1 X126.601 Y135.472 E.01325
G1 X126.219 Y135.672 E.01325
G1 X125.8 Y135.775 E.01325
G1 X125.369 Y135.775 E.01325
G1 X124.951 Y135.672 E.01325
G1 X124.569 Y135.472 E.01325
G1 X124.246 Y135.186 E.01325
G1 X124.001 Y134.831 E.01325
G1 X123.848 Y134.428 E.01325
G1 X123.796 Y134 E.01325
G1 X123.848 Y133.572 E.01325
G1 X124.001 Y133.169 E.01325
G1 X124.182 Y132.907 E.00977
G1 X124.246 Y132.814 E.00348
G1 X124.569 Y132.528 E.01325
G1 X124.951 Y132.328 E.01325
G1 X125.369 Y132.225 E.01325
G1 X125.8 Y132.225 E.01325
G1 X126.054 Y132.287 E.00802
M204 S10000
G1 X126.152 Y133.178 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X125.822 Y133.038 E.01102
G1 X125.465 Y133.009 E.01102
G1 X125.124 Y133.122 E.01102
G1 X124.837 Y133.338 E.01102
G1 X124.658 Y133.648 E.01102
G1 X124.586 Y134 E.01102
G1 X124.658 Y134.352 E.01102
G1 X124.837 Y134.662 E.01102
G1 X125.124 Y134.878 E.01102
G1 X125.465 Y134.991 E.01102
G1 X125.822 Y134.962 E.01102
G1 X126.152 Y134.822 E.01102
G1 X126.401 Y134.563 E.01102
G1 X126.554 Y134.239 E.01102
G2 X126.554 Y133.761 I-1.469 J-.239 E.01475
G1 X126.401 Y133.437 E.01102
G1 X126.194 Y133.221 E.00918
G1 X126.048 Y133.59 F30000
G1 F1200
G1 X125.804 Y133.422 E.0091
G1 X125.51 Y133.386 E.0091
G1 X125.233 Y133.491 E.0091
G1 X125.037 Y133.712 E.0091
G1 X124.966 Y134 E.0091
G1 X125.037 Y134.288 E.0091
G1 X125.233 Y134.509 E.0091
G1 X125.51 Y134.614 E.0091
G1 X125.804 Y134.578 E.0091
G1 X126.048 Y134.41 E.0091
G1 X126.186 Y134.148 E.0091
G2 X126.186 Y133.852 I-.91 J-.148 E.00914
G1 X126.076 Y133.643 E.00726
G1 X125.745 Y133.858 F30000
; LINE_WIDTH: 0.468556
G1 F1200
G1 X125.585 Y133.787 E.00608
G1 X125.424 Y133.858 E.00608
G1 X125.374 Y134.026 E.00608
G1 X125.463 Y134.176 E.00608
G1 X125.636 Y134.207 E.00608
G1 X125.775 Y134.1 E.00608
G2 X125.763 Y133.915 I-.148 J-.083 E.00678
; WIPE_START
G1 F24000
G1 X125.796 Y134.026 E-.07044
G1 X125.775 Y134.1 E-.04705
G1 X125.636 Y134.207 E-.10708
G1 X125.463 Y134.176 E-.10708
G1 X125.374 Y134.026 E-.10709
G1 X125.424 Y133.858 E-.10709
G1 X125.585 Y133.787 E-.10708
G1 X125.745 Y133.858 E-.10709
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I1.217 J.008 P1  F30000
G1 X125.808 Y124.324 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X125.724 Y123.632 I-.222 J-.324 E.05339
G3 X125.855 Y124.286 I-.145 J.369 E.02626
G1 X126.028 Y124.642 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X125.305 Y123.263 I-.449 J-.643 E.08184
G3 X125.822 Y123.252 I.275 J.807 E.01613
G3 X126.076 Y124.605 I-.243 J.746 E.0516
M204 S10000
; WIPE_START
G1 F24000
G1 X125.864 Y124.737 E-.09458
G1 X125.68 Y124.783 E-.07223
G1 X125.49 Y124.783 E-.07223
G1 X125.305 Y124.737 E-.07223
G1 X125.137 Y124.649 E-.07223
G1 X124.995 Y124.523 E-.07223
G1 X124.887 Y124.366 E-.07223
G1 X124.819 Y124.189 E-.07223
G1 X124.796 Y124 E-.07223
G1 X124.819 Y123.811 E-.07223
G1 X124.834 Y123.774 E-.01536
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I-.144 J1.208 P1  F30000
G1 X133.858 Y124.847 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X134.162 Y123.611 I.227 J-.6 E.06168
G1 X134.313 Y123.648 E.00515
G3 X133.915 Y124.866 I-.228 J.599 E.0648
G1 X133.719 Y125.214 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X134.21 Y123.219 I.366 J-.968 E.0922
G1 X134.394 Y123.264 E.00581
G1 X134.453 Y123.279 E.00188
G3 X133.776 Y125.234 I-.367 J.967 E.09801
M204 S10000
G1 X133.921 Y124.395 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.468643
G1 F1200
G1 X134.059 Y124.461 E.00532
G1 X134.209 Y124.43 E.00532
G1 X134.292 Y124.301 E.00532
G1 X134.292 Y124.199 E.00353
G1 X134.209 Y124.07 E.00532
G1 X134.059 Y124.039 E.00532
G1 X133.921 Y124.105 E.00532
G1 X133.872 Y124.25 E.00532
G1 X133.902 Y124.338 E.00324
; WIPE_START
G1 F24000
G1 X133.872 Y124.25 E-.05592
G1 X133.921 Y124.105 E-.09186
G1 X134.059 Y124.039 E-.09187
G1 X134.209 Y124.07 E-.09186
G1 X134.292 Y124.199 E-.09187
G1 X134.292 Y124.301 E-.06103
G1 X134.209 Y124.43 E-.09186
G1 X134.059 Y124.461 E-.09186
G1 X133.921 Y124.395 E-.09186
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I-1.213 J.101 P1  F30000
G1 X134.576 Y132.263 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X134.977 Y132.113 I.502 J.735 E.01435
G3 X135.372 Y132.157 I.108 J.823 E.0133
G3 X134.528 Y132.298 I-.294 J.84 E.15585
G1 X134.359 Y131.948 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X135.466 Y131.776 I.73 J1.055 E.03561
G1 X135.542 Y131.795 E.00241
G3 X135.817 Y134.06 I-.474 J1.207 E.0857
G3 X134.311 Y131.984 I-.727 J-1.057 E.12191
M204 S10000
G1 X134.715 Y132.672 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X134.605 Y132.882 E.00727
G1 X134.605 Y133.118 E.00727
G1 X134.715 Y133.328 E.00727
G1 X134.91 Y133.462 E.00727
G1 X135.144 Y133.491 E.00727
G1 X135.366 Y133.407 E.00727
G1 X135.523 Y133.23 E.00727
G1 X135.579 Y133 E.00727
G1 X135.523 Y132.77 E.00727
G1 X135.368 Y132.595 E.00718
G1 X135.144 Y132.509 E.00736
G1 X134.91 Y132.538 E.00726
G1 X134.764 Y132.638 E.00543
G1 X135.121 Y132.937 F30000
; LINE_WIDTH: 0.625138
G1 F1200
G2 X135.128 Y133.052 I-.033 J.059 E.01373
; CHANGE_LAYER
; Z_HEIGHT: 5.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X135.048 Y133.063 E-.20368
G1 X135.012 Y133 E-.18544
G1 X135.048 Y132.937 E-.18544
G1 X135.121 Y132.937 E-.18544
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 28/55
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
G3 Z5.8 I.034 J-1.216 P1  F30000
G1 X126.007 Y132.679 Z5.8
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X126.079 Y132.697 E.00247
G3 X126.377 Y135.147 I-.513 J1.305 E.10006
G3 X125.949 Y132.663 I-.79 J-1.143 E.1848
G1 X126.101 Y132.299 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X126.219 Y132.328 E.00375
G1 X126.601 Y132.528 E.01325
G1 X126.924 Y132.814 E.01325
G1 X127.169 Y133.169 E.01325
G1 X127.321 Y133.572 E.01325
G1 X127.373 Y134 E.01325
G1 X127.321 Y134.428 E.01325
G1 X127.169 Y134.831 E.01325
G1 X126.924 Y135.186 E.01325
G1 X126.601 Y135.472 E.01325
G1 X126.219 Y135.672 E.01325
G1 X125.8 Y135.775 E.01325
G1 X125.369 Y135.775 E.01325
G1 X124.951 Y135.672 E.01325
G1 X124.569 Y135.472 E.01325
G1 X124.246 Y135.186 E.01325
G1 X124.001 Y134.831 E.01325
G1 X123.848 Y134.428 E.01325
G1 X123.796 Y134 E.01325
G1 X123.848 Y133.572 E.01325
G1 X124.001 Y133.169 E.01325
G1 X124.175 Y132.917 E.0094
G1 X124.246 Y132.814 E.00385
G1 X124.569 Y132.528 E.01325
G1 X124.951 Y132.328 E.01325
G1 X125.369 Y132.225 E.01325
G1 X125.8 Y132.225 E.01325
G1 X126.042 Y132.284 E.00765
M204 S10000
M73 P79 R2
G1 X126.152 Y133.178 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X125.822 Y133.038 E.01102
G1 X125.465 Y133.009 E.01102
G1 X125.124 Y133.122 E.01102
G1 X124.837 Y133.338 E.01102
G1 X124.658 Y133.648 E.01102
G1 X124.586 Y134 E.01102
G1 X124.658 Y134.352 E.01102
G1 X124.837 Y134.662 E.01102
G1 X125.124 Y134.878 E.01102
G1 X125.465 Y134.991 E.01102
G1 X125.822 Y134.962 E.01102
G1 X126.152 Y134.822 E.01102
G1 X126.401 Y134.563 E.01102
G1 X126.554 Y134.239 E.01102
G2 X126.554 Y133.761 I-1.469 J-.239 E.01475
G1 X126.401 Y133.437 E.01102
G1 X126.194 Y133.221 E.00918
G1 X126.048 Y133.59 F30000
G1 F1200
G1 X125.804 Y133.422 E.0091
G1 X125.51 Y133.386 E.0091
G1 X125.233 Y133.491 E.0091
G1 X125.037 Y133.712 E.0091
G1 X124.966 Y134 E.0091
G1 X125.037 Y134.288 E.0091
G1 X125.233 Y134.509 E.0091
G1 X125.51 Y134.614 E.0091
G1 X125.804 Y134.578 E.0091
G1 X126.048 Y134.41 E.0091
G1 X126.186 Y134.148 E.0091
G2 X126.186 Y133.852 I-.91 J-.148 E.00914
G1 X126.076 Y133.643 E.00726
G1 X125.745 Y133.858 F30000
; LINE_WIDTH: 0.468556
G1 F1200
G1 X125.585 Y133.787 E.00608
G1 X125.424 Y133.858 E.00608
G1 X125.374 Y134.026 E.00608
G1 X125.463 Y134.176 E.00608
G1 X125.636 Y134.207 E.00608
G1 X125.775 Y134.1 E.00608
G2 X125.763 Y133.915 I-.148 J-.083 E.00678
; WIPE_START
G1 F24000
G1 X125.796 Y134.026 E-.07044
G1 X125.775 Y134.1 E-.04704
G1 X125.636 Y134.207 E-.10708
G1 X125.463 Y134.176 E-.10709
G1 X125.374 Y134.026 E-.10709
G1 X125.424 Y133.858 E-.10708
G1 X125.585 Y133.787 E-.10709
G1 X125.745 Y133.858 E-.10709
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I1.217 J.007 P1  F30000
G1 X125.802 Y124.314 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X125.724 Y124.365 E.0031
G3 X125.632 Y123.609 I-.138 J-.367 E.04711
G1 X125.724 Y123.632 E.00315
G3 X125.878 Y124.26 I-.139 J.367 E.02518
G1 X125.851 Y124.279 E.00112
G1 X126.026 Y124.64 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X124.802 Y124.049 I-.444 J-.643 E.05061
G1 X124.802 Y124.049 E0
G3 X125.816 Y123.251 I.793 J-.037 E.04631
G3 X126.074 Y124.604 I-.234 J.746 E.05178
M204 S10000
; WIPE_START
G1 F24000
G1 X125.864 Y124.737 E-.09456
G1 X125.68 Y124.783 E-.07223
G1 X125.49 Y124.783 E-.07223
G1 X125.305 Y124.737 E-.07223
G1 X125.137 Y124.649 E-.07223
G1 X124.995 Y124.523 E-.07223
G1 X124.887 Y124.366 E-.07223
G1 X124.819 Y124.189 E-.07223
G1 X124.802 Y124.049 E-.05329
G1 X124.802 Y124.049 E0
G1 X124.819 Y123.811 E-.09073
G1 X124.834 Y123.772 E-.01581
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I-.144 J1.208 P1  F30000
G1 X133.858 Y124.849 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X134.007 Y123.611 I.222 J-.601 E.05683
G3 X134.293 Y123.643 I.078 J.595 E.00962
G3 X133.915 Y124.867 I-.212 J.605 E.06515
G1 X133.717 Y125.221 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X133.495 Y123.395 I.361 J-.97 E.06956
G3 X134.386 Y123.263 I.58 J.836 E.02869
G3 X133.773 Y125.24 I-.308 J.988 E.09981
M204 S10000
G1 X133.921 Y124.395 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.468383
G1 F1200
G1 X134.059 Y124.461 E.00532
G1 X134.21 Y124.431 E.00532
G1 X134.292 Y124.301 E.00533
G1 X134.291 Y124.198 E.00357
G1 X134.211 Y124.071 E.0052
G1 X134.059 Y124.039 E.00541
G1 X133.921 Y124.105 E.0053
G1 X133.872 Y124.25 E.00532
G1 X133.902 Y124.339 E.00324
; WIPE_START
G1 F24000
G1 X133.872 Y124.25 E-.0559
G1 X133.921 Y124.105 E-.09192
G1 X134.059 Y124.039 E-.09155
G1 X134.211 Y124.071 E-.09335
G1 X134.291 Y124.198 E-.08985
G1 X134.292 Y124.301 E-.06168
G1 X134.21 Y124.431 E-.09199
G1 X134.059 Y124.461 E-.09184
G1 X133.921 Y124.395 E-.09191
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I-1.213 J.101 P1  F30000
G1 X134.577 Y132.264 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X134.768 Y132.165 I.502 J.736 E.00717
G3 X135.363 Y132.155 I.312 J.92 E.02006
G3 X134.528 Y132.299 I-.284 J.844 E.15638
G1 X134.359 Y131.949 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X135.457 Y131.774 I.73 J1.055 E.03532
G1 X135.542 Y131.795 E.00269
G3 X135.817 Y134.06 I-.474 J1.207 E.0857
G3 X134.311 Y131.984 I-.728 J-1.057 E.12191
M204 S10000
G1 X134.715 Y132.672 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X134.605 Y132.882 E.00727
G1 X134.605 Y133.118 E.00727
G1 X134.715 Y133.328 E.00727
G1 X134.91 Y133.462 E.00727
G1 X135.144 Y133.491 E.00727
G1 X135.366 Y133.407 E.00727
G1 X135.523 Y133.23 E.00727
G1 X135.579 Y133 E.00727
G1 X135.523 Y132.77 E.00727
G1 X135.368 Y132.595 E.00716
G1 X135.144 Y132.509 E.00738
G1 X134.91 Y132.538 E.00726
G1 X134.764 Y132.638 E.00543
G1 X135.121 Y132.937 F30000
; LINE_WIDTH: 0.625006
G1 F1200
G2 X135.128 Y133.052 I-.033 J.059 E.01372
; CHANGE_LAYER
; Z_HEIGHT: 5.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X135.048 Y133.063 E-.20366
G1 X135.012 Y133 E-.18545
G1 X135.048 Y132.937 E-.18545
G1 X135.121 Y132.937 E-.18545
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 29/55
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
G3 Z6 I.035 J-1.216 P1  F30000
G1 X125.995 Y132.676 Z6
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X126.079 Y132.697 E.00287
G3 X125.753 Y132.617 I-.494 J1.303 E.27926
G1 X125.937 Y132.662 E.00628
G1 X126.089 Y132.296 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X126.219 Y132.328 E.00412
G1 X126.601 Y132.528 E.01325
G1 X126.924 Y132.814 E.01325
G1 X127.169 Y133.169 E.01325
G1 X127.321 Y133.572 E.01325
G1 X127.373 Y134 E.01325
G1 X127.321 Y134.428 E.01325
G1 X127.169 Y134.831 E.01325
G1 X126.924 Y135.186 E.01325
G1 X126.601 Y135.472 E.01325
G1 X126.219 Y135.672 E.01325
G1 X125.8 Y135.775 E.01325
G1 X125.369 Y135.775 E.01325
G1 X124.951 Y135.672 E.01325
G1 X124.569 Y135.472 E.01325
G1 X124.246 Y135.186 E.01325
G1 X124.001 Y134.831 E.01325
G1 X123.848 Y134.428 E.01325
G1 X123.796 Y134 E.01325
G1 X123.848 Y133.572 E.01325
G1 X124.001 Y133.169 E.01325
G1 X124.168 Y132.927 E.00903
G1 X124.246 Y132.814 E.00422
G1 X124.569 Y132.528 E.01325
G1 X124.951 Y132.328 E.01325
G1 X125.369 Y132.225 E.01325
G1 X125.8 Y132.225 E.01325
G1 X126.031 Y132.281 E.00728
M204 S10000
G1 X126.152 Y133.178 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X125.822 Y133.038 E.01102
G1 X125.465 Y133.009 E.01102
G1 X125.124 Y133.122 E.01102
G1 X124.837 Y133.338 E.01102
G1 X124.658 Y133.648 E.01102
G1 X124.586 Y134 E.01102
G1 X124.658 Y134.352 E.01102
G1 X124.837 Y134.662 E.01102
G1 X125.124 Y134.878 E.01102
G1 X125.465 Y134.991 E.01102
G1 X125.822 Y134.962 E.01102
G1 X126.152 Y134.822 E.01102
G1 X126.401 Y134.563 E.01102
G1 X126.554 Y134.239 E.01102
G2 X126.554 Y133.761 I-1.469 J-.239 E.01475
G1 X126.401 Y133.437 E.01102
G1 X126.194 Y133.221 E.00918
G1 X126.048 Y133.59 F30000
G1 F1200
G1 X125.804 Y133.422 E.0091
G1 X125.51 Y133.386 E.0091
G1 X125.233 Y133.491 E.0091
G1 X125.037 Y133.712 E.0091
G1 X124.966 Y134 E.0091
G1 X125.037 Y134.288 E.0091
G1 X125.233 Y134.509 E.0091
G1 X125.51 Y134.614 E.0091
G1 X125.804 Y134.578 E.0091
G1 X126.048 Y134.41 E.0091
G1 X126.186 Y134.148 E.0091
G2 X126.186 Y133.852 I-.91 J-.148 E.00914
G1 X126.076 Y133.643 E.00726
G1 X125.745 Y133.858 F30000
; LINE_WIDTH: 0.468557
G1 F1200
G1 X125.585 Y133.787 E.00608
G1 X125.424 Y133.858 E.00608
G1 X125.374 Y134.026 E.00608
G1 X125.463 Y134.176 E.00608
G1 X125.636 Y134.207 E.00608
G1 X125.775 Y134.1 E.00608
G2 X125.763 Y133.915 I-.148 J-.083 E.00678
; WIPE_START
G1 F24000
G1 X125.796 Y134.026 E-.07044
G1 X125.775 Y134.1 E-.04705
G1 X125.636 Y134.207 E-.10708
G1 X125.463 Y134.176 E-.10709
G1 X125.374 Y134.026 E-.10709
G1 X125.424 Y133.858 E-.10708
G1 X125.585 Y133.787 E-.10708
G1 X125.745 Y133.858 E-.10709
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I1.217 J.008 P1  F30000
G1 X125.808 Y124.324 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X125.724 Y123.632 I-.222 J-.324 E.05339
G3 X125.855 Y124.286 I-.145 J.369 E.02626
G1 X126.029 Y124.643 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X125.305 Y123.263 I-.451 J-.643 E.0821
G3 X125.81 Y123.249 I.274 J.801 E.01576
G3 X126.077 Y124.607 I-.233 J.751 E.05198
M204 S10000
; WIPE_START
G1 F24000
G1 X125.864 Y124.737 E-.09461
G1 X125.68 Y124.783 E-.07223
G1 X125.49 Y124.783 E-.07223
G1 X125.305 Y124.737 E-.07223
G1 X125.137 Y124.649 E-.07223
G1 X124.995 Y124.523 E-.07223
G1 X124.887 Y124.366 E-.07223
G1 X124.819 Y124.189 E-.07223
G1 X124.796 Y124 E-.07223
G1 X124.819 Y123.811 E-.07223
G1 X124.834 Y123.774 E-.01533
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I-.144 J1.208 P1  F30000
G1 X133.858 Y124.849 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X134.007 Y123.611 I.221 J-.601 E.05692
G3 X134.285 Y123.641 I.078 J.579 E.00937
G3 X133.915 Y124.868 I-.207 J.607 E.06529
G1 X133.717 Y125.221 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X133.495 Y123.395 I.361 J-.97 E.06957
G3 X134.379 Y123.261 I.579 J.834 E.02846
G3 X133.773 Y125.24 I-.302 J.99 E.09999
M204 S10000
G1 X133.921 Y124.395 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.468306
G1 F1200
G1 X134.059 Y124.461 E.00532
G1 X134.21 Y124.431 E.00532
G1 X134.292 Y124.301 E.00533
G1 X134.291 Y124.197 E.00358
G1 X134.212 Y124.071 E.00517
G1 X134.059 Y124.039 E.00543
G1 X133.921 Y124.105 E.0053
G1 X133.872 Y124.25 E.00532
G1 X133.902 Y124.339 E.00324
; WIPE_START
G1 F24000
G1 X133.872 Y124.25 E-.05589
G1 X133.921 Y124.105 E-.09193
G1 X134.059 Y124.039 E-.09147
G1 X134.212 Y124.071 E-.0938
G1 X134.291 Y124.197 E-.08923
G1 X134.292 Y124.301 E-.06188
G1 X134.21 Y124.431 E-.09203
G1 X134.059 Y124.461 E-.09183
G1 X133.921 Y124.395 E-.09193
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I-1.213 J.101 P1  F30000
G1 X134.577 Y132.264 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X134.768 Y132.165 I.501 J.734 E.00717
G3 X135.354 Y132.153 I.311 J.915 E.01976
G3 X134.528 Y132.299 I-.276 J.845 E.15634
G1 X134.354 Y131.942 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X135.448 Y131.772 I.724 J1.058 E.03517
M73 P80 R2
G1 X135.542 Y131.795 E.00297
G3 X135.817 Y134.06 I-.474 J1.207 E.0857
G3 X133.808 Y133.096 I-.723 J-1.068 E.08266
G1 X133.796 Y133 E.00297
G3 X134.306 Y131.976 I1.282 J-.001 E.03641
M204 S10000
G1 X134.715 Y132.672 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X134.605 Y132.882 E.00727
G1 X134.605 Y133.118 E.00727
G1 X134.715 Y133.328 E.00727
G1 X134.91 Y133.462 E.00727
G1 X135.144 Y133.491 E.00727
G1 X135.366 Y133.407 E.00727
G1 X135.523 Y133.23 E.00727
G1 X135.579 Y133 E.00727
G1 X135.523 Y132.77 E.00727
G1 X135.369 Y132.596 E.00714
G1 X135.144 Y132.509 E.0074
G1 X134.91 Y132.538 E.00725
G1 X134.764 Y132.638 E.00543
G1 X135.121 Y132.937 F30000
; LINE_WIDTH: 0.624878
G1 F1200
G2 X135.128 Y133.052 I-.033 J.059 E.01371
; CHANGE_LAYER
; Z_HEIGHT: 6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X135.048 Y133.063 E-.20365
G1 X135.012 Y133 E-.18545
G1 X135.048 Y132.937 E-.18545
G1 X135.121 Y132.937 E-.18545
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 30/55
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
G3 Z6.2 I.035 J-1.216 P1  F30000
G1 X125.983 Y132.673 Z6.2
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X126.079 Y132.697 E.00328
G3 X124.351 Y133.352 I-.494 J1.303 E.22342
G1 X124.542 Y133.076 E.01114
G3 X125.925 Y132.658 I1.045 J.961 E.05029
G1 X126.077 Y132.293 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X126.219 Y132.328 E.0045
G1 X126.601 Y132.528 E.01325
G1 X126.924 Y132.814 E.01325
G1 X127.169 Y133.169 E.01325
G1 X127.321 Y133.572 E.01325
G1 X127.373 Y134 E.01325
G1 X127.321 Y134.428 E.01325
G1 X127.169 Y134.831 E.01325
G1 X126.924 Y135.186 E.01325
G1 X126.601 Y135.472 E.01325
G1 X126.219 Y135.672 E.01325
G1 X125.8 Y135.775 E.01325
G1 X125.369 Y135.775 E.01325
G1 X124.951 Y135.672 E.01325
G1 X124.569 Y135.472 E.01325
G1 X124.246 Y135.186 E.01325
G1 X124.001 Y134.831 E.01325
G1 X123.848 Y134.428 E.01325
G1 X123.796 Y134 E.01325
G1 X123.848 Y133.572 E.01325
G1 X124.001 Y133.169 E.01325
G1 X124.161 Y132.937 E.00866
G1 X124.246 Y132.814 E.00459
G1 X124.569 Y132.528 E.01325
G1 X124.951 Y132.328 E.01325
G1 X125.369 Y132.225 E.01325
G1 X125.8 Y132.225 E.01325
G1 X126.019 Y132.278 E.0069
M204 S10000
G1 X126.152 Y133.178 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X125.822 Y133.038 E.01102
G1 X125.465 Y133.009 E.01102
G1 X125.124 Y133.122 E.01102
G1 X124.837 Y133.338 E.01102
G1 X124.658 Y133.648 E.01102
G1 X124.586 Y134 E.01102
G1 X124.658 Y134.352 E.01102
G1 X124.837 Y134.662 E.01102
G1 X125.124 Y134.878 E.01102
G1 X125.465 Y134.991 E.01102
G1 X125.822 Y134.962 E.01102
G1 X126.152 Y134.822 E.01102
G1 X126.401 Y134.563 E.01102
G1 X126.554 Y134.239 E.01102
G2 X126.554 Y133.761 I-1.469 J-.239 E.01475
G1 X126.401 Y133.437 E.01102
G1 X126.194 Y133.221 E.00918
G1 X126.048 Y133.59 F30000
G1 F1200
G1 X125.804 Y133.422 E.0091
G1 X125.51 Y133.386 E.0091
G1 X125.233 Y133.491 E.0091
G1 X125.037 Y133.712 E.0091
G1 X124.966 Y134 E.0091
G1 X125.037 Y134.288 E.0091
G1 X125.233 Y134.509 E.0091
G1 X125.51 Y134.614 E.0091
G1 X125.804 Y134.578 E.0091
G1 X126.048 Y134.41 E.0091
G1 X126.186 Y134.148 E.0091
G2 X126.186 Y133.852 I-.91 J-.148 E.00914
G1 X126.076 Y133.643 E.00726
G1 X125.745 Y133.858 F30000
; LINE_WIDTH: 0.468554
G1 F1200
G1 X125.585 Y133.787 E.00608
G1 X125.424 Y133.858 E.00608
G1 X125.374 Y134.026 E.00608
G1 X125.463 Y134.176 E.00608
G1 X125.636 Y134.207 E.00608
G1 X125.775 Y134.1 E.00608
G2 X125.763 Y133.915 I-.148 J-.083 E.00678
; WIPE_START
G1 F24000
G1 X125.796 Y134.026 E-.07044
G1 X125.775 Y134.1 E-.04705
G1 X125.636 Y134.207 E-.10708
G1 X125.463 Y134.176 E-.10708
G1 X125.374 Y134.026 E-.10708
G1 X125.424 Y133.858 E-.10709
G1 X125.585 Y133.787 E-.10708
G1 X125.745 Y133.858 E-.10709
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I1.217 J.008 P1  F30000
G1 X125.807 Y124.322 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X125.632 Y123.609 I-.222 J-.323 E.05025
G1 X125.724 Y123.632 E.00315
G3 X125.854 Y124.284 I-.139 J.367 E.02632
G1 X126.03 Y124.644 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X124.804 Y124.061 I-.445 J-.645 E.05044
G1 X124.804 Y124.061 E0
G3 X125.804 Y123.248 I.782 J-.06 E.04651
G3 X126.078 Y124.608 I-.22 J.752 E.05237
M204 S10000
; WIPE_START
G1 F24000
G1 X125.864 Y124.737 E-.09467
G1 X125.68 Y124.783 E-.07223
G1 X125.49 Y124.783 E-.07223
G1 X125.305 Y124.737 E-.07223
G1 X125.137 Y124.649 E-.07223
G1 X124.995 Y124.523 E-.07223
G1 X124.887 Y124.366 E-.07223
G1 X124.819 Y124.189 E-.07223
G1 X124.804 Y124.061 E-.04871
G1 X124.804 Y124.061 E0
G1 X124.819 Y123.811 E-.09523
G1 X124.834 Y123.772 E-.01579
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I-.144 J1.208 P1  F30000
G1 X133.857 Y124.85 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X134.007 Y123.611 I.22 J-.602 E.05701
G3 X134.278 Y123.64 I.078 J.563 E.00912
G3 X133.915 Y124.868 I-.201 J.608 E.06545
G1 X133.717 Y125.221 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X133.495 Y123.395 I.36 J-.97 E.06959
G3 X134.372 Y123.259 I.579 J.833 E.02822
G3 X133.773 Y125.24 I-.295 J.992 E.10018
M204 S10000
G1 X133.896 Y124.349 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.468233
G1 F1200
G1 X134.007 Y124.455 E.00532
G1 X134.161 Y124.449 E.00532
G1 X134.279 Y124.352 E.00531
G2 X134.279 Y124.148 I-.304 J-.102 E.00721
G1 X134.11 Y124.032 E.00708
G1 X133.964 Y124.075 E.0053
G1 X133.872 Y124.197 E.00531
G1 X133.887 Y124.29 E.00324
; WIPE_START
G1 F24000
G1 X133.872 Y124.197 E-.05597
G1 X133.964 Y124.075 E-.09161
G1 X134.11 Y124.032 E-.09146
G1 X134.279 Y124.148 E-.12224
G1 X134.292 Y124.301 E-.0918
G1 X134.279 Y124.352 E-.03161
G1 X134.161 Y124.449 E-.09172
G1 X134.007 Y124.455 E-.09188
G1 X133.896 Y124.349 E-.09173
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I-1.212 J.104 P1  F30000
G1 X134.576 Y132.263 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X134.768 Y132.165 I.501 J.737 E.00717
G3 X135.345 Y132.151 I.311 J.91 E.01946
G3 X134.528 Y132.299 I-.268 J.849 E.15698
G1 X134.354 Y131.941 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X135.24 Y131.721 I.732 J1.055 E.02869
G1 X135.439 Y131.77 E.0063
G1 X135.542 Y131.795 E.00324
G3 X134.305 Y131.976 I-.456 J1.2 E.20776
M204 S10000
G1 X134.715 Y132.672 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X134.605 Y132.882 E.00727
G1 X134.605 Y133.118 E.00727
G1 X134.715 Y133.328 E.00727
G1 X134.91 Y133.462 E.00727
G1 X135.144 Y133.491 E.00727
G1 X135.366 Y133.407 E.00727
G1 X135.523 Y133.23 E.00727
G1 X135.579 Y133 E.00727
G1 X135.523 Y132.77 E.00728
G1 X135.369 Y132.596 E.00713
G1 X135.144 Y132.509 E.00742
G1 X134.91 Y132.538 E.00725
G1 X134.764 Y132.638 E.00543
G1 X135.121 Y132.937 F30000
; LINE_WIDTH: 0.624764
G1 F1200
G2 X135.127 Y133.052 I-.033 J.059 E.01371
; CHANGE_LAYER
; Z_HEIGHT: 6.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X135.048 Y133.063 E-.20363
G1 X135.012 Y133 E-.18546
G1 X135.048 Y132.937 E-.18546
G1 X135.121 Y132.937 E-.18546
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 31/55
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
G3 Z6.4 I.036 J-1.216 P1  F30000
G1 X125.971 Y132.67 Z6.4
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X126.079 Y132.697 E.00369
G3 X126.377 Y135.147 I-.513 J1.305 E.10006
G3 X125.913 Y132.655 I-.79 J-1.142 E.18357
G1 X126.065 Y132.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X126.219 Y132.328 E.00488
G1 X126.601 Y132.528 E.01325
G1 X126.924 Y132.814 E.01325
G1 X127.169 Y133.169 E.01325
G1 X127.321 Y133.572 E.01325
G1 X127.373 Y134 E.01325
G1 X127.321 Y134.428 E.01325
G1 X127.169 Y134.831 E.01325
G1 X126.924 Y135.186 E.01325
G1 X126.601 Y135.472 E.01325
G1 X126.219 Y135.672 E.01325
G1 X125.8 Y135.775 E.01325
G1 X125.369 Y135.775 E.01325
G1 X124.951 Y135.672 E.01325
G1 X124.569 Y135.472 E.01325
G1 X124.246 Y135.186 E.01325
G1 X124.001 Y134.831 E.01325
G1 X123.848 Y134.428 E.01325
G1 X123.796 Y134 E.01325
G1 X123.848 Y133.572 E.01325
G1 X124.001 Y133.169 E.01325
G1 X124.155 Y132.947 E.00829
G1 X124.246 Y132.814 E.00496
G1 X124.569 Y132.528 E.01325
G1 X124.951 Y132.328 E.01325
G1 X125.369 Y132.225 E.01325
G1 X125.8 Y132.225 E.01325
G1 X126.007 Y132.275 E.00652
M204 S10000
; WIPE_START
G1 F24000
G1 X126.219 Y132.328 E-.08317
G1 X126.601 Y132.528 E-.16384
G1 X126.924 Y132.814 E-.16384
G1 X127.169 Y133.169 E-.16384
G1 X127.321 Y133.572 E-.16384
G1 X127.328 Y133.628 E-.02148
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I-.135 J-1.209 P1  F30000
G1 X125.684 Y133.812 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.468556
G1 F1200
G1 X125.509 Y133.8 E.00608
G1 X125.386 Y133.925 E.00608
G1 X125.395 Y134.1 E.00608
G1 X125.534 Y134.207 E.00608
G1 X125.611 Y134.213 E.00267
G1 X125.76 Y134.121 E.00608
G1 X125.793 Y133.949 E.00608
G1 X125.721 Y133.858 E.004
G1 X125.936 Y133.491 F30000
; LINE_WIDTH: 0.419999
M73 P81 R2
G1 F1200
G1 X125.659 Y133.386 E.0091
G1 X125.366 Y133.422 E.0091
G1 X125.122 Y133.59 E.0091
G1 X124.984 Y133.852 E.0091
G1 X124.984 Y134.148 E.0091
G1 X125.122 Y134.41 E.0091
G1 X125.366 Y134.578 E.0091
G1 X125.659 Y134.614 E.0091
G1 X125.936 Y134.509 E.0091
G1 X126.133 Y134.288 E.0091
G1 X126.204 Y134 E.0091
G1 X126.133 Y133.712 E.0091
G1 X125.976 Y133.536 E.00726
G1 X126.046 Y133.122 F30000
G1 F1200
G1 X125.705 Y133.009 E.01102
G1 X125.348 Y133.038 E.01102
G1 X125.018 Y133.178 E.01102
G1 X124.769 Y133.437 E.01102
G1 X124.615 Y133.761 E.01102
G1 X124.601 Y134.119 E.01102
G1 X124.701 Y134.464 E.01102
G1 X124.928 Y134.742 E.01102
G1 X125.231 Y134.934 E.01102
G2 X125.705 Y134.991 I.414 J-1.429 E.01475
G1 X126.046 Y134.878 E.01102
G1 X126.332 Y134.662 E.01102
G1 X126.512 Y134.352 E.01102
G1 X126.583 Y134 E.01102
G1 X126.512 Y133.648 E.01102
G1 X126.332 Y133.338 E.01102
G1 X126.094 Y133.158 E.00918
; WIPE_START
G1 F24000
G1 X126.332 Y133.338 E-.11352
G1 X126.512 Y133.648 E-.13632
G1 X126.583 Y134 E-.13633
G1 X126.512 Y134.352 E-.13632
G1 X126.332 Y134.662 E-.13632
G1 X126.119 Y134.822 E-.10119
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I1.216 J-.037 P1  F30000
G1 X125.803 Y124.317 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X125.632 Y123.609 I-.228 J-.319 E.05088
G1 X125.705 Y123.627 E.00247
G3 X125.849 Y124.278 I-.13 J.37 E.02645
G1 X126.028 Y124.643 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X125.305 Y123.263 I-.452 J-.643 E.08211
G3 X125.799 Y123.247 I.273 J.797 E.01539
G3 X126.076 Y124.606 I-.222 J.753 E.05227
M204 S10000
; WIPE_START
G1 F24000
G1 X125.925 Y124.706 E-.06886
G1 X125.864 Y124.737 E-.02581
G1 X125.68 Y124.783 E-.07223
G1 X125.49 Y124.783 E-.07223
G1 X125.305 Y124.737 E-.07223
G1 X125.137 Y124.649 E-.07223
G1 X124.995 Y124.523 E-.07223
G1 X124.887 Y124.366 E-.07223
G1 X124.819 Y124.189 E-.07223
G1 X124.796 Y124 E-.07223
G1 X124.819 Y123.811 E-.07223
G1 X124.834 Y123.774 E-.01527
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I-.144 J1.208 P1  F30000
G1 X133.857 Y124.852 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X134.007 Y123.611 I.219 J-.603 E.05715
G3 X134.271 Y123.638 I.078 J.548 E.00887
G3 X133.914 Y124.87 I-.195 J.611 E.06569
G1 X133.717 Y125.221 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X133.308 Y123.561 I.362 J-.969 E.0618
G3 X134.365 Y123.257 I.778 J.715 E.03554
G3 X133.773 Y125.24 I-.286 J.994 E.1005
M204 S10000
G1 X133.921 Y124.396 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.468167
G1 F1200
G1 X134.059 Y124.462 E.00532
G1 X134.21 Y124.431 E.00531
G1 X134.292 Y124.301 E.00533
G1 X134.291 Y124.197 E.0036
G1 X134.213 Y124.072 E.0051
G1 X134.058 Y124.039 E.00548
G1 X133.921 Y124.104 E.00529
G1 X133.872 Y124.25 E.00532
G1 X133.902 Y124.339 E.00324
; WIPE_START
G1 F24000
G1 X133.872 Y124.25 E-.05589
G1 X133.921 Y124.104 E-.09197
G1 X134.058 Y124.039 E-.09131
G1 X134.213 Y124.072 E-.09461
G1 X134.291 Y124.197 E-.08813
G1 X134.292 Y124.301 E-.06224
G1 X134.21 Y124.431 E-.0921
G1 X134.059 Y124.462 E-.0918
G1 X133.921 Y124.396 E-.09196
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I-1.213 J.101 P1  F30000
G1 X134.577 Y132.265 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X135.337 Y132.149 I.498 J.718 E.02638
G3 X134.529 Y132.3 I-.258 J.851 E.157
G1 X134.36 Y131.949 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X135.431 Y131.768 I.729 J1.055 E.03446
G1 X135.542 Y131.795 E.00352
G3 X135.817 Y134.06 I-.474 J1.207 E.0857
G3 X134.311 Y131.984 I-.728 J-1.056 E.12191
M204 S10000
G1 X134.715 Y132.672 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X134.605 Y132.882 E.00727
G1 X134.605 Y133.118 E.00727
G1 X134.715 Y133.328 E.00727
G1 X134.91 Y133.462 E.00727
G1 X135.144 Y133.491 E.00727
G1 X135.366 Y133.407 E.00727
G1 X135.523 Y133.23 E.00727
G1 X135.579 Y133 E.00727
G1 X135.523 Y132.77 E.00727
G1 X135.366 Y132.593 E.00727
G1 X135.144 Y132.509 E.00727
G1 X134.91 Y132.538 E.00727
G1 X134.764 Y132.638 E.00543
G1 X135.121 Y132.937 F30000
; LINE_WIDTH: 0.625676
G1 F1200
G2 X135.128 Y133.052 I-.033 J.06 E.01376
; CHANGE_LAYER
; Z_HEIGHT: 6.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X135.048 Y133.063 E-.20374
G1 X135.012 Y133 E-.18542
G1 X135.048 Y132.937 E-.18542
G1 X135.121 Y132.937 E-.18542
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 32/55
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
G3 Z6.6 I.036 J-1.216 P1  F30000
G1 X125.959 Y132.667 Z6.6
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X126.079 Y132.697 E.00411
G3 X124.351 Y133.352 I-.494 J1.303 E.22341
G1 X124.542 Y133.076 E.01114
G3 X125.901 Y132.653 I1.044 J.959 E.04946
G1 X126.053 Y132.287 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X126.219 Y132.328 E.00527
G1 X126.601 Y132.528 E.01325
G1 X126.924 Y132.814 E.01325
G1 X127.169 Y133.169 E.01325
G1 X127.321 Y133.572 E.01325
G1 X127.373 Y134 E.01325
G1 X127.321 Y134.428 E.01325
G1 X127.169 Y134.831 E.01325
G1 X126.924 Y135.186 E.01325
G1 X126.601 Y135.472 E.01325
G1 X126.219 Y135.672 E.01325
G1 X125.8 Y135.775 E.01325
G1 X125.369 Y135.775 E.01325
G1 X124.951 Y135.672 E.01325
G1 X124.569 Y135.472 E.01325
G1 X124.246 Y135.186 E.01325
G1 X124.001 Y134.831 E.01325
G1 X123.848 Y134.428 E.01325
G1 X123.796 Y134 E.01325
G1 X123.848 Y133.572 E.01325
G1 X124.001 Y133.169 E.01325
G1 X124.148 Y132.957 E.00792
G1 X124.246 Y132.814 E.00533
G1 X124.569 Y132.528 E.01325
G1 X124.951 Y132.328 E.01325
G1 X125.369 Y132.225 E.01325
G1 X125.8 Y132.225 E.01325
G1 X125.994 Y132.272 E.00614
M204 S10000
G1 X126.152 Y133.178 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X125.822 Y133.038 E.01102
G1 X125.465 Y133.009 E.01102
G1 X125.124 Y133.122 E.01102
G1 X124.837 Y133.338 E.01102
G1 X124.658 Y133.648 E.01102
G1 X124.586 Y134 E.01102
G1 X124.658 Y134.352 E.01102
G1 X124.837 Y134.662 E.01102
G1 X125.124 Y134.878 E.01102
G1 X125.465 Y134.991 E.01102
G1 X125.822 Y134.962 E.01102
G1 X126.152 Y134.822 E.01102
G1 X126.401 Y134.563 E.01102
G1 X126.554 Y134.239 E.01102
G2 X126.554 Y133.761 I-1.469 J-.239 E.01475
G1 X126.401 Y133.437 E.01102
G1 X126.194 Y133.221 E.00918
G1 X126.048 Y133.59 F30000
G1 F1200
G1 X125.804 Y133.422 E.0091
G1 X125.51 Y133.386 E.0091
G1 X125.233 Y133.491 E.0091
G1 X125.037 Y133.712 E.0091
G1 X124.966 Y134 E.0091
G1 X125.037 Y134.288 E.0091
G1 X125.233 Y134.509 E.0091
G1 X125.51 Y134.614 E.0091
G1 X125.804 Y134.578 E.0091
G1 X126.048 Y134.41 E.0091
G1 X126.186 Y134.148 E.0091
G2 X126.186 Y133.852 I-.91 J-.148 E.00914
G1 X126.076 Y133.643 E.00726
G1 X125.745 Y133.858 F30000
; LINE_WIDTH: 0.468556
G1 F1200
G1 X125.585 Y133.787 E.00608
G1 X125.424 Y133.858 E.00608
G1 X125.374 Y134.026 E.00608
G1 X125.463 Y134.176 E.00608
G1 X125.636 Y134.207 E.00608
G1 X125.775 Y134.1 E.00608
G2 X125.763 Y133.915 I-.148 J-.083 E.00678
; WIPE_START
G1 F24000
G1 X125.796 Y134.026 E-.07044
G1 X125.775 Y134.1 E-.04705
G1 X125.636 Y134.207 E-.10708
G1 X125.463 Y134.176 E-.10708
G1 X125.374 Y134.026 E-.10709
G1 X125.424 Y133.858 E-.10708
G1 X125.585 Y133.787 E-.10709
G1 X125.745 Y133.858 E-.10709
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I1.217 J.008 P1  F30000
G1 X125.805 Y124.319 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X125.537 Y123.609 I-.226 J-.32 E.04741
G3 X125.699 Y123.626 I.047 J.336 E.00543
G3 X125.851 Y124.281 I-.119 J.373 E.02683
G1 X126.033 Y124.649 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X124.805 Y124.073 I-.446 J-.646 E.05027
G1 X124.805 Y124.073 E0
G3 X125.793 Y123.245 I.78 J-.073 E.0465
G3 X126.081 Y124.613 I-.206 J.758 E.05298
M204 S10000
; WIPE_START
G1 F24000
G1 X125.864 Y124.737 E-.09481
G1 X125.68 Y124.783 E-.07223
G1 X125.49 Y124.783 E-.07223
G1 X125.305 Y124.737 E-.07223
G1 X125.137 Y124.649 E-.07223
G1 X124.995 Y124.523 E-.07223
G1 X124.887 Y124.366 E-.07223
G1 X124.819 Y124.189 E-.07223
G1 X124.805 Y124.073 E-.04413
G1 X124.805 Y124.073 E0
G1 X124.796 Y124 E-.0281
G1 X124.819 Y123.811 E-.07223
G1 X124.833 Y123.774 E-.01513
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I-.144 J1.208 P1  F30000
G1 X133.858 Y124.85 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X133.857 Y123.648 I.221 J-.601 E.05172
G3 X134.263 Y123.636 I.223 J.652 E.0137
G3 X133.915 Y124.868 I-.185 J.613 E.06596
G1 X133.717 Y125.221 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X133.308 Y123.561 I.362 J-.969 E.06181
G3 X134.357 Y123.255 I.778 J.714 E.03531
G3 X133.773 Y125.24 I-.279 J.996 E.1007
M204 S10000
G1 X134.003 Y124.456 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.464902
G1 F1200
G1 X134.163 Y124.45 E.0055
G1 X134.281 Y124.353 E.00526
G1 X134.293 Y124.196 E.00541
G1 X134.214 Y124.071 E.00507
G1 X134.057 Y124.037 E.00551
G1 X133.919 Y124.103 E.00527
G1 X133.87 Y124.296 E.00683
G1 X133.965 Y124.41 E.0051
; WIPE_START
G1 F24000
G1 X133.87 Y124.296 E-.08817
G1 X133.919 Y124.103 E-.1181
G1 X134.057 Y124.037 E-.0911
G1 X134.214 Y124.071 E-.09527
G1 X134.293 Y124.196 E-.08775
G1 X134.281 Y124.353 E-.09353
G1 X134.163 Y124.45 E-.09099
G1 X134.003 Y124.456 E-.0951
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I-1.214 J.089 P1  F30000
G1 X134.577 Y132.265 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X135.328 Y132.146 I.497 J.716 E.02608
G3 X134.529 Y132.3 I-.25 J.854 E.15753
G1 X134.354 Y131.942 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X135.422 Y131.766 I.723 J1.057 E.03431
G1 X135.542 Y131.795 E.0038
G3 X133.811 Y133.123 I-.453 J1.201 E.16778
G1 X133.796 Y133 E.0038
G3 X134.306 Y131.977 I1.281 J-.001 E.03641
M204 S10000
G1 X134.715 Y132.672 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X134.605 Y132.882 E.00727
G1 X134.605 Y133.118 E.00727
G1 X134.715 Y133.328 E.00727
G1 X134.91 Y133.462 E.00727
G1 X135.144 Y133.491 E.00727
G1 X135.366 Y133.407 E.00727
G1 X135.523 Y133.23 E.00727
G1 X135.579 Y133 E.00727
G1 X135.523 Y132.77 E.00727
G1 X135.366 Y132.593 E.00727
G1 X135.144 Y132.509 E.00727
G1 X134.91 Y132.538 E.00727
G1 X134.764 Y132.638 E.00543
G1 X135.121 Y132.937 F30000
; LINE_WIDTH: 0.625676
M73 P82 R2
G1 F1200
G2 X135.128 Y133.052 I-.033 J.06 E.01376
; CHANGE_LAYER
; Z_HEIGHT: 6.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X135.048 Y133.063 E-.20374
G1 X135.012 Y133 E-.18542
G1 X135.048 Y132.937 E-.18542
G1 X135.121 Y132.937 E-.18542
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 33/55
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
G3 Z6.8 I.036 J-1.216 P1  F30000
G1 X125.947 Y132.664 Z6.8
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X126.079 Y132.697 E.00452
G3 X124.351 Y133.352 I-.496 J1.297 E.22246
G1 X124.542 Y133.076 E.01114
G3 X125.888 Y132.65 I1.043 J.958 E.04904
G1 X126.039 Y132.283 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X126.219 Y132.328 E.0057
G1 X126.601 Y132.528 E.01325
G1 X126.924 Y132.814 E.01325
G1 X127.169 Y133.169 E.01325
G1 X127.321 Y133.572 E.01325
G1 X127.373 Y134 E.01325
G1 X127.321 Y134.428 E.01325
G1 X127.169 Y134.831 E.01325
G1 X126.924 Y135.186 E.01325
G1 X126.601 Y135.472 E.01325
G1 X126.219 Y135.672 E.01325
G1 X125.8 Y135.775 E.01325
G1 X125.369 Y135.775 E.01325
G1 X124.951 Y135.672 E.01325
G1 X124.569 Y135.472 E.01325
G1 X124.246 Y135.186 E.01325
G1 X124.001 Y134.831 E.01325
G1 X123.848 Y134.428 E.01325
G1 X123.796 Y134 E.01325
G1 X123.848 Y133.572 E.01325
G1 X124.001 Y133.169 E.01325
G1 X124.141 Y132.967 E.00755
G1 X124.246 Y132.814 E.0057
G1 X124.569 Y132.528 E.01325
G1 X124.951 Y132.328 E.01325
G1 X125.369 Y132.225 E.01325
G1 X125.8 Y132.225 E.01325
G1 X125.981 Y132.269 E.00571
M204 S10000
G1 X126.152 Y133.178 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X125.822 Y133.038 E.01102
G1 X125.465 Y133.009 E.01102
G1 X125.124 Y133.122 E.01102
G1 X124.837 Y133.338 E.01102
G1 X124.658 Y133.648 E.01102
G1 X124.586 Y134 E.01102
G1 X124.658 Y134.352 E.01102
G1 X124.837 Y134.662 E.01102
G1 X125.124 Y134.878 E.01102
G1 X125.465 Y134.991 E.01102
G1 X125.822 Y134.962 E.01102
G1 X126.152 Y134.822 E.01102
G1 X126.401 Y134.563 E.01102
G1 X126.554 Y134.239 E.01102
G2 X126.554 Y133.761 I-1.469 J-.239 E.01475
G1 X126.401 Y133.437 E.01102
G1 X126.194 Y133.221 E.00918
G1 X126.048 Y133.59 F30000
G1 F1200
G1 X125.804 Y133.422 E.0091
G1 X125.51 Y133.386 E.0091
G1 X125.233 Y133.491 E.0091
G1 X125.037 Y133.712 E.0091
G1 X124.966 Y134 E.0091
G1 X125.037 Y134.288 E.0091
G1 X125.233 Y134.509 E.0091
G1 X125.51 Y134.614 E.0091
G1 X125.804 Y134.578 E.0091
G1 X126.048 Y134.41 E.0091
G1 X126.186 Y134.148 E.0091
G2 X126.186 Y133.852 I-.91 J-.148 E.00914
G1 X126.076 Y133.643 E.00726
G1 X125.745 Y133.858 F30000
; LINE_WIDTH: 0.468555
G1 F1200
G1 X125.585 Y133.787 E.00608
G1 X125.424 Y133.858 E.00608
G1 X125.374 Y134.026 E.00608
G1 X125.463 Y134.176 E.00608
G1 X125.636 Y134.207 E.00608
G1 X125.775 Y134.1 E.00608
G2 X125.763 Y133.915 I-.148 J-.083 E.00678
; WIPE_START
G1 F24000
G1 X125.796 Y134.026 E-.07044
G1 X125.775 Y134.1 E-.04705
G1 X125.636 Y134.207 E-.10708
G1 X125.463 Y134.176 E-.10708
G1 X125.374 Y134.026 E-.10709
G1 X125.424 Y133.858 E-.10709
G1 X125.585 Y133.787 E-.10708
G1 X125.745 Y133.858 E-.10709
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7 I1.217 J.008 P1  F30000
G1 X125.805 Y124.319 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X125.537 Y123.609 I-.226 J-.32 E.04746
G3 X125.693 Y123.624 I.047 J.323 E.00523
G3 X125.851 Y124.281 I-.115 J.375 E.02698
G1 X126.028 Y124.642 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X125.137 Y123.351 I-.45 J-.643 E.07607
G3 X125.787 Y123.244 I.438 J.63 E.02092
G3 X126.076 Y124.606 I-.209 J.756 E.05266
M204 S10000
; WIPE_START
G1 F24000
G1 X125.865 Y124.737 E-.09459
G1 X125.68 Y124.783 E-.07223
G1 X125.49 Y124.783 E-.07223
G1 X125.305 Y124.737 E-.07223
G1 X125.137 Y124.649 E-.07223
G1 X124.995 Y124.523 E-.07223
G1 X124.887 Y124.366 E-.07223
G1 X124.819 Y124.189 E-.07223
G1 X124.796 Y124 E-.07223
G1 X124.819 Y123.811 E-.07223
G1 X124.834 Y123.774 E-.01535
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7 I-.144 J1.208 P1  F30000
G1 X133.857 Y124.85 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X133.857 Y123.648 I.22 J-.601 E.05174
G3 X134.256 Y123.634 I.223 J.649 E.01345
G3 X133.915 Y124.868 I-.178 J.615 E.06617
G1 X133.717 Y125.221 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X133.308 Y123.561 I.361 J-.969 E.06181
G3 X134.35 Y123.254 I.777 J.714 E.03508
G3 X133.773 Y125.24 I-.272 J.998 E.10091
M204 S10000
G1 X133.921 Y124.396 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.468048
G1 F1200
G1 X134.059 Y124.462 E.00532
G1 X134.21 Y124.431 E.00531
G1 X134.292 Y124.301 E.00533
G1 X134.279 Y124.148 E.00532
G1 X134.11 Y124.032 E.00709
G1 X133.921 Y124.104 E.00703
G1 X133.872 Y124.25 E.00533
G1 X133.901 Y124.339 E.00323
; WIPE_START
G1 F24000
G1 X133.872 Y124.25 E-.05591
G1 X133.921 Y124.104 E-.09205
G1 X134.11 Y124.032 E-.12144
G1 X134.279 Y124.148 E-.12255
G1 X134.292 Y124.301 E-.09194
G1 X134.21 Y124.431 E-.09221
G1 X134.059 Y124.462 E-.09186
G1 X133.921 Y124.396 E-.09203
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7 I-1.213 J.101 P1  F30000
G1 X134.577 Y132.265 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X135.319 Y132.144 I.497 J.715 E.02578
G3 X134.529 Y132.3 I-.241 J.857 E.15794
G1 X134.358 Y131.947 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X135.413 Y131.764 I.727 J1.058 E.03394
G1 X135.542 Y131.795 E.00408
G3 X135.659 Y134.143 I-.462 J1.2 E.09112
G1 X135.542 Y134.205 E.00408
G3 X134.309 Y131.982 I-.456 J-1.2 E.11265
M204 S10000
G1 X134.715 Y132.672 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X134.605 Y132.882 E.00727
G1 X134.605 Y133.118 E.00727
G1 X134.715 Y133.328 E.00727
G1 X134.91 Y133.462 E.00727
G1 X135.144 Y133.491 E.00727
G1 X135.366 Y133.407 E.00727
G1 X135.523 Y133.23 E.00727
G1 X135.579 Y133 E.00727
G1 X135.523 Y132.77 E.00727
G1 X135.366 Y132.593 E.00727
G1 X135.144 Y132.509 E.00727
G1 X134.91 Y132.538 E.00727
G1 X134.764 Y132.638 E.00543
G1 X135.121 Y132.937 F30000
; LINE_WIDTH: 0.625676
G1 F1200
G2 X135.128 Y133.052 I-.033 J.06 E.01376
; CHANGE_LAYER
; Z_HEIGHT: 6.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X135.048 Y133.063 E-.20374
G1 X135.012 Y133 E-.18542
G1 X135.048 Y132.937 E-.18542
G1 X135.121 Y132.937 E-.18542
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 34/55
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
G3 Z7 I.036 J-1.216 P1  F30000
G1 X125.934 Y132.661 Z7
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X126.079 Y132.697 E.00494
G3 X125.753 Y132.617 I-.494 J1.303 E.27927
G1 X125.876 Y132.647 E.00421
G1 X126.027 Y132.28 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X126.219 Y132.328 E.00607
G1 X126.601 Y132.528 E.01325
G1 X126.924 Y132.814 E.01325
G1 X127.169 Y133.169 E.01325
G1 X127.321 Y133.572 E.01325
G1 X127.373 Y134 E.01325
G1 X127.321 Y134.428 E.01325
G1 X127.169 Y134.831 E.01325
G1 X126.924 Y135.186 E.01325
G1 X126.601 Y135.472 E.01325
G1 X126.219 Y135.672 E.01325
G1 X125.8 Y135.775 E.01325
G1 X125.369 Y135.775 E.01325
G1 X124.951 Y135.672 E.01325
G1 X124.569 Y135.472 E.01325
G1 X124.246 Y135.186 E.01325
G1 X124.001 Y134.831 E.01325
G1 X123.848 Y134.428 E.01325
G1 X123.796 Y134 E.01325
G1 X123.848 Y133.572 E.01325
G1 X124.001 Y133.169 E.01325
G1 X124.246 Y132.814 E.01325
G1 X124.569 Y132.528 E.01325
G1 X124.951 Y132.328 E.01325
G1 X125.369 Y132.225 E.01325
G1 X125.8 Y132.225 E.01325
G1 X125.969 Y132.266 E.00534
M204 S10000
G1 X126.152 Y133.178 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X125.822 Y133.038 E.01102
G1 X125.465 Y133.009 E.01102
G1 X125.124 Y133.122 E.01102
G1 X124.837 Y133.338 E.01102
G1 X124.658 Y133.648 E.01102
G1 X124.586 Y134 E.01102
G1 X124.658 Y134.352 E.01102
G1 X124.837 Y134.662 E.01102
G1 X125.124 Y134.878 E.01102
G1 X125.465 Y134.991 E.01102
G1 X125.822 Y134.962 E.01102
G1 X126.152 Y134.822 E.01102
G1 X126.401 Y134.563 E.01102
G1 X126.554 Y134.239 E.01102
G2 X126.554 Y133.761 I-1.469 J-.239 E.01475
G1 X126.401 Y133.437 E.01102
G1 X126.194 Y133.221 E.00918
G1 X126.048 Y133.59 F30000
G1 F1200
G1 X125.804 Y133.422 E.0091
G1 X125.51 Y133.386 E.0091
G1 X125.233 Y133.491 E.0091
G1 X125.037 Y133.712 E.0091
G1 X124.966 Y134 E.0091
G1 X125.037 Y134.288 E.0091
G1 X125.233 Y134.509 E.0091
G1 X125.51 Y134.614 E.0091
G1 X125.804 Y134.578 E.0091
G1 X126.048 Y134.41 E.0091
G1 X126.186 Y134.148 E.0091
G2 X126.186 Y133.852 I-.91 J-.148 E.00914
M73 P82 R1
G1 X126.076 Y133.643 E.00726
G1 X125.745 Y133.858 F30000
; LINE_WIDTH: 0.468555
G1 F1200
G1 X125.585 Y133.787 E.00608
G1 X125.424 Y133.858 E.00608
G1 X125.374 Y134.026 E.00608
G1 X125.463 Y134.176 E.00608
G1 X125.636 Y134.207 E.00608
G1 X125.775 Y134.1 E.00608
G2 X125.763 Y133.915 I-.148 J-.083 E.00678
; WIPE_START
G1 F24000
G1 X125.796 Y134.026 E-.07044
M73 P83 R1
G1 X125.775 Y134.1 E-.04705
G1 X125.636 Y134.207 E-.10708
G1 X125.463 Y134.176 E-.10709
G1 X125.374 Y134.026 E-.10709
G1 X125.424 Y133.858 E-.10708
G1 X125.585 Y133.787 E-.10708
G1 X125.745 Y133.858 E-.10709
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.2 I1.217 J.008 P1  F30000
G1 X125.805 Y124.319 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X125.537 Y123.609 I-.227 J-.319 E.04753
G3 X125.687 Y123.623 I.047 J.31 E.00503
G3 X125.851 Y124.28 I-.109 J.376 E.02714
G1 X126.029 Y124.644 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X125.137 Y123.351 I-.451 J-.643 E.07618
G3 X125.781 Y123.242 I.438 J.629 E.02073
G3 X126.077 Y124.607 I-.203 J.759 E.05289
M204 S10000
; WIPE_START
G1 F24000
G1 X125.864 Y124.737 E-.09462
G1 X125.68 Y124.783 E-.07223
G1 X125.49 Y124.783 E-.07223
G1 X125.305 Y124.737 E-.07223
G1 X125.137 Y124.649 E-.07223
G1 X124.995 Y124.523 E-.07223
G1 X124.887 Y124.366 E-.07223
G1 X124.819 Y124.189 E-.07223
G1 X124.796 Y124 E-.07223
G1 X124.819 Y123.811 E-.07223
G1 X124.834 Y123.774 E-.01532
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.2 I-.144 J1.208 P1  F30000
G1 X133.857 Y124.85 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X133.857 Y123.648 I.22 J-.601 E.05176
G3 X134.249 Y123.632 I.223 J.648 E.0132
G3 X133.915 Y124.868 I-.171 J.617 E.06638
G1 X133.717 Y125.221 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X133.308 Y123.561 I.361 J-.969 E.06181
G3 X134.343 Y123.252 I.777 J.714 E.03485
G3 X133.773 Y125.24 I-.265 J1 E.10113
M204 S10000
G1 X134.001 Y124.457 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.463877
G1 F1200
G1 X134.163 Y124.45 E.00557
G1 X134.281 Y124.353 E.00525
G1 X134.293 Y124.195 E.00543
G1 X134.215 Y124.071 E.00502
G1 X134.057 Y124.037 E.00555
G1 X133.919 Y124.103 E.00526
G1 X133.87 Y124.294 E.00677
G1 X133.963 Y124.41 E.00511
; WIPE_START
G1 F24000
G1 X133.87 Y124.294 E-.08838
G1 X133.919 Y124.103 E-.1171
G1 X134.057 Y124.037 E-.09087
G1 X134.215 Y124.071 E-.09598
G1 X134.293 Y124.195 E-.08685
G1 X134.281 Y124.353 E-.09385
G1 X134.163 Y124.45 E-.09069
G1 X134.001 Y124.457 E-.09628
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.2 I-1.214 J.09 P1  F30000
G1 X134.577 Y132.265 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X135.31 Y132.142 I.496 J.714 E.02547
G3 X134.529 Y132.3 I-.233 J.859 E.15807
G1 X134.356 Y131.944 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X135.404 Y131.761 I.729 J1.087 E.03367
G1 X135.542 Y131.795 E.00436
G3 X133.944 Y132.401 I-.459 J1.2 E.19053
G1 X134.12 Y132.146 E.00954
G3 X134.307 Y131.978 I.964 J.886 E.00771
M204 S10000
G1 X134.715 Y132.672 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X134.605 Y132.882 E.00727
G1 X134.605 Y133.118 E.00727
G1 X134.715 Y133.328 E.00727
G1 X134.91 Y133.462 E.00727
G1 X135.144 Y133.491 E.00727
G1 X135.366 Y133.407 E.00727
G1 X135.523 Y133.23 E.00727
G1 X135.579 Y133 E.00727
G1 X135.523 Y132.77 E.00727
G1 X135.366 Y132.593 E.00727
G1 X135.144 Y132.509 E.00727
G1 X134.91 Y132.538 E.00727
G1 X134.764 Y132.638 E.00543
G1 X135.121 Y132.937 F30000
; LINE_WIDTH: 0.625676
G1 F1200
G2 X135.128 Y133.052 I-.033 J.06 E.01376
; CHANGE_LAYER
; Z_HEIGHT: 7
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X135.048 Y133.063 E-.20374
G1 X135.012 Y133 E-.18542
G1 X135.048 Y132.937 E-.18542
G1 X135.121 Y132.937 E-.18542
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 35/55
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
G3 Z7.2 I.037 J-1.216 P1  F30000
G1 X125.922 Y132.658 Z7.2
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X126.079 Y132.697 E.00536
G3 X125.753 Y132.617 I-.494 J1.303 E.27926
G1 X125.864 Y132.644 E.00379
G1 X126.016 Y132.278 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X126.219 Y132.328 E.00644
G1 X126.601 Y132.528 E.01325
G1 X126.924 Y132.814 E.01325
G1 X127.169 Y133.169 E.01325
G1 X127.321 Y133.572 E.01325
G1 X127.373 Y134 E.01325
G1 X127.321 Y134.428 E.01325
G1 X127.169 Y134.831 E.01325
G1 X126.924 Y135.186 E.01325
G1 X126.601 Y135.472 E.01325
G1 X126.219 Y135.672 E.01325
G1 X125.8 Y135.775 E.01325
G1 X125.369 Y135.775 E.01325
G1 X124.951 Y135.672 E.01325
G1 X124.569 Y135.472 E.01325
G1 X124.246 Y135.186 E.01325
G1 X124.001 Y134.831 E.01325
G1 X123.848 Y134.428 E.01325
G1 X123.796 Y134 E.01325
G1 X123.848 Y133.572 E.01325
G1 X124.001 Y133.169 E.01325
G1 X124.246 Y132.814 E.01325
G1 X124.569 Y132.528 E.01325
G1 X124.951 Y132.328 E.01325
G1 X125.369 Y132.225 E.01325
G1 X125.8 Y132.225 E.01325
G1 X125.957 Y132.263 E.00497
M204 S10000
G1 X126.152 Y133.178 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X125.822 Y133.038 E.01102
G1 X125.465 Y133.009 E.01102
G1 X125.124 Y133.122 E.01102
G1 X124.837 Y133.338 E.01102
G1 X124.658 Y133.648 E.01102
G1 X124.586 Y134 E.01102
G1 X124.658 Y134.352 E.01102
G1 X124.837 Y134.662 E.01102
G1 X125.124 Y134.878 E.01102
G1 X125.465 Y134.991 E.01102
G1 X125.822 Y134.962 E.01102
G1 X126.152 Y134.822 E.01102
G1 X126.401 Y134.563 E.01102
G1 X126.554 Y134.239 E.01102
G2 X126.554 Y133.761 I-1.469 J-.239 E.01475
G1 X126.401 Y133.437 E.01102
G1 X126.194 Y133.221 E.00918
G1 X126.048 Y133.59 F30000
G1 F1200
G1 X125.804 Y133.422 E.0091
G1 X125.51 Y133.386 E.0091
G1 X125.233 Y133.491 E.0091
G1 X125.037 Y133.712 E.0091
G1 X124.966 Y134 E.0091
G1 X125.037 Y134.288 E.0091
G1 X125.233 Y134.509 E.0091
G1 X125.51 Y134.614 E.0091
G1 X125.804 Y134.578 E.0091
G1 X126.048 Y134.41 E.0091
G1 X126.186 Y134.148 E.0091
G2 X126.186 Y133.852 I-.91 J-.148 E.00914
G1 X126.076 Y133.643 E.00726
G1 X125.745 Y133.858 F30000
; LINE_WIDTH: 0.46856
G1 F1200
G1 X125.585 Y133.787 E.00608
G1 X125.424 Y133.858 E.00608
G1 X125.374 Y134.026 E.00608
G1 X125.463 Y134.176 E.00608
G1 X125.636 Y134.207 E.00608
G1 X125.775 Y134.1 E.00608
G2 X125.763 Y133.915 I-.148 J-.083 E.00678
; WIPE_START
G1 F24000
G1 X125.796 Y134.026 E-.07044
G1 X125.775 Y134.1 E-.04705
G1 X125.636 Y134.207 E-.10708
G1 X125.463 Y134.176 E-.10709
G1 X125.374 Y134.026 E-.10709
G1 X125.424 Y133.858 E-.10708
G1 X125.585 Y133.787 E-.10708
G1 X125.745 Y133.858 E-.10709
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I1.217 J.008 P1  F30000
G1 X125.804 Y124.318 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X125.537 Y123.609 I-.227 J-.319 E.04754
G3 X125.681 Y123.621 I.047 J.298 E.00484
G3 X125.85 Y124.28 I-.104 J.378 E.0273
G1 X126.029 Y124.644 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X125.137 Y123.351 I-.451 J-.643 E.07618
G3 X125.775 Y123.241 I.437 J.629 E.02055
G3 X126.077 Y124.607 I-.197 J.76 E.05307
M204 S10000
; WIPE_START
G1 F24000
G1 X125.864 Y124.737 E-.09462
G1 X125.68 Y124.783 E-.07223
G1 X125.49 Y124.783 E-.07223
G1 X125.305 Y124.737 E-.07223
G1 X125.137 Y124.649 E-.07223
G1 X124.995 Y124.523 E-.07223
G1 X124.887 Y124.366 E-.07223
G1 X124.819 Y124.189 E-.07223
G1 X124.796 Y124 E-.07223
G1 X124.819 Y123.811 E-.07223
G1 X124.834 Y123.774 E-.01532
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I-.144 J1.208 P1  F30000
G1 X133.857 Y124.85 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X133.857 Y123.648 I.22 J-.601 E.05178
G3 X134.241 Y123.631 I.223 J.648 E.01295
G3 X133.915 Y124.868 I-.164 J.618 E.06661
G1 X133.717 Y125.221 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X133.308 Y123.561 I.361 J-.969 E.06181
G3 X134.335 Y123.25 I.777 J.714 E.03462
G3 X133.773 Y125.24 I-.257 J1.002 E.10135
M204 S10000
G1 X133.964 Y124.425 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.468641
G1 F1200
G1 X134.111 Y124.468 E.00532
G1 X134.244 Y124.391 E.00532
G1 X134.292 Y124.301 E.00353
G1 X134.279 Y124.148 E.00532
G1 X134.16 Y124.051 E.00532
G1 X134.007 Y124.045 E.00532
G1 X133.896 Y124.151 E.00532
G1 X133.872 Y124.302 E.00532
G1 X133.928 Y124.377 E.00324
; WIPE_START
G1 F24000
G1 X133.872 Y124.302 E-.05592
G1 X133.896 Y124.151 E-.09186
G1 X134.007 Y124.045 E-.09187
G1 X134.16 Y124.051 E-.09186
G1 X134.279 Y124.148 E-.09186
G1 X134.292 Y124.301 E-.09186
G1 X134.244 Y124.391 E-.06104
G1 X134.111 Y124.468 E-.09186
G1 X133.964 Y124.425 E-.09187
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I-1.213 J.095 P1  F30000
G1 X134.577 Y132.265 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X135.302 Y132.14 I.496 J.713 E.02517
G3 X134.529 Y132.3 I-.224 J.861 E.15835
G1 X134.358 Y131.948 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X135.395 Y131.759 I.728 J1.057 E.03337
G1 X135.542 Y131.795 E.00463
G3 X135.817 Y134.06 I-.474 J1.207 E.0857
G3 X134.31 Y131.983 I-.731 J-1.055 E.12218
M204 S10000
G1 X134.715 Y132.672 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X134.605 Y132.882 E.00727
G1 X134.605 Y133.118 E.00727
G1 X134.715 Y133.328 E.00727
G1 X134.91 Y133.462 E.00727
G1 X135.144 Y133.491 E.00727
G1 X135.366 Y133.407 E.00727
G1 X135.523 Y133.23 E.00727
G1 X135.579 Y133 E.00727
G1 X135.523 Y132.77 E.00727
G1 X135.366 Y132.593 E.00727
G1 X135.144 Y132.509 E.00727
G1 X134.91 Y132.538 E.00727
G1 X134.764 Y132.638 E.00543
G1 X135.121 Y132.937 F30000
; LINE_WIDTH: 0.625678
G1 F1200
G2 X135.128 Y133.052 I-.033 J.06 E.01376
; CHANGE_LAYER
; Z_HEIGHT: 7.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X135.048 Y133.063 E-.20374
G1 X135.012 Y133 E-.18542
G1 X135.048 Y132.937 E-.18542
G1 X135.121 Y132.937 E-.18542
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 36/55
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
G3 Z7.4 I.037 J-1.216 P1  F30000
G1 X125.91 Y132.655 Z7.4
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X125.91 Y132.655 E.00001
G1 X126.079 Y132.697 E.00577
G3 X126.377 Y135.147 I-.513 J1.305 E.10006
G3 X125.752 Y132.627 I-.79 J-1.141 E.17807
G1 X125.851 Y132.645 E.00334
G1 X126.004 Y132.275 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X126.219 Y132.328 E.00681
G1 X126.601 Y132.528 E.01325
G1 X126.924 Y132.814 E.01325
G1 X127.169 Y133.169 E.01325
G1 X127.321 Y133.572 E.01325
G1 X127.373 Y134 E.01325
G1 X127.321 Y134.428 E.01325
G1 X127.169 Y134.831 E.01325
G1 X126.924 Y135.186 E.01325
G1 X126.601 Y135.472 E.01325
M73 P84 R1
G1 X126.219 Y135.672 E.01325
G1 X125.8 Y135.775 E.01325
G1 X125.369 Y135.775 E.01325
G1 X124.951 Y135.672 E.01325
G1 X124.569 Y135.472 E.01325
G1 X124.246 Y135.186 E.01325
G1 X124.127 Y135.014 E.00644
G1 X124.001 Y134.831 E.00681
G1 X123.848 Y134.428 E.01325
G1 X123.796 Y134 E.01325
G1 X123.848 Y133.572 E.01325
G1 X124.001 Y133.169 E.01325
G1 X124.12 Y132.996 E.00644
G1 X124.246 Y132.814 E.00681
G1 X124.569 Y132.528 E.01325
G1 X124.951 Y132.328 E.01325
G1 X125.369 Y132.225 E.01325
G1 X125.8 Y132.225 E.01325
G1 X125.946 Y132.26 E.0046
M204 S10000
G1 X126.152 Y133.178 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X125.817 Y133.036 E.01117
G1 X125.465 Y133.009 E.01088
G1 X125.143 Y133.112 E.01038
G2 X124.614 Y133.768 I.606 J1.029 E.02646
G1 X124.598 Y134.098 E.01015
G2 X125.024 Y134.825 I1.193 J-.211 E.02644
G1 X125.356 Y134.964 E.01104
G1 X125.705 Y134.991 E.01077
G1 X126.047 Y134.877 E.01109
G1 X126.332 Y134.662 E.01096
G1 X126.512 Y134.35 E.01106
G1 X126.569 Y134.118 E.00734
G1 X126.554 Y133.761 E.01099
G1 X126.4 Y133.435 E.01108
G1 X126.194 Y133.221 E.00913
G1 X126.048 Y133.59 F30000
G1 F1200
G1 X125.804 Y133.422 E.0091
G1 X125.51 Y133.386 E.0091
G1 X125.255 Y133.48 E.00837
G1 X125.042 Y133.746 E.01048
G1 X124.966 Y134 E.00813
G1 X125.046 Y134.26 E.00836
G1 X125.253 Y134.52 E.01021
G1 X125.51 Y134.614 E.00841
G1 X125.804 Y134.578 E.0091
G1 X126.048 Y134.41 E.0091
G1 X126.186 Y134.148 E.0091
G2 X126.186 Y133.852 I-.905 J-.148 E.00914
G1 X126.076 Y133.643 E.00726
G1 X125.749 Y133.855 F30000
; LINE_WIDTH: 0.459656
G1 F1200
G1 X125.59 Y133.783 E.00593
G1 X125.471 Y133.828 E.00431
G1 X125.367 Y134.005 E.00699
G1 X125.502 Y134.202 E.0081
G1 X125.663 Y134.205 E.00546
G1 X125.788 Y134.078 E.00604
G2 X125.766 Y133.912 I-.15 J-.065 E.00597
; WIPE_START
G1 F24000
G1 X125.801 Y134.025 E-.07132
G1 X125.788 Y134.078 E-.03315
G1 X125.663 Y134.205 E-.10744
G1 X125.502 Y134.202 E-.09716
G1 X125.367 Y134.005 E-.14421
G1 X125.471 Y133.828 E-.12444
G1 X125.59 Y133.783 E-.07676
G1 X125.749 Y133.855 E-.10552
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.6 I1.217 J.007 P1  F30000
G1 X125.804 Y124.318 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X125.537 Y123.609 I-.227 J-.319 E.04755
G3 X125.675 Y123.62 I.047 J.285 E.00464
G3 X125.85 Y124.28 I-.099 J.379 E.02748
G1 X126.029 Y124.644 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X125.137 Y123.351 I-.451 J-.643 E.07618
G3 X125.769 Y123.239 I.437 J.628 E.02036
G3 X126.077 Y124.607 I-.191 J.762 E.05325
M204 S10000
; WIPE_START
G1 F24000
G1 X125.865 Y124.737 E-.09461
G1 X125.68 Y124.783 E-.07223
G1 X125.49 Y124.783 E-.07223
G1 X125.305 Y124.737 E-.07223
G1 X125.137 Y124.649 E-.07223
G1 X124.995 Y124.523 E-.07223
G1 X124.887 Y124.366 E-.07223
G1 X124.819 Y124.189 E-.07223
G1 X124.796 Y124 E-.07223
G1 X124.819 Y123.811 E-.07223
G1 X124.834 Y123.774 E-.01532
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.6 I-.144 J1.208 P1  F30000
G1 X133.857 Y124.85 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X133.857 Y123.648 I.22 J-.601 E.05178
G3 X134.234 Y123.629 I.223 J.649 E.0127
G3 X133.915 Y124.868 I-.157 J.62 E.06685
G1 X133.717 Y125.221 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X133.308 Y123.561 I.361 J-.969 E.06181
G3 X134.328 Y123.248 I.777 J.714 E.03438
G3 X133.773 Y125.24 I-.25 J1.004 E.10157
M204 S10000
G1 X133.964 Y124.425 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.468639
G1 F1200
G1 X134.111 Y124.468 E.00532
G1 X134.244 Y124.391 E.00532
G1 X134.292 Y124.301 E.00353
G1 X134.279 Y124.148 E.00532
G1 X134.16 Y124.051 E.00532
G1 X134.007 Y124.045 E.00532
G1 X133.896 Y124.151 E.00532
G1 X133.872 Y124.302 E.00532
G1 X133.928 Y124.377 E.00324
; WIPE_START
G1 F24000
G1 X133.872 Y124.302 E-.05592
G1 X133.896 Y124.151 E-.09185
G1 X134.007 Y124.045 E-.09187
G1 X134.16 Y124.051 E-.09186
G1 X134.279 Y124.148 E-.09187
G1 X134.292 Y124.301 E-.09186
G1 X134.244 Y124.391 E-.06103
G1 X134.111 Y124.468 E-.09187
G1 X133.964 Y124.425 E-.09187
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.6 I-1.213 J.095 P1  F30000
G1 X134.577 Y132.265 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X135.293 Y132.138 I.495 J.712 E.02487
G3 X134.529 Y132.3 I-.216 J.863 E.15864
G1 X134.354 Y131.941 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X135.24 Y131.721 I.732 J1.055 E.02869
G1 X135.387 Y131.757 E.00463
G1 X135.542 Y131.795 E.00491
G3 X134.305 Y131.976 I-.456 J1.2 E.20776
M204 S10000
G1 X134.715 Y132.672 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X134.605 Y132.882 E.00727
G1 X134.605 Y133.118 E.00727
G1 X134.715 Y133.328 E.00727
G1 X134.91 Y133.462 E.00727
G1 X135.144 Y133.491 E.00727
G1 X135.366 Y133.407 E.00727
G1 X135.523 Y133.23 E.00727
G1 X135.579 Y133 E.00727
G1 X135.523 Y132.77 E.00727
G1 X135.366 Y132.593 E.00727
G1 X135.144 Y132.509 E.00727
G1 X134.91 Y132.538 E.00727
G1 X134.764 Y132.638 E.00543
G1 X135.121 Y132.937 F30000
; LINE_WIDTH: 0.625672
G1 F1200
G2 X135.128 Y133.052 I-.033 J.06 E.01376
; CHANGE_LAYER
; Z_HEIGHT: 7.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X135.048 Y133.063 E-.20374
G1 X135.012 Y133 E-.18542
G1 X135.048 Y132.937 E-.18542
G1 X135.121 Y132.937 E-.18542
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 37/55
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
G3 Z7.6 I.038 J-1.216 P1  F30000
G1 X125.898 Y132.652 Z7.6
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X125.898 Y132.653 E.00003
G1 X126.079 Y132.697 E.00617
G3 X124.351 Y133.352 I-.494 J1.303 E.22342
G1 X124.542 Y133.076 E.01114
G3 X125.752 Y132.627 I1.044 J.959 E.04444
G1 X125.838 Y132.642 E.00292
G1 X125.992 Y132.272 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X126.219 Y132.328 E.00718
G1 X126.601 Y132.528 E.01325
G1 X126.924 Y132.814 E.01325
G1 X127.169 Y133.169 E.01325
G1 X127.321 Y133.572 E.01325
G1 X127.373 Y134 E.01325
G1 X127.321 Y134.428 E.01325
G1 X127.169 Y134.831 E.01325
G1 X126.924 Y135.186 E.01325
G1 X126.601 Y135.472 E.01325
G1 X126.219 Y135.672 E.01325
G1 X125.8 Y135.775 E.01325
G1 X125.369 Y135.775 E.01325
G1 X124.951 Y135.672 E.01325
G1 X124.569 Y135.472 E.01325
G1 X124.246 Y135.186 E.01325
G1 X124.001 Y134.831 E.01325
G1 X123.848 Y134.428 E.01325
G1 X123.796 Y134 E.01325
G1 X123.848 Y133.572 E.01325
G1 X124.001 Y133.169 E.01325
G1 X124.113 Y133.006 E.00607
G1 X124.246 Y132.814 E.00718
G1 X124.569 Y132.528 E.01325
G1 X124.951 Y132.328 E.01325
G1 X125.369 Y132.225 E.01325
G1 X125.8 Y132.225 E.01325
G1 X125.934 Y132.257 E.00422
M204 S10000
G1 X126.152 Y133.178 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X125.817 Y133.036 E.01118
G1 X125.465 Y133.009 E.01087
G1 X125.144 Y133.112 E.01035
G2 X124.615 Y133.768 I.622 J1.043 E.02645
G1 X124.602 Y134.127 E.01104
G1 X124.701 Y134.464 E.01079
G1 X124.929 Y134.743 E.01108
G1 X125.231 Y134.934 E.01096
G1 X125.586 Y134.991 E.01106
G1 X125.939 Y134.934 E.01099
G1 X126.243 Y134.741 E.01105
G1 X126.469 Y134.464 E.01099
G1 X126.569 Y134.118 E.01106
G1 X126.554 Y133.761 E.01099
G1 X126.4 Y133.435 E.01108
G1 X126.194 Y133.221 E.00912
G1 X126.048 Y133.59 F30000
G1 F1200
G1 X125.804 Y133.422 E.0091
G1 X125.51 Y133.386 E.0091
G1 X125.256 Y133.479 E.00833
G1 X125.032 Y133.766 E.01117
G1 X124.966 Y134 E.00748
G1 X125.037 Y134.288 E.0091
G1 X125.233 Y134.509 E.0091
G1 X125.51 Y134.614 E.0091
G1 X125.804 Y134.578 E.0091
G1 X126.048 Y134.41 E.0091
G1 X126.186 Y134.148 E.0091
G2 X126.186 Y133.852 I-.905 J-.148 E.00914
G1 X126.076 Y133.643 E.00726
G1 X125.749 Y133.855 F30000
; LINE_WIDTH: 0.460032
G1 F1200
G1 X125.59 Y133.783 E.00592
G1 X125.473 Y133.827 E.00425
G1 X125.367 Y134.007 E.0071
G1 X125.442 Y134.164 E.00591
G1 X125.611 Y134.217 E.00602
G1 X125.749 Y134.145 E.00527
G1 X125.801 Y134.025 E.00444
G1 X125.766 Y133.912 E.004
; WIPE_START
G1 F24000
G1 X125.801 Y134.025 E-.07089
G1 X125.749 Y134.145 E-.07871
G1 X125.611 Y134.217 E-.09334
G1 X125.442 Y134.164 E-.10654
G1 X125.367 Y134.007 E-.1046
G1 X125.473 Y133.827 E-.12576
G1 X125.59 Y133.783 E-.07531
G1 X125.749 Y133.855 E-.10484
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.8 I1.217 J.007 P1  F30000
G1 X125.804 Y124.318 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X125.537 Y123.609 I-.227 J-.319 E.04755
G3 X125.67 Y123.619 I.047 J.273 E.00444
G3 X125.85 Y124.279 I-.093 J.38 E.02766
G1 X126.029 Y124.644 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X125.137 Y123.351 I-.451 J-.643 E.07618
G3 X125.763 Y123.238 I.437 J.628 E.02017
G3 X126.077 Y124.607 I-.186 J.763 E.05343
M204 S10000
; WIPE_START
G1 F24000
G1 X125.864 Y124.737 E-.09462
G1 X125.68 Y124.783 E-.07223
G1 X125.49 Y124.783 E-.07223
G1 X125.305 Y124.737 E-.07223
G1 X125.137 Y124.649 E-.07223
G1 X124.995 Y124.523 E-.07223
G1 X124.887 Y124.366 E-.07223
G1 X124.819 Y124.189 E-.07223
G1 X124.796 Y124 E-.07223
G1 X124.819 Y123.811 E-.07223
G1 X124.834 Y123.774 E-.01532
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.8 I-.144 J1.208 P1  F30000
G1 X133.857 Y124.852 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X133.857 Y123.648 I.22 J-.602 E.05186
G3 X134.227 Y123.627 I.223 J.651 E.01245
M73 P85 R1
G3 X133.914 Y124.87 I-.15 J.623 E.06722
G1 X133.717 Y125.221 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X133.308 Y123.561 I.361 J-.969 E.06181
G3 X134.321 Y123.246 I.778 J.714 E.03415
G3 X133.773 Y125.24 I-.243 J1.005 E.1018
M204 S10000
G1 X133.89 Y124.352 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.467996
G1 F1200
G1 X134.009 Y124.449 E.00532
G1 X134.163 Y124.455 E.00531
G1 X134.274 Y124.349 E.00533
G1 X134.298 Y124.249 E.00354
G1 X134.249 Y124.104 E.0053
G1 X134.102 Y124.039 E.00558
G1 X133.961 Y124.069 E.00501
G1 X133.878 Y124.199 E.00535
G1 X133.886 Y124.292 E.00323
; WIPE_START
G1 F24000
G1 X133.878 Y124.199 E-.05584
G1 X133.961 Y124.069 E-.09237
G1 X134.102 Y124.039 E-.0866
G1 X134.249 Y124.104 E-.09648
G1 X134.298 Y124.249 E-.09163
G1 X134.274 Y124.349 E-.0612
G1 X134.163 Y124.455 E-.09207
G1 X134.009 Y124.449 E-.09182
G1 X133.89 Y124.352 E-.092
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.8 I-1.212 J.105 P1  F30000
G1 X134.577 Y132.265 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X135.284 Y132.136 I.495 J.712 E.02457
G3 X134.529 Y132.3 I-.207 J.865 E.15894
G1 X134.36 Y131.949 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X135.378 Y131.755 I.729 J1.055 E.03279
G1 X135.542 Y131.795 E.00519
G3 X135.817 Y134.06 I-.474 J1.207 E.0857
G3 X134.311 Y131.985 I-.728 J-1.056 E.12191
M204 S10000
G1 X134.715 Y132.672 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X134.605 Y132.882 E.00727
G1 X134.605 Y133.118 E.00727
G1 X134.715 Y133.328 E.00727
G1 X134.91 Y133.462 E.00727
G1 X135.144 Y133.491 E.00727
G1 X135.366 Y133.407 E.00727
G1 X135.523 Y133.23 E.00727
G1 X135.579 Y133 E.00727
G1 X135.523 Y132.77 E.00727
G1 X135.366 Y132.593 E.00727
G1 X135.144 Y132.509 E.00727
G1 X134.91 Y132.538 E.00727
G1 X134.764 Y132.638 E.00543
G1 X135.121 Y132.937 F30000
; LINE_WIDTH: 0.625672
G1 F1200
G2 X135.128 Y133.052 I-.033 J.06 E.01376
; CHANGE_LAYER
; Z_HEIGHT: 7.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X135.048 Y133.063 E-.20374
G1 X135.012 Y133 E-.18542
G1 X135.048 Y132.937 E-.18542
G1 X135.121 Y132.937 E-.18542
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 38/55
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
G3 Z7.8 I.038 J-1.216 P1  F30000
G1 X125.885 Y132.649 Z7.8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X125.887 Y132.65 E.00005
G1 X126.079 Y132.697 E.00657
G3 X125.753 Y132.617 I-.493 J1.298 E.27821
G1 X125.827 Y132.635 E.00253
G1 X125.981 Y132.269 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X126.219 Y132.328 E.00755
G1 X126.601 Y132.528 E.01325
G1 X126.924 Y132.814 E.01325
G1 X127.169 Y133.169 E.01325
G1 X127.321 Y133.572 E.01325
G1 X127.373 Y134 E.01325
G1 X127.321 Y134.428 E.01325
G1 X127.169 Y134.831 E.01325
G1 X126.924 Y135.186 E.01325
G1 X126.601 Y135.472 E.01325
G1 X126.219 Y135.672 E.01325
G1 X125.8 Y135.775 E.01325
G1 X125.369 Y135.775 E.01325
G1 X124.951 Y135.672 E.01325
G1 X124.569 Y135.472 E.01325
G1 X124.246 Y135.186 E.01325
G1 X124.001 Y134.831 E.01325
G1 X123.848 Y134.428 E.01325
G1 X123.796 Y134 E.01325
G1 X123.848 Y133.572 E.01325
G1 X124.001 Y133.169 E.01325
G1 X124.246 Y132.814 E.01325
G1 X124.569 Y132.528 E.01325
G1 X124.951 Y132.328 E.01325
G1 X125.369 Y132.225 E.01325
G1 X125.8 Y132.225 E.01325
G1 X125.922 Y132.255 E.00385
M204 S10000
G1 X126.152 Y133.178 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X125.822 Y133.038 E.01102
G1 X125.465 Y133.009 E.01102
G1 X125.124 Y133.122 E.01102
G1 X124.837 Y133.338 E.01102
G1 X124.658 Y133.648 E.01102
G1 X124.586 Y134 E.01102
G1 X124.658 Y134.352 E.01102
G1 X124.837 Y134.662 E.01102
G1 X125.124 Y134.878 E.01102
G1 X125.465 Y134.991 E.01102
G1 X125.822 Y134.962 E.01102
G1 X126.152 Y134.822 E.01102
G1 X126.401 Y134.563 E.01102
G1 X126.554 Y134.239 E.01102
G2 X126.554 Y133.761 I-1.469 J-.239 E.01475
G1 X126.401 Y133.437 E.01102
G1 X126.194 Y133.221 E.00918
G1 X126.048 Y133.59 F30000
G1 F1200
G1 X125.804 Y133.422 E.0091
G1 X125.51 Y133.386 E.0091
G1 X125.233 Y133.491 E.0091
G1 X125.037 Y133.712 E.0091
G1 X124.966 Y134 E.0091
G1 X125.037 Y134.288 E.0091
G1 X125.233 Y134.509 E.0091
G1 X125.51 Y134.614 E.0091
G1 X125.804 Y134.578 E.0091
G1 X126.048 Y134.41 E.0091
G1 X126.186 Y134.148 E.0091
G2 X126.186 Y133.852 I-.91 J-.148 E.00914
G1 X126.076 Y133.643 E.00726
G1 X125.745 Y133.858 F30000
; LINE_WIDTH: 0.468558
G1 F1200
G1 X125.585 Y133.787 E.00608
G1 X125.424 Y133.858 E.00608
G1 X125.374 Y134.026 E.00608
G1 X125.463 Y134.176 E.00608
G1 X125.636 Y134.207 E.00608
G1 X125.775 Y134.1 E.00608
G2 X125.763 Y133.915 I-.148 J-.083 E.00678
; WIPE_START
G1 F24000
G1 X125.796 Y134.026 E-.07044
G1 X125.775 Y134.1 E-.04705
G1 X125.636 Y134.207 E-.10708
G1 X125.463 Y134.176 E-.10709
G1 X125.374 Y134.026 E-.10709
G1 X125.424 Y133.858 E-.10709
G1 X125.585 Y133.787 E-.10708
G1 X125.745 Y133.858 E-.10709
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8 I1.217 J.008 P1  F30000
G1 X125.804 Y124.318 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X125.537 Y123.609 I-.227 J-.319 E.04755
G3 X125.664 Y123.617 I.047 J.26 E.00424
G3 X125.85 Y124.28 I-.087 J.382 E.02788
G1 X126.029 Y124.644 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X125.137 Y123.351 I-.451 J-.643 E.07618
G3 X125.758 Y123.236 I.437 J.628 E.01999
G3 X126.077 Y124.607 I-.18 J.764 E.05362
M204 S10000
; WIPE_START
G1 F24000
G1 X125.865 Y124.737 E-.09462
G1 X125.68 Y124.783 E-.07223
G1 X125.49 Y124.783 E-.07223
G1 X125.305 Y124.737 E-.07223
G1 X125.137 Y124.649 E-.07223
G1 X124.995 Y124.523 E-.07223
G1 X124.887 Y124.366 E-.07223
G1 X124.819 Y124.189 E-.07223
G1 X124.796 Y124 E-.07223
G1 X124.819 Y123.811 E-.07223
G1 X124.834 Y123.774 E-.01532
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8 I-.144 J1.208 P1  F30000
G1 X133.857 Y124.85 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X133.857 Y123.648 I.22 J-.601 E.05178
G3 X134.219 Y123.625 I.224 J.656 E.0122
G3 X133.915 Y124.868 I-.142 J.624 E.06736
G1 X133.717 Y125.221 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X133.308 Y123.561 I.361 J-.969 E.06181
G3 X134.313 Y123.245 I.778 J.715 E.03392
G3 X133.773 Y125.24 I-.235 J1.007 E.10204
M204 S10000
G1 X133.891 Y124.352 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.46805
G1 F1200
G1 X134.009 Y124.449 E.00532
G1 X134.163 Y124.455 E.00531
G1 X134.274 Y124.349 E.00533
G1 X134.298 Y124.25 E.00354
G1 X134.249 Y124.104 E.0053
G1 X134.103 Y124.039 E.00556
G1 X133.96 Y124.069 E.00504
G1 X133.878 Y124.199 E.00534
G1 X133.886 Y124.292 E.00323
; WIPE_START
G1 F24000
G1 X133.878 Y124.199 E-.05585
G1 X133.96 Y124.069 E-.09233
G1 X134.103 Y124.039 E-.08704
G1 X134.249 Y124.104 E-.0961
G1 X134.298 Y124.25 E-.09165
G1 X134.274 Y124.349 E-.06118
G1 X134.163 Y124.455 E-.09205
G1 X134.009 Y124.449 E-.09183
G1 X133.891 Y124.352 E-.09198
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8 I-1.212 J.105 P1  F30000
G1 X134.577 Y132.265 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X135.275 Y132.133 I.495 J.712 E.02427
G3 X134.529 Y132.3 I-.198 J.868 E.15926
G1 X134.358 Y131.947 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X135.369 Y131.753 I.73 J1.07 E.03254
G3 X133.834 Y132.692 I-.29 J1.25 E.18653
G3 X134.309 Y131.982 I1.253 J.325 E.02675
M204 S10000
G1 X134.715 Y132.672 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X134.605 Y132.882 E.00727
G1 X134.605 Y133.118 E.00727
G1 X134.715 Y133.328 E.00727
G1 X134.91 Y133.462 E.00727
G1 X135.144 Y133.491 E.00727
G1 X135.366 Y133.407 E.00727
G1 X135.523 Y133.23 E.00727
G1 X135.579 Y133 E.00727
G1 X135.523 Y132.77 E.00727
G1 X135.366 Y132.593 E.00727
G1 X135.144 Y132.509 E.00727
G1 X134.91 Y132.538 E.00727
G1 X134.764 Y132.638 E.00543
G1 X135.121 Y132.937 F30000
; LINE_WIDTH: 0.625672
G1 F1200
G2 X135.128 Y133.052 I-.033 J.06 E.01376
; CHANGE_LAYER
; Z_HEIGHT: 7.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X135.048 Y133.063 E-.20374
G1 X135.012 Y133 E-.18542
G1 X135.048 Y132.937 E-.18542
G1 X135.121 Y132.937 E-.18542
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 39/55
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
G3 Z8 I.038 J-1.216 P1  F30000
G1 X125.873 Y132.646 Z8
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X125.875 Y132.647 E.00007
G1 X126.079 Y132.697 E.00697
G3 X125.753 Y132.617 I-.493 J1.298 E.27821
G1 X125.815 Y132.632 E.00211
G1 X125.967 Y132.266 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X125.969 Y132.266 E.00006
G1 X126.219 Y132.328 E.00792
G1 X126.601 Y132.528 E.01325
G1 X126.924 Y132.814 E.01325
G1 X127.169 Y133.169 E.01325
G1 X127.321 Y133.572 E.01325
G1 X127.373 Y134 E.01325
G1 X127.321 Y134.428 E.01325
G1 X127.169 Y134.831 E.01325
G1 X126.924 Y135.186 E.01325
G1 X126.601 Y135.472 E.01325
G1 X126.219 Y135.672 E.01325
G1 X125.8 Y135.775 E.01325
G1 X125.369 Y135.775 E.01325
G1 X124.951 Y135.672 E.01325
G1 X124.569 Y135.472 E.01325
G1 X124.246 Y135.186 E.01325
G1 X124.001 Y134.831 E.01325
G1 X123.848 Y134.428 E.01325
G1 X123.796 Y134 E.01325
G1 X123.848 Y133.572 E.01325
G1 X124.001 Y133.169 E.01325
G1 X124.246 Y132.814 E.01325
G1 X124.569 Y132.528 E.01325
M73 P86 R1
G1 X124.951 Y132.328 E.01325
G1 X125.369 Y132.225 E.01325
G1 X125.8 Y132.225 E.01325
G1 X125.909 Y132.251 E.00342
M204 S10000
; WIPE_START
G1 F24000
G1 X125.969 Y132.266 E-.02357
G1 X126.219 Y132.328 E-.09795
G1 X126.601 Y132.528 E-.16384
G1 X126.924 Y132.814 E-.16384
G1 X127.169 Y133.169 E-.16384
G1 X127.306 Y133.53 E-.14697
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.2 I-.219 J-1.197 P1  F30000
G1 X125.707 Y133.824 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.468558
G1 F1200
G1 X125.534 Y133.793 E.00608
G1 X125.395 Y133.9 E.00608
G1 X125.386 Y134.075 E.00608
G1 X125.509 Y134.2 E.00608
G1 X125.684 Y134.188 E.00608
G1 X125.793 Y134.051 E.00608
G2 X125.737 Y133.875 I-.163 J-.045 E.00678
G1 X125.936 Y133.491 F30000
; LINE_WIDTH: 0.419999
G1 F1200
G1 X125.659 Y133.386 E.0091
G1 X125.366 Y133.422 E.0091
G1 X125.122 Y133.59 E.0091
G1 X124.984 Y133.852 E.0091
G1 X124.984 Y134.148 E.0091
G1 X125.122 Y134.41 E.0091
G1 X125.366 Y134.578 E.0091
G1 X125.659 Y134.614 E.0091
G1 X125.936 Y134.509 E.0091
G1 X126.133 Y134.288 E.0091
G1 X126.204 Y134 E.0091
G2 X126.133 Y133.712 I-.919 J.074 E.00914
G1 X125.976 Y133.536 E.00726
G1 X126.242 Y133.258 F30000
G1 F1200
G1 X125.939 Y133.066 E.01102
G1 X125.585 Y133.009 E.01102
G1 X125.231 Y133.066 E.01102
G1 X124.928 Y133.258 E.01102
G1 X124.701 Y133.536 E.01102
G1 X124.601 Y133.881 E.01102
G1 X124.615 Y134.239 E.01102
G1 X124.769 Y134.563 E.01102
G1 X125.018 Y134.822 E.01102
G1 X125.348 Y134.962 E.01102
G1 X125.705 Y134.991 E.01102
G1 X126.046 Y134.878 E.01102
G1 X126.332 Y134.662 E.01102
G1 X126.512 Y134.352 E.01102
G1 X126.583 Y134 E.01102
G2 X126.469 Y133.536 I-1.483 J.119 E.01475
G1 X126.28 Y133.305 E.00918
; WIPE_START
G1 F24000
G1 X126.469 Y133.536 E-.11352
G1 X126.569 Y133.881 E-.13633
G1 X126.583 Y134 E-.04573
G1 X126.512 Y134.352 E-.13632
G1 X126.332 Y134.662 E-.13632
G1 X126.046 Y134.878 E-.13632
G1 X125.907 Y134.924 E-.05545
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.2 I1.217 J-.012 P1  F30000
G1 X125.805 Y124.318 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X125.537 Y123.609 I-.227 J-.319 E.04753
G3 X125.658 Y123.616 I.047 J.247 E.00404
G3 X125.85 Y124.28 I-.08 J.383 E.02812
G1 X126.029 Y124.644 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X125.137 Y123.351 I-.451 J-.643 E.07618
G3 X125.752 Y123.235 I.437 J.628 E.0198
G3 X126.077 Y124.607 I-.174 J.766 E.05382
M204 S10000
; WIPE_START
G1 F24000
G1 X125.864 Y124.737 E-.09462
G1 X125.68 Y124.783 E-.07223
G1 X125.49 Y124.783 E-.07223
G1 X125.305 Y124.737 E-.07223
G1 X125.137 Y124.649 E-.07223
G1 X124.995 Y124.523 E-.07223
G1 X124.887 Y124.366 E-.07223
G1 X124.819 Y124.189 E-.07223
G1 X124.796 Y124 E-.07223
G1 X124.819 Y123.811 E-.07223
G1 X124.834 Y123.774 E-.01532
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.2 I-.144 J1.208 P1  F30000
G1 X133.857 Y124.85 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X133.857 Y123.648 I.22 J-.601 E.05176
G3 X134.212 Y123.623 I.225 J.663 E.01195
G3 X133.915 Y124.868 I-.135 J.626 E.06763
G1 X133.717 Y125.221 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X133.308 Y123.561 I.361 J-.969 E.06181
G3 X134.306 Y123.243 I.778 J.716 E.03369
G3 X133.773 Y125.24 I-.228 J1.009 E.10229
M204 S10000
G1 X133.89 Y124.351 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.467838
G1 F1200
G1 X134.058 Y124.468 E.00709
G1 X134.206 Y124.425 E.00534
G1 X134.298 Y124.303 E.00531
G2 X134.249 Y124.104 I-.319 J-.026 E.00719
G1 X134.104 Y124.039 E.00554
G1 X133.96 Y124.069 E.00506
G1 X133.878 Y124.2 E.00537
G1 X133.885 Y124.291 E.00317
; WIPE_START
G1 F24000
G1 X133.878 Y124.2 E-.05465
G1 X133.96 Y124.069 E-.09273
G1 X134.104 Y124.039 E-.08744
G1 X134.249 Y124.104 E-.09562
G1 X134.298 Y124.25 E-.0916
G1 X134.298 Y124.303 E-.03168
G1 X134.206 Y124.425 E-.0917
G1 X134.058 Y124.468 E-.09222
G1 X133.89 Y124.351 E-.12237
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.2 I-1.212 J.105 P1  F30000
G1 X134.577 Y132.265 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X135.266 Y132.131 I.495 J.712 E.02397
G3 X134.529 Y132.3 I-.189 J.87 E.15958
G1 X134.358 Y131.947 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X135.36 Y131.751 I.73 J1.07 E.03226
G3 X133.834 Y132.692 I-.281 J1.252 E.18682
G3 X134.309 Y131.982 I1.254 J.325 E.02675
M204 S10000
G1 X134.715 Y132.672 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X134.605 Y132.882 E.00727
G1 X134.605 Y133.118 E.00727
G1 X134.715 Y133.328 E.00727
G1 X134.91 Y133.462 E.00727
G1 X135.144 Y133.491 E.00727
G1 X135.366 Y133.407 E.00727
G1 X135.523 Y133.23 E.00727
G1 X135.579 Y133 E.00727
G1 X135.523 Y132.77 E.00727
G1 X135.366 Y132.593 E.00727
G1 X135.144 Y132.509 E.00727
G1 X134.91 Y132.538 E.00727
G1 X134.764 Y132.638 E.00543
G1 X135.121 Y132.937 F30000
; LINE_WIDTH: 0.625678
G1 F1200
G2 X135.128 Y133.052 I-.033 J.06 E.01376
; CHANGE_LAYER
; Z_HEIGHT: 8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X135.048 Y133.063 E-.20374
G1 X135.012 Y133 E-.18542
G1 X135.048 Y132.937 E-.18542
G1 X135.121 Y132.937 E-.18542
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 40/55
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
G3 Z8.2 I.039 J-1.216 P1  F30000
G1 X125.861 Y132.643 Z8.2
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X125.863 Y132.644 E.00008
G1 X126.079 Y132.697 E.00737
G3 X124.351 Y133.352 I-.496 J1.297 E.22246
G1 X124.542 Y133.076 E.01114
G3 X125.752 Y132.626 I1.046 J.963 E.04444
G1 X125.802 Y132.634 E.00167
G1 X125.955 Y132.263 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X125.957 Y132.263 E.00008
G1 X126.219 Y132.328 E.00829
G1 X126.601 Y132.528 E.01325
G1 X126.924 Y132.814 E.01325
G1 X127.169 Y133.169 E.01325
G1 X127.321 Y133.572 E.01325
G1 X127.373 Y134 E.01325
G1 X127.321 Y134.428 E.01325
G1 X127.169 Y134.831 E.01325
G1 X126.924 Y135.186 E.01325
G1 X126.601 Y135.472 E.01325
G1 X126.219 Y135.672 E.01325
G1 X125.8 Y135.775 E.01325
G1 X125.369 Y135.775 E.01325
G1 X124.951 Y135.672 E.01325
G1 X124.569 Y135.472 E.01325
G1 X124.246 Y135.186 E.01325
G1 X124.155 Y135.053 E.00496
G1 X124.001 Y134.831 E.00829
G1 X123.848 Y134.428 E.01325
G1 X123.796 Y134 E.01325
G1 X123.848 Y133.572 E.01325
G1 X124.001 Y133.169 E.01325
G1 X124.093 Y133.036 E.00496
G1 X124.246 Y132.814 E.00829
G1 X124.569 Y132.528 E.01325
G1 X124.951 Y132.328 E.01325
G1 X125.369 Y132.225 E.01325
G1 X125.8 Y132.225 E.01325
G1 X125.896 Y132.248 E.00304
M204 S10000
G1 X126.152 Y133.178 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X125.82 Y133.037 E.01108
G1 X125.465 Y133.009 E.01097
G1 X125.116 Y133.126 E.01129
G1 X124.837 Y133.338 E.01076
G1 X124.615 Y133.766 E.01484
G1 X124.602 Y134.128 E.01112
G1 X124.701 Y134.464 E.01076
G1 X125.023 Y134.824 E.01484
G1 X125.353 Y134.964 E.01104
G1 X125.705 Y134.991 E.01084
G1 X126.047 Y134.877 E.01107
G1 X126.332 Y134.662 E.01098
G1 X126.512 Y134.351 E.01105
G1 X126.569 Y134.119 E.00734
G1 X126.554 Y133.761 E.011
G1 X126.4 Y133.436 E.01105
G1 X126.194 Y133.221 E.00915
G1 X126.048 Y133.59 F30000
G1 F1200
G1 X125.804 Y133.422 E.0091
G1 X125.51 Y133.386 E.0091
G1 X125.233 Y133.491 E.0091
G1 X125.065 Y133.683 E.00785
G1 X124.966 Y134 E.01021
G1 X125.037 Y134.288 E.0091
G1 X125.248 Y134.517 E.00957
G1 X125.51 Y134.614 E.0086
G1 X125.804 Y134.578 E.0091
G1 X126.048 Y134.41 E.0091
G1 X126.186 Y134.148 E.0091
G2 X126.186 Y133.852 I-.907 J-.148 E.00914
G1 X126.076 Y133.643 E.00726
G1 X125.747 Y133.856 F30000
; LINE_WIDTH: 0.463032
G1 F1200
G1 X125.587 Y133.784 E.00603
G1 X125.425 Y133.853 E.00601
G1 X125.374 Y134.052 E.00702
G1 X125.508 Y134.203 E.00691
G1 X125.683 Y134.192 E.00601
G1 X125.787 Y134.076 E.00533
G2 X125.765 Y133.913 I-.148 J-.063 E.00588
; WIPE_START
G1 F24000
G1 X125.799 Y134.025 E-.07062
G1 X125.787 Y134.076 E-.03133
G1 X125.683 Y134.192 E-.09397
G1 X125.508 Y134.203 E-.10609
G1 X125.374 Y134.052 E-.12189
G1 X125.425 Y133.853 E-.12384
G1 X125.587 Y133.784 E-.10597
G1 X125.747 Y133.856 E-.10629
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.4 I1.217 J.008 P1  F30000
G1 X125.807 Y124.322 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X125.279 Y124.244 I-.223 J-.322 E.01948
G1 X125.279 Y124.244 E0
G3 X125.652 Y123.614 I.307 J-.243 E.03134
G3 X125.853 Y124.284 I-.068 J.385 E.02868
G1 X126.027 Y124.641 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X125.137 Y123.351 I-.449 J-.642 E.07597
G3 X125.746 Y123.234 I.437 J.628 E.01962
G1 X125.746 Y123.234 E0
G3 X126.075 Y124.605 I-.168 J.765 E.0539
M204 S10000
; WIPE_START
G1 F24000
G1 X125.864 Y124.737 E-.09456
G1 X125.68 Y124.783 E-.07223
G1 X125.49 Y124.783 E-.07223
G1 X125.305 Y124.737 E-.07223
G1 X125.137 Y124.649 E-.07223
G1 X124.995 Y124.523 E-.07223
G1 X124.956 Y124.467 E-.02581
G1 X124.887 Y124.366 E-.04642
G1 X124.819 Y124.189 E-.07223
G1 X124.796 Y124 E-.07223
G1 X124.819 Y123.811 E-.07223
G1 X124.834 Y123.773 E-.01538
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.4 I-.144 J1.208 P1  F30000
G1 X133.857 Y124.852 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X133.857 Y123.648 I.221 J-.602 E.05182
G3 X134.205 Y123.622 I.227 J.674 E.0117
G3 X133.914 Y124.87 I-.127 J.628 E.06807
G1 X133.717 Y125.221 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X133.308 Y123.561 I.361 J-.969 E.06181
G3 X134.299 Y123.241 I.779 J.717 E.03346
G3 X133.773 Y125.24 I-.221 J1.011 E.10254
M204 S10000
G1 X133.891 Y124.352 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.468169
G1 F1200
G1 X134.009 Y124.449 E.00532
G1 X134.163 Y124.455 E.00532
G1 X134.274 Y124.349 E.00533
G1 X134.298 Y124.25 E.00354
G1 X134.249 Y124.104 E.00531
G1 X134.104 Y124.039 E.00551
G1 X133.96 Y124.069 E.00509
G1 X133.878 Y124.199 E.00534
G1 X133.886 Y124.292 E.00323
; WIPE_START
G1 F24000
G1 X133.878 Y124.199 E-.05586
G1 X133.96 Y124.069 E-.09223
G1 X134.104 Y124.039 E-.08801
G1 X134.249 Y124.104 E-.09524
G1 X134.298 Y124.25 E-.09169
G1 X134.274 Y124.349 E-.06116
G1 X134.163 Y124.455 E-.09201
G1 X134.009 Y124.449 E-.09183
G1 X133.891 Y124.352 E-.09196
; WIPE_END
G1 E-.04 F1800
G17
M73 P87 R1
G3 Z8.4 I-1.212 J.105 P1  F30000
G1 X134.577 Y132.265 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X135.258 Y132.129 I.496 J.713 E.02367
G3 X134.529 Y132.3 I-.18 J.871 E.15968
G1 X134.358 Y131.947 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X135.352 Y131.748 I.73 J1.071 E.03199
G3 X133.834 Y132.692 I-.272 J1.255 E.18712
G3 X134.309 Y131.982 I1.254 J.326 E.02675
M204 S10000
G1 X134.715 Y132.672 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X134.605 Y132.882 E.00727
G1 X134.605 Y133.118 E.00727
G1 X134.715 Y133.328 E.00727
G1 X134.91 Y133.462 E.00727
G1 X135.144 Y133.491 E.00727
G1 X135.366 Y133.407 E.00727
G1 X135.523 Y133.23 E.00727
G1 X135.579 Y133 E.00727
G1 X135.523 Y132.77 E.00727
G1 X135.366 Y132.593 E.00727
G1 X135.144 Y132.509 E.00727
G1 X134.91 Y132.538 E.00727
G1 X134.764 Y132.638 E.00543
G1 X135.121 Y132.937 F30000
; LINE_WIDTH: 0.625674
G1 F1200
G2 X135.128 Y133.052 I-.033 J.06 E.01376
; CHANGE_LAYER
; Z_HEIGHT: 8.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X135.048 Y133.063 E-.20374
G1 X135.012 Y133 E-.18542
G1 X135.048 Y132.937 E-.18542
G1 X135.121 Y132.937 E-.18542
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 41/55
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
G3 Z8.4 I.039 J-1.216 P1  F30000
G1 X125.849 Y132.64 Z8.4
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X125.852 Y132.641 E.00009
G3 X124.232 Y133.667 I-.272 J1.362 E.21928
G3 X125.752 Y132.626 I1.358 J.354 E.06665
G1 X125.79 Y132.631 E.00126
G1 X125.943 Y132.26 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X125.945 Y132.26 E.00009
G1 X126.219 Y132.328 E.00866
G1 X126.601 Y132.528 E.01325
G1 X126.924 Y132.814 E.01325
G1 X127.169 Y133.169 E.01325
G1 X127.321 Y133.572 E.01325
G1 X127.373 Y134 E.01325
G1 X127.321 Y134.428 E.01325
G1 X127.169 Y134.831 E.01325
G1 X126.924 Y135.186 E.01325
G1 X126.601 Y135.472 E.01325
G1 X126.219 Y135.672 E.01325
G1 X125.8 Y135.775 E.01325
G1 X125.369 Y135.775 E.01325
G1 X124.951 Y135.672 E.01325
G1 X124.569 Y135.472 E.01325
G1 X124.246 Y135.186 E.01325
G1 X124.001 Y134.831 E.01325
G1 X123.848 Y134.428 E.01325
G1 X123.796 Y134 E.01325
G1 X123.848 Y133.572 E.01325
G1 X124.001 Y133.169 E.01325
G1 X124.246 Y132.814 E.01325
G1 X124.569 Y132.528 E.01325
G1 X124.951 Y132.328 E.01325
G1 X125.369 Y132.225 E.01325
G1 X125.8 Y132.225 E.01325
G1 X125.884 Y132.245 E.00266
M204 S10000
G1 X126.152 Y133.178 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X125.822 Y133.038 E.01102
G1 X125.465 Y133.009 E.01102
G1 X125.124 Y133.122 E.01102
G1 X124.837 Y133.338 E.01102
G1 X124.658 Y133.648 E.01102
G1 X124.586 Y134 E.01102
G1 X124.658 Y134.352 E.01102
G1 X124.837 Y134.662 E.01102
G1 X125.124 Y134.878 E.01102
G1 X125.465 Y134.991 E.01102
G1 X125.822 Y134.962 E.01102
G1 X126.152 Y134.822 E.01102
G1 X126.401 Y134.563 E.01102
G1 X126.554 Y134.239 E.01102
G2 X126.554 Y133.761 I-1.469 J-.239 E.01475
G1 X126.401 Y133.437 E.01102
G1 X126.194 Y133.221 E.00918
G1 X126.048 Y133.59 F30000
G1 F1200
G1 X125.804 Y133.422 E.0091
G1 X125.51 Y133.386 E.0091
G1 X125.233 Y133.491 E.0091
G1 X125.037 Y133.712 E.0091
G1 X124.966 Y134 E.0091
G1 X125.037 Y134.288 E.0091
G1 X125.233 Y134.509 E.0091
G1 X125.51 Y134.614 E.0091
G1 X125.804 Y134.578 E.0091
G1 X126.048 Y134.41 E.0091
G1 X126.186 Y134.148 E.0091
G2 X126.186 Y133.852 I-.91 J-.148 E.00914
G1 X126.076 Y133.643 E.00726
G1 X125.745 Y133.858 F30000
; LINE_WIDTH: 0.468556
G1 F1200
G1 X125.585 Y133.787 E.00608
G1 X125.424 Y133.858 E.00608
G1 X125.374 Y134.026 E.00608
G1 X125.463 Y134.176 E.00608
G1 X125.636 Y134.207 E.00608
G1 X125.775 Y134.1 E.00608
G2 X125.763 Y133.915 I-.148 J-.083 E.00678
; WIPE_START
G1 F24000
G1 X125.796 Y134.026 E-.07044
G1 X125.775 Y134.1 E-.04705
G1 X125.636 Y134.207 E-.10708
G1 X125.463 Y134.176 E-.10709
G1 X125.374 Y134.026 E-.10709
G1 X125.424 Y133.858 E-.10708
G1 X125.585 Y133.787 E-.10708
G1 X125.745 Y133.858 E-.10709
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.6 I1.217 J.008 P1  F30000
G1 X125.807 Y124.322 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X125.632 Y123.609 I-.222 J-.323 E.05025
G1 X125.724 Y123.632 E.00315
G3 X125.854 Y124.284 I-.139 J.367 E.02632
G1 X126.027 Y124.641 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X125.137 Y123.351 I-.449 J-.642 E.07596
G3 X125.74 Y123.232 I.437 J.629 E.01943
G3 X126.075 Y124.605 I-.162 J.767 E.0541
M204 S10000
; WIPE_START
G1 F24000
G1 X125.865 Y124.737 E-.09456
G1 X125.68 Y124.783 E-.07223
G1 X125.49 Y124.783 E-.07223
G1 X125.305 Y124.737 E-.07223
G1 X125.137 Y124.649 E-.07223
G1 X124.995 Y124.523 E-.07223
G1 X124.887 Y124.366 E-.07223
G1 X124.819 Y124.189 E-.07223
G1 X124.796 Y124 E-.07223
G1 X124.819 Y123.811 E-.07223
G1 X124.836 Y123.774 E-.01538
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.6 I-.144 J1.208 P1  F30000
G1 X133.857 Y124.852 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X133.857 Y123.648 I.222 J-.602 E.0518
G3 X134.198 Y123.62 I.229 J.688 E.01145
G3 X133.914 Y124.87 I-.119 J.63 E.06838
G1 X133.717 Y125.221 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X133.308 Y123.561 I.362 J-.969 E.0618
G3 X134.291 Y123.239 I.78 J.718 E.03323
G3 X133.773 Y125.24 I-.213 J1.012 E.10279
M204 S10000
G1 X133.89 Y124.351 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.46803
G1 F1200
G1 X134.058 Y124.468 E.00708
G1 X134.206 Y124.425 E.00534
G1 X134.298 Y124.303 E.00531
G2 X134.249 Y124.104 I-.319 J-.026 E.00719
G1 X134.105 Y124.039 E.00549
G1 X133.96 Y124.069 E.00513
G1 X133.878 Y124.2 E.00536
G1 X133.885 Y124.291 E.00318
; WIPE_START
G1 F24000
G1 X133.878 Y124.2 E-.05493
G1 X133.96 Y124.069 E-.0925
G1 X134.105 Y124.039 E-.08849
G1 X134.249 Y124.104 E-.09469
G1 X134.298 Y124.25 E-.09165
G1 X134.298 Y124.303 E-.03161
G1 X134.206 Y124.425 E-.09172
G1 X134.058 Y124.468 E-.09212
G1 X133.89 Y124.351 E-.12228
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.6 I-1.212 J.105 P1  F30000
G1 X134.577 Y132.265 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X135.249 Y132.127 I.496 J.714 E.02338
G3 X134.529 Y132.3 I-.171 J.873 E.15999
G1 X134.353 Y131.94 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X135.343 Y131.746 I.72 J1.052 E.03185
G3 X133.944 Y132.401 I-.264 J1.256 E.19694
G3 X134.305 Y131.975 I1.129 J.591 E.01729
M204 S10000
G1 X134.804 Y132.593 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X134.647 Y132.77 E.00728
G1 X134.591 Y133 E.00727
G1 X134.647 Y133.23 E.00727
G1 X134.804 Y133.407 E.00727
G1 X135.025 Y133.491 E.00727
G1 X135.26 Y133.462 E.00727
G1 X135.455 Y133.328 E.00727
G1 X135.565 Y133.118 E.00727
G1 X135.565 Y132.882 E.00727
G1 X135.455 Y132.672 E.00727
G1 X135.261 Y132.538 E.00725
G1 X135.021 Y132.51 E.00742
G1 X134.86 Y132.572 E.00528
G1 X135.121 Y132.937 F30000
; LINE_WIDTH: 0.624758
G1 F1200
G2 X135.128 Y133.052 I-.033 J.059 E.01371
; CHANGE_LAYER
; Z_HEIGHT: 8.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X135.048 Y133.063 E-.20363
G1 X135.012 Y133 E-.18546
G1 X135.048 Y132.937 E-.18546
G1 X135.121 Y132.937 E-.18545
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 42/55
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
G3 Z8.6 I.039 J-1.216 P1  F30000
G1 X125.837 Y132.637 Z8.6
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X125.84 Y132.638 E.0001
G3 X124.351 Y133.352 I-.262 J1.364 E.23071
G3 X125.752 Y132.624 I1.223 J.64 E.05577
G1 X125.778 Y132.628 E.00086
G1 X125.931 Y132.257 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X125.934 Y132.257 E.00009
G1 X126.219 Y132.328 E.00903
G1 X126.601 Y132.528 E.01325
G1 X126.924 Y132.814 E.01325
G1 X127.169 Y133.169 E.01325
G1 X127.321 Y133.572 E.01325
G1 X127.373 Y134 E.01325
G1 X127.321 Y134.428 E.01325
G1 X127.169 Y134.831 E.01325
G1 X126.924 Y135.186 E.01325
G1 X126.601 Y135.472 E.01325
G1 X126.219 Y135.672 E.01325
G1 X125.8 Y135.775 E.01325
G1 X125.369 Y135.775 E.01325
G1 X124.951 Y135.672 E.01325
G1 X124.569 Y135.472 E.01325
G1 X124.246 Y135.186 E.01325
G1 X124.001 Y134.831 E.01325
G1 X123.848 Y134.428 E.01325
G1 X123.796 Y134 E.01325
G1 X123.848 Y133.572 E.01325
G1 X124.001 Y133.169 E.01325
G1 X124.246 Y132.814 E.01325
G1 X124.569 Y132.528 E.01325
G1 X124.951 Y132.328 E.01325
G1 X125.369 Y132.225 E.01325
G1 X125.8 Y132.225 E.01325
G1 X125.873 Y132.242 E.00228
M204 S10000
G1 X126.152 Y133.178 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X125.822 Y133.038 E.01102
G1 X125.465 Y133.009 E.01102
G1 X125.124 Y133.122 E.01102
G1 X124.837 Y133.338 E.01102
G1 X124.658 Y133.648 E.01102
G1 X124.586 Y134 E.01102
G1 X124.658 Y134.352 E.01102
G1 X124.837 Y134.662 E.01102
G1 X125.124 Y134.878 E.01102
G1 X125.465 Y134.991 E.01102
G1 X125.822 Y134.962 E.01102
G1 X126.152 Y134.822 E.01102
G1 X126.401 Y134.563 E.01102
G1 X126.554 Y134.239 E.01102
G2 X126.554 Y133.761 I-1.469 J-.239 E.01475
G1 X126.401 Y133.437 E.01102
G1 X126.194 Y133.221 E.00918
G1 X126.048 Y133.59 F30000
M73 P88 R1
G1 F1200
G1 X125.804 Y133.422 E.0091
G1 X125.51 Y133.386 E.0091
G1 X125.233 Y133.491 E.0091
G1 X125.037 Y133.712 E.0091
G1 X124.966 Y134 E.0091
G1 X125.037 Y134.288 E.0091
G1 X125.233 Y134.509 E.0091
G1 X125.51 Y134.614 E.0091
G1 X125.804 Y134.578 E.0091
G1 X126.048 Y134.41 E.0091
G1 X126.186 Y134.148 E.0091
G2 X126.186 Y133.852 I-.91 J-.148 E.00914
G1 X126.076 Y133.643 E.00726
G1 X125.745 Y133.858 F30000
; LINE_WIDTH: 0.468555
G1 F1200
G1 X125.585 Y133.787 E.00608
G1 X125.424 Y133.858 E.00608
G1 X125.374 Y134.026 E.00608
G1 X125.463 Y134.176 E.00608
G1 X125.636 Y134.207 E.00608
G1 X125.775 Y134.1 E.00608
G2 X125.763 Y133.915 I-.148 J-.083 E.00678
; WIPE_START
G1 F24000
G1 X125.796 Y134.026 E-.07044
G1 X125.775 Y134.1 E-.04705
G1 X125.636 Y134.207 E-.10708
G1 X125.463 Y134.176 E-.10708
G1 X125.374 Y134.026 E-.10709
G1 X125.424 Y133.858 E-.10708
G1 X125.585 Y133.787 E-.10709
G1 X125.745 Y133.858 E-.10709
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.8 I1.217 J.007 P1  F30000
G1 X125.802 Y124.314 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X125.724 Y124.365 E.0031
G3 X125.632 Y123.609 I-.138 J-.367 E.04711
G1 X125.724 Y123.632 E.00315
G3 X125.878 Y124.26 I-.139 J.367 E.02518
G1 X125.851 Y124.279 E.00112
G1 X126.028 Y124.642 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X125.305 Y123.263 I-.452 J-.642 E.08212
G3 X125.734 Y123.231 I.277 J.822 E.01335
G3 X126.076 Y124.606 I-.158 J.769 E.05428
M204 S10000
; WIPE_START
G1 F24000
G1 X125.864 Y124.737 E-.09458
G1 X125.68 Y124.783 E-.07223
G1 X125.49 Y124.783 E-.07223
G1 X125.305 Y124.737 E-.07223
G1 X125.137 Y124.649 E-.07223
G1 X124.995 Y124.523 E-.07223
G1 X124.887 Y124.366 E-.07223
G1 X124.819 Y124.189 E-.07223
G1 X124.796 Y124 E-.07223
G1 X124.819 Y123.811 E-.07223
G1 X124.834 Y123.774 E-.01536
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.8 I-.144 J1.208 P1  F30000
G1 X133.858 Y124.849 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X133.857 Y123.648 I.222 J-.601 E.05167
G3 X134.19 Y123.618 I.233 J.71 E.0112
G3 X133.915 Y124.867 I-.111 J.631 E.06854
G1 X133.717 Y125.221 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X133.308 Y123.561 I.362 J-.969 E.0618
G3 X134.284 Y123.237 I.781 J.72 E.033
G3 X133.773 Y125.24 I-.205 J1.014 E.10306
M204 S10000
G1 X133.89 Y124.351 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.468138
G1 F1200
G1 X134.058 Y124.468 E.00708
G1 X134.206 Y124.425 E.00533
G1 X134.298 Y124.303 E.00531
G2 X134.249 Y124.104 I-.319 J-.026 E.00719
G1 X134.106 Y124.039 E.00546
G1 X133.96 Y124.069 E.00516
G1 X133.878 Y124.2 E.00535
G1 X133.885 Y124.292 E.00319
; WIPE_START
G1 F24000
G1 X133.878 Y124.2 E-.0551
G1 X133.96 Y124.069 E-.09238
G1 X134.106 Y124.039 E-.08908
G1 X134.249 Y124.104 E-.09418
G1 X134.298 Y124.25 E-.09167
G1 X134.298 Y124.303 E-.03158
G1 X134.206 Y124.425 E-.09173
G1 X134.058 Y124.468 E-.09206
G1 X133.89 Y124.351 E-.12223
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.8 I-1.212 J.105 P1  F30000
G1 X134.577 Y132.265 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X135.24 Y132.125 I.497 J.716 E.02308
G3 X134.529 Y132.3 I-.162 J.874 E.16031
G1 X134.353 Y131.94 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X135.334 Y131.744 I.72 J1.052 E.03157
G3 X133.944 Y132.401 I-.255 J1.258 E.19725
G3 X134.305 Y131.975 I1.13 J.591 E.01729
M204 S10000
G1 X134.804 Y132.593 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X134.647 Y132.77 E.00727
G1 X134.591 Y133 E.00727
G1 X134.647 Y133.23 E.00727
G1 X134.804 Y133.407 E.00727
G1 X135.025 Y133.491 E.00727
G1 X135.26 Y133.462 E.00727
G1 X135.455 Y133.328 E.00727
G1 X135.565 Y133.118 E.00727
G1 X135.565 Y132.882 E.00727
G1 X135.455 Y132.672 E.00727
G1 X135.261 Y132.538 E.00725
G1 X135.021 Y132.51 E.0074
G1 X134.86 Y132.572 E.0053
G1 X135.121 Y132.937 F30000
; LINE_WIDTH: 0.624874
G1 F1200
G2 X135.128 Y133.052 I-.033 J.059 E.01371
; CHANGE_LAYER
; Z_HEIGHT: 8.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X135.048 Y133.063 E-.20365
G1 X135.012 Y133 E-.18545
G1 X135.048 Y132.937 E-.18545
G1 X135.121 Y132.937 E-.18545
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 43/55
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
G3 Z8.8 I.04 J-1.216 P1  F30000
G1 X125.825 Y132.634 Z8.8
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X125.828 Y132.635 E.0001
G3 X124.351 Y133.352 I-.249 J1.366 E.23119
G3 X125.752 Y132.623 I1.224 J.641 E.05577
G1 X125.766 Y132.625 E.00046
G1 X125.919 Y132.254 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X125.922 Y132.255 E.0001
G1 X126.219 Y132.328 E.0094
G1 X126.601 Y132.528 E.01325
G1 X126.924 Y132.814 E.01325
G1 X127.169 Y133.169 E.01325
G1 X127.321 Y133.572 E.01325
G1 X127.373 Y134 E.01325
G1 X127.321 Y134.428 E.01325
G1 X127.169 Y134.831 E.01325
G1 X126.924 Y135.186 E.01325
G1 X126.601 Y135.472 E.01325
G1 X126.219 Y135.672 E.01325
G1 X125.8 Y135.775 E.01325
G1 X125.369 Y135.775 E.01325
G1 X124.951 Y135.672 E.01325
G1 X124.569 Y135.472 E.01325
G1 X124.246 Y135.186 E.01325
G1 X124.175 Y135.083 E.00385
G1 X124.001 Y134.831 E.0094
G1 X123.848 Y134.428 E.01325
G1 X123.796 Y134 E.01325
G1 X123.848 Y133.572 E.01325
G1 X124.001 Y133.169 E.01325
G1 X124.246 Y132.814 E.01325
G1 X124.569 Y132.528 E.01325
G1 X124.951 Y132.328 E.01325
G1 X125.369 Y132.225 E.01325
G1 X125.8 Y132.225 E.01325
G1 X125.861 Y132.239 E.00191
M204 S10000
; WIPE_START
G1 F24000
G1 X125.922 Y132.255 E-.02399
G1 X126.219 Y132.328 E-.11627
G1 X126.601 Y132.528 E-.16384
G1 X126.924 Y132.814 E-.16384
G1 X127.169 Y133.169 E-.16384
G1 X127.288 Y133.484 E-.12822
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9 I-.254 J-1.19 P1  F30000
G1 X125.708 Y133.822 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.465467
G1 F1200
G1 X125.534 Y133.792 E.00607
G1 X125.408 Y133.879 E.00528
G1 X125.375 Y134.052 E.00605
G1 X125.495 Y134.195 E.00641
G1 X125.661 Y134.202 E.00575
G1 X125.785 Y134.077 E.00606
G2 X125.738 Y133.874 I-.155 J-.071 E.00771
G1 X125.936 Y133.491 F30000
; LINE_WIDTH: 0.419999
G1 F1200
G1 X125.659 Y133.386 E.0091
G1 X125.366 Y133.422 E.0091
G1 X125.122 Y133.59 E.0091
G1 X124.984 Y133.852 E.0091
G1 X124.984 Y134.148 E.0091
G1 X125.098 Y134.376 E.00782
G1 X125.366 Y134.578 E.01032
G1 X125.659 Y134.614 E.0091
G1 X125.936 Y134.509 E.0091
G1 X126.133 Y134.288 E.0091
G1 X126.204 Y134 E.0091
G2 X126.133 Y133.712 I-.917 J.074 E.00914
G1 X125.976 Y133.536 E.00726
G1 X126.242 Y133.258 F30000
G1 F1200
G1 X125.939 Y133.066 E.01101
G1 X125.584 Y133.009 E.01104
G1 X125.231 Y133.066 E.01101
G1 X124.927 Y133.259 E.01105
G1 X124.701 Y133.536 E.011
G1 X124.601 Y133.883 E.0111
G1 X124.615 Y134.239 E.01095
G1 X124.76 Y134.549 E.01052
G1 X125.021 Y134.823 E.01163
G1 X125.351 Y134.963 E.01103
G1 X125.705 Y134.991 E.0109
G1 X126.046 Y134.877 E.01105
G1 X126.332 Y134.662 E.01099
G1 X126.512 Y134.351 E.01104
G1 X126.583 Y134 E.01101
G2 X126.469 Y133.536 I-1.482 J.119 E.01475
G1 X126.28 Y133.304 E.00919
; WIPE_START
G1 F24000
G1 X126.469 Y133.536 E-.11366
G1 X126.569 Y133.88 E-.13617
G1 X126.583 Y134 E-.04589
G1 X126.512 Y134.351 E-.13614
G1 X126.332 Y134.662 E-.13651
G1 X126.046 Y134.877 E-.13597
G1 X125.907 Y134.924 E-.05566
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9 I1.217 J-.011 P1  F30000
G1 X125.808 Y124.324 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X125.724 Y123.632 I-.222 J-.324 E.05339
G3 X125.855 Y124.285 I-.145 J.369 E.02626
G1 X126.028 Y124.643 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X125.305 Y123.263 I-.452 J-.643 E.08211
G3 X125.728 Y123.229 I.279 J.832 E.01317
G3 X126.076 Y124.606 I-.152 J.771 E.05451
M204 S10000
; WIPE_START
G1 F24000
G1 X125.864 Y124.737 E-.09459
G1 X125.68 Y124.783 E-.07223
G1 X125.49 Y124.783 E-.07223
G1 X125.305 Y124.737 E-.07223
G1 X125.137 Y124.649 E-.07223
G1 X124.966 Y124.482 E-.09073
G1 X124.887 Y124.366 E-.05329
G1 X124.819 Y124.189 E-.07223
G1 X124.796 Y124 E-.07223
G1 X124.819 Y123.811 E-.07223
G1 X124.834 Y123.772 E-.01579
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9 I-.144 J1.208 P1  F30000
G1 X133.857 Y124.85 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X134.007 Y123.611 I.22 J-.602 E.05702
G3 X134.183 Y123.616 I.078 J.359 E.00588
G1 X134.183 Y123.616 E0
G3 X133.915 Y124.868 I-.106 J.632 E.06868
G1 X133.717 Y125.221 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X133.495 Y123.395 I.36 J-.97 E.06958
G3 X134.277 Y123.236 I.577 J.83 E.0252
G3 X133.773 Y125.24 I-.2 J1.015 E.10319
M204 S10000
G1 X133.891 Y124.352 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.468385
G1 F1200
G1 X134.009 Y124.449 E.00532
G1 X134.163 Y124.455 E.00532
G1 X134.274 Y124.349 E.00532
G1 X134.298 Y124.25 E.00354
G1 X134.249 Y124.105 E.00531
G1 X134.107 Y124.039 E.00542
G1 X133.96 Y124.069 E.0052
G1 X133.878 Y124.199 E.00533
G1 X133.886 Y124.292 E.00324
; WIPE_START
G1 F24000
G1 X133.878 Y124.199 E-.05589
G1 X133.96 Y124.069 E-.09206
G1 X134.107 Y124.039 E-.08978
G1 X134.249 Y124.105 E-.09369
G1 X134.298 Y124.25 E-.09176
G1 X134.274 Y124.349 E-.0611
G1 X134.163 Y124.455 E-.09195
G1 X134.009 Y124.449 E-.09185
G1 X133.891 Y124.352 E-.09192
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9 I-1.212 J.105 P1  F30000
G1 X134.576 Y132.263 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X134.768 Y132.165 I.501 J.737 E.00717
G3 X135.231 Y132.123 I.323 J.985 E.01556
G3 X134.528 Y132.299 I-.154 J.877 E.16091
G1 X134.353 Y131.94 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X135.325 Y131.742 I.721 J1.052 E.0313
G3 X133.944 Y132.401 I-.246 J1.26 E.19756
G3 X134.305 Y131.975 I1.13 J.591 E.01729
M204 S10000
G1 X134.804 Y132.593 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X134.647 Y132.77 E.00727
G1 X134.591 Y133 E.00727
G1 X134.647 Y133.23 E.00727
G1 X134.804 Y133.407 E.00727
G1 X135.025 Y133.491 E.00727
G1 X135.26 Y133.462 E.00727
G1 X135.455 Y133.328 E.00727
M73 P89 R1
G1 X135.565 Y133.118 E.00727
G1 X135.565 Y132.882 E.00727
G1 X135.455 Y132.672 E.00727
G1 X135.261 Y132.538 E.00726
G1 X135.022 Y132.51 E.00738
G1 X134.86 Y132.572 E.00532
G1 X135.121 Y132.937 F30000
; LINE_WIDTH: 0.625002
G1 F1200
G2 X135.128 Y133.052 I-.033 J.059 E.01372
; CHANGE_LAYER
; Z_HEIGHT: 8.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X135.048 Y133.063 E-.20366
G1 X135.012 Y133 E-.18545
G1 X135.048 Y132.937 E-.18545
G1 X135.121 Y132.937 E-.18545
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 44/55
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
G3 Z9 I.04 J-1.216 P1  F30000
G1 X125.814 Y132.632 Z9
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X125.816 Y132.632 E.0001
G3 X124.351 Y133.352 I-.237 J1.369 E.23168
G3 X125.752 Y132.623 I1.225 J.641 E.05578
G1 X125.754 Y132.623 E.00007
G1 X125.907 Y132.251 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X125.91 Y132.252 E.00009
G1 X126.219 Y132.328 E.00977
G1 X126.601 Y132.528 E.01325
G1 X126.924 Y132.814 E.01325
G1 X127.169 Y133.169 E.01325
G1 X127.321 Y133.572 E.01325
G1 X127.373 Y134 E.01325
G1 X127.321 Y134.428 E.01325
G1 X127.169 Y134.831 E.01325
G1 X126.924 Y135.186 E.01325
G1 X126.601 Y135.472 E.01325
G1 X126.219 Y135.672 E.01325
G1 X125.8 Y135.775 E.01325
G1 X125.369 Y135.775 E.01325
G1 X124.951 Y135.672 E.01325
G1 X124.569 Y135.472 E.01325
G1 X124.246 Y135.186 E.01325
G1 X124.001 Y134.831 E.01325
G1 X123.848 Y134.428 E.01325
G1 X123.796 Y134 E.01325
G1 X123.848 Y133.572 E.01325
G1 X124.001 Y133.169 E.01325
G1 X124.246 Y132.814 E.01325
G1 X124.569 Y132.528 E.01325
G1 X124.951 Y132.328 E.01325
G1 X125.369 Y132.225 E.01325
G1 X125.8 Y132.225 E.01325
G1 X125.849 Y132.237 E.00154
M204 S10000
G1 X126.152 Y133.178 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X125.822 Y133.037 E.01103
G1 X125.465 Y133.009 E.01101
G1 X125.124 Y133.123 E.01104
G1 X124.837 Y133.338 E.01101
G1 X124.658 Y133.65 E.01106
G1 X124.586 Y134 E.01099
G1 X124.662 Y134.363 E.01139
G1 X124.816 Y134.631 E.00949
G1 X125.132 Y134.882 E.01239
G1 X125.465 Y134.991 E.01077
G1 X125.823 Y134.962 E.01106
G1 X126.152 Y134.822 E.01099
G1 X126.401 Y134.563 E.01104
G1 X126.554 Y134.239 E.01101
G2 X126.554 Y133.761 I-1.467 J-.239 E.01475
G1 X126.401 Y133.437 E.01103
G1 X126.194 Y133.221 E.00917
G1 X126.048 Y133.59 F30000
G1 F1200
G1 X125.804 Y133.422 E.0091
G1 X125.51 Y133.386 E.0091
G1 X125.233 Y133.491 E.0091
G1 X125.037 Y133.712 E.0091
G1 X124.966 Y134 E.0091
G1 X125.037 Y134.288 E.0091
G1 X125.241 Y134.513 E.00935
G1 X125.51 Y134.614 E.00884
G1 X125.804 Y134.578 E.0091
G1 X126.048 Y134.41 E.0091
G1 X126.186 Y134.148 E.0091
G2 X126.186 Y133.852 I-.909 J-.148 E.00914
G1 X126.076 Y133.643 E.00726
G1 X125.746 Y133.857 F30000
; LINE_WIDTH: 0.466154
G1 F1200
G1 X125.585 Y133.786 E.00607
G1 X125.443 Y133.84 E.00526
G1 X125.369 Y134 E.00606
G1 X125.438 Y134.149 E.00566
G1 X125.582 Y134.214 E.00545
G1 X125.727 Y134.16 E.00535
G1 X125.797 Y134.025 E.00523
G1 X125.764 Y133.914 E.004
; WIPE_START
G1 F24000
G1 X125.797 Y134.025 E-.07058
G1 X125.727 Y134.16 E-.09222
G1 X125.582 Y134.214 E-.09444
G1 X125.438 Y134.149 E-.09608
G1 X125.369 Y134 E-.09977
G1 X125.443 Y133.84 E-.10694
G1 X125.585 Y133.786 E-.09288
G1 X125.746 Y133.857 E-.1071
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.2 I1.217 J.007 P1  F30000
G1 X125.802 Y124.314 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X125.724 Y124.365 E.0031
G3 X125.632 Y123.609 I-.138 J-.367 E.04711
G1 X125.724 Y123.632 E.00315
G3 X125.878 Y124.26 I-.139 J.367 E.02518
G1 X125.851 Y124.279 E.00112
G1 X126.029 Y124.643 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X125.305 Y123.263 I-.452 J-.643 E.0821
G3 X125.722 Y123.228 I.281 J.845 E.01298
G3 X126.077 Y124.607 I-.145 J.772 E.05474
M204 S10000
; WIPE_START
G1 F24000
G1 X125.864 Y124.737 E-.09461
G1 X125.68 Y124.783 E-.07223
G1 X125.49 Y124.783 E-.07223
G1 X125.305 Y124.737 E-.07223
G1 X125.137 Y124.649 E-.07223
G1 X124.995 Y124.523 E-.07223
G1 X124.887 Y124.366 E-.07223
G1 X124.819 Y124.189 E-.07223
G1 X124.796 Y124 E-.07223
G1 X124.819 Y123.811 E-.07223
G1 X124.834 Y123.774 E-.01534
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.2 I-.144 J1.208 P1  F30000
G1 X133.858 Y124.849 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X134.313 Y123.648 I.23 J-.599 E.06672
G3 X134.45 Y124.78 I-.237 J.603 E.04621
G3 X133.915 Y124.868 I-.362 J-.53 E.01859
G1 X133.717 Y125.22 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X133.495 Y123.395 I.361 J-.97 E.06955
G3 X134.269 Y123.234 I.578 J.831 E.02498
G3 X133.774 Y125.24 I-.192 J1.017 E.10342
M204 S10000
G1 X133.921 Y124.395 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.468642
G1 F1200
G1 X134.059 Y124.461 E.00532
G1 X134.209 Y124.43 E.00532
G1 X134.292 Y124.301 E.00532
G1 X134.292 Y124.199 E.00353
G1 X134.209 Y124.07 E.00532
G1 X134.059 Y124.039 E.00532
G1 X133.921 Y124.105 E.00532
G1 X133.872 Y124.25 E.00532
G1 X133.902 Y124.338 E.00324
; WIPE_START
G1 F24000
G1 X133.872 Y124.25 E-.05592
G1 X133.921 Y124.105 E-.09186
G1 X134.059 Y124.039 E-.09186
G1 X134.209 Y124.07 E-.09186
G1 X134.292 Y124.199 E-.09186
G1 X134.292 Y124.301 E-.06103
G1 X134.209 Y124.43 E-.09187
G1 X134.059 Y124.461 E-.09186
G1 X133.921 Y124.395 E-.09186
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.2 I-1.213 J.101 P1  F30000
G1 X134.577 Y132.264 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X134.768 Y132.165 I.502 J.734 E.00717
G3 X135.223 Y132.12 I.328 J1.019 E.01526
G3 X134.528 Y132.299 I-.144 J.877 E.16085
G1 X134.353 Y131.94 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X135.316 Y131.74 I.722 J1.053 E.03103
G3 X133.944 Y132.401 I-.237 J1.262 E.19776
G3 X134.305 Y131.975 I1.131 J.592 E.01729
M204 S10000
G1 X134.804 Y132.593 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X134.647 Y132.77 E.00727
G1 X134.591 Y133 E.00727
G1 X134.647 Y133.23 E.00727
G1 X134.804 Y133.407 E.00727
G1 X135.025 Y133.491 E.00727
G1 X135.26 Y133.462 E.00727
G1 X135.455 Y133.328 E.00727
G1 X135.565 Y133.118 E.00727
G1 X135.565 Y132.882 E.00727
G1 X135.455 Y132.672 E.00727
G1 X135.26 Y132.538 E.00726
G1 X135.023 Y132.51 E.00736
G1 X134.86 Y132.572 E.00534
G1 X135.121 Y132.937 F30000
; LINE_WIDTH: 0.625138
G1 F1200
G2 X135.128 Y133.052 I-.033 J.059 E.01373
; CHANGE_LAYER
; Z_HEIGHT: 9
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X135.048 Y133.063 E-.20368
G1 X135.012 Y133 E-.18544
G1 X135.048 Y132.937 E-.18544
G1 X135.121 Y132.937 E-.18544
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 45/55
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
G3 Z9.2 I.04 J-1.216 P1  F30000
G1 X125.805 Y132.629 Z9.2
G1 Z9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X124.542 Y133.076 I-.226 J1.371 E.24314
G3 X125.745 Y132.622 I1.058 J.983 E.04422
G1 X125.896 Y132.248 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X125.899 Y132.249 E.00009
G1 X126.219 Y132.328 E.01014
G1 X126.601 Y132.528 E.01325
G1 X126.924 Y132.814 E.01325
G1 X127.169 Y133.169 E.01325
G1 X127.321 Y133.572 E.01325
G1 X127.373 Y134 E.01325
G1 X127.321 Y134.428 E.01325
G1 X127.169 Y134.831 E.01325
G1 X126.924 Y135.186 E.01325
G1 X126.601 Y135.472 E.01325
G1 X126.219 Y135.672 E.01325
G1 X125.8 Y135.775 E.01325
G1 X125.369 Y135.775 E.01325
G1 X124.951 Y135.672 E.01325
G1 X124.569 Y135.472 E.01325
G1 X124.246 Y135.186 E.01325
G1 X124.001 Y134.831 E.01325
G1 X123.848 Y134.428 E.01325
G1 X123.796 Y134 E.01325
G1 X123.848 Y133.572 E.01325
G1 X124.001 Y133.169 E.01325
G1 X124.246 Y132.814 E.01325
G1 X124.569 Y132.528 E.01325
G1 X124.951 Y132.328 E.01325
G1 X125.369 Y132.225 E.01325
G1 X125.8 Y132.225 E.01325
G1 X125.838 Y132.234 E.00117
M204 S10000
G1 X126.152 Y133.178 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X125.838 Y133.041 E.01053
G1 X125.458 Y133.01 E.01171
G1 X125.121 Y133.124 E.01094
G1 X124.837 Y133.338 E.0109
G1 X124.658 Y133.649 E.01105
G1 X124.586 Y134 E.01099
G1 X124.658 Y134.352 E.01104
G1 X124.837 Y134.662 E.01101
G1 X125.125 Y134.878 E.01103
G1 X125.465 Y134.991 E.01101
G1 X125.823 Y134.962 E.01103
G1 X126.152 Y134.822 E.01101
G1 X126.401 Y134.563 E.01104
G1 X126.554 Y134.239 E.01101
G2 X126.554 Y133.761 I-1.465 J-.239 E.01475
G1 X126.399 Y133.435 E.0111
G1 X126.194 Y133.221 E.0091
G1 X126.048 Y133.59 F30000
G1 F1200
G1 X125.804 Y133.422 E.0091
G1 X125.498 Y133.389 E.00947
G1 X125.233 Y133.491 E.00871
G1 X125.037 Y133.712 E.0091
G1 X124.966 Y134 E.0091
G1 X125.037 Y134.288 E.0091
G1 X125.233 Y134.509 E.0091
G1 X125.51 Y134.614 E.0091
G1 X125.804 Y134.578 E.0091
G1 X126.048 Y134.41 E.0091
G1 X126.186 Y134.148 E.0091
G2 X126.186 Y133.852 I-.907 J-.148 E.00914
G1 X126.076 Y133.643 E.00726
M73 P90 R1
G1 X125.747 Y133.857 F30000
; LINE_WIDTH: 0.465417
G1 F1200
G1 X125.598 Y133.792 E.00557
G1 X125.446 Y133.837 E.00547
G1 X125.372 Y133.975 E.00539
G1 X125.423 Y134.143 E.00606
G1 X125.585 Y134.214 E.00607
G1 X125.727 Y134.16 E.00526
G1 X125.798 Y134.025 E.00525
G1 X125.764 Y133.914 E.00399
; WIPE_START
G1 F24000
G1 X125.798 Y134.025 E-.07044
G1 X125.727 Y134.16 E-.0926
G1 X125.585 Y134.214 E-.09289
G1 X125.423 Y134.143 E-.10714
G1 X125.372 Y133.975 E-.10693
G1 X125.446 Y133.837 E-.09511
G1 X125.598 Y133.792 E-.09661
G1 X125.747 Y133.857 E-.09828
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I1.217 J.008 P1  F30000
G1 X125.808 Y124.324 Z9.4
G1 Z9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X125.724 Y123.632 I-.222 J-.324 E.05339
G3 X125.855 Y124.286 I-.145 J.369 E.02626
G1 X126.031 Y124.646 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X124.973 Y124.492 I-.446 J-.646 E.03612
G1 X124.973 Y124.492 E0
G3 X125.717 Y123.226 I.614 J-.49 E.05817
G3 X126.079 Y124.61 I-.132 J.774 E.05528
M204 S10000
; WIPE_START
G1 F24000
G1 X125.864 Y124.737 E-.09472
G1 X125.68 Y124.783 E-.07222
G1 X125.49 Y124.783 E-.07223
G1 X125.305 Y124.737 E-.07223
G1 X125.137 Y124.649 E-.07223
G1 X124.973 Y124.492 E-.08624
G1 X124.973 Y124.492 E0
G1 X124.887 Y124.366 E-.05787
G1 X124.819 Y124.189 E-.07223
G1 X124.796 Y124 E-.07223
G1 X124.819 Y123.811 E-.07223
G1 X124.834 Y123.773 E-.01557
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I-.144 J1.208 P1  F30000
G1 X133.858 Y124.849 Z9.4
G1 Z9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X134.313 Y123.648 I.23 J-.599 E.06672
G3 X134.45 Y124.78 I-.237 J.603 E.04621
G3 X133.915 Y124.868 I-.362 J-.53 E.01859
G1 X133.718 Y125.218 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X133.495 Y123.395 I.36 J-.969 E.06945
G3 X134.262 Y123.232 I.578 J.833 E.02475
G3 X133.775 Y125.237 I-.184 J1.017 E.10354
M204 S10000
G1 X133.921 Y124.395 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.468643
G1 F1200
G1 X134.059 Y124.461 E.00532
G1 X134.209 Y124.43 E.00532
G1 X134.292 Y124.301 E.00532
G1 X134.292 Y124.199 E.00353
G1 X134.209 Y124.07 E.00532
G1 X134.059 Y124.039 E.00532
G1 X133.921 Y124.105 E.00532
G1 X133.872 Y124.25 E.00532
G1 X133.902 Y124.338 E.00324
; WIPE_START
G1 F24000
G1 X133.872 Y124.25 E-.05592
G1 X133.921 Y124.105 E-.09186
G1 X134.059 Y124.039 E-.09186
G1 X134.209 Y124.07 E-.09187
G1 X134.292 Y124.199 E-.09186
G1 X134.292 Y124.301 E-.06104
G1 X134.209 Y124.43 E-.09186
G1 X134.059 Y124.461 E-.09186
G1 X133.921 Y124.395 E-.09187
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I-1.213 J.101 P1  F30000
G1 X134.577 Y132.264 Z9.4
G1 Z9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X134.768 Y132.165 I.503 J.735 E.00717
G3 X135.214 Y132.118 I.336 J1.066 E.01497
G3 X134.529 Y132.299 I-.134 J.881 E.16146
G1 X134.356 Y131.944 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X135.308 Y131.738 I.738 J1.102 E.03064
G3 X134.12 Y132.146 I-.229 J1.263 E.20758
G3 X134.307 Y131.979 I.973 J.9 E.00771
M204 S10000
G1 X134.804 Y132.593 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X134.647 Y132.77 E.00727
G1 X134.591 Y133 E.00727
G1 X134.647 Y133.23 E.00727
G1 X134.804 Y133.407 E.00727
G1 X135.025 Y133.491 E.00727
G1 X135.26 Y133.462 E.00727
G1 X135.455 Y133.328 E.00727
G1 X135.565 Y133.118 E.00727
G1 X135.565 Y132.882 E.00727
G1 X135.455 Y132.672 E.00727
G1 X135.26 Y132.538 E.00726
G1 X135.023 Y132.51 E.00733
G1 X134.86 Y132.572 E.00536
G1 X135.121 Y132.937 F30000
; LINE_WIDTH: 0.62528
G1 F1200
G2 X135.128 Y133.052 I-.033 J.06 E.01374
; CHANGE_LAYER
; Z_HEIGHT: 9.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X135.048 Y133.063 E-.2037
G1 X135.012 Y133 E-.18543
G1 X135.048 Y132.937 E-.18544
G1 X135.121 Y132.937 E-.18543
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 46/55
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
G3 Z9.4 I.04 J-1.216 P1  F30000
G1 X125.793 Y132.627 Z9.4
G1 Z9.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X124.793 Y132.853 I-.215 J1.372 E.25457
G3 X125.734 Y132.618 I.781 J1.126 E.03287
G1 X125.885 Y132.245 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X125.887 Y132.246 E.00007
G1 X126.219 Y132.328 E.01051
G1 X126.601 Y132.528 E.01325
G1 X126.924 Y132.814 E.01325
G1 X127.169 Y133.169 E.01325
G1 X127.321 Y133.572 E.01325
G1 X127.373 Y134 E.01325
G1 X127.321 Y134.428 E.01325
G1 X127.169 Y134.831 E.01325
G1 X126.924 Y135.186 E.01325
G1 X126.601 Y135.472 E.01325
G1 X126.219 Y135.672 E.01325
G1 X125.8 Y135.775 E.01325
G1 X125.369 Y135.775 E.01325
G1 X124.951 Y135.672 E.01325
G1 X124.569 Y135.472 E.01325
G1 X124.246 Y135.186 E.01325
G1 X124.001 Y134.831 E.01325
G1 X123.848 Y134.428 E.01325
G1 X123.796 Y134 E.01325
G1 X123.848 Y133.572 E.01325
G1 X124.001 Y133.169 E.01325
G1 X124.246 Y132.814 E.01325
G1 X124.569 Y132.528 E.01325
G1 X124.951 Y132.328 E.01325
G1 X125.369 Y132.225 E.01325
G1 X125.8 Y132.225 E.01325
G1 X125.826 Y132.231 E.00082
M204 S10000
; WIPE_START
G1 F24000
G1 X125.887 Y132.246 E-.0237
G1 X126.219 Y132.328 E-.13001
G1 X126.601 Y132.528 E-.16384
G1 X126.924 Y132.814 E-.16384
G1 X127.169 Y133.169 E-.16384
G1 X127.276 Y133.451 E-.11477
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.6 I-.294 J-1.181 P1  F30000
G1 X125.724 Y133.837 Z9.6
G1 Z9.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.46611
G1 F1200
G1 X125.599 Y133.791 E.0046
G1 X125.445 Y133.838 E.00553
G1 X125.372 Y133.975 E.00536
G1 X125.424 Y134.143 E.00606
G1 X125.585 Y134.214 E.00609
G1 X125.746 Y134.143 E.00607
G1 X125.797 Y133.975 E.00606
G1 X125.752 Y133.89 E.00331
G1 X125.936 Y133.491 F30000
; LINE_WIDTH: 0.419999
G1 F1200
G1 X125.69 Y133.393 E.00815
G2 X125.366 Y133.422 I-.069 J1.086 E.01004
G1 X125.122 Y133.59 E.0091
G1 X124.984 Y133.852 E.0091
G1 X124.984 Y134.148 E.0091
G1 X125.122 Y134.41 E.0091
G1 X125.366 Y134.578 E.0091
G1 X125.659 Y134.614 E.0091
G1 X125.936 Y134.509 E.0091
G1 X126.133 Y134.288 E.0091
G1 X126.204 Y134 E.0091
G1 X126.133 Y133.712 E.0091
G1 X125.976 Y133.536 E.00726
G1 X126.152 Y133.178 F30000
G1 F1200
G1 X125.834 Y133.04 E.01065
G2 X125.018 Y133.178 I-.222 J1.17 E.02598
G1 X124.769 Y133.438 E.01106
G1 X124.615 Y133.761 E.01099
G1 X124.601 Y134.12 E.01104
G1 X124.701 Y134.464 E.01101
G1 X124.928 Y134.742 E.01103
G1 X125.231 Y134.934 E.01101
G1 X125.585 Y134.991 E.01103
G1 X125.939 Y134.934 E.01101
G1 X126.243 Y134.742 E.01103
G1 X126.469 Y134.464 E.01101
G1 X126.569 Y134.119 E.01104
G1 X126.554 Y133.761 E.011
G1 X126.4 Y133.435 E.01108
G1 X126.194 Y133.221 E.00912
; WIPE_START
G1 F24000
G1 X126.4 Y133.435 E-.11281
G1 X126.554 Y133.761 E-.13703
G1 X126.569 Y134.119 E-.13609
G1 X126.469 Y134.464 E-.13656
G1 X126.243 Y134.742 E-.13618
G1 X126.017 Y134.884 E-.10132
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.6 I1.217 J-.025 P1  F30000
G1 X125.802 Y124.314 Z9.6
G1 Z9.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X125.724 Y124.365 E.0031
G3 X125.632 Y123.609 I-.138 J-.367 E.04711
G1 X125.724 Y123.632 E.00315
G3 X125.878 Y124.26 I-.139 J.367 E.02518
G1 X125.851 Y124.279 E.00112
G1 X126.029 Y124.643 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X125.305 Y123.263 I-.45 J-.644 E.08198
G3 X125.711 Y123.225 I.287 J.881 E.01262
G3 X126.077 Y124.607 I-.132 J.774 E.05518
M204 S10000
; WIPE_START
G1 F24000
G1 X125.865 Y124.737 E-.09461
G1 X125.68 Y124.783 E-.07223
G1 X125.49 Y124.783 E-.07223
G1 X125.305 Y124.737 E-.07223
G1 X125.137 Y124.649 E-.07223
G1 X124.977 Y124.497 E-.084
G1 X124.887 Y124.366 E-.06016
G1 X124.819 Y124.189 E-.07223
G1 X124.796 Y124 E-.07223
G1 X124.819 Y123.811 E-.07223
G1 X124.834 Y123.773 E-.01563
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.6 I-.144 J1.208 P1  F30000
G1 X133.858 Y124.849 Z9.6
G1 Z9.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X134.313 Y123.648 I.23 J-.599 E.06672
G3 X134.45 Y124.78 I-.237 J.603 E.04621
G3 X133.915 Y124.868 I-.362 J-.53 E.01859
G1 X133.717 Y125.22 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X133.495 Y123.395 I.362 J-.97 E.0695
G3 X134.255 Y123.23 I.579 J.835 E.02452
G3 X133.774 Y125.239 I-.176 J1.02 E.10398
M204 S10000
G1 X133.921 Y124.395 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.468642
G1 F1200
G1 X134.059 Y124.461 E.00532
G1 X134.209 Y124.43 E.00532
G1 X134.292 Y124.301 E.00532
G1 X134.292 Y124.199 E.00353
G1 X134.209 Y124.07 E.00532
G1 X134.059 Y124.039 E.00532
G1 X133.921 Y124.105 E.00532
G1 X133.872 Y124.25 E.00532
G1 X133.902 Y124.338 E.00324
; WIPE_START
G1 F24000
G1 X133.872 Y124.25 E-.05592
G1 X133.921 Y124.105 E-.09187
G1 X134.059 Y124.039 E-.09186
G1 X134.209 Y124.07 E-.09186
G1 X134.292 Y124.199 E-.09186
G1 X134.292 Y124.301 E-.06104
G1 X134.209 Y124.43 E-.09186
G1 X134.059 Y124.461 E-.09186
G1 X133.921 Y124.395 E-.09187
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.6 I-1.213 J.101 P1  F30000
G1 X134.578 Y132.266 Z9.6
G1 Z9.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X135.193 Y132.113 I.508 J.731 E.02148
G1 X135.402 Y132.165 E.00715
G3 X134.53 Y132.301 I-.316 J.832 E.15492
G1 X134.356 Y131.944 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X135.299 Y131.735 I.74 J1.105 E.03036
G3 X134.12 Y132.146 I-.22 J1.265 E.20793
G3 X134.307 Y131.979 I.975 J.904 E.0077
M204 S10000
G1 X134.715 Y132.672 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X134.605 Y132.882 E.00727
G1 X134.605 Y133.118 E.00727
G1 X134.715 Y133.328 E.00727
G1 X134.91 Y133.462 E.00727
G1 X135.144 Y133.491 E.00727
G1 X135.366 Y133.407 E.00727
G1 X135.523 Y133.23 E.00727
G1 X135.579 Y133 E.00727
G1 X135.523 Y132.77 E.00727
G1 X135.366 Y132.593 E.00727
G1 X135.144 Y132.509 E.00727
G1 X134.91 Y132.538 E.00727
G1 X134.764 Y132.638 E.00543
G1 X135.121 Y132.937 F30000
; LINE_WIDTH: 0.625676
G1 F1200
M73 P91 R1
G2 X135.128 Y133.052 I-.033 J.06 E.01376
; CHANGE_LAYER
; Z_HEIGHT: 9.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X135.048 Y133.063 E-.20374
G1 X135.012 Y133 E-.18542
G1 X135.048 Y132.937 E-.18542
G1 X135.121 Y132.937 E-.18542
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 47/55
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
G3 Z9.6 I.041 J-1.216 P1  F30000
G1 X125.781 Y132.624 Z9.6
G1 Z9.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X124.793 Y132.853 I-.201 J1.375 E.25522
G3 X125.722 Y132.616 I.783 J1.131 E.03248
G1 X125.873 Y132.243 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X125.875 Y132.243 E.00005
G1 X126.219 Y132.328 E.01088
G1 X126.601 Y132.528 E.01325
G1 X126.924 Y132.814 E.01325
G1 X127.169 Y133.169 E.01325
G1 X127.321 Y133.572 E.01325
G1 X127.373 Y134 E.01325
G1 X127.321 Y134.428 E.01325
G1 X127.169 Y134.831 E.01325
G1 X126.924 Y135.186 E.01325
G1 X126.601 Y135.472 E.01325
G1 X126.219 Y135.672 E.01325
G1 X125.8 Y135.775 E.01325
G1 X125.369 Y135.775 E.01325
G1 X124.951 Y135.672 E.01325
G1 X124.569 Y135.472 E.01325
G1 X124.246 Y135.186 E.01325
G1 X124.203 Y135.123 E.00236
G1 X124.001 Y134.831 E.01088
G1 X123.848 Y134.428 E.01325
G1 X123.796 Y134 E.01325
G1 X123.848 Y133.572 E.01325
G1 X124.001 Y133.169 E.01325
G1 X124.045 Y133.106 E.00236
G1 X124.246 Y132.814 E.01088
G1 X124.569 Y132.528 E.01325
G1 X124.951 Y132.328 E.01325
G1 X125.369 Y132.225 E.01325
G1 X125.8 Y132.225 E.01325
G1 X125.815 Y132.228 E.00047
M204 S10000
; WIPE_START
G1 F24000
G1 X125.875 Y132.243 E-.02347
G1 X126.219 Y132.328 E-.13459
G1 X126.601 Y132.528 E-.16384
G1 X126.924 Y132.814 E-.16384
G1 X127.169 Y133.169 E-.16384
G1 X127.272 Y133.441 E-.11043
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.8 I-.289 J-1.182 P1  F30000
G1 X125.707 Y133.822 Z9.8
G1 Z9.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.465983
G1 F1200
G1 X125.527 Y133.794 E.00629
G1 X125.394 Y133.9 E.00588
G1 X125.384 Y134.073 E.006
G1 X125.508 Y134.202 E.00616
G1 X125.684 Y134.19 E.00606
G1 X125.785 Y134.076 E.00527
G2 X125.738 Y133.874 I-.155 J-.07 E.00767
G1 X125.936 Y133.491 F30000
; LINE_WIDTH: 0.419999
G1 F1200
G1 X125.681 Y133.391 E.00843
G1 X125.366 Y133.422 E.00973
G1 X125.122 Y133.59 E.0091
G1 X124.984 Y133.852 E.0091
G1 X124.984 Y134.148 E.0091
G1 X125.109 Y134.392 E.00843
G1 X125.366 Y134.578 E.00973
G1 X125.659 Y134.614 E.0091
G1 X125.936 Y134.509 E.0091
G1 X126.133 Y134.288 E.0091
G1 X126.204 Y134 E.0091
G2 X126.133 Y133.712 I-.917 J.073 E.00914
G1 X125.976 Y133.536 E.00726
G1 X126.24 Y133.256 F30000
G1 F1200
G1 X125.939 Y133.066 E.01094
G1 X125.584 Y133.012 E.01104
G1 X125.231 Y133.066 E.01097
G1 X124.927 Y133.259 E.01106
G1 X124.701 Y133.536 E.01099
G1 X124.601 Y133.882 E.01106
G1 X124.615 Y134.239 E.01098
G1 X124.764 Y134.556 E.01077
G1 X125.021 Y134.824 E.01139
G1 X125.35 Y134.963 E.01098
G1 X125.705 Y134.991 E.01095
G1 X126.046 Y134.877 E.01104
G1 X126.332 Y134.662 E.01101
G1 X126.512 Y134.351 E.01103
G1 X126.583 Y134 E.01101
G2 X126.469 Y133.536 I-1.481 J.119 E.01475
G1 X126.278 Y133.303 E.00926
; WIPE_START
G1 F24000
G1 X126.469 Y133.536 E-.11452
G1 X126.569 Y133.88 E-.13611
G1 X126.583 Y134 E-.04595
G1 X126.512 Y134.351 E-.13619
G1 X126.332 Y134.662 E-.13645
G1 X126.046 Y134.877 E-.13612
G1 X125.91 Y134.923 E-.05466
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.8 I1.217 J-.012 P1  F30000
G1 X125.802 Y124.314 Z9.8
G1 Z9.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X125.724 Y124.365 E.0031
G3 X125.632 Y123.609 I-.138 J-.367 E.04711
G1 X125.724 Y123.632 E.00315
G3 X125.878 Y124.26 I-.139 J.367 E.02518
G1 X125.851 Y124.279 E.00112
G1 X126.029 Y124.644 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X125.305 Y123.263 I-.45 J-.645 E.08198
G3 X125.705 Y123.223 I.291 J.906 E.01243
G1 X125.705 Y123.223 E0
G3 X126.077 Y124.608 I-.125 J.776 E.05544
M204 S10000
; WIPE_START
G1 F24000
G1 X125.864 Y124.737 E-.09464
G1 X125.68 Y124.783 E-.07223
G1 X125.49 Y124.783 E-.07223
G1 X125.305 Y124.737 E-.07223
G1 X125.137 Y124.649 E-.07223
G1 X124.98 Y124.502 E-.08176
G1 X124.887 Y124.366 E-.06245
G1 X124.819 Y124.189 E-.07223
G1 X124.796 Y124 E-.07223
G1 X124.819 Y123.811 E-.07223
G1 X124.834 Y123.773 E-.01555
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.8 I-.144 J1.208 P1  F30000
G1 X133.858 Y124.849 Z9.8
G1 Z9.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X134.313 Y123.648 I.23 J-.599 E.06672
G3 X134.45 Y124.78 I-.237 J.603 E.04621
G3 X133.915 Y124.868 I-.362 J-.53 E.01859
G1 X133.717 Y125.219 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X133.717 Y123.279 I.36 J-.97 E.07729
G3 X134.247 Y123.228 I.38 J1.173 E.01652
G3 X133.774 Y125.239 I-.17 J1.021 E.10409
M204 S10000
G1 X133.964 Y124.425 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.46864
G1 F1200
G1 X134.111 Y124.468 E.00532
G1 X134.244 Y124.391 E.00532
G1 X134.292 Y124.301 E.00353
G1 X134.279 Y124.148 E.00532
G1 X134.16 Y124.051 E.00532
G1 X134.007 Y124.045 E.00532
G1 X133.896 Y124.151 E.00532
G1 X133.872 Y124.302 E.00532
G1 X133.928 Y124.377 E.00324
; WIPE_START
G1 F24000
G1 X133.872 Y124.302 E-.05592
G1 X133.896 Y124.151 E-.09186
G1 X134.007 Y124.045 E-.09187
G1 X134.16 Y124.051 E-.09186
G1 X134.279 Y124.148 E-.09187
G1 X134.292 Y124.301 E-.09186
G1 X134.244 Y124.391 E-.06104
M73 P91 R0
G1 X134.111 Y124.468 E-.09186
G1 X133.964 Y124.425 E-.09187
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.8 I-1.213 J.095 P1  F30000
G1 X134.578 Y132.266 Z9.8
G1 Z9.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X135.193 Y132.113 I.508 J.731 E.02148
G1 X135.402 Y132.165 E.00715
G3 X134.53 Y132.301 I-.316 J.832 E.15492
G1 X134.356 Y131.945 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X135.29 Y131.733 I.742 J1.109 E.03009
G3 X134.12 Y132.146 I-.211 J1.267 E.20817
G3 X134.307 Y131.979 I.978 J.908 E.0077
M204 S10000
G1 X134.715 Y132.672 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X134.605 Y132.882 E.00727
G1 X134.605 Y133.118 E.00727
G1 X134.715 Y133.328 E.00727
G1 X134.91 Y133.462 E.00727
G1 X135.144 Y133.491 E.00727
G1 X135.366 Y133.407 E.00727
G1 X135.523 Y133.23 E.00727
G1 X135.579 Y133 E.00727
G1 X135.523 Y132.77 E.00727
G1 X135.366 Y132.593 E.00727
G1 X135.144 Y132.509 E.00727
G1 X134.91 Y132.538 E.00727
G1 X134.764 Y132.638 E.00543
G1 X135.121 Y132.937 F30000
; LINE_WIDTH: 0.625674
G1 F1200
G2 X135.128 Y133.052 I-.033 J.06 E.01376
; CHANGE_LAYER
; Z_HEIGHT: 9.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X135.048 Y133.063 E-.20374
G1 X135.012 Y133 E-.18542
G1 X135.048 Y132.937 E-.18542
G1 X135.121 Y132.937 E-.18542
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 48/55
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
G3 Z9.8 I.041 J-1.216 P1  F30000
G1 X125.77 Y132.621 Z9.8
G1 Z9.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X125.091 Y132.697 I-.189 J1.377 E.26678
G3 X125.71 Y132.614 I.487 J1.273 E.02092
G1 X125.864 Y132.24 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X126.219 Y132.328 E.01125
G1 X126.601 Y132.528 E.01325
G1 X126.924 Y132.814 E.01325
G1 X127.169 Y133.169 E.01325
G1 X127.321 Y133.572 E.01325
G1 X127.373 Y134 E.01325
G1 X127.321 Y134.428 E.01325
G1 X127.169 Y134.831 E.01325
G1 X126.924 Y135.186 E.01325
G1 X126.601 Y135.472 E.01325
G1 X126.219 Y135.672 E.01325
G1 X125.8 Y135.775 E.01325
G1 X125.369 Y135.775 E.01325
G1 X124.951 Y135.672 E.01325
G1 X124.569 Y135.472 E.01325
G1 X124.246 Y135.186 E.01325
G1 X124.001 Y134.831 E.01325
G1 X123.848 Y134.428 E.01325
G1 X123.796 Y134 E.01325
G1 X123.848 Y133.572 E.01325
G1 X124.001 Y133.169 E.01325
G1 X124.246 Y132.814 E.01325
G1 X124.569 Y132.528 E.01325
G1 X124.951 Y132.328 E.01325
G1 X125.369 Y132.225 E.01325
G1 X125.8 Y132.225 E.01325
G1 X125.805 Y132.226 E.00015
M204 S10000
; WIPE_START
G1 F24000
G1 X126.219 Y132.328 E-.16197
G1 X126.601 Y132.528 E-.16384
G1 X126.924 Y132.814 E-.16384
G1 X127.169 Y133.169 E-.16384
G1 X127.268 Y133.431 E-.10652
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10 I-.297 J-1.18 P1  F30000
G1 X125.707 Y133.823 Z10
G1 Z9.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.467529
G1 F1200
G1 X125.53 Y133.794 E.00621
G1 X125.395 Y133.9 E.00595
G1 X125.385 Y134.076 E.00609
G1 X125.509 Y134.201 E.00608
G1 X125.684 Y134.189 E.00609
G1 X125.794 Y134.051 E.00608
G2 X125.738 Y133.875 I-.164 J-.045 E.00678
G1 X125.936 Y133.491 F30000
; LINE_WIDTH: 0.419999
G1 F1200
G1 X125.672 Y133.389 E.00871
G1 X125.366 Y133.422 E.00947
G1 X125.122 Y133.59 E.0091
G1 X124.984 Y133.852 E.0091
G1 X124.984 Y134.148 E.0091
G1 X125.122 Y134.41 E.0091
G1 X125.366 Y134.578 E.0091
G1 X125.659 Y134.614 E.0091
G1 X125.936 Y134.509 E.0091
G1 X126.133 Y134.288 E.0091
G1 X126.204 Y134 E.0091
G2 X126.133 Y133.712 I-.918 J.074 E.00914
G1 X125.976 Y133.536 E.00726
G1 X126.241 Y133.257 F30000
G1 F1200
G1 X125.939 Y133.066 E.01098
G1 X125.584 Y133.011 E.01103
G1 X125.231 Y133.066 E.011
G1 X124.927 Y133.259 E.01105
G1 X124.701 Y133.536 E.011
G1 X124.601 Y133.881 E.01103
G1 X124.615 Y134.239 E.01102
G1 X124.769 Y134.563 E.01103
G1 X125.018 Y134.822 E.01102
G1 X125.348 Y134.962 E.01103
G1 X125.705 Y134.991 E.01102
M73 P92 R0
G1 X126.046 Y134.878 E.01103
G1 X126.332 Y134.662 E.01102
G1 X126.512 Y134.351 E.01103
G1 X126.583 Y134 E.01102
G2 X126.469 Y133.536 I-1.482 J.119 E.01475
G1 X126.279 Y133.303 E.00923
; WIPE_START
G1 F24000
G1 X126.469 Y133.536 E-.1141
G1 X126.569 Y133.88 E-.1362
G1 X126.583 Y134 E-.04586
G1 X126.512 Y134.351 E-.13625
G1 X126.332 Y134.662 E-.1364
G1 X126.046 Y134.878 E-.13627
G1 X125.909 Y134.923 E-.05493
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10 I1.217 J-.012 P1  F30000
G1 X125.802 Y124.314 Z10
G1 Z9.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X125.724 Y124.365 E.0031
G3 X125.632 Y123.609 I-.138 J-.367 E.04711
G1 X125.724 Y123.632 E.00315
G3 X125.878 Y124.26 I-.139 J.367 E.02518
G1 X125.851 Y124.279 E.00112
G1 X126.03 Y124.644 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X124.984 Y124.507 I-.447 J-.646 E.03555
G1 X124.984 Y124.507 E0
G3 X125.699 Y123.222 I.606 J-.504 E.05821
G3 X126.078 Y124.608 I-.117 J.777 E.05575
M204 S10000
; WIPE_START
G1 F24000
G1 X125.865 Y124.737 E-.09466
G1 X125.68 Y124.783 E-.07223
G1 X125.49 Y124.783 E-.07223
G1 X125.305 Y124.737 E-.07223
G1 X125.137 Y124.649 E-.07223
G1 X124.984 Y124.507 E-.07952
G1 X124.984 Y124.507 E0
G1 X124.887 Y124.366 E-.06474
G1 X124.819 Y124.189 E-.07223
G1 X124.796 Y124 E-.07223
G1 X124.819 Y123.811 E-.07223
G1 X124.834 Y123.773 E-.01547
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10 I-.144 J1.208 P1  F30000
G1 X133.858 Y124.849 Z10
G1 Z9.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X134.313 Y123.648 I.23 J-.599 E.06672
G3 X134.45 Y124.78 I-.237 J.603 E.04621
G3 X133.915 Y124.868 I-.362 J-.53 E.01859
G1 X133.717 Y125.22 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X133.717 Y123.279 I.361 J-.97 E.07726
G3 X134.24 Y123.227 I.385 J1.208 E.01629
G3 X133.774 Y125.239 I-.162 J1.023 E.10445
M204 S10000
G1 X133.921 Y124.395 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.468641
G1 F1200
G1 X134.059 Y124.461 E.00532
G1 X134.209 Y124.43 E.00532
G1 X134.292 Y124.301 E.00532
G1 X134.292 Y124.199 E.00353
G1 X134.209 Y124.07 E.00532
G1 X134.059 Y124.039 E.00532
G1 X133.921 Y124.105 E.00532
G1 X133.872 Y124.25 E.00532
G1 X133.902 Y124.339 E.00324
; WIPE_START
G1 F24000
G1 X133.872 Y124.25 E-.05592
G1 X133.921 Y124.105 E-.09187
G1 X134.059 Y124.039 E-.09186
G1 X134.209 Y124.07 E-.09187
G1 X134.292 Y124.199 E-.09186
G1 X134.292 Y124.301 E-.06104
G1 X134.209 Y124.43 E-.09186
G1 X134.059 Y124.461 E-.09185
G1 X133.921 Y124.395 E-.09187
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10 I-1.213 J.101 P1  F30000
G1 X134.578 Y132.266 Z10
G1 Z9.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X135.193 Y132.113 I.508 J.731 E.02148
G1 X135.402 Y132.165 E.00715
G3 X134.53 Y132.301 I-.316 J.832 E.15492
G1 X134.353 Y131.94 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X135.281 Y131.731 I.721 J1.04 E.02997
G3 X134.304 Y131.975 I-.203 J1.268 E.21616
M204 S10000
G1 X134.715 Y132.672 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X134.605 Y132.882 E.00727
G1 X134.605 Y133.118 E.00727
G1 X134.715 Y133.328 E.00727
G1 X134.91 Y133.462 E.00727
G1 X135.144 Y133.491 E.00727
G1 X135.366 Y133.407 E.00727
G1 X135.523 Y133.23 E.00727
G1 X135.579 Y133 E.00727
G1 X135.523 Y132.77 E.00727
G1 X135.366 Y132.593 E.00727
G1 X135.144 Y132.509 E.00727
G1 X134.91 Y132.538 E.00727
G1 X134.764 Y132.638 E.00543
G1 X135.121 Y132.937 F30000
; LINE_WIDTH: 0.625674
G1 F1200
G2 X135.128 Y133.052 I-.033 J.06 E.01376
; CHANGE_LAYER
; Z_HEIGHT: 9.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X135.048 Y133.063 E-.20374
G1 X135.012 Y133 E-.18542
G1 X135.048 Y132.937 E-.18542
G1 X135.121 Y132.937 E-.18542
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 49/55
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
G3 Z10 I.041 J-1.216 P1  F30000
G1 X125.758 Y132.618 Z10
G1 Z9.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X126.079 Y132.697 E.01096
G3 X125.699 Y132.611 I-.493 J1.298 E.27642
G1 X125.852 Y132.237 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X126.219 Y132.328 E.01162
G1 X126.601 Y132.528 E.01325
G1 X126.924 Y132.814 E.01325
G1 X127.169 Y133.169 E.01325
G1 X127.321 Y133.572 E.01325
G1 X127.373 Y134 E.01325
G1 X127.321 Y134.428 E.01325
G1 X127.169 Y134.831 E.01325
G1 X126.924 Y135.186 E.01325
G1 X126.601 Y135.472 E.01325
G1 X126.219 Y135.672 E.01325
G1 X125.8 Y135.775 E.01325
G1 X125.369 Y135.775 E.01325
G1 X124.951 Y135.672 E.01325
G1 X124.569 Y135.472 E.01325
G1 X124.246 Y135.186 E.01325
G1 X124.001 Y134.831 E.01325
G1 X123.848 Y134.428 E.01325
G1 X123.796 Y134 E.01325
G1 X123.848 Y133.572 E.01325
G1 X124.001 Y133.169 E.01325
G1 X124.246 Y132.814 E.01325
G1 X124.569 Y132.528 E.01325
G1 X124.951 Y132.328 E.01325
G1 X125.369 Y132.225 E.01325
G1 X125.792 Y132.236 E.01299
M204 S10000
; WIPE_START
G1 F24000
G1 X126.219 Y132.328 E-.1661
G1 X126.601 Y132.528 E-.16384
G1 X126.924 Y132.814 E-.16384
G1 X127.169 Y133.169 E-.16384
G1 X127.264 Y133.421 E-.10239
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.2 I.259 J-1.189 P1  F30000
G1 X126.152 Y133.178 Z10.2
G1 Z9.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X125.822 Y133.038 E.01102
G1 X125.465 Y133.009 E.01102
G1 X125.124 Y133.122 E.01102
G1 X124.837 Y133.338 E.01102
G1 X124.658 Y133.648 E.01102
G1 X124.586 Y134 E.01102
G1 X124.658 Y134.352 E.01102
G1 X124.837 Y134.662 E.01102
G1 X125.124 Y134.878 E.01102
G1 X125.465 Y134.991 E.01102
G1 X125.822 Y134.962 E.01102
G1 X126.152 Y134.822 E.01102
G1 X126.401 Y134.563 E.01102
G1 X126.554 Y134.239 E.01102
G2 X126.554 Y133.761 I-1.469 J-.239 E.01475
G1 X126.401 Y133.437 E.01102
G1 X126.194 Y133.221 E.00918
G1 X126.048 Y133.59 F30000
G1 F1200
G1 X125.804 Y133.422 E.0091
G1 X125.51 Y133.386 E.0091
G1 X125.233 Y133.491 E.0091
G1 X125.037 Y133.712 E.0091
G1 X124.966 Y134 E.0091
G1 X125.037 Y134.288 E.0091
G1 X125.233 Y134.509 E.0091
G1 X125.51 Y134.614 E.0091
G1 X125.804 Y134.578 E.0091
G1 X126.048 Y134.41 E.0091
G1 X126.186 Y134.148 E.0091
G2 X126.186 Y133.852 I-.91 J-.148 E.00914
G1 X126.076 Y133.643 E.00726
G1 X125.745 Y133.858 F30000
; LINE_WIDTH: 0.468554
G1 F1200
G1 X125.585 Y133.787 E.00608
G1 X125.424 Y133.858 E.00608
G1 X125.374 Y134.026 E.00608
G1 X125.463 Y134.176 E.00608
G1 X125.636 Y134.207 E.00608
G1 X125.775 Y134.1 E.00608
G2 X125.763 Y133.915 I-.148 J-.083 E.00678
; WIPE_START
G1 F24000
G1 X125.796 Y134.026 E-.07044
G1 X125.775 Y134.1 E-.04705
G1 X125.636 Y134.207 E-.10708
G1 X125.463 Y134.176 E-.10708
G1 X125.374 Y134.026 E-.10709
G1 X125.424 Y133.858 E-.10709
G1 X125.585 Y133.787 E-.10708
G1 X125.745 Y133.858 E-.10709
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.2 I1.217 J.008 P1  F30000
G1 X125.807 Y124.322 Z10.2
G1 Z9.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X125.632 Y123.609 I-.222 J-.323 E.05025
G1 X125.724 Y123.632 E.00315
G3 X125.854 Y124.284 I-.139 J.367 E.02632
G1 X126.029 Y124.643 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X125.49 Y123.217 I-.45 J-.645 E.08788
G3 X125.693 Y123.221 I.095 J.414 E.00631
G3 X126.077 Y124.607 I-.114 J.778 E.05582
M204 S10000
; WIPE_START
G1 F24000
G1 X125.864 Y124.737 E-.09463
G1 X125.68 Y124.783 E-.07223
G1 X125.49 Y124.783 E-.07223
G1 X125.305 Y124.737 E-.07223
G1 X125.137 Y124.649 E-.07223
G1 X124.995 Y124.523 E-.07223
G1 X124.887 Y124.366 E-.07223
G1 X124.819 Y124.189 E-.07223
G1 X124.796 Y124 E-.07223
G1 X124.819 Y123.811 E-.07223
G1 X124.834 Y123.774 E-.01531
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.2 I-.144 J1.208 P1  F30000
G1 X133.858 Y124.849 Z10.2
G1 Z9.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X134.313 Y123.648 I.23 J-.599 E.06672
G3 X134.45 Y124.78 I-.237 J.603 E.04621
G3 X133.915 Y124.868 I-.362 J-.53 E.01859
G1 X133.718 Y125.219 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X133.717 Y123.279 I.362 J-.97 E.07719
G3 X134.233 Y123.225 I.393 J1.251 E.01605
G3 X133.774 Y125.238 I-.153 J1.024 E.10474
M204 S10000
G1 X133.921 Y124.395 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.468641
G1 F1200
G1 X134.059 Y124.461 E.00532
G1 X134.209 Y124.43 E.00532
G1 X134.292 Y124.301 E.00532
G1 X134.292 Y124.199 E.00353
G1 X134.209 Y124.07 E.00532
G1 X134.059 Y124.039 E.00532
G1 X133.921 Y124.105 E.00532
G1 X133.872 Y124.25 E.00532
G1 X133.902 Y124.338 E.00324
; WIPE_START
G1 F24000
G1 X133.872 Y124.25 E-.05592
G1 X133.921 Y124.105 E-.09186
G1 X134.059 Y124.039 E-.09187
G1 X134.209 Y124.07 E-.09186
G1 X134.292 Y124.199 E-.09186
G1 X134.292 Y124.301 E-.06104
G1 X134.209 Y124.43 E-.09186
G1 X134.059 Y124.461 E-.09186
G1 X133.921 Y124.395 E-.09187
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.2 I-1.213 J.101 P1  F30000
G1 X134.578 Y132.266 Z10.2
G1 Z9.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X135.193 Y132.113 I.508 J.731 E.02148
G1 X135.402 Y132.165 E.00714
G3 X134.53 Y132.301 I-.316 J.832 E.15492
G1 X134.353 Y131.94 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X135.273 Y131.729 I.723 J1.043 E.0297
G3 X134.304 Y131.975 I-.193 J1.272 E.21677
M204 S10000
G1 X134.715 Y132.672 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X134.605 Y132.882 E.00727
G1 X134.605 Y133.118 E.00727
G1 X134.715 Y133.328 E.00727
G1 X134.91 Y133.462 E.00727
G1 X135.144 Y133.491 E.00727
G1 X135.366 Y133.407 E.00727
G1 X135.523 Y133.23 E.00727
G1 X135.579 Y133 E.00727
G1 X135.523 Y132.77 E.00727
G1 X135.366 Y132.593 E.00727
G1 X135.144 Y132.509 E.00727
G1 X134.91 Y132.538 E.00727
G1 X134.764 Y132.638 E.00543
; CHANGE_LAYER
; Z_HEIGHT: 10
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X134.91 Y132.538 E-.0671
G1 X135.144 Y132.509 E-.0899
G1 X135.366 Y132.593 E-.0899
G1 X135.523 Y132.77 E-.0899
G1 X135.579 Y133 E-.0899
G1 X135.523 Y133.23 E-.0899
G1 X135.366 Y133.407 E-.0899
G1 X135.144 Y133.491 E-.0899
G1 X134.978 Y133.471 E-.0636
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 50/55
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
G3 Z10.2 I.112 J-1.212 P1  F30000
G1 X125.753 Y132.617 Z10.2
M73 P93 R0
G1 Z10
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X126.079 Y132.697 E.01114
G3 X125.693 Y132.611 I-.493 J1.298 E.27623
G1 X125.842 Y132.235 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X126.219 Y132.328 E.01194
G1 X126.601 Y132.528 E.01325
G1 X126.924 Y132.814 E.01325
G1 X127.169 Y133.169 E.01325
G1 X127.321 Y133.572 E.01325
G1 X127.373 Y134 E.01325
G1 X127.321 Y134.428 E.01325
G1 X127.169 Y134.831 E.01325
G1 X126.924 Y135.186 E.01325
G1 X126.601 Y135.472 E.01325
G1 X126.219 Y135.672 E.01325
G1 X125.8 Y135.775 E.01325
G1 X125.369 Y135.775 E.01325
G1 X124.951 Y135.672 E.01325
G1 X124.569 Y135.472 E.01325
G1 X124.246 Y135.186 E.01325
G1 X124.001 Y134.831 E.01325
G1 X123.848 Y134.428 E.01325
G1 X123.796 Y134 E.01325
G1 X123.848 Y133.572 E.01325
G1 X124.024 Y133.135 E.01447
G1 X124.246 Y132.814 E.01199
G1 X124.569 Y132.528 E.01325
G1 X124.951 Y132.328 E.01325
G1 X125.369 Y132.225 E.01325
G1 X125.782 Y132.233 E.01268
M204 S10000
; WIPE_START
G1 F24000
G1 X126.219 Y132.328 E-.16993
G1 X126.601 Y132.528 E-.16384
G1 X126.924 Y132.814 E-.16384
G1 X127.169 Y133.169 E-.16384
G1 X127.26 Y133.411 E-.09856
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.4 I-.312 J-1.176 P1  F30000
G1 X125.707 Y133.824 Z10.4
G1 Z10
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.468556
G1 F1200
G1 X125.534 Y133.793 E.00608
G1 X125.395 Y133.9 E.00608
G1 X125.386 Y134.075 E.00608
G1 X125.509 Y134.2 E.00608
G1 X125.684 Y134.188 E.00608
G1 X125.793 Y134.051 E.00608
G2 X125.737 Y133.875 I-.163 J-.045 E.00678
G1 X125.936 Y133.491 F30000
; LINE_WIDTH: 0.419999
G1 F1200
G1 X125.659 Y133.386 E.0091
G1 X125.366 Y133.422 E.0091
G1 X125.122 Y133.59 E.0091
G1 X124.984 Y133.852 E.0091
G1 X124.984 Y134.148 E.0091
G1 X125.122 Y134.41 E.0091
G1 X125.366 Y134.578 E.0091
G1 X125.659 Y134.614 E.0091
G1 X125.936 Y134.509 E.0091
G1 X126.133 Y134.288 E.0091
G1 X126.204 Y134 E.0091
G2 X126.133 Y133.712 I-.919 J.074 E.00914
G1 X125.976 Y133.536 E.00726
G1 X126.242 Y133.258 F30000
G1 F1200
G1 X125.939 Y133.066 E.01102
G1 X125.585 Y133.009 E.01102
G1 X125.231 Y133.066 E.01102
G1 X124.928 Y133.258 E.01102
G1 X124.701 Y133.536 E.01102
G1 X124.601 Y133.881 E.01102
G1 X124.615 Y134.239 E.01102
G1 X124.769 Y134.563 E.01102
G1 X125.018 Y134.822 E.01102
G1 X125.348 Y134.962 E.01102
G1 X125.705 Y134.991 E.01102
G1 X126.046 Y134.878 E.01102
G1 X126.332 Y134.662 E.01102
G1 X126.512 Y134.352 E.01102
G1 X126.583 Y134 E.01102
G2 X126.469 Y133.536 I-1.483 J.119 E.01475
G1 X126.28 Y133.305 E.00918
; WIPE_START
G1 F24000
G1 X126.469 Y133.536 E-.11353
G1 X126.569 Y133.881 E-.13633
G1 X126.583 Y134 E-.04573
G1 X126.512 Y134.352 E-.13632
G1 X126.332 Y134.662 E-.13632
G1 X126.046 Y134.878 E-.13632
G1 X125.907 Y134.924 E-.05545
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.4 I1.217 J-.011 P1  F30000
G1 X125.808 Y124.324 Z10.4
G1 Z10
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X125.724 Y123.632 I-.222 J-.324 E.05339
G3 X125.855 Y124.286 I-.145 J.369 E.02626
G1 X126.03 Y124.644 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X125.49 Y123.217 I-.448 J-.646 E.08773
G3 X125.687 Y123.219 I.095 J.402 E.00613
G3 X126.078 Y124.608 I-.106 J.779 E.05613
M204 S10000
; WIPE_START
G1 F24000
G1 X125.864 Y124.737 E-.09466
G1 X125.68 Y124.783 E-.07223
G1 X125.49 Y124.783 E-.07223
G1 X125.305 Y124.737 E-.07223
G1 X125.137 Y124.649 E-.07223
G1 X124.995 Y124.523 E-.07223
G1 X124.887 Y124.366 E-.07223
G1 X124.819 Y124.189 E-.07223
G1 X124.796 Y124 E-.07223
G1 X124.819 Y123.811 E-.07223
G1 X124.834 Y123.774 E-.01528
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.4 I-.144 J1.208 P1  F30000
G1 X133.858 Y124.849 Z10.4
G1 Z10
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X134.313 Y123.648 I.23 J-.599 E.06672
G3 X134.45 Y124.78 I-.237 J.603 E.04621
G3 X133.915 Y124.868 I-.362 J-.53 E.01859
G1 X133.718 Y125.218 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X133.96 Y123.219 I.36 J-.97 E.08497
G1 X134.226 Y123.223 E.00817
G3 X133.775 Y125.237 I-.148 J1.024 E.10482
M204 S10000
G1 X133.921 Y124.395 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.468641
G1 F1200
G1 X134.059 Y124.461 E.00532
G1 X134.209 Y124.43 E.00532
G1 X134.292 Y124.301 E.00532
G1 X134.292 Y124.199 E.00353
G1 X134.209 Y124.07 E.00532
G1 X134.059 Y124.039 E.00532
G1 X133.921 Y124.105 E.00532
G1 X133.872 Y124.25 E.00532
G1 X133.902 Y124.338 E.00324
; WIPE_START
G1 F24000
G1 X133.872 Y124.25 E-.05592
G1 X133.921 Y124.105 E-.09186
G1 X134.059 Y124.039 E-.09186
G1 X134.209 Y124.07 E-.09186
G1 X134.292 Y124.199 E-.09187
G1 X134.292 Y124.301 E-.06103
G1 X134.209 Y124.43 E-.09187
G1 X134.059 Y124.461 E-.09185
G1 X133.921 Y124.395 E-.09187
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.4 I-1.213 J.101 P1  F30000
G1 X134.578 Y132.266 Z10.4
G1 Z10
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X135.193 Y132.113 I.508 J.731 E.02148
G1 X135.402 Y132.165 E.00715
G3 X134.53 Y132.301 I-.316 J.832 E.15492
G1 X134.352 Y131.939 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X134.628 Y131.795 I.727 J1.06 E.00957
G3 X135.264 Y131.727 I.493 J1.586 E.01977
G3 X134.304 Y131.974 I-.184 J1.272 E.21686
M204 S10000
G1 X134.715 Y132.672 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X134.605 Y132.882 E.00727
G1 X134.605 Y133.118 E.00727
G1 X134.715 Y133.328 E.00727
G1 X134.91 Y133.462 E.00727
G1 X135.144 Y133.491 E.00727
G1 X135.366 Y133.407 E.00727
G1 X135.523 Y133.23 E.00727
G1 X135.579 Y133 E.00727
G1 X135.523 Y132.77 E.00727
G1 X135.366 Y132.593 E.00727
G1 X135.144 Y132.509 E.00727
G1 X134.91 Y132.538 E.00727
G1 X134.764 Y132.638 E.00543
G1 X135.121 Y132.937 F30000
; LINE_WIDTH: 0.625672
G1 F1200
G2 X135.128 Y133.052 I-.033 J.06 E.01376
; CHANGE_LAYER
; Z_HEIGHT: 10.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X135.048 Y133.063 E-.20374
G1 X135.012 Y133 E-.18542
G1 X135.048 Y132.937 E-.18542
G1 X135.121 Y132.937 E-.18542
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 51/55
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
G3 Z10.4 I.042 J-1.216 P1  F30000
G1 X125.753 Y132.617 Z10.4
G1 Z10.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X126.079 Y132.697 E.01114
G3 X125.693 Y132.611 I-.493 J1.298 E.27623
G1 X125.832 Y132.232 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X126.219 Y132.328 E.01225
G1 X126.601 Y132.528 E.01325
G1 X126.924 Y132.814 E.01325
G1 X127.169 Y133.169 E.01325
G1 X127.321 Y133.572 E.01325
G1 X127.373 Y134 E.01325
G1 X127.321 Y134.428 E.01325
G1 X127.169 Y134.831 E.01325
G1 X126.924 Y135.186 E.01325
G1 X126.601 Y135.472 E.01325
G1 X126.219 Y135.672 E.01325
G1 X125.8 Y135.775 E.01325
G1 X125.369 Y135.775 E.01325
G1 X124.951 Y135.672 E.01325
G1 X124.569 Y135.472 E.01325
G1 X124.246 Y135.186 E.01325
G1 X124.001 Y134.831 E.01325
G1 X123.848 Y134.428 E.01325
G1 X123.796 Y134 E.01325
G1 X123.848 Y133.572 E.01325
G1 X124.018 Y133.145 E.01411
G1 X124.246 Y132.814 E.01236
G1 X124.569 Y132.528 E.01325
G1 X124.951 Y132.328 E.01325
G1 X125.369 Y132.225 E.01325
G1 X125.772 Y132.231 E.01238
M204 S10000
; WIPE_START
G1 F24000
G1 X126.219 Y132.328 E-.1738
G1 X126.601 Y132.528 E-.16384
G1 X126.924 Y132.814 E-.16384
G1 X127.169 Y133.169 E-.16384
G1 X127.257 Y133.402 E-.09469
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.6 I.241 J-1.193 P1  F30000
G1 X126.152 Y133.178 Z10.6
G1 Z10.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X125.822 Y133.038 E.01102
G1 X125.465 Y133.009 E.01102
G1 X125.124 Y133.122 E.01102
G1 X124.837 Y133.338 E.01102
G1 X124.658 Y133.648 E.01102
G1 X124.586 Y134 E.01102
G1 X124.658 Y134.352 E.01102
G1 X124.837 Y134.662 E.01102
G1 X125.124 Y134.878 E.01102
G1 X125.465 Y134.991 E.01102
G1 X125.822 Y134.962 E.01102
G1 X126.152 Y134.822 E.01102
G1 X126.401 Y134.563 E.01102
G1 X126.554 Y134.239 E.01102
G2 X126.554 Y133.761 I-1.469 J-.239 E.01475
G1 X126.401 Y133.437 E.01102
G1 X126.194 Y133.221 E.00918
G1 X126.048 Y133.59 F30000
G1 F1200
G1 X125.804 Y133.422 E.0091
G1 X125.51 Y133.386 E.0091
G1 X125.233 Y133.491 E.0091
G1 X125.037 Y133.712 E.0091
G1 X124.966 Y134 E.0091
G1 X125.037 Y134.288 E.0091
G1 X125.233 Y134.509 E.0091
G1 X125.51 Y134.614 E.0091
G1 X125.804 Y134.578 E.0091
G1 X126.048 Y134.41 E.0091
G1 X126.186 Y134.148 E.0091
G2 X126.186 Y133.852 I-.91 J-.148 E.00914
G1 X126.076 Y133.643 E.00726
G1 X125.745 Y133.858 F30000
; LINE_WIDTH: 0.468557
G1 F1200
G1 X125.585 Y133.787 E.00608
G1 X125.424 Y133.858 E.00608
G1 X125.374 Y134.026 E.00608
G1 X125.463 Y134.176 E.00608
G1 X125.636 Y134.207 E.00608
G1 X125.775 Y134.1 E.00608
G2 X125.763 Y133.915 I-.148 J-.083 E.00678
; WIPE_START
G1 F24000
M73 P94 R0
G1 X125.796 Y134.026 E-.07044
G1 X125.775 Y134.1 E-.04704
G1 X125.636 Y134.207 E-.10709
G1 X125.463 Y134.176 E-.10708
G1 X125.374 Y134.026 E-.10709
G1 X125.424 Y133.858 E-.10708
G1 X125.585 Y133.787 E-.10709
G1 X125.745 Y133.858 E-.10709
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.6 I1.217 J.008 P1  F30000
G1 X125.807 Y124.321 Z10.6
G1 Z10.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X125.537 Y123.609 I-.222 J-.323 E.04712
G1 X125.634 Y123.61 E.0032
G3 X125.854 Y124.284 I-.049 J.389 E.02939
G1 X126.03 Y124.645 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X125.49 Y123.217 I-.446 J-.647 E.08758
G1 X125.682 Y123.218 E.00589
G3 X126.078 Y124.609 I-.097 J.78 E.05648
M204 S10000
; WIPE_START
G1 F24000
G1 X125.864 Y124.737 E-.0947
G1 X125.68 Y124.783 E-.07223
G1 X125.49 Y124.783 E-.07223
G1 X125.305 Y124.737 E-.07223
G1 X125.137 Y124.649 E-.07223
G1 X124.995 Y124.523 E-.07223
G1 X124.887 Y124.366 E-.07223
G1 X124.819 Y124.189 E-.07223
G1 X124.796 Y124 E-.07223
G1 X124.819 Y123.811 E-.07223
G1 X124.834 Y123.774 E-.01524
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.6 I-.144 J1.208 P1  F30000
G1 X133.858 Y124.849 Z10.6
G1 Z10.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X134.313 Y123.648 I.23 J-.599 E.06672
G3 X134.45 Y124.78 I-.237 J.603 E.04621
G3 X133.915 Y124.868 I-.362 J-.53 E.01859
G1 X133.719 Y125.215 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X133.96 Y123.219 I.362 J-.969 E.08475
G1 X134.218 Y123.221 E.00794
G3 X133.776 Y125.235 I-.137 J1.025 E.10516
M204 S10000
G1 X133.964 Y124.425 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.46864
G1 F1200
G1 X134.111 Y124.468 E.00532
G1 X134.244 Y124.391 E.00532
G1 X134.292 Y124.301 E.00353
G1 X134.279 Y124.148 E.00532
G1 X134.16 Y124.051 E.00532
G1 X134.007 Y124.045 E.00532
G1 X133.896 Y124.151 E.00532
G1 X133.872 Y124.302 E.00532
G1 X133.928 Y124.377 E.00324
; WIPE_START
G1 F24000
G1 X133.872 Y124.302 E-.05592
G1 X133.896 Y124.151 E-.09186
G1 X134.007 Y124.045 E-.09186
G1 X134.16 Y124.051 E-.09186
G1 X134.279 Y124.148 E-.09186
G1 X134.292 Y124.301 E-.09187
G1 X134.244 Y124.391 E-.06104
G1 X134.111 Y124.468 E-.09186
G1 X133.964 Y124.425 E-.09187
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.6 I-1.213 J.095 P1  F30000
G1 X134.578 Y132.266 Z10.6
G1 Z10.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X135.193 Y132.113 I.508 J.731 E.02148
G1 X135.402 Y132.165 E.00715
G3 X134.53 Y132.301 I-.316 J.832 E.15492
G1 X134.353 Y131.94 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X135.255 Y131.725 I.727 J1.051 E.02916
G3 X133.953 Y132.389 I-.172 J1.272 E.19995
G1 X133.953 Y132.389 E0
G3 X134.305 Y131.975 I1.128 J.602 E.01682
M204 S10000
G1 X134.715 Y132.672 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X134.605 Y132.882 E.00727
G1 X134.605 Y133.118 E.00727
G1 X134.715 Y133.328 E.00727
G1 X134.91 Y133.462 E.00727
G1 X135.144 Y133.491 E.00727
G1 X135.366 Y133.407 E.00727
G1 X135.523 Y133.23 E.00727
G1 X135.579 Y133 E.00727
G1 X135.523 Y132.77 E.00727
G1 X135.366 Y132.593 E.00727
G1 X135.144 Y132.509 E.00727
G1 X134.91 Y132.538 E.00727
G1 X134.764 Y132.638 E.00543
G1 X135.121 Y132.937 F30000
; LINE_WIDTH: 0.625668
G1 F1200
G2 X135.128 Y133.052 I-.033 J.06 E.01376
; CHANGE_LAYER
; Z_HEIGHT: 10.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X135.048 Y133.063 E-.20374
G1 X135.012 Y133 E-.18542
G1 X135.048 Y132.937 E-.18542
G1 X135.121 Y132.937 E-.18542
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 52/55
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
G3 Z10.6 I.042 J-1.216 P1  F30000
G1 X125.753 Y132.617 Z10.6
G1 Z10.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X126.079 Y132.697 E.01114
G3 X125.693 Y132.611 I-.493 J1.298 E.27623
G1 X125.822 Y132.23 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X126.219 Y132.328 E.01255
G1 X126.601 Y132.528 E.01325
G1 X126.924 Y132.814 E.01325
G1 X127.169 Y133.169 E.01325
G1 X127.321 Y133.572 E.01325
G1 X127.373 Y134 E.01325
G1 X127.321 Y134.428 E.01325
G1 X127.169 Y134.831 E.01325
G1 X126.924 Y135.186 E.01325
G1 X126.601 Y135.472 E.01325
G1 X126.219 Y135.672 E.01325
G1 X125.8 Y135.775 E.01325
G1 X125.369 Y135.775 E.01325
G1 X124.951 Y135.672 E.01325
G1 X124.569 Y135.472 E.01325
G1 X124.246 Y135.186 E.01325
G1 X124.001 Y134.831 E.01325
G1 X123.848 Y134.428 E.01325
G1 X123.796 Y134 E.01325
G1 X123.848 Y133.572 E.01325
G1 X124.001 Y133.169 E.01325
G1 X124.246 Y132.814 E.01325
G1 X124.569 Y132.528 E.01325
G1 X124.951 Y132.328 E.01325
G1 X125.369 Y132.225 E.01325
G1 X125.763 Y132.228 E.01209
M204 S10000
; WIPE_START
G1 F24000
G1 X126.219 Y132.328 E-.17755
G1 X126.601 Y132.528 E-.16384
G1 X126.924 Y132.814 E-.16384
G1 X127.169 Y133.169 E-.16383
G1 X127.253 Y133.393 E-.09094
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.8 I.233 J-1.195 P1  F30000
G1 X126.152 Y133.178 Z10.8
G1 Z10.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X125.822 Y133.038 E.01102
G1 X125.465 Y133.009 E.01102
G1 X125.124 Y133.122 E.01102
G1 X124.837 Y133.338 E.01102
G1 X124.658 Y133.648 E.01102
G1 X124.586 Y134 E.01102
G1 X124.658 Y134.352 E.01102
G1 X124.837 Y134.662 E.01102
G1 X125.124 Y134.878 E.01102
G1 X125.465 Y134.991 E.01102
G1 X125.822 Y134.962 E.01102
G1 X126.152 Y134.822 E.01102
G1 X126.401 Y134.563 E.01102
G1 X126.554 Y134.239 E.01102
G2 X126.554 Y133.761 I-1.469 J-.239 E.01475
G1 X126.401 Y133.437 E.01102
G1 X126.194 Y133.221 E.00918
G1 X126.048 Y133.59 F30000
G1 F1200
G1 X125.804 Y133.422 E.0091
G1 X125.51 Y133.386 E.0091
G1 X125.233 Y133.491 E.0091
G1 X125.037 Y133.712 E.0091
G1 X124.966 Y134 E.0091
G1 X125.037 Y134.288 E.0091
G1 X125.233 Y134.509 E.0091
G1 X125.51 Y134.614 E.0091
G1 X125.804 Y134.578 E.0091
G1 X126.048 Y134.41 E.0091
G1 X126.186 Y134.148 E.0091
G2 X126.186 Y133.852 I-.91 J-.148 E.00914
G1 X126.076 Y133.643 E.00726
G1 X125.745 Y133.858 F30000
; LINE_WIDTH: 0.468559
G1 F1200
G1 X125.585 Y133.787 E.00608
G1 X125.424 Y133.858 E.00608
G1 X125.374 Y134.026 E.00608
G1 X125.463 Y134.176 E.00608
G1 X125.636 Y134.207 E.00608
G1 X125.775 Y134.1 E.00608
G2 X125.763 Y133.915 I-.148 J-.083 E.00678
; WIPE_START
G1 F24000
G1 X125.796 Y134.026 E-.07044
G1 X125.775 Y134.1 E-.04704
G1 X125.636 Y134.207 E-.10708
G1 X125.463 Y134.176 E-.10709
G1 X125.374 Y134.026 E-.10709
G1 X125.424 Y133.858 E-.10708
G1 X125.585 Y133.787 E-.10708
G1 X125.745 Y133.858 E-.10709
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.8 I1.217 J.007 P1  F30000
G1 X125.802 Y124.314 Z10.8
G1 Z10.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X125.724 Y124.365 E.0031
G3 X125.632 Y123.609 I-.138 J-.367 E.04711
G1 X125.724 Y123.632 E.00315
G3 X125.878 Y124.26 I-.139 J.367 E.02518
G1 X125.851 Y124.279 E.00112
G1 X126.03 Y124.645 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X125.68 Y123.217 I-.444 J-.648 E.09326
G1 X125.864 Y123.263 E.00584
G3 X126.078 Y124.609 I-.279 J.734 E.05071
M204 S10000
; WIPE_START
G1 F24000
G1 X125.864 Y124.737 E-.0947
G1 X125.68 Y124.783 E-.07223
G1 X125.49 Y124.783 E-.07223
G1 X125.305 Y124.737 E-.07223
G1 X125.137 Y124.649 E-.07223
G1 X124.995 Y124.523 E-.07223
G1 X124.887 Y124.366 E-.07223
G1 X124.819 Y124.189 E-.07223
G1 X124.796 Y124 E-.07223
G1 X124.819 Y123.811 E-.07223
G1 X124.834 Y123.774 E-.01524
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.8 I-.144 J1.208 P1  F30000
G1 X133.858 Y124.848 Z10.8
G1 Z10.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X134.007 Y123.611 I.226 J-.6 E.05656
G1 X134.163 Y123.611 E.00517
G3 X133.915 Y124.866 I-.079 J.636 E.06988
G1 X133.719 Y125.214 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X133.96 Y123.219 I.365 J-.968 E.08456
G1 X134.211 Y123.219 E.00772
G3 X133.776 Y125.234 I-.126 J1.027 E.1056
M204 S10000
G1 X133.891 Y124.352 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.468622
G1 F1200
G1 X134.009 Y124.449 E.00532
G1 X134.163 Y124.455 E.00532
G1 X134.273 Y124.349 E.00532
G1 X134.298 Y124.25 E.00353
G1 X134.249 Y124.105 E.00532
G1 X134.11 Y124.039 E.00533
G1 X133.96 Y124.07 E.00531
G1 X133.878 Y124.199 E.00532
G1 X133.886 Y124.292 E.00324
; WIPE_START
G1 F24000
G1 X133.878 Y124.199 E-.05592
G1 X133.96 Y124.07 E-.09188
G1 X134.11 Y124.039 E-.09169
G1 X134.249 Y124.105 E-.09202
G1 X134.298 Y124.25 E-.09186
G1 X134.273 Y124.349 E-.06104
G1 X134.163 Y124.455 E-.09187
G1 X134.009 Y124.449 E-.09187
G1 X133.891 Y124.352 E-.09186
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.8 I-1.212 J.106 P1  F30000
G1 X134.58 Y132.268 Z10.8
G1 Z10.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X135.402 Y132.165 I.51 J.731 E.02858
G3 X135.592 Y133.735 I-.329 J.837 E.06416
G3 X134.532 Y132.304 I-.503 J-.736 E.09065
G1 X134.353 Y131.939 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X134.93 Y131.721 I.729 J1.056 E.01914
G1 X135.246 Y131.722 E.00973
G3 X134.304 Y131.974 I-.164 J1.273 E.21709
M204 S10000
G1 X134.715 Y132.672 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X134.605 Y132.882 E.00727
G1 X134.605 Y133.118 E.00727
G1 X134.715 Y133.328 E.00727
G1 X134.91 Y133.462 E.00727
G1 X135.144 Y133.491 E.00727
G1 X135.366 Y133.407 E.00727
G1 X135.523 Y133.23 E.00727
G1 X135.579 Y133 E.00727
G1 X135.523 Y132.77 E.00727
G1 X135.366 Y132.593 E.00727
G1 X135.144 Y132.509 E.00727
G1 X134.91 Y132.538 E.00727
G1 X134.764 Y132.638 E.00543
G1 X135.121 Y132.937 F30000
; LINE_WIDTH: 0.625676
G1 F1200
G2 X135.128 Y133.052 I-.033 J.06 E.01376
; CHANGE_LAYER
; Z_HEIGHT: 10.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X135.048 Y133.063 E-.20374
G1 X135.012 Y133 E-.18542
G1 X135.048 Y132.937 E-.18542
G1 X135.121 Y132.937 E-.18542
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 53/55
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
G3 Z10.8 I.042 J-1.216 P1  F30000
G1 X125.753 Y132.617 Z10.8
G1 Z10.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X126.079 Y132.697 E.01114
G3 X125.693 Y132.611 I-.493 J1.298 E.27623
G1 X125.813 Y132.228 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X126.219 Y132.328 E.01285
G1 X126.601 Y132.528 E.01325
G1 X126.924 Y132.814 E.01325
G1 X127.169 Y133.169 E.01325
G1 X127.321 Y133.572 E.01325
G1 X127.373 Y134 E.01325
G1 X127.321 Y134.428 E.01325
M73 P95 R0
G1 X127.169 Y134.831 E.01325
G1 X126.924 Y135.186 E.01325
G1 X126.601 Y135.472 E.01325
G1 X126.219 Y135.672 E.01325
G1 X125.8 Y135.775 E.01325
G1 X125.369 Y135.775 E.01325
G1 X124.951 Y135.672 E.01325
G1 X124.569 Y135.472 E.01325
G1 X124.246 Y135.186 E.01325
G1 X124.001 Y134.831 E.01325
G1 X123.848 Y134.428 E.01325
G1 X123.796 Y134 E.01325
G1 X123.848 Y133.572 E.01325
G1 X124.001 Y133.169 E.01325
G1 X124.246 Y132.814 E.01325
G1 X124.569 Y132.528 E.01325
G1 X124.951 Y132.328 E.01325
G1 X125.369 Y132.225 E.01325
G1 X125.753 Y132.226 E.0118
M204 S10000
; WIPE_START
G1 F24000
G1 X126.219 Y132.328 E-.18116
G1 X126.601 Y132.528 E-.16384
G1 X126.924 Y132.814 E-.16384
G1 X127.169 Y133.169 E-.16384
G1 X127.25 Y133.384 E-.08733
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11 I.224 J-1.196 P1  F30000
G1 X126.152 Y133.178 Z11
G1 Z10.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X125.822 Y133.038 E.01102
G1 X125.465 Y133.009 E.01102
G1 X125.124 Y133.122 E.01102
G1 X124.837 Y133.338 E.01102
G1 X124.658 Y133.648 E.01102
G1 X124.586 Y134 E.01102
G1 X124.658 Y134.352 E.01102
G1 X124.837 Y134.662 E.01102
G1 X125.124 Y134.878 E.01102
G1 X125.465 Y134.991 E.01102
G1 X125.822 Y134.962 E.01102
G1 X126.152 Y134.822 E.01102
G1 X126.401 Y134.563 E.01102
G1 X126.554 Y134.239 E.01102
G2 X126.554 Y133.761 I-1.469 J-.239 E.01475
G1 X126.401 Y133.437 E.01102
G1 X126.194 Y133.221 E.00918
G1 X126.048 Y133.59 F30000
G1 F1200
G1 X125.804 Y133.422 E.0091
G1 X125.51 Y133.386 E.0091
G1 X125.233 Y133.491 E.0091
G1 X125.037 Y133.712 E.0091
G1 X124.966 Y134 E.0091
G1 X125.037 Y134.288 E.0091
G1 X125.233 Y134.509 E.0091
G1 X125.51 Y134.614 E.0091
G1 X125.804 Y134.578 E.0091
G1 X126.048 Y134.41 E.0091
G1 X126.186 Y134.148 E.0091
G2 X126.186 Y133.852 I-.91 J-.148 E.00914
G1 X126.076 Y133.643 E.00726
G1 X125.745 Y133.858 F30000
; LINE_WIDTH: 0.468555
G1 F1200
G1 X125.585 Y133.787 E.00608
G1 X125.424 Y133.858 E.00608
G1 X125.374 Y134.026 E.00608
G1 X125.463 Y134.176 E.00608
G1 X125.636 Y134.207 E.00608
G1 X125.775 Y134.1 E.00608
G2 X125.763 Y133.915 I-.148 J-.083 E.00678
; WIPE_START
G1 F24000
G1 X125.796 Y134.026 E-.07044
G1 X125.775 Y134.1 E-.04704
G1 X125.636 Y134.207 E-.10708
G1 X125.463 Y134.176 E-.10709
G1 X125.374 Y134.026 E-.10708
G1 X125.424 Y133.858 E-.10709
G1 X125.585 Y133.787 E-.10708
G1 X125.745 Y133.858 E-.1071
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11 I1.217 J.008 P1  F30000
G1 X125.807 Y124.322 Z11
G1 Z10.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X125.632 Y123.609 I-.222 J-.323 E.05025
G1 X125.724 Y123.632 E.00315
G3 X125.854 Y124.284 I-.139 J.367 E.02632
G1 X126.03 Y124.645 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X125.68 Y123.217 I-.444 J-.648 E.09326
G1 X125.864 Y123.263 E.00584
G3 X126.078 Y124.609 I-.279 J.734 E.05071
M204 S10000
; WIPE_START
G1 F24000
G1 X125.864 Y124.737 E-.0947
G1 X125.68 Y124.783 E-.07223
G1 X125.49 Y124.783 E-.07223
G1 X125.305 Y124.737 E-.07223
G1 X125.137 Y124.649 E-.07223
G1 X124.995 Y124.523 E-.07223
G1 X124.887 Y124.366 E-.07223
G1 X124.819 Y124.189 E-.07223
G1 X124.796 Y124 E-.07223
G1 X124.819 Y123.811 E-.07223
G1 X124.834 Y123.774 E-.01524
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11 I-.144 J1.208 P1  F30000
G1 X133.858 Y124.847 Z11
G1 Z10.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X134.162 Y123.611 I.227 J-.6 E.06168
G1 X134.313 Y123.648 E.00515
G3 X133.915 Y124.866 I-.228 J.599 E.0648
G1 X133.718 Y125.216 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X134.453 Y123.279 I.372 J-.967 E.09973
G3 X134.675 Y125.105 I-.382 J.973 E.06907
G3 X133.775 Y125.236 I-.585 J-.855 E.02893
M204 S10000
G1 X133.964 Y124.425 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.46864
G1 F1200
G1 X134.111 Y124.468 E.00532
G1 X134.244 Y124.391 E.00532
G1 X134.292 Y124.301 E.00353
G1 X134.279 Y124.148 E.00532
G1 X134.16 Y124.051 E.00532
G1 X134.007 Y124.045 E.00532
G1 X133.896 Y124.151 E.00532
G1 X133.872 Y124.302 E.00532
G1 X133.928 Y124.377 E.00324
; WIPE_START
G1 F24000
G1 X133.872 Y124.302 E-.05592
G1 X133.896 Y124.151 E-.09186
G1 X134.007 Y124.045 E-.09187
G1 X134.16 Y124.051 E-.09186
G1 X134.279 Y124.148 E-.09187
G1 X134.292 Y124.301 E-.09186
G1 X134.244 Y124.391 E-.06103
G1 X134.111 Y124.468 E-.09186
G1 X133.964 Y124.425 E-.09187
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11 I-1.213 J.095 P1  F30000
G1 X134.578 Y132.266 Z11
G1 Z10.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X135.193 Y132.113 I.508 J.731 E.02148
G1 X135.402 Y132.165 E.00715
G3 X134.53 Y132.301 I-.316 J.832 E.15492
G1 X134.354 Y131.941 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X135.24 Y131.721 I.732 J1.055 E.02869
G1 X135.542 Y131.795 E.00954
G3 X134.305 Y131.976 I-.456 J1.2 E.20776
M204 S10000
G1 X134.715 Y132.672 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X134.605 Y132.882 E.00727
G1 X134.605 Y133.118 E.00727
G1 X134.715 Y133.328 E.00727
G1 X134.91 Y133.462 E.00727
G1 X135.144 Y133.491 E.00727
G1 X135.366 Y133.407 E.00727
G1 X135.523 Y133.23 E.00727
G1 X135.579 Y133 E.00727
G1 X135.523 Y132.77 E.00727
G1 X135.366 Y132.593 E.00727
G1 X135.144 Y132.509 E.00727
G1 X134.91 Y132.538 E.00727
G1 X134.764 Y132.638 E.00543
G1 X135.121 Y132.937 F30000
; LINE_WIDTH: 0.625672
G1 F1200
G2 X135.128 Y133.052 I-.033 J.06 E.01376
; CHANGE_LAYER
; Z_HEIGHT: 10.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X135.048 Y133.063 E-.20374
G1 X135.012 Y133 E-.18542
G1 X135.048 Y132.937 E-.18542
G1 X135.121 Y132.937 E-.18542
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 54/55
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
G3 Z11 I.042 J-1.216 P1  F30000
G1 X125.753 Y132.617 Z11
G1 Z10.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X126.079 Y132.697 E.01114
G3 X125.693 Y132.611 I-.493 J1.298 E.27623
G1 X125.804 Y132.226 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X126.219 Y132.328 E.01312
G1 X126.601 Y132.528 E.01325
G1 X126.924 Y132.814 E.01325
G1 X127.169 Y133.169 E.01325
G1 X127.321 Y133.572 E.01325
G1 X127.373 Y134 E.01325
G1 X127.321 Y134.428 E.01325
G1 X127.169 Y134.831 E.01325
G1 X126.924 Y135.186 E.01325
G1 X126.601 Y135.472 E.01325
G1 X126.219 Y135.672 E.01325
G1 X125.8 Y135.775 E.01325
G1 X125.369 Y135.775 E.01325
G1 X124.951 Y135.672 E.01325
G1 X124.569 Y135.472 E.01325
G1 X124.246 Y135.186 E.01325
G1 X124.001 Y134.831 E.01325
G1 X123.848 Y134.428 E.01325
G1 X123.796 Y134 E.01325
G1 X123.848 Y133.572 E.01325
G1 X124.001 Y133.169 E.01325
G1 X124.246 Y132.814 E.01325
G1 X124.569 Y132.528 E.01325
G1 X124.951 Y132.328 E.01325
G1 X125.369 Y132.225 E.01325
G1 X125.745 Y132.225 E.01153
M204 S10000
; WIPE_START
G1 F24000
G1 X126.219 Y132.328 E-.18454
G1 X126.601 Y132.528 E-.16384
G1 X126.924 Y132.814 E-.16384
G1 X127.169 Y133.169 E-.16384
G1 X127.247 Y133.375 E-.08395
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.2 I.216 J-1.198 P1  F30000
G1 X126.152 Y133.178 Z11.2
G1 Z10.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X125.822 Y133.038 E.01102
G1 X125.465 Y133.009 E.01102
G1 X125.124 Y133.122 E.01102
G1 X124.837 Y133.338 E.01102
G1 X124.658 Y133.648 E.01102
G1 X124.586 Y134 E.01102
G1 X124.658 Y134.352 E.01102
G1 X124.837 Y134.662 E.01102
G1 X125.124 Y134.878 E.01102
G1 X125.465 Y134.991 E.01102
G1 X125.822 Y134.962 E.01102
G1 X126.152 Y134.822 E.01102
G1 X126.401 Y134.563 E.01102
G1 X126.554 Y134.239 E.01102
G2 X126.554 Y133.761 I-1.469 J-.239 E.01475
G1 X126.401 Y133.437 E.01102
G1 X126.194 Y133.221 E.00918
G1 X126.048 Y133.59 F30000
G1 F1200
G1 X125.804 Y133.422 E.0091
G1 X125.51 Y133.386 E.0091
G1 X125.233 Y133.491 E.0091
G1 X125.037 Y133.712 E.0091
G1 X124.966 Y134 E.0091
G1 X125.037 Y134.288 E.0091
G1 X125.233 Y134.509 E.0091
G1 X125.51 Y134.614 E.0091
G1 X125.804 Y134.578 E.0091
G1 X126.048 Y134.41 E.0091
G1 X126.186 Y134.148 E.0091
G2 X126.186 Y133.852 I-.91 J-.148 E.00914
G1 X126.076 Y133.643 E.00726
G1 X125.745 Y133.858 F30000
; LINE_WIDTH: 0.468555
G1 F1200
G1 X125.585 Y133.787 E.00608
G1 X125.424 Y133.858 E.00608
G1 X125.374 Y134.026 E.00608
G1 X125.463 Y134.176 E.00608
G1 X125.636 Y134.207 E.00608
G1 X125.775 Y134.1 E.00608
G2 X125.763 Y133.915 I-.148 J-.083 E.00678
; WIPE_START
G1 F24000
G1 X125.796 Y134.026 E-.07044
G1 X125.775 Y134.1 E-.04704
G1 X125.636 Y134.207 E-.10708
G1 X125.463 Y134.176 E-.10709
G1 X125.374 Y134.026 E-.10708
G1 X125.424 Y133.858 E-.10708
M73 P96 R0
G1 X125.585 Y133.787 E-.10708
G1 X125.745 Y133.858 E-.10709
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.2 I1.217 J.008 P1  F30000
G1 X125.806 Y124.321 Z11.2
G1 Z10.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X125.535 Y123.61 I-.223 J-.322 E.04709
G1 X125.639 Y123.611 E.00344
G3 X125.853 Y124.283 I-.055 J.388 E.02913
G1 X126.029 Y124.643 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X125.489 Y123.218 I-.447 J-.646 E.08757
G1 X125.688 Y123.219 E.00611
G3 X126.077 Y124.607 I-.106 J.778 E.05608
M204 S10000
; WIPE_START
G1 F24000
G1 X125.865 Y124.737 E-.09463
G1 X125.68 Y124.783 E-.07223
G1 X125.49 Y124.783 E-.07223
G1 X125.305 Y124.737 E-.07223
G1 X125.138 Y124.649 E-.07188
G1 X124.99 Y124.516 E-.07557
G1 X124.887 Y124.366 E-.06914
G1 X124.819 Y124.189 E-.07223
G1 X124.796 Y124 E-.07223
G1 X124.819 Y123.812 E-.07188
G1 X124.834 Y123.774 E-.01575
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.2 I-.144 J1.208 P1  F30000
G1 X133.858 Y124.847 Z11.2
G1 Z10.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X134.162 Y123.611 I.227 J-.6 E.06168
G1 X134.313 Y123.648 E.00515
G3 X133.915 Y124.866 I-.228 J.599 E.0648
G1 X133.719 Y125.214 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X134.21 Y123.219 I.366 J-.968 E.0922
G1 X134.453 Y123.279 E.00769
G3 X133.776 Y125.234 I-.367 J.967 E.09801
M204 S10000
G1 X133.964 Y124.425 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.468643
G1 F1200
G1 X134.111 Y124.468 E.00532
G1 X134.244 Y124.391 E.00532
G1 X134.292 Y124.301 E.00353
G1 X134.279 Y124.148 E.00532
G1 X134.16 Y124.051 E.00532
G1 X134.007 Y124.045 E.00532
G1 X133.896 Y124.151 E.00532
G1 X133.872 Y124.302 E.00532
G1 X133.928 Y124.377 E.00324
; WIPE_START
G1 F24000
G1 X133.872 Y124.302 E-.05592
G1 X133.896 Y124.151 E-.09186
G1 X134.007 Y124.045 E-.09187
G1 X134.16 Y124.051 E-.09186
G1 X134.279 Y124.148 E-.09186
G1 X134.292 Y124.301 E-.09187
G1 X134.244 Y124.391 E-.06104
G1 X134.111 Y124.468 E-.09186
G1 X133.964 Y124.425 E-.09187
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.2 I-1.213 J.095 P1  F30000
G1 X134.578 Y132.266 Z11.2
G1 Z10.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X135.193 Y132.113 I.508 J.731 E.02148
G1 X135.402 Y132.165 E.00715
G3 X134.53 Y132.301 I-.316 J.832 E.15492
G1 X134.354 Y131.941 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X135.24 Y131.721 I.732 J1.055 E.02869
G1 X135.542 Y131.795 E.00954
G3 X134.305 Y131.976 I-.456 J1.2 E.20776
M204 S10000
G1 X134.715 Y132.672 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X134.605 Y132.882 E.00727
G1 X134.605 Y133.118 E.00727
G1 X134.715 Y133.328 E.00727
G1 X134.91 Y133.462 E.00727
G1 X135.144 Y133.491 E.00727
G1 X135.366 Y133.407 E.00727
G1 X135.523 Y133.23 E.00727
G1 X135.579 Y133 E.00727
G1 X135.523 Y132.77 E.00727
G1 X135.366 Y132.593 E.00727
G1 X135.144 Y132.509 E.00727
G1 X134.91 Y132.538 E.00727
G1 X134.764 Y132.638 E.00543
; CHANGE_LAYER
; Z_HEIGHT: 11
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X134.91 Y132.538 E-.0671
G1 X135.144 Y132.509 E-.0899
G1 X135.366 Y132.593 E-.0899
G1 X135.523 Y132.77 E-.0899
G1 X135.579 Y133 E-.0899
G1 X135.523 Y133.23 E-.0899
G1 X135.366 Y133.407 E-.0899
G1 X135.144 Y133.491 E-.0899
G1 X134.978 Y133.471 E-.0636
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 55/55
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
G3 Z11.2 I.163 J-1.206 P1  F30000
G1 X125.796 Y132.226 Z11.2
G1 Z11
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X125.806 Y132.226 E.0003
G1 X126.219 Y132.328 E.01307
G1 X126.601 Y132.528 E.01325
G1 X126.924 Y132.814 E.01325
G1 X127.169 Y133.169 E.01325
G1 X127.321 Y133.572 E.01325
G1 X127.373 Y134 E.01325
G1 X127.321 Y134.428 E.01325
G1 X127.169 Y134.831 E.01325
G1 X126.924 Y135.186 E.01325
G1 X126.601 Y135.472 E.01325
G1 X126.219 Y135.672 E.01325
G1 X125.8 Y135.775 E.01325
G1 X125.37 Y135.775 E.01324
G1 X124.946 Y135.67 E.01343
G1 X124.569 Y135.472 E.01307
G1 X124.246 Y135.186 E.01325
G1 X124.001 Y134.831 E.01325
G1 X123.848 Y134.428 E.01325
G1 X123.796 Y134 E.01325
G1 X123.848 Y133.572 E.01325
G1 X124.001 Y133.169 E.01325
G1 X124.246 Y132.814 E.01325
G1 X124.569 Y132.528 E.01325
G1 X124.951 Y132.328 E.01325
G1 X125.369 Y132.225 E.01324
G1 X125.736 Y132.226 E.01128
M204 S10000
G1 X125.634 Y132.433 F30000
M204 S2000
; FEATURE: Top surface
G1 F1200
G1 X127.159 Y133.958 E.06629
G1 X127.099 Y134.431
G1 X125.158 Y132.49 E.08433
G1 X124.784 Y132.65
G1 X126.937 Y134.802 E.09354
G1 X126.704 Y135.103
G1 X124.483 Y132.882 E.09654
G1 X124.247 Y133.179
G1 X126.407 Y135.339 E.09389
G1 X126.038 Y135.503
G1 X124.08 Y133.546 E.08507
G1 X124.006 Y134.005
G1 X125.569 Y135.568 E.06794
M204 S10000
; WIPE_START
G1 F24000
G1 X124.155 Y134.154 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.4 I1.135 J.44 P1  F30000
G1 X124.726 Y132.68 Z11.4
G1 Z11
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0921582
G1 F1200
G2 X124.631 Y132.763 I.292 J.433 E.00051
; WIPE_START
G1 F24000
G1 X124.726 Y132.68 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.4 I-.412 J1.145 P1  F30000
G1 X127.107 Y133.538 Z11.4
G1 Z11
G1 E.8 F1800
; LINE_WIDTH: 0.241595
G1 F1200
G1 X126.894 Y133.283 E.00537
; LINE_WIDTH: 0.290845
G2 X126.424 Y132.785 I-2.286 J1.689 E.01388
; LINE_WIDTH: 0.285099
G1 X126.279 Y132.678 E.00355
; LINE_WIDTH: 0.248302
G1 X126.134 Y132.572 E.00301
; LINE_WIDTH: 0.211505
G1 X125.99 Y132.465 E.00247
; WIPE_START
G1 F24000
G1 X126.134 Y132.572 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.4 I-1.202 J.192 P1  F30000
G1 X126.558 Y135.224 Z11.4
G1 Z11
G1 E.8 F1800
; LINE_WIDTH: 0.0919888
G1 F1200
G1 X126.478 Y135.3 E.00044
; WIPE_START
G1 F24000
G1 X126.558 Y135.224 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.4 I-.278 J-1.185 P1  F30000
G1 X125.208 Y135.541 Z11.4
G1 Z11
G1 E.8 F1800
; LINE_WIDTH: 0.20032
G1 F1200
G1 X125.056 Y135.429 E.00242
; LINE_WIDTH: 0.236278
G1 X124.905 Y135.317 E.00297
; LINE_WIDTH: 0.272235
G1 X124.753 Y135.206 E.00352
; LINE_WIDTH: 0.322315
G1 X124.496 Y134.964 E.00801
G1 X124.051 Y134.429 E.01585
; WIPE_START
G1 F24000
G1 X124.496 Y134.964 E-.50482
G1 X124.753 Y135.206 E-.25518
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.4 I1.208 J.146 P1  F30000
G1 X126.029 Y124.644 Z11.4
G1 Z11
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X125.49 Y123.217 I-.446 J-.647 E.08749
G1 X125.683 Y123.218 E.00593
G3 X126.078 Y124.608 I-.099 J.779 E.05637
M204 S10000
; WIPE_START
G1 F24000
G1 X125.865 Y124.737 E-.09467
G1 X125.68 Y124.783 E-.07223
G1 X125.49 Y124.783 E-.07223
G1 X125.305 Y124.737 E-.07223
G1 X125.137 Y124.649 E-.07211
G1 X124.993 Y124.521 E-.07334
G1 X124.887 Y124.366 E-.0712
G1 X124.819 Y124.189 E-.07223
G1 X124.796 Y124 E-.07223
G1 X124.819 Y123.812 E-.07211
G1 X124.834 Y123.774 E-.01542
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.4 I.622 J1.046 P1  F30000
G1 X125.256 Y123.523 Z11.4
G1 Z11
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
G1 F1200
G1 X126.059 Y124.326 E.03489
G1 X125.751 Y124.551
G1 X125.033 Y123.833 E.03122
M204 S10000
G1 X125.173 Y124.428 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0982435
G1 F1200
G1 X125.014 Y124.102 E.00163
G1 X125.473 Y124.58 F30000
; LINE_WIDTH: 0.160359
G1 F1200
G3 X125.002 Y124.128 I.921 J-1.43 E.00628
G1 X125.138 Y123.672 F30000
; LINE_WIDTH: 0.116188
G1 F1200
G1 X125.04 Y123.789 E.00091
; WIPE_START
G1 F24000
G1 X125.138 Y123.672 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.4 I-.385 J1.154 P1  F30000
G1 X126.181 Y124.019 Z11.4
G1 Z11
G1 E.8 F1800
; LINE_WIDTH: 0.334263
G1 F1200
G2 X125.535 Y123.406 I-1.744 J1.19 E.0213
; WIPE_START
G1 F24000
G1 X125.919 Y123.704 E-.41217
G1 X126.181 Y124.019 E-.34783
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.4 I-.191 J1.202 P1  F30000
G1 X133.719 Y125.215 Z11.4
G1 Z11
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X133.959 Y123.219 I.364 J-.968 E.08461
G1 X134.213 Y123.22 E.00781
G3 X133.776 Y125.234 I-.13 J1.026 E.10546
M204 S10000
; WIPE_START
G1 F24000
G1 X133.495 Y125.105 E-.11738
G1 X133.306 Y124.936 E-.09652
G1 X133.165 Y124.733 E-.09382
G1 X133.077 Y124.499 E-.09513
G1 X133.046 Y124.25 E-.09513
G1 X133.077 Y124.002 E-.09501
G1 X133.167 Y123.765 E-.09652
G1 X133.273 Y123.612 E-.07049
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.4 I.293 J1.181 P1  F30000
G1 X133.757 Y123.492 Z11.4
G1 Z11
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
G1 F1200
G1 X134.842 Y124.576 E.04712
G1 X134.614 Y124.882
G1 X133.451 Y123.719 E.05053
G1 X133.276 Y124.077
G1 X134.255 Y125.056 E.04254
M204 S10000
; WIPE_START
G1 F24000
G1 X133.276 Y124.077 E-.52606
G1 X133.451 Y123.719 E-.15157
M73 P97 R0
G1 X133.604 Y123.872 E-.08237
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.4 I-.306 J1.178 P1  F30000
G1 X134.929 Y124.216 Z11.4
G1 Z11
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.373029
G1 F1200
G1 X134.587 Y123.805 E.01438
G1 X134.469 Y123.694 E.00437
; LINE_WIDTH: 0.386016
G1 X134.275 Y123.551 E.00674
; LINE_WIDTH: 0.360756
G1 X134.08 Y123.408 E.00624
G1 X133.699 Y123.523 F30000
; LINE_WIDTH: 0.0950009
G1 F1200
G1 X133.624 Y123.578 E.0004
G1 X133.581 Y123.571 E.00019
; WIPE_START
G1 F24000
G1 X133.624 Y123.578 E-.24374
G1 X133.699 Y123.523 E-.51626
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.4 I-1.201 J.199 P1  F30000
G1 X133.958 Y125.086 Z11.4
G1 Z11
G1 E.8 F1800
; LINE_WIDTH: 0.184303
G1 F1200
G1 X133.809 Y124.977 E.00213
; LINE_WIDTH: 0.239181
G3 X133.257 Y124.417 I1.263 J-1.799 E.01264
; WIPE_START
G1 F24000
G1 X133.526 Y124.741 E-.4056
G1 X133.809 Y124.977 E-.3544
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.4 I-1.213 J.095 P1  F30000
G1 X134.353 Y131.94 Z11.4
G1 Z11
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X134.929 Y131.721 I.73 J1.056 E.01913
G1 X135.244 Y131.722 E.00968
G3 X134.305 Y131.975 I-.161 J1.273 E.21716
M204 S10000
; WIPE_START
G1 F24000
G1 X134.628 Y131.795 E-.14058
G1 X134.929 Y131.721 E-.11791
G1 X135.244 Y131.722 E-.11971
G1 X135.542 Y131.795 E-.11643
G1 X135.817 Y131.94 E-.11803
G1 X136.049 Y132.146 E-.11804
G1 X136.093 Y132.209 E-.0293
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.4 I-1.213 J.097 P1  F30000
G1 X136.141 Y132.808 Z11.4
G1 Z11
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
G1 F1200
G1 X135.277 Y131.944 E.03757
G1 X134.773 Y131.973
G1 X136.112 Y133.313 E.05821
G1 X135.929 Y133.663
G1 X134.422 Y132.155 E.06551
G1 X134.171 Y132.438
G1 X135.648 Y133.915 E.06418
G1 X135.26 Y134.06
G1 X134.026 Y132.826 E.05363
M204 S10000
; WIPE_START
G1 F24000
G1 X135.26 Y134.06 E-.66318
G1 X135.499 Y133.971 E-.09682
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.4 I-.245 J-1.192 P1  F30000
G1 X134.936 Y134.086 Z11.4
G1 Z11
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.238372
G1 F1200
G1 X134.737 Y133.94 E.00393
; LINE_WIDTH: 0.30889
G3 X134.366 Y133.632 I1.069 J-1.662 E.01048
G1 X134.011 Y133.206 E.01202
G1 X134.106 Y132.64 F30000
; LINE_WIDTH: 0.116508
G1 F1200
G1 X134.025 Y132.806 E.00111
; WIPE_START
G1 F24000
G1 X134.106 Y132.64 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.4 I.876 J.845 P1  F30000
G1 X134.745 Y131.978 Z11.4
G1 Z11
G1 E.8 F1800
; LINE_WIDTH: 0.097071
G1 F1200
G2 X134.606 Y132.073 I.323 J.619 E.00075
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F24000
G1 X134.745 Y131.978 E-.76
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
G1 Z11.5 F900 ; lower z a little
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

    G1 Z111 F600
    G1 Z109

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

