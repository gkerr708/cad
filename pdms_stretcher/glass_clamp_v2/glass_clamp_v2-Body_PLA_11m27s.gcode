; HEADER_BLOCK_START
; BambuStudio 01.06.02.04
; model printing time: 5m 39s; total estimated time: 11m 27s
; total layer number: 30
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
M73 P38 R7
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

M73 P39 R6
G1 X70 F9000
M73 P41 R6
G1 X76 F15000
M73 P43 R6
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
M73 P44 R6
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
    G29 A X113.75 Y126.75 I33.1722 J20.0365
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
M73 P45 R6
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
; layer num/total_layer_count: 1/30
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
G1 X114.607 Y128.407 F30000
G1 Z.4
G1 Z.2
M73 P46 R6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
G1 X115.487 Y128.407 E.03276
G1 X140.221 Y130.107 E.92342
G1 X145.393 Y130.107 E.19265
G1 X145.393 Y130.393 E.01065
G1 X114.607 Y130.393 E1.14666
G1 X114.607 Y128.467 E.07173
; WIPE_START
G1 F24000
M73 P47 R6
G1 X115.487 Y128.407 E-.33504
G1 X116.602 Y128.484 E-.42496
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I.973 J-.731 P1  F30000
G1 X114.85 Y126.15 Z.6
G1 Z.2
M73 P47 R5
G1 E.8 F1800
; FEATURE: Outer wall
G1 F3000
G1 X114.85 Y127.95 E.06704
M73 P48 R5
G1 X115.502 Y127.95 E.0243
G1 X140.236 Y129.65 E.92342
G1 X145.85 Y129.65 E.20909
G1 X145.85 Y130.85 E.0447
G1 X114.15 Y130.85 E1.1807
G1 X114.15 Y125.15 E.2123
G1 X145.85 Y125.15 E1.1807
M73 P49 R5
G1 X145.85 Y126.15 E.03725
G1 X114.91 Y126.15 E1.1524
G1 X114.524 Y125.873 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.38301
G1 F3000
G1 X114.549 Y125.824 E.00151
; LINE_WIDTH: 0.431594
G1 X114.573 Y125.776 E.00172
; LINE_WIDTH: 0.480178
G1 X114.597 Y125.727 E.00194
; LINE_WIDTH: 0.528762
G1 X114.621 Y125.679 E.00215
; LINE_WIDTH: 0.557301
G1 X114.636 Y125.664 E.00085
; LINE_WIDTH: 0.58584
G1 X114.65 Y125.65 E.00089
G1 X145.621 Y125.65 E1.37021
; WIPE_START
G1 F24000
G1 X143.621 Y125.65 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-.674 J-1.013 P1  F30000
G1 X136.877 Y130.135 Z.6
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.10292
M73 P50 R5
G1 F3000
G1 X136.151 Y130.11 E.00355
; LINE_WIDTH: 0.150829
G1 X135.425 Y130.086 E.00639
; LINE_WIDTH: 0.198737
G1 X134.698 Y130.061 E.00923
; LINE_WIDTH: 0.246646
G1 X133.972 Y130.036 E.01207
; LINE_WIDTH: 0.294554
G1 X133.245 Y130.011 E.0149
; LINE_WIDTH: 0.342463
G1 X132.519 Y129.986 E.01774
; LINE_WIDTH: 0.390371
G1 X131.792 Y129.961 E.02058
; LINE_WIDTH: 0.43828
G1 X131.066 Y129.936 E.02342
; LINE_WIDTH: 0.486188
G1 X130.34 Y129.911 E.02625
; LINE_WIDTH: 0.534097
G1 X129.613 Y129.886 E.02909
; LINE_WIDTH: 0.582005
G1 X128.887 Y129.861 E.03193
; LINE_WIDTH: 0.629914
G1 X128.16 Y129.836 E.03477
; LINE_WIDTH: 0.677822
G1 X127.434 Y129.811 E.0376
; WIPE_START
G1 F24000
G1 X128.16 Y129.836 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I.31 J-1.177 P1  F30000
G1 X126.236 Y129.329 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.515836
G1 F6300
G1 X126.911 Y130.004 E.0368
G1 X126.243 Y130.004 E.02577
G1 X125.739 Y129.501 E.02743
G1 X125.021 Y129.452 E.02774
G1 X125.574 Y130.004 E.03012
G1 X124.905 Y130.004 E.02577
G1 X124.303 Y129.402 E.03281
M73 P51 R5
G1 X123.585 Y129.353 E.02774
G1 X124.236 Y130.004 E.0355
G1 X123.567 Y130.004 E.02577
G1 X122.867 Y129.304 E.03819
G1 X122.148 Y129.254 E.02774
G1 X122.898 Y130.004 E.04088
G1 X122.23 Y130.004 E.02577
G1 X121.43 Y129.205 E.04357
G1 X120.712 Y129.156 E.02774
G1 X121.561 Y130.004 E.04626
G1 X120.892 Y130.004 E.02577
G1 X119.994 Y129.106 E.04895
G1 X119.276 Y129.057 E.02774
G1 X120.223 Y130.004 E.05164
G1 X119.554 Y130.004 E.02577
G1 X118.558 Y129.008 E.05433
G1 X117.839 Y128.958 E.02774
G1 X118.886 Y130.004 E.05702
G1 X118.217 Y130.004 E.02577
G1 X117.121 Y128.909 E.05971
G1 X116.403 Y128.859 E.02774
G1 X117.548 Y130.004 E.0624
G1 X116.879 Y130.004 E.02577
G1 X115.685 Y128.81 E.06509
G2 X115.002 Y128.796 I-.447 J4.964 E.02636
G1 X116.21 Y130.004 E.06588
G1 X115.542 Y130.004 E.02577
G1 X114.79 Y129.253 E.04097
; WIPE_START
G1 F24000
G1 X115.542 Y130.004 E-.40399
G1 X116.21 Y130.004 E-.25415
G1 X116.021 Y129.815 E-.10186
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I.891 J-.829 P1  F30000
G1 X114.5 Y128.179 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.286982
G1 F3000
G1 X114.5 Y125.921 E.04489
G1 X114.524 Y125.873 E.00108
; WIPE_START
G1 F24000
G1 X114.5 Y125.921 E-.02064
G1 X114.5 Y127.867 E-.73936
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-1.215 J.067 P1  F30000
G1 X115.279 Y141.944 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
G1 X116.159 Y141.944 E.03276
G1 X140.893 Y143.644 E.92342
G1 X146.065 Y143.644 E.19265
G1 X146.065 Y143.929 E.01065
G1 X115.279 Y143.929 E1.14666
G1 X115.279 Y142.004 E.07173
; WIPE_START
G1 F24000
G1 X116.159 Y141.944 E-.33504
G1 X117.275 Y142.02 E-.42496
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I.973 J-.731 P1  F30000
G1 X115.522 Y139.686 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
G1 F3000
G1 X115.522 Y141.486 E.06704
G1 X116.175 Y141.486 E.0243
G1 X140.908 Y143.186 E.92342
G1 X146.522 Y143.186 E.20909
G1 X146.522 Y144.386 E.0447
G1 X114.822 Y144.386 E1.1807
G1 X114.822 Y138.686 E.2123
G1 X146.522 Y138.686 E1.1807
G1 X146.522 Y139.686 E.03725
G1 X115.582 Y139.686 E1.1524
G1 X115.197 Y139.409 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.38301
G1 F3000
G1 X115.221 Y139.361 E.00151
; LINE_WIDTH: 0.431594
G1 X115.245 Y139.312 E.00172
; LINE_WIDTH: 0.480178
G1 X115.269 Y139.264 E.00194
; LINE_WIDTH: 0.528762
M73 P52 R5
G1 X115.294 Y139.215 E.00215
; LINE_WIDTH: 0.557301
G1 X115.308 Y139.201 E.00085
; LINE_WIDTH: 0.58584
G1 X115.322 Y139.186 E.00089
G1 X146.294 Y139.186 E1.37021
; WIPE_START
G1 F24000
G1 X144.294 Y139.186 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-.674 J-1.013 P1  F30000
G1 X137.55 Y143.672 Z.6
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.10292
G1 F3000
G1 X136.823 Y143.647 E.00355
; LINE_WIDTH: 0.150829
G1 X136.097 Y143.622 E.00639
; LINE_WIDTH: 0.198737
G1 X135.37 Y143.597 E.00923
; LINE_WIDTH: 0.246646
G1 X134.644 Y143.572 E.01207
; LINE_WIDTH: 0.294554
G1 X133.918 Y143.547 E.0149
; LINE_WIDTH: 0.342463
G1 X133.191 Y143.522 E.01774
; LINE_WIDTH: 0.390371
G1 X132.465 Y143.497 E.02058
; LINE_WIDTH: 0.43828
G1 X131.738 Y143.472 E.02342
; LINE_WIDTH: 0.486188
G1 X131.012 Y143.447 E.02625
; LINE_WIDTH: 0.534097
G1 X130.285 Y143.423 E.02909
; LINE_WIDTH: 0.582005
G1 X129.559 Y143.398 E.03193
; LINE_WIDTH: 0.629914
G1 X128.833 Y143.373 E.03477
; LINE_WIDTH: 0.677822
G1 X128.106 Y143.348 E.0376
; WIPE_START
G1 F24000
G1 X128.833 Y143.373 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I.31 J-1.177 P1  F30000
G1 X126.908 Y142.866 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.515836
G1 F6300
G1 X127.584 Y143.541 E.0368
G1 X126.915 Y143.541 E.02577
G1 X126.411 Y143.038 E.02743
G1 X125.693 Y142.988 E.02774
G1 X126.246 Y143.541 E.03012
G1 X125.577 Y143.541 E.02577
G1 X124.975 Y142.939 E.03281
G1 X124.257 Y142.89 E.02774
G1 X124.908 Y143.541 E.0355
G1 X124.24 Y143.541 E.02577
G1 X123.539 Y142.84 E.03819
G1 X122.821 Y142.791 E.02774
G1 X123.571 Y143.541 E.04088
G1 X122.902 Y143.541 E.02577
G1 X122.103 Y142.742 E.04357
G1 X121.384 Y142.692 E.02774
G1 X122.233 Y143.541 E.04626
G1 X121.564 Y143.541 E.02577
G1 X120.666 Y142.643 E.04895
G1 X119.948 Y142.593 E.02774
M73 P53 R5
G1 X120.895 Y143.541 E.05164
G1 X120.227 Y143.541 E.02577
G1 X119.23 Y142.544 E.05433
G1 X118.512 Y142.495 E.02774
G1 X119.558 Y143.541 E.05702
G1 X118.889 Y143.541 E.02577
G1 X117.794 Y142.445 E.05971
G1 X117.075 Y142.396 E.02774
G1 X118.22 Y143.541 E.0624
G1 X117.551 Y143.541 E.02577
G1 X116.357 Y142.347 E.06509
G2 X115.674 Y142.332 I-.447 J4.964 E.02636
G1 X116.883 Y143.541 E.06588
G1 X116.214 Y143.541 E.02577
G1 X115.462 Y142.789 E.04097
; WIPE_START
G1 F24000
G1 X116.214 Y143.541 E-.40399
G1 X116.883 Y143.541 E-.25415
G1 X116.693 Y143.351 E-.10186
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I.891 J-.829 P1  F30000
G1 X115.172 Y141.715 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.286982
G1 F3000
G1 X115.172 Y139.458 E.04489
G1 X115.197 Y139.409 E.00108
M106 S252.45
M106 P2 S178
; CHANGE_LAYER
; Z_HEIGHT: 0.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X115.172 Y139.458 E-.02064
G1 X115.172 Y141.404 E-.73936
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 2/30
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
G3 Z.6 I1.216 J-.041 P1  F30000
G1 X114.648 Y125.948 Z.6
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6193
G1 X114.648 Y128.152 E.07312
G1 X115.495 Y128.152 E.02812
G1 X140.229 Y129.852 E.8224
G1 X145.648 Y129.852 E.17974
G1 X145.648 Y130.648 E.0264
G1 X114.352 Y130.648 E1.03814
G1 X114.352 Y125.352 E.17567
G1 X145.648 Y125.352 E1.03814
G1 X145.648 Y125.948 E.01977
G1 X114.708 Y125.948 E1.02634
G1 X115.04 Y126.34 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6193
G1 X115.04 Y127.76 E.04363
G1 X115.509 Y127.76 E.01441
G1 X140.243 Y129.46 E.7618
G1 X146.04 Y129.46 E.17813
G1 X146.04 Y131.04 E.04855
G1 X113.96 Y131.04 E.98573
G1 X113.96 Y124.96 E.18682
G1 X146.04 Y124.96 E.98573
G1 X146.04 Y126.34 E.0424
G1 X115.1 Y126.34 E.9507
M204 S10000
G1 X114.556 Y125.65 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F6193
G1 X145.444 Y125.65 E.47513
; WIPE_START
G1 F24000
G1 X143.444 Y125.65 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I-1.116 J.485 P1  F30000
G1 X145.444 Y130.25 Z.8
G1 Z.4
G1 E.8 F1800
; LINE_WIDTH: 0.431684
G1 F6193
G1 X140.209 Y130.25 E.16585
; LINE_WIDTH: 0.432142
G1 X139.511 Y130.226 E.02217
; LINE_WIDTH: 0.475922
G1 X138.812 Y130.202 E.02466
; LINE_WIDTH: 0.519701
G1 X138.114 Y130.178 E.02715
; LINE_WIDTH: 0.56348
G1 X137.415 Y130.154 E.02965
; LINE_WIDTH: 0.60726
G1 X136.717 Y130.13 E.03214
G1 X115.595 Y129.405 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.613588
G1 F6193
G1 X116.292 Y129.429 E.03241
; LINE_WIDTH: 0.564949
G1 X116.988 Y129.453 E.02965
; LINE_WIDTH: 0.51631
G1 X117.685 Y129.477 E.02688
; LINE_WIDTH: 0.467671
G1 X118.381 Y129.501 E.02412
; LINE_WIDTH: 0.419032
G1 X119.078 Y129.524 E.02136
G1 X126.152 Y129.767 F30000
; LINE_WIDTH: 0.642978
G1 F6193
G1 X126.804 Y129.79 E.03189
; LINE_WIDTH: 0.597548
G1 X127.456 Y129.812 E.02947
; LINE_WIDTH: 0.552118
G1 X128.108 Y129.834 E.02706
; LINE_WIDTH: 0.506687
G1 X128.76 Y129.857 E.02465
; LINE_WIDTH: 0.461257
G1 X129.411 Y129.879 E.02223
; LINE_WIDTH: 0.415827
G1 X130.063 Y129.902 E.01982
G1 X126.152 Y129.767 F30000
; LINE_WIDTH: 0.642978
G1 F6193
G1 X126.088 Y129.739 E.00346
; LINE_WIDTH: 0.595261
G1 X126.023 Y129.711 E.00319
; LINE_WIDTH: 0.547543
G1 X125.958 Y129.682 E.00291
; LINE_WIDTH: 0.499825
G1 X125.893 Y129.654 E.00263
; LINE_WIDTH: 0.452107
G1 X125.828 Y129.625 E.00236
; LINE_WIDTH: 0.404389
G1 X125.763 Y129.597 E.00208
; LINE_WIDTH: 0.356671
G1 X124.522 Y129.533 E.03179
; LINE_WIDTH: 0.39934
G1 X123.28 Y129.469 E.03611
; LINE_WIDTH: 0.442009
G1 X122.039 Y129.405 E.04043
; LINE_WIDTH: 0.484677
G1 X120.797 Y129.341 E.04475
; LINE_WIDTH: 0.527346
G1 X119.555 Y129.277 E.04908
; LINE_WIDTH: 0.570014
G1 X119.457 Y129.252 E.00437
; LINE_WIDTH: 0.532511
G1 X119.359 Y129.226 E.00406
; LINE_WIDTH: 0.495007
G1 X119.26 Y129.201 E.00375
; LINE_WIDTH: 0.420417
M73 P54 R5
G1 X119.162 Y129.175 E.00313
G1 X115.469 Y128.921 E.11386
G1 X115.121 Y128.921 E.0107
G1 X115.121 Y129.879 E.02945
G1 X119.138 Y129.879 E.12355
; LINE_WIDTH: 0.419999
G1 X119.238 Y129.86 E.00312
; LINE_WIDTH: 0.457503
G1 X119.338 Y129.841 E.00344
; LINE_WIDTH: 0.495007
G1 X119.437 Y129.823 E.00375
; LINE_WIDTH: 0.532511
G1 X119.537 Y129.804 E.00406
; LINE_WIDTH: 0.570014
G1 X120.78 Y129.825 E.0534
; LINE_WIDTH: 0.527346
G1 X122.024 Y129.846 E.04908
; LINE_WIDTH: 0.484677
G1 X123.267 Y129.868 E.04475
; LINE_WIDTH: 0.442009
G1 X124.51 Y129.889 E.04043
; LINE_WIDTH: 0.39934
G1 X125.753 Y129.91 E.03611
; LINE_WIDTH: 0.356671
G1 X125.81 Y129.89 E.00155
; LINE_WIDTH: 0.404389
G1 X125.867 Y129.869 E.00179
; LINE_WIDTH: 0.452107
G1 X125.924 Y129.849 E.00203
; LINE_WIDTH: 0.499825
G1 X125.982 Y129.828 E.00226
; LINE_WIDTH: 0.547543
G1 X126.039 Y129.808 E.0025
; LINE_WIDTH: 0.595261
G1 X126.096 Y129.788 E.00274
G1 X130.147 Y129.552 F30000
; LINE_WIDTH: 0.419999
G1 F6193
G1 X115.482 Y128.544 E.45168
G1 X114.744 Y128.544 E.02267
G1 X114.744 Y130.256 E.0526
G1 X130.123 Y130.256 E.47255
G1 X130.223 Y130.237 E.00312
; LINE_WIDTH: 0.457504
G1 X130.323 Y130.218 E.00344
; LINE_WIDTH: 0.495008
G1 X130.423 Y130.2 E.00375
; LINE_WIDTH: 0.532512
G1 X130.523 Y130.181 E.00406
; LINE_WIDTH: 0.570016
G1 X131.937 Y130.205 E.06076
; LINE_WIDTH: 0.521465
G1 X133.352 Y130.229 E.05516
; LINE_WIDTH: 0.472913
G1 X134.766 Y130.254 E.04957
; LINE_WIDTH: 0.409185
G2 X136.341 Y130.278 I1.495 J-45.878 E.04702
G1 X136.352 Y129.956 E.0096
G1 X136.192 Y129.945 E.0048
; LINE_WIDTH: 0.37581
G1 X134.779 Y129.873 E.03837
; LINE_WIDTH: 0.424362
G1 X133.366 Y129.8 E.04397
; LINE_WIDTH: 0.472913
G1 X131.954 Y129.727 E.04957
; LINE_WIDTH: 0.521465
G1 X130.541 Y129.654 E.05516
; LINE_WIDTH: 0.570016
G1 X130.457 Y129.633 E.00372
; LINE_WIDTH: 0.532512
G1 X130.373 Y129.611 E.00346
; LINE_WIDTH: 0.495008
G1 X130.289 Y129.589 E.00319
; LINE_WIDTH: 0.457504
G1 X130.205 Y129.567 E.00293
; WIPE_START
G1 F24000
G1 X130.289 Y129.589 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I-.671 J-1.015 P1  F30000
G1 X115.32 Y139.484 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6193
G1 X115.32 Y141.689 E.07312
G1 X116.168 Y141.689 E.02812
G1 X140.902 Y143.389 E.8224
G1 X146.32 Y143.389 E.17974
G1 X146.32 Y144.184 E.0264
G1 X115.024 Y144.184 E1.03814
G1 X115.024 Y138.889 E.17567
G1 X146.32 Y138.889 E1.03814
G1 X146.32 Y139.484 E.01977
G1 X115.38 Y139.484 E1.02634
G1 X115.712 Y139.876 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6193
G1 X115.712 Y141.296 E.04363
G1 X116.181 Y141.296 E.01441
G1 X140.915 Y142.996 E.7618
G1 X146.712 Y142.996 E.17813
G1 X146.712 Y144.576 E.04855
G1 X114.632 Y144.576 E.98573
G1 X114.632 Y138.496 E.18682
G1 X146.712 Y138.496 E.98573
G1 X146.712 Y139.876 E.0424
G1 X115.772 Y139.876 E.9507
M204 S10000
G1 X115.228 Y139.186 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F6193
G1 X146.117 Y139.186 E.47513
; WIPE_START
G1 F24000
G1 X144.117 Y139.186 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I-1.116 J.485 P1  F30000
G1 X146.117 Y143.786 Z.8
G1 Z.4
G1 E.8 F1800
; LINE_WIDTH: 0.431684
G1 F6193
G1 X140.881 Y143.786 E.16585
; LINE_WIDTH: 0.432142
G1 X140.183 Y143.762 E.02217
; LINE_WIDTH: 0.475922
G1 X139.484 Y143.738 E.02466
; LINE_WIDTH: 0.519701
G1 X138.786 Y143.714 E.02715
; LINE_WIDTH: 0.56348
G1 X138.087 Y143.69 E.02965
; LINE_WIDTH: 0.60726
G1 X137.389 Y143.666 E.03214
G1 X116.267 Y142.941 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.613588
G1 F6193
G1 X116.964 Y142.965 E.03241
; LINE_WIDTH: 0.564949
G1 X117.66 Y142.989 E.02965
; LINE_WIDTH: 0.51631
G1 X118.357 Y143.013 E.02688
; LINE_WIDTH: 0.467671
G1 X119.053 Y143.037 E.02412
; LINE_WIDTH: 0.419032
G1 X119.75 Y143.061 E.02136
G1 X126.825 Y143.304 F30000
; LINE_WIDTH: 0.642978
G1 F6193
G1 X127.476 Y143.326 E.03189
; LINE_WIDTH: 0.597548
G1 X128.128 Y143.349 E.02947
; LINE_WIDTH: 0.552118
G1 X128.78 Y143.371 E.02706
; LINE_WIDTH: 0.506687
G1 X129.432 Y143.393 E.02465
; LINE_WIDTH: 0.461257
G1 X130.084 Y143.416 E.02223
; LINE_WIDTH: 0.415827
G1 X130.735 Y143.438 E.01982
G1 X126.825 Y143.304 F30000
; LINE_WIDTH: 0.642978
G1 F6193
G1 X126.76 Y143.275 E.00346
; LINE_WIDTH: 0.595261
G1 X126.695 Y143.247 E.00319
; LINE_WIDTH: 0.547543
G1 X126.63 Y143.219 E.00291
; LINE_WIDTH: 0.499825
G1 X126.565 Y143.19 E.00263
; LINE_WIDTH: 0.452107
G1 X126.501 Y143.162 E.00236
; LINE_WIDTH: 0.404389
G1 X126.436 Y143.134 E.00208
; LINE_WIDTH: 0.356671
G1 X125.194 Y143.07 E.03179
; LINE_WIDTH: 0.39934
G1 X123.952 Y143.006 E.03611
; LINE_WIDTH: 0.442009
G1 X122.711 Y142.942 E.04043
; LINE_WIDTH: 0.484677
G1 X121.469 Y142.878 E.04475
; LINE_WIDTH: 0.527346
G1 X120.228 Y142.814 E.04908
; LINE_WIDTH: 0.570014
G1 X120.129 Y142.788 E.00437
; LINE_WIDTH: 0.532511
G1 X120.031 Y142.763 E.00406
; LINE_WIDTH: 0.495007
G1 X119.932 Y142.737 E.00375
; LINE_WIDTH: 0.420417
G1 X119.834 Y142.712 E.00313
G1 X116.141 Y142.458 E.11386
G1 X115.793 Y142.458 E.0107
G1 X115.793 Y143.415 E.02945
G1 X119.81 Y143.415 E.12355
; LINE_WIDTH: 0.419999
G1 X119.91 Y143.397 E.00312
; LINE_WIDTH: 0.457503
G1 X120.01 Y143.378 E.00344
; LINE_WIDTH: 0.495007
G1 X120.11 Y143.359 E.00375
; LINE_WIDTH: 0.532511
G1 X120.21 Y143.34 E.00406
; LINE_WIDTH: 0.570014
G1 X121.453 Y143.362 E.0534
; LINE_WIDTH: 0.527346
G1 X122.696 Y143.383 E.04908
; LINE_WIDTH: 0.484677
G1 X123.939 Y143.404 E.04475
; LINE_WIDTH: 0.442009
G1 X125.182 Y143.426 E.04043
; LINE_WIDTH: 0.39934
G1 X126.425 Y143.447 E.03611
; LINE_WIDTH: 0.356671
G1 X126.482 Y143.426 E.00155
; LINE_WIDTH: 0.404389
G1 X126.539 Y143.406 E.00179
; LINE_WIDTH: 0.452107
G1 X126.597 Y143.385 E.00203
; LINE_WIDTH: 0.499825
G1 X126.654 Y143.365 E.00226
; LINE_WIDTH: 0.547543
G1 X126.711 Y143.344 E.0025
; LINE_WIDTH: 0.595261
G1 X126.768 Y143.324 E.00274
G1 X130.819 Y143.089 F30000
; LINE_WIDTH: 0.419999
G1 F6193
G1 X116.154 Y142.081 E.45168
G1 X115.416 Y142.081 E.02267
G1 X115.416 Y143.792 E.0526
G1 X130.795 Y143.792 E.47255
G1 X130.895 Y143.774 E.00312
; LINE_WIDTH: 0.457504
G1 X130.995 Y143.755 E.00344
; LINE_WIDTH: 0.495008
G1 X131.095 Y143.736 E.00375
; LINE_WIDTH: 0.532512
G1 X131.195 Y143.717 E.00406
; LINE_WIDTH: 0.570016
G1 X132.609 Y143.742 E.06076
; LINE_WIDTH: 0.521465
G1 X134.024 Y143.766 E.05516
; LINE_WIDTH: 0.472913
G1 X135.438 Y143.79 E.04957
; LINE_WIDTH: 0.409185
G2 X137.014 Y143.814 I1.495 J-45.878 E.04702
G1 X137.025 Y143.493 E.0096
G1 X136.864 Y143.482 E.0048
; LINE_WIDTH: 0.37581
G1 X135.451 Y143.409 E.03837
; LINE_WIDTH: 0.424362
G1 X134.039 Y143.336 E.04397
; LINE_WIDTH: 0.472913
G1 X132.626 Y143.264 E.04957
; LINE_WIDTH: 0.521465
G1 X131.213 Y143.191 E.05516
; LINE_WIDTH: 0.570016
G1 X131.129 Y143.169 E.00372
; LINE_WIDTH: 0.532512
G1 X131.045 Y143.147 E.00346
; LINE_WIDTH: 0.495008
G1 X130.961 Y143.125 E.00319
; LINE_WIDTH: 0.457504
G1 X130.877 Y143.104 E.00293
; CHANGE_LAYER
; Z_HEIGHT: 0.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X130.961 Y143.125 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 3/30
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
G3 Z.8 I.882 J-.838 P1  F30000
G1 X114.648 Y125.948 Z.8
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6203
G1 X114.648 Y128.152 E.07312
G1 X115.495 Y128.152 E.02812
G1 X140.229 Y129.852 E.8224
G1 X145.648 Y129.852 E.17974
G1 X145.648 Y130.648 E.0264
G1 X114.352 Y130.648 E1.03814
G1 X114.352 Y125.352 E.17567
G1 X145.648 Y125.352 E1.03814
G1 X145.648 Y125.948 E.01977
G1 X114.708 Y125.948 E1.02634
G1 X115.04 Y126.34 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6203
M73 P55 R5
G1 X115.04 Y127.76 E.04363
G1 X115.509 Y127.76 E.01441
G1 X140.243 Y129.46 E.7618
G1 X146.04 Y129.46 E.17813
G1 X146.04 Y131.04 E.04855
G1 X113.96 Y131.04 E.98573
G1 X113.96 Y124.96 E.18682
G1 X146.04 Y124.96 E.98573
G1 X146.04 Y126.34 E.0424
G1 X115.1 Y126.34 E.9507
M204 S10000
G1 X114.556 Y125.65 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F6203
G1 X145.444 Y125.65 E.47513
; WIPE_START
G1 F24000
G1 X143.444 Y125.65 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I-1.116 J.485 P1  F30000
G1 X145.444 Y130.25 Z1
G1 Z.6
G1 E.8 F1800
; LINE_WIDTH: 0.431684
G1 F6203
G1 X140.209 Y130.25 E.16585
; LINE_WIDTH: 0.432142
G1 X139.511 Y130.226 E.02217
; LINE_WIDTH: 0.475922
G1 X138.812 Y130.202 E.02466
; LINE_WIDTH: 0.519701
G1 X138.114 Y130.178 E.02715
; LINE_WIDTH: 0.56348
G1 X137.415 Y130.154 E.02965
; LINE_WIDTH: 0.60726
G1 X136.717 Y130.13 E.03214
G1 X115.595 Y129.405 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.613588
G1 F6203
G1 X116.292 Y129.429 E.03241
; LINE_WIDTH: 0.564949
G1 X116.988 Y129.453 E.02965
; LINE_WIDTH: 0.51631
G1 X117.685 Y129.477 E.02688
; LINE_WIDTH: 0.467671
G1 X118.381 Y129.501 E.02412
; LINE_WIDTH: 0.419032
G1 X119.078 Y129.524 E.02136
G1 X126.152 Y129.767 F30000
; LINE_WIDTH: 0.642978
G1 F6203
G1 X126.804 Y129.79 E.03189
; LINE_WIDTH: 0.597548
G1 X127.456 Y129.812 E.02947
; LINE_WIDTH: 0.552118
G1 X128.108 Y129.834 E.02706
; LINE_WIDTH: 0.506687
G1 X128.76 Y129.857 E.02465
; LINE_WIDTH: 0.461257
G1 X129.411 Y129.879 E.02223
; LINE_WIDTH: 0.415827
G1 X130.063 Y129.902 E.01982
G1 X126.152 Y129.767 F30000
; LINE_WIDTH: 0.642978
G1 F6203
G1 X126.088 Y129.739 E.00346
; LINE_WIDTH: 0.595261
G1 X126.023 Y129.711 E.00319
; LINE_WIDTH: 0.547543
G1 X125.958 Y129.682 E.00291
; LINE_WIDTH: 0.499825
G1 X125.893 Y129.654 E.00263
; LINE_WIDTH: 0.452107
G1 X125.828 Y129.625 E.00236
; LINE_WIDTH: 0.404389
G1 X125.763 Y129.597 E.00208
; LINE_WIDTH: 0.356671
G1 X124.522 Y129.533 E.03179
; LINE_WIDTH: 0.39934
G1 X123.28 Y129.469 E.03611
; LINE_WIDTH: 0.442009
G1 X122.039 Y129.405 E.04043
; LINE_WIDTH: 0.484677
G1 X120.797 Y129.341 E.04475
; LINE_WIDTH: 0.527346
G1 X119.555 Y129.277 E.04908
; LINE_WIDTH: 0.570014
G1 X119.457 Y129.252 E.00437
; LINE_WIDTH: 0.532511
G1 X119.359 Y129.226 E.00406
; LINE_WIDTH: 0.495007
G1 X119.26 Y129.201 E.00375
; LINE_WIDTH: 0.420417
G1 X119.162 Y129.175 E.00313
G1 X115.469 Y128.921 E.11386
G1 X115.121 Y128.921 E.0107
G1 X115.121 Y129.879 E.02945
G1 X119.138 Y129.879 E.12355
; LINE_WIDTH: 0.419999
G1 X119.238 Y129.86 E.00312
; LINE_WIDTH: 0.457503
G1 X119.338 Y129.841 E.00344
; LINE_WIDTH: 0.495007
G1 X119.437 Y129.823 E.00375
; LINE_WIDTH: 0.532511
G1 X119.537 Y129.804 E.00406
; LINE_WIDTH: 0.570014
G1 X120.78 Y129.825 E.0534
; LINE_WIDTH: 0.527346
G1 X122.024 Y129.846 E.04908
; LINE_WIDTH: 0.484677
G1 X123.267 Y129.868 E.04475
; LINE_WIDTH: 0.442009
G1 X124.51 Y129.889 E.04043
; LINE_WIDTH: 0.39934
G1 X125.753 Y129.91 E.03611
; LINE_WIDTH: 0.356671
G1 X125.81 Y129.89 E.00155
; LINE_WIDTH: 0.404389
G1 X125.867 Y129.869 E.00179
; LINE_WIDTH: 0.452107
G1 X125.924 Y129.849 E.00203
; LINE_WIDTH: 0.499825
G1 X125.982 Y129.828 E.00226
; LINE_WIDTH: 0.547543
G1 X126.039 Y129.808 E.0025
; LINE_WIDTH: 0.595261
G1 X126.096 Y129.788 E.00274
G1 X130.147 Y129.552 F30000
; LINE_WIDTH: 0.419999
G1 F6203
G1 X115.482 Y128.544 E.45168
G1 X114.744 Y128.544 E.02267
G1 X114.744 Y130.256 E.0526
G1 X130.123 Y130.256 E.47255
G1 X130.223 Y130.237 E.00312
; LINE_WIDTH: 0.457504
G1 X130.323 Y130.218 E.00344
; LINE_WIDTH: 0.495008
G1 X130.423 Y130.2 E.00375
; LINE_WIDTH: 0.532512
G1 X130.523 Y130.181 E.00406
; LINE_WIDTH: 0.570016
G1 X131.937 Y130.205 E.06076
; LINE_WIDTH: 0.521465
G1 X133.352 Y130.229 E.05516
; LINE_WIDTH: 0.472913
G1 X134.766 Y130.254 E.04957
; LINE_WIDTH: 0.409185
G2 X136.341 Y130.278 I1.495 J-45.878 E.04702
G1 X136.352 Y129.956 E.0096
G1 X136.192 Y129.945 E.0048
; LINE_WIDTH: 0.37581
G1 X134.779 Y129.873 E.03837
; LINE_WIDTH: 0.424362
G1 X133.366 Y129.8 E.04397
; LINE_WIDTH: 0.472913
G1 X131.954 Y129.727 E.04957
; LINE_WIDTH: 0.521465
G1 X130.541 Y129.654 E.05516
; LINE_WIDTH: 0.570016
G1 X130.457 Y129.633 E.00372
; LINE_WIDTH: 0.532512
G1 X130.373 Y129.611 E.00346
; LINE_WIDTH: 0.495008
G1 X130.289 Y129.589 E.00319
; LINE_WIDTH: 0.457504
G1 X130.205 Y129.567 E.00293
; WIPE_START
G1 F24000
G1 X130.289 Y129.589 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I-.671 J-1.015 P1  F30000
G1 X115.32 Y139.484 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6203
G1 X115.32 Y141.689 E.07312
G1 X116.168 Y141.689 E.02812
G1 X140.902 Y143.389 E.8224
G1 X146.32 Y143.389 E.17974
G1 X146.32 Y144.184 E.0264
G1 X115.024 Y144.184 E1.03814
G1 X115.024 Y138.889 E.17567
G1 X146.32 Y138.889 E1.03814
G1 X146.32 Y139.484 E.01977
G1 X115.38 Y139.484 E1.02634
G1 X115.712 Y139.876 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6203
G1 X115.712 Y141.296 E.04363
G1 X116.181 Y141.296 E.01441
G1 X140.915 Y142.996 E.7618
G1 X146.712 Y142.996 E.17813
G1 X146.712 Y144.576 E.04855
G1 X114.632 Y144.576 E.98573
G1 X114.632 Y138.496 E.18682
G1 X146.712 Y138.496 E.98573
G1 X146.712 Y139.876 E.0424
G1 X115.772 Y139.876 E.9507
M204 S10000
G1 X115.228 Y139.186 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F6203
G1 X146.117 Y139.186 E.47513
; WIPE_START
G1 F24000
G1 X144.117 Y139.186 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I-1.116 J.485 P1  F30000
G1 X146.117 Y143.786 Z1
G1 Z.6
G1 E.8 F1800
; LINE_WIDTH: 0.431684
G1 F6203
G1 X140.881 Y143.786 E.16585
; LINE_WIDTH: 0.432142
G1 X140.183 Y143.762 E.02217
; LINE_WIDTH: 0.475922
G1 X139.484 Y143.738 E.02466
; LINE_WIDTH: 0.519701
G1 X138.786 Y143.714 E.02715
; LINE_WIDTH: 0.56348
G1 X138.087 Y143.69 E.02965
; LINE_WIDTH: 0.60726
G1 X137.389 Y143.666 E.03214
G1 X116.267 Y142.941 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.613588
G1 F6203
G1 X116.964 Y142.965 E.03241
; LINE_WIDTH: 0.564949
G1 X117.66 Y142.989 E.02965
; LINE_WIDTH: 0.51631
G1 X118.357 Y143.013 E.02688
; LINE_WIDTH: 0.467671
G1 X119.053 Y143.037 E.02412
; LINE_WIDTH: 0.419032
G1 X119.75 Y143.061 E.02136
G1 X126.825 Y143.304 F30000
; LINE_WIDTH: 0.642978
G1 F6203
G1 X127.476 Y143.326 E.03189
; LINE_WIDTH: 0.597548
G1 X128.128 Y143.349 E.02947
; LINE_WIDTH: 0.552118
G1 X128.78 Y143.371 E.02706
; LINE_WIDTH: 0.506687
G1 X129.432 Y143.393 E.02465
; LINE_WIDTH: 0.461257
G1 X130.084 Y143.416 E.02223
; LINE_WIDTH: 0.415827
G1 X130.735 Y143.438 E.01982
G1 X126.825 Y143.304 F30000
; LINE_WIDTH: 0.642978
G1 F6203
G1 X126.76 Y143.275 E.00346
; LINE_WIDTH: 0.595261
G1 X126.695 Y143.247 E.00319
; LINE_WIDTH: 0.547543
G1 X126.63 Y143.219 E.00291
; LINE_WIDTH: 0.499825
G1 X126.565 Y143.19 E.00263
; LINE_WIDTH: 0.452107
G1 X126.501 Y143.162 E.00236
; LINE_WIDTH: 0.404389
G1 X126.436 Y143.134 E.00208
; LINE_WIDTH: 0.356671
M73 P56 R5
G1 X125.194 Y143.07 E.03179
; LINE_WIDTH: 0.39934
G1 X123.952 Y143.006 E.03611
; LINE_WIDTH: 0.442009
G1 X122.711 Y142.942 E.04043
; LINE_WIDTH: 0.484677
G1 X121.469 Y142.878 E.04475
; LINE_WIDTH: 0.527346
G1 X120.228 Y142.814 E.04908
; LINE_WIDTH: 0.570014
G1 X120.129 Y142.788 E.00437
; LINE_WIDTH: 0.532511
G1 X120.031 Y142.763 E.00406
; LINE_WIDTH: 0.495007
G1 X119.932 Y142.737 E.00375
; LINE_WIDTH: 0.420417
G1 X119.834 Y142.712 E.00313
G1 X116.141 Y142.458 E.11386
G1 X115.793 Y142.458 E.0107
G1 X115.793 Y143.415 E.02945
G1 X119.81 Y143.415 E.12355
; LINE_WIDTH: 0.419999
G1 X119.91 Y143.397 E.00312
; LINE_WIDTH: 0.457503
G1 X120.01 Y143.378 E.00344
; LINE_WIDTH: 0.495007
G1 X120.11 Y143.359 E.00375
; LINE_WIDTH: 0.532511
G1 X120.21 Y143.34 E.00406
; LINE_WIDTH: 0.570014
G1 X121.453 Y143.362 E.0534
; LINE_WIDTH: 0.527346
G1 X122.696 Y143.383 E.04908
; LINE_WIDTH: 0.484677
G1 X123.939 Y143.404 E.04475
; LINE_WIDTH: 0.442009
G1 X125.182 Y143.426 E.04043
; LINE_WIDTH: 0.39934
G1 X126.425 Y143.447 E.03611
; LINE_WIDTH: 0.356671
G1 X126.482 Y143.426 E.00155
; LINE_WIDTH: 0.404389
G1 X126.539 Y143.406 E.00179
; LINE_WIDTH: 0.452107
G1 X126.597 Y143.385 E.00203
; LINE_WIDTH: 0.499825
G1 X126.654 Y143.365 E.00226
; LINE_WIDTH: 0.547543
G1 X126.711 Y143.344 E.0025
; LINE_WIDTH: 0.595261
G1 X126.768 Y143.324 E.00274
G1 X130.819 Y143.089 F30000
; LINE_WIDTH: 0.419999
G1 F6203
G1 X116.154 Y142.081 E.45168
G1 X115.416 Y142.081 E.02267
G1 X115.416 Y143.792 E.0526
G1 X130.795 Y143.792 E.47255
G1 X130.895 Y143.774 E.00312
; LINE_WIDTH: 0.457504
G1 X130.995 Y143.755 E.00344
; LINE_WIDTH: 0.495008
G1 X131.095 Y143.736 E.00375
; LINE_WIDTH: 0.532512
G1 X131.195 Y143.717 E.00406
; LINE_WIDTH: 0.570016
G1 X132.609 Y143.742 E.06076
; LINE_WIDTH: 0.521465
G1 X134.024 Y143.766 E.05516
; LINE_WIDTH: 0.472913
G1 X135.438 Y143.79 E.04957
; LINE_WIDTH: 0.409185
G2 X137.014 Y143.814 I1.495 J-45.878 E.04702
G1 X137.025 Y143.493 E.0096
G1 X136.864 Y143.482 E.0048
; LINE_WIDTH: 0.37581
G1 X135.451 Y143.409 E.03837
; LINE_WIDTH: 0.424362
G1 X134.039 Y143.336 E.04397
; LINE_WIDTH: 0.472913
G1 X132.626 Y143.264 E.04957
; LINE_WIDTH: 0.521465
G1 X131.213 Y143.191 E.05516
; LINE_WIDTH: 0.570016
G1 X131.129 Y143.169 E.00372
; LINE_WIDTH: 0.532512
G1 X131.045 Y143.147 E.00346
; LINE_WIDTH: 0.495008
G1 X130.961 Y143.125 E.00319
; LINE_WIDTH: 0.457504
G1 X130.877 Y143.104 E.00293
; CHANGE_LAYER
; Z_HEIGHT: 0.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X130.961 Y143.125 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 4/30
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
G3 Z1 I.882 J-.838 P1  F30000
G1 X114.648 Y125.948 Z1
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5295
G1 X114.648 Y128.152 E.07312
G1 X115.495 Y128.152 E.02812
G1 X140.229 Y129.852 E.8224
G1 X145.648 Y129.852 E.17974
G1 X145.648 Y130.648 E.0264
G1 X114.352 Y130.648 E1.03814
G1 X114.352 Y125.352 E.17567
G1 X145.648 Y125.352 E1.03814
G1 X145.648 Y125.948 E.01977
G1 X114.708 Y125.948 E1.02634
G1 X115.04 Y126.34 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5295
G1 X115.04 Y127.76 E.04363
G1 X115.509 Y127.76 E.01441
G1 X140.243 Y129.46 E.7618
G1 X146.04 Y129.46 E.17813
G1 X146.04 Y131.04 E.04855
G1 X113.96 Y131.04 E.98573
G1 X113.96 Y124.96 E.18682
G1 X146.04 Y124.96 E.98573
G1 X146.04 Y126.34 E.0424
G1 X115.1 Y126.34 E.9507
M204 S10000
G1 X114.556 Y125.65 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5295
G1 X145.444 Y125.65 E.47513
; WIPE_START
G1 F24000
G1 X143.444 Y125.65 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I-1.116 J.485 P1  F30000
G1 X145.444 Y130.25 Z1.2
G1 Z.8
G1 E.8 F1800
; LINE_WIDTH: 0.431684
G1 F5295
G1 X140.209 Y130.25 E.16585
; LINE_WIDTH: 0.432142
G1 X139.511 Y130.226 E.02217
; LINE_WIDTH: 0.475922
G1 X138.812 Y130.202 E.02466
; LINE_WIDTH: 0.519701
G1 X138.114 Y130.178 E.02715
; LINE_WIDTH: 0.56348
G1 X137.415 Y130.154 E.02965
; LINE_WIDTH: 0.60726
G1 X136.717 Y130.13 E.03214
G1 X134.156 Y129.784 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5295
G1 X135.781 Y129.895 E.05401
G1 X135.376 Y130.3 E.01896
G1 X132.3 Y130.3 E.10206
G1 X131.609 Y129.609 E.03242
G1 X128.598 Y129.402 E.1001
M73 P56 R4
G1 X127.7 Y130.3 E.04212
G1 X124.624 Y130.3 E.10206
G1 X123.366 Y129.042 E.05899
G1 X121.416 Y128.908 E.06485
G1 X120.024 Y130.3 E.06528
G1 X116.948 Y130.3 E.10206
G1 X115.148 Y128.5 E.08441
G3 X116.774 Y128.589 I.168 J11.868 E.05404
; WIPE_START
G1 F24000
G1 X115.148 Y128.5 E-.61852
G1 X115.412 Y128.764 E-.14148
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I-1.217 J-.01 P1  F30000
G1 X115.32 Y139.484 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5295
G1 X115.32 Y141.689 E.07312
G1 X116.168 Y141.689 E.02812
G1 X140.902 Y143.389 E.8224
G1 X146.32 Y143.389 E.17974
G1 X146.32 Y144.184 E.0264
G1 X115.024 Y144.184 E1.03814
G1 X115.024 Y138.889 E.17567
G1 X146.32 Y138.889 E1.03814
G1 X146.32 Y139.484 E.01977
G1 X115.38 Y139.484 E1.02634
G1 X115.712 Y139.876 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5295
G1 X115.712 Y141.296 E.04363
G1 X116.181 Y141.296 E.01441
M73 P57 R4
G1 X140.915 Y142.996 E.7618
G1 X146.712 Y142.996 E.17813
G1 X146.712 Y144.576 E.04855
G1 X114.632 Y144.576 E.98573
G1 X114.632 Y138.496 E.18682
G1 X146.712 Y138.496 E.98573
G1 X146.712 Y139.876 E.0424
G1 X115.772 Y139.876 E.9507
M204 S10000
G1 X115.228 Y139.186 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5295
G1 X146.117 Y139.186 E.47513
; WIPE_START
G1 F24000
G1 X144.117 Y139.186 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I-1.116 J.485 P1  F30000
G1 X146.117 Y143.786 Z1.2
G1 Z.8
G1 E.8 F1800
; LINE_WIDTH: 0.431684
G1 F5295
G1 X140.881 Y143.786 E.16585
; LINE_WIDTH: 0.432142
G1 X140.183 Y143.762 E.02217
; LINE_WIDTH: 0.475922
G1 X139.484 Y143.738 E.02466
; LINE_WIDTH: 0.519701
G1 X138.786 Y143.714 E.02715
; LINE_WIDTH: 0.56348
G1 X138.087 Y143.69 E.02965
; LINE_WIDTH: 0.60726
G1 X137.389 Y143.666 E.03214
G1 X134.828 Y143.32 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5295
G1 X136.453 Y143.432 E.05401
G1 X136.049 Y143.836 E.01896
G1 X132.972 Y143.836 E.10206
G1 X132.281 Y143.145 E.03242
G1 X129.27 Y142.938 E.1001
G1 X128.373 Y143.836 E.04212
G1 X125.296 Y143.836 E.10206
G1 X124.038 Y142.579 E.05899
G1 X122.088 Y142.445 E.06485
G1 X120.697 Y143.836 E.06528
G1 X117.62 Y143.836 E.10206
G1 X115.821 Y142.037 E.08441
G3 X117.446 Y142.126 I.168 J11.868 E.05404
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X115.821 Y142.037 E-.61852
G1 X116.084 Y142.3 E-.14148
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 5/30
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
G3 Z1.2 I1.212 J-.106 P1  F30000
G1 X114.648 Y125.948 Z1.2
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5288
G1 X114.648 Y128.152 E.07312
G1 X115.495 Y128.152 E.02812
G1 X140.229 Y129.852 E.8224
G1 X145.648 Y129.852 E.17974
G1 X145.648 Y130.648 E.0264
G1 X114.352 Y130.648 E1.03814
G1 X114.352 Y125.352 E.17567
G1 X145.648 Y125.352 E1.03814
G1 X145.648 Y125.948 E.01977
G1 X114.708 Y125.948 E1.02634
G1 X115.04 Y126.34 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5288
G1 X115.04 Y127.76 E.04363
G1 X115.509 Y127.76 E.01441
G1 X140.243 Y129.46 E.7618
G1 X146.04 Y129.46 E.17813
G1 X146.04 Y131.04 E.04855
G1 X113.96 Y131.04 E.98573
G1 X113.96 Y124.96 E.18682
G1 X146.04 Y124.96 E.98573
G1 X146.04 Y126.34 E.0424
G1 X115.1 Y126.34 E.9507
M204 S10000
G1 X114.556 Y125.65 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5288
G1 X145.444 Y125.65 E.47513
; WIPE_START
G1 F24000
G1 X143.444 Y125.65 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I-1.116 J.485 P1  F30000
G1 X145.444 Y130.25 Z1.4
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.431684
G1 F5288
G1 X140.209 Y130.25 E.16585
; LINE_WIDTH: 0.432142
G1 X139.511 Y130.226 E.02217
; LINE_WIDTH: 0.475922
G1 X138.812 Y130.202 E.02466
; LINE_WIDTH: 0.519701
G1 X138.114 Y130.178 E.02715
; LINE_WIDTH: 0.56348
G1 X137.415 Y130.154 E.02965
; LINE_WIDTH: 0.60726
G1 X136.717 Y130.13 E.03214
G1 X134.156 Y129.784 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5288
G1 X135.781 Y129.895 E.05401
G1 X135.376 Y130.3 E.01896
G1 X132.3 Y130.3 E.10206
G1 X131.609 Y129.609 E.03242
G1 X128.598 Y129.402 E.1001
G1 X127.7 Y130.3 E.04212
G1 X124.624 Y130.3 E.10206
G1 X123.366 Y129.042 E.05899
G1 X121.416 Y128.908 E.06485
G1 X120.024 Y130.3 E.06528
G1 X116.948 Y130.3 E.10206
G1 X115.148 Y128.5 E.08441
G3 X116.774 Y128.589 I.168 J11.868 E.05404
; WIPE_START
G1 F24000
G1 X115.148 Y128.5 E-.61852
G1 X115.412 Y128.764 E-.14148
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I-1.217 J-.01 P1  F30000
G1 X115.32 Y139.484 Z1.4
M73 P58 R4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5288
G1 X115.32 Y141.689 E.07312
G1 X116.168 Y141.689 E.02812
G1 X140.902 Y143.389 E.8224
G1 X146.32 Y143.389 E.17974
G1 X146.32 Y144.184 E.0264
G1 X115.024 Y144.184 E1.03814
G1 X115.024 Y138.889 E.17567
G1 X146.32 Y138.889 E1.03814
G1 X146.32 Y139.484 E.01977
G1 X115.38 Y139.484 E1.02634
G1 X115.712 Y139.876 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5288
G1 X115.712 Y141.296 E.04363
G1 X116.181 Y141.296 E.01441
G1 X140.915 Y142.996 E.7618
G1 X146.712 Y142.996 E.17813
G1 X146.712 Y144.576 E.04855
G1 X114.632 Y144.576 E.98573
G1 X114.632 Y138.496 E.18682
G1 X146.712 Y138.496 E.98573
G1 X146.712 Y139.876 E.0424
G1 X115.772 Y139.876 E.9507
M204 S10000
G1 X115.228 Y139.186 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5288
G1 X146.117 Y139.186 E.47513
; WIPE_START
G1 F24000
G1 X144.117 Y139.186 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I-1.116 J.485 P1  F30000
G1 X146.117 Y143.786 Z1.4
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.431684
G1 F5288
G1 X140.881 Y143.786 E.16585
; LINE_WIDTH: 0.432142
G1 X140.183 Y143.762 E.02217
; LINE_WIDTH: 0.475922
G1 X139.484 Y143.738 E.02466
; LINE_WIDTH: 0.519701
G1 X138.786 Y143.714 E.02715
; LINE_WIDTH: 0.56348
G1 X138.087 Y143.69 E.02965
; LINE_WIDTH: 0.60726
G1 X137.389 Y143.666 E.03214
G1 X134.828 Y143.32 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5288
G1 X136.453 Y143.432 E.05401
G1 X136.049 Y143.836 E.01896
G1 X132.972 Y143.836 E.10206
G1 X132.281 Y143.145 E.03242
G1 X129.27 Y142.938 E.1001
G1 X128.373 Y143.836 E.04212
G1 X125.296 Y143.836 E.10206
G1 X124.038 Y142.579 E.05899
G1 X122.088 Y142.445 E.06485
G1 X120.697 Y143.836 E.06528
G1 X117.62 Y143.836 E.10206
G1 X115.821 Y142.037 E.08441
G3 X117.446 Y142.126 I.168 J11.868 E.05404
; CHANGE_LAYER
; Z_HEIGHT: 1.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X115.821 Y142.037 E-.61852
G1 X116.084 Y142.3 E-.14148
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 6/30
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
G3 Z1.4 I1.212 J-.106 P1  F30000
G1 X114.648 Y125.948 Z1.4
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5288
G1 X114.648 Y128.152 E.07312
G1 X115.495 Y128.152 E.02812
G1 X140.229 Y129.852 E.8224
G1 X145.648 Y129.852 E.17974
G1 X145.648 Y130.648 E.0264
G1 X114.352 Y130.648 E1.03814
G1 X114.352 Y125.352 E.17567
G1 X145.648 Y125.352 E1.03814
G1 X145.648 Y125.948 E.01977
G1 X114.708 Y125.948 E1.02634
G1 X115.04 Y126.34 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5288
G1 X115.04 Y127.76 E.04363
G1 X115.509 Y127.76 E.01441
M73 P59 R4
G1 X140.243 Y129.46 E.7618
G1 X146.04 Y129.46 E.17813
G1 X146.04 Y131.04 E.04855
G1 X113.96 Y131.04 E.98573
G1 X113.96 Y124.96 E.18682
G1 X146.04 Y124.96 E.98573
G1 X146.04 Y126.34 E.0424
G1 X115.1 Y126.34 E.9507
M204 S10000
G1 X114.556 Y125.65 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5288
G1 X145.444 Y125.65 E.47513
; WIPE_START
G1 F24000
G1 X143.444 Y125.65 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I-1.116 J.485 P1  F30000
G1 X145.444 Y130.25 Z1.6
G1 Z1.2
G1 E.8 F1800
; LINE_WIDTH: 0.431684
G1 F5288
G1 X140.209 Y130.25 E.16585
; LINE_WIDTH: 0.432142
G1 X139.511 Y130.226 E.02217
; LINE_WIDTH: 0.475922
G1 X138.812 Y130.202 E.02466
; LINE_WIDTH: 0.519701
G1 X138.114 Y130.178 E.02715
; LINE_WIDTH: 0.56348
G1 X137.415 Y130.154 E.02965
; LINE_WIDTH: 0.60726
G1 X136.717 Y130.13 E.03214
G1 X134.156 Y129.784 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5288
G1 X135.781 Y129.895 E.05401
G1 X135.376 Y130.3 E.01896
G1 X132.3 Y130.3 E.10206
G1 X131.609 Y129.609 E.03242
G1 X128.598 Y129.402 E.1001
G1 X127.7 Y130.3 E.04212
G1 X124.624 Y130.3 E.10206
G1 X123.366 Y129.042 E.05899
G1 X121.416 Y128.908 E.06485
G1 X120.024 Y130.3 E.06528
G1 X116.948 Y130.3 E.10206
G1 X115.148 Y128.5 E.08441
G3 X116.774 Y128.589 I.168 J11.868 E.05404
; WIPE_START
G1 F24000
G1 X115.148 Y128.5 E-.61852
G1 X115.412 Y128.764 E-.14148
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I-1.217 J-.01 P1  F30000
G1 X115.32 Y139.484 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5288
G1 X115.32 Y141.689 E.07312
G1 X116.168 Y141.689 E.02812
G1 X140.902 Y143.389 E.8224
G1 X146.32 Y143.389 E.17974
G1 X146.32 Y144.184 E.0264
G1 X115.024 Y144.184 E1.03814
G1 X115.024 Y138.889 E.17567
G1 X146.32 Y138.889 E1.03814
G1 X146.32 Y139.484 E.01977
G1 X115.38 Y139.484 E1.02634
G1 X115.712 Y139.876 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5288
G1 X115.712 Y141.296 E.04363
G1 X116.181 Y141.296 E.01441
G1 X140.915 Y142.996 E.7618
G1 X146.712 Y142.996 E.17813
G1 X146.712 Y144.576 E.04855
G1 X114.632 Y144.576 E.98573
G1 X114.632 Y138.496 E.18682
G1 X146.712 Y138.496 E.98573
G1 X146.712 Y139.876 E.0424
G1 X115.772 Y139.876 E.9507
M204 S10000
G1 X115.228 Y139.186 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5288
G1 X146.117 Y139.186 E.47513
; WIPE_START
G1 F24000
G1 X144.117 Y139.186 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I-1.116 J.485 P1  F30000
G1 X146.117 Y143.786 Z1.6
G1 Z1.2
G1 E.8 F1800
; LINE_WIDTH: 0.431684
G1 F5288
G1 X140.881 Y143.786 E.16585
; LINE_WIDTH: 0.432142
G1 X140.183 Y143.762 E.02217
; LINE_WIDTH: 0.475922
G1 X139.484 Y143.738 E.02466
; LINE_WIDTH: 0.519701
G1 X138.786 Y143.714 E.02715
; LINE_WIDTH: 0.56348
G1 X138.087 Y143.69 E.02965
; LINE_WIDTH: 0.60726
G1 X137.389 Y143.666 E.03214
G1 X134.828 Y143.32 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5288
G1 X136.453 Y143.432 E.05401
G1 X136.049 Y143.836 E.01896
G1 X132.972 Y143.836 E.10206
G1 X132.281 Y143.145 E.03242
G1 X129.27 Y142.938 E.1001
G1 X128.373 Y143.836 E.04212
G1 X125.296 Y143.836 E.10206
G1 X124.038 Y142.579 E.05899
G1 X122.088 Y142.445 E.06485
G1 X120.697 Y143.836 E.06528
G1 X117.62 Y143.836 E.10206
G1 X115.821 Y142.037 E.08441
G3 X117.446 Y142.126 I.168 J11.868 E.05404
; CHANGE_LAYER
; Z_HEIGHT: 1.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X115.821 Y142.037 E-.61852
G1 X116.084 Y142.3 E-.14148
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 7/30
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
G3 Z1.6 I1.212 J-.106 P1  F30000
G1 X114.648 Y125.948 Z1.6
M73 P60 R4
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5672
G1 X114.648 Y128.152 E.07312
G1 X115.495 Y128.152 E.02812
G1 X140.229 Y129.852 E.8224
G1 X141.506 Y129.852 E.04234
G1 X141.506 Y130.648 E.0264
G1 X114.352 Y130.648 E.90073
G1 X114.352 Y125.352 E.17567
G1 X145.648 Y125.352 E1.03814
G1 X145.648 Y125.948 E.01977
G1 X114.708 Y125.948 E1.02634
; WIPE_START
G1 F24000
G1 X114.653 Y127.947 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-.076 J1.215 P1  F30000
G1 X144.994 Y129.852 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F5672
G1 X145.648 Y129.852 E.02168
G1 X145.648 Y130.648 E.0264
G1 X144.994 Y130.648 E.02168
G1 X144.994 Y129.912 E.02441
; WIPE_START
G1 F24000
G1 X145.648 Y129.852 E-.24939
G1 X145.648 Y130.648 E-.30242
G1 X145.1 Y130.648 E-.20819
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I.173 J-1.205 P1  F30000
G1 X115.04 Y126.34 Z1.8
G1 Z1.4
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5672
G1 X115.04 Y127.76 E.04363
G1 X115.509 Y127.76 E.01441
G1 X140.243 Y129.46 E.7618
G1 X146.04 Y129.46 E.17813
G1 X146.04 Y131.04 E.04855
G1 X113.96 Y131.04 E.98573
G1 X113.96 Y124.96 E.18682
G1 X146.04 Y124.96 E.98573
G1 X146.04 Y126.34 E.0424
G1 X115.1 Y126.34 E.9507
M204 S10000
G1 X114.556 Y125.65 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5672
G1 X145.444 Y125.65 E.47513
; WIPE_START
G1 F24000
G1 X143.444 Y125.65 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-1.169 J.338 P1  F30000
G1 X144.772 Y130.24 Z1.8
G1 Z1.4
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F5672
G1 X144.199 Y129.667 E.02489
G1 X143.666 Y129.667
G1 X144.772 Y130.773 E.04806
G1 X144.298 Y130.833
G1 X143.133 Y129.667 E.05063
G1 X142.599 Y129.667
G1 X143.765 Y130.833 E.05063
G1 X143.231 Y130.833
G1 X142.066 Y129.667 E.05063
G1 X141.728 Y129.863
G1 X142.698 Y130.833 E.04215
G1 X142.165 Y130.833
G1 X141.728 Y130.396 E.01898
M204 S10000
G1 X141.302 Y130.25 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F5672
G3 X140.209 Y130.25 I-.54 J-31.849 E.03463
; LINE_WIDTH: 0.432142
G1 X139.511 Y130.226 E.02217
; LINE_WIDTH: 0.475922
G1 X138.812 Y130.202 E.02466
; LINE_WIDTH: 0.519701
G1 X138.114 Y130.178 E.02715
; LINE_WIDTH: 0.56348
G1 X137.415 Y130.154 E.02965
; LINE_WIDTH: 0.60726
G1 X136.717 Y130.13 E.03214
G1 X134.156 Y129.784 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5672
G1 X135.781 Y129.895 E.05401
G1 X135.376 Y130.3 E.01896
G1 X132.3 Y130.3 E.10206
G1 X131.609 Y129.609 E.03242
G1 X128.598 Y129.402 E.1001
G1 X127.7 Y130.3 E.04212
G1 X124.624 Y130.3 E.10206
G1 X123.366 Y129.042 E.05899
G1 X121.416 Y128.908 E.06485
G1 X120.024 Y130.3 E.06528
G1 X116.948 Y130.3 E.10206
G1 X115.148 Y128.5 E.08441
G3 X116.774 Y128.589 I.168 J11.868 E.05404
; WIPE_START
G1 F24000
G1 X115.148 Y128.5 E-.61852
G1 X115.412 Y128.764 E-.14148
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-1.217 J-.01 P1  F30000
M73 P61 R4
G1 X115.32 Y139.484 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5672
G1 X115.32 Y141.689 E.07312
G1 X116.168 Y141.689 E.02812
G1 X140.902 Y143.389 E.8224
G1 X142.178 Y143.389 E.04234
G1 X142.178 Y144.184 E.0264
G1 X115.024 Y144.184 E.90073
G1 X115.024 Y138.889 E.17567
G1 X146.32 Y138.889 E1.03814
G1 X146.32 Y139.484 E.01977
G1 X115.38 Y139.484 E1.02634
; WIPE_START
G1 F24000
G1 X115.326 Y141.484 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-.076 J1.215 P1  F30000
G1 X145.667 Y143.389 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F5672
G1 X146.32 Y143.389 E.02168
G1 X146.32 Y144.184 E.0264
G1 X145.667 Y144.184 E.02168
G1 X145.667 Y143.449 E.02441
; WIPE_START
G1 F24000
G1 X146.32 Y143.389 E-.24939
G1 X146.32 Y144.184 E-.30242
G1 X145.772 Y144.184 E-.20819
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I.173 J-1.205 P1  F30000
G1 X115.712 Y139.876 Z1.8
G1 Z1.4
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5672
G1 X115.712 Y141.296 E.04363
G1 X116.181 Y141.296 E.01441
G1 X140.915 Y142.996 E.7618
G1 X146.712 Y142.996 E.17813
G1 X146.712 Y144.576 E.04855
G1 X114.632 Y144.576 E.98573
G1 X114.632 Y138.496 E.18682
G1 X146.712 Y138.496 E.98573
G1 X146.712 Y139.876 E.0424
G1 X115.772 Y139.876 E.9507
M204 S10000
G1 X115.228 Y139.186 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5672
G1 X146.117 Y139.186 E.47513
; WIPE_START
G1 F24000
G1 X144.117 Y139.186 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-1.169 J.338 P1  F30000
G1 X145.444 Y143.777 Z1.8
G1 Z1.4
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F5672
G1 X144.871 Y143.204 E.02489
G1 X144.338 Y143.204
G1 X145.444 Y144.31 E.04806
G1 X144.97 Y144.369
G1 X143.805 Y143.204 E.05063
G1 X143.272 Y143.204
G1 X144.437 Y144.369 E.05063
G1 X143.904 Y144.369
G1 X142.738 Y143.204 E.05063
G1 X142.4 Y143.399
G1 X143.37 Y144.369 E.04215
G1 X142.837 Y144.369
G1 X142.4 Y143.932 E.01898
M204 S10000
G1 X141.974 Y143.786 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F5672
G3 X140.881 Y143.786 I-.54 J-31.849 E.03463
; LINE_WIDTH: 0.432142
G1 X140.183 Y143.762 E.02217
; LINE_WIDTH: 0.475922
G1 X139.484 Y143.738 E.02466
; LINE_WIDTH: 0.519701
G1 X138.786 Y143.714 E.02715
; LINE_WIDTH: 0.56348
G1 X138.087 Y143.69 E.02965
; LINE_WIDTH: 0.60726
G1 X137.389 Y143.666 E.03214
G1 X134.828 Y143.32 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5672
G1 X136.453 Y143.432 E.05401
G1 X136.049 Y143.836 E.01896
G1 X132.972 Y143.836 E.10206
G1 X132.281 Y143.145 E.03242
G1 X129.27 Y142.938 E.1001
G1 X128.373 Y143.836 E.04212
G1 X125.296 Y143.836 E.10206
G1 X124.038 Y142.579 E.05899
G1 X122.088 Y142.445 E.06485
G1 X120.697 Y143.836 E.06528
G1 X117.62 Y143.836 E.10206
G1 X115.821 Y142.037 E.08441
G3 X117.446 Y142.126 I.168 J11.868 E.05404
; CHANGE_LAYER
; Z_HEIGHT: 1.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X115.821 Y142.037 E-.61852
G1 X116.084 Y142.3 E-.14148
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 8/30
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
G3 Z1.8 I1.212 J-.106 P1  F30000
G1 X114.648 Y125.948 Z1.8
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5914
G1 X114.648 Y128.152 E.07312
G1 X115.495 Y128.152 E.02812
G1 X140.229 Y129.852 E.8224
G1 X141.981 Y129.852 E.05812
G1 X141.981 Y130.648 E.0264
G1 X114.352 Y130.648 E.91651
G1 X114.352 Y125.352 E.17567
G1 X141.659 Y125.352 E.90581
G1 X141.659 Y125.948 E.01977
G1 X114.708 Y125.948 E.894
; WIPE_START
G1 F24000
G1 X114.653 Y127.947 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I.104 J1.212 P1  F30000
G1 X144.841 Y125.352 Z2
G1 Z1.6
G1 E.8 F1800
G1 F5914
G1 X145.648 Y125.352 E.02675
G1 X145.648 Y125.948 E.01977
G1 X144.841 Y125.948 E.02675
G1 X144.841 Y125.412 E.01777
; WIPE_START
G1 F24000
G1 X145.648 Y125.352 E-.30732
G1 X145.648 Y125.948 E-.22642
G1 X145.052 Y125.948 E-.22626
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-.016 J-1.217 P1  F30000
G1 X115.04 Y126.34 Z2
G1 Z1.6
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5914
G1 X115.04 Y127.76 E.04363
G1 X115.509 Y127.76 E.01441
G1 X140.243 Y129.46 E.7618
G1 X142.373 Y129.46 E.06547
G1 X142.373 Y131.04 E.04855
G1 X113.96 Y131.04 E.87306
G1 X113.96 Y124.96 E.18682
G1 X146.04 Y124.96 E.98573
M73 P62 R4
G1 X146.04 Y126.34 E.0424
G1 X115.1 Y126.34 E.9507
M204 S10000
G1 X114.556 Y125.65 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5914
G1 X141.455 Y125.65 E.41376
; WIPE_START
G1 F24000
G1 X139.455 Y125.65 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-.132 J1.21 P1  F30000
G1 X143.866 Y126.133 Z2
G1 Z1.6
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F5914
G1 X144.619 Y125.379 E.03273
G1 X144.298 Y125.167
G1 X143.333 Y126.133 E.04194
G1 X142.799 Y126.133
G1 X143.765 Y125.167 E.04194
G1 X143.231 Y125.167
G1 X142.266 Y126.133 E.04194
G1 X141.881 Y125.984
G1 X142.698 Y125.167 E.03551
M204 S10000
; WIPE_START
G1 F24000
G1 X141.881 Y125.984 E-.43909
G1 X142.266 Y126.133 E-.1568
G1 X142.571 Y125.827 E-.16411
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I.087 J1.214 P1  F30000
G1 X145.045 Y125.65 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5914
G1 X145.444 Y125.65 E.00614
; WIPE_START
G1 F24000
G1 X145.045 Y125.65 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-.992 J-.705 P1  F30000
G1 X141.778 Y130.25 Z2
G1 Z1.6
G1 E.8 F1800
; LINE_WIDTH: 0.431684
G1 F5914
G3 X140.209 Y130.25 I-.778 J-45.71 E.0497
; LINE_WIDTH: 0.432142
G1 X139.511 Y130.226 E.02217
; LINE_WIDTH: 0.475922
G1 X138.812 Y130.202 E.02466
; LINE_WIDTH: 0.519701
G1 X138.114 Y130.178 E.02715
; LINE_WIDTH: 0.56348
G1 X137.415 Y130.154 E.02965
; LINE_WIDTH: 0.60726
G1 X136.717 Y130.13 E.03214
G1 X134.156 Y129.784 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5914
G1 X135.781 Y129.895 E.05401
G1 X135.376 Y130.3 E.01896
G1 X132.3 Y130.3 E.10206
G1 X131.609 Y129.609 E.03242
G1 X128.598 Y129.402 E.1001
G1 X127.7 Y130.3 E.04212
G1 X124.624 Y130.3 E.10206
G1 X123.366 Y129.042 E.05899
G1 X121.416 Y128.908 E.06485
G1 X120.024 Y130.3 E.06528
G1 X116.948 Y130.3 E.10206
G1 X115.148 Y128.5 E.08441
G3 X116.774 Y128.589 I.168 J11.868 E.05404
; WIPE_START
G1 F24000
G1 X115.148 Y128.5 E-.61852
G1 X115.412 Y128.764 E-.14148
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-.045 J1.216 P1  F30000
G1 X144.519 Y129.852 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5914
G1 X145.648 Y129.852 E.03746
G1 X145.648 Y130.648 E.0264
G1 X144.519 Y130.648 E.03746
G1 X144.519 Y129.912 E.02441
G1 X144.127 Y129.46 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5914
G1 X146.04 Y129.46 E.05879
G1 X146.04 Y131.04 E.04855
G1 X144.127 Y131.04 E.05879
G1 X144.127 Y129.52 E.04671
M204 S10000
; WIPE_START
G1 F24000
G1 X146.04 Y129.46 E-.72745
G1 X146.04 Y129.546 E-.03255
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-.375 J-1.158 P1  F30000
G1 X115.32 Y139.484 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5914
G1 X115.32 Y141.689 E.07312
G1 X116.168 Y141.689 E.02812
G1 X140.902 Y143.389 E.8224
G1 X142.654 Y143.389 E.05812
G1 X142.654 Y144.184 E.0264
G1 X115.024 Y144.184 E.91651
G1 X115.024 Y138.889 E.17567
G1 X142.331 Y138.889 E.90581
G1 X142.331 Y139.484 E.01977
G1 X115.38 Y139.484 E.894
; WIPE_START
G1 F24000
G1 X115.326 Y141.484 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I.104 J1.212 P1  F30000
G1 X145.514 Y138.889 Z2
G1 Z1.6
G1 E.8 F1800
G1 F5914
G1 X146.32 Y138.889 E.02675
G1 X146.32 Y139.484 E.01977
G1 X145.514 Y139.484 E.02675
G1 X145.514 Y138.949 E.01777
; WIPE_START
G1 F24000
G1 X146.32 Y138.889 E-.30732
G1 X146.32 Y139.484 E-.22642
G1 X145.725 Y139.484 E-.22626
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-.016 J-1.217 P1  F30000
G1 X115.712 Y139.876 Z2
G1 Z1.6
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5914
G1 X115.712 Y141.296 E.04363
G1 X116.181 Y141.296 E.01441
G1 X140.915 Y142.996 E.7618
G1 X143.046 Y142.996 E.06547
G1 X143.046 Y144.576 E.04855
G1 X114.632 Y144.576 E.87306
G1 X114.632 Y138.496 E.18682
G1 X146.712 Y138.496 E.98573
G1 X146.712 Y139.876 E.0424
G1 X115.772 Y139.876 E.9507
M204 S10000
G1 X115.228 Y139.186 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5914
G1 X142.127 Y139.186 E.41376
; WIPE_START
G1 F24000
G1 X140.127 Y139.186 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-.132 J1.21 P1  F30000
G1 X144.538 Y139.669 Z2
G1 Z1.6
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F5914
G1 X145.291 Y138.916 E.03273
G1 X144.97 Y138.704
G1 X144.005 Y139.669 E.04194
G1 X143.472 Y139.669
G1 X144.437 Y138.704 E.04194
G1 X143.904 Y138.704
G1 X142.938 Y139.669 E.04194
M73 P63 R4
G1 X142.553 Y139.521
G1 X143.37 Y138.704 E.03551
M204 S10000
; WIPE_START
G1 F24000
G1 X142.553 Y139.521 E-.43909
G1 X142.938 Y139.669 E-.1568
G1 X143.244 Y139.364 E-.16411
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I.087 J1.214 P1  F30000
G1 X145.717 Y139.186 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5914
G1 X146.117 Y139.186 E.00614
; WIPE_START
G1 F24000
G1 X145.717 Y139.186 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-.992 J-.705 P1  F30000
G1 X142.45 Y143.786 Z2
G1 Z1.6
G1 E.8 F1800
; LINE_WIDTH: 0.431684
G1 F5914
G3 X140.881 Y143.786 I-.778 J-45.71 E.0497
; LINE_WIDTH: 0.432142
G1 X140.183 Y143.762 E.02217
; LINE_WIDTH: 0.475922
G1 X139.484 Y143.738 E.02466
; LINE_WIDTH: 0.519701
G1 X138.786 Y143.714 E.02715
; LINE_WIDTH: 0.56348
G1 X138.087 Y143.69 E.02965
; LINE_WIDTH: 0.60726
G1 X137.389 Y143.666 E.03214
G1 X134.828 Y143.32 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5914
G1 X136.453 Y143.432 E.05401
G1 X136.049 Y143.836 E.01896
G1 X132.972 Y143.836 E.10206
G1 X132.281 Y143.145 E.03242
G1 X129.27 Y142.938 E.1001
G1 X128.373 Y143.836 E.04212
G1 X125.296 Y143.836 E.10206
G1 X124.038 Y142.579 E.05899
G1 X122.088 Y142.445 E.06485
G1 X120.697 Y143.836 E.06528
G1 X117.62 Y143.836 E.10206
G1 X115.821 Y142.037 E.08441
G3 X117.446 Y142.126 I.168 J11.868 E.05404
; WIPE_START
G1 F24000
G1 X115.821 Y142.037 E-.61852
G1 X116.084 Y142.3 E-.14148
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-.045 J1.216 P1  F30000
G1 X145.191 Y143.389 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5914
G1 X146.32 Y143.389 E.03746
G1 X146.32 Y144.184 E.0264
G1 X145.191 Y144.184 E.03746
G1 X145.191 Y143.449 E.02441
G1 X144.799 Y142.996 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5914
G1 X146.712 Y142.996 E.05879
G1 X146.712 Y144.576 E.04855
G1 X144.799 Y144.576 E.05879
G1 X144.799 Y143.056 E.04671
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X146.712 Y142.996 E-.72745
G1 X146.712 Y143.082 E-.03255
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 9/30
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
G3 Z2 I1.205 J-.169 P1  F30000
G1 X144.855 Y129.852 Z2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5306
G1 X145.648 Y129.852 E.02631
G1 X145.648 Y130.648 E.0264
G1 X144.855 Y130.648 E.02631
G1 X144.855 Y129.912 E.02441
G1 X144.463 Y129.46 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5306
G1 X146.04 Y129.46 E.04847
G1 X146.04 Y131.04 E.04855
G1 X144.463 Y131.04 E.04847
G1 X144.463 Y129.52 E.04671
M204 S10000
; WIPE_START
G1 F24000
G1 X146.04 Y129.46 E-.59981
G1 X146.04 Y129.882 E-.16019
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I1.12 J-.477 P1  F30000
G1 X144.366 Y125.948 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5306
G1 X144.366 Y125.352 E.01977
G1 X145.648 Y125.352 E.04253
G1 X145.648 Y125.948 E.01977
G1 X144.426 Y125.948 E.04054
G1 X143.974 Y126.34 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5306
G1 X143.974 Y124.96 E.0424
G1 X146.04 Y124.96 E.06349
G1 X146.04 Y126.34 E.0424
G1 X144.034 Y126.34 E.06165
M204 S10000
G1 X144.569 Y125.65 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5306
G1 X145.444 Y125.65 E.01346
; WIPE_START
G1 F24000
G1 X144.569 Y125.65 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-.012 J-1.217 P1  F30000
G1 X114.648 Y125.948 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5306
G1 X114.648 Y128.152 E.07312
G1 X115.495 Y128.152 E.02812
G1 X140.229 Y129.852 E.8224
G1 X141.645 Y129.852 E.04697
G1 X141.645 Y130.648 E.0264
G1 X114.352 Y130.648 E.90536
G1 X114.352 Y125.352 E.17567
G1 X142.134 Y125.352 E.92159
G1 X142.134 Y125.948 E.01977
G1 X114.708 Y125.948 E.90978
G1 X115.04 Y126.34 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5306
G1 X115.04 Y127.76 E.04363
G1 X115.509 Y127.76 E.01441
G1 X140.243 Y129.46 E.7618
G1 X142.037 Y129.46 E.05514
G1 X142.037 Y131.04 E.04855
G1 X113.96 Y131.04 E.86274
G1 X113.96 Y124.96 E.18682
G1 X142.526 Y124.96 E.87776
G1 X142.526 Y126.34 E.0424
G1 X115.1 Y126.34 E.84274
M204 S10000
G1 X114.556 Y125.65 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5306
G1 X141.931 Y125.65 E.42108
; WIPE_START
G1 F24000
G1 X139.931 Y125.65 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-1.156 J.38 P1  F30000
G1 X141.442 Y130.25 Z2.2
G1 Z1.8
G1 E.8 F1800
; LINE_WIDTH: 0.431684
G1 F5306
G3 X140.209 Y130.25 I-.61 J-35.918 E.03905
; LINE_WIDTH: 0.432142
G1 X139.511 Y130.226 E.02217
; LINE_WIDTH: 0.475922
G1 X138.812 Y130.202 E.02466
; LINE_WIDTH: 0.519701
G1 X138.114 Y130.178 E.02715
; LINE_WIDTH: 0.56348
G1 X137.415 Y130.154 E.02965
; LINE_WIDTH: 0.60726
G1 X136.717 Y130.13 E.03214
G1 X134.156 Y129.784 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5306
G1 X135.781 Y129.895 E.05401
G1 X135.376 Y130.3 E.01896
G1 X132.3 Y130.3 E.10206
G1 X131.609 Y129.609 E.03242
G1 X128.598 Y129.402 E.1001
G1 X127.7 Y130.3 E.04212
G1 X124.624 Y130.3 E.10206
G1 X123.366 Y129.042 E.05899
G1 X121.416 Y128.908 E.06485
G1 X120.024 Y130.3 E.06528
G1 X116.948 Y130.3 E.10206
G1 X115.148 Y128.5 E.08441
G3 X116.774 Y128.589 I.168 J11.868 E.05404
; WIPE_START
G1 F24000
G1 X115.148 Y128.5 E-.61852
G1 X115.412 Y128.764 E-.14148
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-.532 J1.095 P1  F30000
G1 X145.527 Y143.389 Z2.2
M73 P64 R4
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5306
G1 X146.32 Y143.389 E.02631
G1 X146.32 Y144.184 E.0264
G1 X145.527 Y144.184 E.02631
G1 X145.527 Y143.449 E.02441
G1 X145.135 Y142.996 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5306
G1 X146.712 Y142.996 E.04847
G1 X146.712 Y144.576 E.04855
G1 X145.135 Y144.576 E.04847
G1 X145.135 Y143.056 E.04671
M204 S10000
; WIPE_START
G1 F24000
G1 X146.712 Y142.996 E-.59981
G1 X146.712 Y143.418 E-.16019
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I1.12 J-.477 P1  F30000
G1 X145.038 Y139.484 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5306
G1 X145.038 Y138.889 E.01977
G1 X146.32 Y138.889 E.04253
G1 X146.32 Y139.484 E.01977
G1 X145.098 Y139.484 E.04054
G1 X144.646 Y139.876 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5306
G1 X144.646 Y138.496 E.0424
G1 X146.712 Y138.496 E.06349
G1 X146.712 Y139.876 E.0424
G1 X144.706 Y139.876 E.06165
M204 S10000
G1 X145.241 Y139.186 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5306
G1 X146.117 Y139.186 E.01346
; WIPE_START
G1 F24000
G1 X145.241 Y139.186 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-.012 J-1.217 P1  F30000
G1 X115.32 Y139.484 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5306
G1 X115.32 Y141.689 E.07312
G1 X116.168 Y141.689 E.02812
G1 X140.902 Y143.389 E.8224
G1 X142.317 Y143.389 E.04697
G1 X142.317 Y144.184 E.0264
G1 X115.024 Y144.184 E.90536
G1 X115.024 Y138.889 E.17567
G1 X142.807 Y138.889 E.92159
G1 X142.807 Y139.484 E.01977
G1 X115.38 Y139.484 E.90978
G1 X115.712 Y139.876 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5306
G1 X115.712 Y141.296 E.04363
G1 X116.181 Y141.296 E.01441
G1 X140.915 Y142.996 E.7618
G1 X142.71 Y142.996 E.05514
G1 X142.71 Y144.576 E.04855
G1 X114.632 Y144.576 E.86274
G1 X114.632 Y138.496 E.18682
G1 X143.199 Y138.496 E.87776
G1 X143.199 Y139.876 E.0424
G1 X115.772 Y139.876 E.84274
M204 S10000
G1 X115.228 Y139.186 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5306
G1 X142.603 Y139.186 E.42108
; WIPE_START
G1 F24000
G1 X140.603 Y139.186 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-1.156 J.38 P1  F30000
G1 X142.114 Y143.786 Z2.2
G1 Z1.8
G1 E.8 F1800
; LINE_WIDTH: 0.431684
G1 F5306
G3 X140.881 Y143.786 I-.61 J-35.918 E.03905
; LINE_WIDTH: 0.432142
G1 X140.183 Y143.762 E.02217
; LINE_WIDTH: 0.475922
G1 X139.484 Y143.738 E.02466
; LINE_WIDTH: 0.519701
G1 X138.786 Y143.714 E.02715
; LINE_WIDTH: 0.56348
G1 X138.087 Y143.69 E.02965
; LINE_WIDTH: 0.60726
G1 X137.389 Y143.666 E.03214
G1 X134.828 Y143.32 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5306
G1 X136.453 Y143.432 E.05401
G1 X136.049 Y143.836 E.01896
G1 X132.972 Y143.836 E.10206
G1 X132.281 Y143.145 E.03242
G1 X129.27 Y142.938 E.1001
G1 X128.373 Y143.836 E.04212
G1 X125.296 Y143.836 E.10206
G1 X124.038 Y142.579 E.05899
G1 X122.088 Y142.445 E.06485
G1 X120.697 Y143.836 E.06528
G1 X117.62 Y143.836 E.10206
G1 X115.821 Y142.037 E.08441
G3 X117.446 Y142.126 I.168 J11.868 E.05404
; CHANGE_LAYER
; Z_HEIGHT: 2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X115.821 Y142.037 E-.61852
G1 X116.084 Y142.3 E-.14148
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 10/30
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
G3 Z2.2 I.48 J1.118 P1  F30000
G1 X145.081 Y129.852 Z2.2
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5246
G1 X145.648 Y129.852 E.01882
G1 X145.648 Y130.648 E.0264
G1 X145.081 Y130.648 E.01882
G1 X145.081 Y129.912 E.02441
G1 X144.688 Y129.46 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5246
G1 X146.04 Y129.46 E.04153
G1 X146.04 Y131.04 E.04855
G1 X144.688 Y131.04 E.04153
G1 X144.688 Y129.52 E.04671
M204 S10000
G1 X145.364 Y130.056 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.203242
M73 P65 R4
G1 F5246
G1 X145.364 Y130.444 E.00508
; WIPE_START
G1 F24000
G1 X145.364 Y130.056 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I1.202 J-.192 P1  F30000
G1 X144.706 Y125.948 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5246
G1 X144.706 Y125.352 E.01977
G1 X145.648 Y125.352 E.03124
G1 X145.648 Y125.948 E.01977
G1 X144.766 Y125.948 E.02925
G1 X144.314 Y126.34 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5246
G1 X144.314 Y124.96 E.0424
G1 X146.04 Y124.96 E.05303
G1 X146.04 Y126.34 E.0424
G1 X144.374 Y126.34 E.05119
M204 S10000
G1 X144.91 Y125.65 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5246
G1 X145.444 Y125.65 E.00822
; WIPE_START
G1 F24000
G1 X144.91 Y125.65 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-.012 J-1.217 P1  F30000
G1 X114.648 Y125.948 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5246
M73 P65 R3
G1 X114.648 Y128.152 E.07312
G1 X115.495 Y128.152 E.02812
G1 X140.229 Y129.852 E.8224
G1 X141.419 Y129.852 E.03948
G1 X141.419 Y130.648 E.0264
G1 X114.352 Y130.648 E.89788
G1 X114.352 Y125.352 E.17567
G1 X141.794 Y125.352 E.91029
G1 X141.794 Y125.948 E.01977
G1 X114.708 Y125.948 E.89849
G1 X115.04 Y126.34 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5246
G1 X115.04 Y127.76 E.04363
G1 X115.509 Y127.76 E.01441
G1 X140.243 Y129.46 E.7618
G1 X141.812 Y129.46 E.0482
G1 X141.812 Y131.04 E.04855
G1 X113.96 Y131.04 E.8558
G1 X113.96 Y124.96 E.18682
G1 X142.186 Y124.96 E.8673
G1 X142.186 Y126.34 E.0424
G1 X115.1 Y126.34 E.83227
M204 S10000
G1 X114.556 Y125.65 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5246
G1 X141.59 Y125.65 E.41584
; WIPE_START
G1 F24000
G1 X139.59 Y125.65 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-1.147 J.406 P1  F30000
G1 X141.216 Y130.25 Z2.4
G1 Z2
G1 E.8 F1800
; LINE_WIDTH: 0.431684
G1 F5246
G3 X140.209 Y130.25 I-.497 J-29.34 E.0319
; LINE_WIDTH: 0.432142
G1 X139.511 Y130.226 E.02217
; LINE_WIDTH: 0.475922
G1 X138.812 Y130.202 E.02466
; LINE_WIDTH: 0.519701
G1 X138.114 Y130.178 E.02715
; LINE_WIDTH: 0.56348
G1 X137.415 Y130.154 E.02965
; LINE_WIDTH: 0.60726
G1 X136.717 Y130.13 E.03214
G1 X134.156 Y129.784 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5246
G1 X135.781 Y129.895 E.05401
G1 X135.376 Y130.3 E.01896
G1 X132.3 Y130.3 E.10206
G1 X131.609 Y129.609 E.03242
G1 X128.598 Y129.402 E.1001
G1 X127.7 Y130.3 E.04212
G1 X124.624 Y130.3 E.10206
G1 X123.366 Y129.042 E.05899
G1 X121.416 Y128.908 E.06485
G1 X120.024 Y130.3 E.06528
G1 X116.948 Y130.3 E.10206
G1 X115.148 Y128.5 E.08441
G3 X116.774 Y128.589 I.168 J11.868 E.05404
; WIPE_START
G1 F24000
G1 X115.148 Y128.5 E-.61852
G1 X115.412 Y128.764 E-.14148
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-.528 J1.096 P1  F30000
G1 X145.753 Y143.389 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5246
G1 X146.32 Y143.389 E.01882
G1 X146.32 Y144.184 E.0264
G1 X145.753 Y144.184 E.01882
G1 X145.753 Y143.449 E.02441
G1 X145.361 Y142.996 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5246
G1 X146.712 Y142.996 E.04153
G1 X146.712 Y144.576 E.04855
G1 X145.361 Y144.576 E.04153
G1 X145.361 Y143.056 E.04671
M204 S10000
G1 X146.036 Y143.592 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.203242
G1 F5246
G1 X146.036 Y143.981 E.00508
; WIPE_START
G1 F24000
G1 X146.036 Y143.592 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I1.202 J-.192 P1  F30000
G1 X145.378 Y139.484 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5246
G1 X145.378 Y138.889 E.01977
G1 X146.32 Y138.889 E.03124
G1 X146.32 Y139.484 E.01977
G1 X145.438 Y139.484 E.02925
G1 X144.986 Y139.876 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5246
G1 X144.986 Y138.496 E.0424
G1 X146.712 Y138.496 E.05303
G1 X146.712 Y139.876 E.0424
G1 X145.046 Y139.876 E.05119
M204 S10000
G1 X145.582 Y139.186 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5246
G1 X146.117 Y139.186 E.00822
; WIPE_START
G1 F24000
G1 X145.582 Y139.186 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-.012 J-1.217 P1  F30000
G1 X115.32 Y139.484 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5246
G1 X115.32 Y141.689 E.07312
G1 X116.168 Y141.689 E.02812
G1 X140.902 Y143.389 E.8224
G1 X142.092 Y143.389 E.03948
G1 X142.092 Y144.184 E.0264
G1 X115.024 Y144.184 E.89788
G1 X115.024 Y138.889 E.17567
G1 X142.466 Y138.889 E.91029
G1 X142.466 Y139.484 E.01977
G1 X115.38 Y139.484 E.89849
G1 X115.712 Y139.876 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5246
G1 X115.712 Y141.296 E.04363
G1 X116.181 Y141.296 E.01441
G1 X140.915 Y142.996 E.7618
G1 X142.484 Y142.996 E.0482
G1 X142.484 Y144.576 E.04855
G1 X114.632 Y144.576 E.8558
M73 P66 R3
G1 X114.632 Y138.496 E.18682
G1 X142.858 Y138.496 E.8673
G1 X142.858 Y139.876 E.0424
G1 X115.772 Y139.876 E.83227
M204 S10000
G1 X115.228 Y139.186 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5246
G1 X142.262 Y139.186 E.41584
; WIPE_START
G1 F24000
G1 X140.262 Y139.186 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-1.147 J.406 P1  F30000
G1 X141.888 Y143.786 Z2.4
G1 Z2
G1 E.8 F1800
; LINE_WIDTH: 0.431684
G1 F5246
G3 X140.881 Y143.786 I-.497 J-29.34 E.0319
; LINE_WIDTH: 0.432142
G1 X140.183 Y143.762 E.02217
; LINE_WIDTH: 0.475922
G1 X139.484 Y143.738 E.02466
; LINE_WIDTH: 0.519701
G1 X138.786 Y143.714 E.02715
; LINE_WIDTH: 0.56348
G1 X138.087 Y143.69 E.02965
; LINE_WIDTH: 0.60726
G1 X137.389 Y143.666 E.03214
G1 X134.828 Y143.32 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5246
G1 X136.453 Y143.432 E.05401
G1 X136.049 Y143.836 E.01896
G1 X132.972 Y143.836 E.10206
G1 X132.281 Y143.145 E.03242
G1 X129.27 Y142.938 E.1001
G1 X128.373 Y143.836 E.04212
G1 X125.296 Y143.836 E.10206
G1 X124.038 Y142.579 E.05899
G1 X122.088 Y142.445 E.06485
G1 X120.697 Y143.836 E.06528
G1 X117.62 Y143.836 E.10206
G1 X115.821 Y142.037 E.08441
G3 X117.446 Y142.126 I.168 J11.868 E.05404
; CHANGE_LAYER
; Z_HEIGHT: 2.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X115.821 Y142.037 E-.61852
G1 X116.084 Y142.3 E-.14148
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 11/30
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
G3 Z2.4 I.478 J1.119 P1  F30000
G1 X145.221 Y129.852 Z2.4
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5184
G1 X145.648 Y129.852 E.01416
G1 X145.648 Y130.648 E.0264
G1 X145.221 Y130.648 E.01416
G1 X145.221 Y129.912 E.02441
G1 X144.829 Y129.46 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5184
G1 X146.04 Y129.46 E.03721
G1 X146.04 Y131.04 E.04855
G1 X144.829 Y131.04 E.03721
G1 X144.829 Y129.52 E.04671
M204 S10000
; WIPE_START
G1 F24000
G1 X146.04 Y129.46 E-.46072
G1 X146.04 Y130.248 E-.29928
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I1.178 J-.307 P1  F30000
G1 X144.92 Y125.948 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5184
G1 X144.92 Y125.352 E.01977
G1 X145.648 Y125.352 E.02416
G1 X145.648 Y125.948 E.01977
G1 X144.98 Y125.948 E.02217
G1 X144.527 Y126.34 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5184
G1 X144.527 Y124.96 E.0424
G1 X146.04 Y124.96 E.04647
G1 X146.04 Y126.34 E.0424
G1 X144.587 Y126.34 E.04463
M204 S10000
; WIPE_START
G1 F24000
G1 X144.527 Y124.96 E-.5249
G1 X145.146 Y124.96 E-.2351
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I-.039 J-1.216 P1  F30000
G1 X114.648 Y125.948 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5184
G1 X114.648 Y128.152 E.07312
G1 X115.495 Y128.152 E.02812
G1 X140.229 Y129.852 E.8224
G1 X141.279 Y129.852 E.03481
G1 X141.279 Y130.648 E.0264
G1 X114.352 Y130.648 E.89321
G1 X114.352 Y125.352 E.17567
G1 X141.58 Y125.352 E.90321
G1 X141.58 Y125.948 E.01977
G1 X114.708 Y125.948 E.89141
G1 X115.04 Y126.34 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5184
G1 X115.04 Y127.76 E.04363
G1 X115.509 Y127.76 E.01441
G1 X140.243 Y129.46 E.7618
G1 X141.671 Y129.46 E.04388
G1 X141.671 Y131.04 E.04855
G1 X113.96 Y131.04 E.85148
G1 X113.96 Y124.96 E.18682
G1 X141.973 Y124.96 E.86075
G1 X141.973 Y126.34 E.0424
G1 X115.1 Y126.34 E.82572
M204 S10000
G1 X114.556 Y125.65 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5184
G1 X141.377 Y125.65 E.41256
; WIPE_START
G1 F24000
G1 X139.377 Y125.65 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I-1.142 J.422 P1  F30000
G1 X141.075 Y130.25 Z2.6
G1 Z2.2
G1 E.8 F1800
; LINE_WIDTH: 0.431684
G1 F5184
G3 X140.209 Y130.25 I-.426 J-25.243 E.02745
; LINE_WIDTH: 0.432142
G1 X139.511 Y130.226 E.02217
; LINE_WIDTH: 0.475922
G1 X138.812 Y130.202 E.02466
; LINE_WIDTH: 0.519701
G1 X138.114 Y130.178 E.02715
; LINE_WIDTH: 0.56348
G1 X137.415 Y130.154 E.02965
; LINE_WIDTH: 0.60726
G1 X136.717 Y130.13 E.03214
G1 X134.156 Y129.784 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5184
G1 X135.781 Y129.895 E.05401
G1 X135.376 Y130.3 E.01896
G1 X132.3 Y130.3 E.10206
G1 X131.609 Y129.609 E.03242
G1 X128.598 Y129.402 E.1001
G1 X127.7 Y130.3 E.04212
G1 X124.624 Y130.3 E.10206
G1 X123.366 Y129.042 E.05899
G1 X121.416 Y128.908 E.06485
G1 X120.024 Y130.3 E.06528
G1 X116.948 Y130.3 E.10206
G1 X115.148 Y128.5 E.08441
G3 X116.774 Y128.589 I.168 J11.868 E.05404
; WIPE_START
G1 F24000
G1 X115.148 Y128.5 E-.61852
G1 X115.412 Y128.764 E-.14148
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I-.526 J1.097 P1  F30000
G1 X145.893 Y143.389 Z2.6
M73 P67 R3
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5184
G1 X146.32 Y143.389 E.01416
G1 X146.32 Y144.184 E.0264
G1 X145.893 Y144.184 E.01416
G1 X145.893 Y143.449 E.02441
G1 X145.501 Y142.996 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5184
G1 X146.712 Y142.996 E.03721
G1 X146.712 Y144.576 E.04855
G1 X145.501 Y144.576 E.03721
G1 X145.501 Y143.056 E.04671
M204 S10000
; WIPE_START
G1 F24000
G1 X146.712 Y142.996 E-.46072
G1 X146.712 Y143.784 E-.29928
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I1.178 J-.307 P1  F30000
G1 X145.592 Y139.484 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5184
G1 X145.592 Y138.889 E.01977
G1 X146.32 Y138.889 E.02416
G1 X146.32 Y139.484 E.01977
G1 X145.652 Y139.484 E.02217
G1 X145.2 Y139.876 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5184
G1 X145.2 Y138.496 E.0424
G1 X146.712 Y138.496 E.04647
G1 X146.712 Y139.876 E.0424
G1 X145.26 Y139.876 E.04463
M204 S10000
; WIPE_START
G1 F24000
G1 X145.2 Y138.496 E-.5249
G1 X145.818 Y138.496 E-.2351
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I-.039 J-1.216 P1  F30000
G1 X115.32 Y139.484 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5184
G1 X115.32 Y141.689 E.07312
G1 X116.168 Y141.689 E.02812
G1 X140.902 Y143.389 E.8224
G1 X141.951 Y143.389 E.03481
G1 X141.951 Y144.184 E.0264
G1 X115.024 Y144.184 E.89321
G1 X115.024 Y138.889 E.17567
G1 X142.253 Y138.889 E.90321
G1 X142.253 Y139.484 E.01977
G1 X115.38 Y139.484 E.89141
G1 X115.712 Y139.876 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5184
G1 X115.712 Y141.296 E.04363
G1 X116.181 Y141.296 E.01441
G1 X140.915 Y142.996 E.7618
G1 X142.343 Y142.996 E.04388
G1 X142.343 Y144.576 E.04855
G1 X114.632 Y144.576 E.85148
G1 X114.632 Y138.496 E.18682
G1 X142.645 Y138.496 E.86075
G1 X142.645 Y139.876 E.0424
G1 X115.772 Y139.876 E.82572
M204 S10000
G1 X115.228 Y139.186 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5184
G1 X142.049 Y139.186 E.41256
; WIPE_START
G1 F24000
G1 X140.049 Y139.186 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I-1.142 J.422 P1  F30000
G1 X141.748 Y143.786 Z2.6
G1 Z2.2
G1 E.8 F1800
; LINE_WIDTH: 0.431684
G1 F5184
G3 X140.881 Y143.786 I-.426 J-25.243 E.02745
; LINE_WIDTH: 0.432142
G1 X140.183 Y143.762 E.02217
; LINE_WIDTH: 0.475922
G1 X139.484 Y143.738 E.02466
; LINE_WIDTH: 0.519701
G1 X138.786 Y143.714 E.02715
; LINE_WIDTH: 0.56348
G1 X138.087 Y143.69 E.02965
; LINE_WIDTH: 0.60726
G1 X137.389 Y143.666 E.03214
G1 X134.828 Y143.32 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5184
G1 X136.453 Y143.432 E.05401
G1 X136.049 Y143.836 E.01896
G1 X132.972 Y143.836 E.10206
G1 X132.281 Y143.145 E.03242
G1 X129.27 Y142.938 E.1001
G1 X128.373 Y143.836 E.04212
G1 X125.296 Y143.836 E.10206
G1 X124.038 Y142.579 E.05899
G1 X122.088 Y142.445 E.06485
G1 X120.697 Y143.836 E.06528
G1 X117.62 Y143.836 E.10206
G1 X115.821 Y142.037 E.08441
G3 X117.446 Y142.126 I.168 J11.868 E.05404
; CHANGE_LAYER
; Z_HEIGHT: 2.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X115.821 Y142.037 E-.61852
G1 X116.084 Y142.3 E-.14148
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 12/30
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
G3 Z2.6 I.476 J1.12 P1  F30000
G1 X145.338 Y129.852 Z2.6
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5147
G1 X145.648 Y129.852 E.01027
G1 X145.648 Y130.648 E.0264
G1 X145.338 Y130.648 E.01027
G1 X145.338 Y129.912 E.02441
G1 X144.946 Y129.46 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5147
G1 X146.04 Y129.46 E.03361
G1 X146.04 Y131.04 E.04855
G1 X144.946 Y131.04 E.03361
G1 X144.946 Y129.52 E.04671
M204 S10000
; WIPE_START
G1 F24000
M73 P68 R3
G1 X146.04 Y129.46 E-.41622
G1 X146.04 Y130.365 E-.34378
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I1.188 J-.264 P1  F30000
G1 X145.058 Y125.948 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5147
G1 X145.058 Y125.352 E.01977
G1 X145.648 Y125.352 E.01958
G1 X145.648 Y125.948 E.01977
G1 X145.118 Y125.948 E.01759
G1 X144.666 Y126.34 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5147
G1 X144.666 Y124.96 E.0424
G1 X146.04 Y124.96 E.04223
G1 X146.04 Y126.34 E.0424
G1 X144.726 Y126.34 E.04039
M204 S10000
; WIPE_START
G1 F24000
G1 X144.666 Y124.96 E-.5249
G1 X145.284 Y124.96 E-.2351
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I-.039 J-1.216 P1  F30000
G1 X114.648 Y125.948 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5147
G1 X114.648 Y128.152 E.07312
G1 X115.495 Y128.152 E.02812
G1 X140.229 Y129.852 E.8224
G1 X141.162 Y129.852 E.03092
G1 X141.162 Y130.648 E.0264
G1 X114.352 Y130.648 E.88932
G1 X114.352 Y125.352 E.17567
G1 X141.442 Y125.352 E.89863
G1 X141.442 Y125.948 E.01977
G1 X114.708 Y125.948 E.88683
G1 X115.04 Y126.34 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5147
G1 X115.04 Y127.76 E.04363
G1 X115.509 Y127.76 E.01441
G1 X140.243 Y129.46 E.7618
G1 X141.554 Y129.46 E.04028
G1 X141.554 Y131.04 E.04855
G1 X113.96 Y131.04 E.84788
G1 X113.96 Y124.96 E.18682
G1 X141.834 Y124.96 E.8565
G1 X141.834 Y126.34 E.0424
G1 X115.1 Y126.34 E.82148
M204 S10000
G1 X114.556 Y125.65 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5147
G1 X141.239 Y125.65 E.41044
; WIPE_START
G1 F24000
G1 X139.239 Y125.65 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I-1.14 J.426 P1  F30000
G1 X140.958 Y130.25 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.431684
G1 F5147
G3 X140.209 Y130.25 I-.368 J-21.825 E.02373
; LINE_WIDTH: 0.432142
G1 X139.511 Y130.226 E.02217
; LINE_WIDTH: 0.475922
G1 X138.812 Y130.202 E.02466
; LINE_WIDTH: 0.519701
G1 X138.114 Y130.178 E.02715
; LINE_WIDTH: 0.56348
G1 X137.415 Y130.154 E.02965
; LINE_WIDTH: 0.60726
G1 X136.717 Y130.13 E.03214
G1 X134.156 Y129.784 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5147
G1 X135.781 Y129.895 E.05401
G1 X135.376 Y130.3 E.01896
G1 X132.3 Y130.3 E.10206
G1 X131.609 Y129.609 E.03242
G1 X128.598 Y129.402 E.1001
G1 X127.7 Y130.3 E.04212
G1 X124.624 Y130.3 E.10206
G1 X123.366 Y129.042 E.05899
G1 X121.416 Y128.908 E.06485
G1 X120.024 Y130.3 E.06528
G1 X116.948 Y130.3 E.10206
G1 X115.148 Y128.5 E.08441
G3 X116.774 Y128.589 I.168 J11.868 E.05404
; WIPE_START
G1 F24000
G1 X115.148 Y128.5 E-.61852
G1 X115.412 Y128.764 E-.14148
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I-.525 J1.098 P1  F30000
G1 X146.011 Y143.389 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5147
G1 X146.32 Y143.389 E.01027
G1 X146.32 Y144.184 E.0264
G1 X146.011 Y144.184 E.01027
G1 X146.011 Y143.449 E.02441
G1 X145.619 Y142.996 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5147
G1 X146.712 Y142.996 E.03361
G1 X146.712 Y144.576 E.04855
G1 X145.619 Y144.576 E.03361
G1 X145.619 Y143.056 E.04671
M204 S10000
; WIPE_START
G1 F24000
G1 X146.712 Y142.996 E-.41622
G1 X146.712 Y143.901 E-.34378
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I1.188 J-.264 P1  F30000
G1 X145.73 Y139.484 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5147
G1 X145.73 Y138.889 E.01977
G1 X146.32 Y138.889 E.01958
G1 X146.32 Y139.484 E.01977
G1 X145.79 Y139.484 E.01759
G1 X145.338 Y139.876 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5147
G1 X145.338 Y138.496 E.0424
G1 X146.712 Y138.496 E.04223
G1 X146.712 Y139.876 E.0424
G1 X145.398 Y139.876 E.04039
M204 S10000
; WIPE_START
G1 F24000
G1 X145.338 Y138.496 E-.5249
G1 X145.956 Y138.496 E-.2351
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I-.039 J-1.216 P1  F30000
G1 X115.32 Y139.484 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5147
G1 X115.32 Y141.689 E.07312
G1 X116.168 Y141.689 E.02812
G1 X140.902 Y143.389 E.8224
G1 X141.834 Y143.389 E.03092
G1 X141.834 Y144.184 E.0264
G1 X115.024 Y144.184 E.88932
G1 X115.024 Y138.889 E.17567
G1 X142.115 Y138.889 E.89863
G1 X142.115 Y139.484 E.01977
G1 X115.38 Y139.484 E.88683
G1 X115.712 Y139.876 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5147
G1 X115.712 Y141.296 E.04363
G1 X116.181 Y141.296 E.01441
G1 X140.915 Y142.996 E.7618
G1 X142.226 Y142.996 E.04028
G1 X142.226 Y144.576 E.04855
G1 X114.632 Y144.576 E.84788
G1 X114.632 Y138.496 E.18682
G1 X142.507 Y138.496 E.8565
G1 X142.507 Y139.876 E.0424
G1 X115.772 Y139.876 E.82148
M204 S10000
G1 X115.228 Y139.186 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5147
G1 X141.911 Y139.186 E.41044
; WIPE_START
G1 F24000
G1 X139.911 Y139.186 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I-1.14 J.426 P1  F30000
G1 X141.63 Y143.786 Z2.8
M73 P69 R3
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.431684
G1 F5147
G3 X140.881 Y143.786 I-.368 J-21.825 E.02373
; LINE_WIDTH: 0.432142
G1 X140.183 Y143.762 E.02217
; LINE_WIDTH: 0.475922
G1 X139.484 Y143.738 E.02466
; LINE_WIDTH: 0.519701
G1 X138.786 Y143.714 E.02715
; LINE_WIDTH: 0.56348
G1 X138.087 Y143.69 E.02965
; LINE_WIDTH: 0.60726
G1 X137.389 Y143.666 E.03214
G1 X134.828 Y143.32 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5147
G1 X136.453 Y143.432 E.05401
G1 X136.049 Y143.836 E.01896
G1 X132.972 Y143.836 E.10206
G1 X132.281 Y143.145 E.03242
G1 X129.27 Y142.938 E.1001
G1 X128.373 Y143.836 E.04212
G1 X125.296 Y143.836 E.10206
G1 X124.038 Y142.579 E.05899
G1 X122.088 Y142.445 E.06485
G1 X120.697 Y143.836 E.06528
G1 X117.62 Y143.836 E.10206
G1 X115.821 Y142.037 E.08441
G3 X117.446 Y142.126 I.168 J11.868 E.05404
; CHANGE_LAYER
; Z_HEIGHT: 2.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X115.821 Y142.037 E-.61852
G1 X116.084 Y142.3 E-.14148
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 13/30
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
G3 Z2.8 I.494 J1.112 P1  F30000
G1 X145.022 Y129.46 Z2.8
G1 Z2.6
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5087
G1 X146.04 Y129.46 E.03127
G1 X146.04 Y131.04 E.04855
G1 X145.022 Y131.04 E.03127
G1 X145.022 Y129.52 E.04671
M204 S10000
; WIPE_START
G1 F24000
G1 X146.04 Y129.46 E-.38744
G1 X146.04 Y130.44 E-.37256
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I1.194 J-.237 P1  F30000
G1 X145.149 Y125.948 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5087
G1 X145.149 Y125.352 E.01977
G1 X145.648 Y125.352 E.01656
G1 X145.648 Y125.948 E.01977
G1 X145.209 Y125.948 E.01457
G1 X144.757 Y126.34 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5087
G1 X144.757 Y124.96 E.0424
G1 X146.04 Y124.96 E.03943
G1 X146.04 Y126.34 E.0424
G1 X144.817 Y126.34 E.03759
M204 S10000
G1 X145.398 Y125.744 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.134926
G1 F5087
G1 X145.398 Y125.556 E.00142
; WIPE_START
G1 F24000
G1 X145.398 Y125.744 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I-.008 J-1.217 P1  F30000
G1 X114.648 Y125.948 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5087
G1 X114.648 Y128.152 E.07312
G1 X115.495 Y128.152 E.02812
G1 X140.229 Y129.852 E.8224
G1 X141.086 Y129.852 E.02841
G1 X141.086 Y130.648 E.0264
G1 X114.352 Y130.648 E.8868
G1 X114.352 Y125.352 E.17567
G1 X141.351 Y125.352 E.89561
G1 X141.351 Y125.948 E.01977
G1 X114.708 Y125.948 E.88381
G1 X115.04 Y126.34 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5087
G1 X115.04 Y127.76 E.04363
G1 X115.509 Y127.76 E.01441
G1 X140.243 Y129.46 E.7618
G1 X141.478 Y129.46 E.03795
G1 X141.478 Y131.04 E.04855
G1 X113.96 Y131.04 E.84555
G1 X113.96 Y124.96 E.18682
G1 X141.743 Y124.96 E.8537
G1 X141.743 Y126.34 E.0424
G1 X115.1 Y126.34 E.81867
M204 S10000
G1 X114.556 Y125.65 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5087
G1 X141.148 Y125.65 E.40903
; WIPE_START
G1 F24000
G1 X139.148 Y125.65 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I-1.139 J.429 P1  F30000
G1 X140.882 Y130.25 Z3
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.431684
G1 F5087
G3 X140.209 Y130.25 I-.33 J-19.615 E.02133
; LINE_WIDTH: 0.432142
G1 X139.511 Y130.226 E.02217
; LINE_WIDTH: 0.475922
G1 X138.812 Y130.202 E.02466
; LINE_WIDTH: 0.519701
G1 X138.114 Y130.178 E.02715
; LINE_WIDTH: 0.56348
G1 X137.415 Y130.154 E.02965
; LINE_WIDTH: 0.60726
G1 X136.717 Y130.13 E.03214
G1 X134.156 Y129.784 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5087
G1 X135.781 Y129.895 E.05401
G1 X135.376 Y130.3 E.01896
G1 X132.3 Y130.3 E.10206
G1 X131.609 Y129.609 E.03242
G1 X128.598 Y129.402 E.1001
G1 X127.7 Y130.3 E.04212
G1 X124.624 Y130.3 E.10206
G1 X123.366 Y129.042 E.05899
G1 X121.416 Y128.908 E.06485
G1 X120.024 Y130.3 E.06528
G1 X116.948 Y130.3 E.10206
G1 X115.148 Y128.5 E.08441
G3 X116.774 Y128.589 I.168 J11.868 E.05404
; WIPE_START
G1 F24000
G1 X115.148 Y128.5 E-.61852
G1 X115.412 Y128.764 E-.14148
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I-.518 J1.101 P1  F30000
G1 X145.694 Y142.996 Z3
G1 Z2.6
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M73 P70 R3
G1 F5087
G1 X146.712 Y142.996 E.03127
G1 X146.712 Y144.576 E.04855
G1 X145.694 Y144.576 E.03127
G1 X145.694 Y143.056 E.04671
M204 S10000
; WIPE_START
G1 F24000
G1 X146.712 Y142.996 E-.38744
G1 X146.712 Y143.977 E-.37256
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I1.194 J-.237 P1  F30000
G1 X145.821 Y139.484 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5087
G1 X145.821 Y138.889 E.01977
G1 X146.32 Y138.889 E.01656
G1 X146.32 Y139.484 E.01977
G1 X145.881 Y139.484 E.01457
G1 X145.429 Y139.876 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5087
G1 X145.429 Y138.496 E.0424
G1 X146.712 Y138.496 E.03943
G1 X146.712 Y139.876 E.0424
G1 X145.489 Y139.876 E.03759
M204 S10000
G1 X146.071 Y139.281 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.134926
G1 F5087
G1 X146.071 Y139.092 E.00142
; WIPE_START
G1 F24000
G1 X146.071 Y139.281 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I-.008 J-1.217 P1  F30000
G1 X115.32 Y139.484 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5087
G1 X115.32 Y141.689 E.07312
G1 X116.168 Y141.689 E.02812
G1 X140.902 Y143.389 E.8224
G1 X141.758 Y143.389 E.02841
G1 X141.758 Y144.184 E.0264
G1 X115.024 Y144.184 E.8868
G1 X115.024 Y138.889 E.17567
G1 X142.023 Y138.889 E.89561
G1 X142.023 Y139.484 E.01977
G1 X115.38 Y139.484 E.88381
G1 X115.712 Y139.876 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5087
G1 X115.712 Y141.296 E.04363
G1 X116.181 Y141.296 E.01441
G1 X140.915 Y142.996 E.7618
G1 X142.15 Y142.996 E.03795
G1 X142.15 Y144.576 E.04855
G1 X114.632 Y144.576 E.84555
G1 X114.632 Y138.496 E.18682
G1 X142.415 Y138.496 E.8537
G1 X142.415 Y139.876 E.0424
G1 X115.772 Y139.876 E.81867
M204 S10000
G1 X115.228 Y139.186 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5087
G1 X141.82 Y139.186 E.40903
; WIPE_START
G1 F24000
G1 X139.82 Y139.186 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I-1.139 J.429 P1  F30000
G1 X141.554 Y143.786 Z3
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.431684
G1 F5087
G3 X140.881 Y143.786 I-.33 J-19.615 E.02133
; LINE_WIDTH: 0.432142
G1 X140.183 Y143.762 E.02217
; LINE_WIDTH: 0.475922
G1 X139.484 Y143.738 E.02466
; LINE_WIDTH: 0.519701
G1 X138.786 Y143.714 E.02715
; LINE_WIDTH: 0.56348
G1 X138.087 Y143.69 E.02965
; LINE_WIDTH: 0.60726
G1 X137.389 Y143.666 E.03214
G1 X134.828 Y143.32 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5087
G1 X136.453 Y143.432 E.05401
G1 X136.049 Y143.836 E.01896
G1 X132.972 Y143.836 E.10206
G1 X132.281 Y143.145 E.03242
G1 X129.27 Y142.938 E.1001
G1 X128.373 Y143.836 E.04212
G1 X125.296 Y143.836 E.10206
G1 X124.038 Y142.579 E.05899
G1 X122.088 Y142.445 E.06485
G1 X120.697 Y143.836 E.06528
G1 X117.62 Y143.836 E.10206
G1 X115.821 Y142.037 E.08441
G3 X117.446 Y142.126 I.168 J11.868 E.05404
; CHANGE_LAYER
; Z_HEIGHT: 2.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X115.821 Y142.037 E-.61852
G1 X116.084 Y142.3 E-.14148
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 14/30
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
G3 Z3 I.493 J1.113 P1  F30000
G1 X145.074 Y129.46 Z3
G1 Z2.8
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5088
G1 X146.04 Y129.46 E.0297
G1 X146.04 Y131.04 E.04855
G1 X145.074 Y131.04 E.0297
G1 X145.074 Y129.52 E.04671
M204 S10000
G1 X145.557 Y129.656 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.617268
G1 F5088
G1 X145.557 Y130.844 E.0556
; WIPE_START
G1 F24000
G1 X145.557 Y129.656 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I1.212 J-.111 P1  F30000
G1 X145.216 Y125.948 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
M73 P71 R3
G1 F5088
G1 X145.216 Y125.352 E.01977
G1 X145.648 Y125.352 E.01434
G1 X145.648 Y125.948 E.01977
G1 X145.276 Y125.948 E.01235
G1 X144.824 Y126.34 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5088
G1 X144.824 Y124.96 E.0424
G1 X146.04 Y124.96 E.03738
G1 X146.04 Y126.34 E.0424
G1 X144.884 Y126.34 E.03553
M204 S10000
; WIPE_START
G1 F24000
G1 X144.824 Y124.96 E-.5249
G1 X145.442 Y124.96 E-.2351
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I-.039 J-1.216 P1  F30000
G1 X114.648 Y125.948 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5088
G1 X114.648 Y128.152 E.07312
G1 X115.495 Y128.152 E.02812
G1 X140.229 Y129.852 E.8224
G1 X141.034 Y129.852 E.0267
G1 X141.034 Y130.648 E.0264
G1 X114.352 Y130.648 E.8851
G1 X114.352 Y125.352 E.17567
G1 X141.284 Y125.352 E.89339
G1 X141.284 Y125.948 E.01977
G1 X114.708 Y125.948 E.88159
G1 X115.04 Y126.34 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5088
G1 X115.04 Y127.76 E.04363
G1 X115.509 Y127.76 E.01441
G1 X140.243 Y129.46 E.7618
G1 X141.426 Y129.46 E.03637
G1 X141.426 Y131.04 E.04855
G1 X113.96 Y131.04 E.84397
G1 X113.96 Y124.96 E.18682
G1 X141.676 Y124.96 E.85165
G1 X141.676 Y126.34 E.0424
G1 X115.1 Y126.34 E.81662
M204 S10000
G1 X114.556 Y125.65 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5088
G1 X141.081 Y125.65 E.40801
; WIPE_START
G1 F24000
G1 X139.081 Y125.65 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I-1.137 J.433 P1  F30000
G1 X140.831 Y130.25 Z3.2
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.431684
G1 F5088
G3 X140.209 Y130.25 I-.304 J-18.118 E.0197
; LINE_WIDTH: 0.432142
G1 X139.511 Y130.226 E.02217
; LINE_WIDTH: 0.475922
G1 X138.812 Y130.202 E.02466
; LINE_WIDTH: 0.519701
G1 X138.114 Y130.178 E.02715
; LINE_WIDTH: 0.56348
G1 X137.415 Y130.154 E.02965
; LINE_WIDTH: 0.60726
G1 X136.717 Y130.13 E.03214
G1 X134.156 Y129.784 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5088
G1 X135.781 Y129.895 E.05401
G1 X135.376 Y130.3 E.01896
G1 X132.3 Y130.3 E.10206
G1 X131.609 Y129.609 E.03242
G1 X128.598 Y129.402 E.1001
G1 X127.7 Y130.3 E.04212
G1 X124.624 Y130.3 E.10206
G1 X123.366 Y129.042 E.05899
G1 X121.416 Y128.908 E.06485
G1 X120.024 Y130.3 E.06528
G1 X116.948 Y130.3 E.10206
G1 X115.148 Y128.5 E.08441
G3 X116.774 Y128.589 I.168 J11.868 E.05404
; WIPE_START
G1 F24000
G1 X115.148 Y128.5 E-.61852
G1 X115.412 Y128.764 E-.14148
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I-.517 J1.102 P1  F30000
G1 X145.746 Y142.996 Z3.2
G1 Z2.8
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5088
G1 X146.712 Y142.996 E.0297
G1 X146.712 Y144.576 E.04855
G1 X145.746 Y144.576 E.0297
G1 X145.746 Y143.056 E.04671
M204 S10000
G1 X146.229 Y143.193 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.617268
G1 F5088
G1 X146.229 Y144.38 E.0556
; WIPE_START
G1 F24000
G1 X146.229 Y143.193 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I1.212 J-.111 P1  F30000
G1 X145.888 Y139.484 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5088
G1 X145.888 Y138.889 E.01977
G1 X146.32 Y138.889 E.01434
G1 X146.32 Y139.484 E.01977
G1 X145.948 Y139.484 E.01235
G1 X145.496 Y139.876 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5088
G1 X145.496 Y138.496 E.0424
G1 X146.712 Y138.496 E.03738
G1 X146.712 Y139.876 E.0424
G1 X145.556 Y139.876 E.03553
M204 S10000
; WIPE_START
G1 F24000
G1 X145.496 Y138.496 E-.5249
G1 X146.114 Y138.496 E-.2351
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I-.039 J-1.216 P1  F30000
G1 X115.32 Y139.484 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5088
G1 X115.32 Y141.689 E.07312
G1 X116.168 Y141.689 E.02812
G1 X140.902 Y143.389 E.8224
G1 X141.707 Y143.389 E.0267
G1 X141.707 Y144.184 E.0264
G1 X115.024 Y144.184 E.8851
G1 X115.024 Y138.889 E.17567
G1 X141.957 Y138.889 E.89339
G1 X141.957 Y139.484 E.01977
G1 X115.38 Y139.484 E.88159
G1 X115.712 Y139.876 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5088
G1 X115.712 Y141.296 E.04363
G1 X116.181 Y141.296 E.01441
G1 X140.915 Y142.996 E.7618
G1 X142.099 Y142.996 E.03637
G1 X142.099 Y144.576 E.04855
G1 X114.632 Y144.576 E.84397
G1 X114.632 Y138.496 E.18682
G1 X142.349 Y138.496 E.85165
G1 X142.349 Y139.876 E.0424
G1 X115.772 Y139.876 E.81662
M204 S10000
G1 X115.228 Y139.186 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5088
G1 X141.753 Y139.186 E.40801
; WIPE_START
G1 F24000
G1 X139.753 Y139.186 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I-1.137 J.433 P1  F30000
G1 X141.503 Y143.786 Z3.2
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.431684
G1 F5088
G3 X140.881 Y143.786 I-.304 J-18.118 E.0197
; LINE_WIDTH: 0.432142
G1 X140.183 Y143.762 E.02217
; LINE_WIDTH: 0.475922
G1 X139.484 Y143.738 E.02466
; LINE_WIDTH: 0.519701
G1 X138.786 Y143.714 E.02715
; LINE_WIDTH: 0.56348
G1 X138.087 Y143.69 E.02965
; LINE_WIDTH: 0.60726
G1 X137.389 Y143.666 E.03214
G1 X134.828 Y143.32 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5088
G1 X136.453 Y143.432 E.05401
G1 X136.049 Y143.836 E.01896
G1 X132.972 Y143.836 E.10206
G1 X132.281 Y143.145 E.03242
G1 X129.27 Y142.938 E.1001
G1 X128.373 Y143.836 E.04212
G1 X125.296 Y143.836 E.10206
M73 P72 R3
G1 X124.038 Y142.579 E.05899
G1 X122.088 Y142.445 E.06485
G1 X120.697 Y143.836 E.06528
G1 X117.62 Y143.836 E.10206
G1 X115.821 Y142.037 E.08441
G3 X117.446 Y142.126 I.168 J11.868 E.05404
; CHANGE_LAYER
; Z_HEIGHT: 3
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X115.821 Y142.037 E-.61852
G1 X116.084 Y142.3 E-.14148
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 15/30
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
G3 Z3.2 I.492 J1.113 P1  F30000
G1 X145.098 Y129.46 Z3.2
G1 Z3
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5082
G1 X146.04 Y129.46 E.02895
G1 X146.04 Y131.04 E.04855
G1 X145.098 Y131.04 E.02895
G1 X145.098 Y129.52 E.04671
M204 S10000
G1 X145.569 Y129.656 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.592984
G1 F5082
G1 X145.569 Y130.844 E.05325
; WIPE_START
G1 F24000
G1 X145.569 Y129.656 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I1.212 J-.108 P1  F30000
G1 X145.24 Y125.948 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5082
G1 X145.24 Y125.352 E.01977
G1 X145.648 Y125.352 E.01353
G1 X145.648 Y125.948 E.01977
G1 X145.3 Y125.948 E.01154
G1 X144.848 Y126.34 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5082
G1 X144.848 Y124.96 E.0424
G1 X146.04 Y124.96 E.03663
G1 X146.04 Y126.34 E.0424
G1 X144.908 Y126.34 E.03479
M204 S10000
; WIPE_START
G1 F24000
G1 X144.848 Y124.96 E-.5249
G1 X145.467 Y124.96 E-.2351
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.039 J-1.216 P1  F30000
G1 X114.648 Y125.948 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5082
G1 X114.648 Y128.152 E.07312
G1 X115.495 Y128.152 E.02812
G1 X140.229 Y129.852 E.8224
G1 X141.01 Y129.852 E.0259
G1 X141.01 Y130.648 E.0264
G1 X114.352 Y130.648 E.88429
G1 X114.352 Y125.352 E.17567
G1 X141.26 Y125.352 E.89259
G1 X141.26 Y125.948 E.01977
G1 X114.708 Y125.948 E.88078
G1 X115.04 Y126.34 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5082
G1 X115.04 Y127.76 E.04363
G1 X115.509 Y127.76 E.01441
G1 X140.243 Y129.46 E.7618
G1 X141.402 Y129.46 E.03562
G1 X141.402 Y131.04 E.04855
G1 X113.96 Y131.04 E.84322
G1 X113.96 Y124.96 E.18682
G1 X141.652 Y124.96 E.8509
G1 X141.652 Y126.34 E.0424
G1 X115.1 Y126.34 E.81587
M204 S10000
G1 X114.556 Y125.65 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5082
G1 X141.057 Y125.65 E.40763
; WIPE_START
G1 F24000
G1 X139.057 Y125.65 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.137 J.433 P1  F30000
G1 X140.807 Y130.25 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.431684
G1 F5082
G3 X140.209 Y130.25 I-.292 J-17.41 E.01893
; LINE_WIDTH: 0.432142
G1 X139.511 Y130.226 E.02217
; LINE_WIDTH: 0.475922
G1 X138.812 Y130.202 E.02466
; LINE_WIDTH: 0.519701
G1 X138.114 Y130.178 E.02715
; LINE_WIDTH: 0.56348
G1 X137.415 Y130.154 E.02965
; LINE_WIDTH: 0.60726
G1 X136.717 Y130.13 E.03214
G1 X134.156 Y129.784 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5082
G1 X135.781 Y129.895 E.05401
G1 X135.376 Y130.3 E.01896
G1 X132.3 Y130.3 E.10206
G1 X131.609 Y129.609 E.03242
G1 X128.598 Y129.402 E.1001
G1 X127.7 Y130.3 E.04212
G1 X124.624 Y130.3 E.10206
G1 X123.366 Y129.042 E.05899
G1 X121.416 Y128.908 E.06485
G1 X120.024 Y130.3 E.06528
G1 X116.948 Y130.3 E.10206
G1 X115.148 Y128.5 E.08441
G3 X116.774 Y128.589 I.168 J11.868 E.05404
; WIPE_START
G1 F24000
G1 X115.148 Y128.5 E-.61852
G1 X115.412 Y128.764 E-.14148
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.517 J1.102 P1  F30000
G1 X145.77 Y142.996 Z3.4
G1 Z3
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5082
G1 X146.712 Y142.996 E.02895
G1 X146.712 Y144.576 E.04855
G1 X145.77 Y144.576 E.02895
G1 X145.77 Y143.056 E.04671
M204 S10000
M73 P73 R3
G1 X146.241 Y143.193 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.592984
G1 F5082
G1 X146.241 Y144.38 E.05325
; WIPE_START
G1 F24000
G1 X146.241 Y143.193 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I1.212 J-.108 P1  F30000
G1 X145.912 Y139.484 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5082
G1 X145.912 Y138.889 E.01977
G1 X146.32 Y138.889 E.01353
G1 X146.32 Y139.484 E.01977
G1 X145.972 Y139.484 E.01154
G1 X145.52 Y139.876 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5082
G1 X145.52 Y138.496 E.0424
G1 X146.712 Y138.496 E.03663
G1 X146.712 Y139.876 E.0424
G1 X145.58 Y139.876 E.03479
M204 S10000
; WIPE_START
G1 F24000
G1 X145.52 Y138.496 E-.5249
G1 X146.139 Y138.496 E-.2351
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.039 J-1.216 P1  F30000
G1 X115.32 Y139.484 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5082
G1 X115.32 Y141.689 E.07312
G1 X116.168 Y141.689 E.02812
G1 X140.902 Y143.389 E.8224
G1 X141.682 Y143.389 E.0259
G1 X141.682 Y144.184 E.0264
G1 X115.024 Y144.184 E.88429
G1 X115.024 Y138.889 E.17567
G1 X141.932 Y138.889 E.89259
G1 X141.932 Y139.484 E.01977
G1 X115.38 Y139.484 E.88078
G1 X115.712 Y139.876 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5082
G1 X115.712 Y141.296 E.04363
G1 X116.181 Y141.296 E.01441
G1 X140.915 Y142.996 E.7618
G1 X142.074 Y142.996 E.03562
G1 X142.074 Y144.576 E.04855
G1 X114.632 Y144.576 E.84322
G1 X114.632 Y138.496 E.18682
G1 X142.324 Y138.496 E.8509
G1 X142.324 Y139.876 E.0424
G1 X115.772 Y139.876 E.81587
M204 S10000
G1 X115.228 Y139.186 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5082
G1 X141.729 Y139.186 E.40763
; WIPE_START
G1 F24000
G1 X139.729 Y139.186 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.137 J.433 P1  F30000
G1 X141.479 Y143.786 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.431684
G1 F5082
G3 X140.881 Y143.786 I-.292 J-17.41 E.01893
; LINE_WIDTH: 0.432142
G1 X140.183 Y143.762 E.02217
; LINE_WIDTH: 0.475922
G1 X139.484 Y143.738 E.02466
; LINE_WIDTH: 0.519701
G1 X138.786 Y143.714 E.02715
; LINE_WIDTH: 0.56348
G1 X138.087 Y143.69 E.02965
; LINE_WIDTH: 0.60726
G1 X137.389 Y143.666 E.03214
G1 X134.828 Y143.32 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5082
G1 X136.453 Y143.432 E.05401
G1 X136.049 Y143.836 E.01896
G1 X132.972 Y143.836 E.10206
G1 X132.281 Y143.145 E.03242
G1 X129.27 Y142.938 E.1001
G1 X128.373 Y143.836 E.04212
G1 X125.296 Y143.836 E.10206
G1 X124.038 Y142.579 E.05899
G1 X122.088 Y142.445 E.06485
G1 X120.697 Y143.836 E.06528
G1 X117.62 Y143.836 E.10206
G1 X115.821 Y142.037 E.08441
G3 X117.446 Y142.126 I.168 J11.868 E.05404
; CHANGE_LAYER
; Z_HEIGHT: 3.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X115.821 Y142.037 E-.61852
G1 X116.084 Y142.3 E-.14148
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 16/30
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
G3 Z3.4 I.492 J1.113 P1  F30000
G1 X145.098 Y129.46 Z3.4
G1 Z3.2
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5082
G1 X146.04 Y129.46 E.02895
G1 X146.04 Y131.04 E.04855
G1 X145.098 Y131.04 E.02895
G1 X145.098 Y129.52 E.04671
M204 S10000
G1 X145.569 Y129.656 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.592984
G1 F5082
G1 X145.569 Y130.844 E.05325
; WIPE_START
G1 F24000
G1 X145.569 Y129.656 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I1.212 J-.108 P1  F30000
M73 P73 R2
G1 X145.24 Y125.948 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5082
G1 X145.24 Y125.352 E.01977
G1 X145.648 Y125.352 E.01353
G1 X145.648 Y125.948 E.01977
G1 X145.3 Y125.948 E.01154
G1 X144.848 Y126.34 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M73 P74 R2
G1 F5082
G1 X144.848 Y124.96 E.0424
G1 X146.04 Y124.96 E.03663
G1 X146.04 Y126.34 E.0424
G1 X144.908 Y126.34 E.03479
M204 S10000
; WIPE_START
G1 F24000
G1 X144.848 Y124.96 E-.5249
G1 X145.467 Y124.96 E-.2351
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I-.039 J-1.216 P1  F30000
G1 X114.648 Y125.948 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5082
G1 X114.648 Y128.152 E.07312
G1 X115.495 Y128.152 E.02812
G1 X140.229 Y129.852 E.8224
G1 X141.01 Y129.852 E.0259
G1 X141.01 Y130.648 E.0264
G1 X114.352 Y130.648 E.88429
G1 X114.352 Y125.352 E.17567
G1 X141.26 Y125.352 E.89259
G1 X141.26 Y125.948 E.01977
G1 X114.708 Y125.948 E.88078
G1 X115.04 Y126.34 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5082
G1 X115.04 Y127.76 E.04363
G1 X115.509 Y127.76 E.01441
G1 X140.243 Y129.46 E.7618
G1 X141.402 Y129.46 E.03562
G1 X141.402 Y131.04 E.04855
G1 X113.96 Y131.04 E.84322
G1 X113.96 Y124.96 E.18682
G1 X141.652 Y124.96 E.8509
G1 X141.652 Y126.34 E.0424
G1 X115.1 Y126.34 E.81587
M204 S10000
G1 X114.556 Y125.65 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5082
G1 X141.057 Y125.65 E.40763
; WIPE_START
G1 F24000
G1 X139.057 Y125.65 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I-1.137 J.433 P1  F30000
G1 X140.807 Y130.25 Z3.6
G1 Z3.2
G1 E.8 F1800
; LINE_WIDTH: 0.431684
G1 F5082
G3 X140.209 Y130.25 I-.292 J-17.41 E.01893
; LINE_WIDTH: 0.432142
G1 X139.511 Y130.226 E.02217
; LINE_WIDTH: 0.475922
G1 X138.812 Y130.202 E.02466
; LINE_WIDTH: 0.519701
G1 X138.114 Y130.178 E.02715
; LINE_WIDTH: 0.56348
G1 X137.415 Y130.154 E.02965
; LINE_WIDTH: 0.60726
G1 X136.717 Y130.13 E.03214
G1 X134.156 Y129.784 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5082
G1 X135.781 Y129.895 E.05401
G1 X135.376 Y130.3 E.01896
G1 X132.3 Y130.3 E.10206
G1 X131.609 Y129.609 E.03242
G1 X128.598 Y129.402 E.1001
G1 X127.7 Y130.3 E.04212
G1 X124.624 Y130.3 E.10206
G1 X123.366 Y129.042 E.05899
G1 X121.416 Y128.908 E.06485
G1 X120.024 Y130.3 E.06528
G1 X116.948 Y130.3 E.10206
G1 X115.148 Y128.5 E.08441
G3 X116.774 Y128.589 I.168 J11.868 E.05404
; WIPE_START
G1 F24000
G1 X115.148 Y128.5 E-.61852
G1 X115.412 Y128.764 E-.14148
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I-.517 J1.102 P1  F30000
G1 X145.77 Y142.996 Z3.6
G1 Z3.2
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5082
G1 X146.712 Y142.996 E.02895
G1 X146.712 Y144.576 E.04855
G1 X145.77 Y144.576 E.02895
G1 X145.77 Y143.056 E.04671
M204 S10000
G1 X146.241 Y143.193 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.592984
G1 F5082
G1 X146.241 Y144.38 E.05325
; WIPE_START
G1 F24000
G1 X146.241 Y143.193 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I1.212 J-.108 P1  F30000
G1 X145.912 Y139.484 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5082
G1 X145.912 Y138.889 E.01977
G1 X146.32 Y138.889 E.01353
G1 X146.32 Y139.484 E.01977
G1 X145.972 Y139.484 E.01154
G1 X145.52 Y139.876 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5082
G1 X145.52 Y138.496 E.0424
G1 X146.712 Y138.496 E.03663
G1 X146.712 Y139.876 E.0424
G1 X145.58 Y139.876 E.03479
M204 S10000
; WIPE_START
G1 F24000
G1 X145.52 Y138.496 E-.5249
G1 X146.139 Y138.496 E-.2351
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I-.039 J-1.216 P1  F30000
G1 X115.32 Y139.484 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5082
G1 X115.32 Y141.689 E.07312
G1 X116.168 Y141.689 E.02812
G1 X140.902 Y143.389 E.8224
G1 X141.682 Y143.389 E.0259
G1 X141.682 Y144.184 E.0264
G1 X115.024 Y144.184 E.88429
G1 X115.024 Y138.889 E.17567
G1 X141.932 Y138.889 E.89259
G1 X141.932 Y139.484 E.01977
G1 X115.38 Y139.484 E.88078
G1 X115.712 Y139.876 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5082
G1 X115.712 Y141.296 E.04363
G1 X116.181 Y141.296 E.01441
G1 X140.915 Y142.996 E.7618
G1 X142.074 Y142.996 E.03562
G1 X142.074 Y144.576 E.04855
G1 X114.632 Y144.576 E.84322
G1 X114.632 Y138.496 E.18682
G1 X142.324 Y138.496 E.8509
G1 X142.324 Y139.876 E.0424
G1 X115.772 Y139.876 E.81587
M204 S10000
G1 X115.228 Y139.186 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5082
G1 X141.729 Y139.186 E.40763
; WIPE_START
G1 F24000
G1 X139.729 Y139.186 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I-1.137 J.433 P1  F30000
G1 X141.479 Y143.786 Z3.6
G1 Z3.2
G1 E.8 F1800
; LINE_WIDTH: 0.431684
G1 F5082
G3 X140.881 Y143.786 I-.292 J-17.41 E.01893
; LINE_WIDTH: 0.432142
G1 X140.183 Y143.762 E.02217
; LINE_WIDTH: 0.475922
G1 X139.484 Y143.738 E.02466
; LINE_WIDTH: 0.519701
G1 X138.786 Y143.714 E.02715
; LINE_WIDTH: 0.56348
G1 X138.087 Y143.69 E.02965
; LINE_WIDTH: 0.60726
G1 X137.389 Y143.666 E.03214
G1 X134.828 Y143.32 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5082
G1 X136.453 Y143.432 E.05401
G1 X136.049 Y143.836 E.01896
G1 X132.972 Y143.836 E.10206
G1 X132.281 Y143.145 E.03242
G1 X129.27 Y142.938 E.1001
G1 X128.373 Y143.836 E.04212
G1 X125.296 Y143.836 E.10206
G1 X124.038 Y142.579 E.05899
G1 X122.088 Y142.445 E.06485
G1 X120.697 Y143.836 E.06528
G1 X117.62 Y143.836 E.10206
G1 X115.821 Y142.037 E.08441
G3 X117.446 Y142.126 I.168 J11.868 E.05404
; CHANGE_LAYER
; Z_HEIGHT: 3.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
M73 P75 R2
G1 X115.821 Y142.037 E-.61852
G1 X116.084 Y142.3 E-.14148
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 17/30
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
G3 Z3.6 I.493 J1.113 P1  F30000
G1 X145.074 Y129.46 Z3.6
G1 Z3.4
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5088
G1 X146.04 Y129.46 E.0297
G1 X146.04 Y131.04 E.04855
G1 X145.074 Y131.04 E.0297
G1 X145.074 Y129.52 E.04671
M204 S10000
G1 X145.557 Y129.656 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.617268
G1 F5088
G1 X145.557 Y130.844 E.0556
; WIPE_START
G1 F24000
G1 X145.557 Y129.656 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I1.212 J-.111 P1  F30000
G1 X145.216 Y125.948 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5088
G1 X145.216 Y125.352 E.01977
G1 X145.648 Y125.352 E.01434
G1 X145.648 Y125.948 E.01977
G1 X145.276 Y125.948 E.01235
G1 X144.824 Y126.34 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5088
G1 X144.824 Y124.96 E.0424
G1 X146.04 Y124.96 E.03738
G1 X146.04 Y126.34 E.0424
G1 X144.884 Y126.34 E.03553
M204 S10000
; WIPE_START
G1 F24000
G1 X144.824 Y124.96 E-.5249
G1 X145.442 Y124.96 E-.2351
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I-.039 J-1.216 P1  F30000
G1 X114.648 Y125.948 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5088
G1 X114.648 Y128.152 E.07312
G1 X115.495 Y128.152 E.02812
G1 X140.229 Y129.852 E.8224
G1 X141.034 Y129.852 E.0267
G1 X141.034 Y130.648 E.0264
G1 X114.352 Y130.648 E.8851
G1 X114.352 Y125.352 E.17567
G1 X141.284 Y125.352 E.89339
G1 X141.284 Y125.948 E.01977
G1 X114.708 Y125.948 E.88159
G1 X115.04 Y126.34 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5088
G1 X115.04 Y127.76 E.04363
G1 X115.509 Y127.76 E.01441
G1 X140.243 Y129.46 E.7618
G1 X141.426 Y129.46 E.03637
G1 X141.426 Y131.04 E.04855
G1 X113.96 Y131.04 E.84397
G1 X113.96 Y124.96 E.18682
G1 X141.676 Y124.96 E.85165
G1 X141.676 Y126.34 E.0424
G1 X115.1 Y126.34 E.81662
M204 S10000
G1 X114.556 Y125.65 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5088
G1 X141.081 Y125.65 E.40801
; WIPE_START
G1 F24000
G1 X139.081 Y125.65 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I-1.137 J.433 P1  F30000
G1 X140.831 Y130.25 Z3.8
G1 Z3.4
G1 E.8 F1800
; LINE_WIDTH: 0.431684
G1 F5088
G3 X140.209 Y130.25 I-.304 J-18.118 E.0197
; LINE_WIDTH: 0.432142
G1 X139.511 Y130.226 E.02217
; LINE_WIDTH: 0.475922
G1 X138.812 Y130.202 E.02466
; LINE_WIDTH: 0.519701
G1 X138.114 Y130.178 E.02715
; LINE_WIDTH: 0.56348
G1 X137.415 Y130.154 E.02965
; LINE_WIDTH: 0.60726
G1 X136.717 Y130.13 E.03214
G1 X134.156 Y129.784 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5088
G1 X135.781 Y129.895 E.05401
G1 X135.376 Y130.3 E.01896
G1 X132.3 Y130.3 E.10206
G1 X131.609 Y129.609 E.03242
G1 X128.598 Y129.402 E.1001
G1 X127.7 Y130.3 E.04212
G1 X124.624 Y130.3 E.10206
G1 X123.366 Y129.042 E.05899
G1 X121.416 Y128.908 E.06485
G1 X120.024 Y130.3 E.06528
G1 X116.948 Y130.3 E.10206
G1 X115.148 Y128.5 E.08441
G3 X116.774 Y128.589 I.168 J11.868 E.05404
; WIPE_START
G1 F24000
G1 X115.148 Y128.5 E-.61852
G1 X115.412 Y128.764 E-.14148
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I-.517 J1.102 P1  F30000
G1 X145.746 Y142.996 Z3.8
G1 Z3.4
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5088
G1 X146.712 Y142.996 E.0297
G1 X146.712 Y144.576 E.04855
G1 X145.746 Y144.576 E.0297
G1 X145.746 Y143.056 E.04671
M204 S10000
G1 X146.229 Y143.193 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.617268
G1 F5088
G1 X146.229 Y144.38 E.0556
; WIPE_START
M73 P76 R2
G1 F24000
G1 X146.229 Y143.193 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I1.212 J-.111 P1  F30000
G1 X145.888 Y139.484 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5088
G1 X145.888 Y138.889 E.01977
G1 X146.32 Y138.889 E.01434
G1 X146.32 Y139.484 E.01977
G1 X145.948 Y139.484 E.01235
G1 X145.496 Y139.876 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5088
G1 X145.496 Y138.496 E.0424
G1 X146.712 Y138.496 E.03738
G1 X146.712 Y139.876 E.0424
G1 X145.556 Y139.876 E.03553
M204 S10000
; WIPE_START
G1 F24000
G1 X145.496 Y138.496 E-.5249
G1 X146.114 Y138.496 E-.2351
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I-.039 J-1.216 P1  F30000
G1 X115.32 Y139.484 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5088
G1 X115.32 Y141.689 E.07312
G1 X116.168 Y141.689 E.02812
G1 X140.902 Y143.389 E.8224
G1 X141.707 Y143.389 E.0267
G1 X141.707 Y144.184 E.0264
G1 X115.024 Y144.184 E.8851
G1 X115.024 Y138.889 E.17567
G1 X141.957 Y138.889 E.89339
G1 X141.957 Y139.484 E.01977
G1 X115.38 Y139.484 E.88159
G1 X115.712 Y139.876 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5088
G1 X115.712 Y141.296 E.04363
G1 X116.181 Y141.296 E.01441
G1 X140.915 Y142.996 E.7618
G1 X142.099 Y142.996 E.03637
G1 X142.099 Y144.576 E.04855
G1 X114.632 Y144.576 E.84397
G1 X114.632 Y138.496 E.18682
G1 X142.349 Y138.496 E.85165
G1 X142.349 Y139.876 E.0424
G1 X115.772 Y139.876 E.81662
M204 S10000
G1 X115.228 Y139.186 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5088
G1 X141.753 Y139.186 E.40801
; WIPE_START
G1 F24000
G1 X139.753 Y139.186 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I-1.137 J.433 P1  F30000
G1 X141.503 Y143.786 Z3.8
G1 Z3.4
G1 E.8 F1800
; LINE_WIDTH: 0.431684
G1 F5088
G3 X140.881 Y143.786 I-.304 J-18.118 E.0197
; LINE_WIDTH: 0.432142
G1 X140.183 Y143.762 E.02217
; LINE_WIDTH: 0.475922
G1 X139.484 Y143.738 E.02466
; LINE_WIDTH: 0.519701
G1 X138.786 Y143.714 E.02715
; LINE_WIDTH: 0.56348
G1 X138.087 Y143.69 E.02965
; LINE_WIDTH: 0.60726
G1 X137.389 Y143.666 E.03214
G1 X134.828 Y143.32 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5088
G1 X136.453 Y143.432 E.05401
G1 X136.049 Y143.836 E.01896
G1 X132.972 Y143.836 E.10206
G1 X132.281 Y143.145 E.03242
G1 X129.27 Y142.938 E.1001
G1 X128.373 Y143.836 E.04212
G1 X125.296 Y143.836 E.10206
G1 X124.038 Y142.579 E.05899
G1 X122.088 Y142.445 E.06485
G1 X120.697 Y143.836 E.06528
G1 X117.62 Y143.836 E.10206
G1 X115.821 Y142.037 E.08441
G3 X117.446 Y142.126 I.168 J11.868 E.05404
; CHANGE_LAYER
; Z_HEIGHT: 3.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X115.821 Y142.037 E-.61852
G1 X116.084 Y142.3 E-.14148
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 18/30
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
G3 Z3.8 I.493 J1.112 P1  F30000
G1 X145.033 Y129.46 Z3.8
G1 Z3.6
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5102
G1 X146.04 Y129.46 E.03096
G1 X146.04 Y131.04 E.04855
G1 X145.033 Y131.04 E.03096
G1 X145.033 Y129.52 E.04671
M204 S10000
; WIPE_START
G1 F24000
G1 X146.04 Y129.46 E-.3835
G1 X146.04 Y130.451 E-.3765
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I1.194 J-.236 P1  F30000
G1 X145.149 Y125.948 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5102
G1 X145.149 Y125.352 E.01977
G1 X145.648 Y125.352 E.01656
G1 X145.648 Y125.948 E.01977
G1 X145.209 Y125.948 E.01457
G1 X144.783 Y126.34 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5102
G1 X144.757 Y126.34 E.00079
G1 X144.757 Y124.96 E.0424
G1 X144.783 Y124.96 E.00079
G1 X146.04 Y124.96 E.03864
G1 X146.04 Y126.34 E.0424
G1 X144.843 Y126.34 E.03679
M204 S10000
G1 X145.398 Y125.744 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.134926
G1 F5102
G1 X145.398 Y125.556 E.00142
; WIPE_START
G1 F24000
G1 X145.398 Y125.744 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I-.008 J-1.217 P1  F30000
G1 X114.648 Y125.948 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5102
G1 X114.648 Y128.152 E.07312
G1 X115.495 Y128.152 E.02812
G1 X140.229 Y129.852 E.8224
G1 X141.086 Y129.852 E.02841
M73 P77 R2
G1 X141.086 Y130.648 E.0264
G1 X114.352 Y130.648 E.8868
G1 X114.352 Y125.352 E.17567
G1 X141.351 Y125.352 E.89561
G1 X141.351 Y125.948 E.01977
G1 X114.708 Y125.948 E.88381
G1 X115.04 Y126.34 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5102
G1 X115.04 Y127.76 E.04363
G1 X115.509 Y127.76 E.01441
G1 X140.243 Y129.46 E.7618
G1 X141.467 Y129.46 E.03763
G1 X141.467 Y131.04 E.04855
G1 X113.96 Y131.04 E.84523
G1 X113.96 Y124.96 E.18682
G1 X141.717 Y124.96 E.85291
G1 X141.743 Y124.96 E.00079
G1 X141.743 Y126.34 E.0424
G1 X141.717 Y126.34 E.00079
G1 X115.1 Y126.34 E.81788
M204 S10000
G1 X114.556 Y125.65 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5102
G1 X141.148 Y125.65 E.40903
; WIPE_START
G1 F24000
G1 X139.148 Y125.65 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I-1.139 J.429 P1  F30000
G1 X140.882 Y130.25 Z4
G1 Z3.6
G1 E.8 F1800
; LINE_WIDTH: 0.431684
G1 F5102
G3 X140.209 Y130.25 I-.33 J-19.615 E.02133
; LINE_WIDTH: 0.432142
G1 X139.511 Y130.226 E.02217
; LINE_WIDTH: 0.475922
G1 X138.812 Y130.202 E.02466
; LINE_WIDTH: 0.519701
G1 X138.114 Y130.178 E.02715
; LINE_WIDTH: 0.56348
G1 X137.415 Y130.154 E.02965
; LINE_WIDTH: 0.60726
G1 X136.717 Y130.13 E.03214
G1 X134.156 Y129.784 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5102
G1 X135.781 Y129.895 E.05401
G1 X135.376 Y130.3 E.01896
G1 X132.3 Y130.3 E.10206
G1 X131.609 Y129.609 E.03242
G1 X128.598 Y129.402 E.1001
G1 X127.7 Y130.3 E.04212
G1 X124.624 Y130.3 E.10206
G1 X123.366 Y129.042 E.05899
G1 X121.416 Y128.908 E.06485
G1 X120.024 Y130.3 E.06528
G1 X116.948 Y130.3 E.10206
G1 X115.148 Y128.5 E.08441
G3 X116.774 Y128.589 I.168 J11.868 E.05404
; WIPE_START
G1 F24000
G1 X115.148 Y128.5 E-.61852
G1 X115.412 Y128.764 E-.14148
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I-.518 J1.101 P1  F30000
G1 X145.705 Y142.996 Z4
G1 Z3.6
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5102
G1 X146.712 Y142.996 E.03096
G1 X146.712 Y144.576 E.04855
G1 X145.705 Y144.576 E.03096
G1 X145.705 Y143.056 E.04671
M204 S10000
; WIPE_START
G1 F24000
G1 X146.712 Y142.996 E-.3835
G1 X146.712 Y143.987 E-.3765
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I1.194 J-.236 P1  F30000
G1 X145.821 Y139.484 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5102
G1 X145.821 Y138.889 E.01977
G1 X146.32 Y138.889 E.01656
G1 X146.32 Y139.484 E.01977
G1 X145.881 Y139.484 E.01457
G1 X145.455 Y139.876 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5102
G1 X145.429 Y139.876 E.00079
G1 X145.429 Y138.496 E.0424
G1 X145.455 Y138.496 E.00079
G1 X146.712 Y138.496 E.03864
G1 X146.712 Y139.876 E.0424
G1 X145.515 Y139.876 E.03679
M204 S10000
G1 X146.071 Y139.281 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.134926
G1 F5102
G1 X146.071 Y139.092 E.00142
; WIPE_START
G1 F24000
G1 X146.071 Y139.281 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I-.008 J-1.217 P1  F30000
G1 X115.32 Y139.484 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5102
G1 X115.32 Y141.689 E.07312
G1 X116.168 Y141.689 E.02812
G1 X140.902 Y143.389 E.8224
G1 X141.758 Y143.389 E.02841
G1 X141.758 Y144.184 E.0264
G1 X115.024 Y144.184 E.8868
G1 X115.024 Y138.889 E.17567
G1 X142.023 Y138.889 E.89561
G1 X142.023 Y139.484 E.01977
G1 X115.38 Y139.484 E.88381
G1 X115.712 Y139.876 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5102
G1 X115.712 Y141.296 E.04363
G1 X116.181 Y141.296 E.01441
G1 X140.915 Y142.996 E.7618
G1 X142.14 Y142.996 E.03763
G1 X142.14 Y144.576 E.04855
G1 X114.632 Y144.576 E.84523
G1 X114.632 Y138.496 E.18682
G1 X142.39 Y138.496 E.85291
G1 X142.415 Y138.496 E.00079
G1 X142.415 Y139.876 E.0424
G1 X142.39 Y139.876 E.00079
G1 X115.772 Y139.876 E.81788
M204 S10000
G1 X115.228 Y139.186 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5102
G1 X141.82 Y139.186 E.40903
; WIPE_START
G1 F24000
G1 X139.82 Y139.186 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I-1.139 J.429 P1  F30000
G1 X141.554 Y143.786 Z4
G1 Z3.6
G1 E.8 F1800
; LINE_WIDTH: 0.431684
G1 F5102
G3 X140.881 Y143.786 I-.33 J-19.615 E.02133
; LINE_WIDTH: 0.432142
G1 X140.183 Y143.762 E.02217
; LINE_WIDTH: 0.475922
G1 X139.484 Y143.738 E.02466
; LINE_WIDTH: 0.519701
G1 X138.786 Y143.714 E.02715
; LINE_WIDTH: 0.56348
G1 X138.087 Y143.69 E.02965
; LINE_WIDTH: 0.60726
G1 X137.389 Y143.666 E.03214
G1 X134.828 Y143.32 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5102
G1 X136.453 Y143.432 E.05401
G1 X136.049 Y143.836 E.01896
G1 X132.972 Y143.836 E.10206
G1 X132.281 Y143.145 E.03242
G1 X129.27 Y142.938 E.1001
G1 X128.373 Y143.836 E.04212
G1 X125.296 Y143.836 E.10206
G1 X124.038 Y142.579 E.05899
G1 X122.088 Y142.445 E.06485
G1 X120.697 Y143.836 E.06528
G1 X117.62 Y143.836 E.10206
G1 X115.821 Y142.037 E.08441
G3 X117.446 Y142.126 I.168 J11.868 E.05404
; CHANGE_LAYER
; Z_HEIGHT: 3.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X115.821 Y142.037 E-.61852
M73 P78 R2
G1 X116.084 Y142.3 E-.14148
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 19/30
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
G3 Z4 I.476 J1.12 P1  F30000
G1 X145.338 Y129.852 Z4
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5162
G1 X145.648 Y129.852 E.01027
G1 X145.648 Y130.648 E.0264
G1 X145.338 Y130.648 E.01027
G1 X145.338 Y129.912 E.02441
G1 X144.981 Y129.46 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5162
G1 X146.04 Y129.46 E.03253
G1 X146.04 Y131.04 E.04855
G1 X144.981 Y131.04 E.03253
G1 X144.946 Y131.04 E.00107
G1 X144.946 Y129.485 E.04778
M204 S10000
; WIPE_START
G1 F24000
G1 X146.04 Y129.46 E-.4157
G1 X146.04 Y130.366 E-.3443
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I1.188 J-.264 P1  F30000
G1 X145.058 Y125.948 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5162
G1 X145.058 Y125.352 E.01977
G1 X145.648 Y125.352 E.01958
G1 X145.648 Y125.948 E.01977
G1 X145.118 Y125.948 E.01759
G1 X144.716 Y126.34 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5162
G1 X144.666 Y126.34 E.00154
G1 X144.666 Y124.96 E.0424
G1 X144.716 Y124.96 E.00154
G1 X146.04 Y124.96 E.04069
G1 X146.04 Y126.34 E.0424
G1 X144.776 Y126.34 E.03885
M204 S10000
; WIPE_START
G1 F24000
G1 X144.666 Y126.34 E-.04188
G1 X144.666 Y124.96 E-.5244
G1 X144.716 Y124.96 E-.01908
G1 X145.175 Y124.96 E-.17464
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I-.039 J-1.216 P1  F30000
G1 X114.648 Y125.948 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5162
G1 X114.648 Y128.152 E.07312
G1 X115.495 Y128.152 E.02812
G1 X140.229 Y129.852 E.8224
G1 X141.162 Y129.852 E.03092
G1 X141.162 Y130.648 E.0264
G1 X114.352 Y130.648 E.88932
G1 X114.352 Y125.352 E.17567
G1 X141.442 Y125.352 E.89863
G1 X141.442 Y125.948 E.01977
G1 X114.708 Y125.948 E.88683
G1 X115.04 Y126.34 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5162
G1 X115.04 Y127.76 E.04363
G1 X115.509 Y127.76 E.01441
G1 X140.243 Y129.46 E.7618
G1 X141.519 Y129.46 E.03921
G1 X141.554 Y129.46 E.00107
G1 X141.554 Y131.04 E.04855
G1 X141.519 Y131.04 E.00107
G1 X113.96 Y131.04 E.84681
G1 X113.96 Y124.96 E.18682
G1 X141.784 Y124.96 E.85496
G1 X141.834 Y124.96 E.00154
G1 X141.834 Y126.34 E.0424
G1 X141.784 Y126.34 E.00154
G1 X115.1 Y126.34 E.81993
M204 S10000
G1 X114.556 Y125.65 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5162
G1 X141.239 Y125.65 E.41044
; WIPE_START
G1 F24000
G1 X139.239 Y125.65 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I-1.14 J.426 P1  F30000
G1 X140.958 Y130.25 Z4.2
G1 Z3.8
G1 E.8 F1800
; LINE_WIDTH: 0.431684
G1 F5162
G3 X140.209 Y130.25 I-.368 J-21.825 E.02373
; LINE_WIDTH: 0.432142
G1 X139.511 Y130.226 E.02217
; LINE_WIDTH: 0.475922
G1 X138.812 Y130.202 E.02466
; LINE_WIDTH: 0.519701
G1 X138.114 Y130.178 E.02715
; LINE_WIDTH: 0.56348
G1 X137.415 Y130.154 E.02965
; LINE_WIDTH: 0.60726
G1 X136.717 Y130.13 E.03214
G1 X134.156 Y129.784 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5162
G1 X135.781 Y129.895 E.05401
G1 X135.376 Y130.3 E.01896
G1 X132.3 Y130.3 E.10206
G1 X131.609 Y129.609 E.03242
G1 X128.598 Y129.402 E.1001
G1 X127.7 Y130.3 E.04212
G1 X124.624 Y130.3 E.10206
G1 X123.366 Y129.042 E.05899
G1 X121.416 Y128.908 E.06485
G1 X120.024 Y130.3 E.06528
G1 X116.948 Y130.3 E.10206
G1 X115.148 Y128.5 E.08441
G3 X116.774 Y128.589 I.168 J11.868 E.05404
; WIPE_START
G1 F24000
G1 X115.148 Y128.5 E-.61852
G1 X115.412 Y128.764 E-.14148
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I-.525 J1.098 P1  F30000
G1 X146.011 Y143.389 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5162
G1 X146.32 Y143.389 E.01027
G1 X146.32 Y144.184 E.0264
G1 X146.011 Y144.184 E.01027
G1 X146.011 Y143.449 E.02441
G1 X145.653 Y142.996 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5162
G1 X146.712 Y142.996 E.03253
M73 P79 R2
G1 X146.712 Y144.576 E.04855
G1 X145.653 Y144.576 E.03253
G1 X145.619 Y144.576 E.00107
G1 X145.619 Y143.022 E.04778
M204 S10000
; WIPE_START
G1 F24000
G1 X146.712 Y142.996 E-.4157
G1 X146.712 Y143.903 E-.3443
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I1.188 J-.264 P1  F30000
G1 X145.73 Y139.484 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5162
G1 X145.73 Y138.889 E.01977
G1 X146.32 Y138.889 E.01958
G1 X146.32 Y139.484 E.01977
G1 X145.79 Y139.484 E.01759
G1 X145.388 Y139.876 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5162
G1 X145.338 Y139.876 E.00154
G1 X145.338 Y138.496 E.0424
G1 X145.388 Y138.496 E.00154
G1 X146.712 Y138.496 E.04069
G1 X146.712 Y139.876 E.0424
G1 X145.448 Y139.876 E.03885
M204 S10000
; WIPE_START
G1 F24000
G1 X145.338 Y139.876 E-.04188
G1 X145.338 Y138.496 E-.5244
G1 X145.388 Y138.496 E-.01908
G1 X145.848 Y138.496 E-.17464
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I-.039 J-1.216 P1  F30000
G1 X115.32 Y139.484 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5162
G1 X115.32 Y141.689 E.07312
G1 X116.168 Y141.689 E.02812
G1 X140.902 Y143.389 E.8224
G1 X141.834 Y143.389 E.03092
G1 X141.834 Y144.184 E.0264
G1 X115.024 Y144.184 E.88932
G1 X115.024 Y138.889 E.17567
G1 X142.115 Y138.889 E.89863
G1 X142.115 Y139.484 E.01977
G1 X115.38 Y139.484 E.88683
G1 X115.712 Y139.876 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5162
G1 X115.712 Y141.296 E.04363
G1 X116.181 Y141.296 E.01441
G1 X140.915 Y142.996 E.7618
G1 X142.191 Y142.996 E.03921
G1 X142.226 Y142.996 E.00107
G1 X142.226 Y144.576 E.04855
G1 X142.191 Y144.576 E.00107
G1 X114.632 Y144.576 E.84681
G1 X114.632 Y138.496 E.18682
G1 X142.456 Y138.496 E.85496
G1 X142.507 Y138.496 E.00154
G1 X142.507 Y139.876 E.0424
G1 X142.456 Y139.876 E.00154
G1 X115.772 Y139.876 E.81993
M204 S10000
G1 X115.228 Y139.186 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5162
G1 X141.911 Y139.186 E.41044
; WIPE_START
G1 F24000
G1 X139.911 Y139.186 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I-1.14 J.426 P1  F30000
G1 X141.63 Y143.786 Z4.2
G1 Z3.8
G1 E.8 F1800
; LINE_WIDTH: 0.431684
G1 F5162
G3 X140.881 Y143.786 I-.368 J-21.825 E.02373
; LINE_WIDTH: 0.432142
G1 X140.183 Y143.762 E.02217
; LINE_WIDTH: 0.475922
G1 X139.484 Y143.738 E.02466
; LINE_WIDTH: 0.519701
G1 X138.786 Y143.714 E.02715
; LINE_WIDTH: 0.56348
G1 X138.087 Y143.69 E.02965
; LINE_WIDTH: 0.60726
G1 X137.389 Y143.666 E.03214
G1 X134.828 Y143.32 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5162
G1 X136.453 Y143.432 E.05401
G1 X136.049 Y143.836 E.01896
G1 X132.972 Y143.836 E.10206
G1 X132.281 Y143.145 E.03242
G1 X129.27 Y142.938 E.1001
G1 X128.373 Y143.836 E.04212
G1 X125.296 Y143.836 E.10206
G1 X124.038 Y142.579 E.05899
G1 X122.088 Y142.445 E.06485
G1 X120.697 Y143.836 E.06528
G1 X117.62 Y143.836 E.10206
G1 X115.821 Y142.037 E.08441
G3 X117.446 Y142.126 I.168 J11.868 E.05404
; CHANGE_LAYER
; Z_HEIGHT: 4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X115.821 Y142.037 E-.61852
G1 X116.084 Y142.3 E-.14148
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 20/30
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
G3 Z4.2 I.478 J1.119 P1  F30000
G1 X145.221 Y129.852 Z4.2
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5245
G1 X145.648 Y129.852 E.01416
G1 X145.648 Y130.648 E.0264
G1 X145.221 Y130.648 E.01416
G1 X145.221 Y129.912 E.02441
G1 X144.905 Y129.46 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5245
G1 X146.04 Y129.46 E.03487
G1 X146.04 Y131.04 E.04855
G1 X144.905 Y131.04 E.03487
G1 X144.829 Y131.04 E.00234
G1 X144.829 Y129.46 E.04855
G1 X144.845 Y129.46 E.0005
M204 S10000
; WIPE_START
G1 F24000
G1 X146.04 Y129.46 E-.45397
G1 X146.04 Y130.265 E-.30603
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I1.178 J-.306 P1  F30000
G1 X144.92 Y125.948 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5245
G1 X144.92 Y125.352 E.01977
G1 X145.648 Y125.352 E.02416
G1 X145.648 Y125.948 E.01977
G1 X144.98 Y125.948 E.02217
G1 X144.543 Y126.34 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
G1 X144.527 Y126.34 E.00046
G1 X144.527 Y124.96 E.0424
G1 X144.543 Y124.96 E.00046
G1 F5245
G1 X144.625 Y124.96 E.00252
G1 X146.04 Y124.96 E.04349
G1 X146.04 Y126.34 E.0424
G1 X144.603 Y126.34 E.04417
M204 S10000
; WIPE_START
G1 F24000
G1 X144.527 Y126.34 E-.02852
G1 X144.527 Y124.96 E-.5244
G1 X144.543 Y124.96 E-.00572
G1 X144.625 Y124.96 E-.03116
G1 X145.072 Y124.96 E-.1702
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I-.039 J-1.216 P1  F30000
G1 X114.648 Y125.948 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5245
G1 X114.648 Y128.152 E.07312
G1 X115.495 Y128.152 E.02812
G1 X140.229 Y129.852 E.8224
M73 P80 R2
G1 X141.279 Y129.852 E.03481
G1 X141.279 Y130.648 E.0264
G1 X114.352 Y130.648 E.89321
G1 X114.352 Y125.352 E.17567
G1 X141.58 Y125.352 E.90321
G1 X141.58 Y125.948 E.01977
G1 X114.708 Y125.948 E.89141
G1 X115.04 Y126.34 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5245
G1 X115.04 Y127.76 E.04363
G1 X115.509 Y127.76 E.01441
G1 X140.243 Y129.46 E.7618
G1 X141.595 Y129.46 E.04154
G1 X141.671 Y129.46 E.00234
G1 X141.671 Y131.04 E.04855
G1 X141.595 Y131.04 E.00234
G1 X113.96 Y131.04 E.84914
G1 X113.96 Y124.96 E.18682
G1 X141.957 Y124.96 E.86028
G1 F3000
G1 X141.973 Y124.96 E.00046
G1 X141.973 Y126.34 E.0424
G1 X141.957 Y126.34 E.00046
G1 F5245
G1 X115.1 Y126.34 E.82525
M204 S10000
G1 X114.556 Y125.65 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5245
G1 X141.377 Y125.65 E.41256
; WIPE_START
G1 F24000
G1 X139.377 Y125.65 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I-1.142 J.422 P1  F30000
G1 X141.075 Y130.25 Z4.4
G1 Z4
G1 E.8 F1800
; LINE_WIDTH: 0.431684
G1 F5245
G3 X140.209 Y130.25 I-.426 J-25.243 E.02745
; LINE_WIDTH: 0.432142
G1 X139.511 Y130.226 E.02217
; LINE_WIDTH: 0.475922
G1 X138.812 Y130.202 E.02466
; LINE_WIDTH: 0.519701
G1 X138.114 Y130.178 E.02715
; LINE_WIDTH: 0.56348
G1 X137.415 Y130.154 E.02965
; LINE_WIDTH: 0.60726
G1 X136.717 Y130.13 E.03214
G1 X134.156 Y129.784 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5245
G1 X135.781 Y129.895 E.05401
G1 X135.376 Y130.3 E.01896
G1 X132.3 Y130.3 E.10206
G1 X131.609 Y129.609 E.03242
G1 X128.598 Y129.402 E.1001
G1 X127.7 Y130.3 E.04212
G1 X124.624 Y130.3 E.10206
G1 X123.366 Y129.042 E.05899
G1 X121.416 Y128.908 E.06485
G1 X120.024 Y130.3 E.06528
G1 X116.948 Y130.3 E.10206
G1 X115.148 Y128.5 E.08441
G3 X116.774 Y128.589 I.168 J11.868 E.05404
; WIPE_START
G1 F24000
G1 X115.148 Y128.5 E-.61852
G1 X115.412 Y128.764 E-.14148
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I-.526 J1.097 P1  F30000
G1 X145.893 Y143.389 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5245
G1 X146.32 Y143.389 E.01416
G1 X146.32 Y144.184 E.0264
G1 X145.893 Y144.184 E.01416
G1 X145.893 Y143.449 E.02441
G1 X145.578 Y142.996 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5245
G1 X146.712 Y142.996 E.03487
G1 X146.712 Y144.576 E.04855
G1 X145.578 Y144.576 E.03487
G1 X145.501 Y144.576 E.00234
G1 X145.501 Y142.996 E.04855
G1 X145.518 Y142.996 E.0005
M204 S10000
; WIPE_START
G1 F24000
G1 X146.712 Y142.996 E-.45397
G1 X146.712 Y143.802 E-.30603
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I1.178 J-.306 P1  F30000
G1 X145.592 Y139.484 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5245
G1 X145.592 Y138.889 E.01977
G1 X146.32 Y138.889 E.02416
G1 X146.32 Y139.484 E.01977
G1 X145.652 Y139.484 E.02217
G1 X145.215 Y139.876 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
G1 X145.2 Y139.876 E.00046
G1 X145.2 Y138.496 E.0424
G1 X145.215 Y138.496 E.00046
G1 F5245
G1 X145.297 Y138.496 E.00252
G1 X146.712 Y138.496 E.04349
G1 X146.712 Y139.876 E.0424
G1 X145.275 Y139.876 E.04417
M204 S10000
; WIPE_START
G1 F24000
G1 X145.2 Y139.876 E-.02852
G1 X145.2 Y138.496 E-.5244
G1 X145.215 Y138.496 E-.00572
G1 X145.297 Y138.496 E-.03116
G1 X145.745 Y138.496 E-.1702
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I-.039 J-1.216 P1  F30000
G1 X115.32 Y139.484 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5245
G1 X115.32 Y141.689 E.07312
G1 X116.168 Y141.689 E.02812
G1 X140.902 Y143.389 E.8224
G1 X141.951 Y143.389 E.03481
G1 X141.951 Y144.184 E.0264
G1 X115.024 Y144.184 E.89321
G1 X115.024 Y138.889 E.17567
G1 X142.253 Y138.889 E.90321
G1 X142.253 Y139.484 E.01977
G1 X115.38 Y139.484 E.89141
G1 X115.712 Y139.876 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5245
G1 X115.712 Y141.296 E.04363
G1 X116.181 Y141.296 E.01441
G1 X140.915 Y142.996 E.7618
G1 X142.267 Y142.996 E.04154
G1 X142.343 Y142.996 E.00234
G1 X142.343 Y144.576 E.04855
G1 X142.267 Y144.576 E.00234
G1 X114.632 Y144.576 E.84914
G1 X114.632 Y138.496 E.18682
G1 X142.63 Y138.496 E.86028
G1 F3000
G1 X142.645 Y138.496 E.00046
G1 X142.645 Y139.876 E.0424
G1 X142.63 Y139.876 E.00046
G1 F5245
G1 X115.772 Y139.876 E.82525
M204 S10000
G1 X115.228 Y139.186 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5245
G1 X142.049 Y139.186 E.41256
; WIPE_START
G1 F24000
G1 X140.049 Y139.186 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I-1.142 J.422 P1  F30000
G1 X141.748 Y143.786 Z4.4
G1 Z4
G1 E.8 F1800
; LINE_WIDTH: 0.431684
G1 F5245
G3 X140.881 Y143.786 I-.426 J-25.243 E.02745
; LINE_WIDTH: 0.432142
G1 X140.183 Y143.762 E.02217
; LINE_WIDTH: 0.475922
G1 X139.484 Y143.738 E.02466
; LINE_WIDTH: 0.519701
G1 X138.786 Y143.714 E.02715
; LINE_WIDTH: 0.56348
G1 X138.087 Y143.69 E.02965
; LINE_WIDTH: 0.60726
G1 X137.389 Y143.666 E.03214
G1 X134.828 Y143.32 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5245
G1 X136.453 Y143.432 E.05401
G1 X136.049 Y143.836 E.01896
G1 X132.972 Y143.836 E.10206
G1 X132.281 Y143.145 E.03242
G1 X129.27 Y142.938 E.1001
G1 X128.373 Y143.836 E.04212
G1 X125.296 Y143.836 E.10206
G1 X124.038 Y142.579 E.05899
G1 X122.088 Y142.445 E.06485
G1 X120.697 Y143.836 E.06528
G1 X117.62 Y143.836 E.10206
G1 X115.821 Y142.037 E.08441
G3 X117.446 Y142.126 I.168 J11.868 E.05404
; CHANGE_LAYER
; Z_HEIGHT: 4.2
; LAYER_HEIGHT: 0.2
; WIPE_START
M73 P81 R2
G1 F24000
G1 X115.821 Y142.037 E-.61852
G1 X116.084 Y142.3 E-.14148
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 21/30
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
G3 Z4.4 I.48 J1.118 P1  F30000
G1 X145.081 Y129.852 Z4.4
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5428
G1 X145.648 Y129.852 E.01882
G1 X145.648 Y130.648 E.0264
G1 X145.081 Y130.648 E.01882
G1 X145.081 Y129.912 E.02441
G1 X144.788 Y129.46 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5428
G1 X146.04 Y129.46 E.03847
G1 X146.04 Y131.04 E.04855
G1 X144.706 Y131.04 E.04099
G1 F3000
G1 X144.688 Y131.04 E.00054
G1 X144.688 Y129.46 E.04855
G1 X144.706 Y129.46 E.00054
G1 F5428
G1 X144.728 Y129.46 E.00068
M204 S10000
G1 X145.364 Y130.056 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.203242
G1 F5428
G1 X145.364 Y130.444 E.00508
; WIPE_START
G1 F24000
G1 X145.364 Y130.056 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I1.205 J-.169 P1  F30000
G1 X144.706 Y125.352 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5428
G1 X145.648 Y125.352 E.03124
G1 X145.648 Y125.948 E.01977
G1 X144.706 Y125.948 E.03124
G1 X144.706 Y125.412 E.01777
G1 X144.486 Y124.96 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5428
G1 X146.04 Y124.96 E.04773
G1 X146.04 Y126.34 E.0424
G1 X144.322 Y126.34 E.05277
M106 S255
G1 F1800
G1 X144.322 Y124.96 E.0424
M106 S252.45
G1 F5428
G1 X144.426 Y124.96 E.0032
M204 S10000
G1 X144.91 Y125.65 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5428
G1 X145.444 Y125.65 E.00822
; WIPE_START
G1 F24000
G1 X144.91 Y125.65 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I-.012 J-1.217 P1  F30000
G1 X114.648 Y125.948 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5428
G1 X114.648 Y128.152 E.07312
G1 X115.495 Y128.152 E.02812
G1 X140.229 Y129.852 E.8224
G1 X141.419 Y129.852 E.03948
G1 X141.419 Y130.648 E.0264
G1 X114.352 Y130.648 E.89788
G1 X114.352 Y125.352 E.17567
G1 X141.794 Y125.352 E.91029
G1 X141.794 Y125.948 E.01977
G1 X114.708 Y125.948 E.89849
G1 X115.04 Y126.34 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5428
G1 X115.04 Y127.76 E.04363
G1 X115.509 Y127.76 E.01441
G1 X140.243 Y129.46 E.7618
G1 X141.794 Y129.46 E.04766
G1 F3000
G1 X141.812 Y129.46 E.00054
G1 X141.812 Y131.04 E.04855
G1 X141.794 Y131.04 E.00054
G1 F5428
G1 X141.712 Y131.04 E.00252
G1 X113.96 Y131.04 E.85274
G1 X113.96 Y124.96 E.18682
G1 X142.178 Y124.96 E.86705
M106 S255
G1 F1800
G1 X142.178 Y126.34 E.0424
M106 S252.45
G1 F5428
G1 X115.1 Y126.34 E.83202
M204 S10000
G1 X114.556 Y125.65 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5428
G1 X141.59 Y125.65 E.41584
; WIPE_START
G1 F24000
G1 X139.59 Y125.65 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I-1.147 J.406 P1  F30000
G1 X141.216 Y130.25 Z4.6
G1 Z4.2
G1 E.8 F1800
; LINE_WIDTH: 0.431684
G1 F5428
G3 X140.209 Y130.25 I-.497 J-29.34 E.0319
; LINE_WIDTH: 0.432142
G1 X139.511 Y130.226 E.02217
; LINE_WIDTH: 0.475922
G1 X138.812 Y130.202 E.02466
; LINE_WIDTH: 0.519701
G1 X138.114 Y130.178 E.02715
; LINE_WIDTH: 0.56348
G1 X137.415 Y130.154 E.02965
; LINE_WIDTH: 0.60726
G1 X136.717 Y130.13 E.03214
G1 X134.156 Y129.784 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5428
G1 X135.781 Y129.895 E.05401
G1 X135.376 Y130.3 E.01896
G1 X132.3 Y130.3 E.10206
G1 X131.609 Y129.609 E.03242
G1 X128.598 Y129.402 E.1001
G1 X127.7 Y130.3 E.04212
G1 X124.624 Y130.3 E.10206
G1 X123.366 Y129.042 E.05899
G1 X121.416 Y128.908 E.06485
G1 X120.024 Y130.3 E.06528
G1 X116.948 Y130.3 E.10206
G1 X115.148 Y128.5 E.08441
G3 X116.774 Y128.589 I.168 J11.868 E.05404
; WIPE_START
G1 F24000
G1 X115.148 Y128.5 E-.61852
G1 X115.412 Y128.764 E-.14148
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I-.528 J1.096 P1  F30000
G1 X145.753 Y143.389 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5428
G1 X146.32 Y143.389 E.01882
G1 X146.32 Y144.184 E.0264
G1 X145.753 Y144.184 E.01882
G1 X145.753 Y143.449 E.02441
G1 X145.46 Y142.996 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5428
G1 X146.712 Y142.996 E.03847
G1 X146.712 Y144.576 E.04855
G1 X145.378 Y144.576 E.04099
G1 F3000
G1 X145.361 Y144.576 E.00054
M73 P82 R2
G1 X145.361 Y142.996 E.04855
G1 X145.378 Y142.996 E.00054
G1 F5428
G1 X145.4 Y142.996 E.00068
M204 S10000
G1 X146.036 Y143.592 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.203242
G1 F5428
G1 X146.036 Y143.981 E.00508
; WIPE_START
G1 F24000
G1 X146.036 Y143.592 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I1.205 J-.169 P1  F30000
G1 X145.378 Y138.889 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5428
G1 X146.32 Y138.889 E.03124
G1 X146.32 Y139.484 E.01977
G1 X145.378 Y139.484 E.03124
G1 X145.378 Y138.949 E.01777
G1 X145.159 Y138.496 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5428
G1 X146.712 Y138.496 E.04773
G1 X146.712 Y139.876 E.0424
G1 X144.995 Y139.876 E.05277
M106 S255
G1 F1800
G1 X144.995 Y138.496 E.0424
M106 S252.45
G1 F5428
G1 X145.099 Y138.496 E.0032
M204 S10000
G1 X145.582 Y139.186 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5428
G1 X146.117 Y139.186 E.00822
; WIPE_START
G1 F24000
G1 X145.582 Y139.186 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I-.012 J-1.217 P1  F30000
G1 X115.32 Y139.484 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5428
G1 X115.32 Y141.689 E.07312
G1 X116.168 Y141.689 E.02812
G1 X140.902 Y143.389 E.8224
G1 X142.092 Y143.389 E.03948
G1 X142.092 Y144.184 E.0264
G1 X115.024 Y144.184 E.89788
G1 X115.024 Y138.889 E.17567
G1 X142.466 Y138.889 E.91029
G1 X142.466 Y139.484 E.01977
G1 X115.38 Y139.484 E.89849
G1 X115.712 Y139.876 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5428
G1 X115.712 Y141.296 E.04363
G1 X116.181 Y141.296 E.01441
G1 X140.915 Y142.996 E.7618
G1 X142.466 Y142.996 E.04766
G1 F3000
G1 X142.484 Y142.996 E.00054
G1 X142.484 Y144.576 E.04855
G1 X142.466 Y144.576 E.00054
G1 F5428
G1 X142.384 Y144.576 E.00252
G1 X114.632 Y144.576 E.85274
G1 X114.632 Y138.496 E.18682
G1 X142.85 Y138.496 E.86705
M106 S255
G1 F1800
G1 X142.85 Y139.876 E.0424
M106 S252.45
G1 F5428
G1 X115.772 Y139.876 E.83202
M204 S10000
G1 X115.228 Y139.186 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5428
G1 X142.262 Y139.186 E.41584
; WIPE_START
G1 F24000
G1 X140.262 Y139.186 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I-1.147 J.406 P1  F30000
G1 X141.888 Y143.786 Z4.6
G1 Z4.2
G1 E.8 F1800
; LINE_WIDTH: 0.431684
G1 F5428
G3 X140.881 Y143.786 I-.497 J-29.34 E.0319
; LINE_WIDTH: 0.432142
G1 X140.183 Y143.762 E.02217
; LINE_WIDTH: 0.475922
G1 X139.484 Y143.738 E.02466
; LINE_WIDTH: 0.519701
G1 X138.786 Y143.714 E.02715
; LINE_WIDTH: 0.56348
G1 X138.087 Y143.69 E.02965
; LINE_WIDTH: 0.60726
G1 X137.389 Y143.666 E.03214
G1 X134.828 Y143.32 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5428
G1 X136.453 Y143.432 E.05401
G1 X136.049 Y143.836 E.01896
G1 X132.972 Y143.836 E.10206
G1 X132.281 Y143.145 E.03242
G1 X129.27 Y142.938 E.1001
G1 X128.373 Y143.836 E.04212
G1 X125.296 Y143.836 E.10206
G1 X124.038 Y142.579 E.05899
G1 X122.088 Y142.445 E.06485
G1 X120.697 Y143.836 E.06528
G1 X117.62 Y143.836 E.10206
G1 X115.821 Y142.037 E.08441
G3 X117.446 Y142.126 I.168 J11.868 E.05404
; CHANGE_LAYER
; Z_HEIGHT: 4.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X115.821 Y142.037 E-.61852
G1 X116.084 Y142.3 E-.14148
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 22/30
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
G3 Z4.6 I.483 J1.117 P1  F30000
G1 X144.855 Y129.852 Z4.6
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5906
G1 X145.648 Y129.852 E.02631
G1 X145.648 Y130.648 E.0264
G1 X144.855 Y130.648 E.02631
G1 X144.855 Y129.912 E.02441
G1 X144.647 Y129.46 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M73 P82 R1
G1 F5906
G1 X146.04 Y129.46 E.04279
G1 X146.04 Y131.04 E.04855
G1 X144.483 Y131.04 E.04783
M106 S255
G1 F1800
G1 X144.463 Y131.04 E.00064
G1 X144.463 Y129.46 E.04855
G1 X144.483 Y129.46 E.00064
M106 S252.45
G1 F5906
G1 X144.587 Y129.46 E.0032
M204 S10000
; WIPE_START
G1 F24000
G1 X146.04 Y129.46 E-.55197
G1 X146.04 Y130.007 E-.20803
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I1.125 J-.464 P1  F30000
G1 X144.366 Y125.948 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5906
G1 X144.366 Y125.352 E.01977
G1 X145.648 Y125.352 E.04253
G1 X145.648 Y125.948 E.01977
G1 X144.426 Y125.948 E.04054
G1 X144.273 Y126.34 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5906
G1 X144.027 Y126.34 E.00756
M106 S255
G1 F600
G1 X143.974 Y126.34 E.00165
G1 X143.974 Y124.96 E.0424
G1 X144.027 Y124.96 E.00165
M106 S252.45
G1 F5906
G1 X144.273 Y124.96 E.00756
G1 X146.04 Y124.96 E.05429
G1 X146.04 Y126.34 E.0424
G1 X144.333 Y126.34 E.05245
M204 S10000
G1 X144.569 Y125.65 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5906
G1 X145.444 Y125.65 E.01346
; WIPE_START
G1 F24000
G1 X144.569 Y125.65 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I-.012 J-1.217 P1  F30000
G1 X114.648 Y125.948 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5906
G1 X114.648 Y128.152 E.07312
G1 X115.495 Y128.152 E.02812
G1 X140.229 Y129.852 E.8224
G1 X141.645 Y129.852 E.04697
G1 X141.645 Y130.648 E.0264
G1 X114.352 Y130.648 E.90536
G1 X114.352 Y125.352 E.17567
G1 X142.134 Y125.352 E.92159
G1 X142.134 Y125.948 E.01977
G1 X114.708 Y125.948 E.90978
G1 X115.04 Y126.34 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5906
G1 X115.04 Y127.76 E.04363
G1 X115.509 Y127.76 E.01441
G1 X140.243 Y129.46 E.7618
G1 X142.017 Y129.46 E.0545
M106 S255
G1 F1800
G1 X142.037 Y129.46 E.00064
G1 X142.037 Y131.04 E.04855
G1 X142.017 Y131.04 E.00064
M106 S252.45
G1 F5906
M73 P83 R1
G1 X141.853 Y131.04 E.00504
G1 X113.96 Y131.04 E.85706
G1 X113.96 Y124.96 E.18682
G1 X142.227 Y124.96 E.86856
G1 X142.473 Y124.96 E.00756
M106 S255
G1 F600
G1 X142.526 Y124.96 E.00165
G1 X142.526 Y126.34 E.0424
G1 X142.473 Y126.34 E.00165
M106 S252.45
G1 F5906
G1 X142.227 Y126.34 E.00756
G1 X115.1 Y126.34 E.83353
M204 S10000
G1 X114.556 Y125.65 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5906
G1 X141.931 Y125.65 E.42108
; WIPE_START
G1 F24000
G1 X139.931 Y125.65 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I-1.156 J.38 P1  F30000
G1 X141.442 Y130.25 Z4.8
G1 Z4.4
G1 E.8 F1800
; LINE_WIDTH: 0.431684
G1 F5906
G3 X140.209 Y130.25 I-.61 J-35.918 E.03905
; LINE_WIDTH: 0.432142
G1 X139.511 Y130.226 E.02217
; LINE_WIDTH: 0.475922
G1 X138.812 Y130.202 E.02466
; LINE_WIDTH: 0.519701
G1 X138.114 Y130.178 E.02715
; LINE_WIDTH: 0.56348
G1 X137.415 Y130.154 E.02965
; LINE_WIDTH: 0.60726
G1 X136.717 Y130.13 E.03214
G1 X134.156 Y129.784 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5906
G1 X135.781 Y129.895 E.05401
G1 X135.376 Y130.3 E.01896
G1 X132.3 Y130.3 E.10206
G1 X131.609 Y129.609 E.03242
G1 X128.598 Y129.402 E.1001
G1 X127.7 Y130.3 E.04212
G1 X124.624 Y130.3 E.10206
G1 X123.366 Y129.042 E.05899
G1 X121.416 Y128.908 E.06485
G1 X120.024 Y130.3 E.06528
G1 X116.948 Y130.3 E.10206
G1 X115.148 Y128.5 E.08441
G3 X116.774 Y128.589 I.168 J11.868 E.05404
; WIPE_START
G1 F24000
G1 X115.148 Y128.5 E-.61852
G1 X115.412 Y128.764 E-.14148
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I-.532 J1.095 P1  F30000
G1 X145.527 Y143.389 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5906
G1 X146.32 Y143.389 E.02631
G1 X146.32 Y144.184 E.0264
G1 X145.527 Y144.184 E.02631
G1 X145.527 Y143.449 E.02441
G1 X145.32 Y142.996 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5906
G1 X146.712 Y142.996 E.04279
G1 X146.712 Y144.576 E.04855
G1 X145.156 Y144.576 E.04783
M106 S255
G1 F1800
G1 X145.135 Y144.576 E.00064
G1 X145.135 Y142.996 E.04855
G1 X145.156 Y142.996 E.00064
M106 S252.45
G1 F5906
G1 X145.26 Y142.996 E.0032
M204 S10000
; WIPE_START
G1 F24000
G1 X146.712 Y142.996 E-.55197
G1 X146.712 Y143.544 E-.20803
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I1.125 J-.464 P1  F30000
G1 X145.038 Y139.484 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5906
G1 X145.038 Y138.889 E.01977
G1 X146.32 Y138.889 E.04253
G1 X146.32 Y139.484 E.01977
G1 X145.098 Y139.484 E.04054
G1 X144.945 Y139.876 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5906
G1 X144.699 Y139.876 E.00756
M106 S255
G1 F600
G1 X144.646 Y139.876 E.00165
G1 X144.646 Y138.496 E.0424
G1 X144.699 Y138.496 E.00165
M106 S252.45
G1 F5906
G1 X144.945 Y138.496 E.00756
G1 X146.712 Y138.496 E.05429
G1 X146.712 Y139.876 E.0424
G1 X145.005 Y139.876 E.05245
M204 S10000
G1 X145.241 Y139.186 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5906
G1 X146.117 Y139.186 E.01346
; WIPE_START
G1 F24000
G1 X145.241 Y139.186 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I-.012 J-1.217 P1  F30000
G1 X115.32 Y139.484 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5906
G1 X115.32 Y141.689 E.07312
G1 X116.168 Y141.689 E.02812
G1 X140.902 Y143.389 E.8224
G1 X142.317 Y143.389 E.04697
G1 X142.317 Y144.184 E.0264
G1 X115.024 Y144.184 E.90536
G1 X115.024 Y138.889 E.17567
G1 X142.807 Y138.889 E.92159
G1 X142.807 Y139.484 E.01977
G1 X115.38 Y139.484 E.90978
G1 X115.712 Y139.876 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5906
G1 X115.712 Y141.296 E.04363
G1 X116.181 Y141.296 E.01441
G1 X140.915 Y142.996 E.7618
G1 X142.689 Y142.996 E.0545
M106 S255
G1 F1800
G1 X142.71 Y142.996 E.00064
G1 X142.71 Y144.576 E.04855
G1 X142.689 Y144.576 E.00064
M106 S252.45
G1 F5906
G1 X142.525 Y144.576 E.00504
G1 X114.632 Y144.576 E.85706
G1 X114.632 Y138.496 E.18682
G1 X142.899 Y138.496 E.86856
G1 X143.145 Y138.496 E.00756
M106 S255
G1 F600
G1 X143.199 Y138.496 E.00165
G1 X143.199 Y139.876 E.0424
G1 X143.145 Y139.876 E.00165
M106 S252.45
G1 F5906
G1 X142.899 Y139.876 E.00756
G1 X115.772 Y139.876 E.83353
M204 S10000
G1 X115.228 Y139.186 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5906
G1 X142.603 Y139.186 E.42108
; WIPE_START
G1 F24000
G1 X140.603 Y139.186 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I-1.156 J.38 P1  F30000
G1 X142.114 Y143.786 Z4.8
G1 Z4.4
G1 E.8 F1800
; LINE_WIDTH: 0.431684
G1 F5906
G3 X140.881 Y143.786 I-.61 J-35.918 E.03905
; LINE_WIDTH: 0.432142
G1 X140.183 Y143.762 E.02217
; LINE_WIDTH: 0.475922
G1 X139.484 Y143.738 E.02466
; LINE_WIDTH: 0.519701
G1 X138.786 Y143.714 E.02715
; LINE_WIDTH: 0.56348
G1 X138.087 Y143.69 E.02965
; LINE_WIDTH: 0.60726
G1 X137.389 Y143.666 E.03214
G1 X134.828 Y143.32 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5906
G1 X136.453 Y143.432 E.05401
G1 X136.049 Y143.836 E.01896
G1 X132.972 Y143.836 E.10206
G1 X132.281 Y143.145 E.03242
G1 X129.27 Y142.938 E.1001
G1 X128.373 Y143.836 E.04212
G1 X125.296 Y143.836 E.10206
G1 X124.038 Y142.579 E.05899
M73 P84 R1
G1 X122.088 Y142.445 E.06485
G1 X120.697 Y143.836 E.06528
G1 X117.62 Y143.836 E.10206
G1 X115.821 Y142.037 E.08441
G3 X117.446 Y142.126 I.168 J11.868 E.05404
; CHANGE_LAYER
; Z_HEIGHT: 4.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X115.821 Y142.037 E-.61852
G1 X116.084 Y142.3 E-.14148
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 23/30
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
G3 Z4.8 I1.212 J-.106 P1  F30000
G1 X114.648 Y125.948 Z4.8
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5948
G1 X114.648 Y128.152 E.07312
G1 X115.495 Y128.152 E.02812
G1 X140.229 Y129.852 E.8224
G1 X141.981 Y129.852 E.05812
G1 X141.981 Y130.648 E.0264
G1 X114.352 Y130.648 E.91651
G1 X114.352 Y125.352 E.17567
G1 X142.936 Y125.352 E.94819
M204 S5000
; FEATURE: Overhang wall
M106 S255
G1 F3000
G1 X143.564 Y125.352 E.02081
M106 S252.45
M204 S10000
; FEATURE: Inner wall
G1 F5948
G1 X145.648 Y125.352 E.06914
G1 X145.648 Y125.948 E.01977
G1 X143.564 Y125.948 E.06914
M204 S5000
; FEATURE: Overhang wall
M106 S255
G1 F3000
G1 X142.936 Y125.948 E.02081
M106 S252.45
M204 S10000
; FEATURE: Inner wall
G1 F5948
G1 X142.554 Y125.948 E.01269
G1 X114.708 Y125.948 E.9237
G1 X115.04 Y126.34 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5948
G1 X115.04 Y127.76 E.04363
G1 X115.509 Y127.76 E.01441
G1 X140.243 Y129.46 E.7618
G1 X142.078 Y129.46 E.0564
G1 X142.324 Y129.46 E.00756
M106 S255
G1 F600
G1 X142.373 Y129.46 E.00151
G1 X142.373 Y131.04 E.04855
G1 X142.324 Y131.04 E.00151
M106 S252.45
G1 F5948
G1 X142.078 Y131.04 E.00756
G1 X113.96 Y131.04 E.864
G1 X113.96 Y124.96 E.18682
G1 X142.936 Y124.96 E.89036
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X143.564 Y124.96 E.02081
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5948
G1 X146.04 Y124.96 E.07609
G1 X146.04 Y126.34 E.0424
G1 X143.564 Y126.34 E.07609
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X142.936 Y126.34 E.02081
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5948
G1 X115.1 Y126.34 E.85533
M204 S10000
G1 X114.556 Y125.65 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5948
G1 X145.444 Y125.65 E.47513
; WIPE_START
G1 F24000
G1 X143.444 Y125.65 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I-1.144 J-.415 P1  F30000
G1 X141.778 Y130.25 Z5
G1 Z4.6
G1 E.8 F1800
; LINE_WIDTH: 0.431684
G1 F5948
G3 X140.209 Y130.25 I-.778 J-45.71 E.0497
; LINE_WIDTH: 0.432142
G1 X139.511 Y130.226 E.02217
; LINE_WIDTH: 0.475922
G1 X138.812 Y130.202 E.02466
; LINE_WIDTH: 0.519701
G1 X138.114 Y130.178 E.02715
; LINE_WIDTH: 0.56348
G1 X137.415 Y130.154 E.02965
; LINE_WIDTH: 0.60726
G1 X136.717 Y130.13 E.03214
G1 X134.156 Y129.784 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5948
G1 X135.781 Y129.895 E.05401
G1 X135.376 Y130.3 E.01896
G1 X132.3 Y130.3 E.10206
G1 X131.609 Y129.609 E.03242
G1 X128.598 Y129.402 E.1001
G1 X127.7 Y130.3 E.04212
G1 X124.624 Y130.3 E.10206
G1 X123.366 Y129.042 E.05899
G1 X121.416 Y128.908 E.06485
G1 X120.024 Y130.3 E.06528
G1 X116.948 Y130.3 E.10206
G1 X115.148 Y128.5 E.08441
G3 X116.774 Y128.589 I.168 J11.868 E.05404
; WIPE_START
G1 F24000
G1 X115.148 Y128.5 E-.61852
G1 X115.412 Y128.764 E-.14148
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I-.045 J1.216 P1  F30000
G1 X144.519 Y129.852 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5948
G1 X145.648 Y129.852 E.03746
G1 X145.648 Y130.648 E.0264
G1 X144.519 Y130.648 E.03746
G1 X144.519 Y129.912 E.02441
G1 X144.422 Y129.46 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5948
G1 X146.04 Y129.46 E.04973
G1 X146.04 Y131.04 E.04855
G1 X144.422 Y131.04 E.04973
G1 X144.176 Y131.04 E.00756
M106 S255
G1 F600
G1 X144.127 Y131.04 E.00151
G1 X144.127 Y129.46 E.04855
G1 X144.176 Y129.46 E.00151
M106 S252.45
G1 F5948
G1 X144.362 Y129.46 E.00572
M204 S10000
; WIPE_START
G1 F24000
G1 X146.04 Y129.46 E-.63776
G1 X146.04 Y129.782 E-.12224
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I-.367 J-1.16 P1  F30000
G1 X115.32 Y139.484 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5948
G1 X115.32 Y141.689 E.07312
G1 X116.168 Y141.689 E.02812
G1 X140.902 Y143.389 E.8224
G1 X142.654 Y143.389 E.05812
G1 X142.654 Y144.184 E.0264
G1 X115.024 Y144.184 E.91651
G1 X115.024 Y138.889 E.17567
G1 X143.609 Y138.889 E.94819
M204 S5000
; FEATURE: Overhang wall
M106 S255
G1 F3000
G1 X144.236 Y138.889 E.02081
M106 S252.45
M204 S10000
; FEATURE: Inner wall
G1 F5948
G1 X146.32 Y138.889 E.06914
M73 P85 R1
G1 X146.32 Y139.484 E.01977
G1 X144.236 Y139.484 E.06914
M204 S5000
; FEATURE: Overhang wall
M106 S255
G1 F3000
G1 X143.609 Y139.484 E.02081
M106 S252.45
M204 S10000
; FEATURE: Inner wall
G1 F5948
G1 X143.226 Y139.484 E.01269
G1 X115.38 Y139.484 E.9237
G1 X115.712 Y139.876 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5948
G1 X115.712 Y141.296 E.04363
G1 X116.181 Y141.296 E.01441
G1 X140.915 Y142.996 E.7618
G1 X142.751 Y142.996 E.0564
G1 X142.997 Y142.996 E.00756
M106 S255
G1 F600
G1 X143.046 Y142.996 E.00151
G1 X143.046 Y144.576 E.04855
G1 X142.997 Y144.576 E.00151
M106 S252.45
G1 F5948
G1 X142.751 Y144.576 E.00756
G1 X114.632 Y144.576 E.864
G1 X114.632 Y138.496 E.18682
G1 X143.609 Y138.496 E.89036
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X144.236 Y138.496 E.02081
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5948
G1 X146.712 Y138.496 E.07609
G1 X146.712 Y139.876 E.0424
G1 X144.236 Y139.876 E.07609
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X143.609 Y139.876 E.02081
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5948
G1 X115.772 Y139.876 E.85533
M204 S10000
G1 X115.228 Y139.186 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5948
G1 X146.117 Y139.186 E.47513
; WIPE_START
G1 F24000
G1 X144.117 Y139.186 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I-1.144 J-.415 P1  F30000
G1 X142.45 Y143.786 Z5
G1 Z4.6
G1 E.8 F1800
; LINE_WIDTH: 0.431684
G1 F5948
G3 X140.881 Y143.786 I-.778 J-45.71 E.0497
; LINE_WIDTH: 0.432142
G1 X140.183 Y143.762 E.02217
; LINE_WIDTH: 0.475922
G1 X139.484 Y143.738 E.02466
; LINE_WIDTH: 0.519701
G1 X138.786 Y143.714 E.02715
; LINE_WIDTH: 0.56348
G1 X138.087 Y143.69 E.02965
; LINE_WIDTH: 0.60726
G1 X137.389 Y143.666 E.03214
G1 X134.828 Y143.32 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5948
G1 X136.453 Y143.432 E.05401
G1 X136.049 Y143.836 E.01896
G1 X132.972 Y143.836 E.10206
G1 X132.281 Y143.145 E.03242
G1 X129.27 Y142.938 E.1001
G1 X128.373 Y143.836 E.04212
G1 X125.296 Y143.836 E.10206
G1 X124.038 Y142.579 E.05899
G1 X122.088 Y142.445 E.06485
G1 X120.697 Y143.836 E.06528
G1 X117.62 Y143.836 E.10206
G1 X115.821 Y142.037 E.08441
G3 X117.446 Y142.126 I.168 J11.868 E.05404
; WIPE_START
G1 F24000
G1 X115.821 Y142.037 E-.61852
G1 X116.084 Y142.3 E-.14148
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I-.045 J1.216 P1  F30000
G1 X145.191 Y143.389 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5948
G1 X146.32 Y143.389 E.03746
G1 X146.32 Y144.184 E.0264
G1 X145.191 Y144.184 E.03746
G1 X145.191 Y143.449 E.02441
G1 X145.094 Y142.996 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5948
G1 X146.712 Y142.996 E.04973
G1 X146.712 Y144.576 E.04855
G1 X145.094 Y144.576 E.04973
G1 X144.848 Y144.576 E.00756
M106 S255
G1 F600
G1 X144.799 Y144.576 E.00151
G1 X144.799 Y142.996 E.04855
G1 X144.848 Y142.996 E.00151
M106 S252.45
G1 F5948
G1 X145.034 Y142.996 E.00572
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 4.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X146.712 Y142.996 E-.63776
G1 X146.712 Y143.318 E-.12224
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 24/30
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
G3 Z5 I.58 J-1.07 P1  F30000
G1 X114.648 Y125.948 Z5
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5373
G1 X114.648 Y128.152 E.07312
G1 X115.495 Y128.152 E.02812
G1 X140.229 Y129.852 E.8224
G1 X142.783 Y129.852 E.08472
M204 S5000
; FEATURE: Overhang wall
M106 S255
G1 F3000
G1 X143.717 Y129.852 E.03096
M106 S252.45
M204 S10000
; FEATURE: Inner wall
G1 F5373
G1 X145.648 Y129.852 E.06407
G1 X145.648 Y130.648 E.0264
G1 X143.717 Y130.648 E.06407
M204 S5000
; FEATURE: Overhang wall
M106 S255
G1 F3000
G1 X142.783 Y130.648 E.03096
M106 S252.45
M204 S10000
; FEATURE: Inner wall
G1 F5373
G1 X142.401 Y130.648 E.01269
G1 X114.352 Y130.648 E.93043
G1 X114.352 Y125.352 E.17567
G1 X145.648 Y125.352 E1.03814
G1 X145.648 Y125.948 E.01977
G1 X114.708 Y125.948 E1.02634
G1 X115.04 Y126.34 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5373
G1 X115.04 Y127.76 E.04363
G1 X115.509 Y127.76 E.01441
G1 X140.243 Y129.46 E.7618
G1 X142.783 Y129.46 E.07807
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X143.717 Y129.46 E.03096
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5373
G1 X146.04 Y129.46 E.07139
G1 X146.04 Y131.04 E.04855
G1 X143.717 Y131.04 E.07139
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X142.783 Y131.04 E.03096
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5373
G1 X142.414 Y131.04 E.01134
G1 X113.96 Y131.04 E.87432
G1 X113.96 Y124.96 E.18682
G1 X146.04 Y124.96 E.98573
G1 X146.04 Y126.34 E.0424
G1 X115.1 Y126.34 E.9507
M204 S10000
G1 X114.556 Y125.65 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5373
G1 X145.444 Y125.65 E.47513
; WIPE_START
G1 F24000
G1 X143.444 Y125.65 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I-1.116 J.485 P1  F30000
G1 X145.444 Y130.25 Z5.2
G1 Z4.8
G1 E.8 F1800
; LINE_WIDTH: 0.431684
G1 F5373
G1 X140.209 Y130.25 E.16585
; LINE_WIDTH: 0.432142
G1 X139.511 Y130.226 E.02217
; LINE_WIDTH: 0.475922
G1 X138.812 Y130.202 E.02466
; LINE_WIDTH: 0.519701
G1 X138.114 Y130.178 E.02715
; LINE_WIDTH: 0.56348
G1 X137.415 Y130.154 E.02965
; LINE_WIDTH: 0.60726
G1 X136.717 Y130.13 E.03214
G1 X134.156 Y129.784 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5373
G1 X135.781 Y129.895 E.05401
G1 X135.376 Y130.3 E.01896
G1 X132.3 Y130.3 E.10206
G1 X131.609 Y129.609 E.03242
G1 X128.598 Y129.402 E.1001
G1 X127.7 Y130.3 E.04212
G1 X124.624 Y130.3 E.10206
G1 X123.366 Y129.042 E.05899
G1 X121.416 Y128.908 E.06485
M73 P86 R1
G1 X120.024 Y130.3 E.06528
G1 X116.948 Y130.3 E.10206
G1 X115.148 Y128.5 E.08441
G3 X116.774 Y128.589 I.168 J11.868 E.05404
; WIPE_START
G1 F24000
G1 X115.148 Y128.5 E-.61852
G1 X115.412 Y128.764 E-.14148
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I-1.217 J-.01 P1  F30000
G1 X115.32 Y139.484 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5373
G1 X115.32 Y141.689 E.07312
G1 X116.168 Y141.689 E.02812
G1 X140.902 Y143.389 E.8224
G1 X143.456 Y143.389 E.08472
M204 S5000
; FEATURE: Overhang wall
M106 S255
G1 F3000
G1 X144.389 Y143.389 E.03096
M106 S252.45
M204 S10000
; FEATURE: Inner wall
G1 F5373
G1 X146.32 Y143.389 E.06407
G1 X146.32 Y144.184 E.0264
G1 X144.389 Y144.184 E.06407
M204 S5000
; FEATURE: Overhang wall
M106 S255
G1 F3000
G1 X143.456 Y144.184 E.03096
M106 S252.45
M204 S10000
; FEATURE: Inner wall
G1 F5373
G1 X143.073 Y144.184 E.01269
G1 X115.024 Y144.184 E.93043
G1 X115.024 Y138.889 E.17567
G1 X146.32 Y138.889 E1.03814
G1 X146.32 Y139.484 E.01977
G1 X115.38 Y139.484 E1.02634
G1 X115.712 Y139.876 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5373
G1 X115.712 Y141.296 E.04363
G1 X116.181 Y141.296 E.01441
G1 X140.915 Y142.996 E.7618
G1 X143.456 Y142.996 E.07807
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X144.389 Y142.996 E.03096
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5373
G1 X146.712 Y142.996 E.07139
G1 X146.712 Y144.576 E.04855
G1 X144.389 Y144.576 E.07139
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X143.456 Y144.576 E.03096
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5373
G1 X143.087 Y144.576 E.01134
G1 X114.632 Y144.576 E.87432
G1 X114.632 Y138.496 E.18682
G1 X146.712 Y138.496 E.98573
G1 X146.712 Y139.876 E.0424
G1 X115.772 Y139.876 E.9507
M204 S10000
G1 X115.228 Y139.186 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5373
G1 X146.117 Y139.186 E.47513
; WIPE_START
G1 F24000
G1 X144.117 Y139.186 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I-1.116 J.485 P1  F30000
G1 X146.117 Y143.786 Z5.2
G1 Z4.8
G1 E.8 F1800
; LINE_WIDTH: 0.431684
G1 F5373
G1 X140.881 Y143.786 E.16585
; LINE_WIDTH: 0.432142
G1 X140.183 Y143.762 E.02217
; LINE_WIDTH: 0.475922
G1 X139.484 Y143.738 E.02466
; LINE_WIDTH: 0.519701
G1 X138.786 Y143.714 E.02715
; LINE_WIDTH: 0.56348
G1 X138.087 Y143.69 E.02965
; LINE_WIDTH: 0.60726
G1 X137.389 Y143.666 E.03214
G1 X134.828 Y143.32 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5373
G1 X136.453 Y143.432 E.05401
G1 X136.049 Y143.836 E.01896
G1 X132.972 Y143.836 E.10206
G1 X132.281 Y143.145 E.03242
G1 X129.27 Y142.938 E.1001
G1 X128.373 Y143.836 E.04212
G1 X125.296 Y143.836 E.10206
G1 X124.038 Y142.579 E.05899
G1 X122.088 Y142.445 E.06485
G1 X120.697 Y143.836 E.06528
G1 X117.62 Y143.836 E.10206
G1 X115.821 Y142.037 E.08441
G3 X117.446 Y142.126 I.168 J11.868 E.05404
; CHANGE_LAYER
; Z_HEIGHT: 5
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X115.821 Y142.037 E-.61852
G1 X116.084 Y142.3 E-.14148
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 25/30
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
G3 Z5.2 I1.212 J-.106 P1  F30000
G1 X114.648 Y125.948 Z5.2
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5288
G1 X114.648 Y128.152 E.07312
G1 X115.495 Y128.152 E.02812
G1 X140.229 Y129.852 E.8224
G1 X145.648 Y129.852 E.17974
G1 X145.648 Y130.648 E.0264
G1 X114.352 Y130.648 E1.03814
G1 X114.352 Y125.352 E.17567
G1 X145.648 Y125.352 E1.03814
G1 X145.648 Y125.948 E.01977
G1 X114.708 Y125.948 E1.02634
G1 X115.04 Y126.34 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M73 P87 R1
G1 F5288
G1 X115.04 Y127.76 E.04363
G1 X115.509 Y127.76 E.01441
G1 X140.243 Y129.46 E.7618
G1 X146.04 Y129.46 E.17813
G1 X146.04 Y131.04 E.04855
G1 X113.96 Y131.04 E.98573
G1 X113.96 Y124.96 E.18682
G1 X146.04 Y124.96 E.98573
G1 X146.04 Y126.34 E.0424
G1 X115.1 Y126.34 E.9507
M204 S10000
G1 X114.556 Y125.65 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5288
G1 X145.444 Y125.65 E.47513
; WIPE_START
G1 F24000
G1 X143.444 Y125.65 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I-1.116 J.485 P1  F30000
G1 X145.444 Y130.25 Z5.4
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.431684
G1 F5288
G1 X140.209 Y130.25 E.16585
; LINE_WIDTH: 0.432142
G1 X139.511 Y130.226 E.02217
; LINE_WIDTH: 0.475922
G1 X138.812 Y130.202 E.02466
; LINE_WIDTH: 0.519701
G1 X138.114 Y130.178 E.02715
; LINE_WIDTH: 0.56348
G1 X137.415 Y130.154 E.02965
; LINE_WIDTH: 0.60726
G1 X136.717 Y130.13 E.03214
G1 X134.156 Y129.784 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5288
G1 X135.781 Y129.895 E.05401
G1 X135.376 Y130.3 E.01896
G1 X132.3 Y130.3 E.10206
G1 X131.609 Y129.609 E.03242
G1 X128.598 Y129.402 E.1001
G1 X127.7 Y130.3 E.04212
G1 X124.624 Y130.3 E.10206
G1 X123.366 Y129.042 E.05899
G1 X121.416 Y128.908 E.06485
G1 X120.024 Y130.3 E.06528
G1 X116.948 Y130.3 E.10206
G1 X115.148 Y128.5 E.08441
G3 X116.774 Y128.589 I.168 J11.868 E.05404
; WIPE_START
G1 F24000
G1 X115.148 Y128.5 E-.61852
G1 X115.412 Y128.764 E-.14148
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I-1.217 J-.01 P1  F30000
G1 X115.32 Y139.484 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5288
G1 X115.32 Y141.689 E.07312
G1 X116.168 Y141.689 E.02812
G1 X140.902 Y143.389 E.8224
G1 X146.32 Y143.389 E.17974
G1 X146.32 Y144.184 E.0264
G1 X115.024 Y144.184 E1.03814
G1 X115.024 Y138.889 E.17567
G1 X146.32 Y138.889 E1.03814
G1 X146.32 Y139.484 E.01977
G1 X115.38 Y139.484 E1.02634
G1 X115.712 Y139.876 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5288
G1 X115.712 Y141.296 E.04363
G1 X116.181 Y141.296 E.01441
G1 X140.915 Y142.996 E.7618
G1 X146.712 Y142.996 E.17813
G1 X146.712 Y144.576 E.04855
G1 X114.632 Y144.576 E.98573
G1 X114.632 Y138.496 E.18682
G1 X146.712 Y138.496 E.98573
G1 X146.712 Y139.876 E.0424
G1 X115.772 Y139.876 E.9507
M204 S10000
G1 X115.228 Y139.186 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5288
G1 X146.117 Y139.186 E.47513
; WIPE_START
G1 F24000
G1 X144.117 Y139.186 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I-1.116 J.485 P1  F30000
G1 X146.117 Y143.786 Z5.4
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.431684
G1 F5288
G1 X140.881 Y143.786 E.16585
; LINE_WIDTH: 0.432142
G1 X140.183 Y143.762 E.02217
; LINE_WIDTH: 0.475922
G1 X139.484 Y143.738 E.02466
; LINE_WIDTH: 0.519701
G1 X138.786 Y143.714 E.02715
; LINE_WIDTH: 0.56348
G1 X138.087 Y143.69 E.02965
; LINE_WIDTH: 0.60726
G1 X137.389 Y143.666 E.03214
G1 X134.828 Y143.32 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5288
G1 X136.453 Y143.432 E.05401
G1 X136.049 Y143.836 E.01896
G1 X132.972 Y143.836 E.10206
G1 X132.281 Y143.145 E.03242
G1 X129.27 Y142.938 E.1001
G1 X128.373 Y143.836 E.04212
G1 X125.296 Y143.836 E.10206
G1 X124.038 Y142.579 E.05899
G1 X122.088 Y142.445 E.06485
G1 X120.697 Y143.836 E.06528
G1 X117.62 Y143.836 E.10206
G1 X115.821 Y142.037 E.08441
G3 X117.446 Y142.126 I.168 J11.868 E.05404
; CHANGE_LAYER
; Z_HEIGHT: 5.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X115.821 Y142.037 E-.61852
G1 X116.084 Y142.3 E-.14148
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 26/30
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
G3 Z5.4 I1.212 J-.106 P1  F30000
M73 P88 R1
G1 X114.648 Y125.948 Z5.4
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5288
G1 X114.648 Y128.152 E.07312
G1 X115.495 Y128.152 E.02812
G1 X140.229 Y129.852 E.8224
G1 X145.648 Y129.852 E.17974
G1 X145.648 Y130.648 E.0264
G1 X114.352 Y130.648 E1.03814
G1 X114.352 Y125.352 E.17567
G1 X145.648 Y125.352 E1.03814
G1 X145.648 Y125.948 E.01977
G1 X114.708 Y125.948 E1.02634
G1 X115.04 Y126.34 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5288
G1 X115.04 Y127.76 E.04363
G1 X115.509 Y127.76 E.01441
G1 X140.243 Y129.46 E.7618
G1 X146.04 Y129.46 E.17813
G1 X146.04 Y131.04 E.04855
G1 X113.96 Y131.04 E.98573
G1 X113.96 Y124.96 E.18682
G1 X146.04 Y124.96 E.98573
G1 X146.04 Y126.34 E.0424
G1 X115.1 Y126.34 E.9507
M204 S10000
G1 X114.556 Y125.65 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5288
G1 X145.444 Y125.65 E.47513
; WIPE_START
G1 F24000
G1 X143.444 Y125.65 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I-1.116 J.485 P1  F30000
G1 X145.444 Y130.25 Z5.6
G1 Z5.2
G1 E.8 F1800
; LINE_WIDTH: 0.431684
G1 F5288
G1 X140.209 Y130.25 E.16585
; LINE_WIDTH: 0.432142
G1 X139.511 Y130.226 E.02217
; LINE_WIDTH: 0.475922
G1 X138.812 Y130.202 E.02466
; LINE_WIDTH: 0.519701
G1 X138.114 Y130.178 E.02715
; LINE_WIDTH: 0.56348
G1 X137.415 Y130.154 E.02965
; LINE_WIDTH: 0.60726
G1 X136.717 Y130.13 E.03214
G1 X134.156 Y129.784 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5288
G1 X135.781 Y129.895 E.05401
G1 X135.376 Y130.3 E.01896
G1 X132.3 Y130.3 E.10206
G1 X131.609 Y129.609 E.03242
G1 X128.598 Y129.402 E.1001
G1 X127.7 Y130.3 E.04212
G1 X124.624 Y130.3 E.10206
G1 X123.366 Y129.042 E.05899
G1 X121.416 Y128.908 E.06485
G1 X120.024 Y130.3 E.06528
G1 X116.948 Y130.3 E.10206
G1 X115.148 Y128.5 E.08441
G3 X116.774 Y128.589 I.168 J11.868 E.05404
; WIPE_START
G1 F24000
G1 X115.148 Y128.5 E-.61852
G1 X115.412 Y128.764 E-.14148
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I-1.217 J-.01 P1  F30000
G1 X115.32 Y139.484 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5288
G1 X115.32 Y141.689 E.07312
G1 X116.168 Y141.689 E.02812
G1 X140.902 Y143.389 E.8224
G1 X146.32 Y143.389 E.17974
G1 X146.32 Y144.184 E.0264
G1 X115.024 Y144.184 E1.03814
G1 X115.024 Y138.889 E.17567
G1 X146.32 Y138.889 E1.03814
G1 X146.32 Y139.484 E.01977
G1 X115.38 Y139.484 E1.02634
G1 X115.712 Y139.876 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M73 P89 R1
G1 F5288
G1 X115.712 Y141.296 E.04363
G1 X116.181 Y141.296 E.01441
G1 X140.915 Y142.996 E.7618
G1 X146.712 Y142.996 E.17813
G1 X146.712 Y144.576 E.04855
G1 X114.632 Y144.576 E.98573
G1 X114.632 Y138.496 E.18682
G1 X146.712 Y138.496 E.98573
G1 X146.712 Y139.876 E.0424
G1 X115.772 Y139.876 E.9507
M204 S10000
G1 X115.228 Y139.186 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5288
G1 X146.117 Y139.186 E.47513
; WIPE_START
G1 F24000
G1 X144.117 Y139.186 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I-1.116 J.485 P1  F30000
G1 X146.117 Y143.786 Z5.6
G1 Z5.2
G1 E.8 F1800
; LINE_WIDTH: 0.431684
G1 F5288
G1 X140.881 Y143.786 E.16585
; LINE_WIDTH: 0.432142
G1 X140.183 Y143.762 E.02217
; LINE_WIDTH: 0.475922
G1 X139.484 Y143.738 E.02466
; LINE_WIDTH: 0.519701
G1 X138.786 Y143.714 E.02715
; LINE_WIDTH: 0.56348
G1 X138.087 Y143.69 E.02965
; LINE_WIDTH: 0.60726
G1 X137.389 Y143.666 E.03214
G1 X134.828 Y143.32 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5288
G1 X136.453 Y143.432 E.05401
G1 X136.049 Y143.836 E.01896
G1 X132.972 Y143.836 E.10206
G1 X132.281 Y143.145 E.03242
G1 X129.27 Y142.938 E.1001
G1 X128.373 Y143.836 E.04212
G1 X125.296 Y143.836 E.10206
G1 X124.038 Y142.579 E.05899
G1 X122.088 Y142.445 E.06485
G1 X120.697 Y143.836 E.06528
G1 X117.62 Y143.836 E.10206
G1 X115.821 Y142.037 E.08441
G3 X117.446 Y142.126 I.168 J11.868 E.05404
; CHANGE_LAYER
; Z_HEIGHT: 5.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X115.821 Y142.037 E-.61852
G1 X116.084 Y142.3 E-.14148
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 27/30
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
G3 Z5.6 I1.212 J-.106 P1  F30000
G1 X114.648 Y125.948 Z5.6
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5288
G1 X114.648 Y128.152 E.07312
G1 X115.495 Y128.152 E.02812
G1 X140.229 Y129.852 E.8224
G1 X145.648 Y129.852 E.17974
G1 X145.648 Y130.648 E.0264
G1 X114.352 Y130.648 E1.03814
G1 X114.352 Y125.352 E.17567
G1 X145.648 Y125.352 E1.03814
G1 X145.648 Y125.948 E.01977
G1 X114.708 Y125.948 E1.02634
G1 X115.04 Y126.34 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5288
G1 X115.04 Y127.76 E.04363
G1 X115.509 Y127.76 E.01441
G1 X140.243 Y129.46 E.7618
G1 X146.04 Y129.46 E.17813
G1 X146.04 Y131.04 E.04855
G1 X113.96 Y131.04 E.98573
G1 X113.96 Y124.96 E.18682
G1 X146.04 Y124.96 E.98573
G1 X146.04 Y126.34 E.0424
G1 X115.1 Y126.34 E.9507
M204 S10000
G1 X114.556 Y125.65 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5288
G1 X145.444 Y125.65 E.47513
; WIPE_START
G1 F24000
G1 X143.444 Y125.65 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I-1.116 J.485 P1  F30000
G1 X145.444 Y130.25 Z5.8
G1 Z5.4
G1 E.8 F1800
; LINE_WIDTH: 0.431684
G1 F5288
G1 X140.209 Y130.25 E.16585
; LINE_WIDTH: 0.432142
G1 X139.511 Y130.226 E.02217
; LINE_WIDTH: 0.475922
G1 X138.812 Y130.202 E.02466
; LINE_WIDTH: 0.519701
G1 X138.114 Y130.178 E.02715
; LINE_WIDTH: 0.56348
G1 X137.415 Y130.154 E.02965
; LINE_WIDTH: 0.60726
G1 X136.717 Y130.13 E.03214
G1 X134.156 Y129.784 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5288
G1 X135.781 Y129.895 E.05401
G1 X135.376 Y130.3 E.01896
G1 X132.3 Y130.3 E.10206
G1 X131.609 Y129.609 E.03242
G1 X128.598 Y129.402 E.1001
G1 X127.7 Y130.3 E.04212
G1 X124.624 Y130.3 E.10206
G1 X123.366 Y129.042 E.05899
G1 X121.416 Y128.908 E.06485
G1 X120.024 Y130.3 E.06528
G1 X116.948 Y130.3 E.10206
G1 X115.148 Y128.5 E.08441
G3 X116.774 Y128.589 I.168 J11.868 E.05404
; WIPE_START
G1 F24000
G1 X115.148 Y128.5 E-.61852
G1 X115.412 Y128.764 E-.14148
; WIPE_END
G1 E-.04 F1800
G17
M73 P90 R1
G3 Z5.8 I-1.217 J-.01 P1  F30000
G1 X115.32 Y139.484 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5288
G1 X115.32 Y141.689 E.07312
G1 X116.168 Y141.689 E.02812
G1 X140.902 Y143.389 E.8224
G1 X146.32 Y143.389 E.17974
G1 X146.32 Y144.184 E.0264
G1 X115.024 Y144.184 E1.03814
G1 X115.024 Y138.889 E.17567
G1 X146.32 Y138.889 E1.03814
G1 X146.32 Y139.484 E.01977
G1 X115.38 Y139.484 E1.02634
G1 X115.712 Y139.876 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5288
G1 X115.712 Y141.296 E.04363
G1 X116.181 Y141.296 E.01441
G1 X140.915 Y142.996 E.7618
G1 X146.712 Y142.996 E.17813
G1 X146.712 Y144.576 E.04855
G1 X114.632 Y144.576 E.98573
G1 X114.632 Y138.496 E.18682
G1 X146.712 Y138.496 E.98573
G1 X146.712 Y139.876 E.0424
G1 X115.772 Y139.876 E.9507
M204 S10000
G1 X115.228 Y139.186 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5288
G1 X146.117 Y139.186 E.47513
; WIPE_START
G1 F24000
G1 X144.117 Y139.186 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I-1.116 J.485 P1  F30000
G1 X146.117 Y143.786 Z5.8
G1 Z5.4
G1 E.8 F1800
; LINE_WIDTH: 0.431684
G1 F5288
G1 X140.881 Y143.786 E.16585
; LINE_WIDTH: 0.432142
G1 X140.183 Y143.762 E.02217
; LINE_WIDTH: 0.475922
G1 X139.484 Y143.738 E.02466
; LINE_WIDTH: 0.519701
G1 X138.786 Y143.714 E.02715
; LINE_WIDTH: 0.56348
G1 X138.087 Y143.69 E.02965
; LINE_WIDTH: 0.60726
G1 X137.389 Y143.666 E.03214
G1 X134.828 Y143.32 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5288
G1 X136.453 Y143.432 E.05401
G1 X136.049 Y143.836 E.01896
G1 X132.972 Y143.836 E.10206
G1 X132.281 Y143.145 E.03242
G1 X129.27 Y142.938 E.1001
G1 X128.373 Y143.836 E.04212
G1 X125.296 Y143.836 E.10206
G1 X124.038 Y142.579 E.05899
G1 X122.088 Y142.445 E.06485
G1 X120.697 Y143.836 E.06528
G1 X117.62 Y143.836 E.10206
G1 X115.821 Y142.037 E.08441
G3 X117.446 Y142.126 I.168 J11.868 E.05404
; CHANGE_LAYER
; Z_HEIGHT: 5.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X115.821 Y142.037 E-.61852
G1 X116.084 Y142.3 E-.14148
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 28/30
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
G3 Z5.8 I1.212 J-.106 P1  F30000
G1 X114.648 Y125.948 Z5.8
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6195
G1 X114.648 Y128.152 E.07312
G1 X115.495 Y128.152 E.02812
G1 X140.229 Y129.852 E.8224
G1 X145.648 Y129.852 E.17974
G1 X145.648 Y130.648 E.0264
G1 X114.352 Y130.648 E1.03814
G1 X114.352 Y125.352 E.17567
G1 X145.648 Y125.352 E1.03814
G1 X145.648 Y125.948 E.01977
G1 X114.708 Y125.948 E1.02634
G1 X115.04 Y126.34 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M73 P91 R1
G1 F6195
G1 X115.04 Y127.76 E.04363
G1 X115.509 Y127.76 E.01441
G1 X140.243 Y129.46 E.7618
G1 X146.04 Y129.46 E.17813
G1 X146.04 Y131.04 E.04855
G1 X113.96 Y131.04 E.98573
G1 X113.96 Y124.96 E.18682
G1 X146.04 Y124.96 E.98573
G1 X146.04 Y126.34 E.0424
G1 X115.1 Y126.34 E.9507
M204 S10000
G1 X114.556 Y125.65 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F6195
G1 X145.444 Y125.65 E.47513
; WIPE_START
G1 F24000
G1 X143.444 Y125.65 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I-1.116 J.485 P1  F30000
G1 X145.444 Y130.25 Z6
G1 Z5.6
G1 E.8 F1800
; LINE_WIDTH: 0.431684
G1 F6195
G1 X140.209 Y130.25 E.16585
; LINE_WIDTH: 0.432142
G1 X139.511 Y130.226 E.02217
; LINE_WIDTH: 0.475922
G1 X138.812 Y130.202 E.02466
; LINE_WIDTH: 0.519701
G1 X138.114 Y130.178 E.02715
; LINE_WIDTH: 0.56348
G1 X137.415 Y130.154 E.02965
; LINE_WIDTH: 0.60726
G1 X136.717 Y130.13 E.03214
G1 X115.595 Y129.405 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.613588
G1 F6195
G1 X116.292 Y129.429 E.03241
; LINE_WIDTH: 0.564949
G1 X116.988 Y129.453 E.02965
; LINE_WIDTH: 0.51631
G1 X117.685 Y129.477 E.02688
; LINE_WIDTH: 0.467671
G1 X118.381 Y129.501 E.02412
; LINE_WIDTH: 0.419032
G1 X119.078 Y129.524 E.02136
G1 X126.152 Y129.767 F30000
; LINE_WIDTH: 0.642978
G1 F6195
G1 X126.804 Y129.79 E.03189
; LINE_WIDTH: 0.597548
G1 X127.456 Y129.812 E.02947
; LINE_WIDTH: 0.552118
G1 X128.108 Y129.834 E.02706
; LINE_WIDTH: 0.506687
G1 X128.76 Y129.857 E.02465
; LINE_WIDTH: 0.461257
G1 X129.411 Y129.879 E.02223
; LINE_WIDTH: 0.415827
G1 X130.063 Y129.902 E.01982
G1 X126.152 Y129.767 F30000
; LINE_WIDTH: 0.642978
G1 F6195
G1 X126.088 Y129.739 E.00346
; LINE_WIDTH: 0.595261
G1 X126.023 Y129.711 E.00319
; LINE_WIDTH: 0.547543
G1 X125.958 Y129.682 E.00291
; LINE_WIDTH: 0.499825
G1 X125.893 Y129.654 E.00263
; LINE_WIDTH: 0.452107
M73 P91 R0
G1 X125.828 Y129.625 E.00236
; LINE_WIDTH: 0.404389
G1 X125.763 Y129.597 E.00208
; LINE_WIDTH: 0.356671
G1 X124.522 Y129.533 E.03179
; LINE_WIDTH: 0.39934
G1 X123.28 Y129.469 E.03611
; LINE_WIDTH: 0.442009
G1 X122.039 Y129.405 E.04043
; LINE_WIDTH: 0.484677
G1 X120.797 Y129.341 E.04475
; LINE_WIDTH: 0.527346
G1 X119.555 Y129.277 E.04908
; LINE_WIDTH: 0.570014
G1 X119.457 Y129.252 E.00437
; LINE_WIDTH: 0.532511
G1 X119.359 Y129.226 E.00406
; LINE_WIDTH: 0.495007
G1 X119.26 Y129.201 E.00375
; LINE_WIDTH: 0.420417
G1 X119.162 Y129.175 E.00313
G1 X115.469 Y128.921 E.11386
G1 X115.121 Y128.921 E.0107
G1 X115.121 Y129.879 E.02945
G1 X119.138 Y129.879 E.12355
; LINE_WIDTH: 0.419999
G1 X119.238 Y129.86 E.00312
; LINE_WIDTH: 0.457503
G1 X119.338 Y129.841 E.00344
; LINE_WIDTH: 0.495007
G1 X119.437 Y129.823 E.00375
; LINE_WIDTH: 0.532511
G1 X119.537 Y129.804 E.00406
; LINE_WIDTH: 0.570014
G1 X120.78 Y129.825 E.0534
; LINE_WIDTH: 0.527346
G1 X122.024 Y129.846 E.04908
; LINE_WIDTH: 0.484677
G1 X123.267 Y129.868 E.04475
; LINE_WIDTH: 0.442009
G1 X124.51 Y129.889 E.04043
; LINE_WIDTH: 0.39934
G1 X125.753 Y129.91 E.03611
; LINE_WIDTH: 0.356671
G1 X125.81 Y129.89 E.00155
; LINE_WIDTH: 0.404389
G1 X125.867 Y129.869 E.00179
; LINE_WIDTH: 0.452107
G1 X125.924 Y129.849 E.00203
; LINE_WIDTH: 0.499825
G1 X125.982 Y129.828 E.00226
; LINE_WIDTH: 0.547543
G1 X126.039 Y129.808 E.0025
; LINE_WIDTH: 0.595261
G1 X126.096 Y129.788 E.00274
G1 X130.147 Y129.552 F30000
; LINE_WIDTH: 0.419999
G1 F6195
G1 X115.482 Y128.544 E.45168
G1 X114.744 Y128.544 E.02267
G1 X114.744 Y130.256 E.0526
G1 X130.123 Y130.256 E.47255
G1 X130.223 Y130.237 E.00312
; LINE_WIDTH: 0.457504
G1 X130.323 Y130.218 E.00344
; LINE_WIDTH: 0.495008
G1 X130.423 Y130.2 E.00375
; LINE_WIDTH: 0.532512
G1 X130.523 Y130.181 E.00406
; LINE_WIDTH: 0.570016
G1 X131.937 Y130.205 E.06076
; LINE_WIDTH: 0.521465
G1 X133.352 Y130.229 E.05516
; LINE_WIDTH: 0.472913
G1 X134.766 Y130.254 E.04957
; LINE_WIDTH: 0.409185
G2 X136.341 Y130.278 I1.495 J-45.878 E.04702
G1 X136.352 Y129.956 E.0096
G1 X136.192 Y129.945 E.0048
; LINE_WIDTH: 0.37581
G1 X134.779 Y129.873 E.03837
; LINE_WIDTH: 0.424362
G1 X133.366 Y129.8 E.04397
; LINE_WIDTH: 0.472913
G1 X131.954 Y129.727 E.04957
; LINE_WIDTH: 0.521465
G1 X130.541 Y129.654 E.05516
; LINE_WIDTH: 0.570016
G1 X130.457 Y129.633 E.00372
; LINE_WIDTH: 0.532512
G1 X130.373 Y129.611 E.00346
; LINE_WIDTH: 0.495008
G1 X130.289 Y129.589 E.00319
; LINE_WIDTH: 0.457504
G1 X130.205 Y129.567 E.00293
; WIPE_START
G1 F24000
G1 X130.289 Y129.589 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I-.671 J-1.015 P1  F30000
G1 X115.32 Y139.484 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6195
G1 X115.32 Y141.689 E.07312
G1 X116.168 Y141.689 E.02812
G1 X140.902 Y143.389 E.8224
G1 X146.32 Y143.389 E.17974
G1 X146.32 Y144.184 E.0264
G1 X115.024 Y144.184 E1.03814
G1 X115.024 Y138.889 E.17567
G1 X146.32 Y138.889 E1.03814
G1 X146.32 Y139.484 E.01977
G1 X115.38 Y139.484 E1.02634
G1 X115.712 Y139.876 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6195
G1 X115.712 Y141.296 E.04363
G1 X116.181 Y141.296 E.01441
G1 X140.915 Y142.996 E.7618
G1 X146.712 Y142.996 E.17813
G1 X146.712 Y144.576 E.04855
G1 X114.632 Y144.576 E.98573
G1 X114.632 Y138.496 E.18682
G1 X146.712 Y138.496 E.98573
G1 X146.712 Y139.876 E.0424
G1 X115.772 Y139.876 E.9507
M204 S10000
G1 X115.228 Y139.186 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F6195
G1 X146.117 Y139.186 E.47513
; WIPE_START
G1 F24000
G1 X144.117 Y139.186 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I-1.116 J.485 P1  F30000
G1 X146.117 Y143.786 Z6
G1 Z5.6
G1 E.8 F1800
; LINE_WIDTH: 0.431684
G1 F6195
G1 X140.881 Y143.786 E.16585
; LINE_WIDTH: 0.432142
G1 X140.183 Y143.762 E.02217
; LINE_WIDTH: 0.475922
G1 X139.484 Y143.738 E.02466
; LINE_WIDTH: 0.519701
G1 X138.786 Y143.714 E.02715
; LINE_WIDTH: 0.56348
G1 X138.087 Y143.69 E.02965
; LINE_WIDTH: 0.60726
G1 X137.389 Y143.666 E.03214
G1 X116.267 Y142.941 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.613588
G1 F6195
G1 X116.964 Y142.965 E.03241
; LINE_WIDTH: 0.564949
G1 X117.66 Y142.989 E.02965
; LINE_WIDTH: 0.51631
G1 X118.357 Y143.013 E.02688
; LINE_WIDTH: 0.467671
G1 X119.053 Y143.037 E.02412
; LINE_WIDTH: 0.419032
G1 X119.75 Y143.061 E.02136
G1 X126.825 Y143.304 F30000
; LINE_WIDTH: 0.642978
G1 F6195
G1 X127.476 Y143.326 E.03189
; LINE_WIDTH: 0.597548
G1 X128.128 Y143.349 E.02947
; LINE_WIDTH: 0.552118
G1 X128.78 Y143.371 E.02706
; LINE_WIDTH: 0.506687
G1 X129.432 Y143.393 E.02465
; LINE_WIDTH: 0.461257
G1 X130.084 Y143.416 E.02223
; LINE_WIDTH: 0.415827
G1 X130.735 Y143.438 E.01982
G1 X126.825 Y143.304 F30000
; LINE_WIDTH: 0.642978
G1 F6195
G1 X126.76 Y143.275 E.00346
; LINE_WIDTH: 0.595261
G1 X126.695 Y143.247 E.00319
; LINE_WIDTH: 0.547543
M73 P92 R0
G1 X126.63 Y143.219 E.00291
; LINE_WIDTH: 0.499825
G1 X126.565 Y143.19 E.00263
; LINE_WIDTH: 0.452107
G1 X126.501 Y143.162 E.00236
; LINE_WIDTH: 0.404389
G1 X126.436 Y143.134 E.00208
; LINE_WIDTH: 0.356671
G1 X125.194 Y143.07 E.03179
; LINE_WIDTH: 0.39934
G1 X123.952 Y143.006 E.03611
; LINE_WIDTH: 0.442009
G1 X122.711 Y142.942 E.04043
; LINE_WIDTH: 0.484677
G1 X121.469 Y142.878 E.04475
; LINE_WIDTH: 0.527346
G1 X120.228 Y142.814 E.04908
; LINE_WIDTH: 0.570014
G1 X120.129 Y142.788 E.00437
; LINE_WIDTH: 0.532511
G1 X120.031 Y142.763 E.00406
; LINE_WIDTH: 0.495007
G1 X119.932 Y142.737 E.00375
; LINE_WIDTH: 0.420417
G1 X119.834 Y142.712 E.00313
G1 X116.141 Y142.458 E.11386
G1 X115.793 Y142.458 E.0107
G1 X115.793 Y143.415 E.02945
G1 X119.81 Y143.415 E.12355
; LINE_WIDTH: 0.419999
G1 X119.91 Y143.397 E.00312
; LINE_WIDTH: 0.457503
G1 X120.01 Y143.378 E.00344
; LINE_WIDTH: 0.495007
G1 X120.11 Y143.359 E.00375
; LINE_WIDTH: 0.532511
G1 X120.21 Y143.34 E.00406
; LINE_WIDTH: 0.570014
G1 X121.453 Y143.362 E.0534
; LINE_WIDTH: 0.527346
G1 X122.696 Y143.383 E.04908
; LINE_WIDTH: 0.484677
G1 X123.939 Y143.404 E.04475
; LINE_WIDTH: 0.442009
G1 X125.182 Y143.426 E.04043
; LINE_WIDTH: 0.39934
G1 X126.425 Y143.447 E.03611
; LINE_WIDTH: 0.356671
G1 X126.482 Y143.426 E.00155
; LINE_WIDTH: 0.404389
G1 X126.539 Y143.406 E.00179
; LINE_WIDTH: 0.452107
G1 X126.597 Y143.385 E.00203
; LINE_WIDTH: 0.499825
G1 X126.654 Y143.365 E.00226
; LINE_WIDTH: 0.547543
G1 X126.711 Y143.344 E.0025
; LINE_WIDTH: 0.595261
G1 X126.768 Y143.324 E.00274
G1 X130.819 Y143.089 F30000
; LINE_WIDTH: 0.419999
G1 F6195
G1 X116.154 Y142.081 E.45168
G1 X115.416 Y142.081 E.02267
G1 X115.416 Y143.792 E.0526
G1 X130.795 Y143.792 E.47255
G1 X130.895 Y143.774 E.00312
; LINE_WIDTH: 0.457504
G1 X130.995 Y143.755 E.00344
; LINE_WIDTH: 0.495008
G1 X131.095 Y143.736 E.00375
; LINE_WIDTH: 0.532512
G1 X131.195 Y143.717 E.00406
; LINE_WIDTH: 0.570016
G1 X132.609 Y143.742 E.06076
; LINE_WIDTH: 0.521465
G1 X134.024 Y143.766 E.05516
; LINE_WIDTH: 0.472913
G1 X135.438 Y143.79 E.04957
; LINE_WIDTH: 0.409185
G2 X137.014 Y143.814 I1.495 J-45.878 E.04702
G1 X137.025 Y143.493 E.0096
G1 X136.864 Y143.482 E.0048
; LINE_WIDTH: 0.37581
G1 X135.451 Y143.409 E.03837
; LINE_WIDTH: 0.424362
G1 X134.039 Y143.336 E.04397
; LINE_WIDTH: 0.472913
G1 X132.626 Y143.264 E.04957
; LINE_WIDTH: 0.521465
G1 X131.213 Y143.191 E.05516
; LINE_WIDTH: 0.570016
G1 X131.129 Y143.169 E.00372
; LINE_WIDTH: 0.532512
G1 X131.045 Y143.147 E.00346
; LINE_WIDTH: 0.495008
G1 X130.961 Y143.125 E.00319
; LINE_WIDTH: 0.457504
G1 X130.877 Y143.104 E.00293
; CHANGE_LAYER
; Z_HEIGHT: 5.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X130.961 Y143.125 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 29/30
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
G3 Z6 I.882 J-.838 P1  F30000
G1 X114.648 Y125.948 Z6
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6203
G1 X114.648 Y128.152 E.07312
G1 X115.495 Y128.152 E.02812
G1 X140.229 Y129.852 E.8224
G1 X145.648 Y129.852 E.17974
G1 X145.648 Y130.648 E.0264
G1 X114.352 Y130.648 E1.03814
G1 X114.352 Y125.352 E.17567
G1 X145.648 Y125.352 E1.03814
G1 X145.648 Y125.948 E.01977
G1 X114.708 Y125.948 E1.02634
G1 X115.04 Y126.34 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6203
G1 X115.04 Y127.76 E.04363
G1 X115.509 Y127.76 E.01441
G1 X140.243 Y129.46 E.7618
G1 X146.04 Y129.46 E.17813
G1 X146.04 Y131.04 E.04855
G1 X113.96 Y131.04 E.98573
G1 X113.96 Y124.96 E.18682
G1 X146.04 Y124.96 E.98573
G1 X146.04 Y126.34 E.0424
G1 X115.1 Y126.34 E.9507
M204 S10000
G1 X114.556 Y125.65 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F6203
G1 X145.444 Y125.65 E.47513
; WIPE_START
G1 F24000
G1 X143.444 Y125.65 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I-1.116 J.485 P1  F30000
G1 X145.444 Y130.25 Z6.2
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.431684
G1 F6203
G1 X140.209 Y130.25 E.16585
; LINE_WIDTH: 0.432142
G1 X139.511 Y130.226 E.02217
; LINE_WIDTH: 0.475922
G1 X138.812 Y130.202 E.02466
; LINE_WIDTH: 0.519701
G1 X138.114 Y130.178 E.02715
; LINE_WIDTH: 0.56348
G1 X137.415 Y130.154 E.02965
; LINE_WIDTH: 0.60726
G1 X136.717 Y130.13 E.03214
G1 X115.595 Y129.405 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.613588
G1 F6203
G1 X116.292 Y129.429 E.03241
; LINE_WIDTH: 0.564949
G1 X116.988 Y129.453 E.02965
; LINE_WIDTH: 0.51631
G1 X117.685 Y129.477 E.02688
; LINE_WIDTH: 0.467671
G1 X118.381 Y129.501 E.02412
; LINE_WIDTH: 0.419032
G1 X119.078 Y129.524 E.02136
G1 X126.152 Y129.767 F30000
; LINE_WIDTH: 0.642978
G1 F6203
G1 X126.804 Y129.79 E.03189
; LINE_WIDTH: 0.597548
G1 X127.456 Y129.812 E.02947
; LINE_WIDTH: 0.552118
G1 X128.108 Y129.834 E.02706
; LINE_WIDTH: 0.506687
G1 X128.76 Y129.857 E.02465
; LINE_WIDTH: 0.461257
G1 X129.411 Y129.879 E.02223
; LINE_WIDTH: 0.415827
G1 X130.063 Y129.902 E.01982
G1 X126.152 Y129.767 F30000
; LINE_WIDTH: 0.642978
G1 F6203
G1 X126.088 Y129.739 E.00346
; LINE_WIDTH: 0.595261
G1 X126.023 Y129.711 E.00319
; LINE_WIDTH: 0.547543
G1 X125.958 Y129.682 E.00291
; LINE_WIDTH: 0.499825
G1 X125.893 Y129.654 E.00263
; LINE_WIDTH: 0.452107
G1 X125.828 Y129.625 E.00236
; LINE_WIDTH: 0.404389
G1 X125.763 Y129.597 E.00208
; LINE_WIDTH: 0.356671
G1 X124.522 Y129.533 E.03179
; LINE_WIDTH: 0.39934
G1 X123.28 Y129.469 E.03611
; LINE_WIDTH: 0.442009
G1 X122.039 Y129.405 E.04043
; LINE_WIDTH: 0.484677
G1 X120.797 Y129.341 E.04475
; LINE_WIDTH: 0.527346
G1 X119.555 Y129.277 E.04908
; LINE_WIDTH: 0.570014
G1 X119.457 Y129.252 E.00437
; LINE_WIDTH: 0.532511
G1 X119.359 Y129.226 E.00406
; LINE_WIDTH: 0.495007
G1 X119.26 Y129.201 E.00375
; LINE_WIDTH: 0.420417
G1 X119.162 Y129.175 E.00313
G1 X115.469 Y128.921 E.11386
G1 X115.121 Y128.921 E.0107
G1 X115.121 Y129.879 E.02945
M73 P93 R0
G1 X119.138 Y129.879 E.12355
; LINE_WIDTH: 0.419999
G1 X119.238 Y129.86 E.00312
; LINE_WIDTH: 0.457503
G1 X119.338 Y129.841 E.00344
; LINE_WIDTH: 0.495007
G1 X119.437 Y129.823 E.00375
; LINE_WIDTH: 0.532511
G1 X119.537 Y129.804 E.00406
; LINE_WIDTH: 0.570014
G1 X120.78 Y129.825 E.0534
; LINE_WIDTH: 0.527346
G1 X122.024 Y129.846 E.04908
; LINE_WIDTH: 0.484677
G1 X123.267 Y129.868 E.04475
; LINE_WIDTH: 0.442009
G1 X124.51 Y129.889 E.04043
; LINE_WIDTH: 0.39934
G1 X125.753 Y129.91 E.03611
; LINE_WIDTH: 0.356671
G1 X125.81 Y129.89 E.00155
; LINE_WIDTH: 0.404389
G1 X125.867 Y129.869 E.00179
; LINE_WIDTH: 0.452107
G1 X125.924 Y129.849 E.00203
; LINE_WIDTH: 0.499825
G1 X125.982 Y129.828 E.00226
; LINE_WIDTH: 0.547543
G1 X126.039 Y129.808 E.0025
; LINE_WIDTH: 0.595261
G1 X126.096 Y129.788 E.00274
G1 X130.147 Y129.552 F30000
; LINE_WIDTH: 0.419999
G1 F6203
G1 X115.482 Y128.544 E.45168
G1 X114.744 Y128.544 E.02267
G1 X114.744 Y130.256 E.0526
G1 X130.123 Y130.256 E.47255
G1 X130.223 Y130.237 E.00312
; LINE_WIDTH: 0.457504
G1 X130.323 Y130.218 E.00344
; LINE_WIDTH: 0.495008
G1 X130.423 Y130.2 E.00375
; LINE_WIDTH: 0.532512
G1 X130.523 Y130.181 E.00406
; LINE_WIDTH: 0.570016
G1 X131.937 Y130.205 E.06076
; LINE_WIDTH: 0.521465
G1 X133.352 Y130.229 E.05516
; LINE_WIDTH: 0.472913
G1 X134.766 Y130.254 E.04957
; LINE_WIDTH: 0.409185
G2 X136.341 Y130.278 I1.495 J-45.878 E.04702
G1 X136.352 Y129.956 E.0096
G1 X136.192 Y129.945 E.0048
; LINE_WIDTH: 0.37581
G1 X134.779 Y129.873 E.03837
; LINE_WIDTH: 0.424362
G1 X133.366 Y129.8 E.04397
; LINE_WIDTH: 0.472913
G1 X131.954 Y129.727 E.04957
; LINE_WIDTH: 0.521465
G1 X130.541 Y129.654 E.05516
; LINE_WIDTH: 0.570016
G1 X130.457 Y129.633 E.00372
; LINE_WIDTH: 0.532512
G1 X130.373 Y129.611 E.00346
; LINE_WIDTH: 0.495008
G1 X130.289 Y129.589 E.00319
; LINE_WIDTH: 0.457504
G1 X130.205 Y129.567 E.00293
; WIPE_START
G1 F24000
G1 X130.289 Y129.589 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I-.671 J-1.015 P1  F30000
G1 X115.32 Y139.484 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6203
G1 X115.32 Y141.689 E.07312
G1 X116.168 Y141.689 E.02812
G1 X140.902 Y143.389 E.8224
G1 X146.32 Y143.389 E.17974
G1 X146.32 Y144.184 E.0264
G1 X115.024 Y144.184 E1.03814
G1 X115.024 Y138.889 E.17567
G1 X146.32 Y138.889 E1.03814
G1 X146.32 Y139.484 E.01977
G1 X115.38 Y139.484 E1.02634
G1 X115.712 Y139.876 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6203
G1 X115.712 Y141.296 E.04363
G1 X116.181 Y141.296 E.01441
G1 X140.915 Y142.996 E.7618
G1 X146.712 Y142.996 E.17813
G1 X146.712 Y144.576 E.04855
G1 X114.632 Y144.576 E.98573
G1 X114.632 Y138.496 E.18682
G1 X146.712 Y138.496 E.98573
G1 X146.712 Y139.876 E.0424
G1 X115.772 Y139.876 E.9507
M204 S10000
G1 X115.228 Y139.186 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F6203
G1 X146.117 Y139.186 E.47513
; WIPE_START
G1 F24000
G1 X144.117 Y139.186 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I-1.116 J.485 P1  F30000
G1 X146.117 Y143.786 Z6.2
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.431684
G1 F6203
G1 X140.881 Y143.786 E.16585
; LINE_WIDTH: 0.432142
G1 X140.183 Y143.762 E.02217
; LINE_WIDTH: 0.475922
G1 X139.484 Y143.738 E.02466
; LINE_WIDTH: 0.519701
G1 X138.786 Y143.714 E.02715
; LINE_WIDTH: 0.56348
G1 X138.087 Y143.69 E.02965
; LINE_WIDTH: 0.60726
G1 X137.389 Y143.666 E.03214
G1 X116.267 Y142.941 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.613588
G1 F6203
G1 X116.964 Y142.965 E.03241
; LINE_WIDTH: 0.564949
G1 X117.66 Y142.989 E.02965
; LINE_WIDTH: 0.51631
G1 X118.357 Y143.013 E.02688
; LINE_WIDTH: 0.467671
G1 X119.053 Y143.037 E.02412
; LINE_WIDTH: 0.419032
G1 X119.75 Y143.061 E.02136
G1 X126.825 Y143.304 F30000
; LINE_WIDTH: 0.642978
G1 F6203
G1 X127.476 Y143.326 E.03189
; LINE_WIDTH: 0.597548
G1 X128.128 Y143.349 E.02947
; LINE_WIDTH: 0.552118
G1 X128.78 Y143.371 E.02706
; LINE_WIDTH: 0.506687
G1 X129.432 Y143.393 E.02465
; LINE_WIDTH: 0.461257
G1 X130.084 Y143.416 E.02223
; LINE_WIDTH: 0.415827
G1 X130.735 Y143.438 E.01982
G1 X126.825 Y143.304 F30000
; LINE_WIDTH: 0.642978
G1 F6203
G1 X126.76 Y143.275 E.00346
; LINE_WIDTH: 0.595261
G1 X126.695 Y143.247 E.00319
; LINE_WIDTH: 0.547543
G1 X126.63 Y143.219 E.00291
; LINE_WIDTH: 0.499825
G1 X126.565 Y143.19 E.00263
; LINE_WIDTH: 0.452107
G1 X126.501 Y143.162 E.00236
; LINE_WIDTH: 0.404389
G1 X126.436 Y143.134 E.00208
; LINE_WIDTH: 0.356671
G1 X125.194 Y143.07 E.03179
; LINE_WIDTH: 0.39934
G1 X123.952 Y143.006 E.03611
; LINE_WIDTH: 0.442009
G1 X122.711 Y142.942 E.04043
; LINE_WIDTH: 0.484677
G1 X121.469 Y142.878 E.04475
; LINE_WIDTH: 0.527346
G1 X120.228 Y142.814 E.04908
; LINE_WIDTH: 0.570014
G1 X120.129 Y142.788 E.00437
; LINE_WIDTH: 0.532511
G1 X120.031 Y142.763 E.00406
; LINE_WIDTH: 0.495007
G1 X119.932 Y142.737 E.00375
; LINE_WIDTH: 0.420417
G1 X119.834 Y142.712 E.00313
G1 X116.141 Y142.458 E.11386
G1 X115.793 Y142.458 E.0107
G1 X115.793 Y143.415 E.02945
G1 X119.81 Y143.415 E.12355
; LINE_WIDTH: 0.419999
G1 X119.91 Y143.397 E.00312
; LINE_WIDTH: 0.457503
G1 X120.01 Y143.378 E.00344
; LINE_WIDTH: 0.495007
G1 X120.11 Y143.359 E.00375
; LINE_WIDTH: 0.532511
G1 X120.21 Y143.34 E.00406
; LINE_WIDTH: 0.570014
G1 X121.453 Y143.362 E.0534
; LINE_WIDTH: 0.527346
G1 X122.696 Y143.383 E.04908
; LINE_WIDTH: 0.484677
G1 X123.939 Y143.404 E.04475
; LINE_WIDTH: 0.442009
G1 X125.182 Y143.426 E.04043
; LINE_WIDTH: 0.39934
G1 X126.425 Y143.447 E.03611
; LINE_WIDTH: 0.356671
G1 X126.482 Y143.426 E.00155
; LINE_WIDTH: 0.404389
G1 X126.539 Y143.406 E.00179
; LINE_WIDTH: 0.452107
G1 X126.597 Y143.385 E.00203
; LINE_WIDTH: 0.499825
G1 X126.654 Y143.365 E.00226
; LINE_WIDTH: 0.547543
G1 X126.711 Y143.344 E.0025
; LINE_WIDTH: 0.595261
G1 X126.768 Y143.324 E.00274
G1 X130.819 Y143.089 F30000
; LINE_WIDTH: 0.419999
G1 F6203
G1 X116.154 Y142.081 E.45168
G1 X115.416 Y142.081 E.02267
G1 X115.416 Y143.792 E.0526
G1 X130.795 Y143.792 E.47255
G1 X130.895 Y143.774 E.00312
; LINE_WIDTH: 0.457504
G1 X130.995 Y143.755 E.00344
; LINE_WIDTH: 0.495008
G1 X131.095 Y143.736 E.00375
; LINE_WIDTH: 0.532512
G1 X131.195 Y143.717 E.00406
; LINE_WIDTH: 0.570016
G1 X132.609 Y143.742 E.06076
; LINE_WIDTH: 0.521465
G1 X134.024 Y143.766 E.05516
; LINE_WIDTH: 0.472913
G1 X135.438 Y143.79 E.04957
; LINE_WIDTH: 0.409185
G2 X137.014 Y143.814 I1.495 J-45.878 E.04702
G1 X137.025 Y143.493 E.0096
G1 X136.864 Y143.482 E.0048
; LINE_WIDTH: 0.37581
G1 X135.451 Y143.409 E.03837
; LINE_WIDTH: 0.424362
G1 X134.039 Y143.336 E.04397
; LINE_WIDTH: 0.472913
G1 X132.626 Y143.264 E.04957
; LINE_WIDTH: 0.521465
G1 X131.213 Y143.191 E.05516
; LINE_WIDTH: 0.570016
G1 X131.129 Y143.169 E.00372
; LINE_WIDTH: 0.532512
G1 X131.045 Y143.147 E.00346
; LINE_WIDTH: 0.495008
G1 X130.961 Y143.125 E.00319
; LINE_WIDTH: 0.457504
G1 X130.877 Y143.104 E.00293
; CHANGE_LAYER
; Z_HEIGHT: 6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X130.961 Y143.125 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 30/30
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
G3 Z6.2 I.883 J-.837 P1  F30000
G1 X115.04 Y126.34 Z6.2
G1 Z6
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8015
G1 X115.04 Y127.76 E.04363
G1 X115.509 Y127.76 E.01441
G1 X140.243 Y129.46 E.7618
G1 X146.04 Y129.46 E.17813
G1 X146.04 Y131.04 E.04855
G1 X113.96 Y131.04 E.98573
G1 X113.96 Y124.96 E.18682
G1 X146.04 Y124.96 E.98573
G1 X146.04 Y126.34 E.0424
G1 X115.1 Y126.34 E.9507
M204 S10000
; WIPE_START
G1 F24000
G1 X115.04 Y127.76 E-.54008
G1 X115.509 Y127.76 E-.17819
G1 X115.618 Y127.768 E-.04172
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I.08 J1.214 P1  F30000
G1 X145.833 Y125.766 Z6.4
G1 Z6
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
G1 F8015
G1 X145.466 Y126.133 E.01594
G1 X144.932 Y126.133
G1 X145.833 Y125.232 E.03912
G1 X145.364 Y125.167
G1 X144.399 Y126.133 E.04194
G1 X143.866 Y126.133
G1 X144.831 Y125.167 E.04194
G1 X144.298 Y125.167
G1 X143.333 Y126.133 E.04194
G1 X142.799 Y126.133
G1 X143.765 Y125.167 E.04194
G1 X143.231 Y125.167
G1 X142.266 Y126.133 E.04194
G1 X141.733 Y126.133
G1 X142.698 Y125.167 E.04194
G1 X142.165 Y125.167
G1 X141.2 Y126.133 E.04194
G1 X140.666 Y126.133
G1 X141.632 Y125.167 E.04194
G1 X141.098 Y125.167
G1 X140.133 Y126.133 E.04194
G1 X139.6 Y126.133
G1 X140.565 Y125.167 E.04194
G1 X140.032 Y125.167
G1 X139.066 Y126.133 E.04194
G1 X138.533 Y126.133
G1 X139.498 Y125.167 E.04194
G1 X138.965 Y125.167
G1 X138 Y126.133 E.04194
G1 X137.467 Y126.133
G1 X138.432 Y125.167 E.04194
G1 X137.899 Y125.167
G1 X136.933 Y126.133 E.04194
M73 P94 R0
G1 X136.4 Y126.133
G1 X137.365 Y125.167 E.04194
G1 X136.832 Y125.167
G1 X135.867 Y126.133 E.04194
G1 X135.334 Y126.133
G1 X136.299 Y125.167 E.04194
G1 X135.766 Y125.167
G1 X134.8 Y126.133 E.04194
G1 X134.267 Y126.133
G1 X135.232 Y125.167 E.04194
G1 X134.699 Y125.167
G1 X133.734 Y126.133 E.04194
G1 X133.2 Y126.133
G1 X134.166 Y125.167 E.04194
G1 X133.632 Y125.167
G1 X132.667 Y126.133 E.04194
G1 X132.134 Y126.133
G1 X133.099 Y125.167 E.04194
G1 X132.566 Y125.167
G1 X131.601 Y126.133 E.04194
G1 X131.067 Y126.133
G1 X132.033 Y125.167 E.04194
G1 X131.499 Y125.167
G1 X130.534 Y126.133 E.04194
G1 X130.001 Y126.133
G1 X130.966 Y125.167 E.04194
G1 X130.433 Y125.167
G1 X129.468 Y126.133 E.04194
G1 X128.934 Y126.133
G1 X129.9 Y125.167 E.04194
G1 X129.366 Y125.167
G1 X128.401 Y126.133 E.04194
G1 X127.868 Y126.133
G1 X128.833 Y125.167 E.04194
G1 X128.3 Y125.167
G1 X127.335 Y126.133 E.04194
G1 X126.801 Y126.133
G1 X127.766 Y125.167 E.04194
G1 X127.233 Y125.167
G1 X126.268 Y126.133 E.04194
G1 X125.735 Y126.133
G1 X126.7 Y125.167 E.04194
G1 X126.167 Y125.167
G1 X125.201 Y126.133 E.04194
G1 X124.668 Y126.133
G1 X125.633 Y125.167 E.04194
G1 X125.1 Y125.167
G1 X124.135 Y126.133 E.04194
G1 X123.602 Y126.133
G1 X124.567 Y125.167 E.04194
G1 X124.034 Y125.167
G1 X123.068 Y126.133 E.04194
G1 X122.535 Y126.133
G1 X123.5 Y125.167 E.04194
G1 X122.967 Y125.167
G1 X122.002 Y126.133 E.04194
G1 X121.469 Y126.133
G1 X122.434 Y125.167 E.04194
G1 X121.9 Y125.167
G1 X120.935 Y126.133 E.04194
G1 X120.402 Y126.133
G1 X121.367 Y125.167 E.04194
G1 X120.834 Y125.167
G1 X119.869 Y126.133 E.04194
G1 X119.335 Y126.133
G1 X120.301 Y125.167 E.04194
G1 X119.767 Y125.167
G1 X118.802 Y126.133 E.04194
G1 X118.269 Y126.133
G1 X119.234 Y125.167 E.04194
G1 X118.701 Y125.167
G1 X117.736 Y126.133 E.04194
G1 X117.202 Y126.133
G1 X118.168 Y125.167 E.04194
G1 X117.634 Y125.167
G1 X116.669 Y126.133 E.04194
G1 X116.136 Y126.133
G1 X117.101 Y125.167 E.04194
G1 X116.568 Y125.167
G1 X115.603 Y126.133 E.04194
G1 X115.069 Y126.133
G1 X116.035 Y125.167 E.04194
M204 S10000
; WIPE_START
G1 F24000
G1 X115.069 Y126.133 E-.51871
G1 X115.603 Y126.133 E-.20264
G1 X115.674 Y126.061 E-.03865
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I-.195 J1.201 P1  F30000
G1 X145.032 Y130.833 Z6.4
G1 Z6
G1 E.8 F1800
M204 S2000
G1 F8015
G1 X145.833 Y130.032 E.0348
G1 X145.664 Y129.667
G1 X144.499 Y130.833 E.05063
G1 X143.965 Y130.833
G1 X145.131 Y129.667 E.05063
G1 X144.597 Y129.667
G1 X143.432 Y130.833 E.05063
G1 X142.899 Y130.833
G1 X144.064 Y129.667 E.05063
G1 X143.531 Y129.667
G1 X142.366 Y130.833 E.05063
G1 X141.832 Y130.833
G1 X142.997 Y129.667 E.05063
G1 X142.464 Y129.667
G1 X141.299 Y130.833 E.05063
G1 X140.766 Y130.833
G1 X141.931 Y129.667 E.05063
G1 X141.398 Y129.667
G1 X140.232 Y130.833 E.05063
G1 X139.699 Y130.833
G1 X140.864 Y129.667 E.05063
G1 X140.331 Y129.667
G1 X139.166 Y130.833 E.05063
G1 X138.633 Y130.833
G1 X139.826 Y129.639 E.05186
G1 X139.327 Y129.605
G1 X138.099 Y130.833 E.05335
G1 X137.566 Y130.833
G1 X138.828 Y129.571 E.05484
G1 X138.329 Y129.536
G1 X137.033 Y130.833 E.05633
G1 X136.5 Y130.833
G1 X137.83 Y129.502 E.05782
G1 X137.331 Y129.468
G1 X135.966 Y130.833 E.05931
G1 X135.433 Y130.833
G1 X136.832 Y129.433 E.0608
G1 X136.333 Y129.399
G1 X134.9 Y130.833 E.06229
G1 X134.366 Y130.833
G1 X135.834 Y129.365 E.06378
G1 X135.335 Y129.331
G1 X133.833 Y130.833 E.06527
G1 X133.3 Y130.833
G1 X134.836 Y129.296 E.06676
G1 X134.337 Y129.262
G1 X132.767 Y130.833 E.06825
G1 X132.233 Y130.833
G1 X133.838 Y129.228 E.06974
G1 X133.339 Y129.193
G1 X131.7 Y130.833 E.07123
G1 X131.167 Y130.833
G1 X132.84 Y129.159 E.07272
G1 X132.341 Y129.125
G1 X130.634 Y130.833 E.07421
G1 X130.1 Y130.833
G1 X131.842 Y129.091 E.0757
G1 X131.343 Y129.056
G1 X129.567 Y130.833 E.07719
G1 X129.034 Y130.833
G1 X130.844 Y129.022 E.07868
G1 X130.345 Y128.988
G1 X128.5 Y130.833 E.08017
G1 X127.967 Y130.833
G1 X129.847 Y128.953 E.08166
G1 X129.348 Y128.919
G1 X127.434 Y130.833 E.08315
G1 X126.901 Y130.833
G1 X128.849 Y128.885 E.08464
G1 X128.35 Y128.85
G1 X126.367 Y130.833 E.08613
G1 X125.834 Y130.833
G1 X127.851 Y128.816 E.08763
G1 X127.352 Y128.782
G1 X125.301 Y130.833 E.08912
G1 X124.768 Y130.833
G1 X126.853 Y128.748 E.09061
G1 X126.354 Y128.713
G1 X124.234 Y130.833 E.0921
G1 X123.701 Y130.833
G1 X125.855 Y128.679 E.09359
G1 X125.356 Y128.645
G1 X123.168 Y130.833 E.09508
G1 X122.635 Y130.833
G1 X124.857 Y128.61 E.09657
G1 X124.358 Y128.576
G1 X122.101 Y130.833 E.09806
G1 X121.568 Y130.833
G1 X123.859 Y128.542 E.09955
M73 P95 R0
G1 X123.36 Y128.507
G1 X121.035 Y130.833 E.10104
G1 X120.501 Y130.833
G1 X122.861 Y128.473 E.10253
G1 X122.362 Y128.439
G1 X119.968 Y130.833 E.10402
G1 X119.435 Y130.833
G1 X121.863 Y128.405 E.10551
G1 X121.364 Y128.37
G1 X118.902 Y130.833 E.107
G1 X118.368 Y130.833
G1 X120.865 Y128.336 E.10849
G1 X120.366 Y128.302
G1 X117.835 Y130.833 E.10998
G1 X117.302 Y130.833
G1 X119.867 Y128.267 E.11147
G1 X119.368 Y128.233
G1 X116.769 Y130.833 E.11296
G1 X116.235 Y130.833
G1 X118.869 Y128.199 E.11445
G1 X118.37 Y128.165
G1 X115.702 Y130.833 E.11594
G1 X115.169 Y130.833
G1 X117.871 Y128.13 E.11743
G1 X117.372 Y128.096
G1 X114.635 Y130.833 E.11892
G1 X114.167 Y130.767
G1 X116.873 Y128.062 E.11758
G1 X116.374 Y128.027
G1 X114.167 Y130.234 E.0959
G1 X114.167 Y129.701
G1 X115.875 Y127.993 E.07421
G1 X115.368 Y127.967
G1 X114.167 Y129.168 E.05216
G1 X114.167 Y128.634
G1 X114.834 Y127.967 E.02898
G1 X114.833 Y127.436
G1 X114.167 Y128.101 E.02891
G1 X114.167 Y127.568
G1 X114.833 Y126.903 E.02891
G1 X114.833 Y126.369
G1 X114.167 Y127.035 E.02891
G1 X114.167 Y126.501
G1 X115.501 Y125.167 E.05796
G1 X114.968 Y125.167
G1 X114.167 Y125.968 E.03479
M204 S10000
; WIPE_START
G1 F24000
G1 X114.968 Y125.167 E-.43024
G1 X115.501 Y125.167 E-.20264
G1 X115.265 Y125.404 E-.12712
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I-.243 J1.193 P1  F30000
G1 X134.096 Y129.237 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0927667
G1 F8015
G1 X133.847 Y129.237 E.00101
; WIPE_START
G1 F24000
G1 X134.096 Y129.237 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I.082 J-1.214 P1  F30000
G1 X115.026 Y127.949 Z6.4
G1 Z6
G1 E.8 F1800
; LINE_WIDTH: 0.0965082
G1 F8015
G1 X115.05 Y127.978 E.00016
G1 X114.937 Y128.07 E.00064
; WIPE_START
G1 F24000
G1 X115.05 Y127.978 E-.60535
G1 X115.026 Y127.949 E-.15465
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I1.216 J-.044 P1  F30000
G1 X114.956 Y126.019 Z6.4
G1 Z6
G1 E.8 F1800
; LINE_WIDTH: 0.0989424
G1 F8015
G1 X114.719 Y126.256 E.00153
; WIPE_START
G1 F24000
G1 X114.956 Y126.019 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I-1.215 J.066 P1  F30000
G1 X115.712 Y139.876 Z6.4
G1 Z6
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8015
G1 X115.712 Y141.296 E.04363
G1 X116.181 Y141.296 E.01441
G1 X140.915 Y142.996 E.7618
G1 X146.712 Y142.996 E.17813
G1 X146.712 Y144.576 E.04855
G1 X114.632 Y144.576 E.98573
G1 X114.632 Y138.496 E.18682
G1 X146.712 Y138.496 E.98573
G1 X146.712 Y139.876 E.0424
G1 X115.772 Y139.876 E.9507
M204 S10000
; WIPE_START
G1 F24000
G1 X115.712 Y141.296 E-.54008
G1 X116.181 Y141.296 E-.17819
G1 X116.291 Y141.304 E-.04172
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I.08 J1.214 P1  F30000
G1 X146.505 Y139.302 Z6.4
G1 Z6
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
G1 F8015
G1 X146.138 Y139.669 E.01594
G1 X145.605 Y139.669
G1 X146.505 Y138.769 E.03912
G1 X146.037 Y138.704
G1 X145.071 Y139.669 E.04194
G1 X144.538 Y139.669
G1 X145.503 Y138.704 E.04194
G1 X144.97 Y138.704
G1 X144.005 Y139.669 E.04194
G1 X143.472 Y139.669
G1 X144.437 Y138.704 E.04194
G1 X143.904 Y138.704
G1 X142.938 Y139.669 E.04194
G1 X142.405 Y139.669
G1 X143.37 Y138.704 E.04194
G1 X142.837 Y138.704
G1 X141.872 Y139.669 E.04194
G1 X141.338 Y139.669
G1 X142.304 Y138.704 E.04194
G1 X141.77 Y138.704
G1 X140.805 Y139.669 E.04194
G1 X140.272 Y139.669
G1 X141.237 Y138.704 E.04194
G1 X140.704 Y138.704
G1 X139.739 Y139.669 E.04194
G1 X139.205 Y139.669
G1 X140.171 Y138.704 E.04194
G1 X139.637 Y138.704
G1 X138.672 Y139.669 E.04194
G1 X138.139 Y139.669
G1 X139.104 Y138.704 E.04194
G1 X138.571 Y138.704
G1 X137.606 Y139.669 E.04194
G1 X137.072 Y139.669
G1 X138.038 Y138.704 E.04194
G1 X137.504 Y138.704
G1 X136.539 Y139.669 E.04194
G1 X136.006 Y139.669
G1 X136.971 Y138.704 E.04194
G1 X136.438 Y138.704
G1 X135.473 Y139.669 E.04194
G1 X134.939 Y139.669
G1 X135.904 Y138.704 E.04194
G1 X135.371 Y138.704
G1 X134.406 Y139.669 E.04194
G1 X133.873 Y139.669
G1 X134.838 Y138.704 E.04194
G1 X134.305 Y138.704
G1 X133.339 Y139.669 E.04194
G1 X132.806 Y139.669
G1 X133.771 Y138.704 E.04194
G1 X133.238 Y138.704
G1 X132.273 Y139.669 E.04194
G1 X131.74 Y139.669
G1 X132.705 Y138.704 E.04194
G1 X132.172 Y138.704
G1 X131.206 Y139.669 E.04194
G1 X130.673 Y139.669
G1 X131.638 Y138.704 E.04194
M73 P96 R0
G1 X131.105 Y138.704
G1 X130.14 Y139.669 E.04194
G1 X129.607 Y139.669
G1 X130.572 Y138.704 E.04194
G1 X130.038 Y138.704
G1 X129.073 Y139.669 E.04194
G1 X128.54 Y139.669
G1 X129.505 Y138.704 E.04194
G1 X128.972 Y138.704
G1 X128.007 Y139.669 E.04194
G1 X127.473 Y139.669
G1 X128.439 Y138.704 E.04194
G1 X127.905 Y138.704
G1 X126.94 Y139.669 E.04194
G1 X126.407 Y139.669
G1 X127.372 Y138.704 E.04194
G1 X126.839 Y138.704
G1 X125.874 Y139.669 E.04194
G1 X125.34 Y139.669
G1 X126.306 Y138.704 E.04194
G1 X125.772 Y138.704
G1 X124.807 Y139.669 E.04194
G1 X124.274 Y139.669
G1 X125.239 Y138.704 E.04194
G1 X124.706 Y138.704
G1 X123.741 Y139.669 E.04194
G1 X123.207 Y139.669
G1 X124.173 Y138.704 E.04194
G1 X123.639 Y138.704
G1 X122.674 Y139.669 E.04194
G1 X122.141 Y139.669
G1 X123.106 Y138.704 E.04194
G1 X122.573 Y138.704
G1 X121.607 Y139.669 E.04194
G1 X121.074 Y139.669
G1 X122.039 Y138.704 E.04194
G1 X121.506 Y138.704
G1 X120.541 Y139.669 E.04194
G1 X120.008 Y139.669
G1 X120.973 Y138.704 E.04194
G1 X120.44 Y138.704
G1 X119.474 Y139.669 E.04194
G1 X118.941 Y139.669
G1 X119.906 Y138.704 E.04194
G1 X119.373 Y138.704
G1 X118.408 Y139.669 E.04194
G1 X117.875 Y139.669
G1 X118.84 Y138.704 E.04194
G1 X118.307 Y138.704
G1 X117.341 Y139.669 E.04194
G1 X116.808 Y139.669
G1 X117.773 Y138.704 E.04194
G1 X117.24 Y138.704
G1 X116.275 Y139.669 E.04194
G1 X115.742 Y139.669
G1 X116.707 Y138.704 E.04194
M204 S10000
; WIPE_START
G1 F24000
G1 X115.742 Y139.669 E-.51871
G1 X116.275 Y139.669 E-.20264
G1 X116.347 Y139.597 E-.03865
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I-.195 J1.201 P1  F30000
G1 X145.704 Y144.369 Z6.4
G1 Z6
G1 E.8 F1800
M204 S2000
G1 F8015
G1 X146.505 Y143.568 E.0348
G1 X146.336 Y143.204
G1 X145.171 Y144.369 E.05063
G1 X144.638 Y144.369
G1 X145.803 Y143.204 E.05063
G1 X145.269 Y143.204
G1 X144.104 Y144.369 E.05063
G1 X143.571 Y144.369
G1 X144.736 Y143.204 E.05063
G1 X144.203 Y143.204
G1 X143.038 Y144.369 E.05063
G1 X142.504 Y144.369
G1 X143.67 Y143.204 E.05063
G1 X143.136 Y143.204
G1 X141.971 Y144.369 E.05063
G1 X141.438 Y144.369
G1 X142.603 Y143.204 E.05063
G1 X142.07 Y143.204
G1 X140.905 Y144.369 E.05063
G1 X140.371 Y144.369
G1 X141.537 Y143.204 E.05063
G1 X141.003 Y143.204
G1 X139.838 Y144.369 E.05063
G1 X139.305 Y144.369
G1 X140.498 Y143.176 E.05186
G1 X139.999 Y143.141
G1 X138.772 Y144.369 E.05335
G1 X138.238 Y144.369
G1 X139.5 Y143.107 E.05484
G1 X139.001 Y143.073
G1 X137.705 Y144.369 E.05633
G1 X137.172 Y144.369
G1 X138.502 Y143.039 E.05782
G1 X138.003 Y143.004
G1 X136.638 Y144.369 E.05931
G1 X136.105 Y144.369
G1 X137.504 Y142.97 E.0608
G1 X137.005 Y142.936
G1 X135.572 Y144.369 E.06229
G1 X135.039 Y144.369
G1 X136.506 Y142.901 E.06378
G1 X136.007 Y142.867
G1 X134.505 Y144.369 E.06527
G1 X133.972 Y144.369
G1 X135.508 Y142.833 E.06676
G1 X135.009 Y142.798
G1 X133.439 Y144.369 E.06825
G1 X132.906 Y144.369
G1 X134.511 Y142.764 E.06974
G1 X134.012 Y142.73
G1 X132.372 Y144.369 E.07123
G1 X131.839 Y144.369
G1 X133.513 Y142.696 E.07272
G1 X133.014 Y142.661
G1 X131.306 Y144.369 E.07421
G1 X130.773 Y144.369
G1 X132.515 Y142.627 E.0757
G1 X132.016 Y142.593
G1 X130.239 Y144.369 E.07719
G1 X129.706 Y144.369
G1 X131.517 Y142.558 E.07868
G1 X131.018 Y142.524
G1 X129.173 Y144.369 E.08017
G1 X128.639 Y144.369
G1 X130.519 Y142.49 E.08166
G1 X130.02 Y142.456
G1 X128.106 Y144.369 E.08315
G1 X127.573 Y144.369
G1 X129.521 Y142.421 E.08464
G1 X129.022 Y142.387
G1 X127.04 Y144.369 E.08613
G1 X126.506 Y144.369
G1 X128.523 Y142.353 E.08763
G1 X128.024 Y142.318
G1 X125.973 Y144.369 E.08912
G1 X125.44 Y144.369
G1 X127.525 Y142.284 E.09061
G1 X127.026 Y142.25
G1 X124.907 Y144.369 E.0921
G1 X124.373 Y144.369
M73 P97 R0
G1 X126.527 Y142.215 E.09359
G1 X126.028 Y142.181
G1 X123.84 Y144.369 E.09508
G1 X123.307 Y144.369
G1 X125.529 Y142.147 E.09657
G1 X125.03 Y142.113
G1 X122.773 Y144.369 E.09806
G1 X122.24 Y144.369
G1 X124.531 Y142.078 E.09955
G1 X124.032 Y142.044
G1 X121.707 Y144.369 E.10104
G1 X121.174 Y144.369
G1 X123.533 Y142.01 E.10253
G1 X123.034 Y141.975
G1 X120.64 Y144.369 E.10402
G1 X120.107 Y144.369
G1 X122.535 Y141.941 E.10551
G1 X122.036 Y141.907
G1 X119.574 Y144.369 E.107
G1 X119.041 Y144.369
G1 X121.537 Y141.872 E.10849
G1 X121.038 Y141.838
G1 X118.507 Y144.369 E.10998
G1 X117.974 Y144.369
G1 X120.539 Y141.804 E.11147
G1 X120.04 Y141.77
G1 X117.441 Y144.369 E.11296
G1 X116.907 Y144.369
G1 X119.541 Y141.735 E.11445
G1 X119.042 Y141.701
G1 X116.374 Y144.369 E.11594
G1 X115.841 Y144.369
G1 X118.543 Y141.667 E.11743
G1 X118.044 Y141.632
G1 X115.308 Y144.369 E.11892
G1 X114.84 Y144.304
G1 X117.545 Y141.598 E.11758
G1 X117.046 Y141.564
G1 X114.84 Y143.771 E.0959
G1 X114.84 Y143.237
G1 X116.547 Y141.53 E.07421
G1 X116.04 Y141.504
G1 X114.84 Y142.704 E.05216
G1 X114.84 Y142.171
G1 X115.507 Y141.504 E.02898
G1 X115.505 Y140.972
G1 X114.84 Y141.638 E.02891
G1 X114.84 Y141.104
G1 X115.505 Y140.439 E.02891
G1 X115.505 Y139.906
G1 X114.84 Y140.571 E.02891
G1 X114.84 Y140.038
G1 X116.173 Y138.704 E.05796
G1 X115.64 Y138.704
G1 X114.84 Y139.504 E.03479
M204 S10000
; WIPE_START
G1 F24000
G1 X115.64 Y138.704 E-.43024
G1 X116.173 Y138.704 E-.20264
G1 X115.937 Y138.94 E-.12712
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I-.243 J1.193 P1  F30000
G1 X134.768 Y142.773 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0927667
G1 F8015
G1 X134.52 Y142.773 E.00101
; WIPE_START
G1 F24000
G1 X134.768 Y142.773 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I.082 J-1.214 P1  F30000
G1 X115.699 Y141.485 Z6.4
G1 Z6
G1 E.8 F1800
; LINE_WIDTH: 0.0965082
G1 F8015
G1 X115.722 Y141.514 E.00016
G1 X115.609 Y141.606 E.00064
; WIPE_START
G1 F24000
G1 X115.722 Y141.514 E-.60535
G1 X115.699 Y141.485 E-.15465
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I1.216 J-.044 P1  F30000
G1 X115.628 Y139.556 Z6.4
G1 Z6
G1 E.8 F1800
; LINE_WIDTH: 0.0989424
G1 F8015
G1 X115.391 Y139.792 E.00153
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F24000
G1 X115.628 Y139.556 E-.76
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
G1 Z6.5 F900 ; lower z a little
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

    G1 Z106 F600
    G1 Z104

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

