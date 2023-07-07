; HEADER_BLOCK_START
; BambuStudio 01.06.02.04
; model printing time: 3m 23s; total estimated time: 9m 11s
; total layer number: 27
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
M73 P0 R9
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
M73 P47 R4
G1 Y245
G1 Y265 F3000
M620 M
M620 S0A   ; switch material if AMS exist
    M109 S220
    G1 X120 F12000

    G1 X20 Y50 F12000
    G1 Y-3
    T0
M73 P48 R4
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
M73 P51 R4
G1 X76 F15000
M73 P54 R4
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
M73 P55 R4
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
    G29 A X116.508 Y100.968 I25.782 J32.5275
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
M73 P56 R4
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
M73 P56 R3
G1 X18.0 Y1.0 Z0.8 F18000;Move to start position
M109 S220
M73 P57 R3
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
; layer num/total_layer_count: 1/27
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
G1 X123.682 Y99.599 F30000
G1 Z.4
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.5
G1 F1200
G1 X123.956 Y99.584 E.01019
G1 X124.264 Y99.567 E.01149
M73 P58 R3
G1 X124.883 Y99.669 E.02337
G1 X125.466 Y99.901 E.02337
G1 X125.985 Y100.253 E.02337
G1 X126.416 Y100.709 E.02337
G1 X126.74 Y101.246 E.02337
G1 X126.94 Y101.841 E.02337
M73 P59 R3
G1 X127.008 Y102.465 E.02337
G1 X126.94 Y103.088 E.02337
G1 X126.743 Y103.673 E.02296
G1 X126.417 Y104.22 E.02375
G1 X125.985 Y104.676 E.02339
G1 X125.466 Y105.028 E.02337
G1 X124.883 Y105.26 E.02337
G1 X124.264 Y105.362 E.02337
G1 X123.637 Y105.328 E.02337
M73 P60 R3
G1 X123.033 Y105.16 E.02337
G1 X122.478 Y104.866 E.02337
G1 X122 Y104.46 E.02337
G1 X121.62 Y103.96 E.02337
G1 X121.357 Y103.391 E.02337
M73 P61 R3
G1 X121.222 Y102.778 E.02337
G1 X121.222 Y102.151 E.02337
G1 X121.357 Y101.538 E.02337
G1 X121.62 Y100.969 E.02337
G1 X122 Y100.469 E.02337
G1 X122.478 Y100.063 E.02337
G1 X123.033 Y99.769 E.02339
G1 X123.623 Y99.607 E.0228
; WIPE_START
G1 F24000
G1 X123.956 Y99.584 E-.12656
G1 X124.264 Y99.567 E-.11723
G1 X124.883 Y99.669 E-.23841
G1 X125.466 Y99.901 E-.23842
G1 X125.551 Y99.959 E-.03938
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I.841 J-.88 P1  F30000
G1 X124.871 Y99.309 Z.6
G1 Z.2
M73 P62 R3
G1 E.8 F1800
G1 F1200
G1 X125.456 Y99.509 E.02305
G1 X125.991 Y99.818 E.02299
G1 X126.458 Y100.223 E.023
G1 X126.84 Y100.708 E.02301
G1 X127.123 Y101.257 E.02301
G1 X127.297 Y101.85 E.023
M73 P63 R3
G1 X127.355 Y102.465 E.023
G1 X127.297 Y103.079 E.02301
G1 X127.123 Y103.672 E.023
G1 X126.84 Y104.221 E.02301
G1 X126.458 Y104.707 E.023
G1 X125.991 Y105.111 E.02301
G1 X125.456 Y105.42 E.023
G1 X124.872 Y105.622 E.02301
G1 X124.261 Y105.71 E.023
G1 X123.644 Y105.68 E.023
G1 X123.044 Y105.535 E.02301
G1 X122.482 Y105.278 E.02301
G1 X121.979 Y104.92 E.02301
G1 X121.553 Y104.473 E.02301
G1 X121.219 Y103.953 E.02301
G1 X120.989 Y103.38 E.023
G1 X120.872 Y102.773 E.023
G1 X120.872 Y102.156 E.02301
G1 X120.989 Y101.549 E.02301
G1 X121.219 Y100.976 E.02301
G1 X121.553 Y100.456 E.023
G1 X121.979 Y100.009 E.02301
G1 X122.482 Y99.651 E.02301
G1 X123.044 Y99.394 E.02301
G1 X123.644 Y99.249 E.02301
G1 X124.261 Y99.219 E.02301
G1 X124.561 Y99.262 E.01128
G1 X124.812 Y99.299 E.00945
; WIPE_START
G1 F24000
G1 X125.456 Y99.509 E-.25768
G1 X125.991 Y99.818 E-.23454
G1 X126.458 Y100.223 E-.23471
G1 X126.512 Y100.291 E-.03307
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-1.172 J-.328 P1  F30000
G1 X119.568 Y125.134 Z.6
G1 Z.2
G1 E.8 F1800
G1 F1200
G1 X119.841 Y125.119 E.01019
G1 X120.149 Y125.103 E.01149
G1 X120.768 Y125.204 E.02337
G1 X121.351 Y125.437 E.02337
G1 X121.87 Y125.789 E.02337
G1 X122.302 Y126.244 E.02337
G1 X122.625 Y126.782 E.02337
G1 X122.826 Y127.376 E.02337
G1 X122.894 Y128 E.02337
G1 X122.826 Y128.624 E.02337
G1 X122.629 Y129.208 E.02296
G1 X122.302 Y129.756 E.02375
G1 X121.87 Y130.211 E.02339
G1 X121.351 Y130.563 E.02337
G1 X120.768 Y130.796 E.02337
G1 X120.149 Y130.897 E.02337
G1 X119.523 Y130.863 E.02337
G1 X118.918 Y130.695 E.02337
G1 X118.364 Y130.402 E.02337
G1 X117.886 Y129.995 E.02337
G1 X117.506 Y129.496 E.02337
G1 X117.242 Y128.926 E.02337
G1 X117.108 Y128.314 E.02337
G1 X117.108 Y127.686 E.02337
G1 X117.242 Y127.074 E.02337
G1 X117.506 Y126.504 E.02337
G1 X117.886 Y126.005 E.02337
G1 X118.364 Y125.598 E.02337
G1 X118.919 Y125.304 E.02339
G1 X119.509 Y125.143 E.0228
; WIPE_START
G1 F24000
G1 X119.841 Y125.119 E-.12656
G1 X120.149 Y125.103 E-.11723
G1 X120.768 Y125.204 E-.23841
G1 X121.351 Y125.437 E-.23842
G1 X121.437 Y125.495 E-.03938
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I.841 J-.88 P1  F30000
G1 X120.757 Y124.844 Z.6
G1 Z.2
G1 E.8 F1800
G1 F1200
G1 X121.342 Y125.045 E.02305
G1 X121.877 Y125.354 E.02299
G1 X122.343 Y125.758 E.023
G1 X122.725 Y126.244 E.02301
G1 X123.008 Y126.793 E.02301
G1 X123.182 Y127.385 E.023
G1 X123.241 Y128 E.023
G1 X123.182 Y128.615 E.02301
G1 X123.008 Y129.207 E.023
G1 X122.725 Y129.756 E.02301
G1 X122.343 Y130.242 E.023
G1 X121.877 Y130.646 E.02301
G1 X121.342 Y130.955 E.023
G1 X120.758 Y131.157 E.02301
G1 X120.147 Y131.245 E.023
G1 X119.53 Y131.216 E.023
G1 X118.929 Y131.07 E.02301
G1 X118.368 Y130.814 E.02301
G1 X117.865 Y130.455 E.02301
G1 X117.438 Y130.008 E.02301
G1 X117.104 Y129.489 E.02301
G1 X116.875 Y128.915 E.023
G1 X116.758 Y128.309 E.023
G1 X116.758 Y127.691 E.02301
G1 X116.875 Y127.085 E.02301
G1 X117.104 Y126.511 E.02301
G1 X117.438 Y125.992 E.023
G1 X117.865 Y125.545 E.02301
G1 X118.368 Y125.186 E.02301
G1 X118.929 Y124.93 E.02301
G1 X119.53 Y124.784 E.02301
G1 X120.147 Y124.755 E.02301
G1 X120.446 Y124.798 E.01128
G1 X120.698 Y124.834 E.00945
; WIPE_START
G1 F24000
G1 X121.342 Y125.045 E-.25768
G1 X121.877 Y125.354 E-.23454
G1 X122.343 Y125.758 E-.23471
G1 X122.397 Y125.826 E-.03307
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I.353 J1.165 P1  F30000
G1 X138.366 Y120.991 Z.6
G1 Z.2
G1 E.8 F1800
G1 F1200
G1 X138.639 Y120.976 E.01019
G1 X138.947 Y120.96 E.01149
G1 X139.566 Y121.061 E.02337
M73 P64 R3
G1 X140.149 Y121.293 E.02337
G1 X140.668 Y121.645 E.02337
G1 X141.1 Y122.101 E.02337
G1 X141.423 Y122.638 E.02337
G1 X141.624 Y123.233 E.02337
G1 X141.691 Y123.857 E.02337
G1 X141.624 Y124.48 E.02337
G1 X141.427 Y125.065 E.02296
G1 X141.1 Y125.612 E.02375
G1 X140.668 Y126.068 E.02339
G1 X140.149 Y126.42 E.02337
G1 X139.566 Y126.652 E.02337
G1 X138.947 Y126.754 E.02337
G1 X138.321 Y126.72 E.02337
G1 X137.716 Y126.552 E.02337
G1 X137.162 Y126.258 E.02337
G1 X136.683 Y125.852 E.02337
G1 X136.304 Y125.353 E.02337
G1 X136.04 Y124.783 E.02337
G1 X135.905 Y124.17 E.02337
G1 X135.905 Y123.543 E.02337
G1 X136.04 Y122.93 E.02337
G1 X136.304 Y122.361 E.02337
G1 X136.683 Y121.861 E.02337
G1 X137.162 Y121.455 E.02337
G1 X137.716 Y121.161 E.02339
G1 X138.307 Y121 E.0228
; WIPE_START
G1 F24000
G1 X138.639 Y120.976 E-.12656
G1 X138.947 Y120.96 E-.11723
G1 X139.566 Y121.061 E-.23841
G1 X140.149 Y121.293 E-.23842
G1 X140.235 Y121.351 E-.03938
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I.841 J-.88 P1  F30000
G1 X139.554 Y120.701 Z.6
G1 Z.2
G1 E.8 F1800
G1 F1200
G1 X140.14 Y120.902 E.02305
G1 X140.674 Y121.21 E.02299
G1 X141.141 Y121.615 E.023
G1 X141.523 Y122.1 E.02301
G1 X141.806 Y122.649 E.02301
G1 X141.98 Y123.242 E.023
G1 X142.039 Y123.857 E.023
G1 X141.98 Y124.472 E.02301
G1 X141.806 Y125.064 E.023
G1 X141.523 Y125.613 E.02301
G1 X141.141 Y126.099 E.023
G1 X140.674 Y126.503 E.02301
G1 X140.14 Y126.812 E.023
G1 X139.556 Y127.014 E.02301
G1 X138.945 Y127.102 E.023
G1 X138.328 Y127.073 E.023
G1 X137.727 Y126.927 E.02301
G1 X137.166 Y126.67 E.02301
G1 X136.662 Y126.312 E.02301
G1 X136.236 Y125.865 E.02301
G1 X135.902 Y125.345 E.02301
G1 X135.673 Y124.772 E.023
G1 X135.556 Y124.166 E.023
G1 X135.556 Y123.548 E.02301
G1 X135.673 Y122.941 E.02301
G1 X135.902 Y122.368 E.02301
G1 X136.236 Y121.848 E.023
G1 X136.662 Y121.401 E.02301
G1 X137.166 Y121.043 E.02301
G1 X137.727 Y120.787 E.02301
G1 X138.328 Y120.641 E.02301
G1 X138.945 Y120.612 E.02301
G1 X139.244 Y120.655 E.01128
G1 X139.495 Y120.691 E.00945
M106 S255
M106 P2 S178
; CHANGE_LAYER
; Z_HEIGHT: 0.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X140.14 Y120.902 E-.25768
G1 X140.674 Y121.21 E-.23454
G1 X141.141 Y121.615 E-.23471
G1 X141.195 Y121.683 E-.03307
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 2/27
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
G3 Z.6 I.953 J-.756 P1  F30000
G1 X123.7 Y99.638 Z.6
G1 Z.4
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.42
G1 F1200
G1 X124.261 Y99.607 E.01726
G1 X124.872 Y99.708 E.01901
G1 X125.447 Y99.937 E.01901
G1 X125.959 Y100.284 E.01901
G1 X126.384 Y100.733 E.01901
G1 X126.703 Y101.263 E.01901
G1 X126.901 Y101.849 E.01901
G1 X126.968 Y102.465 E.01901
G1 X126.901 Y103.08 E.01901
G1 X126.721 Y103.615 E.01735
G1 X126.384 Y104.196 E.02064
G1 X125.959 Y104.645 E.01901
G1 X125.447 Y104.992 E.01901
G1 X124.872 Y105.221 E.01901
G1 X124.261 Y105.322 E.01901
G1 X123.644 Y105.288 E.01901
G1 X123.047 Y105.123 E.01901
G1 X122.501 Y104.833 E.01901
G1 X122.029 Y104.432 E.01901
G1 X121.655 Y103.94 E.01901
G1 X121.395 Y103.378 E.01901
G1 X121.262 Y102.774 E.01901
G1 X121.262 Y102.155 E.01901
G1 X121.395 Y101.551 E.01901
G1 X121.655 Y100.989 E.01901
G1 X122.029 Y100.497 E.01901
G1 X122.501 Y100.096 E.01901
G1 X123.047 Y99.807 E.01901
G1 X123.642 Y99.652 E.01888
M204 S10000
; WIPE_START
G1 F24000
G1 X124.261 Y99.607 E-.23586
G1 X124.872 Y99.708 E-.23511
G1 X125.447 Y99.937 E-.23511
G1 X125.564 Y100.016 E-.05392
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I.889 J-.831 P1  F30000
G1 X124.863 Y99.265 Z.8
G1 Z.4
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X124.866 Y99.266 E.0001
G1 X125.473 Y99.473 E.0197
G1 X126.014 Y99.785 E.01921
G1 X126.487 Y100.195 E.01921
G1 X126.873 Y100.686 E.01921
G1 X127.16 Y101.242 E.01921
G1 X127.336 Y101.842 E.01921
G1 X127.396 Y102.465 E.01921
G1 X127.336 Y103.087 E.01921
G1 X127.16 Y103.687 E.01921
G1 X126.873 Y104.243 E.01921
G1 X126.487 Y104.734 E.01921
G1 X126.014 Y105.144 E.01921
G1 X125.473 Y105.456 E.01921
G1 X124.882 Y105.661 E.01921
G1 X124.263 Y105.75 E.01921
G1 X123.638 Y105.72 E.01921
G1 X123.031 Y105.573 E.01921
G1 X122.462 Y105.313 E.01921
G1 X121.953 Y104.95 E.01921
G1 X121.521 Y104.498 E.01921
G1 X121.183 Y103.972 E.01921
G1 X120.951 Y103.391 E.01921
G1 X120.832 Y102.777 E.01921
G1 X120.832 Y102.152 E.01921
G1 X120.951 Y101.538 E.01921
G1 X121.183 Y100.957 E.01921
M73 P65 R3
G1 X121.521 Y100.431 E.01921
G1 X121.953 Y99.979 E.01921
G1 X122.462 Y99.616 E.01921
G1 X123.031 Y99.356 E.01921
G1 X123.638 Y99.209 E.01921
G1 X124.263 Y99.179 E.01921
G1 X124.803 Y99.257 E.01677
M204 S10000
; WIPE_START
G1 F24000
G1 X124.866 Y99.266 E-.024
G1 X125.473 Y99.473 E-.24367
G1 X126.014 Y99.785 E-.23761
G1 X126.487 Y100.195 E-.23761
G1 X126.515 Y100.23 E-.01711
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I-1.173 J-.326 P1  F30000
G1 X119.586 Y125.173 Z.8
G1 Z.4
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X120.147 Y125.143 E.01726
G1 X120.758 Y125.243 E.01901
G1 X121.332 Y125.472 E.01901
G1 X121.844 Y125.819 E.01901
G1 X122.27 Y126.268 E.01901
G1 X122.589 Y126.799 E.01901
G1 X122.786 Y127.385 E.01901
G1 X122.853 Y128 E.01901
G1 X122.786 Y128.615 E.01901
G1 X122.606 Y129.15 E.01735
G1 X122.27 Y129.732 E.02064
G1 X121.844 Y130.181 E.01901
G1 X121.332 Y130.528 E.01901
G1 X120.758 Y130.757 E.01901
G1 X120.147 Y130.857 E.01901
G1 X119.529 Y130.824 E.01901
G1 X118.933 Y130.658 E.01901
G1 X118.386 Y130.368 E.01901
G1 X117.915 Y129.968 E.01901
G1 X117.54 Y129.475 E.01901
G1 X117.281 Y128.914 E.01901
G1 X117.148 Y128.309 E.01901
G1 X117.148 Y127.691 E.01901
G1 X117.281 Y127.086 E.01901
G1 X117.54 Y126.525 E.01901
G1 X117.915 Y126.032 E.01901
G1 X118.386 Y125.632 E.01901
G1 X118.933 Y125.342 E.01901
G1 X119.528 Y125.188 E.01888
M204 S10000
; WIPE_START
G1 F24000
G1 X120.147 Y125.143 E-.23586
G1 X120.758 Y125.243 E-.23511
G1 X121.332 Y125.472 E-.23511
G1 X121.45 Y125.552 E-.05392
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I.889 J-.831 P1  F30000
G1 X120.748 Y124.801 Z.8
G1 Z.4
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X120.751 Y124.801 E.0001
G1 X121.358 Y125.008 E.0197
G1 X121.9 Y125.321 E.01921
G1 X122.372 Y125.73 E.01921
G1 X122.759 Y126.222 E.01921
G1 X123.046 Y126.778 E.01921
G1 X123.222 Y127.378 E.01921
G1 X123.281 Y128 E.01921
G1 X123.222 Y128.622 E.01921
G1 X123.046 Y129.222 E.01921
G1 X122.759 Y129.778 E.01921
G1 X122.372 Y130.27 E.01921
G1 X121.9 Y130.679 E.01921
G1 X121.358 Y130.992 E.01921
G1 X120.767 Y131.196 E.01921
G1 X120.149 Y131.285 E.01921
G1 X119.524 Y131.256 E.01921
G1 X118.916 Y131.108 E.01921
G1 X118.348 Y130.848 E.01921
G1 X117.838 Y130.486 E.01921
G1 X117.407 Y130.033 E.01921
G1 X117.069 Y129.507 E.01921
G1 X116.836 Y128.927 E.01921
G1 X116.718 Y128.313 E.01921
G1 X116.718 Y127.687 E.01921
G1 X116.836 Y127.073 E.01921
G1 X117.069 Y126.493 E.01921
G1 X117.407 Y125.967 E.01921
G1 X117.838 Y125.514 E.01921
G1 X118.348 Y125.152 E.01921
G1 X118.916 Y124.892 E.01921
G1 X119.524 Y124.744 E.01921
G1 X120.149 Y124.715 E.01921
G1 X120.689 Y124.792 E.01677
M204 S10000
; WIPE_START
G1 F24000
G1 X120.751 Y124.801 E-.024
G1 X121.358 Y125.008 E-.24367
G1 X121.9 Y125.321 E-.23761
G1 X122.372 Y125.73 E-.23761
G1 X122.4 Y125.766 E-.01711
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I.346 J1.167 P1  F30000
G1 X138.384 Y121.03 Z.8
G1 Z.4
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X138.945 Y121 E.01726
G1 X139.555 Y121.1 E.01901
G1 X140.13 Y121.329 E.01901
G1 X140.642 Y121.676 E.01901
G1 X141.068 Y122.125 E.01901
G1 X141.387 Y122.655 E.01901
G1 X141.584 Y123.242 E.01901
G1 X141.651 Y123.857 E.01901
G1 X141.584 Y124.472 E.01901
G1 X141.404 Y125.007 E.01735
G1 X141.068 Y125.588 E.02064
G1 X140.642 Y126.037 E.01901
G1 X140.13 Y126.385 E.01901
G1 X139.555 Y126.614 E.01901
G1 X138.945 Y126.714 E.01901
G1 X138.327 Y126.68 E.01901
G1 X137.731 Y126.515 E.01901
G1 X137.184 Y126.225 E.01901
G1 X136.713 Y125.824 E.01901
G1 X136.338 Y125.332 E.01901
G1 X136.078 Y124.77 E.01901
G1 X135.945 Y124.166 E.01901
G1 X135.945 Y123.547 E.01901
G1 X136.078 Y122.943 E.01901
G1 X136.338 Y122.382 E.01901
G1 X136.713 Y121.889 E.01901
G1 X137.184 Y121.489 E.01901
G1 X137.731 Y121.199 E.01901
G1 X138.326 Y121.045 E.01888
M204 S10000
; WIPE_START
G1 F24000
G1 X138.945 Y121 E-.23586
G1 X139.555 Y121.1 E-.23511
G1 X140.13 Y121.329 E-.23511
G1 X140.248 Y121.408 E-.05392
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I.889 J-.831 P1  F30000
G1 X139.546 Y120.658 Z.8
G1 Z.4
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X139.549 Y120.658 E.0001
G1 X140.156 Y120.865 E.0197
G1 X140.698 Y121.178 E.01921
G1 X141.17 Y121.587 E.01921
G1 X141.557 Y122.079 E.01921
G1 X141.843 Y122.634 E.01921
G1 X142.02 Y123.234 E.01921
G1 X142.079 Y123.857 E.01921
G1 X142.02 Y124.479 E.01921
G1 X141.843 Y125.079 E.01921
G1 X141.557 Y125.635 E.01921
G1 X141.17 Y126.126 E.01921
G1 X140.698 Y126.536 E.01921
G1 X140.156 Y126.849 E.01921
G1 X139.565 Y127.053 E.01921
G1 X138.946 Y127.142 E.01921
G1 X138.322 Y127.112 E.01921
G1 X137.714 Y126.965 E.01921
G1 X137.145 Y126.705 E.01921
G1 X136.636 Y126.342 E.01921
G1 X136.205 Y125.89 E.01921
G1 X135.867 Y125.364 E.01921
G1 X135.634 Y124.783 E.01921
G1 X135.516 Y124.169 E.01921
G1 X135.516 Y123.544 E.01921
G1 X135.634 Y122.93 E.01921
G1 X135.867 Y122.35 E.01921
G1 X136.205 Y121.824 E.01921
G1 X136.636 Y121.371 E.01921
G1 X137.145 Y121.008 E.01921
G1 X137.714 Y120.749 E.01921
G1 X138.322 Y120.601 E.01921
G1 X138.946 Y120.571 E.01921
G1 X139.487 Y120.649 E.01677
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 0.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X139.549 Y120.658 E-.024
G1 X140.156 Y120.865 E-.24367
G1 X140.698 Y121.178 E-.23761
G1 X141.17 Y121.587 E-.23761
G1 X141.198 Y121.622 E-.01711
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 3/27
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
G3 Z.8 I.953 J-.757 P1  F30000
G1 X123.717 Y99.637 Z.8
G1 Z.6
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X123.718 Y99.637 E.00004
G1 X124.261 Y99.607 E.01671
G1 X124.872 Y99.708 E.01901
G1 X125.447 Y99.937 E.01901
G1 X125.959 Y100.284 E.01901
G1 X126.384 Y100.733 E.01901
G1 X126.703 Y101.263 E.01901
G1 X126.901 Y101.849 E.01901
G1 X126.968 Y102.465 E.01901
G1 X126.901 Y103.08 E.01901
M73 P66 R3
G1 X126.703 Y103.666 E.01901
G1 X126.384 Y104.196 E.01901
G1 X125.959 Y104.645 E.01901
G1 X125.447 Y104.992 E.01901
G1 X124.872 Y105.221 E.01901
G1 X124.261 Y105.322 E.01901
G1 X123.644 Y105.288 E.01901
G1 X123.047 Y105.123 E.01901
G1 X122.501 Y104.833 E.01901
G1 X122.029 Y104.432 E.01901
G1 X121.655 Y103.94 E.01901
G1 X121.395 Y103.378 E.01901
G1 X121.262 Y102.774 E.01901
G1 X121.262 Y102.155 E.01901
G1 X121.395 Y101.551 E.01901
G1 X121.655 Y100.989 E.01901
G1 X122.029 Y100.497 E.01901
G1 X122.501 Y100.096 E.01901
G1 X123.047 Y99.807 E.01901
G1 X123.644 Y99.641 E.01901
G1 X123.657 Y99.64 E.00042
M204 S10000
; WIPE_START
G1 F24000
G1 X123.718 Y99.637 E-.02324
G1 X124.261 Y99.607 E-.20663
G1 X124.872 Y99.708 E-.23511
G1 X125.447 Y99.937 E-.23511
G1 X125.577 Y100.025 E-.0599
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I.875 J-.846 P1  F30000
G1 X124.84 Y99.262 Z1
G1 Z.6
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X124.842 Y99.262 E.00006
G1 X125.473 Y99.473 E.02043
G1 X126.014 Y99.785 E.01921
G1 X126.487 Y100.195 E.01921
G1 X126.873 Y100.686 E.01921
G1 X127.16 Y101.242 E.01921
G1 X127.336 Y101.842 E.01921
G1 X127.396 Y102.465 E.01921
G1 X127.336 Y103.087 E.01921
G1 X127.16 Y103.687 E.01921
G1 X126.873 Y104.243 E.01921
G1 X126.487 Y104.734 E.01921
G1 X126.014 Y105.144 E.01921
G1 X125.473 Y105.456 E.01921
G1 X124.882 Y105.661 E.01921
G1 X124.263 Y105.75 E.01921
G1 X123.638 Y105.72 E.01921
G1 X123.031 Y105.573 E.01921
G1 X122.462 Y105.313 E.01921
G1 X121.953 Y104.95 E.01921
G1 X121.521 Y104.498 E.01921
G1 X121.183 Y103.972 E.01921
G1 X120.951 Y103.391 E.01921
G1 X120.832 Y102.777 E.01921
G1 X120.832 Y102.152 E.01921
G1 X120.951 Y101.538 E.01921
G1 X121.183 Y100.957 E.01921
G1 X121.521 Y100.431 E.01921
G1 X121.953 Y99.979 E.01921
G1 X122.462 Y99.616 E.01921
G1 X123.031 Y99.356 E.01921
G1 X123.638 Y99.209 E.01921
G1 X124.263 Y99.179 E.01921
G1 X124.781 Y99.254 E.01607
M204 S10000
; WIPE_START
G1 F24000
G1 X124.842 Y99.262 E-.02349
G1 X125.473 Y99.473 E-.25272
G1 X126.014 Y99.785 E-.23761
G1 X126.487 Y100.195 E-.23761
G1 X126.501 Y100.213 E-.00858
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I-1.173 J-.324 P1  F30000
G1 X119.603 Y125.172 Z1
G1 Z.6
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X119.604 Y125.172 E.00004
G1 X120.147 Y125.143 E.01671
G1 X120.758 Y125.243 E.01901
G1 X121.332 Y125.472 E.01901
G1 X121.844 Y125.819 E.01901
G1 X122.27 Y126.268 E.01901
G1 X122.589 Y126.799 E.01901
G1 X122.786 Y127.385 E.01901
G1 X122.853 Y128 E.01901
G1 X122.786 Y128.615 E.01901
G1 X122.589 Y129.201 E.01901
G1 X122.27 Y129.732 E.01901
G1 X121.844 Y130.181 E.01901
G1 X121.332 Y130.528 E.01901
G1 X120.758 Y130.757 E.01901
G1 X120.147 Y130.857 E.01901
G1 X119.529 Y130.824 E.01901
G1 X118.933 Y130.658 E.01901
G1 X118.386 Y130.368 E.01901
G1 X117.915 Y129.968 E.01901
G1 X117.54 Y129.475 E.01901
G1 X117.281 Y128.914 E.01901
G1 X117.148 Y128.309 E.01901
G1 X117.148 Y127.691 E.01901
G1 X117.281 Y127.086 E.01901
G1 X117.54 Y126.525 E.01901
G1 X117.915 Y126.032 E.01901
G1 X118.386 Y125.632 E.01901
G1 X118.933 Y125.342 E.01901
G1 X119.529 Y125.176 E.01901
G1 X119.543 Y125.176 E.00042
M204 S10000
; WIPE_START
G1 F24000
G1 X119.604 Y125.172 E-.02324
G1 X120.147 Y125.143 E-.20663
G1 X120.758 Y125.243 E-.23511
G1 X121.332 Y125.472 E-.23511
G1 X121.463 Y125.561 E-.0599
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I.875 J-.846 P1  F30000
G1 X120.726 Y124.798 Z1
G1 Z.6
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X120.727 Y124.798 E.00006
G1 X121.358 Y125.008 E.02043
G1 X121.9 Y125.321 E.01921
G1 X122.372 Y125.73 E.01921
G1 X122.759 Y126.222 E.01921
G1 X123.046 Y126.778 E.01921
G1 X123.222 Y127.378 E.01921
G1 X123.281 Y128 E.01921
G1 X123.222 Y128.622 E.01921
G1 X123.046 Y129.222 E.01921
G1 X122.759 Y129.778 E.01921
G1 X122.372 Y130.27 E.01921
G1 X121.9 Y130.679 E.01921
G1 X121.358 Y130.992 E.01921
G1 X120.767 Y131.196 E.01921
G1 X120.149 Y131.285 E.01921
G1 X119.524 Y131.256 E.01921
G1 X118.916 Y131.108 E.01921
G1 X118.348 Y130.848 E.01921
G1 X117.838 Y130.486 E.01921
G1 X117.407 Y130.033 E.01921
G1 X117.069 Y129.507 E.01921
G1 X116.836 Y128.927 E.01921
G1 X116.718 Y128.313 E.01921
G1 X116.718 Y127.687 E.01921
G1 X116.836 Y127.073 E.01921
G1 X117.069 Y126.493 E.01921
G1 X117.407 Y125.967 E.01921
G1 X117.838 Y125.514 E.01921
G1 X118.348 Y125.152 E.01921
G1 X118.916 Y124.892 E.01921
G1 X119.524 Y124.744 E.01921
G1 X120.149 Y124.715 E.01921
G1 X120.666 Y124.789 E.01607
M204 S10000
; WIPE_START
G1 F24000
G1 X120.727 Y124.798 E-.02349
G1 X121.358 Y125.008 E-.25272
G1 X121.9 Y125.321 E-.23761
G1 X122.372 Y125.73 E-.23761
G1 X122.386 Y125.748 E-.00858
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I.344 J1.167 P1  F30000
G1 X138.401 Y121.029 Z1
G1 Z.6
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X138.402 Y121.029 E.00004
G1 X138.945 Y121 E.01671
G1 X139.555 Y121.1 E.01901
G1 X140.13 Y121.329 E.01901
G1 X140.642 Y121.676 E.01901
G1 X141.068 Y122.125 E.01901
G1 X141.387 Y122.655 E.01901
G1 X141.584 Y123.242 E.01901
G1 X141.651 Y123.857 E.01901
G1 X141.584 Y124.472 E.01901
G1 X141.387 Y125.058 E.01901
G1 X141.068 Y125.588 E.01901
G1 X140.642 Y126.037 E.01901
G1 X140.13 Y126.385 E.01901
G1 X139.555 Y126.614 E.01901
G1 X138.945 Y126.714 E.01901
G1 X138.327 Y126.68 E.01901
G1 X137.731 Y126.515 E.01901
G1 X137.184 Y126.225 E.01901
G1 X136.713 Y125.824 E.01901
G1 X136.338 Y125.332 E.01901
G1 X136.078 Y124.77 E.01901
G1 X135.945 Y124.166 E.01901
G1 X135.945 Y123.547 E.01901
G1 X136.078 Y122.943 E.01901
G1 X136.338 Y122.382 E.01901
G1 X136.713 Y121.889 E.01901
G1 X137.184 Y121.489 E.01901
G1 X137.731 Y121.199 E.01901
G1 X138.327 Y121.033 E.01901
G1 X138.341 Y121.032 E.00042
M204 S10000
; WIPE_START
G1 F24000
G1 X138.402 Y121.029 E-.02324
M73 P67 R3
G1 X138.945 Y121 E-.20663
G1 X139.555 Y121.1 E-.23511
G1 X140.13 Y121.329 E-.23511
G1 X140.261 Y121.417 E-.0599
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I.875 J-.846 P1  F30000
G1 X139.524 Y120.654 Z1
G1 Z.6
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X139.525 Y120.655 E.00006
G1 X140.156 Y120.865 E.02043
G1 X140.698 Y121.178 E.01921
G1 X141.17 Y121.587 E.01921
G1 X141.557 Y122.079 E.01921
G1 X141.843 Y122.634 E.01921
G1 X142.02 Y123.234 E.01921
G1 X142.079 Y123.857 E.01921
G1 X142.02 Y124.479 E.01921
G1 X141.843 Y125.079 E.01921
G1 X141.557 Y125.635 E.01921
G1 X141.17 Y126.126 E.01921
G1 X140.698 Y126.536 E.01921
G1 X140.156 Y126.849 E.01921
G1 X139.565 Y127.053 E.01921
G1 X138.946 Y127.142 E.01921
G1 X138.322 Y127.112 E.01921
G1 X137.714 Y126.965 E.01921
G1 X137.145 Y126.705 E.01921
G1 X136.636 Y126.342 E.01921
G1 X136.205 Y125.89 E.01921
G1 X135.867 Y125.364 E.01921
G1 X135.634 Y124.783 E.01921
G1 X135.516 Y124.169 E.01921
G1 X135.516 Y123.544 E.01921
G1 X135.634 Y122.93 E.01921
G1 X135.867 Y122.35 E.01921
G1 X136.205 Y121.824 E.01921
G1 X136.636 Y121.371 E.01921
G1 X137.145 Y121.008 E.01921
G1 X137.714 Y120.749 E.01921
G1 X138.322 Y120.601 E.01921
G1 X138.946 Y120.571 E.01921
G1 X139.464 Y120.646 E.01607
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 0.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X139.525 Y120.655 E-.02349
G1 X140.156 Y120.865 E-.25272
G1 X140.698 Y121.178 E-.23761
G1 X141.17 Y121.587 E-.23761
G1 X141.184 Y121.605 E-.00858
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 4/27
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
G3 Z1 I.953 J-.757 P1  F30000
G1 X123.735 Y99.636 Z1
G1 Z.8
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X123.739 Y99.636 E.00013
G1 X124.261 Y99.607 E.01607
G1 X124.872 Y99.708 E.01901
G1 X125.447 Y99.937 E.01901
G1 X125.959 Y100.284 E.01901
G1 X126.384 Y100.733 E.01901
G1 X126.703 Y101.263 E.01901
G1 X126.901 Y101.849 E.01901
G1 X126.968 Y102.465 E.01901
G1 X126.901 Y103.08 E.01901
G1 X126.703 Y103.666 E.01901
G1 X126.384 Y104.196 E.01901
G1 X125.959 Y104.645 E.01901
G1 X125.447 Y104.992 E.01901
G1 X124.872 Y105.221 E.01901
G1 X124.261 Y105.322 E.01901
G1 X123.644 Y105.288 E.01901
G1 X123.047 Y105.123 E.01901
G1 X122.501 Y104.833 E.01901
G1 X122.029 Y104.432 E.01901
G1 X121.655 Y103.94 E.01901
G1 X121.395 Y103.378 E.01901
G1 X121.262 Y102.774 E.01901
G1 X121.262 Y102.155 E.01901
G1 X121.395 Y101.551 E.01901
G1 X121.655 Y100.989 E.01901
G1 X122.029 Y100.497 E.01901
G1 X122.501 Y100.096 E.01901
G1 X123.047 Y99.807 E.01901
G1 X123.644 Y99.641 E.01901
G1 X123.675 Y99.639 E.00097
M204 S10000
; WIPE_START
G1 F24000
G1 X123.739 Y99.636 E-.02442
G1 X124.261 Y99.607 E-.19872
G1 X124.872 Y99.708 E-.23511
G1 X125.447 Y99.937 E-.23511
G1 X125.592 Y100.035 E-.06665
; WIPE_END
M73 P67 R2
G1 E-.04 F1800
G17
G3 Z1.2 I.861 J-.86 P1  F30000
G1 X124.816 Y99.259 Z1.2
G1 Z.8
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X124.818 Y99.259 E.00005
G1 X125.473 Y99.473 E.02117
G1 X126.014 Y99.785 E.01921
G1 X126.487 Y100.195 E.01921
G1 X126.873 Y100.686 E.01921
G1 X127.16 Y101.242 E.01921
G1 X127.336 Y101.842 E.01921
G1 X127.396 Y102.465 E.01921
G1 X127.336 Y103.087 E.01921
G1 X127.16 Y103.687 E.01921
G1 X126.873 Y104.243 E.01921
G1 X126.487 Y104.734 E.01921
G1 X126.014 Y105.144 E.01921
G1 X125.473 Y105.456 E.01921
G1 X124.882 Y105.661 E.01921
G1 X124.263 Y105.75 E.01921
G1 X123.638 Y105.72 E.01921
G1 X123.031 Y105.573 E.01921
G1 X122.462 Y105.313 E.01921
G1 X121.953 Y104.95 E.01921
G1 X121.521 Y104.498 E.01921
G1 X121.183 Y103.972 E.01921
G1 X120.951 Y103.391 E.01921
G1 X120.832 Y102.777 E.01921
G1 X120.832 Y102.152 E.01921
G1 X120.951 Y101.538 E.01921
G1 X121.183 Y100.957 E.01921
G1 X121.521 Y100.431 E.01921
G1 X121.953 Y99.979 E.01921
G1 X122.462 Y99.616 E.01921
G1 X123.031 Y99.356 E.01921
G1 X123.638 Y99.209 E.01921
G1 X124.263 Y99.179 E.01921
G1 X124.757 Y99.25 E.01533
M204 S10000
; WIPE_START
G1 F24000
G1 X124.818 Y99.259 E-.02348
G1 X125.473 Y99.473 E-.26177
G1 X126.014 Y99.785 E-.23761
G1 X126.486 Y100.194 E-.23714
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I-1.173 J-.323 P1  F30000
G1 X119.621 Y125.172 Z1.2
G1 Z.8
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X119.625 Y125.171 E.00013
G1 X120.147 Y125.143 E.01607
G1 X120.758 Y125.243 E.01901
G1 X121.332 Y125.472 E.01901
G1 X121.844 Y125.819 E.01901
G1 X122.27 Y126.268 E.01901
G1 X122.589 Y126.799 E.01901
G1 X122.786 Y127.385 E.01901
G1 X122.853 Y128 E.01901
G1 X122.786 Y128.615 E.01901
G1 X122.589 Y129.201 E.01901
G1 X122.27 Y129.732 E.01901
G1 X121.844 Y130.181 E.01901
G1 X121.332 Y130.528 E.01901
G1 X120.758 Y130.757 E.01901
G1 X120.147 Y130.857 E.01901
G1 X119.529 Y130.824 E.01901
G1 X118.933 Y130.658 E.01901
G1 X118.386 Y130.368 E.01901
G1 X117.915 Y129.968 E.01901
G1 X117.54 Y129.475 E.01901
G1 X117.281 Y128.914 E.01901
G1 X117.148 Y128.309 E.01901
G1 X117.148 Y127.691 E.01901
G1 X117.281 Y127.086 E.01901
G1 X117.54 Y126.525 E.01901
G1 X117.915 Y126.032 E.01901
G1 X118.386 Y125.632 E.01901
G1 X118.933 Y125.342 E.01901
G1 X119.529 Y125.176 E.01901
G1 X119.561 Y125.175 E.00097
M204 S10000
; WIPE_START
G1 F24000
G1 X119.625 Y125.171 E-.02442
G1 X120.147 Y125.143 E-.19872
G1 X120.758 Y125.243 E-.23511
G1 X121.332 Y125.472 E-.23511
G1 X121.477 Y125.57 E-.06665
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I.861 J-.86 P1  F30000
G1 X120.702 Y124.794 Z1.2
G1 Z.8
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X120.704 Y124.794 E.00005
G1 X121.358 Y125.008 E.02117
G1 X121.9 Y125.321 E.01921
G1 X122.372 Y125.73 E.01921
G1 X122.759 Y126.222 E.01921
G1 X123.046 Y126.778 E.01921
G1 X123.222 Y127.378 E.01921
G1 X123.281 Y128 E.01921
G1 X123.222 Y128.622 E.01921
G1 X123.046 Y129.222 E.01921
G1 X122.759 Y129.778 E.01921
G1 X122.372 Y130.27 E.01921
G1 X121.9 Y130.679 E.01921
G1 X121.358 Y130.992 E.01921
G1 X120.767 Y131.196 E.01921
G1 X120.149 Y131.285 E.01921
G1 X119.524 Y131.256 E.01921
G1 X118.916 Y131.108 E.01921
M73 P68 R2
G1 X118.348 Y130.848 E.01921
G1 X117.838 Y130.486 E.01921
G1 X117.407 Y130.033 E.01921
G1 X117.069 Y129.507 E.01921
G1 X116.836 Y128.927 E.01921
G1 X116.718 Y128.313 E.01921
G1 X116.718 Y127.687 E.01921
G1 X116.836 Y127.073 E.01921
G1 X117.069 Y126.493 E.01921
G1 X117.407 Y125.967 E.01921
G1 X117.838 Y125.514 E.01921
G1 X118.348 Y125.152 E.01921
G1 X118.916 Y124.892 E.01921
G1 X119.524 Y124.744 E.01921
G1 X120.149 Y124.715 E.01921
G1 X120.642 Y124.786 E.01533
M204 S10000
; WIPE_START
G1 F24000
G1 X120.704 Y124.794 E-.02348
G1 X121.358 Y125.008 E-.26177
G1 X121.9 Y125.321 E-.23761
G1 X122.372 Y125.729 E-.23714
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I.342 J1.168 P1  F30000
G1 X138.418 Y121.028 Z1.2
G1 Z.8
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X138.423 Y121.028 E.00013
G1 X138.945 Y121 E.01607
G1 X139.555 Y121.1 E.01901
G1 X140.13 Y121.329 E.01901
G1 X140.642 Y121.676 E.01901
G1 X141.068 Y122.125 E.01901
G1 X141.387 Y122.655 E.01901
G1 X141.584 Y123.242 E.01901
G1 X141.651 Y123.857 E.01901
G1 X141.584 Y124.472 E.01901
G1 X141.387 Y125.058 E.01901
G1 X141.068 Y125.588 E.01901
G1 X140.642 Y126.037 E.01901
G1 X140.13 Y126.385 E.01901
G1 X139.555 Y126.614 E.01901
G1 X138.945 Y126.714 E.01901
G1 X138.327 Y126.68 E.01901
G1 X137.731 Y126.515 E.01901
G1 X137.184 Y126.225 E.01901
G1 X136.713 Y125.824 E.01901
G1 X136.338 Y125.332 E.01901
G1 X136.078 Y124.77 E.01901
G1 X135.945 Y124.166 E.01901
G1 X135.945 Y123.547 E.01901
G1 X136.078 Y122.943 E.01901
G1 X136.338 Y122.382 E.01901
G1 X136.713 Y121.889 E.01901
G1 X137.184 Y121.489 E.01901
G1 X137.731 Y121.199 E.01901
G1 X138.327 Y121.033 E.01901
G1 X138.359 Y121.032 E.00097
M204 S10000
; WIPE_START
G1 F24000
G1 X138.423 Y121.028 E-.02442
G1 X138.945 Y121 E-.19872
G1 X139.555 Y121.1 E-.23511
G1 X140.13 Y121.329 E-.23511
G1 X140.275 Y121.427 E-.06665
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I.861 J-.86 P1  F30000
G1 X139.5 Y120.651 Z1.2
G1 Z.8
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X139.501 Y120.651 E.00005
G1 X140.156 Y120.865 E.02117
G1 X140.698 Y121.178 E.01921
G1 X141.17 Y121.587 E.01921
G1 X141.557 Y122.079 E.01921
G1 X141.843 Y122.634 E.01921
G1 X142.02 Y123.234 E.01921
G1 X142.079 Y123.857 E.01921
G1 X142.02 Y124.479 E.01921
G1 X141.843 Y125.079 E.01921
G1 X141.557 Y125.635 E.01921
G1 X141.17 Y126.126 E.01921
G1 X140.698 Y126.536 E.01921
G1 X140.156 Y126.849 E.01921
G1 X139.565 Y127.053 E.01921
G1 X138.946 Y127.142 E.01921
G1 X138.322 Y127.112 E.01921
G1 X137.714 Y126.965 E.01921
G1 X137.145 Y126.705 E.01921
G1 X136.636 Y126.342 E.01921
G1 X136.205 Y125.89 E.01921
G1 X135.867 Y125.364 E.01921
G1 X135.634 Y124.783 E.01921
G1 X135.516 Y124.169 E.01921
G1 X135.516 Y123.544 E.01921
G1 X135.634 Y122.93 E.01921
G1 X135.867 Y122.35 E.01921
G1 X136.205 Y121.824 E.01921
G1 X136.636 Y121.371 E.01921
G1 X137.145 Y121.008 E.01921
G1 X137.714 Y120.749 E.01921
G1 X138.322 Y120.601 E.01921
G1 X138.946 Y120.571 E.01921
G1 X139.44 Y120.642 E.01533
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X139.501 Y120.651 E-.02348
G1 X140.156 Y120.865 E-.26177
G1 X140.698 Y121.178 E-.23761
G1 X141.169 Y121.586 E-.23714
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 5/27
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
G3 Z1.2 I.953 J-.756 P1  F30000
G1 X123.754 Y99.635 Z1.2
G1 Z1
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X123.76 Y99.635 E.0002
G1 X124.261 Y99.607 E.01543
G1 X124.872 Y99.708 E.01901
G1 X125.447 Y99.937 E.01901
G1 X125.959 Y100.284 E.01901
G1 X126.384 Y100.733 E.01901
G1 X126.703 Y101.263 E.01901
G1 X126.901 Y101.849 E.01901
G1 X126.968 Y102.465 E.01901
G1 X126.901 Y103.08 E.01901
G1 X126.703 Y103.666 E.01901
G1 X126.384 Y104.196 E.01901
G1 X125.959 Y104.645 E.01901
G1 X125.447 Y104.992 E.01901
G1 X124.872 Y105.221 E.01901
G1 X124.261 Y105.322 E.01901
G1 X123.644 Y105.288 E.01901
G1 X123.047 Y105.123 E.01901
G1 X122.501 Y104.833 E.01901
G1 X122.029 Y104.432 E.01901
G1 X121.655 Y103.94 E.01901
G1 X121.395 Y103.378 E.01901
G1 X121.262 Y102.774 E.01901
G1 X121.262 Y102.155 E.01901
G1 X121.395 Y101.551 E.01901
G1 X121.655 Y100.989 E.01901
G1 X122.029 Y100.497 E.01901
G1 X122.501 Y100.096 E.01901
G1 X123.047 Y99.807 E.01901
G1 X123.644 Y99.641 E.01901
G1 X123.694 Y99.638 E.00154
M204 S10000
; WIPE_START
G1 F24000
G1 X123.76 Y99.635 E-.02526
G1 X124.261 Y99.607 E-.1908
G1 X124.872 Y99.708 E-.23511
G1 X125.447 Y99.937 E-.23511
G1 X125.607 Y100.045 E-.07372
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I.847 J-.874 P1  F30000
G1 X124.791 Y99.255 Z1.4
G1 Z1
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X124.794 Y99.256 E.00009
G1 X124.882 Y99.268 E.00273
G1 X125.473 Y99.473 E.01921
G1 X126.014 Y99.785 E.01921
G1 X126.487 Y100.195 E.01921
G1 X126.873 Y100.686 E.01921
G1 X127.16 Y101.242 E.01921
G1 X127.336 Y101.842 E.01921
G1 X127.396 Y102.465 E.01921
G1 X127.336 Y103.087 E.01921
G1 X127.16 Y103.687 E.01921
G1 X126.873 Y104.243 E.01921
G1 X126.487 Y104.734 E.01921
G1 X126.014 Y105.144 E.01921
G1 X125.473 Y105.456 E.01921
G1 X124.882 Y105.661 E.01921
G1 X124.263 Y105.75 E.01921
G1 X123.638 Y105.72 E.01921
G1 X123.031 Y105.573 E.01921
G1 X122.462 Y105.313 E.01921
G1 X121.953 Y104.95 E.01921
G1 X121.521 Y104.498 E.01921
G1 X121.183 Y103.972 E.01921
G1 X120.951 Y103.391 E.01921
G1 X120.832 Y102.777 E.01921
G1 X120.832 Y102.152 E.01921
G1 X120.951 Y101.538 E.01921
G1 X121.183 Y100.957 E.01921
G1 X121.521 Y100.431 E.01921
G1 X121.953 Y99.979 E.01921
G1 X122.462 Y99.616 E.01921
G1 X123.031 Y99.356 E.01921
G1 X123.638 Y99.209 E.01921
G1 X124.263 Y99.179 E.01921
G1 X124.732 Y99.247 E.01455
M204 S10000
; WIPE_START
G1 F24000
G1 X124.794 Y99.256 E-.02394
G1 X124.882 Y99.268 E-.03376
G1 X125.473 Y99.473 E-.23761
G1 X126.014 Y99.785 E-.23761
G1 X126.466 Y100.177 E-.22709
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I-1.174 J-.321 P1  F30000
G1 X119.639 Y125.17 Z1.4
G1 Z1
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X119.646 Y125.17 E.0002
M73 P69 R2
G1 X120.147 Y125.143 E.01543
G1 X120.758 Y125.243 E.01901
G1 X121.332 Y125.472 E.01901
G1 X121.844 Y125.819 E.01901
G1 X122.27 Y126.268 E.01901
G1 X122.589 Y126.799 E.01901
G1 X122.786 Y127.385 E.01901
G1 X122.853 Y128 E.01901
G1 X122.786 Y128.615 E.01901
G1 X122.589 Y129.201 E.01901
G1 X122.27 Y129.732 E.01901
G1 X121.844 Y130.181 E.01901
G1 X121.332 Y130.528 E.01901
G1 X120.758 Y130.757 E.01901
G1 X120.147 Y130.857 E.01901
G1 X119.529 Y130.824 E.01901
G1 X118.933 Y130.658 E.01901
G1 X118.386 Y130.368 E.01901
G1 X117.915 Y129.968 E.01901
G1 X117.54 Y129.475 E.01901
G1 X117.281 Y128.914 E.01901
G1 X117.148 Y128.309 E.01901
G1 X117.148 Y127.691 E.01901
G1 X117.281 Y127.086 E.01901
G1 X117.54 Y126.525 E.01901
G1 X117.915 Y126.032 E.01901
G1 X118.386 Y125.632 E.01901
G1 X118.933 Y125.342 E.01901
G1 X119.529 Y125.176 E.01901
G1 X119.579 Y125.174 E.00154
M204 S10000
; WIPE_START
G1 F24000
G1 X119.646 Y125.17 E-.02526
G1 X120.147 Y125.143 E-.1908
G1 X120.758 Y125.243 E-.23511
G1 X121.332 Y125.472 E-.23511
G1 X121.493 Y125.581 E-.07372
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I.847 J-.874 P1  F30000
G1 X120.677 Y124.791 Z1.4
G1 Z1
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X120.68 Y124.791 E.00009
G1 X120.767 Y124.804 E.00273
G1 X121.358 Y125.008 E.01921
G1 X121.9 Y125.321 E.01921
G1 X122.372 Y125.73 E.01921
G1 X122.759 Y126.222 E.01921
G1 X123.046 Y126.778 E.01921
G1 X123.222 Y127.378 E.01921
G1 X123.281 Y128 E.01921
G1 X123.222 Y128.622 E.01921
G1 X123.046 Y129.222 E.01921
G1 X122.759 Y129.778 E.01921
G1 X122.372 Y130.27 E.01921
G1 X121.9 Y130.679 E.01921
G1 X121.358 Y130.992 E.01921
G1 X120.767 Y131.196 E.01921
G1 X120.149 Y131.285 E.01921
G1 X119.524 Y131.256 E.01921
G1 X118.916 Y131.108 E.01921
G1 X118.348 Y130.848 E.01921
G1 X117.838 Y130.486 E.01921
G1 X117.407 Y130.033 E.01921
G1 X117.069 Y129.507 E.01921
G1 X116.836 Y128.927 E.01921
G1 X116.718 Y128.313 E.01921
G1 X116.718 Y127.687 E.01921
G1 X116.836 Y127.073 E.01921
G1 X117.069 Y126.493 E.01921
G1 X117.407 Y125.967 E.01921
G1 X117.838 Y125.514 E.01921
G1 X118.348 Y125.152 E.01921
G1 X118.916 Y124.892 E.01921
G1 X119.524 Y124.744 E.01921
G1 X120.149 Y124.715 E.01921
G1 X120.617 Y124.782 E.01455
M204 S10000
; WIPE_START
G1 F24000
G1 X120.68 Y124.791 E-.02394
G1 X120.767 Y124.804 E-.03376
G1 X121.358 Y125.008 E-.23761
G1 X121.9 Y125.321 E-.23761
G1 X122.352 Y125.712 E-.22709
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I.34 J1.168 P1  F30000
G1 X138.437 Y121.027 Z1.4
G1 Z1
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X138.443 Y121.027 E.0002
G1 X138.945 Y121 E.01543
G1 X139.555 Y121.1 E.01901
G1 X140.13 Y121.329 E.01901
G1 X140.642 Y121.676 E.01901
G1 X141.068 Y122.125 E.01901
G1 X141.387 Y122.655 E.01901
G1 X141.584 Y123.242 E.01901
G1 X141.651 Y123.857 E.01901
G1 X141.584 Y124.472 E.01901
G1 X141.387 Y125.058 E.01901
G1 X141.068 Y125.588 E.01901
G1 X140.642 Y126.037 E.01901
G1 X140.13 Y126.385 E.01901
G1 X139.555 Y126.614 E.01901
G1 X138.945 Y126.714 E.01901
G1 X138.327 Y126.68 E.01901
G1 X137.731 Y126.515 E.01901
G1 X137.184 Y126.225 E.01901
G1 X136.713 Y125.824 E.01901
G1 X136.338 Y125.332 E.01901
G1 X136.078 Y124.77 E.01901
G1 X135.945 Y124.166 E.01901
G1 X135.945 Y123.547 E.01901
G1 X136.078 Y122.943 E.01901
G1 X136.338 Y122.382 E.01901
G1 X136.713 Y121.889 E.01901
G1 X137.184 Y121.489 E.01901
G1 X137.731 Y121.199 E.01901
G1 X138.327 Y121.033 E.01901
G1 X138.377 Y121.031 E.00154
M204 S10000
; WIPE_START
G1 F24000
G1 X138.443 Y121.027 E-.02526
G1 X138.945 Y121 E-.1908
G1 X139.555 Y121.1 E-.23511
G1 X140.13 Y121.329 E-.23511
G1 X140.291 Y121.438 E-.07372
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I.847 J-.874 P1  F30000
G1 X139.474 Y120.647 Z1.4
G1 Z1
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X139.477 Y120.648 E.00009
G1 X139.565 Y120.66 E.00273
G1 X140.156 Y120.865 E.01921
G1 X140.698 Y121.178 E.01921
G1 X141.17 Y121.587 E.01921
G1 X141.557 Y122.079 E.01921
G1 X141.843 Y122.634 E.01921
G1 X142.02 Y123.234 E.01921
G1 X142.079 Y123.857 E.01921
G1 X142.02 Y124.479 E.01921
G1 X141.843 Y125.079 E.01921
G1 X141.557 Y125.635 E.01921
G1 X141.17 Y126.126 E.01921
G1 X140.698 Y126.536 E.01921
G1 X140.156 Y126.849 E.01921
G1 X139.565 Y127.053 E.01921
G1 X138.946 Y127.142 E.01921
G1 X138.322 Y127.112 E.01921
G1 X137.714 Y126.965 E.01921
G1 X137.145 Y126.705 E.01921
G1 X136.636 Y126.342 E.01921
G1 X136.205 Y125.89 E.01921
G1 X135.867 Y125.364 E.01921
G1 X135.634 Y124.783 E.01921
G1 X135.516 Y124.169 E.01921
G1 X135.516 Y123.544 E.01921
G1 X135.634 Y122.93 E.01921
G1 X135.867 Y122.35 E.01921
G1 X136.205 Y121.824 E.01921
G1 X136.636 Y121.371 E.01921
G1 X137.145 Y121.008 E.01921
G1 X137.714 Y120.749 E.01921
G1 X138.322 Y120.601 E.01921
G1 X138.946 Y120.571 E.01921
G1 X139.415 Y120.639 E.01455
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 1.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X139.477 Y120.648 E-.02394
G1 X139.565 Y120.66 E-.03376
G1 X140.156 Y120.865 E-.23761
G1 X140.698 Y121.178 E-.23761
G1 X141.149 Y121.569 E-.22709
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 6/27
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
G3 Z1.4 I.954 J-.756 P1  F30000
G1 X123.773 Y99.634 Z1.4
G1 Z1.2
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X123.781 Y99.634 E.00024
G1 X124.261 Y99.607 E.01479
G1 X124.872 Y99.708 E.01901
G1 X125.447 Y99.937 E.01901
G1 X125.959 Y100.284 E.01901
G1 X126.384 Y100.733 E.01901
G1 X126.703 Y101.263 E.01901
G1 X126.901 Y101.849 E.01901
G1 X126.968 Y102.465 E.01901
G1 X126.901 Y103.08 E.01901
G1 X126.703 Y103.666 E.01901
G1 X126.384 Y104.196 E.01901
G1 X125.959 Y104.645 E.01901
G1 X125.447 Y104.992 E.01901
G1 X124.872 Y105.221 E.01901
G1 X124.261 Y105.322 E.01901
G1 X123.644 Y105.288 E.01901
G1 X123.047 Y105.123 E.01901
G1 X122.501 Y104.833 E.01901
G1 X122.029 Y104.432 E.01901
G1 X121.655 Y103.94 E.01901
G1 X121.395 Y103.378 E.01901
G1 X121.262 Y102.774 E.01901
G1 X121.262 Y102.155 E.01901
G1 X121.395 Y101.551 E.01901
G1 X121.655 Y100.989 E.01901
M73 P70 R2
G1 X122.029 Y100.497 E.01901
G1 X122.501 Y100.096 E.01901
G1 X123.047 Y99.807 E.01901
G1 X123.644 Y99.641 E.01901
G1 X123.713 Y99.637 E.00214
M204 S10000
; WIPE_START
G1 F24000
G1 X123.781 Y99.634 E-.0258
G1 X124.261 Y99.607 E-.18288
G1 X124.872 Y99.708 E-.23511
G1 X125.447 Y99.937 E-.23511
G1 X125.623 Y100.056 E-.08111
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I.832 J-.888 P1  F30000
G1 X124.765 Y99.251 Z1.6
G1 Z1.2
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X124.77 Y99.252 E.00016
G1 X124.882 Y99.268 E.00347
G1 X125.473 Y99.473 E.01921
G1 X126.014 Y99.785 E.01921
G1 X126.487 Y100.195 E.01921
G1 X126.873 Y100.686 E.01921
G1 X127.16 Y101.242 E.01921
G1 X127.336 Y101.842 E.01921
G1 X127.396 Y102.465 E.01921
G1 X127.336 Y103.087 E.01921
G1 X127.16 Y103.687 E.01921
G1 X126.873 Y104.243 E.01921
G1 X126.487 Y104.734 E.01921
G1 X126.014 Y105.144 E.01921
G1 X125.473 Y105.456 E.01921
G1 X124.882 Y105.661 E.01921
G1 X124.263 Y105.75 E.01921
G1 X123.638 Y105.72 E.01921
G1 X123.031 Y105.573 E.01921
G1 X122.462 Y105.313 E.01921
G1 X121.953 Y104.95 E.01921
G1 X121.521 Y104.498 E.01921
G1 X121.183 Y103.972 E.01921
G1 X120.951 Y103.391 E.01921
G1 X120.832 Y102.777 E.01921
G1 X120.832 Y102.152 E.01921
G1 X120.951 Y101.538 E.01921
G1 X121.183 Y100.957 E.01921
G1 X121.521 Y100.431 E.01921
G1 X121.953 Y99.979 E.01921
G1 X122.462 Y99.616 E.01921
G1 X123.031 Y99.356 E.01921
G1 X123.638 Y99.209 E.01921
G1 X124.263 Y99.179 E.01921
G1 X124.705 Y99.243 E.01373
M204 S10000
; WIPE_START
G1 F24000
G1 X124.77 Y99.252 E-.02481
G1 X124.882 Y99.268 E-.04295
G1 X125.473 Y99.473 E-.23761
G1 X126.014 Y99.785 E-.23761
G1 X126.446 Y100.159 E-.21703
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I-1.174 J-.319 P1  F30000
G1 X119.659 Y125.169 Z1.6
G1 Z1.2
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X119.666 Y125.169 E.00024
G1 X120.147 Y125.143 E.01479
G1 X120.758 Y125.243 E.01901
G1 X121.332 Y125.472 E.01901
G1 X121.844 Y125.819 E.01901
G1 X122.27 Y126.268 E.01901
G1 X122.589 Y126.799 E.01901
G1 X122.786 Y127.385 E.01901
G1 X122.853 Y128 E.01901
G1 X122.786 Y128.615 E.01901
G1 X122.589 Y129.201 E.01901
G1 X122.27 Y129.732 E.01901
G1 X121.844 Y130.181 E.01901
G1 X121.332 Y130.528 E.01901
G1 X120.758 Y130.757 E.01901
G1 X120.147 Y130.857 E.01901
G1 X119.529 Y130.824 E.01901
G1 X118.933 Y130.658 E.01901
G1 X118.386 Y130.368 E.01901
G1 X117.915 Y129.968 E.01901
G1 X117.54 Y129.475 E.01901
G1 X117.281 Y128.914 E.01901
G1 X117.148 Y128.309 E.01901
G1 X117.148 Y127.691 E.01901
G1 X117.281 Y127.086 E.01901
G1 X117.54 Y126.525 E.01901
G1 X117.915 Y126.032 E.01901
G1 X118.386 Y125.632 E.01901
G1 X118.933 Y125.342 E.01901
G1 X119.529 Y125.176 E.01901
G1 X119.599 Y125.173 E.00214
M204 S10000
; WIPE_START
G1 F24000
G1 X119.666 Y125.169 E-.0258
G1 X120.147 Y125.143 E-.18288
G1 X120.758 Y125.243 E-.23511
G1 X121.332 Y125.472 E-.23511
G1 X121.509 Y125.592 E-.08111
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I.832 J-.888 P1  F30000
G1 X120.65 Y124.787 Z1.6
G1 Z1.2
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X120.656 Y124.788 E.00016
G1 X120.767 Y124.804 E.00347
G1 X121.358 Y125.008 E.01921
G1 X121.9 Y125.321 E.01921
G1 X122.372 Y125.73 E.01921
G1 X122.759 Y126.222 E.01921
G1 X123.046 Y126.778 E.01921
G1 X123.222 Y127.378 E.01921
G1 X123.281 Y128 E.01921
G1 X123.222 Y128.622 E.01921
G1 X123.046 Y129.222 E.01921
G1 X122.759 Y129.778 E.01921
G1 X122.372 Y130.27 E.01921
G1 X121.9 Y130.679 E.01921
G1 X121.358 Y130.992 E.01921
G1 X120.767 Y131.196 E.01921
G1 X120.149 Y131.285 E.01921
G1 X119.524 Y131.256 E.01921
G1 X118.916 Y131.108 E.01921
G1 X118.348 Y130.848 E.01921
G1 X117.838 Y130.486 E.01921
G1 X117.407 Y130.033 E.01921
G1 X117.069 Y129.507 E.01921
G1 X116.836 Y128.927 E.01921
G1 X116.718 Y128.313 E.01921
G1 X116.718 Y127.687 E.01921
G1 X116.836 Y127.073 E.01921
G1 X117.069 Y126.493 E.01921
G1 X117.407 Y125.967 E.01921
G1 X117.838 Y125.514 E.01921
G1 X118.348 Y125.152 E.01921
G1 X118.916 Y124.892 E.01921
G1 X119.524 Y124.744 E.01921
G1 X120.149 Y124.715 E.01921
G1 X120.591 Y124.778 E.01373
M204 S10000
; WIPE_START
G1 F24000
G1 X120.656 Y124.788 E-.02481
G1 X120.767 Y124.804 E-.04295
G1 X121.358 Y125.008 E-.23761
G1 X121.9 Y125.321 E-.23761
G1 X122.332 Y125.695 E-.21703
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I.338 J1.169 P1  F30000
G1 X138.456 Y121.026 Z1.6
G1 Z1.2
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X138.464 Y121.026 E.00024
G1 X138.945 Y121 E.01479
G1 X139.555 Y121.1 E.01901
G1 X140.13 Y121.329 E.01901
G1 X140.642 Y121.676 E.01901
G1 X141.068 Y122.125 E.01901
G1 X141.387 Y122.655 E.01901
G1 X141.584 Y123.242 E.01901
G1 X141.651 Y123.857 E.01901
G1 X141.584 Y124.472 E.01901
G1 X141.387 Y125.058 E.01901
G1 X141.068 Y125.588 E.01901
G1 X140.642 Y126.037 E.01901
G1 X140.13 Y126.385 E.01901
G1 X139.555 Y126.614 E.01901
G1 X138.945 Y126.714 E.01901
G1 X138.327 Y126.68 E.01901
G1 X137.731 Y126.515 E.01901
G1 X137.184 Y126.225 E.01901
G1 X136.713 Y125.824 E.01901
G1 X136.338 Y125.332 E.01901
G1 X136.078 Y124.77 E.01901
G1 X135.945 Y124.166 E.01901
G1 X135.945 Y123.547 E.01901
G1 X136.078 Y122.943 E.01901
G1 X136.338 Y122.382 E.01901
G1 X136.713 Y121.889 E.01901
G1 X137.184 Y121.489 E.01901
G1 X137.731 Y121.199 E.01901
G1 X138.327 Y121.033 E.01901
G1 X138.396 Y121.029 E.00214
M204 S10000
; WIPE_START
G1 F24000
G1 X138.464 Y121.026 E-.0258
G1 X138.945 Y121 E-.18288
G1 X139.555 Y121.1 E-.23511
G1 X140.13 Y121.329 E-.23511
G1 X140.307 Y121.449 E-.08111
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I.832 J-.888 P1  F30000
G1 X139.448 Y120.644 Z1.6
G1 Z1.2
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X139.453 Y120.644 E.00016
G1 X139.565 Y120.66 E.00347
G1 X140.156 Y120.865 E.01921
G1 X140.698 Y121.178 E.01921
G1 X141.17 Y121.587 E.01921
G1 X141.557 Y122.079 E.01921
G1 X141.843 Y122.634 E.01921
G1 X142.02 Y123.234 E.01921
M73 P71 R2
G1 X142.079 Y123.857 E.01921
G1 X142.02 Y124.479 E.01921
G1 X141.843 Y125.079 E.01921
G1 X141.557 Y125.635 E.01921
G1 X141.17 Y126.126 E.01921
G1 X140.698 Y126.536 E.01921
G1 X140.156 Y126.849 E.01921
G1 X139.565 Y127.053 E.01921
G1 X138.946 Y127.142 E.01921
G1 X138.322 Y127.112 E.01921
G1 X137.714 Y126.965 E.01921
G1 X137.145 Y126.705 E.01921
G1 X136.636 Y126.342 E.01921
G1 X136.205 Y125.89 E.01921
G1 X135.867 Y125.364 E.01921
G1 X135.634 Y124.783 E.01921
G1 X135.516 Y124.169 E.01921
G1 X135.516 Y123.544 E.01921
G1 X135.634 Y122.93 E.01921
G1 X135.867 Y122.35 E.01921
G1 X136.205 Y121.824 E.01921
G1 X136.636 Y121.371 E.01921
G1 X137.145 Y121.008 E.01921
G1 X137.714 Y120.749 E.01921
G1 X138.322 Y120.601 E.01921
G1 X138.946 Y120.571 E.01921
G1 X139.389 Y120.635 E.01373
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 1.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X139.453 Y120.644 E-.02481
G1 X139.565 Y120.66 E-.04295
G1 X140.156 Y120.865 E-.23761
G1 X140.698 Y121.178 E-.23761
G1 X141.129 Y121.552 E-.21703
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 7/27
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
G3 Z1.6 I.954 J-.755 P1  F30000
G1 X123.793 Y99.633 Z1.6
G1 Z1.4
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X123.802 Y99.632 E.00026
G1 X124.261 Y99.607 E.01415
G1 X124.872 Y99.708 E.01901
G1 X125.447 Y99.937 E.01901
G1 X125.959 Y100.284 E.01901
G1 X126.384 Y100.733 E.01901
G1 X126.703 Y101.263 E.01901
G1 X126.901 Y101.849 E.01901
G1 X126.968 Y102.465 E.01901
G1 X126.901 Y103.08 E.01901
G1 X126.703 Y103.666 E.01901
G1 X126.384 Y104.196 E.01901
G1 X125.959 Y104.645 E.01901
G1 X125.447 Y104.992 E.01901
G1 X124.872 Y105.221 E.01901
G1 X124.261 Y105.322 E.01901
G1 X123.644 Y105.288 E.01901
G1 X123.047 Y105.123 E.01901
G1 X122.501 Y104.833 E.01901
G1 X122.029 Y104.432 E.01901
G1 X121.655 Y103.94 E.01901
G1 X121.395 Y103.378 E.01901
G1 X121.262 Y102.774 E.01901
G1 X121.262 Y102.155 E.01901
G1 X121.395 Y101.551 E.01901
G1 X121.655 Y100.989 E.01901
G1 X122.029 Y100.497 E.01901
G1 X122.501 Y100.096 E.01901
G1 X123.047 Y99.807 E.01901
G1 X123.644 Y99.641 E.01901
G1 X123.733 Y99.636 E.00276
M204 S10000
; WIPE_START
G1 F24000
G1 X123.802 Y99.632 E-.02606
G1 X124.261 Y99.607 E-.17496
G1 X124.872 Y99.708 E-.23511
G1 X125.447 Y99.937 E-.23511
G1 X125.64 Y100.068 E-.08876
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I.819 J-.901 P1  F30000
G1 X124.738 Y99.247 Z1.8
G1 Z1.4
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X124.746 Y99.249 E.00026
G1 X124.882 Y99.268 E.00422
G1 X125.473 Y99.473 E.01921
G1 X126.014 Y99.785 E.01921
G1 X126.487 Y100.195 E.01921
G1 X126.873 Y100.686 E.01921
G1 X127.16 Y101.242 E.01921
G1 X127.336 Y101.842 E.01921
G1 X127.396 Y102.465 E.01921
G1 X127.336 Y103.087 E.01921
G1 X127.16 Y103.687 E.01921
G1 X126.873 Y104.243 E.01921
G1 X126.487 Y104.734 E.01921
G1 X126.014 Y105.144 E.01921
G1 X125.473 Y105.456 E.01921
G1 X124.882 Y105.661 E.01921
G1 X124.263 Y105.75 E.01921
G1 X123.638 Y105.72 E.01921
G1 X123.031 Y105.573 E.01921
G1 X122.462 Y105.313 E.01921
G1 X121.953 Y104.95 E.01921
G1 X121.521 Y104.498 E.01921
G1 X121.183 Y103.972 E.01921
G1 X120.951 Y103.391 E.01921
G1 X120.832 Y102.777 E.01921
G1 X120.832 Y102.152 E.01921
G1 X120.951 Y101.538 E.01921
G1 X121.183 Y100.957 E.01921
G1 X121.521 Y100.431 E.01921
G1 X121.953 Y99.979 E.01921
G1 X122.462 Y99.616 E.01921
G1 X123.031 Y99.356 E.01921
G1 X123.638 Y99.209 E.01921
G1 X124.263 Y99.179 E.01921
G1 X124.678 Y99.239 E.01289
M204 S10000
; WIPE_START
G1 F24000
G1 X124.746 Y99.249 E-.02605
G1 X124.882 Y99.268 E-.05214
G1 X125.473 Y99.473 E-.23761
G1 X126.014 Y99.785 E-.23761
G1 X126.425 Y100.141 E-.20659
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-1.175 J-.317 P1  F30000
G1 X119.679 Y125.168 Z1.8
G1 Z1.4
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X119.687 Y125.168 E.00026
G1 X120.147 Y125.143 E.01415
G1 X120.758 Y125.243 E.01901
G1 X121.332 Y125.472 E.01901
G1 X121.844 Y125.819 E.01901
G1 X122.27 Y126.268 E.01901
G1 X122.589 Y126.799 E.01901
G1 X122.786 Y127.385 E.01901
G1 X122.853 Y128 E.01901
G1 X122.786 Y128.615 E.01901
G1 X122.589 Y129.201 E.01901
G1 X122.27 Y129.732 E.01901
G1 X121.844 Y130.181 E.01901
G1 X121.332 Y130.528 E.01901
G1 X120.758 Y130.757 E.01901
G1 X120.147 Y130.857 E.01901
G1 X119.529 Y130.824 E.01901
G1 X118.933 Y130.658 E.01901
G1 X118.386 Y130.368 E.01901
G1 X117.915 Y129.968 E.01901
G1 X117.54 Y129.475 E.01901
G1 X117.281 Y128.914 E.01901
G1 X117.148 Y128.309 E.01901
G1 X117.148 Y127.691 E.01901
G1 X117.281 Y127.086 E.01901
G1 X117.54 Y126.525 E.01901
G1 X117.915 Y126.032 E.01901
G1 X118.386 Y125.632 E.01901
G1 X118.933 Y125.342 E.01901
G1 X119.529 Y125.176 E.01901
G1 X119.619 Y125.172 E.00276
M204 S10000
; WIPE_START
G1 F24000
G1 X119.687 Y125.168 E-.02606
G1 X120.147 Y125.143 E-.17496
G1 X120.758 Y125.243 E-.23511
G1 X121.332 Y125.472 E-.23511
G1 X121.526 Y125.603 E-.08876
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I.819 J-.901 P1  F30000
G1 X120.623 Y124.783 Z1.8
G1 Z1.4
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X120.632 Y124.784 E.00026
G1 X120.767 Y124.804 E.00422
G1 X121.358 Y125.008 E.01921
G1 X121.9 Y125.321 E.01921
G1 X122.372 Y125.73 E.01921
G1 X122.759 Y126.222 E.01921
G1 X123.046 Y126.778 E.01921
G1 X123.222 Y127.378 E.01921
G1 X123.281 Y128 E.01921
G1 X123.222 Y128.622 E.01921
G1 X123.046 Y129.222 E.01921
G1 X122.759 Y129.778 E.01921
G1 X122.372 Y130.27 E.01921
G1 X121.9 Y130.679 E.01921
G1 X121.358 Y130.992 E.01921
G1 X120.767 Y131.196 E.01921
G1 X120.149 Y131.285 E.01921
G1 X119.524 Y131.256 E.01921
G1 X118.916 Y131.108 E.01921
G1 X118.348 Y130.848 E.01921
G1 X117.838 Y130.486 E.01921
G1 X117.407 Y130.033 E.01921
G1 X117.069 Y129.507 E.01921
G1 X116.836 Y128.927 E.01921
G1 X116.718 Y128.313 E.01921
G1 X116.718 Y127.687 E.01921
G1 X116.836 Y127.073 E.01921
G1 X117.069 Y126.493 E.01921
G1 X117.407 Y125.967 E.01921
G1 X117.838 Y125.514 E.01921
G1 X118.348 Y125.152 E.01921
G1 X118.916 Y124.892 E.01921
G1 X119.524 Y124.744 E.01921
G1 X120.149 Y124.715 E.01921
M73 P72 R2
G1 X120.564 Y124.774 E.01289
M204 S10000
; WIPE_START
G1 F24000
G1 X120.632 Y124.784 E-.02605
G1 X120.767 Y124.804 E-.05214
G1 X121.358 Y125.008 E-.23761
G1 X121.9 Y125.321 E-.23761
G1 X122.311 Y125.677 E-.20659
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I.337 J1.17 P1  F30000
G1 X138.477 Y121.025 Z1.8
G1 Z1.4
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X138.485 Y121.025 E.00026
G1 X138.945 Y121 E.01415
G1 X139.555 Y121.1 E.01901
G1 X140.13 Y121.329 E.01901
G1 X140.642 Y121.676 E.01901
G1 X141.068 Y122.125 E.01901
G1 X141.387 Y122.655 E.01901
G1 X141.584 Y123.242 E.01901
G1 X141.651 Y123.857 E.01901
G1 X141.584 Y124.472 E.01901
G1 X141.387 Y125.058 E.01901
G1 X141.068 Y125.588 E.01901
G1 X140.642 Y126.037 E.01901
G1 X140.13 Y126.385 E.01901
G1 X139.555 Y126.614 E.01901
G1 X138.945 Y126.714 E.01901
G1 X138.327 Y126.68 E.01901
G1 X137.731 Y126.515 E.01901
G1 X137.184 Y126.225 E.01901
G1 X136.713 Y125.824 E.01901
G1 X136.338 Y125.332 E.01901
G1 X136.078 Y124.77 E.01901
G1 X135.945 Y124.166 E.01901
G1 X135.945 Y123.547 E.01901
G1 X136.078 Y122.943 E.01901
G1 X136.338 Y122.382 E.01901
G1 X136.713 Y121.889 E.01901
G1 X137.184 Y121.489 E.01901
G1 X137.731 Y121.199 E.01901
G1 X138.327 Y121.033 E.01901
G1 X138.417 Y121.028 E.00276
M204 S10000
; WIPE_START
G1 F24000
G1 X138.485 Y121.025 E-.02606
G1 X138.945 Y121 E-.17496
G1 X139.555 Y121.1 E-.23511
G1 X140.13 Y121.329 E-.23511
G1 X140.323 Y121.46 E-.08876
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I.819 J-.901 P1  F30000
G1 X139.421 Y120.64 Z1.8
G1 Z1.4
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X139.43 Y120.641 E.00026
G1 X139.565 Y120.66 E.00422
G1 X140.156 Y120.865 E.01921
G1 X140.698 Y121.178 E.01921
G1 X141.17 Y121.587 E.01921
G1 X141.557 Y122.079 E.01921
G1 X141.843 Y122.634 E.01921
G1 X142.02 Y123.234 E.01921
G1 X142.079 Y123.857 E.01921
G1 X142.02 Y124.479 E.01921
G1 X141.843 Y125.079 E.01921
G1 X141.557 Y125.635 E.01921
G1 X141.17 Y126.126 E.01921
G1 X140.698 Y126.536 E.01921
G1 X140.156 Y126.849 E.01921
G1 X139.565 Y127.053 E.01921
G1 X138.946 Y127.142 E.01921
G1 X138.322 Y127.112 E.01921
G1 X137.714 Y126.965 E.01921
G1 X137.145 Y126.705 E.01921
G1 X136.636 Y126.342 E.01921
G1 X136.205 Y125.89 E.01921
G1 X135.867 Y125.364 E.01921
G1 X135.634 Y124.783 E.01921
G1 X135.516 Y124.169 E.01921
G1 X135.516 Y123.544 E.01921
G1 X135.634 Y122.93 E.01921
G1 X135.867 Y122.35 E.01921
G1 X136.205 Y121.824 E.01921
G1 X136.636 Y121.371 E.01921
G1 X137.145 Y121.008 E.01921
G1 X137.714 Y120.749 E.01921
G1 X138.322 Y120.601 E.01921
G1 X138.946 Y120.571 E.01921
G1 X139.362 Y120.631 E.01289
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 1.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X139.43 Y120.641 E-.02605
G1 X139.565 Y120.66 E-.05214
G1 X140.156 Y120.865 E-.23761
G1 X140.698 Y121.178 E-.23761
G1 X141.109 Y121.534 E-.20659
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 8/27
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
G3 Z1.8 I.955 J-.754 P1  F30000
G1 X123.814 Y99.632 Z1.8
G1 Z1.6
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X123.822 Y99.631 E.00027
G1 X124.261 Y99.607 E.01351
G1 X124.872 Y99.708 E.01901
G1 X125.447 Y99.937 E.01901
G1 X125.959 Y100.284 E.01901
G1 X126.384 Y100.733 E.01901
G1 X126.703 Y101.263 E.01901
G1 X126.901 Y101.849 E.01901
G1 X126.968 Y102.465 E.01901
G1 X126.901 Y103.08 E.01901
G1 X126.76 Y103.496 E.01351
G1 X126.703 Y103.666 E.0055
G1 X126.384 Y104.196 E.01901
G1 X125.959 Y104.645 E.01901
G1 X125.447 Y104.992 E.01901
G1 X124.872 Y105.221 E.01901
G1 X124.261 Y105.322 E.01901
G1 X123.644 Y105.288 E.01901
G1 X123.047 Y105.123 E.01901
G1 X122.501 Y104.833 E.01901
G1 X122.029 Y104.432 E.01901
G1 X121.655 Y103.94 E.01901
G1 X121.395 Y103.378 E.01901
G1 X121.262 Y102.774 E.01901
G1 X121.262 Y102.155 E.01901
G1 X121.395 Y101.551 E.01901
G1 X121.655 Y100.989 E.01901
G1 X122.029 Y100.497 E.01901
G1 X122.501 Y100.096 E.01901
G1 X123.047 Y99.807 E.01901
G1 X123.644 Y99.641 E.01901
G1 X123.754 Y99.635 E.00339
M204 S10000
; WIPE_START
G1 F24000
G1 X123.822 Y99.631 E-.0261
G1 X124.261 Y99.607 E-.16704
G1 X124.872 Y99.708 E-.23511
G1 X125.447 Y99.937 E-.23511
G1 X125.657 Y100.079 E-.09664
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I.805 J-.913 P1  F30000
G1 X124.71 Y99.243 Z2
G1 Z1.6
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X124.722 Y99.245 E.00039
G1 X124.882 Y99.268 E.00496
G1 X125.473 Y99.473 E.01921
G1 X126.014 Y99.785 E.01921
G1 X126.487 Y100.195 E.01921
G1 X126.873 Y100.686 E.01921
G1 X127.16 Y101.242 E.01921
G1 X127.336 Y101.842 E.01921
G1 X127.396 Y102.465 E.01921
G1 X127.336 Y103.087 E.01921
G1 X127.16 Y103.687 E.01921
G1 X126.873 Y104.243 E.01921
G1 X126.487 Y104.734 E.01921
G1 X126.014 Y105.144 E.01921
G1 X125.473 Y105.456 E.01921
G1 X124.882 Y105.661 E.01921
G1 X124.263 Y105.75 E.01921
G1 X123.638 Y105.72 E.01921
G1 X123.031 Y105.573 E.01921
G1 X122.462 Y105.313 E.01921
G1 X121.953 Y104.95 E.01921
G1 X121.521 Y104.498 E.01921
G1 X121.183 Y103.972 E.01921
G1 X120.951 Y103.391 E.01921
G1 X120.832 Y102.777 E.01921
G1 X120.832 Y102.152 E.01921
G1 X120.951 Y101.538 E.01921
G1 X121.183 Y100.957 E.01921
G1 X121.521 Y100.431 E.01921
G1 X121.953 Y99.979 E.01921
G1 X122.462 Y99.616 E.01921
G1 X123.031 Y99.356 E.01921
G1 X123.638 Y99.209 E.01921
G1 X124.263 Y99.179 E.01921
G1 X124.65 Y99.235 E.01202
M204 S10000
; WIPE_START
G1 F24000
G1 X124.722 Y99.245 E-.02761
G1 X124.882 Y99.268 E-.06134
G1 X125.473 Y99.473 E-.23761
G1 X126.014 Y99.785 E-.23761
G1 X126.404 Y100.123 E-.19583
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-1.176 J-.315 P1  F30000
G1 X119.699 Y125.167 Z2
G1 Z1.6
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X119.708 Y125.167 E.00027
G1 X120.147 Y125.143 E.01351
G1 X120.758 Y125.243 E.01901
G1 X121.332 Y125.472 E.01901
G1 X121.844 Y125.819 E.01901
G1 X122.27 Y126.268 E.01901
G1 X122.589 Y126.799 E.01901
G1 X122.786 Y127.385 E.01901
G1 X122.853 Y128 E.01901
G1 X122.786 Y128.615 E.01901
G1 X122.646 Y129.032 E.01351
G1 X122.589 Y129.201 E.0055
G1 X122.27 Y129.732 E.01901
G1 X121.844 Y130.181 E.01901
G1 X121.332 Y130.528 E.01901
G1 X120.758 Y130.757 E.01901
G1 X120.147 Y130.857 E.01901
G1 X119.529 Y130.824 E.01901
M73 P73 R2
G1 X118.933 Y130.658 E.01901
G1 X118.386 Y130.368 E.01901
G1 X117.915 Y129.968 E.01901
G1 X117.54 Y129.475 E.01901
G1 X117.281 Y128.914 E.01901
G1 X117.148 Y128.309 E.01901
G1 X117.148 Y127.691 E.01901
G1 X117.281 Y127.086 E.01901
G1 X117.54 Y126.525 E.01901
G1 X117.915 Y126.032 E.01901
G1 X118.386 Y125.632 E.01901
G1 X118.933 Y125.342 E.01901
G1 X119.529 Y125.176 E.01901
G1 X119.639 Y125.17 E.00339
M204 S10000
; WIPE_START
G1 F24000
G1 X119.708 Y125.167 E-.0261
G1 X120.147 Y125.143 E-.16704
G1 X120.758 Y125.243 E-.23511
G1 X121.332 Y125.472 E-.23511
G1 X121.543 Y125.615 E-.09664
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I.805 J-.913 P1  F30000
G1 X120.595 Y124.779 Z2
G1 Z1.6
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X120.608 Y124.781 E.00039
G1 X120.767 Y124.804 E.00496
G1 X121.358 Y125.008 E.01921
G1 X121.9 Y125.321 E.01921
G1 X122.372 Y125.73 E.01921
G1 X122.759 Y126.222 E.01921
G1 X123.046 Y126.778 E.01921
G1 X123.222 Y127.378 E.01921
G1 X123.281 Y128 E.01921
G1 X123.222 Y128.622 E.01921
G1 X123.046 Y129.222 E.01921
G1 X122.759 Y129.778 E.01921
G1 X122.372 Y130.27 E.01921
G1 X121.9 Y130.679 E.01921
G1 X121.358 Y130.992 E.01921
G1 X120.767 Y131.196 E.01921
G1 X120.149 Y131.285 E.01921
G1 X119.524 Y131.256 E.01921
G1 X118.916 Y131.108 E.01921
G1 X118.348 Y130.848 E.01921
G1 X117.838 Y130.486 E.01921
G1 X117.407 Y130.033 E.01921
G1 X117.069 Y129.507 E.01921
G1 X116.836 Y128.927 E.01921
G1 X116.718 Y128.313 E.01921
G1 X116.718 Y127.687 E.01921
G1 X116.836 Y127.073 E.01921
G1 X117.069 Y126.493 E.01921
G1 X117.407 Y125.967 E.01921
G1 X117.838 Y125.514 E.01921
G1 X118.348 Y125.152 E.01921
G1 X118.916 Y124.892 E.01921
G1 X119.524 Y124.744 E.01921
G1 X120.149 Y124.715 E.01921
G1 X120.536 Y124.77 E.01202
M204 S10000
; WIPE_START
G1 F24000
G1 X120.608 Y124.781 E-.02761
G1 X120.767 Y124.804 E-.06134
G1 X121.358 Y125.008 E-.23761
G1 X121.9 Y125.321 E-.23761
G1 X122.289 Y125.658 E-.19583
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I.335 J1.17 P1  F30000
G1 X138.497 Y121.024 Z2
G1 Z1.6
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X138.506 Y121.024 E.00027
G1 X138.945 Y121 E.01351
G1 X139.555 Y121.1 E.01901
G1 X140.13 Y121.329 E.01901
G1 X140.642 Y121.676 E.01901
G1 X141.068 Y122.125 E.01901
G1 X141.387 Y122.655 E.01901
G1 X141.584 Y123.242 E.01901
G1 X141.651 Y123.857 E.01901
G1 X141.584 Y124.472 E.01901
G1 X141.444 Y124.888 E.01351
G1 X141.387 Y125.058 E.0055
G1 X141.068 Y125.588 E.01901
G1 X140.642 Y126.037 E.01901
G1 X140.13 Y126.385 E.01901
G1 X139.555 Y126.614 E.01901
G1 X138.945 Y126.714 E.01901
G1 X138.327 Y126.68 E.01901
G1 X137.731 Y126.515 E.01901
G1 X137.184 Y126.225 E.01901
G1 X136.713 Y125.824 E.01901
G1 X136.338 Y125.332 E.01901
G1 X136.078 Y124.77 E.01901
G1 X135.945 Y124.166 E.01901
G1 X135.945 Y123.547 E.01901
G1 X136.078 Y122.943 E.01901
G1 X136.338 Y122.382 E.01901
G1 X136.713 Y121.889 E.01901
G1 X137.184 Y121.489 E.01901
G1 X137.731 Y121.199 E.01901
G1 X138.327 Y121.033 E.01901
G1 X138.437 Y121.027 E.00339
M204 S10000
; WIPE_START
G1 F24000
G1 X138.506 Y121.024 E-.0261
G1 X138.945 Y121 E-.16704
G1 X139.555 Y121.1 E-.23511
G1 X140.13 Y121.329 E-.23511
G1 X140.341 Y121.472 E-.09664
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I.805 J-.913 P1  F30000
G1 X139.393 Y120.636 Z2
G1 Z1.6
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X139.406 Y120.637 E.00039
G1 X139.565 Y120.66 E.00496
G1 X140.156 Y120.865 E.01921
G1 X140.698 Y121.178 E.01921
G1 X141.17 Y121.587 E.01921
G1 X141.557 Y122.079 E.01921
G1 X141.843 Y122.634 E.01921
G1 X142.02 Y123.234 E.01921
G1 X142.079 Y123.857 E.01921
G1 X142.02 Y124.479 E.01921
G1 X141.843 Y125.079 E.01921
G1 X141.557 Y125.635 E.01921
G1 X141.17 Y126.126 E.01921
G1 X140.698 Y126.536 E.01921
G1 X140.156 Y126.849 E.01921
G1 X139.565 Y127.053 E.01921
G1 X138.946 Y127.142 E.01921
G1 X138.322 Y127.112 E.01921
G1 X137.714 Y126.965 E.01921
G1 X137.145 Y126.705 E.01921
G1 X136.636 Y126.342 E.01921
G1 X136.205 Y125.89 E.01921
G1 X135.867 Y125.364 E.01921
G1 X135.634 Y124.783 E.01921
G1 X135.516 Y124.169 E.01921
G1 X135.516 Y123.544 E.01921
G1 X135.634 Y122.93 E.01921
G1 X135.867 Y122.35 E.01921
G1 X136.205 Y121.824 E.01921
G1 X136.636 Y121.371 E.01921
G1 X137.145 Y121.008 E.01921
G1 X137.714 Y120.749 E.01921
G1 X138.322 Y120.601 E.01921
G1 X138.946 Y120.571 E.01921
G1 X139.334 Y120.627 E.01202
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X139.406 Y120.637 E-.02761
G1 X139.565 Y120.66 E-.06134
G1 X140.156 Y120.865 E-.23761
G1 X140.698 Y121.178 E-.23761
G1 X141.087 Y121.515 E-.19583
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 9/27
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
G3 Z2 I.956 J-.753 P1  F30000
G1 X123.835 Y99.631 Z2
G1 Z1.8
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X123.843 Y99.63 E.00025
G1 X124.261 Y99.607 E.01287
G1 X124.872 Y99.708 E.01901
G1 X125.447 Y99.937 E.01901
G1 X125.959 Y100.284 E.01901
G1 X126.384 Y100.733 E.01901
G1 X126.703 Y101.263 E.01901
G1 X126.901 Y101.849 E.01901
G1 X126.968 Y102.465 E.01901
G1 X126.901 Y103.08 E.01901
G1 X126.703 Y103.666 E.01901
G1 X126.384 Y104.196 E.01901
G1 X125.959 Y104.645 E.01901
G1 X125.447 Y104.992 E.01901
G1 X124.872 Y105.221 E.01901
G1 X124.261 Y105.322 E.01901
G1 X123.644 Y105.288 E.01901
G1 X123.047 Y105.123 E.01901
G1 X122.501 Y104.833 E.01901
G1 X122.029 Y104.432 E.01901
G1 X121.655 Y103.94 E.01901
G1 X121.395 Y103.378 E.01901
G1 X121.262 Y102.774 E.01901
G1 X121.262 Y102.155 E.01901
G1 X121.395 Y101.551 E.01901
G1 X121.655 Y100.989 E.01901
G1 X122.029 Y100.497 E.01901
G1 X122.501 Y100.096 E.01901
G1 X123.047 Y99.807 E.01901
G1 X123.644 Y99.641 E.01901
G1 X123.775 Y99.634 E.00405
M204 S10000
G1 X124.681 Y99.239 F30000
M204 S5000
G1 F1200
G1 X124.698 Y99.242 E.00054
G1 X124.882 Y99.268 E.0057
G1 X125.473 Y99.473 E.01921
G1 X126.014 Y99.785 E.01921
G1 X126.487 Y100.195 E.01921
G1 X126.873 Y100.686 E.01921
G1 X127.16 Y101.242 E.01921
G1 X127.336 Y101.842 E.01921
G1 X127.396 Y102.465 E.01921
G1 X127.336 Y103.087 E.01921
G1 X127.16 Y103.687 E.01921
G1 X126.873 Y104.243 E.01921
M73 P74 R2
G1 X126.487 Y104.734 E.01921
G1 X126.014 Y105.144 E.01921
G1 X125.473 Y105.456 E.01921
G1 X124.882 Y105.661 E.01921
G1 X124.263 Y105.75 E.01921
G1 X123.638 Y105.72 E.01921
G1 X123.031 Y105.573 E.01921
G1 X122.462 Y105.313 E.01921
G1 X121.953 Y104.95 E.01921
G1 X121.521 Y104.498 E.01921
G1 X121.183 Y103.972 E.01921
G1 X120.951 Y103.391 E.01921
G1 X120.832 Y102.777 E.01921
G1 X120.832 Y102.152 E.01921
G1 X120.951 Y101.538 E.01921
G1 X121.183 Y100.957 E.01921
G1 X121.521 Y100.431 E.01921
G1 X121.953 Y99.979 E.01921
G1 X122.462 Y99.616 E.01921
G1 X123.031 Y99.356 E.01921
G1 X123.638 Y99.209 E.01921
G1 X124.263 Y99.179 E.01921
G1 X124.621 Y99.231 E.01113
M204 S10000
; WIPE_START
G1 F24000
G1 X124.698 Y99.242 E-.02945
G1 X124.882 Y99.268 E-.07053
G1 X125.473 Y99.473 E-.23761
G1 X126.014 Y99.785 E-.23761
G1 X126.382 Y100.104 E-.1848
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-1.176 J-.313 P1  F30000
G1 X119.721 Y125.166 Z2.2
G1 Z1.8
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X119.729 Y125.166 E.00025
G1 X120.147 Y125.143 E.01287
G1 X120.758 Y125.243 E.01901
G1 X121.332 Y125.472 E.01901
G1 X121.844 Y125.819 E.01901
G1 X122.27 Y126.268 E.01901
G1 X122.589 Y126.799 E.01901
G1 X122.786 Y127.385 E.01901
G1 X122.853 Y128 E.01901
G1 X122.786 Y128.615 E.01901
G1 X122.589 Y129.201 E.01901
G1 X122.27 Y129.732 E.01901
G1 X121.844 Y130.181 E.01901
G1 X121.332 Y130.528 E.01901
G1 X120.758 Y130.757 E.01901
G1 X120.147 Y130.857 E.01901
G1 X119.529 Y130.824 E.01901
G1 X118.933 Y130.658 E.01901
G1 X118.386 Y130.368 E.01901
G1 X117.915 Y129.968 E.01901
G1 X117.54 Y129.475 E.01901
G1 X117.281 Y128.914 E.01901
G1 X117.148 Y128.309 E.01901
G1 X117.148 Y127.691 E.01901
G1 X117.281 Y127.086 E.01901
G1 X117.54 Y126.525 E.01901
G1 X117.915 Y126.032 E.01901
G1 X118.386 Y125.632 E.01901
G1 X118.933 Y125.342 E.01901
G1 X119.529 Y125.176 E.01901
G1 X119.661 Y125.169 E.00405
M204 S10000
G1 X120.566 Y124.775 F30000
M204 S5000
G1 F1200
G1 X120.584 Y124.777 E.00054
G1 X120.767 Y124.804 E.0057
G1 X121.358 Y125.008 E.01921
G1 X121.9 Y125.321 E.01921
G1 X122.372 Y125.73 E.01921
G1 X122.759 Y126.222 E.01921
G1 X123.046 Y126.778 E.01921
G1 X123.222 Y127.378 E.01921
G1 X123.281 Y128 E.01921
G1 X123.222 Y128.622 E.01921
G1 X123.046 Y129.222 E.01921
G1 X122.759 Y129.778 E.01921
G1 X122.372 Y130.27 E.01921
G1 X121.9 Y130.679 E.01921
G1 X121.358 Y130.992 E.01921
G1 X120.767 Y131.196 E.01921
G1 X120.149 Y131.285 E.01921
G1 X119.524 Y131.256 E.01921
G1 X118.916 Y131.108 E.01921
G1 X118.348 Y130.848 E.01921
G1 X117.838 Y130.486 E.01921
G1 X117.407 Y130.033 E.01921
G1 X117.069 Y129.507 E.01921
G1 X116.836 Y128.927 E.01921
G1 X116.718 Y128.313 E.01921
G1 X116.718 Y127.687 E.01921
G1 X116.836 Y127.073 E.01921
G1 X117.069 Y126.493 E.01921
G1 X117.407 Y125.967 E.01921
G1 X117.838 Y125.514 E.01921
G1 X118.348 Y125.152 E.01921
G1 X118.916 Y124.892 E.01921
G1 X119.524 Y124.744 E.01921
G1 X120.149 Y124.715 E.01921
G1 X120.507 Y124.766 E.01113
M204 S10000
; WIPE_START
G1 F24000
G1 X120.584 Y124.777 E-.02945
G1 X120.767 Y124.804 E-.07053
G1 X121.358 Y125.008 E-.23761
G1 X121.9 Y125.321 E-.23761
G1 X122.267 Y125.639 E-.1848
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I.333 J1.171 P1  F30000
G1 X138.518 Y121.023 Z2.2
G1 Z1.8
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X138.527 Y121.022 E.00025
G1 X138.945 Y121 E.01287
G1 X139.555 Y121.1 E.01901
G1 X140.13 Y121.329 E.01901
G1 X140.642 Y121.676 E.01901
G1 X141.068 Y122.125 E.01901
G1 X141.387 Y122.655 E.01901
G1 X141.584 Y123.242 E.01901
G1 X141.651 Y123.857 E.01901
G1 X141.584 Y124.472 E.01901
G1 X141.387 Y125.058 E.01901
G1 X141.068 Y125.588 E.01901
G1 X140.642 Y126.037 E.01901
G1 X140.13 Y126.385 E.01901
G1 X139.555 Y126.614 E.01901
G1 X138.945 Y126.714 E.01901
G1 X138.327 Y126.68 E.01901
G1 X137.731 Y126.515 E.01901
G1 X137.184 Y126.225 E.01901
G1 X136.713 Y125.824 E.01901
G1 X136.338 Y125.332 E.01901
G1 X136.078 Y124.77 E.01901
G1 X135.945 Y124.166 E.01901
G1 X135.945 Y123.547 E.01901
G1 X136.078 Y122.943 E.01901
G1 X136.338 Y122.382 E.01901
G1 X136.713 Y121.889 E.01901
G1 X137.184 Y121.489 E.01901
G1 X137.731 Y121.199 E.01901
G1 X138.327 Y121.033 E.01901
G1 X138.459 Y121.026 E.00405
M204 S10000
G1 X139.364 Y120.632 F30000
M204 S5000
G1 F1200
G1 X139.382 Y120.634 E.00054
G1 X139.565 Y120.66 E.0057
G1 X140.156 Y120.865 E.01921
G1 X140.698 Y121.178 E.01921
G1 X141.17 Y121.587 E.01921
G1 X141.557 Y122.079 E.01921
G1 X141.843 Y122.634 E.01921
G1 X142.02 Y123.234 E.01921
G1 X142.079 Y123.857 E.01921
G1 X142.02 Y124.479 E.01921
G1 X141.843 Y125.079 E.01921
G1 X141.557 Y125.635 E.01921
G1 X141.17 Y126.126 E.01921
G1 X140.698 Y126.536 E.01921
G1 X140.156 Y126.849 E.01921
G1 X139.565 Y127.053 E.01921
G1 X138.946 Y127.142 E.01921
G1 X138.322 Y127.112 E.01921
G1 X137.714 Y126.965 E.01921
G1 X137.145 Y126.705 E.01921
G1 X136.636 Y126.342 E.01921
G1 X136.205 Y125.89 E.01921
G1 X135.867 Y125.364 E.01921
G1 X135.634 Y124.783 E.01921
G1 X135.516 Y124.169 E.01921
G1 X135.516 Y123.544 E.01921
G1 X135.634 Y122.93 E.01921
G1 X135.867 Y122.35 E.01921
G1 X136.205 Y121.824 E.01921
G1 X136.636 Y121.371 E.01921
G1 X137.145 Y121.008 E.01921
G1 X137.714 Y120.749 E.01921
G1 X138.322 Y120.601 E.01921
G1 X138.946 Y120.571 E.01921
G1 X139.305 Y120.623 E.01113
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X139.382 Y120.634 E-.02945
G1 X139.565 Y120.66 E-.07053
G1 X140.156 Y120.865 E-.23761
G1 X140.698 Y121.178 E-.23761
G1 X141.065 Y121.496 E-.1848
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 10/27
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
G3 Z2.2 I.956 J-.753 P1  F30000
G1 X123.857 Y99.629 Z2.2
G1 Z2
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X123.864 Y99.629 E.00022
M73 P75 R2
G1 X124.261 Y99.607 E.01223
G1 X124.872 Y99.708 E.01901
G1 X125.447 Y99.937 E.01901
G1 X125.959 Y100.284 E.01901
G1 X126.384 Y100.733 E.01901
G1 X126.703 Y101.263 E.01901
G1 X126.901 Y101.849 E.01901
G1 X126.968 Y102.465 E.01901
G1 X126.901 Y103.08 E.01901
G1 X126.703 Y103.666 E.01901
G1 X126.384 Y104.196 E.01901
G1 X125.959 Y104.645 E.01901
G1 X125.447 Y104.992 E.01901
G1 X124.872 Y105.221 E.01901
G1 X124.261 Y105.322 E.01901
G1 X123.644 Y105.288 E.01901
G1 X123.047 Y105.123 E.01901
G1 X122.501 Y104.833 E.01901
G1 X122.198 Y104.575 E.01223
G1 X122.029 Y104.432 E.00678
G1 X121.655 Y103.94 E.01901
G1 X121.395 Y103.378 E.01901
G1 X121.262 Y102.774 E.01901
G1 X121.262 Y102.155 E.01901
G1 X121.395 Y101.551 E.01901
G1 X121.655 Y100.989 E.01901
G1 X122.029 Y100.497 E.01901
G1 X122.501 Y100.096 E.01901
G1 X123.047 Y99.807 E.01901
G1 X123.644 Y99.641 E.01901
G1 X123.797 Y99.633 E.00472
M204 S10000
G1 X124.652 Y99.235 F30000
M204 S5000
G1 F1200
G1 X124.674 Y99.238 E.00071
G1 X124.882 Y99.268 E.00645
G1 X125.473 Y99.473 E.01921
G1 X126.014 Y99.785 E.01921
G1 X126.487 Y100.195 E.01921
G1 X126.873 Y100.686 E.01921
G1 X127.16 Y101.242 E.01921
G1 X127.336 Y101.842 E.01921
G1 X127.396 Y102.465 E.01921
G1 X127.336 Y103.087 E.01921
G1 X127.16 Y103.687 E.01921
G1 X126.873 Y104.243 E.01921
G1 X126.487 Y104.734 E.01921
G1 X126.014 Y105.144 E.01921
G1 X125.473 Y105.456 E.01921
G1 X124.882 Y105.661 E.01921
G1 X124.263 Y105.75 E.01921
G1 X123.638 Y105.72 E.01921
G1 X123.031 Y105.573 E.01921
G1 X122.462 Y105.313 E.01921
G1 X121.953 Y104.95 E.01921
G1 X121.521 Y104.498 E.01921
G1 X121.183 Y103.972 E.01921
G1 X120.951 Y103.391 E.01921
G1 X120.832 Y102.777 E.01921
G1 X120.832 Y102.152 E.01921
G1 X120.951 Y101.538 E.01921
G1 X121.183 Y100.957 E.01921
G1 X121.521 Y100.431 E.01921
G1 X121.953 Y99.979 E.01921
G1 X122.462 Y99.616 E.01921
G1 X123.031 Y99.356 E.01921
G1 X123.638 Y99.209 E.01921
G1 X124.263 Y99.179 E.01921
G1 X124.592 Y99.227 E.01022
M204 S10000
; WIPE_START
G1 F24000
G1 X124.674 Y99.238 E-.03153
G1 X124.882 Y99.268 E-.07973
G1 X125.473 Y99.473 E-.23761
G1 X126.014 Y99.785 E-.23761
G1 X126.359 Y100.084 E-.17353
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-1.177 J-.31 P1  F30000
G1 X119.743 Y125.165 Z2.4
G1 Z2
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X119.75 Y125.165 E.00022
G1 X120.147 Y125.143 E.01223
G1 X120.758 Y125.243 E.01901
G1 X121.332 Y125.472 E.01901
G1 X121.844 Y125.819 E.01901
G1 X122.27 Y126.268 E.01901
G1 X122.589 Y126.799 E.01901
G1 X122.786 Y127.385 E.01901
G1 X122.853 Y128 E.01901
G1 X122.786 Y128.615 E.01901
G1 X122.589 Y129.201 E.01901
G1 X122.27 Y129.732 E.01901
G1 X121.844 Y130.181 E.01901
G1 X121.332 Y130.528 E.01901
G1 X120.758 Y130.757 E.01901
G1 X120.147 Y130.857 E.01901
G1 X119.529 Y130.824 E.01901
G1 X118.933 Y130.658 E.01901
G1 X118.386 Y130.368 E.01901
G1 X118.083 Y130.111 E.01223
G1 X117.915 Y129.968 E.00678
G1 X117.54 Y129.475 E.01901
G1 X117.281 Y128.914 E.01901
G1 X117.148 Y128.309 E.01901
G1 X117.148 Y127.691 E.01901
G1 X117.281 Y127.086 E.01901
G1 X117.54 Y126.525 E.01901
G1 X117.915 Y126.032 E.01901
G1 X118.386 Y125.632 E.01901
G1 X118.933 Y125.342 E.01901
G1 X119.529 Y125.176 E.01901
G1 X119.683 Y125.168 E.00472
M204 S10000
G1 X120.537 Y124.771 F30000
M204 S5000
G1 F1200
G1 X120.56 Y124.774 E.00071
G1 X120.767 Y124.804 E.00645
G1 X121.358 Y125.008 E.01921
G1 X121.9 Y125.321 E.01921
G1 X122.372 Y125.73 E.01921
G1 X122.759 Y126.222 E.01921
G1 X123.046 Y126.778 E.01921
G1 X123.222 Y127.378 E.01921
G1 X123.281 Y128 E.01921
G1 X123.222 Y128.622 E.01921
G1 X123.046 Y129.222 E.01921
G1 X122.759 Y129.778 E.01921
G1 X122.372 Y130.27 E.01921
G1 X121.9 Y130.679 E.01921
G1 X121.358 Y130.992 E.01921
G1 X120.767 Y131.196 E.01921
G1 X120.149 Y131.285 E.01921
G1 X119.524 Y131.256 E.01921
G1 X118.916 Y131.108 E.01921
G1 X118.348 Y130.848 E.01921
G1 X117.838 Y130.486 E.01921
G1 X117.407 Y130.033 E.01921
G1 X117.069 Y129.507 E.01921
G1 X116.836 Y128.927 E.01921
G1 X116.718 Y128.313 E.01921
G1 X116.718 Y127.687 E.01921
G1 X116.836 Y127.073 E.01921
G1 X117.069 Y126.493 E.01921
G1 X117.407 Y125.967 E.01921
G1 X117.838 Y125.514 E.01921
G1 X118.348 Y125.152 E.01921
G1 X118.916 Y124.892 E.01921
G1 X119.524 Y124.744 E.01921
G1 X120.149 Y124.715 E.01921
G1 X120.478 Y124.762 E.01022
M204 S10000
; WIPE_START
G1 F24000
G1 X120.56 Y124.774 E-.03153
G1 X120.767 Y124.804 E-.07973
G1 X121.358 Y125.008 E-.23761
G1 X121.9 Y125.321 E-.23761
G1 X122.245 Y125.62 E-.17353
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I.33 J1.171 P1  F30000
G1 X138.54 Y121.022 Z2.4
G1 Z2
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X138.548 Y121.021 E.00022
G1 X138.945 Y121 E.01223
G1 X139.555 Y121.1 E.01901
G1 X140.13 Y121.329 E.01901
G1 X140.642 Y121.676 E.01901
G1 X141.068 Y122.125 E.01901
G1 X141.387 Y122.655 E.01901
G1 X141.584 Y123.242 E.01901
G1 X141.651 Y123.857 E.01901
G1 X141.584 Y124.472 E.01901
G1 X141.387 Y125.058 E.01901
G1 X141.068 Y125.588 E.01901
G1 X140.642 Y126.037 E.01901
G1 X140.13 Y126.385 E.01901
G1 X139.555 Y126.614 E.01901
G1 X138.945 Y126.714 E.01901
G1 X138.327 Y126.68 E.01901
G1 X137.731 Y126.515 E.01901
G1 X137.184 Y126.225 E.01901
G1 X136.881 Y125.967 E.01223
G1 X136.713 Y125.824 E.00678
G1 X136.338 Y125.332 E.01901
G1 X136.078 Y124.77 E.01901
G1 X135.945 Y124.166 E.01901
G1 X135.945 Y123.547 E.01901
G1 X136.078 Y122.943 E.01901
G1 X136.338 Y122.382 E.01901
G1 X136.713 Y121.889 E.01901
G1 X137.184 Y121.489 E.01901
G1 X137.731 Y121.199 E.01901
G1 X138.327 Y121.033 E.01901
G1 X138.48 Y121.025 E.00472
M204 S10000
G1 X139.335 Y120.627 F30000
M204 S5000
G1 F1200
G1 X139.358 Y120.631 E.00071
G1 X139.565 Y120.66 E.00645
G1 X140.156 Y120.865 E.01921
G1 X140.698 Y121.178 E.01921
G1 X141.17 Y121.587 E.01921
M73 P76 R2
G1 X141.557 Y122.079 E.01921
G1 X141.843 Y122.634 E.01921
G1 X142.02 Y123.234 E.01921
G1 X142.079 Y123.857 E.01921
G1 X142.02 Y124.479 E.01921
G1 X141.843 Y125.079 E.01921
G1 X141.557 Y125.635 E.01921
G1 X141.17 Y126.126 E.01921
G1 X140.698 Y126.536 E.01921
G1 X140.156 Y126.849 E.01921
G1 X139.565 Y127.053 E.01921
G1 X138.946 Y127.142 E.01921
G1 X138.322 Y127.112 E.01921
G1 X137.714 Y126.965 E.01921
G1 X137.145 Y126.705 E.01921
G1 X136.636 Y126.342 E.01921
G1 X136.205 Y125.89 E.01921
G1 X135.867 Y125.364 E.01921
G1 X135.634 Y124.783 E.01921
G1 X135.516 Y124.169 E.01921
G1 X135.516 Y123.544 E.01921
G1 X135.634 Y122.93 E.01921
G1 X135.867 Y122.35 E.01921
G1 X136.205 Y121.824 E.01921
G1 X136.636 Y121.371 E.01921
G1 X137.145 Y121.008 E.01921
G1 X137.714 Y120.749 E.01921
G1 X138.322 Y120.601 E.01921
G1 X138.946 Y120.571 E.01921
G1 X139.276 Y120.619 E.01022
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 2.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X139.358 Y120.631 E-.03153
G1 X139.565 Y120.66 E-.07973
G1 X140.156 Y120.865 E-.23761
G1 X140.698 Y121.178 E-.23761
G1 X141.043 Y121.477 E-.17353
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 11/27
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
G3 Z2.4 I.957 J-.752 P1  F30000
G1 X123.879 Y99.628 Z2.4
G1 Z2.2
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X123.885 Y99.628 E.00019
G1 X124.261 Y99.607 E.01159
G1 X124.872 Y99.708 E.01901
G1 X125.447 Y99.937 E.01901
G1 X125.959 Y100.284 E.01901
G1 X126.384 Y100.733 E.01901
G1 X126.703 Y101.263 E.01901
G1 X126.901 Y101.849 E.01901
G1 X126.968 Y102.465 E.01901
G1 X126.901 Y103.08 E.01901
G1 X126.703 Y103.666 E.01901
G1 X126.384 Y104.196 E.01901
G1 X125.959 Y104.645 E.01901
G1 X125.447 Y104.992 E.01901
G1 X124.872 Y105.221 E.01901
G1 X124.261 Y105.322 E.01901
G1 X123.644 Y105.288 E.01901
G1 X123.047 Y105.123 E.01901
G1 X122.501 Y104.833 E.01901
G1 X122.029 Y104.432 E.01901
G1 X121.655 Y103.94 E.01901
G1 X121.395 Y103.378 E.01901
G1 X121.262 Y102.774 E.01901
G1 X121.262 Y102.155 E.01901
G1 X121.395 Y101.551 E.01901
G1 X121.655 Y100.989 E.01901
G1 X122.029 Y100.497 E.01901
G1 X122.501 Y100.096 E.01901
G1 X123.047 Y99.807 E.01901
G1 X123.644 Y99.641 E.01901
G1 X123.819 Y99.631 E.00539
M204 S10000
G1 X124.622 Y99.231 F30000
M204 S5000
G1 F1200
G1 X124.65 Y99.235 E.00087
G1 X124.882 Y99.268 E.00719
G1 X125.473 Y99.473 E.01921
G1 X126.014 Y99.785 E.01921
G1 X126.487 Y100.195 E.01921
G1 X126.873 Y100.686 E.01921
G1 X127.16 Y101.242 E.01921
G1 X127.336 Y101.842 E.01921
G1 X127.396 Y102.465 E.01921
G1 X127.336 Y103.087 E.01921
G1 X127.16 Y103.687 E.01921
G1 X126.873 Y104.243 E.01921
G1 X126.487 Y104.734 E.01921
G1 X126.014 Y105.144 E.01921
G1 X125.473 Y105.456 E.01921
G1 X124.882 Y105.661 E.01921
G1 X124.263 Y105.75 E.01921
G1 X123.638 Y105.72 E.01921
G1 X123.031 Y105.573 E.01921
G1 X122.462 Y105.313 E.01921
G1 X121.953 Y104.95 E.01921
G1 X121.521 Y104.498 E.01921
G1 X121.183 Y103.972 E.01921
G1 X120.951 Y103.391 E.01921
G1 X120.832 Y102.777 E.01921
G1 X120.832 Y102.152 E.01921
G1 X120.951 Y101.538 E.01921
G1 X121.183 Y100.957 E.01921
G1 X121.521 Y100.431 E.01921
G1 X121.953 Y99.979 E.01921
G1 X122.462 Y99.616 E.01921
G1 X123.031 Y99.356 E.01921
G1 X123.638 Y99.209 E.01921
G1 X124.263 Y99.179 E.01921
G1 X124.563 Y99.222 E.00931
M204 S10000
; WIPE_START
G1 F24000
G1 X124.65 Y99.235 E-.03361
G1 X124.882 Y99.268 E-.08892
G1 X125.473 Y99.473 E-.23761
G1 X126.014 Y99.785 E-.23761
G1 X126.337 Y100.065 E-.16225
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I-1.177 J-.308 P1  F30000
G1 X119.764 Y125.164 Z2.6
G1 Z2.2
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X119.77 Y125.163 E.00019
G1 X120.147 Y125.143 E.01159
G1 X120.758 Y125.243 E.01901
G1 X121.332 Y125.472 E.01901
G1 X121.844 Y125.819 E.01901
G1 X122.27 Y126.268 E.01901
G1 X122.589 Y126.799 E.01901
G1 X122.786 Y127.385 E.01901
G1 X122.853 Y128 E.01901
G1 X122.786 Y128.615 E.01901
G1 X122.589 Y129.201 E.01901
G1 X122.27 Y129.732 E.01901
G1 X121.844 Y130.181 E.01901
G1 X121.332 Y130.528 E.01901
G1 X120.758 Y130.757 E.01901
G1 X120.147 Y130.857 E.01901
G1 X119.529 Y130.824 E.01901
G1 X118.933 Y130.658 E.01901
G1 X118.386 Y130.368 E.01901
G1 X117.915 Y129.968 E.01901
G1 X117.54 Y129.475 E.01901
G1 X117.281 Y128.914 E.01901
G1 X117.148 Y128.309 E.01901
G1 X117.148 Y127.691 E.01901
G1 X117.281 Y127.086 E.01901
G1 X117.54 Y126.525 E.01901
G1 X117.915 Y126.032 E.01901
G1 X118.386 Y125.632 E.01901
G1 X118.933 Y125.342 E.01901
G1 X119.529 Y125.176 E.01901
G1 X119.704 Y125.167 E.00539
M204 S10000
G1 X120.508 Y124.766 F30000
M204 S5000
G1 F1200
G1 X120.536 Y124.77 E.00087
G1 X120.767 Y124.804 E.00719
G1 X121.358 Y125.008 E.01921
G1 X121.9 Y125.321 E.01921
G1 X122.372 Y125.73 E.01921
G1 X122.759 Y126.222 E.01921
G1 X123.046 Y126.778 E.01921
G1 X123.222 Y127.378 E.01921
G1 X123.281 Y128 E.01921
G1 X123.222 Y128.622 E.01921
G1 X123.046 Y129.222 E.01921
G1 X122.759 Y129.778 E.01921
G1 X122.372 Y130.27 E.01921
G1 X121.9 Y130.679 E.01921
G1 X121.358 Y130.992 E.01921
G1 X120.767 Y131.196 E.01921
G1 X120.149 Y131.285 E.01921
G1 X119.524 Y131.256 E.01921
G1 X118.916 Y131.108 E.01921
G1 X118.348 Y130.848 E.01921
G1 X117.838 Y130.486 E.01921
G1 X117.407 Y130.033 E.01921
G1 X117.069 Y129.507 E.01921
G1 X116.836 Y128.927 E.01921
G1 X116.718 Y128.313 E.01921
G1 X116.718 Y127.687 E.01921
G1 X116.836 Y127.073 E.01921
G1 X117.069 Y126.493 E.01921
G1 X117.407 Y125.967 E.01921
G1 X117.838 Y125.514 E.01921
G1 X118.348 Y125.152 E.01921
G1 X118.916 Y124.892 E.01921
G1 X119.524 Y124.744 E.01921
G1 X120.149 Y124.715 E.01921
G1 X120.448 Y124.758 E.00931
M204 S10000
; WIPE_START
G1 F24000
G1 X120.536 Y124.77 E-.03361
G1 X120.767 Y124.804 E-.08892
G1 X121.358 Y125.008 E-.23761
G1 X121.9 Y125.321 E-.23761
G1 X122.223 Y125.6 E-.16225
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I.328 J1.172 P1  F30000
G1 X138.562 Y121.02 Z2.6
G1 Z2.2
G1 E.8 F1800
M204 S5000
G1 F1200
M73 P77 R2
G1 X138.568 Y121.02 E.00019
G1 X138.945 Y121 E.01159
G1 X139.555 Y121.1 E.01901
G1 X140.13 Y121.329 E.01901
G1 X140.642 Y121.676 E.01901
G1 X141.068 Y122.125 E.01901
G1 X141.387 Y122.655 E.01901
G1 X141.584 Y123.242 E.01901
G1 X141.651 Y123.857 E.01901
G1 X141.584 Y124.472 E.01901
G1 X141.387 Y125.058 E.01901
G1 X141.068 Y125.588 E.01901
G1 X140.642 Y126.037 E.01901
G1 X140.13 Y126.385 E.01901
G1 X139.555 Y126.614 E.01901
G1 X138.945 Y126.714 E.01901
G1 X138.327 Y126.68 E.01901
G1 X137.731 Y126.515 E.01901
G1 X137.184 Y126.225 E.01901
G1 X136.713 Y125.824 E.01901
G1 X136.338 Y125.332 E.01901
G1 X136.078 Y124.77 E.01901
G1 X135.945 Y124.166 E.01901
G1 X135.945 Y123.547 E.01901
G1 X136.078 Y122.943 E.01901
G1 X136.338 Y122.382 E.01901
G1 X136.713 Y121.889 E.01901
G1 X137.184 Y121.489 E.01901
G1 X137.731 Y121.199 E.01901
G1 X138.327 Y121.033 E.01901
G1 X138.502 Y121.024 E.00539
M204 S10000
G1 X139.306 Y120.623 F30000
M204 S5000
G1 F1200
G1 X139.334 Y120.627 E.00087
G1 X139.565 Y120.66 E.00719
G1 X140.156 Y120.865 E.01921
G1 X140.698 Y121.178 E.01921
G1 X141.17 Y121.587 E.01921
G1 X141.557 Y122.079 E.01921
G1 X141.843 Y122.634 E.01921
G1 X142.02 Y123.234 E.01921
G1 X142.079 Y123.857 E.01921
G1 X142.02 Y124.479 E.01921
G1 X141.843 Y125.079 E.01921
G1 X141.557 Y125.635 E.01921
G1 X141.17 Y126.126 E.01921
G1 X140.698 Y126.536 E.01921
G1 X140.156 Y126.849 E.01921
G1 X139.565 Y127.053 E.01921
G1 X138.946 Y127.142 E.01921
G1 X138.322 Y127.112 E.01921
G1 X137.714 Y126.965 E.01921
G1 X137.145 Y126.705 E.01921
G1 X136.636 Y126.342 E.01921
G1 X136.205 Y125.89 E.01921
G1 X135.867 Y125.364 E.01921
G1 X135.634 Y124.783 E.01921
G1 X135.516 Y124.169 E.01921
G1 X135.516 Y123.544 E.01921
G1 X135.634 Y122.93 E.01921
G1 X135.867 Y122.35 E.01921
G1 X136.205 Y121.824 E.01921
G1 X136.636 Y121.371 E.01921
G1 X137.145 Y121.008 E.01921
G1 X137.714 Y120.749 E.01921
G1 X138.322 Y120.601 E.01921
G1 X138.946 Y120.571 E.01921
G1 X139.246 Y120.615 E.00931
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 2.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X139.334 Y120.627 E-.03361
G1 X139.565 Y120.66 E-.08892
G1 X140.156 Y120.865 E-.23761
G1 X140.698 Y121.178 E-.23761
G1 X141.02 Y121.457 E-.16225
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 12/27
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
G3 Z2.6 I.958 J-.751 P1  F30000
G1 X123.901 Y99.627 Z2.6
G1 Z2.4
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X123.906 Y99.627 E.00014
G1 X124.261 Y99.607 E.01095
G1 X124.872 Y99.708 E.01901
G1 X125.447 Y99.937 E.01901
G1 X125.959 Y100.284 E.01901
G1 X126.384 Y100.733 E.01901
G1 X126.703 Y101.263 E.01901
G1 X126.901 Y101.849 E.01901
G1 X126.968 Y102.465 E.01901
G1 X126.901 Y103.08 E.01901
G1 X126.703 Y103.666 E.01901
G1 X126.384 Y104.196 E.01901
G1 X125.959 Y104.645 E.01901
G1 X125.447 Y104.992 E.01901
G1 X124.872 Y105.221 E.01901
G1 X124.261 Y105.322 E.01901
G1 X123.644 Y105.288 E.01901
G1 X123.047 Y105.123 E.01901
G1 X122.501 Y104.833 E.01901
G1 X122.029 Y104.432 E.01901
G1 X121.655 Y103.94 E.01901
G1 X121.395 Y103.378 E.01901
G1 X121.262 Y102.774 E.01901
G1 X121.262 Y102.155 E.01901
G1 X121.395 Y101.551 E.01901
G1 X121.655 Y100.989 E.01901
G1 X122.029 Y100.497 E.01901
G1 X122.501 Y100.096 E.01901
G1 X123.047 Y99.807 E.01901
G1 X123.644 Y99.641 E.01901
G1 X123.841 Y99.63 E.00608
M204 S10000
G1 X124.592 Y99.227 F30000
M204 S5000
G1 F1200
G1 X124.626 Y99.231 E.00106
G1 X124.882 Y99.268 E.00793
G1 X125.473 Y99.473 E.01921
G1 X126.014 Y99.785 E.01921
G1 X126.487 Y100.195 E.01921
G1 X126.873 Y100.686 E.01921
G1 X127.16 Y101.242 E.01921
G1 X127.336 Y101.842 E.01921
G1 X127.396 Y102.465 E.01921
G1 X127.336 Y103.087 E.01921
G1 X127.16 Y103.687 E.01921
G1 X126.873 Y104.243 E.01921
G1 X126.487 Y104.734 E.01921
G1 X126.014 Y105.144 E.01921
G1 X125.473 Y105.456 E.01921
G1 X124.882 Y105.661 E.01921
G1 X124.263 Y105.75 E.01921
G1 X123.638 Y105.72 E.01921
G1 X123.031 Y105.573 E.01921
G1 X122.462 Y105.313 E.01921
G1 X121.953 Y104.95 E.01921
G1 X121.521 Y104.498 E.01921
G1 X121.183 Y103.972 E.01921
G1 X120.951 Y103.391 E.01921
G1 X120.832 Y102.777 E.01921
G1 X120.832 Y102.152 E.01921
G1 X120.951 Y101.538 E.01921
G1 X121.183 Y100.957 E.01921
G1 X121.521 Y100.431 E.01921
G1 X121.953 Y99.979 E.01921
G1 X122.462 Y99.616 E.01921
G1 X123.031 Y99.356 E.01921
G1 X123.638 Y99.209 E.01921
G1 X124.263 Y99.179 E.01921
G1 X124.533 Y99.218 E.00837
M204 S10000
; WIPE_START
G1 F24000
G1 X124.626 Y99.231 E-.03597
G1 X124.882 Y99.268 E-.09812
G1 X125.473 Y99.473 E-.23761
G1 X126.014 Y99.785 E-.23761
G1 X126.314 Y100.045 E-.1507
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I-1.178 J-.306 P1  F30000
G1 X119.787 Y125.162 Z2.8
G1 Z2.4
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X119.791 Y125.162 E.00014
G1 X120.147 Y125.143 E.01095
G1 X120.758 Y125.243 E.01901
G1 X121.332 Y125.472 E.01901
G1 X121.844 Y125.819 E.01901
G1 X122.27 Y126.268 E.01901
G1 X122.589 Y126.799 E.01901
G1 X122.786 Y127.385 E.01901
G1 X122.853 Y128 E.01901
G1 X122.786 Y128.615 E.01901
G1 X122.589 Y129.201 E.01901
G1 X122.27 Y129.732 E.01901
G1 X121.844 Y130.181 E.01901
G1 X121.332 Y130.528 E.01901
G1 X120.758 Y130.757 E.01901
G1 X120.147 Y130.857 E.01901
G1 X119.529 Y130.824 E.01901
G1 X118.933 Y130.658 E.01901
G1 X118.386 Y130.368 E.01901
G1 X117.915 Y129.968 E.01901
G1 X117.54 Y129.475 E.01901
G1 X117.281 Y128.914 E.01901
G1 X117.148 Y128.309 E.01901
G1 X117.148 Y127.691 E.01901
G1 X117.281 Y127.086 E.01901
G1 X117.54 Y126.525 E.01901
G1 X117.915 Y126.032 E.01901
G1 X118.386 Y125.632 E.01901
G1 X118.933 Y125.342 E.01901
G1 X119.529 Y125.176 E.01901
G1 X119.727 Y125.166 E.00608
M204 S10000
G1 X120.478 Y124.762 F30000
M204 S5000
G1 F1200
G1 X120.512 Y124.767 E.00106
G1 X120.767 Y124.804 E.00793
G1 X121.358 Y125.008 E.01921
G1 X121.9 Y125.321 E.01921
G1 X122.372 Y125.73 E.01921
G1 X122.759 Y126.222 E.01921
M73 P78 R2
G1 X123.046 Y126.778 E.01921
G1 X123.222 Y127.378 E.01921
G1 X123.281 Y128 E.01921
G1 X123.222 Y128.622 E.01921
G1 X123.046 Y129.222 E.01921
G1 X122.759 Y129.778 E.01921
G1 X122.372 Y130.27 E.01921
G1 X121.9 Y130.679 E.01921
G1 X121.358 Y130.992 E.01921
G1 X120.767 Y131.196 E.01921
G1 X120.149 Y131.285 E.01921
G1 X119.524 Y131.256 E.01921
G1 X118.916 Y131.108 E.01921
G1 X118.348 Y130.848 E.01921
G1 X117.838 Y130.486 E.01921
G1 X117.407 Y130.033 E.01921
G1 X117.069 Y129.507 E.01921
G1 X116.836 Y128.927 E.01921
G1 X116.718 Y128.313 E.01921
G1 X116.718 Y127.687 E.01921
G1 X116.836 Y127.073 E.01921
G1 X117.069 Y126.493 E.01921
G1 X117.407 Y125.967 E.01921
G1 X117.838 Y125.514 E.01921
G1 X118.348 Y125.152 E.01921
G1 X118.916 Y124.892 E.01921
G1 X119.524 Y124.744 E.01921
G1 X120.149 Y124.715 E.01921
G1 X120.418 Y124.753 E.00837
M204 S10000
; WIPE_START
G1 F24000
G1 X120.512 Y124.767 E-.03597
G1 X120.767 Y124.804 E-.09812
G1 X121.358 Y125.008 E-.23761
G1 X121.9 Y125.321 E-.23761
G1 X122.2 Y125.581 E-.1507
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I.326 J1.172 P1  F30000
G1 X138.585 Y121.019 Z2.8
G1 Z2.4
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X138.589 Y121.019 E.00014
G1 X138.945 Y121 E.01095
G1 X139.555 Y121.1 E.01901
G1 X140.13 Y121.329 E.01901
G1 X140.642 Y121.676 E.01901
G1 X141.068 Y122.125 E.01901
G1 X141.387 Y122.655 E.01901
G1 X141.584 Y123.242 E.01901
G1 X141.651 Y123.857 E.01901
G1 X141.584 Y124.472 E.01901
G1 X141.387 Y125.058 E.01901
G1 X141.068 Y125.588 E.01901
G1 X140.642 Y126.037 E.01901
G1 X140.13 Y126.385 E.01901
G1 X139.555 Y126.614 E.01901
G1 X138.945 Y126.714 E.01901
G1 X138.327 Y126.68 E.01901
G1 X137.731 Y126.515 E.01901
G1 X137.184 Y126.225 E.01901
G1 X136.713 Y125.824 E.01901
G1 X136.338 Y125.332 E.01901
G1 X136.078 Y124.77 E.01901
G1 X135.945 Y124.166 E.01901
G1 X135.945 Y123.547 E.01901
G1 X136.078 Y122.943 E.01901
G1 X136.338 Y122.382 E.01901
G1 X136.713 Y121.889 E.01901
M73 P78 R1
G1 X137.184 Y121.489 E.01901
G1 X137.731 Y121.199 E.01901
G1 X138.327 Y121.033 E.01901
G1 X138.525 Y121.023 E.00608
M204 S10000
G1 X139.275 Y120.619 F30000
M204 S5000
G1 F1200
G1 X139.31 Y120.624 E.00106
G1 X139.565 Y120.66 E.00793
G1 X140.156 Y120.865 E.01921
G1 X140.698 Y121.178 E.01921
G1 X141.17 Y121.587 E.01921
G1 X141.557 Y122.079 E.01921
G1 X141.843 Y122.634 E.01921
G1 X142.02 Y123.234 E.01921
G1 X142.079 Y123.857 E.01921
G1 X142.02 Y124.479 E.01921
G1 X141.843 Y125.079 E.01921
G1 X141.557 Y125.635 E.01921
G1 X141.17 Y126.126 E.01921
G1 X140.698 Y126.536 E.01921
G1 X140.156 Y126.849 E.01921
G1 X139.565 Y127.053 E.01921
G1 X138.946 Y127.142 E.01921
G1 X138.322 Y127.112 E.01921
G1 X137.714 Y126.965 E.01921
G1 X137.145 Y126.705 E.01921
G1 X136.636 Y126.342 E.01921
G1 X136.205 Y125.89 E.01921
G1 X135.867 Y125.364 E.01921
G1 X135.634 Y124.783 E.01921
G1 X135.516 Y124.169 E.01921
G1 X135.516 Y123.544 E.01921
G1 X135.634 Y122.93 E.01921
G1 X135.867 Y122.35 E.01921
G1 X136.205 Y121.824 E.01921
G1 X136.636 Y121.371 E.01921
G1 X137.145 Y121.008 E.01921
G1 X137.714 Y120.749 E.01921
G1 X138.322 Y120.601 E.01921
G1 X138.946 Y120.571 E.01921
G1 X139.216 Y120.61 E.00837
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 2.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X139.31 Y120.624 E-.03597
G1 X139.565 Y120.66 E-.09812
G1 X140.156 Y120.865 E-.23761
G1 X140.698 Y121.178 E-.23761
G1 X140.997 Y121.437 E-.1507
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 13/27
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
G3 Z2.8 I.958 J-.75 P1  F30000
G1 X123.924 Y99.626 Z2.8
G1 Z2.6
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X123.926 Y99.626 E.00009
G1 X124.261 Y99.607 E.01031
G1 X124.872 Y99.708 E.01901
G1 X125.447 Y99.937 E.01901
G1 X125.959 Y100.284 E.01901
G1 X126.384 Y100.733 E.01901
G1 X126.703 Y101.263 E.01901
G1 X126.901 Y101.849 E.01901
G1 X126.968 Y102.465 E.01901
G1 X126.901 Y103.08 E.01901
G1 X126.703 Y103.666 E.01901
G1 X126.384 Y104.196 E.01901
G1 X125.959 Y104.645 E.01901
G1 X125.447 Y104.992 E.01901
G1 X124.872 Y105.221 E.01901
G1 X124.261 Y105.322 E.01901
G1 X123.644 Y105.288 E.01901
G1 X123.047 Y105.123 E.01901
G1 X122.501 Y104.833 E.01901
G1 X122.029 Y104.432 E.01901
G1 X121.655 Y103.94 E.01901
G1 X121.395 Y103.378 E.01901
G1 X121.262 Y102.774 E.01901
G1 X121.262 Y102.155 E.01901
G1 X121.395 Y101.551 E.01901
G1 X121.655 Y100.989 E.01901
G1 X122.029 Y100.497 E.01901
G1 X122.501 Y100.096 E.01901
G1 X123.047 Y99.807 E.01901
G1 X123.644 Y99.641 E.01901
G1 X123.864 Y99.629 E.00677
M204 S10000
G1 X124.561 Y99.222 F30000
M204 S5000
G1 F1200
G1 X124.602 Y99.228 E.00128
G1 X124.882 Y99.268 E.00868
G1 X125.473 Y99.473 E.01921
G1 X126.014 Y99.785 E.01921
G1 X126.487 Y100.195 E.01921
G1 X126.873 Y100.686 E.01921
G1 X127.16 Y101.242 E.01921
G1 X127.336 Y101.842 E.01921
G1 X127.396 Y102.465 E.01921
G1 X127.336 Y103.087 E.01921
G1 X127.16 Y103.687 E.01921
G1 X126.873 Y104.243 E.01921
G1 X126.487 Y104.734 E.01921
G1 X126.014 Y105.144 E.01921
G1 X125.473 Y105.456 E.01921
G1 X124.882 Y105.661 E.01921
G1 X124.263 Y105.75 E.01921
G1 X123.638 Y105.72 E.01921
G1 X123.031 Y105.573 E.01921
G1 X122.462 Y105.313 E.01921
G1 X121.953 Y104.95 E.01921
G1 X121.521 Y104.498 E.01921
G1 X121.183 Y103.972 E.01921
G1 X120.951 Y103.391 E.01921
G1 X120.832 Y102.777 E.01921
G1 X120.832 Y102.152 E.01921
G1 X120.951 Y101.538 E.01921
G1 X121.183 Y100.957 E.01921
G1 X121.521 Y100.431 E.01921
G1 X121.953 Y99.979 E.01921
G1 X122.462 Y99.616 E.01921
G1 X123.031 Y99.356 E.01921
G1 X123.638 Y99.209 E.01921
G1 X124.263 Y99.179 E.01921
G1 X124.502 Y99.214 E.00741
M204 S10000
; WIPE_START
G1 F24000
G1 X124.602 Y99.228 E-.03868
G1 X124.882 Y99.268 E-.10731
G1 X125.473 Y99.473 E-.23761
G1 X126.014 Y99.785 E-.23761
G1 X126.29 Y100.025 E-.1388
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I-1.178 J-.304 P1  F30000
G1 X119.809 Y125.161 Z3
G1 Z2.6
G1 E.8 F1800
M204 S5000
G1 F1200
M73 P79 R1
G1 X119.812 Y125.161 E.00009
G1 X120.147 Y125.143 E.01031
G1 X120.758 Y125.243 E.01901
G1 X121.332 Y125.472 E.01901
G1 X121.844 Y125.819 E.01901
G1 X122.27 Y126.268 E.01901
G1 X122.589 Y126.799 E.01901
G1 X122.786 Y127.385 E.01901
G1 X122.853 Y128 E.01901
G1 X122.786 Y128.615 E.01901
G1 X122.589 Y129.201 E.01901
G1 X122.27 Y129.732 E.01901
G1 X121.844 Y130.181 E.01901
G1 X121.332 Y130.528 E.01901
G1 X120.758 Y130.757 E.01901
G1 X120.147 Y130.857 E.01901
G1 X119.529 Y130.824 E.01901
G1 X118.933 Y130.658 E.01901
G1 X118.386 Y130.368 E.01901
G1 X117.915 Y129.968 E.01901
G1 X117.54 Y129.475 E.01901
G1 X117.281 Y128.914 E.01901
G1 X117.148 Y128.309 E.01901
G1 X117.148 Y127.691 E.01901
G1 X117.281 Y127.086 E.01901
G1 X117.54 Y126.525 E.01901
G1 X117.915 Y126.032 E.01901
G1 X118.386 Y125.632 E.01901
G1 X118.933 Y125.342 E.01901
G1 X119.529 Y125.176 E.01901
G1 X119.749 Y125.165 E.00677
M204 S10000
G1 X120.447 Y124.758 F30000
M204 S5000
G1 F1200
G1 X120.488 Y124.763 E.00128
G1 X120.767 Y124.804 E.00868
G1 X121.358 Y125.008 E.01921
G1 X121.9 Y125.321 E.01921
G1 X122.372 Y125.73 E.01921
G1 X122.759 Y126.222 E.01921
G1 X123.046 Y126.778 E.01921
G1 X123.222 Y127.378 E.01921
G1 X123.281 Y128 E.01921
G1 X123.222 Y128.622 E.01921
G1 X123.046 Y129.222 E.01921
G1 X122.759 Y129.778 E.01921
G1 X122.372 Y130.27 E.01921
G1 X121.9 Y130.679 E.01921
G1 X121.358 Y130.992 E.01921
G1 X120.767 Y131.196 E.01921
G1 X120.149 Y131.285 E.01921
G1 X119.524 Y131.256 E.01921
G1 X118.916 Y131.108 E.01921
G1 X118.348 Y130.848 E.01921
G1 X117.838 Y130.486 E.01921
G1 X117.407 Y130.033 E.01921
G1 X117.069 Y129.507 E.01921
G1 X116.836 Y128.927 E.01921
G1 X116.718 Y128.313 E.01921
G1 X116.718 Y127.687 E.01921
G1 X116.836 Y127.073 E.01921
G1 X117.069 Y126.493 E.01921
G1 X117.407 Y125.967 E.01921
G1 X117.838 Y125.514 E.01921
G1 X118.348 Y125.152 E.01921
G1 X118.916 Y124.892 E.01921
G1 X119.524 Y124.744 E.01921
G1 X120.149 Y124.715 E.01921
G1 X120.387 Y124.749 E.00741
M204 S10000
; WIPE_START
G1 F24000
G1 X120.488 Y124.763 E-.03868
G1 X120.767 Y124.804 E-.10731
G1 X121.358 Y125.008 E-.23761
G1 X121.9 Y125.321 E-.23761
G1 X122.176 Y125.56 E-.1388
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I.324 J1.173 P1  F30000
G1 X138.607 Y121.018 Z3
G1 Z2.6
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X138.61 Y121.018 E.00009
G1 X138.945 Y121 E.01031
G1 X139.555 Y121.1 E.01901
G1 X140.13 Y121.329 E.01901
G1 X140.642 Y121.676 E.01901
G1 X141.068 Y122.125 E.01901
G1 X141.387 Y122.655 E.01901
G1 X141.584 Y123.242 E.01901
G1 X141.651 Y123.857 E.01901
G1 X141.584 Y124.472 E.01901
G1 X141.387 Y125.058 E.01901
G1 X141.068 Y125.588 E.01901
G1 X140.642 Y126.037 E.01901
G1 X140.13 Y126.385 E.01901
G1 X139.555 Y126.614 E.01901
G1 X138.945 Y126.714 E.01901
G1 X138.327 Y126.68 E.01901
G1 X137.731 Y126.515 E.01901
G1 X137.184 Y126.225 E.01901
G1 X136.713 Y125.824 E.01901
G1 X136.338 Y125.332 E.01901
G1 X136.078 Y124.77 E.01901
G1 X135.945 Y124.166 E.01901
G1 X135.945 Y123.547 E.01901
G1 X136.078 Y122.943 E.01901
G1 X136.338 Y122.382 E.01901
G1 X136.713 Y121.889 E.01901
G1 X137.184 Y121.489 E.01901
G1 X137.731 Y121.199 E.01901
G1 X138.327 Y121.033 E.01901
G1 X138.547 Y121.021 E.00677
M204 S10000
G1 X139.244 Y120.614 F30000
M204 S5000
G1 F1200
G1 X139.286 Y120.62 E.00128
G1 X139.565 Y120.66 E.00868
G1 X140.156 Y120.865 E.01921
G1 X140.698 Y121.178 E.01921
G1 X141.17 Y121.587 E.01921
G1 X141.557 Y122.079 E.01921
G1 X141.843 Y122.634 E.01921
G1 X142.02 Y123.234 E.01921
G1 X142.079 Y123.857 E.01921
G1 X142.02 Y124.479 E.01921
G1 X141.843 Y125.079 E.01921
G1 X141.557 Y125.635 E.01921
G1 X141.17 Y126.126 E.01921
G1 X140.698 Y126.536 E.01921
G1 X140.156 Y126.849 E.01921
G1 X139.565 Y127.053 E.01921
G1 X138.946 Y127.142 E.01921
G1 X138.322 Y127.112 E.01921
G1 X137.714 Y126.965 E.01921
G1 X137.145 Y126.705 E.01921
G1 X136.636 Y126.342 E.01921
G1 X136.205 Y125.89 E.01921
G1 X135.867 Y125.364 E.01921
G1 X135.634 Y124.783 E.01921
G1 X135.516 Y124.169 E.01921
G1 X135.516 Y123.544 E.01921
G1 X135.634 Y122.93 E.01921
G1 X135.867 Y122.35 E.01921
G1 X136.205 Y121.824 E.01921
G1 X136.636 Y121.371 E.01921
G1 X137.145 Y121.008 E.01921
G1 X137.714 Y120.749 E.01921
G1 X138.322 Y120.601 E.01921
G1 X138.946 Y120.571 E.01921
G1 X139.185 Y120.606 E.00741
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 2.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X139.286 Y120.62 E-.03868
G1 X139.565 Y120.66 E-.10731
G1 X140.156 Y120.865 E-.23761
G1 X140.698 Y121.178 E-.23761
G1 X140.974 Y121.417 E-.1388
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 14/27
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
G3 Z3 I.959 J-.749 P1  F30000
G1 X123.946 Y99.625 Z3
G1 Z2.8
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X123.947 Y99.625 E.00003
G1 X124.261 Y99.607 E.00967
G1 X124.872 Y99.708 E.01901
G1 X125.447 Y99.937 E.01901
G1 X125.959 Y100.284 E.01901
G1 X126.384 Y100.733 E.01901
G1 X126.703 Y101.263 E.01901
G1 X126.901 Y101.849 E.01901
G1 X126.968 Y102.465 E.01901
G1 X126.901 Y103.08 E.01901
G1 X126.703 Y103.666 E.01901
G1 X126.384 Y104.196 E.01901
G1 X126.168 Y104.424 E.00967
G1 X125.959 Y104.645 E.00935
G1 X125.447 Y104.992 E.01901
G1 X124.872 Y105.221 E.01901
G1 X124.261 Y105.322 E.01901
G1 X123.644 Y105.288 E.01901
G1 X123.047 Y105.123 E.01901
G1 X122.501 Y104.833 E.01901
G1 X122.029 Y104.432 E.01901
G1 X121.655 Y103.94 E.01901
G1 X121.395 Y103.378 E.01901
G1 X121.262 Y102.774 E.01901
G1 X121.262 Y102.155 E.01901
G1 X121.395 Y101.551 E.01901
G1 X121.655 Y100.989 E.01901
G1 X122.029 Y100.497 E.01901
G1 X122.501 Y100.096 E.01901
G1 X123.047 Y99.807 E.01901
G1 X123.644 Y99.641 E.01901
G1 X123.886 Y99.628 E.00747
M204 S10000
G1 X124.53 Y99.218 F30000
M204 S5000
G1 F1200
G1 X124.578 Y99.225 E.00149
G1 X124.882 Y99.268 E.00942
G1 X125.473 Y99.473 E.01921
G1 X126.014 Y99.785 E.01921
M73 P80 R1
G1 X126.487 Y100.195 E.01921
G1 X126.873 Y100.686 E.01921
G1 X127.16 Y101.242 E.01921
G1 X127.336 Y101.842 E.01921
G1 X127.396 Y102.465 E.01921
G1 X127.336 Y103.087 E.01921
G1 X127.16 Y103.687 E.01921
G1 X126.873 Y104.243 E.01921
G1 X126.487 Y104.734 E.01921
G1 X126.014 Y105.144 E.01921
G1 X125.473 Y105.456 E.01921
G1 X124.882 Y105.661 E.01921
G1 X124.263 Y105.75 E.01921
G1 X123.638 Y105.72 E.01921
G1 X123.031 Y105.573 E.01921
G1 X122.462 Y105.313 E.01921
G1 X121.953 Y104.95 E.01921
G1 X121.521 Y104.498 E.01921
G1 X121.183 Y103.972 E.01921
G1 X120.951 Y103.391 E.01921
G1 X120.832 Y102.777 E.01921
G1 X120.832 Y102.152 E.01921
G1 X120.951 Y101.538 E.01921
G1 X121.183 Y100.957 E.01921
G1 X121.521 Y100.431 E.01921
G1 X121.953 Y99.979 E.01921
G1 X122.462 Y99.616 E.01921
G1 X123.031 Y99.356 E.01921
G1 X123.638 Y99.209 E.01921
G1 X124.263 Y99.179 E.01921
G1 X124.471 Y99.209 E.00646
M204 S10000
; WIPE_START
G1 F24000
G1 X124.578 Y99.225 E-.04122
G1 X124.882 Y99.268 E-.11651
G1 X125.473 Y99.473 E-.23761
G1 X126.014 Y99.785 E-.23761
G1 X126.267 Y100.004 E-.12706
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I-1.179 J-.302 P1  F30000
G1 X119.832 Y125.16 Z3.2
G1 Z2.8
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X119.833 Y125.16 E.00003
G1 X120.147 Y125.143 E.00967
G1 X120.758 Y125.243 E.01901
G1 X121.332 Y125.472 E.01901
G1 X121.844 Y125.819 E.01901
G1 X122.27 Y126.268 E.01901
G1 X122.589 Y126.799 E.01901
G1 X122.786 Y127.385 E.01901
G1 X122.853 Y128 E.01901
G1 X122.786 Y128.615 E.01901
G1 X122.589 Y129.201 E.01901
G1 X122.27 Y129.732 E.01901
G1 X122.054 Y129.96 E.00967
G1 X121.844 Y130.181 E.00935
G1 X121.332 Y130.528 E.01901
G1 X120.758 Y130.757 E.01901
G1 X120.147 Y130.857 E.01901
G1 X119.529 Y130.824 E.01901
G1 X118.933 Y130.658 E.01901
G1 X118.386 Y130.368 E.01901
G1 X117.915 Y129.968 E.01901
G1 X117.54 Y129.475 E.01901
G1 X117.281 Y128.914 E.01901
G1 X117.148 Y128.309 E.01901
G1 X117.148 Y127.691 E.01901
G1 X117.281 Y127.086 E.01901
G1 X117.54 Y126.525 E.01901
G1 X117.915 Y126.032 E.01901
G1 X118.386 Y125.632 E.01901
G1 X118.933 Y125.342 E.01901
G1 X119.529 Y125.176 E.01901
G1 X119.772 Y125.163 E.00747
M204 S10000
G1 X120.416 Y124.753 F30000
M204 S5000
G1 F1200
G1 X120.464 Y124.76 E.00149
G1 X120.767 Y124.804 E.00942
G1 X121.358 Y125.008 E.01921
G1 X121.9 Y125.321 E.01921
G1 X122.372 Y125.73 E.01921
G1 X122.759 Y126.222 E.01921
G1 X123.046 Y126.778 E.01921
G1 X123.222 Y127.378 E.01921
G1 X123.281 Y128 E.01921
G1 X123.222 Y128.622 E.01921
G1 X123.046 Y129.222 E.01921
G1 X122.759 Y129.778 E.01921
G1 X122.372 Y130.27 E.01921
G1 X121.9 Y130.679 E.01921
G1 X121.358 Y130.992 E.01921
G1 X120.767 Y131.196 E.01921
G1 X120.149 Y131.285 E.01921
G1 X119.524 Y131.256 E.01921
G1 X118.916 Y131.108 E.01921
G1 X118.348 Y130.848 E.01921
G1 X117.838 Y130.486 E.01921
G1 X117.407 Y130.033 E.01921
G1 X117.069 Y129.507 E.01921
G1 X116.836 Y128.927 E.01921
G1 X116.718 Y128.313 E.01921
G1 X116.718 Y127.687 E.01921
G1 X116.836 Y127.073 E.01921
G1 X117.069 Y126.493 E.01921
G1 X117.407 Y125.967 E.01921
G1 X117.838 Y125.514 E.01921
G1 X118.348 Y125.152 E.01921
G1 X118.916 Y124.892 E.01921
G1 X119.524 Y124.744 E.01921
G1 X120.149 Y124.715 E.01921
G1 X120.357 Y124.745 E.00646
M204 S10000
; WIPE_START
G1 F24000
G1 X120.464 Y124.76 E-.04122
G1 X120.767 Y124.804 E-.11651
G1 X121.358 Y125.008 E-.23761
G1 X121.9 Y125.321 E-.23761
G1 X122.153 Y125.54 E-.12706
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I.322 J1.174 P1  F30000
G1 X138.63 Y121.017 Z3.2
G1 Z2.8
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X138.631 Y121.017 E.00003
G1 X138.945 Y121 E.00967
G1 X139.555 Y121.1 E.01901
G1 X140.13 Y121.329 E.01901
G1 X140.642 Y121.676 E.01901
G1 X141.068 Y122.125 E.01901
G1 X141.387 Y122.655 E.01901
G1 X141.584 Y123.242 E.01901
G1 X141.651 Y123.857 E.01901
G1 X141.584 Y124.472 E.01901
G1 X141.387 Y125.058 E.01901
G1 X141.068 Y125.588 E.01901
G1 X140.851 Y125.817 E.00967
G1 X140.642 Y126.037 E.00935
G1 X140.13 Y126.385 E.01901
G1 X139.555 Y126.614 E.01901
G1 X138.945 Y126.714 E.01901
G1 X138.327 Y126.68 E.01901
G1 X137.731 Y126.515 E.01901
G1 X137.184 Y126.225 E.01901
G1 X136.713 Y125.824 E.01901
G1 X136.338 Y125.332 E.01901
G1 X136.078 Y124.77 E.01901
G1 X135.945 Y124.166 E.01901
G1 X135.945 Y123.547 E.01901
G1 X136.078 Y122.943 E.01901
G1 X136.338 Y122.382 E.01901
G1 X136.713 Y121.889 E.01901
G1 X137.184 Y121.489 E.01901
G1 X137.731 Y121.199 E.01901
G1 X138.327 Y121.033 E.01901
G1 X138.57 Y121.02 E.00747
M204 S10000
G1 X139.214 Y120.61 F30000
M204 S5000
G1 F1200
G1 X139.262 Y120.617 E.00149
G1 X139.565 Y120.66 E.00942
G1 X140.156 Y120.865 E.01921
G1 X140.698 Y121.178 E.01921
G1 X141.17 Y121.587 E.01921
G1 X141.557 Y122.079 E.01921
G1 X141.843 Y122.634 E.01921
G1 X142.02 Y123.234 E.01921
G1 X142.079 Y123.857 E.01921
G1 X142.02 Y124.479 E.01921
G1 X141.843 Y125.079 E.01921
G1 X141.557 Y125.635 E.01921
G1 X141.17 Y126.126 E.01921
G1 X140.698 Y126.536 E.01921
G1 X140.156 Y126.849 E.01921
G1 X139.565 Y127.053 E.01921
G1 X138.946 Y127.142 E.01921
G1 X138.322 Y127.112 E.01921
G1 X137.714 Y126.965 E.01921
G1 X137.145 Y126.705 E.01921
G1 X136.636 Y126.342 E.01921
G1 X136.205 Y125.89 E.01921
G1 X135.867 Y125.364 E.01921
G1 X135.634 Y124.783 E.01921
G1 X135.516 Y124.169 E.01921
G1 X135.516 Y123.544 E.01921
G1 X135.634 Y122.93 E.01921
G1 X135.867 Y122.35 E.01921
G1 X136.205 Y121.824 E.01921
G1 X136.636 Y121.371 E.01921
G1 X137.145 Y121.008 E.01921
G1 X137.714 Y120.749 E.01921
G1 X138.322 Y120.601 E.01921
G1 X138.946 Y120.571 E.01921
G1 X139.155 Y120.601 E.00646
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 3
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X139.262 Y120.617 E-.04122
G1 X139.565 Y120.66 E-.11651
G1 X140.156 Y120.865 E-.23761
G1 X140.698 Y121.178 E-.23761
G1 X140.95 Y121.397 E-.12706
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 15/27
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
G3 Z3.2 I.96 J-.748 P1  F30000
G1 X123.968 Y99.623 Z3.2
G1 Z3
G1 E.8 F1800
M204 S5000
M73 P81 R1
G1 F1200
G1 X124.261 Y99.607 E.00903
G1 X124.872 Y99.708 E.01901
G1 X125.447 Y99.937 E.01901
G1 X125.959 Y100.284 E.01901
G1 X126.384 Y100.733 E.01901
G1 X126.703 Y101.263 E.01901
G1 X126.901 Y101.849 E.01901
G1 X126.968 Y102.465 E.01901
G1 X126.901 Y103.08 E.01901
G1 X126.703 Y103.666 E.01901
G1 X126.384 Y104.196 E.01901
G1 X126.182 Y104.409 E.00903
G1 X125.959 Y104.645 E.00999
G1 X125.447 Y104.992 E.01901
G1 X124.872 Y105.221 E.01901
G1 X124.261 Y105.322 E.01901
G1 X123.644 Y105.288 E.01901
G1 X123.047 Y105.123 E.01901
G1 X122.501 Y104.833 E.01901
G1 X122.029 Y104.432 E.01901
G1 X121.655 Y103.94 E.01901
G1 X121.395 Y103.378 E.01901
G1 X121.262 Y102.774 E.01901
G1 X121.262 Y102.155 E.01901
G1 X121.395 Y101.551 E.01901
G1 X121.655 Y100.989 E.01901
G1 X122.029 Y100.497 E.01901
G1 X122.501 Y100.096 E.01901
G1 X123.047 Y99.807 E.01901
G1 X123.644 Y99.641 E.01901
G1 X123.908 Y99.627 E.00814
M204 S10000
G1 X124.501 Y99.213 F30000
M204 S5000
G1 F1200
G1 X124.554 Y99.221 E.00167
G1 X124.882 Y99.268 E.01016
G1 X125.473 Y99.473 E.01921
G1 X126.014 Y99.785 E.01921
G1 X126.487 Y100.195 E.01921
G1 X126.873 Y100.686 E.01921
G1 X127.16 Y101.242 E.01921
G1 X127.336 Y101.842 E.01921
G1 X127.396 Y102.465 E.01921
G1 X127.336 Y103.087 E.01921
G1 X127.16 Y103.687 E.01921
G1 X126.873 Y104.243 E.01921
G1 X126.487 Y104.734 E.01921
G1 X126.014 Y105.144 E.01921
G1 X125.473 Y105.456 E.01921
G1 X124.882 Y105.661 E.01921
G1 X124.263 Y105.75 E.01921
G1 X123.638 Y105.72 E.01921
G1 X123.031 Y105.573 E.01921
G1 X122.462 Y105.313 E.01921
G1 X121.953 Y104.95 E.01921
G1 X121.521 Y104.498 E.01921
G1 X121.183 Y103.972 E.01921
G1 X120.951 Y103.391 E.01921
G1 X120.832 Y102.777 E.01921
G1 X120.832 Y102.152 E.01921
G1 X120.951 Y101.538 E.01921
G1 X121.183 Y100.957 E.01921
G1 X121.521 Y100.431 E.01921
G1 X121.953 Y99.979 E.01921
G1 X122.462 Y99.616 E.01921
G1 X123.031 Y99.356 E.01921
G1 X123.638 Y99.209 E.01921
G1 X124.263 Y99.179 E.01921
G1 X124.441 Y99.205 E.00554
M204 S10000
; WIPE_START
G1 F24000
G1 X124.554 Y99.221 E-.04341
G1 X124.882 Y99.268 E-.1257
G1 X125.473 Y99.473 E-.23761
G1 X126.014 Y99.785 E-.23761
G1 X126.244 Y99.985 E-.11567
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.18 J-.299 P1  F30000
G1 X119.854 Y125.159 Z3.4
G1 Z3
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X120.147 Y125.143 E.00903
G1 X120.758 Y125.243 E.01901
G1 X121.332 Y125.472 E.01901
G1 X121.844 Y125.819 E.01901
G1 X122.27 Y126.268 E.01901
G1 X122.589 Y126.799 E.01901
G1 X122.786 Y127.385 E.01901
G1 X122.853 Y128 E.01901
G1 X122.786 Y128.615 E.01901
G1 X122.589 Y129.201 E.01901
G1 X122.27 Y129.732 E.01901
G1 X122.068 Y129.945 E.00903
G1 X121.844 Y130.181 E.00999
G1 X121.332 Y130.528 E.01901
G1 X120.758 Y130.757 E.01901
G1 X120.147 Y130.857 E.01901
G1 X119.529 Y130.824 E.01901
G1 X118.933 Y130.658 E.01901
G1 X118.386 Y130.368 E.01901
G1 X117.915 Y129.968 E.01901
G1 X117.54 Y129.475 E.01901
G1 X117.281 Y128.914 E.01901
G1 X117.148 Y128.309 E.01901
G1 X117.148 Y127.691 E.01901
G1 X117.281 Y127.086 E.01901
G1 X117.54 Y126.525 E.01901
G1 X117.915 Y126.032 E.01901
G1 X118.386 Y125.632 E.01901
G1 X118.933 Y125.342 E.01901
G1 X119.529 Y125.176 E.01901
G1 X119.794 Y125.162 E.00814
M204 S10000
G1 X120.386 Y124.749 F30000
M204 S5000
G1 F1200
G1 X120.44 Y124.757 E.00167
G1 X120.767 Y124.804 E.01016
G1 X121.358 Y125.008 E.01921
G1 X121.9 Y125.321 E.01921
G1 X122.372 Y125.73 E.01921
G1 X122.759 Y126.222 E.01921
G1 X123.046 Y126.778 E.01921
G1 X123.222 Y127.378 E.01921
G1 X123.281 Y128 E.01921
G1 X123.222 Y128.622 E.01921
G1 X123.046 Y129.222 E.01921
G1 X122.759 Y129.778 E.01921
G1 X122.372 Y130.27 E.01921
G1 X121.9 Y130.679 E.01921
G1 X121.358 Y130.992 E.01921
G1 X120.767 Y131.196 E.01921
G1 X120.149 Y131.285 E.01921
G1 X119.524 Y131.256 E.01921
G1 X118.916 Y131.108 E.01921
G1 X118.348 Y130.848 E.01921
G1 X117.838 Y130.486 E.01921
G1 X117.407 Y130.033 E.01921
G1 X117.069 Y129.507 E.01921
G1 X116.836 Y128.927 E.01921
G1 X116.718 Y128.313 E.01921
G1 X116.718 Y127.687 E.01921
G1 X116.836 Y127.073 E.01921
G1 X117.069 Y126.493 E.01921
G1 X117.407 Y125.967 E.01921
G1 X117.838 Y125.514 E.01921
G1 X118.348 Y125.152 E.01921
G1 X118.916 Y124.892 E.01921
G1 X119.524 Y124.744 E.01921
G1 X120.149 Y124.715 E.01921
G1 X120.327 Y124.74 E.00554
M204 S10000
; WIPE_START
G1 F24000
G1 X120.44 Y124.757 E-.04341
G1 X120.767 Y124.804 E-.1257
G1 X121.358 Y125.008 E-.23761
G1 X121.9 Y125.321 E-.23761
G1 X122.13 Y125.52 E-.11567
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.32 J1.174 P1  F30000
G1 X138.652 Y121.016 Z3.4
G1 Z3
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X138.945 Y121 E.00903
G1 X139.555 Y121.1 E.01901
G1 X140.13 Y121.329 E.01901
G1 X140.642 Y121.676 E.01901
G1 X141.068 Y122.125 E.01901
G1 X141.387 Y122.655 E.01901
G1 X141.584 Y123.242 E.01901
G1 X141.651 Y123.857 E.01901
G1 X141.584 Y124.472 E.01901
G1 X141.387 Y125.058 E.01901
G1 X141.068 Y125.588 E.01901
G1 X140.866 Y125.802 E.00903
G1 X140.642 Y126.037 E.00999
G1 X140.13 Y126.385 E.01901
G1 X139.555 Y126.614 E.01901
G1 X138.945 Y126.714 E.01901
G1 X138.327 Y126.68 E.01901
G1 X137.731 Y126.515 E.01901
G1 X137.184 Y126.225 E.01901
G1 X136.713 Y125.824 E.01901
G1 X136.338 Y125.332 E.01901
G1 X136.078 Y124.77 E.01901
G1 X135.945 Y124.166 E.01901
G1 X135.945 Y123.547 E.01901
G1 X136.078 Y122.943 E.01901
G1 X136.338 Y122.382 E.01901
G1 X136.713 Y121.889 E.01901
G1 X137.184 Y121.489 E.01901
G1 X137.731 Y121.199 E.01901
G1 X138.327 Y121.033 E.01901
G1 X138.592 Y121.019 E.00814
M204 S10000
G1 X139.184 Y120.606 F30000
M204 S5000
G1 F1200
G1 X139.238 Y120.613 E.00167
G1 X139.565 Y120.66 E.01016
G1 X140.156 Y120.865 E.01921
G1 X140.698 Y121.178 E.01921
M73 P82 R1
G1 X141.17 Y121.587 E.01921
G1 X141.557 Y122.079 E.01921
G1 X141.843 Y122.634 E.01921
G1 X142.02 Y123.234 E.01921
G1 X142.079 Y123.857 E.01921
G1 X142.02 Y124.479 E.01921
G1 X141.843 Y125.079 E.01921
G1 X141.557 Y125.635 E.01921
G1 X141.17 Y126.126 E.01921
G1 X140.698 Y126.536 E.01921
G1 X140.156 Y126.849 E.01921
G1 X139.565 Y127.053 E.01921
G1 X138.946 Y127.142 E.01921
G1 X138.322 Y127.112 E.01921
G1 X137.714 Y126.965 E.01921
G1 X137.145 Y126.705 E.01921
G1 X136.636 Y126.342 E.01921
G1 X136.205 Y125.89 E.01921
G1 X135.867 Y125.364 E.01921
G1 X135.634 Y124.783 E.01921
G1 X135.516 Y124.169 E.01921
G1 X135.516 Y123.544 E.01921
G1 X135.634 Y122.93 E.01921
G1 X135.867 Y122.35 E.01921
G1 X136.205 Y121.824 E.01921
G1 X136.636 Y121.371 E.01921
G1 X137.145 Y121.008 E.01921
G1 X137.714 Y120.749 E.01921
G1 X138.322 Y120.601 E.01921
G1 X138.946 Y120.571 E.01921
G1 X139.125 Y120.597 E.00554
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 3.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X139.238 Y120.613 E-.04341
G1 X139.565 Y120.66 E-.1257
G1 X140.156 Y120.865 E-.23761
G1 X140.698 Y121.178 E-.23761
G1 X140.928 Y121.377 E-.11567
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 16/27
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
G3 Z3.4 I.96 J-.748 P1  F30000
G1 X123.991 Y99.622 Z3.4
G1 Z3.2
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X124.261 Y99.607 E.00831
G1 X124.872 Y99.708 E.01901
G1 X125.447 Y99.937 E.01901
G1 X125.959 Y100.284 E.01901
G1 X126.384 Y100.733 E.01901
G1 X126.703 Y101.263 E.01901
G1 X126.901 Y101.849 E.01901
G1 X126.968 Y102.465 E.01901
G1 X126.901 Y103.08 E.01901
G1 X126.703 Y103.666 E.01901
G1 X126.384 Y104.196 E.01901
G1 X125.959 Y104.645 E.01901
G1 X125.447 Y104.992 E.01901
G1 X124.872 Y105.221 E.01901
G1 X124.261 Y105.322 E.01901
G1 X123.644 Y105.288 E.01901
G1 X123.047 Y105.123 E.01901
G1 X122.501 Y104.833 E.01901
G1 X122.029 Y104.432 E.01901
G1 X121.655 Y103.94 E.01901
G1 X121.395 Y103.378 E.01901
G1 X121.262 Y102.774 E.01901
G1 X121.262 Y102.155 E.01901
G1 X121.395 Y101.551 E.01901
G1 X121.655 Y100.989 E.01901
G1 X122.029 Y100.497 E.01901
G1 X122.501 Y100.096 E.01901
G1 X123.047 Y99.807 E.01901
G1 X123.644 Y99.641 E.01901
G1 X123.931 Y99.625 E.00886
M204 S10000
G1 X124.47 Y99.209 F30000
M204 S5000
G1 F1200
G1 X124.531 Y99.218 E.00186
G1 X124.882 Y99.268 E.01091
G1 X125.473 Y99.473 E.01921
G1 X126.014 Y99.785 E.01921
G1 X126.487 Y100.195 E.01921
G1 X126.873 Y100.686 E.01921
G1 X127.16 Y101.242 E.01921
G1 X127.336 Y101.842 E.01921
G1 X127.396 Y102.465 E.01921
G1 X127.336 Y103.087 E.01921
G1 X127.16 Y103.687 E.01921
G1 X126.873 Y104.243 E.01921
G1 X126.487 Y104.734 E.01921
G1 X126.014 Y105.144 E.01921
G1 X125.473 Y105.456 E.01921
G1 X124.882 Y105.661 E.01921
G1 X124.263 Y105.75 E.01921
G1 X123.638 Y105.72 E.01921
G1 X123.031 Y105.573 E.01921
G1 X122.462 Y105.313 E.01921
G1 X121.953 Y104.95 E.01921
G1 X121.521 Y104.498 E.01921
G1 X121.183 Y103.972 E.01921
G1 X120.951 Y103.391 E.01921
G1 X120.832 Y102.777 E.01921
G1 X120.832 Y102.152 E.01921
G1 X120.951 Y101.538 E.01921
G1 X121.183 Y100.957 E.01921
G1 X121.521 Y100.431 E.01921
G1 X121.953 Y99.979 E.01921
G1 X122.462 Y99.616 E.01921
G1 X123.031 Y99.356 E.01921
G1 X123.638 Y99.209 E.01921
G1 X124.263 Y99.179 E.01921
G1 X124.411 Y99.201 E.0046
M204 S10000
; WIPE_START
G1 F24000
G1 X124.531 Y99.218 E-.04586
G1 X124.882 Y99.268 E-.13489
G1 X125.473 Y99.473 E-.23761
G1 X126.014 Y99.785 E-.23761
G1 X126.221 Y99.965 E-.10403
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I-1.18 J-.297 P1  F30000
G1 X119.877 Y125.158 Z3.6
G1 Z3.2
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X120.147 Y125.143 E.00831
G1 X120.758 Y125.243 E.01901
G1 X121.332 Y125.472 E.01901
G1 X121.844 Y125.819 E.01901
G1 X122.27 Y126.268 E.01901
G1 X122.589 Y126.799 E.01901
G1 X122.786 Y127.385 E.01901
G1 X122.853 Y128 E.01901
G1 X122.786 Y128.615 E.01901
G1 X122.589 Y129.201 E.01901
G1 X122.27 Y129.732 E.01901
G1 X121.844 Y130.181 E.01901
G1 X121.332 Y130.528 E.01901
G1 X120.758 Y130.757 E.01901
G1 X120.147 Y130.857 E.01901
G1 X119.529 Y130.824 E.01901
G1 X118.933 Y130.658 E.01901
G1 X118.386 Y130.368 E.01901
G1 X117.915 Y129.968 E.01901
G1 X117.54 Y129.475 E.01901
G1 X117.281 Y128.914 E.01901
G1 X117.148 Y128.309 E.01901
G1 X117.148 Y127.691 E.01901
G1 X117.281 Y127.086 E.01901
G1 X117.54 Y126.525 E.01901
G1 X117.915 Y126.032 E.01901
G1 X118.386 Y125.632 E.01901
G1 X118.933 Y125.342 E.01901
G1 X119.529 Y125.176 E.01901
G1 X119.817 Y125.161 E.00886
M204 S10000
G1 X120.356 Y124.745 F30000
M204 S5000
G1 F1200
G1 X120.416 Y124.753 E.00186
G1 X120.767 Y124.804 E.01091
G1 X121.358 Y125.008 E.01921
G1 X121.9 Y125.321 E.01921
G1 X122.372 Y125.73 E.01921
G1 X122.759 Y126.222 E.01921
G1 X123.046 Y126.778 E.01921
G1 X123.222 Y127.378 E.01921
G1 X123.281 Y128 E.01921
G1 X123.222 Y128.622 E.01921
G1 X123.046 Y129.222 E.01921
G1 X122.759 Y129.778 E.01921
G1 X122.372 Y130.27 E.01921
G1 X121.9 Y130.679 E.01921
G1 X121.358 Y130.992 E.01921
G1 X120.767 Y131.196 E.01921
G1 X120.149 Y131.285 E.01921
G1 X119.524 Y131.256 E.01921
G1 X118.916 Y131.108 E.01921
G1 X118.348 Y130.848 E.01921
G1 X117.838 Y130.486 E.01921
G1 X117.407 Y130.033 E.01921
G1 X117.069 Y129.507 E.01921
G1 X116.836 Y128.927 E.01921
G1 X116.718 Y128.313 E.01921
G1 X116.718 Y127.687 E.01921
G1 X116.836 Y127.073 E.01921
G1 X117.069 Y126.493 E.01921
G1 X117.407 Y125.967 E.01921
G1 X117.838 Y125.514 E.01921
G1 X118.348 Y125.152 E.01921
G1 X118.916 Y124.892 E.01921
G1 X119.524 Y124.744 E.01921
G1 X120.149 Y124.715 E.01921
G1 X120.297 Y124.736 E.0046
M204 S10000
; WIPE_START
G1 F24000
G1 X120.416 Y124.753 E-.04586
G1 X120.767 Y124.804 E-.13489
G1 X121.358 Y125.008 E-.23761
G1 X121.9 Y125.321 E-.23761
G1 X122.107 Y125.5 E-.10403
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I.318 J1.175 P1  F30000
G1 X138.675 Y121.014 Z3.6
G1 Z3.2
M73 P83 R1
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X138.945 Y121 E.00831
G1 X139.555 Y121.1 E.01901
G1 X140.13 Y121.329 E.01901
G1 X140.642 Y121.676 E.01901
G1 X141.068 Y122.125 E.01901
G1 X141.387 Y122.655 E.01901
G1 X141.584 Y123.242 E.01901
G1 X141.651 Y123.857 E.01901
G1 X141.584 Y124.472 E.01901
G1 X141.387 Y125.058 E.01901
G1 X141.068 Y125.588 E.01901
G1 X140.642 Y126.037 E.01901
G1 X140.13 Y126.385 E.01901
G1 X139.555 Y126.614 E.01901
G1 X138.945 Y126.714 E.01901
G1 X138.327 Y126.68 E.01901
G1 X137.731 Y126.515 E.01901
G1 X137.184 Y126.225 E.01901
G1 X136.713 Y125.824 E.01901
G1 X136.338 Y125.332 E.01901
G1 X136.078 Y124.77 E.01901
G1 X135.945 Y124.166 E.01901
G1 X135.945 Y123.547 E.01901
G1 X136.078 Y122.943 E.01901
G1 X136.338 Y122.382 E.01901
G1 X136.713 Y121.889 E.01901
G1 X137.184 Y121.489 E.01901
G1 X137.731 Y121.199 E.01901
G1 X138.327 Y121.033 E.01901
G1 X138.615 Y121.018 E.00886
M204 S10000
G1 X139.154 Y120.601 F30000
M204 S5000
G1 F1200
G1 X139.214 Y120.61 E.00186
G1 X139.565 Y120.66 E.01091
G1 X140.156 Y120.865 E.01921
G1 X140.698 Y121.178 E.01921
G1 X141.17 Y121.587 E.01921
G1 X141.557 Y122.079 E.01921
G1 X141.843 Y122.634 E.01921
G1 X142.02 Y123.234 E.01921
G1 X142.079 Y123.857 E.01921
G1 X142.02 Y124.479 E.01921
G1 X141.843 Y125.079 E.01921
G1 X141.557 Y125.635 E.01921
G1 X141.17 Y126.126 E.01921
G1 X140.698 Y126.536 E.01921
G1 X140.156 Y126.849 E.01921
G1 X139.565 Y127.053 E.01921
G1 X138.946 Y127.142 E.01921
G1 X138.322 Y127.112 E.01921
G1 X137.714 Y126.965 E.01921
G1 X137.145 Y126.705 E.01921
G1 X136.636 Y126.342 E.01921
G1 X136.205 Y125.89 E.01921
G1 X135.867 Y125.364 E.01921
G1 X135.634 Y124.783 E.01921
G1 X135.516 Y124.169 E.01921
G1 X135.516 Y123.544 E.01921
G1 X135.634 Y122.93 E.01921
G1 X135.867 Y122.35 E.01921
G1 X136.205 Y121.824 E.01921
G1 X136.636 Y121.371 E.01921
G1 X137.145 Y121.008 E.01921
G1 X137.714 Y120.749 E.01921
G1 X138.322 Y120.601 E.01921
G1 X138.946 Y120.571 E.01921
G1 X139.095 Y120.593 E.0046
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 3.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X139.214 Y120.61 E-.04586
G1 X139.565 Y120.66 E-.13489
G1 X140.156 Y120.865 E-.23761
G1 X140.698 Y121.178 E-.23761
G1 X140.905 Y121.357 E-.10403
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 17/27
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
G3 Z3.6 I.961 J-.747 P1  F30000
G1 X124.014 Y99.621 Z3.6
G1 Z3.4
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X124.261 Y99.607 E.00763
G1 X124.872 Y99.708 E.01901
G1 X125.447 Y99.937 E.01901
G1 X125.959 Y100.284 E.01901
G1 X126.384 Y100.733 E.01901
G1 X126.703 Y101.263 E.01901
G1 X126.901 Y101.849 E.01901
G1 X126.968 Y102.465 E.01901
G1 X126.901 Y103.08 E.01901
G1 X126.703 Y103.666 E.01901
G1 X126.384 Y104.196 E.01901
G1 X125.959 Y104.645 E.01901
G1 X125.447 Y104.992 E.01901
G1 X124.872 Y105.221 E.01901
G1 X124.261 Y105.322 E.01901
G1 X123.644 Y105.288 E.01901
G1 X123.047 Y105.123 E.01901
G1 X122.501 Y104.833 E.01901
G1 X122.029 Y104.432 E.01901
G1 X121.655 Y103.94 E.01901
G1 X121.395 Y103.378 E.01901
G1 X121.262 Y102.774 E.01901
G1 X121.262 Y102.155 E.01901
G1 X121.395 Y101.551 E.01901
G1 X121.655 Y100.989 E.01901
G1 X122.029 Y100.497 E.01901
G1 X122.501 Y100.096 E.01901
G1 X123.047 Y99.807 E.01901
G1 X123.644 Y99.641 E.01901
G1 X123.954 Y99.624 E.00954
M204 S10000
G1 X124.438 Y99.204 F30000
M204 S5000
G1 F1200
G1 X124.882 Y99.268 E.01379
G1 X125.473 Y99.473 E.01921
G1 X126.014 Y99.785 E.01921
G1 X126.487 Y100.195 E.01921
G1 X126.873 Y100.686 E.01921
G1 X127.16 Y101.242 E.01921
G1 X127.336 Y101.842 E.01921
G1 X127.396 Y102.465 E.01921
G1 X127.336 Y103.087 E.01921
G1 X127.16 Y103.687 E.01921
G1 X126.873 Y104.243 E.01921
G1 X126.487 Y104.734 E.01921
G1 X126.014 Y105.144 E.01921
G1 X125.473 Y105.456 E.01921
G1 X124.882 Y105.661 E.01921
G1 X124.263 Y105.75 E.01921
G1 X123.638 Y105.72 E.01921
G1 X123.031 Y105.573 E.01921
G1 X122.462 Y105.313 E.01921
G1 X121.953 Y104.95 E.01921
G1 X121.521 Y104.498 E.01921
G1 X121.183 Y103.972 E.01921
G1 X120.951 Y103.391 E.01921
G1 X120.832 Y102.777 E.01921
G1 X120.832 Y102.152 E.01921
G1 X120.951 Y101.538 E.01921
G1 X121.183 Y100.957 E.01921
G1 X121.521 Y100.431 E.01921
G1 X121.953 Y99.979 E.01921
G1 X122.462 Y99.616 E.01921
G1 X123.031 Y99.356 E.01921
G1 X123.638 Y99.209 E.01921
G1 X124.263 Y99.179 E.01921
G1 X124.378 Y99.196 E.00358
M204 S10000
; WIPE_START
G1 F24000
G1 X124.882 Y99.268 E-.19331
G1 X125.473 Y99.473 E-.23761
G1 X126.014 Y99.785 E-.23761
G1 X126.196 Y99.943 E-.09147
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I-1.181 J-.295 P1  F30000
G1 X119.899 Y125.156 Z3.8
G1 Z3.4
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X120.147 Y125.143 E.00763
G1 X120.758 Y125.243 E.01901
G1 X121.332 Y125.472 E.01901
G1 X121.844 Y125.819 E.01901
G1 X122.27 Y126.268 E.01901
G1 X122.589 Y126.799 E.01901
G1 X122.786 Y127.385 E.01901
G1 X122.853 Y128 E.01901
G1 X122.786 Y128.615 E.01901
G1 X122.589 Y129.201 E.01901
G1 X122.27 Y129.732 E.01901
G1 X121.844 Y130.181 E.01901
G1 X121.332 Y130.528 E.01901
G1 X120.758 Y130.757 E.01901
G1 X120.147 Y130.857 E.01901
G1 X119.529 Y130.824 E.01901
G1 X118.933 Y130.658 E.01901
G1 X118.386 Y130.368 E.01901
G1 X117.915 Y129.968 E.01901
G1 X117.54 Y129.475 E.01901
G1 X117.281 Y128.914 E.01901
G1 X117.148 Y128.309 E.01901
G1 X117.148 Y127.691 E.01901
G1 X117.281 Y127.086 E.01901
G1 X117.54 Y126.525 E.01901
G1 X117.915 Y126.032 E.01901
G1 X118.386 Y125.632 E.01901
G1 X118.933 Y125.342 E.01901
G1 X119.529 Y125.176 E.01901
G1 X119.839 Y125.16 E.00954
M204 S10000
G1 X120.323 Y124.74 F30000
M204 S5000
G1 F1200
G1 X120.767 Y124.804 E.01379
G1 X121.358 Y125.008 E.01921
G1 X121.9 Y125.321 E.01921
G1 X122.372 Y125.73 E.01921
G1 X122.759 Y126.222 E.01921
G1 X123.046 Y126.778 E.01921
M73 P84 R1
G1 X123.222 Y127.378 E.01921
G1 X123.281 Y128 E.01921
G1 X123.222 Y128.622 E.01921
G1 X123.046 Y129.222 E.01921
G1 X122.759 Y129.778 E.01921
G1 X122.372 Y130.27 E.01921
G1 X121.9 Y130.679 E.01921
G1 X121.358 Y130.992 E.01921
G1 X120.767 Y131.196 E.01921
G1 X120.149 Y131.285 E.01921
G1 X119.524 Y131.256 E.01921
G1 X118.916 Y131.108 E.01921
G1 X118.348 Y130.848 E.01921
G1 X117.838 Y130.486 E.01921
G1 X117.407 Y130.033 E.01921
G1 X117.069 Y129.507 E.01921
G1 X116.836 Y128.927 E.01921
G1 X116.718 Y128.313 E.01921
G1 X116.718 Y127.687 E.01921
G1 X116.836 Y127.073 E.01921
G1 X117.069 Y126.493 E.01921
G1 X117.407 Y125.967 E.01921
G1 X117.838 Y125.514 E.01921
G1 X118.348 Y125.152 E.01921
G1 X118.916 Y124.892 E.01921
G1 X119.524 Y124.744 E.01921
G1 X120.149 Y124.715 E.01921
G1 X120.264 Y124.731 E.00358
M204 S10000
; WIPE_START
G1 F24000
G1 X120.767 Y124.804 E-.19331
G1 X121.358 Y125.008 E-.23761
G1 X121.9 Y125.321 E-.23761
G1 X122.082 Y125.478 E-.09147
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I.316 J1.175 P1  F30000
G1 X138.697 Y121.013 Z3.8
G1 Z3.4
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X138.945 Y121 E.00763
G1 X139.555 Y121.1 E.01901
G1 X140.13 Y121.329 E.01901
G1 X140.642 Y121.676 E.01901
G1 X141.068 Y122.125 E.01901
G1 X141.387 Y122.655 E.01901
G1 X141.584 Y123.242 E.01901
G1 X141.651 Y123.857 E.01901
G1 X141.584 Y124.472 E.01901
G1 X141.387 Y125.058 E.01901
G1 X141.068 Y125.588 E.01901
G1 X140.642 Y126.037 E.01901
G1 X140.13 Y126.385 E.01901
G1 X139.555 Y126.614 E.01901
G1 X138.945 Y126.714 E.01901
G1 X138.327 Y126.68 E.01901
G1 X137.731 Y126.515 E.01901
G1 X137.184 Y126.225 E.01901
G1 X136.713 Y125.824 E.01901
G1 X136.338 Y125.332 E.01901
G1 X136.078 Y124.77 E.01901
G1 X135.945 Y124.166 E.01901
G1 X135.945 Y123.547 E.01901
G1 X136.078 Y122.943 E.01901
G1 X136.338 Y122.382 E.01901
G1 X136.713 Y121.889 E.01901
G1 X137.184 Y121.489 E.01901
G1 X137.731 Y121.199 E.01901
G1 X138.327 Y121.033 E.01901
G1 X138.637 Y121.016 E.00954
M204 S10000
G1 X139.121 Y120.597 F30000
M204 S5000
G1 F1200
G1 X139.565 Y120.66 E.01379
G1 X140.156 Y120.865 E.01921
G1 X140.698 Y121.178 E.01921
G1 X141.17 Y121.587 E.01921
G1 X141.557 Y122.079 E.01921
G1 X141.843 Y122.634 E.01921
G1 X142.02 Y123.234 E.01921
G1 X142.079 Y123.857 E.01921
G1 X142.02 Y124.479 E.01921
G1 X141.843 Y125.079 E.01921
G1 X141.557 Y125.635 E.01921
G1 X141.17 Y126.126 E.01921
G1 X140.698 Y126.536 E.01921
G1 X140.156 Y126.849 E.01921
G1 X139.565 Y127.053 E.01921
G1 X138.946 Y127.142 E.01921
G1 X138.322 Y127.112 E.01921
G1 X137.714 Y126.965 E.01921
G1 X137.145 Y126.705 E.01921
G1 X136.636 Y126.342 E.01921
G1 X136.205 Y125.89 E.01921
G1 X135.867 Y125.364 E.01921
G1 X135.634 Y124.783 E.01921
G1 X135.516 Y124.169 E.01921
G1 X135.516 Y123.544 E.01921
G1 X135.634 Y122.93 E.01921
G1 X135.867 Y122.35 E.01921
G1 X136.205 Y121.824 E.01921
G1 X136.636 Y121.371 E.01921
G1 X137.145 Y121.008 E.01921
G1 X137.714 Y120.749 E.01921
G1 X138.322 Y120.601 E.01921
G1 X138.946 Y120.571 E.01921
G1 X139.062 Y120.588 E.00358
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 3.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X139.565 Y120.66 E-.19331
G1 X140.156 Y120.865 E-.23761
G1 X140.698 Y121.178 E-.23761
G1 X140.88 Y121.335 E-.09147
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 18/27
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
G3 Z3.8 I.962 J-.746 P1  F30000
G1 X124.036 Y99.62 Z3.8
G1 Z3.6
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X124.261 Y99.607 E.00695
G1 X124.872 Y99.708 E.01901
G1 X125.447 Y99.937 E.01901
G1 X125.959 Y100.284 E.01901
G1 X126.384 Y100.733 E.01901
G1 X126.703 Y101.263 E.01901
G1 X126.901 Y101.849 E.01901
G1 X126.968 Y102.465 E.01901
G1 X126.901 Y103.08 E.01901
G1 X126.703 Y103.666 E.01901
G1 X126.384 Y104.196 E.01901
G1 X125.959 Y104.645 E.01901
G1 X125.447 Y104.992 E.01901
G1 X124.872 Y105.221 E.01901
G1 X124.261 Y105.322 E.01901
G1 X123.644 Y105.288 E.01901
G1 X123.047 Y105.123 E.01901
G1 X122.501 Y104.833 E.01901
G1 X122.029 Y104.432 E.01901
G1 X121.655 Y103.94 E.01901
G1 X121.395 Y103.378 E.01901
G1 X121.262 Y102.774 E.01901
G1 X121.262 Y102.155 E.01901
G1 X121.395 Y101.551 E.01901
G1 X121.655 Y100.989 E.01901
G1 X122.029 Y100.497 E.01901
G1 X122.501 Y100.096 E.01901
G1 X123.047 Y99.807 E.01901
G1 X123.644 Y99.641 E.01901
G1 X123.976 Y99.623 E.01022
M204 S10000
G1 X124.408 Y99.2 F30000
M204 S5000
G1 F1200
G1 X124.483 Y99.211 E.00231
G1 X124.882 Y99.268 E.01239
G1 X125.473 Y99.473 E.01921
G1 X126.014 Y99.785 E.01921
G1 X126.487 Y100.195 E.01921
G1 X126.873 Y100.686 E.01921
G1 X127.16 Y101.242 E.01921
G1 X127.336 Y101.842 E.01921
G1 X127.396 Y102.465 E.01921
G1 X127.336 Y103.087 E.01921
G1 X127.16 Y103.687 E.01921
G1 X126.873 Y104.243 E.01921
G1 X126.487 Y104.734 E.01921
G1 X126.014 Y105.144 E.01921
G1 X125.473 Y105.456 E.01921
G1 X124.882 Y105.661 E.01921
G1 X124.263 Y105.75 E.01921
G1 X123.638 Y105.72 E.01921
G1 X123.031 Y105.573 E.01921
G1 X122.462 Y105.313 E.01921
G1 X121.953 Y104.95 E.01921
G1 X121.521 Y104.498 E.01921
G1 X121.183 Y103.972 E.01921
G1 X120.951 Y103.391 E.01921
G1 X120.832 Y102.777 E.01921
G1 X120.832 Y102.152 E.01921
G1 X120.951 Y101.538 E.01921
G1 X121.183 Y100.957 E.01921
G1 X121.521 Y100.431 E.01921
G1 X121.953 Y99.979 E.01921
G1 X122.462 Y99.616 E.01921
G1 X123.031 Y99.356 E.01921
G1 X123.638 Y99.209 E.01921
G1 X124.263 Y99.179 E.01921
G1 X124.349 Y99.192 E.00266
M204 S10000
; WIPE_START
G1 F24000
G1 X124.483 Y99.211 E-.0514
G1 X124.882 Y99.268 E-.15328
G1 X125.473 Y99.473 E-.23761
G1 X126.014 Y99.785 E-.23761
G1 X126.174 Y99.923 E-.0801
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I-1.181 J-.293 P1  F30000
G1 X119.921 Y125.155 Z4
G1 Z3.6
M73 P85 R1
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X120.147 Y125.143 E.00695
G1 X120.758 Y125.243 E.01901
G1 X121.332 Y125.472 E.01901
G1 X121.844 Y125.819 E.01901
G1 X122.27 Y126.268 E.01901
G1 X122.589 Y126.799 E.01901
G1 X122.786 Y127.385 E.01901
G1 X122.853 Y128 E.01901
G1 X122.786 Y128.615 E.01901
G1 X122.589 Y129.201 E.01901
G1 X122.27 Y129.732 E.01901
G1 X121.844 Y130.181 E.01901
G1 X121.332 Y130.528 E.01901
G1 X120.758 Y130.757 E.01901
G1 X120.147 Y130.857 E.01901
G1 X119.529 Y130.824 E.01901
G1 X118.933 Y130.658 E.01901
G1 X118.386 Y130.368 E.01901
G1 X117.915 Y129.968 E.01901
G1 X117.54 Y129.475 E.01901
G1 X117.281 Y128.914 E.01901
G1 X117.148 Y128.309 E.01901
G1 X117.148 Y127.691 E.01901
G1 X117.281 Y127.086 E.01901
G1 X117.54 Y126.525 E.01901
G1 X117.915 Y126.032 E.01901
G1 X118.386 Y125.632 E.01901
G1 X118.933 Y125.342 E.01901
G1 X119.529 Y125.176 E.01901
G1 X119.861 Y125.158 E.01022
M204 S10000
G1 X120.294 Y124.736 F30000
M204 S5000
G1 F1200
G1 X120.368 Y124.746 E.00231
G1 X120.767 Y124.804 E.01239
G1 X121.358 Y125.008 E.01921
G1 X121.9 Y125.321 E.01921
G1 X122.372 Y125.73 E.01921
G1 X122.759 Y126.222 E.01921
G1 X123.046 Y126.778 E.01921
G1 X123.222 Y127.378 E.01921
G1 X123.281 Y128 E.01921
G1 X123.222 Y128.622 E.01921
G1 X123.046 Y129.222 E.01921
G1 X122.759 Y129.778 E.01921
G1 X122.372 Y130.27 E.01921
G1 X121.9 Y130.679 E.01921
G1 X121.358 Y130.992 E.01921
G1 X120.767 Y131.196 E.01921
G1 X120.149 Y131.285 E.01921
G1 X119.524 Y131.256 E.01921
G1 X118.916 Y131.108 E.01921
G1 X118.348 Y130.848 E.01921
G1 X117.838 Y130.486 E.01921
G1 X117.407 Y130.033 E.01921
G1 X117.069 Y129.507 E.01921
G1 X116.836 Y128.927 E.01921
G1 X116.718 Y128.313 E.01921
G1 X116.718 Y127.687 E.01921
G1 X116.836 Y127.073 E.01921
G1 X117.069 Y126.493 E.01921
G1 X117.407 Y125.967 E.01921
G1 X117.838 Y125.514 E.01921
G1 X118.348 Y125.152 E.01921
G1 X118.916 Y124.892 E.01921
G1 X119.524 Y124.744 E.01921
G1 X120.149 Y124.715 E.01921
G1 X120.234 Y124.727 E.00266
M204 S10000
; WIPE_START
G1 F24000
G1 X120.368 Y124.746 E-.0514
G1 X120.767 Y124.804 E-.15328
G1 X121.358 Y125.008 E-.23761
G1 X121.9 Y125.321 E-.23761
G1 X122.059 Y125.459 E-.0801
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I.314 J1.176 P1  F30000
G1 X138.719 Y121.012 Z4
G1 Z3.6
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X138.945 Y121 E.00695
G1 X139.555 Y121.1 E.01901
G1 X140.13 Y121.329 E.01901
G1 X140.642 Y121.676 E.01901
G1 X141.068 Y122.125 E.01901
G1 X141.387 Y122.655 E.01901
G1 X141.584 Y123.242 E.01901
G1 X141.651 Y123.857 E.01901
G1 X141.584 Y124.472 E.01901
G1 X141.387 Y125.058 E.01901
G1 X141.068 Y125.588 E.01901
G1 X140.642 Y126.037 E.01901
G1 X140.13 Y126.385 E.01901
G1 X139.555 Y126.614 E.01901
G1 X138.945 Y126.714 E.01901
G1 X138.327 Y126.68 E.01901
G1 X137.731 Y126.515 E.01901
G1 X137.184 Y126.225 E.01901
G1 X136.713 Y125.824 E.01901
G1 X136.338 Y125.332 E.01901
G1 X136.078 Y124.77 E.01901
G1 X135.945 Y124.166 E.01901
G1 X135.945 Y123.547 E.01901
G1 X136.078 Y122.943 E.01901
G1 X136.338 Y122.382 E.01901
G1 X136.713 Y121.889 E.01901
G1 X137.184 Y121.489 E.01901
G1 X137.731 Y121.199 E.01901
G1 X138.327 Y121.033 E.01901
G1 X138.659 Y121.015 E.01022
M204 S10000
G1 X139.092 Y120.592 F30000
M204 S5000
G1 F1200
G1 X139.166 Y120.603 E.00231
G1 X139.565 Y120.66 E.01239
G1 X140.156 Y120.865 E.01921
G1 X140.698 Y121.178 E.01921
G1 X141.17 Y121.587 E.01921
G1 X141.557 Y122.079 E.01921
G1 X141.843 Y122.634 E.01921
G1 X142.02 Y123.234 E.01921
G1 X142.079 Y123.857 E.01921
G1 X142.02 Y124.479 E.01921
G1 X141.843 Y125.079 E.01921
G1 X141.557 Y125.635 E.01921
G1 X141.17 Y126.126 E.01921
G1 X140.698 Y126.536 E.01921
G1 X140.156 Y126.849 E.01921
G1 X139.565 Y127.053 E.01921
G1 X138.946 Y127.142 E.01921
G1 X138.322 Y127.112 E.01921
G1 X137.714 Y126.965 E.01921
G1 X137.145 Y126.705 E.01921
G1 X136.636 Y126.342 E.01921
G1 X136.205 Y125.89 E.01921
G1 X135.867 Y125.364 E.01921
G1 X135.634 Y124.783 E.01921
G1 X135.516 Y124.169 E.01921
G1 X135.516 Y123.544 E.01921
G1 X135.634 Y122.93 E.01921
G1 X135.867 Y122.35 E.01921
G1 X136.205 Y121.824 E.01921
G1 X136.636 Y121.371 E.01921
G1 X137.145 Y121.008 E.01921
G1 X137.714 Y120.749 E.01921
G1 X138.322 Y120.601 E.01921
G1 X138.946 Y120.571 E.01921
G1 X139.032 Y120.584 E.00266
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 3.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X139.166 Y120.603 E-.0514
G1 X139.565 Y120.66 E-.15328
G1 X140.156 Y120.865 E-.23761
G1 X140.698 Y121.178 E-.23761
G1 X140.857 Y121.316 E-.0801
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 19/27
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
G3 Z4 I.962 J-.745 P1  F30000
G1 X124.057 Y99.619 Z4
G1 Z3.8
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X124.261 Y99.607 E.00628
G1 X124.872 Y99.708 E.01901
G1 X125.447 Y99.937 E.01901
G1 X125.959 Y100.284 E.01901
G1 X126.384 Y100.733 E.01901
G1 X126.703 Y101.263 E.01901
G1 X126.901 Y101.849 E.01901
G1 X126.968 Y102.465 E.01901
G1 X126.901 Y103.08 E.01901
G1 X126.703 Y103.666 E.01901
G1 X126.384 Y104.196 E.01901
G1 X125.959 Y104.645 E.01901
G1 X125.447 Y104.992 E.01901
G1 X124.872 Y105.221 E.01901
G1 X124.261 Y105.322 E.01901
G1 X123.644 Y105.288 E.01901
G1 X123.047 Y105.123 E.01901
G1 X122.501 Y104.833 E.01901
G1 X122.029 Y104.432 E.01901
G1 X121.655 Y103.94 E.01901
G1 X121.395 Y103.378 E.01901
G1 X121.262 Y102.774 E.01901
G1 X121.262 Y102.155 E.01901
G1 X121.395 Y101.551 E.01901
G1 X121.655 Y100.989 E.01901
G1 X122.029 Y100.497 E.01901
G1 X122.501 Y100.096 E.01901
G1 X123.047 Y99.807 E.01901
G1 X123.644 Y99.641 E.01901
G1 X123.998 Y99.622 E.01089
M204 S10000
G1 X124.379 Y99.196 F30000
M204 S5000
G1 F1200
G1 X124.459 Y99.207 E.00247
G1 X124.882 Y99.268 E.01314
G1 X125.473 Y99.473 E.01921
G1 X126.014 Y99.785 E.01921
M73 P86 R1
G1 X126.487 Y100.195 E.01921
G1 X126.873 Y100.686 E.01921
G1 X127.16 Y101.242 E.01921
G1 X127.336 Y101.842 E.01921
G1 X127.396 Y102.465 E.01921
G1 X127.336 Y103.087 E.01921
G1 X127.16 Y103.687 E.01921
G1 X126.873 Y104.243 E.01921
G1 X126.487 Y104.734 E.01921
G1 X126.014 Y105.144 E.01921
G1 X125.473 Y105.456 E.01921
G1 X124.882 Y105.661 E.01921
G1 X124.263 Y105.75 E.01921
G1 X123.638 Y105.72 E.01921
G1 X123.031 Y105.573 E.01921
G1 X122.462 Y105.313 E.01921
G1 X121.953 Y104.95 E.01921
G1 X121.521 Y104.498 E.01921
G1 X121.183 Y103.972 E.01921
G1 X120.951 Y103.391 E.01921
G1 X120.832 Y102.777 E.01921
G1 X120.832 Y102.152 E.01921
G1 X120.951 Y101.538 E.01921
G1 X121.183 Y100.957 E.01921
G1 X121.521 Y100.431 E.01921
G1 X121.953 Y99.979 E.01921
G1 X122.462 Y99.616 E.01921
G1 X123.031 Y99.356 E.01921
G1 X123.638 Y99.209 E.01921
G1 X124.263 Y99.179 E.01921
G1 X124.32 Y99.187 E.00176
M204 S10000
; WIPE_START
G1 F24000
G1 X124.459 Y99.207 E-.05339
G1 X124.882 Y99.268 E-.16248
G1 X125.473 Y99.473 E-.23761
G1 X126.014 Y99.785 E-.23761
G1 X126.151 Y99.904 E-.06891
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I-1.182 J-.291 P1  F30000
G1 X119.943 Y125.154 Z4.2
G1 Z3.8
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X120.147 Y125.143 E.00628
G1 X120.758 Y125.243 E.01901
G1 X121.332 Y125.472 E.01901
G1 X121.844 Y125.819 E.01901
G1 X122.27 Y126.268 E.01901
G1 X122.589 Y126.799 E.01901
G1 X122.786 Y127.385 E.01901
G1 X122.853 Y128 E.01901
G1 X122.786 Y128.615 E.01901
G1 X122.589 Y129.201 E.01901
G1 X122.27 Y129.732 E.01901
G1 X121.844 Y130.181 E.01901
G1 X121.332 Y130.528 E.01901
G1 X120.758 Y130.757 E.01901
G1 X120.147 Y130.857 E.01901
G1 X119.529 Y130.824 E.01901
G1 X118.933 Y130.658 E.01901
G1 X118.386 Y130.368 E.01901
G1 X117.915 Y129.968 E.01901
G1 X117.54 Y129.475 E.01901
G1 X117.281 Y128.914 E.01901
G1 X117.148 Y128.309 E.01901
G1 X117.148 Y127.691 E.01901
G1 X117.281 Y127.086 E.01901
G1 X117.54 Y126.525 E.01901
G1 X117.915 Y126.032 E.01901
G1 X118.386 Y125.632 E.01901
G1 X118.933 Y125.342 E.01901
G1 X119.529 Y125.176 E.01901
G1 X119.883 Y125.157 E.01089
M204 S10000
G1 X120.265 Y124.731 F30000
M204 S5000
G1 F1200
G1 X120.344 Y124.743 E.00247
G1 X120.767 Y124.804 E.01314
G1 X121.358 Y125.008 E.01921
G1 X121.9 Y125.321 E.01921
G1 X122.372 Y125.73 E.01921
G1 X122.759 Y126.222 E.01921
G1 X123.046 Y126.778 E.01921
G1 X123.222 Y127.378 E.01921
G1 X123.281 Y128 E.01921
G1 X123.222 Y128.622 E.01921
G1 X123.046 Y129.222 E.01921
G1 X122.759 Y129.778 E.01921
G1 X122.372 Y130.27 E.01921
G1 X121.9 Y130.679 E.01921
G1 X121.358 Y130.992 E.01921
G1 X120.767 Y131.196 E.01921
G1 X120.149 Y131.285 E.01921
G1 X119.524 Y131.256 E.01921
G1 X118.916 Y131.108 E.01921
G1 X118.348 Y130.848 E.01921
G1 X117.838 Y130.486 E.01921
G1 X117.407 Y130.033 E.01921
G1 X117.069 Y129.507 E.01921
G1 X116.836 Y128.927 E.01921
G1 X116.718 Y128.313 E.01921
G1 X116.718 Y127.687 E.01921
G1 X116.836 Y127.073 E.01921
G1 X117.069 Y126.493 E.01921
G1 X117.407 Y125.967 E.01921
G1 X117.838 Y125.514 E.01921
G1 X118.348 Y125.152 E.01921
G1 X118.916 Y124.892 E.01921
G1 X119.524 Y124.744 E.01921
G1 X120.149 Y124.715 E.01921
G1 X120.205 Y124.723 E.00176
M204 S10000
; WIPE_START
G1 F24000
G1 X120.344 Y124.743 E-.05339
G1 X120.767 Y124.804 E-.16248
G1 X121.358 Y125.008 E-.23761
G1 X121.9 Y125.321 E-.23761
G1 X122.037 Y125.44 E-.06891
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I.312 J1.176 P1  F30000
G1 X138.741 Y121.011 Z4.2
G1 Z3.8
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X138.945 Y121 E.00628
G1 X139.555 Y121.1 E.01901
G1 X140.13 Y121.329 E.01901
G1 X140.642 Y121.676 E.01901
G1 X141.068 Y122.125 E.01901
G1 X141.387 Y122.655 E.01901
G1 X141.584 Y123.242 E.01901
G1 X141.651 Y123.857 E.01901
G1 X141.584 Y124.472 E.01901
G1 X141.387 Y125.058 E.01901
G1 X141.068 Y125.588 E.01901
G1 X140.642 Y126.037 E.01901
G1 X140.13 Y126.385 E.01901
G1 X139.555 Y126.614 E.01901
G1 X138.945 Y126.714 E.01901
G1 X138.327 Y126.68 E.01901
G1 X137.731 Y126.515 E.01901
G1 X137.184 Y126.225 E.01901
G1 X136.713 Y125.824 E.01901
G1 X136.338 Y125.332 E.01901
G1 X136.078 Y124.77 E.01901
G1 X135.945 Y124.166 E.01901
G1 X135.945 Y123.547 E.01901
G1 X136.078 Y122.943 E.01901
G1 X136.338 Y122.382 E.01901
G1 X136.713 Y121.889 E.01901
G1 X137.184 Y121.489 E.01901
G1 X137.731 Y121.199 E.01901
G1 X138.327 Y121.033 E.01901
G1 X138.681 Y121.014 E.01089
M204 S10000
G1 X139.062 Y120.588 F30000
M204 S5000
G1 F1200
G1 X139.142 Y120.6 E.00247
G1 X139.565 Y120.66 E.01314
G1 X140.156 Y120.865 E.01921
G1 X140.698 Y121.178 E.01921
G1 X141.17 Y121.587 E.01921
G1 X141.557 Y122.079 E.01921
G1 X141.843 Y122.634 E.01921
G1 X142.02 Y123.234 E.01921
G1 X142.079 Y123.857 E.01921
G1 X142.02 Y124.479 E.01921
G1 X141.843 Y125.079 E.01921
G1 X141.557 Y125.635 E.01921
G1 X141.17 Y126.126 E.01921
G1 X140.698 Y126.536 E.01921
G1 X140.156 Y126.849 E.01921
G1 X139.565 Y127.053 E.01921
G1 X138.946 Y127.142 E.01921
G1 X138.322 Y127.112 E.01921
G1 X137.714 Y126.965 E.01921
G1 X137.145 Y126.705 E.01921
G1 X136.636 Y126.342 E.01921
G1 X136.205 Y125.89 E.01921
G1 X135.867 Y125.364 E.01921
G1 X135.634 Y124.783 E.01921
G1 X135.516 Y124.169 E.01921
G1 X135.516 Y123.544 E.01921
G1 X135.634 Y122.93 E.01921
G1 X135.867 Y122.35 E.01921
G1 X136.205 Y121.824 E.01921
G1 X136.636 Y121.371 E.01921
G1 X137.145 Y121.008 E.01921
G1 X137.714 Y120.749 E.01921
G1 X138.322 Y120.601 E.01921
G1 X138.946 Y120.571 E.01921
G1 X139.003 Y120.58 E.00176
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X139.142 Y120.6 E-.05339
G1 X139.565 Y120.66 E-.16248
G1 X140.156 Y120.865 E-.23761
G1 X140.698 Y121.178 E-.23761
G1 X140.835 Y121.296 E-.06891
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 20/27
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
G3 Z4.2 I.963 J-.744 P1  F30000
G1 X124.079 Y99.617 Z4.2
G1 Z4
M73 P87 R1
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X124.261 Y99.607 E.00562
G1 X124.872 Y99.708 E.01901
G1 X125.447 Y99.937 E.01901
G1 X125.959 Y100.284 E.01901
G1 X126.384 Y100.733 E.01901
G1 X126.703 Y101.263 E.01901
G1 X126.901 Y101.849 E.01901
G1 X126.968 Y102.465 E.01901
G1 X126.901 Y103.08 E.01901
G1 X126.703 Y103.666 E.01901
G1 X126.384 Y104.196 E.01901
G1 X125.959 Y104.645 E.01901
G1 X125.447 Y104.992 E.01901
G1 X124.872 Y105.221 E.01901
G1 X124.261 Y105.322 E.01901
G1 X123.644 Y105.288 E.01901
G1 X123.047 Y105.123 E.01901
G1 X122.501 Y104.833 E.01901
G1 X122.029 Y104.432 E.01901
G1 X121.655 Y103.94 E.01901
G1 X121.395 Y103.378 E.01901
G1 X121.262 Y102.774 E.01901
G1 X121.262 Y102.155 E.01901
G1 X121.395 Y101.551 E.01901
G1 X121.655 Y100.989 E.01901
G1 X122.029 Y100.497 E.01901
G1 X122.501 Y100.096 E.01901
G1 X123.047 Y99.807 E.01901
G1 X123.644 Y99.641 E.01901
G1 X124.019 Y99.621 E.01155
M204 S10000
G1 X124.35 Y99.192 F30000
M204 S5000
G1 F1200
G1 X124.435 Y99.204 E.00262
G1 X124.882 Y99.268 E.01388
G1 X125.473 Y99.473 E.01921
G1 X126.014 Y99.785 E.01921
G1 X126.487 Y100.195 E.01921
G1 X126.873 Y100.686 E.01921
G1 X127.16 Y101.242 E.01921
G1 X127.336 Y101.842 E.01921
G1 X127.396 Y102.465 E.01921
G1 X127.336 Y103.087 E.01921
G1 X127.16 Y103.687 E.01921
G1 X126.873 Y104.243 E.01921
G1 X126.487 Y104.734 E.01921
G1 X126.014 Y105.144 E.01921
G1 X125.473 Y105.456 E.01921
G1 X124.882 Y105.661 E.01921
G1 X124.263 Y105.75 E.01921
G1 X123.638 Y105.72 E.01921
G1 X123.031 Y105.573 E.01921
G1 X122.462 Y105.313 E.01921
G1 X121.953 Y104.95 E.01921
G1 X121.521 Y104.498 E.01921
G1 X121.183 Y103.972 E.01921
G1 X120.951 Y103.391 E.01921
G1 X120.832 Y102.777 E.01921
G1 X120.832 Y102.152 E.01921
G1 X120.951 Y101.538 E.01921
G1 X121.183 Y100.957 E.01921
G1 X121.521 Y100.431 E.01921
G1 X121.953 Y99.979 E.01921
G1 X122.462 Y99.616 E.01921
G1 X123.031 Y99.356 E.01921
G1 X123.638 Y99.209 E.01921
G1 X124.263 Y99.179 E.01921
G1 X124.291 Y99.183 E.00087
M204 S10000
; WIPE_START
G1 F24000
G1 X124.435 Y99.204 E-.05515
G1 X124.882 Y99.268 E-.17167
G1 X125.473 Y99.473 E-.23761
G1 X126.014 Y99.785 E-.23761
G1 X126.13 Y99.885 E-.05796
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I-1.182 J-.288 P1  F30000
G1 X119.964 Y125.153 Z4.4
G1 Z4
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X120.147 Y125.143 E.00562
G1 X120.758 Y125.243 E.01901
G1 X121.332 Y125.472 E.01901
G1 X121.844 Y125.819 E.01901
G1 X122.27 Y126.268 E.01901
G1 X122.589 Y126.799 E.01901
G1 X122.786 Y127.385 E.01901
G1 X122.853 Y128 E.01901
G1 X122.786 Y128.615 E.01901
G1 X122.589 Y129.201 E.01901
G1 X122.27 Y129.732 E.01901
G1 X121.844 Y130.181 E.01901
G1 X121.332 Y130.528 E.01901
G1 X120.758 Y130.757 E.01901
G1 X120.147 Y130.857 E.01901
G1 X119.529 Y130.824 E.01901
G1 X118.933 Y130.658 E.01901
G1 X118.386 Y130.368 E.01901
G1 X117.915 Y129.968 E.01901
G1 X117.54 Y129.475 E.01901
G1 X117.281 Y128.914 E.01901
G1 X117.148 Y128.309 E.01901
G1 X117.148 Y127.691 E.01901
G1 X117.281 Y127.086 E.01901
G1 X117.54 Y126.525 E.01901
G1 X117.915 Y126.032 E.01901
G1 X118.386 Y125.632 E.01901
G1 X118.933 Y125.342 E.01901
G1 X119.529 Y125.176 E.01901
G1 X119.904 Y125.156 E.01155
M204 S10000
G1 X120.236 Y124.727 F30000
M204 S5000
G1 F1200
G1 X120.32 Y124.739 E.00262
G1 X120.767 Y124.804 E.01388
G1 X121.358 Y125.008 E.01921
G1 X121.9 Y125.321 E.01921
G1 X122.372 Y125.73 E.01921
G1 X122.759 Y126.222 E.01921
G1 X123.046 Y126.778 E.01921
G1 X123.222 Y127.378 E.01921
G1 X123.281 Y128 E.01921
G1 X123.222 Y128.622 E.01921
G1 X123.046 Y129.222 E.01921
G1 X122.759 Y129.778 E.01921
G1 X122.372 Y130.27 E.01921
G1 X121.9 Y130.679 E.01921
G1 X121.358 Y130.992 E.01921
G1 X120.767 Y131.196 E.01921
G1 X120.149 Y131.285 E.01921
G1 X119.524 Y131.256 E.01921
G1 X118.916 Y131.108 E.01921
G1 X118.348 Y130.848 E.01921
G1 X117.838 Y130.486 E.01921
G1 X117.407 Y130.033 E.01921
G1 X117.069 Y129.507 E.01921
G1 X116.836 Y128.927 E.01921
G1 X116.718 Y128.313 E.01921
G1 X116.718 Y127.687 E.01921
G1 X116.836 Y127.073 E.01921
G1 X117.069 Y126.493 E.01921
G1 X117.407 Y125.967 E.01921
G1 X117.838 Y125.514 E.01921
G1 X118.348 Y125.152 E.01921
G1 X118.916 Y124.892 E.01921
G1 X119.524 Y124.744 E.01921
G1 X120.149 Y124.715 E.01921
G1 X120.177 Y124.719 E.00087
M204 S10000
; WIPE_START
G1 F24000
G1 X120.32 Y124.739 E-.05515
G1 X120.767 Y124.804 E-.17167
G1 X121.358 Y125.008 E-.23761
G1 X121.9 Y125.321 E-.23761
G1 X122.015 Y125.421 E-.05796
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I.31 J1.177 P1  F30000
G1 X138.762 Y121.01 Z4.4
G1 Z4
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X138.945 Y121 E.00562
G1 X139.555 Y121.1 E.01901
G1 X140.13 Y121.329 E.01901
G1 X140.642 Y121.676 E.01901
G1 X141.068 Y122.125 E.01901
G1 X141.387 Y122.655 E.01901
G1 X141.584 Y123.242 E.01901
G1 X141.651 Y123.857 E.01901
G1 X141.584 Y124.472 E.01901
G1 X141.387 Y125.058 E.01901
G1 X141.068 Y125.588 E.01901
G1 X140.642 Y126.037 E.01901
G1 X140.13 Y126.385 E.01901
G1 X139.555 Y126.614 E.01901
G1 X138.945 Y126.714 E.01901
G1 X138.327 Y126.68 E.01901
G1 X137.731 Y126.515 E.01901
G1 X137.184 Y126.225 E.01901
G1 X136.713 Y125.824 E.01901
G1 X136.338 Y125.332 E.01901
G1 X136.078 Y124.77 E.01901
G1 X135.945 Y124.166 E.01901
G1 X135.945 Y123.547 E.01901
G1 X136.078 Y122.943 E.01901
G1 X136.338 Y122.382 E.01901
G1 X136.713 Y121.889 E.01901
G1 X137.184 Y121.489 E.01901
G1 X137.731 Y121.199 E.01901
G1 X138.327 Y121.033 E.01901
G1 X138.702 Y121.013 E.01155
M204 S10000
G1 X139.034 Y120.584 F30000
M204 S5000
G1 F1200
G1 X139.118 Y120.596 E.00262
G1 X139.565 Y120.66 E.01388
G1 X140.156 Y120.865 E.01921
G1 X140.698 Y121.178 E.01921
M73 P88 R1
G1 X141.17 Y121.587 E.01921
G1 X141.557 Y122.079 E.01921
G1 X141.843 Y122.634 E.01921
G1 X142.02 Y123.234 E.01921
G1 X142.079 Y123.857 E.01921
G1 X142.02 Y124.479 E.01921
G1 X141.843 Y125.079 E.01921
G1 X141.557 Y125.635 E.01921
G1 X141.17 Y126.126 E.01921
G1 X140.698 Y126.536 E.01921
G1 X140.156 Y126.849 E.01921
G1 X139.565 Y127.053 E.01921
G1 X138.946 Y127.142 E.01921
G1 X138.322 Y127.112 E.01921
G1 X137.714 Y126.965 E.01921
G1 X137.145 Y126.705 E.01921
G1 X136.636 Y126.342 E.01921
G1 X136.205 Y125.89 E.01921
G1 X135.867 Y125.364 E.01921
G1 X135.634 Y124.783 E.01921
G1 X135.516 Y124.169 E.01921
G1 X135.516 Y123.544 E.01921
G1 X135.634 Y122.93 E.01921
G1 X135.867 Y122.35 E.01921
G1 X136.205 Y121.824 E.01921
G1 X136.636 Y121.371 E.01921
G1 X137.145 Y121.008 E.01921
G1 X137.714 Y120.749 E.01921
G1 X138.322 Y120.601 E.01921
G1 X138.946 Y120.571 E.01921
G1 X138.975 Y120.575 E.00087
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 4.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X139.118 Y120.596 E-.05515
G1 X139.565 Y120.66 E-.17167
G1 X140.156 Y120.865 E-.23761
G1 X140.698 Y121.178 E-.23761
G1 X140.813 Y121.277 E-.05796
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 21/27
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
G3 Z4.4 I.963 J-.743 P1  F30000
G1 X124.099 Y99.616 Z4.4
G1 Z4.2
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X124.261 Y99.607 E.00498
G1 X124.872 Y99.708 E.01901
G1 X125.447 Y99.937 E.01901
G1 X125.959 Y100.284 E.01901
G1 X126.384 Y100.733 E.01901
G1 X126.703 Y101.263 E.01901
G1 X126.901 Y101.849 E.01901
G1 X126.968 Y102.465 E.01901
G1 X126.901 Y103.08 E.01901
G1 X126.703 Y103.666 E.01901
G1 X126.384 Y104.196 E.01901
G1 X125.959 Y104.645 E.01901
G1 X125.447 Y104.992 E.01901
G1 X124.872 Y105.221 E.01901
G1 X124.261 Y105.322 E.01901
G1 X123.644 Y105.288 E.01901
G1 X123.047 Y105.123 E.01901
G1 X122.501 Y104.833 E.01901
G1 X122.029 Y104.432 E.01901
G1 X121.655 Y103.94 E.01901
G1 X121.395 Y103.378 E.01901
G1 X121.262 Y102.774 E.01901
G1 X121.262 Y102.155 E.01901
G1 X121.395 Y101.551 E.01901
G1 X121.655 Y100.989 E.01901
G1 X122.029 Y100.497 E.01901
G1 X122.501 Y100.096 E.01901
G1 X123.047 Y99.807 E.01901
G1 X123.644 Y99.641 E.01901
G1 X124.039 Y99.62 E.01218
M204 S10000
G1 X124.323 Y99.188 F30000
M204 S5000
G1 F1200
G1 X124.411 Y99.2 E.00274
G1 X124.882 Y99.268 E.01463
G1 X125.473 Y99.473 E.01921
G1 X126.014 Y99.785 E.01921
G1 X126.487 Y100.195 E.01921
G1 X126.873 Y100.686 E.01921
G1 X127.16 Y101.242 E.01921
G1 X127.336 Y101.842 E.01921
G1 X127.396 Y102.465 E.01921
G1 X127.336 Y103.087 E.01921
G1 X127.16 Y103.687 E.01921
G1 X126.873 Y104.243 E.01921
G1 X126.487 Y104.734 E.01921
G1 X126.014 Y105.144 E.01921
G1 X125.473 Y105.456 E.01921
G1 X124.882 Y105.661 E.01921
G1 X124.263 Y105.75 E.01921
G1 X123.638 Y105.72 E.01921
G1 X123.031 Y105.573 E.01921
G1 X122.462 Y105.313 E.01921
G1 X121.953 Y104.95 E.01921
G1 X121.521 Y104.498 E.01921
G1 X121.183 Y103.972 E.01921
G1 X120.951 Y103.391 E.01921
G1 X120.832 Y102.777 E.01921
G1 X120.832 Y102.152 E.01921
G1 X120.951 Y101.538 E.01921
G1 X121.183 Y100.957 E.01921
G1 X121.521 Y100.431 E.01921
G1 X121.953 Y99.979 E.01921
G1 X122.462 Y99.616 E.01921
G1 X123.031 Y99.356 E.01921
G1 X123.638 Y99.209 E.01921
G1 X124.263 Y99.179 E.01921
G1 X124.263 Y99.179 E.00001
M204 S10000
; WIPE_START
G1 F24000
G1 X124.411 Y99.2 E-.05664
G1 X124.882 Y99.268 E-.18087
G1 X125.473 Y99.473 E-.23761
G1 X126.014 Y99.785 E-.23761
G1 X126.108 Y99.867 E-.04728
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I-1.183 J-.286 P1  F30000
G1 X119.985 Y125.152 Z4.6
G1 Z4.2
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X120.147 Y125.143 E.00498
G1 X120.758 Y125.243 E.01901
G1 X121.332 Y125.472 E.01901
G1 X121.844 Y125.819 E.01901
G1 X122.27 Y126.268 E.01901
G1 X122.589 Y126.799 E.01901
G1 X122.786 Y127.385 E.01901
G1 X122.853 Y128 E.01901
G1 X122.786 Y128.615 E.01901
G1 X122.589 Y129.201 E.01901
G1 X122.27 Y129.732 E.01901
G1 X121.844 Y130.181 E.01901
G1 X121.332 Y130.528 E.01901
G1 X120.758 Y130.757 E.01901
G1 X120.147 Y130.857 E.01901
G1 X119.529 Y130.824 E.01901
G1 X118.933 Y130.658 E.01901
G1 X118.386 Y130.368 E.01901
G1 X117.915 Y129.968 E.01901
G1 X117.54 Y129.475 E.01901
G1 X117.281 Y128.914 E.01901
G1 X117.148 Y128.309 E.01901
G1 X117.148 Y127.691 E.01901
G1 X117.281 Y127.086 E.01901
G1 X117.54 Y126.525 E.01901
G1 X117.915 Y126.032 E.01901
G1 X118.386 Y125.632 E.01901
G1 X118.933 Y125.342 E.01901
G1 X119.529 Y125.176 E.01901
G1 X119.925 Y125.155 E.01218
M204 S10000
G1 X120.208 Y124.723 F30000
M204 S5000
G1 F1200
G1 X120.296 Y124.736 E.00274
G1 X120.767 Y124.804 E.01463
G1 X121.358 Y125.008 E.01921
G1 X121.9 Y125.321 E.01921
G1 X122.372 Y125.73 E.01921
G1 X122.759 Y126.222 E.01921
G1 X123.046 Y126.778 E.01921
G1 X123.222 Y127.378 E.01921
G1 X123.281 Y128 E.01921
G1 X123.222 Y128.622 E.01921
G1 X123.046 Y129.222 E.01921
G1 X122.759 Y129.778 E.01921
G1 X122.372 Y130.27 E.01921
G1 X121.9 Y130.679 E.01921
G1 X121.358 Y130.992 E.01921
G1 X120.767 Y131.196 E.01921
G1 X120.149 Y131.285 E.01921
G1 X119.524 Y131.256 E.01921
G1 X118.916 Y131.108 E.01921
G1 X118.348 Y130.848 E.01921
G1 X117.838 Y130.486 E.01921
G1 X117.407 Y130.033 E.01921
G1 X117.069 Y129.507 E.01921
G1 X116.836 Y128.927 E.01921
G1 X116.718 Y128.313 E.01921
G1 X116.718 Y127.687 E.01921
G1 X116.836 Y127.073 E.01921
G1 X117.069 Y126.493 E.01921
G1 X117.407 Y125.967 E.01921
G1 X117.838 Y125.514 E.01921
G1 X118.348 Y125.152 E.01921
G1 X118.916 Y124.892 E.01921
G1 X119.524 Y124.744 E.01921
G1 X120.149 Y124.715 E.01921
G1 X120.149 Y124.715 E.00001
M204 S10000
; WIPE_START
G1 F24000
G1 X120.296 Y124.736 E-.05664
G1 X120.767 Y124.804 E-.18087
G1 X121.358 Y125.008 E-.23761
G1 X121.9 Y125.321 E-.23761
G1 X121.994 Y125.402 E-.04728
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I.308 J1.177 P1  F30000
G1 X138.783 Y121.009 Z4.6
M73 P89 R1
G1 Z4.2
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X138.945 Y121 E.00498
G1 X139.555 Y121.1 E.01901
G1 X140.13 Y121.329 E.01901
G1 X140.642 Y121.676 E.01901
G1 X141.068 Y122.125 E.01901
G1 X141.387 Y122.655 E.01901
G1 X141.584 Y123.242 E.01901
G1 X141.651 Y123.857 E.01901
G1 X141.584 Y124.472 E.01901
G1 X141.387 Y125.058 E.01901
G1 X141.068 Y125.588 E.01901
G1 X140.642 Y126.037 E.01901
G1 X140.13 Y126.385 E.01901
G1 X139.555 Y126.614 E.01901
G1 X138.945 Y126.714 E.01901
G1 X138.327 Y126.68 E.01901
G1 X137.731 Y126.515 E.01901
G1 X137.184 Y126.225 E.01901
G1 X136.713 Y125.824 E.01901
G1 X136.338 Y125.332 E.01901
G1 X136.078 Y124.77 E.01901
G1 X135.945 Y124.166 E.01901
G1 X135.945 Y123.547 E.01901
G1 X136.078 Y122.943 E.01901
G1 X136.338 Y122.382 E.01901
G1 X136.713 Y121.889 E.01901
G1 X137.184 Y121.489 E.01901
G1 X137.731 Y121.199 E.01901
G1 X138.327 Y121.033 E.01901
G1 X138.723 Y121.012 E.01218
M204 S10000
G1 X139.006 Y120.58 F30000
M204 S5000
G1 F1200
G1 X139.094 Y120.593 E.00274
G1 X139.565 Y120.66 E.01463
G1 X140.156 Y120.865 E.01921
G1 X140.698 Y121.178 E.01921
G1 X141.17 Y121.587 E.01921
G1 X141.557 Y122.079 E.01921
M73 P89 R0
G1 X141.843 Y122.634 E.01921
G1 X142.02 Y123.234 E.01921
G1 X142.079 Y123.857 E.01921
G1 X142.02 Y124.479 E.01921
G1 X141.843 Y125.079 E.01921
G1 X141.557 Y125.635 E.01921
G1 X141.17 Y126.126 E.01921
G1 X140.698 Y126.536 E.01921
G1 X140.156 Y126.849 E.01921
G1 X139.565 Y127.053 E.01921
G1 X138.946 Y127.142 E.01921
G1 X138.322 Y127.112 E.01921
G1 X137.714 Y126.965 E.01921
G1 X137.145 Y126.705 E.01921
G1 X136.636 Y126.342 E.01921
G1 X136.205 Y125.89 E.01921
G1 X135.867 Y125.364 E.01921
G1 X135.634 Y124.783 E.01921
G1 X135.516 Y124.169 E.01921
G1 X135.516 Y123.544 E.01921
G1 X135.634 Y122.93 E.01921
G1 X135.867 Y122.35 E.01921
G1 X136.205 Y121.824 E.01921
G1 X136.636 Y121.371 E.01921
G1 X137.145 Y121.008 E.01921
G1 X137.714 Y120.749 E.01921
G1 X138.322 Y120.601 E.01921
G1 X138.946 Y120.571 E.01921
G1 X138.947 Y120.571 E.00001
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 4.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X139.094 Y120.593 E-.05664
G1 X139.565 Y120.66 E-.18087
G1 X140.156 Y120.865 E-.23761
G1 X140.698 Y121.178 E-.23761
G1 X140.792 Y121.259 E-.04728
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 22/27
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
G3 Z4.6 I.964 J-.743 P1  F30000
G1 X124.12 Y99.615 Z4.6
G1 Z4.4
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X124.261 Y99.607 E.00437
G1 X124.872 Y99.708 E.01901
G1 X125.447 Y99.937 E.01901
G1 X125.959 Y100.284 E.01901
G1 X126.384 Y100.733 E.01901
G1 X126.703 Y101.263 E.01901
G1 X126.901 Y101.849 E.01901
G1 X126.968 Y102.465 E.01901
G1 X126.901 Y103.08 E.01901
G1 X126.854 Y103.22 E.00454
G1 X126.703 Y103.666 E.01447
G1 X126.384 Y104.196 E.01901
G1 X125.959 Y104.645 E.01901
G1 X125.447 Y104.992 E.01901
G1 X124.872 Y105.221 E.01901
G1 X124.261 Y105.322 E.01901
G1 X123.644 Y105.288 E.01901
G1 X123.047 Y105.123 E.01901
G1 X122.501 Y104.833 E.01901
G1 X122.029 Y104.432 E.01901
G1 X121.655 Y103.94 E.01901
G1 X121.395 Y103.378 E.01901
G1 X121.262 Y102.774 E.01901
G1 X121.262 Y102.155 E.01901
G1 X121.395 Y101.551 E.01901
G1 X121.655 Y100.989 E.01901
G1 X122.029 Y100.497 E.01901
G1 X122.501 Y100.096 E.01901
G1 X123.047 Y99.807 E.01901
G1 X123.644 Y99.641 E.01901
G1 X124.06 Y99.618 E.0128
M204 S10000
G1 X124.296 Y99.184 F30000
M204 S5000
G1 F1200
G1 X124.387 Y99.197 E.00283
G1 X124.882 Y99.268 E.01537
G1 X125.473 Y99.473 E.01921
G1 X126.014 Y99.785 E.01921
G1 X126.487 Y100.195 E.01921
G1 X126.873 Y100.686 E.01921
G1 X127.16 Y101.242 E.01921
G1 X127.336 Y101.842 E.01921
G1 X127.396 Y102.465 E.01921
G1 X127.336 Y103.087 E.01921
G1 X127.16 Y103.687 E.01921
G1 X126.873 Y104.243 E.01921
G1 X126.487 Y104.734 E.01921
G1 X126.014 Y105.144 E.01921
G1 X125.473 Y105.456 E.01921
G1 X124.882 Y105.661 E.01921
G1 X124.263 Y105.75 E.01921
G1 X123.638 Y105.72 E.01921
G1 X123.031 Y105.573 E.01921
G1 X122.462 Y105.313 E.01921
G1 X121.953 Y104.95 E.01921
G1 X121.521 Y104.498 E.01921
G1 X121.183 Y103.972 E.01921
G1 X120.951 Y103.391 E.01921
G1 X120.832 Y102.777 E.01921
G1 X120.832 Y102.152 E.01921
G1 X120.951 Y101.538 E.01921
G1 X121.183 Y100.957 E.01921
G1 X121.521 Y100.431 E.01921
G1 X121.953 Y99.979 E.01921
G1 X122.462 Y99.616 E.01921
G1 X123.031 Y99.356 E.01921
G1 X123.638 Y99.209 E.01921
G1 X124.236 Y99.181 E.01838
M204 S10000
; WIPE_START
G1 F24000
G1 X124.387 Y99.197 E-.05765
G1 X124.882 Y99.268 E-.19006
G1 X125.473 Y99.473 E-.23761
G1 X126.014 Y99.785 E-.23761
G1 X126.088 Y99.849 E-.03707
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I-1.183 J-.284 P1  F30000
G1 X120.005 Y125.151 Z4.8
G1 Z4.4
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X120.147 Y125.143 E.00437
G1 X120.758 Y125.243 E.01901
G1 X121.332 Y125.472 E.01901
G1 X121.844 Y125.819 E.01901
G1 X122.27 Y126.268 E.01901
G1 X122.589 Y126.799 E.01901
G1 X122.786 Y127.385 E.01901
G1 X122.853 Y128 E.01901
G1 X122.786 Y128.615 E.01901
G1 X122.739 Y128.755 E.00454
G1 X122.589 Y129.201 E.01447
G1 X122.27 Y129.732 E.01901
G1 X121.844 Y130.181 E.01901
G1 X121.332 Y130.528 E.01901
G1 X120.758 Y130.757 E.01901
G1 X120.147 Y130.857 E.01901
G1 X119.529 Y130.824 E.01901
G1 X118.933 Y130.658 E.01901
G1 X118.386 Y130.368 E.01901
G1 X117.915 Y129.968 E.01901
G1 X117.54 Y129.475 E.01901
G1 X117.281 Y128.914 E.01901
G1 X117.148 Y128.309 E.01901
G1 X117.148 Y127.691 E.01901
G1 X117.281 Y127.086 E.01901
G1 X117.54 Y126.525 E.01901
G1 X117.915 Y126.032 E.01901
G1 X118.386 Y125.632 E.01901
G1 X118.933 Y125.342 E.01901
G1 X119.529 Y125.176 E.01901
G1 X119.945 Y125.154 E.0128
M204 S10000
G1 X120.181 Y124.719 F30000
M204 S5000
G1 F1200
G1 X120.272 Y124.732 E.00283
G1 X120.767 Y124.804 E.01537
G1 X121.358 Y125.008 E.01921
G1 X121.9 Y125.321 E.01921
M73 P90 R0
G1 X122.372 Y125.73 E.01921
G1 X122.759 Y126.222 E.01921
G1 X123.046 Y126.778 E.01921
G1 X123.222 Y127.378 E.01921
G1 X123.281 Y128 E.01921
G1 X123.222 Y128.622 E.01921
G1 X123.046 Y129.222 E.01921
G1 X122.759 Y129.778 E.01921
G1 X122.372 Y130.27 E.01921
G1 X121.9 Y130.679 E.01921
G1 X121.358 Y130.992 E.01921
G1 X120.767 Y131.196 E.01921
G1 X120.149 Y131.285 E.01921
G1 X119.524 Y131.256 E.01921
G1 X118.916 Y131.108 E.01921
G1 X118.348 Y130.848 E.01921
G1 X117.838 Y130.486 E.01921
G1 X117.407 Y130.033 E.01921
G1 X117.069 Y129.507 E.01921
G1 X116.836 Y128.927 E.01921
G1 X116.718 Y128.313 E.01921
G1 X116.718 Y127.687 E.01921
G1 X116.836 Y127.073 E.01921
G1 X117.069 Y126.493 E.01921
G1 X117.407 Y125.967 E.01921
G1 X117.838 Y125.514 E.01921
G1 X118.348 Y125.152 E.01921
G1 X118.916 Y124.892 E.01921
G1 X119.524 Y124.744 E.01921
G1 X120.122 Y124.716 E.01838
M204 S10000
; WIPE_START
G1 F24000
G1 X120.272 Y124.732 E-.05765
G1 X120.767 Y124.804 E-.19006
G1 X121.358 Y125.008 E-.23761
G1 X121.9 Y125.321 E-.23761
G1 X121.974 Y125.385 E-.03707
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I.306 J1.178 P1  F30000
G1 X138.803 Y121.007 Z4.8
G1 Z4.4
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X138.945 Y121 E.00437
G1 X139.555 Y121.1 E.01901
G1 X140.13 Y121.329 E.01901
G1 X140.642 Y121.676 E.01901
G1 X141.068 Y122.125 E.01901
G1 X141.387 Y122.655 E.01901
G1 X141.584 Y123.242 E.01901
G1 X141.651 Y123.857 E.01901
G1 X141.584 Y124.472 E.01901
G1 X141.537 Y124.612 E.00454
G1 X141.387 Y125.058 E.01447
G1 X141.068 Y125.588 E.01901
G1 X140.642 Y126.037 E.01901
G1 X140.13 Y126.385 E.01901
G1 X139.555 Y126.614 E.01901
G1 X138.945 Y126.714 E.01901
G1 X138.327 Y126.68 E.01901
G1 X137.731 Y126.515 E.01901
G1 X137.184 Y126.225 E.01901
G1 X136.713 Y125.824 E.01901
G1 X136.338 Y125.332 E.01901
G1 X136.078 Y124.77 E.01901
G1 X135.945 Y124.166 E.01901
G1 X135.945 Y123.547 E.01901
G1 X136.078 Y122.943 E.01901
G1 X136.338 Y122.382 E.01901
G1 X136.713 Y121.889 E.01901
G1 X137.184 Y121.489 E.01901
G1 X137.731 Y121.199 E.01901
G1 X138.327 Y121.033 E.01901
G1 X138.743 Y121.011 E.0128
M204 S10000
G1 X138.979 Y120.576 F30000
M204 S5000
G1 F1200
G1 X139.07 Y120.589 E.00283
G1 X139.565 Y120.66 E.01537
G1 X140.156 Y120.865 E.01921
G1 X140.698 Y121.178 E.01921
G1 X141.17 Y121.587 E.01921
G1 X141.557 Y122.079 E.01921
G1 X141.843 Y122.634 E.01921
G1 X142.02 Y123.234 E.01921
G1 X142.079 Y123.857 E.01921
G1 X142.02 Y124.479 E.01921
G1 X141.843 Y125.079 E.01921
G1 X141.557 Y125.635 E.01921
G1 X141.17 Y126.126 E.01921
G1 X140.698 Y126.536 E.01921
G1 X140.156 Y126.849 E.01921
G1 X139.565 Y127.053 E.01921
G1 X138.946 Y127.142 E.01921
G1 X138.322 Y127.112 E.01921
G1 X137.714 Y126.965 E.01921
G1 X137.145 Y126.705 E.01921
G1 X136.636 Y126.342 E.01921
G1 X136.205 Y125.89 E.01921
G1 X135.867 Y125.364 E.01921
G1 X135.634 Y124.783 E.01921
G1 X135.516 Y124.169 E.01921
G1 X135.516 Y123.544 E.01921
G1 X135.634 Y122.93 E.01921
G1 X135.867 Y122.35 E.01921
G1 X136.205 Y121.824 E.01921
G1 X136.636 Y121.371 E.01921
G1 X137.145 Y121.008 E.01921
G1 X137.714 Y120.749 E.01921
G1 X138.322 Y120.601 E.01921
G1 X138.919 Y120.573 E.01838
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 4.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X139.07 Y120.589 E-.05765
G1 X139.565 Y120.66 E-.19006
G1 X140.156 Y120.865 E-.23761
G1 X140.698 Y121.178 E-.23761
G1 X140.772 Y121.241 E-.03707
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 23/27
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
G3 Z4.8 I.965 J-.742 P1  F30000
G1 X124.139 Y99.614 Z4.8
G1 Z4.6
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X124.261 Y99.607 E.00377
G1 X124.872 Y99.708 E.01901
G1 X125.447 Y99.937 E.01901
G1 X125.959 Y100.284 E.01901
G1 X126.384 Y100.733 E.01901
G1 X126.703 Y101.263 E.01901
G1 X126.901 Y101.849 E.01901
G1 X126.968 Y102.465 E.01901
G1 X126.901 Y103.08 E.01901
G1 X126.703 Y103.666 E.01901
G1 X126.384 Y104.196 E.01901
G1 X125.959 Y104.645 E.01901
G1 X125.447 Y104.992 E.01901
G1 X124.872 Y105.221 E.01901
G1 X124.261 Y105.322 E.01901
G1 X123.644 Y105.288 E.01901
G1 X123.047 Y105.123 E.01901
G1 X122.501 Y104.833 E.01901
G1 X122.029 Y104.432 E.01901
G1 X121.655 Y103.94 E.01901
G1 X121.395 Y103.378 E.01901
G1 X121.262 Y102.774 E.01901
G1 X121.262 Y102.155 E.01901
G1 X121.395 Y101.551 E.01901
G1 X121.655 Y100.989 E.01901
G1 X122.029 Y100.497 E.01901
G1 X122.501 Y100.096 E.01901
G1 X123.047 Y99.807 E.01901
G1 X123.644 Y99.641 E.01901
G1 X124.079 Y99.617 E.0134
M204 S10000
G1 X124.27 Y99.18 F30000
M204 S5000
G1 F1200
G1 X124.363 Y99.194 E.00289
G1 X124.882 Y99.268 E.01611
G1 X125.473 Y99.473 E.01921
G1 X126.014 Y99.785 E.01921
G1 X126.487 Y100.195 E.01921
G1 X126.873 Y100.686 E.01921
G1 X127.16 Y101.242 E.01921
G1 X127.336 Y101.842 E.01921
G1 X127.396 Y102.465 E.01921
G1 X127.336 Y103.087 E.01921
G1 X127.16 Y103.687 E.01921
G1 X126.873 Y104.243 E.01921
G1 X126.487 Y104.734 E.01921
G1 X126.014 Y105.144 E.01921
G1 X125.473 Y105.456 E.01921
G1 X124.882 Y105.661 E.01921
G1 X124.263 Y105.75 E.01921
G1 X123.638 Y105.72 E.01921
G1 X123.031 Y105.573 E.01921
G1 X122.462 Y105.313 E.01921
G1 X121.953 Y104.95 E.01921
G1 X121.521 Y104.498 E.01921
G1 X121.183 Y103.972 E.01921
G1 X120.951 Y103.391 E.01921
G1 X120.832 Y102.777 E.01921
G1 X120.832 Y102.152 E.01921
G1 X120.951 Y101.538 E.01921
G1 X121.183 Y100.957 E.01921
G1 X121.521 Y100.431 E.01921
G1 X121.953 Y99.979 E.01921
G1 X122.462 Y99.616 E.01921
G1 X123.031 Y99.356 E.01921
G1 X123.638 Y99.209 E.01921
G1 X124.21 Y99.182 E.01758
M204 S10000
; WIPE_START
G1 F24000
G1 X124.363 Y99.194 E-.05835
G1 X124.882 Y99.268 E-.19926
G1 X125.473 Y99.473 E-.23761
G1 X126.014 Y99.785 E-.23761
G1 X126.068 Y99.832 E-.02717
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I-1.184 J-.283 P1  F30000
G1 X120.024 Y125.15 Z5
G1 Z4.6
M73 P91 R0
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X120.147 Y125.143 E.00377
G1 X120.758 Y125.243 E.01901
G1 X121.332 Y125.472 E.01901
G1 X121.844 Y125.819 E.01901
G1 X122.27 Y126.268 E.01901
G1 X122.589 Y126.799 E.01901
G1 X122.786 Y127.385 E.01901
G1 X122.853 Y128 E.01901
G1 X122.786 Y128.615 E.01901
G1 X122.589 Y129.201 E.01901
G1 X122.27 Y129.732 E.01901
G1 X121.844 Y130.181 E.01901
G1 X121.332 Y130.528 E.01901
G1 X120.758 Y130.757 E.01901
G1 X120.147 Y130.857 E.01901
G1 X119.529 Y130.824 E.01901
G1 X118.933 Y130.658 E.01901
G1 X118.386 Y130.368 E.01901
G1 X117.915 Y129.968 E.01901
G1 X117.54 Y129.475 E.01901
G1 X117.281 Y128.914 E.01901
G1 X117.148 Y128.309 E.01901
G1 X117.148 Y127.691 E.01901
G1 X117.281 Y127.086 E.01901
G1 X117.54 Y126.525 E.01901
G1 X117.915 Y126.032 E.01901
G1 X118.386 Y125.632 E.01901
G1 X118.933 Y125.342 E.01901
G1 X119.529 Y125.176 E.01901
G1 X119.965 Y125.153 E.0134
M204 S10000
G1 X120.155 Y124.716 F30000
M204 S5000
G1 F1200
G1 X120.248 Y124.729 E.00289
G1 X120.767 Y124.804 E.01611
G1 X121.358 Y125.008 E.01921
G1 X121.9 Y125.321 E.01921
G1 X122.372 Y125.73 E.01921
G1 X122.759 Y126.222 E.01921
G1 X123.046 Y126.778 E.01921
G1 X123.222 Y127.378 E.01921
G1 X123.281 Y128 E.01921
G1 X123.222 Y128.622 E.01921
G1 X123.046 Y129.222 E.01921
G1 X122.759 Y129.778 E.01921
G1 X122.372 Y130.27 E.01921
G1 X121.9 Y130.679 E.01921
G1 X121.358 Y130.992 E.01921
G1 X120.767 Y131.196 E.01921
G1 X120.149 Y131.285 E.01921
G1 X119.524 Y131.256 E.01921
G1 X118.916 Y131.108 E.01921
G1 X118.348 Y130.848 E.01921
G1 X117.838 Y130.486 E.01921
G1 X117.407 Y130.033 E.01921
G1 X117.069 Y129.507 E.01921
G1 X116.836 Y128.927 E.01921
G1 X116.718 Y128.313 E.01921
G1 X116.718 Y127.687 E.01921
G1 X116.836 Y127.073 E.01921
G1 X117.069 Y126.493 E.01921
G1 X117.407 Y125.967 E.01921
G1 X117.838 Y125.514 E.01921
G1 X118.348 Y125.152 E.01921
G1 X118.916 Y124.892 E.01921
G1 X119.524 Y124.744 E.01921
G1 X120.095 Y124.717 E.01758
M204 S10000
; WIPE_START
G1 F24000
G1 X120.248 Y124.729 E-.05835
G1 X120.767 Y124.804 E-.19926
G1 X121.358 Y125.008 E-.23761
G1 X121.9 Y125.321 E-.23761
G1 X121.954 Y125.368 E-.02717
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I.305 J1.178 P1  F30000
G1 X138.822 Y121.006 Z5
G1 Z4.6
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X138.945 Y121 E.00377
G1 X139.555 Y121.1 E.01901
G1 X140.13 Y121.329 E.01901
G1 X140.642 Y121.676 E.01901
G1 X141.068 Y122.125 E.01901
G1 X141.387 Y122.655 E.01901
G1 X141.584 Y123.242 E.01901
G1 X141.651 Y123.857 E.01901
G1 X141.584 Y124.472 E.01901
G1 X141.387 Y125.058 E.01901
G1 X141.068 Y125.588 E.01901
G1 X140.642 Y126.037 E.01901
G1 X140.13 Y126.385 E.01901
G1 X139.555 Y126.614 E.01901
G1 X138.945 Y126.714 E.01901
G1 X138.327 Y126.68 E.01901
G1 X137.731 Y126.515 E.01901
G1 X137.184 Y126.225 E.01901
G1 X136.713 Y125.824 E.01901
G1 X136.338 Y125.332 E.01901
G1 X136.078 Y124.77 E.01901
G1 X135.945 Y124.166 E.01901
G1 X135.945 Y123.547 E.01901
G1 X136.078 Y122.943 E.01901
G1 X136.338 Y122.382 E.01901
G1 X136.713 Y121.889 E.01901
G1 X137.184 Y121.489 E.01901
G1 X137.731 Y121.199 E.01901
G1 X138.327 Y121.033 E.01901
G1 X138.762 Y121.01 E.0134
M204 S10000
G1 X138.953 Y120.572 F30000
M204 S5000
G1 F1200
G1 X139.046 Y120.586 E.00289
G1 X139.565 Y120.66 E.01611
G1 X140.156 Y120.865 E.01921
G1 X140.698 Y121.178 E.01921
G1 X141.17 Y121.587 E.01921
G1 X141.557 Y122.079 E.01921
G1 X141.843 Y122.634 E.01921
G1 X142.02 Y123.234 E.01921
G1 X142.079 Y123.857 E.01921
G1 X142.02 Y124.479 E.01921
G1 X141.843 Y125.079 E.01921
G1 X141.557 Y125.635 E.01921
G1 X141.17 Y126.126 E.01921
G1 X140.698 Y126.536 E.01921
G1 X140.156 Y126.849 E.01921
G1 X139.565 Y127.053 E.01921
G1 X138.946 Y127.142 E.01921
G1 X138.322 Y127.112 E.01921
G1 X137.714 Y126.965 E.01921
G1 X137.145 Y126.705 E.01921
G1 X136.636 Y126.342 E.01921
G1 X136.205 Y125.89 E.01921
G1 X135.867 Y125.364 E.01921
G1 X135.634 Y124.783 E.01921
G1 X135.516 Y124.169 E.01921
G1 X135.516 Y123.544 E.01921
G1 X135.634 Y122.93 E.01921
G1 X135.867 Y122.35 E.01921
G1 X136.205 Y121.824 E.01921
G1 X136.636 Y121.371 E.01921
G1 X137.145 Y121.008 E.01921
G1 X137.714 Y120.749 E.01921
G1 X138.322 Y120.601 E.01921
G1 X138.893 Y120.574 E.01758
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 4.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X139.046 Y120.586 E-.05835
G1 X139.565 Y120.66 E-.19926
G1 X140.156 Y120.865 E-.23761
G1 X140.698 Y121.178 E-.23761
G1 X140.752 Y121.224 E-.02717
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 24/27
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
G3 Z5 I.965 J-.741 P1  F30000
G1 X124.157 Y99.613 Z5
G1 Z4.8
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X124.261 Y99.607 E.0032
G1 X124.872 Y99.708 E.01901
G1 X125.447 Y99.937 E.01901
G1 X125.959 Y100.284 E.01901
G1 X126.384 Y100.733 E.01901
G1 X126.703 Y101.263 E.01901
G1 X126.901 Y101.849 E.01901
G1 X126.968 Y102.465 E.01901
G1 X126.901 Y103.08 E.01901
G1 X126.703 Y103.666 E.01901
G1 X126.384 Y104.196 E.01901
G1 X125.959 Y104.645 E.01901
G1 X125.447 Y104.992 E.01901
G1 X124.872 Y105.221 E.01901
G1 X124.261 Y105.322 E.01901
G1 X123.644 Y105.288 E.01901
G1 X123.047 Y105.123 E.01901
G1 X122.501 Y104.833 E.01901
G1 X122.029 Y104.432 E.01901
G1 X121.655 Y103.94 E.01901
G1 X121.395 Y103.378 E.01901
G1 X121.262 Y102.774 E.01901
G1 X121.262 Y102.155 E.01901
G1 X121.395 Y101.551 E.01901
G1 X121.655 Y100.989 E.01901
G1 X122.029 Y100.497 E.01901
G1 X122.501 Y100.096 E.01901
G1 X123.047 Y99.807 E.01901
G1 X123.644 Y99.641 E.01901
G1 X124.098 Y99.616 E.01397
M204 S10000
G1 X124.245 Y99.18 F30000
M204 S5000
G1 F1200
G1 X124.263 Y99.179 E.00055
G1 X124.339 Y99.19 E.00236
G1 X124.882 Y99.268 E.01686
G1 X125.473 Y99.473 E.01921
M73 P92 R0
G1 X126.014 Y99.785 E.01921
G1 X126.487 Y100.195 E.01921
G1 X126.873 Y100.686 E.01921
G1 X127.16 Y101.242 E.01921
G1 X127.336 Y101.842 E.01921
G1 X127.396 Y102.465 E.01921
G1 X127.336 Y103.087 E.01921
G1 X127.16 Y103.687 E.01921
G1 X126.873 Y104.243 E.01921
G1 X126.487 Y104.734 E.01921
G1 X126.014 Y105.144 E.01921
G1 X125.473 Y105.456 E.01921
G1 X124.882 Y105.661 E.01921
G1 X124.263 Y105.75 E.01921
G1 X123.638 Y105.72 E.01921
G1 X123.031 Y105.573 E.01921
G1 X122.462 Y105.313 E.01921
G1 X121.953 Y104.95 E.01921
G1 X121.521 Y104.498 E.01921
G1 X121.183 Y103.972 E.01921
G1 X120.951 Y103.391 E.01921
G1 X120.832 Y102.777 E.01921
G1 X120.832 Y102.152 E.01921
G1 X120.951 Y101.538 E.01921
G1 X121.183 Y100.957 E.01921
G1 X121.521 Y100.431 E.01921
G1 X121.953 Y99.979 E.01921
G1 X122.462 Y99.616 E.01921
G1 X123.031 Y99.356 E.01921
G1 X123.638 Y99.209 E.01921
G1 X124.185 Y99.183 E.01682
M204 S10000
; WIPE_START
G1 F24000
G1 X124.263 Y99.179 E-.02958
G1 X124.339 Y99.19 E-.02916
G1 X124.882 Y99.268 E-.20845
G1 X125.473 Y99.473 E-.23761
G1 X126.014 Y99.785 E-.23761
G1 X126.049 Y99.816 E-.01759
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I-1.184 J-.281 P1  F30000
G1 X120.043 Y125.149 Z5.2
G1 Z4.8
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X120.147 Y125.143 E.0032
G1 X120.758 Y125.243 E.01901
G1 X121.332 Y125.472 E.01901
G1 X121.844 Y125.819 E.01901
G1 X122.27 Y126.268 E.01901
G1 X122.589 Y126.799 E.01901
G1 X122.786 Y127.385 E.01901
G1 X122.853 Y128 E.01901
G1 X122.786 Y128.615 E.01901
G1 X122.589 Y129.201 E.01901
G1 X122.27 Y129.732 E.01901
G1 X121.844 Y130.181 E.01901
G1 X121.332 Y130.528 E.01901
G1 X120.758 Y130.757 E.01901
G1 X120.147 Y130.857 E.01901
G1 X119.529 Y130.824 E.01901
G1 X118.933 Y130.658 E.01901
G1 X118.386 Y130.368 E.01901
G1 X117.915 Y129.968 E.01901
G1 X117.54 Y129.475 E.01901
G1 X117.281 Y128.914 E.01901
G1 X117.148 Y128.309 E.01901
G1 X117.148 Y127.691 E.01901
G1 X117.281 Y127.086 E.01901
G1 X117.54 Y126.525 E.01901
G1 X117.915 Y126.032 E.01901
G1 X118.386 Y125.632 E.01901
G1 X118.933 Y125.342 E.01901
G1 X119.529 Y125.176 E.01901
G1 X119.983 Y125.152 E.01397
M204 S10000
G1 X120.131 Y124.716 F30000
M204 S5000
G1 F1200
G1 X120.149 Y124.715 E.00055
G1 X120.225 Y124.726 E.00236
G1 X120.767 Y124.804 E.01686
G1 X121.358 Y125.008 E.01921
G1 X121.9 Y125.321 E.01921
G1 X122.372 Y125.73 E.01921
G1 X122.759 Y126.222 E.01921
G1 X123.046 Y126.778 E.01921
G1 X123.222 Y127.378 E.01921
G1 X123.281 Y128 E.01921
G1 X123.222 Y128.622 E.01921
G1 X123.046 Y129.222 E.01921
G1 X122.759 Y129.778 E.01921
G1 X122.372 Y130.27 E.01921
G1 X121.9 Y130.679 E.01921
G1 X121.358 Y130.992 E.01921
G1 X120.767 Y131.196 E.01921
G1 X120.149 Y131.285 E.01921
G1 X119.524 Y131.256 E.01921
G1 X118.916 Y131.108 E.01921
G1 X118.348 Y130.848 E.01921
G1 X117.838 Y130.486 E.01921
G1 X117.407 Y130.033 E.01921
G1 X117.069 Y129.507 E.01921
G1 X116.836 Y128.927 E.01921
G1 X116.718 Y128.313 E.01921
G1 X116.718 Y127.687 E.01921
G1 X116.836 Y127.073 E.01921
G1 X117.069 Y126.493 E.01921
G1 X117.407 Y125.967 E.01921
G1 X117.838 Y125.514 E.01921
G1 X118.348 Y125.152 E.01921
G1 X118.916 Y124.892 E.01921
G1 X119.524 Y124.744 E.01921
G1 X120.071 Y124.718 E.01682
M204 S10000
; WIPE_START
G1 F24000
G1 X120.149 Y124.715 E-.02958
G1 X120.225 Y124.726 E-.02916
G1 X120.767 Y124.804 E-.20845
G1 X121.358 Y125.008 E-.23761
G1 X121.9 Y125.321 E-.23761
G1 X121.935 Y125.351 E-.01759
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I.303 J1.179 P1  F30000
G1 X138.841 Y121.005 Z5.2
G1 Z4.8
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X138.945 Y121 E.0032
G1 X139.555 Y121.1 E.01901
G1 X140.13 Y121.329 E.01901
G1 X140.642 Y121.676 E.01901
G1 X141.068 Y122.125 E.01901
G1 X141.387 Y122.655 E.01901
G1 X141.584 Y123.242 E.01901
G1 X141.651 Y123.857 E.01901
G1 X141.584 Y124.472 E.01901
G1 X141.387 Y125.058 E.01901
G1 X141.068 Y125.588 E.01901
G1 X140.642 Y126.037 E.01901
G1 X140.13 Y126.385 E.01901
G1 X139.555 Y126.614 E.01901
G1 X138.945 Y126.714 E.01901
G1 X138.327 Y126.68 E.01901
G1 X137.731 Y126.515 E.01901
G1 X137.184 Y126.225 E.01901
G1 X136.713 Y125.824 E.01901
G1 X136.338 Y125.332 E.01901
G1 X136.078 Y124.77 E.01901
G1 X135.945 Y124.166 E.01901
G1 X135.945 Y123.547 E.01901
G1 X136.078 Y122.943 E.01901
G1 X136.338 Y122.382 E.01901
G1 X136.713 Y121.889 E.01901
G1 X137.184 Y121.489 E.01901
G1 X137.731 Y121.199 E.01901
G1 X138.327 Y121.033 E.01901
G1 X138.781 Y121.009 E.01397
M204 S10000
G1 X138.929 Y120.572 F30000
M204 S5000
G1 F1200
G1 X138.946 Y120.571 E.00055
G1 X139.022 Y120.582 E.00236
G1 X139.565 Y120.66 E.01686
G1 X140.156 Y120.865 E.01921
G1 X140.698 Y121.178 E.01921
G1 X141.17 Y121.587 E.01921
G1 X141.557 Y122.079 E.01921
G1 X141.843 Y122.634 E.01921
G1 X142.02 Y123.234 E.01921
G1 X142.079 Y123.857 E.01921
G1 X142.02 Y124.479 E.01921
G1 X141.843 Y125.079 E.01921
G1 X141.557 Y125.635 E.01921
G1 X141.17 Y126.126 E.01921
G1 X140.698 Y126.536 E.01921
G1 X140.156 Y126.849 E.01921
G1 X139.565 Y127.053 E.01921
G1 X138.946 Y127.142 E.01921
G1 X138.322 Y127.112 E.01921
G1 X137.714 Y126.965 E.01921
G1 X137.145 Y126.705 E.01921
G1 X136.636 Y126.342 E.01921
G1 X136.205 Y125.89 E.01921
G1 X135.867 Y125.364 E.01921
G1 X135.634 Y124.783 E.01921
G1 X135.516 Y124.169 E.01921
G1 X135.516 Y123.544 E.01921
G1 X135.634 Y122.93 E.01921
G1 X135.867 Y122.35 E.01921
G1 X136.205 Y121.824 E.01921
G1 X136.636 Y121.371 E.01921
G1 X137.145 Y121.008 E.01921
G1 X137.714 Y120.749 E.01921
G1 X138.322 Y120.601 E.01921
G1 X138.869 Y120.575 E.01682
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 5
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X138.946 Y120.571 E-.02958
G1 X139.022 Y120.582 E-.02916
G1 X139.565 Y120.66 E-.20845
G1 X140.156 Y120.865 E-.23761
G1 X140.698 Y121.178 E-.23761
G1 X140.733 Y121.208 E-.01759
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 25/27
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
M73 P93 R0
G3 Z5.2 I.966 J-.74 P1  F30000
G1 X124.175 Y99.612 Z5.2
G1 Z5
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X124.176 Y99.612 E.00003
G1 X124.261 Y99.607 E.00262
G1 X124.872 Y99.708 E.01901
G1 X125.447 Y99.937 E.01901
G1 X125.959 Y100.284 E.01901
G1 X126.384 Y100.733 E.01901
G1 X126.703 Y101.263 E.01901
G1 X126.901 Y101.849 E.01901
G1 X126.968 Y102.465 E.01901
G1 X126.901 Y103.08 E.01901
G1 X126.703 Y103.666 E.01901
G1 X126.384 Y104.196 E.01901
G1 X125.959 Y104.645 E.01901
G1 X125.447 Y104.992 E.01901
G1 X124.872 Y105.221 E.01901
G1 X124.261 Y105.322 E.01901
G1 X123.644 Y105.288 E.01901
G1 X123.047 Y105.123 E.01901
G1 X122.501 Y104.833 E.01901
G1 X122.029 Y104.432 E.01901
G1 X121.655 Y103.94 E.01901
G1 X121.395 Y103.378 E.01901
G1 X121.262 Y102.774 E.01901
G1 X121.262 Y102.155 E.01901
G1 X121.395 Y101.551 E.01901
G1 X121.655 Y100.989 E.01901
G1 X122.029 Y100.497 E.01901
G1 X122.501 Y100.096 E.01901
G1 X123.047 Y99.807 E.01901
G1 X123.644 Y99.641 E.01901
G1 X124.115 Y99.615 E.01452
M204 S10000
G1 X124.222 Y99.19 F30000
M204 S5000
G1 F1200
G1 X124.315 Y99.187 E.00286
G1 X124.882 Y99.268 E.0176
G1 X125.473 Y99.473 E.01921
G1 X126.014 Y99.785 E.01921
G1 X126.487 Y100.195 E.01921
G1 X126.873 Y100.686 E.01921
G1 X127.16 Y101.242 E.01921
G1 X127.336 Y101.842 E.01921
G1 X127.396 Y102.465 E.01921
G1 X127.336 Y103.087 E.01921
G1 X127.16 Y103.687 E.01921
G1 X126.873 Y104.243 E.01921
G1 X126.487 Y104.734 E.01921
G1 X126.014 Y105.144 E.01921
G1 X125.473 Y105.456 E.01921
G1 X124.882 Y105.661 E.01921
G1 X124.263 Y105.75 E.01921
G1 X123.638 Y105.72 E.01921
G1 X123.031 Y105.573 E.01921
G1 X122.462 Y105.313 E.01921
G1 X121.953 Y104.95 E.01921
G1 X121.521 Y104.498 E.01921
G1 X121.183 Y103.972 E.01921
G1 X120.951 Y103.391 E.01921
G1 X120.832 Y102.777 E.01921
G1 X120.832 Y102.152 E.01921
G1 X120.951 Y101.538 E.01921
G1 X121.183 Y100.957 E.01921
G1 X121.521 Y100.431 E.01921
G1 X121.953 Y99.979 E.01921
G1 X122.462 Y99.616 E.01921
G1 X123.031 Y99.356 E.01921
G1 X123.638 Y99.209 E.01921
G1 X124.162 Y99.192 E.0161
M204 S10000
; WIPE_START
G1 F24000
G1 X124.315 Y99.187 E-.05813
G1 X124.882 Y99.268 E-.21765
G1 X125.473 Y99.473 E-.23761
G1 X126.014 Y99.785 E-.23761
G1 X126.032 Y99.801 E-.00901
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I-1.185 J-.279 P1  F30000
G1 X120.061 Y125.148 Z5.4
G1 Z5
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X120.062 Y125.148 E.00003
G1 X120.147 Y125.143 E.00262
G1 X120.758 Y125.243 E.01901
G1 X121.332 Y125.472 E.01901
G1 X121.844 Y125.819 E.01901
G1 X122.27 Y126.268 E.01901
G1 X122.589 Y126.799 E.01901
G1 X122.786 Y127.385 E.01901
G1 X122.853 Y128 E.01901
G1 X122.786 Y128.615 E.01901
G1 X122.589 Y129.201 E.01901
G1 X122.27 Y129.732 E.01901
G1 X121.844 Y130.181 E.01901
G1 X121.332 Y130.528 E.01901
G1 X120.758 Y130.757 E.01901
G1 X120.147 Y130.857 E.01901
G1 X119.529 Y130.824 E.01901
G1 X118.933 Y130.658 E.01901
G1 X118.386 Y130.368 E.01901
G1 X117.915 Y129.968 E.01901
G1 X117.54 Y129.475 E.01901
G1 X117.281 Y128.914 E.01901
G1 X117.148 Y128.309 E.01901
G1 X117.148 Y127.691 E.01901
G1 X117.281 Y127.086 E.01901
G1 X117.54 Y126.525 E.01901
G1 X117.915 Y126.032 E.01901
G1 X118.386 Y125.632 E.01901
G1 X118.933 Y125.342 E.01901
G1 X119.529 Y125.176 E.01901
G1 X120.001 Y125.151 E.01452
M204 S10000
G1 X120.108 Y124.725 F30000
M204 S5000
G1 F1200
G1 X120.201 Y124.722 E.00286
G1 X120.767 Y124.804 E.0176
G1 X121.358 Y125.008 E.01921
G1 X121.9 Y125.321 E.01921
G1 X122.372 Y125.73 E.01921
G1 X122.759 Y126.222 E.01921
G1 X123.046 Y126.778 E.01921
G1 X123.222 Y127.378 E.01921
G1 X123.281 Y128 E.01921
G1 X123.222 Y128.622 E.01921
G1 X123.046 Y129.222 E.01921
G1 X122.759 Y129.778 E.01921
G1 X122.372 Y130.27 E.01921
G1 X121.9 Y130.679 E.01921
G1 X121.358 Y130.992 E.01921
G1 X120.767 Y131.196 E.01921
G1 X120.149 Y131.285 E.01921
G1 X119.524 Y131.256 E.01921
G1 X118.916 Y131.108 E.01921
G1 X118.348 Y130.848 E.01921
G1 X117.838 Y130.486 E.01921
G1 X117.407 Y130.033 E.01921
G1 X117.069 Y129.507 E.01921
G1 X116.836 Y128.927 E.01921
G1 X116.718 Y128.313 E.01921
G1 X116.718 Y127.687 E.01921
G1 X116.836 Y127.073 E.01921
G1 X117.069 Y126.493 E.01921
G1 X117.407 Y125.967 E.01921
G1 X117.838 Y125.514 E.01921
G1 X118.348 Y125.152 E.01921
G1 X118.916 Y124.892 E.01921
G1 X119.524 Y124.744 E.01921
G1 X120.048 Y124.727 E.0161
M204 S10000
; WIPE_START
G1 F24000
G1 X120.201 Y124.722 E-.05813
G1 X120.767 Y124.804 E-.21765
G1 X121.358 Y125.008 E-.23761
G1 X121.9 Y125.321 E-.23761
G1 X121.918 Y125.336 E-.00901
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I.301 J1.179 P1  F30000
G1 X138.859 Y121.004 Z5.4
G1 Z5
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X138.86 Y121.004 E.00003
G1 X138.945 Y121 E.00262
G1 X139.555 Y121.1 E.01901
G1 X140.13 Y121.329 E.01901
G1 X140.642 Y121.676 E.01901
G1 X141.068 Y122.125 E.01901
G1 X141.387 Y122.655 E.01901
G1 X141.584 Y123.242 E.01901
G1 X141.651 Y123.857 E.01901
G1 X141.584 Y124.472 E.01901
G1 X141.387 Y125.058 E.01901
G1 X141.068 Y125.588 E.01901
G1 X140.642 Y126.037 E.01901
G1 X140.13 Y126.385 E.01901
G1 X139.555 Y126.614 E.01901
G1 X138.945 Y126.714 E.01901
G1 X138.327 Y126.68 E.01901
G1 X137.731 Y126.515 E.01901
G1 X137.184 Y126.225 E.01901
G1 X136.713 Y125.824 E.01901
G1 X136.338 Y125.332 E.01901
G1 X136.078 Y124.77 E.01901
G1 X135.945 Y124.166 E.01901
G1 X135.945 Y123.547 E.01901
G1 X136.078 Y122.943 E.01901
G1 X136.338 Y122.382 E.01901
G1 X136.713 Y121.889 E.01901
G1 X137.184 Y121.489 E.01901
G1 X137.731 Y121.199 E.01901
G1 X138.327 Y121.033 E.01901
G1 X138.799 Y121.008 E.01452
M204 S10000
G1 X138.906 Y120.582 F30000
M204 S5000
G1 F1200
G1 X138.998 Y120.579 E.00286
G1 X139.565 Y120.66 E.0176
M73 P94 R0
G1 X140.156 Y120.865 E.01921
G1 X140.698 Y121.178 E.01921
G1 X141.17 Y121.587 E.01921
G1 X141.557 Y122.079 E.01921
G1 X141.843 Y122.634 E.01921
G1 X142.02 Y123.234 E.01921
G1 X142.079 Y123.857 E.01921
G1 X142.02 Y124.479 E.01921
G1 X141.843 Y125.079 E.01921
G1 X141.557 Y125.635 E.01921
G1 X141.17 Y126.126 E.01921
G1 X140.698 Y126.536 E.01921
G1 X140.156 Y126.849 E.01921
G1 X139.565 Y127.053 E.01921
G1 X138.946 Y127.142 E.01921
G1 X138.322 Y127.112 E.01921
G1 X137.714 Y126.965 E.01921
G1 X137.145 Y126.705 E.01921
G1 X136.636 Y126.342 E.01921
G1 X136.205 Y125.89 E.01921
G1 X135.867 Y125.364 E.01921
G1 X135.634 Y124.783 E.01921
G1 X135.516 Y124.169 E.01921
G1 X135.516 Y123.544 E.01921
G1 X135.634 Y122.93 E.01921
G1 X135.867 Y122.35 E.01921
G1 X136.205 Y121.824 E.01921
G1 X136.636 Y121.371 E.01921
G1 X137.145 Y121.008 E.01921
G1 X137.714 Y120.749 E.01921
G1 X138.322 Y120.601 E.01921
G1 X138.846 Y120.584 E.0161
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 5.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X138.998 Y120.579 E-.05813
G1 X139.565 Y120.66 E-.21765
G1 X140.156 Y120.865 E-.23761
G1 X140.698 Y121.178 E-.23761
G1 X140.716 Y121.193 E-.00901
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 26/27
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
G3 Z5.4 I.966 J-.74 P1  F30000
G1 X124.192 Y99.611 Z5.4
G1 Z5.2
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X124.197 Y99.611 E.00015
G1 X124.261 Y99.607 E.00198
G1 X124.872 Y99.708 E.01901
G1 X125.447 Y99.937 E.01901
G1 X125.959 Y100.284 E.01901
G1 X126.384 Y100.733 E.01901
G1 X126.703 Y101.263 E.01901
G1 X126.901 Y101.849 E.01901
G1 X126.968 Y102.465 E.01901
G1 X126.901 Y103.08 E.01901
G1 X126.703 Y103.666 E.01901
G1 X126.384 Y104.196 E.01901
G1 X125.959 Y104.645 E.01901
G1 X125.447 Y104.992 E.01901
G1 X124.872 Y105.221 E.01901
G1 X124.261 Y105.322 E.01901
G1 X123.644 Y105.288 E.01901
G1 X123.047 Y105.123 E.01901
G1 X122.501 Y104.833 E.01901
G1 X122.029 Y104.432 E.01901
G1 X121.655 Y103.94 E.01901
G1 X121.395 Y103.378 E.01901
G1 X121.262 Y102.774 E.01901
G1 X121.262 Y102.155 E.01901
G1 X121.395 Y101.551 E.01901
G1 X121.655 Y100.989 E.01901
G1 X122.029 Y100.497 E.01901
G1 X122.501 Y100.096 E.01901
G1 X123.047 Y99.807 E.01901
G1 X123.644 Y99.641 E.01901
G1 X124.132 Y99.615 E.01503
M204 S10000
G1 X124.2 Y99.187 F30000
M204 S5000
G1 F1200
G1 X124.291 Y99.183 E.00281
G1 X124.882 Y99.268 E.01834
G1 X125.473 Y99.473 E.01921
G1 X126.014 Y99.785 E.01921
G1 X126.487 Y100.195 E.01921
G1 X126.873 Y100.686 E.01921
G1 X127.16 Y101.242 E.01921
G1 X127.336 Y101.842 E.01921
G1 X127.396 Y102.465 E.01921
G1 X127.336 Y103.087 E.01921
G1 X127.16 Y103.687 E.01921
G1 X126.873 Y104.243 E.01921
G1 X126.487 Y104.734 E.01921
G1 X126.014 Y105.144 E.01921
G1 X125.473 Y105.456 E.01921
G1 X124.882 Y105.661 E.01921
G1 X124.263 Y105.75 E.01921
G1 X123.638 Y105.72 E.01921
G1 X123.031 Y105.573 E.01921
G1 X122.462 Y105.313 E.01921
G1 X121.953 Y104.95 E.01921
G1 X121.521 Y104.498 E.01921
G1 X121.183 Y103.972 E.01921
G1 X120.951 Y103.391 E.01921
G1 X120.832 Y102.777 E.01921
G1 X120.832 Y102.152 E.01921
G1 X120.951 Y101.538 E.01921
G1 X121.183 Y100.957 E.01921
G1 X121.521 Y100.431 E.01921
G1 X121.953 Y99.979 E.01921
G1 X122.462 Y99.616 E.01921
G1 X123.031 Y99.356 E.01921
G1 X123.638 Y99.209 E.01921
G1 X124.14 Y99.189 E.01542
M204 S10000
; WIPE_START
G1 F24000
G1 X124.291 Y99.183 E-.05753
G1 X124.882 Y99.268 E-.22684
G1 X125.473 Y99.473 E-.23761
G1 X126.014 Y99.785 E-.23761
G1 X126.015 Y99.786 E-.00041
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I-1.185 J-.277 P1  F30000
G1 X120.078 Y125.147 Z5.6
G1 Z5.2
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X120.083 Y125.146 E.00015
G1 X120.147 Y125.143 E.00198
G1 X120.758 Y125.243 E.01901
G1 X121.332 Y125.472 E.01901
G1 X121.844 Y125.819 E.01901
G1 X122.27 Y126.268 E.01901
G1 X122.589 Y126.799 E.01901
G1 X122.786 Y127.385 E.01901
G1 X122.853 Y128 E.01901
G1 X122.786 Y128.615 E.01901
G1 X122.589 Y129.201 E.01901
G1 X122.27 Y129.732 E.01901
G1 X121.844 Y130.181 E.01901
G1 X121.332 Y130.528 E.01901
G1 X120.758 Y130.757 E.01901
G1 X120.147 Y130.857 E.01901
G1 X119.529 Y130.824 E.01901
G1 X118.933 Y130.658 E.01901
G1 X118.386 Y130.368 E.01901
G1 X117.915 Y129.968 E.01901
G1 X117.54 Y129.475 E.01901
G1 X117.281 Y128.914 E.01901
G1 X117.148 Y128.309 E.01901
G1 X117.148 Y127.691 E.01901
G1 X117.281 Y127.086 E.01901
G1 X117.54 Y126.525 E.01901
G1 X117.915 Y126.032 E.01901
G1 X118.386 Y125.632 E.01901
G1 X118.933 Y125.342 E.01901
G1 X119.529 Y125.176 E.01901
G1 X120.018 Y125.15 E.01503
M204 S10000
G1 X120.085 Y124.722 F30000
M204 S5000
G1 F1200
G1 X120.177 Y124.719 E.00281
G1 X120.767 Y124.804 E.01834
G1 X121.358 Y125.008 E.01921
G1 X121.9 Y125.321 E.01921
G1 X122.372 Y125.73 E.01921
G1 X122.759 Y126.222 E.01921
G1 X123.046 Y126.778 E.01921
G1 X123.222 Y127.378 E.01921
G1 X123.281 Y128 E.01921
G1 X123.222 Y128.622 E.01921
G1 X123.046 Y129.222 E.01921
G1 X122.759 Y129.778 E.01921
G1 X122.372 Y130.27 E.01921
G1 X121.9 Y130.679 E.01921
G1 X121.358 Y130.992 E.01921
G1 X120.767 Y131.196 E.01921
G1 X120.149 Y131.285 E.01921
G1 X119.524 Y131.256 E.01921
G1 X118.916 Y131.108 E.01921
G1 X118.348 Y130.848 E.01921
G1 X117.838 Y130.486 E.01921
G1 X117.407 Y130.033 E.01921
G1 X117.069 Y129.507 E.01921
G1 X116.836 Y128.927 E.01921
G1 X116.718 Y128.313 E.01921
G1 X116.718 Y127.687 E.01921
G1 X116.836 Y127.073 E.01921
G1 X117.069 Y126.493 E.01921
G1 X117.407 Y125.967 E.01921
G1 X117.838 Y125.514 E.01921
G1 X118.348 Y125.152 E.01921
G1 X118.916 Y124.892 E.01921
G1 X119.524 Y124.744 E.01921
G1 X120.025 Y124.725 E.01542
M204 S10000
; WIPE_START
G1 F24000
G1 X120.177 Y124.719 E-.05753
G1 X120.767 Y124.804 E-.22684
G1 X121.358 Y125.008 E-.23761
G1 X121.9 Y125.321 E-.23761
G1 X121.901 Y125.322 E-.00041
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I.3 J1.179 P1  F30000
G1 X138.875 Y121.003 Z5.6
M73 P95 R0
G1 Z5.2
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X138.88 Y121.003 E.00015
G1 X138.945 Y121 E.00198
G1 X139.555 Y121.1 E.01901
G1 X140.13 Y121.329 E.01901
G1 X140.642 Y121.676 E.01901
G1 X141.068 Y122.125 E.01901
G1 X141.387 Y122.655 E.01901
G1 X141.584 Y123.242 E.01901
G1 X141.651 Y123.857 E.01901
G1 X141.584 Y124.472 E.01901
G1 X141.387 Y125.058 E.01901
G1 X141.068 Y125.588 E.01901
G1 X140.642 Y126.037 E.01901
G1 X140.13 Y126.385 E.01901
G1 X139.555 Y126.614 E.01901
G1 X138.945 Y126.714 E.01901
G1 X138.327 Y126.68 E.01901
G1 X137.731 Y126.515 E.01901
G1 X137.184 Y126.225 E.01901
G1 X136.713 Y125.824 E.01901
G1 X136.338 Y125.332 E.01901
G1 X136.078 Y124.77 E.01901
G1 X135.945 Y124.166 E.01901
G1 X135.945 Y123.547 E.01901
G1 X136.078 Y122.943 E.01901
G1 X136.338 Y122.382 E.01901
G1 X136.713 Y121.889 E.01901
G1 X137.184 Y121.489 E.01901
G1 X137.731 Y121.199 E.01901
G1 X138.327 Y121.033 E.01901
G1 X138.816 Y121.007 E.01503
M204 S10000
G1 X138.883 Y120.579 F30000
M204 S5000
G1 F1200
G1 X138.974 Y120.575 E.00281
G1 X139.565 Y120.66 E.01834
G1 X140.156 Y120.865 E.01921
G1 X140.698 Y121.178 E.01921
G1 X141.17 Y121.587 E.01921
G1 X141.557 Y122.079 E.01921
G1 X141.843 Y122.634 E.01921
G1 X142.02 Y123.234 E.01921
G1 X142.079 Y123.857 E.01921
G1 X142.02 Y124.479 E.01921
G1 X141.843 Y125.079 E.01921
G1 X141.557 Y125.635 E.01921
G1 X141.17 Y126.126 E.01921
G1 X140.698 Y126.536 E.01921
G1 X140.156 Y126.849 E.01921
G1 X139.565 Y127.053 E.01921
G1 X138.946 Y127.142 E.01921
G1 X138.322 Y127.112 E.01921
G1 X137.714 Y126.965 E.01921
G1 X137.145 Y126.705 E.01921
G1 X136.636 Y126.342 E.01921
G1 X136.205 Y125.89 E.01921
G1 X135.867 Y125.364 E.01921
G1 X135.634 Y124.783 E.01921
G1 X135.516 Y124.169 E.01921
G1 X135.516 Y123.544 E.01921
G1 X135.634 Y122.93 E.01921
G1 X135.867 Y122.35 E.01921
G1 X136.205 Y121.824 E.01921
G1 X136.636 Y121.371 E.01921
G1 X137.145 Y121.008 E.01921
G1 X137.714 Y120.749 E.01921
G1 X138.322 Y120.601 E.01921
G1 X138.823 Y120.581 E.01542
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 5.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X138.974 Y120.575 E-.05753
G1 X139.565 Y120.66 E-.22684
G1 X140.156 Y120.865 E-.23761
G1 X140.698 Y121.178 E-.23761
G1 X140.699 Y121.178 E-.00041
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 27/27
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
G3 Z5.6 I.967 J-.739 P1  F30000
G1 X124.208 Y99.61 Z5.6
G1 Z5.4
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X124.218 Y99.61 E.00031
G1 X124.872 Y99.708 E.02032
G1 X125.447 Y99.937 E.01901
G1 X125.959 Y100.284 E.01901
G1 X126.384 Y100.733 E.01901
G1 X126.703 Y101.263 E.01901
G1 X126.901 Y101.849 E.01901
G1 X126.968 Y102.465 E.01901
G1 X126.887 Y103.121 E.02032
G1 X126.703 Y103.666 E.01767
G1 X126.384 Y104.196 E.01901
G1 X125.959 Y104.645 E.01901
G1 X125.447 Y104.992 E.01901
G1 X124.872 Y105.221 E.01901
G1 X124.261 Y105.322 E.01901
G1 X123.644 Y105.288 E.01901
G1 X123.047 Y105.123 E.01901
G1 X122.501 Y104.833 E.01901
G1 X122.029 Y104.432 E.01901
G1 X121.655 Y103.94 E.01901
G1 X121.395 Y103.378 E.01901
G1 X121.262 Y102.774 E.01901
G1 X121.262 Y102.155 E.01901
G1 X121.395 Y101.551 E.01901
G1 X121.655 Y100.989 E.01901
G1 X122.029 Y100.497 E.01901
G1 X122.501 Y100.096 E.01901
G1 X123.047 Y99.807 E.01901
G1 X123.644 Y99.641 E.01901
G1 X124.148 Y99.614 E.01551
M204 S10000
G1 X124.179 Y99.184 F30000
M204 S5000
G1 F1200
G1 X124.267 Y99.18 E.00272
G1 X124.882 Y99.268 E.01909
G1 X125.473 Y99.473 E.01921
G1 X126.014 Y99.785 E.01921
G1 X126.487 Y100.195 E.01921
G1 X126.873 Y100.686 E.01921
G1 X127.16 Y101.242 E.01921
G1 X127.336 Y101.842 E.01921
G1 X127.396 Y102.465 E.01921
G1 X127.336 Y103.087 E.01921
G1 X127.16 Y103.687 E.01921
G1 X126.873 Y104.243 E.01921
G1 X126.487 Y104.734 E.01921
G1 X126.014 Y105.144 E.01921
G1 X125.473 Y105.456 E.01921
G1 X124.882 Y105.661 E.01921
G1 X124.263 Y105.75 E.01921
G1 X123.638 Y105.72 E.01921
M73 P96 R0
G1 X123.031 Y105.573 E.01921
G1 X122.462 Y105.313 E.01921
G1 X121.953 Y104.95 E.01921
G1 X121.521 Y104.498 E.01921
G1 X121.183 Y103.972 E.01921
G1 X120.951 Y103.391 E.01921
G1 X120.832 Y102.777 E.01921
G1 X120.832 Y102.152 E.01921
G1 X120.951 Y101.538 E.01921
G1 X121.183 Y100.957 E.01921
G1 X121.521 Y100.431 E.01921
G1 X121.953 Y99.979 E.01921
G1 X122.462 Y99.616 E.01921
G1 X123.031 Y99.356 E.01921
G1 X123.638 Y99.209 E.01921
G1 X124.119 Y99.187 E.01478
M204 S10000
; WIPE_START
G1 F24000
G1 X124.267 Y99.18 E-.0564
G1 X124.882 Y99.268 E-.23603
G1 X125.473 Y99.473 E-.23761
G1 X125.997 Y99.775 E-.22996
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I-1.185 J-.276 P1  F30000
G1 X120.093 Y125.146 Z5.8
G1 Z5.4
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X120.103 Y125.145 E.00031
G1 X120.758 Y125.243 E.02032
G1 X121.332 Y125.472 E.01901
G1 X121.844 Y125.819 E.01901
G1 X122.27 Y126.268 E.01901
G1 X122.589 Y126.799 E.01901
G1 X122.786 Y127.385 E.01901
G1 X122.853 Y128 E.01901
G1 X122.772 Y128.656 E.02032
G1 X122.589 Y129.201 E.01767
G1 X122.27 Y129.732 E.01901
G1 X121.844 Y130.181 E.01901
G1 X121.332 Y130.528 E.01901
G1 X120.758 Y130.757 E.01901
G1 X120.147 Y130.857 E.01901
G1 X119.529 Y130.824 E.01901
G1 X118.933 Y130.658 E.01901
G1 X118.386 Y130.368 E.01901
G1 X117.915 Y129.968 E.01901
G1 X117.54 Y129.475 E.01901
G1 X117.281 Y128.914 E.01901
G1 X117.148 Y128.309 E.01901
G1 X117.148 Y127.691 E.01901
G1 X117.281 Y127.086 E.01901
G1 X117.54 Y126.525 E.01901
G1 X117.915 Y126.032 E.01901
G1 X118.386 Y125.632 E.01901
G1 X118.933 Y125.342 E.01901
G1 X119.529 Y125.176 E.01901
G1 X120.033 Y125.149 E.01551
M204 S10000
G1 X120.064 Y124.719 F30000
M204 S5000
G1 F1200
G1 X120.153 Y124.715 E.00272
G1 X120.767 Y124.804 E.01909
G1 X121.358 Y125.008 E.01921
G1 X121.9 Y125.321 E.01921
G1 X122.372 Y125.73 E.01921
G1 X122.759 Y126.222 E.01921
G1 X123.046 Y126.778 E.01921
G1 X123.222 Y127.378 E.01921
G1 X123.281 Y128 E.01921
G1 X123.222 Y128.622 E.01921
G1 X123.046 Y129.222 E.01921
G1 X122.759 Y129.778 E.01921
G1 X122.372 Y130.27 E.01921
G1 X121.9 Y130.679 E.01921
G1 X121.358 Y130.992 E.01921
G1 X120.767 Y131.196 E.01921
G1 X120.149 Y131.285 E.01921
G1 X119.524 Y131.256 E.01921
G1 X118.916 Y131.108 E.01921
G1 X118.348 Y130.848 E.01921
G1 X117.838 Y130.486 E.01921
G1 X117.407 Y130.033 E.01921
G1 X117.069 Y129.507 E.01921
G1 X116.836 Y128.927 E.01921
G1 X116.718 Y128.313 E.01921
G1 X116.718 Y127.687 E.01921
G1 X116.836 Y127.073 E.01921
G1 X117.069 Y126.493 E.01921
G1 X117.407 Y125.967 E.01921
G1 X117.838 Y125.514 E.01921
G1 X118.348 Y125.152 E.01921
G1 X118.916 Y124.892 E.01921
G1 X119.524 Y124.744 E.01921
G1 X120.004 Y124.722 E.01478
M204 S10000
; WIPE_START
G1 F24000
G1 X120.153 Y124.715 E-.0564
G1 X120.767 Y124.804 E-.23603
G1 X121.358 Y125.008 E-.23761
G1 X121.882 Y125.311 E-.22996
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I.299 J1.18 P1  F30000
G1 X138.891 Y121.003 Z5.8
G1 Z5.4
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X138.901 Y121.002 E.00031
G1 X139.555 Y121.1 E.02032
G1 X140.13 Y121.329 E.01901
G1 X140.642 Y121.676 E.01901
G1 X141.068 Y122.125 E.01901
G1 X141.387 Y122.655 E.01901
G1 X141.584 Y123.242 E.01901
G1 X141.651 Y123.857 E.01901
G1 X141.57 Y124.513 E.02032
G1 X141.387 Y125.058 E.01767
G1 X141.068 Y125.588 E.01901
G1 X140.642 Y126.037 E.01901
G1 X140.13 Y126.385 E.01901
G1 X139.555 Y126.614 E.01901
G1 X138.945 Y126.714 E.01901
G1 X138.327 Y126.68 E.01901
G1 X137.731 Y126.515 E.01901
G1 X137.184 Y126.225 E.01901
G1 X136.713 Y125.824 E.01901
G1 X136.338 Y125.332 E.01901
G1 X136.078 Y124.77 E.01901
G1 X135.945 Y124.166 E.01901
G1 X135.945 Y123.547 E.01901
G1 X136.078 Y122.943 E.01901
G1 X136.338 Y122.382 E.01901
G1 X136.713 Y121.889 E.01901
G1 X137.184 Y121.489 E.01901
G1 X137.731 Y121.199 E.01901
G1 X138.327 Y121.033 E.01901
G1 X138.831 Y121.006 E.01551
M204 S10000
G1 X138.862 Y120.576 F30000
M204 S5000
G1 F1200
G1 X138.951 Y120.572 E.00272
G1 X139.565 Y120.66 E.01909
G1 X140.156 Y120.865 E.01921
G1 X140.698 Y121.178 E.01921
G1 X141.17 Y121.587 E.01921
G1 X141.557 Y122.079 E.01921
G1 X141.843 Y122.634 E.01921
G1 X142.02 Y123.234 E.01921
G1 X142.079 Y123.857 E.01921
G1 X142.02 Y124.479 E.01921
G1 X141.843 Y125.079 E.01921
G1 X141.557 Y125.635 E.01921
G1 X141.17 Y126.126 E.01921
G1 X140.698 Y126.536 E.01921
G1 X140.156 Y126.849 E.01921
G1 X139.565 Y127.053 E.01921
G1 X138.946 Y127.142 E.01921
G1 X138.322 Y127.112 E.01921
G1 X137.714 Y126.965 E.01921
G1 X137.145 Y126.705 E.01921
G1 X136.636 Y126.342 E.01921
G1 X136.205 Y125.89 E.01921
G1 X135.867 Y125.364 E.01921
G1 X135.634 Y124.783 E.01921
G1 X135.516 Y124.169 E.01921
G1 X135.516 Y123.544 E.01921
G1 X135.634 Y122.93 E.01921
G1 X135.867 Y122.35 E.01921
G1 X136.205 Y121.824 E.01921
G1 X136.636 Y121.371 E.01921
G1 X137.145 Y121.008 E.01921
G1 X137.714 Y120.749 E.01921
G1 X138.322 Y120.601 E.01921
G1 X138.802 Y120.579 E.01478
M204 S10000
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F24000
G1 X138.951 Y120.572 E-.0564
G1 X139.565 Y120.66 E-.23603
G1 X140.156 Y120.865 E-.23761
G1 X140.68 Y121.168 E-.22996
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
G1 Z5.9 F900 ; lower z a little
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
M73 P97 R0
G1 Y265
G1 X100 F12000 ; wipe
M621 S255
M104 S0 ; turn off hotend

M400 ; wait all motion done
M17 S
M17 Z0.4 ; lower z motor current to reduce impact if there is something in the bottom

    G1 Z105.4 F600
    G1 Z103.4

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

