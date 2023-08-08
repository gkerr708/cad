; HEADER_BLOCK_START
; BambuStudio 01.06.02.04
; model printing time: 14m 32s; total estimated time: 20m 21s
; total layer number: 151
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
M73 P21 R15
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

M73 P22 R15
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
M73 P25 R15
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
    G29 A X118.255 Y111.649 I23.2285 J28.851
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
; layer num/total_layer_count: 1/151
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
G1 X119.976 Y111.161 F30000
G1 Z.4
G1 Z.2
M73 P26 R15
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.5
G1 F3000
G3 X123.493 Y109.887 I3.233 J3.434 E.14327
G3 X127.204 Y117.071 I-.299 J4.705 E.36192
G1 X120.205 Y117.071 E.26067
M73 P26 R14
G1 X120.071 Y117.205 E.00705
G1 X120.071 Y118.116 E.0339
G3 X119.933 Y111.202 I3.138 J-3.521 E.28908
G1 X120.246 Y111.536 F30000
G1 F3000
G1 X120.486 Y111.314 E.01218
G3 X123.465 Y110.343 I2.717 J3.284 E.11948
G3 X126.941 Y116.614 I-.283 J4.256 E.31718
G1 X120.016 Y116.614 E.25793
G1 X119.662 Y116.969 E.01867
M73 P27 R14
G3 X120.097 Y111.679 I3.542 J-2.371 E.21339
G1 X120.203 Y111.577 E.00548
G1 X120.551 Y111.904 F30000
G1 F3000
G1 X120.777 Y111.665 E.01225
G3 X123.436 Y110.8 I2.423 J2.927 E.10666
G3 X126.657 Y116.157 I-.241 J3.792 E.27341
G1 X119.738 Y116.157 E.2577
G3 X120.126 Y112.359 I3.462 J-1.565 E.14898
G1 X120.51 Y111.948 E.02096
G1 X120.84 Y112.258 F30000
G1 F3000
G1 X121.069 Y112.018 E.01235
G3 X123.407 Y111.256 I2.133 J2.579 E.0938
G3 X126.353 Y115.7 I-.216 J3.341 E.22971
G1 X120.042 Y115.7 E.23507
G3 X120.496 Y112.628 I3.16 J-1.103 E.12028
G1 X120.8 Y112.302 E.0166
G1 X121.107 Y112.629 F30000
G1 F3000
G1 X121.503 Y112.259 E.02021
G3 X123.379 Y111.713 I1.7 J2.341 E.07421
G3 X126.013 Y115.243 I-.188 J2.889 E.18645
G1 X120.382 Y115.243 E.20972
G3 X120.976 Y112.753 I2.821 J-.643 E.09875
G1 X121.063 Y112.671 E.00447
G1 X121.425 Y112.934 F30000
M73 P28 R14
G1 F3000
G1 X121.429 Y112.931 E.00019
G3 X123.35 Y112.169 I1.772 J1.665 E.07948
G3 X125.618 Y114.786 I-.157 J2.427 E.14354
G1 X120.777 Y114.786 E.18033
G3 X121.071 Y113.422 I2.424 J-.19 E.05271
G1 X121.39 Y112.982 E.02023
G1 X121.763 Y113.29 F30000
G1 F3000
G1 X121.944 Y113.076 E.01047
G3 X123.321 Y112.625 I1.274 J1.566 E.0552
G3 X125.171 Y114.329 I-.153 J2.023 E.10103
G1 X121.224 Y114.329 E.14704
G3 X121.466 Y113.639 I1.995 J.313 E.02739
G1 X121.724 Y113.336 E.01481
G1 X122.034 Y113.67 F30000
G1 F3000
G1 X122.468 Y113.264 E.02214
G3 X123.292 Y113.082 I.755 J1.461 E.03181
G3 X124.579 Y113.872 I-.142 J1.672 E.05831
G1 X121.817 Y113.872 E.10287
G1 X121.99 Y113.711 E.00881
; WIPE_START
G1 F24000
G1 X122.468 Y113.264 E-.24872
G1 X122.914 Y113.106 E-.17991
G1 X123.292 Y113.082 E-.14404
G1 X123.761 Y113.234 E-.18733
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-.076 J1.215 P1  F30000
G1 X133.99 Y113.872 Z.6
G1 Z.2
G1 E.8 F1800
G1 F3000
G3 X135.466 Y113.082 I1.406 J.853 E.06542
G3 X136.752 Y113.872 I-.142 J1.672 E.05831
G1 X134.05 Y113.872 E.10064
G1 X134.05 Y114.329 F30000
G1 F3000
G1 X133.397 Y114.329 E.02432
G3 X135.495 Y112.625 I1.995 J.313 E.11026
G3 X137.345 Y114.329 I-.153 J2.023 E.10103
G1 X134.11 Y114.329 E.12049
G1 X134.11 Y114.786 F30000
G1 F3000
G1 X132.951 Y114.786 E.04319
G3 X135.524 Y112.169 I2.424 J-.19 E.1549
G3 X137.792 Y114.786 I-.157 J2.427 E.14354
G1 X134.17 Y114.786 E.1349
G1 X134.17 Y115.243 F30000
G1 F3000
G1 X132.556 Y115.243 E.06013
G3 X135.552 Y111.713 I2.821 J-.643 E.19995
G3 X138.187 Y115.243 I-.188 J2.889 E.18645
G1 X134.23 Y115.243 E.14736
G1 X134.23 Y115.7 F30000
G1 F3000
G1 X132.216 Y115.7 E.07504
G3 X135.581 Y111.256 I3.16 J-1.103 E.24535
G3 X138.527 Y115.7 I-.216 J3.341 E.22971
G1 X134.29 Y115.7 E.1578
G1 X134.29 Y116.157 F30000
G1 F3000
G1 X131.912 Y116.157 E.08858
G3 X135.61 Y110.8 I3.462 J-1.565 E.29118
G3 X138.894 Y116.074 I-.258 J3.82 E.26998
G1 X139.023 Y116.653 E.02209
G3 X140.098 Y118.157 I-3.149 J3.386 E.06932
G1 X138.843 Y118.157 E.04675
G1 X138.843 Y116.756 E.05218
G1 X138.173 Y116.157 E.03346
G1 X134.35 Y116.157 E.1424
G1 X134.35 Y116.614 F30000
G1 F3000
G1 X131.628 Y116.614 E.1014
G3 X135.638 Y110.343 I3.757 J-2.015 E.33707
G3 X139.368 Y116.082 I-.278 J4.262 E.29567
G2 X139.821 Y116.829 I1.228 J-.234 E.03326
G3 X140.723 Y120.34 I-3.367 J2.735 E.13928
G1 X140.386 Y120.314 E.01259
G1 X140.386 Y119.016 E.04833
G1 X139.984 Y118.614 E.02116
G1 X138.386 Y118.614 E.05953
G1 X138.386 Y117.016 E.05953
G1 X137.984 Y116.614 E.02116
G1 X134.41 Y116.614 E.13311
G1 X134.41 Y117.071 F30000
G1 F3000
G1 X131.365 Y117.071 E.11343
M73 P29 R14
G3 X135.667 Y109.887 I4.009 J-2.48 E.38397
G3 X139.842 Y116.089 I-.302 J4.709 E.32142
G3 X140.924 Y117.807 I-7.74 J6.078 E.07575
G3 X141.025 Y120.999 I-4.422 J1.736 E.1213
G3 X139.929 Y122.818 I-4.784 J-1.642 E.07971
G1 X139.929 Y119.205 E.13455
G1 X139.795 Y119.071 E.00705
G1 X137.929 Y119.071 E.06951
G1 X137.929 Y117.205 E.06951
G1 X137.795 Y117.071 E.00705
G1 X134.47 Y117.071 E.12382
; WIPE_START
G1 F24000
G1 X132.47 Y117.071 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-.683 J1.007 P1  F30000
G1 X136.643 Y119.9 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3000
G1 X136.643 Y120.357 E.01702
G1 X138.643 Y120.357 E.07449
G1 X138.643 Y135.643 E.56934
G1 X136.643 Y135.643 E.07449
G1 X136.643 Y137.643 E.07449
G1 X121.357 Y137.643 E.56934
G1 X121.357 Y118.357 E.71832
G1 X136.643 Y118.357 E.56934
G1 X136.643 Y119.84 E.05523
G1 X137.1 Y119.9 F30000
; FEATURE: Outer wall
G1 F3000
G1 X139.1 Y119.9 E.07449
G1 X139.1 Y136.1 E.60339
G1 X137.1 Y136.1 E.07449
G1 X137.1 Y138.1 E.07449
G1 X120.9 Y138.1 E.60339
G1 X120.9 Y117.9 E.75237
G1 X137.1 Y117.9 E.60339
G1 X137.1 Y119.84 E.07226
G1 X137.527 Y120.54 F30000
; FEATURE: Bottom surface
; LINE_WIDTH: 0.504331
G1 F6300
G1 X138.254 Y121.267 E.03868
G1 X138.254 Y121.92 E.02453
G1 X136.874 Y120.54 E.07338
; WIPE_START
G1 F24000
G1 X138.254 Y121.92 E-.74162
G1 X138.254 Y121.872 E-.01838
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I.974 J-.729 P1  F30000
G1 X136.46 Y119.473 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6300
G1 X135.733 Y118.746 E.03868
G1 X135.08 Y118.746 E.02453
G1 X136.46 Y120.126 E.07338
; WIPE_START
G1 F24000
G1 X135.08 Y118.746 E-.74162
G1 X135.128 Y118.746 E-.01838
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I.269 J-1.187 P1  F30000
G1 X134.222 Y118.54 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6300
G1 X138.254 Y122.572 E.21442
G1 X138.254 Y123.225 E.02453
G1 X133.775 Y118.746 E.23818
G1 X133.122 Y118.746 E.02453
G1 X138.254 Y123.878 E.27288
G1 X138.254 Y124.53 E.02453
G1 X132.47 Y118.746 E.30758
G1 X131.817 Y118.746 E.02453
G1 X138.254 Y125.183 E.34228
G1 X138.254 Y125.835 E.02453
G1 X131.165 Y118.746 E.37697
G1 X130.512 Y118.746 E.02453
G1 X138.254 Y126.488 E.41167
G1 X138.254 Y127.14 E.02453
G1 X129.86 Y118.746 E.44637
G1 X129.207 Y118.746 E.02453
G1 X138.254 Y127.793 E.48107
G1 X138.254 Y128.445 E.02453
G1 X128.555 Y118.746 E.51576
G1 X127.902 Y118.746 E.02453
G1 X138.254 Y129.098 E.55046
G1 X138.254 Y129.75 E.02453
G1 X127.25 Y118.746 E.58516
G1 X126.597 Y118.746 E.02453
G1 X138.254 Y130.403 E.61985
G1 X138.254 Y131.055 E.02453
G1 X125.945 Y118.746 E.65455
G1 X125.292 Y118.746 E.02453
G1 X138.254 Y131.708 E.68925
G1 X138.254 Y132.36 E.02453
G1 X124.64 Y118.746 E.72395
G1 X123.987 Y118.746 E.02453
G1 X138.254 Y133.013 E.75864
G1 X138.254 Y133.666 E.02453
G1 X123.334 Y118.746 E.79334
G1 X122.682 Y118.746 E.02453
G1 X138.254 Y134.318 E.82804
G1 X138.254 Y134.971 E.02453
G1 X122.029 Y118.746 E.86274
G1 X121.746 Y118.746 E.01067
G1 X121.746 Y119.114 E.01386
G1 X137.886 Y135.254 E.85822
G1 X137.233 Y135.254 E.02453
G1 X121.746 Y119.767 E.82353
G1 X121.746 Y120.419 E.02453
G1 X136.581 Y135.254 E.78883
G1 X136.254 Y135.254 E.01227
G1 X136.254 Y135.581 E.01227
G1 X121.746 Y121.072 E.77148
G1 X121.746 Y121.724 E.02453
G1 X136.254 Y136.233 E.77148
G1 X136.254 Y136.886 E.02453
G1 X121.746 Y122.377 E.77148
G1 X121.746 Y123.029 E.02453
G1 X135.971 Y137.254 E.75639
M73 P30 R14
G1 X135.318 Y137.254 E.02453
G1 X121.746 Y123.682 E.72169
G1 X121.746 Y124.335 E.02453
G1 X134.665 Y137.254 E.68699
G1 X134.013 Y137.254 E.02453
G1 X121.746 Y124.987 E.65229
G1 X121.746 Y125.64 E.02453
G1 X133.36 Y137.254 E.6176
G1 X132.708 Y137.254 E.02453
G1 X121.746 Y126.292 E.5829
G1 X121.746 Y126.945 E.02453
G1 X132.055 Y137.254 E.5482
G1 X131.403 Y137.254 E.02453
G1 X121.746 Y127.597 E.5135
G1 X121.746 Y128.25 E.02453
G1 X130.75 Y137.254 E.47881
G1 X130.098 Y137.254 E.02453
G1 X121.746 Y128.902 E.44411
G1 X121.746 Y129.555 E.02453
G1 X129.445 Y137.254 E.40941
G1 X128.793 Y137.254 E.02453
G1 X121.746 Y130.207 E.37471
G1 X121.746 Y130.86 E.02453
G1 X128.14 Y137.254 E.34002
G1 X127.488 Y137.254 E.02453
G1 X121.746 Y131.512 E.30532
G1 X121.746 Y132.165 E.02453
G1 X126.835 Y137.254 E.27062
G1 X126.183 Y137.254 E.02453
G1 X121.746 Y132.817 E.23593
G1 X121.746 Y133.47 E.02453
G1 X125.53 Y137.254 E.20123
G1 X124.877 Y137.254 E.02453
G1 X121.746 Y134.123 E.16653
G1 X121.746 Y134.775 E.02453
G1 X124.225 Y137.254 E.13183
G1 X123.572 Y137.254 E.02453
G1 X121.746 Y135.428 E.09714
G1 X121.746 Y136.08 E.02453
G1 X122.92 Y137.254 E.06244
G1 X122.267 Y137.254 E.02453
G1 X121.54 Y136.527 E.03868
M106 S252.45
M106 P2 S178
; CHANGE_LAYER
; Z_HEIGHT: 0.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X122.267 Y137.254 E-.39091
G1 X122.92 Y137.254 E-.24796
G1 X122.694 Y137.029 E-.12113
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 2/151
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
G1 X136.898 Y119.71 Z.6
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7899
G1 X136.898 Y120.102 E.01301
G1 X138.898 Y120.102 E.06634
G1 X138.898 Y135.898 E.52398
G1 X136.898 Y135.898 E.06634
G1 X136.898 Y137.898 E.06634
G1 X121.102 Y137.898 E.52398
G1 X121.102 Y118.102 E.65666
G1 X136.898 Y118.102 E.52398
G1 X136.898 Y119.65 E.05135
G1 X137.29 Y119.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7899
G1 X139.29 Y119.71 E.06145
G1 X139.29 Y136.29 E.50946
G1 X137.29 Y136.29 E.06145
G1 X137.29 Y138.29 E.06145
G1 X120.71 Y138.29 E.50946
G1 X120.71 Y117.71 E.63237
G1 X137.29 Y117.71 E.50946
M73 P31 R14
G1 X137.29 Y119.65 E.05961
M204 S10000
; WIPE_START
G1 F24000
G1 X139.289 Y119.71 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I.102 J-1.213 P1  F30000
G1 X122.036 Y118.266 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423808
G1 F7899
G1 X121.435 Y118.866 E.02636
G1 X121.435 Y119.405 E.01672
G1 X122.405 Y118.435 E.04256
G1 X122.944 Y118.435 E.01672
G1 X121.435 Y119.944 E.0662
G1 X121.435 Y120.482 E.01672
G1 X123.482 Y118.435 E.08985
G1 X124.021 Y118.435 E.01672
G1 X121.435 Y121.021 E.11349
G1 X121.435 Y121.56 E.01672
G1 X124.56 Y118.435 E.13713
G1 X125.098 Y118.435 E.01672
G1 X121.435 Y122.098 E.16078
G1 X121.435 Y122.637 E.01672
G1 X125.637 Y118.435 E.18442
G1 X126.176 Y118.435 E.01672
G1 X121.435 Y123.176 E.20806
G1 X121.435 Y123.714 E.01672
G1 X126.714 Y118.435 E.23171
G1 X127.253 Y118.435 E.01672
G1 X121.435 Y124.253 E.25535
G1 X121.435 Y124.791 E.01672
G1 X127.791 Y118.435 E.27899
G1 X128.33 Y118.435 E.01672
M73 P31 R13
G1 X121.435 Y125.33 E.30264
G1 X121.435 Y125.869 E.01672
G1 X128.869 Y118.435 E.32628
G1 X129.407 Y118.435 E.01672
G1 X121.435 Y126.407 E.34993
G1 X121.435 Y126.946 E.01672
G1 X129.946 Y118.435 E.37357
G1 X130.485 Y118.435 E.01672
G1 X121.435 Y127.485 E.39721
G1 X121.435 Y128.023 E.01672
G1 X131.023 Y118.435 E.42086
G1 X131.562 Y118.435 E.01672
G1 X121.435 Y128.562 E.4445
G1 X121.435 Y129.101 E.01672
G1 X132.101 Y118.435 E.46814
G1 X132.639 Y118.435 E.01672
G1 X121.435 Y129.639 E.49179
G1 X121.435 Y130.178 E.01672
G1 X133.178 Y118.435 E.51543
G1 X133.717 Y118.435 E.01672
G1 X121.435 Y130.717 E.53908
G1 X121.435 Y131.255 E.01672
G1 X134.255 Y118.435 E.56272
G1 X134.794 Y118.435 E.01672
G1 X121.435 Y131.794 E.58636
G1 X121.435 Y132.333 E.01672
G1 X135.333 Y118.435 E.61001
G1 X135.871 Y118.435 E.01672
G1 X121.435 Y132.871 E.63365
G1 X121.435 Y133.41 E.01672
G1 X136.41 Y118.435 E.65729
G1 X136.565 Y118.435 E.0048
G1 X136.565 Y118.819 E.01192
G1 X121.435 Y133.949 E.66408
G1 X121.435 Y134.487 E.01672
G1 X136.565 Y119.358 E.66408
G1 X136.565 Y119.897 E.01672
G1 X121.435 Y135.026 E.66408
G1 X121.435 Y135.565 E.01672
G1 X136.565 Y120.435 E.66408
G1 X137.103 Y120.435 E.01672
G1 X121.435 Y136.103 E.68772
G1 X121.435 Y136.642 E.01672
G1 X137.642 Y120.435 E.71137
G1 X138.181 Y120.435 E.01672
G1 X121.435 Y137.181 E.73501
G1 X121.435 Y137.565 E.01192
G1 X121.59 Y137.565 E.0048
G1 X138.565 Y120.59 E.74508
G1 X138.565 Y121.129 E.01672
G1 X122.129 Y137.565 E.72144
G1 X122.667 Y137.565 E.01672
G1 X138.565 Y121.667 E.6978
G1 X138.565 Y122.206 E.01672
G1 X123.206 Y137.565 E.67415
G1 X123.745 Y137.565 E.01672
G1 X138.565 Y122.745 E.65051
G1 X138.565 Y123.283 E.01672
G1 X124.283 Y137.565 E.62687
G1 X124.822 Y137.565 E.01672
G1 X138.565 Y123.822 E.60322
G1 X138.565 Y124.361 E.01672
G1 X125.361 Y137.565 E.57958
G1 X125.899 Y137.565 E.01672
G1 X138.565 Y124.899 E.55593
G1 X138.565 Y125.438 E.01672
G1 X126.438 Y137.565 E.53229
G1 X126.977 Y137.565 E.01672
G1 X138.565 Y125.977 E.50865
G1 X138.565 Y126.515 E.01672
G1 X127.515 Y137.565 E.485
G1 X128.054 Y137.565 E.01672
G1 X138.565 Y127.054 E.46136
G1 X138.565 Y127.592 E.01672
G1 X128.592 Y137.565 E.43772
G1 X129.131 Y137.565 E.01672
G1 X138.565 Y128.131 E.41407
G1 X138.565 Y128.67 E.01672
G1 X129.67 Y137.565 E.39043
G1 X130.208 Y137.565 E.01672
G1 X138.565 Y129.208 E.36678
G1 X138.565 Y129.747 E.01672
G1 X130.747 Y137.565 E.34314
G1 X131.286 Y137.565 E.01672
G1 X138.565 Y130.286 E.3195
G1 X138.565 Y130.824 E.01672
G1 X131.824 Y137.565 E.29585
G1 X132.363 Y137.565 E.01672
G1 X138.565 Y131.363 E.27221
G1 X138.565 Y131.902 E.01672
G1 X132.902 Y137.565 E.24857
G1 X133.44 Y137.565 E.01672
G1 X138.565 Y132.44 E.22492
G1 X138.565 Y132.979 E.01672
G1 X133.979 Y137.565 E.20128
G1 X134.518 Y137.565 E.01672
G1 X138.565 Y133.518 E.17764
G1 X138.565 Y134.056 E.01672
G1 X137.056 Y135.565 E.0662
G1 X136.565 Y135.565 E.01526
G1 X136.565 Y136.056 E.01526
G1 X135.056 Y137.565 E.0662
G1 X135.595 Y137.565 E.01672
G1 X136.565 Y136.595 E.04256
G1 X136.565 Y137.134 E.01672
G1 X135.964 Y137.734 E.02637
G1 X137.425 Y135.734 F30000
G1 F7899
G1 X138.565 Y134.595 E.05001
G1 X138.565 Y135.134 E.01672
G1 X137.964 Y135.734 E.02637
; CHANGE_LAYER
; Z_HEIGHT: 0.475862
; LAYER_HEIGHT: 0.0758621
; WIPE_START
G1 F24000
G1 X138.565 Y135.134 E-.3228
G1 X138.565 Y134.595 E-.20469
G1 X138.132 Y135.028 E-.23251
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 3/151
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
G3 Z.8 I1.217 J0 P1  F30000
G1 X138.132 Y118.92 Z.8
G1 Z.476
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.275862
G1 F8319
G1 X138.08 Y118.92 E.00209
G1 X138.08 Y117.953 E.03921
G1 X138.155 Y118.027 E.00428
G3 X138.664 Y118.92 I-1.743 J1.586 E.042
G1 X138.192 Y118.92 E.01915
; WIPE_START
G1 F24000
G1 X138.08 Y118.92 E-.04241
G1 X138.08 Y117.953 E-.36741
G1 X138.155 Y118.027 E-.04008
G1 X138.481 Y118.476 E-.21077
G1 X138.581 Y118.718 E-.09933
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.876 I.911 J-.807 P1  F30000
G1 X136.667 Y116.555 Z.876
G1 Z.476
G1 E.8 F1800
G1 F8319
G3 X135.921 Y116.92 I-1.351 J-1.821 E.03385
G1 X134.821 Y116.92 E.04461
G3 X135.51 Y112.476 I.6 J-2.182 E.2673
G3 X136.715 Y116.519 I-.194 J2.259 E.21986
; WIPE_START
G1 F24000
G1 X135.921 Y116.92 E-.33762
M73 P32 R13
G1 X134.821 Y116.92 E-.41799
G1 X134.811 Y116.915 E-.00439
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.876 I.222 J-1.196 P1  F30000
G1 X125.37 Y115.159 Z.876
G1 Z.476
G1 E.8 F1800
G1 F8319
G3 X123.765 Y116.92 I-2.229 J-.42 E.10173
G1 X122.63 Y116.92 E.04602
G3 X123.336 Y112.478 I.619 J-2.178 E.26663
G3 X125.381 Y115.1 I-.195 J2.26 E.15132
; CHANGE_LAYER
; Z_HEIGHT: 0.6
; LAYER_HEIGHT: 0.124138
; WIPE_START
G1 F24000
G1 X125.065 Y115.948 E-.34359
G1 X124.497 Y116.565 E-.31882
G1 X124.266 Y116.677 E-.09759
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 4/151
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
G3 Z.876 I-.284 J1.183 P1  F30000
G1 X136.898 Y119.71 Z.876
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F8319
G1 X136.898 Y120.102 E.01301
G1 X138.898 Y120.102 E.06634
G1 X138.898 Y135.898 E.52398
G1 X136.898 Y135.898 E.06634
G1 X136.898 Y137.898 E.06634
G1 X121.102 Y137.898 E.52398
G1 X121.102 Y118.102 E.65666
G1 X136.898 Y118.102 E.52398
G1 X136.898 Y119.65 E.05135
G1 X137.29 Y119.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8319
G1 X139.29 Y119.71 E.06145
G1 X139.29 Y136.29 E.50946
G1 X137.29 Y136.29 E.06145
G1 X137.29 Y138.29 E.06145
G1 X120.71 Y138.29 E.50946
G1 X120.71 Y117.71 E.63237
G1 X137.29 Y117.71 E.50946
G1 X137.29 Y119.65 E.05961
M204 S10000
; WIPE_START
G1 F24000
G1 X139.289 Y119.71 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I.485 J-1.116 P1  F30000
G1 X135.964 Y118.266 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423808
G1 F8319
G1 X136.565 Y118.866 E.02637
G1 X136.565 Y119.405 E.01672
G1 X135.595 Y118.435 E.04256
G1 X135.056 Y118.435 E.01672
G1 X136.565 Y119.944 E.0662
G1 X136.565 Y120.435 E.01526
G1 X137.056 Y120.435 E.01526
G1 X138.565 Y121.944 E.0662
G1 X138.565 Y121.405 E.01672
G1 X137.595 Y120.435 E.04256
G1 X138.134 Y120.435 E.01672
G1 X138.734 Y121.036 E.02637
G1 X138.734 Y122.652 F30000
G1 F8319
G1 X134.518 Y118.435 E.18508
G1 X133.979 Y118.435 E.01672
G1 X138.565 Y123.021 E.20128
G1 X138.565 Y123.56 E.01672
G1 X133.44 Y118.435 E.22492
G1 X132.902 Y118.435 E.01672
G1 X138.565 Y124.098 E.24857
G1 X138.565 Y124.637 E.01672
G1 X132.363 Y118.435 E.27221
G1 X131.824 Y118.435 E.01672
G1 X138.565 Y125.176 E.29585
G1 X138.565 Y125.714 E.01672
G1 X131.286 Y118.435 E.3195
G1 X130.747 Y118.435 E.01672
G1 X138.565 Y126.253 E.34314
G1 X138.565 Y126.792 E.01672
G1 X130.208 Y118.435 E.36678
G1 X129.67 Y118.435 E.01672
G1 X138.565 Y127.33 E.39043
G1 X138.565 Y127.869 E.01672
G1 X129.131 Y118.435 E.41407
G1 X128.592 Y118.435 E.01672
G1 X138.565 Y128.408 E.43772
G1 X138.565 Y128.946 E.01672
G1 X128.054 Y118.435 E.46136
G1 X127.515 Y118.435 E.01672
G1 X138.565 Y129.485 E.485
G1 X138.565 Y130.023 E.01672
G1 X126.977 Y118.435 E.50865
G1 X126.438 Y118.435 E.01672
G1 X138.565 Y130.562 E.53229
G1 X138.565 Y131.101 E.01672
G1 X125.899 Y118.435 E.55593
G1 X125.361 Y118.435 E.01672
G1 X138.565 Y131.639 E.57958
G1 X138.565 Y132.178 E.01672
G1 X124.822 Y118.435 E.60322
G1 X124.283 Y118.435 E.01672
G1 X138.565 Y132.717 E.62687
G1 X138.565 Y133.255 E.01672
G1 X123.745 Y118.435 E.65051
G1 X123.206 Y118.435 E.01672
G1 X138.565 Y133.794 E.67415
G1 X138.565 Y134.333 E.01672
G1 X122.667 Y118.435 E.6978
G1 X122.129 Y118.435 E.01672
G1 X138.565 Y134.871 E.72144
G1 X138.565 Y135.41 E.01672
G1 X121.59 Y118.435 E.74508
G1 X121.435 Y118.435 E.0048
G1 X121.435 Y118.819 E.01192
G1 X138.181 Y135.565 E.73501
G1 X137.642 Y135.565 E.01672
G1 X121.435 Y119.358 E.71137
G1 X121.435 Y119.897 E.01672
G1 X137.103 Y135.565 E.68772
G1 X136.565 Y135.565 E.01672
G1 X121.435 Y120.435 E.66408
G1 X121.435 Y120.974 E.01672
G1 X136.565 Y136.103 E.66408
G1 X136.565 Y136.642 E.01672
G1 X121.435 Y121.513 E.66408
G1 X121.435 Y122.051 E.01672
G1 X136.565 Y137.181 E.66408
G1 X136.565 Y137.565 E.01192
G1 X136.41 Y137.565 E.0048
G1 X121.435 Y122.59 E.65729
G1 X121.435 Y123.129 E.01672
G1 X135.871 Y137.565 E.63365
G1 X135.333 Y137.565 E.01672
G1 X121.435 Y123.667 E.61001
G1 X121.435 Y124.206 E.01672
G1 X134.794 Y137.565 E.58636
G1 X134.255 Y137.565 E.01672
G1 X121.435 Y124.745 E.56272
G1 X121.435 Y125.283 E.01672
G1 X133.717 Y137.565 E.53908
G1 X133.178 Y137.565 E.01672
G1 X121.435 Y125.822 E.51543
G1 X121.435 Y126.361 E.01672
G1 X132.639 Y137.565 E.49179
G1 X132.101 Y137.565 E.01672
G1 X121.435 Y126.899 E.46814
G1 X121.435 Y127.438 E.01672
G1 X131.562 Y137.565 E.4445
G1 X131.023 Y137.565 E.01672
G1 X121.435 Y127.977 E.42086
G1 X121.435 Y128.515 E.01672
G1 X130.485 Y137.565 E.39721
G1 X129.946 Y137.565 E.01672
G1 X121.435 Y129.054 E.37357
G1 X121.435 Y129.593 E.01672
G1 X129.407 Y137.565 E.34993
G1 X128.869 Y137.565 E.01672
G1 X121.435 Y130.131 E.32628
G1 X121.435 Y130.67 E.01672
G1 X128.33 Y137.565 E.30264
G1 X127.791 Y137.565 E.01672
G1 X121.435 Y131.209 E.27899
G1 X121.435 Y131.747 E.01672
G1 X127.253 Y137.565 E.25535
G1 X126.714 Y137.565 E.01672
G1 X121.435 Y132.286 E.23171
G1 X121.435 Y132.824 E.01672
G1 X126.176 Y137.565 E.20806
G1 X125.637 Y137.565 E.01672
G1 X121.435 Y133.363 E.18442
G1 X121.435 Y133.902 E.01672
G1 X125.098 Y137.565 E.16078
G1 X124.56 Y137.565 E.01672
G1 X121.435 Y134.44 E.13713
G1 X121.435 Y134.979 E.01672
G1 X124.021 Y137.565 E.11349
G1 X123.482 Y137.565 E.01672
G1 X121.435 Y135.518 E.08985
G1 X121.435 Y136.056 E.01672
G1 X122.944 Y137.565 E.0662
G1 X122.405 Y137.565 E.01672
G1 X121.435 Y136.595 E.04256
G1 X121.435 Y137.134 E.01672
G1 X122.036 Y137.734 E.02636
; CHANGE_LAYER
; Z_HEIGHT: 0.751724
; LAYER_HEIGHT: 0.151724
; WIPE_START
G1 F24000
G1 X121.435 Y137.134 E-.32277
G1 X121.435 Y136.595 E-.20469
G1 X121.868 Y137.028 E-.23255
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 5/151
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
G3 Z1 I1.216 J.036 P1  F30000
G1 X122.458 Y116.92 Z1
G1 Z.752
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.275862
G1 F3363
G3 X123.335 Y112.599 I.786 J-2.09 E.25552
G3 X123.937 Y116.92 I-.189 J2.229 E.24447
G1 X122.518 Y116.92 E.05757
; WIPE_START
G1 F24000
G1 X121.804 Y116.541 E-.30704
G1 X121.28 Y115.898 E-.31514
G1 X121.17 Y115.553 E-.13781
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.152 I.046 J1.216 P1  F30000
G1 X133.202 Y115.097 Z1.152
G1 Z.752
G1 E.8 F1800
G1 F3363
G3 X135.509 Y112.594 I2.214 J-.273 E.15695
G3 X136.092 Y116.92 I-.187 J2.227 E.24524
G1 X134.651 Y116.92 E.05842
G3 X133.21 Y115.155 I.765 J-2.096 E.09695
; WIPE_START
G1 F24000
G1 X133.222 Y114.399 E-.28726
G1 X133.454 Y113.743 E-.26454
G1 X133.8 Y113.318 E-.2082
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.152 I-.897 J.822 P1  F30000
G1 X138.08 Y117.987 Z1.152
G1 Z.752
G1 E.8 F1800
G1 F3363
G1 X138.137 Y118.044 E.00327
G3 X138.639 Y118.92 I-1.726 J1.571 E.04126
G1 X138.08 Y118.92 E.02266
G1 X138.08 Y118.047 E.03539
; CHANGE_LAYER
; Z_HEIGHT: 0.8
; LAYER_HEIGHT: 0.0482759
; WIPE_START
G1 F24000
G1 X138.137 Y118.044 E-.02169
G1 X138.46 Y118.488 E-.20847
G1 X138.639 Y118.92 E-.17771
G1 X138.08 Y118.92 E-.21231
G1 X138.08 Y118.552 E-.13983
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 6/151
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
G3 Z1.152 I-.852 J-.869 P1  F30000
G1 X136.898 Y119.71 Z1.152
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F3363
G1 X136.898 Y120.102 E.01301
G1 X138.898 Y120.102 E.06634
G1 X138.898 Y135.898 E.52398
G1 X136.898 Y135.898 E.06634
G1 X136.898 Y137.898 E.06634
G1 X121.102 Y137.898 E.52398
G1 X121.102 Y118.102 E.65666
G1 X136.898 Y118.102 E.52398
G1 X136.898 Y119.65 E.05135
G1 X137.29 Y119.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3363
G1 X139.29 Y119.71 E.06145
G1 X139.29 Y136.29 E.50946
G1 X137.29 Y136.29 E.06145
G1 X137.29 Y138.29 E.06145
G1 X120.71 Y138.29 E.50946
G1 X120.71 Y117.71 E.63237
G1 X137.29 Y117.71 E.50946
G1 X137.29 Y119.65 E.05961
M204 S10000
; WIPE_START
G1 F24000
G1 X139.289 Y119.71 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I-.293 J-1.181 P1  F30000
G1 X136.55 Y120.39 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3363
G1 X136.55 Y118.45 E.06435
G1 X121.45 Y118.45 E.50087
G1 X121.45 Y120.744 E.07609
G1 X136.256 Y120.744 E.49112
G1 X136.256 Y135.256 E.48138
G1 X121.45 Y135.256 E.49112
G1 X121.45 Y137.55 E.07609
M73 P33 R13
G1 X136.55 Y137.55 E.50087
G1 X136.55 Y135.55 E.06634
G1 X138.55 Y135.55 E.06634
G1 X138.55 Y120.45 E.50087
G1 X136.55 Y120.45 E.06634
G1 X138.143 Y121.486 F30000
G1 F3363
G1 X138.143 Y120.857 E.02084
G1 X137.143 Y120.857 E.03317
G1 X136.663 Y121.337 E.0225
G1 X136.663 Y126.987 E.18741
G1 X138.143 Y128.467 E.06942
G1 X138.143 Y127.533 E.03096
G1 X136.663 Y129.013 E.06942
G1 X136.663 Y134.663 E.18741
G1 X137.143 Y135.143 E.0225
G1 X138.143 Y135.143 E.03317
G1 X138.143 Y134.514 E.02084
G1 X133.095 Y137.143 F30000
G1 F3363
G1 X131.467 Y137.143 E.05401
G1 X129.987 Y135.663 E.06942
G1 X128.533 Y137.143 E.0688
G1 X123.791 Y137.143 E.15733
G1 X122.311 Y135.663 E.06942
G1 X121.857 Y136.143 E.0219
G1 X121.857 Y137.143 E.03317
G1 X122.486 Y137.143 E.02084
G1 X121.523 Y134.849 F30000
G1 F3363
G1 X123.151 Y134.849 E.05401
G1 X135.849 Y122.151 E.59566
G1 X135.849 Y126.173 E.1334
G1 X130.827 Y121.151 E.23556
G1 X129.173 Y121.151 E.05488
G1 X121.45 Y128.874 E.36227
G1 X121.45 Y127.126 E.05796
G1 X129.173 Y134.849 E.36227
G1 X130.827 Y134.849 E.05488
G1 X135.849 Y129.827 E.23556
G1 X135.849 Y133.849 E.1334
G1 X123.151 Y121.151 E.59566
G1 X121.523 Y121.151 E.05401
G1 X122.486 Y118.857 F30000
G1 F3363
G1 X121.857 Y118.857 E.02084
G1 X121.857 Y119.857 E.03317
G1 X122.311 Y120.337 E.0219
G1 X123.791 Y118.857 E.06942
G1 X128.533 Y118.857 E.15733
G1 X130.013 Y120.337 E.06942
G1 X131.467 Y118.857 E.0688
G1 X133.095 Y118.857 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X131.467 Y118.857 E-.61876
G1 X131.206 Y119.123 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 7/151
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
G3 Z1.2 I-.125 J1.211 P1  F30000
G1 X136.898 Y119.71 Z1.2
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3023
G1 X136.898 Y120.102 E.01301
G1 X138.898 Y120.102 E.06634
G1 X138.898 Y135.898 E.52398
G1 X136.898 Y135.898 E.06634
G1 X136.898 Y137.898 E.06634
G1 X121.102 Y137.898 E.52398
G1 X121.102 Y118.102 E.65666
G1 X136.898 Y118.102 E.52398
G1 X136.898 Y119.65 E.05135
G1 X137.29 Y119.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3023
G1 X139.29 Y119.71 E.06145
G1 X139.29 Y136.29 E.50946
G1 X137.29 Y136.29 E.06145
G1 X137.29 Y138.29 E.06145
G1 X120.71 Y138.29 E.50946
G1 X120.71 Y117.71 E.63237
G1 X137.29 Y117.71 E.50946
G1 X137.29 Y119.65 E.05961
M204 S10000
; WIPE_START
G1 F24000
G1 X139.289 Y119.71 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I-.293 J-1.181 P1  F30000
G1 X136.55 Y120.39 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3023
G1 X136.55 Y118.45 E.06435
G1 X121.45 Y118.45 E.50087
G1 X121.45 Y120.744 E.07609
G1 X136.256 Y120.744 E.49112
G1 X136.256 Y135.256 E.48138
G1 X121.45 Y135.256 E.49112
G1 X121.45 Y137.55 E.07609
G1 X136.55 Y137.55 E.50087
G1 X136.55 Y135.55 E.06634
G1 X138.55 Y135.55 E.06634
G1 X138.55 Y120.45 E.50087
G1 X136.55 Y120.45 E.06634
G1 X138.143 Y121.486 F30000
G1 F3023
G1 X138.143 Y120.857 E.02084
G1 X137.143 Y120.857 E.03317
G1 X136.663 Y121.337 E.0225
G1 X136.663 Y126.987 E.18741
G1 X138.143 Y128.467 E.06942
G1 X138.143 Y127.533 E.03096
G1 X136.663 Y129.013 E.06942
G1 X136.663 Y134.663 E.18741
G1 X137.143 Y135.143 E.0225
G1 X138.143 Y135.143 E.03317
G1 X138.143 Y134.514 E.02084
G1 X133.095 Y137.143 F30000
G1 F3023
G1 X131.467 Y137.143 E.05401
G1 X129.987 Y135.663 E.06942
G1 X128.533 Y137.143 E.0688
G1 X123.791 Y137.143 E.15733
G1 X122.311 Y135.663 E.06942
G1 X121.857 Y136.143 E.0219
G1 X121.857 Y137.143 E.03317
G1 X122.486 Y137.143 E.02084
G1 X121.523 Y134.849 F30000
G1 F3023
G1 X123.151 Y134.849 E.05401
G1 X135.849 Y122.151 E.59566
G1 X135.849 Y126.173 E.1334
G1 X130.827 Y121.151 E.23556
G1 X129.173 Y121.151 E.05488
G1 X121.45 Y128.874 E.36227
G1 X121.45 Y127.126 E.05796
G1 X129.173 Y134.849 E.36227
G1 X130.827 Y134.849 E.05488
G1 X135.849 Y129.827 E.23556
G1 X135.849 Y133.849 E.1334
G1 X123.151 Y121.151 E.59566
G1 X121.523 Y121.151 E.05401
G1 X122.486 Y118.857 F30000
G1 F3023
G1 X121.857 Y118.857 E.02084
G1 X121.857 Y119.857 E.03317
G1 X122.311 Y120.337 E.0219
G1 X123.791 Y118.857 E.06942
M73 P34 R13
G1 X128.533 Y118.857 E.15733
G1 X130.013 Y120.337 E.06942
G1 X131.467 Y118.857 E.0688
G1 X133.095 Y118.857 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 1.02759
; LAYER_HEIGHT: 0.0275862
; WIPE_START
G1 F24000
G1 X131.467 Y118.857 E-.61876
G1 X131.206 Y119.123 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 8/151
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
G3 Z1.4 I.036 J1.216 P1  F30000
G1 X138.08 Y118.92 Z1.4
G1 Z1.028
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.275862
G1 F3352
G1 X138.08 Y118.021 E.03644
G1 X138.12 Y118.06 E.00226
G3 X138.614 Y118.92 I-1.71 J1.555 E.04051
G1 X138.14 Y118.92 E.0192
; WIPE_START
G1 F24000
G1 X138.08 Y118.021 E-.34225
G1 X138.12 Y118.06 E-.02117
G1 X138.439 Y118.499 E-.20617
G1 X138.614 Y118.92 E-.17305
G1 X138.568 Y118.92 E-.01736
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.428 I.888 J-.832 P1  F30000
G1 X136.53 Y116.745 Z1.428
G1 Z1.028
G1 E.8 F1800
G1 F3352
G1 X136.294 Y116.92 E.01193
G1 X134.449 Y116.92 E.07481
G3 X135.507 Y112.722 I.971 J-1.987 E.24456
G3 X136.946 Y116.433 I-.19 J2.208 E.20043
G1 X136.578 Y116.709 E.01862
; WIPE_START
G1 F24000
G1 X136.294 Y116.92 E-.13458
G1 X134.648 Y116.92 E-.62542
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.428 I.22 J-1.197 P1  F30000
G1 X125.343 Y115.21 Z1.428
G1 Z1.028
G1 E.8 F1800
G1 F3352
G3 X124.139 Y116.92 I-2.201 J-.271 E.08831
G1 X122.256 Y116.92 E.07637
G3 X123.333 Y112.73 I.991 J-1.979 E.24374
G3 X125.349 Y115.15 I-.191 J2.209 E.14207
; CHANGE_LAYER
; Z_HEIGHT: 1.2
; LAYER_HEIGHT: 0.172414
; WIPE_START
G1 F24000
G1 X125.155 Y115.874 E-.28459
G1 X124.774 Y116.445 E-.26098
G1 X124.322 Y116.783 E-.21443
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 9/151
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
G3 Z1.428 I-.276 J1.185 P1  F30000
G1 X136.898 Y119.71 Z1.428
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F3352
G1 X136.898 Y120.102 E.01301
G1 X138.898 Y120.102 E.06634
G1 X138.898 Y135.898 E.52398
G1 X136.898 Y135.898 E.06634
G1 X136.898 Y137.898 E.06634
G1 X121.102 Y137.898 E.52398
G1 X121.102 Y118.102 E.65666
G1 X136.898 Y118.102 E.52398
G1 X136.898 Y119.65 E.05135
G1 X137.29 Y119.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3352
G1 X139.29 Y119.71 E.06145
G1 X139.29 Y136.29 E.50946
G1 X137.29 Y136.29 E.06145
G1 X137.29 Y138.29 E.06145
G1 X120.71 Y138.29 E.50946
G1 X120.71 Y117.71 E.63237
G1 X137.29 Y117.71 E.50946
G1 X137.29 Y119.65 E.05961
M204 S10000
; WIPE_START
G1 F24000
G1 X139.289 Y119.71 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I-.293 J-1.181 P1  F30000
G1 X136.55 Y120.39 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3352
G1 X136.55 Y118.45 E.06435
G1 X121.45 Y118.45 E.50087
G1 X121.45 Y120.744 E.07609
G1 X136.256 Y120.744 E.49112
G1 X136.256 Y135.256 E.48138
G1 X121.45 Y135.256 E.49112
G1 X121.45 Y137.55 E.07609
G1 X136.55 Y137.55 E.50087
G1 X136.55 Y135.55 E.06634
G1 X138.55 Y135.55 E.06634
G1 X138.55 Y120.45 E.50087
G1 X136.55 Y120.45 E.06634
G1 X138.143 Y121.486 F30000
G1 F3352
G1 X138.143 Y120.857 E.02084
G1 X137.143 Y120.857 E.03317
G1 X136.663 Y121.337 E.0225
G1 X136.663 Y126.987 E.18741
G1 X138.143 Y128.467 E.06942
G1 X138.143 Y127.533 E.03096
G1 X136.663 Y129.013 E.06942
G1 X136.663 Y134.663 E.18741
G1 X137.143 Y135.143 E.0225
G1 X138.143 Y135.143 E.03317
G1 X138.143 Y134.514 E.02084
G1 X133.095 Y137.143 F30000
G1 F3352
G1 X131.467 Y137.143 E.05401
G1 X129.987 Y135.663 E.06942
G1 X128.533 Y137.143 E.0688
G1 X123.791 Y137.143 E.15733
G1 X122.311 Y135.663 E.06942
G1 X121.857 Y136.143 E.0219
G1 X121.857 Y137.143 E.03317
G1 X122.486 Y137.143 E.02084
G1 X121.523 Y134.849 F30000
G1 F3352
G1 X123.151 Y134.849 E.05401
G1 X135.849 Y122.151 E.59566
G1 X135.849 Y126.173 E.1334
G1 X130.827 Y121.151 E.23556
G1 X129.173 Y121.151 E.05488
G1 X121.45 Y128.874 E.36227
G1 X121.45 Y127.126 E.05796
G1 X129.173 Y134.849 E.36227
G1 X130.827 Y134.849 E.05488
G1 X135.849 Y129.827 E.23556
G1 X135.849 Y133.849 E.1334
G1 X123.151 Y121.151 E.59566
G1 X121.523 Y121.151 E.05401
G1 X122.486 Y118.857 F30000
G1 F3352
G1 X121.857 Y118.857 E.02084
G1 X121.857 Y119.857 E.03317
G1 X122.311 Y120.337 E.0219
G1 X123.791 Y118.857 E.06942
G1 X128.533 Y118.857 E.15733
G1 X130.013 Y120.337 E.06942
G1 X131.467 Y118.857 E.0688
G1 X133.095 Y118.857 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 1.30345
; LAYER_HEIGHT: 0.103448
; WIPE_START
G1 F24000
G1 X131.467 Y118.857 E-.61876
G1 X131.206 Y119.123 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 10/151
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
G3 Z1.6 I.036 J1.216 P1  F30000
G1 X138.08 Y118.92 Z1.6
G1 Z1.303
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.275862
G1 F3348
G1 X138.102 Y118.077 E.03419
G3 X138.589 Y118.92 I-1.695 J1.541 E.03977
G1 X138.14 Y118.92 E.01819
; WIPE_START
G1 F24000
G1 X138.102 Y118.077 E-.32056
G1 X138.418 Y118.511 E-.20387
G1 X138.589 Y118.92 E-.16839
G1 X138.412 Y118.92 E-.06717
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.703 I.866 J-.855 P1  F30000
G1 X136.433 Y116.913 Z1.703
G1 Z1.303
G1 E.8 F1800
G1 F3348
G1 X136.425 Y116.92 E.00039
G1 X134.318 Y116.92 E.08545
G3 X135.506 Y112.846 I1.096 J-1.89 E.23555
G3 X137.019 Y116.413 I-.182 J2.182 E.19288
G1 X136.478 Y116.874 E.02883
; WIPE_START
G1 F24000
G1 X136.425 Y116.92 E-.02642
G1 X134.495 Y116.92 E-.73358
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.703 I.228 J-1.195 P1  F30000
G1 X125.335 Y115.171 Z1.703
M73 P35 R13
G1 Z1.303
G1 E.8 F1800
G1 F3348
G3 X124.271 Y116.92 I-2.187 J-.132 E.08636
G1 X122.123 Y116.92 E.08711
G3 X123.332 Y112.856 I1.118 J-1.879 E.23464
G3 X125.337 Y115.111 I-.184 J2.183 E.13503
; CHANGE_LAYER
; Z_HEIGHT: 1.4
; LAYER_HEIGHT: 0.0965517
; WIPE_START
G1 F24000
G1 X125.187 Y115.838 E-.28189
G1 X124.845 Y116.426 E-.25832
G1 X124.407 Y116.803 E-.21979
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 11/151
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
G3 Z1.703 I-.276 J1.185 P1  F30000
G1 X136.898 Y119.71 Z1.703
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F3348
G1 X136.898 Y120.102 E.01301
G1 X138.898 Y120.102 E.06634
G1 X138.898 Y135.898 E.52398
G1 X136.898 Y135.898 E.06634
G1 X136.898 Y137.898 E.06634
G1 X121.102 Y137.898 E.52398
G1 X121.102 Y118.102 E.65666
G1 X136.898 Y118.102 E.52398
G1 X136.898 Y119.65 E.05135
G1 X137.29 Y119.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3348
G1 X139.29 Y119.71 E.06145
G1 X139.29 Y136.29 E.50946
G1 X137.29 Y136.29 E.06145
G1 X137.29 Y138.29 E.06145
G1 X120.71 Y138.29 E.50946
G1 X120.71 Y117.71 E.63237
G1 X137.29 Y117.71 E.50946
G1 X137.29 Y119.65 E.05961
M204 S10000
; WIPE_START
G1 F24000
G1 X139.289 Y119.71 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-.293 J-1.181 P1  F30000
G1 X136.55 Y120.39 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3348
G1 X136.55 Y118.45 E.06435
G1 X121.45 Y118.45 E.50087
G1 X121.45 Y120.744 E.07609
G1 X136.256 Y120.744 E.49112
G1 X136.256 Y135.256 E.48138
G1 X121.45 Y135.256 E.49112
G1 X121.45 Y137.55 E.07609
G1 X136.55 Y137.55 E.50087
G1 X136.55 Y135.55 E.06634
G1 X138.55 Y135.55 E.06634
G1 X138.55 Y120.45 E.50087
G1 X136.55 Y120.45 E.06634
G1 X138.143 Y121.486 F30000
G1 F3348
G1 X138.143 Y120.857 E.02084
G1 X137.143 Y120.857 E.03317
G1 X136.663 Y121.337 E.0225
G1 X136.663 Y126.987 E.18741
G1 X138.143 Y128.467 E.06942
G1 X138.143 Y127.533 E.03096
G1 X136.663 Y129.013 E.06942
G1 X136.663 Y134.663 E.18741
G1 X137.143 Y135.143 E.0225
G1 X138.143 Y135.143 E.03317
G1 X138.143 Y134.514 E.02084
G1 X133.095 Y137.143 F30000
G1 F3348
G1 X131.467 Y137.143 E.05401
G1 X129.987 Y135.663 E.06942
G1 X128.533 Y137.143 E.0688
G1 X123.791 Y137.143 E.15733
G1 X122.311 Y135.663 E.06942
G1 X121.857 Y136.143 E.0219
G1 X121.857 Y137.143 E.03317
G1 X122.486 Y137.143 E.02084
G1 X121.523 Y134.849 F30000
G1 F3348
G1 X123.151 Y134.849 E.05401
G1 X135.849 Y122.151 E.59566
G1 X135.849 Y126.173 E.1334
G1 X130.827 Y121.151 E.23556
G1 X129.173 Y121.151 E.05488
G1 X121.45 Y128.874 E.36227
G1 X121.45 Y127.126 E.05796
G1 X129.173 Y134.849 E.36227
G1 X130.827 Y134.849 E.05488
G1 X135.849 Y129.827 E.23556
G1 X135.849 Y133.849 E.1334
G1 X123.151 Y121.151 E.59566
G1 X121.523 Y121.151 E.05401
G1 X122.486 Y118.857 F30000
G1 F3348
G1 X121.857 Y118.857 E.02084
G1 X121.857 Y119.857 E.03317
G1 X122.311 Y120.337 E.0219
G1 X123.791 Y118.857 E.06942
G1 X128.533 Y118.857 E.15733
G1 X130.013 Y120.337 E.06942
G1 X131.467 Y118.857 E.0688
G1 X133.095 Y118.857 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 1.57931
; LAYER_HEIGHT: 0.17931
; WIPE_START
G1 F24000
G1 X131.467 Y118.857 E-.61876
G1 X131.206 Y119.123 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 12/151
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
G3 Z1.8 I.036 J1.216 P1  F30000
G1 X138.08 Y118.92 Z1.8
G1 Z1.579
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.275862
G1 F6724
G1 X138.085 Y118.093 E.03351
G3 X138.564 Y118.92 I-1.68 J1.526 E.03902
G1 X138.14 Y118.92 E.01717
; WIPE_START
G1 F24000
G1 X138.085 Y118.093 E-.31467
G1 X138.396 Y118.523 E-.20157
G1 X138.564 Y118.92 E-.16374
G1 X138.353 Y118.92 E-.08002
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.979 I.902 J-.817 P1  F30000
G1 X136.541 Y116.92 Z1.979
G1 Z1.579
G1 E.8 F1800
G1 F6724
G1 X134.203 Y116.92 E.09482
G3 X135.504 Y112.97 I1.215 J-1.789 E.22665
G3 X136.59 Y116.885 I-.185 J2.159 E.21351
; WIPE_START
G1 F24000
G1 X134.59 Y116.914 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.979 I.212 J-1.198 P1  F30000
G1 X125.308 Y115.272 Z1.979
G1 Z1.579
G1 E.8 F1800
G1 F6724
G3 X124.388 Y116.92 I-2.165 J-.129 E.07917
G1 X122.007 Y116.92 E.09655
G3 X123.33 Y112.983 I1.238 J-1.775 E.22566
G3 X125.311 Y115.213 I-.187 J2.161 E.13337
; CHANGE_LAYER
; Z_HEIGHT: 1.6
; LAYER_HEIGHT: 0.0206897
; WIPE_START
G1 F24000
G1 X125.164 Y115.932 E-.27893
G1 X124.827 Y116.513 E-.25546
G1 X124.391 Y116.917 E-.2256
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 13/151
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
G3 Z1.979 I-.265 J1.188 P1  F30000
G1 X136.898 Y119.71 Z1.979
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F6724
G1 X136.898 Y120.102 E.01301
G1 X138.898 Y120.102 E.06634
G1 X138.898 Y135.898 E.52398
G1 X136.898 Y135.898 E.06634
G1 X136.898 Y137.898 E.06634
G1 X121.102 Y137.898 E.52398
G1 X121.102 Y118.102 E.65666
G1 X136.898 Y118.102 E.52398
G1 X136.898 Y119.65 E.05135
G1 X137.29 Y119.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6724
G1 X139.29 Y119.71 E.06145
G1 X139.29 Y136.29 E.50946
G1 X137.29 Y136.29 E.06145
G1 X137.29 Y138.29 E.06145
G1 X120.71 Y138.29 E.50946
G1 X120.71 Y117.71 E.63237
G1 X137.29 Y117.71 E.50946
G1 X137.29 Y119.65 E.05961
M204 S10000
; WIPE_START
G1 F24000
G1 X139.289 Y119.71 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I.529 J-1.096 P1  F30000
G1 X136.731 Y118.474 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.403637
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X121.472 Y118.474 E.79553
G1 X121.472 Y118.927 E.02365
G1 X136.528 Y118.927 E.78497
G1 X136.528 Y119.381 E.02365
G1 X121.472 Y119.381 E.78497
G1 X121.472 Y119.835 E.02365
G1 X136.528 Y119.835 E.78497
G1 X136.528 Y120.288 E.02365
G1 X121.472 Y120.288 E.78497
G1 X121.472 Y120.723 E.02266
G1 X136.277 Y120.723 E.77189
G1 X136.277 Y120.742 E.001
G1 X138.528 Y120.742 E.11735
G1 X138.528 Y121.195 E.02365
G1 X136.277 Y121.195 E.11735
G1 X136.277 Y121.649 E.02365
G1 X138.528 Y121.649 E.11735
G1 X138.528 Y122.103 E.02365
G1 X136.277 Y122.103 E.11735
G1 X136.277 Y122.556 E.02365
G1 X138.528 Y122.556 E.11735
G1 X138.528 Y123.01 E.02365
G1 X136.277 Y123.01 E.11735
G1 X136.277 Y123.464 E.02365
G1 X138.528 Y123.464 E.11735
G1 X138.528 Y123.917 E.02365
G1 X136.277 Y123.917 E.11735
G1 X136.277 Y124.371 E.02365
G1 X138.528 Y124.371 E.11735
G1 X138.528 Y124.825 E.02365
G1 X136.277 Y124.825 E.11735
G1 X136.277 Y125.278 E.02365
M73 P36 R13
G1 X138.528 Y125.278 E.11735
G1 X138.528 Y125.732 E.02365
G1 X136.277 Y125.732 E.11735
G1 X136.277 Y126.186 E.02365
G1 X138.528 Y126.186 E.11735
G1 X138.528 Y126.639 E.02365
G1 X136.277 Y126.639 E.11735
G1 X136.277 Y127.093 E.02365
G1 X138.528 Y127.093 E.11735
G1 X138.528 Y127.546 E.02365
G1 X136.277 Y127.546 E.11735
G1 X136.277 Y128 E.02365
G1 X138.528 Y128 E.11735
G1 X138.528 Y128.454 E.02365
G1 X136.277 Y128.454 E.11735
G1 X136.277 Y128.907 E.02365
G1 X138.528 Y128.907 E.11735
G1 X138.528 Y129.361 E.02365
G1 X136.277 Y129.361 E.11735
G1 X136.277 Y129.815 E.02365
G1 X138.528 Y129.815 E.11735
G1 X138.528 Y130.268 E.02365
G1 X136.277 Y130.268 E.11735
M73 P36 R12
G1 X136.277 Y130.722 E.02365
G1 X138.528 Y130.722 E.11735
G1 X138.528 Y131.176 E.02365
G1 X136.277 Y131.176 E.11735
G1 X136.277 Y131.629 E.02365
G1 X138.528 Y131.629 E.11735
G1 X138.528 Y132.083 E.02365
G1 X136.277 Y132.083 E.11735
G1 X136.277 Y132.536 E.02365
G1 X138.528 Y132.536 E.11735
G1 X138.528 Y132.99 E.02365
G1 X136.277 Y132.99 E.11735
G1 X136.277 Y133.444 E.02365
G1 X138.528 Y133.444 E.11735
G1 X138.528 Y133.897 E.02365
G1 X136.277 Y133.897 E.11735
G1 X136.277 Y134.351 E.02365
G1 X138.528 Y134.351 E.11735
G1 X138.528 Y134.805 E.02365
G1 X136.277 Y134.805 E.11735
G1 X136.277 Y135.258 E.02365
G1 X138.528 Y135.258 E.11735
G1 X138.528 Y135.528 E.01407
G1 X136.528 Y135.528 E.10427
G1 X136.528 Y135.712 E.00958
G1 X121.472 Y135.712 E.78497
G1 X121.472 Y136.166 E.02365
G1 X136.528 Y136.166 E.78497
G1 X136.528 Y136.619 E.02365
G1 X121.472 Y136.619 E.78497
G1 X121.472 Y137.073 E.02365
G1 X136.528 Y137.073 E.78497
G1 X136.528 Y137.526 E.02365
G1 X121.269 Y137.526 E.79553
M106 S252.45
G1 X121.523 Y134.849 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F6724
G1 X123.151 Y134.849 E.05401
G1 X135.849 Y122.151 E.59566
G1 X135.849 Y126.173 E.1334
G1 X130.827 Y121.151 E.23556
G1 X129.173 Y121.151 E.05489
G1 X121.45 Y128.874 E.36227
G1 X121.45 Y127.126 E.05796
G1 X129.173 Y134.849 E.36227
G1 X130.827 Y134.849 E.05489
G1 X135.849 Y129.827 E.23556
G1 X135.849 Y133.849 E.1334
G1 X123.151 Y121.151 E.59566
G1 X121.523 Y121.151 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X123.151 Y121.151 E-.61876
G1 X123.414 Y121.414 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 14/151
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
G1 X136.898 Y119.71 Z2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F4398
G1 X136.898 Y120.102 E.01301
G1 X138.898 Y120.102 E.06634
G1 X138.898 Y135.898 E.52398
G1 X136.898 Y135.898 E.06634
G1 X136.898 Y137.898 E.06634
G1 X121.102 Y137.898 E.52398
G1 X121.102 Y118.102 E.65666
G1 X136.898 Y118.102 E.52398
G1 X136.898 Y119.65 E.05135
G1 X137.29 Y119.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4398
G1 X139.29 Y119.71 E.06145
G1 X139.29 Y136.29 E.50946
G1 X137.29 Y136.29 E.06145
G1 X137.29 Y138.29 E.06145
G1 X120.71 Y138.29 E.50946
G1 X120.71 Y117.71 E.63237
G1 X137.29 Y117.71 E.50946
G1 X137.29 Y119.65 E.05961
M204 S10000
; WIPE_START
G1 F24000
G1 X139.289 Y119.71 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I.006 J-1.217 P1  F30000
G1 X122.627 Y119.627 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42261
G1 F4398
G1 X135.313 Y119.627 E.39252
G1 X135.752 Y120.005 F30000
; LINE_WIDTH: 0.419999
G1 F4398
G1 X135.752 Y119.248 E.02325
G1 X122.248 Y119.248 E.41492
G1 X122.248 Y120.005 E.02325
G1 X135.692 Y120.005 E.41308
G1 X136.052 Y120.382 F30000
G1 F4398
G1 X136.173 Y120.426 E.00394
G1 X136.129 Y120.306 E.00394
G1 X136.129 Y118.871 E.04407
G1 X121.871 Y118.871 E.43809
G1 X121.871 Y120.382 E.04643
G1 X135.992 Y120.382 E.4339
G1 X136.241 Y121.627 F30000
G1 F4398
G1 X136.241 Y135.052 E.41253
G1 X136.22 Y135.14 E.00276
; LINE_WIDTH: 0.494871
G1 X136.199 Y135.227 E.00331
G1 X135.373 Y135.241 E.0304
; LINE_WIDTH: 0.419999
G1 X121.494 Y135.241 E.42647
G1 X121.494 Y137.506 E.0696
G1 X136.506 Y137.506 E.46127
G1 X136.506 Y135.694 E.05566
G1 X136.527 Y135.607 E.00276
; LINE_WIDTH: 0.494871
G1 X136.548 Y135.52 E.00331
G1 X137.373 Y135.506 E.0304
; LINE_WIDTH: 0.419999
G1 X138.506 Y135.506 E.0348
G1 X138.506 Y120.494 E.46127
G1 X136.694 Y120.494 E.05566
G1 X136.607 Y120.473 E.00276
; LINE_WIDTH: 0.494871
G1 X136.52 Y120.452 E.00331
G1 X136.506 Y119.627 E.0304
; LINE_WIDTH: 0.419999
G1 X136.506 Y118.494 E.0348
G1 X121.494 Y118.494 E.46127
G1 X121.494 Y120.759 E.0696
G1 X136.052 Y120.759 E.44733
G1 X136.14 Y120.78 E.00276
; LINE_WIDTH: 0.4946
G1 X136.227 Y120.801 E.0033
G1 X136.24 Y121.567 E.02818
G1 X137.373 Y134.373 F30000
; LINE_WIDTH: 0.42261
G1 F4398
G1 X137.373 Y121.687 E.39252
G1 X136.995 Y134.752 F30000
; LINE_WIDTH: 0.419999
G1 F4398
G1 X137.752 Y134.752 E.02325
G1 X137.752 Y121.248 E.41492
G1 X136.995 Y121.248 E.02325
G1 X136.995 Y134.692 E.41308
G1 X136.618 Y135.052 F30000
G1 F4398
G1 X136.574 Y135.173 E.00394
G1 X136.694 Y135.129 E.00394
G1 X138.129 Y135.129 E.04407
G1 X138.129 Y120.871 E.43809
G1 X136.694 Y120.871 E.04407
G1 X136.574 Y120.827 E.00394
G1 X136.618 Y120.948 E.00394
G1 X136.618 Y134.992 E.43155
G1 X136.052 Y135.618 F30000
G1 F4398
G1 X121.871 Y135.618 E.43574
G1 X121.871 Y137.129 E.04643
G1 X136.129 Y137.129 E.43809
G1 X136.129 Y135.694 E.04407
G1 X136.173 Y135.574 E.00394
G1 X136.109 Y135.597 E.00209
G1 X135.752 Y135.995 F30000
G1 F4398
G1 X122.248 Y135.995 E.41492
G1 X122.248 Y136.752 E.02325
G1 X135.752 Y136.752 E.41492
G1 X135.752 Y136.055 E.02141
G1 X122.627 Y136.373 F30000
; LINE_WIDTH: 0.42261
G1 F4398
M73 P37 R12
G1 X135.313 Y136.373 E.39252
G1 X121.523 Y134.849 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4398
G1 X123.151 Y134.849 E.05401
G1 X135.849 Y122.151 E.59566
G1 X135.849 Y126.173 E.1334
G1 X130.827 Y121.151 E.23556
G1 X129.173 Y121.151 E.05489
G1 X121.45 Y128.874 E.36227
G1 X121.45 Y127.126 E.05796
G1 X129.173 Y134.849 E.36227
G1 X130.827 Y134.849 E.05489
G1 X135.849 Y129.827 E.23556
G1 X135.849 Y133.849 E.1334
G1 X123.151 Y121.151 E.59566
G1 X121.523 Y121.151 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 1.85517
; LAYER_HEIGHT: 0.0551724
; WIPE_START
G1 F24000
G1 X123.151 Y121.151 E-.61876
G1 X123.414 Y121.414 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 15/151
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
G3 Z2.2 I1.217 J0 P1  F30000
G1 X123.414 Y116.92 Z2.2
G1 Z1.855
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.275862
G1 F5414
G1 X121.911 Y116.92 E.06094
G3 X123.328 Y113.109 I1.328 J-1.675 E.21783
G3 X124.483 Y116.92 I-.18 J2.135 E.20723
G1 X123.474 Y116.92 E.04091
; WIPE_START
G1 F24000
G1 X121.911 Y116.92 E-.59381
G1 X121.62 Y116.593 E-.16619
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.255 I.087 J1.214 P1  F30000
G1 X133.342 Y115.754 Z2.255
G1 Z1.855
G1 E.8 F1800
G1 F5414
G3 X135.503 Y113.094 I2.071 J-.526 E.16127
G3 X136.636 Y116.92 I-.178 J2.134 E.20827
G1 X134.108 Y116.92 E.10254
G3 X133.358 Y115.811 I1.305 J-1.691 E.0552
; WIPE_START
G1 F24000
G1 X133.284 Y115.088 E-.27633
G1 X133.427 Y114.436 E-.2536
G1 X133.731 Y113.912 E-.23006
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.255 I-.847 J.874 P1  F30000
G1 X138.08 Y118.125 Z2.255
G1 Z1.855
G1 E.8 F1800
G1 F5414
G1 X138.154 Y118.208 E.00451
G3 X138.539 Y118.92 I-1.645 J1.35 E.03299
G1 X138.08 Y118.92 E.01858
G1 X138.08 Y118.185 E.02979
; CHANGE_LAYER
; Z_HEIGHT: 2
; LAYER_HEIGHT: 0.144828
; WIPE_START
G1 F24000
G1 X138.154 Y118.208 E-.02932
G1 X138.539 Y118.92 E-.30723
G1 X138.08 Y118.92 E-.17412
G1 X138.08 Y118.263 E-.24933
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 16/151
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
G3 Z2.255 I-.917 J-.8 P1  F30000
G1 X136.063 Y120.578 Z2.255
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F5414
G1 X136.422 Y120.578 E.01192
G1 X136.422 Y135.422 E.49242
G1 X121.102 Y135.422 E.5082
G1 X121.102 Y120.578 E.49242
G1 X136.003 Y120.578 E.49428
; WIPE_START
G1 F24000
G1 X136.422 Y120.578 E-.15939
G1 X136.422 Y122.158 E-.60061
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I1.147 J.407 P1  F30000
G1 X137.29 Y119.71 Z2.4
G1 Z2
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5414
G1 X139.29 Y119.71 E.06145
G1 X139.29 Y136.29 E.50946
G1 X137.29 Y136.29 E.06145
G1 X137.29 Y138.29 E.06145
G1 X120.71 Y138.29 E.50946
G1 X120.71 Y117.71 E.63237
G1 X137.29 Y117.71 E.50946
G1 X137.29 Y119.65 E.05961
M204 S10000
; WIPE_START
G1 F24000
G1 X139.289 Y119.71 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-.209 J-1.199 P1  F30000
G1 X121.45 Y122.826 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5414
G1 X121.45 Y121.198 E.05401
G1 X121.722 Y120.926 E.01274
G1 X122.926 Y120.926 E.03994
G1 X136.074 Y134.074 E.61679
G1 X136.074 Y129.602 E.14834
G1 X130.602 Y135.074 E.2567
G1 X129.398 Y135.074 E.03994
G1 X121.45 Y127.126 E.37284
G1 X121.45 Y128.874 E.05796
G1 X129.398 Y120.926 E.37284
G1 X130.602 Y120.926 E.03994
G1 X136.074 Y126.398 E.2567
G1 X136.074 Y121.926 E.14834
G1 X122.926 Y135.074 E.61679
G1 X121.722 Y135.074 E.03994
G1 X121.45 Y134.802 E.01274
G1 X121.45 Y133.174 E.05401
; WIPE_START
G1 F24000
G1 X121.45 Y134.802 E-.61876
G1 X121.713 Y135.065 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-.207 J1.199 P1  F30000
G1 X137.083 Y137.715 Z2.4
G1 Z2
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F5414
G1 X136.715 Y138.083 E.01596
G1 X136.182 Y138.083
G1 X137.083 Y137.182 E.03913
G1 X137.083 Y136.649
G1 X135.649 Y138.083 E.06231
G1 X135.116 Y138.083
G1 X137.083 Y136.116 E.08548
M204 S10000
; WIPE_START
G1 F24000
G1 X135.668 Y137.53 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I.522 J1.099 P1  F30000
G1 X138.715 Y136.083 Z2.4
G1 Z2
G1 E.8 F1800
M204 S2000
G1 F5414
G1 X139.083 Y135.715 E.01596
G1 X139.083 Y135.182
G1 X138.182 Y136.083 E.03913
G1 X137.649 Y136.083
G1 X139.083 Y134.649 E.06231
G1 X139.083 Y134.116
G1 X137.116 Y136.083 E.08548
M204 S10000
; WIPE_START
G1 F24000
G1 X138.53 Y134.668 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I1.085 J.552 P1  F30000
G1 X139.083 Y133.582 Z2.4
G1 Z2
G1 E.8 F1800
M204 S2000
G1 F5414
G1 X134.582 Y138.083 E.19556
G1 X134.049 Y138.083
G1 X136.487 Y135.645 E.10594
G1 X135.954 Y135.645
G1 X133.516 Y138.083 E.10594
G1 X132.982 Y138.083
G1 X135.42 Y135.645 E.10594
G1 X134.887 Y135.645
G1 X132.449 Y138.083 E.10594
G1 X131.916 Y138.083
G1 X134.354 Y135.645 E.10594
G1 X133.821 Y135.645
G1 X131.383 Y138.083 E.10594
G1 X130.849 Y138.083
G1 X133.287 Y135.645 E.10594
G1 X132.754 Y135.645
G1 X130.316 Y138.083 E.10594
G1 X129.783 Y138.083
G1 X132.221 Y135.645 E.10594
G1 X131.688 Y135.645
G1 X129.25 Y138.083 E.10594
G1 X128.716 Y138.083
G1 X131.154 Y135.645 E.10594
G1 X130.621 Y135.645
G1 X128.183 Y138.083 E.10594
G1 X127.65 Y138.083
G1 X130.088 Y135.645 E.10594
G1 X129.554 Y135.645
G1 X127.116 Y138.083 E.10594
G1 X126.583 Y138.083
G1 X129.021 Y135.645 E.10594
G1 X128.488 Y135.645
G1 X126.05 Y138.083 E.10594
G1 X125.517 Y138.083
G1 X127.955 Y135.645 E.10594
G1 X127.421 Y135.645
G1 X124.983 Y138.083 E.10594
G1 X124.45 Y138.083
G1 X126.888 Y135.645 E.10594
G1 X126.355 Y135.645
G1 X123.917 Y138.083 E.10594
G1 X123.384 Y138.083
G1 X125.822 Y135.645 E.10594
G1 X125.288 Y135.645
G1 X122.85 Y138.083 E.10594
G1 X122.317 Y138.083
G1 X124.755 Y135.645 E.10594
G1 X124.222 Y135.645
G1 X121.784 Y138.083 E.10594
G1 X121.25 Y138.083
G1 X123.688 Y135.645 E.10594
G1 X123.155 Y135.645
G1 X120.917 Y137.882 E.09724
G1 X120.917 Y137.349
G1 X122.622 Y135.645 E.07407
G1 X122.089 Y135.645
G1 X120.917 Y136.816 E.0509
G1 X120.917 Y136.283
G1 X121.555 Y135.645 E.02772
M204 S10000
G1 X136.645 Y135.487 F30000
M204 S2000
G1 F5414
G1 X139.083 Y133.049 E.10594
G1 X139.083 Y132.516
G1 X136.645 Y134.954 E.10594
G1 X136.645 Y134.42
G1 X139.083 Y131.982 E.10594
G1 X139.083 Y131.449
G1 X136.645 Y133.887 E.10594
G1 X136.645 Y133.354
G1 X139.083 Y130.916 E.10594
G1 X139.083 Y130.383
G1 X136.645 Y132.821 E.10594
G1 X136.645 Y132.287
G1 X139.083 Y129.849 E.10594
G1 X139.083 Y129.316
G1 X136.645 Y131.754 E.10594
G1 X136.645 Y131.221
G1 X139.083 Y128.783 E.10594
G1 X139.083 Y128.25
G1 X136.645 Y130.688 E.10594
G1 X136.645 Y130.154
G1 X139.083 Y127.716 E.10594
G1 X139.083 Y127.183
G1 X136.645 Y129.621 E.10594
G1 X136.645 Y129.088
G1 X139.083 Y126.65 E.10594
G1 X139.083 Y126.116
G1 X136.645 Y128.554 E.10594
G1 X136.645 Y128.021
G1 X139.083 Y125.583 E.10594
G1 X139.083 Y125.05
M73 P38 R12
G1 X136.645 Y127.488 E.10594
G1 X136.645 Y126.955
G1 X139.083 Y124.517 E.10594
G1 X139.083 Y123.983
G1 X136.645 Y126.421 E.10594
G1 X136.645 Y125.888
G1 X139.083 Y123.45 E.10594
G1 X139.083 Y122.917
G1 X136.645 Y125.355 E.10594
G1 X136.645 Y124.822
G1 X139.083 Y122.384 E.10594
G1 X139.083 Y121.85
G1 X136.645 Y124.288 E.10594
G1 X136.645 Y123.755
G1 X139.083 Y121.317 E.10594
G1 X139.083 Y120.784
G1 X136.645 Y123.222 E.10594
G1 X136.645 Y122.688
G1 X139.083 Y120.251 E.10594
G1 X138.882 Y119.917
G1 X136.645 Y122.155 E.09724
G1 X136.645 Y121.622
G1 X138.349 Y119.917 E.07407
G1 X137.816 Y119.917
G1 X136.645 Y121.089 E.0509
G1 X136.645 Y120.555
G1 X137.283 Y119.917 E.02772
G1 X137.083 Y119.584
G1 X136.311 Y120.355 E.03351
G1 X135.778 Y120.355
G1 X137.083 Y119.051 E.05669
G1 X137.083 Y118.518
G1 X135.245 Y120.355 E.07986
G1 X134.712 Y120.355
G1 X137.083 Y117.984 E.10303
G1 X136.616 Y117.917
G1 X134.178 Y120.355 E.10594
G1 X133.645 Y120.355
G1 X136.083 Y117.917 E.10594
G1 X135.55 Y117.917
G1 X133.112 Y120.355 E.10594
G1 X132.578 Y120.355
G1 X135.016 Y117.917 E.10594
G1 X134.483 Y117.917
G1 X132.045 Y120.355 E.10594
G1 X131.512 Y120.355
G1 X133.95 Y117.917 E.10594
G1 X133.417 Y117.917
G1 X130.979 Y120.355 E.10594
G1 X130.445 Y120.355
G1 X132.883 Y117.917 E.10594
G1 X132.35 Y117.917
G1 X129.912 Y120.355 E.10594
G1 X129.379 Y120.355
G1 X131.817 Y117.917 E.10594
G1 X131.284 Y117.917
G1 X128.846 Y120.355 E.10594
G1 X128.312 Y120.355
G1 X130.75 Y117.917 E.10594
G1 X130.217 Y117.917
G1 X127.779 Y120.355 E.10594
G1 X127.246 Y120.355
G1 X129.684 Y117.917 E.10594
G1 X129.15 Y117.917
G1 X126.713 Y120.355 E.10594
G1 X126.179 Y120.355
G1 X128.617 Y117.917 E.10594
G1 X128.084 Y117.917
G1 X125.646 Y120.355 E.10594
G1 X125.113 Y120.355
G1 X127.551 Y117.917 E.10594
G1 X127.017 Y117.917
G1 X124.579 Y120.355 E.10594
G1 X124.046 Y120.355
G1 X126.484 Y117.917 E.10594
G1 X125.951 Y117.917
G1 X123.513 Y120.355 E.10594
G1 X122.98 Y120.355
G1 X125.418 Y117.917 E.10594
G1 X124.884 Y117.917
G1 X122.446 Y120.355 E.10594
G1 X121.913 Y120.355
G1 X124.351 Y117.917 E.10594
G1 X123.818 Y117.917
G1 X121.38 Y120.355 E.10594
G1 X120.917 Y120.285
G1 X123.285 Y117.917 E.10286
G1 X122.751 Y117.917
G1 X120.917 Y119.751 E.07969
G1 X120.917 Y119.218
G1 X122.218 Y117.917 E.05652
G1 X121.685 Y117.917
G1 X120.917 Y118.685 E.03334
M204 S10000
; WIPE_START
G1 F24000
G1 X121.685 Y117.917 E-.41236
G1 X122.218 Y117.917 E-.20264
G1 X121.948 Y118.187 E-.145
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-.929 J.786 P1  F30000
G1 X137.085 Y136.085 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0894706
G1 F5414
G1 X136.966 Y135.966 E.00064
; WIPE_START
G1 F24000
G1 X137.085 Y136.085 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-.146 J-1.208 P1  F30000
G1 X121.18 Y138.012 Z2.4
G1 Z2
G1 E.8 F1800
; LINE_WIDTH: 0.15234
G1 F5414
G1 X121.086 Y138.051 E.00091
G1 X120.899 Y138.051 E.00167
; CHANGE_LAYER
; Z_HEIGHT: 2.13103
; LAYER_HEIGHT: 0.131034
; WIPE_START
G1 F24000
G1 X121.086 Y138.051 E-.49282
G1 X121.18 Y138.012 E-.26718
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 17/151
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
G3 Z2.4 I1.216 J.037 P1  F30000
G1 X121.83 Y116.92 Z2.4
G1 Z2.131
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.275862
G1 F2058
G3 X123.327 Y113.234 I1.412 J-1.573 E.21004
G3 X124.564 Y116.92 I-.182 J2.112 E.19956
G1 X121.89 Y116.92 E.10846
; WIPE_START
G1 F24000
G1 X121.452 Y116.47 E-.23846
G1 X121.194 Y115.864 E-.25021
G1 X121.133 Y115.206 E-.25106
G1 X121.145 Y115.154 E-.02027
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.531 I-.069 J1.215 P1  F30000
G1 X133.368 Y115.846 Z2.531
G1 Z2.131
G1 E.8 F1800
G1 F2058
G3 X135.502 Y113.217 I2.049 J-.518 E.15928
G3 X136.718 Y116.92 I-.181 J2.111 E.20066
G1 X134.026 Y116.92 E.10916
G3 X133.383 Y115.903 I1.39 J-1.592 E.04946
; WIPE_START
G1 F24000
G1 X133.308 Y115.188 E-.27334
G1 X133.45 Y114.544 E-.25071
G1 X133.762 Y114.007 E-.23595
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.531 I-.844 J.877 P1  F30000
G1 X138.08 Y118.162 Z2.531
G1 Z2.131
G1 E.8 F1800
G1 F2058
G1 X138.135 Y118.224 E.00337
G3 X138.514 Y118.92 I-1.631 J1.337 E.0323
G1 X138.08 Y118.92 E.01756
G1 X138.08 Y118.222 E.02831
; CHANGE_LAYER
; Z_HEIGHT: 2.2
; LAYER_HEIGHT: 0.0689657
; WIPE_START
G1 F24000
G1 X138.135 Y118.224 E-.02112
G1 X138.514 Y118.92 E-.30426
G1 X138.08 Y118.92 E-.16641
G1 X138.08 Y118.222 E-.26821
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 18/151
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
G3 Z2.531 I-1.03 J-.648 P1  F30000
G1 X136.898 Y120.102 Z2.531
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F2058
G1 X136.898 Y135.898 E.52398
G1 X121.102 Y135.898 E.52398
G1 X121.102 Y120.102 E.52398
G1 X136.838 Y120.102 E.52199
G1 X137.29 Y119.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2058
G1 X137.29 Y136.29 E.50946
G1 X120.71 Y136.29 E.50946
G1 X120.71 Y119.71 E.50946
G1 X137.23 Y119.71 E.50761
M204 S10000
; WIPE_START
G1 F24000
G1 X137.237 Y121.71 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I-.086 J-1.214 P1  F30000
G1 X121.45 Y122.826 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2058
G1 X121.45 Y121.198 E.05401
G1 X122.198 Y120.45 E.03506
G1 X122.45 Y120.45 E.00838
G1 X136.55 Y134.55 E.66143
G1 X136.55 Y129.126 E.1799
G1 X130.126 Y135.55 E.30133
G1 X129.874 Y135.55 E.00838
G1 X121.45 Y127.126 E.39516
G1 X121.45 Y128.874 E.05796
G1 X129.874 Y120.45 E.39516
G1 X130.126 Y120.45 E.00838
G1 X136.55 Y126.874 E.30133
G1 X136.55 Y121.45 E.1799
G1 X122.45 Y135.55 E.66143
G1 X122.198 Y135.55 E.00838
G1 X121.45 Y134.802 E.03506
G1 X121.45 Y133.174 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 2.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X121.45 Y134.802 E-.61876
G1 X121.713 Y135.065 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 19/151
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
G3 Z2.6 I.854 J.867 P1  F30000
G1 X136.898 Y120.102 Z2.6
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1780
G1 X136.898 Y135.898 E.52398
G1 X121.102 Y135.898 E.52398
G1 X121.102 Y120.102 E.52398
G1 X136.838 Y120.102 E.52199
G1 X137.29 Y119.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1780
G1 X137.29 Y136.29 E.50946
G1 X120.71 Y136.29 E.50946
G1 X120.71 Y119.71 E.50946
G1 X137.23 Y119.71 E.50761
M204 S10000
; WIPE_START
G1 F24000
G1 X137.237 Y121.71 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I-.086 J-1.214 P1  F30000
G1 X121.45 Y122.826 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
M73 P39 R12
G1 F1780
G1 X121.45 Y121.198 E.05401
G1 X122.198 Y120.45 E.03506
G1 X122.45 Y120.45 E.00838
G1 X136.55 Y134.55 E.66143
G1 X136.55 Y129.126 E.1799
G1 X130.126 Y135.55 E.30133
G1 X129.874 Y135.55 E.00838
G1 X121.45 Y127.126 E.39516
G1 X121.45 Y128.874 E.05796
G1 X129.874 Y120.45 E.39516
G1 X130.126 Y120.45 E.00838
G1 X136.55 Y126.874 E.30133
G1 X136.55 Y121.45 E.1799
G1 X122.45 Y135.55 E.66143
G1 X122.198 Y135.55 E.00838
G1 X121.45 Y134.802 E.03506
G1 X121.45 Y133.174 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 2.4069
; LAYER_HEIGHT: 0.0068965
; WIPE_START
G1 F24000
G1 X121.45 Y134.802 E-.61876
G1 X121.713 Y135.065 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 20/151
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
G3 Z2.8 I1.013 J.674 P1  F30000
G1 X132.631 Y118.646 Z2.8
G1 Z2.407
G1 E.8 F1800
; FEATURE: Support interface
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.2
G1 F2200
G1 X132.631 Y118.911 E.00817
G1 X133.508 Y118.911 E.02695
G1 X133.508 Y117.742 E.03592
G3 X133.618 Y117.689 I.483 J.845 E.00376
G1 X134.385 Y117.689 E.02358
G1 X134.385 Y118.911 E.03758
G1 X135.262 Y118.911 E.02695
G1 X135.262 Y117.689 E.03758
G1 X136.14 Y117.689 E.02695
G1 X136.14 Y118.911 E.03758
G1 X137.017 Y118.911 E.02695
G1 X137.017 Y117.689 E.03758
G1 X137.311 Y117.689 E.00906
G1 X137.311 Y118.911 E.03758
G1 X137.205 Y118.911 E.00327
G1 X137.68 Y118.911 F30000
; FEATURE: Support
; LAYER_HEIGHT: 0.275862
G1 F2200
G1 X137.68 Y117.846 E.04321
G1 X137.743 Y117.889 E.00308
G3 X138.573 Y119.32 I-1.239 J1.674 E.06898
G1 X138.08 Y119.32 E.01997
G2 X137.726 Y118.9 I-.262 J-.138 E.02848
G1 X138.089 Y119.689 F30000
; FEATURE: Support interface
; LAYER_HEIGHT: 0.2
G1 F2200
G1 X138.572 Y119.689 E.01485
G3 X138.089 Y120.864 I-2.036 J-.15 E.03972
G1 X138.089 Y119.745 E.03439
; WIPE_START
G1 F24000
G1 X138.089 Y120.864 E-.42534
G1 X138.435 Y120.291 E-.2544
G1 X138.482 Y120.085 E-.08026
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.807 I.971 J-.734 P1  F30000
G1 X136.392 Y117.32 Z2.807
G1 Z2.407
G1 E.8 F1800
; FEATURE: Support
; LAYER_HEIGHT: 0.275862
G1 F2200
G1 X134.377 Y117.32 E.08168
G1 X134.394 Y117.247 E.00301
G3 X135.5 Y113.339 I1.02 J-1.822 E.22629
G3 X136.369 Y117.245 I-.183 J2.09 E.21519
G1 X136.375 Y117.262 E.00073
; WIPE_START
G1 F24000
G1 X134.377 Y117.32 E-.75927
G1 X134.378 Y117.318 E-.00073
; WIPE_END
M73 P40 R12
G1 E-.04 F1800
G17
G3 Z2.807 I.212 J-1.198 P1  F30000
G1 X125.223 Y115.7 Z2.807
G1 Z2.407
G1 E.8 F1800
G1 F2200
G3 X124.076 Y117.32 I-2.078 J-.255 E.08384
G1 X122.318 Y117.32 E.07131
G3 X123.325 Y113.358 I.926 J-1.873 E.2306
G3 X125.229 Y115.641 I-.181 J2.086 E.13401
; CHANGE_LAYER
; Z_HEIGHT: 2.6
; LAYER_HEIGHT: 0.193103
; WIPE_START
G1 F24000
G1 X125.046 Y116.327 E-.26998
G1 X124.686 Y116.866 E-.24643
G1 X124.171 Y117.249 E-.24359
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 21/151
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
G3 Z2.807 I-.266 J1.187 P1  F30000
G1 X136.898 Y120.102 Z2.807
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F2200
G1 X136.898 Y135.898 E.52398
G1 X121.102 Y135.898 E.52398
G1 X121.102 Y120.102 E.52398
G1 X136.838 Y120.102 E.52199
G1 X137.29 Y119.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2200
G1 X137.29 Y136.29 E.50946
G1 X120.71 Y136.29 E.50946
G1 X120.71 Y119.71 E.50946
G1 X137.23 Y119.71 E.50761
M204 S10000
; WIPE_START
G1 F24000
G1 X137.237 Y121.71 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I-.086 J-1.214 P1  F30000
G1 X121.45 Y122.826 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2200
G1 X121.45 Y121.198 E.05401
G1 X122.198 Y120.45 E.03506
G1 X122.45 Y120.45 E.00838
G1 X136.55 Y134.55 E.66143
G1 X136.55 Y129.126 E.1799
G1 X130.126 Y135.55 E.30133
G1 X129.874 Y135.55 E.00838
G1 X121.45 Y127.126 E.39516
G1 X121.45 Y128.874 E.05796
G1 X129.874 Y120.45 E.39516
G1 X130.126 Y120.45 E.00838
G1 X136.55 Y126.874 E.30133
G1 X136.55 Y121.45 E.1799
G1 X122.45 Y135.55 E.66143
G1 X122.198 Y135.55 E.00838
G1 X121.45 Y134.802 E.03506
G1 X121.45 Y133.174 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 2.68276
; LAYER_HEIGHT: 0.0827587
; WIPE_START
G1 F24000
G1 X121.45 Y134.802 E-.61876
G1 X121.713 Y135.065 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 22/151
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
G3 Z3 I1.013 J.675 P1  F30000
G1 X132.908 Y118.26 Z3
G1 Z2.683
G1 E.8 F1800
; FEATURE: Support interface
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.2
G1 F2198
G2 X132.631 Y118.911 I.658 J.664 E.02231
G1 X133.508 Y118.911 E.02695
G1 X133.508 Y117.769 E.03509
G3 X133.679 Y117.689 I.728 J1.314 E.0058
G1 X134.385 Y117.689 E.02171
G1 X134.385 Y118.911 E.03758
G1 X135.262 Y118.911 E.02695
G1 X135.262 Y117.689 E.03758
G1 X136.14 Y117.689 E.02695
G1 X136.14 Y118.911 E.03758
G1 X137.017 Y118.911 E.02695
G1 X137.017 Y117.689 E.03758
G1 X137.311 Y117.689 E.00906
G1 X137.311 Y118.911 E.03758
G1 X137.205 Y118.911 E.00327
G1 X137.68 Y118.911 F30000
; FEATURE: Support
; LAYER_HEIGHT: 0.275862
G1 F2198
G1 X137.68 Y117.875 E.04203
G1 X137.729 Y117.908 E.00239
G3 X138.549 Y119.32 I-1.225 J1.655 E.06806
G1 X138.08 Y119.32 E.01899
G2 X137.726 Y118.9 I-.262 J-.138 E.02848
G1 X138.089 Y119.689 F30000
; FEATURE: Support interface
; LAYER_HEIGHT: 0.2
G1 F2198
G1 X138.548 Y119.689 E.01411
G3 X138.089 Y120.828 I-2.019 J-.151 E.03835
G1 X138.089 Y119.745 E.03327
; WIPE_START
G1 F24000
G1 X138.089 Y120.828 E-.41148
G1 X138.412 Y120.282 E-.24101
G1 X138.475 Y120.007 E-.10751
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.083 I.971 J-.734 P1  F30000
G1 X136.443 Y117.32 Z3.083
G1 Z2.683
G1 E.8 F1800
; FEATURE: Support
; LAYER_HEIGHT: 0.275862
G1 F2198
G1 X134.341 Y117.287 E.08527
G3 X135.499 Y113.46 I1.078 J-1.763 E.22052
G3 X136.492 Y117.287 I-.204 J2.095 E.20827
; WIPE_START
G1 F24000
G1 X134.492 Y117.287 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.083 I.209 J-1.199 P1  F30000
G1 X125.214 Y115.666 Z3.083
G1 Z2.683
G1 E.8 F1800
G1 F2198
G3 X124.207 Y117.319 I-2.064 J-.124 E.08169
G1 X122.187 Y117.32 E.08189
G3 X123.324 Y113.481 I1.052 J-1.776 E.22164
G3 X125.216 Y115.607 I-.174 J2.061 E.12729
; CHANGE_LAYER
; Z_HEIGHT: 2.8
; LAYER_HEIGHT: 0.117241
; WIPE_START
G1 F24000
G1 X125.074 Y116.296 E-.26737
G1 X124.752 Y116.851 E-.24383
G1 X124.255 Y117.278 E-.24881
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 23/151
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
G3 Z3.083 I-.265 J1.188 P1  F30000
G1 X136.898 Y120.102 Z3.083
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F2198
G1 X136.898 Y135.898 E.52398
G1 X121.102 Y135.898 E.52398
G1 X121.102 Y120.102 E.52398
G1 X136.838 Y120.102 E.52199
G1 X137.29 Y119.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2198
G1 X137.29 Y136.29 E.50946
G1 X120.71 Y136.29 E.50946
G1 X120.71 Y119.71 E.50946
G1 X137.23 Y119.71 E.50761
M204 S10000
; WIPE_START
G1 F24000
G1 X137.237 Y121.71 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I-.086 J-1.214 P1  F30000
G1 X121.45 Y122.826 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2198
G1 X121.45 Y121.198 E.05401
G1 X122.198 Y120.45 E.03506
G1 X122.45 Y120.45 E.00838
G1 X136.55 Y134.55 E.66143
G1 X136.55 Y129.126 E.1799
G1 X130.126 Y135.55 E.30133
G1 X129.874 Y135.55 E.00838
G1 X121.45 Y127.126 E.39516
G1 X121.45 Y128.874 E.05796
G1 X129.874 Y120.45 E.39516
G1 X130.126 Y120.45 E.00838
G1 X136.55 Y126.874 E.30133
G1 X136.55 Y121.45 E.1799
G1 X122.45 Y135.55 E.66143
G1 X122.198 Y135.55 E.00838
G1 X121.45 Y134.802 E.03506
G1 X121.45 Y133.174 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 2.95862
; LAYER_HEIGHT: 0.158621
; WIPE_START
G1 F24000
G1 X121.45 Y134.802 E-.61876
G1 X121.713 Y135.065 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 24/151
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
G3 Z3.2 I1.213 J.103 P1  F30000
G1 X123.197 Y117.668 Z3.2
G1 Z2.959
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.275862
G1 F2113
G3 X123.197 Y113.599 I-.002 J-2.034 E.25935
G1 X123.322 Y113.603 E.00508
G3 X123.256 Y117.667 I-.127 J2.03 E.25151
; WIPE_START
G1 F24000
G1 X122.348 Y117.476 E-.35236
G1 X121.743 Y117.028 E-.28598
G1 X121.574 Y116.756 E-.12166
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.359 I-.235 J1.194 P1  F30000
G1 X132.562 Y118.92 Z3.359
G1 Z2.959
M73 P41 R12
G1 E.8 F1800
G1 F2113
G3 X134.235 Y117.558 I1.914 J.643 E.09227
G1 X134.295 Y117.33 E.00957
M73 P41 R11
G3 X135.498 Y113.58 I1.121 J-1.708 E.21552
G3 X136.483 Y117.305 I-.173 J2.039 E.20373
G1 X136.552 Y117.54 E.0099
G3 X138.08 Y120.813 I-.018 J2.002 E.18265
G1 X138.08 Y119.025 E.07249
G1 X137.975 Y118.92 E.00606
G1 X132.622 Y118.92 E.21706
; CHANGE_LAYER
; Z_HEIGHT: 3
; LAYER_HEIGHT: 0.0413792
; WIPE_START
G1 F24000
G1 X132.844 Y118.369 E-.22548
G1 X133.186 Y118.004 E-.19008
G1 X133.723 Y117.687 E-.23724
G1 X133.997 Y117.618 E-.10721
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 25/151
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
G3 Z3.359 I-.792 J.924 P1  F30000
G1 X136.898 Y120.102 Z3.359
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F2113
G1 X136.898 Y135.898 E.52398
G1 X121.102 Y135.898 E.52398
G1 X121.102 Y120.102 E.52398
G1 X136.838 Y120.102 E.52199
G1 X137.29 Y119.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2113
G1 X137.29 Y136.29 E.50946
G1 X120.71 Y136.29 E.50946
G1 X120.71 Y119.71 E.50946
G1 X137.23 Y119.71 E.50761
M204 S10000
; WIPE_START
G1 F24000
G1 X137.237 Y121.71 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.086 J-1.214 P1  F30000
G1 X121.45 Y122.826 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2113
G1 X121.45 Y121.198 E.05401
G1 X122.198 Y120.45 E.03506
G1 X122.45 Y120.45 E.00838
G1 X136.55 Y134.55 E.66143
G1 X136.55 Y129.126 E.1799
G1 X130.126 Y135.55 E.30133
G1 X129.874 Y135.55 E.00838
G1 X121.45 Y127.126 E.39516
G1 X121.45 Y128.874 E.05796
G1 X129.874 Y120.45 E.39516
G1 X130.126 Y120.45 E.00838
G1 X136.55 Y126.874 E.30133
G1 X136.55 Y121.45 E.1799
G1 X122.45 Y135.55 E.66143
G1 X122.198 Y135.55 E.00838
G1 X121.45 Y134.802 E.03506
G1 X121.45 Y133.174 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 3.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X121.45 Y134.802 E-.61876
G1 X121.713 Y135.065 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 26/151
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
G3 Z3.4 I.854 J.867 P1  F30000
G1 X136.898 Y120.102 Z3.4
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1884
G1 X136.898 Y135.798 E.52066
G1 X121.102 Y135.798 E.52398
G1 X121.102 Y120.102 E.52066
G1 X136.838 Y120.102 E.52199
G1 X137.29 Y119.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1884
G1 X137.29 Y136.19 E.50638
G1 X120.71 Y136.19 E.50946
G1 X120.71 Y119.71 E.50638
G1 X137.23 Y119.71 E.50761
M204 S10000
; WIPE_START
G1 F24000
G1 X137.237 Y121.71 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I-.086 J-1.214 P1  F30000
G1 X121.45 Y122.826 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1884
G1 X121.45 Y121.198 E.05401
G1 X122.198 Y120.45 E.03506
G1 X122.45 Y120.45 E.00838
G1 X136.55 Y134.55 E.66143
G1 X136.55 Y129.126 E.1799
G1 X130.745 Y134.931 E.2723
G1 X129.255 Y134.931 E.04943
G1 X121.45 Y127.126 E.36613
G1 X121.45 Y128.874 E.05796
G1 X129.874 Y120.45 E.39516
G1 X130.126 Y120.45 E.00838
G1 X136.55 Y126.874 E.30133
G1 X136.55 Y121.45 E.1799
G1 X123.069 Y134.931 E.6324
M73 P42 R11
G1 X121.579 Y134.931 E.04943
G1 X121.45 Y134.802 E.00603
G1 X121.45 Y133.174 E.05401
G1 X121.54 Y135.364 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502898
G1 F1884
G1 X136.4 Y135.364 E.55702
; CHANGE_LAYER
; Z_HEIGHT: 3.23448
; LAYER_HEIGHT: 0.0344827
; WIPE_START
G1 F24000
G1 X134.4 Y135.364 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 27/151
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
G3 Z3.6 I1.18 J.298 P1  F30000
G1 X138.08 Y120.774 Z3.6
G1 Z3.234
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.275862
G1 F2198
G1 X138.08 Y119.025 E.0709
G1 X137.975 Y118.92 E.00606
G1 X132.588 Y118.92 E.21845
G3 X134.201 Y117.58 I1.893 J.639 E.08951
G1 X134.252 Y117.358 E.00924
G3 X135.497 Y113.698 I1.161 J-1.647 E.2099
G3 X136.527 Y117.334 I-.169 J2.011 E.19826
G1 X136.596 Y117.568 E.0099
G3 X138.117 Y120.726 I-.058 J1.974 E.17494
; WIPE_START
G1 F24000
G1 X138.08 Y119.025 E-.64656
G1 X137.975 Y118.92 E-.05679
G1 X137.826 Y118.92 E-.05665
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.634 I.228 J-1.195 P1  F30000
G1 X125.057 Y116.482 Z3.634
G1 Z3.234
G1 E.8 F1800
G1 F2198
G3 X123.197 Y113.719 I-1.863 J-.753 E.3528
G1 X123.32 Y113.723 E.00501
G3 X125.079 Y116.427 I-.126 J2.005 E.1518
; CHANGE_LAYER
; Z_HEIGHT: 3.4
; LAYER_HEIGHT: 0.165517
; WIPE_START
G1 F24000
G1 X124.632 Y117.106 E-.30887
G1 X124.035 Y117.548 E-.28253
G1 X123.602 Y117.647 E-.1686
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 28/151
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
G3 Z3.634 I-.221 J1.197 P1  F30000
G1 X136.898 Y120.102 Z3.634
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F2198
G1 X136.898 Y135.598 E.51403
G1 X121.102 Y135.598 E.52398
G1 X121.102 Y120.102 E.51403
G1 X136.838 Y120.102 E.52199
G1 X137.29 Y119.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2198
G1 X137.29 Y135.99 E.50024
G1 X120.71 Y135.99 E.50946
G1 X120.71 Y119.71 E.50024
G1 X137.23 Y119.71 E.50761
M204 S10000
; WIPE_START
G1 F24000
G1 X137.237 Y121.71 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I-1.215 J-.07 P1  F30000
G1 X136.46 Y135.164 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502896
G1 F2198
G1 X121.6 Y135.164 E.55701
G1 X121.641 Y134.731 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2198
G1 X123.269 Y134.731 E.05401
G1 X136.55 Y121.45 E.62302
G1 X136.55 Y126.874 E.1799
G1 X130.126 Y120.45 E.30133
G1 X129.874 Y120.45 E.00838
G1 X121.45 Y128.874 E.39516
G1 X121.45 Y127.126 E.05796
G1 X129.055 Y134.731 E.35675
G1 X130.945 Y134.731 E.0627
G1 X136.55 Y129.126 E.26292
G1 X136.55 Y134.55 E.1799
G1 X122.45 Y120.45 E.66143
G1 X122.198 Y120.45 E.00838
G1 X121.45 Y121.198 E.03506
G1 X121.45 Y122.826 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 3.51034
; LAYER_HEIGHT: 0.110345
; WIPE_START
G1 F24000
G1 X121.45 Y121.198 E-.61876
G1 X121.713 Y120.935 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 29/151
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
G3 Z3.8 I1.187 J.27 P1  F30000
G1 X122.462 Y117.641 Z3.8
G1 Z3.51
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.275862
G1 F2169
G1 X122.365 Y117.626 E.00398
G3 X123.196 Y113.838 I.829 J-1.803 E.21825
G1 X123.318 Y113.842 E.00495
G3 X123.196 Y117.807 I-.124 J1.981 E.2477
G1 X122.521 Y117.654 E.02807
; WIPE_START
G1 F24000
G1 X122.365 Y117.626 E-.06008
G1 X121.778 Y117.183 E-.27954
M73 P43 R11
G1 X121.386 Y116.555 E-.28133
G1 X121.319 Y116.195 E-.13904
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.91 I-.285 J1.183 P1  F30000
G1 X132.614 Y118.92 Z3.91
G1 Z3.51
G1 E.8 F1800
G1 F2169
G3 X134.162 Y117.614 I1.858 J.632 E.08631
G1 X134.218 Y117.401 E.00892
G3 X135.496 Y113.816 I1.201 J-1.592 E.20498
G3 X136.563 Y117.372 I-.172 J1.99 E.19327
G1 X136.637 Y117.596 E.00957
G3 X138.08 Y120.734 I-.097 J1.946 E.17219
G1 X138.08 Y119.025 E.0693
G1 X137.975 Y118.92 E.00606
G1 X132.674 Y118.92 E.21498
; CHANGE_LAYER
; Z_HEIGHT: 3.6
; LAYER_HEIGHT: 0.0896552
; WIPE_START
G1 F24000
G1 X132.883 Y118.397 E-.21374
G1 X133.217 Y118.042 E-.18548
G1 X133.629 Y117.78 E-.18548
G1 X134.069 Y117.643 E-.1753
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 30/151
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
G3 Z3.91 I-.798 J.918 P1  F30000
G1 X136.898 Y120.102 Z3.91
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F2169
G1 X136.898 Y135.398 E.50739
G1 X121.102 Y135.398 E.52398
G1 X121.102 Y120.102 E.50739
G1 X136.838 Y120.102 E.52199
G1 X137.29 Y119.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2169
G1 X137.29 Y135.79 E.49409
G1 X120.71 Y135.79 E.50946
G1 X120.71 Y119.71 E.49409
G1 X137.23 Y119.71 E.50761
M204 S10000
; WIPE_START
G1 F24000
G1 X137.237 Y121.71 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I.841 J-.879 P1  F30000
G1 X135.921 Y120.45 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2169
G1 X136.55 Y120.45 E.02084
G1 X136.55 Y121.45 E.03317
G1 X123.469 Y134.531 E.61363
G1 X128.855 Y134.531 E.17866
G1 X121.45 Y127.126 E.34736
G1 X121.45 Y128.874 E.05796
G1 X129.874 Y120.45 E.39516
G1 X130.126 Y120.45 E.00838
G1 X136.55 Y126.874 E.30133
G1 X136.55 Y129.126 E.07472
G1 X131.145 Y134.531 E.25354
G1 X136.531 Y134.531 E.17866
G1 X122.45 Y120.45 E.66055
G1 X122.198 Y120.45 E.00838
G1 X121.45 Y121.198 E.03506
G1 X121.45 Y122.826 E.05401
G1 X136.46 Y134.964 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502896
G1 F2169
G1 X121.6 Y134.964 E.55701
; CHANGE_LAYER
; Z_HEIGHT: 3.78621
; LAYER_HEIGHT: 0.186207
; WIPE_START
G1 F24000
G1 X123.6 Y134.964 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 31/151
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
G3 Z4 I1.217 J-.029 P1  F30000
G1 X123.196 Y117.874 Z4
G1 Z3.786
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.275862
G1 F2611
G3 X123.196 Y113.955 I-.002 J-1.96 E.24981
G1 X123.317 Y113.959 E.00489
G3 X123.255 Y117.873 I-.123 J1.956 E.2422
; WIPE_START
G1 F24000
G1 X122.378 Y117.689 E-.34036
G1 X121.795 Y117.258 E-.27554
G1 X121.594 Y116.936 E-.14409
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.186 I-.215 J1.198 P1  F30000
G1 X132.639 Y118.92 Z4.186
G1 Z3.786
G1 E.8 F1800
G1 F2611
G3 X134.133 Y117.645 I1.827 J.628 E.08354
G1 X134.189 Y117.432 E.00892
G3 X135.495 Y113.931 I1.227 J-1.536 E.19995
G3 X136.601 Y117.397 I-.168 J1.963 E.188
G1 X136.665 Y117.615 E.00924
G3 X138.08 Y120.695 I-.137 J1.928 E.16757
G1 X138.08 Y119.025 E.0677
G1 X137.975 Y118.92 E.00606
G1 X132.699 Y118.92 E.21394
; CHANGE_LAYER
; Z_HEIGHT: 3.8
; LAYER_HEIGHT: 0.013793
; WIPE_START
G1 F24000
G1 X132.902 Y118.412 E-.20787
G1 X133.232 Y118.06 E-.18318
G1 X133.639 Y117.802 E-.18317
M73 P44 R11
G1 X134.105 Y117.654 E-.18578
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 32/151
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
G3 Z4.186 I-.802 J.915 P1  F30000
G1 X136.898 Y120.102 Z4.186
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F2611
G1 X136.898 Y135.198 E.50076
G1 X121.102 Y135.198 E.52398
G1 X121.102 Y120.102 E.50076
G1 X136.838 Y120.102 E.52199
G1 X137.29 Y119.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2611
G1 X137.29 Y135.59 E.48795
G1 X120.71 Y135.59 E.50946
G1 X120.71 Y119.71 E.48795
G1 X137.23 Y119.71 E.50761
M204 S10000
; WIPE_START
G1 F24000
G1 X137.238 Y121.71 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I-.209 J-1.199 P1  F30000
G1 X131.127 Y122.773 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2611
G1 X131.744 Y123.414 E.02952
G1 X131.744 Y129.256 E.19377
G1 X136.55 Y129.256 E.15941
G1 X136.55 Y134.05 E.15902
G1 X121.45 Y134.05 E.50087
G1 X121.45 Y129.256 E.15902
G1 X123.256 Y129.256 E.05989
G1 X123.273 Y123.373 E.19515
G1 X123.914 Y122.756 E.02952
G1 X131.071 Y122.756 E.23739
G1 X131.337 Y125.035 F30000
G1 F2611
G1 X131.337 Y126.663 E.05401
G1 X124.357 Y133.643 E.32743
G1 X127.967 Y133.643 E.11972
G1 X123.663 Y129.339 E.2019
G1 X123.663 Y126.661 E.08882
G1 X127.161 Y123.163 E.16411
G1 X125.163 Y123.163 E.06629
G1 X131.337 Y129.337 E.28965
G1 X131.337 Y129.663 E.0108
G1 X131.663 Y129.663 E.0108
G1 X135.643 Y133.643 E.1867
G1 X132.033 Y133.643 E.11972
G1 X136.013 Y129.663 E.1867
G1 X136.143 Y129.663 E.00429
G1 X136.143 Y131.162 E.04972
G1 X132.151 Y127.477 F30000
G1 F2611
G1 X132.151 Y125.849 E.05401
G1 X136.55 Y121.45 E.20634
G1 X136.55 Y126.874 E.1799
G1 X130.126 Y120.45 E.30133
G1 X129.874 Y120.45 E.00838
G1 X127.975 Y122.349 E.08906
G1 X124.349 Y122.349 E.1203
G1 X122.45 Y120.45 E.08906
G1 X122.198 Y120.45 E.00838
G1 X121.45 Y121.198 E.03506
G1 X121.45 Y127.126 E.19666
G1 X122.849 Y128.525 E.0656
G1 X122.849 Y127.475 E.03481
G1 X121.45 Y128.849 E.06502
G1 X121.45 Y127.33 E.05038
G1 X121.54 Y134.764 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502898
G1 F2611
G1 X136.4 Y134.764 E.55702
; CHANGE_LAYER
; Z_HEIGHT: 4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X134.4 Y134.764 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 33/151
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
G3 Z4.2 I1.2 J.204 P1  F30000
G1 X136.898 Y120.102 Z4.2
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2276
G1 X136.898 Y134.998 E.49412
G1 X121.102 Y134.998 E.52398
G1 X121.102 Y120.102 E.49412
G1 X136.838 Y120.102 E.52199
G1 X137.29 Y119.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2276
G1 X137.29 Y135.39 E.4818
G1 X120.71 Y135.39 E.50946
G1 X120.71 Y119.71 E.4818
G1 X137.23 Y119.71 E.50761
M204 S10000
; WIPE_START
G1 F24000
G1 X137.238 Y121.71 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I-.209 J-1.199 P1  F30000
G1 X131.127 Y122.773 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2276
G1 X131.744 Y123.414 E.02952
G1 X131.744 Y129.256 E.19377
G1 X136.55 Y129.256 E.15941
G1 X136.55 Y134.05 E.15902
G1 X121.45 Y134.05 E.50087
G1 X121.45 Y129.256 E.15902
G1 X123.256 Y129.256 E.05989
G1 X123.273 Y123.373 E.19515
G1 X123.914 Y122.756 E.02952
G1 X131.071 Y122.756 E.23739
G1 X131.337 Y125.035 F30000
G1 F2276
G1 X131.337 Y126.663 E.05401
G1 X124.357 Y133.643 E.32743
G1 X127.967 Y133.643 E.11972
G1 X123.663 Y129.339 E.2019
G1 X123.663 Y126.661 E.08882
G1 X127.161 Y123.163 E.16411
G1 X125.163 Y123.163 E.06629
G1 X131.337 Y129.337 E.28965
G1 X131.337 Y129.663 E.0108
G1 X131.663 Y129.663 E.0108
G1 X135.643 Y133.643 E.1867
G1 X132.033 Y133.643 E.11972
G1 X136.013 Y129.663 E.1867
G1 X136.143 Y129.663 E.00429
G1 X136.143 Y131.162 E.04972
G1 X132.151 Y127.477 F30000
G1 F2276
G1 X132.151 Y125.849 E.05401
G1 X136.55 Y121.45 E.20634
M73 P45 R11
G1 X136.55 Y126.874 E.1799
G1 X130.126 Y120.45 E.30133
G1 X129.874 Y120.45 E.00838
G1 X127.975 Y122.349 E.08906
G1 X124.349 Y122.349 E.1203
G1 X122.45 Y120.45 E.08906
G1 X122.198 Y120.45 E.00838
G1 X121.45 Y121.198 E.03506
G1 X121.45 Y127.126 E.19666
G1 X122.849 Y128.525 E.0656
G1 X122.849 Y127.475 E.03481
G1 X121.45 Y128.849 E.06502
G1 X121.45 Y127.33 E.05038
G1 X121.54 Y134.564 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502898
G1 F2276
G1 X136.4 Y134.564 E.55702
; CHANGE_LAYER
; Z_HEIGHT: 4.06207
; LAYER_HEIGHT: 0.0620689
; WIPE_START
G1 F24000
G1 X134.4 Y134.564 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 34/151
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
G3 Z4.4 I1.176 J.311 P1  F30000
G1 X138.08 Y120.655 Z4.4
G1 Z4.062
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.275862
G1 F2588
G1 X138.08 Y119.025 E.06609
G1 X137.975 Y118.92 E.00606
G1 X132.665 Y118.92 E.21533
G3 X134.106 Y117.676 I1.797 J.625 E.08084
G1 X134.161 Y117.463 E.00892
G3 X135.494 Y114.045 I1.253 J-1.48 E.19504
G3 X136.627 Y117.436 I-.162 J1.939 E.1838
G1 X136.696 Y117.645 E.00892
G3 X138.114 Y120.606 I-.161 J1.897 E.16056
; WIPE_START
G1 F24000
G1 X138.08 Y119.025 E-.60088
G1 X137.975 Y118.92 E-.05679
G1 X137.705 Y118.92 E-.10233
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.462 I.207 J-1.199 P1  F30000
G1 X124.987 Y116.729 Z4.462
G1 Z4.062
G1 E.8 F1800
G1 F2588
G3 X123.196 Y114.07 I-1.794 J-.724 E.33965
G1 X123.315 Y114.074 E.00483
G3 X125.009 Y116.674 I-.121 J1.931 E.14604
; CHANGE_LAYER
; Z_HEIGHT: 4.2
; LAYER_HEIGHT: 0.137931
; WIPE_START
G1 F24000
G1 X124.579 Y117.331 E-.2982
G1 X124.003 Y117.756 E-.2721
G1 X123.516 Y117.867 E-.1897
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 35/151
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
G3 Z4.462 I-.2 J1.2 P1  F30000
G1 X136.898 Y120.102 Z4.462
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F2588
G1 X136.898 Y134.798 E.48749
G1 X121.102 Y134.798 E.52398
G1 X121.102 Y120.102 E.48749
G1 X136.838 Y120.102 E.52199
G1 X137.29 Y119.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2588
G1 X137.29 Y135.19 E.47566
G1 X120.71 Y135.19 E.50946
G1 X120.71 Y119.71 E.47566
G1 X137.23 Y119.71 E.50761
M204 S10000
; WIPE_START
G1 F24000
G1 X137.238 Y121.71 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I-.209 J-1.199 P1  F30000
G1 X131.127 Y122.773 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2588
G1 X131.744 Y123.414 E.02952
G1 X131.744 Y129.256 E.19377
G1 X136.55 Y129.256 E.15941
G1 X136.55 Y133.931 E.15508
G1 X121.45 Y133.931 E.50087
G1 X121.45 Y129.256 E.15508
G1 X123.256 Y129.256 E.05989
G1 X123.273 Y123.373 E.19515
G1 X123.914 Y122.756 E.02952
G1 X131.071 Y122.756 E.23739
G1 X131.337 Y125.035 F30000
G1 F2588
G1 X131.337 Y126.663 E.05401
G1 X124.476 Y133.524 E.32186
G1 X127.848 Y133.524 E.11184
G1 X123.663 Y129.339 E.19633
G1 X123.663 Y126.661 E.08882
G1 X127.161 Y123.163 E.16411
G1 X125.163 Y123.163 E.06629
G1 X131.337 Y129.337 E.28965
G1 X131.337 Y129.663 E.0108
G1 X131.663 Y129.663 E.0108
G1 X135.524 Y133.524 E.18112
G1 X132.152 Y133.524 E.11184
G1 X136.013 Y129.663 E.18112
G1 X136.143 Y129.663 E.00429
G1 X136.143 Y131.162 E.04972
G1 X132.151 Y127.477 F30000
G1 F2588
G1 X132.151 Y125.849 E.05401
G1 X136.55 Y121.45 E.20634
G1 X136.55 Y126.874 E.1799
G1 X130.126 Y120.45 E.30133
G1 X129.874 Y120.45 E.00838
G1 X127.975 Y122.349 E.08906
G1 X124.349 Y122.349 E.1203
G1 X122.45 Y120.45 E.08906
G1 X122.198 Y120.45 E.00838
G1 X121.45 Y121.198 E.03506
G1 X121.45 Y127.126 E.19666
G1 X122.849 Y128.525 E.0656
G1 X122.849 Y127.475 E.03481
G1 X121.45 Y128.849 E.06502
M73 P46 R10
G1 X121.45 Y127.33 E.05038
G1 X121.54 Y134.364 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502898
G1 F2588
G1 X136.4 Y134.364 E.55702
; CHANGE_LAYER
; Z_HEIGHT: 4.33793
; LAYER_HEIGHT: 0.137931
; WIPE_START
G1 F24000
G1 X134.4 Y134.364 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 36/151
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
G3 Z4.6 I1.176 J.315 P1  F30000
G1 X138.08 Y120.612 Z4.6
G1 Z4.338
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.275862
G1 F2558
G1 X138.08 Y119.025 E.06435
G1 X137.975 Y118.92 E.00606
G1 X132.69 Y118.92 E.21429
G3 X134.086 Y117.699 I1.803 J.653 E.0785
G2 X133.933 Y117.281 I-.326 J-.117 E.01958
G3 X135.493 Y114.157 I1.475 J-1.215 E.17859
G3 X136.652 Y117.464 I-.158 J1.911 E.17912
G1 X136.72 Y117.673 E.00892
G3 X138.114 Y120.563 I-.183 J1.869 E.15596
; WIPE_START
G1 F24000
G1 X138.08 Y119.025 E-.58432
G1 X137.975 Y118.92 E-.05679
G1 X137.662 Y118.92 E-.11889
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.738 I.2 J-1.2 P1  F30000
G1 X124.964 Y116.807 Z4.738
G1 Z4.338
G1 E.8 F1800
G1 F2558
G3 X123.195 Y114.183 I-1.771 J-.715 E.33525
G1 X123.313 Y114.187 E.00477
G3 X124.985 Y116.752 I-.12 J1.906 E.14411
; CHANGE_LAYER
; Z_HEIGHT: 4.4
; LAYER_HEIGHT: 0.0620689
; WIPE_START
G1 F24000
G1 X124.561 Y117.401 E-.29461
G1 X123.992 Y117.821 E-.26863
G1 X123.487 Y117.936 E-.19676
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 37/151
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
G3 Z4.738 I-.194 J1.201 P1  F30000
G1 X136.898 Y120.102 Z4.738
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F2558
G1 X136.898 Y134.598 E.48085
G1 X121.102 Y134.598 E.52398
G1 X121.102 Y120.102 E.48085
G1 X136.838 Y120.102 E.52199
G1 X137.29 Y119.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2558
G1 X137.29 Y134.99 E.46951
G1 X120.71 Y134.99 E.50946
G1 X120.71 Y119.71 E.46951
G1 X137.23 Y119.71 E.50761
M204 S10000
; WIPE_START
G1 F24000
G1 X137.238 Y121.71 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I-.209 J-1.199 P1  F30000
G1 X131.127 Y122.773 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2558
G1 X131.744 Y123.414 E.02952
G1 X131.744 Y129.256 E.19377
G1 X136.55 Y129.256 E.15941
G1 X136.55 Y133.731 E.14845
G1 X121.45 Y133.731 E.50087
G1 X121.45 Y129.256 E.14845
G1 X123.256 Y129.256 E.05989
G1 X123.273 Y123.373 E.19515
G1 X123.914 Y122.756 E.02952
G1 X131.071 Y122.756 E.23739
G1 X131.337 Y125.035 F30000
G1 F2558
G1 X131.337 Y126.663 E.05401
G1 X124.676 Y133.324 E.31248
G1 X127.648 Y133.324 E.09857
G1 X123.663 Y129.339 E.18694
G1 X123.663 Y126.661 E.08882
G1 X127.161 Y123.163 E.16411
G1 X125.163 Y123.163 E.06629
G1 X131.337 Y129.337 E.28965
G1 X131.337 Y129.663 E.0108
G1 X131.663 Y129.663 E.0108
G1 X135.324 Y133.324 E.17174
G1 X132.352 Y133.324 E.09857
G1 X136.013 Y129.663 E.17174
G1 X136.143 Y129.663 E.00429
G1 X136.143 Y131.162 E.04972
G1 X132.151 Y127.477 F30000
G1 F2558
G1 X132.151 Y125.849 E.05401
G1 X136.55 Y121.45 E.20634
G1 X136.55 Y126.874 E.1799
G1 X130.126 Y120.45 E.30133
G1 X129.874 Y120.45 E.00838
G1 X127.975 Y122.349 E.08906
G1 X124.349 Y122.349 E.1203
G1 X122.45 Y120.45 E.08906
G1 X122.198 Y120.45 E.00838
G1 X121.45 Y121.198 E.03506
G1 X121.45 Y127.126 E.19666
G1 X122.849 Y128.525 E.0656
G1 X122.849 Y127.475 E.03481
G1 X121.45 Y128.849 E.06502
G1 X121.45 Y127.33 E.05038
G1 X121.54 Y134.164 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502898
G1 F2558
G1 X136.4 Y134.164 E.55702
; CHANGE_LAYER
; Z_HEIGHT: 4.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X134.4 Y134.164 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 38/151
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
G3 Z4.8 I1.198 J.213 P1  F30000
G1 X136.898 Y120.102 Z4.8
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5024
G1 X136.898 Y134.398 E.47422
G1 X121.102 Y134.398 E.52398
G1 X121.102 Y120.102 E.47422
G1 X136.838 Y120.102 E.52199
G1 X137.29 Y119.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5024
G1 X137.29 Y134.79 E.46337
G1 X120.71 Y134.79 E.50946
G1 X120.71 Y119.71 E.46337
G1 X137.23 Y119.71 E.50761
M204 S10000
; WIPE_START
G1 F24000
G1 X137.238 Y121.71 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I-.228 J-1.195 P1  F30000
G1 X131.604 Y122.784 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
G1 F5024
G1 X131.673 Y122.854 E.00273
G1 X131.388 Y122.777 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.400037
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X123.918 Y122.777 E.38249
G1 X123.885 Y122.791 E.00186
G1 X123.449 Y123.227 E.03159
G1 X131.551 Y123.227 E.41492
M73 P47 R10
G1 X131.709 Y123.385 E.01141
G1 X131.723 Y123.419 E.00187
G1 X131.723 Y123.677 E.01325
G1 X123.277 Y123.677 E.43249
G1 X123.277 Y124.127 E.02305
G1 X131.723 Y124.127 E.43249
G1 X131.723 Y124.577 E.02305
G1 X123.277 Y124.577 E.43249
G1 X123.277 Y125.027 E.02305
G1 X131.723 Y125.027 E.43249
G1 X131.723 Y125.478 E.02305
G1 X123.277 Y125.478 E.43249
G1 X123.277 Y125.928 E.02305
G1 X131.723 Y125.928 E.43249
G1 X131.723 Y126.378 E.02305
G1 X123.277 Y126.378 E.43249
G1 X123.277 Y126.828 E.02305
G1 X131.723 Y126.828 E.43249
G1 X131.723 Y127.278 E.02305
G1 X123.277 Y127.278 E.43249
G1 X123.277 Y127.728 E.02305
G1 X131.723 Y127.728 E.43249
G1 X131.723 Y128.178 E.02305
G1 X123.277 Y128.178 E.43249
G1 X123.277 Y128.628 E.02305
G1 X131.723 Y128.628 E.43249
G1 X131.723 Y129.078 E.02305
G1 X123.277 Y129.078 E.43249
G1 X123.277 Y129.277 E.01021
G1 X121.472 Y129.277 E.09245
G1 X121.472 Y129.528 E.01283
G1 X136.528 Y129.528 E.77103
G1 X136.528 Y129.978 E.02305
G1 X121.472 Y129.978 E.77103
G1 X121.472 Y130.428 E.02305
G1 X136.528 Y130.428 E.77103
G1 X136.528 Y130.878 E.02305
G1 X121.472 Y130.878 E.77103
G1 X121.472 Y131.328 E.02305
G1 X136.528 Y131.328 E.77103
G1 X136.528 Y131.778 E.02305
G1 X121.472 Y131.778 E.77103
G1 X121.472 Y132.228 E.02305
G1 X136.528 Y132.228 E.77103
G1 X136.528 Y132.678 E.02305
G1 X121.472 Y132.678 E.77103
G1 X121.472 Y133.128 E.02305
G1 X136.528 Y133.128 E.77103
G1 X136.528 Y133.578 E.02305
G1 X121.269 Y133.578 E.7814
M106 S252.45
G1 X121.45 Y127.33 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F5024
G1 X121.45 Y128.849 E.05038
G1 X122.849 Y127.475 E.06501
G1 X122.849 Y128.525 E.03481
G1 X121.45 Y127.126 E.0656
G1 X121.45 Y121.198 E.19666
G1 X122.198 Y120.45 E.03506
G1 X122.45 Y120.45 E.00838
G1 X124.349 Y122.349 E.08905
G1 X127.975 Y122.349 E.1203
G1 X129.874 Y120.45 E.08905
G1 X130.126 Y120.45 E.00838
G1 X136.55 Y126.874 E.30133
G1 X136.55 Y121.45 E.1799
G1 X132.151 Y125.849 E.20634
G1 X132.151 Y127.477 E.05401
G1 X123.284 Y122.896 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
G1 F5024
G1 X123.354 Y122.827 E.00273
; CHANGE_LAYER
; Z_HEIGHT: 4.61379
; LAYER_HEIGHT: 0.013793
; WIPE_START
G1 F24000
G1 X123.284 Y122.896 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 39/151
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
G3 Z5 I1.217 J-.023 P1  F30000
G1 X123.194 Y118.062 Z5
G1 Z4.614
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.275862
G1 F4335
G3 X123.195 Y114.294 I-.001 J-1.884 E.24018
G1 X123.311 Y114.297 E.00471
G3 X123.253 Y118.061 I-.118 J1.881 E.23282
; WIPE_START
G1 F24000
G1 X122.407 Y117.884 E-.32835
G1 X121.846 Y117.47 E-.26508
G1 X121.614 Y117.098 E-.16657
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.014 I-.197 J1.201 P1  F30000
G1 X132.716 Y118.92 Z5.014
G1 Z4.614
G1 E.8 F1800
G1 F4335
G3 X134.068 Y117.729 I1.772 J.649 E.07617
G1 X134.12 Y117.531 E.00831
G3 X135.493 Y114.267 I1.29 J-1.378 E.18622
G3 X136.672 Y117.502 I-.162 J1.891 E.17486
G1 X136.745 Y117.701 E.00861
G3 X138.08 Y120.569 I-.205 J1.841 E.15379
G1 X138.08 Y119.025 E.06261
G1 X137.975 Y118.92 E.00606
G1 X132.776 Y118.92 E.21082
; CHANGE_LAYER
; Z_HEIGHT: 4.8
; LAYER_HEIGHT: 0.186207
; WIPE_START
G1 F24000
G1 X132.961 Y118.454 E-.19027
G1 X133.278 Y118.116 E-.17628
G1 X133.67 Y117.867 E-.17628
G1 X134.068 Y117.729 E-.16028
G1 X134.106 Y117.584 E-.05688
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 40/151
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
G3 Z5.014 I-.815 J.904 P1  F30000
G1 X136.898 Y120.102 Z5.014
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F4335
G1 X136.898 Y134.198 E.46759
G1 X121.102 Y134.198 E.52398
G1 X121.102 Y120.102 E.46759
G1 X136.838 Y120.102 E.52199
G1 X137.29 Y119.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4335
G1 X137.29 Y134.59 E.45722
G1 X120.71 Y134.59 E.50946
G1 X120.71 Y119.71 E.45722
G1 X137.23 Y119.71 E.50761
M204 S10000
; WIPE_START
G1 F24000
G1 X137.238 Y121.71 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I-.913 J-.805 P1  F30000
G1 X132.151 Y127.477 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4335
G1 X132.151 Y125.849 E.05401
G1 X136.55 Y121.45 E.20634
G1 X136.55 Y126.874 E.1799
G1 X130.126 Y120.45 E.30133
G1 X129.874 Y120.45 E.00838
G1 X127.975 Y122.349 E.08905
G1 X124.349 Y122.349 E.1203
G1 X122.45 Y120.45 E.08905
G1 X122.198 Y120.45 E.00838
G1 X121.45 Y121.198 E.03506
G1 X121.45 Y127.126 E.19666
G1 X122.849 Y128.525 E.0656
G1 X122.849 Y127.475 E.03481
G1 X121.45 Y128.849 E.06501
G1 X121.45 Y127.33 E.05038
G1 X123.071 Y128.593 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.424195
G1 F4335
G1 X128.924 Y122.741 E.25716
G1 X128.385 Y122.741 E.01675
G1 X123.241 Y127.885 E.22601
G1 X123.241 Y127.345 E.01675
G1 X127.845 Y122.741 E.20232
G1 X127.306 Y122.741 E.01675
G1 X123.241 Y126.806 E.17863
G1 X123.241 Y126.267 E.01675
G1 X126.767 Y122.741 E.15494
G1 X126.228 Y122.741 E.01675
G1 X123.241 Y125.728 E.13124
G1 X123.241 Y125.189 E.01675
G1 X125.689 Y122.741 E.10755
G1 X125.149 Y122.741 E.01675
G1 X123.241 Y124.649 E.08386
G1 X123.241 Y124.11 E.01675
G1 X124.61 Y122.741 E.06017
G1 X124.071 Y122.741 E.01675
G1 X123.241 Y123.571 E.03648
G1 X123.241 Y123.411 E.00496
G3 X123.347 Y123.277 I.215 J.061 E.00546
M73 P48 R10
G1 X123.347 Y122.925 E.01094
G1 X123.595 Y122.678 E.01088
G1 X121.266 Y129.86 F30000
G1 F4335
G1 X121.885 Y129.241 E.0272
G1 X122.424 Y129.241 E.01675
G1 X121.435 Y130.229 E.04343
G1 X121.435 Y130.768 E.01675
G1 X129.463 Y122.741 E.35272
G1 X130.002 Y122.741 E.01675
G1 X121.435 Y131.308 E.37641
G1 X121.435 Y131.847 E.01675
G1 X130.541 Y122.741 E.40011
G1 X131.081 Y122.741 E.01675
G1 X121.435 Y132.386 E.4238
G1 X121.435 Y132.925 E.01675
G1 X131.513 Y122.847 E.44281
G1 X131.578 Y122.847 E.002
G1 X131.653 Y122.922 E.0033
G1 X131.653 Y123.247 E.01009
G1 X121.435 Y133.464 E.44894
G1 X121.435 Y133.865 E.01243
G1 X121.574 Y133.865 E.00432
G1 X131.759 Y123.68 E.44751
G1 X131.759 Y124.219 E.01675
G1 X122.114 Y133.865 E.42382
G1 X122.653 Y133.865 E.01675
G1 X131.759 Y124.758 E.40012
G1 X131.759 Y125.297 E.01675
G1 X123.192 Y133.865 E.37643
G1 X123.731 Y133.865 E.01675
G1 X131.759 Y125.837 E.35274
G1 X131.759 Y126.376 E.01675
G1 X124.27 Y133.865 E.32905
G1 X124.81 Y133.865 E.01675
G1 X131.759 Y126.915 E.30536
G1 X131.759 Y127.454 E.01675
G1 X125.349 Y133.865 E.28166
G1 X125.888 Y133.865 E.01675
G1 X131.759 Y127.993 E.25797
G1 X131.759 Y128.533 E.01675
G1 X126.427 Y133.865 E.23428
G1 X126.966 Y133.865 E.01675
G1 X131.759 Y129.072 E.21059
G1 X131.759 Y129.241 E.00525
G1 X132.129 Y129.241 E.0115
G1 X127.506 Y133.865 E.20317
G1 X128.045 Y133.865 E.01675
G1 X132.669 Y129.241 E.20317
G1 X133.208 Y129.241 E.01675
G1 X128.584 Y133.865 E.20317
G1 X129.123 Y133.865 E.01675
G1 X133.747 Y129.241 E.20317
G1 X134.286 Y129.241 E.01675
G1 X129.662 Y133.865 E.20317
G1 X130.202 Y133.865 E.01675
G1 X134.826 Y129.241 E.20317
G1 X135.365 Y129.241 E.01675
G1 X130.741 Y133.865 E.20317
G1 X131.28 Y133.865 E.01675
G1 X135.904 Y129.241 E.20317
G1 X136.443 Y129.241 E.01675
G1 X131.819 Y133.865 E.20317
G1 X132.358 Y133.865 E.01675
G1 X136.565 Y129.658 E.18481
G1 X136.565 Y130.198 E.01675
G1 X132.898 Y133.865 E.16112
G1 X133.437 Y133.865 E.01675
G1 X136.565 Y130.737 E.13743
G1 X136.565 Y131.276 E.01675
G1 X133.976 Y133.865 E.11374
G1 X134.515 Y133.865 E.01675
G1 X136.565 Y131.815 E.09005
G1 X136.565 Y132.354 E.01675
G1 X135.054 Y133.865 E.06636
G1 X135.594 Y133.865 E.01675
G1 X136.565 Y132.894 E.04266
G1 X136.565 Y133.433 E.01675
G1 X135.963 Y134.034 E.02643
; CHANGE_LAYER
; Z_HEIGHT: 4.88966
; LAYER_HEIGHT: 0.0896549
; WIPE_START
G1 F24000
G1 X136.565 Y133.433 E-.32324
G1 X136.565 Y132.894 E-.2049
G1 X136.133 Y133.325 E-.23186
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 41/151
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
G3 Z5.2 I1.203 J.183 P1  F30000
G1 X138.08 Y120.526 Z5.2
G1 Z4.89
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.275862
G1 F4586
G1 X138.08 Y119.025 E.06087
G1 X137.975 Y118.92 E.00606
G1 X132.742 Y118.92 E.21221
G3 X134.05 Y117.759 I1.742 J.646 E.07383
G2 X133.902 Y117.325 I-.365 J-.119 E.01996
G3 X135.493 Y114.375 I1.509 J-1.09 E.16908
G3 X136.689 Y117.529 I-.157 J1.863 E.17048
G1 X136.762 Y117.728 E.00861
G3 X138.112 Y120.475 I-.222 J1.814 E.14709
; WIPE_START
G1 F24000
G1 X138.08 Y119.025 E-.55118
G1 X137.975 Y118.92 E-.05679
G1 X137.575 Y118.92 E-.15203
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.29 I.186 J-1.203 P1  F30000
G1 X124.916 Y116.957 Z5.29
G1 Z4.89
G1 E.8 F1800
G1 F4586
G3 X123.194 Y114.402 I-1.724 J-.696 E.32642
G1 X123.309 Y114.406 E.00465
G3 X124.937 Y116.902 I-.116 J1.855 E.14023
; CHANGE_LAYER
; Z_HEIGHT: 5
; LAYER_HEIGHT: 0.110345
; WIPE_START
G1 F24000
G1 X124.524 Y117.535 E-.28743
G1 X123.97 Y117.944 E-.26167
G1 X123.429 Y118.067 E-.21089
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 42/151
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
G3 Z5.29 I-.182 J1.203 P1  F30000
G1 X136.898 Y120.102 Z5.29
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F4586
G1 X136.898 Y129.422 E.30917
G1 X131.578 Y129.422 E.17648
G1 X131.578 Y122.922 E.21562
G1 X123.422 Y122.922 E.27054
G1 X123.422 Y129.422 E.21562
G1 X121.102 Y129.422 E.07696
G1 X121.102 Y120.102 E.30917
G1 X136.838 Y120.102 E.52199
G1 X137.29 Y119.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4586
G1 X137.29 Y134.39 E.45108
G1 X120.71 Y134.39 E.50946
G1 X120.71 Y119.71 E.45108
G1 X137.23 Y119.71 E.50761
M204 S10000
; WIPE_START
G1 F24000
G1 X137.238 Y121.71 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I-.4 J-1.149 P1  F30000
G1 X131.355 Y123.756 Z5.4
G1 Z5
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
G1 F4586
G1 X130.744 Y123.145 E.02657
G1 X130.211 Y123.145
G1 X131.355 Y124.289 E.04975
G1 X131.355 Y124.823
G1 X129.677 Y123.145 E.07292
G1 X129.144 Y123.145
G1 X131.355 Y125.356 E.09609
G1 X131.355 Y125.889
G1 X128.611 Y123.145 E.11927
G1 X128.078 Y123.145
G1 X131.355 Y126.422 E.14244
G1 X131.355 Y126.956
G1 X127.544 Y123.145 E.16561
G1 X127.011 Y123.145
G1 X131.355 Y127.489 E.18878
G1 X131.355 Y128.022
G1 X126.478 Y123.145 E.21196
G1 X125.944 Y123.145
G1 X131.355 Y128.556 E.23513
G1 X131.355 Y129.089
G1 X125.411 Y123.145 E.2583
G1 X124.878 Y123.145
G1 X131.355 Y129.622 E.28148
M204 S10000
G1 X136.711 Y129.645 F30000
M204 S2000
G1 F4586
G1 X137.083 Y130.017 E.01616
G1 X137.083 Y130.55
G1 X136.177 Y129.645 E.03934
G1 X135.644 Y129.645
G1 X137.083 Y131.083 E.06251
G1 X137.083 Y131.616
G1 X135.111 Y129.645 E.08568
G1 X134.578 Y129.645
G1 X137.083 Y132.15 E.10886
G1 X137.083 Y132.683
G1 X134.044 Y129.645 E.13203
G1 X133.511 Y129.645
G1 X137.083 Y133.216 E.1552
G1 X137.083 Y133.75
G1 X132.978 Y129.645 E.17838
G1 X132.444 Y129.645
G1 X136.982 Y134.183 E.1972
G1 X136.449 Y134.183
G1 X131.911 Y129.645 E.1972
G1 X131.378 Y129.645
G1 X135.916 Y134.183 E.1972
G1 X135.383 Y134.183
G1 X124.345 Y123.145 E.47965
G1 X123.89 Y123.223
G1 X134.849 Y134.183 E.47625
G1 X134.316 Y134.183
G1 X123.645 Y123.511 E.46373
G1 X123.645 Y124.044
G1 X133.783 Y134.183 E.44055
G1 X133.25 Y134.183
G1 X123.645 Y124.578 E.41738
G1 X123.645 Y125.111
G1 X132.716 Y134.183 E.39421
G1 X132.183 Y134.183
G1 X123.645 Y125.644 E.37103
G1 X123.645 Y126.177
G1 X131.65 Y134.183 E.34786
G1 X131.116 Y134.183
G1 X123.645 Y126.711 E.32469
G1 X123.645 Y127.244
G1 X130.583 Y134.183 E.30152
G1 X130.05 Y134.183
G1 X123.645 Y127.777 E.27834
G1 X123.645 Y128.311
G1 X129.517 Y134.183 E.25517
G1 X128.983 Y134.183
G1 X123.645 Y128.844 E.232
G1 X123.645 Y129.377
G1 X128.45 Y134.183 E.20882
G1 X127.917 Y134.183
G1 X123.379 Y129.645 E.1972
G1 X122.846 Y129.645
G1 X127.384 Y134.183 E.1972
G1 X126.85 Y134.183
G1 X122.312 Y129.645 E.1972
G1 X121.779 Y129.645
G1 X126.317 Y134.183 E.1972
G1 X125.784 Y134.183
M73 P49 R10
G1 X121.246 Y129.645 E.1972
G1 X120.917 Y129.85
G1 X125.25 Y134.183 E.18829
G1 X124.717 Y134.183
G1 X120.917 Y130.383 E.16512
G1 X120.917 Y130.916
G1 X124.184 Y134.183 E.14195
G1 X123.651 Y134.183
G1 X120.917 Y131.449 E.11877
G1 X120.917 Y131.983
G1 X123.117 Y134.183 E.0956
G1 X122.584 Y134.183
G1 X120.917 Y132.516 E.07243
G1 X120.917 Y133.049
G1 X122.051 Y134.183 E.04926
G1 X121.518 Y134.183
G1 X120.917 Y133.582 E.02608
M204 S10000
; WIPE_START
G1 F24000
G1 X121.518 Y134.183 E-.32256
G1 X122.051 Y134.183 E-.20264
G1 X121.614 Y133.746 E-.2348
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I1.192 J.246 P1  F30000
G1 X123.76 Y123.36 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0923782
G1 F4586
G1 X123.626 Y123.495 E.00077
G1 X122.878 Y129.074 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4586
G1 X121.45 Y129.074 E.04737
G1 X121.45 Y128.874 E.00664
G1 X123.074 Y127.25 E.07617
G1 X123.074 Y128.75 E.04975
G1 X121.45 Y127.126 E.07617
G1 X121.45 Y121.198 E.19666
G1 X122.198 Y120.45 E.03506
G1 X122.45 Y120.45 E.00838
G1 X124.574 Y122.574 E.09962
G1 X127.75 Y122.574 E.10536
G1 X129.874 Y120.45 E.09962
G1 X130.126 Y120.45 E.00838
G1 X136.55 Y126.874 E.30133
G1 X136.55 Y121.45 E.1799
G1 X131.926 Y126.074 E.2169
G1 X131.926 Y127.702 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 5.16552
; LAYER_HEIGHT: 0.165517
; WIPE_START
G1 F24000
G1 X131.926 Y126.074 E-.61876
G1 X132.189 Y125.811 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 43/151
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
G3 Z5.4 I1.213 J.102 P1  F30000
G1 X132.767 Y118.92 Z5.4
G1 Z5.166
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.275862
G1 F1698
G3 X134.039 Y117.788 I1.713 J.645 E.0718
G2 X133.924 Y117.39 I-.295 J-.13 E.01822
G3 X135.493 Y114.481 I1.488 J-1.075 E.16681
G3 X136.705 Y117.566 I-.152 J1.841 E.16681
G1 X136.782 Y117.756 E.00831
G3 X138.08 Y120.48 I-.246 J1.789 E.14488
G1 X138.08 Y119.025 E.05898
G1 X137.975 Y118.92 E.00606
G1 X132.827 Y118.92 E.20874
; WIPE_START
G1 F24000
G1 X133.224 Y118.228 E-.30296
G1 X133.59 Y117.963 E-.17168
G1 X134.039 Y117.788 E-.18315
G1 X134.095 Y117.598 E-.07502
G1 X134.049 Y117.543 E-.02719
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.566 I.068 J-1.215 P1  F30000
G1 X124.892 Y117.028 Z5.566
G1 Z5.166
G1 E.8 F1800
G1 F1698
G3 X123.193 Y114.508 I-1.701 J-.686 E.32199
G1 X123.306 Y114.512 E.00458
G3 X124.913 Y116.973 I-.115 J1.83 E.13829
; CHANGE_LAYER
; Z_HEIGHT: 5.2
; LAYER_HEIGHT: 0.0344825
; WIPE_START
G1 F24000
G1 X124.506 Y117.599 E-.28384
G1 X123.959 Y118.002 E-.25818
G1 X123.4 Y118.129 E-.21798
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 44/151
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
G3 Z5.566 I-1.212 J.115 P1  F30000
G1 X123.898 Y123.398 Z5.566
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1698
G1 X123.898 Y129.898 E.21562
G1 X121.102 Y129.898 E.09274
G1 X121.102 Y120.102 E.32495
G1 X136.898 Y120.102 E.52398
G1 X136.898 Y129.898 E.32495
G1 X131.102 Y129.898 E.19226
G1 X131.102 Y123.398 E.21562
G1 X123.958 Y123.398 E.23698
G1 X124.29 Y123.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1698
G1 X124.29 Y130.29 E.19973
G1 X120.71 Y130.29 E.11
G1 X120.71 Y119.71 E.32509
G1 X137.29 Y119.71 E.50946
G1 X137.29 Y130.29 E.32509
G1 X130.71 Y130.29 E.20219
G1 X130.71 Y123.79 E.19973
G1 X124.35 Y123.79 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X124.332 Y125.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I.774 J-.939 P1  F30000
G1 X123.55 Y125.146 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1698
G1 X123.55 Y126.774 E.05401
G1 X121.45 Y128.874 E.09848
G1 X121.45 Y127.126 E.05796
G1 X123.55 Y129.226 E.09848
G1 X123.55 Y129.55 E.01075
G1 X122.245 Y129.55 E.04327
G1 X121.45 Y122.826 F30000
G1 F1698
G1 X121.45 Y121.198 E.05401
G1 X122.198 Y120.45 E.03506
G1 X122.45 Y120.45 E.00838
G1 X125.05 Y123.05 E.12194
G1 X127.274 Y123.05 E.0738
G1 X129.874 Y120.45 E.12194
G1 X130.126 Y120.45 E.00838
G1 X136.55 Y126.874 E.30133
G1 X136.55 Y129.126 E.07472
G1 X136.126 Y129.55 E.01986
G1 X131.55 Y129.55 E.15182
G1 X131.45 Y129.45 E.00466
G1 X131.45 Y126.55 E.09622
G1 X136.55 Y121.45 E.23922
G1 X136.55 Y120.45 E.03317
G1 X135.921 Y120.45 E.02084
; CHANGE_LAYER
; Z_HEIGHT: 5.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X136.55 Y120.45 E-.23876
G1 X136.55 Y121.45 E-.38
G1 X136.287 Y121.713 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 45/151
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
G1 X123.898 Y123.398 Z5.6
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1414
G1 X123.898 Y129.898 E.21562
G1 X121.102 Y129.898 E.09274
G1 X121.102 Y120.102 E.32495
G1 X136.898 Y120.102 E.52398
G1 X136.898 Y129.898 E.32495
G1 X131.102 Y129.898 E.19226
G1 X131.102 Y123.398 E.21562
G1 X123.958 Y123.398 E.23698
M73 P50 R10
G1 X124.29 Y123.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1414
G1 X124.29 Y130.29 E.19973
G1 X120.71 Y130.29 E.11
G1 X120.71 Y119.71 E.32509
G1 X137.29 Y119.71 E.50946
G1 X137.29 Y130.29 E.32509
G1 X130.71 Y130.29 E.20219
G1 X130.71 Y123.79 E.19973
G1 X124.35 Y123.79 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X124.332 Y125.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I.774 J-.939 P1  F30000
G1 X123.55 Y125.146 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1414
G1 X123.55 Y126.774 E.05401
G1 X121.45 Y128.874 E.09848
G1 X121.45 Y127.126 E.05796
G1 X123.55 Y129.226 E.09848
G1 X123.55 Y129.55 E.01075
G1 X122.245 Y129.55 E.04327
G1 X121.45 Y122.826 F30000
G1 F1414
G1 X121.45 Y121.198 E.05401
G1 X122.198 Y120.45 E.03506
G1 X122.45 Y120.45 E.00838
G1 X125.05 Y123.05 E.12194
G1 X127.274 Y123.05 E.0738
G1 X129.874 Y120.45 E.12194
G1 X130.126 Y120.45 E.00838
G1 X136.55 Y126.874 E.30133
G1 X136.55 Y129.126 E.07472
G1 X136.126 Y129.55 E.01986
G1 X131.55 Y129.55 E.15182
G1 X131.45 Y129.45 E.00466
G1 X131.45 Y126.55 E.09622
G1 X136.55 Y121.45 E.23922
G1 X136.55 Y120.45 E.03317
G1 X135.921 Y120.45 E.02084
; CHANGE_LAYER
; Z_HEIGHT: 5.44138
; LAYER_HEIGHT: 0.0413795
; WIPE_START
G1 F24000
G1 X136.55 Y120.45 E-.23876
G1 X136.55 Y121.45 E-.38
G1 X136.287 Y121.713 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 46/151
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
G3 Z5.8 I.707 J.99 P1  F30000
G1 X138.08 Y120.432 Z5.8
G1 Z5.441
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.275862
G1 F1693
G1 X138.08 Y119.025 E.05706
G1 X137.975 Y118.92 E.00606
G1 X132.793 Y118.92 E.21013
G3 X134.03 Y117.816 I1.686 J.644 E.06985
G1 X134.086 Y117.626 E.00801
G3 X135.493 Y114.585 I1.329 J-1.232 E.17352
G3 X136.718 Y117.59 I-.148 J1.812 E.1626
G2 X137.092 Y117.851 I.362 J-.12 E.01981
G3 X138.109 Y120.381 I-.551 J1.691 E.12602
; WIPE_START
G1 F24000
G1 X138.08 Y119.025 E-.51526
G1 X137.975 Y118.92 E-.05679
G1 X137.48 Y118.92 E-.18795
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.841 I.174 J-1.204 P1  F30000
G1 X124.868 Y117.096 Z5.841
G1 Z5.441
G1 E.8 F1800
G1 F1693
G3 X123.192 Y114.612 I-1.677 J-.676 E.31756
G1 X123.304 Y114.615 E.00452
G3 X124.889 Y117.041 I-.113 J1.805 E.13634
; CHANGE_LAYER
; Z_HEIGHT: 5.6
; LAYER_HEIGHT: 0.15862
; WIPE_START
G1 F24000
G1 X124.487 Y117.66 E-.28024
G1 X123.948 Y118.058 E-.25472
G1 X123.37 Y118.189 E-.22504
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 47/151
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
G3 Z5.841 I-1.211 J.123 P1  F30000
G1 X123.898 Y123.398 Z5.841
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1693
G1 X123.898 Y129.898 E.21562
G1 X121.102 Y129.898 E.09274
G1 X121.102 Y120.102 E.32495
G1 X136.898 Y120.102 E.52398
G1 X136.898 Y129.898 E.32495
G1 X131.102 Y129.898 E.19226
G1 X131.102 Y123.398 E.21562
G1 X123.958 Y123.398 E.23698
G1 X124.29 Y123.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1693
G1 X124.29 Y130.29 E.19973
G1 X120.71 Y130.29 E.11
G1 X120.71 Y119.71 E.32509
M73 P50 R9
G1 X137.29 Y119.71 E.50946
G1 X137.29 Y130.29 E.32509
G1 X130.71 Y130.29 E.20219
G1 X130.71 Y123.79 E.19973
G1 X124.35 Y123.79 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X124.332 Y125.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I.774 J-.939 P1  F30000
G1 X123.55 Y125.146 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1693
G1 X123.55 Y126.774 E.05401
G1 X121.45 Y128.874 E.09848
G1 X121.45 Y127.126 E.05796
G1 X123.55 Y129.226 E.09848
G1 X123.55 Y129.55 E.01075
G1 X122.245 Y129.55 E.04327
G1 X121.45 Y122.826 F30000
G1 F1693
G1 X121.45 Y121.198 E.05401
G1 X122.198 Y120.45 E.03506
G1 X122.45 Y120.45 E.00838
G1 X125.05 Y123.05 E.12194
G1 X127.274 Y123.05 E.0738
G1 X129.874 Y120.45 E.12194
M73 P51 R9
G1 X130.126 Y120.45 E.00838
G1 X136.55 Y126.874 E.30133
G1 X136.55 Y129.126 E.07472
G1 X136.126 Y129.55 E.01986
G1 X131.55 Y129.55 E.15182
G1 X131.45 Y129.45 E.00466
G1 X131.45 Y126.55 E.09622
G1 X136.55 Y121.45 E.23922
G1 X136.55 Y120.45 E.03317
G1 X135.921 Y120.45 E.02084
; CHANGE_LAYER
; Z_HEIGHT: 5.71724
; LAYER_HEIGHT: 0.117241
; WIPE_START
G1 F24000
G1 X136.55 Y120.45 E-.23876
G1 X136.55 Y121.45 E-.38
G1 X136.287 Y121.713 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 48/151
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
G3 Z6 I.724 J.978 P1  F30000
G1 X138.08 Y120.385 Z6
G1 Z5.717
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.275862
G1 F1689
G1 X138.08 Y119.025 E.05512
G1 X137.975 Y118.92 E.00606
G1 X132.819 Y118.92 E.20909
G3 X134.021 Y117.843 I1.659 J.643 E.06791
G2 X133.905 Y117.422 I-.347 J-.131 E.01895
G3 X135.494 Y114.686 I1.503 J-.956 E.15791
G3 X136.727 Y117.616 I-.144 J1.785 E.15866
G2 X137.084 Y117.874 I.345 J-.102 E.0192
G3 X138.108 Y120.332 I-.551 J1.672 E.12248
; WIPE_START
G1 F24000
G1 X138.08 Y119.025 E-.49677
G1 X137.975 Y118.92 E-.05679
G1 X137.431 Y118.92 E-.20644
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.117 I.168 J-1.205 P1  F30000
G1 X124.844 Y117.162 Z6.117
G1 Z5.717
G1 E.8 F1800
G1 F1689
G3 X123.191 Y114.713 I-1.654 J-.667 E.31312
G1 X123.301 Y114.716 E.00446
G3 X124.865 Y117.107 I-.111 J1.78 E.13439
; CHANGE_LAYER
; Z_HEIGHT: 5.8
; LAYER_HEIGHT: 0.0827589
; WIPE_START
G1 F24000
G1 X124.468 Y117.718 E-.27665
G1 X123.936 Y118.11 E-.25123
G1 X123.341 Y118.246 E-.23212
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 49/151
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
G3 Z6.117 I-1.21 J.131 P1  F30000
G1 X123.898 Y123.398 Z6.117
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1689
G1 X123.898 Y129.898 E.21562
G1 X121.102 Y129.898 E.09274
G1 X121.102 Y120.102 E.32495
G1 X136.898 Y120.102 E.52398
G1 X136.898 Y129.898 E.32495
G1 X131.102 Y129.898 E.19226
G1 X131.102 Y123.398 E.21562
G1 X123.958 Y123.398 E.23698
G1 X124.29 Y123.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1689
G1 X124.29 Y130.29 E.19973
G1 X120.71 Y130.29 E.11
G1 X120.71 Y119.71 E.32509
G1 X137.29 Y119.71 E.50946
G1 X137.29 Y130.29 E.32509
G1 X130.71 Y130.29 E.20219
G1 X130.71 Y123.79 E.19973
G1 X124.35 Y123.79 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X124.332 Y125.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I.774 J-.939 P1  F30000
G1 X123.55 Y125.146 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1689
G1 X123.55 Y126.774 E.05401
G1 X121.45 Y128.874 E.09848
G1 X121.45 Y127.126 E.05796
G1 X123.55 Y129.226 E.09848
G1 X123.55 Y129.55 E.01075
G1 X122.245 Y129.55 E.04327
G1 X121.45 Y122.826 F30000
G1 F1689
G1 X121.45 Y121.198 E.05401
G1 X122.198 Y120.45 E.03506
G1 X122.45 Y120.45 E.00838
G1 X125.05 Y123.05 E.12194
G1 X127.274 Y123.05 E.0738
G1 X129.874 Y120.45 E.12194
G1 X130.126 Y120.45 E.00838
G1 X136.55 Y126.874 E.30133
G1 X136.55 Y129.126 E.07472
G1 X136.126 Y129.55 E.01986
G1 X131.55 Y129.55 E.15182
G1 X131.45 Y129.45 E.00466
G1 X131.45 Y126.55 E.09622
G1 X136.55 Y121.45 E.23922
G1 X136.55 Y120.45 E.03317
G1 X135.921 Y120.45 E.02084
; CHANGE_LAYER
; Z_HEIGHT: 5.9931
; LAYER_HEIGHT: 0.193103
; WIPE_START
G1 F24000
G1 X136.55 Y120.45 E-.23876
G1 X136.55 Y121.45 E-.38
G1 X136.287 Y121.713 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 50/151
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
G3 Z6.2 I.743 J.964 P1  F30000
G1 X138.08 Y120.331 Z6.2
G1 Z5.993
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.275862
G1 F1684
G1 X138.08 Y119.025 E.05297
G1 X137.975 Y118.92 E.00606
G1 X132.844 Y118.92 E.20805
G3 X134.018 Y117.869 I1.633 J.643 E.06625
G2 X133.873 Y117.386 I-.488 J-.116 E.02143
M73 P52 R9
G3 X135.495 Y114.784 I1.54 J-.846 E.15109
G3 X136.735 Y117.653 I-.148 J1.766 E.15513
G2 X137.077 Y117.897 I.332 J-.103 E.01828
G3 X138.106 Y120.278 I-.543 J1.648 E.11886
; WIPE_START
G1 F24000
G1 X138.08 Y119.025 E-.47625
G1 X137.975 Y118.92 E-.05679
G1 X137.377 Y118.92 E-.22696
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.393 I.163 J-1.206 P1  F30000
G1 X124.819 Y117.226 Z6.393
G1 Z5.993
G1 E.8 F1800
G1 F1684
G3 X123.19 Y114.811 I-1.631 J-.657 E.30868
G1 X123.299 Y114.814 E.0044
G3 X124.84 Y117.171 I-.11 J1.754 E.13244
; CHANGE_LAYER
; Z_HEIGHT: 6
; LAYER_HEIGHT: 0.0068965
; WIPE_START
G1 F24000
G1 X124.449 Y117.773 E-.27306
G1 X123.925 Y118.16 E-.24775
G1 X123.311 Y118.3 E-.23919
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 51/151
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
G3 Z6.393 I-1.209 J.139 P1  F30000
G1 X123.898 Y123.398 Z6.393
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1684
G1 X123.898 Y129.898 E.21562
G1 X121.102 Y129.898 E.09274
G1 X121.102 Y120.102 E.32495
G1 X136.898 Y120.102 E.52398
G1 X136.898 Y129.898 E.32495
G1 X131.102 Y129.898 E.19226
G1 X131.102 Y123.398 E.21562
G1 X123.958 Y123.398 E.23698
G1 X124.29 Y123.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1684
G1 X124.29 Y130.29 E.19973
G1 X120.71 Y130.29 E.11
G1 X120.71 Y119.71 E.32509
G1 X137.29 Y119.71 E.50946
G1 X137.29 Y130.29 E.32509
G1 X130.71 Y130.29 E.20219
G1 X130.71 Y123.79 E.19973
G1 X124.35 Y123.79 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X124.332 Y125.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I.774 J-.939 P1  F30000
G1 X123.55 Y125.146 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1684
G1 X123.55 Y126.774 E.05401
G1 X121.45 Y128.874 E.09848
G1 X121.45 Y127.126 E.05796
G1 X123.55 Y129.226 E.09848
G1 X123.55 Y129.55 E.01075
G1 X122.245 Y129.55 E.04327
G1 X121.45 Y122.826 F30000
G1 F1684
G1 X121.45 Y121.198 E.05401
G1 X122.198 Y120.45 E.03506
G1 X122.45 Y120.45 E.00838
G1 X125.05 Y123.05 E.12194
G1 X127.274 Y123.05 E.0738
G1 X129.874 Y120.45 E.12194
G1 X130.126 Y120.45 E.00838
G1 X136.55 Y126.874 E.30133
G1 X136.55 Y129.126 E.07472
G1 X136.126 Y129.55 E.01986
G1 X131.55 Y129.55 E.15182
G1 X131.45 Y129.45 E.00466
G1 X131.45 Y126.55 E.09622
G1 X136.55 Y121.45 E.23922
G1 X136.55 Y120.45 E.03317
G1 X135.921 Y120.45 E.02084
; CHANGE_LAYER
; Z_HEIGHT: 6.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X136.55 Y120.45 E-.23876
G1 X136.55 Y121.45 E-.38
G1 X136.287 Y121.713 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 52/151
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
G3 Z6.4 I-.164 J-1.206 P1  F30000
G1 X123.898 Y123.398 Z6.4
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1414
G1 X123.898 Y129.898 E.21562
G1 X121.102 Y129.898 E.09274
G1 X121.102 Y120.102 E.32495
G1 X136.898 Y120.102 E.52398
G1 X136.898 Y129.898 E.32495
G1 X131.102 Y129.898 E.19226
G1 X131.102 Y123.398 E.21562
G1 X123.958 Y123.398 E.23698
G1 X124.29 Y123.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1414
G1 X124.29 Y130.29 E.19973
G1 X120.71 Y130.29 E.11
G1 X120.71 Y119.71 E.32509
G1 X137.29 Y119.71 E.50946
G1 X137.29 Y130.29 E.32509
G1 X130.71 Y130.29 E.20219
G1 X130.71 Y123.79 E.19973
G1 X124.35 Y123.79 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X124.332 Y125.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I.774 J-.939 P1  F30000
G1 X123.55 Y125.146 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1414
G1 X123.55 Y126.774 E.05401
G1 X121.45 Y128.874 E.09848
G1 X121.45 Y127.126 E.05796
G1 X123.55 Y129.226 E.09848
G1 X123.55 Y129.55 E.01075
G1 X122.245 Y129.55 E.04327
G1 X121.45 Y122.826 F30000
G1 F1414
G1 X121.45 Y121.198 E.05401
G1 X122.198 Y120.45 E.03506
G1 X122.45 Y120.45 E.00838
G1 X125.05 Y123.05 E.12194
G1 X127.274 Y123.05 E.0738
G1 X129.874 Y120.45 E.12194
M73 P53 R9
G1 X130.126 Y120.45 E.00838
G1 X136.55 Y126.874 E.30133
G1 X136.55 Y129.126 E.07472
G1 X136.126 Y129.55 E.01986
G1 X131.55 Y129.55 E.15182
G1 X131.45 Y129.45 E.00466
G1 X131.45 Y126.55 E.09622
G1 X136.55 Y121.45 E.23922
G1 X136.55 Y120.45 E.03317
G1 X135.921 Y120.45 E.02084
; CHANGE_LAYER
; Z_HEIGHT: 6.26897
; LAYER_HEIGHT: 0.0689659
; WIPE_START
G1 F24000
G1 X136.55 Y120.45 E-.23876
G1 X136.55 Y121.45 E-.38
G1 X136.287 Y121.713 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 53/151
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
G3 Z6.6 I.76 J.95 P1  F30000
G1 X138.08 Y120.278 Z6.6
G1 Z6.269
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.275862
G1 F1680
G1 X138.08 Y119.025 E.05082
G1 X137.975 Y118.92 E.00606
G1 X132.872 Y118.914 E.20693
G3 X134.018 Y117.894 I1.589 J.633 E.06449
G1 X134.077 Y117.714 E.00772
G3 X135.496 Y114.88 I1.337 J-1.103 E.16219
G3 X136.739 Y117.678 I-.143 J1.739 E.15146
G2 X137.069 Y117.92 I.32 J-.091 E.01785
G3 X138.105 Y120.224 I-.536 J1.626 E.11525
; WIPE_START
G1 F24000
G1 X138.08 Y119.025 E-.45573
G1 X137.975 Y118.92 E-.05679
G1 X137.323 Y118.919 E-.24748
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.669 I.157 J-1.207 P1  F30000
G1 X124.795 Y117.286 Z6.669
G1 Z6.269
G1 E.8 F1800
G1 F1680
G3 X123.189 Y114.907 I-1.607 J-.647 E.30424
G1 X123.296 Y114.91 E.00434
G3 X124.816 Y117.231 I-.108 J1.729 E.13049
; CHANGE_LAYER
; Z_HEIGHT: 6.4
; LAYER_HEIGHT: 0.131034
; WIPE_START
G1 F24000
G1 X124.43 Y117.826 E-.26946
G1 X123.913 Y118.208 E-.24428
G1 X123.281 Y118.351 E-.24627
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 54/151
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
G3 Z6.669 I-1.208 J.148 P1  F30000
G1 X123.898 Y123.398 Z6.669
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1680
G1 X123.898 Y129.898 E.21562
G1 X121.102 Y129.898 E.09274
G1 X121.102 Y120.102 E.32495
G1 X136.898 Y120.102 E.52398
G1 X136.898 Y129.898 E.32495
G1 X131.102 Y129.898 E.19226
G1 X131.102 Y123.398 E.21562
G1 X123.958 Y123.398 E.23698
G1 X124.29 Y123.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1680
G1 X124.29 Y130.29 E.19973
G1 X120.71 Y130.29 E.11
G1 X120.71 Y119.71 E.32509
G1 X137.29 Y119.71 E.50946
G1 X137.29 Y130.29 E.32509
G1 X130.71 Y130.29 E.20219
G1 X130.71 Y123.79 E.19973
G1 X124.35 Y123.79 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X124.332 Y125.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I.774 J-.939 P1  F30000
G1 X123.55 Y125.146 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1680
G1 X123.55 Y126.774 E.05401
G1 X121.45 Y128.874 E.09848
G1 X121.45 Y127.126 E.05796
G1 X123.55 Y129.226 E.09848
G1 X123.55 Y129.55 E.01075
G1 X122.245 Y129.55 E.04327
G1 X121.45 Y122.826 F30000
G1 F1680
G1 X121.45 Y121.198 E.05401
G1 X122.198 Y120.45 E.03506
G1 X122.45 Y120.45 E.00838
G1 X125.05 Y123.05 E.12194
G1 X127.274 Y123.05 E.0738
G1 X129.874 Y120.45 E.12194
G1 X130.126 Y120.45 E.00838
G1 X136.55 Y126.874 E.30133
G1 X136.55 Y129.126 E.07472
G1 X136.126 Y129.55 E.01986
G1 X131.55 Y129.55 E.15182
G1 X131.45 Y129.45 E.00466
G1 X131.45 Y126.55 E.09622
G1 X136.55 Y121.45 E.23922
G1 X136.55 Y120.45 E.03317
G1 X135.921 Y120.45 E.02084
; CHANGE_LAYER
; Z_HEIGHT: 6.54483
; LAYER_HEIGHT: 0.144827
; WIPE_START
G1 F24000
G1 X136.55 Y120.45 E-.23876
G1 X136.55 Y121.45 E-.38
G1 X136.287 Y121.713 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 55/151
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
G3 Z6.8 I.779 J.935 P1  F30000
G1 X138.08 Y120.219 Z6.8
G1 Z6.545
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.275862
M73 P54 R9
G1 F1675
G1 X138.08 Y119.025 E.04842
G1 X137.975 Y118.92 E.00606
G1 X132.896 Y118.92 E.20596
G3 X134.023 Y117.912 I1.604 J.66 E.06343
G2 X133.922 Y117.501 I-.369 J-.128 E.01816
G3 X135.498 Y114.974 I1.495 J-.822 E.14679
G3 X136.742 Y117.704 I-.14 J1.712 E.14792
G2 X137.062 Y117.943 I.31 J-.081 E.01746
G3 X138.103 Y120.165 I-.521 J1.599 E.11154
; WIPE_START
G1 F24000
G1 X138.08 Y119.025 E-.43312
G1 X137.975 Y118.92 E-.05679
G1 X137.264 Y118.92 E-.27009
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.945 I.152 J-1.207 P1  F30000
G1 X124.77 Y117.344 Z6.945
G1 Z6.545
G1 E.8 F1800
G1 F1675
G3 X123.187 Y115 I-1.584 J-.637 E.29981
G1 X123.292 Y115.003 E.00428
G3 X124.791 Y117.289 I-.106 J1.704 E.12854
; CHANGE_LAYER
; Z_HEIGHT: 6.6
; LAYER_HEIGHT: 0.0551724
; WIPE_START
G1 F24000
G1 X124.41 Y117.877 E-.26587
G1 X123.9 Y118.253 E-.24081
G1 X123.25 Y118.4 E-.25332
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 56/151
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
G3 Z6.945 I-1.207 J.156 P1  F30000
G1 X123.898 Y123.398 Z6.945
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1675
G1 X123.898 Y129.898 E.21562
G1 X121.102 Y129.898 E.09274
G1 X121.102 Y120.102 E.32495
G1 X136.898 Y120.102 E.52398
G1 X136.898 Y129.898 E.32495
G1 X131.102 Y129.898 E.19226
G1 X131.102 Y123.398 E.21562
G1 X123.958 Y123.398 E.23698
G1 X124.29 Y123.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1675
G1 X124.29 Y130.29 E.19973
G1 X120.71 Y130.29 E.11
G1 X120.71 Y119.71 E.32509
G1 X137.29 Y119.71 E.50946
G1 X137.29 Y130.29 E.32509
G1 X130.71 Y130.29 E.20219
G1 X130.71 Y123.79 E.19973
G1 X124.35 Y123.79 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X124.332 Y125.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7 I.774 J-.939 P1  F30000
G1 X123.55 Y125.146 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1675
G1 X123.55 Y126.774 E.05401
G1 X121.45 Y128.874 E.09848
G1 X121.45 Y127.126 E.05796
G1 X123.55 Y129.226 E.09848
G1 X123.55 Y129.55 E.01075
G1 X122.245 Y129.55 E.04327
G1 X121.45 Y122.826 F30000
G1 F1675
G1 X121.45 Y121.198 E.05401
G1 X122.198 Y120.45 E.03506
G1 X122.45 Y120.45 E.00838
G1 X125.05 Y123.05 E.12194
G1 X127.274 Y123.05 E.0738
G1 X129.874 Y120.45 E.12194
G1 X130.126 Y120.45 E.00838
G1 X136.55 Y126.874 E.30133
G1 X136.55 Y129.126 E.07472
G1 X136.126 Y129.55 E.01986
G1 X131.55 Y129.55 E.15182
G1 X131.45 Y129.45 E.00466
G1 X131.45 Y126.55 E.09622
G1 X136.55 Y121.45 E.23922
G1 X136.55 Y120.45 E.03317
G1 X135.921 Y120.45 E.02084
; CHANGE_LAYER
; Z_HEIGHT: 6.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X136.55 Y120.45 E-.23876
G1 X136.55 Y121.45 E-.38
G1 X136.287 Y121.713 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 57/151
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
G1 X123.898 Y123.398 Z7
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1414
G1 X123.898 Y129.898 E.21562
G1 X121.102 Y129.898 E.09274
G1 X121.102 Y120.102 E.32495
G1 X136.898 Y120.102 E.52398
G1 X136.898 Y129.898 E.32495
G1 X131.102 Y129.898 E.19226
G1 X131.102 Y123.398 E.21562
G1 X123.958 Y123.398 E.23698
G1 X124.29 Y123.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1414
G1 X124.29 Y130.29 E.19973
G1 X120.71 Y130.29 E.11
G1 X120.71 Y119.71 E.32509
G1 X137.29 Y119.71 E.50946
G1 X137.29 Y130.29 E.32509
G1 X130.71 Y130.29 E.20219
G1 X130.71 Y123.79 E.19973
G1 X124.35 Y123.79 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X124.332 Y125.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.2 I.774 J-.939 P1  F30000
G1 X123.55 Y125.146 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1414
G1 X123.55 Y126.774 E.05401
G1 X121.45 Y128.874 E.09848
G1 X121.45 Y127.126 E.05796
G1 X123.55 Y129.226 E.09848
M73 P55 R9
G1 X123.55 Y129.55 E.01075
G1 X122.245 Y129.55 E.04327
G1 X121.45 Y122.826 F30000
G1 F1414
G1 X121.45 Y121.198 E.05401
G1 X122.198 Y120.45 E.03506
G1 X122.45 Y120.45 E.00838
G1 X125.05 Y123.05 E.12194
G1 X127.274 Y123.05 E.0738
G1 X129.874 Y120.45 E.12194
G1 X130.126 Y120.45 E.00838
G1 X136.55 Y126.874 E.30133
G1 X136.55 Y129.126 E.07472
G1 X136.126 Y129.55 E.01986
G1 X131.55 Y129.55 E.15182
G1 X131.45 Y129.45 E.00466
G1 X131.45 Y126.55 E.09622
G1 X136.55 Y121.45 E.23922
G1 X136.55 Y120.45 E.03317
G1 X135.921 Y120.45 E.02084
; CHANGE_LAYER
; Z_HEIGHT: 6.82069
; LAYER_HEIGHT: 0.0206895
; WIPE_START
G1 F24000
G1 X136.55 Y120.45 E-.23876
G1 X136.55 Y121.45 E-.38
G1 X136.287 Y121.713 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 58/151
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
G3 Z7.2 I.797 J.92 P1  F30000
G1 X138.08 Y120.159 Z7.2
G1 Z6.821
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.275862
G1 F1671
G1 X138.08 Y119.025 E.04596
G1 X137.975 Y118.92 E.00606
G1 X132.922 Y118.92 E.2049
G3 X134.028 Y117.936 I1.576 J.658 E.0621
G2 X133.9 Y117.46 I-.53 J-.112 E.02077
G3 X135.501 Y115.065 I1.515 J-.72 E.1405
G3 X136.745 Y117.729 I-.136 J1.686 E.1445
G2 X137.152 Y118.001 I.433 J-.207 E.02085
G3 X138.101 Y120.103 I-.62 J1.545 E.10333
; WIPE_START
G1 F24000
G1 X138.08 Y119.025 E-.40965
G1 X137.975 Y118.92 E-.05679
G1 X137.202 Y118.92 E-.29356
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.221 I.199 J-1.201 P1  F30000
G1 X124.863 Y116.879 Z7.221
G1 Z6.821
G1 E.8 F1800
G1 F1671
G3 X123.185 Y115.09 I-1.679 J-.107 E.31713
G1 X123.289 Y115.094 E.00422
G3 X124.865 Y116.82 I-.105 J1.679 E.10484
; CHANGE_LAYER
; Z_HEIGHT: 7
; LAYER_HEIGHT: 0.17931
; WIPE_START
G1 F24000
G1 X124.683 Y117.489 E-.26344
G1 X124.317 Y117.999 E-.23863
G1 X123.792 Y118.337 E-.23708
G1 X123.738 Y118.346 E-.02086
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 59/151
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
G3 Z7.221 I-1.216 J.038 P1  F30000
G1 X123.898 Y123.398 Z7.221
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1671
G1 X123.898 Y129.898 E.21562
G1 X121.102 Y129.898 E.09274
G1 X121.102 Y120.102 E.32495
G1 X136.898 Y120.102 E.52398
G1 X136.898 Y129.898 E.32495
G1 X131.102 Y129.898 E.19226
G1 X131.102 Y123.398 E.21562
G1 X123.958 Y123.398 E.23698
G1 X124.29 Y123.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1671
G1 X124.29 Y130.29 E.19973
G1 X120.71 Y130.29 E.11
G1 X120.71 Y119.71 E.32509
G1 X137.29 Y119.71 E.50946
G1 X137.29 Y130.29 E.32509
G1 X130.71 Y130.29 E.20219
G1 X130.71 Y123.79 E.19973
G1 X124.35 Y123.79 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X124.332 Y125.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I.774 J-.939 P1  F30000
M73 P55 R8
G1 X123.55 Y125.146 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1671
G1 X123.55 Y126.774 E.05401
G1 X121.45 Y128.874 E.09848
G1 X121.45 Y127.126 E.05796
G1 X123.55 Y129.226 E.09848
G1 X123.55 Y129.55 E.01075
G1 X122.245 Y129.55 E.04327
G1 X121.45 Y122.826 F30000
G1 F1671
G1 X121.45 Y121.198 E.05401
G1 X122.198 Y120.45 E.03506
G1 X122.45 Y120.45 E.00838
G1 X125.05 Y123.05 E.12194
G1 X127.274 Y123.05 E.0738
G1 X129.874 Y120.45 E.12194
G1 X130.126 Y120.45 E.00838
G1 X136.55 Y126.874 E.30133
G1 X136.55 Y129.126 E.07472
G1 X136.126 Y129.55 E.01986
G1 X131.55 Y129.55 E.15182
G1 X131.45 Y129.45 E.00466
G1 X131.45 Y126.55 E.09622
G1 X136.55 Y121.45 E.23922
G1 X136.55 Y120.45 E.03317
G1 X135.921 Y120.45 E.02084
; CHANGE_LAYER
; Z_HEIGHT: 7.09655
; LAYER_HEIGHT: 0.0965519
; WIPE_START
G1 F24000
G1 X136.55 Y120.45 E-.23876
G1 X136.55 Y121.45 E-.38
G1 X136.287 Y121.713 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 60/151
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
G3 Z7.4 I.817 J.902 P1  F30000
M73 P56 R8
G1 X138.08 Y120.089 Z7.4
G1 Z7.097
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.275862
G1 F1667
G1 X138.08 Y119.025 E.04313
G1 X137.975 Y118.92 E.00606
G1 X132.948 Y118.92 E.20383
G3 X134.036 Y117.959 I1.549 J.658 E.06085
G2 X133.886 Y117.416 I-.67 J-.106 E.02355
G3 X135.504 Y115.153 I1.536 J-.612 E.13406
G3 X136.745 Y117.763 I-.132 J1.663 E.14175
G2 X137.143 Y118.023 I.428 J-.22 E.02017
G3 X138.099 Y120.033 I-.603 J1.519 E.09926
; WIPE_START
G1 F24000
G1 X138.08 Y119.025 E-.38285
G1 X137.975 Y118.92 E-.05679
G1 X137.132 Y118.92 E-.32036
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.497 I.193 J-1.201 P1  F30000
G1 X124.835 Y116.94 Z7.497
G1 Z7.097
G1 E.8 F1800
G1 F1667
G3 X123.182 Y115.178 I-1.653 J-.105 E.31237
G1 X123.285 Y115.181 E.00415
G3 X124.838 Y116.881 I-.103 J1.654 E.10323
; CHANGE_LAYER
; Z_HEIGHT: 7.2
; LAYER_HEIGHT: 0.103448
; WIPE_START
G1 F24000
G1 X124.658 Y117.541 E-.2598
G1 X124.298 Y118.043 E-.23511
G1 X123.781 Y118.376 E-.23362
G1 X123.699 Y118.389 E-.03147
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 61/151
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
G3 Z7.497 I-1.216 J.048 P1  F30000
G1 X123.898 Y123.398 Z7.497
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1667
G1 X123.898 Y129.898 E.21562
G1 X121.102 Y129.898 E.09274
G1 X121.102 Y120.102 E.32495
G1 X136.898 Y120.102 E.52398
G1 X136.898 Y129.898 E.32495
G1 X131.102 Y129.898 E.19226
G1 X131.102 Y123.398 E.21562
G1 X123.958 Y123.398 E.23698
G1 X124.29 Y123.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1667
G1 X124.29 Y130.29 E.19973
G1 X120.71 Y130.29 E.11
G1 X120.71 Y119.71 E.32509
G1 X137.29 Y119.71 E.50946
G1 X137.29 Y130.29 E.32509
G1 X130.71 Y130.29 E.20219
G1 X130.71 Y123.79 E.19973
G1 X124.35 Y123.79 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X124.332 Y125.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.6 I.774 J-.939 P1  F30000
G1 X123.55 Y125.146 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1667
G1 X123.55 Y126.774 E.05401
G1 X121.45 Y128.874 E.09848
G1 X121.45 Y127.126 E.05796
G1 X123.55 Y129.226 E.09848
G1 X123.55 Y129.55 E.01075
G1 X122.245 Y129.55 E.04327
G1 X121.45 Y122.826 F30000
G1 F1667
G1 X121.45 Y121.198 E.05401
G1 X122.198 Y120.45 E.03506
G1 X122.45 Y120.45 E.00838
G1 X125.05 Y123.05 E.12194
G1 X127.274 Y123.05 E.0738
G1 X129.874 Y120.45 E.12194
G1 X130.126 Y120.45 E.00838
G1 X136.55 Y126.874 E.30133
G1 X136.55 Y129.126 E.07472
G1 X136.126 Y129.55 E.01986
G1 X131.55 Y129.55 E.15182
G1 X131.45 Y129.45 E.00466
G1 X131.45 Y126.55 E.09622
G1 X136.55 Y121.45 E.23922
G1 X136.55 Y120.45 E.03317
G1 X135.921 Y120.45 E.02084
; CHANGE_LAYER
; Z_HEIGHT: 7.37241
; LAYER_HEIGHT: 0.172414
; WIPE_START
G1 F24000
G1 X136.55 Y120.45 E-.23876
G1 X136.55 Y121.45 E-.38
G1 X136.287 Y121.713 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 62/151
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
G3 Z7.6 I.837 J.883 P1  F30000
G1 X138.08 Y120.012 Z7.6
G1 Z7.372
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.275862
G1 F1661
G1 X138.08 Y119.072 E.03814
G1 X138.101 Y119.142 E.00296
G3 X138.123 Y119.844 I-1.592 J.401 E.02869
G3 X138.097 Y119.955 I-1.363 J-.253 E.00463
G1 X138.057 Y119.002 F30000
G1 F1661
G1 X137.975 Y118.92 E.00473
G1 X132.975 Y118.92 E.20277
G3 X134.046 Y117.981 I1.523 J.658 E.05969
M73 P57 R8
G2 X133.879 Y117.37 I-.696 J-.138 E.02659
G3 X135.508 Y115.239 I1.541 J-.51 E.12801
G3 X136.744 Y117.787 I-.128 J1.636 E.13857
G2 X137.134 Y118.046 I.419 J-.21 E.01987
G3 X138.036 Y118.947 I-.616 J1.518 E.05309
; WIPE_START
G1 F24000
G1 X137.975 Y118.92 E-.02545
G1 X136.042 Y118.92 E-.73455
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.772 I.205 J-1.2 P1  F30000
G1 X124.807 Y116.998 Z7.772
G1 Z7.372
G1 E.8 F1800
G1 F1661
G3 X123.179 Y115.264 I-1.628 J-.103 E.30762
G1 X123.28 Y115.267 E.00409
G3 X124.81 Y116.94 I-.101 J1.628 E.10162
; CHANGE_LAYER
; Z_HEIGHT: 7.4
; LAYER_HEIGHT: 0.0275865
; WIPE_START
G1 F24000
G1 X124.633 Y117.59 E-.25617
G1 X124.278 Y118.085 E-.2316
G1 X123.769 Y118.413 E-.23017
G1 X123.659 Y118.43 E-.04207
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 63/151
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
G3 Z7.772 I-1.216 J.058 P1  F30000
G1 X123.898 Y123.398 Z7.772
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1661
G1 X123.898 Y129.898 E.21562
G1 X121.102 Y129.898 E.09274
G1 X121.102 Y120.102 E.32495
G1 X136.898 Y120.102 E.52398
G1 X136.898 Y129.898 E.32495
G1 X131.102 Y129.898 E.19226
G1 X131.102 Y123.398 E.21562
G1 X123.958 Y123.398 E.23698
G1 X124.29 Y123.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1661
G1 X124.29 Y130.29 E.19973
G1 X120.71 Y130.29 E.11
G1 X120.71 Y119.71 E.32509
G1 X137.29 Y119.71 E.50946
G1 X137.29 Y130.29 E.32509
G1 X130.71 Y130.29 E.20219
G1 X130.71 Y123.79 E.19973
G1 X124.35 Y123.79 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X124.332 Y125.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.8 I.774 J-.939 P1  F30000
G1 X123.55 Y125.146 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1661
G1 X123.55 Y126.774 E.05401
G1 X121.45 Y128.874 E.09848
G1 X121.45 Y127.126 E.05796
G1 X123.55 Y129.226 E.09848
G1 X123.55 Y129.55 E.01075
G1 X122.245 Y129.55 E.04327
G1 X121.45 Y122.826 F30000
G1 F1661
G1 X121.45 Y121.198 E.05401
G1 X122.198 Y120.45 E.03506
G1 X122.45 Y120.45 E.00838
G1 X125.05 Y123.05 E.12194
G1 X127.274 Y123.05 E.0738
G1 X129.874 Y120.45 E.12194
G1 X130.126 Y120.45 E.00838
G1 X136.55 Y126.874 E.30133
G1 X136.55 Y129.126 E.07472
G1 X136.126 Y129.55 E.01986
G1 X131.55 Y129.55 E.15182
G1 X131.45 Y129.45 E.00466
G1 X131.45 Y126.55 E.09622
G1 X136.55 Y121.45 E.23922
G1 X136.55 Y120.45 E.03317
G1 X135.921 Y120.45 E.02084
; CHANGE_LAYER
; Z_HEIGHT: 7.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X136.55 Y120.45 E-.23876
G1 X136.55 Y121.45 E-.38
G1 X136.287 Y121.713 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 64/151
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
G1 X123.898 Y123.398 Z7.8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1414
G1 X123.898 Y129.898 E.21562
G1 X121.102 Y129.898 E.09274
G1 X121.102 Y120.102 E.32495
G1 X136.898 Y120.102 E.52398
G1 X136.898 Y129.898 E.32495
G1 X131.102 Y129.898 E.19226
G1 X131.102 Y123.398 E.21562
G1 X123.958 Y123.398 E.23698
G1 X124.29 Y123.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1414
G1 X124.29 Y130.29 E.19973
G1 X120.71 Y130.29 E.11
G1 X120.71 Y119.71 E.32509
G1 X137.29 Y119.71 E.50946
G1 X137.29 Y130.29 E.32509
G1 X130.71 Y130.29 E.20219
G1 X130.71 Y123.79 E.19973
G1 X124.35 Y123.79 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X124.332 Y125.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8 I.774 J-.939 P1  F30000
G1 X123.55 Y125.146 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1414
G1 X123.55 Y126.774 E.05401
G1 X121.45 Y128.874 E.09848
G1 X121.45 Y127.126 E.05796
G1 X123.55 Y129.226 E.09848
G1 X123.55 Y129.55 E.01075
G1 X122.245 Y129.55 E.04327
G1 X121.45 Y122.826 F30000
G1 F1414
G1 X121.45 Y121.198 E.05401
G1 X122.198 Y120.45 E.03506
G1 X122.45 Y120.45 E.00838
G1 X125.05 Y123.05 E.12194
G1 X127.274 Y123.05 E.0738
G1 X129.874 Y120.45 E.12194
G1 X130.126 Y120.45 E.00838
G1 X136.55 Y126.874 E.30133
G1 X136.55 Y129.126 E.07472
G1 X136.126 Y129.55 E.01986
G1 X131.55 Y129.55 E.15182
G1 X131.45 Y129.45 E.00466
G1 X131.45 Y126.55 E.09622
G1 X136.55 Y121.45 E.23922
G1 X136.55 Y120.45 E.03317
G1 X135.921 Y120.45 E.02084
; CHANGE_LAYER
; Z_HEIGHT: 7.64828
; LAYER_HEIGHT: 0.0482759
; WIPE_START
G1 F24000
G1 X136.55 Y120.45 E-.23876
G1 X136.55 Y121.45 E-.38
G1 X136.287 Y121.713 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 65/151
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
G3 Z8 I.86 J.861 P1  F30000
M73 P58 R8
G1 X138.08 Y119.923 Z8
G1 Z7.648
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.275862
G1 F1654
G1 X138.08 Y119.161 E.03088
G1 X138.099 Y119.245 E.00348
G3 X138.115 Y119.741 I-1.623 J.299 E.02019
G3 X138.094 Y119.864 I-1.464 J-.182 E.00508
G1 X138.017 Y118.962 F30000
G1 F1654
G1 X133.001 Y118.92 E.20343
G3 X134.05 Y118.011 I1.459 J.624 E.05824
G2 X133.943 Y117.516 I-.553 J-.14 E.02129
G3 X135.512 Y115.323 I1.488 J-.594 E.13001
G3 X136.742 Y117.812 I-.125 J1.61 E.13551
G2 X137.126 Y118.068 I.411 J-.2 E.01959
G3 X137.994 Y118.907 I-.611 J1.501 E.05018
; WIPE_START
G1 F24000
G1 X135.994 Y118.912 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.048 I.199 J-1.201 P1  F30000
G1 X124.779 Y117.055 Z8.048
G1 Z7.648
G1 E.8 F1800
G1 F1654
G3 X123.176 Y115.347 I-1.603 J-.101 E.30288
G1 X123.276 Y115.35 E.00403
G3 X124.782 Y116.996 I-.099 J1.603 E.10001
; CHANGE_LAYER
; Z_HEIGHT: 7.8
; LAYER_HEIGHT: 0.151724
; WIPE_START
G1 F24000
G1 X124.608 Y117.637 E-.25257
G1 X124.258 Y118.125 E-.22808
G1 X123.756 Y118.447 E-.22673
G1 X123.619 Y118.469 E-.05262
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 66/151
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
G3 Z8.048 I-1.215 J.069 P1  F30000
G1 X123.898 Y123.398 Z8.048
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1654
G1 X123.898 Y129.898 E.21562
G1 X121.102 Y129.898 E.09274
G1 X121.102 Y120.102 E.32495
G1 X136.898 Y120.102 E.52398
G1 X136.898 Y129.898 E.32495
G1 X131.102 Y129.898 E.19226
G1 X131.102 Y123.398 E.21562
G1 X123.958 Y123.398 E.23698
G1 X124.29 Y123.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1654
G1 X124.29 Y130.29 E.19973
G1 X120.71 Y130.29 E.11
G1 X120.71 Y119.71 E.32509
G1 X137.29 Y119.71 E.50946
G1 X137.29 Y130.29 E.32509
G1 X130.71 Y130.29 E.20219
G1 X130.71 Y123.79 E.19973
G1 X124.35 Y123.79 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X124.332 Y125.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.2 I.774 J-.939 P1  F30000
G1 X123.55 Y125.146 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1654
G1 X123.55 Y126.774 E.05401
G1 X121.45 Y128.874 E.09848
G1 X121.45 Y127.126 E.05796
G1 X123.55 Y129.226 E.09848
G1 X123.55 Y129.55 E.01075
G1 X122.245 Y129.55 E.04327
G1 X121.45 Y122.826 F30000
G1 F1654
G1 X121.45 Y121.198 E.05401
G1 X122.198 Y120.45 E.03506
G1 X122.45 Y120.45 E.00838
G1 X125.05 Y123.05 E.12194
G1 X127.274 Y123.05 E.0738
G1 X129.874 Y120.45 E.12194
G1 X130.126 Y120.45 E.00838
G1 X136.55 Y126.874 E.30133
G1 X136.55 Y129.126 E.07472
G1 X136.126 Y129.55 E.01986
G1 X131.55 Y129.55 E.15182
G1 X131.45 Y129.45 E.00466
G1 X131.45 Y126.55 E.09622
G1 X136.55 Y121.45 E.23922
G1 X136.55 Y120.45 E.03317
G1 X135.921 Y120.45 E.02084
; CHANGE_LAYER
; Z_HEIGHT: 7.92414
; LAYER_HEIGHT: 0.124138
; WIPE_START
G1 F24000
G1 X136.55 Y120.45 E-.23876
G1 X136.55 Y121.45 E-.38
G1 X136.287 Y121.713 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 67/151
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
G3 Z8.2 I.887 J.833 P1  F30000
G1 X138.08 Y119.803 Z8.2
G1 Z7.924
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.275862
G1 F1646
G1 X138.08 Y119.281 E.02117
G1 X138.091 Y119.346 E.00268
G3 X138.1 Y119.64 I-1.744 J.202 E.01193
G3 X138.09 Y119.744 I-1.305 J-.074 E.00423
G1 X137.973 Y118.92 F30000
G1 F1646
M73 P59 R8
G1 X133.027 Y118.92 E.20055
G3 X134.065 Y118.031 I1.433 J.624 E.05732
G2 X133.972 Y117.562 I-.495 J-.147 E.02019
G3 X135.518 Y115.403 I1.464 J-.584 E.12799
G3 X136.74 Y117.836 I-.122 J1.585 E.13257
G2 X137.117 Y118.091 I.404 J-.191 E.01934
G3 X137.948 Y118.866 I-.579 J1.454 E.04718
; WIPE_START
G1 F24000
G1 X135.948 Y118.888 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.324 I.191 J-1.202 P1  F30000
G1 X124.751 Y117.108 Z8.324
G1 Z7.924
G1 E.8 F1800
G1 F1646
G3 X123.173 Y115.428 I-1.578 J-.099 E.29815
G1 X123.27 Y115.431 E.00397
G3 X124.753 Y117.049 I-.098 J1.578 E.09841
; CHANGE_LAYER
; Z_HEIGHT: 8
; LAYER_HEIGHT: 0.0758619
; WIPE_START
G1 F24000
G1 X124.582 Y117.682 E-.24897
G1 X124.238 Y118.162 E-.22458
G1 X123.743 Y118.48 E-.22329
G1 X123.579 Y118.506 E-.06316
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 68/151
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
G3 Z8.324 I-1.214 J.079 P1  F30000
G1 X123.898 Y123.398 Z8.324
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1646
G1 X123.898 Y129.898 E.21562
G1 X121.102 Y129.898 E.09274
G1 X121.102 Y120.102 E.32495
G1 X136.898 Y120.102 E.52398
G1 X136.898 Y129.898 E.32495
G1 X131.102 Y129.898 E.19226
G1 X131.102 Y123.398 E.21562
G1 X123.958 Y123.398 E.23698
G1 X124.29 Y123.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1646
G1 X124.29 Y130.29 E.19973
G1 X120.71 Y130.29 E.11
G1 X120.71 Y119.71 E.32509
G1 X137.29 Y119.71 E.50946
G1 X137.29 Y130.29 E.32509
G1 X130.71 Y130.29 E.20219
G1 X130.71 Y123.79 E.19973
G1 X124.35 Y123.79 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X124.332 Y125.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.4 I.774 J-.939 P1  F30000
G1 X123.55 Y125.146 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1646
G1 X123.55 Y126.774 E.05401
G1 X121.45 Y128.874 E.09848
G1 X121.45 Y127.126 E.05796
G1 X123.55 Y129.226 E.09848
G1 X123.55 Y129.55 E.01075
G1 X122.245 Y129.55 E.04327
G1 X121.45 Y122.826 F30000
G1 F1646
G1 X121.45 Y121.198 E.05401
G1 X122.198 Y120.45 E.03506
G1 X122.45 Y120.45 E.00838
G1 X125.05 Y123.05 E.12194
G1 X127.274 Y123.05 E.0738
G1 X129.874 Y120.45 E.12194
G1 X130.126 Y120.45 E.00838
G1 X136.55 Y126.874 E.30133
G1 X136.55 Y129.126 E.07472
G1 X136.126 Y129.55 E.01986
G1 X131.55 Y129.55 E.15182
G1 X131.45 Y129.45 E.00466
G1 X131.45 Y126.55 E.09622
G1 X136.55 Y121.45 E.23922
G1 X136.55 Y120.45 E.03317
G1 X135.921 Y120.45 E.02084
; CHANGE_LAYER
; Z_HEIGHT: 8.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X136.55 Y120.45 E-.23876
G1 X136.55 Y121.45 E-.38
G1 X136.287 Y121.713 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 69/151
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
G3 Z8.4 I1.217 J0 P1  F30000
G1 X136.287 Y118.92 Z8.4
G1 Z8.2
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.275862
G1 F1634
G1 X133.054 Y118.92 E.13112
G3 X134.082 Y118.052 I1.408 J.625 E.05648
G2 X134.003 Y117.606 I-.443 J-.151 E.01917
G3 X135.524 Y115.482 I1.44 J-.575 E.12596
G3 X136.739 Y117.87 I-.126 J1.567 E.13002
G2 X137.196 Y118.151 I.532 J-.351 E.0225
G3 X137.946 Y118.92 I-.686 J1.42 E.04443
G1 X136.347 Y118.92 E.06487
; WIPE_START
G1 F24000
G1 X134.347 Y118.92 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.6 I.219 J-1.197 P1  F30000
G1 X124.722 Y117.16 Z8.6
G1 Z8.2
G1 E.8 F1800
G1 F1634
G3 X123.168 Y115.506 I-1.553 J-.098 E.29344
G1 X123.265 Y115.509 E.00391
G3 X124.725 Y117.101 I-.096 J1.553 E.09681
; WIPE_START
G1 F24000
G1 X124.556 Y117.725 E-.2454
G1 X124.217 Y118.197 E-.2211
G1 X123.73 Y118.51 E-.21986
G1 X123.538 Y118.541 E-.07365
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.6 I-1.214 J.09 P1  F30000
G1 X123.898 Y123.398 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1634
G1 X123.898 Y129.898 E.21562
G1 X121.102 Y129.898 E.09274
G1 X121.102 Y120.102 E.32495
G1 X136.898 Y120.102 E.52398
G1 X136.898 Y129.898 E.32495
G1 X131.102 Y129.898 E.19226
G1 X131.102 Y123.398 E.21562
G1 X123.958 Y123.398 E.23698
G1 X124.29 Y123.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1634
M73 P60 R8
G1 X124.29 Y130.29 E.19973
G1 X120.71 Y130.29 E.11
G1 X120.71 Y119.71 E.32509
G1 X137.29 Y119.71 E.50946
G1 X137.29 Y130.29 E.32509
G1 X130.71 Y130.29 E.20219
G1 X130.71 Y123.79 E.19973
G1 X124.35 Y123.79 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X124.332 Y125.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.6 I.774 J-.939 P1  F30000
G1 X123.55 Y125.146 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1634
G1 X123.55 Y126.774 E.05401
G1 X121.45 Y128.874 E.09848
G1 X121.45 Y127.126 E.05796
G1 X123.55 Y129.226 E.09848
G1 X123.55 Y129.55 E.01075
G1 X122.245 Y129.55 E.04327
G1 X121.45 Y122.826 F30000
G1 F1634
G1 X121.45 Y121.198 E.05401
G1 X122.198 Y120.45 E.03506
G1 X122.45 Y120.45 E.00838
G1 X125.05 Y123.05 E.12194
G1 X127.274 Y123.05 E.0738
G1 X129.874 Y120.45 E.12194
G1 X130.126 Y120.45 E.00838
G1 X136.55 Y126.874 E.30133
G1 X136.55 Y129.126 E.07472
G1 X136.126 Y129.55 E.01986
G1 X131.55 Y129.55 E.15182
G1 X131.45 Y129.45 E.00466
G1 X131.45 Y126.55 E.09622
G1 X136.55 Y121.45 E.23922
G1 X136.55 Y120.45 E.03317
G1 X135.921 Y120.45 E.02084
; CHANGE_LAYER
; Z_HEIGHT: 8.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X136.55 Y120.45 E-.23876
G1 X136.55 Y121.45 E-.38
G1 X136.287 Y121.713 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 70/151
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
G3 Z8.6 I-.164 J-1.206 P1  F30000
G1 X123.898 Y123.398 Z8.6
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1414
G1 X123.898 Y129.898 E.21562
G1 X121.102 Y129.898 E.09274
G1 X121.102 Y120.102 E.32495
G1 X136.898 Y120.102 E.52398
G1 X136.898 Y129.898 E.32495
G1 X131.102 Y129.898 E.19226
G1 X131.102 Y123.398 E.21562
G1 X123.958 Y123.398 E.23698
G1 X124.29 Y123.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1414
G1 X124.29 Y130.29 E.19973
G1 X120.71 Y130.29 E.11
G1 X120.71 Y119.71 E.32509
G1 X137.29 Y119.71 E.50946
G1 X137.29 Y130.29 E.32509
G1 X130.71 Y130.29 E.20219
G1 X130.71 Y123.79 E.19973
G1 X124.35 Y123.79 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X124.332 Y125.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.8 I.774 J-.939 P1  F30000
G1 X123.55 Y125.146 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1414
G1 X123.55 Y126.774 E.05401
G1 X121.45 Y128.874 E.09848
G1 X121.45 Y127.126 E.05796
G1 X123.55 Y129.226 E.09848
G1 X123.55 Y129.55 E.01075
G1 X122.245 Y129.55 E.04327
G1 X121.45 Y122.826 F30000
G1 F1414
G1 X121.45 Y121.198 E.05401
G1 X122.198 Y120.45 E.03506
G1 X122.45 Y120.45 E.00838
G1 X125.05 Y123.05 E.12194
G1 X127.274 Y123.05 E.0738
G1 X129.874 Y120.45 E.12194
G1 X130.126 Y120.45 E.00838
G1 X136.55 Y126.874 E.30133
G1 X136.55 Y129.126 E.07472
G1 X136.126 Y129.55 E.01986
G1 X131.55 Y129.55 E.15182
G1 X131.45 Y129.45 E.00466
G1 X131.45 Y126.55 E.09622
G1 X136.55 Y121.45 E.23922
G1 X136.55 Y120.45 E.03317
G1 X135.921 Y120.45 E.02084
; CHANGE_LAYER
; Z_HEIGHT: 8.47586
; LAYER_HEIGHT: 0.0758629
; WIPE_START
G1 F24000
M73 P60 R7
G1 X136.55 Y120.45 E-.23876
G1 X136.55 Y121.45 E-.38
G1 X136.287 Y121.713 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 71/151
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
G3 Z8.8 I1.217 J0 P1  F30000
G1 X136.287 Y118.92 Z8.8
G1 Z8.476
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.275862
G1 F1631
G1 X133.08 Y118.92 E.13005
G3 X134.101 Y118.071 I1.384 J.628 E.05572
G2 X133.975 Y117.464 I-.717 J-.168 E.02596
G3 X135.531 Y115.558 I1.473 J-.385 E.11614
G3 X136.735 Y117.893 I-.123 J1.541 E.12729
M73 P61 R7
G2 X137.271 Y118.216 I.641 J-.458 E.02609
G3 X137.92 Y118.92 I-.736 J1.331 E.03949
G1 X136.347 Y118.92 E.0638
; WIPE_START
G1 F24000
G1 X134.347 Y118.92 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.876 I.212 J-1.198 P1  F30000
G1 X124.693 Y117.21 Z8.876
G1 Z8.476
G1 E.8 F1800
G1 F1631
G3 X123.164 Y115.583 I-1.528 J-.096 E.28875
G1 X123.258 Y115.586 E.00385
G3 X124.695 Y117.151 I-.094 J1.529 E.09522
; CHANGE_LAYER
; Z_HEIGHT: 8.6
; LAYER_HEIGHT: 0.124138
; WIPE_START
G1 F24000
G1 X124.529 Y117.766 E-.24185
G1 X124.195 Y118.231 E-.21762
G1 X123.716 Y118.538 E-.21643
G1 X123.497 Y118.574 E-.0841
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 72/151
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
G3 Z8.876 I-1.213 J.101 P1  F30000
G1 X123.898 Y123.398 Z8.876
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1631
G1 X123.898 Y129.898 E.21562
G1 X121.102 Y129.898 E.09274
G1 X121.102 Y120.102 E.32495
G1 X136.898 Y120.102 E.52398
G1 X136.898 Y129.898 E.32495
G1 X131.102 Y129.898 E.19226
G1 X131.102 Y123.398 E.21562
G1 X123.958 Y123.398 E.23698
G1 X124.29 Y123.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1631
G1 X124.29 Y130.29 E.19973
G1 X120.71 Y130.29 E.11
G1 X120.71 Y119.71 E.32509
G1 X137.29 Y119.71 E.50946
G1 X137.29 Y130.29 E.32509
G1 X130.71 Y130.29 E.20219
G1 X130.71 Y123.79 E.19973
G1 X124.35 Y123.79 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X124.332 Y125.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9 I.774 J-.939 P1  F30000
G1 X123.55 Y125.146 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1631
G1 X123.55 Y126.774 E.05401
G1 X121.45 Y128.874 E.09848
G1 X121.45 Y127.126 E.05796
G1 X123.55 Y129.226 E.09848
G1 X123.55 Y129.55 E.01075
G1 X122.245 Y129.55 E.04327
G1 X121.45 Y122.826 F30000
G1 F1631
G1 X121.45 Y121.198 E.05401
G1 X122.198 Y120.45 E.03506
G1 X122.45 Y120.45 E.00838
G1 X125.05 Y123.05 E.12194
G1 X127.274 Y123.05 E.0738
G1 X129.874 Y120.45 E.12194
G1 X130.126 Y120.45 E.00838
G1 X136.55 Y126.874 E.30133
G1 X136.55 Y129.126 E.07472
G1 X136.126 Y129.55 E.01986
G1 X131.55 Y129.55 E.15182
G1 X131.45 Y129.45 E.00466
G1 X131.45 Y126.55 E.09622
G1 X136.55 Y121.45 E.23922
G1 X136.55 Y120.45 E.03317
G1 X135.921 Y120.45 E.02084
; CHANGE_LAYER
; Z_HEIGHT: 8.75172
; LAYER_HEIGHT: 0.151724
; WIPE_START
G1 F24000
G1 X136.55 Y120.45 E-.23876
G1 X136.55 Y121.45 E-.38
G1 X136.287 Y121.713 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 73/151
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
G3 Z9 I1.217 J.003 P1  F30000
G1 X136.294 Y118.916 Z9
G1 Z8.752
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.275862
G1 F1628
G1 X133.111 Y118.908 E.12906
G3 X134.119 Y118.091 I1.371 J.662 E.05436
G2 X134.035 Y117.598 I-.575 J-.156 E.02095
G3 X135.54 Y115.633 I1.419 J-.472 E.1182
G3 X136.731 Y117.917 I-.12 J1.516 E.12467
G2 X137.259 Y118.237 I.629 J-.442 E.02577
G3 X137.894 Y118.92 I-.726 J1.312 E.03842
G1 X136.354 Y118.916 E.06247
; WIPE_START
G1 F24000
G1 X134.354 Y118.911 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.152 I.205 J-1.2 P1  F30000
G1 X124.663 Y117.258 Z9.152
G1 Z8.752
G1 E.8 F1800
G1 F1628
G3 X123.158 Y115.658 I-1.504 J-.094 E.28407
G1 X123.251 Y115.661 E.00379
G3 X124.665 Y117.199 I-.093 J1.504 E.09363
; CHANGE_LAYER
; Z_HEIGHT: 8.8
; LAYER_HEIGHT: 0.0482759
; WIPE_START
G1 F24000
G1 X124.502 Y117.805 E-.23832
G1 X124.173 Y118.262 E-.21415
G1 X123.701 Y118.565 E-.21301
G1 X123.455 Y118.605 E-.09452
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 74/151
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
G3 Z9.152 I-1.212 J.112 P1  F30000
G1 X123.898 Y123.398 Z9.152
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1628
G1 X123.898 Y129.898 E.21562
G1 X121.102 Y129.898 E.09274
M73 P62 R7
G1 X121.102 Y120.102 E.32495
G1 X136.898 Y120.102 E.52398
G1 X136.898 Y129.898 E.32495
G1 X131.102 Y129.898 E.19226
G1 X131.102 Y123.398 E.21562
G1 X123.958 Y123.398 E.23698
G1 X124.29 Y123.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1628
G1 X124.29 Y130.29 E.19973
G1 X120.71 Y130.29 E.11
G1 X120.71 Y119.71 E.32509
G1 X137.29 Y119.71 E.50946
G1 X137.29 Y130.29 E.32509
G1 X130.71 Y130.29 E.20219
G1 X130.71 Y123.79 E.19973
G1 X124.35 Y123.79 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X124.332 Y125.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.2 I.774 J-.939 P1  F30000
G1 X123.55 Y125.146 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1628
G1 X123.55 Y126.774 E.05401
G1 X121.45 Y128.874 E.09848
G1 X121.45 Y127.126 E.05796
G1 X123.55 Y129.226 E.09848
G1 X123.55 Y129.55 E.01075
G1 X122.245 Y129.55 E.04327
G1 X121.45 Y122.826 F30000
G1 F1628
G1 X121.45 Y121.198 E.05401
G1 X122.198 Y120.45 E.03506
G1 X122.45 Y120.45 E.00838
G1 X125.05 Y123.05 E.12194
G1 X127.274 Y123.05 E.0738
G1 X129.874 Y120.45 E.12194
G1 X130.126 Y120.45 E.00838
G1 X136.55 Y126.874 E.30133
G1 X136.55 Y129.126 E.07472
G1 X136.126 Y129.55 E.01986
G1 X131.55 Y129.55 E.15182
G1 X131.45 Y129.45 E.00466
G1 X131.45 Y126.55 E.09622
G1 X136.55 Y121.45 E.23922
G1 X136.55 Y120.45 E.03317
G1 X135.921 Y120.45 E.02084
; CHANGE_LAYER
; Z_HEIGHT: 9
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X136.55 Y120.45 E-.23876
G1 X136.55 Y121.45 E-.38
G1 X136.287 Y121.713 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 75/151
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
G3 Z9.2 I-.164 J-1.206 P1  F30000
G1 X123.898 Y123.398 Z9.2
G1 Z9
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1414
G1 X123.898 Y129.898 E.21562
G1 X121.102 Y129.898 E.09274
G1 X121.102 Y120.102 E.32495
G1 X136.898 Y120.102 E.52398
G1 X136.898 Y129.898 E.32495
G1 X131.102 Y129.898 E.19226
G1 X131.102 Y123.398 E.21562
G1 X123.958 Y123.398 E.23698
G1 X124.29 Y123.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1414
G1 X124.29 Y130.29 E.19973
G1 X120.71 Y130.29 E.11
G1 X120.71 Y119.71 E.32509
G1 X137.29 Y119.71 E.50946
G1 X137.29 Y130.29 E.32509
G1 X130.71 Y130.29 E.20219
G1 X130.71 Y123.79 E.19973
G1 X124.35 Y123.79 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X124.332 Y125.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I.774 J-.939 P1  F30000
G1 X123.55 Y125.146 Z9.4
G1 Z9
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1414
G1 X123.55 Y126.774 E.05401
G1 X121.45 Y128.874 E.09848
G1 X121.45 Y127.126 E.05796
G1 X123.55 Y129.226 E.09848
G1 X123.55 Y129.55 E.01075
G1 X122.245 Y129.55 E.04327
G1 X121.45 Y122.826 F30000
G1 F1414
G1 X121.45 Y121.198 E.05401
G1 X122.198 Y120.45 E.03506
G1 X122.45 Y120.45 E.00838
G1 X125.05 Y123.05 E.12194
G1 X127.274 Y123.05 E.0738
G1 X129.874 Y120.45 E.12194
G1 X130.126 Y120.45 E.00838
G1 X136.55 Y126.874 E.30133
G1 X136.55 Y129.126 E.07472
G1 X136.126 Y129.55 E.01986
G1 X131.55 Y129.55 E.15182
G1 X131.45 Y129.45 E.00466
G1 X131.45 Y126.55 E.09622
G1 X136.55 Y121.45 E.23922
G1 X136.55 Y120.45 E.03317
G1 X135.921 Y120.45 E.02084
; CHANGE_LAYER
; Z_HEIGHT: 9.02759
; LAYER_HEIGHT: 0.027586
; WIPE_START
G1 F24000
G1 X136.55 Y120.45 E-.23876
G1 X136.55 Y121.45 E-.38
G1 X136.287 Y121.713 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 76/151
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
G3 Z9.4 I1.217 J0 P1  F30000
G1 X136.288 Y118.919 Z9.4
G1 Z9.028
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.275862
M73 P63 R7
G1 F1625
G1 X133.133 Y118.918 E.12793
G3 X134.143 Y118.109 I1.353 J.654 E.05427
G2 X134.069 Y117.637 I-.526 J-.16 E.02006
G3 X135.549 Y115.705 I1.394 J-.465 E.11625
G3 X136.728 Y117.941 I-.117 J1.491 E.12214
G2 X137.327 Y118.305 I.746 J-.552 E.02915
G3 X137.868 Y118.92 I-.842 J1.287 E.03359
G1 X136.348 Y118.919 E.06164
; WIPE_START
G1 F24000
G1 X134.348 Y118.919 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.428 I.199 J-1.201 P1  F30000
G1 X124.632 Y117.305 Z9.428
G1 Z9.028
G1 E.8 F1800
G1 F1625
G3 X123.152 Y115.731 I-1.479 J-.092 E.27941
G1 X123.244 Y115.734 E.00373
G3 X124.635 Y117.246 I-.091 J1.479 E.09205
; CHANGE_LAYER
; Z_HEIGHT: 9.2
; LAYER_HEIGHT: 0.172414
; WIPE_START
G1 F24000
G1 X124.474 Y117.843 E-.23481
G1 X124.15 Y118.293 E-.2107
G1 X123.686 Y118.591 E-.20959
G1 X123.413 Y118.635 E-.1049
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 77/151
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
G3 Z9.428 I-1.211 J.123 P1  F30000
G1 X123.898 Y123.398 Z9.428
G1 Z9.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1625
G1 X123.898 Y129.898 E.21562
G1 X121.102 Y129.898 E.09274
G1 X121.102 Y120.102 E.32495
G1 X136.898 Y120.102 E.52398
G1 X136.898 Y129.898 E.32495
G1 X131.102 Y129.898 E.19226
G1 X131.102 Y123.398 E.21562
G1 X123.958 Y123.398 E.23698
G1 X124.29 Y123.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1625
G1 X124.29 Y130.29 E.19973
G1 X120.71 Y130.29 E.11
G1 X120.71 Y119.71 E.32509
G1 X137.29 Y119.71 E.50946
G1 X137.29 Y130.29 E.32509
G1 X130.71 Y130.29 E.20219
G1 X130.71 Y123.79 E.19973
G1 X124.35 Y123.79 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X124.332 Y125.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.6 I.774 J-.939 P1  F30000
G1 X123.55 Y125.146 Z9.6
G1 Z9.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1625
G1 X123.55 Y126.774 E.05401
G1 X121.45 Y128.874 E.09848
G1 X121.45 Y127.126 E.05796
G1 X123.55 Y129.226 E.09848
G1 X123.55 Y129.55 E.01075
G1 X122.245 Y129.55 E.04327
G1 X121.45 Y122.826 F30000
G1 F1625
G1 X121.45 Y121.198 E.05401
G1 X122.198 Y120.45 E.03506
G1 X122.45 Y120.45 E.00838
G1 X125.05 Y123.05 E.12194
G1 X127.274 Y123.05 E.0738
G1 X129.874 Y120.45 E.12194
G1 X130.126 Y120.45 E.00838
G1 X136.55 Y126.874 E.30133
G1 X136.55 Y129.126 E.07472
G1 X136.126 Y129.55 E.01986
G1 X131.55 Y129.55 E.15182
G1 X131.45 Y129.45 E.00466
G1 X131.45 Y126.55 E.09622
G1 X136.55 Y121.45 E.23922
G1 X136.55 Y120.45 E.03317
G1 X135.921 Y120.45 E.02084
; CHANGE_LAYER
; Z_HEIGHT: 9.30345
; LAYER_HEIGHT: 0.103449
; WIPE_START
G1 F24000
G1 X136.55 Y120.45 E-.23876
G1 X136.55 Y121.45 E-.38
G1 X136.287 Y121.713 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 78/151
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
G3 Z9.6 I1.217 J0 P1  F30000
G1 X136.287 Y118.92 Z9.6
G1 Z9.303
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.275862
G1 F1622
G1 X133.159 Y118.92 E.12683
G3 X134.169 Y118.127 I1.331 J.655 E.05384
G2 X134.105 Y117.674 I-.481 J-.163 E.01924
G3 X135.56 Y115.775 I1.37 J-.457 E.1143
G3 X136.725 Y117.965 I-.115 J1.466 E.11971
G2 X137.314 Y118.326 I.728 J-.528 E.02875
G3 X137.841 Y118.92 I-.783 J1.226 E.0326
G1 X136.347 Y118.92 E.06058
; WIPE_START
G1 F24000
G1 X134.347 Y118.92 E-.76
; WIPE_END
M73 P64 R7
G1 E-.04 F1800
G17
G3 Z9.703 I.193 J-1.201 P1  F30000
G1 X124.601 Y117.35 Z9.703
G1 Z9.303
G1 E.8 F1800
G1 F1622
G3 X123.145 Y115.803 I-1.454 J-.09 E.27477
G1 X123.236 Y115.806 E.00367
G3 X124.604 Y117.292 I-.089 J1.455 E.09048
; CHANGE_LAYER
; Z_HEIGHT: 9.4
; LAYER_HEIGHT: 0.0965509
; WIPE_START
G1 F24000
G1 X124.445 Y117.879 E-.23132
G1 X124.126 Y118.322 E-.20727
G1 X123.669 Y118.615 E-.20619
G1 X123.37 Y118.663 E-.11522
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 79/151
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
G3 Z9.703 I-1.209 J.135 P1  F30000
G1 X123.898 Y123.398 Z9.703
G1 Z9.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1622
G1 X123.898 Y129.898 E.21562
G1 X121.102 Y129.898 E.09274
G1 X121.102 Y120.102 E.32495
G1 X136.898 Y120.102 E.52398
G1 X136.898 Y129.898 E.32495
G1 X131.102 Y129.898 E.19226
G1 X131.102 Y123.398 E.21562
G1 X123.958 Y123.398 E.23698
G1 X124.29 Y123.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1622
G1 X124.29 Y130.29 E.19973
G1 X120.71 Y130.29 E.11
G1 X120.71 Y119.71 E.32509
G1 X137.29 Y119.71 E.50946
G1 X137.29 Y130.29 E.32509
G1 X130.71 Y130.29 E.20219
G1 X130.71 Y123.79 E.19973
G1 X124.35 Y123.79 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X124.332 Y125.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.8 I.774 J-.939 P1  F30000
G1 X123.55 Y125.146 Z9.8
G1 Z9.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1622
G1 X123.55 Y126.774 E.05401
G1 X121.45 Y128.874 E.09848
G1 X121.45 Y127.126 E.05796
G1 X123.55 Y129.226 E.09848
G1 X123.55 Y129.55 E.01075
G1 X122.245 Y129.55 E.04327
G1 X121.45 Y122.826 F30000
G1 F1622
G1 X121.45 Y121.198 E.05401
G1 X122.198 Y120.45 E.03506
G1 X122.45 Y120.45 E.00838
G1 X125.05 Y123.05 E.12194
G1 X127.274 Y123.05 E.0738
G1 X129.874 Y120.45 E.12194
G1 X130.126 Y120.45 E.00838
G1 X136.55 Y126.874 E.30133
G1 X136.55 Y129.126 E.07472
G1 X136.126 Y129.55 E.01986
G1 X131.55 Y129.55 E.15182
G1 X131.45 Y129.45 E.00466
G1 X131.45 Y126.55 E.09622
G1 X136.55 Y121.45 E.23922
G1 X136.55 Y120.45 E.03317
G1 X135.921 Y120.45 E.02084
; CHANGE_LAYER
; Z_HEIGHT: 9.57931
; LAYER_HEIGHT: 0.179311
; WIPE_START
G1 F24000
G1 X136.55 Y120.45 E-.23876
G1 X136.55 Y121.45 E-.38
G1 X136.287 Y121.713 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 80/151
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
G3 Z9.8 I1.217 J0 P1  F30000
G1 X136.287 Y118.92 Z9.8
G1 Z9.579
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.275862
G1 F1619
G1 X133.186 Y118.92 E.12573
G3 X134.191 Y118.151 I1.274 J.625 E.05315
G2 X134.142 Y117.71 I-.42 J-.177 E.01882
G3 X135.572 Y115.844 I1.345 J-.45 E.11235
G3 X136.722 Y117.989 I-.112 J1.441 E.11736
G2 X137.301 Y118.346 I.709 J-.503 E.02833
G3 X137.814 Y118.92 I-.768 J1.203 E.03158
G1 X136.347 Y118.92 E.05948
; WIPE_START
G1 F24000
G1 X134.347 Y118.92 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.979 I.188 J-1.202 P1  F30000
G1 X124.569 Y117.395 Z9.979
G1 Z9.579
G1 E.8 F1800
G1 F1619
G3 X123.138 Y115.874 I-1.43 J-.088 E.27015
G1 X123.227 Y115.877 E.0036
G3 X124.572 Y117.336 I-.087 J1.43 E.08891
; CHANGE_LAYER
; Z_HEIGHT: 9.6
; LAYER_HEIGHT: 0.02069
; WIPE_START
G1 F24000
G1 X124.415 Y117.915 E-.22787
G1 X124.101 Y118.35 E-.20384
G1 X123.652 Y118.638 E-.20279
G1 X123.326 Y118.691 E-.12549
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 81/151
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
G3 Z9.979 I-1.208 J.147 P1  F30000
G1 X123.898 Y123.398 Z9.979
G1 Z9.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1619
G1 X123.898 Y129.898 E.21562
G1 X121.102 Y129.898 E.09274
G1 X121.102 Y120.102 E.32495
G1 X136.898 Y120.102 E.52398
G1 X136.898 Y129.898 E.32495
G1 X131.102 Y129.898 E.19226
G1 X131.102 Y123.398 E.21562
G1 X123.958 Y123.398 E.23698
G1 X124.29 Y123.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1619
G1 X124.29 Y130.29 E.19973
G1 X120.71 Y130.29 E.11
G1 X120.71 Y119.71 E.32509
G1 X137.29 Y119.71 E.50946
G1 X137.29 Y130.29 E.32509
G1 X130.71 Y130.29 E.20219
G1 X130.71 Y123.79 E.19973
G1 X124.35 Y123.79 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X124.332 Y125.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10 I.774 J-.939 P1  F30000
G1 X123.55 Y125.146 Z10
G1 Z9.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1619
G1 X123.55 Y126.774 E.05401
G1 X121.45 Y128.874 E.09848
G1 X121.45 Y127.126 E.05796
G1 X123.55 Y129.226 E.09848
G1 X123.55 Y129.55 E.01075
G1 X122.245 Y129.55 E.04327
G1 X121.45 Y122.826 F30000
G1 F1619
G1 X121.45 Y121.198 E.05401
G1 X122.198 Y120.45 E.03506
G1 X122.45 Y120.45 E.00838
G1 X125.05 Y123.05 E.12194
G1 X127.274 Y123.05 E.0738
G1 X129.874 Y120.45 E.12194
G1 X130.126 Y120.45 E.00838
G1 X136.55 Y126.874 E.30133
G1 X136.55 Y129.126 E.07472
G1 X136.126 Y129.55 E.01986
G1 X131.55 Y129.55 E.15182
G1 X131.45 Y129.45 E.00466
G1 X131.45 Y126.55 E.09622
G1 X136.55 Y121.45 E.23922
M73 P65 R7
G1 X136.55 Y120.45 E.03317
G1 X135.921 Y120.45 E.02084
; CHANGE_LAYER
; Z_HEIGHT: 9.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X136.55 Y120.45 E-.23876
G1 X136.55 Y121.45 E-.38
G1 X136.287 Y121.713 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 82/151
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
G3 Z10 I-.164 J-1.206 P1  F30000
G1 X123.898 Y123.398 Z10
G1 Z9.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1414
G1 X123.898 Y129.898 E.21562
G1 X121.102 Y129.898 E.09274
G1 X121.102 Y120.102 E.32495
G1 X136.898 Y120.102 E.52398
G1 X136.898 Y129.898 E.32495
G1 X131.102 Y129.898 E.19226
G1 X131.102 Y123.398 E.21562
G1 X123.958 Y123.398 E.23698
G1 X124.29 Y123.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1414
G1 X124.29 Y130.29 E.19973
G1 X120.71 Y130.29 E.11
G1 X120.71 Y119.71 E.32509
G1 X137.29 Y119.71 E.50946
G1 X137.29 Y130.29 E.32509
G1 X130.71 Y130.29 E.20219
G1 X130.71 Y123.79 E.19973
G1 X124.35 Y123.79 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X124.332 Y125.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.2 I.774 J-.939 P1  F30000
G1 X123.55 Y125.146 Z10.2
G1 Z9.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1414
G1 X123.55 Y126.774 E.05401
G1 X121.45 Y128.874 E.09848
G1 X121.45 Y127.126 E.05796
G1 X123.55 Y129.226 E.09848
G1 X123.55 Y129.55 E.01075
G1 X122.245 Y129.55 E.04327
G1 X121.45 Y122.826 F30000
G1 F1414
G1 X121.45 Y121.198 E.05401
G1 X122.198 Y120.45 E.03506
G1 X122.45 Y120.45 E.00838
G1 X125.05 Y123.05 E.12194
G1 X127.274 Y123.05 E.0738
G1 X129.874 Y120.45 E.12194
G1 X130.126 Y120.45 E.00838
G1 X136.55 Y126.874 E.30133
G1 X136.55 Y129.126 E.07472
G1 X136.126 Y129.55 E.01986
G1 X131.55 Y129.55 E.15182
G1 X131.45 Y129.45 E.00466
G1 X131.45 Y126.55 E.09622
G1 X136.55 Y121.45 E.23922
G1 X136.55 Y120.45 E.03317
G1 X135.921 Y120.45 E.02084
; CHANGE_LAYER
; Z_HEIGHT: 9.85517
; LAYER_HEIGHT: 0.055172
; WIPE_START
G1 F24000
G1 X136.55 Y120.45 E-.23876
G1 X136.55 Y121.45 E-.38
G1 X136.287 Y121.713 E-.14124
; WIPE_END
M73 P65 R6
G1 E-.04 F1800
; layer num/total_layer_count: 83/151
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
G3 Z10.2 I1.217 J0 P1  F30000
G1 X136.287 Y118.92 Z10.2
G1 Z9.855
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.275862
G1 F1616
G1 X133.213 Y118.92 E.12463
G3 X134.221 Y118.169 I1.251 J.627 E.05283
G2 X134.136 Y117.572 I-.736 J-.199 E.02514
G3 X135.585 Y115.911 I1.364 J-.273 E.10323
G3 X136.72 Y118.014 I-.11 J1.417 E.11508
G2 X137.288 Y118.367 I.689 J-.475 E.02789
G3 X137.787 Y118.92 I-.754 J1.181 E.03056
M73 P66 R6
G1 X136.347 Y118.92 E.05838
; WIPE_START
G1 F24000
G1 X134.347 Y118.92 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.255 I.182 J-1.203 P1  F30000
G1 X124.537 Y117.438 Z10.255
G1 Z9.855
G1 E.8 F1800
G1 F1616
G3 X123.129 Y115.944 I-1.406 J-.086 E.26554
G1 X123.217 Y115.946 E.00354
G3 X124.539 Y117.379 I-.085 J1.406 E.08736
; CHANGE_LAYER
; Z_HEIGHT: 10
; LAYER_HEIGHT: 0.144828
; WIPE_START
G1 F24000
G1 X124.384 Y117.949 E-.22444
G1 X124.076 Y118.377 E-.20043
G1 X123.635 Y118.661 E-.19941
G1 X123.282 Y118.718 E-.13573
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 84/151
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
G3 Z10.255 I-1.207 J.159 P1  F30000
G1 X123.898 Y123.398 Z10.255
G1 Z10
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1616
G1 X123.898 Y129.898 E.21562
G1 X121.102 Y129.898 E.09274
G1 X121.102 Y120.102 E.32495
G1 X136.898 Y120.102 E.52398
G1 X136.898 Y129.898 E.32495
G1 X131.102 Y129.898 E.19226
G1 X131.102 Y123.398 E.21562
G1 X123.958 Y123.398 E.23698
G1 X124.29 Y123.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1616
G1 X124.29 Y130.29 E.19973
G1 X120.71 Y130.29 E.11
G1 X120.71 Y119.71 E.32509
G1 X137.29 Y119.71 E.50946
G1 X137.29 Y130.29 E.32509
G1 X130.71 Y130.29 E.20219
G1 X130.71 Y123.79 E.19973
G1 X124.35 Y123.79 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X124.332 Y125.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.4 I.774 J-.939 P1  F30000
G1 X123.55 Y125.146 Z10.4
G1 Z10
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1616
G1 X123.55 Y126.774 E.05401
G1 X121.45 Y128.874 E.09848
G1 X121.45 Y127.126 E.05796
G1 X123.55 Y129.226 E.09848
G1 X123.55 Y129.55 E.01075
G1 X122.245 Y129.55 E.04327
G1 X121.45 Y122.826 F30000
G1 F1616
G1 X121.45 Y121.198 E.05401
G1 X122.198 Y120.45 E.03506
G1 X122.45 Y120.45 E.00838
G1 X125.05 Y123.05 E.12194
G1 X127.274 Y123.05 E.0738
G1 X129.874 Y120.45 E.12194
G1 X130.126 Y120.45 E.00838
G1 X136.55 Y126.874 E.30133
G1 X136.55 Y129.126 E.07472
G1 X136.126 Y129.55 E.01986
G1 X131.55 Y129.55 E.15182
G1 X131.45 Y129.45 E.00466
G1 X131.45 Y126.55 E.09622
G1 X136.55 Y121.45 E.23922
G1 X136.55 Y120.45 E.03317
G1 X135.921 Y120.45 E.02084
; CHANGE_LAYER
; Z_HEIGHT: 10.131
; LAYER_HEIGHT: 0.131035
; WIPE_START
G1 F24000
G1 X136.55 Y120.45 E-.23876
G1 X136.55 Y121.45 E-.38
G1 X136.287 Y121.713 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 85/151
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
G3 Z10.4 I1.217 J0 P1  F30000
G1 X136.287 Y118.92 Z10.4
G1 Z10.131
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.275862
G1 F1613
G1 X133.241 Y118.92 E.12353
G3 X134.253 Y118.187 I1.229 J.632 E.0526
G2 X134.162 Y117.522 I-.819 J-.226 E.02796
G3 X135.6 Y115.977 I1.356 J-.18 E.09779
G3 X136.719 Y118.038 I-.107 J1.392 E.11288
G2 X137.046 Y118.27 I.353 J-.152 E.01708
G3 X137.759 Y118.92 I-.53 J1.299 E.03995
G1 X136.347 Y118.92 E.05728
; WIPE_START
G1 F24000
G1 X134.347 Y118.92 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.531 I.176 J-1.204 P1  F30000
G1 X124.504 Y117.481 Z10.531
G1 Z10.131
G1 E.8 F1800
G1 F1613
G3 X123.12 Y116.013 I-1.381 J-.084 E.26096
G1 X123.206 Y116.015 E.00348
G3 X124.506 Y117.422 I-.084 J1.381 E.0858
; CHANGE_LAYER
; Z_HEIGHT: 10.2
; LAYER_HEIGHT: 0.068965
; WIPE_START
G1 F24000
G1 X124.353 Y117.983 E-.22102
G1 X124.05 Y118.404 E-.19704
G1 X123.616 Y118.683 E-.19603
G1 X123.237 Y118.744 E-.14591
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 86/151
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
G3 Z10.531 I-1.205 J.171 P1  F30000
G1 X123.898 Y123.398 Z10.531
G1 Z10.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1613
G1 X123.898 Y129.898 E.21562
G1 X121.102 Y129.898 E.09274
G1 X121.102 Y120.102 E.32495
G1 X136.898 Y120.102 E.52398
G1 X136.898 Y129.898 E.32495
G1 X131.102 Y129.898 E.19226
G1 X131.102 Y123.398 E.21562
G1 X123.958 Y123.398 E.23698
G1 X124.29 Y123.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1613
G1 X124.29 Y130.29 E.19973
G1 X120.71 Y130.29 E.11
G1 X120.71 Y119.71 E.32509
G1 X137.29 Y119.71 E.50946
G1 X137.29 Y130.29 E.32509
G1 X130.71 Y130.29 E.20219
G1 X130.71 Y123.79 E.19973
G1 X124.35 Y123.79 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X124.332 Y125.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.6 I.774 J-.939 P1  F30000
G1 X123.55 Y125.146 Z10.6
M73 P67 R6
G1 Z10.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1613
G1 X123.55 Y126.774 E.05401
G1 X121.45 Y128.874 E.09848
G1 X121.45 Y127.126 E.05796
G1 X123.55 Y129.226 E.09848
G1 X123.55 Y129.55 E.01075
G1 X122.245 Y129.55 E.04327
G1 X121.45 Y122.826 F30000
G1 F1613
G1 X121.45 Y121.198 E.05401
G1 X122.198 Y120.45 E.03506
G1 X122.45 Y120.45 E.00838
G1 X125.05 Y123.05 E.12194
G1 X127.274 Y123.05 E.0738
G1 X129.874 Y120.45 E.12194
G1 X130.126 Y120.45 E.00838
G1 X136.55 Y126.874 E.30133
G1 X136.55 Y129.126 E.07472
G1 X136.126 Y129.55 E.01986
G1 X131.55 Y129.55 E.15182
G1 X131.45 Y129.45 E.00466
G1 X131.45 Y126.55 E.09622
G1 X136.55 Y121.45 E.23922
G1 X136.55 Y120.45 E.03317
G1 X135.921 Y120.45 E.02084
; CHANGE_LAYER
; Z_HEIGHT: 10.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X136.55 Y120.45 E-.23876
G1 X136.55 Y121.45 E-.38
G1 X136.287 Y121.713 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 87/151
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
G3 Z10.6 I-.164 J-1.206 P1  F30000
G1 X123.898 Y123.398 Z10.6
G1 Z10.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1414
G1 X123.898 Y129.898 E.21562
G1 X121.102 Y129.898 E.09274
G1 X121.102 Y120.102 E.32495
G1 X136.898 Y120.102 E.52398
G1 X136.898 Y129.898 E.32495
G1 X131.102 Y129.898 E.19226
G1 X131.102 Y123.398 E.21562
G1 X123.958 Y123.398 E.23698
G1 X124.29 Y123.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1414
G1 X124.29 Y130.29 E.19973
G1 X120.71 Y130.29 E.11
G1 X120.71 Y119.71 E.32509
G1 X137.29 Y119.71 E.50946
G1 X137.29 Y130.29 E.32509
G1 X130.71 Y130.29 E.20219
G1 X130.71 Y123.79 E.19973
G1 X124.35 Y123.79 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X124.332 Y125.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.8 I.774 J-.939 P1  F30000
G1 X123.55 Y125.146 Z10.8
G1 Z10.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1414
G1 X123.55 Y126.774 E.05401
G1 X121.45 Y128.874 E.09848
G1 X121.45 Y127.126 E.05796
G1 X123.55 Y129.226 E.09848
G1 X123.55 Y129.55 E.01075
G1 X122.245 Y129.55 E.04327
G1 X121.45 Y122.826 F30000
G1 F1414
G1 X121.45 Y121.198 E.05401
G1 X122.198 Y120.45 E.03506
G1 X122.45 Y120.45 E.00838
G1 X125.05 Y123.05 E.12194
G1 X127.274 Y123.05 E.0738
G1 X129.874 Y120.45 E.12194
G1 X130.126 Y120.45 E.00838
G1 X136.55 Y126.874 E.30133
G1 X136.55 Y129.126 E.07472
G1 X136.126 Y129.55 E.01986
G1 X131.55 Y129.55 E.15182
G1 X131.45 Y129.45 E.00466
G1 X131.45 Y126.55 E.09622
G1 X136.55 Y121.45 E.23922
G1 X136.55 Y120.45 E.03317
G1 X135.921 Y120.45 E.02084
; CHANGE_LAYER
; Z_HEIGHT: 10.4069
; LAYER_HEIGHT: 0.00689697
; WIPE_START
G1 F24000
G1 X136.55 Y120.45 E-.23876
G1 X136.55 Y121.45 E-.38
G1 X136.287 Y121.713 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 88/151
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
G3 Z10.8 I1.217 J0 P1  F30000
G1 X136.287 Y118.92 Z10.8
G1 Z10.407
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.275862
G1 F1611
G1 X133.268 Y118.92 E.12244
G3 X134.287 Y118.204 I1.209 J.638 E.05245
G1 X134.362 Y118.044 E.00717
G3 X135.617 Y116.042 I1.176 J-.657 E.11685
G3 X136.719 Y118.063 I-.105 J1.368 E.11075
M73 P68 R6
G1 X136.794 Y118.222 E.00714
G3 X137.732 Y118.92 I-.255 J1.322 E.04904
G1 X136.347 Y118.92 E.05619
; WIPE_START
G1 F24000
G1 X134.347 Y118.92 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.807 I.17 J-1.205 P1  F30000
G1 X124.47 Y117.524 Z10.807
G1 Z10.407
G1 E.8 F1800
G1 F1611
G3 X123.11 Y116.081 I-1.357 J-.083 E.2564
G1 X123.195 Y116.084 E.00342
G3 X124.472 Y117.465 I-.082 J1.357 E.08426
; CHANGE_LAYER
; Z_HEIGHT: 10.6
; LAYER_HEIGHT: 0.193104
; WIPE_START
G1 F24000
G1 X124.321 Y118.017 E-.21764
G1 X124.023 Y118.431 E-.19365
G1 X123.596 Y118.705 E-.19266
G1 X123.191 Y118.771 E-.15605
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 89/151
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
G3 Z10.807 I-1.203 J.184 P1  F30000
G1 X123.898 Y123.398 Z10.807
G1 Z10.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1611
G1 X123.898 Y129.898 E.21562
G1 X121.102 Y129.898 E.09274
G1 X121.102 Y120.102 E.32495
G1 X136.898 Y120.102 E.52398
G1 X136.898 Y129.898 E.32495
G1 X131.102 Y129.898 E.19226
G1 X131.102 Y123.398 E.21562
G1 X123.958 Y123.398 E.23698
G1 X124.29 Y123.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1611
G1 X124.29 Y130.29 E.19973
G1 X120.71 Y130.29 E.11
G1 X120.71 Y119.71 E.32509
G1 X137.29 Y119.71 E.50946
G1 X137.29 Y130.29 E.32509
G1 X130.71 Y130.29 E.20219
G1 X130.71 Y123.79 E.19973
G1 X124.35 Y123.79 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X124.332 Y125.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11 I.774 J-.939 P1  F30000
G1 X123.55 Y125.146 Z11
G1 Z10.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1611
G1 X123.55 Y126.774 E.05401
G1 X121.45 Y128.874 E.09848
G1 X121.45 Y127.126 E.05796
G1 X123.55 Y129.226 E.09848
G1 X123.55 Y129.55 E.01075
G1 X122.245 Y129.55 E.04327
G1 X121.45 Y122.826 F30000
G1 F1611
G1 X121.45 Y121.198 E.05401
G1 X122.198 Y120.45 E.03506
G1 X122.45 Y120.45 E.00838
G1 X125.05 Y123.05 E.12194
G1 X127.274 Y123.05 E.0738
G1 X129.874 Y120.45 E.12194
G1 X130.126 Y120.45 E.00838
G1 X136.55 Y126.874 E.30133
G1 X136.55 Y129.126 E.07472
G1 X136.126 Y129.55 E.01986
G1 X131.55 Y129.55 E.15182
G1 X131.45 Y129.45 E.00466
G1 X131.45 Y126.55 E.09622
G1 X136.55 Y121.45 E.23922
G1 X136.55 Y120.45 E.03317
G1 X135.921 Y120.45 E.02084
; CHANGE_LAYER
; Z_HEIGHT: 10.6828
; LAYER_HEIGHT: 0.0827579
; WIPE_START
G1 F24000
G1 X136.55 Y120.45 E-.23876
G1 X136.55 Y121.45 E-.38
G1 X136.287 Y121.713 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 90/151
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
G3 Z11 I1.217 J.004 P1  F30000
G1 X136.295 Y118.915 Z11
G1 Z10.683
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.275862
G1 F1608
G1 X133.302 Y118.906 E.12141
G3 X134.314 Y118.229 I1.163 J.643 E.0513
G2 X134.279 Y117.759 I-.467 J-.202 E.0199
G3 X135.635 Y116.105 I1.275 J-.337 E.10111
G3 X136.721 Y118.085 I-.103 J1.344 E.10855
G2 X137.104 Y118.348 I.461 J-.261 E.0195
G3 X137.705 Y118.92 I-.568 J1.2 E.03422
G1 X136.355 Y118.916 E.05474
; WIPE_START
G1 F24000
G1 X134.355 Y118.909 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.083 I.163 J-1.206 P1  F30000
G1 X124.435 Y117.566 Z11.083
G1 Z10.683
G1 E.8 F1800
G1 F1608
G3 X123.099 Y116.15 I-1.333 J-.081 E.25186
G1 X123.182 Y116.152 E.00336
G3 X124.438 Y117.507 I-.08 J1.333 E.08272
; CHANGE_LAYER
; Z_HEIGHT: 10.8
; LAYER_HEIGHT: 0.117242
; WIPE_START
G1 F24000
G1 X124.288 Y118.051 E-.21428
G1 X123.995 Y118.457 E-.19029
G1 X123.576 Y118.726 E-.1893
G1 X123.144 Y118.797 E-.16613
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 91/151
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
G3 Z11.083 I-1.201 J.197 P1  F30000
G1 X123.898 Y123.398 Z11.083
G1 Z10.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1608
G1 X123.898 Y129.898 E.21562
G1 X121.102 Y129.898 E.09274
G1 X121.102 Y120.102 E.32495
G1 X136.898 Y120.102 E.52398
M73 P69 R6
G1 X136.898 Y129.898 E.32495
G1 X131.102 Y129.898 E.19226
G1 X131.102 Y123.398 E.21562
G1 X123.958 Y123.398 E.23698
G1 X124.29 Y123.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1608
G1 X124.29 Y130.29 E.19973
G1 X120.71 Y130.29 E.11
G1 X120.71 Y119.71 E.32509
G1 X137.29 Y119.71 E.50946
G1 X137.29 Y130.29 E.32509
G1 X130.71 Y130.29 E.20219
G1 X130.71 Y123.79 E.19973
G1 X124.35 Y123.79 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X124.332 Y125.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.2 I.774 J-.939 P1  F30000
G1 X123.55 Y125.146 Z11.2
G1 Z10.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1608
G1 X123.55 Y126.774 E.05401
G1 X121.45 Y128.874 E.09848
G1 X121.45 Y127.126 E.05796
G1 X123.55 Y129.226 E.09848
G1 X123.55 Y129.55 E.01075
G1 X122.245 Y129.55 E.04327
G1 X121.45 Y122.826 F30000
G1 F1608
G1 X121.45 Y121.198 E.05401
G1 X122.198 Y120.45 E.03506
G1 X122.45 Y120.45 E.00838
G1 X125.05 Y123.05 E.12194
G1 X127.274 Y123.05 E.0738
G1 X129.874 Y120.45 E.12194
G1 X130.126 Y120.45 E.00838
G1 X136.55 Y126.874 E.30133
G1 X136.55 Y129.126 E.07472
G1 X136.126 Y129.55 E.01986
G1 X131.55 Y129.55 E.15182
G1 X131.45 Y129.45 E.00466
G1 X131.45 Y126.55 E.09622
G1 X136.55 Y121.45 E.23922
G1 X136.55 Y120.45 E.03317
G1 X135.921 Y120.45 E.02084
; CHANGE_LAYER
; Z_HEIGHT: 10.9586
; LAYER_HEIGHT: 0.158621
; WIPE_START
G1 F24000
G1 X136.55 Y120.45 E-.23876
G1 X136.55 Y121.45 E-.38
G1 X136.287 Y121.713 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 92/151
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
G3 Z11.2 I1.217 J0 P1  F30000
G1 X136.288 Y118.919 Z11.2
G1 Z10.959
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.275862
G1 F1605
G1 X133.323 Y118.918 E.12025
G3 X134.353 Y118.248 I1.148 J.638 E.05187
G2 X134.324 Y117.79 I-.44 J-.201 E.01936
G3 X135.654 Y116.168 I1.251 J-.331 E.09925
G3 X136.723 Y118.111 I-.1 J1.32 E.10654
G2 X137.094 Y118.37 I.445 J-.242 E.01903
G3 X137.678 Y118.92 I-.56 J1.181 E.03308
G1 X136.348 Y118.919 E.05395
; WIPE_START
G1 F24000
G1 X134.348 Y118.918 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.359 I.159 J-1.207 P1  F30000
G1 X124.4 Y117.609 Z11.359
G1 Z10.959
G1 E.8 F1800
G1 F1605
G3 X123.087 Y116.218 I-1.309 J-.079 E.24735
G1 X123.169 Y116.221 E.0033
G3 X124.402 Y117.55 I-.078 J1.309 E.08119
; CHANGE_LAYER
; Z_HEIGHT: 11
; LAYER_HEIGHT: 0.041379
; WIPE_START
G1 F24000
G1 X124.253 Y118.085 E-.21096
G1 X123.966 Y118.484 E-.18693
G1 X123.554 Y118.748 E-.18595
G1 X123.097 Y118.823 E-.17616
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 93/151
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
G3 Z11.359 I-1.199 J.21 P1  F30000
G1 X123.898 Y123.398 Z11.359
G1 Z11
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1605
G1 X123.898 Y129.898 E.21562
G1 X121.102 Y129.898 E.09274
G1 X121.102 Y120.102 E.32495
G1 X136.898 Y120.102 E.52398
G1 X136.898 Y129.898 E.32495
G1 X131.102 Y129.898 E.19226
G1 X131.102 Y123.398 E.21562
G1 X123.958 Y123.398 E.23698
G1 X124.29 Y123.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1605
G1 X124.29 Y130.29 E.19973
G1 X120.71 Y130.29 E.11
G1 X120.71 Y119.71 E.32509
G1 X137.29 Y119.71 E.50946
G1 X137.29 Y130.29 E.32509
G1 X130.71 Y130.29 E.20219
G1 X130.71 Y123.79 E.19973
G1 X124.35 Y123.79 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X124.332 Y125.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.4 I.774 J-.939 P1  F30000
G1 X123.55 Y125.146 Z11.4
G1 Z11
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1605
G1 X123.55 Y126.774 E.05401
G1 X121.45 Y128.874 E.09848
G1 X121.45 Y127.126 E.05796
G1 X123.55 Y129.226 E.09848
G1 X123.55 Y129.55 E.01075
G1 X122.245 Y129.55 E.04327
G1 X121.45 Y122.826 F30000
G1 F1605
G1 X121.45 Y121.198 E.05401
G1 X122.198 Y120.45 E.03506
G1 X122.45 Y120.45 E.00838
G1 X125.05 Y123.05 E.12194
G1 X127.274 Y123.05 E.0738
G1 X129.874 Y120.45 E.12194
G1 X130.126 Y120.45 E.00838
G1 X136.55 Y126.874 E.30133
G1 X136.55 Y129.126 E.07472
G1 X136.126 Y129.55 E.01986
G1 X131.55 Y129.55 E.15182
G1 X131.45 Y129.45 E.00466
G1 X131.45 Y126.55 E.09622
G1 X136.55 Y121.45 E.23922
G1 X136.55 Y120.45 E.03317
G1 X135.921 Y120.45 E.02084
; CHANGE_LAYER
; Z_HEIGHT: 11.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X136.55 Y120.45 E-.23876
G1 X136.55 Y121.45 E-.38
G1 X136.287 Y121.713 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 94/151
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
G3 Z11.4 I-.164 J-1.206 P1  F30000
M73 P70 R6
G1 X123.898 Y123.398 Z11.4
G1 Z11.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1414
G1 X123.898 Y129.898 E.21562
G1 X121.102 Y129.898 E.09274
G1 X121.102 Y120.102 E.32495
G1 X136.898 Y120.102 E.52398
G1 X136.898 Y129.898 E.32495
G1 X131.102 Y129.898 E.19226
G1 X131.102 Y123.398 E.21562
G1 X123.958 Y123.398 E.23698
G1 X124.29 Y123.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1414
G1 X124.29 Y130.29 E.19973
G1 X120.71 Y130.29 E.11
G1 X120.71 Y119.71 E.32509
G1 X137.29 Y119.71 E.50946
G1 X137.29 Y130.29 E.32509
G1 X130.71 Y130.29 E.20219
G1 X130.71 Y123.79 E.19973
G1 X124.35 Y123.79 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X124.332 Y125.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.6 I.774 J-.939 P1  F30000
G1 X123.55 Y125.146 Z11.6
G1 Z11.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1414
G1 X123.55 Y126.774 E.05401
G1 X121.45 Y128.874 E.09848
G1 X121.45 Y127.126 E.05796
G1 X123.55 Y129.226 E.09848
G1 X123.55 Y129.55 E.01075
G1 X122.245 Y129.55 E.04327
G1 X121.45 Y122.826 F30000
G1 F1414
G1 X121.45 Y121.198 E.05401
G1 X122.198 Y120.45 E.03506
G1 X122.45 Y120.45 E.00838
G1 X125.05 Y123.05 E.12194
G1 X127.274 Y123.05 E.0738
G1 X129.874 Y120.45 E.12194
G1 X130.126 Y120.45 E.00838
G1 X136.55 Y126.874 E.30133
G1 X136.55 Y129.126 E.07472
G1 X136.126 Y129.55 E.01986
G1 X131.55 Y129.55 E.15182
G1 X131.45 Y129.45 E.00466
G1 X131.45 Y126.55 E.09622
G1 X136.55 Y121.45 E.23922
G1 X136.55 Y120.45 E.03317
G1 X135.921 Y120.45 E.02084
; CHANGE_LAYER
; Z_HEIGHT: 11.2345
; LAYER_HEIGHT: 0.034483
; WIPE_START
G1 F24000
G1 X136.55 Y120.45 E-.23876
G1 X136.55 Y121.45 E-.38
G1 X136.287 Y121.713 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 95/151
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
M73 P70 R5
G3 Z11.6 I1.217 J0 P1  F30000
G1 X136.287 Y118.92 Z11.6
G1 Z11.234
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.275862
G1 F1602
G1 X133.35 Y118.92 E.11911
G3 X134.387 Y118.272 I1.12 J.64 E.05166
G2 X134.37 Y117.821 I-.393 J-.211 E.01919
G3 X135.676 Y116.23 I1.226 J-.325 E.09739
G3 X136.726 Y118.136 I-.098 J1.296 E.10459
G2 X137.083 Y118.392 I.428 J-.221 E.01851
G3 X137.65 Y118.92 I-.577 J1.188 E.03189
G1 X136.347 Y118.92 E.05286
; WIPE_START
G1 F24000
G1 X134.347 Y118.92 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.634 I.153 J-1.207 P1  F30000
G1 X124.363 Y117.652 Z11.634
G1 Z11.234
G1 E.8 F1800
G1 F1602
G3 X123.074 Y116.287 I-1.286 J-.077 E.24285
G1 X123.154 Y116.289 E.00324
G3 X124.366 Y117.593 I-.076 J1.286 E.07966
; CHANGE_LAYER
; Z_HEIGHT: 11.4
; LAYER_HEIGHT: 0.165517
; WIPE_START
G1 F24000
G1 X124.218 Y118.119 E-.20766
G1 X123.936 Y118.511 E-.1836
M73 P71 R5
G1 X123.531 Y118.771 E-.1826
G1 X123.048 Y118.85 E-.18614
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 96/151
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
G3 Z11.634 I-1.196 J.224 P1  F30000
G1 X123.898 Y123.398 Z11.634
G1 Z11.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1602
G1 X123.898 Y129.898 E.21562
G1 X121.102 Y129.898 E.09274
G1 X121.102 Y120.102 E.32495
G1 X136.898 Y120.102 E.52398
G1 X136.898 Y129.898 E.32495
G1 X131.102 Y129.898 E.19226
G1 X131.102 Y123.398 E.21562
G1 X123.958 Y123.398 E.23698
G1 X124.29 Y123.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1602
G1 X124.29 Y130.29 E.19973
G1 X120.71 Y130.29 E.11
G1 X120.71 Y119.71 E.32509
G1 X137.29 Y119.71 E.50946
G1 X137.29 Y130.29 E.32509
G1 X130.71 Y130.29 E.20219
G1 X130.71 Y123.79 E.19973
G1 X124.35 Y123.79 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X124.332 Y125.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.8 I.774 J-.939 P1  F30000
G1 X123.55 Y125.146 Z11.8
G1 Z11.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1602
G1 X123.55 Y126.774 E.05401
G1 X121.45 Y128.874 E.09848
G1 X121.45 Y127.126 E.05796
G1 X123.55 Y129.226 E.09848
G1 X123.55 Y129.55 E.01075
G1 X122.245 Y129.55 E.04327
G1 X121.45 Y122.826 F30000
G1 F1602
G1 X121.45 Y121.198 E.05401
G1 X122.198 Y120.45 E.03506
G1 X122.45 Y120.45 E.00838
G1 X125.05 Y123.05 E.12194
G1 X127.274 Y123.05 E.0738
G1 X129.874 Y120.45 E.12194
G1 X130.126 Y120.45 E.00838
G1 X136.55 Y126.874 E.30133
G1 X136.55 Y129.126 E.07472
G1 X136.126 Y129.55 E.01986
G1 X131.55 Y129.55 E.15182
G1 X131.45 Y129.45 E.00466
G1 X131.45 Y126.55 E.09622
G1 X136.55 Y121.45 E.23922
G1 X136.55 Y120.45 E.03317
G1 X135.921 Y120.45 E.02084
; CHANGE_LAYER
; Z_HEIGHT: 11.5103
; LAYER_HEIGHT: 0.110345
; WIPE_START
G1 F24000
G1 X136.55 Y120.45 E-.23876
G1 X136.55 Y121.45 E-.38
G1 X136.287 Y121.713 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 97/151
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
G3 Z11.8 I1.217 J0 P1  F30000
G1 X136.287 Y118.92 Z11.8
G1 Z11.51
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.275862
G1 F1600
G1 X133.378 Y118.92 E.11797
G3 X134.43 Y118.292 I1.097 J.644 E.05185
G2 X134.417 Y117.852 I-.374 J-.209 E.01877
G3 X135.699 Y116.291 I1.202 J-.319 E.09554
G3 X136.73 Y118.163 I-.096 J1.273 E.10268
G2 X137.073 Y118.413 I.409 J-.2 E.01793
G3 X137.622 Y118.92 I-.565 J1.164 E.03073
G1 X136.347 Y118.92 E.05172
; WIPE_START
G1 F24000
G1 X134.347 Y118.92 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.91 I.148 J-1.208 P1  F30000
G1 X124.326 Y117.695 Z11.91
G1 Z11.51
G1 E.8 F1800
G1 F1600
G3 X123.06 Y116.356 I-1.262 J-.075 E.23837
G1 X123.139 Y116.359 E.00318
G3 X124.328 Y117.636 I-.074 J1.262 E.07814
; CHANGE_LAYER
; Z_HEIGHT: 11.6
; LAYER_HEIGHT: 0.0896559
; WIPE_START
G1 F24000
G1 X124.182 Y118.154 E-.20437
G1 X123.904 Y118.539 E-.18027
G1 X123.508 Y118.794 E-.17927
G1 X122.999 Y118.877 E-.19609
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 98/151
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
G3 Z11.91 I-1.194 J.237 P1  F30000
G1 X123.898 Y123.398 Z11.91
G1 Z11.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1600
G1 X123.898 Y129.898 E.21562
G1 X121.102 Y129.898 E.09274
G1 X121.102 Y120.102 E.32495
G1 X136.898 Y120.102 E.52398
G1 X136.898 Y129.898 E.32495
G1 X131.102 Y129.898 E.19226
G1 X131.102 Y123.398 E.21562
G1 X123.958 Y123.398 E.23698
G1 X124.29 Y123.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1600
G1 X124.29 Y130.29 E.19973
G1 X120.71 Y130.29 E.11
G1 X120.71 Y119.71 E.32509
G1 X137.29 Y119.71 E.50946
G1 X137.29 Y130.29 E.32509
G1 X130.71 Y130.29 E.20219
G1 X130.71 Y123.79 E.19973
G1 X124.35 Y123.79 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X124.332 Y125.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12 I.774 J-.939 P1  F30000
G1 X123.55 Y125.146 Z12
G1 Z11.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1600
G1 X123.55 Y126.774 E.05401
G1 X121.45 Y128.874 E.09848
G1 X121.45 Y127.126 E.05796
G1 X123.55 Y129.226 E.09848
G1 X123.55 Y129.55 E.01075
G1 X122.245 Y129.55 E.04327
G1 X121.45 Y122.826 F30000
G1 F1600
G1 X121.45 Y121.198 E.05401
G1 X122.198 Y120.45 E.03506
G1 X122.45 Y120.45 E.00838
G1 X125.05 Y123.05 E.12194
G1 X127.274 Y123.05 E.0738
G1 X129.874 Y120.45 E.12194
G1 X130.126 Y120.45 E.00838
G1 X136.55 Y126.874 E.30133
G1 X136.55 Y129.126 E.07472
G1 X136.126 Y129.55 E.01986
G1 X131.55 Y129.55 E.15182
G1 X131.45 Y129.45 E.00466
G1 X131.45 Y126.55 E.09622
G1 X136.55 Y121.45 E.23922
G1 X136.55 Y120.45 E.03317
G1 X135.921 Y120.45 E.02084
; CHANGE_LAYER
; Z_HEIGHT: 11.7862
; LAYER_HEIGHT: 0.186207
; WIPE_START
G1 F24000
G1 X136.55 Y120.45 E-.23876
G1 X136.55 Y121.45 E-.38
M73 P72 R5
G1 X136.287 Y121.713 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 99/151
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
G3 Z12 I1.217 J0 P1  F30000
G1 X136.287 Y118.92 Z12
G1 Z11.786
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.275862
G1 F1597
G1 X133.406 Y118.92 E.11684
G3 X134.476 Y118.312 I1.078 J.653 E.05213
G2 X134.467 Y117.882 I-.356 J-.208 E.01836
G3 X135.723 Y116.353 I1.177 J-.314 E.0937
G3 X136.735 Y118.189 I-.094 J1.249 E.10079
G2 X137.197 Y118.509 I.659 J-.458 E.02328
G3 X137.594 Y118.92 I-.715 J1.088 E.02334
G1 X136.347 Y118.92 E.05059
; WIPE_START
G1 F24000
G1 X134.347 Y118.92 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.186 I.142 J-1.209 P1  F30000
G1 X124.288 Y117.74 Z12.186
G1 Z11.786
G1 E.8 F1800
G1 F1597
G3 X123.045 Y116.426 I-1.238 J-.073 E.23391
G1 X123.122 Y116.428 E.00312
G3 X124.29 Y117.681 I-.073 J1.238 E.07663
; CHANGE_LAYER
; Z_HEIGHT: 11.8
; LAYER_HEIGHT: 0.013793
; WIPE_START
G1 F24000
G1 X124.145 Y118.19 E-.20112
G1 X123.872 Y118.567 E-.17696
G1 X123.483 Y118.818 E-.17594
G1 X122.955 Y118.905 E-.20327
G1 X122.948 Y118.903 E-.0027
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 100/151
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
G3 Z12.186 I-1.191 J.252 P1  F30000
G1 X123.898 Y123.398 Z12.186
G1 Z11.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1597
G1 X123.898 Y129.898 E.21562
G1 X121.102 Y129.898 E.09274
G1 X121.102 Y120.102 E.32495
G1 X136.898 Y120.102 E.52398
G1 X136.898 Y129.898 E.32495
G1 X131.102 Y129.898 E.19226
G1 X131.102 Y123.398 E.21562
G1 X123.958 Y123.398 E.23698
G1 X124.29 Y123.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1597
G1 X124.29 Y130.29 E.19973
G1 X120.71 Y130.29 E.11
G1 X120.71 Y119.71 E.32509
G1 X137.29 Y119.71 E.50946
G1 X137.29 Y130.29 E.32509
G1 X130.71 Y130.29 E.20219
G1 X130.71 Y123.79 E.19973
G1 X124.35 Y123.79 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X124.332 Y125.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.2 I.774 J-.939 P1  F30000
G1 X123.55 Y125.146 Z12.2
G1 Z11.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1597
G1 X123.55 Y126.774 E.05401
G1 X121.45 Y128.874 E.09848
G1 X121.45 Y127.126 E.05796
G1 X123.55 Y129.226 E.09848
G1 X123.55 Y129.55 E.01075
G1 X122.245 Y129.55 E.04327
G1 X121.45 Y122.826 F30000
G1 F1597
G1 X121.45 Y121.198 E.05401
G1 X122.198 Y120.45 E.03506
G1 X122.45 Y120.45 E.00838
G1 X125.05 Y123.05 E.12194
G1 X127.274 Y123.05 E.0738
G1 X129.874 Y120.45 E.12194
G1 X130.126 Y120.45 E.00838
G1 X136.55 Y126.874 E.30133
G1 X136.55 Y129.126 E.07472
G1 X136.126 Y129.55 E.01986
G1 X131.55 Y129.55 E.15182
G1 X131.45 Y129.45 E.00466
G1 X131.45 Y126.55 E.09622
G1 X136.55 Y121.45 E.23922
G1 X136.55 Y120.45 E.03317
G1 X135.921 Y120.45 E.02084
; CHANGE_LAYER
; Z_HEIGHT: 12
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X136.55 Y120.45 E-.23876
G1 X136.55 Y121.45 E-.38
G1 X136.287 Y121.713 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 101/151
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
G3 Z12.2 I-.164 J-1.206 P1  F30000
G1 X123.898 Y123.398 Z12.2
G1 Z12
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1414
G1 X123.898 Y129.898 E.21562
G1 X121.102 Y129.898 E.09274
G1 X121.102 Y120.102 E.32495
G1 X136.898 Y120.102 E.52398
G1 X136.898 Y129.898 E.32495
G1 X131.102 Y129.898 E.19226
G1 X131.102 Y123.398 E.21562
M73 P73 R5
G1 X123.958 Y123.398 E.23698
G1 X124.29 Y123.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1414
G1 X124.29 Y130.29 E.19973
G1 X120.71 Y130.29 E.11
G1 X120.71 Y119.71 E.32509
G1 X137.29 Y119.71 E.50946
G1 X137.29 Y130.29 E.32509
G1 X130.71 Y130.29 E.20219
G1 X130.71 Y123.79 E.19973
G1 X124.35 Y123.79 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X124.332 Y125.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.4 I.774 J-.939 P1  F30000
G1 X123.55 Y125.146 Z12.4
G1 Z12
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1414
G1 X123.55 Y126.774 E.05401
G1 X121.45 Y128.874 E.09848
G1 X121.45 Y127.126 E.05796
G1 X123.55 Y129.226 E.09848
G1 X123.55 Y129.55 E.01075
G1 X122.245 Y129.55 E.04327
G1 X121.45 Y122.826 F30000
G1 F1414
G1 X121.45 Y121.198 E.05401
G1 X122.198 Y120.45 E.03506
G1 X122.45 Y120.45 E.00838
G1 X125.05 Y123.05 E.12194
G1 X127.274 Y123.05 E.0738
G1 X129.874 Y120.45 E.12194
G1 X130.126 Y120.45 E.00838
G1 X136.55 Y126.874 E.30133
G1 X136.55 Y129.126 E.07472
G1 X136.126 Y129.55 E.01986
G1 X131.55 Y129.55 E.15182
G1 X131.45 Y129.45 E.00466
G1 X131.45 Y126.55 E.09622
G1 X136.55 Y121.45 E.23922
G1 X136.55 Y120.45 E.03317
G1 X135.921 Y120.45 E.02084
; CHANGE_LAYER
; Z_HEIGHT: 12.0621
; LAYER_HEIGHT: 0.0620689
; WIPE_START
G1 F24000
G1 X136.55 Y120.45 E-.23876
G1 X136.55 Y121.45 E-.38
G1 X136.287 Y121.713 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 102/151
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
G3 Z12.4 I1.217 J0 P1  F30000
G1 X136.287 Y118.92 Z12.4
G1 Z12.062
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.275862
G1 F1594
G1 X133.434 Y118.92 E.1157
G3 X134.517 Y118.341 I1.034 J.632 E.0522
G2 X134.518 Y117.912 I-.324 J-.215 E.01842
G3 X135.75 Y116.413 I1.153 J-.308 E.09185
G3 X136.742 Y118.217 I-.092 J1.225 E.09894
G2 X137.306 Y118.618 I.879 J-.638 E.02857
G3 X137.566 Y118.92 I-.897 J1.037 E.0162
G1 X136.347 Y118.92 E.04945
; WIPE_START
G1 F24000
G1 X134.347 Y118.92 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.462 I.127 J-1.21 P1  F30000
G1 X124.233 Y117.862 Z12.462
G1 Z12.062
G1 E.8 F1800
G1 F1594
G3 X123.029 Y116.497 I-1.199 J-.155 E.22461
G1 X123.104 Y116.499 E.00305
G3 X124.24 Y117.803 I-.071 J1.207 E.07811
; CHANGE_LAYER
; Z_HEIGHT: 12.2
; LAYER_HEIGHT: 0.137931
; WIPE_START
G1 F24000
G1 X124.072 Y118.295 E-.19732
G1 X123.722 Y118.695 E-.20193
G1 X123.314 Y118.891 E-.17217
G1 X122.852 Y118.92 E-.17555
G1 X122.82 Y118.909 E-.01302
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 103/151
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
G3 Z12.462 I-1.183 J.284 P1  F30000
G1 X123.898 Y123.398 Z12.462
G1 Z12.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1594
G1 X123.898 Y129.898 E.21562
G1 X121.102 Y129.898 E.09274
G1 X121.102 Y120.102 E.32495
G1 X136.898 Y120.102 E.52398
G1 X136.898 Y129.898 E.32495
G1 X131.102 Y129.898 E.19226
G1 X131.102 Y123.398 E.21562
G1 X123.958 Y123.398 E.23698
G1 X124.29 Y123.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1594
G1 X124.29 Y130.29 E.19973
G1 X120.71 Y130.29 E.11
G1 X120.71 Y119.71 E.32509
G1 X137.29 Y119.71 E.50946
G1 X137.29 Y130.29 E.32509
G1 X130.71 Y130.29 E.20219
G1 X130.71 Y123.79 E.19973
G1 X124.35 Y123.79 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X124.332 Y125.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.6 I.774 J-.939 P1  F30000
G1 X123.55 Y125.146 Z12.6
G1 Z12.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1594
M73 P74 R5
G1 X123.55 Y126.774 E.05401
G1 X121.45 Y128.874 E.09848
G1 X121.45 Y127.126 E.05796
G1 X123.55 Y129.226 E.09848
G1 X123.55 Y129.55 E.01075
G1 X122.245 Y129.55 E.04327
G1 X121.45 Y122.826 F30000
G1 F1594
G1 X121.45 Y121.198 E.05401
G1 X122.198 Y120.45 E.03506
G1 X122.45 Y120.45 E.00838
G1 X125.05 Y123.05 E.12194
G1 X127.274 Y123.05 E.0738
G1 X129.874 Y120.45 E.12194
G1 X130.126 Y120.45 E.00838
G1 X136.55 Y126.874 E.30133
G1 X136.55 Y129.126 E.07472
G1 X136.126 Y129.55 E.01986
G1 X131.55 Y129.55 E.15182
G1 X131.45 Y129.45 E.00466
G1 X131.45 Y126.55 E.09622
G1 X136.55 Y121.45 E.23922
G1 X136.55 Y120.45 E.03317
G1 X135.921 Y120.45 E.02084
; CHANGE_LAYER
; Z_HEIGHT: 12.3379
; LAYER_HEIGHT: 0.137931
; WIPE_START
G1 F24000
G1 X136.55 Y120.45 E-.23876
G1 X136.55 Y121.45 E-.38
G1 X136.287 Y121.713 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 104/151
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
G3 Z12.6 I1.217 J.002 P1  F30000
G1 X136.292 Y118.917 Z12.6
G1 Z12.338
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.275862
G1 F1591
G1 X133.466 Y118.912 E.11459
G3 X134.559 Y118.37 I.997 J.636 E.05198
G2 X134.592 Y118.014 I-.179 J-.196 E.01591
G3 X135.778 Y116.474 I1.105 J-.376 E.09314
G3 X136.751 Y118.244 I-.09 J1.202 E.09711
G2 X137.291 Y118.637 I.791 J-.52 E.02767
G3 X137.538 Y118.92 I-.904 J1.04 E.01529
G1 X136.352 Y118.918 E.04811
; WIPE_START
G1 F24000
G1 X134.352 Y118.914 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.738 I.111 J-1.212 P1  F30000
G1 X124.169 Y117.98 Z12.738
G1 Z12.338
G1 E.8 F1800
G1 F1591
G3 X123.012 Y116.569 I-1.151 J-.236 E.21476
G1 X123.086 Y116.571 E.00299
G3 X124.179 Y117.922 I-.068 J1.173 E.07934
; CHANGE_LAYER
; Z_HEIGHT: 12.4
; LAYER_HEIGHT: 0.0620689
; WIPE_START
G1 F24000
G1 X123.995 Y118.396 E-.19329
G1 X123.628 Y118.767 E-.19791
G1 X123.275 Y118.92 E-.14628
G1 X122.706 Y118.92 E-.21627
G1 X122.691 Y118.913 E-.00625
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 105/151
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
G3 Z12.738 I-1.175 J.316 P1  F30000
G1 X123.898 Y123.398 Z12.738
G1 Z12.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1591
G1 X123.898 Y129.898 E.21562
G1 X121.102 Y129.898 E.09274
G1 X121.102 Y120.102 E.32495
G1 X136.898 Y120.102 E.52398
G1 X136.898 Y129.898 E.32495
G1 X131.102 Y129.898 E.19226
G1 X131.102 Y123.398 E.21562
G1 X123.958 Y123.398 E.23698
G1 X124.29 Y123.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1591
G1 X124.29 Y130.29 E.19973
G1 X120.71 Y130.29 E.11
G1 X120.71 Y119.71 E.32509
G1 X137.29 Y119.71 E.50946
G1 X137.29 Y130.29 E.32509
G1 X130.71 Y130.29 E.20219
G1 X130.71 Y123.79 E.19973
G1 X124.35 Y123.79 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X124.332 Y125.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.8 I.774 J-.939 P1  F30000
G1 X123.55 Y125.146 Z12.8
G1 Z12.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1591
G1 X123.55 Y126.774 E.05401
G1 X121.45 Y128.874 E.09848
G1 X121.45 Y127.126 E.05796
G1 X123.55 Y129.226 E.09848
G1 X123.55 Y129.55 E.01075
G1 X122.245 Y129.55 E.04327
G1 X121.45 Y122.826 F30000
G1 F1591
G1 X121.45 Y121.198 E.05401
G1 X122.198 Y120.45 E.03506
G1 X122.45 Y120.45 E.00838
G1 X125.05 Y123.05 E.12194
G1 X127.274 Y123.05 E.0738
G1 X129.874 Y120.45 E.12194
G1 X130.126 Y120.45 E.00838
G1 X136.55 Y126.874 E.30133
G1 X136.55 Y129.126 E.07472
G1 X136.126 Y129.55 E.01986
G1 X131.55 Y129.55 E.15182
G1 X131.45 Y129.45 E.00466
G1 X131.45 Y126.55 E.09622
G1 X136.55 Y121.45 E.23922
G1 X136.55 Y120.45 E.03317
G1 X135.921 Y120.45 E.02084
; CHANGE_LAYER
; Z_HEIGHT: 12.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X136.55 Y120.45 E-.23876
G1 X136.55 Y121.45 E-.38
G1 X136.287 Y121.713 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 106/151
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
G3 Z12.8 I-.164 J-1.206 P1  F30000
G1 X123.898 Y123.398 Z12.8
G1 Z12.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1414
G1 X123.898 Y129.898 E.21562
G1 X121.102 Y129.898 E.09274
G1 X121.102 Y120.102 E.32495
G1 X136.898 Y120.102 E.52398
M73 P75 R5
G1 X136.898 Y129.898 E.32495
G1 X131.102 Y129.898 E.19226
G1 X131.102 Y123.398 E.21562
G1 X123.958 Y123.398 E.23698
G1 X124.29 Y123.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1414
G1 X124.29 Y130.29 E.19973
G1 X120.71 Y130.29 E.11
G1 X120.71 Y119.71 E.32509
G1 X137.29 Y119.71 E.50946
G1 X137.29 Y130.29 E.32509
G1 X130.71 Y130.29 E.20219
G1 X130.71 Y123.79 E.19973
G1 X124.35 Y123.79 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X124.332 Y125.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13 I.774 J-.939 P1  F30000
G1 X123.55 Y125.146 Z13
G1 Z12.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1414
G1 X123.55 Y126.774 E.05401
G1 X121.45 Y128.874 E.09848
G1 X121.45 Y127.126 E.05796
G1 X123.55 Y129.226 E.09848
G1 X123.55 Y129.55 E.01075
G1 X122.245 Y129.55 E.04327
G1 X121.45 Y122.826 F30000
G1 F1414
G1 X121.45 Y121.198 E.05401
G1 X122.198 Y120.45 E.03506
G1 X122.45 Y120.45 E.00838
G1 X125.05 Y123.05 E.12194
G1 X127.274 Y123.05 E.0738
G1 X129.874 Y120.45 E.12194
G1 X130.126 Y120.45 E.00838
G1 X136.55 Y126.874 E.30133
G1 X136.55 Y129.126 E.07472
G1 X136.126 Y129.55 E.01986
G1 X131.55 Y129.55 E.15182
G1 X131.45 Y129.45 E.00466
G1 X131.45 Y126.55 E.09622
G1 X136.55 Y121.45 E.23922
G1 X136.55 Y120.45 E.03317
G1 X135.921 Y120.45 E.02084
; CHANGE_LAYER
; Z_HEIGHT: 12.6138
; LAYER_HEIGHT: 0.013793
; WIPE_START
G1 F24000
G1 X136.55 Y120.45 E-.23876
G1 X136.55 Y121.45 E-.38
G1 X136.287 Y121.713 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 107/151
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
G3 Z13 I1.217 J0 P1  F30000
M73 P75 R4
G1 X136.287 Y118.92 Z13
G1 Z12.614
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.275862
G1 F1589
G1 X133.49 Y118.92 E.11341
G3 X134.612 Y118.396 I.981 J.638 E.05288
G1 X134.723 Y118.231 E.00806
G3 X135.807 Y116.535 I1.007 J-.551 E.09956
G3 X136.762 Y118.27 I-.088 J1.178 E.09517
G2 X137.096 Y118.534 I.439 J-.213 E.01787
G3 X137.51 Y118.92 I-.606 J1.063 E.02314
G1 X136.347 Y118.92 E.04716
; WIPE_START
G1 F24000
G1 X134.347 Y118.92 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.014 I.098 J-1.213 P1  F30000
G1 X124.101 Y118.093 Z13.014
G1 Z12.614
G1 E.8 F1800
G1 F1589
G1 X124.103 Y118.096 E.00015
G3 X123.341 Y118.92 I-1.135 J-.286 E.04745
G1 X122.604 Y118.92 E.02992
G3 X123.066 Y116.644 I.407 J-1.102 E.13506
G3 X124.129 Y117.657 I-.098 J1.166 E.06435
G1 X124.105 Y118.033 E.01526
; CHANGE_LAYER
; Z_HEIGHT: 12.8
; LAYER_HEIGHT: 0.186207
; WIPE_START
G1 F24000
G1 X124.103 Y118.096 E-.024
G1 X123.955 Y118.433 E-.13983
G1 X123.714 Y118.709 E-.13932
G1 X123.341 Y118.92 E-.16276
G1 X122.604 Y118.92 E-.28038
G1 X122.572 Y118.902 E-.0137
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 108/151
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
G3 Z13.014 I-1.167 J.344 P1  F30000
G1 X123.898 Y123.398 Z13.014
G1 Z12.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1589
G1 X123.898 Y129.898 E.21562
G1 X121.102 Y129.898 E.09274
M73 P76 R4
G1 X121.102 Y120.102 E.32495
G1 X136.898 Y120.102 E.52398
G1 X136.898 Y129.898 E.32495
G1 X131.102 Y129.898 E.19226
G1 X131.102 Y123.398 E.21562
G1 X123.958 Y123.398 E.23698
G1 X124.29 Y123.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1589
G1 X124.29 Y130.29 E.19973
G1 X120.71 Y130.29 E.11
G1 X120.71 Y119.71 E.32509
G1 X137.29 Y119.71 E.50946
G1 X137.29 Y130.29 E.32509
G1 X130.71 Y130.29 E.20219
G1 X130.71 Y123.79 E.19973
G1 X124.35 Y123.79 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X124.332 Y125.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.2 I.774 J-.939 P1  F30000
G1 X123.55 Y125.146 Z13.2
G1 Z12.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1589
G1 X123.55 Y126.774 E.05401
G1 X121.45 Y128.874 E.09848
G1 X121.45 Y127.126 E.05796
G1 X123.55 Y129.226 E.09848
G1 X123.55 Y129.55 E.01075
G1 X122.245 Y129.55 E.04327
G1 X121.45 Y122.826 F30000
G1 F1589
G1 X121.45 Y121.198 E.05401
G1 X122.198 Y120.45 E.03506
G1 X122.45 Y120.45 E.00838
G1 X125.05 Y123.05 E.12194
G1 X127.274 Y123.05 E.0738
G1 X129.874 Y120.45 E.12194
G1 X130.126 Y120.45 E.00838
G1 X136.55 Y126.874 E.30133
G1 X136.55 Y129.126 E.07472
G1 X136.126 Y129.55 E.01986
G1 X131.55 Y129.55 E.15182
G1 X131.45 Y129.45 E.00466
G1 X131.45 Y126.55 E.09622
G1 X136.55 Y121.45 E.23922
G1 X136.55 Y120.45 E.03317
G1 X135.921 Y120.45 E.02084
; CHANGE_LAYER
; Z_HEIGHT: 12.8897
; LAYER_HEIGHT: 0.0896549
; WIPE_START
G1 F24000
G1 X136.55 Y120.45 E-.23876
G1 X136.55 Y121.45 E-.38
G1 X136.287 Y121.713 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 109/151
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
G3 Z13.2 I1.217 J0 P1  F30000
G1 X136.287 Y118.92 Z13.2
G1 Z12.89
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.275862
G1 F1586
G1 X133.519 Y118.92 E.11222
G3 X134.659 Y118.43 I.951 J.641 E.05314
G1 X134.78 Y118.263 E.00837
G3 X135.839 Y116.596 I.982 J-.545 E.09777
G3 X136.773 Y118.299 I-.086 J1.155 E.09342
G2 X137.204 Y118.631 I.726 J-.499 E.02241
G3 X137.481 Y118.92 I-.764 J1.007 E.01628
G1 X136.347 Y118.92 E.04597
; WIPE_START
G1 F24000
G1 X134.347 Y118.92 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.29 I.1 J-1.213 P1  F30000
G1 X124.078 Y118.07 Z13.29
G1 Z12.89
G1 E.8 F1800
G1 F1586
G3 X123.389 Y118.92 I-1.126 J-.21 E.04624
G1 X122.516 Y118.92 E.0354
G3 X123.045 Y116.719 I.475 J-1.05 E.12916
G3 X124.087 Y118.012 I-.094 J1.142 E.07532
; CHANGE_LAYER
; Z_HEIGHT: 13
; LAYER_HEIGHT: 0.110345
; WIPE_START
G1 F24000
G1 X123.952 Y118.409 E-.15944
G1 X123.733 Y118.694 E-.13671
G1 X123.389 Y118.92 E-.15637
G1 X122.579 Y118.92 E-.30749
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 110/151
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
G3 Z13.29 I-1.167 J.344 P1  F30000
G1 X123.898 Y123.398 Z13.29
G1 Z13
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1586
G1 X123.898 Y129.898 E.21562
G1 X121.102 Y129.898 E.09274
G1 X121.102 Y120.102 E.32495
G1 X136.898 Y120.102 E.52398
G1 X136.898 Y129.898 E.32495
G1 X131.102 Y129.898 E.19226
G1 X131.102 Y123.398 E.21562
G1 X123.958 Y123.398 E.23698
G1 X124.29 Y123.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1586
G1 X124.29 Y130.29 E.19973
G1 X120.71 Y130.29 E.11
G1 X120.71 Y119.71 E.32509
G1 X137.29 Y119.71 E.50946
G1 X137.29 Y130.29 E.32509
G1 X130.71 Y130.29 E.20219
G1 X130.71 Y123.79 E.19973
G1 X124.35 Y123.79 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X124.332 Y125.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.4 I.774 J-.939 P1  F30000
G1 X123.55 Y125.146 Z13.4
G1 Z13
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1586
G1 X123.55 Y126.774 E.05401
G1 X121.45 Y128.874 E.09848
G1 X121.45 Y127.126 E.05796
G1 X123.55 Y129.226 E.09848
G1 X123.55 Y129.55 E.01075
G1 X122.245 Y129.55 E.04327
G1 X121.45 Y122.826 F30000
G1 F1586
G1 X121.45 Y121.198 E.05401
G1 X122.198 Y120.45 E.03506
G1 X122.45 Y120.45 E.00838
G1 X125.05 Y123.05 E.12194
G1 X127.274 Y123.05 E.0738
G1 X129.874 Y120.45 E.12194
G1 X130.126 Y120.45 E.00838
G1 X136.55 Y126.874 E.30133
G1 X136.55 Y129.126 E.07472
G1 X136.126 Y129.55 E.01986
G1 X131.55 Y129.55 E.15182
G1 X131.45 Y129.45 E.00466
G1 X131.45 Y126.55 E.09622
G1 X136.55 Y121.45 E.23922
G1 X136.55 Y120.45 E.03317
G1 X135.921 Y120.45 E.02084
; CHANGE_LAYER
; Z_HEIGHT: 13.1655
; LAYER_HEIGHT: 0.165517
; WIPE_START
G1 F24000
G1 X136.55 Y120.45 E-.23876
G1 X136.55 Y121.45 E-.38
G1 X136.287 Y121.713 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 111/151
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
G3 Z13.4 I1.217 J0 P1  F30000
G1 X136.287 Y118.92 Z13.4
G1 Z13.166
M73 P77 R4
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.275862
G1 F1583
G1 X133.549 Y118.92 E.11104
G3 X134.709 Y118.466 I.914 J.629 E.05362
G1 X134.839 Y118.297 E.00868
G3 X135.872 Y116.658 I.957 J-.542 E.09608
G3 X136.786 Y118.329 I-.084 J1.132 E.09168
G2 X137.346 Y118.787 I1.138 J-.82 E.02967
G3 X137.451 Y118.92 I-.87 J.803 E.00687
G1 X136.347 Y118.92 E.04479
; WIPE_START
G1 F24000
G1 X134.347 Y118.92 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.566 I.103 J-1.213 P1  F30000
G1 X124.043 Y118.048 Z13.566
G1 Z13.166
G1 E.8 F1800
G1 F1583
G3 X123.425 Y118.92 I-1.114 J-.135 E.04517
G1 X122.437 Y118.92 E.04008
G3 X123.024 Y116.795 I.537 J-.995 E.12338
G3 X124.049 Y117.988 I-.094 J1.118 E.07072
; CHANGE_LAYER
; Z_HEIGHT: 13.2
; LAYER_HEIGHT: 0.034483
; WIPE_START
G1 F24000
G1 X123.942 Y118.387 E-.15669
G1 X123.745 Y118.679 E-.13409
G1 X123.425 Y118.92 E-.15202
G1 X122.59 Y118.92 E-.3172
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 112/151
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
G3 Z13.566 I-1.168 J.341 P1  F30000
G1 X123.898 Y123.398 Z13.566
G1 Z13.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1583
G1 X123.898 Y129.898 E.21562
G1 X121.102 Y129.898 E.09274
G1 X121.102 Y120.102 E.32495
G1 X136.898 Y120.102 E.52398
G1 X136.898 Y129.898 E.32495
G1 X131.102 Y129.898 E.19226
G1 X131.102 Y123.398 E.21562
G1 X123.958 Y123.398 E.23698
G1 X124.29 Y123.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1583
G1 X124.29 Y130.29 E.19973
G1 X120.71 Y130.29 E.11
G1 X120.71 Y119.71 E.32509
G1 X137.29 Y119.71 E.50946
G1 X137.29 Y130.29 E.32509
G1 X130.71 Y130.29 E.20219
G1 X130.71 Y123.79 E.19973
G1 X124.35 Y123.79 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X124.332 Y125.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.6 I.774 J-.939 P1  F30000
G1 X123.55 Y125.146 Z13.6
G1 Z13.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1583
G1 X123.55 Y126.774 E.05401
G1 X121.45 Y128.874 E.09848
G1 X121.45 Y127.126 E.05796
G1 X123.55 Y129.226 E.09848
G1 X123.55 Y129.55 E.01075
G1 X122.245 Y129.55 E.04327
G1 X121.45 Y122.826 F30000
G1 F1583
G1 X121.45 Y121.198 E.05401
G1 X122.198 Y120.45 E.03506
G1 X122.45 Y120.45 E.00838
G1 X125.05 Y123.05 E.12194
G1 X127.274 Y123.05 E.0738
G1 X129.874 Y120.45 E.12194
G1 X130.126 Y120.45 E.00838
G1 X136.55 Y126.874 E.30133
G1 X136.55 Y129.126 E.07472
G1 X136.126 Y129.55 E.01986
G1 X131.55 Y129.55 E.15182
G1 X131.45 Y129.45 E.00466
G1 X131.45 Y126.55 E.09622
G1 X136.55 Y121.45 E.23922
G1 X136.55 Y120.45 E.03317
G1 X135.921 Y120.45 E.02084
; CHANGE_LAYER
; Z_HEIGHT: 13.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X136.55 Y120.45 E-.23876
G1 X136.55 Y121.45 E-.38
G1 X136.287 Y121.713 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 113/151
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
G3 Z13.6 I-.164 J-1.206 P1  F30000
G1 X123.898 Y123.398 Z13.6
G1 Z13.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1414
G1 X123.898 Y129.898 E.21562
G1 X121.102 Y129.898 E.09274
G1 X121.102 Y120.102 E.32495
G1 X136.898 Y120.102 E.52398
G1 X136.898 Y129.898 E.32495
G1 X131.102 Y129.898 E.19226
G1 X131.102 Y123.398 E.21562
G1 X123.958 Y123.398 E.23698
G1 X124.29 Y123.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1414
G1 X124.29 Y130.29 E.19973
G1 X120.71 Y130.29 E.11
G1 X120.71 Y119.71 E.32509
G1 X137.29 Y119.71 E.50946
G1 X137.29 Y130.29 E.32509
G1 X130.71 Y130.29 E.20219
G1 X130.71 Y123.79 E.19973
G1 X124.35 Y123.79 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X124.332 Y125.79 E-.76
; WIPE_END
M73 P78 R4
G1 E-.04 F1800
G17
G3 Z13.8 I.774 J-.939 P1  F30000
G1 X123.55 Y125.146 Z13.8
G1 Z13.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1414
G1 X123.55 Y126.774 E.05401
G1 X121.45 Y128.874 E.09848
G1 X121.45 Y127.126 E.05796
G1 X123.55 Y129.226 E.09848
G1 X123.55 Y129.55 E.01075
G1 X122.245 Y129.55 E.04327
G1 X121.45 Y122.826 F30000
G1 F1414
G1 X121.45 Y121.198 E.05401
G1 X122.198 Y120.45 E.03506
G1 X122.45 Y120.45 E.00838
G1 X125.05 Y123.05 E.12194
G1 X127.274 Y123.05 E.0738
G1 X129.874 Y120.45 E.12194
G1 X130.126 Y120.45 E.00838
G1 X136.55 Y126.874 E.30133
G1 X136.55 Y129.126 E.07472
G1 X136.126 Y129.55 E.01986
G1 X131.55 Y129.55 E.15182
G1 X131.45 Y129.45 E.00466
G1 X131.45 Y126.55 E.09622
G1 X136.55 Y121.45 E.23922
G1 X136.55 Y120.45 E.03317
G1 X135.921 Y120.45 E.02084
; CHANGE_LAYER
; Z_HEIGHT: 13.4414
; LAYER_HEIGHT: 0.0413799
; WIPE_START
G1 F24000
G1 X136.55 Y120.45 E-.23876
G1 X136.55 Y121.45 E-.38
G1 X136.287 Y121.713 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 114/151
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
G3 Z13.8 I1.217 J.004 P1  F30000
G1 X136.295 Y118.916 Z13.8
G1 Z13.441
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.275862
G1 F1580
G1 X133.586 Y118.908 E.10988
G3 X134.667 Y118.479 I.883 J.649 E.04972
G1 X134.788 Y118.324 E.00798
G3 X135.906 Y116.72 I1.092 J-.431 E.09374
G3 X136.8 Y118.36 I-.083 J1.109 E.08994
G2 X137.28 Y118.756 I.791 J-.471 E.02575
G3 X137.422 Y118.92 I-1.224 J1.206 E.00879
G1 X136.355 Y118.916 E.04327
; WIPE_START
G1 F24000
G1 X134.355 Y118.91 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.841 I.103 J-1.213 P1  F30000
G1 X124.006 Y118.03 Z13.841
G1 Z13.441
G1 E.8 F1800
G1 F1580
G3 X123.453 Y118.92 I-1.095 J-.064 E.04428
G1 X122.364 Y118.92 E.04417
G3 X123.001 Y116.872 I.588 J-.94 E.11806
G3 X124.008 Y117.97 I-.09 J1.094 E.0664
; CHANGE_LAYER
; Z_HEIGHT: 13.6
; LAYER_HEIGHT: 0.158621
; WIPE_START
G1 F24000
G1 X123.926 Y118.367 E-.15396
G1 X123.751 Y118.665 E-.13145
G1 X123.453 Y118.92 E-.14871
G1 X122.596 Y118.92 E-.32588
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 115/151
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
G3 Z13.841 I-1.169 J.34 P1  F30000
G1 X123.898 Y123.398 Z13.841
G1 Z13.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1580
G1 X123.898 Y129.898 E.21562
G1 X121.102 Y129.898 E.09274
G1 X121.102 Y120.102 E.32495
G1 X136.898 Y120.102 E.52398
G1 X136.898 Y129.898 E.32495
G1 X131.102 Y129.898 E.19226
G1 X131.102 Y123.398 E.21562
G1 X123.958 Y123.398 E.23698
G1 X124.29 Y123.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1580
G1 X124.29 Y130.29 E.19973
G1 X120.71 Y130.29 E.11
G1 X120.71 Y119.71 E.32509
G1 X137.29 Y119.71 E.50946
G1 X137.29 Y130.29 E.32509
G1 X130.71 Y130.29 E.20219
G1 X130.71 Y123.79 E.19973
G1 X124.35 Y123.79 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X124.332 Y125.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14 I.774 J-.939 P1  F30000
G1 X123.55 Y125.146 Z14
G1 Z13.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1580
G1 X123.55 Y126.774 E.05401
G1 X121.45 Y128.874 E.09848
G1 X121.45 Y127.126 E.05796
G1 X123.55 Y129.226 E.09848
G1 X123.55 Y129.55 E.01075
G1 X122.245 Y129.55 E.04327
G1 X121.45 Y122.826 F30000
G1 F1580
G1 X121.45 Y121.198 E.05401
G1 X122.198 Y120.45 E.03506
G1 X122.45 Y120.45 E.00838
G1 X125.05 Y123.05 E.12194
G1 X127.274 Y123.05 E.0738
G1 X129.874 Y120.45 E.12194
G1 X130.126 Y120.45 E.00838
G1 X136.55 Y126.874 E.30133
G1 X136.55 Y129.126 E.07472
G1 X136.126 Y129.55 E.01986
G1 X131.55 Y129.55 E.15182
G1 X131.45 Y129.45 E.00466
G1 X131.45 Y126.55 E.09622
G1 X136.55 Y121.45 E.23922
G1 X136.55 Y120.45 E.03317
G1 X135.921 Y120.45 E.02084
; CHANGE_LAYER
; Z_HEIGHT: 13.7172
; LAYER_HEIGHT: 0.117241
; WIPE_START
G1 F24000
G1 X136.55 Y120.45 E-.23876
G1 X136.55 Y121.45 E-.38
G1 X136.287 Y121.713 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 116/151
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
M73 P79 R4
G3 Z14 I1.217 J0 P1  F30000
G1 X136.287 Y118.92 Z14
G1 Z13.717
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.275862
G1 F1577
G1 X133.607 Y118.92 E.10866
G3 X134.661 Y118.503 I.861 J.637 E.04841
G2 X134.727 Y118.143 I-.192 J-.221 E.01603
G3 X135.942 Y116.782 I1.185 J-.165 E.08413
G3 X136.816 Y118.389 I-.081 J1.085 E.0881
G2 X137.264 Y118.774 I.966 J-.673 E.02418
G3 X137.393 Y118.92 I-.813 J.849 E.00792
G1 X136.347 Y118.92 E.04241
; WIPE_START
G1 F24000
G1 X134.347 Y118.92 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.117 I.098 J-1.213 P1  F30000
G1 X123.958 Y118.084 Z14.117
G1 Z13.717
G1 E.8 F1800
G1 F1577
G3 X123.475 Y118.92 I-1.072 J-.062 E.0406
G1 X122.297 Y118.92 E.04779
G3 X122.977 Y116.952 I.637 J-.881 E.1127
G3 X123.96 Y118.024 I-.091 J1.07 E.06483
; CHANGE_LAYER
; Z_HEIGHT: 13.8
; LAYER_HEIGHT: 0.0827589
; WIPE_START
G1 F24000
G1 X123.881 Y118.414 E-.15119
G1 X123.475 Y118.92 E-.24628
G1 X122.521 Y118.92 E-.36253
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 117/151
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
G3 Z14.117 I-1.163 J.358 P1  F30000
G1 X123.898 Y123.398 Z14.117
G1 Z13.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1577
G1 X123.898 Y129.898 E.21562
G1 X121.102 Y129.898 E.09274
G1 X121.102 Y120.102 E.32495
G1 X136.898 Y120.102 E.52398
G1 X136.898 Y129.898 E.32495
G1 X131.102 Y129.898 E.19226
G1 X131.102 Y123.398 E.21562
G1 X123.958 Y123.398 E.23698
G1 X124.29 Y123.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1577
G1 X124.29 Y130.29 E.19973
G1 X120.71 Y130.29 E.11
G1 X120.71 Y119.71 E.32509
G1 X137.29 Y119.71 E.50946
G1 X137.29 Y130.29 E.32509
G1 X130.71 Y130.29 E.20219
G1 X130.71 Y123.79 E.19973
G1 X124.35 Y123.79 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X124.332 Y125.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.2 I.774 J-.939 P1  F30000
G1 X123.55 Y125.146 Z14.2
G1 Z13.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1577
G1 X123.55 Y126.774 E.05401
G1 X121.45 Y128.874 E.09848
G1 X121.45 Y127.126 E.05796
G1 X123.55 Y129.226 E.09848
G1 X123.55 Y129.55 E.01075
G1 X122.245 Y129.55 E.04327
G1 X121.45 Y122.826 F30000
G1 F1577
G1 X121.45 Y121.198 E.05401
G1 X122.198 Y120.45 E.03506
G1 X122.45 Y120.45 E.00838
G1 X125.05 Y123.05 E.12194
G1 X127.274 Y123.05 E.0738
G1 X129.874 Y120.45 E.12194
G1 X130.126 Y120.45 E.00838
G1 X136.55 Y126.874 E.30133
G1 X136.55 Y129.126 E.07472
G1 X136.126 Y129.55 E.01986
G1 X131.55 Y129.55 E.15182
G1 X131.45 Y129.45 E.00466
G1 X131.45 Y126.55 E.09622
G1 X136.55 Y121.45 E.23922
G1 X136.55 Y120.45 E.03317
G1 X135.921 Y120.45 E.02084
; CHANGE_LAYER
; Z_HEIGHT: 13.9931
; LAYER_HEIGHT: 0.193103
; WIPE_START
G1 F24000
G1 X136.55 Y120.45 E-.23876
G1 X136.55 Y121.45 E-.38
G1 X136.287 Y121.713 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 118/151
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
G3 Z14.2 I1.217 J0 P1  F30000
G1 X136.287 Y118.92 Z14.2
G1 Z13.993
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.275862
G1 F1574
G1 X133.638 Y118.92 E.10743
G3 X134.648 Y118.526 I.829 J.634 E.04624
G1 X134.77 Y118.38 E.00769
G3 X135.98 Y116.845 I1.174 J-.319 E.09204
G3 X136.832 Y118.423 I-.079 J1.062 E.08643
G2 X137.362 Y118.92 I1.377 J-.937 E.0297
G1 X136.347 Y118.92 E.04118
; WIPE_START
M73 P80 R4
G1 F24000
G1 X134.347 Y118.92 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.393 I.098 J-1.213 P1  F30000
G1 X123.915 Y118.074 Z14.393
G1 Z13.993
G1 E.8 F1800
G1 F1574
G3 X123.491 Y118.92 I-1.048 J.004 E.0398
G1 X122.233 Y118.92 E.05101
G3 X122.952 Y117.033 I.677 J-.822 E.10767
G3 X123.913 Y118.014 I-.086 J1.045 E.06069
; CHANGE_LAYER
; Z_HEIGHT: 14
; LAYER_HEIGHT: 0.00689697
; WIPE_START
G1 F24000
G1 X123.857 Y118.401 E-.14843
G1 X123.491 Y118.92 E-.2414
G1 X122.517 Y118.92 E-.37018
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 119/151
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
G3 Z14.393 I-1.163 J.359 P1  F30000
G1 X123.898 Y123.398 Z14.393
G1 Z14
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1574
G1 X123.898 Y129.898 E.21562
G1 X121.102 Y129.898 E.09274
G1 X121.102 Y120.102 E.32495
G1 X136.898 Y120.102 E.52398
G1 X136.898 Y129.898 E.32495
G1 X131.102 Y129.898 E.19226
G1 X131.102 Y123.398 E.21562
G1 X123.958 Y123.398 E.23698
G1 X124.29 Y123.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1574
G1 X124.29 Y130.29 E.19973
G1 X120.71 Y130.29 E.11
G1 X120.71 Y119.71 E.32509
G1 X137.29 Y119.71 E.50946
G1 X137.29 Y130.29 E.32509
G1 X130.71 Y130.29 E.20219
G1 X130.71 Y123.79 E.19973
G1 X124.35 Y123.79 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X124.332 Y125.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.4 I.774 J-.939 P1  F30000
G1 X123.55 Y125.146 Z14.4
G1 Z14
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1574
G1 X123.55 Y126.774 E.05401
G1 X121.45 Y128.874 E.09848
G1 X121.45 Y127.126 E.05796
G1 X123.55 Y129.226 E.09848
G1 X123.55 Y129.55 E.01075
G1 X122.245 Y129.55 E.04327
G1 X121.45 Y122.826 F30000
G1 F1574
G1 X121.45 Y121.198 E.05401
G1 X122.198 Y120.45 E.03506
G1 X122.45 Y120.45 E.00838
G1 X125.05 Y123.05 E.12194
G1 X127.274 Y123.05 E.0738
G1 X129.874 Y120.45 E.12194
G1 X130.126 Y120.45 E.00838
G1 X136.55 Y126.874 E.30133
G1 X136.55 Y129.126 E.07472
G1 X136.126 Y129.55 E.01986
G1 X131.55 Y129.55 E.15182
G1 X131.45 Y129.45 E.00466
G1 X131.45 Y126.55 E.09622
G1 X136.55 Y121.45 E.23922
G1 X136.55 Y120.45 E.03317
G1 X135.921 Y120.45 E.02084
; CHANGE_LAYER
; Z_HEIGHT: 14.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X136.55 Y120.45 E-.23876
G1 X136.55 Y121.45 E-.38
G1 X136.287 Y121.713 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 120/151
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
M73 P80 R3
G3 Z14.4 I-.164 J-1.206 P1  F30000
G1 X123.898 Y123.398 Z14.4
G1 Z14.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1414
G1 X123.898 Y129.898 E.21562
G1 X121.102 Y129.898 E.09274
G1 X121.102 Y120.102 E.32495
G1 X136.898 Y120.102 E.52398
G1 X136.898 Y129.898 E.32495
G1 X131.102 Y129.898 E.19226
G1 X131.102 Y123.398 E.21562
G1 X123.958 Y123.398 E.23698
G1 X124.29 Y123.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1414
G1 X124.29 Y130.29 E.19973
G1 X120.71 Y130.29 E.11
G1 X120.71 Y119.71 E.32509
G1 X137.29 Y119.71 E.50946
G1 X137.29 Y130.29 E.32509
G1 X130.71 Y130.29 E.20219
G1 X130.71 Y123.79 E.19973
G1 X124.35 Y123.79 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X124.332 Y125.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.6 I.774 J-.939 P1  F30000
G1 X123.55 Y125.146 Z14.6
G1 Z14.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1414
G1 X123.55 Y126.774 E.05401
G1 X121.45 Y128.874 E.09848
G1 X121.45 Y127.126 E.05796
G1 X123.55 Y129.226 E.09848
G1 X123.55 Y129.55 E.01075
G1 X122.245 Y129.55 E.04327
G1 X121.45 Y122.826 F30000
G1 F1414
G1 X121.45 Y121.198 E.05401
G1 X122.198 Y120.45 E.03506
G1 X122.45 Y120.45 E.00838
G1 X125.05 Y123.05 E.12194
G1 X127.274 Y123.05 E.0738
G1 X129.874 Y120.45 E.12194
G1 X130.126 Y120.45 E.00838
G1 X136.55 Y126.874 E.30133
G1 X136.55 Y129.126 E.07472
G1 X136.126 Y129.55 E.01986
G1 X131.55 Y129.55 E.15182
G1 X131.45 Y129.45 E.00466
G1 X131.45 Y126.55 E.09622
G1 X136.55 Y121.45 E.23922
G1 X136.55 Y120.45 E.03317
G1 X135.921 Y120.45 E.02084
; CHANGE_LAYER
; Z_HEIGHT: 14.269
; LAYER_HEIGHT: 0.0689659
; WIPE_START
G1 F24000
G1 X136.55 Y120.45 E-.23876
G1 X136.55 Y121.45 E-.38
G1 X136.287 Y121.713 E-.14124
; WIPE_END
M73 P81 R3
G1 E-.04 F1800
; layer num/total_layer_count: 121/151
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
G3 Z14.6 I1.217 J0 P1  F30000
G1 X136.287 Y118.901 Z14.6
G1 Z14.269
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.275862
G1 F1570
G1 X133.683 Y118.901 E.1056
G3 X134.638 Y118.549 I.787 J.665 E.04318
G2 X134.717 Y118.153 I-.275 J-.261 E.01727
G3 X136.018 Y116.909 I1.299 J.056 E.08065
G3 X136.85 Y118.456 I-.078 J1.039 E.08476
G2 X137.317 Y118.901 I.929 J-.509 E.02657
G1 X136.347 Y118.901 E.03935
; WIPE_START
G1 F24000
G1 X134.347 Y118.901 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.669 I.059 J-1.216 P1  F30000
G1 X123.833 Y118.392 Z14.669
G1 Z14.269
G1 E.8 F1800
G1 F1570
G3 X123.502 Y118.92 I-.992 J-.255 E.02569
G1 X122.174 Y118.92 E.05385
G3 X122.927 Y117.116 I.716 J-.76 E.10255
G3 X123.846 Y118.334 I-.086 J1.021 E.06982
; CHANGE_LAYER
; Z_HEIGHT: 14.4
; LAYER_HEIGHT: 0.131034
; WIPE_START
G1 F24000
G1 X123.502 Y118.92 E-.25796
G1 X122.181 Y118.92 E-.50204
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 122/151
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
G3 Z14.669 I-1.136 J.436 P1  F30000
G1 X123.898 Y123.398 Z14.669
G1 Z14.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1570
G1 X123.898 Y129.898 E.21562
G1 X121.102 Y129.898 E.09274
G1 X121.102 Y120.102 E.32495
G1 X136.898 Y120.102 E.52398
G1 X136.898 Y129.898 E.32495
G1 X131.102 Y129.898 E.19226
G1 X131.102 Y123.398 E.21562
G1 X123.958 Y123.398 E.23698
G1 X124.29 Y123.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1570
G1 X124.29 Y130.29 E.19973
G1 X120.71 Y130.29 E.11
G1 X120.71 Y119.71 E.32509
G1 X137.29 Y119.71 E.50946
G1 X137.29 Y130.29 E.32509
G1 X130.71 Y130.29 E.20219
G1 X130.71 Y123.79 E.19973
G1 X124.35 Y123.79 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X124.332 Y125.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.8 I.774 J-.939 P1  F30000
G1 X123.55 Y125.146 Z14.8
G1 Z14.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1570
G1 X123.55 Y126.774 E.05401
G1 X121.45 Y128.874 E.09848
G1 X121.45 Y127.126 E.05796
G1 X123.55 Y129.226 E.09848
G1 X123.55 Y129.55 E.01075
G1 X122.245 Y129.55 E.04327
G1 X121.45 Y122.826 F30000
G1 F1570
G1 X121.45 Y121.198 E.05401
G1 X122.198 Y120.45 E.03506
G1 X122.45 Y120.45 E.00838
G1 X125.05 Y123.05 E.12194
G1 X127.274 Y123.05 E.0738
G1 X129.874 Y120.45 E.12194
G1 X130.126 Y120.45 E.00838
G1 X136.55 Y126.874 E.30133
G1 X136.55 Y129.126 E.07472
G1 X136.126 Y129.55 E.01986
G1 X131.55 Y129.55 E.15182
G1 X131.45 Y129.45 E.00466
G1 X131.45 Y126.55 E.09622
G1 X136.55 Y121.45 E.23922
G1 X136.55 Y120.45 E.03317
G1 X135.921 Y120.45 E.02084
; CHANGE_LAYER
; Z_HEIGHT: 14.5448
; LAYER_HEIGHT: 0.144828
; WIPE_START
G1 F24000
G1 X136.55 Y120.45 E-.23876
G1 X136.55 Y121.45 E-.38
G1 X136.287 Y121.713 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 123/151
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
G3 Z14.8 I1.217 J.001 P1  F30000
G1 X136.29 Y118.919 Z14.8
G1 Z14.545
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.275862
G1 F1567
G1 X133.701 Y118.916 E.10495
G3 X134.632 Y118.573 I.768 J.648 E.04206
G1 X134.753 Y118.436 E.0074
G3 X136.058 Y116.973 I1.271 J-.181 E.0905
G3 X136.869 Y118.49 I-.077 J1.016 E.08302
M73 P82 R3
G2 X137.301 Y118.92 I1.142 J-.715 E.02493
G1 X136.35 Y118.919 E.03859
; WIPE_START
G1 F24000
G1 X134.35 Y118.917 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.945 I.061 J-1.215 P1  F30000
G1 X123.799 Y118.385 Z14.945
G1 Z14.545
G1 E.8 F1800
G1 F1567
G3 X123.507 Y118.92 I-.981 J-.189 E.02511
G1 X122.102 Y118.904 E.05698
G3 X122.9 Y117.201 I.764 J-.68 E.09673
G3 X123.809 Y118.327 I-.081 J.995 E.06563
; CHANGE_LAYER
; Z_HEIGHT: 14.6
; LAYER_HEIGHT: 0.0551729
; WIPE_START
G1 F24000
G1 X123.507 Y118.92 E-.25264
G1 X122.172 Y118.905 E-.50736
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 124/151
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
G3 Z14.945 I-1.136 J.436 P1  F30000
G1 X123.898 Y123.398 Z14.945
G1 Z14.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1567
G1 X123.898 Y129.898 E.21562
G1 X121.102 Y129.898 E.09274
G1 X121.102 Y120.102 E.32495
G1 X136.898 Y120.102 E.52398
G1 X136.898 Y129.898 E.32495
G1 X131.102 Y129.898 E.19226
G1 X131.102 Y123.398 E.21562
G1 X123.958 Y123.398 E.23698
G1 X124.29 Y123.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1567
G1 X124.29 Y130.29 E.19973
G1 X120.71 Y130.29 E.11
G1 X120.71 Y119.71 E.32509
G1 X137.29 Y119.71 E.50946
G1 X137.29 Y130.29 E.32509
G1 X130.71 Y130.29 E.20219
G1 X130.71 Y123.79 E.19973
G1 X124.35 Y123.79 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X124.332 Y125.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15 I.774 J-.939 P1  F30000
G1 X123.55 Y125.146 Z15
G1 Z14.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1567
G1 X123.55 Y126.774 E.05401
G1 X121.45 Y128.874 E.09848
G1 X121.45 Y127.126 E.05796
G1 X123.55 Y129.226 E.09848
G1 X123.55 Y129.55 E.01075
G1 X122.245 Y129.55 E.04327
G1 X121.45 Y122.826 F30000
G1 F1567
G1 X121.45 Y121.198 E.05401
G1 X122.198 Y120.45 E.03506
G1 X122.45 Y120.45 E.00838
G1 X125.05 Y123.05 E.12194
G1 X127.274 Y123.05 E.0738
G1 X129.874 Y120.45 E.12194
G1 X130.126 Y120.45 E.00838
G1 X136.55 Y126.874 E.30133
G1 X136.55 Y129.126 E.07472
G1 X136.126 Y129.55 E.01986
G1 X131.55 Y129.55 E.15182
G1 X131.45 Y129.45 E.00466
G1 X131.45 Y126.55 E.09622
G1 X136.55 Y121.45 E.23922
G1 X136.55 Y120.45 E.03317
G1 X135.921 Y120.45 E.02084
; CHANGE_LAYER
; Z_HEIGHT: 14.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X136.55 Y120.45 E-.23876
G1 X136.55 Y121.45 E-.38
G1 X136.287 Y121.713 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 125/151
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
G3 Z15 I-.164 J-1.206 P1  F30000
G1 X123.898 Y123.398 Z15
G1 Z14.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1414
G1 X123.898 Y129.898 E.21562
G1 X121.102 Y129.898 E.09274
G1 X121.102 Y120.102 E.32495
G1 X136.898 Y120.102 E.52398
G1 X136.898 Y129.898 E.32495
G1 X131.102 Y129.898 E.19226
G1 X131.102 Y123.398 E.21562
G1 X123.958 Y123.398 E.23698
G1 X124.29 Y123.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1414
G1 X124.29 Y130.29 E.19973
G1 X120.71 Y130.29 E.11
G1 X120.71 Y119.71 E.32509
G1 X137.29 Y119.71 E.50946
G1 X137.29 Y130.29 E.32509
G1 X130.71 Y130.29 E.20219
G1 X130.71 Y123.79 E.19973
G1 X124.35 Y123.79 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X124.332 Y125.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.2 I.774 J-.939 P1  F30000
G1 X123.55 Y125.146 Z15.2
G1 Z14.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1414
G1 X123.55 Y126.774 E.05401
G1 X121.45 Y128.874 E.09848
G1 X121.45 Y127.126 E.05796
G1 X123.55 Y129.226 E.09848
G1 X123.55 Y129.55 E.01075
G1 X122.245 Y129.55 E.04327
G1 X121.45 Y122.826 F30000
G1 F1414
G1 X121.45 Y121.198 E.05401
G1 X122.198 Y120.45 E.03506
G1 X122.45 Y120.45 E.00838
G1 X125.05 Y123.05 E.12194
G1 X127.274 Y123.05 E.0738
M73 P83 R3
G1 X129.874 Y120.45 E.12194
G1 X130.126 Y120.45 E.00838
G1 X136.55 Y126.874 E.30133
G1 X136.55 Y129.126 E.07472
G1 X136.126 Y129.55 E.01986
G1 X131.55 Y129.55 E.15182
G1 X131.45 Y129.45 E.00466
G1 X131.45 Y126.55 E.09622
G1 X136.55 Y121.45 E.23922
G1 X136.55 Y120.45 E.03317
G1 X135.921 Y120.45 E.02084
; CHANGE_LAYER
; Z_HEIGHT: 14.8207
; LAYER_HEIGHT: 0.020689
; WIPE_START
G1 F24000
G1 X136.55 Y120.45 E-.23876
G1 X136.55 Y121.45 E-.38
G1 X136.287 Y121.713 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 126/151
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
G3 Z15.2 I1.217 J0 P1  F30000
G1 X136.287 Y118.92 Z15.2
G1 Z14.821
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.275862
G1 F1564
G1 X133.731 Y118.92 E.10366
G3 X134.474 Y118.579 I.746 J.646 E.0342
G2 X134.543 Y118.203 I-.353 J-.259 E.01602
G3 X135.573 Y117.15 I1.253 J.194 E.06378
G3 X136.1 Y117.038 I.457 J.854 E.02211
G3 X136.888 Y118.526 I-.075 J.993 E.08143
G2 X137.269 Y118.92 I1.289 J-.868 E.02232
G1 X136.347 Y118.92 E.03741
; WIPE_START
G1 F24000
G1 X134.347 Y118.92 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.221 I.055 J-1.216 P1  F30000
G1 X123.749 Y118.443 Z15.221
G1 Z14.821
G1 E.8 F1800
G1 F1564
G3 X123.508 Y118.92 I-.957 J-.185 E.02192
G1 X122.054 Y118.906 E.05897
G3 X122.873 Y117.288 I.786 J-.619 E.09212
G3 X123.758 Y118.386 I-.081 J.971 E.06394
; CHANGE_LAYER
; Z_HEIGHT: 15
; LAYER_HEIGHT: 0.179311
; WIPE_START
G1 F24000
G1 X123.508 Y118.92 E-.22407
G1 X122.098 Y118.906 E-.53593
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 127/151
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
G3 Z15.221 I-1.13 J.453 P1  F30000
G1 X123.898 Y123.398 Z15.221
G1 Z15
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1564
G1 X123.898 Y129.898 E.21562
G1 X121.102 Y129.898 E.09274
G1 X121.102 Y120.102 E.32495
G1 X136.898 Y120.102 E.52398
G1 X136.898 Y129.898 E.32495
G1 X131.102 Y129.898 E.19226
G1 X131.102 Y123.398 E.21562
G1 X123.958 Y123.398 E.23698
G1 X124.29 Y123.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1564
G1 X124.29 Y130.29 E.19973
G1 X120.71 Y130.29 E.11
G1 X120.71 Y119.71 E.32509
G1 X137.29 Y119.71 E.50946
G1 X137.29 Y130.29 E.32509
G1 X130.71 Y130.29 E.20219
G1 X130.71 Y123.79 E.19973
G1 X124.35 Y123.79 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X124.332 Y125.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.4 I.774 J-.939 P1  F30000
G1 X123.55 Y125.146 Z15.4
G1 Z15
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1564
G1 X123.55 Y126.774 E.05401
G1 X121.45 Y128.874 E.09848
G1 X121.45 Y127.126 E.05796
G1 X123.55 Y129.226 E.09848
G1 X123.55 Y129.55 E.01075
G1 X122.245 Y129.55 E.04327
G1 X121.45 Y122.826 F30000
G1 F1564
G1 X121.45 Y121.198 E.05401
G1 X122.198 Y120.45 E.03506
G1 X122.45 Y120.45 E.00838
G1 X125.05 Y123.05 E.12194
G1 X127.274 Y123.05 E.0738
G1 X129.874 Y120.45 E.12194
G1 X130.126 Y120.45 E.00838
G1 X136.55 Y126.874 E.30133
G1 X136.55 Y129.126 E.07472
G1 X136.126 Y129.55 E.01986
G1 X131.55 Y129.55 E.15182
G1 X131.45 Y129.45 E.00466
G1 X131.45 Y126.55 E.09622
G1 X136.55 Y121.45 E.23922
G1 X136.55 Y120.45 E.03317
G1 X135.921 Y120.45 E.02084
; CHANGE_LAYER
; Z_HEIGHT: 15.0966
; LAYER_HEIGHT: 0.0965519
; WIPE_START
G1 F24000
G1 X136.55 Y120.45 E-.23876
G1 X136.55 Y121.45 E-.38
G1 X136.287 Y121.713 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 128/151
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
G3 Z15.4 I1.217 J.006 P1  F30000
G1 X136.3 Y118.915 Z15.4
G1 Z15.097
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.275862
M73 P84 R3
G1 F1561
G1 X133.777 Y118.903 E.10231
G3 X134.42 Y118.608 I.695 J.667 E.02937
G2 X134.516 Y117.992 I-.906 J-.456 E.02571
G3 X135.629 Y117.212 I1.183 J.504 E.05805
G3 X136.142 Y117.103 I.445 J.833 E.02156
G3 X136.909 Y118.562 I-.074 J.97 E.07976
G2 X137.237 Y118.92 I.838 J-.44 E.01988
G1 X136.36 Y118.915 E.03556
; WIPE_START
G1 F24000
G1 X134.36 Y118.906 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.497 I.053 J-1.216 P1  F30000
G1 X123.709 Y118.444 Z15.497
G1 Z15.097
G1 E.8 F1800
G1 F1561
G3 X123.504 Y118.92 I-.94 J-.123 E.02128
G1 X122.009 Y118.91 E.06059
G3 X122.845 Y117.376 I.807 J-.555 E.08746
G3 X123.714 Y118.385 I-.076 J.945 E.05991
; CHANGE_LAYER
; Z_HEIGHT: 15.2
; LAYER_HEIGHT: 0.103448
; WIPE_START
G1 F24000
G1 X123.504 Y118.92 E-.21821
G1 X122.078 Y118.91 E-.54179
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 129/151
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
G3 Z15.497 I-1.128 J.457 P1  F30000
G1 X123.898 Y123.398 Z15.497
G1 Z15.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1561
G1 X123.898 Y129.898 E.21562
G1 X121.102 Y129.898 E.09274
G1 X121.102 Y120.102 E.32495
G1 X136.898 Y120.102 E.52398
G1 X136.898 Y129.898 E.32495
G1 X131.102 Y129.898 E.19226
G1 X131.102 Y123.398 E.21562
G1 X123.958 Y123.398 E.23698
G1 X124.29 Y123.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1561
G1 X124.29 Y130.29 E.19973
G1 X120.71 Y130.29 E.11
G1 X120.71 Y119.71 E.32509
G1 X137.29 Y119.71 E.50946
G1 X137.29 Y130.29 E.32509
G1 X130.71 Y130.29 E.20219
G1 X130.71 Y123.79 E.19973
G1 X124.35 Y123.79 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X124.332 Y125.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.6 I.774 J-.939 P1  F30000
G1 X123.55 Y125.146 Z15.6
G1 Z15.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1561
G1 X123.55 Y126.774 E.05401
G1 X121.45 Y128.874 E.09848
G1 X121.45 Y127.126 E.05796
G1 X123.55 Y129.226 E.09848
G1 X123.55 Y129.55 E.01075
G1 X122.245 Y129.55 E.04327
G1 X121.45 Y122.826 F30000
G1 F1561
G1 X121.45 Y121.198 E.05401
G1 X122.198 Y120.45 E.03506
G1 X122.45 Y120.45 E.00838
G1 X125.05 Y123.05 E.12194
G1 X127.274 Y123.05 E.0738
G1 X129.874 Y120.45 E.12194
G1 X130.126 Y120.45 E.00838
G1 X136.55 Y126.874 E.30133
G1 X136.55 Y129.126 E.07472
G1 X136.126 Y129.55 E.01986
G1 X131.55 Y129.55 E.15182
G1 X131.45 Y129.45 E.00466
G1 X131.45 Y126.55 E.09622
G1 X136.55 Y121.45 E.23922
G1 X136.55 Y120.45 E.03317
G1 X135.921 Y120.45 E.02084
; CHANGE_LAYER
; Z_HEIGHT: 15.3724
; LAYER_HEIGHT: 0.172414
; WIPE_START
G1 F24000
G1 X136.55 Y120.45 E-.23876
G1 X136.55 Y121.45 E-.38
G1 X136.287 Y121.713 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 130/151
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
G3 Z15.6 I1.217 J0 P1  F30000
G1 X136.287 Y118.92 Z15.6
G1 Z15.372
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.275862
G1 F1558
G1 X133.795 Y118.919 E.10105
G2 X134.425 Y118.51 I-1.237 J-2.591 E.03055
G3 X135.636 Y117.304 I1.024 J-.183 E.08135
G3 X136.185 Y117.17 I.489 J.807 E.02331
G3 X136.93 Y118.602 I-.073 J.948 E.07824
G2 X137.205 Y118.92 I1.001 J-.591 E.01713
G1 X136.347 Y118.92 E.0348
; WIPE_START
G1 F24000
G1 X134.347 Y118.919 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.772 I.054 J-1.216 P1  F30000
G1 X123.662 Y118.448 Z15.772
G1 Z15.372
G1 E.8 F1800
G1 F1558
G3 X123.494 Y118.92 I-.921 J-.061 E.02055
G1 X121.969 Y118.915 E.06185
G3 X122.816 Y117.466 I.818 J-.494 E.08307
G3 X123.664 Y118.389 I-.076 J.92 E.05585
; CHANGE_LAYER
; Z_HEIGHT: 15.4
; LAYER_HEIGHT: 0.027586
; WIPE_START
G1 F24000
G1 X123.494 Y118.92 E-.21165
G1 X122.051 Y118.915 E-.54835
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 131/151
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
G3 Z15.772 I-1.125 J.464 P1  F30000
G1 X123.898 Y123.398 Z15.772
G1 Z15.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1558
M73 P85 R3
G1 X123.898 Y129.898 E.21562
G1 X121.102 Y129.898 E.09274
G1 X121.102 Y120.102 E.32495
G1 X136.898 Y120.102 E.52398
G1 X136.898 Y129.898 E.32495
G1 X131.102 Y129.898 E.19226
G1 X131.102 Y123.398 E.21562
G1 X123.958 Y123.398 E.23698
G1 X124.29 Y123.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1558
G1 X124.29 Y130.29 E.19973
G1 X120.71 Y130.29 E.11
G1 X120.71 Y119.71 E.32509
G1 X137.29 Y119.71 E.50946
G1 X137.29 Y130.29 E.32509
G1 X130.71 Y130.29 E.20219
G1 X130.71 Y123.79 E.19973
G1 X124.35 Y123.79 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X124.332 Y125.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.8 I.774 J-.939 P1  F30000
G1 X123.55 Y125.146 Z15.8
G1 Z15.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1558
G1 X123.55 Y126.774 E.05401
G1 X121.45 Y128.874 E.09848
G1 X121.45 Y127.126 E.05796
G1 X123.55 Y129.226 E.09848
G1 X123.55 Y129.55 E.01075
G1 X122.245 Y129.55 E.04327
G1 X121.45 Y122.826 F30000
G1 F1558
G1 X121.45 Y121.198 E.05401
G1 X122.198 Y120.45 E.03506
G1 X122.45 Y120.45 E.00838
G1 X125.05 Y123.05 E.12194
G1 X127.274 Y123.05 E.0738
G1 X129.874 Y120.45 E.12194
G1 X130.126 Y120.45 E.00838
G1 X136.55 Y126.874 E.30133
G1 X136.55 Y129.126 E.07472
G1 X136.126 Y129.55 E.01986
G1 X131.55 Y129.55 E.15182
G1 X131.45 Y129.45 E.00466
G1 X131.45 Y126.55 E.09622
G1 X136.55 Y121.45 E.23922
G1 X136.55 Y120.45 E.03317
G1 X135.921 Y120.45 E.02084
; CHANGE_LAYER
; Z_HEIGHT: 15.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X136.55 Y120.45 E-.23876
G1 X136.55 Y121.45 E-.38
G1 X136.287 Y121.713 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 132/151
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
G3 Z15.8 I-.164 J-1.206 P1  F30000
M73 P85 R2
G1 X123.898 Y123.398 Z15.8
G1 Z15.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1414
G1 X123.898 Y129.898 E.21562
G1 X121.102 Y129.898 E.09274
G1 X121.102 Y120.102 E.32495
G1 X136.898 Y120.102 E.52398
G1 X136.898 Y129.898 E.32495
G1 X131.102 Y129.898 E.19226
G1 X131.102 Y123.398 E.21562
G1 X123.958 Y123.398 E.23698
G1 X124.29 Y123.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1414
G1 X124.29 Y130.29 E.19973
G1 X120.71 Y130.29 E.11
G1 X120.71 Y119.71 E.32509
G1 X137.29 Y119.71 E.50946
G1 X137.29 Y130.29 E.32509
G1 X130.71 Y130.29 E.20219
G1 X130.71 Y123.79 E.19973
G1 X124.35 Y123.79 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X124.332 Y125.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16 I.774 J-.939 P1  F30000
G1 X123.55 Y125.146 Z16
G1 Z15.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1414
G1 X123.55 Y126.774 E.05401
G1 X121.45 Y128.874 E.09848
G1 X121.45 Y127.126 E.05796
G1 X123.55 Y129.226 E.09848
G1 X123.55 Y129.55 E.01075
G1 X122.245 Y129.55 E.04327
G1 X121.45 Y122.826 F30000
G1 F1414
G1 X121.45 Y121.198 E.05401
G1 X122.198 Y120.45 E.03506
G1 X122.45 Y120.45 E.00838
G1 X125.05 Y123.05 E.12194
G1 X127.274 Y123.05 E.0738
G1 X129.874 Y120.45 E.12194
G1 X130.126 Y120.45 E.00838
G1 X136.55 Y126.874 E.30133
G1 X136.55 Y129.126 E.07472
G1 X136.126 Y129.55 E.01986
G1 X131.55 Y129.55 E.15182
G1 X131.45 Y129.45 E.00466
G1 X131.45 Y126.55 E.09622
G1 X136.55 Y121.45 E.23922
G1 X136.55 Y120.45 E.03317
G1 X135.921 Y120.45 E.02084
; CHANGE_LAYER
; Z_HEIGHT: 15.6483
; LAYER_HEIGHT: 0.0482759
; WIPE_START
G1 F24000
G1 X136.55 Y120.45 E-.23876
G1 X136.55 Y121.45 E-.38
G1 X136.287 Y121.713 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 133/151
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
G3 Z16 I1.217 J0 P1  F30000
G1 X136.287 Y118.92 Z16
M73 P86 R2
G1 Z15.648
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.275862
G1 F1556
G1 X133.829 Y118.92 E.09967
G2 X134.348 Y118.551 I-.724 J-1.569 E.02598
G3 X135.634 Y117.408 I.948 J-.228 E.0854
G3 X136.23 Y117.236 I.529 J.719 E.02569
G3 X136.951 Y118.642 I-.072 J.925 E.07668
G2 X137.171 Y118.92 I.632 J-.275 E.01452
G1 X136.347 Y118.92 E.03342
; WIPE_START
G1 F24000
G1 X134.347 Y118.92 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.048 I.052 J-1.216 P1  F30000
G1 X123.613 Y118.457 Z16.048
G1 Z15.648
G1 E.8 F1800
G1 F1556
G3 X123.48 Y118.92 I-.896 J-.005 E.01977
G1 X121.932 Y118.92 E.0628
G3 X122.787 Y117.558 I.831 J-.427 E.0785
G3 X123.611 Y118.398 I-.07 J.893 E.05206
; CHANGE_LAYER
; Z_HEIGHT: 15.8
; LAYER_HEIGHT: 0.151724
; WIPE_START
G1 F24000
G1 X123.48 Y118.92 E-.20445
G1 X122.019 Y118.92 E-.55555
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 134/151
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
G3 Z16.048 I-1.122 J.471 P1  F30000
G1 X123.898 Y123.398 Z16.048
G1 Z15.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1556
G1 X123.898 Y129.898 E.21562
G1 X121.102 Y129.898 E.09274
G1 X121.102 Y120.102 E.32495
G1 X136.898 Y120.102 E.52398
G1 X136.898 Y129.898 E.32495
G1 X131.102 Y129.898 E.19226
G1 X131.102 Y123.398 E.21562
G1 X123.958 Y123.398 E.23698
G1 X124.29 Y123.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1556
G1 X124.29 Y130.29 E.19973
G1 X120.71 Y130.29 E.11
G1 X120.71 Y119.71 E.32509
G1 X137.29 Y119.71 E.50946
G1 X137.29 Y130.29 E.32509
G1 X130.71 Y130.29 E.20219
G1 X130.71 Y123.79 E.19973
G1 X124.35 Y123.79 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X124.332 Y125.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.2 I.774 J-.939 P1  F30000
G1 X123.55 Y125.146 Z16.2
G1 Z15.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1556
G1 X123.55 Y126.774 E.05401
G1 X121.45 Y128.874 E.09848
G1 X121.45 Y127.126 E.05796
G1 X123.55 Y129.226 E.09848
G1 X123.55 Y129.55 E.01075
G1 X122.245 Y129.55 E.04327
G1 X121.45 Y122.826 F30000
G1 F1556
G1 X121.45 Y121.198 E.05401
G1 X122.198 Y120.45 E.03506
G1 X122.45 Y120.45 E.00838
G1 X125.05 Y123.05 E.12194
G1 X127.274 Y123.05 E.0738
G1 X129.874 Y120.45 E.12194
G1 X130.126 Y120.45 E.00838
G1 X136.55 Y126.874 E.30133
G1 X136.55 Y129.126 E.07472
G1 X136.126 Y129.55 E.01986
G1 X131.55 Y129.55 E.15182
G1 X131.45 Y129.45 E.00466
G1 X131.45 Y126.55 E.09622
G1 X136.55 Y121.45 E.23922
G1 X136.55 Y120.45 E.03317
G1 X135.921 Y120.45 E.02084
; CHANGE_LAYER
; Z_HEIGHT: 15.9241
; LAYER_HEIGHT: 0.124138
; WIPE_START
G1 F24000
G1 X136.55 Y120.45 E-.23876
G1 X136.55 Y121.45 E-.38
G1 X136.287 Y121.713 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 135/151
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
G3 Z16.2 I1.217 J.002 P1  F30000
G1 X136.291 Y118.918 Z16.2
G1 Z15.924
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.275862
G1 F1553
G1 X133.869 Y118.914 E.09825
G2 X134.272 Y118.59 I-1.46 J-2.229 E.02101
G3 X135.654 Y117.503 I.954 J-.209 E.08876
G3 X136.275 Y117.304 I.56 J.679 E.02708
G3 X136.973 Y118.673 I-.064 J.895 E.07482
G2 X137.137 Y118.92 I.355 J-.059 E.01237
G1 X136.351 Y118.918 E.03185
; WIPE_START
G1 F24000
G1 X134.351 Y118.915 E-.76
; WIPE_END
M73 P87 R2
G1 E-.04 F1800
G17
G3 Z16.324 I.044 J-1.216 P1  F30000
G1 X123.559 Y118.526 Z16.324
G1 Z15.924
G1 E.8 F1800
G1 F1553
G3 X123.462 Y118.92 I-.871 J-.006 E.01658
G1 X121.896 Y118.92 E.06349
G3 X122.757 Y117.651 I.836 J-.359 E.0739
G3 X123.557 Y118.467 I-.069 J.869 E.05055
; CHANGE_LAYER
; Z_HEIGHT: 16
; LAYER_HEIGHT: 0.0758619
; WIPE_START
G1 F24000
G1 X123.462 Y118.92 E-.17568
G1 X121.924 Y118.92 E-.58432
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 136/151
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
G3 Z16.324 I-1.114 J.491 P1  F30000
G1 X123.898 Y123.398 Z16.324
G1 Z16
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1553
G1 X123.898 Y129.898 E.21562
G1 X121.102 Y129.898 E.09274
G1 X121.102 Y120.102 E.32495
G1 X136.898 Y120.102 E.52398
G1 X136.898 Y129.898 E.32495
G1 X131.102 Y129.898 E.19226
G1 X131.102 Y123.398 E.21562
G1 X123.958 Y123.398 E.23698
G1 X124.29 Y123.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1553
G1 X124.29 Y130.29 E.19973
G1 X120.71 Y130.29 E.11
G1 X120.71 Y119.71 E.32509
G1 X137.29 Y119.71 E.50946
G1 X137.29 Y130.29 E.32509
G1 X130.71 Y130.29 E.20219
G1 X130.71 Y123.79 E.19973
G1 X124.35 Y123.79 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X124.332 Y125.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.4 I.774 J-.939 P1  F30000
G1 X123.55 Y125.146 Z16.4
G1 Z16
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1553
G1 X123.55 Y126.774 E.05401
G1 X121.45 Y128.874 E.09848
G1 X121.45 Y127.126 E.05796
G1 X123.55 Y129.226 E.09848
G1 X123.55 Y129.55 E.01075
G1 X122.245 Y129.55 E.04327
G1 X121.45 Y122.826 F30000
G1 F1553
G1 X121.45 Y121.198 E.05401
G1 X122.198 Y120.45 E.03506
G1 X122.45 Y120.45 E.00838
G1 X125.05 Y123.05 E.12194
G1 X127.274 Y123.05 E.0738
G1 X129.874 Y120.45 E.12194
G1 X130.126 Y120.45 E.00838
G1 X136.55 Y126.874 E.30133
G1 X136.55 Y129.126 E.07472
G1 X136.126 Y129.55 E.01986
G1 X131.55 Y129.55 E.15182
G1 X131.45 Y129.45 E.00466
G1 X131.45 Y126.55 E.09622
G1 X136.55 Y121.45 E.23922
G1 X136.55 Y120.45 E.03317
G1 X135.921 Y120.45 E.02084
; CHANGE_LAYER
; Z_HEIGHT: 16.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X136.55 Y120.45 E-.23876
G1 X136.55 Y121.45 E-.38
G1 X136.287 Y121.713 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 137/151
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
G3 Z16.4 I1.217 J0 P1  F30000
G1 X136.287 Y118.92 Z16.4
G1 Z16.2
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.275862
G1 F1550
G1 X133.899 Y118.92 E.09684
G2 X134.197 Y118.643 I-.685 J-1.037 E.01658
G3 X135.55 Y117.624 I.85 J-.278 E.09011
G3 X136.32 Y117.372 I.858 J1.313 E.03325
G3 X136.992 Y118.719 I-.063 J.873 E.0735
G2 X137.101 Y118.92 I.221 J.01 E.00974
G1 X136.347 Y118.92 E.03059
; WIPE_START
G1 F24000
G1 X134.347 Y118.92 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.6 I.042 J-1.216 P1  F30000
G1 X123.505 Y118.542 Z16.6
G1 Z16.2
G1 E.8 F1800
G1 F1550
G3 X123.438 Y118.92 I-.842 J.045 E.0157
G1 X121.856 Y118.893 E.06415
G3 X122.726 Y117.746 I.848 J-.261 E.06815
G3 X123.5 Y118.483 I-.064 J.841 E.04694
; WIPE_START
G1 F24000
G1 X123.438 Y118.92 E-.16755
G1 X121.879 Y118.893 E-.59245
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.6 I-1.11 J.498 P1  F30000
G1 X123.898 Y123.398 Z16.6
G1 Z16.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1550
G1 X123.898 Y129.898 E.21562
G1 X121.102 Y129.898 E.09274
G1 X121.102 Y120.102 E.32495
G1 X136.898 Y120.102 E.52398
G1 X136.898 Y129.898 E.32495
G1 X131.102 Y129.898 E.19226
G1 X131.102 Y123.398 E.21562
G1 X123.958 Y123.398 E.23698
G1 X124.29 Y123.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1550
G1 X124.29 Y130.29 E.19973
G1 X120.71 Y130.29 E.11
G1 X120.71 Y119.71 E.32509
G1 X137.29 Y119.71 E.50946
G1 X137.29 Y130.29 E.32509
G1 X130.71 Y130.29 E.20219
G1 X130.71 Y123.79 E.19973
G1 X124.35 Y123.79 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X124.332 Y125.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.6 I.774 J-.939 P1  F30000
G1 X123.55 Y125.146 Z16.6
G1 Z16.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1550
G1 X123.55 Y126.774 E.05401
G1 X121.45 Y128.874 E.09848
G1 X121.45 Y127.126 E.05796
G1 X123.55 Y129.226 E.09848
G1 X123.55 Y129.55 E.01075
G1 X122.245 Y129.55 E.04327
G1 X121.45 Y122.826 F30000
G1 F1550
G1 X121.45 Y121.198 E.05401
G1 X122.198 Y120.45 E.03506
G1 X122.45 Y120.45 E.00838
G1 X125.05 Y123.05 E.12194
G1 X127.274 Y123.05 E.0738
G1 X129.874 Y120.45 E.12194
G1 X130.126 Y120.45 E.00838
G1 X136.55 Y126.874 E.30133
G1 X136.55 Y129.126 E.07472
G1 X136.126 Y129.55 E.01986
G1 X131.55 Y129.55 E.15182
G1 X131.45 Y129.45 E.00466
G1 X131.45 Y126.55 E.09622
G1 X136.55 Y121.45 E.23922
M73 P88 R2
G1 X136.55 Y120.45 E.03317
G1 X135.921 Y120.45 E.02084
; CHANGE_LAYER
; Z_HEIGHT: 16.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X136.55 Y120.45 E-.23876
G1 X136.55 Y121.45 E-.38
G1 X136.287 Y121.713 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 138/151
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
G3 Z16.6 I1.217 J0 P1  F30000
G1 X136.287 Y118.911 Z16.6
G1 Z16.4
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F1617
G1 X133.942 Y118.911 E.07206
G2 X134.061 Y118.308 I-.636 J-.44 E.01944
G3 X135.55 Y117.706 I.919 J.131 E.0596
G3 X136.367 Y117.442 I.809 J1.107 E.02686
G3 X137.065 Y118.869 I-.221 J.992 E.05603
G1 X137.094 Y118.911 E.00157
G1 X136.347 Y118.911 E.02296
G1 X136.14 Y118.893 F30000
G1 F1617
G1 X136.14 Y117.65 E.03817
G1 X136.044 Y117.684 E.00311
G3 X135.262 Y117.794 I-.447 J-.348 E.02683
G1 X135.262 Y118.723 E.02856
G1 X134.385 Y118.723 E.02695
G1 X134.385 Y117.744 E.03007
; WIPE_START
G1 F24000
G1 X134.385 Y118.723 E-.37188
G1 X135.262 Y118.723 E-.33329
G1 X135.262 Y118.579 E-.05483
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.8 I.03 J-1.217 P1  F30000
G1 X123.703 Y118.297 Z16.8
G1 Z16.4
G1 E.8 F1800
G1 F1617
G1 X123.703 Y118.911 E.01889
G1 X121.297 Y118.911 E.07396
G1 X121.297 Y118.297 E.01889
G2 X121.896 Y118.267 I.265 J-.727 E.01895
G3 X122.695 Y117.844 I.786 J.518 E.02897
G3 X123.467 Y118.297 I-.13 J1.106 E.0283
G1 X123.643 Y118.297 E.00542
G1 X122.983 Y118.893 F30000
G1 F1617
G1 X122.983 Y118.131 E.02339
G1 X122.762 Y118.041 E.00736
G1 X122.491 Y118.053 E.00832
G2 X122.106 Y118.322 I.216 J.721 E.01467
G1 X122.106 Y118.893 E.01754
; WIPE_START
G1 F24000
G1 X122.106 Y118.322 E-.21693
G1 X122.491 Y118.053 E-.17834
G1 X122.762 Y118.041 E-.10287
G1 X122.983 Y118.131 E-.09096
G1 X122.983 Y118.581 E-.1709
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.8 I-1.196 J.227 P1  F30000
G1 X123.898 Y123.398 Z16.8
G1 Z16.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1617
G1 X123.898 Y129.898 E.21562
G1 X121.102 Y129.898 E.09274
G1 X121.102 Y120.102 E.32495
G1 X136.898 Y120.102 E.52398
G1 X136.898 Y129.898 E.32495
G1 X131.102 Y129.898 E.19226
G1 X131.102 Y123.398 E.21562
G1 X123.958 Y123.398 E.23698
G1 X124.29 Y123.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1617
G1 X124.29 Y130.29 E.19973
G1 X120.71 Y130.29 E.11
G1 X120.71 Y119.71 E.32509
G1 X137.29 Y119.71 E.50946
G1 X137.29 Y130.29 E.32509
G1 X130.71 Y130.29 E.20219
G1 X130.71 Y123.79 E.19973
G1 X124.35 Y123.79 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X124.332 Y125.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.8 I.774 J-.939 P1  F30000
G1 X123.55 Y125.146 Z16.8
G1 Z16.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1617
G1 X123.55 Y126.774 E.05401
G1 X121.45 Y128.874 E.09848
G1 X121.45 Y127.126 E.05796
G1 X123.55 Y129.226 E.09848
G1 X123.55 Y129.55 E.01075
G1 X122.245 Y129.55 E.04327
G1 X121.45 Y122.826 F30000
G1 F1617
G1 X121.45 Y121.198 E.05401
G1 X122.198 Y120.45 E.03506
G1 X122.45 Y120.45 E.00838
G1 X125.05 Y123.05 E.12194
G1 X127.274 Y123.05 E.0738
G1 X129.874 Y120.45 E.12194
G1 X130.126 Y120.45 E.00838
G1 X136.55 Y126.874 E.30133
G1 X136.55 Y129.126 E.07472
G1 X136.126 Y129.55 E.01986
G1 X131.55 Y129.55 E.15182
G1 X131.45 Y129.45 E.00466
G1 X131.45 Y126.55 E.09622
G1 X136.55 Y121.45 E.23922
G1 X136.55 Y120.45 E.03317
G1 X135.921 Y120.45 E.02084
; CHANGE_LAYER
; Z_HEIGHT: 16.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X136.55 Y120.45 E-.23876
G1 X136.55 Y121.45 E-.38
G1 X136.287 Y121.713 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 139/151
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
G3 Z16.8 I1.171 J.331 P1  F30000
G1 X137.102 Y118.826 Z16.8
G1 Z16.6
G1 E.8 F1800
; FEATURE: Support interface
; LINE_WIDTH: 0.42
G1 F1579
G2 X137.017 Y117.805 I-.838 J-.444 E.03324
G1 X137.017 Y118.911 E.034
G1 X136.14 Y118.911 E.02695
G1 X136.14 Y117.511 E.04303
G2 X135.597 Y117.823 I.45 J1.411 E.01939
M73 P89 R2
G1 X135.262 Y117.663 E.01138
G1 X135.262 Y118.911 E.03835
G1 X134.385 Y118.911 E.02695
G1 X134.385 Y117.676 E.03796
G2 X133.952 Y118.385 I.404 J.733 E.02671
G3 X133.921 Y118.911 I-.82 J.215 E.01648
G1 X134.197 Y118.911 E.00848
; WIPE_START
G1 F24000
G1 X133.921 Y118.911 E-.10492
G1 X134.006 Y118.801 E-.05307
G1 X133.952 Y118.385 E-.15949
G1 X134.062 Y117.993 E-.15467
G1 X134.385 Y117.676 E-.17199
G1 X134.385 Y117.981 E-.11586
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17 I-.101 J-1.213 P1  F30000
G1 X123.172 Y118.911 Z17
G1 Z16.6
G1 E.8 F1800
G1 F1579
G1 X123.703 Y118.911 E.01633
G1 X123.703 Y118.297 E.01889
G1 X123.35 Y118.297 E.01085
G2 X123.004 Y118.011 I-1.253 J1.165 E.01383
G1 X122.983 Y118.911 E.02768
G1 X122.106 Y118.911 E.02695
G1 X122.106 Y118.101 E.02491
G2 X121.889 Y118.297 I1.478 J1.862 E.009
G1 X121.297 Y118.297 E.0182
G1 X121.297 Y118.911 E.01889
G1 X121.918 Y118.911 E.01909
; WIPE_START
G1 F24000
G1 X121.297 Y118.911 E-.23606
G1 X121.297 Y118.297 E-.23367
G1 X121.889 Y118.297 E-.22505
G1 X122.016 Y118.182 E-.06522
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17 I-1.145 J.413 P1  F30000
G1 X123.898 Y123.398 Z17
G1 Z16.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1579
G1 X123.898 Y129.898 E.21562
G1 X121.102 Y129.898 E.09274
G1 X121.102 Y120.102 E.32495
G1 X136.898 Y120.102 E.52398
G1 X136.898 Y129.898 E.32495
G1 X131.102 Y129.898 E.19226
G1 X131.102 Y123.398 E.21562
G1 X123.958 Y123.398 E.23698
G1 X124.29 Y123.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1579
G1 X124.29 Y130.29 E.19973
G1 X120.71 Y130.29 E.11
G1 X120.71 Y119.71 E.32509
G1 X137.29 Y119.71 E.50946
G1 X137.29 Y130.29 E.32509
G1 X130.71 Y130.29 E.20219
G1 X130.71 Y123.79 E.19973
G1 X124.35 Y123.79 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X124.332 Y125.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17 I.774 J-.939 P1  F30000
G1 X123.55 Y125.146 Z17
G1 Z16.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1579
G1 X123.55 Y126.774 E.05401
G1 X121.45 Y128.874 E.09848
G1 X121.45 Y127.126 E.05796
G1 X123.55 Y129.226 E.09848
G1 X123.55 Y129.55 E.01075
G1 X122.245 Y129.55 E.04327
G1 X121.45 Y122.826 F30000
G1 F1579
G1 X121.45 Y121.198 E.05401
G1 X122.198 Y120.45 E.03506
G1 X122.45 Y120.45 E.00838
G1 X125.05 Y123.05 E.12194
G1 X127.274 Y123.05 E.0738
G1 X129.874 Y120.45 E.12194
G1 X130.126 Y120.45 E.00838
G1 X136.55 Y126.874 E.30133
G1 X136.55 Y129.126 E.07472
G1 X136.126 Y129.55 E.01986
G1 X131.55 Y129.55 E.15182
G1 X131.45 Y129.45 E.00466
G1 X131.45 Y126.55 E.09622
G1 X136.55 Y121.45 E.23922
G1 X136.55 Y120.45 E.03317
G1 X135.921 Y120.45 E.02084
; CHANGE_LAYER
; Z_HEIGHT: 16.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X136.55 Y120.45 E-.23876
G1 X136.55 Y121.45 E-.38
G1 X136.287 Y121.713 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 140/151
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
G3 Z17 I1.166 J.349 P1  F30000
G1 X137.146 Y118.842 Z17
G1 Z16.8
G1 E.8 F1800
; FEATURE: Support interface
; LINE_WIDTH: 0.42
G1 F1581
G2 X137.025 Y117.802 I-.779 J-.436 E.03437
G1 X137.017 Y118.911 E.03408
G1 X136.14 Y118.911 E.02695
G1 X136.14 Y117.576 E.04103
G2 X135.54 Y117.946 I.696 J1.799 E.02175
G1 X135.262 Y117.766 E.01016
G1 X135.262 Y118.911 E.03519
G1 X134.385 Y118.911 E.02695
G1 X134.385 Y117.648 E.03881
G2 X133.759 Y118.911 I.088 J.83 E.05156
G1 X134.197 Y118.911 E.01344
; WIPE_START
G1 F24000
G1 X133.759 Y118.911 E-.16626
G1 X133.648 Y118.509 E-.15868
G1 X133.724 Y118.113 E-.15335
G1 X133.981 Y117.802 E-.15335
G1 X134.297 Y117.682 E-.12836
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.2 I-.134 J-1.21 P1  F30000
G1 X123.172 Y118.911 Z17.2
G1 Z16.8
G1 E.8 F1800
G1 F1581
G1 X123.703 Y118.911 E.01633
G1 X123.703 Y118.297 E.01889
G3 X122.983 Y118.098 I-.169 J-.794 E.02385
G1 X122.983 Y118.911 E.02499
G1 X122.106 Y118.911 E.02695
G1 X122.106 Y118.155 E.02325
G1 X121.904 Y118.297 E.00758
G1 X121.297 Y118.297 E.01868
G1 X121.297 Y118.911 E.01889
G1 X121.918 Y118.911 E.01909
; WIPE_START
G1 F24000
G1 X121.297 Y118.911 E-.23606
G1 X121.297 Y118.297 E-.23367
G1 X121.904 Y118.297 E-.23099
G1 X122.032 Y118.207 E-.05928
; WIPE_END
G1 E-.04 F1800
G17
M73 P90 R2
G3 Z17.2 I-1.145 J.412 P1  F30000
G1 X123.898 Y123.398 Z17.2
G1 Z16.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1581
G1 X123.898 Y129.898 E.21562
G1 X121.102 Y129.898 E.09274
G1 X121.102 Y120.102 E.32495
G1 X136.898 Y120.102 E.52398
G1 X136.898 Y129.898 E.32495
G1 X131.102 Y129.898 E.19226
G1 X131.102 Y123.398 E.21562
G1 X123.958 Y123.398 E.23698
G1 X124.29 Y123.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1581
G1 X124.29 Y130.29 E.19973
G1 X120.71 Y130.29 E.11
G1 X120.71 Y119.71 E.32509
G1 X137.29 Y119.71 E.50946
G1 X137.29 Y130.29 E.32509
G1 X130.71 Y130.29 E.20219
G1 X130.71 Y123.79 E.19973
G1 X124.35 Y123.79 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X124.332 Y125.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.2 I.774 J-.939 P1  F30000
G1 X123.55 Y125.146 Z17.2
G1 Z16.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1581
G1 X123.55 Y126.774 E.05401
G1 X121.45 Y128.874 E.09848
G1 X121.45 Y127.126 E.05796
G1 X123.55 Y129.226 E.09848
G1 X123.55 Y129.55 E.01075
G1 X122.245 Y129.55 E.04327
G1 X121.45 Y122.826 F30000
G1 F1581
G1 X121.45 Y121.198 E.05401
G1 X122.198 Y120.45 E.03506
G1 X122.45 Y120.45 E.00838
G1 X125.05 Y123.05 E.12194
G1 X127.274 Y123.05 E.0738
G1 X129.874 Y120.45 E.12194
G1 X130.126 Y120.45 E.00838
G1 X136.55 Y126.874 E.30133
G1 X136.55 Y129.126 E.07472
G1 X136.126 Y129.55 E.01986
G1 X131.55 Y129.55 E.15182
G1 X131.45 Y129.45 E.00466
G1 X131.45 Y126.55 E.09622
G1 X136.55 Y121.45 E.23922
G1 X136.55 Y120.45 E.03317
G1 X135.921 Y120.45 E.02084
; CHANGE_LAYER
; Z_HEIGHT: 17
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X136.55 Y120.45 E-.23876
G1 X136.55 Y121.45 E-.38
G1 X136.287 Y121.713 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 141/151
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
G3 Z17.2 I-.164 J-1.206 P1  F30000
M73 P90 R1
G1 X123.898 Y123.398 Z17.2
G1 Z17
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1414
G1 X123.898 Y129.898 E.21562
G1 X121.102 Y129.898 E.09274
G1 X121.102 Y120.102 E.32495
G1 X136.898 Y120.102 E.52398
G1 X136.898 Y129.898 E.32495
G1 X131.102 Y129.898 E.19226
G1 X131.102 Y123.398 E.21562
G1 X123.958 Y123.398 E.23698
G1 X124.29 Y123.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1414
G1 X124.29 Y130.29 E.19973
G1 X120.71 Y130.29 E.11
G1 X120.71 Y119.71 E.32509
G1 X137.29 Y119.71 E.50946
G1 X137.29 Y130.29 E.32509
G1 X130.71 Y130.29 E.20219
G1 X130.71 Y123.79 E.19973
G1 X124.35 Y123.79 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X124.332 Y125.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.4 I.774 J-.939 P1  F30000
G1 X123.55 Y125.146 Z17.4
G1 Z17
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1414
G1 X123.55 Y126.774 E.05401
G1 X121.45 Y128.874 E.09848
G1 X121.45 Y127.126 E.05796
G1 X123.55 Y129.226 E.09848
G1 X123.55 Y129.55 E.01075
G1 X122.245 Y129.55 E.04327
G1 X121.45 Y122.826 F30000
G1 F1414
G1 X121.45 Y121.198 E.05401
G1 X122.198 Y120.45 E.03506
G1 X122.45 Y120.45 E.00838
G1 X125.05 Y123.05 E.12194
G1 X127.274 Y123.05 E.0738
G1 X129.874 Y120.45 E.12194
G1 X130.126 Y120.45 E.00838
G1 X136.55 Y126.874 E.30133
G1 X136.55 Y129.126 E.07472
G1 X136.126 Y129.55 E.01986
G1 X131.55 Y129.55 E.15182
G1 X131.45 Y129.45 E.00466
G1 X131.45 Y126.55 E.09622
G1 X136.55 Y121.45 E.23922
G1 X136.55 Y120.45 E.03317
G1 X135.921 Y120.45 E.02084
; CHANGE_LAYER
; Z_HEIGHT: 17.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X136.55 Y120.45 E-.23876
G1 X136.55 Y121.45 E-.38
G1 X136.287 Y121.713 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 142/151
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
G3 Z17.4 I-.164 J-1.206 P1  F30000
G1 X123.898 Y123.398 Z17.4
G1 Z17.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1476
G1 X123.898 Y129.898 E.21562
G1 X121.102 Y129.898 E.09274
G1 X121.102 Y120.102 E.32495
M73 P91 R1
G1 X122.102 Y120.102 E.03317
G1 X122.102 Y119.3 E.02661
M204 S5000
; FEATURE: Overhang wall
M106 S255
G1 F3000
G1 X122.102 Y119.102 E.00657
G1 X122.898 Y119.102 E.0264
G1 X122.898 Y119.3 E.00657
M106 S252.45
M204 S10000
; FEATURE: Inner wall
G1 F1476
G1 X122.898 Y120.102 E.02661
G1 X135.102 Y120.102 E.40483
G1 X135.102 Y119.3 E.02661
M204 S5000
; FEATURE: Overhang wall
M106 S255
G1 F3000
G1 X135.102 Y119.102 E.00657
G1 X135.898 Y119.102 E.0264
G1 X135.898 Y119.3 E.00657
M106 S252.45
M204 S10000
; FEATURE: Inner wall
G1 F1476
G1 X135.898 Y119.683 E.01269
G1 X135.898 Y120.102 E.01392
G1 X136.898 Y120.102 E.03317
G1 X136.898 Y129.898 E.32495
G1 X131.102 Y129.898 E.19226
G1 X131.102 Y123.398 E.21562
G1 X123.958 Y123.398 E.23698
G1 X124.29 Y123.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1476
G1 X124.29 Y130.29 E.19973
G1 X120.71 Y130.29 E.11
G1 X120.71 Y119.71 E.32509
G1 X121.71 Y119.71 E.03073
G1 X121.71 Y119.3 E.0126
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X121.71 Y118.71 E.01957
G1 X123.29 Y118.71 E.05241
G1 X123.29 Y119.3 E.01957
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1476
G1 X123.29 Y119.71 E.0126
G1 X134.71 Y119.71 E.3509
G1 X134.71 Y119.3 E.0126
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X134.71 Y118.71 E.01957
G1 X136.29 Y118.71 E.05241
G1 X136.29 Y119.3 E.01957
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1476
G1 X136.29 Y119.669 E.01134
G1 X136.29 Y119.71 E.00126
G1 X137.29 Y119.71 E.03073
G1 X137.29 Y130.29 E.32509
G1 X130.71 Y130.29 E.20219
G1 X130.71 Y123.79 E.19973
G1 X124.35 Y123.79 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X124.332 Y125.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.6 I.774 J-.939 P1  F30000
G1 X123.55 Y125.146 Z17.6
G1 Z17.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1476
G1 X123.55 Y126.774 E.05401
G1 X121.45 Y128.874 E.09848
G1 X121.45 Y127.126 E.05796
G1 X123.55 Y129.226 E.09848
G1 X123.55 Y129.55 E.01075
G1 X122.245 Y129.55 E.04327
; WIPE_START
G1 F24000
G1 X123.55 Y129.55 E-.49563
G1 X123.55 Y129.226 E-.12313
G1 X123.287 Y128.963 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.6 I1.213 J-.099 P1  F30000
G1 X122.5 Y119.306 Z17.6
G1 Z17.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1476
G1 X122.5 Y120.306 E.03168
G1 X121.45 Y122.826 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1476
G1 X121.45 Y121.198 E.05401
G1 X121.994 Y120.654 E.02551
G1 X122.654 Y120.654 E.02188
G1 X125.05 Y123.05 E.11239
G1 X127.274 Y123.05 E.0738
G1 X129.874 Y120.45 E.12194
G1 X130.126 Y120.45 E.00838
G1 X136.55 Y126.874 E.30133
G1 X136.55 Y129.126 E.07472
G1 X136.126 Y129.55 E.01986
G1 X131.55 Y129.55 E.15182
G1 X131.45 Y129.45 E.00466
G1 X131.45 Y126.55 E.09622
G1 X136.55 Y121.45 E.23922
G1 X136.55 Y120.45 E.03317
G1 X136.064 Y120.45 E.01611
G1 X136.064 Y120.593 E.00474
G1 X135.5 Y120.306 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1476
G1 X135.5 Y119.306 E.03168
; CHANGE_LAYER
; Z_HEIGHT: 17.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X135.5 Y120.306 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 143/151
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
G3 Z17.6 I-.313 J-1.176 P1  F30000
G1 X123.898 Y123.398 Z17.6
G1 Z17.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1491
G1 X123.898 Y129.898 E.21562
G1 X121.102 Y129.898 E.09274
G1 X121.102 Y120.102 E.32495
G1 X122.102 Y120.102 E.03317
G1 X122.102 Y119.102 E.03317
G1 X122.898 Y119.102 E.0264
G1 X122.898 Y120.102 E.03317
G1 X135.102 Y120.102 E.40483
G1 X135.102 Y119.102 E.03317
G1 X135.898 Y119.102 E.0264
G1 X135.898 Y120.102 E.03317
G1 X136.898 Y120.102 E.03317
G1 X136.898 Y129.898 E.32495
G1 X131.102 Y129.898 E.19226
G1 X131.102 Y123.398 E.21562
G1 X123.958 Y123.398 E.23698
G1 X124.29 Y123.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1491
G1 X124.29 Y130.29 E.19973
G1 X120.71 Y130.29 E.11
G1 X120.71 Y119.71 E.32509
G1 X121.71 Y119.71 E.03073
G1 X121.71 Y118.71 E.03073
G1 X123.29 Y118.71 E.04855
G1 X123.29 Y119.71 E.03073
G1 X134.71 Y119.71 E.3509
G1 X134.71 Y118.71 E.03073
G1 X136.29 Y118.71 E.04855
M73 P92 R1
G1 X136.29 Y119.71 E.03073
G1 X137.29 Y119.71 E.03073
G1 X137.29 Y130.29 E.32509
G1 X130.71 Y130.29 E.20219
G1 X130.71 Y123.79 E.19973
G1 X124.35 Y123.79 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X124.332 Y125.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.8 I.774 J-.939 P1  F30000
G1 X123.55 Y125.146 Z17.8
G1 Z17.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1491
G1 X123.55 Y126.774 E.05401
G1 X121.45 Y128.874 E.09848
G1 X121.45 Y127.126 E.05796
G1 X123.55 Y129.226 E.09848
G1 X123.55 Y129.55 E.01075
G1 X122.245 Y129.55 E.04327
G1 X122.5 Y119.306 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1491
G1 X122.5 Y120.306 E.03168
G1 X121.45 Y122.826 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1491
G1 X121.45 Y121.198 E.05401
G1 X121.994 Y120.654 E.02551
G1 X122.654 Y120.654 E.02188
G1 X125.05 Y123.05 E.11239
G1 X127.274 Y123.05 E.0738
G1 X129.874 Y120.45 E.12194
G1 X130.126 Y120.45 E.00838
G1 X136.55 Y126.874 E.30133
G1 X136.55 Y129.126 E.07472
G1 X136.126 Y129.55 E.01986
G1 X131.55 Y129.55 E.15182
G1 X131.45 Y129.45 E.00466
G1 X131.45 Y126.55 E.09622
G1 X136.55 Y121.45 E.23922
G1 X136.55 Y120.45 E.03317
G1 X136.064 Y120.45 E.01611
G1 X136.064 Y120.593 E.00474
G1 X135.5 Y120.306 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1491
G1 X135.5 Y119.306 E.03168
; CHANGE_LAYER
; Z_HEIGHT: 17.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X135.5 Y120.306 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 144/151
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
G3 Z17.8 I-.313 J-1.176 P1  F30000
G1 X123.898 Y123.398 Z17.8
G1 Z17.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1491
G1 X123.898 Y129.898 E.21562
G1 X121.102 Y129.898 E.09274
G1 X121.102 Y120.102 E.32495
G1 X122.102 Y120.102 E.03317
G1 X122.102 Y119.102 E.03317
G1 X122.898 Y119.102 E.0264
G1 X122.898 Y120.102 E.03317
G1 X135.102 Y120.102 E.40483
G1 X135.102 Y119.102 E.03317
G1 X135.898 Y119.102 E.0264
G1 X135.898 Y120.102 E.03317
G1 X136.898 Y120.102 E.03317
G1 X136.898 Y129.898 E.32495
G1 X131.102 Y129.898 E.19226
G1 X131.102 Y123.398 E.21562
G1 X123.958 Y123.398 E.23698
G1 X124.29 Y123.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1491
G1 X124.29 Y130.29 E.19973
G1 X120.71 Y130.29 E.11
G1 X120.71 Y119.71 E.32509
G1 X121.71 Y119.71 E.03073
G1 X121.71 Y118.71 E.03073
G1 X123.29 Y118.71 E.04855
G1 X123.29 Y119.71 E.03073
G1 X134.71 Y119.71 E.3509
G1 X134.71 Y118.71 E.03073
G1 X136.29 Y118.71 E.04855
G1 X136.29 Y119.71 E.03073
G1 X137.29 Y119.71 E.03073
G1 X137.29 Y130.29 E.32509
G1 X130.71 Y130.29 E.20219
G1 X130.71 Y123.79 E.19973
G1 X124.35 Y123.79 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X124.332 Y125.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18 I.774 J-.939 P1  F30000
G1 X123.55 Y125.146 Z18
G1 Z17.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1491
G1 X123.55 Y126.774 E.05401
G1 X121.45 Y128.874 E.09848
G1 X121.45 Y127.126 E.05796
G1 X123.55 Y129.226 E.09848
G1 X123.55 Y129.55 E.01075
G1 X122.245 Y129.55 E.04327
G1 X122.5 Y119.306 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1491
G1 X122.5 Y120.306 E.03168
G1 X121.45 Y122.826 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1491
G1 X121.45 Y121.198 E.05401
G1 X121.994 Y120.654 E.02551
G1 X122.654 Y120.654 E.02188
G1 X125.05 Y123.05 E.11239
G1 X127.274 Y123.05 E.0738
G1 X129.874 Y120.45 E.12194
G1 X130.126 Y120.45 E.00838
G1 X136.55 Y126.874 E.30133
G1 X136.55 Y129.126 E.07472
G1 X136.126 Y129.55 E.01986
G1 X131.55 Y129.55 E.15182
G1 X131.45 Y129.45 E.00466
G1 X131.45 Y126.55 E.09622
M73 P93 R1
G1 X136.55 Y121.45 E.23922
G1 X136.55 Y120.45 E.03317
G1 X136.064 Y120.45 E.01611
G1 X136.064 Y120.593 E.00474
G1 X135.5 Y120.306 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1491
G1 X135.5 Y119.306 E.03168
; CHANGE_LAYER
; Z_HEIGHT: 17.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X135.5 Y120.306 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 145/151
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
G3 Z18 I-.313 J-1.176 P1  F30000
G1 X123.898 Y123.398 Z18
G1 Z17.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1860
G1 X123.898 Y129.898 E.21562
G1 X121.102 Y129.898 E.09274
G1 X121.102 Y120.102 E.32495
G1 X122.102 Y120.102 E.03317
G1 X122.102 Y119.102 E.03317
G1 X122.898 Y119.102 E.0264
G1 X122.898 Y120.102 E.03317
G1 X135.102 Y120.102 E.40483
G1 X135.102 Y119.102 E.03317
G1 X135.898 Y119.102 E.0264
G1 X135.898 Y120.102 E.03317
G1 X136.898 Y120.102 E.03317
G1 X136.898 Y129.898 E.32495
G1 X131.102 Y129.898 E.19226
G1 X131.102 Y123.398 E.21562
G1 X123.958 Y123.398 E.23698
G1 X124.29 Y123.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1860
G1 X124.29 Y130.29 E.19973
G1 X120.71 Y130.29 E.11
G1 X120.71 Y119.71 E.32509
G1 X121.71 Y119.71 E.03073
G1 X121.71 Y118.71 E.03073
G1 X123.29 Y118.71 E.04855
G1 X123.29 Y119.71 E.03073
G1 X134.71 Y119.71 E.3509
G1 X134.71 Y118.71 E.03073
G1 X136.29 Y118.71 E.04855
G1 X136.29 Y119.71 E.03073
G1 X137.29 Y119.71 E.03073
G1 X137.29 Y130.29 E.32509
G1 X130.71 Y130.29 E.20219
G1 X130.71 Y123.79 E.19973
G1 X124.35 Y123.79 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X124.332 Y125.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18.2 I.238 J-1.194 P1  F30000
G1 X123.143 Y125.553 Z18.2
G1 Z17.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1860
G1 X123.143 Y127.181 E.05401
G1 X121.857 Y128.467 E.06029
G1 X121.857 Y127.533 E.03096
G1 X123.143 Y128.819 E.06029
G1 X123.143 Y129.143 E.01075
G1 X121.857 Y129.123 E.04264
G1 X122.5 Y119.306 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1860
G1 X122.5 Y120.306 E.03168
G1 X121.857 Y121.486 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1860
G1 X121.857 Y121.061 E.01409
G1 X123.061 Y121.061 E.03992
G1 X124.643 Y122.643 E.0742
G1 X127.681 Y122.643 E.10081
G1 X129.467 Y120.857 E.08375
G1 X130.533 Y120.857 E.03539
G1 X136.143 Y126.467 E.26314
G1 X136.143 Y121.857 E.1529
G1 X131.857 Y126.143 E.20103
G1 X131.857 Y127.771 E.05401
G1 X134.936 Y120.654 F30000
G1 F1860
G1 X136.55 Y120.654 E.05353
G1 X136.55 Y129.55 E.29509
G1 X131.45 Y129.55 E.16915
G1 X131.45 Y123.05 E.21562
G1 X123.55 Y123.05 E.26208
G1 X123.55 Y129.55 E.21562
G1 X121.45 Y129.55 E.06964
G1 X121.45 Y120.654 E.29509
G1 X123.064 Y120.654 E.05353
G1 X123.064 Y120.45 E.00675
G1 X134.936 Y120.45 E.39381
G1 X134.936 Y120.594 E.00476
G1 X135.5 Y120.306 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1860
G1 X135.5 Y119.306 E.03168
; CHANGE_LAYER
; Z_HEIGHT: 18
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X135.5 Y120.306 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 146/151
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
G3 Z18.2 I-.313 J-1.176 P1  F30000
G1 X123.898 Y123.398 Z18.2
G1 Z18
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1860
G1 X123.898 Y129.898 E.21562
G1 X121.102 Y129.898 E.09274
G1 X121.102 Y120.102 E.32495
G1 X122.102 Y120.102 E.03317
G1 X122.102 Y119.102 E.03317
G1 X122.898 Y119.102 E.0264
G1 X122.898 Y120.102 E.03317
G1 X135.102 Y120.102 E.40483
G1 X135.102 Y119.102 E.03317
G1 X135.898 Y119.102 E.0264
G1 X135.898 Y120.102 E.03317
G1 X136.898 Y120.102 E.03317
G1 X136.898 Y129.898 E.32495
G1 X131.102 Y129.898 E.19226
G1 X131.102 Y123.398 E.21562
G1 X123.958 Y123.398 E.23698
G1 X124.29 Y123.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1860
G1 X124.29 Y130.29 E.19973
G1 X120.71 Y130.29 E.11
G1 X120.71 Y119.71 E.32509
G1 X121.71 Y119.71 E.03073
G1 X121.71 Y118.71 E.03073
G1 X123.29 Y118.71 E.04855
G1 X123.29 Y119.71 E.03073
G1 X134.71 Y119.71 E.3509
M73 P94 R1
G1 X134.71 Y118.71 E.03073
G1 X136.29 Y118.71 E.04855
G1 X136.29 Y119.71 E.03073
G1 X137.29 Y119.71 E.03073
G1 X137.29 Y130.29 E.32509
G1 X130.71 Y130.29 E.20219
G1 X130.71 Y123.79 E.19973
G1 X124.35 Y123.79 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X124.332 Y125.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18.4 I.238 J-1.194 P1  F30000
G1 X123.143 Y125.553 Z18.4
G1 Z18
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1860
G1 X123.143 Y127.181 E.05401
G1 X121.857 Y128.467 E.06029
G1 X121.857 Y127.533 E.03096
G1 X123.143 Y128.819 E.06029
G1 X123.143 Y129.143 E.01075
G1 X121.857 Y129.123 E.04264
G1 X122.5 Y119.306 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1860
G1 X122.5 Y120.306 E.03168
G1 X121.857 Y121.486 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1860
G1 X121.857 Y121.061 E.01409
G1 X123.061 Y121.061 E.03992
G1 X124.643 Y122.643 E.0742
G1 X127.681 Y122.643 E.10081
G1 X129.467 Y120.857 E.08375
G1 X130.533 Y120.857 E.03539
G1 X136.143 Y126.467 E.26314
G1 X136.143 Y121.857 E.1529
G1 X131.857 Y126.143 E.20103
G1 X131.857 Y127.771 E.05401
G1 X134.936 Y120.654 F30000
G1 F1860
G1 X136.55 Y120.654 E.05353
G1 X136.55 Y129.55 E.29509
G1 X131.45 Y129.55 E.16915
G1 X131.45 Y123.05 E.21562
G1 X123.55 Y123.05 E.26208
G1 X123.55 Y129.55 E.21562
G1 X121.45 Y129.55 E.06964
G1 X121.45 Y120.654 E.29509
G1 X123.064 Y120.654 E.05353
G1 X123.064 Y120.45 E.00675
G1 X134.936 Y120.45 E.39381
G1 X134.936 Y120.594 E.00476
G1 X135.5 Y120.306 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1860
G1 X135.5 Y119.306 E.03168
; CHANGE_LAYER
; Z_HEIGHT: 18.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X135.5 Y120.306 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 147/151
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
G3 Z18.4 I-.313 J-1.176 P1  F30000
G1 X123.898 Y123.398 Z18.4
G1 Z18.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1860
G1 X123.898 Y129.898 E.21562
G1 X121.102 Y129.898 E.09274
G1 X121.102 Y120.102 E.32495
G1 X122.102 Y120.102 E.03317
G1 X122.102 Y119.102 E.03317
G1 X122.898 Y119.102 E.0264
G1 X122.898 Y120.102 E.03317
G1 X135.102 Y120.102 E.40483
G1 X135.102 Y119.102 E.03317
G1 X135.898 Y119.102 E.0264
G1 X135.898 Y120.102 E.03317
G1 X136.898 Y120.102 E.03317
G1 X136.898 Y129.898 E.32495
G1 X131.102 Y129.898 E.19226
G1 X131.102 Y123.398 E.21562
G1 X123.958 Y123.398 E.23698
G1 X124.29 Y123.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1860
G1 X124.29 Y130.29 E.19973
G1 X120.71 Y130.29 E.11
G1 X120.71 Y119.71 E.32509
G1 X121.71 Y119.71 E.03073
G1 X121.71 Y118.71 E.03073
G1 X123.29 Y118.71 E.04855
G1 X123.29 Y119.71 E.03073
G1 X134.71 Y119.71 E.3509
G1 X134.71 Y118.71 E.03073
G1 X136.29 Y118.71 E.04855
G1 X136.29 Y119.71 E.03073
G1 X137.29 Y119.71 E.03073
G1 X137.29 Y130.29 E.32509
G1 X130.71 Y130.29 E.20219
G1 X130.71 Y123.79 E.19973
G1 X124.35 Y123.79 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X124.332 Y125.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18.6 I.238 J-1.194 P1  F30000
G1 X123.143 Y125.553 Z18.6
G1 Z18.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1860
G1 X123.143 Y127.181 E.05401
G1 X121.857 Y128.467 E.06029
G1 X121.857 Y127.533 E.03096
G1 X123.143 Y128.819 E.06029
G1 X123.143 Y129.143 E.01075
G1 X121.857 Y129.123 E.04264
G1 X122.5 Y119.306 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1860
G1 X122.5 Y120.306 E.03168
G1 X121.857 Y121.486 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1860
G1 X121.857 Y121.061 E.01409
G1 X123.061 Y121.061 E.03992
G1 X124.643 Y122.643 E.0742
G1 X127.681 Y122.643 E.10081
G1 X129.467 Y120.857 E.08375
G1 X130.533 Y120.857 E.03539
G1 X136.143 Y126.467 E.26314
G1 X136.143 Y121.857 E.1529
M73 P95 R1
G1 X131.857 Y126.143 E.20103
G1 X131.857 Y127.771 E.05401
G1 X134.936 Y120.654 F30000
G1 F1860
G1 X136.55 Y120.654 E.05353
G1 X136.55 Y129.55 E.29509
G1 X131.45 Y129.55 E.16915
G1 X131.45 Y123.05 E.21562
G1 X123.55 Y123.05 E.26208
G1 X123.55 Y129.55 E.21562
G1 X121.45 Y129.55 E.06964
G1 X121.45 Y120.654 E.29509
M73 P95 R0
G1 X123.064 Y120.654 E.05353
G1 X123.064 Y120.45 E.00675
G1 X134.936 Y120.45 E.39381
G1 X134.936 Y120.594 E.00476
G1 X135.5 Y120.306 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1860
G1 X135.5 Y119.306 E.03168
; CHANGE_LAYER
; Z_HEIGHT: 18.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X135.5 Y120.306 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 148/151
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
G3 Z18.6 I-.313 J-1.176 P1  F30000
G1 X123.898 Y123.398 Z18.6
G1 Z18.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1860
G1 X123.898 Y129.898 E.21562
G1 X121.102 Y129.898 E.09274
G1 X121.102 Y120.102 E.32495
G1 X122.102 Y120.102 E.03317
G1 X122.102 Y119.102 E.03317
G1 X122.898 Y119.102 E.0264
G1 X122.898 Y120.102 E.03317
G1 X135.102 Y120.102 E.40483
G1 X135.102 Y119.102 E.03317
G1 X135.898 Y119.102 E.0264
G1 X135.898 Y120.102 E.03317
G1 X136.898 Y120.102 E.03317
G1 X136.898 Y129.898 E.32495
G1 X131.102 Y129.898 E.19226
G1 X131.102 Y123.398 E.21562
G1 X123.958 Y123.398 E.23698
G1 X124.29 Y123.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1860
G1 X124.29 Y130.29 E.19973
G1 X120.71 Y130.29 E.11
G1 X120.71 Y119.71 E.32509
G1 X121.71 Y119.71 E.03073
G1 X121.71 Y118.71 E.03073
G1 X123.29 Y118.71 E.04855
G1 X123.29 Y119.71 E.03073
G1 X134.71 Y119.71 E.3509
G1 X134.71 Y118.71 E.03073
G1 X136.29 Y118.71 E.04855
G1 X136.29 Y119.71 E.03073
G1 X137.29 Y119.71 E.03073
G1 X137.29 Y130.29 E.32509
G1 X130.71 Y130.29 E.20219
G1 X130.71 Y123.79 E.19973
G1 X124.35 Y123.79 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X124.332 Y125.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18.8 I.238 J-1.194 P1  F30000
G1 X123.143 Y125.553 Z18.8
G1 Z18.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1860
G1 X123.143 Y127.181 E.05401
G1 X121.857 Y128.467 E.06029
G1 X121.857 Y127.533 E.03096
G1 X123.143 Y128.819 E.06029
G1 X123.143 Y129.143 E.01075
G1 X121.857 Y129.123 E.04264
G1 X122.5 Y119.306 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1860
G1 X122.5 Y120.306 E.03168
G1 X121.857 Y121.486 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1860
G1 X121.857 Y121.061 E.01409
G1 X123.061 Y121.061 E.03992
G1 X124.643 Y122.643 E.0742
G1 X127.681 Y122.643 E.10081
G1 X129.467 Y120.857 E.08375
G1 X130.533 Y120.857 E.03539
G1 X136.143 Y126.467 E.26314
G1 X136.143 Y121.857 E.1529
G1 X131.857 Y126.143 E.20103
G1 X131.857 Y127.771 E.05401
G1 X134.936 Y120.654 F30000
G1 F1860
G1 X136.55 Y120.654 E.05353
G1 X136.55 Y129.55 E.29509
G1 X131.45 Y129.55 E.16915
G1 X131.45 Y123.05 E.21562
G1 X123.55 Y123.05 E.26208
G1 X123.55 Y129.55 E.21562
G1 X121.45 Y129.55 E.06964
G1 X121.45 Y120.654 E.29509
G1 X123.064 Y120.654 E.05353
G1 X123.064 Y120.45 E.00675
G1 X134.936 Y120.45 E.39381
G1 X134.936 Y120.594 E.00476
G1 X135.5 Y120.306 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1860
G1 X135.5 Y119.306 E.03168
; CHANGE_LAYER
; Z_HEIGHT: 18.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X135.5 Y120.306 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 149/151
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
G3 Z18.8 I-.313 J-1.176 P1  F30000
G1 X123.898 Y123.398 Z18.8
G1 Z18.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2414
G1 X123.898 Y129.898 E.21562
G1 X121.102 Y129.898 E.09274
G1 X121.102 Y120.102 E.32495
G1 X122.102 Y120.102 E.03317
G1 X122.102 Y119.102 E.03317
G1 X122.898 Y119.102 E.0264
G1 X122.898 Y120.102 E.03317
G1 X135.102 Y120.102 E.40483
G1 X135.102 Y119.102 E.03317
M73 P96 R0
G1 X135.898 Y119.102 E.0264
G1 X135.898 Y120.102 E.03317
G1 X136.898 Y120.102 E.03317
G1 X136.898 Y129.898 E.32495
G1 X131.102 Y129.898 E.19226
G1 X131.102 Y123.398 E.21562
G1 X123.958 Y123.398 E.23698
G1 X124.29 Y123.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2414
G1 X124.29 Y130.29 E.19973
G1 X120.71 Y130.29 E.11
G1 X120.71 Y119.71 E.32509
G1 X121.71 Y119.71 E.03073
G1 X121.71 Y118.71 E.03073
G1 X123.29 Y118.71 E.04855
G1 X123.29 Y119.71 E.03073
G1 X134.71 Y119.71 E.3509
G1 X134.71 Y118.71 E.03073
G1 X136.29 Y118.71 E.04855
G1 X136.29 Y119.71 E.03073
G1 X137.29 Y119.71 E.03073
G1 X137.29 Y130.29 E.32509
G1 X130.71 Y130.29 E.20219
G1 X130.71 Y123.79 E.19973
G1 X124.35 Y123.79 E.19543
M204 S10000
G1 X123.731 Y123.516 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.411652
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X121.472 Y125.775 E.17323
G1 X121.472 Y126.428 E.0354
G1 X123.528 Y124.371 E.1577
G1 X123.528 Y125.024 E.0354
G1 X121.472 Y127.08 E.1577
G1 X121.472 Y127.733 E.0354
G1 X123.528 Y125.677 E.1577
G1 X123.528 Y126.33 E.0354
G1 X121.472 Y128.386 E.1577
G1 X121.472 Y129.039 E.0354
G1 X123.528 Y126.983 E.1577
G1 X123.528 Y127.636 E.0354
G1 X121.636 Y129.528 E.14514
G1 X122.288 Y129.528 E.0354
G1 X123.528 Y128.288 E.09507
G1 X123.528 Y128.941 E.0354
G1 X122.739 Y129.731 E.06053
M106 S252.45
G1 X121.269 Y121.407 F30000
M106 S255
G1 F3000
G1 X122.001 Y120.675 E.05612
G1 X122.654 Y120.675 E.0354
G1 X121.472 Y121.857 E.09066
G1 X121.472 Y122.51 E.0354
G1 X123.51 Y120.472 E.15633
G1 X124.163 Y120.472 E.0354
G1 X121.472 Y123.163 E.2064
G1 X121.472 Y123.816 E.0354
G1 X124.816 Y120.472 E.25647
G1 X125.469 Y120.472 E.0354
G1 X121.472 Y124.469 E.30653
G1 X121.472 Y125.122 E.0354
G1 X126.122 Y120.472 E.3566
G1 X126.775 Y120.472 E.0354
G1 X124.218 Y123.028 E.19604
G1 X124.871 Y123.028 E.0354
G1 X127.428 Y120.472 E.19604
G1 X128.08 Y120.472 E.0354
G1 X125.524 Y123.028 E.19604
G1 X126.177 Y123.028 E.0354
G1 X128.733 Y120.472 E.19604
G1 X129.386 Y120.472 E.0354
G1 X126.83 Y123.028 E.19604
G1 X127.483 Y123.028 E.0354
G1 X130.039 Y120.472 E.19604
G1 X130.692 Y120.472 E.0354
G1 X128.136 Y123.028 E.19604
G1 X128.788 Y123.028 E.0354
G1 X131.345 Y120.472 E.19604
G1 X131.998 Y120.472 E.0354
G1 X129.441 Y123.028 E.19604
G1 X130.094 Y123.028 E.0354
G1 X132.651 Y120.472 E.19604
G1 X133.303 Y120.472 E.0354
G1 X130.747 Y123.028 E.19604
G1 X131.4 Y123.028 E.0354
G1 X133.956 Y120.472 E.19604
G1 X134.609 Y120.472 E.0354
G1 X131.472 Y123.609 E.2406
G1 X131.472 Y124.262 E.0354
G1 X135.059 Y120.675 E.27506
G1 X135.711 Y120.675 E.0354
G1 X131.472 Y124.915 E.32513
G1 X131.472 Y125.568 E.0354
G1 X136.364 Y120.675 E.37519
G1 X136.528 Y120.675 E.00889
G1 X136.528 Y121.164 E.02652
G1 X131.472 Y126.221 E.38776
G1 X131.472 Y126.874 E.0354
G1 X136.528 Y121.817 E.38776
G1 X136.528 Y122.47 E.0354
G1 X131.472 Y127.526 E.38776
G1 X131.472 Y128.179 E.0354
G1 X136.528 Y123.123 E.38776
G1 X136.528 Y123.776 E.0354
G1 X131.472 Y128.832 E.38776
G1 X131.472 Y129.485 E.0354
G1 X136.528 Y124.429 E.38776
G1 X136.528 Y125.082 E.0354
G1 X132.082 Y129.528 E.341
G1 X132.734 Y129.528 E.0354
G1 X136.528 Y125.734 E.29093
G1 X136.528 Y126.387 E.0354
G1 X133.387 Y129.528 E.24087
G1 X134.04 Y129.528 E.0354
G1 X136.528 Y127.04 E.1908
G1 X136.528 Y127.693 E.0354
G1 X134.693 Y129.528 E.14073
G1 X135.346 Y129.528 E.0354
G1 X136.528 Y128.346 E.09066
G1 X136.528 Y128.999 E.0354
G1 X135.796 Y129.731 E.05613
M106 S252.45
G1 X135.992 Y120.378 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
; LAYER_HEIGHT: 0.2
G1 F2414
G1 X136.562 Y120.378 E.0158
G1 X135.5 Y120.306 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F2414
G1 X135.5 Y119.306 E.03168
; WIPE_START
G1 F24000
G1 X135.5 Y120.306 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z19 I.093 J-1.213 P1  F30000
G1 X122.5 Y119.306 Z19
G1 Z18.6
G1 E.8 F1800
G1 F2414
G1 X122.5 Y120.306 E.03168
G1 X121.378 Y120.378 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
G1 F2414
G1 X121.948 Y120.378 E.0158
; CHANGE_LAYER
; Z_HEIGHT: 18.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X121.378 Y120.378 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 150/151
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
G3 Z19 I-.934 J.78 P1  F30000
G1 X123.898 Y123.398 Z19
G1 Z18.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3085
G1 X123.898 Y129.898 E.21562
G1 X121.102 Y129.898 E.09274
G1 X121.102 Y120.102 E.32495
G1 X122.102 Y120.102 E.03317
G1 X122.102 Y119.102 E.03317
G1 X122.898 Y119.102 E.0264
G1 X122.898 Y120.102 E.03317
G1 X135.102 Y120.102 E.40483
G1 X135.102 Y119.102 E.03317
G1 X135.898 Y119.102 E.0264
G1 X135.898 Y120.102 E.03317
G1 X136.898 Y120.102 E.03317
G1 X136.898 Y129.898 E.32495
G1 X131.102 Y129.898 E.19226
G1 X131.102 Y123.398 E.21562
G1 X123.958 Y123.398 E.23698
G1 X124.29 Y123.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3085
G1 X124.29 Y130.29 E.19973
G1 X120.71 Y130.29 E.11
G1 X120.71 Y119.71 E.32509
G1 X121.71 Y119.71 E.03073
G1 X121.71 Y118.71 E.03073
G1 X123.29 Y118.71 E.04855
G1 X123.29 Y119.71 E.03073
G1 X134.71 Y119.71 E.3509
G1 X134.71 Y118.71 E.03073
G1 X136.29 Y118.71 E.04855
G1 X136.29 Y119.71 E.03073
G1 X137.29 Y119.71 E.03073
G1 X137.29 Y130.29 E.32509
G1 X130.71 Y130.29 E.20219
G1 X130.71 Y123.79 E.19973
G1 X124.35 Y123.79 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X124.332 Y125.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z19.2 I1.168 J-.342 P1  F30000
G1 X123.189 Y121.886 Z19.2
G1 Z18.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.585956
G1 F3085
G1 X123.409 Y121.822 E.01012
G1 X122.617 Y122.724 F30000
; LINE_WIDTH: 0.403952
G1 F3085
G1 X122.906 Y122.146 E.01903
G1 X122.977 Y122.081 E.00283
; LINE_WIDTH: 0.449453
G1 X123.048 Y122.016 E.00318
; LINE_WIDTH: 0.494954
M73 P97 R0
G1 X123.119 Y121.951 E.00354
; LINE_WIDTH: 0.540455
G1 X123.189 Y121.886 E.0039
; LINE_WIDTH: 0.585956
G1 X123.046 Y121.869 E.00637
; LINE_WIDTH: 0.540455
G1 X122.903 Y121.853 E.00584
; LINE_WIDTH: 0.494954
G1 X122.76 Y121.837 E.0053
; LINE_WIDTH: 0.410585
G1 X122.617 Y121.821 E.00431
G1 X122.617 Y122.664 E.02527
; WIPE_START
G1 F24000
G1 X122.617 Y121.821 E-.64922
G1 X122.76 Y121.837 E-.11078
; WIPE_END
G1 E-.04 F1800
G17
G3 Z19.2 I-.803 J.914 P1  F30000
G1 X131.494 Y129.506 Z19.2
G1 Z18.8
G1 E.8 F1800
; LINE_WIDTH: 0.419999
G1 F3085
G1 X136.506 Y129.506 E.15399
G1 X136.506 Y120.494 E.2769
G1 X136.108 Y120.509 E.01224
G1 X136.081 Y120.606 E.00308
G1 X135.919 Y120.698 E.00572
G1 X135.081 Y120.698 E.02577
G1 X135.008 Y120.683 E.00228
G1 X134.877 Y120.494 E.00706
G1 X123.108 Y120.494 E.36163
G1 X122.987 Y120.685 E.00694
G1 X122.081 Y120.698 E.02786
G1 X121.919 Y120.606 E.00572
G1 X121.877 Y120.494 E.00366
G1 X121.494 Y120.494 E.01177
G1 X121.494 Y129.506 E.2769
G1 X123.506 Y129.506 E.06181
G1 X123.506 Y123.194 E.19393
G1 X123.627 Y123.018 E.00655
G1 X123.859 Y123.006 E.00716
G1 X131.306 Y123.006 E.22881
G1 X131.412 Y123.039 E.00344
G1 X131.494 Y123.194 E.00539
G1 X131.494 Y129.446 E.19209
G1 X131.871 Y129.129 F30000
G1 F3085
G1 X136.129 Y129.129 E.13082
G1 X136.129 Y120.956 E.25113
G1 X135.919 Y121.075 E.0074
G1 X135.081 Y121.075 E.02577
G1 X134.862 Y121.031 E.00684
G1 X134.756 Y120.871 E.0059
G1 X123.279 Y120.871 E.35265
G1 X123.209 Y120.995 E.00438
G1 X123.028 Y121.064 E.00594
G1 X122.081 Y121.075 E.02912
G1 X121.871 Y120.956 E.0074
G1 X121.871 Y129.129 E.25113
G1 X123.129 Y129.129 E.03864
G1 X123.129 Y123.194 E.18235
G1 X123.355 Y122.742 E.01553
G1 X123.603 Y122.636 E.0083
G1 X123.859 Y122.629 E.00787
G1 X131.306 Y122.629 E.22881
G1 X131.626 Y122.728 E.01031
G1 X131.813 Y122.944 E.00876
G1 X131.871 Y123.194 E.00791
G1 X131.871 Y129.069 E.1805
G1 X132.248 Y128.752 F30000
G1 F3085
G1 X135.752 Y128.752 E.10765
G1 X135.752 Y121.452 E.2243
G1 X135.081 Y121.452 E.02062
G1 X134.717 Y121.379 E.0114
G1 X134.63 Y121.248 E.00482
G1 X123.442 Y121.248 E.34377
G1 X123.402 Y121.319 E.0025
G1 X123.101 Y121.434 E.0099
G1 X122.248 Y121.452 E.0262
G1 X122.248 Y122.001 E.01689
G1 X122.264 Y122.598 E.01833
; LINE_WIDTH: 0.481586
G1 X122.28 Y123.194 E.02133
G1 X122.28 Y128.72 E.19752
G1 X122.72 Y128.72 E.01574
G1 X122.72 Y123.194 E.19752
; LINE_WIDTH: 0.483144
G1 X122.924 Y122.818 E.01537
; LINE_WIDTH: 0.420866
G1 X123.128 Y122.441 E.0132
G1 X123.421 Y122.292 E.01012
G1 X123.859 Y122.252 E.01355
G1 X131.306 Y122.252 E.22934
G1 X131.84 Y122.417 E.01722
G1 X132.151 Y122.776 E.01463
G1 X132.248 Y123.194 E.01322
G1 X132.248 Y128.692 E.1693
G1 X132.625 Y128.375 F30000
; LINE_WIDTH: 0.419999
G1 F3085
G1 X135.375 Y128.375 E.08448
G1 X135.375 Y121.829 E.20113
G1 X135.081 Y121.829 E.00903
G1 X134.571 Y121.727 E.01596
G1 X134.504 Y121.625 E.00374
G1 X132.203 Y121.625 E.07071
G1 X131.754 Y121.609 E.01379
; LINE_WIDTH: 0.357882
G1 X131.306 Y121.593 E.01152
G1 X123.859 Y121.593 E.19112
; LINE_WIDTH: 0.356065
G1 X123.799 Y121.616 E.00164
; LINE_WIDTH: 0.395357
G1 X123.739 Y121.638 E.00184
; LINE_WIDTH: 0.434648
G1 X123.679 Y121.661 E.00205
; LINE_WIDTH: 0.47394
G1 X123.619 Y121.683 E.00225
; LINE_WIDTH: 0.513231
G1 X123.543 Y121.744 E.00374
; LINE_WIDTH: 0.554144
G1 X123.467 Y121.806 E.00406
; LINE_WIDTH: 0.595056
G1 X123.543 Y121.818 E.00346
; LINE_WIDTH: 0.558366
G1 X123.619 Y121.83 E.00323
; LINE_WIDTH: 0.521675
G1 X123.694 Y121.842 E.003
; LINE_WIDTH: 0.484984
G1 X123.749 Y121.864 E.00212
; LINE_WIDTH: 0.442011
G1 X123.804 Y121.885 E.00192
; LINE_WIDTH: 0.356403
G1 X123.859 Y121.907 E.00151
G1 X131.306 Y121.907 E.19022
; LINE_WIDTH: 0.356065
G1 X131.679 Y122.007 E.00987
; LINE_WIDTH: 0.418174
G1 X132.053 Y122.107 E.01183
G1 X132.489 Y122.609 E.02033
G1 X132.622 Y123.101 E.01558
G1 X132.625 Y128.315 E.15943
G1 X133.002 Y127.998 F30000
; LINE_WIDTH: 0.419999
G1 F3085
G1 X134.998 Y127.998 E.0613
G1 X134.998 Y122.189 E.17847
G1 X134.426 Y122.075 E.01792
G1 X134.378 Y122.002 E.00266
G1 X132.446 Y122.002 E.05937
G1 X132.827 Y122.442 E.01787
G1 X132.998 Y123.074 E.02013
G1 X133.002 Y127.938 E.14943
G1 X133.38 Y127.62 F30000
G1 F3085
G1 X134.62 Y127.62 E.03813
G1 X134.62 Y122.491 E.15762
G1 X134.28 Y122.422 E.01066
G1 X134.252 Y122.38 E.00158
G1 X133.193 Y122.38 E.03253
G1 X133.374 Y123.048 E.02127
G1 X133.38 Y127.56 E.13867
G1 X133.784 Y127.216 F30000
; LINE_WIDTH: 0.475147
G1 F3085
G1 X134.216 Y127.216 E.01521
G2 X134.214 Y122.815 I-492.57 J-2.011 E.15499
G1 X133.716 Y122.786 E.01757
G1 X133.784 Y123.194 E.01459
G1 X133.784 Y127.156 E.13953
G1 X135.5 Y120.306 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F3085
G1 X135.5 Y119.306 E.03168
; WIPE_START
G1 F24000
G1 X135.5 Y120.306 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z19.2 I.093 J-1.213 P1  F30000
G1 X122.5 Y119.306 Z19.2
G1 Z18.8
G1 E.8 F1800
G1 F3085
G1 X122.5 Y120.306 E.03168
; CHANGE_LAYER
; Z_HEIGHT: 19
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X122.5 Y119.306 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 151/151
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
G3 Z19.2 I-1.13 J.451 P1  F30000
G1 X124.29 Y123.79 Z19.2
G1 Z19
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3442
G1 X124.29 Y130.29 E.19973
G1 X120.71 Y130.29 E.11
G1 X120.71 Y119.71 E.32509
G1 X121.71 Y119.71 E.03073
G1 X121.71 Y118.71 E.03073
G1 X123.29 Y118.71 E.04855
G1 X123.29 Y119.71 E.03073
G1 X134.71 Y119.71 E.3509
G1 X134.71 Y118.71 E.03073
G1 X136.29 Y118.71 E.04855
G1 X136.29 Y119.71 E.03073
G1 X137.29 Y119.71 E.03073
G1 X137.29 Y130.29 E.32509
G1 X130.71 Y130.29 E.20219
G1 X130.71 Y123.79 E.19973
G1 X124.35 Y123.79 E.19543
M204 S10000
; WIPE_START
G1 F24000
G1 X124.332 Y125.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z19.4 I.634 J1.039 P1  F30000
G1 X135.582 Y118.917 Z19.4
G1 Z19
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
G1 F3442
G1 X136.083 Y119.418 E.02174
G1 X136.582 Y119.917
G1 X137.083 Y120.418 E.02174
G1 X137.083 Y120.951
G1 X135.049 Y118.917 E.08837
G1 X134.917 Y119.319
G1 X137.083 Y121.484 E.09409
G1 X137.083 Y122.018
G1 X134.917 Y119.852 E.09409
G1 X134.449 Y119.917
G1 X137.083 Y122.551 E.11444
G1 X137.083 Y123.084
G1 X133.916 Y119.917 E.13761
G1 X133.383 Y119.917
G1 X137.083 Y123.617 E.16078
G1 X137.083 Y124.151
G1 X132.849 Y119.917 E.18396
G1 X132.316 Y119.917
G1 X137.083 Y124.684 E.20713
G1 X137.083 Y125.217
G1 X131.783 Y119.917 E.2303
G1 X131.25 Y119.917
G1 X137.083 Y125.75 E.25347
G1 X137.083 Y126.284
G1 X130.716 Y119.917 E.27665
G1 X130.183 Y119.917
G1 X137.083 Y126.817 E.29982
G1 X137.083 Y127.35
G1 X129.65 Y119.917 E.32299
G1 X129.116 Y119.917
G1 X137.083 Y127.884 E.34617
G1 X137.083 Y128.417
G1 X128.583 Y119.917 E.36934
G1 X128.05 Y119.917
G1 X137.083 Y128.95 E.39251
G1 X137.083 Y129.483
G1 X127.517 Y119.917 E.41569
G1 X126.983 Y119.917
G1 X130.649 Y123.583 E.15927
G1 X130.115 Y123.583
G1 X126.45 Y119.917 E.15927
G1 X125.917 Y119.917
G1 X129.582 Y123.583 E.15927
G1 X129.049 Y123.583
G1 X125.384 Y119.917 E.15927
G1 X124.85 Y119.917
G1 X128.516 Y123.583 E.15927
G1 X127.982 Y123.583
G1 X124.317 Y119.917 E.15927
G1 X123.784 Y119.917
G1 X127.449 Y123.583 E.15927
G1 X126.916 Y123.583
G1 X123.25 Y119.917 E.15927
G1 X123.083 Y119.75
G1 X122.25 Y118.917 E.03616
G1 X121.917 Y119.118
G1 X126.382 Y123.583 E.19403
G1 X125.849 Y123.583
G1 X121.917 Y119.651 E.17085
G1 X121.651 Y119.917
G1 X125.316 Y123.583 E.15927
G1 X124.783 Y123.583
G1 X121.117 Y119.917 E.15927
G1 X120.917 Y120.251
G1 X124.249 Y123.583 E.14479
G1 X124.083 Y123.949
G1 X120.917 Y120.784 E.13754
G1 X120.917 Y121.317
G1 X124.083 Y124.482 E.13754
G1 X124.083 Y125.016
G1 X120.917 Y121.85 E.13754
G1 X120.917 Y122.384
G1 X124.083 Y125.549 E.13754
G1 X124.083 Y126.082
G1 X120.917 Y122.917 E.13754
G1 X120.917 Y123.45
G1 X124.083 Y126.615 E.13754
M73 P98 R0
G1 X124.083 Y127.149
G1 X120.917 Y123.984 E.13754
G1 X120.917 Y124.517
G1 X124.083 Y127.682 E.13754
G1 X124.083 Y128.215
G1 X120.917 Y125.05 E.13754
G1 X120.917 Y125.583
G1 X124.083 Y128.749 E.13754
G1 X124.083 Y129.282
G1 X120.917 Y126.117 E.13754
G1 X120.917 Y126.65
G1 X124.083 Y129.815 E.13754
G1 X123.817 Y130.083
G1 X120.917 Y127.183 E.126
G1 X120.917 Y127.716
G1 X123.284 Y130.083 E.10282
G1 X122.75 Y130.083
G1 X120.917 Y128.25 E.07965
G1 X120.917 Y128.783
G1 X122.217 Y130.083 E.05648
G1 X121.684 Y130.083
G1 X120.917 Y129.316 E.0333
M204 S10000
; WIPE_START
G1 F24000
G1 X121.684 Y130.083 E-.41185
G1 X122.217 Y130.083 E-.20264
G1 X121.946 Y129.812 E-.1455
; WIPE_END
G1 E-.04 F1800
G17
G3 Z19.4 I.673 J1.014 P1  F30000
G1 X130.917 Y123.851 Z19.4
G1 Z19
G1 E.8 F1800
M204 S2000
G1 F3442
G1 X137.083 Y130.017 E.26791
G1 X136.615 Y130.083
G1 X130.917 Y124.385 E.2476
G1 X130.917 Y124.918
G1 X136.082 Y130.083 E.22443
G1 X135.549 Y130.083
G1 X130.917 Y125.451 E.20126
G1 X130.917 Y125.984
G1 X135.016 Y130.083 E.17808
G1 X134.482 Y130.083
G1 X130.917 Y126.518 E.15491
G1 X130.917 Y127.051
G1 X133.949 Y130.083 E.13174
G1 X133.416 Y130.083
G1 X130.917 Y127.584 E.10856
G1 X130.917 Y128.118
G1 X132.882 Y130.083 E.08539
G1 X132.349 Y130.083
G1 X130.917 Y128.651 E.06222
G1 X130.917 Y129.184
G1 X131.816 Y130.083 E.03904
G1 X131.283 Y130.083
G1 X130.917 Y129.717 E.01587
M204 S10000
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F24000
G1 X131.283 Y130.083 E-.19628
G1 X131.816 Y130.083 E-.20264
G1 X131.144 Y129.411 E-.36108
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

