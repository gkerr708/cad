; HEADER_BLOCK_START
; BambuStudio 01.06.02.04
; model printing time: 12m 14s; total estimated time: 18m 2s
; total layer number: 85
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
M73 P0 R18
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
M73 P24 R13
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

G1 X70 F9000
M73 P26 R13
G1 X76 F15000
M73 P27 R13
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
M73 P28 R13
G1 X100 F5000
M73 P28 R12
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
    G29 A X120.5 Y125.5 I19 J9
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
M73 P29 R12
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
; layer num/total_layer_count: 1/85
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
G1 X138.643 Y131.643 F30000
G1 Z.4
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F2887
G1 X121.357 Y131.643 E.64383
G1 X121.357 Y124.357 E.27137
G1 X138.643 Y124.357 E.64383
G1 X138.643 Y131.583 E.26914
G1 X139.1 Y132.1 F30000
; FEATURE: Outer wall
G1 F2887
G1 X120.9 Y132.1 E.67788
G1 X120.9 Y123.9 E.30542
M73 P30 R12
G1 X139.1 Y123.9 E.67788
G1 X139.1 Y132.04 E.30318
; WIPE_START
G1 F24000
G1 X137.1 Y132.047 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I1.215 J.07 P1  F30000
G1 X137.536 Y124.54 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.50028
G1 F2887
G1 X138.254 Y125.259 E.03789
G1 X138.254 Y125.906 E.02411
M73 P31 R12
G1 X137.094 Y124.746 E.06114
G1 X136.448 Y124.746 E.02411
G1 X138.254 Y126.552 E.09523
G1 X138.254 Y127.199 E.02411
G1 X135.801 Y124.746 E.12932
G1 X135.154 Y124.746 E.02411
G1 X138.254 Y127.846 E.16341
G1 X138.254 Y128.493 E.02411
G1 X134.507 Y124.746 E.1975
G1 X133.86 Y124.746 E.02411
G1 X138.254 Y129.14 E.23159
G1 X138.254 Y129.786 E.02411
G1 X133.214 Y124.746 E.26568
G1 X132.567 Y124.746 E.02411
G1 X138.254 Y130.433 E.29977
G1 X138.254 Y131.08 E.02411
G1 X131.92 Y124.746 E.33387
G1 X131.273 Y124.746 E.02411
G1 X137.782 Y131.254 E.34306
G1 X137.135 Y131.254 E.02411
G1 X130.626 Y124.746 E.34306
G1 X129.98 Y124.746 E.02411
G1 X136.488 Y131.254 E.34306
G1 X135.842 Y131.254 E.02411
G1 X129.333 Y124.746 E.34306
G1 X128.686 Y124.746 E.02411
M73 P32 R12
G1 X135.195 Y131.254 E.34306
G1 X134.548 Y131.254 E.02411
G1 X128.039 Y124.746 E.34306
G1 X127.392 Y124.746 E.02411
G1 X133.901 Y131.254 E.34306
G1 X133.254 Y131.254 E.02411
G1 X126.746 Y124.746 E.34306
G1 X126.099 Y124.746 E.02411
G1 X132.608 Y131.254 E.34306
G1 X131.961 Y131.254 E.02411
G1 X125.452 Y124.746 E.34306
G1 X124.805 Y124.746 E.02411
G1 X131.314 Y131.254 E.34306
G1 X130.667 Y131.254 E.02411
G1 X124.158 Y124.746 E.34306
G1 X123.512 Y124.746 E.02411
G1 X130.02 Y131.254 E.34306
G1 X129.374 Y131.254 E.02411
G1 X122.865 Y124.746 E.34306
G1 X122.218 Y124.746 E.02411
G1 X128.727 Y131.254 E.34306
G1 X128.08 Y131.254 E.02411
G1 X121.746 Y124.92 E.33386
G1 X121.746 Y125.567 E.02411
G1 X127.433 Y131.254 E.29977
G1 X126.786 Y131.254 E.02411
G1 X121.746 Y126.214 E.26568
G1 X121.746 Y126.86 E.02411
G1 X126.14 Y131.254 E.23159
G1 X125.493 Y131.254 E.02411
G1 X121.746 Y127.507 E.1975
G1 X121.746 Y128.154 E.02411
G1 X124.846 Y131.254 E.16341
G1 X124.199 Y131.254 E.02411
G1 X121.746 Y128.801 E.12932
G1 X121.746 Y129.448 E.02411
G1 X123.552 Y131.254 E.09523
G1 X122.905 Y131.254 E.02411
G1 X121.746 Y130.095 E.06113
G1 X121.746 Y130.741 E.02411
G1 X122.464 Y131.46 E.03788
M106 S252.45
M106 P2 S178
; CHANGE_LAYER
; Z_HEIGHT: 0.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X121.746 Y130.741 E-.38628
G1 X121.746 Y130.095 E-.24579
G1 X121.984 Y130.333 E-.12794
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 2/85
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
G3 Z.6 I-.112 J1.212 P1  F30000
G1 X138.898 Y131.898 Z.6
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3420
G1 X121.102 Y131.898 E.59032
G1 X121.102 Y124.102 E.2586
G1 X138.898 Y124.102 E.59032
G1 X138.898 Y131.838 E.25661
G1 X139.29 Y132.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3420
G1 X120.71 Y132.29 E.57091
G1 X120.71 Y123.71 E.26364
G1 X139.29 Y123.71 E.57091
G1 X139.29 Y132.23 E.2618
M204 S10000
; WIPE_START
G1 F24000
G1 X137.29 Y132.236 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I.732 J.972 P1  F30000
G1 X137.956 Y131.734 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.427413
M73 P33 R12
G1 F3420
G1 X138.565 Y131.126 E.02695
G1 X138.565 Y130.582 E.01704
G1 X137.582 Y131.565 E.04353
G1 X137.039 Y131.565 E.01704
G1 X138.565 Y130.039 E.06762
G1 X138.565 Y129.495 E.01704
G1 X136.495 Y131.565 E.09172
G1 X135.951 Y131.565 E.01704
G1 X138.565 Y128.951 E.11581
G1 X138.565 Y128.407 E.01704
G1 X135.407 Y131.565 E.1399
G1 X134.864 Y131.565 E.01704
G1 X138.565 Y127.864 E.164
G1 X138.565 Y127.32 E.01704
G1 X134.32 Y131.565 E.18809
G1 X133.776 Y131.565 E.01704
G1 X138.565 Y126.776 E.21218
G1 X138.565 Y126.232 E.01704
G1 X133.232 Y131.565 E.23628
G1 X132.688 Y131.565 E.01704
G1 X138.565 Y125.688 E.26037
G1 X138.565 Y125.145 E.01704
G1 X132.145 Y131.565 E.28446
G1 X131.601 Y131.565 E.01704
G1 X138.565 Y124.601 E.30856
G1 X138.565 Y124.435 E.00519
G1 X138.187 Y124.435 E.01185
G1 X131.057 Y131.565 E.31589
G1 X130.513 Y131.565 E.01704
G1 X137.643 Y124.435 E.31589
G1 X137.099 Y124.435 E.01704
G1 X129.97 Y131.565 E.31589
G1 X129.426 Y131.565 E.01704
G1 X136.555 Y124.435 E.31589
G1 X136.012 Y124.435 E.01704
G1 X128.882 Y131.565 E.31589
G1 X128.338 Y131.565 E.01704
G1 X135.468 Y124.435 E.31589
G1 X134.924 Y124.435 E.01704
G1 X127.795 Y131.565 E.31589
G1 X127.251 Y131.565 E.01704
G1 X134.38 Y124.435 E.31589
G1 X133.836 Y124.435 E.01704
G1 X126.707 Y131.565 E.31589
G1 X126.163 Y131.565 E.01704
G1 X133.293 Y124.435 E.31589
G1 X132.749 Y124.435 E.01704
G1 X125.62 Y131.565 E.31589
G1 X125.076 Y131.565 E.01704
G1 X132.205 Y124.435 E.31589
G1 X131.661 Y124.435 E.01704
G1 X124.532 Y131.565 E.31589
G1 X123.988 Y131.565 E.01704
G1 X131.118 Y124.435 E.31589
G1 X130.574 Y124.435 E.01704
G1 X123.445 Y131.565 E.31589
G1 X122.901 Y131.565 E.01704
G1 X130.03 Y124.435 E.31589
G1 X129.486 Y124.435 E.01704
G1 X122.357 Y131.565 E.31589
G1 X121.813 Y131.565 E.01704
G1 X128.943 Y124.435 E.31589
G1 X128.399 Y124.435 E.01704
G1 X121.435 Y131.399 E.30855
G1 X121.435 Y130.855 E.01704
G1 X127.855 Y124.435 E.28446
G1 X127.311 Y124.435 E.01704
G1 X121.435 Y130.311 E.26036
G1 X121.435 Y129.768 E.01704
G1 X126.768 Y124.435 E.23627
G1 X126.224 Y124.435 E.01704
M73 P33 R11
G1 X121.435 Y129.224 E.21218
G1 X121.435 Y128.68 E.01704
G1 X125.68 Y124.435 E.18808
G1 X125.136 Y124.435 E.01704
G1 X121.435 Y128.136 E.16399
G1 X121.435 Y127.593 E.01704
G1 X124.593 Y124.435 E.1399
G1 X124.049 Y124.435 E.01704
G1 X121.435 Y127.049 E.1158
G1 X121.435 Y126.505 E.01704
G1 X123.505 Y124.435 E.09171
G1 X122.961 Y124.435 E.01704
G1 X121.435 Y125.961 E.06762
G1 X121.435 Y125.418 E.01704
G1 X122.418 Y124.435 E.04352
G1 X121.874 Y124.435 E.01704
G1 X121.266 Y125.044 E.02695
; CHANGE_LAYER
; Z_HEIGHT: 0.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X121.874 Y124.435 E-.32685
G1 X122.418 Y124.435 E-.20663
G1 X121.996 Y124.857 E-.22652
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 3/85
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
G3 Z.8 I-.468 J1.123 P1  F30000
G1 X138.898 Y131.898 Z.8
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3426
G1 X121.102 Y131.898 E.59032
G1 X121.102 Y124.102 E.2586
G1 X138.898 Y124.102 E.59032
G1 X138.898 Y131.838 E.25661
G1 X139.29 Y132.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3426
G1 X120.71 Y132.29 E.57091
G1 X120.71 Y123.71 E.26364
G1 X139.29 Y123.71 E.57091
G1 X139.29 Y132.23 E.2618
M204 S10000
; WIPE_START
G1 F24000
G1 X137.29 Y132.236 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I1.193 J.24 P1  F30000
G1 X138.734 Y125.044 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.427413
G1 F3426
G1 X138.126 Y124.435 E.02695
G1 X137.582 Y124.435 E.01704
G1 X138.565 Y125.418 E.04353
G1 X138.565 Y125.961 E.01704
G1 X137.039 Y124.435 E.06762
G1 X136.495 Y124.435 E.01704
M73 P34 R11
G1 X138.565 Y126.505 E.09172
G1 X138.565 Y127.049 E.01704
G1 X135.951 Y124.435 E.11581
G1 X135.407 Y124.435 E.01704
G1 X138.565 Y127.593 E.1399
G1 X138.565 Y128.136 E.01704
G1 X134.864 Y124.435 E.164
G1 X134.32 Y124.435 E.01704
G1 X138.565 Y128.68 E.18809
G1 X138.565 Y129.224 E.01704
G1 X133.776 Y124.435 E.21218
G1 X133.232 Y124.435 E.01704
G1 X138.565 Y129.768 E.23628
G1 X138.565 Y130.312 E.01704
G1 X132.688 Y124.435 E.26037
G1 X132.145 Y124.435 E.01704
G1 X138.565 Y130.855 E.28446
G1 X138.565 Y131.399 E.01704
G1 X131.601 Y124.435 E.30856
G1 X131.057 Y124.435 E.01704
G1 X138.187 Y131.565 E.31589
G1 X137.643 Y131.565 E.01704
G1 X130.513 Y124.435 E.31589
G1 X129.97 Y124.435 E.01704
G1 X137.099 Y131.565 E.31589
G1 X136.555 Y131.565 E.01704
G1 X129.426 Y124.435 E.31589
G1 X128.882 Y124.435 E.01704
G1 X136.012 Y131.565 E.31589
G1 X135.468 Y131.565 E.01704
G1 X128.338 Y124.435 E.31589
G1 X127.795 Y124.435 E.01704
G1 X134.924 Y131.565 E.31589
G1 X134.38 Y131.565 E.01704
G1 X127.251 Y124.435 E.31589
G1 X126.707 Y124.435 E.01704
G1 X133.836 Y131.565 E.31589
G1 X133.293 Y131.565 E.01704
G1 X126.163 Y124.435 E.31589
G1 X125.62 Y124.435 E.01704
G1 X132.749 Y131.565 E.31589
G1 X132.205 Y131.565 E.01704
G1 X125.076 Y124.435 E.31589
G1 X124.532 Y124.435 E.01704
G1 X131.661 Y131.565 E.31589
G1 X131.118 Y131.565 E.01704
G1 X123.988 Y124.435 E.31589
G1 X123.445 Y124.435 E.01704
G1 X130.574 Y131.565 E.31589
G1 X130.03 Y131.565 E.01704
G1 X122.901 Y124.435 E.31589
G1 X122.357 Y124.435 E.01704
G1 X129.486 Y131.565 E.31589
G1 X128.943 Y131.565 E.01704
G1 X121.813 Y124.435 E.31589
G1 X121.435 Y124.435 E.01184
G1 X121.435 Y124.601 E.00519
G1 X128.399 Y131.565 E.30855
G1 X127.855 Y131.565 E.01704
G1 X121.435 Y125.145 E.28446
G1 X121.435 Y125.689 E.01704
G1 X127.311 Y131.565 E.26036
G1 X126.768 Y131.565 E.01704
G1 X121.435 Y126.232 E.23627
G1 X121.435 Y126.776 E.01704
G1 X126.224 Y131.565 E.21218
G1 X125.68 Y131.565 E.01704
G1 X121.435 Y127.32 E.18808
G1 X121.435 Y127.864 E.01704
G1 X125.136 Y131.565 E.16399
G1 X124.593 Y131.565 E.01704
G1 X121.435 Y128.407 E.1399
G1 X121.435 Y128.951 E.01704
G1 X124.049 Y131.565 E.1158
G1 X123.505 Y131.565 E.01704
G1 X121.435 Y129.495 E.09171
G1 X121.435 Y130.039 E.01704
G1 X122.961 Y131.565 E.06762
G1 X122.418 Y131.565 E.01704
G1 X121.435 Y130.582 E.04352
G1 X121.435 Y131.126 E.01704
G1 X122.044 Y131.734 E.02695
; CHANGE_LAYER
; Z_HEIGHT: 0.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X121.435 Y131.126 E-.32686
G1 X121.435 Y130.582 E-.20663
G1 X121.857 Y131.004 E-.22652
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 4/85
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
G3 Z1 I-.064 J1.215 P1  F30000
G1 X138.898 Y131.898 Z1
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1400
G1 X121.102 Y131.898 E.59032
G1 X121.102 Y124.102 E.2586
G1 X138.898 Y124.102 E.59032
G1 X138.898 Y131.838 E.25661
G1 X139.29 Y132.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1400
G1 X120.71 Y132.29 E.57091
G1 X120.71 Y123.71 E.26364
G1 X139.29 Y123.71 E.57091
G1 X139.29 Y132.23 E.2618
M204 S10000
; WIPE_START
G1 F24000
G1 X137.29 Y132.236 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I.583 J1.068 P1  F30000
G1 X138.55 Y131.55 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1400
G1 X134.189 Y131.55 E.14466
G1 X134.189 Y124.45 E.2355
G1 X138.55 Y124.45 E.14466
G1 X138.55 Y131.49 E.23351
G1 X136.162 Y131.143 F30000
G1 F1400
G1 X134.596 Y131.143 E.05194
G1 X134.596 Y131.08 E.00207
G1 X138.143 Y127.533 E.16638
G1 X138.143 Y128.467 E.03096
G1 X134.596 Y124.92 E.16638
G1 X134.596 Y124.857 E.00207
G1 X136.162 Y124.857 E.05194
G1 X131.921 Y124.45 F30000
G1 F1400
G1 X133.55 Y124.45 E.05401
G1 X126.45 Y131.55 E.33304
G1 X125.874 Y131.55 E.01913
G1 X121.45 Y127.126 E.20751
G1 X121.45 Y128.874 E.05796
G1 X125.874 Y124.45 E.20751
G1 X126.45 Y124.45 E.01913
G1 X133.55 Y131.55 E.33304
G1 X133.782 Y131.55 E.0077
G1 X133.782 Y130.153 E.04632
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X133.782 Y131.55 E-.53056
G1 X133.55 Y131.55 E-.0882
G1 X133.287 Y131.287 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 5/85
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
G3 Z1.2 I-.132 J1.21 P1  F30000
G1 X138.898 Y131.898 Z1.2
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1396
G1 X121.102 Y131.898 E.59032
G1 X121.102 Y124.102 E.2586
M73 P35 R11
G1 X138.898 Y124.102 E.59032
G1 X138.898 Y131.838 E.25661
G1 X139.29 Y132.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1396
G1 X120.71 Y132.29 E.57091
G1 X120.71 Y123.71 E.26364
G1 X139.29 Y123.71 E.57091
G1 X139.29 Y132.23 E.2618
M204 S10000
; WIPE_START
G1 F24000
G1 X137.29 Y132.236 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I.583 J1.068 P1  F30000
G1 X138.55 Y131.55 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1396
G1 X134.189 Y131.55 E.14466
G1 X134.189 Y124.45 E.2355
G1 X138.55 Y124.45 E.14466
G1 X138.55 Y131.49 E.23351
G1 X136.162 Y131.143 F30000
G1 F1396
G1 X134.596 Y131.143 E.05194
G1 X134.596 Y131.08 E.00207
G1 X138.143 Y127.533 E.16638
G1 X138.143 Y128.467 E.03096
G1 X134.596 Y124.92 E.16638
G1 X134.596 Y124.857 E.00207
G1 X136.162 Y124.857 E.05194
G1 X131.921 Y124.45 F30000
G1 F1396
G1 X133.55 Y124.45 E.05401
G1 X126.45 Y131.55 E.33304
G1 X125.874 Y131.55 E.01913
G1 X121.45 Y127.126 E.20751
G1 X121.45 Y128.874 E.05796
G1 X125.874 Y124.45 E.20751
G1 X126.45 Y124.45 E.01913
G1 X133.55 Y131.55 E.33304
G1 X133.782 Y131.55 E.0077
G1 X133.782 Y130.153 E.04632
; CHANGE_LAYER
; Z_HEIGHT: 1.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X133.782 Y131.55 E-.53056
G1 X133.55 Y131.55 E-.0882
G1 X133.287 Y131.287 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 6/85
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
G3 Z1.4 I-.132 J1.21 P1  F30000
G1 X138.898 Y131.898 Z1.4
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1396
G1 X121.102 Y131.898 E.59032
G1 X121.102 Y124.102 E.2586
G1 X138.898 Y124.102 E.59032
G1 X138.898 Y131.838 E.25661
G1 X139.29 Y132.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1396
G1 X120.71 Y132.29 E.57091
G1 X120.71 Y123.71 E.26364
M73 P36 R11
G1 X139.29 Y123.71 E.57091
G1 X139.29 Y132.23 E.2618
M204 S10000
; WIPE_START
G1 F24000
G1 X137.29 Y132.236 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I.583 J1.068 P1  F30000
G1 X138.55 Y131.55 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1396
G1 X134.189 Y131.55 E.14466
G1 X134.189 Y124.45 E.2355
G1 X138.55 Y124.45 E.14466
G1 X138.55 Y131.49 E.23351
G1 X136.162 Y131.143 F30000
G1 F1396
G1 X134.596 Y131.143 E.05194
G1 X134.596 Y131.08 E.00207
G1 X138.143 Y127.533 E.16638
G1 X138.143 Y128.467 E.03096
G1 X134.596 Y124.92 E.16638
G1 X134.596 Y124.857 E.00207
G1 X136.162 Y124.857 E.05194
G1 X131.921 Y124.45 F30000
G1 F1396
G1 X133.55 Y124.45 E.05401
G1 X126.45 Y131.55 E.33304
G1 X125.874 Y131.55 E.01913
G1 X121.45 Y127.126 E.20751
G1 X121.45 Y128.874 E.05796
G1 X125.874 Y124.45 E.20751
G1 X126.45 Y124.45 E.01913
G1 X133.55 Y131.55 E.33304
G1 X133.782 Y131.55 E.0077
G1 X133.782 Y130.153 E.04632
; CHANGE_LAYER
; Z_HEIGHT: 1.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X133.782 Y131.55 E-.53056
G1 X133.55 Y131.55 E-.0882
G1 X133.287 Y131.287 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 7/85
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
G3 Z1.6 I-.132 J1.21 P1  F30000
G1 X138.898 Y131.898 Z1.6
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1396
G1 X121.102 Y131.898 E.59032
G1 X121.102 Y124.102 E.2586
G1 X138.898 Y124.102 E.59032
G1 X138.898 Y131.838 E.25661
G1 X139.29 Y132.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1396
G1 X120.71 Y132.29 E.57091
G1 X120.71 Y123.71 E.26364
G1 X139.29 Y123.71 E.57091
G1 X139.29 Y132.23 E.2618
M204 S10000
; WIPE_START
G1 F24000
G1 X137.29 Y132.236 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I.583 J1.068 P1  F30000
G1 X138.55 Y131.55 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1396
G1 X134.189 Y131.55 E.14466
G1 X134.189 Y124.45 E.2355
G1 X138.55 Y124.45 E.14466
G1 X138.55 Y131.49 E.23351
G1 X136.162 Y131.143 F30000
G1 F1396
G1 X134.596 Y131.143 E.05194
G1 X134.596 Y131.08 E.00207
G1 X138.143 Y127.533 E.16638
G1 X138.143 Y128.467 E.03096
M73 P37 R11
G1 X134.596 Y124.92 E.16638
G1 X134.596 Y124.857 E.00207
G1 X136.162 Y124.857 E.05194
G1 X131.921 Y124.45 F30000
G1 F1396
G1 X133.55 Y124.45 E.05401
G1 X126.45 Y131.55 E.33304
G1 X125.874 Y131.55 E.01913
G1 X121.45 Y127.126 E.20751
G1 X121.45 Y128.874 E.05796
G1 X125.874 Y124.45 E.20751
G1 X126.45 Y124.45 E.01913
G1 X133.55 Y131.55 E.33304
G1 X133.782 Y131.55 E.0077
G1 X133.782 Y130.153 E.04632
; CHANGE_LAYER
; Z_HEIGHT: 1.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X133.782 Y131.55 E-.53056
G1 X133.55 Y131.55 E-.0882
G1 X133.287 Y131.287 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 8/85
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
G3 Z1.8 I-.132 J1.21 P1  F30000
G1 X138.898 Y131.898 Z1.8
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1359
G1 X121.102 Y131.898 E.59032
G1 X121.102 Y124.102 E.2586
G1 X138.898 Y124.102 E.59032
G1 X138.898 Y131.838 E.25661
G1 X139.29 Y132.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1359
G1 X120.71 Y132.29 E.57091
G1 X120.71 Y123.71 E.26364
G1 X139.29 Y123.71 E.57091
G1 X139.29 Y132.23 E.2618
M204 S10000
G1 X138.515 Y131.731 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.426789
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X138.515 Y124.472 E.4231
G1 X138.038 Y124.472 E.02779
G1 X138.038 Y131.528 E.4113
G1 X137.561 Y131.528 E.02779
G1 X137.561 Y124.472 E.4113
G1 X137.084 Y124.472 E.02779
G1 X137.084 Y131.528 E.4113
G1 X136.608 Y131.528 E.02779
G1 X136.608 Y124.472 E.4113
G1 X136.131 Y124.472 E.02779
G1 X136.131 Y131.528 E.4113
G1 X135.654 Y131.528 E.02779
G1 X135.654 Y124.472 E.4113
G1 X135.177 Y124.472 E.02779
G1 X135.177 Y131.528 E.4113
G1 X134.7 Y131.528 E.02779
G1 X134.7 Y124.472 E.4113
G1 X134.224 Y124.472 E.02779
G1 X134.224 Y131.731 E.4231
M106 S252.45
G1 X133.782 Y130.153 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1359
G1 X133.782 Y131.55 E.04632
G1 X133.55 Y131.55 E.0077
G1 X126.45 Y124.45 E.33304
G1 X125.874 Y124.45 E.01913
G1 X121.45 Y128.874 E.20751
G1 X121.45 Y127.126 E.05796
G1 X125.874 Y131.55 E.20751
G1 X126.45 Y131.55 E.01913
G1 X133.55 Y124.45 E.33304
G1 X131.921 Y124.45 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X133.55 Y124.45 E-.61876
G1 X133.287 Y124.713 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 9/85
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
G3 Z2 I-.959 J.749 P1  F30000
G1 X138.898 Y131.898 Z2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1806
G1 X121.102 Y131.898 E.59032
M73 P38 R11
G1 X121.102 Y124.102 E.2586
G1 X138.898 Y124.102 E.59032
G1 X138.898 Y131.838 E.25661
G1 X139.29 Y132.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1806
G1 X120.71 Y132.29 E.57091
G1 X120.71 Y123.71 E.26364
G1 X139.29 Y123.71 E.57091
G1 X139.29 Y132.23 E.2618
M204 S10000
; WIPE_START
G1 F24000
G1 X137.29 Y132.236 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I1.112 J-.495 P1  F30000
G1 X136.105 Y129.574 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.512073
G1 F1806
G1 X136.574 Y129.574 E.01794
G1 X136.574 Y126.426 E.12038
G1 X136.105 Y126.426 E.01794
G1 X136.105 Y129.514 E.11809
G1 X135.682 Y129.998 F30000
; LINE_WIDTH: 0.419999
G1 F1806
G1 X136.998 Y129.998 E.04042
G1 X136.998 Y126.002 E.12276
G1 X135.682 Y126.002 E.04042
G1 X135.682 Y129.938 E.12091
G1 X135.305 Y130.375 F30000
G1 F1806
G1 X137.375 Y130.375 E.06359
G1 X137.375 Y125.625 E.14593
G1 X135.305 Y125.625 E.06359
G1 X135.305 Y130.315 E.14409
G1 X134.928 Y130.752 F30000
G1 F1806
G1 X137.752 Y130.752 E.08676
G1 X137.752 Y125.248 E.1691
G1 X134.928 Y125.248 E.08676
G1 X134.928 Y130.692 E.16726
G1 X134.551 Y131.129 F30000
G1 F1806
G1 X138.129 Y131.129 E.10994
G1 X138.129 Y124.871 E.19228
G1 X134.551 Y124.871 E.10994
G1 X134.551 Y131.069 E.19043
G1 X134.174 Y131.506 F30000
G1 F1806
G1 X138.506 Y131.506 E.13311
G1 X138.506 Y124.494 E.21545
G1 X134.174 Y124.494 E.13311
G1 X134.174 Y131.446 E.21361
G1 X133.782 Y130.153 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1806
G1 X133.782 Y131.55 E.04632
G1 X133.55 Y131.55 E.0077
G1 X126.45 Y124.45 E.33304
G1 X125.874 Y124.45 E.01913
G1 X121.45 Y128.874 E.20751
G1 X121.45 Y127.126 E.05796
G1 X125.874 Y131.55 E.20751
M73 P39 R11
G1 X126.45 Y131.55 E.01913
G1 X133.55 Y124.45 E.33304
G1 X131.921 Y124.45 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X133.55 Y124.45 E-.61876
G1 X133.287 Y124.713 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 10/85
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
G3 Z2.2 I-1.115 J.487 P1  F30000
G1 X136.422 Y131.898 Z2.2
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1910
G1 X121.102 Y131.898 E.5082
G1 X121.102 Y124.102 E.2586
G1 X136.422 Y124.102 E.5082
G1 X136.422 Y131.838 E.25661
; WIPE_START
G1 F24000
M73 P39 R10
G1 X134.422 Y131.846 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-.111 J1.212 P1  F30000
G1 X139.29 Y132.29 Z2.4
G1 Z2
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1910
G1 X120.71 Y132.29 E.57091
G1 X120.71 Y123.71 E.26364
G1 X139.29 Y123.71 E.57091
G1 X139.29 Y132.23 E.2618
M204 S10000
G1 X138.449 Y132.083 F30000
M204 S2000
; FEATURE: Top surface
G1 F1910
G1 X139.083 Y131.449 E.02753
G1 X139.083 Y130.916
G1 X137.916 Y132.083 E.0507
G1 X137.383 Y132.083
G1 X139.083 Y130.383 E.07387
G1 X139.083 Y129.849
G1 X136.849 Y132.083 E.09705
G1 X136.645 Y131.754
G1 X139.083 Y129.316 E.10594
G1 X139.083 Y128.783
G1 X136.645 Y131.221 E.10594
G1 X136.645 Y130.688
G1 X139.083 Y128.25 E.10594
G1 X139.083 Y127.716
G1 X136.645 Y130.154 E.10594
G1 X136.645 Y129.621
G1 X139.083 Y127.183 E.10594
G1 X139.083 Y126.65
G1 X136.645 Y129.088 E.10594
G1 X136.645 Y128.554
G1 X139.083 Y126.116 E.10594
G1 X139.083 Y125.583
G1 X136.645 Y128.021 E.10594
G1 X136.645 Y127.488
G1 X139.083 Y125.05 E.10594
G1 X139.083 Y124.517
G1 X136.645 Y126.955 E.10594
G1 X136.645 Y126.421
G1 X139.083 Y123.983 E.10594
G1 X138.615 Y123.917
G1 X136.645 Y125.888 E.08564
G1 X136.645 Y125.355
G1 X138.082 Y123.917 E.06246
G1 X137.549 Y123.917
G1 X136.645 Y124.822 E.03929
G1 X136.645 Y124.288
G1 X137.016 Y123.917 E.01612
M204 S10000
G1 X134.296 Y126.249 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1910
G1 X134.296 Y124.621 E.05401
G1 X134.126 Y124.45 E.00798
G1 X133.55 Y124.45 E.01913
G1 X126.45 Y131.55 E.33304
G1 X125.874 Y131.55 E.01913
G1 X121.45 Y127.126 E.20751
G1 X121.45 Y128.874 E.05796
G1 X125.874 Y124.45 E.20751
G1 X126.45 Y124.45 E.01913
G1 X133.55 Y131.55 E.33304
G1 X134.126 Y131.55 E.01913
G1 X134.296 Y131.379 E.00798
G1 X134.296 Y129.751 E.05401
G1 X135.657 Y131.676 F30000
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F1910
G1 X136.2 Y131.132 E.0236
G1 X136.2 Y130.599
G1 X135.123 Y131.676 E.04678
G1 X134.59 Y131.676
G1 X136.2 Y130.066 E.06995
G1 X136.2 Y129.533
G1 X134.519 Y131.213 E.07305
G1 X134.519 Y130.68
G1 X136.2 Y128.999 E.07305
G1 X136.2 Y128.466
G1 X134.519 Y130.147 E.07305
G1 X134.519 Y129.614
G1 X136.2 Y127.933 E.07305
G1 X136.2 Y127.399
G1 X134.519 Y129.08 E.07305
G1 X134.519 Y128.547
G1 X136.2 Y126.866 E.07305
G1 X136.2 Y126.333
G1 X134.519 Y128.014 E.07305
G1 X134.519 Y127.481
G1 X136.2 Y125.8 E.07305
G1 X136.2 Y125.266
G1 X134.519 Y126.947 E.07305
G1 X134.519 Y126.414
G1 X136.2 Y124.733 E.07305
G1 X136.075 Y124.324
G1 X134.519 Y125.881 E.06763
G1 X134.519 Y125.348
G1 X135.542 Y124.324 E.04446
G1 X135.009 Y124.324
G1 X134.519 Y124.814 E.02128
M204 S10000
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 2.2
; LAYER_HEIGHT: 0.2
; WIPE_START
M73 P40 R10
G1 F24000
G1 X135.009 Y124.324 E-.26321
G1 X135.542 Y124.324 E-.20264
G1 X134.995 Y124.872 E-.29415
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 11/85
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
G3 Z2.4 I-1.175 J.318 P1  F30000
G1 X136.898 Y131.898 Z2.4
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X121.102 Y131.898 E.52398
G1 X121.102 Y124.102 E.2586
G1 X136.898 Y124.102 E.52398
G1 X136.898 Y131.838 E.25661
G1 X137.29 Y132.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X120.71 Y132.29 E.50946
G1 X120.71 Y123.71 E.26364
G1 X137.29 Y123.71 E.50946
G1 X137.29 Y132.23 E.2618
M204 S10000
; WIPE_START
G1 F24000
G1 X135.29 Y132.237 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I.927 J.788 P1  F30000
G1 X136.55 Y130.755 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X136.55 Y129.126 E.05401
G1 X134.126 Y131.55 E.11368
G1 X133.55 Y131.55 E.01913
G1 X126.45 Y124.45 E.33304
G1 X125.874 Y124.45 E.01913
G1 X121.45 Y128.874 E.20751
G1 X121.45 Y127.126 E.05796
G1 X125.874 Y131.55 E.20751
G1 X126.45 Y131.55 E.01913
G1 X133.55 Y124.45 E.33304
G1 X134.126 Y124.45 E.01913
G1 X136.55 Y126.874 E.11368
G1 X136.55 Y125.245 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 2.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X136.55 Y126.874 E-.61876
G1 X136.287 Y126.611 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 12/85
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
G3 Z2.6 I-1.209 J.14 P1  F30000
G1 X136.898 Y131.898 Z2.6
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X121.102 Y131.898 E.52398
G1 X121.102 Y124.102 E.2586
G1 X136.898 Y124.102 E.52398
G1 X136.898 Y131.838 E.25661
G1 X137.29 Y132.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X120.71 Y132.29 E.50946
G1 X120.71 Y123.71 E.26364
G1 X137.29 Y123.71 E.50946
G1 X137.29 Y132.23 E.2618
M204 S10000
; WIPE_START
G1 F24000
G1 X135.29 Y132.237 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I.927 J.788 P1  F30000
G1 X136.55 Y130.755 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X136.55 Y129.126 E.05401
G1 X134.126 Y131.55 E.11368
G1 X133.55 Y131.55 E.01913
G1 X126.45 Y124.45 E.33304
G1 X125.874 Y124.45 E.01913
G1 X121.45 Y128.874 E.20751
G1 X121.45 Y127.126 E.05796
G1 X125.874 Y131.55 E.20751
G1 X126.45 Y131.55 E.01913
G1 X133.55 Y124.45 E.33304
G1 X134.126 Y124.45 E.01913
G1 X136.55 Y126.874 E.11368
G1 X136.55 Y125.245 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 2.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X136.55 Y126.874 E-.61876
G1 X136.287 Y126.611 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 13/85
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
G3 Z2.8 I-1.209 J.14 P1  F30000
G1 X136.898 Y131.898 Z2.8
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X121.102 Y131.898 E.52398
G1 X121.102 Y124.102 E.2586
G1 X136.898 Y124.102 E.52398
G1 X136.898 Y131.838 E.25661
G1 X137.29 Y132.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X120.71 Y132.29 E.50946
G1 X120.71 Y123.71 E.26364
G1 X137.29 Y123.71 E.50946
G1 X137.29 Y132.23 E.2618
M204 S10000
; WIPE_START
M73 P41 R10
G1 F24000
G1 X135.29 Y132.237 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I.927 J.788 P1  F30000
G1 X136.55 Y130.755 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X136.55 Y129.126 E.05401
G1 X134.126 Y131.55 E.11368
G1 X133.55 Y131.55 E.01913
G1 X126.45 Y124.45 E.33304
G1 X125.874 Y124.45 E.01913
G1 X121.45 Y128.874 E.20751
G1 X121.45 Y127.126 E.05796
G1 X125.874 Y131.55 E.20751
G1 X126.45 Y131.55 E.01913
G1 X133.55 Y124.45 E.33304
G1 X134.126 Y124.45 E.01913
G1 X136.55 Y126.874 E.11368
G1 X136.55 Y125.245 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 2.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X136.55 Y126.874 E-.61876
G1 X136.287 Y126.611 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 14/85
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
G3 Z3 I-1.209 J.14 P1  F30000
G1 X136.898 Y131.898 Z3
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X121.102 Y131.898 E.52398
G1 X121.102 Y124.102 E.2586
G1 X136.898 Y124.102 E.52398
G1 X136.898 Y131.838 E.25661
G1 X137.29 Y132.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X120.71 Y132.29 E.50946
G1 X120.71 Y123.71 E.26364
G1 X137.29 Y123.71 E.50946
G1 X137.29 Y132.23 E.2618
M204 S10000
; WIPE_START
G1 F24000
G1 X135.29 Y132.237 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I.927 J.788 P1  F30000
G1 X136.55 Y130.755 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X136.55 Y129.126 E.05401
M73 P42 R10
G1 X134.126 Y131.55 E.11368
G1 X133.55 Y131.55 E.01913
G1 X126.45 Y124.45 E.33304
G1 X125.874 Y124.45 E.01913
G1 X121.45 Y128.874 E.20751
G1 X121.45 Y127.126 E.05796
G1 X125.874 Y131.55 E.20751
G1 X126.45 Y131.55 E.01913
G1 X133.55 Y124.45 E.33304
G1 X134.126 Y124.45 E.01913
G1 X136.55 Y126.874 E.11368
G1 X136.55 Y125.245 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 3
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X136.55 Y126.874 E-.61876
G1 X136.287 Y126.611 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 15/85
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
G3 Z3.2 I-1.209 J.14 P1  F30000
G1 X136.898 Y131.898 Z3.2
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X121.102 Y131.898 E.52398
G1 X121.102 Y124.102 E.2586
G1 X136.898 Y124.102 E.52398
G1 X136.898 Y131.838 E.25661
G1 X137.29 Y132.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X120.71 Y132.29 E.50946
G1 X120.71 Y123.71 E.26364
G1 X137.29 Y123.71 E.50946
G1 X137.29 Y132.23 E.2618
M204 S10000
; WIPE_START
G1 F24000
G1 X135.29 Y132.237 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.927 J.788 P1  F30000
G1 X136.55 Y130.755 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X136.55 Y129.126 E.05401
G1 X134.126 Y131.55 E.11368
G1 X133.55 Y131.55 E.01913
G1 X126.45 Y124.45 E.33304
G1 X125.874 Y124.45 E.01913
G1 X121.45 Y128.874 E.20751
G1 X121.45 Y127.126 E.05796
G1 X125.874 Y131.55 E.20751
G1 X126.45 Y131.55 E.01913
G1 X133.55 Y124.45 E.33304
G1 X134.126 Y124.45 E.01913
G1 X136.55 Y126.874 E.11368
G1 X136.55 Y125.245 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 3.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X136.55 Y126.874 E-.61876
G1 X136.287 Y126.611 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 16/85
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
G3 Z3.4 I-1.209 J.14 P1  F30000
G1 X136.898 Y131.898 Z3.4
G1 Z3.2
M73 P43 R10
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X121.102 Y131.898 E.52398
G1 X121.102 Y124.102 E.2586
G1 X136.898 Y124.102 E.52398
G1 X136.898 Y131.838 E.25661
G1 X137.29 Y132.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X120.71 Y132.29 E.50946
G1 X120.71 Y123.71 E.26364
G1 X137.29 Y123.71 E.50946
G1 X137.29 Y132.23 E.2618
M204 S10000
; WIPE_START
G1 F24000
G1 X135.29 Y132.237 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I.927 J.788 P1  F30000
G1 X136.55 Y130.755 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X136.55 Y129.126 E.05401
G1 X134.126 Y131.55 E.11368
G1 X133.55 Y131.55 E.01913
G1 X126.45 Y124.45 E.33304
G1 X125.874 Y124.45 E.01913
G1 X121.45 Y128.874 E.20751
G1 X121.45 Y127.126 E.05796
G1 X125.874 Y131.55 E.20751
G1 X126.45 Y131.55 E.01913
G1 X133.55 Y124.45 E.33304
G1 X134.126 Y124.45 E.01913
G1 X136.55 Y126.874 E.11368
G1 X136.55 Y125.245 E.05401
M106 S252.45
; CHANGE_LAYER
; Z_HEIGHT: 3.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X136.55 Y126.874 E-.61876
G1 X136.287 Y126.611 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 17/85
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
G3 Z3.6 I-1.209 J.14 P1  F30000
G1 X136.898 Y131.898 Z3.6
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1394
G1 X121.102 Y131.898 E.52398
G1 X121.102 Y124.102 E.2586
G1 X136.898 Y124.102 E.52398
G1 X136.898 Y131.838 E.25661
G1 X137.29 Y132.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1394
G1 X120.71 Y132.29 E.50946
G1 X120.71 Y123.71 E.26364
G1 X137.29 Y123.71 E.50946
G1 X137.29 Y132.23 E.2618
M204 S10000
; WIPE_START
G1 F24000
G1 X135.29 Y132.237 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I.366 J-1.161 P1  F30000
G1 X131.362 Y130.999 Z3.8
M73 P44 R10
G1 Z3.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1394
G1 X131.371 Y129.371 E.05401
G1 X126.857 Y124.857 E.21173
G1 X125.467 Y124.857 E.04614
G1 X123.625 Y126.699 E.08642
G2 X123.629 Y129.305 I117.877 J1.102 E.08643
G1 X125.467 Y131.143 E.08621
G1 X126.857 Y131.143 E.04614
G1 X131.375 Y126.625 E.21193
G1 X131.366 Y124.997 E.05401
G1 X132.44 Y124.45 F30000
G1 F1394
G1 X132.177 Y124.45 E.00874
G1 X132.185 Y125.815 E.04528
G1 X133.55 Y124.45 E.06403
G1 X134.126 Y124.45 E.01913
G1 X136.55 Y126.874 E.11369
G1 X136.55 Y129.126 E.07472
G1 X134.126 Y131.55 E.11369
G1 X133.55 Y131.55 E.01913
G1 X132.18 Y130.18 E.06424
G1 X132.189 Y128.552 E.05401
G1 X131.788 Y127.591 F30000
G1 F1394
G3 X131.766 Y131.55 I-343.101 J.084 E.13133
G1 X123.234 Y131.55 E.283
G3 X123.23 Y124.45 I319.82 J-3.746 E.2355
G1 X131.77 Y124.45 E.28329
G1 X131.787 Y127.531 E.10218
G1 X121.45 Y125.498 F30000
G1 F1394
G1 X121.45 Y127.126 E.05401
G1 X122.81 Y128.486 E.0638
G1 X122.806 Y127.518 E.03211
G1 X121.45 Y128.874 E.06359
G1 X121.45 Y130.502 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 3.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X121.45 Y128.874 E-.61876
M73 P44 R9
G1 X121.713 Y128.611 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 18/85
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
G3 Z3.8 I-.257 J1.189 P1  F30000
G1 X136.898 Y131.898 Z3.8
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1398
G1 X121.102 Y131.898 E.52398
G1 X121.102 Y124.102 E.2586
G1 X136.898 Y124.102 E.52398
G1 X136.898 Y131.838 E.25661
G1 X137.29 Y132.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1398
G1 X120.71 Y132.29 E.50946
G1 X120.71 Y123.71 E.26364
G1 X137.29 Y123.71 E.50946
G1 X137.29 Y132.23 E.2618
M204 S10000
; WIPE_START
G1 F24000
G1 X135.29 Y132.237 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I.366 J-1.161 P1  F30000
M73 P45 R9
G1 X131.362 Y130.999 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1398
G1 X131.371 Y129.371 E.05401
G1 X126.857 Y124.857 E.21173
G1 X125.467 Y124.857 E.04614
G1 X123.625 Y126.699 E.08642
G2 X123.629 Y129.305 I117.877 J1.102 E.08643
G1 X125.467 Y131.143 E.08621
G1 X126.857 Y131.143 E.04614
G1 X131.375 Y126.625 E.21193
G1 X131.366 Y124.997 E.05401
G1 X132.44 Y124.45 F30000
G1 F1398
G1 X132.177 Y124.45 E.00874
G1 X132.185 Y125.815 E.04528
G1 X133.55 Y124.45 E.06403
G1 X134.126 Y124.45 E.01913
G1 X136.55 Y126.874 E.11369
G1 X136.55 Y129.126 E.07472
G1 X134.126 Y131.55 E.11369
G1 X133.55 Y131.55 E.01913
G1 X132.18 Y130.18 E.06424
G1 X132.189 Y128.552 E.05401
G1 X131.788 Y127.591 F30000
G1 F1398
G3 X131.766 Y131.55 I-343.101 J.084 E.13133
G1 X123.234 Y131.55 E.283
G3 X123.23 Y124.45 I319.82 J-3.746 E.2355
G1 X131.77 Y124.45 E.28329
G1 X131.787 Y127.531 E.10218
G1 X121.45 Y125.498 F30000
G1 F1398
G1 X121.45 Y127.126 E.05401
G1 X122.81 Y128.486 E.0638
G1 X122.806 Y127.518 E.03211
G1 X121.45 Y128.874 E.06359
G1 X121.45 Y130.502 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 3.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X121.45 Y128.874 E-.61876
G1 X121.713 Y128.611 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 19/85
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
G3 Z4 I-.257 J1.189 P1  F30000
G1 X136.898 Y131.898 Z4
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1428
G1 X121.102 Y131.898 E.52398
G1 X121.102 Y124.102 E.2586
G1 X136.898 Y124.102 E.52398
G1 X136.898 Y131.838 E.25661
G1 X137.29 Y132.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1428
G1 X120.71 Y132.29 E.50946
G1 X120.71 Y123.71 E.26364
G1 X137.29 Y123.71 E.50946
G1 X137.29 Y132.23 E.2618
M204 S10000
; WIPE_START
G1 F24000
G1 X135.29 Y132.237 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I.513 J-1.104 P1  F30000
G1 X133.811 Y131.55 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1428
G1 X123.234 Y131.55 E.35085
G3 X123.23 Y124.45 I319.82 J-3.746 E.2355
G1 X133.811 Y124.45 E.351
G1 X133.811 Y131.49 E.23351
G1 X134.218 Y126.171 F30000
G1 F1428
G1 X134.218 Y124.542 E.05401
G1 X136.55 Y126.874 E.10937
G1 X136.55 Y129.126 E.07472
G1 X134.218 Y131.458 E.10937
G1 X134.218 Y129.829 E.05401
G1 X133.404 Y129.776 F30000
G1 F1428
G1 X133.404 Y131.143 E.04534
G1 X133.143 Y131.143 E.00867
G1 X126.857 Y124.857 E.29485
G1 X125.467 Y124.857 E.04614
M73 P46 R9
G1 X123.625 Y126.699 E.08642
G2 X123.629 Y129.305 I117.877 J1.102 E.08643
G1 X125.467 Y131.143 E.08621
G1 X126.857 Y131.143 E.04614
G1 X133.143 Y124.857 E.29485
G1 X131.514 Y124.857 E.05401
G1 X121.45 Y125.498 F30000
G1 F1428
G1 X121.45 Y127.126 E.05401
G1 X122.81 Y128.486 E.0638
G1 X122.806 Y127.518 E.03211
G1 X121.45 Y128.874 E.06359
G1 X121.45 Y130.502 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X121.45 Y128.874 E-.61876
G1 X121.713 Y128.611 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 20/85
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
G3 Z4.2 I-.257 J1.189 P1  F30000
G1 X136.898 Y131.898 Z4.2
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1428
G1 X121.102 Y131.898 E.52398
G1 X121.102 Y124.102 E.2586
G1 X136.898 Y124.102 E.52398
G1 X136.898 Y131.838 E.25661
G1 X137.29 Y132.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1428
G1 X120.71 Y132.29 E.50946
G1 X120.71 Y123.71 E.26364
G1 X137.29 Y123.71 E.50946
G1 X137.29 Y132.23 E.2618
M204 S10000
; WIPE_START
G1 F24000
G1 X135.29 Y132.237 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I.513 J-1.104 P1  F30000
G1 X133.811 Y131.55 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1428
G1 X123.234 Y131.55 E.35085
G3 X123.23 Y124.45 I319.82 J-3.746 E.2355
G1 X133.811 Y124.45 E.351
G1 X133.811 Y131.49 E.23351
G1 X134.218 Y126.171 F30000
G1 F1428
G1 X134.218 Y124.542 E.05401
G1 X136.55 Y126.874 E.10937
G1 X136.55 Y129.126 E.07472
G1 X134.218 Y131.458 E.10937
G1 X134.218 Y129.829 E.05401
G1 X133.404 Y129.776 F30000
G1 F1428
G1 X133.404 Y131.143 E.04534
G1 X133.143 Y131.143 E.00867
G1 X126.857 Y124.857 E.29485
G1 X125.467 Y124.857 E.04614
G1 X123.625 Y126.699 E.08642
G2 X123.629 Y129.305 I117.877 J1.102 E.08643
G1 X125.467 Y131.143 E.08621
G1 X126.857 Y131.143 E.04614
G1 X133.143 Y124.857 E.29485
G1 X131.514 Y124.857 E.05401
G1 X121.45 Y125.498 F30000
G1 F1428
G1 X121.45 Y127.126 E.05401
G1 X122.81 Y128.486 E.0638
G1 X122.806 Y127.518 E.03211
G1 X121.45 Y128.874 E.06359
G1 X121.45 Y130.502 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 4.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X121.45 Y128.874 E-.61876
G1 X121.713 Y128.611 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 21/85
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
G3 Z4.4 I-.257 J1.189 P1  F30000
G1 X136.898 Y131.898 Z4.4
G1 Z4.2
M73 P47 R9
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1777
G1 X121.102 Y131.898 E.52398
G1 X121.102 Y124.102 E.2586
G1 X136.898 Y124.102 E.52398
G1 X136.898 Y131.838 E.25661
G1 X137.29 Y132.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1777
G1 X120.71 Y132.29 E.50946
G1 X120.71 Y123.71 E.26364
G1 X137.29 Y123.71 E.50946
G1 X137.29 Y132.23 E.2618
M204 S10000
; WIPE_START
G1 F24000
G1 X135.29 Y132.237 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I.513 J-1.104 P1  F30000
G1 X133.811 Y131.55 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1777
G1 X132.173 Y131.55 E.05435
G2 X132.177 Y124.45 I-319.923 J-3.746 E.2355
G1 X133.811 Y124.45 E.0542
G1 X133.811 Y131.49 E.23351
G1 X131.778 Y131.731 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.422747
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X131.737 Y124.472 E.41513
G1 X131.264 Y124.472 E.02704
G1 X131.304 Y131.528 E.40355
G1 X130.831 Y131.528 E.02704
G1 X130.792 Y124.472 E.40355
G1 X130.319 Y124.472 E.02704
G1 X130.358 Y131.528 E.40355
G1 X129.886 Y131.528 E.02704
G1 X129.846 Y124.472 E.40355
G1 X129.373 Y124.472 E.02704
G1 X129.413 Y131.528 E.40355
G1 X128.94 Y131.528 E.02704
G1 X128.901 Y124.472 E.40355
G1 X128.428 Y124.472 E.02704
G1 X128.467 Y131.528 E.40355
G1 X127.995 Y131.528 E.02704
G1 X127.955 Y124.472 E.40355
G1 X127.482 Y124.472 E.02704
G1 X127.522 Y131.528 E.40355
G1 X127.049 Y131.528 E.02704
G1 X127.01 Y124.472 E.40355
G1 X126.537 Y124.472 E.02704
G1 X126.576 Y131.528 E.40355
G1 X126.104 Y131.528 E.02704
G1 X126.064 Y124.472 E.40355
G1 X125.591 Y124.472 E.02704
G1 X125.631 Y131.528 E.40355
G1 X125.158 Y131.528 E.02704
G1 X125.119 Y124.472 E.40355
G1 X124.646 Y124.472 E.02704
G1 X124.685 Y131.528 E.40355
G1 X124.213 Y131.528 E.02704
G1 X124.173 Y124.472 E.40355
G1 X123.7 Y124.472 E.02704
G1 X123.74 Y131.528 E.40355
G1 X123.267 Y131.528 E.02704
G1 X123.227 Y124.269 E.41513
M106 S252.45
G1 X121.45 Y125.498 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1777
G1 X121.45 Y127.126 E.05401
G1 X122.81 Y128.486 E.0638
G1 X122.806 Y127.518 E.03211
G1 X121.45 Y128.874 E.06359
G1 X121.45 Y130.502 E.05401
G1 X133.404 Y126.224 F30000
G1 F1777
G1 X133.404 Y124.857 E.04534
G1 X133.143 Y124.857 E.00867
G1 X132.59 Y125.41 E.02594
G3 X132.585 Y130.585 I-233.563 J2.391 E.17166
G1 X133.143 Y131.143 E.02615
M73 P48 R9
G1 X133.404 Y131.143 E.00867
G1 X133.404 Y129.776 E.04534
G1 X134.218 Y129.829 F30000
G1 F1777
G1 X134.218 Y131.458 E.05401
G1 X136.55 Y129.126 E.10937
G1 X136.55 Y126.874 E.07472
G1 X134.218 Y124.542 E.10937
G1 X134.218 Y126.171 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 4.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X134.218 Y124.542 E-.61876
G1 X134.481 Y124.805 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 22/85
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
G3 Z4.6 I-1.152 J.393 P1  F30000
G1 X136.898 Y131.898 Z4.6
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2456
G1 X121.102 Y131.898 E.52398
G1 X121.102 Y124.102 E.2586
G1 X136.898 Y124.102 E.52398
G1 X136.898 Y131.838 E.25661
G1 X137.29 Y132.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2456
G1 X120.71 Y132.29 E.50946
G1 X120.71 Y123.71 E.26364
G1 X137.29 Y123.71 E.50946
G1 X137.29 Y132.23 E.2618
M204 S10000
; WIPE_START
G1 F24000
G1 X135.29 Y132.237 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I.513 J-1.104 P1  F30000
G1 X133.811 Y131.55 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2456
G1 X132.173 Y131.55 E.05435
G2 X132.177 Y124.45 I-319.926 J-3.746 E.2355
G1 X133.811 Y124.45 E.0542
G1 X133.811 Y131.49 E.23351
G1 X131.106 Y131.734 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.427505
G1 F2456
G1 X131.783 Y131.057 E.03003
G1 X131.786 Y130.51 E.01714
G1 X130.732 Y131.565 E.04675
G1 X130.188 Y131.565 E.01704
G1 X131.789 Y129.963 E.07099
G1 X131.793 Y129.416 E.01714
G1 X129.644 Y131.565 E.09523
G1 X129.1 Y131.565 E.01704
G1 X131.796 Y128.869 E.11946
G1 X131.799 Y128.322 E.01714
G1 X128.556 Y131.565 E.1437
G1 X128.012 Y131.565 E.01704
G1 X131.802 Y127.775 E.16794
G1 X131.801 Y127.232 E.01701
G1 X127.468 Y131.565 E.192
G1 X126.924 Y131.565 E.01704
G1 X131.798 Y126.692 E.21597
G1 X131.795 Y126.151 E.01695
G1 X126.381 Y131.565 E.23994
G1 X125.837 Y131.565 E.01704
G1 X131.791 Y125.61 E.26391
G1 X131.788 Y125.069 E.01695
G1 X125.293 Y131.565 E.28789
G1 X124.749 Y131.565 E.01704
G1 X131.785 Y124.528 E.31186
G1 X131.785 Y124.435 E.00291
G1 X131.334 Y124.435 E.01412
G1 X124.205 Y131.565 E.31597
G1 X123.661 Y131.565 E.01704
G1 X130.79 Y124.435 E.31597
G1 X130.247 Y124.435 E.01704
G1 X123.219 Y131.463 E.31147
G1 X123.216 Y130.922 E.01695
G1 X129.703 Y124.435 E.2875
G1 X129.159 Y124.435 E.01704
G1 X123.213 Y130.381 E.26352
G1 X123.21 Y129.84 E.01695
G1 X128.615 Y124.435 E.23955
G1 X128.071 Y124.435 E.01704
G1 X123.207 Y129.3 E.21558
G1 X123.204 Y128.759 E.01695
G1 X127.527 Y124.435 E.19161
G1 X126.983 Y124.435 E.01704
G1 X123.201 Y128.218 E.16764
G1 X123.198 Y127.677 E.01695
G1 X126.439 Y124.435 E.14367
G1 X125.896 Y124.435 E.01704
G1 X123.2 Y127.131 E.11946
G1 X123.203 Y126.584 E.01714
G1 X125.352 Y124.435 E.09522
G1 X124.808 Y124.435 E.01704
G1 X123.206 Y126.037 E.07098
G1 X123.209 Y125.49 E.01714
G1 X124.264 Y124.435 E.04674
G1 X123.72 Y124.435 E.01704
G1 X123.042 Y125.114 E.03007
G1 X121.45 Y125.498 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2456
G1 X121.45 Y127.126 E.05401
G1 X122.81 Y128.486 E.0638
G3 X122.805 Y127.59 I79.371 J-.879 E.02974
G1 X122.806 Y127.518 E.00237
G1 X121.45 Y128.874 E.06359
G1 X121.45 Y130.502 E.05401
G1 X133.404 Y126.224 F30000
G1 F2456
G1 X133.404 Y124.857 E.04534
G1 X133.143 Y124.857 E.00867
G1 X132.59 Y125.41 E.02594
G3 X132.585 Y130.585 I-233.579 J2.391 E.17166
G1 X133.143 Y131.143 E.02615
G1 X133.404 Y131.143 E.00867
G1 X133.404 Y129.776 E.04534
G1 X134.218 Y129.829 F30000
G1 F2456
G1 X134.218 Y131.458 E.05401
G1 X136.55 Y129.126 E.10937
G1 X136.55 Y126.874 E.07472
G1 X134.218 Y124.542 E.10937
G1 X134.218 Y126.171 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 4.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X134.218 Y124.542 E-.61876
G1 X134.481 Y124.805 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 23/85
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
G3 Z4.8 I-1.152 J.393 P1  F30000
G1 X136.898 Y131.898 Z4.8
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2952
G1 X121.102 Y131.898 E.52398
G1 X121.102 Y124.102 E.2586
M73 P49 R9
G1 X125.465 Y124.102 E.14474
G1 X125.446 Y127.6 E.11605
G1 X125.468 Y131.578 E.13194
G1 X129.532 Y131.578 E.13482
G2 X129.535 Y124.102 I-335.902 J-3.854 E.24799
G1 X136.898 Y124.102 E.24425
G1 X136.898 Y131.838 E.25661
G1 X137.29 Y132.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2952
G1 X120.71 Y132.29 E.50946
G1 X120.71 Y123.71 E.26364
G1 X137.29 Y123.71 E.50946
G1 X137.29 Y132.23 E.2618
M204 S10000
; WIPE_START
G1 F24000
G1 X135.29 Y132.237 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I.393 J-1.152 P1  F30000
G1 X133.807 Y131.731 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.447616
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X133.767 Y124.472 E.46541
G1 X133.269 Y124.472 E.03191
G1 X133.308 Y131.528 E.45243
G1 X132.811 Y131.528 E.03191
G1 X132.771 Y124.472 E.45243
G1 X132.274 Y124.472 E.03191
G1 X132.313 Y131.528 E.45243
G1 X131.816 Y131.528 E.03191
G1 X131.775 Y124.269 E.46541
M106 S252.45
G1 X130.857 Y124.324 F30000
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.2
G1 F2952
G1 X131.443 Y124.91 E.02544
G1 X131.446 Y125.446
G1 X130.324 Y124.324 E.04874
G1 X129.791 Y124.324
G1 X131.449 Y125.982 E.07204
G1 X131.452 Y126.519
G1 X129.761 Y124.828 E.07346
G1 X129.764 Y125.364
G1 X131.455 Y127.055 E.07346
G1 X131.458 Y127.591
G1 X129.767 Y125.901 E.07346
G1 X129.77 Y126.437
G1 X131.455 Y128.122 E.0732
G1 X131.452 Y128.652
G1 X129.773 Y126.973 E.07295
G1 X129.776 Y127.509
G1 X131.449 Y129.182 E.07269
G1 X131.446 Y129.713
G1 X129.774 Y128.041 E.07264
G1 X129.771 Y128.571
G1 X131.443 Y130.243 E.07264
G1 X131.44 Y130.773
G1 X129.768 Y129.101 E.07264
G1 X129.765 Y129.632
G1 X131.437 Y131.304 E.07264
G1 X131.276 Y131.676
G1 X129.762 Y130.162 E.06576
G1 X129.759 Y130.692
G1 X130.742 Y131.676 E.04272
G1 X130.209 Y131.676
G1 X129.756 Y131.223 E.01967
M204 S10000
G1 X131.511 Y131.637 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
G1 F2952
G2 X131.516 Y124.423 I-325.693 J-3.819 E.19987
G1 X129.314 Y124.381 F30000
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F2952
G1 X128.85 Y123.917 E.02014
G1 X128.317 Y123.917
G1 X129.317 Y124.917 E.04344
G1 X129.32 Y125.453
G1 X127.784 Y123.917 E.06675
G1 X127.25 Y123.917
G1 X129.323 Y125.99 E.09005
G1 X129.326 Y126.526
G1 X126.717 Y123.917 E.11335
G1 X126.184 Y123.917
G1 X129.329 Y127.062 E.13666
G1 X129.332 Y127.598
G1 X125.689 Y123.955 E.15831
G1 X125.686 Y124.486
G1 X129.329 Y128.129 E.15832
G1 X129.326 Y128.659
G1 X125.683 Y125.016 E.15832
G1 X125.68 Y125.546
G1 X129.323 Y129.189 E.15832
G1 X129.32 Y129.72
G1 X125.677 Y126.077 E.15832
G1 X125.674 Y126.607
G1 X129.317 Y130.25 E.15832
G1 X129.314 Y130.78
G1 X125.671 Y127.137 E.15832
G1 X125.669 Y127.668
G1 X129.311 Y131.311 E.15829
G1 X128.823 Y131.355
G1 X125.672 Y128.204 E.13692
G1 X125.675 Y128.741
G1 X128.289 Y131.355 E.11362
G1 X127.756 Y131.355
G1 X125.678 Y129.277 E.09032
G1 X125.681 Y129.813
G1 X127.223 Y131.355 E.06702
G1 X126.689 Y131.355
G1 X125.683 Y130.349 E.04371
G1 X125.686 Y130.886
G1 X126.156 Y131.355 E.02041
M204 S10000
G1 X123.335 Y127.608 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2952
G1 X123.352 Y124.494 E.09567
G1 X121.494 Y124.494 E.0571
G1 X121.494 Y131.506 E.21545
G1 X123.357 Y131.506 E.05723
G1 X123.335 Y127.668 E.11794
G1 X122.958 Y127.609 F30000
G1 F2952
G1 X122.973 Y124.871 E.08412
G1 X121.871 Y124.871 E.03386
G1 X121.871 Y131.129 E.19228
G1 X122.978 Y131.129 E.03399
G1 X122.958 Y127.669 E.10632
G1 X122.592 Y127.614 F30000
; LINE_WIDTH: 0.401843
G1 F2952
G1 X122.592 Y127.604 E.0003
G3 X122.602 Y125.24 I851.224 J2.451 E.06912
G1 X122.24 Y125.24 E.01059
G2 X122.241 Y130.759 I1068.345 J2.549 E.1614
G1 X122.605 Y130.759 E.01065
G3 X122.592 Y127.674 I1113.07 J-6.268 E.09022
G1 X124.458 Y124.324 F30000
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F2952
G1 X125.237 Y125.104 E.03387
G1 X125.234 Y125.634
G1 X123.925 Y124.324 E.05691
G1 X123.56 Y124.493
G1 X125.231 Y126.164 E.07264
G1 X125.228 Y126.695
G1 X123.557 Y125.023 E.07264
G1 X123.554 Y125.553
G1 X125.226 Y127.225 E.07264
G1 X125.224 Y127.757
G1 X123.551 Y126.084 E.07272
G1 X123.548 Y126.614
G1 X125.227 Y128.293 E.07298
G1 X125.23 Y128.83
G1 X123.545 Y127.144 E.07323
G1 X123.543 Y127.676
G1 X125.233 Y129.366 E.07345
G1 X125.236 Y129.902
G1 X123.546 Y128.212 E.07345
G1 X123.549 Y128.748
G1 X125.239 Y130.438 E.07345
G1 X125.242 Y130.975
G1 X123.552 Y129.284 E.07345
G1 X123.555 Y129.821
G1 X125.245 Y131.511 E.07345
G1 X124.877 Y131.676
G1 X123.558 Y130.357 E.05731
G1 X123.561 Y130.893
G1 X124.343 Y131.676 E.034
M204 S10000
G1 X134.218 Y129.829 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2952
G1 X134.218 Y131.458 E.05401
G1 X136.55 Y129.126 E.10937
G1 X136.55 Y126.874 E.07472
G1 X134.218 Y124.542 E.10937
G1 X134.218 Y126.171 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 4.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X134.218 Y124.542 E-.61876
G1 X134.481 Y124.805 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 24/85
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
G3 Z5 I-.922 J-.794 P1  F30000
G1 X129.059 Y131.101 Z5
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2477
G1 X129.078 Y127.6 E.11612
G2 X129.059 Y124.102 I-314.556 J.005 E.11605
G1 X136.898 Y124.102 E.26003
G1 X136.898 Y131.898 E.2586
G1 X121.102 Y131.898 E.52398
G1 X121.102 Y124.102 E.2586
G1 X125.941 Y124.102 E.16052
G1 X125.922 Y127.6 E.11605
G1 X125.941 Y131.102 E.11616
G1 X129 Y131.102 E.10148
G1 X128.669 Y130.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2477
G2 X128.665 Y123.71 I-521.25 J-3.19 E.21509
G1 X137.29 Y123.71 E.26502
G1 X137.29 Y132.29 E.26364
G1 X120.71 Y132.29 E.50946
G1 X120.71 Y123.71 E.26364
G1 X126.335 Y123.71 E.17284
G1 X126.335 Y123.723 E.00041
G2 X126.331 Y130.71 I313.912 J3.689 E.21468
G1 X128.609 Y130.71 E.07
M204 S10000
; WIPE_START
G1 F24000
G1 X128.659 Y128.711 E-.76
; WIPE_END
G1 E-.04 F1800
G17
M73 P50 R9
G3 Z5.2 I-1.19 J.257 P1  F30000
G1 X129.26 Y131.5 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F2477
G1 X125.74 Y131.5 E.11153
G1 X125.529 Y127.599 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2477
G1 X125.547 Y124.494 E.09542
G1 X121.494 Y124.494 E.12453
G1 X121.494 Y131.506 E.21545
G1 X125.348 Y131.506 E.1184
G1 X125.376 Y130.981 E.01616
G1 X125.548 Y130.88 E.00611
G1 X125.53 Y127.659 E.09898
G1 X125.152 Y127.6 F30000
G1 F2477
G1 X125.168 Y124.871 E.08386
G1 X121.871 Y124.871 E.10129
G1 X121.871 Y131.129 E.19228
G1 X124.971 Y131.129 E.09523
G1 X125.056 Y130.781 E.01099
G1 X125.17 Y130.718 E.00399
G1 X125.153 Y127.66 E.09396
G1 X124.775 Y127.6 F30000
G1 F2477
G1 X124.788 Y125.248 E.07228
G1 X122.248 Y125.248 E.07805
G1 X122.248 Y130.752 E.1691
G1 X124.688 Y130.752 E.07495
G1 X124.736 Y130.582 E.00543
G1 X124.792 Y130.551 E.00195
G1 X124.776 Y127.66 E.08882
M73 P50 R8
G1 X124.398 Y127.6 F30000
G1 F2477
G1 X124.409 Y125.625 E.06069
G1 X122.625 Y125.625 E.05481
G1 X122.625 Y130.375 E.14593
G1 X124.414 Y130.375 E.05495
G1 X124.399 Y127.66 E.0834
G1 X124.021 Y127.6 F30000
G1 F2477
G1 X124.03 Y126.002 E.0491
G1 X123.002 Y126.002 E.03157
G1 X123.002 Y129.998 E.12276
G1 X124.034 Y129.998 E.03171
G1 X124.021 Y127.66 E.07181
G1 X123.672 Y127.612 F30000
; LINE_WIDTH: 0.366237
G1 F2477
G3 X123.678 Y126.353 I1276.245 J4.842 E.03317
G1 X123.353 Y126.353 E.00856
G2 X123.354 Y129.646 I667.211 J1.424 E.08676
G1 X123.681 Y129.646 E.00861
G3 X123.672 Y127.672 I710.963 J-4.029 E.05201
; WIPE_START
G1 F24000
G1 X123.681 Y129.646 E-.75019
G1 X123.655 Y129.646 E-.00981
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I.309 J1.177 P1  F30000
G1 X131.408 Y127.612 Z5.2
G1 Z4.8
G1 E.8 F1800
; LINE_WIDTH: 0.526336
G1 F2477
G3 X131.399 Y129.566 I-705.411 J-2.082 E.07697
G1 X131.886 Y129.566 E.01919
G2 X131.888 Y126.675 I-1281.291 J-1.933 E.11391
G1 X131.888 Y126.433 E.00952
G1 X131.403 Y126.433 E.0191
G1 X131.408 Y127.552 E.0441
G1 X130.979 Y127.6 F30000
; LINE_WIDTH: 0.419999
G1 F2477
G1 X130.966 Y129.998 E.07366
G1 X132.318 Y129.998 E.04155
G1 X132.318 Y126.002 E.12276
G1 X130.97 Y126.002 E.04142
G1 X130.979 Y127.54 E.04726
G1 X130.602 Y127.6 F30000
G1 F2477
G1 X130.586 Y130.375 E.08524
G1 X132.695 Y130.375 E.06479
G1 X132.695 Y125.625 E.14593
G1 X130.591 Y125.625 E.06466
G1 X130.601 Y127.54 E.05885
G1 X130.225 Y127.6 F30000
G1 F2477
G1 X130.208 Y130.551 E.09066
G1 X130.264 Y130.582 E.00195
G1 X130.312 Y130.752 E.00543
G1 X133.072 Y130.752 E.08479
G1 X133.072 Y125.248 E.1691
G1 X130.212 Y125.248 E.08789
G1 X130.224 Y127.54 E.07043
G1 X129.848 Y127.6 F30000
G1 F2477
G1 X129.83 Y130.718 E.09581
G1 X129.944 Y130.781 E.00399
G1 X130.029 Y131.129 E.01099
G1 X133.449 Y131.129 E.10507
G1 X133.449 Y124.871 E.19228
G1 X129.832 Y124.871 E.11113
G1 X129.847 Y127.54 E.08202
G1 X129.471 Y127.602 F30000
G1 F2477
G1 X129.452 Y130.892 E.10111
G1 X129.624 Y130.981 E.00594
G1 X129.652 Y131.506 E.01616
G1 X133.826 Y131.506 E.12825
G1 X133.826 Y124.494 E.21545
G1 X129.453 Y124.494 E.13437
G1 X129.47 Y127.542 E.09364
G1 X134.218 Y126.171 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2477
G1 X134.218 Y124.542 E.05401
G1 X136.55 Y126.874 E.10937
G1 X136.55 Y129.126 E.07472
G1 X134.218 Y131.458 E.10937
G1 X134.218 Y129.829 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 5
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X134.218 Y131.458 E-.61876
G1 X134.481 Y131.195 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 25/85
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
G3 Z5.2 I-.102 J-1.213 P1  F30000
G1 X129.913 Y131.578 Z5.2
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2608
G1 X131.578 Y131.578 E.05524
G1 X131.578 Y124.422 E.23736
G1 X129.428 Y124.422 E.07133
G1 X129.432 Y124.102 E.01062
G1 X136.898 Y124.102 E.24765
G1 X136.898 Y131.898 E.2586
G1 X121.102 Y131.898 E.52398
G1 X121.102 Y124.102 E.2586
G1 X125.568 Y124.102 E.14813
G1 X125.572 Y124.422 E.01062
G1 X123.422 Y124.422 E.07133
G1 X123.422 Y131.578 E.23736
G1 X129.853 Y131.578 E.21331
; WIPE_START
G1 F24000
G1 X131.578 Y131.578 E-.65559
G1 X131.578 Y131.303 E-.10441
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I.277 J-1.185 P1  F30000
G1 X129.042 Y130.71 Z5.4
G1 Z5
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2608
G3 X129.046 Y123.71 I579.066 J-3.147 E.21509
G1 X137.29 Y123.71 E.25331
G1 X137.29 Y132.29 E.26364
G1 X120.71 Y132.29 E.50946
G1 X120.71 Y123.71 E.26364
G1 X125.954 Y123.71 E.16113
G1 X125.972 Y124.908 E.03683
G2 X125.958 Y130.71 I520.152 J4.11 E.17827
G1 X128.982 Y130.71 E.0929
M204 S10000
; WIPE_START
G1 F24000
G1 X128.998 Y128.71 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I-.399 J1.15 P1  F30000
G1 X133.704 Y130.344 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2608
G1 X133.704 Y131.55 E.03999
G1 X134.126 Y131.55 E.01402
G1 X136.55 Y129.126 E.11369
G1 X136.55 Y126.874 E.07472
G1 X134.126 Y124.45 E.11369
G1 X133.704 Y124.45 E.01402
G1 X133.704 Y125.656 E.03999
G1 X133.481 Y124.815 F30000
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F2608
G1 X132.99 Y124.324 E.02133
G1 X132.457 Y124.324
G1 X133.481 Y125.349 E.0445
G1 X133.481 Y125.882
G1 X131.924 Y124.324 E.06768
G1 X131.8 Y124.734
G1 X133.481 Y126.415 E.07305
G1 X133.481 Y126.948
G1 X131.8 Y125.267 E.07305
G1 X131.8 Y125.801
G1 X133.481 Y127.482 E.07305
M73 P51 R8
G1 X133.481 Y128.015
G1 X131.8 Y126.334 E.07305
G1 X131.8 Y126.867
G1 X133.481 Y128.548 E.07305
G1 X133.481 Y129.081
G1 X131.8 Y127.401 E.07305
G1 X131.8 Y127.934
G1 X133.481 Y129.615 E.07305
G1 X133.481 Y130.148
G1 X131.8 Y128.467 E.07305
G1 X131.8 Y129
G1 X133.481 Y130.681 E.07305
G1 X133.481 Y131.215
G1 X131.8 Y129.534 E.07305
G1 X131.8 Y130.067
G1 X133.409 Y131.676 E.0699
G1 X132.876 Y131.676
G1 X131.8 Y130.6 E.04673
G1 X131.8 Y131.133
G1 X132.342 Y131.676 E.02356
M204 S10000
G1 X131.355 Y125.356 F30000
M204 S2000
G1 F2608
G1 X130.644 Y124.645 E.03091
G1 X130.111 Y124.645
G1 X131.355 Y125.889 E.05408
G1 X131.355 Y126.422
G1 X129.578 Y124.645 E.07726
G1 X129.237 Y124.837
G1 X131.355 Y126.956 E.09207
G1 X131.355 Y127.489
G1 X129.238 Y125.372 E.092
G1 X129.241 Y125.908
G1 X131.355 Y128.022 E.09187
G1 X131.355 Y128.556
G1 X129.244 Y126.444 E.09174
G1 X129.247 Y126.981
G1 X131.355 Y129.089 E.09161
G1 X131.355 Y129.622
G1 X129.249 Y127.516 E.09153
G1 X129.249 Y128.049
G1 X131.355 Y130.155 E.09153
G1 X131.355 Y130.689
G1 X129.249 Y128.582 E.09153
G1 X129.249 Y129.116
G1 X131.355 Y131.222 E.09153
G1 X130.956 Y131.355
G1 X129.249 Y129.649 E.07415
G1 X129.249 Y130.182
G1 X130.422 Y131.355 E.05098
G1 X129.889 Y131.355
G1 X129.249 Y130.715 E.02781
G1 X128.918 Y130.917
G1 X129.356 Y131.355 E.01903
G1 X128.823 Y131.355
G1 X128.385 Y130.917 E.01903
G1 X127.851 Y130.917
G1 X128.289 Y131.355 E.01903
M204 S10000
; WIPE_START
G1 F24000
G1 X127.851 Y130.917 E-.23538
G1 X128.385 Y130.917 E-.20264
G1 X128.823 Y131.355 E-.23538
G1 X129.05 Y131.355 E-.0866
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I1.063 J-.592 P1  F30000
G1 X125.311 Y124.645 Z5.4
G1 Z5
G1 E.8 F1800
M204 S2000
G1 F2608
G1 X125.763 Y125.097 E.01964
G1 X125.76 Y125.627
G1 X124.778 Y124.645 E.04268
G1 X124.245 Y124.645
G1 X125.757 Y126.157 E.06573
G1 X125.754 Y126.687
G1 X123.712 Y124.645 E.08877
G1 X123.645 Y125.111
G1 X125.751 Y127.218 E.09155
G1 X125.751 Y127.75
G1 X123.645 Y125.644 E.09153
G1 X123.645 Y126.177
G1 X125.751 Y128.284 E.09153
G1 X125.751 Y128.817
G1 X123.645 Y126.711 E.09153
G1 X123.645 Y127.244
G1 X125.751 Y129.35 E.09153
G1 X125.751 Y129.884
G1 X123.645 Y127.777 E.09153
G1 X123.645 Y128.311
G1 X125.751 Y130.417 E.09153
G1 X126.785 Y130.917
G1 X127.223 Y131.355 E.01903
G1 X126.689 Y131.355
G1 X126.251 Y130.917 E.01903
G1 X126.156 Y131.355
G1 X123.645 Y128.844 E.10914
G1 X123.645 Y129.377
G1 X125.623 Y131.355 E.08597
G1 X125.09 Y131.355
G1 X123.645 Y129.91 E.06279
G1 X123.645 Y130.444
G1 X124.556 Y131.355 E.03962
G1 X124.023 Y131.355
G1 X123.645 Y130.977 E.01645
M204 S10000
G1 X123.2 Y124.666 F30000
M204 S2000
G1 F2608
G1 X122.858 Y124.324 E.01485
G1 X122.325 Y124.324
G1 X123.2 Y125.199 E.03802
G1 X123.2 Y125.733
G1 X121.792 Y124.324 E.06119
G1 X121.519 Y124.585
G1 X123.2 Y126.266 E.07305
G1 X123.2 Y126.799
G1 X121.519 Y125.118 E.07305
G1 X121.519 Y125.652
G1 X123.2 Y127.332 E.07305
G1 X123.2 Y127.866
G1 X121.519 Y126.185 E.07305
G1 X121.519 Y126.718
G1 X123.2 Y128.399 E.07305
G1 X123.2 Y128.932
G1 X121.519 Y127.251 E.07305
G1 X121.519 Y127.785
G1 X123.2 Y129.466 E.07305
G1 X123.2 Y129.999
G1 X121.519 Y128.318 E.07305
G1 X121.519 Y128.851
G1 X123.2 Y130.532 E.07305
G1 X123.2 Y131.065
G1 X121.519 Y129.384 E.07305
G1 X121.519 Y129.918
G1 X123.2 Y131.599 E.07305
G1 X122.743 Y131.676
G1 X121.519 Y130.451 E.05321
G1 X121.519 Y130.984
G1 X122.21 Y131.676 E.03004
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 5.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X121.519 Y130.984 E-.3715
G1 X121.519 Y130.451 E-.20264
G1 X121.865 Y130.797 E-.18586
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 26/85
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
G3 Z5.4 I-.04 J1.216 P1  F30000
G1 X131.102 Y131.102 Z5.4
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1368
G1 X131.102 Y124.898 E.2058
G1 X129.71 Y124.898 E.04616
G1 X129.705 Y124.102 E.0264
G1 X136.898 Y124.102 E.23862
G1 X136.898 Y131.898 E.2586
G1 X121.102 Y131.898 E.52398
G1 X121.102 Y124.102 E.2586
G1 X125.295 Y124.102 E.1391
G1 X125.29 Y124.898 E.0264
G1 X123.898 Y124.898 E.04616
G1 X123.898 Y131.102 E.2058
G1 X131.042 Y131.102 E.23698
G1 X130.71 Y130.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1368
G1 X130.71 Y125.29 E.16654
G1 X129.316 Y125.29 E.04282
G2 X129.309 Y123.71 I-61.243 J-.519 E.04855
G1 X137.29 Y123.71 E.24522
G1 X137.29 Y132.29 E.26364
G1 X120.71 Y132.29 E.50946
G1 X120.71 Y123.71 E.26364
G1 X125.691 Y123.71 E.15304
G1 X125.681 Y124.915 E.03704
G1 X125.684 Y125.29 E.01151
G1 X124.29 Y125.29 E.04283
G1 X124.29 Y130.71 E.16654
G1 X130.65 Y130.71 E.19543
M204 S10000
G1 X131.593 Y130.936 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1368
G1 X131.45 Y130.936 E.00474
G1 X131.45 Y129.45 E.04928
G1 X133.55 Y131.55 E.09848
G1 X134.126 Y131.55 E.01913
G1 X136.55 Y129.126 E.11369
G1 X136.55 Y126.874 E.07472
G1 X134.126 Y124.45 E.11369
G1 X133.55 Y124.45 E.01913
G1 X131.45 Y126.55 E.09848
G1 X131.45 Y125.064 E.04928
G1 X131.593 Y125.064 E.00474
G1 X131.306 Y124.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1368
G1 X129.911 Y124.5 E.04418
; WIPE_START
G1 F24000
G1 X131.306 Y124.5 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I0 J-1.217 P1  F30000
G1 X125.089 Y124.5 Z5.6
G1 Z5.2
G1 E.8 F1800
G1 F1368
G1 X123.694 Y124.5 E.04418
G1 X123.55 Y125.146 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1368
G1 X123.55 Y126.774 E.05401
G1 X121.45 Y128.874 E.09848
G1 X121.45 Y127.126 E.05796
G1 X123.55 Y129.226 E.09848
M73 P52 R8
G1 X123.55 Y130.854 E.05401
G1 X123.694 Y131.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1368
G1 X131.306 Y131.5 E.24112
; CHANGE_LAYER
; Z_HEIGHT: 5.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.306 Y131.5 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 27/85
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
G3 Z5.6 I.263 J1.188 P1  F30000
G1 X131.102 Y131.102 Z5.6
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1349
G1 X131.102 Y124.898 E.2058
G1 X129.921 Y124.898 E.03917
G1 X129.926 Y124.102 E.0264
G1 X136.898 Y124.102 E.23128
G1 X136.898 Y131.898 E.2586
G1 X121.102 Y131.898 E.52398
G1 X121.102 Y124.102 E.2586
G1 X125.075 Y124.102 E.13178
G1 X125.08 Y124.898 E.0264
G1 X123.898 Y124.898 E.03922
G1 X123.898 Y131.102 E.2058
G1 X131.042 Y131.102 E.23698
G1 X130.71 Y130.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1349
G1 X130.71 Y125.29 E.16654
G1 X129.527 Y125.29 E.03635
G2 X129.535 Y123.71 I-61.215 J-1.103 E.04855
G1 X137.29 Y123.71 E.23828
G1 X137.29 Y132.29 E.26364
G1 X120.71 Y132.29 E.50946
G1 X120.71 Y123.71 E.26364
G1 X125.465 Y123.71 E.1461
G1 X125.464 Y123.747 E.00112
G1 X125.475 Y125.29 E.04743
G1 X124.29 Y125.29 E.03641
G1 X124.29 Y130.71 E.16654
G1 X130.65 Y130.71 E.19543
M204 S10000
G1 X131.593 Y130.936 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1349
G1 X131.45 Y130.936 E.00474
G1 X131.45 Y129.45 E.04928
G1 X133.55 Y131.55 E.09848
G1 X134.126 Y131.55 E.01913
G1 X136.55 Y129.126 E.11369
G1 X136.55 Y126.874 E.07472
G1 X134.126 Y124.45 E.11369
G1 X133.55 Y124.45 E.01913
G1 X131.45 Y126.55 E.09848
G1 X131.45 Y125.064 E.04928
G1 X131.593 Y125.064 E.00474
G1 X131.306 Y124.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1349
G1 X130.127 Y124.5 E.03734
; WIPE_START
G1 F24000
G1 X131.306 Y124.5 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I0 J-1.217 P1  F30000
G1 X124.874 Y124.5 Z5.8
G1 Z5.4
G1 E.8 F1800
G1 F1349
G1 X123.694 Y124.5 E.03737
G1 X123.55 Y125.146 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1349
G1 X123.55 Y126.774 E.05401
G1 X121.45 Y128.874 E.09848
G1 X121.45 Y127.126 E.05796
G1 X123.55 Y129.226 E.09848
G1 X123.55 Y130.854 E.05401
G1 X123.694 Y131.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1349
G1 X131.306 Y131.5 E.24112
; CHANGE_LAYER
; Z_HEIGHT: 5.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.306 Y131.5 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 28/85
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
G3 Z5.8 I.263 J1.188 P1  F30000
G1 X131.102 Y131.102 Z5.8
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1336
G1 X131.102 Y124.898 E.2058
G1 X130.089 Y124.898 E.03361
M73 P53 R8
G1 X130.085 Y124.102 E.0264
G1 X136.898 Y124.102 E.22599
G1 X136.898 Y131.898 E.2586
G1 X121.102 Y131.898 E.52398
G1 X121.102 Y124.102 E.2586
G1 X124.914 Y124.102 E.12646
G1 X124.91 Y124.898 E.0264
G1 X123.898 Y124.898 E.03356
G1 X123.898 Y131.102 E.2058
G1 X131.042 Y131.102 E.23698
G1 X130.71 Y130.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1336
G1 X130.71 Y125.29 E.16654
G1 X129.697 Y125.29 E.03114
G2 X129.691 Y123.71 I-100.537 J-.439 E.04855
G1 X137.29 Y123.71 E.23349
G1 X137.29 Y132.29 E.26364
G1 X120.71 Y132.29 E.50946
G1 X120.71 Y123.71 E.26364
G1 X125.309 Y123.71 E.1413
G1 X125.301 Y125.089 E.04238
G1 X125.302 Y125.29 E.00617
G1 X124.29 Y125.29 E.03109
G1 X124.29 Y130.71 E.16654
G1 X130.65 Y130.71 E.19543
M204 S10000
G1 X131.593 Y130.936 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1336
G1 X131.45 Y130.936 E.00474
G1 X131.45 Y129.45 E.04928
G1 X133.55 Y131.55 E.09848
G1 X134.126 Y131.55 E.01913
G1 X136.55 Y129.126 E.11369
G1 X136.55 Y126.874 E.07472
G1 X134.126 Y124.45 E.11369
G1 X133.55 Y124.45 E.01913
G1 X131.45 Y126.55 E.09848
G1 X131.45 Y125.064 E.04928
G1 X131.593 Y125.064 E.00474
G1 X131.306 Y124.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1336
G1 X130.291 Y124.5 E.03216
; WIPE_START
G1 F24000
G1 X131.306 Y124.5 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I0 J-1.217 P1  F30000
G1 X124.708 Y124.5 Z6
G1 Z5.6
G1 E.8 F1800
G1 F1336
G1 X123.694 Y124.5 E.03212
G1 X123.55 Y125.146 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1336
G1 X123.55 Y126.774 E.05401
G1 X121.45 Y128.874 E.09848
G1 X121.45 Y127.126 E.05796
G1 X123.55 Y129.226 E.09848
G1 X123.55 Y130.854 E.05401
G1 X123.694 Y131.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1336
G1 X131.306 Y131.5 E.24112
; CHANGE_LAYER
; Z_HEIGHT: 5.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.306 Y131.5 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 29/85
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
G3 Z6 I.263 J1.188 P1  F30000
G1 X131.102 Y131.102 Z6
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1326
G1 X131.102 Y124.898 E.2058
G1 X130.221 Y124.898 E.02923
G1 X130.223 Y124.102 E.0264
G1 X136.898 Y124.102 E.22141
G1 X136.898 Y131.898 E.2586
G1 X121.102 Y131.898 E.52398
G1 X121.102 Y124.102 E.2586
G1 X124.776 Y124.102 E.12186
G1 X124.78 Y124.898 E.0264
G1 X123.898 Y124.898 E.02926
G1 X123.898 Y131.102 E.2058
G1 X131.042 Y131.102 E.23698
G1 X130.71 Y130.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1326
G1 X130.71 Y125.29 E.16654
G1 X129.828 Y125.29 E.02711
G2 X129.829 Y123.71 I-100.537 J-.894 E.04855
G1 X137.29 Y123.71 E.22925
G1 X137.29 Y132.29 E.26364
G1 X120.71 Y132.29 E.50946
M73 P54 R8
G1 X120.71 Y123.71 E.26364
G1 X125.171 Y123.71 E.13706
G1 X125.168 Y124.149 E.0135
G1 X125.174 Y125.29 E.03505
G1 X124.29 Y125.29 E.02716
G1 X124.29 Y130.71 E.16654
G1 X130.65 Y130.71 E.19543
M204 S10000
G1 X131.593 Y130.936 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1326
G1 X131.45 Y130.936 E.00474
G1 X131.45 Y129.45 E.04928
G1 X133.55 Y131.55 E.09848
G1 X134.126 Y131.55 E.01913
G1 X136.55 Y129.126 E.11369
G1 X136.55 Y126.874 E.07472
G1 X134.126 Y124.45 E.11369
G1 X133.55 Y124.45 E.01913
G1 X131.45 Y126.55 E.09848
G1 X131.45 Y125.064 E.04928
G1 X131.593 Y125.064 E.00474
G1 X131.306 Y124.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1326
G1 X130.426 Y124.5 E.02788
; WIPE_START
G1 F24000
G1 X131.306 Y124.5 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I0 J-1.217 P1  F30000
G1 X124.574 Y124.5 Z6.2
G1 Z5.8
G1 E.8 F1800
G1 F1326
G1 X123.694 Y124.5 E.02787
G1 X123.55 Y125.146 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1326
G1 X123.55 Y126.774 E.05401
G1 X121.45 Y128.874 E.09848
G1 X121.45 Y127.126 E.05796
G1 X123.55 Y129.226 E.09848
G1 X123.55 Y130.854 E.05401
G1 X123.694 Y131.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1326
G1 X131.306 Y131.5 E.24112
; CHANGE_LAYER
; Z_HEIGHT: 6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.306 Y131.5 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 30/85
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
G3 Z6.2 I.263 J1.188 P1  F30000
G1 X131.102 Y131.102 Z6.2
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1302
G1 X131.102 Y124.898 E.2058
G1 X130.343 Y124.898 E.02518
G1 X130.341 Y124.102 E.0264
G1 X136.898 Y124.102 E.21751
G1 X136.898 Y131.898 E.2586
G1 X121.102 Y131.898 E.52398
G1 X121.102 Y124.102 E.2586
G1 X124.658 Y124.102 E.11795
G1 X124.654 Y124.898 E.0264
G1 X123.898 Y124.898 E.02508
G1 X123.898 Y131.102 E.2058
G1 X131.042 Y131.102 E.23698
G1 X130.71 Y130.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1302
G1 X130.71 Y125.29 E.16654
G1 X129.952 Y125.29 E.02329
G1 X129.948 Y123.71 E.04855
G1 X137.29 Y123.71 E.22561
G1 X137.29 Y132.29 E.26364
G1 X120.71 Y132.29 E.50946
G1 X120.71 Y123.71 E.26364
G1 X125.052 Y123.71 E.13341
G1 X125.045 Y125.094 E.04253
G1 X125.046 Y125.29 E.00602
G1 X124.29 Y125.29 E.02324
G1 X124.29 Y130.71 E.16654
G1 X130.65 Y130.71 E.19543
M204 S10000
G1 X131.593 Y130.936 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1302
G1 X131.45 Y130.936 E.00474
G1 X131.45 Y129.45 E.04928
G1 X133.55 Y131.55 E.09848
G1 X134.126 Y131.55 E.01913
G1 X136.55 Y129.126 E.11368
G1 X136.55 Y126.874 E.07472
G1 X134.126 Y124.45 E.11368
G1 X133.55 Y124.45 E.01913
G1 X131.45 Y126.55 E.09848
G1 X131.45 Y125.076 E.0489
G1 X131.565 Y124.979 E.00496
G1 X130.74 Y124.5 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.431684
G1 F1302
G1 X131.306 Y124.5 E.01795
G1 X131.306 Y131.5 F30000
; FEATURE: Gap infill
G1 F1302
G1 X123.694 Y131.5 E.24112
G1 X123.55 Y130.854 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1302
G1 X123.55 Y129.226 E.05401
G1 X121.45 Y127.126 E.09848
G1 X121.45 Y128.874 E.05796
G1 X123.55 Y126.774 E.09848
G1 X123.55 Y125.146 E.05401
G1 X123.634 Y124.505 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.441122
G1 F1302
G1 X124.198 Y124.5 E.01831
; CHANGE_LAYER
; Z_HEIGHT: 6.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
M73 P55 R8
G1 X123.634 Y124.505 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 31/85
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
G3 Z6.4 I-.806 J.912 P1  F30000
G1 X131.102 Y131.102 Z6.4
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1298
G1 X131.102 Y124.898 E.2058
G1 X130.417 Y124.898 E.02274
G1 X130.416 Y124.102 E.0264
G1 X136.898 Y124.102 E.21503
G1 X136.898 Y131.898 E.2586
G1 X121.102 Y131.898 E.52398
G1 X121.102 Y124.102 E.2586
G1 X124.582 Y124.102 E.11544
G1 X124.579 Y124.741 E.02121
G1 X124.58 Y124.898 E.00519
G1 X123.898 Y124.898 E.02262
G1 X123.898 Y131.102 E.2058
G1 X131.042 Y131.102 E.23698
G1 X130.71 Y130.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1298
G1 X130.71 Y125.29 E.16654
G1 X130.025 Y125.29 E.02105
G1 X130.023 Y123.71 E.04855
G1 X137.29 Y123.71 E.22329
G1 X137.29 Y132.29 E.26364
G1 X120.71 Y132.29 E.50946
G1 X120.71 Y123.71 E.26364
G1 X124.976 Y123.71 E.13108
G1 X124.971 Y124.742 E.0317
G1 X124.974 Y125.29 E.01685
G1 X124.29 Y125.29 E.021
G1 X124.29 Y130.71 E.16654
G1 X130.65 Y130.71 E.19543
M204 S10000
G1 X131.593 Y130.936 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1298
G1 X131.45 Y130.936 E.00474
G1 X131.45 Y129.45 E.04928
G1 X133.55 Y131.55 E.09848
G1 X134.126 Y131.55 E.01913
G1 X136.55 Y129.126 E.11368
G1 X136.55 Y126.874 E.07472
G1 X134.126 Y124.45 E.11368
G1 X133.55 Y124.45 E.01913
G1 X131.45 Y126.55 E.09848
G1 X131.45 Y125.076 E.0489
G1 X131.565 Y124.979 E.00496
G1 X130.814 Y124.5 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.431684
G1 F1298
G1 X131.306 Y124.504 E.01559
G1 X131.306 Y131.5 F30000
; FEATURE: Gap infill
G1 F1298
G1 X123.694 Y131.5 E.24112
G1 X123.55 Y130.854 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1298
G1 X123.55 Y129.226 E.05401
G1 X121.45 Y127.126 E.09848
G1 X121.45 Y128.874 E.05796
G1 X123.55 Y126.774 E.09848
G1 X123.55 Y125.146 E.05401
G1 X123.634 Y124.505 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.441122
G1 F1298
M73 P55 R7
G1 X124.122 Y124.501 E.01585
; CHANGE_LAYER
; Z_HEIGHT: 6.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X123.634 Y124.505 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 32/85
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
G3 Z6.6 I-.806 J.912 P1  F30000
G1 X131.102 Y131.102 Z6.6
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1286
G1 X131.102 Y124.898 E.2058
G1 X130.49 Y124.898 E.0203
G1 X130.491 Y124.102 E.0264
G1 X136.898 Y124.102 E.21255
G1 X136.898 Y131.898 E.2586
G1 X121.102 Y131.898 E.52398
M73 P56 R7
G1 X121.102 Y124.102 E.2586
G1 X124.508 Y124.102 E.11298
G1 X124.511 Y124.898 E.0264
G1 X123.898 Y124.898 E.02035
G1 X123.898 Y131.102 E.2058
G1 X131.042 Y131.102 E.23698
G1 X130.71 Y130.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1286
G1 X130.71 Y125.29 E.16654
G1 X130.098 Y125.29 E.01881
G1 X130.099 Y123.71 E.04855
G1 X137.29 Y123.71 E.22097
G1 X137.29 Y132.29 E.26364
G1 X120.71 Y132.29 E.50946
G1 X120.71 Y123.71 E.26364
G1 X124.9 Y123.71 E.12875
G1 X124.899 Y123.918 E.00641
G1 X124.905 Y125.29 E.04214
G1 X124.29 Y125.29 E.01891
G1 X124.29 Y130.71 E.16654
G1 X130.65 Y130.71 E.19543
M204 S10000
G1 X131.593 Y130.936 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1286
G1 X131.45 Y130.936 E.00474
G1 X131.45 Y129.45 E.04928
G1 X133.55 Y131.55 E.09848
G1 X134.126 Y131.55 E.01913
G1 X136.55 Y129.126 E.11369
G1 X136.55 Y126.874 E.07472
G1 X134.126 Y124.45 E.11369
G1 X133.55 Y124.45 E.01913
G1 X131.45 Y126.55 E.09848
G1 X131.45 Y124.921 E.05401
G1 X131.306 Y131.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1286
G1 X123.694 Y131.5 E.24112
G1 X123.55 Y130.854 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1286
G1 X123.55 Y129.226 E.05401
G1 X121.45 Y127.126 E.09848
G1 X121.45 Y128.874 E.05796
G1 X123.55 Y126.774 E.09848
G1 X123.55 Y125.146 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 6.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X123.55 Y126.774 E-.61876
G1 X123.287 Y127.037 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 33/85
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
G3 Z6.8 I-.562 J1.08 P1  F30000
G1 X131.102 Y131.102 Z6.8
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1283
G1 X131.102 Y124.898 E.2058
G1 X130.543 Y124.898 E.01854
G1 X130.542 Y124.102 E.0264
G1 X136.898 Y124.102 E.21083
G1 X136.898 Y131.898 E.2586
G1 X121.102 Y131.898 E.52398
G1 X121.102 Y124.102 E.2586
G1 X124.456 Y124.102 E.11126
G1 X124.453 Y124.898 E.0264
G1 X123.898 Y124.898 E.0184
G1 X123.898 Y131.102 E.2058
G1 X131.042 Y131.102 E.23698
G1 X130.71 Y130.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1283
G1 X130.71 Y125.29 E.16654
G1 X130.152 Y125.29 E.01716
G1 X130.15 Y123.71 E.04855
G1 X137.29 Y123.71 E.21941
G1 X137.29 Y132.29 E.26364
G1 X120.71 Y132.29 E.50946
G1 X120.71 Y123.71 E.26364
G1 X124.85 Y123.71 E.1272
G1 X124.843 Y125.29 E.04855
G1 X124.29 Y125.29 E.01699
G1 X124.29 Y130.71 E.16654
M73 P57 R7
G1 X130.65 Y130.71 E.19543
M204 S10000
G1 X131.593 Y130.936 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1283
G1 X131.45 Y130.936 E.00474
G1 X131.45 Y129.45 E.04928
G1 X133.55 Y131.55 E.09848
G1 X134.126 Y131.55 E.01913
G1 X136.55 Y129.126 E.11369
G1 X136.55 Y126.874 E.07472
G1 X134.126 Y124.45 E.11369
G1 X133.55 Y124.45 E.01913
G1 X131.45 Y126.55 E.09848
G1 X131.45 Y124.921 E.05401
G1 X131.306 Y131.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1283
G1 X123.694 Y131.5 E.24112
G1 X123.55 Y130.854 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1283
G1 X123.55 Y129.226 E.05401
G1 X121.45 Y127.126 E.09848
G1 X121.45 Y128.874 E.05796
G1 X123.55 Y126.774 E.09848
G1 X123.55 Y125.146 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 6.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X123.55 Y126.774 E-.61876
G1 X123.287 Y127.037 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 34/85
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
G3 Z7 I-.562 J1.08 P1  F30000
G1 X131.102 Y131.102 Z7
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1281
G1 X131.102 Y124.898 E.2058
G1 X130.567 Y124.898 E.01776
G1 X130.566 Y124.102 E.0264
G1 X136.898 Y124.102 E.21004
G1 X136.898 Y131.898 E.2586
G1 X121.102 Y131.898 E.52398
G1 X121.102 Y124.102 E.2586
G1 X124.432 Y124.102 E.11045
G1 X124.429 Y124.655 E.01835
G1 X124.43 Y124.898 E.00805
G1 X123.898 Y124.898 E.01766
G1 X123.898 Y131.102 E.2058
G1 X131.042 Y131.102 E.23698
G1 X130.71 Y130.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1281
G1 X130.71 Y125.29 E.16654
G1 X130.175 Y125.29 E.01644
G1 X130.174 Y123.71 E.04855
G1 X137.29 Y123.71 E.21866
G1 X137.29 Y132.29 E.26364
G1 X120.71 Y132.29 E.50946
G1 X120.71 Y123.71 E.26364
G1 X124.826 Y123.71 E.12646
G1 X124.822 Y124.655 E.02905
G1 X124.824 Y125.29 E.0195
G1 X124.29 Y125.29 E.01641
G1 X124.29 Y130.71 E.16654
G1 X130.65 Y130.71 E.19543
M204 S10000
G1 X131.593 Y130.936 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1281
G1 X131.45 Y130.936 E.00474
G1 X131.45 Y129.45 E.04928
G1 X133.55 Y131.55 E.09848
G1 X134.126 Y131.55 E.01913
G1 X136.55 Y129.126 E.11369
G1 X136.55 Y126.874 E.07472
G1 X134.126 Y124.45 E.11369
G1 X133.55 Y124.45 E.01913
G1 X131.45 Y126.55 E.09848
G1 X131.45 Y124.921 E.05401
G1 X131.306 Y131.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1281
G1 X123.694 Y131.5 E.24112
G1 X123.55 Y130.854 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1281
G1 X123.55 Y129.226 E.05401
G1 X121.45 Y127.126 E.09848
G1 X121.45 Y128.874 E.05796
G1 X123.55 Y126.774 E.09848
G1 X123.55 Y125.146 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 7
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X123.55 Y126.774 E-.61876
G1 X123.287 Y127.037 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 35/85
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
G3 Z7.2 I-.562 J1.08 P1  F30000
G1 X131.102 Y131.102 Z7.2
M73 P58 R7
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1280
G1 X131.102 Y124.898 E.2058
G1 X130.59 Y124.898 E.01698
G1 X130.59 Y124.102 E.0264
G1 X136.898 Y124.102 E.20924
G1 X136.898 Y131.898 E.2586
G1 X121.102 Y131.898 E.52398
G1 X121.102 Y124.102 E.2586
G1 X124.409 Y124.102 E.10971
G1 X124.412 Y124.898 E.0264
G1 X123.898 Y124.898 E.01707
G1 X123.898 Y131.102 E.2058
G1 X131.042 Y131.102 E.23698
G1 X130.71 Y130.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1280
G1 X130.71 Y125.29 E.16654
G1 X130.198 Y125.29 E.01572
G1 X130.198 Y123.71 E.04855
G1 X137.29 Y123.71 E.21792
G1 X137.29 Y132.29 E.26364
G1 X120.71 Y132.29 E.50946
G1 X120.71 Y123.71 E.26364
G1 X124.801 Y123.71 E.12571
G1 X124.801 Y123.885 E.00538
G1 X124.806 Y125.29 E.04317
G1 X124.29 Y125.29 E.01586
G1 X124.29 Y130.71 E.16654
G1 X130.65 Y130.71 E.19543
M204 S10000
G1 X131.593 Y130.936 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1280
G1 X131.45 Y130.936 E.00474
G1 X131.45 Y129.45 E.04928
G1 X133.55 Y131.55 E.09848
G1 X134.126 Y131.55 E.01913
G1 X136.55 Y129.126 E.11369
G1 X136.55 Y126.874 E.07472
G1 X134.126 Y124.45 E.11369
G1 X133.55 Y124.45 E.01913
G1 X131.45 Y126.55 E.09848
G1 X131.45 Y124.921 E.05401
G1 X131.306 Y131.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1280
G1 X123.694 Y131.5 E.24112
G1 X123.55 Y130.854 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1280
G1 X123.55 Y129.226 E.05401
G1 X121.45 Y127.126 E.09848
G1 X121.45 Y128.874 E.05796
G1 X123.55 Y126.774 E.09848
G1 X123.55 Y125.146 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 7.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X123.55 Y126.774 E-.61876
G1 X123.287 Y127.037 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 36/85
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
G3 Z7.4 I-.562 J1.08 P1  F30000
G1 X131.102 Y131.102 Z7.4
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1280
G1 X131.102 Y124.898 E.2058
G1 X130.59 Y124.898 E.01699
G1 X130.59 Y124.102 E.0264
G1 X136.898 Y124.102 E.20925
G1 X136.898 Y131.898 E.2586
G1 X121.102 Y131.898 E.52398
G1 X121.102 Y124.102 E.2586
G1 X124.408 Y124.102 E.10965
G1 X124.404 Y124.898 E.0264
M73 P59 R7
G1 X123.898 Y124.898 E.0168
G1 X123.898 Y131.102 E.2058
G1 X131.042 Y131.102 E.23698
G1 X130.71 Y130.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1280
G1 X130.71 Y125.29 E.16654
G1 X130.198 Y125.29 E.01573
G1 X130.198 Y123.71 E.04855
G1 X137.29 Y123.71 E.21792
G1 X137.29 Y132.29 E.26364
G1 X120.71 Y132.29 E.50946
G1 X120.71 Y123.71 E.26364
G1 X124.801 Y123.71 E.12571
G1 X124.795 Y125.29 E.04855
G1 X124.29 Y125.29 E.01552
G1 X124.29 Y130.71 E.16654
G1 X130.65 Y130.71 E.19543
M204 S10000
G1 X131.593 Y130.936 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1280
G1 X131.45 Y130.936 E.00474
G1 X131.45 Y129.45 E.04928
G1 X133.55 Y131.55 E.09848
G1 X134.126 Y131.55 E.01913
G1 X136.55 Y129.126 E.11369
G1 X136.55 Y126.874 E.07472
G1 X134.126 Y124.45 E.11369
G1 X133.55 Y124.45 E.01913
G1 X131.45 Y126.55 E.09848
G1 X131.45 Y124.921 E.05401
G1 X131.306 Y131.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1280
G1 X123.694 Y131.5 E.24112
G1 X123.55 Y130.854 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1280
G1 X123.55 Y129.226 E.05401
G1 X121.45 Y127.126 E.09848
G1 X121.45 Y128.874 E.05796
G1 X123.55 Y126.774 E.09848
G1 X123.55 Y125.146 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 7.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X123.55 Y126.774 E-.61876
G1 X123.287 Y127.037 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 37/85
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
G3 Z7.6 I-.562 J1.08 P1  F30000
G1 X131.102 Y131.102 Z7.6
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1281
G1 X131.102 Y124.898 E.2058
G1 X130.566 Y124.898 E.01779
G1 X130.566 Y124.102 E.0264
G1 X136.898 Y124.102 E.21005
G1 X136.898 Y131.898 E.2586
G1 X121.102 Y131.898 E.52398
G1 X121.102 Y124.102 E.2586
G1 X124.432 Y124.102 E.11046
G1 X124.43 Y124.64 E.01786
G1 X124.431 Y124.898 E.00854
G1 X123.898 Y124.898 E.01767
G1 X123.898 Y131.102 E.2058
G1 X131.042 Y131.102 E.23698
G1 X130.71 Y130.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1281
G1 X130.71 Y125.29 E.16654
G1 X130.174 Y125.29 E.01647
G1 X130.174 Y123.71 E.04855
G1 X137.29 Y123.71 E.21867
G1 X137.29 Y132.29 E.26364
G1 X120.71 Y132.29 E.50946
M73 P60 R7
G1 X120.71 Y123.71 E.26364
G1 X124.826 Y123.71 E.12646
G1 X124.822 Y124.64 E.02859
G1 X124.824 Y125.29 E.01996
G1 X124.29 Y125.29 E.01642
G1 X124.29 Y130.71 E.16654
G1 X130.65 Y130.71 E.19543
M204 S10000
G1 X131.593 Y130.936 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1281
G1 X131.45 Y130.936 E.00474
G1 X131.45 Y129.45 E.04928
G1 X133.55 Y131.55 E.09848
G1 X134.126 Y131.55 E.01913
G1 X136.55 Y129.126 E.11369
G1 X136.55 Y126.874 E.07472
G1 X134.126 Y124.45 E.11369
G1 X133.55 Y124.45 E.01913
G1 X131.45 Y126.55 E.09848
G1 X131.45 Y124.921 E.05401
G1 X131.306 Y131.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1281
G1 X123.694 Y131.5 E.24112
G1 X123.55 Y130.854 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1281
G1 X123.55 Y129.226 E.05401
G1 X121.45 Y127.126 E.09848
G1 X121.45 Y128.874 E.05796
G1 X123.55 Y126.774 E.09848
G1 X123.55 Y125.146 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 7.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X123.55 Y126.774 E-.61876
G1 X123.287 Y127.037 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 38/85
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
G3 Z7.8 I-.562 J1.08 P1  F30000
G1 X131.102 Y131.102 Z7.8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1283
G1 X131.102 Y124.898 E.2058
G1 X130.542 Y124.898 E.01859
G1 X130.542 Y124.102 E.0264
G1 X136.898 Y124.102 E.21085
G1 X136.898 Y131.898 E.2586
G1 X121.102 Y131.898 E.52398
G1 X121.102 Y124.102 E.2586
G1 X124.458 Y124.102 E.11132
G1 X124.461 Y124.898 E.0264
G1 X123.898 Y124.898 E.01868
G1 X123.898 Y131.102 E.2058
G1 X131.042 Y131.102 E.23698
G1 X130.71 Y130.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1283
G1 X130.71 Y125.29 E.16654
G1 X130.15 Y125.29 E.01721
G1 X130.149 Y123.71 E.04855
G1 X137.29 Y123.71 E.21941
G1 X137.29 Y132.29 E.26364
G1 X120.71 Y132.29 E.50946
G1 X120.71 Y123.71 E.26364
G1 X124.85 Y123.71 E.12721
G1 X124.849 Y123.876 E.00509
G1 X124.854 Y125.29 E.04346
G1 X124.29 Y125.29 E.01734
G1 X124.29 Y130.71 E.16654
G1 X130.65 Y130.71 E.19543
M204 S10000
G1 X131.593 Y130.936 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1283
G1 X131.45 Y130.936 E.00474
G1 X131.45 Y129.45 E.04928
G1 X133.55 Y131.55 E.09848
G1 X134.126 Y131.55 E.01913
G1 X136.55 Y129.126 E.11369
G1 X136.55 Y126.874 E.07472
G1 X134.126 Y124.45 E.11369
G1 X133.55 Y124.45 E.01913
G1 X131.45 Y126.55 E.09848
G1 X131.45 Y124.921 E.05401
G1 X131.306 Y131.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1283
G1 X123.694 Y131.5 E.24112
G1 X123.55 Y130.854 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1283
G1 X123.55 Y129.226 E.05401
G1 X121.45 Y127.126 E.09848
G1 X121.45 Y128.874 E.05796
G1 X123.55 Y126.774 E.09848
G1 X123.55 Y125.146 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 7.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X123.55 Y126.774 E-.61876
G1 X123.287 Y127.037 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 39/85
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
M73 P61 R7
G3 Z8 I-.562 J1.08 P1  F30000
G1 X131.102 Y131.102 Z8
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1287
G1 X131.102 Y124.898 E.2058
G1 X130.491 Y124.898 E.02028
G1 X130.491 Y124.102 E.0264
G1 X136.898 Y124.102 E.21254
G1 X136.898 Y131.898 E.2586
G1 X121.102 Y131.898 E.52398
G1 X121.102 Y124.102 E.2586
G1 X124.507 Y124.102 E.11294
G1 X124.504 Y124.898 E.0264
M73 P61 R6
G1 X123.898 Y124.898 E.02009
G1 X123.898 Y131.102 E.2058
G1 X131.042 Y131.102 E.23698
G1 X130.71 Y130.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1287
G1 X130.71 Y125.29 E.16654
G1 X130.109 Y125.29 E.01847
G1 X130.108 Y123.71 E.04855
G1 X137.29 Y123.71 E.22067
G1 X137.29 Y132.29 E.26364
G1 X120.71 Y132.29 E.50946
G1 X120.71 Y123.71 E.26364
G1 X124.891 Y123.71 E.12847
G1 X124.895 Y125.117 E.04324
G1 X124.894 Y125.29 E.00531
G1 X124.29 Y125.29 E.01856
G1 X124.29 Y130.71 E.16654
G1 X130.65 Y130.71 E.19543
M204 S10000
G1 X131.593 Y130.936 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1287
G1 X131.45 Y130.936 E.00474
G1 X131.45 Y129.45 E.04928
G1 X133.55 Y131.55 E.09848
G1 X134.126 Y131.55 E.01913
G1 X136.55 Y129.126 E.11369
G1 X136.55 Y126.874 E.07472
G1 X134.126 Y124.45 E.11369
G1 X133.55 Y124.45 E.01913
G1 X131.45 Y126.55 E.09848
G1 X131.45 Y124.921 E.05401
G1 X131.306 Y131.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1287
G1 X123.694 Y131.5 E.24112
G1 X123.55 Y130.854 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1287
G1 X123.55 Y129.226 E.05401
G1 X121.45 Y127.126 E.09848
G1 X121.45 Y128.874 E.05796
G1 X123.55 Y126.774 E.09848
G1 X123.55 Y125.146 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X123.55 Y126.774 E-.61876
G1 X123.287 Y127.037 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 40/85
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
G3 Z8.2 I-.562 J1.08 P1  F30000
G1 X131.102 Y131.102 Z8.2
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1300
G1 X131.102 Y124.898 E.2058
G1 X130.415 Y124.898 E.02278
G1 X130.415 Y124.102 E.0264
G1 X136.898 Y124.102 E.21505
G1 X136.898 Y131.898 E.2586
G1 X121.102 Y131.898 E.52398
M73 P62 R6
G1 X121.102 Y124.102 E.2586
G1 X124.583 Y124.102 E.11546
G1 X124.581 Y124.555 E.01502
G1 X124.582 Y124.898 E.01138
G1 X123.898 Y124.898 E.02269
G1 X123.898 Y131.102 E.2058
G1 X131.042 Y131.102 E.23698
G1 X130.71 Y130.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1300
G1 X130.71 Y125.29 E.16654
G1 X130.057 Y125.29 E.02005
G1 X130.023 Y125.29 E.00105
G1 X130.023 Y123.71 E.04855
G1 X130.058 Y123.71 E.00107
G1 X137.29 Y123.71 E.22223
G1 X137.29 Y132.29 E.26364
G1 X120.71 Y132.29 E.50946
G1 X120.71 Y123.71 E.26364
G1 X124.941 Y123.71 E.13002
G1 X124.976 Y123.71 E.00107
G2 X124.976 Y125.29 I103.498 J.833 E.04855
G1 X124.935 Y125.29 E.00124
G1 X124.29 Y125.29 E.01982
G1 X124.29 Y130.71 E.16654
G1 X130.65 Y130.71 E.19543
M204 S10000
G1 X131.593 Y130.936 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1300
G1 X131.45 Y130.936 E.00474
G1 X131.45 Y129.45 E.04928
G1 X133.55 Y131.55 E.09848
G1 X134.126 Y131.55 E.01913
G1 X136.55 Y129.126 E.11368
G1 X136.55 Y126.874 E.07472
G1 X134.126 Y124.45 E.11368
G1 X133.55 Y124.45 E.01913
G1 X131.45 Y126.55 E.09848
G1 X131.45 Y125.076 E.0489
G1 X131.565 Y124.979 E.00496
G1 X130.813 Y124.5 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.431684
G1 F1300
G1 X131.306 Y124.504 E.01562
G1 X131.306 Y131.5 F30000
; FEATURE: Gap infill
G1 F1300
G1 X123.694 Y131.5 E.24112
G1 X123.55 Y130.854 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1300
G1 X123.55 Y129.226 E.05401
G1 X121.45 Y127.126 E.09848
G1 X121.45 Y128.874 E.05796
G1 X123.55 Y126.774 E.09848
G1 X123.55 Y125.146 E.05401
G1 X123.634 Y124.505 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.441124
G1 F1300
G1 X124.124 Y124.501 E.0159
; CHANGE_LAYER
; Z_HEIGHT: 8.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X123.634 Y124.505 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 41/85
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
G3 Z8.4 I-.806 J.912 P1  F30000
G1 X131.102 Y131.102 Z8.4
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1305
G1 X131.102 Y124.898 E.2058
G1 X130.34 Y124.898 E.02528
G1 X130.34 Y124.102 E.0264
G1 X136.898 Y124.102 E.21755
G1 X136.898 Y131.898 E.2586
G1 X121.102 Y131.898 E.52398
G1 X121.102 Y124.102 E.2586
G1 X124.661 Y124.102 E.11806
G1 X124.664 Y124.898 E.0264
G1 X123.898 Y124.898 E.02541
G1 X123.898 Y131.102 E.2058
G1 X131.042 Y131.102 E.23698
G1 X130.71 Y130.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M73 P63 R6
G1 F1305
G1 X130.71 Y125.29 E.16654
G1 X129.982 Y125.29 E.02236
G1 X129.948 Y125.29 E.00105
G1 X129.947 Y123.71 E.04855
G1 X129.982 Y123.71 E.00107
G1 X137.29 Y123.71 E.22456
G1 X137.29 Y132.29 E.26364
G1 X120.71 Y132.29 E.50946
G1 X120.71 Y123.71 E.26364
G1 X125.017 Y123.71 E.13235
G1 X125.052 Y123.71 E.00107
G2 X125.058 Y125.29 I103.714 J.429 E.04855
G1 X125.017 Y125.29 E.00126
G1 X124.29 Y125.29 E.02233
G1 X124.29 Y130.71 E.16654
G1 X130.65 Y130.71 E.19543
M204 S10000
G1 X131.593 Y130.936 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1305
G1 X131.45 Y130.936 E.00474
G1 X131.45 Y129.45 E.04928
G1 X133.55 Y131.55 E.09848
G1 X134.126 Y131.55 E.01913
G1 X136.55 Y129.126 E.11368
G1 X136.55 Y126.874 E.07472
G1 X134.126 Y124.45 E.11368
G1 X133.55 Y124.45 E.01913
G1 X131.45 Y126.55 E.09848
G1 X131.45 Y125.076 E.0489
G1 X131.565 Y124.979 E.00496
G1 X130.738 Y124.5 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.431684
G1 F1305
G1 X131.306 Y124.5 E.01802
G1 X131.306 Y131.5 F30000
; FEATURE: Gap infill
G1 F1305
G1 X123.694 Y131.5 E.24112
G1 X123.55 Y130.854 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1305
G1 X123.55 Y129.226 E.05401
G1 X121.45 Y127.126 E.09848
G1 X121.45 Y128.874 E.05796
G1 X123.55 Y126.774 E.09848
G1 X123.55 Y125.146 E.05401
G1 X123.634 Y124.505 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.441122
G1 F1305
G1 X124.205 Y124.5 E.01852
; CHANGE_LAYER
; Z_HEIGHT: 8.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X123.634 Y124.505 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 42/85
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
G3 Z8.6 I-.806 J.912 P1  F30000
G1 X131.102 Y131.102 Z8.6
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1329
G1 X131.102 Y124.898 E.2058
G1 X130.22 Y124.898 E.02926
G1 X130.22 Y124.102 E.0264
G1 X136.898 Y124.102 E.22151
G1 X136.898 Y131.898 E.2586
G1 X121.102 Y131.898 E.52398
G1 X121.102 Y124.102 E.2586
G1 X124.777 Y124.102 E.12191
G1 X124.774 Y124.898 E.0264
G1 X123.898 Y124.898 E.02906
G1 X123.898 Y131.102 E.2058
G1 X131.042 Y131.102 E.23698
G1 X130.71 Y130.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1329
G1 X130.71 Y125.29 E.16654
G1 X129.907 Y125.29 E.02467
G1 X129.828 Y125.29 E.00244
G1 X129.828 Y123.71 E.04855
G1 X129.906 Y123.71 E.0024
G1 X137.29 Y123.71 E.22688
G1 X137.29 Y132.29 E.26364
G1 X120.71 Y132.29 E.50946
G1 X120.71 Y123.71 E.26364
G1 X125.093 Y123.71 E.13468
G1 X125.171 Y123.71 E.00239
G2 X125.166 Y125.29 I98.431 J1.119 E.04855
G1 X125.099 Y125.29 E.00206
G1 X124.29 Y125.29 E.02485
G1 X124.29 Y130.71 E.16654
G1 X130.65 Y130.71 E.19543
M204 S10000
G1 X131.593 Y130.936 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1329
G1 X131.45 Y130.936 E.00474
G1 X131.45 Y129.45 E.04928
G1 X133.55 Y131.55 E.09848
G1 X134.126 Y131.55 E.01913
G1 X136.55 Y129.126 E.11369
G1 X136.55 Y126.874 E.07472
G1 X134.126 Y124.45 E.11369
G1 X133.55 Y124.45 E.01913
G1 X131.45 Y126.55 E.09848
G1 X131.45 Y125.064 E.04928
G1 X131.593 Y125.064 E.00474
G1 X131.306 Y124.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1329
G1 X130.424 Y124.5 E.02794
; WIPE_START
G1 F24000
G1 X131.306 Y124.5 E-.76
; WIPE_END
G1 E-.04 F1800
G17
M73 P64 R6
G3 Z8.8 I0 J-1.217 P1  F30000
G1 X124.572 Y124.5 Z8.8
G1 Z8.4
G1 E.8 F1800
G1 F1329
G1 X123.694 Y124.5 E.0278
G1 X123.55 Y125.146 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1329
G1 X123.55 Y126.774 E.05401
G1 X121.45 Y128.874 E.09848
G1 X121.45 Y127.126 E.05796
G1 X123.55 Y129.226 E.09848
G1 X123.55 Y130.854 E.05401
G1 X123.694 Y131.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1329
G1 X131.306 Y131.5 E.24112
; CHANGE_LAYER
; Z_HEIGHT: 8.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.306 Y131.5 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 43/85
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
G3 Z8.8 I.263 J1.188 P1  F30000
G1 X131.102 Y131.102 Z8.8
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1338
G1 X131.102 Y124.898 E.2058
G1 X130.083 Y124.898 E.0338
G1 X130.083 Y124.102 E.0264
G1 X136.898 Y124.102 E.22608
G1 X136.898 Y131.898 E.2586
G1 X121.102 Y131.898 E.52398
G1 X121.102 Y124.102 E.2586
G1 X124.914 Y124.102 E.12646
G1 X124.917 Y124.898 E.0264
G1 X123.898 Y124.898 E.03382
G1 X123.898 Y131.102 E.2058
G1 X131.042 Y131.102 E.23698
G1 X130.71 Y130.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1338
G1 X130.71 Y125.29 E.16654
G1 X129.705 Y125.29 E.03089
G1 X129.691 Y125.29 E.00042
G1 X129.69 Y123.71 E.04855
G1 X129.705 Y123.71 E.00046
G1 X129.787 Y123.71 E.00252
G1 X137.29 Y123.71 E.23054
G1 X137.29 Y132.29 E.26364
G1 X120.71 Y132.29 E.50946
G1 X120.71 Y123.71 E.26364
G1 X125.294 Y123.71 E.14085
G1 X125.309 Y123.71 E.00046
G2 X125.311 Y125.29 I98.393 J.664 E.04855
G1 X125.289 Y125.29 E.00069
G1 X124.29 Y125.29 E.03068
G1 X124.29 Y130.71 E.16654
G1 X130.65 Y130.71 E.19543
M204 S10000
G1 X131.593 Y130.936 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1338
G1 X131.45 Y130.936 E.00474
G1 X131.45 Y129.45 E.04928
G1 X133.55 Y131.55 E.09848
G1 X134.126 Y131.55 E.01913
G1 X136.55 Y129.126 E.11369
G1 X136.55 Y126.874 E.07472
G1 X134.126 Y124.45 E.11369
G1 X133.55 Y124.45 E.01913
G1 X131.45 Y126.55 E.09848
G1 X131.45 Y125.064 E.04928
G1 X131.593 Y125.064 E.00474
G1 X131.306 Y124.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1338
G1 X130.286 Y124.5 E.03229
; WIPE_START
G1 F24000
G1 X131.306 Y124.5 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9 I0 J-1.217 P1  F30000
G1 X124.712 Y124.5 Z9
G1 Z8.6
G1 E.8 F1800
G1 F1338
G1 X123.694 Y124.5 E.03225
G1 X123.55 Y125.146 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1338
G1 X123.55 Y126.774 E.05401
G1 X121.45 Y128.874 E.09848
G1 X121.45 Y127.126 E.05796
G1 X123.55 Y129.226 E.09848
G1 X123.55 Y130.854 E.05401
M73 P65 R6
G1 X123.694 Y131.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1338
G1 X131.306 Y131.5 E.24112
; CHANGE_LAYER
; Z_HEIGHT: 8.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.306 Y131.5 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 44/85
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
G3 Z9 I.263 J1.188 P1  F30000
G1 X131.102 Y131.102 Z9
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1350
G1 X131.102 Y124.898 E.2058
G1 X129.924 Y124.898 E.03907
G1 X129.925 Y124.102 E.0264
G1 X136.898 Y124.102 E.2313
G1 X136.898 Y131.898 E.2586
G1 X121.102 Y131.898 E.52398
G1 X121.102 Y124.102 E.2586
G1 X125.071 Y124.102 E.13167
G1 X125.068 Y124.898 E.0264
G1 X123.898 Y124.898 E.0388
G1 X123.898 Y131.102 E.2058
G1 X131.042 Y131.102 E.23698
G1 X130.71 Y130.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1350
G1 X130.71 Y125.29 E.16654
G1 X129.568 Y125.29 E.03508
G1 X129.532 Y125.29 E.00113
G1 X129.533 Y123.71 E.04855
G1 X129.567 Y123.71 E.00104
G1 X129.649 Y123.71 E.00252
G1 X137.29 Y123.71 E.23478
G1 X137.29 Y132.29 E.26364
G1 X120.71 Y132.29 E.50946
G1 X120.71 Y123.71 E.26364
G1 X125.432 Y123.71 E.14509
G1 X125.465 Y123.71 E.00103
G1 X125.458 Y125.29 E.04855
G1 X125.434 Y125.29 E.00073
G1 X124.29 Y125.29 E.03515
G1 X124.29 Y130.71 E.16654
G1 X130.65 Y130.71 E.19543
M204 S10000
G1 X131.593 Y130.936 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1350
G1 X131.45 Y130.936 E.00474
G1 X131.45 Y129.45 E.04928
G1 X133.55 Y131.55 E.09848
G1 X134.126 Y131.55 E.01913
G1 X136.55 Y129.126 E.11369
G1 X136.55 Y126.874 E.07472
G1 X134.126 Y124.45 E.11369
G1 X133.55 Y124.45 E.01913
G1 X131.45 Y126.55 E.09848
G1 X131.45 Y125.064 E.04928
G1 X131.593 Y125.064 E.00474
G1 X131.306 Y124.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1350
G1 X130.128 Y124.5 E.0373
; WIPE_START
G1 F24000
G1 X131.306 Y124.5 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.2 I0 J-1.217 P1  F30000
G1 X124.866 Y124.5 Z9.2
G1 Z8.8
G1 E.8 F1800
G1 F1350
G1 X123.694 Y124.5 E.03711
G1 X123.55 Y125.146 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1350
G1 X123.55 Y126.774 E.05401
G1 X121.45 Y128.874 E.09848
G1 X121.45 Y127.126 E.05796
G1 X123.55 Y129.226 E.09848
G1 X123.55 Y130.854 E.05401
G1 X123.694 Y131.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1350
G1 X131.306 Y131.5 E.24112
; CHANGE_LAYER
; Z_HEIGHT: 9
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.306 Y131.5 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 45/85
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
G3 Z9.2 I.263 J1.188 P1  F30000
G1 X131.102 Y131.102 Z9.2
G1 Z9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1361
G1 X131.102 Y124.898 E.2058
G1 X129.701 Y124.898 E.04648
M73 P66 R6
G1 X129.7 Y124.102 E.0264
G1 X136.898 Y124.102 E.23876
G1 X136.898 Y131.898 E.2586
G1 X121.102 Y131.898 E.52398
G1 X121.102 Y124.102 E.2586
G1 X125.297 Y124.102 E.13916
G1 X125.296 Y124.382 E.0093
G1 X125.298 Y124.898 E.0171
G1 X123.898 Y124.898 E.04645
G1 X123.898 Y131.102 E.2058
G1 X131.042 Y131.102 E.23698
G1 X130.71 Y130.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1361
G1 X130.71 Y125.29 E.16654
G1 X129.327 Y125.29 E.04251
M106 S255
G1 F1800
G1 X129.309 Y125.29 E.00054
G1 X129.308 Y123.71 E.04855
G1 X129.328 Y123.71 E.00063
M106 S252.45
G1 F1361
G1 X129.492 Y123.71 E.00504
G1 X137.29 Y123.71 E.2396
G1 X137.29 Y132.29 E.26364
G1 X120.71 Y132.29 E.50946
G1 X120.71 Y123.71 E.26364
G1 X125.67 Y123.71 E.15242
M106 S255
G1 F1800
G1 X125.691 Y123.71 E.00064
G2 X125.692 Y125.29 I86.318 J.747 E.04855
G1 X125.663 Y125.29 E.00089
M106 S252.45
G1 F1361
G1 X124.29 Y125.29 E.04218
G1 X124.29 Y130.71 E.16654
G1 X130.65 Y130.71 E.19543
M204 S10000
G1 X131.593 Y130.936 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1361
G1 X131.45 Y130.936 E.00474
G1 X131.45 Y129.45 E.04928
G1 X133.55 Y131.55 E.09848
G1 X134.126 Y131.55 E.01913
G1 X136.55 Y129.126 E.11369
G1 X136.55 Y126.874 E.07472
G1 X134.126 Y124.45 E.11369
G1 X133.55 Y124.45 E.01913
G1 X131.45 Y126.55 E.09848
G1 X131.45 Y125.064 E.04928
G1 X131.593 Y125.064 E.00474
G1 X131.306 Y124.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1361
G1 X129.904 Y124.5 E.0444
; WIPE_START
G1 F24000
G1 X131.306 Y124.5 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I0 J-1.217 P1  F30000
G1 X125.093 Y124.5 Z9.4
G1 Z9
G1 E.8 F1800
G1 F1361
G1 X123.694 Y124.5 E.0443
G1 X123.55 Y125.146 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1361
G1 X123.55 Y126.774 E.05401
G1 X121.45 Y128.874 E.09848
G1 X121.45 Y127.126 E.05796
G1 X123.55 Y129.226 E.09848
G1 X123.55 Y130.854 E.05401
G1 X123.694 Y131.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1361
G1 X131.306 Y131.5 E.24112
; CHANGE_LAYER
; Z_HEIGHT: 9.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.306 Y131.5 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 46/85
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
G3 Z9.4 I.263 J1.188 P1  F30000
G1 X131.102 Y131.102 Z9.4
G1 Z9.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1381
G1 X131.102 Y124.898 E.2058
M73 P66 R5
G1 X129.439 Y124.898 E.05518
G1 X129.44 Y124.102 E.0264
G1 X136.898 Y124.102 E.24739
G1 X136.898 Y131.898 E.2586
G1 X121.102 Y131.898 E.52398
G1 X121.102 Y124.102 E.2586
G1 X125.555 Y124.102 E.14771
G1 X125.55 Y124.898 E.0264
G1 X123.898 Y124.898 E.05481
G1 X123.898 Y131.102 E.2058
G1 X131.042 Y131.102 E.23698
G1 X130.71 Y130.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1381
G1 X130.71 Y125.29 E.16654
G1 X129.104 Y125.29 E.04934
M106 S255
G1 F1800
G1 X129.046 Y125.29 E.00179
G1 X129.049 Y123.71 E.04855
G1 X129.103 Y123.71 E.00167
M106 S252.45
G1 F1381
G1 X129.267 Y123.71 E.00504
G1 X137.29 Y123.71 E.24652
G1 X137.29 Y132.29 E.26364
G1 X120.71 Y132.29 E.50946
G1 X120.71 Y123.71 E.26364
G1 X125.896 Y123.71 E.15935
M106 S255
G1 F1800
G1 X125.95 Y123.71 E.00164
G1 X125.94 Y125.29 E.04855
G1 X125.897 Y125.29 E.00132
M106 S252.45
G1 F1381
G1 X124.29 Y125.29 E.04938
G1 X124.29 Y130.71 E.16654
G1 X130.65 Y130.71 E.19543
M204 S10000
G1 X131.593 Y130.936 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1381
G1 X131.45 Y130.936 E.00474
G1 X131.45 Y129.45 E.04928
M73 P67 R5
G1 X133.55 Y131.55 E.09848
G1 X134.126 Y131.55 E.01913
G1 X136.55 Y129.126 E.11369
G1 X136.55 Y126.874 E.07472
G1 X134.126 Y124.45 E.11369
G1 X133.55 Y124.45 E.01913
G1 X131.45 Y126.55 E.09848
G1 X131.45 Y125.064 E.04928
G1 X131.593 Y125.064 E.00474
G1 X131.306 Y124.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1381
G1 X129.643 Y124.5 E.05267
; WIPE_START
G1 F24000
G1 X131.306 Y124.5 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.6 I0 J-1.217 P1  F30000
G1 X125.349 Y124.5 Z9.6
G1 Z9.2
G1 E.8 F1800
G1 F1381
G1 X123.694 Y124.5 E.05242
G1 X123.55 Y125.146 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1381
G1 X123.55 Y126.774 E.05401
G1 X121.45 Y128.874 E.09848
G1 X121.45 Y127.126 E.05796
G1 X123.55 Y129.226 E.09848
G1 X123.55 Y130.854 E.05401
G1 X123.694 Y131.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1381
G1 X131.306 Y131.5 E.24112
; CHANGE_LAYER
; Z_HEIGHT: 9.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.306 Y131.5 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 47/85
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
G3 Z9.6 I.263 J1.188 P1  F30000
G1 X131.102 Y131.102 Z9.6
G1 Z9.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1455
G1 X131.102 Y124.898 E.2058
G1 X129.064 Y124.898 E.0676
G1 X129.062 Y124.102 E.0264
G1 X136.898 Y124.102 E.25994
G1 X136.898 Y131.898 E.2586
G1 X121.102 Y131.898 E.52398
G1 X121.102 Y124.102 E.2586
G1 X125.94 Y124.102 E.16047
G1 X125.944 Y124.898 E.0264
G1 X123.898 Y124.898 E.06788
G1 X123.898 Y131.102 E.2058
G1 X131.042 Y131.102 E.23698
G1 X130.71 Y130.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1455
G1 X130.71 Y125.29 E.16654
G1 X129.005 Y125.29 E.05239
G1 X128.759 Y125.29 E.00756
M106 S255
G1 F600
G1 X128.673 Y125.29 E.00263
G1 X128.669 Y123.71 E.04855
G1 X128.762 Y123.71 E.00286
M106 S252.45
G1 F1455
G1 X129.008 Y123.71 E.00756
G1 X137.29 Y123.71 E.25449
G1 X137.29 Y132.29 E.26364
G1 X120.71 Y132.29 E.50946
G1 X120.71 Y123.71 E.26364
G1 X125.991 Y123.71 E.16226
G1 X126.237 Y123.71 E.00756
M106 S255
G1 F600
G1 X126.331 Y123.71 E.00289
G2 X126.339 Y125.29 I66.534 J.455 E.04855
G1 X126.227 Y125.29 E.00343
M106 S252.45
G1 F1455
G1 X125.981 Y125.29 E.00756
G1 X124.29 Y125.29 E.05195
G1 X124.29 Y130.71 E.16654
G1 X130.65 Y130.71 E.19543
M204 S10000
G1 X131.593 Y130.936 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1455
G1 X131.45 Y130.936 E.00474
G1 X131.45 Y129.45 E.04928
G1 X133.55 Y131.55 E.09848
G1 X134.126 Y131.55 E.01913
G1 X136.55 Y129.126 E.11369
G1 X136.55 Y126.874 E.07472
G1 X134.126 Y124.45 E.11369
G1 X133.55 Y124.45 E.01913
G1 X131.45 Y126.55 E.09848
G1 X131.45 Y125.064 E.04928
G1 X131.593 Y125.064 E.00474
G1 X131.306 Y124.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1455
G1 X129.267 Y124.5 E.06459
; WIPE_START
G1 F24000
G1 X131.267 Y124.5 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.8 I0 J-1.217 P1  F30000
G1 X125.738 Y124.5 Z9.8
M73 P68 R5
G1 Z9.4
G1 E.8 F1800
G1 F1455
G1 X123.694 Y124.5 E.06476
G1 X123.55 Y125.146 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1455
G1 X123.55 Y126.774 E.05401
G1 X121.45 Y128.874 E.09848
G1 X121.45 Y127.126 E.05796
G1 X123.55 Y129.226 E.09848
G1 X123.55 Y130.854 E.05401
G1 X123.694 Y131.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1455
G1 X131.306 Y131.5 E.24112
; CHANGE_LAYER
; Z_HEIGHT: 9.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.306 Y131.5 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 48/85
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
G3 Z9.8 I.263 J1.188 P1  F30000
G1 X131.102 Y131.102 Z9.8
G1 Z9.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1488
G1 X123.898 Y131.102 E.23898
G1 X123.898 Y124.898 E.2058
G1 X126.746 Y124.898 E.09449
M204 S5000
; FEATURE: Overhang wall
M106 S255
G1 F3000
G1 X128.262 Y124.898 E.05028
M106 S252.45
M204 S10000
; FEATURE: Inner wall
G1 F1488
G1 X128.645 Y124.898 E.01269
G1 X131.102 Y124.898 E.08152
G1 X131.102 Y131.042 E.20381
G1 X130.71 Y130.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1488
G1 X124.29 Y130.71 E.19727
G1 X124.29 Y125.29 E.16654
G1 X126.749 Y125.29 E.07555
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X128.263 Y125.29 E.05024
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1488
G1 X128.632 Y125.29 E.01134
G1 X130.71 Y125.29 E.06384
G1 X130.71 Y130.65 E.1647
M204 S10000
; WIPE_START
G1 F24000
G1 X128.71 Y130.669 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10 I-.181 J1.203 P1  F30000
G1 X136.898 Y131.898 Z10
G1 Z9.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1488
G1 X121.102 Y131.898 E.52398
G1 X121.102 Y124.102 E.2586
G1 X126.742 Y124.102 E.18708
M204 S5000
; FEATURE: Overhang wall
M106 S255
G1 F3000
G1 X128.26 Y124.102 E.05035
M106 S252.45
M204 S10000
; FEATURE: Inner wall
G1 F1488
G1 X128.642 Y124.102 E.01269
G1 X136.898 Y124.102 E.27385
G1 X136.898 Y131.838 E.25661
G1 X137.29 Y132.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1488
G1 X120.71 Y132.29 E.50946
G1 X120.71 Y123.71 E.26364
G1 X126.741 Y123.71 E.18531
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X128.259 Y123.71 E.05035
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1488
G1 X128.628 Y123.71 E.01134
G1 X137.29 Y123.71 E.26617
G1 X137.29 Y132.23 E.2618
M204 S10000
; WIPE_START
G1 F24000
G1 X135.29 Y132.237 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10 I.404 J-1.148 P1  F30000
G1 X131.593 Y130.936 Z10
G1 Z9.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1488
G1 X131.45 Y130.936 E.00474
G1 X131.45 Y129.45 E.04928
G1 X133.55 Y131.55 E.09848
G1 X134.126 Y131.55 E.01913
G1 X136.55 Y129.126 E.11369
G1 X136.55 Y126.874 E.07472
G1 X134.126 Y124.45 E.11369
G1 X133.55 Y124.45 E.01913
G1 X131.45 Y126.55 E.09848
G1 X131.45 Y125.064 E.04928
G1 X131.593 Y125.064 E.00474
G1 X131.306 Y124.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1488
G1 X123.694 Y124.5 E.24112
G1 X123.55 Y125.146 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1488
G1 X123.55 Y126.774 E.05401
G1 X121.45 Y128.874 E.09848
G1 X121.45 Y127.126 E.05796
G1 X123.55 Y129.226 E.09848
G1 X123.55 Y130.854 E.05401
G1 X123.694 Y131.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1488
G1 X131.306 Y131.5 E.24112
; CHANGE_LAYER
; Z_HEIGHT: 9.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.306 Y131.5 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 49/85
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
G3 Z10 I.263 J1.188 P1  F30000
G1 X131.102 Y131.102 Z10
G1 Z9.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1507
G1 X123.898 Y131.102 E.23898
G1 X123.898 Y124.898 E.2058
G1 X131.102 Y124.898 E.23898
G1 X131.102 Y131.042 E.20381
M73 P69 R5
G1 X130.71 Y130.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1507
G1 X124.29 Y130.71 E.19727
G1 X124.29 Y125.29 E.16654
G1 X130.71 Y125.29 E.19727
G1 X130.71 Y130.65 E.1647
M204 S10000
; WIPE_START
G1 F24000
G1 X128.71 Y130.669 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.2 I-.181 J1.203 P1  F30000
G1 X136.898 Y131.898 Z10.2
G1 Z9.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1507
G1 X121.102 Y131.898 E.52398
G1 X121.102 Y124.102 E.2586
G1 X136.898 Y124.102 E.52398
G1 X136.898 Y131.838 E.25661
G1 X137.29 Y132.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1507
G1 X120.71 Y132.29 E.50946
G1 X120.71 Y123.71 E.26364
G1 X137.29 Y123.71 E.50946
G1 X137.29 Y132.23 E.2618
M204 S10000
; WIPE_START
G1 F24000
G1 X135.29 Y132.237 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.2 I.404 J-1.148 P1  F30000
G1 X131.593 Y130.936 Z10.2
G1 Z9.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1507
G1 X131.45 Y130.936 E.00474
G1 X131.45 Y129.45 E.04928
G1 X133.55 Y131.55 E.09848
G1 X134.126 Y131.55 E.01913
G1 X136.55 Y129.126 E.11369
G1 X136.55 Y126.874 E.07472
G1 X134.126 Y124.45 E.11369
G1 X133.55 Y124.45 E.01913
G1 X131.45 Y126.55 E.09848
G1 X131.45 Y125.064 E.04928
G1 X131.593 Y125.064 E.00474
G1 X131.306 Y124.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1507
G1 X123.694 Y124.5 E.24112
G1 X123.55 Y125.146 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1507
G1 X123.55 Y126.774 E.05401
G1 X121.45 Y128.874 E.09848
G1 X121.45 Y127.126 E.05796
G1 X123.55 Y129.226 E.09848
G1 X123.55 Y130.854 E.05401
G1 X123.694 Y131.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1507
G1 X131.306 Y131.5 E.24112
; CHANGE_LAYER
; Z_HEIGHT: 10
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.306 Y131.5 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 50/85
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
G3 Z10.2 I.263 J1.188 P1  F30000
G1 X131.102 Y131.102 Z10.2
G1 Z10
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1507
G1 X123.898 Y131.102 E.23898
G1 X123.898 Y124.898 E.2058
G1 X131.102 Y124.898 E.23898
G1 X131.102 Y131.042 E.20381
G1 X130.71 Y130.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1507
G1 X124.29 Y130.71 E.19727
G1 X124.29 Y125.29 E.16654
G1 X130.71 Y125.29 E.19727
G1 X130.71 Y130.65 E.1647
M204 S10000
; WIPE_START
G1 F24000
G1 X128.71 Y130.669 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.4 I-.181 J1.203 P1  F30000
G1 X136.898 Y131.898 Z10.4
G1 Z10
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1507
G1 X121.102 Y131.898 E.52398
G1 X121.102 Y124.102 E.2586
G1 X136.898 Y124.102 E.52398
G1 X136.898 Y131.838 E.25661
G1 X137.29 Y132.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1507
G1 X120.71 Y132.29 E.50946
M73 P70 R5
G1 X120.71 Y123.71 E.26364
G1 X137.29 Y123.71 E.50946
G1 X137.29 Y132.23 E.2618
M204 S10000
; WIPE_START
G1 F24000
G1 X135.29 Y132.237 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.4 I.404 J-1.148 P1  F30000
G1 X131.593 Y130.936 Z10.4
G1 Z10
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1507
G1 X131.45 Y130.936 E.00474
G1 X131.45 Y129.45 E.04928
G1 X133.55 Y131.55 E.09848
G1 X134.126 Y131.55 E.01913
G1 X136.55 Y129.126 E.11369
G1 X136.55 Y126.874 E.07472
G1 X134.126 Y124.45 E.11369
G1 X133.55 Y124.45 E.01913
G1 X131.45 Y126.55 E.09848
G1 X131.45 Y125.064 E.04928
G1 X131.593 Y125.064 E.00474
G1 X131.306 Y124.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1507
G1 X123.694 Y124.5 E.24112
G1 X123.55 Y125.146 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1507
G1 X123.55 Y126.774 E.05401
G1 X121.45 Y128.874 E.09848
G1 X121.45 Y127.126 E.05796
G1 X123.55 Y129.226 E.09848
G1 X123.55 Y130.854 E.05401
G1 X123.694 Y131.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1507
G1 X131.306 Y131.5 E.24112
; CHANGE_LAYER
; Z_HEIGHT: 10.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.306 Y131.5 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 51/85
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
G3 Z10.4 I.263 J1.188 P1  F30000
G1 X131.102 Y131.102 Z10.4
G1 Z10.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1507
G1 X123.898 Y131.102 E.23898
G1 X123.898 Y124.898 E.2058
G1 X131.102 Y124.898 E.23898
G1 X131.102 Y131.042 E.20381
G1 X130.71 Y130.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1507
G1 X124.29 Y130.71 E.19727
G1 X124.29 Y125.29 E.16654
G1 X130.71 Y125.29 E.19727
G1 X130.71 Y130.65 E.1647
M204 S10000
; WIPE_START
G1 F24000
G1 X128.71 Y130.669 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.6 I-.181 J1.203 P1  F30000
G1 X136.898 Y131.898 Z10.6
G1 Z10.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1507
G1 X121.102 Y131.898 E.52398
G1 X121.102 Y124.102 E.2586
G1 X136.898 Y124.102 E.52398
G1 X136.898 Y131.838 E.25661
G1 X137.29 Y132.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1507
G1 X120.71 Y132.29 E.50946
G1 X120.71 Y123.71 E.26364
G1 X137.29 Y123.71 E.50946
G1 X137.29 Y132.23 E.2618
M204 S10000
; WIPE_START
G1 F24000
G1 X135.29 Y132.237 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.6 I.404 J-1.148 P1  F30000
G1 X131.593 Y130.936 Z10.6
G1 Z10.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1507
G1 X131.45 Y130.936 E.00474
G1 X131.45 Y129.45 E.04928
G1 X133.55 Y131.55 E.09848
G1 X134.126 Y131.55 E.01913
G1 X136.55 Y129.126 E.11369
G1 X136.55 Y126.874 E.07472
G1 X134.126 Y124.45 E.11369
G1 X133.55 Y124.45 E.01913
G1 X131.45 Y126.55 E.09848
G1 X131.45 Y125.064 E.04928
G1 X131.593 Y125.064 E.00474
G1 X131.306 Y124.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1507
G1 X123.694 Y124.5 E.24112
G1 X123.55 Y125.146 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1507
G1 X123.55 Y126.774 E.05401
G1 X121.45 Y128.874 E.09848
G1 X121.45 Y127.126 E.05796
M73 P71 R5
G1 X123.55 Y129.226 E.09848
G1 X123.55 Y130.854 E.05401
G1 X123.694 Y131.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1507
G1 X131.306 Y131.5 E.24112
; CHANGE_LAYER
; Z_HEIGHT: 10.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.306 Y131.5 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 52/85
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
G3 Z10.6 I.263 J1.188 P1  F30000
G1 X131.102 Y131.102 Z10.6
G1 Z10.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1507
G1 X123.898 Y131.102 E.23898
G1 X123.898 Y124.898 E.2058
G1 X131.102 Y124.898 E.23898
G1 X131.102 Y131.042 E.20381
G1 X130.71 Y130.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1507
G1 X124.29 Y130.71 E.19727
G1 X124.29 Y125.29 E.16654
G1 X130.71 Y125.29 E.19727
G1 X130.71 Y130.65 E.1647
M204 S10000
; WIPE_START
G1 F24000
G1 X128.71 Y130.669 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.8 I-.181 J1.203 P1  F30000
G1 X136.898 Y131.898 Z10.8
G1 Z10.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1507
G1 X121.102 Y131.898 E.52398
G1 X121.102 Y124.102 E.2586
G1 X136.898 Y124.102 E.52398
G1 X136.898 Y131.838 E.25661
G1 X137.29 Y132.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1507
G1 X120.71 Y132.29 E.50946
G1 X120.71 Y123.71 E.26364
G1 X137.29 Y123.71 E.50946
G1 X137.29 Y132.23 E.2618
M204 S10000
; WIPE_START
G1 F24000
G1 X135.29 Y132.237 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.8 I.404 J-1.148 P1  F30000
G1 X131.593 Y130.936 Z10.8
G1 Z10.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1507
G1 X131.45 Y130.936 E.00474
G1 X131.45 Y129.45 E.04928
G1 X133.55 Y131.55 E.09848
G1 X134.126 Y131.55 E.01913
G1 X136.55 Y129.126 E.11369
G1 X136.55 Y126.874 E.07472
G1 X134.126 Y124.45 E.11369
G1 X133.55 Y124.45 E.01913
G1 X131.45 Y126.55 E.09848
G1 X131.45 Y125.064 E.04928
G1 X131.593 Y125.064 E.00474
G1 X131.306 Y124.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1507
G1 X123.694 Y124.5 E.24112
G1 X123.55 Y125.146 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1507
G1 X123.55 Y126.774 E.05401
G1 X121.45 Y128.874 E.09848
G1 X121.45 Y127.126 E.05796
G1 X123.55 Y129.226 E.09848
G1 X123.55 Y130.854 E.05401
G1 X123.694 Y131.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1507
G1 X131.306 Y131.5 E.24112
; CHANGE_LAYER
; Z_HEIGHT: 10.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.306 Y131.5 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 53/85
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
G3 Z10.8 I.263 J1.188 P1  F30000
G1 X131.102 Y131.102 Z10.8
G1 Z10.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1507
G1 X123.898 Y131.102 E.23898
G1 X123.898 Y124.898 E.2058
G1 X131.102 Y124.898 E.23898
G1 X131.102 Y131.042 E.20381
M73 P72 R5
G1 X130.71 Y130.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1507
G1 X124.29 Y130.71 E.19727
G1 X124.29 Y125.29 E.16654
G1 X130.71 Y125.29 E.19727
G1 X130.71 Y130.65 E.1647
M204 S10000
; WIPE_START
G1 F24000
G1 X128.71 Y130.669 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11 I-.181 J1.203 P1  F30000
G1 X136.898 Y131.898 Z11
G1 Z10.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1507
G1 X121.102 Y131.898 E.52398
G1 X121.102 Y124.102 E.2586
G1 X136.898 Y124.102 E.52398
G1 X136.898 Y131.838 E.25661
G1 X137.29 Y132.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1507
G1 X120.71 Y132.29 E.50946
G1 X120.71 Y123.71 E.26364
M73 P72 R4
G1 X137.29 Y123.71 E.50946
G1 X137.29 Y132.23 E.2618
M204 S10000
; WIPE_START
G1 F24000
G1 X135.29 Y132.237 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11 I.404 J-1.148 P1  F30000
G1 X131.593 Y130.936 Z11
G1 Z10.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1507
G1 X131.45 Y130.936 E.00474
G1 X131.45 Y129.45 E.04928
G1 X133.55 Y131.55 E.09848
G1 X134.126 Y131.55 E.01913
G1 X136.55 Y129.126 E.11369
G1 X136.55 Y126.874 E.07472
G1 X134.126 Y124.45 E.11369
G1 X133.55 Y124.45 E.01913
G1 X131.45 Y126.55 E.09848
G1 X131.45 Y125.064 E.04928
G1 X131.593 Y125.064 E.00474
G1 X131.306 Y124.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1507
G1 X123.694 Y124.5 E.24112
G1 X123.55 Y125.146 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1507
G1 X123.55 Y126.774 E.05401
G1 X121.45 Y128.874 E.09848
G1 X121.45 Y127.126 E.05796
G1 X123.55 Y129.226 E.09848
G1 X123.55 Y130.854 E.05401
G1 X123.694 Y131.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1507
G1 X131.306 Y131.5 E.24112
; CHANGE_LAYER
; Z_HEIGHT: 10.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.306 Y131.5 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 54/85
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
G3 Z11 I.263 J1.188 P1  F30000
G1 X131.102 Y131.102 Z11
G1 Z10.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1507
G1 X123.898 Y131.102 E.23898
G1 X123.898 Y124.898 E.2058
G1 X131.102 Y124.898 E.23898
G1 X131.102 Y131.042 E.20381
G1 X130.71 Y130.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1507
G1 X124.29 Y130.71 E.19727
G1 X124.29 Y125.29 E.16654
G1 X130.71 Y125.29 E.19727
G1 X130.71 Y130.65 E.1647
M204 S10000
; WIPE_START
G1 F24000
M73 P73 R4
G1 X128.71 Y130.669 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.2 I-.181 J1.203 P1  F30000
G1 X136.898 Y131.898 Z11.2
G1 Z10.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1507
G1 X121.102 Y131.898 E.52398
G1 X121.102 Y124.102 E.2586
G1 X136.898 Y124.102 E.52398
G1 X136.898 Y131.838 E.25661
G1 X137.29 Y132.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1507
G1 X120.71 Y132.29 E.50946
G1 X120.71 Y123.71 E.26364
G1 X137.29 Y123.71 E.50946
G1 X137.29 Y132.23 E.2618
M204 S10000
; WIPE_START
G1 F24000
G1 X135.29 Y132.237 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.2 I.404 J-1.148 P1  F30000
G1 X131.593 Y130.936 Z11.2
G1 Z10.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1507
G1 X131.45 Y130.936 E.00474
G1 X131.45 Y129.45 E.04928
G1 X133.55 Y131.55 E.09848
G1 X134.126 Y131.55 E.01913
G1 X136.55 Y129.126 E.11369
G1 X136.55 Y126.874 E.07472
G1 X134.126 Y124.45 E.11369
G1 X133.55 Y124.45 E.01913
G1 X131.45 Y126.55 E.09848
G1 X131.45 Y125.064 E.04928
G1 X131.593 Y125.064 E.00474
G1 X131.306 Y124.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1507
G1 X123.694 Y124.5 E.24112
G1 X123.55 Y125.146 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1507
G1 X123.55 Y126.774 E.05401
G1 X121.45 Y128.874 E.09848
G1 X121.45 Y127.126 E.05796
G1 X123.55 Y129.226 E.09848
G1 X123.55 Y130.854 E.05401
G1 X123.694 Y131.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1507
G1 X131.306 Y131.5 E.24112
; CHANGE_LAYER
; Z_HEIGHT: 11
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.306 Y131.5 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 55/85
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
G3 Z11.2 I.263 J1.188 P1  F30000
G1 X131.102 Y131.102 Z11.2
G1 Z11
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1507
G1 X123.898 Y131.102 E.23898
G1 X123.898 Y124.898 E.2058
G1 X131.102 Y124.898 E.23898
G1 X131.102 Y131.042 E.20381
G1 X130.71 Y130.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1507
G1 X124.29 Y130.71 E.19727
G1 X124.29 Y125.29 E.16654
G1 X130.71 Y125.29 E.19727
G1 X130.71 Y130.65 E.1647
M204 S10000
; WIPE_START
G1 F24000
G1 X128.71 Y130.669 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.4 I-.181 J1.203 P1  F30000
G1 X136.898 Y131.898 Z11.4
G1 Z11
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1507
G1 X121.102 Y131.898 E.52398
G1 X121.102 Y124.102 E.2586
G1 X136.898 Y124.102 E.52398
G1 X136.898 Y131.838 E.25661
G1 X137.29 Y132.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1507
G1 X120.71 Y132.29 E.50946
G1 X120.71 Y123.71 E.26364
G1 X137.29 Y123.71 E.50946
G1 X137.29 Y132.23 E.2618
M204 S10000
; WIPE_START
G1 F24000
G1 X135.29 Y132.237 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.4 I.404 J-1.148 P1  F30000
G1 X131.593 Y130.936 Z11.4
G1 Z11
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1507
G1 X131.45 Y130.936 E.00474
G1 X131.45 Y129.45 E.04928
G1 X133.55 Y131.55 E.09848
G1 X134.126 Y131.55 E.01913
G1 X136.55 Y129.126 E.11369
M73 P74 R4
G1 X136.55 Y126.874 E.07472
G1 X134.126 Y124.45 E.11369
G1 X133.55 Y124.45 E.01913
G1 X131.45 Y126.55 E.09848
G1 X131.45 Y125.064 E.04928
G1 X131.593 Y125.064 E.00474
G1 X131.306 Y124.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1507
G1 X123.694 Y124.5 E.24112
G1 X123.55 Y125.146 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1507
G1 X123.55 Y126.774 E.05401
G1 X121.45 Y128.874 E.09848
G1 X121.45 Y127.126 E.05796
G1 X123.55 Y129.226 E.09848
G1 X123.55 Y130.854 E.05401
G1 X123.694 Y131.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1507
G1 X131.306 Y131.5 E.24112
; CHANGE_LAYER
; Z_HEIGHT: 11.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.306 Y131.5 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 56/85
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
G3 Z11.4 I.263 J1.188 P1  F30000
G1 X131.102 Y131.102 Z11.4
G1 Z11.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1507
G1 X123.898 Y131.102 E.23898
G1 X123.898 Y124.898 E.2058
G1 X131.102 Y124.898 E.23898
G1 X131.102 Y131.042 E.20381
G1 X130.71 Y130.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1507
G1 X124.29 Y130.71 E.19727
G1 X124.29 Y125.29 E.16654
G1 X130.71 Y125.29 E.19727
G1 X130.71 Y130.65 E.1647
M204 S10000
; WIPE_START
G1 F24000
G1 X128.71 Y130.669 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.6 I-.181 J1.203 P1  F30000
G1 X136.898 Y131.898 Z11.6
G1 Z11.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1507
G1 X121.102 Y131.898 E.52398
G1 X121.102 Y124.102 E.2586
G1 X136.898 Y124.102 E.52398
G1 X136.898 Y131.838 E.25661
G1 X137.29 Y132.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1507
G1 X120.71 Y132.29 E.50946
G1 X120.71 Y123.71 E.26364
G1 X137.29 Y123.71 E.50946
G1 X137.29 Y132.23 E.2618
M204 S10000
; WIPE_START
G1 F24000
G1 X135.29 Y132.237 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.6 I.404 J-1.148 P1  F30000
G1 X131.593 Y130.936 Z11.6
G1 Z11.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1507
G1 X131.45 Y130.936 E.00474
G1 X131.45 Y129.45 E.04928
G1 X133.55 Y131.55 E.09848
G1 X134.126 Y131.55 E.01913
G1 X136.55 Y129.126 E.11369
G1 X136.55 Y126.874 E.07472
G1 X134.126 Y124.45 E.11369
G1 X133.55 Y124.45 E.01913
G1 X131.45 Y126.55 E.09848
G1 X131.45 Y125.064 E.04928
G1 X131.593 Y125.064 E.00474
G1 X131.306 Y124.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1507
G1 X123.694 Y124.5 E.24112
G1 X123.55 Y125.146 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1507
G1 X123.55 Y126.774 E.05401
G1 X121.45 Y128.874 E.09848
G1 X121.45 Y127.126 E.05796
G1 X123.55 Y129.226 E.09848
G1 X123.55 Y130.854 E.05401
G1 X123.694 Y131.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1507
G1 X131.306 Y131.5 E.24112
; CHANGE_LAYER
; Z_HEIGHT: 11.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.306 Y131.5 E-.76
; WIPE_END
M73 P75 R4
G1 E-.04 F1800
; layer num/total_layer_count: 57/85
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
G3 Z11.6 I.263 J1.188 P1  F30000
G1 X131.102 Y131.102 Z11.6
G1 Z11.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1507
G1 X123.898 Y131.102 E.23898
G1 X123.898 Y124.898 E.2058
G1 X131.102 Y124.898 E.23898
G1 X131.102 Y131.042 E.20381
G1 X130.71 Y130.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1507
G1 X124.29 Y130.71 E.19727
G1 X124.29 Y125.29 E.16654
G1 X130.71 Y125.29 E.19727
G1 X130.71 Y130.65 E.1647
M204 S10000
; WIPE_START
G1 F24000
G1 X128.71 Y130.669 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.8 I-.181 J1.203 P1  F30000
G1 X136.898 Y131.898 Z11.8
G1 Z11.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1507
G1 X121.102 Y131.898 E.52398
G1 X121.102 Y124.102 E.2586
G1 X136.898 Y124.102 E.52398
G1 X136.898 Y131.838 E.25661
G1 X137.29 Y132.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1507
G1 X120.71 Y132.29 E.50946
G1 X120.71 Y123.71 E.26364
G1 X137.29 Y123.71 E.50946
G1 X137.29 Y132.23 E.2618
M204 S10000
; WIPE_START
G1 F24000
G1 X135.29 Y132.237 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.8 I.404 J-1.148 P1  F30000
G1 X131.593 Y130.936 Z11.8
G1 Z11.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1507
G1 X131.45 Y130.936 E.00474
G1 X131.45 Y129.45 E.04928
G1 X133.55 Y131.55 E.09848
G1 X134.126 Y131.55 E.01913
G1 X136.55 Y129.126 E.11369
G1 X136.55 Y126.874 E.07472
G1 X134.126 Y124.45 E.11369
G1 X133.55 Y124.45 E.01913
G1 X131.45 Y126.55 E.09848
G1 X131.45 Y125.064 E.04928
G1 X131.593 Y125.064 E.00474
G1 X131.306 Y124.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1507
G1 X123.694 Y124.5 E.24112
G1 X123.55 Y125.146 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1507
G1 X123.55 Y126.774 E.05401
G1 X121.45 Y128.874 E.09848
G1 X121.45 Y127.126 E.05796
G1 X123.55 Y129.226 E.09848
G1 X123.55 Y130.854 E.05401
G1 X123.694 Y131.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1507
G1 X131.306 Y131.5 E.24112
; CHANGE_LAYER
; Z_HEIGHT: 11.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.306 Y131.5 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 58/85
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
G3 Z11.8 I.263 J1.188 P1  F30000
G1 X131.102 Y131.102 Z11.8
G1 Z11.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1507
G1 X123.898 Y131.102 E.23898
G1 X123.898 Y124.898 E.2058
G1 X131.102 Y124.898 E.23898
G1 X131.102 Y131.042 E.20381
G1 X130.71 Y130.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1507
G1 X124.29 Y130.71 E.19727
G1 X124.29 Y125.29 E.16654
G1 X130.71 Y125.29 E.19727
M73 P76 R4
G1 X130.71 Y130.65 E.1647
M204 S10000
; WIPE_START
G1 F24000
G1 X128.71 Y130.669 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12 I-.181 J1.203 P1  F30000
G1 X136.898 Y131.898 Z12
G1 Z11.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1507
G1 X121.102 Y131.898 E.52398
G1 X121.102 Y124.102 E.2586
G1 X136.898 Y124.102 E.52398
G1 X136.898 Y131.838 E.25661
G1 X137.29 Y132.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1507
G1 X120.71 Y132.29 E.50946
G1 X120.71 Y123.71 E.26364
G1 X137.29 Y123.71 E.50946
G1 X137.29 Y132.23 E.2618
M204 S10000
; WIPE_START
G1 F24000
G1 X135.29 Y132.237 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12 I.404 J-1.148 P1  F30000
G1 X131.593 Y130.936 Z12
G1 Z11.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1507
G1 X131.45 Y130.936 E.00474
G1 X131.45 Y129.45 E.04928
G1 X133.55 Y131.55 E.09848
G1 X134.126 Y131.55 E.01913
G1 X136.55 Y129.126 E.11369
G1 X136.55 Y126.874 E.07472
G1 X134.126 Y124.45 E.11369
G1 X133.55 Y124.45 E.01913
G1 X131.45 Y126.55 E.09848
G1 X131.45 Y125.064 E.04928
G1 X131.593 Y125.064 E.00474
G1 X131.306 Y124.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1507
G1 X123.694 Y124.5 E.24112
G1 X123.55 Y125.146 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1507
G1 X123.55 Y126.774 E.05401
G1 X121.45 Y128.874 E.09848
G1 X121.45 Y127.126 E.05796
G1 X123.55 Y129.226 E.09848
G1 X123.55 Y130.854 E.05401
G1 X123.694 Y131.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1507
G1 X131.306 Y131.5 E.24112
; CHANGE_LAYER
; Z_HEIGHT: 11.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.306 Y131.5 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 59/85
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
G3 Z12 I.263 J1.188 P1  F30000
G1 X131.102 Y131.102 Z12
G1 Z11.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1507
G1 X123.898 Y131.102 E.23898
G1 X123.898 Y124.898 E.2058
G1 X131.102 Y124.898 E.23898
G1 X131.102 Y131.042 E.20381
G1 X130.71 Y130.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1507
G1 X124.29 Y130.71 E.19727
G1 X124.29 Y125.29 E.16654
G1 X130.71 Y125.29 E.19727
G1 X130.71 Y130.65 E.1647
M204 S10000
; WIPE_START
G1 F24000
G1 X128.71 Y130.669 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.2 I-.181 J1.203 P1  F30000
G1 X136.898 Y131.898 Z12.2
G1 Z11.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1507
G1 X121.102 Y131.898 E.52398
G1 X121.102 Y124.102 E.2586
G1 X136.898 Y124.102 E.52398
G1 X136.898 Y131.838 E.25661
G1 X137.29 Y132.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1507
G1 X120.71 Y132.29 E.50946
M73 P77 R4
G1 X120.71 Y123.71 E.26364
G1 X137.29 Y123.71 E.50946
G1 X137.29 Y132.23 E.2618
M204 S10000
; WIPE_START
G1 F24000
G1 X135.29 Y132.237 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.2 I.404 J-1.148 P1  F30000
G1 X131.593 Y130.936 Z12.2
G1 Z11.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1507
G1 X131.45 Y130.936 E.00474
G1 X131.45 Y129.45 E.04928
G1 X133.55 Y131.55 E.09848
G1 X134.126 Y131.55 E.01913
G1 X136.55 Y129.126 E.11369
G1 X136.55 Y126.874 E.07472
G1 X134.126 Y124.45 E.11369
G1 X133.55 Y124.45 E.01913
G1 X131.45 Y126.55 E.09848
G1 X131.45 Y125.064 E.04928
G1 X131.593 Y125.064 E.00474
G1 X131.306 Y124.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1507
G1 X123.694 Y124.5 E.24112
G1 X123.55 Y125.146 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1507
G1 X123.55 Y126.774 E.05401
G1 X121.45 Y128.874 E.09848
G1 X121.45 Y127.126 E.05796
G1 X123.55 Y129.226 E.09848
G1 X123.55 Y130.854 E.05401
G1 X123.694 Y131.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1507
G1 X131.306 Y131.5 E.24112
; CHANGE_LAYER
; Z_HEIGHT: 12
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.306 Y131.5 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 60/85
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
G3 Z12.2 I.263 J1.188 P1  F30000
G1 X131.102 Y131.102 Z12.2
G1 Z12
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1507
G1 X123.898 Y131.102 E.23898
G1 X123.898 Y124.898 E.2058
G1 X131.102 Y124.898 E.23898
G1 X131.102 Y131.042 E.20381
G1 X130.71 Y130.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1507
G1 X124.29 Y130.71 E.19727
G1 X124.29 Y125.29 E.16654
G1 X130.71 Y125.29 E.19727
G1 X130.71 Y130.65 E.1647
M204 S10000
; WIPE_START
G1 F24000
G1 X128.71 Y130.669 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.4 I-.181 J1.203 P1  F30000
G1 X136.898 Y131.898 Z12.4
G1 Z12
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1507
G1 X121.102 Y131.898 E.52398
G1 X121.102 Y124.102 E.2586
G1 X136.898 Y124.102 E.52398
G1 X136.898 Y131.838 E.25661
G1 X137.29 Y132.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1507
G1 X120.71 Y132.29 E.50946
G1 X120.71 Y123.71 E.26364
G1 X137.29 Y123.71 E.50946
G1 X137.29 Y132.23 E.2618
M204 S10000
; WIPE_START
G1 F24000
G1 X135.29 Y132.237 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.4 I.404 J-1.148 P1  F30000
G1 X131.593 Y130.936 Z12.4
G1 Z12
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1507
G1 X131.45 Y130.936 E.00474
G1 X131.45 Y129.45 E.04928
G1 X133.55 Y131.55 E.09848
G1 X134.126 Y131.55 E.01913
M73 P77 R3
G1 X136.55 Y129.126 E.11369
G1 X136.55 Y126.874 E.07472
G1 X134.126 Y124.45 E.11369
G1 X133.55 Y124.45 E.01913
G1 X131.45 Y126.55 E.09848
G1 X131.45 Y125.064 E.04928
G1 X131.593 Y125.064 E.00474
G1 X131.306 Y124.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1507
G1 X123.694 Y124.5 E.24112
G1 X123.55 Y125.146 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1507
G1 X123.55 Y126.774 E.05401
G1 X121.45 Y128.874 E.09848
G1 X121.45 Y127.126 E.05796
M73 P78 R3
G1 X123.55 Y129.226 E.09848
G1 X123.55 Y130.854 E.05401
G1 X123.694 Y131.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1507
G1 X131.306 Y131.5 E.24112
; CHANGE_LAYER
; Z_HEIGHT: 12.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.306 Y131.5 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 61/85
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
G3 Z12.4 I.263 J1.188 P1  F30000
G1 X131.102 Y131.102 Z12.4
G1 Z12.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1507
G1 X123.898 Y131.102 E.23898
G1 X123.898 Y124.898 E.2058
G1 X131.102 Y124.898 E.23898
G1 X131.102 Y131.042 E.20381
G1 X130.71 Y130.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1507
G1 X124.29 Y130.71 E.19727
G1 X124.29 Y125.29 E.16654
G1 X130.71 Y125.29 E.19727
G1 X130.71 Y130.65 E.1647
M204 S10000
; WIPE_START
G1 F24000
G1 X128.71 Y130.669 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.6 I-.181 J1.203 P1  F30000
G1 X136.898 Y131.898 Z12.6
G1 Z12.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1507
G1 X121.102 Y131.898 E.52398
G1 X121.102 Y124.102 E.2586
G1 X136.898 Y124.102 E.52398
G1 X136.898 Y131.838 E.25661
G1 X137.29 Y132.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1507
G1 X120.71 Y132.29 E.50946
G1 X120.71 Y123.71 E.26364
G1 X137.29 Y123.71 E.50946
G1 X137.29 Y132.23 E.2618
M204 S10000
; WIPE_START
G1 F24000
G1 X135.29 Y132.237 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.6 I.404 J-1.148 P1  F30000
G1 X131.593 Y130.936 Z12.6
G1 Z12.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1507
G1 X131.45 Y130.936 E.00474
G1 X131.45 Y129.45 E.04928
G1 X133.55 Y131.55 E.09848
G1 X134.126 Y131.55 E.01913
G1 X136.55 Y129.126 E.11369
G1 X136.55 Y126.874 E.07472
G1 X134.126 Y124.45 E.11369
G1 X133.55 Y124.45 E.01913
G1 X131.45 Y126.55 E.09848
G1 X131.45 Y125.064 E.04928
G1 X131.593 Y125.064 E.00474
G1 X131.306 Y124.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1507
G1 X123.694 Y124.5 E.24112
G1 X123.55 Y125.146 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1507
G1 X123.55 Y126.774 E.05401
G1 X121.45 Y128.874 E.09848
G1 X121.45 Y127.126 E.05796
G1 X123.55 Y129.226 E.09848
G1 X123.55 Y130.854 E.05401
G1 X123.694 Y131.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1507
G1 X131.306 Y131.5 E.24112
; CHANGE_LAYER
; Z_HEIGHT: 12.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.306 Y131.5 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 62/85
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
G3 Z12.6 I.263 J1.188 P1  F30000
G1 X131.102 Y131.102 Z12.6
G1 Z12.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1507
G1 X123.898 Y131.102 E.23898
G1 X123.898 Y124.898 E.2058
G1 X131.102 Y124.898 E.23898
G1 X131.102 Y131.042 E.20381
M73 P79 R3
G1 X130.71 Y130.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1507
G1 X124.29 Y130.71 E.19727
G1 X124.29 Y125.29 E.16654
G1 X130.71 Y125.29 E.19727
G1 X130.71 Y130.65 E.1647
M204 S10000
; WIPE_START
G1 F24000
G1 X128.71 Y130.669 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.8 I-.181 J1.203 P1  F30000
G1 X136.898 Y131.898 Z12.8
G1 Z12.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1507
G1 X121.102 Y131.898 E.52398
G1 X121.102 Y124.102 E.2586
G1 X136.898 Y124.102 E.52398
G1 X136.898 Y131.838 E.25661
G1 X137.29 Y132.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1507
G1 X120.71 Y132.29 E.50946
G1 X120.71 Y123.71 E.26364
G1 X137.29 Y123.71 E.50946
G1 X137.29 Y132.23 E.2618
M204 S10000
; WIPE_START
G1 F24000
G1 X135.29 Y132.237 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.8 I.404 J-1.148 P1  F30000
G1 X131.593 Y130.936 Z12.8
G1 Z12.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1507
G1 X131.45 Y130.936 E.00474
G1 X131.45 Y129.45 E.04928
G1 X133.55 Y131.55 E.09848
G1 X134.126 Y131.55 E.01913
G1 X136.55 Y129.126 E.11369
G1 X136.55 Y126.874 E.07472
G1 X134.126 Y124.45 E.11369
G1 X133.55 Y124.45 E.01913
G1 X131.45 Y126.55 E.09848
G1 X131.45 Y125.064 E.04928
G1 X131.593 Y125.064 E.00474
G1 X131.306 Y124.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1507
G1 X123.694 Y124.5 E.24112
G1 X123.55 Y125.146 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1507
G1 X123.55 Y126.774 E.05401
G1 X121.45 Y128.874 E.09848
G1 X121.45 Y127.126 E.05796
G1 X123.55 Y129.226 E.09848
G1 X123.55 Y130.854 E.05401
G1 X123.694 Y131.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1507
G1 X131.306 Y131.5 E.24112
; CHANGE_LAYER
; Z_HEIGHT: 12.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.306 Y131.5 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 63/85
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
G3 Z12.8 I.263 J1.188 P1  F30000
G1 X131.102 Y131.102 Z12.8
G1 Z12.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1507
G1 X123.898 Y131.102 E.23898
G1 X123.898 Y124.898 E.2058
G1 X131.102 Y124.898 E.23898
G1 X131.102 Y131.042 E.20381
G1 X130.71 Y130.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1507
G1 X124.29 Y130.71 E.19727
G1 X124.29 Y125.29 E.16654
G1 X130.71 Y125.29 E.19727
G1 X130.71 Y130.65 E.1647
M204 S10000
; WIPE_START
G1 F24000
M73 P80 R3
G1 X128.71 Y130.669 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13 I-.181 J1.203 P1  F30000
G1 X136.898 Y131.898 Z13
G1 Z12.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1507
G1 X121.102 Y131.898 E.52398
G1 X121.102 Y124.102 E.2586
G1 X136.898 Y124.102 E.52398
G1 X136.898 Y131.838 E.25661
G1 X137.29 Y132.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1507
G1 X120.71 Y132.29 E.50946
G1 X120.71 Y123.71 E.26364
G1 X137.29 Y123.71 E.50946
G1 X137.29 Y132.23 E.2618
M204 S10000
; WIPE_START
G1 F24000
G1 X135.29 Y132.237 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13 I.404 J-1.148 P1  F30000
G1 X131.593 Y130.936 Z13
G1 Z12.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1507
G1 X131.45 Y130.936 E.00474
G1 X131.45 Y129.45 E.04928
G1 X133.55 Y131.55 E.09848
G1 X134.126 Y131.55 E.01913
G1 X136.55 Y129.126 E.11369
G1 X136.55 Y126.874 E.07472
G1 X134.126 Y124.45 E.11369
G1 X133.55 Y124.45 E.01913
G1 X131.45 Y126.55 E.09848
G1 X131.45 Y125.064 E.04928
G1 X131.593 Y125.064 E.00474
G1 X131.306 Y124.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1507
G1 X123.694 Y124.5 E.24112
G1 X123.55 Y125.146 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1507
G1 X123.55 Y126.774 E.05401
G1 X121.45 Y128.874 E.09848
G1 X121.45 Y127.126 E.05796
G1 X123.55 Y129.226 E.09848
G1 X123.55 Y130.854 E.05401
G1 X123.694 Y131.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1507
G1 X131.306 Y131.5 E.24112
; CHANGE_LAYER
; Z_HEIGHT: 12.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.306 Y131.5 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 64/85
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
G3 Z13 I.263 J1.188 P1  F30000
G1 X131.102 Y131.102 Z13
G1 Z12.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1507
G1 X123.898 Y131.102 E.23898
G1 X123.898 Y124.898 E.2058
G1 X131.102 Y124.898 E.23898
G1 X131.102 Y131.042 E.20381
G1 X130.71 Y130.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1507
G1 X124.29 Y130.71 E.19727
G1 X124.29 Y125.29 E.16654
G1 X130.71 Y125.29 E.19727
G1 X130.71 Y130.65 E.1647
M204 S10000
; WIPE_START
G1 F24000
G1 X128.71 Y130.669 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.2 I-.181 J1.203 P1  F30000
G1 X136.898 Y131.898 Z13.2
G1 Z12.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1507
G1 X121.102 Y131.898 E.52398
G1 X121.102 Y124.102 E.2586
G1 X136.898 Y124.102 E.52398
G1 X136.898 Y131.838 E.25661
G1 X137.29 Y132.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1507
G1 X120.71 Y132.29 E.50946
G1 X120.71 Y123.71 E.26364
G1 X137.29 Y123.71 E.50946
G1 X137.29 Y132.23 E.2618
M204 S10000
; WIPE_START
G1 F24000
G1 X135.29 Y132.237 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.2 I.404 J-1.148 P1  F30000
G1 X131.593 Y130.936 Z13.2
G1 Z12.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1507
G1 X131.45 Y130.936 E.00474
G1 X131.45 Y129.45 E.04928
G1 X133.55 Y131.55 E.09848
G1 X134.126 Y131.55 E.01913
G1 X136.55 Y129.126 E.11369
M73 P81 R3
G1 X136.55 Y126.874 E.07472
G1 X134.126 Y124.45 E.11369
G1 X133.55 Y124.45 E.01913
G1 X131.45 Y126.55 E.09848
G1 X131.45 Y125.064 E.04928
G1 X131.593 Y125.064 E.00474
G1 X131.306 Y124.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1507
G1 X123.694 Y124.5 E.24112
G1 X123.55 Y125.146 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1507
G1 X123.55 Y126.774 E.05401
G1 X121.45 Y128.874 E.09848
G1 X121.45 Y127.126 E.05796
G1 X123.55 Y129.226 E.09848
G1 X123.55 Y130.854 E.05401
G1 X123.694 Y131.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1507
G1 X131.306 Y131.5 E.24112
; CHANGE_LAYER
; Z_HEIGHT: 13
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.306 Y131.5 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 65/85
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
G3 Z13.2 I.263 J1.188 P1  F30000
G1 X131.102 Y131.102 Z13.2
G1 Z13
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1507
G1 X123.898 Y131.102 E.23898
G1 X123.898 Y124.898 E.2058
G1 X131.102 Y124.898 E.23898
G1 X131.102 Y131.042 E.20381
G1 X130.71 Y130.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1507
G1 X124.29 Y130.71 E.19727
G1 X124.29 Y125.29 E.16654
G1 X130.71 Y125.29 E.19727
G1 X130.71 Y130.65 E.1647
M204 S10000
; WIPE_START
G1 F24000
G1 X128.71 Y130.669 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.4 I-.181 J1.203 P1  F30000
G1 X136.898 Y131.898 Z13.4
G1 Z13
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1507
G1 X121.102 Y131.898 E.52398
G1 X121.102 Y124.102 E.2586
G1 X136.898 Y124.102 E.52398
G1 X136.898 Y131.838 E.25661
G1 X137.29 Y132.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1507
G1 X120.71 Y132.29 E.50946
G1 X120.71 Y123.71 E.26364
G1 X137.29 Y123.71 E.50946
G1 X137.29 Y132.23 E.2618
M204 S10000
; WIPE_START
G1 F24000
G1 X135.29 Y132.237 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.4 I.404 J-1.148 P1  F30000
G1 X131.593 Y130.936 Z13.4
G1 Z13
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1507
G1 X131.45 Y130.936 E.00474
G1 X131.45 Y129.45 E.04928
G1 X133.55 Y131.55 E.09848
G1 X134.126 Y131.55 E.01913
G1 X136.55 Y129.126 E.11369
G1 X136.55 Y126.874 E.07472
G1 X134.126 Y124.45 E.11369
G1 X133.55 Y124.45 E.01913
G1 X131.45 Y126.55 E.09848
G1 X131.45 Y125.064 E.04928
G1 X131.593 Y125.064 E.00474
G1 X131.306 Y124.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1507
G1 X123.694 Y124.5 E.24112
G1 X123.55 Y125.146 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1507
G1 X123.55 Y126.774 E.05401
G1 X121.45 Y128.874 E.09848
G1 X121.45 Y127.126 E.05796
G1 X123.55 Y129.226 E.09848
G1 X123.55 Y130.854 E.05401
G1 X123.694 Y131.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1507
G1 X131.306 Y131.5 E.24112
; CHANGE_LAYER
; Z_HEIGHT: 13.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.306 Y131.5 E-.76
; WIPE_END
M73 P82 R3
G1 E-.04 F1800
; layer num/total_layer_count: 66/85
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
G3 Z13.4 I.263 J1.188 P1  F30000
G1 X131.102 Y131.102 Z13.4
G1 Z13.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1507
G1 X123.898 Y131.102 E.23898
G1 X123.898 Y124.898 E.2058
G1 X131.102 Y124.898 E.23898
G1 X131.102 Y131.042 E.20381
G1 X130.71 Y130.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1507
G1 X124.29 Y130.71 E.19727
G1 X124.29 Y125.29 E.16654
G1 X130.71 Y125.29 E.19727
G1 X130.71 Y130.65 E.1647
M204 S10000
; WIPE_START
G1 F24000
G1 X128.71 Y130.669 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.6 I-.181 J1.203 P1  F30000
G1 X136.898 Y131.898 Z13.6
G1 Z13.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1507
G1 X121.102 Y131.898 E.52398
G1 X121.102 Y124.102 E.2586
G1 X136.898 Y124.102 E.52398
G1 X136.898 Y131.838 E.25661
G1 X137.29 Y132.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1507
G1 X120.71 Y132.29 E.50946
G1 X120.71 Y123.71 E.26364
G1 X137.29 Y123.71 E.50946
G1 X137.29 Y132.23 E.2618
M204 S10000
; WIPE_START
G1 F24000
G1 X135.29 Y132.237 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.6 I.404 J-1.148 P1  F30000
G1 X131.593 Y130.936 Z13.6
G1 Z13.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1507
G1 X131.45 Y130.936 E.00474
G1 X131.45 Y129.45 E.04928
G1 X133.55 Y131.55 E.09848
G1 X134.126 Y131.55 E.01913
G1 X136.55 Y129.126 E.11369
G1 X136.55 Y126.874 E.07472
G1 X134.126 Y124.45 E.11369
G1 X133.55 Y124.45 E.01913
G1 X131.45 Y126.55 E.09848
G1 X131.45 Y125.064 E.04928
G1 X131.593 Y125.064 E.00474
G1 X131.306 Y124.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1507
G1 X123.694 Y124.5 E.24112
G1 X123.55 Y125.146 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1507
G1 X123.55 Y126.774 E.05401
G1 X121.45 Y128.874 E.09848
G1 X121.45 Y127.126 E.05796
G1 X123.55 Y129.226 E.09848
G1 X123.55 Y130.854 E.05401
G1 X123.694 Y131.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1507
G1 X131.306 Y131.5 E.24112
; CHANGE_LAYER
; Z_HEIGHT: 13.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.306 Y131.5 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 67/85
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
G3 Z13.6 I.263 J1.188 P1  F30000
G1 X131.102 Y131.102 Z13.6
G1 Z13.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1507
G1 X123.898 Y131.102 E.23898
G1 X123.898 Y124.898 E.2058
G1 X131.102 Y124.898 E.23898
G1 X131.102 Y131.042 E.20381
G1 X130.71 Y130.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1507
G1 X124.29 Y130.71 E.19727
G1 X124.29 Y125.29 E.16654
G1 X130.71 Y125.29 E.19727
M73 P83 R3
G1 X130.71 Y130.65 E.1647
M204 S10000
; WIPE_START
G1 F24000
G1 X128.71 Y130.669 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.8 I-.181 J1.203 P1  F30000
G1 X136.898 Y131.898 Z13.8
G1 Z13.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1507
G1 X121.102 Y131.898 E.52398
G1 X121.102 Y124.102 E.2586
G1 X136.898 Y124.102 E.52398
G1 X136.898 Y131.838 E.25661
G1 X137.29 Y132.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1507
G1 X120.71 Y132.29 E.50946
G1 X120.71 Y123.71 E.26364
G1 X137.29 Y123.71 E.50946
G1 X137.29 Y132.23 E.2618
M204 S10000
; WIPE_START
G1 F24000
G1 X135.29 Y132.237 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.8 I.404 J-1.148 P1  F30000
G1 X131.593 Y130.936 Z13.8
G1 Z13.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1507
G1 X131.45 Y130.936 E.00474
G1 X131.45 Y129.45 E.04928
G1 X133.55 Y131.55 E.09848
G1 X134.126 Y131.55 E.01913
G1 X136.55 Y129.126 E.11369
G1 X136.55 Y126.874 E.07472
G1 X134.126 Y124.45 E.11369
G1 X133.55 Y124.45 E.01913
G1 X131.45 Y126.55 E.09848
G1 X131.45 Y125.064 E.04928
G1 X131.593 Y125.064 E.00474
G1 X131.306 Y124.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1507
G1 X123.694 Y124.5 E.24112
G1 X123.55 Y125.146 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1507
G1 X123.55 Y126.774 E.05401
G1 X121.45 Y128.874 E.09848
M73 P83 R2
G1 X121.45 Y127.126 E.05796
G1 X123.55 Y129.226 E.09848
G1 X123.55 Y130.854 E.05401
G1 X123.694 Y131.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1507
G1 X131.306 Y131.5 E.24112
; CHANGE_LAYER
; Z_HEIGHT: 13.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.306 Y131.5 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 68/85
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
G3 Z13.8 I.263 J1.188 P1  F30000
G1 X131.102 Y131.102 Z13.8
G1 Z13.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1507
G1 X123.898 Y131.102 E.23898
G1 X123.898 Y124.898 E.2058
G1 X131.102 Y124.898 E.23898
G1 X131.102 Y131.042 E.20381
G1 X130.71 Y130.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1507
G1 X124.29 Y130.71 E.19727
G1 X124.29 Y125.29 E.16654
G1 X130.71 Y125.29 E.19727
G1 X130.71 Y130.65 E.1647
M204 S10000
; WIPE_START
G1 F24000
G1 X128.71 Y130.669 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14 I-.181 J1.203 P1  F30000
G1 X136.898 Y131.898 Z14
G1 Z13.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1507
G1 X121.102 Y131.898 E.52398
G1 X121.102 Y124.102 E.2586
G1 X136.898 Y124.102 E.52398
G1 X136.898 Y131.838 E.25661
G1 X137.29 Y132.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1507
G1 X120.71 Y132.29 E.50946
G1 X120.71 Y123.71 E.26364
M73 P84 R2
G1 X137.29 Y123.71 E.50946
G1 X137.29 Y132.23 E.2618
M204 S10000
; WIPE_START
G1 F24000
G1 X135.29 Y132.237 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14 I.404 J-1.148 P1  F30000
G1 X131.593 Y130.936 Z14
G1 Z13.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1507
G1 X131.45 Y130.936 E.00474
G1 X131.45 Y129.45 E.04928
G1 X133.55 Y131.55 E.09848
G1 X134.126 Y131.55 E.01913
G1 X136.55 Y129.126 E.11369
G1 X136.55 Y126.874 E.07472
G1 X134.126 Y124.45 E.11369
G1 X133.55 Y124.45 E.01913
G1 X131.45 Y126.55 E.09848
G1 X131.45 Y125.064 E.04928
G1 X131.593 Y125.064 E.00474
G1 X131.306 Y124.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1507
G1 X123.694 Y124.5 E.24112
G1 X123.55 Y125.146 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1507
G1 X123.55 Y126.774 E.05401
G1 X121.45 Y128.874 E.09848
G1 X121.45 Y127.126 E.05796
G1 X123.55 Y129.226 E.09848
G1 X123.55 Y130.854 E.05401
G1 X123.694 Y131.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1507
G1 X131.306 Y131.5 E.24112
; CHANGE_LAYER
; Z_HEIGHT: 13.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.306 Y131.5 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 69/85
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
G3 Z14 I.263 J1.188 P1  F30000
G1 X131.102 Y131.102 Z14
G1 Z13.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1507
G1 X123.898 Y131.102 E.23898
G1 X123.898 Y124.898 E.2058
G1 X131.102 Y124.898 E.23898
G1 X131.102 Y131.042 E.20381
G1 X130.71 Y130.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1507
G1 X124.29 Y130.71 E.19727
G1 X124.29 Y125.29 E.16654
G1 X130.71 Y125.29 E.19727
G1 X130.71 Y130.65 E.1647
M204 S10000
; WIPE_START
G1 F24000
G1 X128.71 Y130.669 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.2 I-.181 J1.203 P1  F30000
G1 X136.898 Y131.898 Z14.2
G1 Z13.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1507
G1 X121.102 Y131.898 E.52398
G1 X121.102 Y124.102 E.2586
G1 X136.898 Y124.102 E.52398
G1 X136.898 Y131.838 E.25661
G1 X137.29 Y132.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1507
G1 X120.71 Y132.29 E.50946
G1 X120.71 Y123.71 E.26364
G1 X137.29 Y123.71 E.50946
G1 X137.29 Y132.23 E.2618
M204 S10000
; WIPE_START
G1 F24000
G1 X135.29 Y132.237 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.2 I.404 J-1.148 P1  F30000
G1 X131.593 Y130.936 Z14.2
G1 Z13.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1507
G1 X131.45 Y130.936 E.00474
G1 X131.45 Y129.45 E.04928
G1 X133.55 Y131.55 E.09848
G1 X134.126 Y131.55 E.01913
G1 X136.55 Y129.126 E.11369
G1 X136.55 Y126.874 E.07472
G1 X134.126 Y124.45 E.11369
G1 X133.55 Y124.45 E.01913
G1 X131.45 Y126.55 E.09848
G1 X131.45 Y125.064 E.04928
G1 X131.593 Y125.064 E.00474
G1 X131.306 Y124.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1507
G1 X123.694 Y124.5 E.24112
G1 X123.55 Y125.146 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1507
G1 X123.55 Y126.774 E.05401
G1 X121.45 Y128.874 E.09848
G1 X121.45 Y127.126 E.05796
M73 P85 R2
G1 X123.55 Y129.226 E.09848
G1 X123.55 Y130.854 E.05401
G1 X123.694 Y131.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1507
G1 X131.306 Y131.5 E.24112
; CHANGE_LAYER
; Z_HEIGHT: 14
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.306 Y131.5 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 70/85
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
G3 Z14.2 I.263 J1.188 P1  F30000
G1 X131.102 Y131.102 Z14.2
G1 Z14
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1507
G1 X123.898 Y131.102 E.23898
G1 X123.898 Y124.898 E.2058
G1 X131.102 Y124.898 E.23898
G1 X131.102 Y131.042 E.20381
G1 X130.71 Y130.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1507
G1 X124.29 Y130.71 E.19727
G1 X124.29 Y125.29 E.16654
G1 X130.71 Y125.29 E.19727
G1 X130.71 Y130.65 E.1647
M204 S10000
; WIPE_START
G1 F24000
G1 X128.71 Y130.669 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.4 I-.181 J1.203 P1  F30000
G1 X136.898 Y131.898 Z14.4
G1 Z14
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1507
G1 X121.102 Y131.898 E.52398
G1 X121.102 Y124.102 E.2586
G1 X136.898 Y124.102 E.52398
G1 X136.898 Y131.838 E.25661
G1 X137.29 Y132.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1507
G1 X120.71 Y132.29 E.50946
G1 X120.71 Y123.71 E.26364
G1 X137.29 Y123.71 E.50946
G1 X137.29 Y132.23 E.2618
M204 S10000
; WIPE_START
G1 F24000
G1 X135.29 Y132.237 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.4 I.404 J-1.148 P1  F30000
G1 X131.593 Y130.936 Z14.4
G1 Z14
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1507
G1 X131.45 Y130.936 E.00474
G1 X131.45 Y129.45 E.04928
G1 X133.55 Y131.55 E.09848
G1 X134.126 Y131.55 E.01913
G1 X136.55 Y129.126 E.11369
G1 X136.55 Y126.874 E.07472
G1 X134.126 Y124.45 E.11369
G1 X133.55 Y124.45 E.01913
G1 X131.45 Y126.55 E.09848
G1 X131.45 Y125.064 E.04928
G1 X131.593 Y125.064 E.00474
G1 X131.306 Y124.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1507
G1 X123.694 Y124.5 E.24112
G1 X123.55 Y125.146 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1507
G1 X123.55 Y126.774 E.05401
G1 X121.45 Y128.874 E.09848
G1 X121.45 Y127.126 E.05796
G1 X123.55 Y129.226 E.09848
G1 X123.55 Y130.854 E.05401
G1 X123.694 Y131.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1507
G1 X131.306 Y131.5 E.24112
; CHANGE_LAYER
; Z_HEIGHT: 14.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.306 Y131.5 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 71/85
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
G3 Z14.4 I.263 J1.188 P1  F30000
G1 X131.102 Y131.102 Z14.4
G1 Z14.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1507
G1 X123.898 Y131.102 E.23898
G1 X123.898 Y124.898 E.2058
G1 X131.102 Y124.898 E.23898
G1 X131.102 Y131.042 E.20381
M73 P86 R2
G1 X130.71 Y130.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1507
G1 X124.29 Y130.71 E.19727
G1 X124.29 Y125.29 E.16654
G1 X130.71 Y125.29 E.19727
G1 X130.71 Y130.65 E.1647
M204 S10000
; WIPE_START
G1 F24000
G1 X128.71 Y130.669 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.6 I-.181 J1.203 P1  F30000
G1 X136.898 Y131.898 Z14.6
G1 Z14.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1507
G1 X121.102 Y131.898 E.52398
G1 X121.102 Y124.102 E.2586
G1 X136.898 Y124.102 E.52398
G1 X136.898 Y131.838 E.25661
G1 X137.29 Y132.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1507
G1 X120.71 Y132.29 E.50946
G1 X120.71 Y123.71 E.26364
G1 X137.29 Y123.71 E.50946
G1 X137.29 Y132.23 E.2618
M204 S10000
; WIPE_START
G1 F24000
G1 X135.29 Y132.237 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.6 I.404 J-1.148 P1  F30000
G1 X131.593 Y130.936 Z14.6
G1 Z14.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1507
G1 X131.45 Y130.936 E.00474
G1 X131.45 Y129.45 E.04928
G1 X133.55 Y131.55 E.09848
G1 X134.126 Y131.55 E.01913
G1 X136.55 Y129.126 E.11369
G1 X136.55 Y126.874 E.07472
G1 X134.126 Y124.45 E.11369
G1 X133.55 Y124.45 E.01913
G1 X131.45 Y126.55 E.09848
G1 X131.45 Y125.064 E.04928
G1 X131.593 Y125.064 E.00474
G1 X131.306 Y124.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1507
G1 X123.694 Y124.5 E.24112
G1 X123.55 Y125.146 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1507
G1 X123.55 Y126.774 E.05401
G1 X121.45 Y128.874 E.09848
G1 X121.45 Y127.126 E.05796
G1 X123.55 Y129.226 E.09848
G1 X123.55 Y130.854 E.05401
G1 X123.694 Y131.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1507
G1 X131.306 Y131.5 E.24112
; CHANGE_LAYER
; Z_HEIGHT: 14.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.306 Y131.5 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 72/85
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
G3 Z14.6 I.263 J1.188 P1  F30000
G1 X131.102 Y131.102 Z14.6
G1 Z14.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1507
G1 X123.898 Y131.102 E.23898
G1 X123.898 Y124.898 E.2058
G1 X131.102 Y124.898 E.23898
G1 X131.102 Y131.042 E.20381
G1 X130.71 Y130.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1507
G1 X124.29 Y130.71 E.19727
G1 X124.29 Y125.29 E.16654
G1 X130.71 Y125.29 E.19727
G1 X130.71 Y130.65 E.1647
M204 S10000
; WIPE_START
G1 F24000
M73 P87 R2
G1 X128.71 Y130.669 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.8 I-.181 J1.203 P1  F30000
G1 X136.898 Y131.898 Z14.8
G1 Z14.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1507
G1 X121.102 Y131.898 E.52398
G1 X121.102 Y124.102 E.2586
G1 X136.898 Y124.102 E.52398
G1 X136.898 Y131.838 E.25661
G1 X137.29 Y132.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1507
G1 X120.71 Y132.29 E.50946
G1 X120.71 Y123.71 E.26364
G1 X137.29 Y123.71 E.50946
G1 X137.29 Y132.23 E.2618
M204 S10000
; WIPE_START
G1 F24000
G1 X135.29 Y132.237 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.8 I.404 J-1.148 P1  F30000
G1 X131.593 Y130.936 Z14.8
G1 Z14.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1507
G1 X131.45 Y130.936 E.00474
G1 X131.45 Y129.45 E.04928
G1 X133.55 Y131.55 E.09848
G1 X134.126 Y131.55 E.01913
G1 X136.55 Y129.126 E.11369
G1 X136.55 Y126.874 E.07472
G1 X134.126 Y124.45 E.11369
G1 X133.55 Y124.45 E.01913
G1 X131.45 Y126.55 E.09848
G1 X131.45 Y125.064 E.04928
G1 X131.593 Y125.064 E.00474
G1 X131.306 Y124.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1507
G1 X123.694 Y124.5 E.24112
G1 X123.55 Y125.146 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1507
G1 X123.55 Y126.774 E.05401
G1 X121.45 Y128.874 E.09848
G1 X121.45 Y127.126 E.05796
G1 X123.55 Y129.226 E.09848
G1 X123.55 Y130.854 E.05401
G1 X123.694 Y131.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1507
G1 X131.306 Y131.5 E.24112
; CHANGE_LAYER
; Z_HEIGHT: 14.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.306 Y131.5 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 73/85
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
G3 Z14.8 I.263 J1.188 P1  F30000
G1 X131.102 Y131.102 Z14.8
G1 Z14.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1507
G1 X123.898 Y131.102 E.23898
G1 X123.898 Y124.898 E.2058
G1 X131.102 Y124.898 E.23898
G1 X131.102 Y131.042 E.20381
G1 X130.71 Y130.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1507
G1 X124.29 Y130.71 E.19727
G1 X124.29 Y125.29 E.16654
G1 X130.71 Y125.29 E.19727
G1 X130.71 Y130.65 E.1647
M204 S10000
; WIPE_START
G1 F24000
G1 X128.71 Y130.669 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15 I-.181 J1.203 P1  F30000
G1 X136.898 Y131.898 Z15
G1 Z14.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1507
G1 X121.102 Y131.898 E.52398
G1 X121.102 Y124.102 E.2586
G1 X136.898 Y124.102 E.52398
G1 X136.898 Y131.838 E.25661
G1 X137.29 Y132.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1507
G1 X120.71 Y132.29 E.50946
G1 X120.71 Y123.71 E.26364
G1 X137.29 Y123.71 E.50946
G1 X137.29 Y132.23 E.2618
M204 S10000
; WIPE_START
G1 F24000
G1 X135.29 Y132.237 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15 I.404 J-1.148 P1  F30000
G1 X131.593 Y130.936 Z15
G1 Z14.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1507
G1 X131.45 Y130.936 E.00474
G1 X131.45 Y129.45 E.04928
G1 X133.55 Y131.55 E.09848
G1 X134.126 Y131.55 E.01913
G1 X136.55 Y129.126 E.11369
G1 X136.55 Y126.874 E.07472
M73 P88 R2
G1 X134.126 Y124.45 E.11369
G1 X133.55 Y124.45 E.01913
G1 X131.45 Y126.55 E.09848
G1 X131.45 Y125.064 E.04928
G1 X131.593 Y125.064 E.00474
G1 X131.306 Y124.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1507
G1 X123.694 Y124.5 E.24112
G1 X123.55 Y125.146 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1507
G1 X123.55 Y126.774 E.05401
G1 X121.45 Y128.874 E.09848
G1 X121.45 Y127.126 E.05796
G1 X123.55 Y129.226 E.09848
G1 X123.55 Y130.854 E.05401
G1 X123.694 Y131.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1507
G1 X131.306 Y131.5 E.24112
; CHANGE_LAYER
; Z_HEIGHT: 14.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.306 Y131.5 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 74/85
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
G3 Z15 I.263 J1.188 P1  F30000
G1 X131.102 Y131.102 Z15
G1 Z14.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1507
G1 X123.898 Y131.102 E.23898
G1 X123.898 Y124.898 E.2058
G1 X131.102 Y124.898 E.23898
G1 X131.102 Y131.042 E.20381
G1 X130.71 Y130.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1507
G1 X124.29 Y130.71 E.19727
G1 X124.29 Y125.29 E.16654
G1 X130.71 Y125.29 E.19727
G1 X130.71 Y130.65 E.1647
M204 S10000
; WIPE_START
G1 F24000
G1 X128.71 Y130.669 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.2 I-.181 J1.203 P1  F30000
G1 X136.898 Y131.898 Z15.2
G1 Z14.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1507
G1 X121.102 Y131.898 E.52398
G1 X121.102 Y124.102 E.2586
G1 X136.898 Y124.102 E.52398
G1 X136.898 Y131.838 E.25661
G1 X137.29 Y132.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1507
G1 X120.71 Y132.29 E.50946
G1 X120.71 Y123.71 E.26364
G1 X137.29 Y123.71 E.50946
G1 X137.29 Y132.23 E.2618
M204 S10000
; WIPE_START
G1 F24000
G1 X135.29 Y132.237 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.2 I.404 J-1.148 P1  F30000
G1 X131.593 Y130.936 Z15.2
G1 Z14.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1507
G1 X131.45 Y130.936 E.00474
G1 X131.45 Y129.45 E.04928
G1 X133.55 Y131.55 E.09848
G1 X134.126 Y131.55 E.01913
G1 X136.55 Y129.126 E.11369
G1 X136.55 Y126.874 E.07472
G1 X134.126 Y124.45 E.11369
G1 X133.55 Y124.45 E.01913
G1 X131.45 Y126.55 E.09848
G1 X131.45 Y125.064 E.04928
G1 X131.593 Y125.064 E.00474
G1 X131.306 Y124.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1507
G1 X123.694 Y124.5 E.24112
G1 X123.55 Y125.146 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1507
G1 X123.55 Y126.774 E.05401
G1 X121.45 Y128.874 E.09848
G1 X121.45 Y127.126 E.05796
G1 X123.55 Y129.226 E.09848
G1 X123.55 Y130.854 E.05401
G1 X123.694 Y131.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1507
G1 X131.306 Y131.5 E.24112
; CHANGE_LAYER
; Z_HEIGHT: 15
; LAYER_HEIGHT: 0.2
; WIPE_START
M73 P88 R1
G1 F24000
G1 X129.306 Y131.5 E-.76
; WIPE_END
M73 P89 R1
G1 E-.04 F1800
; layer num/total_layer_count: 75/85
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
G3 Z15.2 I.263 J1.188 P1  F30000
G1 X131.102 Y131.102 Z15.2
G1 Z15
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1507
G1 X123.898 Y131.102 E.23898
G1 X123.898 Y124.898 E.2058
G1 X131.102 Y124.898 E.23898
G1 X131.102 Y131.042 E.20381
G1 X130.71 Y130.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1507
G1 X124.29 Y130.71 E.19727
G1 X124.29 Y125.29 E.16654
G1 X130.71 Y125.29 E.19727
G1 X130.71 Y130.65 E.1647
M204 S10000
; WIPE_START
G1 F24000
G1 X128.71 Y130.669 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.4 I-.181 J1.203 P1  F30000
G1 X136.898 Y131.898 Z15.4
G1 Z15
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1507
G1 X121.102 Y131.898 E.52398
G1 X121.102 Y124.102 E.2586
G1 X136.898 Y124.102 E.52398
G1 X136.898 Y131.838 E.25661
G1 X137.29 Y132.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1507
G1 X120.71 Y132.29 E.50946
G1 X120.71 Y123.71 E.26364
G1 X137.29 Y123.71 E.50946
G1 X137.29 Y132.23 E.2618
M204 S10000
; WIPE_START
G1 F24000
G1 X135.29 Y132.237 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.4 I.404 J-1.148 P1  F30000
G1 X131.593 Y130.936 Z15.4
G1 Z15
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1507
G1 X131.45 Y130.936 E.00474
G1 X131.45 Y129.45 E.04928
G1 X133.55 Y131.55 E.09848
G1 X134.126 Y131.55 E.01913
G1 X136.55 Y129.126 E.11369
G1 X136.55 Y126.874 E.07472
G1 X134.126 Y124.45 E.11369
G1 X133.55 Y124.45 E.01913
G1 X131.45 Y126.55 E.09848
G1 X131.45 Y125.064 E.04928
G1 X131.593 Y125.064 E.00474
G1 X131.306 Y124.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1507
G1 X123.694 Y124.5 E.24112
G1 X123.55 Y125.146 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1507
G1 X123.55 Y126.774 E.05401
G1 X121.45 Y128.874 E.09848
G1 X121.45 Y127.126 E.05796
G1 X123.55 Y129.226 E.09848
G1 X123.55 Y130.854 E.05401
G1 X123.694 Y131.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1507
G1 X131.306 Y131.5 E.24112
; CHANGE_LAYER
; Z_HEIGHT: 15.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.306 Y131.5 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 76/85
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
G3 Z15.4 I.263 J1.188 P1  F30000
G1 X131.102 Y131.102 Z15.4
G1 Z15.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1507
G1 X123.898 Y131.102 E.23898
G1 X123.898 Y124.898 E.2058
G1 X131.102 Y124.898 E.23898
G1 X131.102 Y131.042 E.20381
G1 X130.71 Y130.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1507
G1 X124.29 Y130.71 E.19727
G1 X124.29 Y125.29 E.16654
G1 X130.71 Y125.29 E.19727
M73 P90 R1
G1 X130.71 Y130.65 E.1647
M204 S10000
; WIPE_START
G1 F24000
G1 X128.71 Y130.669 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.6 I-.181 J1.203 P1  F30000
G1 X136.898 Y131.898 Z15.6
G1 Z15.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1507
G1 X121.102 Y131.898 E.52398
G1 X121.102 Y124.102 E.2586
G1 X136.898 Y124.102 E.52398
G1 X136.898 Y131.838 E.25661
G1 X137.29 Y132.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1507
G1 X120.71 Y132.29 E.50946
G1 X120.71 Y123.71 E.26364
G1 X137.29 Y123.71 E.50946
G1 X137.29 Y132.23 E.2618
M204 S10000
; WIPE_START
G1 F24000
G1 X135.29 Y132.237 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.6 I.404 J-1.148 P1  F30000
G1 X131.593 Y130.936 Z15.6
G1 Z15.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1507
G1 X131.45 Y130.936 E.00474
G1 X131.45 Y129.45 E.04928
G1 X133.55 Y131.55 E.09848
G1 X134.126 Y131.55 E.01913
G1 X136.55 Y129.126 E.11369
G1 X136.55 Y126.874 E.07472
G1 X134.126 Y124.45 E.11369
G1 X133.55 Y124.45 E.01913
G1 X131.45 Y126.55 E.09848
G1 X131.45 Y125.064 E.04928
G1 X131.593 Y125.064 E.00474
G1 X131.306 Y124.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1507
G1 X123.694 Y124.5 E.24112
G1 X123.55 Y125.146 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1507
G1 X123.55 Y126.774 E.05401
G1 X121.45 Y128.874 E.09848
G1 X121.45 Y127.126 E.05796
G1 X123.55 Y129.226 E.09848
G1 X123.55 Y130.854 E.05401
G1 X123.694 Y131.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1507
G1 X131.306 Y131.5 E.24112
; CHANGE_LAYER
; Z_HEIGHT: 15.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.306 Y131.5 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 77/85
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
G3 Z15.6 I.263 J1.188 P1  F30000
G1 X131.102 Y131.102 Z15.6
G1 Z15.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1507
G1 X123.898 Y131.102 E.23898
G1 X123.898 Y124.898 E.2058
G1 X131.102 Y124.898 E.23898
G1 X131.102 Y131.042 E.20381
G1 X130.71 Y130.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1507
G1 X124.29 Y130.71 E.19727
G1 X124.29 Y125.29 E.16654
G1 X130.71 Y125.29 E.19727
G1 X130.71 Y130.65 E.1647
M204 S10000
; WIPE_START
G1 F24000
G1 X128.71 Y130.669 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.8 I-.181 J1.203 P1  F30000
G1 X136.898 Y131.898 Z15.8
G1 Z15.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1507
G1 X121.102 Y131.898 E.52398
G1 X121.102 Y124.102 E.2586
G1 X136.898 Y124.102 E.52398
G1 X136.898 Y131.838 E.25661
G1 X137.29 Y132.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1507
G1 X120.71 Y132.29 E.50946
G1 X120.71 Y123.71 E.26364
M73 P91 R1
G1 X137.29 Y123.71 E.50946
G1 X137.29 Y132.23 E.2618
M204 S10000
; WIPE_START
G1 F24000
G1 X135.29 Y132.237 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.8 I.404 J-1.148 P1  F30000
G1 X131.593 Y130.936 Z15.8
G1 Z15.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1507
G1 X131.45 Y130.936 E.00474
G1 X131.45 Y129.45 E.04928
G1 X133.55 Y131.55 E.09848
G1 X134.126 Y131.55 E.01913
G1 X136.55 Y129.126 E.11369
G1 X136.55 Y126.874 E.07472
G1 X134.126 Y124.45 E.11369
G1 X133.55 Y124.45 E.01913
G1 X131.45 Y126.55 E.09848
G1 X131.45 Y125.064 E.04928
G1 X131.593 Y125.064 E.00474
G1 X131.306 Y124.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1507
G1 X123.694 Y124.5 E.24112
G1 X123.55 Y125.146 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1507
G1 X123.55 Y126.774 E.05401
G1 X121.45 Y128.874 E.09848
G1 X121.45 Y127.126 E.05796
G1 X123.55 Y129.226 E.09848
G1 X123.55 Y130.854 E.05401
G1 X123.694 Y131.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1507
G1 X131.306 Y131.5 E.24112
; CHANGE_LAYER
; Z_HEIGHT: 15.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.306 Y131.5 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 78/85
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
G3 Z15.8 I.263 J1.188 P1  F30000
G1 X131.102 Y131.102 Z15.8
G1 Z15.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1507
G1 X123.898 Y131.102 E.23898
G1 X123.898 Y124.898 E.2058
G1 X131.102 Y124.898 E.23898
G1 X131.102 Y131.042 E.20381
G1 X130.71 Y130.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1507
G1 X124.29 Y130.71 E.19727
G1 X124.29 Y125.29 E.16654
G1 X130.71 Y125.29 E.19727
G1 X130.71 Y130.65 E.1647
M204 S10000
; WIPE_START
G1 F24000
G1 X128.71 Y130.669 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16 I-.181 J1.203 P1  F30000
G1 X136.898 Y131.898 Z16
G1 Z15.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1507
G1 X121.102 Y131.898 E.52398
G1 X121.102 Y124.102 E.2586
G1 X136.898 Y124.102 E.52398
G1 X136.898 Y131.838 E.25661
G1 X137.29 Y132.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1507
G1 X120.71 Y132.29 E.50946
G1 X120.71 Y123.71 E.26364
G1 X137.29 Y123.71 E.50946
G1 X137.29 Y132.23 E.2618
M204 S10000
; WIPE_START
G1 F24000
G1 X135.29 Y132.237 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16 I.404 J-1.148 P1  F30000
G1 X131.593 Y130.936 Z16
G1 Z15.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1507
G1 X131.45 Y130.936 E.00474
G1 X131.45 Y129.45 E.04928
G1 X133.55 Y131.55 E.09848
G1 X134.126 Y131.55 E.01913
G1 X136.55 Y129.126 E.11369
G1 X136.55 Y126.874 E.07472
G1 X134.126 Y124.45 E.11369
G1 X133.55 Y124.45 E.01913
G1 X131.45 Y126.55 E.09848
G1 X131.45 Y125.064 E.04928
G1 X131.593 Y125.064 E.00474
G1 X131.306 Y124.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1507
G1 X123.694 Y124.5 E.24112
G1 X123.55 Y125.146 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1507
G1 X123.55 Y126.774 E.05401
G1 X121.45 Y128.874 E.09848
G1 X121.45 Y127.126 E.05796
M73 P92 R1
G1 X123.55 Y129.226 E.09848
G1 X123.55 Y130.854 E.05401
G1 X123.694 Y131.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1507
G1 X131.306 Y131.5 E.24112
; CHANGE_LAYER
; Z_HEIGHT: 15.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.306 Y131.5 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 79/85
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
G3 Z16 I.263 J1.188 P1  F30000
G1 X131.102 Y131.102 Z16
G1 Z15.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1782
G1 X123.898 Y131.102 E.23898
G1 X123.898 Y124.898 E.2058
G1 X131.102 Y124.898 E.23898
G1 X131.102 Y131.042 E.20381
G1 X130.71 Y130.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1782
G1 X124.29 Y130.71 E.19727
G1 X124.29 Y125.29 E.16654
G1 X130.71 Y125.29 E.19727
G1 X130.71 Y130.65 E.1647
M204 S10000
; WIPE_START
G1 F24000
G1 X128.71 Y130.669 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.2 I-.181 J1.203 P1  F30000
G1 X136.898 Y131.898 Z16.2
G1 Z15.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1782
G1 X121.102 Y131.898 E.52398
G1 X121.102 Y124.102 E.2586
G1 X136.898 Y124.102 E.52398
G1 X136.898 Y131.838 E.25661
G1 X137.29 Y132.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1782
G1 X120.71 Y132.29 E.50946
G1 X120.71 Y123.71 E.26364
G1 X137.29 Y123.71 E.50946
G1 X137.29 Y132.23 E.2618
M204 S10000
; WIPE_START
G1 F24000
G1 X135.29 Y132.237 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.2 I.583 J1.068 P1  F30000
G1 X136.55 Y131.55 Z16.2
G1 Z15.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1782
G1 X131.654 Y131.55 E.1624
G1 X131.654 Y130.936 E.02036
G1 X131.45 Y130.936 E.00675
G1 X131.45 Y125.064 E.19478
G1 X131.654 Y125.064 E.00675
G1 X131.654 Y124.45 E.02036
G1 X136.55 Y124.45 E.1624
G1 X136.55 Y131.49 E.23351
G1 X131.306 Y131.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1782
G1 X123.694 Y131.5 E.24112
G1 X123.55 Y130.936 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1782
G1 X121.45 Y130.936 E.06964
G1 X121.45 Y125.064 E.19478
G1 X123.55 Y125.064 E.06964
G1 X123.55 Y130.876 E.19279
G1 X123.143 Y130.447 F30000
G1 F1782
G1 X123.143 Y128.819 E.05401
G1 X121.857 Y127.533 E.06029
G1 X121.857 Y128.467 E.03096
G1 X123.143 Y127.181 E.06029
G1 X123.143 Y125.553 E.05401
G1 X123.694 Y124.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1782
G1 X131.306 Y124.5 E.24112
G1 X132.201 Y124.857 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1782
G1 X132.061 Y124.857 E.00463
G1 X132.061 Y125.471 E.02036
G1 X131.857 Y125.471 E.00675
G1 X131.857 Y126.143 E.02227
G1 X133.143 Y124.857 E.06029
G1 X134.533 Y124.857 E.04614
G1 X136.143 Y126.467 E.07549
G1 X136.143 Y129.533 E.10173
M73 P93 R1
G1 X134.533 Y131.143 E.07549
G1 X133.143 Y131.143 E.04614
G1 X131.857 Y129.857 E.06029
G1 X131.857 Y128.229 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 16
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X131.857 Y129.857 E-.61876
G1 X132.12 Y130.12 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 80/85
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
G3 Z16.2 I-.845 J-.876 P1  F30000
G1 X131.102 Y131.102 Z16.2
G1 Z16
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1782
G1 X123.898 Y131.102 E.23898
G1 X123.898 Y124.898 E.2058
G1 X131.102 Y124.898 E.23898
G1 X131.102 Y131.042 E.20381
G1 X130.71 Y130.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1782
G1 X124.29 Y130.71 E.19727
G1 X124.29 Y125.29 E.16654
G1 X130.71 Y125.29 E.19727
G1 X130.71 Y130.65 E.1647
M204 S10000
; WIPE_START
G1 F24000
G1 X128.71 Y130.669 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.4 I-.181 J1.203 P1  F30000
G1 X136.898 Y131.898 Z16.4
G1 Z16
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1782
G1 X121.102 Y131.898 E.52398
G1 X121.102 Y124.102 E.2586
G1 X136.898 Y124.102 E.52398
G1 X136.898 Y131.838 E.25661
G1 X137.29 Y132.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1782
G1 X120.71 Y132.29 E.50946
G1 X120.71 Y123.71 E.26364
G1 X137.29 Y123.71 E.50946
G1 X137.29 Y132.23 E.2618
M204 S10000
; WIPE_START
G1 F24000
G1 X135.29 Y132.237 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.4 I.583 J1.068 P1  F30000
G1 X136.55 Y131.55 Z16.4
G1 Z16
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1782
G1 X131.654 Y131.55 E.1624
G1 X131.654 Y130.936 E.02036
G1 X131.45 Y130.936 E.00675
G1 X131.45 Y125.064 E.19478
G1 X131.654 Y125.064 E.00675
G1 X131.654 Y124.45 E.02036
G1 X136.55 Y124.45 E.1624
G1 X136.55 Y131.49 E.23351
G1 X131.306 Y131.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1782
G1 X123.694 Y131.5 E.24112
G1 X123.55 Y130.936 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1782
G1 X121.45 Y130.936 E.06964
G1 X121.45 Y125.064 E.19478
G1 X123.55 Y125.064 E.06964
G1 X123.55 Y130.876 E.19279
G1 X123.143 Y130.447 F30000
G1 F1782
G1 X123.143 Y128.819 E.05401
G1 X121.857 Y127.533 E.06029
G1 X121.857 Y128.467 E.03096
G1 X123.143 Y127.181 E.06029
G1 X123.143 Y125.553 E.05401
G1 X123.694 Y124.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1782
G1 X131.306 Y124.5 E.24112
G1 X132.201 Y124.857 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1782
G1 X132.061 Y124.857 E.00463
G1 X132.061 Y125.471 E.02036
G1 X131.857 Y125.471 E.00675
G1 X131.857 Y126.143 E.02227
G1 X133.143 Y124.857 E.06029
G1 X134.533 Y124.857 E.04614
G1 X136.143 Y126.467 E.07549
G1 X136.143 Y129.533 E.10173
G1 X134.533 Y131.143 E.07549
G1 X133.143 Y131.143 E.04614
G1 X131.857 Y129.857 E.06029
G1 X131.857 Y128.229 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 16.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X131.857 Y129.857 E-.61876
G1 X132.12 Y130.12 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 81/85
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
G3 Z16.4 I-.845 J-.876 P1  F30000
G1 X131.102 Y131.102 Z16.4
G1 Z16.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1782
G1 X123.898 Y131.102 E.23898
G1 X123.898 Y124.898 E.2058
G1 X131.102 Y124.898 E.23898
M73 P94 R1
G1 X131.102 Y131.042 E.20381
G1 X130.71 Y130.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1782
G1 X124.29 Y130.71 E.19727
G1 X124.29 Y125.29 E.16654
G1 X130.71 Y125.29 E.19727
G1 X130.71 Y130.65 E.1647
M204 S10000
; WIPE_START
G1 F24000
G1 X128.71 Y130.669 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.6 I-.181 J1.203 P1  F30000
G1 X136.898 Y131.898 Z16.6
G1 Z16.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1782
G1 X121.102 Y131.898 E.52398
G1 X121.102 Y124.102 E.2586
G1 X136.898 Y124.102 E.52398
G1 X136.898 Y131.838 E.25661
G1 X137.29 Y132.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1782
G1 X120.71 Y132.29 E.50946
G1 X120.71 Y123.71 E.26364
G1 X137.29 Y123.71 E.50946
G1 X137.29 Y132.23 E.2618
M204 S10000
; WIPE_START
G1 F24000
G1 X135.29 Y132.237 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.6 I.583 J1.068 P1  F30000
G1 X136.55 Y131.55 Z16.6
G1 Z16.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1782
G1 X131.654 Y131.55 E.1624
G1 X131.654 Y130.936 E.02036
G1 X131.45 Y130.936 E.00675
G1 X131.45 Y125.064 E.19478
G1 X131.654 Y125.064 E.00675
G1 X131.654 Y124.45 E.02036
G1 X136.55 Y124.45 E.1624
G1 X136.55 Y131.49 E.23351
G1 X131.306 Y131.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1782
G1 X123.694 Y131.5 E.24112
G1 X123.55 Y130.936 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1782
G1 X121.45 Y130.936 E.06964
G1 X121.45 Y125.064 E.19478
G1 X123.55 Y125.064 E.06964
G1 X123.55 Y130.876 E.19279
G1 X123.143 Y130.447 F30000
G1 F1782
G1 X123.143 Y128.819 E.05401
G1 X121.857 Y127.533 E.06029
G1 X121.857 Y128.467 E.03096
G1 X123.143 Y127.181 E.06029
G1 X123.143 Y125.553 E.05401
G1 X123.694 Y124.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1782
G1 X131.306 Y124.5 E.24112
G1 X132.201 Y124.857 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1782
G1 X132.061 Y124.857 E.00463
G1 X132.061 Y125.471 E.02036
G1 X131.857 Y125.471 E.00675
G1 X131.857 Y126.143 E.02227
G1 X133.143 Y124.857 E.06029
G1 X134.533 Y124.857 E.04614
M73 P94 R0
G1 X136.143 Y126.467 E.07549
G1 X136.143 Y129.533 E.10173
G1 X134.533 Y131.143 E.07549
G1 X133.143 Y131.143 E.04614
G1 X131.857 Y129.857 E.06029
G1 X131.857 Y128.229 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 16.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X131.857 Y129.857 E-.61876
G1 X132.12 Y130.12 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 82/85
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
G3 Z16.6 I-.845 J-.876 P1  F30000
G1 X131.102 Y131.102 Z16.6
G1 Z16.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1782
G1 X123.898 Y131.102 E.23898
G1 X123.898 Y124.898 E.2058
G1 X131.102 Y124.898 E.23898
G1 X131.102 Y131.042 E.20381
G1 X130.71 Y130.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1782
G1 X124.29 Y130.71 E.19727
G1 X124.29 Y125.29 E.16654
G1 X130.71 Y125.29 E.19727
G1 X130.71 Y130.65 E.1647
M204 S10000
; WIPE_START
G1 F24000
G1 X128.71 Y130.669 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.8 I-.181 J1.203 P1  F30000
G1 X136.898 Y131.898 Z16.8
G1 Z16.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1782
G1 X121.102 Y131.898 E.52398
G1 X121.102 Y124.102 E.2586
G1 X136.898 Y124.102 E.52398
G1 X136.898 Y131.838 E.25661
G1 X137.29 Y132.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1782
G1 X120.71 Y132.29 E.50946
G1 X120.71 Y123.71 E.26364
G1 X137.29 Y123.71 E.50946
G1 X137.29 Y132.23 E.2618
M204 S10000
; WIPE_START
G1 F24000
G1 X135.29 Y132.237 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.8 I.583 J1.068 P1  F30000
G1 X136.55 Y131.55 Z16.8
G1 Z16.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1782
M73 P95 R0
G1 X131.654 Y131.55 E.1624
G1 X131.654 Y130.936 E.02036
G1 X131.45 Y130.936 E.00675
G1 X131.45 Y125.064 E.19478
G1 X131.654 Y125.064 E.00675
G1 X131.654 Y124.45 E.02036
G1 X136.55 Y124.45 E.1624
G1 X136.55 Y131.49 E.23351
G1 X131.306 Y131.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1782
G1 X123.694 Y131.5 E.24112
G1 X123.55 Y130.936 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1782
G1 X121.45 Y130.936 E.06964
G1 X121.45 Y125.064 E.19478
G1 X123.55 Y125.064 E.06964
G1 X123.55 Y130.876 E.19279
G1 X123.143 Y130.447 F30000
G1 F1782
G1 X123.143 Y128.819 E.05401
G1 X121.857 Y127.533 E.06029
G1 X121.857 Y128.467 E.03096
G1 X123.143 Y127.181 E.06029
G1 X123.143 Y125.553 E.05401
G1 X123.694 Y124.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1782
G1 X131.306 Y124.5 E.24112
G1 X132.201 Y124.857 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1782
G1 X132.061 Y124.857 E.00463
G1 X132.061 Y125.471 E.02036
G1 X131.857 Y125.471 E.00675
G1 X131.857 Y126.143 E.02227
G1 X133.143 Y124.857 E.06029
G1 X134.533 Y124.857 E.04614
G1 X136.143 Y126.467 E.07549
G1 X136.143 Y129.533 E.10173
G1 X134.533 Y131.143 E.07549
G1 X133.143 Y131.143 E.04614
G1 X131.857 Y129.857 E.06029
G1 X131.857 Y128.229 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 16.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X131.857 Y129.857 E-.61876
G1 X132.12 Y130.12 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 83/85
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
G3 Z16.8 I-.845 J-.876 P1  F30000
G1 X131.102 Y131.102 Z16.8
G1 Z16.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1889
G1 X123.898 Y131.102 E.23898
G1 X123.898 Y124.898 E.2058
G1 X131.102 Y124.898 E.23898
G1 X131.102 Y131.042 E.20381
G1 X130.71 Y130.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1889
G1 X124.29 Y130.71 E.19727
G1 X124.29 Y125.29 E.16654
G1 X130.71 Y125.29 E.19727
G1 X130.71 Y130.65 E.1647
M204 S10000
; WIPE_START
G1 F24000
G1 X128.71 Y130.669 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17 I-.181 J1.203 P1  F30000
G1 X136.898 Y131.898 Z17
G1 Z16.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1889
G1 X121.102 Y131.898 E.52398
G1 X121.102 Y124.102 E.2586
G1 X136.898 Y124.102 E.52398
G1 X136.898 Y131.838 E.25661
G1 X137.29 Y132.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1889
G1 X120.71 Y132.29 E.50946
G1 X120.71 Y123.71 E.26364
G1 X137.29 Y123.71 E.50946
G1 X137.29 Y132.23 E.2618
M204 S10000
G1 X136.731 Y131.519 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.41915
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X131.675 Y131.519 E.28421
G1 X131.675 Y131.05 E.02638
G1 X136.528 Y131.05 E.27283
G1 X136.528 Y130.58 E.02638
G1 X131.472 Y130.58 E.28427
G1 X131.472 Y130.111 E.02638
G1 X136.528 Y130.111 E.28427
G1 X136.528 Y129.642 E.02638
G1 X131.472 Y129.642 E.28427
G1 X131.472 Y129.173 E.02638
G1 X136.528 Y129.173 E.28427
G1 X136.528 Y128.704 E.02638
G1 X131.472 Y128.704 E.28427
G1 X131.472 Y128.235 E.02638
G1 X136.528 Y128.235 E.28427
G1 X136.528 Y127.765 E.02638
G1 X131.472 Y127.765 E.28427
G1 X131.472 Y127.296 E.02638
G1 X136.528 Y127.296 E.28427
G1 X136.528 Y126.827 E.02638
G1 X131.472 Y126.827 E.28427
G1 X131.472 Y126.358 E.02638
G1 X136.528 Y126.358 E.28427
G1 X136.528 Y125.889 E.02638
G1 X131.472 Y125.889 E.28427
G1 X131.472 Y125.42 E.02638
G1 X136.528 Y125.42 E.28427
G1 X136.528 Y124.951 E.02638
G1 X131.675 Y124.951 E.27283
G1 X131.675 Y124.481 E.02638
G1 X136.731 Y124.481 E.28421
M106 S252.45
G1 X131.306 Y124.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
; LAYER_HEIGHT: 0.2
M73 P96 R0
G1 F1889
G1 X123.694 Y124.5 E.24112
G1 X123.731 Y125.102 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.432989
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X121.472 Y125.102 E.13552
G1 X121.472 Y125.585 E.02898
G1 X123.528 Y125.585 E.12337
G1 X123.528 Y126.068 E.02898
G1 X121.472 Y126.068 E.12337
G1 X121.472 Y126.551 E.02898
G1 X123.528 Y126.551 E.12337
G1 X123.528 Y127.034 E.02898
G1 X121.472 Y127.034 E.12337
G1 X121.472 Y127.517 E.02898
G1 X123.528 Y127.517 E.12337
G1 X123.528 Y128 E.02898
G1 X121.472 Y128 E.12337
G1 X121.472 Y128.483 E.02898
G1 X123.528 Y128.483 E.12337
G1 X123.528 Y128.966 E.02898
G1 X121.472 Y128.966 E.12337
G1 X121.472 Y129.449 E.02898
G1 X123.528 Y129.449 E.12337
G1 X123.528 Y129.932 E.02898
G1 X121.472 Y129.932 E.12337
G1 X121.472 Y130.415 E.02898
G1 X123.528 Y130.415 E.12337
G1 X123.528 Y130.898 E.02898
G1 X121.269 Y130.898 E.13552
M106 S252.45
G1 X121.583 Y131.417 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.59788
; LAYER_HEIGHT: 0.2
G1 F1889
G1 X123.153 Y131.417 E.07101
G1 X123.694 Y131.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1889
G1 X131.306 Y131.5 E.24112
; WIPE_START
G1 F24000
G1 X129.306 Y131.5 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17 I.812 J-.907 P1  F30000
G1 X121.583 Y124.583 Z17
G1 Z16.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.597882
G1 F1889
G1 X123.153 Y124.583 E.07101
; CHANGE_LAYER
; Z_HEIGHT: 16.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X121.583 Y124.583 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 84/85
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
G3 Z17 I-.688 J1.004 P1  F30000
G1 X131.102 Y131.102 Z17
G1 Z16.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2428
G1 X123.898 Y131.102 E.23898
G1 X123.898 Y124.898 E.2058
G1 X131.102 Y124.898 E.23898
G1 X131.102 Y131.042 E.20381
G1 X130.71 Y130.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2428
G1 X124.29 Y130.71 E.19727
G1 X124.29 Y125.29 E.16654
G1 X130.71 Y125.29 E.19727
G1 X130.71 Y130.65 E.1647
M204 S10000
; WIPE_START
G1 F24000
G1 X128.71 Y130.669 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.2 I-.181 J1.203 P1  F30000
G1 X136.898 Y131.898 Z17.2
G1 Z16.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2428
G1 X121.102 Y131.898 E.52398
G1 X121.102 Y124.102 E.2586
G1 X136.898 Y124.102 E.52398
G1 X136.898 Y131.838 E.25661
G1 X137.29 Y132.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2428
G1 X120.71 Y132.29 E.50946
G1 X120.71 Y123.71 E.26364
G1 X137.29 Y123.71 E.50946
G1 X137.29 Y132.23 E.2618
M204 S10000
; WIPE_START
G1 F24000
G1 X135.29 Y132.237 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.2 I.221 J-1.197 P1  F30000
G1 X131.306 Y131.5 Z17.2
G1 Z16.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F2428
G1 X123.694 Y131.5 E.24112
G1 X122.72 Y130.517 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.483144
G1 F2428
G1 X122.72 Y125.483 E.18056
G3 X122.607 Y125.28 I.151 J-.217 E.00865
G1 X122.28 Y125.28 E.01173
G1 X122.28 Y130.72 E.19516
G1 X122.607 Y130.72 E.01173
G1 X122.676 Y130.553 E.00649
G1 X123.129 Y130.708 F30000
; LINE_WIDTH: 0.419999
G1 F2428
G1 X123.129 Y125.292 E.1664
G1 X122.992 Y125.186 E.00532
G1 X122.925 Y124.871 E.00989
G1 X121.871 Y124.871 E.03239
G1 X121.871 Y131.129 E.19228
G1 X122.925 Y131.129 E.03239
G1 X123.022 Y130.765 E.01157
G1 X123.076 Y130.736 E.00189
G1 X123.506 Y130.877 F30000
G1 F2428
G1 X123.506 Y125.123 E.17681
G1 X123.325 Y125.008 E.00659
G1 X123.302 Y124.494 E.01581
G1 X121.494 Y124.494 E.05556
G1 X121.494 Y131.506 E.21545
G1 X123.302 Y131.506 E.05556
G1 X123.325 Y130.992 E.01581
G1 X123.455 Y130.909 E.00475
G1 X123.694 Y124.5 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F2428
G1 X131.306 Y124.5 E.24112
G1 X131.494 Y125.123 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2428
G1 X131.494 Y130.892 E.17727
G1 X131.669 Y130.98 E.006
G1 X131.698 Y131.506 E.01618
G1 X136.506 Y131.506 E.14774
G1 X136.506 Y124.494 E.21545
G1 X131.698 Y124.494 E.14774
G1 X131.669 Y125.02 E.01618
G1 X131.546 Y125.092 E.00438
G1 X133.784 Y129.216 F30000
; LINE_WIDTH: 0.474828
M73 P97 R0
G1 F2428
G1 X134.216 Y129.216 E.0152
G1 X134.216 Y126.784 E.08559
G1 X133.784 Y126.784 E.0152
G1 X133.784 Y129.156 E.08348
G1 X133.38 Y129.62 F30000
; LINE_WIDTH: 0.419999
G1 F2428
G1 X134.62 Y129.62 E.03813
G1 X134.62 Y126.38 E.09958
G1 X133.38 Y126.38 E.03813
G1 X133.38 Y129.56 E.09774
G1 X133.002 Y129.998 F30000
G1 F2428
G1 X134.998 Y129.998 E.0613
G1 X134.998 Y126.002 E.12276
G1 X133.002 Y126.002 E.0613
G1 X133.002 Y129.938 E.12091
G1 X132.625 Y130.375 F30000
G1 F2428
G1 X135.375 Y130.375 E.08448
G1 X135.375 Y125.625 E.14593
G1 X132.625 Y125.625 E.08448
G1 X132.625 Y130.315 E.14409
G1 X132.248 Y130.545 F30000
G1 F2428
G1 X132.306 Y130.577 E.00203
G1 X132.357 Y130.752 E.00558
G1 X135.752 Y130.752 E.10432
G1 X135.752 Y125.248 E.1691
G1 X132.357 Y125.248 E.10432
G1 X132.306 Y125.423 E.00558
G1 X132.248 Y125.455 E.00203
G1 X132.248 Y130.485 E.15458
G1 X131.871 Y130.715 F30000
G1 F2428
G1 X131.987 Y130.779 E.00407
G1 X132.075 Y131.129 E.01109
G1 X136.129 Y131.129 E.12457
G1 X136.129 Y124.871 E.19228
G1 X132.075 Y124.871 E.12457
G1 X131.987 Y125.221 E.01109
G1 X131.871 Y125.285 E.00407
G1 X131.871 Y130.655 E.16498
; CHANGE_LAYER
; Z_HEIGHT: 17
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X131.871 Y128.655 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 85/85
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
G3 Z17.2 I-1.06 J-.599 P1  F30000
G1 X130.71 Y130.71 Z17.2
G1 Z17
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2897
G1 X124.29 Y130.71 E.19727
G1 X124.29 Y125.29 E.16654
G1 X130.71 Y125.29 E.19727
G1 X130.71 Y130.65 E.1647
M204 S10000
; WIPE_START
G1 F24000
G1 X128.71 Y130.669 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.4 I-.226 J1.196 P1  F30000
G1 X137.29 Y132.29 Z17.4
G1 Z17
G1 E.8 F1800
M204 S5000
G1 F2897
G1 X120.71 Y132.29 E.50946
G1 X120.71 Y123.71 E.26364
G1 X137.29 Y123.71 E.50946
G1 X137.29 Y132.23 E.2618
M204 S10000
; WIPE_START
G1 F24000
G1 X135.29 Y132.237 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.4 I1.208 J.149 P1  F30000
G1 X136.316 Y123.917 Z17.4
G1 Z17
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
G1 F2897
G1 X137.083 Y124.684 E.03331
G1 X137.083 Y125.217
G1 X135.783 Y123.917 E.05648
G1 X135.25 Y123.917
G1 X137.083 Y125.75 E.07966
G1 X137.083 Y126.284
G1 X134.716 Y123.917 E.10283
G1 X134.183 Y123.917
G1 X137.083 Y126.817 E.126
G1 X137.083 Y127.35
G1 X133.65 Y123.917 E.14917
G1 X133.116 Y123.917
G1 X137.083 Y127.884 E.17235
G1 X137.083 Y128.417
G1 X132.583 Y123.917 E.19552
G1 X132.05 Y123.917
G1 X137.083 Y128.95 E.21869
G1 X137.083 Y129.483
G1 X131.517 Y123.917 E.24187
G1 X130.983 Y123.917
G1 X137.083 Y130.017 E.26504
G1 X137.083 Y130.55
G1 X130.45 Y123.917 E.28821
G1 X129.917 Y123.917
G1 X137.083 Y131.083 E.31139
G1 X137.083 Y131.616
G1 X130.917 Y125.451 E.26791
G1 X130.917 Y125.984
G1 X137.016 Y132.083 E.26499
G1 X136.482 Y132.083
G1 X130.917 Y126.518 E.24182
G1 X130.917 Y127.051
G1 X135.949 Y132.083 E.21865
G1 X135.416 Y132.083
G1 X130.917 Y127.584 E.19547
G1 X130.917 Y128.118
G1 X134.882 Y132.083 E.1723
G1 X134.349 Y132.083
G1 X130.917 Y128.651 E.14913
G1 X130.917 Y129.184
G1 X133.816 Y132.083 E.12595
G1 X133.283 Y132.083
G1 X130.917 Y129.717 E.10278
G1 X130.917 Y130.251
G1 X132.749 Y132.083 E.07961
G1 X132.216 Y132.083
G1 X130.917 Y130.784 E.05643
G1 X130.518 Y130.917
G1 X131.683 Y132.083 E.05063
G1 X131.15 Y132.083
G1 X129.984 Y130.917 E.05063
G1 X129.451 Y130.917
G1 X130.616 Y132.083 E.05063
G1 X130.083 Y132.083
G1 X128.918 Y130.917 E.05063
G1 X128.385 Y130.917
G1 X129.55 Y132.083 E.05063
G1 X129.016 Y132.083
G1 X127.851 Y130.917 E.05063
G1 X127.318 Y130.917
G1 X128.483 Y132.083 E.05063
G1 X127.95 Y132.083
G1 X126.785 Y130.917 E.05063
G1 X126.251 Y130.917
G1 X127.417 Y132.083 E.05063
G1 X126.883 Y132.083
G1 X125.718 Y130.917 E.05063
G1 X125.185 Y130.917
G1 X126.35 Y132.083 E.05063
G1 X125.817 Y132.083
G1 X124.652 Y130.917 E.05063
G1 X124.118 Y130.917
G1 X125.284 Y132.083 E.05063
M204 S10000
; WIPE_START
G1 F24000
G1 X124.118 Y130.917 E-.62619
G1 X124.471 Y130.917 E-.13381
; WIPE_END
G1 E-.04 F1800
G17
M73 P98 R0
G3 Z17.4 I.996 J.699 P1  F30000
G1 X129.384 Y123.917 Z17.4
G1 Z17
G1 E.8 F1800
M204 S2000
G1 F2897
G1 X130.549 Y125.083 E.05063
G1 X130.016 Y125.083
G1 X128.85 Y123.917 E.05063
G1 X128.317 Y123.917
G1 X129.482 Y125.083 E.05063
G1 X128.949 Y125.083
G1 X127.784 Y123.917 E.05063
G1 X127.25 Y123.917
G1 X128.416 Y125.083 E.05063
G1 X127.882 Y125.083
G1 X126.717 Y123.917 E.05063
G1 X126.184 Y123.917
G1 X127.349 Y125.083 E.05063
G1 X126.816 Y125.083
G1 X125.651 Y123.917 E.05063
G1 X125.117 Y123.917
G1 X126.283 Y125.083 E.05063
G1 X125.749 Y125.083
G1 X124.584 Y123.917 E.05063
G1 X124.051 Y123.917
G1 X125.216 Y125.083 E.05063
G1 X124.683 Y125.083
G1 X123.518 Y123.917 E.05063
G1 X122.984 Y123.917
G1 X124.15 Y125.083 E.05063
G1 X124.083 Y125.549
G1 X122.451 Y123.917 E.0709
G1 X121.918 Y123.917
G1 X124.083 Y126.082 E.09407
G1 X124.083 Y126.615
G1 X121.385 Y123.917 E.11724
G1 X120.917 Y123.984
G1 X124.083 Y127.149 E.13754
G1 X124.083 Y127.682
G1 X120.917 Y124.517 E.13754
G1 X120.917 Y125.05
G1 X124.083 Y128.215 E.13754
G1 X124.083 Y128.749
G1 X120.917 Y125.583 E.13754
G1 X120.917 Y126.117
G1 X124.083 Y129.282 E.13754
G1 X124.083 Y129.815
G1 X120.917 Y126.65 E.13754
G1 X120.917 Y127.183
G1 X124.083 Y130.348 E.13754
G1 X124.083 Y130.882
G1 X120.917 Y127.716 E.13754
G1 X120.917 Y128.25
G1 X124.75 Y132.083 E.16656
G1 X124.217 Y132.083
G1 X120.917 Y128.783 E.14339
G1 X120.917 Y129.316
G1 X123.684 Y132.083 E.12021
G1 X123.15 Y132.083
G1 X120.917 Y129.85 E.09704
G1 X120.917 Y130.383
G1 X122.617 Y132.083 E.07387
G1 X122.084 Y132.083
G1 X120.917 Y130.916 E.05069
G1 X120.917 Y131.449
G1 X121.551 Y132.083 E.02752
M204 S10000
; WIPE_START
G1 F24000
G1 X120.917 Y131.449 E-.34033
G1 X120.917 Y130.916 E-.20264
G1 X121.321 Y131.32 E-.21702
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.4 I.176 J1.204 P1  F30000
G1 X124.084 Y130.916 Z17.4
G1 Z17
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0934884
G1 F2897
G1 X123.967 Y131.033 E.00068
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F24000
G1 X124.084 Y130.916 E-.76
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
G1 Z17.5 F900 ; lower z a little
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

    G1 Z117 F600
    G1 Z115

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

