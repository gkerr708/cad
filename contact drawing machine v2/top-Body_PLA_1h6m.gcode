; HEADER_BLOCK_START
; BambuStudio 01.06.02.04
; model printing time: 1h 0m 1s; total estimated time: 1h 5m 50s
; total layer number: 50
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
; different_settings_to_system = enable_support;;
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
M73 P0 R65
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
M73 P6 R61
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
M73 P7 R61
G1 X76 F15000
M73 P7 R60
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
    G29 A X58.1638 Y61.6601 I148.807 J136.68
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
; layer num/total_layer_count: 1/50
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
G1 X193.838 Y61.827 F30000
G1 Z.4
M73 P8 R60
G1 Z.2
G1 E.8 F1800
; FEATURE: Support interface
; LINE_WIDTH: 0.5
G1 F3000
G1 X193.296 Y61.827 E.02021
G1 X193.296 Y62.961 E.04225
G1 X193.72 Y62.961 E.01582
G1 X193.848 Y63.089 E.0067
; WIPE_START
G1 F24000
G1 X193.72 Y62.961 E-.06837
G1 X193.296 Y62.961 E-.16139
G1 X193.296 Y61.827 E-.43104
G1 X193.557 Y61.827 E-.0992
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-1.217 J.003 P1  F30000
G1 X193.848 Y192.911 Z.6
G1 Z.2
G1 E.8 F1800
G1 F3000
G1 X193.72 Y193.039 E.0067
G1 X193.296 Y193.039 E.01582
G1 X193.296 Y194.173 E.04225
G1 X194.027 Y194.173 E.02723
G1 X194.027 Y192.889 E.04784
G1 X194.319 Y192.661 E.0138
G1 X194.319 Y63.339 E4.81675
G1 X194.027 Y63.111 E.0138
G1 X194.027 Y61.827 E.04784
G1 X194.904 Y61.827 E.03267
G1 X194.904 Y194.173 E4.92937
G1 X195.781 Y194.173 E.03267
G1 X195.781 Y61.827 E4.92937
G1 X196.173 Y61.827 E.0146
G1 X196.173 Y194.173 E4.92937
G1 X195.969 Y194.173 E.00757
; WIPE_START
G1 F24000
G1 X196.173 Y194.173 E-.07728
G1 X196.173 Y192.376 E-.68272
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-.405 J1.147 P1  F30000
G1 X206.743 Y196.111 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Support
G1 F3000
G1 X194.611 Y196.111 E.45183
G1 X194.611 Y194.611 E.05586
G1 X196.611 Y194.611 E.07449
G1 X196.611 Y61.389 E4.96205
G1 X194.611 Y61.389 E.07449
G1 X194.611 Y59.889 E.05586
G1 X206.743 Y59.889 E.45183
G1 X206.743 Y196.043 E5.07122
; WIPE_START
G1 F24000
G1 X206.743 Y194.043 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I1.212 J-.107 P1  F30000
G1 X195.023 Y60.977 Z.6
G1 Z.2
G1 E.8 F1800
G1 F3000
G1 X195.023 Y60.3 E.02522
G1 X206.331 Y60.3 E.42119
G1 X206.331 Y195.7 E5.04313
G1 X195.023 Y195.7 E.42119
G1 X195.023 Y195.023 E.02522
G1 X197.023 Y195.023 E.07449
G1 X197.023 Y60.977 E4.99269
G1 X195.023 Y60.977 E.07449
G1 X197.531 Y60.808 F30000
G1 F3000
G1 X205.823 Y60.808 E.30887
G1 X205.823 Y195.192 E5.0053
G1 X197.531 Y195.192 E.30887
G1 X197.531 Y60.808 E5.0053
G1 X198.039 Y61.316 F30000
G1 F3000
G1 X205.315 Y61.316 E.27103
M73 P8 R59
G1 X205.315 Y194.684 E4.96746
G1 X198.039 Y194.684 E.27103
G1 X198.039 Y61.316 E4.96746
G1 X198.546 Y61.824 F30000
G1 F3000
M73 P9 R59
G1 X204.808 Y61.824 E.2332
G1 X204.808 Y194.176 E4.92963
G1 X198.546 Y194.176 E.2332
G1 X198.546 Y61.824 E4.92963
G1 X199.054 Y62.332 F30000
G1 F3000
G1 X204.3 Y62.332 E.19537
G1 X204.3 Y193.668 E4.8918
G1 X199.054 Y193.668 E.19537
G1 X199.054 Y62.332 E4.8918
G1 X199.562 Y62.839 F30000
G1 F3000
G1 X203.792 Y62.839 E.15754
G1 X203.792 Y193.161 E4.85397
G1 X199.562 Y193.161 E.15754
G1 X199.562 Y62.839 E4.85397
G1 X200.07 Y63.347 F30000
G1 F3000
G1 X203.284 Y63.347 E.11971
G1 X203.284 Y192.653 E4.81614
G1 X200.07 Y192.653 E.11971
G1 X200.07 Y63.347 E4.81614
G1 X200.578 Y63.855 F30000
G1 F3000
G1 X202.776 Y63.855 E.08187
G1 X202.776 Y192.145 E4.7783
G1 X200.578 Y192.145 E.08187
G1 X200.578 Y63.855 E4.7783
G1 X201.086 Y64.363 F30000
G1 F3000
G1 X202.268 Y64.363 E.04404
G1 X202.268 Y191.637 E4.74047
G1 X201.086 Y191.637 E.04404
G1 X201.086 Y64.363 E4.74047
; WIPE_START
G1 F24000
G1 X201.086 Y66.363 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-.805 J-.913 P1  F30000
G1 X59.021 Y191.643 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3000
G1 X59.021 Y64.357 E4.74091
G1 X192.64 Y64.357 E4.97681
G1 X192.64 Y191.643 E4.74091
G1 X59.081 Y191.643 E4.97458
G1 X58.564 Y192.1 F30000
; FEATURE: Outer wall
G1 F3000
G1 X58.564 Y63.9 E4.77496
G1 X193.097 Y63.9 E5.01086
G1 X193.097 Y192.1 E4.77496
G1 X58.624 Y192.1 E5.00863
; WIPE_START
G1 F24000
G1 X58.623 Y190.1 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I.829 J.891 P1  F30000
G1 X192.457 Y65.465 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.500719
G1 F6300
M73 P10 R59
G1 X191.738 Y64.746 E.03798
G1 X191.09 Y64.746 E.02415
G1 X192.252 Y65.907 E.06128
G1 X192.252 Y66.555 E.02415
G1 X190.443 Y64.746 E.09544
G1 X189.795 Y64.746 E.02415
G1 X192.252 Y67.202 E.12959
G1 X192.252 Y67.849 E.02415
G1 X189.148 Y64.746 E.16375
G1 X188.501 Y64.746 E.02415
G1 X192.252 Y68.497 E.1979
G1 X192.252 Y69.144 E.02415
G1 X187.853 Y64.746 E.23206
G1 X187.206 Y64.746 E.02415
M73 P10 R58
G1 X192.252 Y69.792 E.26622
G1 X192.252 Y70.439 E.02415
G1 X186.558 Y64.746 E.30037
G1 X185.911 Y64.746 E.02415
G1 X192.252 Y71.087 E.33453
G1 X192.252 Y71.734 E.02415
G1 X185.263 Y64.746 E.36869
G1 X184.616 Y64.746 E.02415
G1 X192.252 Y72.381 E.40284
G1 X192.252 Y73.029 E.02415
G1 X183.969 Y64.746 E.437
G1 X183.321 Y64.746 E.02415
G1 X192.252 Y73.676 E.47115
G1 X192.252 Y74.324 E.02415
G1 X182.674 Y64.746 E.50531
G1 X182.026 Y64.746 E.02415
G1 X192.252 Y74.971 E.53947
G1 X192.252 Y75.619 E.02415
G1 X181.379 Y64.746 E.57362
G1 X180.731 Y64.746 E.02415
G1 X192.252 Y76.266 E.60778
G1 X192.252 Y76.913 E.02415
G1 X180.084 Y64.746 E.64194
G1 X179.437 Y64.746 E.02415
M73 P11 R58
G1 X192.252 Y77.561 E.67609
G1 X192.252 Y78.208 E.02415
G1 X178.789 Y64.746 E.71025
G1 X178.142 Y64.746 E.02415
G1 X192.252 Y78.856 E.7444
G1 X192.252 Y79.503 E.02415
G1 X177.494 Y64.746 E.77856
G1 X176.847 Y64.746 E.02415
G1 X192.252 Y80.151 E.81272
G1 X192.252 Y80.798 E.02415
G1 X176.199 Y64.746 E.84687
G1 X175.552 Y64.746 E.02415
G1 X192.252 Y81.445 E.88103
G1 X192.252 Y82.093 E.02415
G1 X174.905 Y64.746 E.91519
G1 X174.257 Y64.746 E.02415
G1 X192.252 Y82.74 E.94934
G1 X192.252 Y83.388 E.02415
G1 X173.61 Y64.746 E.9835
G1 X172.962 Y64.746 E.02415
G1 X192.252 Y84.035 E1.01765
G1 X192.252 Y84.682 E.02415
G1 X172.315 Y64.746 E1.05181
G1 X171.667 Y64.746 E.02415
G1 X192.252 Y85.33 E1.08597
G1 X192.252 Y85.977 E.02415
G1 X171.02 Y64.746 E1.12012
G1 X170.373 Y64.746 E.02415
G1 X192.252 Y86.625 E1.15428
G1 X192.252 Y87.272 E.02415
G1 X169.725 Y64.746 E1.18844
G1 X169.078 Y64.746 E.02415
G1 X192.252 Y87.92 E1.22259
G1 X192.252 Y88.567 E.02415
G1 X168.43 Y64.746 E1.25675
G1 X167.783 Y64.746 E.02415
G1 X192.252 Y89.214 E1.2909
G1 X192.252 Y89.862 E.02415
G1 X167.135 Y64.746 E1.32506
G1 X166.488 Y64.746 E.02415
G1 X192.252 Y90.509 E1.35922
G1 X192.252 Y91.157 E.02415
G1 X165.841 Y64.746 E1.39337
G1 X165.193 Y64.746 E.02415
G1 X192.252 Y91.804 E1.42753
G1 X192.252 Y92.452 E.02415
G1 X164.546 Y64.746 E1.46168
G1 X163.898 Y64.746 E.02415
G1 X192.252 Y93.099 E1.49584
G1 X192.252 Y93.746 E.02415
G1 X163.251 Y64.746 E1.53
G1 X162.604 Y64.746 E.02415
G1 X192.252 Y94.394 E1.56415
G1 X192.252 Y95.041 E.02415
G1 X161.956 Y64.746 E1.59831
G1 X161.309 Y64.746 E.02415
G1 X192.252 Y95.689 E1.63247
G1 X192.252 Y96.336 E.02415
G1 X160.661 Y64.746 E1.66662
G1 X160.014 Y64.746 E.02415
G1 X192.252 Y96.984 E1.70078
G1 X192.252 Y97.631 E.02415
G1 X159.366 Y64.746 E1.73493
G1 X158.719 Y64.746 E.02415
G1 X192.252 Y98.278 E1.76909
G1 X192.252 Y98.926 E.02415
G1 X158.072 Y64.746 E1.80325
G1 X157.424 Y64.746 E.02415
G1 X192.252 Y99.573 E1.8374
G1 X192.252 Y100.221 E.02415
G1 X156.777 Y64.746 E1.87156
G1 X156.129 Y64.746 E.02415
G1 X192.252 Y100.868 E1.90572
G1 X192.252 Y101.516 E.02415
G1 X155.482 Y64.746 E1.93987
G1 X154.834 Y64.746 E.02415
G1 X192.252 Y102.163 E1.97403
G1 X192.252 Y102.81 E.02415
G1 X154.187 Y64.746 E2.00818
G1 X153.54 Y64.746 E.02415
G1 X192.252 Y103.458 E2.04234
G1 X192.252 Y104.105 E.02415
G1 X152.892 Y64.746 E2.0765
G1 X152.245 Y64.746 E.02415
G1 X192.252 Y104.753 E2.11065
G1 X192.252 Y105.4 E.02415
G1 X151.597 Y64.746 E2.14481
G1 X150.95 Y64.746 E.02415
G1 X192.252 Y106.048 E2.17897
G1 X192.252 Y106.695 E.02415
G1 X150.302 Y64.746 E2.21312
G1 X149.655 Y64.746 E.02415
G1 X192.252 Y107.342 E2.24728
G1 X192.252 Y107.99 E.02415
G1 X149.008 Y64.746 E2.28143
G1 X148.36 Y64.746 E.02415
G1 X192.252 Y108.637 E2.31559
G1 X192.252 Y109.285 E.02415
G1 X147.713 Y64.746 E2.34975
G1 X147.065 Y64.746 E.02415
G1 X192.252 Y109.932 E2.3839
G1 X192.252 Y110.58 E.02415
G1 X146.418 Y64.746 E2.41806
G1 X145.77 Y64.746 E.02415
G1 X192.252 Y111.227 E2.45222
G1 X192.252 Y111.874 E.02415
G1 X145.123 Y64.746 E2.48637
G1 X144.476 Y64.746 E.02415
G1 X192.252 Y112.522 E2.52053
G1 X192.252 Y113.169 E.02415
G1 X143.828 Y64.746 E2.55468
G1 X143.181 Y64.746 E.02415
G1 X192.252 Y113.817 E2.58884
G1 X192.252 Y114.464 E.02415
G1 X142.533 Y64.746 E2.623
G1 X141.886 Y64.746 E.02415
G1 X192.252 Y115.111 E2.65715
G1 X192.252 Y115.759 E.02415
G1 X141.238 Y64.746 E2.69131
G1 X140.591 Y64.746 E.02415
G1 X192.252 Y116.406 E2.72546
M73 P11 R57
G1 X192.252 Y117.054 E.02415
G1 X139.944 Y64.746 E2.75962
G1 X139.296 Y64.746 E.02415
G1 X192.252 Y117.701 E2.79378
G1 X192.252 Y118.349 E.02415
G1 X138.649 Y64.746 E2.82793
G1 X138.001 Y64.746 E.02415
G1 X192.252 Y118.996 E2.86209
G1 X192.252 Y119.643 E.02415
G1 X137.354 Y64.746 E2.89625
M73 P12 R57
G1 X136.706 Y64.746 E.02415
G1 X192.252 Y120.291 E2.9304
G1 X192.252 Y120.938 E.02415
G1 X136.059 Y64.746 E2.96456
G1 X135.412 Y64.746 E.02415
G1 X192.252 Y121.586 E2.99871
G1 X192.252 Y122.233 E.02415
G1 X134.764 Y64.746 E3.03287
G1 X134.117 Y64.746 E.02415
G1 X192.252 Y122.881 E3.06703
G1 X192.252 Y123.528 E.02415
G1 X133.469 Y64.746 E3.10118
G1 X132.822 Y64.746 E.02415
G1 X192.252 Y124.175 E3.13534
G1 X192.252 Y124.823 E.02415
G1 X132.175 Y64.746 E3.1695
G1 X131.527 Y64.746 E.02415
G1 X192.252 Y125.47 E3.20365
G1 X192.252 Y126.118 E.02415
G1 X130.88 Y64.746 E3.23781
G1 X130.232 Y64.746 E.02415
G1 X192.252 Y126.765 E3.27196
G1 X192.252 Y127.413 E.02415
G1 X129.585 Y64.746 E3.30612
G1 X128.937 Y64.746 E.02415
G1 X192.252 Y128.06 E3.34028
G1 X192.252 Y128.707 E.02415
G1 X128.29 Y64.746 E3.37443
G1 X127.643 Y64.746 E.02415
G1 X192.252 Y129.355 E3.40859
G1 X192.252 Y130.002 E.02415
G1 X126.995 Y64.746 E3.44275
G1 X126.348 Y64.746 E.02415
G1 X192.252 Y130.65 E3.4769
G1 X192.252 Y131.297 E.02415
G1 X125.7 Y64.746 E3.51106
G1 X125.053 Y64.746 E.02415
G1 X192.252 Y131.945 E3.54521
G1 X192.252 Y132.592 E.02415
G1 X124.405 Y64.746 E3.57937
G1 X123.758 Y64.746 E.02415
G1 X192.252 Y133.239 E3.61353
G1 X192.252 Y133.887 E.02415
G1 X123.111 Y64.746 E3.64768
G1 X122.463 Y64.746 E.02415
G1 X192.252 Y134.534 E3.68184
G1 X192.252 Y135.182 E.02415
G1 X121.816 Y64.746 E3.71599
G1 X121.168 Y64.746 E.02415
G1 X192.252 Y135.829 E3.75015
G1 X192.252 Y136.477 E.02415
G1 X120.521 Y64.746 E3.78431
G1 X119.873 Y64.746 E.02415
G1 X192.252 Y137.124 E3.81846
G1 X192.252 Y137.771 E.02415
G1 X119.226 Y64.746 E3.85262
G1 X118.579 Y64.746 E.02415
G1 X192.252 Y138.419 E3.88678
G1 X192.252 Y139.066 E.02415
G1 X117.931 Y64.746 E3.92093
G1 X117.284 Y64.746 E.02415
G1 X192.252 Y139.714 E3.95509
G1 X192.252 Y140.361 E.02415
G1 X116.636 Y64.746 E3.98924
G1 X115.989 Y64.746 E.02415
G1 X192.252 Y141.009 E4.0234
G1 X192.252 Y141.656 E.02415
G1 X115.341 Y64.746 E4.05756
G1 X114.694 Y64.746 E.02415
G1 X192.252 Y142.303 E4.09171
G1 X192.252 Y142.951 E.02415
G1 X114.047 Y64.746 E4.12587
G1 X113.399 Y64.746 E.02415
G1 X192.252 Y143.598 E4.16003
G1 X192.252 Y144.246 E.02415
G1 X112.752 Y64.746 E4.19418
G1 X112.104 Y64.746 E.02415
G1 X192.252 Y144.893 E4.22834
G1 X192.252 Y145.54 E.02415
G1 X111.457 Y64.746 E4.26249
G1 X110.809 Y64.746 E.02415
G1 X192.252 Y146.188 E4.29665
G1 X192.252 Y146.835 E.02415
G1 X110.162 Y64.746 E4.33081
G1 X109.515 Y64.746 E.02415
G1 X192.252 Y147.483 E4.36496
M73 P13 R57
G1 X192.252 Y148.13 E.02415
G1 X108.867 Y64.746 E4.39912
G1 X108.22 Y64.746 E.02415
G1 X192.252 Y148.778 E4.43328
G1 X192.252 Y149.425 E.02415
G1 X107.572 Y64.746 E4.46743
G1 X106.925 Y64.746 E.02415
G1 X192.252 Y150.072 E4.50159
G1 X192.252 Y150.72 E.02415
G1 X106.277 Y64.746 E4.53574
G1 X105.63 Y64.746 E.02415
G1 X192.252 Y151.367 E4.5699
G1 X192.252 Y152.015 E.02415
G1 X104.983 Y64.746 E4.60406
G1 X104.335 Y64.746 E.02415
G1 X192.252 Y152.662 E4.63821
G1 X192.252 Y153.31 E.02415
G1 X103.688 Y64.746 E4.67237
G1 X103.04 Y64.746 E.02415
G1 X192.252 Y153.957 E4.70653
G1 X192.252 Y154.604 E.02415
G1 X102.393 Y64.746 E4.74068
G1 X101.746 Y64.746 E.02415
G1 X192.252 Y155.252 E4.77484
G1 X192.252 Y155.899 E.02415
G1 X101.098 Y64.746 E4.80899
G1 X100.451 Y64.746 E.02415
G1 X192.252 Y156.547 E4.84315
G1 X192.252 Y157.194 E.02415
G1 X99.803 Y64.746 E4.87731
M73 P13 R56
G1 X99.156 Y64.746 E.02415
G1 X192.252 Y157.842 E4.91146
G1 X192.252 Y158.489 E.02415
G1 X98.508 Y64.746 E4.94562
G1 X97.861 Y64.746 E.02415
G1 X192.252 Y159.136 E4.97977
G1 X192.252 Y159.784 E.02415
G1 X97.214 Y64.746 E5.01393
G1 X96.566 Y64.746 E.02415
G1 X192.252 Y160.431 E5.04809
G1 X192.252 Y161.079 E.02415
G1 X95.919 Y64.746 E5.08224
G1 X95.271 Y64.746 E.02415
G1 X192.252 Y161.726 E5.1164
G1 X192.252 Y162.374 E.02415
G1 X94.624 Y64.746 E5.15056
G1 X93.976 Y64.746 E.02415
G1 X192.252 Y163.021 E5.18471
G1 X192.252 Y163.668 E.02415
G1 X93.329 Y64.746 E5.21887
G1 X92.682 Y64.746 E.02415
G1 X192.252 Y164.316 E5.25302
G1 X192.252 Y164.963 E.02415
G1 X92.034 Y64.746 E5.28718
G1 X91.387 Y64.746 E.02415
G1 X192.252 Y165.611 E5.32134
G1 X192.252 Y166.258 E.02415
G1 X90.739 Y64.746 E5.35549
G1 X90.092 Y64.746 E.02415
G1 X192.252 Y166.906 E5.38965
G1 X192.252 Y167.553 E.02415
G1 X89.444 Y64.746 E5.42381
G1 X88.797 Y64.746 E.02415
G1 X192.252 Y168.2 E5.45796
M73 P14 R56
G1 X192.252 Y168.848 E.02415
G1 X88.15 Y64.746 E5.49212
G1 X87.502 Y64.746 E.02415
G1 X192.252 Y169.495 E5.52627
G1 X192.252 Y170.143 E.02415
G1 X86.855 Y64.746 E5.56043
G1 X86.207 Y64.746 E.02415
G1 X192.252 Y170.79 E5.59459
G1 X192.252 Y171.438 E.02415
G1 X85.56 Y64.746 E5.62874
G1 X84.912 Y64.746 E.02415
G1 X192.252 Y172.085 E5.6629
G1 X192.252 Y172.732 E.02415
G1 X84.265 Y64.746 E5.69706
G1 X83.618 Y64.746 E.02415
G1 X192.252 Y173.38 E5.73121
G1 X192.252 Y174.027 E.02415
G1 X82.97 Y64.746 E5.76537
G1 X82.323 Y64.746 E.02415
G1 X192.252 Y174.675 E5.79952
G1 X192.252 Y175.322 E.02415
G1 X81.675 Y64.746 E5.83368
G1 X81.028 Y64.746 E.02415
G1 X192.252 Y175.969 E5.86784
G1 X192.252 Y176.617 E.02415
G1 X80.38 Y64.746 E5.90199
G1 X79.733 Y64.746 E.02415
G1 X192.252 Y177.264 E5.93615
G1 X192.252 Y177.912 E.02415
G1 X79.086 Y64.746 E5.97031
G1 X78.438 Y64.746 E.02415
G1 X192.252 Y178.559 E6.00446
G1 X192.252 Y179.207 E.02415
G1 X77.791 Y64.746 E6.03862
G1 X77.143 Y64.746 E.02415
G1 X192.252 Y179.854 E6.07277
G1 X192.252 Y180.501 E.02415
G1 X76.496 Y64.746 E6.10693
G1 X75.848 Y64.746 E.02415
G1 X192.252 Y181.149 E6.14109
G1 X192.252 Y181.796 E.02415
G1 X75.201 Y64.746 E6.17524
G1 X74.554 Y64.746 E.02415
G1 X192.252 Y182.444 E6.2094
G1 X192.252 Y183.091 E.02415
G1 X73.906 Y64.746 E6.24355
G1 X73.259 Y64.746 E.02415
G1 X192.252 Y183.739 E6.27771
G1 X192.252 Y184.386 E.02415
G1 X72.611 Y64.746 E6.31187
M73 P14 R55
G1 X71.964 Y64.746 E.02415
G1 X192.252 Y185.033 E6.34602
G1 X192.252 Y185.681 E.02415
G1 X71.317 Y64.746 E6.38018
M73 P15 R55
G1 X70.669 Y64.746 E.02415
G1 X192.252 Y186.328 E6.41434
G1 X192.252 Y186.976 E.02415
G1 X70.022 Y64.746 E6.44849
G1 X69.374 Y64.746 E.02415
G1 X192.252 Y187.623 E6.48265
G1 X192.252 Y188.271 E.02415
G1 X68.727 Y64.746 E6.5168
G1 X68.079 Y64.746 E.02415
G1 X192.252 Y188.918 E6.55096
G1 X192.252 Y189.565 E.02415
G1 X67.432 Y64.746 E6.58512
G1 X66.785 Y64.746 E.02415
G1 X192.252 Y190.213 E6.61927
G1 X192.252 Y190.86 E.02415
G1 X66.137 Y64.746 E6.65343
G1 X65.49 Y64.746 E.02415
G1 X191.999 Y191.254 E6.67422
G1 X191.351 Y191.254 E.02415
G1 X64.842 Y64.746 E6.67422
G1 X64.195 Y64.746 E.02415
G1 X190.704 Y191.254 E6.67422
G1 X190.056 Y191.254 E.02415
G1 X63.547 Y64.746 E6.67422
G1 X62.9 Y64.746 E.02415
G1 X189.409 Y191.254 E6.67422
G1 X188.761 Y191.254 E.02415
G1 X62.253 Y64.746 E6.67422
G1 X61.605 Y64.746 E.02415
G1 X188.114 Y191.254 E6.67422
G1 X187.467 Y191.254 E.02415
G1 X60.958 Y64.746 E6.67422
G1 X60.31 Y64.746 E.02415
G1 X186.819 Y191.254 E6.67422
G1 X186.172 Y191.254 E.02415
G1 X59.663 Y64.746 E6.67422
G1 X59.409 Y64.746 E.00945
G1 X59.409 Y65.14 E.0147
G1 X185.524 Y191.254 E6.65344
G1 X184.877 Y191.254 E.02415
G1 X59.409 Y65.787 E6.61928
G1 X59.409 Y66.434 E.02415
G1 X184.229 Y191.254 E6.58512
G1 X183.582 Y191.254 E.02415
G1 X59.409 Y67.082 E6.55097
G1 X59.409 Y67.729 E.02415
M73 P16 R55
G1 X182.935 Y191.254 E6.51681
G1 X182.287 Y191.254 E.02415
G1 X59.409 Y68.377 E6.48266
G1 X59.409 Y69.024 E.02415
G1 X181.64 Y191.254 E6.4485
G1 X180.992 Y191.254 E.02415
G1 X59.409 Y69.672 E6.41434
G1 X59.409 Y70.319 E.02415
G1 X180.345 Y191.254 E6.38019
G1 X179.697 Y191.254 E.02415
G1 X59.409 Y70.966 E6.34603
G1 X59.409 Y71.614 E.02415
G1 X179.05 Y191.254 E6.31187
G1 X178.403 Y191.254 E.02415
G1 X59.409 Y72.261 E6.27772
G1 X59.409 Y72.909 E.02415
G1 X177.755 Y191.254 E6.24356
G1 X177.108 Y191.254 E.02415
G1 X59.409 Y73.556 E6.20941
G1 X59.409 Y74.204 E.02415
M73 P16 R54
G1 X176.46 Y191.254 E6.17525
G1 X175.813 Y191.254 E.02415
G1 X59.409 Y74.851 E6.14109
G1 X59.409 Y75.498 E.02415
G1 X175.165 Y191.254 E6.10694
G1 X174.518 Y191.254 E.02415
G1 X59.409 Y76.146 E6.07278
G1 X59.409 Y76.793 E.02415
G1 X173.871 Y191.254 E6.03862
G1 X173.223 Y191.254 E.02415
G1 X59.409 Y77.441 E6.00447
G1 X59.409 Y78.088 E.02415
G1 X172.576 Y191.254 E5.97031
G1 X171.928 Y191.254 E.02415
G1 X59.409 Y78.736 E5.93616
G1 X59.409 Y79.383 E.02415
G1 X171.281 Y191.254 E5.902
G1 X170.633 Y191.254 E.02415
G1 X59.409 Y80.03 E5.86784
G1 X59.409 Y80.678 E.02415
G1 X169.986 Y191.254 E5.83369
G1 X169.339 Y191.254 E.02415
M73 P17 R54
G1 X59.409 Y81.325 E5.79953
G1 X59.409 Y81.973 E.02415
G1 X168.691 Y191.254 E5.76537
G1 X168.044 Y191.254 E.02415
G1 X59.409 Y82.62 E5.73122
G1 X59.409 Y83.268 E.02415
G1 X167.396 Y191.254 E5.69706
G1 X166.749 Y191.254 E.02415
G1 X59.409 Y83.915 E5.66291
G1 X59.409 Y84.562 E.02415
G1 X166.101 Y191.254 E5.62875
G1 X165.454 Y191.254 E.02415
G1 X59.409 Y85.21 E5.59459
G1 X59.409 Y85.857 E.02415
G1 X164.807 Y191.254 E5.56044
G1 X164.159 Y191.254 E.02415
G1 X59.409 Y86.505 E5.52628
G1 X59.409 Y87.152 E.02415
G1 X163.512 Y191.254 E5.49212
G1 X162.864 Y191.254 E.02415
G1 X59.409 Y87.799 E5.45797
G1 X59.409 Y88.447 E.02415
G1 X162.217 Y191.254 E5.42381
G1 X161.569 Y191.254 E.02415
G1 X59.409 Y89.094 E5.38966
G1 X59.409 Y89.742 E.02415
G1 X160.922 Y191.254 E5.3555
G1 X160.275 Y191.254 E.02415
G1 X59.409 Y90.389 E5.32134
G1 X59.409 Y91.037 E.02415
G1 X159.627 Y191.254 E5.28719
G1 X158.98 Y191.254 E.02415
G1 X59.409 Y91.684 E5.25303
G1 X59.409 Y92.331 E.02415
G1 X158.332 Y191.254 E5.21888
G1 X157.685 Y191.254 E.02415
G1 X59.409 Y92.979 E5.18472
G1 X59.409 Y93.626 E.02415
G1 X157.038 Y191.254 E5.15056
G1 X156.39 Y191.254 E.02415
G1 X59.409 Y94.274 E5.11641
G1 X59.409 Y94.921 E.02415
G1 X155.743 Y191.254 E5.08225
M73 P18 R53
G1 X155.095 Y191.254 E.02415
G1 X59.409 Y95.569 E5.04809
G1 X59.409 Y96.216 E.02415
G1 X154.448 Y191.254 E5.01394
G1 X153.8 Y191.254 E.02415
G1 X59.409 Y96.863 E4.97978
G1 X59.409 Y97.511 E.02415
G1 X153.153 Y191.254 E4.94563
G1 X152.506 Y191.254 E.02415
G1 X59.409 Y98.158 E4.91147
G1 X59.409 Y98.806 E.02415
G1 X151.858 Y191.254 E4.87731
G1 X151.211 Y191.254 E.02415
G1 X59.409 Y99.453 E4.84316
G1 X59.409 Y100.101 E.02415
G1 X150.563 Y191.254 E4.809
G1 X149.916 Y191.254 E.02415
G1 X59.409 Y100.748 E4.77484
G1 X59.409 Y101.395 E.02415
G1 X149.268 Y191.254 E4.74069
G1 X148.621 Y191.254 E.02415
G1 X59.409 Y102.043 E4.70653
G1 X59.409 Y102.69 E.02415
G1 X147.974 Y191.254 E4.67238
G1 X147.326 Y191.254 E.02415
G1 X59.409 Y103.338 E4.63822
G1 X59.409 Y103.985 E.02415
G1 X146.679 Y191.254 E4.60406
G1 X146.031 Y191.254 E.02415
G1 X59.409 Y104.633 E4.56991
G1 X59.409 Y105.28 E.02415
G1 X145.384 Y191.254 E4.53575
G1 X144.736 Y191.254 E.02415
G1 X59.409 Y105.927 E4.50159
G1 X59.409 Y106.575 E.02415
G1 X144.089 Y191.254 E4.46744
G1 X143.442 Y191.254 E.02415
G1 X59.409 Y107.222 E4.43328
G1 X59.409 Y107.87 E.02415
G1 X142.794 Y191.254 E4.39913
G1 X142.147 Y191.254 E.02415
G1 X59.409 Y108.517 E4.36497
G1 X59.409 Y109.165 E.02415
G1 X141.499 Y191.254 E4.33081
G1 X140.852 Y191.254 E.02415
G1 X59.409 Y109.812 E4.29666
G1 X59.409 Y110.459 E.02415
G1 X140.204 Y191.254 E4.2625
G1 X139.557 Y191.254 E.02415
G1 X59.409 Y111.107 E4.22835
M73 P19 R53
G1 X59.409 Y111.754 E.02415
G1 X138.91 Y191.254 E4.19419
G1 X138.262 Y191.254 E.02415
G1 X59.409 Y112.402 E4.16003
G1 X59.409 Y113.049 E.02415
G1 X137.615 Y191.254 E4.12588
G1 X136.967 Y191.254 E.02415
G1 X59.409 Y113.697 E4.09172
G1 X59.409 Y114.344 E.02415
G1 X136.32 Y191.254 E4.05756
G1 X135.672 Y191.254 E.02415
G1 X59.409 Y114.991 E4.02341
G1 X59.409 Y115.639 E.02415
G1 X135.025 Y191.254 E3.98925
G1 X134.378 Y191.254 E.02415
G1 X59.409 Y116.286 E3.9551
G1 X59.409 Y116.934 E.02415
G1 X133.73 Y191.254 E3.92094
G1 X133.083 Y191.254 E.02415
G1 X59.409 Y117.581 E3.88678
G1 X59.409 Y118.228 E.02415
G1 X132.435 Y191.254 E3.85263
G1 X131.788 Y191.254 E.02415
G1 X59.409 Y118.876 E3.81847
G1 X59.409 Y119.523 E.02415
G1 X131.14 Y191.254 E3.78431
M73 P19 R52
G1 X130.493 Y191.254 E.02415
G1 X59.409 Y120.171 E3.75016
G1 X59.409 Y120.818 E.02415
G1 X129.846 Y191.254 E3.716
G1 X129.198 Y191.254 E.02415
G1 X59.409 Y121.466 E3.68185
G1 X59.409 Y122.113 E.02415
G1 X128.551 Y191.254 E3.64769
G1 X127.903 Y191.254 E.02415
G1 X59.409 Y122.76 E3.61353
G1 X59.409 Y123.408 E.02415
G1 X127.256 Y191.254 E3.57938
G1 X126.609 Y191.254 E.02415
G1 X59.409 Y124.055 E3.54522
G1 X59.409 Y124.703 E.02415
G1 X125.961 Y191.254 E3.51106
G1 X125.314 Y191.254 E.02415
G1 X59.409 Y125.35 E3.47691
G1 X59.409 Y125.998 E.02415
G1 X124.666 Y191.254 E3.44275
G1 X124.019 Y191.254 E.02415
G1 X59.409 Y126.645 E3.4086
G1 X59.409 Y127.292 E.02415
G1 X123.371 Y191.254 E3.37444
G1 X122.724 Y191.254 E.02415
G1 X59.409 Y127.94 E3.34028
G1 X59.409 Y128.587 E.02415
G1 X122.077 Y191.254 E3.30613
G1 X121.429 Y191.254 E.02415
G1 X59.409 Y129.235 E3.27197
M73 P20 R52
G1 X59.409 Y129.882 E.02415
G1 X120.782 Y191.254 E3.23781
G1 X120.134 Y191.254 E.02415
G1 X59.409 Y130.53 E3.20366
G1 X59.409 Y131.177 E.02415
G1 X119.487 Y191.254 E3.1695
G1 X118.839 Y191.254 E.02415
G1 X59.409 Y131.824 E3.13535
G1 X59.409 Y132.472 E.02415
G1 X118.192 Y191.254 E3.10119
G1 X117.545 Y191.254 E.02415
G1 X59.409 Y133.119 E3.06703
G1 X59.409 Y133.767 E.02415
G1 X116.897 Y191.254 E3.03288
G1 X116.25 Y191.254 E.02415
G1 X59.409 Y134.414 E2.99872
G1 X59.409 Y135.062 E.02415
G1 X115.602 Y191.254 E2.96457
G1 X114.955 Y191.254 E.02415
G1 X59.409 Y135.709 E2.93041
G1 X59.409 Y136.356 E.02415
G1 X114.307 Y191.254 E2.89625
G1 X113.66 Y191.254 E.02415
G1 X59.409 Y137.004 E2.8621
G1 X59.409 Y137.651 E.02415
G1 X113.013 Y191.254 E2.82794
G1 X112.365 Y191.254 E.02415
G1 X59.409 Y138.299 E2.79378
G1 X59.409 Y138.946 E.02415
G1 X111.718 Y191.254 E2.75963
G1 X111.07 Y191.254 E.02415
G1 X59.409 Y139.594 E2.72547
G1 X59.409 Y140.241 E.02415
G1 X110.423 Y191.254 E2.69132
G1 X109.775 Y191.254 E.02415
G1 X59.409 Y140.888 E2.65716
G1 X59.409 Y141.536 E.02415
G1 X109.128 Y191.254 E2.623
G1 X108.481 Y191.254 E.02415
G1 X59.409 Y142.183 E2.58885
G1 X59.409 Y142.831 E.02415
G1 X107.833 Y191.254 E2.55469
G1 X107.186 Y191.254 E.02415
G1 X59.409 Y143.478 E2.52053
G1 X59.409 Y144.126 E.02415
G1 X106.538 Y191.254 E2.48638
G1 X105.891 Y191.254 E.02415
G1 X59.409 Y144.773 E2.45222
G1 X59.409 Y145.42 E.02415
G1 X105.243 Y191.254 E2.41807
G1 X104.596 Y191.254 E.02415
G1 X59.409 Y146.068 E2.38391
G1 X59.409 Y146.715 E.02415
G1 X103.949 Y191.254 E2.34975
G1 X103.301 Y191.254 E.02415
G1 X59.409 Y147.363 E2.3156
G1 X59.409 Y148.01 E.02415
G1 X102.654 Y191.254 E2.28144
G1 X102.006 Y191.254 E.02415
G1 X59.409 Y148.657 E2.24728
G1 X59.409 Y149.305 E.02415
G1 X101.359 Y191.254 E2.21313
G1 X100.711 Y191.254 E.02415
G1 X59.409 Y149.952 E2.17897
G1 X59.409 Y150.6 E.02415
G1 X100.064 Y191.254 E2.14482
G1 X99.417 Y191.254 E.02415
G1 X59.409 Y151.247 E2.11066
G1 X59.409 Y151.895 E.02415
G1 X98.769 Y191.254 E2.0765
M73 P21 R52
G1 X98.122 Y191.254 E.02415
G1 X59.409 Y152.542 E2.04235
M73 P21 R51
G1 X59.409 Y153.189 E.02415
G1 X97.474 Y191.254 E2.00819
G1 X96.827 Y191.254 E.02415
G1 X59.409 Y153.837 E1.97403
G1 X59.409 Y154.484 E.02415
G1 X96.18 Y191.254 E1.93988
G1 X95.532 Y191.254 E.02415
G1 X59.409 Y155.132 E1.90572
G1 X59.409 Y155.779 E.02415
G1 X94.885 Y191.254 E1.87157
G1 X94.237 Y191.254 E.02415
G1 X59.409 Y156.427 E1.83741
G1 X59.409 Y157.074 E.02415
G1 X93.59 Y191.254 E1.80325
G1 X92.942 Y191.254 E.02415
G1 X59.409 Y157.721 E1.7691
G1 X59.409 Y158.369 E.02415
G1 X92.295 Y191.254 E1.73494
G1 X91.648 Y191.254 E.02415
G1 X59.409 Y159.016 E1.70079
G1 X59.409 Y159.664 E.02415
G1 X91 Y191.254 E1.66663
G1 X90.353 Y191.254 E.02415
G1 X59.409 Y160.311 E1.63247
G1 X59.409 Y160.959 E.02415
G1 X89.705 Y191.254 E1.59832
G1 X89.058 Y191.254 E.02415
G1 X59.409 Y161.606 E1.56416
G1 X59.409 Y162.253 E.02415
G1 X88.41 Y191.254 E1.53
G1 X87.763 Y191.254 E.02415
G1 X59.409 Y162.901 E1.49585
G1 X59.409 Y163.548 E.02415
G1 X87.116 Y191.254 E1.46169
G1 X86.468 Y191.254 E.02415
G1 X59.409 Y164.196 E1.42754
G1 X59.409 Y164.843 E.02415
G1 X85.821 Y191.254 E1.39338
G1 X85.173 Y191.254 E.02415
G1 X59.409 Y165.491 E1.35922
G1 X59.409 Y166.138 E.02415
G1 X84.526 Y191.254 E1.32507
G1 X83.878 Y191.254 E.02415
G1 X59.409 Y166.785 E1.29091
G1 X59.409 Y167.433 E.02415
G1 X83.231 Y191.254 E1.25675
G1 X82.584 Y191.254 E.02415
G1 X59.409 Y168.08 E1.2226
G1 X59.409 Y168.728 E.02415
G1 X81.936 Y191.254 E1.18844
G1 X81.289 Y191.254 E.02415
G1 X59.409 Y169.375 E1.15429
G1 X59.409 Y170.023 E.02415
G1 X80.641 Y191.254 E1.12013
G1 X79.994 Y191.254 E.02415
G1 X59.409 Y170.67 E1.08597
G1 X59.409 Y171.317 E.02415
G1 X79.346 Y191.254 E1.05182
G1 X78.699 Y191.254 E.02415
G1 X59.409 Y171.965 E1.01766
G1 X59.409 Y172.612 E.02415
G1 X78.052 Y191.254 E.9835
G1 X77.404 Y191.254 E.02415
G1 X59.409 Y173.26 E.94935
G1 X59.409 Y173.907 E.02415
G1 X76.757 Y191.254 E.91519
G1 X76.109 Y191.254 E.02415
G1 X59.409 Y174.555 E.88104
G1 X59.409 Y175.202 E.02415
G1 X75.462 Y191.254 E.84688
G1 X74.814 Y191.254 E.02415
G1 X59.409 Y175.849 E.81272
G1 X59.409 Y176.497 E.02415
G1 X74.167 Y191.254 E.77857
G1 X73.52 Y191.254 E.02415
G1 X59.409 Y177.144 E.74441
G1 X59.409 Y177.792 E.02415
G1 X72.872 Y191.254 E.71026
G1 X72.225 Y191.254 E.02415
G1 X59.409 Y178.439 E.6761
G1 X59.409 Y179.086 E.02415
G1 X71.577 Y191.254 E.64194
G1 X70.93 Y191.254 E.02415
G1 X59.409 Y179.734 E.60779
G1 X59.409 Y180.381 E.02415
G1 X70.282 Y191.254 E.57363
G1 X69.635 Y191.254 E.02415
G1 X59.409 Y181.029 E.53947
G1 X59.409 Y181.676 E.02415
G1 X68.988 Y191.254 E.50532
G1 X68.34 Y191.254 E.02415
G1 X59.409 Y182.324 E.47116
G1 X59.409 Y182.971 E.02415
G1 X67.693 Y191.254 E.43701
G1 X67.045 Y191.254 E.02415
G1 X59.409 Y183.618 E.40285
G1 X59.409 Y184.266 E.02415
G1 X66.398 Y191.254 E.36869
G1 X65.751 Y191.254 E.02415
G1 X59.409 Y184.913 E.33454
G1 X59.409 Y185.561 E.02415
G1 X65.103 Y191.254 E.30038
G1 X64.456 Y191.254 E.02415
G1 X59.409 Y186.208 E.26622
G1 X59.409 Y186.856 E.02415
G1 X63.808 Y191.254 E.23207
G1 X63.161 Y191.254 E.02415
G1 X59.409 Y187.503 E.19791
M73 P22 R51
G1 X59.409 Y188.15 E.02415
G1 X62.513 Y191.254 E.16376
G1 X61.866 Y191.254 E.02415
G1 X59.409 Y188.798 E.1296
G1 X59.409 Y189.445 E.02415
G1 X61.219 Y191.254 E.09544
G1 X60.571 Y191.254 E.02415
G1 X59.409 Y190.093 E.06129
G1 X59.409 Y190.74 E.02415
G1 X60.129 Y191.46 E.03798
M106 S127.5
M106 P2 S178
; CHANGE_LAYER
; Z_HEIGHT: 0.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X59.409 Y190.74 E-.3869
G1 X59.409 Y190.093 E-.24602
G1 X59.646 Y190.329 E-.12708
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 2/50
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
G3 Z.6 I-.025 J1.217 P1  F30000
G1 X193.838 Y193.039 Z.6
G1 Z.4
G1 E.8 F1800
; FEATURE: Support interface
; LINE_WIDTH: 0.42
G1 F4800
G1 X193.296 Y193.039 E.01667
G1 X193.296 Y194.173 E.03485
G1 X194.027 Y194.173 E.02246
G1 X194.027 Y193.039 E.03485
G1 X194.602 Y193.023 E.01769
; WIPE_START
G1 F24000
G1 X194.027 Y193.039 E-.21873
G1 X194.027 Y194.173 E-.43105
G1 X193.737 Y194.173 E-.11022
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I0 J1.217 P1  F30000
G1 X195.969 Y194.173 Z.8
G1 Z.4
G1 E.8 F1800
G1 F4800
G1 X196.173 Y194.173 E.00625
G1 X196.173 Y61.827 E4.06661
G1 X195.781 Y61.827 E.01204
G1 X195.781 Y194.173 E4.06661
G1 X194.904 Y194.173 E.02695
G1 X194.904 Y61.827 E4.06661
G1 X194.027 Y61.827 E.02695
G1 X194.027 Y62.961 E.03485
G1 X193.296 Y62.961 E.02246
G1 X193.296 Y61.827 E.03485
G1 X193.838 Y61.827 E.01667
; WIPE_START
G1 F24000
G1 X193.296 Y61.827 E-.20615
G1 X193.296 Y62.961 E-.43104
G1 X193.619 Y62.961 E-.12281
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I.439 J1.135 P1  F30000
G1 X196.55 Y61.827 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Support
G1 F9000
G1 X204.804 Y61.827 E.25363
G1 X204.804 Y64.704 E.0884
G1 X196.55 Y64.704 E.25363
G1 X196.55 Y67.581 E.0884
G1 X204.804 Y67.581 E.25363
G1 X204.804 Y70.458 E.0884
G1 X196.55 Y70.458 E.25363
G1 X196.55 Y73.336 E.0884
G1 X204.804 Y73.336 E.25363
G1 X204.804 Y76.213 E.0884
G1 X196.55 Y76.213 E.25363
G1 X196.55 Y79.09 E.0884
G1 X204.804 Y79.09 E.25363
G1 X204.804 Y81.967 E.0884
G1 X196.55 Y81.967 E.25363
G1 X196.55 Y84.844 E.0884
G1 X204.804 Y84.844 E.25363
G1 X204.804 Y87.721 E.0884
G1 X196.55 Y87.721 E.25363
G1 X196.55 Y90.598 E.0884
G1 X204.804 Y90.598 E.25363
G1 X204.804 Y93.475 E.0884
G1 X196.55 Y93.475 E.25363
G1 X196.55 Y96.352 E.0884
G1 X204.804 Y96.352 E.25363
G1 X204.804 Y99.229 E.0884
G1 X196.55 Y99.229 E.25363
G1 X196.55 Y102.106 E.0884
G1 X204.804 Y102.106 E.25363
G1 X204.804 Y104.983 E.0884
G1 X196.55 Y104.983 E.25363
G1 X196.55 Y107.86 E.0884
G1 X204.804 Y107.86 E.25363
G1 X204.804 Y110.738 E.0884
G1 X196.55 Y110.738 E.25363
G1 X196.55 Y113.615 E.0884
G1 X204.804 Y113.615 E.25363
G1 X204.804 Y116.492 E.0884
G1 X196.55 Y116.492 E.25363
G1 X196.55 Y119.369 E.0884
G1 X204.804 Y119.369 E.25363
G1 X204.804 Y122.246 E.0884
G1 X196.55 Y122.246 E.25363
G1 X196.55 Y125.123 E.0884
G1 X204.804 Y125.123 E.25363
G1 X204.804 Y128 E.0884
G1 X196.55 Y128 E.25363
G1 X196.55 Y130.877 E.0884
G1 X204.804 Y130.877 E.25363
G1 X204.804 Y133.754 E.0884
G1 X196.55 Y133.754 E.25363
G1 X196.55 Y136.631 E.0884
G1 X204.804 Y136.631 E.25363
G1 X204.804 Y139.508 E.0884
G1 X196.55 Y139.508 E.25363
G1 X196.55 Y142.385 E.0884
G1 X204.804 Y142.385 E.25363
G1 X204.804 Y145.262 E.0884
G1 X196.55 Y145.262 E.25363
G1 X196.55 Y148.14 E.0884
G1 X204.804 Y148.14 E.25363
G1 X204.804 Y151.017 E.0884
G1 X196.55 Y151.017 E.25363
G1 X196.55 Y153.894 E.0884
G1 X204.804 Y153.894 E.25363
G1 X204.804 Y156.771 E.0884
G1 X196.55 Y156.771 E.25363
G1 X196.55 Y159.648 E.0884
G1 X204.804 Y159.648 E.25363
G1 X204.804 Y162.525 E.0884
G1 X196.55 Y162.525 E.25363
G1 X196.55 Y165.402 E.0884
G1 X204.804 Y165.402 E.25363
G1 X204.804 Y168.279 E.0884
G1 X196.55 Y168.279 E.25363
G1 X196.55 Y171.156 E.0884
G1 X204.804 Y171.156 E.25363
G1 X204.804 Y174.033 E.0884
G1 X196.55 Y174.033 E.25363
G1 X196.55 Y176.91 E.0884
G1 X204.804 Y176.91 E.25363
G1 X204.804 Y179.787 E.0884
G1 X196.55 Y179.787 E.25363
G1 X196.55 Y182.665 E.0884
G1 X204.804 Y182.665 E.25363
G1 X204.804 Y185.542 E.0884
G1 X196.55 Y185.542 E.25363
G1 X196.55 Y188.419 E.0884
G1 X204.804 Y188.419 E.25363
G1 X204.804 Y191.296 E.0884
G1 X196.55 Y191.296 E.25363
G1 X196.55 Y194.173 E.0884
G1 X204.804 Y194.173 E.25363
; WIPE_START
G1 F24000
G1 X202.804 Y194.173 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I.019 J-1.217 P1  F30000
G1 X58.674 Y191.898 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X58.674 Y64.102 E4.23922
G1 X193.315 Y64.102 E4.4663
G1 X193.329 Y64.102 E.00045
G1 X193.329 Y191.898 E4.23922
G1 X193.315 Y191.898 E.00045
G1 X58.734 Y191.898 E4.46431
G1 X58.282 Y192.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X58.282 Y63.71 E3.9509
G1 X58.333 Y63.71 E.00158
G1 X193.697 Y63.71 E4.15937
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X193.721 Y63.71 E.00077
G1 X193.721 Y192.29 E4.26523
G1 X193.697 Y192.29 E.00077
M106 S127.5
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X193.328 Y192.29 E.01134
G1 X58.342 Y192.29 E4.14777
M204 S10000
; WIPE_START
G1 F24000
G1 X58.341 Y190.29 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I1.217 J.012 P1  F30000
G1 X59.599 Y64.266 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.420051
G1 F15000
G1 X59.007 Y64.858 E.02576
G1 X59.007 Y65.392 E.01639
G1 X59.963 Y64.435 E.04156
G1 X60.496 Y64.435 E.01639
G1 X59.007 Y65.925 E.06474
G1 X59.007 Y66.458 E.01639
G1 X61.03 Y64.435 E.08792
G1 X61.563 Y64.435 E.01639
G1 X59.007 Y66.992 E.1111
G1 X59.007 Y67.525 E.01639
G1 X62.097 Y64.435 E.13428
G1 X62.63 Y64.435 E.01639
G1 X59.007 Y68.058 E.15746
G1 X59.007 Y68.592 E.01639
G1 X63.163 Y64.435 E.18064
G1 X63.697 Y64.435 E.01639
G1 X59.007 Y69.125 E.20382
G1 X59.007 Y69.658 E.01639
G1 X64.23 Y64.435 E.227
G1 X64.763 Y64.435 E.01639
G1 X59.007 Y70.192 E.25018
G1 X59.007 Y70.725 E.01639
G1 X65.297 Y64.435 E.27336
M73 P22 R50
G1 X65.83 Y64.435 E.01639
G1 X59.007 Y71.258 E.29654
G1 X59.007 Y71.792 E.01639
G1 X66.363 Y64.435 E.31972
G1 X66.897 Y64.435 E.01639
G1 X59.007 Y72.325 E.34289
G1 X59.007 Y72.858 E.01639
G1 X67.43 Y64.435 E.36607
G1 X67.963 Y64.435 E.01639
G1 X59.007 Y73.392 E.38925
G1 X59.007 Y73.925 E.01639
G1 X68.497 Y64.435 E.41243
G1 X69.03 Y64.435 E.01639
G1 X59.007 Y74.458 E.43561
G1 X59.007 Y74.992 E.01639
G1 X69.563 Y64.435 E.45879
G1 X70.097 Y64.435 E.01639
G1 X59.007 Y75.525 E.48197
G1 X59.007 Y76.059 E.01639
G1 X70.63 Y64.435 E.50515
G1 X71.163 Y64.435 E.01639
G1 X59.007 Y76.592 E.52833
G1 X59.007 Y77.125 E.01639
G1 X71.697 Y64.435 E.55151
G1 X72.23 Y64.435 E.01639
G1 X59.007 Y77.659 E.57469
G1 X59.007 Y78.192 E.01639
G1 X72.763 Y64.435 E.59787
G1 X73.297 Y64.435 E.01639
G1 X59.007 Y78.725 E.62105
G1 X59.007 Y79.259 E.01639
G1 X73.83 Y64.435 E.64423
G1 X74.363 Y64.435 E.01639
G1 X59.007 Y79.792 E.66741
G1 X59.007 Y80.325 E.01639
G1 X74.897 Y64.435 E.69059
G1 X75.43 Y64.435 E.01639
G1 X59.007 Y80.859 E.71377
G1 X59.007 Y81.392 E.01639
G1 X75.963 Y64.435 E.73695
G1 X76.497 Y64.435 E.01639
G1 X59.007 Y81.925 E.76013
G1 X59.007 Y82.459 E.01639
G1 X77.03 Y64.435 E.78331
G1 X77.563 Y64.435 E.01639
G1 X59.007 Y82.992 E.80649
G1 X59.007 Y83.525 E.01639
G1 X78.097 Y64.435 E.82966
G1 X78.63 Y64.435 E.01639
G1 X59.007 Y84.059 E.85284
G1 X59.007 Y84.592 E.01639
G1 X79.164 Y64.435 E.87602
G1 X79.697 Y64.435 E.01639
G1 X59.007 Y85.125 E.8992
G1 X59.007 Y85.659 E.01639
G1 X80.23 Y64.435 E.92238
G1 X80.764 Y64.435 E.01639
G1 X59.007 Y86.192 E.94556
G1 X59.007 Y86.725 E.01639
G1 X81.297 Y64.435 E.96874
G1 X81.83 Y64.435 E.01639
G1 X59.007 Y87.259 E.99192
G1 X59.007 Y87.792 E.01639
G1 X82.364 Y64.435 E1.0151
G1 X82.897 Y64.435 E.01639
G1 X59.007 Y88.325 E1.03828
G1 X59.007 Y88.859 E.01639
G1 X83.43 Y64.435 E1.06146
G1 X83.964 Y64.435 E.01639
G1 X59.007 Y89.392 E1.08464
G1 X59.007 Y89.925 E.01639
G1 X84.497 Y64.435 E1.10782
G1 X85.03 Y64.435 E.01639
G1 X59.007 Y90.459 E1.131
G1 X59.007 Y90.992 E.01639
G1 X85.564 Y64.435 E1.15418
G1 X86.097 Y64.435 E.01639
G1 X59.007 Y91.525 E1.17736
G1 X59.007 Y92.059 E.01639
G1 X86.63 Y64.435 E1.20054
G1 X87.164 Y64.435 E.01639
G1 X59.007 Y92.592 E1.22372
G1 X59.007 Y93.126 E.01639
G1 X87.697 Y64.435 E1.2469
G1 X88.23 Y64.435 E.01639
G1 X59.007 Y93.659 E1.27008
G1 X59.007 Y94.192 E.01639
G1 X88.764 Y64.435 E1.29326
G1 X89.297 Y64.435 E.01639
G1 X59.007 Y94.726 E1.31643
G1 X59.007 Y95.259 E.01639
G1 X89.83 Y64.435 E1.33961
G1 X90.364 Y64.435 E.01639
G1 X59.007 Y95.792 E1.36279
G1 X59.007 Y96.326 E.01639
G1 X90.897 Y64.435 E1.38597
G1 X91.43 Y64.435 E.01639
G1 X59.007 Y96.859 E1.40915
G1 X59.007 Y97.392 E.01639
G1 X91.964 Y64.435 E1.43233
G1 X92.497 Y64.435 E.01639
G1 X59.007 Y97.926 E1.45551
G1 X59.007 Y98.459 E.01639
G1 X93.03 Y64.435 E1.47869
G1 X93.564 Y64.435 E.01639
G1 X59.007 Y98.992 E1.50187
G1 X59.007 Y99.526 E.01639
G1 X94.097 Y64.435 E1.52505
G1 X94.63 Y64.435 E.01639
G1 X59.007 Y100.059 E1.54823
G1 X59.007 Y100.592 E.01639
G1 X95.164 Y64.435 E1.57141
G1 X95.697 Y64.435 E.01639
G1 X59.007 Y101.126 E1.59459
G1 X59.007 Y101.659 E.01639
G1 X96.231 Y64.435 E1.61777
G1 X96.764 Y64.435 E.01639
G1 X59.007 Y102.192 E1.64095
G1 X59.007 Y102.726 E.01639
G1 X97.297 Y64.435 E1.66413
G1 X97.831 Y64.435 E.01639
G1 X59.007 Y103.259 E1.68731
G1 X59.007 Y103.792 E.01639
G1 X98.364 Y64.435 E1.71049
G1 X98.897 Y64.435 E.01639
G1 X59.007 Y104.326 E1.73367
G1 X59.007 Y104.859 E.01639
G1 X99.431 Y64.435 E1.75685
G1 X99.964 Y64.435 E.01639
G1 X59.007 Y105.392 E1.78003
G1 X59.007 Y105.926 E.01639
G1 X100.497 Y64.435 E1.80321
G1 X101.031 Y64.435 E.01639
G1 X59.007 Y106.459 E1.82638
G1 X59.007 Y106.992 E.01639
G1 X101.564 Y64.435 E1.84956
G1 X102.097 Y64.435 E.01639
G1 X59.007 Y107.526 E1.87274
G1 X59.007 Y108.059 E.01639
G1 X102.631 Y64.435 E1.89592
G1 X103.164 Y64.435 E.01639
G1 X59.007 Y108.592 E1.9191
G1 X59.007 Y109.126 E.01639
G1 X103.697 Y64.435 E1.94228
G1 X104.231 Y64.435 E.01639
G1 X59.007 Y109.659 E1.96546
G1 X59.007 Y110.193 E.01639
G1 X104.764 Y64.435 E1.98864
G1 X105.297 Y64.435 E.01639
G1 X59.007 Y110.726 E2.01182
G1 X59.007 Y111.259 E.01639
G1 X105.831 Y64.435 E2.035
G1 X106.364 Y64.435 E.01639
G1 X59.007 Y111.793 E2.05818
G1 X59.007 Y112.326 E.01639
G1 X106.897 Y64.435 E2.08136
G1 X107.431 Y64.435 E.01639
G1 X59.007 Y112.859 E2.10454
G1 X59.007 Y113.393 E.01639
G1 X107.964 Y64.435 E2.12772
G1 X108.497 Y64.435 E.01639
G1 X59.007 Y113.926 E2.1509
G1 X59.007 Y114.459 E.01639
G1 X109.031 Y64.435 E2.17408
G1 X109.564 Y64.435 E.01639
G1 X59.007 Y114.993 E2.19726
G1 X59.007 Y115.526 E.01639
G1 X110.097 Y64.435 E2.22044
G1 X110.631 Y64.435 E.01639
G1 X59.007 Y116.059 E2.24362
G1 X59.007 Y116.593 E.01639
G1 X111.164 Y64.435 E2.2668
G1 X111.698 Y64.435 E.01639
G1 X59.007 Y117.126 E2.28998
M73 P23 R50
G1 X59.007 Y117.659 E.01639
G1 X112.231 Y64.435 E2.31315
G1 X112.764 Y64.435 E.01639
G1 X59.007 Y118.193 E2.33633
G1 X59.007 Y118.726 E.01639
G1 X113.298 Y64.435 E2.35951
G1 X113.831 Y64.435 E.01639
G1 X59.007 Y119.259 E2.38269
G1 X59.007 Y119.793 E.01639
G1 X114.364 Y64.435 E2.40587
G1 X114.898 Y64.435 E.01639
G1 X59.007 Y120.326 E2.42905
G1 X59.007 Y120.859 E.01639
G1 X115.431 Y64.435 E2.45223
G1 X115.964 Y64.435 E.01639
G1 X59.007 Y121.393 E2.47541
G1 X59.007 Y121.926 E.01639
G1 X116.498 Y64.435 E2.49859
G1 X117.031 Y64.435 E.01639
G1 X59.007 Y122.459 E2.52177
G1 X59.007 Y122.993 E.01639
G1 X117.564 Y64.435 E2.54495
G1 X118.098 Y64.435 E.01639
G1 X59.007 Y123.526 E2.56813
G1 X59.007 Y124.059 E.01639
G1 X118.631 Y64.435 E2.59131
G1 X119.164 Y64.435 E.01639
G1 X59.007 Y124.593 E2.61449
G1 X59.007 Y125.126 E.01639
G1 X119.698 Y64.435 E2.63767
G1 X120.231 Y64.435 E.01639
G1 X59.007 Y125.659 E2.66085
G1 X59.007 Y126.193 E.01639
G1 X120.764 Y64.435 E2.68403
G1 X121.298 Y64.435 E.01639
G1 X59.007 Y126.726 E2.70721
G1 X59.007 Y127.259 E.01639
G1 X121.831 Y64.435 E2.73039
G1 X122.364 Y64.435 E.01639
G1 X59.007 Y127.793 E2.75357
G1 X59.007 Y128.326 E.01639
G1 X122.898 Y64.435 E2.77675
G1 X123.431 Y64.435 E.01639
G1 X59.007 Y128.86 E2.79992
G1 X59.007 Y129.393 E.01639
G1 X123.964 Y64.435 E2.8231
G1 X124.498 Y64.435 E.01639
G1 X59.007 Y129.926 E2.84628
G1 X59.007 Y130.46 E.01639
G1 X125.031 Y64.435 E2.86946
G1 X125.564 Y64.435 E.01639
G1 X59.007 Y130.993 E2.89264
G1 X59.007 Y131.526 E.01639
G1 X126.098 Y64.435 E2.91582
G1 X126.631 Y64.435 E.01639
G1 X59.007 Y132.06 E2.939
G1 X59.007 Y132.593 E.01639
G1 X127.164 Y64.435 E2.96218
G1 X127.698 Y64.435 E.01639
G1 X59.007 Y133.126 E2.98536
G1 X59.007 Y133.66 E.01639
G1 X128.231 Y64.435 E3.00854
G1 X128.765 Y64.435 E.01639
G1 X59.007 Y134.193 E3.03172
G1 X59.007 Y134.726 E.01639
G1 X129.298 Y64.435 E3.0549
G1 X129.831 Y64.435 E.01639
G1 X59.007 Y135.26 E3.07808
G1 X59.007 Y135.793 E.01639
G1 X130.365 Y64.435 E3.10126
G1 X130.898 Y64.435 E.01639
G1 X59.007 Y136.326 E3.12444
G1 X59.007 Y136.86 E.01639
G1 X131.431 Y64.435 E3.14762
G1 X131.965 Y64.435 E.01639
G1 X59.007 Y137.393 E3.1708
G1 X59.007 Y137.926 E.01639
G1 X132.498 Y64.435 E3.19398
G1 X133.031 Y64.435 E.01639
G1 X59.007 Y138.46 E3.21716
G1 X59.007 Y138.993 E.01639
G1 X133.565 Y64.435 E3.24034
G1 X134.098 Y64.435 E.01639
G1 X59.007 Y139.526 E3.26352
G1 X59.007 Y140.06 E.01639
G1 X134.631 Y64.435 E3.28669
G1 X135.165 Y64.435 E.01639
G1 X59.007 Y140.593 E3.30987
G1 X59.007 Y141.126 E.01639
G1 X135.698 Y64.435 E3.33305
G1 X136.231 Y64.435 E.01639
G1 X59.007 Y141.66 E3.35623
G1 X59.007 Y142.193 E.01639
G1 X136.765 Y64.435 E3.37941
G1 X137.298 Y64.435 E.01639
G1 X59.007 Y142.726 E3.40259
G1 X59.007 Y143.26 E.01639
G1 X137.831 Y64.435 E3.42577
G1 X138.365 Y64.435 E.01639
G1 X59.007 Y143.793 E3.44895
G1 X59.007 Y144.326 E.01639
G1 X138.898 Y64.435 E3.47213
G1 X139.431 Y64.435 E.01639
G1 X59.007 Y144.86 E3.49531
G1 X59.007 Y145.393 E.01639
G1 X139.965 Y64.435 E3.51849
G1 X140.498 Y64.435 E.01639
G1 X59.007 Y145.927 E3.54167
G1 X59.007 Y146.46 E.01639
G1 X141.031 Y64.435 E3.56485
G1 X141.565 Y64.435 E.01639
G1 X59.007 Y146.993 E3.58803
G1 X59.007 Y147.527 E.01639
G1 X142.098 Y64.435 E3.61121
G1 X142.631 Y64.435 E.01639
G1 X59.007 Y148.06 E3.63439
G1 X59.007 Y148.593 E.01639
G1 X143.165 Y64.435 E3.65757
G1 X143.698 Y64.435 E.01639
G1 X59.007 Y149.127 E3.68075
G1 X59.007 Y149.66 E.01639
G1 X144.231 Y64.435 E3.70393
G1 X144.765 Y64.435 E.01639
G1 X59.007 Y150.193 E3.72711
G1 X59.007 Y150.727 E.01639
G1 X145.298 Y64.435 E3.75029
G1 X145.832 Y64.435 E.01639
G1 X59.007 Y151.26 E3.77346
G1 X59.007 Y151.793 E.01639
G1 X146.365 Y64.435 E3.79664
G1 X146.898 Y64.435 E.01639
G1 X59.007 Y152.327 E3.81982
G1 X59.007 Y152.86 E.01639
G1 X147.432 Y64.435 E3.843
G1 X147.965 Y64.435 E.01639
G1 X59.007 Y153.393 E3.86618
G1 X59.007 Y153.927 E.01639
G1 X148.498 Y64.435 E3.88936
G1 X149.032 Y64.435 E.01639
G1 X59.007 Y154.46 E3.91254
G1 X59.007 Y154.993 E.01639
G1 X149.565 Y64.435 E3.93572
G1 X150.098 Y64.435 E.01639
G1 X59.007 Y155.527 E3.9589
G1 X59.007 Y156.06 E.01639
G1 X150.632 Y64.435 E3.98208
G1 X151.165 Y64.435 E.01639
G1 X59.007 Y156.593 E4.00526
G1 X59.007 Y157.127 E.01639
G1 X151.698 Y64.435 E4.02844
G1 X152.232 Y64.435 E.01639
G1 X59.007 Y157.66 E4.05162
G1 X59.007 Y158.193 E.01639
G1 X152.765 Y64.435 E4.0748
G1 X153.298 Y64.435 E.01639
G1 X59.007 Y158.727 E4.09798
G1 X59.007 Y159.26 E.01639
G1 X153.832 Y64.435 E4.12116
G1 X154.365 Y64.435 E.01639
G1 X59.007 Y159.793 E4.14434
G1 X59.007 Y160.327 E.01639
G1 X154.898 Y64.435 E4.16752
G1 X155.432 Y64.435 E.01639
G1 X59.007 Y160.86 E4.1907
G1 X59.007 Y161.393 E.01639
G1 X155.965 Y64.435 E4.21388
G1 X156.498 Y64.435 E.01639
G1 X59.007 Y161.927 E4.23706
G1 X59.007 Y162.46 E.01639
G1 X157.032 Y64.435 E4.26023
G1 X157.565 Y64.435 E.01639
G1 X59.007 Y162.994 E4.28341
G1 X59.007 Y163.527 E.01639
G1 X158.098 Y64.435 E4.30659
G1 X158.632 Y64.435 E.01639
G1 X59.007 Y164.06 E4.32977
G1 X59.007 Y164.594 E.01639
G1 X159.165 Y64.435 E4.35295
G1 X159.698 Y64.435 E.01639
G1 X59.007 Y165.127 E4.37613
G1 X59.007 Y165.66 E.01639
G1 X160.232 Y64.435 E4.39931
G1 X160.765 Y64.435 E.01639
G1 X59.007 Y166.194 E4.42249
G1 X59.007 Y166.727 E.01639
G1 X161.298 Y64.435 E4.44567
G1 X161.832 Y64.435 E.01639
G1 X59.007 Y167.26 E4.46885
G1 X59.007 Y167.794 E.01639
G1 X162.365 Y64.435 E4.49203
G1 X162.899 Y64.435 E.01639
G1 X59.007 Y168.327 E4.51521
G1 X59.007 Y168.86 E.01639
G1 X163.432 Y64.435 E4.53839
G1 X163.965 Y64.435 E.01639
G1 X59.007 Y169.394 E4.56157
M73 P24 R50
G1 X59.007 Y169.927 E.01639
G1 X164.499 Y64.435 E4.58475
G1 X165.032 Y64.435 E.01639
G1 X59.007 Y170.46 E4.60793
G1 X59.007 Y170.994 E.01639
G1 X165.565 Y64.435 E4.63111
G1 X166.099 Y64.435 E.01639
G1 X59.007 Y171.527 E4.65429
M73 P24 R49
G1 X59.007 Y172.06 E.01639
G1 X166.632 Y64.435 E4.67747
G1 X167.165 Y64.435 E.01639
G1 X59.007 Y172.594 E4.70065
G1 X59.007 Y173.127 E.01639
G1 X167.699 Y64.435 E4.72383
G1 X168.232 Y64.435 E.01639
G1 X59.007 Y173.66 E4.747
G1 X59.007 Y174.194 E.01639
G1 X168.765 Y64.435 E4.77018
G1 X169.299 Y64.435 E.01639
G1 X59.007 Y174.727 E4.79336
G1 X59.007 Y175.26 E.01639
G1 X169.832 Y64.435 E4.81654
G1 X170.365 Y64.435 E.01639
G1 X59.007 Y175.794 E4.83972
G1 X59.007 Y176.327 E.01639
G1 X170.899 Y64.435 E4.8629
G1 X171.432 Y64.435 E.01639
G1 X59.007 Y176.86 E4.88608
G1 X59.007 Y177.394 E.01639
G1 X171.965 Y64.435 E4.90926
G1 X172.499 Y64.435 E.01639
G1 X59.007 Y177.927 E4.93244
G1 X59.007 Y178.46 E.01639
G1 X173.032 Y64.435 E4.95562
G1 X173.565 Y64.435 E.01639
G1 X59.007 Y178.994 E4.9788
G1 X59.007 Y179.527 E.01639
G1 X174.099 Y64.435 E5.00198
G1 X174.632 Y64.435 E.01639
G1 X59.007 Y180.061 E5.02516
G1 X59.007 Y180.594 E.01639
G1 X175.165 Y64.435 E5.04834
G1 X175.699 Y64.435 E.01639
G1 X59.007 Y181.127 E5.07152
G1 X59.007 Y181.661 E.01639
G1 X176.232 Y64.435 E5.0947
G1 X176.765 Y64.435 E.01639
G1 X59.007 Y182.194 E5.11788
G1 X59.007 Y182.727 E.01639
G1 X177.299 Y64.435 E5.14106
G1 X177.832 Y64.435 E.01639
G1 X59.007 Y183.261 E5.16424
G1 X59.007 Y183.794 E.01639
G1 X178.365 Y64.435 E5.18742
G1 X178.899 Y64.435 E.01639
G1 X59.007 Y184.327 E5.2106
G1 X59.007 Y184.861 E.01639
G1 X179.432 Y64.435 E5.23377
G1 X179.966 Y64.435 E.01639
G1 X59.007 Y185.394 E5.25695
G1 X59.007 Y185.927 E.01639
G1 X180.499 Y64.435 E5.28013
G1 X181.032 Y64.435 E.01639
G1 X59.007 Y186.461 E5.30331
G1 X59.007 Y186.994 E.01639
G1 X181.566 Y64.435 E5.32649
G1 X182.099 Y64.435 E.01639
G1 X59.007 Y187.527 E5.34967
G1 X59.007 Y188.061 E.01639
G1 X182.632 Y64.435 E5.37285
G1 X183.166 Y64.435 E.01639
G1 X59.007 Y188.594 E5.39603
G1 X59.007 Y189.127 E.01639
G1 X183.699 Y64.435 E5.41921
G1 X184.232 Y64.435 E.01639
G1 X59.007 Y189.661 E5.44239
G1 X59.007 Y190.194 E.01639
G1 X184.766 Y64.435 E5.46557
G1 X185.299 Y64.435 E.01639
G1 X59.007 Y190.727 E5.48875
G1 X59.007 Y191.261 E.01639
G1 X185.832 Y64.435 E5.51193
G1 X186.366 Y64.435 E.01639
G1 X59.236 Y191.565 E5.52514
G1 X59.77 Y191.565 E.01639
G1 X186.899 Y64.435 E5.52514
G1 X187.432 Y64.435 E.01639
G1 X60.303 Y191.565 E5.52514
G1 X60.836 Y191.565 E.01639
G1 X187.966 Y64.435 E5.52514
G1 X188.499 Y64.435 E.01639
G1 X61.37 Y191.565 E5.52514
G1 X61.903 Y191.565 E.01639
G1 X189.032 Y64.435 E5.52514
G1 X189.566 Y64.435 E.01639
G1 X62.436 Y191.565 E5.52514
G1 X62.97 Y191.565 E.01639
G1 X190.099 Y64.435 E5.52514
G1 X190.632 Y64.435 E.01639
G1 X63.503 Y191.565 E5.52514
G1 X64.036 Y191.565 E.01639
G1 X191.166 Y64.435 E5.52514
G1 X191.699 Y64.435 E.01639
G1 X64.57 Y191.565 E5.52514
G1 X65.103 Y191.565 E.01639
G1 X192.232 Y64.435 E5.52514
G1 X192.766 Y64.435 E.01639
G1 X65.636 Y191.565 E5.52514
G1 X66.17 Y191.565 E.01639
G1 X192.995 Y64.739 E5.51193
G1 X192.995 Y65.273 E.01639
G1 X66.703 Y191.565 E5.48875
G1 X67.236 Y191.565 E.01639
G1 X192.995 Y65.806 E5.46557
G1 X192.995 Y66.339 E.01639
G1 X67.77 Y191.565 E5.44239
G1 X68.303 Y191.565 E.01639
G1 X192.995 Y66.873 E5.41921
G1 X192.995 Y67.406 E.01639
G1 X68.836 Y191.565 E5.39603
G1 X69.37 Y191.565 E.01639
G1 X192.995 Y67.939 E5.37285
M73 P25 R49
G1 X192.995 Y68.473 E.01639
G1 X69.903 Y191.565 E5.34968
G1 X70.437 Y191.565 E.01639
G1 X192.995 Y69.006 E5.3265
G1 X192.995 Y69.539 E.01639
G1 X70.97 Y191.565 E5.30332
G1 X71.503 Y191.565 E.01639
G1 X192.995 Y70.073 E5.28014
G1 X192.995 Y70.606 E.01639
G1 X72.037 Y191.565 E5.25696
G1 X72.57 Y191.565 E.01639
G1 X192.995 Y71.139 E5.23378
G1 X192.995 Y71.673 E.01639
G1 X73.103 Y191.565 E5.2106
G1 X73.637 Y191.565 E.01639
G1 X192.995 Y72.206 E5.18742
G1 X192.995 Y72.739 E.01639
G1 X74.17 Y191.565 E5.16424
G1 X74.703 Y191.565 E.01639
G1 X192.995 Y73.273 E5.14106
G1 X192.995 Y73.806 E.01639
G1 X75.237 Y191.565 E5.11788
G1 X75.77 Y191.565 E.01639
G1 X192.995 Y74.339 E5.0947
G1 X192.995 Y74.873 E.01639
G1 X76.303 Y191.565 E5.07152
G1 X76.837 Y191.565 E.01639
G1 X192.995 Y75.406 E5.04834
G1 X192.995 Y75.939 E.01639
G1 X77.37 Y191.565 E5.02516
G1 X77.903 Y191.565 E.01639
G1 X192.995 Y76.473 E5.00198
G1 X192.995 Y77.006 E.01639
G1 X78.437 Y191.565 E4.9788
G1 X78.97 Y191.565 E.01639
G1 X192.995 Y77.539 E4.95562
G1 X192.995 Y78.073 E.01639
G1 X79.503 Y191.565 E4.93244
G1 X80.037 Y191.565 E.01639
G1 X192.995 Y78.606 E4.90926
G1 X192.995 Y79.139 E.01639
G1 X80.57 Y191.565 E4.88608
G1 X81.103 Y191.565 E.01639
G1 X192.995 Y79.673 E4.86291
G1 X192.995 Y80.206 E.01639
G1 X81.637 Y191.565 E4.83973
G1 X82.17 Y191.565 E.01639
G1 X192.995 Y80.74 E4.81655
G1 X192.995 Y81.273 E.01639
G1 X82.703 Y191.565 E4.79337
G1 X83.237 Y191.565 E.01639
G1 X192.995 Y81.806 E4.77019
G1 X192.995 Y82.34 E.01639
G1 X83.77 Y191.565 E4.74701
G1 X84.303 Y191.565 E.01639
G1 X192.995 Y82.873 E4.72383
G1 X192.995 Y83.406 E.01639
G1 X84.837 Y191.565 E4.70065
G1 X85.37 Y191.565 E.01639
G1 X192.995 Y83.94 E4.67747
G1 X192.995 Y84.473 E.01639
G1 X85.903 Y191.565 E4.65429
M73 P25 R48
G1 X86.437 Y191.565 E.01639
G1 X192.995 Y85.006 E4.63111
G1 X192.995 Y85.54 E.01639
G1 X86.97 Y191.565 E4.60793
G1 X87.504 Y191.565 E.01639
G1 X192.995 Y86.073 E4.58475
G1 X192.995 Y86.606 E.01639
G1 X88.037 Y191.565 E4.56157
G1 X88.57 Y191.565 E.01639
G1 X192.995 Y87.14 E4.53839
G1 X192.995 Y87.673 E.01639
G1 X89.104 Y191.565 E4.51521
G1 X89.637 Y191.565 E.01639
G1 X192.995 Y88.206 E4.49203
G1 X192.995 Y88.74 E.01639
G1 X90.17 Y191.565 E4.46885
G1 X90.704 Y191.565 E.01639
G1 X192.995 Y89.273 E4.44567
G1 X192.995 Y89.806 E.01639
G1 X91.237 Y191.565 E4.42249
G1 X91.77 Y191.565 E.01639
G1 X192.995 Y90.34 E4.39931
G1 X192.995 Y90.873 E.01639
G1 X92.304 Y191.565 E4.37614
G1 X92.837 Y191.565 E.01639
G1 X192.995 Y91.406 E4.35296
G1 X192.995 Y91.94 E.01639
G1 X93.37 Y191.565 E4.32978
G1 X93.904 Y191.565 E.01639
G1 X192.995 Y92.473 E4.3066
G1 X192.995 Y93.006 E.01639
G1 X94.437 Y191.565 E4.28342
G1 X94.97 Y191.565 E.01639
G1 X192.995 Y93.54 E4.26024
G1 X192.995 Y94.073 E.01639
G1 X95.504 Y191.565 E4.23706
G1 X96.037 Y191.565 E.01639
G1 X192.995 Y94.606 E4.21388
G1 X192.995 Y95.14 E.01639
G1 X96.57 Y191.565 E4.1907
G1 X97.104 Y191.565 E.01639
G1 X192.995 Y95.673 E4.16752
G1 X192.995 Y96.206 E.01639
G1 X97.637 Y191.565 E4.14434
G1 X98.17 Y191.565 E.01639
G1 X192.995 Y96.74 E4.12116
G1 X192.995 Y97.273 E.01639
G1 X98.704 Y191.565 E4.09798
M73 P26 R48
G1 X99.237 Y191.565 E.01639
G1 X192.995 Y97.807 E4.0748
G1 X192.995 Y98.34 E.01639
G1 X99.77 Y191.565 E4.05162
G1 X100.304 Y191.565 E.01639
G1 X192.995 Y98.873 E4.02844
G1 X192.995 Y99.407 E.01639
G1 X100.837 Y191.565 E4.00526
G1 X101.37 Y191.565 E.01639
G1 X192.995 Y99.94 E3.98208
G1 X192.995 Y100.473 E.01639
G1 X101.904 Y191.565 E3.9589
G1 X102.437 Y191.565 E.01639
G1 X192.995 Y101.007 E3.93572
G1 X192.995 Y101.54 E.01639
G1 X102.97 Y191.565 E3.91254
G1 X103.504 Y191.565 E.01639
G1 X192.995 Y102.073 E3.88937
G1 X192.995 Y102.607 E.01639
G1 X104.037 Y191.565 E3.86619
G1 X104.571 Y191.565 E.01639
G1 X192.995 Y103.14 E3.84301
G1 X192.995 Y103.673 E.01639
G1 X105.104 Y191.565 E3.81983
G1 X105.637 Y191.565 E.01639
G1 X192.995 Y104.207 E3.79665
G1 X192.995 Y104.74 E.01639
G1 X106.171 Y191.565 E3.77347
G1 X106.704 Y191.565 E.01639
G1 X192.995 Y105.273 E3.75029
G1 X192.995 Y105.807 E.01639
G1 X107.237 Y191.565 E3.72711
G1 X107.771 Y191.565 E.01639
G1 X192.995 Y106.34 E3.70393
G1 X192.995 Y106.873 E.01639
G1 X108.304 Y191.565 E3.68075
G1 X108.837 Y191.565 E.01639
G1 X192.995 Y107.407 E3.65757
G1 X192.995 Y107.94 E.01639
G1 X109.371 Y191.565 E3.63439
G1 X109.904 Y191.565 E.01639
G1 X192.995 Y108.473 E3.61121
G1 X192.995 Y109.007 E.01639
G1 X110.437 Y191.565 E3.58803
G1 X110.971 Y191.565 E.01639
G1 X192.995 Y109.54 E3.56485
G1 X192.995 Y110.073 E.01639
G1 X111.504 Y191.565 E3.54167
G1 X112.037 Y191.565 E.01639
G1 X192.995 Y110.607 E3.51849
G1 X192.995 Y111.14 E.01639
G1 X112.571 Y191.565 E3.49531
G1 X113.104 Y191.565 E.01639
G1 X192.995 Y111.673 E3.47213
G1 X192.995 Y112.207 E.01639
G1 X113.637 Y191.565 E3.44895
G1 X114.171 Y191.565 E.01639
G1 X192.995 Y112.74 E3.42577
G1 X192.995 Y113.273 E.01639
G1 X114.704 Y191.565 E3.40259
G1 X115.237 Y191.565 E.01639
G1 X192.995 Y113.807 E3.37942
G1 X192.995 Y114.34 E.01639
G1 X115.771 Y191.565 E3.35624
G1 X116.304 Y191.565 E.01639
G1 X192.995 Y114.874 E3.33306
G1 X192.995 Y115.407 E.01639
G1 X116.837 Y191.565 E3.30988
G1 X117.371 Y191.565 E.01639
G1 X192.995 Y115.94 E3.2867
G1 X192.995 Y116.474 E.01639
G1 X117.904 Y191.565 E3.26352
G1 X118.437 Y191.565 E.01639
G1 X192.995 Y117.007 E3.24034
G1 X192.995 Y117.54 E.01639
G1 X118.971 Y191.565 E3.21716
G1 X119.504 Y191.565 E.01639
G1 X192.995 Y118.074 E3.19398
G1 X192.995 Y118.607 E.01639
G1 X120.037 Y191.565 E3.1708
G1 X120.571 Y191.565 E.01639
G1 X192.995 Y119.14 E3.14762
G1 X192.995 Y119.674 E.01639
G1 X121.104 Y191.565 E3.12444
G1 X121.638 Y191.565 E.01639
G1 X192.995 Y120.207 E3.10126
G1 X192.995 Y120.74 E.01639
G1 X122.171 Y191.565 E3.07808
G1 X122.704 Y191.565 E.01639
G1 X192.995 Y121.274 E3.0549
G1 X192.995 Y121.807 E.01639
G1 X123.238 Y191.565 E3.03172
G1 X123.771 Y191.565 E.01639
G1 X192.995 Y122.34 E3.00854
G1 X192.995 Y122.874 E.01639
G1 X124.304 Y191.565 E2.98536
G1 X124.838 Y191.565 E.01639
G1 X192.995 Y123.407 E2.96218
G1 X192.995 Y123.94 E.01639
G1 X125.371 Y191.565 E2.939
G1 X125.904 Y191.565 E.01639
G1 X192.995 Y124.474 E2.91582
G1 X192.995 Y125.007 E.01639
G1 X126.438 Y191.565 E2.89265
G1 X126.971 Y191.565 E.01639
G1 X192.995 Y125.54 E2.86947
G1 X192.995 Y126.074 E.01639
G1 X127.504 Y191.565 E2.84629
G1 X128.038 Y191.565 E.01639
G1 X192.995 Y126.607 E2.82311
G1 X192.995 Y127.14 E.01639
G1 X128.571 Y191.565 E2.79993
G1 X129.104 Y191.565 E.01639
G1 X192.995 Y127.674 E2.77675
G1 X192.995 Y128.207 E.01639
G1 X129.638 Y191.565 E2.75357
G1 X130.171 Y191.565 E.01639
G1 X192.995 Y128.74 E2.73039
G1 X192.995 Y129.274 E.01639
G1 X130.704 Y191.565 E2.70721
G1 X131.238 Y191.565 E.01639
G1 X192.995 Y129.807 E2.68403
G1 X192.995 Y130.34 E.01639
G1 X131.771 Y191.565 E2.66085
G1 X132.304 Y191.565 E.01639
G1 X192.995 Y130.874 E2.63767
G1 X192.995 Y131.407 E.01639
G1 X132.838 Y191.565 E2.61449
G1 X133.371 Y191.565 E.01639
G1 X192.995 Y131.941 E2.59131
G1 X192.995 Y132.474 E.01639
G1 X133.904 Y191.565 E2.56813
G1 X134.438 Y191.565 E.01639
G1 X192.995 Y133.007 E2.54495
G1 X192.995 Y133.541 E.01639
G1 X134.971 Y191.565 E2.52177
G1 X135.504 Y191.565 E.01639
G1 X192.995 Y134.074 E2.49859
G1 X192.995 Y134.607 E.01639
G1 X136.038 Y191.565 E2.47541
G1 X136.571 Y191.565 E.01639
G1 X192.995 Y135.141 E2.45223
G1 X192.995 Y135.674 E.01639
G1 X137.104 Y191.565 E2.42905
G1 X137.638 Y191.565 E.01639
G1 X192.995 Y136.207 E2.40588
G1 X192.995 Y136.741 E.01639
G1 X138.171 Y191.565 E2.3827
M73 P27 R48
G1 X138.705 Y191.565 E.01639
G1 X192.995 Y137.274 E2.35952
G1 X192.995 Y137.807 E.01639
G1 X139.238 Y191.565 E2.33634
G1 X139.771 Y191.565 E.01639
G1 X192.995 Y138.341 E2.31316
G1 X192.995 Y138.874 E.01639
G1 X140.305 Y191.565 E2.28998
G1 X140.838 Y191.565 E.01639
G1 X192.995 Y139.407 E2.2668
G1 X192.995 Y139.941 E.01639
G1 X141.371 Y191.565 E2.24362
G1 X141.905 Y191.565 E.01639
G1 X192.995 Y140.474 E2.22044
G1 X192.995 Y141.007 E.01639
G1 X142.438 Y191.565 E2.19726
G1 X142.971 Y191.565 E.01639
G1 X192.995 Y141.541 E2.17408
G1 X192.995 Y142.074 E.01639
G1 X143.505 Y191.565 E2.1509
M73 P27 R47
G1 X144.038 Y191.565 E.01639
G1 X192.995 Y142.607 E2.12772
G1 X192.995 Y143.141 E.01639
G1 X144.571 Y191.565 E2.10454
G1 X145.105 Y191.565 E.01639
G1 X192.995 Y143.674 E2.08136
G1 X192.995 Y144.207 E.01639
G1 X145.638 Y191.565 E2.05818
G1 X146.171 Y191.565 E.01639
G1 X192.995 Y144.741 E2.035
G1 X192.995 Y145.274 E.01639
G1 X146.705 Y191.565 E2.01182
G1 X147.238 Y191.565 E.01639
G1 X192.995 Y145.807 E1.98864
G1 X192.995 Y146.341 E.01639
G1 X147.771 Y191.565 E1.96546
G1 X148.305 Y191.565 E.01639
G1 X192.995 Y146.874 E1.94228
G1 X192.995 Y147.407 E.01639
G1 X148.838 Y191.565 E1.91911
G1 X149.371 Y191.565 E.01639
G1 X192.995 Y147.941 E1.89593
G1 X192.995 Y148.474 E.01639
G1 X149.905 Y191.565 E1.87275
G1 X150.438 Y191.565 E.01639
G1 X192.995 Y149.007 E1.84957
G1 X192.995 Y149.541 E.01639
G1 X150.971 Y191.565 E1.82639
G1 X151.505 Y191.565 E.01639
G1 X192.995 Y150.074 E1.80321
G1 X192.995 Y150.608 E.01639
G1 X152.038 Y191.565 E1.78003
G1 X152.571 Y191.565 E.01639
G1 X192.995 Y151.141 E1.75685
G1 X192.995 Y151.674 E.01639
G1 X153.105 Y191.565 E1.73367
G1 X153.638 Y191.565 E.01639
G1 X192.995 Y152.208 E1.71049
G1 X192.995 Y152.741 E.01639
G1 X154.171 Y191.565 E1.68731
G1 X154.705 Y191.565 E.01639
G1 X192.995 Y153.274 E1.66413
G1 X192.995 Y153.808 E.01639
G1 X155.238 Y191.565 E1.64095
G1 X155.772 Y191.565 E.01639
G1 X192.995 Y154.341 E1.61777
G1 X192.995 Y154.874 E.01639
G1 X156.305 Y191.565 E1.59459
G1 X156.838 Y191.565 E.01639
G1 X192.995 Y155.408 E1.57141
G1 X192.995 Y155.941 E.01639
G1 X157.372 Y191.565 E1.54823
G1 X157.905 Y191.565 E.01639
G1 X192.995 Y156.474 E1.52505
G1 X192.995 Y157.008 E.01639
G1 X158.438 Y191.565 E1.50187
G1 X158.972 Y191.565 E.01639
G1 X192.995 Y157.541 E1.47869
G1 X192.995 Y158.074 E.01639
G1 X159.505 Y191.565 E1.45551
G1 X160.038 Y191.565 E.01639
G1 X192.995 Y158.608 E1.43234
G1 X192.995 Y159.141 E.01639
G1 X160.572 Y191.565 E1.40916
G1 X161.105 Y191.565 E.01639
G1 X192.995 Y159.674 E1.38598
G1 X192.995 Y160.208 E.01639
G1 X161.638 Y191.565 E1.3628
G1 X162.172 Y191.565 E.01639
G1 X192.995 Y160.741 E1.33962
G1 X192.995 Y161.274 E.01639
G1 X162.705 Y191.565 E1.31644
G1 X163.238 Y191.565 E.01639
G1 X192.995 Y161.808 E1.29326
G1 X192.995 Y162.341 E.01639
G1 X163.772 Y191.565 E1.27008
G1 X164.305 Y191.565 E.01639
G1 X192.995 Y162.874 E1.2469
G1 X192.995 Y163.408 E.01639
G1 X164.838 Y191.565 E1.22372
G1 X165.372 Y191.565 E.01639
G1 X192.995 Y163.941 E1.20054
G1 X192.995 Y164.474 E.01639
G1 X165.905 Y191.565 E1.17736
G1 X166.438 Y191.565 E.01639
G1 X192.995 Y165.008 E1.15418
G1 X192.995 Y165.541 E.01639
G1 X166.972 Y191.565 E1.131
G1 X167.505 Y191.565 E.01639
G1 X192.995 Y166.074 E1.10782
G1 X192.995 Y166.608 E.01639
G1 X168.038 Y191.565 E1.08464
G1 X168.572 Y191.565 E.01639
G1 X192.995 Y167.141 E1.06146
G1 X192.995 Y167.675 E.01639
G1 X169.105 Y191.565 E1.03828
G1 X169.638 Y191.565 E.01639
G1 X192.995 Y168.208 E1.0151
G1 X192.995 Y168.741 E.01639
G1 X170.172 Y191.565 E.99192
G1 X170.705 Y191.565 E.01639
G1 X192.995 Y169.275 E.96874
G1 X192.995 Y169.808 E.01639
G1 X171.238 Y191.565 E.94557
G1 X171.772 Y191.565 E.01639
G1 X192.995 Y170.341 E.92239
G1 X192.995 Y170.875 E.01639
G1 X172.305 Y191.565 E.89921
G1 X172.839 Y191.565 E.01639
G1 X192.995 Y171.408 E.87603
G1 X192.995 Y171.941 E.01639
G1 X173.372 Y191.565 E.85285
G1 X173.905 Y191.565 E.01639
G1 X192.995 Y172.475 E.82967
G1 X192.995 Y173.008 E.01639
G1 X174.439 Y191.565 E.80649
G1 X174.972 Y191.565 E.01639
G1 X192.995 Y173.541 E.78331
G1 X192.995 Y174.075 E.01639
G1 X175.505 Y191.565 E.76013
G1 X176.039 Y191.565 E.01639
G1 X192.995 Y174.608 E.73695
G1 X192.995 Y175.141 E.01639
G1 X176.572 Y191.565 E.71377
G1 X177.105 Y191.565 E.01639
G1 X192.995 Y175.675 E.69059
G1 X192.995 Y176.208 E.01639
G1 X177.639 Y191.565 E.66741
G1 X178.172 Y191.565 E.01639
G1 X192.995 Y176.741 E.64423
G1 X192.995 Y177.275 E.01639
G1 X178.705 Y191.565 E.62105
G1 X179.239 Y191.565 E.01639
G1 X192.995 Y177.808 E.59787
G1 X192.995 Y178.341 E.01639
G1 X179.772 Y191.565 E.57469
G1 X180.305 Y191.565 E.01639
G1 X192.995 Y178.875 E.55151
G1 X192.995 Y179.408 E.01639
G1 X180.839 Y191.565 E.52833
G1 X181.372 Y191.565 E.01639
G1 X192.995 Y179.941 E.50515
G1 X192.995 Y180.475 E.01639
G1 X181.905 Y191.565 E.48197
G1 X182.439 Y191.565 E.01639
G1 X192.995 Y181.008 E.4588
G1 X192.995 Y181.541 E.01639
G1 X182.972 Y191.565 E.43562
G1 X183.505 Y191.565 E.01639
G1 X192.995 Y182.075 E.41244
G1 X192.995 Y182.608 E.01639
G1 X184.039 Y191.565 E.38926
G1 X184.572 Y191.565 E.01639
G1 X192.995 Y183.141 E.36608
G1 X192.995 Y183.675 E.01639
G1 X185.105 Y191.565 E.3429
G1 X185.639 Y191.565 E.01639
G1 X192.995 Y184.208 E.31972
G1 X192.995 Y184.742 E.01639
G1 X186.172 Y191.565 E.29654
G1 X186.705 Y191.565 E.01639
G1 X192.995 Y185.275 E.27336
G1 X192.995 Y185.808 E.01639
G1 X187.239 Y191.565 E.25018
G1 X187.772 Y191.565 E.01639
G1 X192.995 Y186.342 E.227
G1 X192.995 Y186.875 E.01639
G1 X188.306 Y191.565 E.20382
G1 X188.839 Y191.565 E.01639
G1 X192.995 Y187.408 E.18064
G1 X192.995 Y187.942 E.01639
G1 X189.372 Y191.565 E.15746
G1 X189.906 Y191.565 E.01639
G1 X192.995 Y188.475 E.13428
G1 X192.995 Y189.008 E.01639
G1 X190.439 Y191.565 E.1111
G1 X190.972 Y191.565 E.01639
G1 X192.995 Y189.542 E.08792
G1 X192.995 Y190.075 E.01639
G1 X191.506 Y191.565 E.06474
G1 X192.039 Y191.565 E.01639
G1 X192.995 Y190.608 E.04156
G1 X192.995 Y191.142 E.01639
G1 X192.403 Y191.734 E.02576
; CHANGE_LAYER
; Z_HEIGHT: 0.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X192.995 Y191.142 E-.31851
G1 X192.995 Y190.608 E-.20267
G1 X192.551 Y191.053 E-.23881
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 3/50
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
G3 Z.8 I-1.021 J.662 P1  F30000
G1 X193.838 Y193.039 Z.8
G1 Z.6
G1 E.8 F1800
; FEATURE: Support interface
; LINE_WIDTH: 0.42
G1 F4800
G1 X193.296 Y193.039 E.01667
G1 X193.296 Y194.173 E.03485
G1 X194.027 Y194.173 E.02246
G1 X194.027 Y193.039 E.03485
G1 X194.587 Y193.039 E.01721
G1 X194.722 Y192.904 E.00585
; WIPE_START
G1 F24000
G1 X194.587 Y193.039 E-.0724
G1 X194.027 Y193.039 E-.21285
G1 X194.027 Y194.173 E-.43105
G1 X193.912 Y194.173 E-.0437
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I0 J1.217 P1  F30000
G1 X195.969 Y194.173 Z1
G1 Z.6
G1 E.8 F1800
G1 F4800
G1 X196.173 Y194.173 E.00625
G1 X196.173 Y61.827 E4.06661
G1 X195.781 Y61.827 E.01204
G1 X195.781 Y194.173 E4.06661
G1 X194.904 Y194.173 E.02695
G1 X194.904 Y192.889 E.03946
G1 X195.186 Y192.661 E.01113
G1 X195.186 Y63.339 E3.9737
G1 X194.904 Y63.111 E.01113
G1 X194.904 Y61.827 E.03946
G1 X194.027 Y61.827 E.02695
G1 X194.027 Y62.961 E.03485
G1 X193.296 Y62.961 E.02246
G1 X193.296 Y61.827 E.03485
G1 X193.838 Y61.827 E.01667
; WIPE_START
G1 F24000
G1 X193.296 Y61.827 E-.20615
G1 X193.296 Y62.961 E-.43104
G1 X193.619 Y62.961 E-.12281
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I.439 J1.135 P1  F30000
G1 X196.55 Y61.827 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Support
G1 F9000
G1 X204.804 Y61.827 E.25363
G1 X204.804 Y64.704 E.0884
G1 X196.55 Y64.704 E.25363
G1 X196.55 Y67.581 E.0884
G1 X204.804 Y67.581 E.25363
G1 X204.804 Y70.458 E.0884
G1 X196.55 Y70.458 E.25363
G1 X196.55 Y73.336 E.0884
G1 X204.804 Y73.336 E.25363
G1 X204.804 Y76.213 E.0884
G1 X196.55 Y76.213 E.25363
G1 X196.55 Y79.09 E.0884
G1 X204.804 Y79.09 E.25363
G1 X204.804 Y81.967 E.0884
G1 X196.55 Y81.967 E.25363
G1 X196.55 Y84.844 E.0884
G1 X204.804 Y84.844 E.25363
G1 X204.804 Y87.721 E.0884
G1 X196.55 Y87.721 E.25363
G1 X196.55 Y90.598 E.0884
G1 X204.804 Y90.598 E.25363
G1 X204.804 Y93.475 E.0884
G1 X196.55 Y93.475 E.25363
G1 X196.55 Y96.352 E.0884
G1 X204.804 Y96.352 E.25363
G1 X204.804 Y99.229 E.0884
G1 X196.55 Y99.229 E.25363
G1 X196.55 Y102.106 E.0884
G1 X204.804 Y102.106 E.25363
G1 X204.804 Y104.983 E.0884
G1 X196.55 Y104.983 E.25363
G1 X196.55 Y107.86 E.0884
G1 X204.804 Y107.86 E.25363
G1 X204.804 Y110.738 E.0884
G1 X196.55 Y110.738 E.25363
G1 X196.55 Y113.615 E.0884
G1 X204.804 Y113.615 E.25363
G1 X204.804 Y116.492 E.0884
G1 X196.55 Y116.492 E.25363
G1 X196.55 Y119.369 E.0884
G1 X204.804 Y119.369 E.25363
G1 X204.804 Y122.246 E.0884
G1 X196.55 Y122.246 E.25363
G1 X196.55 Y125.123 E.0884
G1 X204.804 Y125.123 E.25363
G1 X204.804 Y128 E.0884
G1 X196.55 Y128 E.25363
G1 X196.55 Y130.877 E.0884
G1 X204.804 Y130.877 E.25363
G1 X204.804 Y133.754 E.0884
G1 X196.55 Y133.754 E.25363
G1 X196.55 Y136.631 E.0884
G1 X204.804 Y136.631 E.25363
G1 X204.804 Y139.508 E.0884
G1 X196.55 Y139.508 E.25363
G1 X196.55 Y142.385 E.0884
G1 X204.804 Y142.385 E.25363
G1 X204.804 Y145.262 E.0884
G1 X196.55 Y145.262 E.25363
G1 X196.55 Y148.14 E.0884
G1 X204.804 Y148.14 E.25363
G1 X204.804 Y151.017 E.0884
G1 X196.55 Y151.017 E.25363
G1 X196.55 Y153.894 E.0884
G1 X204.804 Y153.894 E.25363
G1 X204.804 Y156.771 E.0884
G1 X196.55 Y156.771 E.25363
G1 X196.55 Y159.648 E.0884
G1 X204.804 Y159.648 E.25363
G1 X204.804 Y162.525 E.0884
G1 X196.55 Y162.525 E.25363
G1 X196.55 Y165.402 E.0884
G1 X204.804 Y165.402 E.25363
G1 X204.804 Y168.279 E.0884
G1 X196.55 Y168.279 E.25363
G1 X196.55 Y171.156 E.0884
G1 X204.804 Y171.156 E.25363
G1 X204.804 Y174.033 E.0884
G1 X196.55 Y174.033 E.25363
G1 X196.55 Y176.91 E.0884
G1 X204.804 Y176.91 E.25363
G1 X204.804 Y179.787 E.0884
G1 X196.55 Y179.787 E.25363
G1 X196.55 Y182.665 E.0884
G1 X204.804 Y182.665 E.25363
G1 X204.804 Y185.542 E.0884
G1 X196.55 Y185.542 E.25363
G1 X196.55 Y188.419 E.0884
G1 X204.804 Y188.419 E.25363
G1 X204.804 Y191.296 E.0884
G1 X196.55 Y191.296 E.25363
G1 X196.55 Y194.173 E.0884
G1 X204.804 Y194.173 E.25363
; WIPE_START
G1 F24000
G1 X202.804 Y194.173 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I.019 J-1.217 P1  F30000
G1 X58.581 Y191.898 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X58.581 Y64.102 E4.23922
G1 X193.748 Y64.102 E4.48373
G1 X193.762 Y64.102 E.00045
G1 X193.762 Y191.898 E4.23922
G1 X193.748 Y191.898 E.00045
G1 X58.641 Y191.898 E4.48174
G1 X58.189 Y192.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X58.189 Y63.71 E3.9509
G1 X58.241 Y63.71 E.00158
G1 X194.131 Y63.71 E4.17552
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X194.154 Y63.71 E.00077
G1 X194.154 Y192.29 E4.26523
G1 X194.131 Y192.29 E.00077
M106 S127.5
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X193.762 Y192.29 E.01134
G1 X58.249 Y192.29 E4.16392
M204 S10000
; WIPE_START
G1 F24000
G1 X58.248 Y190.29 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I-.917 J.8 P1  F30000
G1 X59.508 Y191.734 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.420039
G1 F15000
G1 X58.915 Y191.141 E.02578
G1 X58.915 Y190.608 E.01639
G1 X59.871 Y191.565 E.04158
G1 X60.405 Y191.565 E.01639
G1 X58.915 Y190.075 E.06476
G1 X58.915 Y189.541 E.01639
G1 X60.938 Y191.565 E.08794
G1 X61.471 Y191.565 E.01639
M73 P28 R47
G1 X58.915 Y189.008 E.11112
G1 X58.915 Y188.475 E.01639
G1 X62.005 Y191.565 E.13429
G1 X62.538 Y191.565 E.01639
G1 X58.915 Y187.941 E.15747
G1 X58.915 Y187.408 E.01639
G1 X63.071 Y191.565 E.18065
G1 X63.605 Y191.565 E.01639
G1 X58.915 Y186.875 E.20383
G1 X58.915 Y186.341 E.01639
G1 X64.138 Y191.565 E.22701
G1 X64.671 Y191.565 E.01639
G1 X58.915 Y185.808 E.25019
G1 X58.915 Y185.275 E.01639
G1 X65.205 Y191.565 E.27336
G1 X65.738 Y191.565 E.01639
G1 X58.915 Y184.741 E.29654
G1 X58.915 Y184.208 E.01639
G1 X66.271 Y191.565 E.31972
G1 X66.805 Y191.565 E.01639
G1 X58.915 Y183.675 E.3429
G1 X58.915 Y183.141 E.01639
G1 X67.338 Y191.565 E.36608
G1 X67.871 Y191.565 E.01639
G1 X58.915 Y182.608 E.38925
G1 X58.915 Y182.075 E.01639
G1 X68.405 Y191.565 E.41243
G1 X68.938 Y191.565 E.01639
G1 X58.915 Y181.541 E.43561
G1 X58.915 Y181.008 E.01639
G1 X69.471 Y191.565 E.45879
G1 X70.005 Y191.565 E.01639
G1 X58.915 Y180.475 E.48197
G1 X58.915 Y179.941 E.01639
G1 X70.538 Y191.565 E.50514
G1 X71.071 Y191.565 E.01639
G1 X58.915 Y179.408 E.52832
G1 X58.915 Y178.875 E.01639
G1 X71.605 Y191.565 E.5515
G1 X72.138 Y191.565 E.01639
G1 X58.915 Y178.341 E.57468
G1 X58.915 Y177.808 E.01639
G1 X72.671 Y191.565 E.59786
G1 X73.205 Y191.565 E.01639
G1 X58.915 Y177.275 E.62103
G1 X58.915 Y176.741 E.01639
G1 X73.738 Y191.565 E.64421
G1 X74.271 Y191.565 E.01639
G1 X58.915 Y176.208 E.66739
G1 X58.915 Y175.675 E.01639
G1 X74.804 Y191.565 E.69057
G1 X75.338 Y191.565 E.01639
G1 X58.915 Y175.141 E.71375
G1 X58.915 Y174.608 E.01639
G1 X75.871 Y191.565 E.73692
G1 X76.404 Y191.565 E.01639
G1 X58.915 Y174.075 E.7601
G1 X58.915 Y173.541 E.01639
G1 X76.938 Y191.565 E.78328
G1 X77.471 Y191.565 E.01639
G1 X58.915 Y173.008 E.80646
G1 X58.915 Y172.475 E.01639
G1 X78.004 Y191.565 E.82964
G1 X78.538 Y191.565 E.01639
G1 X58.915 Y171.941 E.85281
G1 X58.915 Y171.408 E.01639
G1 X79.071 Y191.565 E.87599
G1 X79.604 Y191.565 E.01639
G1 X58.915 Y170.875 E.89917
G1 X58.915 Y170.341 E.01639
G1 X80.138 Y191.565 E.92235
G1 X80.671 Y191.565 E.01639
G1 X58.915 Y169.808 E.94553
G1 X58.915 Y169.275 E.01639
G1 X81.204 Y191.565 E.9687
G1 X81.738 Y191.565 E.01639
G1 X58.915 Y168.741 E.99188
G1 X58.915 Y168.208 E.01639
G1 X82.271 Y191.565 E1.01506
G1 X82.804 Y191.565 E.01639
G1 X58.915 Y167.675 E1.03824
G1 X58.915 Y167.141 E.01639
G1 X83.338 Y191.565 E1.06142
G1 X83.871 Y191.565 E.01639
G1 X58.915 Y166.608 E1.0846
G1 X58.915 Y166.075 E.01639
G1 X84.404 Y191.565 E1.10777
G1 X84.938 Y191.565 E.01639
G1 X58.915 Y165.541 E1.13095
G1 X58.915 Y165.008 E.01639
G1 X85.471 Y191.565 E1.15413
G1 X86.004 Y191.565 E.01639
G1 X58.915 Y164.475 E1.17731
G1 X58.915 Y163.942 E.01639
G1 X86.538 Y191.565 E1.20049
G1 X87.071 Y191.565 E.01639
G1 X58.915 Y163.408 E1.22366
G1 X58.915 Y162.875 E.01639
G1 X87.604 Y191.565 E1.24684
G1 X88.138 Y191.565 E.01639
G1 X58.915 Y162.342 E1.27002
G1 X58.915 Y161.808 E.01639
G1 X88.671 Y191.565 E1.2932
G1 X89.204 Y191.565 E.01639
G1 X58.915 Y161.275 E1.31638
G1 X58.915 Y160.742 E.01639
G1 X89.738 Y191.565 E1.33955
G1 X90.271 Y191.565 E.01639
G1 X58.915 Y160.208 E1.36273
G1 X58.915 Y159.675 E.01639
G1 X90.804 Y191.565 E1.38591
G1 X91.338 Y191.565 E.01639
G1 X58.915 Y159.142 E1.40909
G1 X58.915 Y158.608 E.01639
G1 X91.871 Y191.565 E1.43227
G1 X92.404 Y191.565 E.01639
G1 X58.915 Y158.075 E1.45544
G1 X58.915 Y157.542 E.01639
G1 X92.938 Y191.565 E1.47862
G1 X93.471 Y191.565 E.01639
G1 X58.915 Y157.008 E1.5018
G1 X58.915 Y156.475 E.01639
G1 X94.004 Y191.565 E1.52498
G1 X94.538 Y191.565 E.01639
G1 X58.915 Y155.942 E1.54816
G1 X58.915 Y155.408 E.01639
G1 X95.071 Y191.565 E1.57133
G1 X95.604 Y191.565 E.01639
G1 X58.915 Y154.875 E1.59451
G1 X58.915 Y154.342 E.01639
G1 X96.138 Y191.565 E1.61769
G1 X96.671 Y191.565 E.01639
G1 X58.915 Y153.808 E1.64087
G1 X58.915 Y153.275 E.01639
G1 X97.204 Y191.565 E1.66405
G1 X97.738 Y191.565 E.01639
G1 X58.915 Y152.742 E1.68722
G1 X58.915 Y152.208 E.01639
G1 X98.271 Y191.565 E1.7104
G1 X98.804 Y191.565 E.01639
G1 X58.915 Y151.675 E1.73358
G1 X58.915 Y151.142 E.01639
G1 X99.338 Y191.565 E1.75676
G1 X99.871 Y191.565 E.01639
G1 X58.915 Y150.608 E1.77994
G1 X58.915 Y150.075 E.01639
G1 X100.404 Y191.565 E1.80311
G1 X100.938 Y191.565 E.01639
G1 X58.915 Y149.542 E1.82629
G1 X58.915 Y149.008 E.01639
G1 X101.471 Y191.565 E1.84947
G1 X102.004 Y191.565 E.01639
G1 X58.915 Y148.475 E1.87265
G1 X58.915 Y147.942 E.01639
G1 X102.537 Y191.565 E1.89583
G1 X103.071 Y191.565 E.01639
G1 X58.915 Y147.408 E1.91901
G1 X58.915 Y146.875 E.01639
G1 X103.604 Y191.565 E1.94218
G1 X104.137 Y191.565 E.01639
G1 X58.915 Y146.342 E1.96536
G1 X58.915 Y145.808 E.01639
G1 X104.671 Y191.565 E1.98854
G1 X105.204 Y191.565 E.01639
G1 X58.915 Y145.275 E2.01172
G1 X58.915 Y144.742 E.01639
G1 X105.737 Y191.565 E2.0349
G1 X106.271 Y191.565 E.01639
G1 X58.915 Y144.208 E2.05807
G1 X58.915 Y143.675 E.01639
G1 X106.804 Y191.565 E2.08125
G1 X107.337 Y191.565 E.01639
G1 X58.915 Y143.142 E2.10443
G1 X58.915 Y142.608 E.01639
G1 X107.871 Y191.565 E2.12761
G1 X108.404 Y191.565 E.01639
G1 X58.915 Y142.075 E2.15079
G1 X58.915 Y141.542 E.01639
G1 X108.937 Y191.565 E2.17396
G1 X109.471 Y191.565 E.01639
G1 X58.915 Y141.008 E2.19714
G1 X58.915 Y140.475 E.01639
G1 X110.004 Y191.565 E2.22032
G1 X110.537 Y191.565 E.01639
G1 X58.915 Y139.942 E2.2435
G1 X58.915 Y139.408 E.01639
G1 X111.071 Y191.565 E2.26668
G1 X111.604 Y191.565 E.01639
G1 X58.915 Y138.875 E2.28985
G1 X58.915 Y138.342 E.01639
G1 X112.137 Y191.565 E2.31303
G1 X112.671 Y191.565 E.01639
G1 X58.915 Y137.808 E2.33621
G1 X58.915 Y137.275 E.01639
G1 X113.204 Y191.565 E2.35939
G1 X113.737 Y191.565 E.01639
G1 X58.915 Y136.742 E2.38257
G1 X58.915 Y136.209 E.01639
G1 X114.271 Y191.565 E2.40574
G1 X114.804 Y191.565 E.01639
G1 X58.915 Y135.675 E2.42892
G1 X58.915 Y135.142 E.01639
G1 X115.337 Y191.565 E2.4521
G1 X115.871 Y191.565 E.01639
G1 X58.915 Y134.609 E2.47528
G1 X58.915 Y134.075 E.01639
G1 X116.404 Y191.565 E2.49846
G1 X116.937 Y191.565 E.01639
G1 X58.915 Y133.542 E2.52163
G1 X58.915 Y133.009 E.01639
G1 X117.471 Y191.565 E2.54481
G1 X118.004 Y191.565 E.01639
G1 X58.915 Y132.475 E2.56799
G1 X58.915 Y131.942 E.01639
G1 X118.537 Y191.565 E2.59117
G1 X119.071 Y191.565 E.01639
G1 X58.915 Y131.409 E2.61435
G1 X58.915 Y130.875 E.01639
G1 X119.604 Y191.565 E2.63752
G1 X120.137 Y191.565 E.01639
G1 X58.915 Y130.342 E2.6607
G1 X58.915 Y129.809 E.01639
G1 X120.671 Y191.565 E2.68388
G1 X121.204 Y191.565 E.01639
G1 X58.915 Y129.275 E2.70706
G1 X58.915 Y128.742 E.01639
G1 X121.737 Y191.565 E2.73024
G1 X122.271 Y191.565 E.01639
G1 X58.915 Y128.209 E2.75341
G1 X58.915 Y127.675 E.01639
G1 X122.804 Y191.565 E2.77659
M73 P28 R46
G1 X123.337 Y191.565 E.01639
G1 X58.915 Y127.142 E2.79977
G1 X58.915 Y126.609 E.01639
G1 X123.871 Y191.565 E2.82295
G1 X124.404 Y191.565 E.01639
G1 X58.915 Y126.075 E2.84613
G1 X58.915 Y125.542 E.01639
G1 X124.937 Y191.565 E2.86931
G1 X125.471 Y191.565 E.01639
G1 X58.915 Y125.009 E2.89248
G1 X58.915 Y124.475 E.01639
G1 X126.004 Y191.565 E2.91566
G1 X126.537 Y191.565 E.01639
G1 X58.915 Y123.942 E2.93884
G1 X58.915 Y123.409 E.01639
G1 X127.071 Y191.565 E2.96202
G1 X127.604 Y191.565 E.01639
G1 X58.915 Y122.875 E2.9852
G1 X58.915 Y122.342 E.01639
G1 X128.137 Y191.565 E3.00837
G1 X128.671 Y191.565 E.01639
G1 X58.915 Y121.809 E3.03155
G1 X58.915 Y121.275 E.01639
G1 X129.204 Y191.565 E3.05473
G1 X129.737 Y191.565 E.01639
G1 X58.915 Y120.742 E3.07791
G1 X58.915 Y120.209 E.01639
G1 X130.27 Y191.565 E3.10109
G1 X130.804 Y191.565 E.01639
G1 X58.915 Y119.675 E3.12426
G1 X58.915 Y119.142 E.01639
G1 X131.337 Y191.565 E3.14744
G1 X131.87 Y191.565 E.01639
G1 X58.915 Y118.609 E3.17062
G1 X58.915 Y118.075 E.01639
G1 X132.404 Y191.565 E3.1938
G1 X132.937 Y191.565 E.01639
G1 X58.915 Y117.542 E3.21698
G1 X58.915 Y117.009 E.01639
G1 X133.47 Y191.565 E3.24015
G1 X134.004 Y191.565 E.01639
G1 X58.915 Y116.475 E3.26333
G1 X58.915 Y115.942 E.01639
G1 X134.537 Y191.565 E3.28651
G1 X135.07 Y191.565 E.01639
G1 X58.915 Y115.409 E3.30969
G1 X58.915 Y114.875 E.01639
G1 X135.604 Y191.565 E3.33287
G1 X136.137 Y191.565 E.01639
G1 X58.915 Y114.342 E3.35604
G1 X58.915 Y113.809 E.01639
G1 X136.67 Y191.565 E3.37922
G1 X137.204 Y191.565 E.01639
G1 X58.915 Y113.275 E3.4024
G1 X58.915 Y112.742 E.01639
G1 X137.737 Y191.565 E3.42558
G1 X138.27 Y191.565 E.01639
G1 X58.915 Y112.209 E3.44876
G1 X58.915 Y111.675 E.01639
G1 X138.804 Y191.565 E3.47193
G1 X139.337 Y191.565 E.01639
G1 X58.915 Y111.142 E3.49511
G1 X58.915 Y110.609 E.01639
G1 X139.87 Y191.565 E3.51829
G1 X140.404 Y191.565 E.01639
G1 X58.915 Y110.075 E3.54147
G1 X58.915 Y109.542 E.01639
G1 X140.937 Y191.565 E3.56465
G1 X141.47 Y191.565 E.01639
G1 X58.915 Y109.009 E3.58782
G1 X58.915 Y108.476 E.01639
G1 X142.004 Y191.565 E3.611
G1 X142.537 Y191.565 E.01639
G1 X58.915 Y107.942 E3.63418
G1 X58.915 Y107.409 E.01639
G1 X143.07 Y191.565 E3.65736
G1 X143.604 Y191.565 E.01639
G1 X58.915 Y106.876 E3.68054
M73 P29 R46
G1 X58.915 Y106.342 E.01639
G1 X144.137 Y191.565 E3.70372
G1 X144.67 Y191.565 E.01639
G1 X58.915 Y105.809 E3.72689
G1 X58.915 Y105.276 E.01639
G1 X145.204 Y191.565 E3.75007
G1 X145.737 Y191.565 E.01639
G1 X58.915 Y104.742 E3.77325
G1 X58.915 Y104.209 E.01639
G1 X146.27 Y191.565 E3.79643
G1 X146.804 Y191.565 E.01639
G1 X58.915 Y103.676 E3.81961
G1 X58.915 Y103.142 E.01639
G1 X147.337 Y191.565 E3.84278
G1 X147.87 Y191.565 E.01639
G1 X58.915 Y102.609 E3.86596
G1 X58.915 Y102.076 E.01639
G1 X148.404 Y191.565 E3.88914
G1 X148.937 Y191.565 E.01639
G1 X58.915 Y101.542 E3.91232
G1 X58.915 Y101.009 E.01639
G1 X149.47 Y191.565 E3.9355
G1 X150.004 Y191.565 E.01639
G1 X58.915 Y100.476 E3.95867
G1 X58.915 Y99.942 E.01639
G1 X150.537 Y191.565 E3.98185
G1 X151.07 Y191.565 E.01639
G1 X58.915 Y99.409 E4.00503
G1 X58.915 Y98.876 E.01639
G1 X151.604 Y191.565 E4.02821
G1 X152.137 Y191.565 E.01639
G1 X58.915 Y98.342 E4.05139
G1 X58.915 Y97.809 E.01639
G1 X152.67 Y191.565 E4.07456
G1 X153.204 Y191.565 E.01639
G1 X58.915 Y97.276 E4.09774
G1 X58.915 Y96.742 E.01639
G1 X153.737 Y191.565 E4.12092
G1 X154.27 Y191.565 E.01639
G1 X58.915 Y96.209 E4.1441
G1 X58.915 Y95.676 E.01639
G1 X154.804 Y191.565 E4.16728
G1 X155.337 Y191.565 E.01639
G1 X58.915 Y95.142 E4.19045
G1 X58.915 Y94.609 E.01639
G1 X155.87 Y191.565 E4.21363
G1 X156.403 Y191.565 E.01639
G1 X58.915 Y94.076 E4.23681
G1 X58.915 Y93.542 E.01639
G1 X156.937 Y191.565 E4.25999
G1 X157.47 Y191.565 E.01639
G1 X58.915 Y93.009 E4.28317
G1 X58.915 Y92.476 E.01639
G1 X158.003 Y191.565 E4.30634
G1 X158.537 Y191.565 E.01639
G1 X58.915 Y91.942 E4.32952
G1 X58.915 Y91.409 E.01639
G1 X159.07 Y191.565 E4.3527
G1 X159.603 Y191.565 E.01639
G1 X58.915 Y90.876 E4.37588
G1 X58.915 Y90.342 E.01639
G1 X160.137 Y191.565 E4.39906
G1 X160.67 Y191.565 E.01639
G1 X58.915 Y89.809 E4.42223
G1 X58.915 Y89.276 E.01639
G1 X161.203 Y191.565 E4.44541
G1 X161.737 Y191.565 E.01639
G1 X58.915 Y88.742 E4.46859
G1 X58.915 Y88.209 E.01639
G1 X162.27 Y191.565 E4.49177
G1 X162.803 Y191.565 E.01639
G1 X58.915 Y87.676 E4.51495
G1 X58.915 Y87.142 E.01639
G1 X163.337 Y191.565 E4.53813
G1 X163.87 Y191.565 E.01639
G1 X58.915 Y86.609 E4.5613
G1 X58.915 Y86.076 E.01639
G1 X164.403 Y191.565 E4.58448
G1 X164.937 Y191.565 E.01639
G1 X58.915 Y85.542 E4.60766
G1 X58.915 Y85.009 E.01639
G1 X165.47 Y191.565 E4.63084
G1 X166.003 Y191.565 E.01639
G1 X58.915 Y84.476 E4.65402
G1 X58.915 Y83.942 E.01639
G1 X166.537 Y191.565 E4.67719
G1 X167.07 Y191.565 E.01639
G1 X58.915 Y83.409 E4.70037
G1 X58.915 Y82.876 E.01639
G1 X167.603 Y191.565 E4.72355
G1 X168.137 Y191.565 E.01639
G1 X58.915 Y82.342 E4.74673
G1 X58.915 Y81.809 E.01639
G1 X168.67 Y191.565 E4.76991
G1 X169.203 Y191.565 E.01639
G1 X58.915 Y81.276 E4.79308
G1 X58.915 Y80.743 E.01639
G1 X169.737 Y191.565 E4.81626
G1 X170.27 Y191.565 E.01639
G1 X58.915 Y80.209 E4.83944
G1 X58.915 Y79.676 E.01639
G1 X170.803 Y191.565 E4.86262
G1 X171.337 Y191.565 E.01639
G1 X58.915 Y79.143 E4.8858
G1 X58.915 Y78.609 E.01639
G1 X171.87 Y191.565 E4.90897
G1 X172.403 Y191.565 E.01639
G1 X58.915 Y78.076 E4.93215
G1 X58.915 Y77.543 E.01639
G1 X172.937 Y191.565 E4.95533
G1 X173.47 Y191.565 E.01639
G1 X58.915 Y77.009 E4.97851
G1 X58.915 Y76.476 E.01639
G1 X174.003 Y191.565 E5.00169
G1 X174.537 Y191.565 E.01639
G1 X58.915 Y75.943 E5.02486
G1 X58.915 Y75.409 E.01639
G1 X175.07 Y191.565 E5.04804
G1 X175.603 Y191.565 E.01639
G1 X58.915 Y74.876 E5.07122
G1 X58.915 Y74.343 E.01639
G1 X176.137 Y191.565 E5.0944
G1 X176.67 Y191.565 E.01639
G1 X58.915 Y73.809 E5.11758
G1 X58.915 Y73.276 E.01639
G1 X177.203 Y191.565 E5.14075
G1 X177.737 Y191.565 E.01639
G1 X58.915 Y72.743 E5.16393
G1 X58.915 Y72.209 E.01639
G1 X178.27 Y191.565 E5.18711
G1 X178.803 Y191.565 E.01639
G1 X58.915 Y71.676 E5.21029
G1 X58.915 Y71.143 E.01639
G1 X179.337 Y191.565 E5.23347
G1 X179.87 Y191.565 E.01639
G1 X58.915 Y70.609 E5.25664
G1 X58.915 Y70.076 E.01639
G1 X180.403 Y191.565 E5.27982
G1 X180.937 Y191.565 E.01639
G1 X58.915 Y69.543 E5.303
G1 X58.915 Y69.009 E.01639
G1 X181.47 Y191.565 E5.32618
G1 X182.003 Y191.565 E.01639
G1 X58.915 Y68.476 E5.34936
G1 X58.915 Y67.943 E.01639
G1 X182.537 Y191.565 E5.37253
M73 P30 R46
G1 X183.07 Y191.565 E.01639
G1 X58.915 Y67.409 E5.39571
G1 X58.915 Y66.876 E.01639
G1 X183.603 Y191.565 E5.41889
G1 X184.136 Y191.565 E.01639
G1 X58.915 Y66.343 E5.44207
G1 X58.915 Y65.809 E.01639
G1 X184.67 Y191.565 E5.46525
G1 X185.203 Y191.565 E.01639
G1 X58.915 Y65.276 E5.48843
G1 X58.915 Y64.743 E.01639
G1 X185.736 Y191.565 E5.5116
G1 X186.27 Y191.565 E.01639
G1 X59.14 Y64.435 E5.52496
G1 X59.674 Y64.435 E.01639
G1 X186.803 Y191.565 E5.52496
M73 P30 R45
G1 X187.336 Y191.565 E.01639
G1 X60.207 Y64.435 E5.52496
G1 X60.74 Y64.435 E.01639
G1 X187.87 Y191.565 E5.52496
G1 X188.403 Y191.565 E.01639
G1 X61.274 Y64.435 E5.52496
G1 X61.807 Y64.435 E.01639
G1 X188.936 Y191.565 E5.52496
G1 X189.47 Y191.565 E.01639
G1 X62.34 Y64.435 E5.52496
G1 X62.874 Y64.435 E.01639
G1 X190.003 Y191.565 E5.52496
G1 X190.536 Y191.565 E.01639
G1 X63.407 Y64.435 E5.52496
G1 X63.94 Y64.435 E.01639
G1 X191.07 Y191.565 E5.52496
G1 X191.603 Y191.565 E.01639
G1 X64.474 Y64.435 E5.52496
G1 X65.007 Y64.435 E.01639
G1 X192.136 Y191.565 E5.52496
G1 X192.67 Y191.565 E.01639
G1 X65.54 Y64.435 E5.52496
G1 X66.074 Y64.435 E.01639
G1 X193.203 Y191.565 E5.52496
G1 X193.428 Y191.565 E.00693
G1 X193.428 Y191.257 E.00946
G1 X66.607 Y64.435 E5.51158
G1 X67.14 Y64.435 E.01639
G1 X193.428 Y190.723 E5.4884
G1 X193.428 Y190.19 E.01639
G1 X67.674 Y64.435 E5.46523
G1 X68.207 Y64.435 E.01639
G1 X193.428 Y189.657 E5.44205
G1 X193.428 Y189.123 E.01639
G1 X68.74 Y64.435 E5.41887
G1 X69.274 Y64.435 E.01639
G1 X193.428 Y188.59 E5.39569
G1 X193.428 Y188.057 E.01639
G1 X69.807 Y64.435 E5.37251
G1 X70.34 Y64.435 E.01639
G1 X193.428 Y187.523 E5.34933
G1 X193.428 Y186.99 E.01639
G1 X70.874 Y64.435 E5.32616
G1 X71.407 Y64.435 E.01639
G1 X193.428 Y186.457 E5.30298
G1 X193.428 Y185.924 E.01639
G1 X71.94 Y64.435 E5.2798
G1 X72.474 Y64.435 E.01639
G1 X193.428 Y185.39 E5.25662
G1 X193.428 Y184.857 E.01639
G1 X73.007 Y64.435 E5.23344
G1 X73.54 Y64.435 E.01639
G1 X193.428 Y184.324 E5.21027
G1 X193.428 Y183.79 E.01639
G1 X74.074 Y64.435 E5.18709
G1 X74.607 Y64.435 E.01639
G1 X193.428 Y183.257 E5.16391
G1 X193.428 Y182.724 E.01639
G1 X75.14 Y64.435 E5.14073
G1 X75.674 Y64.435 E.01639
G1 X193.428 Y182.19 E5.11755
G1 X193.428 Y181.657 E.01639
G1 X76.207 Y64.435 E5.09438
G1 X76.74 Y64.435 E.01639
G1 X193.428 Y181.124 E5.0712
G1 X193.428 Y180.59 E.01639
G1 X77.274 Y64.435 E5.04802
G1 X77.807 Y64.435 E.01639
G1 X193.428 Y180.057 E5.02484
G1 X193.428 Y179.524 E.01639
G1 X78.34 Y64.435 E5.00166
G1 X78.874 Y64.435 E.01639
G1 X193.428 Y178.99 E4.97849
G1 X193.428 Y178.457 E.01639
G1 X79.407 Y64.435 E4.95531
G1 X79.94 Y64.435 E.01639
G1 X193.428 Y177.924 E4.93213
G1 X193.428 Y177.39 E.01639
G1 X80.474 Y64.435 E4.90895
G1 X81.007 Y64.435 E.01639
G1 X193.428 Y176.857 E4.88577
G1 X193.428 Y176.324 E.01639
G1 X81.54 Y64.435 E4.8626
G1 X82.074 Y64.435 E.01639
G1 X193.428 Y175.79 E4.83942
G1 X193.428 Y175.257 E.01639
G1 X82.607 Y64.435 E4.81624
G1 X83.14 Y64.435 E.01639
G1 X193.428 Y174.724 E4.79306
G1 X193.428 Y174.19 E.01639
G1 X83.674 Y64.435 E4.76988
G1 X84.207 Y64.435 E.01639
G1 X193.428 Y173.657 E4.74671
M73 P31 R45
G1 X193.428 Y173.124 E.01639
G1 X84.74 Y64.435 E4.72353
G1 X85.274 Y64.435 E.01639
G1 X193.428 Y172.59 E4.70035
G1 X193.428 Y172.057 E.01639
G1 X85.807 Y64.435 E4.67717
G1 X86.34 Y64.435 E.01639
G1 X193.428 Y171.524 E4.65399
G1 X193.428 Y170.99 E.01639
G1 X86.873 Y64.435 E4.63082
G1 X87.407 Y64.435 E.01639
G1 X193.428 Y170.457 E4.60764
G1 X193.428 Y169.924 E.01639
G1 X87.94 Y64.435 E4.58446
G1 X88.473 Y64.435 E.01639
G1 X193.428 Y169.39 E4.56128
G1 X193.428 Y168.857 E.01639
G1 X89.007 Y64.435 E4.5381
G1 X89.54 Y64.435 E.01639
G1 X193.428 Y168.324 E4.51492
G1 X193.428 Y167.79 E.01639
G1 X90.073 Y64.435 E4.49175
G1 X90.607 Y64.435 E.01639
G1 X193.428 Y167.257 E4.46857
G1 X193.428 Y166.724 E.01639
G1 X91.14 Y64.435 E4.44539
G1 X91.673 Y64.435 E.01639
G1 X193.428 Y166.19 E4.42221
G1 X193.428 Y165.657 E.01639
G1 X92.207 Y64.435 E4.39903
G1 X92.74 Y64.435 E.01639
G1 X193.428 Y165.124 E4.37586
G1 X193.428 Y164.59 E.01639
G1 X93.273 Y64.435 E4.35268
G1 X93.807 Y64.435 E.01639
G1 X193.428 Y164.057 E4.3295
G1 X193.428 Y163.524 E.01639
G1 X94.34 Y64.435 E4.30632
G1 X94.873 Y64.435 E.01639
G1 X193.428 Y162.99 E4.28314
G1 X193.428 Y162.457 E.01639
G1 X95.407 Y64.435 E4.25997
G1 X95.94 Y64.435 E.01639
G1 X193.428 Y161.924 E4.23679
G1 X193.428 Y161.39 E.01639
G1 X96.473 Y64.435 E4.21361
G1 X97.007 Y64.435 E.01639
G1 X193.428 Y160.857 E4.19043
G1 X193.428 Y160.324 E.01639
G1 X97.54 Y64.435 E4.16725
G1 X98.073 Y64.435 E.01639
G1 X193.428 Y159.79 E4.14408
G1 X193.428 Y159.257 E.01639
G1 X98.607 Y64.435 E4.1209
G1 X99.14 Y64.435 E.01639
G1 X193.428 Y158.724 E4.09772
G1 X193.428 Y158.191 E.01639
G1 X99.673 Y64.435 E4.07454
G1 X100.207 Y64.435 E.01639
G1 X193.428 Y157.657 E4.05136
G1 X193.428 Y157.124 E.01639
G1 X100.74 Y64.435 E4.02819
G1 X101.273 Y64.435 E.01639
G1 X193.428 Y156.591 E4.00501
G1 X193.428 Y156.057 E.01639
G1 X101.807 Y64.435 E3.98183
G1 X102.34 Y64.435 E.01639
G1 X193.428 Y155.524 E3.95865
G1 X193.428 Y154.991 E.01639
G1 X102.873 Y64.435 E3.93547
G1 X103.407 Y64.435 E.01639
G1 X193.428 Y154.457 E3.9123
G1 X193.428 Y153.924 E.01639
G1 X103.94 Y64.435 E3.88912
G1 X104.473 Y64.435 E.01639
G1 X193.428 Y153.391 E3.86594
G1 X193.428 Y152.857 E.01639
G1 X105.007 Y64.435 E3.84276
M73 P31 R44
G1 X105.54 Y64.435 E.01639
G1 X193.428 Y152.324 E3.81958
G1 X193.428 Y151.791 E.01639
G1 X106.073 Y64.435 E3.79641
G1 X106.607 Y64.435 E.01639
G1 X193.428 Y151.257 E3.77323
G1 X193.428 Y150.724 E.01639
G1 X107.14 Y64.435 E3.75005
G1 X107.673 Y64.435 E.01639
G1 X193.428 Y150.191 E3.72687
G1 X193.428 Y149.657 E.01639
G1 X108.207 Y64.435 E3.70369
G1 X108.74 Y64.435 E.01639
G1 X193.428 Y149.124 E3.68051
G1 X193.428 Y148.591 E.01639
G1 X109.273 Y64.435 E3.65734
G1 X109.807 Y64.435 E.01639
G1 X193.428 Y148.057 E3.63416
G1 X193.428 Y147.524 E.01639
G1 X110.34 Y64.435 E3.61098
G1 X110.873 Y64.435 E.01639
G1 X193.428 Y146.991 E3.5878
G1 X193.428 Y146.457 E.01639
G1 X111.407 Y64.435 E3.56462
G1 X111.94 Y64.435 E.01639
G1 X193.428 Y145.924 E3.54145
G1 X193.428 Y145.391 E.01639
G1 X112.473 Y64.435 E3.51827
G1 X113.006 Y64.435 E.01639
G1 X193.428 Y144.857 E3.49509
G1 X193.428 Y144.324 E.01639
G1 X113.54 Y64.435 E3.47191
G1 X114.073 Y64.435 E.01639
G1 X193.428 Y143.791 E3.44873
G1 X193.428 Y143.257 E.01639
G1 X114.606 Y64.435 E3.42556
G1 X115.14 Y64.435 E.01639
G1 X193.428 Y142.724 E3.40238
G1 X193.428 Y142.191 E.01639
G1 X115.673 Y64.435 E3.3792
G1 X116.206 Y64.435 E.01639
G1 X193.428 Y141.657 E3.35602
G1 X193.428 Y141.124 E.01639
G1 X116.74 Y64.435 E3.33284
G1 X117.273 Y64.435 E.01639
G1 X193.428 Y140.591 E3.30967
M73 P32 R44
G1 X193.428 Y140.057 E.01639
G1 X117.806 Y64.435 E3.28649
G1 X118.34 Y64.435 E.01639
G1 X193.428 Y139.524 E3.26331
G1 X193.428 Y138.991 E.01639
G1 X118.873 Y64.435 E3.24013
G1 X119.406 Y64.435 E.01639
G1 X193.428 Y138.457 E3.21695
G1 X193.428 Y137.924 E.01639
G1 X119.94 Y64.435 E3.19378
G1 X120.473 Y64.435 E.01639
G1 X193.428 Y137.391 E3.1706
G1 X193.428 Y136.857 E.01639
G1 X121.006 Y64.435 E3.14742
G1 X121.54 Y64.435 E.01639
G1 X193.428 Y136.324 E3.12424
G1 X193.428 Y135.791 E.01639
G1 X122.073 Y64.435 E3.10106
G1 X122.606 Y64.435 E.01639
G1 X193.428 Y135.257 E3.07789
G1 X193.428 Y134.724 E.01639
G1 X123.14 Y64.435 E3.05471
G1 X123.673 Y64.435 E.01639
G1 X193.428 Y134.191 E3.03153
G1 X193.428 Y133.657 E.01639
G1 X124.206 Y64.435 E3.00835
G1 X124.74 Y64.435 E.01639
G1 X193.428 Y133.124 E2.98517
G1 X193.428 Y132.591 E.01639
G1 X125.273 Y64.435 E2.962
G1 X125.806 Y64.435 E.01639
G1 X193.428 Y132.058 E2.93882
G1 X193.428 Y131.524 E.01639
G1 X126.34 Y64.435 E2.91564
G1 X126.873 Y64.435 E.01639
G1 X193.428 Y130.991 E2.89246
G1 X193.428 Y130.458 E.01639
G1 X127.406 Y64.435 E2.86928
G1 X127.94 Y64.435 E.01639
G1 X193.428 Y129.924 E2.84611
G1 X193.428 Y129.391 E.01639
G1 X128.473 Y64.435 E2.82293
G1 X129.006 Y64.435 E.01639
G1 X193.428 Y128.858 E2.79975
G1 X193.428 Y128.324 E.01639
G1 X129.54 Y64.435 E2.77657
G1 X130.073 Y64.435 E.01639
G1 X193.428 Y127.791 E2.75339
G1 X193.428 Y127.258 E.01639
G1 X130.606 Y64.435 E2.73021
G1 X131.14 Y64.435 E.01639
G1 X193.428 Y126.724 E2.70704
G1 X193.428 Y126.191 E.01639
G1 X131.673 Y64.435 E2.68386
G1 X132.206 Y64.435 E.01639
G1 X193.428 Y125.658 E2.66068
G1 X193.428 Y125.124 E.01639
G1 X132.74 Y64.435 E2.6375
G1 X133.273 Y64.435 E.01639
G1 X193.428 Y124.591 E2.61432
G1 X193.428 Y124.058 E.01639
G1 X133.806 Y64.435 E2.59115
G1 X134.34 Y64.435 E.01639
G1 X193.428 Y123.524 E2.56797
G1 X193.428 Y122.991 E.01639
G1 X134.873 Y64.435 E2.54479
G1 X135.406 Y64.435 E.01639
G1 X193.428 Y122.458 E2.52161
G1 X193.428 Y121.924 E.01639
G1 X135.94 Y64.435 E2.49843
G1 X136.473 Y64.435 E.01639
G1 X193.428 Y121.391 E2.47526
G1 X193.428 Y120.858 E.01639
G1 X137.006 Y64.435 E2.45208
G1 X137.54 Y64.435 E.01639
G1 X193.428 Y120.324 E2.4289
G1 X193.428 Y119.791 E.01639
G1 X138.073 Y64.435 E2.40572
G1 X138.606 Y64.435 E.01639
G1 X193.428 Y119.258 E2.38254
G1 X193.428 Y118.724 E.01639
G1 X139.14 Y64.435 E2.35937
G1 X139.673 Y64.435 E.01639
G1 X193.428 Y118.191 E2.33619
G1 X193.428 Y117.658 E.01639
G1 X140.206 Y64.435 E2.31301
G1 X140.739 Y64.435 E.01639
G1 X193.428 Y117.124 E2.28983
G1 X193.428 Y116.591 E.01639
G1 X141.273 Y64.435 E2.26665
G1 X141.806 Y64.435 E.01639
G1 X193.428 Y116.058 E2.24348
G1 X193.428 Y115.524 E.01639
G1 X142.339 Y64.435 E2.2203
G1 X142.873 Y64.435 E.01639
G1 X193.428 Y114.991 E2.19712
G1 X193.428 Y114.458 E.01639
G1 X143.406 Y64.435 E2.17394
G1 X143.939 Y64.435 E.01639
G1 X193.428 Y113.924 E2.15076
G1 X193.428 Y113.391 E.01639
G1 X144.473 Y64.435 E2.12759
G1 X145.006 Y64.435 E.01639
G1 X193.428 Y112.858 E2.10441
G1 X193.428 Y112.324 E.01639
G1 X145.539 Y64.435 E2.08123
G1 X146.073 Y64.435 E.01639
G1 X193.428 Y111.791 E2.05805
G1 X193.428 Y111.258 E.01639
G1 X146.606 Y64.435 E2.03487
G1 X147.139 Y64.435 E.01639
G1 X193.428 Y110.724 E2.0117
G1 X193.428 Y110.191 E.01639
G1 X147.673 Y64.435 E1.98852
G1 X148.206 Y64.435 E.01639
G1 X193.428 Y109.658 E1.96534
G1 X193.428 Y109.124 E.01639
G1 X148.739 Y64.435 E1.94216
G1 X149.273 Y64.435 E.01639
G1 X193.428 Y108.591 E1.91898
G1 X193.428 Y108.058 E.01639
G1 X149.806 Y64.435 E1.8958
G1 X150.339 Y64.435 E.01639
G1 X193.428 Y107.524 E1.87263
G1 X193.428 Y106.991 E.01639
G1 X150.873 Y64.435 E1.84945
G1 X151.406 Y64.435 E.01639
G1 X193.428 Y106.458 E1.82627
G1 X193.428 Y105.924 E.01639
G1 X151.939 Y64.435 E1.80309
G1 X152.473 Y64.435 E.01639
G1 X193.428 Y105.391 E1.77991
G1 X193.428 Y104.858 E.01639
G1 X153.006 Y64.435 E1.75674
G1 X153.539 Y64.435 E.01639
G1 X193.428 Y104.325 E1.73356
G1 X193.428 Y103.791 E.01639
G1 X154.073 Y64.435 E1.71038
G1 X154.606 Y64.435 E.01639
G1 X193.428 Y103.258 E1.6872
G1 X193.428 Y102.725 E.01639
G1 X155.139 Y64.435 E1.66402
G1 X155.673 Y64.435 E.01639
G1 X193.428 Y102.191 E1.64085
G1 X193.428 Y101.658 E.01639
G1 X156.206 Y64.435 E1.61767
G1 X156.739 Y64.435 E.01639
G1 X193.428 Y101.125 E1.59449
G1 X193.428 Y100.591 E.01639
G1 X157.273 Y64.435 E1.57131
G1 X157.806 Y64.435 E.01639
G1 X193.428 Y100.058 E1.54813
G1 X193.428 Y99.525 E.01639
G1 X158.339 Y64.435 E1.52496
G1 X158.873 Y64.435 E.01639
G1 X193.428 Y98.991 E1.50178
G1 X193.428 Y98.458 E.01639
G1 X159.406 Y64.435 E1.4786
G1 X159.939 Y64.435 E.01639
G1 X193.428 Y97.925 E1.45542
G1 X193.428 Y97.391 E.01639
G1 X160.473 Y64.435 E1.43224
G1 X161.006 Y64.435 E.01639
G1 X193.428 Y96.858 E1.40907
G1 X193.428 Y96.325 E.01639
G1 X161.539 Y64.435 E1.38589
G1 X162.073 Y64.435 E.01639
G1 X193.428 Y95.791 E1.36271
G1 X193.428 Y95.258 E.01639
G1 X162.606 Y64.435 E1.33953
G1 X163.139 Y64.435 E.01639
G1 X193.428 Y94.725 E1.31635
G1 X193.428 Y94.191 E.01639
G1 X163.673 Y64.435 E1.29318
G1 X164.206 Y64.435 E.01639
G1 X193.428 Y93.658 E1.27
G1 X193.428 Y93.125 E.01639
G1 X164.739 Y64.435 E1.24682
G1 X165.273 Y64.435 E.01639
G1 X193.428 Y92.591 E1.22364
G1 X193.428 Y92.058 E.01639
G1 X165.806 Y64.435 E1.20046
G1 X166.339 Y64.435 E.01639
G1 X193.428 Y91.525 E1.17729
G1 X193.428 Y90.991 E.01639
G1 X166.873 Y64.435 E1.15411
G1 X167.406 Y64.435 E.01639
G1 X193.428 Y90.458 E1.13093
G1 X193.428 Y89.925 E.01639
G1 X167.939 Y64.435 E1.10775
G1 X168.472 Y64.435 E.01639
G1 X193.428 Y89.391 E1.08457
G1 X193.428 Y88.858 E.01639
G1 X169.006 Y64.435 E1.06139
G1 X169.539 Y64.435 E.01639
G1 X193.428 Y88.325 E1.03822
G1 X193.428 Y87.791 E.01639
G1 X170.072 Y64.435 E1.01504
G1 X170.606 Y64.435 E.01639
G1 X193.428 Y87.258 E.99186
G1 X193.428 Y86.725 E.01639
G1 X171.139 Y64.435 E.96868
M73 P33 R44
G1 X171.672 Y64.435 E.01639
G1 X193.428 Y86.191 E.9455
G1 X193.428 Y85.658 E.01639
G1 X172.206 Y64.435 E.92233
G1 X172.739 Y64.435 E.01639
G1 X193.428 Y85.125 E.89915
G1 X193.428 Y84.591 E.01639
G1 X173.272 Y64.435 E.87597
G1 X173.806 Y64.435 E.01639
G1 X193.428 Y84.058 E.85279
G1 X193.428 Y83.525 E.01639
G1 X174.339 Y64.435 E.82961
G1 X174.872 Y64.435 E.01639
G1 X193.428 Y82.991 E.80644
G1 X193.428 Y82.458 E.01639
G1 X175.406 Y64.435 E.78326
G1 X175.939 Y64.435 E.01639
G1 X193.428 Y81.925 E.76008
G1 X193.428 Y81.391 E.01639
G1 X176.472 Y64.435 E.7369
G1 X177.006 Y64.435 E.01639
G1 X193.428 Y80.858 E.71372
G1 X193.428 Y80.325 E.01639
G1 X177.539 Y64.435 E.69055
G1 X178.072 Y64.435 E.01639
G1 X193.428 Y79.791 E.66737
G1 X193.428 Y79.258 E.01639
G1 X178.606 Y64.435 E.64419
G1 X179.139 Y64.435 E.01639
G1 X193.428 Y78.725 E.62101
G1 X193.428 Y78.191 E.01639
G1 X179.672 Y64.435 E.59783
G1 X180.206 Y64.435 E.01639
G1 X193.428 Y77.658 E.57466
G1 X193.428 Y77.125 E.01639
G1 X180.739 Y64.435 E.55148
G1 X181.272 Y64.435 E.01639
G1 X193.428 Y76.592 E.5283
G1 X193.428 Y76.058 E.01639
G1 X181.806 Y64.435 E.50512
G1 X182.339 Y64.435 E.01639
G1 X193.428 Y75.525 E.48194
G1 X193.428 Y74.992 E.01639
G1 X182.872 Y64.435 E.45877
G1 X183.406 Y64.435 E.01639
G1 X193.428 Y74.458 E.43559
G1 X193.428 Y73.925 E.01639
G1 X183.939 Y64.435 E.41241
G1 X184.472 Y64.435 E.01639
G1 X193.428 Y73.392 E.38923
G1 X193.428 Y72.858 E.01639
G1 X185.006 Y64.435 E.36605
G1 X185.539 Y64.435 E.01639
G1 X193.428 Y72.325 E.34288
G1 X193.428 Y71.792 E.01639
G1 X186.072 Y64.435 E.3197
G1 X186.606 Y64.435 E.01639
G1 X193.428 Y71.258 E.29652
G1 X193.428 Y70.725 E.01639
G1 X187.139 Y64.435 E.27334
G1 X187.672 Y64.435 E.01639
G1 X193.428 Y70.192 E.25016
G1 X193.428 Y69.658 E.01639
G1 X188.206 Y64.435 E.22699
G1 X188.739 Y64.435 E.01639
G1 X193.428 Y69.125 E.20381
G1 X193.428 Y68.592 E.01639
G1 X189.272 Y64.435 E.18063
G1 X189.806 Y64.435 E.01639
G1 X193.428 Y68.058 E.15745
G1 X193.428 Y67.525 E.01639
G1 X190.339 Y64.435 E.13427
G1 X190.872 Y64.435 E.01639
G1 X193.428 Y66.992 E.11109
G1 X193.428 Y66.458 E.01639
G1 X191.406 Y64.435 E.08792
G1 X191.939 Y64.435 E.01639
G1 X193.428 Y65.925 E.06474
M73 P33 R43
G1 X193.428 Y65.392 E.01639
G1 X192.472 Y64.435 E.04156
G1 X193.006 Y64.435 E.01639
G1 X193.598 Y65.028 E.02576
M106 S198.9
; CHANGE_LAYER
; Z_HEIGHT: 0.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X193.006 Y64.435 E-.3185
G1 X192.472 Y64.435 E-.20266
G1 X192.917 Y64.88 E-.23884
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 4/50
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
G3 Z1 I1.097 J.527 P1  F30000
G1 X193.838 Y62.961 Z1
G1 Z.8
G1 E.8 F1800
; FEATURE: Support interface
; LINE_WIDTH: 0.42
G1 F4800
G1 X193.296 Y62.961 E.01667
G1 X193.296 Y61.827 E.03485
G1 X194.027 Y61.827 E.02246
G1 X194.027 Y62.961 E.03485
G1 X194.904 Y62.961 E.02695
G1 X194.904 Y61.827 E.03485
G1 X195.781 Y61.827 E.02695
G1 X195.781 Y194.173 E4.06661
G1 X194.904 Y194.173 E.02695
G1 X194.904 Y193.039 E.03485
G1 X194.027 Y193.039 E.02695
G1 X194.027 Y194.173 E.03485
G1 X193.296 Y194.173 E.02246
G1 X193.296 Y193.039 E.03485
G1 X193.838 Y193.039 E.01667
; WIPE_START
G1 F24000
G1 X193.296 Y193.039 E-.20615
G1 X193.296 Y194.173 E-.43105
G1 X193.619 Y194.173 E-.1228
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I0 J1.217 P1  F30000
G1 X204.804 Y194.173 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Support
G1 F9000
G1 X196.55 Y194.173 E.25363
G1 X196.55 Y191.296 E.0884
G1 X204.804 Y191.296 E.25363
G1 X204.804 Y188.419 E.0884
G1 X196.55 Y188.419 E.25363
G1 X196.55 Y185.542 E.0884
G1 X204.804 Y185.542 E.25363
G1 X204.804 Y182.665 E.0884
G1 X196.55 Y182.665 E.25363
G1 X196.55 Y179.787 E.0884
G1 X204.804 Y179.787 E.25363
G1 X204.804 Y176.91 E.0884
G1 X196.55 Y176.91 E.25363
G1 X196.55 Y174.033 E.0884
G1 X204.804 Y174.033 E.25363
G1 X204.804 Y171.156 E.0884
G1 X196.55 Y171.156 E.25363
G1 X196.55 Y168.279 E.0884
G1 X204.804 Y168.279 E.25363
G1 X204.804 Y165.402 E.0884
G1 X196.55 Y165.402 E.25363
G1 X196.55 Y162.525 E.0884
G1 X204.804 Y162.525 E.25363
G1 X204.804 Y159.648 E.0884
G1 X196.55 Y159.648 E.25363
G1 X196.55 Y156.771 E.0884
G1 X204.804 Y156.771 E.25363
G1 X204.804 Y153.894 E.0884
G1 X196.55 Y153.894 E.25363
G1 X196.55 Y151.017 E.0884
G1 X204.804 Y151.017 E.25363
G1 X204.804 Y148.14 E.0884
G1 X196.55 Y148.14 E.25363
G1 X196.55 Y145.262 E.0884
G1 X204.804 Y145.262 E.25363
G1 X204.804 Y142.385 E.0884
G1 X196.55 Y142.385 E.25363
G1 X196.55 Y139.508 E.0884
G1 X204.804 Y139.508 E.25363
G1 X204.804 Y136.631 E.0884
G1 X196.55 Y136.631 E.25363
G1 X196.55 Y133.754 E.0884
G1 X204.804 Y133.754 E.25363
G1 X204.804 Y130.877 E.0884
G1 X196.55 Y130.877 E.25363
G1 X196.55 Y128 E.0884
G1 X204.804 Y128 E.25363
G1 X204.804 Y125.123 E.0884
G1 X196.55 Y125.123 E.25363
G1 X196.55 Y122.246 E.0884
G1 X204.804 Y122.246 E.25363
G1 X204.804 Y119.369 E.0884
G1 X196.55 Y119.369 E.25363
G1 X196.55 Y116.492 E.0884
G1 X204.804 Y116.492 E.25363
G1 X204.804 Y113.615 E.0884
G1 X196.55 Y113.615 E.25363
G1 X196.55 Y110.738 E.0884
G1 X204.804 Y110.738 E.25363
G1 X204.804 Y107.86 E.0884
G1 X196.55 Y107.86 E.25363
G1 X196.55 Y104.983 E.0884
G1 X204.804 Y104.983 E.25363
G1 X204.804 Y102.106 E.0884
G1 X196.55 Y102.106 E.25363
G1 X196.55 Y99.229 E.0884
G1 X204.804 Y99.229 E.25363
G1 X204.804 Y96.352 E.0884
G1 X196.55 Y96.352 E.25363
G1 X196.55 Y93.475 E.0884
G1 X204.804 Y93.475 E.25363
G1 X204.804 Y90.598 E.0884
G1 X196.55 Y90.598 E.25363
G1 X196.55 Y87.721 E.0884
G1 X204.804 Y87.721 E.25363
G1 X204.804 Y84.844 E.0884
G1 X196.55 Y84.844 E.25363
G1 X196.55 Y81.967 E.0884
G1 X204.804 Y81.967 E.25363
G1 X204.804 Y79.09 E.0884
G1 X196.55 Y79.09 E.25363
G1 X196.55 Y76.213 E.0884
G1 X204.804 Y76.213 E.25363
G1 X204.804 Y73.336 E.0884
G1 X196.55 Y73.336 E.25363
G1 X196.55 Y70.458 E.0884
G1 X204.804 Y70.458 E.25363
G1 X204.804 Y67.581 E.0884
G1 X196.55 Y67.581 E.25363
G1 X196.55 Y64.704 E.0884
G1 X204.804 Y64.704 E.25363
G1 X204.804 Y61.827 E.0884
G1 X196.55 Y61.827 E.25363
; WIPE_START
G1 F24000
G1 X198.55 Y61.827 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I-.828 J-.892 P1  F30000
G1 X58.489 Y191.898 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X58.489 Y64.102 E4.23922
G1 X194.181 Y64.102 E4.50117
G1 X194.195 Y64.102 E.00045
G1 X194.195 Y191.898 E4.23922
G1 X194.181 Y191.898 E.00045
G1 X58.549 Y191.898 E4.49918
G1 X58.097 Y192.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X58.097 Y63.71 E3.9509
G1 X58.148 Y63.71 E.00158
G1 X194.564 Y63.71 E4.19167
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X194.587 Y63.71 E.00077
G1 X194.587 Y192.29 E4.26523
G1 X194.564 Y192.29 E.00077
M106 S198.9
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X194.195 Y192.29 E.01134
G1 X58.157 Y192.29 E4.18007
M204 S10000
; WIPE_START
G1 F24000
G1 X58.156 Y190.29 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I-.595 J1.062 P1  F30000
G1 X60.403 Y191.55 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X58.837 Y191.55 E.05193
G1 X58.837 Y191.487 E.00208
G1 X185.874 Y64.45 E5.95954
G1 X189.266 Y64.45 E.11252
G1 X192.779 Y67.964 E.16482
G1 X192.779 Y65.221 E.09098
G1 X66.45 Y191.55 E5.92634
G1 X63.058 Y191.55 E.11252
G1 X58.837 Y187.329 E.19802
G1 X58.837 Y183.811 E.11669
G1 X178.198 Y64.45 E5.59945
G1 X181.59 Y64.45 E.11252
G1 X192.779 Y75.64 E.52491
G1 X192.779 Y72.897 E.09098
G1 X74.126 Y191.55 E5.56625
G1 X70.734 Y191.55 E.11252
G1 X58.837 Y179.653 E.55811
G1 X58.837 Y176.135 E.11669
G1 X170.522 Y64.45 E5.23935
G1 X173.914 Y64.45 E.11252
G1 X192.779 Y83.316 E.88501
G1 X192.779 Y80.573 E.09098
G1 X81.802 Y191.55 E5.20615
G1 X78.41 Y191.55 E.11252
G1 X58.837 Y171.977 E.91821
G1 X58.837 Y168.459 E.11669
G1 X162.846 Y64.45 E4.87926
G1 X166.238 Y64.45 E.11252
G1 X192.779 Y90.992 E1.2451
G1 X192.779 Y88.249 E.09098
G1 X89.478 Y191.55 E4.84606
G1 X86.086 Y191.55 E.11252
G1 X58.837 Y164.301 E1.2783
G1 X58.837 Y160.783 E.11669
G1 X155.17 Y64.45 E4.51916
G1 X158.562 Y64.45 E.11252
G1 X192.779 Y98.668 E1.6052
G1 X192.779 Y95.925 E.09098
G1 X97.154 Y191.55 E4.48596
G1 X93.762 Y191.55 E.11252
G1 X58.837 Y156.625 E1.6384
G1 X58.837 Y153.107 E.11669
G1 X147.494 Y64.45 E4.15907
G1 X150.886 Y64.45 E.11252
G1 X192.779 Y106.343 E1.96529
G1 X192.779 Y103.601 E.09098
G1 X104.83 Y191.55 E4.12587
G1 X101.438 Y191.55 E.11252
G1 X58.837 Y148.949 E1.99849
G1 X58.837 Y145.431 E.11669
G1 X139.818 Y64.45 E3.79897
G1 X143.21 Y64.45 E.11252
G1 X192.779 Y114.019 E2.32539
G1 X192.779 Y111.277 E.09098
G1 X112.506 Y191.55 E3.76577
G1 X109.114 Y191.55 E.11252
G1 X58.837 Y141.273 E2.35859
G1 X58.837 Y137.755 E.11669
G1 X132.142 Y64.45 E3.43888
G1 X135.534 Y64.45 E.11252
G1 X192.779 Y121.695 E2.68548
G1 X192.779 Y118.953 E.09098
G1 X120.182 Y191.55 E3.40567
G1 X116.79 Y191.55 E.11252
G1 X58.837 Y133.597 E2.71868
G1 X58.837 Y130.079 E.11669
G1 X124.466 Y64.45 E3.07878
G1 X127.858 Y64.45 E.11252
G1 X192.779 Y129.371 E3.04558
G1 X192.779 Y126.629 E.09098
G1 X127.858 Y191.55 E3.04558
G1 X124.466 Y191.55 E.11252
G1 X58.837 Y125.921 E3.07878
G1 X58.837 Y122.403 E.11669
G1 X116.79 Y64.45 E2.71868
G1 X120.182 Y64.45 E.11252
G1 X192.779 Y137.047 E3.40567
G1 X192.779 Y134.305 E.09098
G1 X135.534 Y191.55 E2.68548
G1 X132.142 Y191.55 E.11252
G1 X58.837 Y118.245 E3.43888
G1 X58.837 Y114.727 E.11669
G1 X109.114 Y64.45 E2.35859
G1 X112.506 Y64.45 E.11252
G1 X192.779 Y144.723 E3.76577
G1 X192.779 Y141.981 E.09098
G1 X143.21 Y191.55 E2.32539
G1 X139.818 Y191.55 E.11252
G1 X58.837 Y110.569 E3.79897
G1 X58.837 Y107.051 E.11669
G1 X101.438 Y64.45 E1.99849
G1 X104.83 Y64.45 E.11252
G1 X192.779 Y152.399 E4.12587
G1 X192.779 Y149.657 E.09098
G1 X150.886 Y191.55 E1.96529
G1 X147.494 Y191.55 E.11252
G1 X58.837 Y102.893 E4.15907
G1 X58.837 Y99.375 E.11669
G1 X93.762 Y64.45 E1.6384
G1 X97.154 Y64.45 E.11252
G1 X192.779 Y160.075 E4.48596
G1 X192.779 Y157.332 E.09098
G1 X158.562 Y191.55 E1.6052
G1 X155.17 Y191.55 E.11252
G1 X58.837 Y95.217 E4.51916
G1 X58.837 Y91.699 E.11669
G1 X86.086 Y64.45 E1.2783
G1 X89.478 Y64.45 E.11252
G1 X192.779 Y167.751 E4.84606
G1 X192.779 Y165.008 E.09098
G1 X166.238 Y191.55 E1.2451
G1 X162.846 Y191.55 E.11252
G1 X58.837 Y87.541 E4.87926
G1 X58.837 Y84.023 E.11669
G1 X78.41 Y64.45 E.91821
G1 X81.802 Y64.45 E.11252
G1 X192.779 Y175.427 E5.20615
G1 X192.779 Y172.684 E.09098
G1 X173.914 Y191.55 E.88501
G1 X170.522 Y191.55 E.11252
G1 X58.837 Y79.865 E5.23935
G1 X58.837 Y76.347 E.11669
G1 X70.734 Y64.45 E.55811
G1 X74.126 Y64.45 E.11252
G1 X192.779 Y183.103 E5.56625
G1 X192.779 Y180.36 E.09098
G1 X181.59 Y191.55 E.52491
G1 X178.198 Y191.55 E.11252
G1 X58.837 Y72.189 E5.59945
M73 P34 R43
G1 X58.837 Y68.671 E.11669
G1 X63.058 Y64.45 E.19802
G1 X66.45 Y64.45 E.11252
G1 X192.779 Y190.779 E5.92634
G1 X192.779 Y188.036 E.09098
G1 X189.266 Y191.55 E.16482
G1 X185.874 Y191.55 E.11252
G1 X58.837 Y64.513 E5.95954
G1 X58.837 Y64.45 E.00208
G1 X60.403 Y64.45 E.05193
G1 X193.235 Y191.442 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.547323
G1 F12490.013
G1 X193.739 Y191.442 E.02073
G1 X193.739 Y64.558 E5.21526
G1 X193.235 Y64.558 E.02073
G1 X193.235 Y191.382 E5.21279
M106 S188.7
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X193.235 Y189.382 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 5/50
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
G3 Z1.2 I-1.01 J.679 P1  F30000
G1 X195.596 Y192.896 Z1.2
G1 Z1
G1 E.8 F1800
; FEATURE: Support interface
; LINE_WIDTH: 0.42
G1 F4800
G1 X195.453 Y193.039 E.00618
G1 X194.904 Y193.039 E.01689
G1 X194.904 Y194.173 E.03486
G1 X194.027 Y194.173 E.02695
G1 X194.027 Y193.039 E.03486
G1 X193.296 Y193.039 E.02246
G1 X193.296 Y194.173 E.03486
G1 X193.838 Y194.173 E.01667
; WIPE_START
G1 F24000
G1 X193.296 Y194.173 E-.20615
G1 X193.296 Y193.039 E-.43105
G1 X193.619 Y193.039 E-.12279
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I-.27 J1.187 P1  F30000
G1 X198.601 Y194.173 Z1.4
G1 Z1
G1 E.8 F1800
G1 F4800
G1 X199.05 Y194.173 E.0138
G1 X199.05 Y61.827 E4.06661
G1 X198.412 Y61.827 E.0196
G1 X198.412 Y194.173 E4.06661
G1 X197.535 Y194.173 E.02695
G1 X197.535 Y61.827 E4.06661
G1 X196.658 Y61.827 E.02695
G1 X196.658 Y194.173 E4.06661
G1 X195.781 Y194.173 E.02695
G1 X195.781 Y192.889 E.03946
G1 X196.052 Y192.661 E.01088
G1 X196.052 Y63.339 E3.9737
G1 X195.781 Y63.111 E.01088
G1 X195.781 Y61.827 E.03946
G1 X194.904 Y61.827 E.02695
G1 X194.904 Y62.961 E.03485
G1 X194.027 Y62.961 E.02695
G1 X194.027 Y61.827 E.03485
G1 X193.296 Y61.827 E.02246
G1 X193.296 Y62.961 E.03485
G1 X193.838 Y62.961 E.01667
G1 X199.427 Y61.827 F30000
; FEATURE: Support
G1 F9000
G1 X204.804 Y61.827 E.16522
G1 X204.804 Y64.704 E.0884
G1 X199.427 Y64.704 E.16522
G1 X199.427 Y67.581 E.0884
G1 X204.804 Y67.581 E.16522
G1 X204.804 Y70.458 E.0884
G1 X199.427 Y70.458 E.16522
G1 X199.427 Y73.336 E.0884
G1 X204.804 Y73.336 E.16522
G1 X204.804 Y76.213 E.0884
G1 X199.427 Y76.213 E.16522
G1 X199.427 Y79.09 E.0884
G1 X204.804 Y79.09 E.16522
G1 X204.804 Y81.967 E.0884
G1 X199.427 Y81.967 E.16522
G1 X199.427 Y84.844 E.0884
G1 X204.804 Y84.844 E.16522
G1 X204.804 Y87.721 E.0884
G1 X199.427 Y87.721 E.16522
G1 X199.427 Y90.598 E.0884
G1 X204.804 Y90.598 E.16522
G1 X204.804 Y93.475 E.0884
G1 X199.427 Y93.475 E.16522
G1 X199.427 Y96.352 E.0884
G1 X204.804 Y96.352 E.16522
G1 X204.804 Y99.229 E.0884
G1 X199.427 Y99.229 E.16522
G1 X199.427 Y102.106 E.0884
G1 X204.804 Y102.106 E.16522
G1 X204.804 Y104.983 E.0884
G1 X199.427 Y104.983 E.16522
G1 X199.427 Y107.86 E.0884
G1 X204.804 Y107.86 E.16522
G1 X204.804 Y110.738 E.0884
G1 X199.427 Y110.738 E.16522
G1 X199.427 Y113.615 E.0884
G1 X204.804 Y113.615 E.16522
G1 X204.804 Y116.492 E.0884
G1 X199.427 Y116.492 E.16522
G1 X199.427 Y119.369 E.0884
G1 X204.804 Y119.369 E.16522
G1 X204.804 Y122.246 E.0884
G1 X199.427 Y122.246 E.16522
G1 X199.427 Y125.123 E.0884
G1 X204.804 Y125.123 E.16522
G1 X204.804 Y128 E.0884
G1 X199.427 Y128 E.16522
G1 X199.427 Y130.877 E.0884
G1 X204.804 Y130.877 E.16522
G1 X204.804 Y133.754 E.0884
G1 X199.427 Y133.754 E.16522
G1 X199.427 Y136.631 E.0884
G1 X204.804 Y136.631 E.16522
G1 X204.804 Y139.508 E.0884
G1 X199.427 Y139.508 E.16522
G1 X199.427 Y142.385 E.0884
G1 X204.804 Y142.385 E.16522
G1 X204.804 Y145.262 E.0884
G1 X199.427 Y145.262 E.16522
G1 X199.427 Y148.14 E.0884
G1 X204.804 Y148.14 E.16522
G1 X204.804 Y151.017 E.0884
G1 X199.427 Y151.017 E.16522
G1 X199.427 Y153.894 E.0884
G1 X204.804 Y153.894 E.16522
G1 X204.804 Y156.771 E.0884
G1 X199.427 Y156.771 E.16522
G1 X199.427 Y159.648 E.0884
G1 X204.804 Y159.648 E.16522
G1 X204.804 Y162.525 E.0884
G1 X199.427 Y162.525 E.16522
G1 X199.427 Y165.402 E.0884
G1 X204.804 Y165.402 E.16522
G1 X204.804 Y168.279 E.0884
G1 X199.427 Y168.279 E.16522
G1 X199.427 Y171.156 E.0884
G1 X204.804 Y171.156 E.16522
G1 X204.804 Y174.033 E.0884
G1 X199.427 Y174.033 E.16522
G1 X199.427 Y176.91 E.0884
G1 X204.804 Y176.91 E.16522
G1 X204.804 Y179.787 E.0884
G1 X199.427 Y179.787 E.16522
G1 X199.427 Y182.665 E.0884
G1 X204.804 Y182.665 E.16522
G1 X204.804 Y185.542 E.0884
G1 X199.427 Y185.542 E.16522
G1 X199.427 Y188.419 E.0884
G1 X204.804 Y188.419 E.16522
G1 X204.804 Y191.296 E.0884
G1 X199.427 Y191.296 E.16522
G1 X199.427 Y194.173 E.0884
G1 X204.804 Y194.173 E.16522
; WIPE_START
G1 F24000
G1 X202.804 Y194.173 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I.019 J-1.217 P1  F30000
G1 X58.397 Y191.898 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X58.397 Y64.102 E4.23922
G1 X194.615 Y64.102 E4.5186
G1 X194.628 Y64.102 E.00045
G1 X194.628 Y191.898 E4.23922
G1 X194.615 Y191.898 E.00045
G1 X58.457 Y191.898 E4.51661
G1 X58.005 Y192.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X58.005 Y63.71 E3.9509
G1 X58.056 Y63.71 E.00158
G1 X194.997 Y63.71 E4.20782
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X195.02 Y63.71 E.00077
G1 X195.02 Y192.29 E4.26523
G1 X194.997 Y192.29 E.00077
M106 S188.7
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X194.628 Y192.29 E.01134
G1 X58.065 Y192.29 E4.19622
M204 S10000
; WIPE_START
G1 F24000
G1 X58.064 Y190.29 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I.542 J1.089 P1  F30000
G1 X58.745 Y189.951 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X58.774 Y191.55 E.05305
G1 X185.874 Y64.45 E5.96249
G1 X189.266 Y64.45 E.11252
G1 X193.212 Y68.397 E.18514
G1 X193.212 Y64.788 E.11972
G1 X66.45 Y191.55 E5.94667
G1 X63.058 Y191.55 E.11252
G1 X58.745 Y187.236 E.20235
G1 X58.745 Y183.903 E.11057
G1 X178.198 Y64.45 E5.60378
G1 X181.59 Y64.45 E.11252
G1 X193.212 Y76.073 E.54524
G1 X193.212 Y72.464 E.11972
G1 X74.126 Y191.55 E5.58657
G1 X70.734 Y191.55 E.11252
G1 X58.745 Y179.56 E.56244
G1 X58.745 Y176.227 E.11057
G1 X170.522 Y64.45 E5.24368
G1 X173.914 Y64.45 E.11252
G1 X193.212 Y83.749 E.90533
G1 X193.212 Y80.14 E.11972
G1 X81.802 Y191.55 E5.22648
G1 X78.41 Y191.55 E.11252
M73 P34 R42
G1 X58.745 Y171.884 E.92254
G1 X58.745 Y168.551 E.11057
G1 X162.846 Y64.45 E4.88359
G1 X166.238 Y64.45 E.11252
G1 X193.212 Y91.425 E1.26543
G1 X193.212 Y87.816 E.11972
G1 X89.478 Y191.55 E4.86638
G1 X86.086 Y191.55 E.11252
G1 X58.745 Y164.208 E1.28263
G1 X58.745 Y160.875 E.11057
G1 X155.17 Y64.45 E4.52349
G1 X158.562 Y64.45 E.11252
G1 X193.212 Y99.101 E1.62552
G1 X193.212 Y95.492 E.11972
G1 X97.154 Y191.55 E4.50629
G1 X93.762 Y191.55 E.11252
G1 X58.745 Y156.532 E1.64273
G1 X58.745 Y153.199 E.11057
G1 X147.494 Y64.45 E4.1634
G1 X150.886 Y64.45 E.11252
G1 X193.212 Y106.777 E1.98562
G1 X193.212 Y103.167 E.11972
G1 X104.83 Y191.55 E4.14619
G1 X101.438 Y191.55 E.11252
G1 X58.745 Y148.856 E2.00283
G1 X58.745 Y145.523 E.11057
G1 X139.818 Y64.45 E3.8033
G1 X143.21 Y64.45 E.11252
G1 X193.212 Y114.453 E2.34571
G1 X193.212 Y110.843 E.11972
G1 X112.506 Y191.55 E3.78609
G1 X109.114 Y191.55 E.11252
G1 X58.745 Y141.181 E2.36292
G1 X58.745 Y137.847 E.11057
G1 X132.142 Y64.45 E3.44321
G1 X135.534 Y64.45 E.11252
G1 X193.212 Y122.129 E2.70581
G1 X193.212 Y118.519 E.11972
G1 X120.182 Y191.55 E3.426
G1 X116.79 Y191.55 E.11252
G1 X58.745 Y133.505 E2.72302
G1 X58.745 Y130.171 E.11057
G1 X124.466 Y64.45 E3.08311
G1 X127.858 Y64.45 E.11252
G1 X193.212 Y129.805 E3.0659
G1 X193.212 Y126.195 E.11972
G1 X127.858 Y191.55 E3.0659
G1 X124.466 Y191.55 E.11252
G1 X58.745 Y125.829 E3.08311
G1 X58.745 Y122.495 E.11057
G1 X116.79 Y64.45 E2.72302
M73 P35 R42
G1 X120.182 Y64.45 E.11252
G1 X193.212 Y137.481 E3.426
G1 X193.212 Y133.871 E.11972
G1 X135.534 Y191.55 E2.70581
G1 X132.142 Y191.55 E.11252
G1 X58.745 Y118.153 E3.44321
G1 X58.745 Y114.819 E.11057
G1 X109.114 Y64.45 E2.36292
G1 X112.506 Y64.45 E.11252
G1 X193.212 Y145.157 E3.78609
G1 X193.212 Y141.547 E.11972
G1 X143.21 Y191.55 E2.34571
G1 X139.818 Y191.55 E.11252
G1 X58.745 Y110.477 E3.8033
G1 X58.745 Y107.144 E.11057
G1 X101.438 Y64.45 E2.00283
G1 X104.83 Y64.45 E.11252
G1 X193.212 Y152.833 E4.14619
G1 X193.212 Y149.223 E.11972
G1 X150.886 Y191.55 E1.98562
G1 X147.494 Y191.55 E.11252
G1 X58.745 Y102.801 E4.1634
G1 X58.745 Y99.468 E.11057
G1 X93.762 Y64.45 E1.64273
G1 X97.154 Y64.45 E.11252
G1 X193.212 Y160.508 E4.50629
G1 X193.212 Y156.899 E.11972
G1 X158.562 Y191.55 E1.62552
G1 X155.17 Y191.55 E.11252
G1 X58.745 Y95.125 E4.52349
G1 X58.745 Y91.792 E.11057
G1 X86.086 Y64.45 E1.28263
G1 X89.478 Y64.45 E.11252
G1 X193.212 Y168.184 E4.86638
G1 X193.212 Y164.575 E.11972
G1 X166.238 Y191.55 E1.26543
G1 X162.846 Y191.55 E.11252
G1 X58.745 Y87.449 E4.88359
G1 X58.745 Y84.116 E.11057
G1 X78.41 Y64.45 E.92254
G1 X81.802 Y64.45 E.11252
G1 X193.212 Y175.86 E5.22648
G1 X193.212 Y172.251 E.11972
G1 X173.914 Y191.55 E.90533
G1 X170.522 Y191.55 E.11252
G1 X58.745 Y79.773 E5.24368
G1 X58.745 Y76.44 E.11057
G1 X70.734 Y64.45 E.56244
G1 X74.126 Y64.45 E.11252
G1 X193.212 Y183.536 E5.58657
G1 X193.212 Y179.927 E.11972
G1 X181.59 Y191.55 E.54524
G1 X178.198 Y191.55 E.11252
G1 X58.745 Y72.097 E5.60378
G1 X58.745 Y68.764 E.11057
G1 X63.058 Y64.45 E.20235
G1 X66.45 Y64.45 E.11252
G1 X193.212 Y191.212 E5.94667
G1 X193.212 Y187.603 E.11972
G1 X189.266 Y191.55 E.18514
G1 X185.874 Y191.55 E.11252
G1 X58.774 Y64.45 E5.96249
G1 X58.745 Y66.049 E.05304
G1 X193.668 Y191.442 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.547324
G1 F12489.988
G1 X194.172 Y191.442 E.02073
G1 X194.172 Y64.558 E5.21527
G1 X193.668 Y64.558 E.02073
G1 X193.668 Y191.382 E5.2128
M106 S191.25
; CHANGE_LAYER
; Z_HEIGHT: 1.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X193.668 Y189.382 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 6/50
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
G3 Z1.4 I-.955 J.754 P1  F30000
G1 X196.356 Y192.79 Z1.4
G1 Z1.2
G1 E.8 F1800
; FEATURE: Support interface
; LINE_WIDTH: 0.42
G1 F4800
G3 X196.173 Y192.889 I-.141 J-.042 E.00711
G1 X196.173 Y194.173 E.03946
G1 X196.658 Y194.173 E.01491
G1 X196.658 Y61.827 E4.06661
G1 X197.535 Y61.827 E.02695
G1 X197.535 Y194.173 E4.06661
G1 X198.412 Y194.173 E.02695
G1 X198.412 Y61.827 E4.06661
G1 X199.05 Y61.827 E.0196
G1 X199.05 Y194.173 E4.06661
G1 X198.601 Y194.173 E.0138
; WIPE_START
G1 F24000
G1 X199.05 Y194.173 E-.1707
G1 X199.05 Y192.622 E-.5893
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I-.317 J-1.175 P1  F30000
G1 X193.296 Y194.173 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Support
G1 F9000
G1 X195.796 Y194.173 E.07682
G1 X195.796 Y193.039 E.03485
G1 X193.296 Y193.039 E.07682
G1 X193.296 Y193.984 E.02906
; WIPE_START
G1 F24000
G1 X193.296 Y193.039 E-.35938
G1 X194.35 Y193.039 E-.40062
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I-.131 J1.21 P1  F30000
G1 X204.804 Y194.173 Z1.6
G1 Z1.2
G1 E.8 F1800
G1 F9000
G1 X199.427 Y194.173 E.16522
G1 X199.427 Y191.296 E.0884
G1 X204.804 Y191.296 E.16522
G1 X204.804 Y188.419 E.0884
G1 X199.427 Y188.419 E.16522
G1 X199.427 Y185.542 E.0884
G1 X204.804 Y185.542 E.16522
G1 X204.804 Y182.665 E.0884
G1 X199.427 Y182.665 E.16522
G1 X199.427 Y179.787 E.0884
G1 X204.804 Y179.787 E.16522
G1 X204.804 Y176.91 E.0884
G1 X199.427 Y176.91 E.16522
G1 X199.427 Y174.033 E.0884
G1 X204.804 Y174.033 E.16522
G1 X204.804 Y171.156 E.0884
G1 X199.427 Y171.156 E.16522
G1 X199.427 Y168.279 E.0884
G1 X204.804 Y168.279 E.16522
G1 X204.804 Y165.402 E.0884
G1 X199.427 Y165.402 E.16522
G1 X199.427 Y162.525 E.0884
G1 X204.804 Y162.525 E.16522
G1 X204.804 Y159.648 E.0884
G1 X199.427 Y159.648 E.16522
G1 X199.427 Y156.771 E.0884
G1 X204.804 Y156.771 E.16522
G1 X204.804 Y153.894 E.0884
G1 X199.427 Y153.894 E.16522
G1 X199.427 Y151.017 E.0884
G1 X204.804 Y151.017 E.16522
G1 X204.804 Y148.14 E.0884
G1 X199.427 Y148.14 E.16522
G1 X199.427 Y145.262 E.0884
G1 X204.804 Y145.262 E.16522
G1 X204.804 Y142.385 E.0884
G1 X199.427 Y142.385 E.16522
G1 X199.427 Y139.508 E.0884
G1 X204.804 Y139.508 E.16522
G1 X204.804 Y136.631 E.0884
G1 X199.427 Y136.631 E.16522
G1 X199.427 Y133.754 E.0884
G1 X204.804 Y133.754 E.16522
G1 X204.804 Y130.877 E.0884
G1 X199.427 Y130.877 E.16522
G1 X199.427 Y128 E.0884
G1 X204.804 Y128 E.16522
G1 X204.804 Y125.123 E.0884
G1 X199.427 Y125.123 E.16522
G1 X199.427 Y122.246 E.0884
G1 X204.804 Y122.246 E.16522
G1 X204.804 Y119.369 E.0884
G1 X199.427 Y119.369 E.16522
G1 X199.427 Y116.492 E.0884
G1 X204.804 Y116.492 E.16522
G1 X204.804 Y113.615 E.0884
G1 X199.427 Y113.615 E.16522
G1 X199.427 Y110.738 E.0884
G1 X204.804 Y110.738 E.16522
G1 X204.804 Y107.86 E.0884
G1 X199.427 Y107.86 E.16522
G1 X199.427 Y104.983 E.0884
G1 X204.804 Y104.983 E.16522
G1 X204.804 Y102.106 E.0884
G1 X199.427 Y102.106 E.16522
G1 X199.427 Y99.229 E.0884
G1 X204.804 Y99.229 E.16522
G1 X204.804 Y96.352 E.0884
G1 X199.427 Y96.352 E.16522
G1 X199.427 Y93.475 E.0884
G1 X204.804 Y93.475 E.16522
G1 X204.804 Y90.598 E.0884
G1 X199.427 Y90.598 E.16522
G1 X199.427 Y87.721 E.0884
G1 X204.804 Y87.721 E.16522
G1 X204.804 Y84.844 E.0884
G1 X199.427 Y84.844 E.16522
G1 X199.427 Y81.967 E.0884
G1 X204.804 Y81.967 E.16522
G1 X204.804 Y79.09 E.0884
G1 X199.427 Y79.09 E.16522
G1 X199.427 Y76.213 E.0884
G1 X204.804 Y76.213 E.16522
G1 X204.804 Y73.336 E.0884
G1 X199.427 Y73.336 E.16522
G1 X199.427 Y70.458 E.0884
G1 X204.804 Y70.458 E.16522
G1 X204.804 Y67.581 E.0884
G1 X199.427 Y67.581 E.16522
G1 X199.427 Y64.704 E.0884
G1 X204.804 Y64.704 E.16522
G1 X204.804 Y61.827 E.0884
G1 X199.427 Y61.827 E.16522
; WIPE_START
G1 F24000
G1 X201.427 Y61.827 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I0 J-1.217 P1  F30000
G1 X196.469 Y61.827 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Support interface
G1 F4800
G1 X196.173 Y61.827 E.00912
G1 X196.173 Y63.111 E.03946
G3 X196.356 Y63.21 I.042 J.141 E.00711
; WIPE_START
G1 F24000
G1 X196.173 Y63.111 E-.0885
G1 X196.173 Y61.827 E-.54549
G1 X196.469 Y61.827 E-.12601
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I-.072 J-1.215 P1  F30000
G1 X193.296 Y62.016 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Support
G1 F9000
G1 X193.296 Y62.961 E.02906
G1 X195.796 Y62.961 E.07682
G1 X195.796 Y61.827 E.03485
G1 X193.296 Y61.827 E.07682
; WIPE_START
G1 F24000
G1 X195.296 Y61.827 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I-.838 J-.883 P1  F30000
G1 X58.304 Y191.898 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X58.304 Y64.102 E4.23922
G1 X195.048 Y64.102 E4.53603
G1 X195.061 Y64.102 E.00045
G1 X195.061 Y191.898 E4.23922
G1 X195.048 Y191.898 E.00045
G1 X58.364 Y191.898 E4.53404
G1 X57.912 Y192.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X57.912 Y63.71 E3.9509
G1 X57.964 Y63.71 E.00158
G1 X195.43 Y63.71 E4.22397
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X195.454 Y63.71 E.00077
G1 X195.454 Y192.29 E4.26523
G1 X195.43 Y192.29 E.00077
M106 S191.25
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X195.061 Y192.29 E.01134
G1 X57.972 Y192.29 E4.21237
M204 S10000
; WIPE_START
G1 F24000
G1 X57.971 Y190.29 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I.415 J1.144 P1  F30000
G1 X58.653 Y190.043 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X58.653 Y191.55 E.04997
G1 X58.774 Y191.55 E.00404
G1 X185.874 Y64.45 E5.96249
G1 X189.266 Y64.45 E.11252
G1 X193.646 Y68.83 E.20546
G1 X193.646 Y72.03 E.10616
G1 X74.126 Y191.55 E5.6069
G1 X70.734 Y191.55 E.11252
G1 X58.653 Y179.468 E.56677
G1 X58.653 Y176.32 E.10444
G1 X170.522 Y64.45 E5.24801
G1 X173.914 Y64.45 E.11252
G1 X193.646 Y84.182 E.92566
G1 X193.646 Y87.382 E.10616
G1 X89.478 Y191.55 E4.8867
G1 X86.086 Y191.55 E.11252
G1 X58.653 Y164.116 E1.28697
G1 X58.653 Y160.968 E.10444
G1 X155.17 Y64.45 E4.52782
G1 X158.562 Y64.45 E.11252
G1 X193.646 Y99.534 E1.64585
G1 X193.646 Y102.734 E.10616
G1 X104.83 Y191.55 E4.16651
G1 X101.438 Y191.55 E.11252
G1 X58.653 Y148.764 E2.00716
G1 X58.653 Y145.616 E.10444
G1 X139.818 Y64.45 E3.80763
G1 X143.21 Y64.45 E.11252
G1 X193.646 Y114.886 E2.36604
G1 X193.646 Y118.086 E.10616
G1 X120.182 Y191.55 E3.44632
G1 X116.79 Y191.55 E.11252
M73 P36 R42
G1 X58.653 Y133.412 E2.72735
G1 X58.653 Y130.264 E.10444
G1 X124.466 Y64.45 E3.08744
G1 X127.858 Y64.45 E.11252
G1 X193.646 Y130.238 E3.08623
G1 X193.646 Y133.438 E.10616
G1 X135.534 Y191.55 E2.72613
G1 X132.142 Y191.55 E.11252
G1 X58.653 Y118.06 E3.44754
G1 X58.653 Y114.912 E.10444
G1 X109.114 Y64.45 E2.36725
G1 X112.506 Y64.45 E.11252
G1 X193.646 Y145.59 E3.80642
G1 X193.646 Y148.79 E.10616
G1 X150.886 Y191.55 E2.00594
G1 X147.494 Y191.55 E.11252
G1 X58.653 Y102.708 E4.16773
G1 X58.653 Y99.56 E.10444
G1 X93.762 Y64.45 E1.64706
G1 X97.154 Y64.45 E.11252
G1 X193.646 Y160.942 E4.52661
G1 X193.646 Y164.142 E.10616
G1 X166.238 Y191.55 E1.28575
G1 X162.846 Y191.55 E.11252
G1 X58.653 Y87.356 E4.88792
G1 X58.653 Y84.208 E.10444
G1 X78.41 Y64.45 E.92687
G1 X81.802 Y64.45 E.11252
G1 X193.646 Y176.294 E5.2468
G1 X193.646 Y179.494 E.10616
G1 X181.59 Y191.55 E.56556
G1 X178.198 Y191.55 E.11252
G1 X58.653 Y72.004 E5.60811
G1 X58.653 Y68.856 E.10444
G1 X63.058 Y64.45 E.20668
G1 X66.45 Y64.45 E.11252
M73 P36 R41
G1 X193.55 Y191.55 E5.96249
G1 X193.646 Y191.55 E.00318
G1 X193.646 Y190.017 E.05083
G1 X194.101 Y191.442 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.547323
G1 F12490.013
G1 X194.606 Y191.442 E.02073
G1 X194.606 Y64.558 E5.21526
G1 X194.101 Y64.558 E.02073
G1 X194.101 Y191.382 E5.21279
G1 X193.646 Y65.983 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X193.646 Y64.45 E.05083
G1 X193.55 Y64.45 E.00318
G1 X66.45 Y191.55 E5.96249
G1 X63.058 Y191.55 E.11252
G1 X58.653 Y187.144 E.20668
G1 X58.653 Y183.996 E.10444
G1 X178.198 Y64.45 E5.60811
G1 X181.59 Y64.45 E.11252
G1 X193.646 Y76.506 E.56556
G1 X193.646 Y79.706 E.10616
G1 X81.802 Y191.55 E5.2468
G1 X78.41 Y191.55 E.11252
G1 X58.653 Y171.792 E.92687
G1 X58.653 Y168.644 E.10444
G1 X162.846 Y64.45 E4.88792
G1 X166.238 Y64.45 E.11252
G1 X193.646 Y91.858 E1.28575
G1 X193.646 Y95.058 E.10616
G1 X97.154 Y191.55 E4.52661
G1 X93.762 Y191.55 E.11252
G1 X58.653 Y156.44 E1.64706
G1 X58.653 Y153.292 E.10444
G1 X147.494 Y64.45 E4.16773
G1 X150.886 Y64.45 E.11252
G1 X193.646 Y107.21 E2.00594
G1 X193.646 Y110.41 E.10616
G1 X112.506 Y191.55 E3.80642
G1 X109.114 Y191.55 E.11252
G1 X58.653 Y141.088 E2.36725
G1 X58.653 Y137.94 E.10444
G1 X132.142 Y64.45 E3.44754
G1 X135.534 Y64.45 E.11252
G1 X193.646 Y122.562 E2.72613
G1 X193.646 Y125.762 E.10616
G1 X127.858 Y191.55 E3.08623
G1 X124.466 Y191.55 E.11252
G1 X58.653 Y125.736 E3.08744
G1 X58.653 Y122.588 E.10444
G1 X116.79 Y64.45 E2.72735
G1 X120.182 Y64.45 E.11252
G1 X193.646 Y137.914 E3.44632
G1 X193.646 Y141.114 E.10616
G1 X143.21 Y191.55 E2.36604
G1 X139.818 Y191.55 E.11252
G1 X58.653 Y110.384 E3.80763
G1 X58.653 Y107.236 E.10444
G1 X101.438 Y64.45 E2.00716
G1 X104.83 Y64.45 E.11252
G1 X193.646 Y153.266 E4.16651
G1 X193.646 Y156.466 E.10616
G1 X158.562 Y191.55 E1.64585
G1 X155.17 Y191.55 E.11252
G1 X58.653 Y95.032 E4.52782
G1 X58.653 Y91.884 E.10444
G1 X86.086 Y64.45 E1.28697
G1 X89.478 Y64.45 E.11252
G1 X193.646 Y168.618 E4.8867
G1 X193.646 Y171.818 E.10616
G1 X173.914 Y191.55 E.92566
G1 X170.522 Y191.55 E.11252
G1 X58.653 Y79.68 E5.24801
G1 X58.653 Y76.532 E.10444
G1 X70.734 Y64.45 E.56677
G1 X74.126 Y64.45 E.11252
G1 X193.646 Y183.97 E5.6069
G1 X193.646 Y187.17 E.10616
G1 X189.266 Y191.55 E.20546
G1 X185.874 Y191.55 E.11252
G1 X58.774 Y64.45 E5.96249
G1 X58.653 Y64.45 E.00404
G1 X58.653 Y65.957 E.04997
; CHANGE_LAYER
; Z_HEIGHT: 1.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X58.653 Y64.45 E-.57246
G1 X58.774 Y64.45 E-.0463
G1 X59.037 Y64.713 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 7/50
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
G3 Z1.6 I.014 J1.217 P1  F30000
G1 X196.47 Y63.111 Z1.6
G1 Z1.4
G1 E.8 F1800
; FEATURE: Support interface
; LINE_WIDTH: 0.42
G1 F4800
G2 X196.173 Y62.961 I-.223 J.074 E.01134
G1 X196.173 Y61.827 E.03485
G1 X196.469 Y61.827 E.00912
; WIPE_START
G1 F24000
G1 X196.173 Y61.827 E-.12598
G1 X196.173 Y62.961 E-.48166
G1 X196.32 Y62.961 E-.06244
G1 X196.47 Y63.111 E-.08992
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I.485 J1.116 P1  F30000
G1 X199.427 Y61.827 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Support
G1 F9000
G1 X204.804 Y61.827 E.16522
G1 X204.804 Y64.704 E.0884
G1 X199.427 Y64.704 E.16522
G1 X199.427 Y67.581 E.0884
G1 X204.804 Y67.581 E.16522
G1 X204.804 Y70.458 E.0884
G1 X199.427 Y70.458 E.16522
G1 X199.427 Y73.336 E.0884
G1 X204.804 Y73.336 E.16522
G1 X204.804 Y76.213 E.0884
G1 X199.427 Y76.213 E.16522
G1 X199.427 Y79.09 E.0884
G1 X204.804 Y79.09 E.16522
G1 X204.804 Y81.967 E.0884
G1 X199.427 Y81.967 E.16522
G1 X199.427 Y84.844 E.0884
G1 X204.804 Y84.844 E.16522
G1 X204.804 Y87.721 E.0884
G1 X199.427 Y87.721 E.16522
G1 X199.427 Y90.598 E.0884
G1 X204.804 Y90.598 E.16522
G1 X204.804 Y93.475 E.0884
G1 X199.427 Y93.475 E.16522
G1 X199.427 Y96.352 E.0884
G1 X204.804 Y96.352 E.16522
G1 X204.804 Y99.229 E.0884
G1 X199.427 Y99.229 E.16522
G1 X199.427 Y102.106 E.0884
G1 X204.804 Y102.106 E.16522
G1 X204.804 Y104.983 E.0884
G1 X199.427 Y104.983 E.16522
G1 X199.427 Y107.86 E.0884
G1 X204.804 Y107.86 E.16522
G1 X204.804 Y110.738 E.0884
G1 X199.427 Y110.738 E.16522
G1 X199.427 Y113.615 E.0884
G1 X204.804 Y113.615 E.16522
G1 X204.804 Y116.492 E.0884
G1 X199.427 Y116.492 E.16522
G1 X199.427 Y119.369 E.0884
G1 X204.804 Y119.369 E.16522
G1 X204.804 Y122.246 E.0884
G1 X199.427 Y122.246 E.16522
G1 X199.427 Y125.123 E.0884
G1 X204.804 Y125.123 E.16522
G1 X204.804 Y128 E.0884
G1 X199.427 Y128 E.16522
G1 X199.427 Y130.877 E.0884
G1 X204.804 Y130.877 E.16522
G1 X204.804 Y133.754 E.0884
G1 X199.427 Y133.754 E.16522
G1 X199.427 Y136.631 E.0884
G1 X204.804 Y136.631 E.16522
G1 X204.804 Y139.508 E.0884
G1 X199.427 Y139.508 E.16522
G1 X199.427 Y142.385 E.0884
G1 X204.804 Y142.385 E.16522
G1 X204.804 Y145.262 E.0884
G1 X199.427 Y145.262 E.16522
G1 X199.427 Y148.14 E.0884
G1 X204.804 Y148.14 E.16522
G1 X204.804 Y151.017 E.0884
G1 X199.427 Y151.017 E.16522
G1 X199.427 Y153.894 E.0884
G1 X204.804 Y153.894 E.16522
G1 X204.804 Y156.771 E.0884
G1 X199.427 Y156.771 E.16522
G1 X199.427 Y159.648 E.0884
G1 X204.804 Y159.648 E.16522
G1 X204.804 Y162.525 E.0884
G1 X199.427 Y162.525 E.16522
G1 X199.427 Y165.402 E.0884
G1 X204.804 Y165.402 E.16522
G1 X204.804 Y168.279 E.0884
G1 X199.427 Y168.279 E.16522
G1 X199.427 Y171.156 E.0884
G1 X204.804 Y171.156 E.16522
G1 X204.804 Y174.033 E.0884
G1 X199.427 Y174.033 E.16522
G1 X199.427 Y176.91 E.0884
G1 X204.804 Y176.91 E.16522
G1 X204.804 Y179.787 E.0884
G1 X199.427 Y179.787 E.16522
G1 X199.427 Y182.665 E.0884
G1 X204.804 Y182.665 E.16522
G1 X204.804 Y185.542 E.0884
G1 X199.427 Y185.542 E.16522
G1 X199.427 Y188.419 E.0884
G1 X204.804 Y188.419 E.16522
G1 X204.804 Y191.296 E.0884
G1 X199.427 Y191.296 E.16522
G1 X199.427 Y194.173 E.0884
G1 X204.804 Y194.173 E.16522
; WIPE_START
G1 F24000
G1 X202.804 Y194.173 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I0 J-1.217 P1  F30000
G1 X198.601 Y194.173 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Support interface
G1 F4800
G1 X199.05 Y194.173 E.0138
G1 X199.05 Y61.827 E4.06661
G1 X198.412 Y61.827 E.0196
G1 X198.412 Y194.173 E4.06661
G1 X197.535 Y194.173 E.02695
G1 X197.535 Y61.827 E4.06661
G1 X196.658 Y61.827 E.02695
G1 X196.658 Y63.111 E.03946
G1 X196.919 Y63.339 E.01063
G1 X196.919 Y192.661 E3.9737
G1 X196.658 Y192.889 E.01063
G1 X196.658 Y194.173 E.03946
G1 X196.173 Y194.173 E.01491
G1 X196.173 Y193.039 E.03485
G2 X196.47 Y192.889 I.074 J-.223 E.01134
; WIPE_START
G1 F24000
G1 X196.32 Y193.039 E-.08046
G1 X196.173 Y193.039 E-.05588
G1 X196.173 Y194.173 E-.43105
G1 X196.658 Y194.173 E-.18437
G1 X196.658 Y194.151 E-.00824
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I.02 J-1.217 P1  F30000
G1 X58.212 Y191.898 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X58.212 Y64.102 E4.23922
G1 X195.481 Y64.102 E4.55347
G1 X195.495 Y64.102 E.00045
G1 X195.495 Y191.898 E4.23922
G1 X195.481 Y191.898 E.00045
M73 P37 R41
G1 X58.272 Y191.898 E4.55148
G1 X57.82 Y192.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X57.82 Y63.71 E3.9509
G1 X57.871 Y63.71 E.00158
G1 X195.864 Y63.71 E4.24012
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X195.887 Y63.71 E.00077
G1 X195.887 Y192.29 E4.26523
G1 X195.864 Y192.29 E.00077
M106 S191.25
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X195.495 Y192.29 E.01134
G1 X57.88 Y192.29 E4.22852
M204 S10000
; WIPE_START
G1 F24000
G1 X57.879 Y190.29 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I.269 J1.187 P1  F30000
G1 X58.56 Y190.135 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X58.56 Y191.55 E.04691
G1 X58.774 Y191.55 E.0071
G1 X185.874 Y64.45 E5.96249
G1 X189.266 Y64.45 E.11252
G1 X194.079 Y69.263 E.22579
G1 X194.079 Y71.597 E.07742
G1 X74.126 Y191.55 E5.62722
G1 X70.734 Y191.55 E.11252
G1 X58.56 Y179.376 E.57111
G1 X58.56 Y176.412 E.09832
G1 X170.522 Y64.45 E5.25235
G1 X173.914 Y64.45 E.11252
G1 X194.079 Y84.615 E.94598
G1 X194.079 Y86.949 E.07742
G1 X89.478 Y191.55 E4.90703
G1 X86.086 Y191.55 E.11252
G1 X58.56 Y164.024 E1.2913
G1 X58.56 Y161.06 E.09832
G1 X155.17 Y64.45 E4.53216
G1 X158.562 Y64.45 E.11252
G1 X194.079 Y99.967 E1.66617
G1 X194.079 Y102.301 E.07742
G1 X104.83 Y191.55 E4.18684
G1 X101.438 Y191.55 E.11252
G1 X58.56 Y148.672 E2.01149
G1 X58.56 Y145.708 E.09831
G1 X139.818 Y64.45 E3.81196
G1 X143.21 Y64.45 E.11252
G1 X194.079 Y115.319 E2.38636
G1 X194.079 Y117.653 E.07742
G1 X120.182 Y191.55 E3.46665
G1 X116.79 Y191.55 E.11252
G1 X58.56 Y133.32 E2.73168
G1 X58.56 Y130.356 E.09831
G1 X124.466 Y64.45 E3.09177
G1 X127.858 Y64.45 E.11252
G1 X194.079 Y130.671 E3.10655
G1 X194.079 Y133.005 E.07742
G1 X135.534 Y191.55 E2.74646
G1 X132.142 Y191.55 E.11252
G1 X58.56 Y117.968 E3.45187
G1 X58.56 Y115.004 E.09831
G1 X109.114 Y64.45 E2.37158
G1 X112.506 Y64.45 E.11252
G1 X194.079 Y146.023 E3.82674
G1 X194.079 Y148.357 E.07742
G1 X150.886 Y191.55 E2.02627
G1 X147.494 Y191.55 E.11252
G1 X58.56 Y102.616 E4.17206
G1 X58.56 Y99.652 E.09831
G1 X93.762 Y64.45 E1.65139
G1 X97.154 Y64.45 E.11252
G1 X194.079 Y161.375 E4.54693
G1 X194.079 Y163.709 E.07742
G1 X166.238 Y191.55 E1.30607
G1 X162.846 Y191.55 E.11252
G1 X58.56 Y87.264 E4.89225
G1 X58.56 Y84.3 E.09831
G1 X78.41 Y64.45 E.9312
G1 X81.802 Y64.45 E.11252
G1 X194.079 Y176.727 E5.26712
G1 X194.079 Y179.061 E.07742
G1 X181.59 Y191.55 E.58588
G1 X178.198 Y191.55 E.11252
G1 X58.56 Y71.912 E5.61244
G1 X58.56 Y68.948 E.09831
G1 X63.058 Y64.45 E.21101
G1 X66.45 Y64.45 E.11252
G1 X193.55 Y191.55 E5.96249
G1 X194.079 Y191.55 E.01755
G1 X194.079 Y190.451 E.03646
G1 X194.535 Y191.442 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.547323
G1 F12490.013
G1 X195.039 Y191.442 E.02073
G1 X195.039 Y64.558 E5.21526
G1 X194.535 Y64.558 E.02073
G1 X194.535 Y191.382 E5.21279
G1 X194.079 Y65.55 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X194.079 Y64.45 E.03646
G1 X193.55 Y64.45 E.01755
G1 X66.45 Y191.55 E5.96249
G1 X63.058 Y191.55 E.11252
G1 X58.56 Y187.052 E.21101
G1 X58.56 Y184.088 E.09832
G1 X178.198 Y64.45 E5.61244
G1 X181.59 Y64.45 E.11252
G1 X194.079 Y76.939 E.58588
G1 X194.079 Y79.273 E.07742
G1 X81.802 Y191.55 E5.26712
G1 X78.41 Y191.55 E.11252
G1 X58.56 Y171.7 E.9312
G1 X58.56 Y168.736 E.09832
G1 X162.846 Y64.45 E4.89225
G1 X166.238 Y64.45 E.11252
G1 X194.079 Y92.291 E1.30607
G1 X194.079 Y94.625 E.07742
G1 X97.154 Y191.55 E4.54693
G1 X93.762 Y191.55 E.11252
G1 X58.56 Y156.348 E1.65139
G1 X58.56 Y153.384 E.09832
G1 X147.494 Y64.45 E4.17206
G1 X150.886 Y64.45 E.11252
G1 X194.079 Y107.643 E2.02627
G1 X194.079 Y109.977 E.07742
G1 X112.506 Y191.55 E3.82674
G1 X109.114 Y191.55 E.11252
G1 X58.56 Y140.996 E2.37158
G1 X58.56 Y138.032 E.09831
G1 X132.142 Y64.45 E3.45187
G1 X135.534 Y64.45 E.11252
G1 X194.079 Y122.995 E2.74646
G1 X194.079 Y125.329 E.07742
G1 X127.858 Y191.55 E3.10655
G1 X124.466 Y191.55 E.11252
G1 X58.56 Y125.644 E3.09177
G1 X58.56 Y122.68 E.09831
G1 X116.79 Y64.45 E2.73168
G1 X120.182 Y64.45 E.11252
G1 X194.079 Y138.347 E3.46665
G1 X194.079 Y140.681 E.07742
M73 P37 R40
G1 X143.21 Y191.55 E2.38636
G1 X139.818 Y191.55 E.11252
G1 X58.56 Y110.292 E3.81196
G1 X58.56 Y107.328 E.09831
G1 X101.438 Y64.45 E2.01149
G1 X104.83 Y64.45 E.11252
G1 X194.079 Y153.699 E4.18684
G1 X194.079 Y156.033 E.07742
G1 X158.562 Y191.55 E1.66617
G1 X155.17 Y191.55 E.11252
G1 X58.56 Y94.94 E4.53216
G1 X58.56 Y91.976 E.09831
G1 X86.086 Y64.45 E1.2913
G1 X89.478 Y64.45 E.11252
G1 X194.079 Y169.051 E4.90703
G1 X194.079 Y171.385 E.07742
G1 X173.914 Y191.55 E.94598
G1 X170.522 Y191.55 E.11252
G1 X58.56 Y79.588 E5.25235
G1 X58.56 Y76.624 E.09831
G1 X70.734 Y64.45 E.57111
G1 X74.126 Y64.45 E.11252
G1 X194.079 Y184.403 E5.62722
G1 X194.079 Y186.737 E.07742
G1 X189.266 Y191.55 E.22579
G1 X185.874 Y191.55 E.11252
G1 X58.774 Y64.45 E5.96249
G1 X58.56 Y64.45 E.0071
G1 X58.56 Y65.864 E.04691
M106 S193.8
; CHANGE_LAYER
; Z_HEIGHT: 1.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X58.56 Y64.45 E-.53738
G1 X58.774 Y64.45 E-.08138
G1 X59.037 Y64.713 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 8/50
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
G3 Z1.8 I.026 J1.217 P1  F30000
G1 X196.469 Y61.827 Z1.8
G1 Z1.6
G1 E.8 F1800
; FEATURE: Support interface
; LINE_WIDTH: 0.42
G1 F4800
G1 X196.173 Y61.827 E.00912
G1 X196.173 Y62.961 E.03485
G1 X196.658 Y62.961 E.01491
G1 X196.658 Y61.827 E.03485
G1 X197.535 Y61.827 E.02695
G1 X197.535 Y194.173 E4.06661
G1 X198.412 Y194.173 E.02695
G1 X198.412 Y61.827 E4.06661
G1 X199.05 Y61.827 E.0196
G1 X199.05 Y194.173 E4.06661
G1 X198.601 Y194.173 E.0138
; WIPE_START
G1 F24000
G1 X199.05 Y194.173 E-.1707
G1 X199.05 Y192.622 E-.5893
; WIPE_END
M73 P38 R40
G1 E-.04 F1800
G17
G3 Z2 I-.105 J-1.212 P1  F30000
G1 X197.233 Y192.779 Z2
G1 Z1.6
G1 E.8 F1800
G1 F4800
G3 X196.903 Y192.889 I-.22 J-.111 E.01187
G3 X196.658 Y193.039 I-.198 J-.048 E.00981
G1 X196.658 Y194.173 E.03485
G1 X196.173 Y194.173 E.01491
G1 X196.173 Y193.039 E.03485
G1 X196.469 Y193.039 E.00912
; WIPE_START
G1 F24000
G1 X196.173 Y193.039 E-.11273
G1 X196.173 Y194.173 E-.43105
G1 X196.658 Y194.173 E-.18437
G1 X196.658 Y194.089 E-.03185
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-.013 J1.217 P1  F30000
G1 X204.804 Y194.173 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Support
G1 F9000
G1 X199.427 Y194.173 E.16522
G1 X199.427 Y191.296 E.0884
G1 X204.804 Y191.296 E.16522
G1 X204.804 Y188.419 E.0884
G1 X199.427 Y188.419 E.16522
G1 X199.427 Y185.542 E.0884
G1 X204.804 Y185.542 E.16522
G1 X204.804 Y182.665 E.0884
G1 X199.427 Y182.665 E.16522
G1 X199.427 Y179.787 E.0884
G1 X204.804 Y179.787 E.16522
G1 X204.804 Y176.91 E.0884
G1 X199.427 Y176.91 E.16522
G1 X199.427 Y174.033 E.0884
G1 X204.804 Y174.033 E.16522
G1 X204.804 Y171.156 E.0884
G1 X199.427 Y171.156 E.16522
G1 X199.427 Y168.279 E.0884
G1 X204.804 Y168.279 E.16522
G1 X204.804 Y165.402 E.0884
G1 X199.427 Y165.402 E.16522
G1 X199.427 Y162.525 E.0884
G1 X204.804 Y162.525 E.16522
G1 X204.804 Y159.648 E.0884
G1 X199.427 Y159.648 E.16522
G1 X199.427 Y156.771 E.0884
G1 X204.804 Y156.771 E.16522
G1 X204.804 Y153.894 E.0884
G1 X199.427 Y153.894 E.16522
G1 X199.427 Y151.017 E.0884
G1 X204.804 Y151.017 E.16522
G1 X204.804 Y148.14 E.0884
G1 X199.427 Y148.14 E.16522
G1 X199.427 Y145.262 E.0884
G1 X204.804 Y145.262 E.16522
G1 X204.804 Y142.385 E.0884
G1 X199.427 Y142.385 E.16522
G1 X199.427 Y139.508 E.0884
G1 X204.804 Y139.508 E.16522
G1 X204.804 Y136.631 E.0884
G1 X199.427 Y136.631 E.16522
G1 X199.427 Y133.754 E.0884
G1 X204.804 Y133.754 E.16522
G1 X204.804 Y130.877 E.0884
G1 X199.427 Y130.877 E.16522
G1 X199.427 Y128 E.0884
G1 X204.804 Y128 E.16522
G1 X204.804 Y125.123 E.0884
G1 X199.427 Y125.123 E.16522
G1 X199.427 Y122.246 E.0884
G1 X204.804 Y122.246 E.16522
G1 X204.804 Y119.369 E.0884
G1 X199.427 Y119.369 E.16522
G1 X199.427 Y116.492 E.0884
G1 X204.804 Y116.492 E.16522
G1 X204.804 Y113.615 E.0884
G1 X199.427 Y113.615 E.16522
G1 X199.427 Y110.738 E.0884
G1 X204.804 Y110.738 E.16522
G1 X204.804 Y107.86 E.0884
G1 X199.427 Y107.86 E.16522
G1 X199.427 Y104.983 E.0884
G1 X204.804 Y104.983 E.16522
G1 X204.804 Y102.106 E.0884
G1 X199.427 Y102.106 E.16522
G1 X199.427 Y99.229 E.0884
G1 X204.804 Y99.229 E.16522
G1 X204.804 Y96.352 E.0884
G1 X199.427 Y96.352 E.16522
G1 X199.427 Y93.475 E.0884
G1 X204.804 Y93.475 E.16522
G1 X204.804 Y90.598 E.0884
G1 X199.427 Y90.598 E.16522
G1 X199.427 Y87.721 E.0884
G1 X204.804 Y87.721 E.16522
G1 X204.804 Y84.844 E.0884
G1 X199.427 Y84.844 E.16522
G1 X199.427 Y81.967 E.0884
G1 X204.804 Y81.967 E.16522
G1 X204.804 Y79.09 E.0884
G1 X199.427 Y79.09 E.16522
G1 X199.427 Y76.213 E.0884
G1 X204.804 Y76.213 E.16522
G1 X204.804 Y73.336 E.0884
G1 X199.427 Y73.336 E.16522
G1 X199.427 Y70.458 E.0884
G1 X204.804 Y70.458 E.16522
G1 X204.804 Y67.581 E.0884
G1 X199.427 Y67.581 E.16522
G1 X199.427 Y64.704 E.0884
G1 X204.804 Y64.704 E.16522
G1 X204.804 Y61.827 E.0884
G1 X199.427 Y61.827 E.16522
; WIPE_START
G1 F24000
G1 X201.427 Y61.827 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-.818 J-.901 P1  F30000
G1 X58.12 Y191.898 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X58.12 Y64.102 E4.23922
G1 X195.914 Y64.102 E4.5709
G1 X195.928 Y64.102 E.00045
G1 X195.928 Y191.898 E4.23922
G1 X195.914 Y191.898 E.00045
G1 X58.18 Y191.898 E4.56891
G1 X57.728 Y192.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X57.728 Y63.71 E3.9509
G1 X57.779 Y63.71 E.00158
G1 X196.297 Y63.71 E4.25627
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X196.32 Y63.71 E.00077
G1 X196.32 Y192.29 E4.26523
G1 X196.297 Y192.29 E.00077
M106 S193.8
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X195.928 Y192.29 E.01134
G1 X57.788 Y192.29 E4.24466
M204 S10000
; WIPE_START
G1 F24000
G1 X57.787 Y190.29 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I.111 J1.212 P1  F30000
G1 X58.468 Y190.228 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X58.468 Y191.55 E.04385
G1 X58.774 Y191.55 E.01017
G1 X185.874 Y64.45 E5.96249
G1 X189.266 Y64.45 E.11252
G1 X194.512 Y69.697 E.24611
G1 X194.512 Y71.164 E.04867
G1 X74.126 Y191.55 E5.64754
G1 X70.734 Y191.55 E.11252
G1 X58.468 Y179.283 E.57544
G1 X58.468 Y176.504 E.09219
G1 X170.522 Y64.45 E5.25668
G1 X173.914 Y64.45 E.11252
G1 X194.512 Y85.049 E.9663
G1 X194.512 Y86.516 E.04867
G1 X89.478 Y191.55 E4.92735
G1 X86.086 Y191.55 E.11252
G1 X58.468 Y163.931 E1.29563
G1 X58.468 Y161.152 E.09219
G1 X155.17 Y64.45 E4.53649
G1 X158.562 Y64.45 E.11252
G1 X194.512 Y100.4 E1.68649
G1 X194.512 Y101.868 E.04867
G1 X104.83 Y191.55 E4.20716
G1 X101.438 Y191.55 E.11252
G1 X58.468 Y148.579 E2.01582
G1 X58.468 Y145.8 E.09219
G1 X139.818 Y64.45 E3.8163
G1 X143.21 Y64.45 E.11252
G1 X194.512 Y115.752 E2.40668
G1 X194.512 Y117.22 E.04867
G1 X120.182 Y191.55 E3.48697
G1 X116.79 Y191.55 E.11252
G1 X58.468 Y133.228 E2.73601
G1 X58.468 Y130.448 E.09219
G1 X124.466 Y64.45 E3.09611
G1 X127.858 Y64.45 E.11252
G1 X194.512 Y131.104 E3.12688
G1 X194.512 Y132.572 E.04867
G1 X135.534 Y191.55 E2.76678
G1 X132.142 Y191.55 E.11252
G1 X58.468 Y117.876 E3.4562
G1 X58.468 Y115.096 E.09219
G1 X109.114 Y64.45 E2.37591
G1 X112.506 Y64.45 E.11252
G1 X194.512 Y146.456 E3.84707
G1 X194.512 Y147.924 E.04867
G1 X150.886 Y191.55 E2.04659
G1 X147.494 Y191.55 E.11252
G1 X58.468 Y102.524 E4.17639
G1 X58.468 Y99.745 E.09219
G1 X93.762 Y64.45 E1.65572
G1 X97.154 Y64.45 E.11252
G1 X194.512 Y161.808 E4.56726
G1 X194.512 Y163.276 E.04867
G1 X166.238 Y191.55 E1.3264
G1 X162.846 Y191.55 E.11252
G1 X58.468 Y87.172 E4.89658
G1 X58.468 Y84.393 E.09219
G1 X78.41 Y64.45 E.93553
G1 X81.802 Y64.45 E.11252
G1 X194.512 Y177.16 E5.28745
G1 X194.512 Y178.627 E.04867
G1 X181.59 Y191.55 E.60621
G1 X178.198 Y191.55 E.11252
G1 X58.468 Y71.82 E5.61677
G1 X58.468 Y69.041 E.09219
G1 X63.058 Y64.45 E.21534
G1 X66.45 Y64.45 E.11252
G1 X193.55 Y191.55 E5.96249
G1 X194.512 Y191.55 E.03192
G1 X194.512 Y190.884 E.02209
G1 X194.968 Y191.442 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.547323
G1 F12490.013
G1 X195.472 Y191.442 E.02073
G1 X195.472 Y64.558 E5.21526
G1 X194.968 Y64.558 E.02073
G1 X194.968 Y191.382 E5.21279
G1 X194.512 Y65.116 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X194.512 Y64.45 E.02209
G1 X193.55 Y64.45 E.03192
G1 X66.45 Y191.55 E5.96249
G1 X63.058 Y191.55 E.11252
G1 X58.468 Y186.959 E.21534
G1 X58.468 Y184.18 E.09219
G1 X178.198 Y64.45 E5.61677
G1 X181.59 Y64.45 E.11252
G1 X194.512 Y77.373 E.60621
G1 X194.512 Y78.84 E.04867
G1 X81.802 Y191.55 E5.28745
G1 X78.41 Y191.55 E.11252
G1 X58.468 Y171.607 E.93553
G1 X58.468 Y168.828 E.09219
G1 X162.846 Y64.45 E4.89658
G1 X166.238 Y64.45 E.11252
G1 X194.512 Y92.724 E1.3264
G1 X194.512 Y94.192 E.04867
G1 X97.154 Y191.55 E4.56726
G1 X93.762 Y191.55 E.11252
G1 X58.468 Y156.255 E1.65572
G1 X58.468 Y153.476 E.09219
G1 X147.494 Y64.45 E4.17639
G1 X150.886 Y64.45 E.11252
G1 X194.512 Y108.076 E2.04659
G1 X194.512 Y109.544 E.04867
G1 X112.506 Y191.55 E3.84707
G1 X109.114 Y191.55 E.11252
G1 X58.468 Y140.904 E2.37591
G1 X58.468 Y138.124 E.09219
G1 X132.142 Y64.45 E3.4562
G1 X135.534 Y64.45 E.11252
G1 X194.512 Y123.428 E2.76678
G1 X194.512 Y124.896 E.04867
G1 X127.858 Y191.55 E3.12688
G1 X124.466 Y191.55 E.11252
G1 X58.468 Y125.552 E3.09611
G1 X58.468 Y122.772 E.09219
G1 X116.79 Y64.45 E2.73601
G1 X120.182 Y64.45 E.11252
G1 X194.512 Y138.78 E3.48697
G1 X194.512 Y140.248 E.04867
G1 X143.21 Y191.55 E2.40668
G1 X139.818 Y191.55 E.11252
G1 X58.468 Y110.2 E3.8163
G1 X58.468 Y107.421 E.09219
G1 X101.438 Y64.45 E2.01582
G1 X104.83 Y64.45 E.11252
G1 X194.512 Y154.132 E4.20716
G1 X194.512 Y155.6 E.04867
G1 X158.562 Y191.55 E1.68649
G1 X155.17 Y191.55 E.11252
G1 X58.468 Y94.848 E4.53649
G1 X58.468 Y92.069 E.09219
G1 X86.086 Y64.45 E1.29563
M73 P39 R40
G1 X89.478 Y64.45 E.11252
G1 X194.512 Y169.484 E4.92735
G1 X194.512 Y170.951 E.04867
G1 X173.914 Y191.55 E.9663
G1 X170.522 Y191.55 E.11252
G1 X58.468 Y79.496 E5.25668
G1 X58.468 Y76.717 E.09219
G1 X70.734 Y64.45 E.57544
G1 X74.126 Y64.45 E.11252
G1 X194.512 Y184.836 E5.64754
G1 X194.512 Y186.303 E.04867
G1 X189.266 Y191.55 E.24611
G1 X185.874 Y191.55 E.11252
G1 X58.774 Y64.45 E5.96249
G1 X58.468 Y64.45 E.01017
G1 X58.468 Y65.772 E.04385
M106 S191.25
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X58.468 Y64.45 E-.5023
G1 X58.774 Y64.45 E-.11647
G1 X59.037 Y64.713 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 9/50
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
G3 Z2 I.026 J1.217 P1  F30000
G1 X196.469 Y61.827 Z2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Support interface
; LINE_WIDTH: 0.42
G1 F4800
G1 X196.173 Y61.827 E.00912
G1 X196.173 Y62.961 E.03485
G1 X196.658 Y62.961 E.01491
G1 X196.658 Y61.827 E.03485
G1 X197.535 Y61.827 E.02695
G1 X197.535 Y63.111 E.03946
G1 X197.785 Y63.339 E.01039
G1 X197.785 Y192.661 E3.9737
G1 X197.535 Y192.889 E.01039
G1 X197.535 Y194.173 E.03946
G1 X198.412 Y194.173 E.02695
G1 X198.412 Y61.827 E4.06661
G1 X199.05 Y61.827 E.0196
G1 X199.05 Y194.173 E4.06661
G1 X198.601 Y194.173 E.0138
; WIPE_START
G1 F24000
G1 X199.05 Y194.173 E-.1707
G1 X199.05 Y192.622 E-.5893
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-.188 J-1.202 P1  F30000
G1 X197.347 Y192.889 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F4800
M73 P39 R39
G1 X197.186 Y193.039 E.00674
G1 X196.658 Y193.039 E.01623
G1 X196.658 Y194.173 E.03485
G1 X196.173 Y194.173 E.01491
G1 X196.173 Y193.039 E.03485
G1 X196.469 Y193.039 E.00912
; WIPE_START
G1 F24000
G1 X196.173 Y193.039 E-.11273
G1 X196.173 Y194.173 E-.43105
G1 X196.658 Y194.173 E-.18437
G1 X196.658 Y194.089 E-.03185
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-.013 J1.217 P1  F30000
G1 X204.804 Y194.173 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Support
G1 F9000
G1 X199.427 Y194.173 E.16522
G1 X199.427 Y191.296 E.0884
G1 X204.804 Y191.296 E.16522
G1 X204.804 Y188.419 E.0884
G1 X199.427 Y188.419 E.16522
G1 X199.427 Y185.542 E.0884
G1 X204.804 Y185.542 E.16522
G1 X204.804 Y182.665 E.0884
G1 X199.427 Y182.665 E.16522
G1 X199.427 Y179.787 E.0884
G1 X204.804 Y179.787 E.16522
G1 X204.804 Y176.91 E.0884
G1 X199.427 Y176.91 E.16522
G1 X199.427 Y174.033 E.0884
G1 X204.804 Y174.033 E.16522
G1 X204.804 Y171.156 E.0884
G1 X199.427 Y171.156 E.16522
G1 X199.427 Y168.279 E.0884
G1 X204.804 Y168.279 E.16522
G1 X204.804 Y165.402 E.0884
G1 X199.427 Y165.402 E.16522
G1 X199.427 Y162.525 E.0884
G1 X204.804 Y162.525 E.16522
G1 X204.804 Y159.648 E.0884
G1 X199.427 Y159.648 E.16522
G1 X199.427 Y156.771 E.0884
G1 X204.804 Y156.771 E.16522
G1 X204.804 Y153.894 E.0884
G1 X199.427 Y153.894 E.16522
G1 X199.427 Y151.017 E.0884
G1 X204.804 Y151.017 E.16522
G1 X204.804 Y148.14 E.0884
G1 X199.427 Y148.14 E.16522
G1 X199.427 Y145.262 E.0884
G1 X204.804 Y145.262 E.16522
G1 X204.804 Y142.385 E.0884
G1 X199.427 Y142.385 E.16522
G1 X199.427 Y139.508 E.0884
G1 X204.804 Y139.508 E.16522
G1 X204.804 Y136.631 E.0884
G1 X199.427 Y136.631 E.16522
G1 X199.427 Y133.754 E.0884
G1 X204.804 Y133.754 E.16522
G1 X204.804 Y130.877 E.0884
G1 X199.427 Y130.877 E.16522
G1 X199.427 Y128 E.0884
G1 X204.804 Y128 E.16522
G1 X204.804 Y125.123 E.0884
G1 X199.427 Y125.123 E.16522
G1 X199.427 Y122.246 E.0884
G1 X204.804 Y122.246 E.16522
G1 X204.804 Y119.369 E.0884
G1 X199.427 Y119.369 E.16522
G1 X199.427 Y116.492 E.0884
G1 X204.804 Y116.492 E.16522
G1 X204.804 Y113.615 E.0884
G1 X199.427 Y113.615 E.16522
G1 X199.427 Y110.738 E.0884
G1 X204.804 Y110.738 E.16522
G1 X204.804 Y107.86 E.0884
G1 X199.427 Y107.86 E.16522
G1 X199.427 Y104.983 E.0884
G1 X204.804 Y104.983 E.16522
G1 X204.804 Y102.106 E.0884
G1 X199.427 Y102.106 E.16522
G1 X199.427 Y99.229 E.0884
G1 X204.804 Y99.229 E.16522
G1 X204.804 Y96.352 E.0884
G1 X199.427 Y96.352 E.16522
G1 X199.427 Y93.475 E.0884
G1 X204.804 Y93.475 E.16522
G1 X204.804 Y90.598 E.0884
G1 X199.427 Y90.598 E.16522
G1 X199.427 Y87.721 E.0884
G1 X204.804 Y87.721 E.16522
G1 X204.804 Y84.844 E.0884
G1 X199.427 Y84.844 E.16522
G1 X199.427 Y81.967 E.0884
G1 X204.804 Y81.967 E.16522
G1 X204.804 Y79.09 E.0884
G1 X199.427 Y79.09 E.16522
G1 X199.427 Y76.213 E.0884
G1 X204.804 Y76.213 E.16522
G1 X204.804 Y73.336 E.0884
G1 X199.427 Y73.336 E.16522
G1 X199.427 Y70.458 E.0884
G1 X204.804 Y70.458 E.16522
G1 X204.804 Y67.581 E.0884
G1 X199.427 Y67.581 E.16522
G1 X199.427 Y64.704 E.0884
G1 X204.804 Y64.704 E.16522
G1 X204.804 Y61.827 E.0884
G1 X199.427 Y61.827 E.16522
; WIPE_START
G1 F24000
G1 X201.427 Y61.827 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-.818 J-.901 P1  F30000
G1 X58.027 Y191.898 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X58.027 Y64.102 E4.23922
G1 X196.348 Y64.102 E4.58834
G1 X196.361 Y64.102 E.00045
G1 X196.361 Y191.898 E4.23922
G1 X196.348 Y191.898 E.00045
G1 X58.087 Y191.898 E4.58635
G1 X57.635 Y192.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X57.635 Y63.71 E3.9509
G1 X57.687 Y63.71 E.00158
G1 X196.73 Y63.71 E4.27242
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X196.753 Y63.71 E.00077
G1 X196.753 Y192.29 E4.26523
G1 X196.73 Y192.29 E.00077
M106 S191.25
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X196.361 Y192.29 E.01134
G1 X57.695 Y192.29 E4.26081
M204 S10000
; WIPE_START
G1 F24000
G1 X57.694 Y190.29 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-.054 J1.216 P1  F30000
G1 X58.376 Y190.32 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X58.376 Y191.55 E.04079
G1 X58.774 Y191.55 E.01323
G1 X185.874 Y64.45 E5.96249
G1 X189.266 Y64.45 E.11252
G1 X194.945 Y70.13 E.26644
G1 X194.945 Y70.731 E.01993
G1 X74.126 Y191.55 E5.66787
G1 X70.734 Y191.55 E.11252
G1 X58.376 Y179.191 E.57977
G1 X58.376 Y176.597 E.08606
G1 X170.522 Y64.45 E5.26101
G1 X173.914 Y64.45 E.11252
G1 X194.945 Y85.482 E.98663
G1 X194.945 Y86.083 E.01993
G1 X89.478 Y191.55 E4.94768
G1 X86.086 Y191.55 E.11252
G1 X58.376 Y163.839 E1.29996
G1 X58.376 Y161.245 E.08606
G1 X155.17 Y64.45 E4.54082
G1 X158.562 Y64.45 E.11252
G1 X194.945 Y100.834 E1.70682
G1 X194.945 Y101.435 E.01993
G1 X104.83 Y191.55 E4.22749
G1 X101.438 Y191.55 E.11252
G1 X58.376 Y148.487 E2.02015
G1 X58.376 Y145.893 E.08606
G1 X139.818 Y64.45 E3.82063
G1 X143.21 Y64.45 E.11252
G1 X194.945 Y116.186 E2.42701
G1 X194.945 Y116.786 E.01993
G1 X120.182 Y191.55 E3.50729
G1 X116.79 Y191.55 E.11252
G1 X58.376 Y133.135 E2.74034
G1 X58.376 Y130.541 E.08606
G1 X124.466 Y64.45 E3.10044
G1 X127.858 Y64.45 E.11252
G1 X194.945 Y131.538 E3.1472
G1 X194.945 Y132.138 E.01993
G1 X135.534 Y191.55 E2.7871
G1 X132.142 Y191.55 E.11252
G1 X58.376 Y117.783 E3.46053
G1 X58.376 Y115.189 E.08606
G1 X109.114 Y64.45 E2.38025
G1 X112.506 Y64.45 E.11252
G1 X194.945 Y146.889 E3.86739
G1 X194.945 Y147.49 E.01993
G1 X150.886 Y191.55 E2.06691
G1 X147.494 Y191.55 E.11252
G1 X58.376 Y102.431 E4.18072
G1 X58.376 Y99.837 E.08606
G1 X93.762 Y64.45 E1.66006
G1 X97.154 Y64.45 E.11252
G1 X194.945 Y162.241 E4.58758
G1 X194.945 Y162.842 E.01993
G1 X166.238 Y191.55 E1.34672
G1 X162.846 Y191.55 E.11252
G1 X58.376 Y87.079 E4.90091
G1 X58.376 Y84.485 E.08606
G1 X78.41 Y64.45 E.93986
G1 X81.802 Y64.45 E.11252
G1 X194.945 Y177.593 E5.30777
G1 X194.945 Y178.194 E.01993
G1 X181.59 Y191.55 E.62653
G1 X178.198 Y191.55 E.11252
G1 X58.376 Y71.727 E5.6211
G1 X58.376 Y69.133 E.08606
G1 X63.058 Y64.45 E.21967
G1 X66.45 Y64.45 E.11252
G1 X193.55 Y191.55 E5.96249
G1 X194.945 Y191.55 E.0463
G1 X194.945 Y191.317 E.00772
G1 X194.945 Y64.683 F30000
G1 F15476.087
G1 X194.945 Y64.45 E.00772
G1 X193.55 Y64.45 E.0463
G1 X66.45 Y191.55 E5.96249
G1 X63.058 Y191.55 E.11252
G1 X58.376 Y186.867 E.21967
G1 X58.376 Y184.272 E.08606
G1 X178.198 Y64.45 E5.6211
G1 X181.59 Y64.45 E.11252
G1 X194.945 Y77.806 E.62653
G1 X194.945 Y78.407 E.01993
G1 X81.802 Y191.55 E5.30777
G1 X78.41 Y191.55 E.11252
G1 X58.376 Y171.515 E.93986
G1 X58.376 Y168.921 E.08606
G1 X162.846 Y64.45 E4.90091
G1 X166.238 Y64.45 E.11252
G1 X194.945 Y93.158 E1.34672
G1 X194.945 Y93.759 E.01993
G1 X97.154 Y191.55 E4.58758
G1 X93.762 Y191.55 E.11252
M73 P40 R39
G1 X58.376 Y156.163 E1.66006
G1 X58.376 Y153.569 E.08606
G1 X147.494 Y64.45 E4.18072
G1 X150.886 Y64.45 E.11252
G1 X194.945 Y108.51 E2.06691
G1 X194.945 Y109.111 E.01993
G1 X112.506 Y191.55 E3.86739
G1 X109.114 Y191.55 E.11252
G1 X58.376 Y140.811 E2.38025
G1 X58.376 Y138.217 E.08606
G1 X132.142 Y64.45 E3.46053
G1 X135.534 Y64.45 E.11252
G1 X194.945 Y123.862 E2.7871
G1 X194.945 Y124.462 E.01993
G1 X127.858 Y191.55 E3.1472
G1 X124.466 Y191.55 E.11252
G1 X58.376 Y125.459 E3.10044
G1 X58.376 Y122.865 E.08606
G1 X116.79 Y64.45 E2.74034
G1 X120.182 Y64.45 E.11252
G1 X194.945 Y139.214 E3.50729
G1 X194.945 Y139.814 E.01993
G1 X143.21 Y191.55 E2.42701
G1 X139.818 Y191.55 E.11252
G1 X58.376 Y110.107 E3.82063
G1 X58.376 Y107.513 E.08606
G1 X101.438 Y64.45 E2.02015
G1 X104.83 Y64.45 E.11252
G1 X194.945 Y154.565 E4.22749
G1 X194.945 Y155.166 E.01993
G1 X158.562 Y191.55 E1.70682
G1 X155.17 Y191.55 E.11252
G1 X58.376 Y94.755 E4.54082
G1 X58.376 Y92.161 E.08606
G1 X86.086 Y64.45 E1.29996
G1 X89.478 Y64.45 E.11252
G1 X194.945 Y169.917 E4.94768
G1 X194.945 Y170.518 E.01993
G1 X173.914 Y191.55 E.98663
G1 X170.522 Y191.55 E.11252
G1 X58.376 Y79.403 E5.26101
G1 X58.376 Y76.809 E.08606
G1 X70.734 Y64.45 E.57977
G1 X74.126 Y64.45 E.11252
G1 X194.945 Y185.269 E5.66787
G1 X194.945 Y185.87 E.01993
G1 X189.266 Y191.55 E.26644
G1 X185.874 Y191.55 E.11252
G1 X58.774 Y64.45 E5.96249
G1 X58.376 Y64.45 E.01323
G1 X58.376 Y65.68 E.04078
G1 X195.401 Y64.558 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.547323
G1 F12490.013
G1 X195.401 Y191.442 E5.21526
G1 X195.905 Y191.442 E.02073
G1 X195.905 Y64.558 E5.21526
G1 X195.461 Y64.558 E.01827
M106 S196.35
; CHANGE_LAYER
; Z_HEIGHT: 2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X195.905 Y64.558 E-.16887
G1 X195.905 Y66.113 E-.59113
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 10/50
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
G3 Z2.2 I1.198 J.214 P1  F30000
G1 X196.469 Y62.961 Z2.2
G1 Z2
G1 E.8 F1800
; FEATURE: Support interface
; LINE_WIDTH: 0.42
G1 F4800
G1 X196.173 Y62.961 E.00912
G1 X196.173 Y61.827 E.03485
G1 X196.658 Y61.827 E.01491
G1 X196.658 Y62.961 E.03485
G1 X197.535 Y62.961 E.02695
G1 X197.535 Y61.827 E.03485
G1 X198.412 Y61.827 E.02695
G1 X198.412 Y194.173 E4.06661
G1 X197.535 Y194.173 E.02695
G1 X197.535 Y193.039 E.03485
G1 X196.658 Y193.039 E.02695
G1 X196.658 Y194.173 E.03485
G1 X196.173 Y194.173 E.01491
G1 X196.173 Y193.039 E.03485
G1 X196.469 Y193.039 E.00912
; WIPE_START
G1 F24000
G1 X196.173 Y193.039 E-.11273
G1 X196.173 Y194.173 E-.43105
G1 X196.658 Y194.173 E-.18437
G1 X196.658 Y194.089 E-.03185
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-.052 J1.216 P1  F30000
G1 X198.601 Y194.173 Z2.4
G1 Z2
G1 E.8 F1800
G1 F4800
G1 X199.05 Y194.173 E.0138
G1 X199.05 Y61.827 E4.06661
G1 X198.601 Y61.827 E.0138
G1 X199.427 Y61.827 F30000
; FEATURE: Support
G1 F9000
G1 X204.804 Y61.827 E.16522
G1 X204.804 Y64.704 E.0884
G1 X199.427 Y64.704 E.16522
G1 X199.427 Y67.581 E.0884
G1 X204.804 Y67.581 E.16522
G1 X204.804 Y70.458 E.0884
G1 X199.427 Y70.458 E.16522
G1 X199.427 Y73.336 E.0884
G1 X204.804 Y73.336 E.16522
G1 X204.804 Y76.213 E.0884
G1 X199.427 Y76.213 E.16522
G1 X199.427 Y79.09 E.0884
G1 X204.804 Y79.09 E.16522
G1 X204.804 Y81.967 E.0884
G1 X199.427 Y81.967 E.16522
G1 X199.427 Y84.844 E.0884
G1 X204.804 Y84.844 E.16522
G1 X204.804 Y87.721 E.0884
G1 X199.427 Y87.721 E.16522
G1 X199.427 Y90.598 E.0884
G1 X204.804 Y90.598 E.16522
G1 X204.804 Y93.475 E.0884
G1 X199.427 Y93.475 E.16522
G1 X199.427 Y96.352 E.0884
G1 X204.804 Y96.352 E.16522
G1 X204.804 Y99.229 E.0884
G1 X199.427 Y99.229 E.16522
G1 X199.427 Y102.106 E.0884
G1 X204.804 Y102.106 E.16522
G1 X204.804 Y104.983 E.0884
G1 X199.427 Y104.983 E.16522
G1 X199.427 Y107.86 E.0884
G1 X204.804 Y107.86 E.16522
G1 X204.804 Y110.738 E.0884
G1 X199.427 Y110.738 E.16522
G1 X199.427 Y113.615 E.0884
G1 X204.804 Y113.615 E.16522
G1 X204.804 Y116.492 E.0884
G1 X199.427 Y116.492 E.16522
G1 X199.427 Y119.369 E.0884
G1 X204.804 Y119.369 E.16522
G1 X204.804 Y122.246 E.0884
G1 X199.427 Y122.246 E.16522
G1 X199.427 Y125.123 E.0884
G1 X204.804 Y125.123 E.16522
G1 X204.804 Y128 E.0884
G1 X199.427 Y128 E.16522
G1 X199.427 Y130.877 E.0884
G1 X204.804 Y130.877 E.16522
G1 X204.804 Y133.754 E.0884
G1 X199.427 Y133.754 E.16522
G1 X199.427 Y136.631 E.0884
G1 X204.804 Y136.631 E.16522
G1 X204.804 Y139.508 E.0884
G1 X199.427 Y139.508 E.16522
G1 X199.427 Y142.385 E.0884
G1 X204.804 Y142.385 E.16522
G1 X204.804 Y145.262 E.0884
G1 X199.427 Y145.262 E.16522
G1 X199.427 Y148.14 E.0884
G1 X204.804 Y148.14 E.16522
G1 X204.804 Y151.017 E.0884
G1 X199.427 Y151.017 E.16522
G1 X199.427 Y153.894 E.0884
G1 X204.804 Y153.894 E.16522
G1 X204.804 Y156.771 E.0884
G1 X199.427 Y156.771 E.16522
G1 X199.427 Y159.648 E.0884
G1 X204.804 Y159.648 E.16522
G1 X204.804 Y162.525 E.0884
G1 X199.427 Y162.525 E.16522
G1 X199.427 Y165.402 E.0884
G1 X204.804 Y165.402 E.16522
G1 X204.804 Y168.279 E.0884
G1 X199.427 Y168.279 E.16522
G1 X199.427 Y171.156 E.0884
G1 X204.804 Y171.156 E.16522
G1 X204.804 Y174.033 E.0884
G1 X199.427 Y174.033 E.16522
G1 X199.427 Y176.91 E.0884
G1 X204.804 Y176.91 E.16522
G1 X204.804 Y179.787 E.0884
G1 X199.427 Y179.787 E.16522
G1 X199.427 Y182.665 E.0884
G1 X204.804 Y182.665 E.16522
G1 X204.804 Y185.542 E.0884
G1 X199.427 Y185.542 E.16522
G1 X199.427 Y188.419 E.0884
G1 X204.804 Y188.419 E.16522
G1 X204.804 Y191.296 E.0884
G1 X199.427 Y191.296 E.16522
G1 X199.427 Y194.173 E.0884
G1 X204.804 Y194.173 E.16522
; WIPE_START
G1 F24000
G1 X202.804 Y194.173 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I.019 J-1.217 P1  F30000
G1 X57.935 Y191.898 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X57.935 Y64.102 E4.23922
G1 X196.781 Y64.102 E4.60577
G1 X196.794 Y64.102 E.00045
G1 X196.794 Y191.898 E4.23922
G1 X196.781 Y191.898 E.00045
G1 X57.995 Y191.898 E4.60378
G1 X57.543 Y192.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X57.543 Y63.71 E3.9509
G1 X57.594 Y63.71 E.00158
G1 X197.163 Y63.71 E4.28857
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X197.186 Y63.71 E.00077
G1 X197.186 Y192.29 E4.26523
G1 X197.163 Y192.29 E.00077
M106 S196.35
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X196.794 Y192.29 E.01134
G1 X57.603 Y192.29 E4.27696
M204 S10000
; WIPE_START
G1 F24000
G1 X57.602 Y190.29 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-.215 J1.198 P1  F30000
G1 X58.283 Y190.412 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X58.283 Y191.55 E.03772
G1 X58.774 Y191.55 E.01629
G1 X185.874 Y64.45 E5.96249
G1 X189.266 Y64.45 E.11252
G1 X195.379 Y70.563 E.28676
G1 X195.379 Y70.297 E.00881
G1 X74.126 Y191.55 E5.68819
G1 X70.734 Y191.55 E.11252
G1 X58.283 Y179.099 E.5841
G1 X58.283 Y176.689 E.07994
G1 X170.522 Y64.45 E5.26534
G1 X173.914 Y64.45 E.11252
G1 X195.379 Y85.915 E1.00695
G1 X195.379 Y85.649 E.00881
G1 X89.478 Y191.55 E4.968
G1 X86.086 Y191.55 E.11252
G1 X58.283 Y163.747 E1.30429
G1 X58.283 Y161.337 E.07994
G1 X155.17 Y64.45 E4.54515
G1 X158.562 Y64.45 E.11252
G1 X195.379 Y101.267 E1.72714
G1 X195.379 Y101.001 E.00881
G1 X104.83 Y191.55 E4.24781
G1 X101.438 Y191.55 E.11252
G1 X58.283 Y148.395 E2.02448
G1 X58.283 Y145.985 E.07994
G1 X139.818 Y64.45 E3.82496
M73 P40 R38
G1 X143.21 Y64.45 E.11252
G1 X195.379 Y116.619 E2.44733
G1 X195.379 Y116.353 E.00881
G1 X120.182 Y191.55 E3.52762
G1 X116.79 Y191.55 E.11252
G1 X58.283 Y133.043 E2.74467
G1 X58.283 Y130.633 E.07994
G1 X124.466 Y64.45 E3.10477
G1 X127.858 Y64.45 E.11252
G1 X195.379 Y131.971 E3.16752
G1 X195.379 Y131.705 E.00881
G1 X135.534 Y191.55 E2.80743
G1 X132.142 Y191.55 E.11252
G1 X58.283 Y117.691 E3.46486
G1 X58.283 Y115.281 E.07994
G1 X109.114 Y64.45 E2.38458
G1 X112.506 Y64.45 E.11252
G1 X195.379 Y147.323 E3.88771
G1 X195.379 Y147.057 E.00881
G1 X150.886 Y191.55 E2.08724
G1 X147.494 Y191.55 E.11252
G1 X58.283 Y102.339 E4.18505
G1 X58.283 Y99.929 E.07994
G1 X93.762 Y64.45 E1.66439
G1 X97.154 Y64.45 E.11252
G1 X195.379 Y162.675 E4.60791
G1 X195.379 Y162.409 E.00881
G1 X166.238 Y191.55 E1.36705
G1 X162.846 Y191.55 E.11252
G1 X58.283 Y86.987 E4.90524
G1 X58.283 Y84.577 E.07994
G1 X78.41 Y64.45 E.9442
G1 X81.802 Y64.45 E.11252
G1 X195.379 Y178.027 E5.3281
G1 X195.379 Y177.761 E.00881
G1 X181.59 Y191.55 E.64686
M73 P41 R38
G1 X178.198 Y191.55 E.11252
G1 X58.283 Y71.635 E5.62544
G1 X58.283 Y69.225 E.07994
G1 X63.058 Y64.45 E.224
G1 X66.45 Y64.45 E.11252
G1 X193.55 Y191.55 E5.96249
G1 X195.178 Y191.55 E.05401
G1 X195.834 Y191.442 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.547323
G1 F12490.013
G1 X196.339 Y191.442 E.02073
G1 X196.339 Y64.558 E5.21526
G1 X195.834 Y64.558 E.02073
G1 X195.834 Y191.382 E5.21279
G1 X195.178 Y64.45 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X193.55 Y64.45 E.05401
G1 X66.45 Y191.55 E5.96249
G1 X63.058 Y191.55 E.11252
G1 X58.283 Y186.775 E.224
G1 X58.283 Y184.365 E.07994
G1 X178.198 Y64.45 E5.62544
G1 X181.59 Y64.45 E.11252
G1 X195.379 Y78.239 E.64686
G1 X195.379 Y77.973 E.00881
G1 X81.802 Y191.55 E5.3281
G1 X78.41 Y191.55 E.11252
G1 X58.283 Y171.423 E.9442
G1 X58.283 Y169.013 E.07994
G1 X162.846 Y64.45 E4.90524
G1 X166.238 Y64.45 E.11252
G1 X195.379 Y93.591 E1.36705
G1 X195.379 Y93.325 E.00881
G1 X97.154 Y191.55 E4.60791
G1 X93.762 Y191.55 E.11252
G1 X58.283 Y156.071 E1.66439
G1 X58.283 Y153.661 E.07994
G1 X147.494 Y64.45 E4.18505
G1 X150.886 Y64.45 E.11252
G1 X195.379 Y108.943 E2.08724
G1 X195.379 Y108.677 E.00881
G1 X112.506 Y191.55 E3.88771
G1 X109.114 Y191.55 E.11252
G1 X58.283 Y140.719 E2.38458
G1 X58.283 Y138.309 E.07994
G1 X132.142 Y64.45 E3.46486
G1 X135.534 Y64.45 E.11252
G1 X195.379 Y124.295 E2.80743
G1 X195.379 Y124.029 E.00881
G1 X127.858 Y191.55 E3.16752
G1 X124.466 Y191.55 E.11252
G1 X58.283 Y125.367 E3.10477
G1 X58.283 Y122.957 E.07994
G1 X116.79 Y64.45 E2.74467
G1 X120.182 Y64.45 E.11252
G1 X195.379 Y139.647 E3.52762
G1 X195.379 Y139.381 E.00881
G1 X143.21 Y191.55 E2.44733
G1 X139.818 Y191.55 E.11252
G1 X58.283 Y110.015 E3.82496
G1 X58.283 Y107.605 E.07994
G1 X101.438 Y64.45 E2.02448
G1 X104.83 Y64.45 E.11252
G1 X195.379 Y154.999 E4.24781
G1 X195.379 Y154.733 E.00881
G1 X158.562 Y191.55 E1.72714
G1 X155.17 Y191.55 E.11252
G1 X58.283 Y94.663 E4.54515
G1 X58.283 Y92.253 E.07994
G1 X86.086 Y64.45 E1.30429
G1 X89.478 Y64.45 E.11252
G1 X195.379 Y170.351 E4.968
G1 X195.379 Y170.085 E.00881
G1 X173.914 Y191.55 E1.00695
G1 X170.522 Y191.55 E.11252
G1 X58.283 Y79.311 E5.26534
G1 X58.283 Y76.901 E.07994
G1 X70.734 Y64.45 E.5841
G1 X74.126 Y64.45 E.11252
G1 X195.379 Y185.703 E5.68819
G1 X195.379 Y185.437 E.00881
G1 X189.266 Y191.55 E.28676
G1 X185.874 Y191.55 E.11252
G1 X58.774 Y64.45 E5.96249
G1 X58.283 Y64.45 E.01629
G1 X58.283 Y65.588 E.03772
M106 S188.7
; CHANGE_LAYER
; Z_HEIGHT: 2.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X58.283 Y64.45 E-.43212
G1 X58.774 Y64.45 E-.18664
G1 X59.037 Y64.713 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 11/50
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
G3 Z2.4 I.016 J1.217 P1  F30000
G1 X196.469 Y62.961 Z2.4
G1 Z2.2
G1 E.8 F1800
; FEATURE: Support interface
; LINE_WIDTH: 0.42
G1 F4800
G1 X196.173 Y62.961 E.00912
G1 X196.173 Y61.827 E.03485
G1 X196.658 Y61.827 E.01491
G1 X196.658 Y62.961 E.03485
G1 X197.535 Y62.961 E.02695
G1 X197.535 Y61.827 E.03485
G1 X198.224 Y61.827 E.02116
; WIPE_START
G1 F24000
G1 X197.535 Y61.827 E-.26164
G1 X197.535 Y62.961 E-.43104
G1 X197.358 Y62.961 E-.06731
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I-1.217 J-.008 P1  F30000
G1 X196.469 Y193.039 Z2.6
G1 Z2.2
G1 E.8 F1800
G1 F4800
G1 X196.173 Y193.039 E.00912
G1 X196.173 Y194.173 E.03486
G1 X196.658 Y194.173 E.01491
G1 X196.658 Y193.039 E.03486
G1 X197.535 Y193.039 E.02695
G1 X197.535 Y194.173 E.03486
G1 X198.412 Y194.173 E.02695
G1 X198.412 Y192.889 E.03946
G1 X198.651 Y192.661 E.01015
G1 X198.651 Y63.339 E3.9737
G1 X198.412 Y63.111 E.01015
G1 X198.412 Y61.827 E.03946
G1 X199.289 Y61.827 E.02695
G1 X199.289 Y194.173 E4.06661
G1 X200.166 Y194.173 E.02695
G1 X200.166 Y61.827 E4.06661
G1 X201.043 Y61.827 E.02695
G1 X201.043 Y194.173 E4.06661
G1 X201.92 Y194.173 E.02695
G1 X201.92 Y61.827 E4.06661
G1 X202.304 Y61.827 F30000
; FEATURE: Support
G1 F9000
G1 X204.804 Y61.827 E.07682
G1 X204.804 Y64.704 E.0884
G1 X202.304 Y64.704 E.07682
G1 X202.304 Y67.581 E.0884
G1 X204.804 Y67.581 E.07682
G1 X204.804 Y70.458 E.0884
G1 X202.304 Y70.458 E.07682
G1 X202.304 Y73.336 E.0884
G1 X204.804 Y73.336 E.07682
G1 X204.804 Y76.213 E.0884
G1 X202.304 Y76.213 E.07682
G1 X202.304 Y79.09 E.0884
G1 X204.804 Y79.09 E.07682
G1 X204.804 Y81.967 E.0884
G1 X202.304 Y81.967 E.07682
G1 X202.304 Y84.844 E.0884
G1 X204.804 Y84.844 E.07682
G1 X204.804 Y87.721 E.0884
G1 X202.304 Y87.721 E.07682
G1 X202.304 Y90.598 E.0884
G1 X204.804 Y90.598 E.07682
G1 X204.804 Y93.475 E.0884
G1 X202.304 Y93.475 E.07682
G1 X202.304 Y96.352 E.0884
G1 X204.804 Y96.352 E.07682
G1 X204.804 Y99.229 E.0884
G1 X202.304 Y99.229 E.07682
G1 X202.304 Y102.106 E.0884
G1 X204.804 Y102.106 E.07682
G1 X204.804 Y104.983 E.0884
G1 X202.304 Y104.983 E.07682
G1 X202.304 Y107.86 E.0884
G1 X204.804 Y107.86 E.07682
G1 X204.804 Y110.738 E.0884
G1 X202.304 Y110.738 E.07682
G1 X202.304 Y113.615 E.0884
G1 X204.804 Y113.615 E.07682
G1 X204.804 Y116.492 E.0884
G1 X202.304 Y116.492 E.07682
G1 X202.304 Y119.369 E.0884
G1 X204.804 Y119.369 E.07682
G1 X204.804 Y122.246 E.0884
G1 X202.304 Y122.246 E.07682
G1 X202.304 Y125.123 E.0884
G1 X204.804 Y125.123 E.07682
G1 X204.804 Y128 E.0884
G1 X202.304 Y128 E.07682
G1 X202.304 Y130.877 E.0884
G1 X204.804 Y130.877 E.07682
G1 X204.804 Y133.754 E.0884
G1 X202.304 Y133.754 E.07682
G1 X202.304 Y136.631 E.0884
G1 X204.804 Y136.631 E.07682
G1 X204.804 Y139.508 E.0884
G1 X202.304 Y139.508 E.07682
G1 X202.304 Y142.385 E.0884
G1 X204.804 Y142.385 E.07682
G1 X204.804 Y145.262 E.0884
G1 X202.304 Y145.262 E.07682
G1 X202.304 Y148.14 E.0884
G1 X204.804 Y148.14 E.07682
G1 X204.804 Y151.017 E.0884
G1 X202.304 Y151.017 E.07682
G1 X202.304 Y153.894 E.0884
G1 X204.804 Y153.894 E.07682
G1 X204.804 Y156.771 E.0884
G1 X202.304 Y156.771 E.07682
G1 X202.304 Y159.648 E.0884
G1 X204.804 Y159.648 E.07682
G1 X204.804 Y162.525 E.0884
G1 X202.304 Y162.525 E.07682
G1 X202.304 Y165.402 E.0884
G1 X204.804 Y165.402 E.07682
G1 X204.804 Y168.279 E.0884
G1 X202.304 Y168.279 E.07682
G1 X202.304 Y171.156 E.0884
G1 X204.804 Y171.156 E.07682
G1 X204.804 Y174.033 E.0884
G1 X202.304 Y174.033 E.07682
G1 X202.304 Y176.91 E.0884
G1 X204.804 Y176.91 E.07682
G1 X204.804 Y179.787 E.0884
G1 X202.304 Y179.787 E.07682
G1 X202.304 Y182.665 E.0884
G1 X204.804 Y182.665 E.07682
G1 X204.804 Y185.542 E.0884
G1 X202.304 Y185.542 E.07682
G1 X202.304 Y188.419 E.0884
G1 X204.804 Y188.419 E.07682
G1 X204.804 Y191.296 E.0884
G1 X202.304 Y191.296 E.07682
G1 X202.304 Y194.173 E.0884
G1 X204.804 Y194.173 E.07682
; WIPE_START
G1 F24000
G1 X202.804 Y194.173 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I.019 J-1.217 P1  F30000
G1 X57.843 Y191.898 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X57.843 Y64.102 E4.23922
G1 X197.214 Y64.102 E4.6232
G1 X197.228 Y64.102 E.00045
G1 X197.228 Y191.898 E4.23922
G1 X197.214 Y191.898 E.00045
G1 X57.903 Y191.898 E4.62121
G1 X57.451 Y192.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X57.451 Y63.71 E3.9509
G1 X57.502 Y63.71 E.00158
G1 X197.596 Y63.71 E4.30472
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X197.62 Y63.71 E.00077
G1 X197.62 Y192.29 E4.26523
G1 X197.596 Y192.29 E.00077
M106 S188.7
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X197.227 Y192.29 E.01134
M73 P42 R38
G1 X57.511 Y192.29 E4.29311
M204 S10000
; WIPE_START
G1 F24000
G1 X57.51 Y190.29 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I-.366 J1.161 P1  F30000
G1 X58.191 Y190.505 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X58.191 Y191.55 E.03466
G1 X58.774 Y191.55 E.01935
G1 X185.874 Y64.45 E5.96249
G1 X189.266 Y64.45 E.11252
G1 X195.812 Y70.996 E.30708
G1 X195.812 Y69.864 E.03755
G1 X74.126 Y191.55 E5.70852
G1 X70.734 Y191.55 E.11252
G1 X58.191 Y179.006 E.58843
G1 X58.191 Y176.781 E.07381
G1 X170.522 Y64.45 E5.26967
G1 X173.914 Y64.45 E.11252
G1 X195.812 Y86.348 E1.02728
G1 X195.812 Y85.216 E.03755
G1 X89.478 Y191.55 E4.98832
G1 X86.086 Y191.55 E.11252
G1 X58.191 Y163.654 E1.30862
G1 X58.191 Y161.429 E.07381
G1 X155.17 Y64.45 E4.54948
G1 X158.562 Y64.45 E.11252
G1 X195.812 Y101.7 E1.74747
G1 X195.812 Y100.568 E.03755
G1 X104.83 Y191.55 E4.26813
G1 X101.438 Y191.55 E.11252
G1 X58.191 Y148.303 E2.02881
G1 X58.191 Y146.077 E.07381
G1 X139.818 Y64.45 E3.82929
G1 X143.21 Y64.45 E.11252
G1 X195.812 Y117.052 E2.46766
G1 X195.812 Y115.92 E.03755
G1 X120.182 Y191.55 E3.54794
G1 X116.79 Y191.55 E.11252
G1 X58.191 Y132.951 E2.749
G1 X58.191 Y130.725 E.07381
G1 X124.466 Y64.45 E3.1091
G1 X127.858 Y64.45 E.11252
G1 X195.812 Y132.404 E3.18785
G1 X195.812 Y131.272 E.03755
G1 X135.534 Y191.55 E2.82775
G1 X132.142 Y191.55 E.11252
G1 X58.191 Y117.599 E3.46919
G1 X58.191 Y115.373 E.07381
G1 X109.114 Y64.45 E2.38891
G1 X112.506 Y64.45 E.11252
G1 X195.812 Y147.756 E3.90804
G1 X195.812 Y146.624 E.03755
G1 X150.886 Y191.55 E2.10756
G1 X147.494 Y191.55 E.11252
G1 X58.191 Y102.247 E4.18939
G1 X58.191 Y100.022 E.07381
G1 X93.762 Y64.45 E1.66872
G1 X97.154 Y64.45 E.11252
G1 X195.812 Y163.108 E4.62823
G1 X195.812 Y161.976 E.03755
G1 X166.238 Y191.55 E1.38737
G1 X162.846 Y191.55 E.11252
G1 X58.191 Y86.895 E4.90958
G1 X58.191 Y84.67 E.07381
G1 X78.41 Y64.45 E.94853
G1 X81.802 Y64.45 E.11252
G1 X195.812 Y178.46 E5.34842
G1 X195.812 Y177.328 E.03755
G1 X181.59 Y191.55 E.66718
G1 X178.198 Y191.55 E.11252
G1 X58.191 Y71.543 E5.62977
G1 X58.191 Y69.318 E.07381
G1 X63.058 Y64.45 E.22834
M73 P42 R37
G1 X66.45 Y64.45 E.11252
G1 X193.55 Y191.55 E5.96249
G1 X195.178 Y191.55 E.05401
G1 X196.268 Y191.442 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.547324
G1 F12489.988
G1 X196.772 Y191.442 E.02073
G1 X196.772 Y64.558 E5.21527
G1 X196.268 Y64.558 E.02073
G1 X196.268 Y191.382 E5.2128
G1 X195.178 Y64.45 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X193.55 Y64.45 E.05401
G1 X66.45 Y191.55 E5.96249
G1 X63.058 Y191.55 E.11252
G1 X58.191 Y186.682 E.22834
G1 X58.191 Y184.457 E.07381
G1 X178.198 Y64.45 E5.62977
G1 X181.59 Y64.45 E.11252
G1 X195.812 Y78.672 E.66718
G1 X195.812 Y77.54 E.03755
G1 X81.802 Y191.55 E5.34842
G1 X78.41 Y191.55 E.11252
G1 X58.191 Y171.33 E.94853
G1 X58.191 Y169.105 E.07381
G1 X162.846 Y64.45 E4.90958
G1 X166.238 Y64.45 E.11252
G1 X195.812 Y94.024 E1.38737
G1 X195.812 Y92.892 E.03755
G1 X97.154 Y191.55 E4.62823
G1 X93.762 Y191.55 E.11252
G1 X58.191 Y155.978 E1.66872
G1 X58.191 Y153.753 E.07381
G1 X147.494 Y64.45 E4.18939
G1 X150.886 Y64.45 E.11252
G1 X195.812 Y109.376 E2.10756
G1 X195.812 Y108.244 E.03755
G1 X112.506 Y191.55 E3.90804
G1 X109.114 Y191.55 E.11252
G1 X58.191 Y140.627 E2.38891
G1 X58.191 Y138.401 E.07381
G1 X132.142 Y64.45 E3.46919
G1 X135.534 Y64.45 E.11252
G1 X195.812 Y124.728 E2.82775
G1 X195.812 Y123.596 E.03755
G1 X127.858 Y191.55 E3.18785
G1 X124.466 Y191.55 E.11252
G1 X58.191 Y125.275 E3.1091
G1 X58.191 Y123.049 E.07381
G1 X116.79 Y64.45 E2.749
G1 X120.182 Y64.45 E.11252
G1 X195.812 Y140.08 E3.54794
G1 X195.812 Y138.948 E.03755
G1 X143.21 Y191.55 E2.46766
G1 X139.818 Y191.55 E.11252
G1 X58.191 Y109.923 E3.82929
G1 X58.191 Y107.697 E.07381
G1 X101.438 Y64.45 E2.02881
G1 X104.83 Y64.45 E.11252
G1 X195.812 Y155.432 E4.26813
G1 X195.812 Y154.3 E.03755
G1 X158.562 Y191.55 E1.74747
G1 X155.17 Y191.55 E.11252
G1 X58.191 Y94.571 E4.54948
G1 X58.191 Y92.346 E.07381
G1 X86.086 Y64.45 E1.30862
G1 X89.478 Y64.45 E.11252
G1 X195.812 Y170.784 E4.98832
G1 X195.812 Y169.652 E.03755
G1 X173.914 Y191.55 E1.02728
G1 X170.522 Y191.55 E.11252
G1 X58.191 Y79.219 E5.26967
G1 X58.191 Y76.994 E.07381
G1 X70.734 Y64.45 E.58843
G1 X74.126 Y64.45 E.11252
G1 X195.812 Y186.136 E5.70852
G1 X195.812 Y185.004 E.03755
G1 X189.266 Y191.55 E.30708
G1 X185.874 Y191.55 E.11252
G1 X58.774 Y64.45 E5.96249
G1 X58.191 Y64.45 E.01935
G1 X58.191 Y65.495 E.03466
M106 S191.25
; CHANGE_LAYER
; Z_HEIGHT: 2.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X58.191 Y64.45 E-.39704
G1 X58.774 Y64.45 E-.22172
G1 X59.037 Y64.713 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 12/50
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
G3 Z2.6 I.026 J1.217 P1  F30000
G1 X196.469 Y61.827 Z2.6
G1 Z2.4
G1 E.8 F1800
; FEATURE: Support interface
; LINE_WIDTH: 0.42
G1 F4800
G1 X196.173 Y61.827 E.00912
G1 X196.173 Y62.961 E.03485
G1 X196.658 Y62.961 E.01491
G1 X196.658 Y61.827 E.03485
G1 X197.535 Y61.827 E.02695
G1 X197.535 Y62.961 E.03485
G1 X198.412 Y62.961 E.02695
G1 X198.412 Y61.827 E.03485
G1 X199.289 Y61.827 E.02695
G1 X199.289 Y194.173 E4.06661
G1 X200.166 Y194.173 E.02695
G1 X200.166 Y61.827 E4.06661
G1 X201.043 Y61.827 E.02695
G1 X201.043 Y194.173 E4.06661
G1 X201.92 Y194.173 E.02695
G1 X201.92 Y61.827 E4.06661
G1 X202.304 Y61.827 F30000
; FEATURE: Support
G1 F9000
G1 X204.804 Y61.827 E.07682
G1 X204.804 Y64.704 E.0884
G1 X202.304 Y64.704 E.07682
G1 X202.304 Y67.581 E.0884
G1 X204.804 Y67.581 E.07682
G1 X204.804 Y70.458 E.0884
G1 X202.304 Y70.458 E.07682
G1 X202.304 Y73.336 E.0884
G1 X204.804 Y73.336 E.07682
G1 X204.804 Y76.213 E.0884
G1 X202.304 Y76.213 E.07682
G1 X202.304 Y79.09 E.0884
G1 X204.804 Y79.09 E.07682
G1 X204.804 Y81.967 E.0884
G1 X202.304 Y81.967 E.07682
G1 X202.304 Y84.844 E.0884
G1 X204.804 Y84.844 E.07682
G1 X204.804 Y87.721 E.0884
G1 X202.304 Y87.721 E.07682
G1 X202.304 Y90.598 E.0884
G1 X204.804 Y90.598 E.07682
G1 X204.804 Y93.475 E.0884
G1 X202.304 Y93.475 E.07682
G1 X202.304 Y96.352 E.0884
G1 X204.804 Y96.352 E.07682
G1 X204.804 Y99.229 E.0884
G1 X202.304 Y99.229 E.07682
G1 X202.304 Y102.106 E.0884
G1 X204.804 Y102.106 E.07682
G1 X204.804 Y104.983 E.0884
G1 X202.304 Y104.983 E.07682
G1 X202.304 Y107.86 E.0884
G1 X204.804 Y107.86 E.07682
G1 X204.804 Y110.738 E.0884
G1 X202.304 Y110.738 E.07682
G1 X202.304 Y113.615 E.0884
G1 X204.804 Y113.615 E.07682
G1 X204.804 Y116.492 E.0884
G1 X202.304 Y116.492 E.07682
G1 X202.304 Y119.369 E.0884
G1 X204.804 Y119.369 E.07682
G1 X204.804 Y122.246 E.0884
G1 X202.304 Y122.246 E.07682
G1 X202.304 Y125.123 E.0884
M73 P43 R37
G1 X204.804 Y125.123 E.07682
G1 X204.804 Y128 E.0884
G1 X202.304 Y128 E.07682
G1 X202.304 Y130.877 E.0884
G1 X204.804 Y130.877 E.07682
G1 X204.804 Y133.754 E.0884
G1 X202.304 Y133.754 E.07682
G1 X202.304 Y136.631 E.0884
G1 X204.804 Y136.631 E.07682
G1 X204.804 Y139.508 E.0884
G1 X202.304 Y139.508 E.07682
G1 X202.304 Y142.385 E.0884
G1 X204.804 Y142.385 E.07682
G1 X204.804 Y145.262 E.0884
G1 X202.304 Y145.262 E.07682
G1 X202.304 Y148.14 E.0884
G1 X204.804 Y148.14 E.07682
G1 X204.804 Y151.017 E.0884
G1 X202.304 Y151.017 E.07682
G1 X202.304 Y153.894 E.0884
G1 X204.804 Y153.894 E.07682
G1 X204.804 Y156.771 E.0884
G1 X202.304 Y156.771 E.07682
G1 X202.304 Y159.648 E.0884
G1 X204.804 Y159.648 E.07682
G1 X204.804 Y162.525 E.0884
G1 X202.304 Y162.525 E.07682
G1 X202.304 Y165.402 E.0884
G1 X204.804 Y165.402 E.07682
G1 X204.804 Y168.279 E.0884
G1 X202.304 Y168.279 E.07682
G1 X202.304 Y171.156 E.0884
G1 X204.804 Y171.156 E.07682
G1 X204.804 Y174.033 E.0884
G1 X202.304 Y174.033 E.07682
G1 X202.304 Y176.91 E.0884
G1 X204.804 Y176.91 E.07682
G1 X204.804 Y179.787 E.0884
G1 X202.304 Y179.787 E.07682
G1 X202.304 Y182.665 E.0884
G1 X204.804 Y182.665 E.07682
G1 X204.804 Y185.542 E.0884
G1 X202.304 Y185.542 E.07682
G1 X202.304 Y188.419 E.0884
G1 X204.804 Y188.419 E.07682
G1 X204.804 Y191.296 E.0884
G1 X202.304 Y191.296 E.07682
G1 X202.304 Y194.173 E.0884
G1 X204.804 Y194.173 E.07682
; WIPE_START
G1 F24000
G1 X202.804 Y194.173 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I.423 J-1.141 P1  F30000
G1 X198.988 Y192.758 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Support interface
G1 F4800
G3 X198.636 Y192.889 I-.241 J-.111 E.0128
G3 X198.412 Y193.039 I-.187 J-.037 E.0092
G1 X198.412 Y194.173 E.03485
G1 X197.535 Y194.173 E.02695
G1 X197.535 Y193.039 E.03485
G1 X196.658 Y193.039 E.02695
G1 X196.658 Y194.173 E.03485
G1 X196.173 Y194.173 E.01491
G1 X196.173 Y193.039 E.03485
G1 X196.469 Y193.039 E.00912
; WIPE_START
G1 F24000
G1 X196.173 Y193.039 E-.11273
G1 X196.173 Y194.173 E-.43105
G1 X196.658 Y194.173 E-.18437
G1 X196.658 Y194.089 E-.03185
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I.019 J-1.217 P1  F30000
G1 X57.75 Y191.898 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X57.75 Y64.102 E4.23922
G1 X197.647 Y64.102 E4.64064
G1 X197.661 Y64.102 E.00045
G1 X197.661 Y191.898 E4.23922
G1 X197.647 Y191.898 E.00045
G1 X57.81 Y191.898 E4.63865
G1 X57.358 Y192.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X57.358 Y63.71 E3.9509
G1 X57.41 Y63.71 E.00158
G1 X198.03 Y63.71 E4.32087
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X198.053 Y63.71 E.00077
G1 X198.053 Y192.29 E4.26523
G1 X198.03 Y192.29 E.00077
M106 S191.25
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X197.661 Y192.29 E.01134
G1 X57.418 Y192.29 E4.30926
M204 S10000
; WIPE_START
G1 F24000
G1 X57.417 Y190.29 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I-.5 J1.109 P1  F30000
G1 X58.099 Y190.597 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X58.099 Y191.55 E.0316
G1 X58.774 Y191.55 E.02242
G1 X185.874 Y64.45 E5.96249
G1 X189.266 Y64.45 E.11252
G1 X196.245 Y71.43 E.32741
G1 X196.245 Y69.431 E.0663
G1 X74.126 Y191.55 E5.72884
G1 X70.734 Y191.55 E.11252
G1 X58.099 Y178.914 E.59276
G1 X58.099 Y176.874 E.06769
G1 X170.522 Y64.45 E5.274
G1 X173.914 Y64.45 E.11252
G1 X196.245 Y86.781 E1.0476
G1 X196.245 Y84.783 E.0663
G1 X89.478 Y191.55 E5.00865
G1 X86.086 Y191.55 E.11252
G1 X58.099 Y163.562 E1.31295
G1 X58.099 Y161.522 E.06769
G1 X155.17 Y64.45 E4.55381
G1 X158.562 Y64.45 E.11252
G1 X196.245 Y102.133 E1.76779
G1 X196.245 Y100.135 E.0663
G1 X104.83 Y191.55 E4.28846
G1 X101.438 Y191.55 E.11252
G1 X58.099 Y148.21 E2.03314
G1 X58.099 Y146.17 E.06769
G1 X139.818 Y64.45 E3.83362
G1 X143.21 Y64.45 E.11252
G1 X196.245 Y117.485 E2.48798
G1 X196.245 Y115.487 E.0663
G1 X120.182 Y191.55 E3.56827
G1 X116.79 Y191.55 E.11252
G1 X58.099 Y132.858 E2.75334
G1 X58.099 Y130.818 E.06769
G1 X124.466 Y64.45 E3.11343
G1 X127.858 Y64.45 E.11252
G1 X196.245 Y132.837 E3.20817
G1 X196.245 Y130.839 E.0663
G1 X135.534 Y191.55 E2.84808
G1 X132.142 Y191.55 E.11252
G1 X58.099 Y117.506 E3.47353
G1 X58.099 Y115.466 E.06769
G1 X109.114 Y64.45 E2.39324
G1 X112.506 Y64.45 E.11252
G1 X196.245 Y148.189 E3.92836
G1 X196.245 Y146.191 E.0663
G1 X150.886 Y191.55 E2.12789
G1 X147.494 Y191.55 E.11252
G1 X58.099 Y102.154 E4.19372
G1 X58.099 Y100.114 E.06769
G1 X93.762 Y64.45 E1.67305
G1 X97.154 Y64.45 E.11252
G1 X196.245 Y163.541 E4.64855
G1 X196.245 Y161.543 E.0663
G1 X166.238 Y191.55 E1.40769
G1 X162.846 Y191.55 E.11252
G1 X58.099 Y86.802 E4.91391
G1 X58.099 Y84.762 E.06769
G1 X78.41 Y64.45 E.95286
G1 X81.802 Y64.45 E.11252
G1 X196.245 Y178.893 E5.36874
G1 X196.245 Y176.894 E.0663
G1 X181.59 Y191.55 E.6875
G1 X178.198 Y191.55 E.11252
G1 X58.099 Y71.451 E5.6341
G1 X58.099 Y69.41 E.06769
G1 X63.058 Y64.45 E.23267
G1 X66.45 Y64.45 E.11252
G1 X193.55 Y191.55 E5.96249
G1 X195.178 Y191.55 E.05401
G1 X196.701 Y191.442 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.547323
G1 F12490.013
G1 X197.205 Y191.442 E.02073
G1 X197.205 Y64.558 E5.21526
G1 X196.701 Y64.558 E.02073
G1 X196.701 Y191.382 E5.21279
G1 X195.178 Y64.45 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X193.55 Y64.45 E.05401
G1 X66.45 Y191.55 E5.96249
G1 X63.058 Y191.55 E.11252
G1 X58.099 Y186.59 E.23267
G1 X58.099 Y184.549 E.06769
G1 X178.198 Y64.45 E5.6341
G1 X181.59 Y64.45 E.11252
G1 X196.245 Y79.106 E.6875
G1 X196.245 Y77.107 E.0663
G1 X81.802 Y191.55 E5.36874
G1 X78.41 Y191.55 E.11252
G1 X58.099 Y171.238 E.95286
G1 X58.099 Y169.198 E.06769
G1 X162.846 Y64.45 E4.91391
G1 X166.238 Y64.45 E.11252
G1 X196.245 Y94.457 E1.40769
G1 X196.245 Y92.459 E.0663
G1 X97.154 Y191.55 E4.64855
G1 X93.762 Y191.55 E.11252
G1 X58.099 Y155.886 E1.67305
G1 X58.099 Y153.846 E.06769
G1 X147.494 Y64.45 E4.19372
G1 X150.886 Y64.45 E.11252
G1 X196.245 Y109.809 E2.12789
G1 X196.245 Y107.811 E.0663
G1 X112.506 Y191.55 E3.92836
G1 X109.114 Y191.55 E.11252
G1 X58.099 Y140.534 E2.39324
G1 X58.099 Y138.494 E.06769
G1 X132.142 Y64.45 E3.47353
G1 X135.534 Y64.45 E.11252
G1 X196.245 Y125.161 E2.84808
G1 X196.245 Y123.163 E.0663
G1 X127.858 Y191.55 E3.20817
G1 X124.466 Y191.55 E.11252
G1 X58.099 Y125.182 E3.11343
G1 X58.099 Y123.142 E.06769
G1 X116.79 Y64.45 E2.75334
G1 X120.182 Y64.45 E.11252
G1 X196.245 Y140.513 E3.56827
G1 X196.245 Y138.515 E.0663
G1 X143.21 Y191.55 E2.48798
G1 X139.818 Y191.55 E.11252
G1 X58.099 Y109.83 E3.83362
G1 X58.099 Y107.79 E.06769
G1 X101.438 Y64.45 E2.03314
G1 X104.83 Y64.45 E.11252
G1 X196.245 Y155.865 E4.28846
M73 P43 R36
G1 X196.245 Y153.867 E.0663
G1 X158.562 Y191.55 E1.76779
G1 X155.17 Y191.55 E.11252
G1 X58.099 Y94.478 E4.55381
G1 X58.099 Y92.438 E.06769
G1 X86.086 Y64.45 E1.31295
G1 X89.478 Y64.45 E.11252
G1 X196.245 Y171.217 E5.00865
G1 X196.245 Y169.219 E.0663
G1 X173.914 Y191.55 E1.0476
G1 X170.522 Y191.55 E.11252
G1 X58.099 Y79.126 E5.274
G1 X58.099 Y77.086 E.06769
G1 X70.734 Y64.45 E.59276
G1 X74.126 Y64.45 E.11252
G1 X196.245 Y186.569 E5.72884
G1 X196.245 Y184.57 E.0663
G1 X189.266 Y191.55 E.32741
G1 X185.874 Y191.55 E.11252
G1 X58.774 Y64.45 E5.96249
G1 X58.099 Y64.45 E.02242
G1 X58.099 Y65.403 E.0316
; CHANGE_LAYER
; Z_HEIGHT: 2.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X58.099 Y64.45 E-.36196
G1 X58.774 Y64.45 E-.25681
G1 X59.037 Y64.713 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 13/50
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
G3 Z2.8 I.021 J1.217 P1  F30000
G1 X199.05 Y62.285 Z2.8
G1 Z2.6
G1 E.8 F1800
; FEATURE: Support interface
; LINE_WIDTH: 0.42
G1 F4800
G1 X199.05 Y61.827 E.01406
G1 X199.289 Y61.827 E.00736
M73 P44 R36
G1 X199.289 Y63.111 E.03946
G1 X199.518 Y63.339 E.00991
G1 X199.518 Y192.661 E3.9737
G1 X199.289 Y192.889 E.00991
G1 X199.289 Y194.173 E.03946
G1 X200.166 Y194.173 E.02695
G1 X200.166 Y61.827 E4.06661
G1 X201.043 Y61.827 E.02695
G1 X201.043 Y194.173 E4.06661
G1 X201.92 Y194.173 E.02695
G1 X201.92 Y61.827 E4.06661
G1 X202.304 Y61.827 F30000
; FEATURE: Support
G1 F9000
G1 X204.804 Y61.827 E.07682
G1 X204.804 Y64.704 E.0884
G1 X202.304 Y64.704 E.07682
G1 X202.304 Y67.581 E.0884
G1 X204.804 Y67.581 E.07682
G1 X204.804 Y70.458 E.0884
G1 X202.304 Y70.458 E.07682
G1 X202.304 Y73.336 E.0884
G1 X204.804 Y73.336 E.07682
G1 X204.804 Y76.213 E.0884
G1 X202.304 Y76.213 E.07682
G1 X202.304 Y79.09 E.0884
G1 X204.804 Y79.09 E.07682
G1 X204.804 Y81.967 E.0884
G1 X202.304 Y81.967 E.07682
G1 X202.304 Y84.844 E.0884
G1 X204.804 Y84.844 E.07682
G1 X204.804 Y87.721 E.0884
G1 X202.304 Y87.721 E.07682
G1 X202.304 Y90.598 E.0884
G1 X204.804 Y90.598 E.07682
G1 X204.804 Y93.475 E.0884
G1 X202.304 Y93.475 E.07682
G1 X202.304 Y96.352 E.0884
G1 X204.804 Y96.352 E.07682
G1 X204.804 Y99.229 E.0884
G1 X202.304 Y99.229 E.07682
G1 X202.304 Y102.106 E.0884
G1 X204.804 Y102.106 E.07682
G1 X204.804 Y104.983 E.0884
G1 X202.304 Y104.983 E.07682
G1 X202.304 Y107.86 E.0884
G1 X204.804 Y107.86 E.07682
G1 X204.804 Y110.738 E.0884
G1 X202.304 Y110.738 E.07682
G1 X202.304 Y113.615 E.0884
G1 X204.804 Y113.615 E.07682
G1 X204.804 Y116.492 E.0884
G1 X202.304 Y116.492 E.07682
G1 X202.304 Y119.369 E.0884
G1 X204.804 Y119.369 E.07682
G1 X204.804 Y122.246 E.0884
G1 X202.304 Y122.246 E.07682
G1 X202.304 Y125.123 E.0884
G1 X204.804 Y125.123 E.07682
G1 X204.804 Y128 E.0884
G1 X202.304 Y128 E.07682
G1 X202.304 Y130.877 E.0884
G1 X204.804 Y130.877 E.07682
G1 X204.804 Y133.754 E.0884
G1 X202.304 Y133.754 E.07682
G1 X202.304 Y136.631 E.0884
G1 X204.804 Y136.631 E.07682
G1 X204.804 Y139.508 E.0884
G1 X202.304 Y139.508 E.07682
G1 X202.304 Y142.385 E.0884
G1 X204.804 Y142.385 E.07682
G1 X204.804 Y145.262 E.0884
G1 X202.304 Y145.262 E.07682
G1 X202.304 Y148.14 E.0884
G1 X204.804 Y148.14 E.07682
G1 X204.804 Y151.017 E.0884
G1 X202.304 Y151.017 E.07682
G1 X202.304 Y153.894 E.0884
G1 X204.804 Y153.894 E.07682
G1 X204.804 Y156.771 E.0884
G1 X202.304 Y156.771 E.07682
G1 X202.304 Y159.648 E.0884
G1 X204.804 Y159.648 E.07682
G1 X204.804 Y162.525 E.0884
G1 X202.304 Y162.525 E.07682
G1 X202.304 Y165.402 E.0884
G1 X204.804 Y165.402 E.07682
G1 X204.804 Y168.279 E.0884
G1 X202.304 Y168.279 E.07682
G1 X202.304 Y171.156 E.0884
G1 X204.804 Y171.156 E.07682
G1 X204.804 Y174.033 E.0884
G1 X202.304 Y174.033 E.07682
G1 X202.304 Y176.91 E.0884
G1 X204.804 Y176.91 E.07682
G1 X204.804 Y179.787 E.0884
G1 X202.304 Y179.787 E.07682
G1 X202.304 Y182.665 E.0884
G1 X204.804 Y182.665 E.07682
G1 X204.804 Y185.542 E.0884
G1 X202.304 Y185.542 E.07682
G1 X202.304 Y188.419 E.0884
G1 X204.804 Y188.419 E.07682
G1 X204.804 Y191.296 E.0884
G1 X202.304 Y191.296 E.07682
G1 X202.304 Y194.173 E.0884
G1 X204.804 Y194.173 E.07682
; WIPE_START
G1 F24000
G1 X202.804 Y194.173 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I.019 J-1.217 P1  F30000
G1 X57.658 Y191.898 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X57.658 Y64.102 E4.23922
G1 X198.08 Y64.102 E4.65807
G1 X198.094 Y64.102 E.00045
G1 X198.094 Y191.898 E4.23922
G1 X198.08 Y191.898 E.00045
G1 X57.718 Y191.898 E4.65608
G1 X57.266 Y192.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X57.266 Y63.71 E3.9509
G1 X57.317 Y63.71 E.00158
G1 X198.463 Y63.71 E4.33702
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X198.486 Y63.71 E.00077
G1 X198.486 Y192.29 E4.26523
G1 X198.463 Y192.29 E.00077
M106 S191.25
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X198.094 Y192.29 E.01134
G1 X57.326 Y192.29 E4.32541
M204 S10000
; WIPE_START
G1 F24000
G1 X57.325 Y190.29 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I-.616 J1.05 P1  F30000
G1 X58.006 Y190.689 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X58.006 Y191.55 E.02853
G1 X58.774 Y191.55 E.02548
G1 X185.874 Y64.45 E5.96249
G1 X189.266 Y64.45 E.11252
G1 X196.678 Y71.863 E.34773
G1 X196.678 Y68.998 E.09504
G1 X74.126 Y191.55 E5.74916
G1 X70.734 Y191.55 E.11252
G1 X58.006 Y178.822 E.59709
G1 X58.006 Y176.966 E.06156
G1 X170.522 Y64.45 E5.27833
G1 X173.914 Y64.45 E.11252
G1 X196.678 Y87.215 E1.06792
G1 X196.678 Y84.35 E.09504
G1 X89.478 Y191.55 E5.02897
G1 X86.086 Y191.55 E.11252
G1 X58.006 Y163.47 E1.31729
G1 X58.006 Y161.614 E.06156
G1 X155.17 Y64.45 E4.55814
G1 X158.562 Y64.45 E.11252
G1 X196.678 Y102.567 E1.78811
G1 X196.678 Y99.702 E.09504
G1 X104.83 Y191.55 E4.30878
G1 X101.438 Y191.55 E.11252
G1 X58.006 Y148.118 E2.03748
G1 X58.006 Y146.262 E.06156
G1 X139.818 Y64.45 E3.83795
G1 X143.21 Y64.45 E.11252
G1 X196.678 Y117.919 E2.5083
G1 X196.678 Y115.054 E.09504
G1 X120.182 Y191.55 E3.58859
G1 X116.79 Y191.55 E.11252
G1 X58.006 Y132.766 E2.75767
G1 X58.006 Y130.91 E.06156
G1 X124.466 Y64.45 E3.11776
G1 X127.858 Y64.45 E.11252
G1 X196.678 Y133.271 E3.2285
G1 X196.678 Y130.405 E.09504
G1 X135.534 Y191.55 E2.8684
G1 X132.142 Y191.55 E.11252
G1 X58.006 Y117.414 E3.47786
G1 X58.006 Y115.558 E.06156
G1 X109.114 Y64.45 E2.39757
G1 X112.506 Y64.45 E.11252
G1 X196.678 Y148.622 E3.94869
G1 X196.678 Y145.757 E.09504
G1 X150.886 Y191.55 E2.14821
G1 X147.494 Y191.55 E.11252
G1 X58.006 Y102.062 E4.19805
G1 X58.006 Y100.206 E.06156
G1 X93.762 Y64.45 E1.67738
G1 X97.154 Y64.45 E.11252
G1 X196.678 Y163.974 E4.66888
G1 X196.678 Y161.109 E.09504
G1 X166.238 Y191.55 E1.42802
G1 X162.846 Y191.55 E.11252
G1 X58.006 Y86.71 E4.91824
G1 X58.006 Y84.854 E.06156
G1 X78.41 Y64.45 E.95719
G1 X81.802 Y64.45 E.11252
G1 X196.678 Y179.326 E5.38907
G1 X196.678 Y176.461 E.09504
G1 X181.59 Y191.55 E.70783
G1 X178.198 Y191.55 E.11252
G1 X58.006 Y71.358 E5.63843
G1 X58.006 Y69.502 E.06156
G1 X63.058 Y64.45 E.237
G1 X66.45 Y64.45 E.11252
G1 X193.55 Y191.55 E5.96249
G1 X195.178 Y191.55 E.05401
G1 X197.134 Y64.558 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.547323
G1 F12490.013
G1 X197.134 Y191.442 E5.21526
G1 X197.638 Y191.442 E.02073
G1 X197.638 Y64.558 E5.21526
G1 X197.194 Y64.558 E.01827
G1 X195.178 Y64.45 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X193.55 Y64.45 E.05401
G1 X66.45 Y191.55 E5.96249
G1 X63.058 Y191.55 E.11252
G1 X58.006 Y186.498 E.237
G1 X58.006 Y184.642 E.06156
G1 X178.198 Y64.45 E5.63843
G1 X181.59 Y64.45 E.11252
G1 X196.678 Y79.539 E.70783
G1 X196.678 Y76.674 E.09504
G1 X81.802 Y191.55 E5.38907
G1 X78.41 Y191.55 E.11252
G1 X58.006 Y171.146 E.95719
G1 X58.006 Y169.29 E.06156
G1 X162.846 Y64.45 E4.91824
G1 X166.238 Y64.45 E.11252
G1 X196.678 Y94.891 E1.42802
G1 X196.678 Y92.026 E.09504
G1 X97.154 Y191.55 E4.66888
G1 X93.762 Y191.55 E.11252
G1 X58.006 Y155.794 E1.67738
G1 X58.006 Y153.938 E.06156
G1 X147.494 Y64.45 E4.19805
G1 X150.886 Y64.45 E.11252
G1 X196.678 Y110.243 E2.14821
G1 X196.678 Y107.378 E.09504
G1 X112.506 Y191.55 E3.94869
G1 X109.114 Y191.55 E.11252
G1 X58.006 Y140.442 E2.39757
G1 X58.006 Y138.586 E.06156
G1 X132.142 Y64.45 E3.47786
G1 X135.534 Y64.45 E.11252
G1 X196.678 Y125.595 E2.8684
G1 X196.678 Y122.73 E.09504
G1 X127.858 Y191.55 E3.2285
G1 X124.466 Y191.55 E.11252
G1 X58.006 Y125.09 E3.11776
G1 X58.006 Y123.234 E.06156
G1 X116.79 Y64.45 E2.75767
G1 X120.182 Y64.45 E.11252
M73 P45 R36
G1 X196.678 Y140.946 E3.58859
G1 X196.678 Y138.081 E.09504
G1 X143.21 Y191.55 E2.5083
G1 X139.818 Y191.55 E.11252
G1 X58.006 Y109.738 E3.83795
G1 X58.006 Y107.882 E.06156
G1 X101.438 Y64.45 E2.03748
G1 X104.83 Y64.45 E.11252
G1 X196.678 Y156.298 E4.30878
G1 X196.678 Y153.433 E.09504
G1 X158.562 Y191.55 E1.78811
G1 X155.17 Y191.55 E.11252
G1 X58.006 Y94.386 E4.55814
G1 X58.006 Y92.53 E.06156
G1 X86.086 Y64.45 E1.31728
G1 X89.478 Y64.45 E.11252
G1 X196.678 Y171.65 E5.02897
G1 X196.678 Y168.785 E.09504
G1 X173.914 Y191.55 E1.06792
G1 X170.522 Y191.55 E.11252
G1 X58.006 Y79.034 E5.27833
G1 X58.006 Y77.178 E.06156
G1 X70.734 Y64.45 E.59709
G1 X74.126 Y64.45 E.11252
G1 X196.678 Y187.002 E5.74916
G1 X196.678 Y184.137 E.09504
G1 X189.266 Y191.55 E.34773
G1 X185.874 Y191.55 E.11252
G1 X58.774 Y64.45 E5.96249
G1 X58.006 Y64.45 E.02548
G1 X58.006 Y65.311 E.02853
M106 S193.8
; CHANGE_LAYER
; Z_HEIGHT: 2.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X58.006 Y64.45 E-.32687
G1 X58.774 Y64.45 E-.29189
G1 X59.037 Y64.713 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 14/50
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
G3 Z3 I.025 J1.217 P1  F30000
G1 X199.101 Y61.827 Z3
G1 Z2.8
G1 E.8 F1800
; FEATURE: Support interface
; LINE_WIDTH: 0.42
G1 F4800
G1 X199.05 Y61.827 E.00156
G1 X199.05 Y62.961 E.03485
G1 X199.289 Y62.961 E.00736
G1 X199.289 Y61.827 E.03485
G1 X199.978 Y61.827 E.02116
; WIPE_START
G1 F24000
G1 X199.289 Y61.827 E-.26164
G1 X199.289 Y62.961 E-.43104
G1 X199.112 Y62.961 E-.06732
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I-1.217 J0 P1  F30000
G1 X199.101 Y194.173 Z3.2
G1 Z2.8
G1 E.8 F1800
G1 F4800
G1 X199.05 Y194.173 E.00156
G1 X199.05 Y193.039 E.03485
G1 X199.289 Y193.039 E.00735
G1 X199.289 Y194.173 E.03485
G1 X200.166 Y194.173 E.02695
G1 X200.166 Y61.827 E4.06661
G1 X201.043 Y61.827 E.02695
M73 P45 R35
G1 X201.043 Y194.173 E4.06661
G1 X201.92 Y194.173 E.02695
G1 X201.92 Y61.827 E4.06661
G1 X202.304 Y61.827 F30000
; FEATURE: Support
G1 F9000
G1 X204.804 Y61.827 E.07682
G1 X204.804 Y64.704 E.0884
G1 X202.304 Y64.704 E.07682
G1 X202.304 Y67.581 E.0884
G1 X204.804 Y67.581 E.07682
G1 X204.804 Y70.458 E.0884
G1 X202.304 Y70.458 E.07682
G1 X202.304 Y73.336 E.0884
G1 X204.804 Y73.336 E.07682
G1 X204.804 Y76.213 E.0884
G1 X202.304 Y76.213 E.07682
G1 X202.304 Y79.09 E.0884
G1 X204.804 Y79.09 E.07682
G1 X204.804 Y81.967 E.0884
G1 X202.304 Y81.967 E.07682
G1 X202.304 Y84.844 E.0884
G1 X204.804 Y84.844 E.07682
G1 X204.804 Y87.721 E.0884
G1 X202.304 Y87.721 E.07682
G1 X202.304 Y90.598 E.0884
G1 X204.804 Y90.598 E.07682
G1 X204.804 Y93.475 E.0884
G1 X202.304 Y93.475 E.07682
G1 X202.304 Y96.352 E.0884
G1 X204.804 Y96.352 E.07682
G1 X204.804 Y99.229 E.0884
G1 X202.304 Y99.229 E.07682
G1 X202.304 Y102.106 E.0884
G1 X204.804 Y102.106 E.07682
G1 X204.804 Y104.983 E.0884
G1 X202.304 Y104.983 E.07682
G1 X202.304 Y107.86 E.0884
G1 X204.804 Y107.86 E.07682
G1 X204.804 Y110.738 E.0884
G1 X202.304 Y110.738 E.07682
G1 X202.304 Y113.615 E.0884
G1 X204.804 Y113.615 E.07682
G1 X204.804 Y116.492 E.0884
G1 X202.304 Y116.492 E.07682
G1 X202.304 Y119.369 E.0884
G1 X204.804 Y119.369 E.07682
G1 X204.804 Y122.246 E.0884
G1 X202.304 Y122.246 E.07682
G1 X202.304 Y125.123 E.0884
G1 X204.804 Y125.123 E.07682
G1 X204.804 Y128 E.0884
G1 X202.304 Y128 E.07682
G1 X202.304 Y130.877 E.0884
G1 X204.804 Y130.877 E.07682
G1 X204.804 Y133.754 E.0884
G1 X202.304 Y133.754 E.07682
G1 X202.304 Y136.631 E.0884
G1 X204.804 Y136.631 E.07682
G1 X204.804 Y139.508 E.0884
G1 X202.304 Y139.508 E.07682
G1 X202.304 Y142.385 E.0884
G1 X204.804 Y142.385 E.07682
G1 X204.804 Y145.262 E.0884
G1 X202.304 Y145.262 E.07682
G1 X202.304 Y148.14 E.0884
G1 X204.804 Y148.14 E.07682
G1 X204.804 Y151.017 E.0884
G1 X202.304 Y151.017 E.07682
G1 X202.304 Y153.894 E.0884
G1 X204.804 Y153.894 E.07682
G1 X204.804 Y156.771 E.0884
G1 X202.304 Y156.771 E.07682
G1 X202.304 Y159.648 E.0884
G1 X204.804 Y159.648 E.07682
G1 X204.804 Y162.525 E.0884
G1 X202.304 Y162.525 E.07682
G1 X202.304 Y165.402 E.0884
G1 X204.804 Y165.402 E.07682
G1 X204.804 Y168.279 E.0884
G1 X202.304 Y168.279 E.07682
G1 X202.304 Y171.156 E.0884
G1 X204.804 Y171.156 E.07682
G1 X204.804 Y174.033 E.0884
G1 X202.304 Y174.033 E.07682
G1 X202.304 Y176.91 E.0884
G1 X204.804 Y176.91 E.07682
G1 X204.804 Y179.787 E.0884
G1 X202.304 Y179.787 E.07682
G1 X202.304 Y182.665 E.0884
G1 X204.804 Y182.665 E.07682
G1 X204.804 Y185.542 E.0884
G1 X202.304 Y185.542 E.07682
G1 X202.304 Y188.419 E.0884
G1 X204.804 Y188.419 E.07682
G1 X204.804 Y191.296 E.0884
G1 X202.304 Y191.296 E.07682
G1 X202.304 Y194.173 E.0884
G1 X204.804 Y194.173 E.07682
; WIPE_START
G1 F24000
G1 X202.804 Y194.173 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I.019 J-1.217 P1  F30000
G1 X57.566 Y191.898 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X57.566 Y64.102 E4.23922
G1 X198.514 Y64.102 E4.67551
G1 X198.527 Y64.102 E.00045
G1 X198.527 Y191.898 E4.23922
G1 X198.514 Y191.898 E.00045
G1 X57.626 Y191.898 E4.67352
G1 X57.174 Y192.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X57.174 Y63.71 E3.9509
G1 X57.225 Y63.71 E.00158
G1 X198.896 Y63.71 E4.35316
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X198.919 Y63.71 E.00077
G1 X198.919 Y192.29 E4.26523
G1 X198.896 Y192.29 E.00077
M106 S193.8
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X198.527 Y192.29 E.01134
G1 X57.234 Y192.29 E4.34156
M204 S10000
; WIPE_START
G1 F24000
G1 X57.233 Y190.29 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I-.712 J.987 P1  F30000
G1 X57.914 Y190.782 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X57.914 Y191.55 E.02547
G1 X58.774 Y191.55 E.02854
G1 X185.874 Y64.45 E5.96249
G1 X189.266 Y64.45 E.11252
G1 X197.111 Y72.296 E.36806
G1 X197.111 Y68.565 E.12378
G1 X74.126 Y191.55 E5.76949
G1 X70.734 Y191.55 E.11252
G1 X57.914 Y178.729 E.60143
G1 X57.914 Y177.058 E.05544
G1 X170.522 Y64.45 E5.28267
G1 X173.914 Y64.45 E.11252
G1 X197.111 Y87.648 E1.08825
G1 X197.111 Y83.916 E.12378
G1 X89.478 Y191.55 E5.0493
G1 X86.086 Y191.55 E.11252
G1 X57.914 Y163.377 E1.32162
G1 X57.914 Y161.706 E.05544
G1 X155.17 Y64.45 E4.56247
G1 X158.562 Y64.45 E.11252
G1 X197.111 Y103 E1.80844
G1 X197.111 Y99.268 E.12378
G1 X104.83 Y191.55 E4.32911
G1 X101.438 Y191.55 E.11252
G1 X57.914 Y148.026 E2.04181
G1 X57.914 Y146.354 E.05544
G1 X139.818 Y64.45 E3.84228
G1 X143.21 Y64.45 E.11252
G1 X197.111 Y118.352 E2.52863
G1 X197.111 Y114.62 E.12378
G1 X120.182 Y191.55 E3.60892
G1 X116.79 Y191.55 E.11252
G1 X57.914 Y132.674 E2.762
G1 X57.914 Y131.002 E.05544
G1 X124.466 Y64.45 E3.12209
G1 X127.858 Y64.45 E.11252
G1 X197.111 Y133.704 E3.24882
G1 X197.111 Y129.972 E.12378
G1 X135.534 Y191.55 E2.88872
G1 X132.142 Y191.55 E.11252
G1 X57.914 Y117.322 E3.48219
G1 X57.914 Y115.65 E.05544
G1 X109.114 Y64.45 E2.4019
G1 X112.506 Y64.45 E.11252
G1 X197.111 Y149.056 E3.96901
G1 X197.111 Y145.324 E.12378
G1 X150.886 Y191.55 E2.16853
G1 X147.494 Y191.55 E.11252
G1 X57.914 Y101.97 E4.20238
G1 X57.914 Y100.299 E.05544
G1 X93.762 Y64.45 E1.68171
G1 X97.154 Y64.45 E.11252
G1 X197.111 Y164.408 E4.6892
G1 X197.111 Y160.676 E.12378
G1 X166.238 Y191.55 E1.44834
G1 X162.846 Y191.55 E.11252
G1 X57.914 Y86.618 E4.92257
G1 X57.914 Y84.947 E.05544
G1 X78.41 Y64.45 E.96152
G1 X81.802 Y64.45 E.11252
G1 X197.111 Y179.76 E5.40939
G1 X197.111 Y176.028 E.12378
G1 X181.59 Y191.55 E.72815
G1 X178.198 Y191.55 E.11252
G1 X57.914 Y71.266 E5.64276
G1 X57.914 Y69.595 E.05544
G1 X63.058 Y64.45 E.24133
G1 X66.45 Y64.45 E.11252
G1 X193.55 Y191.55 E5.96249
G1 X196.942 Y191.55 E.11252
G1 X197.111 Y191.38 E.00796
G1 X197.111 Y189.752 E.05401
G1 X197.567 Y191.442 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.547323
G1 F12490.013
G1 X198.072 Y191.442 E.02073
G1 X198.072 Y64.558 E5.21526
G1 X197.567 Y64.558 E.02073
G1 X197.567 Y191.382 E5.21279
G1 X197.111 Y66.248 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X197.111 Y64.62 E.05401
M73 P46 R35
G1 X196.942 Y64.45 E.00796
G1 X193.55 Y64.45 E.11252
G1 X66.45 Y191.55 E5.96249
G1 X63.058 Y191.55 E.11252
G1 X57.914 Y186.405 E.24133
G1 X57.914 Y184.734 E.05544
G1 X178.198 Y64.45 E5.64276
G1 X181.59 Y64.45 E.11252
G1 X197.111 Y79.972 E.72815
G1 X197.111 Y76.24 E.12378
G1 X81.802 Y191.55 E5.40939
G1 X78.41 Y191.55 E.11252
G1 X57.914 Y171.053 E.96152
G1 X57.914 Y169.382 E.05544
G1 X162.846 Y64.45 E4.92257
G1 X166.238 Y64.45 E.11252
G1 X197.111 Y95.324 E1.44834
G1 X197.111 Y91.592 E.12378
G1 X97.154 Y191.55 E4.6892
G1 X93.762 Y191.55 E.11252
G1 X57.914 Y155.701 E1.68171
G1 X57.914 Y154.03 E.05544
G1 X147.494 Y64.45 E4.20238
G1 X150.886 Y64.45 E.11252
G1 X197.111 Y110.676 E2.16853
G1 X197.111 Y106.944 E.12378
G1 X112.506 Y191.55 E3.96901
G1 X109.114 Y191.55 E.11252
G1 X57.914 Y140.35 E2.4019
G1 X57.914 Y138.678 E.05544
G1 X132.142 Y64.45 E3.48219
G1 X135.534 Y64.45 E.11252
G1 X197.111 Y126.028 E2.88872
G1 X197.111 Y122.296 E.12378
G1 X127.858 Y191.55 E3.24882
G1 X124.466 Y191.55 E.11252
G1 X57.914 Y124.998 E3.12209
G1 X57.914 Y123.326 E.05544
G1 X116.79 Y64.45 E2.762
G1 X120.182 Y64.45 E.11252
G1 X197.111 Y141.38 E3.60892
G1 X197.111 Y137.648 E.12378
G1 X143.21 Y191.55 E2.52863
G1 X139.818 Y191.55 E.11252
G1 X57.914 Y109.646 E3.84228
G1 X57.914 Y107.974 E.05544
G1 X101.438 Y64.45 E2.04181
G1 X104.83 Y64.45 E.11252
G1 X197.111 Y156.732 E4.32911
G1 X197.111 Y153 E.12378
G1 X158.562 Y191.55 E1.80844
G1 X155.17 Y191.55 E.11252
G1 X57.914 Y94.294 E4.56247
G1 X57.914 Y92.623 E.05544
G1 X86.086 Y64.45 E1.32162
G1 X89.478 Y64.45 E.11252
G1 X197.111 Y172.084 E5.0493
G1 X197.111 Y168.352 E.12378
G1 X173.914 Y191.55 E1.08825
G1 X170.522 Y191.55 E.11252
G1 X57.914 Y78.942 E5.28267
G1 X57.914 Y77.271 E.05544
G1 X70.734 Y64.45 E.60143
G1 X74.126 Y64.45 E.11252
G1 X197.111 Y187.436 E5.76949
G1 X197.111 Y183.704 E.12378
G1 X189.266 Y191.55 E.36806
G1 X185.874 Y191.55 E.11252
G1 X58.774 Y64.45 E5.96249
G1 X57.914 Y64.45 E.02854
G1 X57.914 Y65.218 E.02547
; CHANGE_LAYER
; Z_HEIGHT: 3
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X57.914 Y64.45 E-.29179
G1 X58.774 Y64.45 E-.32698
G1 X59.037 Y64.713 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 15/50
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
G3 Z3.2 I.025 J1.217 P1  F30000
G1 X199.101 Y61.827 Z3.2
G1 Z3
G1 E.8 F1800
; FEATURE: Support interface
; LINE_WIDTH: 0.42
G1 F4800
G1 X199.05 Y61.827 E.00156
G1 X199.05 Y62.961 E.03485
G1 X199.289 Y62.961 E.00736
G1 X199.289 Y61.827 E.03485
G1 X199.978 Y61.827 E.02116
; WIPE_START
G1 F24000
G1 X199.289 Y61.827 E-.26164
G1 X199.289 Y62.961 E-.43104
G1 X199.112 Y62.961 E-.06732
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.217 J0 P1  F30000
G1 X199.101 Y194.173 Z3.4
G1 Z3
G1 E.8 F1800
G1 F4800
G1 X199.05 Y194.173 E.00156
G1 X199.05 Y193.039 E.03485
G1 X199.289 Y193.039 E.00735
G1 X199.289 Y194.173 E.03485
G1 X200.166 Y194.173 E.02695
G1 X200.166 Y192.879 E.03975
G1 X200.384 Y192.661 E.00948
G1 X200.384 Y63.339 E3.9737
G1 X200.166 Y63.121 E.00948
G1 X200.166 Y61.827 E.03975
G1 X201.043 Y61.827 E.02695
G1 X201.043 Y194.173 E4.06661
G1 X201.92 Y194.173 E.02695
G1 X201.92 Y61.827 E4.06661
G1 X202.304 Y61.827 F30000
; FEATURE: Support
G1 F9000
G1 X204.804 Y61.827 E.07682
G1 X204.804 Y64.704 E.0884
G1 X202.304 Y64.704 E.07682
G1 X202.304 Y67.581 E.0884
G1 X204.804 Y67.581 E.07682
G1 X204.804 Y70.458 E.0884
G1 X202.304 Y70.458 E.07682
G1 X202.304 Y73.336 E.0884
G1 X204.804 Y73.336 E.07682
G1 X204.804 Y76.213 E.0884
G1 X202.304 Y76.213 E.07682
G1 X202.304 Y79.09 E.0884
G1 X204.804 Y79.09 E.07682
G1 X204.804 Y81.967 E.0884
G1 X202.304 Y81.967 E.07682
G1 X202.304 Y84.844 E.0884
G1 X204.804 Y84.844 E.07682
G1 X204.804 Y87.721 E.0884
G1 X202.304 Y87.721 E.07682
G1 X202.304 Y90.598 E.0884
G1 X204.804 Y90.598 E.07682
G1 X204.804 Y93.475 E.0884
G1 X202.304 Y93.475 E.07682
G1 X202.304 Y96.352 E.0884
G1 X204.804 Y96.352 E.07682
G1 X204.804 Y99.229 E.0884
G1 X202.304 Y99.229 E.07682
G1 X202.304 Y102.106 E.0884
G1 X204.804 Y102.106 E.07682
G1 X204.804 Y104.983 E.0884
G1 X202.304 Y104.983 E.07682
G1 X202.304 Y107.86 E.0884
G1 X204.804 Y107.86 E.07682
G1 X204.804 Y110.738 E.0884
G1 X202.304 Y110.738 E.07682
G1 X202.304 Y113.615 E.0884
G1 X204.804 Y113.615 E.07682
G1 X204.804 Y116.492 E.0884
G1 X202.304 Y116.492 E.07682
G1 X202.304 Y119.369 E.0884
G1 X204.804 Y119.369 E.07682
G1 X204.804 Y122.246 E.0884
G1 X202.304 Y122.246 E.07682
G1 X202.304 Y125.123 E.0884
G1 X204.804 Y125.123 E.07682
G1 X204.804 Y128 E.0884
G1 X202.304 Y128 E.07682
G1 X202.304 Y130.877 E.0884
G1 X204.804 Y130.877 E.07682
G1 X204.804 Y133.754 E.0884
G1 X202.304 Y133.754 E.07682
G1 X202.304 Y136.631 E.0884
G1 X204.804 Y136.631 E.07682
G1 X204.804 Y139.508 E.0884
G1 X202.304 Y139.508 E.07682
G1 X202.304 Y142.385 E.0884
G1 X204.804 Y142.385 E.07682
G1 X204.804 Y145.262 E.0884
G1 X202.304 Y145.262 E.07682
G1 X202.304 Y148.14 E.0884
G1 X204.804 Y148.14 E.07682
G1 X204.804 Y151.017 E.0884
G1 X202.304 Y151.017 E.07682
G1 X202.304 Y153.894 E.0884
G1 X204.804 Y153.894 E.07682
G1 X204.804 Y156.771 E.0884
G1 X202.304 Y156.771 E.07682
G1 X202.304 Y159.648 E.0884
G1 X204.804 Y159.648 E.07682
G1 X204.804 Y162.525 E.0884
G1 X202.304 Y162.525 E.07682
G1 X202.304 Y165.402 E.0884
G1 X204.804 Y165.402 E.07682
G1 X204.804 Y168.279 E.0884
G1 X202.304 Y168.279 E.07682
G1 X202.304 Y171.156 E.0884
G1 X204.804 Y171.156 E.07682
G1 X204.804 Y174.033 E.0884
G1 X202.304 Y174.033 E.07682
G1 X202.304 Y176.91 E.0884
G1 X204.804 Y176.91 E.07682
G1 X204.804 Y179.787 E.0884
G1 X202.304 Y179.787 E.07682
G1 X202.304 Y182.665 E.0884
G1 X204.804 Y182.665 E.07682
G1 X204.804 Y185.542 E.0884
G1 X202.304 Y185.542 E.07682
G1 X202.304 Y188.419 E.0884
G1 X204.804 Y188.419 E.07682
G1 X204.804 Y191.296 E.0884
G1 X202.304 Y191.296 E.07682
G1 X202.304 Y194.173 E.0884
G1 X204.804 Y194.173 E.07682
; WIPE_START
G1 F24000
G1 X202.804 Y194.173 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.019 J-1.217 P1  F30000
G1 X57.473 Y191.898 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X57.473 Y64.102 E4.23922
G1 X198.947 Y64.102 E4.69294
G1 X198.961 Y64.102 E.00045
G1 X198.961 Y191.898 E4.23922
G1 X198.947 Y191.898 E.00045
G1 X57.533 Y191.898 E4.69095
G1 X57.081 Y192.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X57.081 Y63.71 E3.9509
G1 X57.133 Y63.71 E.00158
G1 X199.329 Y63.71 E4.36931
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X199.353 Y63.71 E.00077
G1 X199.353 Y192.29 E4.26523
G1 X199.329 Y192.29 E.00077
M106 S193.8
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X198.96 Y192.29 E.01134
G1 X57.141 Y192.29 E4.35771
M204 S10000
; WIPE_START
G1 F24000
G1 X57.14 Y190.29 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.792 J.924 P1  F30000
G1 X57.822 Y190.874 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X57.822 Y191.55 E.02241
M73 P46 R34
G1 X58.774 Y191.55 E.03161
G1 X185.874 Y64.45 E5.96249
G1 X189.266 Y64.45 E.11252
G1 X197.545 Y72.729 E.38838
G1 X197.545 Y75.807 E.1021
G1 X81.802 Y191.55 E5.42972
G1 X78.41 Y191.55 E.11252
G1 X57.822 Y170.961 E.96585
G1 X57.822 Y169.475 E.04931
G1 X162.846 Y64.45 E4.9269
G1 X166.238 Y64.45 E.11252
G1 X197.545 Y95.757 E1.46867
G1 X197.545 Y98.835 E.1021
G1 X104.83 Y191.55 E4.34943
G1 X101.438 Y191.55 E.11252
G1 X57.822 Y147.933 E2.04614
G1 X57.822 Y146.447 E.04931
G1 X139.818 Y64.45 E3.84662
G1 X143.21 Y64.45 E.11252
G1 X197.545 Y118.785 E2.54895
G1 X197.545 Y121.863 E.1021
G1 X127.858 Y191.55 E3.26914
G1 X124.466 Y191.55 E.11252
G1 X57.822 Y124.905 E3.12642
G1 X57.822 Y123.419 E.04931
G1 X116.79 Y64.45 E2.76633
G1 X120.182 Y64.45 E.11252
G1 X197.545 Y141.813 E3.62924
G1 X197.545 Y144.891 E.1021
G1 X150.886 Y191.55 E2.18886
G1 X147.494 Y191.55 E.11252
G1 X57.822 Y101.877 E4.20671
G1 X57.822 Y100.391 E.04931
G1 X93.762 Y64.45 E1.68604
G1 X97.154 Y64.45 E.11252
G1 X197.545 Y164.841 E4.70953
G1 X197.545 Y167.919 E.1021
G1 X173.914 Y191.55 E1.10857
G1 X170.522 Y191.55 E.11252
M73 P47 R34
G1 X57.822 Y78.849 E5.287
G1 X57.822 Y77.363 E.04931
G1 X70.734 Y64.45 E.60576
G1 X74.126 Y64.45 E.11252
G1 X197.545 Y187.869 E5.78981
G1 X197.545 Y190.947 E.1021
G1 X196.942 Y191.55 E.02829
G1 X193.55 Y191.55 E.11252
G1 X66.45 Y64.45 E5.96249
G1 X63.058 Y64.45 E.11252
G1 X57.822 Y69.687 E.24566
G1 X57.822 Y71.174 E.04931
G1 X178.198 Y191.55 E5.64709
G1 X181.59 Y191.55 E.11252
G1 X197.545 Y175.595 E.74848
G1 X197.545 Y172.517 E.1021
G1 X89.478 Y64.45 E5.06962
G1 X86.086 Y64.45 E.11252
G1 X57.822 Y92.715 E1.32595
G1 X57.822 Y94.201 E.04931
G1 X155.17 Y191.55 E4.56681
G1 X158.562 Y191.55 E.11252
G1 X197.545 Y152.567 E1.82876
G1 X197.545 Y149.489 E.1021
G1 X112.506 Y64.45 E3.98933
G1 X109.114 Y64.45 E.11252
G1 X57.822 Y115.743 E2.40623
G1 X57.822 Y117.229 E.04931
G1 X132.142 Y191.55 E3.48652
G1 X135.534 Y191.55 E.11252
G1 X197.545 Y129.539 E2.90905
G1 X197.545 Y126.461 E.1021
G1 X135.534 Y64.45 E2.90905
G1 X132.142 Y64.45 E.11252
G1 X57.822 Y138.771 E3.48652
G1 X57.822 Y140.257 E.04931
G1 X109.114 Y191.55 E2.40623
G1 X112.506 Y191.55 E.11252
G1 X197.545 Y106.511 E3.98933
G1 X197.545 Y103.433 E.1021
G1 X158.562 Y64.45 E1.82876
G1 X155.17 Y64.45 E.11252
G1 X57.822 Y161.799 E4.56681
G1 X57.822 Y163.285 E.04931
G1 X86.086 Y191.55 E1.32595
G1 X89.478 Y191.55 E.11252
G1 X197.545 Y83.483 E5.06962
G1 X197.545 Y80.405 E.1021
G1 X181.59 Y64.45 E.74848
G1 X178.198 Y64.45 E.11252
G1 X57.822 Y184.826 E5.64709
G1 X57.822 Y186.313 E.04931
G1 X63.058 Y191.55 E.24566
G1 X66.45 Y191.55 E.11252
G1 X193.55 Y64.45 E5.96249
G1 X196.942 Y64.45 E.11252
G1 X197.545 Y65.053 E.02829
G1 X197.545 Y68.131 E.1021
G1 X74.126 Y191.55 E5.78981
G1 X70.734 Y191.55 E.11252
G1 X57.822 Y178.637 E.60576
G1 X57.822 Y177.15 E.04931
G1 X170.522 Y64.45 E5.287
G1 X173.914 Y64.45 E.11252
G1 X197.545 Y88.081 E1.10857
G1 X197.545 Y91.159 E.1021
G1 X97.154 Y191.55 E4.70953
G1 X93.762 Y191.55 E.11252
G1 X57.822 Y155.609 E1.68604
G1 X57.822 Y154.123 E.04931
G1 X147.494 Y64.45 E4.20671
G1 X150.886 Y64.45 E.11252
G1 X197.545 Y111.109 E2.18886
G1 X197.545 Y114.187 E.1021
G1 X120.182 Y191.55 E3.62924
G1 X116.79 Y191.55 E.11252
G1 X57.822 Y132.581 E2.76633
G1 X57.822 Y131.095 E.04931
G1 X124.466 Y64.45 E3.12642
G1 X127.858 Y64.45 E.11252
G1 X197.545 Y134.137 E3.26914
G1 X197.545 Y137.215 E.1021
G1 X143.21 Y191.55 E2.54895
G1 X139.818 Y191.55 E.11252
G1 X57.822 Y109.553 E3.84662
G1 X57.822 Y108.067 E.04931
G1 X101.438 Y64.45 E2.04614
G1 X104.83 Y64.45 E.11252
G1 X197.545 Y157.165 E4.34943
G1 X197.545 Y160.243 E.1021
G1 X166.238 Y191.55 E1.46867
G1 X162.846 Y191.55 E.11252
G1 X57.822 Y86.525 E4.9269
G1 X57.822 Y85.039 E.04931
G1 X78.41 Y64.45 E.96585
G1 X81.802 Y64.45 E.11252
G1 X197.545 Y180.193 E5.42972
G1 X197.545 Y183.271 E.1021
G1 X189.266 Y191.55 E.38838
G1 X185.874 Y191.55 E.11252
G1 X58.774 Y64.45 E5.96249
G1 X57.822 Y64.45 E.03161
G1 X57.822 Y65.126 E.02241
G1 X198 Y191.442 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.547324
G1 F12489.988
G1 X198.505 Y191.442 E.02073
G1 X198.505 Y64.558 E5.21527
G1 X198 Y64.558 E.02073
G1 X198 Y191.382 E5.2128
M106 S196.35
; CHANGE_LAYER
; Z_HEIGHT: 3.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X198 Y189.382 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 16/50
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
G3 Z3.4 I-.942 J.77 P1  F30000
G1 X200.742 Y192.737 Z3.4
G1 Z3.2
G1 E.8 F1800
; FEATURE: Support interface
; LINE_WIDTH: 0.42
G1 F4800
G3 X200.369 Y192.889 I-.262 J-.111 E.01373
G1 X200.166 Y193.039 E.00775
G1 X200.166 Y194.173 E.03485
G1 X199.289 Y194.173 E.02695
G1 X199.289 Y193.039 E.03485
G1 X199.05 Y193.039 E.00735
G1 X199.05 Y194.173 E.03485
G1 X199.101 Y194.173 E.00156
; WIPE_START
G1 F24000
G1 X199.05 Y194.173 E-.01931
G1 X199.05 Y193.039 E-.43105
G1 X199.289 Y193.039 E-.09095
G1 X199.289 Y193.614 E-.21869
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I-.123 J1.211 P1  F30000
G1 X204.804 Y194.173 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Support
G1 F9000
G1 X202.304 Y194.173 E.07682
G1 X202.304 Y191.296 E.0884
G1 X204.804 Y191.296 E.07682
G1 X204.804 Y188.419 E.0884
G1 X202.304 Y188.419 E.07682
G1 X202.304 Y185.542 E.0884
G1 X204.804 Y185.542 E.07682
G1 X204.804 Y182.665 E.0884
G1 X202.304 Y182.665 E.07682
G1 X202.304 Y179.787 E.0884
G1 X204.804 Y179.787 E.07682
G1 X204.804 Y176.91 E.0884
G1 X202.304 Y176.91 E.07682
G1 X202.304 Y174.033 E.0884
G1 X204.804 Y174.033 E.07682
G1 X204.804 Y171.156 E.0884
G1 X202.304 Y171.156 E.07682
G1 X202.304 Y168.279 E.0884
G1 X204.804 Y168.279 E.07682
G1 X204.804 Y165.402 E.0884
G1 X202.304 Y165.402 E.07682
G1 X202.304 Y162.525 E.0884
G1 X204.804 Y162.525 E.07682
G1 X204.804 Y159.648 E.0884
G1 X202.304 Y159.648 E.07682
G1 X202.304 Y156.771 E.0884
G1 X204.804 Y156.771 E.07682
G1 X204.804 Y153.894 E.0884
G1 X202.304 Y153.894 E.07682
G1 X202.304 Y151.017 E.0884
G1 X204.804 Y151.017 E.07682
G1 X204.804 Y148.14 E.0884
G1 X202.304 Y148.14 E.07682
G1 X202.304 Y145.262 E.0884
G1 X204.804 Y145.262 E.07682
G1 X204.804 Y142.385 E.0884
G1 X202.304 Y142.385 E.07682
G1 X202.304 Y139.508 E.0884
G1 X204.804 Y139.508 E.07682
G1 X204.804 Y136.631 E.0884
G1 X202.304 Y136.631 E.07682
G1 X202.304 Y133.754 E.0884
G1 X204.804 Y133.754 E.07682
G1 X204.804 Y130.877 E.0884
G1 X202.304 Y130.877 E.07682
G1 X202.304 Y128 E.0884
G1 X204.804 Y128 E.07682
G1 X204.804 Y125.123 E.0884
G1 X202.304 Y125.123 E.07682
G1 X202.304 Y122.246 E.0884
G1 X204.804 Y122.246 E.07682
G1 X204.804 Y119.369 E.0884
G1 X202.304 Y119.369 E.07682
G1 X202.304 Y116.492 E.0884
G1 X204.804 Y116.492 E.07682
G1 X204.804 Y113.615 E.0884
G1 X202.304 Y113.615 E.07682
G1 X202.304 Y110.738 E.0884
G1 X204.804 Y110.738 E.07682
G1 X204.804 Y107.86 E.0884
G1 X202.304 Y107.86 E.07682
G1 X202.304 Y104.983 E.0884
G1 X204.804 Y104.983 E.07682
G1 X204.804 Y102.106 E.0884
G1 X202.304 Y102.106 E.07682
G1 X202.304 Y99.229 E.0884
G1 X204.804 Y99.229 E.07682
G1 X204.804 Y96.352 E.0884
G1 X202.304 Y96.352 E.07682
G1 X202.304 Y93.475 E.0884
G1 X204.804 Y93.475 E.07682
G1 X204.804 Y90.598 E.0884
G1 X202.304 Y90.598 E.07682
G1 X202.304 Y87.721 E.0884
G1 X204.804 Y87.721 E.07682
G1 X204.804 Y84.844 E.0884
G1 X202.304 Y84.844 E.07682
G1 X202.304 Y81.967 E.0884
G1 X204.804 Y81.967 E.07682
G1 X204.804 Y79.09 E.0884
G1 X202.304 Y79.09 E.07682
G1 X202.304 Y76.213 E.0884
G1 X204.804 Y76.213 E.07682
G1 X204.804 Y73.336 E.0884
G1 X202.304 Y73.336 E.07682
G1 X202.304 Y70.458 E.0884
G1 X204.804 Y70.458 E.07682
G1 X204.804 Y67.581 E.0884
G1 X202.304 Y67.581 E.07682
G1 X202.304 Y64.704 E.0884
G1 X204.804 Y64.704 E.07682
G1 X204.804 Y61.827 E.0884
G1 X202.304 Y61.827 E.07682
G1 X201.92 Y61.827 F30000
; FEATURE: Support interface
G1 F4800
G1 X201.92 Y194.173 E4.06661
G1 X201.043 Y194.173 E.02695
G1 X201.043 Y61.827 E4.06661
G1 X200.166 Y61.827 E.02695
G1 X200.166 Y62.961 E.03485
G1 X199.289 Y62.961 E.02695
G1 X199.289 Y61.827 E.03485
G1 X199.05 Y61.827 E.00736
G1 X199.05 Y62.961 E.03485
G1 X199.101 Y62.961 E.00156
; WIPE_START
G1 F24000
G1 X199.05 Y62.961 E-.01931
G1 X199.05 Y61.827 E-.43104
G1 X199.289 Y61.827 E-.09096
G1 X199.289 Y62.403 E-.21869
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I-.82 J-.899 P1  F30000
G1 X57.381 Y191.898 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X57.381 Y64.102 E4.23922
G1 X199.38 Y64.102 E4.71037
G1 X199.394 Y64.102 E.00045
G1 X199.394 Y191.898 E4.23922
G1 X199.38 Y191.898 E.00045
G1 X57.441 Y191.898 E4.70838
G1 X56.989 Y192.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X56.989 Y63.71 E3.9509
G1 X57.04 Y63.71 E.00158
G1 X199.763 Y63.71 E4.38546
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X199.786 Y63.71 E.00077
G1 X199.786 Y192.29 E4.26523
G1 X199.763 Y192.29 E.00077
M106 S196.35
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X199.394 Y192.29 E.01134
G1 X57.049 Y192.29 E4.37386
M204 S10000
; WIPE_START
G1 F24000
G1 X57.048 Y190.29 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I-.857 J.864 P1  F30000
G1 X57.729 Y190.966 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X57.729 Y191.55 E.01935
G1 X58.774 Y191.55 E.03467
G1 X185.874 Y64.45 E5.96249
G1 X189.266 Y64.45 E.11252
G1 X197.978 Y73.162 E.4087
G1 X197.978 Y75.374 E.07336
G1 X81.802 Y191.55 E5.45004
G1 X78.41 Y191.55 E.11252
M73 P48 R34
G1 X57.729 Y170.869 E.97018
G1 X57.729 Y169.567 E.04319
G1 X162.846 Y64.45 E4.93123
G1 X166.238 Y64.45 E.11252
G1 X197.978 Y96.19 E1.48899
G1 X197.978 Y98.402 E.07336
G1 X104.83 Y191.55 E4.36975
G1 X101.438 Y191.55 E.11252
G1 X57.729 Y147.841 E2.05047
G1 X57.729 Y146.539 E.04319
G1 X139.818 Y64.45 E3.85095
G1 X143.21 Y64.45 E.11252
G1 X197.978 Y119.218 E2.56928
G1 X197.978 Y121.43 E.07336
G1 X127.858 Y191.55 E3.28947
G1 X124.466 Y191.55 E.11252
G1 X57.729 Y124.813 E3.13076
G1 X57.729 Y123.511 E.04319
G1 X116.79 Y64.45 E2.77066
G1 X120.182 Y64.45 E.11252
G1 X197.978 Y142.246 E3.64956
G1 X197.978 Y144.458 E.07336
G1 X150.886 Y191.55 E2.20918
G1 X147.494 Y191.55 E.11252
G1 X57.729 Y101.785 E4.21104
G1 X57.729 Y100.483 E.04319
G1 X93.762 Y64.45 E1.69037
G1 X97.154 Y64.45 E.11252
G1 X197.978 Y165.274 E4.72985
G1 X197.978 Y167.486 E.07336
G1 X173.914 Y191.55 E1.1289
G1 X170.522 Y191.55 E.11252
G1 X57.729 Y78.757 E5.29133
G1 X57.729 Y77.455 E.04319
G1 X70.734 Y64.45 E.61009
G1 X74.126 Y64.45 E.11252
G1 X197.978 Y188.302 E5.81014
G1 X197.978 Y190.513 E.07336
G1 X196.942 Y191.55 E.04861
G1 X193.55 Y191.55 E.11252
G1 X66.45 Y64.45 E5.96249
G1 X63.058 Y64.45 E.11252
G1 X57.729 Y69.779 E.24999
G1 X57.729 Y71.081 E.04319
G1 X178.198 Y191.55 E5.65142
G1 X181.59 Y191.55 E.11252
G1 X197.978 Y175.162 E.7688
G1 X197.978 Y172.95 E.07336
G1 X89.478 Y64.45 E5.08994
G1 X86.086 Y64.45 E.11252
G1 X57.729 Y92.807 E1.33028
G1 X57.729 Y94.109 E.04319
G1 X155.17 Y191.55 E4.57114
G1 X158.562 Y191.55 E.11252
G1 X197.978 Y152.134 E1.84909
G1 X197.978 Y149.922 E.07336
G1 X112.506 Y64.45 E4.00966
G1 X109.114 Y64.45 E.11252
G1 X57.729 Y115.835 E2.41057
G1 X57.729 Y117.137 E.04319
G1 X132.142 Y191.55 E3.49085
G1 X135.534 Y191.55 E.11252
G1 X197.978 Y129.106 E2.92937
G1 X197.978 Y126.894 E.07336
G1 X135.534 Y64.45 E2.92937
G1 X132.142 Y64.45 E.11252
G1 X57.729 Y138.863 E3.49085
G1 X57.729 Y140.165 E.04319
G1 X109.114 Y191.55 E2.41057
G1 X112.506 Y191.55 E.11252
G1 X197.978 Y106.078 E4.00966
G1 X197.978 Y103.866 E.07336
G1 X158.562 Y64.45 E1.84909
G1 X155.17 Y64.45 E.11252
G1 X57.729 Y161.891 E4.57114
G1 X57.729 Y163.193 E.04319
M73 P48 R33
G1 X86.086 Y191.55 E1.33028
G1 X89.478 Y191.55 E.11252
G1 X197.978 Y83.05 E5.08994
G1 X197.978 Y80.838 E.07336
G1 X181.59 Y64.45 E.7688
G1 X178.198 Y64.45 E.11252
G1 X57.729 Y184.919 E5.65142
G1 X57.729 Y186.221 E.04319
G1 X63.058 Y191.55 E.24999
G1 X66.45 Y191.55 E.11252
G1 X193.55 Y64.45 E5.96249
G1 X196.942 Y64.45 E.11252
G1 X197.978 Y65.487 E.04861
G1 X197.978 Y67.698 E.07336
G1 X74.126 Y191.55 E5.81014
G1 X70.734 Y191.55 E.11252
G1 X57.729 Y178.545 E.61009
G1 X57.729 Y177.243 E.04319
G1 X170.522 Y64.45 E5.29133
G1 X173.914 Y64.45 E.11252
G1 X197.978 Y88.514 E1.1289
G1 X197.978 Y90.726 E.07336
G1 X97.154 Y191.55 E4.72985
G1 X93.762 Y191.55 E.11252
G1 X57.729 Y155.517 E1.69037
G1 X57.729 Y154.215 E.04319
G1 X147.494 Y64.45 E4.21104
G1 X150.886 Y64.45 E.11252
G1 X197.978 Y111.542 E2.20918
G1 X197.978 Y113.754 E.07336
G1 X120.182 Y191.55 E3.64956
G1 X116.79 Y191.55 E.11252
G1 X57.729 Y132.489 E2.77066
G1 X57.729 Y131.187 E.04319
G1 X124.466 Y64.45 E3.13076
G1 X127.858 Y64.45 E.11252
G1 X197.978 Y134.57 E3.28947
G1 X197.978 Y136.782 E.07336
G1 X143.21 Y191.55 E2.56928
G1 X139.818 Y191.55 E.11252
G1 X57.729 Y109.461 E3.85095
G1 X57.729 Y108.159 E.04319
G1 X101.438 Y64.45 E2.05047
G1 X104.83 Y64.45 E.11252
G1 X197.978 Y157.598 E4.36975
G1 X197.978 Y159.81 E.07336
G1 X166.238 Y191.55 E1.48899
G1 X162.846 Y191.55 E.11252
G1 X57.729 Y86.433 E4.93123
G1 X57.729 Y85.131 E.04319
G1 X78.41 Y64.45 E.97018
G1 X81.802 Y64.45 E.11252
G1 X197.978 Y180.626 E5.45004
G1 X197.978 Y182.838 E.07336
G1 X189.266 Y191.55 E.4087
G1 X185.874 Y191.55 E.11252
G1 X58.774 Y64.45 E5.96249
G1 X57.729 Y64.45 E.03467
G1 X57.729 Y65.034 E.01935
G1 X198.434 Y64.558 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.547323
G1 F12490.013
G1 X198.434 Y191.442 E5.21526
G1 X198.938 Y191.442 E.02073
G1 X198.938 Y64.558 E5.21526
G1 X198.494 Y64.558 E.01827
; CHANGE_LAYER
; Z_HEIGHT: 3.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X198.938 Y64.558 E-.16887
G1 X198.938 Y66.113 E-.59113
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 17/50
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
G3 Z3.6 I1.215 J.063 P1  F30000
G1 X199.101 Y62.961 Z3.6
G1 Z3.4
G1 E.8 F1800
; FEATURE: Support interface
; LINE_WIDTH: 0.42
G1 F4800
G1 X199.05 Y62.961 E.00156
G1 X199.05 Y61.827 E.03485
G1 X199.289 Y61.827 E.00736
G1 X199.289 Y62.961 E.03485
G1 X200.166 Y62.961 E.02695
G1 X200.166 Y61.827 E.03485
G1 X201.043 Y61.827 E.02695
G1 X201.043 Y63.132 E.04008
G1 X201.251 Y63.339 E.00902
G1 X201.251 Y192.661 E3.9737
G1 X201.043 Y192.868 E.00902
G1 X201.043 Y194.173 E.04008
G1 X201.92 Y194.173 E.02695
G1 X201.92 Y61.827 E4.06661
G1 X202.304 Y61.827 F30000
; FEATURE: Support
G1 F9000
G1 X204.804 Y61.827 E.07682
G1 X204.804 Y64.704 E.0884
G1 X202.304 Y64.704 E.07682
G1 X202.304 Y67.581 E.0884
G1 X204.804 Y67.581 E.07682
G1 X204.804 Y70.458 E.0884
G1 X202.304 Y70.458 E.07682
G1 X202.304 Y73.336 E.0884
G1 X204.804 Y73.336 E.07682
G1 X204.804 Y76.213 E.0884
G1 X202.304 Y76.213 E.07682
G1 X202.304 Y79.09 E.0884
G1 X204.804 Y79.09 E.07682
G1 X204.804 Y81.967 E.0884
G1 X202.304 Y81.967 E.07682
G1 X202.304 Y84.844 E.0884
G1 X204.804 Y84.844 E.07682
G1 X204.804 Y87.721 E.0884
G1 X202.304 Y87.721 E.07682
G1 X202.304 Y90.598 E.0884
G1 X204.804 Y90.598 E.07682
G1 X204.804 Y93.475 E.0884
G1 X202.304 Y93.475 E.07682
G1 X202.304 Y96.352 E.0884
G1 X204.804 Y96.352 E.07682
G1 X204.804 Y99.229 E.0884
G1 X202.304 Y99.229 E.07682
G1 X202.304 Y102.106 E.0884
G1 X204.804 Y102.106 E.07682
G1 X204.804 Y104.983 E.0884
G1 X202.304 Y104.983 E.07682
G1 X202.304 Y107.86 E.0884
G1 X204.804 Y107.86 E.07682
G1 X204.804 Y110.738 E.0884
G1 X202.304 Y110.738 E.07682
G1 X202.304 Y113.615 E.0884
G1 X204.804 Y113.615 E.07682
G1 X204.804 Y116.492 E.0884
G1 X202.304 Y116.492 E.07682
G1 X202.304 Y119.369 E.0884
G1 X204.804 Y119.369 E.07682
G1 X204.804 Y122.246 E.0884
G1 X202.304 Y122.246 E.07682
G1 X202.304 Y125.123 E.0884
G1 X204.804 Y125.123 E.07682
G1 X204.804 Y128 E.0884
M73 P49 R33
G1 X202.304 Y128 E.07682
G1 X202.304 Y130.877 E.0884
G1 X204.804 Y130.877 E.07682
G1 X204.804 Y133.754 E.0884
G1 X202.304 Y133.754 E.07682
G1 X202.304 Y136.631 E.0884
G1 X204.804 Y136.631 E.07682
G1 X204.804 Y139.508 E.0884
G1 X202.304 Y139.508 E.07682
G1 X202.304 Y142.385 E.0884
G1 X204.804 Y142.385 E.07682
G1 X204.804 Y145.262 E.0884
G1 X202.304 Y145.262 E.07682
G1 X202.304 Y148.14 E.0884
G1 X204.804 Y148.14 E.07682
G1 X204.804 Y151.017 E.0884
G1 X202.304 Y151.017 E.07682
G1 X202.304 Y153.894 E.0884
G1 X204.804 Y153.894 E.07682
G1 X204.804 Y156.771 E.0884
G1 X202.304 Y156.771 E.07682
G1 X202.304 Y159.648 E.0884
G1 X204.804 Y159.648 E.07682
G1 X204.804 Y162.525 E.0884
G1 X202.304 Y162.525 E.07682
G1 X202.304 Y165.402 E.0884
G1 X204.804 Y165.402 E.07682
G1 X204.804 Y168.279 E.0884
G1 X202.304 Y168.279 E.07682
G1 X202.304 Y171.156 E.0884
G1 X204.804 Y171.156 E.07682
G1 X204.804 Y174.033 E.0884
G1 X202.304 Y174.033 E.07682
G1 X202.304 Y176.91 E.0884
G1 X204.804 Y176.91 E.07682
G1 X204.804 Y179.787 E.0884
G1 X202.304 Y179.787 E.07682
G1 X202.304 Y182.665 E.0884
G1 X204.804 Y182.665 E.07682
G1 X204.804 Y185.542 E.0884
G1 X202.304 Y185.542 E.07682
G1 X202.304 Y188.419 E.0884
G1 X204.804 Y188.419 E.07682
G1 X204.804 Y191.296 E.0884
G1 X202.304 Y191.296 E.07682
G1 X202.304 Y194.173 E.0884
G1 X204.804 Y194.173 E.07682
; WIPE_START
G1 F24000
G1 X202.804 Y194.173 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I.672 J-1.015 P1  F30000
G1 X200.863 Y192.889 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Support interface
G1 F4800
G1 X200.652 Y193.039 E.00795
G1 X200.166 Y193.039 E.01493
G1 X200.166 Y194.173 E.03485
G1 X199.289 Y194.173 E.02695
G1 X199.289 Y193.039 E.03485
G1 X199.05 Y193.039 E.00735
G1 X199.05 Y194.173 E.03485
G1 X199.101 Y194.173 E.00156
; WIPE_START
G1 F24000
G1 X199.05 Y194.173 E-.01931
G1 X199.05 Y193.039 E-.43105
G1 X199.289 Y193.039 E-.09095
G1 X199.289 Y193.614 E-.21869
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I.015 J-1.217 P1  F30000
G1 X57.289 Y191.898 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X57.289 Y64.102 E4.23922
G1 X199.813 Y64.102 E4.72781
G1 X199.827 Y64.102 E.00045
G1 X199.827 Y191.898 E4.23922
G1 X199.813 Y191.898 E.00045
G1 X57.349 Y191.898 E4.72582
G1 X56.897 Y192.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X56.897 Y63.71 E3.9509
G1 X56.948 Y63.71 E.00158
G1 X200.196 Y63.71 E4.40161
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X200.219 Y63.71 E.00077
G1 X200.219 Y192.29 E4.26523
G1 X200.196 Y192.29 E.00077
M106 S196.35
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X199.827 Y192.29 E.01134
G1 X56.957 Y192.29 E4.39001
M204 S10000
; WIPE_START
G1 F24000
G1 X56.956 Y190.29 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I-.911 J.807 P1  F30000
G1 X57.637 Y191.059 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X57.637 Y191.55 E.01628
G1 X58.774 Y191.55 E.03773
G1 X185.874 Y64.45 E5.96249
G1 X189.266 Y64.45 E.11252
G1 X198.411 Y73.596 E.42903
G1 X198.411 Y74.941 E.04462
G1 X81.802 Y191.55 E5.47036
G1 X78.41 Y191.55 E.11252
G1 X57.637 Y170.776 E.97451
G1 X57.637 Y169.659 E.03706
G1 X162.846 Y64.45 E4.93556
G1 X166.238 Y64.45 E.11252
G1 X198.411 Y96.624 E1.50931
G1 X198.411 Y97.969 E.04462
G1 X104.83 Y191.55 E4.39008
G1 X101.438 Y191.55 E.11252
G1 X57.637 Y147.749 E2.0548
G1 X57.637 Y146.631 E.03706
G1 X139.818 Y64.45 E3.85528
G1 X143.21 Y64.45 E.11252
G1 X198.411 Y119.652 E2.5896
G1 X198.411 Y120.997 E.04462
G1 X127.858 Y191.55 E3.30979
G1 X124.466 Y191.55 E.11252
G1 X57.637 Y124.721 E3.13509
G1 X57.637 Y123.603 E.03706
G1 X116.79 Y64.45 E2.77499
G1 X120.182 Y64.45 E.11252
G1 X198.411 Y142.679 E3.66989
G1 X198.411 Y144.024 E.04462
G1 X150.886 Y191.55 E2.22951
G1 X147.494 Y191.55 E.11252
G1 X57.637 Y101.693 E4.21537
G1 X57.637 Y100.575 E.03706
G1 X93.762 Y64.45 E1.69471
G1 X97.154 Y64.45 E.11252
G1 X198.411 Y165.707 E4.75017
G1 X198.411 Y167.052 E.04462
G1 X173.914 Y191.55 E1.14922
G1 X170.522 Y191.55 E.11252
G1 X57.637 Y78.665 E5.29566
G1 X57.637 Y77.548 E.03706
G1 X70.734 Y64.45 E.61442
G1 X74.126 Y64.45 E.11252
G1 X198.411 Y188.735 E5.83046
G1 X198.411 Y190.08 E.04462
G1 X196.942 Y191.55 E.06893
G1 X193.55 Y191.55 E.11252
G1 X66.45 Y64.45 E5.96249
G1 X63.058 Y64.45 E.11252
G1 X57.637 Y69.872 E.25432
G1 X57.637 Y70.989 E.03706
G1 X178.198 Y191.55 E5.65575
G1 X181.59 Y191.55 E.11252
G1 X198.411 Y174.728 E.78912
G1 X198.411 Y173.383 E.04462
G1 X89.478 Y64.45 E5.11027
G1 X86.086 Y64.45 E.11252
G1 X57.637 Y92.9 E1.33461
G1 X57.637 Y94.017 E.03706
G1 X155.17 Y191.55 E4.57547
G1 X158.562 Y191.55 E.11252
G1 X198.411 Y151.7 E1.86941
G1 X198.411 Y150.355 E.04462
G1 X112.506 Y64.45 E4.02998
G1 X109.114 Y64.45 E.11252
G1 X57.637 Y115.927 E2.4149
G1 X57.637 Y117.045 E.03706
G1 X132.142 Y191.55 E3.49518
G1 X135.534 Y191.55 E.11252
G1 X198.411 Y128.673 E2.9497
G1 X198.411 Y127.327 E.04462
G1 X135.534 Y64.45 E2.9497
G1 X132.142 Y64.45 E.11252
G1 X57.637 Y138.955 E3.49518
G1 X57.637 Y140.073 E.03706
G1 X109.114 Y191.55 E2.4149
G1 X112.506 Y191.55 E.11252
G1 X198.411 Y105.645 E4.02998
G1 X198.411 Y104.3 E.04462
G1 X158.562 Y64.45 E1.86941
G1 X155.17 Y64.45 E.11252
G1 X57.637 Y161.983 E4.57547
G1 X57.637 Y163.1 E.03706
G1 X86.086 Y191.55 E1.33461
G1 X89.478 Y191.55 E.11252
G1 X198.411 Y82.617 E5.11027
G1 X198.411 Y81.272 E.04462
G1 X181.59 Y64.45 E.78912
G1 X178.198 Y64.45 E.11252
G1 X57.637 Y185.011 E5.65575
G1 X57.637 Y186.128 E.03706
G1 X63.058 Y191.55 E.25432
G1 X66.45 Y191.55 E.11252
G1 X193.55 Y64.45 E5.96249
G1 X196.942 Y64.45 E.11252
G1 X198.411 Y65.92 E.06893
G1 X198.411 Y67.265 E.04462
G1 X74.126 Y191.55 E5.83046
G1 X70.734 Y191.55 E.11252
G1 X57.637 Y178.452 E.61442
G1 X57.637 Y177.335 E.03706
G1 X170.522 Y64.45 E5.29566
G1 X173.914 Y64.45 E.11252
G1 X198.411 Y88.948 E1.14922
G1 X198.411 Y90.293 E.04462
G1 X97.154 Y191.55 E4.75017
G1 X93.762 Y191.55 E.11252
G1 X57.637 Y155.424 E1.69471
G1 X57.637 Y154.307 E.03706
G1 X147.494 Y64.45 E4.21537
G1 X150.886 Y64.45 E.11252
G1 X198.411 Y111.976 E2.22951
G1 X198.411 Y113.321 E.04462
G1 X120.182 Y191.55 E3.66989
G1 X116.79 Y191.55 E.11252
G1 X57.637 Y132.397 E2.77499
G1 X57.637 Y131.279 E.03706
G1 X124.466 Y64.45 E3.13509
G1 X127.858 Y64.45 E.11252
G1 X198.411 Y135.003 E3.30979
G1 X198.411 Y136.348 E.04462
G1 X143.21 Y191.55 E2.5896
G1 X139.818 Y191.55 E.11252
G1 X57.637 Y109.369 E3.85528
G1 X57.637 Y108.251 E.03706
G1 X101.438 Y64.45 E2.0548
G1 X104.83 Y64.45 E.11252
G1 X198.411 Y158.031 E4.39008
G1 X198.411 Y159.376 E.04462
G1 X166.238 Y191.55 E1.50931
G1 X162.846 Y191.55 E.11252
G1 X57.637 Y86.341 E4.93556
G1 X57.637 Y85.224 E.03706
G1 X78.41 Y64.45 E.97451
G1 X81.802 Y64.45 E.11252
G1 X198.411 Y181.059 E5.47036
G1 X198.411 Y182.404 E.04462
G1 X189.266 Y191.55 E.42903
G1 X185.874 Y191.55 E.11252
G1 X58.774 Y64.45 E5.96249
G1 X57.637 Y64.45 E.03773
G1 X57.637 Y64.941 E.01628
G1 X198.867 Y191.442 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.547323
G1 F12490.013
G1 X199.371 Y191.442 E.02073
G1 X199.371 Y64.558 E5.21526
G1 X198.867 Y64.558 E.02073
G1 X198.867 Y191.382 E5.21279
M106 S193.8
; CHANGE_LAYER
; Z_HEIGHT: 3.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X198.867 Y189.382 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 18/50
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
G3 Z3.8 I-1.214 J.078 P1  F30000
G1 X199.101 Y193.039 Z3.8
G1 Z3.6
M73 P49 R32
G1 E.8 F1800
; FEATURE: Support interface
; LINE_WIDTH: 0.42
G1 F4800
G1 X199.05 Y193.039 E.00156
G1 X199.05 Y194.173 E.03486
G1 X199.289 Y194.173 E.00735
G1 X199.289 Y193.039 E.03486
G1 X200.166 Y193.039 E.02695
G1 X200.166 Y194.173 E.03486
G1 X201.043 Y194.173 E.02695
G1 X201.085 Y193.039 E.03488
G3 X201.457 Y192.889 I.261 J.111 E.01366
G1 X201.619 Y192.726 E.00705
; WIPE_START
G1 F24000
G1 X201.457 Y192.889 E-.0872
G1 X201.235 Y192.889 E-.08402
G1 X201.085 Y193.039 E-.08061
G1 X201.043 Y194.173 E-.43135
G1 X200.841 Y194.173 E-.07683
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I1.216 J.037 P1  F30000
G1 X204.804 Y62.303 Z4
G1 Z3.6
M73 P50 R32
G1 E.8 F1800
G1 F4800
G1 X204.804 Y61.827 E.01462
G1 X204.552 Y61.827 E.00775
G1 X204.552 Y194.173 E4.06661
G1 X203.675 Y194.173 E.02695
G1 X203.675 Y61.827 E4.06661
G1 X202.798 Y61.827 E.02695
G1 X202.798 Y194.173 E4.06661
G1 X201.92 Y194.173 E.02695
G1 X201.92 Y61.827 E4.06661
G1 X201.043 Y61.827 E.02695
G1 X201.043 Y62.961 E.03485
G1 X200.166 Y62.961 E.02695
G1 X200.166 Y61.827 E.03485
G1 X199.289 Y61.827 E.02695
G1 X199.289 Y62.961 E.03485
G1 X199.05 Y62.961 E.00736
G1 X199.05 Y61.827 E.03485
G1 X199.101 Y61.827 E.00156
; WIPE_START
G1 F24000
G1 X199.05 Y61.827 E-.01932
G1 X199.05 Y62.961 E-.43104
G1 X199.289 Y62.961 E-.09096
G1 X199.289 Y62.386 E-.21868
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I-.82 J-.899 P1  F30000
G1 X57.196 Y191.898 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X57.196 Y64.102 E4.23922
G1 X200.247 Y64.102 E4.74524
G1 X200.26 Y64.102 E.00045
G1 X200.26 Y191.898 E4.23922
G1 X200.247 Y191.898 E.00045
G1 X57.256 Y191.898 E4.74325
G1 X56.804 Y192.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X56.804 Y63.71 E3.9509
G1 X56.856 Y63.71 E.00158
G1 X200.629 Y63.71 E4.41776
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X200.652 Y63.71 E.00077
G1 X200.652 Y192.29 E4.26523
G1 X200.629 Y192.29 E.00077
M106 S193.8
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X200.26 Y192.29 E.01134
G1 X56.864 Y192.29 E4.40616
M204 S10000
; WIPE_START
G1 F24000
G1 X56.863 Y190.29 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I-.954 J.755 P1  F30000
G1 X57.545 Y191.151 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X57.545 Y191.55 E.01322
G1 X58.774 Y191.55 E.04079
G1 X185.874 Y64.45 E5.96249
G1 X189.266 Y64.45 E.11252
G1 X198.844 Y74.029 E.44935
G1 X198.844 Y74.508 E.01587
G1 X81.802 Y191.55 E5.49069
G1 X78.41 Y191.55 E.11252
G1 X57.545 Y170.684 E.97885
G1 X57.545 Y169.752 E.03094
G1 X162.846 Y64.45 E4.9399
G1 X166.238 Y64.45 E.11252
G1 X198.844 Y97.057 E1.52964
G1 X198.844 Y97.535 E.01587
G1 X104.83 Y191.55 E4.4104
G1 X101.438 Y191.55 E.11252
G1 X57.545 Y147.656 E2.05913
G1 X57.545 Y146.724 E.03094
G1 X139.818 Y64.45 E3.85961
G1 X143.21 Y64.45 E.11252
G1 X198.844 Y120.085 E2.60993
G1 X198.844 Y120.563 E.01587
G1 X127.858 Y191.55 E3.33012
G1 X124.466 Y191.55 E.11252
G1 X57.545 Y124.628 E3.13942
G1 X57.545 Y123.696 E.03094
G1 X116.79 Y64.45 E2.77932
G1 X120.182 Y64.45 E.11252
G1 X198.844 Y143.113 E3.69021
G1 X198.844 Y143.591 E.01587
G1 X150.886 Y191.55 E2.24983
G1 X147.494 Y191.55 E.11252
G1 X57.545 Y101.6 E4.2197
G1 X57.545 Y100.668 E.03094
G1 X93.762 Y64.45 E1.69904
G1 X97.154 Y64.45 E.11252
G1 X198.844 Y166.141 E4.7705
G1 X198.844 Y166.619 E.01587
G1 X173.914 Y191.55 E1.16954
G1 X170.522 Y191.55 E.11252
G1 X57.545 Y78.573 E5.29999
G1 X57.545 Y77.64 E.03094
G1 X70.734 Y64.45 E.61875
G1 X74.126 Y64.45 E.11252
G1 X198.844 Y189.168 E5.85078
G1 X198.844 Y189.647 E.01587
G1 X196.942 Y191.55 E.08926
G1 X193.55 Y191.55 E.11252
G1 X66.45 Y64.45 E5.96249
G1 X63.058 Y64.45 E.11252
G1 X57.545 Y69.964 E.25866
G1 X57.545 Y70.897 E.03094
G1 X178.198 Y191.55 E5.66009
G1 X181.59 Y191.55 E.11252
G1 X198.844 Y174.295 E.80945
G1 X198.844 Y173.817 E.01587
G1 X89.478 Y64.45 E5.13059
G1 X86.086 Y64.45 E.11252
G1 X57.545 Y92.992 E1.33894
G1 X57.545 Y93.924 E.03094
G1 X155.17 Y191.55 E4.5798
G1 X158.562 Y191.55 E.11252
G1 X198.844 Y151.267 E1.88973
G1 X198.844 Y150.789 E.01587
G1 X112.506 Y64.45 E4.05031
G1 X109.114 Y64.45 E.11252
G1 X57.545 Y116.02 E2.41923
G1 X57.545 Y116.952 E.03094
G1 X132.142 Y191.55 E3.49951
G1 X135.534 Y191.55 E.11252
G1 X198.844 Y128.239 E2.97002
G1 X198.844 Y127.761 E.01587
G1 X135.534 Y64.45 E2.97002
G1 X132.142 Y64.45 E.11252
G1 X57.545 Y139.048 E3.49951
G1 X57.545 Y139.98 E.03094
G1 X109.114 Y191.55 E2.41923
G1 X112.506 Y191.55 E.11252
G1 X198.844 Y105.211 E4.05031
G1 X198.844 Y104.733 E.01587
G1 X158.562 Y64.45 E1.88973
G1 X155.17 Y64.45 E.11252
G1 X57.545 Y162.076 E4.5798
G1 X57.545 Y163.008 E.03094
G1 X86.086 Y191.55 E1.33894
G1 X89.478 Y191.55 E.11252
G1 X198.844 Y82.183 E5.13059
G1 X198.844 Y81.705 E.01587
G1 X181.59 Y64.45 E.80945
G1 X178.198 Y64.45 E.11252
G1 X57.545 Y185.103 E5.66009
G1 X57.545 Y186.036 E.03094
G1 X63.058 Y191.55 E.25866
G1 X66.45 Y191.55 E.11252
G1 X193.55 Y64.45 E5.96249
G1 X196.942 Y64.45 E.11252
G1 X198.844 Y66.353 E.08926
G1 X198.844 Y66.832 E.01587
G1 X74.126 Y191.55 E5.85078
G1 X70.734 Y191.55 E.11252
G1 X57.545 Y178.36 E.61875
G1 X57.545 Y177.427 E.03094
G1 X170.522 Y64.45 E5.29999
G1 X173.914 Y64.45 E.11252
G1 X198.844 Y89.381 E1.16954
G1 X198.844 Y89.859 E.01587
G1 X97.154 Y191.55 E4.7705
G1 X93.762 Y191.55 E.11252
G1 X57.545 Y155.332 E1.69904
G1 X57.545 Y154.4 E.03094
G1 X147.494 Y64.45 E4.2197
G1 X150.886 Y64.45 E.11252
G1 X198.844 Y112.409 E2.24983
G1 X198.844 Y112.887 E.01587
G1 X120.182 Y191.55 E3.69021
G1 X116.79 Y191.55 E.11252
G1 X57.545 Y132.304 E2.77932
G1 X57.545 Y131.372 E.03094
G1 X124.466 Y64.45 E3.13942
G1 X127.858 Y64.45 E.11252
G1 X198.844 Y135.437 E3.33012
G1 X198.844 Y135.915 E.01587
G1 X143.21 Y191.55 E2.60992
G1 X139.818 Y191.55 E.11252
G1 X57.545 Y109.276 E3.85961
G1 X57.545 Y108.344 E.03094
G1 X101.438 Y64.45 E2.05913
G1 X104.83 Y64.45 E.11252
G1 X198.844 Y158.465 E4.4104
G1 X198.844 Y158.943 E.01587
G1 X166.238 Y191.55 E1.52964
G1 X162.846 Y191.55 E.11252
G1 X57.545 Y86.248 E4.9399
G1 X57.545 Y85.316 E.03094
G1 X78.41 Y64.45 E.97885
G1 X81.802 Y64.45 E.11252
G1 X198.844 Y181.492 E5.49069
G1 X198.844 Y181.971 E.01587
G1 X189.266 Y191.55 E.44935
G1 X185.874 Y191.55 E.11252
G1 X58.774 Y64.45 E5.96249
G1 X57.545 Y64.45 E.04079
G1 X57.545 Y64.849 E.01322
M73 P51 R32
G1 X199.3 Y191.442 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.547323
G1 F12490.013
G1 X199.805 Y191.442 E.02073
G1 X199.805 Y64.558 E5.21526
G1 X199.3 Y64.558 E.02073
G1 X199.3 Y191.382 E5.21279
M106 S188.7
; CHANGE_LAYER
; Z_HEIGHT: 3.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X199.3 Y189.382 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 19/50
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
G3 Z4 I-1.215 J-.066 P1  F30000
G1 X199.101 Y193.039 Z4
G1 Z3.8
G1 E.8 F1800
; FEATURE: Support interface
; LINE_WIDTH: 0.42
G1 F4800
G1 X199.05 Y193.039 E.00156
G1 X199.05 Y194.173 E.03485
G1 X199.289 Y194.173 E.00735
G1 X199.289 Y193.039 E.03485
G1 X200.166 Y193.039 E.02695
G1 X200.166 Y194.173 E.03485
G1 X201.043 Y194.173 E.02695
G1 X201.043 Y193.039 E.03485
G1 X201.519 Y193.039 E.0146
G3 X201.745 Y192.889 I.188 J.038 E.00926
; WIPE_START
G1 F24000
G1 X201.519 Y193.039 E-.10306
G1 X201.043 Y193.039 E-.18061
G1 X201.043 Y194.173 E-.43105
G1 X200.924 Y194.173 E-.04528
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I1.216 J.036 P1  F30000
G1 X204.804 Y62.303 Z4.2
G1 Z3.8
G1 E.8 F1800
G1 F4800
G1 X204.804 Y61.827 E.01462
G1 X204.552 Y61.827 E.00775
G1 X204.552 Y194.173 E4.06661
G1 X203.675 Y194.173 E.02695
G1 X203.675 Y61.827 E4.06661
G1 X202.798 Y61.827 E.02695
G1 X202.798 Y194.173 E4.06661
G1 X201.92 Y194.173 E.02695
G1 X201.92 Y192.858 E.04041
G1 X202.117 Y192.661 E.00856
G1 X202.117 Y63.339 E3.9737
G1 X201.92 Y63.142 E.00856
G1 X201.92 Y61.827 E.04041
G1 X201.043 Y61.827 E.02695
G1 X201.043 Y62.961 E.03485
G1 X200.166 Y62.961 E.02695
G1 X200.166 Y61.827 E.03485
G1 X199.289 Y61.827 E.02695
G1 X199.289 Y62.961 E.03485
G1 X199.05 Y62.961 E.00736
G1 X199.05 Y61.827 E.03485
G1 X199.101 Y61.827 E.00156
; WIPE_START
G1 F24000
G1 X199.05 Y61.827 E-.01931
G1 X199.05 Y62.961 E-.43104
G1 X199.289 Y62.961 E-.09096
G1 X199.289 Y62.386 E-.21869
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I-.819 J-.9 P1  F30000
G1 X57.104 Y191.898 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X57.104 Y64.102 E4.23922
G1 X200.68 Y64.102 E4.76268
G1 X200.694 Y64.102 E.00045
G1 X200.694 Y191.898 E4.23922
G1 X200.68 Y191.898 E.00045
G1 X57.164 Y191.898 E4.76068
G1 X56.712 Y192.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X56.712 Y63.71 E3.9509
G1 X56.763 Y63.71 E.00158
G1 X201.062 Y63.71 E4.43391
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X201.086 Y63.71 E.00077
G1 X201.086 Y192.29 E4.26523
G1 X201.062 Y192.29 E.00077
M106 S188.7
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X200.693 Y192.29 E.01134
G1 X56.772 Y192.29 E4.42231
M204 S10000
; WIPE_START
G1 F24000
G1 X56.771 Y190.29 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I-.007 J1.217 P1  F30000
G1 X195.721 Y191.143 Z4.2
G1 Z3.8
M73 P51 R31
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X197.349 Y191.143 E.05401
G1 X198.871 Y189.621 E.07139
G1 X198.871 Y189.195 E.01414
G1 X74.533 Y64.857 E5.83291
G1 X78.003 Y64.857 E.1151
G1 X57.859 Y85.001 E.94498
G1 X57.859 Y86.563 E.05182
G1 X162.439 Y191.143 E4.90603
G1 X158.969 Y191.143 E.1151
G1 X198.871 Y151.241 E1.87186
G1 X198.871 Y150.815 E.01414
G1 X112.913 Y64.857 E4.03244
G1 X116.383 Y64.857 E.1151
G1 X57.859 Y123.381 E2.74546
G1 X57.859 Y124.943 E.05182
G1 X124.059 Y191.143 E3.10556
G1 X120.589 Y191.143 E.1151
G1 X198.871 Y112.861 E3.67234
G1 X198.871 Y112.435 E.01414
G1 X151.293 Y64.857 E2.23196
G1 X154.763 Y64.857 E.1151
G1 X57.859 Y161.761 E4.54594
G1 X57.859 Y163.323 E.05182
G1 X85.679 Y191.143 E1.30508
G1 X82.209 Y191.143 E.1151
G1 X198.871 Y74.481 E5.47282
G1 X198.871 Y74.055 E.01414
G1 X189.673 Y64.857 E.43148
G1 X193.143 Y64.857 E.1151
G1 X66.857 Y191.143 E5.9243
G1 X70.327 Y191.143 E.1151
G1 X57.859 Y178.675 E.58489
G1 X57.859 Y177.113 E.05182
G1 X170.115 Y64.857 E5.26613
G1 X166.645 Y64.857 E.1151
G1 X198.871 Y97.083 E1.51177
G1 X198.871 Y97.509 E.01414
G1 X105.237 Y191.143 E4.39253
G1 X108.707 Y191.143 E.1151
G1 X57.859 Y140.295 E2.38537
G1 X57.859 Y138.733 E.05182
G1 X131.735 Y64.857 E3.46565
G1 X128.265 Y64.857 E.1151
G1 X198.871 Y135.463 E3.31225
G1 X198.871 Y135.889 E.01414
G1 X143.617 Y191.143 E2.59206
G1 X147.087 Y191.143 E.1151
G1 X57.859 Y101.915 E4.18584
G1 X57.859 Y100.353 E.05182
G1 X93.355 Y64.857 E1.66517
G1 X89.885 Y64.857 E.1151
G1 X198.871 Y173.843 E5.11272
G1 X198.871 Y174.269 E.01414
G1 X181.997 Y191.143 E.79158
G1 X185.467 Y191.143 E.1151
G1 X59.181 Y64.857 E5.9243
G1 X62.651 Y64.857 E.1151
G1 X57.859 Y69.649 E.22479
G1 X57.859 Y71.211 E.05182
G1 X177.791 Y191.143 E5.62622
G1 X174.321 Y191.143 E.1151
G1 X198.871 Y166.593 E1.15167
G1 X198.871 Y166.167 E.01414
G1 X97.561 Y64.857 E4.75263
G1 X101.031 Y64.857 E.1151
G1 X57.859 Y108.029 E2.02527
G1 X57.859 Y109.591 E.05182
G1 X139.411 Y191.143 E3.82575
G1 X135.941 Y191.143 E.1151
G1 X198.871 Y128.213 E2.95215
G1 X198.871 Y127.787 E.01414
G1 X135.941 Y64.857 E2.95215
G1 X139.411 Y64.857 E.1151
G1 X57.859 Y146.409 E3.82575
G1 X57.859 Y147.971 E.05182
G1 X101.031 Y191.143 E2.02527
G1 X97.561 Y191.143 E.1151
G1 X198.871 Y89.833 E4.75263
G1 X198.871 Y89.407 E.01414
G1 X174.321 Y64.857 E1.15167
G1 X177.791 Y64.857 E.1151
G1 X57.859 Y184.789 E5.62622
G1 X57.859 Y186.351 E.05182
G1 X62.651 Y191.143 E.22479
G1 X59.181 Y191.143 E.1151
G1 X185.467 Y64.857 E5.9243
G1 X181.997 Y64.857 E.1151
G1 X198.871 Y81.731 E.79158
G1 X198.871 Y82.157 E.01414
G1 X89.885 Y191.143 E5.11272
G1 X93.355 Y191.143 E.1151
G1 X57.859 Y155.647 E1.66517
G1 X57.859 Y154.085 E.05182
G1 X147.087 Y64.857 E4.18584
G1 X143.617 Y64.857 E.1151
G1 X198.871 Y120.111 E2.59206
G1 X198.871 Y120.537 E.01414
G1 X128.265 Y191.143 E3.31225
G1 X131.735 Y191.143 E.1151
G1 X57.859 Y117.267 E3.46565
G1 X57.859 Y115.705 E.05182
G1 X108.707 Y64.857 E2.38537
G1 X105.237 Y64.857 E.1151
G1 X198.871 Y158.491 E4.39253
G1 X198.871 Y158.917 E.01414
G1 X166.645 Y191.143 E1.51177
G1 X170.115 Y191.143 E.1151
G1 X57.859 Y78.887 E5.26613
M73 P52 R31
G1 X57.859 Y77.325 E.05182
G1 X70.327 Y64.857 E.58489
G1 X66.857 Y64.857 E.1151
G1 X193.143 Y191.143 E5.9243
G1 X189.673 Y191.143 E.1151
G1 X198.871 Y181.945 E.43148
G1 X198.871 Y181.519 E.01414
G1 X82.209 Y64.857 E5.47282
G1 X85.679 Y64.857 E.1151
G1 X57.859 Y92.677 E1.30508
G1 X57.859 Y94.239 E.05182
G1 X154.763 Y191.143 E4.54594
G1 X151.293 Y191.143 E.1151
G1 X198.871 Y143.565 E2.23196
G1 X198.871 Y143.139 E.01414
G1 X120.589 Y64.857 E3.67234
G1 X124.059 Y64.857 E.1151
G1 X57.859 Y131.057 E3.10556
G1 X57.859 Y132.619 E.05182
G1 X116.383 Y191.143 E2.74546
G1 X112.913 Y191.143 E.1151
G1 X198.871 Y105.185 E4.03244
G1 X198.871 Y104.759 E.01414
G1 X158.969 Y64.857 E1.87186
G1 X162.439 Y64.857 E.1151
G1 X57.859 Y169.437 E4.90603
G1 X57.859 Y170.999 E.05182
G1 X78.003 Y191.143 E.94498
G1 X74.533 Y191.143 E.1151
G1 X198.871 Y66.805 E5.83291
G1 X198.871 Y66.379 E.01414
G1 X197.349 Y64.857 E.07139
G1 X195.721 Y64.857 E.05401
G1 X199.733 Y191.442 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.547323
G1 F12490.013
G1 X200.238 Y191.442 E.02073
G1 X200.238 Y64.558 E5.21526
G1 X199.733 Y64.558 E.02073
G1 X199.733 Y191.382 E5.21279
G1 X199.278 Y191.49 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X199.278 Y64.45 E4.21413
G1 X57.452 Y64.45 E4.70461
G1 X57.452 Y191.55 E4.21612
G1 X199.278 Y191.55 E4.70461
M106 S191.25
; CHANGE_LAYER
; Z_HEIGHT: 4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X197.278 Y191.55 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 20/50
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
G3 Z4.2 I-.265 J1.188 P1  F30000
G1 X202.496 Y192.716 Z4.2
G1 Z4
G1 E.8 F1800
; FEATURE: Support interface
; LINE_WIDTH: 0.42
G1 F4800
G3 X202.102 Y192.889 I-.283 J-.111 E.01468
G1 X201.927 Y193.039 E.00708
G1 X201.927 Y194.173 E.03485
G1 X202.798 Y194.173 E.02675
G1 X202.798 Y61.827 E4.06661
G1 X203.675 Y61.827 E.02695
G1 X203.675 Y194.173 E4.06661
G1 X204.552 Y194.173 E.02695
G1 X204.552 Y61.827 E4.06661
G1 X204.804 Y61.827 E.00775
G1 X204.804 Y62.303 E.01462
; WIPE_START
G1 F24000
G1 X204.804 Y61.827 E-.18078
G1 X204.552 Y61.827 E-.09589
G1 X204.552 Y63.099 E-.48333
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I.667 J-1.018 P1  F30000
G1 X202.609 Y61.827 Z4.4
G1 Z4
G1 E.8 F1800
G1 F4800
G1 X201.927 Y61.827 E.02096
G1 X201.952 Y62.961 E.03486
G2 X202.323 Y63.111 I.261 J-.111 E.01366
G1 X202.496 Y63.284 E.00751
; WIPE_START
G1 F24000
G1 X202.323 Y63.111 E-.0929
G1 X202.102 Y63.111 E-.08402
G1 X201.952 Y62.961 E-.08061
G1 X201.927 Y61.827 E-.43114
G1 X202.115 Y61.827 E-.07133
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I-.812 J-.906 P1  F30000
G1 X57.012 Y191.898 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X57.012 Y64.102 E4.23922
G1 X201.113 Y64.102 E4.78011
G1 X201.127 Y64.102 E.00045
G1 X201.127 Y191.898 E4.23922
G1 X201.113 Y191.898 E.00045
G1 X57.072 Y191.898 E4.77812
G1 X56.62 Y192.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X56.62 Y63.71 E3.9509
G1 X56.671 Y63.71 E.00158
G1 X201.496 Y63.71 E4.45006
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X201.519 Y63.71 E.00077
G1 X201.519 Y192.29 E4.26523
G1 X201.496 Y192.29 E.00077
M106 S191.25
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X201.127 Y192.29 E.01134
G1 X56.68 Y192.29 E4.43845
M204 S10000
; WIPE_START
G1 F24000
G1 X56.679 Y190.29 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I-.007 J1.217 P1  F30000
G1 X195.721 Y191.143 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X197.349 Y191.143 E.05401
G1 X199.304 Y189.188 E.09171
G1 X199.304 Y189.628 E.0146
G1 X74.533 Y64.857 E5.85324
G1 X78.003 Y64.857 E.1151
G1 X57.767 Y85.093 E.94931
G1 X57.767 Y86.471 E.04569
G1 X162.439 Y191.143 E4.91036
G1 X158.969 Y191.143 E.1151
G1 X199.304 Y150.808 E1.89219
G1 X199.304 Y151.248 E.0146
G1 X112.913 Y64.857 E4.05276
G1 X116.383 Y64.857 E.1151
G1 X57.767 Y123.473 E2.74979
G1 X57.767 Y124.851 E.04569
G1 X124.059 Y191.143 E3.10989
G1 X120.589 Y191.143 E.1151
G1 X199.304 Y112.428 E3.69267
G1 X199.304 Y112.868 E.0146
G1 X151.293 Y64.857 E2.25228
G1 X154.763 Y64.857 E.1151
G1 X57.767 Y161.853 E4.55027
G1 X57.767 Y163.231 E.04569
G1 X85.679 Y191.143 E1.30941
G1 X82.209 Y191.143 E.1151
G1 X199.304 Y74.048 E5.49314
G1 X199.304 Y74.488 E.0146
G1 X189.673 Y64.857 E.45181
G1 X193.143 Y64.857 E.1151
G1 X66.857 Y191.143 E5.9243
G1 X70.327 Y191.143 E.1151
G1 X57.767 Y178.582 E.58922
G1 X57.767 Y177.205 E.04569
G1 X170.115 Y64.857 E5.27046
G1 X166.645 Y64.857 E.1151
G1 X199.304 Y97.516 E1.53209
G1 X199.304 Y97.076 E.0146
G1 X105.237 Y191.143 E4.41286
G1 X108.707 Y191.143 E.1151
G1 X57.767 Y140.203 E2.3897
G1 X57.767 Y138.825 E.04569
G1 X131.735 Y64.857 E3.46998
G1 X128.265 Y64.857 E.1151
G1 X199.304 Y135.896 E3.33257
G1 X199.304 Y135.456 E.0146
G1 X143.617 Y191.143 E2.61238
G1 X147.087 Y191.143 E.1151
G1 X57.767 Y101.823 E4.19017
G1 X57.767 Y100.445 E.04569
G1 X93.355 Y64.857 E1.66951
G1 X89.885 Y64.857 E.1151
G1 X199.304 Y174.276 E5.13305
G1 X199.304 Y173.836 E.0146
G1 X181.997 Y191.143 E.8119
G1 X185.467 Y191.143 E.1151
G1 X59.181 Y64.857 E5.9243
G1 X62.651 Y64.857 E.1151
G1 X57.767 Y69.742 E.22912
G1 X57.767 Y71.119 E.04569
G1 X177.791 Y191.143 E5.63055
G1 X174.321 Y191.143 E.1151
G1 X199.304 Y166.16 E1.172
M73 P52 R30
G1 X199.304 Y166.6 E.0146
G1 X97.561 Y64.857 E4.77295
G1 X101.031 Y64.857 E.1151
G1 X57.767 Y108.121 E2.0296
G1 X57.767 Y109.499 E.04569
G1 X139.411 Y191.143 E3.83008
G1 X135.941 Y191.143 E.1151
G1 X199.304 Y127.78 E2.97247
G1 X199.304 Y128.22 E.0146
G1 X135.941 Y64.857 E2.97247
G1 X139.411 Y64.857 E.1151
G1 X57.767 Y146.501 E3.83008
G1 X57.767 Y147.879 E.04569
G1 X101.031 Y191.143 E2.0296
G1 X97.561 Y191.143 E.1151
G1 X199.304 Y89.4 E4.77295
M73 P53 R30
G1 X199.304 Y89.84 E.0146
G1 X174.321 Y64.857 E1.172
G1 X177.791 Y64.857 E.1151
G1 X57.767 Y184.881 E5.63055
G1 X57.767 Y186.258 E.04569
G1 X62.651 Y191.143 E.22912
G1 X59.181 Y191.143 E.1151
G1 X185.467 Y64.857 E5.9243
G1 X181.997 Y64.857 E.1151
G1 X199.304 Y82.164 E.8119
G1 X199.304 Y81.724 E.0146
G1 X89.885 Y191.143 E5.13305
G1 X93.355 Y191.143 E.1151
G1 X57.767 Y155.555 E1.66951
G1 X57.767 Y154.177 E.04569
G1 X147.087 Y64.857 E4.19017
G1 X143.617 Y64.857 E.1151
G1 X199.304 Y120.544 E2.61238
G1 X199.304 Y120.104 E.0146
G1 X128.265 Y191.143 E3.33257
G1 X131.735 Y191.143 E.1151
G1 X57.767 Y117.175 E3.46998
G1 X57.767 Y115.797 E.04569
G1 X108.707 Y64.857 E2.3897
G1 X105.237 Y64.857 E.1151
G1 X199.304 Y158.924 E4.41286
G1 X199.304 Y158.484 E.0146
G1 X166.645 Y191.143 E1.53209
G1 X170.115 Y191.143 E.1151
G1 X57.767 Y78.795 E5.27046
G1 X57.767 Y77.418 E.04569
G1 X70.327 Y64.857 E.58922
G1 X66.857 Y64.857 E.1151
G1 X193.143 Y191.143 E5.9243
G1 X189.673 Y191.143 E.1151
G1 X199.304 Y181.512 E.45181
G1 X199.304 Y181.952 E.0146
G1 X82.209 Y64.857 E5.49314
G1 X85.679 Y64.857 E.1151
G1 X57.767 Y92.769 E1.30941
G1 X57.767 Y94.147 E.04569
G1 X154.763 Y191.143 E4.55027
G1 X151.293 Y191.143 E.1151
G1 X199.304 Y143.132 E2.25228
G1 X199.304 Y143.572 E.0146
G1 X120.589 Y64.857 E3.69267
G1 X124.059 Y64.857 E.1151
G1 X57.767 Y131.149 E3.10989
G1 X57.767 Y132.527 E.04569
G1 X116.383 Y191.143 E2.74979
G1 X112.913 Y191.143 E.1151
G1 X199.304 Y104.752 E4.05276
G1 X199.304 Y105.192 E.0146
G1 X158.969 Y64.857 E1.89219
G1 X162.439 Y64.857 E.1151
G1 X57.767 Y169.529 E4.91036
G1 X57.767 Y170.907 E.04569
G1 X78.003 Y191.143 E.94932
G1 X74.533 Y191.143 E.1151
G1 X199.304 Y66.372 E5.85324
G1 X199.304 Y66.812 E.0146
G1 X197.349 Y64.857 E.09171
G1 X195.721 Y64.857 E.05401
G1 X200.167 Y191.442 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.547323
G1 F12490.013
G1 X200.671 Y191.442 E.02073
G1 X200.671 Y64.558 E5.21526
G1 X200.167 Y64.558 E.02073
G1 X200.167 Y191.382 E5.21279
G1 X199.711 Y191.49 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X199.711 Y64.45 E4.21413
G1 X57.36 Y64.45 E4.72204
G1 X57.36 Y191.55 E4.21612
G1 X199.711 Y191.55 E4.72204
; CHANGE_LAYER
; Z_HEIGHT: 4.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X197.711 Y191.55 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 21/50
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
G3 Z4.4 I-.32 J1.174 P1  F30000
G1 X202.626 Y192.889 Z4.4
G1 Z4.2
G1 E.8 F1800
; FEATURE: Support interface
; LINE_WIDTH: 0.42
G1 F4800
G3 X201.927 Y193.039 I-.606 J-1.119 E.02227
G1 X201.927 Y194.173 E.03485
G1 X202.798 Y194.173 E.02675
G1 X202.798 Y192.847 E.04073
G1 X202.984 Y192.661 E.0081
G1 X202.984 Y63.339 E3.9737
G1 X202.798 Y63.153 E.0081
G1 X202.798 Y61.827 E.04073
G1 X203.675 Y61.827 E.02695
G1 X203.675 Y194.173 E4.06661
G1 X204.552 Y194.173 E.02695
G1 X204.552 Y61.827 E4.06661
G1 X204.804 Y61.827 E.00775
G1 X204.804 Y62.303 E.01462
; WIPE_START
G1 F24000
G1 X204.804 Y61.827 E-.18078
G1 X204.552 Y61.827 E-.09589
G1 X204.552 Y63.099 E-.48333
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I.667 J-1.018 P1  F30000
G1 X202.609 Y61.827 Z4.6
G1 Z4.2
G1 E.8 F1800
G1 F4800
G1 X201.927 Y61.827 E.02096
G1 X201.927 Y62.961 E.03485
G3 X202.626 Y63.111 I.093 J1.27 E.02227
; WIPE_START
G1 F24000
G1 X202.385 Y62.961 E-.10786
G1 X201.927 Y62.961 E-.17412
G1 X201.927 Y61.827 E-.43104
G1 X202.051 Y61.827 E-.04699
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I-.812 J-.906 P1  F30000
G1 X56.919 Y191.898 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X56.919 Y64.102 E4.23922
G1 X201.546 Y64.102 E4.79754
G1 X201.56 Y64.102 E.00045
G1 X201.56 Y191.898 E4.23922
G1 X201.546 Y191.898 E.00045
G1 X56.979 Y191.898 E4.79555
G1 X56.527 Y192.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X56.527 Y63.71 E3.9509
G1 X56.579 Y63.71 E.00158
G1 X201.929 Y63.71 E4.46621
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X201.952 Y63.71 E.00077
G1 X201.952 Y192.29 E4.26523
G1 X201.929 Y192.29 E.00077
M106 S191.25
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X201.56 Y192.29 E.01134
G1 X56.587 Y192.29 E4.4546
M204 S10000
; WIPE_START
G1 F24000
G1 X56.586 Y190.29 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I-.007 J1.217 P1  F30000
G1 X195.721 Y191.143 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X197.349 Y191.143 E.05401
G1 X199.737 Y188.754 E.11204
G1 X199.737 Y190.061 E.04335
G1 X74.533 Y64.857 E5.87356
G1 X78.003 Y64.857 E.1151
G1 X57.675 Y85.186 E.95365
G1 X57.675 Y86.379 E.03957
G1 X162.439 Y191.143 E4.9147
G1 X158.969 Y191.143 E.1151
G1 X199.737 Y150.375 E1.91251
G1 X199.737 Y151.681 E.04335
G1 X112.913 Y64.857 E4.07308
G1 X116.383 Y64.857 E.1151
G1 X57.675 Y123.566 E2.75412
G1 X57.675 Y124.758 E.03957
G1 X124.059 Y191.143 E3.11422
G1 X120.589 Y191.143 E.1151
G1 X199.737 Y111.995 E3.71299
G1 X199.737 Y113.301 E.04335
G1 X151.293 Y64.857 E2.27261
G1 X154.763 Y64.857 E.1151
G1 X57.675 Y161.945 E4.5546
G1 X57.675 Y163.138 E.03957
G1 X85.679 Y191.143 E1.31374
G1 X82.209 Y191.143 E.1151
G1 X199.737 Y73.615 E5.51347
G1 X199.737 Y74.922 E.04335
G1 X189.673 Y64.857 E.47213
G1 X193.143 Y64.857 E.1151
G1 X66.857 Y191.143 E5.9243
G1 X70.327 Y191.143 E.1151
G1 X57.675 Y178.49 E.59355
G1 X57.675 Y177.297 E.03957
G1 X170.115 Y64.857 E5.27479
G1 X166.645 Y64.857 E.1151
G1 X199.737 Y97.949 E1.55242
G1 X199.737 Y96.643 E.04335
G1 X105.237 Y191.143 E4.43318
G1 X108.707 Y191.143 E.1151
G1 X57.675 Y140.11 E2.39403
M73 P54 R30
G1 X57.675 Y138.918 E.03957
G1 X131.735 Y64.857 E3.47431
G1 X128.265 Y64.857 E.1151
G1 X199.737 Y136.329 E3.35289
G1 X199.737 Y135.023 E.04335
G1 X143.617 Y191.143 E2.6327
G1 X147.087 Y191.143 E.1151
G1 X57.675 Y101.73 E4.1945
G1 X57.675 Y100.538 E.03957
G1 X93.355 Y64.857 E1.67384
G1 X89.885 Y64.857 E.1151
G1 X199.737 Y174.709 E5.15337
G1 X199.737 Y173.402 E.04335
G1 X181.997 Y191.143 E.83223
G1 X185.467 Y191.143 E.1151
G1 X59.181 Y64.857 E5.9243
G1 X62.651 Y64.857 E.1151
G1 X57.675 Y69.834 E.23346
G1 X57.675 Y71.027 E.03957
G1 X177.791 Y191.143 E5.63489
G1 X174.321 Y191.143 E.1151
G1 X199.737 Y165.726 E1.19232
G1 X199.737 Y167.033 E.04335
G1 X97.561 Y64.857 E4.79328
G1 X101.031 Y64.857 E.1151
G1 X57.675 Y108.214 E2.03393
G1 X57.675 Y109.406 E.03957
G1 X139.411 Y191.143 E3.83441
G1 X135.941 Y191.143 E.1151
G1 X199.737 Y127.347 E2.9928
G1 X199.737 Y128.653 E.04335
G1 X135.941 Y64.857 E2.9928
G1 X139.411 Y64.857 E.1151
G1 X57.675 Y146.594 E3.83441
G1 X57.675 Y147.786 E.03957
G1 X101.031 Y191.143 E2.03393
G1 X97.561 Y191.143 E.1151
G1 X199.737 Y88.967 E4.79328
G1 X199.737 Y90.274 E.04335
G1 X174.321 Y64.857 E1.19232
G1 X177.791 Y64.857 E.1151
G1 X57.675 Y184.973 E5.63489
G1 X57.675 Y186.166 E.03957
G1 X62.651 Y191.143 E.23346
G1 X59.181 Y191.143 E.1151
G1 X185.467 Y64.857 E5.9243
G1 X181.997 Y64.857 E.1151
G1 X199.737 Y82.598 E.83223
G1 X199.737 Y81.291 E.04335
G1 X89.885 Y191.143 E5.15337
G1 X93.355 Y191.143 E.1151
G1 X57.675 Y155.462 E1.67384
G1 X57.675 Y154.269 E.03957
G1 X147.087 Y64.857 E4.1945
G1 X143.617 Y64.857 E.1151
G1 X199.737 Y120.977 E2.6327
G1 X199.737 Y119.671 E.04335
G1 X128.265 Y191.143 E3.35289
G1 X131.735 Y191.143 E.1151
G1 X57.675 Y117.082 E3.47431
G1 X57.675 Y115.89 E.03957
G1 X108.707 Y64.857 E2.39403
G1 X105.237 Y64.857 E.1151
G1 X199.737 Y159.357 E4.43318
G1 X199.737 Y158.051 E.04335
G1 X166.645 Y191.143 E1.55242
G1 X170.115 Y191.143 E.1151
G1 X57.675 Y78.703 E5.27479
G1 X57.675 Y77.51 E.03957
G1 X70.327 Y64.857 E.59355
G1 X66.857 Y64.857 E.1151
G1 X193.143 Y191.143 E5.9243
G1 X189.673 Y191.143 E.1151
G1 X199.737 Y181.078 E.47213
G1 X199.737 Y182.385 E.04335
G1 X82.209 Y64.857 E5.51347
G1 X85.679 Y64.857 E.1151
G1 X57.675 Y92.862 E1.31374
G1 X57.675 Y94.055 E.03957
G1 X154.763 Y191.143 E4.5546
G1 X151.293 Y191.143 E.1151
G1 X199.737 Y142.699 E2.27261
G1 X199.737 Y144.005 E.04335
G1 X120.589 Y64.857 E3.71299
G1 X124.059 Y64.857 E.1151
G1 X57.675 Y131.242 E3.11422
M73 P54 R29
G1 X57.675 Y132.434 E.03957
G1 X116.383 Y191.143 E2.75412
G1 X112.913 Y191.143 E.1151
G1 X199.737 Y104.319 E4.07308
G1 X199.737 Y105.625 E.04335
G1 X158.969 Y64.857 E1.91251
G1 X162.439 Y64.857 E.1151
G1 X57.675 Y169.621 E4.9147
G1 X57.675 Y170.814 E.03957
G1 X78.003 Y191.143 E.95365
G1 X74.533 Y191.143 E.1151
G1 X199.737 Y65.939 E5.87356
G1 X199.737 Y67.246 E.04335
G1 X197.349 Y64.857 E.11204
G1 X195.721 Y64.857 E.05401
G1 X200.6 Y191.442 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.547323
G1 F12490.013
G1 X201.104 Y191.442 E.02073
G1 X201.104 Y64.558 E5.21526
G1 X200.6 Y64.558 E.02073
G1 X200.6 Y191.382 E5.21279
G1 X200.144 Y191.49 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X200.144 Y64.45 E4.21413
G1 X57.268 Y64.45 E4.73948
G1 X57.268 Y191.55 E4.21612
G1 X200.144 Y191.55 E4.73948
M106 S193.8
; CHANGE_LAYER
; Z_HEIGHT: 4.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X198.144 Y191.55 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 22/50
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
G3 Z4.6 I-.385 J1.154 P1  F30000
G1 X202.609 Y193.039 Z4.6
G1 Z4.4
G1 E.8 F1800
; FEATURE: Support interface
; LINE_WIDTH: 0.42
G1 F4800
G1 X201.927 Y193.039 E.02096
G1 X201.927 Y194.173 E.03485
G1 X202.798 Y194.173 E.02675
G1 X202.818 Y193.039 E.03486
G3 X203.19 Y192.889 I.261 J.111 E.01366
G1 X203.373 Y192.705 E.00797
; WIPE_START
G1 F24000
G1 X203.19 Y192.889 E-.09859
G1 X202.968 Y192.889 E-.08402
G1 X202.818 Y193.039 E-.08061
G1 X202.798 Y194.173 E-.43112
G1 X202.625 Y194.173 E-.06566
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I1.217 J.02 P1  F30000
G1 X204.804 Y62.303 Z4.8
G1 Z4.4
G1 E.8 F1800
G1 F4800
G1 X204.804 Y61.827 E.01462
G1 X204.552 Y61.827 E.00775
G1 X204.552 Y194.173 E4.06661
G1 X203.675 Y194.173 E.02695
G1 X203.675 Y61.827 E4.06661
G1 X202.798 Y61.827 E.02695
G1 X202.798 Y62.961 E.03485
G1 X201.927 Y62.961 E.02675
G1 X201.927 Y61.827 E.03485
G1 X202.609 Y61.827 E.02096
; WIPE_START
G1 F24000
G1 X201.927 Y61.827 E-.25918
G1 X201.927 Y62.961 E-.43104
G1 X202.111 Y62.961 E-.06978
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I-.808 J-.91 P1  F30000
G1 X56.827 Y191.898 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X56.827 Y64.102 E4.23922
G1 X201.98 Y64.102 E4.81498
G1 X201.993 Y64.102 E.00045
G1 X201.993 Y191.898 E4.23922
G1 X201.98 Y191.898 E.00045
G1 X56.887 Y191.898 E4.81299
G1 X56.435 Y192.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X56.435 Y63.71 E3.9509
G1 X56.486 Y63.71 E.00158
G1 X202.362 Y63.71 E4.48236
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X202.385 Y63.71 E.00077
G1 X202.385 Y192.29 E4.26523
G1 X202.362 Y192.29 E.00077
M106 S193.8
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X201.993 Y192.29 E.01134
G1 X56.495 Y192.29 E4.47075
M204 S10000
; WIPE_START
G1 F24000
G1 X56.494 Y190.29 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I-.007 J1.217 P1  F30000
G1 X195.721 Y191.143 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X197.349 Y191.143 E.05401
G1 X200.137 Y188.354 E.1308
G1 X200.137 Y190.461 E.06988
G1 X74.533 Y64.857 E5.89233
G1 X78.003 Y64.857 E.1151
G1 X57.582 Y85.278 E.95798
G1 X57.582 Y86.286 E.03344
G1 X162.439 Y191.143 E4.91903
G1 X158.969 Y191.143 E.1151
G1 X200.137 Y149.975 E1.93128
G1 X200.137 Y152.081 E.06988
G1 X112.913 Y64.857 E4.09185
G1 X116.383 Y64.857 E.1151
M73 P55 R29
G1 X57.582 Y123.658 E2.75845
G1 X57.582 Y124.666 E.03344
G1 X124.059 Y191.143 E3.11855
G1 X120.589 Y191.143 E.1151
G1 X200.137 Y111.595 E3.73175
G1 X200.137 Y113.701 E.06988
G1 X151.293 Y64.857 E2.29137
G1 X154.763 Y64.857 E.1151
G1 X57.582 Y162.038 E4.55893
G1 X57.582 Y163.046 E.03344
G1 X85.679 Y191.143 E1.31807
G1 X82.209 Y191.143 E.1151
G1 X200.137 Y73.215 E5.53223
G1 X200.137 Y75.322 E.06988
G1 X189.673 Y64.857 E.4909
G1 X193.143 Y64.857 E.1151
G1 X66.857 Y191.143 E5.9243
G1 X70.327 Y191.143 E.1151
G1 X57.582 Y178.398 E.59788
G1 X57.582 Y177.39 E.03344
G1 X170.115 Y64.857 E5.27912
G1 X166.645 Y64.857 E.1151
G1 X200.137 Y98.349 E1.57118
G1 X200.137 Y96.243 E.06988
G1 X105.237 Y191.143 E4.45194
G1 X108.707 Y191.143 E.1151
G1 X57.582 Y140.018 E2.39836
G1 X57.582 Y139.01 E.03344
G1 X131.735 Y64.857 E3.47865
G1 X128.265 Y64.857 E.1151
G1 X200.137 Y136.729 E3.37166
G1 X200.137 Y134.623 E.06988
G1 X143.617 Y191.143 E2.65147
G1 X147.087 Y191.143 E.1151
G1 X57.582 Y101.638 E4.19884
G1 X57.582 Y100.63 E.03344
G1 X93.355 Y64.857 E1.67817
G1 X89.885 Y64.857 E.1151
G1 X200.137 Y175.109 E5.17214
G1 X200.137 Y173.002 E.06988
G1 X181.997 Y191.143 E.85099
G1 X185.467 Y191.143 E.1151
G1 X59.181 Y64.857 E5.9243
G1 X62.651 Y64.857 E.1151
G1 X57.582 Y69.926 E.23779
G1 X57.582 Y70.934 E.03344
G1 X177.791 Y191.143 E5.63922
G1 X174.321 Y191.143 E.1151
G1 X200.137 Y165.326 E1.21109
G1 X200.137 Y167.433 E.06988
G1 X97.561 Y64.857 E4.81204
G1 X101.031 Y64.857 E.1151
G1 X57.582 Y108.306 E2.03826
G1 X57.582 Y109.314 E.03344
G1 X139.411 Y191.143 E3.83874
G1 X135.941 Y191.143 E.1151
G1 X200.137 Y126.947 E3.01156
G1 X200.137 Y129.053 E.06988
G1 X135.941 Y64.857 E3.01156
G1 X139.411 Y64.857 E.1151
G1 X57.582 Y146.686 E3.83874
G1 X57.582 Y147.694 E.03344
G1 X101.031 Y191.143 E2.03826
G1 X97.561 Y191.143 E.1151
G1 X200.137 Y88.567 E4.81204
G1 X200.137 Y90.674 E.06988
G1 X174.321 Y64.857 E1.21109
G1 X177.791 Y64.857 E.1151
G1 X57.582 Y185.066 E5.63922
G1 X57.582 Y186.074 E.03344
G1 X62.651 Y191.143 E.23779
G1 X59.181 Y191.143 E.1151
G1 X185.467 Y64.857 E5.9243
G1 X181.997 Y64.857 E.1151
G1 X200.137 Y82.998 E.85099
G1 X200.137 Y80.891 E.06988
G1 X89.885 Y191.143 E5.17214
G1 X93.355 Y191.143 E.1151
G1 X57.582 Y155.37 E1.67817
G1 X57.582 Y154.362 E.03344
G1 X147.087 Y64.857 E4.19884
G1 X143.617 Y64.857 E.1151
G1 X200.137 Y121.377 E2.65147
G1 X200.137 Y119.271 E.06988
G1 X128.265 Y191.143 E3.37166
G1 X131.735 Y191.143 E.1151
G1 X57.582 Y116.99 E3.47865
G1 X57.582 Y115.982 E.03344
G1 X108.707 Y64.857 E2.39836
G1 X105.237 Y64.857 E.1151
G1 X200.137 Y159.757 E4.45194
G1 X200.137 Y157.651 E.06988
G1 X166.645 Y191.143 E1.57118
G1 X170.115 Y191.143 E.1151
G1 X57.582 Y78.61 E5.27912
G1 X57.582 Y77.602 E.03344
G1 X70.327 Y64.857 E.59788
G1 X66.857 Y64.857 E.1151
G1 X193.143 Y191.143 E5.9243
G1 X189.673 Y191.143 E.1151
G1 X200.137 Y180.678 E.4909
G1 X200.137 Y182.785 E.06988
G1 X82.209 Y64.857 E5.53223
G1 X85.679 Y64.857 E.1151
G1 X57.582 Y92.954 E1.31807
G1 X57.582 Y93.962 E.03344
G1 X154.763 Y191.143 E4.55893
G1 X151.293 Y191.143 E.1151
G1 X200.137 Y142.299 E2.29137
G1 X200.137 Y144.405 E.06988
G1 X120.589 Y64.857 E3.73175
G1 X124.059 Y64.857 E.1151
G1 X57.582 Y131.334 E3.11855
G1 X57.582 Y132.342 E.03344
G1 X116.383 Y191.143 E2.75845
G1 X112.913 Y191.143 E.1151
G1 X200.137 Y103.919 E4.09185
G1 X200.137 Y106.025 E.06988
G1 X158.969 Y64.857 E1.93128
G1 X162.439 Y64.857 E.1151
G1 X57.582 Y169.714 E4.91903
G1 X57.582 Y170.722 E.03344
G1 X78.003 Y191.143 E.95798
G1 X74.533 Y191.143 E.1151
G1 X200.137 Y65.539 E5.89233
G1 X200.137 Y67.646 E.06988
G1 X197.349 Y64.857 E.1308
G1 X195.721 Y64.857 E.05401
G1 X201.033 Y64.558 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.547323
G1 F12490.013
G1 X201.033 Y191.442 E5.21526
G1 X201.538 Y191.442 E.02073
G1 X201.538 Y64.558 E5.21526
G1 X201.093 Y64.558 E.01827
G1 X200.544 Y191.49 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X200.544 Y64.45 E4.21413
G1 X57.175 Y64.45 E4.75581
G1 X57.175 Y191.55 E4.21612
G1 X200.544 Y191.55 E4.75581
M106 S127.5
; CHANGE_LAYER
; Z_HEIGHT: 4.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X198.544 Y191.55 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 23/50
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
G3 Z4.8 I-.419 J1.143 P1  F30000
G1 X202.609 Y193.039 Z4.8
G1 Z4.6
G1 E.8 F1800
; FEATURE: Support interface
; LINE_WIDTH: 0.42
G1 F4800
G1 X201.927 Y193.039 E.02096
G1 X201.927 Y194.173 E.03485
G1 X202.798 Y194.173 E.02675
G1 X202.798 Y193.039 E.03485
G1 X203.252 Y193.039 E.01395
G3 X203.508 Y192.889 I.203 J.053 E.01012
; WIPE_START
G1 F24000
G1 X203.402 Y192.889 E-.04026
G1 X203.252 Y193.039 E-.08061
G1 X202.798 Y193.039 E-.17255
G1 X202.798 Y194.173 E-.43105
G1 X202.704 Y194.173 E-.03553
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I1.217 J.019 P1  F30000
G1 X204.804 Y62.303 Z5
G1 Z4.6
G1 E.8 F1800
G1 F4800
G1 X204.804 Y61.827 E.01462
G1 X204.552 Y61.827 E.00775
G1 X204.552 Y194.173 E4.06661
G1 X203.675 Y194.173 E.02695
G1 X203.675 Y192.837 E.04106
G1 X203.85 Y192.661 E.00764
G1 X203.85 Y63.339 E3.9737
G1 X203.675 Y63.163 E.00763
G1 X203.675 Y61.827 E.04106
G1 X202.798 Y61.827 E.02695
G1 X202.798 Y62.961 E.03485
G1 X201.927 Y62.961 E.02675
G1 X201.927 Y61.827 E.03485
G1 X202.609 Y61.827 E.02096
; WIPE_START
G1 F24000
G1 X201.927 Y61.827 E-.25918
G1 X201.927 Y62.961 E-.43104
M73 P55 R28
G1 X202.111 Y62.961 E-.06978
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I-.808 J-.91 P1  F30000
G1 X56.735 Y191.898 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
M73 P56 R28
G1 F15476.087
G1 X56.735 Y64.102 E4.23922
G1 X202.413 Y64.102 E4.83241
G1 X202.426 Y64.102 E.00045
G1 X202.426 Y191.898 E4.23922
G1 X202.413 Y191.898 E.00045
G1 X56.795 Y191.898 E4.83042
G1 X56.343 Y192.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X56.343 Y63.71 E3.9509
G1 X56.394 Y63.71 E.00158
G1 X202.795 Y63.71 E4.49851
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X202.819 Y63.71 E.00077
G1 X202.819 Y192.29 E4.26523
G1 X202.795 Y192.29 E.00077
M106 S127.5
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X202.426 Y192.29 E.01134
G1 X56.403 Y192.29 E4.4869
M204 S10000
; WIPE_START
G1 F24000
G1 X56.402 Y190.29 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I1.217 J.007 P1  F30000
G1 X57.105 Y64.269 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.400997
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X57.105 Y191.528 E6.54818
G1 X57.556 Y191.528 E.02321
G1 X57.556 Y64.472 E6.53776
G1 X58.007 Y64.472 E.02321
G1 X58.007 Y191.528 E6.53776
G1 X58.458 Y191.528 E.02321
G1 X58.458 Y64.472 E6.53776
G1 X58.909 Y64.472 E.02321
G1 X58.909 Y191.528 E6.53776
G1 X59.36 Y191.528 E.02321
G1 X59.36 Y64.472 E6.53776
G1 X59.811 Y64.472 E.02321
G1 X59.811 Y191.528 E6.53776
G1 X60.262 Y191.528 E.02321
G1 X60.262 Y64.472 E6.53776
G1 X60.713 Y64.472 E.02321
G1 X60.713 Y191.528 E6.53776
G1 X61.164 Y191.528 E.02321
G1 X61.164 Y64.472 E6.53776
G1 X61.615 Y64.472 E.02321
G1 X61.615 Y191.528 E6.53776
G1 X62.066 Y191.528 E.02321
G1 X62.066 Y64.472 E6.53776
G1 X62.517 Y64.472 E.02321
G1 X62.517 Y191.528 E6.53776
G1 X62.968 Y191.528 E.02321
G1 X62.968 Y64.472 E6.53776
G1 X63.419 Y64.472 E.02321
G1 X63.419 Y191.528 E6.53776
G1 X63.87 Y191.528 E.02321
G1 X63.87 Y64.472 E6.53776
G1 X64.321 Y64.472 E.02321
G1 X64.321 Y191.528 E6.53776
G1 X64.772 Y191.528 E.02321
G1 X64.772 Y64.472 E6.53776
G1 X65.223 Y64.472 E.02321
G1 X65.223 Y191.528 E6.53776
G1 X65.674 Y191.528 E.02321
G1 X65.674 Y64.472 E6.53776
G1 X66.125 Y64.472 E.02321
G1 X66.125 Y191.528 E6.53776
G1 X66.576 Y191.528 E.02321
G1 X66.576 Y64.472 E6.53776
G1 X67.027 Y64.472 E.02321
G1 X67.027 Y191.528 E6.53776
G1 X67.478 Y191.528 E.02321
G1 X67.478 Y64.472 E6.53776
G1 X67.929 Y64.472 E.02321
G1 X67.929 Y191.528 E6.53776
G1 X68.38 Y191.528 E.02321
G1 X68.38 Y64.472 E6.53776
G1 X68.831 Y64.472 E.02321
G1 X68.831 Y191.528 E6.53776
G1 X69.282 Y191.528 E.02321
G1 X69.282 Y64.472 E6.53776
G1 X69.733 Y64.472 E.02321
G1 X69.733 Y191.528 E6.53776
G1 X70.184 Y191.528 E.02321
G1 X70.184 Y64.472 E6.53776
G1 X70.635 Y64.472 E.02321
G1 X70.635 Y191.528 E6.53776
G1 X71.086 Y191.528 E.02321
G1 X71.086 Y64.472 E6.53776
G1 X71.537 Y64.472 E.02321
G1 X71.537 Y191.528 E6.53776
G1 X71.988 Y191.528 E.02321
G1 X71.988 Y64.472 E6.53776
G1 X72.439 Y64.472 E.02321
G1 X72.439 Y191.528 E6.53776
G1 X72.89 Y191.528 E.02321
G1 X72.89 Y64.472 E6.53776
M73 P57 R28
G1 X73.341 Y64.472 E.02321
G1 X73.341 Y191.528 E6.53776
G1 X73.792 Y191.528 E.02321
G1 X73.792 Y64.472 E6.53776
G1 X74.243 Y64.472 E.02321
G1 X74.243 Y191.528 E6.53776
G1 X74.694 Y191.528 E.02321
G1 X74.694 Y64.472 E6.53776
G1 X75.145 Y64.472 E.02321
G1 X75.145 Y191.528 E6.53776
G1 X75.596 Y191.528 E.02321
G1 X75.596 Y64.472 E6.53776
G1 X76.047 Y64.472 E.02321
G1 X76.047 Y191.528 E6.53776
G1 X76.498 Y191.528 E.02321
G1 X76.498 Y64.472 E6.53776
M73 P57 R27
G1 X76.949 Y64.472 E.02321
G1 X76.949 Y191.528 E6.53776
G1 X77.4 Y191.528 E.02321
G1 X77.4 Y64.472 E6.53776
G1 X77.851 Y64.472 E.02321
G1 X77.851 Y191.528 E6.53776
G1 X78.302 Y191.528 E.02321
G1 X78.302 Y64.472 E6.53776
G1 X78.753 Y64.472 E.02321
G1 X78.753 Y191.528 E6.53776
G1 X79.204 Y191.528 E.02321
G1 X79.204 Y64.472 E6.53776
G1 X79.655 Y64.472 E.02321
G1 X79.655 Y191.528 E6.53776
G1 X80.106 Y191.528 E.02321
G1 X80.106 Y64.472 E6.53776
M73 P58 R27
G1 X80.557 Y64.472 E.02321
G1 X80.557 Y191.528 E6.53776
G1 X81.008 Y191.528 E.02321
G1 X81.008 Y64.472 E6.53776
G1 X81.459 Y64.472 E.02321
G1 X81.459 Y191.528 E6.53776
G1 X81.91 Y191.528 E.02321
G1 X81.91 Y64.472 E6.53776
G1 X82.361 Y64.472 E.02321
G1 X82.361 Y191.528 E6.53776
G1 X82.812 Y191.528 E.02321
G1 X82.812 Y64.472 E6.53776
G1 X83.263 Y64.472 E.02321
G1 X83.263 Y191.528 E6.53776
G1 X83.714 Y191.528 E.02321
G1 X83.714 Y64.472 E6.53776
G1 X84.165 Y64.472 E.02321
G1 X84.165 Y191.528 E6.53776
G1 X84.616 Y191.528 E.02321
G1 X84.616 Y64.472 E6.53776
G1 X85.067 Y64.472 E.02321
G1 X85.067 Y191.528 E6.53776
G1 X85.518 Y191.528 E.02321
G1 X85.518 Y64.472 E6.53776
G1 X85.969 Y64.472 E.02321
G1 X85.969 Y191.528 E6.53776
G1 X86.42 Y191.528 E.02321
G1 X86.42 Y64.472 E6.53776
G1 X86.871 Y64.472 E.02321
G1 X86.871 Y191.528 E6.53776
M73 P59 R26
G1 X87.322 Y191.528 E.02321
G1 X87.322 Y64.472 E6.53776
G1 X87.773 Y64.472 E.02321
G1 X87.773 Y191.528 E6.53776
G1 X88.224 Y191.528 E.02321
G1 X88.224 Y64.472 E6.53776
G1 X88.675 Y64.472 E.02321
G1 X88.675 Y191.528 E6.53776
G1 X89.126 Y191.528 E.02321
G1 X89.126 Y64.472 E6.53776
G1 X89.577 Y64.472 E.02321
G1 X89.577 Y191.528 E6.53776
G1 X90.028 Y191.528 E.02321
G1 X90.028 Y64.472 E6.53776
G1 X90.479 Y64.472 E.02321
G1 X90.479 Y191.528 E6.53776
G1 X90.93 Y191.528 E.02321
G1 X90.93 Y64.472 E6.53776
G1 X91.381 Y64.472 E.02321
G1 X91.381 Y191.528 E6.53776
G1 X91.832 Y191.528 E.02321
G1 X91.832 Y64.472 E6.53776
G1 X92.283 Y64.472 E.02321
G1 X92.283 Y191.528 E6.53776
G1 X92.734 Y191.528 E.02321
G1 X92.734 Y64.472 E6.53776
G1 X93.185 Y64.472 E.02321
G1 X93.185 Y191.528 E6.53776
G1 X93.636 Y191.528 E.02321
G1 X93.636 Y64.472 E6.53776
G1 X94.087 Y64.472 E.02321
G1 X94.087 Y191.528 E6.53776
M73 P60 R26
G1 X94.538 Y191.528 E.02321
G1 X94.538 Y64.472 E6.53776
G1 X94.989 Y64.472 E.02321
G1 X94.989 Y191.528 E6.53776
G1 X95.44 Y191.528 E.02321
G1 X95.44 Y64.472 E6.53776
G1 X95.891 Y64.472 E.02321
G1 X95.891 Y191.528 E6.53776
G1 X96.342 Y191.528 E.02321
G1 X96.342 Y64.472 E6.53776
G1 X96.793 Y64.472 E.02321
G1 X96.793 Y191.528 E6.53776
G1 X97.244 Y191.528 E.02321
G1 X97.244 Y64.472 E6.53776
G1 X97.695 Y64.472 E.02321
G1 X97.695 Y191.528 E6.53776
M73 P60 R25
G1 X98.146 Y191.528 E.02321
G1 X98.146 Y64.472 E6.53776
G1 X98.597 Y64.472 E.02321
G1 X98.597 Y191.528 E6.53776
G1 X99.048 Y191.528 E.02321
G1 X99.048 Y64.472 E6.53776
G1 X99.499 Y64.472 E.02321
G1 X99.499 Y191.528 E6.53776
G1 X99.95 Y191.528 E.02321
G1 X99.95 Y64.472 E6.53776
G1 X100.401 Y64.472 E.02321
G1 X100.401 Y191.528 E6.53776
G1 X100.852 Y191.528 E.02321
G1 X100.852 Y64.472 E6.53776
M73 P61 R25
G1 X101.303 Y64.472 E.02321
G1 X101.303 Y191.528 E6.53776
G1 X101.754 Y191.528 E.02321
G1 X101.754 Y64.472 E6.53776
G1 X102.205 Y64.472 E.02321
G1 X102.205 Y191.528 E6.53776
G1 X102.656 Y191.528 E.02321
G1 X102.656 Y64.472 E6.53776
G1 X103.107 Y64.472 E.02321
G1 X103.107 Y191.528 E6.53776
G1 X103.558 Y191.528 E.02321
G1 X103.558 Y64.472 E6.53776
G1 X104.009 Y64.472 E.02321
G1 X104.009 Y191.528 E6.53776
G1 X104.46 Y191.528 E.02321
G1 X104.46 Y64.472 E6.53776
G1 X104.911 Y64.472 E.02321
G1 X104.911 Y191.528 E6.53776
G1 X105.362 Y191.528 E.02321
G1 X105.362 Y64.472 E6.53776
G1 X105.813 Y64.472 E.02321
G1 X105.813 Y191.528 E6.53776
G1 X106.264 Y191.528 E.02321
G1 X106.264 Y64.472 E6.53776
G1 X106.715 Y64.472 E.02321
G1 X106.715 Y191.528 E6.53776
G1 X107.166 Y191.528 E.02321
G1 X107.166 Y64.472 E6.53776
G1 X107.617 Y64.472 E.02321
G1 X107.617 Y191.528 E6.53776
G1 X108.068 Y191.528 E.02321
G1 X108.068 Y64.472 E6.53776
M73 P62 R24
G1 X108.519 Y64.472 E.02321
G1 X108.519 Y191.528 E6.53776
G1 X108.97 Y191.528 E.02321
G1 X108.97 Y64.472 E6.53776
G1 X109.421 Y64.472 E.02321
G1 X109.421 Y191.528 E6.53776
G1 X109.872 Y191.528 E.02321
G1 X109.872 Y64.472 E6.53776
G1 X110.323 Y64.472 E.02321
G1 X110.323 Y191.528 E6.53776
G1 X110.774 Y191.528 E.02321
G1 X110.774 Y64.472 E6.53776
G1 X111.225 Y64.472 E.02321
G1 X111.225 Y191.528 E6.53776
G1 X111.676 Y191.528 E.02321
G1 X111.676 Y64.472 E6.53776
G1 X112.127 Y64.472 E.02321
G1 X112.127 Y191.528 E6.53776
G1 X112.578 Y191.528 E.02321
G1 X112.578 Y64.472 E6.53776
G1 X113.029 Y64.472 E.02321
G1 X113.029 Y191.528 E6.53776
G1 X113.48 Y191.528 E.02321
G1 X113.48 Y64.472 E6.53776
G1 X113.931 Y64.472 E.02321
G1 X113.931 Y191.528 E6.53776
G1 X114.382 Y191.528 E.02321
G1 X114.382 Y64.472 E6.53776
G1 X114.833 Y64.472 E.02321
G1 X114.833 Y191.528 E6.53776
M73 P63 R24
G1 X115.284 Y191.528 E.02321
G1 X115.284 Y64.472 E6.53776
G1 X115.735 Y64.472 E.02321
G1 X115.735 Y191.528 E6.53776
G1 X116.186 Y191.528 E.02321
G1 X116.186 Y64.472 E6.53776
G1 X116.637 Y64.472 E.02321
G1 X116.637 Y191.528 E6.53776
G1 X117.088 Y191.528 E.02321
G1 X117.088 Y64.472 E6.53776
G1 X117.539 Y64.472 E.02321
G1 X117.539 Y191.528 E6.53776
G1 X117.99 Y191.528 E.02321
G1 X117.99 Y64.472 E6.53776
G1 X118.441 Y64.472 E.02321
G1 X118.441 Y191.528 E6.53776
G1 X118.892 Y191.528 E.02321
G1 X118.892 Y64.472 E6.53776
M73 P63 R23
G1 X119.343 Y64.472 E.02321
G1 X119.343 Y191.528 E6.53776
G1 X119.794 Y191.528 E.02321
G1 X119.794 Y64.472 E6.53776
G1 X120.245 Y64.472 E.02321
G1 X120.245 Y191.528 E6.53776
G1 X120.696 Y191.528 E.02321
G1 X120.696 Y64.472 E6.53776
G1 X121.147 Y64.472 E.02321
G1 X121.147 Y191.528 E6.53776
G1 X121.598 Y191.528 E.02321
G1 X121.598 Y64.472 E6.53776
M73 P64 R23
G1 X122.049 Y64.472 E.02321
G1 X122.049 Y191.528 E6.53776
G1 X122.5 Y191.528 E.02321
G1 X122.5 Y64.472 E6.53776
G1 X122.951 Y64.472 E.02321
G1 X122.951 Y191.528 E6.53776
G1 X123.402 Y191.528 E.02321
G1 X123.402 Y64.472 E6.53776
G1 X123.853 Y64.472 E.02321
G1 X123.853 Y191.528 E6.53776
G1 X124.304 Y191.528 E.02321
G1 X124.304 Y64.472 E6.53776
G1 X124.755 Y64.472 E.02321
G1 X124.755 Y191.528 E6.53776
G1 X125.206 Y191.528 E.02321
G1 X125.206 Y64.472 E6.53776
G1 X125.657 Y64.472 E.02321
G1 X125.657 Y191.528 E6.53776
G1 X126.108 Y191.528 E.02321
G1 X126.108 Y64.472 E6.53776
G1 X126.559 Y64.472 E.02321
G1 X126.559 Y191.528 E6.53776
G1 X127.01 Y191.528 E.02321
G1 X127.01 Y64.472 E6.53776
G1 X127.461 Y64.472 E.02321
G1 X127.461 Y191.528 E6.53776
G1 X127.912 Y191.528 E.02321
G1 X127.912 Y64.472 E6.53776
G1 X128.363 Y64.472 E.02321
G1 X128.363 Y191.528 E6.53776
G1 X128.814 Y191.528 E.02321
G1 X128.814 Y64.472 E6.53776
M73 P65 R23
G1 X129.265 Y64.472 E.02321
G1 X129.265 Y191.528 E6.53776
M73 P65 R22
G1 X129.716 Y191.528 E.02321
G1 X129.716 Y64.472 E6.53776
G1 X130.167 Y64.472 E.02321
G1 X130.167 Y191.528 E6.53776
G1 X130.618 Y191.528 E.02321
G1 X130.618 Y64.472 E6.53776
G1 X131.069 Y64.472 E.02321
G1 X131.069 Y191.528 E6.53776
G1 X131.52 Y191.528 E.02321
G1 X131.52 Y64.472 E6.53776
G1 X131.971 Y64.472 E.02321
G1 X131.971 Y191.528 E6.53776
G1 X132.422 Y191.528 E.02321
G1 X132.422 Y64.472 E6.53776
G1 X132.873 Y64.472 E.02321
G1 X132.873 Y191.528 E6.53776
G1 X133.324 Y191.528 E.02321
G1 X133.324 Y64.472 E6.53776
G1 X133.775 Y64.472 E.02321
G1 X133.775 Y191.528 E6.53776
G1 X134.226 Y191.528 E.02321
G1 X134.226 Y64.472 E6.53776
G1 X134.677 Y64.472 E.02321
G1 X134.677 Y191.528 E6.53776
G1 X135.128 Y191.528 E.02321
G1 X135.128 Y64.472 E6.53776
G1 X135.579 Y64.472 E.02321
G1 X135.579 Y191.528 E6.53776
M73 P66 R22
G1 X136.03 Y191.528 E.02321
G1 X136.03 Y64.472 E6.53776
G1 X136.481 Y64.472 E.02321
G1 X136.481 Y191.528 E6.53776
G1 X136.932 Y191.528 E.02321
G1 X136.932 Y64.472 E6.53776
G1 X137.383 Y64.472 E.02321
G1 X137.383 Y191.528 E6.53776
G1 X137.834 Y191.528 E.02321
G1 X137.834 Y64.472 E6.53776
G1 X138.285 Y64.472 E.02321
G1 X138.285 Y191.528 E6.53776
G1 X138.736 Y191.528 E.02321
G1 X138.736 Y64.472 E6.53776
G1 X139.187 Y64.472 E.02321
G1 X139.187 Y191.528 E6.53776
G1 X139.638 Y191.528 E.02321
G1 X139.638 Y64.472 E6.53776
G1 X140.089 Y64.472 E.02321
G1 X140.089 Y191.528 E6.53776
M73 P66 R21
G1 X140.54 Y191.528 E.02321
G1 X140.54 Y64.472 E6.53776
G1 X140.991 Y64.472 E.02321
G1 X140.991 Y191.528 E6.53776
G1 X141.442 Y191.528 E.02321
G1 X141.442 Y64.472 E6.53776
G1 X141.893 Y64.472 E.02321
G1 X141.893 Y191.528 E6.53776
G1 X142.344 Y191.528 E.02321
G1 X142.344 Y64.472 E6.53776
G1 X142.795 Y64.472 E.02321
G1 X142.795 Y191.528 E6.53776
M73 P67 R21
G1 X143.246 Y191.528 E.02321
G1 X143.246 Y64.472 E6.53776
G1 X143.697 Y64.472 E.02321
G1 X143.697 Y191.528 E6.53776
G1 X144.148 Y191.528 E.02321
G1 X144.148 Y64.472 E6.53776
G1 X144.599 Y64.472 E.02321
G1 X144.599 Y191.528 E6.53776
G1 X145.05 Y191.528 E.02321
G1 X145.05 Y64.472 E6.53776
G1 X145.501 Y64.472 E.02321
G1 X145.501 Y191.528 E6.53776
G1 X145.952 Y191.528 E.02321
G1 X145.952 Y64.472 E6.53776
G1 X146.403 Y64.472 E.02321
G1 X146.402 Y191.528 E6.53776
G1 X146.853 Y191.528 E.02321
G1 X146.854 Y64.472 E6.53776
G1 X147.305 Y64.472 E.02321
G1 X147.304 Y191.528 E6.53776
G1 X147.755 Y191.528 E.02321
G1 X147.755 Y64.472 E6.53776
G1 X148.206 Y64.472 E.02321
G1 X148.206 Y191.528 E6.53776
G1 X148.657 Y191.528 E.02321
G1 X148.657 Y64.472 E6.53776
G1 X149.108 Y64.472 E.02321
G1 X149.108 Y191.528 E6.53776
G1 X149.559 Y191.528 E.02321
G1 X149.559 Y64.472 E6.53776
M73 P68 R21
G1 X150.01 Y64.472 E.02321
G1 X150.01 Y191.528 E6.53776
G1 X150.461 Y191.528 E.02321
G1 X150.461 Y64.472 E6.53776
M73 P68 R20
G1 X150.912 Y64.472 E.02321
G1 X150.912 Y191.528 E6.53776
G1 X151.363 Y191.528 E.02321
G1 X151.363 Y64.472 E6.53776
G1 X151.814 Y64.472 E.02321
G1 X151.814 Y191.528 E6.53776
G1 X152.265 Y191.528 E.02321
G1 X152.265 Y64.472 E6.53776
G1 X152.716 Y64.472 E.02321
G1 X152.716 Y191.528 E6.53776
G1 X153.167 Y191.528 E.02321
G1 X153.167 Y64.472 E6.53776
G1 X153.618 Y64.472 E.02321
G1 X153.618 Y191.528 E6.53776
G1 X154.069 Y191.528 E.02321
G1 X154.069 Y64.472 E6.53776
G1 X154.52 Y64.472 E.02321
G1 X154.52 Y191.528 E6.53776
G1 X154.971 Y191.528 E.02321
G1 X154.971 Y64.472 E6.53776
G1 X155.422 Y64.472 E.02321
G1 X155.422 Y191.528 E6.53776
G1 X155.873 Y191.528 E.02321
G1 X155.873 Y64.472 E6.53776
G1 X156.324 Y64.472 E.02321
G1 X156.324 Y191.528 E6.53776
G1 X156.775 Y191.528 E.02321
G1 X156.775 Y64.472 E6.53776
M73 P69 R20
G1 X157.226 Y64.472 E.02321
G1 X157.226 Y191.528 E6.53776
G1 X157.677 Y191.528 E.02321
G1 X157.677 Y64.472 E6.53776
G1 X158.128 Y64.472 E.02321
G1 X158.128 Y191.528 E6.53776
G1 X158.579 Y191.528 E.02321
G1 X158.579 Y64.472 E6.53776
G1 X159.03 Y64.472 E.02321
G1 X159.03 Y191.528 E6.53776
G1 X159.481 Y191.528 E.02321
G1 X159.481 Y64.472 E6.53776
G1 X159.932 Y64.472 E.02321
G1 X159.932 Y191.528 E6.53776
G1 X160.383 Y191.528 E.02321
G1 X160.383 Y64.472 E6.53776
G1 X160.834 Y64.472 E.02321
G1 X160.834 Y191.528 E6.53776
G1 X161.285 Y191.528 E.02321
G1 X161.285 Y64.472 E6.53776
M73 P69 R19
G1 X161.736 Y64.472 E.02321
G1 X161.736 Y191.528 E6.53776
G1 X162.187 Y191.528 E.02321
G1 X162.187 Y64.472 E6.53776
G1 X162.638 Y64.472 E.02321
G1 X162.638 Y191.528 E6.53776
G1 X163.089 Y191.528 E.02321
G1 X163.089 Y64.472 E6.53776
G1 X163.54 Y64.472 E.02321
G1 X163.54 Y191.528 E6.53776
M73 P70 R19
G1 X163.991 Y191.528 E.02321
G1 X163.991 Y64.472 E6.53776
G1 X164.442 Y64.472 E.02321
G1 X164.442 Y191.528 E6.53776
G1 X164.893 Y191.528 E.02321
G1 X164.893 Y64.472 E6.53776
G1 X165.344 Y64.472 E.02321
G1 X165.344 Y191.528 E6.53776
G1 X165.795 Y191.528 E.02321
G1 X165.795 Y64.472 E6.53776
G1 X166.246 Y64.472 E.02321
G1 X166.246 Y191.528 E6.53776
G1 X166.697 Y191.528 E.02321
G1 X166.697 Y64.472 E6.53776
G1 X167.148 Y64.472 E.02321
G1 X167.148 Y191.528 E6.53776
G1 X167.599 Y191.528 E.02321
G1 X167.599 Y64.472 E6.53776
G1 X168.05 Y64.472 E.02321
G1 X168.05 Y191.528 E6.53776
G1 X168.501 Y191.528 E.02321
G1 X168.501 Y64.472 E6.53776
G1 X168.952 Y64.472 E.02321
G1 X168.952 Y191.528 E6.53776
G1 X169.403 Y191.528 E.02321
G1 X169.403 Y64.472 E6.53776
G1 X169.854 Y64.472 E.02321
G1 X169.854 Y191.528 E6.53776
G1 X170.305 Y191.528 E.02321
G1 X170.305 Y64.472 E6.53776
G1 X170.756 Y64.472 E.02321
G1 X170.756 Y191.528 E6.53776
M73 P71 R19
G1 X171.207 Y191.528 E.02321
G1 X171.207 Y64.472 E6.53776
G1 X171.658 Y64.472 E.02321
G1 X171.658 Y191.528 E6.53776
M73 P71 R18
G1 X172.109 Y191.528 E.02321
G1 X172.109 Y64.472 E6.53776
G1 X172.56 Y64.472 E.02321
G1 X172.56 Y191.528 E6.53776
G1 X173.011 Y191.528 E.02321
G1 X173.011 Y64.472 E6.53776
G1 X173.462 Y64.472 E.02321
G1 X173.462 Y191.528 E6.53776
G1 X173.913 Y191.528 E.02321
G1 X173.913 Y64.472 E6.53776
G1 X174.364 Y64.472 E.02321
G1 X174.364 Y191.528 E6.53776
G1 X174.815 Y191.528 E.02321
G1 X174.815 Y64.472 E6.53776
G1 X175.266 Y64.472 E.02321
G1 X175.266 Y191.528 E6.53776
G1 X175.717 Y191.528 E.02321
G1 X175.717 Y64.472 E6.53776
G1 X176.168 Y64.472 E.02321
G1 X176.168 Y191.528 E6.53776
G1 X176.619 Y191.528 E.02321
G1 X176.619 Y64.472 E6.53776
G1 X177.07 Y64.472 E.02321
G1 X177.07 Y191.528 E6.53776
G1 X177.521 Y191.528 E.02321
G1 X177.521 Y64.472 E6.53776
M73 P72 R18
G1 X177.972 Y64.472 E.02321
G1 X177.972 Y191.528 E6.53776
G1 X178.423 Y191.528 E.02321
G1 X178.423 Y64.472 E6.53776
G1 X178.874 Y64.472 E.02321
G1 X178.874 Y191.528 E6.53776
G1 X179.325 Y191.528 E.02321
G1 X179.325 Y64.472 E6.53776
G1 X179.776 Y64.472 E.02321
G1 X179.776 Y191.528 E6.53776
G1 X180.227 Y191.528 E.02321
G1 X180.227 Y64.472 E6.53776
G1 X180.678 Y64.472 E.02321
G1 X180.678 Y191.528 E6.53776
G1 X181.129 Y191.528 E.02321
G1 X181.129 Y64.472 E6.53776
G1 X181.58 Y64.472 E.02321
G1 X181.58 Y191.528 E6.53776
G1 X182.031 Y191.528 E.02321
G1 X182.031 Y64.472 E6.53776
M73 P72 R17
G1 X182.482 Y64.472 E.02321
G1 X182.482 Y191.528 E6.53776
G1 X182.933 Y191.528 E.02321
G1 X182.933 Y64.472 E6.53776
G1 X183.384 Y64.472 E.02321
G1 X183.384 Y191.528 E6.53776
G1 X183.835 Y191.528 E.02321
G1 X183.835 Y64.472 E6.53776
G1 X184.286 Y64.472 E.02321
G1 X184.286 Y191.528 E6.53776
G1 X184.737 Y191.528 E.02321
G1 X184.737 Y64.472 E6.53776
M73 P73 R17
G1 X185.188 Y64.472 E.02321
G1 X185.188 Y191.528 E6.53776
G1 X185.639 Y191.528 E.02321
G1 X185.639 Y64.472 E6.53776
G1 X186.09 Y64.472 E.02321
G1 X186.09 Y191.528 E6.53776
G1 X186.541 Y191.528 E.02321
G1 X186.541 Y64.472 E6.53776
G1 X186.992 Y64.472 E.02321
G1 X186.992 Y191.528 E6.53776
G1 X187.443 Y191.528 E.02321
G1 X187.443 Y64.472 E6.53776
G1 X187.894 Y64.472 E.02321
G1 X187.894 Y191.528 E6.53776
G1 X188.345 Y191.528 E.02321
G1 X188.345 Y64.472 E6.53776
G1 X188.796 Y64.472 E.02321
G1 X188.796 Y191.528 E6.53776
G1 X189.247 Y191.528 E.02321
G1 X189.247 Y64.472 E6.53776
G1 X189.698 Y64.472 E.02321
G1 X189.698 Y191.528 E6.53776
G1 X190.149 Y191.528 E.02321
G1 X190.149 Y64.472 E6.53776
G1 X190.6 Y64.472 E.02321
G1 X190.6 Y191.528 E6.53776
G1 X191.051 Y191.528 E.02321
G1 X191.051 Y64.472 E6.53776
G1 X191.502 Y64.472 E.02321
G1 X191.502 Y191.528 E6.53776
M73 P74 R17
G1 X191.953 Y191.528 E.02321
G1 X191.953 Y64.472 E6.53776
G1 X192.404 Y64.472 E.02321
G1 X192.404 Y191.528 E6.53776
G1 X192.855 Y191.528 E.02321
G1 X192.855 Y64.472 E6.53776
M73 P74 R16
G1 X193.306 Y64.472 E.02321
G1 X193.306 Y191.528 E6.53776
G1 X193.757 Y191.528 E.02321
G1 X193.757 Y64.472 E6.53776
G1 X194.208 Y64.472 E.02321
G1 X194.208 Y191.528 E6.53776
G1 X194.659 Y191.528 E.02321
G1 X194.659 Y64.472 E6.53776
G1 X195.11 Y64.472 E.02321
G1 X195.11 Y191.528 E6.53776
G1 X195.561 Y191.528 E.02321
G1 X195.561 Y64.472 E6.53776
G1 X196.012 Y64.472 E.02321
G1 X196.012 Y191.528 E6.53776
G1 X196.463 Y191.528 E.02321
G1 X196.463 Y64.472 E6.53776
G1 X196.914 Y64.472 E.02321
G1 X196.914 Y191.528 E6.53776
G1 X197.365 Y191.528 E.02321
G1 X197.365 Y64.472 E6.53776
G1 X197.816 Y64.472 E.02321
G1 X197.816 Y191.528 E6.53776
G1 X198.267 Y191.528 E.02321
G1 X198.267 Y64.472 E6.53776
M73 P75 R16
G1 X198.718 Y64.472 E.02321
G1 X198.718 Y191.528 E6.53776
G1 X199.169 Y191.528 E.02321
G1 X199.169 Y64.472 E6.53776
G1 X199.62 Y64.472 E.02321
G1 X199.62 Y191.528 E6.53776
G1 X200.071 Y191.528 E.02321
G1 X200.071 Y64.472 E6.53776
G1 X200.522 Y64.472 E.02321
G1 X200.522 Y191.731 E6.54818
M106 S127.5
G1 X200.936 Y191.506 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
; LAYER_HEIGHT: 0.2
G1 F15000
G1 X202.034 Y191.506 E.03374
G1 X202.034 Y64.494 E3.90271
G1 X200.936 Y64.494 E.03374
G1 X200.936 Y191.446 E3.90086
G1 X201.305 Y191.137 F30000
; LINE_WIDTH: 0.403476
G1 F15000
G1 X201.666 Y191.137 E.01059
G1 X201.666 Y64.863 E3.71003
G1 X201.305 Y64.863 E.01059
G1 X201.305 Y191.077 E3.70826
; CHANGE_LAYER
; Z_HEIGHT: 4.8
; LAYER_HEIGHT: 0.2
; WIPE_START
M73 P75 R15
G1 F24000
G1 X201.305 Y189.077 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 24/50
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
G3 Z5 I-.024 J-1.217 P1  F30000
G1 X56.642 Y191.898 Z5
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X56.642 Y64.102 E4.23922
G1 X202.846 Y64.102 E4.84985
M73 P76 R15
G1 X202.86 Y64.102 E.00045
G1 X202.86 Y191.898 E4.23922
G1 X202.846 Y191.898 E.00045
G1 X56.702 Y191.898 E4.84785
G1 X56.302 Y192.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X56.25 Y192.29 E.00158
G1 X56.25 Y63.71 E3.9509
G1 X56.302 Y63.71 E.00158
G1 X203.229 Y63.71 E4.51466
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X203.252 Y63.71 E.00077
G1 X203.252 Y192.29 E4.26523
G1 X203.229 Y192.29 E.00077
M106 S127.5
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X202.86 Y192.29 E.01134
G1 X56.362 Y192.29 E4.50147
M204 S10000
; WIPE_START
G1 F24000
G1 X56.25 Y192.29 E-.04231
G1 X56.25 Y190.401 E-.71769
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I1.217 J.005 P1  F30000
G1 X56.806 Y65.029 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.420551
G1 F15000
G1 X57.4 Y64.435 E.02584
G1 X57.934 Y64.435 E.01643
G1 X56.976 Y65.394 E.0417
G1 X56.976 Y65.928 E.01643
M73 P77 R15
G1 X58.468 Y64.435 E.06494
G1 X59.002 Y64.435 E.01643
G1 X56.976 Y66.462 E.08818
G1 X56.976 Y66.996 E.01643
G1 X59.536 Y64.435 E.11142
G1 X60.07 Y64.435 E.01643
G1 X56.976 Y67.53 E.13466
G1 X56.976 Y68.064 E.01643
G1 X60.604 Y64.435 E.15791
G1 X61.138 Y64.435 E.01643
G1 X56.976 Y68.598 E.18115
G1 X56.976 Y69.132 E.01643
G1 X61.672 Y64.435 E.20439
G1 X62.206 Y64.435 E.01643
G1 X56.976 Y69.666 E.22763
G1 X56.976 Y70.2 E.01643
G1 X62.74 Y64.435 E.25087
G1 X63.274 Y64.435 E.01643
G1 X56.976 Y70.734 E.27411
G1 X56.976 Y71.268 E.01643
G1 X63.808 Y64.435 E.29735
G1 X64.342 Y64.435 E.01643
G1 X56.976 Y71.802 E.32059
G1 X56.976 Y72.336 E.01643
G1 X64.877 Y64.435 E.34383
G1 X65.411 Y64.435 E.01643
G1 X56.976 Y72.87 E.36708
G1 X56.976 Y73.404 E.01643
G1 X65.945 Y64.435 E.39032
G1 X66.479 Y64.435 E.01643
G1 X56.976 Y73.938 E.41356
G1 X56.976 Y74.472 E.01643
G1 X67.013 Y64.435 E.4368
G1 X67.547 Y64.435 E.01643
G1 X56.976 Y75.006 E.46004
M73 P77 R14
G1 X56.976 Y75.541 E.01643
G1 X68.081 Y64.435 E.48328
G1 X68.615 Y64.435 E.01643
G1 X56.976 Y76.075 E.50652
G1 X56.976 Y76.609 E.01643
G1 X69.149 Y64.435 E.52976
G1 X69.683 Y64.435 E.01643
G1 X56.976 Y77.143 E.553
G1 X56.976 Y77.677 E.01643
G1 X70.217 Y64.435 E.57624
G1 X70.751 Y64.435 E.01643
G1 X56.976 Y78.211 E.59949
G1 X56.976 Y78.745 E.01643
G1 X71.285 Y64.435 E.62273
G1 X71.819 Y64.435 E.01643
G1 X56.976 Y79.279 E.64597
G1 X56.976 Y79.813 E.01643
G1 X72.353 Y64.435 E.66921
G1 X72.887 Y64.435 E.01643
G1 X56.976 Y80.347 E.69245
G1 X56.976 Y80.881 E.01643
G1 X73.421 Y64.435 E.71569
G1 X73.955 Y64.435 E.01643
G1 X56.976 Y81.415 E.73893
G1 X56.976 Y81.949 E.01643
G1 X74.489 Y64.435 E.76217
G1 X75.023 Y64.435 E.01643
G1 X56.976 Y82.483 E.78541
G1 X56.976 Y83.017 E.01643
G1 X75.558 Y64.435 E.80865
G1 X76.092 Y64.435 E.01643
G1 X56.976 Y83.551 E.8319
G1 X56.976 Y84.085 E.01643
G1 X76.626 Y64.435 E.85514
G1 X77.16 Y64.435 E.01643
G1 X56.976 Y84.619 E.87838
G1 X56.976 Y85.153 E.01643
G1 X77.694 Y64.435 E.90162
G1 X78.228 Y64.435 E.01643
G1 X56.976 Y85.688 E.92486
G1 X56.976 Y86.222 E.01643
G1 X78.762 Y64.435 E.9481
G1 X79.296 Y64.435 E.01643
G1 X56.976 Y86.756 E.97134
G1 X56.976 Y87.29 E.01643
G1 X79.83 Y64.435 E.99458
G1 X80.364 Y64.435 E.01643
G1 X56.976 Y87.824 E1.01782
G1 X56.976 Y88.358 E.01643
G1 X80.898 Y64.435 E1.04107
G1 X81.432 Y64.435 E.01643
G1 X56.976 Y88.892 E1.06431
G1 X56.976 Y89.426 E.01643
G1 X81.966 Y64.435 E1.08755
G1 X82.5 Y64.435 E.01643
G1 X56.976 Y89.96 E1.11079
G1 X56.976 Y90.494 E.01643
G1 X83.034 Y64.435 E1.13403
G1 X83.568 Y64.435 E.01643
G1 X56.976 Y91.028 E1.15727
G1 X56.976 Y91.562 E.01643
G1 X84.102 Y64.435 E1.18051
G1 X84.636 Y64.435 E.01643
G1 X56.976 Y92.096 E1.20375
G1 X56.976 Y92.63 E.01643
G1 X85.17 Y64.435 E1.22699
G1 X85.705 Y64.435 E.01643
G1 X56.976 Y93.164 E1.25023
G1 X56.976 Y93.698 E.01643
G1 X86.239 Y64.435 E1.27348
G1 X86.773 Y64.435 E.01643
G1 X56.976 Y94.232 E1.29672
G1 X56.976 Y94.766 E.01643
G1 X87.307 Y64.435 E1.31996
G1 X87.841 Y64.435 E.01643
G1 X56.976 Y95.3 E1.3432
G1 X56.976 Y95.834 E.01643
G1 X88.375 Y64.435 E1.36644
G1 X88.909 Y64.435 E.01643
G1 X56.976 Y96.369 E1.38968
G1 X56.976 Y96.903 E.01643
G1 X89.443 Y64.435 E1.41292
G1 X89.977 Y64.435 E.01643
G1 X56.976 Y97.437 E1.43616
G1 X56.976 Y97.971 E.01643
G1 X90.511 Y64.435 E1.4594
G1 X91.045 Y64.435 E.01643
G1 X56.976 Y98.505 E1.48264
G1 X56.976 Y99.039 E.01643
G1 X91.579 Y64.435 E1.50589
G1 X92.113 Y64.435 E.01643
G1 X56.976 Y99.573 E1.52913
G1 X56.976 Y100.107 E.01643
G1 X92.647 Y64.435 E1.55237
G1 X93.181 Y64.435 E.01643
G1 X56.976 Y100.641 E1.57561
G1 X56.976 Y101.175 E.01643
G1 X93.715 Y64.435 E1.59885
G1 X94.249 Y64.435 E.01643
G1 X56.976 Y101.709 E1.62209
G1 X56.976 Y102.243 E.01643
G1 X94.783 Y64.435 E1.64533
G1 X95.317 Y64.435 E.01643
G1 X56.976 Y102.777 E1.66857
G1 X56.976 Y103.311 E.01643
G1 X95.851 Y64.435 E1.69181
G1 X96.386 Y64.435 E.01643
G1 X56.976 Y103.845 E1.71505
G1 X56.976 Y104.379 E.01643
G1 X96.92 Y64.435 E1.7383
G1 X97.454 Y64.435 E.01643
G1 X56.976 Y104.913 E1.76154
G1 X56.976 Y105.447 E.01643
G1 X97.988 Y64.435 E1.78478
G1 X98.522 Y64.435 E.01643
G1 X56.976 Y105.981 E1.80802
G1 X56.976 Y106.515 E.01643
G1 X99.056 Y64.435 E1.83126
G1 X99.59 Y64.435 E.01643
G1 X56.976 Y107.05 E1.8545
G1 X56.976 Y107.584 E.01643
G1 X100.124 Y64.435 E1.87774
G1 X100.658 Y64.435 E.01643
G1 X56.976 Y108.118 E1.90098
G1 X56.976 Y108.652 E.01643
G1 X101.192 Y64.435 E1.92422
G1 X101.726 Y64.435 E.01643
G1 X56.976 Y109.186 E1.94747
G1 X56.976 Y109.72 E.01643
G1 X102.26 Y64.435 E1.97071
G1 X102.794 Y64.435 E.01643
G1 X56.976 Y110.254 E1.99395
G1 X56.976 Y110.788 E.01643
G1 X103.328 Y64.435 E2.01719
G1 X103.862 Y64.435 E.01643
G1 X56.976 Y111.322 E2.04043
G1 X56.976 Y111.856 E.01643
G1 X104.396 Y64.435 E2.06367
G1 X104.93 Y64.435 E.01643
G1 X56.976 Y112.39 E2.08691
G1 X56.976 Y112.924 E.01643
G1 X105.464 Y64.435 E2.11015
G1 X105.998 Y64.435 E.01643
G1 X56.976 Y113.458 E2.13339
G1 X56.976 Y113.992 E.01643
G1 X106.532 Y64.435 E2.15663
G1 X107.067 Y64.435 E.01643
G1 X56.976 Y114.526 E2.17988
G1 X56.976 Y115.06 E.01643
G1 X107.601 Y64.435 E2.20312
G1 X108.135 Y64.435 E.01643
G1 X56.976 Y115.594 E2.22636
G1 X56.976 Y116.128 E.01643
G1 X108.669 Y64.435 E2.2496
G1 X109.203 Y64.435 E.01643
G1 X56.976 Y116.662 E2.27284
G1 X56.976 Y117.197 E.01643
G1 X109.737 Y64.435 E2.29608
G1 X110.271 Y64.435 E.01643
G1 X56.976 Y117.731 E2.31932
G1 X56.976 Y118.265 E.01643
G1 X110.805 Y64.435 E2.34256
G1 X111.339 Y64.435 E.01643
G1 X56.976 Y118.799 E2.3658
G1 X56.976 Y119.333 E.01643
G1 X111.873 Y64.435 E2.38904
G1 X112.407 Y64.435 E.01643
G1 X56.976 Y119.867 E2.41229
G1 X56.976 Y120.401 E.01643
G1 X112.941 Y64.435 E2.43553
G1 X113.475 Y64.435 E.01643
G1 X56.976 Y120.935 E2.45877
G1 X56.976 Y121.469 E.01643
G1 X114.009 Y64.435 E2.48201
G1 X114.543 Y64.435 E.01643
G1 X56.976 Y122.003 E2.50525
G1 X56.976 Y122.537 E.01643
G1 X115.077 Y64.435 E2.52849
G1 X115.611 Y64.435 E.01643
G1 X56.976 Y123.071 E2.55173
G1 X56.976 Y123.605 E.01643
G1 X116.145 Y64.435 E2.57497
G1 X116.679 Y64.435 E.01643
G1 X56.976 Y124.139 E2.59821
G1 X56.976 Y124.673 E.01643
G1 X117.214 Y64.435 E2.62146
G1 X117.748 Y64.435 E.01643
G1 X56.976 Y125.207 E2.6447
G1 X56.976 Y125.741 E.01643
G1 X118.282 Y64.435 E2.66794
G1 X118.816 Y64.435 E.01643
G1 X56.976 Y126.275 E2.69118
G1 X56.976 Y126.809 E.01643
G1 X119.35 Y64.435 E2.71442
G1 X119.884 Y64.435 E.01643
G1 X56.976 Y127.343 E2.73766
G1 X56.976 Y127.878 E.01643
G1 X120.418 Y64.435 E2.7609
G1 X120.952 Y64.435 E.01643
G1 X56.976 Y128.412 E2.78414
G1 X56.976 Y128.946 E.01643
G1 X121.486 Y64.435 E2.80738
G1 X122.02 Y64.435 E.01643
G1 X56.976 Y129.48 E2.83062
G1 X56.976 Y130.014 E.01643
G1 X122.554 Y64.435 E2.85387
G1 X123.088 Y64.435 E.01643
G1 X56.976 Y130.548 E2.87711
G1 X56.976 Y131.082 E.01643
G1 X123.622 Y64.435 E2.90035
G1 X124.156 Y64.435 E.01643
G1 X56.976 Y131.616 E2.92359
G1 X56.976 Y132.15 E.01643
G1 X124.69 Y64.435 E2.94683
G1 X125.224 Y64.435 E.01643
G1 X56.976 Y132.684 E2.97007
G1 X56.976 Y133.218 E.01643
G1 X125.758 Y64.435 E2.99331
G1 X126.292 Y64.435 E.01643
G1 X56.976 Y133.752 E3.01655
G1 X56.976 Y134.286 E.01643
G1 X126.826 Y64.435 E3.03979
G1 X127.36 Y64.435 E.01643
G1 X56.976 Y134.82 E3.06303
G1 X56.976 Y135.354 E.01643
G1 X127.895 Y64.435 E3.08628
G1 X128.429 Y64.435 E.01643
G1 X56.976 Y135.888 E3.10952
G1 X56.976 Y136.422 E.01643
G1 X128.963 Y64.435 E3.13276
G1 X129.497 Y64.435 E.01643
G1 X56.976 Y136.956 E3.156
G1 X56.976 Y137.49 E.01643
G1 X130.031 Y64.435 E3.17924
G1 X130.565 Y64.435 E.01643
G1 X56.976 Y138.024 E3.20248
G1 X56.976 Y138.559 E.01643
G1 X131.099 Y64.435 E3.22572
G1 X131.633 Y64.435 E.01643
G1 X56.976 Y139.093 E3.24896
G1 X56.976 Y139.627 E.01643
G1 X132.167 Y64.435 E3.2722
G1 X132.701 Y64.435 E.01643
G1 X56.976 Y140.161 E3.29545
G1 X56.976 Y140.695 E.01643
G1 X133.235 Y64.435 E3.31869
G1 X133.769 Y64.435 E.01643
G1 X56.976 Y141.229 E3.34193
G1 X56.976 Y141.763 E.01643
G1 X134.303 Y64.435 E3.36517
G1 X134.837 Y64.435 E.01643
G1 X56.976 Y142.297 E3.38841
G1 X56.976 Y142.831 E.01643
G1 X135.371 Y64.435 E3.41165
G1 X135.905 Y64.435 E.01643
G1 X56.976 Y143.365 E3.43489
G1 X56.976 Y143.899 E.01643
G1 X136.439 Y64.435 E3.45813
G1 X136.973 Y64.435 E.01643
G1 X56.976 Y144.433 E3.48137
G1 X56.976 Y144.967 E.01643
G1 X137.507 Y64.435 E3.50461
G1 X138.042 Y64.435 E.01643
G1 X56.976 Y145.501 E3.52786
G1 X56.976 Y146.035 E.01643
G1 X138.576 Y64.435 E3.5511
M73 P78 R14
G1 X139.11 Y64.435 E.01643
G1 X56.976 Y146.569 E3.57434
G1 X56.976 Y147.103 E.01643
G1 X139.644 Y64.435 E3.59758
G1 X140.178 Y64.435 E.01643
G1 X56.976 Y147.637 E3.62082
G1 X56.976 Y148.171 E.01643
G1 X140.712 Y64.435 E3.64406
G1 X141.246 Y64.435 E.01643
G1 X56.976 Y148.705 E3.6673
G1 X56.976 Y149.24 E.01643
G1 X141.78 Y64.435 E3.69054
G1 X142.314 Y64.435 E.01643
G1 X56.976 Y149.774 E3.71378
G1 X56.976 Y150.308 E.01643
G1 X142.848 Y64.435 E3.73702
G1 X143.382 Y64.435 E.01643
G1 X56.976 Y150.842 E3.76027
G1 X56.976 Y151.376 E.01643
G1 X143.916 Y64.435 E3.78351
G1 X144.45 Y64.435 E.01643
G1 X56.976 Y151.91 E3.80675
G1 X56.976 Y152.444 E.01643
G1 X144.984 Y64.435 E3.82999
G1 X145.518 Y64.435 E.01643
G1 X56.976 Y152.978 E3.85323
G1 X56.976 Y153.512 E.01643
G1 X146.052 Y64.435 E3.87647
G1 X146.586 Y64.435 E.01643
G1 X56.976 Y154.046 E3.89971
G1 X56.976 Y154.58 E.01643
G1 X147.12 Y64.435 E3.92295
G1 X147.654 Y64.435 E.01643
G1 X56.976 Y155.114 E3.94619
G1 X56.976 Y155.648 E.01643
G1 X148.188 Y64.435 E3.96944
G1 X148.723 Y64.435 E.01643
G1 X56.976 Y156.182 E3.99268
G1 X56.976 Y156.716 E.01643
G1 X149.257 Y64.435 E4.01592
G1 X149.791 Y64.435 E.01643
G1 X56.976 Y157.25 E4.03916
G1 X56.976 Y157.784 E.01643
G1 X150.325 Y64.435 E4.0624
G1 X150.859 Y64.435 E.01643
G1 X56.976 Y158.318 E4.08564
G1 X56.976 Y158.852 E.01643
G1 X151.393 Y64.435 E4.10888
G1 X151.927 Y64.435 E.01643
G1 X56.976 Y159.387 E4.13212
G1 X56.976 Y159.921 E.01643
G1 X152.461 Y64.435 E4.15536
G1 X152.995 Y64.435 E.01643
G1 X56.976 Y160.455 E4.1786
G1 X56.976 Y160.989 E.01643
G1 X153.529 Y64.435 E4.20185
G1 X154.063 Y64.435 E.01643
G1 X56.976 Y161.523 E4.22509
G1 X56.976 Y162.057 E.01643
G1 X154.597 Y64.435 E4.24833
G1 X155.131 Y64.435 E.01643
G1 X56.976 Y162.591 E4.27157
G1 X56.976 Y163.125 E.01643
G1 X155.665 Y64.435 E4.29481
G1 X156.199 Y64.435 E.01643
G1 X56.976 Y163.659 E4.31805
G1 X56.976 Y164.193 E.01643
G1 X156.733 Y64.435 E4.34129
G1 X157.267 Y64.435 E.01643
G1 X56.976 Y164.727 E4.36453
G1 X56.976 Y165.261 E.01643
G1 X157.801 Y64.435 E4.38777
G1 X158.335 Y64.435 E.01643
G1 X56.976 Y165.795 E4.41101
G1 X56.976 Y166.329 E.01643
G1 X158.869 Y64.435 E4.43426
G1 X159.404 Y64.435 E.01643
G1 X56.976 Y166.863 E4.4575
G1 X56.976 Y167.397 E.01643
G1 X159.938 Y64.435 E4.48074
G1 X160.472 Y64.435 E.01643
G1 X56.976 Y167.931 E4.50398
G1 X56.976 Y168.465 E.01643
G1 X161.006 Y64.435 E4.52722
G1 X161.54 Y64.435 E.01643
G1 X56.976 Y168.999 E4.55046
G1 X56.976 Y169.533 E.01643
G1 X162.074 Y64.435 E4.5737
G1 X162.608 Y64.435 E.01643
G1 X56.976 Y170.068 E4.59694
G1 X56.976 Y170.602 E.01643
G1 X163.142 Y64.435 E4.62018
G1 X163.676 Y64.435 E.01643
G1 X56.976 Y171.136 E4.64343
G1 X56.976 Y171.67 E.01643
G1 X164.21 Y64.435 E4.66667
G1 X164.744 Y64.435 E.01643
G1 X56.976 Y172.204 E4.68991
G1 X56.976 Y172.738 E.01643
G1 X165.278 Y64.435 E4.71315
G1 X165.812 Y64.435 E.01643
G1 X56.976 Y173.272 E4.73639
G1 X56.976 Y173.806 E.01643
G1 X166.346 Y64.435 E4.75963
G1 X166.88 Y64.435 E.01643
G1 X56.976 Y174.34 E4.78287
G1 X56.976 Y174.874 E.01643
G1 X167.414 Y64.435 E4.80611
G1 X167.948 Y64.435 E.01643
G1 X56.976 Y175.408 E4.82935
G1 X56.976 Y175.942 E.01643
G1 X168.482 Y64.435 E4.85259
G1 X169.016 Y64.435 E.01643
G1 X56.976 Y176.476 E4.87584
G1 X56.976 Y177.01 E.01643
G1 X169.551 Y64.435 E4.89908
M73 P78 R13
G1 X170.085 Y64.435 E.01643
G1 X56.976 Y177.544 E4.92232
G1 X56.976 Y178.078 E.01643
G1 X170.619 Y64.435 E4.94556
G1 X171.153 Y64.435 E.01643
G1 X56.976 Y178.612 E4.9688
G1 X56.976 Y179.146 E.01643
G1 X171.687 Y64.435 E4.99204
G1 X172.221 Y64.435 E.01643
G1 X56.976 Y179.68 E5.01528
G1 X56.976 Y180.214 E.01643
G1 X172.755 Y64.435 E5.03852
G1 X173.289 Y64.435 E.01643
G1 X56.976 Y180.749 E5.06176
G1 X56.976 Y181.283 E.01643
G1 X173.823 Y64.435 E5.085
G1 X174.357 Y64.435 E.01643
G1 X56.976 Y181.817 E5.10825
G1 X56.976 Y182.351 E.01643
G1 X174.891 Y64.435 E5.13149
G1 X175.425 Y64.435 E.01643
G1 X56.976 Y182.885 E5.15473
G1 X56.976 Y183.419 E.01643
G1 X175.959 Y64.435 E5.17797
G1 X176.493 Y64.435 E.01643
G1 X56.976 Y183.953 E5.20121
G1 X56.976 Y184.487 E.01643
G1 X177.027 Y64.435 E5.22445
G1 X177.561 Y64.435 E.01643
G1 X56.976 Y185.021 E5.24769
G1 X56.976 Y185.555 E.01643
G1 X178.095 Y64.435 E5.27093
G1 X178.629 Y64.435 E.01643
G1 X56.976 Y186.089 E5.29417
M73 P79 R13
G1 X56.976 Y186.623 E.01643
G1 X179.163 Y64.435 E5.31741
G1 X179.697 Y64.435 E.01643
G1 X56.976 Y187.157 E5.34066
G1 X56.976 Y187.691 E.01643
G1 X180.232 Y64.435 E5.3639
G1 X180.766 Y64.435 E.01643
G1 X56.976 Y188.225 E5.38714
G1 X56.976 Y188.759 E.01643
G1 X181.3 Y64.435 E5.41038
G1 X181.834 Y64.435 E.01643
G1 X56.976 Y189.293 E5.43362
G1 X56.976 Y189.827 E.01643
G1 X182.368 Y64.435 E5.45686
G1 X182.902 Y64.435 E.01643
G1 X56.976 Y190.361 E5.4801
G1 X56.976 Y190.896 E.01643
G1 X183.436 Y64.435 E5.50334
G1 X183.97 Y64.435 E.01643
G1 X56.976 Y191.43 E5.52658
G1 X56.976 Y191.565 E.00416
G1 X57.375 Y191.565 E.01228
G1 X184.504 Y64.435 E5.53246
G1 X185.038 Y64.435 E.01643
G1 X57.909 Y191.565 E5.53246
G1 X58.443 Y191.565 E.01643
G1 X185.572 Y64.435 E5.53246
G1 X186.106 Y64.435 E.01643
G1 X58.977 Y191.565 E5.53246
G1 X59.511 Y191.565 E.01643
G1 X186.64 Y64.435 E5.53246
G1 X187.174 Y64.435 E.01643
G1 X60.045 Y191.565 E5.53246
G1 X60.579 Y191.565 E.01643
G1 X187.708 Y64.435 E5.53246
G1 X188.242 Y64.435 E.01643
G1 X61.113 Y191.565 E5.53246
G1 X61.647 Y191.565 E.01643
G1 X188.776 Y64.435 E5.53246
G1 X189.31 Y64.435 E.01643
G1 X62.181 Y191.565 E5.53246
G1 X62.715 Y191.565 E.01643
G1 X189.844 Y64.435 E5.53246
G1 X190.379 Y64.435 E.01643
G1 X63.249 Y191.565 E5.53246
G1 X63.783 Y191.565 E.01643
G1 X190.913 Y64.435 E5.53246
G1 X191.447 Y64.435 E.01643
G1 X64.317 Y191.565 E5.53246
G1 X64.851 Y191.565 E.01643
G1 X191.981 Y64.435 E5.53246
G1 X192.515 Y64.435 E.01643
G1 X65.385 Y191.565 E5.53246
G1 X65.919 Y191.565 E.01643
G1 X193.049 Y64.435 E5.53246
G1 X193.583 Y64.435 E.01643
G1 X66.453 Y191.565 E5.53246
G1 X66.988 Y191.565 E.01643
G1 X194.117 Y64.435 E5.53246
G1 X194.651 Y64.435 E.01643
G1 X67.522 Y191.565 E5.53246
G1 X68.056 Y191.565 E.01643
G1 X195.185 Y64.435 E5.53246
G1 X195.719 Y64.435 E.01643
G1 X68.59 Y191.565 E5.53246
G1 X69.124 Y191.565 E.01643
G1 X196.253 Y64.435 E5.53246
G1 X196.787 Y64.435 E.01643
G1 X69.658 Y191.565 E5.53246
G1 X70.192 Y191.565 E.01643
G1 X197.321 Y64.435 E5.53246
G1 X197.855 Y64.435 E.01643
G1 X70.726 Y191.565 E5.53246
G1 X71.26 Y191.565 E.01643
G1 X198.389 Y64.435 E5.53246
G1 X198.923 Y64.435 E.01643
G1 X71.794 Y191.565 E5.53246
G1 X72.328 Y191.565 E.01643
G1 X199.457 Y64.435 E5.53246
G1 X199.991 Y64.435 E.01643
G1 X72.862 Y191.565 E5.53246
G1 X73.396 Y191.565 E.01643
G1 X200.525 Y64.435 E5.53246
G1 X201.06 Y64.435 E.01643
G1 X73.93 Y191.565 E5.53246
G1 X74.464 Y191.565 E.01643
G1 X201.594 Y64.435 E5.53246
G1 X202.128 Y64.435 E.01643
G1 X74.998 Y191.565 E5.53246
G1 X75.532 Y191.565 E.01643
G1 X202.526 Y64.571 E5.52658
G1 X202.526 Y65.105 E.01643
G1 X76.066 Y191.565 E5.50334
G1 X76.6 Y191.565 E.01643
G1 X202.526 Y65.639 E5.4801
G1 X202.526 Y66.173 E.01643
G1 X77.134 Y191.565 E5.45686
G1 X77.669 Y191.565 E.01643
G1 X202.526 Y66.707 E5.43362
G1 X202.526 Y67.241 E.01643
G1 X78.203 Y191.565 E5.41037
G1 X78.737 Y191.565 E.01643
G1 X202.526 Y67.775 E5.38713
G1 X202.526 Y68.309 E.01643
G1 X79.271 Y191.565 E5.36389
G1 X79.805 Y191.565 E.01643
G1 X202.526 Y68.843 E5.34065
G1 X202.526 Y69.377 E.01643
G1 X80.339 Y191.565 E5.31741
G1 X80.873 Y191.565 E.01643
G1 X202.526 Y69.911 E5.29417
M73 P80 R13
G1 X202.526 Y70.445 E.01643
G1 X81.407 Y191.565 E5.27093
G1 X81.941 Y191.565 E.01643
G1 X202.526 Y70.979 E5.24769
G1 X202.526 Y71.513 E.01643
G1 X82.475 Y191.565 E5.22445
G1 X83.009 Y191.565 E.01643
G1 X202.526 Y72.047 E5.2012
G1 X202.526 Y72.581 E.01643
G1 X83.543 Y191.565 E5.17796
G1 X84.077 Y191.565 E.01643
G1 X202.526 Y73.115 E5.15472
G1 X202.526 Y73.649 E.01643
G1 X84.611 Y191.565 E5.13148
G1 X85.145 Y191.565 E.01643
G1 X202.526 Y74.183 E5.10824
G1 X202.526 Y74.718 E.01643
G1 X85.679 Y191.565 E5.085
G1 X86.213 Y191.565 E.01643
G1 X202.526 Y75.252 E5.06176
G1 X202.526 Y75.786 E.01643
G1 X86.747 Y191.565 E5.03852
G1 X87.281 Y191.565 E.01643
G1 X202.526 Y76.32 E5.01528
G1 X202.526 Y76.854 E.01643
G1 X87.815 Y191.565 E4.99204
G1 X88.35 Y191.565 E.01643
G1 X202.526 Y77.388 E4.96879
M73 P80 R12
G1 X202.526 Y77.922 E.01643
G1 X88.884 Y191.565 E4.94555
G1 X89.418 Y191.565 E.01643
G1 X202.526 Y78.456 E4.92231
G1 X202.526 Y78.99 E.01643
G1 X89.952 Y191.565 E4.89907
G1 X90.486 Y191.565 E.01643
G1 X202.526 Y79.524 E4.87583
G1 X202.526 Y80.058 E.01643
G1 X91.02 Y191.565 E4.85259
G1 X91.554 Y191.565 E.01643
G1 X202.526 Y80.592 E4.82935
G1 X202.526 Y81.126 E.01643
G1 X92.088 Y191.565 E4.80611
G1 X92.622 Y191.565 E.01643
G1 X202.526 Y81.66 E4.78287
G1 X202.526 Y82.194 E.01643
G1 X93.156 Y191.565 E4.75963
G1 X93.69 Y191.565 E.01643
G1 X202.526 Y82.728 E4.73638
G1 X202.526 Y83.262 E.01643
G1 X94.224 Y191.565 E4.71314
G1 X94.758 Y191.565 E.01643
G1 X202.526 Y83.796 E4.6899
G1 X202.526 Y84.33 E.01643
G1 X95.292 Y191.565 E4.66666
G1 X95.826 Y191.565 E.01643
G1 X202.526 Y84.864 E4.64342
G1 X202.526 Y85.399 E.01643
G1 X96.36 Y191.565 E4.62018
G1 X96.894 Y191.565 E.01643
G1 X202.526 Y85.933 E4.59694
G1 X202.526 Y86.467 E.01643
G1 X97.428 Y191.565 E4.5737
G1 X97.962 Y191.565 E.01643
G1 X202.526 Y87.001 E4.55046
G1 X202.526 Y87.535 E.01643
G1 X98.497 Y191.565 E4.52721
G1 X99.031 Y191.565 E.01643
G1 X202.526 Y88.069 E4.50397
G1 X202.526 Y88.603 E.01643
G1 X99.565 Y191.565 E4.48073
G1 X100.099 Y191.565 E.01643
G1 X202.526 Y89.137 E4.45749
G1 X202.526 Y89.671 E.01643
G1 X100.633 Y191.565 E4.43425
G1 X101.167 Y191.565 E.01643
G1 X202.526 Y90.205 E4.41101
G1 X202.526 Y90.739 E.01643
G1 X101.701 Y191.565 E4.38777
G1 X102.235 Y191.565 E.01643
G1 X202.526 Y91.273 E4.36453
G1 X202.526 Y91.807 E.01643
G1 X102.769 Y191.565 E4.34129
G1 X103.303 Y191.565 E.01643
G1 X202.526 Y92.341 E4.31805
G1 X202.526 Y92.875 E.01643
G1 X103.837 Y191.565 E4.2948
G1 X104.371 Y191.565 E.01643
G1 X202.526 Y93.409 E4.27156
G1 X202.526 Y93.943 E.01643
G1 X104.905 Y191.565 E4.24832
G1 X105.439 Y191.565 E.01643
G1 X202.526 Y94.477 E4.22508
G1 X202.526 Y95.011 E.01643
G1 X105.973 Y191.565 E4.20184
G1 X106.507 Y191.565 E.01643
G1 X202.526 Y95.545 E4.1786
G1 X202.526 Y96.08 E.01643
G1 X107.041 Y191.565 E4.15536
G1 X107.575 Y191.565 E.01643
G1 X202.526 Y96.614 E4.13212
G1 X202.526 Y97.148 E.01643
G1 X108.109 Y191.565 E4.10888
G1 X108.643 Y191.565 E.01643
G1 X202.526 Y97.682 E4.08564
G1 X202.526 Y98.216 E.01643
G1 X109.178 Y191.565 E4.06239
G1 X109.712 Y191.565 E.01643
G1 X202.526 Y98.75 E4.03915
G1 X202.526 Y99.284 E.01643
G1 X110.246 Y191.565 E4.01591
M73 P81 R12
G1 X110.78 Y191.565 E.01643
G1 X202.526 Y99.818 E3.99267
G1 X202.526 Y100.352 E.01643
G1 X111.314 Y191.565 E3.96943
G1 X111.848 Y191.565 E.01643
G1 X202.526 Y100.886 E3.94619
G1 X202.526 Y101.42 E.01643
G1 X112.382 Y191.565 E3.92295
G1 X112.916 Y191.565 E.01643
G1 X202.526 Y101.954 E3.89971
G1 X202.526 Y102.488 E.01643
G1 X113.45 Y191.565 E3.87647
G1 X113.984 Y191.565 E.01643
G1 X202.526 Y103.022 E3.85323
G1 X202.526 Y103.556 E.01643
G1 X114.518 Y191.565 E3.82998
G1 X115.052 Y191.565 E.01643
G1 X202.526 Y104.09 E3.80674
G1 X202.526 Y104.624 E.01643
G1 X115.586 Y191.565 E3.7835
G1 X116.12 Y191.565 E.01643
G1 X202.526 Y105.158 E3.76026
G1 X202.526 Y105.692 E.01643
G1 X116.654 Y191.565 E3.73702
G1 X117.188 Y191.565 E.01643
G1 X202.526 Y106.227 E3.71378
G1 X202.526 Y106.761 E.01643
G1 X117.722 Y191.565 E3.69054
G1 X118.256 Y191.565 E.01643
G1 X202.526 Y107.295 E3.6673
G1 X202.526 Y107.829 E.01643
G1 X118.79 Y191.565 E3.64406
G1 X119.324 Y191.565 E.01643
G1 X202.526 Y108.363 E3.62081
G1 X202.526 Y108.897 E.01643
G1 X119.859 Y191.565 E3.59757
G1 X120.393 Y191.565 E.01643
G1 X202.526 Y109.431 E3.57433
G1 X202.526 Y109.965 E.01643
G1 X120.927 Y191.565 E3.55109
G1 X121.461 Y191.565 E.01643
G1 X202.526 Y110.499 E3.52785
G1 X202.526 Y111.033 E.01643
G1 X121.995 Y191.565 E3.50461
G1 X122.529 Y191.565 E.01643
G1 X202.526 Y111.567 E3.48137
G1 X202.526 Y112.101 E.01643
G1 X123.063 Y191.565 E3.45813
G1 X123.597 Y191.565 E.01643
G1 X202.526 Y112.635 E3.43489
G1 X202.526 Y113.169 E.01643
G1 X124.131 Y191.565 E3.41165
G1 X124.665 Y191.565 E.01643
G1 X202.526 Y113.703 E3.3884
G1 X202.526 Y114.237 E.01643
G1 X125.199 Y191.565 E3.36516
G1 X125.733 Y191.565 E.01643
G1 X202.526 Y114.771 E3.34192
G1 X202.526 Y115.305 E.01643
G1 X126.267 Y191.565 E3.31868
G1 X126.801 Y191.565 E.01643
G1 X202.526 Y115.839 E3.29544
G1 X202.526 Y116.373 E.01643
G1 X127.335 Y191.565 E3.2722
G1 X127.869 Y191.565 E.01643
G1 X202.526 Y116.908 E3.24896
G1 X202.526 Y117.442 E.01643
G1 X128.403 Y191.565 E3.22572
G1 X128.937 Y191.565 E.01643
G1 X202.526 Y117.976 E3.20248
G1 X202.526 Y118.51 E.01643
G1 X129.471 Y191.565 E3.17924
G1 X130.006 Y191.565 E.01643
G1 X202.526 Y119.044 E3.15599
G1 X202.526 Y119.578 E.01643
G1 X130.54 Y191.565 E3.13275
G1 X131.074 Y191.565 E.01643
G1 X202.526 Y120.112 E3.10951
G1 X202.526 Y120.646 E.01643
G1 X131.608 Y191.565 E3.08627
G1 X132.142 Y191.565 E.01643
G1 X202.526 Y121.18 E3.06303
G1 X202.526 Y121.714 E.01643
G1 X132.676 Y191.565 E3.03979
G1 X133.21 Y191.565 E.01643
G1 X202.526 Y122.248 E3.01655
G1 X202.526 Y122.782 E.01643
G1 X133.744 Y191.565 E2.99331
G1 X134.278 Y191.565 E.01643
G1 X202.526 Y123.316 E2.97007
G1 X202.526 Y123.85 E.01643
G1 X134.812 Y191.565 E2.94682
G1 X135.346 Y191.565 E.01643
G1 X202.526 Y124.384 E2.92358
G1 X202.526 Y124.918 E.01643
G1 X135.88 Y191.565 E2.90034
G1 X136.414 Y191.565 E.01643
G1 X202.526 Y125.452 E2.8771
G1 X202.526 Y125.986 E.01643
G1 X136.948 Y191.565 E2.85386
G1 X137.482 Y191.565 E.01643
G1 X202.526 Y126.52 E2.83062
G1 X202.526 Y127.054 E.01643
G1 X138.016 Y191.565 E2.80738
G1 X138.55 Y191.565 E.01643
G1 X202.526 Y127.589 E2.78414
G1 X202.526 Y128.123 E.01643
G1 X139.084 Y191.565 E2.7609
G1 X139.618 Y191.565 E.01643
G1 X202.526 Y128.657 E2.73766
G1 X202.526 Y129.191 E.01643
G1 X140.152 Y191.565 E2.71441
M73 P81 R11
G1 X140.687 Y191.565 E.01643
G1 X202.526 Y129.725 E2.69117
G1 X202.526 Y130.259 E.01643
G1 X141.221 Y191.565 E2.66793
G1 X141.755 Y191.565 E.01643
G1 X202.526 Y130.793 E2.64469
G1 X202.526 Y131.327 E.01643
G1 X142.289 Y191.565 E2.62145
G1 X142.823 Y191.565 E.01643
G1 X202.526 Y131.861 E2.59821
G1 X202.526 Y132.395 E.01643
G1 X143.357 Y191.565 E2.57497
G1 X143.891 Y191.565 E.01643
G1 X202.526 Y132.929 E2.55173
G1 X202.526 Y133.463 E.01643
G1 X144.425 Y191.565 E2.52849
G1 X144.959 Y191.565 E.01643
G1 X202.526 Y133.997 E2.50525
G1 X202.526 Y134.531 E.01643
G1 X145.493 Y191.565 E2.482
G1 X146.027 Y191.565 E.01643
G1 X202.526 Y135.065 E2.45876
G1 X202.526 Y135.599 E.01643
G1 X146.561 Y191.565 E2.43552
G1 X147.095 Y191.565 E.01643
G1 X202.526 Y136.133 E2.41228
G1 X202.526 Y136.667 E.01643
G1 X147.629 Y191.565 E2.38904
G1 X148.163 Y191.565 E.01643
G1 X202.526 Y137.201 E2.3658
G1 X202.526 Y137.736 E.01643
G1 X148.697 Y191.565 E2.34256
G1 X149.231 Y191.565 E.01643
G1 X202.526 Y138.27 E2.31932
G1 X202.526 Y138.804 E.01643
G1 X149.765 Y191.565 E2.29608
G1 X150.299 Y191.565 E.01643
G1 X202.526 Y139.338 E2.27283
G1 X202.526 Y139.872 E.01643
G1 X150.834 Y191.565 E2.24959
M73 P82 R11
G1 X151.368 Y191.565 E.01643
G1 X202.526 Y140.406 E2.22635
G1 X202.526 Y140.94 E.01643
G1 X151.902 Y191.565 E2.20311
G1 X152.436 Y191.565 E.01643
G1 X202.526 Y141.474 E2.17987
G1 X202.526 Y142.008 E.01643
G1 X152.97 Y191.565 E2.15663
G1 X153.504 Y191.565 E.01643
G1 X202.526 Y142.542 E2.13339
G1 X202.526 Y143.076 E.01643
G1 X154.038 Y191.565 E2.11015
G1 X154.572 Y191.565 E.01643
G1 X202.526 Y143.61 E2.08691
G1 X202.526 Y144.144 E.01643
G1 X155.106 Y191.565 E2.06367
G1 X155.64 Y191.565 E.01643
G1 X202.526 Y144.678 E2.04042
G1 X202.526 Y145.212 E.01643
G1 X156.174 Y191.565 E2.01718
G1 X156.708 Y191.565 E.01643
G1 X202.526 Y145.746 E1.99394
G1 X202.526 Y146.28 E.01643
G1 X157.242 Y191.565 E1.9707
G1 X157.776 Y191.565 E.01643
G1 X202.526 Y146.814 E1.94746
G1 X202.526 Y147.348 E.01643
G1 X158.31 Y191.565 E1.92422
G1 X158.844 Y191.565 E.01643
G1 X202.526 Y147.882 E1.90098
G1 X202.526 Y148.417 E.01643
G1 X159.378 Y191.565 E1.87774
G1 X159.912 Y191.565 E.01643
G1 X202.526 Y148.951 E1.8545
G1 X202.526 Y149.485 E.01643
G1 X160.446 Y191.565 E1.83126
G1 X160.98 Y191.565 E.01643
G1 X202.526 Y150.019 E1.80801
G1 X202.526 Y150.553 E.01643
G1 X161.515 Y191.565 E1.78477
G1 X162.049 Y191.565 E.01643
G1 X202.526 Y151.087 E1.76153
G1 X202.526 Y151.621 E.01643
G1 X162.583 Y191.565 E1.73829
G1 X163.117 Y191.565 E.01643
G1 X202.526 Y152.155 E1.71505
G1 X202.526 Y152.689 E.01643
G1 X163.651 Y191.565 E1.69181
G1 X164.185 Y191.565 E.01643
G1 X202.526 Y153.223 E1.66857
G1 X202.526 Y153.757 E.01643
G1 X164.719 Y191.565 E1.64533
G1 X165.253 Y191.565 E.01643
G1 X202.526 Y154.291 E1.62209
G1 X202.526 Y154.825 E.01643
G1 X165.787 Y191.565 E1.59884
G1 X166.321 Y191.565 E.01643
G1 X202.526 Y155.359 E1.5756
G1 X202.526 Y155.893 E.01643
G1 X166.855 Y191.565 E1.55236
G1 X167.389 Y191.565 E.01643
G1 X202.526 Y156.427 E1.52912
G1 X202.526 Y156.961 E.01643
G1 X167.923 Y191.565 E1.50588
G1 X168.457 Y191.565 E.01643
G1 X202.526 Y157.495 E1.48264
G1 X202.526 Y158.029 E.01643
G1 X168.991 Y191.565 E1.4594
G1 X169.525 Y191.565 E.01643
G1 X202.526 Y158.563 E1.43616
G1 X202.526 Y159.098 E.01643
G1 X170.059 Y191.565 E1.41292
G1 X170.593 Y191.565 E.01643
G1 X202.526 Y159.632 E1.38968
G1 X202.526 Y160.166 E.01643
G1 X171.127 Y191.565 E1.36643
G1 X171.661 Y191.565 E.01643
G1 X202.526 Y160.7 E1.34319
G1 X202.526 Y161.234 E.01643
G1 X172.196 Y191.565 E1.31995
G1 X172.73 Y191.565 E.01643
G1 X202.526 Y161.768 E1.29671
G1 X202.526 Y162.302 E.01643
G1 X173.264 Y191.565 E1.27347
G1 X173.798 Y191.565 E.01643
G1 X202.526 Y162.836 E1.25023
G1 X202.526 Y163.37 E.01643
G1 X174.332 Y191.565 E1.22699
G1 X174.866 Y191.565 E.01643
G1 X202.526 Y163.904 E1.20375
G1 X202.526 Y164.438 E.01643
G1 X175.4 Y191.565 E1.18051
G1 X175.934 Y191.565 E.01643
G1 X202.526 Y164.972 E1.15727
G1 X202.526 Y165.506 E.01643
G1 X176.468 Y191.565 E1.13402
G1 X177.002 Y191.565 E.01643
G1 X202.526 Y166.04 E1.11078
G1 X202.526 Y166.574 E.01643
G1 X177.536 Y191.565 E1.08754
G1 X178.07 Y191.565 E.01643
G1 X202.526 Y167.108 E1.0643
G1 X202.526 Y167.642 E.01643
G1 X178.604 Y191.565 E1.04106
G1 X179.138 Y191.565 E.01643
G1 X202.526 Y168.176 E1.01782
G1 X202.526 Y168.71 E.01643
G1 X179.672 Y191.565 E.99458
G1 X180.206 Y191.565 E.01643
G1 X202.526 Y169.245 E.97134
G1 X202.526 Y169.779 E.01643
G1 X180.74 Y191.565 E.9481
G1 X181.274 Y191.565 E.01643
G1 X202.526 Y170.313 E.92486
G1 X202.526 Y170.847 E.01643
G1 X181.808 Y191.565 E.90161
G1 X182.343 Y191.565 E.01643
G1 X202.526 Y171.381 E.87837
G1 X202.526 Y171.915 E.01643
G1 X182.877 Y191.565 E.85513
G1 X183.411 Y191.565 E.01643
G1 X202.526 Y172.449 E.83189
G1 X202.526 Y172.983 E.01643
G1 X183.945 Y191.565 E.80865
G1 X184.479 Y191.565 E.01643
G1 X202.526 Y173.517 E.78541
G1 X202.526 Y174.051 E.01643
G1 X185.013 Y191.565 E.76217
G1 X185.547 Y191.565 E.01643
G1 X202.526 Y174.585 E.73893
G1 X202.526 Y175.119 E.01643
G1 X186.081 Y191.565 E.71569
G1 X186.615 Y191.565 E.01643
G1 X202.526 Y175.653 E.69244
G1 X202.526 Y176.187 E.01643
G1 X187.149 Y191.565 E.6692
G1 X187.683 Y191.565 E.01643
G1 X202.526 Y176.721 E.64596
G1 X202.526 Y177.255 E.01643
G1 X188.217 Y191.565 E.62272
G1 X188.751 Y191.565 E.01643
G1 X202.526 Y177.789 E.59948
G1 X202.526 Y178.323 E.01643
G1 X189.285 Y191.565 E.57624
G1 X189.819 Y191.565 E.01643
G1 X202.526 Y178.857 E.553
G1 X202.526 Y179.391 E.01643
G1 X190.353 Y191.565 E.52976
G1 X190.887 Y191.565 E.01643
G1 X202.526 Y179.926 E.50652
G1 X202.526 Y180.46 E.01643
G1 X191.421 Y191.565 E.48328
G1 X191.955 Y191.565 E.01643
G1 X202.526 Y180.994 E.46003
G1 X202.526 Y181.528 E.01643
G1 X192.489 Y191.565 E.43679
G1 X193.024 Y191.565 E.01643
G1 X202.526 Y182.062 E.41355
G1 X202.526 Y182.596 E.01643
G1 X193.558 Y191.565 E.39031
G1 X194.092 Y191.565 E.01643
G1 X202.526 Y183.13 E.36707
G1 X202.526 Y183.664 E.01643
G1 X194.626 Y191.565 E.34383
G1 X195.16 Y191.565 E.01643
G1 X202.526 Y184.198 E.32059
G1 X202.526 Y184.732 E.01643
G1 X195.694 Y191.565 E.29735
G1 X196.228 Y191.565 E.01643
G1 X202.526 Y185.266 E.27411
G1 X202.526 Y185.8 E.01643
G1 X196.762 Y191.565 E.25087
G1 X197.296 Y191.565 E.01643
G1 X202.526 Y186.334 E.22762
G1 X202.526 Y186.868 E.01643
G1 X197.83 Y191.565 E.20438
G1 X198.364 Y191.565 E.01643
G1 X202.526 Y187.402 E.18114
G1 X202.526 Y187.936 E.01643
G1 X198.898 Y191.565 E.1579
G1 X199.432 Y191.565 E.01643
G1 X202.526 Y188.47 E.13466
G1 X202.526 Y189.004 E.01643
G1 X199.966 Y191.565 E.11142
G1 X200.5 Y191.565 E.01643
G1 X202.526 Y189.538 E.08818
G1 X202.526 Y190.072 E.01643
G1 X201.034 Y191.565 E.06494
G1 X201.568 Y191.565 E.01643
G1 X202.526 Y190.607 E.0417
G1 X202.526 Y191.141 E.01643
G1 X201.933 Y191.734 E.02584
; CHANGE_LAYER
; Z_HEIGHT: 5
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X202.526 Y191.141 E-.31908
G1 X202.526 Y190.607 E-.20294
G1 X202.084 Y191.049 E-.23798
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 25/50
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
G3 Z5.2 I1.166 J-.347 P1  F30000
G1 X166.988 Y73.122 Z5.2
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X166.988 Y70.278 E.09435
G1 X174.832 Y70.278 E.26021
G1 X174.832 Y73.122 E.09435
G1 X167.048 Y73.122 E.25822
; WIPE_START
G1 F24000
G1 X167.006 Y71.123 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I-1.217 J0 P1  F30000
G1 X166.988 Y186.322 Z5.4
G1 Z5
G1 E.8 F1800
G1 F15476.087
G1 X166.988 Y183.478 E.09435
G1 X174.832 Y183.478 E.26021
G1 X174.832 Y186.322 E.09435
G1 X167.048 Y186.322 E.25822
; WIPE_START
G1 F24000
G1 X167.006 Y184.323 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I-.023 J-1.217 P1  F30000
G1 X61.988 Y186.322 Z5.4
G1 Z5
G1 E.8 F1800
G1 F15476.087
G1 X61.988 Y70.278 E3.84941
G1 X64.832 Y70.278 E.09436
G1 X64.832 Y186.322 E3.84941
G1 X62.048 Y186.322 E.09236
; WIPE_START
G1 F24000
G1 X62.047 Y184.322 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I-.982 J-.719 P1  F30000
G1 X56.209 Y192.29 Z5.4
G1 Z5
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X56.158 Y192.29 E.00158
G1 X56.158 Y63.71 E3.9509
G1 X56.209 Y63.71 E.00158
G1 X203.662 Y63.71 E4.5308
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X203.685 Y63.71 E.00077
G1 X203.685 Y192.29 E4.26523
G1 X203.662 Y192.29 E.00077
M106 S127.5
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X203.293 Y192.29 E.01134
G1 X56.269 Y192.29 E4.51762
M204 S10000
; WIPE_START
G1 F24000
G1 X56.158 Y192.29 E-.04231
G1 X56.158 Y190.401 E-.71769
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I.065 J1.215 P1  F30000
G1 X174.61 Y184.075 Z5.4
G1 Z5
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
G1 F12000
G1 X174.235 Y183.7 E.0163
G1 X173.702 Y183.7
G1 X174.61 Y184.608 E.03947
G1 X174.61 Y185.142
G1 X173.168 Y183.7 E.06264
G1 X172.635 Y183.7
G1 X174.61 Y185.675 E.08582
G1 X174.501 Y186.1
G1 X172.102 Y183.7 E.10428
G1 X171.568 Y183.7
G1 X173.968 Y186.1 E.10428
G1 X173.435 Y186.1
G1 X171.035 Y183.7 E.10428
G1 X170.502 Y183.7
G1 X172.902 Y186.1 E.10428
G1 X172.368 Y186.1
G1 X169.969 Y183.7 E.10428
G1 X169.435 Y183.7
G1 X171.835 Y186.1 E.10428
G1 X171.302 Y186.1
G1 X168.902 Y183.7 E.10428
G1 X168.369 Y183.7
G1 X170.768 Y186.1 E.10428
G1 X170.235 Y186.1
G1 X167.836 Y183.7 E.10428
G1 X167.302 Y183.7
G1 X169.702 Y186.1 E.10428
G1 X169.169 Y186.1
G1 X167.21 Y184.141 E.08511
G1 X167.21 Y184.675
G1 X168.635 Y186.1 E.06193
G1 X168.102 Y186.1
G1 X167.21 Y185.208 E.03876
G1 X167.21 Y185.741
G1 X167.569 Y186.1 E.01559
M204 S10000
; WIPE_START
G1 F24000
G1 X167.21 Y185.741 E-.19275
G1 X167.21 Y185.208 E-.20264
G1 X167.889 Y185.886 E-.36461
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I-.214 J1.198 P1  F30000
G1 X202.877 Y192.141 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.495415
M106 S255
G1 F3000
G1 X202.877 Y64.028 E4.72387
G1 X203.329 Y64.028 E.01668
G1 X203.329 Y192.141 E4.72387
M106 S127.5
; WIPE_START
G1 F24000
G1 X203.329 Y190.141 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I1.183 J-.285 P1  F30000
G1 X174.61 Y71.022 Z5.4
G1 Z5
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X174.088 Y70.5 E.02267
G1 X173.555 Y70.5
G1 X174.61 Y71.555 E.04585
G1 X174.61 Y72.088
G1 X173.022 Y70.5 E.06902
G1 X172.488 Y70.5
G1 X174.61 Y72.622 E.09219
G1 X174.355 Y72.9
G1 X171.955 Y70.5 E.10428
G1 X171.422 Y70.5
G1 X173.821 Y72.9 E.10428
G1 X173.288 Y72.9
G1 X170.888 Y70.5 E.10428
G1 X170.355 Y70.5
G1 X172.755 Y72.9 E.10428
G1 X172.222 Y72.9
G1 X169.822 Y70.5 E.10428
G1 X169.289 Y70.5
G1 X171.688 Y72.9 E.10428
G1 X171.155 Y72.9
G1 X168.755 Y70.5 E.10428
G1 X168.222 Y70.5
G1 X170.622 Y72.9 E.10428
G1 X170.088 Y72.9
G1 X167.689 Y70.5 E.10428
G1 X167.21 Y70.555
G1 X169.555 Y72.9 E.1019
G1 X169.022 Y72.9
G1 X167.21 Y71.088 E.07873
G1 X167.21 Y71.621
G1 X168.489 Y72.9 E.05556
G1 X167.955 Y72.9
G1 X167.21 Y72.155 E.03238
M204 S10000
; WIPE_START
G1 F24000
G1 X167.955 Y72.9 E-.40048
G1 X168.489 Y72.9 E-.20264
G1 X168.197 Y72.608 E-.15688
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I.306 J1.178 P1  F30000
G1 X201.635 Y63.917 Z5.4
G1 Z5
G1 E.8 F1800
M204 S2000
M73 P83 R11
G1 F12000
G1 X202.483 Y64.766 E.03687
G1 X202.483 Y65.299
G1 X201.101 Y63.917 E.06004
G1 X200.568 Y63.917
G1 X202.483 Y65.832 E.08321
G1 X202.483 Y66.366
G1 X200.035 Y63.917 E.10638
G1 X199.502 Y63.917
G1 X202.483 Y66.899 E.12956
G1 X202.483 Y67.432
G1 X198.968 Y63.917 E.15273
G1 X198.435 Y63.917
G1 X202.483 Y67.965 E.1759
G1 X202.483 Y68.499
G1 X197.902 Y63.917 E.19908
G1 X197.368 Y63.917
G1 X202.483 Y69.032 E.22225
G1 X202.483 Y69.565
G1 X196.835 Y63.917 E.24542
G1 X196.302 Y63.917
G1 X202.483 Y70.098 E.2686
G1 X202.483 Y70.632
G1 X195.769 Y63.917 E.29177
G1 X195.235 Y63.917
G1 X202.483 Y71.165 E.31494
G1 X202.483 Y71.698
G1 X194.702 Y63.917 E.33812
G1 X194.169 Y63.917
G1 X202.483 Y72.232 E.36129
G1 X202.483 Y72.765
G1 X193.636 Y63.917 E.38446
G1 X193.102 Y63.917
G1 X202.483 Y73.298 E.40764
G1 X202.483 Y73.831
G1 X192.569 Y63.917 E.43081
G1 X192.036 Y63.917
G1 X202.483 Y74.365 E.45398
G1 X202.483 Y74.898
G1 X191.502 Y63.917 E.47716
G1 X190.969 Y63.917
G1 X202.483 Y75.431 E.50033
G1 X202.483 Y75.964
G1 X190.436 Y63.917 E.5235
G1 X189.903 Y63.917
G1 X202.483 Y76.498 E.54668
G1 X202.483 Y77.031
G1 X189.369 Y63.917 E.56985
G1 X188.836 Y63.917
G1 X202.483 Y77.564 E.59302
G1 X202.483 Y78.098
G1 X188.303 Y63.917 E.61619
G1 X187.77 Y63.917
G1 X202.483 Y78.631 E.63937
G1 X202.483 Y79.164
G1 X187.236 Y63.917 E.66254
G1 X186.703 Y63.917
G1 X202.483 Y79.697 E.68571
G1 X202.483 Y80.231
G1 X186.17 Y63.917 E.70889
G1 X185.636 Y63.917
G1 X202.483 Y80.764 E.73206
G1 X202.483 Y81.297
G1 X185.103 Y63.917 E.75523
G1 X184.57 Y63.917
G1 X202.483 Y81.83 E.77841
G1 X202.483 Y82.364
G1 X184.037 Y63.917 E.80158
G1 X183.503 Y63.917
G1 X202.483 Y82.897 E.82475
G1 X202.483 Y83.43
G1 X182.97 Y63.917 E.84793
G1 X182.437 Y63.917
G1 X202.483 Y83.963 E.8711
G1 X202.483 Y84.497
G1 X181.904 Y63.917 E.89427
G1 X181.37 Y63.917
G1 X202.483 Y85.03 E.91745
G1 X202.483 Y85.563
G1 X180.837 Y63.917 E.94062
G1 X180.304 Y63.917
G1 X202.483 Y86.097 E.96379
G1 X202.483 Y86.63
G1 X179.771 Y63.917 E.98697
G1 X179.237 Y63.917
G1 X202.483 Y87.163 E1.01014
G1 X202.483 Y87.696
G1 X178.704 Y63.917 E1.03331
G1 X178.171 Y63.917
G1 X202.483 Y88.23 E1.05648
G1 X202.483 Y88.763
G1 X177.637 Y63.917 E1.07966
G1 X177.104 Y63.917
G1 X202.483 Y89.296 E1.10283
G1 X202.483 Y89.829
G1 X176.571 Y63.917 E1.126
G1 X176.038 Y63.917
G1 X202.483 Y90.363 E1.14918
G1 X202.483 Y90.896
G1 X175.504 Y63.917 E1.17235
G1 X174.971 Y63.917
G1 X202.483 Y91.429 E1.19552
G1 X202.483 Y91.963
G1 X174.438 Y63.917 E1.2187
G1 X173.905 Y63.917
G1 X202.483 Y92.496 E1.24187
G1 X202.483 Y93.029
G1 X173.371 Y63.917 E1.26504
G1 X172.838 Y63.917
G1 X202.483 Y93.562 E1.28822
G1 X202.483 Y94.096
G1 X172.305 Y63.917 E1.31139
G1 X171.771 Y63.917
G1 X202.483 Y94.629 E1.33456
G1 X202.483 Y95.162
G1 X171.238 Y63.917 E1.35774
G1 X170.705 Y63.917
G1 X202.483 Y95.695 E1.38091
G1 X202.483 Y96.229
G1 X170.172 Y63.917 E1.40408
G1 X169.638 Y63.917
G1 X202.483 Y96.762 E1.42726
G1 X202.483 Y97.295
G1 X169.105 Y63.917 E1.45043
G1 X168.572 Y63.917
G1 X174.71 Y70.055 E.26673
G1 X174.177 Y70.055
G1 X168.039 Y63.917 E.26673
G1 X167.505 Y63.917
G1 X173.643 Y70.055 E.26673
M73 P83 R10
G1 X173.11 Y70.055
G1 X166.972 Y63.917 E.26673
G1 X166.439 Y63.917
G1 X172.577 Y70.055 E.26673
G1 X172.043 Y70.055
G1 X165.905 Y63.917 E.26673
G1 X165.372 Y63.917
G1 X171.51 Y70.055 E.26673
G1 X170.977 Y70.055
G1 X164.839 Y63.917 E.26673
G1 X164.306 Y63.917
G1 X170.444 Y70.055 E.26673
G1 X169.91 Y70.055
G1 X163.772 Y63.917 E.26673
G1 X163.239 Y63.917
G1 X169.377 Y70.055 E.26673
G1 X168.844 Y70.055
G1 X162.706 Y63.917 E.26673
G1 X162.173 Y63.917
G1 X168.311 Y70.055 E.26673
G1 X167.777 Y70.055
G1 X161.639 Y63.917 E.26673
G1 X161.106 Y63.917
G1 X167.244 Y70.055 E.26673
G1 X166.765 Y70.11
G1 X160.573 Y63.917 E.2691
G1 X160.04 Y63.917
G1 X166.765 Y70.643 E.29227
G1 X166.765 Y71.177
G1 X159.506 Y63.917 E.31544
G1 X158.973 Y63.917
G1 X166.765 Y71.71 E.33862
G1 X166.765 Y72.243
G1 X158.44 Y63.917 E.36179
G1 X157.906 Y63.917
G1 X166.765 Y72.776 E.38496
G1 X166.765 Y73.31
G1 X157.373 Y63.917 E.40814
M204 S10000
; WIPE_START
G1 F24000
G1 X158.787 Y65.332 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I-.362 J1.162 P1  F30000
G1 X175.055 Y70.4 Z5.4
G1 Z5
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X202.483 Y97.829 E1.19189
G1 X202.483 Y98.362
G1 X175.055 Y70.933 E1.19189
G1 X175.055 Y71.467
G1 X202.483 Y98.895 E1.19189
G1 X202.483 Y99.428
G1 X175.055 Y72 E1.19189
G1 X175.055 Y72.533
G1 X202.483 Y99.962 E1.19189
G1 X202.483 Y100.495
G1 X175.055 Y73.067 E1.19189
G1 X174.799 Y73.345
G1 X202.483 Y101.028 E1.20298
G1 X202.483 Y101.561
G1 X174.266 Y73.345 E1.22616
G1 X173.733 Y73.345
G1 X202.483 Y102.095 E1.24933
G1 X202.483 Y102.628
G1 X173.2 Y73.345 E1.2725
G1 X172.666 Y73.345
G1 X202.483 Y103.161 E1.29568
G1 X202.483 Y103.694
G1 X172.133 Y73.345 E1.31885
G1 X171.6 Y73.345
G1 X202.483 Y104.228 E1.34202
G1 X202.483 Y104.761
G1 X171.067 Y73.345 E1.36519
G1 X170.533 Y73.345
G1 X202.483 Y105.294 E1.38837
G1 X202.483 Y105.828
G1 X170 Y73.345 E1.41154
G1 X169.467 Y73.345
G1 X202.483 Y106.361 E1.43471
G1 X202.483 Y106.894
G1 X168.933 Y73.345 E1.45789
G1 X168.4 Y73.345
G1 X202.483 Y107.427 E1.48106
G1 X202.483 Y107.961
G1 X167.867 Y73.345 E1.50423
G1 X167.334 Y73.345
G1 X202.483 Y108.494 E1.52741
G1 X202.483 Y109.027
G1 X166.8 Y73.345 E1.55058
M204 S10000
; WIPE_START
G1 F24000
G1 X168.215 Y74.759 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I.84 J-.881 P1  F30000
G1 X156.84 Y63.917 Z5.4
G1 Z5
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X202.483 Y109.56 E1.98341
G1 X202.483 Y110.094
G1 X156.307 Y63.917 E2.00658
G1 X155.773 Y63.917
G1 X202.483 Y110.627 E2.02976
G1 X202.483 Y111.16
G1 X155.24 Y63.917 E2.05293
G1 X154.707 Y63.917
G1 X202.483 Y111.694 E2.0761
G1 X202.483 Y112.227
G1 X154.174 Y63.917 E2.09928
G1 X153.64 Y63.917
G1 X202.483 Y112.76 E2.12245
G1 X202.483 Y113.293
G1 X153.107 Y63.917 E2.14562
G1 X152.574 Y63.917
G1 X202.483 Y113.827 E2.1688
G1 X202.483 Y114.36
G1 X152.04 Y63.917 E2.19197
G1 X151.507 Y63.917
G1 X202.483 Y114.893 E2.21514
G1 X202.483 Y115.426
G1 X150.974 Y63.917 E2.23832
G1 X150.441 Y63.917
G1 X202.483 Y115.96 E2.26149
G1 X202.483 Y116.493
G1 X149.907 Y63.917 E2.28466
G1 X149.374 Y63.917
G1 X202.483 Y117.026 E2.30784
G1 X202.483 Y117.56
G1 X148.841 Y63.917 E2.33101
G1 X148.308 Y63.917
G1 X202.483 Y118.093 E2.35418
G1 X202.483 Y118.626
G1 X147.774 Y63.917 E2.37736
G1 X147.241 Y63.917
G1 X202.483 Y119.159 E2.40053
G1 X202.483 Y119.693
G1 X146.708 Y63.917 E2.4237
G1 X146.174 Y63.917
G1 X202.483 Y120.226 E2.44688
G1 X202.483 Y120.759
G1 X145.641 Y63.917 E2.47005
G1 X145.108 Y63.917
G1 X202.483 Y121.292 E2.49322
G1 X202.483 Y121.826
G1 X144.575 Y63.917 E2.51639
G1 X144.041 Y63.917
G1 X202.483 Y122.359 E2.53957
G1 X202.483 Y122.892
G1 X143.508 Y63.917 E2.56274
G1 X142.975 Y63.917
G1 X202.483 Y123.425 E2.58591
G1 X202.483 Y123.959
G1 X142.442 Y63.917 E2.60909
G1 X141.908 Y63.917
G1 X202.483 Y124.492 E2.63226
G1 X202.483 Y125.025
G1 X141.375 Y63.917 E2.65543
G1 X140.842 Y63.917
G1 X202.483 Y125.559 E2.67861
G1 X202.483 Y126.092
G1 X140.309 Y63.917 E2.70178
G1 X139.775 Y63.917
G1 X202.483 Y126.625 E2.72495
G1 X202.483 Y127.158
G1 X139.242 Y63.917 E2.74813
G1 X138.709 Y63.917
G1 X202.483 Y127.692 E2.7713
G1 X202.483 Y128.225
G1 X138.175 Y63.917 E2.79447
G1 X137.642 Y63.917
G1 X202.483 Y128.758 E2.81765
G1 X202.483 Y129.291
G1 X137.109 Y63.917 E2.84082
G1 X136.576 Y63.917
G1 X202.483 Y129.825 E2.86399
G1 X202.483 Y130.358
G1 X136.042 Y63.917 E2.88717
G1 X135.509 Y63.917
G1 X202.483 Y130.891 E2.91034
G1 X202.483 Y131.425
G1 X134.976 Y63.917 E2.93351
G1 X134.443 Y63.917
G1 X202.483 Y131.958 E2.95668
G1 X202.483 Y132.491
G1 X133.909 Y63.917 E2.97986
G1 X133.376 Y63.917
G1 X202.483 Y133.024 E3.00303
G1 X202.483 Y133.558
G1 X132.843 Y63.917 E3.0262
M73 P84 R10
G1 X132.309 Y63.917
G1 X202.483 Y134.091 E3.04938
G1 X202.483 Y134.624
G1 X131.776 Y63.917 E3.07255
G1 X131.243 Y63.917
G1 X202.483 Y135.157 E3.09572
G1 X202.483 Y135.691
G1 X130.71 Y63.917 E3.1189
G1 X130.176 Y63.917
G1 X202.483 Y136.224 E3.14207
G1 X202.483 Y136.757
G1 X129.643 Y63.917 E3.16524
G1 X129.11 Y63.917
G1 X202.483 Y137.291 E3.18842
G1 X202.483 Y137.824
G1 X128.577 Y63.917 E3.21159
G1 X128.043 Y63.917
G1 X202.483 Y138.357 E3.23476
G1 X202.483 Y138.89
G1 X127.51 Y63.917 E3.25794
G1 X126.977 Y63.917
G1 X202.483 Y139.424 E3.28111
G1 X202.483 Y139.957
G1 X126.443 Y63.917 E3.30428
G1 X125.91 Y63.917
G1 X202.483 Y140.49 E3.32746
G1 X202.483 Y141.023
G1 X125.377 Y63.917 E3.35063
G1 X124.844 Y63.917
G1 X202.483 Y141.557 E3.3738
G1 X202.483 Y142.09
G1 X124.31 Y63.917 E3.39698
G1 X123.777 Y63.917
G1 X202.483 Y142.623 E3.42015
G1 X202.483 Y143.156
G1 X123.244 Y63.917 E3.44332
G1 X122.711 Y63.917
G1 X202.483 Y143.69 E3.46649
G1 X202.483 Y144.223
G1 X122.177 Y63.917 E3.48967
G1 X121.644 Y63.917
G1 X202.483 Y144.756 E3.51284
G1 X202.483 Y145.29
G1 X121.111 Y63.917 E3.53601
G1 X120.578 Y63.917
G1 X202.483 Y145.823 E3.55919
G1 X202.483 Y146.356
G1 X120.044 Y63.917 E3.58236
G1 X119.511 Y63.917
G1 X202.483 Y146.889 E3.60553
G1 X202.483 Y147.423
G1 X118.978 Y63.917 E3.62871
G1 X118.444 Y63.917
G1 X202.483 Y147.956 E3.65188
G1 X202.483 Y148.489
G1 X117.911 Y63.917 E3.67505
G1 X117.378 Y63.917
G1 X202.483 Y149.022 E3.69823
G1 X202.483 Y149.556
G1 X116.845 Y63.917 E3.7214
G1 X116.311 Y63.917
G1 X202.483 Y150.089 E3.74457
G1 X202.483 Y150.622
G1 X115.778 Y63.917 E3.76775
G1 X115.245 Y63.917
G1 X202.483 Y151.156 E3.79092
G1 X202.483 Y151.689
G1 X114.712 Y63.917 E3.81409
G1 X114.178 Y63.917
G1 X202.483 Y152.222 E3.83727
G1 X202.483 Y152.755
G1 X113.645 Y63.917 E3.86044
G1 X113.112 Y63.917
G1 X202.483 Y153.289 E3.88361
G1 X202.483 Y153.822
G1 X112.578 Y63.917 E3.90679
G1 X112.045 Y63.917
G1 X202.483 Y154.355 E3.92996
G1 X202.483 Y154.888
G1 X111.512 Y63.917 E3.95313
G1 X110.979 Y63.917
G1 X202.483 Y155.422 E3.9763
G1 X202.483 Y155.955
G1 X110.445 Y63.917 E3.99948
G1 X109.912 Y63.917
G1 X202.483 Y156.488 E4.02265
G1 X202.483 Y157.022
G1 X109.379 Y63.917 E4.04582
G1 X108.846 Y63.917
G1 X202.483 Y157.555 E4.069
G1 X202.483 Y158.088
G1 X108.312 Y63.917 E4.09217
G1 X107.779 Y63.917
G1 X202.483 Y158.621 E4.11534
G1 X202.483 Y159.155
G1 X107.246 Y63.917 E4.13852
G1 X106.712 Y63.917
G1 X202.483 Y159.688 E4.16169
G1 X202.483 Y160.221
G1 X106.179 Y63.917 E4.18486
G1 X105.646 Y63.917
G1 X202.483 Y160.754 E4.20804
G1 X202.483 Y161.288
G1 X105.113 Y63.917 E4.23121
G1 X104.579 Y63.917
G1 X202.483 Y161.821 E4.25438
G1 X202.483 Y162.354
G1 X104.046 Y63.917 E4.27756
M73 P84 R9
G1 X103.513 Y63.917
G1 X202.483 Y162.887 E4.30073
G1 X202.483 Y163.421
G1 X102.98 Y63.917 E4.3239
G1 X102.446 Y63.917
G1 X202.483 Y163.954 E4.34708
G1 X202.483 Y164.487
G1 X101.913 Y63.917 E4.37025
G1 X101.38 Y63.917
G1 X202.483 Y165.021 E4.39342
G1 X202.483 Y165.554
G1 X100.847 Y63.917 E4.41659
G1 X100.313 Y63.917
G1 X202.483 Y166.087 E4.43977
G1 X202.483 Y166.62
G1 X99.78 Y63.917 E4.46294
G1 X99.247 Y63.917
G1 X202.483 Y167.154 E4.48611
M73 P85 R9
G1 X202.483 Y167.687
G1 X98.713 Y63.917 E4.50929
G1 X98.18 Y63.917
G1 X202.483 Y168.22 E4.53246
G1 X202.483 Y168.753
G1 X97.647 Y63.917 E4.55563
G1 X97.114 Y63.917
G1 X202.483 Y169.287 E4.57881
G1 X202.483 Y169.82
G1 X96.58 Y63.917 E4.60198
G1 X96.047 Y63.917
G1 X202.483 Y170.353 E4.62515
G1 X202.483 Y170.887
G1 X95.514 Y63.917 E4.64833
G1 X94.981 Y63.917
G1 X202.483 Y171.42 E4.6715
G1 X202.483 Y171.953
G1 X94.447 Y63.917 E4.69467
G1 X93.914 Y63.917
G1 X202.483 Y172.486 E4.71785
G1 X202.483 Y173.02
G1 X93.381 Y63.917 E4.74102
G1 X92.847 Y63.917
G1 X202.483 Y173.553 E4.76419
G1 X202.483 Y174.086
G1 X92.314 Y63.917 E4.78737
G1 X91.781 Y63.917
G1 X202.483 Y174.619 E4.81054
G1 X202.483 Y175.153
G1 X91.248 Y63.917 E4.83371
G1 X90.714 Y63.917
G1 X202.483 Y175.686 E4.85689
G1 X202.483 Y176.219
G1 X90.181 Y63.917 E4.88006
G1 X89.648 Y63.917
G1 X202.483 Y176.752 E4.90323
G1 X202.483 Y177.286
G1 X89.115 Y63.917 E4.9264
G1 X88.581 Y63.917
G1 X202.483 Y177.819 E4.94958
G1 X202.483 Y178.352
G1 X88.048 Y63.917 E4.97275
G1 X87.515 Y63.917
G1 X202.483 Y178.886 E4.99592
G1 X202.483 Y179.419
G1 X86.981 Y63.917 E5.0191
G1 X86.448 Y63.917
G1 X202.483 Y179.952 E5.04227
G1 X202.483 Y180.485
G1 X85.915 Y63.917 E5.06544
G1 X85.382 Y63.917
G1 X202.483 Y181.019 E5.08862
G1 X202.483 Y181.552
G1 X84.848 Y63.917 E5.11179
G1 X84.315 Y63.917
G1 X202.483 Y182.085 E5.13496
G1 X202.483 Y182.618
G1 X83.782 Y63.917 E5.15814
G1 X83.249 Y63.917
G1 X202.483 Y183.152 E5.18131
G1 X202.483 Y183.685
G1 X82.715 Y63.917 E5.20448
G1 X82.182 Y63.917
G1 X202.483 Y184.218 E5.22766
G1 X202.483 Y184.752
G1 X81.649 Y63.917 E5.25083
G1 X81.116 Y63.917
G1 X202.483 Y185.285 E5.274
G1 X202.483 Y185.818
G1 X80.582 Y63.917 E5.29718
G1 X80.049 Y63.917
G1 X202.483 Y186.351 E5.32035
G1 X202.483 Y186.885
G1 X79.516 Y63.917 E5.34352
G1 X78.982 Y63.917
G1 X202.483 Y187.418 E5.36669
G1 X202.483 Y187.951
G1 X78.449 Y63.917 E5.38987
G1 X77.916 Y63.917
G1 X202.483 Y188.484 E5.41304
G1 X202.483 Y189.018
G1 X77.383 Y63.917 E5.43621
G1 X76.849 Y63.917
G1 X202.483 Y189.551 E5.45939
G1 X202.483 Y190.084
G1 X76.316 Y63.917 E5.48256
G1 X75.783 Y63.917
G1 X202.483 Y190.618 E5.50573
G1 X202.483 Y191.151
G1 X75.25 Y63.917 E5.52891
G1 X74.716 Y63.917
G1 X202.483 Y191.684 E5.55208
G1 X202.348 Y192.083
G1 X74.183 Y63.917 E5.5694
G1 X73.65 Y63.917
G1 X201.815 Y192.083 E5.5694
M73 P86 R9
G1 X201.282 Y192.083
G1 X73.116 Y63.917 E5.5694
G1 X72.583 Y63.917
G1 X200.748 Y192.083 E5.5694
G1 X200.215 Y192.083
G1 X72.05 Y63.917 E5.5694
G1 X71.517 Y63.917
G1 X199.682 Y192.083 E5.5694
G1 X199.149 Y192.083
G1 X70.983 Y63.917 E5.5694
G1 X70.45 Y63.917
G1 X198.615 Y192.083 E5.5694
G1 X198.082 Y192.083
G1 X69.917 Y63.917 E5.5694
G1 X69.384 Y63.917
G1 X197.549 Y192.083 E5.5694
G1 X197.016 Y192.083
G1 X68.85 Y63.917 E5.5694
G1 X68.317 Y63.917
G1 X196.482 Y192.083 E5.5694
G1 X195.949 Y192.083
G1 X67.784 Y63.917 E5.5694
G1 X67.25 Y63.917
G1 X195.416 Y192.083 E5.5694
G1 X194.882 Y192.083
G1 X66.717 Y63.917 E5.5694
G1 X66.184 Y63.917
G1 X194.349 Y192.083 E5.5694
M73 P86 R8
G1 X193.816 Y192.083
G1 X65.651 Y63.917 E5.5694
G1 X65.117 Y63.917
G1 X193.283 Y192.083 E5.5694
G1 X192.749 Y192.083
G1 X64.584 Y63.917 E5.5694
G1 X64.051 Y63.917
G1 X192.216 Y192.083 E5.5694
G1 X191.683 Y192.083
G1 X63.518 Y63.917 E5.5694
G1 X62.984 Y63.917
G1 X191.15 Y192.083 E5.5694
G1 X190.616 Y192.083
G1 X62.451 Y63.917 E5.5694
G1 X61.918 Y63.917
G1 X190.083 Y192.083 E5.5694
G1 X189.55 Y192.083
G1 X61.385 Y63.917 E5.5694
G1 X60.851 Y63.917
G1 X189.016 Y192.083 E5.5694
G1 X188.483 Y192.083
G1 X60.318 Y63.917 E5.5694
G1 X59.785 Y63.917
G1 X187.95 Y192.083 E5.5694
G1 X187.417 Y192.083
G1 X59.251 Y63.917 E5.5694
G1 X58.718 Y63.917
G1 X64.856 Y70.055 E.26673
G1 X64.323 Y70.055
G1 X58.185 Y63.917 E.26673
G1 X57.652 Y63.917
G1 X63.79 Y70.055 E.26673
G1 X63.256 Y70.055
G1 X57.118 Y63.917 E.26673
G1 X56.585 Y63.917
G1 X62.723 Y70.055 E.26673
G1 X62.19 Y70.055
G1 X56.365 Y64.231 E.2531
G1 X56.365 Y64.764
G1 X61.765 Y70.164 E.23466
G1 X61.765 Y70.697
G1 X56.365 Y65.297 E.23466
G1 X56.365 Y65.831
G1 X61.765 Y71.231 E.23466
G1 X61.765 Y71.764
G1 X56.365 Y66.364 E.23466
G1 X56.365 Y66.897
G1 X61.765 Y72.297 E.23466
G1 X61.765 Y72.831
G1 X56.365 Y67.431 E.23466
M73 P87 R8
G1 X56.365 Y67.964
G1 X61.765 Y73.364 E.23466
G1 X61.765 Y73.897
G1 X56.365 Y68.497 E.23466
G1 X56.365 Y69.03
G1 X61.765 Y74.43 E.23466
G1 X61.765 Y74.964
G1 X56.365 Y69.564 E.23466
G1 X56.365 Y70.097
G1 X61.765 Y75.497 E.23466
G1 X61.765 Y76.03
G1 X56.365 Y70.63 E.23466
G1 X56.365 Y71.163
G1 X61.765 Y76.563 E.23466
G1 X61.765 Y77.097
G1 X56.365 Y71.697 E.23466
G1 X56.365 Y72.23
G1 X61.765 Y77.63 E.23466
G1 X61.765 Y78.163
G1 X56.365 Y72.763 E.23466
G1 X56.365 Y73.297
G1 X61.765 Y78.697 E.23466
G1 X61.765 Y79.23
G1 X56.365 Y73.83 E.23466
G1 X56.365 Y74.363
G1 X61.765 Y79.763 E.23466
G1 X61.765 Y80.296
G1 X56.365 Y74.896 E.23466
G1 X56.365 Y75.43
G1 X61.765 Y80.83 E.23466
G1 X61.765 Y81.363
G1 X56.365 Y75.963 E.23466
G1 X56.365 Y76.496
G1 X61.765 Y81.896 E.23466
G1 X61.765 Y82.429
G1 X56.365 Y77.029 E.23466
G1 X56.365 Y77.563
G1 X61.765 Y82.963 E.23466
G1 X61.765 Y83.496
G1 X56.365 Y78.096 E.23466
G1 X56.365 Y78.629
G1 X61.765 Y84.029 E.23466
G1 X61.765 Y84.563
G1 X56.365 Y79.162 E.23466
G1 X56.365 Y79.696
G1 X61.765 Y85.096 E.23466
G1 X61.765 Y85.629
G1 X56.365 Y80.229 E.23466
G1 X56.365 Y80.762
G1 X61.765 Y86.162 E.23466
G1 X61.765 Y86.696
G1 X56.365 Y81.296 E.23466
G1 X56.365 Y81.829
G1 X61.765 Y87.229 E.23466
G1 X61.765 Y87.762
G1 X56.365 Y82.362 E.23466
G1 X56.365 Y82.895
G1 X61.765 Y88.295 E.23466
G1 X61.765 Y88.829
G1 X56.365 Y83.429 E.23466
G1 X56.365 Y83.962
G1 X61.765 Y89.362 E.23466
G1 X61.765 Y89.895
G1 X56.365 Y84.495 E.23466
G1 X56.365 Y85.028
G1 X61.765 Y90.428 E.23466
G1 X61.765 Y90.962
G1 X56.365 Y85.562 E.23466
G1 X56.365 Y86.095
G1 X61.765 Y91.495 E.23466
G1 X61.765 Y92.028
G1 X56.365 Y86.628 E.23466
G1 X56.365 Y87.162
G1 X61.765 Y92.562 E.23466
G1 X61.765 Y93.095
G1 X56.365 Y87.695 E.23466
G1 X56.365 Y88.228
G1 X61.765 Y93.628 E.23466
G1 X61.765 Y94.161
G1 X56.365 Y88.761 E.23466
G1 X56.365 Y89.295
G1 X61.765 Y94.695 E.23466
G1 X61.765 Y95.228
G1 X56.365 Y89.828 E.23466
G1 X56.365 Y90.361
G1 X61.765 Y95.761 E.23466
G1 X61.765 Y96.294
G1 X56.365 Y90.894 E.23466
G1 X56.365 Y91.428
G1 X61.765 Y96.828 E.23466
G1 X61.765 Y97.361
G1 X56.365 Y91.961 E.23466
G1 X56.365 Y92.494
G1 X61.765 Y97.894 E.23466
G1 X61.765 Y98.428
G1 X56.365 Y93.028 E.23466
G1 X56.365 Y93.561
G1 X61.765 Y98.961 E.23466
G1 X61.765 Y99.494
G1 X56.365 Y94.094 E.23466
G1 X56.365 Y94.627
G1 X61.765 Y100.027 E.23466
G1 X61.765 Y100.561
G1 X56.365 Y95.161 E.23466
G1 X56.365 Y95.694
G1 X61.765 Y101.094 E.23466
G1 X61.765 Y101.627
G1 X56.365 Y96.227 E.23466
G1 X56.365 Y96.76
G1 X61.765 Y102.16 E.23466
G1 X61.765 Y102.694
G1 X56.365 Y97.294 E.23466
G1 X56.365 Y97.827
G1 X61.765 Y103.227 E.23466
G1 X61.765 Y103.76
G1 X56.365 Y98.36 E.23466
G1 X56.365 Y98.893
G1 X61.765 Y104.294 E.23466
G1 X61.765 Y104.827
G1 X56.365 Y99.427 E.23466
G1 X56.365 Y99.96
G1 X61.765 Y105.36 E.23466
G1 X61.765 Y105.893
G1 X56.365 Y100.493 E.23466
G1 X56.365 Y101.027
G1 X61.765 Y106.427 E.23466
G1 X61.765 Y106.96
G1 X56.365 Y101.56 E.23466
G1 X56.365 Y102.093
G1 X61.765 Y107.493 E.23466
G1 X61.765 Y108.026
G1 X56.365 Y102.626 E.23466
G1 X56.365 Y103.16
G1 X61.765 Y108.56 E.23466
G1 X61.765 Y109.093
G1 X56.365 Y103.693 E.23466
G1 X56.365 Y104.226
G1 X61.765 Y109.626 E.23466
G1 X61.765 Y110.159
G1 X56.365 Y104.759 E.23466
G1 X56.365 Y105.293
G1 X61.765 Y110.693 E.23466
G1 X61.765 Y111.226
G1 X56.365 Y105.826 E.23466
G1 X56.365 Y106.359
G1 X61.765 Y111.759 E.23466
G1 X61.765 Y112.293
G1 X56.365 Y106.893 E.23466
G1 X56.365 Y107.426
G1 X61.765 Y112.826 E.23466
G1 X61.765 Y113.359
G1 X56.365 Y107.959 E.23466
G1 X56.365 Y108.492
G1 X61.765 Y113.892 E.23466
G1 X61.765 Y114.426
G1 X56.365 Y109.026 E.23466
G1 X56.365 Y109.559
G1 X61.765 Y114.959 E.23466
G1 X61.765 Y115.492
G1 X56.365 Y110.092 E.23466
G1 X56.365 Y110.625
G1 X61.765 Y116.025 E.23466
G1 X61.765 Y116.559
G1 X56.365 Y111.159 E.23466
G1 X56.365 Y111.692
G1 X61.765 Y117.092 E.23466
G1 X61.765 Y117.625
G1 X56.365 Y112.225 E.23466
G1 X56.365 Y112.759
G1 X61.765 Y118.159 E.23466
G1 X61.765 Y118.692
G1 X56.365 Y113.292 E.23466
G1 X56.365 Y113.825
G1 X61.765 Y119.225 E.23466
G1 X61.765 Y119.758
G1 X56.365 Y114.358 E.23466
G1 X56.365 Y114.892
G1 X61.765 Y120.292 E.23466
G1 X61.765 Y120.825
G1 X56.365 Y115.425 E.23466
G1 X56.365 Y115.958
G1 X61.765 Y121.358 E.23466
G1 X61.765 Y121.891
G1 X56.365 Y116.491 E.23466
G1 X56.365 Y117.025
G1 X61.765 Y122.425 E.23466
G1 X61.765 Y122.958
G1 X56.365 Y117.558 E.23466
G1 X56.365 Y118.091
G1 X61.765 Y123.491 E.23466
G1 X61.765 Y124.025
G1 X56.365 Y118.624 E.23466
G1 X56.365 Y119.158
G1 X61.765 Y124.558 E.23466
G1 X61.765 Y125.091
G1 X56.365 Y119.691 E.23466
G1 X56.365 Y120.224
G1 X61.765 Y125.624 E.23466
G1 X61.765 Y126.158
G1 X56.365 Y120.758 E.23466
G1 X56.365 Y121.291
G1 X61.765 Y126.691 E.23466
G1 X61.765 Y127.224
G1 X56.365 Y121.824 E.23466
G1 X56.365 Y122.357
G1 X61.765 Y127.757 E.23466
G1 X61.765 Y128.291
G1 X56.365 Y122.891 E.23466
G1 X56.365 Y123.424
G1 X61.765 Y128.824 E.23466
G1 X61.765 Y129.357
G1 X56.365 Y123.957 E.23466
G1 X56.365 Y124.49
G1 X61.765 Y129.89 E.23466
G1 X61.765 Y130.424
G1 X56.365 Y125.024 E.23466
G1 X56.365 Y125.557
G1 X61.765 Y130.957 E.23466
G1 X61.765 Y131.49
G1 X56.365 Y126.09 E.23466
G1 X56.365 Y126.624
G1 X61.765 Y132.024 E.23466
G1 X61.765 Y132.557
G1 X56.365 Y127.157 E.23466
G1 X56.365 Y127.69
G1 X61.765 Y133.09 E.23466
G1 X61.765 Y133.623
G1 X56.365 Y128.223 E.23466
G1 X56.365 Y128.757
G1 X61.765 Y134.157 E.23466
G1 X61.765 Y134.69
G1 X56.365 Y129.29 E.23466
G1 X56.365 Y129.823
G1 X61.765 Y135.223 E.23466
G1 X61.765 Y135.756
G1 X56.365 Y130.356 E.23466
G1 X56.365 Y130.89
G1 X61.765 Y136.29 E.23466
G1 X61.765 Y136.823
G1 X56.365 Y131.423 E.23466
G1 X56.365 Y131.956
G1 X61.765 Y137.356 E.23466
G1 X61.765 Y137.89
G1 X56.365 Y132.49 E.23466
G1 X56.365 Y133.023
G1 X61.765 Y138.423 E.23466
G1 X61.765 Y138.956
G1 X56.365 Y133.556 E.23466
G1 X56.365 Y134.089
G1 X61.765 Y139.489 E.23466
G1 X61.765 Y140.023
G1 X56.365 Y134.623 E.23466
G1 X56.365 Y135.156
G1 X61.765 Y140.556 E.23466
G1 X61.765 Y141.089
G1 X56.365 Y135.689 E.23466
G1 X56.365 Y136.222
G1 X61.765 Y141.622 E.23466
G1 X61.765 Y142.156
G1 X56.365 Y136.756 E.23466
G1 X56.365 Y137.289
G1 X61.765 Y142.689 E.23466
G1 X61.765 Y143.222
G1 X56.365 Y137.822 E.23466
G1 X56.365 Y138.355
G1 X61.765 Y143.756 E.23466
G1 X61.765 Y144.289
G1 X56.365 Y138.889 E.23466
G1 X56.365 Y139.422
G1 X61.765 Y144.822 E.23466
G1 X61.765 Y145.355
G1 X56.365 Y139.955 E.23466
G1 X56.365 Y140.489
G1 X61.765 Y145.889 E.23466
G1 X61.765 Y146.422
G1 X56.365 Y141.022 E.23466
G1 X56.365 Y141.555
G1 X61.765 Y146.955 E.23466
G1 X61.765 Y147.488
G1 X56.365 Y142.088 E.23466
G1 X56.365 Y142.622
G1 X61.765 Y148.022 E.23466
G1 X61.765 Y148.555
G1 X56.365 Y143.155 E.23466
G1 X56.365 Y143.688
G1 X61.765 Y149.088 E.23466
G1 X61.765 Y149.621
G1 X56.365 Y144.221 E.23466
G1 X56.365 Y144.755
G1 X61.765 Y150.155 E.23466
G1 X61.765 Y150.688
G1 X56.365 Y145.288 E.23466
G1 X56.365 Y145.821
G1 X61.765 Y151.221 E.23466
G1 X61.765 Y151.755
G1 X56.365 Y146.355 E.23466
G1 X56.365 Y146.888
G1 X61.765 Y152.288 E.23466
G1 X61.765 Y152.821
G1 X56.365 Y147.421 E.23466
G1 X56.365 Y147.954
G1 X61.765 Y153.354 E.23466
G1 X61.765 Y153.888
G1 X56.365 Y148.488 E.23466
G1 X56.365 Y149.021
G1 X61.765 Y154.421 E.23466
G1 X61.765 Y154.954
G1 X56.365 Y149.554 E.23466
G1 X56.365 Y150.087
G1 X61.765 Y155.487 E.23466
G1 X61.765 Y156.021
G1 X56.365 Y150.621 E.23466
G1 X56.365 Y151.154
G1 X61.765 Y156.554 E.23466
G1 X61.765 Y157.087
G1 X56.365 Y151.687 E.23466
M73 P87 R7
G1 X56.365 Y152.221
G1 X61.765 Y157.621 E.23466
G1 X61.765 Y158.154
G1 X56.365 Y152.754 E.23466
G1 X56.365 Y153.287
G1 X61.765 Y158.687 E.23466
G1 X61.765 Y159.22
G1 X56.365 Y153.82 E.23466
G1 X56.365 Y154.354
G1 X61.765 Y159.754 E.23466
G1 X61.765 Y160.287
G1 X56.365 Y154.887 E.23466
G1 X56.365 Y155.42
G1 X61.765 Y160.82 E.23466
G1 X61.765 Y161.353
G1 X56.365 Y155.953 E.23466
G1 X56.365 Y156.487
G1 X61.765 Y161.887 E.23466
G1 X61.765 Y162.42
G1 X56.365 Y157.02 E.23466
G1 X56.365 Y157.553
G1 X61.765 Y162.953 E.23466
G1 X61.765 Y163.487
G1 X56.365 Y158.086 E.23466
G1 X56.365 Y158.62
G1 X61.765 Y164.02 E.23466
G1 X61.765 Y164.553
G1 X56.365 Y159.153 E.23466
G1 X56.365 Y159.686
G1 X61.765 Y165.086 E.23466
G1 X61.765 Y165.62
G1 X56.365 Y160.22 E.23466
G1 X56.365 Y160.753
G1 X61.765 Y166.153 E.23466
G1 X61.765 Y166.686
G1 X56.365 Y161.286 E.23466
G1 X56.365 Y161.819
G1 X61.765 Y167.219 E.23466
G1 X61.765 Y167.753
G1 X56.365 Y162.353 E.23466
G1 X56.365 Y162.886
G1 X61.765 Y168.286 E.23466
G1 X61.765 Y168.819
G1 X56.365 Y163.419 E.23466
G1 X56.365 Y163.952
G1 X61.765 Y169.352 E.23466
G1 X61.765 Y169.886
G1 X56.365 Y164.486 E.23466
G1 X56.365 Y165.019
G1 X61.765 Y170.419 E.23466
G1 X61.765 Y170.952
G1 X56.365 Y165.552 E.23466
G1 X56.365 Y166.086
G1 X61.765 Y171.486 E.23466
G1 X61.765 Y172.019
G1 X56.365 Y166.619 E.23466
G1 X56.365 Y167.152
G1 X61.765 Y172.552 E.23466
G1 X61.765 Y173.085
G1 X56.365 Y167.685 E.23466
G1 X56.365 Y168.219
G1 X61.765 Y173.619 E.23466
G1 X61.765 Y174.152
G1 X56.365 Y168.752 E.23466
G1 X56.365 Y169.285
G1 X61.765 Y174.685 E.23466
G1 X61.765 Y175.218
G1 X56.365 Y169.818 E.23466
G1 X56.365 Y170.352
G1 X61.765 Y175.752 E.23466
G1 X61.765 Y176.285
G1 X56.365 Y170.885 E.23466
G1 X56.365 Y171.418
G1 X61.765 Y176.818 E.23466
G1 X61.765 Y177.352
G1 X56.365 Y171.952 E.23466
G1 X56.365 Y172.485
G1 X61.765 Y177.885 E.23466
G1 X61.765 Y178.418
G1 X56.365 Y173.018 E.23466
M73 P88 R7
G1 X56.365 Y173.551
G1 X61.765 Y178.951 E.23466
G1 X61.765 Y179.485
G1 X56.365 Y174.085 E.23466
G1 X56.365 Y174.618
G1 X61.765 Y180.018 E.23466
G1 X61.765 Y180.551
G1 X56.365 Y175.151 E.23466
G1 X56.365 Y175.684
G1 X61.765 Y181.084 E.23466
G1 X61.765 Y181.618
G1 X56.365 Y176.218 E.23466
G1 X56.365 Y176.751
G1 X61.765 Y182.151 E.23466
G1 X61.765 Y182.684
G1 X56.365 Y177.284 E.23466
G1 X56.365 Y177.817
G1 X61.765 Y183.218 E.23466
G1 X61.765 Y183.751
G1 X56.365 Y178.351 E.23466
G1 X56.365 Y178.884
G1 X61.765 Y184.284 E.23466
G1 X61.765 Y184.817
G1 X56.365 Y179.417 E.23466
G1 X56.365 Y179.951
G1 X61.765 Y185.351 E.23466
G1 X61.765 Y185.884
G1 X56.365 Y180.484 E.23466
G1 X56.365 Y181.017
G1 X61.765 Y186.417 E.23466
M204 S10000
; WIPE_START
G1 F24000
G1 X60.351 Y185.003 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I-.068 J1.215 P1  F30000
G1 X186.883 Y192.083 Z5.4
G1 Z5
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X65.055 Y70.254 E5.29405
G1 X65.055 Y70.787
G1 X186.35 Y192.083 E5.27088
G1 X185.817 Y192.083
G1 X65.055 Y71.32 E5.2477
G1 X65.055 Y71.854
G1 X185.284 Y192.083 E5.22453
G1 X184.75 Y192.083
G1 X65.055 Y72.387 E5.20136
G1 X65.055 Y72.92
G1 X184.217 Y192.083 E5.17818
G1 X183.684 Y192.083
G1 X175.055 Y183.453 E.37498
G1 X175.055 Y183.987
G1 X183.15 Y192.083 E.35181
G1 X182.617 Y192.083
G1 X175.055 Y184.52 E.32863
G1 X175.055 Y185.053
G1 X182.084 Y192.083 E.30546
G1 X181.551 Y192.083
G1 X175.055 Y185.587 E.28229
G1 X175.055 Y186.12
G1 X181.017 Y192.083 E.25911
G1 X180.484 Y192.083
G1 X174.946 Y186.545 E.24065
G1 X174.413 Y186.545
G1 X179.951 Y192.083 E.24065
G1 X179.418 Y192.083
G1 X173.88 Y186.545 E.24065
G1 X173.346 Y186.545
G1 X178.884 Y192.083 E.24065
G1 X178.351 Y192.083
G1 X172.813 Y186.545 E.24065
G1 X172.28 Y186.545
G1 X177.818 Y192.083 E.24065
G1 X177.285 Y192.083
G1 X171.747 Y186.545 E.24065
G1 X171.213 Y186.545
G1 X176.751 Y192.083 E.24065
G1 X176.218 Y192.083
G1 X170.68 Y186.545 E.24065
G1 X170.147 Y186.545
G1 X175.685 Y192.083 E.24065
G1 X175.151 Y192.083
G1 X169.613 Y186.545 E.24065
G1 X169.08 Y186.545
G1 X174.618 Y192.083 E.24065
G1 X174.085 Y192.083
G1 X168.547 Y186.545 E.24065
G1 X168.014 Y186.545
G1 X173.552 Y192.083 E.24065
G1 X173.018 Y192.083
G1 X167.48 Y186.545 E.24065
G1 X166.947 Y186.545
G1 X172.485 Y192.083 E.24065
M204 S10000
; WIPE_START
G1 F24000
G1 X171.071 Y190.668 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I1.084 J.553 P1  F30000
G1 X174.857 Y183.255 Z5.4
G1 Z5
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X65.055 Y73.453 E4.77142
G1 X65.055 Y73.987
G1 X174.323 Y183.255 E4.74825
G1 X173.79 Y183.255
G1 X65.055 Y74.52 E4.72508
G1 X65.055 Y75.053
G1 X173.257 Y183.255 E4.70191
G1 X172.723 Y183.255
G1 X65.055 Y75.587 E4.67873
G1 X65.055 Y76.12
G1 X172.19 Y183.255 E4.65556
G1 X171.657 Y183.255
G1 X65.055 Y76.653 E4.63239
G1 X65.055 Y77.186
G1 X171.124 Y183.255 E4.60921
G1 X170.59 Y183.255
G1 X65.055 Y77.72 E4.58604
G1 X65.055 Y78.253
G1 X170.057 Y183.255 E4.56287
G1 X169.524 Y183.255
G1 X65.055 Y78.786 E4.53969
G1 X65.055 Y79.319
G1 X168.991 Y183.255 E4.51652
G1 X168.457 Y183.255
G1 X65.055 Y79.853 E4.49335
G1 X65.055 Y80.386
G1 X167.924 Y183.255 E4.47017
G1 X167.391 Y183.255
G1 X65.055 Y80.919 E4.447
G1 X65.055 Y81.453
G1 X166.857 Y183.255 E4.42383
G1 X166.765 Y183.697
G1 X65.055 Y81.986 E4.41983
G1 X65.055 Y82.519
G1 X166.765 Y184.23 E4.41983
G1 X166.765 Y184.763
G1 X65.055 Y83.052 E4.41983
G1 X65.055 Y83.586
G1 X166.765 Y185.296 E4.41983
G1 X166.765 Y185.83
G1 X65.055 Y84.119 E4.41983
G1 X65.055 Y84.652
G1 X166.765 Y186.363 E4.41983
M204 S10000
; WIPE_START
G1 F24000
G1 X165.351 Y184.949 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I-.893 J.826 P1  F30000
G1 X171.952 Y192.083 Z5.4
G1 Z5
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X65.055 Y85.185 E4.6452
G1 X65.055 Y85.719
G1 X171.419 Y192.083 E4.62203
G1 X170.885 Y192.083
G1 X65.055 Y86.252 E4.59885
G1 X65.055 Y86.785
G1 X170.352 Y192.083 E4.57568
G1 X169.819 Y192.083
G1 X65.055 Y87.318 E4.55251
G1 X65.055 Y87.852
G1 X169.285 Y192.083 E4.52933
G1 X168.752 Y192.083
G1 X65.055 Y88.385 E4.50616
G1 X65.055 Y88.918
G1 X168.219 Y192.083 E4.48299
G1 X167.686 Y192.083
G1 X65.055 Y89.452 E4.45982
G1 X65.055 Y89.985
G1 X167.152 Y192.083 E4.43664
G1 X166.619 Y192.083
G1 X65.055 Y90.518 E4.41347
G1 X65.055 Y91.051
G1 X166.086 Y192.083 E4.3903
G1 X165.553 Y192.083
G1 X65.055 Y91.585 E4.36712
G1 X65.055 Y92.118
G1 X165.019 Y192.083 E4.34395
G1 X164.486 Y192.083
G1 X65.055 Y92.651 E4.32078
G1 X65.055 Y93.184
G1 X163.953 Y192.083 E4.2976
G1 X163.419 Y192.083
G1 X65.055 Y93.718 E4.27443
G1 X65.055 Y94.251
G1 X162.886 Y192.083 E4.25126
G1 X162.353 Y192.083
G1 X65.055 Y94.784 E4.22808
G1 X65.055 Y95.318
G1 X161.82 Y192.083 E4.20491
G1 X161.286 Y192.083
G1 X65.055 Y95.851 E4.18174
G1 X65.055 Y96.384
G1 X160.753 Y192.083 E4.15856
G1 X160.22 Y192.083
G1 X65.055 Y96.917 E4.13539
G1 X65.055 Y97.451
G1 X159.687 Y192.083 E4.11222
G1 X159.153 Y192.083
G1 X65.055 Y97.984 E4.08904
G1 X65.055 Y98.517
G1 X158.62 Y192.083 E4.06587
G1 X158.087 Y192.083
G1 X65.055 Y99.05 E4.0427
G1 X65.055 Y99.584
G1 X157.554 Y192.083 E4.01953
G1 X157.02 Y192.083
G1 X65.055 Y100.117 E3.99635
G1 X65.055 Y100.65
G1 X156.487 Y192.083 E3.97318
G1 X155.954 Y192.083
G1 X65.055 Y101.184 E3.95001
G1 X65.055 Y101.717
G1 X155.42 Y192.083 E3.92683
G1 X154.887 Y192.083
G1 X65.055 Y102.25 E3.90366
M73 P89 R7
G1 X65.055 Y102.783
G1 X154.354 Y192.083 E3.88049
G1 X153.821 Y192.083
G1 X65.055 Y103.317 E3.85731
G1 X65.055 Y103.85
G1 X153.287 Y192.083 E3.83414
G1 X152.754 Y192.083
G1 X65.055 Y104.383 E3.81097
G1 X65.055 Y104.916
G1 X152.221 Y192.083 E3.78779
G1 X151.688 Y192.083
G1 X65.055 Y105.45 E3.76462
G1 X65.055 Y105.983
G1 X151.154 Y192.083 E3.74145
G1 X150.621 Y192.083
G1 X65.055 Y106.516 E3.71827
G1 X65.055 Y107.049
G1 X150.088 Y192.083 E3.6951
G1 X149.554 Y192.083
G1 X65.055 Y107.583 E3.67193
G1 X65.055 Y108.116
G1 X149.021 Y192.083 E3.64875
G1 X148.488 Y192.083
G1 X65.055 Y108.649 E3.62558
G1 X65.055 Y109.183
G1 X147.955 Y192.083 E3.60241
G1 X147.421 Y192.083
G1 X65.055 Y109.716 E3.57923
G1 X65.055 Y110.249
G1 X146.888 Y192.083 E3.55606
G1 X146.355 Y192.083
G1 X65.055 Y110.782 E3.53289
G1 X65.055 Y111.316
G1 X145.822 Y192.083 E3.50972
G1 X145.288 Y192.083
G1 X65.055 Y111.849 E3.48654
M73 P89 R6
G1 X65.055 Y112.382
G1 X144.755 Y192.083 E3.46337
G1 X144.222 Y192.083
G1 X65.055 Y112.915 E3.4402
G1 X65.055 Y113.449
G1 X143.689 Y192.083 E3.41702
G1 X143.155 Y192.083
G1 X65.055 Y113.982 E3.39385
G1 X65.055 Y114.515
G1 X142.622 Y192.083 E3.37068
G1 X142.089 Y192.083
G1 X65.055 Y115.049 E3.3475
G1 X65.055 Y115.582
G1 X141.555 Y192.083 E3.32433
G1 X141.022 Y192.083
G1 X65.055 Y116.115 E3.30116
G1 X65.055 Y116.648
G1 X140.489 Y192.083 E3.27798
G1 X139.956 Y192.083
G1 X65.055 Y117.182 E3.25481
G1 X65.055 Y117.715
G1 X139.422 Y192.083 E3.23164
G1 X138.889 Y192.083
G1 X65.055 Y118.248 E3.20846
G1 X65.055 Y118.781
G1 X138.356 Y192.083 E3.18529
G1 X137.823 Y192.083
G1 X65.055 Y119.315 E3.16212
G1 X65.055 Y119.848
G1 X137.289 Y192.083 E3.13894
G1 X136.756 Y192.083
G1 X65.055 Y120.381 E3.11577
G1 X65.055 Y120.915
G1 X136.223 Y192.083 E3.0926
G1 X135.689 Y192.083
G1 X65.055 Y121.448 E3.06943
G1 X65.055 Y121.981
G1 X135.156 Y192.083 E3.04625
G1 X134.623 Y192.083
G1 X65.055 Y122.514 E3.02308
G1 X65.055 Y123.048
G1 X134.09 Y192.083 E2.99991
G1 X133.556 Y192.083
G1 X65.055 Y123.581 E2.97673
G1 X65.055 Y124.114
G1 X133.023 Y192.083 E2.95356
G1 X132.49 Y192.083
G1 X65.055 Y124.647 E2.93039
G1 X65.055 Y125.181
G1 X131.957 Y192.083 E2.90721
G1 X131.423 Y192.083
G1 X65.055 Y125.714 E2.88404
G1 X65.055 Y126.247
G1 X130.89 Y192.083 E2.86087
G1 X130.357 Y192.083
G1 X65.055 Y126.78 E2.83769
G1 X65.055 Y127.314
G1 X129.823 Y192.083 E2.81452
G1 X129.29 Y192.083
G1 X65.055 Y127.847 E2.79135
G1 X65.055 Y128.38
G1 X128.757 Y192.083 E2.76817
G1 X128.224 Y192.083
G1 X65.055 Y128.914 E2.745
G1 X65.055 Y129.447
G1 X127.69 Y192.083 E2.72183
G1 X127.157 Y192.083
G1 X65.055 Y129.98 E2.69865
M73 P90 R6
G1 X65.055 Y130.513
G1 X126.624 Y192.083 E2.67548
G1 X126.091 Y192.083
G1 X65.055 Y131.047 E2.65231
G1 X65.055 Y131.58
G1 X125.557 Y192.083 E2.62913
G1 X125.024 Y192.083
G1 X65.055 Y132.113 E2.60596
G1 X65.055 Y132.646
G1 X124.491 Y192.083 E2.58279
G1 X123.958 Y192.083
G1 X65.055 Y133.18 E2.55962
G1 X65.055 Y133.713
G1 X123.424 Y192.083 E2.53644
G1 X122.891 Y192.083
G1 X65.055 Y134.246 E2.51327
G1 X65.055 Y134.78
G1 X122.358 Y192.083 E2.4901
G1 X121.824 Y192.083
G1 X65.055 Y135.313 E2.46692
G1 X65.055 Y135.846
G1 X121.291 Y192.083 E2.44375
G1 X120.758 Y192.083
G1 X65.055 Y136.379 E2.42058
G1 X65.055 Y136.913
G1 X120.225 Y192.083 E2.3974
G1 X119.691 Y192.083
G1 X65.055 Y137.446 E2.37423
G1 X65.055 Y137.979
G1 X119.158 Y192.083 E2.35106
G1 X118.625 Y192.083
G1 X65.055 Y138.512 E2.32788
G1 X65.055 Y139.046
G1 X118.092 Y192.083 E2.30471
G1 X117.558 Y192.083
G1 X65.055 Y139.579 E2.28154
G1 X65.055 Y140.112
G1 X117.025 Y192.083 E2.25836
G1 X116.492 Y192.083
G1 X65.055 Y140.646 E2.23519
G1 X65.055 Y141.179
G1 X115.958 Y192.083 E2.21202
G1 X115.425 Y192.083
G1 X65.055 Y141.712 E2.18884
G1 X65.055 Y142.245
G1 X114.892 Y192.083 E2.16567
G1 X114.359 Y192.083
G1 X65.055 Y142.779 E2.1425
G1 X65.055 Y143.312
G1 X113.825 Y192.083 E2.11932
G1 X113.292 Y192.083
G1 X65.055 Y143.845 E2.09615
G1 X65.055 Y144.378
G1 X112.759 Y192.083 E2.07298
G1 X112.226 Y192.083
G1 X65.055 Y144.912 E2.04981
G1 X65.055 Y145.445
G1 X111.692 Y192.083 E2.02663
G1 X111.159 Y192.083
G1 X65.055 Y145.978 E2.00346
G1 X65.055 Y146.511
G1 X110.626 Y192.083 E1.98029
G1 X110.092 Y192.083
G1 X65.055 Y147.045 E1.95711
G1 X65.055 Y147.578
G1 X109.559 Y192.083 E1.93394
G1 X109.026 Y192.083
G1 X65.055 Y148.111 E1.91077
G1 X65.055 Y148.645
G1 X108.493 Y192.083 E1.88759
G1 X107.959 Y192.083
G1 X65.055 Y149.178 E1.86442
G1 X65.055 Y149.711
G1 X107.426 Y192.083 E1.84125
G1 X106.893 Y192.083
G1 X65.055 Y150.244 E1.81807
G1 X65.055 Y150.778
G1 X106.36 Y192.083 E1.7949
G1 X105.826 Y192.083
G1 X65.055 Y151.311 E1.77173
G1 X65.055 Y151.844
G1 X105.293 Y192.083 E1.74855
G1 X104.76 Y192.083
G1 X65.055 Y152.377 E1.72538
G1 X65.055 Y152.911
G1 X104.227 Y192.083 E1.70221
G1 X103.693 Y192.083
G1 X65.055 Y153.444 E1.67903
G1 X65.055 Y153.977
G1 X103.16 Y192.083 E1.65586
G1 X102.627 Y192.083
G1 X65.055 Y154.511 E1.63269
G1 X65.055 Y155.044
G1 X102.093 Y192.083 E1.60952
G1 X101.56 Y192.083
G1 X65.055 Y155.577 E1.58634
G1 X65.055 Y156.11
G1 X101.027 Y192.083 E1.56317
G1 X100.494 Y192.083
G1 X65.055 Y156.644 E1.54
G1 X65.055 Y157.177
G1 X99.96 Y192.083 E1.51682
G1 X99.427 Y192.083
G1 X65.055 Y157.71 E1.49365
G1 X65.055 Y158.243
G1 X98.894 Y192.083 E1.47048
G1 X98.361 Y192.083
G1 X65.055 Y158.777 E1.4473
G1 X65.055 Y159.31
G1 X97.827 Y192.083 E1.42413
G1 X97.294 Y192.083
G1 X65.055 Y159.843 E1.40096
G1 X65.055 Y160.377
G1 X96.761 Y192.083 E1.37778
G1 X96.227 Y192.083
G1 X65.055 Y160.91 E1.35461
G1 X65.055 Y161.443
G1 X95.694 Y192.083 E1.33144
G1 X95.161 Y192.083
G1 X65.055 Y161.976 E1.30826
G1 X65.055 Y162.51
G1 X94.628 Y192.083 E1.28509
G1 X94.094 Y192.083
G1 X65.055 Y163.043 E1.26192
G1 X65.055 Y163.576
G1 X93.561 Y192.083 E1.23874
G1 X93.028 Y192.083
G1 X65.055 Y164.109 E1.21557
G1 X65.055 Y164.643
G1 X92.495 Y192.083 E1.1924
G1 X91.961 Y192.083
G1 X65.055 Y165.176 E1.16922
G1 X65.055 Y165.709
G1 X91.428 Y192.083 E1.14605
G1 X90.895 Y192.083
G1 X65.055 Y166.242 E1.12288
G1 X65.055 Y166.776
G1 X90.361 Y192.083 E1.09971
M73 P90 R5
G1 X89.828 Y192.083
G1 X65.055 Y167.309 E1.07653
G1 X65.055 Y167.842
G1 X89.295 Y192.083 E1.05336
G1 X88.762 Y192.083
G1 X65.055 Y168.376 E1.03019
G1 X65.055 Y168.909
G1 X88.228 Y192.083 E1.00701
G1 X87.695 Y192.083
G1 X65.055 Y169.442 E.98384
G1 X65.055 Y169.975
G1 X87.162 Y192.083 E.96067
G1 X86.629 Y192.083
G1 X65.055 Y170.509 E.93749
G1 X65.055 Y171.042
G1 X86.095 Y192.083 E.91432
G1 X85.562 Y192.083
G1 X65.055 Y171.575 E.89115
G1 X65.055 Y172.108
G1 X85.029 Y192.083 E.86797
M73 P91 R5
G1 X84.496 Y192.083
G1 X65.055 Y172.642 E.8448
G1 X65.055 Y173.175
G1 X83.962 Y192.083 E.82163
G1 X83.429 Y192.083
G1 X65.055 Y173.708 E.79845
G1 X65.055 Y174.242
G1 X82.896 Y192.083 E.77528
G1 X82.362 Y192.083
G1 X65.055 Y174.775 E.75211
G1 X65.055 Y175.308
G1 X81.829 Y192.083 E.72893
G1 X81.296 Y192.083
G1 X65.055 Y175.841 E.70576
G1 X65.055 Y176.375
G1 X80.763 Y192.083 E.68259
G1 X80.229 Y192.083
G1 X65.055 Y176.908 E.65942
G1 X65.055 Y177.441
G1 X79.696 Y192.083 E.63624
G1 X79.163 Y192.083
G1 X65.055 Y177.974 E.61307
G1 X65.055 Y178.508
G1 X78.63 Y192.083 E.5899
G1 X78.096 Y192.083
G1 X65.055 Y179.041 E.56672
G1 X65.055 Y179.574
G1 X77.563 Y192.083 E.54355
G1 X77.03 Y192.083
G1 X65.055 Y180.108 E.52038
G1 X65.055 Y180.641
G1 X76.496 Y192.083 E.4972
G1 X75.963 Y192.083
G1 X65.055 Y181.174 E.47403
G1 X65.055 Y181.707
G1 X75.43 Y192.083 E.45086
G1 X74.897 Y192.083
G1 X65.055 Y182.241 E.42768
G1 X65.055 Y182.774
G1 X74.363 Y192.083 E.40451
G1 X73.83 Y192.083
G1 X65.055 Y183.307 E.38134
G1 X65.055 Y183.84
G1 X73.297 Y192.083 E.35816
G1 X72.764 Y192.083
G1 X65.055 Y184.374 E.33499
G1 X65.055 Y184.907
G1 X72.23 Y192.083 E.31182
G1 X71.697 Y192.083
G1 X65.055 Y185.44 E.28864
G1 X65.055 Y185.973
G1 X71.164 Y192.083 E.26547
G1 X70.63 Y192.083
G1 X65.055 Y186.507 E.2423
G1 X64.559 Y186.545
G1 X70.097 Y192.083 E.24065
G1 X69.564 Y192.083
G1 X64.026 Y186.545 E.24065
G1 X63.493 Y186.545
G1 X69.031 Y192.083 E.24065
G1 X68.497 Y192.083
G1 X62.959 Y186.545 E.24065
G1 X62.426 Y186.545
G1 X67.964 Y192.083 E.24065
G1 X67.431 Y192.083
G1 X61.893 Y186.545 E.24065
M204 S10000
; WIPE_START
G1 F24000
G1 X63.307 Y187.959 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I-.918 J.799 P1  F30000
G1 X66.898 Y192.083 Z5.4
G1 Z5
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X56.365 Y181.55 E.45768
G1 X56.365 Y182.084
G1 X66.364 Y192.083 E.4345
G1 X65.831 Y192.083
G1 X56.365 Y182.617 E.41133
G1 X56.365 Y183.15
G1 X65.298 Y192.083 E.38816
G1 X64.765 Y192.083
G1 X56.365 Y183.683 E.36498
G1 X56.365 Y184.217
G1 X64.231 Y192.083 E.34181
G1 X63.698 Y192.083
G1 X56.365 Y184.75 E.31864
G1 X56.365 Y185.283
G1 X63.165 Y192.083 E.29546
G1 X62.631 Y192.083
G1 X56.365 Y185.817 E.27229
G1 X56.365 Y186.35
G1 X62.098 Y192.083 E.24912
G1 X61.565 Y192.083
G1 X56.365 Y186.883 E.22594
G1 X56.365 Y187.416
G1 X61.032 Y192.083 E.20277
G1 X60.498 Y192.083
G1 X56.365 Y187.95 E.1796
G1 X56.365 Y188.483
G1 X59.965 Y192.083 E.15643
G1 X59.432 Y192.083
G1 X56.365 Y189.016 E.13325
G1 X56.365 Y189.549
G1 X58.899 Y192.083 E.11008
G1 X58.365 Y192.083
G1 X56.365 Y190.083 E.08691
G1 X56.365 Y190.616
G1 X57.832 Y192.083 E.06373
G1 X57.299 Y192.083
G1 X56.365 Y191.149 E.04056
G1 X56.365 Y191.683
G1 X56.765 Y192.083 E.01739
M204 S10000
; WIPE_START
G1 F24000
G1 X56.365 Y191.683 E-.21502
G1 X56.365 Y191.149 E-.20264
G1 X57.002 Y191.786 E-.34234
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I.057 J1.216 P1  F30000
G1 X166.877 Y186.615 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.153506
G1 F15000
G3 X166.695 Y186.433 I.048 J-.23 E.00245
G1 X175.157 Y183.351 F30000
; LINE_WIDTH: 0.130938
G1 F15000
G1 X174.959 Y183.153 E.00201
; WIPE_START
G1 F24000
G1 X175.157 Y183.351 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I1.213 J-.093 P1  F30000
G1 X166.767 Y73.343 Z5.4
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.0924207
G1 F15000
G1 X166.65 Y73.46 E.00067
; WIPE_START
G1 F24000
G1 X166.767 Y73.343 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I.038 J-1.216 P1  F30000
G1 X65.157 Y70.152 Z5.4
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.130622
G1 F15000
G1 X64.958 Y69.953 E.00201
G1 X65.14 Y186.421 F30000
; LINE_WIDTH: 0.117686
G1 F15000
G1 X65.069 Y186.302 E.00084
; LINE_WIDTH: 0.109812
G1 X65.052 Y186.309 E.0001
; LINE_WIDTH: 0.0805304
G1 X65.036 Y186.316 E.00006
G1 X61.891 Y186.547 F30000
; LINE_WIDTH: 0.162664
G1 F15000
G1 X61.76 Y186.586 E.00134
G1 X61.724 Y186.55 E.00049
G1 X61.763 Y186.419 E.00134
G1 X64.234 Y70.5 F30000
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X64.61 Y70.876 E.01631
G1 X64.61 Y71.409
G1 X63.701 Y70.5 E.03949
G1 X63.168 Y70.5
G1 X64.61 Y71.942 E.06266
G1 X64.61 Y72.475
G1 X62.635 Y70.5 E.08583
G1 X62.21 Y70.609
G1 X64.61 Y73.009 E.10428
G1 X64.61 Y73.542
G1 X62.21 Y71.142 E.10428
G1 X62.21 Y71.676
G1 X64.61 Y74.075 E.10428
G1 X64.61 Y74.608
G1 X62.21 Y72.209 E.10428
G1 X62.21 Y72.742
G1 X64.61 Y75.142 E.10428
G1 X64.61 Y75.675
G1 X62.21 Y73.275 E.10428
G1 X62.21 Y73.809
G1 X64.61 Y76.208 E.10428
G1 X64.61 Y76.742
G1 X62.21 Y74.342 E.10428
G1 X62.21 Y74.875
G1 X64.61 Y77.275 E.10428
G1 X64.61 Y77.808
G1 X62.21 Y75.408 E.10428
G1 X62.21 Y75.942
G1 X64.61 Y78.341 E.10428
G1 X64.61 Y78.875
G1 X62.21 Y76.475 E.10428
G1 X62.21 Y77.008
G1 X64.61 Y79.408 E.10428
G1 X64.61 Y79.941
G1 X62.21 Y77.542 E.10428
G1 X62.21 Y78.075
G1 X64.61 Y80.474 E.10428
G1 X64.61 Y81.008
G1 X62.21 Y78.608 E.10428
G1 X62.21 Y79.141
G1 X64.61 Y81.541 E.10428
G1 X64.61 Y82.074
G1 X62.21 Y79.675 E.10428
G1 X62.21 Y80.208
G1 X64.61 Y82.608 E.10428
G1 X64.61 Y83.141
G1 X62.21 Y80.741 E.10428
G1 X62.21 Y81.274
G1 X64.61 Y83.674 E.10428
G1 X64.61 Y84.207
G1 X62.21 Y81.808 E.10428
G1 X62.21 Y82.341
G1 X64.61 Y84.741 E.10428
G1 X64.61 Y85.274
G1 X62.21 Y82.874 E.10428
G1 X62.21 Y83.408
G1 X64.61 Y85.807 E.10428
G1 X64.61 Y86.34
G1 X62.21 Y83.941 E.10428
G1 X62.21 Y84.474
G1 X64.61 Y86.874 E.10428
G1 X64.61 Y87.407
G1 X62.21 Y85.007 E.10428
G1 X62.21 Y85.541
G1 X64.61 Y87.94 E.10428
G1 X64.61 Y88.474
G1 X62.21 Y86.074 E.10428
G1 X62.21 Y86.607
G1 X64.61 Y89.007 E.10428
G1 X64.61 Y89.54
G1 X62.21 Y87.14 E.10428
G1 X62.21 Y87.674
G1 X64.61 Y90.073 E.10428
G1 X64.61 Y90.607
G1 X62.21 Y88.207 E.10428
G1 X62.21 Y88.74
G1 X64.61 Y91.14 E.10428
G1 X64.61 Y91.673
G1 X62.21 Y89.273 E.10428
G1 X62.21 Y89.807
G1 X64.61 Y92.206 E.10428
G1 X64.61 Y92.74
G1 X62.21 Y90.34 E.10428
G1 X62.21 Y90.873
G1 X64.61 Y93.273 E.10428
G1 X64.61 Y93.806
G1 X62.21 Y91.407 E.10428
G1 X62.21 Y91.94
G1 X64.61 Y94.339 E.10428
G1 X64.61 Y94.873
G1 X62.21 Y92.473 E.10428
G1 X62.21 Y93.006
G1 X64.61 Y95.406 E.10428
G1 X64.61 Y95.939
G1 X62.21 Y93.54 E.10428
G1 X62.21 Y94.073
G1 X64.61 Y96.473 E.10428
G1 X64.61 Y97.006
G1 X62.21 Y94.606 E.10428
G1 X62.21 Y95.139
G1 X64.61 Y97.539 E.10428
G1 X64.61 Y98.072
G1 X62.21 Y95.673 E.10428
G1 X62.21 Y96.206
G1 X64.61 Y98.606 E.10428
G1 X64.61 Y99.139
G1 X62.21 Y96.739 E.10428
G1 X62.21 Y97.273
G1 X64.61 Y99.672 E.10428
G1 X64.61 Y100.205
G1 X62.21 Y97.806 E.10428
G1 X62.21 Y98.339
G1 X64.61 Y100.739 E.10428
G1 X64.61 Y101.272
G1 X62.21 Y98.872 E.10428
G1 X62.21 Y99.406
G1 X64.61 Y101.805 E.10428
G1 X64.61 Y102.339
G1 X62.21 Y99.939 E.10428
G1 X62.21 Y100.472
G1 X64.61 Y102.872 E.10428
G1 X64.61 Y103.405
G1 X62.21 Y101.005 E.10428
G1 X62.21 Y101.539
G1 X64.61 Y103.938 E.10428
G1 X64.61 Y104.472
G1 X62.21 Y102.072 E.10428
G1 X62.21 Y102.605
G1 X64.61 Y105.005 E.10428
G1 X64.61 Y105.538
G1 X62.21 Y103.139 E.10428
G1 X62.21 Y103.672
G1 X64.61 Y106.071 E.10428
G1 X64.61 Y106.605
G1 X62.21 Y104.205 E.10428
G1 X62.21 Y104.738
G1 X64.61 Y107.138 E.10428
G1 X64.61 Y107.671
G1 X62.21 Y105.272 E.10428
G1 X62.21 Y105.805
G1 X64.61 Y108.204 E.10428
G1 X64.61 Y108.738
G1 X62.21 Y106.338 E.10428
G1 X62.21 Y106.871
G1 X64.61 Y109.271 E.10428
G1 X64.61 Y109.804
G1 X62.21 Y107.405 E.10428
G1 X62.21 Y107.938
G1 X64.61 Y110.338 E.10428
G1 X64.61 Y110.871
G1 X62.21 Y108.471 E.10428
G1 X62.21 Y109.004
G1 X64.61 Y111.404 E.10428
G1 X64.61 Y111.937
G1 X62.21 Y109.538 E.10428
G1 X62.21 Y110.071
G1 X64.61 Y112.471 E.10428
G1 X64.61 Y113.004
G1 X62.21 Y110.604 E.10428
G1 X62.21 Y111.138
G1 X64.61 Y113.537 E.10428
G1 X64.61 Y114.07
G1 X62.21 Y111.671 E.10428
G1 X62.21 Y112.204
G1 X64.61 Y114.604 E.10428
G1 X64.61 Y115.137
G1 X62.21 Y112.737 E.10428
G1 X62.21 Y113.271
G1 X64.61 Y115.67 E.10428
G1 X64.61 Y116.204
G1 X62.21 Y113.804 E.10428
G1 X62.21 Y114.337
G1 X64.61 Y116.737 E.10428
G1 X64.61 Y117.27
G1 X62.21 Y114.87 E.10428
G1 X62.21 Y115.404
G1 X64.61 Y117.803 E.10428
G1 X64.61 Y118.337
G1 X62.21 Y115.937 E.10428
G1 X62.21 Y116.47
G1 X64.61 Y118.87 E.10428
G1 X64.61 Y119.403
G1 X62.21 Y117.004 E.10428
G1 X62.21 Y117.537
G1 X64.61 Y119.936 E.10428
G1 X64.61 Y120.47
G1 X62.21 Y118.07 E.10428
G1 X62.21 Y118.603
G1 X64.61 Y121.003 E.10428
G1 X64.61 Y121.536
G1 X62.21 Y119.137 E.10428
G1 X62.21 Y119.67
G1 X64.61 Y122.07 E.10428
G1 X64.61 Y122.603
G1 X62.21 Y120.203 E.10428
G1 X62.21 Y120.736
G1 X64.61 Y123.136 E.10428
G1 X64.61 Y123.669
G1 X62.21 Y121.27 E.10428
G1 X62.21 Y121.803
G1 X64.61 Y124.203 E.10428
G1 X64.61 Y124.736
G1 X62.21 Y122.336 E.10428
G1 X62.21 Y122.869
G1 X64.61 Y125.269 E.10428
G1 X64.61 Y125.802
G1 X62.21 Y123.403 E.10428
G1 X62.21 Y123.936
G1 X64.61 Y126.336 E.10428
G1 X64.61 Y126.869
G1 X62.21 Y124.469 E.10428
G1 X62.21 Y125.003
G1 X64.61 Y127.402 E.10428
G1 X64.61 Y127.935
G1 X62.21 Y125.536 E.10428
G1 X62.21 Y126.069
G1 X64.61 Y128.469 E.10428
G1 X64.61 Y129.002
G1 X62.21 Y126.602 E.10428
G1 X62.21 Y127.136
G1 X64.61 Y129.535 E.10428
G1 X64.61 Y130.069
G1 X62.21 Y127.669 E.10428
G1 X62.21 Y128.202
G1 X64.61 Y130.602 E.10428
G1 X64.61 Y131.135
G1 X62.21 Y128.735 E.10428
G1 X62.21 Y129.269
G1 X64.61 Y131.668 E.10428
G1 X64.61 Y132.202
G1 X62.21 Y129.802 E.10428
G1 X62.21 Y130.335
G1 X64.61 Y132.735 E.10428
G1 X64.61 Y133.268
G1 X62.21 Y130.869 E.10428
G1 X62.21 Y131.402
G1 X64.61 Y133.801 E.10428
G1 X64.61 Y134.335
G1 X62.21 Y131.935 E.10428
G1 X62.21 Y132.468
G1 X64.61 Y134.868 E.10428
G1 X64.61 Y135.401
G1 X62.21 Y133.002 E.10428
G1 X62.21 Y133.535
G1 X64.61 Y135.935 E.10428
G1 X64.61 Y136.468
G1 X62.21 Y134.068 E.10428
G1 X62.21 Y134.601
G1 X64.61 Y137.001 E.10428
G1 X64.61 Y137.534
G1 X62.21 Y135.135 E.10428
G1 X62.21 Y135.668
G1 X64.61 Y138.068 E.10428
G1 X64.61 Y138.601
G1 X62.21 Y136.201 E.10428
G1 X62.21 Y136.735
G1 X64.61 Y139.134 E.10428
G1 X64.61 Y139.667
G1 X62.21 Y137.268 E.10428
G1 X62.21 Y137.801
G1 X64.61 Y140.201 E.10428
G1 X64.61 Y140.734
G1 X62.21 Y138.334 E.10428
G1 X62.21 Y138.868
G1 X64.61 Y141.267 E.10428
G1 X64.61 Y141.801
G1 X62.21 Y139.401 E.10428
G1 X62.21 Y139.934
G1 X64.61 Y142.334 E.10428
G1 X64.61 Y142.867
G1 X62.21 Y140.467 E.10428
G1 X62.21 Y141.001
G1 X64.61 Y143.4 E.10428
G1 X64.61 Y143.934
G1 X62.21 Y141.534 E.10428
G1 X62.21 Y142.067
G1 X64.61 Y144.467 E.10428
G1 X64.61 Y145
G1 X62.21 Y142.6 E.10428
G1 X62.21 Y143.134
G1 X64.61 Y145.533 E.10428
G1 X64.61 Y146.067
G1 X62.21 Y143.667 E.10428
G1 X62.21 Y144.2
G1 X64.61 Y146.6 E.10428
G1 X64.61 Y147.133
G1 X62.21 Y144.734 E.10428
G1 X62.21 Y145.267
G1 X64.61 Y147.666 E.10428
G1 X64.61 Y148.2
G1 X62.21 Y145.8 E.10428
G1 X62.21 Y146.333
G1 X64.61 Y148.733 E.10428
G1 X64.61 Y149.266
G1 X62.21 Y146.867 E.10428
G1 X62.21 Y147.4
G1 X64.61 Y149.8 E.10428
G1 X64.61 Y150.333
G1 X62.21 Y147.933 E.10428
G1 X62.21 Y148.466
G1 X64.61 Y150.866 E.10428
G1 X64.61 Y151.399
G1 X62.21 Y149 E.10428
G1 X62.21 Y149.533
G1 X64.61 Y151.933 E.10428
G1 X64.61 Y152.466
G1 X62.21 Y150.066 E.10428
G1 X62.21 Y150.6
G1 X64.61 Y152.999 E.10428
G1 X64.61 Y153.532
G1 X62.21 Y151.133 E.10428
G1 X62.21 Y151.666
G1 X64.61 Y154.066 E.10428
G1 X64.61 Y154.599
G1 X62.21 Y152.199 E.10428
G1 X62.21 Y152.733
G1 X64.61 Y155.132 E.10428
G1 X64.61 Y155.666
G1 X62.21 Y153.266 E.10428
G1 X62.21 Y153.799
G1 X64.61 Y156.199 E.10428
G1 X64.61 Y156.732
G1 X62.21 Y154.332 E.10428
G1 X62.21 Y154.866
G1 X64.61 Y157.265 E.10428
G1 X64.61 Y157.799
G1 X62.21 Y155.399 E.10428
G1 X62.21 Y155.932
G1 X64.61 Y158.332 E.10428
G1 X64.61 Y158.865
G1 X62.21 Y156.466 E.10428
G1 X62.21 Y156.999
G1 X64.61 Y159.398 E.10428
G1 X64.61 Y159.932
G1 X62.21 Y157.532 E.10428
G1 X62.21 Y158.065
G1 X64.61 Y160.465 E.10428
G1 X64.61 Y160.998
G1 X62.21 Y158.599 E.10428
G1 X62.21 Y159.132
G1 X64.61 Y161.532 E.10428
G1 X64.61 Y162.065
G1 X62.21 Y159.665 E.10428
G1 X62.21 Y160.198
G1 X64.61 Y162.598 E.10428
G1 X64.61 Y163.131
G1 X62.21 Y160.732 E.10428
G1 X62.21 Y161.265
G1 X64.61 Y163.665 E.10428
G1 X64.61 Y164.198
G1 X62.21 Y161.798 E.10428
G1 X62.21 Y162.331
G1 X64.61 Y164.731 E.10428
G1 X64.61 Y165.264
G1 X62.21 Y162.865 E.10428
G1 X62.21 Y163.398
G1 X64.61 Y165.798 E.10428
G1 X64.61 Y166.331
G1 X62.21 Y163.931 E.10428
G1 X62.21 Y164.465
G1 X64.61 Y166.864 E.10428
G1 X64.61 Y167.397
G1 X62.21 Y164.998 E.10428
G1 X62.21 Y165.531
G1 X64.61 Y167.931 E.10428
G1 X64.61 Y168.464
G1 X62.21 Y166.064 E.10428
G1 X62.21 Y166.598
G1 X64.61 Y168.997 E.10428
G1 X64.61 Y169.531
G1 X62.21 Y167.131 E.10428
G1 X62.21 Y167.664
G1 X64.61 Y170.064 E.10428
G1 X64.61 Y170.597
G1 X62.21 Y168.197 E.10428
G1 X62.21 Y168.731
G1 X64.61 Y171.13 E.10428
G1 X64.61 Y171.664
G1 X62.21 Y169.264 E.10428
G1 X62.21 Y169.797
G1 X64.61 Y172.197 E.10428
G1 X64.61 Y172.73
G1 X62.21 Y170.331 E.10428
G1 X62.21 Y170.864
G1 X64.61 Y173.263 E.10428
G1 X64.61 Y173.797
G1 X62.21 Y171.397 E.10428
G1 X62.21 Y171.93
G1 X64.61 Y174.33 E.10428
G1 X64.61 Y174.863
G1 X62.21 Y172.464 E.10428
G1 X62.21 Y172.997
G1 X64.61 Y175.397 E.10428
G1 X64.61 Y175.93
G1 X62.21 Y173.53 E.10428
G1 X62.21 Y174.063
G1 X64.61 Y176.463 E.10428
G1 X64.61 Y176.996
G1 X62.21 Y174.597 E.10428
G1 X62.21 Y175.13
G1 X64.61 Y177.53 E.10428
G1 X64.61 Y178.063
G1 X62.21 Y175.663 E.10428
G1 X62.21 Y176.197
G1 X64.61 Y178.596 E.10428
G1 X64.61 Y179.129
G1 X62.21 Y176.73 E.10428
G1 X62.21 Y177.263
G1 X64.61 Y179.663 E.10428
G1 X64.61 Y180.196
G1 X62.21 Y177.796 E.10428
G1 X62.21 Y178.33
G1 X64.61 Y180.729 E.10428
G1 X64.61 Y181.263
G1 X62.21 Y178.863 E.10428
G1 X62.21 Y179.396
G1 X64.61 Y181.796 E.10428
G1 X64.61 Y182.329
G1 X62.21 Y179.929 E.10428
G1 X62.21 Y180.463
G1 X64.61 Y182.862 E.10428
G1 X64.61 Y183.396
G1 X62.21 Y180.996 E.10428
G1 X62.21 Y181.529
G1 X64.61 Y183.929 E.10428
G1 X64.61 Y184.462
G1 X62.21 Y182.062 E.10428
G1 X62.21 Y182.596
G1 X64.61 Y184.995 E.10428
G1 X64.61 Y185.529
G1 X62.21 Y183.129 E.10428
G1 X62.21 Y183.662
G1 X64.61 Y186.062 E.10428
G1 X64.114 Y186.1
G1 X62.21 Y184.196 E.08275
G1 X62.21 Y184.729
G1 X63.581 Y186.1 E.05958
G1 X63.048 Y186.1
G1 X62.21 Y185.262 E.0364
M204 S10000
M106 S252.45
; CHANGE_LAYER
; Z_HEIGHT: 5.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X63.048 Y186.1 E-.45018
G1 X63.581 Y186.1 E-.20264
G1 X63.382 Y185.9 E-.10717
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 26/50
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
G3 Z5.4 I.896 J.823 P1  F30000
G1 X166.512 Y73.598 Z5.4
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6992
G1 X166.512 Y69.802 E.12592
G1 X175.308 Y69.802 E.29177
G1 X175.308 Y73.598 E.12592
G1 X166.572 Y73.598 E.28978
G1 X166.12 Y73.99 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6992
G1 X166.12 Y69.41 E.14073
G1 X175.7 Y69.41 E.29437
G1 X175.7 Y73.99 E.14073
G1 X166.18 Y73.99 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X166.154 Y71.99 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I.945 J.767 P1  F30000
G1 X166.86 Y71.12 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6992
G1 X166.86 Y72.749 E.05401
G1 X167.361 Y73.25 E.0235
G1 X169.398 Y73.25 E.06758
G1 X172.498 Y70.15 E.1454
G1 X171.938 Y70.15 E.01857
G1 X174.96 Y73.172 E.14176
G1 X174.96 Y73.25 E.00257
G1 X173.409 Y73.25 E.05144
; WIPE_START
G1 F24000
G1 X174.96 Y73.25 E-.58929
G1 X174.96 Y73.172 E-.02947
G1 X174.697 Y72.909 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I-1.214 J-.09 P1  F30000
G1 X166.512 Y183.002 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6992
M73 P92 R5
G1 X175.308 Y183.002 E.29177
G1 X175.308 Y186.798 E.12592
G1 X166.512 Y186.798 E.29177
G1 X166.512 Y183.062 E.12392
G1 X166.12 Y182.61 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6992
G1 X175.7 Y182.61 E.29437
G1 X175.7 Y187.19 E.14073
G1 X166.12 Y187.19 E.29437
G1 X166.12 Y182.67 E.13889
M204 S10000
; WIPE_START
G1 F24000
G1 X168.12 Y182.657 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I-1.145 J.413 P1  F30000
G1 X168.37 Y183.35 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6992
G1 X169.998 Y183.35 E.05401
G1 X173.098 Y186.45 E.1454
G1 X171.338 Y186.45 E.05838
G1 X174.437 Y183.35 E.1454
G1 X174.96 Y183.35 E.01733
G1 X174.96 Y184.456 E.03668
; WIPE_START
G1 F24000
G1 X174.96 Y183.35 E-.42023
G1 X174.437 Y183.35 E-.19853
G1 X174.174 Y183.613 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I.879 J-.841 P1  F30000
G1 X65.308 Y69.802 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6992
G1 X65.308 Y186.798 E3.88097
G1 X61.512 Y186.798 E.12592
G1 X61.512 Y69.802 E3.88097
G1 X65.248 Y69.802 E.12392
G1 X65.7 Y69.41 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6992
G1 X65.7 Y187.19 E3.61905
G1 X61.12 Y187.19 E.14073
G1 X61.12 Y69.41 E3.61905
G1 X65.64 Y69.41 E.13889
M204 S10000
; WIPE_START
G1 F24000
G1 X65.641 Y71.41 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I.5 J-1.109 P1  F30000
G1 X62.846 Y70.15 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6992
G1 X64.474 Y70.15 E.05401
G1 X64.96 Y70.636 E.02277
G1 X64.96 Y70.225 E.01363
G1 X61.86 Y73.324 E.1454
G1 X61.86 Y75.212 E.06263
G1 X64.96 Y78.312 E.1454
G1 X64.96 Y77.901 E.01363
G1 X61.86 Y81 E.1454
G1 X61.86 Y82.888 E.06263
G1 X64.96 Y85.988 E.1454
G1 X64.96 Y85.577 E.01363
G1 X61.86 Y88.676 E.1454
G1 X61.86 Y90.564 E.06263
G1 X64.96 Y93.664 E.1454
G1 X64.96 Y93.253 E.01363
G1 X61.86 Y96.352 E.1454
G1 X61.86 Y98.24 E.06263
G1 X64.96 Y101.339 E.1454
G1 X64.96 Y100.929 E.01363
G1 X61.86 Y104.028 E.1454
G1 X61.86 Y105.916 E.06263
G1 X64.96 Y109.015 E.1454
G1 X64.96 Y108.605 E.01363
G1 X61.86 Y111.704 E.1454
G1 X61.86 Y113.592 E.06263
G1 X64.96 Y116.691 E.1454
G1 X64.96 Y116.281 E.01363
G1 X61.86 Y119.38 E.1454
G1 X61.86 Y121.268 E.06263
G1 X64.96 Y124.367 E.1454
G1 X64.96 Y123.957 E.01363
G1 X61.86 Y127.056 E.1454
G1 X61.86 Y128.944 E.06263
G1 X64.96 Y132.043 E.1454
G1 X64.96 Y131.633 E.01363
G1 X61.86 Y134.732 E.1454
G1 X61.86 Y136.62 E.06263
G1 X64.96 Y139.719 E.1454
G1 X64.96 Y139.309 E.01363
G1 X61.86 Y142.408 E.1454
G1 X61.86 Y144.296 E.06263
G1 X64.96 Y147.395 E.1454
G1 X64.96 Y146.985 E.01363
G1 X61.86 Y150.084 E.1454
G1 X61.86 Y151.972 E.06263
G1 X64.96 Y155.071 E.1454
G1 X64.96 Y154.66 E.01363
G1 X61.86 Y157.76 E.1454
G1 X61.86 Y159.648 E.06263
G1 X64.96 Y162.747 E.1454
G1 X64.96 Y162.336 E.01363
G1 X61.86 Y165.436 E.1454
G1 X61.86 Y167.324 E.06263
G1 X64.96 Y170.423 E.1454
G1 X64.96 Y170.012 E.01363
G1 X61.86 Y173.112 E.1454
G1 X61.86 Y175 E.06263
G1 X64.96 Y178.099 E.1454
G1 X64.96 Y177.688 E.01363
G1 X61.86 Y180.788 E.1454
G1 X61.86 Y182.676 E.06263
G1 X64.96 Y185.775 E.1454
G1 X64.96 Y185.364 E.01363
G1 X63.874 Y186.45 E.05091
G1 X62.246 Y186.45 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 5.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X63.874 Y186.45 E-.61876
G1 X64.137 Y186.187 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 27/50
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
G3 Z5.6 I.9 J.819 P1  F30000
G1 X166.512 Y73.598 Z5.6
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6991
G1 X166.512 Y69.802 E.12592
G1 X175.308 Y69.802 E.29177
G1 X175.308 Y73.598 E.12592
G1 X166.572 Y73.598 E.28978
G1 X166.12 Y73.99 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6991
G1 X166.12 Y69.41 E.14073
G1 X175.7 Y69.41 E.29437
G1 X175.7 Y73.99 E.14073
G1 X166.18 Y73.99 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X166.154 Y71.99 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I.945 J.767 P1  F30000
G1 X166.86 Y71.12 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6991
G1 X166.86 Y72.749 E.05401
G1 X167.361 Y73.25 E.0235
G1 X169.398 Y73.25 E.06758
G1 X172.498 Y70.15 E.1454
G1 X171.938 Y70.15 E.01857
G1 X174.96 Y73.172 E.14176
G1 X174.96 Y73.25 E.00257
G1 X173.409 Y73.25 E.05144
; WIPE_START
G1 F24000
G1 X174.96 Y73.25 E-.58929
G1 X174.96 Y73.172 E-.02947
G1 X174.697 Y72.909 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I-1.214 J-.09 P1  F30000
G1 X166.512 Y183.002 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6991
G1 X175.308 Y183.002 E.29177
G1 X175.308 Y186.798 E.12592
G1 X166.512 Y186.798 E.29177
G1 X166.512 Y183.062 E.12392
G1 X166.12 Y182.61 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6991
G1 X175.7 Y182.61 E.29437
G1 X175.7 Y187.19 E.14073
G1 X166.12 Y187.19 E.29437
G1 X166.12 Y182.67 E.13889
M204 S10000
; WIPE_START
G1 F24000
G1 X168.12 Y182.657 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I-1.145 J.413 P1  F30000
G1 X168.37 Y183.35 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6991
G1 X169.998 Y183.35 E.05401
G1 X173.098 Y186.45 E.1454
G1 X171.338 Y186.45 E.05838
G1 X174.437 Y183.35 E.1454
G1 X174.96 Y183.35 E.01733
G1 X174.96 Y184.456 E.03668
; WIPE_START
G1 F24000
G1 X174.96 Y183.35 E-.42023
G1 X174.437 Y183.35 E-.19853
G1 X174.174 Y183.613 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I.879 J-.841 P1  F30000
G1 X65.308 Y69.802 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6991
G1 X65.308 Y186.798 E3.88097
G1 X61.512 Y186.798 E.12592
G1 X61.512 Y69.802 E3.88097
G1 X65.248 Y69.802 E.12392
G1 X65.7 Y69.41 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6991
G1 X65.7 Y187.19 E3.61905
G1 X61.12 Y187.19 E.14073
G1 X61.12 Y69.41 E3.61905
G1 X65.64 Y69.41 E.13889
M204 S10000
; WIPE_START
G1 F24000
G1 X65.641 Y71.41 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I.5 J-1.109 P1  F30000
G1 X62.846 Y70.15 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6991
G1 X64.474 Y70.15 E.05401
G1 X64.96 Y70.636 E.02277
G1 X64.96 Y70.225 E.01363
G1 X61.86 Y73.324 E.1454
G1 X61.86 Y75.212 E.06263
G1 X64.96 Y78.312 E.1454
G1 X64.96 Y77.901 E.01363
G1 X61.86 Y81 E.1454
G1 X61.86 Y82.888 E.06263
G1 X64.96 Y85.988 E.1454
G1 X64.96 Y85.577 E.01363
G1 X61.86 Y88.676 E.1454
G1 X61.86 Y90.564 E.06263
G1 X64.96 Y93.664 E.1454
G1 X64.96 Y93.253 E.01363
G1 X61.86 Y96.352 E.1454
G1 X61.86 Y98.24 E.06263
G1 X64.96 Y101.339 E.1454
G1 X64.96 Y100.929 E.01363
G1 X61.86 Y104.028 E.1454
G1 X61.86 Y105.916 E.06263
G1 X64.96 Y109.015 E.1454
G1 X64.96 Y108.605 E.01363
G1 X61.86 Y111.704 E.1454
G1 X61.86 Y113.592 E.06263
G1 X64.96 Y116.691 E.1454
G1 X64.96 Y116.281 E.01363
G1 X61.86 Y119.38 E.1454
G1 X61.86 Y121.268 E.06263
G1 X64.96 Y124.367 E.1454
G1 X64.96 Y123.957 E.01363
G1 X61.86 Y127.056 E.1454
G1 X61.86 Y128.944 E.06263
G1 X64.96 Y132.043 E.1454
G1 X64.96 Y131.633 E.01363
G1 X61.86 Y134.732 E.1454
G1 X61.86 Y136.62 E.06263
G1 X64.96 Y139.719 E.1454
G1 X64.96 Y139.309 E.01363
G1 X61.86 Y142.408 E.1454
G1 X61.86 Y144.296 E.06263
M73 P92 R4
G1 X64.96 Y147.395 E.1454
G1 X64.96 Y146.985 E.01363
G1 X61.86 Y150.084 E.1454
G1 X61.86 Y151.972 E.06263
G1 X64.96 Y155.071 E.1454
G1 X64.96 Y154.66 E.01363
G1 X61.86 Y157.76 E.1454
G1 X61.86 Y159.648 E.06263
G1 X64.96 Y162.747 E.1454
G1 X64.96 Y162.336 E.01363
G1 X61.86 Y165.436 E.1454
G1 X61.86 Y167.324 E.06263
G1 X64.96 Y170.423 E.1454
G1 X64.96 Y170.012 E.01363
G1 X61.86 Y173.112 E.1454
G1 X61.86 Y175 E.06263
G1 X64.96 Y178.099 E.1454
G1 X64.96 Y177.688 E.01363
G1 X61.86 Y180.788 E.1454
G1 X61.86 Y182.676 E.06263
G1 X64.96 Y185.775 E.1454
G1 X64.96 Y185.364 E.01363
G1 X63.874 Y186.45 E.05091
G1 X62.246 Y186.45 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 5.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X63.874 Y186.45 E-.61876
G1 X64.137 Y186.187 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 28/50
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
G3 Z5.8 I.9 J.819 P1  F30000
G1 X166.512 Y73.598 Z5.8
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6991
G1 X166.512 Y69.802 E.12592
G1 X175.308 Y69.802 E.29177
G1 X175.308 Y73.598 E.12592
G1 X166.572 Y73.598 E.28978
G1 X166.12 Y73.99 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6991
G1 X166.12 Y69.41 E.14073
G1 X175.7 Y69.41 E.29437
G1 X175.7 Y73.99 E.14073
G1 X166.18 Y73.99 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X166.154 Y71.99 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I.945 J.767 P1  F30000
G1 X166.86 Y71.12 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6991
G1 X166.86 Y72.749 E.05401
G1 X167.361 Y73.25 E.0235
G1 X169.398 Y73.25 E.06758
G1 X172.498 Y70.15 E.1454
G1 X171.938 Y70.15 E.01857
G1 X174.96 Y73.172 E.14176
G1 X174.96 Y73.25 E.00257
G1 X173.409 Y73.25 E.05144
; WIPE_START
G1 F24000
G1 X174.96 Y73.25 E-.58929
G1 X174.96 Y73.172 E-.02947
G1 X174.697 Y72.909 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I-1.214 J-.09 P1  F30000
G1 X166.512 Y183.002 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6991
G1 X175.308 Y183.002 E.29177
G1 X175.308 Y186.798 E.12592
G1 X166.512 Y186.798 E.29177
G1 X166.512 Y183.062 E.12392
G1 X166.12 Y182.61 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6991
G1 X175.7 Y182.61 E.29437
G1 X175.7 Y187.19 E.14073
G1 X166.12 Y187.19 E.29437
G1 X166.12 Y182.67 E.13889
M204 S10000
; WIPE_START
G1 F24000
G1 X168.12 Y182.657 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I-1.145 J.413 P1  F30000
G1 X168.37 Y183.35 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6991
G1 X169.998 Y183.35 E.05401
G1 X173.098 Y186.45 E.1454
G1 X171.338 Y186.45 E.05838
G1 X174.437 Y183.35 E.1454
G1 X174.96 Y183.35 E.01733
G1 X174.96 Y184.456 E.03668
; WIPE_START
G1 F24000
G1 X174.96 Y183.35 E-.42023
G1 X174.437 Y183.35 E-.19853
G1 X174.174 Y183.613 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I.879 J-.841 P1  F30000
G1 X65.308 Y69.802 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6991
G1 X65.308 Y186.798 E3.88097
G1 X61.512 Y186.798 E.12592
G1 X61.512 Y69.802 E3.88097
G1 X65.248 Y69.802 E.12392
G1 X65.7 Y69.41 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6991
G1 X65.7 Y187.19 E3.61905
G1 X61.12 Y187.19 E.14073
G1 X61.12 Y69.41 E3.61905
G1 X65.64 Y69.41 E.13889
M204 S10000
; WIPE_START
G1 F24000
G1 X65.641 Y71.41 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I.5 J-1.109 P1  F30000
G1 X62.846 Y70.15 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6991
G1 X64.474 Y70.15 E.05401
G1 X64.96 Y70.636 E.02277
G1 X64.96 Y70.225 E.01363
G1 X61.86 Y73.324 E.1454
G1 X61.86 Y75.212 E.06263
G1 X64.96 Y78.312 E.1454
G1 X64.96 Y77.901 E.01363
G1 X61.86 Y81 E.1454
G1 X61.86 Y82.888 E.06263
G1 X64.96 Y85.988 E.1454
G1 X64.96 Y85.577 E.01363
G1 X61.86 Y88.676 E.1454
G1 X61.86 Y90.564 E.06263
G1 X64.96 Y93.664 E.1454
G1 X64.96 Y93.253 E.01363
G1 X61.86 Y96.352 E.1454
G1 X61.86 Y98.24 E.06263
G1 X64.96 Y101.339 E.1454
G1 X64.96 Y100.929 E.01363
G1 X61.86 Y104.028 E.1454
G1 X61.86 Y105.916 E.06263
G1 X64.96 Y109.015 E.1454
G1 X64.96 Y108.605 E.01363
G1 X61.86 Y111.704 E.1454
G1 X61.86 Y113.592 E.06263
G1 X64.96 Y116.691 E.1454
G1 X64.96 Y116.281 E.01363
G1 X61.86 Y119.38 E.1454
G1 X61.86 Y121.268 E.06263
G1 X64.96 Y124.367 E.1454
G1 X64.96 Y123.957 E.01363
G1 X61.86 Y127.056 E.1454
G1 X61.86 Y128.944 E.06263
G1 X64.96 Y132.043 E.1454
G1 X64.96 Y131.633 E.01363
G1 X61.86 Y134.732 E.1454
G1 X61.86 Y136.62 E.06263
G1 X64.96 Y139.719 E.1454
G1 X64.96 Y139.309 E.01363
G1 X61.86 Y142.408 E.1454
G1 X61.86 Y144.296 E.06263
G1 X64.96 Y147.395 E.1454
G1 X64.96 Y146.985 E.01363
G1 X61.86 Y150.084 E.1454
G1 X61.86 Y151.972 E.06263
G1 X64.96 Y155.071 E.1454
G1 X64.96 Y154.66 E.01363
G1 X61.86 Y157.76 E.1454
G1 X61.86 Y159.648 E.06263
G1 X64.96 Y162.747 E.1454
G1 X64.96 Y162.336 E.01363
G1 X61.86 Y165.436 E.1454
G1 X61.86 Y167.324 E.06263
G1 X64.96 Y170.423 E.1454
G1 X64.96 Y170.012 E.01363
G1 X61.86 Y173.112 E.1454
G1 X61.86 Y175 E.06263
G1 X64.96 Y178.099 E.1454
G1 X64.96 Y177.688 E.01363
G1 X61.86 Y180.788 E.1454
G1 X61.86 Y182.676 E.06263
G1 X64.96 Y185.775 E.1454
G1 X64.96 Y185.364 E.01363
G1 X63.874 Y186.45 E.05091
G1 X62.246 Y186.45 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 5.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X63.874 Y186.45 E-.61876
G1 X64.137 Y186.187 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 29/50
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
G3 Z6 I.9 J.819 P1  F30000
G1 X166.512 Y73.598 Z6
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6991
G1 X166.512 Y69.802 E.12592
G1 X175.308 Y69.802 E.29177
G1 X175.308 Y73.598 E.12592
G1 X166.572 Y73.598 E.28978
G1 X166.12 Y73.99 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6991
G1 X166.12 Y69.41 E.14073
G1 X175.7 Y69.41 E.29437
G1 X175.7 Y73.99 E.14073
G1 X166.18 Y73.99 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X166.154 Y71.99 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I.945 J.767 P1  F30000
G1 X166.86 Y71.12 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6991
G1 X166.86 Y72.749 E.05401
G1 X167.361 Y73.25 E.0235
G1 X169.398 Y73.25 E.06758
G1 X172.498 Y70.15 E.1454
G1 X171.938 Y70.15 E.01857
G1 X174.96 Y73.172 E.14176
G1 X174.96 Y73.25 E.00257
G1 X173.409 Y73.25 E.05144
; WIPE_START
G1 F24000
G1 X174.96 Y73.25 E-.58929
G1 X174.96 Y73.172 E-.02947
G1 X174.697 Y72.909 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I-1.214 J-.09 P1  F30000
G1 X166.512 Y183.002 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6991
G1 X175.308 Y183.002 E.29177
G1 X175.308 Y186.798 E.12592
G1 X166.512 Y186.798 E.29177
G1 X166.512 Y183.062 E.12392
G1 X166.12 Y182.61 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6991
G1 X175.7 Y182.61 E.29437
G1 X175.7 Y187.19 E.14073
G1 X166.12 Y187.19 E.29437
G1 X166.12 Y182.67 E.13889
M204 S10000
; WIPE_START
G1 F24000
G1 X168.12 Y182.657 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I-1.145 J.413 P1  F30000
G1 X168.37 Y183.35 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6991
G1 X169.998 Y183.35 E.05401
G1 X173.098 Y186.45 E.1454
G1 X171.338 Y186.45 E.05838
G1 X174.437 Y183.35 E.1454
G1 X174.96 Y183.35 E.01733
G1 X174.96 Y184.456 E.03668
; WIPE_START
G1 F24000
G1 X174.96 Y183.35 E-.42023
G1 X174.437 Y183.35 E-.19853
G1 X174.174 Y183.613 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I.879 J-.841 P1  F30000
G1 X65.308 Y69.802 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6991
G1 X65.308 Y186.798 E3.88097
G1 X61.512 Y186.798 E.12592
G1 X61.512 Y69.802 E3.88097
G1 X65.248 Y69.802 E.12392
G1 X65.7 Y69.41 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6991
G1 X65.7 Y187.19 E3.61905
G1 X61.12 Y187.19 E.14073
G1 X61.12 Y69.41 E3.61905
G1 X65.64 Y69.41 E.13889
M204 S10000
; WIPE_START
G1 F24000
G1 X65.641 Y71.41 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I.5 J-1.109 P1  F30000
G1 X62.846 Y70.15 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6991
G1 X64.474 Y70.15 E.05401
G1 X64.96 Y70.636 E.02277
G1 X64.96 Y70.225 E.01363
G1 X61.86 Y73.324 E.1454
G1 X61.86 Y75.212 E.06263
G1 X64.96 Y78.312 E.1454
G1 X64.96 Y77.901 E.01363
G1 X61.86 Y81 E.1454
G1 X61.86 Y82.888 E.06263
G1 X64.96 Y85.988 E.1454
G1 X64.96 Y85.577 E.01363
G1 X61.86 Y88.676 E.1454
G1 X61.86 Y90.564 E.06263
G1 X64.96 Y93.664 E.1454
G1 X64.96 Y93.253 E.01363
G1 X61.86 Y96.352 E.1454
G1 X61.86 Y98.24 E.06263
G1 X64.96 Y101.339 E.1454
G1 X64.96 Y100.929 E.01363
G1 X61.86 Y104.028 E.1454
G1 X61.86 Y105.916 E.06263
G1 X64.96 Y109.015 E.1454
G1 X64.96 Y108.605 E.01363
G1 X61.86 Y111.704 E.1454
G1 X61.86 Y113.592 E.06263
G1 X64.96 Y116.691 E.1454
G1 X64.96 Y116.281 E.01363
G1 X61.86 Y119.38 E.1454
G1 X61.86 Y121.268 E.06263
G1 X64.96 Y124.367 E.1454
G1 X64.96 Y123.957 E.01363
G1 X61.86 Y127.056 E.1454
G1 X61.86 Y128.944 E.06263
G1 X64.96 Y132.043 E.1454
G1 X64.96 Y131.633 E.01363
G1 X61.86 Y134.732 E.1454
G1 X61.86 Y136.62 E.06263
G1 X64.96 Y139.719 E.1454
G1 X64.96 Y139.309 E.01363
G1 X61.86 Y142.408 E.1454
G1 X61.86 Y144.296 E.06263
G1 X64.96 Y147.395 E.1454
G1 X64.96 Y146.985 E.01363
G1 X61.86 Y150.084 E.1454
G1 X61.86 Y151.972 E.06263
G1 X64.96 Y155.071 E.1454
G1 X64.96 Y154.66 E.01363
G1 X61.86 Y157.76 E.1454
G1 X61.86 Y159.648 E.06263
G1 X64.96 Y162.747 E.1454
G1 X64.96 Y162.336 E.01363
G1 X61.86 Y165.436 E.1454
G1 X61.86 Y167.324 E.06263
G1 X64.96 Y170.423 E.1454
G1 X64.96 Y170.012 E.01363
G1 X61.86 Y173.112 E.1454
G1 X61.86 Y175 E.06263
G1 X64.96 Y178.099 E.1454
G1 X64.96 Y177.688 E.01363
G1 X61.86 Y180.788 E.1454
G1 X61.86 Y182.676 E.06263
G1 X64.96 Y185.775 E.1454
G1 X64.96 Y185.364 E.01363
G1 X63.874 Y186.45 E.05091
G1 X62.246 Y186.45 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X63.874 Y186.45 E-.61876
G1 X64.137 Y186.187 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 30/50
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
G3 Z6.2 I.9 J.819 P1  F30000
G1 X166.512 Y73.598 Z6.2
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6991
G1 X166.512 Y69.802 E.12592
G1 X175.308 Y69.802 E.29177
G1 X175.308 Y73.598 E.12592
G1 X166.572 Y73.598 E.28978
G1 X166.12 Y73.99 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6991
G1 X166.12 Y69.41 E.14073
G1 X175.7 Y69.41 E.29437
G1 X175.7 Y73.99 E.14073
G1 X166.18 Y73.99 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X166.154 Y71.99 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I.945 J.767 P1  F30000
G1 X166.86 Y71.12 Z6.4
G1 Z6
M73 P93 R4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6991
G1 X166.86 Y72.749 E.05401
G1 X167.361 Y73.25 E.0235
G1 X169.398 Y73.25 E.06758
G1 X172.498 Y70.15 E.1454
G1 X171.938 Y70.15 E.01857
G1 X174.96 Y73.172 E.14176
G1 X174.96 Y73.25 E.00257
G1 X173.409 Y73.25 E.05144
; WIPE_START
G1 F24000
G1 X174.96 Y73.25 E-.58929
G1 X174.96 Y73.172 E-.02947
G1 X174.697 Y72.909 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I-1.214 J-.09 P1  F30000
G1 X166.512 Y183.002 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6991
G1 X175.308 Y183.002 E.29177
G1 X175.308 Y186.798 E.12592
G1 X166.512 Y186.798 E.29177
G1 X166.512 Y183.062 E.12392
G1 X166.12 Y182.61 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6991
G1 X175.7 Y182.61 E.29437
G1 X175.7 Y187.19 E.14073
G1 X166.12 Y187.19 E.29437
G1 X166.12 Y182.67 E.13889
M204 S10000
; WIPE_START
G1 F24000
G1 X168.12 Y182.657 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I-1.145 J.413 P1  F30000
G1 X168.37 Y183.35 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6991
G1 X169.998 Y183.35 E.05401
G1 X173.098 Y186.45 E.1454
G1 X171.338 Y186.45 E.05838
G1 X174.437 Y183.35 E.1454
G1 X174.96 Y183.35 E.01733
G1 X174.96 Y184.456 E.03668
; WIPE_START
G1 F24000
G1 X174.96 Y183.35 E-.42023
G1 X174.437 Y183.35 E-.19853
G1 X174.174 Y183.613 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I.879 J-.841 P1  F30000
G1 X65.308 Y69.802 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6991
G1 X65.308 Y186.798 E3.88097
G1 X61.512 Y186.798 E.12592
G1 X61.512 Y69.802 E3.88097
G1 X65.248 Y69.802 E.12392
G1 X65.7 Y69.41 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6991
G1 X65.7 Y187.19 E3.61905
G1 X61.12 Y187.19 E.14073
G1 X61.12 Y69.41 E3.61905
G1 X65.64 Y69.41 E.13889
M204 S10000
; WIPE_START
G1 F24000
G1 X65.641 Y71.41 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I.5 J-1.109 P1  F30000
G1 X62.846 Y70.15 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6991
G1 X64.474 Y70.15 E.05401
G1 X64.96 Y70.636 E.02277
G1 X64.96 Y70.225 E.01363
G1 X61.86 Y73.324 E.1454
G1 X61.86 Y75.212 E.06263
G1 X64.96 Y78.312 E.1454
G1 X64.96 Y77.901 E.01363
G1 X61.86 Y81 E.1454
G1 X61.86 Y82.888 E.06263
G1 X64.96 Y85.988 E.1454
G1 X64.96 Y85.577 E.01363
G1 X61.86 Y88.676 E.1454
G1 X61.86 Y90.564 E.06263
G1 X64.96 Y93.664 E.1454
G1 X64.96 Y93.253 E.01363
G1 X61.86 Y96.352 E.1454
G1 X61.86 Y98.24 E.06263
G1 X64.96 Y101.339 E.1454
G1 X64.96 Y100.929 E.01363
G1 X61.86 Y104.028 E.1454
G1 X61.86 Y105.916 E.06263
G1 X64.96 Y109.015 E.1454
G1 X64.96 Y108.605 E.01363
G1 X61.86 Y111.704 E.1454
G1 X61.86 Y113.592 E.06263
G1 X64.96 Y116.691 E.1454
G1 X64.96 Y116.281 E.01363
G1 X61.86 Y119.38 E.1454
G1 X61.86 Y121.268 E.06263
G1 X64.96 Y124.367 E.1454
G1 X64.96 Y123.957 E.01363
G1 X61.86 Y127.056 E.1454
G1 X61.86 Y128.944 E.06263
G1 X64.96 Y132.043 E.1454
G1 X64.96 Y131.633 E.01363
G1 X61.86 Y134.732 E.1454
G1 X61.86 Y136.62 E.06263
G1 X64.96 Y139.719 E.1454
G1 X64.96 Y139.309 E.01363
G1 X61.86 Y142.408 E.1454
G1 X61.86 Y144.296 E.06263
G1 X64.96 Y147.395 E.1454
G1 X64.96 Y146.985 E.01363
G1 X61.86 Y150.084 E.1454
G1 X61.86 Y151.972 E.06263
G1 X64.96 Y155.071 E.1454
G1 X64.96 Y154.66 E.01363
G1 X61.86 Y157.76 E.1454
G1 X61.86 Y159.648 E.06263
G1 X64.96 Y162.747 E.1454
G1 X64.96 Y162.336 E.01363
G1 X61.86 Y165.436 E.1454
G1 X61.86 Y167.324 E.06263
G1 X64.96 Y170.423 E.1454
G1 X64.96 Y170.012 E.01363
G1 X61.86 Y173.112 E.1454
G1 X61.86 Y175 E.06263
G1 X64.96 Y178.099 E.1454
G1 X64.96 Y177.688 E.01363
G1 X61.86 Y180.788 E.1454
G1 X61.86 Y182.676 E.06263
G1 X64.96 Y185.775 E.1454
G1 X64.96 Y185.364 E.01363
G1 X63.874 Y186.45 E.05091
G1 X62.246 Y186.45 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 6.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X63.874 Y186.45 E-.61876
G1 X64.137 Y186.187 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 31/50
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
G3 Z6.4 I.9 J.819 P1  F30000
G1 X166.512 Y73.598 Z6.4
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6991
G1 X166.512 Y69.802 E.12592
G1 X175.308 Y69.802 E.29177
G1 X175.308 Y73.598 E.12592
G1 X166.572 Y73.598 E.28978
G1 X166.12 Y73.99 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6991
G1 X166.12 Y69.41 E.14073
G1 X175.7 Y69.41 E.29437
G1 X175.7 Y73.99 E.14073
G1 X166.18 Y73.99 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X166.154 Y71.99 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I.945 J.767 P1  F30000
G1 X166.86 Y71.12 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6991
G1 X166.86 Y72.749 E.05401
G1 X167.361 Y73.25 E.0235
G1 X169.398 Y73.25 E.06758
G1 X172.498 Y70.15 E.1454
G1 X171.938 Y70.15 E.01857
G1 X174.96 Y73.172 E.14176
G1 X174.96 Y73.25 E.00257
G1 X173.409 Y73.25 E.05144
; WIPE_START
G1 F24000
G1 X174.96 Y73.25 E-.58929
G1 X174.96 Y73.172 E-.02947
G1 X174.697 Y72.909 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I-1.214 J-.09 P1  F30000
G1 X166.512 Y183.002 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6991
G1 X175.308 Y183.002 E.29177
G1 X175.308 Y186.798 E.12592
G1 X166.512 Y186.798 E.29177
G1 X166.512 Y183.062 E.12392
G1 X166.12 Y182.61 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6991
G1 X175.7 Y182.61 E.29437
G1 X175.7 Y187.19 E.14073
G1 X166.12 Y187.19 E.29437
G1 X166.12 Y182.67 E.13889
M204 S10000
; WIPE_START
G1 F24000
G1 X168.12 Y182.657 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I-1.145 J.413 P1  F30000
G1 X168.37 Y183.35 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6991
G1 X169.998 Y183.35 E.05401
G1 X173.098 Y186.45 E.1454
G1 X171.338 Y186.45 E.05838
G1 X174.437 Y183.35 E.1454
G1 X174.96 Y183.35 E.01733
G1 X174.96 Y184.456 E.03668
; WIPE_START
G1 F24000
G1 X174.96 Y183.35 E-.42023
G1 X174.437 Y183.35 E-.19853
G1 X174.174 Y183.613 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I.879 J-.841 P1  F30000
G1 X65.308 Y69.802 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6991
G1 X65.308 Y186.798 E3.88097
G1 X61.512 Y186.798 E.12592
G1 X61.512 Y69.802 E3.88097
G1 X65.248 Y69.802 E.12392
G1 X65.7 Y69.41 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6991
G1 X65.7 Y187.19 E3.61905
G1 X61.12 Y187.19 E.14073
G1 X61.12 Y69.41 E3.61905
G1 X65.64 Y69.41 E.13889
M204 S10000
; WIPE_START
G1 F24000
G1 X65.641 Y71.41 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I.5 J-1.109 P1  F30000
G1 X62.846 Y70.15 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6991
G1 X64.474 Y70.15 E.05401
G1 X64.96 Y70.636 E.02277
G1 X64.96 Y70.225 E.01363
G1 X61.86 Y73.324 E.1454
G1 X61.86 Y75.212 E.06263
G1 X64.96 Y78.312 E.1454
G1 X64.96 Y77.901 E.01363
G1 X61.86 Y81 E.1454
G1 X61.86 Y82.888 E.06263
G1 X64.96 Y85.988 E.1454
G1 X64.96 Y85.577 E.01363
G1 X61.86 Y88.676 E.1454
G1 X61.86 Y90.564 E.06263
G1 X64.96 Y93.664 E.1454
G1 X64.96 Y93.253 E.01363
G1 X61.86 Y96.352 E.1454
G1 X61.86 Y98.24 E.06263
G1 X64.96 Y101.339 E.1454
G1 X64.96 Y100.929 E.01363
G1 X61.86 Y104.028 E.1454
G1 X61.86 Y105.916 E.06263
G1 X64.96 Y109.015 E.1454
G1 X64.96 Y108.605 E.01363
G1 X61.86 Y111.704 E.1454
G1 X61.86 Y113.592 E.06263
G1 X64.96 Y116.691 E.1454
G1 X64.96 Y116.281 E.01363
G1 X61.86 Y119.38 E.1454
G1 X61.86 Y121.268 E.06263
G1 X64.96 Y124.367 E.1454
G1 X64.96 Y123.957 E.01363
G1 X61.86 Y127.056 E.1454
G1 X61.86 Y128.944 E.06263
G1 X64.96 Y132.043 E.1454
G1 X64.96 Y131.633 E.01363
G1 X61.86 Y134.732 E.1454
G1 X61.86 Y136.62 E.06263
G1 X64.96 Y139.719 E.1454
G1 X64.96 Y139.309 E.01363
G1 X61.86 Y142.408 E.1454
G1 X61.86 Y144.296 E.06263
G1 X64.96 Y147.395 E.1454
G1 X64.96 Y146.985 E.01363
G1 X61.86 Y150.084 E.1454
G1 X61.86 Y151.972 E.06263
G1 X64.96 Y155.071 E.1454
G1 X64.96 Y154.66 E.01363
G1 X61.86 Y157.76 E.1454
G1 X61.86 Y159.648 E.06263
G1 X64.96 Y162.747 E.1454
G1 X64.96 Y162.336 E.01363
G1 X61.86 Y165.436 E.1454
G1 X61.86 Y167.324 E.06263
G1 X64.96 Y170.423 E.1454
G1 X64.96 Y170.012 E.01363
G1 X61.86 Y173.112 E.1454
G1 X61.86 Y175 E.06263
G1 X64.96 Y178.099 E.1454
G1 X64.96 Y177.688 E.01363
G1 X61.86 Y180.788 E.1454
G1 X61.86 Y182.676 E.06263
G1 X64.96 Y185.775 E.1454
G1 X64.96 Y185.364 E.01363
G1 X63.874 Y186.45 E.05091
G1 X62.246 Y186.45 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 6.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X63.874 Y186.45 E-.61876
G1 X64.137 Y186.187 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 32/50
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
G3 Z6.6 I.9 J.819 P1  F30000
G1 X166.512 Y73.598 Z6.6
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6991
G1 X166.512 Y69.802 E.12592
G1 X175.308 Y69.802 E.29177
G1 X175.308 Y73.598 E.12592
G1 X166.572 Y73.598 E.28978
G1 X166.12 Y73.99 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6991
G1 X166.12 Y69.41 E.14073
G1 X175.7 Y69.41 E.29437
G1 X175.7 Y73.99 E.14073
G1 X166.18 Y73.99 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X166.154 Y71.99 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I.945 J.767 P1  F30000
G1 X166.86 Y71.12 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6991
G1 X166.86 Y72.749 E.05401
G1 X167.361 Y73.25 E.0235
G1 X169.398 Y73.25 E.06758
G1 X172.498 Y70.15 E.1454
G1 X171.938 Y70.15 E.01857
G1 X174.96 Y73.172 E.14176
G1 X174.96 Y73.25 E.00257
G1 X173.409 Y73.25 E.05144
; WIPE_START
G1 F24000
G1 X174.96 Y73.25 E-.58929
G1 X174.96 Y73.172 E-.02947
G1 X174.697 Y72.909 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I-1.214 J-.09 P1  F30000
G1 X166.512 Y183.002 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6991
G1 X175.308 Y183.002 E.29177
G1 X175.308 Y186.798 E.12592
G1 X166.512 Y186.798 E.29177
G1 X166.512 Y183.062 E.12392
G1 X166.12 Y182.61 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6991
G1 X175.7 Y182.61 E.29437
G1 X175.7 Y187.19 E.14073
G1 X166.12 Y187.19 E.29437
G1 X166.12 Y182.67 E.13889
M204 S10000
; WIPE_START
G1 F24000
G1 X168.12 Y182.657 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I-1.145 J.413 P1  F30000
G1 X168.37 Y183.35 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6991
G1 X169.998 Y183.35 E.05401
G1 X173.098 Y186.45 E.1454
G1 X171.338 Y186.45 E.05838
G1 X174.437 Y183.35 E.1454
G1 X174.96 Y183.35 E.01733
G1 X174.96 Y184.456 E.03668
; WIPE_START
G1 F24000
G1 X174.96 Y183.35 E-.42023
G1 X174.437 Y183.35 E-.19853
G1 X174.174 Y183.613 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I.879 J-.841 P1  F30000
G1 X65.308 Y69.802 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6991
G1 X65.308 Y186.798 E3.88097
G1 X61.512 Y186.798 E.12592
G1 X61.512 Y69.802 E3.88097
G1 X65.248 Y69.802 E.12392
G1 X65.7 Y69.41 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6991
G1 X65.7 Y187.19 E3.61905
G1 X61.12 Y187.19 E.14073
G1 X61.12 Y69.41 E3.61905
G1 X65.64 Y69.41 E.13889
M204 S10000
; WIPE_START
G1 F24000
G1 X65.641 Y71.41 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I.5 J-1.109 P1  F30000
G1 X62.846 Y70.15 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6991
G1 X64.474 Y70.15 E.05401
G1 X64.96 Y70.636 E.02277
G1 X64.96 Y70.225 E.01363
G1 X61.86 Y73.324 E.1454
G1 X61.86 Y75.212 E.06263
G1 X64.96 Y78.312 E.1454
G1 X64.96 Y77.901 E.01363
G1 X61.86 Y81 E.1454
G1 X61.86 Y82.888 E.06263
G1 X64.96 Y85.988 E.1454
G1 X64.96 Y85.577 E.01363
G1 X61.86 Y88.676 E.1454
G1 X61.86 Y90.564 E.06263
G1 X64.96 Y93.664 E.1454
G1 X64.96 Y93.253 E.01363
G1 X61.86 Y96.352 E.1454
G1 X61.86 Y98.24 E.06263
G1 X64.96 Y101.339 E.1454
G1 X64.96 Y100.929 E.01363
G1 X61.86 Y104.028 E.1454
G1 X61.86 Y105.916 E.06263
G1 X64.96 Y109.015 E.1454
G1 X64.96 Y108.605 E.01363
G1 X61.86 Y111.704 E.1454
G1 X61.86 Y113.592 E.06263
G1 X64.96 Y116.691 E.1454
G1 X64.96 Y116.281 E.01363
G1 X61.86 Y119.38 E.1454
G1 X61.86 Y121.268 E.06263
G1 X64.96 Y124.367 E.1454
G1 X64.96 Y123.957 E.01363
G1 X61.86 Y127.056 E.1454
G1 X61.86 Y128.944 E.06263
G1 X64.96 Y132.043 E.1454
G1 X64.96 Y131.633 E.01363
G1 X61.86 Y134.732 E.1454
G1 X61.86 Y136.62 E.06263
G1 X64.96 Y139.719 E.1454
G1 X64.96 Y139.309 E.01363
G1 X61.86 Y142.408 E.1454
G1 X61.86 Y144.296 E.06263
G1 X64.96 Y147.395 E.1454
G1 X64.96 Y146.985 E.01363
G1 X61.86 Y150.084 E.1454
G1 X61.86 Y151.972 E.06263
G1 X64.96 Y155.071 E.1454
G1 X64.96 Y154.66 E.01363
G1 X61.86 Y157.76 E.1454
G1 X61.86 Y159.648 E.06263
G1 X64.96 Y162.747 E.1454
G1 X64.96 Y162.336 E.01363
G1 X61.86 Y165.436 E.1454
G1 X61.86 Y167.324 E.06263
G1 X64.96 Y170.423 E.1454
G1 X64.96 Y170.012 E.01363
G1 X61.86 Y173.112 E.1454
G1 X61.86 Y175 E.06263
G1 X64.96 Y178.099 E.1454
G1 X64.96 Y177.688 E.01363
G1 X61.86 Y180.788 E.1454
G1 X61.86 Y182.676 E.06263
G1 X64.96 Y185.775 E.1454
G1 X64.96 Y185.364 E.01363
G1 X63.874 Y186.45 E.05091
G1 X62.246 Y186.45 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 6.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X63.874 Y186.45 E-.61876
G1 X64.137 Y186.187 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 33/50
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
G3 Z6.8 I.9 J.819 P1  F30000
G1 X166.512 Y73.598 Z6.8
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6991
G1 X166.512 Y69.802 E.12592
G1 X175.308 Y69.802 E.29177
G1 X175.308 Y73.598 E.12592
G1 X166.572 Y73.598 E.28978
G1 X166.12 Y73.99 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6991
G1 X166.12 Y69.41 E.14073
G1 X175.7 Y69.41 E.29437
G1 X175.7 Y73.99 E.14073
G1 X166.18 Y73.99 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X166.154 Y71.99 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7 I.945 J.767 P1  F30000
G1 X166.86 Y71.12 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6991
G1 X166.86 Y72.749 E.05401
G1 X167.361 Y73.25 E.0235
G1 X169.398 Y73.25 E.06758
G1 X172.498 Y70.15 E.1454
G1 X171.938 Y70.15 E.01857
G1 X174.96 Y73.172 E.14176
G1 X174.96 Y73.25 E.00257
G1 X173.409 Y73.25 E.05144
; WIPE_START
G1 F24000
G1 X174.96 Y73.25 E-.58929
G1 X174.96 Y73.172 E-.02947
G1 X174.697 Y72.909 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7 I-1.214 J-.09 P1  F30000
G1 X166.512 Y183.002 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6991
G1 X175.308 Y183.002 E.29177
G1 X175.308 Y186.798 E.12592
G1 X166.512 Y186.798 E.29177
G1 X166.512 Y183.062 E.12392
G1 X166.12 Y182.61 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6991
G1 X175.7 Y182.61 E.29437
G1 X175.7 Y187.19 E.14073
G1 X166.12 Y187.19 E.29437
G1 X166.12 Y182.67 E.13889
M204 S10000
; WIPE_START
G1 F24000
G1 X168.12 Y182.657 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7 I-1.145 J.413 P1  F30000
G1 X168.37 Y183.35 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6991
G1 X169.998 Y183.35 E.05401
G1 X173.098 Y186.45 E.1454
G1 X171.338 Y186.45 E.05838
G1 X174.437 Y183.35 E.1454
G1 X174.96 Y183.35 E.01733
G1 X174.96 Y184.456 E.03668
; WIPE_START
G1 F24000
G1 X174.96 Y183.35 E-.42023
G1 X174.437 Y183.35 E-.19853
G1 X174.174 Y183.613 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7 I.879 J-.841 P1  F30000
G1 X65.308 Y69.802 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6991
G1 X65.308 Y186.798 E3.88097
G1 X61.512 Y186.798 E.12592
G1 X61.512 Y69.802 E3.88097
G1 X65.248 Y69.802 E.12392
G1 X65.7 Y69.41 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6991
G1 X65.7 Y187.19 E3.61905
G1 X61.12 Y187.19 E.14073
G1 X61.12 Y69.41 E3.61905
G1 X65.64 Y69.41 E.13889
M204 S10000
; WIPE_START
G1 F24000
G1 X65.641 Y71.41 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7 I.5 J-1.109 P1  F30000
G1 X62.846 Y70.15 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6991
G1 X64.474 Y70.15 E.05401
G1 X64.96 Y70.636 E.02277
G1 X64.96 Y70.225 E.01363
G1 X61.86 Y73.324 E.1454
G1 X61.86 Y75.212 E.06263
G1 X64.96 Y78.312 E.1454
G1 X64.96 Y77.901 E.01363
G1 X61.86 Y81 E.1454
G1 X61.86 Y82.888 E.06263
G1 X64.96 Y85.988 E.1454
G1 X64.96 Y85.577 E.01363
G1 X61.86 Y88.676 E.1454
G1 X61.86 Y90.564 E.06263
G1 X64.96 Y93.664 E.1454
G1 X64.96 Y93.253 E.01363
G1 X61.86 Y96.352 E.1454
G1 X61.86 Y98.24 E.06263
G1 X64.96 Y101.339 E.1454
G1 X64.96 Y100.929 E.01363
G1 X61.86 Y104.028 E.1454
G1 X61.86 Y105.916 E.06263
G1 X64.96 Y109.015 E.1454
G1 X64.96 Y108.605 E.01363
G1 X61.86 Y111.704 E.1454
G1 X61.86 Y113.592 E.06263
G1 X64.96 Y116.691 E.1454
G1 X64.96 Y116.281 E.01363
G1 X61.86 Y119.38 E.1454
G1 X61.86 Y121.268 E.06263
G1 X64.96 Y124.367 E.1454
G1 X64.96 Y123.957 E.01363
G1 X61.86 Y127.056 E.1454
G1 X61.86 Y128.944 E.06263
G1 X64.96 Y132.043 E.1454
G1 X64.96 Y131.633 E.01363
G1 X61.86 Y134.732 E.1454
G1 X61.86 Y136.62 E.06263
G1 X64.96 Y139.719 E.1454
G1 X64.96 Y139.309 E.01363
G1 X61.86 Y142.408 E.1454
G1 X61.86 Y144.296 E.06263
M73 P93 R3
G1 X64.96 Y147.395 E.1454
G1 X64.96 Y146.985 E.01363
G1 X61.86 Y150.084 E.1454
G1 X61.86 Y151.972 E.06263
G1 X64.96 Y155.071 E.1454
G1 X64.96 Y154.66 E.01363
G1 X61.86 Y157.76 E.1454
G1 X61.86 Y159.648 E.06263
G1 X64.96 Y162.747 E.1454
G1 X64.96 Y162.336 E.01363
G1 X61.86 Y165.436 E.1454
G1 X61.86 Y167.324 E.06263
G1 X64.96 Y170.423 E.1454
G1 X64.96 Y170.012 E.01363
G1 X61.86 Y173.112 E.1454
G1 X61.86 Y175 E.06263
G1 X64.96 Y178.099 E.1454
G1 X64.96 Y177.688 E.01363
G1 X61.86 Y180.788 E.1454
G1 X61.86 Y182.676 E.06263
G1 X64.96 Y185.775 E.1454
G1 X64.96 Y185.364 E.01363
G1 X63.874 Y186.45 E.05091
G1 X62.246 Y186.45 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 6.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X63.874 Y186.45 E-.61876
G1 X64.137 Y186.187 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 34/50
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
G3 Z7 I.9 J.819 P1  F30000
G1 X166.512 Y73.598 Z7
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6991
M73 P94 R3
G1 X166.512 Y69.802 E.12592
G1 X175.308 Y69.802 E.29177
G1 X175.308 Y73.598 E.12592
G1 X166.572 Y73.598 E.28978
G1 X166.12 Y73.99 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6991
G1 X166.12 Y69.41 E.14073
G1 X175.7 Y69.41 E.29437
G1 X175.7 Y73.99 E.14073
G1 X166.18 Y73.99 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X166.154 Y71.99 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.2 I.945 J.767 P1  F30000
G1 X166.86 Y71.12 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6991
G1 X166.86 Y72.749 E.05401
G1 X167.361 Y73.25 E.0235
G1 X169.398 Y73.25 E.06758
G1 X172.498 Y70.15 E.1454
G1 X171.938 Y70.15 E.01857
G1 X174.96 Y73.172 E.14176
G1 X174.96 Y73.25 E.00257
G1 X173.409 Y73.25 E.05144
; WIPE_START
G1 F24000
G1 X174.96 Y73.25 E-.58929
G1 X174.96 Y73.172 E-.02947
G1 X174.697 Y72.909 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.2 I-1.214 J-.09 P1  F30000
G1 X166.512 Y183.002 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6991
G1 X175.308 Y183.002 E.29177
G1 X175.308 Y186.798 E.12592
G1 X166.512 Y186.798 E.29177
G1 X166.512 Y183.062 E.12392
G1 X166.12 Y182.61 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6991
G1 X175.7 Y182.61 E.29437
G1 X175.7 Y187.19 E.14073
G1 X166.12 Y187.19 E.29437
G1 X166.12 Y182.67 E.13889
M204 S10000
; WIPE_START
G1 F24000
G1 X168.12 Y182.657 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.2 I-1.145 J.413 P1  F30000
G1 X168.37 Y183.35 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6991
G1 X169.998 Y183.35 E.05401
G1 X173.098 Y186.45 E.1454
G1 X171.338 Y186.45 E.05838
G1 X174.437 Y183.35 E.1454
G1 X174.96 Y183.35 E.01733
G1 X174.96 Y184.456 E.03668
; WIPE_START
G1 F24000
G1 X174.96 Y183.35 E-.42023
G1 X174.437 Y183.35 E-.19853
G1 X174.174 Y183.613 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.2 I.879 J-.841 P1  F30000
G1 X65.308 Y69.802 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6991
G1 X65.308 Y186.798 E3.88097
G1 X61.512 Y186.798 E.12592
G1 X61.512 Y69.802 E3.88097
G1 X65.248 Y69.802 E.12392
G1 X65.7 Y69.41 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6991
G1 X65.7 Y187.19 E3.61905
G1 X61.12 Y187.19 E.14073
G1 X61.12 Y69.41 E3.61905
G1 X65.64 Y69.41 E.13889
M204 S10000
; WIPE_START
G1 F24000
G1 X65.641 Y71.41 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.2 I.5 J-1.109 P1  F30000
G1 X62.846 Y70.15 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6991
G1 X64.474 Y70.15 E.05401
G1 X64.96 Y70.636 E.02277
G1 X64.96 Y70.225 E.01363
G1 X61.86 Y73.324 E.1454
G1 X61.86 Y75.212 E.06263
G1 X64.96 Y78.312 E.1454
G1 X64.96 Y77.901 E.01363
G1 X61.86 Y81 E.1454
G1 X61.86 Y82.888 E.06263
G1 X64.96 Y85.988 E.1454
G1 X64.96 Y85.577 E.01363
G1 X61.86 Y88.676 E.1454
G1 X61.86 Y90.564 E.06263
G1 X64.96 Y93.664 E.1454
G1 X64.96 Y93.253 E.01363
G1 X61.86 Y96.352 E.1454
G1 X61.86 Y98.24 E.06263
G1 X64.96 Y101.339 E.1454
G1 X64.96 Y100.929 E.01363
G1 X61.86 Y104.028 E.1454
G1 X61.86 Y105.916 E.06263
G1 X64.96 Y109.015 E.1454
G1 X64.96 Y108.605 E.01363
G1 X61.86 Y111.704 E.1454
G1 X61.86 Y113.592 E.06263
G1 X64.96 Y116.691 E.1454
G1 X64.96 Y116.281 E.01363
G1 X61.86 Y119.38 E.1454
G1 X61.86 Y121.268 E.06263
G1 X64.96 Y124.367 E.1454
G1 X64.96 Y123.957 E.01363
G1 X61.86 Y127.056 E.1454
G1 X61.86 Y128.944 E.06263
G1 X64.96 Y132.043 E.1454
G1 X64.96 Y131.633 E.01363
G1 X61.86 Y134.732 E.1454
G1 X61.86 Y136.62 E.06263
G1 X64.96 Y139.719 E.1454
G1 X64.96 Y139.309 E.01363
G1 X61.86 Y142.408 E.1454
G1 X61.86 Y144.296 E.06263
G1 X64.96 Y147.395 E.1454
G1 X64.96 Y146.985 E.01363
G1 X61.86 Y150.084 E.1454
G1 X61.86 Y151.972 E.06263
G1 X64.96 Y155.071 E.1454
G1 X64.96 Y154.66 E.01363
G1 X61.86 Y157.76 E.1454
G1 X61.86 Y159.648 E.06263
G1 X64.96 Y162.747 E.1454
G1 X64.96 Y162.336 E.01363
G1 X61.86 Y165.436 E.1454
G1 X61.86 Y167.324 E.06263
G1 X64.96 Y170.423 E.1454
G1 X64.96 Y170.012 E.01363
G1 X61.86 Y173.112 E.1454
G1 X61.86 Y175 E.06263
G1 X64.96 Y178.099 E.1454
G1 X64.96 Y177.688 E.01363
G1 X61.86 Y180.788 E.1454
G1 X61.86 Y182.676 E.06263
G1 X64.96 Y185.775 E.1454
G1 X64.96 Y185.364 E.01363
G1 X63.874 Y186.45 E.05091
G1 X62.246 Y186.45 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 7
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X63.874 Y186.45 E-.61876
G1 X64.137 Y186.187 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 35/50
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
G3 Z7.2 I.9 J.819 P1  F30000
G1 X166.512 Y73.598 Z7.2
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6991
G1 X166.512 Y69.802 E.12592
G1 X175.308 Y69.802 E.29177
G1 X175.308 Y73.598 E.12592
G1 X166.572 Y73.598 E.28978
G1 X166.12 Y73.99 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6991
G1 X166.12 Y69.41 E.14073
G1 X175.7 Y69.41 E.29437
G1 X175.7 Y73.99 E.14073
G1 X166.18 Y73.99 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X166.154 Y71.99 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I.945 J.767 P1  F30000
G1 X166.86 Y71.12 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6991
G1 X166.86 Y72.749 E.05401
G1 X167.361 Y73.25 E.0235
G1 X169.398 Y73.25 E.06758
G1 X172.498 Y70.15 E.1454
G1 X171.938 Y70.15 E.01857
G1 X174.96 Y73.172 E.14176
G1 X174.96 Y73.25 E.00257
G1 X173.409 Y73.25 E.05144
; WIPE_START
G1 F24000
G1 X174.96 Y73.25 E-.58929
G1 X174.96 Y73.172 E-.02947
G1 X174.697 Y72.909 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I-1.214 J-.09 P1  F30000
G1 X166.512 Y183.002 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6991
G1 X175.308 Y183.002 E.29177
G1 X175.308 Y186.798 E.12592
G1 X166.512 Y186.798 E.29177
G1 X166.512 Y183.062 E.12392
G1 X166.12 Y182.61 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6991
G1 X175.7 Y182.61 E.29437
G1 X175.7 Y187.19 E.14073
G1 X166.12 Y187.19 E.29437
G1 X166.12 Y182.67 E.13889
M204 S10000
; WIPE_START
G1 F24000
G1 X168.12 Y182.657 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I-1.145 J.413 P1  F30000
G1 X168.37 Y183.35 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6991
G1 X169.998 Y183.35 E.05401
G1 X173.098 Y186.45 E.1454
G1 X171.338 Y186.45 E.05838
G1 X174.437 Y183.35 E.1454
G1 X174.96 Y183.35 E.01733
G1 X174.96 Y184.456 E.03668
; WIPE_START
G1 F24000
G1 X174.96 Y183.35 E-.42023
G1 X174.437 Y183.35 E-.19853
G1 X174.174 Y183.613 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I.879 J-.841 P1  F30000
G1 X65.308 Y69.802 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6991
G1 X65.308 Y186.798 E3.88097
G1 X61.512 Y186.798 E.12592
G1 X61.512 Y69.802 E3.88097
G1 X65.248 Y69.802 E.12392
G1 X65.7 Y69.41 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6991
G1 X65.7 Y187.19 E3.61905
G1 X61.12 Y187.19 E.14073
G1 X61.12 Y69.41 E3.61905
G1 X65.64 Y69.41 E.13889
M204 S10000
; WIPE_START
G1 F24000
G1 X65.641 Y71.41 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I.5 J-1.109 P1  F30000
G1 X62.846 Y70.15 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6991
G1 X64.474 Y70.15 E.05401
G1 X64.96 Y70.636 E.02277
G1 X64.96 Y70.225 E.01363
G1 X61.86 Y73.324 E.1454
G1 X61.86 Y75.212 E.06263
G1 X64.96 Y78.312 E.1454
G1 X64.96 Y77.901 E.01363
G1 X61.86 Y81 E.1454
G1 X61.86 Y82.888 E.06263
G1 X64.96 Y85.988 E.1454
G1 X64.96 Y85.577 E.01363
G1 X61.86 Y88.676 E.1454
G1 X61.86 Y90.564 E.06263
G1 X64.96 Y93.664 E.1454
G1 X64.96 Y93.253 E.01363
G1 X61.86 Y96.352 E.1454
G1 X61.86 Y98.24 E.06263
G1 X64.96 Y101.339 E.1454
G1 X64.96 Y100.929 E.01363
G1 X61.86 Y104.028 E.1454
G1 X61.86 Y105.916 E.06263
G1 X64.96 Y109.015 E.1454
G1 X64.96 Y108.605 E.01363
G1 X61.86 Y111.704 E.1454
G1 X61.86 Y113.592 E.06263
G1 X64.96 Y116.691 E.1454
G1 X64.96 Y116.281 E.01363
G1 X61.86 Y119.38 E.1454
G1 X61.86 Y121.268 E.06263
G1 X64.96 Y124.367 E.1454
G1 X64.96 Y123.957 E.01363
G1 X61.86 Y127.056 E.1454
G1 X61.86 Y128.944 E.06263
G1 X64.96 Y132.043 E.1454
G1 X64.96 Y131.633 E.01363
G1 X61.86 Y134.732 E.1454
G1 X61.86 Y136.62 E.06263
G1 X64.96 Y139.719 E.1454
G1 X64.96 Y139.309 E.01363
G1 X61.86 Y142.408 E.1454
G1 X61.86 Y144.296 E.06263
G1 X64.96 Y147.395 E.1454
G1 X64.96 Y146.985 E.01363
G1 X61.86 Y150.084 E.1454
G1 X61.86 Y151.972 E.06263
G1 X64.96 Y155.071 E.1454
G1 X64.96 Y154.66 E.01363
G1 X61.86 Y157.76 E.1454
G1 X61.86 Y159.648 E.06263
G1 X64.96 Y162.747 E.1454
G1 X64.96 Y162.336 E.01363
G1 X61.86 Y165.436 E.1454
G1 X61.86 Y167.324 E.06263
G1 X64.96 Y170.423 E.1454
G1 X64.96 Y170.012 E.01363
G1 X61.86 Y173.112 E.1454
G1 X61.86 Y175 E.06263
G1 X64.96 Y178.099 E.1454
G1 X64.96 Y177.688 E.01363
G1 X61.86 Y180.788 E.1454
G1 X61.86 Y182.676 E.06263
G1 X64.96 Y185.775 E.1454
G1 X64.96 Y185.364 E.01363
G1 X63.874 Y186.45 E.05091
G1 X62.246 Y186.45 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 7.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X63.874 Y186.45 E-.61876
G1 X64.137 Y186.187 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 36/50
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
G3 Z7.4 I.9 J.819 P1  F30000
G1 X166.512 Y73.598 Z7.4
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6991
G1 X166.512 Y69.802 E.12592
G1 X175.308 Y69.802 E.29177
G1 X175.308 Y73.598 E.12592
G1 X166.572 Y73.598 E.28978
G1 X166.12 Y73.99 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6991
G1 X166.12 Y69.41 E.14073
G1 X175.7 Y69.41 E.29437
G1 X175.7 Y73.99 E.14073
G1 X166.18 Y73.99 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X166.154 Y71.99 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.6 I.945 J.767 P1  F30000
G1 X166.86 Y71.12 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6991
G1 X166.86 Y72.749 E.05401
G1 X167.361 Y73.25 E.0235
G1 X169.398 Y73.25 E.06758
G1 X172.498 Y70.15 E.1454
G1 X171.938 Y70.15 E.01857
G1 X174.96 Y73.172 E.14176
G1 X174.96 Y73.25 E.00257
G1 X173.409 Y73.25 E.05144
; WIPE_START
G1 F24000
G1 X174.96 Y73.25 E-.58929
G1 X174.96 Y73.172 E-.02947
G1 X174.697 Y72.909 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.6 I-1.214 J-.09 P1  F30000
G1 X166.512 Y183.002 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6991
G1 X175.308 Y183.002 E.29177
G1 X175.308 Y186.798 E.12592
G1 X166.512 Y186.798 E.29177
G1 X166.512 Y183.062 E.12392
G1 X166.12 Y182.61 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6991
G1 X175.7 Y182.61 E.29437
G1 X175.7 Y187.19 E.14073
G1 X166.12 Y187.19 E.29437
G1 X166.12 Y182.67 E.13889
M204 S10000
; WIPE_START
G1 F24000
G1 X168.12 Y182.657 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.6 I-1.145 J.413 P1  F30000
G1 X168.37 Y183.35 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6991
G1 X169.998 Y183.35 E.05401
G1 X173.098 Y186.45 E.1454
G1 X171.338 Y186.45 E.05838
G1 X174.437 Y183.35 E.1454
G1 X174.96 Y183.35 E.01733
G1 X174.96 Y184.456 E.03668
; WIPE_START
G1 F24000
G1 X174.96 Y183.35 E-.42023
G1 X174.437 Y183.35 E-.19853
G1 X174.174 Y183.613 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.6 I.879 J-.841 P1  F30000
G1 X65.308 Y69.802 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6991
G1 X65.308 Y186.798 E3.88097
G1 X61.512 Y186.798 E.12592
G1 X61.512 Y69.802 E3.88097
G1 X65.248 Y69.802 E.12392
G1 X65.7 Y69.41 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6991
G1 X65.7 Y187.19 E3.61905
G1 X61.12 Y187.19 E.14073
G1 X61.12 Y69.41 E3.61905
G1 X65.64 Y69.41 E.13889
M204 S10000
; WIPE_START
G1 F24000
G1 X65.641 Y71.41 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.6 I.5 J-1.109 P1  F30000
G1 X62.846 Y70.15 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6991
G1 X64.474 Y70.15 E.05401
G1 X64.96 Y70.636 E.02277
G1 X64.96 Y70.225 E.01363
G1 X61.86 Y73.324 E.1454
G1 X61.86 Y75.212 E.06263
G1 X64.96 Y78.312 E.1454
G1 X64.96 Y77.901 E.01363
G1 X61.86 Y81 E.1454
G1 X61.86 Y82.888 E.06263
G1 X64.96 Y85.988 E.1454
G1 X64.96 Y85.577 E.01363
G1 X61.86 Y88.676 E.1454
G1 X61.86 Y90.564 E.06263
G1 X64.96 Y93.664 E.1454
G1 X64.96 Y93.253 E.01363
G1 X61.86 Y96.352 E.1454
G1 X61.86 Y98.24 E.06263
G1 X64.96 Y101.339 E.1454
G1 X64.96 Y100.929 E.01363
G1 X61.86 Y104.028 E.1454
G1 X61.86 Y105.916 E.06263
G1 X64.96 Y109.015 E.1454
G1 X64.96 Y108.605 E.01363
G1 X61.86 Y111.704 E.1454
G1 X61.86 Y113.592 E.06263
G1 X64.96 Y116.691 E.1454
G1 X64.96 Y116.281 E.01363
G1 X61.86 Y119.38 E.1454
G1 X61.86 Y121.268 E.06263
G1 X64.96 Y124.367 E.1454
G1 X64.96 Y123.957 E.01363
G1 X61.86 Y127.056 E.1454
G1 X61.86 Y128.944 E.06263
G1 X64.96 Y132.043 E.1454
G1 X64.96 Y131.633 E.01363
G1 X61.86 Y134.732 E.1454
G1 X61.86 Y136.62 E.06263
G1 X64.96 Y139.719 E.1454
G1 X64.96 Y139.309 E.01363
G1 X61.86 Y142.408 E.1454
G1 X61.86 Y144.296 E.06263
G1 X64.96 Y147.395 E.1454
G1 X64.96 Y146.985 E.01363
G1 X61.86 Y150.084 E.1454
G1 X61.86 Y151.972 E.06263
G1 X64.96 Y155.071 E.1454
G1 X64.96 Y154.66 E.01363
G1 X61.86 Y157.76 E.1454
G1 X61.86 Y159.648 E.06263
G1 X64.96 Y162.747 E.1454
G1 X64.96 Y162.336 E.01363
G1 X61.86 Y165.436 E.1454
G1 X61.86 Y167.324 E.06263
G1 X64.96 Y170.423 E.1454
G1 X64.96 Y170.012 E.01363
G1 X61.86 Y173.112 E.1454
G1 X61.86 Y175 E.06263
G1 X64.96 Y178.099 E.1454
G1 X64.96 Y177.688 E.01363
G1 X61.86 Y180.788 E.1454
G1 X61.86 Y182.676 E.06263
G1 X64.96 Y185.775 E.1454
G1 X64.96 Y185.364 E.01363
G1 X63.874 Y186.45 E.05091
G1 X62.246 Y186.45 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 7.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X63.874 Y186.45 E-.61876
G1 X64.137 Y186.187 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 37/50
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
G3 Z7.6 I.9 J.819 P1  F30000
G1 X166.512 Y73.598 Z7.6
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6991
G1 X166.512 Y69.802 E.12592
G1 X175.308 Y69.802 E.29177
G1 X175.308 Y73.598 E.12592
G1 X166.572 Y73.598 E.28978
G1 X166.12 Y73.99 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6991
G1 X166.12 Y69.41 E.14073
G1 X175.7 Y69.41 E.29437
G1 X175.7 Y73.99 E.14073
G1 X166.18 Y73.99 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X166.154 Y71.99 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.8 I.945 J.767 P1  F30000
G1 X166.86 Y71.12 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6991
G1 X166.86 Y72.749 E.05401
G1 X167.361 Y73.25 E.0235
G1 X169.398 Y73.25 E.06758
G1 X172.498 Y70.15 E.1454
G1 X171.938 Y70.15 E.01857
G1 X174.96 Y73.172 E.14176
G1 X174.96 Y73.25 E.00257
G1 X173.409 Y73.25 E.05144
; WIPE_START
G1 F24000
G1 X174.96 Y73.25 E-.58929
G1 X174.96 Y73.172 E-.02947
G1 X174.697 Y72.909 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.8 I-1.214 J-.09 P1  F30000
G1 X166.512 Y183.002 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6991
G1 X175.308 Y183.002 E.29177
G1 X175.308 Y186.798 E.12592
G1 X166.512 Y186.798 E.29177
G1 X166.512 Y183.062 E.12392
G1 X166.12 Y182.61 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6991
G1 X175.7 Y182.61 E.29437
G1 X175.7 Y187.19 E.14073
G1 X166.12 Y187.19 E.29437
G1 X166.12 Y182.67 E.13889
M204 S10000
; WIPE_START
G1 F24000
G1 X168.12 Y182.657 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.8 I-1.145 J.413 P1  F30000
G1 X168.37 Y183.35 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6991
G1 X169.998 Y183.35 E.05401
G1 X173.098 Y186.45 E.1454
G1 X171.338 Y186.45 E.05838
G1 X174.437 Y183.35 E.1454
G1 X174.96 Y183.35 E.01733
G1 X174.96 Y184.456 E.03668
; WIPE_START
G1 F24000
G1 X174.96 Y183.35 E-.42023
G1 X174.437 Y183.35 E-.19853
G1 X174.174 Y183.613 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.8 I.879 J-.841 P1  F30000
G1 X65.308 Y69.802 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6991
G1 X65.308 Y186.798 E3.88097
G1 X61.512 Y186.798 E.12592
G1 X61.512 Y69.802 E3.88097
G1 X65.248 Y69.802 E.12392
G1 X65.7 Y69.41 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6991
G1 X65.7 Y187.19 E3.61905
G1 X61.12 Y187.19 E.14073
G1 X61.12 Y69.41 E3.61905
G1 X65.64 Y69.41 E.13889
M204 S10000
; WIPE_START
G1 F24000
G1 X65.641 Y71.41 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.8 I.5 J-1.109 P1  F30000
G1 X62.846 Y70.15 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6991
G1 X64.474 Y70.15 E.05401
G1 X64.96 Y70.636 E.02277
G1 X64.96 Y70.225 E.01363
G1 X61.86 Y73.324 E.1454
G1 X61.86 Y75.212 E.06263
G1 X64.96 Y78.312 E.1454
G1 X64.96 Y77.901 E.01363
G1 X61.86 Y81 E.1454
G1 X61.86 Y82.888 E.06263
G1 X64.96 Y85.988 E.1454
G1 X64.96 Y85.577 E.01363
G1 X61.86 Y88.676 E.1454
G1 X61.86 Y90.564 E.06263
G1 X64.96 Y93.664 E.1454
G1 X64.96 Y93.253 E.01363
G1 X61.86 Y96.352 E.1454
G1 X61.86 Y98.24 E.06263
G1 X64.96 Y101.339 E.1454
G1 X64.96 Y100.929 E.01363
G1 X61.86 Y104.028 E.1454
G1 X61.86 Y105.916 E.06263
G1 X64.96 Y109.015 E.1454
G1 X64.96 Y108.605 E.01363
G1 X61.86 Y111.704 E.1454
G1 X61.86 Y113.592 E.06263
G1 X64.96 Y116.691 E.1454
G1 X64.96 Y116.281 E.01363
G1 X61.86 Y119.38 E.1454
G1 X61.86 Y121.268 E.06263
G1 X64.96 Y124.367 E.1454
G1 X64.96 Y123.957 E.01363
G1 X61.86 Y127.056 E.1454
G1 X61.86 Y128.944 E.06263
G1 X64.96 Y132.043 E.1454
G1 X64.96 Y131.633 E.01363
G1 X61.86 Y134.732 E.1454
G1 X61.86 Y136.62 E.06263
G1 X64.96 Y139.719 E.1454
G1 X64.96 Y139.309 E.01363
G1 X61.86 Y142.408 E.1454
G1 X61.86 Y144.296 E.06263
G1 X64.96 Y147.395 E.1454
G1 X64.96 Y146.985 E.01363
G1 X61.86 Y150.084 E.1454
G1 X61.86 Y151.972 E.06263
G1 X64.96 Y155.071 E.1454
G1 X64.96 Y154.66 E.01363
G1 X61.86 Y157.76 E.1454
G1 X61.86 Y159.648 E.06263
G1 X64.96 Y162.747 E.1454
G1 X64.96 Y162.336 E.01363
G1 X61.86 Y165.436 E.1454
G1 X61.86 Y167.324 E.06263
G1 X64.96 Y170.423 E.1454
G1 X64.96 Y170.012 E.01363
G1 X61.86 Y173.112 E.1454
G1 X61.86 Y175 E.06263
M73 P95 R3
G1 X64.96 Y178.099 E.1454
G1 X64.96 Y177.688 E.01363
G1 X61.86 Y180.788 E.1454
G1 X61.86 Y182.676 E.06263
G1 X64.96 Y185.775 E.1454
G1 X64.96 Y185.364 E.01363
G1 X63.874 Y186.45 E.05091
G1 X62.246 Y186.45 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 7.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X63.874 Y186.45 E-.61876
G1 X64.137 Y186.187 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 38/50
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
G3 Z7.8 I.9 J.819 P1  F30000
G1 X166.512 Y73.598 Z7.8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6991
G1 X166.512 Y69.802 E.12592
G1 X175.308 Y69.802 E.29177
G1 X175.308 Y73.598 E.12592
G1 X166.572 Y73.598 E.28978
G1 X166.12 Y73.99 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6991
G1 X166.12 Y69.41 E.14073
G1 X175.7 Y69.41 E.29437
G1 X175.7 Y73.99 E.14073
G1 X166.18 Y73.99 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X166.154 Y71.99 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8 I.945 J.767 P1  F30000
G1 X166.86 Y71.12 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6991
G1 X166.86 Y72.749 E.05401
G1 X167.361 Y73.25 E.0235
G1 X169.398 Y73.25 E.06758
G1 X172.498 Y70.15 E.1454
G1 X171.938 Y70.15 E.01857
G1 X174.96 Y73.172 E.14176
G1 X174.96 Y73.25 E.00257
G1 X173.409 Y73.25 E.05144
; WIPE_START
G1 F24000
G1 X174.96 Y73.25 E-.58929
G1 X174.96 Y73.172 E-.02947
G1 X174.697 Y72.909 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8 I-1.214 J-.09 P1  F30000
G1 X166.512 Y183.002 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6991
G1 X175.308 Y183.002 E.29177
G1 X175.308 Y186.798 E.12592
G1 X166.512 Y186.798 E.29177
G1 X166.512 Y183.062 E.12392
G1 X166.12 Y182.61 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6991
G1 X175.7 Y182.61 E.29437
G1 X175.7 Y187.19 E.14073
G1 X166.12 Y187.19 E.29437
G1 X166.12 Y182.67 E.13889
M204 S10000
; WIPE_START
G1 F24000
G1 X168.12 Y182.657 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8 I-1.145 J.413 P1  F30000
G1 X168.37 Y183.35 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6991
G1 X169.998 Y183.35 E.05401
G1 X173.098 Y186.45 E.1454
G1 X171.338 Y186.45 E.05838
G1 X174.437 Y183.35 E.1454
G1 X174.96 Y183.35 E.01733
G1 X174.96 Y184.456 E.03668
; WIPE_START
G1 F24000
G1 X174.96 Y183.35 E-.42023
G1 X174.437 Y183.35 E-.19853
G1 X174.174 Y183.613 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8 I.879 J-.841 P1  F30000
G1 X65.308 Y69.802 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6991
G1 X65.308 Y186.798 E3.88097
G1 X61.512 Y186.798 E.12592
G1 X61.512 Y69.802 E3.88097
G1 X65.248 Y69.802 E.12392
G1 X65.7 Y69.41 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6991
G1 X65.7 Y187.19 E3.61905
G1 X61.12 Y187.19 E.14073
G1 X61.12 Y69.41 E3.61905
G1 X65.64 Y69.41 E.13889
M204 S10000
; WIPE_START
G1 F24000
G1 X65.641 Y71.41 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8 I.5 J-1.109 P1  F30000
G1 X62.846 Y70.15 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6991
G1 X64.474 Y70.15 E.05401
G1 X64.96 Y70.636 E.02277
G1 X64.96 Y70.225 E.01363
G1 X61.86 Y73.324 E.1454
G1 X61.86 Y75.212 E.06263
G1 X64.96 Y78.312 E.1454
G1 X64.96 Y77.901 E.01363
G1 X61.86 Y81 E.1454
G1 X61.86 Y82.888 E.06263
G1 X64.96 Y85.988 E.1454
G1 X64.96 Y85.577 E.01363
G1 X61.86 Y88.676 E.1454
G1 X61.86 Y90.564 E.06263
G1 X64.96 Y93.664 E.1454
G1 X64.96 Y93.253 E.01363
G1 X61.86 Y96.352 E.1454
G1 X61.86 Y98.24 E.06263
G1 X64.96 Y101.339 E.1454
G1 X64.96 Y100.929 E.01363
G1 X61.86 Y104.028 E.1454
G1 X61.86 Y105.916 E.06263
G1 X64.96 Y109.015 E.1454
G1 X64.96 Y108.605 E.01363
G1 X61.86 Y111.704 E.1454
G1 X61.86 Y113.592 E.06263
G1 X64.96 Y116.691 E.1454
G1 X64.96 Y116.281 E.01363
G1 X61.86 Y119.38 E.1454
G1 X61.86 Y121.268 E.06263
G1 X64.96 Y124.367 E.1454
G1 X64.96 Y123.957 E.01363
G1 X61.86 Y127.056 E.1454
G1 X61.86 Y128.944 E.06263
G1 X64.96 Y132.043 E.1454
G1 X64.96 Y131.633 E.01363
G1 X61.86 Y134.732 E.1454
G1 X61.86 Y136.62 E.06263
G1 X64.96 Y139.719 E.1454
G1 X64.96 Y139.309 E.01363
G1 X61.86 Y142.408 E.1454
G1 X61.86 Y144.296 E.06263
G1 X64.96 Y147.395 E.1454
G1 X64.96 Y146.985 E.01363
G1 X61.86 Y150.084 E.1454
G1 X61.86 Y151.972 E.06263
G1 X64.96 Y155.071 E.1454
G1 X64.96 Y154.66 E.01363
G1 X61.86 Y157.76 E.1454
G1 X61.86 Y159.648 E.06263
G1 X64.96 Y162.747 E.1454
G1 X64.96 Y162.336 E.01363
G1 X61.86 Y165.436 E.1454
G1 X61.86 Y167.324 E.06263
G1 X64.96 Y170.423 E.1454
G1 X64.96 Y170.012 E.01363
G1 X61.86 Y173.112 E.1454
G1 X61.86 Y175 E.06263
G1 X64.96 Y178.099 E.1454
G1 X64.96 Y177.688 E.01363
G1 X61.86 Y180.788 E.1454
G1 X61.86 Y182.676 E.06263
G1 X64.96 Y185.775 E.1454
G1 X64.96 Y185.364 E.01363
G1 X63.874 Y186.45 E.05091
G1 X62.246 Y186.45 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 7.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X63.874 Y186.45 E-.61876
G1 X64.137 Y186.187 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 39/50
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
G3 Z8 I.9 J.819 P1  F30000
G1 X166.512 Y73.598 Z8
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6991
G1 X166.512 Y69.802 E.12592
G1 X175.308 Y69.802 E.29177
G1 X175.308 Y73.598 E.12592
G1 X166.572 Y73.598 E.28978
G1 X166.12 Y73.99 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6991
G1 X166.12 Y69.41 E.14073
G1 X175.7 Y69.41 E.29437
G1 X175.7 Y73.99 E.14073
G1 X166.18 Y73.99 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X166.154 Y71.99 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.2 I.945 J.767 P1  F30000
G1 X166.86 Y71.12 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6991
G1 X166.86 Y72.749 E.05401
G1 X167.361 Y73.25 E.0235
G1 X169.398 Y73.25 E.06758
G1 X172.498 Y70.15 E.1454
G1 X171.938 Y70.15 E.01857
G1 X174.96 Y73.172 E.14176
G1 X174.96 Y73.25 E.00257
G1 X173.409 Y73.25 E.05144
; WIPE_START
G1 F24000
G1 X174.96 Y73.25 E-.58929
G1 X174.96 Y73.172 E-.02947
G1 X174.697 Y72.909 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.2 I-1.214 J-.09 P1  F30000
G1 X166.512 Y183.002 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6991
G1 X175.308 Y183.002 E.29177
G1 X175.308 Y186.798 E.12592
G1 X166.512 Y186.798 E.29177
G1 X166.512 Y183.062 E.12392
G1 X166.12 Y182.61 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6991
G1 X175.7 Y182.61 E.29437
G1 X175.7 Y187.19 E.14073
G1 X166.12 Y187.19 E.29437
G1 X166.12 Y182.67 E.13889
M204 S10000
; WIPE_START
G1 F24000
G1 X168.12 Y182.657 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.2 I-1.145 J.413 P1  F30000
G1 X168.37 Y183.35 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6991
G1 X169.998 Y183.35 E.05401
G1 X173.098 Y186.45 E.1454
G1 X171.338 Y186.45 E.05838
G1 X174.437 Y183.35 E.1454
G1 X174.96 Y183.35 E.01733
G1 X174.96 Y184.456 E.03668
; WIPE_START
G1 F24000
G1 X174.96 Y183.35 E-.42023
G1 X174.437 Y183.35 E-.19853
G1 X174.174 Y183.613 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.2 I.879 J-.841 P1  F30000
G1 X65.308 Y69.802 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6991
G1 X65.308 Y186.798 E3.88097
G1 X61.512 Y186.798 E.12592
G1 X61.512 Y69.802 E3.88097
G1 X65.248 Y69.802 E.12392
G1 X65.7 Y69.41 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6991
G1 X65.7 Y187.19 E3.61905
G1 X61.12 Y187.19 E.14073
G1 X61.12 Y69.41 E3.61905
G1 X65.64 Y69.41 E.13889
M204 S10000
; WIPE_START
G1 F24000
G1 X65.641 Y71.41 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.2 I.5 J-1.109 P1  F30000
G1 X62.846 Y70.15 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6991
G1 X64.474 Y70.15 E.05401
G1 X64.96 Y70.636 E.02277
G1 X64.96 Y70.225 E.01363
G1 X61.86 Y73.324 E.1454
G1 X61.86 Y75.212 E.06263
G1 X64.96 Y78.312 E.1454
G1 X64.96 Y77.901 E.01363
G1 X61.86 Y81 E.1454
G1 X61.86 Y82.888 E.06263
G1 X64.96 Y85.988 E.1454
G1 X64.96 Y85.577 E.01363
G1 X61.86 Y88.676 E.1454
G1 X61.86 Y90.564 E.06263
G1 X64.96 Y93.664 E.1454
G1 X64.96 Y93.253 E.01363
G1 X61.86 Y96.352 E.1454
G1 X61.86 Y98.24 E.06263
G1 X64.96 Y101.339 E.1454
G1 X64.96 Y100.929 E.01363
G1 X61.86 Y104.028 E.1454
G1 X61.86 Y105.916 E.06263
G1 X64.96 Y109.015 E.1454
G1 X64.96 Y108.605 E.01363
G1 X61.86 Y111.704 E.1454
G1 X61.86 Y113.592 E.06263
G1 X64.96 Y116.691 E.1454
G1 X64.96 Y116.281 E.01363
G1 X61.86 Y119.38 E.1454
G1 X61.86 Y121.268 E.06263
G1 X64.96 Y124.367 E.1454
G1 X64.96 Y123.957 E.01363
G1 X61.86 Y127.056 E.1454
G1 X61.86 Y128.944 E.06263
G1 X64.96 Y132.043 E.1454
G1 X64.96 Y131.633 E.01363
G1 X61.86 Y134.732 E.1454
G1 X61.86 Y136.62 E.06263
G1 X64.96 Y139.719 E.1454
G1 X64.96 Y139.309 E.01363
G1 X61.86 Y142.408 E.1454
G1 X61.86 Y144.296 E.06263
M73 P95 R2
G1 X64.96 Y147.395 E.1454
G1 X64.96 Y146.985 E.01363
G1 X61.86 Y150.084 E.1454
G1 X61.86 Y151.972 E.06263
G1 X64.96 Y155.071 E.1454
G1 X64.96 Y154.66 E.01363
G1 X61.86 Y157.76 E.1454
G1 X61.86 Y159.648 E.06263
G1 X64.96 Y162.747 E.1454
G1 X64.96 Y162.336 E.01363
G1 X61.86 Y165.436 E.1454
G1 X61.86 Y167.324 E.06263
G1 X64.96 Y170.423 E.1454
G1 X64.96 Y170.012 E.01363
G1 X61.86 Y173.112 E.1454
G1 X61.86 Y175 E.06263
G1 X64.96 Y178.099 E.1454
G1 X64.96 Y177.688 E.01363
G1 X61.86 Y180.788 E.1454
G1 X61.86 Y182.676 E.06263
G1 X64.96 Y185.775 E.1454
G1 X64.96 Y185.364 E.01363
G1 X63.874 Y186.45 E.05091
G1 X62.246 Y186.45 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X63.874 Y186.45 E-.61876
G1 X64.137 Y186.187 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 40/50
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
G3 Z8.2 I.9 J.819 P1  F30000
G1 X166.512 Y73.598 Z8.2
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6991
G1 X166.512 Y69.802 E.12592
G1 X175.308 Y69.802 E.29177
G1 X175.308 Y73.598 E.12592
G1 X166.572 Y73.598 E.28978
G1 X166.12 Y73.99 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6991
G1 X166.12 Y69.41 E.14073
G1 X175.7 Y69.41 E.29437
G1 X175.7 Y73.99 E.14073
G1 X166.18 Y73.99 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X166.154 Y71.99 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.4 I.945 J.767 P1  F30000
G1 X166.86 Y71.12 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6991
G1 X166.86 Y72.749 E.05401
G1 X167.361 Y73.25 E.0235
G1 X169.398 Y73.25 E.06758
G1 X172.498 Y70.15 E.1454
G1 X171.938 Y70.15 E.01857
G1 X174.96 Y73.172 E.14176
G1 X174.96 Y73.25 E.00257
G1 X173.409 Y73.25 E.05144
; WIPE_START
G1 F24000
G1 X174.96 Y73.25 E-.58929
G1 X174.96 Y73.172 E-.02947
G1 X174.697 Y72.909 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.4 I-1.214 J-.09 P1  F30000
G1 X166.512 Y183.002 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6991
G1 X175.308 Y183.002 E.29177
G1 X175.308 Y186.798 E.12592
G1 X166.512 Y186.798 E.29177
G1 X166.512 Y183.062 E.12392
G1 X166.12 Y182.61 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6991
G1 X175.7 Y182.61 E.29437
G1 X175.7 Y187.19 E.14073
G1 X166.12 Y187.19 E.29437
G1 X166.12 Y182.67 E.13889
M204 S10000
; WIPE_START
G1 F24000
G1 X168.12 Y182.657 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.4 I-1.145 J.413 P1  F30000
G1 X168.37 Y183.35 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6991
G1 X169.998 Y183.35 E.05401
G1 X173.098 Y186.45 E.1454
G1 X171.338 Y186.45 E.05838
G1 X174.437 Y183.35 E.1454
G1 X174.96 Y183.35 E.01733
G1 X174.96 Y184.456 E.03668
; WIPE_START
G1 F24000
G1 X174.96 Y183.35 E-.42023
G1 X174.437 Y183.35 E-.19853
G1 X174.174 Y183.613 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.4 I.879 J-.841 P1  F30000
G1 X65.308 Y69.802 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6991
G1 X65.308 Y186.798 E3.88097
G1 X61.512 Y186.798 E.12592
G1 X61.512 Y69.802 E3.88097
G1 X65.248 Y69.802 E.12392
G1 X65.7 Y69.41 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6991
G1 X65.7 Y187.19 E3.61905
G1 X61.12 Y187.19 E.14073
G1 X61.12 Y69.41 E3.61905
G1 X65.64 Y69.41 E.13889
M204 S10000
; WIPE_START
G1 F24000
G1 X65.641 Y71.41 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.4 I.5 J-1.109 P1  F30000
G1 X62.846 Y70.15 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6991
G1 X64.474 Y70.15 E.05401
G1 X64.96 Y70.636 E.02277
G1 X64.96 Y70.225 E.01363
G1 X61.86 Y73.324 E.1454
G1 X61.86 Y75.212 E.06263
G1 X64.96 Y78.312 E.1454
G1 X64.96 Y77.901 E.01363
G1 X61.86 Y81 E.1454
G1 X61.86 Y82.888 E.06263
G1 X64.96 Y85.988 E.1454
G1 X64.96 Y85.577 E.01363
G1 X61.86 Y88.676 E.1454
G1 X61.86 Y90.564 E.06263
G1 X64.96 Y93.664 E.1454
G1 X64.96 Y93.253 E.01363
G1 X61.86 Y96.352 E.1454
G1 X61.86 Y98.24 E.06263
G1 X64.96 Y101.339 E.1454
G1 X64.96 Y100.929 E.01363
G1 X61.86 Y104.028 E.1454
G1 X61.86 Y105.916 E.06263
G1 X64.96 Y109.015 E.1454
G1 X64.96 Y108.605 E.01363
G1 X61.86 Y111.704 E.1454
G1 X61.86 Y113.592 E.06263
G1 X64.96 Y116.691 E.1454
G1 X64.96 Y116.281 E.01363
G1 X61.86 Y119.38 E.1454
G1 X61.86 Y121.268 E.06263
G1 X64.96 Y124.367 E.1454
G1 X64.96 Y123.957 E.01363
G1 X61.86 Y127.056 E.1454
G1 X61.86 Y128.944 E.06263
G1 X64.96 Y132.043 E.1454
G1 X64.96 Y131.633 E.01363
G1 X61.86 Y134.732 E.1454
G1 X61.86 Y136.62 E.06263
G1 X64.96 Y139.719 E.1454
G1 X64.96 Y139.309 E.01363
G1 X61.86 Y142.408 E.1454
G1 X61.86 Y144.296 E.06263
G1 X64.96 Y147.395 E.1454
G1 X64.96 Y146.985 E.01363
G1 X61.86 Y150.084 E.1454
G1 X61.86 Y151.972 E.06263
G1 X64.96 Y155.071 E.1454
G1 X64.96 Y154.66 E.01363
G1 X61.86 Y157.76 E.1454
G1 X61.86 Y159.648 E.06263
G1 X64.96 Y162.747 E.1454
G1 X64.96 Y162.336 E.01363
G1 X61.86 Y165.436 E.1454
G1 X61.86 Y167.324 E.06263
G1 X64.96 Y170.423 E.1454
G1 X64.96 Y170.012 E.01363
G1 X61.86 Y173.112 E.1454
G1 X61.86 Y175 E.06263
G1 X64.96 Y178.099 E.1454
G1 X64.96 Y177.688 E.01363
G1 X61.86 Y180.788 E.1454
G1 X61.86 Y182.676 E.06263
G1 X64.96 Y185.775 E.1454
G1 X64.96 Y185.364 E.01363
G1 X63.874 Y186.45 E.05091
G1 X62.246 Y186.45 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 8.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X63.874 Y186.45 E-.61876
G1 X64.137 Y186.187 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 41/50
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
G3 Z8.4 I.9 J.819 P1  F30000
G1 X166.512 Y73.598 Z8.4
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6991
G1 X166.512 Y69.802 E.12592
G1 X175.308 Y69.802 E.29177
G1 X175.308 Y73.598 E.12592
G1 X166.572 Y73.598 E.28978
G1 X166.12 Y73.99 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6991
G1 X166.12 Y69.41 E.14073
G1 X175.7 Y69.41 E.29437
G1 X175.7 Y73.99 E.14073
G1 X166.18 Y73.99 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X166.154 Y71.99 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.6 I.945 J.767 P1  F30000
G1 X166.86 Y71.12 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6991
G1 X166.86 Y72.749 E.05401
G1 X167.361 Y73.25 E.0235
G1 X169.398 Y73.25 E.06758
G1 X172.498 Y70.15 E.1454
G1 X171.938 Y70.15 E.01857
G1 X174.96 Y73.172 E.14176
G1 X174.96 Y73.25 E.00257
G1 X173.409 Y73.25 E.05144
; WIPE_START
G1 F24000
G1 X174.96 Y73.25 E-.58929
G1 X174.96 Y73.172 E-.02947
G1 X174.697 Y72.909 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.6 I-1.214 J-.09 P1  F30000
G1 X166.512 Y183.002 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6991
G1 X175.308 Y183.002 E.29177
G1 X175.308 Y186.798 E.12592
G1 X166.512 Y186.798 E.29177
G1 X166.512 Y183.062 E.12392
G1 X166.12 Y182.61 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6991
G1 X175.7 Y182.61 E.29437
G1 X175.7 Y187.19 E.14073
G1 X166.12 Y187.19 E.29437
G1 X166.12 Y182.67 E.13889
M204 S10000
; WIPE_START
G1 F24000
G1 X168.12 Y182.657 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.6 I-1.145 J.413 P1  F30000
G1 X168.37 Y183.35 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6991
G1 X169.998 Y183.35 E.05401
G1 X173.098 Y186.45 E.1454
G1 X171.338 Y186.45 E.05838
G1 X174.437 Y183.35 E.1454
G1 X174.96 Y183.35 E.01733
G1 X174.96 Y184.456 E.03668
; WIPE_START
G1 F24000
G1 X174.96 Y183.35 E-.42023
G1 X174.437 Y183.35 E-.19853
G1 X174.174 Y183.613 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.6 I.879 J-.841 P1  F30000
G1 X65.308 Y69.802 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6991
G1 X65.308 Y186.798 E3.88097
G1 X61.512 Y186.798 E.12592
G1 X61.512 Y69.802 E3.88097
G1 X65.248 Y69.802 E.12392
G1 X65.7 Y69.41 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6991
G1 X65.7 Y187.19 E3.61905
G1 X61.12 Y187.19 E.14073
G1 X61.12 Y69.41 E3.61905
G1 X65.64 Y69.41 E.13889
M204 S10000
; WIPE_START
G1 F24000
G1 X65.641 Y71.41 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.6 I.5 J-1.109 P1  F30000
G1 X62.846 Y70.15 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6991
G1 X64.474 Y70.15 E.05401
G1 X64.96 Y70.636 E.02277
G1 X64.96 Y70.225 E.01363
G1 X61.86 Y73.324 E.1454
G1 X61.86 Y75.212 E.06263
G1 X64.96 Y78.312 E.1454
G1 X64.96 Y77.901 E.01363
G1 X61.86 Y81 E.1454
G1 X61.86 Y82.888 E.06263
G1 X64.96 Y85.988 E.1454
G1 X64.96 Y85.577 E.01363
G1 X61.86 Y88.676 E.1454
G1 X61.86 Y90.564 E.06263
G1 X64.96 Y93.664 E.1454
G1 X64.96 Y93.253 E.01363
G1 X61.86 Y96.352 E.1454
G1 X61.86 Y98.24 E.06263
G1 X64.96 Y101.339 E.1454
G1 X64.96 Y100.929 E.01363
G1 X61.86 Y104.028 E.1454
G1 X61.86 Y105.916 E.06263
G1 X64.96 Y109.015 E.1454
G1 X64.96 Y108.605 E.01363
G1 X61.86 Y111.704 E.1454
G1 X61.86 Y113.592 E.06263
G1 X64.96 Y116.691 E.1454
G1 X64.96 Y116.281 E.01363
G1 X61.86 Y119.38 E.1454
G1 X61.86 Y121.268 E.06263
G1 X64.96 Y124.367 E.1454
G1 X64.96 Y123.957 E.01363
G1 X61.86 Y127.056 E.1454
G1 X61.86 Y128.944 E.06263
G1 X64.96 Y132.043 E.1454
G1 X64.96 Y131.633 E.01363
G1 X61.86 Y134.732 E.1454
G1 X61.86 Y136.62 E.06263
G1 X64.96 Y139.719 E.1454
G1 X64.96 Y139.309 E.01363
G1 X61.86 Y142.408 E.1454
G1 X61.86 Y144.296 E.06263
G1 X64.96 Y147.395 E.1454
G1 X64.96 Y146.985 E.01363
M73 P96 R2
G1 X61.86 Y150.084 E.1454
G1 X61.86 Y151.972 E.06263
G1 X64.96 Y155.071 E.1454
G1 X64.96 Y154.66 E.01363
G1 X61.86 Y157.76 E.1454
G1 X61.86 Y159.648 E.06263
G1 X64.96 Y162.747 E.1454
G1 X64.96 Y162.336 E.01363
G1 X61.86 Y165.436 E.1454
G1 X61.86 Y167.324 E.06263
G1 X64.96 Y170.423 E.1454
G1 X64.96 Y170.012 E.01363
G1 X61.86 Y173.112 E.1454
G1 X61.86 Y175 E.06263
G1 X64.96 Y178.099 E.1454
G1 X64.96 Y177.688 E.01363
G1 X61.86 Y180.788 E.1454
G1 X61.86 Y182.676 E.06263
G1 X64.96 Y185.775 E.1454
G1 X64.96 Y185.364 E.01363
G1 X63.874 Y186.45 E.05091
G1 X62.246 Y186.45 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 8.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X63.874 Y186.45 E-.61876
G1 X64.137 Y186.187 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 42/50
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
G3 Z8.6 I.9 J.819 P1  F30000
G1 X166.512 Y73.598 Z8.6
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6991
G1 X166.512 Y69.802 E.12592
G1 X175.308 Y69.802 E.29177
G1 X175.308 Y73.598 E.12592
G1 X166.572 Y73.598 E.28978
G1 X166.12 Y73.99 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6991
G1 X166.12 Y69.41 E.14073
G1 X175.7 Y69.41 E.29437
G1 X175.7 Y73.99 E.14073
G1 X166.18 Y73.99 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X166.154 Y71.99 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.8 I.945 J.767 P1  F30000
G1 X166.86 Y71.12 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6991
G1 X166.86 Y72.749 E.05401
G1 X167.361 Y73.25 E.0235
G1 X169.398 Y73.25 E.06758
G1 X172.498 Y70.15 E.1454
G1 X171.938 Y70.15 E.01857
G1 X174.96 Y73.172 E.14176
G1 X174.96 Y73.25 E.00257
G1 X173.409 Y73.25 E.05144
; WIPE_START
G1 F24000
G1 X174.96 Y73.25 E-.58929
G1 X174.96 Y73.172 E-.02947
G1 X174.697 Y72.909 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.8 I-1.214 J-.09 P1  F30000
G1 X166.512 Y183.002 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6991
G1 X175.308 Y183.002 E.29177
G1 X175.308 Y186.798 E.12592
G1 X166.512 Y186.798 E.29177
G1 X166.512 Y183.062 E.12392
G1 X166.12 Y182.61 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6991
G1 X175.7 Y182.61 E.29437
G1 X175.7 Y187.19 E.14073
G1 X166.12 Y187.19 E.29437
G1 X166.12 Y182.67 E.13889
M204 S10000
; WIPE_START
G1 F24000
G1 X168.12 Y182.657 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.8 I-1.145 J.413 P1  F30000
G1 X168.37 Y183.35 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6991
G1 X169.998 Y183.35 E.05401
G1 X173.098 Y186.45 E.1454
G1 X171.338 Y186.45 E.05838
G1 X174.437 Y183.35 E.1454
G1 X174.96 Y183.35 E.01733
G1 X174.96 Y184.456 E.03668
; WIPE_START
G1 F24000
G1 X174.96 Y183.35 E-.42023
G1 X174.437 Y183.35 E-.19853
G1 X174.174 Y183.613 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.8 I.879 J-.841 P1  F30000
G1 X65.308 Y69.802 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6991
G1 X65.308 Y186.798 E3.88097
G1 X61.512 Y186.798 E.12592
G1 X61.512 Y69.802 E3.88097
G1 X65.248 Y69.802 E.12392
G1 X65.7 Y69.41 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6991
G1 X65.7 Y187.19 E3.61905
G1 X61.12 Y187.19 E.14073
G1 X61.12 Y69.41 E3.61905
G1 X65.64 Y69.41 E.13889
M204 S10000
; WIPE_START
G1 F24000
G1 X65.641 Y71.41 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.8 I.5 J-1.109 P1  F30000
G1 X62.846 Y70.15 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6991
G1 X64.474 Y70.15 E.05401
G1 X64.96 Y70.636 E.02277
G1 X64.96 Y70.225 E.01363
G1 X61.86 Y73.324 E.1454
G1 X61.86 Y75.212 E.06263
G1 X64.96 Y78.312 E.1454
G1 X64.96 Y77.901 E.01363
G1 X61.86 Y81 E.1454
G1 X61.86 Y82.888 E.06263
G1 X64.96 Y85.988 E.1454
G1 X64.96 Y85.577 E.01363
G1 X61.86 Y88.676 E.1454
G1 X61.86 Y90.564 E.06263
G1 X64.96 Y93.664 E.1454
G1 X64.96 Y93.253 E.01363
G1 X61.86 Y96.352 E.1454
G1 X61.86 Y98.24 E.06263
G1 X64.96 Y101.339 E.1454
G1 X64.96 Y100.929 E.01363
G1 X61.86 Y104.028 E.1454
G1 X61.86 Y105.916 E.06263
G1 X64.96 Y109.015 E.1454
G1 X64.96 Y108.605 E.01363
G1 X61.86 Y111.704 E.1454
G1 X61.86 Y113.592 E.06263
G1 X64.96 Y116.691 E.1454
G1 X64.96 Y116.281 E.01363
G1 X61.86 Y119.38 E.1454
G1 X61.86 Y121.268 E.06263
G1 X64.96 Y124.367 E.1454
G1 X64.96 Y123.957 E.01363
G1 X61.86 Y127.056 E.1454
G1 X61.86 Y128.944 E.06263
G1 X64.96 Y132.043 E.1454
G1 X64.96 Y131.633 E.01363
G1 X61.86 Y134.732 E.1454
G1 X61.86 Y136.62 E.06263
G1 X64.96 Y139.719 E.1454
G1 X64.96 Y139.309 E.01363
G1 X61.86 Y142.408 E.1454
G1 X61.86 Y144.296 E.06263
G1 X64.96 Y147.395 E.1454
G1 X64.96 Y146.985 E.01363
G1 X61.86 Y150.084 E.1454
G1 X61.86 Y151.972 E.06263
G1 X64.96 Y155.071 E.1454
G1 X64.96 Y154.66 E.01363
G1 X61.86 Y157.76 E.1454
G1 X61.86 Y159.648 E.06263
G1 X64.96 Y162.747 E.1454
G1 X64.96 Y162.336 E.01363
G1 X61.86 Y165.436 E.1454
G1 X61.86 Y167.324 E.06263
G1 X64.96 Y170.423 E.1454
G1 X64.96 Y170.012 E.01363
G1 X61.86 Y173.112 E.1454
G1 X61.86 Y175 E.06263
G1 X64.96 Y178.099 E.1454
G1 X64.96 Y177.688 E.01363
G1 X61.86 Y180.788 E.1454
G1 X61.86 Y182.676 E.06263
G1 X64.96 Y185.775 E.1454
G1 X64.96 Y185.364 E.01363
G1 X63.874 Y186.45 E.05091
G1 X62.246 Y186.45 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 8.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X63.874 Y186.45 E-.61876
G1 X64.137 Y186.187 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 43/50
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
G3 Z8.8 I.9 J.819 P1  F30000
G1 X166.512 Y73.598 Z8.8
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6991
G1 X166.512 Y69.802 E.12592
G1 X175.308 Y69.802 E.29177
G1 X175.308 Y73.598 E.12592
G1 X166.572 Y73.598 E.28978
G1 X166.12 Y73.99 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6991
G1 X166.12 Y69.41 E.14073
G1 X175.7 Y69.41 E.29437
G1 X175.7 Y73.99 E.14073
G1 X166.18 Y73.99 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X166.154 Y71.99 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9 I.945 J.767 P1  F30000
G1 X166.86 Y71.12 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6991
G1 X166.86 Y72.749 E.05401
G1 X167.361 Y73.25 E.0235
G1 X169.398 Y73.25 E.06758
G1 X172.498 Y70.15 E.1454
G1 X171.938 Y70.15 E.01857
G1 X174.96 Y73.172 E.14176
G1 X174.96 Y73.25 E.00257
G1 X173.409 Y73.25 E.05144
; WIPE_START
G1 F24000
G1 X174.96 Y73.25 E-.58929
G1 X174.96 Y73.172 E-.02947
G1 X174.697 Y72.909 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9 I-1.214 J-.09 P1  F30000
G1 X166.512 Y183.002 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6991
G1 X175.308 Y183.002 E.29177
G1 X175.308 Y186.798 E.12592
G1 X166.512 Y186.798 E.29177
G1 X166.512 Y183.062 E.12392
G1 X166.12 Y182.61 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6991
G1 X175.7 Y182.61 E.29437
G1 X175.7 Y187.19 E.14073
G1 X166.12 Y187.19 E.29437
G1 X166.12 Y182.67 E.13889
M204 S10000
; WIPE_START
G1 F24000
G1 X168.12 Y182.657 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9 I-1.145 J.413 P1  F30000
G1 X168.37 Y183.35 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6991
G1 X169.998 Y183.35 E.05401
G1 X173.098 Y186.45 E.1454
G1 X171.338 Y186.45 E.05838
G1 X174.437 Y183.35 E.1454
G1 X174.96 Y183.35 E.01733
G1 X174.96 Y184.456 E.03668
; WIPE_START
G1 F24000
G1 X174.96 Y183.35 E-.42023
G1 X174.437 Y183.35 E-.19853
G1 X174.174 Y183.613 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9 I.879 J-.841 P1  F30000
G1 X65.308 Y69.802 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6991
G1 X65.308 Y186.798 E3.88097
G1 X61.512 Y186.798 E.12592
G1 X61.512 Y69.802 E3.88097
G1 X65.248 Y69.802 E.12392
G1 X65.7 Y69.41 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6991
G1 X65.7 Y187.19 E3.61905
G1 X61.12 Y187.19 E.14073
G1 X61.12 Y69.41 E3.61905
G1 X65.64 Y69.41 E.13889
M204 S10000
; WIPE_START
G1 F24000
G1 X65.641 Y71.41 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9 I.5 J-1.109 P1  F30000
G1 X62.846 Y70.15 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6991
G1 X64.474 Y70.15 E.05401
G1 X64.96 Y70.636 E.02277
G1 X64.96 Y70.225 E.01363
G1 X61.86 Y73.324 E.1454
G1 X61.86 Y75.212 E.06263
G1 X64.96 Y78.312 E.1454
G1 X64.96 Y77.901 E.01363
G1 X61.86 Y81 E.1454
G1 X61.86 Y82.888 E.06263
G1 X64.96 Y85.988 E.1454
G1 X64.96 Y85.577 E.01363
G1 X61.86 Y88.676 E.1454
G1 X61.86 Y90.564 E.06263
G1 X64.96 Y93.664 E.1454
G1 X64.96 Y93.253 E.01363
G1 X61.86 Y96.352 E.1454
G1 X61.86 Y98.24 E.06263
G1 X64.96 Y101.339 E.1454
G1 X64.96 Y100.929 E.01363
G1 X61.86 Y104.028 E.1454
G1 X61.86 Y105.916 E.06263
G1 X64.96 Y109.015 E.1454
G1 X64.96 Y108.605 E.01363
G1 X61.86 Y111.704 E.1454
G1 X61.86 Y113.592 E.06263
G1 X64.96 Y116.691 E.1454
G1 X64.96 Y116.281 E.01363
G1 X61.86 Y119.38 E.1454
G1 X61.86 Y121.268 E.06263
G1 X64.96 Y124.367 E.1454
G1 X64.96 Y123.957 E.01363
G1 X61.86 Y127.056 E.1454
G1 X61.86 Y128.944 E.06263
G1 X64.96 Y132.043 E.1454
G1 X64.96 Y131.633 E.01363
G1 X61.86 Y134.732 E.1454
G1 X61.86 Y136.62 E.06263
G1 X64.96 Y139.719 E.1454
G1 X64.96 Y139.309 E.01363
G1 X61.86 Y142.408 E.1454
G1 X61.86 Y144.296 E.06263
G1 X64.96 Y147.395 E.1454
G1 X64.96 Y146.985 E.01363
G1 X61.86 Y150.084 E.1454
G1 X61.86 Y151.972 E.06263
G1 X64.96 Y155.071 E.1454
G1 X64.96 Y154.66 E.01363
G1 X61.86 Y157.76 E.1454
G1 X61.86 Y159.648 E.06263
G1 X64.96 Y162.747 E.1454
G1 X64.96 Y162.336 E.01363
G1 X61.86 Y165.436 E.1454
G1 X61.86 Y167.324 E.06263
G1 X64.96 Y170.423 E.1454
G1 X64.96 Y170.012 E.01363
G1 X61.86 Y173.112 E.1454
G1 X61.86 Y175 E.06263
G1 X64.96 Y178.099 E.1454
G1 X64.96 Y177.688 E.01363
G1 X61.86 Y180.788 E.1454
G1 X61.86 Y182.676 E.06263
G1 X64.96 Y185.775 E.1454
G1 X64.96 Y185.364 E.01363
G1 X63.874 Y186.45 E.05091
G1 X62.246 Y186.45 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 8.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X63.874 Y186.45 E-.61876
G1 X64.137 Y186.187 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 44/50
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
G3 Z9 I.9 J.819 P1  F30000
G1 X166.512 Y73.598 Z9
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9201
G1 X166.512 Y69.802 E.12592
G1 X175.308 Y69.802 E.29177
G1 X175.308 Y73.598 E.12592
G1 X166.572 Y73.598 E.28978
G1 X166.12 Y73.99 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9201
G1 X166.12 Y69.41 E.14073
G1 X175.7 Y69.41 E.29437
G1 X175.7 Y73.99 E.14073
G1 X166.18 Y73.99 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X166.154 Y71.99 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.2 I-.472 J1.122 P1  F30000
G1 X168.177 Y72.843 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F9201
G1 X169.806 Y72.843 E.05401
G1 X172.091 Y70.557 E.1072
G1 X172.345 Y70.557 E.00844
G1 X174.553 Y72.765 E.10356
G1 X174.553 Y72.843 E.00257
G1 X173.002 Y72.843 E.05144
G1 X174.96 Y73.19 F30000
G1 F9201
G1 X174.96 Y70.15 E.10082
G1 X166.86 Y70.15 E.26867
G1 X166.86 Y73.25 E.10281
G1 X174.96 Y73.25 E.26867
; WIPE_START
G1 F24000
G1 X172.96 Y73.25 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.2 I-1.215 J-.071 P1  F30000
G1 X166.512 Y183.002 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9201
G1 X175.308 Y183.002 E.29177
G1 X175.308 Y186.798 E.12592
G1 X166.512 Y186.798 E.29177
G1 X166.512 Y183.062 E.12392
G1 X166.12 Y182.61 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9201
G1 X175.7 Y182.61 E.29437
G1 X175.7 Y187.19 E.14073
G1 X166.12 Y187.19 E.29437
G1 X166.12 Y182.67 E.13889
M204 S10000
; WIPE_START
G1 F24000
G1 X168.12 Y182.657 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.2 I-1.045 J.624 P1  F30000
G1 X168.777 Y183.757 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F9201
G1 X170.405 Y183.757 E.05401
G1 X172.691 Y186.043 E.1072
G1 X171.745 Y186.043 E.03137
G1 X174.03 Y183.757 E.1072
G1 X174.553 Y183.757 E.01733
G1 X174.553 Y184.863 E.03668
G1 X174.96 Y186.39 F30000
G1 F9201
G1 X174.96 Y183.35 E.10082
G1 X166.86 Y183.35 E.26867
G1 X166.86 Y186.45 E.10281
G1 X174.96 Y186.45 E.26867
; WIPE_START
G1 F24000
G1 X172.96 Y186.45 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.2 I.894 J-.825 P1  F30000
G1 X65.308 Y69.802 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9201
G1 X65.308 Y186.798 E3.88097
G1 X61.512 Y186.798 E.12592
G1 X61.512 Y69.802 E3.88097
G1 X65.248 Y69.802 E.12392
G1 X65.7 Y69.41 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9201
G1 X65.7 Y187.19 E3.61905
G1 X61.12 Y187.19 E.14073
G1 X61.12 Y69.41 E3.61905
G1 X65.64 Y69.41 E.13889
M204 S10000
; WIPE_START
G1 F24000
G1 X65.641 Y71.41 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.2 I-.749 J-.959 P1  F30000
G1 X64.553 Y72.26 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F9201
G1 X64.553 Y70.632 E.05401
G1 X62.267 Y72.917 E.1072
G1 X62.267 Y75.619 E.08964
G1 X64.553 Y77.905 E.1072
G1 X64.553 Y78.308 E.01338
G1 X62.267 Y80.593 E.1072
G1 X62.267 Y83.295 E.08964
G1 X64.553 Y85.58 E.1072
G1 X64.553 Y85.984 E.01338
G1 X62.267 Y88.269 E.1072
G1 X62.267 Y90.971 E.08964
G1 X64.553 Y93.256 E.1072
G1 X64.553 Y93.66 E.01338
G1 X62.267 Y95.945 E.1072
G1 X62.267 Y98.647 E.08964
G1 X64.553 Y100.932 E.1072
G1 X64.553 Y101.336 E.01338
G1 X62.267 Y103.621 E.1072
G1 X62.267 Y106.323 E.08964
G1 X64.553 Y108.608 E.1072
G1 X64.553 Y109.012 E.01338
G1 X62.267 Y111.297 E.1072
G1 X62.267 Y113.999 E.08964
G1 X64.553 Y116.284 E.1072
G1 X64.553 Y116.688 E.01338
G1 X62.267 Y118.973 E.1072
G1 X62.267 Y121.675 E.08964
G1 X64.553 Y123.96 E.1072
G1 X64.553 Y124.364 E.01338
G1 X62.267 Y126.649 E.1072
G1 X62.267 Y129.351 E.08964
G1 X64.553 Y131.636 E.1072
G1 X64.553 Y132.04 E.01338
G1 X62.267 Y134.325 E.1072
G1 X62.267 Y137.027 E.08964
G1 X64.553 Y139.312 E.1072
G1 X64.553 Y139.716 E.01338
G1 X62.267 Y142.001 E.1072
G1 X62.267 Y144.703 E.08964
G1 X64.553 Y146.988 E.1072
G1 X64.553 Y147.392 E.01338
G1 X62.267 Y149.677 E.1072
G1 X62.267 Y152.379 E.08964
G1 X64.553 Y154.664 E.1072
G1 X64.553 Y155.068 E.01338
G1 X62.267 Y157.353 E.1072
G1 X62.267 Y160.055 E.08964
G1 X64.553 Y162.34 E.1072
G1 X64.553 Y162.744 E.01338
G1 X62.267 Y165.029 E.1072
G1 X62.267 Y167.731 E.08964
G1 X64.553 Y170.016 E.1072
G1 X64.553 Y170.419 E.01338
G1 X62.267 Y172.705 E.1072
G1 X62.267 Y175.407 E.08964
G1 X64.553 Y177.692 E.1072
G1 X64.553 Y178.095 E.01338
G1 X62.267 Y180.381 E.1072
G1 X62.267 Y183.083 E.08964
G1 X64.553 Y185.368 E.1072
G1 X64.553 Y185.771 E.01338
G1 X64.281 Y186.043 E.01272
G1 X62.653 Y186.043 E.05401
G1 X64.96 Y186.39 F30000
G1 F9201
G1 X64.96 Y70.15 E3.85587
G1 X61.86 Y70.15 E.10281
G1 X61.86 Y186.45 E3.85786
G1 X64.96 Y186.45 E.10281
; CHANGE_LAYER
; Z_HEIGHT: 9
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X62.96 Y186.45 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 45/50
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
G3 Z9.2 I.897 J.823 P1  F30000
G1 X166.512 Y73.598 Z9.2
G1 Z9
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9204
G1 X166.512 Y69.802 E.12592
G1 X175.308 Y69.802 E.29177
G1 X175.308 Y73.598 E.12592
G1 X166.572 Y73.598 E.28978
G1 X166.12 Y73.99 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9204
G1 X166.12 Y69.41 E.14073
G1 X175.7 Y69.41 E.29437
G1 X175.7 Y73.99 E.14073
G1 X166.18 Y73.99 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X166.154 Y71.99 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I-.472 J1.122 P1  F30000
G1 X168.177 Y72.843 Z9.4
G1 Z9
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F9204
G1 X169.806 Y72.843 E.05401
G1 X172.091 Y70.557 E.1072
G1 X172.345 Y70.557 E.00844
G1 X174.553 Y72.765 E.10356
G1 X174.553 Y72.843 E.00257
G1 X173.002 Y72.843 E.05144
G1 X174.96 Y73.19 F30000
G1 F9204
G1 X174.96 Y70.15 E.10082
G1 X166.86 Y70.15 E.26867
G1 X166.86 Y73.25 E.10281
G1 X174.96 Y73.25 E.26867
; WIPE_START
G1 F24000
G1 X172.96 Y73.25 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I-1.215 J-.071 P1  F30000
G1 X166.512 Y183.002 Z9.4
G1 Z9
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9204
G1 X175.308 Y183.002 E.29177
G1 X175.308 Y186.798 E.12592
G1 X166.512 Y186.798 E.29177
G1 X166.512 Y183.062 E.12392
G1 X166.12 Y182.61 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9204
G1 X175.7 Y182.61 E.29437
G1 X175.7 Y187.19 E.14073
G1 X166.12 Y187.19 E.29437
G1 X166.12 Y182.67 E.13889
M204 S10000
; WIPE_START
G1 F24000
G1 X168.12 Y182.657 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I-1.045 J.624 P1  F30000
G1 X168.777 Y183.757 Z9.4
G1 Z9
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F9204
G1 X170.405 Y183.757 E.05401
G1 X172.691 Y186.043 E.1072
G1 X171.745 Y186.043 E.03137
G1 X174.03 Y183.757 E.1072
G1 X174.553 Y183.757 E.01733
G1 X174.553 Y184.863 E.03668
G1 X174.96 Y186.39 F30000
G1 F9204
G1 X174.96 Y183.35 E.10082
G1 X166.86 Y183.35 E.26867
G1 X166.86 Y186.45 E.10281
G1 X174.96 Y186.45 E.26867
; WIPE_START
G1 F24000
G1 X172.96 Y186.45 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I.894 J-.825 P1  F30000
G1 X65.308 Y69.802 Z9.4
G1 Z9
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9204
G1 X65.308 Y186.798 E3.88097
G1 X61.512 Y186.798 E.12592
G1 X61.512 Y69.802 E3.88097
G1 X65.248 Y69.802 E.12392
G1 X65.7 Y69.41 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9204
G1 X65.7 Y187.19 E3.61905
G1 X61.12 Y187.19 E.14073
G1 X61.12 Y69.41 E3.61905
G1 X65.64 Y69.41 E.13889
M204 S10000
; WIPE_START
G1 F24000
G1 X65.641 Y71.41 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I-.749 J-.959 P1  F30000
G1 X64.553 Y72.26 Z9.4
G1 Z9
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F9204
G1 X64.553 Y70.632 E.05401
G1 X62.267 Y72.917 E.1072
G1 X62.267 Y75.619 E.08964
G1 X64.553 Y77.905 E.1072
G1 X64.553 Y78.308 E.01338
G1 X62.267 Y80.593 E.1072
G1 X62.267 Y83.295 E.08964
G1 X64.553 Y85.58 E.1072
G1 X64.553 Y85.984 E.01338
G1 X62.267 Y88.269 E.1072
G1 X62.267 Y90.971 E.08964
G1 X64.553 Y93.256 E.1072
G1 X64.553 Y93.66 E.01338
G1 X62.267 Y95.945 E.1072
G1 X62.267 Y98.647 E.08964
G1 X64.553 Y100.932 E.1072
G1 X64.553 Y101.336 E.01338
G1 X62.267 Y103.621 E.1072
G1 X62.267 Y106.323 E.08964
G1 X64.553 Y108.608 E.1072
G1 X64.553 Y109.012 E.01338
G1 X62.267 Y111.297 E.1072
G1 X62.267 Y113.999 E.08964
G1 X64.553 Y116.284 E.1072
G1 X64.553 Y116.688 E.01338
G1 X62.267 Y118.973 E.1072
G1 X62.267 Y121.675 E.08964
G1 X64.553 Y123.96 E.1072
G1 X64.553 Y124.364 E.01338
G1 X62.267 Y126.649 E.1072
G1 X62.267 Y129.351 E.08964
G1 X64.553 Y131.636 E.1072
G1 X64.553 Y132.04 E.01338
G1 X62.267 Y134.325 E.1072
G1 X62.267 Y137.027 E.08964
G1 X64.553 Y139.312 E.1072
G1 X64.553 Y139.716 E.01338
G1 X62.267 Y142.001 E.1072
G1 X62.267 Y144.703 E.08964
G1 X64.553 Y146.988 E.1072
G1 X64.553 Y147.392 E.01338
M73 P96 R1
G1 X62.267 Y149.677 E.1072
G1 X62.267 Y152.379 E.08964
M73 P97 R1
G1 X64.553 Y154.664 E.1072
G1 X64.553 Y155.068 E.01338
G1 X62.267 Y157.353 E.1072
G1 X62.267 Y160.055 E.08964
G1 X64.553 Y162.34 E.1072
G1 X64.553 Y162.744 E.01338
G1 X62.267 Y165.029 E.1072
G1 X62.267 Y167.731 E.08964
G1 X64.553 Y170.016 E.1072
G1 X64.553 Y170.419 E.01338
G1 X62.267 Y172.705 E.1072
G1 X62.267 Y175.407 E.08964
G1 X64.553 Y177.692 E.1072
G1 X64.553 Y178.095 E.01338
G1 X62.267 Y180.381 E.1072
G1 X62.267 Y183.083 E.08964
G1 X64.553 Y185.368 E.1072
G1 X64.553 Y185.771 E.01338
G1 X64.281 Y186.043 E.01272
G1 X62.653 Y186.043 E.05401
G1 X64.96 Y186.39 F30000
G1 F9204
G1 X64.96 Y70.15 E3.85587
G1 X61.86 Y70.15 E.10281
G1 X61.86 Y186.45 E3.85786
G1 X64.96 Y186.45 E.10281
; CHANGE_LAYER
; Z_HEIGHT: 9.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X62.96 Y186.45 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 46/50
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
G3 Z9.4 I.897 J.823 P1  F30000
G1 X166.512 Y73.598 Z9.4
G1 Z9.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9204
G1 X166.512 Y69.802 E.12592
G1 X175.308 Y69.802 E.29177
G1 X175.308 Y73.598 E.12592
G1 X166.572 Y73.598 E.28978
G1 X166.12 Y73.99 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9204
G1 X166.12 Y69.41 E.14073
G1 X175.7 Y69.41 E.29437
G1 X175.7 Y73.99 E.14073
G1 X166.18 Y73.99 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X166.154 Y71.99 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.6 I-.472 J1.122 P1  F30000
G1 X168.177 Y72.843 Z9.6
G1 Z9.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F9204
G1 X169.806 Y72.843 E.05401
G1 X172.091 Y70.557 E.1072
G1 X172.345 Y70.557 E.00844
G1 X174.553 Y72.765 E.10356
G1 X174.553 Y72.843 E.00257
G1 X173.002 Y72.843 E.05144
G1 X174.96 Y73.19 F30000
G1 F9204
G1 X174.96 Y70.15 E.10082
G1 X166.86 Y70.15 E.26867
G1 X166.86 Y73.25 E.10281
G1 X174.96 Y73.25 E.26867
; WIPE_START
G1 F24000
G1 X172.96 Y73.25 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.6 I-1.215 J-.071 P1  F30000
G1 X166.512 Y183.002 Z9.6
G1 Z9.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9204
G1 X175.308 Y183.002 E.29177
G1 X175.308 Y186.798 E.12592
G1 X166.512 Y186.798 E.29177
G1 X166.512 Y183.062 E.12392
G1 X166.12 Y182.61 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9204
G1 X175.7 Y182.61 E.29437
G1 X175.7 Y187.19 E.14073
G1 X166.12 Y187.19 E.29437
G1 X166.12 Y182.67 E.13889
M204 S10000
; WIPE_START
G1 F24000
G1 X168.12 Y182.657 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.6 I-1.045 J.624 P1  F30000
G1 X168.777 Y183.757 Z9.6
G1 Z9.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F9204
G1 X170.405 Y183.757 E.05401
G1 X172.691 Y186.043 E.1072
G1 X171.745 Y186.043 E.03137
G1 X174.03 Y183.757 E.1072
G1 X174.553 Y183.757 E.01733
G1 X174.553 Y184.863 E.03668
G1 X174.96 Y186.39 F30000
G1 F9204
G1 X174.96 Y183.35 E.10082
G1 X166.86 Y183.35 E.26867
G1 X166.86 Y186.45 E.10281
G1 X174.96 Y186.45 E.26867
; WIPE_START
G1 F24000
G1 X172.96 Y186.45 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.6 I.894 J-.825 P1  F30000
G1 X65.308 Y69.802 Z9.6
G1 Z9.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9204
G1 X65.308 Y186.798 E3.88097
G1 X61.512 Y186.798 E.12592
G1 X61.512 Y69.802 E3.88097
G1 X65.248 Y69.802 E.12392
G1 X65.7 Y69.41 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9204
G1 X65.7 Y187.19 E3.61905
G1 X61.12 Y187.19 E.14073
G1 X61.12 Y69.41 E3.61905
G1 X65.64 Y69.41 E.13889
M204 S10000
; WIPE_START
G1 F24000
G1 X65.641 Y71.41 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.6 I-.749 J-.959 P1  F30000
G1 X64.553 Y72.26 Z9.6
G1 Z9.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F9204
G1 X64.553 Y70.632 E.05401
G1 X62.267 Y72.917 E.1072
G1 X62.267 Y75.619 E.08964
G1 X64.553 Y77.905 E.1072
G1 X64.553 Y78.308 E.01338
G1 X62.267 Y80.593 E.1072
G1 X62.267 Y83.295 E.08964
G1 X64.553 Y85.58 E.1072
G1 X64.553 Y85.984 E.01338
G1 X62.267 Y88.269 E.1072
G1 X62.267 Y90.971 E.08964
G1 X64.553 Y93.256 E.1072
G1 X64.553 Y93.66 E.01338
G1 X62.267 Y95.945 E.1072
G1 X62.267 Y98.647 E.08964
G1 X64.553 Y100.932 E.1072
G1 X64.553 Y101.336 E.01338
G1 X62.267 Y103.621 E.1072
G1 X62.267 Y106.323 E.08964
G1 X64.553 Y108.608 E.1072
G1 X64.553 Y109.012 E.01338
G1 X62.267 Y111.297 E.1072
G1 X62.267 Y113.999 E.08964
G1 X64.553 Y116.284 E.1072
G1 X64.553 Y116.688 E.01338
G1 X62.267 Y118.973 E.1072
G1 X62.267 Y121.675 E.08964
G1 X64.553 Y123.96 E.1072
G1 X64.553 Y124.364 E.01338
G1 X62.267 Y126.649 E.1072
G1 X62.267 Y129.351 E.08964
G1 X64.553 Y131.636 E.1072
G1 X64.553 Y132.04 E.01338
G1 X62.267 Y134.325 E.1072
G1 X62.267 Y137.027 E.08964
G1 X64.553 Y139.312 E.1072
G1 X64.553 Y139.716 E.01338
G1 X62.267 Y142.001 E.1072
G1 X62.267 Y144.703 E.08964
G1 X64.553 Y146.988 E.1072
G1 X64.553 Y147.392 E.01338
G1 X62.267 Y149.677 E.1072
G1 X62.267 Y152.379 E.08964
G1 X64.553 Y154.664 E.1072
G1 X64.553 Y155.068 E.01338
G1 X62.267 Y157.353 E.1072
G1 X62.267 Y160.055 E.08964
G1 X64.553 Y162.34 E.1072
G1 X64.553 Y162.744 E.01338
G1 X62.267 Y165.029 E.1072
G1 X62.267 Y167.731 E.08964
G1 X64.553 Y170.016 E.1072
G1 X64.553 Y170.419 E.01338
G1 X62.267 Y172.705 E.1072
G1 X62.267 Y175.407 E.08964
G1 X64.553 Y177.692 E.1072
G1 X64.553 Y178.095 E.01338
G1 X62.267 Y180.381 E.1072
G1 X62.267 Y183.083 E.08964
G1 X64.553 Y185.368 E.1072
G1 X64.553 Y185.771 E.01338
G1 X64.281 Y186.043 E.01272
G1 X62.653 Y186.043 E.05401
G1 X64.96 Y186.39 F30000
G1 F9204
G1 X64.96 Y70.15 E3.85587
G1 X61.86 Y70.15 E.10281
G1 X61.86 Y186.45 E3.85786
G1 X64.96 Y186.45 E.10281
; CHANGE_LAYER
; Z_HEIGHT: 9.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X62.96 Y186.45 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 47/50
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
G3 Z9.6 I.897 J.823 P1  F30000
G1 X166.512 Y73.598 Z9.6
G1 Z9.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9204
G1 X166.512 Y69.802 E.12592
G1 X175.308 Y69.802 E.29177
G1 X175.308 Y73.598 E.12592
G1 X166.572 Y73.598 E.28978
G1 X166.12 Y73.99 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9204
G1 X166.12 Y69.41 E.14073
G1 X175.7 Y69.41 E.29437
G1 X175.7 Y73.99 E.14073
G1 X166.18 Y73.99 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X166.154 Y71.99 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.8 I-.472 J1.122 P1  F30000
G1 X168.177 Y72.843 Z9.8
G1 Z9.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F9204
G1 X169.806 Y72.843 E.05401
G1 X172.091 Y70.557 E.1072
G1 X172.345 Y70.557 E.00844
G1 X174.553 Y72.765 E.10356
G1 X174.553 Y72.843 E.00257
G1 X173.002 Y72.843 E.05144
G1 X174.96 Y73.19 F30000
G1 F9204
G1 X174.96 Y70.15 E.10082
G1 X166.86 Y70.15 E.26867
G1 X166.86 Y73.25 E.10281
G1 X174.96 Y73.25 E.26867
; WIPE_START
G1 F24000
G1 X172.96 Y73.25 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.8 I-1.215 J-.071 P1  F30000
G1 X166.512 Y183.002 Z9.8
G1 Z9.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9204
G1 X175.308 Y183.002 E.29177
G1 X175.308 Y186.798 E.12592
G1 X166.512 Y186.798 E.29177
G1 X166.512 Y183.062 E.12392
G1 X166.12 Y182.61 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9204
G1 X175.7 Y182.61 E.29437
G1 X175.7 Y187.19 E.14073
G1 X166.12 Y187.19 E.29437
G1 X166.12 Y182.67 E.13889
M204 S10000
; WIPE_START
G1 F24000
G1 X168.12 Y182.657 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.8 I-1.045 J.624 P1  F30000
G1 X168.777 Y183.757 Z9.8
G1 Z9.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F9204
G1 X170.405 Y183.757 E.05401
G1 X172.691 Y186.043 E.1072
G1 X171.745 Y186.043 E.03137
G1 X174.03 Y183.757 E.1072
G1 X174.553 Y183.757 E.01733
G1 X174.553 Y184.863 E.03668
G1 X174.96 Y186.39 F30000
G1 F9204
G1 X174.96 Y183.35 E.10082
G1 X166.86 Y183.35 E.26867
G1 X166.86 Y186.45 E.10281
G1 X174.96 Y186.45 E.26867
; WIPE_START
G1 F24000
G1 X172.96 Y186.45 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.8 I.894 J-.825 P1  F30000
G1 X65.308 Y69.802 Z9.8
G1 Z9.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9204
G1 X65.308 Y186.798 E3.88097
G1 X61.512 Y186.798 E.12592
G1 X61.512 Y69.802 E3.88097
G1 X65.248 Y69.802 E.12392
G1 X65.7 Y69.41 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9204
G1 X65.7 Y187.19 E3.61905
G1 X61.12 Y187.19 E.14073
G1 X61.12 Y69.41 E3.61905
G1 X65.64 Y69.41 E.13889
M204 S10000
; WIPE_START
G1 F24000
G1 X65.641 Y71.41 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.8 I-.749 J-.959 P1  F30000
G1 X64.553 Y72.26 Z9.8
G1 Z9.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F9204
G1 X64.553 Y70.632 E.05401
G1 X62.267 Y72.917 E.1072
G1 X62.267 Y75.619 E.08964
G1 X64.553 Y77.905 E.1072
G1 X64.553 Y78.308 E.01338
G1 X62.267 Y80.593 E.1072
G1 X62.267 Y83.295 E.08964
G1 X64.553 Y85.58 E.1072
G1 X64.553 Y85.984 E.01338
G1 X62.267 Y88.269 E.1072
G1 X62.267 Y90.971 E.08964
G1 X64.553 Y93.256 E.1072
G1 X64.553 Y93.66 E.01338
G1 X62.267 Y95.945 E.1072
G1 X62.267 Y98.647 E.08964
G1 X64.553 Y100.932 E.1072
G1 X64.553 Y101.336 E.01338
G1 X62.267 Y103.621 E.1072
G1 X62.267 Y106.323 E.08964
G1 X64.553 Y108.608 E.1072
G1 X64.553 Y109.012 E.01338
G1 X62.267 Y111.297 E.1072
G1 X62.267 Y113.999 E.08964
G1 X64.553 Y116.284 E.1072
G1 X64.553 Y116.688 E.01338
G1 X62.267 Y118.973 E.1072
G1 X62.267 Y121.675 E.08964
G1 X64.553 Y123.96 E.1072
G1 X64.553 Y124.364 E.01338
G1 X62.267 Y126.649 E.1072
G1 X62.267 Y129.351 E.08964
G1 X64.553 Y131.636 E.1072
G1 X64.553 Y132.04 E.01338
G1 X62.267 Y134.325 E.1072
G1 X62.267 Y137.027 E.08964
G1 X64.553 Y139.312 E.1072
G1 X64.553 Y139.716 E.01338
G1 X62.267 Y142.001 E.1072
G1 X62.267 Y144.703 E.08964
G1 X64.553 Y146.988 E.1072
G1 X64.553 Y147.392 E.01338
G1 X62.267 Y149.677 E.1072
G1 X62.267 Y152.379 E.08964
G1 X64.553 Y154.664 E.1072
G1 X64.553 Y155.068 E.01338
G1 X62.267 Y157.353 E.1072
G1 X62.267 Y160.055 E.08964
G1 X64.553 Y162.34 E.1072
G1 X64.553 Y162.744 E.01338
G1 X62.267 Y165.029 E.1072
G1 X62.267 Y167.731 E.08964
G1 X64.553 Y170.016 E.1072
G1 X64.553 Y170.419 E.01338
G1 X62.267 Y172.705 E.1072
G1 X62.267 Y175.407 E.08964
G1 X64.553 Y177.692 E.1072
G1 X64.553 Y178.095 E.01338
G1 X62.267 Y180.381 E.1072
G1 X62.267 Y183.083 E.08964
G1 X64.553 Y185.368 E.1072
G1 X64.553 Y185.771 E.01338
G1 X64.281 Y186.043 E.01272
G1 X62.653 Y186.043 E.05401
G1 X64.96 Y186.39 F30000
G1 F9204
G1 X64.96 Y70.15 E3.85587
G1 X61.86 Y70.15 E.10281
G1 X61.86 Y186.45 E3.85786
G1 X64.96 Y186.45 E.10281
M106 S224.4
; CHANGE_LAYER
; Z_HEIGHT: 9.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X62.96 Y186.45 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 48/50
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
G3 Z9.8 I.897 J.823 P1  F30000
G1 X166.512 Y73.598 Z9.8
G1 Z9.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X166.512 Y69.802 E.12592
G1 X175.308 Y69.802 E.29177
G1 X175.308 Y73.598 E.12592
G1 X166.572 Y73.598 E.28978
G1 X166.12 Y73.99 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X166.12 Y69.41 E.14073
G1 X175.7 Y69.41 E.29437
G1 X175.7 Y73.99 E.14073
G1 X166.18 Y73.99 E.29252
M204 S10000
G1 X166.893 Y73.431 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.422578
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X166.893 Y70.172 E.18622
G1 X167.366 Y70.172 E.027
G1 X167.366 Y73.228 E.17465
G1 X167.838 Y73.228 E.027
G1 X167.838 Y70.172 E.17465
G1 X168.311 Y70.172 E.027
G1 X168.311 Y73.228 E.17465
G1 X168.783 Y73.228 E.027
G1 X168.783 Y70.172 E.17465
G1 X169.256 Y70.172 E.027
G1 X169.256 Y73.228 E.17465
G1 X169.729 Y73.228 E.027
G1 X169.729 Y70.172 E.17465
G1 X170.201 Y70.172 E.027
G1 X170.201 Y73.228 E.17465
G1 X170.674 Y73.228 E.027
G1 X170.674 Y70.172 E.17465
G1 X171.146 Y70.172 E.027
G1 X171.146 Y73.228 E.17465
G1 X171.619 Y73.228 E.027
G1 X171.619 Y70.172 E.17465
G1 X172.091 Y70.172 E.027
G1 X172.091 Y73.228 E.17465
G1 X172.564 Y73.228 E.027
G1 X172.564 Y70.172 E.17465
G1 X173.037 Y70.172 E.027
G1 X173.037 Y73.228 E.17465
G1 X173.509 Y73.228 E.027
G1 X173.509 Y70.172 E.17465
G1 X173.982 Y70.172 E.027
G1 X173.982 Y73.228 E.17465
G1 X174.454 Y73.228 E.027
G1 X174.454 Y70.172 E.17465
G1 X174.927 Y70.172 E.027
G1 X174.927 Y73.431 E.18622
M106 S224.4
; WIPE_START
G1 F24000
G1 X174.927 Y71.431 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10 I-1.214 J-.092 P1  F30000
G1 X166.512 Y183.002 Z10
G1 Z9.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X175.308 Y183.002 E.29177
G1 X175.308 Y186.798 E.12592
G1 X166.512 Y186.798 E.29177
G1 X166.512 Y183.062 E.12392
G1 X166.12 Y182.61 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X175.7 Y182.61 E.29437
G1 X175.7 Y187.19 E.14073
G1 X166.12 Y187.19 E.29437
G1 X166.12 Y182.67 E.13889
M204 S10000
; WIPE_START
G1 F24000
G1 X168.12 Y182.657 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10 I-1.163 J-.359 P1  F30000
G1 X166.893 Y186.631 Z10
G1 Z9.6
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.422578
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X166.893 Y183.372 E.18622
G1 X167.366 Y183.372 E.027
G1 X167.366 Y186.428 E.17465
G1 X167.838 Y186.428 E.027
G1 X167.838 Y183.372 E.17465
G1 X168.311 Y183.372 E.027
G1 X168.311 Y186.428 E.17465
G1 X168.783 Y186.428 E.027
G1 X168.783 Y183.372 E.17465
G1 X169.256 Y183.372 E.027
G1 X169.256 Y186.428 E.17465
G1 X169.729 Y186.428 E.027
G1 X169.729 Y183.372 E.17465
G1 X170.201 Y183.372 E.027
G1 X170.201 Y186.428 E.17465
G1 X170.674 Y186.428 E.027
G1 X170.674 Y183.372 E.17465
G1 X171.146 Y183.372 E.027
G1 X171.146 Y186.428 E.17465
G1 X171.619 Y186.428 E.027
G1 X171.619 Y183.372 E.17465
G1 X172.091 Y183.372 E.027
G1 X172.091 Y186.428 E.17465
G1 X172.564 Y186.428 E.027
G1 X172.564 Y183.372 E.17465
G1 X173.037 Y183.372 E.027
G1 X173.037 Y186.428 E.17465
G1 X173.509 Y186.428 E.027
G1 X173.509 Y183.372 E.17465
G1 X173.982 Y183.372 E.027
G1 X173.982 Y186.428 E.17465
G1 X174.454 Y186.428 E.027
G1 X174.454 Y183.372 E.17465
G1 X174.927 Y183.372 E.027
G1 X174.927 Y186.631 E.18622
M106 S224.4
; WIPE_START
G1 F24000
G1 X174.927 Y184.631 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10 I.88 J-.84 P1  F30000
G1 X65.308 Y69.802 Z10
G1 Z9.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X65.308 Y186.798 E3.88097
G1 X61.512 Y186.798 E.12592
G1 X61.512 Y69.802 E3.88097
G1 X65.248 Y69.802 E.12392
G1 X65.7 Y69.41 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X65.7 Y187.19 E3.61905
G1 X61.12 Y187.19 E.14073
G1 X61.12 Y69.41 E3.61905
G1 X65.64 Y69.41 E.13889
M204 S10000
G1 X65.141 Y70.172 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.400603
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X61.882 Y70.172 E.16736
G1 X61.882 Y70.623 E.02314
G1 X64.938 Y70.623 E.15696
G1 X64.938 Y71.073 E.02314
G1 X61.882 Y71.073 E.15696
G1 X61.882 Y71.524 E.02314
G1 X64.938 Y71.524 E.15696
G1 X64.938 Y71.975 E.02314
G1 X61.882 Y71.975 E.15696
G1 X61.882 Y72.425 E.02314
G1 X64.938 Y72.425 E.15696
G1 X64.938 Y72.876 E.02314
G1 X61.882 Y72.876 E.15696
G1 X61.882 Y73.326 E.02314
G1 X64.938 Y73.326 E.15696
G1 X64.938 Y73.777 E.02314
G1 X61.882 Y73.777 E.15696
G1 X61.882 Y74.228 E.02314
G1 X64.938 Y74.228 E.15696
G1 X64.938 Y74.678 E.02314
G1 X61.882 Y74.678 E.15696
G1 X61.882 Y75.129 E.02314
G1 X64.938 Y75.129 E.15696
G1 X64.938 Y75.579 E.02314
G1 X61.882 Y75.579 E.15696
G1 X61.882 Y76.03 E.02314
G1 X64.938 Y76.03 E.15696
G1 X64.938 Y76.481 E.02314
G1 X61.882 Y76.481 E.15696
G1 X61.882 Y76.931 E.02314
G1 X64.938 Y76.931 E.15696
G1 X64.938 Y77.382 E.02314
G1 X61.882 Y77.382 E.15696
G1 X61.882 Y77.832 E.02314
G1 X64.938 Y77.832 E.15696
G1 X64.938 Y78.283 E.02314
G1 X61.882 Y78.283 E.15696
G1 X61.882 Y78.734 E.02314
G1 X64.938 Y78.734 E.15696
G1 X64.938 Y79.184 E.02314
G1 X61.882 Y79.184 E.15696
G1 X61.882 Y79.635 E.02314
G1 X64.938 Y79.635 E.15696
G1 X64.938 Y80.085 E.02314
G1 X61.882 Y80.085 E.15696
G1 X61.882 Y80.536 E.02314
G1 X64.938 Y80.536 E.15696
G1 X64.938 Y80.987 E.02314
G1 X61.882 Y80.987 E.15696
G1 X61.882 Y81.437 E.02314
G1 X64.938 Y81.437 E.15696
G1 X64.938 Y81.888 E.02314
G1 X61.882 Y81.888 E.15696
G1 X61.882 Y82.338 E.02314
G1 X64.938 Y82.338 E.15696
G1 X64.938 Y82.789 E.02314
G1 X61.882 Y82.789 E.15696
G1 X61.882 Y83.24 E.02314
G1 X64.938 Y83.24 E.15696
G1 X64.938 Y83.69 E.02314
G1 X61.882 Y83.69 E.15696
G1 X61.882 Y84.141 E.02314
G1 X64.938 Y84.141 E.15696
G1 X64.938 Y84.591 E.02314
G1 X61.882 Y84.591 E.15696
G1 X61.882 Y85.042 E.02314
G1 X64.938 Y85.042 E.15696
G1 X64.938 Y85.493 E.02314
G1 X61.882 Y85.493 E.15696
G1 X61.882 Y85.943 E.02314
G1 X64.938 Y85.943 E.15696
G1 X64.938 Y86.394 E.02314
G1 X61.882 Y86.394 E.15696
G1 X61.882 Y86.844 E.02314
G1 X64.938 Y86.844 E.15696
G1 X64.938 Y87.295 E.02314
G1 X61.882 Y87.295 E.15696
G1 X61.882 Y87.746 E.02314
G1 X64.938 Y87.746 E.15696
G1 X64.938 Y88.196 E.02314
G1 X61.882 Y88.196 E.15696
G1 X61.882 Y88.647 E.02314
G1 X64.938 Y88.647 E.15696
G1 X64.938 Y89.097 E.02314
G1 X61.882 Y89.097 E.15696
G1 X61.882 Y89.548 E.02314
G1 X64.938 Y89.548 E.15696
G1 X64.938 Y89.999 E.02314
G1 X61.882 Y89.999 E.15696
G1 X61.882 Y90.449 E.02314
G1 X64.938 Y90.449 E.15696
G1 X64.938 Y90.9 E.02314
G1 X61.882 Y90.9 E.15696
G1 X61.882 Y91.35 E.02314
G1 X64.938 Y91.35 E.15696
G1 X64.938 Y91.801 E.02314
G1 X61.882 Y91.801 E.15696
G1 X61.882 Y92.252 E.02314
G1 X64.938 Y92.252 E.15696
G1 X64.938 Y92.702 E.02314
G1 X61.882 Y92.702 E.15696
G1 X61.882 Y93.153 E.02314
G1 X64.938 Y93.153 E.15696
G1 X64.938 Y93.604 E.02314
G1 X61.882 Y93.604 E.15696
G1 X61.882 Y94.054 E.02314
G1 X64.938 Y94.054 E.15696
G1 X64.938 Y94.505 E.02314
G1 X61.882 Y94.505 E.15696
G1 X61.882 Y94.955 E.02314
G1 X64.938 Y94.955 E.15696
G1 X64.938 Y95.406 E.02314
G1 X61.882 Y95.406 E.15696
G1 X61.882 Y95.857 E.02314
G1 X64.938 Y95.857 E.15696
G1 X64.938 Y96.307 E.02314
G1 X61.882 Y96.307 E.15696
G1 X61.882 Y96.758 E.02314
G1 X64.938 Y96.758 E.15696
G1 X64.938 Y97.208 E.02314
G1 X61.882 Y97.208 E.15696
G1 X61.882 Y97.659 E.02314
G1 X64.938 Y97.659 E.15696
G1 X64.938 Y98.11 E.02314
G1 X61.882 Y98.11 E.15696
G1 X61.882 Y98.56 E.02314
G1 X64.938 Y98.56 E.15696
G1 X64.938 Y99.011 E.02314
G1 X61.882 Y99.011 E.15696
G1 X61.882 Y99.461 E.02314
G1 X64.938 Y99.461 E.15696
G1 X64.938 Y99.912 E.02314
G1 X61.882 Y99.912 E.15696
G1 X61.882 Y100.363 E.02314
G1 X64.938 Y100.363 E.15696
G1 X64.938 Y100.813 E.02314
G1 X61.882 Y100.813 E.15696
G1 X61.882 Y101.264 E.02314
G1 X64.938 Y101.264 E.15696
G1 X64.938 Y101.714 E.02314
G1 X61.882 Y101.714 E.15696
G1 X61.882 Y102.165 E.02314
G1 X64.938 Y102.165 E.15696
G1 X64.938 Y102.616 E.02314
G1 X61.882 Y102.616 E.15696
G1 X61.882 Y103.066 E.02314
G1 X64.938 Y103.066 E.15696
G1 X64.938 Y103.517 E.02314
G1 X61.882 Y103.517 E.15696
G1 X61.882 Y103.967 E.02314
G1 X64.938 Y103.967 E.15696
G1 X64.938 Y104.418 E.02314
G1 X61.882 Y104.418 E.15696
G1 X61.882 Y104.869 E.02314
G1 X64.938 Y104.869 E.15696
G1 X64.938 Y105.319 E.02314
G1 X61.882 Y105.319 E.15696
G1 X61.882 Y105.77 E.02314
G1 X64.938 Y105.77 E.15696
G1 X64.938 Y106.22 E.02314
G1 X61.882 Y106.22 E.15696
G1 X61.882 Y106.671 E.02314
G1 X64.938 Y106.671 E.15696
G1 X64.938 Y107.122 E.02314
G1 X61.882 Y107.122 E.15696
G1 X61.882 Y107.572 E.02314
G1 X64.938 Y107.572 E.15696
G1 X64.938 Y108.023 E.02314
G1 X61.882 Y108.023 E.15696
G1 X61.882 Y108.473 E.02314
G1 X64.938 Y108.473 E.15696
G1 X64.938 Y108.924 E.02314
G1 X61.882 Y108.924 E.15696
G1 X61.882 Y109.375 E.02314
G1 X64.938 Y109.375 E.15696
G1 X64.938 Y109.825 E.02314
G1 X61.882 Y109.825 E.15696
G1 X61.882 Y110.276 E.02314
G1 X64.938 Y110.276 E.15696
G1 X64.938 Y110.726 E.02314
G1 X61.882 Y110.726 E.15696
G1 X61.882 Y111.177 E.02314
G1 X64.938 Y111.177 E.15696
G1 X64.938 Y111.628 E.02314
G1 X61.882 Y111.628 E.15696
G1 X61.882 Y112.078 E.02314
G1 X64.938 Y112.078 E.15696
G1 X64.938 Y112.529 E.02314
G1 X61.882 Y112.529 E.15696
G1 X61.882 Y112.979 E.02314
G1 X64.938 Y112.979 E.15696
G1 X64.938 Y113.43 E.02314
G1 X61.882 Y113.43 E.15696
G1 X61.882 Y113.881 E.02314
G1 X64.938 Y113.881 E.15696
G1 X64.938 Y114.331 E.02314
G1 X61.882 Y114.331 E.15696
G1 X61.882 Y114.782 E.02314
G1 X64.938 Y114.782 E.15696
G1 X64.938 Y115.232 E.02314
G1 X61.882 Y115.232 E.15696
G1 X61.882 Y115.683 E.02314
G1 X64.938 Y115.683 E.15696
G1 X64.938 Y116.134 E.02314
G1 X61.882 Y116.134 E.15696
G1 X61.882 Y116.584 E.02314
G1 X64.938 Y116.584 E.15696
G1 X64.938 Y117.035 E.02314
G1 X61.882 Y117.035 E.15696
G1 X61.882 Y117.485 E.02314
G1 X64.938 Y117.485 E.15696
G1 X64.938 Y117.936 E.02314
G1 X61.882 Y117.936 E.15696
G1 X61.882 Y118.387 E.02314
G1 X64.938 Y118.387 E.15696
G1 X64.938 Y118.837 E.02314
G1 X61.882 Y118.837 E.15696
G1 X61.882 Y119.288 E.02314
G1 X64.938 Y119.288 E.15696
G1 X64.938 Y119.738 E.02314
G1 X61.882 Y119.738 E.15696
G1 X61.882 Y120.189 E.02314
G1 X64.938 Y120.189 E.15696
M73 P98 R1
G1 X64.938 Y120.64 E.02314
G1 X61.882 Y120.64 E.15696
G1 X61.882 Y121.09 E.02314
G1 X64.938 Y121.09 E.15696
G1 X64.938 Y121.541 E.02314
G1 X61.882 Y121.541 E.15696
G1 X61.882 Y121.991 E.02314
G1 X64.938 Y121.991 E.15696
G1 X64.938 Y122.442 E.02314
G1 X61.882 Y122.442 E.15696
G1 X61.882 Y122.893 E.02314
G1 X64.938 Y122.893 E.15696
G1 X64.938 Y123.343 E.02314
G1 X61.882 Y123.343 E.15696
G1 X61.882 Y123.794 E.02314
G1 X64.938 Y123.794 E.15696
G1 X64.938 Y124.245 E.02314
G1 X61.882 Y124.245 E.15696
G1 X61.882 Y124.695 E.02314
G1 X64.938 Y124.695 E.15696
G1 X64.938 Y125.146 E.02314
G1 X61.882 Y125.146 E.15696
G1 X61.882 Y125.596 E.02314
G1 X64.938 Y125.596 E.15696
G1 X64.938 Y126.047 E.02314
G1 X61.882 Y126.047 E.15696
G1 X61.882 Y126.498 E.02314
G1 X64.938 Y126.498 E.15696
G1 X64.938 Y126.948 E.02314
G1 X61.882 Y126.948 E.15696
G1 X61.882 Y127.399 E.02314
G1 X64.938 Y127.399 E.15696
G1 X64.938 Y127.849 E.02314
G1 X61.882 Y127.849 E.15696
G1 X61.882 Y128.3 E.02314
G1 X64.938 Y128.3 E.15696
G1 X64.938 Y128.751 E.02314
G1 X61.882 Y128.751 E.15696
G1 X61.882 Y129.201 E.02314
G1 X64.938 Y129.201 E.15696
G1 X64.938 Y129.652 E.02314
G1 X61.882 Y129.652 E.15696
G1 X61.882 Y130.102 E.02314
G1 X64.938 Y130.102 E.15696
G1 X64.938 Y130.553 E.02314
G1 X61.882 Y130.553 E.15696
G1 X61.882 Y131.004 E.02314
G1 X64.938 Y131.004 E.15696
G1 X64.938 Y131.454 E.02314
G1 X61.882 Y131.454 E.15696
G1 X61.882 Y131.905 E.02314
G1 X64.938 Y131.905 E.15696
G1 X64.938 Y132.355 E.02314
G1 X61.882 Y132.355 E.15696
G1 X61.882 Y132.806 E.02314
G1 X64.938 Y132.806 E.15696
G1 X64.938 Y133.257 E.02314
G1 X61.882 Y133.257 E.15696
G1 X61.882 Y133.707 E.02314
G1 X64.938 Y133.707 E.15696
G1 X64.938 Y134.158 E.02314
G1 X61.882 Y134.158 E.15696
G1 X61.882 Y134.608 E.02314
G1 X64.938 Y134.608 E.15696
G1 X64.938 Y135.059 E.02314
G1 X61.882 Y135.059 E.15696
G1 X61.882 Y135.51 E.02314
G1 X64.938 Y135.51 E.15696
G1 X64.938 Y135.96 E.02314
G1 X61.882 Y135.96 E.15696
G1 X61.882 Y136.411 E.02314
G1 X64.938 Y136.411 E.15696
G1 X64.938 Y136.861 E.02314
G1 X61.882 Y136.861 E.15696
G1 X61.882 Y137.312 E.02314
G1 X64.938 Y137.312 E.15696
G1 X64.938 Y137.763 E.02314
G1 X61.882 Y137.763 E.15696
G1 X61.882 Y138.213 E.02314
G1 X64.938 Y138.213 E.15696
G1 X64.938 Y138.664 E.02314
G1 X61.882 Y138.664 E.15696
G1 X61.882 Y139.114 E.02314
G1 X64.938 Y139.114 E.15696
G1 X64.938 Y139.565 E.02314
G1 X61.882 Y139.565 E.15696
G1 X61.882 Y140.016 E.02314
G1 X64.938 Y140.016 E.15696
G1 X64.938 Y140.466 E.02314
G1 X61.882 Y140.466 E.15696
G1 X61.882 Y140.917 E.02314
G1 X64.938 Y140.917 E.15696
G1 X64.938 Y141.367 E.02314
G1 X61.882 Y141.367 E.15696
G1 X61.882 Y141.818 E.02314
G1 X64.938 Y141.818 E.15696
G1 X64.938 Y142.269 E.02314
G1 X61.882 Y142.269 E.15696
G1 X61.882 Y142.719 E.02314
G1 X64.938 Y142.719 E.15696
G1 X64.938 Y143.17 E.02314
G1 X61.882 Y143.17 E.15696
G1 X61.882 Y143.62 E.02314
G1 X64.938 Y143.62 E.15696
G1 X64.938 Y144.071 E.02314
G1 X61.882 Y144.071 E.15696
G1 X61.882 Y144.522 E.02314
G1 X64.938 Y144.522 E.15696
G1 X64.938 Y144.972 E.02314
G1 X61.882 Y144.972 E.15696
G1 X61.882 Y145.423 E.02314
G1 X64.938 Y145.423 E.15696
G1 X64.938 Y145.873 E.02314
G1 X61.882 Y145.873 E.15696
G1 X61.882 Y146.324 E.02314
G1 X64.938 Y146.324 E.15696
G1 X64.938 Y146.775 E.02314
G1 X61.882 Y146.775 E.15696
G1 X61.882 Y147.225 E.02314
G1 X64.938 Y147.225 E.15696
G1 X64.938 Y147.676 E.02314
G1 X61.882 Y147.676 E.15696
G1 X61.882 Y148.126 E.02314
G1 X64.938 Y148.126 E.15696
G1 X64.938 Y148.577 E.02314
G1 X61.882 Y148.577 E.15696
G1 X61.882 Y149.028 E.02314
G1 X64.938 Y149.028 E.15696
G1 X64.938 Y149.478 E.02314
G1 X61.882 Y149.478 E.15696
G1 X61.882 Y149.929 E.02314
G1 X64.938 Y149.929 E.15696
G1 X64.938 Y150.379 E.02314
G1 X61.882 Y150.379 E.15696
G1 X61.882 Y150.83 E.02314
G1 X64.938 Y150.83 E.15696
G1 X64.938 Y151.281 E.02314
G1 X61.882 Y151.281 E.15696
G1 X61.882 Y151.731 E.02314
G1 X64.938 Y151.731 E.15696
G1 X64.938 Y152.182 E.02314
G1 X61.882 Y152.182 E.15696
G1 X61.882 Y152.633 E.02314
G1 X64.938 Y152.633 E.15696
G1 X64.938 Y153.083 E.02314
G1 X61.882 Y153.083 E.15696
G1 X61.882 Y153.534 E.02314
G1 X64.938 Y153.534 E.15696
G1 X64.938 Y153.984 E.02314
G1 X61.882 Y153.984 E.15696
G1 X61.882 Y154.435 E.02314
G1 X64.938 Y154.435 E.15696
G1 X64.938 Y154.886 E.02314
G1 X61.882 Y154.886 E.15696
G1 X61.882 Y155.336 E.02314
G1 X64.938 Y155.336 E.15696
G1 X64.938 Y155.787 E.02314
G1 X61.882 Y155.787 E.15696
G1 X61.882 Y156.237 E.02314
G1 X64.938 Y156.237 E.15696
G1 X64.938 Y156.688 E.02314
G1 X61.882 Y156.688 E.15696
G1 X61.882 Y157.139 E.02314
G1 X64.938 Y157.139 E.15696
G1 X64.938 Y157.589 E.02314
G1 X61.882 Y157.589 E.15696
G1 X61.882 Y158.04 E.02314
G1 X64.938 Y158.04 E.15696
G1 X64.938 Y158.49 E.02314
G1 X61.882 Y158.49 E.15696
G1 X61.882 Y158.941 E.02314
G1 X64.938 Y158.941 E.15696
G1 X64.938 Y159.392 E.02314
G1 X61.882 Y159.392 E.15696
G1 X61.882 Y159.842 E.02314
G1 X64.938 Y159.842 E.15696
G1 X64.938 Y160.293 E.02314
G1 X61.882 Y160.293 E.15696
G1 X61.882 Y160.743 E.02314
G1 X64.938 Y160.743 E.15696
G1 X64.938 Y161.194 E.02314
G1 X61.882 Y161.194 E.15696
G1 X61.882 Y161.645 E.02314
G1 X64.938 Y161.645 E.15696
G1 X64.938 Y162.095 E.02314
G1 X61.882 Y162.095 E.15696
G1 X61.882 Y162.546 E.02314
G1 X64.938 Y162.546 E.15696
G1 X64.938 Y162.996 E.02314
G1 X61.882 Y162.996 E.15696
G1 X61.882 Y163.447 E.02314
G1 X64.938 Y163.447 E.15696
G1 X64.938 Y163.898 E.02314
G1 X61.882 Y163.898 E.15696
G1 X61.882 Y164.348 E.02314
G1 X64.938 Y164.348 E.15696
G1 X64.938 Y164.799 E.02314
G1 X61.882 Y164.799 E.15696
G1 X61.882 Y165.249 E.02314
G1 X64.938 Y165.249 E.15696
G1 X64.938 Y165.7 E.02314
G1 X61.882 Y165.7 E.15696
G1 X61.882 Y166.151 E.02314
G1 X64.938 Y166.151 E.15696
G1 X64.938 Y166.601 E.02314
G1 X61.882 Y166.601 E.15696
G1 X61.882 Y167.052 E.02314
G1 X64.938 Y167.052 E.15696
G1 X64.938 Y167.502 E.02314
G1 X61.882 Y167.502 E.15696
G1 X61.882 Y167.953 E.02314
G1 X64.938 Y167.953 E.15696
G1 X64.938 Y168.404 E.02314
G1 X61.882 Y168.404 E.15696
G1 X61.882 Y168.854 E.02314
G1 X64.938 Y168.854 E.15696
G1 X64.938 Y169.305 E.02314
G1 X61.882 Y169.305 E.15696
G1 X61.882 Y169.755 E.02314
G1 X64.938 Y169.755 E.15696
G1 X64.938 Y170.206 E.02314
G1 X61.882 Y170.206 E.15696
G1 X61.882 Y170.657 E.02314
G1 X64.938 Y170.657 E.15696
G1 X64.938 Y171.107 E.02314
G1 X61.882 Y171.107 E.15696
G1 X61.882 Y171.558 E.02314
G1 X64.938 Y171.558 E.15696
G1 X64.938 Y172.008 E.02314
G1 X61.882 Y172.008 E.15696
G1 X61.882 Y172.459 E.02314
G1 X64.938 Y172.459 E.15696
G1 X64.938 Y172.91 E.02314
G1 X61.882 Y172.91 E.15696
G1 X61.882 Y173.36 E.02314
G1 X64.938 Y173.36 E.15696
G1 X64.938 Y173.811 E.02314
G1 X61.882 Y173.811 E.15696
G1 X61.882 Y174.261 E.02314
G1 X64.938 Y174.261 E.15696
G1 X64.938 Y174.712 E.02314
G1 X61.882 Y174.712 E.15696
G1 X61.882 Y175.163 E.02314
G1 X64.938 Y175.163 E.15696
G1 X64.938 Y175.613 E.02314
G1 X61.882 Y175.613 E.15696
G1 X61.882 Y176.064 E.02314
G1 X64.938 Y176.064 E.15696
G1 X64.938 Y176.514 E.02314
G1 X61.882 Y176.514 E.15696
G1 X61.882 Y176.965 E.02314
G1 X64.938 Y176.965 E.15696
G1 X64.938 Y177.416 E.02314
G1 X61.882 Y177.416 E.15696
G1 X61.882 Y177.866 E.02314
G1 X64.938 Y177.866 E.15696
G1 X64.938 Y178.317 E.02314
G1 X61.882 Y178.317 E.15696
G1 X61.882 Y178.767 E.02314
G1 X64.938 Y178.767 E.15696
G1 X64.938 Y179.218 E.02314
G1 X61.882 Y179.218 E.15696
G1 X61.882 Y179.669 E.02314
G1 X64.938 Y179.669 E.15696
G1 X64.938 Y180.119 E.02314
G1 X61.882 Y180.119 E.15696
G1 X61.882 Y180.57 E.02314
G1 X64.938 Y180.57 E.15696
G1 X64.938 Y181.02 E.02314
G1 X61.882 Y181.02 E.15696
G1 X61.882 Y181.471 E.02314
G1 X64.938 Y181.471 E.15696
G1 X64.938 Y181.922 E.02314
G1 X61.882 Y181.922 E.15696
G1 X61.882 Y182.372 E.02314
G1 X64.938 Y182.372 E.15696
G1 X64.938 Y182.823 E.02314
G1 X61.882 Y182.823 E.15696
G1 X61.882 Y183.274 E.02314
G1 X64.938 Y183.274 E.15696
G1 X64.938 Y183.724 E.02314
G1 X61.882 Y183.724 E.15696
G1 X61.882 Y184.175 E.02314
G1 X64.938 Y184.175 E.15696
G1 X64.938 Y184.625 E.02314
G1 X61.882 Y184.625 E.15696
G1 X61.882 Y185.076 E.02314
G1 X64.938 Y185.076 E.15696
G1 X64.938 Y185.527 E.02314
G1 X61.882 Y185.527 E.15696
G1 X61.882 Y185.977 E.02314
G1 X64.938 Y185.977 E.15696
G1 X64.938 Y186.428 E.02314
G1 X61.679 Y186.428 E.16736
M106 S224.4
M106 S252.45
; CHANGE_LAYER
; Z_HEIGHT: 9.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X63.679 Y186.428 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 49/50
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
G3 Z10 I.899 J.82 P1  F30000
G1 X166.512 Y73.598 Z10
G1 Z9.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X166.512 Y69.802 E.12592
G1 X175.308 Y69.802 E.29177
G1 X175.308 Y73.598 E.12592
G1 X166.572 Y73.598 E.28978
G1 X166.12 Y73.99 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X166.12 Y69.41 E.14073
G1 X175.7 Y69.41 E.29437
G1 X175.7 Y73.99 E.14073
G1 X166.18 Y73.99 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X166.154 Y71.99 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.2 I.155 J1.207 P1  F30000
G1 X168.41 Y71.7 Z10.2
G1 Z9.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.415052
G1 F15000
G1 X173.35 Y71.7 E.1498
G1 X168.035 Y72.075 F30000
; LINE_WIDTH: 0.419999
G1 F15000
G1 X173.785 Y72.075 E.17666
G1 X173.785 Y71.325 E.02302
G1 X168.035 Y71.325 E.17666
G1 X168.035 Y72.015 E.02118
G1 X167.658 Y72.452 F30000
G1 F15000
G1 X174.162 Y72.452 E.19983
G1 X174.162 Y70.948 E.04619
G1 X167.658 Y70.948 E.19983
G1 X167.658 Y72.392 E.04435
G1 X167.281 Y72.829 F30000
G1 F15000
G1 X174.539 Y72.829 E.223
G1 X174.539 Y70.571 E.06937
G1 X167.281 Y70.571 E.223
G1 X167.281 Y72.769 E.06752
G1 X166.904 Y73.206 F30000
G1 F15000
G1 X174.916 Y73.206 E.24618
G1 X174.916 Y70.194 E.09254
G1 X166.904 Y70.194 E.24618
G1 X166.904 Y73.146 E.0907
; WIPE_START
G1 F24000
G1 X166.904 Y71.146 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.2 I-1.217 J-.004 P1  F30000
G1 X166.512 Y183.002 Z10.2
G1 Z9.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X175.308 Y183.002 E.29177
G1 X175.308 Y186.798 E.12592
G1 X166.512 Y186.798 E.29177
G1 X166.512 Y183.062 E.12392
G1 X166.12 Y182.61 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X175.7 Y182.61 E.29437
G1 X175.7 Y187.19 E.14073
G1 X166.12 Y187.19 E.29437
G1 X166.12 Y182.67 E.13889
M204 S10000
; WIPE_START
G1 F24000
G1 X168.12 Y182.657 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.2 I-1.207 J.156 P1  F30000
G1 X168.41 Y184.9 Z10.2
G1 Z9.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.415052
G1 F15000
G1 X173.35 Y184.9 E.1498
G1 X168.035 Y184.525 F30000
; LINE_WIDTH: 0.419999
G1 F15000
G1 X168.035 Y185.275 E.02302
G1 X173.785 Y185.275 E.17666
G1 X173.785 Y184.525 E.02302
G1 X168.095 Y184.525 E.17481
G1 X167.658 Y184.148 F30000
G1 F15000
G1 X167.658 Y185.652 E.04619
G1 X174.162 Y185.652 E.19983
G1 X174.162 Y184.148 E.04619
G1 X167.718 Y184.148 E.19799
G1 X167.281 Y183.771 F30000
G1 F15000
G1 X167.281 Y186.029 E.06937
G1 X174.539 Y186.029 E.223
G1 X174.539 Y183.771 E.06937
G1 X167.341 Y183.771 E.22116
G1 X166.904 Y183.394 F30000
G1 F15000
G1 X166.904 Y186.406 E.09254
G1 X174.916 Y186.406 E.24618
G1 X174.916 Y183.394 E.09254
G1 X166.964 Y183.394 E.24433
; WIPE_START
G1 F24000
G1 X168.964 Y183.394 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.2 I.899 J-.82 P1  F30000
G1 X65.308 Y69.802 Z10.2
G1 Z9.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X65.308 Y186.798 E3.88097
G1 X61.512 Y186.798 E.12592
G1 X61.512 Y69.802 E3.88097
G1 X65.248 Y69.802 E.12392
G1 X65.7 Y69.41 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X65.7 Y187.19 E3.61905
G1 X61.12 Y187.19 E.14073
G1 X61.12 Y69.41 E3.61905
G1 X65.64 Y69.41 E.13889
M204 S10000
; WIPE_START
G1 F24000
G1 X65.641 Y71.41 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.2 I-1.217 J-.024 P1  F30000
G1 X63.41 Y184.9 Z10.2
G1 Z9.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.415056
G1 F15000
G1 X63.41 Y71.76 E3.4309
G1 X63.785 Y71.7 F30000
; LINE_WIDTH: 0.419999
G1 F15000
G1 X63.785 Y71.325 E.01151
G1 X63.035 Y71.325 E.02302
G1 X63.035 Y185.275 E3.50134
G1 X63.785 Y185.275 E.02302
G1 X63.785 Y71.76 E3.48798
G1 X64.162 Y71.7 F30000
G1 F15000
G1 X64.162 Y70.948 E.0231
G1 X62.658 Y70.948 E.04619
G1 X62.658 Y185.652 E3.52451
G1 X64.162 Y185.652 E.04619
G1 X64.162 Y71.76 E3.49957
G1 X64.539 Y71.7 F30000
G1 F15000
G1 X64.539 Y70.571 E.03468
G1 X62.281 Y70.571 E.06937
G1 X62.281 Y186.029 E3.54768
G1 X64.539 Y186.029 E.06937
G1 X64.539 Y71.76 E3.51115
G1 X64.916 Y71.7 F30000
G1 F15000
G1 X64.916 Y70.194 E.04627
G1 X61.904 Y70.194 E.09254
G1 X61.904 Y186.406 E3.57086
G1 X64.916 Y186.406 E.09254
G1 X64.916 Y71.76 E3.52274
M106 S247.35
; CHANGE_LAYER
; Z_HEIGHT: 10
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X64.916 Y73.76 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 50/50
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
G3 Z10.2 I-.003 J1.217 P1  F30000
G1 X166.12 Y73.99 Z10.2
G1 Z10
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X166.12 Y69.41 E.14073
G1 X175.7 Y69.41 E.29437
G1 X175.7 Y73.99 E.14073
G1 X166.18 Y73.99 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X166.154 Y71.99 E-.76
; WIPE_END
M73 P98 R0
G1 E-.04 F1800
G17
G3 Z10.4 I-.245 J1.192 P1  F30000
G1 X174.885 Y73.783 Z10.4
G1 Z10
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
G1 F12000
G1 X175.493 Y73.175 E.0264
G1 X175.493 Y72.642
G1 X174.352 Y73.783 E.04957
G1 X173.819 Y73.783
G1 X175.493 Y72.109 E.07275
G1 X175.493 Y71.575
G1 X173.285 Y73.783 E.09592
G1 X172.752 Y73.783
G1 X175.493 Y71.042 E.11909
G1 X175.493 Y70.509
G1 X172.219 Y73.783 E.14226
G1 X171.685 Y73.783
G1 X175.493 Y69.975 E.16544
G1 X175.317 Y69.617
G1 X171.152 Y73.783 E.181
G1 X170.619 Y73.783
G1 X174.784 Y69.617 E.181
G1 X174.251 Y69.617
G1 X170.086 Y73.783 E.181
G1 X169.552 Y73.783
G1 X173.718 Y69.617 E.181
G1 X173.184 Y69.617
G1 X169.019 Y73.783 E.181
G1 X168.486 Y73.783
G1 X172.651 Y69.617 E.181
G1 X172.118 Y69.617
G1 X167.953 Y73.783 E.181
G1 X167.419 Y73.783
G1 X171.585 Y69.617 E.181
G1 X171.051 Y69.617
G1 X166.886 Y73.783 E.181
G1 X166.353 Y73.783
G1 X170.518 Y69.617 E.181
G1 X169.985 Y69.617
G1 X166.327 Y73.275 E.15893
G1 X166.327 Y72.741
G1 X169.451 Y69.617 E.13576
G1 X168.918 Y69.617
G1 X166.327 Y72.208 E.11258
G1 X166.327 Y71.675
G1 X168.385 Y69.617 E.08941
G1 X167.852 Y69.617
G1 X166.327 Y71.142 E.06624
G1 X166.327 Y70.608
G1 X167.318 Y69.617 E.04306
G1 X166.785 Y69.617
G1 X166.327 Y70.075 E.01989
M204 S10000
; WIPE_START
G1 F24000
G1 X166.785 Y69.617 E-.24598
G1 X167.318 Y69.617 E-.20264
G1 X166.739 Y70.197 E-.31138
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.4 I-1.217 J-.007 P1  F30000
G1 X166.12 Y182.61 Z10.4
G1 Z10
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
G1 F12000
G1 X175.7 Y182.61 E.29437
G1 X175.7 Y187.19 E.14073
G1 X166.12 Y187.19 E.29437
G1 X166.12 Y182.67 E.13889
M204 S10000
; WIPE_START
G1 F24000
G1 X168.12 Y182.657 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.4 I-.666 J1.019 P1  F30000
G1 X174.738 Y186.983 Z10.4
G1 Z10
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
G1 F12000
G1 X175.493 Y186.228 E.03278
G1 X175.493 Y185.695
G1 X174.205 Y186.983 E.05595
G1 X173.672 Y186.983
G1 X175.493 Y185.162 E.07912
G1 X175.493 Y184.629
G1 X173.139 Y186.983 E.10229
G1 X172.605 Y186.983
G1 X175.493 Y184.095 E.12547
G1 X175.493 Y183.562
G1 X172.072 Y186.983 E.14864
G1 X171.539 Y186.983
G1 X175.493 Y183.029 E.17181
G1 X175.171 Y182.817
G1 X171.005 Y186.983 E.181
G1 X170.472 Y186.983
G1 X174.637 Y182.817 E.181
G1 X174.104 Y182.817
G1 X169.939 Y186.983 E.181
G1 X169.406 Y186.983
G1 X173.571 Y182.817 E.181
G1 X173.038 Y182.817
G1 X168.872 Y186.983 E.181
G1 X168.339 Y186.983
G1 X172.504 Y182.817 E.181
G1 X171.971 Y182.817
G1 X167.806 Y186.983 E.181
G1 X167.273 Y186.983
G1 X171.438 Y182.817 E.181
G1 X170.905 Y182.817
G1 X166.739 Y186.983 E.181
G1 X166.327 Y186.861
G1 X170.371 Y182.817 E.17573
G1 X169.838 Y182.817
G1 X166.327 Y186.328 E.15255
G1 X166.327 Y185.795
G1 X169.305 Y182.817 E.12938
G1 X168.771 Y182.817
G1 X166.327 Y185.261 E.10621
G1 X166.327 Y184.728
G1 X168.238 Y182.817 E.08303
G1 X167.705 Y182.817
G1 X166.327 Y184.195 E.05986
G1 X166.327 Y183.662
G1 X167.172 Y182.817 E.03669
M204 S10000
; WIPE_START
G1 F24000
G1 X166.327 Y183.662 E-.4537
G1 X166.327 Y184.195 E-.20264
G1 X166.52 Y184.002 E-.10365
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.4 I.914 J-.804 P1  F30000
G1 X65.7 Y69.41 Z10.4
G1 Z10
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
G1 F12000
G1 X65.7 Y187.19 E3.61905
G1 X61.12 Y187.19 E.14073
G1 X61.12 Y69.41 E3.61905
G1 X65.64 Y69.41 E.13889
M204 S10000
; WIPE_START
G1 F24000
G1 X65.641 Y71.41 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.4 I-1.217 J-.002 P1  F30000
G1 X65.493 Y186.375 Z10.4
G1 Z10
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
G1 F12000
G1 X64.885 Y186.983 E.02642
G1 X64.351 Y186.983
G1 X65.493 Y185.841 E.04959
G1 X65.493 Y185.308
G1 X63.818 Y186.983 E.07276
G1 X63.285 Y186.983
G1 X65.493 Y184.775 E.09594
G1 X65.493 Y184.242
G1 X62.752 Y186.983 E.11911
G1 X62.218 Y186.983
G1 X65.493 Y183.708 E.14228
G1 X65.493 Y183.175
G1 X61.685 Y186.983 E.16546
G1 X61.327 Y186.807
G1 X65.493 Y182.642 E.181
G1 X65.493 Y182.109
G1 X61.327 Y186.274 E.181
G1 X61.327 Y185.74
G1 X65.493 Y181.575 E.181
G1 X65.493 Y181.042
G1 X61.327 Y185.207 E.181
G1 X61.327 Y184.674
G1 X65.493 Y180.509 E.181
G1 X65.493 Y179.975
G1 X61.327 Y184.141 E.181
G1 X61.327 Y183.607
G1 X65.493 Y179.442 E.181
G1 X65.493 Y178.909
G1 X61.327 Y183.074 E.181
G1 X61.327 Y182.541
G1 X65.493 Y178.376 E.181
G1 X65.493 Y177.842
G1 X61.327 Y182.008 E.181
G1 X61.327 Y181.474
G1 X65.493 Y177.309 E.181
G1 X65.493 Y176.776
G1 X61.327 Y180.941 E.181
G1 X61.327 Y180.408
G1 X65.493 Y176.243 E.181
G1 X65.493 Y175.709
G1 X61.327 Y179.875 E.181
G1 X61.327 Y179.341
G1 X65.493 Y175.176 E.181
G1 X65.493 Y174.643
G1 X61.327 Y178.808 E.181
G1 X61.327 Y178.275
G1 X65.493 Y174.109 E.181
G1 X65.493 Y173.576
G1 X61.327 Y177.741 E.181
G1 X61.327 Y177.208
G1 X65.493 Y173.043 E.181
G1 X65.493 Y172.51
G1 X61.327 Y176.675 E.181
G1 X61.327 Y176.142
G1 X65.493 Y171.976 E.181
G1 X65.493 Y171.443
G1 X61.327 Y175.608 E.181
G1 X61.327 Y175.075
G1 X65.493 Y170.91 E.181
G1 X65.493 Y170.377
G1 X61.327 Y174.542 E.181
G1 X61.327 Y174.009
G1 X65.493 Y169.843 E.181
G1 X65.493 Y169.31
G1 X61.327 Y173.475 E.181
G1 X61.327 Y172.942
G1 X65.493 Y168.777 E.181
G1 X65.493 Y168.244
G1 X61.327 Y172.409 E.181
G1 X61.327 Y171.875
G1 X65.493 Y167.71 E.181
G1 X65.493 Y167.177
G1 X61.327 Y171.342 E.181
G1 X61.327 Y170.809
G1 X65.493 Y166.644 E.181
G1 X65.493 Y166.11
G1 X61.327 Y170.276 E.181
G1 X61.327 Y169.742
G1 X65.493 Y165.577 E.181
G1 X65.493 Y165.044
G1 X61.327 Y169.209 E.181
G1 X61.327 Y168.676
G1 X65.493 Y164.511 E.181
G1 X65.493 Y163.977
G1 X61.327 Y168.143 E.181
G1 X61.327 Y167.609
G1 X65.493 Y163.444 E.181
G1 X65.493 Y162.911
G1 X61.327 Y167.076 E.181
G1 X61.327 Y166.543
G1 X65.493 Y162.378 E.181
G1 X65.493 Y161.844
G1 X61.327 Y166.009 E.181
G1 X61.327 Y165.476
G1 X65.493 Y161.311 E.181
G1 X65.493 Y160.778
G1 X61.327 Y164.943 E.181
G1 X61.327 Y164.41
G1 X65.493 Y160.244 E.181
G1 X65.493 Y159.711
G1 X61.327 Y163.876 E.181
G1 X61.327 Y163.343
G1 X65.493 Y159.178 E.181
G1 X65.493 Y158.645
G1 X61.327 Y162.81 E.181
G1 X61.327 Y162.277
G1 X65.493 Y158.111 E.181
G1 X65.493 Y157.578
G1 X61.327 Y161.743 E.181
G1 X61.327 Y161.21
G1 X65.493 Y157.045 E.181
G1 X65.493 Y156.512
G1 X61.327 Y160.677 E.181
G1 X61.327 Y160.144
G1 X65.493 Y155.978 E.181
G1 X65.493 Y155.445
G1 X61.327 Y159.61 E.181
G1 X61.327 Y159.077
G1 X65.493 Y154.912 E.181
G1 X65.493 Y154.378
G1 X61.327 Y158.544 E.181
G1 X61.327 Y158.01
G1 X65.493 Y153.845 E.181
G1 X65.493 Y153.312
G1 X61.327 Y157.477 E.181
G1 X61.327 Y156.944
G1 X65.493 Y152.779 E.181
G1 X65.493 Y152.245
G1 X61.327 Y156.411 E.181
G1 X61.327 Y155.877
G1 X65.493 Y151.712 E.181
G1 X65.493 Y151.179
G1 X61.327 Y155.344 E.181
G1 X61.327 Y154.811
G1 X65.493 Y150.646 E.181
G1 X65.493 Y150.112
G1 X61.327 Y154.278 E.181
G1 X61.327 Y153.744
G1 X65.493 Y149.579 E.181
G1 X65.493 Y149.046
G1 X61.327 Y153.211 E.181
G1 X61.327 Y152.678
G1 X65.493 Y148.513 E.181
M73 P99 R0
G1 X65.493 Y147.979
G1 X61.327 Y152.144 E.181
G1 X61.327 Y151.611
G1 X65.493 Y147.446 E.181
G1 X65.493 Y146.913
G1 X61.327 Y151.078 E.181
G1 X61.327 Y150.545
G1 X65.493 Y146.379 E.181
G1 X65.493 Y145.846
G1 X61.327 Y150.011 E.181
G1 X61.327 Y149.478
G1 X65.493 Y145.313 E.181
G1 X65.493 Y144.78
G1 X61.327 Y148.945 E.181
G1 X61.327 Y148.412
G1 X65.493 Y144.246 E.181
G1 X65.493 Y143.713
G1 X61.327 Y147.878 E.181
G1 X61.327 Y147.345
G1 X65.493 Y143.18 E.181
G1 X65.493 Y142.647
G1 X61.327 Y146.812 E.181
G1 X61.327 Y146.278
G1 X65.493 Y142.113 E.181
G1 X65.493 Y141.58
G1 X61.327 Y145.745 E.181
G1 X61.327 Y145.212
G1 X65.493 Y141.047 E.181
G1 X65.493 Y140.513
G1 X61.327 Y144.679 E.181
G1 X61.327 Y144.145
G1 X65.493 Y139.98 E.181
G1 X65.493 Y139.447
G1 X61.327 Y143.612 E.181
G1 X61.327 Y143.079
G1 X65.493 Y138.914 E.181
G1 X65.493 Y138.38
G1 X61.327 Y142.546 E.181
G1 X61.327 Y142.012
G1 X65.493 Y137.847 E.181
G1 X65.493 Y137.314
G1 X61.327 Y141.479 E.181
G1 X61.327 Y140.946
G1 X65.493 Y136.781 E.181
G1 X65.493 Y136.247
G1 X61.327 Y140.413 E.181
G1 X61.327 Y139.879
G1 X65.493 Y135.714 E.181
G1 X65.493 Y135.181
G1 X61.327 Y139.346 E.181
G1 X61.327 Y138.813
G1 X65.493 Y134.647 E.181
G1 X65.493 Y134.114
G1 X61.327 Y138.279 E.181
G1 X61.327 Y137.746
G1 X65.493 Y133.581 E.181
G1 X65.493 Y133.048
G1 X61.327 Y137.213 E.181
G1 X61.327 Y136.68
G1 X65.493 Y132.514 E.181
G1 X65.493 Y131.981
G1 X61.327 Y136.146 E.181
G1 X61.327 Y135.613
G1 X65.493 Y131.448 E.181
G1 X65.493 Y130.915
G1 X61.327 Y135.08 E.181
G1 X61.327 Y134.547
G1 X65.493 Y130.381 E.181
G1 X65.493 Y129.848
G1 X61.327 Y134.013 E.181
G1 X61.327 Y133.48
G1 X65.493 Y129.315 E.181
G1 X65.493 Y128.782
G1 X61.327 Y132.947 E.181
G1 X61.327 Y132.413
G1 X65.493 Y128.248 E.181
G1 X65.493 Y127.715
G1 X61.327 Y131.88 E.181
G1 X61.327 Y131.347
G1 X65.493 Y127.182 E.181
G1 X65.493 Y126.648
G1 X61.327 Y130.814 E.181
G1 X61.327 Y130.28
G1 X65.493 Y126.115 E.181
G1 X65.493 Y125.582
G1 X61.327 Y129.747 E.181
G1 X61.327 Y129.214
G1 X65.493 Y125.049 E.181
G1 X65.493 Y124.515
G1 X61.327 Y128.681 E.181
G1 X61.327 Y128.147
G1 X65.493 Y123.982 E.181
G1 X65.493 Y123.449
G1 X61.327 Y127.614 E.181
G1 X61.327 Y127.081
G1 X65.493 Y122.916 E.181
G1 X65.493 Y122.382
G1 X61.327 Y126.547 E.181
G1 X61.327 Y126.014
G1 X65.493 Y121.849 E.181
G1 X65.493 Y121.316
G1 X61.327 Y125.481 E.181
G1 X61.327 Y124.948
G1 X65.493 Y120.782 E.181
G1 X65.493 Y120.249
G1 X61.327 Y124.414 E.181
G1 X61.327 Y123.881
G1 X65.493 Y119.716 E.181
G1 X65.493 Y119.183
G1 X61.327 Y123.348 E.181
G1 X61.327 Y122.815
G1 X65.493 Y118.649 E.181
G1 X65.493 Y118.116
G1 X61.327 Y122.281 E.181
G1 X61.327 Y121.748
G1 X65.493 Y117.583 E.181
G1 X65.493 Y117.05
G1 X61.327 Y121.215 E.181
G1 X61.327 Y120.682
G1 X65.493 Y116.516 E.181
G1 X65.493 Y115.983
G1 X61.327 Y120.148 E.181
G1 X61.327 Y119.615
G1 X65.493 Y115.45 E.181
G1 X65.493 Y114.916
G1 X61.327 Y119.082 E.181
G1 X61.327 Y118.548
G1 X65.493 Y114.383 E.181
G1 X65.493 Y113.85
G1 X61.327 Y118.015 E.181
G1 X61.327 Y117.482
G1 X65.493 Y113.317 E.181
G1 X65.493 Y112.783
G1 X61.327 Y116.949 E.181
G1 X61.327 Y116.415
G1 X65.493 Y112.25 E.181
G1 X65.493 Y111.717
G1 X61.327 Y115.882 E.181
G1 X61.327 Y115.349
G1 X65.493 Y111.184 E.181
G1 X65.493 Y110.65
G1 X61.327 Y114.816 E.181
G1 X61.327 Y114.282
G1 X65.493 Y110.117 E.181
G1 X65.493 Y109.584
G1 X61.327 Y113.749 E.181
G1 X61.327 Y113.216
G1 X65.493 Y109.051 E.181
G1 X65.493 Y108.517
G1 X61.327 Y112.682 E.181
G1 X61.327 Y112.149
G1 X65.493 Y107.984 E.181
G1 X65.493 Y107.451
G1 X61.327 Y111.616 E.181
G1 X61.327 Y111.083
G1 X65.493 Y106.917 E.181
G1 X65.493 Y106.384
G1 X61.327 Y110.549 E.181
G1 X61.327 Y110.016
G1 X65.493 Y105.851 E.181
G1 X65.493 Y105.318
G1 X61.327 Y109.483 E.181
G1 X61.327 Y108.95
G1 X65.493 Y104.784 E.181
G1 X65.493 Y104.251
G1 X61.327 Y108.416 E.181
G1 X61.327 Y107.883
G1 X65.493 Y103.718 E.181
G1 X65.493 Y103.185
G1 X61.327 Y107.35 E.181
G1 X61.327 Y106.816
G1 X65.493 Y102.651 E.181
G1 X65.493 Y102.118
G1 X61.327 Y106.283 E.181
G1 X61.327 Y105.75
G1 X65.493 Y101.585 E.181
G1 X65.493 Y101.051
G1 X61.327 Y105.217 E.181
G1 X61.327 Y104.683
G1 X65.493 Y100.518 E.181
G1 X65.493 Y99.985
G1 X61.327 Y104.15 E.181
G1 X61.327 Y103.617
G1 X65.493 Y99.452 E.181
G1 X65.493 Y98.918
G1 X61.327 Y103.084 E.181
G1 X61.327 Y102.55
G1 X65.493 Y98.385 E.181
G1 X65.493 Y97.852
G1 X61.327 Y102.017 E.181
G1 X61.327 Y101.484
G1 X65.493 Y97.319 E.181
G1 X65.493 Y96.785
G1 X61.327 Y100.951 E.181
G1 X61.327 Y100.417
G1 X65.493 Y96.252 E.181
G1 X65.493 Y95.719
G1 X61.327 Y99.884 E.181
G1 X61.327 Y99.351
G1 X65.493 Y95.185 E.181
G1 X65.493 Y94.652
G1 X61.327 Y98.817 E.181
G1 X61.327 Y98.284
G1 X65.493 Y94.119 E.181
G1 X65.493 Y93.586
G1 X61.327 Y97.751 E.181
G1 X61.327 Y97.218
G1 X65.493 Y93.052 E.181
G1 X65.493 Y92.519
G1 X61.327 Y96.684 E.181
G1 X61.327 Y96.151
G1 X65.493 Y91.986 E.181
G1 X65.493 Y91.453
G1 X61.327 Y95.618 E.181
G1 X61.327 Y95.085
G1 X65.493 Y90.919 E.181
G1 X65.493 Y90.386
G1 X61.327 Y94.551 E.181
G1 X61.327 Y94.018
G1 X65.493 Y89.853 E.181
G1 X65.493 Y89.32
G1 X61.327 Y93.485 E.181
G1 X61.327 Y92.951
G1 X65.493 Y88.786 E.181
G1 X65.493 Y88.253
G1 X61.327 Y92.418 E.181
G1 X61.327 Y91.885
G1 X65.493 Y87.72 E.181
G1 X65.493 Y87.186
G1 X61.327 Y91.352 E.181
G1 X61.327 Y90.818
G1 X65.493 Y86.653 E.181
G1 X65.493 Y86.12
G1 X61.327 Y90.285 E.181
G1 X61.327 Y89.752
G1 X65.493 Y85.587 E.181
G1 X65.493 Y85.053
G1 X61.327 Y89.219 E.181
G1 X61.327 Y88.685
G1 X65.493 Y84.52 E.181
G1 X65.493 Y83.987
G1 X61.327 Y88.152 E.181
G1 X61.327 Y87.619
G1 X65.493 Y83.454 E.181
G1 X65.493 Y82.92
G1 X61.327 Y87.086 E.181
G1 X61.327 Y86.552
G1 X65.493 Y82.387 E.181
G1 X65.493 Y81.854
G1 X61.327 Y86.019 E.181
G1 X61.327 Y85.486
G1 X65.493 Y81.32 E.181
G1 X65.493 Y80.787
G1 X61.327 Y84.952 E.181
G1 X61.327 Y84.419
G1 X65.493 Y80.254 E.181
G1 X65.493 Y79.721
G1 X61.327 Y83.886 E.181
G1 X61.327 Y83.353
G1 X65.493 Y79.187 E.181
G1 X65.493 Y78.654
G1 X61.327 Y82.819 E.181
G1 X61.327 Y82.286
G1 X65.493 Y78.121 E.181
G1 X65.493 Y77.588
G1 X61.327 Y81.753 E.181
G1 X61.327 Y81.22
G1 X65.493 Y77.054 E.181
G1 X65.493 Y76.521
G1 X61.327 Y80.686 E.181
G1 X61.327 Y80.153
G1 X65.493 Y75.988 E.181
G1 X65.493 Y75.455
G1 X61.327 Y79.62 E.181
G1 X61.327 Y79.086
G1 X65.493 Y74.921 E.181
G1 X65.493 Y74.388
G1 X61.327 Y78.553 E.181
G1 X61.327 Y78.02
G1 X65.493 Y73.855 E.181
G1 X65.493 Y73.321
G1 X61.327 Y77.487 E.181
G1 X61.327 Y76.953
G1 X65.493 Y72.788 E.181
G1 X65.493 Y72.255
G1 X61.327 Y76.42 E.181
G1 X61.327 Y75.887
G1 X65.493 Y71.722 E.181
G1 X65.493 Y71.188
G1 X61.327 Y75.354 E.181
G1 X61.327 Y74.82
G1 X65.493 Y70.655 E.181
G1 X65.493 Y70.122
G1 X61.327 Y74.287 E.181
G1 X61.327 Y73.754
G1 X65.464 Y69.617 E.17974
G1 X64.93 Y69.617
G1 X61.327 Y73.22 E.15657
G1 X61.327 Y72.687
G1 X64.397 Y69.617 E.1334
G1 X63.864 Y69.617
G1 X61.327 Y72.154 E.11023
G1 X61.327 Y71.621
G1 X63.331 Y69.617 E.08705
G1 X62.797 Y69.617
G1 X61.327 Y71.087 E.06388
G1 X61.327 Y70.554
G1 X62.264 Y69.617 E.04071
G1 X61.731 Y69.617
G1 X61.327 Y70.021 E.01753
M204 S10000
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F24000
G1 X61.731 Y69.617 E-.21682
G1 X62.264 Y69.617 E-.20264
G1 X61.63 Y70.251 E-.34053
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
G1 Z10.5 F900 ; lower z a little
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

    G1 Z110 F600
    G1 Z108

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

