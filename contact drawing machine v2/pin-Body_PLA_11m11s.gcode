; HEADER_BLOCK_START
; BambuStudio 01.06.02.04
; model printing time: 5m 23s; total estimated time: 11m 11s
; total layer number: 350
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
M73 P39 R6
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
G1 E50 F200
M400
M106 P1 S255
G92 E0
G1 E5 F300
M109 S200 ; drop nozzle temp, make filament shink a bit
G92 E0
G1 E-0.5 F300

M73 P40 R6
G1 X70 F9000
M73 P42 R6
G1 X76 F15000
M73 P44 R6
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
M73 P45 R6
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
    G29 A X124.934 Y125.712 I8.5813 J8.57551
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
M73 P46 R6
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
M73 P46 R5
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
; layer num/total_layer_count: 1/350
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
G1 X126.432 Y125.051 F30000
G1 Z.4
M73 P47 R5
G1 Z.2
G1 E.8 F1800
; FEATURE: Brim
; LINE_WIDTH: 0.5
G1 F1200
G1 X126.739 Y124.787 E.01509
G1 X127.072 Y124.555 E.01508
G1 X127.425 Y124.358 E.01508
G1 X127.797 Y124.197 E.01509
G1 X128.183 Y124.074 E.01508
G1 X128.578 Y123.989 E.01507
M73 P48 R5
G1 X128.981 Y123.945 E.01508
G1 X129.386 Y123.941 E.01508
G1 X129.789 Y123.977 E.01508
G1 X130.187 Y124.053 E.01508
G1 X130.577 Y124.169 E.01517
G1 X130.815 Y124.262 E.00949
G1 X131.181 Y124.439 E.01515
M73 P49 R5
G1 X131.525 Y124.652 E.01508
G1 X131.847 Y124.898 E.01508
G1 X132.143 Y125.174 E.01509
G1 X132.41 Y125.479 E.01509
G1 X132.645 Y125.808 E.01508
G1 X132.847 Y126.16 E.01509
G1 X133.012 Y126.53 E.0151
G1 X133.143 Y126.925 E.01549
M73 P50 R5
G1 X133.219 Y127.257 E.01268
G1 X133.273 Y127.655 E.01499
G1 X133.287 Y128.061 E.0151
G1 X133.261 Y128.464 E.01507
G1 X133.194 Y128.864 E.01508
G1 X133.089 Y129.254 E.01508
G1 X132.945 Y129.633 E.01508
G1 X132.764 Y129.995 E.01508
G1 X132.547 Y130.338 E.0151
G1 X132.298 Y130.657 E.01509
G1 X132.018 Y130.95 E.01508
G1 X131.71 Y131.213 E.01509
G1 X131.378 Y131.445 E.01506
G1 X131.025 Y131.642 E.01508
G1 X130.653 Y131.803 E.01509
G1 X130.267 Y131.926 E.0151
G1 X129.871 Y132.011 E.01507
G1 X129.469 Y132.055 E.01507
G1 X129.064 Y132.059 E.01508
G1 X128.661 Y132.023 E.01508
M73 P51 R5
G1 X128.261 Y131.946 E.01516
G1 X128.015 Y131.878 E.0095
G1 X127.633 Y131.737 E.01517
G1 X127.269 Y131.561 E.01506
G1 X126.925 Y131.348 E.01508
G1 X126.603 Y131.102 E.01508
G1 X126.307 Y130.826 E.01508
G1 X126.04 Y130.521 E.01508
G1 X125.805 Y130.192 E.01508
G1 X125.603 Y129.84 E.01509
G1 X125.433 Y129.46 E.01552
G1 X125.325 Y129.138 E.01266
G1 X125.232 Y128.746 E.01498
G1 X125.177 Y128.345 E.01508
G1 X125.163 Y127.94 E.01509
G1 X125.189 Y127.536 E.01509
G1 X125.256 Y127.137 E.01508
G1 X125.361 Y126.746 E.01508
G1 X125.505 Y126.367 E.01509
G1 X125.686 Y126.005 E.01508
G1 X125.903 Y125.662 E.01508
G1 X126.152 Y125.343 E.01509
G1 X126.39 Y125.094 E.01284
G1 X126.72 Y125.411 F30000
G1 F1200
G1 X126.751 Y125.378 E.00167
G1 X127.025 Y125.145 E.01339
G1 X127.32 Y124.94 E.01338
G1 X127.634 Y124.766 E.01338
G1 X127.964 Y124.623 E.01339
G1 X128.307 Y124.515 E.01338
G1 X128.658 Y124.441 E.01337
G1 X129.015 Y124.402 E.01338
G1 X129.375 Y124.399 E.01338
G1 X129.732 Y124.432 E.01338
G1 X130.085 Y124.5 E.01338
G1 X130.441 Y124.607 E.01384
G1 X130.95 Y124.836 E.02081
G1 X131.272 Y125.033 E.01404
G1 X131.557 Y125.252 E.01338
G1 X131.819 Y125.498 E.01338
G1 X132.055 Y125.768 E.01339
G1 X132.263 Y126.061 E.01338
G1 X132.441 Y126.374 E.01339
G1 X132.583 Y126.69 E.0129
G1 X132.7 Y127.041 E.01381
G1 X132.769 Y127.344 E.01156
G1 X132.817 Y127.701 E.01341
M73 P52 R5
G1 X132.829 Y128.061 E.01341
G1 X132.805 Y128.419 E.01337
G1 X132.745 Y128.773 E.01338
G1 X132.651 Y129.119 E.01338
G1 X132.523 Y129.455 E.01338
G1 X132.361 Y129.776 E.01338
G1 X132.169 Y130.08 E.0134
G1 X131.947 Y130.363 E.01339
G1 X131.698 Y130.622 E.01338
G1 X131.425 Y130.855 E.01339
G1 X131.13 Y131.06 E.01337
G1 X130.816 Y131.234 E.01338
G1 X130.486 Y131.377 E.01339
G1 X130.143 Y131.485 E.01339
G1 X129.792 Y131.559 E.01337
G1 X129.435 Y131.598 E.01337
G1 X129.075 Y131.601 E.01338
G1 X128.713 Y131.568 E.01354
G1 X128.168 Y131.446 E.02082
G1 X127.806 Y131.313 E.01435
G1 X127.484 Y131.156 E.01336
G1 X127.178 Y130.967 E.01338
G1 X126.893 Y130.748 E.01338
G1 X126.631 Y130.502 E.01338
G1 X126.395 Y130.232 E.01338
G1 X126.187 Y129.939 E.01338
G1 X126.008 Y129.626 E.01339
G1 X125.862 Y129.3 E.01334
G1 X125.764 Y129.006 E.01154
G1 X125.681 Y128.656 E.0134
G1 X125.633 Y128.299 E.01339
G1 X125.621 Y127.94 E.01339
G1 X125.645 Y127.581 E.01339
G1 X125.705 Y127.227 E.01338
G1 X125.799 Y126.881 E.01338
G1 X125.927 Y126.545 E.01339
G1 X126.089 Y126.224 E.01338
G1 X126.281 Y125.92 E.01338
G1 X126.503 Y125.638 E.01339
G1 X126.679 Y125.454 E.00947
G1 X127.008 Y125.772 F30000
G1 F1200
G1 X127.071 Y125.707 E.00335
G1 X127.31 Y125.504 E.01169
G1 X127.568 Y125.325 E.01168
G1 X127.843 Y125.174 E.01168
G1 X128.131 Y125.05 E.01169
G1 X128.43 Y124.956 E.01168
G1 X128.737 Y124.892 E.01167
G1 X129.049 Y124.859 E.01168
G1 X129.362 Y124.857 E.01168
G1 X129.675 Y124.886 E.01168
G1 X129.982 Y124.946 E.01167
G1 X130.289 Y125.04 E.01194
G1 X130.728 Y125.237 E.01794
G1 X131.018 Y125.415 E.01266
G1 X131.266 Y125.605 E.01165
G1 X131.494 Y125.821 E.01168
G1 X131.692 Y126.047 E.01118
G1 X131.874 Y126.302 E.01168
G1 X132.03 Y126.575 E.01171
G1 X132.154 Y126.85 E.01124
G1 X132.258 Y127.158 E.01213
G1 X132.32 Y127.431 E.01042
G1 X132.361 Y127.745 E.0118
G1 X132.371 Y128.06 E.01171
G1 X132.349 Y128.372 E.01167
G1 X132.297 Y128.681 E.01168
G1 X132.214 Y128.984 E.01168
G1 X132.101 Y129.276 E.01168
G1 X131.959 Y129.556 E.01168
G1 X131.791 Y129.821 E.0117
G1 X131.597 Y130.068 E.01169
G1 X131.379 Y130.293 E.01168
G1 X131.14 Y130.497 E.01169
G1 X130.882 Y130.675 E.01167
G1 X130.607 Y130.826 E.01168
G1 X130.319 Y130.95 E.01169
G1 X130.02 Y131.044 E.01169
G1 X129.713 Y131.108 E.01167
G1 X129.401 Y131.141 E.01167
G1 X129.088 Y131.143 E.01168
G1 X128.776 Y131.113 E.01166
G1 X128.306 Y131.008 E.01795
G1 X127.979 Y130.889 E.01294
G1 X127.699 Y130.752 E.01163
G1 X127.433 Y130.586 E.01168
G1 X127.184 Y130.395 E.01168
G1 X126.956 Y130.18 E.01168
G1 X126.759 Y129.953 E.01118
G1 X126.576 Y129.698 E.01168
G1 X126.42 Y129.425 E.01172
G1 X126.291 Y129.139 E.01168
G1 X126.202 Y128.874 E.01041
G1 X126.13 Y128.566 E.0118
G1 X126.089 Y128.255 E.0117
G1 X126.079 Y127.941 E.01169
G1 X126.101 Y127.628 E.01169
G1 X126.153 Y127.319 E.01167
G1 X126.236 Y127.016 E.01168
G1 X126.349 Y126.724 E.01169
G1 X126.491 Y126.444 E.01168
G1 X126.659 Y126.179 E.01168
G1 X126.853 Y125.933 E.01168
G1 X126.967 Y125.815 E.00609
G1 X127.291 Y126.148 F30000
G1 F1200
G1 X127.535 Y125.911 E.01268
G1 X127.972 Y125.624 E.01947
G1 X128.466 Y125.424 E.01987
G1 X128.992 Y125.324 E.01992
G1 X129.526 Y125.331 E.01992
G1 X130.049 Y125.444 E.01993
G1 X130.539 Y125.658 E.01992
G1 X130.977 Y125.965 E.01992
G1 X131.346 Y126.352 E.01992
G1 X131.631 Y126.807 E.01998
G1 X131.81 Y127.268 E.01844
G1 X131.902 Y127.787 E.01961
G1 X131.891 Y128.321 E.01989
G1 X131.775 Y128.843 E.01992
G1 X131.558 Y129.331 E.01989
G1 X131.256 Y129.758 E.0195
G1 X130.915 Y130.089 E.01769
G1 X130.478 Y130.376 E.01946
G1 X129.983 Y130.576 E.01989
G1 X129.458 Y130.676 E.01991
G1 X128.923 Y130.669 E.01992
G1 X128.4 Y130.556 E.01993
G1 X127.91 Y130.342 E.01991
G1 X127.473 Y130.035 E.01991
G1 X127.104 Y129.648 E.01992
G1 X126.819 Y129.194 E.01996
G1 X126.64 Y128.732 E.01844
G1 X126.548 Y128.214 E.01961
G1 X126.559 Y127.679 E.0199
G1 X126.675 Y127.158 E.01992
G1 X126.892 Y126.67 E.01989
G1 X127.194 Y126.242 E.01949
G1 X127.247 Y126.19 E.00278
G1 X127.567 Y126.506 F30000
G1 F1200
G1 X127.854 Y126.239 E.01459
G1 X128.224 Y126.005 E.01631
G1 X128.64 Y125.847 E.01655
G1 X129.078 Y125.773 E.01655
G1 X129.522 Y125.788 E.01655
G1 X129.954 Y125.891 E.01656
G1 X130.358 Y126.077 E.01655
G1 X130.716 Y126.34 E.01655
G1 X131.016 Y126.668 E.01655
G1 X131.244 Y127.05 E.01658
G1 X131.384 Y127.434 E.01523
G1 X131.453 Y127.869 E.01638
G1 X131.435 Y128.313 E.01655
G1 X131.329 Y128.744 E.01655
G1 X131.14 Y129.146 E.01652
G1 X130.882 Y129.495 E.01615
G1 X130.596 Y129.762 E.01459
G1 X130.226 Y129.995 E.0163
G1 X129.81 Y130.154 E.01657
G1 X129.372 Y130.227 E.01654
G1 X128.928 Y130.212 E.01655
G1 X128.495 Y130.109 E.01657
G1 X128.092 Y129.923 E.01654
G1 X127.734 Y129.66 E.01655
G1 X127.434 Y129.332 E.01655
G1 X127.206 Y128.95 E.01658
G1 X127.066 Y128.566 E.01522
G1 X126.997 Y128.132 E.01638
G1 X127.015 Y127.687 E.01656
G1 X127.121 Y127.256 E.01655
G1 X127.31 Y126.854 E.01652
G1 X127.532 Y126.554 E.01391
G1 X127.891 Y126.833 F30000
G1 F1200
G1 X127.934 Y126.779 E.00258
G1 X128.164 Y126.574 E.0115
G1 X128.468 Y126.392 E.01318
G1 X128.802 Y126.274 E.01318
G1 X129.152 Y126.224 E.01318
G1 X129.505 Y126.245 E.01318
G1 X129.848 Y126.335 E.01319
G1 X130.165 Y126.492 E.01318
G1 X130.445 Y126.708 E.01318
G1 X130.677 Y126.975 E.01318
G1 X130.852 Y127.284 E.01319
G1 X130.954 Y127.589 E.01201
G1 X131.001 Y127.94 E.01318
G1 X130.978 Y128.293 E.01318
G1 X130.885 Y128.634 E.01318
G1 X130.727 Y128.95 E.01316
G1 X130.516 Y129.221 E.0128
G1 X130.285 Y129.426 E.0115
G1 X129.982 Y129.608 E.01318
G1 X129.648 Y129.726 E.01319
G1 X129.298 Y129.776 E.01317
G1 X128.945 Y129.755 E.01318
G1 X128.602 Y129.665 E.01319
G1 X128.285 Y129.508 E.01317
G1 X128.005 Y129.292 E.01318
G1 X127.773 Y129.025 E.01318
G1 X127.598 Y128.717 E.01318
G1 X127.496 Y128.411 E.01201
G1 X127.449 Y128.06 E.01318
G1 X127.472 Y127.707 E.01319
G1 X127.565 Y127.366 E.01318
G1 X127.723 Y127.05 E.01316
G1 X127.854 Y126.881 E.00797
; WIPE_START
G1 F24000
G1 X127.934 Y126.779 E-.04911
G1 X128.164 Y126.574 E-.11734
G1 X128.468 Y126.392 E-.1345
G1 X128.802 Y126.274 E-.13445
G1 X129.152 Y126.224 E-.13449
G1 X129.505 Y126.245 E-.13449
G1 X129.647 Y126.282 E-.05562
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-1.213 J.103 P1  F30000
G1 X129.829 Y128.427 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X129.816 Y128.448 E.00093
G3 X129.206 Y127.258 I-.591 J-.448 E.11155
G1 X129.28 Y127.26 E.00276
G3 X129.893 Y128.322 I-.055 J.74 E.05373
G1 X129.86 Y128.375 E.00234
G1 X130.218 Y128.664 F30000
; FEATURE: Outer wall
G1 F1200
G1 X130.18 Y128.724 E.00262
G3 X129.195 Y126.801 I-.955 J-.724 E.18034
G1 X129.315 Y126.804 E.00445
G3 X130.305 Y128.52 I-.09 J1.196 E.08687
G1 X130.249 Y128.613 E.00404
G1 X129.77 Y128.114 F30000
; FEATURE: Bottom surface
; LINE_WIDTH: 0.591415
G1 F1200
G1 X129.317 Y127.661 E.02861
G2 X128.874 Y127.994 I-.081 J.352 E.0282
G1 X129.407 Y128.527 E.03369
M106 S255
M106 P2 S178
; CHANGE_LAYER
; Z_HEIGHT: 0.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X128.874 Y127.994 E-.28645
G1 X128.908 Y127.847 E-.0572
G1 X128.992 Y127.736 E-.05292
G1 X129.113 Y127.667 E-.05298
G1 X129.181 Y127.651 E-.02657
G1 X129.317 Y127.661 E-.05172
G1 X129.749 Y128.093 E-.23216
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 2/350
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
G3 Z.6 I-1.111 J.496 P1  F30000
G1 X129.921 Y128.478 Z.6
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.899 Y128.511 E.00131
G3 X129.204 Y127.153 I-.675 J-.512 E.11342
G1 X129.288 Y127.155 E.00279
G3 X129.988 Y128.367 I-.063 J.844 E.05463
G1 X129.952 Y128.426 E.0023
G1 X130.254 Y128.681 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.212 Y128.748 E.00242
G3 X129.194 Y126.761 I-.987 J-.749 E.15375
G1 X129.317 Y126.764 E.00379
G3 X130.341 Y128.537 I-.092 J1.236 E.07406
G1 X130.285 Y128.63 E.00333
M204 S10000
G1 X129.676 Y128.018 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.666 Y127.943 E.00232
G1 X129.57 Y127.711 E.00773
G1 X129.342 Y127.574 E.00816
G1 X129.145 Y127.561 E.00607
G1 X128.929 Y127.672 E.00744
G1 X128.789 Y127.889 E.00793
G1 X128.78 Y128.059 E.00523
G1 X128.89 Y128.299 E.00811
G1 X129.11 Y128.426 E.00781
G1 X129.368 Y128.427 E.00793
G1 X129.578 Y128.265 E.00812
G1 X129.654 Y128.074 E.00633
; CHANGE_LAYER
; Z_HEIGHT: 0.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.578 Y128.265 E-.07833
G1 X129.368 Y128.427 E-.10048
G1 X129.11 Y128.426 E-.09806
G1 X128.89 Y128.299 E-.09662
G1 X128.78 Y128.059 E-.10028
G1 X128.789 Y127.889 E-.06464
G1 X128.929 Y127.672 E-.09812
G1 X129.145 Y127.561 E-.09207
G1 X129.227 Y127.567 E-.03142
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 3/350
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
G3 Z.8 I-.94 J.773 P1  F30000
G1 X129.947 Y128.442 Z.8
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.204 Y127.153 I-.722 J-.442 E.11622
G1 X129.288 Y127.155 E.00278
G3 X129.976 Y128.389 I-.063 J.844 E.05547
G1 X130.262 Y128.674 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.133 Y128.843 E.00654
G3 X129.194 Y126.761 I-.908 J-.843 E.14995
G1 X129.317 Y126.764 E.00378
G3 X130.295 Y128.624 I-.092 J1.236 E.07708
M204 S10000
G1 X129.654 Y128 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G2 X129.43 Y127.599 I-.501 J.016 E.01465
M73 P53 R5
G1 X129.178 Y127.55 E.0079
G1 X128.932 Y127.67 E.00842
G1 X128.787 Y127.892 E.00814
G1 X128.804 Y128.131 E.00736
G1 X128.944 Y128.352 E.00805
G1 X129.195 Y128.44 E.00816
G1 X129.45 Y128.39 E.008
G1 X129.617 Y128.203 E.00771
G1 X129.643 Y128.059 E.00448
G1 X129.249 Y127.945 F30000
; LINE_WIDTH: 0.53584
G1 F1200
G2 X129.25 Y128.051 I-.025 J.053 E.00951
; CHANGE_LAYER
; Z_HEIGHT: 0.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.188 Y128.052 E-.1919
G1 X129.157 Y127.999 E-.18937
G1 X129.188 Y127.945 E-.18937
G1 X129.249 Y127.945 E-.18937
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 4/350
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
G3 Z1 I-.706 J.991 P1  F30000
G1 X129.947 Y128.442 Z1
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.204 Y127.153 I-.722 J-.442 E.11621
G1 X129.287 Y127.155 E.00277
G3 X129.976 Y128.39 I-.063 J.844 E.05548
G1 X130.264 Y128.672 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.132 Y128.843 E.00662
G3 X129.194 Y126.761 I-.908 J-.843 E.14995
G1 X129.317 Y126.764 E.00377
G3 X130.296 Y128.622 I-.092 J1.236 E.07701
M204 S10000
G1 X129.654 Y128.003 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G2 X129.431 Y127.599 I-.5 J.014 E.01473
G1 X129.168 Y127.562 E.00814
G1 X128.927 Y127.662 E.00802
G1 X128.799 Y127.886 E.00793
G1 X128.799 Y128.141 E.00782
G1 X128.952 Y128.356 E.0081
G1 X129.197 Y128.44 E.00797
G1 X129.45 Y128.39 E.00793
G1 X129.617 Y128.203 E.00771
G1 X129.643 Y128.062 E.00441
G1 X129.252 Y127.938 F30000
; LINE_WIDTH: 0.5289
G1 F1200
G2 X129.252 Y128.043 I-.025 J.052 E.00922
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.191 Y128.043 E-.19089
G1 X129.161 Y127.991 E-.1897
G1 X129.191 Y127.938 E-.18971
G1 X129.252 Y127.938 E-.1897
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 5/350
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
G3 Z1.2 I-.715 J.985 P1  F30000
G1 X129.947 Y128.442 Z1.2
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.204 Y127.153 I-.722 J-.443 E.11621
G1 X129.287 Y127.155 E.00276
G3 X129.976 Y128.39 I-.063 J.844 E.05549
G1 X130.265 Y128.67 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.132 Y128.843 E.0067
G3 X129.194 Y126.761 I-.908 J-.843 E.14995
G1 X129.316 Y126.764 E.00376
G3 X130.297 Y128.619 I-.092 J1.236 E.07693
M204 S10000
G1 X129.676 Y128.014 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.666 Y127.94 E.00229
G1 X129.57 Y127.71 E.00767
G1 X129.341 Y127.574 E.00817
G1 X129.145 Y127.561 E.00605
G1 X128.929 Y127.672 E.00746
G1 X128.789 Y127.889 E.00793
G1 X128.78 Y128.059 E.00523
G1 X128.891 Y128.299 E.00813
G1 X129.11 Y128.426 E.0078
G1 X129.368 Y128.427 E.00793
G1 X129.578 Y128.265 E.00812
G1 X129.654 Y128.07 E.00644
; CHANGE_LAYER
; Z_HEIGHT: 1.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.578 Y128.265 E-.07967
G1 X129.368 Y128.427 E-.10039
G1 X129.11 Y128.426 E-.09805
G1 X128.891 Y128.299 E-.09642
G1 X128.78 Y128.059 E-.10049
G1 X128.789 Y127.889 E-.06463
G1 X128.929 Y127.672 E-.0981
G1 X129.145 Y127.561 E-.09221
G1 X129.224 Y127.567 E-.03004
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 6/350
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
G3 Z1.4 I-.939 J.774 P1  F30000
G1 X129.946 Y128.442 Z1.4
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.204 Y127.153 I-.722 J-.443 E.11621
G1 X129.287 Y127.155 E.00276
G3 X129.976 Y128.39 I-.062 J.844 E.05551
G1 X130.267 Y128.668 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.132 Y128.843 E.00678
G3 X129.194 Y126.761 I-.908 J-.843 E.14995
G1 X129.316 Y126.764 E.00375
G3 X130.299 Y128.617 I-.092 J1.236 E.07686
M204 S10000
G1 X129.676 Y128.015 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.666 Y127.941 E.0023
G1 X129.57 Y127.71 E.00767
G1 X129.341 Y127.574 E.00816
G1 X129.145 Y127.561 E.00604
G1 X128.929 Y127.672 E.00745
G1 X128.789 Y127.889 E.00794
G1 X128.78 Y128.059 E.00525
G1 X128.887 Y128.295 E.00796
G1 X129.11 Y128.426 E.00794
G1 X129.368 Y128.427 E.00794
G1 X129.578 Y128.265 E.00812
G1 X129.654 Y128.071 E.00643
; CHANGE_LAYER
; Z_HEIGHT: 1.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.578 Y128.265 E-.07948
G1 X129.368 Y128.427 E-.10042
G1 X129.11 Y128.426 E-.09822
G1 X128.887 Y128.295 E-.09816
G1 X128.78 Y128.059 E-.09839
G1 X128.789 Y127.889 E-.06489
G1 X128.929 Y127.672 E-.09822
G1 X129.145 Y127.561 E-.09214
G1 X129.224 Y127.567 E-.0301
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 7/350
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
G3 Z1.6 I-.939 J.774 P1  F30000
G1 X129.946 Y128.442 Z1.6
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.204 Y127.153 I-.722 J-.443 E.1162
G1 X129.287 Y127.155 E.00275
G3 X129.976 Y128.39 I-.062 J.844 E.05552
G1 X130.268 Y128.666 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.132 Y128.843 E.00687
G3 X129.194 Y126.761 I-.907 J-.844 E.14995
G1 X129.316 Y126.764 E.00374
G3 X130.3 Y128.615 I-.091 J1.236 E.07678
M204 S10000
G1 X129.666 Y127.941 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.57 Y127.71 E.00768
G1 X129.343 Y127.575 E.00811
G1 X129.082 Y127.573 E.00803
G1 X128.873 Y127.733 E.00808
G1 X128.774 Y127.983 E.00824
G1 X128.837 Y128.211 E.00729
G1 X129.02 Y128.401 E.00808
G1 X129.28 Y128.438 E.00808
G1 X129.523 Y128.338 E.00808
G1 X129.653 Y128.107 E.00815
G1 X129.661 Y128.001 E.00327
; CHANGE_LAYER
; Z_HEIGHT: 1.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.653 Y128.107 E-.04039
G1 X129.523 Y128.338 E-.10075
G1 X129.28 Y128.438 E-.09987
G1 X129.02 Y128.401 E-.09996
G1 X128.837 Y128.211 E-.09988
G1 X128.774 Y127.983 E-.09011
G1 X128.873 Y127.733 E-.10191
G1 X129.082 Y127.573 E-.09988
G1 X129.153 Y127.574 E-.02725
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 8/350
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
G3 Z1.8 I-.899 J.82 P1  F30000
G1 X129.946 Y128.442 Z1.8
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.204 Y127.153 I-.721 J-.443 E.1162
G1 X129.287 Y127.155 E.00274
G3 X129.976 Y128.39 I-.062 J.844 E.05553
G1 X130.27 Y128.664 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.132 Y128.843 E.00696
G3 X129.194 Y126.761 I-.907 J-.844 E.14995
G1 X129.316 Y126.764 E.00373
G3 X130.301 Y128.612 I-.091 J1.236 E.0767
M204 S10000
G1 X129.676 Y128.016 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.666 Y127.941 E.00232
G1 X129.57 Y127.71 E.00768
G1 X129.341 Y127.574 E.00817
G1 X129.145 Y127.561 E.00603
G1 X128.929 Y127.672 E.00746
G1 X128.789 Y127.889 E.00794
G1 X128.78 Y128.059 E.00525
G1 X128.888 Y128.295 E.00797
G1 X129.11 Y128.426 E.00793
G1 X129.368 Y128.427 E.00794
G1 X129.578 Y128.265 E.00813
G1 X129.654 Y128.071 E.00639
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.578 Y128.265 E-.07897
G1 X129.368 Y128.427 E-.1006
G1 X129.11 Y128.426 E-.0982
G1 X128.888 Y128.295 E-.09804
G1 X128.78 Y128.059 E-.09852
G1 X128.789 Y127.889 E-.06488
G1 X128.929 Y127.672 E-.09821
G1 X129.145 Y127.561 E-.09224
G1 X129.225 Y127.567 E-.03033
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 9/350
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
G3 Z2 I-.94 J.773 P1  F30000
G1 X129.946 Y128.443 Z2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.204 Y127.153 I-.721 J-.443 E.1162
G1 X129.286 Y127.155 E.00273
G3 X129.975 Y128.39 I-.062 J.844 E.05554
G1 X130.272 Y128.661 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.132 Y128.843 E.00704
G3 X129.194 Y126.761 I-.907 J-.844 E.14995
G1 X129.315 Y126.764 E.00373
G3 X130.302 Y128.61 I-.091 J1.236 E.07663
M204 S10000
G1 X129.666 Y127.941 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.57 Y127.71 E.00769
G1 X129.342 Y127.575 E.00813
G1 X129.082 Y127.573 E.00801
G1 X128.873 Y127.734 E.00808
G1 X128.775 Y127.978 E.00808
G1 X128.848 Y128.23 E.00807
G1 X129.044 Y128.413 E.00824
G1 X129.28 Y128.438 E.00728
G1 X129.523 Y128.338 E.00807
G1 X129.653 Y128.107 E.00814
G1 X129.661 Y128.001 E.00327
M73 P54 R5
G1 X129.257 Y127.945 F30000
; LINE_WIDTH: 0.548158
G1 F1200
G2 X129.258 Y128.052 I-.026 J.054 E.01005
; CHANGE_LAYER
; Z_HEIGHT: 2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.193 Y128.055 E-.19367
G1 X129.162 Y128 E-.18878
G1 X129.193 Y127.945 E-.18878
G1 X129.257 Y127.945 E-.18878
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 10/350
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
G3 Z2.2 I-.712 J.987 P1  F30000
G1 X129.946 Y128.443 Z2.2
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.204 Y127.153 I-.721 J-.443 E.11619
G1 X129.286 Y127.155 E.00272
G3 X129.975 Y128.391 I-.062 J.844 E.05555
G1 X130.273 Y128.659 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.132 Y128.843 E.00713
G3 X129.194 Y126.761 I-.907 J-.844 E.14995
G1 X129.315 Y126.764 E.00372
G3 X130.304 Y128.608 I-.091 J1.236 E.07655
M204 S10000
G1 X129.676 Y128.017 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.666 Y127.941 E.00233
G1 X129.57 Y127.71 E.00769
G1 X129.341 Y127.574 E.00817
G1 X129.146 Y127.561 E.00601
G1 X128.929 Y127.672 E.00747
G1 X128.789 Y127.889 E.00794
G1 X128.78 Y128.059 E.00524
G1 X128.888 Y128.296 E.00798
G1 X129.11 Y128.426 E.00792
G1 X129.368 Y128.427 E.00794
G1 X129.578 Y128.264 E.00815
G1 X129.654 Y128.072 E.00635
; CHANGE_LAYER
; Z_HEIGHT: 2.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.578 Y128.264 E-.07847
G1 X129.368 Y128.427 E-.10078
G1 X129.11 Y128.426 E-.09819
G1 X128.888 Y128.296 E-.09793
G1 X128.78 Y128.059 E-.09866
G1 X128.789 Y127.889 E-.06486
G1 X128.929 Y127.672 E-.09822
G1 X129.146 Y127.561 E-.09232
G1 X129.226 Y127.567 E-.03057
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 11/350
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
G3 Z2.4 I-.94 J.772 P1  F30000
G1 X129.946 Y128.443 Z2.4
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.204 Y127.153 I-.721 J-.443 E.11619
G1 X129.286 Y127.155 E.00272
G3 X129.975 Y128.391 I-.062 J.844 E.05556
G1 X130.275 Y128.657 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.132 Y128.843 E.00721
G3 X129.194 Y126.761 I-.907 J-.844 E.14995
G1 X129.315 Y126.764 E.00371
G3 X130.305 Y128.605 I-.091 J1.236 E.07647
M204 S10000
G1 X129.676 Y128.017 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.666 Y127.941 E.00234
G1 X129.57 Y127.71 E.0077
G1 X129.341 Y127.574 E.00817
G1 X129.146 Y127.561 E.00601
G1 X128.929 Y127.672 E.00747
G1 X128.789 Y127.889 E.00794
G1 X128.78 Y128.059 E.00524
G1 X128.888 Y128.296 E.00798
G1 X129.11 Y128.426 E.00791
G1 X129.368 Y128.427 E.00794
G1 X129.578 Y128.264 E.00816
G1 X129.654 Y128.073 E.00633
; CHANGE_LAYER
; Z_HEIGHT: 2.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.578 Y128.264 E-.07823
G1 X129.368 Y128.427 E-.10087
G1 X129.11 Y128.426 E-.09818
G1 X128.888 Y128.296 E-.09788
G1 X128.78 Y128.059 E-.09872
G1 X128.789 Y127.889 E-.06486
G1 X128.929 Y127.672 E-.0982
G1 X129.146 Y127.561 E-.09238
G1 X129.226 Y127.567 E-.03068
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 12/350
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
G3 Z2.6 I-.941 J.772 P1  F30000
G1 X129.945 Y128.443 Z2.6
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.204 Y127.153 I-.721 J-.444 E.11619
G1 X129.286 Y127.155 E.00271
G3 X129.975 Y128.391 I-.061 J.844 E.05557
G1 X130.277 Y128.655 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.131 Y128.843 E.0073
G3 X129.194 Y126.761 I-.907 J-.844 E.14995
G1 X129.315 Y126.764 E.0037
G3 X130.306 Y128.603 I-.09 J1.236 E.0764
M204 S10000
G1 X129.676 Y128.017 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.666 Y127.942 E.00235
G1 X129.569 Y127.71 E.0077
G1 X129.34 Y127.574 E.00818
G1 X129.146 Y127.561 E.006
G1 X128.929 Y127.672 E.00748
G1 X128.789 Y127.889 E.00793
G1 X128.78 Y128.059 E.00523
G1 X128.89 Y128.298 E.0081
G1 X129.11 Y128.426 E.00782
G1 X129.368 Y128.427 E.00793
G1 X129.578 Y128.264 E.00817
G1 X129.654 Y128.073 E.0063
; CHANGE_LAYER
; Z_HEIGHT: 2.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.578 Y128.264 E-.07792
G1 X129.368 Y128.427 E-.10098
G1 X129.11 Y128.426 E-.09807
G1 X128.89 Y128.298 E-.09666
G1 X128.78 Y128.059 E-.1002
G1 X128.789 Y127.889 E-.06467
G1 X128.929 Y127.672 E-.09812
G1 X129.146 Y127.561 E-.09252
G1 X129.227 Y127.567 E-.03086
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 13/350
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
G3 Z2.8 I-.941 J.771 P1  F30000
G1 X129.945 Y128.443 Z2.8
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.204 Y127.153 I-.721 J-.444 E.11618
G1 X129.285 Y127.155 E.0027
G3 X129.975 Y128.391 I-.061 J.844 E.05558
G1 X130.278 Y128.653 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.131 Y128.843 E.00738
G3 X129.194 Y126.761 I-.907 J-.844 E.14995
G1 X129.314 Y126.764 E.00369
G3 X130.307 Y128.601 I-.09 J1.236 E.07634
M204 S10000
G1 X129.676 Y128.018 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.666 Y127.942 E.00236
G1 X129.569 Y127.71 E.00771
G1 X129.34 Y127.574 E.00818
G1 X129.146 Y127.561 E.00599
G1 X128.929 Y127.672 E.00748
G1 X128.789 Y127.889 E.00794
G1 X128.78 Y128.059 E.00524
G1 X128.888 Y128.296 E.00799
G1 X129.11 Y128.426 E.00791
G1 X129.368 Y128.427 E.00794
G1 X129.579 Y128.264 E.00817
G1 X129.654 Y128.074 E.00629
; CHANGE_LAYER
; Z_HEIGHT: 2.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.579 Y128.264 E-.07773
G1 X129.368 Y128.427 E-.10104
G1 X129.11 Y128.426 E-.09817
G1 X128.888 Y128.296 E-.09777
G1 X128.78 Y128.059 E-.09885
G1 X128.789 Y127.889 E-.06484
G1 X128.929 Y127.672 E-.0982
G1 X129.146 Y127.561 E-.09248
G1 X129.227 Y127.567 E-.03092
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 14/350
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
G3 Z3 I-.942 J.771 P1  F30000
G1 X129.945 Y128.443 Z3
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.204 Y127.153 I-.721 J-.444 E.11618
G1 X129.285 Y127.155 E.00269
G3 X129.975 Y128.391 I-.061 J.844 E.0556
G1 X130.279 Y128.651 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.131 Y128.843 E.00745
G3 X129.194 Y126.761 I-.907 J-.844 E.14995
G1 X129.314 Y126.764 E.00368
G3 X130.308 Y128.599 I-.09 J1.236 E.07628
M204 S10000
G1 X129.676 Y128.018 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.666 Y127.942 E.00237
G1 X129.569 Y127.71 E.00771
G1 X129.438 Y127.605 E.00515
G1 X129.16 Y127.556 E.00869
G1 X128.929 Y127.673 E.00796
G1 X128.789 Y127.889 E.0079
G1 X128.78 Y128.059 E.00524
G1 X128.888 Y128.296 E.008
G1 X129.11 Y128.426 E.0079
G1 X129.368 Y128.427 E.00794
G1 X129.579 Y128.263 E.00822
G1 X129.654 Y128.074 E.00623
G1 X129.261 Y127.955 F30000
; LINE_WIDTH: 0.52942
G1 F1200
G2 X129.262 Y128.059 I-.025 J.052 E.00924
; CHANGE_LAYER
; Z_HEIGHT: 3
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.201 Y128.06 E-.19096
G1 X129.17 Y128.007 E-.18968
G1 X129.201 Y127.955 E-.18968
G1 X129.261 Y127.955 E-.18968
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 15/350
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
G3 Z3.2 I-.708 J.99 P1  F30000
G1 X129.945 Y128.443 Z3.2
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.204 Y127.153 I-.721 J-.444 E.11618
G1 X129.285 Y127.155 E.00268
G3 X129.975 Y128.391 I-.061 J.844 E.05561
G1 X130.279 Y128.648 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.194 Y126.761 I-1.055 J-.649 E.15749
G1 X129.314 Y126.764 E.00367
G3 X130.309 Y128.597 I-.09 J1.236 E.07619
M204 S10000
G1 X129.676 Y128.019 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.666 Y127.942 E.00238
G1 X129.569 Y127.71 E.00772
G1 X129.438 Y127.606 E.00515
G1 X129.16 Y127.556 E.00869
G1 X128.928 Y127.673 E.00796
G1 X128.789 Y127.889 E.0079
G1 X128.78 Y128.059 E.00524
G1 X128.888 Y128.296 E.008
G1 X129.11 Y128.426 E.0079
G1 X129.368 Y128.427 E.00794
G1 X129.58 Y128.262 E.00822
G1 X129.654 Y128.074 E.00621
G1 X129.261 Y127.955 F30000
; LINE_WIDTH: 0.529394
G1 F1200
G2 X129.262 Y128.059 I-.025 J.052 E.00924
; CHANGE_LAYER
; Z_HEIGHT: 3.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.201 Y128.06 E-.19096
G1 X129.17 Y128.007 E-.18968
G1 X129.201 Y127.955 E-.18968
G1 X129.261 Y127.955 E-.18968
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 16/350
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
G3 Z3.4 I-.708 J.99 P1  F30000
G1 X129.945 Y128.444 Z3.4
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.204 Y127.153 I-.721 J-.444 E.11617
G1 X129.285 Y127.155 E.00267
G3 X129.974 Y128.391 I-.061 J.844 E.05562
G1 X130.282 Y128.648 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.279 Y128.649 E.00008
G3 X129.194 Y126.761 I-1.055 J-.649 E.15748
G1 X129.313 Y126.764 E.00367
G3 X130.389 Y128.421 I-.089 J1.236 E.07027
G1 X130.307 Y128.594 E.00587
M204 S10000
G1 X129.665 Y127.942 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.569 Y127.71 E.00772
G1 X129.341 Y127.574 E.00816
G1 X129.082 Y127.573 E.00796
G1 X128.873 Y127.734 E.00809
G1 X128.775 Y127.978 E.00808
G1 X128.838 Y128.22 E.00768
G1 X129.02 Y128.401 E.00789
M73 P55 R5
G1 X129.28 Y128.438 E.00808
G1 X129.523 Y128.338 E.00807
G1 X129.653 Y128.107 E.00813
G1 X129.661 Y128.002 E.00325
G1 X129.257 Y127.945 F30000
; LINE_WIDTH: 0.547838
G1 F1200
G2 X129.258 Y128.052 I-.026 J.054 E.01003
; CHANGE_LAYER
; Z_HEIGHT: 3.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.193 Y128.055 E-.19362
G1 X129.162 Y128 E-.18879
G1 X129.193 Y127.945 E-.18879
G1 X129.257 Y127.945 E-.18879
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 17/350
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
G3 Z3.6 I-.714 J.986 P1  F30000
G1 X129.945 Y128.444 Z3.6
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.204 Y127.153 I-.721 J-.444 E.11617
G1 X129.284 Y127.155 E.00267
G3 X129.974 Y128.392 I-.061 J.844 E.05563
G1 X130.282 Y128.646 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.279 Y128.649 E.00013
G3 X129.194 Y126.761 I-1.055 J-.649 E.15748
G1 X129.313 Y126.764 E.00366
G3 X130.389 Y128.421 I-.089 J1.236 E.07027
G1 X130.308 Y128.592 E.00582
M204 S10000
G1 X129.665 Y127.942 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.569 Y127.71 E.00773
G1 X129.34 Y127.574 E.00817
G1 X129.082 Y127.573 E.00795
G1 X128.873 Y127.734 E.00809
G1 X128.775 Y127.978 E.00808
G1 X128.838 Y128.22 E.00769
G1 X129.02 Y128.401 E.00789
G1 X129.28 Y128.438 E.00808
G1 X129.523 Y128.338 E.00807
G1 X129.653 Y128.107 E.00813
G1 X129.661 Y128.002 E.00324
G1 X129.257 Y127.945 F30000
; LINE_WIDTH: 0.547824
G1 F1200
G2 X129.258 Y128.052 I-.026 J.054 E.01003
; CHANGE_LAYER
; Z_HEIGHT: 3.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.193 Y128.055 E-.19362
G1 X129.162 Y128 E-.18879
G1 X129.193 Y127.945 E-.18879
G1 X129.257 Y127.945 E-.18879
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 18/350
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
G3 Z3.8 I-.714 J.985 P1  F30000
G1 X129.944 Y128.444 Z3.8
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.204 Y127.153 I-.721 J-.444 E.11617
G1 X129.284 Y127.155 E.00266
G3 X129.974 Y128.392 I-.06 J.844 E.05564
G1 X130.283 Y128.645 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.279 Y128.649 E.00017
G3 X129.194 Y126.761 I-1.055 J-.65 E.15747
G1 X129.313 Y126.763 E.00365
G3 X130.389 Y128.421 I-.089 J1.236 E.07027
G1 X130.309 Y128.591 E.00579
M204 S10000
G1 X129.665 Y127.942 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.569 Y127.71 E.00773
G1 X129.34 Y127.574 E.00818
G1 X129.082 Y127.573 E.00794
G1 X128.873 Y127.734 E.00809
G1 X128.775 Y127.978 E.00808
G1 X128.838 Y128.22 E.00769
G1 X129.02 Y128.401 E.00788
G1 X129.28 Y128.438 E.00808
G1 X129.523 Y128.338 E.00807
G1 X129.653 Y128.107 E.00813
G1 X129.661 Y128.002 E.00324
G1 X129.257 Y127.945 F30000
; LINE_WIDTH: 0.547814
G1 F1200
G2 X129.258 Y128.052 I-.026 J.054 E.01003
; CHANGE_LAYER
; Z_HEIGHT: 3.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.193 Y128.055 E-.19362
G1 X129.162 Y128 E-.18879
G1 X129.193 Y127.945 E-.1888
G1 X129.257 Y127.945 E-.18879
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 19/350
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
G3 Z4 I-.713 J.986 P1  F30000
G1 X129.945 Y128.443 Z4
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.204 Y127.153 I-.721 J-.444 E.1162
G1 X129.284 Y127.155 E.00265
G3 X129.974 Y128.391 I-.06 J.844 E.05562
G1 X130.283 Y128.644 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.279 Y128.649 E.0002
G3 X129.194 Y126.761 I-1.055 J-.65 E.15748
G1 X129.313 Y126.763 E.00364
G3 X130.389 Y128.42 I-.089 J1.236 E.07026
G1 X130.309 Y128.59 E.00577
M204 S10000
G1 X129.665 Y127.942 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
M73 P55 R4
G1 X129.569 Y127.71 E.00771
G1 X129.34 Y127.574 E.00818
G1 X129.082 Y127.573 E.00793
G1 X128.873 Y127.734 E.00809
G1 X128.775 Y127.978 E.00808
G1 X128.848 Y128.23 E.00808
G1 X129.042 Y128.412 E.00816
G1 X129.28 Y128.438 E.00735
G1 X129.523 Y128.337 E.00809
G1 X129.652 Y128.109 E.00805
G1 X129.661 Y128.001 E.00332
G1 X129.256 Y127.945 F30000
; LINE_WIDTH: 0.548
G1 F1200
G2 X129.258 Y128.052 I-.026 J.054 E.01004
; CHANGE_LAYER
; Z_HEIGHT: 4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.193 Y128.055 E-.19364
G1 X129.162 Y128 E-.18879
G1 X129.193 Y127.945 E-.18879
G1 X129.256 Y127.945 E-.18878
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 20/350
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
G3 Z4.2 I-.713 J.986 P1  F30000
G1 X129.945 Y128.443 Z4.2
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.204 Y127.153 I-.721 J-.444 E.11619
G1 X129.284 Y127.155 E.00264
G3 X129.974 Y128.391 I-.06 J.844 E.05563
G1 X130.284 Y128.643 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.279 Y128.649 E.00024
G3 X129.194 Y126.761 I-1.055 J-.65 E.15748
G1 X129.312 Y126.763 E.00363
G3 X130.389 Y128.42 I-.089 J1.236 E.07026
G1 X130.309 Y128.589 E.00574
M204 S10000
G1 X129.665 Y127.942 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.569 Y127.71 E.00772
G1 X129.34 Y127.574 E.00819
G1 X129.082 Y127.573 E.00792
G1 X128.873 Y127.734 E.0081
G1 X128.775 Y127.977 E.00806
G1 X128.841 Y128.225 E.00787
G1 X129.02 Y128.401 E.00769
G1 X129.28 Y128.438 E.00808
G1 X129.523 Y128.337 E.0081
G1 X129.652 Y128.109 E.00804
G1 X129.661 Y128.002 E.00332
G1 X129.257 Y127.945 F30000
; LINE_WIDTH: 0.54789
G1 F1200
G2 X129.258 Y128.052 I-.026 J.054 E.01004
; CHANGE_LAYER
; Z_HEIGHT: 4.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.193 Y128.055 E-.19363
G1 X129.162 Y128 E-.18879
G1 X129.193 Y127.945 E-.18879
G1 X129.257 Y127.945 E-.18879
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 21/350
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
G3 Z4.4 I-.714 J.986 P1  F30000
G1 X129.945 Y128.443 Z4.4
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.204 Y127.153 I-.721 J-.444 E.11619
G1 X129.284 Y127.155 E.00263
G3 X129.974 Y128.391 I-.06 J.845 E.05564
G1 X130.284 Y128.643 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.278 Y128.649 E.00026
G3 X129.194 Y126.761 I-1.055 J-.65 E.15747
G1 X129.312 Y126.763 E.00362
G3 X130.389 Y128.42 I-.088 J1.236 E.07026
G1 X130.31 Y128.589 E.00573
M204 S10000
G1 X129.665 Y127.942 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.569 Y127.71 E.00772
G1 X129.339 Y127.574 E.00819
G1 X129.082 Y127.573 E.00791
G1 X128.873 Y127.734 E.00809
G1 X128.775 Y127.978 E.00808
G1 X128.838 Y128.22 E.0077
G1 X129.02 Y128.401 E.00787
G1 X129.28 Y128.438 E.00808
G1 X129.523 Y128.337 E.0081
G1 X129.652 Y128.11 E.00804
G1 X129.661 Y128.002 E.00333
G1 X129.257 Y127.945 F30000
; LINE_WIDTH: 0.54782
G1 F1200
G2 X129.258 Y128.052 I-.026 J.054 E.01003
; CHANGE_LAYER
; Z_HEIGHT: 4.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.193 Y128.055 E-.19362
G1 X129.162 Y128 E-.18879
G1 X129.193 Y127.945 E-.18879
G1 X129.257 Y127.945 E-.18879
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 22/350
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
G3 Z4.6 I-.714 J.986 P1  F30000
G1 X129.944 Y128.444 Z4.6
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.204 Y127.153 I-.721 J-.444 E.11619
G1 X129.283 Y127.155 E.00262
G3 X129.974 Y128.391 I-.06 J.845 E.05565
G1 X130.284 Y128.643 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.278 Y128.649 E.00027
G3 X129.194 Y126.761 I-1.055 J-.65 E.15747
G1 X129.312 Y126.763 E.00361
G3 X130.389 Y128.419 I-.088 J1.236 E.07026
G1 X130.31 Y128.588 E.00573
M204 S10000
G1 X129.665 Y127.942 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.569 Y127.709 E.00773
G1 X129.339 Y127.574 E.0082
G1 X129.082 Y127.573 E.00791
G1 X128.873 Y127.734 E.00809
G1 X128.775 Y127.978 E.00808
G1 X128.838 Y128.22 E.0077
G1 X129.02 Y128.401 E.00787
G1 X129.28 Y128.438 E.00808
G1 X129.523 Y128.337 E.0081
G1 X129.652 Y128.11 E.00803
G1 X129.66 Y128.002 E.00333
G1 X129.257 Y127.946 F30000
; LINE_WIDTH: 0.547824
G1 F1200
G2 X129.258 Y128.052 I-.026 J.054 E.01003
; CHANGE_LAYER
; Z_HEIGHT: 4.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.193 Y128.055 E-.19362
G1 X129.162 Y128 E-.18879
G1 X129.193 Y127.946 E-.18879
G1 X129.257 Y127.946 E-.18879
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 23/350
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
G3 Z4.8 I-.714 J.986 P1  F30000
G1 X129.944 Y128.444 Z4.8
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.204 Y127.153 I-.721 J-.444 E.11619
G1 X129.283 Y127.155 E.00262
G3 X129.974 Y128.391 I-.059 J.845 E.05566
G1 X130.284 Y128.643 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.278 Y128.649 E.00027
G3 X129.194 Y126.761 I-1.055 J-.65 E.15747
G1 X129.312 Y126.763 E.00361
G3 X130.389 Y128.419 I-.088 J1.236 E.07026
G1 X130.31 Y128.588 E.00574
M204 S10000
G1 X129.665 Y127.942 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
M73 P56 R4
G1 F1200
G1 X129.569 Y127.709 E.00773
G1 X129.438 Y127.606 E.00513
G1 X129.16 Y127.556 E.00869
G1 X128.932 Y127.67 E.00783
G1 X128.792 Y127.881 E.00778
G1 X128.801 Y128.145 E.0081
G1 X128.954 Y128.348 E.00782
G1 X129.191 Y128.449 E.00793
G1 X129.449 Y128.381 E.00818
G1 X129.629 Y128.199 E.00787
G1 X129.657 Y128.001 E.00612
G1 X129.26 Y127.955 F30000
; LINE_WIDTH: 0.53091
G1 F1200
G2 X129.26 Y128.06 I-.025 J.053 E.0093
; CHANGE_LAYER
; Z_HEIGHT: 4.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.199 Y128.061 E-.19118
G1 X129.168 Y128.008 E-.18961
G1 X129.199 Y127.955 E-.18961
G1 X129.26 Y127.955 E-.18961
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 24/350
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
G3 Z5 I-.707 J.99 P1  F30000
G1 X129.944 Y128.444 Z5
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.204 Y127.153 I-.721 J-.444 E.11619
G1 X129.283 Y127.155 E.00261
G3 X129.974 Y128.392 I-.059 J.845 E.05567
G1 X130.284 Y128.643 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.278 Y128.65 E.00027
G3 X129.194 Y126.761 I-1.055 J-.65 E.15746
G1 X129.311 Y126.763 E.0036
G3 X130.389 Y128.419 I-.088 J1.236 E.07026
G1 X130.309 Y128.589 E.00576
M204 S10000
G1 X129.665 Y127.942 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.569 Y127.709 E.00773
G1 X129.339 Y127.574 E.00821
G1 X129.082 Y127.573 E.00789
G1 X128.873 Y127.734 E.00809
G1 X128.775 Y127.978 E.00808
G1 X128.838 Y128.22 E.0077
G1 X129.02 Y128.401 E.00786
G1 X129.28 Y128.438 E.00808
G1 X129.524 Y128.337 E.0081
G1 X129.652 Y128.11 E.00802
G1 X129.66 Y128.002 E.00334
G1 X129.257 Y127.946 F30000
; LINE_WIDTH: 0.54783
G1 F1200
G2 X129.258 Y128.052 I-.026 J.054 E.01003
; CHANGE_LAYER
; Z_HEIGHT: 5
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.194 Y128.055 E-.19362
G1 X129.162 Y128 E-.18879
G1 X129.194 Y127.946 E-.18879
G1 X129.257 Y127.946 E-.18879
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 25/350
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
G3 Z5.2 I-.714 J.985 P1  F30000
G1 X129.944 Y128.444 Z5.2
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.204 Y127.153 I-.721 J-.444 E.11619
G1 X129.283 Y127.155 E.0026
G3 X129.974 Y128.392 I-.059 J.845 E.05568
G1 X130.283 Y128.644 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.278 Y128.65 E.00025
G3 X129.194 Y126.761 I-1.054 J-.65 E.15746
G1 X129.311 Y126.763 E.00359
G3 X130.389 Y128.419 I-.088 J1.236 E.07026
G1 X130.309 Y128.589 E.00579
M204 S10000
G1 X129.665 Y127.943 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.569 Y127.709 E.00776
G1 X129.338 Y127.574 E.00821
G1 X129.082 Y127.573 E.00788
G1 X128.873 Y127.734 E.00809
G1 X128.775 Y127.978 E.00808
G1 X128.838 Y128.22 E.00771
G1 X129.02 Y128.401 E.00786
G1 X129.28 Y128.438 E.00808
G1 X129.524 Y128.337 E.0081
G1 X129.652 Y128.111 E.008
G1 X129.66 Y128.003 E.00334
G1 X129.257 Y127.946 F30000
; LINE_WIDTH: 0.547832
G1 F1200
G2 X129.258 Y128.052 I-.026 J.054 E.01003
; CHANGE_LAYER
; Z_HEIGHT: 5.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.194 Y128.055 E-.19362
G1 X129.162 Y128 E-.18879
G1 X129.194 Y127.946 E-.18879
G1 X129.257 Y127.946 E-.18879
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 26/350
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
G3 Z5.4 I-.714 J.985 P1  F30000
G1 X129.944 Y128.444 Z5.4
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.204 Y127.153 I-.721 J-.444 E.11619
G1 X129.282 Y127.155 E.00259
G3 X129.974 Y128.392 I-.059 J.845 E.05569
G1 X130.283 Y128.645 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.278 Y128.65 E.00023
G3 X129.194 Y126.761 I-1.054 J-.651 E.15745
G1 X129.311 Y126.763 E.00358
G3 X130.389 Y128.419 I-.087 J1.236 E.07026
G1 X130.309 Y128.59 E.00582
M204 S10000
G1 X129.665 Y127.943 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.569 Y127.709 E.00776
G1 X129.338 Y127.574 E.00821
G1 X129.082 Y127.573 E.00788
G1 X128.873 Y127.734 E.00809
G1 X128.775 Y127.978 E.00808
G1 X128.839 Y128.22 E.00771
G1 X129.02 Y128.401 E.00785
G1 X129.28 Y128.438 E.00808
G1 X129.524 Y128.337 E.0081
G1 X129.652 Y128.111 E.00799
G1 X129.66 Y128.003 E.00334
G1 X129.257 Y127.946 F30000
; LINE_WIDTH: 0.547838
G1 F1200
G2 X129.258 Y128.052 I-.026 J.054 E.01003
; CHANGE_LAYER
; Z_HEIGHT: 5.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.194 Y128.055 E-.19362
G1 X129.162 Y128 E-.18879
G1 X129.194 Y127.946 E-.18879
G1 X129.257 Y127.946 E-.18879
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 27/350
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
G3 Z5.6 I-.715 J.985 P1  F30000
G1 X129.944 Y128.444 Z5.6
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.204 Y127.153 I-.72 J-.445 E.11618
G1 X129.282 Y127.155 E.00258
G3 X129.974 Y128.392 I-.059 J.845 E.0557
G1 X130.283 Y128.646 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.277 Y128.65 E.0002
G3 X129.194 Y126.761 I-1.054 J-.651 E.15745
G1 X129.31 Y126.763 E.00357
G3 X130.389 Y128.419 I-.087 J1.236 E.07026
G1 X130.308 Y128.591 E.00586
M204 S10000
G1 X129.675 Y128.023 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.611 Y127.786 E.00756
G1 X129.431 Y127.6 E.00795
G1 X129.168 Y127.562 E.00817
G1 X128.927 Y127.662 E.00801
G1 X128.797 Y127.891 E.00808
G1 X128.802 Y128.157 E.00817
G1 X128.934 Y128.332 E.00675
G1 X129.106 Y128.425 E.00598
G1 X129.368 Y128.427 E.00807
G1 X129.576 Y128.268 E.00804
G1 X129.653 Y128.079 E.00628
G1 X129.257 Y127.946 F30000
; LINE_WIDTH: 0.547832
G1 F1200
G2 X129.258 Y128.052 I-.026 J.054 E.01003
; CHANGE_LAYER
; Z_HEIGHT: 5.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.194 Y128.055 E-.19362
G1 X129.162 Y128 E-.18879
G1 X129.194 Y127.946 E-.18879
G1 X129.257 Y127.946 E-.18879
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 28/350
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
G3 Z5.8 I-.715 J.985 P1  F30000
G1 X129.944 Y128.444 Z5.8
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.204 Y127.153 I-.72 J-.445 E.11618
G1 X129.282 Y127.155 E.00257
G3 X129.973 Y128.392 I-.059 J.845 E.05571
G1 X130.282 Y128.647 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.277 Y128.65 E.00017
G3 X129.194 Y126.761 I-1.054 J-.651 E.15745
G1 X129.31 Y126.763 E.00356
G3 X130.389 Y128.418 I-.087 J1.236 E.07026
G1 X130.307 Y128.593 E.00591
M204 S10000
G1 X129.665 Y127.943 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.569 Y127.709 E.00777
G1 X129.338 Y127.574 E.00823
G1 X129.082 Y127.573 E.00786
G1 X128.873 Y127.734 E.0081
G1 X128.775 Y127.978 E.00808
G1 X128.839 Y128.221 E.00772
G1 X129.02 Y128.401 E.00785
G1 X129.28 Y128.438 E.00808
G1 X129.524 Y128.337 E.0081
G1 X129.654 Y128.102 E.00828
G1 X129.661 Y128.003 E.00304
G1 X129.257 Y127.946 F30000
; LINE_WIDTH: 0.547826
G1 F1200
G2 X129.258 Y128.052 I-.026 J.054 E.01003
; CHANGE_LAYER
; Z_HEIGHT: 5.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.194 Y128.055 E-.19362
G1 X129.162 Y128 E-.18879
G1 X129.194 Y127.946 E-.18879
G1 X129.257 Y127.946 E-.18879
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 29/350
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
G3 Z6 I-.715 J.985 P1  F30000
G1 X129.944 Y128.444 Z6
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.204 Y127.153 I-.72 J-.445 E.11618
G1 X129.282 Y127.155 E.00257
G3 X129.973 Y128.392 I-.058 J.845 E.05572
G1 X130.281 Y128.648 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.277 Y128.65 E.00014
G3 X129.194 Y126.761 I-1.054 J-.651 E.15744
G1 X129.31 Y126.763 E.00355
G3 X130.389 Y128.418 I-.087 J1.236 E.07026
G1 X130.307 Y128.594 E.00596
M204 S10000
G1 X129.665 Y127.943 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.569 Y127.709 E.00778
G1 X129.438 Y127.606 E.00512
G1 X129.16 Y127.556 E.00869
G1 X128.932 Y127.67 E.00784
G1 X128.792 Y127.881 E.00778
G1 X128.801 Y128.145 E.0081
G1 X128.954 Y128.348 E.00782
G1 X129.191 Y128.449 E.00793
G1 X129.449 Y128.38 E.00819
G1 X129.629 Y128.2 E.00783
G1 X129.656 Y128.003 E.00611
G1 X129.26 Y127.955 F30000
; LINE_WIDTH: 0.530902
M73 P57 R4
G1 F1200
G2 X129.26 Y128.06 I-.025 J.053 E.0093
; CHANGE_LAYER
; Z_HEIGHT: 6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.199 Y128.061 E-.19118
G1 X129.168 Y128.008 E-.18961
G1 X129.199 Y127.955 E-.18961
G1 X129.26 Y127.955 E-.18961
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 30/350
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
G3 Z6.2 I-.708 J.99 P1  F30000
G1 X129.943 Y128.444 Z6.2
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.204 Y127.153 I-.72 J-.445 E.11618
G1 X129.281 Y127.155 E.00256
G3 X129.973 Y128.392 I-.058 J.845 E.05573
G1 X130.281 Y128.65 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.277 Y128.651 E.00011
G3 X129.194 Y126.761 I-1.054 J-.651 E.15744
G1 X129.31 Y126.763 E.00355
G3 X130.389 Y128.418 I-.087 J1.236 E.07026
G1 X130.306 Y128.595 E.00602
M204 S10000
G1 X129.665 Y127.943 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.569 Y127.709 E.00778
G1 X129.438 Y127.606 E.00511
G1 X129.16 Y127.556 E.00869
G1 X128.932 Y127.67 E.00784
G1 X128.792 Y127.881 E.00778
G1 X128.801 Y128.145 E.0081
G1 X128.954 Y128.348 E.00782
G1 X129.191 Y128.449 E.00793
G1 X129.449 Y128.38 E.00819
G1 X129.629 Y128.2 E.00783
G1 X129.656 Y128.003 E.00611
G1 X129.26 Y127.955 F30000
; LINE_WIDTH: 0.530912
G1 F1200
G2 X129.26 Y128.06 I-.025 J.053 E.0093
; CHANGE_LAYER
; Z_HEIGHT: 6.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.199 Y128.061 E-.19118
G1 X129.168 Y128.008 E-.18961
G1 X129.199 Y127.955 E-.18961
G1 X129.26 Y127.955 E-.1896
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 31/350
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
G3 Z6.4 I-.708 J.99 P1  F30000
G1 X129.943 Y128.444 Z6.4
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.204 Y127.153 I-.72 J-.445 E.11618
G1 X129.281 Y127.155 E.00255
G3 X129.973 Y128.392 I-.058 J.845 E.05574
G1 X130.28 Y128.651 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.277 Y128.651 E.00009
G3 X129.194 Y126.761 I-1.054 J-.651 E.15744
G1 X129.309 Y126.763 E.00354
G3 X130.389 Y128.418 I-.086 J1.236 E.07026
G1 X130.305 Y128.597 E.00607
M204 S10000
G1 X129.665 Y127.943 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.569 Y127.709 E.00778
G1 X129.438 Y127.606 E.00511
G1 X129.16 Y127.556 E.00869
G1 X128.932 Y127.67 E.00784
G1 X128.792 Y127.881 E.00778
G1 X128.801 Y128.145 E.0081
G1 X128.954 Y128.348 E.00782
G1 X129.191 Y128.449 E.00793
G1 X129.449 Y128.38 E.00819
G1 X129.628 Y128.2 E.00782
G1 X129.656 Y128.003 E.00611
G1 X129.26 Y127.955 F30000
; LINE_WIDTH: 0.530916
G1 F1200
G2 X129.26 Y128.06 I-.025 J.053 E.0093
; CHANGE_LAYER
; Z_HEIGHT: 6.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.199 Y128.061 E-.19118
G1 X129.168 Y128.008 E-.18961
G1 X129.199 Y127.955 E-.18961
G1 X129.26 Y127.955 E-.1896
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 32/350
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
G3 Z6.6 I-.709 J.989 P1  F30000
G1 X129.943 Y128.445 Z6.6
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.204 Y127.153 I-.72 J-.445 E.11618
G1 X129.281 Y127.155 E.00254
G3 X129.973 Y128.392 I-.058 J.845 E.05575
G1 X130.277 Y128.651 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.194 Y126.761 I-1.054 J-.652 E.15743
G1 X129.309 Y126.763 E.00353
G3 X130.307 Y128.599 I-.086 J1.236 E.07639
M204 S10000
G1 X129.665 Y127.943 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.569 Y127.709 E.00778
G1 X129.438 Y127.606 E.00511
G1 X129.16 Y127.556 E.00869
G1 X128.929 Y127.673 E.00796
G1 X128.789 Y127.889 E.0079
G1 X128.809 Y128.146 E.00793
G1 X128.957 Y128.36 E.00797
G1 X129.205 Y128.448 E.0081
G1 X129.451 Y128.379 E.00786
G1 X129.628 Y128.2 E.00774
G1 X129.656 Y128.003 E.00612
; CHANGE_LAYER
; Z_HEIGHT: 6.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.628 Y128.2 E-.0757
G1 X129.451 Y128.379 E-.09576
G1 X129.205 Y128.448 E-.09714
G1 X128.957 Y128.36 E-.1002
G1 X128.809 Y128.146 E-.0986
G1 X128.789 Y127.889 E-.09811
G1 X128.929 Y127.673 E-.09774
G1 X129.156 Y127.558 E-.09673
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 33/350
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
G3 Z6.8 I-.91 J.808 P1  F30000
G1 X129.943 Y128.445 Z6.8
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.204 Y127.153 I-.72 J-.445 E.11617
G1 X129.281 Y127.155 E.00253
G3 X129.973 Y128.393 I-.058 J.845 E.05576
G1 X130.278 Y128.654 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.129 Y128.844 E.00744
G3 X129.194 Y126.761 I-.906 J-.845 E.14994
G1 X129.309 Y126.763 E.00352
G3 X130.305 Y128.602 I-.086 J1.236 E.0765
M204 S10000
G1 X129.665 Y127.944 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.569 Y127.709 E.00779
G1 X129.341 Y127.575 E.00813
G1 X129.082 Y127.573 E.00794
G1 X128.873 Y127.734 E.0081
G1 X128.775 Y127.978 E.00807
G1 X128.839 Y128.221 E.00773
G1 X129.02 Y128.401 E.00783
G1 X129.28 Y128.438 E.00808
G1 X129.524 Y128.337 E.00811
G1 X129.654 Y128.105 E.00817
G1 X129.661 Y128.003 E.00313
; CHANGE_LAYER
; Z_HEIGHT: 6.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.654 Y128.105 E-.03867
G1 X129.524 Y128.337 E-.10108
G1 X129.28 Y128.438 E-.10029
G1 X129.02 Y128.401 E-.0999
G1 X128.839 Y128.221 E-.09685
G1 X128.775 Y127.978 E-.09558
G1 X128.873 Y127.734 E-.09985
G1 X129.082 Y127.573 E-.10016
G1 X129.155 Y127.573 E-.02763
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 34/350
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
G3 Z7 I-.902 J.816 P1  F30000
G1 X129.943 Y128.445 Z7
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.204 Y127.153 I-.72 J-.445 E.11617
G1 X129.28 Y127.155 E.00252
G3 X129.973 Y128.393 I-.058 J.845 E.05577
G1 X130.277 Y128.655 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.129 Y128.844 E.0074
G3 X129.194 Y126.761 I-.906 J-.845 E.14993
G1 X129.309 Y126.763 E.00351
G3 X130.305 Y128.603 I-.086 J1.236 E.07654
M204 S10000
G1 X129.664 Y127.944 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.569 Y127.709 E.0078
G1 X129.34 Y127.575 E.00813
G1 X129.082 Y127.573 E.00794
G1 X128.873 Y127.734 E.0081
G1 X128.775 Y127.978 E.00807
G1 X128.839 Y128.221 E.00773
G1 X129.02 Y128.401 E.00783
G1 X129.28 Y128.438 E.00808
G1 X129.524 Y128.337 E.00811
G1 X129.654 Y128.106 E.00815
G1 X129.66 Y128.004 E.00314
; CHANGE_LAYER
; Z_HEIGHT: 7
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.654 Y128.106 E-.03887
G1 X129.524 Y128.337 E-.10082
G1 X129.28 Y128.438 E-.10031
G1 X129.02 Y128.401 E-.09989
G1 X128.839 Y128.221 E-.09681
G1 X128.775 Y127.978 E-.09562
G1 X128.873 Y127.734 E-.09985
G1 X129.082 Y127.573 E-.10016
G1 X129.155 Y127.573 E-.02767
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 35/350
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
G3 Z7.2 I-.896 J.824 P1  F30000
G1 X129.944 Y128.431 Z7.2
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.842 Y128.577 E.00591
G3 X129.204 Y127.153 I-.619 J-.578 E.11064
G1 X129.28 Y127.155 E.00252
G3 X129.989 Y128.36 I-.057 J.845 E.05457
G1 X129.976 Y128.38 E.00079
G1 X130.276 Y128.656 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.128 Y128.845 E.00735
G3 X129.194 Y126.761 I-.906 J-.845 E.14993
G1 X129.308 Y126.763 E.0035
G3 X130.304 Y128.604 I-.086 J1.236 E.07658
M204 S10000
G1 X129.661 Y127.931 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.553 Y127.69 E.00809
G2 X129.16 Y127.556 I-.411 J.56 E.01296
G1 X128.932 Y127.67 E.00784
G1 X128.792 Y127.881 E.00778
G1 X128.801 Y128.145 E.0081
G1 X128.954 Y128.348 E.00782
G1 X129.191 Y128.449 E.00793
G1 X129.446 Y128.382 E.0081
G1 X129.633 Y128.191 E.00821
G1 X129.655 Y127.99 E.00619
G1 X129.26 Y127.955 F30000
; LINE_WIDTH: 0.53091
G1 F1200
G2 X129.26 Y128.06 I-.025 J.053 E.0093
; CHANGE_LAYER
; Z_HEIGHT: 7.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.199 Y128.061 E-.19118
G1 X129.168 Y128.008 E-.18961
G1 X129.199 Y127.955 E-.18961
G1 X129.26 Y127.955 E-.18961
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 36/350
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
G3 Z7.4 I-.697 J.998 P1  F30000
G1 X129.943 Y128.432 Z7.4
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.842 Y128.577 E.00587
G3 X129.204 Y127.153 I-.619 J-.578 E.11064
G1 X129.28 Y127.155 E.00251
G3 X129.989 Y128.36 I-.057 J.845 E.05457
G1 X129.975 Y128.381 E.00084
G1 X130.275 Y128.657 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.128 Y128.845 E.00731
G3 X129.194 Y126.761 I-.906 J-.845 E.14993
G1 X129.308 Y126.763 E.00349
G3 X130.303 Y128.605 I-.085 J1.236 E.07662
M204 S10000
G1 X129.661 Y127.931 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.553 Y127.691 E.00809
G2 X129.16 Y127.556 I-.411 J.56 E.01296
G1 X128.932 Y127.67 E.00784
G1 X128.792 Y127.881 E.00778
M73 P58 R4
G1 X128.801 Y128.145 E.0081
G1 X128.954 Y128.348 E.00782
G1 X129.191 Y128.449 E.00793
G1 X129.446 Y128.382 E.00809
G1 X129.633 Y128.19 E.00822
G1 X129.655 Y127.99 E.00619
G1 X129.26 Y127.955 F30000
; LINE_WIDTH: 0.530918
G1 F1200
G2 X129.26 Y128.06 I-.025 J.053 E.0093
; CHANGE_LAYER
; Z_HEIGHT: 7.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.199 Y128.061 E-.19118
G1 X129.168 Y128.008 E-.18961
G1 X129.199 Y127.955 E-.18961
G1 X129.26 Y127.955 E-.1896
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 37/350
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
G3 Z7.6 I-.698 J.997 P1  F30000
G1 X129.942 Y128.433 Z7.6
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.842 Y128.577 E.00583
G3 X129.204 Y127.153 I-.619 J-.578 E.11064
G1 X129.28 Y127.155 E.0025
G3 X129.989 Y128.36 I-.057 J.845 E.05457
G1 X129.974 Y128.383 E.00089
G1 X130.275 Y128.658 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.128 Y128.845 E.00728
G3 X129.194 Y126.761 I-.906 J-.845 E.14993
G1 X129.308 Y126.763 E.00349
G3 X130.303 Y128.606 I-.085 J1.236 E.07666
M204 S10000
G1 X129.662 Y127.936 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.553 Y127.691 E.00823
G1 X129.335 Y127.574 E.0076
G1 X129.082 Y127.573 E.00779
G1 X128.873 Y127.734 E.0081
G1 X128.775 Y127.978 E.00807
G1 X128.839 Y128.221 E.00774
G1 X129.02 Y128.401 E.00782
G1 X129.28 Y128.438 E.0081
G1 X129.523 Y128.338 E.00806
G1 X129.654 Y128.106 E.00818
G1 X129.659 Y127.996 E.00339
G1 X129.256 Y127.946 F30000
; LINE_WIDTH: 0.547588
G1 F1200
G2 X129.258 Y128.052 I-.026 J.054 E.01002
; CHANGE_LAYER
; Z_HEIGHT: 7.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.193 Y128.055 E-.19359
G1 X129.161 Y128 E-.1888
G1 X129.193 Y127.946 E-.18881
G1 X129.256 Y127.946 E-.1888
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 38/350
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
G3 Z7.8 I-.706 J.991 P1  F30000
G1 X129.942 Y128.434 Z7.8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.842 Y128.577 E.00579
G3 X129.204 Y127.153 I-.619 J-.578 E.11064
G1 X129.28 Y127.155 E.00249
G3 X129.989 Y128.36 I-.057 J.845 E.05456
G1 X129.974 Y128.383 E.00094
G1 X130.274 Y128.659 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.128 Y128.845 E.00725
G3 X129.194 Y126.761 I-.906 J-.846 E.14993
G1 X129.307 Y126.763 E.00348
G3 X130.302 Y128.607 I-.085 J1.236 E.0767
M204 S10000
G1 X129.662 Y127.936 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.553 Y127.691 E.00823
G1 X129.335 Y127.573 E.00761
G1 X129.082 Y127.573 E.00778
G1 X128.873 Y127.734 E.0081
G1 X128.775 Y127.978 E.00807
G1 X128.839 Y128.221 E.00774
G1 X129.02 Y128.401 E.00782
G1 X129.28 Y128.438 E.0081
G1 X129.523 Y128.338 E.00806
G1 X129.654 Y128.106 E.00818
G1 X129.659 Y127.996 E.00339
G1 X129.256 Y127.946 F30000
; LINE_WIDTH: 0.547566
G1 F1200
G2 X129.258 Y128.052 I-.026 J.054 E.01002
; CHANGE_LAYER
; Z_HEIGHT: 7.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.193 Y128.055 E-.19358
G1 X129.161 Y128 E-.18881
G1 X129.193 Y127.946 E-.18881
G1 X129.256 Y127.946 E-.18881
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 39/350
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
G3 Z8 I-.707 J.99 P1  F30000
G1 X129.941 Y128.435 Z8
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.841 Y128.577 E.00577
G3 X129.205 Y127.153 I-.619 J-.578 E.11065
G1 X129.279 Y127.155 E.00248
G3 X129.989 Y128.359 I-.057 J.845 E.05456
G1 X129.973 Y128.384 E.00097
G1 X130.273 Y128.66 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.128 Y128.845 E.00723
G3 X129.194 Y126.761 I-.905 J-.846 E.14993
G1 X129.307 Y126.763 E.00347
G3 X130.302 Y128.608 I-.085 J1.236 E.07673
M204 S10000
G1 X129.661 Y127.931 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.554 Y127.691 E.00807
G2 X129.16 Y127.556 I-.411 J.56 E.01298
G1 X128.932 Y127.67 E.00784
G1 X128.792 Y127.881 E.00778
G1 X128.801 Y128.145 E.0081
G1 X128.954 Y128.348 E.00782
G1 X129.191 Y128.449 E.00793
G1 X129.446 Y128.382 E.00809
G1 X129.633 Y128.19 E.00823
G1 X129.655 Y127.99 E.00618
G1 X129.26 Y127.955 F30000
; LINE_WIDTH: 0.530914
G1 F1200
G2 X129.26 Y128.06 I-.025 J.053 E.0093
; CHANGE_LAYER
; Z_HEIGHT: 8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.199 Y128.061 E-.19118
G1 X129.168 Y128.008 E-.18961
G1 X129.199 Y127.955 E-.18961
G1 X129.26 Y127.955 E-.1896
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 40/350
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
G3 Z8.2 I-.701 J.994 P1  F30000
G1 X129.941 Y128.435 Z8.2
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.841 Y128.577 E.00575
G3 X129.205 Y127.153 I-.619 J-.578 E.11065
G1 X129.279 Y127.155 E.00247
G3 X129.989 Y128.359 I-.057 J.845 E.05456
G1 X129.973 Y128.385 E.001
G1 X130.273 Y128.661 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.128 Y128.845 E.00721
G3 X129.194 Y126.761 I-.905 J-.846 E.14993
G1 X129.307 Y126.763 E.00346
G3 X130.301 Y128.608 I-.084 J1.236 E.07676
M204 S10000
G1 X129.662 Y127.936 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.554 Y127.691 E.00822
G1 X129.335 Y127.573 E.00764
G1 X129.082 Y127.573 E.00776
G1 X128.873 Y127.734 E.0081
G1 X128.775 Y127.978 E.00807
G1 X128.839 Y128.221 E.00775
G1 X129.02 Y128.401 E.00781
G1 X129.28 Y128.438 E.0081
G1 X129.523 Y128.337 E.00806
G1 X129.654 Y128.106 E.00819
G1 X129.659 Y127.996 E.00338
G1 X129.256 Y127.946 F30000
; LINE_WIDTH: 0.547514
G1 F1200
G2 X129.258 Y128.052 I-.026 J.054 E.01002
; CHANGE_LAYER
; Z_HEIGHT: 8.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.193 Y128.055 E-.19358
G1 X129.161 Y128 E-.18881
G1 X129.193 Y127.946 E-.18881
G1 X129.256 Y127.946 E-.18881
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 41/350
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
G3 Z8.4 I-.708 J.989 P1  F30000
G1 X129.94 Y128.436 Z8.4
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.841 Y128.577 E.00574
G3 X129.205 Y127.153 I-.619 J-.578 E.11065
G1 X129.279 Y127.155 E.00246
G3 X129.989 Y128.359 I-.056 J.845 E.05456
G1 X129.973 Y128.385 E.00102
G1 X130.273 Y128.661 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.128 Y128.845 E.0072
G3 X129.194 Y126.761 I-.905 J-.846 E.14993
G1 X129.307 Y126.763 E.00345
G3 X130.301 Y128.608 I-.084 J1.236 E.07677
M204 S10000
G1 X129.661 Y127.931 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.554 Y127.691 E.00806
G2 X129.16 Y127.556 I-.412 J.559 E.01299
G1 X128.932 Y127.67 E.00784
G1 X128.792 Y127.881 E.00778
G1 X128.801 Y128.145 E.0081
G1 X128.954 Y128.348 E.00782
G1 X129.191 Y128.449 E.00793
G1 X129.446 Y128.382 E.00809
G1 X129.633 Y128.19 E.00824
G1 X129.655 Y127.99 E.00617
G1 X129.26 Y127.955 F30000
; LINE_WIDTH: 0.530922
G1 F1200
G2 X129.26 Y128.06 I-.025 J.053 E.0093
; CHANGE_LAYER
; Z_HEIGHT: 8.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.199 Y128.061 E-.19118
G1 X129.168 Y128.008 E-.18961
G1 X129.199 Y127.955 E-.18961
G1 X129.26 Y127.955 E-.18961
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 42/350
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
G3 Z8.6 I-.702 J.994 P1  F30000
G1 X129.94 Y128.436 Z8.6
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.841 Y128.577 E.00574
G3 X129.205 Y127.153 I-.619 J-.578 E.11065
G1 X129.279 Y127.155 E.00246
G3 X129.989 Y128.359 I-.056 J.845 E.05456
G1 X129.972 Y128.385 E.00103
G1 X130.273 Y128.661 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.128 Y128.845 E.00721
G3 X129.194 Y126.761 I-.905 J-.846 E.14993
G1 X129.306 Y126.763 E.00344
G3 X130.301 Y128.608 I-.084 J1.236 E.07678
M204 S10000
G1 X129.661 Y127.931 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.554 Y127.691 E.00806
G2 X129.16 Y127.556 I-.412 J.559 E.013
G1 X128.932 Y127.67 E.00784
G1 X128.792 Y127.881 E.00778
G1 X128.801 Y128.145 E.0081
G1 X128.954 Y128.348 E.00782
G1 X129.191 Y128.449 E.00793
G1 X129.446 Y128.382 E.00809
G1 X129.633 Y128.19 E.00825
G1 X129.655 Y127.99 E.00616
G1 X129.26 Y127.955 F30000
; LINE_WIDTH: 0.530908
G1 F1200
G2 X129.26 Y128.06 I-.025 J.053 E.0093
; CHANGE_LAYER
; Z_HEIGHT: 8.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.199 Y128.061 E-.19118
G1 X129.168 Y128.008 E-.18961
G1 X129.199 Y127.955 E-.18961
G1 X129.26 Y127.955 E-.18961
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 43/350
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
G3 Z8.8 I-.702 J.994 P1  F30000
G1 X129.941 Y128.435 Z8.8
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.841 Y128.577 E.00575
G3 X129.205 Y127.153 I-.619 J-.578 E.11065
G1 X129.278 Y127.155 E.00245
G3 X129.989 Y128.359 I-.056 J.845 E.05456
M73 P59 R4
G1 X129.973 Y128.385 E.00103
G1 X130.273 Y128.661 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.127 Y128.845 E.00722
G3 X129.194 Y126.761 I-.905 J-.846 E.14993
G1 X129.306 Y126.763 E.00343
G3 X130.301 Y128.608 I-.084 J1.236 E.07678
M204 S10000
G1 X129.662 Y127.936 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.554 Y127.692 E.0082
G1 X129.334 Y127.573 E.00768
G1 X129.082 Y127.573 E.00774
G1 X128.873 Y127.734 E.00811
G1 X128.775 Y127.978 E.00807
G1 X128.849 Y128.231 E.0081
G1 X129.017 Y128.4 E.00733
G1 X129.281 Y128.438 E.00819
G1 X129.523 Y128.337 E.00806
G1 X129.654 Y128.105 E.0082
G1 X129.659 Y127.996 E.00337
G1 X129.256 Y127.946 F30000
; LINE_WIDTH: 0.547404
G1 F1200
G2 X129.258 Y128.052 I-.026 J.054 E.01001
; CHANGE_LAYER
; Z_HEIGHT: 8.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.193 Y128.055 E-.19356
G1 X129.161 Y128 E-.18881
G1 X129.193 Y127.946 E-.18881
G1 X129.256 Y127.946 E-.18881
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 44/350
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
G3 Z9 I-.707 J.99 P1  F30000
G1 X129.941 Y128.435 Z9
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.841 Y128.577 E.00577
G3 X129.205 Y127.153 I-.619 J-.578 E.11065
G1 X129.278 Y127.155 E.00244
G3 X129.989 Y128.358 I-.056 J.845 E.05456
G1 X129.973 Y128.384 E.00101
G1 X130.273 Y128.66 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.127 Y128.845 E.00724
G3 X129.194 Y126.761 I-.905 J-.846 E.14992
G1 X129.306 Y126.763 E.00343
G3 X130.301 Y128.608 I-.084 J1.236 E.07677
M204 S10000
G1 X129.662 Y127.936 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.554 Y127.692 E.0082
G1 X129.334 Y127.573 E.00769
G1 X129.082 Y127.573 E.00773
G1 X128.873 Y127.734 E.00811
G1 X128.775 Y127.978 E.00807
G1 X128.848 Y128.23 E.00808
G1 X129.042 Y128.412 E.00816
G1 X129.281 Y128.438 E.00737
G1 X129.523 Y128.337 E.00806
G1 X129.654 Y128.105 E.0082
G1 X129.659 Y127.996 E.00337
G1 X129.256 Y127.946 F30000
; LINE_WIDTH: 0.547378
G1 F1200
G2 X129.258 Y128.052 I-.026 J.054 E.01001
; CHANGE_LAYER
; Z_HEIGHT: 9
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.193 Y128.055 E-.19356
G1 X129.161 Y128 E-.18881
G1 X129.193 Y127.946 E-.18882
G1 X129.256 Y127.946 E-.18881
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 45/350
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
G3 Z9.2 I-.706 J.991 P1  F30000
G1 X129.941 Y128.434 Z9.2
G1 Z9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.841 Y128.578 E.00581
G3 X129.205 Y127.153 I-.619 J-.578 E.11065
G1 X129.278 Y127.155 E.00243
G3 X129.989 Y128.358 I-.056 J.845 E.05455
G1 X129.973 Y128.383 E.00099
G1 X130.274 Y128.66 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.127 Y128.845 E.00727
G3 X129.194 Y126.761 I-.905 J-.846 E.14992
G1 X129.306 Y126.763 E.00342
G3 X130.302 Y128.607 I-.083 J1.236 E.07676
M204 S10000
G1 X129.662 Y127.936 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.554 Y127.692 E.00819
G1 X129.333 Y127.573 E.0077
G1 X129.082 Y127.573 E.00772
G1 X128.873 Y127.734 E.00811
G1 X128.775 Y127.978 E.00807
G1 X128.84 Y128.222 E.00776
G1 X129.019 Y128.401 E.00779
G1 X129.281 Y128.438 E.0081
G1 X129.523 Y128.337 E.00806
G1 X129.654 Y128.105 E.0082
G1 X129.659 Y127.996 E.00337
G1 X129.256 Y127.946 F30000
; LINE_WIDTH: 0.547392
G1 F1200
G2 X129.258 Y128.052 I-.026 J.054 E.01001
; CHANGE_LAYER
; Z_HEIGHT: 9.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.193 Y128.055 E-.19356
G1 X129.161 Y128 E-.18881
G1 X129.193 Y127.946 E-.18882
G1 X129.256 Y127.946 E-.18881
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 46/350
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
G3 Z9.4 I-.705 J.992 P1  F30000
G1 X129.942 Y128.433 Z9.4
G1 Z9.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.841 Y128.578 E.00584
G3 X129.205 Y127.153 I-.619 J-.578 E.11065
G1 X129.278 Y127.155 E.00242
G3 X129.989 Y128.358 I-.055 J.845 E.05455
G1 X129.974 Y128.383 E.00096
G1 X130.275 Y128.659 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.127 Y128.845 E.00731
G3 X129.194 Y126.761 I-.905 J-.846 E.14992
G1 X129.305 Y126.763 E.00341
G3 X130.302 Y128.606 I-.083 J1.236 E.07674
M204 S10000
G1 X129.662 Y127.936 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.554 Y127.692 E.00819
G1 X129.333 Y127.573 E.00772
G1 X129.082 Y127.573 E.00771
G1 X128.873 Y127.734 E.00811
G1 X128.775 Y127.978 E.00807
G1 X128.84 Y128.222 E.00776
G1 X129.019 Y128.401 E.00779
G1 X129.281 Y128.438 E.00811
G1 X129.523 Y128.337 E.00806
G1 X129.654 Y128.105 E.00821
G1 X129.659 Y127.996 E.00337
G1 X129.256 Y127.946 F30000
; LINE_WIDTH: 0.547366
G1 F1200
G2 X129.258 Y128.052 I-.026 J.054 E.01001
; CHANGE_LAYER
; Z_HEIGHT: 9.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.193 Y128.055 E-.19355
G1 X129.161 Y128 E-.18882
G1 X129.193 Y127.946 E-.18882
G1 X129.256 Y127.946 E-.18881
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 47/350
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
G3 Z9.6 I-.704 J.993 P1  F30000
G1 X129.943 Y128.432 Z9.6
G1 Z9.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.841 Y128.578 E.00589
G3 X129.205 Y127.153 I-.618 J-.578 E.11065
G1 X129.277 Y127.155 E.00241
G3 X129.989 Y128.358 I-.055 J.845 E.05455
G1 X129.974 Y128.381 E.00093
G1 X130.275 Y128.658 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.127 Y128.845 E.00735
G3 X129.194 Y126.761 I-.905 J-.846 E.14992
G1 X129.305 Y126.763 E.0034
G3 X130.302 Y128.606 I-.083 J1.236 E.07673
M204 S10000
G1 X129.662 Y127.936 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.555 Y127.692 E.00818
G1 X129.333 Y127.573 E.00773
G1 X129.082 Y127.573 E.00771
G1 X128.873 Y127.734 E.00811
G1 X128.775 Y127.978 E.00807
G1 X128.84 Y128.222 E.00777
G1 X129.019 Y128.401 E.00778
G1 X129.281 Y128.438 E.00811
G1 X129.523 Y128.337 E.00806
G1 X129.654 Y128.105 E.00821
G1 X129.659 Y127.996 E.00336
G1 X129.256 Y127.946 F30000
; LINE_WIDTH: 0.547344
G1 F1200
G2 X129.258 Y128.052 I-.026 J.054 E.01001
; CHANGE_LAYER
; Z_HEIGHT: 9.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.193 Y128.055 E-.19355
G1 X129.161 Y128 E-.18882
G1 X129.193 Y127.946 E-.18882
G1 X129.256 Y127.946 E-.18881
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 48/350
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
G3 Z9.8 I-.702 J.994 P1  F30000
G1 X129.943 Y128.431 Z9.8
G1 Z9.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.841 Y128.578 E.00593
G3 X129.205 Y127.153 I-.618 J-.578 E.11065
G1 X129.277 Y127.155 E.00241
G3 X129.989 Y128.358 I-.055 J.845 E.05455
G1 X129.975 Y128.38 E.00089
G1 X130.274 Y128.654 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.194 Y126.761 I-1.052 J-.655 E.15734
G1 X129.305 Y126.763 E.00339
G3 X130.304 Y128.602 I-.083 J1.236 E.07661
M204 S10000
G1 X129.662 Y127.936 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.555 Y127.692 E.00817
G1 X129.333 Y127.573 E.00774
G1 X129.082 Y127.573 E.0077
G1 X128.873 Y127.734 E.00811
G1 X128.775 Y127.978 E.00807
G1 X128.84 Y128.222 E.00777
G1 X129.019 Y128.401 E.00778
G1 X129.281 Y128.438 E.00811
G1 X129.523 Y128.337 E.00806
G1 X129.654 Y128.105 E.00821
G1 X129.659 Y127.996 E.00336
G1 X129.256 Y127.946 F30000
; LINE_WIDTH: 0.547314
G1 F1200
G2 X129.257 Y128.052 I-.026 J.054 E.01001
; CHANGE_LAYER
; Z_HEIGHT: 9.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.193 Y128.055 E-.19355
G1 X129.161 Y128 E-.18882
G1 X129.193 Y127.946 E-.18882
G1 X129.256 Y127.946 E-.18882
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 49/350
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
G3 Z10 I-.7 J.995 P1  F30000
G1 X129.944 Y128.43 Z10
G1 Z9.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.84 Y128.578 E.00598
G3 X129.205 Y127.153 I-.618 J-.578 E.11065
G1 X129.277 Y127.155 E.0024
G3 X129.989 Y128.357 I-.055 J.845 E.05455
G1 X129.976 Y128.379 E.00085
G1 X130.273 Y128.654 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.194 Y126.761 I-1.052 J-.655 E.15733
G1 X129.304 Y126.763 E.00338
G3 X130.304 Y128.603 I-.083 J1.236 E.07663
M204 S10000
G1 X129.662 Y127.936 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.555 Y127.692 E.00817
G1 X129.332 Y127.573 E.00776
G1 X129.082 Y127.573 E.00769
G1 X128.873 Y127.734 E.00811
G1 X128.775 Y127.978 E.00807
G1 X128.84 Y128.222 E.00777
G1 X129.019 Y128.401 E.00778
G1 X129.281 Y128.438 E.00811
G1 X129.523 Y128.337 E.00806
G1 X129.654 Y128.105 E.00821
G1 X129.659 Y127.996 E.00336
M73 P60 R4
G1 X129.256 Y127.946 F30000
; LINE_WIDTH: 0.547292
G1 F1200
G2 X129.257 Y128.052 I-.026 J.054 E.01001
; CHANGE_LAYER
; Z_HEIGHT: 10
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.193 Y128.055 E-.19354
G1 X129.161 Y128 E-.18882
G1 X129.193 Y127.946 E-.18882
G1 X129.256 Y127.946 E-.18882
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 50/350
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
G3 Z10.2 I-.699 J.996 P1  F30000
G1 X129.945 Y128.429 Z10.2
G1 Z10
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.84 Y128.578 E.00604
G3 X129.205 Y127.153 I-.618 J-.578 E.11065
G1 X129.277 Y127.155 E.00239
G3 X129.989 Y128.357 I-.055 J.845 E.05455
G1 X129.976 Y128.378 E.00081
G1 X130.278 Y128.654 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.273 Y128.655 E.00014
G3 X129.194 Y126.761 I-1.051 J-.655 E.15733
G1 X129.304 Y126.763 E.00337
G3 X130.343 Y128.526 I-.082 J1.236 E.07399
G1 X130.305 Y128.601 E.00257
M204 S10000
G1 X129.662 Y127.936 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.555 Y127.693 E.00816
G1 X129.332 Y127.573 E.00777
G1 X129.082 Y127.573 E.00768
G1 X128.873 Y127.734 E.00811
G1 X128.775 Y127.978 E.00807
G1 X128.84 Y128.222 E.00778
G1 X129.019 Y128.401 E.00777
G1 X129.281 Y128.438 E.00811
G1 X129.523 Y128.337 E.00806
G1 X129.654 Y128.105 E.00822
G1 X129.659 Y127.996 E.00336
G1 X129.256 Y127.946 F30000
; LINE_WIDTH: 0.547266
G1 F1200
G2 X129.257 Y128.052 I-.026 J.054 E.01001
; CHANGE_LAYER
; Z_HEIGHT: 10.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.193 Y128.055 E-.19354
G1 X129.161 Y128 E-.18882
G1 X129.193 Y127.946 E-.18882
G1 X129.256 Y127.946 E-.18882
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 51/350
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
G3 Z10.4 I-.697 J.998 P1  F30000
G1 X129.946 Y128.428 Z10.4
G1 Z10.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.84 Y128.578 E.00609
G3 X129.205 Y127.153 I-.618 J-.578 E.11065
G1 X129.276 Y127.155 E.00238
G3 X129.989 Y128.357 I-.055 J.845 E.05454
G1 X129.977 Y128.377 E.00077
G1 X130.279 Y128.653 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.273 Y128.655 E.00018
G3 X129.194 Y126.761 I-1.051 J-.655 E.15733
G1 X129.304 Y126.763 E.00337
G3 X130.343 Y128.526 I-.082 J1.236 E.07399
G1 X130.306 Y128.599 E.00253
M204 S10000
G1 X129.662 Y127.936 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.555 Y127.693 E.00816
G1 X129.332 Y127.573 E.00778
G1 X129.082 Y127.573 E.00767
G1 X128.873 Y127.734 E.00811
G1 X128.775 Y127.978 E.00807
G1 X128.84 Y128.222 E.00778
G1 X129.019 Y128.401 E.00777
G1 X129.281 Y128.438 E.00811
G1 X129.523 Y128.337 E.00806
G1 X129.655 Y128.105 E.00822
G1 X129.659 Y127.996 E.00335
G1 X129.256 Y127.946 F30000
; LINE_WIDTH: 0.547238
G1 F1200
G2 X129.257 Y128.052 I-.026 J.054 E.01001
; CHANGE_LAYER
; Z_HEIGHT: 10.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.193 Y128.055 E-.19354
G1 X129.161 Y128 E-.18882
G1 X129.193 Y127.946 E-.18882
G1 X129.256 Y127.946 E-.18882
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 52/350
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
G3 Z10.6 I-.695 J.999 P1  F30000
G1 X129.946 Y128.426 Z10.6
G1 Z10.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.84 Y128.578 E.00613
G3 X129.205 Y127.153 I-.618 J-.578 E.11065
G1 X129.276 Y127.155 E.00237
G3 X129.989 Y128.357 I-.054 J.845 E.05454
G1 X129.978 Y128.375 E.00073
G1 X130.279 Y128.652 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.273 Y128.655 E.00022
G3 X129.194 Y126.761 I-1.051 J-.656 E.15732
G1 X129.304 Y126.763 E.00336
G3 X130.343 Y128.526 I-.082 J1.236 E.07399
G1 X130.306 Y128.598 E.0025
M204 S10000
G1 X129.662 Y127.936 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.555 Y127.693 E.00815
G1 X129.332 Y127.573 E.00779
G1 X129.082 Y127.573 E.00767
G1 X128.873 Y127.734 E.00811
G1 X128.775 Y127.978 E.00807
G1 X128.84 Y128.222 E.00778
G1 X129.019 Y128.401 E.00777
G1 X129.281 Y128.438 E.00811
G1 X129.523 Y128.337 E.00806
G1 X129.655 Y128.105 E.00822
G1 X129.659 Y127.996 E.00335
G1 X129.256 Y127.946 F30000
; LINE_WIDTH: 0.547216
G1 F1200
G2 X129.257 Y128.052 I-.026 J.054 E.01001
; CHANGE_LAYER
; Z_HEIGHT: 10.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.193 Y128.055 E-.19353
G1 X129.161 Y128 E-.18882
G1 X129.193 Y127.946 E-.18882
G1 X129.256 Y127.946 E-.18882
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 53/350
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
G3 Z10.8 I-.694 J1 P1  F30000
G1 X129.947 Y128.425 Z10.8
G1 Z10.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.84 Y128.578 E.00618
G3 X129.205 Y127.153 I-.618 J-.578 E.11065
G1 X129.276 Y127.155 E.00236
G3 X129.989 Y128.357 I-.054 J.845 E.05454
G1 X129.978 Y128.374 E.00069
G1 X130.28 Y128.65 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.273 Y128.655 E.00026
G3 X129.194 Y126.761 I-1.051 J-.656 E.15732
G1 X129.303 Y126.763 E.00335
G3 X130.343 Y128.525 I-.082 J1.236 E.07399
G1 X130.307 Y128.597 E.00246
M204 S10000
G1 X129.662 Y127.936 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.555 Y127.693 E.00815
G1 X129.331 Y127.573 E.00781
G1 X129.082 Y127.573 E.00766
G1 X128.873 Y127.734 E.00811
G1 X128.775 Y127.978 E.00807
G1 X128.84 Y128.222 E.00778
G1 X129.019 Y128.401 E.00776
G1 X129.281 Y128.438 E.00811
G1 X129.523 Y128.337 E.00806
G1 X129.655 Y128.104 E.00822
G1 X129.659 Y127.996 E.00335
G1 X129.256 Y127.946 F30000
; LINE_WIDTH: 0.547194
G1 F1200
G2 X129.257 Y128.052 I-.026 J.054 E.01
; CHANGE_LAYER
; Z_HEIGHT: 10.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.193 Y128.055 E-.19353
G1 X129.161 Y128 E-.18882
G1 X129.193 Y127.946 E-.18882
G1 X129.256 Y127.946 E-.18882
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 54/350
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
G3 Z11 I-.692 J1.001 P1  F30000
G1 X129.948 Y128.424 Z11
G1 Z10.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.84 Y128.578 E.00622
G3 X129.205 Y127.153 I-.618 J-.578 E.11065
G1 X129.276 Y127.155 E.00235
G3 X129.989 Y128.356 I-.054 J.845 E.05454
G1 X129.979 Y128.373 E.00066
G1 X130.28 Y128.649 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.273 Y128.655 E.0003
G3 X129.194 Y126.761 I-1.051 J-.656 E.15731
G1 X129.303 Y126.763 E.00334
G3 X130.343 Y128.525 I-.081 J1.236 E.07398
G1 X130.307 Y128.596 E.00244
M204 S10000
G1 X129.661 Y127.931 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.555 Y127.693 E.008
G2 X129.16 Y127.556 I-.415 J.558 E.01306
G1 X128.932 Y127.67 E.00784
G1 X128.792 Y127.881 E.00778
G1 X128.801 Y128.145 E.0081
G1 X128.954 Y128.348 E.00782
G1 X129.191 Y128.449 E.00793
G1 X129.446 Y128.382 E.00808
G1 X129.634 Y128.188 E.00831
G1 X129.655 Y127.991 E.0061
G1 X129.26 Y127.955 F30000
; LINE_WIDTH: 0.530918
G1 F1200
G2 X129.26 Y128.06 I-.025 J.053 E.0093
; CHANGE_LAYER
; Z_HEIGHT: 11
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.199 Y128.061 E-.19118
G1 X129.168 Y128.008 E-.18961
G1 X129.199 Y127.955 E-.18961
G1 X129.26 Y127.955 E-.1896
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 55/350
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
G3 Z11.2 I-.685 J1.006 P1  F30000
G1 X129.948 Y128.424 Z11.2
G1 Z11
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.84 Y128.578 E.00625
G3 X129.205 Y127.153 I-.618 J-.578 E.11065
G1 X129.276 Y127.155 E.00235
G3 X129.989 Y128.356 I-.054 J.845 E.05454
G1 X129.979 Y128.373 E.00064
G1 X130.281 Y128.649 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.272 Y128.655 E.00033
G3 X129.194 Y126.761 I-1.051 J-.656 E.15731
G1 X129.303 Y126.763 E.00333
G3 X130.343 Y128.525 I-.081 J1.236 E.07398
G1 X130.308 Y128.595 E.00242
M204 S10000
G1 X129.661 Y127.931 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.556 Y127.693 E.00799
G2 X129.16 Y127.556 I-.415 J.558 E.01306
G1 X128.932 Y127.67 E.00784
G1 X128.792 Y127.881 E.00778
G1 X128.801 Y128.145 E.0081
G1 X128.954 Y128.348 E.00782
G1 X129.191 Y128.449 E.00793
G1 X129.445 Y128.382 E.00807
G1 X129.634 Y128.188 E.00832
G1 X129.655 Y127.991 E.0061
G1 X129.26 Y127.955 F30000
; LINE_WIDTH: 0.530906
G1 F1200
G2 X129.26 Y128.06 I-.025 J.053 E.0093
; CHANGE_LAYER
; Z_HEIGHT: 11.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.199 Y128.061 E-.19118
G1 X129.168 Y128.008 E-.18961
G1 X129.199 Y127.955 E-.18961
G1 X129.26 Y127.955 E-.18961
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 56/350
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
G3 Z11.4 I-.684 J1.006 P1  F30000
G1 X129.948 Y128.423 Z11.4
G1 Z11.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.84 Y128.578 E.00627
G3 X129.205 Y127.153 I-.618 J-.579 E.11065
G1 X129.275 Y127.155 E.00234
G3 X129.99 Y128.356 I-.054 J.845 E.05454
G1 X129.98 Y128.372 E.00062
G1 X130.281 Y128.648 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.272 Y128.656 E.00035
G3 X129.194 Y126.761 I-1.051 J-.656 E.1573
G1 X129.303 Y126.763 E.00332
G3 X130.343 Y128.525 I-.081 J1.236 E.07398
G1 X130.308 Y128.595 E.0024
M204 S10000
G1 X129.662 Y127.936 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.556 Y127.693 E.00813
G1 X129.331 Y127.573 E.00785
M73 P61 R4
G1 X129.082 Y127.573 E.00763
G1 X128.873 Y127.734 E.00811
G1 X128.775 Y127.978 E.00808
G1 X128.84 Y128.222 E.00775
G1 X129.02 Y128.401 E.00779
G1 X129.281 Y128.438 E.00811
G1 X129.523 Y128.337 E.00806
G1 X129.655 Y128.104 E.00823
G1 X129.66 Y127.996 E.00334
G1 X129.256 Y127.946 F30000
; LINE_WIDTH: 0.547098
G1 F1200
G2 X129.257 Y128.052 I-.026 J.054 E.01
; CHANGE_LAYER
; Z_HEIGHT: 11.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.193 Y128.055 E-.19352
G1 X129.161 Y128 E-.18883
G1 X129.193 Y127.946 E-.18883
G1 X129.256 Y127.946 E-.18883
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 57/350
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
G3 Z11.6 I-.69 J1.002 P1  F30000
G1 X129.949 Y128.423 Z11.6
G1 Z11.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.84 Y128.578 E.00629
G3 X129.205 Y127.153 I-.618 J-.579 E.11065
G1 X129.275 Y127.155 E.00233
G3 X129.99 Y128.356 I-.053 J.845 E.05454
G1 X129.98 Y128.372 E.00062
G1 X130.281 Y128.648 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.272 Y128.656 E.00037
G3 X129.194 Y126.761 I-1.051 J-.657 E.1573
G1 X129.302 Y126.763 E.00331
G3 X130.343 Y128.525 I-.081 J1.236 E.07398
G1 X130.308 Y128.594 E.0024
M204 S10000
G1 X129.662 Y127.931 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.556 Y127.694 E.00798
G2 X129.16 Y127.556 I-.415 J.557 E.01307
G1 X128.932 Y127.67 E.00784
G1 X128.792 Y127.881 E.00778
G1 X128.801 Y128.145 E.0081
G1 X128.954 Y128.348 E.00782
G1 X129.191 Y128.449 E.00793
G1 X129.445 Y128.382 E.00807
G1 X129.634 Y128.188 E.00833
G1 X129.655 Y127.991 E.00609
G1 X129.26 Y127.955 F30000
; LINE_WIDTH: 0.530886
G1 F1200
G2 X129.26 Y128.06 I-.025 J.053 E.0093
; CHANGE_LAYER
; Z_HEIGHT: 11.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.199 Y128.061 E-.19118
G1 X129.168 Y128.008 E-.18961
G1 X129.199 Y127.955 E-.18961
G1 X129.26 Y127.955 E-.18961
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 58/350
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
G3 Z11.8 I-.684 J1.007 P1  F30000
G1 X129.949 Y128.423 Z11.8
G1 Z11.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.84 Y128.578 E.00629
G3 X129.205 Y127.153 I-.618 J-.579 E.11065
G1 X129.275 Y127.155 E.00232
G3 X129.99 Y128.356 I-.053 J.845 E.05454
G1 X129.98 Y128.372 E.00063
G1 X130.281 Y128.648 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.272 Y128.656 E.00038
G3 X129.194 Y126.761 I-1.051 J-.657 E.15729
G1 X129.302 Y126.763 E.0033
G3 X130.344 Y128.524 I-.081 J1.236 E.07398
G1 X130.308 Y128.594 E.00241
M204 S10000
G1 X129.662 Y127.936 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.556 Y127.694 E.00812
G1 X129.33 Y127.573 E.00787
G1 X129.082 Y127.573 E.00762
G1 X128.873 Y127.734 E.00811
G1 X128.775 Y127.978 E.00808
G1 X128.84 Y128.221 E.00775
G1 X129.02 Y128.401 E.0078
G1 X129.281 Y128.438 E.00811
G1 X129.523 Y128.337 E.00806
G1 X129.655 Y128.104 E.00824
G1 X129.66 Y127.996 E.00333
G1 X129.256 Y127.946 F30000
; LINE_WIDTH: 0.547048
G1 F1200
G2 X129.257 Y128.052 I-.026 J.054 E.01
; CHANGE_LAYER
; Z_HEIGHT: 11.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.193 Y128.055 E-.19351
G1 X129.161 Y128 E-.18883
G1 X129.193 Y127.946 E-.18883
G1 X129.256 Y127.946 E-.18883
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 59/350
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
G3 Z12 I-.691 J1.002 P1  F30000
G1 X129.948 Y128.423 Z12
G1 Z11.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.839 Y128.578 E.00628
G3 X129.205 Y127.153 I-.618 J-.579 E.11065
G1 X129.275 Y127.155 E.00231
G3 X129.99 Y128.355 I-.053 J.845 E.05454
G1 X129.979 Y128.372 E.00065
G1 X130.281 Y128.648 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.272 Y128.656 E.00037
G3 X129.194 Y126.761 I-1.05 J-.657 E.15729
G1 X129.302 Y126.763 E.0033
G3 X130.344 Y128.524 I-.08 J1.236 E.07398
G1 X130.308 Y128.595 E.00243
M204 S10000
G1 X129.662 Y127.936 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.556 Y127.694 E.00811
G1 X129.33 Y127.573 E.00789
G1 X129.082 Y127.573 E.00761
G1 X128.873 Y127.734 E.00812
G1 X128.775 Y127.978 E.00807
G1 X128.841 Y128.223 E.0078
G1 X129.019 Y128.401 E.00774
G1 X129.281 Y128.438 E.00811
G1 X129.523 Y128.337 E.00806
G1 X129.655 Y128.104 E.00824
G1 X129.66 Y127.996 E.00333
G1 X129.256 Y127.946 F30000
; LINE_WIDTH: 0.54705
G1 F1200
G2 X129.257 Y128.052 I-.026 J.054 E.01
; CHANGE_LAYER
; Z_HEIGHT: 12
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.193 Y128.055 E-.19351
G1 X129.161 Y128 E-.18883
G1 X129.193 Y127.946 E-.18883
G1 X129.256 Y127.946 E-.18883
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 60/350
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
G3 Z12.2 I-.688 J1.004 P1  F30000
G1 X129.951 Y128.422 Z12.2
G1 Z12
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.838 Y128.576 E.00636
G3 X129.205 Y127.153 I-.616 J-.578 E.11042
G1 X129.274 Y127.155 E.0023
G3 X129.983 Y128.364 I-.053 J.843 E.05483
G1 X129.98 Y128.369 E.00021
G1 X130.281 Y128.649 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.27 Y128.652 E.00035
G3 X129.194 Y126.761 I-1.049 J-.655 E.15702
G1 X129.301 Y126.763 E.00329
G3 X130.339 Y128.526 I-.08 J1.234 E.07402
G1 X130.307 Y128.595 E.00234
M204 S10000
G1 X129.662 Y127.936 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.556 Y127.694 E.00811
G1 X129.33 Y127.573 E.0079
G1 X129.082 Y127.573 E.0076
G1 X128.873 Y127.734 E.00812
G1 X128.775 Y127.978 E.00807
G1 X128.841 Y128.223 E.0078
G1 X129.019 Y128.401 E.00774
G1 X129.28 Y128.438 E.00809
G1 X129.524 Y128.337 E.00811
G1 X129.654 Y128.106 E.00815
G1 X129.659 Y127.996 E.00339
; CHANGE_LAYER
; Z_HEIGHT: 12.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.654 Y128.106 E-.04195
G1 X129.524 Y128.337 E-.10076
G1 X129.28 Y128.438 E-.10031
G1 X129.019 Y128.401 E-.10003
G1 X128.841 Y128.223 E-.0957
G1 X128.775 Y127.978 E-.0965
G1 X128.873 Y127.734 E-.09979
G1 X129.082 Y127.573 E-.10037
G1 X129.147 Y127.573 E-.0246
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 61/350
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
G3 Z12.4 I-.885 J.836 P1  F30000
G1 X129.95 Y128.423 Z12.4
G1 Z12.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.837 Y128.576 E.00632
G3 X129.205 Y127.153 I-.616 J-.579 E.11042
G1 X129.274 Y127.154 E.00229
G3 X129.983 Y128.364 I-.053 J.843 E.05483
G1 X129.979 Y128.371 E.00026
G1 X130.28 Y128.65 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.27 Y128.653 E.00032
G3 X129.194 Y126.761 I-1.049 J-.656 E.15701
G1 X129.301 Y126.763 E.00328
G3 X130.339 Y128.526 I-.08 J1.234 E.07402
G1 X130.306 Y128.596 E.00239
M204 S10000
G1 X129.662 Y127.936 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.556 Y127.694 E.0081
G1 X129.329 Y127.572 E.00791
G1 X129.082 Y127.573 E.00759
G1 X128.873 Y127.734 E.00812
G1 X128.775 Y127.978 E.00807
G1 X128.841 Y128.223 E.00781
G1 X129.019 Y128.401 E.00774
G1 X129.28 Y128.438 E.00809
G1 X129.524 Y128.337 E.00811
G1 X129.654 Y128.106 E.00815
G1 X129.659 Y127.996 E.00339
; CHANGE_LAYER
; Z_HEIGHT: 12.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.654 Y128.106 E-.04194
G1 X129.524 Y128.337 E-.10076
G1 X129.28 Y128.438 E-.10031
G1 X129.019 Y128.401 E-.10004
G1 X128.841 Y128.223 E-.09566
G1 X128.775 Y127.978 E-.09653
G1 X128.873 Y127.734 E-.09979
G1 X129.082 Y127.573 E-.10038
G1 X129.147 Y127.573 E-.0246
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 62/350
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
G3 Z12.6 I-.886 J.834 P1  F30000
G1 X129.949 Y128.425 Z12.6
G1 Z12.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.837 Y128.577 E.00626
G3 X129.205 Y127.153 I-.616 J-.579 E.11042
G1 X129.274 Y127.154 E.00229
G3 X129.983 Y128.364 I-.053 J.843 E.05483
G1 X129.978 Y128.372 E.00033
G1 X130.279 Y128.652 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.27 Y128.653 E.00029
G3 X129.194 Y126.761 I-1.049 J-.656 E.15701
G1 X129.301 Y126.763 E.00327
G3 X130.339 Y128.525 I-.08 J1.234 E.07402
G1 X130.305 Y128.597 E.00245
M204 S10000
G1 X129.662 Y127.936 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.556 Y127.694 E.0081
G1 X129.329 Y127.572 E.00792
G1 X129.082 Y127.573 E.00758
G1 X128.873 Y127.734 E.00812
G1 X128.775 Y127.978 E.00807
G1 X128.841 Y128.223 E.00781
G1 X129.019 Y128.401 E.00773
G1 X129.28 Y128.438 E.00809
G1 X129.524 Y128.337 E.00811
G1 X129.654 Y128.106 E.00815
G1 X129.659 Y127.996 E.00339
; CHANGE_LAYER
; Z_HEIGHT: 12.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.654 Y128.106 E-.04191
G1 X129.524 Y128.337 E-.10078
G1 X129.28 Y128.438 E-.10032
G1 X129.019 Y128.401 E-.10004
G1 X128.841 Y128.223 E-.09561
G1 X128.775 Y127.978 E-.09657
G1 X128.873 Y127.734 E-.09979
G1 X129.082 Y127.573 E-.10038
G1 X129.147 Y127.573 E-.02461
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 63/350
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
M73 P62 R4
G3 Z12.8 I-.888 J.832 P1  F30000
G1 X129.948 Y128.427 Z12.8
G1 Z12.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.837 Y128.577 E.00618
G3 X129.205 Y127.153 I-.616 J-.579 E.11042
G1 X129.274 Y127.154 E.00228
G3 X129.983 Y128.363 I-.052 J.843 E.05484
G1 X129.977 Y128.374 E.00041
G1 X130.278 Y128.654 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.27 Y128.653 E.00026
G3 X129.194 Y126.761 I-1.048 J-.656 E.157
G1 X129.301 Y126.763 E.00326
G3 X130.339 Y128.525 I-.079 J1.234 E.07402
G1 X130.304 Y128.6 E.00253
M204 S10000
G1 X129.662 Y127.936 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.557 Y127.694 E.00809
G1 X129.329 Y127.572 E.00794
G1 X129.082 Y127.573 E.00758
G1 X128.873 Y127.734 E.00812
G1 X128.775 Y127.978 E.00807
G1 X128.841 Y128.223 E.00781
G1 X129.019 Y128.401 E.00773
G1 X129.28 Y128.438 E.00809
G1 X129.524 Y128.337 E.00811
G1 X129.654 Y128.106 E.00815
G1 X129.659 Y127.996 E.00339
; CHANGE_LAYER
; Z_HEIGHT: 12.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.654 Y128.106 E-.04189
G1 X129.524 Y128.337 E-.1008
G1 X129.28 Y128.438 E-.10031
G1 X129.019 Y128.401 E-.10003
G1 X128.841 Y128.223 E-.09558
G1 X128.775 Y127.978 E-.0966
G1 X128.873 Y127.734 E-.09979
G1 X129.082 Y127.573 E-.10039
G1 X129.147 Y127.573 E-.0246
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 64/350
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
G3 Z13 I-.89 J.83 P1  F30000
G1 X129.946 Y128.429 Z13
G1 Z12.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.837 Y128.577 E.00608
G3 X129.205 Y127.153 I-.616 J-.579 E.11042
G1 X129.273 Y127.154 E.00227
G3 X129.983 Y128.363 I-.052 J.843 E.05484
G1 X129.976 Y128.377 E.00052
G1 X130.269 Y128.653 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.194 Y126.761 I-1.048 J-.656 E.157
G1 X129.3 Y126.763 E.00325
G3 X130.3 Y128.601 I-.079 J1.234 E.07666
M204 S10000
G1 X129.662 Y127.936 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.557 Y127.695 E.00809
G1 X129.329 Y127.572 E.00795
G1 X129.082 Y127.573 E.00757
G1 X128.873 Y127.734 E.00812
G1 X128.775 Y127.978 E.00807
G1 X128.841 Y128.223 E.00781
G1 X129.019 Y128.401 E.00772
G1 X129.28 Y128.438 E.00809
G1 X129.524 Y128.337 E.00811
G1 X129.654 Y128.106 E.00815
G1 X129.659 Y127.996 E.00339
; CHANGE_LAYER
; Z_HEIGHT: 13
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.654 Y128.106 E-.04186
G1 X129.524 Y128.337 E-.10081
G1 X129.28 Y128.438 E-.10032
G1 X129.019 Y128.401 E-.10005
G1 X128.841 Y128.223 E-.09553
G1 X128.775 Y127.978 E-.09664
G1 X128.873 Y127.734 E-.09979
G1 X129.082 Y127.573 E-.1004
G1 X129.147 Y127.573 E-.02461
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 65/350
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
G3 Z13.2 I-.892 J.827 P1  F30000
G1 X129.944 Y128.432 Z13.2
G1 Z13
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.837 Y128.577 E.00597
G3 X129.205 Y127.153 I-.616 J-.579 E.11042
G1 X129.273 Y127.154 E.00226
G3 X129.983 Y128.363 I-.052 J.844 E.05484
G1 X129.974 Y128.38 E.00064
G1 X130.275 Y128.659 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.122 Y128.844 E.00736
G3 X129.194 Y126.761 I-.901 J-.847 E.14958
G1 X129.3 Y126.763 E.00324
G3 X130.296 Y128.609 I-.079 J1.234 E.07692
M204 S10000
G1 X129.662 Y127.931 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.557 Y127.695 E.00794
G2 X129.16 Y127.556 I-.417 J.556 E.01311
G1 X128.932 Y127.67 E.00785
G1 X128.792 Y127.881 E.00778
G1 X128.801 Y128.145 E.0081
G1 X128.954 Y128.348 E.00782
G1 X129.191 Y128.449 E.00793
G1 X129.448 Y128.381 E.00816
G1 X129.631 Y128.194 E.00804
G1 X129.655 Y127.991 E.0063
G1 X129.26 Y127.955 F30000
; LINE_WIDTH: 0.530936
G1 F1200
G2 X129.26 Y128.06 I-.025 J.053 E.00931
; CHANGE_LAYER
; Z_HEIGHT: 13.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.199 Y128.061 E-.19118
G1 X129.168 Y128.008 E-.18961
G1 X129.199 Y127.955 E-.18961
G1 X129.26 Y127.955 E-.18961
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 66/350
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
G3 Z13.4 I-.701 J.995 P1  F30000
G1 X129.942 Y128.435 Z13.4
G1 Z13.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.837 Y128.577 E.00584
G3 X129.205 Y127.153 I-.616 J-.579 E.11042
G1 X129.273 Y127.154 E.00225
G3 X129.983 Y128.363 I-.052 J.844 E.05484
G1 X129.972 Y128.383 E.00078
G1 X130.272 Y128.663 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.122 Y128.844 E.00724
G3 X129.194 Y126.761 I-.901 J-.847 E.14958
G1 X129.3 Y126.763 E.00324
G3 X130.295 Y128.61 I-.079 J1.234 E.07698
M204 S10000
G1 X129.662 Y127.936 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.557 Y127.695 E.00808
G1 X129.328 Y127.572 E.00798
G1 X129.082 Y127.573 E.00755
G1 X128.873 Y127.734 E.00812
G1 X128.775 Y127.978 E.00807
G1 X128.841 Y128.223 E.00782
G1 X129.019 Y128.401 E.00772
G1 X129.28 Y128.438 E.00809
G1 X129.524 Y128.337 E.00811
G1 X129.654 Y128.106 E.00815
G1 X129.659 Y127.996 E.00338
; CHANGE_LAYER
; Z_HEIGHT: 13.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.654 Y128.106 E-.04183
G1 X129.524 Y128.337 E-.10083
G1 X129.28 Y128.438 E-.10033
G1 X129.019 Y128.401 E-.10005
G1 X128.841 Y128.223 E-.09544
G1 X128.775 Y127.978 E-.09671
G1 X128.873 Y127.734 E-.09978
G1 X129.082 Y127.573 E-.10041
G1 X129.147 Y127.573 E-.02461
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 67/350
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
G3 Z13.6 I-.898 J.821 P1  F30000
G1 X129.939 Y128.439 Z13.6
G1 Z13.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.837 Y128.577 E.00569
G3 X129.205 Y127.153 I-.616 J-.579 E.11042
G1 X129.273 Y127.154 E.00224
G3 X129.983 Y128.363 I-.052 J.844 E.05484
G1 X129.969 Y128.387 E.00093
G1 X130.269 Y128.666 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.122 Y128.844 E.00711
G3 X129.194 Y126.761 I-.901 J-.847 E.14958
G1 X129.3 Y126.763 E.00323
G3 X130.293 Y128.613 I-.079 J1.234 E.07708
M204 S10000
G1 X129.662 Y127.936 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.557 Y127.695 E.00807
G1 X129.328 Y127.572 E.00799
G1 X129.082 Y127.573 E.00754
G1 X128.873 Y127.734 E.00812
G1 X128.775 Y127.978 E.00807
G1 X128.841 Y128.223 E.00782
G1 X129.019 Y128.401 E.00771
G1 X129.28 Y128.438 E.00809
G1 X129.524 Y128.337 E.00811
G1 X129.654 Y128.106 E.00815
G1 X129.659 Y127.996 E.00338
; CHANGE_LAYER
; Z_HEIGHT: 13.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.654 Y128.106 E-.04182
G1 X129.524 Y128.337 E-.10083
G1 X129.28 Y128.438 E-.10033
G1 X129.019 Y128.401 E-.10006
G1 X128.841 Y128.223 E-.09541
G1 X128.775 Y127.978 E-.09674
G1 X128.873 Y127.734 E-.09978
G1 X129.082 Y127.573 E-.10042
G1 X129.147 Y127.573 E-.02461
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 68/350
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
G3 Z13.8 I-.902 J.817 P1  F30000
G1 X129.936 Y128.443 Z13.8
G1 Z13.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.837 Y128.577 E.00554
G3 X129.205 Y127.153 I-.616 J-.579 E.11042
G1 X129.272 Y127.154 E.00224
G3 X129.983 Y128.363 I-.051 J.844 E.05484
G1 X129.967 Y128.391 E.00109
G1 X130.267 Y128.67 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.122 Y128.844 E.00697
G3 X129.195 Y126.761 I-.901 J-.847 E.14957
G1 X129.299 Y126.763 E.00322
G3 X130.291 Y128.616 I-.078 J1.234 E.07721
M204 S10000
G1 X129.662 Y127.936 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.557 Y127.695 E.00807
G1 X129.328 Y127.572 E.008
G1 X129.082 Y127.573 E.00753
G1 X128.873 Y127.734 E.00812
G1 X128.775 Y127.978 E.00807
G1 X128.841 Y128.224 E.00783
G1 X129.019 Y128.401 E.00771
G1 X129.28 Y128.438 E.00809
G1 X129.524 Y128.337 E.00811
G1 X129.654 Y128.106 E.00815
G1 X129.659 Y127.996 E.00338
; CHANGE_LAYER
; Z_HEIGHT: 13.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.654 Y128.106 E-.04181
G1 X129.524 Y128.337 E-.10084
G1 X129.28 Y128.438 E-.10033
G1 X129.019 Y128.401 E-.10006
G1 X128.841 Y128.224 E-.09536
G1 X128.775 Y127.978 E-.09678
G1 X128.873 Y127.734 E-.09978
G1 X129.082 Y127.573 E-.10043
G1 X129.147 Y127.573 E-.02462
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 69/350
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
G3 Z14 I-.905 J.814 P1  F30000
G1 X129.934 Y128.447 Z14
G1 Z13.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.837 Y128.577 E.00537
G3 X129.205 Y127.153 I-.616 J-.579 E.11042
G1 X129.272 Y127.154 E.00223
G3 X129.983 Y128.363 I-.051 J.844 E.05484
G1 X129.964 Y128.395 E.00126
G1 X130.264 Y128.674 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.122 Y128.844 E.00682
G3 X129.195 Y126.761 I-.901 J-.847 E.14957
G1 X129.299 Y126.763 E.00321
G3 X130.289 Y128.62 I-.078 J1.234 E.07736
M204 S10000
G1 X129.662 Y127.936 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.557 Y127.695 E.00806
G1 X129.327 Y127.572 E.00802
G1 X129.082 Y127.573 E.00753
G1 X128.873 Y127.734 E.00812
G1 X128.775 Y127.978 E.00807
G1 X128.841 Y128.224 E.00783
G1 X129.019 Y128.401 E.00771
G1 X129.28 Y128.438 E.00809
M73 P63 R4
G1 X129.524 Y128.337 E.00811
G1 X129.654 Y128.106 E.00816
G1 X129.659 Y127.996 E.00338
; CHANGE_LAYER
; Z_HEIGHT: 14
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.654 Y128.106 E-.04178
G1 X129.524 Y128.337 E-.10086
G1 X129.28 Y128.438 E-.10034
G1 X129.019 Y128.401 E-.10007
G1 X128.841 Y128.224 E-.09532
G1 X128.775 Y127.978 E-.09681
G1 X128.873 Y127.734 E-.09978
G1 X129.082 Y127.573 E-.10044
G1 X129.147 Y127.573 E-.02462
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 70/350
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
G3 Z14.2 I-.908 J.81 P1  F30000
G1 X129.931 Y128.451 Z14.2
G1 Z14
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.837 Y128.577 E.0052
G3 X129.205 Y127.153 I-.616 J-.579 E.11042
G1 X129.272 Y127.154 E.00222
G3 X129.983 Y128.362 I-.051 J.844 E.05484
G1 X129.961 Y128.4 E.00144
G1 X130.26 Y128.678 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.122 Y128.844 E.00666
G3 X129.195 Y126.761 I-.901 J-.847 E.14957
G1 X129.299 Y126.763 E.0032
G3 X130.287 Y128.624 I-.078 J1.234 E.07751
M204 S10000
G1 X129.662 Y127.936 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.558 Y127.696 E.00806
G1 X129.336 Y127.574 E.00776
G1 X129.082 Y127.573 E.00779
G1 X128.873 Y127.734 E.00812
G1 X128.775 Y127.978 E.00807
G1 X128.85 Y128.232 E.00815
G1 X129.021 Y128.402 E.00741
G1 X129.28 Y128.438 E.00804
G1 X129.524 Y128.337 E.00811
G1 X129.654 Y128.106 E.00816
G1 X129.659 Y127.996 E.00338
G1 X129.256 Y127.946 F30000
; LINE_WIDTH: 0.54706
G1 F1200
G2 X129.258 Y128.053 I-.026 J.054 E.01
; CHANGE_LAYER
; Z_HEIGHT: 14.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.193 Y128.055 E-.19351
G1 X129.162 Y128.001 E-.18883
G1 X129.193 Y127.946 E-.18883
G1 X129.256 Y127.946 E-.18883
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 71/350
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
G3 Z14.4 I-.736 J.969 P1  F30000
G1 X129.928 Y128.456 Z14.4
G1 Z14.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.837 Y128.577 E.00503
G3 X129.205 Y127.153 I-.616 J-.579 E.11042
G1 X129.272 Y127.154 E.00221
G3 X129.983 Y128.362 I-.051 J.844 E.05484
G1 X129.958 Y128.404 E.00163
G1 X130.257 Y128.682 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.121 Y128.844 E.0065
G3 X129.195 Y126.761 I-.901 J-.847 E.14957
G1 X129.298 Y126.763 E.00319
G3 X130.284 Y128.629 I-.078 J1.234 E.07768
M204 S10000
G1 X129.654 Y128.106 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.65 Y127.85 E.00785
G1 X129.496 Y127.649 E.00778
G1 X129.246 Y127.55 E.00826
G1 X129.004 Y127.618 E.00774
G1 X128.874 Y127.733 E.00533
G1 X128.775 Y127.978 E.0081
G1 X128.841 Y128.224 E.00783
G1 X129.019 Y128.401 E.0077
G1 X129.28 Y128.438 E.00809
G1 X129.524 Y128.337 E.00811
G1 X129.624 Y128.158 E.00631
; CHANGE_LAYER
; Z_HEIGHT: 14.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.524 Y128.337 E-.07807
G1 X129.28 Y128.438 E-.10034
G1 X129.019 Y128.401 E-.10008
G1 X128.841 Y128.224 E-.09523
G1 X128.775 Y127.978 E-.09688
G1 X128.874 Y127.733 E-.10019
G1 X129.004 Y127.618 E-.06591
G1 X129.246 Y127.55 E-.09568
G1 X129.314 Y127.577 E-.02762
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 72/350
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
G3 Z14.6 I-1.001 J.692 P1  F30000
G1 X129.924 Y128.46 Z14.6
G1 Z14.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.836 Y128.577 E.00485
G3 X129.205 Y127.153 I-.616 J-.579 E.11042
G1 X129.271 Y127.154 E.0022
G3 X129.983 Y128.362 I-.051 J.844 E.05484
G1 X129.955 Y128.409 E.00181
G1 X130.254 Y128.687 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.121 Y128.845 E.00634
G3 X129.195 Y126.761 I-.901 J-.848 E.14957
G1 X129.298 Y126.763 E.00318
G3 X130.281 Y128.633 I-.077 J1.234 E.07785
M204 S10000
G1 X129.662 Y127.931 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.558 Y127.696 E.0079
G1 X129.44 Y127.606 E.00455
G1 X129.16 Y127.556 E.00873
G1 X128.932 Y127.67 E.00785
G1 X128.792 Y127.881 E.00778
G1 X128.801 Y128.145 E.0081
G1 X128.954 Y128.348 E.00782
G1 X129.191 Y128.449 E.00793
G1 X129.448 Y128.381 E.00816
G1 X129.632 Y128.194 E.00807
G1 X129.655 Y127.991 E.00627
G1 X129.26 Y127.955 F30000
; LINE_WIDTH: 0.530938
G1 F1200
G2 X129.26 Y128.06 I-.025 J.053 E.00931
; CHANGE_LAYER
; Z_HEIGHT: 14.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.199 Y128.061 E-.19118
G1 X129.168 Y128.008 E-.18961
G1 X129.199 Y127.955 E-.18961
G1 X129.26 Y127.955 E-.18961
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 73/350
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
G3 Z14.8 I-.743 J.964 P1  F30000
G1 X129.921 Y128.465 Z14.8
G1 Z14.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.836 Y128.577 E.00467
G3 X129.205 Y127.153 I-.616 J-.579 E.11043
G1 X129.271 Y127.154 E.00219
G3 X129.983 Y128.362 I-.05 J.844 E.05484
G1 X129.952 Y128.413 E.002
G1 X130.25 Y128.691 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.121 Y128.845 E.00617
G3 X129.195 Y126.761 I-.9 J-.848 E.14957
G1 X129.298 Y126.763 E.00318
G3 X130.278 Y128.638 I-.077 J1.234 E.07802
M204 S10000
G1 X129.662 Y127.931 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.558 Y127.696 E.00789
G1 X129.44 Y127.606 E.00456
G1 X129.16 Y127.556 E.00873
G1 X128.932 Y127.67 E.00785
G1 X128.792 Y127.881 E.00778
G1 X128.801 Y128.145 E.0081
G1 X128.954 Y128.348 E.00782
G1 X129.191 Y128.449 E.00793
G1 X129.448 Y128.381 E.00816
G1 X129.632 Y128.193 E.00807
G1 X129.655 Y127.991 E.00627
G1 X129.26 Y127.955 F30000
; LINE_WIDTH: 0.530936
G1 F1200
G2 X129.26 Y128.06 I-.025 J.053 E.00931
; CHANGE_LAYER
; Z_HEIGHT: 14.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.199 Y128.061 E-.19118
G1 X129.168 Y128.008 E-.18961
G1 X129.199 Y127.955 E-.18961
G1 X129.26 Y127.955 E-.18961
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 74/350
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
G3 Z15 I-.765 J.947 P1  F30000
G1 X129.911 Y128.481 Z15
G1 Z14.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.845 Y128.576 E.00382
G3 X129.205 Y127.153 I-.62 J-.576 E.11069
G1 X129.279 Y127.155 E.00245
G3 X129.992 Y128.358 I-.054 J.845 E.05458
G1 X129.944 Y128.431 E.0029
G1 X130.242 Y128.703 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.223 Y128.73 E.00102
G3 X129.195 Y126.761 I-1.001 J-.731 E.15456
G1 X129.3 Y126.763 E.00325
G3 X130.345 Y128.523 I-.078 J1.237 E.07399
G1 X130.272 Y128.651 E.00454
M204 S10000
G1 X129.662 Y127.936 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.558 Y127.696 E.00804
G1 X129.335 Y127.573 E.00783
G1 X129.082 Y127.573 E.00777
G1 X128.873 Y127.734 E.0081
G1 X128.775 Y127.978 E.00807
G1 X128.842 Y128.224 E.00784
G1 X129.019 Y128.401 E.00769
G1 X129.281 Y128.438 E.00812
G1 X129.523 Y128.338 E.00804
G1 X129.655 Y128.104 E.00824
G1 X129.66 Y127.996 E.00333
G1 X129.256 Y127.946 F30000
; LINE_WIDTH: 0.547494
G1 F1200
G2 X129.258 Y128.052 I-.026 J.054 E.01002
; CHANGE_LAYER
; Z_HEIGHT: 15
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.193 Y128.055 E-.19357
G1 X129.161 Y128 E-.18881
G1 X129.193 Y127.946 E-.18881
G1 X129.256 Y127.946 E-.18881
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 75/350
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
G3 Z15.2 I-.776 J.937 P1  F30000
G1 X129.908 Y128.485 Z15.2
G1 Z15
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.845 Y128.576 E.00365
G3 X129.205 Y127.153 I-.62 J-.576 E.11069
G1 X129.279 Y127.154 E.00244
G3 X129.992 Y128.358 I-.054 J.845 E.05459
G1 X129.941 Y128.435 E.00308
G1 X130.24 Y128.708 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.223 Y128.73 E.00085
G3 X129.195 Y126.761 I-1.001 J-.73 E.15457
G1 X129.3 Y126.763 E.00324
G3 X130.345 Y128.522 I-.078 J1.237 E.074
G1 X130.27 Y128.656 E.00471
M204 S10000
G1 X129.662 Y127.936 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.558 Y127.696 E.00803
G1 X129.335 Y127.573 E.00784
G1 X129.082 Y127.573 E.00776
G1 X128.873 Y127.734 E.00811
G1 X128.775 Y127.978 E.00807
G1 X128.842 Y128.224 E.00784
G1 X129.019 Y128.401 E.00769
G1 X129.281 Y128.438 E.00812
G1 X129.523 Y128.338 E.00804
G1 X129.655 Y128.104 E.00824
G1 X129.66 Y127.996 E.00333
G1 X129.256 Y127.946 F30000
; LINE_WIDTH: 0.547476
G1 F1200
G2 X129.258 Y128.052 I-.026 J.054 E.01002
; CHANGE_LAYER
; Z_HEIGHT: 15.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.193 Y128.055 E-.19357
G1 X129.161 Y128 E-.18881
G1 X129.193 Y127.946 E-.18881
G1 X129.256 Y127.946 E-.18881
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 76/350
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
G3 Z15.4 I-.782 J.933 P1  F30000
G1 X129.905 Y128.489 Z15.4
G1 Z15.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.845 Y128.576 E.00349
G3 X129.205 Y127.153 I-.62 J-.576 E.11069
G1 X129.279 Y127.154 E.00243
G3 X129.992 Y128.357 I-.054 J.845 E.05459
G1 X129.938 Y128.439 E.00325
G1 X130.237 Y128.712 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.223 Y128.729 E.00069
G3 X129.195 Y126.761 I-1.001 J-.73 E.15459
G1 X129.3 Y126.763 E.00324
G3 X130.345 Y128.522 I-.078 J1.237 E.07399
G1 X130.267 Y128.66 E.00487
M204 S10000
M73 P64 R4
G1 X129.662 Y127.931 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.558 Y127.696 E.00788
G1 X129.44 Y127.606 E.00458
G1 X129.16 Y127.556 E.00873
G1 X128.932 Y127.67 E.00784
G1 X128.792 Y127.881 E.00778
G1 X128.801 Y128.145 E.0081
G1 X128.954 Y128.348 E.00782
G1 X129.191 Y128.449 E.00793
G1 X129.446 Y128.382 E.00808
G1 X129.634 Y128.189 E.00829
G1 X129.655 Y127.991 E.00613
G1 X129.26 Y127.955 F30000
; LINE_WIDTH: 0.530954
G1 F1200
G2 X129.26 Y128.06 I-.025 J.053 E.00931
; CHANGE_LAYER
; Z_HEIGHT: 15.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.199 Y128.061 E-.19118
G1 X129.168 Y128.008 E-.18961
G1 X129.199 Y127.955 E-.18961
G1 X129.26 Y127.955 E-.18961
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 77/350
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
G3 Z15.6 I-.781 J.933 P1  F30000
G1 X129.902 Y128.493 Z15.6
G1 Z15.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.845 Y128.576 E.00333
G3 X129.205 Y127.153 I-.62 J-.576 E.11069
G1 X129.278 Y127.154 E.00243
G3 X129.992 Y128.357 I-.054 J.845 E.05459
G1 X129.935 Y128.443 E.00341
G1 X130.235 Y128.716 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.223 Y128.729 E.00053
G3 X129.195 Y126.761 I-1.001 J-.73 E.1546
G1 X129.3 Y126.763 E.00323
G3 X130.345 Y128.522 I-.078 J1.237 E.074
G1 X130.265 Y128.664 E.00502
M204 S10000
G1 X129.662 Y127.936 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.558 Y127.697 E.00802
G1 X129.334 Y127.573 E.00787
G1 X129.082 Y127.573 E.00774
G1 X128.873 Y127.734 E.00811
G1 X128.775 Y127.978 E.00807
G1 X128.842 Y128.224 E.00785
G1 X129.019 Y128.401 E.00768
G1 X129.281 Y128.438 E.00812
G1 X129.523 Y128.338 E.00804
G1 X129.655 Y128.104 E.00825
G1 X129.66 Y127.996 E.00333
G1 X129.256 Y127.946 F30000
; LINE_WIDTH: 0.54744
G1 F1200
G2 X129.258 Y128.052 I-.026 J.054 E.01002
; CHANGE_LAYER
; Z_HEIGHT: 15.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.193 Y128.055 E-.19357
G1 X129.161 Y128 E-.18881
G1 X129.193 Y127.946 E-.18881
G1 X129.256 Y127.946 E-.18881
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 78/350
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
G3 Z15.8 I-.792 J.924 P1  F30000
G1 X129.9 Y128.497 Z15.8
G1 Z15.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.845 Y128.576 E.00319
G3 X129.205 Y127.153 I-.62 J-.576 E.11069
G1 X129.278 Y127.154 E.00242
G3 X129.992 Y128.357 I-.054 J.845 E.05459
G1 X129.933 Y128.447 E.00356
G1 X130.233 Y128.72 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.223 Y128.729 E.00039
G3 X129.195 Y126.761 I-1.002 J-.729 E.15461
G1 X129.299 Y126.763 E.00322
G3 X130.345 Y128.522 I-.077 J1.237 E.074
G1 X130.262 Y128.668 E.00516
M204 S10000
G1 X129.662 Y127.931 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.559 Y127.697 E.00787
G1 X129.44 Y127.606 E.00459
G1 X129.16 Y127.556 E.00873
G1 X128.932 Y127.67 E.00784
G1 X128.792 Y127.881 E.00778
G1 X128.801 Y128.145 E.0081
G1 X128.954 Y128.348 E.00782
G1 X129.191 Y128.449 E.00793
M73 P64 R3
G1 X129.446 Y128.382 E.00808
G1 X129.634 Y128.189 E.00829
G1 X129.655 Y127.991 E.00612
G1 X129.26 Y127.955 F30000
; LINE_WIDTH: 0.530954
G1 F1200
G2 X129.26 Y128.06 I-.025 J.053 E.00931
; CHANGE_LAYER
; Z_HEIGHT: 15.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.199 Y128.061 E-.19118
G1 X129.168 Y128.008 E-.18961
G1 X129.199 Y127.955 E-.18961
G1 X129.26 Y127.955 E-.18961
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 79/350
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
G3 Z16 I-.791 J.925 P1  F30000
G1 X129.897 Y128.5 Z16
G1 Z15.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.845 Y128.576 E.00305
G3 X129.205 Y127.153 I-.62 J-.576 E.11069
G1 X129.278 Y127.154 E.00241
G3 X129.992 Y128.357 I-.053 J.845 E.05459
G1 X129.93 Y128.45 E.0037
G1 X130.231 Y128.724 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.224 Y128.729 E.00027
G3 X129.195 Y126.761 I-1.002 J-.729 E.15462
G1 X129.299 Y126.763 E.00321
G3 X130.345 Y128.522 I-.077 J1.237 E.074
G1 X130.26 Y128.671 E.00529
M204 S10000
G1 X129.662 Y127.931 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.559 Y127.697 E.00786
G1 X129.44 Y127.606 E.0046
G1 X129.16 Y127.556 E.00873
G1 X128.932 Y127.67 E.00784
G1 X128.792 Y127.881 E.00778
G1 X128.801 Y128.145 E.0081
G1 X128.954 Y128.348 E.00782
G1 X129.191 Y128.449 E.00793
G1 X129.446 Y128.382 E.00808
G1 X129.634 Y128.189 E.00829
G1 X129.655 Y127.991 E.00612
G1 X129.26 Y127.955 F30000
; LINE_WIDTH: 0.530954
G1 F1200
G2 X129.26 Y128.06 I-.025 J.053 E.00931
; CHANGE_LAYER
; Z_HEIGHT: 16
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.199 Y128.061 E-.19118
G1 X129.168 Y128.008 E-.18961
G1 X129.199 Y127.955 E-.18961
G1 X129.26 Y127.955 E-.18961
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 80/350
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
G3 Z16.2 I-.795 J.922 P1  F30000
G1 X129.895 Y128.503 Z16.2
G1 Z16
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.845 Y128.576 E.00294
G3 X129.205 Y127.153 I-.62 J-.576 E.11069
G1 X129.278 Y127.154 E.0024
G3 X129.992 Y128.357 I-.053 J.845 E.05459
G1 X129.928 Y128.453 E.00383
G1 X130.229 Y128.727 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.224 Y128.728 E.00016
G3 X129.195 Y126.761 I-1.002 J-.729 E.15464
G1 X129.299 Y126.763 E.0032
G3 X130.345 Y128.521 I-.077 J1.237 E.074
G1 X130.258 Y128.675 E.00541
M204 S10000
G1 X129.662 Y127.931 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.559 Y127.697 E.00786
G1 X129.44 Y127.606 E.00461
G1 X129.16 Y127.556 E.00873
G1 X128.932 Y127.67 E.00784
G1 X128.792 Y127.881 E.00778
G1 X128.801 Y128.145 E.0081
G1 X128.954 Y128.348 E.00782
G1 X129.191 Y128.449 E.00793
G1 X129.446 Y128.382 E.00808
G1 X129.634 Y128.189 E.0083
G1 X129.655 Y127.991 E.00612
G1 X129.26 Y127.955 F30000
; LINE_WIDTH: 0.53096
G1 F1200
G2 X129.26 Y128.06 I-.025 J.053 E.00931
; CHANGE_LAYER
; Z_HEIGHT: 16.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.199 Y128.061 E-.19119
G1 X129.168 Y128.008 E-.1896
G1 X129.199 Y127.955 E-.18961
G1 X129.26 Y127.955 E-.1896
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 81/350
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
G3 Z16.4 I-.798 J.919 P1  F30000
G1 X129.894 Y128.506 Z16.4
G1 Z16.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.845 Y128.576 E.00283
G3 X129.205 Y127.153 I-.62 J-.576 E.11069
G1 X129.277 Y127.154 E.00239
G3 X129.992 Y128.357 I-.053 J.845 E.05459
G1 X129.927 Y128.456 E.00394
G1 X130.224 Y128.728 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.195 Y126.761 I-1.002 J-.729 E.15465
G1 X129.298 Y126.763 E.00319
G3 X130.258 Y128.679 I-.077 J1.237 E.07954
M204 S10000
G1 X129.663 Y127.936 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.559 Y127.697 E.008
G1 X129.333 Y127.573 E.00792
G1 X129.082 Y127.573 E.00771
G1 X128.873 Y127.734 E.00811
G1 X128.775 Y127.978 E.00807
G1 X128.842 Y128.225 E.00786
G1 X129.019 Y128.4 E.00766
G1 X129.281 Y128.438 E.00813
G1 X129.523 Y128.338 E.00804
G1 X129.655 Y128.104 E.00826
G1 X129.66 Y127.996 E.00332
G1 X129.256 Y127.946 F30000
; LINE_WIDTH: 0.547358
G1 F1200
G2 X129.258 Y128.052 I-.026 J.054 E.01001
; CHANGE_LAYER
; Z_HEIGHT: 16.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X129.193 Y128.055 E-.19355
G1 X129.161 Y128 E-.18882
G1 X129.193 Y127.946 E-.18882
G1 X129.256 Y127.946 E-.18882
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 82/350
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
G3 Z16.6 I-.806 J.912 P1  F30000
G1 X129.892 Y128.508 Z16.6
G1 Z16.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.844 Y128.576 E.00275
G3 X129.205 Y127.153 I-.62 J-.576 E.11069
G1 X129.277 Y127.154 E.00238
G3 X129.992 Y128.357 I-.053 J.845 E.05459
G1 X129.925 Y128.458 E.00403
G1 X130.226 Y128.732 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.126 Y128.847 E.00469
G3 X129.195 Y126.761 I-.904 J-.848 E.14991
G1 X129.298 Y126.763 E.00318
G3 X130.256 Y128.682 I-.077 J1.237 E.07966
M204 S10000
G1 X129.663 Y127.936 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.559 Y127.697 E.00799
G1 X129.333 Y127.573 E.00793
G1 X129.082 Y127.573 E.0077
G1 X128.873 Y127.734 E.00811
G1 X128.775 Y127.978 E.00807
G1 X128.842 Y128.225 E.00786
G1 X129.019 Y128.4 E.00766
G1 X129.281 Y128.438 E.00813
G1 X129.523 Y128.338 E.00804
G1 X129.655 Y128.104 E.00826
G1 X129.66 Y127.996 E.00332
G1 X129.256 Y127.946 F30000
; LINE_WIDTH: 0.54734
G1 F1200
M73 P65 R3
G2 X129.257 Y128.052 I-.026 J.054 E.01001
; CHANGE_LAYER
; Z_HEIGHT: 16.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.193 Y128.055 E-.19355
G1 X129.161 Y128 E-.18882
G1 X129.193 Y127.946 E-.18882
G1 X129.256 Y127.946 E-.18882
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 83/350
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
G3 Z16.8 I-.808 J.91 P1  F30000
G1 X129.891 Y128.51 Z16.8
G1 Z16.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.844 Y128.576 E.00269
G3 X129.205 Y127.153 I-.62 J-.577 E.11069
G1 X129.277 Y127.154 E.00237
G3 X129.992 Y128.356 I-.053 J.845 E.05459
G1 X129.924 Y128.46 E.0041
G1 X130.224 Y128.733 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.125 Y128.847 E.00463
G3 X129.195 Y126.761 I-.904 J-.848 E.1499
G1 X129.298 Y126.763 E.00318
G3 X130.255 Y128.683 I-.076 J1.237 E.0797
M204 S10000
G1 X129.662 Y127.931 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.559 Y127.697 E.00784
G1 X129.44 Y127.606 E.00463
G1 X129.16 Y127.556 E.00873
G1 X128.932 Y127.67 E.00784
G1 X128.792 Y127.881 E.00778
G1 X128.801 Y128.145 E.0081
G1 X128.954 Y128.348 E.00782
G1 X129.191 Y128.449 E.00793
G1 X129.445 Y128.382 E.00807
G1 X129.634 Y128.188 E.00831
G1 X129.655 Y127.991 E.00611
G1 X129.26 Y127.955 F30000
; LINE_WIDTH: 0.530956
G1 F1200
G2 X129.26 Y128.06 I-.025 J.053 E.00931
; CHANGE_LAYER
; Z_HEIGHT: 16.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X129.199 Y128.061 E-.19118
G1 X129.168 Y128.008 E-.18961
G1 X129.199 Y127.955 E-.18961
G1 X129.26 Y127.955 E-.18961
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 84/350
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
G3 Z17 I-.805 J.913 P1  F30000
G1 X129.89 Y128.511 Z17
G1 Z16.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.844 Y128.576 E.00265
G3 X129.205 Y127.153 I-.62 J-.577 E.11069
G1 X129.277 Y127.154 E.00237
G3 X129.992 Y128.356 I-.052 J.845 E.05459
G1 X129.923 Y128.461 E.00415
G1 X130.224 Y128.734 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.125 Y128.847 E.0046
G3 X129.195 Y126.761 I-.904 J-.848 E.1499
G1 X129.298 Y126.763 E.00317
G3 X130.255 Y128.684 I-.076 J1.237 E.07974
M204 S10000
G1 X129.663 Y127.936 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.559 Y127.698 E.00798
G1 X129.332 Y127.573 E.00796
G1 X129.082 Y127.573 E.00769
G1 X128.873 Y127.734 E.00811
G1 X128.775 Y127.978 E.00807
G1 X128.842 Y128.225 E.00787
G1 X129.019 Y128.4 E.00765
G1 X129.281 Y128.438 E.00813
G1 X129.522 Y128.338 E.00804
G1 X129.655 Y128.104 E.00826
G1 X129.66 Y127.996 E.00331
G1 X129.256 Y127.946 F30000
; LINE_WIDTH: 0.547296
G1 F1200
G2 X129.257 Y128.052 I-.026 J.054 E.01001
; CHANGE_LAYER
; Z_HEIGHT: 17
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.193 Y128.055 E-.19355
G1 X129.161 Y128 E-.18882
G1 X129.193 Y127.946 E-.18882
G1 X129.256 Y127.946 E-.18882
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 85/350
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
G3 Z17.2 I-.81 J.908 P1  F30000
G1 X129.89 Y128.511 Z17.2
G1 Z17
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.844 Y128.576 E.00263
G3 X129.205 Y127.153 I-.62 J-.577 E.11069
G1 X129.276 Y127.154 E.00236
G3 X129.992 Y128.356 I-.052 J.845 E.0546
G1 X129.923 Y128.461 E.00417
G1 X130.223 Y128.735 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.125 Y128.847 E.00458
G3 X129.195 Y126.761 I-.904 J-.848 E.1499
G1 X129.297 Y126.763 E.00316
G3 X130.254 Y128.684 I-.076 J1.237 E.07976
M204 S10000
G1 X129.662 Y127.931 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.56 Y127.698 E.00783
G1 X129.44 Y127.606 E.00464
G1 X129.16 Y127.556 E.00872
G1 X128.932 Y127.67 E.00785
G1 X128.792 Y127.881 E.00778
G1 X128.801 Y128.145 E.0081
G1 X128.954 Y128.348 E.00782
G1 X129.191 Y128.449 E.00793
G1 X129.445 Y128.382 E.00807
G1 X129.634 Y128.188 E.00831
G1 X129.655 Y127.991 E.00611
G1 X129.26 Y127.955 F30000
; LINE_WIDTH: 0.530946
G1 F1200
G2 X129.26 Y128.06 I-.025 J.053 E.00931
; CHANGE_LAYER
; Z_HEIGHT: 17.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.199 Y128.061 E-.19119
G1 X129.168 Y128.008 E-.1896
G1 X129.199 Y127.955 E-.18961
G1 X129.26 Y127.955 E-.1896
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 86/350
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
G3 Z17.4 I-.805 J.912 P1  F30000
G1 X129.89 Y128.511 Z17.4
G1 Z17.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.844 Y128.576 E.00263
G3 X129.205 Y127.153 I-.62 J-.577 E.11069
G1 X129.276 Y127.154 E.00235
G3 X129.992 Y128.356 I-.052 J.845 E.0546
G1 X129.923 Y128.461 E.00418
G1 X130.223 Y128.735 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.125 Y128.847 E.00459
G3 X129.195 Y126.761 I-.904 J-.848 E.1499
G1 X129.297 Y126.763 E.00315
G3 X130.254 Y128.684 I-.076 J1.237 E.07977
M204 S10000
G1 X129.663 Y127.936 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.56 Y127.698 E.00797
G1 X129.332 Y127.573 E.00798
G1 X129.082 Y127.573 E.00767
G1 X128.873 Y127.734 E.00811
G1 X128.775 Y127.978 E.00807
G1 X128.842 Y128.225 E.00788
G1 X129.019 Y128.4 E.00765
G1 X129.281 Y128.438 E.00813
G1 X129.522 Y128.338 E.00804
G1 X129.655 Y128.104 E.00827
G1 X129.66 Y127.996 E.00331
G1 X129.256 Y127.946 F30000
; LINE_WIDTH: 0.547262
G1 F1200
G2 X129.257 Y128.052 I-.026 J.054 E.01001
; CHANGE_LAYER
; Z_HEIGHT: 17.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X129.193 Y128.055 E-.19354
G1 X129.161 Y128 E-.18882
G1 X129.193 Y127.946 E-.18882
G1 X129.256 Y127.946 E-.18882
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 87/350
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
G3 Z17.6 I-.784 J.931 P1  F30000
G1 X129.91 Y128.496 Z17.6
G1 Z17.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.205 Y127.153 I-.686 J-.497 E.11412
G1 X129.276 Y127.154 E.00234
G3 X129.943 Y128.447 I-.052 J.845 E.05802
G1 X130.223 Y128.734 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.087 Y128.886 E.00627
G3 X129.195 Y126.761 I-.866 J-.887 E.14824
G1 X129.297 Y126.763 E.00314
G3 X130.255 Y128.683 I-.075 J1.237 E.07975
M204 S10000
G1 X129.662 Y127.931 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.56 Y127.698 E.00782
G1 X129.44 Y127.606 E.00465
G1 X129.16 Y127.556 E.00872
G1 X128.932 Y127.67 E.00785
G1 X128.792 Y127.881 E.00778
G1 X128.801 Y128.145 E.0081
G1 X128.954 Y128.348 E.00782
G1 X129.191 Y128.449 E.00793
G1 X129.449 Y128.38 E.00819
G1 X129.634 Y128.189 E.00818
G1 X129.655 Y127.991 E.00612
G1 X129.259 Y127.955 F30000
; LINE_WIDTH: 0.530664
G1 F1200
G2 X129.26 Y128.06 I-.025 J.052 E.00929
; CHANGE_LAYER
; Z_HEIGHT: 17.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.198 Y128.06 E-.19114
G1 X129.168 Y128.008 E-.18962
G1 X129.198 Y127.955 E-.18962
G1 X129.259 Y127.955 E-.18962
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 88/350
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
G3 Z17.8 I-.779 J.935 P1  F30000
G1 X129.91 Y128.496 Z17.8
G1 Z17.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.206 Y127.153 I-.686 J-.497 E.11413
G1 X129.276 Y127.154 E.00233
G3 X129.943 Y128.446 I-.052 J.845 E.05802
G1 X130.224 Y128.733 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.087 Y128.886 E.0063
G3 X129.195 Y126.761 I-.866 J-.887 E.14824
G1 X129.297 Y126.763 E.00313
G3 X130.255 Y128.683 I-.075 J1.237 E.07973
M204 S10000
G1 X129.662 Y127.931 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.56 Y127.698 E.00781
G1 X129.44 Y127.606 E.00466
G1 X129.16 Y127.556 E.00872
G1 X128.932 Y127.67 E.00785
G1 X128.792 Y127.881 E.00778
G1 X128.801 Y128.145 E.0081
G1 X128.954 Y128.348 E.00782
G1 X129.191 Y128.449 E.00793
G1 X129.449 Y128.38 E.00819
G1 X129.634 Y128.189 E.00818
G1 X129.655 Y127.991 E.00611
G1 X129.259 Y127.955 F30000
; LINE_WIDTH: 0.530666
G1 F1200
G2 X129.26 Y128.059 I-.025 J.052 E.00929
; CHANGE_LAYER
; Z_HEIGHT: 17.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X129.198 Y128.06 E-.19114
G1 X129.168 Y128.008 E-.18962
G1 X129.198 Y127.955 E-.18962
G1 X129.259 Y127.955 E-.18962
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 89/350
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
G3 Z18 I-.778 J.935 P1  F30000
G1 X129.91 Y128.496 Z18
G1 Z17.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.206 Y127.153 I-.686 J-.497 E.11414
G1 X129.276 Y127.154 E.00232
G3 X129.943 Y128.446 I-.051 J.845 E.05802
G1 X130.225 Y128.732 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.087 Y128.886 E.00634
G3 X129.195 Y126.761 I-.866 J-.887 E.14824
G1 X129.296 Y126.763 E.00312
G3 X130.256 Y128.682 I-.075 J1.237 E.0797
M204 S10000
G1 X129.662 Y127.931 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.56 Y127.698 E.00781
G1 X129.44 Y127.606 E.00467
G1 X129.16 Y127.556 E.00872
G1 X128.932 Y127.67 E.00785
G1 X128.792 Y127.881 E.00778
G1 X128.801 Y128.145 E.0081
G1 X128.954 Y128.348 E.00782
G1 X129.191 Y128.449 E.00793
G1 X129.449 Y128.38 E.00819
G1 X129.634 Y128.189 E.00818
G1 X129.655 Y127.991 E.00611
G1 X129.259 Y127.955 F30000
; LINE_WIDTH: 0.530666
M73 P66 R3
G1 F1200
G2 X129.26 Y128.059 I-.025 J.052 E.00929
; CHANGE_LAYER
; Z_HEIGHT: 18
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.198 Y128.06 E-.19114
G1 X129.168 Y128.008 E-.18962
G1 X129.198 Y127.955 E-.18962
G1 X129.259 Y127.955 E-.18962
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 90/350
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
G3 Z18.2 I-.778 J.936 P1  F30000
G1 X129.91 Y128.496 Z18.2
G1 Z18
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.206 Y127.153 I-.686 J-.496 E.11415
G1 X129.275 Y127.154 E.00231
G3 X129.943 Y128.446 I-.051 J.845 E.05802
G1 X130.226 Y128.731 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.087 Y128.886 E.00639
G3 X129.195 Y126.761 I-.866 J-.887 E.14824
G1 X129.296 Y126.763 E.00312
G3 X130.256 Y128.68 I-.075 J1.237 E.07967
M204 S10000
G1 X129.663 Y127.936 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.56 Y127.699 E.00796
G1 X129.331 Y127.573 E.00804
G1 X129.082 Y127.573 E.00764
G1 X128.873 Y127.734 E.00811
G1 X128.775 Y127.978 E.00807
G1 X128.843 Y128.225 E.00789
G1 X129.019 Y128.4 E.00763
G1 X129.279 Y128.438 E.00809
G1 X129.526 Y128.335 E.00821
G1 X129.655 Y128.104 E.00813
G1 X129.66 Y127.996 E.00332
; CHANGE_LAYER
; Z_HEIGHT: 18.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.655 Y128.104 E-.04102
G1 X129.526 Y128.335 E-.1005
G1 X129.279 Y128.438 E-.10153
G1 X129.019 Y128.4 E-.10001
G1 X128.843 Y128.225 E-.0944
G1 X128.775 Y127.978 E-.09754
G1 X128.873 Y127.734 E-.09981
G1 X129.082 Y127.573 E-.10036
G1 X129.148 Y127.573 E-.02483
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 91/350
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
G3 Z18.4 I-.938 J.775 P1  F30000
G1 X129.91 Y128.496 Z18.4
G1 Z18.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.206 Y127.153 I-.686 J-.496 E.11416
G1 X129.275 Y127.154 E.00231
G3 X129.943 Y128.446 I-.051 J.845 E.05802
G1 X130.227 Y128.729 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.087 Y128.886 E.00645
G3 X129.195 Y126.761 I-.866 J-.886 E.14824
G1 X129.296 Y126.763 E.00311
G3 X130.257 Y128.679 I-.074 J1.237 E.07963
M204 S10000
G1 X129.655 Y128.104 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.65 Y127.851 E.00777
G1 X129.497 Y127.65 E.00776
G1 X129.249 Y127.55 E.00823
G1 X129.004 Y127.618 E.00781
G1 X128.874 Y127.733 E.00534
G1 X128.775 Y127.978 E.0081
G1 X128.843 Y128.225 E.00789
G1 X129.019 Y128.4 E.00763
G1 X129.279 Y128.438 E.00809
G1 X129.526 Y128.335 E.00821
G1 X129.626 Y128.156 E.00629
; CHANGE_LAYER
; Z_HEIGHT: 18.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X129.526 Y128.335 E-.07773
G1 X129.279 Y128.438 E-.10153
G1 X129.019 Y128.4 E-.10002
G1 X128.843 Y128.225 E-.09435
G1 X128.775 Y127.978 E-.09757
G1 X128.874 Y127.733 E-.10011
G1 X129.004 Y127.618 E-.06606
G1 X129.249 Y127.55 E-.09654
G1 X129.312 Y127.576 E-.02608
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 92/350
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
G3 Z18.6 I-1.02 J.663 P1  F30000
G1 X129.91 Y128.496 Z18.6
G1 Z18.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.206 Y127.153 I-.686 J-.496 E.11417
G1 X129.275 Y127.154 E.0023
G3 X129.944 Y128.446 I-.051 J.845 E.05802
G1 X130.228 Y128.728 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.087 Y128.886 E.00652
G3 X129.195 Y126.761 I-.866 J-.886 E.14825
G1 X129.295 Y126.763 E.0031
G3 X130.258 Y128.678 I-.074 J1.237 E.0796
M204 S10000
G1 X129.663 Y127.936 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.56 Y127.699 E.00795
G1 X129.33 Y127.573 E.00806
G1 X129.082 Y127.573 E.00762
G1 X128.873 Y127.734 E.00812
G1 X128.775 Y127.978 E.00807
G1 X128.848 Y128.23 E.00808
G1 X129.042 Y128.412 E.00816
G1 X129.279 Y128.438 E.00731
G1 X129.526 Y128.335 E.00823
G1 X129.655 Y128.104 E.00813
G1 X129.66 Y127.996 E.00331
G1 X129.256 Y127.946 F30000
; LINE_WIDTH: 0.547224
G1 F1200
G2 X129.258 Y128.052 I-.026 J.054 E.01001
; CHANGE_LAYER
; Z_HEIGHT: 18.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.193 Y128.055 E-.19353
G1 X129.161 Y128 E-.18882
G1 X129.193 Y127.946 E-.18882
G1 X129.256 Y127.946 E-.18882
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 93/350
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
G3 Z18.8 I-.783 J.932 P1  F30000
G1 X129.91 Y128.495 Z18.8
G1 Z18.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.206 Y127.153 I-.686 J-.496 E.11418
G1 X129.275 Y127.154 E.00229
G3 X129.944 Y128.445 I-.051 J.845 E.05802
G1 X130.226 Y128.724 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.195 Y126.761 I-1.005 J-.725 E.15482
G1 X129.295 Y126.763 E.00309
G3 X130.26 Y128.675 I-.074 J1.237 E.07947
M204 S10000
G1 X129.663 Y127.936 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.561 Y127.699 E.00794
G1 X129.33 Y127.573 E.00808
G1 X129.082 Y127.573 E.00761
G1 X128.873 Y127.733 E.0081
G1 X128.774 Y127.985 E.00831
G1 X128.837 Y128.211 E.00723
G1 X129.02 Y128.401 E.00807
G1 X129.279 Y128.438 E.00806
G1 X129.526 Y128.335 E.00821
G1 X129.655 Y128.104 E.00813
G1 X129.66 Y127.996 E.00331
G1 X129.256 Y127.946 F30000
; LINE_WIDTH: 0.547222
G1 F1200
G2 X129.258 Y128.052 I-.026 J.054 E.01001
; CHANGE_LAYER
; Z_HEIGHT: 18.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X129.193 Y128.055 E-.19353
G1 X129.162 Y128 E-.18882
G1 X129.193 Y127.946 E-.18882
G1 X129.256 Y127.946 E-.18882
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 94/350
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
G3 Z19 I-.783 J.932 P1  F30000
G1 X129.91 Y128.495 Z19
G1 Z18.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.206 Y127.153 I-.686 J-.496 E.11419
G1 X129.274 Y127.154 E.00228
G3 X129.944 Y128.445 I-.051 J.845 E.05802
G1 X130.231 Y128.724 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.226 Y128.724 E.00014
G3 X129.195 Y126.761 I-1.005 J-.724 E.15483
G1 X129.295 Y126.763 E.00308
G3 X130.346 Y128.519 I-.074 J1.237 E.074
G1 X130.26 Y128.672 E.00539
M204 S10000
G1 X129.663 Y127.936 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.561 Y127.699 E.00793
G1 X129.338 Y127.575 E.00785
G1 X129.082 Y127.573 E.00785
G1 X128.873 Y127.734 E.00812
G1 X128.775 Y127.978 E.00807
G1 X128.843 Y128.226 E.0079
G1 X129.019 Y128.4 E.00762
G1 X129.279 Y128.438 E.00809
G1 X129.526 Y128.335 E.00821
G1 X129.655 Y128.104 E.00814
G1 X129.66 Y127.996 E.00331
; CHANGE_LAYER
; Z_HEIGHT: 19
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.655 Y128.104 E-.04092
G1 X129.526 Y128.335 E-.10062
G1 X129.279 Y128.438 E-.10151
G1 X129.019 Y128.4 E-.10003
G1 X128.843 Y128.226 E-.09423
G1 X128.775 Y127.978 E-.09768
G1 X128.873 Y127.734 E-.09981
G1 X129.082 Y127.573 E-.10039
G1 X129.148 Y127.573 E-.02482
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 95/350
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
G3 Z19.2 I-.938 J.776 P1  F30000
G1 X129.91 Y128.495 Z19.2
G1 Z19
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.206 Y127.153 I-.687 J-.495 E.1142
G1 X129.274 Y127.154 E.00227
G3 X129.944 Y128.445 I-.05 J.845 E.05801
G1 X130.232 Y128.722 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.227 Y128.724 E.00018
G3 X129.195 Y126.761 I-1.005 J-.724 E.15484
G1 X129.295 Y126.763 E.00307
G3 X130.346 Y128.518 I-.074 J1.237 E.074
G1 X130.261 Y128.67 E.00533
M204 S10000
G1 X129.662 Y127.931 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.561 Y127.699 E.00777
G1 X129.44 Y127.606 E.00471
G1 X129.16 Y127.556 E.00872
G1 X128.932 Y127.67 E.00785
G1 X128.792 Y127.881 E.00778
G1 X128.801 Y128.145 E.0081
G1 X128.954 Y128.348 E.00782
G1 X129.191 Y128.449 E.00793
G1 X129.449 Y128.38 E.00818
G1 X129.634 Y128.188 E.00821
G1 X129.656 Y127.991 E.0061
G1 X129.259 Y127.955 F30000
; LINE_WIDTH: 0.530678
G1 F1200
G2 X129.26 Y128.059 I-.025 J.052 E.00929
; CHANGE_LAYER
; Z_HEIGHT: 19.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.198 Y128.06 E-.19115
G1 X129.168 Y128.008 E-.18962
G1 X129.198 Y127.955 E-.18962
G1 X129.259 Y127.955 E-.18962
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 96/350
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
G3 Z19.4 I-.777 J.937 P1  F30000
G1 X129.91 Y128.495 Z19.4
G1 Z19.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.206 Y127.153 I-.687 J-.495 E.11421
G1 X129.274 Y127.154 E.00226
G3 X129.944 Y128.445 I-.05 J.845 E.05801
G1 X130.233 Y128.72 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.227 Y128.723 E.00023
G3 X129.195 Y126.761 I-1.006 J-.724 E.15485
G1 X129.294 Y126.762 E.00306
G3 X130.346 Y128.518 I-.073 J1.237 E.074
G1 X130.263 Y128.668 E.00526
M204 S10000
G1 X129.662 Y127.931 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
M73 P67 R3
G1 F1200
G1 X129.561 Y127.699 E.00776
G1 X129.44 Y127.606 E.00471
G1 X129.16 Y127.556 E.00871
G1 X128.932 Y127.67 E.00785
G1 X128.792 Y127.881 E.00778
G1 X128.801 Y128.145 E.0081
G1 X128.954 Y128.348 E.00782
G1 X129.191 Y128.449 E.00793
G1 X129.449 Y128.38 E.00818
G1 X129.634 Y128.188 E.00821
G1 X129.656 Y127.991 E.00609
G1 X129.259 Y127.955 F30000
; LINE_WIDTH: 0.530684
G1 F1200
G2 X129.26 Y128.059 I-.025 J.052 E.00929
; CHANGE_LAYER
; Z_HEIGHT: 19.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X129.198 Y128.06 E-.19115
G1 X129.168 Y128.008 E-.18962
G1 X129.198 Y127.955 E-.18962
G1 X129.259 Y127.955 E-.18962
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 97/350
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
G3 Z19.6 I-.777 J.937 P1  F30000
G1 X129.911 Y128.495 Z19.6
G1 Z19.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.206 Y127.153 I-.687 J-.495 E.11422
G1 X129.274 Y127.154 E.00225
G3 X129.944 Y128.445 I-.05 J.845 E.05801
G1 X130.234 Y128.718 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.227 Y128.723 E.00028
G3 X129.195 Y126.761 I-1.006 J-.724 E.15486
G1 X129.294 Y126.762 E.00305
G3 X130.346 Y128.518 I-.073 J1.237 E.074
G1 X130.264 Y128.666 E.0052
M204 S10000
G1 X129.663 Y127.936 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.561 Y127.7 E.00792
G1 X129.337 Y127.575 E.00788
G1 X129.082 Y127.573 E.00783
G1 X128.873 Y127.734 E.00812
G1 X128.775 Y127.978 E.00807
G1 X128.843 Y128.226 E.00791
G1 X129.019 Y128.4 E.00761
G1 X129.279 Y128.438 E.00809
G1 X129.526 Y128.335 E.00821
G1 X129.655 Y128.104 E.00814
G1 X129.66 Y127.996 E.0033
; CHANGE_LAYER
; Z_HEIGHT: 19.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.655 Y128.104 E-.04085
G1 X129.526 Y128.335 E-.10071
G1 X129.279 Y128.438 E-.10149
G1 X129.019 Y128.4 E-.10005
G1 X128.843 Y128.226 E-.0941
G1 X128.775 Y127.978 E-.09778
G1 X128.873 Y127.734 E-.0998
G1 X129.082 Y127.573 E-.10041
G1 X129.148 Y127.573 E-.0248
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 98/350
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
G3 Z19.8 I-.937 J.776 P1  F30000
G1 X129.911 Y128.494 Z19.8
G1 Z19.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.206 Y127.153 I-.687 J-.495 E.11423
G1 X129.273 Y127.154 E.00224
G3 X129.944 Y128.444 I-.05 J.845 E.05801
G1 X130.236 Y128.716 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.227 Y128.723 E.00033
G3 X129.195 Y126.761 I-1.006 J-.723 E.15488
G1 X129.294 Y126.762 E.00305
G3 X130.346 Y128.518 I-.073 J1.237 E.074
G1 X130.265 Y128.664 E.00514
M204 S10000
G1 X129.662 Y127.931 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.561 Y127.7 E.00775
G1 X129.44 Y127.606 E.00473
G1 X129.16 Y127.556 E.00871
G1 X128.932 Y127.67 E.00785
G1 X128.792 Y127.881 E.00778
G1 X128.801 Y128.145 E.0081
G1 X128.954 Y128.348 E.00782
G1 X129.191 Y128.449 E.00793
G1 X129.449 Y128.38 E.00818
G1 X129.634 Y128.188 E.00822
G1 X129.656 Y127.991 E.00609
G1 X129.259 Y127.955 F30000
; LINE_WIDTH: 0.53068
G1 F1200
G2 X129.26 Y128.059 I-.025 J.052 E.00929
; CHANGE_LAYER
; Z_HEIGHT: 19.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X129.198 Y128.06 E-.19115
G1 X129.168 Y128.008 E-.18962
G1 X129.198 Y127.955 E-.18962
G1 X129.259 Y127.955 E-.18962
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 99/350
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
G3 Z20 I-.776 J.937 P1  F30000
G1 X129.911 Y128.494 Z20
G1 Z19.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.206 Y127.153 I-.687 J-.495 E.11424
G1 X129.273 Y127.154 E.00224
G3 X129.944 Y128.444 I-.05 J.845 E.05801
G1 X130.236 Y128.715 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.227 Y128.723 E.00037
G3 X129.195 Y126.761 I-1.006 J-.723 E.15489
G1 X129.294 Y126.762 E.00304
G3 X130.347 Y128.518 I-.073 J1.237 E.07401
G1 X130.266 Y128.662 E.00509
M204 S10000
G1 X129.662 Y127.931 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.561 Y127.7 E.00775
G1 X129.44 Y127.606 E.00473
G1 X129.16 Y127.556 E.00871
G1 X128.929 Y127.673 E.00798
G1 X128.789 Y127.889 E.0079
G1 X128.809 Y128.147 E.00794
G1 X128.957 Y128.36 E.00798
G1 X129.2 Y128.448 E.00793
G1 X129.451 Y128.379 E.008
G1 X129.634 Y128.188 E.00815
G1 X129.656 Y127.991 E.00609
; CHANGE_LAYER
; Z_HEIGHT: 20
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.634 Y128.188 E-.07527
G1 X129.451 Y128.379 E-.10074
G1 X129.2 Y128.448 E-.09894
G1 X128.957 Y128.36 E-.09804
G1 X128.809 Y128.147 E-.09874
G1 X128.789 Y127.889 E-.09824
G1 X128.929 Y127.673 E-.09776
G1 X129.145 Y127.564 E-.09228
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 100/350
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
G3 Z20.2 I-.94 J.773 P1  F30000
G1 X129.911 Y128.494 Z20.2
G1 Z20
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.206 Y127.153 I-.687 J-.495 E.11425
G1 X129.273 Y127.154 E.00223
G3 X129.944 Y128.444 I-.049 J.845 E.05801
G1 X130.238 Y128.713 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.227 Y128.722 E.00043
G3 X129.195 Y126.761 I-1.006 J-.723 E.1549
G1 X129.293 Y126.762 E.00303
G3 X130.347 Y128.517 I-.072 J1.237 E.07401
G1 X130.267 Y128.66 E.00503
M204 S10000
G1 X129.663 Y127.936 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.562 Y127.7 E.0079
G1 X129.337 Y127.575 E.0079
G1 X129.082 Y127.573 E.00782
G1 X128.873 Y127.734 E.00812
G1 X128.775 Y127.978 E.00807
G1 X128.848 Y128.23 E.00808
G1 X129.043 Y128.413 E.0082
G1 X129.279 Y128.438 E.00729
G1 X129.526 Y128.335 E.00821
G1 X129.655 Y128.104 E.00815
G1 X129.66 Y127.996 E.0033
G1 X129.256 Y127.946 F30000
; LINE_WIDTH: 0.547026
G1 F1200
G2 X129.258 Y128.053 I-.026 J.054 E.01
; CHANGE_LAYER
; Z_HEIGHT: 20.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.193 Y128.055 E-.19351
G1 X129.162 Y128.001 E-.18883
G1 X129.193 Y127.946 E-.18883
G1 X129.256 Y127.946 E-.18883
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 101/350
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
G3 Z20.4 I-.781 J.933 P1  F30000
G1 X129.911 Y128.494 Z20.4
G1 Z20.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.206 Y127.153 I-.687 J-.494 E.11426
G1 X129.273 Y127.154 E.00222
G3 X129.944 Y128.444 I-.049 J.845 E.05801
G1 X130.238 Y128.712 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.228 Y128.722 E.00046
G3 X129.195 Y126.761 I-1.007 J-.723 E.15491
G1 X129.293 Y126.762 E.00302
G3 X130.347 Y128.517 I-.072 J1.237 E.07401
G1 X130.267 Y128.659 E.005
M204 S10000
G1 X129.662 Y127.931 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.562 Y127.7 E.00774
G1 X129.44 Y127.606 E.00475
G1 X129.16 Y127.556 E.00871
G1 X128.932 Y127.67 E.00785
G1 X128.792 Y127.881 E.00778
G1 X128.801 Y128.145 E.0081
G1 X128.954 Y128.348 E.00782
G1 X129.191 Y128.449 E.00793
G1 X129.448 Y128.38 E.00818
G1 X129.635 Y128.188 E.00823
G1 X129.656 Y127.991 E.00608
G1 X129.259 Y127.955 F30000
; LINE_WIDTH: 0.530696
G1 F1200
G2 X129.26 Y128.059 I-.025 J.052 E.0093
; CHANGE_LAYER
; Z_HEIGHT: 20.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X129.198 Y128.06 E-.19115
G1 X129.168 Y128.008 E-.18962
G1 X129.198 Y127.955 E-.18962
G1 X129.259 Y127.955 E-.18962
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 102/350
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
G3 Z20.6 I-.776 J.938 P1  F30000
G1 X129.911 Y128.494 Z20.6
G1 Z20.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.206 Y127.153 I-.688 J-.494 E.11427
G1 X129.272 Y127.154 E.00221
G3 X129.944 Y128.444 I-.049 J.845 E.05801
G1 X130.239 Y128.711 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.228 Y128.722 E.00047
G3 X129.195 Y126.761 I-1.007 J-.722 E.15492
G1 X129.293 Y126.762 E.00301
G3 X130.347 Y128.517 I-.072 J1.237 E.07401
G1 X130.268 Y128.659 E.00498
M204 S10000
G1 X129.663 Y127.936 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.562 Y127.7 E.00789
G1 X129.337 Y127.575 E.00792
G1 X129.083 Y127.573 E.00781
G1 X128.873 Y127.734 E.00812
G1 X128.775 Y127.978 E.00807
G1 X128.844 Y128.226 E.00792
G1 X129.019 Y128.4 E.00759
G1 X129.279 Y128.438 E.00809
G1 X129.526 Y128.335 E.0082
G1 X129.655 Y128.103 E.00816
G1 X129.66 Y127.996 E.00329
; CHANGE_LAYER
; Z_HEIGHT: 20.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
M73 P68 R3
G1 X129.655 Y128.103 E-.04073
G1 X129.526 Y128.335 E-.10087
G1 X129.279 Y128.438 E-.10147
G1 X129.019 Y128.4 E-.10008
G1 X128.844 Y128.226 E-.09388
G1 X128.775 Y127.978 E-.09795
G1 X128.873 Y127.734 E-.09979
G1 X129.083 Y127.573 E-.10045
G1 X129.148 Y127.573 E-.02479
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 103/350
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
G3 Z20.8 I-.937 J.777 P1  F30000
G1 X129.911 Y128.493 Z20.8
G1 Z20.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.206 Y127.153 I-.688 J-.494 E.11428
G1 X129.272 Y127.154 E.0022
G3 X129.944 Y128.444 I-.049 J.845 E.05801
G1 X130.239 Y128.711 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.228 Y128.721 E.00047
G3 X129.195 Y126.761 I-1.007 J-.722 E.15493
G1 X129.292 Y126.762 E.003
G3 X130.347 Y128.517 I-.072 J1.237 E.07401
G1 X130.268 Y128.659 E.00498
M204 S10000
G1 X129.663 Y127.936 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.562 Y127.701 E.00788
G1 X129.337 Y127.575 E.00793
G1 X129.083 Y127.573 E.00781
G1 X128.873 Y127.734 E.00812
G1 X128.775 Y127.978 E.00807
G1 X128.844 Y128.226 E.00792
G1 X129.019 Y128.4 E.00759
G1 X129.279 Y128.438 E.00809
G1 X129.526 Y128.335 E.0082
G1 X129.655 Y128.103 E.00816
G1 X129.66 Y127.996 E.00329
; CHANGE_LAYER
; Z_HEIGHT: 20.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X129.655 Y128.103 E-.0407
G1 X129.526 Y128.335 E-.1009
G1 X129.279 Y128.438 E-.10146
G1 X129.019 Y128.4 E-.10009
G1 X128.844 Y128.226 E-.09383
G1 X128.775 Y127.978 E-.09799
G1 X128.873 Y127.734 E-.09979
G1 X129.083 Y127.573 E-.10045
G1 X129.148 Y127.573 E-.0248
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 104/350
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
G3 Z21 I-.937 J.777 P1  F30000
G1 X129.911 Y128.493 Z21
G1 Z20.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.206 Y127.153 I-.688 J-.494 E.11429
G1 X129.272 Y127.154 E.00219
G3 X129.944 Y128.443 I-.049 J.845 E.05801
G1 X130.239 Y128.711 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.228 Y128.721 E.00045
G3 X129.195 Y126.761 I-1.007 J-.722 E.15494
G1 X129.292 Y126.762 E.00299
G3 X130.347 Y128.517 I-.071 J1.237 E.07401
G1 X130.268 Y128.659 E.00499
M204 S10000
G1 X129.663 Y127.936 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.562 Y127.701 E.00788
G1 X129.337 Y127.575 E.00794
G1 X129.083 Y127.573 E.00781
G1 X128.873 Y127.734 E.00812
G1 X128.775 Y127.978 E.00807
G1 X128.844 Y128.226 E.00793
G1 X129.019 Y128.4 E.00758
G1 X129.279 Y128.438 E.00809
G1 X129.526 Y128.335 E.0082
G1 X129.655 Y128.103 E.00816
G1 X129.66 Y127.996 E.00329
; CHANGE_LAYER
; Z_HEIGHT: 21
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.655 Y128.103 E-.04067
G1 X129.526 Y128.335 E-.10093
G1 X129.279 Y128.438 E-.10145
G1 X129.019 Y128.4 E-.1001
G1 X128.844 Y128.226 E-.09378
G1 X128.775 Y127.978 E-.09803
G1 X128.873 Y127.734 E-.09979
G1 X129.083 Y127.573 E-.10047
G1 X129.148 Y127.573 E-.02479
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 105/350
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
G3 Z21.2 I-.936 J.777 P1  F30000
G1 X129.911 Y128.493 Z21.2
G1 Z21
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.206 Y127.153 I-.688 J-.494 E.1143
G1 X129.272 Y127.154 E.00218
G3 X129.945 Y128.443 I-.048 J.845 E.05801
G1 X130.238 Y128.712 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.228 Y128.721 E.00042
G3 X129.195 Y126.761 I-1.007 J-.722 E.15495
G1 X129.292 Y126.762 E.00299
G3 X130.347 Y128.516 I-.071 J1.237 E.07401
G1 X130.267 Y128.66 E.00503
M204 S10000
G1 X129.663 Y127.936 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.562 Y127.701 E.00787
G1 X129.336 Y127.575 E.00795
G1 X129.083 Y127.573 E.0078
G1 X128.873 Y127.734 E.00812
G1 X128.775 Y127.978 E.00807
G1 X128.844 Y128.226 E.00793
G1 X129.019 Y128.4 E.00758
G1 X129.279 Y128.438 E.00809
G1 X129.526 Y128.335 E.0082
G1 X129.655 Y128.103 E.00816
G1 X129.66 Y127.996 E.00329
; CHANGE_LAYER
; Z_HEIGHT: 21.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.655 Y128.103 E-.04064
G1 X129.526 Y128.335 E-.10097
G1 X129.279 Y128.438 E-.10144
G1 X129.019 Y128.4 E-.10011
G1 X128.844 Y128.226 E-.09374
G1 X128.775 Y127.978 E-.09806
G1 X128.873 Y127.734 E-.09978
G1 X129.083 Y127.573 E-.10047
G1 X129.148 Y127.573 E-.02479
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 106/350
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
G3 Z21.4 I-.936 J.777 P1  F30000
G1 X129.911 Y128.493 Z21.4
G1 Z21.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.206 Y127.153 I-.688 J-.494 E.11431
G1 X129.271 Y127.154 E.00217
G3 X129.945 Y128.443 I-.048 J.845 E.05801
G1 X130.238 Y128.713 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.228 Y128.721 E.00037
G3 X129.195 Y126.761 I-1.007 J-.721 E.15496
G1 X129.292 Y126.762 E.00298
G3 X130.347 Y128.516 I-.071 J1.237 E.07401
G1 X130.267 Y128.661 E.00508
M204 S10000
G1 X129.663 Y127.937 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.562 Y127.7 E.00789
G1 X129.336 Y127.575 E.00794
G1 X129.083 Y127.573 E.0078
G1 X128.873 Y127.734 E.00812
G1 X128.775 Y127.978 E.00807
G1 X128.844 Y128.226 E.00793
G1 X129.019 Y128.4 E.00758
G1 X129.279 Y128.438 E.0081
G1 X129.526 Y128.335 E.0082
G1 X129.655 Y128.103 E.00817
G1 X129.66 Y127.996 E.00328
; CHANGE_LAYER
; Z_HEIGHT: 21.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X129.655 Y128.103 E-.04056
G1 X129.526 Y128.335 E-.10099
G1 X129.279 Y128.438 E-.10144
G1 X129.019 Y128.4 E-.10011
G1 X128.844 Y128.226 E-.0937
G1 X128.775 Y127.978 E-.0981
G1 X128.873 Y127.734 E-.09978
G1 X129.083 Y127.573 E-.10048
G1 X129.148 Y127.573 E-.02485
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 107/350
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
G3 Z21.6 I-.936 J.777 P1  F30000
G1 X129.911 Y128.493 Z21.6
G1 Z21.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.206 Y127.153 I-.688 J-.493 E.11432
G1 X129.271 Y127.154 E.00217
G3 X129.945 Y128.443 I-.048 J.845 E.05801
G1 X130.237 Y128.715 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.228 Y128.72 E.0003
G3 X129.195 Y126.761 I-1.008 J-.721 E.15498
G1 X129.291 Y126.762 E.00297
G3 X130.347 Y128.516 I-.071 J1.237 E.07401
G1 X130.266 Y128.663 E.00515
M204 S10000
G1 X129.663 Y127.937 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.562 Y127.701 E.00788
G1 X129.336 Y127.574 E.00795
G1 X129.083 Y127.573 E.00779
G1 X128.873 Y127.734 E.00813
G1 X128.775 Y127.978 E.00807
G1 X128.844 Y128.227 E.00793
G1 X129.019 Y128.4 E.00757
G1 X129.279 Y128.438 E.0081
G1 X129.526 Y128.335 E.0082
G1 X129.655 Y128.103 E.00817
G1 X129.66 Y127.996 E.00328
; CHANGE_LAYER
; Z_HEIGHT: 21.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.655 Y128.103 E-.04053
G1 X129.526 Y128.335 E-.10103
G1 X129.279 Y128.438 E-.10143
G1 X129.019 Y128.4 E-.10012
G1 X128.844 Y128.227 E-.09365
G1 X128.775 Y127.978 E-.09813
G1 X128.873 Y127.734 E-.09978
G1 X129.083 Y127.573 E-.10049
G1 X129.148 Y127.573 E-.02485
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 108/350
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
G3 Z21.8 I-.936 J.777 P1  F30000
G1 X129.912 Y128.493 Z21.8
G1 Z21.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.206 Y127.153 I-.688 J-.493 E.11433
G1 X129.271 Y127.154 E.00216
G3 X129.945 Y128.443 I-.048 J.845 E.05801
G1 X130.235 Y128.717 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.229 Y128.72 E.00023
G3 X129.195 Y126.761 I-1.008 J-.721 E.15499
G1 X129.291 Y126.762 E.00296
G3 X130.347 Y128.516 I-.07 J1.237 E.07401
G1 X130.265 Y128.665 E.00522
M204 S10000
G1 X129.663 Y127.937 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.562 Y127.701 E.00787
G1 X129.336 Y127.574 E.00796
G1 X129.083 Y127.573 E.00779
G1 X128.873 Y127.734 E.00813
G1 X128.775 Y127.978 E.00807
G1 X128.844 Y128.227 E.00794
G1 X129.019 Y128.4 E.00757
G1 X129.279 Y128.438 E.0081
G1 X129.526 Y128.335 E.0082
G1 X129.655 Y128.103 E.00817
G1 X129.66 Y127.996 E.00328
; CHANGE_LAYER
; Z_HEIGHT: 21.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X129.655 Y128.103 E-.04052
G1 X129.526 Y128.335 E-.10105
G1 X129.279 Y128.438 E-.10143
G1 X129.019 Y128.4 E-.10012
G1 X128.844 Y128.227 E-.09361
G1 X128.775 Y127.978 E-.09816
G1 X128.873 Y127.734 E-.09978
G1 X129.083 Y127.573 E-.1005
G1 X129.148 Y127.573 E-.02483
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 109/350
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
G3 Z22 I-.936 J.778 P1  F30000
G1 X129.912 Y128.492 Z22
G1 Z21.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.206 Y127.153 I-.688 J-.493 E.11434
G1 X129.271 Y127.154 E.00215
G3 X129.945 Y128.442 I-.048 J.845 E.05801
G1 X130.234 Y128.719 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.229 Y128.72 E.00017
G3 X129.195 Y126.761 I-1.008 J-.721 E.155
G1 X129.291 Y126.762 E.00295
G3 X130.347 Y128.516 I-.07 J1.237 E.07401
G1 X130.263 Y128.667 E.00532
M204 S10000
G1 X129.662 Y127.931 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.562 Y127.701 E.00771
G1 X129.439 Y127.606 E.00478
M73 P69 R3
G1 X129.161 Y127.556 E.0087
G1 X128.932 Y127.67 E.00785
G1 X128.792 Y127.881 E.00778
G1 X128.801 Y128.145 E.0081
G1 X128.954 Y128.348 E.00782
G1 X129.191 Y128.449 E.00793
G1 X129.448 Y128.38 E.00817
G1 X129.635 Y128.187 E.00826
G1 X129.656 Y127.991 E.00605
G1 X129.259 Y127.955 F30000
; LINE_WIDTH: 0.530712
G1 F1200
G2 X129.26 Y128.059 I-.025 J.052 E.0093
; CHANGE_LAYER
; Z_HEIGHT: 22
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.198 Y128.06 E-.19115
G1 X129.168 Y128.008 E-.18962
G1 X129.198 Y127.955 E-.18962
G1 X129.259 Y127.955 E-.18962
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 110/350
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
G3 Z22.2 I-.774 J.939 P1  F30000
G1 X129.912 Y128.492 Z22.2
G1 Z22
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.206 Y127.153 I-.689 J-.493 E.11435
G1 X129.271 Y127.154 E.00214
G3 X129.945 Y128.442 I-.047 J.845 E.05801
G1 X130.229 Y128.72 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.195 Y126.761 I-1.008 J-.72 E.15501
G1 X129.291 Y126.762 E.00294
G3 X130.263 Y128.67 I-.07 J1.237 E.07943
M204 S10000
G1 X129.662 Y127.931 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.563 Y127.701 E.00771
G1 X129.439 Y127.606 E.00479
G1 X129.161 Y127.556 E.0087
G1 X128.932 Y127.67 E.00785
G1 X128.792 Y127.881 E.00778
G1 X128.801 Y128.145 E.0081
G1 X128.954 Y128.348 E.00782
G1 X129.191 Y128.449 E.00793
G1 X129.448 Y128.38 E.00817
G1 X129.635 Y128.187 E.00826
G1 X129.656 Y127.991 E.00605
G1 X129.259 Y127.955 F30000
; LINE_WIDTH: 0.530716
G1 F1200
G2 X129.26 Y128.059 I-.025 J.052 E.0093
; CHANGE_LAYER
; Z_HEIGHT: 22.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.198 Y128.06 E-.19115
G1 X129.168 Y128.008 E-.18962
G1 X129.198 Y127.955 E-.18962
G1 X129.259 Y127.955 E-.18962
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 111/350
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
G3 Z22.4 I-.774 J.939 P1  F30000
G1 X129.912 Y128.492 Z22.4
G1 Z22.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.206 Y127.153 I-.689 J-.493 E.11435
G1 X129.27 Y127.154 E.00213
G3 X129.945 Y128.442 I-.047 J.845 E.05801
G1 X130.23 Y128.725 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.087 Y128.886 E.00664
G3 X129.195 Y126.761 I-.866 J-.886 E.14828
G1 X129.29 Y126.762 E.00293
G3 X130.26 Y128.674 I-.07 J1.237 E.0796
M204 S10000
G1 X129.663 Y127.937 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.563 Y127.701 E.00785
G1 X129.336 Y127.574 E.00799
G1 X129.083 Y127.573 E.00778
G1 X128.873 Y127.734 E.00813
G1 X128.775 Y127.978 E.00807
G1 X128.848 Y128.23 E.00808
G1 X129.043 Y128.413 E.00819
G1 X129.279 Y128.438 E.0073
G1 X129.526 Y128.335 E.00821
G1 X129.655 Y128.103 E.00818
G1 X129.66 Y127.996 E.00327
G1 X129.256 Y127.946 F30000
; LINE_WIDTH: 0.546804
G1 F1200
G2 X129.258 Y128.053 I-.026 J.054 E.00999
; CHANGE_LAYER
; Z_HEIGHT: 22.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X129.193 Y128.055 E-.19347
G1 X129.162 Y128.001 E-.18884
G1 X129.193 Y127.946 E-.18884
G1 X129.256 Y127.946 E-.18884
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 112/350
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
G3 Z22.6 I-.778 J.935 P1  F30000
G1 X129.912 Y128.492 Z22.6
G1 Z22.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.206 Y127.153 I-.689 J-.492 E.11436
G1 X129.27 Y127.154 E.00212
G3 X129.945 Y128.442 I-.047 J.845 E.05801
G1 X130.228 Y128.727 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.087 Y128.886 E.00653
G3 X129.195 Y126.761 I-.866 J-.886 E.14828
G1 X129.29 Y126.762 E.00292
G3 X130.258 Y128.676 I-.069 J1.237 E.07968
M204 S10000
G1 X129.663 Y127.936 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.563 Y127.702 E.00785
G1 X129.336 Y127.574 E.008
G1 X129.083 Y127.573 E.00777
G1 X128.873 Y127.734 E.00813
G1 X128.775 Y127.978 E.00807
G1 X128.844 Y128.227 E.00795
G1 X129.019 Y128.4 E.00756
G1 X129.279 Y128.438 E.0081
G1 X129.526 Y128.335 E.0082
G1 X129.655 Y128.103 E.00818
G1 X129.66 Y127.996 E.00327
; CHANGE_LAYER
; Z_HEIGHT: 22.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.655 Y128.103 E-.04043
G1 X129.526 Y128.335 E-.10118
G1 X129.279 Y128.438 E-.10141
G1 X129.019 Y128.4 E-.10014
G1 X128.844 Y128.227 E-.09344
G1 X128.775 Y127.978 E-.0983
G1 X128.873 Y127.734 E-.09977
G1 X129.083 Y127.573 E-.10053
G1 X129.148 Y127.573 E-.02481
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 113/350
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
G3 Z22.8 I-.936 J.778 P1  F30000
G1 X129.912 Y128.492 Z22.8
G1 Z22.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.206 Y127.153 I-.689 J-.492 E.11437
G1 X129.27 Y127.154 E.00211
G3 X129.945 Y128.442 I-.047 J.845 E.058
G1 X130.226 Y128.73 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.087 Y128.886 E.00642
G3 X129.195 Y126.761 I-.866 J-.886 E.14829
G1 X129.29 Y126.762 E.00292
G3 X130.257 Y128.679 I-.069 J1.237 E.07979
M204 S10000
G1 X129.662 Y127.931 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.563 Y127.702 E.00768
G1 X129.439 Y127.606 E.00481
G1 X129.161 Y127.556 E.0087
G1 X128.932 Y127.67 E.00785
G1 X128.792 Y127.881 E.00778
G1 X128.801 Y128.145 E.0081
G1 X128.954 Y128.348 E.00782
G1 X129.191 Y128.449 E.00793
G1 X129.448 Y128.38 E.00817
G1 X129.635 Y128.187 E.00827
G1 X129.656 Y127.991 E.00605
G1 X129.259 Y127.955 F30000
; LINE_WIDTH: 0.53072
G1 F1200
G2 X129.26 Y128.059 I-.025 J.052 E.0093
; CHANGE_LAYER
; Z_HEIGHT: 22.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X129.198 Y128.06 E-.19115
G1 X129.168 Y128.008 E-.18962
G1 X129.198 Y127.955 E-.18962
G1 X129.259 Y127.955 E-.18961
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 114/350
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
G3 Z23 I-.773 J.94 P1  F30000
G1 X129.912 Y128.492 Z23
G1 Z22.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.206 Y127.153 I-.689 J-.492 E.11438
G1 X129.27 Y127.154 E.0021
G3 X129.945 Y128.441 I-.046 J.845 E.058
G1 X130.223 Y128.733 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.086 Y128.886 E.0063
G3 X129.195 Y126.761 I-.866 J-.886 E.14829
G1 X129.289 Y126.762 E.00291
G3 X130.255 Y128.682 I-.069 J1.237 E.0799
M204 S10000
G1 X129.662 Y127.931 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.563 Y127.702 E.00768
G1 X129.439 Y127.606 E.00482
G1 X129.161 Y127.556 E.0087
G1 X128.932 Y127.67 E.00785
G1 X128.792 Y127.881 E.00778
G1 X128.801 Y128.145 E.0081
G1 X128.954 Y128.348 E.00782
G1 X129.191 Y128.449 E.00793
G1 X129.448 Y128.38 E.00817
G1 X129.635 Y128.187 E.00827
G1 X129.656 Y127.991 E.00604
G1 X129.259 Y127.955 F30000
; LINE_WIDTH: 0.530724
G1 F1200
G2 X129.26 Y128.059 I-.025 J.052 E.0093
; CHANGE_LAYER
; Z_HEIGHT: 23
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.198 Y128.06 E-.19115
G1 X129.168 Y128.008 E-.18962
G1 X129.198 Y127.955 E-.18962
G1 X129.259 Y127.955 E-.18961
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 115/350
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
G3 Z23.2 I-.773 J.94 P1  F30000
G1 X129.912 Y128.491 Z23.2
G1 Z23
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.206 Y127.153 I-.689 J-.492 E.11439
G1 X129.269 Y127.154 E.0021
G3 X129.945 Y128.441 I-.046 J.845 E.058
G1 X130.221 Y128.736 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.086 Y128.886 E.00618
G3 X129.195 Y126.761 I-.866 J-.886 E.14829
G1 X129.289 Y126.762 E.0029
G3 X130.253 Y128.685 I-.069 J1.237 E.08002
M204 S10000
G1 X129.663 Y127.936 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.563 Y127.702 E.00782
G1 X129.335 Y127.574 E.00803
G1 X129.083 Y127.573 E.00776
G1 X128.873 Y127.734 E.00813
G1 X128.775 Y127.978 E.00807
G1 X128.844 Y128.227 E.00796
G1 X129.018 Y128.4 E.00754
G1 X129.279 Y128.438 E.0081
G1 X129.526 Y128.335 E.0082
G1 X129.655 Y128.103 E.00819
G1 X129.66 Y127.996 E.00326
; CHANGE_LAYER
; Z_HEIGHT: 23.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.655 Y128.103 E-.04037
G1 X129.526 Y128.335 E-.10127
G1 X129.279 Y128.438 E-.10139
G1 X129.018 Y128.4 E-.10016
G1 X128.844 Y128.227 E-.0933
G1 X128.775 Y127.978 E-.09841
G1 X128.873 Y127.734 E-.09977
G1 X129.083 Y127.573 E-.10055
G1 X129.148 Y127.573 E-.02478
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 116/350
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
G3 Z23.4 I-.935 J.779 P1  F30000
M73 P70 R3
G1 X129.912 Y128.491 Z23.4
G1 Z23.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.206 Y127.153 I-.689 J-.492 E.1144
G1 X129.269 Y127.154 E.00209
G3 X129.945 Y128.441 I-.046 J.846 E.058
G1 X130.218 Y128.739 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.086 Y128.886 E.00607
G3 X129.195 Y126.761 I-.866 J-.886 E.14829
G1 X129.289 Y126.762 E.00289
G3 X130.251 Y128.688 I-.068 J1.237 E.08014
M204 S10000
G1 X129.663 Y127.936 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.564 Y127.702 E.00781
G1 X129.335 Y127.574 E.00804
G1 X129.083 Y127.573 E.00776
G1 X128.873 Y127.734 E.00813
G1 X128.775 Y127.978 E.00807
G1 X128.845 Y128.227 E.00796
G1 X129.018 Y128.4 E.00754
G1 X129.279 Y128.438 E.0081
G1 X129.526 Y128.335 E.0082
G1 X129.656 Y128.102 E.00819
G1 X129.66 Y127.996 E.00326
; CHANGE_LAYER
; Z_HEIGHT: 23.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X129.656 Y128.102 E-.04037
G1 X129.526 Y128.335 E-.1013
G1 X129.279 Y128.438 E-.10139
G1 X129.018 Y128.4 E-.10016
G1 X128.845 Y128.227 E-.09327
G1 X128.775 Y127.978 E-.09844
G1 X128.873 Y127.734 E-.09976
G1 X129.083 Y127.573 E-.10056
G1 X129.148 Y127.573 E-.02475
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 117/350
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
G3 Z23.6 I-.935 J.779 P1  F30000
G1 X129.912 Y128.491 Z23.6
G1 Z23.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.206 Y127.153 I-.689 J-.492 E.11441
G1 X129.269 Y127.154 E.00208
G3 X129.946 Y128.441 I-.046 J.846 E.058
G1 X130.216 Y128.741 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.086 Y128.886 E.00596
G3 X129.195 Y126.761 I-.866 J-.886 E.14829
G1 X129.289 Y126.762 E.00288
G3 X130.249 Y128.691 I-.068 J1.237 E.08026
M204 S10000
G1 X129.663 Y127.936 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.564 Y127.702 E.00781
G1 X129.335 Y127.574 E.00805
G1 X129.083 Y127.573 E.00775
G1 X128.873 Y127.734 E.00813
G1 X128.775 Y127.978 E.00807
G1 X128.845 Y128.227 E.00796
G1 X129.018 Y128.4 E.00754
G1 X129.279 Y128.438 E.0081
G1 X129.526 Y128.335 E.0082
G1 X129.656 Y128.102 E.00819
G1 X129.66 Y127.996 E.00326
; CHANGE_LAYER
; Z_HEIGHT: 23.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.656 Y128.102 E-.04036
G1 X129.526 Y128.335 E-.10133
G1 X129.279 Y128.438 E-.10138
G1 X129.018 Y128.4 E-.10017
G1 X128.845 Y128.227 E-.09322
G1 X128.775 Y127.978 E-.09848
G1 X128.873 Y127.734 E-.09976
G1 X129.083 Y127.573 E-.10057
G1 X129.148 Y127.573 E-.02474
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 118/350
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
G3 Z23.8 I-.935 J.779 P1  F30000
G1 X129.913 Y128.491 Z23.8
G1 Z23.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.206 Y127.153 I-.69 J-.491 E.11442
G1 X129.269 Y127.154 E.00207
G3 X129.946 Y128.441 I-.046 J.846 E.058
G1 X130.214 Y128.744 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.086 Y128.886 E.00585
G3 X129.195 Y126.761 I-.866 J-.886 E.14829
G1 X129.288 Y126.762 E.00287
G3 X130.247 Y128.694 I-.068 J1.237 E.08037
M204 S10000
G1 X129.663 Y127.936 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.564 Y127.703 E.0078
G1 X129.336 Y127.575 E.00802
G1 X129.083 Y127.573 E.00779
G1 X128.873 Y127.734 E.00813
G1 X128.775 Y127.978 E.00807
G1 X128.845 Y128.227 E.00797
G1 X129.018 Y128.4 E.00753
G1 X129.279 Y128.438 E.0081
G1 X129.526 Y128.335 E.0082
G1 X129.656 Y128.102 E.0082
G1 X129.66 Y127.996 E.00326
; CHANGE_LAYER
; Z_HEIGHT: 23.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X129.656 Y128.102 E-.04035
G1 X129.526 Y128.335 E-.10136
G1 X129.279 Y128.438 E-.10138
G1 X129.018 Y128.4 E-.10018
G1 X128.845 Y128.227 E-.09317
G1 X128.775 Y127.978 E-.09851
G1 X128.873 Y127.734 E-.09976
G1 X129.083 Y127.573 E-.10058
G1 X129.148 Y127.573 E-.02472
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 119/350
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
G3 Z24 I-.935 J.779 P1  F30000
G1 X129.913 Y128.491 Z24
G1 Z23.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.206 Y127.153 I-.69 J-.491 E.11443
G1 X129.268 Y127.154 E.00206
G3 X129.946 Y128.441 I-.045 J.846 E.058
G1 X130.211 Y128.747 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.086 Y128.886 E.00575
G3 X129.195 Y126.761 I-.866 J-.886 E.1483
G1 X129.288 Y126.762 E.00286
G3 X130.245 Y128.697 I-.068 J1.237 E.08048
M204 S10000
G1 X129.663 Y127.936 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.564 Y127.703 E.00779
G1 X129.336 Y127.575 E.00803
G1 X129.083 Y127.573 E.00778
G1 X128.873 Y127.734 E.00813
G1 X128.775 Y127.978 E.00807
G1 X128.845 Y128.227 E.00797
G1 X129.018 Y128.4 E.00753
G1 X129.279 Y128.438 E.0081
G1 X129.526 Y128.335 E.0082
G1 X129.656 Y128.102 E.0082
G1 X129.66 Y127.996 E.00326
; CHANGE_LAYER
; Z_HEIGHT: 24
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.656 Y128.102 E-.04033
G1 X129.526 Y128.335 E-.10139
G1 X129.279 Y128.438 E-.10137
G1 X129.018 Y128.4 E-.10019
G1 X128.845 Y128.227 E-.09313
G1 X128.775 Y127.978 E-.09854
G1 X128.873 Y127.734 E-.09975
G1 X129.083 Y127.573 E-.10058
G1 X129.148 Y127.573 E-.02471
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 120/350
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
G3 Z24.2 I-.936 J.777 P1  F30000
G1 X129.913 Y128.494 Z24.2
G1 Z24
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.811 Y128.608 E.00506
G3 X129.206 Y127.153 I-.588 J-.609 E.10928
G1 X129.268 Y127.154 E.00205
G3 X129.944 Y128.444 I-.045 J.846 E.05813
G1 X130.209 Y128.749 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.086 Y128.886 E.00566
G3 X129.195 Y126.761 I-.866 J-.886 E.1483
G1 X129.288 Y126.762 E.00285
G3 X130.243 Y128.699 I-.067 J1.237 E.08058
M204 S10000
G1 X129.663 Y127.936 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.564 Y127.703 E.00778
G1 X129.336 Y127.575 E.00804
G1 X129.083 Y127.573 E.00778
G1 X128.873 Y127.734 E.00813
G1 X128.775 Y127.978 E.00807
G1 X128.845 Y128.227 E.00797
G1 X129.018 Y128.4 E.00753
G1 X129.279 Y128.438 E.0081
G1 X129.526 Y128.335 E.0082
G1 X129.656 Y128.102 E.0082
G1 X129.66 Y127.996 E.00326
; CHANGE_LAYER
; Z_HEIGHT: 24.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.656 Y128.102 E-.04033
G1 X129.526 Y128.335 E-.10142
G1 X129.279 Y128.438 E-.10136
G1 X129.018 Y128.4 E-.10019
G1 X128.845 Y128.227 E-.09309
G1 X128.775 Y127.978 E-.09858
G1 X128.873 Y127.734 E-.09975
G1 X129.083 Y127.573 E-.1006
G1 X129.148 Y127.573 E-.02468
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 121/350
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
G3 Z24.4 I-.938 J.775 P1  F30000
G1 X129.911 Y128.496 Z24.4
G1 Z24.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.811 Y128.608 E.00497
G3 X129.206 Y127.153 I-.588 J-.609 E.10928
G1 X129.268 Y127.154 E.00204
G3 X129.943 Y128.446 I-.045 J.846 E.05821
G1 X130.208 Y128.751 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.086 Y128.886 E.00557
G3 X129.195 Y126.761 I-.866 J-.886 E.1483
G1 X129.288 Y126.762 E.00285
G3 X130.241 Y128.701 I-.067 J1.237 E.08067
M204 S10000
G1 X129.663 Y127.936 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.564 Y127.703 E.00778
G1 X129.336 Y127.575 E.00805
G1 X129.083 Y127.572 E.00778
G1 X128.873 Y127.734 E.00813
G1 X128.775 Y127.978 E.00807
G1 X128.845 Y128.228 E.00797
G1 X129.018 Y128.4 E.00752
G1 X129.279 Y128.438 E.0081
G1 X129.526 Y128.335 E.0082
G1 X129.656 Y128.102 E.0082
G1 X129.66 Y127.996 E.00326
; CHANGE_LAYER
; Z_HEIGHT: 24.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X129.656 Y128.102 E-.04032
G1 X129.526 Y128.335 E-.10146
G1 X129.279 Y128.438 E-.10135
G1 X129.018 Y128.4 E-.1002
G1 X128.845 Y128.228 E-.09304
G1 X128.775 Y127.978 E-.09861
G1 X128.873 Y127.734 E-.09975
G1 X129.083 Y127.572 E-.1006
G1 X129.148 Y127.573 E-.02467
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 122/350
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
G3 Z24.6 I-.939 J.774 P1  F30000
G1 X129.909 Y128.498 Z24.6
G1 Z24.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.811 Y128.608 E.0049
G3 X129.206 Y127.153 I-.588 J-.609 E.10928
G1 X129.268 Y127.154 E.00203
G3 X129.941 Y128.447 I-.045 J.846 E.05829
G1 X130.206 Y128.753 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.086 Y128.886 E.0055
G3 X129.195 Y126.761 I-.866 J-.886 E.1483
G1 X129.287 Y126.762 E.00284
G3 X130.24 Y128.703 I-.067 J1.237 E.08075
M204 S10000
G1 X129.662 Y127.931 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.564 Y127.703 E.00762
G1 X129.439 Y127.606 E.00488
G1 X129.161 Y127.556 E.00869
G1 X128.932 Y127.67 E.00786
G1 X128.792 Y127.881 E.00778
G1 X128.801 Y128.145 E.0081
G1 X128.954 Y128.348 E.00782
G1 X129.191 Y128.449 E.00793
G1 X129.448 Y128.38 E.00816
M73 P71 R3
G1 X129.635 Y128.186 E.00829
G1 X129.656 Y127.991 E.00603
G1 X129.259 Y127.955 F30000
; LINE_WIDTH: 0.530736
G1 F1200
G2 X129.26 Y128.059 I-.025 J.053 E.0093
; CHANGE_LAYER
; Z_HEIGHT: 24.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.198 Y128.06 E-.19115
G1 X129.168 Y128.007 E-.18962
G1 X129.198 Y127.955 E-.18962
G1 X129.259 Y127.955 E-.18961
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 123/350
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
G3 Z24.8 I-.783 J.932 P1  F30000
G1 X129.908 Y128.5 Z24.8
G1 Z24.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.811 Y128.608 E.00483
G3 X129.206 Y127.153 I-.588 J-.609 E.10928
G1 X129.267 Y127.154 E.00203
G3 X129.94 Y128.449 I-.045 J.846 E.05836
G1 X130.205 Y128.754 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.086 Y128.886 E.00544
G3 X129.195 Y126.761 I-.866 J-.886 E.1483
G1 X129.287 Y126.762 E.00283
G3 X130.239 Y128.705 I-.067 J1.237 E.08081
M204 S10000
G1 X129.663 Y127.936 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.565 Y127.704 E.00776
G1 X129.336 Y127.575 E.00805
G1 X129.083 Y127.572 E.00779
G1 X128.873 Y127.734 E.00814
G1 X128.775 Y127.978 E.00807
G1 X128.845 Y128.228 E.00798
G1 X129.018 Y128.4 E.00752
G1 X129.279 Y128.438 E.0081
G1 X129.526 Y128.335 E.00819
G1 X129.656 Y128.102 E.00821
G1 X129.66 Y127.996 E.00326
; CHANGE_LAYER
; Z_HEIGHT: 24.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X129.656 Y128.102 E-.0403
G1 X129.526 Y128.335 E-.10151
G1 X129.279 Y128.438 E-.10135
G1 X129.018 Y128.4 E-.10021
G1 X128.845 Y128.228 E-.09296
G1 X128.775 Y127.978 E-.09868
G1 X128.873 Y127.734 E-.09975
G1 X129.083 Y127.572 E-.10061
G1 X129.148 Y127.573 E-.02464
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 124/350
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
G3 Z25 I-.942 J.771 P1  F30000
G1 X129.907 Y128.501 Z25
G1 Z24.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.815 Y128.601 E.00452
G3 X129.206 Y127.153 I-.592 J-.603 E.10929
G1 X129.267 Y127.154 E.00202
G3 X129.937 Y128.45 I-.044 J.844 E.05837
G1 X130.204 Y128.755 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.085 Y128.881 E.00533
G3 X129.195 Y126.761 I-.865 J-.884 E.14805
G1 X129.287 Y126.762 E.00282
G3 X130.236 Y128.703 I-.066 J1.235 E.08076
M204 S10000
G1 X129.663 Y127.936 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.565 Y127.704 E.00775
G1 X129.336 Y127.575 E.00806
G1 X129.083 Y127.572 E.00779
G1 X128.873 Y127.734 E.00814
G1 X128.775 Y127.978 E.00807
G1 X128.849 Y128.23 E.00809
G1 X129.04 Y128.41 E.00807
G1 X129.301 Y128.435 E.00807
G1 X129.543 Y128.32 E.00821
G1 X129.655 Y128.104 E.0075
G1 X129.66 Y127.996 E.00331
; CHANGE_LAYER
; Z_HEIGHT: 25
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.655 Y128.104 E-.04091
G1 X129.543 Y128.32 E-.09269
G1 X129.301 Y128.435 E-.10151
G1 X129.04 Y128.41 E-.09982
G1 X128.849 Y128.23 E-.09984
G1 X128.775 Y127.978 E-.09999
G1 X128.873 Y127.734 E-.09975
G1 X129.083 Y127.572 E-.10063
G1 X129.148 Y127.573 E-.02486
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 125/350
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
G3 Z25.2 I-.943 J.77 P1  F30000
G1 X129.906 Y128.502 Z25.2
G1 Z25
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.815 Y128.601 E.00449
G3 X129.206 Y127.153 I-.592 J-.603 E.10929
G1 X129.267 Y127.154 E.00201
G3 X129.937 Y128.45 I-.044 J.844 E.0584
G1 X130.204 Y128.755 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.085 Y128.881 E.00531
G3 X129.195 Y126.761 I-.865 J-.884 E.14805
G1 X129.286 Y126.762 E.00281
G3 X130.235 Y128.704 I-.066 J1.235 E.08079
M204 S10000
G1 X129.663 Y127.936 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.565 Y127.704 E.00774
G1 X129.337 Y127.575 E.00805
G1 X129.083 Y127.572 E.0078
G1 X128.873 Y127.734 E.00814
G1 X128.775 Y127.978 E.00807
G1 X128.849 Y128.23 E.00809
G1 X129.04 Y128.41 E.00807
G1 X129.301 Y128.435 E.00807
G1 X129.543 Y128.32 E.00821
G1 X129.655 Y128.104 E.00749
G1 X129.66 Y127.996 E.00331
; CHANGE_LAYER
; Z_HEIGHT: 25.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.655 Y128.104 E-.04091
G1 X129.543 Y128.32 E-.09269
G1 X129.301 Y128.435 E-.10153
G1 X129.04 Y128.41 E-.09982
G1 X128.849 Y128.23 E-.09984
G1 X128.775 Y127.978 E-.09999
G1 X128.873 Y127.734 E-.09975
G1 X129.083 Y127.572 E-.10063
G1 X129.148 Y127.573 E-.02484
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 126/350
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
G3 Z25.4 I-.788 J.927 P1  F30000
G1 X130.119 Y128.398 Z25.4
G1 Z25.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X130.032 Y128.398 E.00286
G3 X129.414 Y128.826 I-1.022 J-.816 E.02532
G3 X129.787 Y127.366 I-.189 J-.826 E.115
G1 X130.032 Y127.602 E.01128
G1 X130.826 Y127.602 E.02634
M204 S5000
; FEATURE: Overhang wall
G1 F3000
G1 X131.623 Y127.602 E.02643
G1 X131.623 Y128.398 E.0264
G1 X130.826 Y128.398 E.02643
M204 S10000
; FEATURE: Inner wall
G1 F1200
G1 X130.427 Y128.398 E.01322
G1 X130.179 Y128.398 E.00826
G1 X130.2 Y128.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.19 Y128.79 E.0003
G3 X130.19 Y127.21 I-.96 J-.79 E.18746
G1 X130.672 Y127.21 E.01481
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
G1 F3000
G1 X132.015 Y127.21 E.04454
G1 X132.015 Y128.79 E.05241
G1 X130.672 Y128.79 E.04454
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.26 Y128.79 E.01266
M204 S10000
G1 X130.347 Y128 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431836
G1 F1200
G1 X130.277 Y127.951 E.00268
; LINE_WIDTH: 0.391142
G1 X130.208 Y127.903 E.0024
; LINE_WIDTH: 0.350447
G1 X130.139 Y127.854 E.00212
; LINE_WIDTH: 0.309753
G1 X130.069 Y127.805 E.00184
G1 X130.347 Y128 F30000
; LINE_WIDTH: 0.431768
G1 F1200
G1 X131.419 Y128 E.03399
; WIPE_START
G1 F24000
G1 X130.347 Y128 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z25.6 I-.343 J-1.168 P1  F30000
G1 X129.65 Y128.204 Z25.6
G1 Z25.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.512 Y128.016 E.00717
G3 X129.622 Y127.761 I.359 J.003 E.00877
G1 X129.41 Y127.6 E.00817
G1 X129.173 Y127.559 E.00739
G1 X128.948 Y127.645 E.00741
G1 X128.802 Y127.875 E.00838
G1 X128.789 Y128.115 E.00737
G1 X128.951 Y128.352 E.00883
G1 X129.161 Y128.444 E.00704
G1 X129.409 Y128.407 E.0077
G1 X129.604 Y128.243 E.00785
G1 X129.167 Y127.965 F30000
; LINE_WIDTH: 0.39403
G1 F1200
G1 X129.101 Y128.003 E.00217
G1 X129.153 Y128.033 E.00171
; CHANGE_LAYER
; Z_HEIGHT: 25.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X129.101 Y128.003 E-.33495
G1 X129.167 Y127.965 E-.42505
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 127/350
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
G3 Z25.6 I-.503 J1.108 P1  F30000
G1 X130.12 Y128.398 Z25.6
G1 Z25.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X130.032 Y128.398 E.00289
G3 X129.414 Y128.826 I-1.022 J-.816 E.02532
G3 X129.266 Y127.154 I-.187 J-.826 E.09583
G3 X129.787 Y127.366 I-.049 J.864 E.01899
G1 X130.032 Y127.602 E.01129
G1 X131.623 Y127.602 E.05276
G1 X131.623 Y128.398 E.0264
G1 X130.18 Y128.398 E.04788
G1 X130.201 Y128.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.19 Y128.79 E.00034
G3 X129.286 Y126.762 I-.96 J-.788 E.15528
G3 X130.19 Y127.21 I-.106 J1.351 E.03178
G1 X132.015 Y127.21 E.05607
G1 X132.015 Y128.79 E.04855
G1 X130.261 Y128.79 E.05388
M204 S10000
G1 X130.347 Y128 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431688
G1 F1200
G1 X130.277 Y127.951 E.00268
; LINE_WIDTH: 0.390991
G1 X130.208 Y127.903 E.0024
; LINE_WIDTH: 0.350294
G1 X130.139 Y127.854 E.00212
; LINE_WIDTH: 0.309597
G1 X130.069 Y127.806 E.00184
G1 X130.347 Y128 F30000
; LINE_WIDTH: 0.431688
G1 F1200
G1 X131.419 Y128 E.03399
G1 X129.633 Y128.147 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.523 Y127.989 E.00591
G3 X129.622 Y127.761 I.339 J.012 E.00779
G1 X129.409 Y127.6 E.0082
G1 X129.244 Y127.552 E.00527
G1 X129.027 Y127.598 E.00682
G1 X128.853 Y127.751 E.00713
G1 X128.779 Y127.951 E.00656
G1 X128.848 Y128.234 E.00893
G1 X129.09 Y128.429 E.00957
G1 X129.335 Y128.427 E.00752
G2 X129.653 Y128.202 I-.887 J-1.587 E.01198
; CHANGE_LAYER
; Z_HEIGHT: 25.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.335 Y128.427 E-.1479
G1 X129.09 Y128.429 E-.09302
G1 X128.848 Y128.234 E-.11839
G1 X128.779 Y127.951 E-.11045
G1 X128.853 Y127.751 E-.08116
G1 X129.027 Y127.598 E-.08815
G1 X129.244 Y127.552 E-.08433
G1 X129.337 Y127.579 E-.03659
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 128/350
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
G3 Z25.8 I-.88 J.841 P1  F30000
G1 X130.12 Y128.398 Z25.8
G1 Z25.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X130.032 Y128.398 E.00289
G3 X129.414 Y128.826 I-1.022 J-.816 E.02532
G3 X129.266 Y127.154 I-.187 J-.826 E.09581
G3 X129.787 Y127.366 I-.048 J.864 E.019
G1 X130.032 Y127.602 E.01129
G1 X131.623 Y127.602 E.05276
G1 X131.623 Y128.398 E.0264
G1 X130.18 Y128.398 E.04788
G1 X130.202 Y128.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.19 Y128.79 E.00036
M73 P72 R3
G3 X129.286 Y126.762 I-.96 J-.787 E.1553
G3 X130.19 Y127.21 I-.105 J1.351 E.03179
G1 X132.015 Y127.21 E.05607
G1 X132.015 Y128.79 E.04855
G1 X130.262 Y128.79 E.05386
M204 S10000
G1 X130.347 Y128 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431686
G1 F1200
G1 X130.277 Y127.951 E.00268
; LINE_WIDTH: 0.390989
G1 X130.208 Y127.903 E.0024
; LINE_WIDTH: 0.350291
G1 X130.139 Y127.854 E.00212
; LINE_WIDTH: 0.309594
G1 X130.069 Y127.806 E.00184
G1 X130.347 Y128 F30000
; LINE_WIDTH: 0.431688
G1 F1200
G1 X131.419 Y128 E.03399
G1 X129.668 Y128.201 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.514 Y128.028 E.00712
G3 X129.622 Y127.761 I.346 J-.015 E.00911
G1 X129.41 Y127.6 E.00818
G1 X129.146 Y127.563 E.00819
G1 X128.947 Y127.653 E.00669
G1 X128.8 Y127.853 E.00765
G1 X128.784 Y128.073 E.00677
G1 X128.896 Y128.302 E.00783
G1 X129.083 Y128.425 E.00688
G1 X129.278 Y128.445 E.00605
G1 X129.524 Y128.335 E.00828
G1 X129.624 Y128.242 E.00418
; CHANGE_LAYER
; Z_HEIGHT: 25.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X129.524 Y128.335 E-.05175
G1 X129.278 Y128.445 E-.10239
G1 X129.083 Y128.425 E-.07479
G1 X128.896 Y128.302 E-.08513
G1 X128.784 Y128.073 E-.09688
G1 X128.8 Y127.853 E-.08375
G1 X128.947 Y127.653 E-.09459
G1 X129.146 Y127.563 E-.08277
G1 X129.375 Y127.595 E-.08795
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 129/350
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
G3 Z26 I-.892 J.828 P1  F30000
G1 X130.12 Y128.398 Z26
G1 Z25.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X130.032 Y128.398 E.0029
G3 X129.414 Y128.826 I-1.022 J-.816 E.02532
G3 X129.266 Y127.154 I-.187 J-.826 E.0958
G3 X129.787 Y127.366 I-.048 J.864 E.01901
G1 X130.032 Y127.602 E.01129
G1 X131.623 Y127.602 E.05276
G1 X131.623 Y128.398 E.0264
G1 X130.18 Y128.398 E.04788
G1 X130.203 Y128.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.19 Y128.79 E.00038
G3 X129.285 Y126.762 I-.959 J-.788 E.1551
G3 X130.19 Y127.21 I-.105 J1.351 E.0318
G1 X132.015 Y127.21 E.05607
G1 X132.015 Y128.79 E.04855
G1 X130.263 Y128.79 E.05384
M204 S10000
G1 X130.347 Y128 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431686
G1 F1200
G1 X130.277 Y127.951 E.00268
; LINE_WIDTH: 0.390989
G1 X130.208 Y127.903 E.0024
; LINE_WIDTH: 0.350292
G1 X130.139 Y127.854 E.00212
; LINE_WIDTH: 0.309595
G1 X130.069 Y127.806 E.00184
G1 X130.347 Y128 F30000
; LINE_WIDTH: 0.431688
G1 F1200
G1 X131.419 Y128 E.03399
G1 X129.633 Y128.147 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.525 Y127.996 E.0057
G3 X129.622 Y127.761 I.331 J-.001 E.00802
G1 X129.409 Y127.6 E.0082
G1 X129.174 Y127.559 E.00732
G1 X128.915 Y127.676 E.00875
G1 X128.798 Y127.866 E.00685
G1 X128.783 Y128.079 E.00657
G1 X128.93 Y128.329 E.00889
G1 X129.161 Y128.444 E.00795
G1 X129.409 Y128.407 E.00768
G1 X129.653 Y128.202 E.00978
; CHANGE_LAYER
; Z_HEIGHT: 26
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.409 Y128.407 E-.12099
G1 X129.161 Y128.444 E-.09501
G1 X128.93 Y128.329 E-.09837
G1 X128.783 Y128.079 E-.10998
G1 X128.798 Y127.866 E-.08128
G1 X128.915 Y127.676 E-.08468
G1 X129.174 Y127.559 E-.10817
G1 X129.334 Y127.587 E-.06152
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 130/350
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
G3 Z26.2 I-.874 J.847 P1  F30000
G1 X130.12 Y128.398 Z26.2
G1 Z26
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X130.032 Y128.398 E.0029
G3 X129.414 Y128.826 I-1.022 J-.816 E.02532
G3 X129.266 Y127.154 I-.187 J-.826 E.09581
G3 X129.787 Y127.366 I-.048 J.864 E.01902
G1 X130.032 Y127.602 E.01129
G1 X131.623 Y127.602 E.05276
G1 X131.623 Y128.398 E.0264
G1 X130.18 Y128.398 E.04787
G1 X130.204 Y128.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.19 Y128.79 E.00041
G3 X129.285 Y126.762 I-.96 J-.788 E.15526
G3 X130.19 Y127.21 I-.105 J1.351 E.0318
G1 X132.015 Y127.21 E.05607
G1 X132.015 Y128.79 E.04855
G1 X130.264 Y128.79 E.05381
M204 S10000
G1 X130.347 Y128 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431688
G1 F1200
G1 X130.277 Y127.951 E.00268
; LINE_WIDTH: 0.39099
G1 X130.208 Y127.903 E.0024
; LINE_WIDTH: 0.350292
G1 X130.139 Y127.854 E.00212
; LINE_WIDTH: 0.309594
G1 X130.069 Y127.806 E.00184
G1 X130.347 Y128 F30000
; LINE_WIDTH: 0.431688
G1 F1200
G1 X131.419 Y128 E.03399
G1 X129.633 Y128.147 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.523 Y127.989 E.00591
G3 X129.622 Y127.761 I.339 J.011 E.0078
G1 X129.409 Y127.6 E.0082
G1 X129.155 Y127.557 E.00792
G2 X128.779 Y127.952 I.117 J.488 E.01771
G1 X128.853 Y128.242 E.00922
G1 X128.988 Y128.38 E.00593
G1 X129.245 Y128.448 E.00816
G2 X129.653 Y128.202 I-.151 J-.712 E.01491
; CHANGE_LAYER
; Z_HEIGHT: 26.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.456 Y128.367 E-.09751
G1 X129.245 Y128.448 E-.08607
G1 X128.988 Y128.38 E-.10095
G1 X128.853 Y128.242 E-.07334
G1 X128.779 Y127.952 E-.11396
G1 X128.853 Y127.749 E-.08198
G1 X128.96 Y127.652 E-.05466
G1 X129.155 Y127.557 E-.08257
G1 X129.334 Y127.587 E-.06896
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 131/350
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
G3 Z26.4 I-.874 J.847 P1  F30000
G1 X130.12 Y128.398 Z26.4
G1 Z26.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X130.032 Y128.398 E.00291
G3 X129.414 Y128.826 I-1.022 J-.816 E.02532
G3 X129.265 Y127.154 I-.186 J-.826 E.0957
G3 X129.787 Y127.366 I-.048 J.864 E.01903
G1 X130.032 Y127.602 E.01129
G1 X131.623 Y127.602 E.05276
G1 X131.623 Y128.398 E.0264
G1 X130.18 Y128.398 E.04787
G1 X130.205 Y128.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.19 Y128.79 E.00044
G3 X129.285 Y126.762 I-.959 J-.788 E.15515
G3 X130.19 Y127.21 I-.105 J1.35 E.03181
G1 X132.015 Y127.21 E.05607
G1 X132.015 Y128.79 E.04855
G1 X130.265 Y128.79 E.05378
M204 S10000
G1 X130.347 Y128 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431688
G1 F1200
G1 X130.277 Y127.951 E.00268
; LINE_WIDTH: 0.39099
G1 X130.208 Y127.903 E.0024
; LINE_WIDTH: 0.350292
G1 X130.139 Y127.854 E.00212
; LINE_WIDTH: 0.309594
G1 X130.069 Y127.806 E.00184
G1 X130.347 Y128 F30000
; LINE_WIDTH: 0.431688
G1 F1200
G1 X131.419 Y128 E.03399
G1 X129.668 Y128.189 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.525 Y127.996 E.00736
G3 X129.622 Y127.761 I.331 J-.001 E.00802
G1 X129.409 Y127.6 E.0082
G1 X129.152 Y127.561 E.00797
G1 X128.985 Y127.619 E.00545
G1 X128.824 Y127.809 E.00764
G1 X128.775 Y128.003 E.00616
G1 X128.861 Y128.261 E.00835
G1 X129.083 Y128.418 E.00835
G2 X129.409 Y128.407 I.141 J-.685 E.01011
G1 X129.622 Y128.227 E.00857
G1 X129.176 Y127.934 F30000
; LINE_WIDTH: 0.402552
G1 F1200
G1 X129.108 Y127.973 E.00228
G1 X129.163 Y128.004 E.00184
; CHANGE_LAYER
; Z_HEIGHT: 26.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X129.108 Y127.973 E-.33936
G1 X129.176 Y127.934 E-.42064
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 132/350
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
G3 Z26.6 I-.537 J1.092 P1  F30000
G1 X130.12 Y128.398 Z26.6
G1 Z26.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X130.032 Y128.398 E.00291
G3 X129.414 Y128.826 I-1.022 J-.816 E.02532
G3 X129.265 Y127.154 I-.187 J-.826 E.09579
G3 X129.787 Y127.366 I-.047 J.864 E.01903
G1 X130.032 Y127.602 E.01129
G1 X131.623 Y127.602 E.05276
G1 X131.623 Y128.398 E.0264
G1 X130.18 Y128.398 E.04786
G1 X130.206 Y128.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.19 Y128.79 E.00048
G3 X129.285 Y126.762 I-.96 J-.788 E.15524
G3 X130.19 Y127.21 I-.104 J1.35 E.03182
G1 X132.015 Y127.21 E.05607
G1 X132.015 Y128.79 E.04855
G1 X130.266 Y128.79 E.05375
M204 S10000
G1 X130.069 Y128.194 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.309594
G1 F1200
G1 X130.139 Y128.146 E.00184
; LINE_WIDTH: 0.350292
G1 X130.208 Y128.097 E.00212
; LINE_WIDTH: 0.39099
G1 X130.277 Y128.049 E.0024
; LINE_WIDTH: 0.431688
G1 X130.347 Y128 E.00268
G1 X131.419 Y128 E.03399
G1 X129.664 Y127.802 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.404 Y127.599 E.01014
G1 X129.146 Y127.562 E.00802
G1 X128.949 Y127.652 E.00665
G1 X128.799 Y127.854 E.00774
G1 X128.779 Y128.059 E.00632
G1 X128.897 Y128.305 E.00837
G1 X129.135 Y128.442 E.00844
G2 X129.624 Y128.242 I.012 J-.668 E.01668
G1 X129.509 Y128.015 E.00783
G1 X129.578 Y127.871 E.00489
G1 X129.618 Y127.839 E.00157
; CHANGE_LAYER
; Z_HEIGHT: 26.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.578 Y127.871 E-.01936
G1 X129.509 Y128.015 E-.06049
G1 X129.624 Y128.242 E-.09687
M73 P73 R3
G1 X129.521 Y128.337 E-.05316
G1 X129.333 Y128.423 E-.07866
G1 X129.135 Y128.442 E-.07558
G1 X128.897 Y128.305 E-.10436
G1 X128.779 Y128.059 E-.1035
G1 X128.799 Y127.854 E-.07815
G1 X128.94 Y127.664 E-.08986
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 133/350
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
G3 Z26.8 I-.642 J1.034 P1  F30000
G1 X130.12 Y128.398 Z26.8
G1 Z26.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X130.032 Y128.398 E.00292
G3 X129.414 Y128.826 I-1.022 J-.816 E.02532
G3 X129.265 Y127.154 I-.187 J-.826 E.09578
G3 X129.787 Y127.366 I-.047 J.864 E.01904
G1 X130.032 Y127.602 E.01129
G1 X131.623 Y127.602 E.05276
G1 X131.623 Y128.398 E.0264
G1 X130.18 Y128.398 E.04786
G1 X130.207 Y128.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.19 Y128.79 E.00051
G3 X129.284 Y126.762 I-.96 J-.788 E.15523
G3 X130.19 Y127.21 I-.104 J1.35 E.03183
G1 X132.015 Y127.21 E.05607
G1 X132.015 Y128.79 E.04855
G1 X130.267 Y128.79 E.05371
M204 S10000
G1 X130.347 Y128 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431686
G1 F1200
G1 X130.277 Y127.951 E.00268
; LINE_WIDTH: 0.390989
G1 X130.208 Y127.903 E.0024
; LINE_WIDTH: 0.350291
G1 X130.139 Y127.854 E.00212
; LINE_WIDTH: 0.309594
G1 X130.069 Y127.806 E.00184
G1 X130.347 Y128 F30000
; LINE_WIDTH: 0.431688
G1 F1200
G1 X131.419 Y128 E.03399
G1 X129.65 Y128.204 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.513 Y128.023 E.00698
G3 X129.622 Y127.761 I.351 J-.008 E.00897
G1 X129.41 Y127.6 E.00818
G1 X129.143 Y127.562 E.00827
G1 X128.999 Y127.609 E.00466
G1 X128.813 Y127.832 E.00891
G1 X128.777 Y128.042 E.00654
G1 X128.843 Y128.235 E.00629
G1 X129.078 Y128.416 E.00911
G2 X129.409 Y128.407 I.148 J-.66 E.01029
G1 X129.604 Y128.243 E.00785
; CHANGE_LAYER
; Z_HEIGHT: 26.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X129.409 Y128.407 E-.09704
G1 X129.24 Y128.432 E-.06494
G1 X129.078 Y128.416 E-.06193
G1 X128.843 Y128.235 E-.11263
G1 X128.777 Y128.042 E-.07778
G1 X128.813 Y127.832 E-.08091
G1 X128.999 Y127.609 E-.11022
G1 X129.143 Y127.562 E-.05763
G1 X129.396 Y127.598 E-.09691
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 134/350
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
G3 Z27 I-.902 J.817 P1  F30000
G1 X130.12 Y128.398 Z27
G1 Z26.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X130.032 Y128.398 E.00293
G3 X129.414 Y128.826 I-1.022 J-.816 E.02532
M73 P73 R2
G3 X129.265 Y127.154 I-.187 J-.826 E.09576
G3 X129.787 Y127.366 I-.047 J.864 E.01905
G1 X130.032 Y127.602 E.01129
G1 X131.623 Y127.602 E.05276
G1 X131.623 Y128.398 E.0264
G1 X130.18 Y128.398 E.04785
G1 X130.208 Y128.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.19 Y128.79 E.00055
G3 X129.284 Y126.762 I-.96 J-.788 E.15518
G3 X130.19 Y127.21 I-.104 J1.35 E.03184
G1 X132.015 Y127.21 E.05607
G1 X132.015 Y128.79 E.04855
G1 X130.268 Y128.79 E.05367
M204 S10000
G1 X130.069 Y128.194 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.309593
G1 F1200
G1 X130.139 Y128.146 E.00184
; LINE_WIDTH: 0.350291
G1 X130.208 Y128.097 E.00212
; LINE_WIDTH: 0.390989
G1 X130.277 Y128.049 E.0024
; LINE_WIDTH: 0.431686
G1 X130.347 Y128 E.00268
; LINE_WIDTH: 0.431688
G1 X131.419 Y128 E.03399
G1 X129.654 Y127.792 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.404 Y127.599 E.0097
G1 X129.147 Y127.562 E.00798
G1 X128.946 Y127.654 E.00679
G1 X128.799 Y127.855 E.00767
G1 X128.78 Y128.053 E.00611
G1 X128.887 Y128.295 E.00812
G1 X129.087 Y128.419 E.00723
G2 X129.41 Y128.407 I.136 J-.677 E.01001
G1 X129.618 Y128.234 E.00833
G1 X129.51 Y128.041 E.0068
G1 X129.562 Y127.886 E.00502
G1 X129.612 Y127.835 E.0022
; CHANGE_LAYER
; Z_HEIGHT: 27
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.562 Y127.886 E-.02722
G1 X129.51 Y128.041 E-.06204
G1 X129.618 Y128.234 E-.08411
G1 X129.41 Y128.407 E-.10302
G1 X129.239 Y128.432 E-.06562
G1 X129.087 Y128.419 E-.05791
G1 X128.887 Y128.295 E-.0894
G1 X128.78 Y128.053 E-.10047
G1 X128.799 Y127.855 E-.0755
G1 X128.946 Y127.654 E-.09471
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 135/350
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
G3 Z27.2 I-.803 J.914 P1  F30000
G1 X129.55 Y128.185 Z27.2
G1 Z27
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.284 Y128.848 E.02369
G3 X129.283 Y127.147 I-.055 J-.85 E.09238
G1 X129.576 Y127.879 E.02614
G3 X129.576 Y128.121 I-.358 J.121 E.00817
G1 X129.572 Y128.129 E.0003
G1 X130.21 Y128.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.19 Y128.79 E.0006
G3 X129.284 Y126.762 I-.959 J-.788 E.15516
G3 X130.19 Y127.21 I-.103 J1.35 E.03185
G1 X132.015 Y127.21 E.05607
G1 X132.015 Y128.79 E.04855
G1 X130.27 Y128.79 E.05363
M204 S10000
; WIPE_START
G1 F24000
G1 X130.19 Y128.79 E-.03017
G1 X129.949 Y129.007 E-.12331
G1 X129.735 Y129.13 E-.09382
G1 X129.501 Y129.209 E-.09381
G1 X129.379 Y129.23 E-.04696
G1 X129.073 Y129.231 E-.11618
G1 X128.83 Y129.175 E-.0948
G1 X128.553 Y129.042 E-.11687
G1 X128.464 Y128.967 E-.04407
; WIPE_END
G1 E-.04 F1800
G17
G3 Z27.4 I.844 J.877 P1  F30000
G1 X129.332 Y128.132 Z27.4
G1 Z27
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
G1 F1200
G1 X128.773 Y127.573 E.02426
G1 X128.606 Y127.939
G1 X129.179 Y128.512 E.02491
M204 S10000
G1 X128.879 Y128.51 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0900582
G1 F1200
G3 X128.714 Y128.342 I.429 J-.585 E.00091
; WIPE_START
G1 F24000
G1 X128.879 Y128.51 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z27.4 I.232 J1.195 P1  F30000
G1 X131.808 Y127.941 Z27.4
G1 Z27
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F1200
G1 X131.284 Y127.417 E.02276
G1 X130.75 Y127.417
G1 X131.808 Y128.475 E.04594
G1 X131.382 Y128.583
G1 X130.217 Y127.417 E.05063
G1 X129.595 Y127.328
G1 X130.849 Y128.583 E.0545
G1 X130.316 Y128.583
G1 X129.813 Y128.08 E.02185
G1 X129.674 Y128.474
G1 X129.942 Y128.742 E.01164
M204 S10000
G1 X129.724 Y128.82 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.08817
G1 F1200
G1 X129.568 Y128.686 E.00076
G1 X129.805 Y128.088 F30000
; LINE_WIDTH: 0.145881
G1 F1200
G1 X129.851 Y127.968 E.00108
G2 X129.843 Y127.914 I-.031 J-.023 E.00051
G1 X129.79 Y127.807 E.001
; CHANGE_LAYER
; Z_HEIGHT: 27.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.843 Y127.914 E-.29963
G1 X129.851 Y127.968 E-.13698
G1 X129.805 Y128.088 E-.32339
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 136/350
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
G3 Z27.4 I-1.176 J.313 P1  F30000
G1 X129.911 Y128.488 Z27.4
G1 Z27.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.207 Y127.153 I-.689 J-.49 E.11426
G1 X129.264 Y127.154 E.00191
G3 X129.944 Y128.438 I-.042 J.844 E.058
G1 X130.214 Y128.743 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.085 Y128.881 E.00581
G3 X129.195 Y126.761 I-.865 J-.884 E.14807
G1 X129.283 Y126.762 E.00271
G3 X130.244 Y128.691 I-.063 J1.235 E.08038
M204 S10000
G1 X129.664 Y127.941 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.547 Y127.686 E.00862
G1 X129.324 Y127.568 E.00775
G1 X129.083 Y127.572 E.00741
G1 X128.873 Y127.734 E.00813
G1 X128.775 Y127.978 E.00807
G1 X128.849 Y128.23 E.00809
G1 X129.04 Y128.41 E.00807
G1 X129.301 Y128.435 E.00807
G1 X129.543 Y128.32 E.00821
G1 X129.656 Y128.1 E.0076
G1 X129.661 Y128.001 E.00304
; CHANGE_LAYER
; Z_HEIGHT: 27.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X129.656 Y128.1 E-.03763
G1 X129.543 Y128.32 E-.09397
G1 X129.301 Y128.435 E-.10152
G1 X129.04 Y128.41 E-.09984
G1 X128.849 Y128.23 E-.09984
G1 X128.775 Y127.978 E-.1
G1 X128.873 Y127.734 E-.09981
G1 X129.083 Y127.572 E-.10059
G1 X129.153 Y127.571 E-.02681
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 137/350
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
G3 Z27.6 I-.938 J.775 P1  F30000
G1 X129.911 Y128.488 Z27.6
G1 Z27.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.207 Y127.153 I-.689 J-.49 E.11427
G1 X129.264 Y127.154 E.0019
G3 X129.944 Y128.438 I-.042 J.844 E.058
G1 X130.216 Y128.741 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.085 Y128.881 E.00589
G3 X129.195 Y126.761 I-.865 J-.884 E.14807
G1 X129.283 Y126.762 E.00271
G3 X130.246 Y128.689 I-.063 J1.235 E.08031
M204 S10000
G1 X129.664 Y127.942 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.549 Y127.687 E.00858
G1 X129.324 Y127.568 E.00781
G1 X129.083 Y127.572 E.00741
G1 X128.873 Y127.734 E.00813
M73 P74 R2
G1 X128.775 Y127.978 E.00807
G1 X128.849 Y128.23 E.00809
G1 X129.04 Y128.41 E.00807
G1 X129.301 Y128.435 E.00807
G1 X129.543 Y128.32 E.00821
G1 X129.656 Y128.1 E.00762
G1 X129.661 Y128.002 E.00301
; CHANGE_LAYER
; Z_HEIGHT: 27.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.656 Y128.1 E-.03726
G1 X129.543 Y128.32 E-.0942
G1 X129.301 Y128.435 E-.1015
G1 X129.04 Y128.41 E-.09983
G1 X128.849 Y128.23 E-.09984
G1 X128.775 Y127.978 E-.1
G1 X128.873 Y127.734 E-.09981
G1 X129.083 Y127.572 E-.1006
G1 X129.154 Y127.571 E-.02696
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 138/350
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
G3 Z27.8 I-.938 J.775 P1  F30000
G1 X129.911 Y128.488 Z27.8
G1 Z27.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.207 Y127.153 I-.689 J-.49 E.11427
G1 X129.264 Y127.154 E.00189
G3 X129.944 Y128.438 I-.041 J.844 E.058
G1 X130.218 Y128.739 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.085 Y128.881 E.00598
G3 X129.195 Y126.761 I-.865 J-.884 E.14807
G1 X129.283 Y126.762 E.0027
G3 X130.247 Y128.686 I-.063 J1.235 E.08023
M204 S10000
G1 X129.664 Y127.942 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.549 Y127.687 E.00858
G1 X129.324 Y127.568 E.00782
G1 X129.083 Y127.572 E.0074
G1 X128.873 Y127.734 E.00813
G1 X128.775 Y127.978 E.00807
G1 X128.849 Y128.23 E.00809
G1 X129.04 Y128.41 E.00807
G1 X129.301 Y128.435 E.00807
G1 X129.543 Y128.32 E.00821
G1 X129.656 Y128.1 E.00761
G1 X129.661 Y128.001 E.00303
; CHANGE_LAYER
; Z_HEIGHT: 27.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X129.656 Y128.1 E-.03745
G1 X129.543 Y128.32 E-.0941
G1 X129.301 Y128.435 E-.10148
G1 X129.04 Y128.41 E-.09983
G1 X128.849 Y128.23 E-.09984
G1 X128.775 Y127.978 E-.1
G1 X128.873 Y127.734 E-.09982
G1 X129.083 Y127.572 E-.1006
G1 X129.154 Y127.571 E-.02688
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 139/350
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
G3 Z28 I-.938 J.775 P1  F30000
G1 X129.911 Y128.488 Z28
G1 Z27.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.207 Y127.153 I-.689 J-.49 E.11428
G1 X129.264 Y127.154 E.00188
G3 X129.944 Y128.437 I-.041 J.844 E.058
G1 X130.22 Y128.736 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.085 Y128.881 E.00607
G3 X129.195 Y126.761 I-.865 J-.884 E.14807
G1 X129.283 Y126.762 E.00269
G3 X130.249 Y128.684 I-.063 J1.235 E.08016
M204 S10000
G1 X129.664 Y127.942 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.549 Y127.687 E.00858
G1 X129.323 Y127.568 E.00783
G1 X129.083 Y127.572 E.00739
G1 X128.873 Y127.734 E.00814
G1 X128.775 Y127.978 E.00807
G1 X128.849 Y128.23 E.00809
G1 X129.04 Y128.41 E.00807
G1 X129.301 Y128.435 E.00807
G1 X129.543 Y128.32 E.0082
G1 X129.656 Y128.1 E.00761
G1 X129.661 Y128.002 E.00302
; CHANGE_LAYER
; Z_HEIGHT: 28
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.656 Y128.1 E-.03735
G1 X129.543 Y128.32 E-.09416
G1 X129.301 Y128.435 E-.10145
G1 X129.04 Y128.41 E-.09984
G1 X128.849 Y128.23 E-.09984
G1 X128.775 Y127.978 E-.1
G1 X128.873 Y127.734 E-.09982
G1 X129.083 Y127.572 E-.10061
G1 X129.154 Y127.571 E-.02693
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 140/350
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
G3 Z28.2 I-.938 J.775 P1  F30000
G1 X129.911 Y128.487 Z28.2
G1 Z28
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.207 Y127.153 I-.689 J-.489 E.11429
G1 X129.263 Y127.154 E.00188
G3 X129.944 Y128.437 I-.041 J.844 E.05801
G1 X130.222 Y128.734 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.085 Y128.881 E.00616
G3 X129.195 Y126.761 I-.865 J-.884 E.14807
G1 X129.282 Y126.762 E.00268
G3 X130.25 Y128.682 I-.062 J1.235 E.08008
M204 S10000
G1 X129.664 Y127.942 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.549 Y127.687 E.00858
G1 X129.323 Y127.568 E.00784
G1 X129.083 Y127.572 E.00738
G1 X128.873 Y127.734 E.00814
G1 X128.775 Y127.978 E.00807
G1 X128.849 Y128.23 E.00809
G1 X129.04 Y128.41 E.00807
G1 X129.301 Y128.435 E.00807
G1 X129.542 Y128.32 E.0082
G1 X129.656 Y128.1 E.00761
G1 X129.661 Y128.002 E.00302
; CHANGE_LAYER
; Z_HEIGHT: 28.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.656 Y128.1 E-.0374
G1 X129.542 Y128.32 E-.09415
G1 X129.301 Y128.435 E-.10144
G1 X129.04 Y128.41 E-.09984
G1 X128.849 Y128.23 E-.09984
G1 X128.775 Y127.978 E-.1
G1 X128.873 Y127.734 E-.09982
G1 X129.083 Y127.572 E-.10061
G1 X129.154 Y127.571 E-.02691
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 141/350
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
G3 Z28.4 I-.938 J.776 P1  F30000
G1 X129.911 Y128.487 Z28.4
G1 Z28.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.207 Y127.153 I-.689 J-.489 E.1143
G1 X129.263 Y127.154 E.00187
G3 X129.944 Y128.437 I-.041 J.844 E.05801
G1 X130.224 Y128.732 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.085 Y128.881 E.00624
G3 X129.195 Y126.761 I-.865 J-.884 E.14807
G1 X129.282 Y126.762 E.00267
G3 X130.251 Y128.68 I-.062 J1.235 E.08001
M204 S10000
G1 X129.664 Y127.942 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.549 Y127.687 E.00857
G1 X129.323 Y127.568 E.00785
G1 X129.083 Y127.572 E.00737
G1 X128.873 Y127.734 E.00814
G1 X128.775 Y127.978 E.00807
G1 X128.849 Y128.23 E.00809
G1 X129.04 Y128.41 E.00807
G1 X129.301 Y128.435 E.00807
G1 X129.542 Y128.32 E.0082
G1 X129.656 Y128.1 E.00761
G1 X129.661 Y128.002 E.00303
; CHANGE_LAYER
; Z_HEIGHT: 28.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X129.656 Y128.1 E-.03744
G1 X129.542 Y128.32 E-.09413
G1 X129.301 Y128.435 E-.10141
G1 X129.04 Y128.41 E-.09985
G1 X128.849 Y128.23 E-.09984
G1 X128.775 Y127.978 E-.1
G1 X128.873 Y127.734 E-.09982
G1 X129.083 Y127.572 E-.10062
G1 X129.154 Y127.571 E-.0269
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 142/350
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
G3 Z28.6 I-.938 J.776 P1  F30000
G1 X129.912 Y128.487 Z28.6
G1 Z28.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.207 Y127.153 I-.689 J-.489 E.11431
G1 X129.263 Y127.154 E.00186
G3 X129.944 Y128.437 I-.041 J.844 E.05801
G1 X130.225 Y128.73 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.085 Y128.881 E.00633
G3 X129.195 Y126.761 I-.865 J-.884 E.14807
G1 X129.282 Y126.762 E.00266
G3 X130.253 Y128.678 I-.062 J1.235 E.07994
M204 S10000
G1 X129.664 Y127.942 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.549 Y127.687 E.00857
G1 X129.323 Y127.568 E.00786
G1 X129.083 Y127.572 E.00737
G1 X128.873 Y127.734 E.00814
G1 X128.775 Y127.978 E.00807
G1 X128.849 Y128.23 E.00809
G1 X129.04 Y128.41 E.00807
G1 X129.301 Y128.435 E.00807
G1 X129.542 Y128.32 E.0082
G1 X129.656 Y128.1 E.00761
G1 X129.661 Y128.002 E.00303
; CHANGE_LAYER
; Z_HEIGHT: 28.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.656 Y128.1 E-.03749
G1 X129.542 Y128.32 E-.0941
G1 X129.301 Y128.435 E-.1014
G1 X129.04 Y128.41 E-.09985
G1 X128.849 Y128.23 E-.09984
G1 X128.775 Y127.978 E-.1
G1 X128.873 Y127.734 E-.09982
G1 X129.083 Y127.572 E-.10062
G1 X129.154 Y127.571 E-.02688
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 143/350
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
G3 Z28.8 I-.938 J.776 P1  F30000
G1 X129.912 Y128.487 Z28.8
G1 Z28.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.207 Y127.153 I-.689 J-.489 E.11431
G1 X129.263 Y127.154 E.00185
G3 X129.945 Y128.437 I-.04 J.844 E.05801
G1 X130.227 Y128.728 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.085 Y128.881 E.0064
G3 X129.195 Y126.761 I-.865 J-.884 E.14807
G1 X129.282 Y126.762 E.00265
G3 X130.254 Y128.676 I-.061 J1.235 E.07988
M204 S10000
G1 X129.664 Y127.942 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.549 Y127.687 E.00857
G1 X129.322 Y127.568 E.00787
G1 X129.083 Y127.572 E.00736
G1 X128.873 Y127.734 E.00814
G1 X128.775 Y127.978 E.00807
G1 X128.849 Y128.23 E.00809
G1 X129.04 Y128.41 E.00807
G1 X129.301 Y128.435 E.00807
G1 X129.542 Y128.32 E.0082
G1 X129.656 Y128.1 E.00761
G1 X129.661 Y128.002 E.00303
; CHANGE_LAYER
; Z_HEIGHT: 28.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
M73 P75 R2
G1 X129.656 Y128.1 E-.03752
G1 X129.542 Y128.32 E-.0941
G1 X129.301 Y128.435 E-.10139
G1 X129.04 Y128.41 E-.09985
G1 X128.849 Y128.23 E-.09984
G1 X128.775 Y127.978 E-.09999
G1 X128.873 Y127.734 E-.09982
G1 X129.083 Y127.572 E-.10063
G1 X129.154 Y127.571 E-.02687
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 144/350
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
G3 Z29 I-.938 J.776 P1  F30000
G1 X129.912 Y128.487 Z29
G1 Z28.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.207 Y127.153 I-.689 J-.489 E.11432
G1 X129.262 Y127.154 E.00184
G3 X129.945 Y128.437 I-.04 J.844 E.05801
G1 X130.228 Y128.726 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.085 Y128.881 E.00648
G3 X129.195 Y126.761 I-.865 J-.884 E.14807
G1 X129.281 Y126.762 E.00265
G3 X130.255 Y128.674 I-.061 J1.235 E.07983
M204 S10000
G1 X129.664 Y127.942 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.549 Y127.688 E.00856
G1 X129.322 Y127.568 E.00788
G1 X129.083 Y127.572 E.00735
G1 X128.873 Y127.734 E.00814
G1 X128.775 Y127.978 E.00807
G1 X128.849 Y128.23 E.00809
G1 X129.04 Y128.41 E.00807
G1 X129.301 Y128.435 E.00807
G1 X129.542 Y128.32 E.0082
G1 X129.656 Y128.1 E.00761
G1 X129.661 Y128.002 E.00304
; CHANGE_LAYER
; Z_HEIGHT: 29
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.656 Y128.1 E-.03757
G1 X129.542 Y128.32 E-.09409
G1 X129.301 Y128.435 E-.10136
G1 X129.04 Y128.41 E-.09985
G1 X128.849 Y128.23 E-.09984
G1 X128.775 Y127.978 E-.09999
G1 X128.873 Y127.734 E-.09982
G1 X129.083 Y127.572 E-.10063
G1 X129.154 Y127.571 E-.02685
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 145/350
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
G3 Z29.2 I-.937 J.776 P1  F30000
G1 X129.912 Y128.487 Z29.2
G1 Z29
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.207 Y127.153 I-.689 J-.489 E.11432
G1 X129.262 Y127.154 E.00183
G3 X129.945 Y128.437 I-.04 J.844 E.05802
G1 X130.23 Y128.725 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.085 Y128.881 E.00654
G3 X129.195 Y126.761 I-.865 J-.884 E.14807
G1 X129.281 Y126.762 E.00264
G3 X130.256 Y128.673 I-.061 J1.235 E.07979
M204 S10000
G1 X129.664 Y127.942 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.549 Y127.688 E.00856
G1 X129.322 Y127.568 E.00789
G1 X129.083 Y127.572 E.00734
G1 X128.873 Y127.734 E.00814
G1 X128.775 Y127.978 E.00807
G1 X128.849 Y128.23 E.00809
G1 X129.04 Y128.41 E.00807
G1 X129.301 Y128.435 E.00807
G1 X129.542 Y128.32 E.00819
G1 X129.656 Y128.1 E.00761
G1 X129.661 Y128.002 E.00304
; CHANGE_LAYER
; Z_HEIGHT: 29.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.656 Y128.1 E-.03761
G1 X129.542 Y128.32 E-.09407
G1 X129.301 Y128.435 E-.10134
G1 X129.04 Y128.41 E-.09985
G1 X128.849 Y128.23 E-.09985
G1 X128.775 Y127.978 E-.09999
G1 X128.873 Y127.734 E-.09982
G1 X129.083 Y127.572 E-.10064
G1 X129.154 Y127.571 E-.02684
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 146/350
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
G3 Z29.4 I-.937 J.776 P1  F30000
G1 X129.912 Y128.487 Z29.4
G1 Z29.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.207 Y127.153 I-.69 J-.489 E.11433
G1 X129.262 Y127.154 E.00182
G3 X129.945 Y128.437 I-.04 J.844 E.05802
G1 X130.231 Y128.723 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.085 Y128.881 E.0066
G3 X129.195 Y126.761 I-.865 J-.884 E.14807
G1 X129.281 Y126.762 E.00263
G3 X130.257 Y128.672 I-.061 J1.235 E.07976
M204 S10000
G1 X129.664 Y127.942 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.549 Y127.688 E.00856
G1 X129.322 Y127.568 E.0079
G1 X129.083 Y127.572 E.00733
G1 X128.873 Y127.734 E.00814
G1 X128.775 Y127.978 E.00807
G1 X128.849 Y128.23 E.00809
G1 X129.04 Y128.41 E.00807
G1 X129.301 Y128.435 E.00807
G1 X129.542 Y128.32 E.00819
G1 X129.656 Y128.101 E.0076
G1 X129.661 Y128.002 E.00305
; CHANGE_LAYER
; Z_HEIGHT: 29.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X129.656 Y128.101 E-.03766
G1 X129.542 Y128.32 E-.09404
G1 X129.301 Y128.435 E-.10133
G1 X129.04 Y128.41 E-.09985
G1 X128.849 Y128.23 E-.09984
G1 X128.775 Y127.978 E-.09999
G1 X128.873 Y127.734 E-.09982
G1 X129.083 Y127.572 E-.10064
G1 X129.154 Y127.571 E-.02682
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 147/350
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
G3 Z29.6 I-.937 J.776 P1  F30000
G1 X129.912 Y128.487 Z29.6
G1 Z29.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.207 Y127.153 I-.69 J-.489 E.11434
G1 X129.262 Y127.154 E.00181
G3 X129.945 Y128.436 I-.039 J.844 E.05802
G1 X130.232 Y128.722 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.085 Y128.881 E.00665
G3 X129.195 Y126.761 I-.865 J-.884 E.14807
G1 X129.28 Y126.762 E.00262
G3 X130.257 Y128.671 I-.06 J1.235 E.07973
M204 S10000
G1 X129.664 Y127.942 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.549 Y127.688 E.00855
G1 X129.321 Y127.568 E.00791
G1 X129.083 Y127.572 E.00733
G1 X128.873 Y127.734 E.00814
G1 X128.775 Y127.978 E.00807
G1 X128.849 Y128.23 E.00809
G1 X129.04 Y128.41 E.00807
G1 X129.301 Y128.435 E.00807
G1 X129.542 Y128.32 E.00819
G1 X129.656 Y128.101 E.0076
G1 X129.661 Y128.001 E.00305
; CHANGE_LAYER
; Z_HEIGHT: 29.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.656 Y128.101 E-.0377
G1 X129.542 Y128.32 E-.09402
G1 X129.301 Y128.435 E-.10131
G1 X129.04 Y128.41 E-.09985
G1 X128.849 Y128.23 E-.09985
G1 X128.775 Y127.978 E-.09999
G1 X128.873 Y127.734 E-.09982
G1 X129.083 Y127.572 E-.10065
G1 X129.154 Y127.571 E-.0268
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 148/350
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
G3 Z29.8 I-.937 J.776 P1  F30000
G1 X129.912 Y128.486 Z29.8
G1 Z29.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.207 Y127.153 I-.69 J-.488 E.11435
G1 X129.261 Y127.154 E.0018
G3 X129.945 Y128.436 I-.039 J.844 E.05802
G1 X130.233 Y128.721 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.085 Y128.881 E.00669
G3 X129.195 Y126.761 I-.865 J-.884 E.14807
G1 X129.28 Y126.762 E.00261
G3 X130.258 Y128.67 I-.06 J1.235 E.07971
M204 S10000
G1 X129.664 Y127.942 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.549 Y127.688 E.00855
G1 X129.321 Y127.568 E.00792
G1 X129.083 Y127.572 E.00732
G1 X128.873 Y127.734 E.00814
G1 X128.775 Y127.978 E.00807
G1 X128.849 Y128.23 E.00809
G1 X129.04 Y128.41 E.00807
G1 X129.301 Y128.435 E.00807
G1 X129.542 Y128.32 E.00819
G1 X129.656 Y128.101 E.0076
G1 X129.661 Y128.001 E.00305
; CHANGE_LAYER
; Z_HEIGHT: 29.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X129.656 Y128.101 E-.03775
G1 X129.542 Y128.32 E-.094
G1 X129.301 Y128.435 E-.10129
G1 X129.04 Y128.41 E-.09986
G1 X128.849 Y128.23 E-.09984
G1 X128.775 Y127.978 E-.09999
G1 X128.873 Y127.734 E-.09982
G1 X129.083 Y127.572 E-.10066
G1 X129.154 Y127.571 E-.02679
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 149/350
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
G3 Z30 I-.937 J.776 P1  F30000
G1 X129.912 Y128.486 Z30
G1 Z29.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.207 Y127.153 I-.69 J-.488 E.11435
G1 X129.261 Y127.154 E.00179
G3 X129.945 Y128.436 I-.039 J.844 E.05803
G1 X130.234 Y128.72 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.085 Y128.881 E.00673
G3 X129.195 Y126.761 I-.865 J-.884 E.14807
G1 X129.28 Y126.762 E.0026
G3 X130.258 Y128.669 I-.06 J1.235 E.0797
M204 S10000
G1 X129.664 Y127.942 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.549 Y127.688 E.00855
G1 X129.321 Y127.568 E.00793
G1 X129.083 Y127.572 E.00731
G1 X128.873 Y127.734 E.00814
G1 X128.775 Y127.978 E.00807
G1 X128.849 Y128.23 E.00809
G1 X129.04 Y128.41 E.00807
G1 X129.301 Y128.435 E.00807
G1 X129.542 Y128.32 E.00819
G1 X129.656 Y128.101 E.0076
G1 X129.661 Y128.001 E.00306
; CHANGE_LAYER
; Z_HEIGHT: 30
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.656 Y128.101 E-.03781
G1 X129.542 Y128.32 E-.09398
G1 X129.301 Y128.435 E-.10127
G1 X129.04 Y128.41 E-.09985
G1 X128.849 Y128.23 E-.09985
G1 X128.775 Y127.978 E-.09999
G1 X128.873 Y127.734 E-.09982
G1 X129.083 Y127.572 E-.10066
G1 X129.154 Y127.571 E-.02676
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 150/350
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
G3 Z30.2 I-.937 J.777 P1  F30000
G1 X129.912 Y128.486 Z30.2
G1 Z30
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.207 Y127.153 I-.69 J-.488 E.11436
G1 X129.261 Y127.154 E.00179
G3 X129.945 Y128.436 I-.039 J.844 E.05803
G1 X130.234 Y128.719 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.085 Y128.881 E.00676
G3 X129.195 Y126.761 I-.865 J-.884 E.14807
G1 X129.28 Y126.762 E.00259
G3 X130.258 Y128.669 I-.06 J1.235 E.07969
M204 S10000
G1 X129.664 Y127.941 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.55 Y127.688 E.00855
G1 X129.321 Y127.568 E.00794
G1 X129.083 Y127.572 E.0073
G1 X128.873 Y127.734 E.00814
M73 P76 R2
G1 X128.775 Y127.978 E.00807
G1 X128.849 Y128.23 E.00809
G1 X129.04 Y128.41 E.00807
G1 X129.301 Y128.435 E.00807
G1 X129.542 Y128.32 E.00819
G1 X129.656 Y128.101 E.0076
G1 X129.661 Y128.001 E.00306
; CHANGE_LAYER
; Z_HEIGHT: 30.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.656 Y128.101 E-.03785
G1 X129.542 Y128.32 E-.09397
G1 X129.301 Y128.435 E-.10125
G1 X129.04 Y128.41 E-.09985
G1 X128.849 Y128.23 E-.09985
G1 X128.775 Y127.978 E-.09999
G1 X128.873 Y127.734 E-.09983
G1 X129.083 Y127.572 E-.10066
G1 X129.153 Y127.571 E-.02675
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 151/350
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
G3 Z30.4 I-.937 J.777 P1  F30000
G1 X129.912 Y128.486 Z30.4
G1 Z30.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.207 Y127.153 I-.69 J-.488 E.11437
G1 X129.261 Y127.154 E.00178
G3 X129.945 Y128.436 I-.039 J.844 E.05803
G1 X130.235 Y128.719 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.085 Y128.881 E.00679
G3 X129.195 Y126.761 I-.865 J-.884 E.14807
G1 X129.279 Y126.762 E.00258
G3 X130.259 Y128.669 I-.059 J1.235 E.07969
M204 S10000
G1 X129.664 Y127.941 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.55 Y127.688 E.00854
G1 X129.32 Y127.568 E.00795
G1 X129.083 Y127.572 E.00729
G1 X128.873 Y127.734 E.00814
G1 X128.775 Y127.978 E.00807
G1 X128.849 Y128.23 E.00809
G1 X129.04 Y128.41 E.00807
G1 X129.301 Y128.435 E.00807
G1 X129.542 Y128.32 E.00819
G1 X129.656 Y128.101 E.0076
G1 X129.661 Y128.001 E.00306
; CHANGE_LAYER
; Z_HEIGHT: 30.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X129.656 Y128.101 E-.03789
G1 X129.542 Y128.32 E-.09395
G1 X129.301 Y128.435 E-.10124
G1 X129.04 Y128.41 E-.09985
G1 X128.849 Y128.23 E-.09985
G1 X128.775 Y127.978 E-.09999
G1 X128.873 Y127.734 E-.09983
G1 X129.083 Y127.572 E-.10067
G1 X129.153 Y127.571 E-.02674
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 152/350
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
G3 Z30.6 I-.937 J.777 P1  F30000
G1 X129.912 Y128.486 Z30.6
G1 Z30.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.207 Y127.153 I-.69 J-.488 E.11437
G1 X129.26 Y127.154 E.00177
G3 X129.945 Y128.436 I-.038 J.844 E.05803
G1 X130.235 Y128.718 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.085 Y128.881 E.00681
G3 X129.195 Y126.761 I-.865 J-.884 E.14808
G1 X129.279 Y126.762 E.00257
G3 X130.259 Y128.668 I-.059 J1.235 E.07968
M204 S10000
G1 X129.664 Y127.941 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.55 Y127.688 E.00854
G1 X129.32 Y127.568 E.00796
G1 X129.083 Y127.572 E.00729
G1 X128.873 Y127.734 E.00814
G1 X128.775 Y127.978 E.00807
G1 X128.849 Y128.23 E.00809
G1 X129.04 Y128.41 E.00807
G1 X129.301 Y128.435 E.00807
G1 X129.542 Y128.32 E.00818
G1 X129.656 Y128.101 E.0076
G1 X129.661 Y128.001 E.00307
; CHANGE_LAYER
; Z_HEIGHT: 30.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.656 Y128.101 E-.03793
G1 X129.542 Y128.32 E-.09394
G1 X129.301 Y128.435 E-.10122
G1 X129.04 Y128.41 E-.09986
G1 X128.849 Y128.23 E-.09984
G1 X128.775 Y127.978 E-.09999
G1 X128.873 Y127.734 E-.09983
G1 X129.083 Y127.572 E-.10068
G1 X129.153 Y127.571 E-.02672
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 153/350
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
G3 Z30.8 I-.937 J.777 P1  F30000
G1 X129.912 Y128.486 Z30.8
G1 Z30.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.207 Y127.153 I-.69 J-.488 E.11438
G1 X129.26 Y127.154 E.00176
G3 X129.945 Y128.436 I-.038 J.844 E.05804
G1 X130.236 Y128.718 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.085 Y128.881 E.00683
G3 X129.195 Y126.761 I-.865 J-.884 E.14807
G1 X129.279 Y126.762 E.00257
G3 X130.259 Y128.668 I-.059 J1.235 E.07968
M204 S10000
G1 X129.664 Y127.941 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.55 Y127.688 E.00854
G1 X129.32 Y127.568 E.00797
G1 X129.083 Y127.572 E.00728
G1 X128.873 Y127.734 E.00814
G1 X128.775 Y127.978 E.00807
G1 X128.849 Y128.23 E.00809
G1 X129.04 Y128.41 E.00807
G1 X129.301 Y128.435 E.00808
G1 X129.542 Y128.32 E.00818
G1 X129.656 Y128.101 E.00759
G1 X129.661 Y128.001 E.00307
; CHANGE_LAYER
; Z_HEIGHT: 30.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X129.656 Y128.101 E-.03798
G1 X129.542 Y128.32 E-.09392
G1 X129.301 Y128.435 E-.1012
G1 X129.04 Y128.41 E-.09986
G1 X128.849 Y128.23 E-.09984
G1 X128.775 Y127.978 E-.09999
G1 X128.873 Y127.734 E-.09982
G1 X129.083 Y127.572 E-.10069
G1 X129.153 Y127.571 E-.0267
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 154/350
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
G3 Z31 I-.937 J.777 P1  F30000
G1 X129.912 Y128.486 Z31
G1 Z30.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.207 Y127.153 I-.69 J-.488 E.11439
G1 X129.26 Y127.154 E.00175
G3 X129.945 Y128.435 I-.038 J.844 E.05804
G1 X130.236 Y128.717 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.085 Y128.881 E.00684
G3 X129.195 Y126.761 I-.865 J-.884 E.14808
G1 X129.278 Y126.762 E.00256
G3 X130.259 Y128.668 I-.058 J1.235 E.07968
M204 S10000
G1 X129.664 Y127.941 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.55 Y127.688 E.00853
G1 X129.32 Y127.568 E.00798
G1 X129.083 Y127.572 E.00727
G1 X128.873 Y127.734 E.00814
G1 X128.775 Y127.978 E.00807
G1 X128.849 Y128.23 E.00809
G1 X129.04 Y128.41 E.00807
G1 X129.301 Y128.435 E.00807
G1 X129.542 Y128.32 E.00818
G1 X129.656 Y128.101 E.00759
G1 X129.661 Y128.001 E.00307
; CHANGE_LAYER
; Z_HEIGHT: 31
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.656 Y128.101 E-.03802
G1 X129.542 Y128.32 E-.0939
G1 X129.301 Y128.435 E-.10119
G1 X129.04 Y128.41 E-.09986
G1 X128.849 Y128.23 E-.09984
G1 X128.775 Y127.978 E-.09999
G1 X128.873 Y127.734 E-.09983
G1 X129.083 Y127.572 E-.10069
G1 X129.153 Y127.571 E-.02669
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 155/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L155
M991 S0 P154 ;notify layer change
G17
G3 Z31.2 I-.936 J.777 P1  F30000
G1 X129.912 Y128.486 Z31.2
G1 Z31
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.207 Y127.153 I-.69 J-.488 E.11439
G1 X129.26 Y127.154 E.00174
G3 X129.945 Y128.435 I-.038 J.844 E.05804
G1 X130.236 Y128.717 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.085 Y128.881 E.00686
G3 X129.195 Y126.761 I-.865 J-.884 E.14808
G1 X129.278 Y126.762 E.00255
G3 X130.259 Y128.668 I-.058 J1.235 E.07968
M204 S10000
G1 X129.664 Y127.941 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.55 Y127.688 E.00853
G1 X129.319 Y127.568 E.00799
G1 X129.083 Y127.572 E.00726
G1 X128.873 Y127.734 E.00814
G1 X128.775 Y127.978 E.00807
G1 X128.849 Y128.23 E.00808
G1 X129.04 Y128.41 E.00807
G1 X129.301 Y128.435 E.00807
G1 X129.542 Y128.32 E.00818
G1 X129.656 Y128.101 E.00759
G1 X129.661 Y128.001 E.00308
; CHANGE_LAYER
; Z_HEIGHT: 31.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.656 Y128.101 E-.03806
G1 X129.542 Y128.32 E-.09388
G1 X129.301 Y128.435 E-.10117
G1 X129.04 Y128.41 E-.09986
G1 X128.849 Y128.23 E-.09985
G1 X128.775 Y127.978 E-.09998
G1 X128.873 Y127.734 E-.09983
G1 X129.083 Y127.572 E-.10069
G1 X129.153 Y127.571 E-.02668
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 156/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L156
M991 S0 P155 ;notify layer change
G17
G3 Z31.4 I-.936 J.777 P1  F30000
G1 X129.913 Y128.485 Z31.4
G1 Z31.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.207 Y127.153 I-.69 J-.487 E.1144
G1 X129.26 Y127.154 E.00173
G3 X129.945 Y128.435 I-.037 J.844 E.05804
G1 X130.236 Y128.717 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.085 Y128.881 E.00687
G3 X129.195 Y126.761 I-.865 J-.884 E.14808
G1 X129.278 Y126.762 E.00254
G3 X130.259 Y128.667 I-.058 J1.235 E.07968
M204 S10000
G1 X129.664 Y127.941 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.55 Y127.688 E.00853
G1 X129.319 Y127.568 E.00799
G1 X129.083 Y127.572 E.00725
G1 X128.873 Y127.734 E.00814
G1 X128.775 Y127.978 E.00807
G1 X128.849 Y128.23 E.00808
G1 X129.04 Y128.41 E.00807
G1 X129.301 Y128.435 E.00807
G1 X129.542 Y128.32 E.00818
G1 X129.656 Y128.102 E.00759
G1 X129.661 Y128.001 E.00308
; CHANGE_LAYER
; Z_HEIGHT: 31.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X129.656 Y128.102 E-.03811
G1 X129.542 Y128.32 E-.09386
G1 X129.301 Y128.435 E-.10115
G1 X129.04 Y128.41 E-.09986
G1 X128.849 Y128.23 E-.09985
G1 X128.775 Y127.978 E-.09998
G1 X128.873 Y127.734 E-.09983
M73 P77 R2
G1 X129.083 Y127.572 E-.1007
G1 X129.153 Y127.571 E-.02666
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 157/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L157
M991 S0 P156 ;notify layer change
G17
G3 Z31.6 I-.936 J.777 P1  F30000
G1 X129.913 Y128.485 Z31.6
G1 Z31.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.207 Y127.153 I-.691 J-.487 E.11441
G1 X129.259 Y127.154 E.00172
G3 X129.945 Y128.435 I-.037 J.844 E.05805
G1 X130.237 Y128.716 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.085 Y128.881 E.00687
G3 X129.195 Y126.761 I-.865 J-.884 E.14808
G1 X129.278 Y126.762 E.00253
G3 X130.26 Y128.667 I-.058 J1.235 E.07969
M204 S10000
G1 X129.664 Y127.941 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.55 Y127.688 E.00852
G1 X129.319 Y127.568 E.00801
G1 X129.083 Y127.572 E.00725
G1 X128.873 Y127.734 E.00814
G1 X128.775 Y127.978 E.00807
G1 X128.849 Y128.23 E.00808
G1 X129.04 Y128.41 E.00807
G1 X129.301 Y128.435 E.00808
G1 X129.542 Y128.32 E.00818
G1 X129.656 Y128.102 E.00759
G1 X129.661 Y128.001 E.00309
; CHANGE_LAYER
; Z_HEIGHT: 31.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.656 Y128.102 E-.03815
G1 X129.542 Y128.32 E-.09385
G1 X129.301 Y128.435 E-.10113
G1 X129.04 Y128.41 E-.09987
G1 X128.849 Y128.23 E-.09984
G1 X128.775 Y127.978 E-.09998
G1 X128.873 Y127.734 E-.09983
G1 X129.083 Y127.572 E-.1007
G1 X129.153 Y127.571 E-.02664
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 158/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L158
M991 S0 P157 ;notify layer change
G17
G3 Z31.8 I-.936 J.778 P1  F30000
G1 X129.913 Y128.485 Z31.8
G1 Z31.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.207 Y127.153 I-.691 J-.487 E.11441
G1 X129.259 Y127.154 E.00171
G3 X129.946 Y128.435 I-.037 J.844 E.05805
G1 X130.237 Y128.716 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.085 Y128.881 E.00688
G3 X129.195 Y126.761 I-.865 J-.884 E.14808
G1 X129.277 Y126.762 E.00252
G3 X130.26 Y128.667 I-.057 J1.235 E.07969
M204 S10000
G1 X129.664 Y127.941 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.55 Y127.688 E.00852
G1 X129.319 Y127.568 E.00801
G1 X129.083 Y127.572 E.00724
G1 X128.873 Y127.734 E.00814
G1 X128.775 Y127.978 E.00807
G1 X128.849 Y128.23 E.00808
G1 X129.04 Y128.41 E.00807
G1 X129.301 Y128.435 E.00807
G1 X129.542 Y128.32 E.00818
G1 X129.656 Y128.102 E.00759
G1 X129.661 Y128.001 E.00309
; CHANGE_LAYER
; Z_HEIGHT: 31.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X129.656 Y128.102 E-.0382
G1 X129.542 Y128.32 E-.09383
G1 X129.301 Y128.435 E-.10111
G1 X129.04 Y128.41 E-.09986
G1 X128.849 Y128.23 E-.09985
G1 X128.775 Y127.978 E-.09999
G1 X128.873 Y127.734 E-.09983
G1 X129.083 Y127.572 E-.10071
G1 X129.153 Y127.571 E-.02662
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 159/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L159
M991 S0 P158 ;notify layer change
G17
G3 Z32 I-.936 J.778 P1  F30000
G1 X129.913 Y128.485 Z32
G1 Z31.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.207 Y127.153 I-.691 J-.487 E.11442
G1 X129.259 Y127.153 E.0017
G3 X129.946 Y128.435 I-.037 J.844 E.05805
G1 X130.237 Y128.716 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.085 Y128.881 E.00689
G3 X129.195 Y126.761 I-.865 J-.884 E.14808
G1 X129.277 Y126.762 E.00251
G3 X130.26 Y128.667 I-.057 J1.236 E.07969
M204 S10000
G1 X129.664 Y127.941 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.55 Y127.688 E.00852
G1 X129.318 Y127.568 E.00802
G1 X129.083 Y127.572 E.00723
G1 X128.873 Y127.734 E.00814
G1 X128.775 Y127.978 E.00807
G1 X128.849 Y128.23 E.00808
G1 X129.04 Y128.41 E.00807
G1 X129.301 Y128.435 E.00808
G1 X129.542 Y128.32 E.00817
G1 X129.656 Y128.102 E.00759
G1 X129.661 Y128.001 E.00309
; CHANGE_LAYER
; Z_HEIGHT: 32
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.656 Y128.102 E-.03825
G1 X129.542 Y128.32 E-.0938
G1 X129.301 Y128.435 E-.1011
G1 X129.04 Y128.41 E-.09987
G1 X128.849 Y128.23 E-.09985
G1 X128.775 Y127.978 E-.09998
G1 X128.873 Y127.734 E-.09983
G1 X129.083 Y127.572 E-.10072
G1 X129.153 Y127.571 E-.0266
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 160/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L160
M991 S0 P159 ;notify layer change
G17
G3 Z32.2 I-.936 J.778 P1  F30000
G1 X129.913 Y128.485 Z32.2
G1 Z32
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.207 Y127.153 I-.691 J-.487 E.11443
G1 X129.259 Y127.153 E.0017
G3 X129.946 Y128.435 I-.037 J.844 E.05805
G1 X130.237 Y128.716 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.085 Y128.881 E.0069
G3 X129.195 Y126.761 I-.865 J-.884 E.14808
G1 X129.277 Y126.762 E.0025
G3 X130.26 Y128.667 I-.057 J1.236 E.07969
M204 S10000
G1 X129.664 Y127.941 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.55 Y127.688 E.00852
G1 X129.318 Y127.568 E.00803
G1 X129.083 Y127.572 E.00722
G1 X128.873 Y127.734 E.00814
G1 X128.775 Y127.978 E.00807
G1 X128.849 Y128.23 E.00808
G1 X129.04 Y128.41 E.00807
G1 X129.301 Y128.435 E.00808
G1 X129.542 Y128.32 E.00817
G1 X129.656 Y128.102 E.00758
G1 X129.661 Y128.001 E.0031
; CHANGE_LAYER
; Z_HEIGHT: 32.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.656 Y128.102 E-.03829
G1 X129.542 Y128.32 E-.09378
G1 X129.301 Y128.435 E-.10108
G1 X129.04 Y128.41 E-.09986
G1 X128.849 Y128.23 E-.09985
G1 X128.775 Y127.978 E-.09998
G1 X128.873 Y127.734 E-.09984
G1 X129.083 Y127.572 E-.10072
G1 X129.153 Y127.571 E-.02659
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 161/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L161
M991 S0 P160 ;notify layer change
G17
G3 Z32.4 I-.936 J.778 P1  F30000
G1 X129.913 Y128.485 Z32.4
G1 Z32.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.208 Y127.153 I-.691 J-.487 E.11443
G1 X129.258 Y127.153 E.00169
G3 X129.946 Y128.435 I-.036 J.844 E.05806
G1 X130.237 Y128.716 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.085 Y128.881 E.00691
G3 X129.195 Y126.761 I-.865 J-.884 E.14807
G1 X129.277 Y126.762 E.0025
G3 X130.26 Y128.666 I-.057 J1.236 E.07969
M204 S10000
G1 X129.664 Y127.941 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.55 Y127.689 E.00851
G1 X129.318 Y127.568 E.00804
G1 X129.083 Y127.572 E.00721
G1 X128.873 Y127.734 E.00814
G1 X128.775 Y127.978 E.00807
G1 X128.849 Y128.23 E.00808
G1 X129.04 Y128.41 E.00807
G1 X129.302 Y128.435 E.00808
G1 X129.542 Y128.321 E.00817
G1 X129.656 Y128.102 E.00758
G1 X129.661 Y128.001 E.0031
; CHANGE_LAYER
; Z_HEIGHT: 32.4
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.656 Y128.102 E-.03833
G1 X129.542 Y128.321 E-.09378
G1 X129.302 Y128.435 E-.10105
G1 X129.04 Y128.41 E-.09987
G1 X128.849 Y128.23 E-.09986
G1 X128.775 Y127.978 E-.09998
G1 X128.873 Y127.734 E-.09983
G1 X129.083 Y127.572 E-.10073
G1 X129.153 Y127.571 E-.02657
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 162/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L162
M991 S0 P161 ;notify layer change
G17
G3 Z32.6 I-.936 J.778 P1  F30000
G1 X129.913 Y128.485 Z32.6
G1 Z32.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.208 Y127.153 I-.691 J-.487 E.11444
G1 X129.258 Y127.153 E.00168
G3 X129.946 Y128.434 I-.036 J.844 E.05806
G1 X130.237 Y128.715 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.085 Y128.881 E.00692
G3 X129.195 Y126.761 I-.865 J-.884 E.14807
G1 X129.276 Y126.762 E.00249
G3 X130.26 Y128.666 I-.056 J1.236 E.07969
M204 S10000
G1 X129.664 Y127.941 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.55 Y127.689 E.00851
G1 X129.318 Y127.568 E.00805
G1 X129.083 Y127.572 E.00721
G1 X128.873 Y127.734 E.00814
G1 X128.775 Y127.978 E.00807
G1 X128.849 Y128.23 E.00808
G1 X129.04 Y128.41 E.00807
G1 X129.301 Y128.435 E.00808
G1 X129.542 Y128.321 E.00817
G1 X129.656 Y128.102 E.00758
G1 X129.661 Y128.001 E.0031
; CHANGE_LAYER
; Z_HEIGHT: 32.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.656 Y128.102 E-.03837
G1 X129.542 Y128.321 E-.09375
G1 X129.301 Y128.435 E-.10105
G1 X129.04 Y128.41 E-.09987
G1 X128.849 Y128.23 E-.09985
G1 X128.775 Y127.978 E-.09998
G1 X128.873 Y127.734 E-.09984
G1 X129.083 Y127.572 E-.10073
G1 X129.153 Y127.571 E-.02656
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 163/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L163
M991 S0 P162 ;notify layer change
G17
G3 Z32.8 I-.936 J.778 P1  F30000
G1 X129.913 Y128.485 Z32.8
G1 Z32.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.208 Y127.153 I-.691 J-.487 E.11445
G1 X129.258 Y127.153 E.00167
G3 X129.946 Y128.434 I-.036 J.844 E.05806
G1 X130.238 Y128.715 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.085 Y128.881 E.00693
G3 X129.195 Y126.761 I-.865 J-.884 E.14808
G1 X129.276 Y126.762 E.00248
G3 X130.26 Y128.666 I-.056 J1.236 E.07969
M204 S10000
G1 X129.664 Y127.941 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.55 Y127.689 E.00851
G1 X129.317 Y127.567 E.00806
G1 X129.083 Y127.572 E.0072
G1 X128.873 Y127.734 E.00815
G1 X128.775 Y127.978 E.00807
G1 X128.849 Y128.23 E.00808
G1 X129.04 Y128.41 E.00807
G1 X129.302 Y128.435 E.00808
G1 X129.542 Y128.321 E.00817
G1 X129.656 Y128.102 E.00758
M73 P78 R2
G1 X129.661 Y128.001 E.00311
; CHANGE_LAYER
; Z_HEIGHT: 32.8
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.656 Y128.102 E-.03843
G1 X129.542 Y128.321 E-.09373
G1 X129.302 Y128.435 E-.10103
G1 X129.04 Y128.41 E-.09987
G1 X128.849 Y128.23 E-.09985
G1 X128.775 Y127.978 E-.09998
G1 X128.873 Y127.734 E-.09984
G1 X129.083 Y127.572 E-.10074
G1 X129.153 Y127.571 E-.02654
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 164/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L164
M991 S0 P163 ;notify layer change
G17
G3 Z33 I-.936 J.778 P1  F30000
G1 X129.913 Y128.484 Z33
G1 Z32.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.208 Y127.153 I-.691 J-.487 E.11445
G1 X129.258 Y127.153 E.00166
G3 X129.946 Y128.434 I-.036 J.844 E.05807
G1 X130.238 Y128.715 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.085 Y128.881 E.00694
G3 X129.195 Y126.761 I-.865 J-.884 E.14807
G1 X129.276 Y126.762 E.00247
G3 X130.26 Y128.666 I-.056 J1.236 E.0797
M204 S10000
G1 X129.663 Y127.941 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.55 Y127.689 E.0085
G1 X129.317 Y127.567 E.00807
G1 X129.083 Y127.572 E.00719
G1 X128.873 Y127.734 E.00815
G1 X128.775 Y127.978 E.00807
G1 X128.849 Y128.23 E.00808
G1 X129.04 Y128.41 E.00807
G1 X129.301 Y128.435 E.00807
G1 X129.542 Y128.321 E.00817
G1 X129.656 Y128.102 E.00758
G1 X129.661 Y128.001 E.00311
; CHANGE_LAYER
; Z_HEIGHT: 33
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.656 Y128.102 E-.03847
G1 X129.542 Y128.321 E-.09371
G1 X129.301 Y128.435 E-.10102
G1 X129.04 Y128.41 E-.09986
G1 X128.849 Y128.23 E-.09985
G1 X128.775 Y127.978 E-.09998
G1 X128.873 Y127.734 E-.09984
G1 X129.083 Y127.572 E-.10074
G1 X129.153 Y127.571 E-.02653
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 165/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L165
M991 S0 P164 ;notify layer change
G17
G3 Z33.2 I-.935 J.778 P1  F30000
G1 X129.913 Y128.484 Z33.2
G1 Z33
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.208 Y127.153 I-.691 J-.486 E.11446
G1 X129.257 Y127.153 E.00165
G3 X129.946 Y128.434 I-.035 J.845 E.05807
G1 X130.238 Y128.714 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.085 Y128.881 E.00696
G3 X129.195 Y126.761 I-.865 J-.884 E.14807
G1 X129.275 Y126.762 E.00246
G3 X130.261 Y128.666 I-.055 J1.236 E.0797
M204 S10000
G1 X129.663 Y127.941 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.55 Y127.689 E.0085
G1 X129.317 Y127.567 E.00808
G1 X129.083 Y127.572 E.00718
G1 X128.873 Y127.734 E.00815
G1 X128.775 Y127.978 E.00807
G1 X128.849 Y128.23 E.00808
G1 X129.04 Y128.41 E.00807
G1 X129.302 Y128.435 E.00808
G1 X129.542 Y128.321 E.00817
G1 X129.656 Y128.102 E.00758
G1 X129.661 Y128.001 E.00311
; CHANGE_LAYER
; Z_HEIGHT: 33.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.656 Y128.102 E-.03851
G1 X129.542 Y128.321 E-.0937
G1 X129.302 Y128.435 E-.10099
G1 X129.04 Y128.41 E-.09988
G1 X128.849 Y128.23 E-.09984
G1 X128.775 Y127.978 E-.09998
G1 X128.873 Y127.734 E-.09984
G1 X129.083 Y127.572 E-.10075
G1 X129.153 Y127.571 E-.02651
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 166/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L166
M991 S0 P165 ;notify layer change
G17
G3 Z33.4 I-.935 J.779 P1  F30000
G1 X129.913 Y128.484 Z33.4
G1 Z33.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.208 Y127.153 I-.691 J-.486 E.11447
G1 X129.257 Y127.153 E.00164
G3 X129.946 Y128.434 I-.035 J.845 E.05807
G1 X130.239 Y128.714 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.085 Y128.881 E.00698
G3 X129.195 Y126.761 I-.865 J-.884 E.14807
G1 X129.275 Y126.762 E.00245
G3 X130.261 Y128.665 I-.055 J1.236 E.0797
M204 S10000
G1 X129.663 Y127.941 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.55 Y127.689 E.0085
G1 X129.317 Y127.567 E.00809
G1 X129.083 Y127.572 E.00717
G1 X128.873 Y127.734 E.00815
G1 X128.775 Y127.978 E.00807
G1 X128.849 Y128.23 E.00808
G1 X129.04 Y128.41 E.00807
G1 X129.301 Y128.435 E.00807
G1 X129.542 Y128.321 E.00817
G1 X129.656 Y128.102 E.00758
G1 X129.661 Y128.001 E.00311
; CHANGE_LAYER
; Z_HEIGHT: 33.4
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.656 Y128.102 E-.03852
G1 X129.542 Y128.321 E-.09372
G1 X129.301 Y128.435 E-.10099
G1 X129.04 Y128.41 E-.09986
G1 X128.849 Y128.23 E-.09986
G1 X128.775 Y127.978 E-.09998
G1 X128.873 Y127.734 E-.09984
G1 X129.083 Y127.572 E-.10075
G1 X129.153 Y127.571 E-.02648
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 167/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L167
M991 S0 P166 ;notify layer change
G17
G3 Z33.6 I-.935 J.779 P1  F30000
G1 X129.913 Y128.484 Z33.6
G1 Z33.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.208 Y127.153 I-.691 J-.486 E.11447
G1 X129.257 Y127.153 E.00163
G3 X129.946 Y128.434 I-.035 J.845 E.05807
G1 X130.24 Y128.712 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.232 Y128.708 E.00026
G3 X129.195 Y126.761 I-1.012 J-.711 E.15506
G1 X129.275 Y126.762 E.00244
G3 X130.35 Y128.501 I-.055 J1.236 E.07396
G1 X130.267 Y128.659 E.00547
M204 S10000
G1 X129.663 Y127.941 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.55 Y127.689 E.00849
G1 X129.317 Y127.567 E.0081
G1 X129.083 Y127.572 E.00717
G1 X128.873 Y127.734 E.00815
G1 X128.775 Y127.978 E.00807
G1 X128.848 Y128.23 E.00808
G1 X129.04 Y128.41 E.00808
G1 X129.302 Y128.435 E.00807
G1 X129.542 Y128.321 E.00816
G1 X129.656 Y128.102 E.00758
G1 X129.661 Y128.001 E.00312
; CHANGE_LAYER
; Z_HEIGHT: 33.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.656 Y128.102 E-.03853
G1 X129.542 Y128.321 E-.09377
G1 X129.302 Y128.435 E-.10096
G1 X129.04 Y128.41 E-.09986
G1 X128.848 Y128.23 E-.09986
G1 X128.775 Y127.978 E-.09998
G1 X128.873 Y127.734 E-.09984
G1 X129.083 Y127.572 E-.10076
G1 X129.153 Y127.571 E-.02643
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 168/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L168
M991 S0 P167 ;notify layer change
G17
G3 Z33.8 I-.935 J.779 P1  F30000
G1 X129.914 Y128.484 Z33.8
G1 Z33.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.208 Y127.153 I-.692 J-.486 E.11448
G1 X129.257 Y127.153 E.00162
G3 X129.946 Y128.434 I-.035 J.845 E.05808
G1 X130.24 Y128.712 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.232 Y128.708 E.00026
G3 X129.195 Y126.761 I-1.012 J-.711 E.15507
G1 X129.275 Y126.762 E.00243
G3 X130.35 Y128.501 I-.055 J1.236 E.07396
G1 X130.268 Y128.659 E.00546
M204 S10000
G1 X129.663 Y127.941 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.55 Y127.689 E.00849
G1 X129.316 Y127.567 E.00811
G1 X129.083 Y127.572 E.00716
G1 X128.873 Y127.734 E.00815
G1 X128.775 Y127.978 E.00807
G1 X128.849 Y128.23 E.00808
G1 X129.04 Y128.41 E.00807
G1 X129.302 Y128.435 E.00808
G1 X129.541 Y128.321 E.00816
G1 X129.656 Y128.102 E.00759
G1 X129.661 Y128.001 E.00311
; CHANGE_LAYER
; Z_HEIGHT: 33.8
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.656 Y128.102 E-.03852
G1 X129.541 Y128.321 E-.09383
G1 X129.302 Y128.435 E-.10094
G1 X129.04 Y128.41 E-.09987
G1 X128.849 Y128.23 E-.09985
G1 X128.775 Y127.978 E-.09998
G1 X128.873 Y127.734 E-.09984
G1 X129.083 Y127.572 E-.10076
G1 X129.153 Y127.571 E-.02639
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 169/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L169
M991 S0 P168 ;notify layer change
G17
G3 Z34 I-.935 J.779 P1  F30000
G1 X129.914 Y128.484 Z34
G1 Z33.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.208 Y127.153 I-.692 J-.486 E.11448
G1 X129.256 Y127.153 E.00162
G3 X129.946 Y128.434 I-.034 J.845 E.05808
G1 X130.24 Y128.711 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.232 Y128.708 E.00026
G3 X129.195 Y126.761 I-1.012 J-.711 E.15507
G1 X129.274 Y126.761 E.00243
G3 X130.35 Y128.5 I-.054 J1.236 E.07396
G1 X130.268 Y128.658 E.00546
M204 S10000
G1 X129.663 Y127.941 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.551 Y127.689 E.00848
G1 X129.316 Y127.567 E.00812
G1 X129.083 Y127.572 E.00715
G1 X128.873 Y127.734 E.00815
G1 X128.775 Y127.978 E.00807
G1 X128.849 Y128.23 E.00808
G1 X129.04 Y128.41 E.00807
G1 X129.302 Y128.435 E.00808
G1 X129.541 Y128.321 E.00816
G1 X129.657 Y128.102 E.00759
G1 X129.661 Y128.001 E.00311
; CHANGE_LAYER
; Z_HEIGHT: 34
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.657 Y128.102 E-.03852
G1 X129.541 Y128.321 E-.09389
G1 X129.302 Y128.435 E-.10093
G1 X129.04 Y128.41 E-.09987
G1 X128.849 Y128.23 E-.09985
G1 X128.775 Y127.978 E-.09998
G1 X128.873 Y127.734 E-.09984
G1 X129.083 Y127.572 E-.10077
G1 X129.153 Y127.571 E-.02635
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 170/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L170
M991 S0 P169 ;notify layer change
G17
G3 Z34.2 I-.935 J.779 P1  F30000
G1 X129.914 Y128.484 Z34.2
G1 Z34
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.208 Y127.153 I-.692 J-.486 E.11449
G1 X129.256 Y127.153 E.00161
G3 X129.946 Y128.433 I-.034 J.845 E.05808
G1 X130.24 Y128.711 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M73 P79 R2
G1 F1200
G1 X130.233 Y128.708 E.00026
G3 X129.195 Y126.761 I-1.012 J-.71 E.15508
G1 X129.274 Y126.761 E.00242
G3 X130.35 Y128.5 I-.054 J1.236 E.07396
G1 X130.268 Y128.658 E.00545
M204 S10000
G1 X129.663 Y127.941 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.551 Y127.689 E.00848
G1 X129.316 Y127.567 E.00813
G1 X129.083 Y127.572 E.00714
G1 X128.873 Y127.734 E.00815
G1 X128.775 Y127.978 E.00807
G1 X128.848 Y128.23 E.00808
G1 X129.04 Y128.41 E.00807
G1 X129.302 Y128.435 E.00808
G1 X129.541 Y128.321 E.00816
G1 X129.657 Y128.102 E.0076
G1 X129.661 Y128.001 E.00311
; CHANGE_LAYER
; Z_HEIGHT: 34.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.657 Y128.102 E-.03851
G1 X129.541 Y128.321 E-.09396
G1 X129.302 Y128.435 E-.1009
G1 X129.04 Y128.41 E-.09988
G1 X128.848 Y128.23 E-.09986
G1 X128.775 Y127.978 E-.09997
G1 X128.873 Y127.734 E-.09985
G1 X129.083 Y127.572 E-.10077
G1 X129.153 Y127.571 E-.0263
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 171/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L171
M991 S0 P170 ;notify layer change
G17
G3 Z34.4 I-.935 J.779 P1  F30000
G1 X129.914 Y128.484 Z34.4
G1 Z34.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.208 Y127.153 I-.692 J-.486 E.1145
G1 X129.256 Y127.153 E.0016
G3 X129.947 Y128.433 I-.034 J.845 E.05809
G1 X130.241 Y128.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.233 Y128.707 E.00026
G3 X129.195 Y126.761 I-1.013 J-.71 E.15509
G1 X129.274 Y126.761 E.00241
G3 X130.35 Y128.5 I-.054 J1.236 E.07395
G1 X130.268 Y128.657 E.00545
M204 S10000
G1 X129.663 Y127.941 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.551 Y127.689 E.00847
G1 X129.316 Y127.567 E.00814
G1 X129.083 Y127.572 E.00713
G1 X128.873 Y127.734 E.00815
G1 X128.775 Y127.978 E.00807
G1 X128.848 Y128.23 E.00808
G1 X129.04 Y128.41 E.00807
G1 X129.302 Y128.435 E.00808
G1 X129.541 Y128.321 E.00816
G1 X129.657 Y128.102 E.0076
G1 X129.661 Y128.001 E.00311
; CHANGE_LAYER
; Z_HEIGHT: 34.4
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.657 Y128.102 E-.0385
G1 X129.541 Y128.321 E-.09401
G1 X129.302 Y128.435 E-.10089
G1 X129.04 Y128.41 E-.09987
G1 X128.848 Y128.23 E-.09986
G1 X128.775 Y127.978 E-.09997
G1 X128.873 Y127.734 E-.09985
G1 X129.083 Y127.572 E-.10078
G1 X129.153 Y127.571 E-.02626
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 172/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L172
M991 S0 P171 ;notify layer change
G17
G3 Z34.6 I-.935 J.779 P1  F30000
G1 X129.914 Y128.483 Z34.6
G1 Z34.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.208 Y127.153 I-.692 J-.486 E.1145
G1 X129.256 Y127.153 E.00159
G3 X129.947 Y128.433 I-.034 J.845 E.05809
G1 X130.241 Y128.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.233 Y128.707 E.00026
G3 X129.195 Y126.761 I-1.013 J-.71 E.15509
G1 X129.274 Y126.761 E.0024
G3 X130.35 Y128.5 I-.053 J1.236 E.07395
G1 X130.269 Y128.657 E.00544
M204 S10000
G1 X129.663 Y127.941 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.551 Y127.689 E.00847
G1 X129.315 Y127.567 E.00815
G1 X129.083 Y127.572 E.00713
G1 X128.873 Y127.734 E.00815
G1 X128.775 Y127.978 E.00807
G1 X128.848 Y128.23 E.00808
G1 X129.04 Y128.41 E.00808
G1 X129.302 Y128.435 E.00808
G1 X129.541 Y128.321 E.00816
G1 X129.657 Y128.102 E.00761
G1 X129.661 Y128.001 E.00311
; CHANGE_LAYER
; Z_HEIGHT: 34.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.657 Y128.102 E-.0385
G1 X129.541 Y128.321 E-.09407
G1 X129.302 Y128.435 E-.10087
G1 X129.04 Y128.41 E-.09987
G1 X128.848 Y128.23 E-.09986
G1 X128.775 Y127.978 E-.09997
G1 X128.873 Y127.734 E-.09984
G1 X129.083 Y127.572 E-.10078
G1 X129.152 Y127.571 E-.02622
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 173/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L173
M991 S0 P172 ;notify layer change
G17
G3 Z34.8 I-.934 J.78 P1  F30000
G1 X129.914 Y128.483 Z34.8
G1 Z34.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.208 Y127.153 I-.692 J-.485 E.11451
G1 X129.256 Y127.153 E.00158
G3 X129.947 Y128.433 I-.034 J.845 E.05809
G1 X130.241 Y128.709 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.233 Y128.707 E.00027
G3 X129.195 Y126.761 I-1.013 J-.71 E.1551
G1 X129.273 Y126.761 E.00239
G3 X130.35 Y128.499 I-.053 J1.236 E.07395
G1 X130.269 Y128.656 E.00543
M204 S10000
G1 X129.663 Y127.941 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.551 Y127.689 E.00846
G1 X129.315 Y127.567 E.00816
G1 X129.083 Y127.572 E.00712
G1 X128.873 Y127.734 E.00815
G1 X128.775 Y127.978 E.00807
G1 X128.848 Y128.23 E.00808
G1 X129.04 Y128.41 E.00807
G1 X129.302 Y128.435 E.00808
G1 X129.541 Y128.321 E.00816
G1 X129.657 Y128.102 E.00761
G1 X129.661 Y128 E.00311
; CHANGE_LAYER
; Z_HEIGHT: 34.8
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.657 Y128.102 E-.0385
G1 X129.541 Y128.321 E-.09412
G1 X129.302 Y128.435 E-.10086
G1 X129.04 Y128.41 E-.09987
G1 X128.848 Y128.23 E-.09986
G1 X128.775 Y127.978 E-.09998
G1 X128.873 Y127.734 E-.09985
G1 X129.083 Y127.572 E-.10079
G1 X129.152 Y127.571 E-.02617
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 174/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L174
M991 S0 P173 ;notify layer change
G17
G3 Z35 I-.934 J.78 P1  F30000
G1 X129.914 Y128.483 Z35
G1 Z34.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.208 Y127.153 I-.692 J-.485 E.11452
G1 X129.255 Y127.153 E.00157
G3 X129.947 Y128.433 I-.033 J.845 E.05809
G1 X130.242 Y128.709 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.233 Y128.707 E.00027
G3 X129.196 Y126.761 I-1.013 J-.71 E.1551
G1 X129.273 Y126.761 E.00238
G3 X130.351 Y128.499 I-.053 J1.236 E.07395
G1 X130.269 Y128.656 E.00542
M204 S10000
G1 X129.663 Y127.94 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.551 Y127.689 E.00846
G1 X129.315 Y127.567 E.00817
G1 X129.083 Y127.572 E.00711
G1 X128.873 Y127.734 E.00815
G1 X128.775 Y127.978 E.00807
G1 X128.848 Y128.23 E.00808
G1 X129.04 Y128.41 E.00807
G1 X129.302 Y128.435 E.00808
G1 X129.541 Y128.321 E.00815
G1 X129.657 Y128.102 E.00762
G1 X129.661 Y128 E.00311
; CHANGE_LAYER
; Z_HEIGHT: 35
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.657 Y128.102 E-.03849
G1 X129.541 Y128.321 E-.09418
G1 X129.302 Y128.435 E-.10083
G1 X129.04 Y128.41 E-.09988
G1 X128.848 Y128.23 E-.09986
G1 X128.775 Y127.978 E-.09997
G1 X128.873 Y127.734 E-.09984
G1 X129.083 Y127.572 E-.1008
G1 X129.152 Y127.571 E-.02614
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 175/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L175
M991 S0 P174 ;notify layer change
G17
G3 Z35.2 I-.934 J.78 P1  F30000
G1 X129.914 Y128.483 Z35.2
G1 Z35
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.208 Y127.153 I-.692 J-.485 E.11452
G1 X129.255 Y127.153 E.00156
G3 X129.947 Y128.433 I-.033 J.845 E.0581
G1 X130.242 Y128.708 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.233 Y128.707 E.00027
G3 X129.196 Y126.761 I-1.013 J-.71 E.15511
G1 X129.273 Y126.761 E.00237
G3 X130.351 Y128.499 I-.053 J1.236 E.07395
G1 X130.27 Y128.655 E.00542
M204 S10000
G1 X129.663 Y127.94 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.551 Y127.689 E.00845
G1 X129.315 Y127.567 E.00818
G1 X129.083 Y127.572 E.0071
G1 X128.873 Y127.734 E.00815
G1 X128.775 Y127.978 E.00807
G1 X128.848 Y128.23 E.00808
G1 X129.04 Y128.41 E.00808
G1 X129.302 Y128.435 E.00808
G1 X129.541 Y128.321 E.00815
G1 X129.657 Y128.102 E.00762
G1 X129.661 Y128 E.00311
; CHANGE_LAYER
; Z_HEIGHT: 35.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.657 Y128.102 E-.0385
G1 X129.541 Y128.321 E-.09423
G1 X129.302 Y128.435 E-.10083
G1 X129.04 Y128.41 E-.09987
G1 X128.848 Y128.23 E-.09987
G1 X128.775 Y127.978 E-.09997
G1 X128.873 Y127.734 E-.09985
G1 X129.083 Y127.572 E-.1008
G1 X129.152 Y127.571 E-.02608
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 176/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L176
M991 S0 P175 ;notify layer change
G17
G3 Z35.4 I-.934 J.78 P1  F30000
G1 X129.914 Y128.483 Z35.4
G1 Z35.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.208 Y127.153 I-.692 J-.485 E.11453
G1 X129.255 Y127.153 E.00155
G3 X129.947 Y128.433 I-.033 J.845 E.0581
G1 X130.242 Y128.708 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.233 Y128.707 E.00027
G3 X129.196 Y126.761 I-1.013 J-.709 E.15512
G1 X129.272 Y126.761 E.00236
G3 X130.351 Y128.498 I-.052 J1.236 E.07395
G1 X130.27 Y128.655 E.00541
M204 S10000
G1 X129.663 Y127.94 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.551 Y127.689 E.00845
G1 X129.314 Y127.567 E.00819
G1 X129.083 Y127.572 E.00709
G1 X128.873 Y127.734 E.00815
G1 X128.775 Y127.978 E.00807
G1 X128.848 Y128.23 E.00808
G1 X129.04 Y128.41 E.00808
G1 X129.302 Y128.435 E.00808
M73 P80 R2
G1 X129.541 Y128.321 E.00815
G1 X129.657 Y128.101 E.00762
G1 X129.661 Y128 E.00311
; CHANGE_LAYER
; Z_HEIGHT: 35.4
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.657 Y128.101 E-.03848
G1 X129.541 Y128.321 E-.09429
G1 X129.302 Y128.435 E-.10082
G1 X129.04 Y128.41 E-.09987
G1 X128.848 Y128.23 E-.09986
G1 X128.775 Y127.978 E-.09997
G1 X128.873 Y127.734 E-.09985
G1 X129.083 Y127.572 E-.1008
G1 X129.152 Y127.571 E-.02605
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 177/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L177
M991 S0 P176 ;notify layer change
G17
G3 Z35.6 I-.934 J.78 P1  F30000
G1 X129.914 Y128.483 Z35.6
G1 Z35.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.208 Y127.153 I-.692 J-.485 E.11454
G1 X129.255 Y127.153 E.00154
G3 X129.947 Y128.432 I-.033 J.845 E.0581
G1 X130.242 Y128.708 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.234 Y128.706 E.00028
G3 X129.196 Y126.761 I-1.013 J-.709 E.15512
G1 X129.272 Y126.761 E.00236
G3 X130.351 Y128.498 I-.052 J1.236 E.07395
G1 X130.27 Y128.654 E.00541
M204 S10000
G1 X129.663 Y127.94 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.551 Y127.689 E.00844
G1 X129.314 Y127.567 E.0082
G1 X129.083 Y127.572 E.00709
G1 X128.873 Y127.734 E.00815
G1 X128.775 Y127.978 E.00807
G1 X128.848 Y128.23 E.00808
G1 X129.04 Y128.41 E.00808
G1 X129.302 Y128.435 E.00808
G1 X129.541 Y128.321 E.00815
G1 X129.657 Y128.101 E.00763
G1 X129.661 Y128 E.00311
; CHANGE_LAYER
; Z_HEIGHT: 35.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.657 Y128.101 E-.03849
G1 X129.541 Y128.321 E-.09435
G1 X129.302 Y128.435 E-.10079
G1 X129.04 Y128.41 E-.09988
G1 X128.848 Y128.23 E-.09986
G1 X128.775 Y127.978 E-.09997
G1 X128.873 Y127.734 E-.09985
G1 X129.083 Y127.572 E-.10081
G1 X129.152 Y127.571 E-.02601
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 178/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L178
M991 S0 P177 ;notify layer change
G17
G3 Z35.8 I-.934 J.78 P1  F30000
G1 X129.914 Y128.483 Z35.8
G1 Z35.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.208 Y127.153 I-.692 J-.485 E.11454
G1 X129.254 Y127.153 E.00153
G3 X129.947 Y128.432 I-.032 J.845 E.05811
G1 X130.243 Y128.707 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.234 Y128.706 E.00028
G3 X129.196 Y126.761 I-1.013 J-.709 E.15513
G1 X129.272 Y126.761 E.00235
G3 X130.351 Y128.498 I-.052 J1.236 E.07394
G1 X130.27 Y128.654 E.00541
M204 S10000
G1 X129.663 Y127.94 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.551 Y127.689 E.00843
G1 X129.314 Y127.567 E.0082
G1 X129.084 Y127.572 E.00708
G1 X128.873 Y127.734 E.00815
G1 X128.775 Y127.978 E.00807
G1 X128.848 Y128.23 E.00808
G1 X129.04 Y128.41 E.00808
G1 X129.302 Y128.435 E.00808
G1 X129.541 Y128.321 E.00815
G1 X129.657 Y128.101 E.00763
G1 X129.661 Y128 E.00311
; CHANGE_LAYER
; Z_HEIGHT: 35.8
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.657 Y128.101 E-.03848
G1 X129.541 Y128.321 E-.09441
G1 X129.302 Y128.435 E-.10077
G1 X129.04 Y128.41 E-.09988
G1 X128.848 Y128.23 E-.09987
G1 X128.775 Y127.978 E-.09997
G1 X128.873 Y127.734 E-.09985
G1 X129.084 Y127.572 E-.10082
G1 X129.152 Y127.571 E-.02595
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 179/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L179
M991 S0 P178 ;notify layer change
G17
G3 Z36 I-.934 J.781 P1  F30000
G1 X129.914 Y128.483 Z36
G1 Z35.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.208 Y127.153 I-.692 J-.485 E.11455
G1 X129.254 Y127.153 E.00153
G3 X129.947 Y128.432 I-.032 J.845 E.05811
G1 X130.243 Y128.707 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.234 Y128.706 E.00028
G3 X129.196 Y126.761 I-1.014 J-.709 E.15514
G1 X129.272 Y126.761 E.00234
G3 X130.351 Y128.497 I-.051 J1.236 E.07394
G1 X130.27 Y128.654 E.00541
M204 S10000
G1 X129.663 Y127.94 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.551 Y127.69 E.00843
G1 X129.314 Y127.567 E.00821
G1 X129.084 Y127.572 E.00707
G1 X128.873 Y127.734 E.00815
G1 X128.775 Y127.978 E.00807
G1 X128.848 Y128.23 E.00808
G1 X129.04 Y128.41 E.00807
G1 X129.302 Y128.435 E.00808
G1 X129.541 Y128.321 E.00815
G1 X129.657 Y128.101 E.00764
G1 X129.661 Y128 E.00311
; CHANGE_LAYER
; Z_HEIGHT: 36
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.657 Y128.101 E-.03848
G1 X129.541 Y128.321 E-.09446
G1 X129.302 Y128.435 E-.10075
G1 X129.04 Y128.41 E-.09988
G1 X128.848 Y128.23 E-.09986
G1 X128.775 Y127.978 E-.09997
G1 X128.873 Y127.734 E-.09985
G1 X129.084 Y127.572 E-.10082
G1 X129.152 Y127.571 E-.02592
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 180/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L180
M991 S0 P179 ;notify layer change
G17
G3 Z36.2 I-.933 J.781 P1  F30000
G1 X129.915 Y128.483 Z36.2
G1 Z36
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.208 Y127.153 I-.693 J-.485 E.11455
G1 X129.254 Y127.153 E.00152
G3 X129.947 Y128.432 I-.032 J.845 E.05811
G1 X130.243 Y128.707 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.234 Y128.706 E.00028
G3 X129.196 Y126.761 I-1.014 J-.709 E.15514
G1 X129.271 Y126.761 E.00233
G3 X130.352 Y128.497 I-.051 J1.236 E.07394
G1 X130.271 Y128.653 E.00541
M204 S10000
G1 X129.663 Y127.94 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.551 Y127.69 E.00842
G1 X129.313 Y127.567 E.00822
G1 X129.084 Y127.572 E.00706
G1 X128.873 Y127.734 E.00815
G1 X128.775 Y127.978 E.00807
G1 X128.848 Y128.23 E.00808
G1 X129.04 Y128.41 E.00808
G1 X129.302 Y128.435 E.00808
G1 X129.541 Y128.321 E.00815
G1 X129.657 Y128.101 E.00764
G1 X129.661 Y128 E.00311
; CHANGE_LAYER
; Z_HEIGHT: 36.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.657 Y128.101 E-.03847
G1 X129.541 Y128.321 E-.09451
G1 X129.302 Y128.435 E-.10076
G1 X129.04 Y128.41 E-.09987
G1 X128.848 Y128.23 E-.09987
G1 X128.775 Y127.978 E-.09997
G1 X128.873 Y127.734 E-.09985
G1 X129.084 Y127.572 E-.10083
G1 X129.152 Y127.571 E-.02588
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 181/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L181
M991 S0 P180 ;notify layer change
G17
G3 Z36.4 I-.933 J.781 P1  F30000
G1 X129.915 Y128.482 Z36.4
G1 Z36.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.208 Y127.153 I-.693 J-.484 E.11456
G1 X129.254 Y127.153 E.00151
G3 X129.947 Y128.432 I-.032 J.845 E.05812
G1 X130.243 Y128.707 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.234 Y128.706 E.00028
G3 X129.196 Y126.761 I-1.014 J-.709 E.15515
G1 X129.271 Y126.761 E.00232
G3 X130.352 Y128.497 I-.051 J1.236 E.07394
G1 X130.271 Y128.653 E.00542
M204 S10000
G1 X129.663 Y127.94 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.551 Y127.69 E.00842
G1 X129.313 Y127.567 E.00823
G1 X129.084 Y127.572 E.00706
G1 X128.873 Y127.734 E.00815
G1 X128.775 Y127.978 E.00807
G1 X128.848 Y128.23 E.00808
G1 X129.04 Y128.41 E.00808
G1 X129.302 Y128.435 E.00808
G1 X129.541 Y128.321 E.00814
G1 X129.657 Y128.101 E.00765
G1 X129.661 Y128 E.00311
; CHANGE_LAYER
; Z_HEIGHT: 36.4
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.657 Y128.101 E-.03846
G1 X129.541 Y128.321 E-.09459
G1 X129.302 Y128.435 E-.10073
G1 X129.04 Y128.41 E-.09988
G1 X128.848 Y128.23 E-.09986
G1 X128.775 Y127.978 E-.09997
G1 X128.873 Y127.734 E-.09985
G1 X129.084 Y127.572 E-.10084
G1 X129.152 Y127.571 E-.02583
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 182/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L182
M991 S0 P181 ;notify layer change
G17
G3 Z36.6 I-.933 J.781 P1  F30000
G1 X129.915 Y128.482 Z36.6
G1 Z36.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.208 Y127.153 I-.693 J-.484 E.11457
G1 X129.253 Y127.153 E.0015
G3 X129.947 Y128.432 I-.031 J.845 E.05812
G1 X130.243 Y128.706 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.234 Y128.705 E.00028
G3 X129.196 Y126.761 I-1.014 J-.708 E.15515
G1 X129.271 Y126.761 E.00231
G3 X130.352 Y128.497 I-.05 J1.236 E.07394
G1 X130.271 Y128.653 E.00542
M204 S10000
G1 X129.663 Y127.94 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.551 Y127.69 E.00841
G1 X129.313 Y127.567 E.00824
G1 X129.084 Y127.572 E.00705
G1 X128.873 Y127.734 E.00815
G1 X128.775 Y127.978 E.00807
G1 X128.848 Y128.23 E.00808
G1 X129.04 Y128.41 E.00808
G1 X129.302 Y128.435 E.00808
G1 X129.541 Y128.321 E.00814
G1 X129.657 Y128.101 E.00765
G1 X129.661 Y128 E.00311
; CHANGE_LAYER
; Z_HEIGHT: 36.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.657 Y128.101 E-.03847
G1 X129.541 Y128.321 E-.09463
G1 X129.302 Y128.435 E-.1007
G1 X129.04 Y128.41 E-.09989
G1 X128.848 Y128.23 E-.09987
G1 X128.775 Y127.978 E-.09997
G1 X128.873 Y127.734 E-.09985
G1 X129.084 Y127.572 E-.10084
G1 X129.151 Y127.57 E-.02578
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 183/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L183
M991 S0 P182 ;notify layer change
G17
G3 Z36.8 I-.933 J.781 P1  F30000
G1 X129.915 Y128.482 Z36.8
G1 Z36.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.208 Y127.153 I-.693 J-.484 E.11457
G1 X129.253 Y127.153 E.00149
G3 X129.947 Y128.432 I-.031 J.845 E.05813
G1 X130.243 Y128.706 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.234 Y128.705 E.00027
G3 X129.196 Y126.761 I-1.014 J-.708 E.15516
G1 X129.271 Y126.761 E.0023
G3 X130.352 Y128.496 I-.05 J1.236 E.07394
G1 X130.271 Y128.653 E.00543
M204 S10000
M73 P81 R2
G1 X129.663 Y127.94 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.551 Y127.69 E.00841
G1 X129.313 Y127.567 E.00825
G1 X129.084 Y127.572 E.00704
G1 X128.873 Y127.734 E.00815
G1 X128.775 Y127.978 E.00807
G1 X128.848 Y128.23 E.00808
G1 X129.04 Y128.41 E.00808
G1 X129.302 Y128.435 E.00808
G1 X129.541 Y128.321 E.00814
G1 X129.657 Y128.101 E.00766
G1 X129.661 Y128 E.00311
; CHANGE_LAYER
; Z_HEIGHT: 36.8
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.657 Y128.101 E-.03846
G1 X129.541 Y128.321 E-.0947
G1 X129.302 Y128.435 E-.10068
G1 X129.04 Y128.41 E-.09988
G1 X128.848 Y128.23 E-.09987
G1 X128.775 Y127.978 E-.09997
G1 X128.873 Y127.734 E-.09986
G1 X129.084 Y127.572 E-.10085
G1 X129.151 Y127.57 E-.02574
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 184/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L184
M991 S0 P183 ;notify layer change
G17
G3 Z37 I-.933 J.782 P1  F30000
G1 X129.915 Y128.482 Z37
G1 Z36.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.208 Y127.153 I-.693 J-.484 E.11458
G1 X129.253 Y127.153 E.00148
G3 X129.948 Y128.432 I-.031 J.845 E.05813
G1 X130.243 Y128.707 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.235 Y128.705 E.00027
G3 X129.196 Y126.761 I-1.014 J-.708 E.15516
G1 X129.27 Y126.761 E.00229
G3 X130.352 Y128.496 I-.05 J1.236 E.07394
G1 X130.271 Y128.653 E.00545
M204 S10000
G1 X129.663 Y127.939 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.551 Y127.69 E.0084
G1 X129.312 Y127.567 E.00826
G1 X129.084 Y127.572 E.00703
G1 X128.873 Y127.734 E.00815
G1 X128.775 Y127.978 E.00807
G1 X128.848 Y128.23 E.00808
G1 X129.04 Y128.41 E.00808
G1 X129.302 Y128.435 E.00808
G1 X129.541 Y128.321 E.00814
G1 X129.657 Y128.101 E.00766
G1 X129.661 Y127.999 E.00311
; CHANGE_LAYER
; Z_HEIGHT: 37
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.657 Y128.101 E-.03846
G1 X129.541 Y128.321 E-.09475
G1 X129.302 Y128.435 E-.10067
G1 X129.04 Y128.41 E-.09989
G1 X128.848 Y128.23 E-.09987
G1 X128.775 Y127.978 E-.09997
G1 X128.873 Y127.734 E-.09986
G1 X129.084 Y127.572 E-.10085
G1 X129.151 Y127.57 E-.02569
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 185/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L185
M991 S0 P184 ;notify layer change
G17
G3 Z37.2 I-.933 J.782 P1  F30000
G1 X129.915 Y128.482 Z37.2
G1 Z37
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.208 Y127.153 I-.693 J-.484 E.11458
G1 X129.253 Y127.153 E.00147
G3 X129.948 Y128.431 I-.031 J.845 E.05813
G1 X130.243 Y128.707 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.235 Y128.705 E.00026
G3 X129.196 Y126.761 I-1.014 J-.708 E.15517
G1 X129.27 Y126.761 E.00229
G3 X130.352 Y128.496 I-.05 J1.236 E.07394
G1 X130.271 Y128.653 E.00546
M204 S10000
G1 X129.663 Y127.939 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.551 Y127.69 E.0084
G1 X129.312 Y127.567 E.00827
G1 X129.084 Y127.572 E.00702
G1 X128.873 Y127.734 E.00816
G1 X128.775 Y127.978 E.00807
G1 X128.848 Y128.23 E.00808
G1 X129.04 Y128.41 E.00808
G1 X129.302 Y128.435 E.00808
G1 X129.541 Y128.321 E.00814
G1 X129.657 Y128.101 E.00767
G1 X129.661 Y127.999 E.00311
; CHANGE_LAYER
; Z_HEIGHT: 37.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.657 Y128.101 E-.03846
G1 X129.541 Y128.321 E-.0948
G1 X129.302 Y128.435 E-.10066
G1 X129.04 Y128.41 E-.09988
G1 X128.848 Y128.23 E-.09987
G1 X128.775 Y127.978 E-.09996
G1 X128.873 Y127.734 E-.09986
G1 X129.084 Y127.572 E-.10085
G1 X129.151 Y127.57 E-.02565
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 186/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L186
M991 S0 P185 ;notify layer change
G17
G3 Z37.4 I-.933 J.782 P1  F30000
G1 X129.915 Y128.482 Z37.4
G1 Z37.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.208 Y127.153 I-.693 J-.484 E.11459
G1 X129.252 Y127.153 E.00146
G3 X129.948 Y128.431 I-.03 J.845 E.05813
G1 X130.243 Y128.707 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.235 Y128.705 E.00026
G3 X129.196 Y126.761 I-1.014 J-.708 E.15518
G1 X129.27 Y126.761 E.00228
G3 X130.353 Y128.495 I-.049 J1.236 E.07394
G1 X130.271 Y128.654 E.00548
M204 S10000
G1 X129.663 Y127.939 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.551 Y127.69 E.00839
G1 X129.312 Y127.567 E.00828
G1 X129.084 Y127.572 E.00702
G1 X128.873 Y127.734 E.00816
G1 X128.775 Y127.978 E.00807
G1 X128.848 Y128.23 E.00808
G1 X129.04 Y128.41 E.00808
G1 X129.302 Y128.435 E.00808
G1 X129.541 Y128.321 E.00814
G1 X129.657 Y128.1 E.00767
G1 X129.661 Y127.999 E.00311
; CHANGE_LAYER
; Z_HEIGHT: 37.4
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.657 Y128.1 E-.03845
G1 X129.541 Y128.321 E-.09486
G1 X129.302 Y128.435 E-.10065
G1 X129.04 Y128.41 E-.09988
G1 X128.848 Y128.23 E-.09988
G1 X128.775 Y127.978 E-.09996
G1 X128.873 Y127.734 E-.09986
G1 X129.084 Y127.572 E-.10086
G1 X129.151 Y127.57 E-.02561
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 187/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L187
M991 S0 P186 ;notify layer change
G17
G3 Z37.6 I-.932 J.782 P1  F30000
G1 X129.915 Y128.482 Z37.6
G1 Z37.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.208 Y127.153 I-.693 J-.484 E.11459
G1 X129.252 Y127.153 E.00145
G3 X129.948 Y128.431 I-.03 J.845 E.05814
G1 X130.243 Y128.707 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.235 Y128.705 E.00025
G3 X129.196 Y126.761 I-1.014 J-.708 E.15518
G1 X129.269 Y126.761 E.00227
G3 X130.353 Y128.495 I-.049 J1.236 E.07394
G1 X130.27 Y128.654 E.00551
M204 S10000
G1 X129.663 Y127.939 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.552 Y127.69 E.00839
G1 X129.312 Y127.567 E.00829
G1 X129.084 Y127.572 E.00701
G1 X128.873 Y127.734 E.00816
G1 X128.775 Y127.978 E.00807
G1 X128.848 Y128.23 E.00808
G1 X129.04 Y128.41 E.00808
G1 X129.302 Y128.435 E.00808
G1 X129.541 Y128.321 E.00814
G1 X129.657 Y128.1 E.00768
G1 X129.661 Y127.999 E.00311
; CHANGE_LAYER
; Z_HEIGHT: 37.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.657 Y128.1 E-.03844
G1 X129.541 Y128.321 E-.09492
G1 X129.302 Y128.435 E-.10063
G1 X129.04 Y128.41 E-.09988
G1 X128.848 Y128.23 E-.09988
G1 X128.775 Y127.978 E-.09996
G1 X128.873 Y127.734 E-.09986
G1 X129.084 Y127.572 E-.10087
G1 X129.151 Y127.57 E-.02556
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 188/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L188
M991 S0 P187 ;notify layer change
G17
G3 Z37.8 I-.932 J.782 P1  F30000
G1 X129.915 Y128.482 Z37.8
G1 Z37.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.208 Y127.153 I-.693 J-.484 E.1146
G1 X129.252 Y127.153 E.00144
G3 X129.948 Y128.431 I-.03 J.845 E.05814
G1 X130.243 Y128.708 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.235 Y128.704 E.00025
G3 X129.196 Y126.761 I-1.015 J-.707 E.15519
G1 X129.269 Y126.761 E.00226
G3 X130.353 Y128.495 I-.049 J1.236 E.07393
G1 X130.27 Y128.655 E.00554
M204 S10000
G1 X129.663 Y127.939 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.552 Y127.69 E.00838
G1 X129.311 Y127.567 E.0083
G1 X129.084 Y127.572 E.007
G1 X128.873 Y127.734 E.00816
G1 X128.775 Y127.978 E.00807
G1 X128.848 Y128.23 E.00808
G1 X129.04 Y128.41 E.00808
G1 X129.302 Y128.435 E.00808
G1 X129.541 Y128.321 E.00813
G1 X129.657 Y128.1 E.00768
G1 X129.661 Y127.999 E.00311
; CHANGE_LAYER
; Z_HEIGHT: 37.8
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.657 Y128.1 E-.03844
G1 X129.541 Y128.321 E-.09498
G1 X129.302 Y128.435 E-.1006
G1 X129.04 Y128.41 E-.09989
G1 X128.848 Y128.23 E-.09987
G1 X128.775 Y127.978 E-.09996
G1 X128.873 Y127.734 E-.09986
G1 X129.084 Y127.572 E-.10087
G1 X129.151 Y127.57 E-.02552
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 189/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L189
M991 S0 P188 ;notify layer change
G17
G3 Z38 I-.932 J.782 P1  F30000
G1 X129.915 Y128.481 Z38
G1 Z37.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.209 Y127.153 I-.693 J-.484 E.1146
G1 X129.252 Y127.153 E.00143
G3 X129.948 Y128.431 I-.03 J.845 E.05814
G1 X130.242 Y128.708 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.235 Y128.704 E.00025
G3 X129.196 Y126.761 I-1.015 J-.707 E.15519
G1 X129.269 Y126.761 E.00225
G3 X130.353 Y128.494 I-.048 J1.236 E.07393
G1 X130.27 Y128.655 E.00557
M204 S10000
G1 X129.663 Y127.939 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.552 Y127.69 E.00838
G1 X129.311 Y127.567 E.00831
G1 X129.084 Y127.572 E.00699
G1 X128.873 Y127.734 E.00816
G1 X128.775 Y127.978 E.00807
G1 X128.848 Y128.23 E.00808
G1 X129.04 Y128.41 E.00808
G1 X129.302 Y128.435 E.00808
M73 P82 R2
G1 X129.541 Y128.321 E.00813
G1 X129.658 Y128.1 E.00768
G1 X129.661 Y127.999 E.00311
; CHANGE_LAYER
; Z_HEIGHT: 38
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.658 Y128.1 E-.03843
G1 X129.541 Y128.321 E-.09503
G1 X129.302 Y128.435 E-.10059
G1 X129.04 Y128.41 E-.09989
G1 X128.848 Y128.23 E-.09987
G1 X128.775 Y127.978 E-.09996
G1 X128.873 Y127.734 E-.09986
G1 X129.084 Y127.572 E-.10088
G1 X129.151 Y127.57 E-.02548
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 190/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L190
M991 S0 P189 ;notify layer change
G17
G3 Z38.2 I-.932 J.782 P1  F30000
G1 X129.916 Y128.481 Z38.2
G1 Z38
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.209 Y127.153 I-.693 J-.483 E.11461
G1 X129.252 Y127.153 E.00142
G3 X129.948 Y128.431 I-.029 J.845 E.05815
G1 X130.235 Y128.704 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.196 Y126.761 I-1.015 J-.707 E.1552
G1 X129.269 Y126.761 E.00224
G3 X130.269 Y128.654 I-.048 J1.236 E.0795
M204 S10000
G1 X129.663 Y127.939 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.552 Y127.69 E.00837
G1 X129.311 Y127.566 E.00832
G1 X129.084 Y127.572 E.00698
G1 X128.873 Y127.734 E.00816
G1 X128.775 Y127.978 E.00807
G1 X128.848 Y128.23 E.00808
G1 X129.04 Y128.41 E.00808
G1 X129.302 Y128.435 E.00808
G1 X129.541 Y128.321 E.00813
G1 X129.658 Y128.1 E.00769
G1 X129.661 Y127.999 E.00311
; CHANGE_LAYER
; Z_HEIGHT: 38.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.658 Y128.1 E-.03843
G1 X129.541 Y128.321 E-.09508
G1 X129.302 Y128.435 E-.10058
G1 X129.04 Y128.41 E-.09989
G1 X128.848 Y128.23 E-.09988
G1 X128.775 Y127.978 E-.09996
G1 X128.873 Y127.734 E-.09986
G1 X129.084 Y127.572 E-.10088
G1 X129.151 Y127.57 E-.02544
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 191/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L191
M991 S0 P190 ;notify layer change
G17
G3 Z38.4 I-.932 J.783 P1  F30000
G1 X129.916 Y128.481 Z38.4
G1 Z38.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.209 Y127.153 I-.693 J-.483 E.11461
G1 X129.251 Y127.153 E.00142
G3 X129.948 Y128.431 I-.029 J.845 E.05815
G1 X130.236 Y128.704 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.196 Y126.761 I-1.015 J-.707 E.1552
G1 X129.268 Y126.761 E.00223
G3 X130.269 Y128.654 I-.048 J1.236 E.07951
M204 S10000
G1 X129.663 Y127.939 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.552 Y127.69 E.00837
M73 P82 R1
G1 X129.324 Y127.569 E.00793
G1 X129.084 Y127.572 E.00738
G1 X128.873 Y127.734 E.00816
G1 X128.775 Y127.978 E.00808
G1 X128.848 Y128.23 E.00808
G1 X129.04 Y128.41 E.00808
G1 X129.302 Y128.435 E.00808
G1 X129.541 Y128.321 E.00813
G1 X129.658 Y128.1 E.00769
G1 X129.661 Y127.999 E.00311
; CHANGE_LAYER
; Z_HEIGHT: 38.4
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.658 Y128.1 E-.03844
G1 X129.541 Y128.321 E-.09514
G1 X129.302 Y128.435 E-.10057
G1 X129.04 Y128.41 E-.09988
G1 X128.848 Y128.23 E-.09988
G1 X128.775 Y127.978 E-.09996
G1 X128.873 Y127.734 E-.09987
G1 X129.084 Y127.572 E-.10089
G1 X129.151 Y127.571 E-.02538
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 192/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L192
M991 S0 P191 ;notify layer change
G17
G3 Z38.6 I-.931 J.783 P1  F30000
G1 X129.916 Y128.481 Z38.6
G1 Z38.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.209 Y127.153 I-.694 J-.483 E.11462
G1 X129.251 Y127.153 E.00141
G3 X129.948 Y128.431 I-.029 J.845 E.05816
G1 X130.24 Y128.711 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.085 Y128.882 E.00709
G3 X129.196 Y126.761 I-.865 J-.884 E.14804
G1 X129.268 Y126.761 E.00222
G3 X130.264 Y128.661 I-.047 J1.236 E.07977
M204 S10000
G1 X129.663 Y127.939 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.552 Y127.69 E.00836
G1 X129.324 Y127.57 E.00793
G1 X129.084 Y127.572 E.00738
G1 X128.873 Y127.734 E.00816
G1 X128.775 Y127.978 E.00808
G1 X128.848 Y128.23 E.00808
G1 X129.04 Y128.41 E.00808
G1 X129.302 Y128.435 E.00808
G1 X129.541 Y128.321 E.00813
G1 X129.658 Y128.1 E.0077
G1 X129.661 Y127.999 E.00311
; CHANGE_LAYER
; Z_HEIGHT: 38.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.658 Y128.1 E-.03843
G1 X129.541 Y128.321 E-.0952
G1 X129.302 Y128.435 E-.10055
G1 X129.04 Y128.41 E-.09989
G1 X128.848 Y128.23 E-.09988
G1 X128.775 Y127.978 E-.09996
G1 X128.873 Y127.734 E-.09986
G1 X129.084 Y127.572 E-.1009
G1 X129.15 Y127.571 E-.02534
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 193/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L193
M991 S0 P192 ;notify layer change
G17
G3 Z38.8 I-.931 J.783 P1  F30000
G1 X129.916 Y128.481 Z38.8
G1 Z38.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.209 Y127.153 I-.694 J-.483 E.11462
G1 X129.251 Y127.153 E.0014
G3 X129.948 Y128.431 I-.029 J.845 E.05816
G1 X130.239 Y128.712 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.085 Y128.882 E.00704
G3 X129.196 Y126.761 I-.865 J-.884 E.14804
G1 X129.268 Y126.761 E.00221
G3 X130.264 Y128.661 I-.047 J1.236 E.07979
M204 S10000
G1 X129.663 Y127.939 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.552 Y127.69 E.00836
G1 X129.324 Y127.57 E.00793
G1 X129.084 Y127.572 E.00737
G1 X128.873 Y127.734 E.00816
G1 X128.775 Y127.978 E.00808
G1 X128.848 Y128.23 E.00808
G1 X129.04 Y128.41 E.00808
G1 X129.302 Y128.435 E.00808
G1 X129.541 Y128.321 E.00813
G1 X129.658 Y128.1 E.0077
G1 X129.661 Y127.999 E.00311
; CHANGE_LAYER
; Z_HEIGHT: 38.8
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.658 Y128.1 E-.03843
G1 X129.541 Y128.321 E-.09525
G1 X129.302 Y128.435 E-.10053
G1 X129.04 Y128.41 E-.09989
G1 X128.848 Y128.23 E-.09988
G1 X128.775 Y127.978 E-.09996
G1 X128.873 Y127.734 E-.09986
G1 X129.084 Y127.572 E-.1009
G1 X129.15 Y127.571 E-.0253
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 194/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L194
M991 S0 P193 ;notify layer change
G17
G3 Z39 I-.931 J.784 P1  F30000
G1 X129.916 Y128.481 Z39
G1 Z38.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.209 Y127.153 I-.694 J-.483 E.11463
G1 X129.251 Y127.153 E.00139
G3 X129.948 Y128.43 I-.028 J.845 E.05816
G1 X130.238 Y128.713 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.085 Y128.882 E.00699
G3 X129.196 Y126.761 I-.865 J-.884 E.14804
G1 X129.268 Y126.761 E.00221
G3 X130.264 Y128.662 I-.047 J1.236 E.07982
M204 S10000
G1 X129.663 Y127.939 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.552 Y127.69 E.00835
G1 X129.324 Y127.57 E.00794
G1 X129.084 Y127.572 E.00737
G1 X128.873 Y127.734 E.00816
G1 X128.775 Y127.978 E.00808
G1 X128.848 Y128.23 E.00808
G1 X129.04 Y128.41 E.00808
G1 X129.302 Y128.435 E.00808
G1 X129.541 Y128.321 E.00813
G1 X129.658 Y128.1 E.00771
G1 X129.661 Y127.999 E.00311
; CHANGE_LAYER
; Z_HEIGHT: 39
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.658 Y128.1 E-.03842
G1 X129.541 Y128.321 E-.09531
G1 X129.302 Y128.435 E-.10052
G1 X129.04 Y128.41 E-.09989
G1 X128.848 Y128.23 E-.09988
G1 X128.775 Y127.978 E-.09996
G1 X128.873 Y127.734 E-.09986
G1 X129.084 Y127.572 E-.10091
G1 X129.15 Y127.571 E-.02526
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 195/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L195
M991 S0 P194 ;notify layer change
G17
G3 Z39.2 I-.931 J.784 P1  F30000
G1 X129.918 Y128.482 Z39.2
G1 Z39
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.209 Y127.153 I-.696 J-.483 E.11489
G1 X129.25 Y127.153 E.00138
G3 X129.95 Y128.432 I-.028 J.846 E.05823
G1 X130.237 Y128.714 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.088 Y128.884 E.00696
G3 X129.196 Y126.761 I-.867 J-.885 E.14835
G1 X129.267 Y126.761 E.0022
G3 X130.267 Y128.663 I-.047 J1.238 E.07989
M204 S10000
G1 X129.663 Y127.939 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.552 Y127.691 E.00835
G1 X129.324 Y127.57 E.00795
G1 X129.084 Y127.572 E.00737
G1 X128.873 Y127.734 E.00816
G1 X128.775 Y127.978 E.00807
G1 X128.848 Y128.23 E.00808
G1 X129.04 Y128.41 E.00808
G1 X129.302 Y128.435 E.00808
G1 X129.541 Y128.321 E.00813
G1 X129.658 Y128.099 E.00771
G1 X129.661 Y127.999 E.0031
; CHANGE_LAYER
; Z_HEIGHT: 39.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.658 Y128.099 E-.03831
G1 X129.541 Y128.321 E-.09538
G1 X129.302 Y128.435 E-.10049
G1 X129.04 Y128.41 E-.0999
G1 X128.848 Y128.23 E-.09987
G1 X128.775 Y127.978 E-.09997
G1 X128.873 Y127.734 E-.09986
G1 X129.084 Y127.572 E-.10092
G1 X129.15 Y127.571 E-.02531
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 196/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L196
M991 S0 P195 ;notify layer change
G17
G3 Z39.4 I-.93 J.784 P1  F30000
G1 X129.918 Y128.482 Z39.4
G1 Z39.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.209 Y127.153 I-.696 J-.483 E.11489
G1 X129.25 Y127.153 E.00137
G3 X129.951 Y128.431 I-.028 J.846 E.05824
G1 X130.236 Y128.715 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.088 Y128.884 E.00692
G3 X129.196 Y126.761 I-.867 J-.885 E.14835
G1 X129.267 Y126.761 E.00219
G3 X130.267 Y128.664 I-.046 J1.238 E.07994
M204 S10000
G1 X129.663 Y127.939 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.552 Y127.691 E.00834
G1 X129.324 Y127.57 E.00795
G1 X129.084 Y127.572 E.00737
G1 X128.873 Y127.734 E.00816
M73 P83 R1
G1 X128.775 Y127.978 E.00808
G1 X128.848 Y128.23 E.00808
G1 X129.04 Y128.41 E.00808
G1 X129.302 Y128.435 E.00808
G1 X129.541 Y128.321 E.00812
G1 X129.658 Y128.099 E.00772
G1 X129.661 Y127.999 E.0031
; CHANGE_LAYER
; Z_HEIGHT: 39.4
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.658 Y128.099 E-.03831
G1 X129.541 Y128.321 E-.09543
G1 X129.302 Y128.435 E-.10048
G1 X129.04 Y128.41 E-.0999
G1 X128.848 Y128.23 E-.09988
G1 X128.775 Y127.978 E-.09995
G1 X128.873 Y127.734 E-.09986
G1 X129.084 Y127.572 E-.10093
G1 X129.15 Y127.571 E-.02526
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 197/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L197
M991 S0 P196 ;notify layer change
G17
G3 Z39.6 I-.93 J.785 P1  F30000
G1 X129.918 Y128.482 Z39.6
G1 Z39.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.209 Y127.153 I-.696 J-.482 E.1149
G1 X129.25 Y127.153 E.00136
G3 X129.951 Y128.431 I-.028 J.846 E.05824
G1 X130.236 Y128.716 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.088 Y128.884 E.00688
G3 X129.196 Y126.761 I-.867 J-.885 E.14835
G1 X129.267 Y126.761 E.00218
G3 X130.266 Y128.665 I-.046 J1.238 E.07998
M204 S10000
G1 X129.663 Y127.939 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.552 Y127.691 E.00834
G1 X129.323 Y127.57 E.00795
G1 X129.084 Y127.572 E.00736
G1 X128.873 Y127.734 E.00816
G1 X128.775 Y127.978 E.00807
G1 X128.848 Y128.23 E.00808
G1 X129.04 Y128.41 E.00808
G1 X129.302 Y128.435 E.00808
G1 X129.541 Y128.321 E.00812
G1 X129.658 Y128.099 E.00772
G1 X129.661 Y127.999 E.0031
; CHANGE_LAYER
; Z_HEIGHT: 39.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.658 Y128.099 E-.03831
G1 X129.541 Y128.321 E-.09548
G1 X129.302 Y128.435 E-.10047
G1 X129.04 Y128.41 E-.09989
G1 X128.848 Y128.23 E-.09988
G1 X128.775 Y127.978 E-.09996
G1 X128.873 Y127.734 E-.09986
G1 X129.084 Y127.572 E-.10093
G1 X129.15 Y127.571 E-.02522
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 198/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L198
M991 S0 P197 ;notify layer change
G17
G3 Z39.8 I-.93 J.785 P1  F30000
G1 X129.918 Y128.482 Z39.8
G1 Z39.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.209 Y127.153 I-.696 J-.482 E.1149
G1 X129.25 Y127.153 E.00135
G3 X129.951 Y128.431 I-.027 J.846 E.05825
G1 X130.235 Y128.717 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.088 Y128.884 E.00685
G3 X129.196 Y126.761 I-.867 J-.885 E.14835
G1 X129.266 Y126.761 E.00217
G3 X130.266 Y128.666 I-.046 J1.238 E.08002
M204 S10000
G1 X129.663 Y127.938 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.552 Y127.691 E.00833
G1 X129.323 Y127.57 E.00796
G1 X129.084 Y127.572 E.00736
G1 X128.873 Y127.734 E.00816
G1 X128.775 Y127.978 E.00807
G1 X128.848 Y128.23 E.00808
G1 X129.04 Y128.41 E.00808
G1 X129.302 Y128.435 E.00808
G1 X129.54 Y128.321 E.00812
G1 X129.658 Y128.099 E.00773
G1 X129.661 Y127.998 E.0031
; CHANGE_LAYER
; Z_HEIGHT: 39.8
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.658 Y128.099 E-.0383
G1 X129.54 Y128.321 E-.09554
G1 X129.302 Y128.435 E-.10046
G1 X129.04 Y128.41 E-.09989
G1 X128.848 Y128.23 E-.09988
G1 X128.775 Y127.978 E-.09996
G1 X128.873 Y127.734 E-.09986
G1 X129.084 Y127.572 E-.10094
G1 X129.15 Y127.571 E-.02518
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 199/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L199
M991 S0 P198 ;notify layer change
G17
G3 Z40 I-.93 J.785 P1  F30000
G1 X129.918 Y128.482 Z40
G1 Z39.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.209 Y127.153 I-.696 J-.482 E.11491
G1 X129.249 Y127.153 E.00134
G3 X129.951 Y128.431 I-.027 J.846 E.05825
G1 X130.234 Y128.718 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.088 Y128.884 E.00682
G3 X129.196 Y126.761 I-.867 J-.885 E.14834
G1 X129.266 Y126.761 E.00216
G3 X130.265 Y128.666 I-.045 J1.238 E.08005
M204 S10000
G1 X129.663 Y127.938 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.552 Y127.691 E.00833
G1 X129.323 Y127.57 E.00796
G1 X129.084 Y127.572 E.00736
G1 X128.873 Y127.734 E.00816
G1 X128.775 Y127.978 E.00808
G1 X128.848 Y128.23 E.00808
G1 X129.04 Y128.41 E.00808
G1 X129.302 Y128.435 E.00808
G1 X129.54 Y128.321 E.00812
G1 X129.658 Y128.099 E.00773
G1 X129.661 Y127.998 E.0031
; CHANGE_LAYER
; Z_HEIGHT: 40
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.658 Y128.099 E-.03829
G1 X129.54 Y128.321 E-.09561
G1 X129.302 Y128.435 E-.10043
G1 X129.04 Y128.41 E-.09989
G1 X128.848 Y128.23 E-.09988
G1 X128.775 Y127.978 E-.09996
G1 X128.873 Y127.734 E-.09987
G1 X129.084 Y127.572 E-.10094
G1 X129.15 Y127.571 E-.02514
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 200/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L200
M991 S0 P199 ;notify layer change
G17
G3 Z40.2 I-.93 J.785 P1  F30000
G1 X129.918 Y128.482 Z40.2
G1 Z40
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.209 Y127.153 I-.696 J-.482 E.11491
G1 X129.249 Y127.153 E.00133
G3 X129.951 Y128.431 I-.027 J.846 E.05826
G1 X130.234 Y128.718 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.088 Y128.884 E.0068
G3 X129.196 Y126.761 I-.867 J-.885 E.14834
G1 X129.266 Y126.761 E.00215
G3 X130.265 Y128.667 I-.045 J1.238 E.08008
M204 S10000
G1 X129.663 Y127.938 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.552 Y127.691 E.00832
G1 X129.323 Y127.57 E.00796
G1 X129.084 Y127.572 E.00736
G1 X128.873 Y127.734 E.00816
G1 X128.775 Y127.978 E.00808
G1 X128.848 Y128.23 E.00808
G1 X129.04 Y128.41 E.00808
G1 X129.302 Y128.435 E.00808
G1 X129.54 Y128.322 E.00812
G1 X129.658 Y128.099 E.00774
G1 X129.661 Y127.998 E.0031
; CHANGE_LAYER
; Z_HEIGHT: 40.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.658 Y128.099 E-.03829
G1 X129.54 Y128.322 E-.09566
G1 X129.302 Y128.435 E-.10042
G1 X129.04 Y128.41 E-.0999
G1 X128.848 Y128.23 E-.09988
G1 X128.775 Y127.978 E-.09995
G1 X128.873 Y127.734 E-.09987
G1 X129.084 Y127.572 E-.10094
G1 X129.15 Y127.571 E-.02509
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 201/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L201
M991 S0 P200 ;notify layer change
G17
G3 Z40.4 I-.93 J.785 P1  F30000
G1 X129.919 Y128.481 Z40.4
G1 Z40.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.209 Y127.153 I-.696 J-.482 E.11491
G1 X129.249 Y127.153 E.00133
G3 X129.951 Y128.431 I-.027 J.846 E.05826
G1 X130.234 Y128.718 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.088 Y128.884 E.00679
G3 X129.196 Y126.761 I-.867 J-.885 E.14834
G1 X129.266 Y126.761 E.00214
G3 X130.265 Y128.667 I-.045 J1.238 E.0801
M204 S10000
G1 X129.663 Y127.938 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.552 Y127.691 E.00832
G1 X129.323 Y127.57 E.00797
G1 X129.084 Y127.572 E.00736
G1 X128.873 Y127.734 E.00816
G1 X128.775 Y127.978 E.00808
G1 X128.848 Y128.23 E.00808
G1 X129.04 Y128.41 E.00808
G1 X129.302 Y128.435 E.00808
G1 X129.54 Y128.322 E.00812
G1 X129.658 Y128.099 E.00774
G1 X129.661 Y127.998 E.0031
; CHANGE_LAYER
; Z_HEIGHT: 40.4
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.658 Y128.099 E-.03829
G1 X129.54 Y128.322 E-.09571
G1 X129.302 Y128.435 E-.1004
G1 X129.04 Y128.41 E-.0999
G1 X128.848 Y128.23 E-.09988
G1 X128.775 Y127.978 E-.09995
G1 X128.873 Y127.734 E-.09987
G1 X129.084 Y127.572 E-.10095
G1 X129.15 Y127.571 E-.02504
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 202/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L202
M991 S0 P201 ;notify layer change
G17
G3 Z40.6 I-.93 J.785 P1  F30000
G1 X129.919 Y128.481 Z40.6
G1 Z40.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.209 Y127.153 I-.696 J-.482 E.11492
G1 X129.249 Y127.153 E.00132
G3 X129.951 Y128.431 I-.026 J.846 E.05826
G1 X130.234 Y128.718 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.088 Y128.884 E.00679
G3 X129.196 Y126.761 I-.867 J-.885 E.14834
G1 X129.265 Y126.761 E.00214
G3 X130.265 Y128.667 I-.044 J1.238 E.08011
M204 S10000
G1 X129.663 Y127.938 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.552 Y127.691 E.00831
G1 X129.323 Y127.57 E.00797
G1 X129.084 Y127.572 E.00735
G1 X128.873 Y127.734 E.00816
G1 X128.775 Y127.978 E.00808
G1 X128.848 Y128.23 E.00808
G1 X129.04 Y128.41 E.00808
G1 X129.302 Y128.435 E.00808
G1 X129.54 Y128.322 E.00812
G1 X129.658 Y128.099 E.00774
G1 X129.661 Y127.998 E.0031
; CHANGE_LAYER
; Z_HEIGHT: 40.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
M73 P84 R1
G1 X129.658 Y128.099 E-.03829
G1 X129.54 Y128.322 E-.09577
G1 X129.302 Y128.435 E-.10039
G1 X129.04 Y128.41 E-.09989
G1 X128.848 Y128.23 E-.0999
G1 X128.775 Y127.978 E-.09995
G1 X128.873 Y127.734 E-.09988
G1 X129.084 Y127.572 E-.10095
G1 X129.15 Y127.571 E-.025
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 203/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L203
M991 S0 P202 ;notify layer change
G17
G3 Z40.8 I-.929 J.786 P1  F30000
G1 X129.919 Y128.481 Z40.8
G1 Z40.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.209 Y127.153 I-.696 J-.482 E.11493
G1 X129.249 Y127.153 E.00131
G3 X129.951 Y128.431 I-.026 J.846 E.05827
G1 X130.234 Y128.718 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.088 Y128.884 E.0068
G3 X129.196 Y126.761 I-.867 J-.885 E.14833
G1 X129.265 Y126.761 E.00213
G3 X130.265 Y128.667 I-.044 J1.238 E.08012
M204 S10000
G1 X129.663 Y127.938 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.553 Y127.691 E.00831
G1 X129.323 Y127.57 E.00798
G1 X129.084 Y127.572 E.00735
G1 X128.873 Y127.734 E.00816
G1 X128.775 Y127.978 E.00808
G1 X128.848 Y128.23 E.00808
G1 X129.04 Y128.41 E.00808
G1 X129.302 Y128.435 E.00808
G1 X129.54 Y128.322 E.00812
G1 X129.658 Y128.099 E.00775
G1 X129.661 Y127.998 E.0031
; CHANGE_LAYER
; Z_HEIGHT: 40.8
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.658 Y128.099 E-.03828
G1 X129.54 Y128.322 E-.09583
G1 X129.302 Y128.435 E-.10037
G1 X129.04 Y128.41 E-.0999
G1 X128.848 Y128.23 E-.09988
G1 X128.775 Y127.978 E-.09995
G1 X128.873 Y127.734 E-.09988
G1 X129.084 Y127.572 E-.10096
G1 X129.15 Y127.571 E-.02496
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 204/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L204
M991 S0 P203 ;notify layer change
G17
G3 Z41 I-.929 J.786 P1  F30000
G1 X129.919 Y128.481 Z41
G1 Z40.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.209 Y127.153 I-.696 J-.482 E.11493
G1 X129.248 Y127.153 E.0013
G3 X129.951 Y128.431 I-.026 J.846 E.05827
G1 X130.234 Y128.717 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.088 Y128.885 E.00682
G3 X129.196 Y126.761 I-.867 J-.885 E.14833
G1 X129.265 Y126.761 E.00212
G3 X130.265 Y128.666 I-.044 J1.238 E.08011
M204 S10000
G1 X129.663 Y127.938 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.553 Y127.691 E.0083
G1 X129.323 Y127.57 E.00798
G1 X129.084 Y127.572 E.00735
G1 X128.873 Y127.734 E.00816
G1 X128.775 Y127.978 E.00808
G1 X128.848 Y128.23 E.00808
G1 X129.04 Y128.41 E.00808
G1 X129.302 Y128.435 E.00808
G1 X129.54 Y128.322 E.00811
G1 X129.658 Y128.099 E.00775
G1 X129.661 Y127.998 E.0031
; CHANGE_LAYER
; Z_HEIGHT: 41
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.658 Y128.099 E-.03828
G1 X129.54 Y128.322 E-.09588
G1 X129.302 Y128.435 E-.10035
G1 X129.04 Y128.41 E-.0999
G1 X128.848 Y128.23 E-.09989
G1 X128.775 Y127.978 E-.09995
G1 X128.873 Y127.734 E-.09987
G1 X129.084 Y127.572 E-.10097
G1 X129.149 Y127.571 E-.02491
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 205/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L205
M991 S0 P204 ;notify layer change
G17
G3 Z41.2 I-.929 J.786 P1  F30000
G1 X129.919 Y128.481 Z41.2
G1 Z41
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.209 Y127.153 I-.697 J-.482 E.11494
G1 X129.248 Y127.153 E.00129
G3 X129.951 Y128.43 I-.026 J.846 E.05828
G1 X130.235 Y128.717 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.088 Y128.885 E.00685
G3 X129.196 Y126.761 I-.867 J-.885 E.14833
G1 X129.265 Y126.761 E.00211
G3 X130.266 Y128.665 I-.043 J1.238 E.08009
M204 S10000
G1 X129.662 Y127.938 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.553 Y127.691 E.0083
G1 X129.323 Y127.57 E.00798
G1 X129.084 Y127.572 E.00735
G1 X128.873 Y127.734 E.00816
G1 X128.775 Y127.978 E.00808
G1 X128.848 Y128.23 E.00808
G1 X129.04 Y128.41 E.00808
G1 X129.302 Y128.435 E.00808
G1 X129.54 Y128.322 E.00811
G1 X129.658 Y128.098 E.00776
G1 X129.661 Y127.998 E.00309
; CHANGE_LAYER
; Z_HEIGHT: 41.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.658 Y128.098 E-.03827
G1 X129.54 Y128.322 E-.09594
G1 X129.302 Y128.435 E-.10033
G1 X129.04 Y128.41 E-.09991
G1 X128.848 Y128.23 E-.09988
G1 X128.775 Y127.978 E-.09995
G1 X128.873 Y127.734 E-.09987
G1 X129.084 Y127.572 E-.10097
G1 X129.149 Y127.571 E-.02487
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 206/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L206
M991 S0 P205 ;notify layer change
G17
G3 Z41.4 I-.929 J.786 P1  F30000
G1 X129.919 Y128.481 Z41.4
G1 Z41.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.209 Y127.153 I-.697 J-.481 E.11494
G1 X129.248 Y127.153 E.00128
G3 X129.951 Y128.43 I-.025 J.846 E.05828
G1 X130.236 Y128.715 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.088 Y128.885 E.0069
G3 X129.196 Y126.761 I-.867 J-.885 E.14833
G1 X129.264 Y126.761 E.0021
G3 X130.267 Y128.664 I-.043 J1.238 E.08005
M204 S10000
G1 X129.662 Y127.938 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.553 Y127.691 E.00829
G1 X129.323 Y127.57 E.00799
G1 X129.084 Y127.572 E.00735
G1 X128.873 Y127.734 E.00816
G1 X128.775 Y127.978 E.00808
G1 X128.848 Y128.23 E.00808
G1 X129.04 Y128.41 E.00808
G1 X129.302 Y128.435 E.00808
G1 X129.54 Y128.322 E.00811
G1 X129.658 Y128.098 E.00776
G1 X129.661 Y127.998 E.00309
; CHANGE_LAYER
; Z_HEIGHT: 41.4
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.658 Y128.098 E-.03826
G1 X129.54 Y128.322 E-.096
G1 X129.302 Y128.435 E-.10033
G1 X129.04 Y128.41 E-.0999
G1 X128.848 Y128.23 E-.09988
G1 X128.775 Y127.978 E-.09996
G1 X128.873 Y127.734 E-.09987
G1 X129.084 Y127.572 E-.10097
G1 X129.149 Y127.571 E-.02483
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 207/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L207
M991 S0 P206 ;notify layer change
G17
G3 Z41.6 I-.929 J.786 P1  F30000
G1 X129.919 Y128.481 Z41.6
G1 Z41.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.209 Y127.153 I-.697 J-.481 E.11495
G1 X129.248 Y127.153 E.00127
G3 X129.952 Y128.43 I-.025 J.846 E.05829
G1 X130.237 Y128.714 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.088 Y128.885 E.00696
G3 X129.196 Y126.761 I-.867 J-.885 E.14832
G1 X129.264 Y126.761 E.00209
G3 X130.268 Y128.663 I-.043 J1.238 E.08
M204 S10000
G1 X129.662 Y127.938 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.553 Y127.691 E.00829
G1 X129.323 Y127.57 E.00799
G1 X129.084 Y127.572 E.00734
G1 X128.873 Y127.734 E.00817
G1 X128.775 Y127.978 E.00808
G1 X128.848 Y128.23 E.00808
G1 X129.04 Y128.41 E.00808
G1 X129.302 Y128.435 E.00808
G1 X129.54 Y128.322 E.00811
G1 X129.658 Y128.098 E.00777
G1 X129.661 Y127.998 E.00309
; CHANGE_LAYER
; Z_HEIGHT: 41.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.658 Y128.098 E-.03827
G1 X129.54 Y128.322 E-.09604
G1 X129.302 Y128.435 E-.1003
G1 X129.04 Y128.41 E-.0999
G1 X128.848 Y128.23 E-.09989
G1 X128.775 Y127.978 E-.09995
G1 X128.873 Y127.734 E-.09988
G1 X129.084 Y127.572 E-.10098
G1 X129.149 Y127.571 E-.02478
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 208/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L208
M991 S0 P207 ;notify layer change
G17
G3 Z41.8 I-.929 J.786 P1  F30000
G1 X129.919 Y128.481 Z41.8
G1 Z41.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.209 Y127.153 I-.697 J-.481 E.11495
G1 X129.247 Y127.153 E.00126
G3 X129.952 Y128.43 I-.025 J.846 E.05829
G1 X130.239 Y128.712 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.088 Y128.885 E.00704
G3 X129.196 Y126.761 I-.867 J-.885 E.14832
G1 X129.264 Y126.761 E.00208
G3 X130.269 Y128.661 I-.042 J1.238 E.07994
M204 S10000
G1 X129.662 Y127.938 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.553 Y127.691 E.00828
G1 X129.323 Y127.57 E.00799
G1 X129.084 Y127.572 E.00734
G1 X128.873 Y127.734 E.00816
G1 X128.775 Y127.978 E.00808
G1 X128.848 Y128.23 E.00808
G1 X129.04 Y128.41 E.00808
G1 X129.302 Y128.435 E.00808
G1 X129.54 Y128.322 E.00811
G1 X129.658 Y128.098 E.00777
G1 X129.661 Y127.998 E.00309
; CHANGE_LAYER
; Z_HEIGHT: 41.8
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.658 Y128.098 E-.03827
G1 X129.54 Y128.322 E-.09609
G1 X129.302 Y128.435 E-.1003
G1 X129.04 Y128.41 E-.0999
G1 X128.848 Y128.23 E-.09989
G1 X128.775 Y127.978 E-.09994
G1 X128.873 Y127.734 E-.09988
G1 X129.084 Y127.572 E-.10098
G1 X129.149 Y127.571 E-.02474
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 209/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L209
M991 S0 P208 ;notify layer change
G17
G3 Z42 I-.929 J.787 P1  F30000
G1 X129.919 Y128.481 Z42
G1 Z41.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.209 Y127.153 I-.697 J-.481 E.11496
G1 X129.247 Y127.153 E.00125
G3 X129.952 Y128.43 I-.025 J.846 E.05829
G1 X130.241 Y128.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.088 Y128.885 E.00713
G3 X129.196 Y126.761 I-.867 J-.885 E.14832
G1 X129.264 Y126.761 E.00207
G3 X130.271 Y128.659 I-.042 J1.238 E.07988
M204 S10000
G1 X129.662 Y127.937 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.553 Y127.691 E.00828
G1 X129.323 Y127.57 E.008
G1 X129.084 Y127.572 E.00734
G1 X128.873 Y127.734 E.00817
M73 P85 R1
G1 X128.775 Y127.978 E.00808
G1 X128.848 Y128.23 E.00808
G1 X129.04 Y128.41 E.00808
G1 X129.302 Y128.435 E.00808
G1 X129.54 Y128.322 E.00811
G1 X129.658 Y128.098 E.00778
G1 X129.661 Y127.997 E.00309
; CHANGE_LAYER
; Z_HEIGHT: 42
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.658 Y128.098 E-.03826
G1 X129.54 Y128.322 E-.09616
G1 X129.302 Y128.435 E-.10027
G1 X129.04 Y128.41 E-.0999
G1 X128.848 Y128.23 E-.09989
G1 X128.775 Y127.978 E-.09995
G1 X128.873 Y127.734 E-.09988
G1 X129.084 Y127.572 E-.10099
G1 X129.149 Y127.571 E-.02469
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 210/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L210
M991 S0 P209 ;notify layer change
G17
G3 Z42.2 I-.928 J.787 P1  F30000
G1 X129.92 Y128.48 Z42.2
G1 Z42
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.209 Y127.153 I-.697 J-.481 E.11496
G1 X129.247 Y127.153 E.00124
G3 X129.952 Y128.43 I-.024 J.846 E.0583
G1 X130.243 Y128.707 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.088 Y128.885 E.00722
G3 X129.196 Y126.761 I-.867 J-.885 E.14831
G1 X129.263 Y126.761 E.00207
G3 X130.272 Y128.657 I-.042 J1.238 E.07982
M204 S10000
G1 X129.662 Y127.937 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.553 Y127.691 E.00827
G1 X129.323 Y127.57 E.008
G1 X129.084 Y127.572 E.00734
G1 X128.873 Y127.734 E.00817
G1 X128.775 Y127.978 E.00808
G1 X128.848 Y128.23 E.00808
G1 X129.04 Y128.41 E.00808
G1 X129.302 Y128.435 E.00808
G1 X129.54 Y128.322 E.00811
G1 X129.659 Y128.098 E.00778
G1 X129.661 Y127.997 E.00309
; CHANGE_LAYER
; Z_HEIGHT: 42.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.659 Y128.098 E-.03826
G1 X129.54 Y128.322 E-.09621
G1 X129.302 Y128.435 E-.10026
G1 X129.04 Y128.41 E-.0999
G1 X128.848 Y128.23 E-.09989
G1 X128.775 Y127.978 E-.09995
G1 X128.873 Y127.734 E-.09988
G1 X129.084 Y127.572 E-.101
G1 X129.149 Y127.571 E-.02465
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 211/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L211
M991 S0 P210 ;notify layer change
G17
G3 Z42.4 I-.928 J.787 P1  F30000
G1 X129.92 Y128.48 Z42.4
G1 Z42.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.209 Y127.153 I-.697 J-.481 E.11496
G1 X129.247 Y127.153 E.00123
G3 X129.952 Y128.43 I-.024 J.846 E.05831
G1 X130.245 Y128.704 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.242 Y128.703 E.00012
G3 X129.196 Y126.761 I-1.02 J-.703 E.15563
G1 X129.263 Y126.761 E.00206
G3 X130.36 Y128.489 I-.041 J1.238 E.074
G1 X130.273 Y128.651 E.00565
M204 S10000
G1 X129.662 Y127.937 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.553 Y127.692 E.00826
G1 X129.323 Y127.57 E.008
G1 X129.084 Y127.572 E.00734
G1 X128.873 Y127.734 E.00817
G1 X128.775 Y127.978 E.00808
G1 X128.848 Y128.23 E.00808
G1 X129.04 Y128.41 E.00808
G1 X129.302 Y128.435 E.00808
G1 X129.54 Y128.322 E.00811
G1 X129.659 Y128.098 E.00778
G1 X129.661 Y127.997 E.00309
; CHANGE_LAYER
; Z_HEIGHT: 42.4
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.659 Y128.098 E-.03826
G1 X129.54 Y128.322 E-.09626
G1 X129.302 Y128.435 E-.10025
G1 X129.04 Y128.41 E-.09991
G1 X128.848 Y128.23 E-.09988
G1 X128.775 Y127.978 E-.09995
G1 X128.873 Y127.734 E-.09988
G1 X129.084 Y127.572 E-.101
G1 X129.149 Y127.571 E-.02461
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 212/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L212
M991 S0 P211 ;notify layer change
G17
G3 Z42.6 I-.928 J.787 P1  F30000
G1 X129.92 Y128.48 Z42.6
G1 Z42.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.21 Y127.153 I-.697 J-.481 E.11497
G1 X129.246 Y127.153 E.00122
G3 X129.952 Y128.43 I-.024 J.846 E.05831
G1 X130.246 Y128.702 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.242 Y128.703 E.00014
G3 X129.196 Y126.76 I-1.02 J-.703 E.15564
G1 X129.263 Y126.761 E.00205
G3 X130.36 Y128.489 I-.041 J1.238 E.074
G1 X130.274 Y128.649 E.00559
M204 S10000
G1 X129.662 Y127.937 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.553 Y127.692 E.00826
G1 X129.323 Y127.57 E.00801
G1 X129.084 Y127.572 E.00733
G1 X128.873 Y127.734 E.00817
G1 X128.775 Y127.978 E.00808
G1 X128.848 Y128.23 E.00808
G1 X129.04 Y128.41 E.00808
G1 X129.302 Y128.435 E.00808
G1 X129.54 Y128.322 E.00811
G1 X129.659 Y128.098 E.00779
G1 X129.661 Y127.997 E.00309
; CHANGE_LAYER
; Z_HEIGHT: 42.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.659 Y128.098 E-.03826
G1 X129.54 Y128.322 E-.09632
G1 X129.302 Y128.435 E-.10024
G1 X129.04 Y128.41 E-.0999
G1 X128.848 Y128.23 E-.09989
G1 X128.775 Y127.978 E-.09995
G1 X128.873 Y127.734 E-.09988
G1 X129.084 Y127.572 E-.10101
G1 X129.149 Y127.571 E-.02456
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 213/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L213
M991 S0 P212 ;notify layer change
G17
G3 Z42.8 I-.928 J.787 P1  F30000
G1 X129.92 Y128.48 Z42.8
G1 Z42.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.21 Y127.153 I-.697 J-.481 E.11497
G1 X129.246 Y127.153 E.00122
G3 X129.952 Y128.43 I-.023 J.846 E.05831
G1 X130.247 Y128.7 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.242 Y128.702 E.00018
G3 X129.196 Y126.76 I-1.02 J-.703 E.15564
G1 X129.262 Y126.761 E.00204
G3 X130.36 Y128.488 I-.041 J1.238 E.074
G1 X130.276 Y128.647 E.00554
M204 S10000
G1 X129.662 Y127.937 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.553 Y127.692 E.00825
G1 X129.323 Y127.57 E.00801
G1 X129.084 Y127.572 E.00733
G1 X128.873 Y127.734 E.00817
G1 X128.775 Y127.978 E.00808
G1 X128.848 Y128.23 E.00808
G1 X129.04 Y128.41 E.00808
G1 X129.302 Y128.435 E.00808
G1 X129.54 Y128.322 E.0081
G1 X129.659 Y128.098 E.00779
G1 X129.661 Y127.997 E.00309
; CHANGE_LAYER
; Z_HEIGHT: 42.8
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.659 Y128.098 E-.03825
G1 X129.54 Y128.322 E-.09637
G1 X129.302 Y128.435 E-.10022
G1 X129.04 Y128.41 E-.0999
G1 X128.848 Y128.23 E-.0999
G1 X128.775 Y127.978 E-.09994
G1 X128.873 Y127.734 E-.09988
G1 X129.084 Y127.572 E-.10102
G1 X129.149 Y127.571 E-.02452
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 214/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L214
M991 S0 P213 ;notify layer change
G17
G3 Z43 I-.928 J.788 P1  F30000
G1 X129.92 Y128.48 Z43
G1 Z42.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.21 Y127.153 I-.697 J-.481 E.11498
G1 X129.246 Y127.153 E.00121
G3 X129.952 Y128.429 I-.023 J.846 E.05832
G1 X130.248 Y128.698 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.242 Y128.702 E.00023
G3 X129.196 Y126.76 I-1.02 J-.703 E.15565
G1 X129.262 Y126.761 E.00203
G3 X130.36 Y128.488 I-.04 J1.238 E.074
G1 X130.277 Y128.646 E.00548
M204 S10000
G1 X129.662 Y127.937 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.553 Y127.692 E.00825
G1 X129.323 Y127.57 E.00802
G1 X129.084 Y127.572 E.00733
G1 X128.873 Y127.734 E.00817
G1 X128.775 Y127.978 E.00808
G1 X128.848 Y128.23 E.00808
G1 X129.04 Y128.41 E.00808
G1 X129.302 Y128.435 E.00808
G1 X129.54 Y128.322 E.0081
G1 X129.659 Y128.098 E.0078
G1 X129.661 Y127.997 E.00309
; CHANGE_LAYER
; Z_HEIGHT: 43
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.659 Y128.098 E-.03824
G1 X129.54 Y128.322 E-.09643
G1 X129.302 Y128.435 E-.10021
G1 X129.04 Y128.41 E-.09991
G1 X128.848 Y128.23 E-.09989
G1 X128.775 Y127.978 E-.09994
G1 X128.873 Y127.734 E-.09989
G1 X129.084 Y127.572 E-.10101
G1 X129.148 Y127.571 E-.02448
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 215/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L215
M991 S0 P214 ;notify layer change
G17
G3 Z43.2 I-.928 J.788 P1  F30000
G1 X129.92 Y128.48 Z43.2
G1 Z43
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.21 Y127.153 I-.697 J-.481 E.11498
G1 X129.246 Y127.153 E.0012
G3 X129.952 Y128.429 I-.023 J.847 E.05832
G1 X130.249 Y128.697 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.242 Y128.702 E.00028
G3 X129.196 Y126.76 I-1.02 J-.703 E.15565
G1 X129.262 Y126.761 E.00202
G3 X130.361 Y128.488 I-.04 J1.238 E.07401
G1 X130.278 Y128.644 E.00543
M204 S10000
G1 X129.662 Y127.937 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.553 Y127.692 E.00824
G1 X129.323 Y127.57 E.00802
G1 X129.084 Y127.572 E.00733
G1 X128.873 Y127.734 E.00817
G1 X128.775 Y127.978 E.00808
G1 X128.848 Y128.23 E.00808
G1 X129.04 Y128.41 E.00808
G1 X129.302 Y128.435 E.00808
G1 X129.54 Y128.322 E.0081
G1 X129.659 Y128.098 E.0078
G1 X129.661 Y127.997 E.00309
; CHANGE_LAYER
; Z_HEIGHT: 43.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.659 Y128.098 E-.03825
G1 X129.54 Y128.322 E-.09648
G1 X129.302 Y128.435 E-.10019
G1 X129.04 Y128.41 E-.09991
M73 P86 R1
G1 X128.848 Y128.23 E-.09989
G1 X128.775 Y127.978 E-.09994
G1 X128.873 Y127.734 E-.09988
G1 X129.084 Y127.572 E-.10103
G1 X129.148 Y127.571 E-.02443
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 216/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L216
M991 S0 P215 ;notify layer change
G17
G3 Z43.4 I-.927 J.788 P1  F30000
G1 X129.92 Y128.48 Z43.4
G1 Z43.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.21 Y127.153 I-.697 J-.48 E.11499
G1 X129.246 Y127.153 E.00119
G3 X129.952 Y128.429 I-.023 J.847 E.05833
G1 X130.25 Y128.695 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.242 Y128.702 E.00033
G3 X129.196 Y126.76 I-1.02 J-.703 E.15565
G1 X129.262 Y126.761 E.00201
G3 X130.361 Y128.487 I-.04 J1.238 E.074
G1 X130.279 Y128.642 E.00538
M204 S10000
G1 X129.662 Y127.937 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.553 Y127.692 E.00824
G1 X129.322 Y127.57 E.00802
G1 X129.084 Y127.572 E.00733
G1 X128.873 Y127.734 E.00817
G1 X128.775 Y127.978 E.00808
G1 X128.848 Y128.23 E.00808
G1 X129.04 Y128.41 E.00808
G1 X129.302 Y128.435 E.00808
G1 X129.54 Y128.322 E.0081
G1 X129.659 Y128.097 E.00781
G1 X129.661 Y127.997 E.00309
; CHANGE_LAYER
; Z_HEIGHT: 43.4
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.659 Y128.097 E-.03825
G1 X129.54 Y128.322 E-.09653
G1 X129.302 Y128.435 E-.10018
G1 X129.04 Y128.41 E-.0999
G1 X128.848 Y128.23 E-.09989
G1 X128.775 Y127.978 E-.09995
G1 X128.873 Y127.734 E-.09989
G1 X129.084 Y127.572 E-.10103
G1 X129.148 Y127.571 E-.02438
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 217/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L217
M991 S0 P216 ;notify layer change
G17
G3 Z43.6 I-.927 J.788 P1  F30000
G1 X129.92 Y128.48 Z43.6
G1 Z43.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.21 Y127.153 I-.697 J-.48 E.11499
G1 X129.245 Y127.153 E.00118
G3 X129.953 Y128.429 I-.022 J.847 E.05833
G1 X130.251 Y128.693 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.243 Y128.702 E.00037
G3 X129.196 Y126.76 I-1.021 J-.703 E.15566
G1 X129.261 Y126.761 E.002
G3 X130.361 Y128.487 I-.039 J1.238 E.07401
G1 X130.279 Y128.64 E.00533
M204 S10000
G1 X129.662 Y127.937 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.553 Y127.692 E.00823
G1 X129.322 Y127.57 E.00803
G1 X129.084 Y127.572 E.00732
G1 X128.873 Y127.734 E.00817
G1 X128.775 Y127.978 E.00808
G1 X128.848 Y128.23 E.00808
G1 X129.04 Y128.41 E.00808
G1 X129.302 Y128.435 E.00808
G1 X129.54 Y128.322 E.0081
G1 X129.659 Y128.097 E.00781
G1 X129.661 Y127.997 E.00309
; CHANGE_LAYER
; Z_HEIGHT: 43.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.659 Y128.097 E-.03824
G1 X129.54 Y128.322 E-.09659
G1 X129.302 Y128.435 E-.10017
G1 X129.04 Y128.41 E-.09991
G1 X128.848 Y128.23 E-.09989
G1 X128.775 Y127.978 E-.09994
G1 X128.873 Y127.734 E-.09989
G1 X129.084 Y127.572 E-.10104
G1 X129.148 Y127.571 E-.02434
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 218/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L218
M991 S0 P217 ;notify layer change
G17
G3 Z43.8 I-.927 J.788 P1  F30000
G1 X129.92 Y128.48 Z43.8
G1 Z43.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.21 Y127.153 I-.697 J-.48 E.115
G1 X129.245 Y127.153 E.00117
G3 X129.953 Y128.429 I-.022 J.847 E.05834
G1 X130.252 Y128.692 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.243 Y128.702 E.00042
G3 X129.196 Y126.76 I-1.021 J-.702 E.15566
G1 X129.261 Y126.761 E.002
G3 X130.361 Y128.487 I-.039 J1.238 E.07401
G1 X130.28 Y128.639 E.00529
M204 S10000
G1 X129.662 Y127.937 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.553 Y127.692 E.00823
G1 X129.322 Y127.57 E.00803
G1 X129.084 Y127.572 E.00732
G1 X128.873 Y127.734 E.00817
G1 X128.775 Y127.978 E.00808
G1 X128.848 Y128.23 E.00808
G1 X129.04 Y128.41 E.00808
G1 X129.302 Y128.435 E.00808
G1 X129.54 Y128.322 E.0081
G1 X129.659 Y128.097 E.00781
G1 X129.661 Y127.997 E.00309
; CHANGE_LAYER
; Z_HEIGHT: 43.8
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.659 Y128.097 E-.03824
G1 X129.54 Y128.322 E-.09664
G1 X129.302 Y128.435 E-.10016
G1 X129.04 Y128.41 E-.0999
G1 X128.848 Y128.23 E-.09989
G1 X128.775 Y127.978 E-.09994
G1 X128.873 Y127.734 E-.09989
G1 X129.084 Y127.572 E-.10104
G1 X129.148 Y127.571 E-.0243
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 219/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L219
M991 S0 P218 ;notify layer change
G17
G3 Z44 I-.927 J.788 P1  F30000
G1 X129.921 Y128.479 Z44
G1 Z43.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.21 Y127.153 I-.698 J-.48 E.115
G1 X129.245 Y127.153 E.00116
G3 X129.953 Y128.429 I-.022 J.847 E.05834
G1 X130.253 Y128.691 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.243 Y128.702 E.00045
G3 X129.196 Y126.76 I-1.021 J-.702 E.15567
G1 X129.261 Y126.761 E.00199
G3 X130.361 Y128.487 I-.039 J1.238 E.07401
G1 X130.281 Y128.638 E.00526
M204 S10000
G1 X129.662 Y127.937 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.553 Y127.692 E.00822
G1 X129.322 Y127.57 E.00803
G1 X129.084 Y127.572 E.00732
G1 X128.873 Y127.734 E.00817
G1 X128.775 Y127.978 E.00808
G1 X128.848 Y128.23 E.00808
G1 X129.04 Y128.41 E.00808
G1 X129.302 Y128.435 E.00808
G1 X129.54 Y128.322 E.0081
G1 X129.659 Y128.097 E.00782
G1 X129.661 Y127.996 E.00309
; CHANGE_LAYER
; Z_HEIGHT: 44
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.659 Y128.097 E-.03824
G1 X129.54 Y128.322 E-.09671
G1 X129.302 Y128.435 E-.10013
G1 X129.04 Y128.41 E-.09991
G1 X128.848 Y128.23 E-.0999
G1 X128.775 Y127.978 E-.09994
G1 X128.873 Y127.734 E-.09989
G1 X129.084 Y127.572 E-.10105
G1 X129.148 Y127.571 E-.02425
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 220/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L220
M991 S0 P219 ;notify layer change
G17
G3 Z44.2 I-.927 J.789 P1  F30000
G1 X129.921 Y128.479 Z44.2
G1 Z44
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.21 Y127.153 I-.698 J-.48 E.115
G1 X129.245 Y127.153 E.00115
G3 X129.953 Y128.429 I-.022 J.847 E.05835
G1 X130.253 Y128.69 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.243 Y128.701 E.00048
G3 X129.196 Y126.76 I-1.021 J-.702 E.15567
G1 X129.261 Y126.761 E.00198
G3 X130.362 Y128.486 I-.038 J1.238 E.07401
G1 X130.282 Y128.637 E.00523
M204 S10000
G1 X129.662 Y127.936 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.553 Y127.692 E.00822
G1 X129.322 Y127.57 E.00804
G1 X129.084 Y127.572 E.00732
G1 X128.873 Y127.734 E.00817
G1 X128.775 Y127.978 E.00808
G1 X128.848 Y128.23 E.00808
G1 X129.04 Y128.41 E.00808
G1 X129.302 Y128.435 E.00808
G1 X129.54 Y128.322 E.0081
G1 X129.659 Y128.097 E.00782
G1 X129.661 Y127.996 E.00309
; CHANGE_LAYER
; Z_HEIGHT: 44.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.659 Y128.097 E-.03824
G1 X129.54 Y128.322 E-.09675
G1 X129.302 Y128.435 E-.10012
G1 X129.04 Y128.41 E-.09991
G1 X128.848 Y128.23 E-.0999
G1 X128.775 Y127.978 E-.09994
G1 X128.873 Y127.734 E-.09988
G1 X129.084 Y127.572 E-.10105
G1 X129.148 Y127.571 E-.02421
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 221/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L221
M991 S0 P220 ;notify layer change
G17
G3 Z44.4 I-.927 J.789 P1  F30000
G1 X129.921 Y128.479 Z44.4
G1 Z44.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.21 Y127.153 I-.698 J-.48 E.11501
G1 X129.244 Y127.153 E.00114
G3 X129.953 Y128.429 I-.021 J.847 E.05835
G1 X130.254 Y128.689 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.243 Y128.701 E.0005
G3 X129.196 Y126.76 I-1.021 J-.702 E.15567
G1 X129.26 Y126.761 E.00197
G3 X130.362 Y128.486 I-.038 J1.238 E.07401
G1 X130.282 Y128.636 E.00522
M204 S10000
G1 X129.662 Y127.936 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.554 Y127.692 E.00821
G1 X129.322 Y127.57 E.00804
G1 X129.084 Y127.572 E.00732
G1 X128.873 Y127.734 E.00817
G1 X128.775 Y127.978 E.00808
G1 X128.848 Y128.23 E.00808
G1 X129.04 Y128.41 E.00808
G1 X129.302 Y128.435 E.00808
G1 X129.54 Y128.322 E.00809
G1 X129.659 Y128.097 E.00783
G1 X129.661 Y127.996 E.00309
; CHANGE_LAYER
; Z_HEIGHT: 44.4
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.659 Y128.097 E-.03823
G1 X129.54 Y128.322 E-.09681
G1 X129.302 Y128.435 E-.1001
G1 X129.04 Y128.41 E-.09991
G1 X128.848 Y128.23 E-.0999
G1 X128.775 Y127.978 E-.09993
G1 X128.873 Y127.734 E-.09989
G1 X129.084 Y127.572 E-.10106
G1 X129.148 Y127.571 E-.02416
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 222/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L222
M991 S0 P221 ;notify layer change
G17
G3 Z44.6 I-.927 J.789 P1  F30000
G1 X129.921 Y128.479 Z44.6
G1 Z44.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.21 Y127.153 I-.698 J-.48 E.11501
G1 X129.244 Y127.153 E.00113
G3 X129.953 Y128.429 I-.021 J.847 E.05836
G1 X130.254 Y128.689 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.243 Y128.701 E.0005
G3 X129.196 Y126.76 I-1.021 J-.702 E.15568
G1 X129.26 Y126.761 E.00196
G3 X130.362 Y128.486 I-.038 J1.238 E.07401
G1 X130.282 Y128.636 E.00522
M204 S10000
G1 X129.662 Y127.936 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.554 Y127.692 E.00821
G1 X129.322 Y127.57 E.00805
G1 X129.084 Y127.572 E.00731
G1 X128.873 Y127.734 E.00817
M73 P87 R1
G1 X128.775 Y127.978 E.00808
G1 X128.848 Y128.23 E.00808
G1 X129.04 Y128.41 E.00808
G1 X129.302 Y128.435 E.00808
G1 X129.54 Y128.322 E.00809
G1 X129.659 Y128.097 E.00783
G1 X129.661 Y127.996 E.00309
; CHANGE_LAYER
; Z_HEIGHT: 44.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.659 Y128.097 E-.03824
G1 X129.54 Y128.322 E-.09686
G1 X129.302 Y128.435 E-.10009
G1 X129.04 Y128.41 E-.09991
G1 X128.848 Y128.23 E-.0999
G1 X128.775 Y127.978 E-.09993
G1 X128.873 Y127.734 E-.09989
G1 X129.084 Y127.572 E-.10107
G1 X129.148 Y127.571 E-.02412
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 223/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L223
M991 S0 P222 ;notify layer change
G17
G3 Z44.8 I-.926 J.789 P1  F30000
G1 X129.921 Y128.479 Z44.8
G1 Z44.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.21 Y127.153 I-.698 J-.48 E.11502
G1 X129.244 Y127.153 E.00112
G3 X129.953 Y128.428 I-.021 J.847 E.05836
G1 X130.254 Y128.689 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.244 Y128.701 E.0005
G3 X129.196 Y126.76 I-1.021 J-.702 E.15568
G1 X129.26 Y126.761 E.00195
G3 X130.362 Y128.485 I-.037 J1.238 E.07401
G1 X130.282 Y128.636 E.00523
M204 S10000
G1 X129.662 Y127.936 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.554 Y127.692 E.0082
G1 X129.322 Y127.57 E.00805
G1 X129.084 Y127.572 E.00731
G1 X128.873 Y127.734 E.00817
G1 X128.775 Y127.978 E.00808
G1 X128.848 Y128.23 E.00808
G1 X129.04 Y128.41 E.00808
G1 X129.302 Y128.435 E.00808
G1 X129.54 Y128.322 E.00809
G1 X129.659 Y128.097 E.00784
G1 X129.661 Y127.996 E.00309
; CHANGE_LAYER
; Z_HEIGHT: 44.8
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.659 Y128.097 E-.03824
G1 X129.54 Y128.322 E-.09691
G1 X129.302 Y128.435 E-.10008
G1 X129.04 Y128.41 E-.0999
G1 X128.848 Y128.23 E-.0999
G1 X128.775 Y127.978 E-.09993
G1 X128.873 Y127.734 E-.09989
G1 X129.084 Y127.572 E-.10107
G1 X129.148 Y127.571 E-.02407
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 224/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L224
M991 S0 P223 ;notify layer change
G17
G3 Z45 I-.926 J.789 P1  F30000
G1 X129.921 Y128.479 Z45
G1 Z44.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.21 Y127.153 I-.698 J-.48 E.11502
G1 X129.244 Y127.153 E.00112
G3 X129.953 Y128.428 I-.02 J.847 E.05837
G1 X130.254 Y128.689 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.244 Y128.701 E.00047
G3 X129.196 Y126.76 I-1.021 J-.702 E.15568
G1 X129.259 Y126.761 E.00194
G3 X130.362 Y128.485 I-.037 J1.238 E.07401
G1 X130.282 Y128.636 E.00525
M204 S10000
G1 X129.662 Y127.936 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.554 Y127.692 E.0082
G1 X129.322 Y127.57 E.00806
G1 X129.084 Y127.572 E.00731
G1 X128.873 Y127.734 E.00817
G1 X128.775 Y127.978 E.00808
G1 X128.848 Y128.23 E.00808
G1 X129.04 Y128.41 E.00808
G1 X129.302 Y128.435 E.00808
G1 X129.54 Y128.322 E.00809
G1 X129.659 Y128.097 E.00784
G1 X129.661 Y127.996 E.00309
; CHANGE_LAYER
; Z_HEIGHT: 45
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.659 Y128.097 E-.03822
G1 X129.54 Y128.322 E-.09697
G1 X129.302 Y128.435 E-.10006
G1 X129.04 Y128.41 E-.09991
G1 X128.848 Y128.23 E-.0999
G1 X128.775 Y127.978 E-.09994
G1 X128.873 Y127.734 E-.09989
G1 X129.084 Y127.572 E-.10108
G1 X129.147 Y127.571 E-.02404
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 225/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L225
M991 S0 P224 ;notify layer change
G17
G3 Z45.2 I-.926 J.79 P1  F30000
G1 X129.921 Y128.479 Z45.2
G1 Z45
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.21 Y127.153 I-.698 J-.48 E.11502
G1 X129.243 Y127.153 E.00111
G3 X129.954 Y128.428 I-.02 J.847 E.05838
G1 X130.253 Y128.69 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.244 Y128.701 E.00044
G3 X129.196 Y126.76 I-1.021 J-.701 E.15569
G1 X129.259 Y126.761 E.00193
G3 X130.363 Y128.485 I-.036 J1.238 E.07402
G1 X130.282 Y128.637 E.00529
M204 S10000
G1 X129.662 Y127.936 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.554 Y127.692 E.00819
G1 X129.322 Y127.57 E.00806
G1 X129.084 Y127.572 E.0073
G1 X128.873 Y127.734 E.00817
G1 X128.775 Y127.978 E.00808
G1 X128.848 Y128.23 E.00808
G1 X129.04 Y128.41 E.00808
G1 X129.302 Y128.435 E.00808
G1 X129.54 Y128.322 E.00809
G1 X129.659 Y128.097 E.00784
G1 X129.661 Y127.996 E.00309
; CHANGE_LAYER
; Z_HEIGHT: 45.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.659 Y128.097 E-.03823
G1 X129.54 Y128.322 E-.09701
G1 X129.302 Y128.435 E-.10005
G1 X129.04 Y128.41 E-.09991
G1 X128.848 Y128.23 E-.09991
G1 X128.775 Y127.978 E-.09993
G1 X128.873 Y127.734 E-.0999
G1 X129.084 Y127.572 E-.10108
G1 X129.147 Y127.571 E-.02399
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 226/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L226
M991 S0 P225 ;notify layer change
G17
G3 Z45.4 I-.926 J.79 P1  F30000
G1 X129.921 Y128.479 Z45.4
G1 Z45.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.21 Y127.153 I-.698 J-.479 E.11503
G1 X129.243 Y127.153 E.0011
G3 X129.954 Y128.428 I-.02 J.847 E.05838
G1 X130.253 Y128.691 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.244 Y128.701 E.00039
G3 X129.196 Y126.76 I-1.021 J-.701 E.15569
G1 X129.259 Y126.761 E.00192
G3 X130.363 Y128.485 I-.036 J1.239 E.07402
G1 X130.281 Y128.638 E.00535
M204 S10000
G1 X129.662 Y127.936 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.554 Y127.692 E.00818
G1 X129.322 Y127.57 E.00807
G1 X129.084 Y127.572 E.0073
G1 X128.873 Y127.734 E.00817
G1 X128.775 Y127.978 E.00808
G1 X128.848 Y128.23 E.00808
G1 X129.04 Y128.41 E.00808
G1 X129.302 Y128.435 E.00808
G1 X129.54 Y128.322 E.00809
G1 X129.659 Y128.096 E.00785
G1 X129.661 Y127.996 E.00309
; CHANGE_LAYER
; Z_HEIGHT: 45.4
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.659 Y128.096 E-.03823
G1 X129.54 Y128.322 E-.09707
G1 X129.302 Y128.435 E-.10004
G1 X129.04 Y128.41 E-.09991
G1 X128.848 Y128.23 E-.0999
G1 X128.775 Y127.978 E-.09994
G1 X128.873 Y127.734 E-.0999
G1 X129.084 Y127.572 E-.10108
G1 X129.147 Y127.571 E-.02394
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 227/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L227
M991 S0 P226 ;notify layer change
G17
G3 Z45.6 I-.926 J.79 P1  F30000
G1 X129.922 Y128.479 Z45.6
G1 Z45.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.21 Y127.153 I-.698 J-.479 E.11504
G1 X129.243 Y127.153 E.00109
G3 X129.954 Y128.428 I-.02 J.847 E.05838
G1 X130.252 Y128.693 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.244 Y128.7 E.00032
G3 X129.196 Y126.76 I-1.022 J-.701 E.15569
G1 X129.259 Y126.761 E.00192
G3 X130.363 Y128.484 I-.036 J1.239 E.07402
G1 X130.28 Y128.64 E.00543
M204 S10000
G1 X129.662 Y127.936 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.554 Y127.693 E.00818
G1 X129.322 Y127.57 E.00807
G1 X129.084 Y127.572 E.0073
G1 X128.873 Y127.734 E.00817
G1 X128.775 Y127.978 E.00808
G1 X128.848 Y128.23 E.00808
G1 X129.04 Y128.41 E.00808
G1 X129.302 Y128.435 E.00808
G1 X129.54 Y128.322 E.00809
G1 X129.659 Y128.096 E.00785
G1 X129.661 Y127.996 E.00309
; CHANGE_LAYER
; Z_HEIGHT: 45.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.659 Y128.096 E-.03822
G1 X129.54 Y128.322 E-.09714
G1 X129.302 Y128.435 E-.1
G1 X129.04 Y128.41 E-.09992
G1 X128.848 Y128.23 E-.0999
G1 X128.775 Y127.978 E-.09993
G1 X128.873 Y127.734 E-.09989
G1 X129.084 Y127.572 E-.1011
G1 X129.147 Y127.571 E-.0239
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 228/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L228
M991 S0 P227 ;notify layer change
G17
G3 Z45.8 I-.926 J.79 P1  F30000
G1 X129.922 Y128.479 Z45.8
G1 Z45.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.21 Y127.153 I-.698 J-.479 E.11504
G1 X129.243 Y127.153 E.00108
G3 X129.954 Y128.428 I-.019 J.847 E.05839
G1 X130.25 Y128.695 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.245 Y128.7 E.00023
G3 X129.196 Y126.76 I-1.022 J-.701 E.1557
G1 X129.258 Y126.761 E.00191
G3 X130.363 Y128.484 I-.035 J1.239 E.07402
G1 X130.279 Y128.643 E.00552
M204 S10000
G1 X129.662 Y127.936 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.554 Y127.693 E.00817
G1 X129.322 Y127.57 E.00808
G1 X129.084 Y127.572 E.00729
G1 X128.873 Y127.734 E.00818
G1 X128.775 Y127.978 E.00808
G1 X128.848 Y128.23 E.00808
G1 X129.04 Y128.41 E.00808
G1 X129.302 Y128.435 E.00808
G1 X129.54 Y128.322 E.00808
G1 X129.659 Y128.096 E.00786
G1 X129.661 Y127.996 E.00309
; CHANGE_LAYER
; Z_HEIGHT: 45.8
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.659 Y128.096 E-.03822
G1 X129.54 Y128.322 E-.09718
G1 X129.302 Y128.435 E-.09998
G1 X129.04 Y128.41 E-.09994
G1 X128.848 Y128.23 E-.09991
G1 X128.775 Y127.978 E-.09993
G1 X128.873 Y127.734 E-.09989
G1 X129.084 Y127.572 E-.10111
G1 X129.147 Y127.571 E-.02385
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 229/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L229
M991 S0 P228 ;notify layer change
G17
G3 Z46 I-.925 J.79 P1  F30000
G1 X129.922 Y128.479 Z46
G1 Z45.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
M73 P88 R1
G1 F1200
G3 X129.21 Y127.153 I-.698 J-.479 E.11504
G1 X129.243 Y127.153 E.00107
G3 X129.954 Y128.428 I-.019 J.847 E.0584
G1 X130.249 Y128.698 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.245 Y128.7 E.00014
G3 X129.196 Y126.76 I-1.022 J-.701 E.1557
G1 X129.258 Y126.761 E.0019
G3 X130.363 Y128.484 I-.035 J1.239 E.07402
G1 X130.277 Y128.645 E.00563
M204 S10000
G1 X129.662 Y127.936 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.554 Y127.693 E.00817
G1 X129.321 Y127.57 E.00808
G1 X129.084 Y127.572 E.00729
G1 X128.873 Y127.734 E.00818
G1 X128.775 Y127.978 E.00808
G1 X128.848 Y128.23 E.00808
G1 X129.04 Y128.41 E.00808
G1 X129.302 Y128.435 E.00808
G1 X129.54 Y128.322 E.00808
G1 X129.659 Y128.096 E.00786
G1 X129.661 Y127.996 E.00309
; CHANGE_LAYER
; Z_HEIGHT: 46
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.659 Y128.096 E-.03822
G1 X129.54 Y128.322 E-.09723
G1 X129.302 Y128.435 E-.09994
G1 X129.04 Y128.41 E-.09996
G1 X128.848 Y128.23 E-.09991
G1 X128.775 Y127.978 E-.09993
G1 X128.873 Y127.734 E-.09989
G1 X129.084 Y127.572 E-.1011
G1 X129.147 Y127.571 E-.02381
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 230/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L230
M991 S0 P229 ;notify layer change
G17
G3 Z46.2 I-.925 J.79 P1  F30000
G1 X129.922 Y128.478 Z46.2
G1 Z46
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.21 Y127.153 I-.698 J-.479 E.11504
G1 X129.242 Y127.153 E.00106
G3 X129.954 Y128.428 I-.019 J.847 E.0584
G1 X130.245 Y128.7 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.196 Y126.76 I-1.022 J-.701 E.1557
G1 X129.258 Y126.761 E.00189
G3 X130.278 Y128.65 I-.035 J1.239 E.07978
M204 S10000
G1 X129.662 Y127.935 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.554 Y127.693 E.00816
G1 X129.321 Y127.57 E.00809
G1 X129.084 Y127.572 E.00729
G1 X128.873 Y127.734 E.00818
G1 X128.775 Y127.978 E.00808
G1 X128.848 Y128.23 E.00808
G1 X129.04 Y128.41 E.00808
G1 X129.302 Y128.435 E.00808
G1 X129.539 Y128.322 E.00808
G1 X129.659 Y128.096 E.00787
G1 X129.661 Y127.995 E.00309
; CHANGE_LAYER
; Z_HEIGHT: 46.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.659 Y128.096 E-.03822
G1 X129.539 Y128.322 E-.09729
G1 X129.302 Y128.435 E-.09992
G1 X129.04 Y128.41 E-.09997
G1 X128.848 Y128.23 E-.0999
G1 X128.775 Y127.978 E-.09993
G1 X128.873 Y127.734 E-.09989
G1 X129.084 Y127.572 E-.10112
G1 X129.147 Y127.571 E-.02376
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 231/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L231
M991 S0 P230 ;notify layer change
G17
G3 Z46.4 I-.925 J.791 P1  F30000
G1 X129.922 Y128.478 Z46.4
G1 Z46.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.21 Y127.153 I-.698 J-.479 E.11505
G1 X129.242 Y127.153 E.00105
G3 X129.954 Y128.428 I-.018 J.847 E.05841
G1 X130.245 Y128.7 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.196 Y126.76 I-1.022 J-.701 E.1557
G1 X129.258 Y126.761 E.00188
G3 X130.278 Y128.65 I-.034 J1.239 E.07978
M204 S10000
G1 X129.662 Y127.935 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.554 Y127.693 E.00816
G1 X129.321 Y127.57 E.00809
G1 X129.084 Y127.572 E.00728
G1 X128.873 Y127.734 E.00818
G1 X128.775 Y127.978 E.00808
G1 X128.848 Y128.23 E.00808
G1 X129.04 Y128.41 E.00808
G1 X129.302 Y128.435 E.00808
G1 X129.539 Y128.322 E.00808
G1 X129.66 Y128.096 E.00787
G1 X129.661 Y127.995 E.00309
G1 X129.256 Y127.945 F30000
; LINE_WIDTH: 0.548142
G1 F1200
G2 X129.258 Y128.052 I-.026 J.054 E.01005
; CHANGE_LAYER
; Z_HEIGHT: 46.4
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.193 Y128.055 E-.19366
G1 X129.162 Y128 E-.18878
G1 X129.193 Y127.945 E-.18878
G1 X129.256 Y127.945 E-.18878
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 232/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L232
M991 S0 P231 ;notify layer change
G17
G3 Z46.6 I-.76 J.95 P1  F30000
G1 X129.922 Y128.478 Z46.6
G1 Z46.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.211 Y127.153 I-.698 J-.479 E.11505
G1 X129.242 Y127.153 E.00104
G3 X129.954 Y128.427 I-.018 J.847 E.05841
G1 X130.243 Y128.706 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.089 Y128.886 E.00726
G3 X129.196 Y126.76 I-.866 J-.886 E.14823
G1 X129.257 Y126.761 E.00187
G3 X130.274 Y128.655 I-.034 J1.239 E.08001
M204 S10000
G1 X129.662 Y127.935 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.554 Y127.693 E.00815
G1 X129.321 Y127.57 E.0081
G1 X129.084 Y127.572 E.00728
G1 X128.873 Y127.734 E.00818
G1 X128.775 Y127.978 E.00808
G1 X128.848 Y128.23 E.00808
G1 X129.04 Y128.41 E.00808
G1 X129.302 Y128.435 E.00809
G1 X129.539 Y128.322 E.00808
G1 X129.66 Y128.096 E.00787
G1 X129.661 Y127.995 E.00309
G1 X129.256 Y127.945 F30000
; LINE_WIDTH: 0.548116
G1 F1200
G2 X129.258 Y128.052 I-.026 J.054 E.01005
; CHANGE_LAYER
; Z_HEIGHT: 46.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.193 Y128.055 E-.19366
G1 X129.162 Y128 E-.18878
G1 X129.193 Y127.945 E-.18878
G1 X129.256 Y127.945 E-.18878
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 233/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L233
M991 S0 P232 ;notify layer change
G17
G3 Z46.8 I-.76 J.95 P1  F30000
G1 X129.922 Y128.478 Z46.8
G1 Z46.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.211 Y127.153 I-.699 J-.479 E.11506
G1 X129.242 Y127.153 E.00103
G3 X129.955 Y128.427 I-.018 J.847 E.05842
G1 X130.238 Y128.712 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.089 Y128.886 E.00703
G3 X129.196 Y126.76 I-.866 J-.887 E.14822
G1 X129.257 Y126.761 E.00186
G3 X130.27 Y128.662 I-.034 J1.239 E.08025
M204 S10000
G1 X129.662 Y127.935 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.554 Y127.693 E.00815
G1 X129.317 Y127.568 E.00822
G1 X129.078 Y127.575 E.00737
G1 X128.873 Y127.734 E.00795
G1 X128.775 Y127.978 E.00808
G1 X128.848 Y128.23 E.00808
G1 X129.04 Y128.41 E.00808
G1 X129.302 Y128.435 E.00809
G1 X129.539 Y128.322 E.00807
G1 X129.66 Y128.096 E.00788
G1 X129.661 Y127.995 E.00309
G1 X129.256 Y127.945 F30000
; LINE_WIDTH: 0.548194
G1 F1200
G2 X129.258 Y128.052 I-.026 J.054 E.01005
; CHANGE_LAYER
; Z_HEIGHT: 46.8
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.193 Y128.055 E-.19367
G1 X129.162 Y128 E-.18878
G1 X129.193 Y127.945 E-.18878
G1 X129.256 Y127.945 E-.18877
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 234/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L234
M991 S0 P233 ;notify layer change
G17
G3 Z47 I-.76 J.95 P1  F30000
G1 X129.923 Y128.478 Z47
G1 Z46.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.211 Y127.153 I-.699 J-.479 E.11506
G1 X129.241 Y127.153 E.00102
G3 X129.955 Y128.427 I-.018 J.847 E.05843
G1 X130.233 Y128.719 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.089 Y128.886 E.00677
G3 X129.196 Y126.76 I-.866 J-.887 E.14822
G1 X129.257 Y126.761 E.00185
G3 X130.266 Y128.669 I-.033 J1.239 E.08052
M204 S10000
G1 X129.662 Y127.935 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.554 Y127.693 E.00814
G1 X129.317 Y127.568 E.00823
G1 X129.078 Y127.575 E.00736
G1 X128.873 Y127.734 E.00796
G1 X128.775 Y127.978 E.00808
G1 X128.848 Y128.23 E.00808
G1 X129.04 Y128.41 E.00808
G1 X129.302 Y128.435 E.00809
G1 X129.539 Y128.322 E.00807
G1 X129.66 Y128.096 E.00788
G1 X129.661 Y127.995 E.00309
; CHANGE_LAYER
; Z_HEIGHT: 47
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.66 Y128.096 E-.03821
G1 X129.539 Y128.322 E-.0975
G1 X129.302 Y128.435 E-.09981
G1 X129.04 Y128.41 E-.10003
G1 X128.848 Y128.23 E-.0999
G1 X128.775 Y127.978 E-.09993
G1 X128.873 Y127.734 E-.09991
G1 X129.078 Y127.575 E-.09839
G1 X129.147 Y127.573 E-.02634
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 235/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L235
M991 S0 P234 ;notify layer change
G17
G3 Z47.2 I-.924 J.792 P1  F30000
G1 X129.923 Y128.478 Z47.2
G1 Z47
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.211 Y127.153 I-.699 J-.479 E.11506
G1 X129.241 Y127.153 E.00101
G3 X129.955 Y128.427 I-.017 J.847 E.05843
G1 X130.227 Y128.725 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.089 Y128.886 E.0065
G3 X129.196 Y126.76 I-.865 J-.887 E.14821
G1 X129.257 Y126.761 E.00185
G3 X130.261 Y128.676 I-.033 J1.239 E.0808
M204 S10000
G1 X129.662 Y127.935 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.554 Y127.693 E.00814
G1 X129.317 Y127.568 E.00824
G1 X129.078 Y127.575 E.00735
G1 X128.873 Y127.734 E.00796
G1 X128.775 Y127.978 E.00808
G1 X128.848 Y128.23 E.00808
G1 X129.04 Y128.41 E.00808
G1 X129.302 Y128.435 E.00809
G1 X129.539 Y128.322 E.00807
G1 X129.66 Y128.096 E.00789
M73 P89 R1
G1 X129.661 Y127.995 E.00309
G1 X129.256 Y127.945 F30000
; LINE_WIDTH: 0.54818
G1 F1200
G2 X129.258 Y128.052 I-.026 J.054 E.01005
; CHANGE_LAYER
; Z_HEIGHT: 47.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.193 Y128.055 E-.19367
G1 X129.162 Y128 E-.18878
G1 X129.193 Y127.945 E-.18878
G1 X129.256 Y127.945 E-.18877
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 236/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L236
M991 S0 P235 ;notify layer change
G17
G3 Z47.4 I-.763 J.948 P1  F30000
G1 X129.922 Y128.481 Z47.4
G1 Z47.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.816 Y128.605 E.00543
G3 X129.211 Y127.153 I-.592 J-.606 E.10953
G1 X129.241 Y127.153 E.001
G3 X129.953 Y128.43 I-.017 J.847 E.05855
G1 X130.221 Y128.732 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.089 Y128.886 E.00622
G3 X129.196 Y126.76 I-.865 J-.887 E.14821
G1 X129.256 Y126.761 E.00184
G3 X130.256 Y128.684 I-.033 J1.239 E.0811
M204 S10000
G1 X129.662 Y127.935 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.554 Y127.693 E.00813
G1 X129.317 Y127.568 E.00825
G1 X129.078 Y127.575 E.00734
G1 X128.873 Y127.734 E.00796
G1 X128.775 Y127.978 E.00808
G1 X128.848 Y128.23 E.00808
G1 X129.04 Y128.41 E.00808
G1 X129.302 Y128.435 E.00809
G1 X129.539 Y128.322 E.00807
G1 X129.66 Y128.095 E.00789
G1 X129.661 Y127.995 E.00309
; CHANGE_LAYER
; Z_HEIGHT: 47.4
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.66 Y128.095 E-.03821
G1 X129.539 Y128.322 E-.09761
G1 X129.302 Y128.435 E-.09975
G1 X129.04 Y128.41 E-.10005
G1 X128.848 Y128.23 E-.0999
G1 X128.775 Y127.978 E-.09993
G1 X128.873 Y127.734 E-.09991
G1 X129.078 Y127.575 E-.0984
G1 X129.147 Y127.573 E-.02623
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 237/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L237
M991 S0 P236 ;notify layer change
G17
G3 Z47.6 I-.932 J.783 P1  F30000
G1 X129.916 Y128.488 Z47.6
G1 Z47.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.816 Y128.605 E.00511
G3 X129.211 Y127.153 I-.591 J-.606 E.10953
G1 X129.241 Y127.153 E.001
G3 X129.949 Y128.438 I-.017 J.847 E.05887
G1 X130.215 Y128.74 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.089 Y128.886 E.00593
G3 X129.196 Y126.76 I-.865 J-.887 E.1482
G1 X129.256 Y126.761 E.00183
G3 X130.251 Y128.692 I-.032 J1.239 E.0814
M204 S10000
G1 X129.673 Y128.008 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.66 Y127.921 E.00272
G1 X129.554 Y127.693 E.00771
G1 X129.335 Y127.572 E.00769
G2 X128.994 Y127.615 I-.073 J.8 E.01065
G1 X128.825 Y127.813 E.00798
G1 X128.78 Y128.067 E.00794
G1 X128.903 Y128.302 E.00814
G1 X129.125 Y128.439 E.00802
G1 X129.382 Y128.413 E.00793
G1 X129.59 Y128.26 E.00794
G1 X129.655 Y128.065 E.0063
G1 X129.249 Y127.952 F30000
; LINE_WIDTH: 0.53183
G1 F1200
G2 X129.25 Y128.057 I-.025 J.053 E.00934
; CHANGE_LAYER
; Z_HEIGHT: 47.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.188 Y128.058 E-.19131
G1 X129.157 Y128.005 E-.18956
G1 X129.188 Y127.952 E-.18956
G1 X129.249 Y127.952 E-.18956
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 238/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L238
M991 S0 P237 ;notify layer change
G17
G3 Z47.8 I-.773 J.94 P1  F30000
G1 X129.909 Y128.496 Z47.8
G1 Z47.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.816 Y128.605 E.00478
G3 X129.211 Y127.153 I-.591 J-.606 E.10953
G1 X129.241 Y127.153 E.00099
G3 X129.943 Y128.446 I-.016 J.847 E.05921
G1 X130.209 Y128.747 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.089 Y128.886 E.00562
G3 X129.197 Y126.76 I-.865 J-.887 E.1482
G1 X129.256 Y126.761 E.00182
G3 X130.247 Y128.699 I-.032 J1.239 E.08167
G1 X130.246 Y128.7 E.00004
M204 S10000
G1 X129.673 Y128.009 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.66 Y127.921 E.00273
G1 X129.555 Y127.693 E.00771
G1 X129.335 Y127.572 E.0077
G2 X128.994 Y127.615 I-.073 J.799 E.01064
G1 X128.825 Y127.813 E.00798
G1 X128.78 Y128.067 E.00794
G1 X128.903 Y128.302 E.00814
G1 X129.125 Y128.439 E.00802
G1 X129.382 Y128.413 E.00793
G1 X129.591 Y128.26 E.00795
G1 X129.655 Y128.066 E.0063
G1 X129.249 Y127.952 F30000
; LINE_WIDTH: 0.53186
G1 F1200
G2 X129.25 Y128.057 I-.025 J.053 E.00934
; CHANGE_LAYER
; Z_HEIGHT: 47.8
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.188 Y128.058 E-.19132
G1 X129.157 Y128.005 E-.18956
G1 X129.188 Y127.952 E-.18956
G1 X129.249 Y127.952 E-.18956
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 239/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L239
M991 S0 P238 ;notify layer change
G17
G3 Z48 I-.784 J.93 P1  F30000
G1 X129.903 Y128.504 Z48
G1 Z47.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.816 Y128.605 E.00445
G3 X129.211 Y127.153 I-.591 J-.606 E.10952
G1 X129.24 Y127.153 E.00098
G3 X129.938 Y128.455 I-.016 J.847 E.05956
G1 X130.202 Y128.755 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.089 Y128.886 E.00532
G3 X129.197 Y126.76 I-.865 J-.887 E.14819
G1 X129.255 Y126.761 E.00181
G3 X130.247 Y128.699 I-.031 J1.239 E.08168
G1 X130.239 Y128.708 E.00036
M204 S10000
G1 X129.673 Y128.009 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.66 Y127.921 E.00273
G1 X129.555 Y127.693 E.0077
G1 X129.335 Y127.572 E.0077
G2 X128.994 Y127.615 I-.073 J.798 E.01064
G1 X128.825 Y127.813 E.00798
G1 X128.78 Y128.067 E.00794
G1 X128.903 Y128.302 E.00814
G1 X129.125 Y128.439 E.00802
G1 X129.382 Y128.413 E.00793
G1 X129.591 Y128.26 E.00795
G1 X129.655 Y128.066 E.00629
G1 X129.249 Y127.952 F30000
; LINE_WIDTH: 0.53189
G1 F1200
G2 X129.25 Y128.057 I-.025 J.053 E.00935
; CHANGE_LAYER
; Z_HEIGHT: 48
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.188 Y128.058 E-.19132
G1 X129.157 Y128.005 E-.18956
G1 X129.188 Y127.952 E-.18956
G1 X129.249 Y127.952 E-.18956
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 240/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L240
M991 S0 P239 ;notify layer change
G17
G3 Z48.2 I-.796 J.921 P1  F30000
G1 X129.896 Y128.511 Z48.2
G1 Z48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.816 Y128.605 E.00411
G3 X129.211 Y127.153 I-.591 J-.606 E.10952
G1 X129.24 Y127.153 E.00097
G3 X129.933 Y128.464 I-.016 J.847 E.05991
G1 X130.195 Y128.763 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.089 Y128.886 E.005
G3 X129.197 Y126.76 I-.865 J-.887 E.14819
G1 X129.255 Y126.761 E.0018
G3 X130.247 Y128.699 I-.031 J1.239 E.08169
G1 X130.233 Y128.716 E.00068
M204 S10000
G1 X129.673 Y128.009 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.66 Y127.921 E.00273
G1 X129.555 Y127.693 E.0077
G1 X129.335 Y127.572 E.00771
G2 X128.994 Y127.615 I-.073 J.798 E.01064
G1 X128.825 Y127.813 E.00798
G1 X128.78 Y128.067 E.00794
G1 X128.903 Y128.302 E.00814
G1 X129.125 Y128.439 E.00802
G1 X129.382 Y128.413 E.00793
G1 X129.591 Y128.26 E.00795
G1 X129.655 Y128.066 E.00629
G1 X129.249 Y127.952 F30000
; LINE_WIDTH: 0.53193
G1 F1200
G2 X129.25 Y128.057 I-.025 J.053 E.00935
; CHANGE_LAYER
; Z_HEIGHT: 48.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.188 Y128.058 E-.19133
G1 X129.157 Y128.005 E-.18956
G1 X129.188 Y127.952 E-.18956
G1 X129.249 Y127.952 E-.18956
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 241/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L241
M991 S0 P240 ;notify layer change
G17
G3 Z48.4 I-.807 J.911 P1  F30000
G1 X129.89 Y128.519 Z48.4
G1 Z48.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.816 Y128.606 E.00377
G3 X129.211 Y127.153 I-.591 J-.606 E.10952
G1 X129.24 Y127.153 E.00096
G3 X129.927 Y128.472 I-.015 J.847 E.06026
G1 X130.189 Y128.771 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.089 Y128.886 E.00469
G3 X129.197 Y126.76 I-.865 J-.887 E.14818
G1 X129.255 Y126.761 E.00179
G3 X130.247 Y128.698 I-.031 J1.239 E.08169
G1 X130.227 Y128.724 E.001
M204 S10000
G1 X129.673 Y128.009 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.66 Y127.921 E.00273
G1 X129.555 Y127.693 E.0077
G1 X129.335 Y127.572 E.00771
G2 X128.994 Y127.615 I-.073 J.797 E.01064
G1 X128.825 Y127.813 E.00798
G1 X128.78 Y128.067 E.00794
G1 X128.903 Y128.302 E.00814
G1 X129.125 Y128.439 E.00802
G1 X129.382 Y128.413 E.00793
G1 X129.591 Y128.26 E.00796
G1 X129.655 Y128.066 E.00628
G1 X129.249 Y127.952 F30000
; LINE_WIDTH: 0.531966
G1 F1200
G2 X129.25 Y128.057 I-.025 J.053 E.00935
; CHANGE_LAYER
; Z_HEIGHT: 48.4
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.188 Y128.058 E-.19133
G1 X129.157 Y128.005 E-.18956
G1 X129.188 Y127.952 E-.18956
G1 X129.249 Y127.952 E-.18956
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 242/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L242
M991 S0 P241 ;notify layer change
G17
G3 Z48.6 I-.818 J.901 P1  F30000
G1 X129.883 Y128.527 Z48.6
G1 Z48.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.816 Y128.606 E.00343
G3 X129.211 Y127.153 I-.591 J-.606 E.10951
G1 X129.24 Y127.153 E.00095
G3 X129.924 Y128.477 I-.015 J.847 E.06047
G1 X129.921 Y128.481 E.00014
G1 X130.182 Y128.778 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.089 Y128.886 E.00437
G3 X129.197 Y126.76 I-.865 J-.887 E.14818
G1 X129.255 Y126.761 E.00178
G3 X130.247 Y128.698 I-.03 J1.239 E.0817
G1 X130.22 Y128.732 E.00133
M204 S10000
G1 X129.673 Y128.009 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.66 Y127.921 E.00274
G1 X129.555 Y127.693 E.00769
M73 P90 R1
G1 X129.335 Y127.572 E.00772
G2 X128.994 Y127.615 I-.073 J.796 E.01063
G1 X128.825 Y127.813 E.00798
G1 X128.78 Y128.067 E.00794
G1 X128.903 Y128.302 E.00814
G1 X129.125 Y128.439 E.00802
G1 X129.382 Y128.413 E.00793
G1 X129.591 Y128.26 E.00796
G1 X129.655 Y128.066 E.00628
G1 X129.249 Y127.952 F30000
; LINE_WIDTH: 0.531998
G1 F1200
G2 X129.25 Y128.057 I-.025 J.053 E.00935
; CHANGE_LAYER
; Z_HEIGHT: 48.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.188 Y128.058 E-.19134
G1 X129.157 Y128.005 E-.18955
G1 X129.188 Y127.952 E-.18955
G1 X129.249 Y127.952 E-.18955
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 243/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L243
M991 S0 P242 ;notify layer change
G17
G3 Z48.8 I-.828 J.892 P1  F30000
G1 X129.876 Y128.535 Z48.8
G1 Z48.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.816 Y128.606 E.00309
G3 X129.211 Y127.153 I-.591 J-.606 E.10951
G1 X129.239 Y127.153 E.00094
G3 X129.924 Y128.477 I-.015 J.847 E.06049
G1 X129.914 Y128.489 E.00048
G1 X130.176 Y128.786 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.09 Y128.886 E.00406
G3 X129.197 Y126.76 I-.865 J-.887 E.14817
G1 X129.254 Y126.761 E.00177
G3 X130.247 Y128.698 I-.03 J1.239 E.08171
G1 X130.214 Y128.74 E.00165
M204 S10000
G1 X129.673 Y128.009 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.66 Y127.921 E.00274
G1 X129.555 Y127.693 E.00769
G1 X129.335 Y127.572 E.00772
G2 X128.994 Y127.615 I-.073 J.795 E.01063
G1 X128.825 Y127.813 E.00798
G1 X128.78 Y128.067 E.00794
G1 X128.903 Y128.302 E.00814
G1 X129.125 Y128.439 E.00802
G1 X129.382 Y128.413 E.00793
G1 X129.591 Y128.26 E.00796
G1 X129.655 Y128.066 E.00628
G1 X129.249 Y127.952 F30000
; LINE_WIDTH: 0.53201
G1 F1200
G2 X129.25 Y128.057 I-.025 J.053 E.00935
; CHANGE_LAYER
; Z_HEIGHT: 48.8
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.188 Y128.058 E-.19134
G1 X129.157 Y128.005 E-.18955
G1 X129.188 Y127.952 E-.18955
G1 X129.249 Y127.952 E-.18955
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 244/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L244
M991 S0 P243 ;notify layer change
G17
G3 Z49 I-.838 J.883 P1  F30000
G1 X129.873 Y128.544 Z49
G1 Z48.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.247 Y127.153 I-.648 J-.545 E.11342
G1 X129.33 Y127.159 E.00278
G3 X129.91 Y128.497 I-.105 J.84 E.05827
G1 X130.152 Y128.819 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X129.997 Y128.968 E.00662
G3 X129.257 Y126.761 I-.772 J-.969 E.14617
G1 X129.379 Y126.77 E.00377
G3 X130.192 Y128.774 I-.154 J1.229 E.08077
M204 S10000
G1 X129.661 Y128.065 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.631 Y127.805 E.00804
G1 X129.444 Y127.617 E.00814
G1 X129.182 Y127.55 E.00833
G1 X128.944 Y127.648 E.00789
G1 X128.807 Y127.859 E.00774
G2 X128.824 Y128.201 I.868 J.128 E.0106
G1 X129.008 Y128.384 E.00798
G1 X129.259 Y128.449 E.00794
G1 X129.501 Y128.344 E.00813
G1 X129.646 Y128.163 E.0071
G1 X129.652 Y128.124 E.00121
; CHANGE_LAYER
; Z_HEIGHT: 49
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.646 Y128.163 E-.015
G1 X129.501 Y128.344 E-.08786
G1 X129.259 Y128.449 E-.10052
G1 X129.008 Y128.384 E-.09824
G1 X128.824 Y128.201 E-.09873
G1 X128.802 Y128.073 E-.04955
G1 X128.807 Y127.859 E-.08133
G1 X128.944 Y127.648 E-.09571
G1 X129.182 Y127.55 E-.09762
G1 X129.272 Y127.573 E-.03542
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 245/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L245
M991 S0 P244 ;notify layer change
G17
G3 Z49.2 I-1.049 J.616 P1  F30000
G1 X129.853 Y128.563 Z49.2
G1 Z49
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.816 Y128.606 E.00189
G3 X129.211 Y127.153 I-.591 J-.606 E.1095
G1 X129.239 Y127.153 E.00092
G3 X129.924 Y128.477 I-.014 J.847 E.0605
G1 X129.892 Y128.516 E.00169
G1 X130.153 Y128.814 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.09 Y128.886 E.00295
G3 X129.197 Y126.76 I-.865 J-.887 E.14816
G1 X129.254 Y126.76 E.00176
G3 X130.248 Y128.698 I-.029 J1.239 E.08172
G1 X130.191 Y128.767 E.00277
M204 S10000
G1 X129.673 Y128.009 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.66 Y127.921 E.00275
G1 X129.555 Y127.694 E.00768
G1 X129.334 Y127.572 E.00773
G2 X128.994 Y127.615 I-.073 J.794 E.01062
G1 X128.825 Y127.813 E.00798
G1 X128.78 Y128.067 E.00794
G1 X128.903 Y128.302 E.00814
G1 X129.125 Y128.439 E.00802
G1 X129.382 Y128.413 E.00793
G1 X129.591 Y128.26 E.00796
G1 X129.655 Y128.066 E.00627
G1 X129.249 Y127.952 F30000
; LINE_WIDTH: 0.532086
G1 F1200
G2 X129.25 Y128.057 I-.025 J.053 E.00935
; CHANGE_LAYER
; Z_HEIGHT: 49.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.188 Y128.058 E-.19135
G1 X129.157 Y128.005 E-.18955
G1 X129.188 Y127.952 E-.18955
G1 X129.249 Y127.952 E-.18955
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 246/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L246
M991 S0 P245 ;notify layer change
G17
G3 Z49.4 I-.874 J.846 P1  F30000
G1 X129.847 Y128.57 Z49.4
G1 Z49.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.816 Y128.606 E.00158
G3 X129.211 Y127.153 I-.591 J-.606 E.1095
G1 X129.239 Y127.153 E.00091
G3 X129.924 Y128.477 I-.014 J.847 E.0605
G1 X129.885 Y128.524 E.00202
G1 X130.146 Y128.821 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.09 Y128.886 E.00266
G3 X129.197 Y126.76 I-.865 J-.887 E.14815
G1 X129.254 Y126.76 E.00175
G3 X130.248 Y128.698 I-.029 J1.239 E.08173
G1 X130.185 Y128.775 E.00307
M204 S10000
G1 X129.673 Y128.009 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.66 Y127.921 E.00275
G1 X129.555 Y127.694 E.00768
G1 X129.334 Y127.572 E.00774
G2 X128.994 Y127.615 I-.073 J.793 E.01062
G1 X128.825 Y127.813 E.00798
G1 X128.78 Y128.067 E.00794
G1 X128.903 Y128.302 E.00814
G1 X129.125 Y128.439 E.00802
G1 X129.382 Y128.413 E.00793
G1 X129.591 Y128.26 E.00797
G1 X129.655 Y128.066 E.00626
G1 X129.249 Y127.952 F30000
; LINE_WIDTH: 0.532126
G1 F1200
G2 X129.25 Y128.057 I-.025 J.053 E.00936
; CHANGE_LAYER
; Z_HEIGHT: 49.4
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.188 Y128.058 E-.19136
G1 X129.157 Y128.005 E-.18955
G1 X129.188 Y127.952 E-.18955
G1 X129.249 Y127.952 E-.18955
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 247/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L247
M991 S0 P246 ;notify layer change
G17
G3 Z49.6 I-.883 J.837 P1  F30000
G1 X129.841 Y128.576 Z49.6
G1 Z49.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.785 Y128.634 E.00268
G3 X129.204 Y127.153 I-.56 J-.635 E.10783
G1 X129.288 Y127.155 E.0028
G3 X129.9 Y128.511 I-.063 J.844 E.06023
G1 X129.881 Y128.532 E.00092
G1 X130.127 Y128.842 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.044 Y128.929 E.00368
G3 X129.194 Y126.761 I-.819 J-.929 E.14616
G1 X129.318 Y126.764 E.0038
G3 X130.212 Y128.748 I-.093 J1.236 E.08165
G1 X130.167 Y128.797 E.00205
M204 S10000
G1 X129.672 Y128.031 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.663 Y127.942 E.00275
G1 X129.57 Y127.711 E.00767
G1 X129.34 Y127.574 E.00823
G1 X129.081 Y127.573 E.00794
G1 X128.938 Y127.655 E.00506
G1 X128.794 Y127.876 E.0081
G1 X128.805 Y128.135 E.00797
G1 X128.944 Y128.352 E.00793
G1 X129.197 Y128.44 E.00823
G1 X129.45 Y128.39 E.00793
G1 X129.578 Y128.277 E.00523
G1 X129.651 Y128.087 E.00626
G1 X129.25 Y127.958 F30000
; LINE_WIDTH: 0.525726
G1 F1200
G2 X129.25 Y128.062 I-.024 J.052 E.00909
; CHANGE_LAYER
; Z_HEIGHT: 49.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.19 Y128.062 E-.19042
G1 X129.159 Y128.01 E-.18986
G1 X129.19 Y127.958 E-.18986
G1 X129.25 Y127.958 E-.18986
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 248/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L248
M991 S0 P247 ;notify layer change
G17
G3 Z49.8 I-.916 J.801 P1  F30000
G1 X129.684 Y128.455 Z49.8
G1 Z49.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.675 Y128.461 E.00037
G3 X129.209 Y127.353 I-.45 J-.463 E.08327
G1 X129.273 Y127.355 E.00214
G3 X129.758 Y128.363 I-.048 J.644 E.0449
G1 X129.722 Y128.408 E.00191
G1 X129.983 Y128.706 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X129.948 Y128.741 E.00154
G3 X129.199 Y126.96 I-.723 J-.744 E.12391
G1 X129.303 Y126.963 E.00318
G3 X130.081 Y128.584 I-.078 J1.034 E.06682
G1 X130.021 Y128.659 E.00296
M204 S10000
G1 X129.441 Y127.987 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.465963
G1 F1200
G1 X129.363 Y127.827 E.00614
G1 X129.164 Y127.784 E.00705
G2 X129.38 Y128.158 I.065 J.212 E.02746
G1 X129.421 Y128.044 E.00421
; CHANGE_LAYER
; Z_HEIGHT: 49.8
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.38 Y128.158 E-.07141
G1 X129.263 Y128.218 E-.07633
G1 X129.134 Y128.202 E-.07639
G1 X129.036 Y128.115 E-.07635
G1 X129.004 Y127.989 E-.07637
G1 X129.049 Y127.866 E-.07636
G1 X129.164 Y127.784 E-.08302
G1 X129.363 Y127.827 E-.1196
G1 X129.441 Y127.987 E-.10417
; WIPE_END
M73 P91 R1
G1 E-.04 F1800
; layer num/total_layer_count: 249/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L249
M991 S0 P248 ;notify layer change
G17
G3 Z50 I-1.17 J.334 P1  F30000
G1 X129.536 Y128.319 Z50
G1 Z49.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.214 Y127.553 I-.311 J-.32 E.05754
G1 X129.258 Y127.554 E.00148
G3 X129.576 Y128.274 I-.033 J.445 E.03198
G1 X129.824 Y128.587 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X129.809 Y128.599 E.00058
G3 X129.204 Y127.16 I-.584 J-.601 E.10008
G1 X129.288 Y127.163 E.00257
G3 X129.916 Y128.471 I-.063 J.835 E.05396
G1 X129.861 Y128.54 E.0027
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 50
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.809 Y128.599 E-.02991
G1 X129.681 Y128.705 E-.06344
G1 X129.532 Y128.782 E-.06355
G1 X129.371 Y128.827 E-.06355
G1 X129.204 Y128.84 E-.06356
G1 X129.038 Y128.819 E-.06355
G1 X128.88 Y128.766 E-.06354
G1 X128.735 Y128.682 E-.06357
G1 X128.609 Y128.571 E-.06355
G1 X128.468 Y128.364 E-.09513
G1 X128.411 Y128.207 E-.06355
G1 X128.386 Y128.043 E-.06311
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 250/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L250
M991 S0 P249 ;notify layer change
G17
G3 Z50.2 I-.16 J1.206 P1  F30000
G1 X129.398 Y128.177 Z50.2
G1 Z50
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.315 Y128.23 E.00325
G1 X129.219 Y128.247 E.00325
G1 X129.123 Y128.225 E.00325
G1 X129.044 Y128.168 E.00325
G1 X128.993 Y128.085 E.00325
G1 X128.978 Y127.988 E.00325
G1 X129.002 Y127.893 E.00325
G1 X129.061 Y127.815 E.00325
G1 X129.146 Y127.766 E.00325
G1 X129.243 Y127.753 E.00325
G1 X129.315 Y127.77 E.00245
G1 X129.398 Y127.823 E.00325
G1 X129.453 Y127.904 E.00325
G1 X129.472 Y128 E.00325
M73 P91 R0
G1 X129.453 Y128.096 E.00325
G1 X129.431 Y128.127 E.00126
G1 X129.7 Y128.424 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X129.572 Y128.537 E.00525
G3 X129.336 Y128.63 I-.348 J-.537 E.00784
G3 X129.273 Y127.362 I-.108 J-.63 E.06646
G3 X129.74 Y128.379 I-.049 J.638 E.04186
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 50.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.572 Y128.537 E-.08751
G1 X129.459 Y128.596 E-.04841
G1 X129.336 Y128.63 E-.04841
G1 X129.209 Y128.64 E-.04842
G1 X129.083 Y128.624 E-.04842
G1 X128.962 Y128.583 E-.04841
G1 X128.802 Y128.48 E-.07248
G1 X128.715 Y128.386 E-.04842
G1 X128.649 Y128.278 E-.04842
G1 X128.605 Y128.158 E-.04841
G1 X128.586 Y128.032 E-.04842
G1 X128.592 Y127.905 E-.04841
G1 X128.624 Y127.781 E-.04842
G1 X128.679 Y127.666 E-.04842
G1 X128.709 Y127.626 E-.01902
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 251/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L251
M991 S0 P250 ;notify layer change
G17
G3 Z50.4 I-.745 J.962 P1  F30000
G1 X129.328 Y128.105 Z50.4
G1 Z50.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.236 Y127.853 I-.103 J-.105 E.01946
G1 X129.317 Y127.885 E.00288
G1 X129.366 Y127.957 E.00287
G1 X129.369 Y128.029 E.00241
G1 X129.356 Y128.053 E.00089
G1 X129.571 Y128.41 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X129.561 Y128.422 E.00046
G3 X129.211 Y127.46 I-.336 J-.422 E.0628
G1 X129.265 Y127.462 E.00166
G3 X129.699 Y128.258 I-.04 J.538 E.03306
G1 X129.61 Y128.364 E.00427
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 50.4
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.561 Y128.422 E-.02851
G1 X129.394 Y128.512 E-.07217
G1 X129.185 Y128.538 E-.08029
G1 X128.979 Y128.48 E-.08122
G1 X128.812 Y128.347 E-.08128
G1 X128.728 Y128.21 E-.06113
G1 X128.685 Y128 E-.08129
G1 X128.728 Y127.79 E-.08128
G1 X128.848 Y127.614 E-.08128
G1 X128.976 Y127.521 E-.06014
G1 X129.103 Y127.474 E-.05141
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 252/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L252
M991 S0 P251 ;notify layer change
G17
G3 Z50.6 I-1.139 J.427 P1  F30000
G1 X129.336 Y128.096 Z50.6
G1 Z50.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.272 Y127.861 I-.111 J-.096 E.02105
G1 X129.351 Y127.923 E.00334
G1 X129.371 Y128.022 E.00334
G3 X129.366 Y128.043 I-.145 J-.022 E.00071
G1 X129.573 Y128.409 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X129.562 Y128.422 E.00054
G3 X129.242 Y127.461 I-.335 J-.422 E.06365
G1 X129.292 Y127.464 E.00155
G3 X129.67 Y128.307 I-.066 J.535 E.03404
G1 X129.615 Y128.365 E.00248
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 50.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.562 Y128.422 E-.0295
G1 X129.371 Y128.52 E-.08132
G1 X129.158 Y128.536 E-.08128
G1 X128.955 Y128.467 E-.08127
G1 X128.829 Y128.367 E-.06114
G1 X128.718 Y128.185 E-.08128
G1 X128.686 Y127.973 E-.08128
G1 X128.739 Y127.766 E-.08128
G1 X128.868 Y127.595 E-.08129
G1 X129.053 Y127.488 E-.08127
G1 X129.103 Y127.481 E-.01909
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 253/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L253
M991 S0 P252 ;notify layer change
G17
G3 Z50.8 I-1.138 J.432 P1  F30000
G1 X129.336 Y128.096 Z50.8
G1 Z50.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.272 Y127.86 I-.111 J-.096 E.02105
G1 X129.351 Y127.923 E.00334
G1 X129.371 Y128.022 E.00334
G3 X129.366 Y128.043 I-.145 J-.022 E.00071
G1 X129.575 Y128.409 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X129.562 Y128.422 E.00057
G3 X129.242 Y127.461 I-.335 J-.423 E.06366
G1 X129.292 Y127.464 E.00154
G3 X129.639 Y128.347 I-.066 J.535 E.03562
G1 X129.618 Y128.368 E.0009
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 50.8
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.562 Y128.422 E-.02982
G1 X129.371 Y128.52 E-.08131
G1 X129.158 Y128.536 E-.08128
G1 X129.003 Y128.492 E-.06114
G1 X128.829 Y128.367 E-.08128
G1 X128.718 Y128.185 E-.08128
G1 X128.686 Y127.973 E-.08127
G1 X128.739 Y127.766 E-.08128
G1 X128.868 Y127.595 E-.08129
G1 X129.053 Y127.488 E-.08127
G1 X129.102 Y127.481 E-.01877
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 254/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L254
M991 S0 P253 ;notify layer change
G17
G3 Z51 I-1.157 J.379 P1  F30000
G1 X129.311 Y128.119 Z51
G1 Z50.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.272 Y127.86 I-.085 J-.12 E.0199
G1 X129.342 Y127.911 E.00288
G1 X129.371 Y127.978 E.00241
G1 X129.363 Y128.05 E.00241
G1 X129.347 Y128.072 E.00089
G1 X129.555 Y128.422 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X129.54 Y128.439 E.00068
G3 X129.242 Y127.461 I-.314 J-.439 E.06283
G1 X129.292 Y127.464 E.00153
G3 X129.686 Y128.282 I-.065 J.535 E.03314
G1 X129.596 Y128.378 E.00406
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 51
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.54 Y128.439 E-.03123
G1 X129.399 Y128.511 E-.06012
G1 X129.265 Y128.538 E-.05201
G1 X129.158 Y128.536 E-.04087
G1 X128.955 Y128.467 E-.08127
G1 X128.795 Y128.326 E-.08128
G1 X128.702 Y128.133 E-.08129
G1 X128.686 Y127.973 E-.06114
G1 X128.739 Y127.766 E-.08128
G1 X128.868 Y127.595 E-.08127
G1 X129.053 Y127.488 E-.08128
G1 X129.123 Y127.478 E-.02695
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 255/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L255
M991 S0 P254 ;notify layer change
G17
G3 Z51.2 I-1.153 J.389 P1  F30000
G1 X129.333 Y128.1 Z51.2
G1 Z51
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.272 Y127.86 I-.107 J-.1 E.02087
G1 X129.333 Y127.9 E.00241
G1 X129.368 Y127.964 E.00241
G1 X129.368 Y128.036 E.00241
G1 X129.362 Y128.047 E.00042
G1 X129.553 Y128.425 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X129.54 Y128.439 E.00057
G3 X129.243 Y127.461 I-.314 J-.439 E.06284
G1 X129.292 Y127.464 E.00152
G3 X129.686 Y128.282 I-.065 J.535 E.03315
G1 X129.594 Y128.381 E.00417
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 51.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.54 Y128.439 E-.02987
G1 X129.371 Y128.52 E-.07124
G1 X129.158 Y128.536 E-.0813
G1 X129.003 Y128.492 E-.06114
G1 X128.829 Y128.367 E-.08128
G1 X128.718 Y128.185 E-.08128
G1 X128.686 Y127.973 E-.08127
G1 X128.739 Y127.766 E-.08129
G1 X128.868 Y127.595 E-.08127
G1 X129.053 Y127.488 E-.08128
G1 X129.128 Y127.477 E-.02877
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 256/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L256
M991 S0 P255 ;notify layer change
G17
G3 Z51.4 I-1.181 J.293 P1  F30000
G1 X129.29 Y128.132 Z51.4
G1 Z51.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.272 Y127.86 I-.065 J-.132 E.01911
G1 X129.322 Y127.89 E.00193
G1 X129.363 Y127.95 E.00241
G1 X129.371 Y128.022 E.00241
G1 X129.351 Y128.077 E.00194
G3 X129.338 Y128.094 I-.125 J-.077 E.00071
G1 X129.516 Y128.455 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.243 Y127.461 I-.289 J-.455 E.06193
G1 X129.292 Y127.464 E.00151
G3 X129.565 Y128.42 I-.065 J.535 E.03885
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 51.4
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.319 Y128.532 E-.10253
G1 X129.158 Y128.536 E-.06113
G1 X128.955 Y128.467 E-.08128
G1 X128.795 Y128.326 E-.08128
G1 X128.718 Y128.185 E-.06114
G1 X128.686 Y127.973 E-.08128
G1 X128.739 Y127.766 E-.08127
G1 X128.868 Y127.595 E-.08128
G1 X129.053 Y127.488 E-.08128
G1 X129.177 Y127.47 E-.04752
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 257/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L257
M991 S0 P256 ;notify layer change
G17
G3 Z51.6 I-1.199 J.208 P1  F30000
G1 X129.291 Y128.129 Z51.6
G1 Z51.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.286 Y128.134 E.00024
G3 X129.272 Y127.86 I-.06 J-.134 E.01893
G1 X129.342 Y127.911 E.00288
G1 X129.372 Y127.993 E.00288
G1 X129.351 Y128.077 E.00288
G1 X129.336 Y128.09 E.00065
G1 X129.548 Y128.429 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X129.54 Y128.439 E.00038
G3 X129.243 Y127.461 I-.313 J-.439 E.06285
G1 X129.292 Y127.464 E.0015
G3 X129.687 Y128.282 I-.065 J.535 E.03316
G1 X129.589 Y128.386 E.00436
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 51.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.54 Y128.439 E-.02745
G1 X129.345 Y128.526 E-.08133
G1 X129.158 Y128.536 E-.07123
G1 X129.003 Y128.492 E-.06114
G1 X128.829 Y128.367 E-.08127
G1 X128.718 Y128.185 E-.08128
G1 X128.686 Y127.973 E-.08128
G1 X128.739 Y127.766 E-.08128
G1 X128.868 Y127.595 E-.08128
G1 X129.053 Y127.488 E-.08128
G1 X129.134 Y127.477 E-.03118
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 258/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L258
M991 S0 P257 ;notify layer change
G17
G3 Z51.8 I-1.157 J.377 P1  F30000
G1 X129.336 Y128.096 Z51.8
G1 Z51.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.272 Y127.861 I-.111 J-.097 E.02103
G1 X129.351 Y127.923 E.00334
G1 X129.371 Y128.022 E.00334
G3 X129.366 Y128.043 I-.145 J-.022 E.00073
G1 X129.562 Y128.423 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.244 Y127.461 I-.335 J-.423 E.06369
G1 X129.292 Y127.464 E.00149
G3 X129.607 Y128.383 I-.065 J.535 E.03711
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 51.8
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.371 Y128.52 E-.1036
G1 X129.158 Y128.536 E-.08127
G1 X128.955 Y128.467 E-.08129
G1 X128.829 Y128.367 E-.06114
G1 X128.718 Y128.185 E-.08127
G1 X128.686 Y127.973 E-.08128
G1 X128.739 Y127.766 E-.08129
G1 X128.868 Y127.595 E-.08128
G1 X129.053 Y127.488 E-.08128
G1 X129.122 Y127.478 E-.02631
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 259/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L259
M991 S0 P258 ;notify layer change
G17
G3 Z52 I-1.15 J.4 P1  F30000
G1 X129.336 Y128.096 Z52
G1 Z51.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.272 Y127.86 I-.111 J-.096 E.02105
G1 X129.351 Y127.923 E.00334
G1 X129.371 Y128.022 E.00334
G3 X129.366 Y128.043 I-.145 J-.022 E.00071
G1 X129.562 Y128.423 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.244 Y127.461 I-.335 J-.423 E.06369
G1 X129.292 Y127.464 E.00147
G3 X129.607 Y128.383 I-.065 J.535 E.03712
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 52
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.371 Y128.52 E-.10357
G1 X129.158 Y128.536 E-.08129
G1 X129.003 Y128.492 E-.06113
G1 X128.829 Y128.367 E-.08128
G1 X128.718 Y128.185 E-.08128
G1 X128.686 Y127.973 E-.08128
G1 X128.739 Y127.766 E-.08128
G1 X128.868 Y127.595 E-.08128
G1 X129.053 Y127.488 E-.08128
G1 X129.122 Y127.478 E-.02633
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 260/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L260
M991 S0 P259 ;notify layer change
G17
G3 Z52.2 I-1.164 J.354 P1  F30000
G1 X129.315 Y128.116 Z52.2
G1 Z52
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.272 Y127.86 I-.09 J-.116 E.02008
G1 X129.358 Y127.936 E.00379
G1 X129.363 Y128.05 E.00379
G3 X129.355 Y128.07 I-.138 J-.051 E.0007
G1 X129.561 Y128.422 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X129.371 Y128.52 E.00654
G3 X129.245 Y127.461 I-.144 J-.52 E.05708
G1 X129.292 Y127.464 E.00146
G3 X129.606 Y128.384 I-.065 J.535 E.03717
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 52.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.371 Y128.52 E-.10303
G1 X129.158 Y128.536 E-.08129
G1 X128.955 Y128.467 E-.08127
G1 X128.795 Y128.326 E-.08129
G1 X128.702 Y128.133 E-.08128
G1 X128.686 Y127.973 E-.06114
G1 X128.739 Y127.766 E-.08128
G1 X128.868 Y127.595 E-.08127
G1 X129.053 Y127.488 E-.08128
G1 X129.123 Y127.478 E-.02687
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 261/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L261
M991 S0 P260 ;notify layer change
G17
G3 Z52.4 I-1.15 J.397 P1  F30000
G1 X129.336 Y128.096 Z52.4
G1 Z52.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.272 Y127.86 I-.111 J-.096 E.02104
G1 X129.351 Y127.923 E.00334
G1 X129.371 Y128.022 E.00334
G3 X129.366 Y128.043 I-.145 J-.022 E.00072
G1 X129.556 Y128.425 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X129.371 Y128.52 E.00639
G3 X129.245 Y127.461 I-.144 J-.52 E.05708
G1 X129.292 Y127.464 E.00145
G3 X129.602 Y128.387 I-.065 J.535 E.03733
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 52.4
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.371 Y128.52 E-.10123
G1 X129.158 Y128.536 E-.08129
G1 X128.955 Y128.467 E-.08128
G1 X128.795 Y128.326 E-.08127
G1 X128.718 Y128.185 E-.06114
G1 X128.686 Y127.973 E-.08128
G1 X128.739 Y127.766 E-.08129
G1 X128.868 Y127.595 E-.08128
G1 X129.053 Y127.488 E-.08128
G1 X129.128 Y127.478 E-.02867
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 262/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L262
M991 S0 P261 ;notify layer change
G17
G3 Z52.6 I-1.181 J.293 P1  F30000
G1 X129.29 Y128.132 Z52.6
G1 Z52.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.272 Y127.86 I-.065 J-.132 E.0191
G1 X129.333 Y127.9 E.00241
G1 X129.363 Y127.95 E.00194
G1 X129.371 Y128.022 E.00241
G1 X129.351 Y128.077 E.00193
G3 X129.338 Y128.094 I-.125 J-.077 E.00072
G1 X129.518 Y128.453 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X129.516 Y128.456 E.00012
G3 X129.245 Y127.461 I-.288 J-.456 E.06196
G1 X129.292 Y127.464 E.00144
G3 X129.621 Y128.368 I-.065 J.535 E.0365
G1 X129.565 Y128.415 E.00226
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 52.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.516 Y128.456 E-.02426
G1 X129.319 Y128.532 E-.0802
G1 X129.158 Y128.536 E-.06114
G1 X129.003 Y128.492 E-.06114
G1 X128.829 Y128.367 E-.08128
G1 X128.718 Y128.185 E-.08128
G1 X128.686 Y127.973 E-.08128
G1 X128.739 Y127.766 E-.08128
G1 X128.868 Y127.595 E-.08127
G1 X129.053 Y127.488 E-.08129
G1 X129.172 Y127.471 E-.04559
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 263/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L263
M991 S0 P262 ;notify layer change
G17
G3 Z52.8 I-1.19 J.255 P1  F30000
G1 X129.311 Y128.119 Z52.8
G1 Z52.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.272 Y127.861 I-.085 J-.12 E.0199
G1 X129.342 Y127.911 E.00288
G1 X129.371 Y127.978 E.00241
G1 X129.358 Y128.064 E.00288
G1 X129.349 Y128.074 E.00042
G1 X129.538 Y128.439 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X129.447 Y128.492 E.00325
G3 X129.246 Y127.461 I-.22 J-.493 E.05958
G1 X129.292 Y127.464 E.00143
G3 X129.586 Y128.403 I-.064 J.535 E.03804
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 52.8
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.447 Y128.492 E-.0626
G1 X129.316 Y128.532 E-.05201
M73 P92 R0
G1 X129.158 Y128.536 E-.06015
G1 X128.955 Y128.467 E-.08127
G1 X128.795 Y128.326 E-.08128
G1 X128.718 Y128.185 E-.06114
G1 X128.686 Y127.973 E-.08128
G1 X128.739 Y127.766 E-.08128
G1 X128.868 Y127.595 E-.08128
G1 X129.053 Y127.488 E-.08128
G1 X129.148 Y127.475 E-.03642
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 264/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L264
M991 S0 P263 ;notify layer change
G17
G3 Z53 I-1.17 J.336 P1  F30000
G1 X129.329 Y128.103 Z53
G1 Z52.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.262 Y128.142 E.00257
G3 X129.272 Y127.86 I-.036 J-.142 E.0181
G1 X129.333 Y127.9 E.00241
G1 X129.368 Y127.964 E.00241
G1 X129.368 Y128.036 E.00241
G1 X129.359 Y128.052 E.00059
G1 X129.535 Y128.441 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X129.371 Y128.52 E.00557
G3 X129.246 Y127.461 I-.144 J-.52 E.05711
G1 X129.292 Y127.464 E.00142
G3 X129.583 Y128.406 I-.064 J.536 E.03817
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 53
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.371 Y128.52 E-.09119
G1 X129.158 Y128.536 E-.08137
G1 X129.003 Y128.492 E-.06114
G1 X128.829 Y128.367 E-.08128
G1 X128.718 Y128.185 E-.08128
G1 X128.686 Y127.973 E-.08128
G1 X128.739 Y127.766 E-.08128
G1 X128.868 Y127.595 E-.08129
G1 X129.053 Y127.488 E-.08127
G1 X129.154 Y127.474 E-.03862
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 265/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L265
M991 S0 P264 ;notify layer change
G17
G3 Z53.2 I-1.191 J.248 P1  F30000
G1 X129.291 Y128.131 Z53.2
G1 Z53
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.286 Y127.866 I-.065 J-.132 E.0196
G1 X129.363 Y127.95 E.00379
G1 X129.358 Y128.064 E.00379
G3 X129.339 Y128.094 I-.132 J-.064 E.00117
G1 X129.517 Y128.453 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X129.516 Y128.456 E.00008
G3 X129.246 Y127.461 I-.288 J-.456 E.06198
G1 X129.292 Y127.464 E.0014
G3 X129.622 Y128.368 I-.064 J.536 E.03651
G1 X129.563 Y128.416 E.0023
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 53.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.516 Y128.456 E-.02374
G1 X129.319 Y128.532 E-.08018
G1 X129.158 Y128.536 E-.06113
G1 X129.003 Y128.492 E-.06114
G1 X128.829 Y128.367 E-.08128
G1 X128.718 Y128.185 E-.08128
G1 X128.686 Y127.973 E-.08128
G1 X128.739 Y127.766 E-.08128
G1 X128.868 Y127.595 E-.08128
G1 X129.053 Y127.488 E-.08128
G1 X129.173 Y127.471 E-.04613
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 266/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L266
M991 S0 P265 ;notify layer change
G17
G3 Z53.4 I-1.177 J.308 P1  F30000
G1 X129.336 Y128.096 Z53.4
G1 Z53.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.286 Y127.866 I-.111 J-.096 E.02154
G1 X129.358 Y127.936 E.00334
G1 X129.371 Y128.022 E.00288
G3 X129.366 Y128.043 I-.145 J-.022 E.0007
G1 X129.541 Y128.433 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X129.371 Y128.52 E.00586
G3 X129.247 Y127.461 I-.144 J-.52 E.05711
G1 X129.292 Y127.464 E.00139
G3 X129.59 Y128.4 I-.064 J.536 E.03789
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 53.4
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.371 Y128.52 E-.09485
G1 X129.158 Y128.536 E-.0813
G1 X128.955 Y128.467 E-.08128
G1 X128.829 Y128.367 E-.06114
G1 X128.718 Y128.185 E-.08128
G1 X128.686 Y127.973 E-.08128
G1 X128.739 Y127.766 E-.08128
G1 X128.868 Y127.595 E-.08128
G1 X129.053 Y127.488 E-.08128
G1 X129.144 Y127.475 E-.03504
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 267/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L267
M991 S0 P266 ;notify layer change
G17
G3 Z53.6 I-1.164 J.355 P1  F30000
G1 X129.335 Y128.099 Z53.6
G1 Z53.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.265 Y128.141 E.00272
G3 X129.286 Y127.866 I-.039 J-.141 E.01868
G1 X129.351 Y127.923 E.00288
G1 X129.372 Y128.007 E.00288
G3 X129.365 Y128.046 I-.147 J-.008 E.00129
G1 X129.539 Y128.433 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X129.371 Y128.52 E.00581
G3 X129.247 Y127.461 I-.143 J-.52 E.05712
G1 X129.292 Y127.464 E.00138
G3 X129.589 Y128.401 I-.064 J.536 E.03794
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 53.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.371 Y128.52 E-.09429
G1 X129.158 Y128.536 E-.0813
G1 X129.003 Y128.492 E-.06113
G1 X128.829 Y128.367 E-.08128
G1 X128.718 Y128.185 E-.08129
G1 X128.686 Y127.973 E-.08128
G1 X128.739 Y127.766 E-.08128
G1 X128.868 Y127.595 E-.08128
G1 X129.053 Y127.488 E-.08129
G1 X129.146 Y127.475 E-.03558
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 268/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L268
M991 S0 P267 ;notify layer change
G17
G3 Z53.8 I-1.165 J.352 P1  F30000
G1 X129.334 Y128.099 Z53.8
G1 Z53.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.265 Y128.141 E.0027
G3 X129.286 Y127.866 I-.039 J-.141 E.01868
G1 X129.351 Y127.923 E.00288
G1 X129.372 Y128.007 E.00288
G3 X129.365 Y128.046 I-.147 J-.008 E.00131
G1 X129.539 Y128.434 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X129.371 Y128.52 E.00579
G3 X129.247 Y127.461 I-.143 J-.52 E.05712
G1 X129.292 Y127.464 E.00137
G3 X129.588 Y128.401 I-.064 J.536 E.03797
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 53.8
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.371 Y128.52 E-.094
G1 X129.158 Y128.536 E-.08131
G1 X128.955 Y128.467 E-.08128
G1 X128.829 Y128.367 E-.06114
G1 X128.718 Y128.185 E-.08129
G1 X128.686 Y127.973 E-.08127
G1 X128.739 Y127.766 E-.08128
G1 X128.868 Y127.595 E-.08128
G1 X129.053 Y127.488 E-.08128
G1 X129.147 Y127.475 E-.03587
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 269/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L269
M991 S0 P268 ;notify layer change
G17
G3 Z54 I-1.167 J.345 P1  F30000
G1 X129.332 Y128.101 Z54
G1 Z53.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.286 Y127.866 I-.107 J-.101 E.02135
G1 X129.351 Y127.923 E.00288
G1 X129.371 Y128.022 E.00334
G3 X129.364 Y128.049 I-.145 J-.022 E.00094
G1 X129.539 Y128.434 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X129.371 Y128.52 E.00579
G3 X129.248 Y127.461 I-.143 J-.52 E.05713
G1 X129.292 Y127.464 E.00136
G3 X129.588 Y128.401 I-.064 J.536 E.03797
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 54
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.371 Y128.52 E-.09403
G1 X129.158 Y128.536 E-.08131
G1 X129.003 Y128.492 E-.06114
G1 X128.829 Y128.367 E-.08128
G1 X128.718 Y128.185 E-.08128
G1 X128.686 Y127.973 E-.08128
G1 X128.739 Y127.766 E-.08128
G1 X128.868 Y127.595 E-.08127
G1 X129.053 Y127.488 E-.08128
G1 X129.147 Y127.475 E-.03584
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 270/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L270
M991 S0 P269 ;notify layer change
G17
G3 Z54.2 I-1.191 J.252 P1  F30000
G1 X129.286 Y128.134 Z54.2
G1 Z54
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.286 Y127.866 I-.06 J-.134 E.01942
G1 X129.363 Y127.95 E.00379
G1 X129.358 Y128.064 E.00379
G3 X129.335 Y128.098 I-.132 J-.064 E.00135
G1 X129.516 Y128.456 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.248 Y127.461 I-.288 J-.456 E.062
G1 X129.292 Y127.464 E.00135
G3 X129.565 Y128.421 I-.064 J.536 E.03893
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 54.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.319 Y128.532 E-.10239
G1 X129.158 Y128.536 E-.06114
G1 X128.955 Y128.467 E-.08127
G1 X128.795 Y128.326 E-.08128
G1 X128.702 Y128.133 E-.08128
G1 X128.686 Y127.973 E-.06114
G1 X128.739 Y127.766 E-.08128
G1 X128.868 Y127.595 E-.08128
G1 X129.053 Y127.488 E-.08128
G1 X129.177 Y127.471 E-.04766
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 271/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L271
M991 S0 P270 ;notify layer change
G17
G3 Z54.4 I-1.191 J.25 P1  F30000
G1 X129.311 Y128.11 Z54.4
G1 Z54.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.256 Y128.143 E.00214
G3 X129.286 Y127.866 I-.031 J-.144 E.01839
G1 X129.342 Y127.911 E.00241
G1 X129.368 Y127.964 E.00194
G1 X129.368 Y128.036 E.00241
G1 X129.352 Y128.068 E.00118
G1 X129.529 Y128.443 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X129.372 Y128.52 E.00539
G3 X129.249 Y127.461 I-.143 J-.52 E.05715
G1 X129.292 Y127.464 E.00133
G3 X129.578 Y128.41 I-.064 J.536 E.03839
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 54.4
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.372 Y128.52 E-.08892
G1 X129.158 Y128.536 E-.08143
G1 X129.003 Y128.492 E-.06114
G1 X128.829 Y128.367 E-.08128
G1 X128.718 Y128.185 E-.08129
G1 X128.686 Y127.973 E-.08128
G1 X128.739 Y127.766 E-.08128
G1 X128.868 Y127.595 E-.08128
G1 X129.053 Y127.488 E-.08128
G1 X129.16 Y127.473 E-.04083
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 272/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L272
M991 S0 P271 ;notify layer change
G17
G3 Z54.6 I-1.195 J.228 P1  F30000
G1 X129.285 Y128.134 Z54.6
G1 Z54.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.286 Y127.866 I-.06 J-.134 E.01941
G1 X129.363 Y127.95 E.00379
G1 X129.358 Y128.064 E.00379
G3 X129.335 Y128.098 I-.132 J-.064 E.00136
G1 X129.517 Y128.453 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X129.516 Y128.456 E.00011
G3 X129.249 Y127.461 I-.287 J-.456 E.06201
G1 X129.292 Y127.464 E.00132
G3 X129.622 Y128.369 I-.064 J.536 E.03655
G1 X129.564 Y128.416 E.00229
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 54.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.516 Y128.456 E-.02399
G1 X129.319 Y128.532 E-.08011
G1 X129.158 Y128.536 E-.06113
G1 X129.003 Y128.492 E-.06114
G1 X128.829 Y128.367 E-.08128
G1 X128.718 Y128.185 E-.08128
G1 X128.686 Y127.973 E-.08128
G1 X128.739 Y127.766 E-.08128
G1 X128.868 Y127.595 E-.08128
G1 X129.053 Y127.488 E-.08128
G1 X129.173 Y127.472 E-.04595
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 273/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L273
M991 S0 P272 ;notify layer change
G17
G3 Z54.8 I-1.2 J.204 P1  F30000
G1 X129.285 Y128.134 Z54.8
G1 Z54.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.286 Y127.866 I-.06 J-.134 E.0194
G1 X129.363 Y127.95 E.00379
G1 X129.358 Y128.064 E.00379
G3 X129.335 Y128.098 I-.132 J-.064 E.00137
G1 X129.516 Y128.456 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.249 Y127.461 I-.287 J-.456 E.06202
G1 X129.292 Y127.464 E.00131
G3 X129.565 Y128.422 I-.063 J.536 E.03895
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 54.8
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.319 Y128.532 E-.10236
G1 X129.158 Y128.536 E-.06114
G1 X128.955 Y128.467 E-.08127
G1 X128.795 Y128.326 E-.08128
G1 X128.702 Y128.133 E-.08127
G1 X128.686 Y127.973 E-.06114
G1 X128.739 Y127.766 E-.08128
G1 X128.868 Y127.595 E-.08128
G1 X129.053 Y127.488 E-.08128
G1 X129.177 Y127.471 E-.04769
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 274/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L274
M991 S0 P273 ;notify layer change
G17
G3 Z55 I-1.182 J.291 P1  F30000
G1 X129.332 Y128.1 Z55
G1 Z54.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.286 Y127.866 I-.107 J-.1 E.02134
G1 X129.351 Y127.923 E.00288
G1 X129.372 Y128.007 E.00288
G3 X129.364 Y128.048 I-.147 J-.008 E.00137
G1 X129.546 Y128.43 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X129.371 Y128.52 E.00605
G3 X129.25 Y127.461 I-.143 J-.52 E.05716
G1 X129.292 Y127.464 E.0013
G3 X129.595 Y128.396 I-.063 J.536 E.03773
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 55
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.371 Y128.52 E-.09721
G1 X129.158 Y128.536 E-.08131
G1 X129.003 Y128.492 E-.06114
G1 X128.829 Y128.367 E-.08128
G1 X128.718 Y128.185 E-.08128
G1 X128.686 Y127.973 E-.08128
G1 X128.739 Y127.766 E-.08128
G1 X128.868 Y127.595 E-.08128
G1 X129.053 Y127.488 E-.08128
G1 X129.138 Y127.477 E-.03265
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 275/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L275
M991 S0 P274 ;notify layer change
G17
G3 Z55.2 I-1.175 J.316 P1  F30000
G1 X129.311 Y128.12 Z55.2
G1 Z55
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.286 Y127.866 I-.086 J-.12 E.02043
G1 X129.342 Y127.911 E.00241
G1 X129.372 Y127.993 E.00288
G1 X129.358 Y128.064 E.00241
G1 X129.349 Y128.074 E.00042
G1 X129.545 Y128.432 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X129.541 Y128.44 E.00026
G3 X129.25 Y127.461 I-.313 J-.44 E.06297
G1 X129.292 Y127.464 E.00129
G3 X129.688 Y128.283 I-.063 J.536 E.03323
G1 X129.587 Y128.389 E.0045
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 55.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.541 Y128.44 E-.02593
G1 X129.447 Y128.492 E-.0409
G1 X129.316 Y128.532 E-.05199
G1 X129.158 Y128.536 E-.06015
G1 X128.955 Y128.467 E-.08127
G1 X128.795 Y128.326 E-.08129
G1 X128.702 Y128.133 E-.08128
G1 X128.686 Y127.973 E-.06114
G1 X128.739 Y127.766 E-.08128
G1 X128.868 Y127.595 E-.08129
G1 X129.053 Y127.488 E-.08127
G1 X129.137 Y127.477 E-.03221
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 276/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L276
M991 S0 P275 ;notify layer change
G17
G3 Z55.4 I-1.171 J.33 P1  F30000
G1 X129.317 Y128.115 Z55.4
G1 Z55.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.207 Y128.146 E.00379
G1 X129.108 Y128.089 E.00379
G1 X129.079 Y127.978 E.00379
G1 X129.139 Y127.881 E.00379
G1 X129.242 Y127.854 E.00353
G1 X129.342 Y127.911 E.00383
G1 X129.371 Y128.022 E.00379
G1 X129.347 Y128.063 E.00158
G1 X129.574 Y128.405 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X129.422 Y128.501 E.00553
G3 X129.213 Y127.46 I-.199 J-.502 E.05802
G1 X129.245 Y127.461 E.00098
G3 X129.619 Y128.366 I-.022 J.539 E.03774
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 55.4
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.422 Y128.501 E-.09085
G1 X129.212 Y128.54 E-.08118
G1 X129.003 Y128.492 E-.08128
G1 X128.829 Y128.367 E-.08128
G1 X128.718 Y128.185 E-.08128
G1 X128.686 Y127.973 E-.08128
G1 X128.739 Y127.766 E-.08128
G1 X128.868 Y127.595 E-.08128
G1 X129.053 Y127.488 E-.08128
G1 X129.102 Y127.48 E-.01901
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 277/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L277
M991 S0 P276 ;notify layer change
G17
G3 Z55.6 I-1.14 J.425 P1  F30000
G1 X129.332 Y128.096 Z55.6
G1 Z55.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.279 Y128.137 E.00223
G3 X129.258 Y127.857 I-.053 J-.137 E.0182
G1 X129.322 Y127.89 E.00241
G1 X129.363 Y127.95 E.00241
G1 X129.371 Y128.022 E.00241
G1 X129.361 Y128.045 E.00083
G1 X129.569 Y128.411 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X129.422 Y128.501 E.0053
G3 X129.213 Y127.46 I-.199 J-.502 E.05802
G1 X129.245 Y127.461 E.00099
G3 X129.614 Y128.372 I-.022 J.539 E.03797
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 55.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.422 Y128.501 E-.08798
G1 X129.212 Y128.54 E-.08118
G1 X129.003 Y128.492 E-.08128
G1 X128.829 Y128.367 E-.08128
G1 X128.718 Y128.185 E-.08128
G1 X128.686 Y127.973 E-.08128
G1 X128.739 Y127.766 E-.08128
G1 X128.868 Y127.595 E-.08128
G1 X129.053 Y127.488 E-.08129
G1 X129.11 Y127.478 E-.02188
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 278/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L278
M991 S0 P277 ;notify layer change
G17
G3 Z55.8 I-1.142 J.419 P1  F30000
G1 X129.336 Y128.096 Z55.8
G1 Z55.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.258 Y127.857 I-.111 J-.096 E.02057
G1 X129.342 Y127.911 E.00334
G1 X129.371 Y128.022 E.00379
G3 X129.366 Y128.043 I-.145 J-.022 E.0007
G1 X129.579 Y128.401 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X129.421 Y128.499 E.00572
G3 X129.213 Y127.46 I-.198 J-.501 E.05789
G1 X129.246 Y127.461 E.001
G3 X129.622 Y128.36 I-.023 J.538 E.03745
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 55.8
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.421 Y128.499 E-.09313
G1 X129.212 Y128.54 E-.08103
G1 X129.003 Y128.492 E-.08128
G1 X128.829 Y128.367 E-.08128
G1 X128.718 Y128.185 E-.08128
G1 X128.686 Y127.973 E-.08128
G1 X128.739 Y127.766 E-.08128
G1 X128.868 Y127.595 E-.08128
G1 X129.053 Y127.488 E-.08128
G1 X129.097 Y127.481 E-.01688
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 279/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L279
M991 S0 P278 ;notify layer change
G17
G3 Z56 I-1.132 J.446 P1  F30000
G1 X129.338 Y128.092 Z56
G1 Z55.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.279 Y128.137 E.00245
G3 X129.258 Y127.857 I-.053 J-.137 E.0182
G1 X129.322 Y127.89 E.00241
G1 X129.363 Y127.95 E.00241
G1 X129.371 Y128.022 E.00241
G1 X129.363 Y128.039 E.00061
G1 X129.575 Y128.407 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X129.422 Y128.501 E.00553
G3 X129.213 Y127.46 I-.199 J-.501 E.05802
M73 P93 R0
G1 X129.246 Y127.461 E.00101
G3 X129.619 Y128.366 I-.023 J.539 E.03771
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 56
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.422 Y128.501 E-.09077
G1 X129.212 Y128.54 E-.08117
G1 X129.003 Y128.492 E-.08128
G1 X128.829 Y128.367 E-.08128
G1 X128.718 Y128.185 E-.08128
G1 X128.686 Y127.973 E-.08128
G1 X128.739 Y127.766 E-.08128
G1 X128.868 Y127.595 E-.08128
G1 X129.053 Y127.488 E-.08128
G1 X129.103 Y127.48 E-.0191
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 280/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L280
M991 S0 P279 ;notify layer change
G17
G3 Z56.2 I-1.165 J.352 P1  F30000
G1 X129.299 Y128.127 Z56.2
G1 Z56
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.258 Y127.857 I-.073 J-.128 E.01893
G1 X129.333 Y127.9 E.00288
G1 X129.371 Y127.978 E.00288
G1 X129.358 Y128.064 E.00288
G1 X129.339 Y128.083 E.00089
G1 X129.576 Y128.408 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X129.414 Y128.504 E.00576
G3 X129.213 Y127.46 I-.191 J-.504 E.05778
G1 X129.246 Y127.461 E.00103
G3 X129.618 Y128.367 I-.023 J.539 E.03771
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 56.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.414 Y128.504 E-.0935
G1 X129.212 Y128.54 E-.07826
G1 X129.003 Y128.492 E-.08128
G1 X128.829 Y128.367 E-.08128
G1 X128.718 Y128.185 E-.08127
G1 X128.686 Y127.973 E-.08128
G1 X128.739 Y127.766 E-.08128
G1 X128.868 Y127.595 E-.08128
G1 X129.053 Y127.488 E-.08128
G1 X129.103 Y127.48 E-.01928
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 281/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L281
M991 S0 P280 ;notify layer change
G17
G3 Z56.4 I-1.145 J.411 P1  F30000
G1 X129.328 Y128.105 Z56.4
G1 Z56.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.258 Y127.857 I-.102 J-.105 E.02014
G1 X129.351 Y127.923 E.00379
G1 X129.368 Y128.036 E.00379
G3 X129.362 Y128.055 I-.142 J-.037 E.00065
G1 X129.588 Y128.395 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X129.422 Y128.501 E.00606
G3 X129.213 Y127.46 I-.199 J-.501 E.05802
G1 X129.247 Y127.461 E.00104
G3 X129.631 Y128.353 I-.024 J.539 E.03715
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 56.4
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.422 Y128.501 E-.09729
G1 X129.212 Y128.54 E-.08118
G1 X129.003 Y128.492 E-.08129
G1 X128.829 Y128.367 E-.08127
G1 X128.718 Y128.185 E-.08127
G1 X128.686 Y127.973 E-.08129
G1 X128.739 Y127.766 E-.08128
G1 X128.868 Y127.595 E-.08128
G1 X129.053 Y127.488 E-.08128
G1 X129.086 Y127.483 E-.01258
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 282/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L282
M991 S0 P281 ;notify layer change
G17
G3 Z56.6 I-1.156 J.382 P1  F30000
G1 X129.299 Y128.127 Z56.6
G1 Z56.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.258 Y127.857 I-.073 J-.128 E.01893
G1 X129.333 Y127.9 E.00288
G1 X129.371 Y127.978 E.00288
G1 X129.358 Y128.064 E.00288
G1 X129.339 Y128.083 E.00089
G1 X129.582 Y128.405 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X129.414 Y128.504 E.00601
G3 X129.213 Y127.46 I-.191 J-.505 E.05776
G1 X129.247 Y127.461 E.00105
G3 X129.622 Y128.362 I-.024 J.539 E.03752
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 56.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.414 Y128.504 E-.09577
G1 X129.212 Y128.54 E-.07799
G1 X129.003 Y128.492 E-.08129
G1 X128.829 Y128.367 E-.08128
G1 X128.718 Y128.185 E-.08128
G1 X128.686 Y127.973 E-.08128
G1 X128.739 Y127.766 E-.08128
G1 X128.868 Y127.595 E-.08128
G1 X129.053 Y127.488 E-.08128
G1 X129.098 Y127.481 E-.01727
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 283/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L283
M991 S0 P282 ;notify layer change
G17
G3 Z56.8 I-1.162 J.361 P1  F30000
G1 X129.299 Y128.127 Z56.8
G1 Z56.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.258 Y127.857 I-.073 J-.128 E.01893
G1 X129.333 Y127.9 E.00288
G1 X129.371 Y127.978 E.00288
G1 X129.358 Y128.064 E.00288
G1 X129.339 Y128.083 E.00089
G1 X129.583 Y128.404 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X129.581 Y128.403 E.00006
G3 X129.213 Y127.46 I-.358 J-.404 E.06379
G1 X129.247 Y127.461 E.00106
G3 X129.709 Y128.233 I-.024 J.539 E.03271
G1 X129.618 Y128.356 E.00468
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 56.8
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.581 Y128.403 E-.02306
G1 X129.414 Y128.506 E-.07443
G1 X129.212 Y128.54 E-.07795
G1 X129.003 Y128.492 E-.08128
G1 X128.829 Y128.367 E-.08128
G1 X128.718 Y128.185 E-.08128
G1 X128.686 Y127.973 E-.08128
G1 X128.739 Y127.766 E-.08128
G1 X128.868 Y127.595 E-.08128
G1 X129.053 Y127.488 E-.08128
G1 X129.094 Y127.481 E-.01561
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 284/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L284
M991 S0 P283 ;notify layer change
G17
G3 Z57 I-1.156 J.38 P1  F30000
G1 X129.305 Y128.123 Z57
G1 Z56.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.258 Y127.857 I-.079 J-.124 E.01917
G1 X129.322 Y127.89 E.00241
G1 X129.358 Y127.936 E.00193
G1 X129.372 Y127.993 E.00193
G1 X129.358 Y128.064 E.00241
G3 X129.348 Y128.081 I-.132 J-.064 E.00065
G1 X129.597 Y128.39 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X129.422 Y128.501 E.00637
G3 X129.213 Y127.46 I-.199 J-.501 E.05801
G1 X129.248 Y127.461 E.00108
G3 X129.637 Y128.345 I-.025 J.539 E.03681
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 57
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.422 Y128.501 E-.10099
G1 X129.212 Y128.54 E-.08118
G1 X129.003 Y128.492 E-.08128
G1 X128.829 Y128.367 E-.08128
G1 X128.718 Y128.185 E-.08128
G1 X128.686 Y127.973 E-.08128
G1 X128.739 Y127.766 E-.08128
G1 X128.868 Y127.595 E-.08128
G1 X129.053 Y127.488 E-.08128
G1 X129.076 Y127.484 E-.00888
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 285/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L285
M991 S0 P284 ;notify layer change
G17
G3 Z57.2 I-1.114 J.49 P1  F30000
G1 X129.342 Y128.089 Z57.2
G1 Z57
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.258 Y127.857 I-.117 J-.089 E.02087
G1 X129.322 Y127.89 E.00241
G1 X129.363 Y127.95 E.00241
G1 X129.371 Y128.022 E.00241
G1 X129.366 Y128.034 E.00042
G1 X129.589 Y128.398 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X129.588 Y128.397 E.00006
G3 X129.213 Y127.46 I-.365 J-.397 E.06408
G1 X129.248 Y127.461 E.00109
G3 X129.709 Y128.233 I-.025 J.539 E.03268
G1 X129.625 Y128.35 E.00442
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 57.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.588 Y128.397 E-.02267
G1 X129.422 Y128.502 E-.0747
G1 X129.212 Y128.54 E-.08128
G1 X129.003 Y128.492 E-.08128
G1 X128.829 Y128.367 E-.08128
G1 X128.718 Y128.185 E-.08128
G1 X128.686 Y127.973 E-.08128
G1 X128.739 Y127.766 E-.08128
G1 X128.868 Y127.595 E-.08128
G1 X129.053 Y127.488 E-.08128
G1 X129.085 Y127.483 E-.01238
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 286/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L286
M991 S0 P285 ;notify layer change
G17
G3 Z57.4 I-1.151 J.394 P1  F30000
G1 X129.305 Y128.123 Z57.4
G1 Z57.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.258 Y127.857 I-.079 J-.124 E.01917
G1 X129.322 Y127.89 E.00241
G1 X129.358 Y127.936 E.00194
G1 X129.372 Y127.993 E.00193
G1 X129.358 Y128.064 E.00241
G3 X129.348 Y128.081 I-.132 J-.064 E.00065
G1 X129.601 Y128.387 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X129.422 Y128.501 E.00655
G3 X129.213 Y127.46 I-.199 J-.502 E.05801
G1 X129.248 Y127.461 E.0011
G3 X129.64 Y128.342 I-.025 J.539 E.03665
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 57.4
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.422 Y128.501 E-.10256
G1 X129.212 Y128.54 E-.08118
G1 X129.003 Y128.492 E-.08128
G1 X128.829 Y128.367 E-.08128
G1 X128.718 Y128.185 E-.08128
G1 X128.686 Y127.973 E-.08128
G1 X128.739 Y127.766 E-.08128
G1 X128.868 Y127.595 E-.08128
G1 X129.053 Y127.488 E-.08128
G1 X129.072 Y127.485 E-.00731
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 287/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L287
M991 S0 P286 ;notify layer change
G17
G3 Z57.6 I-1.125 J.464 P1  F30000
G1 X129.328 Y128.105 Z57.6
G1 Z57.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.258 Y127.857 I-.102 J-.105 E.02014
G1 X129.351 Y127.923 E.00379
G1 X129.368 Y128.036 E.00379
G3 X129.362 Y128.055 I-.142 J-.037 E.00065
G1 X129.6 Y128.385 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.213 Y127.46 I-.378 J-.385 E.0646
G1 X129.249 Y127.461 E.00111
G3 X129.641 Y128.341 I-.026 J.539 E.03659
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 57.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.422 Y128.502 E-.10337
G1 X129.212 Y128.54 E-.08128
G1 X129.003 Y128.492 E-.08128
G1 X128.829 Y128.367 E-.08128
G1 X128.718 Y128.185 E-.08128
G1 X128.686 Y127.973 E-.08128
G1 X128.739 Y127.766 E-.08128
G1 X128.868 Y127.595 E-.08128
G1 X129.053 Y127.488 E-.08128
G1 X129.07 Y127.485 E-.00639
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 288/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L288
M991 S0 P287 ;notify layer change
G17
G3 Z57.8 I-1.109 J.501 P1  F30000
G1 X129.342 Y128.089 Z57.8
G1 Z57.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.258 Y127.857 I-.117 J-.089 E.02087
G1 X129.322 Y127.89 E.00241
G1 X129.363 Y127.95 E.00241
G1 X129.371 Y128.022 E.00241
G1 X129.366 Y128.034 E.00042
G1 X129.592 Y128.394 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X129.589 Y128.396 E.00013
G3 X129.213 Y127.46 I-.366 J-.396 E.06411
G1 X129.249 Y127.461 E.00112
G3 X129.709 Y128.233 I-.026 J.539 E.03265
G1 X129.628 Y128.346 E.00427
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 57.8
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.589 Y128.396 E-.02419
G1 X129.422 Y128.502 E-.07511
G1 X129.212 Y128.54 E-.08128
G1 X129.003 Y128.492 E-.08128
G1 X128.829 Y128.367 E-.08128
G1 X128.718 Y128.185 E-.08128
G1 X128.686 Y127.973 E-.08128
G1 X128.739 Y127.766 E-.08128
G1 X128.868 Y127.595 E-.08128
G1 X129.053 Y127.488 E-.08128
G1 X129.08 Y127.484 E-.01045
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 289/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L289
M991 S0 P288 ;notify layer change
G17
G3 Z58 I-1.148 J.403 P1  F30000
G1 X129.305 Y128.123 Z58
G1 Z57.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.258 Y127.857 I-.079 J-.124 E.01917
G1 X129.322 Y127.89 E.00241
G1 X129.358 Y127.936 E.00193
G1 X129.372 Y127.993 E.00193
G1 X129.358 Y128.064 E.00241
G3 X129.348 Y128.081 I-.132 J-.064 E.00065
G1 X129.601 Y128.385 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.213 Y127.46 I-.378 J-.385 E.0646
G1 X129.25 Y127.461 E.00114
G3 X129.641 Y128.341 I-.027 J.539 E.03656
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 58
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.422 Y128.502 E-.1034
G1 X129.212 Y128.54 E-.08128
G1 X129.003 Y128.492 E-.08128
G1 X128.829 Y128.367 E-.08128
G1 X128.718 Y128.185 E-.08128
G1 X128.686 Y127.973 E-.08128
G1 X128.739 Y127.766 E-.08129
G1 X128.868 Y127.595 E-.08127
G1 X129.053 Y127.488 E-.08128
G1 X129.07 Y127.485 E-.00637
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 290/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L290
M991 S0 P289 ;notify layer change
G17
G3 Z58.2 I-1.142 J.421 P1  F30000
G1 X129.305 Y128.123 Z58.2
G1 Z58
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.258 Y127.857 I-.079 J-.124 E.01917
G1 X129.311 Y127.88 E.00193
G1 X129.358 Y127.936 E.00241
G1 X129.372 Y127.993 E.00193
G1 X129.358 Y128.064 E.00241
G3 X129.348 Y128.081 I-.132 J-.064 E.00065
G1 X129.601 Y128.385 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.213 Y127.46 I-.378 J-.385 E.0646
G1 X129.25 Y127.461 E.00115
G3 X129.641 Y128.341 I-.027 J.539 E.03655
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 58.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.422 Y128.502 E-.1034
G1 X129.212 Y128.54 E-.08128
G1 X129.003 Y128.492 E-.08128
G1 X128.829 Y128.367 E-.08128
G1 X128.718 Y128.185 E-.08128
G1 X128.686 Y127.973 E-.08128
G1 X128.739 Y127.766 E-.08128
G1 X128.868 Y127.595 E-.08128
G1 X129.053 Y127.488 E-.08128
G1 X129.07 Y127.485 E-.00636
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 291/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L291
M991 S0 P290 ;notify layer change
G17
G3 Z58.4 I-1.137 J.433 P1  F30000
G1 X129.311 Y128.119 Z58.4
G1 Z58.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.258 Y127.857 I-.085 J-.12 E.01942
G1 X129.333 Y127.9 E.00288
G1 X129.371 Y127.978 E.00288
G1 X129.358 Y128.064 E.00288
G1 X129.349 Y128.074 E.00042
G1 X129.59 Y128.395 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X129.58 Y128.402 E.00038
G3 X129.213 Y127.46 I-.357 J-.403 E.06363
G1 X129.25 Y127.461 E.00116
G3 X129.708 Y128.233 I-.027 J.538 E.03259
G1 X129.625 Y128.346 E.00433
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 58.4
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.58 Y128.402 E-.02727
G1 X129.399 Y128.511 E-.08003
G1 X129.212 Y128.54 E-.0722
G1 X129.003 Y128.492 E-.08128
G1 X128.829 Y128.367 E-.08128
G1 X128.718 Y128.185 E-.08128
G1 X128.686 Y127.973 E-.08128
G1 X128.739 Y127.766 E-.08128
G1 X128.868 Y127.595 E-.08128
G1 X129.053 Y127.488 E-.08128
G1 X129.083 Y127.483 E-.01154
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 292/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L292
M991 S0 P291 ;notify layer change
G17
G3 Z58.6 I-1.113 J.492 P1  F30000
G1 X129.347 Y128.08 Z58.6
G1 Z58.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.272 Y128.14 E.00317
G3 X129.258 Y127.857 I-.046 J-.14 E.01796
G1 X129.333 Y127.9 E.00288
G1 X129.372 Y127.993 E.00334
G1 X129.364 Y128.023 E.00106
G1 X129.59 Y128.394 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X129.581 Y128.403 E.0004
G3 X129.213 Y127.46 I-.358 J-.404 E.06377
G1 X129.251 Y127.461 E.00117
G3 X129.709 Y128.233 I-.028 J.539 E.03261
G1 X129.626 Y128.346 E.00431
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 58.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.581 Y128.403 E-.02769
G1 X129.397 Y128.512 E-.08115
G1 X129.212 Y128.54 E-.07123
G1 X129.003 Y128.492 E-.08128
G1 X128.829 Y128.367 E-.08129
G1 X128.718 Y128.185 E-.08127
G1 X128.686 Y127.973 E-.08128
G1 X128.739 Y127.766 E-.08128
G1 X128.868 Y127.595 E-.08127
G1 X129.053 Y127.488 E-.08128
G1 X129.082 Y127.483 E-.01098
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 293/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L293
M991 S0 P292 ;notify layer change
G17
G3 Z58.8 I-1.118 J.481 P1  F30000
G1 X129.342 Y128.089 Z58.8
G1 Z58.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.258 Y127.857 I-.117 J-.089 E.02087
G1 X129.322 Y127.89 E.00241
G1 X129.363 Y127.95 E.00241
G1 X129.371 Y128.022 E.00241
G1 X129.366 Y128.034 E.00042
G1 X129.596 Y128.39 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X129.59 Y128.395 E.00023
G3 X129.212 Y127.46 I-.367 J-.395 E.06415
G1 X129.251 Y127.461 E.00118
G3 X129.709 Y128.233 I-.028 J.539 E.0326
G1 X129.631 Y128.341 E.0041
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 58.8
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.59 Y128.395 E-.02561
G1 X129.422 Y128.502 E-.0758
G1 X129.212 Y128.54 E-.08128
G1 X129.003 Y128.492 E-.08128
G1 X128.829 Y128.367 E-.08127
G1 X128.718 Y128.185 E-.08128
G1 X128.686 Y127.973 E-.08128
G1 X128.739 Y127.766 E-.08128
G1 X128.868 Y127.595 E-.08128
G1 X129.053 Y127.488 E-.08128
G1 X129.075 Y127.485 E-.00836
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 294/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L294
M991 S0 P293 ;notify layer change
G17
G3 Z59 I-1.144 J.416 P1  F30000
G1 X129.306 Y128.122 Z59
G1 Z58.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.305 Y128.123 E.00008
G3 X129.258 Y127.857 I-.079 J-.124 E.01917
G1 X129.322 Y127.89 E.00241
G1 X129.358 Y127.936 E.00194
G1 X129.372 Y128.007 E.00241
G1 X129.358 Y128.064 E.00193
G1 X129.346 Y128.077 E.00057
G1 X129.603 Y128.385 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X129.601 Y128.385 E.00006
G3 X129.212 Y127.46 I-.377 J-.385 E.06459
G1 X129.251 Y127.461 E.0012
G3 X129.709 Y128.233 I-.028 J.539 E.03259
G1 X129.637 Y128.336 E.00387
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 59
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.601 Y128.385 E-.02315
G1 X129.422 Y128.502 E-.08114
G1 X129.212 Y128.54 E-.08128
G1 X129.003 Y128.492 E-.08129
G1 X128.829 Y128.367 E-.08127
G1 X128.718 Y128.185 E-.08128
G1 X128.686 Y127.973 E-.08128
G1 X128.739 Y127.766 E-.08128
G1 X128.868 Y127.595 E-.08128
G1 X129.053 Y127.488 E-.08128
G1 X129.067 Y127.486 E-.00547
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 295/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L295
M991 S0 P294 ;notify layer change
G17
G3 Z59.2 I-1.139 J.429 P1  F30000
G1 X129.307 Y128.122 Z59.2
G1 Z59
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
M73 P94 R0
G1 F1200
G1 X129.305 Y128.123 E.00008
G3 X129.258 Y127.857 I-.079 J-.124 E.01917
G1 X129.322 Y127.89 E.00241
G1 X129.358 Y127.936 E.00194
G1 X129.372 Y127.993 E.00193
G1 X129.358 Y128.064 E.00241
G1 X129.346 Y128.077 E.00057
G1 X129.603 Y128.385 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X129.601 Y128.385 E.00007
G3 X129.212 Y127.46 I-.377 J-.385 E.06459
G1 X129.252 Y127.461 E.00121
G3 X129.709 Y128.233 I-.029 J.539 E.03258
G1 X129.637 Y128.336 E.00385
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 59.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.601 Y128.385 E-.0233
G1 X129.422 Y128.502 E-.08115
G1 X129.212 Y128.54 E-.08128
G1 X129.003 Y128.492 E-.08128
G1 X128.829 Y128.367 E-.08128
G1 X128.718 Y128.185 E-.08128
G1 X128.686 Y127.973 E-.08128
G1 X128.739 Y127.766 E-.08128
G1 X128.868 Y127.595 E-.08128
G1 X129.053 Y127.488 E-.08128
G1 X129.067 Y127.486 E-.00531
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 296/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L296
M991 S0 P295 ;notify layer change
G17
G3 Z59.4 I-1.126 J.461 P1  F30000
G1 X129.322 Y128.11 Z59.4
G1 Z59.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.258 Y128.143 E.00241
G1 X129.199 Y128.145 E.00194
G1 X129.133 Y128.115 E.00241
G3 X129.258 Y127.857 I.093 J-.115 E.0131
G1 X129.311 Y127.881 E.00193
G1 X129.358 Y127.936 E.00241
G1 X129.372 Y127.993 E.00193
G1 X129.358 Y128.062 E.00235
G1 X129.619 Y128.366 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.212 Y127.46 I-.396 J-.366 E.0654
G1 X129.252 Y127.461 E.00122
G3 X129.658 Y128.32 I-.029 J.539 E.03567
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 59.4
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.447 Y128.492 E-.10342
G1 X129.238 Y128.54 E-.08128
G1 X129.028 Y128.502 E-.08128
G1 X128.847 Y128.386 E-.08162
G1 X128.739 Y128.234 E-.0709
G1 X128.686 Y128.027 E-.08129
G1 X128.718 Y127.815 E-.08128
G1 X128.829 Y127.633 E-.08128
G1 X129.003 Y127.508 E-.08128
G1 X129.045 Y127.498 E-.01638
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 297/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L297
M991 S0 P296 ;notify layer change
G17
G3 Z59.6 I-1.129 J.455 P1  F30000
G1 X129.299 Y128.127 Z59.6
G1 Z59.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.185 Y128.142 E.00379
G3 X129.258 Y127.857 I.041 J-.141 E.01504
G1 X129.351 Y127.923 E.00379
G1 X129.368 Y128.036 E.00379
G1 X129.335 Y128.08 E.0018
G1 X129.581 Y128.403 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.212 Y127.46 I-.358 J-.404 E.06375
G1 X129.252 Y127.461 E.00123
G3 X129.624 Y128.361 I-.029 J.539 E.03731
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 59.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.397 Y128.512 E-.10336
G1 X129.238 Y128.54 E-.06114
G1 X129.027 Y128.502 E-.08162
G1 X128.868 Y128.405 E-.07089
G1 X128.739 Y128.234 E-.08128
G1 X128.686 Y128.027 E-.08128
G1 X128.718 Y127.815 E-.08128
G1 X128.829 Y127.633 E-.08128
G1 X129.003 Y127.508 E-.08128
G1 X129.097 Y127.487 E-.03659
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 298/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L298
M991 S0 P297 ;notify layer change
G17
G3 Z59.8 I-1.148 J.403 P1  F30000
G1 X129.316 Y128.113 Z59.8
G1 Z59.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.311 Y128.119 E.00028
G1 X129.258 Y128.143 E.00193
G1 X129.199 Y128.145 E.00194
G1 X129.133 Y128.115 E.00241
G3 X129.258 Y127.857 I.093 J-.115 E.0131
G1 X129.311 Y127.881 E.00193
G1 X129.358 Y127.936 E.00241
G1 X129.372 Y128.007 E.00241
G1 X129.358 Y128.064 E.00193
G1 X129.355 Y128.067 E.00014
G1 X129.619 Y128.366 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.212 Y127.46 I-.396 J-.366 E.0654
G1 X129.253 Y127.461 E.00124
G3 X129.658 Y128.32 I-.03 J.539 E.03565
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 59.8
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.447 Y128.492 E-.10342
G1 X129.238 Y128.54 E-.08128
G1 X129.028 Y128.502 E-.08128
G1 X128.847 Y128.386 E-.08164
G1 X128.739 Y128.234 E-.07088
G1 X128.686 Y128.027 E-.08128
G1 X128.718 Y127.815 E-.08128
G1 X128.829 Y127.633 E-.08128
G1 X129.003 Y127.508 E-.08128
G1 X129.045 Y127.498 E-.01639
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 299/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L299
M991 S0 P298 ;notify layer change
G17
G3 Z60 I-1.119 J.479 P1  F30000
G1 X129.311 Y128.119 Z60
G1 Z59.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.258 Y128.143 E.00193
G1 X129.199 Y128.145 E.00194
G1 X129.133 Y128.115 E.00241
G3 X129.258 Y127.857 I.093 J-.115 E.0131
G1 X129.311 Y127.881 E.00193
G1 X129.358 Y127.936 E.00241
G1 X129.372 Y128.007 E.00241
G1 X129.358 Y128.064 E.00193
G1 X129.349 Y128.074 E.00042
G1 X129.581 Y128.403 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.212 Y127.46 I-.358 J-.404 E.06375
G1 X129.253 Y127.461 E.00125
G3 X129.624 Y128.361 I-.03 J.539 E.03729
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 60
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.447 Y128.492 E-.0835
G1 X129.238 Y128.54 E-.08127
G1 X129.028 Y128.502 E-.08127
G1 X128.847 Y128.386 E-.08165
G1 X128.739 Y128.234 E-.07087
G1 X128.686 Y128.027 E-.08128
G1 X128.718 Y127.815 E-.08128
G1 X128.829 Y127.633 E-.08128
G1 X129.003 Y127.508 E-.08129
G1 X129.096 Y127.487 E-.03631
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 300/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L300
M991 S0 P299 ;notify layer change
G17
G3 Z60.2 I-1.135 J.438 P1  F30000
G1 X129.333 Y128.1 Z60.2
G1 Z60
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.272 Y128.14 E.00241
G1 X129.199 Y128.145 E.00241
G1 X129.133 Y128.115 E.00241
G1 X129.089 Y128.057 E.00241
G3 X129.258 Y127.857 I.137 J-.056 E.01068
G1 X129.322 Y127.89 E.00241
G1 X129.363 Y127.95 E.00241
G1 X129.368 Y128.036 E.00288
G1 X129.362 Y128.047 E.00042
G1 X129.618 Y128.365 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.212 Y127.46 I-.395 J-.366 E.06525
G1 X129.254 Y127.461 E.00127
G3 X129.657 Y128.319 I-.03 J.538 E.03559
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 60.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.447 Y128.492 E-.10336
G1 X129.238 Y128.54 E-.08128
G1 X129.028 Y128.502 E-.08128
G1 X128.848 Y128.386 E-.08128
G1 X128.728 Y128.21 E-.08128
G1 X128.696 Y128.107 E-.04084
G1 X128.686 Y127.97 E-.05199
G1 X128.739 Y127.766 E-.08029
G1 X128.868 Y127.595 E-.08128
G1 X129.044 Y127.494 E-.07712
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 301/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L301
M991 S0 P300 ;notify layer change
G17
G3 Z60.4 I-1.119 J.478 P1  F30000
G1 X129.311 Y128.119 Z60.4
G1 Z60.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.199 Y128.145 E.00379
G3 X129.258 Y127.857 I.026 J-.145 E.01553
G1 X129.351 Y127.923 E.00379
G1 X129.368 Y128.036 E.00379
G1 X129.345 Y128.07 E.00135
G1 X129.58 Y128.402 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.212 Y127.46 I-.356 J-.404 E.0636
G1 X129.254 Y127.461 E.00128
G3 X129.623 Y128.36 I-.03 J.538 E.03722
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 60.4
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.447 Y128.492 E-.08345
G1 X129.238 Y128.54 E-.08128
G1 X129.028 Y128.502 E-.08128
G1 X128.868 Y128.405 E-.07123
G1 X128.739 Y128.234 E-.08128
G1 X128.686 Y128.027 E-.08128
G1 X128.718 Y127.815 E-.08128
G1 X128.829 Y127.633 E-.08128
G1 X129.003 Y127.508 E-.08128
G1 X129.096 Y127.487 E-.03636
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 302/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L302
M991 S0 P301 ;notify layer change
G17
G3 Z60.6 I-1.144 J.415 P1  F30000
G1 X129.322 Y128.11 Z60.6
G1 Z60.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.272 Y128.14 E.00193
G1 X129.214 Y128.147 E.00194
G1 X129.145 Y128.124 E.00241
G3 X129.258 Y127.857 I.081 J-.123 E.01359
G1 X129.351 Y127.923 E.00379
G1 X129.372 Y127.993 E.00241
G1 X129.363 Y128.05 E.00194
G1 X129.356 Y128.061 E.00042
G1 X129.58 Y128.402 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.212 Y127.46 I-.356 J-.404 E.0636
G1 X129.254 Y127.461 E.00129
G3 X129.623 Y128.36 I-.031 J.538 E.03722
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 60.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.397 Y128.512 E-.1033
G1 X129.238 Y128.54 E-.06114
G1 X129.028 Y128.502 E-.08128
G1 X128.848 Y128.386 E-.08128
G1 X128.739 Y128.234 E-.07123
G1 X128.686 Y128.027 E-.08128
G1 X128.718 Y127.815 E-.08128
G1 X128.829 Y127.633 E-.08127
G1 X129.003 Y127.508 E-.08129
G1 X129.097 Y127.487 E-.03665
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 303/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L303
M991 S0 P302 ;notify layer change
G17
G3 Z60.8 I-1.145 J.413 P1  F30000
G1 X129.322 Y128.11 Z60.8
G1 Z60.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.258 Y128.143 E.00241
G1 X129.199 Y128.145 E.00193
G1 X129.133 Y128.115 E.00241
G3 X129.258 Y127.857 I.093 J-.115 E.0131
G1 X129.322 Y127.89 E.00241
G1 X129.358 Y127.936 E.00193
G1 X129.372 Y127.993 E.00193
G1 X129.358 Y128.062 E.00235
G1 X129.619 Y128.366 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.212 Y127.46 I-.396 J-.366 E.06538
G1 X129.255 Y127.461 E.0013
G3 X129.658 Y128.32 I-.031 J.538 E.03561
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 60.8
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.447 Y128.492 E-.10337
G1 X129.238 Y128.54 E-.08128
G1 X129.028 Y128.502 E-.08128
G1 X128.847 Y128.386 E-.08169
G1 X128.739 Y128.234 E-.07083
G1 X128.686 Y128.027 E-.08128
G1 X128.718 Y127.815 E-.08128
G1 X128.829 Y127.633 E-.08128
G1 X129.003 Y127.508 E-.08128
G1 X129.045 Y127.498 E-.01643
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 304/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L304
M991 S0 P303 ;notify layer change
G17
G3 Z61 I-1.129 J.455 P1  F30000
G1 X129.299 Y128.127 Z61
G1 Z60.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.185 Y128.142 E.00379
G3 X129.258 Y127.857 I.041 J-.141 E.01505
G1 X129.351 Y127.923 E.00379
G1 X129.368 Y128.036 E.00379
G1 X129.335 Y128.08 E.0018
G1 X129.581 Y128.404 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.212 Y127.46 I-.358 J-.404 E.06373
G1 X129.255 Y127.461 E.00131
G3 X129.624 Y128.361 I-.031 J.538 E.03725
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 61
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.397 Y128.512 E-.10338
G1 X129.238 Y128.54 E-.06114
G1 X129.027 Y128.502 E-.08169
G1 X128.868 Y128.405 E-.07082
G1 X128.739 Y128.234 E-.08128
G1 X128.686 Y128.027 E-.08128
G1 X128.718 Y127.815 E-.08128
G1 X128.829 Y127.633 E-.08127
G1 X129.003 Y127.508 E-.08129
G1 X129.097 Y127.487 E-.03657
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 305/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L305
M991 S0 P304 ;notify layer change
G17
G3 Z61.2 I-1.136 J.437 P1  F30000
G1 X129.333 Y128.1 Z61.2
G1 Z61
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.286 Y128.134 E.00194
G1 X129.171 Y128.137 E.00379
G3 X129.258 Y127.857 I.055 J-.137 E.01456
G1 X129.351 Y127.923 E.00379
G1 X129.368 Y128.036 E.00379
G1 X129.362 Y128.047 E.00042
G1 X129.583 Y128.404 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X129.58 Y128.402 E.0001
G3 X129.212 Y127.46 I-.356 J-.404 E.06359
G1 X129.255 Y127.461 E.00133
G3 X129.708 Y128.233 I-.032 J.537 E.03246
G1 X129.618 Y128.356 E.00468
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 61.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.58 Y128.402 E-.02296
G1 X129.397 Y128.512 E-.08104
G1 X129.238 Y128.54 E-.06114
G1 X129.028 Y128.502 E-.08128
G1 X128.932 Y128.453 E-.04084
G1 X128.828 Y128.365 E-.05199
G1 X128.718 Y128.185 E-.08029
G1 X128.686 Y128.027 E-.06114
G1 X128.718 Y127.815 E-.08128
G1 X128.829 Y127.633 E-.08128
G1 X129.003 Y127.508 E-.08128
G1 X129.094 Y127.487 E-.03548
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 306/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L306
M991 S0 P305 ;notify layer change
G17
G3 Z61.4 I-1.131 J.45 P1  F30000
G1 X129.335 Y128.094 Z61.4
G1 Z61.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.286 Y128.134 E.00212
G1 X129.199 Y128.145 E.00288
G1 X129.133 Y128.115 E.00241
G1 X129.089 Y128.057 E.00241
G3 X129.258 Y127.857 I.137 J-.056 E.01068
G1 X129.322 Y127.89 E.00241
G1 X129.363 Y127.95 E.00241
G1 X129.371 Y128.022 E.00241
G1 X129.362 Y128.042 E.00071
G1 X129.583 Y128.404 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X129.58 Y128.402 E.0001
G3 X129.212 Y127.46 I-.356 J-.404 E.06359
G1 X129.256 Y127.461 E.00134
G3 X129.709 Y128.233 I-.032 J.537 E.03245
G1 X129.618 Y128.356 E.00468
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 61.4
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.58 Y128.402 E-.02294
G1 X129.397 Y128.512 E-.08105
G1 X129.238 Y128.54 E-.06114
G1 X129.028 Y128.502 E-.08128
G1 X128.848 Y128.386 E-.08129
G1 X128.728 Y128.21 E-.08128
G1 X128.696 Y128.107 E-.04084
G1 X128.686 Y127.97 E-.05199
G1 X128.739 Y127.766 E-.0803
G1 X128.868 Y127.595 E-.08128
G1 X129.053 Y127.488 E-.08128
G1 X129.093 Y127.481 E-.01535
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 307/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L307
M991 S0 P306 ;notify layer change
G17
G3 Z61.6 I-1.143 J.417 P1  F30000
G1 X129.322 Y128.11 Z61.6
G1 Z61.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.258 Y128.143 E.00241
G1 X129.199 Y128.145 E.00193
G1 X129.133 Y128.115 E.00241
G3 X129.258 Y127.857 I.093 J-.115 E.0131
G1 X129.322 Y127.89 E.00241
G1 X129.358 Y127.936 E.00193
G1 X129.372 Y128.007 E.00241
G1 X129.358 Y128.062 E.00188
G1 X129.583 Y128.404 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X129.581 Y128.404 E.00005
G3 X129.212 Y127.46 I-.357 J-.404 E.06372
G1 X129.256 Y127.461 E.00135
G3 X129.71 Y128.233 I-.032 J.538 E.03247
G1 X129.619 Y128.356 E.00469
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 61.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.581 Y128.404 E-.02304
G1 X129.397 Y128.512 E-.08117
G1 X129.238 Y128.54 E-.06114
G1 X129.028 Y128.502 E-.08128
G1 X128.847 Y128.386 E-.08172
G1 X128.739 Y128.234 E-.07079
G1 X128.686 Y128.027 E-.08128
G1 X128.718 Y127.815 E-.08128
G1 X128.829 Y127.633 E-.08128
G1 X129.003 Y127.508 E-.08128
G1 X129.095 Y127.487 E-.03574
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 308/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L308
M991 S0 P307 ;notify layer change
G17
G3 Z61.8 I-1.16 J.369 P1  F30000
G1 X129.299 Y128.127 Z61.8
G1 Z61.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.185 Y128.142 E.00379
G3 X129.258 Y127.857 I.041 J-.141 E.01505
G1 X129.351 Y127.923 E.00379
G1 X129.368 Y128.036 E.00379
G1 X129.335 Y128.08 E.0018
G1 X129.583 Y128.404 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X129.581 Y128.404 E.00005
G3 X129.212 Y127.46 I-.357 J-.404 E.06371
G1 X129.256 Y127.461 E.00136
G3 X129.71 Y128.233 I-.033 J.538 E.03246
G1 X129.619 Y128.356 E.00469
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 61.8
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.581 Y128.404 E-.023
G1 X129.397 Y128.512 E-.08118
G1 X129.238 Y128.54 E-.06114
G1 X129.027 Y128.502 E-.08174
G1 X128.868 Y128.405 E-.07078
G1 X128.739 Y128.234 E-.08128
G1 X128.686 Y128.027 E-.08127
G1 X128.718 Y127.815 E-.08128
G1 X128.829 Y127.633 E-.08128
G1 X129.003 Y127.508 E-.08128
G1 X129.095 Y127.487 E-.03577
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 309/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L309
M991 S0 P308 ;notify layer change
G17
G3 Z62 I-1.125 J.463 P1  F30000
G1 X129.342 Y128.089 Z62
G1 Z61.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.286 Y128.134 E.00241
G1 X129.214 Y128.147 E.00241
G1 X129.133 Y128.115 E.00288
G1 X129.089 Y128.057 E.00241
G3 X129.258 Y127.857 I.137 J-.056 E.01068
G1 X129.322 Y127.89 E.00241
G1 X129.363 Y127.95 E.00241
G1 X129.371 Y128.022 E.00241
G1 X129.366 Y128.034 E.00042
G1 X129.619 Y128.368 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X129.446 Y128.489 E.0065
G3 X129.212 Y127.46 I-.222 J-.491 E.05864
G1 X129.257 Y127.461 E.00137
G3 X129.655 Y128.321 I-.033 J.537 E.03561
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 62
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.446 Y128.489 E-.1019
G1 X129.238 Y128.54 E-.08106
G1 X129.028 Y128.502 E-.08128
G1 X128.848 Y128.386 E-.08128
G1 X128.728 Y128.21 E-.08128
G1 X128.696 Y128.107 E-.04084
G1 X128.686 Y127.97 E-.05199
G1 X128.739 Y127.766 E-.08029
G1 X128.868 Y127.595 E-.08128
G1 X129.047 Y127.492 E-.0788
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 310/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L310
M991 S0 P309 ;notify layer change
G17
G3 Z62.2 I-1.132 J.447 P1  F30000
G1 X129.299 Y128.127 Z62.2
G1 Z62
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.185 Y128.142 E.00379
G3 X129.258 Y127.857 I.041 J-.141 E.01505
G1 X129.351 Y127.923 E.00379
G1 X129.368 Y128.036 E.00379
G1 X129.335 Y128.08 E.0018
G1 X129.581 Y128.404 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.212 Y127.46 I-.357 J-.404 E.06371
G1 X129.257 Y127.461 E.00139
G3 X129.624 Y128.362 I-.033 J.538 E.0372
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 62.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.397 Y128.512 E-.10338
G1 X129.238 Y128.54 E-.06114
G1 X129.027 Y128.502 E-.08177
G1 X128.868 Y128.405 E-.07075
G1 X128.739 Y128.234 E-.08128
G1 X128.686 Y128.027 E-.08128
G1 X128.718 Y127.815 E-.08127
G1 X128.829 Y127.633 E-.08128
G1 X129.003 Y127.508 E-.08128
G1 X129.097 Y127.487 E-.03656
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 311/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L311
M991 S0 P310 ;notify layer change
G17
G3 Z62.4 I-1.127 J.459 P1  F30000
G1 X129.342 Y128.089 Z62.4
G1 Z62.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.286 Y128.134 E.00241
G1 X129.214 Y128.147 E.00241
G1 X129.133 Y128.115 E.00288
G1 X129.089 Y128.057 E.00241
G3 X129.258 Y127.857 I.137 J-.056 E.01068
G1 X129.322 Y127.89 E.00241
M73 P95 R0
G1 X129.363 Y127.95 E.00241
G1 X129.371 Y128.022 E.00241
G1 X129.366 Y128.034 E.00042
G1 X129.619 Y128.368 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X129.446 Y128.489 E.0065
G3 X129.212 Y127.46 I-.222 J-.491 E.05863
G1 X129.258 Y127.461 E.0014
G3 X129.655 Y128.321 I-.034 J.537 E.03559
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 62.4
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.446 Y128.489 E-.10193
G1 X129.238 Y128.54 E-.08106
G1 X129.028 Y128.502 E-.08128
G1 X128.848 Y128.386 E-.08128
G1 X128.728 Y128.21 E-.08128
G1 X128.696 Y128.107 E-.04084
G1 X128.686 Y127.97 E-.05199
G1 X128.739 Y127.766 E-.08029
G1 X128.868 Y127.595 E-.08128
G1 X129.047 Y127.492 E-.07876
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 312/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L312
M991 S0 P311 ;notify layer change
G17
G3 Z62.6 I-1.102 J.517 P1  F30000
G1 X129.333 Y128.1 Z62.6
G1 Z62.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.272 Y128.14 E.00241
G1 X129.185 Y128.142 E.00288
G1 X129.122 Y128.105 E.00241
G1 X129.084 Y128.043 E.00241
G3 X129.258 Y127.857 I.142 J-.042 E.01019
G1 X129.333 Y127.9 E.00288
G1 X129.368 Y127.964 E.00241
G1 X129.368 Y128.036 E.00241
G1 X129.362 Y128.047 E.00042
G1 X129.581 Y128.404 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.212 Y127.46 I-.357 J-.404 E.0637
G1 X129.258 Y127.461 E.00141
G3 X129.624 Y128.362 I-.034 J.538 E.03719
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 62.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.397 Y128.512 E-.10339
G1 X129.238 Y128.54 E-.06114
G1 X129.028 Y128.502 E-.08128
G1 X128.848 Y128.386 E-.08128
G1 X128.728 Y128.21 E-.08128
G1 X128.686 Y128.027 E-.07104
G1 X128.718 Y127.815 E-.08147
G1 X128.829 Y127.633 E-.08128
G1 X129.003 Y127.508 E-.08128
G1 X129.097 Y127.487 E-.03656
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 313/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L313
M991 S0 P312 ;notify layer change
G17
G3 Z62.8 I-1.136 J.437 P1  F30000
G1 X129.333 Y128.1 Z62.8
G1 Z62.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.286 Y128.134 E.00194
G1 X129.171 Y128.137 E.00379
G3 X129.258 Y127.857 I.055 J-.137 E.01456
G1 X129.351 Y127.923 E.00379
G1 X129.368 Y128.036 E.00379
G1 X129.362 Y128.047 E.00042
G1 X129.58 Y128.403 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.212 Y127.46 I-.356 J-.404 E.06356
G1 X129.258 Y127.461 E.00142
G3 X129.623 Y128.36 I-.034 J.537 E.03713
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 62.8
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.397 Y128.512 E-.10332
G1 X129.238 Y128.54 E-.06114
G1 X129.028 Y128.502 E-.08128
G1 X128.932 Y128.453 E-.04085
G1 X128.828 Y128.365 E-.05199
G1 X128.718 Y128.185 E-.08029
G1 X128.686 Y128.027 E-.06114
G1 X128.718 Y127.815 E-.08128
G1 X128.829 Y127.633 E-.08128
G1 X129.003 Y127.508 E-.08128
G1 X129.096 Y127.487 E-.03616
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 314/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L314
M991 S0 P313 ;notify layer change
G17
G3 Z63 I-1.148 J.403 P1  F30000
G1 X129.316 Y128.113 Z63
G1 Z62.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.311 Y128.119 E.00026
G1 X129.258 Y128.143 E.00193
G1 X129.199 Y128.145 E.00194
G1 X129.133 Y128.115 E.00241
G3 X129.258 Y127.857 I.093 J-.115 E.0131
G1 X129.322 Y127.89 E.00241
G1 X129.358 Y127.936 E.00194
G1 X129.372 Y128.007 E.00241
G1 X129.358 Y128.064 E.00193
G1 X129.355 Y128.068 E.00016
G1 X129.619 Y128.368 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X129.447 Y128.491 E.00651
G3 X129.212 Y127.46 I-.222 J-.491 E.05874
G1 X129.259 Y127.461 E.00143
G3 X129.657 Y128.322 I-.034 J.538 E.03558
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 63
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.447 Y128.491 E-.10267
G1 X129.238 Y128.54 E-.0812
G1 X129.028 Y128.502 E-.08128
G1 X128.847 Y128.385 E-.08182
G1 X128.739 Y128.234 E-.0707
G1 X128.686 Y128.027 E-.08128
G1 X128.718 Y127.815 E-.08128
G1 X128.829 Y127.633 E-.08128
G1 X129.003 Y127.508 E-.08127
G1 X129.047 Y127.498 E-.01721
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 315/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L315
M991 S0 P314 ;notify layer change
G17
G3 Z63.2 I-1.129 J.454 P1  F30000
G1 X129.3 Y128.126 Z63.2
G1 Z63
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.299 Y128.127 E.00006
G1 X129.229 Y128.147 E.00241
G1 X129.171 Y128.137 E.00194
G3 X129.239 Y127.853 I.055 J-.137 E.01392
G1 X129.299 Y127.873 E.00209
G1 X129.342 Y127.911 E.00194
G1 X129.368 Y127.964 E.00193
G1 X129.368 Y128.036 E.00241
G1 X129.336 Y128.078 E.00174
G1 X129.619 Y128.368 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X129.446 Y128.489 E.0065
G3 X129.212 Y127.46 I-.222 J-.491 E.05861
G1 X129.259 Y127.461 E.00144
G3 X129.655 Y128.321 I-.035 J.537 E.03555
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 63.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.446 Y128.489 E-.10202
G1 X129.238 Y128.54 E-.08107
G1 X129.028 Y128.502 E-.08128
G1 X128.932 Y128.453 E-.04084
G1 X128.828 Y128.365 E-.05199
G1 X128.718 Y128.185 E-.08029
G1 X128.686 Y128.027 E-.06114
G1 X128.718 Y127.815 E-.08128
G1 X128.829 Y127.633 E-.08128
G1 X129.003 Y127.508 E-.08127
G1 X129.048 Y127.498 E-.01753
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 316/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L316
M991 S0 P315 ;notify layer change
G17
G3 Z63.4 I-1.105 J.511 P1  F30000
G1 X129.323 Y128.093 Z63.4
G1 Z63.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.286 Y128.134 E.00184
G1 X129.185 Y128.142 E.00334
G3 X129.28 Y127.861 I.042 J-.142 E.01587
G1 X129.358 Y127.936 E.00358
G1 X129.363 Y128.049 E.00375
G1 X129.619 Y128.368 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X129.446 Y128.49 E.00651
G3 X129.212 Y127.46 I-.225 J-.49 E.05888
G1 X129.254 Y127.461 E.00129
G3 X129.655 Y128.321 I-.032 J.538 E.03563
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 63.4
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.446 Y128.49 E-.10189
G1 X129.238 Y128.54 E-.08112
G1 X129.079 Y128.52 E-.06114
G1 X128.891 Y128.424 E-.07996
G1 X128.795 Y128.326 E-.05216
G1 X128.739 Y128.234 E-.04101
G1 X128.686 Y128.027 E-.08128
G1 X128.718 Y127.815 E-.08128
G1 X128.829 Y127.633 E-.08128
G1 X129.003 Y127.508 E-.08128
G1 X129.048 Y127.498 E-.0176
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 317/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L317
M991 S0 P316 ;notify layer change
G17
G3 Z63.6 I-1.1 J.52 P1  F30000
G1 X129.333 Y128.1 Z63.6
G1 Z63.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.272 Y128.14 E.00241
G1 X129.199 Y128.145 E.00241
G1 X129.133 Y128.115 E.00241
G1 X129.089 Y128.057 E.00241
G3 X129.28 Y127.861 I.139 J-.056 E.01145
G1 X129.333 Y127.9 E.00218
G1 X129.368 Y127.964 E.00241
G1 X129.368 Y128.036 E.00241
G1 X129.362 Y128.047 E.00042
G1 X129.58 Y128.403 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.212 Y127.46 I-.359 J-.403 E.06382
G1 X129.254 Y127.461 E.0013
G3 X129.623 Y128.36 I-.033 J.538 E.03717
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 63.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.447 Y128.492 E-.08346
G1 X129.238 Y128.54 E-.08128
G1 X129.028 Y128.502 E-.08129
G1 X128.848 Y128.386 E-.08128
G1 X128.728 Y128.21 E-.08128
G1 X128.696 Y128.107 E-.04084
G1 X128.686 Y127.97 E-.05199
G1 X128.739 Y127.766 E-.08029
G1 X128.868 Y127.595 E-.08128
G1 X129.053 Y127.488 E-.08128
G1 X129.094 Y127.481 E-.01574
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 318/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L318
M991 S0 P317 ;notify layer change
G17
G3 Z63.8 I-1.16 J.367 P1  F30000
G1 X129.299 Y128.127 Z63.8
G1 Z63.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.199 Y128.145 E.00334
G3 X129.28 Y127.861 I.027 J-.146 E.01632
G1 X129.358 Y127.936 E.00359
G1 X129.368 Y128.036 E.00334
G1 X129.335 Y128.08 E.0018
G1 X129.58 Y128.403 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.212 Y127.46 I-.359 J-.403 E.06381
G1 X129.255 Y127.461 E.00131
G3 X129.623 Y128.36 I-.033 J.538 E.03716
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 63.8
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.397 Y128.512 E-.10331
G1 X129.238 Y128.54 E-.06113
G1 X129.028 Y128.502 E-.08128
G1 X128.868 Y128.405 E-.07123
G1 X128.739 Y128.234 E-.08129
G1 X128.686 Y128.027 E-.08127
G1 X128.718 Y127.815 E-.08128
G1 X128.829 Y127.633 E-.08128
G1 X129.003 Y127.508 E-.08128
G1 X129.097 Y127.487 E-.03665
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 319/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L319
M991 S0 P318 ;notify layer change
G17
G3 Z64 I-1.167 J.346 P1  F30000
G1 X129.288 Y128.131 Z64
G1 Z63.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.286 Y128.134 E.00013
G1 X129.171 Y128.137 E.00379
G3 X129.28 Y127.861 I.056 J-.137 E.01534
G1 X129.358 Y127.936 E.00359
G1 X129.363 Y128.05 E.00379
G1 X129.329 Y128.087 E.00168
G1 X129.58 Y128.403 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.212 Y127.46 I-.359 J-.403 E.06381
G1 X129.255 Y127.461 E.00132
G3 X129.623 Y128.36 I-.033 J.538 E.03715
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 64
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.447 Y128.492 E-.08345
G1 X129.238 Y128.54 E-.08128
G1 X129.028 Y128.502 E-.08128
G1 X128.932 Y128.453 E-.04084
G1 X128.828 Y128.365 E-.05198
G1 X128.718 Y128.185 E-.0803
G1 X128.686 Y128.027 E-.06114
G1 X128.718 Y127.815 E-.08128
G1 X128.829 Y127.633 E-.08128
G1 X129.003 Y127.508 E-.08128
G1 X129.095 Y127.487 E-.03588
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 320/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L320
M991 S0 P319 ;notify layer change
G17
G3 Z64.2 I-1.16 J.369 P1  F30000
G1 X129.299 Y128.127 Z64.2
G1 Z64
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.185 Y128.142 E.00379
G3 X129.279 Y127.861 I.041 J-.142 E.01585
G1 X129.358 Y127.936 E.0036
G1 X129.363 Y128.05 E.00379
G1 X129.337 Y128.081 E.00135
G1 X129.583 Y128.403 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X129.58 Y128.403 E.00009
G3 X129.212 Y127.46 I-.358 J-.403 E.0638
G1 X129.255 Y127.461 E.00133
G3 X129.708 Y128.233 I-.033 J.538 E.03241
G1 X129.619 Y128.355 E.00466
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 64.2
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.58 Y128.403 E-.0232
G1 X129.397 Y128.512 E-.08107
G1 X129.238 Y128.54 E-.06114
G1 X129.079 Y128.52 E-.06114
G1 X128.891 Y128.424 E-.08001
G1 X128.795 Y128.326 E-.05214
G1 X128.739 Y128.234 E-.04097
G1 X128.686 Y128.027 E-.08128
G1 X128.718 Y127.815 E-.08127
G1 X128.829 Y127.633 E-.08129
G1 X129.003 Y127.508 E-.08128
G1 X129.093 Y127.487 E-.0352
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 321/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L321
M991 S0 P320 ;notify layer change
G17
G3 Z64.4 I-1.124 J.466 P1  F30000
G1 X129.342 Y128.089 Z64.4
G1 Z64.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.299 Y128.127 E.00193
G1 X129.229 Y128.147 E.00241
G1 X129.171 Y128.137 E.00194
G1 X129.112 Y128.095 E.00241
G3 X129.279 Y127.861 I.115 J-.094 E.01291
G1 X129.333 Y127.9 E.0022
G1 X129.368 Y127.964 E.00241
G1 X129.371 Y128.022 E.00193
G1 X129.366 Y128.034 E.00042
G1 X129.62 Y128.368 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X129.446 Y128.49 E.00652
G3 X129.212 Y127.46 I-.224 J-.491 E.05886
G1 X129.256 Y127.461 E.00135
G3 X129.655 Y128.321 I-.034 J.538 E.03558
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 64.4
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.446 Y128.49 E-.1021
G1 X129.238 Y128.54 E-.08113
G1 X129.028 Y128.502 E-.08128
G1 X128.848 Y128.386 E-.08128
G1 X128.728 Y128.21 E-.08128
G1 X128.686 Y128.027 E-.07111
G1 X128.718 Y127.815 E-.0814
G1 X128.829 Y127.633 E-.08128
G1 X129.003 Y127.508 E-.08128
G1 X129.049 Y127.498 E-.01786
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 322/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L322
M991 S0 P321 ;notify layer change
G17
G3 Z64.6 I-1.131 J.449 P1  F30000
G1 X129.299 Y128.127 Z64.6
G1 Z64.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.199 Y128.145 E.00334
G3 X129.274 Y127.86 I.027 J-.145 E.01611
G1 X129.358 Y127.936 E.00375
G1 X129.368 Y128.036 E.00334
G1 X129.335 Y128.08 E.0018
G1 X129.582 Y128.404 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X129.58 Y128.403 E.00008
G3 X129.212 Y127.46 I-.358 J-.403 E.0638
G1 X129.256 Y127.461 E.00136
G3 X129.708 Y128.233 I-.034 J.538 E.0324
G1 X129.618 Y128.356 E.0047
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 64.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.58 Y128.403 E-.02274
G1 X129.397 Y128.512 E-.08108
G1 X129.238 Y128.54 E-.06114
G1 X129.028 Y128.502 E-.08128
G1 X128.868 Y128.405 E-.07123
G1 X128.739 Y128.234 E-.08128
G1 X128.686 Y128.027 E-.08128
G1 X128.718 Y127.815 E-.08128
G1 X128.829 Y127.633 E-.08128
G1 X129.003 Y127.508 E-.08127
G1 X129.096 Y127.487 E-.03612
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 323/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L323
M991 S0 P322 ;notify layer change
G17
G3 Z64.8 I-1.152 J.392 P1  F30000
G1 X129.311 Y128.119 Z64.8
G1 Z64.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.199 Y128.145 E.00379
G3 X129.274 Y127.86 I.027 J-.145 E.0161
G1 X129.358 Y127.936 E.00375
G1 X129.368 Y128.036 E.00334
G1 X129.345 Y128.07 E.00135
G1 X129.62 Y128.368 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X129.446 Y128.49 E.00653
G3 X129.212 Y127.46 I-.224 J-.491 E.05885
G1 X129.256 Y127.461 E.00137
G3 X129.655 Y128.321 I-.034 J.538 E.03556
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 64.8
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.446 Y128.49 E-.10217
G1 X129.238 Y128.54 E-.08113
G1 X129.028 Y128.502 E-.08128
G1 X128.868 Y128.405 E-.07123
G1 X128.739 Y128.234 E-.08128
G1 X128.686 Y128.027 E-.08128
G1 X128.718 Y127.815 E-.08128
G1 X128.829 Y127.633 E-.08129
G1 X129.003 Y127.508 E-.08128
G1 X129.049 Y127.498 E-.01778
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 324/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L324
M991 S0 P323 ;notify layer change
G17
G3 Z65 I-1.09 J.541 P1  F30000
G1 X129.342 Y128.089 Z65
G1 Z64.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.286 Y128.134 E.00241
G1 X129.229 Y128.147 E.00194
G1 X129.158 Y128.131 E.00241
G1 X129.103 Y128.083 E.00241
G3 X129.274 Y127.86 I.123 J-.083 E.01224
G1 X129.333 Y127.9 E.00236
G1 X129.368 Y127.964 E.00241
G1 X129.368 Y128.035 E.00235
G1 X129.62 Y128.368 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X129.446 Y128.49 E.00653
G3 X129.212 Y127.46 I-.224 J-.491 E.05884
G1 X129.257 Y127.461 E.00138
G3 X129.655 Y128.321 I-.035 J.538 E.03555
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 65
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.446 Y128.49 E-.10221
G1 X129.238 Y128.54 E-.08114
G1 X129.028 Y128.502 E-.08128
G1 X128.848 Y128.386 E-.08128
G1 X128.728 Y128.21 E-.08128
G1 X128.686 Y128.027 E-.07113
G1 X128.718 Y127.815 E-.08138
G1 X128.829 Y127.633 E-.08128
G1 X129.003 Y127.508 E-.08128
G1 X129.049 Y127.498 E-.01774
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 325/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L325
M991 S0 P324 ;notify layer change
G17
G3 Z65.2 I-1.111 J.497 P1  F30000
G1 X129.322 Y128.11 Z65.2
G1 Z65
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.229 Y128.147 E.00334
G3 X129.274 Y127.86 I-.002 J-.148 E.01707
G1 X129.351 Y127.923 E.0033
G1 X129.371 Y128.022 E.00334
G1 X129.351 Y128.058 E.00135
G1 X129.62 Y128.368 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X129.446 Y128.49 E.00653
G3 X129.212 Y127.46 I-.224 J-.491 E.05884
G1 X129.257 Y127.461 E.00139
G3 X129.655 Y128.321 I-.035 J.538 E.03554
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 65.2
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.446 Y128.49 E-.10224
G1 X129.238 Y128.54 E-.08114
G1 X129.081 Y128.52 E-.06015
G1 X128.955 Y128.467 E-.05199
G1 X128.868 Y128.405 E-.04084
G1 X128.739 Y128.234 E-.08128
G1 X128.686 Y128.027 E-.08128
G1 X128.718 Y127.815 E-.08128
G1 X128.829 Y127.633 E-.08128
G1 X129.003 Y127.508 E-.08128
G1 X129.047 Y127.498 E-.01724
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 326/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L326
M991 S0 P325 ;notify layer change
G17
G3 Z65.4 I-1.11 J.499 P1  F30000
G1 X129.322 Y128.11 Z65.4
G1 Z65.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.229 Y128.147 E.00334
G3 X129.274 Y127.86 I-.003 J-.148 E.01711
G1 X129.351 Y127.923 E.0033
G1 X129.371 Y128.022 E.00334
G1 X129.351 Y128.058 E.00135
G1 X129.584 Y128.403 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X129.581 Y128.403 E.0001
G3 X129.212 Y127.46 I-.358 J-.403 E.06378
G1 X129.257 Y127.461 E.0014
G3 X129.709 Y128.233 I-.035 J.538 E.03237
G1 X129.619 Y128.354 E.00463
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 65.4
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.581 Y128.403 E-.02363
G1 X129.397 Y128.512 E-.0811
G1 X129.238 Y128.54 E-.06114
G1 X129.082 Y128.52 E-.05994
G1 X128.955 Y128.468 E-.0521
G1 X128.868 Y128.405 E-.04093
G1 X128.739 Y128.234 E-.08128
G1 X128.686 Y128.027 E-.08128
G1 X128.718 Y127.815 E-.08128
M73 P96 R0
G1 X128.829 Y127.633 E-.08128
G1 X129.003 Y127.508 E-.08128
G1 X129.092 Y127.488 E-.03476
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 327/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L327
M991 S0 P326 ;notify layer change
G17
G3 Z65.6 I-1.141 J.422 P1  F30000
G1 X129.322 Y128.11 Z65.6
G1 Z65.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.229 Y128.147 E.00334
G3 X129.274 Y127.86 I-.003 J-.148 E.01712
G1 X129.351 Y127.923 E.00329
G1 X129.371 Y128.022 E.00334
G1 X129.351 Y128.058 E.00135
G1 X129.584 Y128.402 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X129.581 Y128.403 E.00011
G3 X129.212 Y127.46 I-.358 J-.403 E.06377
G1 X129.258 Y127.461 E.00142
G3 X129.709 Y128.233 I-.035 J.538 E.03236
G1 X129.62 Y128.354 E.00462
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 65.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.581 Y128.403 E-.02381
G1 X129.397 Y128.512 E-.0811
G1 X129.238 Y128.54 E-.06113
G1 X129.082 Y128.52 E-.05995
G1 X128.955 Y128.468 E-.0521
G1 X128.868 Y128.405 E-.04093
G1 X128.739 Y128.234 E-.08128
G1 X128.686 Y128.027 E-.08128
G1 X128.718 Y127.815 E-.08128
G1 X128.829 Y127.633 E-.08128
G1 X129.003 Y127.508 E-.08128
G1 X129.092 Y127.488 E-.03458
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 328/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L328
M991 S0 P327 ;notify layer change
G17
G3 Z65.8 I-1.132 J.446 P1  F30000
G1 X129.333 Y128.1 Z65.8
G1 Z65.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.272 Y128.14 E.00241
G1 X129.199 Y128.145 E.00241
G1 X129.133 Y128.115 E.00241
G1 X129.089 Y128.057 E.00241
G3 X129.274 Y127.86 I.137 J-.057 E.01127
G1 X129.333 Y127.9 E.00235
G1 X129.368 Y127.964 E.00241
G1 X129.368 Y128.036 E.00241
G1 X129.362 Y128.047 E.00042
G1 X129.583 Y128.404 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X129.581 Y128.403 E.00007
G3 X129.212 Y127.46 I-.358 J-.403 E.06377
G1 X129.258 Y127.461 E.00143
G3 X129.709 Y128.233 I-.036 J.538 E.03235
G1 X129.618 Y128.356 E.00469
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 65.8
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.581 Y128.403 E-.02292
G1 X129.397 Y128.512 E-.08111
G1 X129.238 Y128.54 E-.06114
G1 X129.028 Y128.502 E-.08128
G1 X128.848 Y128.386 E-.08129
G1 X128.728 Y128.21 E-.08128
G1 X128.696 Y128.107 E-.04085
G1 X128.686 Y127.97 E-.05198
G1 X128.739 Y127.766 E-.08029
G1 X128.868 Y127.595 E-.08128
G1 X129.053 Y127.488 E-.08128
G1 X129.093 Y127.481 E-.01531
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 329/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L329
M991 S0 P328 ;notify layer change
G17
G3 Z66 I-1.139 J.43 P1  F30000
G1 X129.324 Y128.093 Z66
G1 Z65.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.286 Y128.134 E.00186
G1 X129.171 Y128.137 E.00379
G3 X129.274 Y127.86 I.055 J-.137 E.01517
G1 X129.358 Y127.936 E.00374
G1 X129.363 Y128.049 E.00373
G1 X129.62 Y128.367 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X129.446 Y128.49 E.00654
G3 X129.212 Y127.46 I-.224 J-.491 E.05882
G1 X129.259 Y127.462 E.00144
G3 X129.656 Y128.321 I-.036 J.538 E.03551
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 66
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.446 Y128.49 E-.10236
G1 X129.238 Y128.54 E-.08116
G1 X129.079 Y128.52 E-.06114
G1 X128.891 Y128.424 E-.08013
G1 X128.795 Y128.326 E-.05208
G1 X128.739 Y128.234 E-.04091
G1 X128.686 Y128.027 E-.08128
G1 X128.718 Y127.815 E-.08128
G1 X128.829 Y127.633 E-.08129
G1 X129.003 Y127.508 E-.08128
G1 X129.047 Y127.498 E-.01709
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 330/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L330
M991 S0 P329 ;notify layer change
G17
G3 Z66.2 I-1.103 J.514 P1  F30000
G1 X129.324 Y128.093 Z66.2
G1 Z66
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.286 Y128.134 E.00187
G1 X129.171 Y128.137 E.00379
G3 X129.274 Y127.86 I.055 J-.137 E.01517
G1 X129.358 Y127.936 E.00374
G1 X129.363 Y128.048 E.00373
G1 X129.62 Y128.367 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X129.446 Y128.49 E.00655
G3 X129.212 Y127.46 I-.224 J-.491 E.05881
G1 X129.259 Y127.462 E.00145
G3 X129.656 Y128.321 I-.036 J.538 E.0355
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 66.2
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.446 Y128.49 E-.1024
G1 X129.238 Y128.54 E-.08116
G1 X129.079 Y128.52 E-.06114
G1 X128.891 Y128.424 E-.0803
G1 X128.795 Y128.326 E-.05199
G1 X128.739 Y128.234 E-.04084
G1 X128.686 Y128.027 E-.08128
G1 X128.718 Y127.815 E-.08128
G1 X128.829 Y127.633 E-.08128
G1 X129.003 Y127.508 E-.08128
G1 X129.047 Y127.498 E-.01706
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 331/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L331
M991 S0 P330 ;notify layer change
G17
G3 Z66.4 I-1.12 J.476 P1  F30000
G1 X129.311 Y128.119 Z66.4
G1 Z66.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.243 Y128.146 E.00241
G1 X129.185 Y128.142 E.00193
G1 X129.122 Y128.105 E.00241
G3 X129.274 Y127.86 I.104 J-.105 E.01322
G1 X129.333 Y127.9 E.00235
G1 X129.363 Y127.95 E.00193
G1 X129.371 Y128.022 E.00241
G1 X129.351 Y128.075 E.00188
G1 X129.583 Y128.404 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X129.581 Y128.403 E.00007
G3 X129.212 Y127.46 I-.358 J-.403 E.06375
G1 X129.259 Y127.462 E.00146
G3 X129.709 Y128.233 I-.036 J.538 E.03233
G1 X129.619 Y128.355 E.00468
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 66.4
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.581 Y128.403 E-.0231
G1 X129.397 Y128.512 E-.08112
G1 X129.238 Y128.54 E-.06114
G1 X129.028 Y128.502 E-.08128
G1 X128.848 Y128.386 E-.08128
G1 X128.753 Y128.261 E-.06001
G1 X128.702 Y128.133 E-.05207
G1 X128.686 Y128.027 E-.0409
G1 X128.718 Y127.815 E-.08128
G1 X128.829 Y127.633 E-.08128
G1 X129.003 Y127.508 E-.08128
G1 X129.093 Y127.487 E-.03526
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 332/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L332
M991 S0 P331 ;notify layer change
G17
G3 Z66.6 I-1.151 J.396 P1  F30000
G1 X129.311 Y128.12 Z66.6
G1 Z66.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.199 Y128.145 E.00379
G3 X129.274 Y127.86 I.026 J-.145 E.01614
G1 X129.358 Y127.936 E.00375
G1 X129.368 Y128.036 E.00334
G1 X129.345 Y128.07 E.00135
G1 X129.583 Y128.404 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X129.581 Y128.403 E.00007
G3 X129.212 Y127.46 I-.358 J-.403 E.06375
G1 X129.26 Y127.462 E.00147
G3 X129.709 Y128.233 I-.037 J.538 E.03232
G1 X129.619 Y128.355 E.00467
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 66.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.581 Y128.403 E-.02318
G1 X129.397 Y128.512 E-.08113
G1 X129.238 Y128.54 E-.06113
G1 X129.028 Y128.502 E-.08128
G1 X128.868 Y128.405 E-.07118
G1 X128.739 Y128.234 E-.08133
G1 X128.686 Y128.027 E-.08128
G1 X128.718 Y127.815 E-.08128
G1 X128.829 Y127.633 E-.08128
G1 X129.003 Y127.508 E-.08127
G1 X129.094 Y127.487 E-.03565
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 333/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L333
M991 S0 P332 ;notify layer change
G17
G3 Z66.8 I-1.151 J.394 P1  F30000
G1 X129.311 Y128.119 Z66.8
G1 Z66.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.199 Y128.145 E.00379
G3 X129.274 Y127.86 I.026 J-.145 E.01614
G1 X129.358 Y127.936 E.00375
G1 X129.368 Y128.036 E.00334
G1 X129.345 Y128.07 E.00135
G1 X129.619 Y128.366 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.212 Y127.46 I-.396 J-.366 E.06539
G1 X129.26 Y127.462 E.00149
G3 X129.657 Y128.32 I-.037 J.538 E.03541
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 66.8
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.447 Y128.492 E-.10334
G1 X129.238 Y128.54 E-.08128
G1 X129.028 Y128.502 E-.08128
G1 X128.868 Y128.405 E-.07123
G1 X128.739 Y128.234 E-.08128
G1 X128.686 Y128.027 E-.08129
G1 X128.718 Y127.815 E-.08128
G1 X128.829 Y127.633 E-.08128
G1 X129.003 Y127.508 E-.08127
G1 X129.045 Y127.498 E-.01647
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 334/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L334
M991 S0 P333 ;notify layer change
G17
G3 Z67 I-1.109 J.502 P1  F30000
G1 X129.322 Y128.11 Z67
G1 Z66.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.229 Y128.147 E.00334
G3 X129.274 Y127.86 I-.003 J-.148 E.01712
G1 X129.351 Y127.923 E.00329
G1 X129.371 Y128.022 E.00334
G1 X129.351 Y128.058 E.00135
G1 X129.619 Y128.366 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.212 Y127.46 I-.396 J-.366 E.06538
G1 X129.26 Y127.462 E.0015
G3 X129.657 Y128.319 I-.037 J.538 E.0354
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 67
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.447 Y128.492 E-.10341
G1 X129.238 Y128.54 E-.08128
G1 X129.082 Y128.52 E-.06005
G1 X128.955 Y128.467 E-.05204
G1 X128.868 Y128.405 E-.04089
G1 X128.739 Y128.234 E-.08128
G1 X128.686 Y128.027 E-.08128
G1 X128.718 Y127.815 E-.08128
G1 X128.829 Y127.633 E-.08128
G1 X129.003 Y127.508 E-.08128
G1 X129.044 Y127.499 E-.01593
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 335/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L335
M991 S0 P334 ;notify layer change
G17
G3 Z67.2 I-1.086 J.549 P1  F30000
G1 X129.342 Y128.089 Z67.2
G1 Z67
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.286 Y128.134 E.00241
G1 X129.214 Y128.147 E.00241
G1 X129.158 Y128.131 E.00194
G1 X129.103 Y128.083 E.00241
G3 X129.274 Y127.86 I.123 J-.083 E.01224
G1 X129.333 Y127.9 E.00236
G1 X129.368 Y127.964 E.00241
G1 X129.368 Y128.035 E.00235
G1 X129.619 Y128.366 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X129.212 Y127.46 I-.396 J-.366 E.06538
G1 X129.261 Y127.462 E.00151
G3 X129.657 Y128.319 I-.038 J.538 E.0354
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 67.2
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.447 Y128.492 E-.10342
G1 X129.238 Y128.54 E-.08128
G1 X129.028 Y128.502 E-.08128
G1 X128.848 Y128.386 E-.08128
G1 X128.728 Y128.21 E-.08128
G1 X128.686 Y128.027 E-.07123
G1 X128.718 Y127.815 E-.08127
G1 X128.829 Y127.633 E-.08129
G1 X129.003 Y127.508 E-.08128
G1 X129.045 Y127.498 E-.0164
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 336/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L336
M991 S0 P335 ;notify layer change
G17
G3 Z67.4 I-1.101 J.518 P1  F30000
G1 X129.324 Y128.092 Z67.4
G1 Z67.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.286 Y128.134 E.0019
G1 X129.171 Y128.137 E.00379
G3 X129.274 Y127.86 I.055 J-.137 E.01516
G1 X129.358 Y127.936 E.00375
G1 X129.363 Y128.047 E.0037
G1 X129.62 Y128.367 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X129.446 Y128.491 E.00655
G3 X129.212 Y127.46 I-.223 J-.491 E.05878
G1 X129.261 Y127.462 E.00152
G3 X129.656 Y128.321 I-.038 J.538 E.03545
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 67.4
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.446 Y128.491 E-.1026
G1 X129.238 Y128.54 E-.08117
G1 X129.079 Y128.52 E-.06114
G1 X128.891 Y128.424 E-.08023
G1 X128.795 Y128.326 E-.05202
G1 X128.739 Y128.234 E-.04087
G1 X128.686 Y128.027 E-.08128
G1 X128.718 Y127.815 E-.08127
G1 X128.829 Y127.633 E-.08128
G1 X129.003 Y127.508 E-.08128
G1 X129.046 Y127.498 E-.01685
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 337/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L337
M991 S0 P336 ;notify layer change
G17
G3 Z67.6 I-1.085 J.552 P1  F30000
G1 X129.344 Y128.083 Z67.6
G1 Z67.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.299 Y128.127 E.0021
G1 X129.243 Y128.146 E.00193
G1 X129.185 Y128.142 E.00193
G1 X129.122 Y128.105 E.00241
G3 X129.274 Y127.86 I.104 J-.105 E.01322
G1 X129.333 Y127.9 E.00236
G1 X129.363 Y127.95 E.00193
G1 X129.372 Y128.007 E.00193
G1 X129.366 Y128.028 E.00073
G1 X129.621 Y128.366 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X129.619 Y128.366 E.00006
G3 X129.212 Y127.46 I-.396 J-.366 E.06537
G1 X129.261 Y127.462 E.00153
G3 X129.73 Y128.184 I-.038 J.538 E.03064
G1 X129.652 Y128.315 E.00469
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 67.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.619 Y128.366 E-.02296
G1 X129.447 Y128.492 E-.08114
G1 X129.238 Y128.54 E-.08128
G1 X129.028 Y128.502 E-.08128
G1 X128.848 Y128.386 E-.08128
G1 X128.752 Y128.26 E-.06009
G1 X128.702 Y128.133 E-.05202
G1 X128.686 Y128.027 E-.04087
G1 X128.718 Y127.815 E-.08128
G1 X128.829 Y127.633 E-.08128
G1 X129.003 Y127.508 E-.08128
G1 X129.042 Y127.499 E-.01524
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 338/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L338
M991 S0 P337 ;notify layer change
G17
G3 Z67.8 I-1.085 J.552 P1  F30000
G1 X129.342 Y128.089 Z67.8
G1 Z67.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.258 Y128.143 E.00334
G3 X129.274 Y127.86 I-.032 J-.144 E.01809
G1 X129.351 Y127.923 E.0033
G1 X129.372 Y128.007 E.00288
G1 X129.363 Y128.032 E.00089
G1 X129.621 Y128.366 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X129.619 Y128.366 E.00006
G3 X129.212 Y127.46 I-.396 J-.366 E.06536
G1 X129.262 Y127.462 E.00154
G3 X129.71 Y128.233 I-.038 J.538 E.03228
G1 X129.654 Y128.316 E.00306
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 67.8
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.619 Y128.366 E-.02306
G1 X129.447 Y128.492 E-.08115
G1 X129.238 Y128.54 E-.08128
G1 X129.053 Y128.512 E-.07123
G1 X128.868 Y128.405 E-.08128
G1 X128.739 Y128.234 E-.08128
G1 X128.686 Y128.027 E-.08128
G1 X128.718 Y127.815 E-.08128
G1 X128.829 Y127.633 E-.08128
G1 X129.003 Y127.508 E-.08128
G1 X129.043 Y127.499 E-.0156
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 339/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L339
M991 S0 P338 ;notify layer change
G17
G3 Z68 I-1.085 J.551 P1  F30000
G1 X129.342 Y128.089 Z68
G1 Z67.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.286 Y128.134 E.00241
G1 X129.214 Y128.147 E.00241
G1 X129.145 Y128.124 E.00241
G1 X129.103 Y128.083 E.00194
G3 X129.274 Y127.86 I.123 J-.083 E.01224
G1 X129.333 Y127.9 E.00236
G1 X129.368 Y127.964 E.00241
G1 X129.371 Y128.022 E.00194
G1 X129.366 Y128.034 E.00042
G1 X129.621 Y128.366 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X129.619 Y128.366 E.00006
G3 X129.212 Y127.46 I-.396 J-.366 E.06536
G1 X129.262 Y127.462 E.00156
G3 X129.73 Y128.184 I-.039 J.538 E.03062
G1 X129.652 Y128.314 E.00467
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 68
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.619 Y128.366 E-.02323
G1 X129.447 Y128.492 E-.08115
G1 X129.238 Y128.54 E-.08128
G1 X129.028 Y128.502 E-.08128
G1 X128.848 Y128.386 E-.08129
G1 X128.728 Y128.21 E-.08127
G1 X128.686 Y128.027 E-.07123
G1 X128.718 Y127.815 E-.08128
G1 X128.829 Y127.633 E-.08129
G1 X129.003 Y127.508 E-.08128
G1 X129.043 Y127.499 E-.01542
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 340/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L340
M991 S0 P339 ;notify layer change
G17
G3 Z68.2 I-1.116 J.484 P1  F30000
G1 X129.313 Y128.123 Z68.2
G1 Z68
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X129.221 Y127.853 I-.082 J-.123 E.01792
G1 X129.249 Y127.854 E.00092
G3 X129.356 Y128.079 I-.017 J.147 E.00988
G1 X129.604 Y128.375 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X129.582 Y128.404 E.00113
G3 X129.212 Y127.46 I-.357 J-.405 E.06364
G1 X129.265 Y127.462 E.00165
G3 X129.711 Y128.234 I-.04 J.538 E.03225
G1 X129.641 Y128.327 E.00359
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 68.2
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.582 Y128.404 E-.03679
G1 X129.397 Y128.512 E-.0813
G1 X129.185 Y128.538 E-.08114
G1 X129.001 Y128.491 E-.07228
G1 X128.829 Y128.367 E-.08029
G1 X128.718 Y128.185 E-.08128
G1 X128.686 Y127.973 E-.08128
G1 X128.739 Y127.766 E-.08129
G1 X128.829 Y127.633 E-.06114
G1 X129.003 Y127.508 E-.08127
G1 X129.059 Y127.495 E-.02195
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 341/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L341
M991 S0 P340 ;notify layer change
G17
G3 Z68.4 I-1.047 J.62 P1  F30000
G1 X129.575 Y128.367 Z68.4
G1 Z68.2
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X129.547 Y128.403 E.00142
G3 X129.269 Y127.487 I-.319 J-.403 E.06148
G1 X129.314 Y127.493 E.00142
G3 X129.679 Y128.247 I-.087 J.507 E.03006
G1 X129.614 Y128.322 E.00303
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 68.4
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.547 Y128.403 E-.04029
G1 X129.364 Y128.496 E-.07761
G1 X129.161 Y128.511 E-.07751
G1 X128.968 Y128.446 E-.07752
G1 X128.815 Y128.311 E-.07751
G1 X128.726 Y128.127 E-.07752
G1 X128.716 Y127.923 E-.07752
G1 X128.786 Y127.732 E-.07751
G1 X128.925 Y127.582 E-.07751
G1 X129.11 Y127.498 E-.07752
G1 X129.168 Y127.494 E-.02198
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 342/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L342
M991 S0 P341 ;notify layer change
G17
G3 Z68.6 I-1.083 J.555 P1  F30000
G1 X129.581 Y128.298 Z68.6
G1 Z68.4
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.306 Y128.458 I-.356 J-.298 E.00996
G3 X129.26 Y127.537 I-.079 J-.458 E.04827
G3 X129.616 Y128.25 I-.035 J.463 E.02946
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 68.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.437 Y128.414 E-.09216
G1 X129.306 Y128.458 E-.05265
G1 X129.213 Y128.465 E-.03517
G1 X129.077 Y128.441 E-.05264
G1 X128.917 Y128.348 E-.06999
G1 X128.806 Y128.202 E-.06998
G1 X128.761 Y128.023 E-.06999
G1 X128.788 Y127.841 E-.06998
G1 X128.884 Y127.684 E-.06999
G1 X128.993 Y127.598 E-.05264
G1 X129.077 Y127.559 E-.03517
G1 X129.26 Y127.537 E-.06998
G1 X129.31 Y127.551 E-.01967
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 343/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L343
M991 S0 P342 ;notify layer change
G17
G3 Z68.8 I-1.157 J.376 P1  F30000
G1 X129.542 Y128.266 Z68.8
G1 Z68.6
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.297 Y128.408 I-.318 J-.266 E.00889
G3 X129.256 Y127.586 I-.07 J-.409 E.04308
M73 P97 R0
G3 X129.578 Y128.218 I-.032 J.414 E.02609
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 68.8
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.45 Y128.348 E-.06941
G1 X129.297 Y128.408 E-.06245
G1 X129.133 Y128.404 E-.06246
G1 X128.983 Y128.337 E-.06246
G1 X128.894 Y128.25 E-.04697
G1 X128.851 Y128.18 E-.03139
G1 X128.811 Y128.021 E-.06246
G1 X128.823 Y127.898 E-.04697
G1 X128.851 Y127.82 E-.03138
G1 X128.951 Y127.689 E-.06246
G1 X129.093 Y127.607 E-.06245
G1 X129.256 Y127.586 E-.06246
G1 X129.377 Y127.614 E-.04698
G1 X129.486 Y127.685 E-.04969
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 344/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L344
M991 S0 P343 ;notify layer change
G17
G3 Z69 I-1.213 J.093 P1  F30000
G1 X129.526 Y128.205 Z69
G1 Z68.8
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.324 Y128.351 I-.302 J-.205 E.00782
G3 X129.288 Y127.641 I-.098 J-.351 E.04021
G3 X129.556 Y128.153 I-.064 J.359 E.02048
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 69
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.452 Y128.285 E-.06377
G1 X129.324 Y128.351 E-.05493
G1 X129.144 Y128.356 E-.0684
G1 X129.012 Y128.296 E-.05493
G1 X128.914 Y128.19 E-.05493
G1 X128.861 Y128.018 E-.0684
G1 X128.882 Y127.875 E-.05492
G1 X128.984 Y127.727 E-.0684
G1 X129.144 Y127.644 E-.0684
G1 X129.288 Y127.641 E-.05493
G1 X129.423 Y127.694 E-.05493
G1 X129.504 Y127.766 E-.04132
G1 X129.561 Y127.858 E-.04132
G1 X129.568 Y127.885 E-.01043
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 345/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L345
M991 S0 P344 ;notify layer change
G17
G3 Z69.2 I-1.181 J-.295 P1  F30000
G1 X129.501 Y128.151 Z69.2
G1 Z69
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X129.445 Y128.225 E.00288
G1 X129.34 Y128.293 E.00383
G1 X129.217 Y128.315 E.00383
G1 X129.096 Y128.287 E.00383
G1 X128.994 Y128.214 E.00383
G1 X128.929 Y128.108 E.00383
G1 X128.911 Y128.016 E.00288
G1 X128.92 Y127.922 E.00288
G1 X128.974 Y127.81 E.00383
G1 X129.068 Y127.727 E.00383
G1 X129.155 Y127.693 E.00288
G3 X129.283 Y127.691 I.071 J.385 E.00397
G1 X129.396 Y127.736 E.00371
G1 X129.485 Y127.823 E.00383
G1 X129.526 Y127.907 E.00288
G1 X129.538 Y128.031 E.00383
G1 X129.519 Y128.093 E.00199
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 69.2
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.445 Y128.225 E-.05868
G1 X129.34 Y128.293 E-.04828
G1 X129.217 Y128.315 E-.04828
G1 X129.096 Y128.287 E-.04828
G1 X128.994 Y128.214 E-.04828
G1 X128.929 Y128.108 E-.04828
G1 X128.911 Y128.016 E-.03631
G1 X128.92 Y127.922 E-.03631
G1 X128.974 Y127.81 E-.04827
G1 X129.068 Y127.727 E-.04828
G1 X129.155 Y127.693 E-.03631
G1 X129.283 Y127.691 E-.04974
G1 X129.396 Y127.736 E-.04678
G1 X129.485 Y127.823 E-.04828
G1 X129.526 Y127.907 E-.03631
G1 X129.538 Y128.031 E-.04827
G1 X129.519 Y128.093 E-.02506
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 346/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L346
M991 S0 P345 ;notify layer change
G17
G3 Z69.4 I-.218 J-1.197 P1  F30000
G1 X129.468 Y128.102 Z69.4
G1 Z69.2
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.227 Y127.736 I-.242 J-.103 E.03493
G1 X129.27 Y127.74 E.0013
G3 X129.485 Y128.045 I-.044 J.26 E.01275
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 69.4
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.409 Y128.189 E-.07535
G1 X129.321 Y128.246 E-.04832
G1 X129.218 Y128.264 E-.04832
G1 X129.116 Y128.241 E-.04832
G1 X129.032 Y128.18 E-.04832
G1 X128.977 Y128.09 E-.04832
G1 X128.961 Y127.987 E-.04832
G1 X128.987 Y127.885 E-.04832
G1 X129.05 Y127.802 E-.04832
G1 X129.141 Y127.75 E-.04832
G1 X129.227 Y127.736 E-.04046
G1 X129.27 Y127.74 E-.01955
G1 X129.409 Y127.811 E-.07246
G1 X129.468 Y127.897 E-.04832
G1 X129.489 Y128 E-.04832
G1 X129.485 Y128.045 E-.02066
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 347/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L347
M991 S0 P346 ;notify layer change
G17
G3 Z69.6 I-.643 J-1.033 P1  F30000
G1 X129.423 Y128.083 Z69.6
G1 Z69.4
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.24 Y127.786 I-.196 J-.084 E.02871
G1 X129.259 Y127.788 E.00057
G3 X129.438 Y128.025 I-.032 J.211 E.0101
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 69.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.374 Y128.153 E-.08168
G1 X129.303 Y128.199 E-.04833
G1 X129.22 Y128.214 E-.04833
G1 X129.137 Y128.195 E-.04833
G1 X129.068 Y128.146 E-.04833
G1 X129.024 Y128.073 E-.04833
G1 X129.011 Y127.989 E-.04833
G1 X129.032 Y127.907 E-.04833
G1 X129.083 Y127.84 E-.04833
G1 X129.157 Y127.797 E-.04834
G1 X129.24 Y127.786 E-.04798
G1 X129.259 Y127.788 E-.01054
G1 X129.374 Y127.847 E-.07389
G1 X129.422 Y127.917 E-.04833
G1 X129.439 Y128 E-.04833
G1 X129.438 Y128.025 E-.01425
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 348/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L348
M991 S0 P347 ;notify layer change
G17
G3 Z69.8 I-.168 J-1.205 P1  F30000
G1 X129.385 Y128.032 Z69.8
G1 Z69.6
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X129.237 Y127.837 I-.16 J-.033 E.02304
G1 X129.269 Y127.842 E.001
G3 X129.386 Y127.971 I-.044 J.157 E.00564
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 69.8
; LAYER_HEIGHT: 0.200005
; WIPE_START
G1 F24000
G1 X129.36 Y128.092 E-.09208
G1 X129.314 Y128.138 E-.04838
G1 X129.253 Y128.161 E-.04839
G1 X129.189 Y128.16 E-.04838
G1 X129.129 Y128.133 E-.04839
G1 X129.085 Y128.085 E-.04839
G1 X129.063 Y128.024 E-.04838
G1 X129.066 Y127.96 E-.04839
G1 X129.117 Y127.877 E-.07198
G1 X129.173 Y127.845 E-.04838
G1 X129.237 Y127.837 E-.04838
G1 X129.269 Y127.842 E-.02432
G1 X129.327 Y127.872 E-.04838
G1 X129.372 Y127.926 E-.0523
G1 X129.386 Y127.971 E-.03547
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 349/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L349
M991 S0 P348 ;notify layer change
G17
G3 Z70 I-.906 J-.813 P1  F30000
G1 X129.361 Y128 Z70
G1 Z69.8
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.37852
G1 F1200
G3 X129.235 Y127.865 I-.135 J0 E.01759
G1 X129.245 Y127.866 E.00028
G3 X129.347 Y127.94 I-.02 J.133 E.00356
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 70
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X129.319 Y128.096 E-.14702
G1 X129.222 Y128.135 E-.09692
G1 X129.126 Y128.092 E-.09692
G1 X129.09 Y127.993 E-.09692
G1 X129.136 Y127.899 E-.09691
G1 X129.235 Y127.865 E-.09716
G1 X129.245 Y127.866 E-.00946
G1 X129.319 Y127.904 E-.07637
G1 X129.347 Y127.94 E-.04233
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 350/350
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L350
M991 S0 P349 ;notify layer change
G17
G3 Z70.2 I-1.088 J-.546 P1  F30000
G1 X129.308 Y128.017 Z70.2
G1 Z70
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X129.271 Y128.071 E.0018
G1 X129.206 Y128.083 E.0018
G1 X129.153 Y128.044 E.0018
G1 X129.143 Y127.979 E.0018
G1 X129.183 Y127.927 E.0018
G1 X129.239 Y127.916 E.00156
G1 X129.295 Y127.952 E.00183
G1 X129.296 Y127.958 E.00016
M204 S10000
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F24000
G1 X129.271 Y128.071 E-.17311
G1 X129.206 Y128.083 E-.0983
G1 X129.153 Y128.044 E-.0983
G1 X129.143 Y127.979 E-.09829
G1 X129.183 Y127.927 E-.09829
G1 X129.239 Y127.916 E-.08488
G1 X129.295 Y127.952 E-.10008
G1 X129.296 Y127.958 E-.00876
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
G1 Z70.5 F900 ; lower z a little
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

    G1 Z170 F600
    G1 Z168

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

