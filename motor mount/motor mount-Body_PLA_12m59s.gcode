; HEADER_BLOCK_START
; BambuStudio 01.06.02.04
; model printing time: 7m 11s; total estimated time: 12m 59s
; total layer number: 15
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
; default_filament_colour = ""
; default_filament_profile = "Bambu PLA Basic @BBL X1"
; default_print_profile = 0.20mm Standard @BBL P1P
; deretraction_speed = 30
; detect_narrow_internal_solid_infill = 1
; detect_overhang_wall = 1
; detect_thin_wall = 0
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
M73 P0 R13
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
M73 P33 R8
G1 Y245
G1 Y265 F3000
M620 M
M620 S0A   ; switch material if AMS exist
    M109 S220
    G1 X120 F12000

    G1 X20 Y50 F12000
    G1 Y-3
    T0
M73 P34 R8
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
M73 P36 R8
G1 X76 F15000
M73 P38 R8
G1 X65 F15000
M73 P38 R7
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
M73 P39 R7
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
    G29 A X107.5 Y107.5 I45 J45
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
M73 P40 R7
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
; layer num/total_layer_count: 1/15
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
G1 X141.608 Y123.763 F30000
G1 Z.4
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
G1 X141.611 Y123.774 E.00041
G3 X129.692 Y115.646 I-11.611 J4.224 E2.3177
M73 P41 R7
G1 X130.308 Y115.646 E.02295
G3 X141.386 Y123.2 I-.308 J12.352 E.52787
G1 X141.586 Y123.708 E.02031
G1 X141.184 Y123.933 F30000
; FEATURE: Outer wall
G1 F3000
G1 X141.37 Y124.493 E.02196
G3 X129.703 Y116.104 I-11.37 J3.505 E2.20985
G1 X130.297 Y116.104 E.0221
G3 X141.162 Y123.878 I-.297 J11.895 E.52835
; WIPE_START
G1 F24000
M73 P42 R7
G1 X141.37 Y124.493 E-.24679
G1 X141.532 Y125.064 E-.22545
G1 X141.664 Y125.642 E-.22548
G1 X141.693 Y125.803 E-.06228
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I1.116 J.486 P1  F30000
G1 X146.794 Y114.077 Z.6
G1 Z.2
M73 P43 R7
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3000
G1 X146.652 Y114.26 E.00862
G3 X144.421 Y110.161 I-1.919 J-1.612 E.36309
G1 X144.671 Y110.142 E.00931
G3 X146.826 Y114.027 I.062 J2.506 E.20334
G1 X146.445 Y113.772 F30000
; FEATURE: Outer wall
G1 F3000
G1 X146.426 Y113.804 E.00138
G3 X144.478 Y110.615 I-1.693 J-1.155 E.30445
G1 X144.682 Y110.6 E.00761
G3 X146.621 Y113.445 I.051 J2.049 E.15228
G1 X146.474 Y113.719 E.01158
; WIPE_START
G1 F24000
G1 X146.426 Y113.804 E-.03686
G1 X146.165 Y114.118 E-.15509
G1 X145.926 Y114.317 E-.11834
G1 X145.577 Y114.519 E-.15326
G1 X145.189 Y114.649 E-.15517
G1 X144.821 Y114.695 E-.14128
; WIPE_END
G1 E-.04 F1800
G17
M73 P44 R7
G3 Z.6 I.01 J-1.217 P1  F30000
G1 X112.994 Y114.432 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3000
G1 X112.839 Y114.26 E.00862
G3 X114.446 Y110.161 I1.919 J-1.612 E.20024
G1 X114.696 Y110.142 E.00931
G3 X113.039 Y114.472 I.062 J2.506 E.3662
G1 X113.226 Y113.998 F30000
; FEATURE: Outer wall
G1 F3000
G1 X113.066 Y113.804 E.00939
G3 X114.503 Y110.615 I1.693 J-1.155 E.15609
G1 X114.707 Y110.6 E.00761
G3 X113.328 Y114.116 I.051 J2.049 E.30064
G1 X113.265 Y114.043 E.00357
; WIPE_START
G1 F24000
G1 X113.066 Y113.804 E-.11863
G1 X112.869 Y113.446 E-.1551
G1 X112.748 Y113.056 E-.15517
M73 P45 R7
G1 X112.718 Y112.854 E-.07768
G1 X112.718 Y112.445 E-.15516
G1 X112.769 Y112.192 E-.09827
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-1.206 J.166 P1  F30000
G1 X116.84 Y141.804 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3000
G1 X116.96 Y142.002 E.00862
G3 X114.446 Y140.713 I-2.202 J1.198 E.47481
G1 X114.696 Y140.694 E.00931
G3 X116.806 Y141.755 I.062 J2.506 E.09162
G1 X116.399 Y141.983 F30000
; FEATURE: Outer wall
G1 F3000
G1 X116.452 Y142.047 E.00308
G3 X114.503 Y141.167 I-1.694 J1.153 E.39579
G1 X114.707 Y141.151 E.00761
G3 X116.19 Y141.734 I.051 J2.049 E.06093
G1 X116.361 Y141.937 E.00989
; WIPE_START
G1 F24000
G1 X116.452 Y142.047 E-.05423
G1 X116.648 Y142.405 E-.15514
G1 X116.768 Y142.795 E-.15517
G1 X116.799 Y142.997 E-.07768
G1 X116.799 Y143.405 E-.15516
G1 X116.718 Y143.806 E-.15517
G1 X116.71 Y143.824 E-.00745
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-.041 J1.216 P1  F30000
G1 X146.642 Y144.827 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3000
G1 X146.483 Y144.995 E.00862
G3 X144.421 Y140.713 I-1.749 J-1.795 E.35378
G1 X144.671 Y140.694 E.00931
G3 X146.679 Y144.78 I.062 J2.506 E.21265
G1 X146.32 Y144.495 F30000
; FEATURE: Outer wall
G1 F3000
G1 X146.302 Y144.518 E.00108
G3 X144.478 Y141.167 I-1.569 J-1.318 E.29684
G1 X144.682 Y141.151 E.00761
G3 X146.532 Y144.181 I.051 J2.049 E.15989
G1 X146.354 Y144.445 E.01188
; WIPE_START
G1 F24000
G1 X146.302 Y144.518 E-.03381
G1 X146.012 Y144.804 E-.15508
G1 X145.669 Y145.026 E-.15517
G1 X145.293 Y145.174 E-.15327
G1 X144.988 Y145.236 E-.11834
G1 X144.608 Y145.245 E-.14434
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-.645 J1.032 P1  F30000
G1 X151.643 Y149.643 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3000
G1 X108.357 Y149.643 E1.61223
G1 X108.357 Y106.357 E1.61223
G1 X151.643 Y106.357 E1.61223
G1 X151.643 Y149.583 E1.61
G1 X152.1 Y150.1 F30000
; FEATURE: Outer wall
G1 F3000
G1 X107.9 Y150.1 E1.64628
G1 X107.9 Y105.9 E1.64628
G1 X152.1 Y105.9 E1.64628
G1 X152.1 Y150.04 E1.64405
; WIPE_START
G1 F24000
G1 X150.1 Y150.043 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I1.216 J.039 P1  F30000
G1 X151.46 Y107.471 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.503245
G1 F6300
G1 X150.735 Y106.746 E.03847
G1 X150.084 Y106.746 E.02442
G1 X151.254 Y107.916 E.06209
G1 X151.254 Y108.567 E.02442
G1 X149.433 Y106.746 E.09663
G1 X148.782 Y106.746 E.02442
G1 X151.254 Y109.218 E.13116
G1 X151.254 Y109.869 E.02442
G1 X148.131 Y106.746 E.16569
G1 X147.48 Y106.746 E.02442
G1 X151.254 Y110.52 E.20023
G1 X151.254 Y111.171 E.02442
G1 X146.829 Y106.746 E.23476
G1 X146.178 Y106.746 E.02442
M73 P46 R7
G1 X151.254 Y111.822 E.2693
G1 X151.254 Y112.473 E.02442
G1 X145.527 Y106.746 E.30383
G1 X144.876 Y106.746 E.02442
G1 X151.254 Y113.124 E.33837
G1 X151.254 Y113.775 E.02442
G1 X144.225 Y106.746 E.3729
G1 X143.574 Y106.746 E.02442
G1 X151.254 Y114.426 E.40743
G1 X151.254 Y115.077 E.02442
G1 X142.923 Y106.746 E.44197
G1 X142.272 Y106.746 E.02442
G1 X145.348 Y109.822 E.1632
G2 X144.631 Y109.756 I-.569 J2.234 E.02714
G1 X141.621 Y106.746 E.15968
G1 X140.97 Y106.746 E.02442
G1 X144.058 Y109.834 E.16382
G2 X143.571 Y109.997 I.574 J2.516 E.01931
G1 X140.319 Y106.746 E.1725
G1 X139.668 Y106.746 E.02442
G1 X143.15 Y110.228 E.18471
M73 P46 R6
G2 X142.783 Y110.511 I1.701 J2.584 E.01743
G1 X139.017 Y106.746 E.19976
G1 X138.366 Y106.746 E.02442
G1 X142.468 Y110.848 E.21761
G2 X142.206 Y111.236 I1.811 J1.505 E.01762
G1 X137.715 Y106.746 E.23823
G1 X137.064 Y106.746 E.02442
G1 X142.005 Y111.686 E.26209
G2 X141.874 Y112.206 I2.748 J.968 E.02015
M73 P47 R6
G1 X136.413 Y106.746 E.28968
G1 X135.762 Y106.746 E.02442
G1 X142.077 Y113.06 E.33499
; WIPE_START
G1 F24000
G1 X140.663 Y111.646 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-.016 J1.217 P1  F30000
G1 X147.26 Y111.734 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6300
G1 X151.254 Y115.728 E.21189
G1 X151.254 Y116.379 E.02442
G1 X147.625 Y112.75 E.19252
G3 X147.548 Y113.323 I-2.958 J-.109 E.02173
G1 X151.254 Y117.03 E.19664
G1 X151.254 Y117.681 E.02442
G1 X147.385 Y113.812 E.20526
G3 X147.156 Y114.234 I-2.224 J-.933 E.01804
G1 X151.254 Y118.332 E.21741
G1 X151.254 Y118.983 E.02442
G1 X146.871 Y114.6 E.23253
G3 X146.536 Y114.916 I-2.707 J-2.53 E.01729
G1 X151.254 Y119.634 E.25029
G1 X151.254 Y120.285 E.02442
G1 X146.146 Y115.177 E.27098
G3 X145.698 Y115.379 I-1.236 J-2.139 E.01849
G1 X151.254 Y120.936 E.29477
G1 X151.254 Y121.587 E.02442
G1 X145.177 Y115.51 E.3224
G3 X144.556 Y115.54 I-.46 J-3.077 E.02336
G1 X151.254 Y122.238 E.35534
G1 X151.254 Y122.889 E.02442
G1 X143.731 Y115.365 E.39912
G3 X142.02 Y113.654 I.981 J-2.692 E.09371
G1 X135.111 Y106.746 E.36649
G1 X134.46 Y106.746 E.02442
G1 X151.254 Y123.54 E.89091
G1 X151.254 Y124.191 E.02442
G1 X133.809 Y106.746 E.92545
G1 X133.158 Y106.746 E.02442
G1 X151.254 Y124.842 E.95998
G1 X151.254 Y125.493 E.02442
G1 X132.507 Y106.746 E.99451
G1 X131.856 Y106.746 E.02442
G1 X151.254 Y126.144 E1.02905
G1 X151.254 Y126.795 E.02442
G1 X131.205 Y106.746 E1.06358
G1 X130.554 Y106.746 E.02442
G1 X151.254 Y127.446 E1.09812
G1 X151.254 Y128.097 E.02442
G1 X129.903 Y106.746 E1.13265
G1 X129.252 Y106.746 E.02442
G1 X151.254 Y128.748 E1.16719
G1 X151.254 Y129.399 E.02442
G1 X128.601 Y106.746 E1.20172
G1 X127.95 Y106.746 E.02442
G1 X151.254 Y130.05 E1.23625
G1 X151.254 Y130.701 E.02442
G1 X127.299 Y106.746 E1.27079
G1 X126.648 Y106.746 E.02442
G1 X151.254 Y131.352 E1.30532
M73 P48 R6
G1 X151.254 Y132.003 E.02442
G1 X141.234 Y121.983 E.53157
G3 X141.807 Y123.206 I-12.225 J6.469 E.05071
G1 X151.254 Y132.654 E.50117
G1 X151.254 Y133.305 E.02442
G1 X142.173 Y124.224 E.48174
G3 X142.411 Y125.112 I-17.209 J5.073 E.03449
G1 X151.254 Y133.956 E.46915
G1 X151.254 Y134.607 E.02442
G1 X142.573 Y125.925 E.46055
G3 X142.676 Y126.68 I-7.504 J1.413 E.02858
G1 X151.254 Y135.258 E.45506
G1 X151.254 Y135.909 E.02442
G1 X142.731 Y127.385 E.45217
G3 X142.745 Y128.05 I-6.658 J.474 E.02496
G1 X151.254 Y136.56 E.45142
G1 X151.254 Y137.211 E.02442
G1 X142.727 Y128.683 E.45239
G3 X142.68 Y129.288 I-6.084 J-.161 E.02276
G1 X151.254 Y137.862 E.45484
G1 X151.254 Y138.513 E.02442
G1 X142.608 Y129.866 E.45869
G3 X142.512 Y130.421 I-5.603 J-.685 E.02113
G1 X151.254 Y139.164 E.46379
G1 X151.254 Y139.815 E.02442
G1 X142.395 Y130.956 E.46997
G3 X142.26 Y131.472 I-5.236 J-1.095 E.02001
G1 X151.254 Y140.466 E.47714
G1 X151.254 Y141.117 E.02442
G1 X142.108 Y131.97 E.4852
G3 X141.94 Y132.454 I-4.926 J-1.439 E.0192
G1 X151.254 Y141.768 E.4941
G1 X151.254 Y142.419 E.02442
G1 X141.757 Y132.921 E.50383
G3 X141.556 Y133.371 I-4.605 J-1.79 E.01849
G1 X151.254 Y143.07 E.51451
G1 X151.254 Y143.721 E.02442
G1 X141.341 Y133.808 E.52587
G3 X141.115 Y134.232 I-4.366 J-2.056 E.01806
G1 X151.254 Y144.372 E.53788
G1 X151.254 Y145.023 E.02442
G1 X140.877 Y134.645 E.55052
G1 X140.621 Y135.041 E.01766
G1 X151.254 Y145.674 E.56407
G1 X151.254 Y146.325 E.02442
G1 X147.576 Y142.646 E.19515
M73 P49 R6
G3 X147.623 Y143.345 I-3.008 J.555 E.02632
G1 X151.254 Y146.976 E.19263
G1 X151.254 Y147.627 E.02442
G1 X147.538 Y143.911 E.19713
G3 X147.37 Y144.394 I-2.931 J-.748 E.01921
G1 X151.254 Y148.278 E.20604
G1 X151.254 Y148.929 E.02442
G1 X147.139 Y144.813 E.21832
G3 X146.849 Y145.175 I-2.925 J-2.048 E.01738
G1 X150.929 Y149.254 E.21642
G1 X150.278 Y149.254 E.02442
G1 X146.511 Y145.487 E.19985
G3 X146.116 Y145.744 I-1.48 J-1.841 E.01768
G1 X149.627 Y149.254 E.18623
G1 X148.976 Y149.254 E.02442
G1 X145.663 Y145.941 E.17575
G3 X145.138 Y146.067 I-.78 J-2.092 E.0203
G1 X148.325 Y149.254 E.16906
G1 X147.674 Y149.254 E.02442
G1 X144.272 Y145.852 E.18047
; WIPE_START
G1 F24000
G1 X145.686 Y147.267 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I1.217 J-.02 P1  F30000
G1 X145.58 Y140.65 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6300
G1 X140.355 Y135.425 E.27716
G3 X140.078 Y135.799 I-3.886 J-2.588 E.01746
G1 X144.589 Y140.31 E.2393
G2 X144.023 Y140.395 I.177 J3.115 E.0215
G1 X139.789 Y136.162 E.22459
G3 X139.485 Y136.509 I-3.63 J-2.869 E.01731
G1 X143.539 Y140.562 E.21502
G2 X143.122 Y140.797 I.966 J2.196 E.01795
G1 X139.171 Y136.846 E.2096
G3 X138.847 Y137.173 I-3.439 J-3.083 E.01727
G1 X142.759 Y141.085 E.20751
G2 X142.447 Y141.424 I1.539 J1.727 E.01731
G1 X138.51 Y137.486 E.20888
G3 X138.159 Y137.787 I-3.188 J-3.359 E.01732
G1 X142.191 Y141.819 E.21388
G2 X141.994 Y142.272 I1.77 J1.04 E.0186
M73 P50 R6
G1 X137.799 Y138.077 E.22253
G3 X137.428 Y138.357 I-2.989 J-3.574 E.01744
G1 X141.868 Y142.797 E.23553
G2 X141.847 Y143.428 I2.965 J.412 E.02371
G1 X137.041 Y138.621 E.25498
G3 X136.642 Y138.874 I-2.729 J-3.867 E.0177
G1 X142.045 Y144.277 E.28663
G2 X143.66 Y145.891 I2.707 J-1.093 E.08799
G1 X147.023 Y149.254 E.1784
G1 X146.372 Y149.254 E.02442
G1 X136.232 Y139.115 E.53788
G3 X135.811 Y139.344 I-2.503 J-4.1 E.01801
G1 X145.721 Y149.254 E.52572
G1 X145.07 Y149.254 E.02442
G1 X135.371 Y139.556 E.51449
G3 X134.919 Y139.754 I-2.215 J-4.434 E.01854
G1 X144.419 Y149.254 E.50396
G1 X143.768 Y149.254 E.02442
G1 X134.453 Y139.939 E.49416
G3 X133.972 Y140.109 I-1.945 J-4.733 E.01914
G1 X143.117 Y149.254 E.48513
G1 X142.466 Y149.254 E.02442
G1 X133.474 Y140.263 E.47699
G3 X132.956 Y140.396 I-1.592 J-5.121 E.02007
G1 X141.815 Y149.254 E.46993
G1 X141.164 Y149.254 E.02442
G1 X132.42 Y140.511 E.46385
G3 X131.864 Y140.605 I-1.225 J-5.529 E.02118
G1 X140.513 Y149.254 E.45883
G1 X139.862 Y149.254 E.02442
G1 X131.285 Y140.677 E.45501
G3 X130.68 Y140.724 I-.771 J-6.032 E.02274
G1 X139.211 Y149.254 E.45253
G1 X138.56 Y149.254 E.02442
G1 X130.048 Y140.742 E.45157
G3 X129.382 Y140.727 I-.183 J-6.679 E.025
G1 X137.909 Y149.254 E.45236
G1 X137.258 Y149.254 E.02442
G1 X128.677 Y140.673 E.45522
G3 X127.926 Y140.573 I.626 J-7.573 E.02843
G1 X136.607 Y149.254 E.46052
G1 X135.956 Y149.254 E.02442
G1 X127.116 Y140.414 E.46896
G3 X126.219 Y140.168 I2.018 J-9.112 E.03491
G1 X135.305 Y149.254 E.48202
G1 X134.654 Y149.254 E.02442
G1 X125.207 Y139.807 E.50115
G3 X123.978 Y139.229 I4.999 J-12.226 E.05096
G1 X134.209 Y149.46 E.54271
; WIPE_START
G1 F24000
G1 X132.794 Y148.046 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I1.208 J.149 P1  F30000
G1 X136.582 Y117.33 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6300
G1 X125.997 Y106.746 E.56149
G1 X125.346 Y106.746 E.02442
G1 X134.793 Y116.193 E.50115
G2 X133.781 Y115.832 I-5.047 J12.56 E.0403
G1 X124.695 Y106.746 E.48202
G1 X124.044 Y106.746 E.02442
G1 X132.884 Y115.586 E.46896
G2 X132.074 Y115.427 I-4.017 J18.31 E.03097
G1 X123.393 Y106.746 E.46052
G1 X122.742 Y106.746 E.02442
M73 P51 R6
G1 X131.323 Y115.327 E.45521
G2 X130.618 Y115.273 I-.891 J7.035 E.02652
G1 X122.091 Y106.746 E.45236
G1 X121.44 Y106.746 E.02442
G1 X129.952 Y115.258 E.45157
G2 X129.32 Y115.276 I-.135 J6.349 E.02376
G1 X120.789 Y106.746 E.45253
G1 X120.138 Y106.746 E.02442
G1 X128.715 Y115.323 E.45501
G2 X128.136 Y115.395 I.432 J5.835 E.02189
G1 X119.487 Y106.746 E.45883
G1 X118.836 Y106.746 E.02442
G1 X127.58 Y115.489 E.46385
G2 X127.044 Y115.604 I.881 J5.43 E.02058
G1 X118.185 Y106.746 E.46993
G1 X117.534 Y106.746 E.02442
G1 X126.526 Y115.737 E.47699
G1 X126.028 Y115.891 E.01953
G1 X116.883 Y106.746 E.48513
G1 X116.232 Y106.746 E.02442
G1 X125.547 Y116.061 E.49416
G2 X125.081 Y116.246 I1.618 J4.762 E.01882
G1 X115.581 Y106.746 E.50396
G1 X114.93 Y106.746 E.02442
G1 X124.629 Y116.444 E.51449
G1 X124.189 Y116.656 E.01829
G1 X114.279 Y106.746 E.52572
G1 X113.628 Y106.746 E.02442
G1 X123.768 Y116.885 E.53788
G2 X123.358 Y117.126 I2.211 J4.228 E.01785
G1 X112.977 Y106.746 E.55067
G1 X112.326 Y106.746 E.02442
G1 X115.411 Y109.831 E.16366
G3 X117.578 Y111.998 I-.637 J2.804 E.12123
G1 X122.959 Y117.379 E.28545
G1 X122.572 Y117.643 E.01757
G1 X117.652 Y112.722 E.26101
G3 X117.579 Y113.3 I-3.069 J-.096 E.02188
G1 X122.201 Y117.923 E.24522
G2 X121.841 Y118.213 I2.73 J3.758 E.01737
G1 X117.42 Y113.792 E.23452
G3 X117.188 Y114.212 I-1.745 J-.688 E.01803
G1 X121.49 Y118.514 E.2282
G1 X121.153 Y118.827 E.01728
G1 X116.911 Y114.586 E.225
G3 X116.576 Y114.901 I-2.403 J-2.217 E.01729
G1 X120.829 Y119.154 E.22561
G2 X120.515 Y119.491 I3.22 J3.313 E.01729
G1 X116.19 Y115.167 E.22939
M73 P52 R6
G3 X115.744 Y115.371 I-1.244 J-2.13 E.01846
G1 X120.211 Y119.838 E.23698
G1 X119.922 Y120.201 E.01738
G1 X115.227 Y115.505 E.24908
G3 X114.611 Y115.54 I-.478 J-2.954 E.02318
G1 X119.793 Y120.722 E.27488
; WIPE_START
G1 F24000
G1 X118.378 Y119.308 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I1.14 J-.425 P1  F30000
G1 X114.894 Y109.964 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6300
G1 X111.675 Y106.746 E.17075
G1 X111.024 Y106.746 E.02442
G1 X114.106 Y109.827 E.16348
G2 X113.617 Y109.989 I.564 J2.524 E.01936
G1 X110.373 Y106.746 E.17207
G1 X109.722 Y106.746 E.02442
G1 X113.193 Y110.216 E.18411
G2 X112.822 Y110.496 I1.913 J2.917 E.01745
G1 X109.071 Y106.746 E.19897
G1 X108.746 Y106.746 E.01221
G1 X108.746 Y107.071 E.01221
G1 X112.506 Y110.831 E.19947
G2 X112.242 Y111.218 I1.802 J1.512 E.0176
G1 X108.746 Y107.722 E.18547
G1 X108.746 Y108.373 E.02442
G1 X112.037 Y111.665 E.17463
G2 X111.903 Y112.181 I2.751 J.994 E.02004
G1 X108.746 Y109.024 E.16748
G1 X108.746 Y109.675 E.02442
G1 X112.097 Y113.026 E.17778
; WIPE_START
G1 F24000
G1 X110.683 Y111.612 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I.695 J-.999 P1  F30000
G1 X108.54 Y110.12 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6300
G1 X112.028 Y113.609 E.18504
G2 X113.799 Y115.38 I2.705 J-.934 E.09726
G1 X119.379 Y120.959 E.29597
G1 X119.123 Y121.355 E.01766
G1 X108.746 Y110.977 E.55052
G1 X108.746 Y111.628 E.02442
G1 X118.885 Y121.768 E.53788
G2 X118.659 Y122.192 I4.14 J2.481 E.01806
G1 X108.746 Y112.279 E.52587
G1 X108.746 Y112.93 E.02442
G1 X118.444 Y122.629 E.51451
G2 X118.243 Y123.079 I4.406 J2.241 E.01849
M73 P53 R6
G1 X108.746 Y113.581 E.50383
G1 X108.746 Y114.232 E.02442
G1 X118.06 Y123.546 E.4941
G2 X117.892 Y124.03 I4.758 J1.922 E.0192
G1 X108.746 Y114.883 E.4852
G1 X108.746 Y115.534 E.02442
G1 X117.74 Y124.528 E.47714
G2 X117.605 Y125.044 I5.101 J1.611 E.02001
G1 X108.746 Y116.185 E.46997
G1 X108.746 Y116.836 E.02442
G1 X117.488 Y125.579 E.46379
G2 X117.392 Y126.134 I5.512 J1.241 E.02113
G1 X108.746 Y117.487 E.45869
G1 X108.746 Y118.138 E.02442
G1 X117.32 Y126.712 E.45484
G2 X117.273 Y127.317 I6.037 J.766 E.02276
G1 X108.746 Y118.789 E.45239
G1 X108.746 Y119.44 E.02442
G1 X117.255 Y127.95 E.45142
G2 X117.269 Y128.615 I6.67 J.191 E.02496
G1 X108.746 Y120.091 E.45217
G1 X108.746 Y120.742 E.02442
G1 X117.324 Y129.32 E.45506
G2 X117.427 Y130.075 I7.61 J-.659 E.02858
G1 X108.746 Y121.393 E.46055
G1 X108.746 Y122.044 E.02442
G1 X117.589 Y130.888 E.46915
G2 X117.827 Y131.776 I17.444 J-4.185 E.03449
G1 X108.746 Y122.695 E.48174
G1 X108.746 Y123.346 E.02442
G1 X118.193 Y132.794 E.50117
G2 X118.766 Y134.018 I12.8 J-5.246 E.05071
G1 X108.746 Y123.997 E.53157
G1 X108.746 Y124.648 E.02442
G1 X133.352 Y149.254 E1.30532
G1 X132.701 Y149.254 E.02442
G1 X108.746 Y125.299 E1.27079
G1 X108.746 Y125.95 E.02442
G1 X132.05 Y149.254 E1.23625
G1 X131.399 Y149.254 E.02442
G1 X108.746 Y126.601 E1.20172
G1 X108.746 Y127.252 E.02442
G1 X130.748 Y149.254 E1.16718
G1 X130.097 Y149.254 E.02442
G1 X108.746 Y127.903 E1.13265
G1 X108.746 Y128.554 E.02442
G1 X129.446 Y149.254 E1.09812
G1 X128.795 Y149.254 E.02442
G1 X108.746 Y129.205 E1.06358
G1 X108.746 Y129.856 E.02442
G1 X128.144 Y149.254 E1.02905
G1 X127.493 Y149.254 E.02442
G1 X108.746 Y130.507 E.99451
G1 X108.746 Y131.158 E.02442
G1 X126.842 Y149.254 E.95998
G1 X126.191 Y149.254 E.02442
G1 X108.746 Y131.809 E.92544
G1 X108.746 Y132.46 E.02442
G1 X125.54 Y149.254 E.89091
M73 P53 R5
G1 X124.889 Y149.254 E.02442
G1 X108.746 Y133.111 E.85638
G1 X108.746 Y133.762 E.02442
G1 X115.353 Y140.369 E.35048
G2 X114.641 Y140.308 I-.543 J2.168 E.0269
G1 X108.746 Y134.413 E.31274
M73 P54 R5
G1 X108.746 Y135.064 E.02442
G1 X114.07 Y140.389 E.28248
G2 X113.589 Y140.559 I.421 J1.956 E.01919
G1 X108.746 Y135.715 E.25696
G1 X108.746 Y136.366 E.02442
G1 X113.164 Y140.784 E.23437
G2 X112.799 Y141.071 I1.251 J1.963 E.01742
G1 X108.746 Y137.017 E.21505
G1 X108.746 Y137.668 E.02442
G1 X112.486 Y141.409 E.19843
G2 X112.225 Y141.798 I1.815 J1.501 E.01763
G1 X108.746 Y138.319 E.18456
G1 X108.746 Y138.97 E.02442
G1 X112.025 Y142.25 E.17399
G2 X111.897 Y142.772 I2.769 J.959 E.02021
G1 X108.746 Y139.621 E.16716
G1 X108.746 Y140.272 E.02442
G1 X112.105 Y143.631 E.1782
; WIPE_START
G1 F24000
G1 X110.691 Y142.217 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-.017 J1.217 P1  F30000
G1 X117.295 Y142.311 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6300
G1 X124.238 Y149.254 E.36833
G1 X123.587 Y149.254 E.02442
G1 X117.65 Y143.317 E.31496
G3 X117.569 Y143.888 I-2.92 J-.12 E.02165
G1 X122.936 Y149.254 E.28469
G1 X122.285 Y149.254 E.02442
G1 X117.405 Y144.374 E.25888
G3 X117.175 Y144.796 I-2.219 J-.938 E.01803
G1 X121.634 Y149.254 E.23654
G1 X120.983 Y149.254 E.02442
G1 X116.886 Y145.157 E.21735
G3 X116.551 Y145.473 I-1.396 J-1.146 E.01732
M73 P55 R5
G1 X120.332 Y149.254 E.2006
G1 X119.681 Y149.254 E.02442
G1 X116.161 Y145.734 E.18675
G3 X115.711 Y145.936 I-1.232 J-2.144 E.0185
G1 X119.03 Y149.254 E.17605
G1 X118.379 Y149.254 E.02442
G1 X115.188 Y146.064 E.16927
G3 X114.564 Y146.091 I-.451 J-3.177 E.02346
G1 X117.728 Y149.254 E.16782
G1 X117.077 Y149.254 E.02442
G1 X113.731 Y145.909 E.17748
G3 X112.054 Y144.231 I1.01 J-2.688 E.09172
G1 X108.746 Y140.923 E.1755
G1 X108.746 Y141.574 E.02442
G1 X116.426 Y149.254 E.40743
G1 X115.775 Y149.254 E.02442
G1 X108.746 Y142.225 E.3729
G1 X108.746 Y142.876 E.02442
G1 X115.124 Y149.254 E.33836
G1 X114.473 Y149.254 E.02442
G1 X108.746 Y143.527 E.30383
G1 X108.746 Y144.178 E.02442
G1 X113.822 Y149.254 E.2693
G1 X113.171 Y149.254 E.02442
G1 X108.746 Y144.829 E.23476
G1 X108.746 Y145.48 E.02442
G1 X112.52 Y149.254 E.20023
G1 X111.869 Y149.254 E.02442
G1 X108.746 Y146.131 E.16569
G1 X108.746 Y146.782 E.02442
G1 X111.218 Y149.254 E.13116
G1 X110.567 Y149.254 E.02442
G1 X108.746 Y147.433 E.09662
G1 X108.746 Y148.084 E.02442
G1 X109.916 Y149.254 E.06209
G1 X109.265 Y149.254 E.02442
G1 X108.54 Y148.529 E.03847
M106 S237.15
M106 P2 S178
; CHANGE_LAYER
; Z_HEIGHT: 0.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X109.265 Y149.254 E-.38969
G1 X109.916 Y149.254 E-.24738
G1 X109.687 Y149.026 E-.12293
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 2/15
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
G3 Z.6 I.757 J.953 P1  F30000
G1 X141.369 Y123.852 Z.6
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X141.371 Y123.861 E.00032
G3 X129.698 Y115.901 I-11.371 J4.137 E2.02156
G1 X130.302 Y115.901 E.02002
G3 X141.151 Y123.3 I-.302 J12.097 E.46043
G1 X141.347 Y123.796 E.01771
G1 X141.003 Y123.995 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X129.708 Y116.294 I-11.003 J4.003 E1.81189
G1 X130.292 Y116.294 E.01794
G3 X140.982 Y123.939 I-.292 J11.705 E.42877
M204 S10000
; WIPE_START
G1 F24000
G1 X141.19 Y124.548 E-.24464
G1 X141.348 Y125.11 E-.22188
G1 X141.478 Y125.68 E-.22187
M73 P56 R5
G1 X141.511 Y125.865 E-.0716
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I1.12 J.476 P1  F30000
G1 X146.573 Y113.945 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X146.304 Y114.261 E.01375
G3 X144.453 Y110.414 I-1.571 J-1.612 E.28301
G1 X144.677 Y110.398 E.00745
G3 X146.607 Y113.896 I.056 J2.251 E.16303
G1 X146.28 Y113.68 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X146.269 Y113.696 E.00063
G3 X144.502 Y110.804 I-1.536 J-1.048 E.22786
G1 X144.687 Y110.79 E.0057
G3 X146.446 Y113.372 I.046 J1.859 E.11398
G1 X146.308 Y113.627 E.00891
M204 S10000
; WIPE_START
G1 F24000
G1 X146.269 Y113.696 E-.0305
G1 X146.032 Y113.981 E-.1407
G1 X145.742 Y114.212 E-.14078
G1 X145.415 Y114.38 E-.13994
G1 X145.147 Y114.463 E-.10652
G1 X144.78 Y114.509 E-.14072
G1 X144.62 Y114.497 E-.06084
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I.008 J-1.217 P1  F30000
G1 X113.212 Y114.284 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X113.187 Y114.261 E.00112
G3 X114.478 Y110.414 I1.571 J-1.612 E.16762
G1 X114.702 Y110.398 E.00745
G3 X113.537 Y114.54 I.056 J2.251 E.27929
G1 X113.259 Y114.321 E.01175
G1 X113.386 Y113.894 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X113.223 Y113.697 E.00787
G3 X114.527 Y110.804 I1.536 J-1.048 E.11682
G1 X114.712 Y110.79 E.0057
G3 X113.461 Y113.98 I.046 J1.859 E.22501
G1 X113.425 Y113.939 E.00166
M204 S10000
; WIPE_START
G1 F24000
G1 X113.223 Y113.697 E-.12017
G1 X113.044 Y113.372 E-.1407
G1 X112.935 Y113.018 E-.14077
G1 X112.907 Y112.835 E-.07047
G1 X112.907 Y112.464 E-.14077
G1 X112.98 Y112.103 E-.13996
G1 X112.987 Y112.086 E-.00716
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I-1.209 J.143 P1  F30000
G1 X116.503 Y141.781 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X116.736 Y142.124 E.01375
G3 X114.478 Y140.966 I-1.978 J1.076 E.37983
G1 X114.702 Y140.949 E.00745
G3 X116.467 Y141.734 I.056 J2.251 E.06622
G1 X116.233 Y142.079 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X116.391 Y142.312 E.00865
G3 X114.527 Y141.355 I-1.633 J.888 E.29053
G1 X114.712 Y141.342 E.0057
G3 X116.183 Y142.006 I.046 J1.859 E.0513
G1 X116.199 Y142.029 E.00088
M204 S10000
; WIPE_START
G1 F24000
G1 X116.391 Y142.312 E-.12981
G1 X116.536 Y142.653 E-.14074
G1 X116.609 Y143.014 E-.13996
G1 X116.616 Y143.294 E-.10651
G1 X116.561 Y143.66 E-.14072
G1 X116.469 Y143.913 E-.10226
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I-.031 J1.217 P1  F30000
G1 X146.435 Y144.673 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X146.136 Y144.961 E.01375
G3 X144.453 Y140.966 I-1.403 J-1.761 E.27556
G1 X144.677 Y140.949 E.00745
G3 X146.474 Y144.628 I.056 J2.251 E.17048
G1 X146.165 Y144.387 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X146.157 Y144.396 E.00038
G3 X144.502 Y141.355 I-1.424 J-1.196 E.22217
G1 X144.687 Y141.342 E.0057
G3 X146.365 Y144.09 I.046 J1.859 E.11967
G1 X146.199 Y144.337 E.00915
M204 S10000
; WIPE_START
G1 F24000
G1 X146.157 Y144.396 E-.02747
G1 X145.893 Y144.656 E-.1407
G1 X145.582 Y144.857 E-.14077
G1 X145.239 Y144.991 E-.13977
G1 X144.964 Y145.047 E-.10664
G1 X144.594 Y145.056 E-.14077
G1 X144.429 Y145.027 E-.06388
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I-.665 J1.019 P1  F30000
G1 X151.898 Y149.898 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X108.102 Y149.898 E1.45279
G1 X108.102 Y106.102 E1.45279
G1 X151.898 Y106.102 E1.45279
G1 X151.898 Y149.838 E1.4508
G1 X152.29 Y150.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X107.71 Y150.29 E1.36982
G1 X107.71 Y105.71 E1.36982
G1 X152.29 Y105.71 E1.36982
G1 X152.29 Y150.23 E1.36798
M204 S10000
; WIPE_START
G1 F24000
G1 X150.29 Y150.233 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I.719 J.982 P1  F30000
G1 X150.971 Y149.734 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.420388
G1 F15000
G1 X151.565 Y149.141 E.02581
G1 X151.565 Y148.607 E.01642
G1 X150.607 Y149.565 E.04165
G1 X150.073 Y149.565 E.01642
G1 X151.565 Y148.073 E.06487
G1 X151.565 Y147.539 E.01642
G1 X149.539 Y149.565 E.08809
G1 X149.006 Y149.565 E.01642
G1 X151.565 Y147.006 E.11132
G1 X151.565 Y146.472 E.01642
G1 X148.472 Y149.565 E.13454
G1 X147.938 Y149.565 E.01642
G1 X151.565 Y145.938 E.15776
G1 X151.565 Y145.404 E.01642
G1 X147.404 Y149.565 E.18098
G1 X146.87 Y149.565 E.01642
G1 X151.565 Y144.87 E.2042
G1 X151.565 Y144.337 E.01642
G1 X146.337 Y149.565 E.22742
G1 X145.803 Y149.565 E.01642
G1 X151.565 Y143.803 E.25064
G1 X151.565 Y143.269 E.01642
G1 X145.269 Y149.565 E.27386
G1 X144.735 Y149.565 E.01642
G1 X151.565 Y142.735 E.29708
G1 X151.565 Y142.201 E.01642
G1 X144.201 Y149.565 E.3203
G1 X143.667 Y149.565 E.01642
G1 X151.565 Y141.667 E.34353
G1 X151.565 Y141.134 E.01642
G1 X143.134 Y149.565 E.36675
G1 X142.6 Y149.565 E.01642
G1 X151.565 Y140.6 E.38997
G1 X151.565 Y140.066 E.01642
G1 X142.066 Y149.565 E.41319
G1 X141.532 Y149.565 E.01642
G1 X145.399 Y145.698 E.16821
G3 X144.787 Y145.776 I-.523 J-1.668 E.01907
G1 X140.998 Y149.565 E.16482
G1 X140.465 Y149.565 E.01642
G1 X144.291 Y145.738 E.16646
G3 X143.868 Y145.628 I.061 J-1.103 E.01355
M73 P57 R5
G1 X139.931 Y149.565 E.17126
G1 X139.397 Y149.565 E.01642
G1 X143.495 Y145.467 E.17826
G1 X143.17 Y145.257 E.01188
G1 X138.863 Y149.565 E.18737
G1 X138.329 Y149.565 E.01642
G1 X142.892 Y145.002 E.19847
G3 X142.647 Y144.713 I.593 J-.749 E.01173
G1 X137.795 Y149.565 E.21105
G1 X137.262 Y149.565 E.01642
G1 X142.439 Y144.387 E.22521
G1 X142.281 Y144.012 E.01254
G1 X136.728 Y149.565 E.24154
G1 X136.194 Y149.565 E.01642
G1 X142.182 Y143.577 E.26048
G1 X142.158 Y143.459 E.00369
G1 X142.158 Y143.067 E.01207
G1 X135.66 Y149.565 E.28267
G1 X135.126 Y149.565 E.01642
G1 X142.266 Y142.425 E.31058
G3 X143.021 Y141.261 I2.658 J.897 E.04311
G1 X143.439 Y140.96 E.01585
G1 X143.953 Y140.738 E.0172
G1 X151.565 Y133.126 E.33112
G1 X151.565 Y133.66 E.01642
G1 X144.596 Y140.629 E.30314
G3 X145.106 Y140.652 I.197 J1.274 E.01582
G1 X151.565 Y134.194 E.28094
G1 X151.565 Y134.728 E.01642
G1 X145.54 Y140.752 E.26205
G1 X145.922 Y140.904 E.01264
G1 X151.565 Y135.262 E.24544
G1 X151.565 Y135.795 E.01642
G1 X146.247 Y141.113 E.23133
G3 X146.534 Y141.36 I-.467 J.833 E.01172
G1 X151.565 Y136.329 E.21885
G1 X151.565 Y136.863 E.01642
G1 X146.786 Y141.642 E.20786
G1 X147.003 Y141.959 E.01182
G1 X151.565 Y137.397 E.19845
G1 X151.565 Y137.931 E.01642
G1 X147.162 Y142.334 E.19152
G1 X147.206 Y142.439 E.0035
G1 X147.271 Y142.759 E.01004
G1 X151.565 Y138.465 E.18679
G1 X151.565 Y138.998 E.01642
G1 X147.308 Y143.255 E.18516
G1 X147.308 Y143.459 E.00627
G1 X147.224 Y143.872 E.01297
G1 X151.734 Y139.362 E.19618
; WIPE_START
G1 F24000
G1 X150.32 Y140.777 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I.118 J-1.211 P1  F30000
G1 X123.08 Y138.123 Z.8
G1 Z.4
G1 E.8 F1800
G1 F15000
G1 X117.21 Y143.992 E.25532
G1 X117.266 Y143.84 E.00499
G1 X117.342 Y143.327 E.01594
G1 X122.645 Y138.024 E.23067
G1 X122.341 Y137.794 E.01172
G1 X117.31 Y142.826 E.21887
G1 X117.211 Y142.391 E.01372
G1 X122.047 Y137.555 E.21035
G3 X121.757 Y137.311 I2.302 J-3.023 E.01166
G1 X117.053 Y142.015 E.20464
G1 X116.844 Y141.69 E.01189
G1 X121.48 Y137.054 E.20167
G3 X121.209 Y136.791 I2.493 J-2.85 E.01162
G1 X116.6 Y141.4 E.20049
G1 X116.321 Y141.145 E.01162
G1 X120.945 Y136.521 E.20115
G3 X120.692 Y136.241 I2.683 J-2.678 E.01163
G1 X115.997 Y140.936 E.20424
G1 X115.624 Y140.775 E.01249
G1 X120.443 Y135.955 E.20965
G1 X120.206 Y135.658 E.01168
G1 X115.2 Y140.665 E.21777
G2 X114.704 Y140.627 I-.341 J1.208 E.01541
G1 X119.976 Y135.355 E.22935
G1 X119.753 Y135.044 E.01176
G1 X114.083 Y140.714 E.24666
G1 X113.934 Y140.748 E.00469
G1 X113.464 Y140.96 E.01585
G1 X113.049 Y141.259 E.01572
G1 X112.77 Y141.547 E.01235
G1 X112.486 Y141.964 E.01552
G1 X112.286 Y142.438 E.01585
G1 X112.267 Y142.53 E.00287
G1 X108.435 Y146.362 E.16668
G1 X108.435 Y146.896 E.01642
G1 X112.183 Y143.147 E.16304
G2 X112.221 Y143.644 I1.247 J.156 E.01541
G1 X108.435 Y147.429 E.16467
G1 X108.435 Y147.963 E.01642
G1 X112.33 Y144.069 E.1694
G1 X112.489 Y144.443 E.01252
G1 X108.435 Y148.497 E.17632
G1 X108.435 Y149.031 E.01642
G1 X112.705 Y144.761 E.18574
G2 X112.958 Y145.042 I.822 J-.484 E.0117
G1 X108.435 Y149.565 E.19673
G1 X108.969 Y149.565 E.01642
G1 X113.245 Y145.289 E.18599
G1 X113.569 Y145.498 E.01188
G1 X109.503 Y149.565 E.17688
G1 X110.037 Y149.565 E.01642
G1 X113.951 Y145.651 E.17026
G1 X114.057 Y145.692 E.00352
G1 X114.385 Y145.75 E.01024
G1 X110.571 Y149.565 E.16593
G1 X111.104 Y149.565 E.01642
G1 X114.896 Y145.774 E.16491
G1 X115.08 Y145.769 E.00568
G1 X115.539 Y145.664 E.01447
G1 X111.638 Y149.565 E.16966
G1 X112.172 Y149.565 E.01642
G1 X123.276 Y138.46 E.48303
G1 X123.608 Y138.663 E.01194
G1 X112.706 Y149.565 E.47422
G1 X113.24 Y149.565 E.01642
G1 X123.946 Y138.859 E.46571
G1 X124.291 Y139.047 E.0121
G1 X113.774 Y149.565 E.45752
G1 X114.307 Y149.565 E.01642
G1 X124.65 Y139.222 E.44991
G2 X125.016 Y139.39 I1.868 J-3.578 E.01238
G1 X114.841 Y149.565 E.44259
G1 X115.375 Y149.565 E.01642
G1 X125.391 Y139.548 E.4357
G2 X125.78 Y139.694 I1.649 J-3.821 E.01277
G1 X115.909 Y149.565 E.42939
G1 X116.443 Y149.565 E.01642
G1 X126.177 Y139.83 E.42343
G1 X126.585 Y139.956 E.01313
G1 X116.976 Y149.565 E.41796
G1 X117.51 Y149.565 E.01642
G1 X127.008 Y140.067 E.41316
G2 X127.442 Y140.166 I1.215 J-4.302 E.01371
G1 X118.044 Y149.565 E.40883
G1 X118.578 Y149.565 E.01642
G1 X127.889 Y140.254 E.40501
G1 X128.352 Y140.324 E.01443
G1 X119.112 Y149.565 E.40197
G1 X119.646 Y149.565 E.01642
G1 X128.833 Y140.377 E.39966
G2 X129.33 Y140.414 I.617 J-4.964 E.01534
G1 X120.179 Y149.565 E.39806
G1 X120.713 Y149.565 E.01642
G1 X129.846 Y140.432 E.39728
G2 X130.384 Y140.428 I.232 J-5.386 E.01654
G1 X121.247 Y149.565 E.39744
G1 X121.781 Y149.565 E.01642
G1 X130.946 Y140.399 E.3987
G1 X131.539 Y140.34 E.01834
G1 X122.315 Y149.565 E.40128
G1 X122.848 Y149.565 E.01642
G1 X132.168 Y140.245 E.4054
G2 X132.842 Y140.105 I-1.068 J-6.824 E.02118
G1 X123.382 Y149.565 E.4115
G1 X123.916 Y149.565 E.01642
G1 X133.573 Y139.908 E.42008
G2 X134.379 Y139.636 I-2.319 J-8.206 E.02616
G1 X124.45 Y149.565 E.4319
G1 X124.984 Y149.565 E.01642
G1 X135.305 Y139.244 E.44896
G2 X136.462 Y138.621 I-5.375 J-11.366 E.04043
G1 X125.348 Y149.734 E.48344
G1 X134.423 Y149.734 F30000
G1 F15000
G1 X151.565 Y132.593 E.74566
G1 X151.565 Y132.059 E.01642
G1 X134.059 Y149.565 E.7615
G1 X133.525 Y149.565 E.01642
G1 X151.565 Y131.525 E.78472
G1 X151.565 Y130.991 E.01642
G1 X132.991 Y149.565 E.80794
G1 X132.457 Y149.565 E.01642
G1 X151.565 Y130.457 E.83117
G1 X151.565 Y129.923 E.01642
G1 X131.923 Y149.565 E.85439
G1 X131.39 Y149.565 E.01642
G1 X151.565 Y129.39 E.87761
G1 X151.565 Y128.856 E.01642
G1 X130.856 Y149.565 E.90083
G1 X130.322 Y149.565 E.01642
G1 X151.565 Y128.322 E.92405
G1 X151.565 Y127.788 E.01642
G1 X129.788 Y149.565 E.94727
G1 X129.254 Y149.565 E.01642
G1 X151.565 Y127.254 E.97049
G1 X151.565 Y126.72 E.01642
G1 X128.72 Y149.565 E.99371
G1 X128.187 Y149.565 E.01642
G1 X151.565 Y126.187 E1.01693
G1 X151.565 Y125.653 E.01642
G1 X127.653 Y149.565 E1.04015
G1 X127.119 Y149.565 E.01642
G1 X151.565 Y125.119 E1.06338
G1 X151.565 Y124.585 E.01642
G1 X126.585 Y149.565 E1.0866
G1 X126.051 Y149.565 E.01642
G1 X151.565 Y124.051 E1.10982
G1 X151.565 Y123.518 E.01642
G1 X140.629 Y134.453 E.47568
G2 X141.246 Y133.302 I-12.478 J-7.43 E.04017
G1 X151.565 Y122.984 E.44884
G1 X151.565 Y122.45 E.01642
G1 X141.637 Y132.378 E.43186
G2 X141.91 Y131.571 I-14.79 J-5.453 E.0262
G1 X151.565 Y121.916 E.41999
G1 X151.565 Y121.382 E.01642
G1 X142.102 Y130.845 E.41161
G2 X142.24 Y130.173 I-6.664 J-1.721 E.02111
G1 X151.565 Y120.848 E.4056
G1 X151.565 Y120.315 E.01642
G1 X142.336 Y129.544 E.40146
G2 X142.395 Y128.95 I-5.918 J-.897 E.01836
G1 X151.565 Y119.781 E.39886
G1 X151.565 Y119.247 E.01642
M73 P58 R5
G1 X142.426 Y128.386 E.39753
G2 X142.432 Y127.846 I-5.403 J-.328 E.01661
G1 X151.565 Y118.713 E.39728
G1 X151.565 Y118.179 E.01642
G1 X142.416 Y127.328 E.39795
G1 X142.379 Y126.831 E.01532
G1 X151.565 Y117.646 E.39957
G1 X151.565 Y117.112 E.01642
G1 X142.323 Y126.354 E.40202
G2 X142.252 Y125.891 I-4.672 J.48 E.01441
G1 X151.565 Y116.578 E.40511
G1 X151.565 Y116.044 E.01642
G1 X142.167 Y125.441 E.40877
G1 X142.068 Y125.007 E.01371
G1 X151.565 Y115.51 E.41309
G1 X151.565 Y114.976 E.01642
G1 X141.954 Y124.587 E.41805
G2 X141.83 Y124.177 I-4.169 J1.037 E.01318
G1 X151.565 Y114.443 E.42344
G1 X151.565 Y113.909 E.01642
G1 X141.696 Y123.777 E.42928
G2 X141.547 Y123.393 I-3.929 J1.303 E.01269
G1 X151.565 Y113.375 E.43577
G1 X151.565 Y112.841 E.01642
G1 X141.39 Y123.016 E.4426
G1 X141.224 Y122.648 E.01241
G1 X151.565 Y112.307 E.44982
G1 X151.565 Y111.774 E.01642
G1 X141.045 Y122.293 E.45761
G2 X140.859 Y121.945 I-3.582 J1.684 E.01214
G1 X151.565 Y111.24 E.46568
G1 X151.565 Y110.706 E.01642
G1 X140.664 Y121.607 E.47418
G2 X140.458 Y121.279 I-3.391 J1.897 E.01192
G1 X151.565 Y110.172 E.48313
G1 X151.565 Y109.638 E.01642
G1 X140.247 Y120.956 E.49232
G1 X140.024 Y120.645 E.01176
G1 X145.578 Y115.091 E.24161
G1 X145.055 Y115.217 E.01656
G1 X144.914 Y115.221 E.00431
G1 X139.794 Y120.342 E.22276
G1 X139.557 Y120.045 E.01168
G1 X144.397 Y115.205 E.21053
G1 X144.032 Y115.141 E.01138
G1 X143.957 Y115.111 E.0025
G1 X139.308 Y119.759 E.20221
G2 X139.055 Y119.479 I-2.937 J2.398 E.01163
G1 X143.573 Y114.961 E.19655
G1 X143.246 Y114.754 E.01191
G1 X138.791 Y119.209 E.19377
G2 X138.52 Y118.946 I-2.764 J2.588 E.01162
G1 X142.954 Y114.512 E.19291
G3 X142.698 Y114.235 I.556 J-.774 E.0117
G1 X138.243 Y118.689 E.19377
G2 X137.953 Y118.445 I-2.591 J2.778 E.01166
G1 X142.481 Y113.917 E.19695
G1 X142.317 Y113.547 E.01245
G1 X137.659 Y118.206 E.20264
G1 X137.355 Y117.976 E.01172
G1 X142.203 Y113.128 E.21087
G3 X142.158 Y112.639 I1.188 J-.355 E.01521
G1 X137.042 Y117.755 E.22255
G2 X136.724 Y117.54 I-2.317 J3.081 E.01183
G1 X142.231 Y112.032 E.23957
G1 X142.26 Y111.887 E.00456
G1 X142.46 Y111.412 E.01585
G1 X142.744 Y110.995 E.01552
G1 X143.024 Y110.707 E.01236
G1 X143.439 Y110.409 E.01572
G1 X143.909 Y110.197 E.01585
G1 X144.113 Y110.15 E.00644
G1 X147.828 Y106.435 E.16159
G1 X148.362 Y106.435 E.01642
G1 X144.723 Y110.074 E.15829
G3 X145.212 Y110.119 I.133 J1.231 E.0152
G1 X148.896 Y106.435 E.16025
G1 X149.429 Y106.435 E.01642
G1 X145.629 Y110.235 E.1653
G3 X145.998 Y110.401 I-.226 J.993 E.0125
G1 X149.963 Y106.435 E.1725
G1 X150.497 Y106.435 E.01642
G1 X146.322 Y110.61 E.18162
G1 X146.596 Y110.87 E.01162
G1 X151.031 Y106.435 E.1929
G1 X151.565 Y106.435 E.01642
G1 X146.836 Y111.164 E.20568
G3 X147.04 Y111.494 I-.714 J.669 E.01201
G1 X151.565 Y106.969 E.19681
G1 X151.565 Y107.503 E.01642
G1 X147.198 Y111.869 E.18993
G1 X147.291 Y112.31 E.01386
G1 X151.565 Y108.037 E.18588
G1 X151.565 Y108.571 E.01642
G1 X147.308 Y112.827 E.18516
G1 X147.308 Y112.907 E.00246
G1 X147.206 Y113.412 E.01585
G1 X147.169 Y113.5 E.00293
G1 X151.734 Y108.935 E.19859
; WIPE_START
G1 F24000
G1 X150.32 Y110.349 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I-.55 J-1.086 P1  F30000
G1 X136.269 Y117.461 Z.8
G1 Z.4
G1 E.8 F1800
G1 F15000
G1 X147.294 Y106.435 E.47959
G1 X146.76 Y106.435 E.01642
G1 X136.054 Y117.141 E.46571
G1 X135.709 Y116.953 E.0121
G1 X146.226 Y106.435 E.45752
G1 X145.693 Y106.435 E.01642
G1 X135.35 Y116.778 E.44991
G2 X134.984 Y116.61 I-1.868 J3.578 E.01238
G1 X145.159 Y106.435 E.44259
G1 X144.625 Y106.435 E.01642
G1 X134.609 Y116.452 E.4357
G2 X134.22 Y116.306 I-1.65 J3.822 E.01277
G1 X144.091 Y106.435 E.42939
G1 X143.557 Y106.435 E.01642
G1 X133.823 Y116.17 E.42343
G1 X133.415 Y116.044 E.01313
G1 X143.023 Y106.435 E.41796
G1 X142.49 Y106.435 E.01642
G1 X132.992 Y115.933 E.41316
G2 X132.557 Y115.834 I-1.215 J4.301 E.01371
G1 X141.956 Y106.435 E.40883
G1 X141.422 Y106.435 E.01642
G1 X132.111 Y115.746 E.40501
G1 X131.647 Y115.676 E.01443
G1 X140.888 Y106.435 E.40197
G1 X140.354 Y106.435 E.01642
G1 X131.167 Y115.623 E.39966
G2 X130.67 Y115.586 I-.617 J4.963 E.01534
G1 X139.821 Y106.435 E.39806
G1 X139.287 Y106.435 E.01642
G1 X130.154 Y115.568 E.39728
G2 X129.616 Y115.572 I-.232 J5.387 E.01654
G1 X138.753 Y106.435 E.39744
G1 X138.219 Y106.435 E.01642
G1 X129.054 Y115.601 E.3987
G1 X128.46 Y115.66 E.01834
G1 X137.685 Y106.435 E.40128
G1 X137.151 Y106.435 E.01642
G1 X127.832 Y115.755 E.4054
G2 X127.158 Y115.895 I1.067 J6.822 E.02118
G1 X136.618 Y106.435 E.4115
G1 X136.084 Y106.435 E.01642
G1 X126.427 Y116.092 E.42008
G2 X125.621 Y116.364 I2.319 J8.206 E.02616
G1 X135.55 Y106.435 E.4319
G1 X135.016 Y106.435 E.01642
G1 X124.695 Y116.757 E.44897
G2 X123.538 Y117.38 I5.375 J11.365 E.04043
G1 X134.482 Y106.435 E.47607
G1 X133.949 Y106.435 E.01642
G1 X108.435 Y131.949 E1.10981
G1 X108.435 Y132.482 E.01642
G1 X119.371 Y121.547 E.47568
G2 X118.754 Y122.698 I12.481 J7.432 E.04017
G1 X108.435 Y133.016 E.44885
G1 X108.435 Y133.55 E.01642
G1 X118.363 Y123.622 E.43186
G2 X118.09 Y124.429 I14.791 J5.454 E.0262
G1 X108.435 Y134.084 E.41999
G1 X108.435 Y134.618 E.01642
G1 X117.898 Y125.155 E.41161
G2 X117.76 Y125.827 I6.664 J1.721 E.02111
G1 X108.435 Y135.151 E.4056
G1 X108.435 Y135.685 E.01642
G1 X117.664 Y126.456 E.40146
G2 X117.605 Y127.05 I5.917 J.897 E.01836
G1 X108.435 Y136.219 E.39886
G1 X108.435 Y136.753 E.01642
G1 X117.574 Y127.614 E.39753
M73 P59 R5
G2 X117.568 Y128.154 I5.402 J.328 E.01661
G1 X108.435 Y137.287 E.39728
G1 X108.435 Y137.821 E.01642
G1 X117.584 Y128.672 E.39795
G1 X117.621 Y129.169 E.01532
G1 X108.435 Y138.354 E.39957
G1 X108.435 Y138.888 E.01642
G1 X117.677 Y129.646 E.40202
G2 X117.748 Y130.109 I4.673 J-.48 E.01441
G1 X108.435 Y139.422 E.40511
G1 X108.435 Y139.956 E.01642
G1 X117.833 Y130.559 E.40877
G1 X117.932 Y130.993 E.01371
G1 X108.435 Y140.49 E.41309
G1 X108.435 Y141.023 E.01642
G1 X118.046 Y131.413 E.41805
G2 X118.17 Y131.823 I4.169 J-1.037 E.01318
G1 X108.435 Y141.557 E.42344
G1 X108.435 Y142.091 E.01642
G1 X118.304 Y132.222 E.42928
G2 X118.453 Y132.607 I3.93 J-1.303 E.01269
G1 X108.435 Y142.625 E.43577
G1 X108.435 Y143.159 E.01642
G1 X118.61 Y132.984 E.4426
G1 X118.776 Y133.352 E.01241
G1 X108.435 Y143.693 E.44982
G1 X108.435 Y144.226 E.01642
G1 X118.955 Y133.706 E.45761
G2 X119.141 Y134.055 I3.582 J-1.684 E.01214
G1 X108.435 Y144.76 E.46568
G1 X108.435 Y145.294 E.01642
G1 X119.336 Y134.393 E.47418
G2 X119.542 Y134.721 I3.39 J-1.896 E.01192
G1 X108.266 Y145.998 E.49051
G1 X108.266 Y131.584 F30000
G1 F15000
G1 X133.415 Y106.435 E1.09397
G1 X132.881 Y106.435 E.01642
G1 X108.435 Y130.881 E1.06337
G1 X108.435 Y130.347 E.01642
G1 X132.347 Y106.435 E1.04015
G1 X131.813 Y106.435 E.01642
G1 X108.435 Y129.813 E1.01693
G1 X108.435 Y129.279 E.01642
G1 X131.279 Y106.435 E.99371
G1 X130.746 Y106.435 E.01642
G1 X108.435 Y128.746 E.97049
G1 X108.435 Y128.212 E.01642
G1 X130.212 Y106.435 E.94727
G1 X129.678 Y106.435 E.01642
G1 X108.435 Y127.678 E.92405
G1 X108.435 Y127.144 E.01642
G1 X129.144 Y106.435 E.90083
G1 X128.61 Y106.435 E.01642
G1 X108.435 Y126.61 E.8776
G1 X108.435 Y126.077 E.01642
G1 X128.077 Y106.435 E.85438
G1 X127.543 Y106.435 E.01642
G1 X108.435 Y125.543 E.83116
G1 X108.435 Y125.009 E.01642
G1 X127.009 Y106.435 E.80794
G1 X126.475 Y106.435 E.01642
G1 X108.435 Y124.475 E.78472
G1 X108.435 Y123.941 E.01642
G1 X125.941 Y106.435 E.7615
G1 X125.407 Y106.435 E.01642
G1 X108.435 Y123.407 E.73828
G1 X108.435 Y122.874 E.01642
G1 X124.874 Y106.435 E.71506
G1 X124.34 Y106.435 E.01642
G1 X117.14 Y113.636 E.31321
G2 X117.322 Y112.92 I-1.68 J-.808 E.02287
G1 X123.806 Y106.435 E.28207
G1 X123.272 Y106.435 E.01642
G1 X117.33 Y112.377 E.25846
G1 X117.24 Y111.933 E.01393
G1 X122.738 Y106.435 E.23915
G1 X122.205 Y106.435 E.01642
G1 X117.089 Y111.551 E.22251
G2 X116.894 Y111.212 I-.936 J.313 E.0121
G1 X121.671 Y106.435 E.20777
G1 X121.137 Y106.435 E.01642
G1 X116.662 Y110.91 E.19464
G1 X116.392 Y110.646 E.01161
G1 X120.603 Y106.435 E.18317
G1 X120.069 Y106.435 E.01642
G1 X116.072 Y110.433 E.17389
G2 X115.713 Y110.258 I-.612 J.801 E.01237
G1 X119.535 Y106.435 E.16629
G1 X119.002 Y106.435 E.01642
G1 X115.305 Y110.131 E.16078
G1 X114.952 Y110.069 E.01105
G1 X114.831 Y110.072 E.00371
G1 X118.468 Y106.435 E.1582
G1 X117.934 Y106.435 E.01642
G1 X114.018 Y110.352 E.17036
G1 X112.461 Y111.908 F30000
G1 F15000
G1 X108.435 Y115.934 E.17511
G1 X108.435 Y116.468 E.01642
G1 X112.183 Y112.72 E.16304
G2 X112.242 Y113.195 I1.206 J.094 E.01484
G1 X108.435 Y117.002 E.16557
G1 X108.435 Y117.535 E.01642
G1 X112.366 Y113.604 E.171
G2 X112.539 Y113.966 I.98 J-.246 E.0124
G1 X108.435 Y118.069 E.17851
G1 X108.435 Y118.603 E.01642
G1 X112.755 Y114.283 E.18792
G1 X113.021 Y114.552 E.01161
G1 X108.435 Y119.137 E.19946
G1 X108.435 Y119.671 E.01642
G1 X113.32 Y114.786 E.21248
G1 X113.578 Y114.952 E.00944
G1 X113.657 Y114.983 E.0026
G1 X108.435 Y120.204 E.22712
G1 X108.435 Y120.738 E.01642
G1 X114.04 Y115.134 E.24379
G1 X114.49 Y115.217 E.01409
G1 X108.435 Y121.272 E.2634
G1 X108.435 Y121.806 E.01642
G1 X115.023 Y115.219 E.28654
G1 X115.582 Y115.103 E.01759
G1 X115.747 Y115.029 E.00554
G1 X108.266 Y122.509 E.32541
G1 X108.266 Y115.57 F30000
G1 F15000
G1 X117.4 Y106.435 E.39735
G1 X116.866 Y106.435 E.01642
G1 X108.435 Y114.866 E.36674
G1 X108.435 Y114.332 E.01642
G1 X116.332 Y106.435 E.34352
G1 X115.799 Y106.435 E.01642
G1 X108.435 Y113.799 E.3203
G1 X108.435 Y113.265 E.01642
G1 X115.265 Y106.435 E.29708
G1 X114.731 Y106.435 E.01642
G1 X108.435 Y112.731 E.27386
G1 X108.435 Y112.197 E.01642
G1 X114.197 Y106.435 E.25064
G1 X113.663 Y106.435 E.01642
G1 X108.435 Y111.663 E.22742
G1 X108.435 Y111.13 E.01642
G1 X113.13 Y106.435 E.2042
G1 X112.596 Y106.435 E.01642
G1 X108.435 Y110.596 E.18098
G1 X108.435 Y110.062 E.01642
G1 X112.062 Y106.435 E.15775
G1 X111.528 Y106.435 E.01642
G1 X108.435 Y109.528 E.13453
G1 X108.435 Y108.994 E.01642
G1 X110.994 Y106.435 E.11131
G1 X110.46 Y106.435 E.01642
G1 X108.435 Y108.46 E.08809
G1 X108.435 Y107.927 E.01642
G1 X109.927 Y106.435 E.06487
G1 X109.393 Y106.435 E.01642
G1 X108.435 Y107.393 E.04165
G1 X108.435 Y106.859 E.01642
G1 X109.029 Y106.266 E.02581
; CHANGE_LAYER
; Z_HEIGHT: 0.6
; LAYER_HEIGHT: 0.2
; WIPE_START
M73 P60 R5
G1 F24000
G1 X108.435 Y106.859 E-.31886
G1 X108.435 Y107.393 E-.20285
G1 X108.879 Y106.949 E-.23829
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 3/15
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
G3 Z.8 I-.562 J1.08 P1  F30000
G1 X141.369 Y123.852 Z.8
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X141.371 Y123.861 E.00032
G3 X129.698 Y115.901 I-11.371 J4.137 E2.02156
G1 X130.302 Y115.901 E.02002
G3 X141.151 Y123.299 I-.302 J12.097 E.46042
G1 X141.347 Y123.796 E.01771
G1 X141.003 Y123.995 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X129.708 Y116.294 I-11.003 J4.003 E1.81189
G1 X130.292 Y116.294 E.01794
G3 X140.982 Y123.939 I-.292 J11.705 E.42877
M204 S10000
; WIPE_START
G1 F24000
G1 X141.19 Y124.548 E-.24464
G1 X141.348 Y125.11 E-.22189
G1 X141.478 Y125.68 E-.22186
G1 X141.511 Y125.865 E-.07161
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I1.12 J.477 P1  F30000
G1 X146.611 Y113.889 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X146.593 Y113.917 E.00112
G3 X144.453 Y110.414 I-1.86 J-1.269 E.2979
G1 X144.677 Y110.398 E.00745
G3 X146.807 Y113.524 I.056 J2.251 E.14901
G1 X146.639 Y113.836 E.01176
G1 X146.282 Y113.676 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X146.269 Y113.696 E.00073
G3 X144.502 Y110.804 I-1.536 J-1.048 E.22786
G1 X144.687 Y110.79 E.0057
G3 X146.446 Y113.372 I.046 J1.859 E.11398
G1 X146.31 Y113.624 E.0088
M204 S10000
; WIPE_START
G1 F24000
G1 X146.269 Y113.696 E-.03186
G1 X146.032 Y113.981 E-.1407
G1 X145.742 Y114.212 E-.14078
G1 X145.415 Y114.38 E-.13976
G1 X145.147 Y114.463 E-.10665
G1 X144.78 Y114.509 E-.14077
G1 X144.623 Y114.498 E-.05949
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I.016 J-1.217 P1  F30000
G1 X113.041 Y114.091 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X112.899 Y113.918 E.00743
G3 X114.478 Y110.414 I1.86 J-1.269 E.15273
G1 X114.702 Y110.398 E.00745
G3 X113.187 Y114.261 I.056 J2.251 E.29418
G1 X113.08 Y114.136 E.00544
G1 X113.384 Y113.895 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X113.335 Y113.844 E.00218
G3 X114.527 Y110.804 I1.424 J-1.196 E.12252
G1 X114.712 Y110.79 E.0057
G3 X113.6 Y114.102 I.046 J1.859 E.21932
G1 X113.427 Y113.937 E.00735
M204 S10000
; WIPE_START
G1 F24000
G1 X113.335 Y113.844 E-.04978
G1 X113.125 Y113.539 E-.1407
G1 X112.981 Y113.198 E-.14078
G1 X112.907 Y112.835 E-.14076
G1 X112.907 Y112.464 E-.14077
G1 X112.98 Y112.104 E-.13977
G1 X112.987 Y112.086 E-.00744
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I-1.209 J.142 P1  F30000
G1 X116.46 Y141.729 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X116.484 Y141.754 E.00113
G3 X114.478 Y140.966 I-1.725 J1.446 E.39473
G1 X114.702 Y140.949 E.00745
G3 X116.163 Y141.44 I.056 J2.251 E.05217
G1 X116.417 Y141.688 E.01176
G1 X116.222 Y142.062 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X116.391 Y142.312 E.0093
G3 X114.527 Y141.355 I-1.633 J.888 E.29053
G1 X114.712 Y141.342 E.0057
G3 X116.183 Y142.006 I.046 J1.859 E.0513
G1 X116.187 Y142.012 E.00024
M204 S10000
; WIPE_START
G1 F24000
G1 X116.391 Y142.312 E-.13778
G1 X116.536 Y142.653 E-.14076
G1 X116.609 Y143.014 E-.14005
G1 X116.616 Y143.294 E-.10645
G1 X116.561 Y143.66 E-.14068
G1 X116.476 Y143.893 E-.09429
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I-.032 J1.217 P1  F30000
G1 X146.435 Y144.673 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X146.136 Y144.961 E.01375
G3 X144.453 Y140.966 I-1.403 J-1.761 E.27557
G1 X144.677 Y140.949 E.00745
G3 X146.474 Y144.628 I.056 J2.251 E.17048
G1 X146.167 Y144.384 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X146.157 Y144.396 E.00048
G3 X144.502 Y141.355 I-1.424 J-1.196 E.22217
G1 X144.687 Y141.342 E.0057
G3 X146.365 Y144.09 I.046 J1.859 E.11967
G1 X146.201 Y144.334 E.00906
M204 S10000
; WIPE_START
G1 F24000
G1 X146.157 Y144.396 E-.02864
G1 X145.893 Y144.656 E-.14069
G1 X145.582 Y144.857 E-.14076
G1 X145.309 Y144.97 E-.11221
G1 X144.964 Y145.047 E-.1342
G1 X144.594 Y145.056 E-.14077
G1 X144.432 Y145.028 E-.06273
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I-.665 J1.019 P1  F30000
G1 X151.898 Y149.898 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X108.102 Y149.898 E1.45279
G1 X108.102 Y106.102 E1.45279
G1 X151.898 Y106.102 E1.45279
G1 X151.898 Y149.838 E1.4508
G1 X152.29 Y150.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X107.71 Y150.29 E1.36982
G1 X107.71 Y105.71 E1.36982
G1 X152.29 Y105.71 E1.36982
G1 X152.29 Y150.23 E1.36798
M204 S10000
; WIPE_START
G1 F24000
G1 X150.29 Y150.233 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I1.107 J.505 P1  F30000
G1 X151.734 Y147.065 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.420388
G1 F15000
G1 X147.231 Y142.562 E.1959
G1 X147.308 Y142.944 E.01198
G1 X147.308 Y143.173 E.00705
G1 X151.565 Y147.429 E.18516
G1 X151.565 Y147.963 E.01642
G1 X147.266 Y143.665 E.18697
G3 X147.154 Y144.087 I-1.099 J-.067 E.01351
G1 X151.565 Y148.497 E.19185
G1 X151.565 Y149.031 E.01642
G1 X146.992 Y144.459 E.19889
G1 X146.776 Y144.776 E.01182
G1 X151.565 Y149.565 E.20831
G1 X151.031 Y149.565 E.01642
G1 X146.521 Y145.055 E.19619
G3 X146.231 Y145.299 I-.749 J-.594 E.01173
G1 X150.497 Y149.565 E.18556
G1 X149.963 Y149.565 E.01642
G1 X145.905 Y145.507 E.17651
G1 X145.527 Y145.663 E.01257
G1 X149.429 Y149.565 E.16973
G1 X148.896 Y149.565 E.01642
G1 X145.091 Y145.761 E.16547
G1 X144.578 Y145.781 E.01581
G1 X148.362 Y149.565 E.16459
G1 X147.828 Y149.565 E.01642
G1 X143.906 Y145.643 E.1706
G1 X143.553 Y145.504 E.01167
G1 X143.12 Y145.224 E.01585
G1 X142.751 Y144.865 E.01585
G1 X142.461 Y144.439 E.01585
G1 X142.285 Y144.021 E.01394
G1 X136.724 Y138.46 E.24189
G2 X137.042 Y138.245 I-1.999 J-3.298 E.01183
G1 X142.158 Y143.361 E.22255
G1 X142.158 Y142.944 E.01285
G1 X142.178 Y142.847 E.00303
G1 X137.355 Y138.024 E.20978
G1 X137.659 Y137.794 E.01172
G1 X142.273 Y142.408 E.20071
G1 X142.431 Y142.033 E.01253
G1 X137.953 Y137.555 E.19479
G2 X138.243 Y137.311 I-2.302 J-3.022 E.01166
G1 X142.637 Y141.705 E.19114
G3 X142.877 Y141.411 I.959 J.537 E.01173
G1 X138.52 Y137.054 E.18952
G2 X138.791 Y136.791 I-2.493 J-2.85 E.01162
G1 X143.161 Y141.161 E.19006
G1 X143.477 Y140.943 E.01181
G1 X139.055 Y136.521 E.19236
G2 X139.308 Y136.241 I-2.684 J-2.679 E.01163
G1 X143.845 Y140.777 E.19734
G1 X144.268 Y140.666 E.01345
G1 X139.557 Y135.955 E.20493
G1 X139.794 Y135.658 E.01168
G1 X144.76 Y140.625 E.21604
G1 X144.927 Y140.621 E.00512
G1 X145.368 Y140.699 E.01377
G1 X140.024 Y135.355 E.23246
G1 X140.247 Y135.044 E.01176
G1 X151.565 Y146.362 E.49232
G1 X151.565 Y145.828 E.01642
G1 X140.458 Y134.721 E.48313
G2 X140.664 Y134.393 I-3.185 J-2.225 E.01192
G1 X151.565 Y145.294 E.47418
G1 X151.565 Y144.76 E.01642
G1 X140.859 Y134.055 E.46568
G2 X141.045 Y133.707 I-3.397 J-2.033 E.01214
G1 X151.565 Y144.226 E.45761
G1 X151.565 Y143.693 E.01642
G1 X141.224 Y133.352 E.44982
G1 X141.39 Y132.984 E.01241
G1 X151.565 Y143.159 E.4426
G1 X151.565 Y142.625 E.01642
G1 X141.547 Y132.607 E.43577
G2 X141.696 Y132.223 I-3.779 J-1.687 E.01269
G1 X151.565 Y142.091 E.42928
G1 X151.565 Y141.557 E.01642
G1 X141.83 Y131.823 E.42344
M73 P61 R5
G2 X141.954 Y131.413 I-4.045 J-1.447 E.01318
G1 X151.565 Y141.024 E.41805
G1 X151.565 Y140.49 E.01642
G1 X142.068 Y130.993 E.41309
G1 X142.167 Y130.559 E.01371
G1 X151.565 Y139.956 E.40877
G1 X151.565 Y139.422 E.01642
G1 X142.252 Y130.109 E.40511
G2 X142.323 Y129.646 I-4.601 J-.943 E.01441
G1 X151.565 Y138.888 E.40202
G1 X151.565 Y138.354 E.01642
G1 X142.379 Y129.169 E.39957
G1 X142.416 Y128.672 E.01532
G1 X151.565 Y137.821 E.39795
G1 X151.565 Y137.287 E.01642
G1 X142.432 Y128.154 E.39728
G2 X142.426 Y127.614 I-5.41 J-.212 E.01661
G1 X151.565 Y136.753 E.39753
G1 X151.565 Y136.219 E.01642
G1 X142.395 Y127.05 E.39886
G2 X142.336 Y126.456 I-5.979 J.303 E.01836
G1 X151.565 Y135.685 E.40146
G1 X151.565 Y135.152 E.01642
G1 X142.24 Y125.827 E.4056
G2 X142.102 Y125.155 I-6.802 J1.049 E.02111
G1 X151.565 Y134.618 E.41161
G1 X151.565 Y134.084 E.01642
G1 X141.91 Y124.429 E.41999
G2 X141.637 Y123.622 I-15.063 J4.646 E.0262
G1 X151.565 Y133.55 E.43186
G1 X151.565 Y133.016 E.01642
G1 X141.246 Y122.698 E.44884
G2 X140.629 Y121.547 I-13.093 J6.278 E.04017
G1 X151.734 Y132.652 E.48306
G1 X151.734 Y123.577 F30000
G1 F15000
G1 X134.593 Y106.435 E.74566
G1 X134.059 Y106.435 E.01642
G1 X151.565 Y123.941 E.7615
G1 X151.565 Y124.475 E.01642
G1 X133.525 Y106.435 E.78472
G1 X132.991 Y106.435 E.01642
G1 X151.565 Y125.009 E.80794
G1 X151.565 Y125.543 E.01642
G1 X132.457 Y106.435 E.83117
G1 X131.923 Y106.435 E.01642
G1 X151.565 Y126.077 E.85439
G1 X151.565 Y126.61 E.01642
G1 X131.39 Y106.435 E.87761
G1 X130.856 Y106.435 E.01642
G1 X151.565 Y127.144 E.90083
G1 X151.565 Y127.678 E.01642
G1 X130.322 Y106.435 E.92405
G1 X129.788 Y106.435 E.01642
G1 X151.565 Y128.212 E.94727
G1 X151.565 Y128.746 E.01642
G1 X129.254 Y106.435 E.97049
G1 X128.72 Y106.435 E.01642
G1 X151.565 Y129.28 E.99371
G1 X151.565 Y129.813 E.01642
G1 X128.187 Y106.435 E1.01693
G1 X127.653 Y106.435 E.01642
G1 X151.565 Y130.347 E1.04015
G1 X151.565 Y130.881 E.01642
G1 X127.119 Y106.435 E1.06338
G1 X126.585 Y106.435 E.01642
G1 X151.565 Y131.415 E1.0866
G1 X151.565 Y131.949 E.01642
G1 X126.051 Y106.435 E1.10982
G1 X125.518 Y106.435 E.01642
G1 X136.462 Y117.379 E.47606
G2 X135.305 Y116.756 I-6.532 J10.743 E.04043
G1 X124.984 Y106.435 E.44896
G1 X124.45 Y106.435 E.01642
G1 X134.379 Y116.364 E.4319
G2 X133.573 Y116.092 I-3.124 J7.934 E.02616
G1 X123.916 Y106.435 E.42008
G1 X123.382 Y106.435 E.01642
G1 X132.842 Y115.895 E.4115
G2 X132.168 Y115.755 I-1.741 J6.682 E.02118
G1 X122.848 Y106.435 E.4054
G1 X122.315 Y106.435 E.01642
G1 X131.539 Y115.66 E.40128
G1 X130.946 Y115.601 E.01834
G1 X121.781 Y106.435 E.3987
G1 X121.247 Y106.435 E.01642
G1 X130.384 Y115.572 E.39744
G2 X129.846 Y115.568 I-.306 J5.383 E.01654
G1 X120.713 Y106.435 E.39728
G1 X120.179 Y106.435 E.01642
G1 X129.33 Y115.586 E.39806
G2 X128.833 Y115.623 I.119 J4.999 E.01534
G1 X119.646 Y106.435 E.39966
G1 X119.112 Y106.435 E.01642
G1 X128.352 Y115.676 E.40197
G1 X127.889 Y115.746 E.01443
G1 X118.578 Y106.435 E.40501
G1 X118.044 Y106.435 E.01642
G1 X127.442 Y115.834 E.40883
G2 X127.008 Y115.933 I.78 J4.4 E.01371
G1 X117.51 Y106.435 E.41316
G1 X116.976 Y106.435 E.01642
G1 X126.585 Y116.044 E.41796
G1 X126.177 Y116.17 E.01313
G1 X116.443 Y106.435 E.42343
M73 P61 R4
G1 X115.909 Y106.435 E.01642
G1 X125.78 Y116.306 E.42939
G2 X125.391 Y116.452 I1.26 J3.965 E.01277
G1 X115.375 Y106.435 E.4357
G1 X114.841 Y106.435 E.01642
G1 X125.016 Y116.61 E.44259
G2 X124.65 Y116.778 I1.503 J3.747 E.01238
G1 X114.307 Y106.435 E.44991
G1 X113.774 Y106.435 E.01642
G1 X124.291 Y116.953 E.45752
G1 X123.946 Y117.141 E.0121
G1 X113.24 Y106.435 E.46571
G1 X112.706 Y106.435 E.01642
G1 X123.608 Y117.337 E.47422
G1 X123.276 Y117.54 E.01194
G1 X112.172 Y106.435 E.48303
G1 X111.638 Y106.435 E.01642
G1 X115.341 Y110.138 E.16105
G1 X114.952 Y110.069 E.01215
G1 X114.743 Y110.074 E.00641
G1 X111.104 Y106.435 E.15829
G1 X110.571 Y106.435 E.01642
G1 X114.258 Y110.123 E.1604
G1 X113.934 Y110.197 E.01022
G1 X113.84 Y110.239 E.00316
G1 X110.037 Y106.435 E.16545
G1 X109.503 Y106.435 E.01642
G1 X113.473 Y110.405 E.17267
G1 X113.161 Y110.627 E.01177
G1 X108.969 Y106.435 E.18233
G1 X108.435 Y106.435 E.01642
G1 X112.884 Y110.884 E.19351
G2 X112.642 Y111.175 I.6 J.745 E.01174
G1 X108.435 Y106.969 E.18297
G1 X108.435 Y107.503 E.01642
G1 X112.439 Y111.507 E.17416
G1 X112.287 Y111.888 E.01264
G1 X108.435 Y108.037 E.16754
G1 X108.435 Y108.571 E.01642
G1 X112.196 Y112.331 E.16357
G1 X112.183 Y112.853 E.01605
G1 X108.435 Y109.104 E.16304
G1 X108.435 Y109.638 E.01642
G1 X112.341 Y113.544 E.16989
G1 X112.486 Y113.887 E.01146
G1 X112.776 Y114.313 E.01585
G1 X113.145 Y114.673 E.01585
G1 X113.578 Y114.952 E.01585
G1 X113.86 Y115.063 E.00934
G1 X119.753 Y120.956 E.25633
G1 X119.976 Y120.645 E.01176
G1 X114.56 Y115.229 E.2356
G1 X115.082 Y115.217 E.01604
G1 X120.206 Y120.342 E.22293
G1 X120.443 Y120.045 E.01168
G1 X115.516 Y115.118 E.21432
M73 P62 R4
G1 X115.894 Y114.962 E.01258
G1 X120.692 Y119.759 E.20869
G3 X120.945 Y119.479 I2.937 J2.398 E.01163
G1 X116.229 Y114.763 E.20513
G2 X116.528 Y114.528 I-.433 J-.856 E.01177
G1 X121.209 Y119.209 E.20361
G3 X121.48 Y118.946 I2.764 J2.588 E.01162
G1 X116.785 Y114.251 E.20424
G1 X116.995 Y113.927 E.01187
G1 X121.757 Y118.689 E.20714
G3 X122.047 Y118.445 I2.59 J2.777 E.01166
G1 X117.166 Y113.564 E.21232
G2 X117.287 Y113.151 I-.961 J-.506 E.01332
G1 X122.341 Y118.206 E.21986
G1 X122.645 Y117.976 E.01172
G1 X117.339 Y112.67 E.23079
G2 X117.267 Y112.064 I-1.766 J-.097 E.01887
G1 X123.08 Y117.877 E.25286
G1 X119.665 Y121.401 F30000
G1 F15000
G1 X108.435 Y110.172 E.48847
G1 X108.435 Y110.706 E.01642
G1 X119.336 Y121.607 E.47418
G1 X119.141 Y121.945 E.01202
G1 X108.435 Y111.24 E.46568
G1 X108.435 Y111.774 E.01642
G1 X118.955 Y122.294 E.45761
G2 X118.776 Y122.648 I3.463 J1.972 E.01223
G1 X108.435 Y112.307 E.44982
G1 X108.435 Y112.841 E.01642
G1 X118.61 Y123.016 E.4426
G2 X118.453 Y123.393 I3.697 J1.76 E.01256
G1 X108.435 Y113.375 E.43577
G1 X108.435 Y113.909 E.01642
G1 X118.304 Y123.778 E.42928
G1 X118.17 Y124.177 E.01297
G1 X108.435 Y114.443 E.42344
G1 X108.435 Y114.977 E.01642
G1 X118.046 Y124.587 E.41805
G2 X117.932 Y125.007 I4.147 J1.353 E.01338
G1 X108.435 Y115.51 E.41309
G1 X108.435 Y116.044 E.01642
G1 X117.833 Y125.441 E.40877
G2 X117.748 Y125.891 I4.462 J1.068 E.01408
G1 X108.435 Y116.578 E.40511
G1 X108.435 Y117.112 E.01642
G1 X117.677 Y126.354 E.40202
G2 X117.621 Y126.831 I4.756 J.803 E.01479
G1 X108.435 Y117.646 E.39957
G1 X108.435 Y118.179 E.01642
G1 X117.584 Y127.328 E.39795
G2 X117.568 Y127.846 I5.187 J.415 E.01596
G1 X108.435 Y118.713 E.39728
G1 X108.435 Y119.247 E.01642
G1 X117.574 Y128.386 E.39753
G2 X117.605 Y128.95 I5.67 J-.024 E.01739
G1 X108.435 Y119.781 E.39886
G1 X108.435 Y120.315 E.01642
G1 X117.664 Y129.544 E.40146
G2 X117.76 Y130.173 I6.349 J-.638 E.01957
G1 X108.435 Y120.849 E.4056
G1 X108.435 Y121.382 E.01642
G1 X117.898 Y130.845 E.41161
G2 X118.09 Y131.571 I7.372 J-1.565 E.02312
G1 X108.435 Y121.916 E.41999
G1 X108.435 Y122.45 E.01642
G1 X118.363 Y132.378 E.43186
G2 X118.754 Y133.302 I9.455 J-3.45 E.03088
G1 X108.435 Y122.984 E.44885
G1 X108.435 Y123.518 E.01642
G1 X119.371 Y134.453 E.47568
G2 X123.538 Y138.62 I10.665 J-6.497 E.18301
G1 X134.482 Y149.565 E.47607
G1 X135.016 Y149.565 E.01642
G1 X124.695 Y139.243 E.44897
G2 X125.621 Y139.636 I5.596 J-11.92 E.03095
G1 X135.55 Y149.565 E.4319
G1 X136.084 Y149.565 E.01642
G1 X126.427 Y139.908 E.42008
G2 X127.158 Y140.105 I2.341 J-7.225 E.0233
G1 X136.618 Y149.565 E.4115
G1 X137.151 Y149.565 E.01642
G1 X127.832 Y140.245 E.4054
G2 X128.46 Y140.34 I19.592 J-127.706 E.01956
G1 X137.685 Y149.565 E.40128
G1 X138.219 Y149.565 E.01642
G1 X129.054 Y140.399 E.3987
G2 X129.616 Y140.428 I.571 J-5.624 E.01734
G1 X138.753 Y149.565 E.39744
G1 X139.287 Y149.565 E.01642
G1 X130.154 Y140.432 E.39728
G2 X130.67 Y140.414 I.078 J-5.176 E.01588
G1 X139.821 Y149.565 E.39806
G1 X140.354 Y149.565 E.01642
G1 X131.167 Y140.377 E.39966
G2 X131.647 Y140.324 I-.293 J-4.841 E.01488
G1 X140.888 Y149.565 E.40197
G1 X141.422 Y149.565 E.01642
G1 X132.111 Y140.254 E.40501
G2 X132.557 Y140.166 I-.655 J-4.512 E.01399
G1 X141.956 Y149.565 E.40883
G1 X142.49 Y149.565 E.01642
G1 X132.992 Y140.067 E.41316
G2 X133.415 Y139.956 I-.894 J-4.298 E.01347
G1 X143.023 Y149.565 E.41796
G1 X143.557 Y149.565 E.01642
G1 X133.823 Y139.83 E.42343
G2 X134.22 Y139.694 I-1.173 J-4.045 E.01292
G1 X144.091 Y149.565 E.42939
G1 X144.625 Y149.565 E.01642
G1 X134.609 Y139.548 E.4357
G1 X134.984 Y139.39 E.01253
G1 X145.159 Y149.565 E.44259
G1 X145.693 Y149.565 E.01642
G1 X135.35 Y139.222 E.44991
G2 X135.709 Y139.047 I-1.574 J-3.683 E.01228
G1 X146.226 Y149.565 E.45752
G1 X146.76 Y149.565 E.01642
G1 X136.054 Y138.859 E.46571
G2 X136.392 Y138.663 I-1.792 J-3.485 E.01202
G1 X147.464 Y149.734 E.4816
G1 X134.118 Y149.734 F30000
G1 F15000
G1 X108.435 Y124.051 E1.1172
G1 X108.435 Y124.585 E.01642
G1 X133.415 Y149.565 E1.08659
G1 X132.881 Y149.565 E.01642
G1 X108.435 Y125.119 E1.06337
G1 X108.435 Y125.653 E.01642
G1 X132.347 Y149.565 E1.04015
G1 X131.813 Y149.565 E.01642
G1 X108.435 Y126.187 E1.01693
G1 X108.435 Y126.721 E.01642
G1 X131.279 Y149.565 E.99371
G1 X130.746 Y149.565 E.01642
G1 X108.435 Y127.254 E.97049
G1 X108.435 Y127.788 E.01642
G1 X130.212 Y149.565 E.94727
G1 X129.678 Y149.565 E.01642
G1 X108.435 Y128.322 E.92405
G1 X108.435 Y128.856 E.01642
G1 X129.144 Y149.565 E.90083
G1 X128.61 Y149.565 E.01642
G1 X108.435 Y129.39 E.8776
G1 X108.435 Y129.923 E.01642
G1 X128.077 Y149.565 E.85438
G1 X127.543 Y149.565 E.01642
G1 X108.435 Y130.457 E.83116
G1 X108.435 Y130.991 E.01642
G1 X127.009 Y149.565 E.80794
G1 X126.475 Y149.565 E.01642
G1 X108.435 Y131.525 E.78472
G1 X108.435 Y132.059 E.01642
G1 X125.941 Y149.565 E.7615
G1 X125.407 Y149.565 E.01642
G1 X108.435 Y132.593 E.73828
G1 X108.435 Y133.126 E.01642
G1 X124.874 Y149.565 E.71506
G1 X124.34 Y149.565 E.01642
G1 X117.235 Y142.46 E.30903
G1 X117.331 Y142.934 E.01486
G1 X117.336 Y143.094 E.00494
G1 X123.806 Y149.565 E.28145
G1 X123.272 Y149.565 E.01642
G1 X117.303 Y143.595 E.25966
G3 X117.199 Y144.025 I-1.115 J-.043 E.01369
G1 X122.738 Y149.565 E.24097
G1 X122.204 Y149.565 E.01642
G1 X117.042 Y144.402 E.22457
G1 X116.84 Y144.734 E.01194
G1 X121.671 Y149.565 E.21015
G1 X121.137 Y149.565 E.01642
G1 X116.588 Y145.015 E.19789
G3 X116.301 Y145.263 I-.756 J-.584 E.01172
G1 X120.603 Y149.565 E.18712
G1 X120.069 Y149.565 E.01642
G1 X115.98 Y145.475 E.1779
G1 X115.612 Y145.641 E.01241
G1 X119.535 Y149.565 E.17068
G1 X119.002 Y149.565 E.01642
G1 X115.182 Y145.746 E.16613
G1 X115.08 Y145.769 E.00323
G1 X114.682 Y145.779 E.01225
G1 X118.468 Y149.565 E.16468
G1 X117.934 Y149.565 E.01642
M73 P63 R4
G1 X114.062 Y145.693 E.16841
G1 X113.578 Y145.504 E.01601
G1 X113.145 Y145.224 E.01585
G1 X112.776 Y144.865 E.01585
G1 X112.486 Y144.439 E.01585
G1 X112.273 Y143.904 E.0177
G1 X108.435 Y140.066 E.16695
G1 X108.435 Y139.532 E.01642
G1 X112.183 Y143.28 E.16304
G3 X112.216 Y142.78 I1.261 J-.168 E.01554
G1 X108.435 Y138.998 E.16448
G1 X108.435 Y138.465 E.01642
G1 X112.321 Y142.351 E.16905
G3 X112.486 Y141.981 I1.113 J.275 E.0125
G1 X108.435 Y137.931 E.1762
G1 X108.435 Y137.397 E.01642
G1 X112.689 Y141.65 E.18501
G1 X112.944 Y141.371 E.01162
G1 X108.435 Y136.863 E.19611
G1 X108.435 Y136.329 E.01642
G1 X113.233 Y141.127 E.20869
G3 X113.558 Y140.918 I.679 J.7 E.01196
G1 X108.435 Y135.796 E.22283
G1 X108.435 Y135.262 E.01642
G1 X113.926 Y140.752 E.23883
G1 X114.359 Y140.651 E.01368
G1 X108.435 Y134.728 E.25767
G1 X108.435 Y134.194 E.01642
G1 X114.864 Y140.623 E.27965
G1 X114.952 Y140.621 E.00269
G1 X115.502 Y140.727 E.01725
G1 X108.266 Y133.491 E.31479
G1 X108.266 Y148.971 F30000
G1 F15000
G1 X108.859 Y149.565 E.02581
G1 X109.393 Y149.565 E.01642
G1 X108.435 Y148.607 E.04165
G1 X108.435 Y148.073 E.01642
G1 X109.927 Y149.565 E.06487
G1 X110.46 Y149.565 E.01642
G1 X108.435 Y147.54 E.08809
G1 X108.435 Y147.006 E.01642
G1 X110.994 Y149.565 E.11131
G1 X111.528 Y149.565 E.01642
G1 X108.435 Y146.472 E.13453
G1 X108.435 Y145.938 E.01642
G1 X112.062 Y149.565 E.15775
G1 X112.596 Y149.565 E.01642
G1 X108.435 Y145.404 E.18098
G1 X108.435 Y144.87 E.01642
G1 X113.13 Y149.565 E.2042
G1 X113.663 Y149.565 E.01642
G1 X108.435 Y144.337 E.22742
G1 X108.435 Y143.803 E.01642
G1 X114.197 Y149.565 E.25064
G1 X114.731 Y149.565 E.01642
G1 X108.435 Y143.269 E.27386
G1 X108.435 Y142.735 E.01642
G1 X115.265 Y149.565 E.29708
G1 X115.799 Y149.565 E.01642
G1 X108.435 Y142.201 E.3203
G1 X108.435 Y141.668 E.01642
G1 X116.332 Y149.565 E.34352
G1 X116.866 Y149.565 E.01642
G1 X108.435 Y141.134 E.36674
G1 X108.435 Y140.6 E.01642
G1 X117.57 Y149.734 E.39735
; WIPE_START
G1 F24000
G1 X116.156 Y148.32 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I1.044 J.626 P1  F30000
G1 X141.362 Y106.266 Z1
G1 Z.6
G1 E.8 F1800
G1 F15000
G1 X145.217 Y110.12 E.16768
G2 X144.639 Y110.076 I-.398 J1.407 E.01795
G1 X140.998 Y106.435 E.15838
G1 X140.465 Y106.435 E.01642
G1 X144.167 Y110.138 E.16105
G2 X143.759 Y110.264 I.109 J1.071 E.01321
G1 X139.931 Y106.435 E.16655
G1 X139.397 Y106.435 E.01642
G1 X143.399 Y110.437 E.17409
G1 X143.088 Y110.661 E.01176
G1 X138.863 Y106.435 E.1838
G1 X138.329 Y106.435 E.01642
G1 X142.816 Y110.922 E.19515
G2 X142.587 Y111.227 I.756 J.805 E.01179
G1 X137.795 Y106.435 E.20842
G1 X137.262 Y106.435 E.01642
G1 X142.395 Y111.568 E.22328
G1 X142.247 Y111.954 E.01271
G1 X136.728 Y106.435 E.24007
G1 X136.194 Y106.435 E.01642
G1 X142.158 Y112.4 E.25944
G1 X142.165 Y112.94 E.01663
G1 X135.66 Y106.435 E.28295
G1 X135.126 Y106.435 E.01642
G1 X142.375 Y113.684 E.31531
G1 X142.461 Y113.887 E.00679
G1 X142.751 Y114.313 E.01585
G1 X143.12 Y114.673 E.01585
G1 X143.553 Y114.952 E.01585
G1 X143.702 Y115.011 E.00494
G1 X151.565 Y122.874 E.34202
G1 X151.565 Y122.34 E.01642
G1 X144.437 Y115.212 E.31006
G1 X144.54 Y115.23 E.00322
G1 X144.978 Y115.219 E.01348
G1 X151.565 Y121.806 E.28652
G1 X151.565 Y121.272 E.01642
G1 X145.425 Y115.133 E.26705
G2 X145.818 Y114.992 I-.209 J-1.196 E.0129
G1 X151.565 Y120.738 E.24998
G1 X151.565 Y120.205 E.01642
G1 X146.156 Y114.796 E.23527
G2 X146.458 Y114.564 I-.422 J-.863 E.01179
G1 X151.565 Y119.671 E.22214
G1 X151.565 Y119.137 E.01642
G1 X146.726 Y114.298 E.21049
G1 X146.942 Y113.981 E.01182
G1 X151.565 Y118.603 E.20108
G1 X151.565 Y118.069 E.01642
G1 X147.118 Y113.622 E.19345
G2 X147.246 Y113.216 I-.94 J-.52 E.01317
G1 X151.565 Y117.535 E.18788
G1 X151.565 Y117.002 E.01642
G1 X147.308 Y112.745 E.18516
G2 X147.262 Y112.165 I-1.456 J-.177 E.018
G1 X151.565 Y116.468 E.18715
G1 X151.565 Y115.934 E.01642
G1 X142.066 Y106.435 E.41319
G1 X142.6 Y106.435 E.01642
G1 X151.565 Y115.4 E.38997
G1 X151.565 Y114.866 E.01642
G1 X143.134 Y106.435 E.36675
G1 X143.667 Y106.435 E.01642
G1 X151.565 Y114.333 E.34353
G1 X151.565 Y113.799 E.01642
G1 X144.201 Y106.435 E.3203
G1 X144.735 Y106.435 E.01642
G1 X151.565 Y113.265 E.29708
G1 X151.565 Y112.731 E.01642
G1 X145.269 Y106.435 E.27386
G1 X145.803 Y106.435 E.01642
G1 X151.565 Y112.197 E.25064
G1 X151.565 Y111.663 E.01642
G1 X146.337 Y106.435 E.22742
G1 X146.87 Y106.435 E.01642
G1 X151.565 Y111.13 E.2042
G1 X151.565 Y110.596 E.01642
G1 X147.404 Y106.435 E.18098
G1 X147.938 Y106.435 E.01642
G1 X151.565 Y110.062 E.15776
G1 X151.565 Y109.528 E.01642
G1 X148.472 Y106.435 E.13454
G1 X149.006 Y106.435 E.01642
G1 X151.565 Y108.994 E.11132
G1 X151.565 Y108.461 E.01642
G1 X149.539 Y106.435 E.08809
G1 X150.073 Y106.435 E.01642
G1 X151.565 Y107.927 E.06487
G1 X151.565 Y107.393 E.01642
G1 X150.607 Y106.435 E.04165
G1 X151.141 Y106.435 E.01642
G1 X151.734 Y107.029 E.02581
M106 S252.45
; CHANGE_LAYER
; Z_HEIGHT: 0.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X151.141 Y106.435 E-.3189
G1 X150.607 Y106.435 E-.20285
G1 X151.05 Y106.879 E-.23825
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 4/15
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
G3 Z1 I-1.057 J-.603 P1  F30000
G1 X141.369 Y123.852 Z1
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9912
G1 X141.371 Y123.861 E.00032
G3 X129.698 Y115.901 I-11.371 J4.137 E2.02156
G1 X130.302 Y115.901 E.02002
G3 X141.151 Y123.299 I-.302 J12.097 E.46042
G1 X141.347 Y123.796 E.01771
G1 X141.003 Y123.995 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9912
G3 X129.708 Y116.294 I-11.003 J4.003 E1.81189
G1 X130.292 Y116.294 E.01794
G3 X140.982 Y123.939 I-.292 J11.705 E.42877
M204 S10000
; WIPE_START
G1 F24000
G1 X141.19 Y124.548 E-.24465
G1 X141.348 Y125.11 E-.22188
G1 X141.478 Y125.68 E-.22186
G1 X141.511 Y125.865 E-.07161
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I1.119 J.477 P1  F30000
G1 X146.635 Y113.851 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9912
G1 X146.383 Y114.18 E.01375
G3 X144.453 Y110.414 I-1.65 J-1.532 E.28673
G1 X144.677 Y110.398 E.00745
G3 X146.667 Y113.801 I.056 J2.251 E.15931
G1 X146.288 Y113.663 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9912
G1 X146.095 Y113.914 E.0097
G3 X144.502 Y110.804 I-1.362 J-1.265 E.21932
G1 X144.687 Y110.79 E.0057
G3 X146.322 Y113.614 I.046 J1.859 E.12234
M204 S10000
; WIPE_START
G1 F24000
G1 X146.095 Y113.914 E-.14276
G1 X145.819 Y114.16 E-.14069
G1 X145.498 Y114.345 E-.14077
G1 X145.147 Y114.463 E-.14077
G1 X144.78 Y114.509 E-.14077
G1 X144.637 Y114.499 E-.05424
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I.015 J-1.217 P1  F30000
G1 X113.057 Y114.121 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9912
G1 X113.034 Y114.096 E.00112
M73 P64 R4
G3 X114.478 Y110.414 I1.724 J-1.448 E.16018
G1 X114.702 Y110.398 E.00745
G3 X113.355 Y114.409 I.056 J2.251 E.28673
G1 X113.1 Y114.163 E.01176
G1 X113.397 Y113.908 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9912
G1 X113.335 Y113.844 E.00273
G3 X114.527 Y110.804 I1.424 J-1.196 E.12252
G1 X114.712 Y110.79 E.0057
G3 X113.6 Y114.102 I.046 J1.859 E.21932
G1 X113.44 Y113.949 E.0068
M204 S10000
; WIPE_START
G1 F24000
G1 X113.335 Y113.844 E-.05658
G1 X113.125 Y113.539 E-.14071
G1 X112.981 Y113.198 E-.14076
G1 X112.908 Y112.836 E-.14016
G1 X112.9 Y112.557 E-.1064
G1 X112.956 Y112.191 E-.14063
G1 X112.987 Y112.105 E-.03476
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I-1.209 J.142 P1  F30000
G1 X116.46 Y141.729 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9912
G1 X116.484 Y141.754 E.00112
G3 X114.478 Y140.966 I-1.725 J1.446 E.39473
G1 X114.702 Y140.949 E.00745
G3 X116.163 Y141.44 I.056 J2.251 E.05217
G1 X116.417 Y141.688 E.01176
G1 X116.209 Y142.044 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9912
G1 X116.391 Y142.312 E.00996
G3 X114.527 Y141.355 I-1.633 J.888 E.29053
G1 X114.712 Y141.342 E.0057
G3 X116.174 Y141.995 I.046 J1.859 E.05088
M204 S10000
; WIPE_START
G1 F24000
G1 X116.391 Y142.312 E-.14596
G1 X116.536 Y142.653 E-.14074
G1 X116.609 Y143.014 E-.14016
G1 X116.616 Y143.294 E-.1064
G1 X116.561 Y143.66 E-.14064
G1 X116.484 Y143.873 E-.08612
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I-.027 J1.217 P1  F30000
G1 X146.547 Y144.533 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9912
G1 X146.527 Y144.56 E.00112
G3 X144.453 Y140.966 I-1.794 J-1.36 E.29418
G1 X144.677 Y140.949 E.00745
G3 X146.761 Y144.178 I.056 J2.251 E.15273
G1 X146.578 Y144.481 E.01176
G1 X146.173 Y144.371 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9912
G1 X145.963 Y144.594 E.00943
G3 X144.502 Y141.355 I-1.23 J-1.394 E.21362
G1 X144.687 Y141.342 E.0057
G3 X146.215 Y144.323 I.046 J1.859 E.12821
G1 X146.212 Y144.326 E.0001
M204 S10000
; WIPE_START
G1 F24000
G1 X145.963 Y144.594 E-.13936
G1 X145.663 Y144.812 E-.14069
G1 X145.326 Y144.965 E-.14077
G1 X144.964 Y145.047 E-.14077
G1 X144.594 Y145.056 E-.14077
G1 X144.445 Y145.03 E-.05764
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I-.665 J1.019 P1  F30000
G1 X151.898 Y149.898 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9912
G1 X108.102 Y149.898 E1.45279
G1 X108.102 Y106.102 E1.45279
G1 X151.898 Y106.102 E1.45279
G1 X151.898 Y149.838 E1.4508
G1 X152.29 Y150.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9912
G1 X107.71 Y150.29 E1.36982
G1 X107.71 Y105.71 E1.36982
G1 X152.29 Y105.71 E1.36982
G1 X152.29 Y150.23 E1.36798
M204 S10000
; WIPE_START
G1 F24000
G1 X150.29 Y150.233 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I1.071 J-.578 P1  F30000
G1 X149.921 Y149.55 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F9912
G1 X151.55 Y149.55 E.05401
G1 X146.791 Y144.791 E.22323
G2 X146.909 Y141.795 I-2.025 J-1.58 E.10621
G1 X151.55 Y137.154 E.21771
G1 X151.55 Y134.198 E.09807
G1 X141.982 Y124.63 E.44885
G2 X141.759 Y123.917 I-7.252 J1.879 E.02478
G1 X151.55 Y114.126 E.45931
G1 X151.55 Y111.17 E.09807
G1 X146.83 Y106.45 E.2214
G1 X143.874 Y106.45 E.09807
G1 X134.083 Y116.241 E.45928
G2 X133.365 Y116.013 I-7.686 J22.996 E.02501
G1 X123.802 Y106.45 E.4486
G1 X120.846 Y106.45 E.09807
G1 X116.533 Y110.763 E.20231
G3 X116.539 Y114.539 I-1.77 J1.89 E.14034
G1 X121.198 Y119.198 E.21859
G2 X120.124 Y120.421 I9.368 J9.312 E.05401
G1 X108.45 Y124.893 F30000
G1 F9912
G1 X108.45 Y126.522 E.05401
G1 X128.522 Y106.45 E.94159
G1 X131.478 Y106.45 E.09807
G1 X151.55 Y126.522 E.94159
G1 X151.55 Y129.478 E.09807
G1 X131.478 Y149.55 E.94159
G1 X128.522 Y149.55 E.09807
G1 X108.45 Y129.478 E.94159
G1 X108.45 Y131.107 E.05401
G1 X120.124 Y135.579 F30000
G1 F9912
G2 X121.198 Y136.802 I10.443 J-8.09 E.05401
G1 X116.61 Y141.39 E.21523
G2 X112.8 Y141.504 I-1.852 J1.815 E.14204
G1 X108.45 Y137.154 E.20406
G1 X108.45 Y134.198 E.09807
G1 X118.018 Y124.63 E.44885
G3 X118.241 Y123.917 I7.251 J1.878 E.02478
G1 X108.45 Y114.126 E.45931
G1 X108.45 Y111.17 E.09807
G1 X113.17 Y106.45 E.2214
G1 X116.126 Y106.45 E.09807
G1 X125.917 Y116.241 E.45928
G3 X126.635 Y116.013 I7.685 J22.994 E.02501
G1 X136.198 Y106.45 E.4486
G1 X139.154 Y106.45 E.09807
G1 X143.238 Y110.535 E.1916
G2 X143.235 Y114.765 I1.498 J2.117 E.16413
G1 X138.802 Y119.198 E.20796
G3 X139.876 Y120.421 I-9.369 J9.312 E.05401
; WIPE_START
G1 F24000
G1 X138.802 Y119.198 E-.61829
G1 X139.066 Y118.934 E-.14171
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I-1.216 J.059 P1  F30000
G1 X139.876 Y135.579 Z1.2
G1 Z.8
G1 E.8 F1800
G1 F9912
G3 X138.802 Y136.802 I-10.443 J-8.09 E.05401
G1 X143.15 Y141.15 E.20397
G2 X143.327 Y145.376 I1.585 J2.05 E.16415
G1 X139.154 Y149.55 E.19577
G1 X136.198 Y149.55 E.09807
G1 X126.635 Y139.987 E.4486
G3 X125.917 Y139.759 I6.966 J-23.219 E.02501
G1 X116.126 Y149.55 E.45928
G1 X113.17 Y149.55 E.09807
G1 X108.45 Y144.83 E.2214
G1 X108.45 Y141.874 E.09807
G1 X118.241 Y132.083 E.45931
G3 X118.018 Y131.37 I7.028 J-2.591 E.02478
G1 X108.45 Y121.802 E.44885
G1 X108.45 Y118.846 E.09807
G1 X112.87 Y114.426 E.20735
G3 X112.873 Y110.873 I1.876 J-1.775 E.12995
G1 X108.45 Y106.45 E.20749
G1 X110.079 Y106.45 E.05401
G1 X149.921 Y106.45 F30000
G1 F9912
M73 P65 R4
G1 X151.55 Y106.45 E.05401
G1 X146.847 Y111.153 E.2206
G3 X146.852 Y114.149 I-2.106 J1.502 E.10599
G1 X151.55 Y118.846 E.22036
G1 X151.55 Y121.802 E.09807
G1 X141.982 Y131.37 E.44885
G3 X141.759 Y132.083 I-7.253 J-1.879 E.02478
G1 X151.55 Y141.874 E.45931
G1 X151.55 Y144.83 E.09807
G1 X146.83 Y149.55 E.2214
G1 X143.874 Y149.55 E.09807
G1 X134.083 Y139.759 E.45928
G3 X133.365 Y139.987 I-7.684 J-22.991 E.02501
G1 X123.802 Y149.55 E.4486
G1 X120.846 Y149.55 E.09807
G1 X116.462 Y145.166 E.20564
G3 X112.947 Y145.053 I-1.697 J-1.941 E.12837
G1 X108.45 Y149.55 E.21096
G1 X110.079 Y149.55 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X108.45 Y149.55 E-.61876
G1 X108.713 Y149.287 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 5/15
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
G3 Z1.2 I.748 J.96 P1  F30000
G1 X141.369 Y123.852 Z1.2
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9977
G1 X141.371 Y123.861 E.00032
G3 X129.698 Y115.901 I-11.371 J4.137 E2.02156
G1 X130.302 Y115.901 E.02002
G3 X141.151 Y123.299 I-.302 J12.097 E.46042
G1 X141.347 Y123.796 E.01771
G1 X141.003 Y123.995 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9977
G3 X129.708 Y116.294 I-11.003 J4.003 E1.81189
G1 X130.292 Y116.294 E.01794
G3 X140.982 Y123.939 I-.292 J11.705 E.42877
M204 S10000
; WIPE_START
G1 F24000
G1 X141.19 Y124.548 E-.24464
G1 X141.348 Y125.11 E-.22189
G1 X141.478 Y125.68 E-.22186
G1 X141.511 Y125.865 E-.07161
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I1.119 J.477 P1  F30000
G1 X146.635 Y113.851 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9977
G1 X146.383 Y114.18 E.01375
G3 X144.453 Y110.414 I-1.65 J-1.532 E.28673
G1 X144.677 Y110.398 E.00745
G3 X146.667 Y113.801 I.056 J2.251 E.15931
G1 X146.29 Y113.66 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9977
G1 X146.095 Y113.914 E.00981
G3 X144.502 Y110.804 I-1.362 J-1.265 E.21932
G1 X144.687 Y110.79 E.0057
G3 X146.324 Y113.611 I.046 J1.859 E.12223
M204 S10000
; WIPE_START
G1 F24000
G1 X146.095 Y113.914 E-.14412
G1 X145.819 Y114.16 E-.14069
G1 X145.498 Y114.345 E-.14077
G1 X145.147 Y114.463 E-.14077
G1 X144.78 Y114.509 E-.14077
G1 X144.641 Y114.499 E-.05288
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I.017 J-1.217 P1  F30000
G1 X113.013 Y114.07 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9977
G1 X112.782 Y113.726 E.01375
G3 X114.478 Y110.414 I1.977 J-1.078 E.14529
G1 X114.702 Y110.398 E.00745
G3 X113.051 Y114.116 I.056 J2.251 E.30075
G1 X113.413 Y113.923 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9977
G1 X113.335 Y113.844 E.0034
G3 X114.527 Y110.804 I1.424 J-1.196 E.12252
G1 X114.712 Y110.79 E.0057
G3 X113.6 Y114.102 I.046 J1.859 E.21932
G1 X113.456 Y113.964 E.00613
M204 S10000
; WIPE_START
G1 F24000
G1 X113.335 Y113.844 E-.06486
G1 X113.125 Y113.539 E-.1407
G1 X112.981 Y113.198 E-.14078
G1 X112.907 Y112.836 E-.14023
G1 X112.9 Y112.556 E-.10636
G1 X112.956 Y112.191 E-.14059
G1 X112.979 Y112.125 E-.02648
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I-1.208 J.144 P1  F30000
G1 X116.503 Y141.781 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9977
G1 X116.736 Y142.124 E.01376
G3 X114.478 Y140.966 I-1.978 J1.076 E.37983
G1 X114.702 Y140.949 E.00745
G3 X116.467 Y141.734 I.056 J2.251 E.06621
G1 X116.195 Y142.023 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9977
G1 X116.391 Y142.312 E.01073
G3 X114.527 Y141.355 I-1.633 J.888 E.29053
G1 X114.712 Y141.342 E.0057
G3 X116.158 Y141.976 I.046 J1.859 E.05012
M204 S10000
; WIPE_START
G1 F24000
G1 X116.391 Y142.312 E-.15531
G1 X116.536 Y142.653 E-.14075
G1 X116.609 Y143.016 E-.14076
G1 X116.609 Y143.386 E-.14077
G1 X116.536 Y143.75 E-.14077
G1 X116.493 Y143.851 E-.04163
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I-.03 J1.217 P1  F30000
G1 X146.506 Y144.586 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9977
G1 X146.222 Y144.889 E.01375
G3 X144.453 Y140.966 I-1.489 J-1.689 E.27929
G1 X144.677 Y140.949 E.00745
G3 X146.543 Y144.539 I.056 J2.251 E.16675
G1 X146.175 Y144.369 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9977
G1 X145.963 Y144.594 E.00952
G3 X144.502 Y141.355 I-1.23 J-1.394 E.21362
G1 X144.687 Y141.342 E.0057
G3 X146.215 Y144.323 I.046 J1.859 E.12821
G1 X146.214 Y144.324 E.00001
M204 S10000
; WIPE_START
G1 F24000
G1 X145.963 Y144.594 E-.14052
G1 X145.663 Y144.812 E-.14069
G1 X145.326 Y144.965 E-.14077
G1 X144.964 Y145.047 E-.14077
G1 X144.594 Y145.056 E-.14077
G1 X144.448 Y145.031 E-.05649
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I-.666 J1.019 P1  F30000
G1 X151.898 Y149.898 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9977
G1 X108.102 Y149.898 E1.45279
G1 X108.102 Y106.102 E1.45279
G1 X151.898 Y106.102 E1.45279
G1 X151.898 Y149.838 E1.4508
G1 X152.29 Y150.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9977
G1 X107.71 Y150.29 E1.36982
G1 X107.71 Y105.71 E1.36982
G1 X152.29 Y105.71 E1.36982
G1 X152.29 Y150.23 E1.36798
M204 S10000
; WIPE_START
G1 F24000
G1 X150.29 Y150.233 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I1.071 J-.578 P1  F30000
G1 X149.921 Y149.55 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F9977
G1 X151.55 Y149.55 E.05401
G1 X146.791 Y144.791 E.22323
G2 X146.909 Y141.795 I-2.025 J-1.58 E.10621
G1 X151.55 Y137.154 E.21771
G1 X151.55 Y134.198 E.09807
G1 X141.982 Y124.63 E.44885
G2 X141.759 Y123.917 I-7.253 J1.879 E.02478
G1 X151.55 Y114.126 E.45931
G1 X151.55 Y111.17 E.09807
G1 X146.83 Y106.45 E.2214
G1 X143.874 Y106.45 E.09807
G1 X134.083 Y116.241 E.45928
G2 X133.365 Y116.013 I-7.682 J22.985 E.02501
G1 X123.802 Y106.45 E.4486
G1 X120.846 Y106.45 E.09807
G1 X116.533 Y110.763 E.20231
G3 X116.539 Y114.539 I-1.785 J1.89 E.14017
G1 X121.198 Y119.198 E.21859
G2 X120.124 Y120.421 I11.47 J11.158 E.054
; WIPE_START
G1 F24000
G1 X121.198 Y119.198 E-.61835
G1 X120.935 Y118.935 E-.14165
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I-1.216 J-.059 P1  F30000
G1 X120.124 Y135.579 Z1.4
G1 Z1
G1 E.8 F1800
G1 F9977
G2 X121.198 Y136.802 I10.443 J-8.09 E.05401
G1 X116.61 Y141.39 E.21523
G2 X112.8 Y141.504 I-1.852 J1.815 E.14204
G1 X108.45 Y137.154 E.20406
G1 X108.45 Y134.198 E.09807
G1 X118.018 Y124.63 E.44885
G3 X118.241 Y123.917 I7.251 J1.878 E.02478
G1 X108.45 Y114.126 E.45931
G1 X108.45 Y111.17 E.09807
M73 P66 R4
G1 X113.17 Y106.45 E.2214
G1 X116.126 Y106.45 E.09807
G1 X125.917 Y116.241 E.45928
G3 X126.635 Y116.013 I7.685 J22.994 E.02501
G1 X136.198 Y106.45 E.4486
G1 X139.154 Y106.45 E.09807
G1 X143.238 Y110.535 E.1916
G2 X143.235 Y114.765 I1.498 J2.117 E.16413
G1 X138.802 Y119.198 E.20796
G3 X139.876 Y120.421 I-9.369 J9.312 E.05401
G1 X151.55 Y124.893 F30000
G1 F9977
G1 X151.55 Y126.522 E.05401
G1 X131.478 Y106.45 E.94159
G1 X128.522 Y106.45 E.09807
G1 X108.45 Y126.522 E.94159
G1 X108.45 Y129.478 E.09807
G1 X128.522 Y149.55 E.94159
G1 X131.478 Y149.55 E.09807
G1 X151.55 Y129.478 E.94159
G1 X151.55 Y131.107 E.05401
G1 X139.876 Y135.579 F30000
G1 F9977
G3 X138.802 Y136.802 I-10.443 J-8.09 E.05401
G1 X143.15 Y141.15 E.20397
G2 X143.327 Y145.376 I1.585 J2.05 E.16415
G1 X139.154 Y149.55 E.19577
G1 X136.198 Y149.55 E.09807
G1 X126.635 Y139.987 E.4486
G3 X125.917 Y139.759 I6.966 J-23.219 E.02501
G1 X116.126 Y149.55 E.45928
G1 X113.17 Y149.55 E.09807
G1 X108.45 Y144.83 E.2214
G1 X108.45 Y141.874 E.09807
G1 X118.241 Y132.083 E.45931
G3 X118.018 Y131.37 I7.028 J-2.591 E.02478
G1 X108.45 Y121.802 E.44885
G1 X108.45 Y118.846 E.09807
G1 X112.87 Y114.426 E.20735
G3 X112.873 Y110.873 I1.876 J-1.775 E.12995
G1 X108.45 Y106.45 E.20749
G1 X110.079 Y106.45 E.05401
G1 X149.921 Y106.45 F30000
G1 F9977
G1 X151.55 Y106.45 E.05401
G1 X146.847 Y111.153 E.2206
G3 X146.852 Y114.149 I-2.106 J1.502 E.10599
G1 X151.55 Y118.846 E.22036
G1 X151.55 Y121.802 E.09807
G1 X141.982 Y131.37 E.44885
G3 X141.759 Y132.083 I-7.252 J-1.879 E.02478
G1 X151.55 Y141.874 E.45931
G1 X151.55 Y144.83 E.09807
G1 X146.83 Y149.55 E.2214
G1 X143.874 Y149.55 E.09807
G1 X134.083 Y139.759 E.45928
G3 X133.365 Y139.987 I-7.684 J-22.991 E.02501
G1 X123.802 Y149.55 E.4486
G1 X120.846 Y149.55 E.09807
G1 X116.462 Y145.166 E.20564
G3 X112.947 Y145.053 I-1.697 J-1.941 E.12837
G1 X108.45 Y149.55 E.21096
G1 X110.079 Y149.55 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 1.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X108.45 Y149.55 E-.61876
G1 X108.713 Y149.287 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 6/15
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
G3 Z1.4 I.748 J.96 P1  F30000
G1 X141.369 Y123.852 Z1.4
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9914
G1 X141.371 Y123.861 E.00032
G3 X129.698 Y115.901 I-11.371 J4.137 E2.02156
G1 X130.302 Y115.901 E.02002
G3 X141.151 Y123.299 I-.302 J12.097 E.46042
G1 X141.347 Y123.796 E.01771
G1 X141.003 Y123.995 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9914
G3 X129.708 Y116.294 I-11.003 J4.003 E1.81189
G1 X130.292 Y116.294 E.01794
G3 X140.982 Y123.939 I-.292 J11.705 E.42877
M204 S10000
; WIPE_START
G1 F24000
G1 X141.19 Y124.548 E-.24464
G1 X141.348 Y125.11 E-.22188
G1 X141.478 Y125.68 E-.22187
G1 X141.511 Y125.865 E-.0716
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I1.12 J.477 P1  F30000
G1 X146.611 Y113.889 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9914
G1 X146.593 Y113.917 E.00112
G3 X144.453 Y110.414 I-1.86 J-1.269 E.2979
G1 X144.677 Y110.398 E.00745
G3 X146.807 Y113.524 I.056 J2.251 E.14901
G1 X146.639 Y113.836 E.01176
G1 X146.288 Y113.666 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9914
G1 X146.269 Y113.696 E.00111
G3 X144.502 Y110.804 I-1.536 J-1.048 E.22786
G1 X144.687 Y110.79 E.0057
G3 X146.446 Y113.372 I.046 J1.859 E.11397
G1 X146.316 Y113.613 E.00842
M204 S10000
; WIPE_START
G1 F24000
G1 X146.269 Y113.696 E-.03652
G1 X146.032 Y113.981 E-.1407
G1 X145.742 Y114.212 E-.14078
G1 X145.466 Y114.359 E-.1188
G1 X145.147 Y114.463 E-.12759
G1 X144.78 Y114.509 E-.14077
G1 X144.636 Y114.499 E-.05484
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I.01 J-1.217 P1  F30000
G1 X113.164 Y114.237 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9914
G1 X112.899 Y113.918 E.01375
G3 X114.478 Y110.414 I1.86 J-1.269 E.15273
G1 X114.702 Y110.398 E.00745
G3 X113.206 Y114.279 I.056 J2.251 E.2933
G1 X113.432 Y113.949 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9914
G1 X113.223 Y113.697 E.01007
G3 X114.527 Y110.804 I1.535 J-1.048 E.11682
G1 X114.712 Y110.79 E.0057
G3 X113.473 Y113.992 I.046 J1.859 E.22447
M204 S10000
; WIPE_START
G1 F24000
G1 X113.223 Y113.697 E-.14729
G1 X113.044 Y113.372 E-.14071
M73 P67 R4
G1 X112.935 Y113.018 E-.14077
G1 X112.907 Y112.835 E-.07048
G1 X112.907 Y112.464 E-.14077
G1 X112.97 Y112.155 E-.11999
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I-1.209 J.143 P1  F30000
G1 X116.46 Y141.73 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9914
G1 X116.484 Y141.754 E.00112
G3 X114.478 Y140.966 I-1.725 J1.446 E.39473
G1 X114.702 Y140.949 E.00745
G3 X116.163 Y141.44 I.056 J2.251 E.05217
G1 X116.417 Y141.688 E.01177
G1 X116.182 Y142.004 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9914
G1 X116.183 Y142.006 E.00005
G3 X114.527 Y141.355 I-1.425 J1.194 E.30192
G1 X114.712 Y141.342 E.0057
G3 X115.918 Y141.747 I.046 J1.859 E.0399
G1 X116.139 Y141.963 E.00949
M204 S10000
; WIPE_START
G1 F24000
G1 X116.183 Y142.006 E-.0234
G1 X116.392 Y142.312 E-.14075
G1 X116.536 Y142.653 E-.14077
G1 X116.609 Y143.015 E-.14031
G1 X116.616 Y143.295 E-.10633
G1 X116.561 Y143.66 E-.14054
G1 X116.5 Y143.828 E-.0679
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I-.034 J1.216 P1  F30000
G1 X146.435 Y144.673 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9914
G1 X146.136 Y144.961 E.01375
G3 X144.453 Y140.966 I-1.403 J-1.761 E.27556
G1 X144.677 Y140.949 E.00745
G3 X146.474 Y144.628 I.056 J2.251 E.17047
G1 X146.173 Y144.375 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9914
G1 X146.157 Y144.396 E.0008
G3 X144.502 Y141.355 I-1.424 J-1.196 E.22217
G1 X144.687 Y141.342 E.0057
G3 X146.365 Y144.09 I.046 J1.859 E.11967
G1 X146.206 Y144.326 E.00873
M204 S10000
; WIPE_START
G1 F24000
G1 X146.157 Y144.396 E-.03264
G1 X145.893 Y144.656 E-.1407
G1 X145.582 Y144.857 E-.14077
G1 X145.239 Y144.991 E-.13976
G1 X144.964 Y145.047 E-.10664
G1 X144.594 Y145.056 E-.14077
G1 X144.442 Y145.029 E-.05871
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I-.665 J1.019 P1  F30000
G1 X151.898 Y149.898 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9914
G1 X108.102 Y149.898 E1.45279
G1 X108.102 Y106.102 E1.45279
G1 X151.898 Y106.102 E1.45279
G1 X151.898 Y149.838 E1.4508
G1 X152.29 Y150.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9914
G1 X107.71 Y150.29 E1.36982
G1 X107.71 Y105.71 E1.36982
G1 X152.29 Y105.71 E1.36982
G1 X152.29 Y150.23 E1.36798
M204 S10000
; WIPE_START
G1 F24000
G1 X150.29 Y150.233 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I1.071 J-.578 P1  F30000
G1 X149.921 Y149.55 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F9914
G1 X151.55 Y149.55 E.05401
G1 X146.787 Y144.787 E.22344
G2 X146.909 Y141.795 I-2.068 J-1.583 E.10582
G1 X151.55 Y137.154 E.21771
G1 X151.55 Y134.198 E.09807
G1 X141.982 Y124.63 E.44885
G2 X141.759 Y123.917 I-7.253 J1.879 E.02478
G1 X151.55 Y114.126 E.45931
G1 X151.55 Y111.17 E.09807
G1 X146.83 Y106.45 E.2214
G1 X143.874 Y106.45 E.09807
G1 X134.083 Y116.241 E.45928
G2 X133.365 Y116.013 I-7.683 J22.986 E.02501
G1 X123.802 Y106.45 E.4486
G1 X120.846 Y106.45 E.09807
G1 X116.533 Y110.763 E.20231
G2 X112.87 Y110.87 I-1.778 J1.896 E.13492
G1 X108.45 Y106.45 E.20733
G1 X110.079 Y106.45 E.05401
G1 X112.281 Y112.604 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
G1 F9914
G1 X112.217 Y112.641 E.00204
G1 X112.266 Y112.669 E.00155
G1 X120.124 Y120.421 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F9914
G3 X121.198 Y119.198 I10.443 J8.09 E.05401
G1 X116.539 Y114.539 E.21859
G3 X112.87 Y114.426 I-1.777 J-1.904 E.13509
G1 X108.45 Y118.846 E.20735
G1 X108.45 Y121.802 E.09807
G1 X118.018 Y131.37 E.44885
G2 X118.241 Y132.083 I7.252 J-1.879 E.02478
G1 X108.45 Y141.874 E.45931
G1 X108.45 Y144.83 E.09807
G1 X113.17 Y149.55 E.2214
G1 X116.126 Y149.55 E.09807
G1 X125.917 Y139.759 E.45928
G2 X126.635 Y139.987 I7.684 J-22.991 E.02501
G1 X136.198 Y149.55 E.4486
G1 X139.154 Y149.55 E.09807
G1 X143.327 Y145.376 E.19577
G3 X143.15 Y141.15 I1.397 J-2.176 E.16434
G1 X138.802 Y136.802 E.20397
G2 X139.876 Y135.579 I-9.369 J-9.312 E.05401
G1 X151.55 Y131.107 F30000
G1 F9914
G1 X151.55 Y129.478 E.05401
G1 X131.478 Y149.55 E.94159
G1 X128.522 Y149.55 E.09807
G1 X108.45 Y129.478 E.94159
G1 X108.45 Y126.522 E.09807
G1 X128.522 Y106.45 E.94159
G1 X131.478 Y106.45 E.09807
G1 X151.55 Y126.522 E.94159
G1 X151.55 Y124.893 E.05401
G1 X139.876 Y120.421 F30000
G1 F9914
G2 X138.802 Y119.198 I-10.443 J8.09 E.05401
G1 X143.235 Y114.765 E.20796
G3 X143.238 Y110.535 I1.49 J-2.114 E.16432
G1 X139.154 Y106.45 E.1916
G1 X136.198 Y106.45 E.09807
G1 X126.635 Y116.013 E.4486
G2 X125.917 Y116.241 I6.966 J23.221 E.02501
G1 X116.126 Y106.45 E.45928
G1 X113.17 Y106.45 E.09807
G1 X108.45 Y111.17 E.2214
G1 X108.45 Y114.126 E.09807
G1 X118.241 Y123.917 E.45931
G2 X118.018 Y124.63 I7.028 J2.591 E.02478
G1 X108.45 Y134.198 E.44885
G1 X108.45 Y137.154 E.09807
G1 X112.795 Y141.499 E.20381
G3 X116.61 Y141.39 I1.958 J1.718 E.14209
G1 X121.198 Y136.802 E.21523
G3 X120.124 Y135.579 I9.368 J-9.312 E.05401
; WIPE_START
G1 F24000
G1 X121.198 Y136.802 E-.61829
G1 X120.934 Y137.066 E-.14171
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I-.918 J-.799 P1  F30000
G1 X110.079 Y149.55 Z1.6
G1 Z1.2
G1 E.8 F1800
G1 F9914
G1 X108.45 Y149.55 E.05401
G1 X112.947 Y145.053 E.21096
G2 X116.462 Y145.166 I1.818 J-1.828 E.12837
G1 X120.846 Y149.55 E.20564
G1 X123.802 Y149.55 E.09807
G1 X133.365 Y139.987 E.4486
G2 X134.083 Y139.759 I-6.966 J-23.219 E.02501
G1 X143.874 Y149.55 E.45928
G1 X146.83 Y149.55 E.09807
G1 X151.55 Y144.83 E.2214
G1 X151.55 Y141.874 E.09807
G1 X141.759 Y132.083 E.45931
G2 X141.982 Y131.37 I-7.029 J-2.592 E.02478
G1 X151.55 Y121.802 E.44885
G1 X151.55 Y118.846 E.09807
G1 X146.848 Y114.145 E.22054
G2 X146.847 Y111.153 I-2.117 J-1.495 E.10579
G1 X151.55 Y106.45 E.2206
M73 P68 R4
G1 X149.921 Y106.45 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 1.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X151.55 Y106.45 E-.61876
G1 X151.287 Y106.713 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 7/15
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
G3 Z1.6 I-1.053 J-.61 P1  F30000
G1 X141.369 Y123.852 Z1.6
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F10214
G1 X141.371 Y123.861 E.00032
G3 X129.698 Y115.901 I-11.371 J4.137 E2.02156
G1 X130.302 Y115.901 E.02002
G3 X141.151 Y123.299 I-.302 J12.097 E.46042
G1 X141.347 Y123.796 E.01771
G1 X141.003 Y123.995 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F10214
G3 X129.708 Y116.294 I-11.003 J4.003 E1.81189
G1 X130.292 Y116.294 E.01794
G3 X140.982 Y123.939 I-.292 J11.705 E.42877
M204 S10000
; WIPE_START
G1 F24000
G1 X141.19 Y124.548 E-.24464
G1 X141.348 Y125.11 E-.22189
G1 X141.478 Y125.68 E-.22186
G1 X141.511 Y125.865 E-.07161
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I1.12 J.476 P1  F30000
G1 X146.573 Y113.945 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10214
G1 X146.304 Y114.261 E.01375
G3 X144.453 Y110.414 I-1.571 J-1.612 E.28301
G1 X144.677 Y110.398 E.00745
G3 X146.607 Y113.896 I.056 J2.251 E.16303
G1 X146.29 Y113.662 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F10214
G1 X146.269 Y113.696 E.00125
G3 X144.502 Y110.804 I-1.536 J-1.048 E.22786
G1 X144.687 Y110.79 E.0057
G3 X146.446 Y113.372 I.046 J1.859 E.11397
G1 X146.318 Y113.609 E.00828
M204 S10000
; WIPE_START
G1 F24000
G1 X146.269 Y113.696 E-.03821
G1 X146.032 Y113.981 E-.14069
G1 X145.742 Y114.212 E-.14077
G1 X145.415 Y114.38 E-.13977
G1 X145.147 Y114.463 E-.10664
G1 X144.78 Y114.509 E-.14077
G1 X144.64 Y114.499 E-.05315
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I.01 J-1.217 P1  F30000
G1 X113.164 Y114.237 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10214
G1 X112.899 Y113.918 E.01376
G3 X114.478 Y110.414 I1.86 J-1.269 E.15273
G1 X114.702 Y110.398 E.00745
G3 X113.206 Y114.279 I.056 J2.251 E.2933
G1 X113.445 Y113.964 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F10214
G1 X113.223 Y113.697 E.01069
G3 X114.527 Y110.804 I1.535 J-1.048 E.11682
G1 X114.712 Y110.79 E.0057
G3 X113.488 Y114.006 I.046 J1.859 E.22386
M204 S10000
; WIPE_START
G1 F24000
G1 X113.223 Y113.697 E-.15481
G1 X113.044 Y113.372 E-.1407
G1 X112.935 Y113.018 E-.14076
G1 X112.907 Y112.835 E-.07048
G1 X112.907 Y112.464 E-.14077
G1 X112.966 Y112.174 E-.11248
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-1.208 J.144 P1  F30000
G1 X116.503 Y141.781 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10214
G1 X116.736 Y142.124 E.01376
G3 X114.478 Y140.966 I-1.978 J1.076 E.37983
G1 X114.702 Y140.949 E.00745
G3 X116.467 Y141.734 I.056 J2.251 E.0662
G1 X116.162 Y141.985 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F10214
G1 X116.183 Y142.006 E.0009
G3 X114.527 Y141.355 I-1.425 J1.194 E.30192
G1 X114.712 Y141.342 E.0057
G3 X115.918 Y141.747 I.046 J1.859 E.0399
G1 X116.119 Y141.943 E.00863
M204 S10000
; WIPE_START
G1 F24000
G1 X116.183 Y142.006 E-.03396
G1 X116.392 Y142.312 E-.14075
G1 X116.536 Y142.653 E-.14077
G1 X116.609 Y143.015 E-.14037
G1 X116.616 Y143.295 E-.10632
G1 X116.561 Y143.66 E-.14049
G1 X116.509 Y143.802 E-.05733
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-.033 J1.217 P1  F30000
G1 X146.478 Y144.621 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10214
G1 X146.457 Y144.648 E.00111
G3 X144.453 Y140.966 I-1.724 J-1.448 E.29046
G1 X144.677 Y140.949 E.00745
G3 X146.71 Y144.278 I.056 J2.251 E.15645
G1 X146.511 Y144.572 E.01176
G1 X146.175 Y144.372 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F10214
G1 X146.157 Y144.396 E.00091
G3 X144.502 Y141.355 I-1.424 J-1.196 E.22217
G1 X144.687 Y141.342 E.0057
G3 X146.365 Y144.09 I.046 J1.859 E.11967
G1 X146.209 Y144.323 E.00862
M204 S10000
; WIPE_START
G1 F24000
G1 X146.157 Y144.396 E-.03408
G1 X145.893 Y144.656 E-.1407
G1 X145.582 Y144.857 E-.14077
G1 X145.239 Y144.991 E-.13978
G1 X144.964 Y145.047 E-.10663
G1 X144.594 Y145.056 E-.14077
G1 X144.446 Y145.03 E-.05726
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-.666 J1.019 P1  F30000
G1 X151.898 Y149.898 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10214
G1 X108.102 Y149.898 E1.45279
G1 X108.102 Y106.102 E1.45279
G1 X151.898 Y106.102 E1.45279
G1 X151.898 Y149.838 E1.4508
G1 X152.29 Y150.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F10214
G1 X107.71 Y150.29 E1.36982
G1 X107.71 Y105.71 E1.36982
G1 X152.29 Y105.71 E1.36982
G1 X152.29 Y150.23 E1.36798
M204 S10000
; WIPE_START
G1 F24000
G1 X150.29 Y150.233 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I1.071 J-.578 P1  F30000
G1 X149.921 Y149.55 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F10214
G1 X151.55 Y149.55 E.05401
G1 X146.787 Y144.787 E.22344
G2 X146.909 Y141.795 I-2.068 J-1.583 E.10582
G1 X151.55 Y137.154 E.21771
G1 X151.55 Y134.198 E.09807
G1 X141.982 Y124.63 E.44885
G2 X141.759 Y123.917 I-7.253 J1.879 E.02478
G1 X151.55 Y114.126 E.45931
G1 X151.55 Y111.17 E.09807
G1 X146.83 Y106.45 E.2214
G1 X143.874 Y106.45 E.09807
G1 X134.083 Y116.241 E.45928
G2 X133.365 Y116.013 I-7.683 J22.986 E.02501
G1 X123.802 Y106.45 E.4486
G1 X120.846 Y106.45 E.09807
G1 X116.533 Y110.763 E.20231
G3 X116.539 Y114.539 I-1.77 J1.89 E.14034
G1 X121.202 Y119.202 E.21879
G2 X120.124 Y120.421 I10.325 J10.223 E.054
G1 X108.45 Y124.893 F30000
G1 F10214
G1 X108.45 Y126.522 E.05401
G1 X128.522 Y106.45 E.94159
G1 X131.478 Y106.45 E.09807
G1 X151.55 Y126.522 E.94159
G1 X151.55 Y129.478 E.09807
G1 X131.478 Y149.55 E.94159
G1 X128.522 Y149.55 E.09807
G1 X108.45 Y129.478 E.94159
G1 X108.45 Y131.107 E.05401
G1 X120.124 Y135.579 F30000
G1 F10214
G2 X121.198 Y136.802 I10.443 J-8.09 E.05401
G1 X116.61 Y141.39 E.21523
G2 X112.8 Y141.504 I-1.852 J1.815 E.14204
G1 X108.45 Y137.154 E.20406
G1 X108.45 Y134.198 E.09807
G1 X118.018 Y124.63 E.44885
G3 X118.241 Y123.917 I7.251 J1.878 E.02478
G1 X108.45 Y114.126 E.45931
G1 X108.45 Y111.17 E.09807
G1 X113.17 Y106.45 E.2214
M73 P69 R4
G1 X116.126 Y106.45 E.09807
G1 X125.917 Y116.241 E.45928
G3 X126.635 Y116.013 I7.685 J22.994 E.02501
G1 X136.198 Y106.45 E.4486
G1 X139.154 Y106.45 E.09807
G1 X143.238 Y110.535 E.1916
G2 X142.144 Y112.895 I1.449 J2.106 E.09056
G1 X141.641 Y113.024 E.01721
G1 X141.817 Y113.89 E.02934
G1 X142.176 Y114.129 E.0143
G1 X142.555 Y114.052 E.01282
G2 X143.235 Y114.765 I2.257 J-1.472 E.03288
G1 X138.802 Y119.198 E.20796
G3 X139.876 Y120.421 I-9.369 J9.312 E.05401
G1 X142.146 Y113.34 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.498838
G1 F10214
G1 X142.205 Y113.561 E.00848
; WIPE_START
G1 F24000
G1 X142.146 Y113.34 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I.807 J.911 P1  F30000
G1 X149.921 Y106.45 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F10214
G1 X151.55 Y106.45 E.05401
G1 X146.847 Y111.153 E.2206
G3 X146.848 Y114.145 I-2.116 J1.497 E.10579
G1 X151.55 Y118.846 E.22054
G1 X151.55 Y121.802 E.09807
G1 X141.982 Y131.37 E.44885
G3 X141.759 Y132.083 I-7.253 J-1.879 E.02478
G1 X151.55 Y141.874 E.45931
G1 X151.55 Y144.83 E.09807
G1 X146.83 Y149.55 E.2214
M73 P69 R3
G1 X143.874 Y149.55 E.09807
G1 X134.083 Y139.759 E.45928
G3 X133.365 Y139.987 I-7.684 J-22.991 E.02501
G1 X123.802 Y149.55 E.4486
G1 X120.846 Y149.55 E.09807
G1 X116.462 Y145.166 E.20564
G3 X112.947 Y145.053 I-1.697 J-1.941 E.12837
G1 X108.45 Y149.55 E.21096
G1 X110.079 Y149.55 E.05401
; WIPE_START
G1 F24000
G1 X108.45 Y149.55 E-.61876
G1 X108.713 Y149.287 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I.49 J1.114 P1  F30000
G1 X139.876 Y135.579 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F10214
G3 X138.802 Y136.802 I-10.443 J-8.09 E.05401
G1 X143.15 Y141.15 E.20397
G2 X143.327 Y145.376 I1.574 J2.051 E.16434
G1 X139.154 Y149.55 E.19577
G1 X136.198 Y149.55 E.09807
G1 X126.635 Y139.987 E.4486
G3 X125.917 Y139.759 I6.966 J-23.219 E.02501
G1 X116.126 Y149.55 E.45928
G1 X113.17 Y149.55 E.09807
G1 X108.45 Y144.83 E.2214
G1 X108.45 Y141.874 E.09807
G1 X118.241 Y132.083 E.45931
G3 X118.018 Y131.37 I7.029 J-2.591 E.02478
G1 X108.45 Y121.802 E.44885
G1 X108.45 Y118.846 E.09807
G1 X112.87 Y114.426 E.20735
G3 X112.873 Y110.873 I1.893 J-1.775 E.1298
G1 X108.45 Y106.45 E.20749
G1 X110.079 Y106.45 E.05401
; WIPE_START
G1 F24000
G1 X108.45 Y106.45 E-.61876
G1 X108.713 Y106.713 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-.893 J.827 P1  F30000
G1 X144.876 Y145.75 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
G1 F10214
G1 X145.197 Y145.712 E.00895
; CHANGE_LAYER
; Z_HEIGHT: 1.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X144.876 Y145.75 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 8/15
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
G3 Z1.8 I1.202 J-.192 P1  F30000
G1 X141.369 Y123.852 Z1.8
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9938
G1 X141.372 Y123.861 E.00031
G3 X129.698 Y115.901 I-11.372 J4.138 E2.0218
G1 X130.302 Y115.901 E.02002
G3 X141.152 Y123.299 I-.302 J12.098 E.46043
G1 X141.347 Y123.796 E.01771
G1 X141.004 Y123.995 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9938
G3 X129.708 Y116.294 I-11.004 J4.005 E1.81216
G1 X130.292 Y116.294 E.01794
G3 X140.983 Y123.939 I-.292 J11.706 E.42878
M204 S10000
; WIPE_START
G1 F24000
G1 X141.19 Y124.548 E-.24465
G1 X141.348 Y125.11 E-.22189
G1 X141.478 Y125.68 E-.22186
G1 X141.511 Y125.865 E-.0716
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I1.12 J.476 P1  F30000
G1 X146.573 Y113.944 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9938
G1 X146.304 Y114.261 E.01376
G3 X144.453 Y110.414 I-1.571 J-1.612 E.28301
G1 X144.677 Y110.398 E.00745
G3 X146.607 Y113.896 I.056 J2.251 E.16302
G1 X146.292 Y113.658 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9938
G1 X146.269 Y113.696 E.00138
G3 X144.502 Y110.804 I-1.536 J-1.048 E.22786
G1 X144.687 Y110.79 E.0057
G3 X146.446 Y113.372 I.046 J1.859 E.11397
G1 X146.32 Y113.605 E.00815
M204 S10000
; WIPE_START
G1 F24000
G1 X146.269 Y113.696 E-.0399
G1 X146.032 Y113.981 E-.1407
G1 X145.742 Y114.212 E-.14077
G1 X145.414 Y114.381 E-.14043
G1 X145.146 Y114.463 E-.10633
G1 X144.78 Y114.509 E-.14043
G1 X144.645 Y114.499 E-.05144
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I.017 J-1.217 P1  F30000
G1 X113.014 Y114.07 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9938
G1 X112.782 Y113.726 E.01376
G3 X114.478 Y110.414 I1.977 J-1.078 E.14529
G1 X114.702 Y110.398 E.00745
G3 X113.051 Y114.116 I.056 J2.251 E.30075
G1 X113.454 Y113.964 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9938
G1 X113.335 Y113.844 E.00519
G3 X114.527 Y110.804 I1.424 J-1.196 E.12252
G1 X114.712 Y110.79 E.0057
G3 X113.6 Y114.102 I.046 J1.859 E.21932
G1 X113.498 Y114.005 E.00434
M204 S10000
; WIPE_START
G1 F24000
G1 X113.335 Y113.844 E-.08701
G1 X113.125 Y113.539 E-.14071
G1 X112.981 Y113.198 E-.14077
G1 X112.907 Y112.835 E-.14077
G1 X112.907 Y112.464 E-.14077
G1 X112.965 Y112.181 E-.10998
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-1.209 J.143 P1  F30000
M73 P70 R3
G1 X116.46 Y141.73 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9938
G1 X116.484 Y141.754 E.00111
G3 X114.478 Y140.966 I-1.725 J1.446 E.39473
G1 X114.702 Y140.949 E.00745
G3 X116.163 Y141.44 I.056 J2.251 E.05217
G1 X116.417 Y141.688 E.01177
G1 X116.143 Y141.966 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9938
G1 X116.183 Y142.006 E.00172
G3 X114.527 Y141.355 I-1.425 J1.194 E.30192
G1 X114.712 Y141.342 E.0057
G3 X115.918 Y141.747 I.046 J1.859 E.0399
G1 X116.1 Y141.924 E.00781
M204 S10000
; WIPE_START
G1 F24000
G1 X116.183 Y142.006 E-.04413
G1 X116.392 Y142.312 E-.14075
G1 X116.536 Y142.653 E-.14077
G1 X116.609 Y143.015 E-.14044
G1 X116.616 Y143.295 E-.10631
G1 X116.561 Y143.66 E-.14043
G1 X116.519 Y143.777 E-.04717
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-.034 J1.216 P1  F30000
G1 X146.478 Y144.622 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9938
G1 X146.457 Y144.648 E.00111
G3 X144.453 Y140.966 I-1.724 J-1.448 E.29045
G1 X144.677 Y140.949 E.00745
G3 X146.71 Y144.278 I.056 J2.251 E.15646
G1 X146.511 Y144.572 E.01177
G1 X146.177 Y144.369 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9938
G1 X146.157 Y144.396 E.00103
G3 X144.502 Y141.355 I-1.424 J-1.196 E.22217
G1 X144.687 Y141.342 E.0057
G3 X146.365 Y144.09 I.046 J1.859 E.11967
G1 X146.211 Y144.319 E.0085
M204 S10000
; WIPE_START
G1 F24000
G1 X146.157 Y144.396 E-.03556
G1 X145.893 Y144.656 E-.14069
G1 X145.582 Y144.857 E-.14077
G1 X145.281 Y144.978 E-.1232
G1 X144.964 Y145.047 E-.12319
G1 X144.594 Y145.056 E-.14077
G1 X144.45 Y145.031 E-.05582
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-.666 J1.019 P1  F30000
G1 X151.898 Y149.898 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9938
G1 X108.102 Y149.898 E1.45279
G1 X108.102 Y106.102 E1.45279
G1 X151.898 Y106.102 E1.45279
G1 X151.898 Y149.838 E1.4508
G1 X152.29 Y150.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9938
G1 X107.71 Y150.29 E1.36982
G1 X107.71 Y105.71 E1.36982
G1 X152.29 Y105.71 E1.36982
G1 X152.29 Y150.23 E1.36798
M204 S10000
; WIPE_START
G1 F24000
G1 X150.29 Y150.233 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I1.071 J-.578 P1  F30000
G1 X149.921 Y149.55 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F9938
G1 X151.55 Y149.55 E.05401
G1 X146.787 Y144.787 E.22344
G2 X146.909 Y141.795 I-2.068 J-1.583 E.10582
G1 X151.55 Y137.154 E.21771
G1 X151.55 Y134.198 E.09807
G1 X141.982 Y124.63 E.44885
G2 X141.759 Y123.917 I-7.253 J1.879 E.02478
G1 X151.55 Y114.126 E.45931
G1 X151.55 Y111.17 E.09807
G1 X146.83 Y106.45 E.2214
G1 X143.874 Y106.45 E.09807
G1 X134.083 Y116.241 E.45928
G2 X133.365 Y116.013 I-7.683 J22.986 E.02501
G1 X123.802 Y106.45 E.4486
G1 X120.846 Y106.45 E.09807
G1 X116.533 Y110.763 E.20231
G3 X116.539 Y114.539 I-1.77 J1.89 E.14034
G1 X121.198 Y119.198 E.21859
G2 X120.124 Y120.421 I9.369 J9.312 E.05401
; WIPE_START
G1 F24000
G1 X121.198 Y119.198 E-.61829
G1 X120.934 Y118.934 E-.14171
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-1.216 J-.059 P1  F30000
G1 X120.124 Y135.579 Z2
G1 Z1.6
G1 E.8 F1800
G1 F9938
G2 X121.198 Y136.802 I10.443 J-8.09 E.05401
G1 X116.61 Y141.39 E.21523
G2 X112.8 Y141.504 I-1.852 J1.815 E.14204
G1 X108.45 Y137.154 E.20406
G1 X108.45 Y134.198 E.09807
G1 X118.018 Y124.63 E.44885
G3 X118.241 Y123.917 I7.251 J1.878 E.02478
G1 X108.45 Y114.126 E.45931
G1 X108.45 Y111.17 E.09807
G1 X113.17 Y106.45 E.2214
G1 X116.126 Y106.45 E.09807
G1 X125.917 Y116.241 E.45928
G3 X126.635 Y116.013 I7.685 J22.994 E.02501
G1 X136.198 Y106.45 E.4486
G1 X139.154 Y106.45 E.09807
G1 X143.238 Y110.535 E.1916
G2 X143.235 Y114.765 I1.498 J2.117 E.16413
G1 X138.802 Y119.198 E.20796
G3 X139.876 Y120.421 I-9.369 J9.312 E.05401
G1 X146.717 Y114.449 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.49883
G1 F9938
G1 X146.801 Y114.36 E.00453
G1 X149.921 Y106.45 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F9938
G1 X151.55 Y106.45 E.05401
G1 X146.847 Y111.153 E.2206
G3 X147.047 Y113.829 I-2.051 J1.498 E.09378
G1 X147.284 Y114.072 E.01129
G1 X147.243 Y114.539 E.01553
G1 X151.55 Y118.846 E.20205
G1 X151.55 Y121.802 E.09807
G1 X141.982 Y131.37 E.44885
G3 X141.759 Y132.083 I-7.252 J-1.879 E.02478
G1 X151.55 Y141.874 E.45931
G1 X151.55 Y144.83 E.09807
G1 X146.83 Y149.55 E.2214
G1 X143.874 Y149.55 E.09807
G1 X134.083 Y139.759 E.45928
G3 X133.365 Y139.987 I-7.684 J-22.991 E.02501
G1 X123.802 Y149.55 E.4486
G1 X120.846 Y149.55 E.09807
G1 X116.462 Y145.166 E.20564
G3 X112.947 Y145.053 I-1.697 J-1.941 E.12837
G1 X108.45 Y149.55 E.21096
G1 X110.079 Y149.55 E.05401
G1 X110.079 Y106.45 F30000
G1 F9938
G1 X108.45 Y106.45 E.05401
G1 X112.873 Y110.873 E.20749
G2 X112.87 Y114.426 I1.889 J1.778 E.1298
G1 X108.45 Y118.846 E.20735
G1 X108.45 Y121.802 E.09807
G1 X118.018 Y131.37 E.44885
G2 X118.241 Y132.083 I7.251 J-1.878 E.02478
G1 X108.45 Y141.874 E.45931
G1 X108.45 Y144.83 E.09807
G1 X113.17 Y149.55 E.2214
G1 X116.126 Y149.55 E.09807
G1 X125.917 Y139.759 E.45928
G2 X126.635 Y139.987 I7.684 J-22.991 E.02501
G1 X136.198 Y149.55 E.4486
G1 X139.154 Y149.55 E.09807
G1 X143.327 Y145.376 E.19577
G3 X143.15 Y141.15 I1.408 J-2.176 E.16415
G1 X138.802 Y136.802 E.20397
G2 X139.876 Y135.579 I-9.369 J-9.312 E.05401
G1 X151.55 Y131.107 F30000
G1 F9938
G1 X151.55 Y129.478 E.05401
G1 X131.478 Y149.55 E.94159
G1 X128.522 Y149.55 E.09807
G1 X108.45 Y129.478 E.94159
G1 X108.45 Y126.522 E.09807
G1 X128.522 Y106.45 E.94159
G1 X131.478 Y106.45 E.09807
G1 X151.55 Y126.522 E.94159
G1 X151.55 Y124.893 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X151.55 Y126.522 E-.61876
G1 X151.287 Y126.259 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 9/15
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
G3 Z2 I.287 J-1.183 P1  F30000
G1 X141.369 Y123.852 Z2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F12745
G1 X141.371 Y123.861 E.00032
G3 X129.698 Y115.901 I-11.371 J4.137 E2.02156
G1 X130.302 Y115.901 E.02002
G3 X141.151 Y123.299 I-.302 J12.097 E.46042
G1 X141.347 Y123.796 E.01771
G1 X141.003 Y123.995 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M73 P71 R3
G1 F12000
G3 X129.708 Y116.294 I-11.003 J4.003 E1.81189
G1 X130.292 Y116.294 E.01794
G3 X140.982 Y123.939 I-.292 J11.705 E.42877
M204 S10000
; WIPE_START
G1 F24000
G1 X141.19 Y124.548 E-.24464
G1 X141.348 Y125.11 E-.22189
G1 X141.478 Y125.68 E-.22186
G1 X141.511 Y125.865 E-.07161
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I1.119 J.478 P1  F30000
G1 X146.702 Y113.722 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F12745
G1 X146.593 Y113.917 E.00743
G3 X144.453 Y110.414 I-1.86 J-1.269 E.2979
G1 X144.677 Y110.398 E.00745
G3 X146.807 Y113.524 I.056 J2.251 E.14901
G1 X146.73 Y113.669 E.00544
G1 X146.298 Y113.64 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X146.157 Y113.844 E.00764
G3 X144.502 Y110.804 I-1.424 J-1.196 E.22217
G1 X144.687 Y110.79 E.0057
G3 X146.365 Y113.538 I.046 J1.859 E.11967
G1 X146.331 Y113.59 E.00189
M204 S10000
; WIPE_START
G1 F24000
G1 X146.157 Y113.844 E-.11729
G1 X145.893 Y114.104 E-.1407
G1 X145.582 Y114.305 E-.14077
G1 X145.238 Y114.44 E-.14038
G1 X144.964 Y114.496 E-.10633
G1 X144.662 Y114.503 E-.11455
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I.01 J-1.217 P1  F30000
G1 X113.193 Y114.254 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F12745
G1 X113.034 Y114.096 E.00743
G3 X114.478 Y110.414 I1.724 J-1.448 E.16018
G1 X114.702 Y110.398 E.00745
G3 X113.355 Y114.409 I.056 J2.251 E.28673
G1 X113.237 Y114.296 E.00544
G1 X113.473 Y113.992 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X113.461 Y113.98 E.00054
G3 X114.527 Y110.804 I1.297 J-1.331 E.12822
G1 X114.712 Y110.79 E.0057
G3 X113.75 Y114.211 I.046 J1.859 E.21362
G1 X113.52 Y114.03 E.00899
M204 S10000
; WIPE_START
G1 F24000
G1 X113.461 Y113.98 E-.02948
G1 X113.221 Y113.698 E-.14071
G1 X113.044 Y113.372 E-.14077
G1 X112.935 Y113.018 E-.14076
G1 X112.907 Y112.835 E-.07048
G1 X112.907 Y112.465 E-.14049
G1 X112.952 Y112.213 E-.09732
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-1.208 J.144 P1  F30000
G1 X116.46 Y141.73 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F12745
G1 X116.484 Y141.754 E.00111
G3 X114.478 Y140.966 I-1.725 J1.446 E.39473
G1 X114.702 Y140.949 E.00745
G3 X116.163 Y141.44 I.056 J2.251 E.05217
G1 X116.417 Y141.688 E.01177
G1 X116.122 Y141.946 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X116.183 Y142.006 E.00264
G3 X114.527 Y141.355 I-1.425 J1.194 E.30192
G1 X114.712 Y141.342 E.0057
G3 X115.918 Y141.747 I.046 J1.859 E.0399
G1 X116.079 Y141.904 E.0069
M204 S10000
; WIPE_START
G1 F24000
G1 X116.183 Y142.006 E-.05539
G1 X116.392 Y142.312 E-.14074
G1 X116.536 Y142.653 E-.14077
G1 X116.609 Y143.016 E-.14078
G1 X116.609 Y143.386 E-.14077
G1 X116.536 Y143.749 E-.1405
G1 X116.535 Y143.751 E-.00106
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-.037 J1.216 P1  F30000
G1 X146.435 Y144.673 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F12745
G1 X146.136 Y144.961 E.01376
G3 X144.453 Y140.966 I-1.403 J-1.761 E.27556
G1 X144.677 Y140.949 E.00745
G3 X146.474 Y144.627 I.056 J2.251 E.17047
G1 X146.179 Y144.366 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X146.157 Y144.396 E.00115
G3 X144.502 Y141.355 I-1.424 J-1.196 E.22217
G1 X144.687 Y141.342 E.0057
G3 X146.365 Y144.09 I.046 J1.859 E.11967
G1 X146.213 Y144.316 E.00838
M204 S10000
; WIPE_START
G1 F24000
G1 X146.157 Y144.396 E-.03702
G1 X145.893 Y144.656 E-.1407
G1 X145.582 Y144.857 E-.14077
G1 X145.323 Y144.965 E-.10664
G1 X144.964 Y145.047 E-.13977
G1 X144.594 Y145.056 E-.14077
G1 X144.453 Y145.031 E-.05434
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-.666 J1.019 P1  F30000
G1 X151.898 Y149.898 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F12745
G1 X108.102 Y149.898 E1.45279
G1 X108.102 Y106.102 E1.45279
G1 X151.898 Y106.102 E1.45279
G1 X151.898 Y149.838 E1.4508
G1 X152.29 Y150.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X107.71 Y150.29 E1.36982
G1 X107.71 Y105.71 E1.36982
G1 X152.29 Y105.71 E1.36982
G1 X152.29 Y150.23 E1.36798
M204 S10000
; WIPE_START
G1 F24000
G1 X150.29 Y150.233 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I.58 J1.07 P1  F30000
G1 X151.55 Y149.55 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12745
G1 X108.45 Y149.55 E1.42968
G1 X108.45 Y106.45 E1.42968
G1 X151.55 Y106.45 E1.42968
G1 X151.55 Y149.49 E1.42769
G1 X149.514 Y149.143 F30000
G1 F12745
G1 X151.143 Y149.143 E.05401
G1 X147.08 Y145.08 E.1906
G2 X147.202 Y141.502 I-2.368 J-1.872 E.12711
G1 X151.143 Y137.561 E.18487
G1 X151.143 Y133.791 E.12508
G1 X142.543 Y125.191 E.40341
G2 X142.08 Y123.596 I-28.379 J7.379 E.05512
G1 X151.143 Y114.533 E.42515
G1 X151.143 Y110.763 E.12508
G1 X147.237 Y106.857 E.18321
G1 X143.467 Y106.857 E.12508
G1 X134.401 Y115.923 E.42529
G2 X132.805 Y115.453 I-8.299 J25.245 E.05519
G1 X124.209 Y106.857 E.40325
G1 X120.439 Y106.857 E.12508
G1 X116.821 Y110.475 E.16971
G3 X117.108 Y114.523 I-2.035 J2.179 E.14808
G3 X116.827 Y114.827 I-2.908 J-2.416 E.01373
G1 X120.91 Y118.91 E.19157
G3 X122.131 Y117.835 I17.533 J18.684 E.05398
G1 X129.69 Y115.553 F30000
G1 F12745
G2 X128.639 Y115.627 I.216 J10.56 E.03494
G1 X128.639 Y115.627 E0
G2 X129.75 Y115.553 I1.382 J12.369 E2.55718
G1 X137.869 Y117.835 F30000
G1 F12745
G3 X139.09 Y118.91 I-16.306 J19.752 E.05398
G1 X142.94 Y115.06 E.18065
G3 X142.947 Y110.243 I1.772 J-2.406 E.18582
G1 X139.561 Y106.857 E.15882
G1 X135.791 Y106.857 E.12508
G1 X127.195 Y115.453 E.40325
G2 X125.599 Y115.923 I6.705 J25.719 E.05519
G1 X116.533 Y106.857 E.42529
G1 X112.763 Y106.857 E.12508
G1 X108.857 Y110.763 E.18321
G1 X108.857 Y114.533 E.12508
G1 X117.92 Y123.596 E.42515
G2 X117.457 Y125.191 I27.921 J8.975 E.05512
G1 X108.857 Y133.791 E.40341
G1 X108.857 Y137.561 E.12508
M73 P72 R3
G1 X112.507 Y141.211 E.1712
G3 X116.875 Y141.079 I2.246 J2.009 E.16217
G1 X120.91 Y137.09 E.18823
G2 X122.131 Y138.165 I17.529 J-18.678 E.05398
G1 X114.495 Y140.617 F30000
G1 F12745
G3 X112.168 Y143.436 I.26 J2.584 E.40686
G1 X111.956 Y143.393 E.00718
G1 X112.082 Y142.769 E.0211
G3 X112.288 Y142.392 I.285 J-.089 E.01594
G3 X114.435 Y140.619 I2.519 J.863 E.09718
G1 X112.28 Y143.155 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
G1 F12745
G1 X112.217 Y143.191 E.00204
G1 X112.265 Y143.219 E.00155
G1 X110.486 Y149.143 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12745
G1 X108.857 Y149.143 E.05401
G1 X112.659 Y145.341 E.17836
G2 X116.753 Y145.457 I2.109 J-2.126 E.1496
G1 X120.439 Y149.143 E.17289
G1 X124.209 Y149.143 E.12508
G1 X132.805 Y140.547 E.40325
G2 X134.401 Y140.077 I-2.799 J-12.453 E.05522
G1 X143.467 Y149.143 E.42529
G1 X147.237 Y149.143 E.12508
G1 X151.143 Y145.237 E.18321
G1 X151.143 Y141.467 E.12508
G1 X142.08 Y132.404 E.42515
G2 X142.543 Y130.809 I-27.918 J-8.975 E.05512
G1 X151.143 Y122.209 E.40341
G1 X151.143 Y118.439 E.12508
G1 X147.141 Y114.438 E.1877
G2 X147.14 Y110.86 I-2.421 J-1.788 E.12709
G1 X151.143 Y106.857 E.18776
G1 X149.514 Y106.857 E.05401
G1 X144.47 Y110.065 F30000
G1 F12745
G3 X142.542 Y114.033 I.267 J2.582 E.36616
G1 X142.542 Y114.033 E0
G3 X144.41 Y110.067 I2.187 J-1.393 E.17325
; WIPE_START
G1 F24000
G1 X143.904 Y110.182 E-.19697
G1 X143.351 Y110.453 E-.23398
G1 X143.011 Y110.698 E-.15931
G1 X142.707 Y111.025 E-.16974
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-1.215 J.072 P1  F30000
G1 X144.469 Y140.617 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F12745
G1 X144.928 Y140.606 E.0152
G3 X144.41 Y140.619 I-.195 J2.594 E.52491
G1 X137.869 Y138.165 F30000
G1 F12745
G2 X139.09 Y137.09 I-16.303 J-19.749 E.05398
G1 X142.858 Y140.858 E.17678
G2 X143.033 Y145.671 I1.853 J2.342 E.18581
G1 X139.561 Y149.143 E.16286
G1 X135.791 Y149.143 E.12508
G1 X127.195 Y140.547 E.40325
G3 X125.599 Y140.077 I2.735 J-12.234 E.05523
G1 X116.533 Y149.143 E.42529
G1 X112.763 Y149.143 E.12508
G1 X108.857 Y145.237 E.18321
G1 X108.857 Y141.467 E.12508
G1 X117.92 Y132.404 E.42515
G1 X117.863 Y132.234 E.00595
G3 X117.457 Y130.809 I12.41 J-4.305 E.04919
G1 X108.857 Y122.209 E.40341
G1 X108.857 Y118.439 E.12508
G1 X112.582 Y114.714 E.17474
G3 X112.585 Y110.585 I2.18 J-2.063 E.15102
G1 X108.857 Y106.857 E.17488
G1 X110.486 Y106.857 E.05401
G1 X114.661 Y110.061 F30000
G1 F12745
G1 X114.661 Y110.061 E0
G2 X115.515 Y110.165 I.121 J2.592 E.51203
G2 X114.721 Y110.06 I-.799 J2.997 E.02667
; WIPE_START
G1 F24000
G1 X115.515 Y110.165 E-.3047
G1 X115.946 Y110.333 E-.17564
G1 X116.381 Y110.615 E-.19696
G1 X116.537 Y110.767 E-.0827
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-1.062 J-.594 P1  F30000
G1 X108.857 Y124.486 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F12745
G1 X108.857 Y126.115 E.05401
G1 X128.115 Y106.857 E.9034
G1 X131.885 Y106.857 E.12508
G1 X151.143 Y126.115 E.9034
G1 X151.143 Y129.885 E.12508
G1 X131.885 Y149.143 E.9034
G1 X128.115 Y149.143 E.12508
G1 X108.857 Y129.885 E.9034
G1 X108.857 Y131.514 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X108.857 Y129.885 E-.61876
G1 X109.12 Y130.148 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 10/15
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
G3 Z2.2 I.233 J1.194 P1  F30000
G1 X141.369 Y123.852 Z2.2
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F12945
G1 X141.371 Y123.861 E.00031
G3 X129.698 Y115.901 I-11.371 J4.137 E2.02156
G1 X130.302 Y115.901 E.02002
G3 X141.151 Y123.299 I-.302 J12.097 E.46042
G1 X141.347 Y123.796 E.01771
G1 X141.003 Y123.995 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X129.708 Y116.294 I-11.003 J4.003 E1.81189
G1 X130.292 Y116.294 E.01794
G3 X140.982 Y123.939 I-.292 J11.705 E.42877
M204 S10000
; WIPE_START
G1 F24000
G1 X141.19 Y124.548 E-.24464
G1 X141.348 Y125.11 E-.22189
G1 X141.478 Y125.68 E-.22186
G1 X141.511 Y125.865 E-.07161
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I1.119 J.478 P1  F30000
G1 X146.67 Y113.794 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F12945
G1 X146.654 Y113.823 E.00111
G3 X144.453 Y110.414 I-1.921 J-1.175 E.30162
G1 X144.677 Y110.398 E.00745
G3 X146.848 Y113.419 I.056 J2.251 E.14528
G1 X146.696 Y113.74 E.01177
G1 X146.301 Y113.645 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X146.095 Y113.914 E.01041
G3 X144.502 Y110.804 I-1.362 J-1.265 E.21932
G1 X144.687 Y110.79 E.0057
G3 X146.334 Y113.594 I.046 J1.859 E.12164
M204 S10000
; WIPE_START
G1 F24000
G1 X146.095 Y113.914 E-.15141
G1 X145.819 Y114.16 E-.1407
G1 X145.498 Y114.345 E-.14077
G1 X145.147 Y114.463 E-.14076
G1 X144.78 Y114.509 E-.14077
G1 X144.66 Y114.5 E-.04559
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I.004 J-1.217 P1  F30000
G1 X113.33 Y114.387 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F12945
G1 X113.034 Y114.096 E.01376
G3 X114.478 Y110.414 I1.724 J-1.448 E.16018
G1 X114.702 Y110.398 E.00745
G3 X113.376 Y114.425 I.056 J2.251 E.28585
G1 X113.5 Y114.008 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X113.335 Y113.844 E.00717
G3 X114.527 Y110.804 I1.424 J-1.196 E.12252
G1 X114.712 Y110.79 E.0057
G3 X113.6 Y114.102 I.046 J1.859 E.21932
G1 X113.544 Y114.05 E.00236
M204 S10000
; WIPE_START
G1 F24000
G1 X113.335 Y113.844 E-.11147
G1 X113.125 Y113.539 E-.14069
G1 X112.981 Y113.198 E-.14078
M73 P73 R3
G1 X112.907 Y112.835 E-.14055
G1 X112.9 Y112.556 E-.10633
G1 X112.948 Y112.243 E-.12018
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-1.208 J.145 P1  F30000
G1 X116.503 Y141.781 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F12945
G1 X116.736 Y142.124 E.01377
G3 X114.478 Y140.966 I-1.978 J1.076 E.37983
G1 X114.702 Y140.949 E.00745
G3 X116.467 Y141.733 I.056 J2.251 E.0662
G1 X116.104 Y141.928 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X116.183 Y142.006 E.0034
G3 X114.527 Y141.355 I-1.425 J1.194 E.30192
G1 X114.712 Y141.342 E.0057
G3 X115.918 Y141.747 I.046 J1.859 E.0399
G1 X116.061 Y141.886 E.00613
M204 S10000
; WIPE_START
G1 F24000
G1 X116.183 Y142.006 E-.06488
G1 X116.392 Y142.312 E-.14074
G1 X116.536 Y142.653 E-.14077
G1 X116.609 Y143.015 E-.14055
G1 X116.616 Y143.295 E-.10633
G1 X116.561 Y143.66 E-.14031
G1 X116.537 Y143.726 E-.02641
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-.035 J1.216 P1  F30000
G1 X146.506 Y144.586 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F12945
G1 X146.222 Y144.889 E.01376
G3 X144.453 Y140.966 I-1.489 J-1.689 E.27929
G1 X144.677 Y140.949 E.00745
G3 X146.543 Y144.539 I.056 J2.251 E.16674
G1 X146.186 Y144.357 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X145.963 Y144.594 E.01002
G3 X144.502 Y141.355 I-1.23 J-1.394 E.21362
G1 X144.687 Y141.342 E.0057
G3 X146.224 Y144.311 I.046 J1.859 E.12772
M204 S10000
; WIPE_START
G1 F24000
G1 X145.963 Y144.594 E-.14664
G1 X145.663 Y144.812 E-.14069
G1 X145.326 Y144.965 E-.14077
G1 X144.964 Y145.047 E-.14076
G1 X144.594 Y145.056 E-.14077
G1 X144.464 Y145.033 E-.05036
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-.666 J1.018 P1  F30000
G1 X151.898 Y149.898 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F12945
G1 X108.102 Y149.898 E1.45279
G1 X108.102 Y106.102 E1.45279
G1 X151.898 Y106.102 E1.45279
G1 X151.898 Y149.838 E1.4508
G1 X152.29 Y150.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X107.71 Y150.29 E1.36982
G1 X107.71 Y105.71 E1.36982
G1 X152.29 Y105.71 E1.36982
G1 X152.29 Y150.23 E1.36798
M204 S10000
; WIPE_START
G1 F24000
G1 X150.29 Y150.233 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I.58 J1.07 P1  F30000
G1 X151.55 Y149.55 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12945
G1 X108.45 Y149.55 E1.42968
G1 X108.45 Y106.45 E1.42968
G1 X151.55 Y106.45 E1.42968
G1 X151.55 Y149.49 E1.42769
G1 X149.514 Y149.143 F30000
G1 F12945
G1 X151.143 Y149.143 E.05401
G1 X147.08 Y145.08 E.1906
G2 X147.202 Y141.502 I-2.341 J-1.871 E.12726
G1 X151.143 Y137.561 E.18487
G1 X151.143 Y133.791 E.12508
G1 X142.543 Y125.191 E.40341
G2 X142.08 Y123.596 I-28.384 J7.38 E.05512
G1 X151.143 Y114.533 E.42515
G1 X151.143 Y110.763 E.12508
G1 X147.237 Y106.857 E.18321
G1 X143.467 Y106.857 E.12508
G1 X134.401 Y115.923 E.42529
G2 X132.805 Y115.453 I-8.299 J25.245 E.05519
G1 X124.209 Y106.857 E.40325
G1 X120.439 Y106.857 E.12508
G1 X116.821 Y110.475 E.16971
G3 X116.957 Y114.687 I-2.023 J2.173 E.1554
G1 X116.827 Y114.827 E.00634
G1 X120.91 Y118.91 E.19157
G3 X122.131 Y117.835 I9.156 J9.169 E.054
G1 X129.69 Y115.553 F30000
G1 F12945
G2 X122.052 Y118.421 I.404 J12.679 E.27554
G1 X122.052 Y118.421 E0
G2 X142.388 Y126.755 I7.951 J9.578 E1.7011
G1 X142.388 Y126.755 E0
G2 X129.75 Y115.553 I-12.395 J1.254 E.61557
G1 X137.869 Y117.835 F30000
G1 F12945
G3 X139.09 Y118.91 I-16.306 J19.752 E.05398
G1 X142.94 Y115.06 E.18065
G3 X142.947 Y110.243 I1.79 J-2.406 E.18552
G1 X139.561 Y106.857 E.15882
G1 X135.791 Y106.857 E.12508
G1 X127.195 Y115.453 E.40325
G2 X125.599 Y115.923 I6.705 J25.719 E.05519
G1 X116.533 Y106.857 E.42529
G1 X112.763 Y106.857 E.12508
G1 X108.857 Y110.763 E.18321
G1 X108.857 Y114.533 E.12508
G1 X117.92 Y123.596 E.42515
G2 X117.457 Y125.191 I27.922 J8.976 E.05512
G1 X108.857 Y133.791 E.40341
G1 X108.857 Y137.561 E.12508
G1 X112.512 Y141.216 E.17145
G1 X112.657 Y141.06 E.00705
G3 X116.898 Y141.102 I2.1 J2.132 E.15639
G1 X120.91 Y137.09 E.18822
G2 X122.131 Y138.165 I17.533 J-18.683 E.05398
G1 X114.495 Y140.617 F30000
G1 F12945
G3 X114.016 Y140.714 I.274 J2.579 E.52429
G1 X114.435 Y140.619 E.01425
; WIPE_START
G1 F24000
G1 X114.016 Y140.714 E-.16329
G1 X113.457 Y140.947 E-.23005
G1 X113.036 Y141.25 E-.19696
G1 X112.732 Y141.577 E-.1697
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-1.167 J-.346 P1  F30000
G1 X110.486 Y149.143 Z2.4
G1 Z2
G1 E.8 F1800
G1 F12945
G1 X108.857 Y149.143 E.05401
G1 X112.659 Y145.341 E.17836
G1 X112.697 Y145.378 E.00176
G2 X116.753 Y145.457 I2.072 J-2.22 E.14736
G1 X120.439 Y149.143 E.17289
G1 X124.209 Y149.143 E.12508
G1 X132.805 Y140.547 E.40325
G2 X134.401 Y140.077 I-2.799 J-12.453 E.05522
G1 X143.467 Y149.143 E.42529
G1 X147.237 Y149.143 E.12508
G1 X151.143 Y145.237 E.18321
G1 X151.143 Y141.467 E.12508
G1 X142.08 Y132.404 E.42515
G2 X142.543 Y130.809 I-27.92 J-8.975 E.05512
G1 X151.143 Y122.209 E.40341
G1 X151.143 Y118.439 E.12508
G1 X147.149 Y114.445 E.18737
G2 X147.408 Y114.021 I-4.27 J-2.901 E.01649
G2 X147.14 Y110.86 I-2.641 J-1.368 E.11098
G1 X151.143 Y106.857 E.18776
G1 X149.514 Y106.857 E.05401
G1 X144.47 Y110.065 F30000
G1 F12945
G3 X145.218 Y110.105 I.276 J1.87 E.02502
G1 X145.438 Y110.144 E.00742
G3 X144.41 Y110.067 I-.705 J2.504 E.50771
; WIPE_START
G1 F24000
G1 X143.904 Y110.182 E-.19696
G1 X143.432 Y110.396 E-.19697
G1 X143.011 Y110.698 E-.19696
G1 X142.708 Y111.024 E-.16911
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-1.215 J.072 P1  F30000
M73 P74 R3
G1 X144.469 Y140.617 Z2.4
G1 Z2
G1 E.8 F1800
G1 F12945
G1 X144.928 Y140.606 E.0152
G3 X144.41 Y140.619 I-.195 J2.595 E.52523
G1 X137.869 Y138.165 F30000
G1 F12945
G2 X139.09 Y137.09 I-16.303 J-19.748 E.05398
G1 X142.858 Y140.858 E.17678
G2 X143.033 Y145.671 I1.867 J2.342 E.18558
G1 X139.561 Y149.143 E.16286
G1 X135.791 Y149.143 E.12508
G1 X127.195 Y140.547 E.40325
G3 X125.599 Y140.077 I2.735 J-12.234 E.05523
G1 X116.533 Y149.143 E.42529
G1 X112.763 Y149.143 E.12508
G1 X108.857 Y145.237 E.18321
G1 X108.857 Y141.467 E.12508
G1 X117.92 Y132.404 E.42515
G3 X117.457 Y130.809 I12.929 J-4.621 E.05514
G1 X108.857 Y122.209 E.40341
G1 X108.857 Y118.439 E.12508
G1 X112.582 Y114.714 E.17474
G3 X112.317 Y110.897 I2.141 J-2.066 E.13785
G1 X112.317 Y110.897 E0
G3 X112.585 Y110.585 I.905 J.508 E.01373
G1 X108.857 Y106.857 E.17488
G1 X110.486 Y106.857 E.05401
G1 X114.793 Y110.058 F30000
G1 F12945
G2 X115.618 Y110.205 I-.036 J2.591 E.5121
G2 X114.853 Y110.057 I-.936 J2.782 E.02591
; WIPE_START
G1 F24000
G1 X115.618 Y110.205 E-.29596
G1 X115.946 Y110.333 E-.13381
G1 X116.381 Y110.615 E-.19696
G1 X116.632 Y110.86 E-.13326
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-1.057 J-.603 P1  F30000
G1 X108.857 Y124.486 Z2.4
G1 Z2
G1 E.8 F1800
G1 F12945
G1 X108.857 Y126.115 E.05401
G1 X128.115 Y106.857 E.9034
G1 X131.885 Y106.857 E.12508
G1 X151.143 Y126.115 E.9034
G1 X151.143 Y129.885 E.12508
G1 X131.885 Y149.143 E.9034
G1 X128.115 Y149.143 E.12508
G1 X108.857 Y129.885 E.9034
G1 X108.857 Y131.514 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 2.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X108.857 Y129.885 E-.61876
G1 X109.12 Y130.148 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 11/15
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
G3 Z2.4 I.233 J1.194 P1  F30000
G1 X141.369 Y123.852 Z2.4
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F12964
G1 X141.371 Y123.861 E.00031
G3 X129.698 Y115.901 I-11.371 J4.137 E2.02156
G1 X130.302 Y115.901 E.02002
G3 X141.151 Y123.299 I-.302 J12.097 E.46042
G1 X141.347 Y123.796 E.01771
G1 X141.004 Y123.995 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X141.189 Y124.549 E.01794
G3 X129.708 Y116.294 I-11.189 J3.449 E1.79395
G1 X130.292 Y116.294 E.01794
G3 X140.983 Y123.94 I-.292 J11.705 E.42881
M204 S10000
; WIPE_START
G1 F24000
G1 X141.189 Y124.549 E-.24417
G1 X141.348 Y125.11 E-.22188
G1 X141.478 Y125.68 E-.22186
G1 X141.511 Y125.867 E-.07209
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I1.119 J.478 P1  F30000
G1 X146.67 Y113.794 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F12964
G1 X146.654 Y113.823 E.00111
G3 X144.453 Y110.414 I-1.921 J-1.175 E.30162
G1 X144.677 Y110.398 E.00745
G3 X146.848 Y113.419 I.056 J2.251 E.14528
G1 X146.696 Y113.74 E.01177
G1 X146.304 Y113.642 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X146.095 Y113.914 E.01052
G3 X144.502 Y110.804 I-1.362 J-1.265 E.21932
G1 X144.687 Y110.79 E.0057
G3 X146.336 Y113.591 I.046 J1.859 E.12153
M204 S10000
; WIPE_START
G1 F24000
G1 X146.095 Y113.914 E-.15283
G1 X145.819 Y114.16 E-.14069
G1 X145.498 Y114.345 E-.14077
G1 X145.147 Y114.463 E-.14076
G1 X144.78 Y114.509 E-.14078
G1 X144.663 Y114.506 E-.04417
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I.005 J-1.217 P1  F30000
G1 X113.328 Y114.386 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F12964
G1 X113.034 Y114.096 E.01368
G3 X114.478 Y110.414 I1.724 J-1.448 E.16018
G1 X114.702 Y110.398 E.00745
G3 X113.374 Y114.424 I.056 J2.251 E.28593
G1 X113.515 Y114.023 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X113.335 Y113.844 E.0078
G3 X114.527 Y110.804 I1.424 J-1.196 E.12252
G1 X114.712 Y110.79 E.0057
G3 X113.6 Y114.102 I.046 J1.859 E.21932
G1 X113.559 Y114.064 E.00173
M204 S10000
; WIPE_START
G1 F24000
G1 X113.335 Y113.844 E-.11922
G1 X113.125 Y113.539 E-.1407
G1 X112.981 Y113.198 E-.14076
G1 X112.907 Y112.835 E-.1406
G1 X112.9 Y112.555 E-.10636
G1 X112.945 Y112.263 E-.11236
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I-1.208 J.146 P1  F30000
G1 X116.503 Y141.781 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F12964
G1 X116.736 Y142.124 E.01377
G3 X114.478 Y140.966 I-1.978 J1.076 E.37983
G1 X114.702 Y140.949 E.00745
G3 X116.467 Y141.733 I.056 J2.251 E.06619
G1 X116.083 Y141.907 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X116.183 Y142.006 E.00432
G3 X114.527 Y141.355 I-1.425 J1.194 E.30192
G1 X114.712 Y141.342 E.0057
G3 X115.918 Y141.747 I.046 J1.859 E.0399
G1 X116.04 Y141.865 E.00522
M204 S10000
; WIPE_START
G1 F24000
G1 X116.183 Y142.006 E-.07622
G1 X116.392 Y142.312 E-.14076
G1 X116.536 Y142.653 E-.14076
G1 X116.609 Y143.016 E-.1406
G1 X116.616 Y143.295 E-.10636
G1 X116.561 Y143.66 E-.14024
G1 X116.547 Y143.698 E-.01506
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I-.036 J1.216 P1  F30000
G1 X146.506 Y144.586 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F12964
G1 X146.222 Y144.889 E.01376
G3 X144.453 Y140.966 I-1.489 J-1.689 E.27929
G1 X144.677 Y140.949 E.00745
G3 X146.543 Y144.539 I.056 J2.251 E.16674
G1 X146.188 Y144.355 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X145.963 Y144.594 E.01012
G3 X144.502 Y141.355 I-1.23 J-1.394 E.21362
G1 X144.687 Y141.342 E.0057
G3 X146.226 Y144.308 I.046 J1.859 E.12763
M204 S10000
; WIPE_START
G1 F24000
G1 X145.963 Y144.594 E-.14784
G1 X145.663 Y144.812 E-.14069
G1 X145.326 Y144.965 E-.14077
G1 X144.964 Y145.047 E-.14076
G1 X144.594 Y145.056 E-.14077
G1 X144.467 Y145.034 E-.04917
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I-.666 J1.018 P1  F30000
G1 X151.898 Y149.898 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F12964
G1 X108.102 Y149.898 E1.45279
G1 X108.102 Y106.102 E1.45279
G1 X151.898 Y106.102 E1.45279
G1 X151.898 Y149.838 E1.4508
G1 X152.29 Y150.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X107.71 Y150.29 E1.36982
G1 X107.71 Y105.71 E1.36982
G1 X152.29 Y105.71 E1.36982
G1 X152.29 Y150.23 E1.36798
M204 S10000
; WIPE_START
G1 F24000
G1 X150.29 Y150.233 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I.58 J1.07 P1  F30000
G1 X151.55 Y149.55 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12964
G1 X108.45 Y149.55 E1.42968
G1 X108.45 Y106.45 E1.42968
G1 X151.55 Y106.45 E1.42968
G1 X151.55 Y149.49 E1.42769
G1 X149.514 Y149.143 F30000
G1 F12964
G1 X151.143 Y149.143 E.05401
G1 X147.08 Y145.08 E.1906
G2 X147.202 Y141.502 I-2.346 J-1.871 E.12723
G1 X151.143 Y137.561 E.18487
G1 X151.143 Y133.791 E.12508
G1 X142.543 Y125.191 E.40341
G2 X142.08 Y123.596 I-28.38 J7.379 E.05512
G1 X151.143 Y114.533 E.42515
G1 X151.143 Y110.763 E.12508
G1 X147.237 Y106.857 E.18321
G1 X143.467 Y106.857 E.12508
G1 X134.401 Y115.923 E.42529
G2 X132.805 Y115.453 I-8.299 J25.245 E.05519
G1 X124.209 Y106.857 E.40325
G1 X120.439 Y106.857 E.12508
G1 X116.821 Y110.475 E.16971
G3 X116.827 Y114.827 I-2.037 J2.178 E.16179
G1 X120.91 Y118.91 E.19157
G3 X122.131 Y117.835 I9.362 J9.402 E.054
G1 X129.69 Y115.553 F30000
G1 F12964
G2 X128.639 Y115.627 I.216 J10.56 E.03494
G1 X128.639 Y115.627 E0
G2 X129.75 Y115.553 I1.382 J12.37 E2.55738
G1 X137.869 Y117.835 F30000
G1 F12964
G3 X139.09 Y118.91 I-16.305 J19.751 E.05398
G1 X142.94 Y115.06 E.18065
G3 X142.947 Y110.243 I1.787 J-2.406 E.18556
G1 X139.561 Y106.857 E.15882
M73 P75 R3
G1 X135.791 Y106.857 E.12508
G1 X127.195 Y115.453 E.40325
G2 X125.599 Y115.923 I6.705 J25.719 E.05519
G1 X116.533 Y106.857 E.42529
G1 X112.763 Y106.857 E.12508
G1 X108.857 Y110.763 E.18321
G1 X108.857 Y114.533 E.12508
G1 X117.92 Y123.596 E.42515
G2 X117.457 Y125.191 I27.922 J8.976 E.05512
G1 X108.857 Y133.791 E.40341
G1 X108.857 Y137.561 E.12508
G1 X112.512 Y141.216 E.17145
G3 X116.898 Y141.102 I2.246 J1.988 E.16325
G1 X120.91 Y137.09 E.18822
G2 X122.131 Y138.165 I17.53 J-18.68 E.05398
G1 X114.495 Y140.617 F30000
G1 F12964
G1 X114.953 Y140.606 E.0152
G3 X114.435 Y140.619 I-.195 J2.595 E.52516
; WIPE_START
G1 F24000
G1 X113.929 Y140.734 E-.19696
G1 X113.457 Y140.947 E-.19695
G1 X113.036 Y141.25 E-.19696
G1 X112.733 Y141.576 E-.16913
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I-1.167 J-.347 P1  F30000
G1 X110.486 Y149.143 Z2.6
G1 Z2.2
G1 E.8 F1800
G1 F12964
G1 X108.857 Y149.143 E.05401
G1 X112.659 Y145.341 E.17836
G1 X112.75 Y145.428 E.00418
G2 X116.753 Y145.457 I2.018 J-2.216 E.14545
G1 X120.439 Y149.143 E.17289
G1 X124.209 Y149.143 E.12508
G1 X132.805 Y140.547 E.40325
G2 X134.401 Y140.077 I-2.799 J-12.453 E.05522
G1 X143.467 Y149.143 E.42529
G1 X147.237 Y149.143 E.12508
G1 X151.143 Y145.237 E.18321
G1 X151.143 Y141.467 E.12508
G1 X142.08 Y132.404 E.42515
G2 X142.543 Y130.809 I-27.919 J-8.975 E.05512
G1 X151.143 Y122.209 E.40341
G1 X151.143 Y118.439 E.12508
G1 X147.149 Y114.445 E.18737
G2 X147.408 Y114.021 I-4.27 J-2.901 E.01649
G2 X147.629 Y111.851 I-2.704 J-1.372 E.07399
G1 X147.629 Y111.851 E0
G2 X147.14 Y110.86 I-3.255 J.989 E.03684
G1 X151.143 Y106.857 E.18776
G1 X149.514 Y106.857 E.05401
G1 X144.47 Y110.065 F30000
G1 F12964
G3 X147.072 Y111.53 I.253 J2.594 E.10547
G1 X147.072 Y111.53 E0
G3 X144.41 Y110.067 I-2.349 J1.121 E.43497
; WIPE_START
G1 F24000
G1 X143.904 Y110.182 E-.19696
G1 X143.432 Y110.396 E-.19696
G1 X143.011 Y110.698 E-.19696
G1 X142.708 Y111.024 E-.16911
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I-1.215 J.072 P1  F30000
G1 X144.47 Y140.617 Z2.6
G1 Z2.2
G1 E.8 F1800
G1 F12964
G3 X144.451 Y145.781 I.262 J2.583 E.28863
G1 X144.451 Y145.781 E0
G3 X143.936 Y145.671 I.016 J-1.328 E.01758
G1 X143.936 Y145.671 E0
G3 X142.204 Y142.607 I.819 J-2.485 E.12805
G1 X142.204 Y142.607 E0
G3 X144.41 Y140.619 I2.572 J.635 E.10459
G1 X137.869 Y138.165 F30000
G1 F12964
G2 X139.09 Y137.09 I-16.303 J-19.749 E.05398
G1 X142.858 Y140.858 E.17678
G2 X143.033 Y145.671 I1.868 J2.342 E.18557
G1 X139.561 Y149.143 E.16286
G1 X135.791 Y149.143 E.12508
G1 X127.195 Y140.547 E.40325
G3 X125.599 Y140.077 I2.735 J-12.234 E.05523
G1 X116.533 Y149.143 E.42529
G1 X112.763 Y149.143 E.12508
G1 X108.857 Y145.237 E.18321
G1 X108.857 Y141.467 E.12508
G1 X117.92 Y132.404 E.42515
G3 X117.457 Y130.809 I13.071 J-4.662 E.05514
G1 X108.857 Y122.209 E.40341
G1 X108.857 Y118.439 E.12508
G1 X112.582 Y114.714 E.17474
G3 X112.585 Y110.585 I2.176 J-2.063 E.15106
G1 X108.857 Y106.857 E.17488
G1 X110.486 Y106.857 E.05401
G1 X114.716 Y110.06 F30000
G1 F12964
G1 X114.716 Y110.06 E0
G2 X115.946 Y110.333 I.068 J2.596 E.49908
G2 X114.776 Y110.058 I-1.218 J2.555 E.04016
; WIPE_START
G1 F24000
G1 X115.463 Y110.144 E-.26307
G1 X115.946 Y110.333 E-.19696
G1 X116.381 Y110.615 E-.19696
G1 X116.575 Y110.804 E-.10301
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I-1.06 J-.598 P1  F30000
G1 X108.857 Y124.486 Z2.6
G1 Z2.2
G1 E.8 F1800
G1 F12964
G1 X108.857 Y126.115 E.05401
G1 X128.115 Y106.857 E.9034
G1 X131.885 Y106.857 E.12508
G1 X151.143 Y126.115 E.9034
G1 X151.143 Y129.885 E.12508
G1 X131.885 Y149.143 E.9034
G1 X128.115 Y149.143 E.12508
G1 X108.857 Y129.885 E.9034
G1 X108.857 Y131.514 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 2.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X108.857 Y129.885 E-.61876
G1 X109.12 Y130.148 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 12/15
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
G3 Z2.6 I.233 J1.194 P1  F30000
G1 X141.369 Y123.852 Z2.6
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F12929
G1 X141.371 Y123.861 E.00031
G3 X129.698 Y115.901 I-11.371 J4.137 E2.02156
G1 X130.302 Y115.901 E.02002
G3 X141.151 Y123.299 I-.302 J12.097 E.46042
G1 X141.347 Y123.796 E.01771
G1 X141.004 Y123.995 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X141.189 Y124.549 E.01793
G3 X129.708 Y116.294 I-11.189 J3.449 E1.79395
G1 X130.292 Y116.294 E.01794
G3 X140.983 Y123.94 I-.292 J11.705 E.42881
M204 S10000
; WIPE_START
G1 F24000
G1 X141.189 Y124.549 E-.24417
G1 X141.348 Y125.11 E-.22188
G1 X141.478 Y125.68 E-.22186
G1 X141.511 Y125.867 E-.07209
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I1.12 J.476 P1  F30000
G1 X146.573 Y113.944 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F12929
M73 P76 R3
G1 X146.304 Y114.261 E.01376
G3 X144.453 Y110.414 I-1.571 J-1.612 E.28301
G1 X144.677 Y110.398 E.00745
G3 X146.608 Y113.895 I.056 J2.251 E.16302
G1 X146.3 Y113.643 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X146.269 Y113.696 E.00191
G3 X144.502 Y110.804 I-1.536 J-1.048 E.22786
G1 X144.687 Y110.79 E.0057
G3 X146.446 Y113.372 I.046 J1.859 E.11397
G1 X146.328 Y113.59 E.00761
M204 S10000
; WIPE_START
G1 F24000
G1 X146.269 Y113.696 E-.04647
G1 X146.032 Y113.981 E-.1407
G1 X145.742 Y114.212 E-.14077
G1 X145.415 Y114.38 E-.13977
G1 X145.147 Y114.463 E-.10665
G1 X144.78 Y114.509 E-.14076
G1 X144.662 Y114.5 E-.04487
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I.008 J-1.217 P1  F30000
G1 X113.211 Y114.283 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F12929
G1 X113.187 Y114.261 E.00111
G3 X114.478 Y110.414 I1.571 J-1.612 E.16762
G1 X114.702 Y110.398 E.00745
G3 X113.537 Y114.54 I.056 J2.251 E.27929
G1 X113.259 Y114.32 E.01177
G1 X113.52 Y114.03 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X113.461 Y113.98 E.00239
G3 X114.527 Y110.804 I1.297 J-1.331 E.12821
G1 X114.712 Y110.79 E.0057
G3 X113.75 Y114.211 I.046 J1.859 E.21362
G1 X113.567 Y114.067 E.00714
M204 S10000
; WIPE_START
G1 F24000
G1 X113.461 Y113.98 E-.05234
G1 X113.221 Y113.698 E-.1407
G1 X113.044 Y113.372 E-.14076
G1 X112.981 Y113.198 E-.07048
G1 X112.907 Y112.835 E-.14077
G1 X112.907 Y112.464 E-.14077
G1 X112.946 Y112.273 E-.07418
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I-1.209 J.139 P1  F30000
G1 X116.305 Y141.568 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F12929
G1 X116.331 Y141.589 E.00111
G3 X114.478 Y140.966 I-1.573 J1.611 E.40218
G1 X114.702 Y140.949 E.00745
G3 X115.98 Y141.309 I.056 J2.251 E.04472
G1 X116.258 Y141.53 E.01178
G1 X116.064 Y141.878 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X116.295 Y142.154 E.01106
G3 X114.527 Y141.355 I-1.537 J1.046 E.29623
G1 X114.712 Y141.342 E.0057
G3 X116.021 Y141.836 I.046 J1.859 E.04409
M204 S10000
; WIPE_START
G1 F24000
G1 X116.295 Y142.154 E-.15938
G1 X116.472 Y142.479 E-.14075
G1 X116.536 Y142.653 E-.07048
G1 X116.609 Y143.016 E-.14077
G1 X116.609 Y143.386 E-.14077
G1 X116.553 Y143.665 E-.10785
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I-.041 J1.216 P1  F30000
G1 X146.435 Y144.673 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F12929
G1 X146.136 Y144.961 E.01376
G3 X144.453 Y140.966 I-1.403 J-1.761 E.27556
G1 X144.677 Y140.949 E.00745
G3 X146.474 Y144.627 I.056 J2.251 E.17046
G1 X146.186 Y144.357 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X146.157 Y144.396 E.00149
G3 X144.502 Y141.355 I-1.424 J-1.196 E.22217
G1 X144.687 Y141.342 E.0057
G3 X146.365 Y144.09 I.046 J1.859 E.11967
G1 X146.219 Y144.307 E.00804
M204 S10000
; WIPE_START
G1 F24000
G1 X146.157 Y144.396 E-.04121
G1 X145.893 Y144.656 E-.14069
G1 X145.582 Y144.857 E-.14077
G1 X145.239 Y144.991 E-.13977
G1 X144.964 Y145.047 E-.10664
G1 X144.594 Y145.056 E-.14077
G1 X144.464 Y145.033 E-.05014
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I-.666 J1.018 P1  F30000
G1 X151.898 Y149.898 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F12929
G1 X108.102 Y149.898 E1.45279
G1 X108.102 Y106.102 E1.45279
G1 X151.898 Y106.102 E1.45279
G1 X151.898 Y149.838 E1.4508
G1 X152.29 Y150.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X107.71 Y150.29 E1.36982
G1 X107.71 Y105.71 E1.36982
G1 X152.29 Y105.71 E1.36982
G1 X152.29 Y150.23 E1.36798
M204 S10000
; WIPE_START
G1 F24000
G1 X150.29 Y150.233 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I.58 J1.07 P1  F30000
G1 X151.55 Y149.55 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12929
G1 X108.45 Y149.55 E1.42968
G1 X108.45 Y106.45 E1.42968
G1 X151.55 Y106.45 E1.42968
G1 X151.55 Y149.49 E1.42769
G1 X149.514 Y149.143 F30000
G1 F12929
G1 X151.143 Y149.143 E.05401
G1 X147.08 Y145.08 E.1906
G2 X147.214 Y141.52 I-2.351 J-1.871 E.1265
G1 X151.143 Y137.561 E.185
G1 X151.143 Y133.791 E.12508
G1 X142.543 Y125.191 E.40341
G2 X142.08 Y123.596 I-28.379 J7.379 E.05512
G1 X151.143 Y114.533 E.42515
G1 X151.143 Y110.763 E.12508
G1 X147.237 Y106.857 E.18321
G1 X143.467 Y106.857 E.12508
G1 X134.401 Y115.923 E.42529
G2 X132.805 Y115.453 I-8.299 J25.245 E.05519
G1 X124.209 Y106.857 E.40325
G1 X120.439 Y106.857 E.12508
G1 X116.821 Y110.475 E.16971
G3 X116.943 Y114.701 I-2.014 J2.173 E.15614
G1 X116.827 Y114.827 E.0057
G1 X120.91 Y118.91 E.19157
G3 X122.131 Y117.835 I17.532 J18.682 E.05398
G1 X129.69 Y115.553 F30000
G1 F12929
G2 X130.31 Y115.553 I.311 J12.439 E2.57282
G1 X129.75 Y115.553 E.0186
G1 X137.869 Y117.835 F30000
G1 F12929
G3 X139.09 Y118.91 I-16.306 J19.752 E.05398
G1 X142.94 Y115.06 E.18065
G3 X142.947 Y110.243 I1.781 J-2.406 E.18566
G1 X139.561 Y106.857 E.15882
G1 X135.791 Y106.857 E.12508
G1 X127.195 Y115.453 E.40325
G2 X125.599 Y115.923 I6.705 J25.719 E.05519
G1 X116.533 Y106.857 E.42529
G1 X112.763 Y106.857 E.12508
G1 X108.857 Y110.763 E.18321
G1 X108.857 Y114.533 E.12508
G1 X117.92 Y123.596 E.42515
G2 X117.457 Y125.191 I27.92 J8.975 E.05512
G1 X108.857 Y133.791 E.40341
G1 X108.857 Y137.561 E.12508
G1 X112.512 Y141.216 E.17145
G3 X116.873 Y141.077 I2.246 J1.98 E.16216
G1 X120.91 Y137.09 E.18824
G2 X122.131 Y138.165 I17.53 J-18.68 E.05398
G1 X114.495 Y140.617 F30000
G1 F12929
G3 X115.463 Y140.696 I.29 J2.435 E.03245
G3 X114.118 Y140.691 I-.682 J2.507 E.49633
G1 X114.435 Y140.619 E.01076
; WIPE_START
G1 F24000
G1 X114.118 Y140.691 E-.12323
G1 X113.457 Y140.947 E-.26962
G1 X113.036 Y141.25 E-.19696
M73 P76 R2
G1 X112.731 Y141.578 E-.17019
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I-1.167 J-.346 P1  F30000
G1 X110.486 Y149.143 Z2.8
M73 P77 R2
G1 Z2.4
G1 E.8 F1800
G1 F12929
G1 X108.857 Y149.143 E.05401
G1 X112.659 Y145.341 E.17836
G2 X116.752 Y145.456 I2.11 J-2.178 E.14911
G1 X120.439 Y149.143 E.17293
G1 X124.209 Y149.143 E.12508
G1 X132.805 Y140.547 E.40325
G2 X134.401 Y140.077 I-2.799 J-12.454 E.05522
G1 X143.467 Y149.143 E.42529
G1 X147.237 Y149.143 E.12508
G1 X151.143 Y145.237 E.18321
G1 X151.143 Y141.467 E.12508
G1 X142.08 Y132.404 E.42515
G2 X142.543 Y130.809 I-27.919 J-8.975 E.05512
G1 X151.143 Y122.209 E.40341
G1 X151.143 Y118.439 E.12508
G1 X147.141 Y114.438 E.1877
G1 X147.237 Y114.297 E.00563
G2 X147.14 Y110.86 I-2.5 J-1.65 E.1215
G1 X151.143 Y106.857 E.18776
G1 X149.514 Y106.857 E.05401
G1 X144.47 Y110.065 F30000
G1 F12929
G3 X145.276 Y110.115 I.28 J2.018 E.02697
G1 X145.276 Y110.115 E0
G3 X143.963 Y110.169 I-.554 J2.533 E.49647
G1 X144.41 Y110.067 E.01519
; WIPE_START
G1 F24000
G1 X143.963 Y110.169 E-.17406
G1 X143.432 Y110.396 E-.21946
G1 X143.011 Y110.698 E-.19696
G1 X142.707 Y111.025 E-.16952
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I-1.215 J.072 P1  F30000
G1 X144.469 Y140.617 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F12929
G1 X144.928 Y140.606 E.0152
G3 X144.41 Y140.619 I-.195 J2.594 E.52493
G1 X137.869 Y138.165 F30000
G1 F12929
G2 X139.09 Y137.09 I-16.303 J-19.749 E.05398
G1 X142.858 Y140.858 E.17678
G2 X143.033 Y145.671 I1.867 J2.342 E.18558
G1 X139.561 Y149.143 E.16286
G1 X135.791 Y149.143 E.12508
G1 X127.195 Y140.547 E.40325
G3 X125.599 Y140.077 I2.649 J-11.944 E.05523
G1 X116.533 Y149.143 E.42529
G1 X112.763 Y149.143 E.12508
G1 X108.857 Y145.237 E.18321
G1 X108.857 Y141.467 E.12508
G1 X117.92 Y132.404 E.42515
G1 X117.863 Y132.234 E.00595
G3 X117.457 Y130.809 I12.41 J-4.305 E.04919
G1 X108.857 Y122.209 E.40341
G1 X108.857 Y118.439 E.12508
G1 X112.582 Y114.714 E.17474
G3 X112.585 Y110.585 I2.155 J-2.063 E.15125
G1 X108.857 Y106.857 E.17488
G1 X110.486 Y106.857 E.05401
G1 X114.738 Y110.059 F30000
G1 F12929
G2 X115.946 Y110.333 I.046 J2.595 E.49944
G2 X114.798 Y110.058 I-1.191 J2.433 E.03946
; WIPE_START
G1 F24000
G1 X115.463 Y110.144 E-.25473
G1 X115.946 Y110.333 E-.19696
G1 X116.381 Y110.615 E-.19696
G1 X116.591 Y110.819 E-.11134
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I-1.059 J-.599 P1  F30000
G1 X108.857 Y124.486 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F12929
G1 X108.857 Y126.115 E.05401
G1 X128.115 Y106.857 E.9034
G1 X131.885 Y106.857 E.12508
G1 X151.143 Y126.115 E.9034
G1 X151.143 Y129.885 E.12508
G1 X131.885 Y149.143 E.9034
G1 X128.115 Y149.143 E.12508
G1 X108.857 Y129.885 E.9034
G1 X108.857 Y131.514 E.05401
M106 S155.55
; CHANGE_LAYER
; Z_HEIGHT: 2.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X108.857 Y129.885 E-.61876
G1 X109.12 Y130.148 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 13/15
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
G3 Z2.8 I.233 J1.194 P1  F30000
G1 X141.369 Y123.852 Z2.8
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X141.371 Y123.861 E.00031
G3 X129.698 Y115.901 I-11.371 J4.137 E2.02156
G1 X130.302 Y115.901 E.02002
G3 X141.151 Y123.299 I-.302 J12.097 E.46042
G1 X141.347 Y123.796 E.01771
G1 X141.004 Y123.995 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X141.003 Y123.995 E.00004
G3 X129.708 Y116.294 I-11.003 J4.003 E1.81189
G1 X130.292 Y116.294 E.01794
G3 X140.79 Y123.452 I-.292 J11.705 E.41267
G1 X140.982 Y123.939 E.01609
M204 S10000
; WIPE_START
G1 F24000
G1 X141.003 Y123.995 E-.02289
G1 X141.19 Y124.548 E-.22185
G1 X141.348 Y125.11 E-.22189
G1 X141.478 Y125.68 E-.22186
G1 X141.511 Y125.865 E-.07151
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I1.12 J.477 P1  F30000
G1 X146.611 Y113.889 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X146.593 Y113.917 E.0011
G3 X144.453 Y110.414 I-1.86 J-1.269 E.2979
G1 X144.677 Y110.398 E.00745
G3 X146.807 Y113.524 I.056 J2.251 E.14901
G1 X146.639 Y113.836 E.01178
G1 X146.302 Y113.639 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X146.269 Y113.696 E.00203
G3 X144.502 Y110.804 I-1.536 J-1.048 E.22786
G1 X144.687 Y110.79 E.0057
G3 X146.446 Y113.372 I.046 J1.859 E.11397
G1 X146.33 Y113.586 E.0075
M204 S10000
; WIPE_START
G1 F24000
G1 X146.269 Y113.696 E-.04795
G1 X146.032 Y113.981 E-.1407
G1 X145.742 Y114.212 E-.14077
G1 X145.415 Y114.38 E-.13977
G1 X145.147 Y114.463 E-.10665
G1 X144.78 Y114.509 E-.14077
G1 X144.666 Y114.501 E-.0434
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I.008 J-1.217 P1  F30000
G1 X113.211 Y114.283 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X113.187 Y114.261 E.0011
G3 X114.478 Y110.414 I1.571 J-1.612 E.16763
G1 X114.702 Y110.398 E.00745
G3 X113.537 Y114.54 I.056 J2.251 E.27929
G1 X113.259 Y114.32 E.01177
G1 X113.535 Y114.041 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X113.461 Y113.98 E.00295
G3 X114.527 Y110.804 I1.297 J-1.331 E.12822
G1 X114.712 Y110.79 E.0057
G3 X113.75 Y114.211 I.046 J1.859 E.21362
G1 X113.582 Y114.078 E.00658
M204 S10000
; WIPE_START
G1 F24000
G1 X113.461 Y113.98 E-.05923
G1 X113.221 Y113.698 E-.1407
G1 X113.044 Y113.372 E-.14077
G1 X112.981 Y113.198 E-.07048
G1 X112.907 Y112.835 E-.14077
G1 X112.907 Y112.464 E-.14077
G1 X112.942 Y112.291 E-.06728
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I-1.209 J.139 P1  F30000
G1 X116.323 Y141.597 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X116.484 Y141.754 E.00744
G3 X114.478 Y140.966 I-1.725 J1.446 E.39473
G1 X114.702 Y140.949 E.00745
G3 X116.163 Y141.44 I.056 J2.251 E.05217
G1 X116.28 Y141.555 E.00545
G1 X116.045 Y141.86 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X116.057 Y141.87 E.00047
G3 X114.527 Y141.355 I-1.299 J1.33 E.30762
G1 X114.712 Y141.342 E.0057
G3 X115.767 Y141.639 I.046 J1.859 E.0342
G1 X115.998 Y141.823 E.00907
M204 S10000
; WIPE_START
G1 F24000
G1 X116.057 Y141.87 E-.02863
G1 X116.295 Y142.153 E-.14075
G1 X116.472 Y142.479 E-.14077
G1 X116.582 Y142.833 E-.14077
G1 X116.609 Y143.016 E-.07047
G1 X116.609 Y143.386 E-.14077
G1 X116.558 Y143.639 E-.09784
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I-.04 J1.216 P1  F30000
G1 X146.479 Y144.62 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X146.458 Y144.647 E.00113
G3 X144.453 Y140.966 I-1.724 J-1.447 E.29048
G1 X144.677 Y140.949 E.00745
G3 X146.71 Y144.278 I.056 J2.251 E.15645
G1 X146.512 Y144.571 E.01172
M73 P78 R2
G1 X146.188 Y144.353 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X146.157 Y144.396 E.00161
G3 X144.502 Y141.355 I-1.424 J-1.195 E.22217
G1 X144.687 Y141.342 E.0057
G3 X146.365 Y144.09 I.046 J1.859 E.11967
G1 X146.221 Y144.304 E.00792
M204 S10000
; WIPE_START
G1 F24000
G1 X146.157 Y144.396 E-.04266
G1 X145.963 Y144.597 E-.1064
G1 X145.663 Y144.812 E-.14006
G1 X145.326 Y144.965 E-.14077
G1 X144.964 Y145.047 E-.14076
G1 X144.594 Y145.056 E-.14077
G1 X144.468 Y145.034 E-.04859
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I-.667 J1.018 P1  F30000
G1 X151.898 Y149.898 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X108.102 Y149.898 E1.45279
G1 X108.102 Y106.102 E1.45279
G1 X151.898 Y106.102 E1.45279
G1 X151.898 Y149.838 E1.4508
G1 X152.29 Y150.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X107.71 Y150.29 E1.36982
G1 X107.71 Y105.71 E1.36982
G1 X152.29 Y105.71 E1.36982
G1 X152.29 Y150.23 E1.36798
M204 S10000
; WIPE_START
G1 F24000
G1 X150.29 Y150.233 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I1.023 J-.659 P1  F30000
G1 X144.243 Y140.842 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.400041
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X134.955 Y139.442 E.48106
G3 X134.115 Y139.771 I-3.711 J-8.249 E.0462
G1 X143.139 Y141.131 E.46737
G1 X142.997 Y141.234 E.009
G1 X142.727 Y141.524 E.02029
G1 X133.109 Y140.074 E.49809
G3 X131.819 Y140.335 I-3.117 J-12.112 E.06746
G1 X142.663 Y141.969 E.5616
M106 S155.55
G1 X139.804 Y149.731 F30000
M106 S255
G1 F3000
G1 X108.472 Y145.008 E1.62266
G1 X108.472 Y145.463 E.02331
G1 X135.441 Y149.528 E1.3967
G1 X132.421 Y149.528 E.15464
G1 X108.472 Y145.918 E1.24031
G1 X108.472 Y146.374 E.02331
G1 X129.402 Y149.528 E1.08393
G1 X126.382 Y149.528 E.15464
G1 X108.472 Y146.829 E.92755
G1 X108.472 Y147.284 E.02331
G1 X123.362 Y149.528 E.77116
G1 X120.343 Y149.528 E.15464
G1 X108.472 Y147.739 E.61478
G1 X108.472 Y148.194 E.02331
G1 X117.323 Y149.528 E.4584
G1 X114.303 Y149.528 E.15464
G1 X108.472 Y148.649 E.30202
G1 X108.472 Y149.104 E.02331
G1 X112.627 Y149.731 E.21521
M106 S155.55
; WIPE_START
G1 F24000
G1 X110.65 Y149.433 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I.721 J.98 P1  F30000
G1 X151.731 Y119.215 Z3
G1 Z2.6
G1 E.8 F1800
M106 S255
G1 F3000
G1 X135.374 Y116.749 E.84711
G3 X136.53 Y117.379 I-5.393 J11.286 E.06746
G1 X151.528 Y119.639 E.77673
G1 X151.528 Y120.094 E.02331
G1 X137.401 Y117.965 E.73161
G3 X138.107 Y118.526 I-5.272 J7.349 E.0462
G1 X151.528 Y120.549 E.69507
G1 X151.528 Y121.004 E.02331
G1 X138.709 Y119.072 E.66388
G3 X139.22 Y119.604 I-5.076 J5.385 E.03779
G1 X151.528 Y121.46 E.63742
G1 X151.528 Y121.915 E.02331
G1 X139.669 Y120.127 E.61416
G3 X140.066 Y120.642 I-4.961 J4.236 E.03332
G1 X151.528 Y122.37 E.5936
G1 X151.528 Y122.825 E.02331
G1 X140.419 Y121.151 E.57534
G3 X140.733 Y121.653 I-4.878 J3.396 E.03035
G1 X151.528 Y123.28 E.55909
G1 X151.528 Y123.735 E.02331
G1 X141.012 Y122.15 E.54461
G3 X141.262 Y122.643 I-4.811 J2.743 E.02829
G1 X151.528 Y124.19 E.5317
G1 X151.528 Y124.645 E.02331
G1 X141.482 Y123.131 E.52029
G3 X141.673 Y123.615 I-4.753 J2.159 E.02666
G1 X151.528 Y125.101 E.51038
G1 X151.528 Y125.556 E.02331
G1 X141.841 Y124.096 E.50167
G3 X141.988 Y124.573 I-4.709 J1.709 E.02558
G1 X151.528 Y126.011 E.49407
G1 X151.528 Y126.466 E.02331
G1 X142.115 Y125.047 E.4875
G1 X142.222 Y125.519 E.02476
G1 X151.528 Y126.921 E.48193
G1 X151.528 Y127.376 E.02331
G1 X142.305 Y125.986 E.47763
G3 X142.372 Y126.451 I-4.626 J.896 E.02407
G1 X151.528 Y127.831 E.47421
G1 X151.528 Y128.286 E.02331
M73 P79 R2
G1 X142.422 Y126.914 E.47161
G1 X142.456 Y127.374 E.02364
G1 X151.528 Y128.742 E.46982
G1 X151.528 Y129.197 E.02331
G1 X142.468 Y127.831 E.46922
G3 X142.462 Y128.285 I-5.391 J.163 E.02327
G1 X151.528 Y129.652 E.4695
G1 X151.528 Y130.107 E.02331
G1 X142.448 Y128.738 E.47026
G1 X142.414 Y129.188 E.02311
G1 X151.528 Y130.562 E.47201
G1 X151.528 Y131.017 E.02331
G1 X142.361 Y129.635 E.47477
G3 X142.294 Y130.08 I-4.492 J-.449 E.02306
G1 X151.528 Y131.472 E.47824
G1 X151.528 Y131.927 E.02331
G1 X142.213 Y130.523 E.48243
G1 X142.112 Y130.963 E.02311
G1 X151.528 Y132.383 E.48763
G1 X151.528 Y132.838 E.02331
G1 X141.995 Y131.401 E.49369
G3 X141.864 Y131.836 I-4.428 J-1.097 E.02329
G1 X151.528 Y133.293 E.50049
G1 X151.528 Y133.748 E.02331
G1 X141.718 Y132.269 E.50803
G1 X141.55 Y132.699 E.02364
G1 X151.528 Y134.203 E.51677
G1 X151.528 Y134.658 E.02331
G1 X141.366 Y133.126 E.52631
G3 X141.165 Y133.551 I-4.359 J-1.795 E.02407
G1 X151.528 Y135.113 E.53669
G1 X151.528 Y135.568 E.02331
G1 X140.948 Y133.974 E.54793
G1 X140.706 Y134.392 E.02476
G1 X151.528 Y136.024 E.56045
G1 X151.528 Y136.479 E.02331
G1 X140.445 Y134.808 E.57396
G3 X140.165 Y135.221 I-4.276 J-2.607 E.02558
G1 X151.528 Y136.934 E.58851
G1 X151.528 Y137.389 E.02331
G1 X139.862 Y135.631 E.60417
G3 X139.537 Y136.037 I-4.23 J-3.057 E.02666
G1 X151.528 Y137.844 E.62102
G1 X151.528 Y138.299 E.02331
G1 X139.182 Y136.438 E.63938
G3 X138.799 Y136.836 I-4.172 J-3.642 E.02829
G1 X151.528 Y138.754 E.65924
G1 X151.528 Y139.209 E.02331
G1 X138.385 Y137.228 E.68067
G3 X137.937 Y137.616 I-4.108 J-4.294 E.03035
G1 X151.528 Y139.665 E.70387
G1 X151.528 Y140.12 E.02331
G1 X137.45 Y137.998 E.72907
G3 X136.919 Y138.373 I-4.023 J-5.134 E.03332
G1 X151.528 Y140.575 E.75658
G1 X151.528 Y141.03 E.02331
G1 X136.336 Y138.74 E.78679
G3 X135.691 Y139.098 I-3.907 J-6.281 E.03779
G1 X151.528 Y141.485 E.8202
G1 X151.528 Y141.94 E.02331
G1 X146.385 Y141.165 E.26633
G1 X146.744 Y141.514 E.02562
G1 X146.865 Y141.692 E.01104
G1 X151.528 Y142.395 E.2415
G1 X151.528 Y142.85 E.02331
G1 X147.14 Y142.189 E.22724
G3 X147.289 Y142.667 I-1.107 J.607 E.02579
G1 X151.528 Y143.306 E.21953
G1 X151.528 Y143.761 E.02331
G1 X147.345 Y143.13 E.21667
G1 X147.345 Y143.463 E.01703
G1 X147.32 Y143.582 E.00622
G1 X151.528 Y144.216 E.21791
M73 P80 R2
G1 X151.528 Y144.671 E.02331
G1 X147.221 Y144.022 E.22306
G1 X147.041 Y144.45 E.02378
G1 X151.528 Y145.126 E.2324
G1 X151.528 Y145.581 E.02331
G1 X146.761 Y144.863 E.24689
G1 X146.461 Y145.175 E.02218
G1 X146.349 Y145.256 E.00706
G1 X151.528 Y146.036 E.26821
G1 X151.528 Y146.491 E.02331
G1 X145.728 Y145.617 E.30038
G1 X145.569 Y145.689 E.00894
G1 X145.06 Y145.805 E.02676
G1 X144.537 Y145.818 E.02676
G1 X144.022 Y145.728 E.02676
G1 X143.536 Y145.537 E.02676
G1 X143.058 Y145.215 E.02953
G1 X116.451 Y141.205 E1.37792
G1 X116.769 Y141.514 E.02272
G1 X116.916 Y141.73 E.01335
G1 X151.528 Y146.947 E1.79255
G1 X151.528 Y147.402 E.02331
G1 X117.181 Y142.225 E1.77883
G3 X117.321 Y142.701 I-1.108 J.586 E.02561
G1 X151.528 Y147.857 E1.77153
G1 X151.528 Y148.312 E.02331
G1 X117.37 Y143.163 E1.76903
G3 X117.339 Y143.614 I-1.13 J.15 E.02328
G1 X151.528 Y148.767 E1.77062
G1 X151.528 Y149.222 E.02331
G1 X117.233 Y144.053 E1.77611
G1 X117.047 Y144.48 E.02386
G1 X150.539 Y149.528 E1.73452
G1 X147.519 Y149.528 E.15464
G1 X116.764 Y144.893 E1.59278
G1 X116.346 Y145.285 E.02937
G1 X144.5 Y149.528 E1.45807
G1 X141.48 Y149.528 E.15464
G1 X115.691 Y145.641 E1.33556
G1 X115.498 Y145.718 E.01064
G1 X115.081 Y145.805 E.02182
G1 X114.562 Y145.818 E.02659
G1 X114.047 Y145.728 E.02676
G1 X113.561 Y145.537 E.02676
G1 X113.124 Y145.254 E.02665
G1 X108.472 Y144.553 E.24092
G1 X108.472 Y144.098 E.02331
G1 X112.637 Y144.726 E.21572
G3 X112.357 Y144.229 I1.09 J-.941 E.02941
G1 X108.472 Y143.643 E.20123
G1 X108.472 Y143.188 E.02331
G1 X112.205 Y143.75 E.19334
G3 X112.147 Y143.287 I1.118 J-.376 E.0241
G1 X108.472 Y142.733 E.19033
G1 X108.472 Y142.277 E.02331
G1 X112.168 Y142.835 E.19143
G1 X112.265 Y142.394 E.0231
G1 X108.472 Y141.822 E.19643
G1 X108.472 Y141.367 E.02331
G1 X112.452 Y141.967 E.20612
G1 X112.666 Y141.617 E.02105
G1 X112.725 Y141.553 E.00443
G1 X108.472 Y140.912 E.22028
G1 X108.472 Y140.457 E.02331
G1 X113.126 Y141.159 E.24104
G3 X113.74 Y140.796 I1.204 J1.337 E.03675
G1 X108.472 Y140.002 E.27283
G1 X108.472 Y139.547 E.02331
G1 X142.587 Y144.689 E1.76677
G3 X142.317 Y144.193 I1.091 J-.914 E.02909
G1 X108.472 Y139.092 E1.75282
G1 X108.472 Y138.637 E.02331
G1 X142.173 Y143.716 E1.74535
G3 X142.118 Y143.253 I1.273 J-.387 E.02403
G1 X108.472 Y138.181 E1.74249
M73 P81 R2
G1 X108.472 Y137.726 E.02331
G1 X142.152 Y142.803 E1.74427
G3 X142.259 Y142.364 I1.143 J.046 E.02329
G1 X108.472 Y137.271 E1.74981
G1 X108.472 Y136.816 E.02331
G1 X124.626 Y139.251 E.83662
G3 X123.47 Y138.621 I5.393 J-11.286 E.06746
G1 X108.472 Y136.361 E.77673
G1 X108.472 Y135.906 E.02331
G1 X122.599 Y138.035 E.73161
G3 X121.893 Y137.474 I5.272 J-7.35 E.0462
G1 X108.472 Y135.451 E.69507
G1 X108.472 Y134.996 E.02331
G1 X121.291 Y136.928 E.66388
G3 X120.78 Y136.395 I5.075 J-5.384 E.03779
G1 X108.472 Y134.54 E.63742
G1 X108.472 Y134.085 E.02331
G1 X120.331 Y135.873 E.61416
G3 X119.934 Y135.358 I4.96 J-4.236 E.03332
G1 X108.472 Y133.63 E.5936
G1 X108.472 Y133.175 E.02331
G1 X119.581 Y134.849 E.57534
G3 X119.267 Y134.347 I4.876 J-3.395 E.03035
G1 X108.472 Y132.72 E.55909
G1 X108.472 Y132.265 E.02331
G1 X118.988 Y133.85 E.54461
G3 X118.738 Y133.357 I4.811 J-2.743 E.02829
G1 X108.472 Y131.81 E.5317
G1 X108.472 Y131.355 E.02331
G1 X118.518 Y132.869 E.52029
G3 X118.327 Y132.385 I4.753 J-2.159 E.02666
G1 X108.472 Y130.899 E.51038
G1 X108.472 Y130.444 E.02331
G1 X118.159 Y131.904 E.50167
G3 X118.012 Y131.427 I4.708 J-1.709 E.02558
G1 X108.472 Y129.989 E.49407
G1 X108.472 Y129.534 E.02331
G1 X117.885 Y130.953 E.4875
G1 X117.778 Y130.481 E.02476
G1 X108.472 Y129.079 E.48193
G1 X108.472 Y128.624 E.02331
G1 X117.695 Y130.014 E.47763
G3 X117.628 Y129.549 I4.627 J-.896 E.02407
G1 X108.472 Y128.169 E.47421
G1 X108.472 Y127.714 E.02331
G1 X117.578 Y129.086 E.47161
G1 X117.544 Y128.626 E.02364
G1 X108.472 Y127.258 E.46982
M73 P82 R2
G1 X108.472 Y126.803 E.02331
G1 X117.532 Y128.169 E.46922
G3 X117.535 Y127.714 I4.556 J-.198 E.02329
G1 X108.472 Y126.348 E.46937
G1 X108.472 Y125.893 E.02331
G1 X117.552 Y127.262 E.47026
G1 X117.586 Y126.812 E.02311
G1 X108.472 Y125.438 E.47201
G1 X108.472 Y124.983 E.02331
G1 X117.639 Y126.365 E.47477
G3 X117.706 Y125.919 I4.492 J.45 E.02306
G1 X108.472 Y124.528 E.47824
G1 X108.472 Y124.073 E.02331
G1 X117.787 Y125.477 E.48243
G1 X117.888 Y125.037 E.02311
G1 X108.472 Y123.617 E.48763
G1 X108.472 Y123.162 E.02331
G1 X118.005 Y124.599 E.49369
G3 X118.136 Y124.164 I4.427 J1.097 E.02329
G1 X108.472 Y122.707 E.50049
G1 X108.472 Y122.252 E.02331
G1 X118.282 Y123.731 E.50803
G1 X118.45 Y123.301 E.02364
G1 X108.472 Y121.797 E.51677
G1 X108.472 Y121.342 E.02331
G1 X118.634 Y122.874 E.52631
G3 X118.835 Y122.449 I4.357 J1.794 E.02407
G1 X108.472 Y120.887 E.53669
G1 X108.472 Y120.432 E.02331
G1 X119.052 Y122.026 E.54793
G1 X119.294 Y121.608 E.02476
G1 X108.472 Y119.976 E.56045
G1 X108.472 Y119.521 E.02331
G1 X119.555 Y121.192 E.57396
G3 X119.835 Y120.779 I4.276 J2.608 E.02558
G1 X108.472 Y119.066 E.58851
G1 X108.472 Y118.611 E.02331
G1 X120.138 Y120.369 E.60417
G3 X120.463 Y119.963 I4.23 J3.058 E.02666
G1 X108.472 Y118.156 E.62102
G1 X108.472 Y117.701 E.02331
G1 X120.818 Y119.562 E.63938
G3 X121.201 Y119.164 I4.173 J3.643 E.02829
G1 X108.472 Y117.246 E.65924
M73 P83 R2
G1 X108.472 Y116.791 E.02331
G1 X121.615 Y118.772 E.68067
G3 X122.063 Y118.384 I4.107 J4.293 E.03035
G1 X108.472 Y116.335 E.70387
G1 X108.472 Y115.88 E.02331
G1 X122.55 Y118.002 E.72907
G3 X123.081 Y117.627 I4.023 J5.135 E.03332
G1 X108.472 Y115.425 E.75658
G1 X108.472 Y114.97 E.02331
G1 X123.664 Y117.26 E.78679
G3 X124.309 Y116.902 I3.908 J6.284 E.03779
G1 X108.269 Y114.484 E.83068
M106 S155.55
G1 X117.176 Y106.269 F30000
M106 S255
G1 F3000
G1 X143.673 Y110.263 E1.37224
G1 X143.421 Y110.377 E.01418
G1 X143.072 Y110.628 E.02199
G1 X115.5 Y106.472 E1.42792
G1 X112.481 Y106.472 E.15464
G1 X142.68 Y111.023 E1.56397
G1 X142.413 Y111.438 E.02526
G1 X109.461 Y106.472 E1.70654
G1 X108.472 Y106.472 E.05066
G1 X108.472 Y106.778 E.01567
G1 X142.239 Y111.867 E1.74876
G2 X142.144 Y112.308 I1.046 J.457 E.02325
G1 X108.472 Y107.233 E1.74383
G1 X108.472 Y107.688 E.02331
G1 X142.119 Y112.759 E1.74256
G2 X142.185 Y113.225 I1.338 J.047 E.02418
G1 X108.472 Y108.143 E1.74598
G1 X108.472 Y108.598 E.02331
G1 X142.344 Y113.704 E1.75418
G2 X142.631 Y114.202 I1.377 J-.462 E.02966
G1 X108.472 Y109.053 E1.76907
G1 X108.472 Y109.509 E.02331
G1 X113.643 Y110.288 E.26781
G1 X113.446 Y110.377 E.01106
G1 X113.059 Y110.655 E.02441
G1 X108.472 Y109.964 E.23757
G1 X108.472 Y110.419 E.02331
G1 X112.678 Y111.053 E.21782
G1 X112.419 Y111.469 E.02509
G1 X108.472 Y110.874 E.20443
G1 X108.472 Y111.329 E.02331
G1 X112.246 Y111.898 E.19546
G1 X112.157 Y112.34 E.02308
G1 X108.472 Y111.784 E.19084
G1 X108.472 Y112.239 E.02331
G1 X112.147 Y112.793 E.19033
G1 X112.147 Y112.911 E.00603
G1 X112.217 Y113.259 E.01818
G1 X108.472 Y112.694 E.19397
G1 X108.472 Y113.15 E.02331
G1 X112.384 Y113.739 E.20259
G1 X112.453 Y113.905 E.0092
G1 X112.681 Y114.239 E.02073
G1 X108.472 Y113.605 E.21801
G1 X108.472 Y114.06 E.02331
G1 X113.242 Y114.779 E.24702
G1 X113.561 Y114.985 E.01947
G1 X114.047 Y115.176 E.02676
G1 X114.562 Y115.267 E.02676
G1 X115.085 Y115.254 E.02676
G1 X115.601 Y115.134 E.02714
G1 X125.045 Y116.558 E.48912
G3 X125.885 Y116.229 I3.711 J8.248 E.0462
M73 P84 R2
G1 X116.269 Y114.78 E.49802
G2 X116.705 Y114.391 I-.745 J-1.274 E.03015
G1 X126.891 Y115.926 E.52748
G3 X128.181 Y115.665 I3.118 J12.114 E.06746
G1 X117.005 Y113.981 E.57878
G2 X117.213 Y113.557 I-1.106 J-.803 E.02428
G1 X151.528 Y118.729 E1.77717
G1 X151.528 Y118.274 E.02331
G1 X117.328 Y113.119 E1.77121
G2 X117.37 Y112.67 I-1.089 J-.328 E.02324
G1 X151.528 Y117.819 E1.76903
G1 X151.528 Y117.363 E.02331
G1 X117.334 Y112.21 E1.7709
G2 X117.207 Y111.735 I-1.236 J.076 E.02531
G1 X151.528 Y116.908 E1.77747
G1 X151.528 Y116.453 E.02331
G1 X116.96 Y111.243 E1.79026
M73 P84 R1
G2 X116.522 Y110.722 I-1.508 J.823 E.0351
G1 X143.149 Y114.735 E1.379
G1 X143.536 Y114.985 E.02358
G1 X144.022 Y115.176 E.02676
G1 X144.537 Y115.267 E.02676
G1 X145.059 Y115.254 E.02675
G1 X145.557 Y115.141 E.02611
G1 X145.631 Y115.109 E.00415
G1 X151.528 Y115.998 E.30539
G1 X151.528 Y115.543 E.02331
G1 X146.289 Y114.753 E.27133
G1 X146.369 Y114.701 E.0049
G1 X146.717 Y114.363 E.02485
G1 X151.528 Y115.088 E.24918
G1 X151.528 Y114.633 E.02331
G1 X147.006 Y113.951 E.23418
G1 X147.198 Y113.525 E.02393
G1 X151.528 Y114.178 E.22425
G1 X151.528 Y113.722 E.02331
G1 X147.309 Y113.087 E.21851
G2 X147.345 Y112.637 I-1.095 J-.313 E.02326
G1 X151.528 Y113.267 E.21667
G1 X151.528 Y112.812 E.02331
G1 X147.301 Y112.175 E.2189
G2 X147.167 Y111.7 I-1.243 J.096 E.02548
G1 X151.528 Y112.357 E.22588
G1 X151.528 Y111.902 E.02331
G1 X146.909 Y111.206 E.23921
G2 X146.456 Y110.682 I-1.521 J.859 E.03569
G1 X151.528 Y111.447 E.26267
G1 X151.528 Y110.992 E.02331
M73 P85 R1
G1 X121.54 Y106.472 E1.55308
G1 X124.559 Y106.472 E.15464
G1 X151.528 Y110.537 E1.39669
G1 X151.528 Y110.081 E.02331
G1 X127.579 Y106.472 E1.24031
G1 X130.598 Y106.472 E.15464
G1 X151.528 Y109.626 E1.08393
G1 X151.528 Y109.171 E.02331
G1 X133.618 Y106.472 E.92754
G1 X136.638 Y106.472 E.15464
G1 X151.528 Y108.716 E.77116
G1 X151.528 Y108.261 E.02331
G1 X139.657 Y106.472 E.61478
G1 X142.677 Y106.472 E.15464
G1 X151.528 Y107.806 E.45839
G1 X151.528 Y107.351 E.02331
G1 X145.697 Y106.472 E.30201
G1 X148.716 Y106.472 E.15464
G1 X151.731 Y106.926 E.15612
M106 S155.55
M106 S237.15
; CHANGE_LAYER
; Z_HEIGHT: 2.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X149.753 Y106.628 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 14/15
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
G3 Z3 I-1.094 J-.533 P1  F30000
G1 X141.369 Y123.852 Z3
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X141.372 Y123.861 E.00031
G3 X118.822 Y123.366 I-11.371 J4.138 E1.55881
G1 X118.822 Y123.366 E0
G3 X129.698 Y115.901 I11.178 J4.631 E.46282
G3 X141.152 Y123.299 I.302 J12.097 E.48046
G1 X141.347 Y123.796 E.01771
G1 X141.004 Y123.995 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X141.189 Y124.549 E.01793
G3 X129.708 Y116.294 I-11.189 J3.449 E1.79395
G1 X130.292 Y116.294 E.01794
G3 X140.983 Y123.94 I-.292 J11.705 E.42881
M204 S10000
; WIPE_START
G1 F24000
G1 X141.189 Y124.549 E-.24416
G1 X141.348 Y125.11 E-.22187
G1 X141.478 Y125.68 E-.22186
G1 X141.511 Y125.867 E-.07211
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I1.119 J.478 P1  F30000
G1 X146.67 Y113.794 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X146.654 Y113.823 E.0011
G3 X144.453 Y110.414 I-1.921 J-1.175 E.30162
G1 X144.677 Y110.398 E.00745
G3 X146.848 Y113.419 I.056 J2.251 E.14528
G1 X146.696 Y113.74 E.01178
M73 P86 R1
G1 X146.31 Y113.634 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X146.095 Y113.914 E.01084
G3 X144.502 Y110.804 I-1.362 J-1.265 E.21932
G1 X144.687 Y110.79 E.0057
G3 X146.341 Y113.582 I.046 J1.859 E.12122
M204 S10000
; WIPE_START
G1 F24000
G1 X146.095 Y113.914 E-.15663
G1 X145.819 Y114.16 E-.1407
G1 X145.498 Y114.345 E-.14077
G1 X145.147 Y114.463 E-.14076
G1 X144.78 Y114.509 E-.14077
G1 X144.674 Y114.501 E-.04037
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I.003 J-1.217 P1  F30000
G1 X113.382 Y114.429 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X113.355 Y114.409 E.0011
G3 X114.478 Y110.414 I1.403 J-1.761 E.17507
G1 X114.702 Y110.398 E.00745
G3 X113.732 Y114.652 I.056 J2.251 E.27184
G1 X113.432 Y114.461 E.01178
G1 X113.555 Y114.062 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X113.335 Y113.844 E.00953
G3 X114.527 Y110.804 I1.424 J-1.196 E.12252
G1 X114.712 Y110.79 E.0057
G3 X113.6 Y114.102 I.046 J1.859 E.21932
G1 X113.6 Y114.102 E0
M204 S10000
; WIPE_START
G1 F24000
G1 X113.335 Y113.844 E-.14061
G1 X113.125 Y113.539 E-.14069
G1 X112.981 Y113.198 E-.14077
G1 X112.907 Y112.835 E-.14072
G1 X112.901 Y112.555 E-.10651
G1 X112.936 Y112.319 E-.09069
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I-1.209 J.135 P1  F30000
G1 X116.189 Y141.465 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X116.484 Y141.754 E.01369
G3 X114.478 Y140.966 I-1.725 J1.446 E.39473
G1 X114.702 Y140.949 E.00745
G3 X116.144 Y141.425 I.056 J2.251 E.05137
G1 X116.018 Y141.844 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X116.183 Y142.006 E.0071
G3 X114.527 Y141.355 I-1.425 J1.194 E.30192
G1 X114.712 Y141.342 E.0057
G3 X115.918 Y141.747 I.046 J1.859 E.0399
G1 X115.975 Y141.802 E.00244
M204 S10000
; WIPE_START
G1 F24000
G1 X116.183 Y142.006 E-.1106
G1 X116.392 Y142.312 E-.14074
G1 X116.536 Y142.653 E-.14077
G1 X116.609 Y143.016 E-.14072
G1 X116.616 Y143.296 E-.10652
G1 X116.569 Y143.61 E-.12065
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I-.037 J1.216 P1  F30000
G1 X146.546 Y144.533 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X146.527 Y144.56 E.0011
G3 X144.453 Y140.966 I-1.794 J-1.36 E.29418
G1 X144.677 Y140.949 E.00745
G3 X146.761 Y144.178 I.056 J2.251 E.15273
G1 X146.577 Y144.482 E.01178
G1 X146.194 Y144.348 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X145.963 Y144.594 E.01038
G3 X144.502 Y141.355 I-1.23 J-1.394 E.21362
G1 X144.687 Y141.342 E.0057
G3 X146.231 Y144.301 I.046 J1.859 E.12737
M204 S10000
; WIPE_START
G1 F24000
G1 X145.963 Y144.594 E-.15104
G1 X145.663 Y144.812 E-.14069
G1 X145.326 Y144.965 E-.14077
G1 X144.964 Y145.047 E-.14076
G1 X144.594 Y145.056 E-.14077
G1 X144.475 Y145.035 E-.04596
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I-.667 J1.018 P1  F30000
G1 X151.898 Y149.898 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X108.102 Y149.898 E1.45279
G1 X108.102 Y106.102 E1.45279
G1 X151.898 Y106.102 E1.45279
G1 X151.898 Y149.838 E1.4508
G1 X152.29 Y150.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X107.71 Y150.29 E1.36982
G1 X107.71 Y105.71 E1.36982
G1 X152.29 Y105.71 E1.36982
G1 X152.29 Y150.23 E1.36798
M204 S10000
; WIPE_START
G1 F24000
G1 X150.29 Y150.233 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I.719 J.982 P1  F30000
G1 X150.971 Y149.734 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.420388
G1 F15000
G1 X151.565 Y149.141 E.02581
G1 X151.565 Y148.607 E.01642
G1 X150.607 Y149.565 E.04165
G1 X150.073 Y149.565 E.01642
G1 X151.565 Y148.073 E.06487
G1 X151.565 Y147.539 E.01642
G1 X149.539 Y149.565 E.08809
G1 X149.006 Y149.565 E.01642
G1 X151.565 Y147.006 E.11132
G1 X151.565 Y146.472 E.01642
G1 X148.472 Y149.565 E.13454
G1 X147.938 Y149.565 E.01642
G1 X151.565 Y145.938 E.15776
G1 X151.565 Y145.404 E.01642
G1 X147.404 Y149.565 E.18098
G1 X146.87 Y149.565 E.01642
G1 X151.565 Y144.87 E.2042
G1 X151.565 Y144.337 E.01642
G1 X146.337 Y149.565 E.22742
G1 X145.803 Y149.565 E.01642
G1 X151.565 Y143.803 E.25064
G1 X151.565 Y143.269 E.01642
G1 X145.269 Y149.565 E.27386
G1 X144.735 Y149.565 E.01642
G1 X151.565 Y142.735 E.29708
G1 X151.565 Y142.201 E.01642
G1 X144.201 Y149.565 E.3203
G1 X143.667 Y149.565 E.01642
G1 X151.565 Y141.667 E.34353
G1 X151.565 Y141.134 E.01642
G1 X143.134 Y149.565 E.36675
G1 X142.6 Y149.565 E.01642
G1 X151.565 Y140.6 E.38997
G1 X151.565 Y140.066 E.01642
G1 X142.066 Y149.565 E.41319
G1 X141.532 Y149.565 E.01642
G1 X145.409 Y145.688 E.16862
G3 X144.787 Y145.776 I-.527 J-1.493 E.01942
G1 X140.998 Y149.565 E.16482
G1 X140.465 Y149.565 E.01642
G1 X144.291 Y145.738 E.16646
G3 X143.868 Y145.628 I.061 J-1.103 E.01355
G1 X139.931 Y149.565 E.17126
M73 P87 R1
G1 X139.397 Y149.565 E.01642
G1 X143.495 Y145.467 E.17826
G1 X143.17 Y145.257 E.01188
G1 X138.863 Y149.565 E.18737
G1 X138.329 Y149.565 E.01642
G1 X142.892 Y145.002 E.19847
G3 X142.647 Y144.713 I.593 J-.749 E.01173
G1 X137.795 Y149.565 E.21105
G1 X137.262 Y149.565 E.01642
G1 X142.439 Y144.387 E.22521
G1 X142.281 Y144.012 E.01253
G1 X136.728 Y149.565 E.24154
G1 X136.194 Y149.565 E.01642
G1 X142.182 Y143.577 E.26048
G1 X142.159 Y143.463 E.00356
G1 X142.15 Y143.075 E.01195
G1 X135.66 Y149.565 E.28232
G1 X135.126 Y149.565 E.01642
G1 X142.281 Y142.41 E.31123
G1 X142.402 Y142.078 E.01085
G1 X142.67 Y141.639 E.01585
G1 X143.021 Y141.261 E.01585
G1 X143.439 Y140.96 E.01585
G1 X143.953 Y140.738 E.0172
G1 X151.565 Y133.126 E.33112
G1 X151.565 Y133.66 E.01642
G1 X144.596 Y140.629 E.30314
G3 X145.106 Y140.652 I.197 J1.274 E.01582
G1 X151.565 Y134.194 E.28094
G1 X151.565 Y134.728 E.01642
G1 X145.54 Y140.752 E.26205
G1 X145.922 Y140.904 E.01264
G1 X151.565 Y135.262 E.24544
G1 X151.565 Y135.795 E.01642
G1 X146.247 Y141.113 E.23133
G3 X146.534 Y141.36 I-.467 J.833 E.01172
G1 X151.565 Y136.329 E.21885
G1 X151.565 Y136.863 E.01642
G1 X146.786 Y141.642 E.20786
G1 X147.003 Y141.959 E.01182
G1 X151.565 Y137.397 E.19845
G1 X151.565 Y137.931 E.01642
G1 X147.162 Y142.334 E.19152
G1 X147.206 Y142.438 E.0035
G1 X147.271 Y142.759 E.01004
G1 X151.565 Y138.465 E.18679
G1 X151.565 Y138.998 E.01642
G1 X147.314 Y143.249 E.18489
G1 X147.316 Y143.341 E.00284
G1 X147.232 Y143.865 E.01633
G1 X151.734 Y139.362 E.19586
; WIPE_START
G1 F24000
G1 X150.32 Y140.777 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I.118 J-1.211 P1  F30000
G1 X123.08 Y138.123 Z3.2
G1 Z2.8
G1 E.8 F1800
G1 F15000
G1 X117.21 Y143.992 E.25532
G1 X117.266 Y143.84 E.00499
G1 X117.341 Y143.328 E.01592
G1 X122.645 Y138.024 E.2307
G1 X122.341 Y137.794 E.01172
G1 X117.309 Y142.826 E.21887
G1 X117.211 Y142.391 E.01373
G1 X122.047 Y137.555 E.21035
G3 X121.757 Y137.311 I2.302 J-3.023 E.01166
G1 X117.053 Y142.015 E.20464
G1 X116.844 Y141.69 E.01189
G1 X121.48 Y137.054 E.20167
G3 X121.209 Y136.791 I2.493 J-2.851 E.01162
G1 X116.6 Y141.4 E.20049
G1 X116.321 Y141.145 E.01162
G1 X120.945 Y136.521 E.20115
G3 X120.692 Y136.241 I2.684 J-2.679 E.01163
G1 X115.997 Y140.936 E.20424
G1 X115.624 Y140.775 E.01249
G1 X120.443 Y135.955 E.20965
G1 X120.206 Y135.658 E.01168
G1 X115.2 Y140.665 E.21777
G2 X114.704 Y140.627 I-.341 J1.208 E.01541
G1 X119.976 Y135.355 E.22935
G1 X119.753 Y135.044 E.01176
G1 X114.083 Y140.714 E.24666
G1 X113.934 Y140.748 E.00469
G1 X113.464 Y140.96 E.01585
G1 X113.046 Y141.261 E.01585
G1 X112.696 Y141.639 E.01585
G1 X112.427 Y142.078 E.01585
G1 X112.26 Y142.537 E.01502
G1 X108.435 Y146.362 E.16636
G1 X108.435 Y146.896 E.01642
G1 X112.177 Y143.154 E.16277
G2 X112.221 Y143.644 I1.395 J.123 E.01522
G1 X108.435 Y147.429 E.16466
G1 X108.435 Y147.963 E.01642
G1 X112.33 Y144.069 E.1694
G1 X112.489 Y144.443 E.01252
G1 X108.435 Y148.497 E.17632
G1 X108.435 Y149.031 E.01642
G1 X112.705 Y144.761 E.18574
G2 X112.958 Y145.042 I.822 J-.484 E.0117
G1 X108.435 Y149.565 E.19673
G1 X108.969 Y149.565 E.01642
G1 X113.245 Y145.289 E.18599
G1 X113.569 Y145.498 E.01188
G1 X109.503 Y149.565 E.17688
G1 X110.037 Y149.565 E.01642
G1 X113.951 Y145.651 E.17026
G1 X114.057 Y145.692 E.00352
G1 X114.385 Y145.75 E.01024
G1 X110.571 Y149.565 E.16593
G1 X111.104 Y149.565 E.01642
G1 X114.896 Y145.774 E.16491
G1 X115.08 Y145.769 E.00568
G1 X115.539 Y145.664 E.01447
G1 X111.638 Y149.565 E.16966
G1 X112.172 Y149.565 E.01642
G1 X123.276 Y138.46 E.48303
G1 X123.608 Y138.663 E.01194
G1 X112.706 Y149.565 E.47422
G1 X113.24 Y149.565 E.01642
G1 X123.946 Y138.859 E.46571
G1 X124.291 Y139.047 E.0121
G1 X113.774 Y149.565 E.45752
G1 X114.307 Y149.565 E.01642
G1 X124.65 Y139.222 E.44991
G2 X125.016 Y139.39 I1.868 J-3.578 E.01238
G1 X114.841 Y149.565 E.44259
G1 X115.375 Y149.565 E.01642
G1 X125.391 Y139.548 E.4357
G2 X125.78 Y139.694 I1.649 J-3.821 E.01277
G1 X115.909 Y149.565 E.42939
G1 X116.443 Y149.565 E.01642
G1 X126.177 Y139.83 E.42343
G1 X126.585 Y139.956 E.01313
G1 X116.976 Y149.565 E.41796
G1 X117.51 Y149.565 E.01642
G1 X127.008 Y140.067 E.41316
G2 X127.442 Y140.166 I1.215 J-4.302 E.01371
G1 X118.044 Y149.565 E.40883
G1 X118.578 Y149.565 E.01642
G1 X127.889 Y140.254 E.40501
G1 X128.352 Y140.324 E.01443
G1 X119.112 Y149.565 E.40197
G1 X119.646 Y149.565 E.01642
G1 X128.833 Y140.377 E.39966
G2 X129.33 Y140.414 I.617 J-4.964 E.01534
G1 X120.179 Y149.565 E.39806
G1 X120.713 Y149.565 E.01642
G1 X129.846 Y140.432 E.39728
G2 X130.384 Y140.428 I.232 J-5.386 E.01654
G1 X121.247 Y149.565 E.39744
G1 X121.781 Y149.565 E.01642
G1 X130.946 Y140.399 E.3987
G1 X131.539 Y140.34 E.01834
G1 X122.315 Y149.565 E.40128
G1 X122.848 Y149.565 E.01642
G1 X132.168 Y140.245 E.4054
G2 X132.842 Y140.105 I-1.068 J-6.824 E.02118
G1 X123.382 Y149.565 E.4115
G1 X123.916 Y149.565 E.01642
G1 X133.573 Y139.908 E.42008
G2 X134.379 Y139.636 I-2.319 J-8.206 E.02616
G1 X124.45 Y149.565 E.4319
G1 X124.984 Y149.565 E.01642
G1 X135.305 Y139.244 E.44896
G2 X136.462 Y138.621 I-5.375 J-11.366 E.04043
G1 X125.348 Y149.734 E.48344
G1 X134.423 Y149.734 F30000
G1 F15000
G1 X151.565 Y132.593 E.74566
G1 X151.565 Y132.059 E.01642
G1 X134.059 Y149.565 E.7615
G1 X133.525 Y149.565 E.01642
G1 X151.565 Y131.525 E.78472
G1 X151.565 Y130.991 E.01642
G1 X132.991 Y149.565 E.80794
G1 X132.457 Y149.565 E.01642
G1 X151.565 Y130.457 E.83117
G1 X151.565 Y129.923 E.01642
G1 X131.923 Y149.565 E.85439
G1 X131.39 Y149.565 E.01642
G1 X151.565 Y129.39 E.87761
G1 X151.565 Y128.856 E.01642
G1 X130.856 Y149.565 E.90083
G1 X130.322 Y149.565 E.01642
G1 X151.565 Y128.322 E.92405
G1 X151.565 Y127.788 E.01642
G1 X129.788 Y149.565 E.94727
G1 X129.254 Y149.565 E.01642
G1 X151.565 Y127.254 E.97049
G1 X151.565 Y126.72 E.01642
G1 X128.72 Y149.565 E.99371
G1 X128.187 Y149.565 E.01642
G1 X151.565 Y126.187 E1.01693
G1 X151.565 Y125.653 E.01642
G1 X127.653 Y149.565 E1.04015
G1 X127.119 Y149.565 E.01642
G1 X151.565 Y125.119 E1.06338
G1 X151.565 Y124.585 E.01642
G1 X126.585 Y149.565 E1.0866
G1 X126.051 Y149.565 E.01642
G1 X151.565 Y124.051 E1.10982
G1 X151.565 Y123.518 E.01642
G1 X140.629 Y134.453 E.47568
G2 X141.246 Y133.302 I-12.476 J-7.429 E.04017
G1 X151.565 Y122.984 E.44884
G1 X151.565 Y122.45 E.01642
G1 X141.637 Y132.378 E.43186
G2 X141.91 Y131.571 I-14.79 J-5.453 E.0262
G1 X151.565 Y121.916 E.41999
G1 X151.565 Y121.382 E.01642
G1 X142.102 Y130.845 E.41161
G2 X142.24 Y130.173 I-6.664 J-1.721 E.02111
G1 X151.565 Y120.848 E.4056
G1 X151.565 Y120.315 E.01642
G1 X142.336 Y129.544 E.40146
G2 X142.395 Y128.95 I-5.918 J-.897 E.01836
G1 X151.565 Y119.781 E.39886
G1 X151.565 Y119.247 E.01642
G1 X142.426 Y128.386 E.39753
G2 X142.432 Y127.846 I-5.403 J-.328 E.01661
G1 X151.565 Y118.713 E.39728
G1 X151.565 Y118.179 E.01642
G1 X142.416 Y127.328 E.39795
M73 P88 R1
G1 X142.379 Y126.831 E.01532
G1 X151.565 Y117.646 E.39957
G1 X151.565 Y117.112 E.01642
G1 X142.323 Y126.354 E.40202
G2 X142.252 Y125.891 I-4.672 J.48 E.01441
G1 X151.565 Y116.578 E.40511
G1 X151.565 Y116.044 E.01642
G1 X142.167 Y125.441 E.40877
G1 X142.068 Y125.007 E.01371
G1 X151.565 Y115.51 E.41309
G1 X151.565 Y114.976 E.01642
G1 X141.954 Y124.587 E.41805
G2 X141.83 Y124.177 I-4.169 J1.037 E.01318
G1 X151.565 Y114.443 E.42344
G1 X151.565 Y113.909 E.01642
G1 X141.696 Y123.777 E.42928
G2 X141.547 Y123.393 I-3.929 J1.303 E.01269
G1 X151.565 Y113.375 E.43577
G1 X151.565 Y112.841 E.01642
G1 X141.39 Y123.016 E.4426
G1 X141.224 Y122.648 E.01241
G1 X151.565 Y112.307 E.44982
G1 X151.565 Y111.774 E.01642
G1 X141.045 Y122.293 E.45761
G2 X140.859 Y121.945 I-3.582 J1.684 E.01214
G1 X151.565 Y111.24 E.46568
G1 X151.565 Y110.706 E.01642
G1 X140.664 Y121.607 E.47418
G2 X140.458 Y121.279 I-3.391 J1.897 E.01192
G1 X151.565 Y110.172 E.48313
G1 X151.565 Y109.638 E.01642
G1 X140.247 Y120.956 E.49232
G1 X140.024 Y120.645 E.01176
G1 X145.574 Y115.095 E.24143
G1 X145.055 Y115.217 E.0164
G1 X144.914 Y115.221 E.00432
G1 X139.794 Y120.342 E.22276
G1 X139.557 Y120.045 E.01168
G1 X144.397 Y115.205 E.21053
G1 X144.032 Y115.141 E.01138
G1 X143.957 Y115.111 E.0025
G1 X139.308 Y119.759 E.20221
G2 X139.055 Y119.479 I-2.936 J2.398 E.01163
G1 X143.573 Y114.961 E.19655
G1 X143.246 Y114.754 E.01191
G1 X138.791 Y119.209 E.19377
G2 X138.52 Y118.946 I-2.765 J2.589 E.01162
G1 X142.954 Y114.512 E.19291
G3 X142.698 Y114.235 I.556 J-.774 E.0117
G1 X138.243 Y118.689 E.19377
G2 X137.953 Y118.445 I-2.593 J2.78 E.01166
G1 X142.481 Y113.917 E.19695
G1 X142.317 Y113.547 E.01245
G1 X137.659 Y118.206 E.20264
G1 X137.355 Y117.976 E.01172
G1 X142.203 Y113.128 E.21087
G3 X142.153 Y112.644 I1.33 J-.382 E.01504
G1 X137.041 Y117.756 E.22238
G2 X136.724 Y117.54 I-2.121 J2.762 E.01182
G1 X142.221 Y112.043 E.23912
G1 X142.402 Y111.527 E.01681
G1 X142.67 Y111.087 E.01585
G1 X143.021 Y110.709 E.01585
G1 X143.439 Y110.409 E.01585
G1 X143.909 Y110.197 E.01585
G1 X144.113 Y110.15 E.00644
G1 X147.828 Y106.435 E.16159
G1 X148.362 Y106.435 E.01642
G1 X144.723 Y110.074 E.15829
G3 X145.212 Y110.119 I.133 J1.231 E.0152
G1 X148.896 Y106.435 E.16025
G1 X149.429 Y106.435 E.01642
G1 X145.629 Y110.235 E.1653
G3 X145.998 Y110.401 I-.226 J.993 E.0125
G1 X149.963 Y106.435 E.1725
G1 X150.497 Y106.435 E.01642
G1 X146.322 Y110.61 E.18162
G1 X146.596 Y110.87 E.01162
G1 X151.031 Y106.435 E.1929
G1 X151.565 Y106.435 E.01642
G1 X146.836 Y111.164 E.20568
G3 X147.04 Y111.494 I-.714 J.669 E.01201
G1 X151.565 Y106.969 E.19681
G1 X151.565 Y107.503 E.01642
G1 X147.198 Y111.869 E.18993
G1 X147.291 Y112.31 E.01386
G1 X151.565 Y108.037 E.18588
G1 X151.565 Y108.571 E.01642
G1 X147.311 Y112.824 E.18503
G1 X147.241 Y113.288 E.01444
G1 X147.161 Y113.508 E.0072
G1 X151.734 Y108.935 E.19895
; WIPE_START
G1 F24000
G1 X150.32 Y110.349 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I-.55 J-1.086 P1  F30000
G1 X136.269 Y117.461 Z3.2
G1 Z2.8
G1 E.8 F1800
G1 F15000
G1 X147.294 Y106.435 E.47959
G1 X146.76 Y106.435 E.01642
G1 X136.054 Y117.141 E.46571
G1 X135.709 Y116.953 E.0121
G1 X146.226 Y106.435 E.45752
G1 X145.693 Y106.435 E.01642
G1 X135.35 Y116.778 E.44991
G2 X134.984 Y116.61 I-1.868 J3.578 E.01238
G1 X145.159 Y106.435 E.44259
G1 X144.625 Y106.435 E.01642
G1 X134.609 Y116.452 E.4357
G2 X134.22 Y116.306 I-1.649 J3.82 E.01277
G1 X144.091 Y106.435 E.42939
G1 X143.557 Y106.435 E.01642
G1 X133.823 Y116.17 E.42343
G1 X133.415 Y116.044 E.01313
G1 X143.023 Y106.435 E.41796
G1 X142.49 Y106.435 E.01642
G1 X132.992 Y115.933 E.41316
G2 X132.557 Y115.834 I-1.215 J4.301 E.01371
G1 X141.956 Y106.435 E.40883
G1 X141.422 Y106.435 E.01642
G1 X132.111 Y115.746 E.40501
G1 X131.647 Y115.676 E.01443
G1 X140.888 Y106.435 E.40197
G1 X140.354 Y106.435 E.01642
G1 X131.167 Y115.623 E.39966
G2 X130.67 Y115.586 I-.617 J4.963 E.01534
G1 X139.821 Y106.435 E.39806
G1 X139.287 Y106.435 E.01642
G1 X130.154 Y115.568 E.39728
G2 X129.616 Y115.572 I-.232 J5.387 E.01654
G1 X138.753 Y106.435 E.39744
G1 X138.219 Y106.435 E.01642
G1 X129.054 Y115.601 E.3987
G1 X128.46 Y115.66 E.01834
G1 X137.685 Y106.435 E.40128
G1 X137.151 Y106.435 E.01642
G1 X127.832 Y115.755 E.4054
G2 X127.158 Y115.895 I1.068 J6.824 E.02118
G1 X136.618 Y106.435 E.4115
G1 X136.084 Y106.435 E.01642
G1 X126.427 Y116.092 E.42008
G2 X125.621 Y116.364 I2.319 J8.206 E.02616
G1 X135.55 Y106.435 E.4319
G1 X135.016 Y106.435 E.01642
G1 X124.695 Y116.757 E.44897
G2 X123.538 Y117.38 I5.374 J11.365 E.04043
G1 X134.482 Y106.435 E.47607
G1 X133.949 Y106.435 E.01642
G1 X108.435 Y131.949 E1.10981
G1 X108.435 Y132.482 E.01642
G1 X119.371 Y121.547 E.47568
G2 X118.755 Y122.697 I12.173 J7.261 E.04013
G1 X108.435 Y133.016 E.44889
G1 X108.435 Y133.55 E.01642
G1 X118.363 Y123.622 E.43186
G2 X118.09 Y124.429 I14.792 J5.454 E.0262
G1 X108.435 Y134.084 E.41999
G1 X108.435 Y134.618 E.01642
G1 X117.898 Y125.155 E.41161
G2 X117.76 Y125.827 I6.664 J1.721 E.02111
G1 X108.435 Y135.151 E.4056
G1 X108.435 Y135.685 E.01642
G1 X117.664 Y126.456 E.40146
G2 X117.605 Y127.05 I5.918 J.897 E.01836
G1 X108.435 Y136.219 E.39886
G1 X108.435 Y136.753 E.01642
G1 X117.574 Y127.614 E.39753
G2 X117.568 Y128.154 I5.402 J.328 E.01661
G1 X108.435 Y137.287 E.39728
G1 X108.435 Y137.821 E.01642
G1 X117.584 Y128.672 E.39795
G1 X117.621 Y129.169 E.01532
G1 X108.435 Y138.354 E.39957
M73 P89 R1
G1 X108.435 Y138.888 E.01642
G1 X117.677 Y129.646 E.40202
G2 X117.748 Y130.109 I4.673 J-.48 E.01441
G1 X108.435 Y139.422 E.40511
G1 X108.435 Y139.956 E.01642
G1 X117.833 Y130.559 E.40877
G1 X117.932 Y130.993 E.01371
G1 X108.435 Y140.49 E.41309
G1 X108.435 Y141.023 E.01642
G1 X118.046 Y131.413 E.41805
G2 X118.17 Y131.823 I4.168 J-1.037 E.01318
G1 X108.435 Y141.557 E.42344
G1 X108.435 Y142.091 E.01642
G1 X118.304 Y132.222 E.42928
G2 X118.453 Y132.607 I3.926 J-1.302 E.01269
G1 X108.435 Y142.625 E.43577
G1 X108.435 Y143.159 E.01642
G1 X118.61 Y132.984 E.4426
G1 X118.776 Y133.352 E.01241
G1 X108.435 Y143.693 E.44982
G1 X108.435 Y144.226 E.01642
G1 X118.955 Y133.707 E.45761
G2 X119.141 Y134.055 I3.581 J-1.684 E.01214
G1 X108.435 Y144.76 E.46568
G1 X108.435 Y145.294 E.01642
G1 X119.336 Y134.393 E.47418
G2 X119.542 Y134.721 I3.39 J-1.896 E.01192
G1 X108.266 Y145.998 E.49051
G1 X108.266 Y131.584 F30000
G1 F15000
G1 X133.415 Y106.435 E1.09397
G1 X132.881 Y106.435 E.01642
G1 X108.435 Y130.881 E1.06337
G1 X108.435 Y130.347 E.01642
G1 X132.347 Y106.435 E1.04015
G1 X131.813 Y106.435 E.01642
G1 X108.435 Y129.813 E1.01693
G1 X108.435 Y129.279 E.01642
G1 X131.279 Y106.435 E.99371
G1 X130.746 Y106.435 E.01642
G1 X108.435 Y128.746 E.97049
G1 X108.435 Y128.212 E.01642
G1 X130.212 Y106.435 E.94727
G1 X129.678 Y106.435 E.01642
G1 X108.435 Y127.678 E.92405
G1 X108.435 Y127.144 E.01642
G1 X129.144 Y106.435 E.90083
G1 X128.61 Y106.435 E.01642
G1 X108.435 Y126.61 E.8776
G1 X108.435 Y126.077 E.01642
G1 X128.077 Y106.435 E.85438
G1 X127.543 Y106.435 E.01642
G1 X108.435 Y125.543 E.83116
G1 X108.435 Y125.009 E.01642
G1 X127.009 Y106.435 E.80794
G1 X126.475 Y106.435 E.01642
G1 X108.435 Y124.475 E.78472
G1 X108.435 Y123.941 E.01642
G1 X125.941 Y106.435 E.7615
G1 X125.407 Y106.435 E.01642
G1 X108.435 Y123.407 E.73828
G1 X108.435 Y122.874 E.01642
G1 X124.874 Y106.435 E.71506
G1 X124.34 Y106.435 E.01642
G1 X117.14 Y113.636 E.3132
G2 X117.322 Y112.919 I-1.686 J-.81 E.02288
G1 X123.806 Y106.435 E.28206
G1 X123.272 Y106.435 E.01642
G1 X117.33 Y112.377 E.25847
G1 X117.24 Y111.933 E.01393
G1 X122.738 Y106.435 E.23916
G1 X122.205 Y106.435 E.01642
G1 X117.089 Y111.551 E.22251
G2 X116.894 Y111.212 I-.936 J.313 E.0121
G1 X121.671 Y106.435 E.20777
G1 X121.137 Y106.435 E.01642
G1 X116.662 Y110.91 E.19464
G1 X116.392 Y110.646 E.01161
G1 X120.603 Y106.435 E.18317
G1 X120.069 Y106.435 E.01642
G1 X116.072 Y110.433 E.17389
G2 X115.713 Y110.258 I-.612 J.801 E.01237
G1 X119.535 Y106.435 E.16629
G1 X119.002 Y106.435 E.01642
G1 X115.305 Y110.131 E.16078
G1 X114.952 Y110.069 E.01105
G1 X114.831 Y110.072 E.00371
G1 X118.468 Y106.435 E.1582
G1 X117.934 Y106.435 E.01642
G1 X114.018 Y110.352 E.17036
G1 X112.473 Y111.896 F30000
G1 F15000
G1 X108.435 Y115.934 E.17563
G1 X108.435 Y116.468 E.01642
G1 X112.18 Y112.723 E.16289
G2 X112.242 Y113.195 I1.353 J.063 E.01472
G1 X108.435 Y117.002 E.16557
G1 X108.435 Y117.535 E.01642
G1 X112.366 Y113.604 E.171
G2 X112.539 Y113.966 I.98 J-.246 E.0124
G1 X108.435 Y118.069 E.17851
G1 X108.435 Y118.603 E.01642
G1 X112.755 Y114.283 E.18792
G1 X113.021 Y114.552 E.01161
G1 X108.435 Y119.137 E.19946
G1 X108.435 Y119.671 E.01642
G1 X113.32 Y114.786 E.21248
G1 X113.578 Y114.952 E.00944
G1 X113.657 Y114.983 E.0026
G1 X108.435 Y120.204 E.22712
G1 X108.435 Y120.738 E.01642
G1 X114.04 Y115.134 E.24379
G1 X114.49 Y115.217 E.01409
G1 X108.435 Y121.272 E.2634
G1 X108.435 Y121.806 E.01642
G1 X115.023 Y115.219 E.28654
G1 X115.582 Y115.103 E.01759
G1 X115.747 Y115.029 E.00554
G1 X108.266 Y122.509 E.32541
G1 X108.266 Y115.57 F30000
G1 F15000
G1 X117.4 Y106.435 E.39735
G1 X116.866 Y106.435 E.01642
G1 X108.435 Y114.866 E.36674
G1 X108.435 Y114.332 E.01642
G1 X116.332 Y106.435 E.34352
G1 X115.799 Y106.435 E.01642
G1 X108.435 Y113.799 E.3203
G1 X108.435 Y113.265 E.01642
G1 X115.265 Y106.435 E.29708
G1 X114.731 Y106.435 E.01642
G1 X108.435 Y112.731 E.27386
G1 X108.435 Y112.197 E.01642
G1 X114.197 Y106.435 E.25064
G1 X113.663 Y106.435 E.01642
G1 X108.435 Y111.663 E.22742
G1 X108.435 Y111.13 E.01642
G1 X113.13 Y106.435 E.2042
G1 X112.596 Y106.435 E.01642
G1 X108.435 Y110.596 E.18098
G1 X108.435 Y110.062 E.01642
G1 X112.062 Y106.435 E.15775
G1 X111.528 Y106.435 E.01642
G1 X108.435 Y109.528 E.13453
G1 X108.435 Y108.994 E.01642
G1 X110.994 Y106.435 E.11131
G1 X110.46 Y106.435 E.01642
G1 X108.435 Y108.46 E.08809
G1 X108.435 Y107.927 E.01642
G1 X109.927 Y106.435 E.06487
G1 X109.393 Y106.435 E.01642
G1 X108.435 Y107.393 E.04165
G1 X108.435 Y106.859 E.01642
G1 X109.029 Y106.266 E.02581
M106 S221.85
; CHANGE_LAYER
; Z_HEIGHT: 3
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X108.435 Y106.859 E-.31886
G1 X108.435 Y107.393 E-.20285
G1 X108.879 Y106.949 E-.23829
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 15/15
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
G3 Z3.2 I-.57 J1.075 P1  F30000
G1 X141.004 Y123.995 Z3.2
G1 Z3
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M73 P90 R1
G1 X141.189 Y124.549 E.01793
G3 X129.708 Y116.294 I-11.189 J3.449 E1.79395
G1 X130.292 Y116.294 E.01794
G3 X140.983 Y123.94 I-.292 J11.705 E.42881
M204 S10000
; WIPE_START
G1 F24000
G1 X141.189 Y124.549 E-.24415
G1 X141.348 Y125.11 E-.22188
G1 X141.478 Y125.68 E-.22186
G1 X141.511 Y125.867 E-.07212
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I1.133 J.445 P1  F30000
G1 X146.312 Y113.631 Z3.4
G1 Z3
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X146.095 Y113.914 E.01092
G3 X144.502 Y110.804 I-1.362 J-1.265 E.21932
G1 X144.687 Y110.79 E.0057
G3 X146.342 Y113.58 I.046 J1.859 E.12113
M204 S10000
; WIPE_START
G1 F24000
G1 X146.095 Y113.914 E-.15768
G1 X145.819 Y114.16 E-.1407
G1 X145.498 Y114.345 E-.14077
G1 X145.147 Y114.463 E-.14077
G1 X144.78 Y114.509 E-.14077
G1 X144.676 Y114.502 E-.03931
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.017 J-1.217 P1  F30000
G1 X113.566 Y114.072 Z3.4
G1 Z3
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X113.335 Y113.844 E.00998
G3 X114.527 Y110.804 I1.424 J-1.196 E.12252
G1 X114.712 Y110.79 E.0057
G3 X113.611 Y114.112 I.046 J1.859 E.21887
M204 S10000
; WIPE_START
G1 F24000
G1 X113.335 Y113.844 E-.14618
G1 X113.125 Y113.539 E-.1407
G1 X112.981 Y113.198 E-.14076
G1 X112.907 Y112.835 E-.14076
G1 X112.901 Y112.554 E-.1066
G1 X112.934 Y112.333 E-.085
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.21 J.126 P1  F30000
G1 X116.004 Y141.83 Z3.4
G1 Z3
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X116.183 Y142.006 E.00772
G3 X114.527 Y141.355 I-1.425 J1.194 E.30192
G1 X114.712 Y141.342 E.0057
G3 X115.918 Y141.747 I.046 J1.859 E.0399
G1 X115.96 Y141.788 E.00182
M204 S10000
; WIPE_START
G1 F24000
G1 X116.183 Y142.006 E-.11824
G1 X116.392 Y142.312 E-.14075
G1 X116.536 Y142.653 E-.14076
G1 X116.609 Y143.016 E-.14076
G1 X116.616 Y143.296 E-.1066
G1 X116.572 Y143.59 E-.11289
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.031 J1.217 P1  F30000
G1 X146.196 Y144.347 Z3.4
G1 Z3
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X145.963 Y144.594 E.01045
G3 X144.502 Y141.355 I-1.23 J-1.394 E.21362
G1 X144.687 Y141.342 E.0057
G3 X146.232 Y144.299 I.046 J1.859 E.12729
M204 S10000
; WIPE_START
G1 F24000
G1 X145.963 Y144.594 E-.15193
G1 X145.663 Y144.812 E-.14069
G1 X145.326 Y144.965 E-.14077
G1 X144.964 Y145.047 E-.14076
G1 X144.594 Y145.056 E-.14077
G1 X144.477 Y145.036 E-.04507
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.679 J1.01 P1  F30000
G1 X152.29 Y150.29 Z3.4
G1 Z3
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X107.71 Y150.29 E1.36982
G1 X107.71 Y105.71 E1.36982
G1 X152.29 Y105.71 E1.36982
G1 X152.29 Y150.23 E1.36798
M204 S10000
; WIPE_START
G1 F24000
G1 X150.29 Y150.233 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I1.216 J.05 P1  F30000
G1 X152.083 Y106.621 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
G1 F12000
G1 X151.379 Y105.917 E.03058
G1 X150.846 Y105.917
G1 X152.083 Y107.154 E.05376
G1 X152.083 Y107.688
G1 X150.312 Y105.917 E.07693
G1 X149.779 Y105.917
G1 X152.083 Y108.221 E.1001
G1 X152.083 Y108.754
G1 X149.246 Y105.917 E.12327
G1 X148.712 Y105.917
G1 X152.083 Y109.288 E.14645
G1 X152.083 Y109.821
G1 X148.179 Y105.917 E.16962
G1 X147.646 Y105.917
G1 X152.083 Y110.354 E.19279
G1 X152.083 Y110.887
G1 X147.113 Y105.917 E.21597
G1 X146.579 Y105.917
G1 X152.083 Y111.421 E.23914
G1 X152.083 Y111.954
G1 X146.046 Y105.917 E.26231
G1 X145.513 Y105.917
G1 X152.083 Y112.487 E.28549
G1 X152.083 Y113.02
G1 X144.98 Y105.917 E.30866
G1 X144.446 Y105.917
G1 X152.083 Y113.554 E.33183
G1 X152.083 Y114.087
G1 X143.913 Y105.917 E.35501
G1 X143.38 Y105.917
G1 X152.083 Y114.62 E.37818
G1 X152.083 Y115.153
G1 X142.847 Y105.917 E.40135
G1 X142.313 Y105.917
G1 X152.083 Y115.687 E.42453
G1 X152.083 Y116.22
G1 X141.78 Y105.917 E.4477
G1 X141.247 Y105.917
G1 X152.083 Y116.753 E.47087
G1 X152.083 Y117.287
G1 X146.618 Y111.822 E.23746
G1 X146.793 Y112.53
G1 X152.083 Y117.82 E.22985
G1 X152.083 Y118.353
G1 X146.758 Y113.028 E.23139
G1 X146.636 Y113.44
G1 X152.083 Y118.886 E.23668
G1 X152.083 Y119.42
G1 X146.45 Y113.787 E.24475
G1 X146.212 Y114.082
G1 X152.083 Y119.953 E.25511
G1 X152.083 Y120.486
G1 X145.925 Y114.328 E.26759
G1 X145.586 Y114.523
G1 X152.083 Y121.019 E.2823
G1 X152.083 Y121.553
G1 X145.187 Y114.657 E.29964
G1 X144.706 Y114.709
G1 X152.083 Y122.086 E.32055
G1 X152.083 Y122.619
G1 X144.06 Y114.597 E.34862
M204 S10000
; WIPE_START
G1 F24000
G1 X145.474 Y116.011 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I1.217 J.019 P1  F30000
G1 X145.558 Y110.762 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X140.713 Y105.917 E.21053
G1 X140.18 Y105.917
G1 X144.85 Y110.588 E.20295
G1 X144.354 Y110.625
G1 X139.647 Y105.917 E.20456
G1 X139.114 Y105.917
G1 X143.944 Y110.748 E.20989
G1 X143.595 Y110.932
G1 X138.58 Y105.917 E.21793
G1 X138.047 Y105.917
G1 X143.299 Y111.169 E.22821
G1 X143.051 Y111.455
G1 X137.514 Y105.917 E.24062
G1 X136.981 Y105.917
G1 X142.855 Y111.792 E.25527
G1 X142.721 Y112.191
G1 X136.447 Y105.917 E.27261
G1 X135.914 Y105.917
G1 X142.671 Y112.674 E.29362
G1 X142.781 Y113.318
M73 P91 R1
G1 X135.381 Y105.917 E.32157
G1 X134.847 Y105.917
G1 X152.083 Y123.153 E.74895
G1 X152.083 Y123.686
G1 X134.314 Y105.917 E.77212
G1 X133.781 Y105.917
G1 X152.083 Y124.219 E.7953
G1 X152.083 Y124.752
G1 X133.248 Y105.917 E.81847
G1 X132.714 Y105.917
G1 X152.083 Y125.286 E.84164
G1 X152.083 Y125.819
G1 X132.181 Y105.917 E.86482
G1 X131.648 Y105.917
G1 X152.083 Y126.352 E.88799
G1 X152.083 Y126.885
G1 X131.115 Y105.917 E.91116
G1 X130.581 Y105.917
G1 X152.083 Y127.419 E.93434
G1 X152.083 Y127.952
G1 X130.048 Y105.917 E.95751
G1 X129.515 Y105.917
G1 X152.083 Y128.485 E.98068
G1 X152.083 Y129.019
G1 X128.981 Y105.917 E1.00386
G1 X128.448 Y105.917
G1 X152.083 Y129.552 E1.02703
G1 X152.083 Y130.085
G1 X127.915 Y105.917 E1.0502
G1 X127.382 Y105.917
G1 X152.083 Y130.618 E1.07337
G1 X152.083 Y131.152
G1 X126.848 Y105.917 E1.09655
G1 X126.315 Y105.917
G1 X152.083 Y131.685 E1.11972
G1 X152.083 Y132.218
G1 X125.782 Y105.917 E1.14289
G1 X125.249 Y105.917
G1 X152.083 Y132.751 E1.16607
G1 X152.083 Y133.285
G1 X139.068 Y120.27 E.56554
M204 S10000
; WIPE_START
G1 F24000
G1 X140.482 Y121.684 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.132 J-.447 P1  F30000
G1 X140.331 Y122.067 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X152.083 Y133.818 E.51066
G1 X152.083 Y134.351
G1 X140.883 Y123.151 E.48669
G1 X141.238 Y124.039
G1 X152.083 Y134.884 E.47127
G1 X152.083 Y135.418
G1 X141.48 Y124.816 E.46072
G1 X141.655 Y125.523
G1 X152.083 Y135.951 E.45313
G1 X152.083 Y136.484
G1 X141.776 Y126.178 E.44786
G1 X141.855 Y126.79
G1 X152.083 Y137.018 E.44442
G1 X152.083 Y137.551
G1 X141.9 Y127.368 E.44249
G1 X141.915 Y127.917
G1 X152.083 Y138.084 E.44181
G1 X152.083 Y138.617
G1 X141.906 Y128.441 E.44221
G1 X141.876 Y128.944
G1 X152.083 Y139.151 E.44351
G1 X152.083 Y139.684
G1 X141.828 Y129.429 E.44562
G1 X141.763 Y129.898
G1 X152.083 Y140.217 E.44844
G1 X152.083 Y140.75
G1 X141.683 Y130.351 E.45191
G1 X141.584 Y130.786
G1 X152.083 Y141.284 E.4562
G1 X152.083 Y141.817
G1 X141.474 Y131.208 E.46101
G1 X141.352 Y131.62
G1 X152.083 Y142.35 E.46629
G1 X152.083 Y142.884
G1 X141.218 Y132.019 E.47212
G1 X141.07 Y132.404
G1 X152.083 Y143.417 E.47855
G1 X152.083 Y143.95
M73 P92 R1
G1 X140.913 Y132.781 E.48536
G1 X140.748 Y133.148
G1 X152.083 Y144.483 E.49257
G1 X152.083 Y145.017
G1 X140.568 Y133.502 E.50038
G1 X140.381 Y133.848
G1 X152.083 Y145.55 E.50851
G1 X152.083 Y146.083
G1 X140.185 Y134.186 E.51699
G1 X139.977 Y134.511
G1 X152.083 Y146.616 E.52603
G1 X152.083 Y147.15
G1 X139.763 Y134.83 E.53535
G1 X139.54 Y135.14
G1 X145.912 Y141.512 E.27688
G1 X145.03 Y141.163
G1 X139.306 Y135.439 E.24874
G1 X139.066 Y135.733
G1 X144.482 Y141.148 E.23535
G1 X144.051 Y141.251
G1 X138.816 Y136.016 E.22749
G1 X138.557 Y136.29
G1 X143.686 Y141.419 E.22288
G1 X143.375 Y141.642
G1 X138.292 Y136.559 E.22091
G1 X138.015 Y136.815
G1 X143.117 Y141.917 E.22169
G1 X142.908 Y142.241
G1 X137.732 Y137.065 E.22493
G1 X137.442 Y137.308
G1 X142.754 Y142.621 E.23085
G1 X142.671 Y143.071
G1 X137.139 Y137.538 E.24041
M73 P92 R0
G1 X136.83 Y137.763
G1 X142.726 Y143.659 E.2562
M204 S10000
; WIPE_START
G1 F24000
G1 X141.311 Y142.244 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.054 J1.216 P1  F30000
G1 X146.418 Y142.018 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X152.083 Y147.683 E.24616
G1 X152.083 Y148.216
G1 X146.774 Y142.907 E.23069
G1 X146.778 Y143.445
G1 X152.083 Y148.75 E.2305
G1 X152.083 Y149.283
G1 X146.677 Y143.878 E.23488
G1 X146.509 Y144.243
G1 X152.083 Y149.816 E.24219
G1 X151.816 Y150.083
G1 X146.287 Y144.553 E.24027
G1 X146.015 Y144.815
G1 X151.283 Y150.083 E.22891
G1 X150.749 Y150.083
G1 X145.693 Y145.026 E.21972
G1 X145.314 Y145.18
G1 X150.216 Y150.083 E.21304
G1 X149.683 Y150.083
G1 X144.857 Y145.257 E.20969
G1 X144.278 Y145.211
G1 X149.15 Y150.083 E.21169
G1 X148.616 Y150.083
G1 X136.513 Y137.979 E.52596
G1 X136.184 Y138.183
G1 X148.083 Y150.083 E.51708
G1 X147.55 Y150.083
G1 X135.848 Y138.381 E.50849
G1 X135.503 Y138.569
G1 X147.016 Y150.083 E.50032
G1 X146.483 Y150.083
G1 X135.146 Y138.745 E.49266
G1 X134.781 Y138.914
G1 X145.95 Y150.083 E.48534
G1 X145.417 Y150.083
G1 X134.406 Y139.072 E.47847
G1 X134.017 Y139.216
G1 X144.883 Y150.083 E.47219
G1 X144.35 Y150.083
G1 X133.619 Y139.351 E.46632
G1 X133.211 Y139.476
G1 X143.817 Y150.083 E.46089
G1 X143.284 Y150.083
G1 X132.786 Y139.585 E.45619
G1 X132.348 Y139.68
G1 X142.75 Y150.083 E.45204
G1 X142.217 Y150.083
G1 X131.897 Y139.762 E.44846
G1 X131.431 Y139.83
G1 X141.684 Y150.083 E.44552
G1 X141.15 Y150.083
G1 X130.946 Y139.879 E.44341
G1 X130.441 Y139.907
G1 X140.617 Y150.083 E.4422
M73 P93 R0
G1 X140.084 Y150.083
G1 X129.915 Y139.914 E.44188
G1 X129.365 Y139.897
G1 X139.551 Y150.083 E.44262
G1 X139.017 Y150.083
G1 X128.787 Y139.852 E.44457
G1 X128.175 Y139.773
G1 X138.484 Y150.083 E.44799
G1 X137.951 Y150.083
G1 X127.522 Y139.654 E.45318
G1 X126.819 Y139.484
G1 X137.418 Y150.083 E.46056
G1 X136.884 Y150.083
G1 X126.038 Y139.236 E.47132
G1 X125.155 Y138.887
G1 X136.351 Y150.083 E.48651
G1 X135.818 Y150.083
G1 X124.074 Y138.339 E.51033
M204 S10000
; WIPE_START
G1 F24000
G1 X125.488 Y139.753 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.78 J-.934 P1  F30000
G1 X122.258 Y137.056 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X135.285 Y150.083 E.56607
M204 S10000
; WIPE_START
G1 F24000
G1 X133.87 Y148.668 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I1.19 J-.255 P1  F30000
G1 X124.715 Y105.917 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X137.741 Y118.943 E.56604
M204 S10000
; WIPE_START
G1 F24000
G1 X136.327 Y117.529 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.381 J-1.156 P1  F30000
G1 X135.926 Y117.661 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X124.182 Y105.917 E.51033
G1 X123.649 Y105.917
G1 X134.844 Y117.113 E.48651
G1 X133.962 Y116.763
G1 X123.116 Y105.917 E.47132
G1 X122.582 Y105.917
G1 X133.181 Y116.516 E.46056
G1 X132.478 Y116.346
G1 X122.049 Y105.917 E.45318
G1 X121.516 Y105.917
G1 X131.825 Y116.227 E.44799
G1 X131.213 Y116.148
G1 X120.982 Y105.917 E.44457
G1 X120.449 Y105.917
G1 X130.635 Y116.103 E.44262
G1 X130.085 Y116.086
G1 X119.916 Y105.917 E.44188
G1 X119.383 Y105.917
G1 X129.559 Y116.093 E.4422
G1 X129.053 Y116.121
G1 X118.849 Y105.917 E.44341
G1 X118.316 Y105.917
G1 X128.569 Y116.17 E.44552
G1 X128.103 Y116.238
G1 X117.783 Y105.917 E.44846
G1 X117.25 Y105.917
G1 X127.652 Y116.32 E.45204
G1 X127.214 Y116.415
G1 X116.716 Y105.917 E.45619
G1 X116.183 Y105.917
G1 X126.789 Y116.524 E.46089
G1 X126.381 Y116.649
G1 X115.65 Y105.917 E.46632
G1 X115.116 Y105.917
G1 X125.983 Y116.784 E.47219
G1 X125.594 Y116.928
G1 X114.583 Y105.917 E.47847
G1 X114.05 Y105.917
G1 X125.219 Y117.086 E.48535
G1 X124.854 Y117.255
G1 X113.517 Y105.917 E.49267
G1 X112.983 Y105.917
G1 X124.497 Y117.431 E.50032
G1 X124.152 Y117.619
G1 X112.45 Y105.917 E.50849
G1 X111.917 Y105.917
G1 X123.816 Y117.817 E.51708
G1 X123.487 Y118.021
G1 X111.384 Y105.917 E.52596
G1 X110.85 Y105.917
G1 X115.814 Y110.881 E.2157
G1 X115.002 Y110.602
G1 X110.317 Y105.917 E.20359
G1 X109.784 Y105.917
G1 X114.47 Y110.604 E.20366
G1 X114.046 Y110.713
G1 X109.25 Y105.917 E.20838
G1 X108.717 Y105.917
G1 X113.686 Y110.886 E.2159
M73 P94 R0
G1 X113.378 Y111.111
G1 X108.184 Y105.917 E.2257
G1 X107.917 Y106.184
G1 X113.121 Y111.388 E.22613
G1 X112.916 Y111.716
G1 X107.917 Y106.717 E.21723
G1 X107.917 Y107.251
G1 X112.768 Y112.101 E.21076
G1 X112.693 Y112.56
G1 X107.917 Y107.784 E.20753
G1 X107.917 Y108.317
G1 X112.762 Y113.162 E.21051
M204 S10000
; WIPE_START
G1 F24000
G1 X111.348 Y111.747 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.034 J1.216 P1  F30000
G1 X116.536 Y111.603 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X123.17 Y118.237 E.28828
G1 X122.861 Y118.462
G1 X116.81 Y112.41 E.26296
G1 X116.798 Y112.931
G1 X122.558 Y118.692 E.25033
G1 X122.268 Y118.935
G1 X116.691 Y113.358 E.24236
G1 X116.518 Y113.718
G1 X121.985 Y119.185 E.23756
G1 X121.708 Y119.441
G1 X116.291 Y114.024 E.2354
G1 X116.015 Y114.281
G1 X121.443 Y119.71 E.2359
G1 X121.184 Y119.984
G1 X115.688 Y114.488 E.23883
G1 X115.303 Y114.637
G1 X120.934 Y120.267 E.24469
G1 X120.694 Y120.561
G1 X114.84 Y114.707 E.25439
G1 X114.25 Y114.65
G1 X120.46 Y120.86 E.26984
G1 X120.237 Y121.17
G1 X107.917 Y108.85 E.53535
G1 X107.917 Y109.384
G1 X120.023 Y121.489 E.52603
G1 X119.815 Y121.814
G1 X107.917 Y109.917 E.51699
G1 X107.917 Y110.45
G1 X119.619 Y122.152 E.50851
G1 X119.432 Y122.498
G1 X107.917 Y110.984 E.50038
G1 X107.917 Y111.517
G1 X119.252 Y122.852 E.49256
G1 X119.087 Y123.219
G1 X107.917 Y112.05 E.48536
G1 X107.917 Y112.583
G1 X118.93 Y123.596 E.47855
G1 X118.782 Y123.981
G1 X107.917 Y113.117 E.47212
G1 X107.917 Y113.65
G1 X118.648 Y124.38 E.46629
G1 X118.526 Y124.792
G1 X107.917 Y114.183 E.461
G1 X107.917 Y114.716
G1 X118.416 Y125.215 E.4562
G1 X118.317 Y125.649
G1 X107.917 Y115.25 E.45191
G1 X107.917 Y115.783
G1 X118.237 Y126.103 E.44844
G1 X118.172 Y126.571
G1 X107.917 Y116.316 E.44562
G1 X107.917 Y116.85
G1 X118.124 Y127.056 E.44351
G1 X118.094 Y127.559
G1 X107.917 Y117.383 E.44221
G1 X107.917 Y117.916
G1 X118.085 Y128.083 E.44181
G1 X118.1 Y128.632
G1 X107.917 Y118.449 E.44249
G1 X107.917 Y118.983
G1 X118.145 Y129.21 E.44442
G1 X118.224 Y129.822
G1 X107.917 Y119.516 E.44786
G1 X107.917 Y120.049
G1 X118.345 Y130.477 E.45314
G1 X118.52 Y131.185
G1 X107.917 Y120.582 E.46072
G1 X107.917 Y121.116
G1 X118.762 Y131.961 E.47127
G1 X119.117 Y132.849
G1 X107.917 Y121.649 E.4867
G1 X107.917 Y122.182
G1 X119.669 Y133.934 E.51066
M204 S10000
; WIPE_START
G1 F24000
G1 X118.255 Y132.52 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.935 J.779 P1  F30000
G1 X120.933 Y135.731 Z3.4
G1 Z3
M73 P95 R0
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X107.917 Y122.715 E.56559
G1 X107.917 Y123.249
G1 X134.751 Y150.083 E1.16606
G1 X134.218 Y150.083
G1 X107.917 Y123.782 E1.14289
G1 X107.917 Y124.315
G1 X133.685 Y150.083 E1.11971
G1 X133.151 Y150.083
G1 X107.917 Y124.849 E1.09654
G1 X107.917 Y125.382
G1 X132.618 Y150.083 E1.07337
G1 X132.085 Y150.083
G1 X107.917 Y125.915 E1.0502
G1 X107.917 Y126.448
G1 X131.552 Y150.083 E1.02702
G1 X131.018 Y150.083
G1 X107.917 Y126.982 E1.00385
G1 X107.917 Y127.515
G1 X130.485 Y150.083 E.98068
G1 X129.952 Y150.083
G1 X107.917 Y128.048 E.9575
G1 X107.917 Y128.581
G1 X129.419 Y150.083 E.93433
G1 X128.885 Y150.083
G1 X107.917 Y129.115 E.91116
G1 X107.917 Y129.648
G1 X128.352 Y150.083 E.88798
G1 X127.819 Y150.083
G1 X107.917 Y130.181 E.86481
G1 X107.917 Y130.715
G1 X127.285 Y150.083 E.84164
G1 X126.752 Y150.083
G1 X107.917 Y131.248 E.81846
G1 X107.917 Y131.781
G1 X126.219 Y150.083 E.79529
G1 X125.686 Y150.083
G1 X107.917 Y132.314 E.77212
G1 X107.917 Y132.848
G1 X125.152 Y150.083 E.74894
G1 X124.619 Y150.083
G1 X107.917 Y133.381 E.72577
G1 X107.917 Y133.914
G1 X115.191 Y141.187 E.31605
G1 X114.616 Y141.146
G1 X107.917 Y134.447 E.29108
G1 X107.917 Y134.981
G1 X114.163 Y141.226 E.27138
G1 X113.785 Y141.382
G1 X107.917 Y135.514 E.25499
G1 X107.917 Y136.047
G1 X113.466 Y141.595 E.2411
G1 X113.196 Y141.859
G1 X107.917 Y136.581 E.22937
G1 X107.917 Y137.114
G1 X112.975 Y142.172 E.21979
G1 X112.809 Y142.539
G1 X107.917 Y137.647 E.21256
G1 X107.917 Y138.18
G1 X112.711 Y142.974 E.2083
G1 X112.722 Y143.519
G1 X107.917 Y138.714 E.2088
G1 X107.917 Y139.247
G1 X113.114 Y144.443 E.2258
M204 S10000
; WIPE_START
G1 F24000
G1 X111.699 Y143.029 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.063 J1.215 P1  F30000
G1 X116.771 Y142.767 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X124.086 Y150.083 E.31788
G1 X123.553 Y150.083
G1 X116.818 Y143.348 E.29265
G1 X116.732 Y143.796
M73 P96 R0
G1 X123.019 Y150.083 E.2732
G1 X122.486 Y150.083
G1 X116.577 Y144.173 E.25679
G1 X116.366 Y144.495
G1 X121.953 Y150.083 E.24279
G1 X121.42 Y150.083
G1 X116.105 Y144.768 E.23094
G1 X115.795 Y144.991
G1 X120.886 Y150.083 E.22125
G1 X120.353 Y150.083
G1 X115.428 Y145.157 E.21402
G1 X114.992 Y145.254
G1 X119.82 Y150.083 E.2098
G1 X119.286 Y150.083
G1 X114.439 Y145.235 E.21065
G1 X113.527 Y144.856
G1 X118.753 Y150.083 E.22711
G1 X118.22 Y150.083
G1 X107.917 Y139.78 E.44769
G1 X107.917 Y140.313
G1 X117.687 Y150.083 E.42452
G1 X117.153 Y150.083
G1 X107.917 Y140.847 E.40135
G1 X107.917 Y141.38
G1 X116.62 Y150.083 E.37817
G1 X116.087 Y150.083
G1 X107.917 Y141.913 E.355
G1 X107.917 Y142.446
G1 X115.554 Y150.083 E.33183
G1 X115.02 Y150.083
G1 X107.917 Y142.98 E.30865
G1 X107.917 Y143.513
G1 X114.487 Y150.083 E.28548
G1 X113.954 Y150.083
G1 X107.917 Y144.046 E.26231
G1 X107.917 Y144.58
G1 X113.42 Y150.083 E.23913
G1 X112.887 Y150.083
G1 X107.917 Y145.113 E.21596
G1 X107.917 Y145.646
G1 X112.354 Y150.083 E.19279
G1 X111.821 Y150.083
G1 X107.917 Y146.179 E.16961
G1 X107.917 Y146.713
G1 X111.287 Y150.083 E.14644
G1 X110.754 Y150.083
G1 X107.917 Y147.246 E.12327
G1 X107.917 Y147.779
G1 X110.221 Y150.083 E.1001
G1 X109.688 Y150.083
G1 X107.917 Y148.312 E.07692
G1 X107.917 Y148.846
G1 X109.154 Y150.083 E.05375
G1 X108.621 Y150.083
G1 X107.917 Y149.379 E.03058
M204 S10000
; WIPE_START
G1 F24000
G1 X108.621 Y150.083 E-.37813
G1 X109.154 Y150.083 E-.20264
G1 X108.821 Y149.749 E-.17923
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.862 J.859 P1  F30000
G1 X146.68 Y111.76 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.208902
G1 F15000
G2 X146.592 Y111.629 I-1.361 J.829 E.00213
; LINE_WIDTH: 0.184666
G1 X146.461 Y111.472 E.00237
; LINE_WIDTH: 0.120314
G1 X146.33 Y111.314 E.00129
G2 X146.03 Y111.017 I-46.666 J46.957 E.00266
; LINE_WIDTH: 0.113422
G1 X145.871 Y110.888 E.00118
; LINE_WIDTH: 0.160002
G2 X145.698 Y110.75 I-1.463 J1.648 E.00211
; LINE_WIDTH: 0.205273
G1 X145.621 Y110.7 E.00122
; WIPE_START
G1 F24000
G1 X145.698 Y110.75 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.181 J-.294 P1  F30000
G1 X144.715 Y114.7 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.16293
G1 F15000
G1 X144.573 Y114.755 E.0015
G1 X144.436 Y114.686 E.0015
G1 X143.988 Y114.669 F30000
; LINE_WIDTH: 0.135761
G1 F15000
G3 X143.586 Y114.361 I2.862 J-4.157 E.00383
G1 X143.021 Y113.795 F30000
; LINE_WIDTH: 0.0928845
G1 F15000
G1 X142.884 Y113.625 E.00089
; LINE_WIDTH: 0.130299
G1 X142.801 Y113.502 E.00105
; LINE_WIDTH: 0.170614
G1 X142.719 Y113.38 E.00154
; WIPE_START
G1 F24000
G1 X142.801 Y113.502 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.971 J.733 P1  F30000
G1 X145.052 Y110.522 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.0913443
G1 F15000
G1 X144.836 Y110.602 E.00091
; WIPE_START
G1 F24000
G1 X145.052 Y110.522 E-.76
; WIPE_END
M73 P97 R0
G1 E-.04 F1800
G17
G3 Z3.4 I-.114 J-1.212 P1  F30000
G1 X112.901 Y113.542 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.0881695
G1 F15000
G1 X112.846 Y113.459 E.00037
; LINE_WIDTH: 0.123361
G1 X112.79 Y113.377 E.00065
; LINE_WIDTH: 0.164779
G1 X112.735 Y113.295 E.00098
G1 X112.742 Y113.266 E.0003
; LINE_WIDTH: 0.161499
G1 X112.778 Y113.146 E.00121
; WIPE_START
G1 F24000
G1 X112.742 Y113.266 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.816 J.903 P1  F30000
G1 X114.262 Y114.639 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.110159
G1 F15000
G1 X114.032 Y114.699 E.0013
; WIPE_START
G1 F24000
G1 X114.262 Y114.639 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.972 J.733 P1  F30000
G1 X116.597 Y111.543 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.202593
G1 F15000
G2 X115.875 Y110.82 I-3.439 J2.716 E.01332
; WIPE_START
G1 F24000
G1 X116.088 Y110.994 E-.20416
G1 X116.379 Y111.281 E-.30284
G1 X116.597 Y111.543 E-.253
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.355 J1.164 P1  F30000
G1 X132.118 Y116.276 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.101775
G1 F15000
G2 X131.893 Y116.158 I-4.729 J8.758 E.00122
; WIPE_START
G1 F24000
G1 X132.118 Y116.276 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.181 J1.203 P1  F30000
G1 X133.401 Y116.469 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.11224
G1 F15000
G1 X133.166 Y116.53 E.00137
; WIPE_START
G1 F24000
G1 X133.401 Y116.469 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.502 J1.109 P1  F30000
G1 X135.301 Y117.329 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.0881693
G1 F15000
G1 X135.17 Y117.236 E.00059
; LINE_WIDTH: 0.129874
G1 X135.038 Y117.143 E.00114
; LINE_WIDTH: 0.171578
G1 X134.907 Y117.05 E.00169
; WIPE_START
G1 F24000
G1 X135.038 Y117.143 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.623 J1.046 P1  F30000
G1 X136.539 Y118.037 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.0883661
G1 F15000
G1 X136.471 Y117.98 E.00033
; LINE_WIDTH: 0.100673
G1 X136.31 Y117.853 E.00096
; LINE_WIDTH: 0.141919
G1 X136.148 Y117.727 E.00165
; LINE_WIDTH: 0.183165
G1 X135.987 Y117.6 E.00234
; WIPE_START
G1 F24000
G1 X136.148 Y117.727 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.779 J.935 P1  F30000
G1 X139.128 Y120.21 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.224775
G1 F15000
G1 X138.368 Y119.423 E.01621
G1 X137.801 Y118.883 E.01161
; WIPE_START
G1 F24000
G1 X138.368 Y119.423 E-.31713
G1 X139.128 Y120.21 E-.44287
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.995 J.701 P1  F30000
G1 X140.392 Y122.005 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.223577
G1 F15000
G1 X140.3 Y121.885 E.00224
; LINE_WIDTH: 0.195234
G1 X140.205 Y121.762 E.00193
; LINE_WIDTH: 0.167271
G1 X140.081 Y121.608 E.00201
; LINE_WIDTH: 0.12772
G1 X139.956 Y121.453 E.00137
; WIPE_START
G1 F24000
G1 X140.081 Y121.608 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.051 J.613 P1  F30000
G1 X140.945 Y123.089 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.213466
G1 F15000
G1 X140.852 Y122.955 E.00227
; LINE_WIDTH: 0.169682
G1 X140.757 Y122.818 E.00171
; LINE_WIDTH: 0.126292
G1 X140.672 Y122.701 E.00099
; WIPE_START
G1 F24000
G1 X140.757 Y122.818 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.217 J.028 P1  F30000
G1 X140.981 Y132.582 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.111002
G1 F15000
G1 X140.994 Y132.647 E.00037
G1 X140.934 Y132.734 E.00058
; WIPE_START
G1 F24000
G1 X140.994 Y132.647 E-.46409
G1 X140.981 Y132.582 E-.29591
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.598 J-1.06 P1  F30000
G1 X128.106 Y139.842 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.10618
G1 F15000
G3 X127.881 Y139.724 I4.591 J-9.038 E.00131
; WIPE_START
G1 F24000
G1 X128.106 Y139.842 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.341 J-1.168 P1  F30000
G1 X126.833 Y139.47 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.110033
G1 F15000
G1 X126.599 Y139.531 E.00132
; WIPE_START
G1 F24000
G1 X126.833 Y139.47 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.348 J-1.166 P1  F30000
G1 X125.092 Y138.95 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.213294
G1 F15000
G1 X124.961 Y138.857 E.00223
; LINE_WIDTH: 0.171586
G1 X124.83 Y138.764 E.00169
; LINE_WIDTH: 0.129878
G1 X124.699 Y138.67 E.00114
G1 X124.012 Y138.4 F30000
; LINE_WIDTH: 0.224429
G1 F15000
G1 X123.851 Y138.273 E.00303
; LINE_WIDTH: 0.183211
G1 X123.69 Y138.147 E.00234
; LINE_WIDTH: 0.141704
G1 X123.528 Y138.019 E.00166
; LINE_WIDTH: 0.100469
G1 X123.46 Y137.963 E.00041
; WIPE_START
G1 F24000
G1 X123.528 Y138.019 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.683 J-1.007 P1  F30000
G1 X122.198 Y137.116 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.224585
G1 F15000
G1 X121.631 Y136.577 E.01158
G1 X120.873 Y135.791 E.01617
; WIPE_START
G1 F24000
G1 X121.631 Y136.577 E-.44286
G1 X122.198 Y137.116 E-.31714
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.933 J-.782 P1  F30000
G1 X120.044 Y134.547 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.0881695
G1 F15000
G1 X119.919 Y134.393 E.00073
; LINE_WIDTH: 0.128386
G1 X119.793 Y134.236 E.0014
; LINE_WIDTH: 0.168114
G1 X119.7 Y134.115 E.00155
; LINE_WIDTH: 0.195845
G1 X119.608 Y133.995 E.00189
G1 X119.328 Y133.299 F30000
; LINE_WIDTH: 0.0887172
G1 F15000
G1 X119.241 Y133.18 E.00055
; LINE_WIDTH: 0.127097
G1 X119.148 Y133.045 E.00112
; LINE_WIDTH: 0.170281
G1 X119.055 Y132.911 E.0017
; WIPE_START
G1 F24000
G1 X119.148 Y133.045 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I1.217 J-.01 P1  F30000
G1 X119.066 Y123.267 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.0948745
G1 F15000
G1 X119.006 Y123.353 E.00044
G1 X119.019 Y123.418 E.00028
; WIPE_START
G1 F24000
G1 X119.006 Y123.353 E-.29592
G1 X119.066 Y123.267 E-.46408
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.194 J-.233 P1  F30000
G1 X115.55 Y141.289 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.180785
G1 F15000
G2 X115.257 Y141.121 I-1.849 J2.905 E.0038
; WIPE_START
G1 F24000
G1 X115.55 Y141.289 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.059 J-.6 P1  F30000
G1 X113.535 Y144.848 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.158766
G1 F15000
G1 X113.432 Y144.853 E.00098
; LINE_WIDTH: 0.181404
G1 X113.413 Y144.854 E.00022
; LINE_WIDTH: 0.23324
G1 X113.394 Y144.854 E.0003
G3 X113.114 Y144.576 I3.829 J-4.148 E.00611
G1 X113.125 Y144.432 E.00225
; WIPE_START
G1 F24000
G1 X113.114 Y144.576 E-.19744
G1 X113.394 Y144.854 E-.53644
G1 X113.413 Y144.854 E-.02612
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.648 J1.03 P1  F30000
G1 X116.841 Y142.697 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.158617
G1 F15000
G1 X116.768 Y142.576 E.00134
; LINE_WIDTH: 0.153029
G1 X116.714 Y142.496 E.00086
; LINE_WIDTH: 0.120599
G1 X116.661 Y142.417 E.00061
; WIPE_START
G1 F24000
G1 X116.714 Y142.496 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.071 J1.215 P1  F30000
G1 X142.844 Y144.018 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.0881695
G1 F15000
G1 X142.781 Y143.924 E.00042
; LINE_WIDTH: 0.13152
G1 X142.711 Y143.818 E.00091
; LINE_WIDTH: 0.173073
G1 X142.66 Y143.724 E.00113
; WIPE_START
G1 F24000
G1 X142.711 Y143.818 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.539 J1.091 P1  F30000
G1 X146.478 Y141.958 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.2217
G1 F15000
G2 X145.972 Y141.451 I-3.39 J2.882 E.01044
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F24000
G1 X146.364 Y141.821 E-.57137
G1 X146.478 Y141.958 E-.18863
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
G1 Z3.5 F900 ; lower z a little
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

    G1 Z103 F600
    G1 Z101

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

