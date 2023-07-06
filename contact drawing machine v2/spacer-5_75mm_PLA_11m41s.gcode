; HEADER_BLOCK_START
; BambuStudio 01.06.02.04
; model printing time: 5m 53s; total estimated time: 11m 41s
; total layer number: 32
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
G1 X100 F5000; second wipe mouth
M73 P43 R6
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
    G29 A X105.29 Y75.6917 I27.7597 J68.6968
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
; layer num/total_layer_count: 1/32
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
G1 X127.572 Y90.565 F30000
G1 Z.4
M73 P45 R6
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.5
G1 F1200
G3 X127.35 Y90.376 I.363 J-.652 E.01091
G1 X127.526 Y90.526 E.0086
G1 X126.993 Y89.924 F30000
G1 F1200
G1 X127.164 Y90.149 E.01052
G3 X127.021 Y89.977 I.48 J-.542 E.00837
G1 X126.735 Y89.409 F30000
M73 P46 R6
G1 F1200
G1 X126.853 Y89.663 E.01044
G3 X126.752 Y89.466 I.58 J-.423 E.00828
G1 X126.6 Y88.963 F30000
G1 F1200
G3 X126.589 Y88.852 I.705 J-.125 E.00415
M73 P47 R6
G1 X126.649 Y89.125 E.0104
G3 X126.613 Y89.021 I.656 J-.287 E.00408
G1 X126.546 Y88.417 F30000
G1 F1200
G3 X126.56 Y88.277 I.715 J0 E.00523
G1 X126.56 Y88.556 E.01039
G3 X126.549 Y88.477 I.701 J-.139 E.00299
G1 X126.6 Y87.871 F30000
G1 F1200
M73 P48 R6
G3 X126.649 Y87.709 I.705 J.125 E.00632
G1 X126.589 Y87.981 E.0104
G3 X126.592 Y87.93 I.716 J.015 E.00191
G1 X126.853 Y87.17 F30000
G1 F1200
G1 X126.735 Y87.425 E.01044
G3 X126.82 Y87.22 I.698 J.169 E.00828
G1 X126.993 Y86.909 F30000
G1 F1200
G3 X127.164 Y86.684 I.651 J.317 E.01059
G1 X127.029 Y86.862 E.00829
G1 X127.572 Y86.269 F30000
G1 F1200
G1 X127.35 Y86.457 E.01084
G3 X127.521 Y86.3 I.584 J.463 E.00869
G1 X128.28 Y85.829 F30000
G1 F1200
G1 X127.968 Y85.994 E.01314
G1 X128.227 Y85.857 E.01091
M73 P49 R5
G1 X128.844 Y85.668 F30000
G1 F1200
G1 X128.528 Y85.754 E.01219
G1 X128.786 Y85.683 E.00996
G1 X129.301 Y85.63 F30000
G1 F1200
G1 X129.156 Y85.638 E.00538
G3 X129.408 Y85.624 I.161 J.638 E.00946
G1 X129.36 Y85.627 E.00179
G1 X129.979 Y85.698 F30000
G1 F1200
G1 X129.703 Y85.653 E.01042
G1 X129.891 Y85.672 E.00703
G1 X129.922 Y85.681 E.0012
G1 X130.264 Y85.785 F30000
G1 F1200
G1 X130.416 Y85.831 E.00594
G1 X130.523 Y85.888 E.0045
G1 X130.319 Y85.807 E.00816
G1 X130.785 Y86.028 F30000
G1 F1200
G1 X130.9 Y86.09 E.00486
G1 X131.016 Y86.185 E.00558
G1 X130.835 Y86.062 E.00816
G1 X131.246 Y86.373 F30000
G1 F1200
G1 X131.324 Y86.438 E.00379
G1 X131.438 Y86.576 E.00667
G1 X131.287 Y86.417 E.00817
G1 X131.626 Y86.805 F30000
G1 F1200
G1 X131.672 Y86.862 E.00272
G1 X131.771 Y87.046 E.00778
G1 X131.657 Y86.857 E.00822
G1 X131.91 Y87.307 F30000
G1 F1200
G1 X131.931 Y87.346 E.00165
G1 X132.001 Y87.576 E.00896
G1 X131.929 Y87.363 E.00835
G1 X132.086 Y87.856 F30000
G1 F1200
G1 X132.09 Y87.871 E.00058
G1 X132.118 Y88.155 E.01065
G1 X132.092 Y87.915 E.00899
G1 X132.118 Y88.678 F30000
G1 F1200
G1 X132.09 Y88.963 E.01065
G1 X132.086 Y88.978 E.00058
G1 X132.112 Y88.738 E.00899
G1 X131.931 Y89.488 F30000
G1 F1200
G1 X131.91 Y89.527 E.00165
G1 X132.001 Y89.258 E.01058
G1 X131.948 Y89.43 E.00672
G1 X131.672 Y89.972 F30000
G1 F1200
G1 X131.626 Y90.028 E.00272
G1 X131.771 Y89.788 E.01046
G1 X131.701 Y89.919 E.00554
G1 X131.246 Y90.46 F30000
G1 F1200
G1 X131.438 Y90.257 E.01041
G1 X131.324 Y90.396 E.00667
G1 X131.292 Y90.422 E.00156
G1 X131.029 Y90.638 F30000
G1 F1200
G1 X130.9 Y90.744 E.00621
G1 X130.781 Y90.807 E.00502
G1 X130.98 Y90.672 E.00895
G1 X130.416 Y91.002 F30000
G1 F1200
G1 X130.264 Y91.049 E.00594
G1 X130.523 Y90.945 E.0104
G1 X130.469 Y90.974 E.00227
G1 X129.891 Y91.162 F30000
G1 F1200
G1 X129.703 Y91.18 E.00703
G1 X129.979 Y91.135 E.01042
G1 X129.949 Y91.144 E.0012
G1 X129.408 Y91.209 F30000
G1 F1200
G3 X129.127 Y91.194 I-.102 J-.714 E.01055
G1 X129.348 Y91.206 E.00825
G1 X128.834 Y91.165 F30000
G1 F1200
G3 X128.558 Y91.088 I.055 J-.732 E.01074
G1 X128.776 Y91.149 E.00844
G1 X128.28 Y91.004 F30000
G1 F1200
G1 X127.968 Y90.839 E.01315
G1 X128.227 Y90.976 E.01091
; WIPE_START
G1 F24000
G1 X127.968 Y90.839 E-.38
G1 X128.227 Y90.976 E-.38
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-1.216 J-.051 P1  F30000
G1 X127.329 Y112.544 Z.6
G1 Z.2
G1 E.8 F1800
G1 F1200
G3 X127.107 Y112.356 I.363 J-.652 E.01091
G1 X127.283 Y112.505 E.0086
G1 X126.749 Y111.904 F30000
G1 F1200
G1 X126.92 Y112.129 E.01052
G3 X126.778 Y111.956 I.48 J-.542 E.00837
G1 X126.492 Y111.388 F30000
G1 F1200
G1 X126.61 Y111.643 E.01044
G3 X126.508 Y111.446 I.58 J-.423 E.00828
G1 X126.357 Y110.942 F30000
G1 F1200
G3 X126.346 Y110.832 I.705 J-.125 E.00415
G1 X126.406 Y111.104 E.0104
G3 X126.37 Y111.001 I.656 J-.287 E.00408
G1 X126.303 Y110.396 F30000
G1 F1200
G3 X126.317 Y110.257 I.715 J0 E.00523
G1 X126.317 Y110.536 E.01039
G3 X126.306 Y110.456 I.701 J-.139 E.00299
G1 X126.357 Y109.85 F30000
G1 F1200
G3 X126.406 Y109.688 I.705 J.125 E.00632
G1 X126.346 Y109.961 E.0104
G3 X126.349 Y109.91 I.716 J.015 E.00191
G1 X126.61 Y109.15 F30000
G1 F1200
G1 X126.492 Y109.404 E.01044
G3 X126.577 Y109.2 I.698 J.169 E.00828
G1 X126.749 Y108.889 F30000
G1 F1200
G3 X126.92 Y108.664 I.651 J.317 E.01059
G1 X126.786 Y108.841 E.00829
G1 X127.329 Y108.248 F30000
G1 F1200
G1 X127.107 Y108.437 E.01084
G3 X127.278 Y108.28 I.584 J.463 E.00869
G1 X128.037 Y107.809 F30000
G1 F1200
G1 X127.725 Y107.974 E.01314
G1 X127.984 Y107.837 E.01091
G1 X128.6 Y107.647 F30000
G1 F1200
G1 X128.285 Y107.734 E.01219
G1 X128.542 Y107.663 E.00996
G1 X129.057 Y107.61 F30000
G1 F1200
G1 X128.913 Y107.617 E.00538
M73 P50 R5
G3 X129.165 Y107.604 I.161 J.638 E.00946
G1 X129.117 Y107.606 E.00179
G1 X129.736 Y107.678 F30000
G1 F1200
G1 X129.46 Y107.633 E.01042
G1 X129.648 Y107.651 E.00703
G1 X129.679 Y107.661 E.0012
G1 X130.02 Y107.764 F30000
G1 F1200
G1 X130.173 Y107.811 E.00594
G1 X130.28 Y107.868 E.0045
G1 X130.076 Y107.787 E.00816
G1 X130.542 Y108.008 F30000
G1 F1200
G1 X130.657 Y108.069 E.00486
G1 X130.773 Y108.164 E.00558
G1 X130.591 Y108.041 E.00816
G1 X131.002 Y108.353 F30000
G1 F1200
G1 X131.081 Y108.417 E.00379
G1 X131.194 Y108.556 E.00667
G1 X131.043 Y108.396 E.00817
G1 X131.383 Y108.785 F30000
G1 F1200
G1 X131.429 Y108.841 E.00272
G1 X131.527 Y109.026 E.00778
G1 X131.414 Y108.836 E.00822
G1 X131.667 Y109.286 F30000
G1 F1200
G1 X131.688 Y109.325 E.00165
G1 X131.757 Y109.555 E.00896
G1 X131.686 Y109.343 E.00835
G1 X131.842 Y109.835 F30000
G1 F1200
G1 X131.847 Y109.85 E.00058
G1 X131.875 Y110.135 E.01065
G1 X131.849 Y109.895 E.00899
G1 X131.875 Y110.658 F30000
G1 F1200
G1 X131.847 Y110.942 E.01065
G1 X131.842 Y110.957 E.00058
G1 X131.868 Y110.717 E.00899
G1 X131.688 Y111.467 F30000
G1 F1200
G1 X131.667 Y111.507 E.00165
G1 X131.757 Y111.237 E.01058
G1 X131.705 Y111.41 E.00672
G1 X131.429 Y111.951 F30000
G1 F1200
G1 X131.383 Y112.008 E.00272
G1 X131.527 Y111.767 E.01046
G1 X131.457 Y111.898 E.00554
G1 X131.002 Y112.44 F30000
G1 F1200
G1 X131.194 Y112.237 E.01041
G1 X131.081 Y112.375 E.00667
G1 X131.049 Y112.402 E.00156
G1 X130.786 Y112.618 F30000
G1 F1200
G1 X130.657 Y112.723 E.00621
G1 X130.538 Y112.787 E.00502
G1 X130.736 Y112.652 E.00895
G1 X130.173 Y112.982 F30000
G1 F1200
G1 X130.02 Y113.028 E.00594
G1 X130.28 Y112.925 E.0104
G1 X130.226 Y112.954 E.00227
G1 X129.648 Y113.141 F30000
G1 F1200
G1 X129.46 Y113.16 E.00703
G1 X129.736 Y113.115 E.01042
G1 X129.705 Y113.124 E.0012
G1 X129.165 Y113.189 F30000
G1 F1200
G3 X128.884 Y113.174 I-.102 J-.714 E.01055
G1 X129.105 Y113.186 E.00825
G1 X128.59 Y113.145 F30000
G1 F1200
G3 X128.314 Y113.068 I.055 J-.732 E.01074
G1 X128.533 Y113.129 E.00844
G1 X128.037 Y112.984 F30000
G1 F1200
G1 X127.725 Y112.819 E.01315
G1 X127.984 Y112.956 E.01091
; WIPE_START
G1 F24000
G1 X127.725 Y112.819 E-.38
G1 X127.984 Y112.956 E-.38
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-1.217 J.017 P1  F30000
G1 X128.227 Y130.148 Z.6
G1 Z.2
G1 E.8 F1800
G1 F1200
G3 X128.005 Y129.96 I.363 J-.652 E.01091
G1 X128.181 Y130.109 E.0086
G1 X127.647 Y129.507 F30000
G1 F1200
G1 X127.818 Y129.732 E.01052
G3 X127.676 Y129.56 I.48 J-.542 E.00837
G1 X127.39 Y128.992 F30000
G1 F1200
G1 X127.508 Y129.246 E.01044
G3 X127.407 Y129.049 I.58 J-.423 E.00828
G1 X127.255 Y128.546 F30000
G1 F1200
G3 X127.244 Y128.435 I.705 J-.125 E.00415
G1 X127.304 Y128.708 E.0104
G3 X127.268 Y128.605 I.656 J-.287 E.00408
G1 X127.201 Y128 F30000
G1 F1200
G3 X127.215 Y127.861 I.715 J0 E.00523
G1 X127.215 Y128.139 E.01039
G3 X127.204 Y128.06 I.701 J-.139 E.00299
G1 X127.255 Y127.454 F30000
G1 F1200
G3 X127.304 Y127.292 I.705 J.125 E.00632
G1 X127.244 Y127.565 E.0104
G3 X127.247 Y127.514 I.716 J.015 E.00191
G1 X127.508 Y126.754 F30000
G1 F1200
G1 X127.39 Y127.008 E.01044
G3 X127.475 Y126.803 I.698 J.169 E.00828
G1 X127.647 Y126.493 F30000
G1 F1200
G3 X127.818 Y126.268 I.651 J.317 E.01059
G1 X127.684 Y126.445 E.00829
G1 X128.227 Y125.852 F30000
G1 F1200
G1 X128.005 Y126.04 E.01084
G3 X128.176 Y125.883 I.584 J.463 E.00869
G1 X128.935 Y125.412 F30000
G1 F1200
G1 X128.623 Y125.578 E.01314
G1 X128.882 Y125.441 E.01091
G1 X129.499 Y125.251 F30000
G1 F1200
G1 X129.183 Y125.337 E.01219
G1 X129.441 Y125.267 E.00996
G1 X129.955 Y125.213 F30000
G1 F1200
G1 X129.811 Y125.221 E.00538
G3 X130.063 Y125.207 I.161 J.638 E.00946
G1 X130.015 Y125.21 E.00179
G1 X130.634 Y125.282 F30000
G1 F1200
G1 X130.358 Y125.236 E.01042
G1 X130.546 Y125.255 E.00703
G1 X130.577 Y125.264 E.0012
G1 X130.918 Y125.368 F30000
G1 F1200
G1 X131.071 Y125.414 E.00594
G1 X131.178 Y125.471 E.0045
G1 X130.974 Y125.39 E.00816
G1 X131.44 Y125.611 F30000
G1 F1200
G1 X131.555 Y125.673 E.00486
G1 X131.671 Y125.768 E.00558
G1 X131.489 Y125.645 E.00816
G1 X131.9 Y125.956 F30000
G1 F1200
G1 X131.979 Y126.021 E.00379
G1 X132.093 Y126.159 E.00667
G1 X131.942 Y126 E.00817
G1 X132.281 Y126.389 F30000
G1 F1200
G1 X132.327 Y126.445 E.00272
G1 X132.426 Y126.629 E.00778
G1 X132.312 Y126.44 E.00822
G1 X132.565 Y126.89 F30000
G1 F1200
G1 X132.586 Y126.929 E.00165
G1 X132.656 Y127.159 E.00896
G1 X132.584 Y126.947 E.00835
G1 X132.74 Y127.439 F30000
G1 F1200
G1 X132.745 Y127.454 E.00058
G1 X132.773 Y127.739 E.01065
G1 X132.747 Y127.499 E.00899
G1 X132.773 Y128.261 F30000
G1 F1200
G1 X132.745 Y128.546 E.01065
G1 X132.74 Y128.561 E.00058
G1 X132.767 Y128.321 E.00899
G1 X132.586 Y129.071 F30000
G1 F1200
G1 X132.565 Y129.11 E.00165
G1 X132.656 Y128.841 E.01058
G1 X132.603 Y129.014 E.00672
G1 X132.327 Y129.555 F30000
G1 F1200
G1 X132.281 Y129.611 E.00272
G1 X132.426 Y129.371 E.01046
G1 X132.355 Y129.502 E.00554
G1 X131.9 Y130.044 F30000
G1 F1200
G1 X132.093 Y129.841 E.01041
G1 X131.979 Y129.979 E.00667
G1 X131.947 Y130.006 E.00156
G1 X131.684 Y130.221 F30000
G1 F1200
G1 X131.555 Y130.327 E.00621
G1 X131.436 Y130.391 E.00502
G1 X131.634 Y130.255 E.00895
G1 X131.071 Y130.586 F30000
G1 F1200
G1 X130.918 Y130.632 E.00594
G1 X131.178 Y130.529 E.0104
G1 X131.124 Y130.557 E.00227
G1 X130.546 Y130.745 F30000
G1 F1200
G1 X130.358 Y130.764 E.00703
G1 X130.634 Y130.718 E.01042
G1 X130.603 Y130.728 E.0012
G1 X130.063 Y130.793 F30000
G1 F1200
G3 X129.782 Y130.777 I-.102 J-.714 E.01055
G1 X130.003 Y130.789 E.00825
G1 X129.489 Y130.748 F30000
G1 F1200
G3 X129.212 Y130.672 I.055 J-.732 E.01074
G1 X129.431 Y130.732 E.00844
G1 X128.935 Y130.588 F30000
G1 F1200
G1 X128.623 Y130.422 E.01315
G1 X128.882 Y130.559 E.01091
; WIPE_START
G1 F24000
G1 X128.623 Y130.422 E-.38
G1 X128.882 Y130.559 E-.38
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-.556 J-1.083 P1  F30000
G1 X107.602 Y141.486 Z.6
G1 Z.2
G1 E.8 F1800
G1 F1200
G3 X107.38 Y141.298 I.363 J-.652 E.01091
G1 X107.556 Y141.448 E.0086
G1 X107.023 Y140.846 F30000
G1 F1200
G1 X107.194 Y141.071 E.01052
G3 X107.051 Y140.898 I.48 J-.542 E.00837
G1 X106.883 Y140.585 F30000
G1 F1200
G3 X106.766 Y140.331 I.58 J-.423 E.0105
G1 X106.858 Y140.53 E.0082
G1 X106.63 Y139.885 F30000
G1 F1200
G3 X106.619 Y139.774 I.705 J-.125 E.00415
G1 X106.679 Y140.046 E.0104
G3 X106.643 Y139.943 I.656 J-.287 E.00408
G1 X106.577 Y139.339 F30000
G1 F1200
G3 X106.59 Y139.199 I.715 J0 E.00523
G1 X106.59 Y139.478 E.01039
G3 X106.579 Y139.399 I.701 J-.139 E.00299
G1 X106.63 Y138.792 F30000
G1 F1200
G3 X106.679 Y138.631 I.705 J.125 E.00632
G1 X106.619 Y138.903 E.0104
G3 X106.622 Y138.852 I.716 J.015 E.00191
G1 X106.883 Y138.092 F30000
G1 F1200
G1 X106.766 Y138.347 E.01044
G3 X106.85 Y138.142 I.698 J.169 E.00828
G1 X107.194 Y137.606 F30000
G1 F1200
G1 X107.023 Y137.831 E.01052
G3 X107.151 Y137.648 I.651 J.317 E.00837
G1 X107.38 Y137.379 F30000
G1 F1200
G3 X107.602 Y137.191 I.584 J.463 E.01091
G1 X107.426 Y137.34 E.0086
; WIPE_START
G1 F24000
G1 X107.602 Y137.191 E-.38
G1 X107.426 Y137.34 E-.38
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I.675 J1.013 P1  F30000
G1 X108.31 Y136.751 Z.6
G1 Z.2
G1 E.8 F1800
G1 F1200
G1 X107.999 Y136.916 E.01313
G1 X108.257 Y136.779 E.0109
G1 X108.588 Y136.667 F30000
G1 F1200
G3 X108.864 Y136.59 I.331 J.656 E.01074
G1 X108.646 Y136.651 E.00844
G1 X109.439 Y136.546 F30000
G1 F1200
G1 X109.157 Y136.561 E.01048
G3 X109.379 Y136.54 I.179 J.699 E.00833
G1 X109.714 Y136.573 F30000
M73 P51 R5
G1 F1200
G1 X109.913 Y136.593 E.00744
G1 X110.001 Y136.619 E.00344
G1 X109.773 Y136.583 E.0086
G1 X110.3 Y136.709 F30000
G1 F1200
G1 X110.447 Y136.753 E.00572
G1 X110.553 Y136.81 E.00449
G1 X110.355 Y136.731 E.00793
G1 X110.815 Y136.95 F30000
G1 F1200
G1 X110.93 Y137.011 E.00486
G1 X111.046 Y137.106 E.00558
G1 X110.865 Y136.984 E.00816
G1 X111.468 Y137.498 F30000
G1 F1200
G1 X111.276 Y137.295 E.01041
G1 X111.354 Y137.359 E.00379
G1 X111.43 Y137.451 E.00443
G1 X111.656 Y137.727 F30000
G1 F1200
G1 X111.702 Y137.784 E.00272
G1 X111.801 Y137.968 E.00777
G1 X111.687 Y137.779 E.00822
G1 X112.031 Y138.498 F30000
G1 F1200
G1 X111.94 Y138.228 E.01058
G1 X111.961 Y138.267 E.00165
G1 X112.013 Y138.44 E.00672
G1 X112.116 Y138.777 F30000
G1 F1200
G1 X112.12 Y138.792 E.00058
G1 X112.148 Y139.077 E.01065
G1 X112.122 Y138.837 E.00899
G1 X112.148 Y139.6 F30000
G1 F1200
G1 X112.12 Y139.885 E.01065
G1 X112.116 Y139.9 E.00058
G1 X112.142 Y139.66 E.00899
G1 X111.961 Y140.41 F30000
G1 F1200
G1 X111.94 Y140.449 E.00165
G1 X112.031 Y140.179 E.01058
G1 X111.979 Y140.352 E.00672
G1 X111.702 Y140.893 F30000
G1 F1200
G1 X111.656 Y140.95 E.00272
G1 X111.801 Y140.709 E.01046
G1 X111.731 Y140.841 E.00554
G1 X111.338 Y141.316 F30000
G1 F1200
G1 X111.468 Y141.179 E.00703
G1 X111.354 Y141.318 E.00667
G1 X111.276 Y141.382 E.00379
G1 X111.297 Y141.36 E.00115
G1 X110.93 Y141.666 F30000
G1 F1200
G1 X110.815 Y141.727 E.00486
G1 X111.046 Y141.571 E.01039
G1 X110.977 Y141.628 E.00335
G1 X110.446 Y141.924 F30000
G1 F1200
G1 X110.294 Y141.971 E.00594
G1 X110.553 Y141.867 E.0104
G1 X110.499 Y141.896 E.00227
G1 X109.921 Y142.084 F30000
G1 F1200
G1 X109.734 Y142.102 E.00703
G1 X110.01 Y142.057 E.01042
G1 X109.979 Y142.066 E.0012
G1 X109.439 Y142.131 F30000
G1 F1200
G3 X109.157 Y142.116 I-.102 J-.714 E.01055
G1 X109.379 Y142.128 E.00825
G1 X108.864 Y142.087 F30000
G1 F1200
G3 X108.588 Y142.01 I.055 J-.733 E.01075
G1 X108.806 Y142.071 E.00844
; WIPE_START
G1 F24000
G1 X108.588 Y142.01 E-.38
G1 X108.806 Y142.071 E-.38
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I.465 J-1.125 P1  F30000
G1 X107.816 Y141.662 Z.6
G1 Z.2
G1 E.8 F1800
G1 F1200
G1 X108.31 Y141.926 E.02087
G1 X107.869 Y141.69 E.01864
; WIPE_START
G1 F24000
G1 X108.31 Y141.926 E-.38
G1 X107.869 Y141.69 E-.38
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I1.217 J-.014 P1  F30000
G1 X107.643 Y121.482 Z.6
G1 Z.2
G1 E.8 F1800
G1 F1200
G3 X107.421 Y121.293 I.363 J-.652 E.01091
G1 X107.598 Y121.443 E.0086
G1 X107.064 Y120.841 F30000
G1 F1200
G1 X107.235 Y121.066 E.01052
G3 X107.092 Y120.894 I.48 J-.542 E.00837
G1 X106.924 Y120.58 F30000
G1 F1200
G3 X106.807 Y120.326 I.58 J-.423 E.0105
G1 X106.899 Y120.526 E.0082
G1 X106.672 Y119.88 F30000
G1 F1200
G3 X106.661 Y119.769 I.705 J-.125 E.00415
G1 X106.721 Y120.042 E.0104
G3 X106.684 Y119.938 I.656 J-.287 E.00408
G1 X106.618 Y119.334 F30000
G1 F1200
G3 X106.631 Y119.194 I.715 J0 E.00523
G1 X106.631 Y119.473 E.01039
G3 X106.62 Y119.394 I.701 J-.139 E.00299
G1 X106.672 Y118.788 F30000
G1 F1200
G3 X106.721 Y118.626 I.705 J.125 E.00632
G1 X106.661 Y118.899 E.0104
G3 X106.663 Y118.847 I.716 J.015 E.00191
G1 X106.924 Y118.088 F30000
G1 F1200
G1 X106.807 Y118.342 E.01044
G3 X106.891 Y118.137 I.698 J.169 E.00828
G1 X107.235 Y117.602 F30000
G1 F1200
G1 X107.064 Y117.826 E.01052
G3 X107.192 Y117.643 I.651 J.317 E.00837
G1 X107.421 Y117.374 F30000
G1 F1200
G3 X107.643 Y117.186 I.584 J.463 E.01091
G1 X107.467 Y117.335 E.0086
; WIPE_START
G1 F24000
G1 X107.643 Y117.186 E-.38
G1 X107.467 Y117.335 E-.38
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I.675 J1.013 P1  F30000
G1 X108.351 Y116.746 Z.6
G1 Z.2
G1 E.8 F1800
G1 F1200
G1 X108.04 Y116.911 E.01313
G1 X108.298 Y116.774 E.0109
G1 X108.629 Y116.662 F30000
G1 F1200
G3 X108.905 Y116.585 I.331 J.656 E.01074
G1 X108.687 Y116.646 E.00844
G1 X109.48 Y116.541 F30000
G1 F1200
G1 X109.199 Y116.556 E.01048
G3 X109.42 Y116.535 I.179 J.699 E.00833
G1 X109.755 Y116.568 F30000
G1 F1200
G1 X109.954 Y116.588 E.00744
G1 X110.042 Y116.614 E.00344
G1 X109.814 Y116.578 E.0086
G1 X110.341 Y116.704 F30000
G1 F1200
G1 X110.488 Y116.748 E.00572
G1 X110.594 Y116.805 E.00449
G1 X110.396 Y116.726 E.00793
G1 X110.856 Y116.945 F30000
G1 F1200
G1 X110.971 Y117.007 E.00486
G1 X111.087 Y117.102 E.00558
G1 X110.906 Y116.979 E.00816
G1 X111.509 Y117.493 F30000
G1 F1200
G1 X111.317 Y117.29 E.01041
G1 X111.396 Y117.355 E.00379
G1 X111.471 Y117.447 E.00443
G1 X111.697 Y117.722 F30000
G1 F1200
G1 X111.744 Y117.779 E.00272
G1 X111.842 Y117.963 E.00777
G1 X111.728 Y117.774 E.00822
G1 X112.072 Y118.493 F30000
G1 F1200
G1 X111.981 Y118.224 E.01058
G1 X112.002 Y118.263 E.00165
G1 X112.055 Y118.435 E.00672
G1 X112.157 Y118.773 F30000
G1 F1200
G1 X112.162 Y118.788 E.00058
G1 X112.19 Y119.072 E.01065
G1 X112.163 Y118.832 E.00899
G1 X112.19 Y119.595 F30000
G1 F1200
G1 X112.162 Y119.88 E.01065
G1 X112.157 Y119.895 E.00058
G1 X112.183 Y119.655 E.00899
G1 X112.002 Y120.405 F30000
G1 F1200
G1 X111.981 Y120.444 E.00165
G1 X112.072 Y120.175 E.01058
G1 X112.02 Y120.347 E.00672
G1 X111.744 Y120.889 F30000
G1 F1200
G1 X111.697 Y120.945 E.00272
G1 X111.842 Y120.705 E.01046
G1 X111.772 Y120.836 E.00554
G1 X111.379 Y121.311 F30000
G1 F1200
G1 X111.509 Y121.175 E.00703
G1 X111.396 Y121.313 E.00667
G1 X111.317 Y121.377 E.00379
G1 X111.338 Y121.355 E.00115
G1 X110.971 Y121.661 F30000
G1 F1200
G1 X110.856 Y121.722 E.00486
G1 X111.087 Y121.566 E.01039
G1 X111.018 Y121.623 E.00335
G1 X110.488 Y121.92 F30000
G1 F1200
G1 X110.335 Y121.966 E.00594
G1 X110.594 Y121.863 E.0104
G1 X110.54 Y121.891 E.00227
G1 X109.963 Y122.079 F30000
G1 F1200
G1 X109.775 Y122.097 E.00703
G1 X110.051 Y122.052 E.01042
G1 X110.02 Y122.061 E.0012
G1 X109.48 Y122.126 F30000
G1 F1200
G3 X109.199 Y122.111 I-.102 J-.714 E.01055
G1 X109.42 Y122.123 E.00825
G1 X108.905 Y122.082 F30000
G1 F1200
G3 X108.629 Y122.006 I.055 J-.733 E.01075
G1 X108.847 Y122.066 E.00844
; WIPE_START
G1 F24000
G1 X108.629 Y122.006 E-.38
G1 X108.847 Y122.066 E-.38
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I.465 J-1.125 P1  F30000
G1 X107.857 Y121.657 Z.6
G1 Z.2
G1 E.8 F1800
G1 F1200
G1 X108.351 Y121.921 E.02087
G1 X107.91 Y121.686 E.01864
; WIPE_START
G1 F24000
G1 X108.351 Y121.921 E-.38
G1 X107.91 Y121.686 E-.38
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I1.216 J-.034 P1  F30000
G1 X107.349 Y101.705 Z.6
G1 Z.2
G1 E.8 F1800
G1 F1200
G3 X107.127 Y101.517 I.363 J-.652 E.01091
G1 X107.303 Y101.666 E.0086
G1 X106.77 Y101.065 F30000
G1 F1200
G1 X106.941 Y101.29 E.01052
G3 X106.798 Y101.117 I.48 J-.542 E.00837
G1 X106.63 Y100.804 F30000
G1 F1200
G3 X106.513 Y100.549 I.58 J-.423 E.0105
G1 X106.605 Y100.749 E.0082
G1 X106.377 Y100.103 F30000
G1 F1200
G3 X106.367 Y99.993 I.705 J-.125 E.00415
G1 X106.427 Y100.265 E.0104
G3 X106.39 Y100.162 I.656 J-.287 E.00408
G1 X106.324 Y99.557 F30000
G1 F1200
G3 X106.337 Y99.418 I.715 J0 E.00523
G1 X106.337 Y99.697 E.01039
G3 X106.326 Y99.617 I.701 J-.139 E.00299
G1 X106.377 Y99.011 F30000
G1 F1200
G3 X106.427 Y98.849 I.705 J.125 E.00632
G1 X106.367 Y99.122 E.0104
G3 X106.369 Y99.071 I.716 J.015 E.00191
G1 X106.63 Y98.311 F30000
G1 F1200
G1 X106.513 Y98.565 E.01044
G3 X106.597 Y98.361 I.698 J.169 E.00828
G1 X106.941 Y97.825 F30000
G1 F1200
G1 X106.77 Y98.05 E.01052
G3 X106.898 Y97.866 I.651 J.317 E.00837
G1 X107.127 Y97.598 F30000
G1 F1200
G3 X107.349 Y97.409 I.584 J.463 E.01091
G1 X107.173 Y97.559 E.0086
; WIPE_START
G1 F24000
M73 P52 R5
G1 X107.349 Y97.409 E-.38
G1 X107.173 Y97.559 E-.38
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I.675 J1.013 P1  F30000
G1 X108.057 Y96.97 Z.6
G1 Z.2
G1 E.8 F1800
G1 F1200
G1 X107.746 Y97.135 E.01313
G1 X108.004 Y96.998 E.0109
G1 X108.335 Y96.886 F30000
G1 F1200
G3 X108.611 Y96.809 I.331 J.656 E.01074
G1 X108.393 Y96.87 E.00844
G1 X109.186 Y96.765 F30000
G1 F1200
G1 X108.905 Y96.78 E.01048
G3 X109.126 Y96.759 I.179 J.699 E.00833
G1 X109.461 Y96.792 F30000
G1 F1200
G1 X109.66 Y96.811 E.00744
G1 X109.748 Y96.838 E.00344
G1 X109.52 Y96.801 E.0086
G1 X110.047 Y96.928 F30000
G1 F1200
G1 X110.194 Y96.972 E.00572
G1 X110.3 Y97.029 E.00449
G1 X110.102 Y96.95 E.00793
G1 X110.562 Y97.169 F30000
G1 F1200
G1 X110.677 Y97.23 E.00486
G1 X110.793 Y97.325 E.00558
G1 X110.612 Y97.202 E.00816
G1 X111.215 Y97.717 F30000
G1 F1200
G1 X111.023 Y97.514 E.01041
G1 X111.101 Y97.578 E.00379
G1 X111.177 Y97.67 E.00443
G1 X111.403 Y97.946 F30000
G1 F1200
G1 X111.45 Y98.002 E.00272
G1 X111.548 Y98.187 E.00777
G1 X111.434 Y97.997 E.00822
G1 X111.778 Y98.716 F30000
G1 F1200
G1 X111.687 Y98.447 E.01058
G1 X111.708 Y98.486 E.00165
G1 X111.761 Y98.659 E.00672
G1 X111.863 Y98.996 F30000
G1 F1200
G1 X111.867 Y99.011 E.00058
G1 X111.895 Y99.296 E.01065
G1 X111.869 Y99.056 E.00899
G1 X111.895 Y99.819 F30000
G1 F1200
G1 X111.867 Y100.103 E.01065
G1 X111.863 Y100.118 E.00058
G1 X111.889 Y99.878 E.00899
G1 X111.708 Y100.628 F30000
G1 F1200
G1 X111.687 Y100.668 E.00165
G1 X111.778 Y100.398 E.01058
G1 X111.726 Y100.571 E.00672
G1 X111.45 Y101.112 F30000
G1 F1200
G1 X111.403 Y101.169 E.00272
G1 X111.548 Y100.928 E.01046
G1 X111.478 Y101.059 E.00554
G1 X111.085 Y101.535 F30000
G1 F1200
G1 X111.215 Y101.398 E.00703
G1 X111.101 Y101.536 E.00667
G1 X111.023 Y101.601 E.00379
G1 X111.044 Y101.579 E.00115
G1 X110.677 Y101.884 F30000
G1 F1200
G1 X110.562 Y101.946 E.00486
G1 X110.793 Y101.789 E.01039
G1 X110.724 Y101.846 E.00335
G1 X110.193 Y102.143 F30000
G1 F1200
G1 X110.041 Y102.189 E.00594
G1 X110.3 Y102.086 E.0104
G1 X110.246 Y102.115 E.00227
G1 X109.668 Y102.302 F30000
G1 F1200
G1 X109.481 Y102.321 E.00703
G1 X109.757 Y102.276 E.01042
G1 X109.726 Y102.285 E.0012
G1 X109.186 Y102.35 F30000
G1 F1200
G3 X108.904 Y102.335 I-.102 J-.714 E.01055
G1 X109.126 Y102.347 E.00825
G1 X108.611 Y102.306 F30000
G1 F1200
G3 X108.335 Y102.229 I.055 J-.733 E.01075
G1 X108.553 Y102.29 E.00844
; WIPE_START
G1 F24000
G1 X108.335 Y102.229 E-.38
G1 X108.553 Y102.29 E-.38
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I.465 J-1.125 P1  F30000
G1 X107.563 Y101.881 Z.6
G1 Z.2
G1 E.8 F1800
G1 F1200
G1 X108.057 Y102.145 E.02087
G1 X107.616 Y101.909 E.01864
; WIPE_START
G1 F24000
G1 X108.057 Y102.145 E-.38
G1 X107.616 Y101.909 E-.38
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I1.216 J-.055 P1  F30000
G1 X106.567 Y78.89 Z.6
G1 Z.2
G1 E.8 F1800
G1 F1200
G3 X106.345 Y78.701 I.363 J-.652 E.01091
G1 X106.521 Y78.851 E.0086
G1 X105.988 Y78.249 F30000
G1 F1200
G1 X106.159 Y78.474 E.01052
G3 X106.016 Y78.302 I.48 J-.542 E.00837
G1 X105.848 Y77.988 F30000
G1 F1200
G3 X105.731 Y77.734 I.58 J-.423 E.0105
G1 X105.823 Y77.934 E.0082
G1 X105.595 Y77.288 F30000
G1 F1200
G3 X105.584 Y77.177 I.705 J-.125 E.00415
G1 X105.644 Y77.45 E.0104
G3 X105.608 Y77.346 I.656 J-.287 E.00408
G1 X105.542 Y76.742 F30000
G1 F1200
G3 X105.555 Y76.602 I.715 J0 E.00523
G1 X105.555 Y76.881 E.01039
G3 X105.544 Y76.802 I.701 J-.139 E.00299
G1 X105.595 Y76.196 F30000
G1 F1200
G3 X105.644 Y76.034 I.705 J.125 E.00632
G1 X105.584 Y76.307 E.0104
G3 X105.587 Y76.255 I.716 J.015 E.00191
G1 X105.848 Y75.495 F30000
G1 F1200
G1 X105.731 Y75.75 E.01044
G3 X105.815 Y75.545 I.698 J.169 E.00828
G1 X106.159 Y75.009 F30000
G1 F1200
G1 X105.988 Y75.234 E.01052
G3 X106.116 Y75.051 I.651 J.317 E.00837
G1 X106.345 Y74.782 F30000
G1 F1200
G3 X106.567 Y74.594 I.584 J.463 E.01091
G1 X106.391 Y74.743 E.0086
; WIPE_START
G1 F24000
G1 X106.567 Y74.594 E-.38
G1 X106.391 Y74.743 E-.38
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I.675 J1.013 P1  F30000
G1 X107.275 Y74.154 Z.6
G1 Z.2
G1 E.8 F1800
G1 F1200
G1 X106.964 Y74.319 E.01313
G1 X107.222 Y74.182 E.0109
G1 X107.553 Y74.07 F30000
G1 F1200
G3 X107.829 Y73.993 I.331 J.656 E.01074
G1 X107.611 Y74.054 E.00844
G1 X108.403 Y73.949 F30000
G1 F1200
G1 X108.122 Y73.964 E.01048
G3 X108.344 Y73.943 I.179 J.699 E.00833
G1 X108.679 Y73.976 F30000
G1 F1200
G1 X108.878 Y73.996 E.00744
G1 X108.966 Y74.022 E.00344
G1 X108.738 Y73.986 E.0086
G1 X109.265 Y74.112 F30000
G1 F1200
G1 X109.412 Y74.156 E.00572
G1 X109.518 Y74.213 E.00449
G1 X109.32 Y74.134 E.00793
G1 X109.78 Y74.353 F30000
G1 F1200
G1 X109.895 Y74.415 E.00486
G1 X110.011 Y74.51 E.00558
G1 X109.83 Y74.387 E.00816
G1 X110.433 Y74.901 F30000
G1 F1200
G1 X110.241 Y74.698 E.01041
G1 X110.319 Y74.763 E.00379
G1 X110.395 Y74.855 E.00443
G1 X110.621 Y75.13 F30000
G1 F1200
G1 X110.667 Y75.187 E.00272
G1 X110.766 Y75.371 E.00777
G1 X110.652 Y75.182 E.00822
G1 X110.996 Y75.901 F30000
G1 F1200
G1 X110.905 Y75.632 E.01058
G1 X110.926 Y75.671 E.00165
G1 X110.978 Y75.843 E.00672
G1 X111.081 Y76.181 F30000
G1 F1200
G1 X111.085 Y76.196 E.00058
G1 X111.113 Y76.48 E.01065
G1 X111.087 Y76.24 E.00899
G1 X111.113 Y77.003 F30000
G1 F1200
G1 X111.085 Y77.288 E.01065
G1 X111.081 Y77.303 E.00058
G1 X111.107 Y77.063 E.00899
G1 X110.926 Y77.813 F30000
G1 F1200
G1 X110.905 Y77.852 E.00165
G1 X110.996 Y77.583 E.01058
G1 X110.943 Y77.755 E.00672
G1 X110.667 Y78.297 F30000
G1 F1200
G1 X110.621 Y78.353 E.00272
G1 X110.766 Y78.113 E.01046
G1 X110.696 Y78.244 E.00554
G1 X110.303 Y78.719 F30000
G1 F1200
G1 X110.433 Y78.582 E.00703
G1 X110.319 Y78.721 E.00667
G1 X110.241 Y78.785 E.00379
G1 X110.262 Y78.763 E.00115
G1 X109.895 Y79.069 F30000
G1 F1200
G1 X109.78 Y79.13 E.00486
G1 X110.011 Y78.974 E.01039
G1 X109.942 Y79.031 E.00335
G1 X109.411 Y79.327 F30000
G1 F1200
G1 X109.259 Y79.374 E.00594
G1 X109.518 Y79.27 E.0104
G1 X109.464 Y79.299 E.00227
G1 X108.886 Y79.487 F30000
G1 F1200
G1 X108.698 Y79.505 E.00703
G1 X108.975 Y79.46 E.01042
G1 X108.944 Y79.469 E.0012
G1 X108.403 Y79.534 F30000
G1 F1200
G3 X108.122 Y79.519 I-.102 J-.714 E.01055
G1 X108.344 Y79.531 E.00825
G1 X107.829 Y79.49 F30000
G1 F1200
G3 X107.553 Y79.413 I.055 J-.733 E.01075
G1 X107.771 Y79.474 E.00844
; WIPE_START
G1 F24000
G1 X107.553 Y79.413 E-.38
G1 X107.771 Y79.474 E-.38
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I.465 J-1.125 P1  F30000
G1 X106.781 Y79.065 Z.6
G1 Z.2
M73 P53 R5
G1 E.8 F1800
G1 F1200
G1 X107.275 Y79.329 E.02087
G1 X106.834 Y79.093 E.01864
M106 S252.45
M106 P2 S178
; CHANGE_LAYER
; Z_HEIGHT: 0.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X107.275 Y79.329 E-.38
G1 X106.834 Y79.093 E-.38
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 2/32
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
G3 Z.6 I-.514 J1.103 P1  F30000
G1 X131.209 Y90.44 Z.6
G1 Z.4
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.42
G1 F2228
G1 X131.133 Y90.521 E.00342
G1 X130.639 Y90.856 E.01835
G1 X130.084 Y91.077 E.01835
G1 X129.495 Y91.174 E.01835
G1 X128.898 Y91.142 E.01835
G1 X128.323 Y90.982 E.01835
G1 X127.796 Y90.702 E.01835
G1 X127.341 Y90.316 E.01835
G1 X126.979 Y89.84 E.01835
G1 X126.728 Y89.298 E.01835
G1 X126.6 Y88.715 E.01835
G1 X126.6 Y88.118 E.01835
G1 X126.728 Y87.535 E.01835
G1 X126.979 Y86.993 E.01835
G1 X127.341 Y86.518 E.01835
G1 X127.796 Y86.131 E.01835
G1 X128.323 Y85.852 E.01835
G1 X128.95 Y85.689 E.0199
G1 X129.495 Y85.66 E.01676
G1 X130.084 Y85.756 E.01835
G1 X130.639 Y85.977 E.01835
G1 X131.133 Y86.312 E.01835
G1 X131.543 Y86.746 E.01835
G1 X131.851 Y87.257 E.01835
G1 X132.042 Y87.823 E.01835
G1 X132.106 Y88.417 E.01835
G1 X132.042 Y89.01 E.01835
G1 X131.851 Y89.576 E.01835
G1 X131.543 Y90.088 E.01835
G1 X131.251 Y90.397 E.01308
M204 S10000
; WIPE_START
G1 F24000
G1 X131.133 Y90.521 E-.0651
G1 X130.639 Y90.856 E-.22689
G1 X130.084 Y91.077 E-.22689
G1 X129.495 Y91.174 E-.22689
G1 X129.457 Y91.172 E-.01422
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I1.216 J-.034 P1  F30000
G1 X129.3 Y85.584 Z.8
G1 Z.4
G1 E.8 F1800
M204 S5000
G1 F2228
G1 X129.356 Y85.579 E.00173
G1 X129.899 Y85.632 E.01678
G1 X130.432 Y85.794 E.0171
G1 X130.922 Y86.056 E.0171
G1 X131.353 Y86.409 E.0171
G1 X131.706 Y86.839 E.0171
G1 X131.968 Y87.33 E.0171
G1 X132.13 Y87.863 E.0171
G1 X132.184 Y88.417 E.0171
G1 X132.13 Y88.971 E.0171
G1 X131.968 Y89.503 E.0171
G1 X131.706 Y89.994 E.0171
G1 X131.353 Y90.424 E.0171
G1 X130.922 Y90.777 E.0171
G1 X130.432 Y91.04 E.0171
G1 X129.899 Y91.201 E.0171
G1 X129.345 Y91.256 E.0171
G1 X128.791 Y91.201 E.0171
G1 X128.259 Y91.04 E.0171
G1 X127.768 Y90.777 E.0171
G1 X127.338 Y90.424 E.0171
G1 X126.985 Y89.994 E.0171
G1 X126.722 Y89.503 E.0171
G1 X126.561 Y88.971 E.0171
G1 X126.506 Y88.417 E.0171
G1 X126.561 Y87.863 E.0171
G1 X126.722 Y87.33 E.0171
G1 X126.985 Y86.839 E.0171
G1 X127.338 Y86.409 E.0171
G1 X127.768 Y86.056 E.0171
G1 X128.259 Y85.794 E.0171
G1 X128.791 Y85.632 E.0171
G1 X129.24 Y85.59 E.01385
M204 S10000
; WIPE_START
G1 F24000
G1 X129.356 Y85.579 E-.04414
G1 X129.899 Y85.632 E-.20749
G1 X130.432 Y85.794 E-.21149
G1 X130.922 Y86.056 E-.21148
G1 X131.096 Y86.199 E-.0854
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I-1.217 J-.006 P1  F30000
G1 X130.966 Y112.42 Z.8
G1 Z.4
G1 E.8 F1800
M204 S5000
G1 F2228
G1 X130.889 Y112.501 E.00342
G1 X130.395 Y112.836 E.01835
G1 X129.841 Y113.057 E.01835
G1 X129.251 Y113.154 E.01835
G1 X128.655 Y113.121 E.01835
G1 X128.08 Y112.961 E.01835
G1 X127.552 Y112.682 E.01835
G1 X127.097 Y112.295 E.01835
G1 X126.736 Y111.82 E.01835
G1 X126.485 Y111.278 E.01835
G1 X126.357 Y110.695 E.01835
G1 X126.357 Y110.098 E.01835
G1 X126.485 Y109.515 E.01835
G1 X126.736 Y108.973 E.01835
G1 X127.097 Y108.497 E.01835
G1 X127.552 Y108.111 E.01835
G1 X128.08 Y107.831 E.01835
G1 X128.707 Y107.669 E.0199
G1 X129.251 Y107.639 E.01676
G1 X129.841 Y107.736 E.01835
G1 X130.395 Y107.957 E.01835
G1 X130.889 Y108.292 E.01835
G1 X131.3 Y108.725 E.01835
G1 X131.608 Y109.237 E.01835
G1 X131.798 Y109.803 E.01835
G1 X131.863 Y110.396 E.01835
G1 X131.798 Y110.99 E.01835
G1 X131.608 Y111.556 E.01835
G1 X131.3 Y112.067 E.01835
G1 X131.007 Y112.377 E.01308
M204 S10000
; WIPE_START
G1 F24000
G1 X130.889 Y112.501 E-.0651
G1 X130.395 Y112.836 E-.22689
G1 X129.841 Y113.057 E-.22689
G1 X129.251 Y113.154 E-.22689
G1 X129.214 Y113.152 E-.01422
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I1.216 J-.034 P1  F30000
G1 X129.056 Y107.564 Z.8
G1 Z.4
G1 E.8 F1800
M204 S5000
G1 F2228
G1 X129.112 Y107.558 E.00173
G1 X129.656 Y107.612 E.01678
G1 X130.188 Y107.773 E.0171
G1 X130.679 Y108.036 E.0171
G1 X131.109 Y108.389 E.0171
G1 X131.462 Y108.819 E.0171
G1 X131.725 Y109.31 E.0171
G1 X131.886 Y109.843 E.0171
G1 X131.941 Y110.396 E.0171
G1 X131.886 Y110.95 E.0171
G1 X131.725 Y111.483 E.0171
G1 X131.462 Y111.974 E.0171
G1 X131.109 Y112.404 E.0171
G1 X130.679 Y112.757 E.0171
G1 X130.188 Y113.019 E.0171
G1 X129.656 Y113.181 E.0171
G1 X129.102 Y113.235 E.0171
G1 X128.548 Y113.181 E.0171
G1 X128.015 Y113.019 E.0171
G1 X127.525 Y112.757 E.0171
G1 X127.094 Y112.404 E.0171
G1 X126.741 Y111.974 E.0171
G1 X126.479 Y111.483 E.0171
G1 X126.317 Y110.95 E.0171
G1 X126.263 Y110.396 E.0171
G1 X126.317 Y109.843 E.0171
G1 X126.479 Y109.31 E.0171
G1 X126.741 Y108.819 E.0171
G1 X127.094 Y108.389 E.0171
G1 X127.525 Y108.036 E.0171
G1 X128.015 Y107.773 E.0171
G1 X128.548 Y107.612 E.0171
G1 X128.997 Y107.569 E.01385
M204 S10000
; WIPE_START
G1 F24000
G1 X129.112 Y107.558 E-.04414
G1 X129.656 Y107.612 E-.20749
G1 X130.188 Y107.773 E-.21149
G1 X130.679 Y108.036 E-.21148
G1 X130.853 Y108.178 E-.0854
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I-1.216 J.056 P1  F30000
G1 X131.864 Y130.024 Z.8
G1 Z.4
G1 E.8 F1800
M204 S5000
G1 F2228
G1 X131.788 Y130.105 E.00342
G1 X131.293 Y130.44 E.01835
G1 X130.739 Y130.661 E.01835
G1 X130.149 Y130.757 E.01835
G1 X129.553 Y130.725 E.01835
G1 X128.978 Y130.565 E.01835
G1 X128.45 Y130.285 E.01835
G1 X127.995 Y129.899 E.01835
G1 X127.634 Y129.424 E.01835
G1 X127.383 Y128.882 E.01835
G1 X127.255 Y128.299 E.01835
G1 X127.255 Y127.701 E.01835
G1 X127.383 Y127.118 E.01835
G1 X127.634 Y126.576 E.01835
G1 X127.995 Y126.101 E.01835
G1 X128.45 Y125.715 E.01835
G1 X128.978 Y125.435 E.01835
G1 X129.605 Y125.272 E.0199
G1 X130.149 Y125.243 E.01676
G1 X130.739 Y125.339 E.01835
G1 X131.293 Y125.56 E.01835
G1 X131.788 Y125.895 E.01835
G1 X132.198 Y126.329 E.01835
G1 X132.506 Y126.841 E.01835
G1 X132.697 Y127.406 E.01835
G1 X132.761 Y128 E.01835
G1 X132.697 Y128.594 E.01835
G1 X132.506 Y129.159 E.01835
G1 X132.198 Y129.671 E.01835
G1 X131.905 Y129.98 E.01308
M204 S10000
; WIPE_START
G1 F24000
G1 X131.788 Y130.105 E-.0651
G1 X131.293 Y130.44 E-.22689
G1 X130.739 Y130.661 E-.22689
G1 X130.149 Y130.757 E-.22689
G1 X130.112 Y130.755 E-.01422
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I1.216 J-.034 P1  F30000
G1 X129.955 Y125.167 Z.8
G1 Z.4
G1 E.8 F1800
M204 S5000
G1 F2228
G1 X130.01 Y125.162 E.00173
G1 X130.554 Y125.216 E.01678
G1 X131.086 Y125.377 E.0171
G1 X131.577 Y125.639 E.0171
G1 X132.007 Y125.993 E.0171
G1 X132.361 Y126.423 E.0171
G1 X132.623 Y126.914 E.0171
G1 X132.784 Y127.446 E.0171
G1 X132.839 Y128 E.0171
G1 X132.784 Y128.554 E.0171
G1 X132.623 Y129.086 E.0171
G1 X132.361 Y129.577 E.0171
G1 X132.007 Y130.007 E.0171
G1 X131.577 Y130.361 E.0171
G1 X131.086 Y130.623 E.0171
G1 X130.554 Y130.784 E.0171
G1 X130 Y130.839 E.0171
G1 X129.446 Y130.784 E.0171
G1 X128.914 Y130.623 E.0171
G1 X128.423 Y130.361 E.0171
G1 X127.993 Y130.007 E.0171
G1 X127.639 Y129.577 E.0171
G1 X127.377 Y129.086 E.0171
G1 X127.216 Y128.554 E.0171
G1 X127.161 Y128 E.0171
G1 X127.216 Y127.446 E.0171
G1 X127.377 Y126.914 E.0171
G1 X127.639 Y126.423 E.0171
G1 X127.993 Y125.993 E.0171
G1 X128.423 Y125.639 E.0171
G1 X128.914 Y125.377 E.0171
G1 X129.446 Y125.216 E.0171
G1 X129.895 Y125.173 E.01385
M204 S10000
; WIPE_START
G1 F24000
G1 X130.01 Y125.162 E-.04414
G1 X130.554 Y125.216 E-.20749
G1 X131.086 Y125.377 E-.21149
G1 X131.577 Y125.639 E-.21148
G1 X131.751 Y125.782 E-.0854
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I-.531 J-1.095 P1  F30000
G1 X109.481 Y136.585 Z.8
G1 Z.4
G1 E.8 F1800
M204 S5000
G1 F2228
G1 X110.114 Y136.678 E.01966
G1 X110.669 Y136.899 E.01835
G1 X111.163 Y137.234 E.01835
G1 X111.574 Y137.667 E.01835
G1 X111.881 Y138.179 E.01835
G1 X112.072 Y138.745 E.01835
G1 X112.137 Y139.339 E.01835
G1 X112.072 Y139.932 E.01835
G1 X111.881 Y140.498 E.01835
G1 X111.574 Y141.01 E.01835
G1 X111.196 Y141.408 E.01686
G1 X110.669 Y141.778 E.0198
G1 X110.114 Y141.999 E.01835
G1 X109.525 Y142.096 E.01835
G1 X108.929 Y142.063 E.01835
G1 X108.353 Y141.904 E.01835
G1 X107.826 Y141.624 E.01835
G1 X107.371 Y141.237 E.01835
G1 X107.009 Y140.762 E.01835
G1 X106.759 Y140.22 E.01835
G1 X106.63 Y139.637 E.01835
G1 X106.63 Y139.04 E.01835
G1 X106.759 Y138.457 E.01835
G1 X107.009 Y137.915 E.01835
G1 X107.371 Y137.44 E.01835
G1 X107.826 Y137.053 E.01835
G1 X108.353 Y136.773 E.01835
G1 X108.929 Y136.614 E.01835
G1 X109.421 Y136.587 E.01515
M204 S10000
; WIPE_START
G1 F24000
G1 X110.114 Y136.678 E-.26558
G1 X110.669 Y136.899 E-.22689
G1 X111.163 Y137.234 E-.22689
G1 X111.236 Y137.312 E-.04064
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I-1.216 J.041 P1  F30000
G1 X111.371 Y141.355 Z.8
G1 Z.4
G1 E.8 F1800
M204 S5000
G1 F2228
G1 X110.953 Y141.699 E.01664
G1 X110.462 Y141.961 E.0171
G1 X109.929 Y142.123 E.0171
G1 X109.375 Y142.177 E.0171
G1 X108.822 Y142.123 E.0171
G1 X108.289 Y141.961 E.0171
G1 X107.798 Y141.699 E.0171
G1 X107.368 Y141.346 E.0171
G1 X107.015 Y140.916 E.0171
G1 X106.752 Y140.425 E.0171
G1 X106.591 Y139.892 E.0171
G1 X106.536 Y139.339 E.0171
G1 X106.591 Y138.785 E.0171
G1 X106.752 Y138.252 E.0171
G1 X107.015 Y137.761 E.0171
G1 X107.368 Y137.331 E.0171
G1 X107.798 Y136.978 E.0171
G1 X108.289 Y136.716 E.0171
G1 X108.822 Y136.554 E.0171
G1 X109.375 Y136.5 E.0171
G1 X109.922 Y136.553 E.01689
G1 X110.462 Y136.716 E.01731
G1 X110.953 Y136.978 E.0171
G1 X111.383 Y137.331 E.0171
G1 X111.736 Y137.761 E.0171
G1 X111.998 Y138.252 E.0171
G1 X112.16 Y138.785 E.0171
G1 X112.214 Y139.339 E.0171
G1 X112.16 Y139.892 E.0171
G1 X111.998 Y140.425 E.0171
G1 X111.736 Y140.916 E.0171
G1 X111.411 Y141.311 E.01572
M204 S10000
; WIPE_START
G1 F24000
G1 X110.953 Y141.699 E-.22831
G1 X110.462 Y141.961 E-.21148
G1 X109.929 Y142.123 E-.21148
G1 X109.644 Y142.151 E-.10872
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I1.217 J-.006 P1  F30000
G1 X109.522 Y116.58 Z.8
G1 Z.4
G1 E.8 F1800
M204 S5000
G1 F2228
G1 X110.155 Y116.673 E.01966
G1 X110.71 Y116.894 E.01835
G1 X111.204 Y117.229 E.01835
G1 X111.615 Y117.663 E.01835
G1 X111.923 Y118.174 E.01835
G1 X112.113 Y118.74 E.01835
G1 X112.178 Y119.334 E.01835
G1 X112.113 Y119.927 E.01835
G1 X111.923 Y120.493 E.01835
G1 X111.615 Y121.005 E.01835
G1 X111.237 Y121.403 E.01686
G1 X110.71 Y121.773 E.0198
G1 X110.155 Y121.994 E.01835
G1 X109.566 Y122.091 E.01835
G1 X108.97 Y122.059 E.01835
G1 X108.394 Y121.899 E.01835
G1 X107.867 Y121.619 E.01835
G1 X107.412 Y121.233 E.01835
G1 X107.051 Y120.757 E.01835
G1 X106.8 Y120.215 E.01835
G1 X106.671 Y119.632 E.01835
G1 X106.671 Y119.035 E.01835
G1 X106.8 Y118.452 E.01835
G1 X107.051 Y117.91 E.01835
G1 X107.412 Y117.435 E.01835
G1 X107.867 Y117.048 E.01835
G1 X108.394 Y116.769 E.01835
G1 X108.97 Y116.609 E.01835
G1 X109.462 Y116.582 E.01515
M204 S10000
; WIPE_START
G1 F24000
G1 X110.155 Y116.673 E-.26558
G1 X110.71 Y116.894 E-.22689
M73 P54 R5
G1 X111.204 Y117.229 E-.22689
G1 X111.278 Y117.307 E-.04064
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I-1.216 J.041 P1  F30000
G1 X111.412 Y121.351 Z.8
G1 Z.4
G1 E.8 F1800
M204 S5000
G1 F2228
G1 X110.994 Y121.694 E.01664
G1 X110.503 Y121.957 E.0171
G1 X109.97 Y122.118 E.0171
G1 X109.417 Y122.173 E.0171
G1 X108.863 Y122.118 E.0171
G1 X108.33 Y121.957 E.0171
G1 X107.839 Y121.694 E.0171
G1 X107.409 Y121.341 E.0171
G1 X107.056 Y120.911 E.0171
G1 X106.794 Y120.42 E.0171
G1 X106.632 Y119.888 E.0171
G1 X106.578 Y119.334 E.0171
G1 X106.632 Y118.78 E.0171
G1 X106.794 Y118.247 E.0171
G1 X107.056 Y117.757 E.0171
G1 X107.409 Y117.326 E.0171
G1 X107.839 Y116.973 E.0171
G1 X108.33 Y116.711 E.0171
G1 X108.863 Y116.549 E.0171
G1 X109.417 Y116.495 E.0171
G1 X109.964 Y116.549 E.01689
G1 X110.503 Y116.711 E.01731
G1 X110.994 Y116.973 E.0171
G1 X111.424 Y117.326 E.0171
G1 X111.777 Y117.757 E.0171
G1 X112.039 Y118.247 E.0171
G1 X112.201 Y118.78 E.0171
G1 X112.256 Y119.334 E.0171
G1 X112.201 Y119.888 E.0171
G1 X112.039 Y120.42 E.0171
G1 X111.777 Y120.911 E.0171
G1 X111.453 Y121.306 E.01572
M204 S10000
; WIPE_START
G1 F24000
G1 X110.994 Y121.694 E-.22831
G1 X110.503 Y121.957 E-.21148
G1 X109.97 Y122.118 E-.21148
G1 X109.686 Y122.146 E-.10872
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I1.217 J-.022 P1  F30000
G1 X109.228 Y96.803 Z.8
G1 Z.4
G1 E.8 F1800
M204 S5000
G1 F2228
G1 X109.861 Y96.897 E.01966
G1 X110.416 Y97.118 E.01835
G1 X110.91 Y97.453 E.01835
G1 X111.321 Y97.886 E.01835
G1 X111.628 Y98.398 E.01835
G1 X111.819 Y98.964 E.01835
G1 X111.884 Y99.557 E.01835
G1 X111.819 Y100.151 E.01835
G1 X111.628 Y100.717 E.01835
G1 X111.321 Y101.228 E.01835
G1 X110.943 Y101.627 E.01686
G1 X110.416 Y101.997 E.0198
G1 X109.861 Y102.218 E.01835
G1 X109.272 Y102.315 E.01835
G1 X108.676 Y102.282 E.01835
G1 X108.1 Y102.122 E.01835
G1 X107.573 Y101.843 E.01835
G1 X107.118 Y101.456 E.01835
G1 X106.756 Y100.981 E.01835
G1 X106.506 Y100.439 E.01835
G1 X106.377 Y99.856 E.01835
G1 X106.377 Y99.259 E.01835
G1 X106.506 Y98.676 E.01835
G1 X106.756 Y98.134 E.01835
G1 X107.118 Y97.658 E.01835
G1 X107.573 Y97.272 E.01835
G1 X108.1 Y96.992 E.01835
G1 X108.676 Y96.832 E.01835
G1 X109.168 Y96.806 E.01515
M204 S10000
; WIPE_START
G1 F24000
G1 X109.861 Y96.897 E-.26558
G1 X110.416 Y97.118 E-.22689
G1 X110.91 Y97.453 E-.22689
G1 X110.984 Y97.53 E-.04064
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I-1.216 J.041 P1  F30000
G1 X111.118 Y101.574 Z.8
G1 Z.4
G1 E.8 F1800
M204 S5000
G1 F2228
G1 X110.7 Y101.918 E.01664
G1 X110.209 Y102.18 E.0171
G1 X109.676 Y102.342 E.0171
G1 X109.122 Y102.396 E.0171
G1 X108.569 Y102.342 E.0171
G1 X108.036 Y102.18 E.0171
G1 X107.545 Y101.918 E.0171
G1 X107.115 Y101.565 E.0171
G1 X106.762 Y101.135 E.0171
G1 X106.5 Y100.644 E.0171
G1 X106.338 Y100.111 E.0171
G1 X106.283 Y99.557 E.0171
G1 X106.338 Y99.003 E.0171
G1 X106.5 Y98.471 E.0171
G1 X106.762 Y97.98 E.0171
G1 X107.115 Y97.55 E.0171
G1 X107.545 Y97.197 E.0171
G1 X108.036 Y96.934 E.0171
G1 X108.569 Y96.773 E.0171
G1 X109.122 Y96.718 E.0171
G1 X109.669 Y96.772 E.01689
G1 X110.209 Y96.934 E.01731
G1 X110.7 Y97.197 E.0171
G1 X111.13 Y97.55 E.0171
G1 X111.483 Y97.98 E.0171
G1 X111.745 Y98.471 E.0171
G1 X111.907 Y99.003 E.0171
G1 X111.961 Y99.557 E.0171
G1 X111.907 Y100.111 E.0171
G1 X111.745 Y100.644 E.0171
G1 X111.483 Y101.135 E.0171
G1 X111.158 Y101.53 E.01572
M204 S10000
; WIPE_START
G1 F24000
G1 X110.7 Y101.918 E-.22831
G1 X110.209 Y102.18 E-.21148
G1 X109.676 Y102.342 E-.21148
G1 X109.392 Y102.37 E-.10872
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I1.216 J-.041 P1  F30000
G1 X108.446 Y73.988 Z.8
G1 Z.4
G1 E.8 F1800
M204 S5000
G1 F2228
G1 X109.079 Y74.081 E.01966
G1 X109.634 Y74.302 E.01835
G1 X110.128 Y74.637 E.01835
G1 X110.538 Y75.071 E.01835
G1 X110.846 Y75.582 E.01835
G1 X111.037 Y76.148 E.01835
G1 X111.102 Y76.742 E.01835
G1 X111.037 Y77.335 E.01835
G1 X110.846 Y77.901 E.01835
G1 X110.538 Y78.413 E.01835
G1 X110.161 Y78.811 E.01686
G1 X109.634 Y79.181 E.0198
G1 X109.079 Y79.402 E.01835
G1 X108.49 Y79.499 E.01835
G1 X107.894 Y79.467 E.01835
G1 X107.318 Y79.307 E.01835
G1 X106.791 Y79.027 E.01835
G1 X106.336 Y78.641 E.01835
G1 X105.974 Y78.165 E.01835
G1 X105.724 Y77.623 E.01835
G1 X105.595 Y77.04 E.01835
G1 X105.595 Y76.443 E.01835
G1 X105.724 Y75.86 E.01835
G1 X105.974 Y75.318 E.01835
G1 X106.336 Y74.843 E.01835
G1 X106.791 Y74.456 E.01835
G1 X107.318 Y74.177 E.01835
G1 X107.894 Y74.017 E.01835
G1 X108.386 Y73.99 E.01515
M204 S10000
; WIPE_START
G1 F24000
G1 X109.079 Y74.081 E-.26558
G1 X109.634 Y74.302 E-.22689
G1 X110.128 Y74.637 E-.22689
G1 X110.201 Y74.715 E-.04064
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I-1.216 J.041 P1  F30000
G1 X110.336 Y78.759 Z.8
G1 Z.4
G1 E.8 F1800
M204 S5000
G1 F2228
G1 X109.918 Y79.102 E.01664
G1 X109.427 Y79.365 E.0171
G1 X108.894 Y79.526 E.0171
G1 X108.34 Y79.581 E.0171
G1 X107.786 Y79.526 E.0171
G1 X107.254 Y79.365 E.0171
G1 X106.763 Y79.102 E.0171
G1 X106.333 Y78.749 E.0171
G1 X105.98 Y78.319 E.0171
G1 X105.717 Y77.828 E.0171
G1 X105.556 Y77.296 E.0171
G1 X105.501 Y76.742 E.0171
G1 X105.556 Y76.188 E.0171
G1 X105.717 Y75.655 E.0171
G1 X105.98 Y75.164 E.0171
G1 X106.333 Y74.734 E.0171
G1 X106.763 Y74.381 E.0171
G1 X107.254 Y74.119 E.0171
G1 X107.786 Y73.957 E.0171
G1 X108.34 Y73.903 E.0171
G1 X108.887 Y73.957 E.01689
G1 X109.427 Y74.119 E.01731
G1 X109.918 Y74.381 E.0171
G1 X110.348 Y74.734 E.0171
G1 X110.701 Y75.164 E.0171
G1 X110.963 Y75.655 E.0171
G1 X111.125 Y76.188 E.0171
G1 X111.179 Y76.742 E.0171
G1 X111.125 Y77.296 E.0171
G1 X110.963 Y77.828 E.0171
G1 X110.701 Y78.319 E.0171
G1 X110.376 Y78.714 E.01572
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 0.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X109.918 Y79.102 E-.22831
G1 X109.427 Y79.365 E-.21148
G1 X108.894 Y79.526 E-.21148
G1 X108.609 Y79.554 E-.10872
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 3/32
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
G3 Z.8 I-.528 J1.096 P1  F30000
G1 X131.212 Y90.437 Z.8
G1 Z.6
G1 E.8 F1800
M204 S5000
G1 F2228
G1 X131.133 Y90.521 E.00356
G1 X130.639 Y90.856 E.01835
G1 X130.084 Y91.077 E.01835
G1 X129.495 Y91.174 E.01835
G1 X128.898 Y91.142 E.01835
G1 X128.323 Y90.982 E.01835
G1 X127.796 Y90.702 E.01835
G1 X127.742 Y90.656 E.00218
G1 X127.341 Y90.316 E.01617
G1 X126.979 Y89.84 E.01835
G1 X126.728 Y89.298 E.01835
G1 X126.6 Y88.715 E.01835
G1 X126.6 Y88.118 E.01835
G1 X126.728 Y87.535 E.01835
G1 X126.979 Y86.993 E.01835
G1 X127.341 Y86.518 E.01835
G1 X127.796 Y86.131 E.01835
G1 X128.323 Y85.852 E.01835
G1 X128.898 Y85.692 E.01835
G1 X128.969 Y85.688 E.00218
G1 X129.495 Y85.66 E.01617
G1 X130.084 Y85.756 E.01835
G1 X130.639 Y85.977 E.01835
G1 X131.133 Y86.312 E.01835
G1 X131.543 Y86.746 E.01835
G1 X131.851 Y87.257 E.01835
G1 X132.042 Y87.823 E.01835
G1 X132.106 Y88.417 E.01835
G1 X132.042 Y89.01 E.01835
G1 X131.851 Y89.576 E.01835
G1 X131.543 Y90.088 E.01835
G1 X131.254 Y90.394 E.01295
M204 S10000
; WIPE_START
G1 F24000
G1 X131.133 Y90.521 E-.0668
G1 X130.639 Y90.856 E-.22689
G1 X130.084 Y91.077 E-.22689
G1 X129.495 Y91.174 E-.22689
G1 X129.462 Y91.172 E-.01252
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I1.216 J-.035 P1  F30000
G1 X129.301 Y85.587 Z1
G1 Z.6
G1 E.8 F1800
M204 S5000
G1 F2228
G1 X129.376 Y85.581 E.00231
G1 X129.899 Y85.632 E.01614
G1 X130.432 Y85.794 E.0171
G1 X130.922 Y86.056 E.0171
G1 X131.353 Y86.409 E.0171
G1 X131.706 Y86.839 E.0171
G1 X131.968 Y87.33 E.0171
G1 X132.13 Y87.863 E.0171
G1 X132.184 Y88.417 E.0171
G1 X132.13 Y88.971 E.0171
G1 X131.968 Y89.503 E.0171
G1 X131.706 Y89.994 E.0171
G1 X131.353 Y90.424 E.0171
G1 X130.922 Y90.777 E.0171
G1 X130.432 Y91.04 E.0171
G1 X129.899 Y91.201 E.0171
G1 X129.345 Y91.256 E.0171
G1 X128.791 Y91.201 E.0171
G1 X128.259 Y91.04 E.0171
G1 X127.768 Y90.777 E.0171
G1 X127.338 Y90.424 E.0171
G1 X126.985 Y89.994 E.0171
G1 X126.722 Y89.503 E.0171
G1 X126.561 Y88.971 E.0171
G1 X126.506 Y88.417 E.0171
G1 X126.561 Y87.863 E.0171
G1 X126.722 Y87.33 E.0171
G1 X126.985 Y86.839 E.0171
G1 X127.338 Y86.409 E.0171
G1 X127.768 Y86.056 E.0171
G1 X128.259 Y85.794 E.0171
G1 X128.791 Y85.632 E.0171
G1 X129.242 Y85.593 E.01389
M204 S10000
; WIPE_START
G1 F24000
G1 X129.376 Y85.581 E-.05138
G1 X129.899 Y85.632 E-.19959
G1 X130.432 Y85.794 E-.21149
G1 X130.922 Y86.056 E-.21148
G1 X131.098 Y86.2 E-.08607
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I-1.217 J-.006 P1  F30000
G1 X130.969 Y112.417 Z1
G1 Z.6
G1 E.8 F1800
M204 S5000
G1 F2228
G1 X130.889 Y112.501 E.00356
G1 X130.395 Y112.836 E.01835
G1 X129.841 Y113.057 E.01835
G1 X129.251 Y113.154 E.01835
G1 X128.655 Y113.121 E.01835
G1 X128.08 Y112.961 E.01835
G1 X127.552 Y112.682 E.01835
G1 X127.498 Y112.636 E.00218
G1 X127.097 Y112.295 E.01617
G1 X126.736 Y111.82 E.01835
G1 X126.485 Y111.278 E.01835
G1 X126.357 Y110.695 E.01835
G1 X126.357 Y110.098 E.01835
G1 X126.485 Y109.515 E.01835
G1 X126.736 Y108.973 E.01835
G1 X127.097 Y108.497 E.01835
G1 X127.552 Y108.111 E.01835
G1 X128.08 Y107.831 E.01835
G1 X128.655 Y107.672 E.01835
G1 X128.726 Y107.668 E.00218
G1 X129.251 Y107.639 E.01617
G1 X129.841 Y107.736 E.01835
G1 X130.395 Y107.957 E.01835
G1 X130.889 Y108.292 E.01835
G1 X131.3 Y108.725 E.01835
G1 X131.608 Y109.237 E.01835
G1 X131.798 Y109.803 E.01835
G1 X131.863 Y110.396 E.01835
G1 X131.798 Y110.99 E.01835
G1 X131.608 Y111.556 E.01835
G1 X131.3 Y112.067 E.01835
G1 X131.01 Y112.373 E.01295
M204 S10000
; WIPE_START
G1 F24000
G1 X130.889 Y112.501 E-.0668
G1 X130.395 Y112.836 E-.22689
G1 X129.841 Y113.057 E-.22689
G1 X129.251 Y113.154 E-.22689
G1 X129.218 Y113.152 E-.01252
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I1.216 J-.035 P1  F30000
G1 X129.058 Y107.567 Z1
G1 Z.6
G1 E.8 F1800
M204 S5000
G1 F2228
G1 X129.133 Y107.56 E.00231
G1 X129.656 Y107.612 E.01614
G1 X130.188 Y107.773 E.0171
G1 X130.679 Y108.036 E.0171
G1 X131.109 Y108.389 E.0171
G1 X131.462 Y108.819 E.0171
G1 X131.725 Y109.31 E.0171
G1 X131.886 Y109.843 E.0171
G1 X131.941 Y110.396 E.0171
G1 X131.886 Y110.95 E.0171
G1 X131.725 Y111.483 E.0171
G1 X131.462 Y111.974 E.0171
G1 X131.109 Y112.404 E.0171
G1 X130.679 Y112.757 E.0171
G1 X130.188 Y113.019 E.0171
G1 X129.656 Y113.181 E.0171
G1 X129.102 Y113.235 E.0171
G1 X128.548 Y113.181 E.0171
G1 X128.015 Y113.019 E.0171
G1 X127.525 Y112.757 E.0171
G1 X127.094 Y112.404 E.0171
G1 X126.741 Y111.974 E.0171
G1 X126.479 Y111.483 E.0171
G1 X126.317 Y110.95 E.0171
G1 X126.263 Y110.396 E.0171
G1 X126.317 Y109.843 E.0171
G1 X126.479 Y109.31 E.0171
G1 X126.741 Y108.819 E.0171
G1 X127.094 Y108.389 E.0171
G1 X127.525 Y108.036 E.0171
G1 X128.015 Y107.773 E.0171
G1 X128.548 Y107.612 E.0171
G1 X128.998 Y107.572 E.01389
M204 S10000
; WIPE_START
G1 F24000
G1 X129.133 Y107.56 E-.05138
G1 X129.656 Y107.612 E-.19959
G1 X130.188 Y107.773 E-.21149
G1 X130.679 Y108.036 E-.21148
G1 X130.854 Y108.18 E-.08607
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I-1.216 J.056 P1  F30000
G1 X131.867 Y130.02 Z1
G1 Z.6
G1 E.8 F1800
M204 S5000
G1 F2228
G1 X131.788 Y130.105 E.00356
G1 X131.293 Y130.44 E.01835
G1 X130.739 Y130.661 E.01835
G1 X130.149 Y130.757 E.01835
G1 X129.553 Y130.725 E.01835
G1 X128.978 Y130.565 E.01835
G1 X128.45 Y130.285 E.01835
G1 X128.396 Y130.24 E.00218
G1 X127.995 Y129.899 E.01617
G1 X127.634 Y129.424 E.01835
G1 X127.383 Y128.882 E.01835
G1 X127.255 Y128.299 E.01835
G1 X127.255 Y127.701 E.01835
G1 X127.383 Y127.118 E.01835
G1 X127.634 Y126.576 E.01835
G1 X127.995 Y126.101 E.01835
M73 P55 R5
G1 X128.45 Y125.715 E.01835
G1 X128.978 Y125.435 E.01835
G1 X129.553 Y125.275 E.01835
G1 X129.624 Y125.271 E.00218
G1 X130.149 Y125.243 E.01617
G1 X130.739 Y125.339 E.01835
G1 X131.293 Y125.56 E.01835
G1 X131.788 Y125.895 E.01835
G1 X132.198 Y126.329 E.01835
G1 X132.506 Y126.841 E.01835
G1 X132.697 Y127.406 E.01835
G1 X132.761 Y128 E.01835
G1 X132.697 Y128.594 E.01835
G1 X132.506 Y129.159 E.01835
G1 X132.198 Y129.671 E.01835
G1 X131.908 Y129.977 E.01295
M204 S10000
; WIPE_START
G1 F24000
G1 X131.788 Y130.105 E-.0668
G1 X131.293 Y130.44 E-.22689
G1 X130.739 Y130.661 E-.22689
G1 X130.149 Y130.757 E-.22689
G1 X130.117 Y130.755 E-.01252
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I1.216 J-.035 P1  F30000
G1 X129.956 Y125.171 Z1
G1 Z.6
G1 E.8 F1800
M204 S5000
G1 F2228
G1 X130.031 Y125.164 E.00231
G1 X130.554 Y125.216 E.01614
G1 X131.086 Y125.377 E.0171
G1 X131.577 Y125.639 E.0171
G1 X132.007 Y125.993 E.0171
G1 X132.361 Y126.423 E.0171
G1 X132.623 Y126.914 E.0171
G1 X132.784 Y127.446 E.0171
G1 X132.839 Y128 E.0171
G1 X132.784 Y128.554 E.0171
G1 X132.623 Y129.086 E.0171
G1 X132.361 Y129.577 E.0171
G1 X132.007 Y130.007 E.0171
G1 X131.577 Y130.361 E.0171
G1 X131.086 Y130.623 E.0171
G1 X130.554 Y130.784 E.0171
G1 X130 Y130.839 E.0171
G1 X129.446 Y130.784 E.0171
G1 X128.914 Y130.623 E.0171
G1 X128.423 Y130.361 E.0171
G1 X127.993 Y130.007 E.0171
G1 X127.639 Y129.577 E.0171
G1 X127.377 Y129.086 E.0171
G1 X127.216 Y128.554 E.0171
G1 X127.161 Y128 E.0171
G1 X127.216 Y127.446 E.0171
G1 X127.377 Y126.914 E.0171
G1 X127.639 Y126.423 E.0171
G1 X127.993 Y125.993 E.0171
G1 X128.423 Y125.639 E.0171
G1 X128.914 Y125.377 E.0171
G1 X129.446 Y125.216 E.0171
G1 X129.896 Y125.176 E.01389
M204 S10000
; WIPE_START
G1 F24000
G1 X130.031 Y125.164 E-.05138
G1 X130.554 Y125.216 E-.19959
G1 X131.086 Y125.377 E-.21149
G1 X131.577 Y125.639 E-.21148
G1 X131.752 Y125.783 E-.08607
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I-.531 J-1.095 P1  F30000
G1 X109.477 Y136.584 Z1
G1 Z.6
G1 E.8 F1800
M204 S5000
G1 F2228
G1 X109.525 Y136.581 E.00148
G1 X110.114 Y136.678 E.01835
G1 X110.669 Y136.899 E.01835
G1 X111.163 Y137.234 E.01835
G1 X111.574 Y137.667 E.01835
G1 X111.881 Y138.179 E.01835
G1 X112.072 Y138.745 E.01835
G1 X112.137 Y139.339 E.01835
G1 X112.072 Y139.932 E.01835
G1 X111.881 Y140.498 E.01835
G1 X111.574 Y141.01 E.01835
G1 X111.163 Y141.443 E.01835
G1 X110.669 Y141.778 E.01835
G1 X110.175 Y141.975 E.01634
G1 X110.114 Y141.999 E.00201
G1 X109.525 Y142.096 E.01835
G1 X108.929 Y142.063 E.01835
G1 X108.353 Y141.904 E.01835
G1 X107.826 Y141.624 E.01835
G1 X107.776 Y141.582 E.00201
G1 X107.371 Y141.237 E.01634
G1 X107.009 Y140.762 E.01835
G1 X106.759 Y140.22 E.01835
G1 X106.63 Y139.637 E.01835
G1 X106.63 Y139.04 E.01835
G1 X106.759 Y138.457 E.01835
G1 X107.009 Y137.915 E.01835
G1 X107.371 Y137.44 E.01835
G1 X107.826 Y137.053 E.01835
G1 X108.353 Y136.773 E.01835
G1 X108.929 Y136.614 E.01835
G1 X109.417 Y136.587 E.01502
M204 S10000
; WIPE_START
G1 F24000
G1 X109.525 Y136.581 E-.04115
G1 X110.114 Y136.678 E-.22689
G1 X110.669 Y136.899 E-.22689
G1 X111.163 Y137.234 E-.22689
G1 X111.232 Y137.307 E-.03817
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I-1.216 J.042 P1  F30000
G1 X111.372 Y141.355 Z1
G1 Z.6
G1 E.8 F1800
M204 S5000
G1 F2228
G1 X110.953 Y141.699 E.01666
G1 X110.462 Y141.961 E.0171
G1 X109.929 Y142.123 E.0171
G1 X109.375 Y142.177 E.0171
G1 X108.822 Y142.123 E.0171
G1 X108.289 Y141.961 E.0171
G1 X107.798 Y141.699 E.0171
G1 X107.368 Y141.346 E.0171
G1 X107.015 Y140.916 E.0171
G1 X106.752 Y140.425 E.0171
G1 X106.591 Y139.892 E.0171
G1 X106.536 Y139.339 E.0171
G1 X106.591 Y138.785 E.0171
G1 X106.752 Y138.252 E.0171
G1 X107.015 Y137.761 E.0171
G1 X107.368 Y137.331 E.0171
G1 X107.798 Y136.978 E.0171
G1 X108.289 Y136.716 E.0171
G1 X108.822 Y136.554 E.0171
G1 X109.375 Y136.5 E.0171
G1 X109.904 Y136.552 E.01632
G1 X110.462 Y136.716 E.01786
G1 X110.953 Y136.978 E.0171
G1 X111.383 Y137.331 E.0171
G1 X111.736 Y137.761 E.0171
G1 X111.998 Y138.252 E.0171
G1 X112.16 Y138.785 E.0171
G1 X112.214 Y139.339 E.0171
G1 X112.16 Y139.892 E.0171
G1 X111.998 Y140.425 E.0171
G1 X111.736 Y140.916 E.0171
G1 X111.412 Y141.311 E.0157
M204 S10000
; WIPE_START
G1 F24000
G1 X110.953 Y141.699 E-.2285
G1 X110.462 Y141.961 E-.21148
G1 X109.929 Y142.123 E-.21149
G1 X109.645 Y142.151 E-.10853
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I1.217 J-.006 P1  F30000
G1 X109.518 Y116.579 Z1
G1 Z.6
G1 E.8 F1800
M204 S5000
G1 F2228
G1 X109.566 Y116.577 E.00148
G1 X110.155 Y116.673 E.01835
G1 X110.71 Y116.894 E.01835
G1 X111.204 Y117.229 E.01835
G1 X111.615 Y117.663 E.01835
G1 X111.923 Y118.174 E.01835
G1 X112.113 Y118.74 E.01835
G1 X112.178 Y119.334 E.01835
G1 X112.113 Y119.927 E.01835
G1 X111.923 Y120.493 E.01835
G1 X111.615 Y121.005 E.01835
G1 X111.204 Y121.438 E.01835
G1 X110.71 Y121.773 E.01835
G1 X110.216 Y121.97 E.01634
G1 X110.155 Y121.994 E.00201
G1 X109.566 Y122.091 E.01835
G1 X108.97 Y122.059 E.01835
G1 X108.394 Y121.899 E.01835
G1 X107.867 Y121.619 E.01835
G1 X107.817 Y121.577 E.00201
G1 X107.412 Y121.233 E.01634
G1 X107.051 Y120.757 E.01835
G1 X106.8 Y120.215 E.01835
G1 X106.671 Y119.632 E.01835
G1 X106.671 Y119.035 E.01835
G1 X106.8 Y118.452 E.01835
G1 X107.051 Y117.91 E.01835
G1 X107.412 Y117.435 E.01835
G1 X107.867 Y117.048 E.01835
G1 X108.394 Y116.769 E.01835
G1 X108.97 Y116.609 E.01835
G1 X109.458 Y116.583 E.01502
M204 S10000
; WIPE_START
G1 F24000
G1 X109.566 Y116.577 E-.04115
G1 X110.155 Y116.673 E-.22689
G1 X110.71 Y116.894 E-.22689
G1 X111.204 Y117.229 E-.22689
G1 X111.273 Y117.302 E-.03817
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I-1.216 J.042 P1  F30000
G1 X111.413 Y121.35 Z1
G1 Z.6
G1 E.8 F1800
M204 S5000
G1 F2228
G1 X110.994 Y121.694 E.01666
G1 X110.503 Y121.957 E.0171
G1 X109.97 Y122.118 E.0171
G1 X109.417 Y122.173 E.0171
G1 X108.863 Y122.118 E.0171
G1 X108.33 Y121.957 E.0171
G1 X107.839 Y121.694 E.0171
G1 X107.409 Y121.341 E.0171
G1 X107.056 Y120.911 E.0171
G1 X106.794 Y120.42 E.0171
G1 X106.632 Y119.888 E.0171
G1 X106.578 Y119.334 E.0171
G1 X106.632 Y118.78 E.0171
G1 X106.794 Y118.247 E.0171
G1 X107.056 Y117.757 E.0171
G1 X107.409 Y117.326 E.0171
G1 X107.839 Y116.973 E.0171
G1 X108.33 Y116.711 E.0171
G1 X108.863 Y116.549 E.0171
G1 X109.417 Y116.495 E.0171
G1 X109.945 Y116.547 E.01632
G1 X110.503 Y116.711 E.01786
G1 X110.994 Y116.973 E.0171
G1 X111.424 Y117.326 E.0171
G1 X111.777 Y117.757 E.0171
G1 X112.039 Y118.247 E.0171
G1 X112.201 Y118.78 E.0171
G1 X112.256 Y119.334 E.0171
G1 X112.201 Y119.888 E.0171
G1 X112.039 Y120.42 E.0171
G1 X111.777 Y120.911 E.0171
G1 X111.453 Y121.306 E.0157
M204 S10000
; WIPE_START
G1 F24000
G1 X110.994 Y121.694 E-.2285
G1 X110.503 Y121.957 E-.21148
G1 X109.97 Y122.118 E-.21149
G1 X109.686 Y122.146 E-.10853
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I1.217 J-.022 P1  F30000
G1 X109.224 Y96.803 Z1
G1 Z.6
G1 E.8 F1800
M204 S5000
G1 F2228
G1 X109.272 Y96.8 E.00148
G1 X109.861 Y96.897 E.01835
G1 X110.416 Y97.118 E.01835
G1 X110.91 Y97.453 E.01835
G1 X111.321 Y97.886 E.01835
G1 X111.628 Y98.398 E.01835
G1 X111.819 Y98.964 E.01835
G1 X111.884 Y99.557 E.01835
G1 X111.819 Y100.151 E.01835
G1 X111.628 Y100.717 E.01835
G1 X111.321 Y101.228 E.01835
G1 X110.91 Y101.662 E.01835
G1 X110.416 Y101.997 E.01835
G1 X109.922 Y102.194 E.01634
G1 X109.861 Y102.218 E.00201
G1 X109.272 Y102.315 E.01835
G1 X108.676 Y102.282 E.01835
G1 X108.1 Y102.122 E.01835
G1 X107.573 Y101.843 E.01835
G1 X107.523 Y101.801 E.00201
G1 X107.118 Y101.456 E.01634
G1 X106.756 Y100.981 E.01835
G1 X106.506 Y100.439 E.01835
G1 X106.377 Y99.856 E.01835
G1 X106.377 Y99.259 E.01835
G1 X106.506 Y98.676 E.01835
G1 X106.756 Y98.134 E.01835
G1 X107.118 Y97.658 E.01835
G1 X107.573 Y97.272 E.01835
G1 X108.1 Y96.992 E.01835
G1 X108.676 Y96.832 E.01835
G1 X109.164 Y96.806 E.01502
M204 S10000
; WIPE_START
G1 F24000
G1 X109.272 Y96.8 E-.04115
G1 X109.861 Y96.897 E-.22689
G1 X110.416 Y97.118 E-.22689
G1 X110.91 Y97.453 E-.22689
G1 X110.979 Y97.526 E-.03817
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I-1.216 J.042 P1  F30000
G1 X111.119 Y101.574 Z1
G1 Z.6
G1 E.8 F1800
M204 S5000
G1 F2228
G1 X110.7 Y101.918 E.01666
G1 X110.209 Y102.18 E.0171
G1 X109.676 Y102.342 E.0171
G1 X109.122 Y102.396 E.0171
G1 X108.569 Y102.342 E.0171
G1 X108.036 Y102.18 E.0171
G1 X107.545 Y101.918 E.0171
G1 X107.115 Y101.565 E.0171
G1 X106.762 Y101.135 E.0171
G1 X106.5 Y100.644 E.0171
G1 X106.338 Y100.111 E.0171
G1 X106.283 Y99.557 E.0171
G1 X106.338 Y99.003 E.0171
G1 X106.5 Y98.471 E.0171
G1 X106.762 Y97.98 E.0171
G1 X107.115 Y97.55 E.0171
G1 X107.545 Y97.197 E.0171
G1 X108.036 Y96.934 E.0171
G1 X108.569 Y96.773 E.0171
G1 X109.122 Y96.718 E.0171
G1 X109.651 Y96.77 E.01632
G1 X110.209 Y96.934 E.01786
G1 X110.7 Y97.197 E.0171
G1 X111.13 Y97.55 E.0171
G1 X111.483 Y97.98 E.0171
G1 X111.745 Y98.471 E.0171
G1 X111.907 Y99.003 E.0171
G1 X111.961 Y99.557 E.0171
G1 X111.907 Y100.111 E.0171
G1 X111.745 Y100.644 E.0171
G1 X111.483 Y101.135 E.0171
G1 X111.159 Y101.53 E.0157
M204 S10000
; WIPE_START
G1 F24000
G1 X110.7 Y101.918 E-.2285
G1 X110.209 Y102.18 E-.21148
G1 X109.676 Y102.342 E-.21149
G1 X109.392 Y102.37 E-.10853
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I1.216 J-.041 P1  F30000
G1 X108.442 Y73.987 Z1
G1 Z.6
G1 E.8 F1800
M204 S5000
G1 F2228
G1 X108.49 Y73.985 E.00148
G1 X109.079 Y74.081 E.01835
G1 X109.634 Y74.302 E.01835
G1 X110.128 Y74.637 E.01835
G1 X110.538 Y75.071 E.01835
G1 X110.846 Y75.582 E.01835
G1 X111.037 Y76.148 E.01835
G1 X111.102 Y76.742 E.01835
G1 X111.037 Y77.335 E.01835
G1 X110.846 Y77.901 E.01835
G1 X110.538 Y78.413 E.01835
G1 X110.128 Y78.846 E.01835
G1 X109.634 Y79.181 E.01835
G1 X109.14 Y79.378 E.01634
G1 X109.079 Y79.402 E.00201
G1 X108.49 Y79.499 E.01835
G1 X107.894 Y79.467 E.01835
G1 X107.318 Y79.307 E.01835
G1 X106.791 Y79.027 E.01835
G1 X106.741 Y78.985 E.00201
G1 X106.336 Y78.641 E.01634
G1 X105.974 Y78.165 E.01835
G1 X105.724 Y77.623 E.01835
G1 X105.595 Y77.04 E.01835
G1 X105.595 Y76.443 E.01835
G1 X105.724 Y75.86 E.01835
G1 X105.974 Y75.318 E.01835
G1 X106.336 Y74.843 E.01835
G1 X106.791 Y74.456 E.01835
G1 X107.318 Y74.177 E.01835
G1 X107.894 Y74.017 E.01835
G1 X108.382 Y73.99 E.01502
M204 S10000
; WIPE_START
G1 F24000
G1 X108.49 Y73.985 E-.04115
G1 X109.079 Y74.081 E-.22689
G1 X109.634 Y74.302 E-.22689
G1 X110.128 Y74.637 E-.22689
G1 X110.197 Y74.71 E-.03817
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I-1.216 J.042 P1  F30000
G1 X110.337 Y78.758 Z1
G1 Z.6
G1 E.8 F1800
M204 S5000
G1 F2228
G1 X109.918 Y79.102 E.01666
G1 X109.427 Y79.365 E.0171
G1 X108.894 Y79.526 E.0171
G1 X108.34 Y79.581 E.0171
G1 X107.786 Y79.526 E.0171
G1 X107.254 Y79.365 E.0171
G1 X106.763 Y79.102 E.0171
G1 X106.333 Y78.749 E.0171
G1 X105.98 Y78.319 E.0171
G1 X105.717 Y77.828 E.0171
G1 X105.556 Y77.296 E.0171
G1 X105.501 Y76.742 E.0171
G1 X105.556 Y76.188 E.0171
G1 X105.717 Y75.655 E.0171
G1 X105.98 Y75.164 E.0171
G1 X106.333 Y74.734 E.0171
G1 X106.763 Y74.381 E.0171
G1 X107.254 Y74.119 E.0171
G1 X107.786 Y73.957 E.0171
G1 X108.34 Y73.903 E.0171
G1 X108.869 Y73.955 E.01632
G1 X109.427 Y74.119 E.01786
G1 X109.918 Y74.381 E.0171
G1 X110.348 Y74.734 E.0171
G1 X110.701 Y75.164 E.0171
G1 X110.963 Y75.655 E.0171
G1 X111.125 Y76.188 E.0171
G1 X111.179 Y76.742 E.0171
G1 X111.125 Y77.296 E.0171
G1 X110.963 Y77.828 E.0171
G1 X110.701 Y78.319 E.0171
G1 X110.377 Y78.714 E.0157
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 0.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X109.918 Y79.102 E-.2285
G1 X109.427 Y79.365 E-.21148
G1 X108.894 Y79.526 E-.21149
G1 X108.61 Y79.554 E-.10853
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 4/32
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
G3 Z1 I-.528 J1.097 P1  F30000
G1 X131.216 Y90.433 Z1
G1 Z.8
G1 E.8 F1800
M204 S5000
G1 F2228
G1 X131.195 Y90.456 E.00097
G1 X131.133 Y90.521 E.00276
G1 X130.639 Y90.856 E.01835
G1 X130.084 Y91.077 E.01835
G1 X129.495 Y91.174 E.01835
M73 P56 R5
G1 X128.898 Y91.142 E.01835
G1 X128.323 Y90.982 E.01835
G1 X127.796 Y90.702 E.01835
G1 X127.341 Y90.316 E.01835
G1 X126.979 Y89.84 E.01835
G1 X126.728 Y89.298 E.01835
G1 X126.6 Y88.715 E.01835
G1 X126.6 Y88.118 E.01835
G1 X126.728 Y87.535 E.01835
G1 X126.979 Y86.993 E.01835
G1 X127.341 Y86.518 E.01835
G1 X127.796 Y86.131 E.01835
G1 X128.323 Y85.852 E.01835
G1 X128.898 Y85.692 E.01835
G1 X128.988 Y85.687 E.00276
G1 X129.495 Y85.66 E.01558
G1 X130.084 Y85.756 E.01835
G1 X130.639 Y85.977 E.01835
G1 X131.133 Y86.312 E.01835
G1 X131.543 Y86.746 E.01835
G1 X131.851 Y87.257 E.01835
G1 X132.042 Y87.823 E.01835
G1 X132.106 Y88.417 E.01835
G1 X132.042 Y89.01 E.01835
G1 X131.851 Y89.576 E.01835
G1 X131.543 Y90.088 E.01835
G1 X131.258 Y90.389 E.01276
M204 S10000
; WIPE_START
G1 F24000
G1 X131.195 Y90.456 E-.03486
G1 X131.133 Y90.521 E-.03419
G1 X130.639 Y90.856 E-.22689
G1 X130.084 Y91.077 E-.22689
G1 X129.495 Y91.174 E-.22689
G1 X129.468 Y91.172 E-.01028
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I1.216 J-.036 P1  F30000
G1 X129.303 Y85.59 Z1.2
G1 Z.8
G1 E.8 F1800
M204 S5000
G1 F2228
G1 X129.397 Y85.583 E.00289
G1 X129.899 Y85.632 E.0155
G1 X130.432 Y85.794 E.0171
G1 X130.922 Y86.056 E.0171
G1 X131.353 Y86.409 E.0171
G1 X131.706 Y86.839 E.0171
G1 X131.968 Y87.33 E.0171
G1 X132.13 Y87.863 E.0171
G1 X132.184 Y88.417 E.0171
G1 X132.13 Y88.971 E.0171
G1 X131.968 Y89.503 E.0171
G1 X131.706 Y89.994 E.0171
G1 X131.353 Y90.424 E.0171
G1 X130.922 Y90.777 E.0171
G1 X130.432 Y91.04 E.0171
G1 X129.899 Y91.201 E.0171
G1 X129.345 Y91.256 E.0171
G1 X128.791 Y91.201 E.0171
G1 X128.259 Y91.04 E.0171
G1 X127.768 Y90.777 E.0171
G1 X127.338 Y90.424 E.0171
G1 X126.985 Y89.994 E.0171
G1 X126.722 Y89.503 E.0171
G1 X126.561 Y88.971 E.0171
G1 X126.506 Y88.417 E.0171
G1 X126.561 Y87.863 E.0171
G1 X126.722 Y87.33 E.0171
G1 X126.985 Y86.839 E.0171
G1 X127.338 Y86.409 E.0171
G1 X127.768 Y86.056 E.0171
G1 X128.259 Y85.794 E.0171
G1 X128.791 Y85.632 E.0171
G1 X129.243 Y85.595 E.01394
M204 S10000
; WIPE_START
G1 F24000
G1 X129.397 Y85.583 E-.0586
G1 X129.899 Y85.632 E-.19168
G1 X130.432 Y85.794 E-.21149
G1 X130.922 Y86.056 E-.21148
G1 X131.099 Y86.201 E-.08675
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I-1.217 J-.006 P1  F30000
G1 X130.973 Y112.413 Z1.2
G1 Z.8
G1 E.8 F1800
M204 S5000
G1 F2228
G1 X130.951 Y112.436 E.00097
G1 X130.889 Y112.501 E.00276
G1 X130.395 Y112.836 E.01835
G1 X129.841 Y113.057 E.01835
G1 X129.251 Y113.154 E.01835
G1 X128.655 Y113.121 E.01835
G1 X128.08 Y112.961 E.01835
G1 X127.552 Y112.682 E.01835
G1 X127.097 Y112.295 E.01835
G1 X126.736 Y111.82 E.01835
G1 X126.485 Y111.278 E.01835
G1 X126.357 Y110.695 E.01835
G1 X126.357 Y110.098 E.01835
G1 X126.485 Y109.515 E.01835
G1 X126.736 Y108.973 E.01835
G1 X127.097 Y108.497 E.01835
G1 X127.552 Y108.111 E.01835
G1 X128.08 Y107.831 E.01835
G1 X128.655 Y107.672 E.01835
G1 X128.745 Y107.667 E.00276
G1 X129.251 Y107.639 E.01558
G1 X129.841 Y107.736 E.01835
G1 X130.395 Y107.957 E.01835
G1 X130.889 Y108.292 E.01835
G1 X131.3 Y108.725 E.01835
G1 X131.608 Y109.237 E.01835
G1 X131.798 Y109.803 E.01835
G1 X131.863 Y110.396 E.01835
G1 X131.798 Y110.99 E.01835
G1 X131.608 Y111.556 E.01835
G1 X131.3 Y112.067 E.01835
G1 X131.014 Y112.369 E.01276
M204 S10000
; WIPE_START
G1 F24000
G1 X130.951 Y112.436 E-.03486
G1 X130.889 Y112.501 E-.03419
G1 X130.395 Y112.836 E-.22689
G1 X129.841 Y113.057 E-.22689
G1 X129.251 Y113.154 E-.22689
G1 X129.224 Y113.152 E-.01028
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I1.216 J-.036 P1  F30000
G1 X129.06 Y107.57 Z1.2
G1 Z.8
G1 E.8 F1800
M204 S5000
G1 F2228
G1 X129.154 Y107.562 E.00289
G1 X129.656 Y107.612 E.0155
G1 X130.188 Y107.773 E.0171
G1 X130.679 Y108.036 E.0171
G1 X131.109 Y108.389 E.0171
G1 X131.462 Y108.819 E.0171
G1 X131.725 Y109.31 E.0171
G1 X131.886 Y109.843 E.0171
G1 X131.941 Y110.396 E.0171
G1 X131.886 Y110.95 E.0171
G1 X131.725 Y111.483 E.0171
G1 X131.462 Y111.974 E.0171
G1 X131.109 Y112.404 E.0171
G1 X130.679 Y112.757 E.0171
G1 X130.188 Y113.019 E.0171
G1 X129.656 Y113.181 E.0171
G1 X129.102 Y113.235 E.0171
G1 X128.548 Y113.181 E.0171
G1 X128.015 Y113.019 E.0171
G1 X127.525 Y112.757 E.0171
G1 X127.094 Y112.404 E.0171
G1 X126.741 Y111.974 E.0171
G1 X126.479 Y111.483 E.0171
G1 X126.317 Y110.95 E.0171
G1 X126.263 Y110.396 E.0171
G1 X126.317 Y109.843 E.0171
G1 X126.479 Y109.31 E.0171
G1 X126.741 Y108.819 E.0171
G1 X127.094 Y108.389 E.0171
G1 X127.525 Y108.036 E.0171
G1 X128.015 Y107.773 E.0171
G1 X128.548 Y107.612 E.0171
G1 X129 Y107.575 E.01394
M204 S10000
; WIPE_START
G1 F24000
G1 X129.154 Y107.562 E-.0586
G1 X129.656 Y107.612 E-.19168
G1 X130.188 Y107.773 E-.21149
G1 X130.679 Y108.036 E-.21148
G1 X130.856 Y108.181 E-.08675
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I-1.216 J.057 P1  F30000
G1 X131.871 Y130.016 Z1.2
G1 Z.8
G1 E.8 F1800
M204 S5000
G1 F2228
G1 X131.849 Y130.039 E.00097
G1 X131.788 Y130.105 E.00276
G1 X131.293 Y130.44 E.01835
G1 X130.739 Y130.661 E.01835
G1 X130.149 Y130.757 E.01835
G1 X129.553 Y130.725 E.01835
G1 X128.978 Y130.565 E.01835
G1 X128.45 Y130.285 E.01835
G1 X127.995 Y129.899 E.01835
G1 X127.634 Y129.424 E.01835
G1 X127.383 Y128.882 E.01835
G1 X127.255 Y128.299 E.01835
G1 X127.255 Y127.701 E.01835
G1 X127.383 Y127.118 E.01835
G1 X127.634 Y126.576 E.01835
G1 X127.995 Y126.101 E.01835
G1 X128.45 Y125.715 E.01835
G1 X128.978 Y125.435 E.01835
G1 X129.553 Y125.275 E.01835
G1 X129.643 Y125.27 E.00276
G1 X130.149 Y125.243 E.01558
G1 X130.739 Y125.339 E.01835
G1 X131.293 Y125.56 E.01835
G1 X131.788 Y125.895 E.01835
G1 X132.198 Y126.329 E.01835
G1 X132.506 Y126.841 E.01835
G1 X132.697 Y127.406 E.01835
G1 X132.761 Y128 E.01835
G1 X132.697 Y128.594 E.01835
G1 X132.506 Y129.159 E.01835
G1 X132.198 Y129.671 E.01835
G1 X131.913 Y129.973 E.01276
M204 S10000
; WIPE_START
G1 F24000
G1 X131.849 Y130.039 E-.03486
G1 X131.788 Y130.105 E-.03419
G1 X131.293 Y130.44 E-.22689
G1 X130.739 Y130.661 E-.22689
G1 X130.149 Y130.757 E-.22689
G1 X130.122 Y130.756 E-.01028
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I1.216 J-.036 P1  F30000
G1 X129.958 Y125.174 Z1.2
G1 Z.8
G1 E.8 F1800
M204 S5000
G1 F2228
G1 X130.052 Y125.166 E.00289
G1 X130.554 Y125.216 E.0155
G1 X131.086 Y125.377 E.0171
G1 X131.577 Y125.639 E.0171
G1 X132.007 Y125.993 E.0171
G1 X132.361 Y126.423 E.0171
G1 X132.623 Y126.914 E.0171
G1 X132.784 Y127.446 E.0171
G1 X132.839 Y128 E.0171
G1 X132.784 Y128.554 E.0171
G1 X132.623 Y129.086 E.0171
G1 X132.361 Y129.577 E.0171
G1 X132.007 Y130.007 E.0171
G1 X131.577 Y130.361 E.0171
G1 X131.086 Y130.623 E.0171
G1 X130.554 Y130.784 E.0171
G1 X130 Y130.839 E.0171
G1 X129.446 Y130.784 E.0171
G1 X128.914 Y130.623 E.0171
G1 X128.423 Y130.361 E.0171
G1 X127.993 Y130.007 E.0171
G1 X127.639 Y129.577 E.0171
G1 X127.377 Y129.086 E.0171
G1 X127.216 Y128.554 E.0171
G1 X127.161 Y128 E.0171
G1 X127.216 Y127.446 E.0171
G1 X127.377 Y126.914 E.0171
G1 X127.639 Y126.423 E.0171
G1 X127.993 Y125.993 E.0171
G1 X128.423 Y125.639 E.0171
G1 X128.914 Y125.377 E.0171
G1 X129.446 Y125.216 E.0171
G1 X129.898 Y125.179 E.01394
M204 S10000
; WIPE_START
G1 F24000
G1 X130.052 Y125.166 E-.0586
G1 X130.554 Y125.216 E-.19168
G1 X131.086 Y125.377 E-.21149
G1 X131.577 Y125.639 E-.21148
G1 X131.754 Y125.784 E-.08675
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I-.531 J-1.095 P1  F30000
G1 X109.462 Y136.585 Z1.2
G1 Z.8
G1 E.8 F1800
M204 S5000
G1 F2228
G1 X109.525 Y136.581 E.00193
G1 X110.114 Y136.678 E.01835
G1 X110.669 Y136.899 E.01835
G1 X111.163 Y137.234 E.01835
G1 X111.574 Y137.667 E.01835
G1 X111.881 Y138.179 E.01835
G1 X112.072 Y138.745 E.01835
G1 X112.137 Y139.339 E.01835
G1 X112.072 Y139.932 E.01835
G1 X111.881 Y140.498 E.01835
G1 X111.574 Y141.01 E.01835
G1 X111.219 Y141.383 E.01582
G1 X111.163 Y141.443 E.00253
G1 X110.669 Y141.778 E.01835
G1 X110.114 Y141.999 E.01835
G1 X109.525 Y142.096 E.01835
G1 X108.929 Y142.063 E.01835
G1 X108.353 Y141.904 E.01835
G1 X107.826 Y141.624 E.01835
G1 X107.371 Y141.237 E.01835
G1 X107.009 Y140.762 E.01835
G1 X106.759 Y140.22 E.01835
G1 X106.63 Y139.637 E.01835
G1 X106.63 Y139.04 E.01835
G1 X106.759 Y138.457 E.01835
G1 X107.009 Y137.915 E.01835
G1 X107.371 Y137.44 E.01835
G1 X107.826 Y137.053 E.01835
G1 X108.353 Y136.773 E.01835
G1 X108.929 Y136.614 E.01835
G1 X109.402 Y136.588 E.01458
M204 S10000
; WIPE_START
G1 F24000
G1 X109.525 Y136.581 E-.04661
G1 X110.114 Y136.678 E-.22689
G1 X110.669 Y136.899 E-.22689
G1 X111.163 Y137.234 E-.22689
G1 X111.222 Y137.297 E-.03271
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I-1.216 J.045 P1  F30000
G1 X111.372 Y141.355 Z1.2
G1 Z.8
G1 E.8 F1800
M204 S5000
G1 F2228
G1 X110.953 Y141.699 E.01667
G1 X110.462 Y141.961 E.0171
G1 X109.929 Y142.123 E.0171
G1 X109.375 Y142.177 E.0171
G1 X108.822 Y142.123 E.0171
G1 X108.289 Y141.961 E.0171
G1 X107.798 Y141.699 E.0171
G1 X107.368 Y141.346 E.0171
G1 X107.015 Y140.916 E.0171
G1 X106.752 Y140.425 E.0171
G1 X106.591 Y139.892 E.0171
G1 X106.536 Y139.339 E.0171
G1 X106.591 Y138.785 E.0171
G1 X106.752 Y138.252 E.0171
G1 X107.015 Y137.761 E.0171
G1 X107.368 Y137.331 E.0171
G1 X107.798 Y136.978 E.0171
G1 X108.289 Y136.716 E.0171
G1 X108.822 Y136.554 E.0171
G1 X109.375 Y136.5 E.0171
G1 X109.886 Y136.55 E.01576
G1 X110.462 Y136.716 E.01842
G1 X110.953 Y136.978 E.0171
G1 X111.383 Y137.331 E.0171
G1 X111.736 Y137.761 E.0171
G1 X111.998 Y138.252 E.0171
G1 X112.16 Y138.785 E.0171
G1 X112.214 Y139.339 E.0171
G1 X112.16 Y139.892 E.0171
G1 X111.998 Y140.425 E.0171
G1 X111.736 Y140.916 E.0171
G1 X111.412 Y141.31 E.01568
M204 S10000
; WIPE_START
G1 F24000
G1 X110.953 Y141.699 E-.2287
G1 X110.462 Y141.961 E-.21148
G1 X109.929 Y142.123 E-.21148
G1 X109.646 Y142.151 E-.10833
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I1.217 J-.007 P1  F30000
G1 X109.503 Y116.58 Z1.2
G1 Z.8
G1 E.8 F1800
M204 S5000
G1 F2228
G1 X109.566 Y116.577 E.00193
G1 X110.155 Y116.673 E.01835
G1 X110.71 Y116.894 E.01835
G1 X111.204 Y117.229 E.01835
G1 X111.615 Y117.663 E.01835
G1 X111.923 Y118.174 E.01835
G1 X112.113 Y118.74 E.01835
G1 X112.178 Y119.334 E.01835
G1 X112.113 Y119.927 E.01835
G1 X111.923 Y120.493 E.01835
G1 X111.615 Y121.005 E.01835
G1 X111.261 Y121.379 E.01582
G1 X111.204 Y121.438 E.00253
G1 X110.71 Y121.773 E.01835
G1 X110.155 Y121.994 E.01835
G1 X109.566 Y122.091 E.01835
G1 X108.97 Y122.059 E.01835
G1 X108.394 Y121.899 E.01835
G1 X107.867 Y121.619 E.01835
G1 X107.412 Y121.233 E.01835
G1 X107.051 Y120.757 E.01835
G1 X106.8 Y120.215 E.01835
G1 X106.671 Y119.632 E.01835
G1 X106.671 Y119.035 E.01835
G1 X106.8 Y118.452 E.01835
G1 X107.051 Y117.91 E.01835
G1 X107.412 Y117.435 E.01835
G1 X107.867 Y117.048 E.01835
G1 X108.394 Y116.769 E.01835
G1 X108.97 Y116.609 E.01835
G1 X109.444 Y116.583 E.01458
M204 S10000
; WIPE_START
G1 F24000
G1 X109.566 Y116.577 E-.04661
G1 X110.155 Y116.673 E-.22689
G1 X110.71 Y116.894 E-.22689
G1 X111.204 Y117.229 E-.22689
G1 X111.263 Y117.292 E-.03271
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I-1.216 J.045 P1  F30000
G1 X111.413 Y121.35 Z1.2
G1 Z.8
G1 E.8 F1800
M204 S5000
G1 F2228
G1 X110.994 Y121.694 E.01667
G1 X110.503 Y121.957 E.0171
G1 X109.97 Y122.118 E.0171
G1 X109.417 Y122.173 E.0171
G1 X108.863 Y122.118 E.0171
G1 X108.33 Y121.957 E.0171
G1 X107.839 Y121.694 E.0171
G1 X107.409 Y121.341 E.0171
G1 X107.056 Y120.911 E.0171
G1 X106.794 Y120.42 E.0171
G1 X106.632 Y119.888 E.0171
G1 X106.578 Y119.334 E.0171
G1 X106.632 Y118.78 E.0171
G1 X106.794 Y118.247 E.0171
G1 X107.056 Y117.757 E.0171
G1 X107.409 Y117.326 E.0171
G1 X107.839 Y116.973 E.0171
G1 X108.33 Y116.711 E.0171
G1 X108.863 Y116.549 E.0171
G1 X109.417 Y116.495 E.0171
G1 X109.927 Y116.545 E.01576
G1 X110.503 Y116.711 E.01842
G1 X110.994 Y116.973 E.0171
G1 X111.424 Y117.326 E.0171
G1 X111.777 Y117.757 E.0171
G1 X112.039 Y118.247 E.0171
G1 X112.201 Y118.78 E.0171
G1 X112.256 Y119.334 E.0171
G1 X112.201 Y119.888 E.0171
G1 X112.039 Y120.42 E.0171
G1 X111.777 Y120.911 E.0171
G1 X111.453 Y121.306 E.01568
M204 S10000
; WIPE_START
G1 F24000
G1 X110.994 Y121.694 E-.2287
G1 X110.503 Y121.957 E-.21148
M73 P57 R5
G1 X109.97 Y122.118 E-.21148
G1 X109.687 Y122.146 E-.10833
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I1.217 J-.023 P1  F30000
G1 X109.209 Y96.804 Z1.2
G1 Z.8
G1 E.8 F1800
M204 S5000
G1 F2228
G1 X109.272 Y96.8 E.00193
G1 X109.861 Y96.897 E.01835
G1 X110.416 Y97.118 E.01835
G1 X110.91 Y97.453 E.01835
G1 X111.321 Y97.886 E.01835
G1 X111.628 Y98.398 E.01835
G1 X111.819 Y98.964 E.01835
G1 X111.884 Y99.557 E.01835
G1 X111.819 Y100.151 E.01835
G1 X111.628 Y100.717 E.01835
G1 X111.321 Y101.228 E.01835
G1 X110.967 Y101.602 E.01582
G1 X110.91 Y101.662 E.00253
G1 X110.416 Y101.997 E.01835
G1 X109.861 Y102.218 E.01835
G1 X109.272 Y102.315 E.01835
G1 X108.676 Y102.282 E.01835
G1 X108.1 Y102.122 E.01835
G1 X107.573 Y101.843 E.01835
G1 X107.118 Y101.456 E.01835
G1 X106.756 Y100.981 E.01835
G1 X106.506 Y100.439 E.01835
G1 X106.377 Y99.856 E.01835
G1 X106.377 Y99.259 E.01835
G1 X106.506 Y98.676 E.01835
G1 X106.756 Y98.134 E.01835
G1 X107.118 Y97.658 E.01835
G1 X107.573 Y97.272 E.01835
G1 X108.1 Y96.992 E.01835
G1 X108.676 Y96.832 E.01835
G1 X109.149 Y96.807 E.01458
M204 S10000
; WIPE_START
G1 F24000
G1 X109.272 Y96.8 E-.04661
G1 X109.861 Y96.897 E-.22689
G1 X110.416 Y97.118 E-.22689
G1 X110.91 Y97.453 E-.22689
G1 X110.969 Y97.515 E-.03271
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I-1.216 J.045 P1  F30000
G1 X111.119 Y101.574 Z1.2
G1 Z.8
G1 E.8 F1800
M204 S5000
G1 F2228
G1 X110.7 Y101.918 E.01667
G1 X110.209 Y102.18 E.0171
G1 X109.676 Y102.342 E.0171
G1 X109.122 Y102.396 E.0171
G1 X108.569 Y102.342 E.0171
G1 X108.036 Y102.18 E.0171
G1 X107.545 Y101.918 E.0171
G1 X107.115 Y101.565 E.0171
G1 X106.762 Y101.135 E.0171
G1 X106.5 Y100.644 E.0171
G1 X106.338 Y100.111 E.0171
G1 X106.283 Y99.557 E.0171
G1 X106.338 Y99.003 E.0171
G1 X106.5 Y98.471 E.0171
G1 X106.762 Y97.98 E.0171
G1 X107.115 Y97.55 E.0171
G1 X107.545 Y97.197 E.0171
G1 X108.036 Y96.934 E.0171
G1 X108.569 Y96.773 E.0171
G1 X109.122 Y96.718 E.0171
G1 X109.633 Y96.769 E.01576
G1 X110.209 Y96.934 E.01842
G1 X110.7 Y97.197 E.0171
G1 X111.13 Y97.55 E.0171
G1 X111.483 Y97.98 E.0171
G1 X111.745 Y98.471 E.0171
G1 X111.907 Y99.003 E.0171
G1 X111.961 Y99.557 E.0171
G1 X111.907 Y100.111 E.0171
G1 X111.745 Y100.644 E.0171
G1 X111.483 Y101.135 E.0171
G1 X111.159 Y101.529 E.01568
M204 S10000
; WIPE_START
G1 F24000
G1 X110.7 Y101.918 E-.2287
G1 X110.209 Y102.18 E-.21148
G1 X109.676 Y102.342 E-.21148
G1 X109.393 Y102.37 E-.10833
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I1.216 J-.041 P1  F30000
G1 X108.427 Y73.988 Z1.2
G1 Z.8
G1 E.8 F1800
M204 S5000
G1 F2228
G1 X108.49 Y73.985 E.00193
G1 X109.079 Y74.081 E.01835
G1 X109.634 Y74.302 E.01835
G1 X110.128 Y74.637 E.01835
G1 X110.538 Y75.071 E.01835
G1 X110.846 Y75.582 E.01835
G1 X111.037 Y76.148 E.01835
G1 X111.102 Y76.742 E.01835
G1 X111.037 Y77.335 E.01835
G1 X110.846 Y77.901 E.01835
G1 X110.538 Y78.413 E.01835
G1 X110.184 Y78.787 E.01582
G1 X110.128 Y78.846 E.00253
G1 X109.634 Y79.181 E.01835
G1 X109.079 Y79.402 E.01835
G1 X108.49 Y79.499 E.01835
G1 X107.894 Y79.467 E.01835
G1 X107.318 Y79.307 E.01835
G1 X106.791 Y79.027 E.01835
G1 X106.336 Y78.641 E.01835
G1 X105.974 Y78.165 E.01835
G1 X105.724 Y77.623 E.01835
G1 X105.595 Y77.04 E.01835
G1 X105.595 Y76.443 E.01835
G1 X105.724 Y75.86 E.01835
G1 X105.974 Y75.318 E.01835
G1 X106.336 Y74.843 E.01835
G1 X106.791 Y74.456 E.01835
G1 X107.318 Y74.177 E.01835
G1 X107.894 Y74.017 E.01835
G1 X108.367 Y73.991 E.01458
M204 S10000
; WIPE_START
G1 F24000
G1 X108.49 Y73.985 E-.04661
G1 X109.079 Y74.081 E-.22689
G1 X109.634 Y74.302 E-.22689
G1 X110.128 Y74.637 E-.22689
G1 X110.187 Y74.7 E-.03271
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I-1.216 J.045 P1  F30000
G1 X110.337 Y78.758 Z1.2
G1 Z.8
G1 E.8 F1800
M204 S5000
G1 F2228
G1 X109.918 Y79.102 E.01667
G1 X109.427 Y79.365 E.0171
G1 X108.894 Y79.526 E.0171
G1 X108.34 Y79.581 E.0171
G1 X107.786 Y79.526 E.0171
M73 P57 R4
G1 X107.254 Y79.365 E.0171
G1 X106.763 Y79.102 E.0171
G1 X106.333 Y78.749 E.0171
G1 X105.98 Y78.319 E.0171
G1 X105.717 Y77.828 E.0171
G1 X105.556 Y77.296 E.0171
G1 X105.501 Y76.742 E.0171
G1 X105.556 Y76.188 E.0171
G1 X105.717 Y75.655 E.0171
G1 X105.98 Y75.164 E.0171
G1 X106.333 Y74.734 E.0171
G1 X106.763 Y74.381 E.0171
G1 X107.254 Y74.119 E.0171
G1 X107.786 Y73.957 E.0171
G1 X108.34 Y73.903 E.0171
G1 X108.851 Y73.953 E.01576
G1 X109.427 Y74.119 E.01842
G1 X109.918 Y74.381 E.0171
G1 X110.348 Y74.734 E.0171
G1 X110.701 Y75.164 E.0171
G1 X110.963 Y75.655 E.0171
G1 X111.125 Y76.188 E.0171
G1 X111.179 Y76.742 E.0171
G1 X111.125 Y77.296 E.0171
G1 X110.963 Y77.828 E.0171
G1 X110.701 Y78.319 E.0171
G1 X110.377 Y78.714 E.01568
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X109.918 Y79.102 E-.2287
G1 X109.427 Y79.365 E-.21148
G1 X108.894 Y79.526 E-.21148
G1 X108.61 Y79.554 E-.10833
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 5/32
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
G3 Z1.2 I-.528 J1.097 P1  F30000
G1 X131.22 Y90.429 Z1.2
G1 Z1
G1 E.8 F1800
M204 S5000
G1 F2228
G1 X131.208 Y90.442 E.00054
G1 X131.133 Y90.521 E.00335
G1 X130.639 Y90.856 E.01835
G1 X130.084 Y91.077 E.01835
G1 X129.495 Y91.174 E.01835
G1 X128.898 Y91.142 E.01835
G1 X128.323 Y90.982 E.01835
G1 X127.796 Y90.702 E.01835
G1 X127.341 Y90.316 E.01835
G1 X126.979 Y89.84 E.01835
G1 X126.728 Y89.298 E.01835
G1 X126.6 Y88.715 E.01835
G1 X126.6 Y88.118 E.01835
G1 X126.728 Y87.535 E.01835
G1 X126.979 Y86.993 E.01835
G1 X127.341 Y86.518 E.01835
G1 X127.796 Y86.131 E.01835
G1 X128.323 Y85.852 E.01835
G1 X128.898 Y85.692 E.01835
G1 X129.007 Y85.686 E.00335
G1 X129.495 Y85.66 E.01499
G1 X130.084 Y85.756 E.01835
G1 X130.639 Y85.977 E.01835
G1 X131.133 Y86.312 E.01835
G1 X131.543 Y86.746 E.01835
G1 X131.851 Y87.257 E.01835
G1 X132.042 Y87.823 E.01835
G1 X132.106 Y88.417 E.01835
G1 X132.042 Y89.01 E.01835
G1 X131.851 Y89.576 E.01835
G1 X131.543 Y90.088 E.01835
G1 X131.261 Y90.386 E.01261
M204 S10000
; WIPE_START
G1 F24000
G1 X131.208 Y90.442 E-.02952
G1 X131.133 Y90.521 E-.04147
G1 X130.639 Y90.856 E-.22689
G1 X130.084 Y91.077 E-.22689
G1 X129.495 Y91.174 E-.22689
G1 X129.473 Y91.173 E-.00833
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I1.216 J-.037 P1  F30000
G1 X129.303 Y85.582 Z1.4
G1 Z1
G1 E.8 F1800
M204 S5000
G1 F2228
G1 X129.345 Y85.578 E.00129
G1 X129.418 Y85.585 E.00224
G1 X129.899 Y85.632 E.01486
G1 X130.432 Y85.794 E.0171
G1 X130.922 Y86.056 E.0171
G1 X131.353 Y86.409 E.0171
G1 X131.706 Y86.839 E.0171
G1 X131.968 Y87.33 E.0171
G1 X132.13 Y87.863 E.0171
G1 X132.184 Y88.417 E.0171
G1 X132.13 Y88.971 E.0171
G1 X131.968 Y89.503 E.0171
G1 X131.706 Y89.994 E.0171
G1 X131.353 Y90.424 E.0171
G1 X130.922 Y90.777 E.0171
G1 X130.432 Y91.04 E.0171
G1 X129.899 Y91.201 E.0171
G1 X129.345 Y91.256 E.0171
G1 X128.791 Y91.201 E.0171
G1 X128.259 Y91.04 E.0171
G1 X127.768 Y90.777 E.0171
G1 X127.338 Y90.424 E.0171
G1 X126.985 Y89.994 E.0171
G1 X126.722 Y89.503 E.0171
G1 X126.561 Y88.971 E.0171
G1 X126.506 Y88.417 E.0171
G1 X126.561 Y87.863 E.0171
G1 X126.722 Y87.33 E.0171
G1 X126.985 Y86.839 E.0171
G1 X127.338 Y86.409 E.0171
G1 X127.768 Y86.056 E.0171
G1 X128.259 Y85.794 E.0171
G1 X128.791 Y85.632 E.0171
G1 X129.244 Y85.588 E.01397
M204 S10000
; WIPE_START
G1 F24000
G1 X129.345 Y85.578 E-.03877
G1 X129.418 Y85.585 E-.0277
G1 X129.899 Y85.632 E-.18378
G1 X130.432 Y85.794 E-.21149
G1 X130.922 Y86.056 E-.21148
G1 X131.099 Y86.201 E-.08678
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I-1.217 J-.006 P1  F30000
G1 X130.977 Y112.409 Z1.4
G1 Z1
G1 E.8 F1800
M204 S5000
G1 F2228
G1 X130.964 Y112.422 E.00054
G1 X130.889 Y112.501 E.00335
G1 X130.395 Y112.836 E.01835
G1 X129.841 Y113.057 E.01835
G1 X129.251 Y113.154 E.01835
G1 X128.655 Y113.121 E.01835
G1 X128.08 Y112.961 E.01835
G1 X127.552 Y112.682 E.01835
G1 X127.097 Y112.295 E.01835
G1 X126.736 Y111.82 E.01835
G1 X126.485 Y111.278 E.01835
G1 X126.357 Y110.695 E.01835
G1 X126.357 Y110.098 E.01835
G1 X126.485 Y109.515 E.01835
G1 X126.736 Y108.973 E.01835
G1 X127.097 Y108.497 E.01835
G1 X127.552 Y108.111 E.01835
G1 X128.08 Y107.831 E.01835
G1 X128.655 Y107.672 E.01835
G1 X128.764 Y107.666 E.00335
G1 X129.251 Y107.639 E.01499
G1 X129.841 Y107.736 E.01835
G1 X130.395 Y107.957 E.01835
G1 X130.889 Y108.292 E.01835
G1 X131.3 Y108.725 E.01835
G1 X131.608 Y109.237 E.01835
G1 X131.798 Y109.803 E.01835
G1 X131.863 Y110.396 E.01835
G1 X131.798 Y110.99 E.01835
G1 X131.608 Y111.556 E.01835
G1 X131.3 Y112.067 E.01835
G1 X131.018 Y112.365 E.01261
M204 S10000
; WIPE_START
G1 F24000
G1 X130.964 Y112.422 E-.02952
G1 X130.889 Y112.501 E-.04147
G1 X130.395 Y112.836 E-.22689
G1 X129.841 Y113.057 E-.22689
G1 X129.251 Y113.154 E-.22689
G1 X129.229 Y113.152 E-.00833
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I1.216 J-.037 P1  F30000
G1 X129.06 Y107.562 Z1.4
G1 Z1
G1 E.8 F1800
M204 S5000
G1 F2228
G1 X129.102 Y107.557 E.00129
G1 X129.174 Y107.565 E.00224
G1 X129.656 Y107.612 E.01486
G1 X130.188 Y107.773 E.0171
G1 X130.679 Y108.036 E.0171
G1 X131.109 Y108.389 E.0171
G1 X131.462 Y108.819 E.0171
G1 X131.725 Y109.31 E.0171
G1 X131.886 Y109.843 E.0171
G1 X131.941 Y110.396 E.0171
G1 X131.886 Y110.95 E.0171
G1 X131.725 Y111.483 E.0171
G1 X131.462 Y111.974 E.0171
G1 X131.109 Y112.404 E.0171
G1 X130.679 Y112.757 E.0171
G1 X130.188 Y113.019 E.0171
G1 X129.656 Y113.181 E.0171
G1 X129.102 Y113.235 E.0171
G1 X128.548 Y113.181 E.0171
G1 X128.015 Y113.019 E.0171
G1 X127.525 Y112.757 E.0171
G1 X127.094 Y112.404 E.0171
G1 X126.741 Y111.974 E.0171
G1 X126.479 Y111.483 E.0171
G1 X126.317 Y110.95 E.0171
G1 X126.263 Y110.396 E.0171
G1 X126.317 Y109.843 E.0171
G1 X126.479 Y109.31 E.0171
G1 X126.741 Y108.819 E.0171
G1 X127.094 Y108.389 E.0171
G1 X127.525 Y108.036 E.0171
G1 X128.015 Y107.773 E.0171
G1 X128.548 Y107.612 E.0171
G1 X129 Y107.567 E.01397
M204 S10000
; WIPE_START
G1 F24000
G1 X129.102 Y107.557 E-.03877
G1 X129.174 Y107.565 E-.0277
G1 X129.656 Y107.612 E-.18378
G1 X130.188 Y107.773 E-.21149
G1 X130.679 Y108.036 E-.21148
G1 X130.856 Y108.181 E-.08678
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I-1.216 J.057 P1  F30000
G1 X131.875 Y130.012 Z1.4
G1 Z1
G1 E.8 F1800
M204 S5000
G1 F2228
G1 X131.863 Y130.025 E.00054
G1 X131.788 Y130.105 E.00335
G1 X131.293 Y130.44 E.01835
G1 X130.739 Y130.661 E.01835
G1 X130.149 Y130.757 E.01835
G1 X129.553 Y130.725 E.01835
G1 X128.978 Y130.565 E.01835
G1 X128.45 Y130.285 E.01835
G1 X127.995 Y129.899 E.01835
G1 X127.634 Y129.424 E.01835
G1 X127.383 Y128.882 E.01835
G1 X127.255 Y128.299 E.01835
G1 X127.255 Y127.701 E.01835
G1 X127.383 Y127.118 E.01835
G1 X127.634 Y126.576 E.01835
G1 X127.995 Y126.101 E.01835
G1 X128.45 Y125.715 E.01835
G1 X128.978 Y125.435 E.01835
G1 X129.553 Y125.275 E.01835
G1 X129.662 Y125.269 E.00335
G1 X130.149 Y125.243 E.01499
G1 X130.739 Y125.339 E.01835
G1 X131.293 Y125.56 E.01835
G1 X131.788 Y125.895 E.01835
G1 X132.198 Y126.329 E.01835
G1 X132.506 Y126.841 E.01835
G1 X132.697 Y127.406 E.01835
G1 X132.761 Y128 E.01835
G1 X132.697 Y128.594 E.01835
G1 X132.506 Y129.159 E.01835
G1 X132.198 Y129.671 E.01835
G1 X131.916 Y129.969 E.01261
M204 S10000
; WIPE_START
G1 F24000
G1 X131.863 Y130.025 E-.02952
G1 X131.788 Y130.105 E-.04147
G1 X131.293 Y130.44 E-.22689
G1 X130.739 Y130.661 E-.22689
G1 X130.149 Y130.757 E-.22689
G1 X130.128 Y130.756 E-.00833
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I1.216 J-.037 P1  F30000
G1 X129.958 Y125.165 Z1.4
G1 Z1
G1 E.8 F1800
M204 S5000
G1 F2228
G1 X130 Y125.161 E.00129
G1 X130.073 Y125.168 E.00224
G1 X130.554 Y125.216 E.01486
G1 X131.086 Y125.377 E.0171
G1 X131.577 Y125.639 E.0171
G1 X132.007 Y125.993 E.0171
G1 X132.361 Y126.423 E.0171
G1 X132.623 Y126.914 E.0171
G1 X132.784 Y127.446 E.0171
G1 X132.839 Y128 E.0171
G1 X132.784 Y128.554 E.0171
G1 X132.623 Y129.086 E.0171
G1 X132.361 Y129.577 E.0171
G1 X132.007 Y130.007 E.0171
G1 X131.577 Y130.361 E.0171
G1 X131.086 Y130.623 E.0171
G1 X130.554 Y130.784 E.0171
G1 X130 Y130.839 E.0171
G1 X129.446 Y130.784 E.0171
M73 P58 R4
G1 X128.914 Y130.623 E.0171
G1 X128.423 Y130.361 E.0171
G1 X127.993 Y130.007 E.0171
G1 X127.639 Y129.577 E.0171
G1 X127.377 Y129.086 E.0171
G1 X127.216 Y128.554 E.0171
G1 X127.161 Y128 E.0171
G1 X127.216 Y127.446 E.0171
G1 X127.377 Y126.914 E.0171
G1 X127.639 Y126.423 E.0171
G1 X127.993 Y125.993 E.0171
G1 X128.423 Y125.639 E.0171
G1 X128.914 Y125.377 E.0171
G1 X129.446 Y125.216 E.0171
G1 X129.898 Y125.171 E.01397
M204 S10000
; WIPE_START
G1 F24000
G1 X130 Y125.161 E-.03877
G1 X130.073 Y125.168 E-.0277
G1 X130.554 Y125.216 E-.18378
G1 X131.086 Y125.377 E-.21149
G1 X131.577 Y125.639 E-.21148
G1 X131.754 Y125.784 E-.08678
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I-.53 J-1.095 P1  F30000
G1 X109.447 Y136.586 Z1.4
G1 Z1
G1 E.8 F1800
M204 S5000
G1 F2228
G1 X109.525 Y136.581 E.00239
G1 X110.114 Y136.678 E.01835
G1 X110.669 Y136.899 E.01835
G1 X111.163 Y137.234 E.01835
G1 X111.574 Y137.667 E.01835
G1 X111.881 Y138.179 E.01835
G1 X112.072 Y138.745 E.01835
G1 X112.137 Y139.339 E.01835
G1 X112.072 Y139.932 E.01835
G1 X111.881 Y140.498 E.01835
G1 X111.574 Y141.01 E.01835
G1 X111.231 Y141.371 E.0153
G1 X111.163 Y141.443 E.00305
G1 X110.669 Y141.778 E.01835
G1 X110.114 Y141.999 E.01835
G1 X109.525 Y142.096 E.01835
G1 X108.929 Y142.063 E.01835
G1 X108.353 Y141.904 E.01835
G1 X107.826 Y141.624 E.01835
G1 X107.75 Y141.56 E.00305
G1 X107.371 Y141.237 E.0153
G1 X107.009 Y140.762 E.01835
G1 X106.759 Y140.22 E.01835
G1 X106.63 Y139.637 E.01835
G1 X106.63 Y139.04 E.01835
G1 X106.759 Y138.457 E.01835
G1 X107.009 Y137.915 E.01835
G1 X107.371 Y137.44 E.01835
G1 X107.826 Y137.053 E.01835
G1 X108.353 Y136.773 E.01835
G1 X108.929 Y136.614 E.01835
G1 X109.387 Y136.589 E.01412
M204 S10000
; WIPE_START
G1 F24000
G1 X109.525 Y136.581 E-.05231
G1 X110.114 Y136.678 E-.22689
G1 X110.669 Y136.899 E-.22689
G1 X111.163 Y137.234 E-.22689
G1 X111.212 Y137.286 E-.02701
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I-1.216 J.048 P1  F30000
G1 X111.373 Y141.354 Z1.4
G1 Z1
G1 E.8 F1800
M204 S5000
G1 F2228
G1 X110.953 Y141.699 E.01669
G1 X110.462 Y141.961 E.0171
G1 X109.929 Y142.123 E.0171
G1 X109.375 Y142.177 E.0171
G1 X108.822 Y142.123 E.0171
G1 X108.289 Y141.961 E.0171
G1 X107.798 Y141.699 E.0171
G1 X107.368 Y141.346 E.0171
G1 X107.015 Y140.916 E.0171
G1 X106.752 Y140.425 E.0171
G1 X106.591 Y139.892 E.0171
G1 X106.536 Y139.339 E.0171
G1 X106.591 Y138.785 E.0171
G1 X106.752 Y138.252 E.0171
G1 X107.015 Y137.761 E.0171
G1 X107.368 Y137.331 E.0171
G1 X107.798 Y136.978 E.0171
G1 X108.289 Y136.716 E.0171
G1 X108.822 Y136.554 E.0171
G1 X109.375 Y136.5 E.0171
G1 X109.867 Y136.548 E.01519
G1 X110.462 Y136.716 E.01898
G1 X110.953 Y136.978 E.0171
G1 X111.383 Y137.331 E.0171
G1 X111.736 Y137.761 E.0171
G1 X111.998 Y138.252 E.0171
G1 X112.16 Y138.785 E.0171
G1 X112.214 Y139.339 E.0171
G1 X112.16 Y139.892 E.0171
G1 X111.998 Y140.425 E.0171
G1 X111.736 Y140.916 E.0171
G1 X111.412 Y141.31 E.01567
M204 S10000
; WIPE_START
G1 F24000
G1 X110.953 Y141.699 E-.22891
G1 X110.462 Y141.961 E-.21148
G1 X109.929 Y142.123 E-.21149
G1 X109.646 Y142.151 E-.10812
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I1.217 J-.008 P1  F30000
G1 X109.488 Y116.581 Z1.4
G1 Z1
G1 E.8 F1800
M204 S5000
G1 F2228
G1 X109.566 Y116.577 E.00239
G1 X110.155 Y116.673 E.01835
G1 X110.71 Y116.894 E.01835
G1 X111.204 Y117.229 E.01835
G1 X111.615 Y117.663 E.01835
G1 X111.923 Y118.174 E.01835
G1 X112.113 Y118.74 E.01835
G1 X112.178 Y119.334 E.01835
G1 X112.113 Y119.927 E.01835
G1 X111.923 Y120.493 E.01835
G1 X111.615 Y121.005 E.01835
G1 X111.272 Y121.366 E.0153
G1 X111.204 Y121.438 E.00305
G1 X110.71 Y121.773 E.01835
G1 X110.155 Y121.994 E.01835
G1 X109.566 Y122.091 E.01835
G1 X108.97 Y122.059 E.01835
G1 X108.394 Y121.899 E.01835
G1 X107.867 Y121.619 E.01835
G1 X107.791 Y121.555 E.00305
G1 X107.412 Y121.233 E.0153
G1 X107.051 Y120.757 E.01835
G1 X106.8 Y120.215 E.01835
G1 X106.671 Y119.632 E.01835
G1 X106.671 Y119.035 E.01835
G1 X106.8 Y118.452 E.01835
G1 X107.051 Y117.91 E.01835
G1 X107.412 Y117.435 E.01835
G1 X107.867 Y117.048 E.01835
G1 X108.394 Y116.769 E.01835
G1 X108.97 Y116.609 E.01835
G1 X109.429 Y116.584 E.01412
M204 S10000
; WIPE_START
G1 F24000
G1 X109.566 Y116.577 E-.05231
G1 X110.155 Y116.673 E-.22689
G1 X110.71 Y116.894 E-.22689
G1 X111.204 Y117.229 E-.22689
G1 X111.253 Y117.281 E-.02701
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I-1.216 J.048 P1  F30000
G1 X111.414 Y121.35 Z1.4
G1 Z1
G1 E.8 F1800
M204 S5000
G1 F2228
G1 X110.994 Y121.694 E.01669
G1 X110.503 Y121.957 E.0171
G1 X109.97 Y122.118 E.0171
G1 X109.417 Y122.173 E.0171
G1 X108.863 Y122.118 E.0171
G1 X108.33 Y121.957 E.0171
G1 X107.839 Y121.694 E.0171
G1 X107.409 Y121.341 E.0171
G1 X107.056 Y120.911 E.0171
G1 X106.794 Y120.42 E.0171
G1 X106.632 Y119.888 E.0171
G1 X106.578 Y119.334 E.0171
G1 X106.632 Y118.78 E.0171
G1 X106.794 Y118.247 E.0171
G1 X107.056 Y117.757 E.0171
G1 X107.409 Y117.326 E.0171
G1 X107.839 Y116.973 E.0171
G1 X108.33 Y116.711 E.0171
G1 X108.863 Y116.549 E.0171
G1 X109.417 Y116.495 E.0171
G1 X109.909 Y116.543 E.01519
G1 X110.503 Y116.711 E.01898
G1 X110.994 Y116.973 E.0171
G1 X111.424 Y117.326 E.0171
G1 X111.777 Y117.757 E.0171
G1 X112.039 Y118.247 E.0171
G1 X112.201 Y118.78 E.0171
G1 X112.256 Y119.334 E.0171
G1 X112.201 Y119.888 E.0171
G1 X112.039 Y120.42 E.0171
G1 X111.777 Y120.911 E.0171
G1 X111.454 Y121.305 E.01567
M204 S10000
; WIPE_START
G1 F24000
G1 X110.994 Y121.694 E-.22891
G1 X110.503 Y121.957 E-.21148
G1 X109.97 Y122.118 E-.21149
G1 X109.687 Y122.146 E-.10812
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I1.217 J-.024 P1  F30000
G1 X109.194 Y96.804 Z1.4
G1 Z1
G1 E.8 F1800
M204 S5000
G1 F2228
G1 X109.272 Y96.8 E.00239
G1 X109.861 Y96.897 E.01835
G1 X110.416 Y97.118 E.01835
G1 X110.91 Y97.453 E.01835
G1 X111.321 Y97.886 E.01835
G1 X111.628 Y98.398 E.01835
G1 X111.819 Y98.964 E.01835
G1 X111.884 Y99.557 E.01835
G1 X111.819 Y100.151 E.01835
G1 X111.628 Y100.717 E.01835
G1 X111.321 Y101.228 E.01835
G1 X110.978 Y101.59 E.0153
G1 X110.91 Y101.662 E.00305
G1 X110.416 Y101.997 E.01835
G1 X109.861 Y102.218 E.01835
G1 X109.272 Y102.315 E.01835
G1 X108.676 Y102.282 E.01835
G1 X108.1 Y102.122 E.01835
G1 X107.573 Y101.843 E.01835
G1 X107.497 Y101.779 E.00305
G1 X107.118 Y101.456 E.0153
G1 X106.756 Y100.981 E.01835
G1 X106.506 Y100.439 E.01835
G1 X106.377 Y99.856 E.01835
G1 X106.377 Y99.259 E.01835
G1 X106.506 Y98.676 E.01835
G1 X106.756 Y98.134 E.01835
G1 X107.118 Y97.658 E.01835
G1 X107.573 Y97.272 E.01835
G1 X108.1 Y96.992 E.01835
G1 X108.676 Y96.832 E.01835
G1 X109.134 Y96.808 E.01412
M204 S10000
; WIPE_START
G1 F24000
G1 X109.272 Y96.8 E-.05231
G1 X109.861 Y96.897 E-.22689
G1 X110.416 Y97.118 E-.22689
G1 X110.91 Y97.453 E-.22689
G1 X110.959 Y97.504 E-.02701
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I-1.216 J.048 P1  F30000
G1 X111.12 Y101.573 Z1.4
G1 Z1
G1 E.8 F1800
M204 S5000
G1 F2228
G1 X110.7 Y101.918 E.01669
G1 X110.209 Y102.18 E.0171
G1 X109.676 Y102.342 E.0171
G1 X109.122 Y102.396 E.0171
G1 X108.569 Y102.342 E.0171
G1 X108.036 Y102.18 E.0171
G1 X107.545 Y101.918 E.0171
G1 X107.115 Y101.565 E.0171
G1 X106.762 Y101.135 E.0171
G1 X106.5 Y100.644 E.0171
G1 X106.338 Y100.111 E.0171
G1 X106.283 Y99.557 E.0171
G1 X106.338 Y99.003 E.0171
G1 X106.5 Y98.471 E.0171
G1 X106.762 Y97.98 E.0171
G1 X107.115 Y97.55 E.0171
G1 X107.545 Y97.197 E.0171
G1 X108.036 Y96.934 E.0171
G1 X108.569 Y96.773 E.0171
G1 X109.122 Y96.718 E.0171
G1 X109.614 Y96.767 E.01519
G1 X110.209 Y96.934 E.01898
G1 X110.7 Y97.197 E.0171
G1 X111.13 Y97.55 E.0171
G1 X111.483 Y97.98 E.0171
G1 X111.745 Y98.471 E.0171
G1 X111.907 Y99.003 E.0171
G1 X111.961 Y99.557 E.0171
G1 X111.907 Y100.111 E.0171
G1 X111.745 Y100.644 E.0171
G1 X111.483 Y101.135 E.0171
G1 X111.16 Y101.529 E.01567
M204 S10000
; WIPE_START
G1 F24000
G1 X110.7 Y101.918 E-.22891
G1 X110.209 Y102.18 E-.21148
G1 X109.676 Y102.342 E-.21149
G1 X109.393 Y102.37 E-.10812
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I1.216 J-.042 P1  F30000
G1 X108.412 Y73.989 Z1.4
G1 Z1
G1 E.8 F1800
M204 S5000
G1 F2228
G1 X108.49 Y73.985 E.00239
G1 X109.079 Y74.081 E.01835
G1 X109.634 Y74.302 E.01835
G1 X110.128 Y74.637 E.01835
G1 X110.538 Y75.071 E.01835
G1 X110.846 Y75.582 E.01835
G1 X111.037 Y76.148 E.01835
G1 X111.102 Y76.742 E.01835
G1 X111.037 Y77.335 E.01835
G1 X110.846 Y77.901 E.01835
G1 X110.538 Y78.413 E.01835
G1 X110.196 Y78.774 E.0153
G1 X110.128 Y78.846 E.00305
G1 X109.634 Y79.181 E.01835
G1 X109.079 Y79.402 E.01835
G1 X108.49 Y79.499 E.01835
G1 X107.894 Y79.467 E.01835
G1 X107.318 Y79.307 E.01835
G1 X106.791 Y79.027 E.01835
G1 X106.715 Y78.963 E.00305
G1 X106.336 Y78.641 E.0153
G1 X105.974 Y78.165 E.01835
G1 X105.724 Y77.623 E.01835
G1 X105.595 Y77.04 E.01835
G1 X105.595 Y76.443 E.01835
G1 X105.724 Y75.86 E.01835
G1 X105.974 Y75.318 E.01835
G1 X106.336 Y74.843 E.01835
G1 X106.791 Y74.456 E.01835
G1 X107.318 Y74.177 E.01835
G1 X107.894 Y74.017 E.01835
G1 X108.352 Y73.992 E.01412
M204 S10000
; WIPE_START
G1 F24000
G1 X108.49 Y73.985 E-.05231
G1 X109.079 Y74.081 E-.22689
G1 X109.634 Y74.302 E-.22689
G1 X110.128 Y74.637 E-.22689
G1 X110.177 Y74.689 E-.02701
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I-1.216 J.048 P1  F30000
G1 X110.337 Y78.758 Z1.4
G1 Z1
G1 E.8 F1800
M204 S5000
G1 F2228
G1 X109.918 Y79.102 E.01669
G1 X109.427 Y79.365 E.0171
G1 X108.894 Y79.526 E.0171
G1 X108.34 Y79.581 E.0171
G1 X107.786 Y79.526 E.0171
G1 X107.254 Y79.365 E.0171
G1 X106.763 Y79.102 E.0171
G1 X106.333 Y78.749 E.0171
G1 X105.98 Y78.319 E.0171
G1 X105.717 Y77.828 E.0171
G1 X105.556 Y77.296 E.0171
G1 X105.501 Y76.742 E.0171
G1 X105.556 Y76.188 E.0171
G1 X105.717 Y75.655 E.0171
G1 X105.98 Y75.164 E.0171
G1 X106.333 Y74.734 E.0171
G1 X106.763 Y74.381 E.0171
G1 X107.254 Y74.119 E.0171
G1 X107.786 Y73.957 E.0171
G1 X108.34 Y73.903 E.0171
G1 X108.832 Y73.951 E.01519
G1 X109.427 Y74.119 E.01898
G1 X109.918 Y74.381 E.0171
G1 X110.348 Y74.734 E.0171
G1 X110.701 Y75.164 E.0171
G1 X110.963 Y75.655 E.0171
G1 X111.125 Y76.188 E.0171
G1 X111.179 Y76.742 E.0171
G1 X111.125 Y77.296 E.0171
G1 X110.963 Y77.828 E.0171
G1 X110.701 Y78.319 E.0171
G1 X110.377 Y78.713 E.01567
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 1.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X109.918 Y79.102 E-.22891
G1 X109.427 Y79.365 E-.21148
G1 X108.894 Y79.526 E-.21149
G1 X108.611 Y79.554 E-.10812
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 6/32
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
G3 Z1.4 I-.527 J1.097 P1  F30000
G1 X131.224 Y90.425 Z1.4
G1 Z1.2
G1 E.8 F1800
M204 S5000
G1 F2228
G1 X131.221 Y90.428 E.00012
G1 X131.133 Y90.521 E.00394
G1 X130.639 Y90.856 E.01835
G1 X130.084 Y91.077 E.01835
G1 X129.495 Y91.174 E.01835
G1 X128.898 Y91.142 E.01835
G1 X128.323 Y90.982 E.01835
G1 X127.796 Y90.702 E.01835
G1 X127.341 Y90.316 E.01835
G1 X126.979 Y89.84 E.01835
G1 X126.728 Y89.298 E.01835
G1 X126.6 Y88.715 E.01835
G1 X126.6 Y88.118 E.01835
G1 X126.728 Y87.535 E.01835
G1 X126.979 Y86.993 E.01835
G1 X127.341 Y86.518 E.01835
G1 X127.796 Y86.131 E.01835
G1 X128.323 Y85.852 E.01835
G1 X128.898 Y85.692 E.01835
G1 X129.027 Y85.685 E.00394
G1 X129.495 Y85.66 E.0144
G1 X130.084 Y85.756 E.01835
G1 X130.639 Y85.977 E.01835
G1 X131.133 Y86.312 E.01835
G1 X131.543 Y86.746 E.01835
G1 X131.851 Y87.257 E.01835
G1 X132.042 Y87.823 E.01835
G1 X132.106 Y88.417 E.01835
G1 X132.042 Y89.01 E.01835
G1 X131.851 Y89.576 E.01835
G1 X131.543 Y90.088 E.01835
G1 X131.265 Y90.382 E.01244
M204 S10000
; WIPE_START
G1 F24000
G1 X131.221 Y90.428 E-.02426
G1 X131.133 Y90.521 E-.04876
G1 X130.639 Y90.856 E-.22689
G1 X130.084 Y91.077 E-.22689
G1 X129.495 Y91.174 E-.22689
G1 X129.478 Y91.173 E-.0063
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I1.216 J-.038 P1  F30000
G1 X129.305 Y85.582 Z1.6
G1 Z1.2
G1 E.8 F1800
M204 S5000
G1 F2228
G1 X129.345 Y85.578 E.00125
G1 X129.438 Y85.587 E.00288
G1 X129.899 Y85.632 E.01422
G1 X130.432 Y85.794 E.0171
M73 P59 R4
G1 X130.922 Y86.056 E.0171
G1 X131.353 Y86.409 E.0171
G1 X131.706 Y86.839 E.0171
G1 X131.968 Y87.33 E.0171
G1 X132.13 Y87.863 E.0171
G1 X132.184 Y88.417 E.0171
G1 X132.13 Y88.971 E.0171
G1 X131.968 Y89.503 E.0171
G1 X131.706 Y89.994 E.0171
G1 X131.353 Y90.424 E.0171
G1 X130.922 Y90.777 E.0171
G1 X130.432 Y91.04 E.0171
G1 X129.899 Y91.201 E.0171
G1 X129.345 Y91.256 E.0171
G1 X128.791 Y91.201 E.0171
G1 X128.259 Y91.04 E.0171
G1 X127.768 Y90.777 E.0171
G1 X127.338 Y90.424 E.0171
G1 X126.985 Y89.994 E.0171
G1 X126.722 Y89.503 E.0171
G1 X126.561 Y88.971 E.0171
G1 X126.506 Y88.417 E.0171
G1 X126.561 Y87.863 E.0171
G1 X126.722 Y87.33 E.0171
G1 X126.985 Y86.839 E.0171
G1 X127.338 Y86.409 E.0171
G1 X127.768 Y86.056 E.0171
G1 X128.259 Y85.794 E.0171
G1 X128.791 Y85.632 E.0171
G1 X129.245 Y85.588 E.01401
M204 S10000
; WIPE_START
G1 F24000
G1 X129.345 Y85.578 E-.03822
G1 X129.438 Y85.587 E-.03561
G1 X129.899 Y85.632 E-.17588
G1 X130.432 Y85.794 E-.21149
G1 X130.922 Y86.056 E-.21148
G1 X131.1 Y86.202 E-.08732
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I-1.217 J-.006 P1  F30000
G1 X130.98 Y112.405 Z1.6
G1 Z1.2
G1 E.8 F1800
M204 S5000
G1 F2228
G1 X130.978 Y112.408 E.00012
G1 X130.889 Y112.501 E.00394
G1 X130.395 Y112.836 E.01835
G1 X129.841 Y113.057 E.01835
G1 X129.251 Y113.154 E.01835
G1 X128.655 Y113.121 E.01835
G1 X128.08 Y112.961 E.01835
G1 X127.552 Y112.682 E.01835
G1 X127.097 Y112.295 E.01835
G1 X126.736 Y111.82 E.01835
G1 X126.485 Y111.278 E.01835
G1 X126.357 Y110.695 E.01835
G1 X126.357 Y110.098 E.01835
G1 X126.485 Y109.515 E.01835
G1 X126.736 Y108.973 E.01835
G1 X127.097 Y108.497 E.01835
G1 X127.552 Y108.111 E.01835
G1 X128.08 Y107.831 E.01835
G1 X128.655 Y107.672 E.01835
G1 X128.783 Y107.665 E.00394
G1 X129.251 Y107.639 E.0144
G1 X129.841 Y107.736 E.01835
G1 X130.395 Y107.957 E.01835
G1 X130.889 Y108.292 E.01835
G1 X131.3 Y108.725 E.01835
G1 X131.608 Y109.237 E.01835
G1 X131.798 Y109.803 E.01835
G1 X131.863 Y110.396 E.01835
G1 X131.798 Y110.99 E.01835
G1 X131.608 Y111.556 E.01835
G1 X131.3 Y112.067 E.01835
G1 X131.022 Y112.361 E.01244
M204 S10000
; WIPE_START
G1 F24000
G1 X130.978 Y112.408 E-.02426
G1 X130.889 Y112.501 E-.04876
G1 X130.395 Y112.836 E-.22689
G1 X129.841 Y113.057 E-.22689
G1 X129.251 Y113.154 E-.22689
G1 X129.235 Y113.153 E-.0063
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I1.216 J-.038 P1  F30000
G1 X129.061 Y107.561 Z1.6
G1 Z1.2
G1 E.8 F1800
M204 S5000
G1 F2228
G1 X129.102 Y107.557 E.00125
G1 X129.195 Y107.567 E.00288
G1 X129.656 Y107.612 E.01422
G1 X130.188 Y107.773 E.0171
G1 X130.679 Y108.036 E.0171
G1 X131.109 Y108.389 E.0171
G1 X131.462 Y108.819 E.0171
G1 X131.725 Y109.31 E.0171
G1 X131.886 Y109.843 E.0171
G1 X131.941 Y110.396 E.0171
G1 X131.886 Y110.95 E.0171
G1 X131.725 Y111.483 E.0171
G1 X131.462 Y111.974 E.0171
G1 X131.109 Y112.404 E.0171
G1 X130.679 Y112.757 E.0171
G1 X130.188 Y113.019 E.0171
G1 X129.656 Y113.181 E.0171
G1 X129.102 Y113.235 E.0171
G1 X128.548 Y113.181 E.0171
G1 X128.015 Y113.019 E.0171
G1 X127.525 Y112.757 E.0171
G1 X127.094 Y112.404 E.0171
G1 X126.741 Y111.974 E.0171
G1 X126.479 Y111.483 E.0171
G1 X126.317 Y110.95 E.0171
G1 X126.263 Y110.396 E.0171
G1 X126.317 Y109.843 E.0171
G1 X126.479 Y109.31 E.0171
G1 X126.741 Y108.819 E.0171
G1 X127.094 Y108.389 E.0171
G1 X127.525 Y108.036 E.0171
G1 X128.015 Y107.773 E.0171
G1 X128.548 Y107.612 E.0171
G1 X129.002 Y107.567 E.01401
M204 S10000
; WIPE_START
G1 F24000
G1 X129.102 Y107.557 E-.03822
G1 X129.195 Y107.567 E-.03561
G1 X129.656 Y107.612 E-.17588
G1 X130.188 Y107.773 E-.21149
G1 X130.679 Y108.036 E-.21148
G1 X130.857 Y108.182 E-.08732
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I-1.216 J.057 P1  F30000
G1 X131.878 Y130.009 Z1.6
G1 Z1.2
G1 E.8 F1800
M204 S5000
G1 F2228
G1 X131.876 Y130.011 E.00012
G1 X131.788 Y130.105 E.00394
G1 X131.293 Y130.44 E.01835
G1 X130.739 Y130.661 E.01835
G1 X130.149 Y130.757 E.01835
G1 X129.553 Y130.725 E.01835
G1 X128.978 Y130.565 E.01835
G1 X128.45 Y130.285 E.01835
G1 X127.995 Y129.899 E.01835
G1 X127.634 Y129.424 E.01835
G1 X127.383 Y128.882 E.01835
G1 X127.255 Y128.299 E.01835
G1 X127.255 Y127.701 E.01835
G1 X127.383 Y127.118 E.01835
G1 X127.634 Y126.576 E.01835
G1 X127.995 Y126.101 E.01835
G1 X128.45 Y125.715 E.01835
G1 X128.978 Y125.435 E.01835
G1 X129.553 Y125.275 E.01835
G1 X129.681 Y125.268 E.00394
G1 X130.149 Y125.243 E.0144
G1 X130.739 Y125.339 E.01835
G1 X131.293 Y125.56 E.01835
G1 X131.788 Y125.895 E.01835
G1 X132.198 Y126.329 E.01835
G1 X132.506 Y126.841 E.01835
G1 X132.697 Y127.406 E.01835
G1 X132.761 Y128 E.01835
G1 X132.697 Y128.594 E.01835
G1 X132.506 Y129.159 E.01835
G1 X132.198 Y129.671 E.01835
G1 X131.92 Y129.965 E.01244
M204 S10000
; WIPE_START
G1 F24000
G1 X131.876 Y130.011 E-.02426
G1 X131.788 Y130.105 E-.04876
G1 X131.293 Y130.44 E-.22689
G1 X130.739 Y130.661 E-.22689
G1 X130.149 Y130.757 E-.22689
G1 X130.133 Y130.756 E-.0063
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I1.216 J-.038 P1  F30000
G1 X129.96 Y125.165 Z1.6
G1 Z1.2
G1 E.8 F1800
M204 S5000
G1 F2228
G1 X130 Y125.161 E.00125
G1 X130.093 Y125.17 E.00288
G1 X130.554 Y125.216 E.01422
G1 X131.086 Y125.377 E.0171
G1 X131.577 Y125.639 E.0171
G1 X132.007 Y125.993 E.0171
G1 X132.361 Y126.423 E.0171
G1 X132.623 Y126.914 E.0171
G1 X132.784 Y127.446 E.0171
G1 X132.839 Y128 E.0171
G1 X132.784 Y128.554 E.0171
G1 X132.623 Y129.086 E.0171
G1 X132.361 Y129.577 E.0171
G1 X132.007 Y130.007 E.0171
G1 X131.577 Y130.361 E.0171
G1 X131.086 Y130.623 E.0171
G1 X130.554 Y130.784 E.0171
G1 X130 Y130.839 E.0171
G1 X129.446 Y130.784 E.0171
G1 X128.914 Y130.623 E.0171
G1 X128.423 Y130.361 E.0171
G1 X127.993 Y130.007 E.0171
G1 X127.639 Y129.577 E.0171
G1 X127.377 Y129.086 E.0171
G1 X127.216 Y128.554 E.0171
G1 X127.161 Y128 E.0171
G1 X127.216 Y127.446 E.0171
G1 X127.377 Y126.914 E.0171
G1 X127.639 Y126.423 E.0171
G1 X127.993 Y125.993 E.0171
G1 X128.423 Y125.639 E.0171
G1 X128.914 Y125.377 E.0171
G1 X129.446 Y125.216 E.0171
G1 X129.9 Y125.171 E.01401
M204 S10000
; WIPE_START
G1 F24000
G1 X130 Y125.161 E-.03822
G1 X130.093 Y125.17 E-.03561
G1 X130.554 Y125.216 E-.17588
G1 X131.086 Y125.377 E-.21149
G1 X131.577 Y125.639 E-.21148
G1 X131.755 Y125.785 E-.08732
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I-.53 J-1.095 P1  F30000
G1 X109.432 Y136.586 Z1.6
G1 Z1.2
G1 E.8 F1800
M204 S5000
G1 F2228
G1 X109.525 Y136.581 E.00287
G1 X110.114 Y136.678 E.01835
G1 X110.669 Y136.899 E.01835
G1 X111.163 Y137.234 E.01835
G1 X111.574 Y137.667 E.01835
G1 X111.881 Y138.179 E.01835
G1 X112.072 Y138.745 E.01835
G1 X112.137 Y139.339 E.01835
G1 X112.072 Y139.932 E.01835
G1 X111.881 Y140.498 E.01835
G1 X111.574 Y141.01 E.01835
G1 X111.243 Y141.359 E.01478
G1 X111.163 Y141.443 E.00357
G1 X110.669 Y141.778 E.01835
G1 X110.114 Y141.999 E.01835
G1 X109.525 Y142.096 E.01835
G1 X108.929 Y142.063 E.01835
G1 X108.353 Y141.904 E.01835
G1 X107.826 Y141.624 E.01835
G1 X107.371 Y141.237 E.01835
G1 X107.009 Y140.762 E.01835
G1 X106.759 Y140.22 E.01835
G1 X106.63 Y139.637 E.01835
G1 X106.63 Y139.04 E.01835
G1 X106.759 Y138.457 E.01835
G1 X107.009 Y137.915 E.01835
G1 X107.371 Y137.44 E.01835
G1 X107.826 Y137.053 E.01835
G1 X108.353 Y136.773 E.01835
G1 X108.929 Y136.614 E.01835
G1 X109.372 Y136.59 E.01364
M204 S10000
; WIPE_START
G1 F24000
G1 X109.525 Y136.581 E-.05824
G1 X110.114 Y136.678 E-.22689
G1 X110.669 Y136.899 E-.22689
G1 X111.163 Y137.234 E-.22689
G1 X111.201 Y137.274 E-.02109
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I-1.216 J.051 P1  F30000
G1 X111.373 Y141.354 Z1.6
G1 Z1.2
G1 E.8 F1800
M204 S5000
G1 F2228
G1 X110.953 Y141.699 E.01671
G1 X110.462 Y141.961 E.0171
G1 X109.929 Y142.123 E.0171
G1 X109.375 Y142.177 E.0171
G1 X108.822 Y142.123 E.0171
G1 X108.289 Y141.961 E.0171
G1 X107.798 Y141.699 E.0171
G1 X107.368 Y141.346 E.0171
G1 X107.015 Y140.916 E.0171
G1 X106.752 Y140.425 E.0171
G1 X106.591 Y139.892 E.0171
G1 X106.536 Y139.339 E.0171
G1 X106.591 Y138.785 E.0171
G1 X106.752 Y138.252 E.0171
G1 X107.015 Y137.761 E.0171
G1 X107.368 Y137.331 E.0171
G1 X107.798 Y136.978 E.0171
G1 X108.289 Y136.716 E.0171
G1 X108.822 Y136.554 E.0171
G1 X109.375 Y136.5 E.0171
G1 X109.849 Y136.546 E.01463
G1 X109.929 Y136.554 E.00247
G1 X110.462 Y136.716 E.0171
G1 X110.953 Y136.978 E.0171
G1 X111.383 Y137.331 E.0171
G1 X111.736 Y137.761 E.0171
G1 X111.998 Y138.252 E.0171
G1 X112.16 Y138.785 E.0171
G1 X112.214 Y139.339 E.0171
G1 X112.16 Y139.892 E.0171
G1 X111.998 Y140.425 E.0171
G1 X111.736 Y140.916 E.0171
G1 X111.413 Y141.309 E.01565
M204 S10000
; WIPE_START
G1 F24000
G1 X110.953 Y141.699 E-.22913
G1 X110.462 Y141.961 E-.21148
G1 X109.929 Y142.123 E-.21149
G1 X109.647 Y142.151 E-.1079
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I1.217 J-.008 P1  F30000
G1 X109.473 Y116.582 Z1.6
G1 Z1.2
G1 E.8 F1800
M204 S5000
G1 F2228
G1 X109.566 Y116.577 E.00287
G1 X110.155 Y116.673 E.01835
G1 X110.71 Y116.894 E.01835
G1 X111.204 Y117.229 E.01835
G1 X111.615 Y117.663 E.01835
G1 X111.923 Y118.174 E.01835
G1 X112.113 Y118.74 E.01835
G1 X112.178 Y119.334 E.01835
G1 X112.113 Y119.927 E.01835
G1 X111.923 Y120.493 E.01835
G1 X111.615 Y121.005 E.01835
G1 X111.284 Y121.354 E.01478
G1 X111.204 Y121.438 E.00357
G1 X110.71 Y121.773 E.01835
G1 X110.155 Y121.994 E.01835
G1 X109.566 Y122.091 E.01835
G1 X108.97 Y122.059 E.01835
G1 X108.394 Y121.899 E.01835
G1 X107.867 Y121.619 E.01835
G1 X107.412 Y121.233 E.01835
G1 X107.051 Y120.757 E.01835
G1 X106.8 Y120.215 E.01835
G1 X106.671 Y119.632 E.01835
G1 X106.671 Y119.035 E.01835
G1 X106.8 Y118.452 E.01835
G1 X107.051 Y117.91 E.01835
G1 X107.412 Y117.435 E.01835
G1 X107.867 Y117.048 E.01835
G1 X108.394 Y116.769 E.01835
G1 X108.97 Y116.609 E.01835
G1 X109.413 Y116.585 E.01364
M204 S10000
; WIPE_START
G1 F24000
G1 X109.566 Y116.577 E-.05824
G1 X110.155 Y116.673 E-.22689
G1 X110.71 Y116.894 E-.22689
G1 X111.204 Y117.229 E-.22689
G1 X111.242 Y117.27 E-.02109
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I-1.216 J.051 P1  F30000
G1 X111.414 Y121.349 Z1.6
G1 Z1.2
G1 E.8 F1800
M204 S5000
G1 F2228
G1 X110.994 Y121.694 E.01671
G1 X110.503 Y121.957 E.0171
G1 X109.97 Y122.118 E.0171
G1 X109.417 Y122.173 E.0171
G1 X108.863 Y122.118 E.0171
G1 X108.33 Y121.957 E.0171
G1 X107.839 Y121.694 E.0171
G1 X107.409 Y121.341 E.0171
G1 X107.056 Y120.911 E.0171
G1 X106.794 Y120.42 E.0171
G1 X106.632 Y119.888 E.0171
G1 X106.578 Y119.334 E.0171
G1 X106.632 Y118.78 E.0171
G1 X106.794 Y118.247 E.0171
G1 X107.056 Y117.757 E.0171
G1 X107.409 Y117.326 E.0171
G1 X107.839 Y116.973 E.0171
G1 X108.33 Y116.711 E.0171
G1 X108.863 Y116.549 E.0171
G1 X109.417 Y116.495 E.0171
G1 X109.89 Y116.542 E.01463
G1 X109.97 Y116.549 E.00247
G1 X110.503 Y116.711 E.0171
G1 X110.994 Y116.973 E.0171
G1 X111.424 Y117.326 E.0171
G1 X111.777 Y117.757 E.0171
G1 X112.039 Y118.247 E.0171
G1 X112.201 Y118.78 E.0171
G1 X112.256 Y119.334 E.0171
G1 X112.201 Y119.888 E.0171
G1 X112.039 Y120.42 E.0171
G1 X111.777 Y120.911 E.0171
G1 X111.454 Y121.305 E.01565
M204 S10000
; WIPE_START
G1 F24000
G1 X110.994 Y121.694 E-.22913
G1 X110.503 Y121.957 E-.21148
G1 X109.97 Y122.118 E-.21149
G1 X109.688 Y122.146 E-.1079
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I1.217 J-.024 P1  F30000
G1 X109.179 Y96.805 Z1.6
G1 Z1.2
G1 E.8 F1800
M204 S5000
G1 F2228
G1 X109.272 Y96.8 E.00287
G1 X109.861 Y96.897 E.01835
G1 X110.416 Y97.118 E.01835
G1 X110.91 Y97.453 E.01835
G1 X111.321 Y97.886 E.01835
G1 X111.628 Y98.398 E.01835
G1 X111.819 Y98.964 E.01835
G1 X111.884 Y99.557 E.01835
G1 X111.819 Y100.151 E.01835
G1 X111.628 Y100.717 E.01835
G1 X111.321 Y101.228 E.01835
G1 X110.99 Y101.578 E.01478
G1 X110.91 Y101.662 E.00357
G1 X110.416 Y101.997 E.01835
G1 X109.861 Y102.218 E.01835
G1 X109.272 Y102.315 E.01835
G1 X108.676 Y102.282 E.01835
G1 X108.1 Y102.122 E.01835
G1 X107.573 Y101.843 E.01835
G1 X107.118 Y101.456 E.01835
G1 X106.756 Y100.981 E.01835
G1 X106.506 Y100.439 E.01835
G1 X106.377 Y99.856 E.01835
G1 X106.377 Y99.259 E.01835
G1 X106.506 Y98.676 E.01835
G1 X106.756 Y98.134 E.01835
G1 X107.118 Y97.658 E.01835
G1 X107.573 Y97.272 E.01835
G1 X108.1 Y96.992 E.01835
G1 X108.676 Y96.832 E.01835
G1 X109.119 Y96.808 E.01364
M204 S10000
; WIPE_START
G1 F24000
G1 X109.272 Y96.8 E-.05824
G1 X109.861 Y96.897 E-.22689
G1 X110.416 Y97.118 E-.22689
G1 X110.91 Y97.453 E-.22689
G1 X110.948 Y97.493 E-.02109
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I-1.216 J.051 P1  F30000
G1 X111.12 Y101.573 Z1.6
G1 Z1.2
M73 P60 R4
G1 E.8 F1800
M204 S5000
G1 F2228
G1 X110.7 Y101.918 E.01671
G1 X110.209 Y102.18 E.0171
G1 X109.676 Y102.342 E.0171
G1 X109.122 Y102.396 E.0171
G1 X108.569 Y102.342 E.0171
G1 X108.036 Y102.18 E.0171
G1 X107.545 Y101.918 E.0171
G1 X107.115 Y101.565 E.0171
G1 X106.762 Y101.135 E.0171
G1 X106.5 Y100.644 E.0171
G1 X106.338 Y100.111 E.0171
G1 X106.283 Y99.557 E.0171
G1 X106.338 Y99.003 E.0171
G1 X106.5 Y98.471 E.0171
G1 X106.762 Y97.98 E.0171
G1 X107.115 Y97.55 E.0171
G1 X107.545 Y97.197 E.0171
G1 X108.036 Y96.934 E.0171
G1 X108.569 Y96.773 E.0171
G1 X109.122 Y96.718 E.0171
G1 X109.596 Y96.765 E.01463
G1 X109.676 Y96.773 E.00247
G1 X110.209 Y96.934 E.0171
G1 X110.7 Y97.197 E.0171
G1 X111.13 Y97.55 E.0171
G1 X111.483 Y97.98 E.0171
G1 X111.745 Y98.471 E.0171
G1 X111.907 Y99.003 E.0171
G1 X111.961 Y99.557 E.0171
G1 X111.907 Y100.111 E.0171
G1 X111.745 Y100.644 E.0171
G1 X111.483 Y101.135 E.0171
G1 X111.16 Y101.528 E.01565
M204 S10000
; WIPE_START
G1 F24000
G1 X110.7 Y101.918 E-.22913
G1 X110.209 Y102.18 E-.21148
G1 X109.676 Y102.342 E-.21149
G1 X109.394 Y102.37 E-.1079
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I1.216 J-.043 P1  F30000
G1 X108.397 Y73.99 Z1.6
G1 Z1.2
G1 E.8 F1800
M204 S5000
G1 F2228
G1 X108.49 Y73.985 E.00287
G1 X109.079 Y74.081 E.01835
G1 X109.634 Y74.302 E.01835
G1 X110.128 Y74.637 E.01835
G1 X110.538 Y75.071 E.01835
G1 X110.846 Y75.582 E.01835
G1 X111.037 Y76.148 E.01835
G1 X111.102 Y76.742 E.01835
G1 X111.037 Y77.335 E.01835
G1 X110.846 Y77.901 E.01835
G1 X110.538 Y78.413 E.01835
G1 X110.208 Y78.762 E.01478
G1 X110.128 Y78.846 E.00357
G1 X109.634 Y79.181 E.01835
G1 X109.079 Y79.402 E.01835
G1 X108.49 Y79.499 E.01835
G1 X107.894 Y79.467 E.01835
G1 X107.318 Y79.307 E.01835
G1 X106.791 Y79.027 E.01835
G1 X106.336 Y78.641 E.01835
G1 X105.974 Y78.165 E.01835
G1 X105.724 Y77.623 E.01835
G1 X105.595 Y77.04 E.01835
G1 X105.595 Y76.443 E.01835
G1 X105.724 Y75.86 E.01835
G1 X105.974 Y75.318 E.01835
G1 X106.336 Y74.843 E.01835
G1 X106.791 Y74.456 E.01835
G1 X107.318 Y74.177 E.01835
G1 X107.894 Y74.017 E.01835
G1 X108.337 Y73.993 E.01364
M204 S10000
; WIPE_START
G1 F24000
G1 X108.49 Y73.985 E-.05824
G1 X109.079 Y74.081 E-.22689
G1 X109.634 Y74.302 E-.22689
G1 X110.128 Y74.637 E-.22689
G1 X110.166 Y74.678 E-.02109
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I-1.216 J.051 P1  F30000
G1 X110.338 Y78.757 Z1.6
G1 Z1.2
G1 E.8 F1800
M204 S5000
G1 F2228
G1 X109.918 Y79.102 E.01671
G1 X109.427 Y79.365 E.0171
G1 X108.894 Y79.526 E.0171
G1 X108.34 Y79.581 E.0171
G1 X107.786 Y79.526 E.0171
G1 X107.254 Y79.365 E.0171
G1 X106.763 Y79.102 E.0171
G1 X106.333 Y78.749 E.0171
G1 X105.98 Y78.319 E.0171
G1 X105.717 Y77.828 E.0171
G1 X105.556 Y77.296 E.0171
G1 X105.501 Y76.742 E.0171
G1 X105.556 Y76.188 E.0171
G1 X105.717 Y75.655 E.0171
G1 X105.98 Y75.164 E.0171
G1 X106.333 Y74.734 E.0171
G1 X106.763 Y74.381 E.0171
G1 X107.254 Y74.119 E.0171
G1 X107.786 Y73.957 E.0171
G1 X108.34 Y73.903 E.0171
G1 X108.814 Y73.949 E.01463
G1 X108.894 Y73.957 E.00247
G1 X109.427 Y74.119 E.0171
G1 X109.918 Y74.381 E.0171
G1 X110.348 Y74.734 E.0171
G1 X110.701 Y75.164 E.0171
G1 X110.963 Y75.655 E.0171
G1 X111.125 Y76.188 E.0171
G1 X111.179 Y76.742 E.0171
G1 X111.125 Y77.296 E.0171
G1 X110.963 Y77.828 E.0171
G1 X110.701 Y78.319 E.0171
G1 X110.378 Y78.713 E.01565
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 1.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X109.918 Y79.102 E-.22913
G1 X109.427 Y79.365 E-.21148
G1 X108.894 Y79.526 E-.21149
G1 X108.612 Y79.554 E-.1079
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 7/32
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
G3 Z1.6 I-.527 J1.097 P1  F30000
G1 X131.227 Y90.421 Z1.6
G1 Z1.4
G1 E.8 F1800
M204 S5000
G1 F2228
G1 X131.133 Y90.521 E.00423
G1 X130.639 Y90.856 E.01835
G1 X130.084 Y91.077 E.01835
G1 X129.495 Y91.174 E.01835
G1 X128.898 Y91.142 E.01835
G1 X128.323 Y90.982 E.01835
G1 X127.796 Y90.702 E.01835
G1 X127.683 Y90.607 E.00453
G1 X127.341 Y90.316 E.01381
G1 X126.979 Y89.84 E.01835
G1 X126.728 Y89.298 E.01835
G1 X126.6 Y88.715 E.01835
G1 X126.6 Y88.118 E.01835
G1 X126.728 Y87.535 E.01835
G1 X126.979 Y86.993 E.01835
G1 X127.341 Y86.518 E.01835
G1 X127.796 Y86.131 E.01835
G1 X128.323 Y85.852 E.01835
G1 X128.898 Y85.692 E.01835
G1 X129.046 Y85.684 E.00453
G1 X129.495 Y85.66 E.01381
G1 X130.084 Y85.756 E.01835
G1 X130.639 Y85.977 E.01835
G1 X131.133 Y86.312 E.01835
G1 X131.543 Y86.746 E.01835
G1 X131.851 Y87.257 E.01835
G1 X132.042 Y87.823 E.01835
G1 X132.106 Y88.417 E.01835
G1 X132.042 Y89.01 E.01835
G1 X131.851 Y89.576 E.01835
G1 X131.543 Y90.088 E.01835
G1 X131.269 Y90.378 E.01227
M204 S10000
; WIPE_START
G1 F24000
G1 X131.133 Y90.521 E-.07511
G1 X130.639 Y90.856 E-.22689
G1 X130.084 Y91.077 E-.22689
G1 X129.495 Y91.174 E-.22689
G1 X129.484 Y91.173 E-.00421
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I1.216 J-.039 P1  F30000
G1 X129.306 Y85.582 Z1.8
G1 Z1.4
G1 E.8 F1800
M204 S5000
G1 F2228
G1 X129.345 Y85.578 E.0012
G1 X129.459 Y85.589 E.00352
G1 X129.899 Y85.632 E.01358
G1 X130.432 Y85.794 E.0171
G1 X130.922 Y86.056 E.0171
G1 X131.353 Y86.409 E.0171
G1 X131.706 Y86.839 E.0171
G1 X131.968 Y87.33 E.0171
G1 X132.13 Y87.863 E.0171
G1 X132.184 Y88.417 E.0171
G1 X132.13 Y88.971 E.0171
G1 X131.968 Y89.503 E.0171
G1 X131.706 Y89.994 E.0171
G1 X131.353 Y90.424 E.0171
G1 X130.922 Y90.777 E.0171
G1 X130.432 Y91.04 E.0171
G1 X129.899 Y91.201 E.0171
G1 X129.345 Y91.256 E.0171
G1 X128.791 Y91.201 E.0171
G1 X128.259 Y91.04 E.0171
G1 X127.768 Y90.777 E.0171
G1 X127.338 Y90.424 E.0171
G1 X126.985 Y89.994 E.0171
G1 X126.722 Y89.503 E.0171
G1 X126.561 Y88.971 E.0171
G1 X126.506 Y88.417 E.0171
G1 X126.561 Y87.863 E.0171
G1 X126.722 Y87.33 E.0171
G1 X126.985 Y86.839 E.0171
G1 X127.338 Y86.409 E.0171
G1 X127.768 Y86.056 E.0171
G1 X128.259 Y85.794 E.0171
G1 X128.791 Y85.632 E.0171
G1 X129.247 Y85.587 E.01406
M204 S10000
; WIPE_START
G1 F24000
G1 X129.345 Y85.578 E-.03766
G1 X129.459 Y85.589 E-.04351
G1 X129.899 Y85.632 E-.16798
G1 X130.432 Y85.794 E-.21149
G1 X130.922 Y86.056 E-.21148
G1 X131.101 Y86.203 E-.08789
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-1.217 J-.005 P1  F30000
G1 X130.984 Y112.401 Z1.8
G1 Z1.4
G1 E.8 F1800
M204 S5000
G1 F2228
G1 X130.889 Y112.501 E.00423
G1 X130.395 Y112.836 E.01835
G1 X129.841 Y113.057 E.01835
G1 X129.251 Y113.154 E.01835
G1 X128.655 Y113.121 E.01835
G1 X128.08 Y112.961 E.01835
G1 X127.552 Y112.682 E.01835
G1 X127.44 Y112.586 E.00453
G1 X127.097 Y112.295 E.01381
G1 X126.736 Y111.82 E.01835
G1 X126.485 Y111.278 E.01835
G1 X126.357 Y110.695 E.01835
G1 X126.357 Y110.098 E.01835
G1 X126.485 Y109.515 E.01835
G1 X126.736 Y108.973 E.01835
G1 X127.097 Y108.497 E.01835
G1 X127.552 Y108.111 E.01835
G1 X128.08 Y107.831 E.01835
G1 X128.655 Y107.672 E.01835
G1 X128.802 Y107.664 E.00453
G1 X129.251 Y107.639 E.01381
G1 X129.841 Y107.736 E.01835
G1 X130.395 Y107.957 E.01835
G1 X130.889 Y108.292 E.01835
G1 X131.3 Y108.725 E.01835
G1 X131.608 Y109.237 E.01835
G1 X131.798 Y109.803 E.01835
G1 X131.863 Y110.396 E.01835
G1 X131.798 Y110.99 E.01835
G1 X131.608 Y111.556 E.01835
G1 X131.3 Y112.067 E.01835
G1 X131.025 Y112.357 E.01227
M204 S10000
; WIPE_START
G1 F24000
G1 X130.889 Y112.501 E-.07511
G1 X130.395 Y112.836 E-.22689
G1 X129.841 Y113.057 E-.22689
G1 X129.251 Y113.154 E-.22689
G1 X129.24 Y113.153 E-.00421
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I1.216 J-.039 P1  F30000
G1 X129.063 Y107.561 Z1.8
G1 Z1.4
G1 E.8 F1800
M204 S5000
G1 F2228
G1 X129.102 Y107.557 E.0012
G1 X129.216 Y107.569 E.00352
G1 X129.656 Y107.612 E.01358
G1 X130.188 Y107.773 E.0171
G1 X130.679 Y108.036 E.0171
G1 X131.109 Y108.389 E.0171
G1 X131.462 Y108.819 E.0171
G1 X131.725 Y109.31 E.0171
G1 X131.886 Y109.843 E.0171
G1 X131.941 Y110.396 E.0171
G1 X131.886 Y110.95 E.0171
G1 X131.725 Y111.483 E.0171
G1 X131.462 Y111.974 E.0171
G1 X131.109 Y112.404 E.0171
G1 X130.679 Y112.757 E.0171
G1 X130.188 Y113.019 E.0171
G1 X129.656 Y113.181 E.0171
G1 X129.102 Y113.235 E.0171
G1 X128.548 Y113.181 E.0171
G1 X128.015 Y113.019 E.0171
G1 X127.525 Y112.757 E.0171
G1 X127.094 Y112.404 E.0171
G1 X126.741 Y111.974 E.0171
G1 X126.479 Y111.483 E.0171
G1 X126.317 Y110.95 E.0171
G1 X126.263 Y110.396 E.0171
G1 X126.317 Y109.843 E.0171
G1 X126.479 Y109.31 E.0171
G1 X126.741 Y108.819 E.0171
G1 X127.094 Y108.389 E.0171
G1 X127.525 Y108.036 E.0171
G1 X128.015 Y107.773 E.0171
G1 X128.548 Y107.612 E.0171
G1 X129.003 Y107.567 E.01406
M204 S10000
; WIPE_START
G1 F24000
G1 X129.102 Y107.557 E-.03766
G1 X129.216 Y107.569 E-.04351
G1 X129.656 Y107.612 E-.16798
G1 X130.188 Y107.773 E-.21149
G1 X130.679 Y108.036 E-.21148
G1 X130.858 Y108.183 E-.08789
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-1.216 J.057 P1  F30000
G1 X131.882 Y130.005 Z1.8
G1 Z1.4
G1 E.8 F1800
M204 S5000
G1 F2228
G1 X131.788 Y130.105 E.00423
G1 X131.293 Y130.44 E.01835
G1 X130.739 Y130.661 E.01835
G1 X130.149 Y130.757 E.01835
G1 X129.553 Y130.725 E.01835
G1 X128.978 Y130.565 E.01835
G1 X128.45 Y130.285 E.01835
G1 X128.338 Y130.19 E.00453
G1 X127.995 Y129.899 E.01381
G1 X127.634 Y129.424 E.01835
G1 X127.383 Y128.882 E.01835
G1 X127.255 Y128.299 E.01835
G1 X127.255 Y127.701 E.01835
G1 X127.383 Y127.118 E.01835
G1 X127.634 Y126.576 E.01835
G1 X127.995 Y126.101 E.01835
G1 X128.45 Y125.715 E.01835
G1 X128.978 Y125.435 E.01835
G1 X129.553 Y125.275 E.01835
G1 X129.701 Y125.267 E.00453
G1 X130.149 Y125.243 E.01381
G1 X130.739 Y125.339 E.01835
G1 X131.293 Y125.56 E.01835
G1 X131.788 Y125.895 E.01835
G1 X132.198 Y126.329 E.01835
G1 X132.506 Y126.841 E.01835
G1 X132.697 Y127.406 E.01835
G1 X132.761 Y128 E.01835
G1 X132.697 Y128.594 E.01835
G1 X132.506 Y129.159 E.01835
G1 X132.198 Y129.671 E.01835
G1 X131.924 Y129.961 E.01227
M204 S10000
; WIPE_START
G1 F24000
G1 X131.788 Y130.105 E-.07511
G1 X131.293 Y130.44 E-.22689
G1 X130.739 Y130.661 E-.22689
G1 X130.149 Y130.757 E-.22689
G1 X130.138 Y130.757 E-.00421
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I1.216 J-.039 P1  F30000
G1 X129.961 Y125.165 Z1.8
G1 Z1.4
G1 E.8 F1800
M204 S5000
G1 F2228
G1 X130 Y125.161 E.0012
G1 X130.114 Y125.172 E.00352
G1 X130.554 Y125.216 E.01358
G1 X131.086 Y125.377 E.0171
G1 X131.577 Y125.639 E.0171
G1 X132.007 Y125.993 E.0171
G1 X132.361 Y126.423 E.0171
G1 X132.623 Y126.914 E.0171
G1 X132.784 Y127.446 E.0171
G1 X132.839 Y128 E.0171
G1 X132.784 Y128.554 E.0171
G1 X132.623 Y129.086 E.0171
G1 X132.361 Y129.577 E.0171
G1 X132.007 Y130.007 E.0171
G1 X131.577 Y130.361 E.0171
G1 X131.086 Y130.623 E.0171
G1 X130.554 Y130.784 E.0171
G1 X130 Y130.839 E.0171
G1 X129.446 Y130.784 E.0171
G1 X128.914 Y130.623 E.0171
G1 X128.423 Y130.361 E.0171
G1 X127.993 Y130.007 E.0171
G1 X127.639 Y129.577 E.0171
G1 X127.377 Y129.086 E.0171
G1 X127.216 Y128.554 E.0171
G1 X127.161 Y128 E.0171
G1 X127.216 Y127.446 E.0171
G1 X127.377 Y126.914 E.0171
G1 X127.639 Y126.423 E.0171
G1 X127.993 Y125.993 E.0171
G1 X128.423 Y125.639 E.0171
G1 X128.914 Y125.377 E.0171
G1 X129.446 Y125.216 E.0171
G1 X129.901 Y125.171 E.01406
M204 S10000
; WIPE_START
G1 F24000
G1 X130 Y125.161 E-.03766
G1 X130.114 Y125.172 E-.04351
G1 X130.554 Y125.216 E-.16798
G1 X131.086 Y125.377 E-.21149
G1 X131.577 Y125.639 E-.21148
G1 X131.756 Y125.786 E-.08789
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-.53 J-1.096 P1  F30000
G1 X109.416 Y136.587 Z1.8
G1 Z1.4
G1 E.8 F1800
M204 S5000
G1 F2228
G1 X109.525 Y136.581 E.00336
G1 X110.114 Y136.678 E.01835
G1 X110.669 Y136.899 E.01835
G1 X111.163 Y137.234 E.01835
G1 X111.574 Y137.667 E.01835
G1 X111.881 Y138.179 E.01835
G1 X112.072 Y138.745 E.01835
G1 X112.137 Y139.339 E.01835
G1 X112.072 Y139.932 E.01835
G1 X111.881 Y140.498 E.01835
G1 X111.574 Y141.01 E.01835
G1 X111.163 Y141.443 E.01835
G1 X110.669 Y141.778 E.01835
G1 X110.114 Y141.999 E.01835
G1 X109.525 Y142.096 E.01835
G1 X108.929 Y142.063 E.01835
G1 X108.353 Y141.904 E.01835
G1 X107.826 Y141.624 E.01835
G1 X107.371 Y141.237 E.01835
G1 X107.009 Y140.762 E.01835
G1 X106.759 Y140.22 E.01835
G1 X106.63 Y139.637 E.01835
G1 X106.63 Y139.04 E.01835
G1 X106.759 Y138.457 E.01835
M73 P61 R4
G1 X107.009 Y137.915 E.01835
G1 X107.371 Y137.44 E.01835
G1 X107.826 Y137.053 E.01835
G1 X108.353 Y136.773 E.01835
G1 X108.929 Y136.614 E.01835
G1 X109.356 Y136.59 E.01314
M204 S10000
; WIPE_START
G1 F24000
G1 X109.525 Y136.581 E-.06437
G1 X110.114 Y136.678 E-.22689
G1 X110.669 Y136.899 E-.22689
G1 X111.163 Y137.234 E-.22689
G1 X111.19 Y137.263 E-.01495
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-1.216 J.055 P1  F30000
G1 X111.373 Y141.354 Z1.8
G1 Z1.4
G1 E.8 F1800
M204 S5000
G1 F2228
G1 X110.953 Y141.699 E.01673
G1 X110.462 Y141.961 E.0171
G1 X109.929 Y142.123 E.0171
G1 X109.375 Y142.177 E.0171
G1 X108.822 Y142.123 E.0171
G1 X108.289 Y141.961 E.0171
G1 X107.798 Y141.699 E.0171
G1 X107.368 Y141.346 E.0171
G1 X107.015 Y140.916 E.0171
G1 X106.752 Y140.425 E.0171
G1 X106.591 Y139.892 E.0171
G1 X106.536 Y139.339 E.0171
G1 X106.591 Y138.785 E.0171
G1 X106.752 Y138.252 E.0171
G1 X107.015 Y137.761 E.0171
G1 X107.368 Y137.331 E.0171
G1 X107.798 Y136.978 E.0171
G1 X108.289 Y136.716 E.0171
G1 X108.822 Y136.554 E.0171
G1 X109.375 Y136.5 E.0171
G1 X109.831 Y136.544 E.01406
G1 X109.929 Y136.554 E.00304
G1 X110.462 Y136.716 E.0171
G1 X110.953 Y136.978 E.0171
G1 X111.383 Y137.331 E.0171
G1 X111.736 Y137.761 E.0171
G1 X111.998 Y138.252 E.0171
G1 X112.16 Y138.785 E.0171
G1 X112.214 Y139.339 E.0171
G1 X112.16 Y139.892 E.0171
G1 X111.998 Y140.425 E.0171
G1 X111.736 Y140.916 E.0171
G1 X111.413 Y141.309 E.01563
M204 S10000
; WIPE_START
G1 F24000
G1 X110.953 Y141.699 E-.22935
G1 X110.462 Y141.961 E-.21149
G1 X109.929 Y142.123 E-.21148
G1 X109.647 Y142.151 E-.10768
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I1.217 J-.009 P1  F30000
G1 X109.457 Y116.583 Z1.8
G1 Z1.4
G1 E.8 F1800
M204 S5000
G1 F2228
G1 X109.566 Y116.577 E.00336
G1 X110.155 Y116.673 E.01835
G1 X110.71 Y116.894 E.01835
G1 X111.204 Y117.229 E.01835
G1 X111.615 Y117.663 E.01835
G1 X111.923 Y118.174 E.01835
G1 X112.113 Y118.74 E.01835
G1 X112.178 Y119.334 E.01835
G1 X112.113 Y119.927 E.01835
G1 X111.923 Y120.493 E.01835
G1 X111.615 Y121.005 E.01835
G1 X111.204 Y121.438 E.01835
G1 X110.71 Y121.773 E.01835
G1 X110.155 Y121.994 E.01835
G1 X109.566 Y122.091 E.01835
G1 X108.97 Y122.059 E.01835
G1 X108.394 Y121.899 E.01835
G1 X107.867 Y121.619 E.01835
G1 X107.412 Y121.233 E.01835
G1 X107.051 Y120.757 E.01835
G1 X106.8 Y120.215 E.01835
G1 X106.671 Y119.632 E.01835
G1 X106.671 Y119.035 E.01835
G1 X106.8 Y118.452 E.01835
G1 X107.051 Y117.91 E.01835
G1 X107.412 Y117.435 E.01835
G1 X107.867 Y117.048 E.01835
G1 X108.394 Y116.769 E.01835
G1 X108.97 Y116.609 E.01835
G1 X109.397 Y116.586 E.01314
M204 S10000
; WIPE_START
G1 F24000
G1 X109.566 Y116.577 E-.06437
G1 X110.155 Y116.673 E-.22689
G1 X110.71 Y116.894 E-.22689
G1 X111.204 Y117.229 E-.22689
G1 X111.231 Y117.258 E-.01495
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-1.216 J.055 P1  F30000
G1 X111.415 Y121.349 Z1.8
G1 Z1.4
G1 E.8 F1800
M204 S5000
G1 F2228
G1 X110.994 Y121.694 E.01673
G1 X110.503 Y121.957 E.0171
G1 X109.97 Y122.118 E.0171
G1 X109.417 Y122.173 E.0171
G1 X108.863 Y122.118 E.0171
G1 X108.33 Y121.957 E.0171
G1 X107.839 Y121.694 E.0171
G1 X107.409 Y121.341 E.0171
G1 X107.056 Y120.911 E.0171
G1 X106.794 Y120.42 E.0171
G1 X106.632 Y119.888 E.0171
G1 X106.578 Y119.334 E.0171
G1 X106.632 Y118.78 E.0171
G1 X106.794 Y118.247 E.0171
G1 X107.056 Y117.757 E.0171
G1 X107.409 Y117.326 E.0171
G1 X107.839 Y116.973 E.0171
G1 X108.33 Y116.711 E.0171
G1 X108.863 Y116.549 E.0171
G1 X109.417 Y116.495 E.0171
G1 X109.872 Y116.54 E.01406
G1 X109.97 Y116.549 E.00304
G1 X110.503 Y116.711 E.0171
G1 X110.994 Y116.973 E.0171
G1 X111.424 Y117.326 E.0171
G1 X111.777 Y117.757 E.0171
G1 X112.039 Y118.247 E.0171
G1 X112.201 Y118.78 E.0171
G1 X112.256 Y119.334 E.0171
G1 X112.201 Y119.888 E.0171
G1 X112.039 Y120.42 E.0171
G1 X111.777 Y120.911 E.0171
G1 X111.454 Y121.304 E.01563
M204 S10000
; WIPE_START
G1 F24000
G1 X110.994 Y121.694 E-.22935
G1 X110.503 Y121.957 E-.21149
G1 X109.97 Y122.118 E-.21148
G1 X109.688 Y122.146 E-.10768
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I1.217 J-.025 P1  F30000
G1 X109.163 Y96.806 Z1.8
G1 Z1.4
G1 E.8 F1800
M204 S5000
G1 F2228
G1 X109.272 Y96.8 E.00336
G1 X109.861 Y96.897 E.01835
G1 X110.416 Y97.118 E.01835
G1 X110.91 Y97.453 E.01835
G1 X111.321 Y97.886 E.01835
G1 X111.628 Y98.398 E.01835
G1 X111.819 Y98.964 E.01835
G1 X111.884 Y99.557 E.01835
G1 X111.819 Y100.151 E.01835
G1 X111.628 Y100.717 E.01835
G1 X111.321 Y101.228 E.01835
G1 X110.91 Y101.662 E.01835
G1 X110.416 Y101.997 E.01835
G1 X109.861 Y102.218 E.01835
G1 X109.272 Y102.315 E.01835
G1 X108.676 Y102.282 E.01835
G1 X108.1 Y102.122 E.01835
G1 X107.573 Y101.843 E.01835
G1 X107.118 Y101.456 E.01835
G1 X106.756 Y100.981 E.01835
G1 X106.506 Y100.439 E.01835
G1 X106.377 Y99.856 E.01835
G1 X106.377 Y99.259 E.01835
G1 X106.506 Y98.676 E.01835
G1 X106.756 Y98.134 E.01835
G1 X107.118 Y97.658 E.01835
G1 X107.573 Y97.272 E.01835
G1 X108.1 Y96.992 E.01835
G1 X108.676 Y96.832 E.01835
G1 X109.103 Y96.809 E.01314
M204 S10000
; WIPE_START
G1 F24000
G1 X109.272 Y96.8 E-.06437
G1 X109.861 Y96.897 E-.22689
G1 X110.416 Y97.118 E-.22689
G1 X110.91 Y97.453 E-.22689
G1 X110.937 Y97.481 E-.01495
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-1.216 J.055 P1  F30000
G1 X111.121 Y101.573 Z1.8
G1 Z1.4
G1 E.8 F1800
M204 S5000
G1 F2228
G1 X110.7 Y101.918 E.01673
G1 X110.209 Y102.18 E.0171
G1 X109.676 Y102.342 E.0171
G1 X109.122 Y102.396 E.0171
G1 X108.569 Y102.342 E.0171
G1 X108.036 Y102.18 E.0171
G1 X107.545 Y101.918 E.0171
G1 X107.115 Y101.565 E.0171
G1 X106.762 Y101.135 E.0171
G1 X106.5 Y100.644 E.0171
G1 X106.338 Y100.111 E.0171
G1 X106.283 Y99.557 E.0171
G1 X106.338 Y99.003 E.0171
G1 X106.5 Y98.471 E.0171
G1 X106.762 Y97.98 E.0171
G1 X107.115 Y97.55 E.0171
G1 X107.545 Y97.197 E.0171
G1 X108.036 Y96.934 E.0171
G1 X108.569 Y96.773 E.0171
G1 X109.122 Y96.718 E.0171
G1 X109.578 Y96.763 E.01406
G1 X109.676 Y96.773 E.00304
G1 X110.209 Y96.934 E.0171
G1 X110.7 Y97.197 E.0171
G1 X111.13 Y97.55 E.0171
G1 X111.483 Y97.98 E.0171
G1 X111.745 Y98.471 E.0171
G1 X111.907 Y99.003 E.0171
G1 X111.961 Y99.557 E.0171
G1 X111.907 Y100.111 E.0171
G1 X111.745 Y100.644 E.0171
G1 X111.483 Y101.135 E.0171
G1 X111.16 Y101.528 E.01563
M204 S10000
; WIPE_START
G1 F24000
G1 X110.7 Y101.918 E-.22935
G1 X110.209 Y102.18 E-.21149
G1 X109.676 Y102.342 E-.21148
G1 X109.394 Y102.37 E-.10768
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I1.216 J-.043 P1  F30000
G1 X108.381 Y73.99 Z1.8
G1 Z1.4
G1 E.8 F1800
M204 S5000
G1 F2228
G1 X108.49 Y73.985 E.00336
G1 X109.079 Y74.081 E.01835
G1 X109.634 Y74.302 E.01835
G1 X110.128 Y74.637 E.01835
G1 X110.538 Y75.071 E.01835
G1 X110.846 Y75.582 E.01835
G1 X111.037 Y76.148 E.01835
G1 X111.102 Y76.742 E.01835
G1 X111.037 Y77.335 E.01835
G1 X110.846 Y77.901 E.01835
G1 X110.538 Y78.413 E.01835
G1 X110.128 Y78.846 E.01835
G1 X109.634 Y79.181 E.01835
G1 X109.079 Y79.402 E.01835
G1 X108.49 Y79.499 E.01835
G1 X107.894 Y79.467 E.01835
G1 X107.318 Y79.307 E.01835
G1 X106.791 Y79.027 E.01835
G1 X106.336 Y78.641 E.01835
G1 X105.974 Y78.165 E.01835
G1 X105.724 Y77.623 E.01835
G1 X105.595 Y77.04 E.01835
G1 X105.595 Y76.443 E.01835
G1 X105.724 Y75.86 E.01835
G1 X105.974 Y75.318 E.01835
G1 X106.336 Y74.843 E.01835
G1 X106.791 Y74.456 E.01835
G1 X107.318 Y74.177 E.01835
G1 X107.894 Y74.017 E.01835
G1 X108.321 Y73.994 E.01314
M204 S10000
; WIPE_START
G1 F24000
G1 X108.49 Y73.985 E-.06437
G1 X109.079 Y74.081 E-.22689
G1 X109.634 Y74.302 E-.22689
G1 X110.128 Y74.637 E-.22689
G1 X110.155 Y74.666 E-.01495
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-1.216 J.055 P1  F30000
G1 X110.338 Y78.757 Z1.8
G1 Z1.4
G1 E.8 F1800
M204 S5000
G1 F2228
G1 X109.918 Y79.102 E.01673
G1 X109.427 Y79.365 E.0171
G1 X108.894 Y79.526 E.0171
G1 X108.34 Y79.581 E.0171
G1 X107.786 Y79.526 E.0171
G1 X107.254 Y79.365 E.0171
G1 X106.763 Y79.102 E.0171
G1 X106.333 Y78.749 E.0171
G1 X105.98 Y78.319 E.0171
G1 X105.717 Y77.828 E.0171
G1 X105.556 Y77.296 E.0171
G1 X105.501 Y76.742 E.0171
G1 X105.556 Y76.188 E.0171
G1 X105.717 Y75.655 E.0171
G1 X105.98 Y75.164 E.0171
G1 X106.333 Y74.734 E.0171
G1 X106.763 Y74.381 E.0171
G1 X107.254 Y74.119 E.0171
G1 X107.786 Y73.957 E.0171
G1 X108.34 Y73.903 E.0171
G1 X108.796 Y73.948 E.01406
G1 X108.894 Y73.957 E.00304
G1 X109.427 Y74.119 E.0171
G1 X109.918 Y74.381 E.0171
G1 X110.348 Y74.734 E.0171
G1 X110.701 Y75.164 E.0171
G1 X110.963 Y75.655 E.0171
G1 X111.125 Y76.188 E.0171
G1 X111.179 Y76.742 E.0171
G1 X111.125 Y77.296 E.0171
G1 X110.963 Y77.828 E.0171
G1 X110.701 Y78.319 E.0171
G1 X110.378 Y78.712 E.01563
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 1.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X109.918 Y79.102 E-.22935
G1 X109.427 Y79.365 E-.21149
G1 X108.894 Y79.526 E-.21148
G1 X108.612 Y79.554 E-.10768
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 8/32
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
G3 Z1.8 I-.527 J1.097 P1  F30000
G1 X131.231 Y90.417 Z1.8
G1 Z1.6
G1 E.8 F1800
M204 S5000
G1 F2214
G1 X131.133 Y90.521 E.0044
G1 X130.639 Y90.856 E.01835
G1 X130.084 Y91.077 E.01835
G1 X129.495 Y91.174 E.01835
G1 X128.898 Y91.142 E.01835
G1 X128.323 Y90.982 E.01835
G1 X127.796 Y90.702 E.01835
G1 X127.341 Y90.316 E.01835
G1 X126.979 Y89.84 E.01835
G1 X126.728 Y89.298 E.01835
G1 X126.6 Y88.715 E.01835
G1 X126.6 Y88.118 E.01835
G1 X126.728 Y87.535 E.01835
G1 X126.979 Y86.993 E.01835
G1 X127.341 Y86.518 E.01835
G1 X127.796 Y86.131 E.01835
G1 X128.323 Y85.852 E.01835
G1 X128.898 Y85.692 E.01835
G1 X129.065 Y85.683 E.00512
G1 X129.495 Y85.66 E.01322
G1 X130.084 Y85.756 E.01835
G1 X130.639 Y85.977 E.01835
G1 X131.133 Y86.312 E.01835
G1 X131.543 Y86.746 E.01835
G1 X131.851 Y87.257 E.01835
G1 X132.042 Y87.823 E.01835
G1 X132.106 Y88.417 E.01835
G1 X132.042 Y89.01 E.01835
G1 X131.851 Y89.576 E.01835
G1 X131.543 Y90.088 E.01835
G1 X131.273 Y90.374 E.0121
M204 S10000
; WIPE_START
G1 F24000
G1 X131.133 Y90.521 E-.07726
G1 X130.639 Y90.856 E-.22689
G1 X130.084 Y91.077 E-.22689
G1 X129.495 Y91.174 E-.22689
G1 X129.489 Y91.174 E-.00206
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I1.216 J-.039 P1  F30000
G1 X129.308 Y85.581 Z2
G1 Z1.6
G1 E.8 F1800
M204 S5000
G1 F2214
G1 X129.345 Y85.578 E.00115
G1 X129.48 Y85.591 E.00416
G1 X129.899 Y85.632 E.01294
G1 X130.432 Y85.794 E.0171
G1 X130.922 Y86.056 E.0171
G1 X131.353 Y86.409 E.0171
G1 X131.706 Y86.839 E.0171
G1 X131.968 Y87.33 E.0171
G1 X132.13 Y87.863 E.0171
G1 X132.184 Y88.417 E.0171
G1 X132.13 Y88.971 E.0171
G1 X131.968 Y89.503 E.0171
G1 X131.706 Y89.994 E.0171
G1 X131.353 Y90.424 E.0171
G1 X130.922 Y90.777 E.0171
G1 X130.432 Y91.04 E.0171
G1 X129.899 Y91.201 E.0171
G1 X129.345 Y91.256 E.0171
G1 X128.791 Y91.201 E.0171
G1 X128.259 Y91.04 E.0171
G1 X127.768 Y90.777 E.0171
G1 X127.338 Y90.424 E.0171
G1 X126.985 Y89.994 E.0171
G1 X126.722 Y89.503 E.0171
G1 X126.561 Y88.971 E.0171
G1 X126.506 Y88.417 E.0171
G1 X126.561 Y87.863 E.0171
G1 X126.722 Y87.33 E.0171
G1 X126.985 Y86.839 E.0171
G1 X127.338 Y86.409 E.0171
G1 X127.768 Y86.056 E.0171
G1 X128.259 Y85.794 E.0171
G1 X128.791 Y85.632 E.0171
G1 X129.248 Y85.587 E.0141
M204 S10000
; WIPE_START
G1 F24000
G1 X129.345 Y85.578 E-.03708
G1 X129.48 Y85.591 E-.05141
G1 X129.899 Y85.632 E-.16007
G1 X130.432 Y85.794 E-.21149
G1 X130.922 Y86.056 E-.21148
G1 X131.102 Y86.204 E-.08846
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-1.217 J-.005 P1  F30000
G1 X130.988 Y112.397 Z2
G1 Z1.6
G1 E.8 F1800
M204 S5000
G1 F2214
G1 X130.889 Y112.501 E.0044
G1 X130.395 Y112.836 E.01835
G1 X129.841 Y113.057 E.01835
G1 X129.251 Y113.154 E.01835
G1 X128.655 Y113.121 E.01835
G1 X128.08 Y112.961 E.01835
G1 X127.552 Y112.682 E.01835
G1 X127.097 Y112.295 E.01835
G1 X126.736 Y111.82 E.01835
M73 P62 R4
G1 X126.485 Y111.278 E.01835
G1 X126.357 Y110.695 E.01835
G1 X126.357 Y110.098 E.01835
G1 X126.485 Y109.515 E.01835
G1 X126.736 Y108.973 E.01835
G1 X127.097 Y108.497 E.01835
G1 X127.552 Y108.111 E.01835
G1 X128.08 Y107.831 E.01835
G1 X128.655 Y107.672 E.01835
G1 X128.822 Y107.662 E.00512
G1 X129.251 Y107.639 E.01322
G1 X129.841 Y107.736 E.01835
G1 X130.395 Y107.957 E.01835
G1 X130.889 Y108.292 E.01835
G1 X131.3 Y108.725 E.01835
G1 X131.608 Y109.237 E.01835
G1 X131.798 Y109.803 E.01835
G1 X131.863 Y110.396 E.01835
G1 X131.798 Y110.99 E.01835
G1 X131.608 Y111.556 E.01835
G1 X131.3 Y112.067 E.01835
G1 X131.029 Y112.353 E.0121
M204 S10000
; WIPE_START
G1 F24000
G1 X130.889 Y112.501 E-.07726
G1 X130.395 Y112.836 E-.22689
G1 X129.841 Y113.057 E-.22689
G1 X129.251 Y113.154 E-.22689
G1 X129.246 Y113.153 E-.00206
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I1.216 J-.039 P1  F30000
G1 X129.064 Y107.561 Z2
G1 Z1.6
G1 E.8 F1800
M204 S5000
G1 F2214
G1 X129.102 Y107.557 E.00115
G1 X129.236 Y107.571 E.00416
G1 X129.656 Y107.612 E.01294
G1 X130.188 Y107.773 E.0171
G1 X130.679 Y108.036 E.0171
G1 X131.109 Y108.389 E.0171
G1 X131.462 Y108.819 E.0171
G1 X131.725 Y109.31 E.0171
G1 X131.886 Y109.843 E.0171
G1 X131.941 Y110.396 E.0171
G1 X131.886 Y110.95 E.0171
G1 X131.725 Y111.483 E.0171
G1 X131.462 Y111.974 E.0171
G1 X131.109 Y112.404 E.0171
G1 X130.679 Y112.757 E.0171
G1 X130.188 Y113.019 E.0171
G1 X129.656 Y113.181 E.0171
G1 X129.102 Y113.235 E.0171
G1 X128.548 Y113.181 E.0171
G1 X128.015 Y113.019 E.0171
G1 X127.525 Y112.757 E.0171
G1 X127.094 Y112.404 E.0171
G1 X126.741 Y111.974 E.0171
G1 X126.479 Y111.483 E.0171
G1 X126.317 Y110.95 E.0171
G1 X126.263 Y110.396 E.0171
G1 X126.317 Y109.843 E.0171
G1 X126.479 Y109.31 E.0171
G1 X126.741 Y108.819 E.0171
G1 X127.094 Y108.389 E.0171
G1 X127.525 Y108.036 E.0171
G1 X128.015 Y107.773 E.0171
G1 X128.548 Y107.612 E.0171
G1 X129.005 Y107.567 E.0141
M204 S10000
; WIPE_START
G1 F24000
G1 X129.102 Y107.557 E-.03708
G1 X129.236 Y107.571 E-.05141
G1 X129.656 Y107.612 E-.16007
G1 X130.188 Y107.773 E-.21149
G1 X130.679 Y108.036 E-.21148
G1 X130.859 Y108.184 E-.08846
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-1.216 J.057 P1  F30000
G1 X131.886 Y130 Z2
G1 Z1.6
G1 E.8 F1800
M204 S5000
G1 F2214
G1 X131.788 Y130.105 E.0044
G1 X131.293 Y130.44 E.01835
G1 X130.739 Y130.661 E.01835
G1 X130.149 Y130.757 E.01835
G1 X129.553 Y130.725 E.01835
G1 X128.978 Y130.565 E.01835
G1 X128.45 Y130.285 E.01835
G1 X127.995 Y129.899 E.01835
G1 X127.634 Y129.424 E.01835
G1 X127.383 Y128.882 E.01835
G1 X127.255 Y128.299 E.01835
G1 X127.255 Y127.701 E.01835
G1 X127.383 Y127.118 E.01835
G1 X127.634 Y126.576 E.01835
G1 X127.995 Y126.101 E.01835
G1 X128.45 Y125.715 E.01835
G1 X128.978 Y125.435 E.01835
G1 X129.553 Y125.275 E.01835
G1 X129.72 Y125.266 E.00512
G1 X130.149 Y125.243 E.01322
G1 X130.739 Y125.339 E.01835
G1 X131.293 Y125.56 E.01835
G1 X131.788 Y125.895 E.01835
G1 X132.198 Y126.329 E.01835
G1 X132.506 Y126.841 E.01835
G1 X132.697 Y127.406 E.01835
G1 X132.761 Y128 E.01835
G1 X132.697 Y128.594 E.01835
G1 X132.506 Y129.159 E.01835
G1 X132.198 Y129.671 E.01835
G1 X131.927 Y129.957 E.0121
M204 S10000
; WIPE_START
G1 F24000
G1 X131.788 Y130.105 E-.07726
G1 X131.293 Y130.44 E-.22689
G1 X130.739 Y130.661 E-.22689
G1 X130.149 Y130.757 E-.22689
G1 X130.144 Y130.757 E-.00206
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I1.216 J-.039 P1  F30000
G1 X129.963 Y125.165 Z2
G1 Z1.6
G1 E.8 F1800
M204 S5000
G1 F2214
G1 X130 Y125.161 E.00115
G1 X130.135 Y125.174 E.00416
G1 X130.554 Y125.216 E.01294
G1 X131.086 Y125.377 E.0171
G1 X131.577 Y125.639 E.0171
G1 X132.007 Y125.993 E.0171
G1 X132.361 Y126.423 E.0171
G1 X132.623 Y126.914 E.0171
G1 X132.784 Y127.446 E.0171
G1 X132.839 Y128 E.0171
G1 X132.784 Y128.554 E.0171
G1 X132.623 Y129.086 E.0171
G1 X132.361 Y129.577 E.0171
G1 X132.007 Y130.007 E.0171
G1 X131.577 Y130.361 E.0171
G1 X131.086 Y130.623 E.0171
G1 X130.554 Y130.784 E.0171
G1 X130 Y130.839 E.0171
G1 X129.446 Y130.784 E.0171
G1 X128.914 Y130.623 E.0171
G1 X128.423 Y130.361 E.0171
G1 X127.993 Y130.007 E.0171
G1 X127.639 Y129.577 E.0171
G1 X127.377 Y129.086 E.0171
G1 X127.216 Y128.554 E.0171
G1 X127.161 Y128 E.0171
G1 X127.216 Y127.446 E.0171
G1 X127.377 Y126.914 E.0171
G1 X127.639 Y126.423 E.0171
G1 X127.993 Y125.993 E.0171
G1 X128.423 Y125.639 E.0171
G1 X128.914 Y125.377 E.0171
G1 X129.446 Y125.216 E.0171
G1 X129.903 Y125.171 E.0141
M204 S10000
; WIPE_START
G1 F24000
G1 X130 Y125.161 E-.03708
G1 X130.135 Y125.174 E-.05141
G1 X130.554 Y125.216 E-.16007
G1 X131.086 Y125.377 E-.21149
G1 X131.577 Y125.639 E-.21148
G1 X131.757 Y125.787 E-.08846
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-.735 J-.97 P1  F30000
G1 X111.311 Y141.287 Z2
G1 Z1.6
G1 E.8 F1800
M204 S5000
G1 F2214
G1 X111.266 Y141.334 E.00199
G1 X111.163 Y141.443 E.00461
G1 X110.669 Y141.778 E.01835
G1 X110.114 Y141.999 E.01835
G1 X109.525 Y142.096 E.01835
G1 X108.929 Y142.063 E.01835
G1 X108.353 Y141.904 E.01835
G1 X107.826 Y141.624 E.01835
G1 X107.371 Y141.237 E.01835
G1 X107.009 Y140.762 E.01835
G1 X106.759 Y140.22 E.01835
G1 X106.63 Y139.637 E.01835
G1 X106.63 Y139.04 E.01835
G1 X106.759 Y138.457 E.01835
G1 X107.009 Y137.915 E.01835
G1 X107.371 Y137.44 E.01835
G1 X107.826 Y137.053 E.01835
G1 X108.353 Y136.773 E.01835
G1 X108.929 Y136.614 E.01835
G1 X109.375 Y136.589 E.01374
G1 X109.525 Y136.581 E.00461
G1 X110.114 Y136.678 E.01835
G1 X110.669 Y136.899 E.01835
G1 X111.163 Y137.234 E.01835
G1 X111.574 Y137.667 E.01835
G1 X111.881 Y138.179 E.01835
G1 X112.072 Y138.745 E.01835
G1 X112.137 Y139.339 E.01835
G1 X112.072 Y139.932 E.01835
G1 X111.881 Y140.498 E.01835
G1 X111.574 Y141.01 E.01835
G1 X111.352 Y141.244 E.0099
M204 S10000
; WIPE_START
G1 F24000
G1 X111.266 Y141.334 E-.04739
G1 X111.163 Y141.443 E-.05703
G1 X110.669 Y141.778 E-.22689
G1 X110.114 Y141.999 E-.22689
G1 X109.59 Y142.085 E-.2018
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I1.216 J-.041 P1  F30000
G1 X109.402 Y136.502 Z2
G1 Z1.6
G1 E.8 F1800
M204 S5000
G1 F2214
G1 X109.812 Y136.543 E.01268
G1 X109.929 Y136.554 E.0036
G1 X110.462 Y136.716 E.0171
G1 X110.953 Y136.978 E.0171
G1 X111.383 Y137.331 E.0171
G1 X111.736 Y137.761 E.0171
G1 X111.998 Y138.252 E.0171
G1 X112.16 Y138.785 E.0171
G1 X112.214 Y139.339 E.0171
G1 X112.16 Y139.892 E.0171
G1 X111.998 Y140.425 E.0171
G1 X111.736 Y140.916 E.0171
G1 X111.383 Y141.346 E.0171
G1 X110.953 Y141.699 E.0171
G1 X110.462 Y141.961 E.0171
G1 X109.929 Y142.123 E.0171
G1 X109.375 Y142.177 E.0171
G1 X108.822 Y142.123 E.0171
G1 X108.289 Y141.961 E.0171
G1 X107.798 Y141.699 E.0171
G1 X107.368 Y141.346 E.0171
G1 X107.015 Y140.916 E.0171
G1 X106.752 Y140.425 E.0171
G1 X106.591 Y139.892 E.0171
G1 X106.536 Y139.339 E.0171
G1 X106.591 Y138.785 E.0171
G1 X106.752 Y138.252 E.0171
G1 X107.015 Y137.761 E.0171
G1 X107.368 Y137.331 E.0171
G1 X107.798 Y136.978 E.0171
G1 X108.289 Y136.716 E.0171
G1 X108.822 Y136.554 E.0171
G1 X109.342 Y136.503 E.01607
M204 S10000
; WIPE_START
G1 F24000
G1 X109.812 Y136.543 E-.17942
G1 X109.929 Y136.554 E-.04457
G1 X110.462 Y136.716 E-.21149
G1 X110.953 Y136.978 E-.21148
G1 X111.183 Y137.167 E-.11304
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I1.217 J.013 P1  F30000
G1 X111.352 Y121.282 Z2
G1 Z1.6
G1 E.8 F1800
M204 S5000
G1 F2214
G1 X111.307 Y121.329 E.00199
G1 X111.204 Y121.438 E.00461
G1 X110.71 Y121.773 E.01835
G1 X110.155 Y121.994 E.01835
G1 X109.566 Y122.091 E.01835
G1 X108.97 Y122.059 E.01835
G1 X108.394 Y121.899 E.01835
G1 X107.867 Y121.619 E.01835
G1 X107.412 Y121.233 E.01835
G1 X107.051 Y120.757 E.01835
G1 X106.8 Y120.215 E.01835
G1 X106.671 Y119.632 E.01835
G1 X106.671 Y119.035 E.01835
G1 X106.8 Y118.452 E.01835
G1 X107.051 Y117.91 E.01835
G1 X107.412 Y117.435 E.01835
G1 X107.867 Y117.048 E.01835
G1 X108.394 Y116.769 E.01835
G1 X108.97 Y116.609 E.01835
G1 X109.416 Y116.585 E.01374
G1 X109.566 Y116.577 E.00461
G1 X110.155 Y116.673 E.01835
G1 X110.71 Y116.894 E.01835
G1 X111.204 Y117.229 E.01835
G1 X111.615 Y117.663 E.01835
G1 X111.923 Y118.174 E.01835
G1 X112.113 Y118.74 E.01835
G1 X112.178 Y119.334 E.01835
G1 X112.113 Y119.927 E.01835
G1 X111.923 Y120.493 E.01835
G1 X111.615 Y121.005 E.01835
G1 X111.393 Y121.239 E.0099
M204 S10000
; WIPE_START
G1 F24000
G1 X111.307 Y121.329 E-.04739
G1 X111.204 Y121.438 E-.05703
G1 X110.71 Y121.773 E-.22689
G1 X110.155 Y121.994 E-.22689
G1 X109.631 Y122.08 E-.2018
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I1.216 J-.041 P1  F30000
G1 X109.443 Y116.497 Z2
G1 Z1.6
G1 E.8 F1800
M204 S5000
G1 F2214
G1 X109.854 Y116.538 E.01268
G1 X109.97 Y116.549 E.0036
G1 X110.503 Y116.711 E.0171
G1 X110.994 Y116.973 E.0171
G1 X111.424 Y117.326 E.0171
G1 X111.777 Y117.757 E.0171
G1 X112.039 Y118.247 E.0171
G1 X112.201 Y118.78 E.0171
G1 X112.256 Y119.334 E.0171
G1 X112.201 Y119.888 E.0171
G1 X112.039 Y120.42 E.0171
G1 X111.777 Y120.911 E.0171
G1 X111.424 Y121.341 E.0171
G1 X110.994 Y121.694 E.0171
G1 X110.503 Y121.957 E.0171
G1 X109.97 Y122.118 E.0171
G1 X109.417 Y122.173 E.0171
G1 X108.863 Y122.118 E.0171
G1 X108.33 Y121.957 E.0171
G1 X107.839 Y121.694 E.0171
G1 X107.409 Y121.341 E.0171
G1 X107.056 Y120.911 E.0171
G1 X106.794 Y120.42 E.0171
G1 X106.632 Y119.888 E.0171
G1 X106.578 Y119.334 E.0171
G1 X106.632 Y118.78 E.0171
G1 X106.794 Y118.247 E.0171
G1 X107.056 Y117.757 E.0171
G1 X107.409 Y117.326 E.0171
G1 X107.839 Y116.973 E.0171
G1 X108.33 Y116.711 E.0171
G1 X108.863 Y116.549 E.0171
G1 X109.383 Y116.498 E.01607
M204 S10000
; WIPE_START
G1 F24000
G1 X109.854 Y116.538 E-.17942
G1 X109.97 Y116.549 E-.04457
G1 X110.503 Y116.711 E-.21149
G1 X110.994 Y116.973 E-.21148
G1 X111.224 Y117.162 E-.11304
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I1.217 J-.013 P1  F30000
G1 X111.058 Y101.506 Z2
G1 Z1.6
G1 E.8 F1800
M204 S5000
G1 F2214
G1 X111.013 Y101.553 E.00199
G1 X110.91 Y101.662 E.00461
G1 X110.416 Y101.997 E.01835
G1 X109.861 Y102.218 E.01835
G1 X109.272 Y102.315 E.01835
G1 X108.676 Y102.282 E.01835
G1 X108.1 Y102.122 E.01835
G1 X107.573 Y101.843 E.01835
G1 X107.118 Y101.456 E.01835
G1 X106.756 Y100.981 E.01835
G1 X106.506 Y100.439 E.01835
G1 X106.377 Y99.856 E.01835
G1 X106.377 Y99.259 E.01835
G1 X106.506 Y98.676 E.01835
G1 X106.756 Y98.134 E.01835
G1 X107.118 Y97.658 E.01835
G1 X107.573 Y97.272 E.01835
G1 X108.1 Y96.992 E.01835
G1 X108.676 Y96.832 E.01835
G1 X109.122 Y96.808 E.01374
G1 X109.272 Y96.8 E.00461
G1 X109.861 Y96.897 E.01835
G1 X110.416 Y97.118 E.01835
G1 X110.91 Y97.453 E.01835
G1 X111.321 Y97.886 E.01835
G1 X111.628 Y98.398 E.01835
G1 X111.819 Y98.964 E.01835
G1 X111.884 Y99.557 E.01835
G1 X111.819 Y100.151 E.01835
G1 X111.628 Y100.717 E.01835
G1 X111.321 Y101.228 E.01835
G1 X111.099 Y101.462 E.0099
M204 S10000
; WIPE_START
G1 F24000
G1 X111.013 Y101.553 E-.04739
G1 X110.91 Y101.662 E-.05703
G1 X110.416 Y101.997 E-.22689
G1 X109.861 Y102.218 E-.22689
G1 X109.337 Y102.304 E-.2018
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I1.216 J-.041 P1  F30000
G1 X109.149 Y96.721 Z2
G1 Z1.6
G1 E.8 F1800
M204 S5000
G1 F2214
G1 X109.56 Y96.761 E.01268
G1 X109.676 Y96.773 E.0036
G1 X110.209 Y96.934 E.0171
G1 X110.7 Y97.197 E.0171
G1 X111.13 Y97.55 E.0171
G1 X111.483 Y97.98 E.0171
G1 X111.745 Y98.471 E.0171
G1 X111.907 Y99.003 E.0171
G1 X111.961 Y99.557 E.0171
G1 X111.907 Y100.111 E.0171
G1 X111.745 Y100.644 E.0171
G1 X111.483 Y101.135 E.0171
G1 X111.13 Y101.565 E.0171
G1 X110.7 Y101.918 E.0171
G1 X110.209 Y102.18 E.0171
G1 X109.676 Y102.342 E.0171
G1 X109.122 Y102.396 E.0171
G1 X108.569 Y102.342 E.0171
G1 X108.036 Y102.18 E.0171
G1 X107.545 Y101.918 E.0171
G1 X107.115 Y101.565 E.0171
G1 X106.762 Y101.135 E.0171
G1 X106.5 Y100.644 E.0171
G1 X106.338 Y100.111 E.0171
G1 X106.283 Y99.557 E.0171
G1 X106.338 Y99.003 E.0171
G1 X106.5 Y98.471 E.0171
G1 X106.762 Y97.98 E.0171
G1 X107.115 Y97.55 E.0171
G1 X107.545 Y97.197 E.0171
G1 X108.036 Y96.934 E.0171
G1 X108.569 Y96.773 E.0171
G1 X109.089 Y96.722 E.01607
M204 S10000
; WIPE_START
G1 F24000
G1 X109.56 Y96.761 E-.17942
G1 X109.676 Y96.773 E-.04457
G1 X110.209 Y96.934 E-.21149
G1 X110.7 Y97.197 E-.21148
G1 X110.93 Y97.386 E-.11304
; WIPE_END
M73 P63 R4
G1 E-.04 F1800
G17
G3 Z2 I1.216 J-.043 P1  F30000
G1 X110.276 Y78.69 Z2
G1 Z1.6
G1 E.8 F1800
M204 S5000
G1 F2214
G1 X110.231 Y78.737 E.00199
G1 X110.128 Y78.846 E.00461
G1 X109.634 Y79.181 E.01835
G1 X109.079 Y79.402 E.01835
G1 X108.49 Y79.499 E.01835
G1 X107.894 Y79.467 E.01835
G1 X107.318 Y79.307 E.01835
G1 X106.791 Y79.027 E.01835
G1 X106.336 Y78.641 E.01835
G1 X105.974 Y78.165 E.01835
G1 X105.724 Y77.623 E.01835
G1 X105.595 Y77.04 E.01835
G1 X105.595 Y76.443 E.01835
G1 X105.724 Y75.86 E.01835
G1 X105.974 Y75.318 E.01835
G1 X106.336 Y74.843 E.01835
G1 X106.791 Y74.456 E.01835
G1 X107.318 Y74.177 E.01835
G1 X107.894 Y74.017 E.01835
G1 X108.34 Y73.993 E.01374
G1 X108.49 Y73.985 E.00461
G1 X109.079 Y74.081 E.01835
G1 X109.634 Y74.302 E.01835
G1 X110.128 Y74.637 E.01835
G1 X110.538 Y75.071 E.01835
G1 X110.846 Y75.582 E.01835
G1 X111.037 Y76.148 E.01835
G1 X111.102 Y76.742 E.01835
G1 X111.037 Y77.335 E.01835
G1 X110.846 Y77.901 E.01835
G1 X110.538 Y78.413 E.01835
G1 X110.317 Y78.647 E.0099
M204 S10000
; WIPE_START
G1 F24000
G1 X110.231 Y78.737 E-.04739
G1 X110.128 Y78.846 E-.05703
G1 X109.634 Y79.181 E-.22689
G1 X109.079 Y79.402 E-.22689
G1 X108.555 Y79.488 E-.2018
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I1.216 J-.041 P1  F30000
G1 X108.367 Y73.905 Z2
G1 Z1.6
G1 E.8 F1800
M204 S5000
G1 F2214
G1 X108.777 Y73.946 E.01268
G1 X108.894 Y73.957 E.0036
G1 X109.427 Y74.119 E.0171
G1 X109.918 Y74.381 E.0171
G1 X110.348 Y74.734 E.0171
G1 X110.701 Y75.164 E.0171
G1 X110.963 Y75.655 E.0171
G1 X111.125 Y76.188 E.0171
G1 X111.179 Y76.742 E.0171
G1 X111.125 Y77.296 E.0171
G1 X110.963 Y77.828 E.0171
G1 X110.701 Y78.319 E.0171
G1 X110.348 Y78.749 E.0171
G1 X109.918 Y79.102 E.0171
G1 X109.427 Y79.365 E.0171
G1 X108.894 Y79.526 E.0171
G1 X108.34 Y79.581 E.0171
G1 X107.786 Y79.526 E.0171
G1 X107.254 Y79.365 E.0171
G1 X106.763 Y79.102 E.0171
G1 X106.333 Y78.749 E.0171
G1 X105.98 Y78.319 E.0171
G1 X105.717 Y77.828 E.0171
G1 X105.556 Y77.296 E.0171
G1 X105.501 Y76.742 E.0171
G1 X105.556 Y76.188 E.0171
G1 X105.717 Y75.655 E.0171
G1 X105.98 Y75.164 E.0171
G1 X106.333 Y74.734 E.0171
G1 X106.763 Y74.381 E.0171
G1 X107.254 Y74.119 E.0171
G1 X107.786 Y73.957 E.0171
G1 X108.307 Y73.906 E.01607
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X108.777 Y73.946 E-.17942
G1 X108.894 Y73.957 E-.04457
G1 X109.427 Y74.119 E-.21149
G1 X109.918 Y74.381 E-.21148
G1 X110.147 Y74.57 E-.11304
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 9/32
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
G3 Z2 I-.731 J.973 P1  F30000
G1 X131.235 Y90.413 Z2
G1 Z1.8
G1 E.8 F1800
M204 S5000
G1 F2215
G1 X131.133 Y90.521 E.00458
G1 X130.639 Y90.856 E.01835
G1 X130.084 Y91.077 E.01835
G1 X129.495 Y91.174 E.01835
G1 X128.898 Y91.142 E.01835
G1 X128.323 Y90.982 E.01835
G1 X127.796 Y90.702 E.01835
G1 X127.341 Y90.316 E.01835
G1 X126.979 Y89.84 E.01835
G1 X126.728 Y89.298 E.01835
G1 X126.6 Y88.715 E.01835
G1 X126.6 Y88.118 E.01835
G1 X126.728 Y87.535 E.01835
G1 X126.979 Y86.993 E.01835
G1 X127.341 Y86.518 E.01835
G1 X127.796 Y86.131 E.01835
G1 X128.323 Y85.852 E.01835
G1 X128.898 Y85.692 E.01835
G1 X129.084 Y85.682 E.00571
G1 X129.495 Y85.66 E.01264
G1 X130.084 Y85.756 E.01835
G1 X130.639 Y85.977 E.01835
G1 X131.133 Y86.312 E.01835
G1 X131.543 Y86.746 E.01835
G1 X131.851 Y87.257 E.01835
G1 X132.042 Y87.823 E.01835
G1 X132.106 Y88.417 E.01835
G1 X132.042 Y89.01 E.01835
G1 X131.851 Y89.576 E.01835
G1 X131.543 Y90.088 E.01835
G1 X131.277 Y90.369 E.01192
M204 S10000
; WIPE_START
G1 F24000
G1 X131.133 Y90.521 E-.07946
G1 X130.639 Y90.856 E-.22689
G1 X130.084 Y91.077 E-.22689
G1 X129.495 Y91.174 E-.22675
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I1.216 J-.04 P1  F30000
G1 X129.309 Y85.581 Z2.2
G1 Z1.8
G1 E.8 F1800
M204 S5000
G1 F2215
G1 X129.345 Y85.578 E.00111
G1 X129.501 Y85.593 E.0048
G1 X129.899 Y85.632 E.0123
G1 X130.432 Y85.794 E.0171
G1 X130.922 Y86.056 E.0171
G1 X131.353 Y86.409 E.0171
G1 X131.706 Y86.839 E.0171
G1 X131.968 Y87.33 E.0171
G1 X132.13 Y87.863 E.0171
G1 X132.184 Y88.417 E.0171
G1 X132.13 Y88.971 E.0171
G1 X131.968 Y89.503 E.0171
G1 X131.706 Y89.994 E.0171
G1 X131.353 Y90.424 E.0171
G1 X130.922 Y90.777 E.0171
G1 X130.432 Y91.04 E.0171
G1 X129.899 Y91.201 E.0171
G1 X129.345 Y91.256 E.0171
G1 X128.791 Y91.201 E.0171
G1 X128.259 Y91.04 E.0171
G1 X127.768 Y90.777 E.0171
G1 X127.338 Y90.424 E.0171
G1 X126.985 Y89.994 E.0171
G1 X126.722 Y89.503 E.0171
G1 X126.561 Y88.971 E.0171
G1 X126.506 Y88.417 E.0171
G1 X126.561 Y87.863 E.0171
G1 X126.722 Y87.33 E.0171
G1 X126.985 Y86.839 E.0171
G1 X127.338 Y86.409 E.0171
G1 X127.768 Y86.056 E.0171
G1 X128.259 Y85.794 E.0171
G1 X128.791 Y85.632 E.0171
G1 X129.25 Y85.587 E.01415
M204 S10000
; WIPE_START
G1 F24000
G1 X129.345 Y85.578 E-.03649
G1 X129.501 Y85.593 E-.05931
G1 X129.899 Y85.632 E-.15217
G1 X130.432 Y85.794 E-.21149
G1 X130.922 Y86.056 E-.21148
G1 X131.104 Y86.205 E-.08906
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-1.217 J-.005 P1  F30000
G1 X130.992 Y112.393 Z2.2
G1 Z1.8
G1 E.8 F1800
M204 S5000
G1 F2215
G1 X130.889 Y112.501 E.00458
G1 X130.395 Y112.836 E.01835
G1 X129.841 Y113.057 E.01835
G1 X129.251 Y113.154 E.01835
G1 X128.655 Y113.121 E.01835
G1 X128.08 Y112.961 E.01835
G1 X127.552 Y112.682 E.01835
G1 X127.097 Y112.295 E.01835
G1 X126.736 Y111.82 E.01835
G1 X126.485 Y111.278 E.01835
G1 X126.357 Y110.695 E.01835
G1 X126.357 Y110.098 E.01835
G1 X126.485 Y109.515 E.01835
G1 X126.736 Y108.973 E.01835
G1 X127.097 Y108.497 E.01835
G1 X127.552 Y108.111 E.01835
G1 X128.08 Y107.831 E.01835
G1 X128.655 Y107.672 E.01835
G1 X128.841 Y107.661 E.00571
G1 X129.251 Y107.639 E.01264
G1 X129.841 Y107.736 E.01835
G1 X130.395 Y107.957 E.01835
G1 X130.889 Y108.292 E.01835
G1 X131.3 Y108.725 E.01835
G1 X131.608 Y109.237 E.01835
G1 X131.798 Y109.803 E.01835
G1 X131.863 Y110.396 E.01835
G1 X131.798 Y110.99 E.01835
G1 X131.608 Y111.556 E.01835
G1 X131.3 Y112.067 E.01835
G1 X131.033 Y112.349 E.01192
M204 S10000
; WIPE_START
G1 F24000
G1 X130.889 Y112.501 E-.07946
G1 X130.395 Y112.836 E-.22689
G1 X129.841 Y113.057 E-.22689
G1 X129.252 Y113.154 E-.22675
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I1.216 J-.04 P1  F30000
G1 X129.066 Y107.561 Z2.2
G1 Z1.8
G1 E.8 F1800
M204 S5000
G1 F2215
G1 X129.102 Y107.557 E.00111
G1 X129.257 Y107.573 E.0048
G1 X129.656 Y107.612 E.0123
G1 X130.188 Y107.773 E.0171
G1 X130.679 Y108.036 E.0171
G1 X131.109 Y108.389 E.0171
G1 X131.462 Y108.819 E.0171
G1 X131.725 Y109.31 E.0171
G1 X131.886 Y109.843 E.0171
G1 X131.941 Y110.396 E.0171
G1 X131.886 Y110.95 E.0171
G1 X131.725 Y111.483 E.0171
G1 X131.462 Y111.974 E.0171
G1 X131.109 Y112.404 E.0171
G1 X130.679 Y112.757 E.0171
G1 X130.188 Y113.019 E.0171
G1 X129.656 Y113.181 E.0171
G1 X129.102 Y113.235 E.0171
G1 X128.548 Y113.181 E.0171
G1 X128.015 Y113.019 E.0171
G1 X127.525 Y112.757 E.0171
G1 X127.094 Y112.404 E.0171
G1 X126.741 Y111.974 E.0171
G1 X126.479 Y111.483 E.0171
G1 X126.317 Y110.95 E.0171
G1 X126.263 Y110.396 E.0171
G1 X126.317 Y109.843 E.0171
G1 X126.479 Y109.31 E.0171
G1 X126.741 Y108.819 E.0171
G1 X127.094 Y108.389 E.0171
G1 X127.525 Y108.036 E.0171
G1 X128.015 Y107.773 E.0171
G1 X128.548 Y107.612 E.0171
G1 X129.006 Y107.567 E.01415
M204 S10000
; WIPE_START
G1 F24000
G1 X129.102 Y107.557 E-.03649
G1 X129.257 Y107.573 E-.05931
G1 X129.656 Y107.612 E-.15217
G1 X130.188 Y107.773 E-.21149
G1 X130.679 Y108.036 E-.21148
G1 X130.86 Y108.185 E-.08906
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-1.216 J.057 P1  F30000
G1 X131.89 Y129.996 Z2.2
G1 Z1.8
G1 E.8 F1800
M204 S5000
G1 F2215
G1 X131.788 Y130.105 E.00458
G1 X131.293 Y130.44 E.01835
G1 X130.739 Y130.661 E.01835
G1 X130.149 Y130.757 E.01835
G1 X129.553 Y130.725 E.01835
G1 X128.978 Y130.565 E.01835
G1 X128.45 Y130.285 E.01835
G1 X127.995 Y129.899 E.01835
G1 X127.634 Y129.424 E.01835
G1 X127.383 Y128.882 E.01835
G1 X127.255 Y128.299 E.01835
G1 X127.255 Y127.701 E.01835
G1 X127.383 Y127.118 E.01835
G1 X127.634 Y126.576 E.01835
G1 X127.995 Y126.101 E.01835
G1 X128.45 Y125.715 E.01835
G1 X128.978 Y125.435 E.01835
G1 X129.553 Y125.275 E.01835
G1 X129.739 Y125.265 E.00571
G1 X130.149 Y125.243 E.01264
G1 X130.739 Y125.339 E.01835
G1 X131.293 Y125.56 E.01835
G1 X131.788 Y125.895 E.01835
G1 X132.198 Y126.329 E.01835
G1 X132.506 Y126.841 E.01835
G1 X132.697 Y127.406 E.01835
G1 X132.761 Y128 E.01835
G1 X132.697 Y128.594 E.01835
G1 X132.506 Y129.159 E.01835
G1 X132.198 Y129.671 E.01835
G1 X131.931 Y129.953 E.01192
M204 S10000
; WIPE_START
G1 F24000
G1 X131.788 Y130.105 E-.07946
G1 X131.293 Y130.44 E-.22689
G1 X130.739 Y130.661 E-.22689
G1 X130.15 Y130.757 E-.22675
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I1.216 J-.04 P1  F30000
G1 X129.964 Y125.165 Z2.2
G1 Z1.8
G1 E.8 F1800
M204 S5000
G1 F2215
G1 X130 Y125.161 E.00111
G1 X130.155 Y125.176 E.0048
G1 X130.554 Y125.216 E.0123
G1 X131.086 Y125.377 E.0171
G1 X131.577 Y125.639 E.0171
G1 X132.007 Y125.993 E.0171
G1 X132.361 Y126.423 E.0171
G1 X132.623 Y126.914 E.0171
G1 X132.784 Y127.446 E.0171
G1 X132.839 Y128 E.0171
G1 X132.784 Y128.554 E.0171
G1 X132.623 Y129.086 E.0171
G1 X132.361 Y129.577 E.0171
G1 X132.007 Y130.007 E.0171
G1 X131.577 Y130.361 E.0171
G1 X131.086 Y130.623 E.0171
G1 X130.554 Y130.784 E.0171
G1 X130 Y130.839 E.0171
G1 X129.446 Y130.784 E.0171
G1 X128.914 Y130.623 E.0171
G1 X128.423 Y130.361 E.0171
G1 X127.993 Y130.007 E.0171
G1 X127.639 Y129.577 E.0171
G1 X127.377 Y129.086 E.0171
G1 X127.216 Y128.554 E.0171
G1 X127.161 Y128 E.0171
G1 X127.216 Y127.446 E.0171
G1 X127.377 Y126.914 E.0171
G1 X127.639 Y126.423 E.0171
G1 X127.993 Y125.993 E.0171
G1 X128.423 Y125.639 E.0171
G1 X128.914 Y125.377 E.0171
G1 X129.446 Y125.216 E.0171
G1 X129.904 Y125.17 E.01415
M204 S10000
; WIPE_START
G1 F24000
G1 X130 Y125.161 E-.03649
G1 X130.155 Y125.176 E-.05931
G1 X130.554 Y125.216 E-.15217
G1 X131.086 Y125.377 E-.21149
G1 X131.577 Y125.639 E-.21148
G1 X131.758 Y125.788 E-.08906
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-.735 J-.97 P1  F30000
G1 X111.311 Y141.287 Z2.2
G1 Z1.8
G1 E.8 F1800
M204 S5000
G1 F2215
G1 X111.278 Y141.322 E.00148
G1 X111.163 Y141.443 E.00513
G1 X110.669 Y141.778 E.01835
G1 X110.114 Y141.999 E.01835
G1 X109.525 Y142.096 E.01835
G1 X108.929 Y142.063 E.01835
G1 X108.353 Y141.904 E.01835
G1 X107.826 Y141.624 E.01835
G1 X107.698 Y141.516 E.00513
G1 X107.371 Y141.237 E.01321
G1 X107.009 Y140.762 E.01835
G1 X106.759 Y140.22 E.01835
G1 X106.63 Y139.637 E.01835
G1 X106.63 Y139.04 E.01835
G1 X106.759 Y138.457 E.01835
G1 X107.009 Y137.915 E.01835
G1 X107.371 Y137.44 E.01835
G1 X107.826 Y137.053 E.01835
G1 X108.353 Y136.773 E.01835
G1 X108.929 Y136.614 E.01835
G1 X109.358 Y136.59 E.01321
G1 X109.525 Y136.581 E.00513
G1 X110.114 Y136.678 E.01835
G1 X110.669 Y136.899 E.01835
G1 X111.163 Y137.234 E.01835
G1 X111.574 Y137.667 E.01835
G1 X111.881 Y138.179 E.01835
G1 X112.072 Y138.745 E.01835
G1 X112.137 Y139.339 E.01835
G1 X112.072 Y139.932 E.01835
G1 X111.881 Y140.498 E.01835
G1 X111.574 Y141.01 E.01835
G1 X111.352 Y141.243 E.00989
M204 S10000
; WIPE_START
G1 F24000
G1 X111.278 Y141.322 E-.04115
G1 X111.163 Y141.443 E-.06348
G1 X110.669 Y141.778 E-.22689
G1 X110.114 Y141.999 E-.22689
G1 X109.591 Y142.085 E-.20159
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I1.216 J-.045 P1  F30000
G1 X109.385 Y136.501 Z2.2
G1 Z1.8
G1 E.8 F1800
M204 S5000
G1 F2215
G1 X109.794 Y136.541 E.01262
G1 X109.929 Y136.554 E.00417
G1 X110.462 Y136.716 E.0171
G1 X110.953 Y136.978 E.0171
G1 X111.383 Y137.331 E.0171
G1 X111.736 Y137.761 E.0171
G1 X111.998 Y138.252 E.0171
G1 X112.16 Y138.785 E.0171
G1 X112.214 Y139.339 E.0171
G1 X112.16 Y139.892 E.0171
G1 X111.998 Y140.425 E.0171
G1 X111.736 Y140.916 E.0171
G1 X111.383 Y141.346 E.0171
G1 X110.953 Y141.699 E.0171
G1 X110.462 Y141.961 E.0171
G1 X109.929 Y142.123 E.0171
G1 X109.375 Y142.177 E.0171
G1 X108.822 Y142.123 E.0171
G1 X108.289 Y141.961 E.0171
G1 X107.798 Y141.699 E.0171
M73 P64 R4
G1 X107.368 Y141.346 E.0171
G1 X107.015 Y140.916 E.0171
G1 X106.752 Y140.425 E.0171
G1 X106.591 Y139.892 E.0171
G1 X106.536 Y139.339 E.0171
G1 X106.591 Y138.785 E.0171
G1 X106.752 Y138.252 E.0171
G1 X107.015 Y137.761 E.0171
G1 X107.368 Y137.331 E.0171
G1 X107.798 Y136.978 E.0171
G1 X108.289 Y136.716 E.0171
G1 X108.822 Y136.554 E.0171
G1 X109.326 Y136.504 E.01556
M204 S10000
; WIPE_START
G1 F24000
G1 X109.794 Y136.541 E-.17861
G1 X109.929 Y136.554 E-.05156
G1 X110.462 Y136.716 E-.21149
G1 X110.953 Y136.978 E-.21148
G1 X111.17 Y137.156 E-.10686
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I1.217 J.014 P1  F30000
G1 X111.352 Y121.282 Z2.2
G1 Z1.8
G1 E.8 F1800
M204 S5000
G1 F2215
G1 X111.319 Y121.317 E.00148
G1 X111.204 Y121.438 E.00513
G1 X110.71 Y121.773 E.01835
G1 X110.155 Y121.994 E.01835
G1 X109.566 Y122.091 E.01835
G1 X108.97 Y122.059 E.01835
G1 X108.394 Y121.899 E.01835
G1 X107.867 Y121.619 E.01835
G1 X107.74 Y121.511 E.00513
G1 X107.412 Y121.233 E.01321
G1 X107.051 Y120.757 E.01835
G1 X106.8 Y120.215 E.01835
G1 X106.671 Y119.632 E.01835
G1 X106.671 Y119.035 E.01835
G1 X106.8 Y118.452 E.01835
G1 X107.051 Y117.91 E.01835
G1 X107.412 Y117.435 E.01835
G1 X107.867 Y117.048 E.01835
G1 X108.394 Y116.769 E.01835
G1 X108.97 Y116.609 E.01835
G1 X109.399 Y116.586 E.01321
G1 X109.566 Y116.577 E.00513
G1 X110.155 Y116.673 E.01835
G1 X110.71 Y116.894 E.01835
G1 X111.204 Y117.229 E.01835
G1 X111.615 Y117.663 E.01835
G1 X111.923 Y118.174 E.01835
G1 X112.113 Y118.74 E.01835
G1 X112.178 Y119.334 E.01835
G1 X112.113 Y119.927 E.01835
G1 X111.923 Y120.493 E.01835
G1 X111.615 Y121.005 E.01835
G1 X111.393 Y121.238 E.00989
M204 S10000
; WIPE_START
G1 F24000
G1 X111.319 Y121.317 E-.04115
G1 X111.204 Y121.438 E-.06348
G1 X110.71 Y121.773 E-.22689
G1 X110.155 Y121.994 E-.22689
G1 X109.632 Y122.08 E-.20159
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I1.216 J-.045 P1  F30000
G1 X109.426 Y116.496 Z2.2
G1 Z1.8
G1 E.8 F1800
M204 S5000
G1 F2215
G1 X109.835 Y116.536 E.01262
G1 X109.97 Y116.549 E.00417
G1 X110.503 Y116.711 E.0171
G1 X110.994 Y116.973 E.0171
G1 X111.424 Y117.326 E.0171
G1 X111.777 Y117.757 E.0171
G1 X112.039 Y118.247 E.0171
G1 X112.201 Y118.78 E.0171
G1 X112.256 Y119.334 E.0171
G1 X112.201 Y119.888 E.0171
G1 X112.039 Y120.42 E.0171
G1 X111.777 Y120.911 E.0171
G1 X111.424 Y121.341 E.0171
G1 X110.994 Y121.694 E.0171
G1 X110.503 Y121.957 E.0171
G1 X109.97 Y122.118 E.0171
G1 X109.417 Y122.173 E.0171
G1 X108.863 Y122.118 E.0171
G1 X108.33 Y121.957 E.0171
G1 X107.839 Y121.694 E.0171
G1 X107.409 Y121.341 E.0171
G1 X107.056 Y120.911 E.0171
G1 X106.794 Y120.42 E.0171
G1 X106.632 Y119.888 E.0171
G1 X106.578 Y119.334 E.0171
G1 X106.632 Y118.78 E.0171
G1 X106.794 Y118.247 E.0171
G1 X107.056 Y117.757 E.0171
G1 X107.409 Y117.326 E.0171
G1 X107.839 Y116.973 E.0171
G1 X108.33 Y116.711 E.0171
G1 X108.863 Y116.549 E.0171
G1 X109.367 Y116.5 E.01556
M204 S10000
; WIPE_START
G1 F24000
G1 X109.835 Y116.536 E-.17861
G1 X109.97 Y116.549 E-.05156
G1 X110.503 Y116.711 E-.21149
G1 X110.994 Y116.973 E-.21148
G1 X111.211 Y117.152 E-.10686
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I1.217 J-.012 P1  F30000
G1 X111.058 Y101.506 Z2.2
G1 Z1.8
G1 E.8 F1800
M204 S5000
G1 F2215
G1 X111.025 Y101.541 E.00148
G1 X110.91 Y101.662 E.00513
G1 X110.416 Y101.997 E.01835
G1 X109.861 Y102.218 E.01835
G1 X109.272 Y102.315 E.01835
G1 X108.676 Y102.282 E.01835
G1 X108.1 Y102.122 E.01835
G1 X107.573 Y101.843 E.01835
G1 X107.446 Y101.735 E.00513
G1 X107.118 Y101.456 E.01321
G1 X106.756 Y100.981 E.01835
G1 X106.506 Y100.439 E.01835
G1 X106.377 Y99.856 E.01835
G1 X106.377 Y99.259 E.01835
G1 X106.506 Y98.676 E.01835
G1 X106.756 Y98.134 E.01835
G1 X107.118 Y97.658 E.01835
G1 X107.573 Y97.272 E.01835
G1 X108.1 Y96.992 E.01835
G1 X108.676 Y96.832 E.01835
G1 X109.105 Y96.809 E.01321
G1 X109.272 Y96.8 E.00513
G1 X109.861 Y96.897 E.01835
G1 X110.416 Y97.118 E.01835
G1 X110.91 Y97.453 E.01835
G1 X111.321 Y97.886 E.01835
G1 X111.628 Y98.398 E.01835
G1 X111.819 Y98.964 E.01835
G1 X111.884 Y99.557 E.01835
G1 X111.819 Y100.151 E.01835
G1 X111.628 Y100.717 E.01835
G1 X111.321 Y101.228 E.01835
G1 X111.099 Y101.462 E.00989
M204 S10000
; WIPE_START
G1 F24000
G1 X111.025 Y101.541 E-.04115
G1 X110.91 Y101.662 E-.06348
G1 X110.416 Y101.997 E-.22689
G1 X109.861 Y102.218 E-.22689
G1 X109.338 Y102.304 E-.20159
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I1.216 J-.045 P1  F30000
G1 X109.132 Y96.719 Z2.2
G1 Z1.8
G1 E.8 F1800
M204 S5000
G1 F2215
G1 X109.541 Y96.76 E.01262
G1 X109.676 Y96.773 E.00417
G1 X110.209 Y96.934 E.0171
G1 X110.7 Y97.197 E.0171
G1 X111.13 Y97.55 E.0171
G1 X111.483 Y97.98 E.0171
G1 X111.745 Y98.471 E.0171
G1 X111.907 Y99.003 E.0171
G1 X111.961 Y99.557 E.0171
G1 X111.907 Y100.111 E.0171
G1 X111.745 Y100.644 E.0171
G1 X111.483 Y101.135 E.0171
G1 X111.13 Y101.565 E.0171
G1 X110.7 Y101.918 E.0171
G1 X110.209 Y102.18 E.0171
G1 X109.676 Y102.342 E.0171
G1 X109.122 Y102.396 E.0171
G1 X108.569 Y102.342 E.0171
G1 X108.036 Y102.18 E.0171
G1 X107.545 Y101.918 E.0171
G1 X107.115 Y101.565 E.0171
G1 X106.762 Y101.135 E.0171
G1 X106.5 Y100.644 E.0171
G1 X106.338 Y100.111 E.0171
G1 X106.283 Y99.557 E.0171
G1 X106.338 Y99.003 E.0171
G1 X106.5 Y98.471 E.0171
G1 X106.762 Y97.98 E.0171
G1 X107.115 Y97.55 E.0171
G1 X107.545 Y97.197 E.0171
G1 X108.036 Y96.934 E.0171
G1 X108.569 Y96.773 E.0171
G1 X109.073 Y96.723 E.01556
M204 S10000
; WIPE_START
G1 F24000
G1 X109.541 Y96.76 E-.17861
G1 X109.676 Y96.773 E-.05156
G1 X110.209 Y96.934 E-.21149
G1 X110.7 Y97.197 E-.21148
G1 X110.917 Y97.375 E-.10686
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I1.216 J-.042 P1  F30000
G1 X110.276 Y78.69 Z2.2
G1 Z1.8
G1 E.8 F1800
M204 S5000
G1 F2215
G1 X110.243 Y78.725 E.00148
G1 X110.128 Y78.846 E.00513
G1 X109.634 Y79.181 E.01835
G1 X109.079 Y79.402 E.01835
G1 X108.49 Y79.499 E.01835
G1 X107.894 Y79.467 E.01835
G1 X107.318 Y79.307 E.01835
G1 X106.791 Y79.027 E.01835
G1 X106.663 Y78.919 E.00513
G1 X106.336 Y78.641 E.01321
G1 X105.974 Y78.165 E.01835
G1 X105.724 Y77.623 E.01835
G1 X105.595 Y77.04 E.01835
G1 X105.595 Y76.443 E.01835
G1 X105.724 Y75.86 E.01835
G1 X105.974 Y75.318 E.01835
G1 X106.336 Y74.843 E.01835
G1 X106.791 Y74.456 E.01835
G1 X107.318 Y74.177 E.01835
G1 X107.894 Y74.017 E.01835
G1 X108.323 Y73.994 E.01321
G1 X108.49 Y73.985 E.00513
G1 X109.079 Y74.081 E.01835
G1 X109.634 Y74.302 E.01835
G1 X110.128 Y74.637 E.01835
G1 X110.538 Y75.071 E.01835
G1 X110.846 Y75.582 E.01835
G1 X111.037 Y76.148 E.01835
G1 X111.102 Y76.742 E.01835
G1 X111.037 Y77.335 E.01835
G1 X110.846 Y77.901 E.01835
G1 X110.538 Y78.413 E.01835
G1 X110.317 Y78.646 E.00989
M204 S10000
; WIPE_START
G1 F24000
G1 X110.243 Y78.725 E-.04115
G1 X110.128 Y78.846 E-.06348
G1 X109.634 Y79.181 E-.22689
G1 X109.079 Y79.402 E-.22689
G1 X108.556 Y79.488 E-.20159
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I1.216 J-.045 P1  F30000
G1 X108.35 Y73.904 Z2.2
G1 Z1.8
G1 E.8 F1800
M204 S5000
G1 F2215
G1 X108.759 Y73.944 E.01262
G1 X108.894 Y73.957 E.00417
G1 X109.427 Y74.119 E.0171
G1 X109.918 Y74.381 E.0171
G1 X110.348 Y74.734 E.0171
G1 X110.701 Y75.164 E.0171
G1 X110.963 Y75.655 E.0171
G1 X111.125 Y76.188 E.0171
G1 X111.179 Y76.742 E.0171
G1 X111.125 Y77.296 E.0171
G1 X110.963 Y77.828 E.0171
G1 X110.701 Y78.319 E.0171
G1 X110.348 Y78.749 E.0171
G1 X109.918 Y79.102 E.0171
G1 X109.427 Y79.365 E.0171
G1 X108.894 Y79.526 E.0171
G1 X108.34 Y79.581 E.0171
G1 X107.786 Y79.526 E.0171
G1 X107.254 Y79.365 E.0171
G1 X106.763 Y79.102 E.0171
G1 X106.333 Y78.749 E.0171
G1 X105.98 Y78.319 E.0171
G1 X105.717 Y77.828 E.0171
G1 X105.556 Y77.296 E.0171
G1 X105.501 Y76.742 E.0171
G1 X105.556 Y76.188 E.0171
G1 X105.717 Y75.655 E.0171
G1 X105.98 Y75.164 E.0171
G1 X106.333 Y74.734 E.0171
G1 X106.763 Y74.381 E.0171
G1 X107.254 Y74.119 E.0171
G1 X107.786 Y73.957 E.0171
G1 X108.291 Y73.908 E.01556
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X108.759 Y73.944 E-.17861
G1 X108.894 Y73.957 E-.05156
G1 X109.427 Y74.119 E-.21149
G1 X109.918 Y74.381 E-.21148
G1 X110.135 Y74.56 E-.10686
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 10/32
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
G3 Z2.2 I-.731 J.973 P1  F30000
G1 X131.24 Y90.408 Z2.2
G1 Z2
G1 E.8 F1800
M204 S5000
G1 F2215
G1 X131.133 Y90.521 E.0048
G1 X130.639 Y90.856 E.01835
G1 X130.084 Y91.077 E.01835
G1 X129.495 Y91.174 E.01835
G1 X128.898 Y91.142 E.01835
G1 X128.323 Y90.982 E.01835
G1 X127.796 Y90.702 E.01835
G1 X127.639 Y90.569 E.0063
G1 X127.341 Y90.316 E.01205
G1 X126.979 Y89.84 E.01835
G1 X126.728 Y89.298 E.01835
G1 X126.6 Y88.715 E.01835
G1 X126.6 Y88.118 E.01835
G1 X126.728 Y87.535 E.01835
G1 X126.979 Y86.993 E.01835
G1 X127.341 Y86.518 E.01835
G1 X127.796 Y86.131 E.01835
G1 X128.323 Y85.852 E.01835
G1 X128.898 Y85.692 E.01835
G1 X129.103 Y85.681 E.0063
G1 X129.495 Y85.66 E.01205
G1 X130.084 Y85.756 E.01835
G1 X130.639 Y85.977 E.01835
G1 X131.133 Y86.312 E.01835
G1 X131.543 Y86.746 E.01835
G1 X131.851 Y87.257 E.01835
G1 X132.042 Y87.823 E.01835
G1 X132.106 Y88.417 E.01835
G1 X132.042 Y89.01 E.01835
G1 X131.851 Y89.576 E.01835
G1 X131.543 Y90.088 E.01835
G1 X131.281 Y90.364 E.0117
M204 S10000
; WIPE_START
G1 F24000
G1 X131.133 Y90.521 E-.08216
G1 X130.639 Y90.856 E-.22689
G1 X130.084 Y91.077 E-.22689
G1 X129.502 Y91.173 E-.22406
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I1.216 J-.042 P1  F30000
G1 X129.311 Y85.581 Z2.4
G1 Z2
G1 E.8 F1800
M204 S5000
G1 F2215
G1 X129.345 Y85.578 E.00106
G1 X129.521 Y85.595 E.00544
G1 X129.899 Y85.632 E.01167
G1 X130.432 Y85.794 E.0171
G1 X130.922 Y86.056 E.0171
G1 X131.353 Y86.409 E.0171
G1 X131.706 Y86.839 E.0171
G1 X131.968 Y87.33 E.0171
G1 X132.13 Y87.863 E.0171
G1 X132.184 Y88.417 E.0171
G1 X132.13 Y88.971 E.0171
G1 X131.968 Y89.503 E.0171
G1 X131.706 Y89.994 E.0171
G1 X131.353 Y90.424 E.0171
G1 X130.922 Y90.777 E.0171
G1 X130.432 Y91.04 E.0171
G1 X129.899 Y91.201 E.0171
G1 X129.345 Y91.256 E.0171
G1 X128.791 Y91.201 E.0171
G1 X128.259 Y91.04 E.0171
G1 X127.768 Y90.777 E.0171
G1 X127.338 Y90.424 E.0171
G1 X126.985 Y89.994 E.0171
G1 X126.722 Y89.503 E.0171
G1 X126.561 Y88.971 E.0171
G1 X126.506 Y88.417 E.0171
G1 X126.561 Y87.863 E.0171
G1 X126.722 Y87.33 E.0171
G1 X126.985 Y86.839 E.0171
G1 X127.338 Y86.409 E.0171
G1 X127.768 Y86.056 E.0171
G1 X128.259 Y85.794 E.0171
G1 X128.791 Y85.632 E.0171
G1 X129.251 Y85.587 E.0142
M204 S10000
; WIPE_START
G1 F24000
G1 X129.345 Y85.578 E-.03588
G1 X129.521 Y85.595 E-.06722
G1 X129.899 Y85.632 E-.14427
G1 X130.432 Y85.794 E-.21149
G1 X130.922 Y86.056 E-.21148
G1 X131.105 Y86.206 E-.08967
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-1.217 J-.005 P1  F30000
G1 X130.997 Y112.387 Z2.4
G1 Z2
G1 E.8 F1800
M204 S5000
G1 F2215
G1 X130.889 Y112.501 E.0048
G1 X130.395 Y112.836 E.01835
G1 X129.841 Y113.057 E.01835
G1 X129.251 Y113.154 E.01835
G1 X128.655 Y113.121 E.01835
G1 X128.08 Y112.961 E.01835
G1 X127.552 Y112.682 E.01835
G1 X127.396 Y112.549 E.0063
G1 X127.097 Y112.295 E.01205
G1 X126.736 Y111.82 E.01835
G1 X126.485 Y111.278 E.01835
G1 X126.357 Y110.695 E.01835
G1 X126.357 Y110.098 E.01835
G1 X126.485 Y109.515 E.01835
G1 X126.736 Y108.973 E.01835
G1 X127.097 Y108.497 E.01835
G1 X127.552 Y108.111 E.01835
G1 X128.08 Y107.831 E.01835
G1 X128.655 Y107.672 E.01835
G1 X128.86 Y107.66 E.0063
G1 X129.251 Y107.639 E.01205
G1 X129.841 Y107.736 E.01835
G1 X130.395 Y107.957 E.01835
G1 X130.889 Y108.292 E.01835
G1 X131.3 Y108.725 E.01835
G1 X131.608 Y109.237 E.01835
G1 X131.798 Y109.803 E.01835
G1 X131.863 Y110.396 E.01835
G1 X131.798 Y110.99 E.01835
G1 X131.608 Y111.556 E.01835
G1 X131.3 Y112.067 E.01835
G1 X131.038 Y112.344 E.0117
M204 S10000
; WIPE_START
G1 F24000
G1 X130.889 Y112.501 E-.08216
G1 X130.395 Y112.836 E-.22689
G1 X129.841 Y113.057 E-.22689
G1 X129.259 Y113.152 E-.22406
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I1.216 J-.042 P1  F30000
G1 X129.068 Y107.561 Z2.4
G1 Z2
G1 E.8 F1800
M204 S5000
G1 F2215
G1 X129.102 Y107.557 E.00106
G1 X129.278 Y107.575 E.00544
G1 X129.656 Y107.612 E.01167
G1 X130.188 Y107.773 E.0171
G1 X130.679 Y108.036 E.0171
G1 X131.109 Y108.389 E.0171
M73 P65 R4
G1 X131.462 Y108.819 E.0171
G1 X131.725 Y109.31 E.0171
G1 X131.886 Y109.843 E.0171
G1 X131.941 Y110.396 E.0171
G1 X131.886 Y110.95 E.0171
G1 X131.725 Y111.483 E.0171
G1 X131.462 Y111.974 E.0171
G1 X131.109 Y112.404 E.0171
G1 X130.679 Y112.757 E.0171
G1 X130.188 Y113.019 E.0171
G1 X129.656 Y113.181 E.0171
G1 X129.102 Y113.235 E.0171
G1 X128.548 Y113.181 E.0171
G1 X128.015 Y113.019 E.0171
G1 X127.525 Y112.757 E.0171
G1 X127.094 Y112.404 E.0171
G1 X126.741 Y111.974 E.0171
G1 X126.479 Y111.483 E.0171
G1 X126.317 Y110.95 E.0171
G1 X126.263 Y110.396 E.0171
G1 X126.317 Y109.843 E.0171
G1 X126.479 Y109.31 E.0171
G1 X126.741 Y108.819 E.0171
G1 X127.094 Y108.389 E.0171
G1 X127.525 Y108.036 E.0171
G1 X128.015 Y107.773 E.0171
G1 X128.548 Y107.612 E.0171
G1 X129.008 Y107.567 E.0142
M204 S10000
; WIPE_START
G1 F24000
G1 X129.102 Y107.557 E-.03588
G1 X129.278 Y107.575 E-.06722
G1 X129.656 Y107.612 E-.14427
G1 X130.188 Y107.773 E-.21149
G1 X130.679 Y108.036 E-.21148
G1 X130.861 Y108.186 E-.08967
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-1.216 J.058 P1  F30000
G1 X131.895 Y129.991 Z2.4
G1 Z2
G1 E.8 F1800
M204 S5000
G1 F2215
G1 X131.788 Y130.105 E.0048
G1 X131.293 Y130.44 E.01835
G1 X130.739 Y130.661 E.01835
G1 X130.149 Y130.757 E.01835
G1 X129.553 Y130.725 E.01835
G1 X128.978 Y130.565 E.01835
G1 X128.45 Y130.285 E.01835
G1 X128.294 Y130.153 E.0063
G1 X127.995 Y129.899 E.01205
G1 X127.634 Y129.424 E.01835
G1 X127.383 Y128.882 E.01835
G1 X127.255 Y128.299 E.01835
G1 X127.255 Y127.701 E.01835
G1 X127.383 Y127.118 E.01835
G1 X127.634 Y126.576 E.01835
G1 X127.995 Y126.101 E.01835
G1 X128.45 Y125.715 E.01835
G1 X128.978 Y125.435 E.01835
G1 X129.553 Y125.275 E.01835
G1 X129.758 Y125.264 E.0063
G1 X130.149 Y125.243 E.01205
G1 X130.739 Y125.339 E.01835
G1 X131.293 Y125.56 E.01835
G1 X131.788 Y125.895 E.01835
G1 X132.198 Y126.329 E.01835
G1 X132.506 Y126.841 E.01835
G1 X132.697 Y127.406 E.01835
G1 X132.761 Y128 E.01835
G1 X132.697 Y128.594 E.01835
G1 X132.506 Y129.159 E.01835
G1 X132.198 Y129.671 E.01835
G1 X131.936 Y129.948 E.0117
M204 S10000
; WIPE_START
G1 F24000
G1 X131.788 Y130.105 E-.08216
G1 X131.293 Y130.44 E-.22689
G1 X130.739 Y130.661 E-.22689
G1 X130.157 Y130.756 E-.22406
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I1.216 J-.042 P1  F30000
G1 X129.966 Y125.164 Z2.4
G1 Z2
G1 E.8 F1800
M204 S5000
G1 F2215
G1 X130 Y125.161 E.00106
G1 X130.176 Y125.178 E.00544
G1 X130.554 Y125.216 E.01167
G1 X131.086 Y125.377 E.0171
G1 X131.577 Y125.639 E.0171
G1 X132.007 Y125.993 E.0171
G1 X132.361 Y126.423 E.0171
G1 X132.623 Y126.914 E.0171
G1 X132.784 Y127.446 E.0171
G1 X132.839 Y128 E.0171
G1 X132.784 Y128.554 E.0171
G1 X132.623 Y129.086 E.0171
G1 X132.361 Y129.577 E.0171
G1 X132.007 Y130.007 E.0171
G1 X131.577 Y130.361 E.0171
G1 X131.086 Y130.623 E.0171
G1 X130.554 Y130.784 E.0171
G1 X130 Y130.839 E.0171
G1 X129.446 Y130.784 E.0171
G1 X128.914 Y130.623 E.0171
G1 X128.423 Y130.361 E.0171
G1 X127.993 Y130.007 E.0171
G1 X127.639 Y129.577 E.0171
G1 X127.377 Y129.086 E.0171
G1 X127.216 Y128.554 E.0171
G1 X127.161 Y128 E.0171
G1 X127.216 Y127.446 E.0171
G1 X127.377 Y126.914 E.0171
G1 X127.639 Y126.423 E.0171
G1 X127.993 Y125.993 E.0171
G1 X128.423 Y125.639 E.0171
G1 X128.914 Y125.377 E.0171
G1 X129.446 Y125.216 E.0171
G1 X129.906 Y125.17 E.0142
M204 S10000
; WIPE_START
G1 F24000
G1 X130 Y125.161 E-.03588
G1 X130.176 Y125.178 E-.06722
G1 X130.554 Y125.216 E-.14427
G1 X131.086 Y125.377 E-.21149
G1 X131.577 Y125.639 E-.21148
G1 X131.76 Y125.789 E-.08967
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-.735 J-.97 P1  F30000
G1 X111.311 Y141.286 Z2.4
G1 Z2
G1 E.8 F1800
M204 S5000
G1 F2215
G1 X111.289 Y141.309 E.00098
G1 X111.163 Y141.443 E.00565
G1 X110.669 Y141.778 E.01835
G1 X110.114 Y141.999 E.01835
G1 X109.525 Y142.096 E.01835
G1 X108.929 Y142.063 E.01835
G1 X108.353 Y141.904 E.01835
G1 X107.826 Y141.624 E.01835
G1 X107.686 Y141.505 E.00565
G1 X107.371 Y141.237 E.01269
G1 X107.009 Y140.762 E.01835
G1 X106.759 Y140.22 E.01835
G1 X106.63 Y139.637 E.01835
G1 X106.63 Y139.04 E.01835
G1 X106.759 Y138.457 E.01835
G1 X107.009 Y137.915 E.01835
G1 X107.371 Y137.44 E.01835
G1 X107.826 Y137.053 E.01835
G1 X108.353 Y136.773 E.01835
G1 X108.929 Y136.614 E.01835
G1 X109.341 Y136.591 E.01269
G1 X109.525 Y136.581 E.00565
G1 X110.114 Y136.678 E.01835
G1 X110.669 Y136.899 E.01835
G1 X111.163 Y137.234 E.01835
G1 X111.574 Y137.667 E.01835
G1 X111.881 Y138.179 E.01835
G1 X112.072 Y138.745 E.01835
G1 X112.137 Y139.339 E.01835
G1 X112.072 Y139.932 E.01835
G1 X111.881 Y140.498 E.01835
G1 X111.574 Y141.01 E.01835
G1 X111.353 Y141.243 E.00987
M204 S10000
; WIPE_START
G1 F24000
G1 X111.289 Y141.309 E-.03491
G1 X111.163 Y141.443 E-.06993
G1 X110.669 Y141.778 E-.22689
G1 X110.114 Y141.999 E-.22689
G1 X109.591 Y142.085 E-.20138
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I1.216 J-.051 P1  F30000
G1 X109.358 Y136.501 Z2.4
G1 Z2
G1 E.8 F1800
M204 S5000
G1 F2215
G1 X109.375 Y136.5 E.00055
G1 X109.776 Y136.539 E.01237
G1 X109.929 Y136.554 E.00473
G1 X110.462 Y136.716 E.0171
G1 X110.953 Y136.978 E.0171
G1 X111.383 Y137.331 E.0171
G1 X111.736 Y137.761 E.0171
G1 X111.998 Y138.252 E.0171
G1 X112.16 Y138.785 E.0171
G1 X112.214 Y139.339 E.0171
G1 X112.16 Y139.892 E.0171
G1 X111.998 Y140.425 E.0171
G1 X111.736 Y140.916 E.0171
G1 X111.383 Y141.346 E.0171
G1 X110.953 Y141.699 E.0171
G1 X110.462 Y141.961 E.0171
G1 X109.929 Y142.123 E.0171
G1 X109.375 Y142.177 E.0171
G1 X108.822 Y142.123 E.0171
G1 X108.289 Y141.961 E.0171
G1 X107.798 Y141.699 E.0171
G1 X107.368 Y141.346 E.0171
G1 X107.015 Y140.916 E.0171
G1 X106.752 Y140.425 E.0171
G1 X106.591 Y139.892 E.0171
G1 X106.536 Y139.339 E.0171
G1 X106.591 Y138.785 E.0171
G1 X106.752 Y138.252 E.0171
G1 X107.015 Y137.761 E.0171
G1 X107.368 Y137.331 E.0171
G1 X107.798 Y136.978 E.0171
G1 X108.289 Y136.716 E.0171
G1 X108.822 Y136.554 E.0171
G1 X109.298 Y136.507 E.01471
M204 S10000
; WIPE_START
G1 F24000
G1 X109.375 Y136.5 E-.0296
G1 X109.776 Y136.539 E-.15293
G1 X109.929 Y136.554 E-.05855
G1 X110.462 Y136.716 E-.21149
G1 X110.953 Y136.978 E-.21148
G1 X111.148 Y137.138 E-.09595
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I1.217 J.016 P1  F30000
G1 X111.353 Y121.282 Z2.4
G1 Z2
G1 E.8 F1800
M204 S5000
G1 F2215
G1 X111.331 Y121.305 E.00098
G1 X111.204 Y121.438 E.00565
G1 X110.71 Y121.773 E.01835
G1 X110.155 Y121.994 E.01835
G1 X109.566 Y122.091 E.01835
G1 X108.97 Y122.059 E.01835
G1 X108.394 Y121.899 E.01835
G1 X107.867 Y121.619 E.01835
G1 X107.727 Y121.5 E.00565
G1 X107.412 Y121.233 E.01269
G1 X107.051 Y120.757 E.01835
G1 X106.8 Y120.215 E.01835
G1 X106.671 Y119.632 E.01835
G1 X106.671 Y119.035 E.01835
G1 X106.8 Y118.452 E.01835
G1 X107.051 Y117.91 E.01835
G1 X107.412 Y117.435 E.01835
G1 X107.867 Y117.048 E.01835
G1 X108.394 Y116.769 E.01835
G1 X108.97 Y116.609 E.01835
G1 X109.382 Y116.587 E.01269
G1 X109.566 Y116.577 E.00565
G1 X110.155 Y116.673 E.01835
G1 X110.71 Y116.894 E.01835
G1 X111.204 Y117.229 E.01835
G1 X111.615 Y117.663 E.01835
G1 X111.923 Y118.174 E.01835
G1 X112.113 Y118.74 E.01835
G1 X112.178 Y119.334 E.01835
G1 X112.113 Y119.927 E.01835
G1 X111.923 Y120.493 E.01835
G1 X111.615 Y121.005 E.01835
G1 X111.394 Y121.238 E.00987
M204 S10000
; WIPE_START
G1 F24000
G1 X111.331 Y121.305 E-.03491
G1 X111.204 Y121.438 E-.06993
G1 X110.71 Y121.773 E-.22689
G1 X110.155 Y121.994 E-.22689
G1 X109.632 Y122.08 E-.20138
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I1.216 J-.051 P1  F30000
G1 X109.399 Y116.497 Z2.4
G1 Z2
G1 E.8 F1800
M204 S5000
G1 F2215
G1 X109.417 Y116.495 E.00055
G1 X109.817 Y116.534 E.01237
G1 X109.97 Y116.549 E.00473
G1 X110.503 Y116.711 E.0171
G1 X110.994 Y116.973 E.0171
G1 X111.424 Y117.326 E.0171
G1 X111.777 Y117.757 E.0171
G1 X112.039 Y118.247 E.0171
G1 X112.201 Y118.78 E.0171
G1 X112.256 Y119.334 E.0171
G1 X112.201 Y119.888 E.0171
G1 X112.039 Y120.42 E.0171
G1 X111.777 Y120.911 E.0171
G1 X111.424 Y121.341 E.0171
G1 X110.994 Y121.694 E.0171
G1 X110.503 Y121.957 E.0171
G1 X109.97 Y122.118 E.0171
G1 X109.417 Y122.173 E.0171
G1 X108.863 Y122.118 E.0171
G1 X108.33 Y121.957 E.0171
G1 X107.839 Y121.694 E.0171
G1 X107.409 Y121.341 E.0171
G1 X107.056 Y120.911 E.0171
G1 X106.794 Y120.42 E.0171
G1 X106.632 Y119.888 E.0171
G1 X106.578 Y119.334 E.0171
G1 X106.632 Y118.78 E.0171
G1 X106.794 Y118.247 E.0171
G1 X107.056 Y117.757 E.0171
G1 X107.409 Y117.326 E.0171
G1 X107.839 Y116.973 E.0171
G1 X108.33 Y116.711 E.0171
G1 X108.863 Y116.549 E.0171
G1 X109.339 Y116.502 E.01471
M204 S10000
; WIPE_START
G1 F24000
G1 X109.417 Y116.495 E-.0296
G1 X109.817 Y116.534 E-.15293
G1 X109.97 Y116.549 E-.05855
G1 X110.503 Y116.711 E-.21149
G1 X110.994 Y116.973 E-.21148
G1 X111.189 Y117.133 E-.09595
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I1.217 J-.01 P1  F30000
G1 X111.058 Y101.505 Z2.4
G1 Z2
G1 E.8 F1800
M204 S5000
G1 F2215
G1 X111.037 Y101.528 E.00098
G1 X110.91 Y101.662 E.00565
G1 X110.416 Y101.997 E.01835
G1 X109.861 Y102.218 E.01835
G1 X109.272 Y102.315 E.01835
G1 X108.676 Y102.282 E.01835
G1 X108.1 Y102.122 E.01835
G1 X107.573 Y101.843 E.01835
G1 X107.433 Y101.724 E.00565
G1 X107.118 Y101.456 E.01269
G1 X106.756 Y100.981 E.01835
G1 X106.506 Y100.439 E.01835
G1 X106.377 Y99.856 E.01835
G1 X106.377 Y99.259 E.01835
G1 X106.506 Y98.676 E.01835
G1 X106.756 Y98.134 E.01835
G1 X107.118 Y97.658 E.01835
G1 X107.573 Y97.272 E.01835
G1 X108.1 Y96.992 E.01835
G1 X108.676 Y96.832 E.01835
G1 X109.088 Y96.81 E.01269
G1 X109.272 Y96.8 E.00565
G1 X109.861 Y96.897 E.01835
G1 X110.416 Y97.118 E.01835
G1 X110.91 Y97.453 E.01835
G1 X111.321 Y97.886 E.01835
G1 X111.628 Y98.398 E.01835
G1 X111.819 Y98.964 E.01835
G1 X111.884 Y99.557 E.01835
G1 X111.819 Y100.151 E.01835
G1 X111.628 Y100.717 E.01835
G1 X111.321 Y101.228 E.01835
G1 X111.1 Y101.462 E.00987
M204 S10000
; WIPE_START
G1 F24000
G1 X111.037 Y101.528 E-.03491
G1 X110.91 Y101.662 E-.06993
G1 X110.416 Y101.997 E-.22689
G1 X109.861 Y102.218 E-.22689
G1 X109.338 Y102.304 E-.20138
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I1.216 J-.051 P1  F30000
G1 X109.105 Y96.72 Z2.4
G1 Z2
G1 E.8 F1800
M204 S5000
G1 F2215
G1 X109.122 Y96.718 E.00055
G1 X109.523 Y96.758 E.01237
G1 X109.676 Y96.773 E.00473
G1 X110.209 Y96.934 E.0171
G1 X110.7 Y97.197 E.0171
G1 X111.13 Y97.55 E.0171
G1 X111.483 Y97.98 E.0171
G1 X111.745 Y98.471 E.0171
G1 X111.907 Y99.003 E.0171
G1 X111.961 Y99.557 E.0171
G1 X111.907 Y100.111 E.0171
G1 X111.745 Y100.644 E.0171
G1 X111.483 Y101.135 E.0171
G1 X111.13 Y101.565 E.0171
G1 X110.7 Y101.918 E.0171
G1 X110.209 Y102.18 E.0171
G1 X109.676 Y102.342 E.0171
G1 X109.122 Y102.396 E.0171
G1 X108.569 Y102.342 E.0171
G1 X108.036 Y102.18 E.0171
G1 X107.545 Y101.918 E.0171
G1 X107.115 Y101.565 E.0171
G1 X106.762 Y101.135 E.0171
G1 X106.5 Y100.644 E.0171
G1 X106.338 Y100.111 E.0171
G1 X106.283 Y99.557 E.0171
G1 X106.338 Y99.003 E.0171
G1 X106.5 Y98.471 E.0171
M73 P65 R3
G1 X106.762 Y97.98 E.0171
G1 X107.115 Y97.55 E.0171
G1 X107.545 Y97.197 E.0171
G1 X108.036 Y96.934 E.0171
G1 X108.569 Y96.773 E.0171
G1 X109.045 Y96.726 E.01471
M204 S10000
; WIPE_START
G1 F24000
G1 X109.122 Y96.718 E-.0296
G1 X109.523 Y96.758 E-.15293
G1 X109.676 Y96.773 E-.05855
G1 X110.209 Y96.934 E-.21149
G1 X110.7 Y97.197 E-.21148
G1 X110.895 Y97.357 E-.09595
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I1.216 J-.04 P1  F30000
G1 X110.276 Y78.69 Z2.4
G1 Z2
G1 E.8 F1800
M204 S5000
G1 F2215
G1 X110.254 Y78.713 E.00098
G1 X110.128 Y78.846 E.00565
G1 X109.634 Y79.181 E.01835
G1 X109.079 Y79.402 E.01835
G1 X108.49 Y79.499 E.01835
G1 X107.894 Y79.467 E.01835
G1 X107.318 Y79.307 E.01835
G1 X106.791 Y79.027 E.01835
G1 X106.65 Y78.908 E.00565
G1 X106.336 Y78.641 E.01269
G1 X105.974 Y78.165 E.01835
G1 X105.724 Y77.623 E.01835
G1 X105.595 Y77.04 E.01835
G1 X105.595 Y76.443 E.01835
G1 X105.724 Y75.86 E.01835
G1 X105.974 Y75.318 E.01835
G1 X106.336 Y74.843 E.01835
G1 X106.791 Y74.456 E.01835
G1 X107.318 Y74.177 E.01835
G1 X107.894 Y74.017 E.01835
G1 X108.306 Y73.995 E.01269
G1 X108.49 Y73.985 E.00565
G1 X109.079 Y74.081 E.01835
G1 X109.634 Y74.302 E.01835
G1 X110.128 Y74.637 E.01835
G1 X110.538 Y75.071 E.01835
G1 X110.846 Y75.582 E.01835
G1 X111.037 Y76.148 E.01835
G1 X111.102 Y76.742 E.01835
G1 X111.037 Y77.335 E.01835
G1 X110.846 Y77.901 E.01835
G1 X110.538 Y78.413 E.01835
G1 X110.318 Y78.646 E.00987
M204 S10000
; WIPE_START
G1 F24000
G1 X110.254 Y78.713 E-.03491
G1 X110.128 Y78.846 E-.06993
M73 P66 R3
G1 X109.634 Y79.181 E-.22689
G1 X109.079 Y79.402 E-.22689
G1 X108.556 Y79.488 E-.20138
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I1.216 J-.051 P1  F30000
G1 X108.322 Y73.905 Z2.4
G1 Z2
G1 E.8 F1800
M204 S5000
G1 F2215
G1 X108.34 Y73.903 E.00055
G1 X108.741 Y73.942 E.01237
G1 X108.894 Y73.957 E.00473
G1 X109.427 Y74.119 E.0171
G1 X109.918 Y74.381 E.0171
G1 X110.348 Y74.734 E.0171
G1 X110.701 Y75.164 E.0171
G1 X110.963 Y75.655 E.0171
G1 X111.125 Y76.188 E.0171
G1 X111.179 Y76.742 E.0171
G1 X111.125 Y77.296 E.0171
G1 X110.963 Y77.828 E.0171
G1 X110.701 Y78.319 E.0171
G1 X110.348 Y78.749 E.0171
G1 X109.918 Y79.102 E.0171
G1 X109.427 Y79.365 E.0171
G1 X108.894 Y79.526 E.0171
G1 X108.34 Y79.581 E.0171
G1 X107.786 Y79.526 E.0171
G1 X107.254 Y79.365 E.0171
G1 X106.763 Y79.102 E.0171
G1 X106.333 Y78.749 E.0171
G1 X105.98 Y78.319 E.0171
G1 X105.717 Y77.828 E.0171
G1 X105.556 Y77.296 E.0171
G1 X105.501 Y76.742 E.0171
G1 X105.556 Y76.188 E.0171
G1 X105.717 Y75.655 E.0171
G1 X105.98 Y75.164 E.0171
G1 X106.333 Y74.734 E.0171
G1 X106.763 Y74.381 E.0171
G1 X107.254 Y74.119 E.0171
G1 X107.786 Y73.957 E.0171
G1 X108.263 Y73.91 E.01471
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 2.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X108.34 Y73.903 E-.0296
G1 X108.741 Y73.942 E-.15293
G1 X108.894 Y73.957 E-.05855
G1 X109.427 Y74.119 E-.21149
G1 X109.918 Y74.381 E-.21148
G1 X110.113 Y74.541 E-.09595
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 11/32
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
G3 Z2.4 I-.731 J.973 P1  F30000
G1 X131.245 Y90.403 Z2.4
G1 Z2.2
G1 E.8 F1800
M204 S5000
G1 F2215
G1 X131.133 Y90.521 E.00499
G1 X130.639 Y90.856 E.01835
G1 X130.084 Y91.077 E.01835
G1 X129.495 Y91.174 E.01835
G1 X128.898 Y91.142 E.01835
G1 X128.323 Y90.982 E.01835
G1 X127.796 Y90.702 E.01835
G1 X127.341 Y90.316 E.01835
G1 X126.979 Y89.84 E.01835
G1 X126.728 Y89.298 E.01835
G1 X126.6 Y88.715 E.01835
G1 X126.6 Y88.118 E.01835
G1 X126.728 Y87.535 E.01835
G1 X126.979 Y86.993 E.01835
G1 X127.341 Y86.518 E.01835
G1 X127.796 Y86.131 E.01835
G1 X128.323 Y85.852 E.01835
G1 X128.898 Y85.692 E.01835
G1 X129.122 Y85.68 E.00689
G1 X129.495 Y85.66 E.01146
G1 X130.084 Y85.756 E.01835
G1 X130.639 Y85.977 E.01835
G1 X131.133 Y86.312 E.01835
G1 X131.543 Y86.746 E.01835
G1 X131.851 Y87.257 E.01835
G1 X132.042 Y87.823 E.01835
G1 X132.106 Y88.417 E.01835
G1 X132.042 Y89.01 E.01835
G1 X131.851 Y89.576 E.01835
G1 X131.543 Y90.088 E.01835
G1 X131.287 Y90.358 E.01146
G1 X131.286 Y90.36 E.00005
M204 S10000
; WIPE_START
G1 F24000
G1 X131.133 Y90.521 E-.08456
G1 X130.639 Y90.856 E-.22689
G1 X130.084 Y91.077 E-.22689
G1 X129.508 Y91.172 E-.22166
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I1.216 J-.043 P1  F30000
G1 X129.313 Y85.581 Z2.6
G1 Z2.2
G1 E.8 F1800
M204 S5000
G1 F2215
G1 X129.345 Y85.578 E.00101
G1 X129.542 Y85.597 E.00607
G1 X129.899 Y85.632 E.01103
G1 X130.432 Y85.794 E.0171
G1 X130.922 Y86.056 E.0171
G1 X131.353 Y86.409 E.0171
G1 X131.706 Y86.839 E.0171
G1 X131.968 Y87.33 E.0171
G1 X132.13 Y87.863 E.0171
G1 X132.184 Y88.417 E.0171
G1 X132.13 Y88.971 E.0171
G1 X131.968 Y89.503 E.0171
G1 X131.706 Y89.994 E.0171
G1 X131.353 Y90.424 E.0171
G1 X130.922 Y90.777 E.0171
G1 X130.432 Y91.04 E.0171
G1 X129.899 Y91.201 E.0171
G1 X129.345 Y91.256 E.0171
G1 X128.791 Y91.201 E.0171
G1 X128.259 Y91.04 E.0171
G1 X127.768 Y90.777 E.0171
G1 X127.338 Y90.424 E.0171
G1 X126.985 Y89.994 E.0171
G1 X126.722 Y89.503 E.0171
G1 X126.561 Y88.971 E.0171
G1 X126.506 Y88.417 E.0171
G1 X126.561 Y87.863 E.0171
G1 X126.722 Y87.33 E.0171
G1 X126.985 Y86.839 E.0171
G1 X127.338 Y86.409 E.0171
G1 X127.768 Y86.056 E.0171
G1 X128.259 Y85.794 E.0171
G1 X128.791 Y85.632 E.0171
G1 X129.253 Y85.587 E.01425
M204 S10000
; WIPE_START
G1 F24000
G1 X129.345 Y85.578 E-.03526
G1 X129.542 Y85.597 E-.07512
G1 X129.899 Y85.632 E-.13636
G1 X130.432 Y85.794 E-.21149
G1 X130.922 Y86.056 E-.21148
G1 X131.106 Y86.207 E-.09029
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I-1.217 J-.005 P1  F30000
G1 X131.001 Y112.383 Z2.6
G1 Z2.2
G1 E.8 F1800
M204 S5000
G1 F2215
G1 X130.889 Y112.501 E.00499
G1 X130.395 Y112.836 E.01835
G1 X129.841 Y113.057 E.01835
G1 X129.251 Y113.154 E.01835
G1 X128.655 Y113.121 E.01835
G1 X128.08 Y112.961 E.01835
G1 X127.552 Y112.682 E.01835
G1 X127.097 Y112.295 E.01835
G1 X126.736 Y111.82 E.01835
G1 X126.485 Y111.278 E.01835
G1 X126.357 Y110.695 E.01835
G1 X126.357 Y110.098 E.01835
G1 X126.485 Y109.515 E.01835
G1 X126.736 Y108.973 E.01835
G1 X127.097 Y108.497 E.01835
G1 X127.552 Y108.111 E.01835
G1 X128.08 Y107.831 E.01835
G1 X128.655 Y107.672 E.01835
G1 X128.879 Y107.659 E.00689
G1 X129.251 Y107.639 E.01146
G1 X129.841 Y107.736 E.01835
G1 X130.395 Y107.957 E.01835
G1 X130.889 Y108.292 E.01835
G1 X131.3 Y108.725 E.01835
G1 X131.608 Y109.237 E.01835
G1 X131.798 Y109.803 E.01835
G1 X131.863 Y110.396 E.01835
G1 X131.798 Y110.99 E.01835
G1 X131.608 Y111.556 E.01835
G1 X131.3 Y112.067 E.01835
G1 X131.044 Y112.338 E.01146
G1 X131.042 Y112.339 E.00005
M204 S10000
; WIPE_START
G1 F24000
G1 X130.889 Y112.501 E-.08456
G1 X130.395 Y112.836 E-.22689
G1 X129.841 Y113.057 E-.22689
G1 X129.265 Y113.151 E-.22166
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I1.216 J-.043 P1  F30000
G1 X129.069 Y107.561 Z2.6
G1 Z2.2
G1 E.8 F1800
M204 S5000
G1 F2215
G1 X129.102 Y107.557 E.00101
G1 X129.299 Y107.577 E.00607
G1 X129.656 Y107.612 E.01103
G1 X130.188 Y107.773 E.0171
G1 X130.679 Y108.036 E.0171
G1 X131.109 Y108.389 E.0171
G1 X131.462 Y108.819 E.0171
G1 X131.725 Y109.31 E.0171
G1 X131.886 Y109.843 E.0171
G1 X131.941 Y110.396 E.0171
G1 X131.886 Y110.95 E.0171
G1 X131.725 Y111.483 E.0171
G1 X131.462 Y111.974 E.0171
G1 X131.109 Y112.404 E.0171
G1 X130.679 Y112.757 E.0171
G1 X130.188 Y113.019 E.0171
G1 X129.656 Y113.181 E.0171
G1 X129.102 Y113.235 E.0171
G1 X128.548 Y113.181 E.0171
G1 X128.015 Y113.019 E.0171
G1 X127.525 Y112.757 E.0171
G1 X127.094 Y112.404 E.0171
G1 X126.741 Y111.974 E.0171
G1 X126.479 Y111.483 E.0171
G1 X126.317 Y110.95 E.0171
G1 X126.263 Y110.396 E.0171
G1 X126.317 Y109.843 E.0171
G1 X126.479 Y109.31 E.0171
G1 X126.741 Y108.819 E.0171
G1 X127.094 Y108.389 E.0171
G1 X127.525 Y108.036 E.0171
G1 X128.015 Y107.773 E.0171
G1 X128.548 Y107.612 E.0171
G1 X129.009 Y107.566 E.01425
M204 S10000
; WIPE_START
G1 F24000
G1 X129.102 Y107.557 E-.03526
G1 X129.299 Y107.577 E-.07512
G1 X129.656 Y107.612 E-.13636
G1 X130.188 Y107.773 E-.21149
G1 X130.679 Y108.036 E-.21148
G1 X130.863 Y108.187 E-.09029
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I-1.216 J.058 P1  F30000
G1 X131.899 Y129.987 Z2.6
G1 Z2.2
G1 E.8 F1800
M204 S5000
G1 F2215
G1 X131.788 Y130.105 E.00499
G1 X131.293 Y130.44 E.01835
G1 X130.739 Y130.661 E.01835
G1 X130.149 Y130.757 E.01835
G1 X129.553 Y130.725 E.01835
G1 X128.978 Y130.565 E.01835
G1 X128.45 Y130.285 E.01835
G1 X127.995 Y129.899 E.01835
G1 X127.634 Y129.424 E.01835
G1 X127.383 Y128.882 E.01835
G1 X127.255 Y128.299 E.01835
G1 X127.255 Y127.701 E.01835
G1 X127.383 Y127.118 E.01835
G1 X127.634 Y126.576 E.01835
G1 X127.995 Y126.101 E.01835
G1 X128.45 Y125.715 E.01835
G1 X128.978 Y125.435 E.01835
G1 X129.553 Y125.275 E.01835
G1 X129.777 Y125.263 E.00689
G1 X130.149 Y125.243 E.01146
G1 X130.739 Y125.339 E.01835
G1 X131.293 Y125.56 E.01835
G1 X131.788 Y125.895 E.01835
G1 X132.198 Y126.329 E.01835
G1 X132.506 Y126.841 E.01835
G1 X132.697 Y127.406 E.01835
G1 X132.761 Y128 E.01835
G1 X132.697 Y128.594 E.01835
G1 X132.506 Y129.159 E.01835
G1 X132.198 Y129.671 E.01835
G1 X131.942 Y129.942 E.01146
G1 X131.941 Y129.943 E.00005
M204 S10000
; WIPE_START
G1 F24000
G1 X131.788 Y130.105 E-.08456
G1 X131.293 Y130.44 E-.22689
G1 X130.739 Y130.661 E-.22689
G1 X130.163 Y130.755 E-.22166
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I1.216 J-.043 P1  F30000
G1 X129.967 Y125.164 Z2.6
G1 Z2.2
G1 E.8 F1800
M204 S5000
G1 F2215
G1 X130 Y125.161 E.00101
G1 X130.197 Y125.18 E.00607
G1 X130.554 Y125.216 E.01103
G1 X131.086 Y125.377 E.0171
G1 X131.577 Y125.639 E.0171
G1 X132.007 Y125.993 E.0171
G1 X132.361 Y126.423 E.0171
G1 X132.623 Y126.914 E.0171
G1 X132.784 Y127.446 E.0171
G1 X132.839 Y128 E.0171
G1 X132.784 Y128.554 E.0171
G1 X132.623 Y129.086 E.0171
G1 X132.361 Y129.577 E.0171
G1 X132.007 Y130.007 E.0171
G1 X131.577 Y130.361 E.0171
G1 X131.086 Y130.623 E.0171
G1 X130.554 Y130.784 E.0171
G1 X130 Y130.839 E.0171
G1 X129.446 Y130.784 E.0171
G1 X128.914 Y130.623 E.0171
G1 X128.423 Y130.361 E.0171
G1 X127.993 Y130.007 E.0171
G1 X127.639 Y129.577 E.0171
G1 X127.377 Y129.086 E.0171
G1 X127.216 Y128.554 E.0171
G1 X127.161 Y128 E.0171
G1 X127.216 Y127.446 E.0171
G1 X127.377 Y126.914 E.0171
G1 X127.639 Y126.423 E.0171
G1 X127.993 Y125.993 E.0171
G1 X128.423 Y125.639 E.0171
G1 X128.914 Y125.377 E.0171
G1 X129.446 Y125.216 E.0171
G1 X129.908 Y125.17 E.01425
M204 S10000
; WIPE_START
G1 F24000
G1 X130 Y125.161 E-.03526
G1 X130.197 Y125.18 E-.07512
G1 X130.554 Y125.216 E-.13636
G1 X131.086 Y125.377 E-.21149
G1 X131.577 Y125.639 E-.21148
G1 X131.761 Y125.79 E-.09029
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I-.735 J-.97 P1  F30000
G1 X111.312 Y141.286 Z2.6
G1 Z2.2
G1 E.8 F1800
M204 S5000
G1 F2215
G1 X111.301 Y141.297 E.00046
G1 X111.163 Y141.443 E.00618
G1 X110.669 Y141.778 E.01835
G1 X110.114 Y141.999 E.01835
G1 X109.525 Y142.096 E.01835
G1 X108.929 Y142.063 E.01835
G1 X108.353 Y141.904 E.01835
G1 X107.826 Y141.624 E.01835
G1 X107.371 Y141.237 E.01835
G1 X107.009 Y140.762 E.01835
G1 X106.759 Y140.22 E.01835
G1 X106.63 Y139.637 E.01835
G1 X106.63 Y139.04 E.01835
G1 X106.759 Y138.457 E.01835
G1 X107.009 Y137.915 E.01835
G1 X107.371 Y137.44 E.01835
G1 X107.826 Y137.053 E.01835
G1 X108.353 Y136.773 E.01835
G1 X108.929 Y136.614 E.01835
G1 X109.324 Y136.592 E.01217
G1 X109.525 Y136.581 E.00618
G1 X110.114 Y136.678 E.01835
G1 X110.669 Y136.899 E.01835
G1 X111.163 Y137.234 E.01835
G1 X111.574 Y137.667 E.01835
G1 X111.881 Y138.179 E.01835
G1 X112.072 Y138.745 E.01835
G1 X112.137 Y139.339 E.01835
G1 X112.072 Y139.932 E.01835
G1 X111.881 Y140.498 E.01835
G1 X111.574 Y141.01 E.01835
G1 X111.353 Y141.243 E.00986
M204 S10000
; WIPE_START
G1 F24000
G1 X111.301 Y141.297 E-.02853
G1 X111.163 Y141.443 E-.07637
G1 X110.669 Y141.778 E-.22689
G1 X110.114 Y141.999 E-.22689
G1 X109.591 Y142.085 E-.20131
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I1.216 J-.055 P1  F30000
G1 X109.34 Y136.503 Z2.6
G1 Z2.2
G1 E.8 F1800
M204 S5000
G1 F2215
G1 X109.375 Y136.5 E.00109
G1 X109.758 Y136.537 E.0118
G1 X109.929 Y136.554 E.0053
G1 X110.462 Y136.716 E.0171
G1 X110.953 Y136.978 E.0171
G1 X111.383 Y137.331 E.0171
G1 X111.736 Y137.761 E.0171
G1 X111.998 Y138.252 E.0171
G1 X112.16 Y138.785 E.0171
G1 X112.214 Y139.339 E.0171
G1 X112.16 Y139.892 E.0171
G1 X111.998 Y140.425 E.0171
G1 X111.736 Y140.916 E.0171
G1 X111.383 Y141.346 E.0171
G1 X110.953 Y141.699 E.0171
G1 X110.462 Y141.961 E.0171
G1 X109.929 Y142.123 E.0171
G1 X109.375 Y142.177 E.0171
G1 X108.822 Y142.123 E.0171
G1 X108.289 Y141.961 E.0171
G1 X107.798 Y141.699 E.0171
G1 X107.368 Y141.346 E.0171
G1 X107.015 Y140.916 E.0171
G1 X106.752 Y140.425 E.0171
G1 X106.591 Y139.892 E.0171
G1 X106.536 Y139.339 E.0171
G1 X106.591 Y138.785 E.0171
G1 X106.752 Y138.252 E.0171
G1 X107.015 Y137.761 E.0171
G1 X107.368 Y137.331 E.0171
G1 X107.798 Y136.978 E.0171
G1 X108.289 Y136.716 E.0171
G1 X108.822 Y136.554 E.0171
G1 X109.28 Y136.509 E.01416
M204 S10000
; WIPE_START
G1 F24000
G1 X109.375 Y136.5 E-.03633
G1 X109.758 Y136.537 E-.14594
G1 X109.929 Y136.554 E-.06554
G1 X110.462 Y136.716 E-.21149
G1 X110.953 Y136.978 E-.21148
G1 X111.134 Y137.127 E-.08922
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I1.217 J.017 P1  F30000
G1 X111.353 Y121.281 Z2.6
G1 Z2.2
G1 E.8 F1800
M204 S5000
G1 F2215
G1 X111.342 Y121.292 E.00046
G1 X111.204 Y121.438 E.00618
G1 X110.71 Y121.773 E.01835
G1 X110.155 Y121.994 E.01835
G1 X109.566 Y122.091 E.01835
G1 X108.97 Y122.059 E.01835
G1 X108.394 Y121.899 E.01835
G1 X107.867 Y121.619 E.01835
G1 X107.412 Y121.233 E.01835
G1 X107.051 Y120.757 E.01835
G1 X106.8 Y120.215 E.01835
G1 X106.671 Y119.632 E.01835
G1 X106.671 Y119.035 E.01835
G1 X106.8 Y118.452 E.01835
G1 X107.051 Y117.91 E.01835
G1 X107.412 Y117.435 E.01835
M73 P67 R3
G1 X107.867 Y117.048 E.01835
G1 X108.394 Y116.769 E.01835
G1 X108.97 Y116.609 E.01835
G1 X109.365 Y116.588 E.01217
G1 X109.566 Y116.577 E.00618
G1 X110.155 Y116.673 E.01835
G1 X110.71 Y116.894 E.01835
G1 X111.204 Y117.229 E.01835
G1 X111.615 Y117.663 E.01835
G1 X111.923 Y118.174 E.01835
G1 X112.113 Y118.74 E.01835
G1 X112.178 Y119.334 E.01835
G1 X112.113 Y119.927 E.01835
G1 X111.923 Y120.493 E.01835
G1 X111.615 Y121.005 E.01835
G1 X111.394 Y121.238 E.00986
M204 S10000
; WIPE_START
G1 F24000
G1 X111.342 Y121.292 E-.02853
G1 X111.204 Y121.438 E-.07637
G1 X110.71 Y121.773 E-.22689
G1 X110.155 Y121.994 E-.22689
G1 X109.632 Y122.08 E-.20131
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I1.216 J-.055 P1  F30000
G1 X109.381 Y116.498 Z2.6
G1 Z2.2
G1 E.8 F1800
M204 S5000
G1 F2215
G1 X109.417 Y116.495 E.00109
G1 X109.799 Y116.532 E.0118
G1 X109.97 Y116.549 E.0053
G1 X110.503 Y116.711 E.0171
G1 X110.994 Y116.973 E.0171
G1 X111.424 Y117.326 E.0171
G1 X111.777 Y117.757 E.0171
G1 X112.039 Y118.247 E.0171
G1 X112.201 Y118.78 E.0171
G1 X112.256 Y119.334 E.0171
G1 X112.201 Y119.888 E.0171
G1 X112.039 Y120.42 E.0171
G1 X111.777 Y120.911 E.0171
G1 X111.424 Y121.341 E.0171
G1 X110.994 Y121.694 E.0171
G1 X110.503 Y121.957 E.0171
G1 X109.97 Y122.118 E.0171
G1 X109.417 Y122.173 E.0171
G1 X108.863 Y122.118 E.0171
G1 X108.33 Y121.957 E.0171
G1 X107.839 Y121.694 E.0171
G1 X107.409 Y121.341 E.0171
G1 X107.056 Y120.911 E.0171
G1 X106.794 Y120.42 E.0171
G1 X106.632 Y119.888 E.0171
G1 X106.578 Y119.334 E.0171
G1 X106.632 Y118.78 E.0171
G1 X106.794 Y118.247 E.0171
G1 X107.056 Y117.757 E.0171
G1 X107.409 Y117.326 E.0171
G1 X107.839 Y116.973 E.0171
G1 X108.33 Y116.711 E.0171
G1 X108.863 Y116.549 E.0171
G1 X109.321 Y116.504 E.01416
M204 S10000
; WIPE_START
G1 F24000
G1 X109.417 Y116.495 E-.03633
G1 X109.799 Y116.532 E-.14594
G1 X109.97 Y116.549 E-.06554
G1 X110.503 Y116.711 E-.21149
G1 X110.994 Y116.973 E-.21148
G1 X111.175 Y117.122 E-.08922
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I1.217 J-.009 P1  F30000
G1 X111.059 Y101.505 Z2.6
G1 Z2.2
G1 E.8 F1800
M204 S5000
G1 F2215
G1 X111.048 Y101.516 E.00046
G1 X110.91 Y101.662 E.00618
G1 X110.416 Y101.997 E.01835
G1 X109.861 Y102.218 E.01835
G1 X109.272 Y102.315 E.01835
G1 X108.676 Y102.282 E.01835
G1 X108.1 Y102.122 E.01835
G1 X107.573 Y101.843 E.01835
G1 X107.118 Y101.456 E.01835
G1 X106.756 Y100.981 E.01835
G1 X106.506 Y100.439 E.01835
G1 X106.377 Y99.856 E.01835
G1 X106.377 Y99.259 E.01835
G1 X106.506 Y98.676 E.01835
G1 X106.756 Y98.134 E.01835
G1 X107.118 Y97.658 E.01835
G1 X107.573 Y97.272 E.01835
G1 X108.1 Y96.992 E.01835
G1 X108.676 Y96.832 E.01835
G1 X109.071 Y96.811 E.01217
G1 X109.272 Y96.8 E.00618
G1 X109.861 Y96.897 E.01835
G1 X110.416 Y97.118 E.01835
G1 X110.91 Y97.453 E.01835
G1 X111.321 Y97.886 E.01835
G1 X111.628 Y98.398 E.01835
G1 X111.819 Y98.964 E.01835
G1 X111.884 Y99.557 E.01835
G1 X111.819 Y100.151 E.01835
G1 X111.628 Y100.717 E.01835
G1 X111.321 Y101.228 E.01835
G1 X111.1 Y101.461 E.00986
M204 S10000
; WIPE_START
G1 F24000
G1 X111.048 Y101.516 E-.02853
G1 X110.91 Y101.662 E-.07637
G1 X110.416 Y101.997 E-.22689
G1 X109.861 Y102.218 E-.22689
G1 X109.338 Y102.304 E-.20131
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I1.216 J-.055 P1  F30000
G1 X109.087 Y96.722 Z2.6
G1 Z2.2
G1 E.8 F1800
M204 S5000
G1 F2215
G1 X109.122 Y96.718 E.00109
G1 X109.505 Y96.756 E.0118
G1 X109.676 Y96.773 E.0053
G1 X110.209 Y96.934 E.0171
G1 X110.7 Y97.197 E.0171
G1 X111.13 Y97.55 E.0171
G1 X111.483 Y97.98 E.0171
G1 X111.745 Y98.471 E.0171
G1 X111.907 Y99.003 E.0171
G1 X111.961 Y99.557 E.0171
G1 X111.907 Y100.111 E.0171
G1 X111.745 Y100.644 E.0171
G1 X111.483 Y101.135 E.0171
G1 X111.13 Y101.565 E.0171
G1 X110.7 Y101.918 E.0171
G1 X110.209 Y102.18 E.0171
G1 X109.676 Y102.342 E.0171
G1 X109.122 Y102.396 E.0171
G1 X108.569 Y102.342 E.0171
G1 X108.036 Y102.18 E.0171
G1 X107.545 Y101.918 E.0171
G1 X107.115 Y101.565 E.0171
G1 X106.762 Y101.135 E.0171
G1 X106.5 Y100.644 E.0171
G1 X106.338 Y100.111 E.0171
G1 X106.283 Y99.557 E.0171
G1 X106.338 Y99.003 E.0171
G1 X106.5 Y98.471 E.0171
G1 X106.762 Y97.98 E.0171
G1 X107.115 Y97.55 E.0171
G1 X107.545 Y97.197 E.0171
G1 X108.036 Y96.934 E.0171
G1 X108.569 Y96.773 E.0171
G1 X109.027 Y96.728 E.01416
M204 S10000
; WIPE_START
G1 F24000
G1 X109.122 Y96.718 E-.03633
G1 X109.505 Y96.756 E-.14594
G1 X109.676 Y96.773 E-.06554
G1 X110.209 Y96.934 E-.21149
G1 X110.7 Y97.197 E-.21148
G1 X110.881 Y97.346 E-.08922
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I1.216 J-.039 P1  F30000
G1 X110.276 Y78.689 Z2.6
G1 Z2.2
G1 E.8 F1800
M204 S5000
G1 F2215
G1 X110.266 Y78.7 E.00046
G1 X110.128 Y78.846 E.00618
G1 X109.634 Y79.181 E.01835
G1 X109.079 Y79.402 E.01835
G1 X108.49 Y79.499 E.01835
G1 X107.894 Y79.467 E.01835
G1 X107.318 Y79.307 E.01835
G1 X106.791 Y79.027 E.01835
G1 X106.336 Y78.641 E.01835
G1 X105.974 Y78.165 E.01835
G1 X105.724 Y77.623 E.01835
G1 X105.595 Y77.04 E.01835
G1 X105.595 Y76.443 E.01835
G1 X105.724 Y75.86 E.01835
G1 X105.974 Y75.318 E.01835
G1 X106.336 Y74.843 E.01835
G1 X106.791 Y74.456 E.01835
G1 X107.318 Y74.177 E.01835
G1 X107.894 Y74.017 E.01835
G1 X108.289 Y73.995 E.01217
G1 X108.49 Y73.985 E.00618
G1 X109.079 Y74.081 E.01835
G1 X109.634 Y74.302 E.01835
G1 X110.128 Y74.637 E.01835
G1 X110.538 Y75.071 E.01835
G1 X110.846 Y75.582 E.01835
G1 X111.037 Y76.148 E.01835
G1 X111.102 Y76.742 E.01835
G1 X111.037 Y77.335 E.01835
G1 X110.846 Y77.901 E.01835
G1 X110.538 Y78.413 E.01835
G1 X110.318 Y78.646 E.00986
M204 S10000
; WIPE_START
G1 F24000
G1 X110.266 Y78.7 E-.02853
G1 X110.128 Y78.846 E-.07637
G1 X109.634 Y79.181 E-.22689
G1 X109.079 Y79.402 E-.22689
G1 X108.556 Y79.488 E-.20131
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I1.216 J-.055 P1  F30000
G1 X108.305 Y73.906 Z2.6
G1 Z2.2
G1 E.8 F1800
M204 S5000
G1 F2215
G1 X108.34 Y73.903 E.00109
G1 X108.722 Y73.94 E.0118
G1 X108.894 Y73.957 E.0053
G1 X109.427 Y74.119 E.0171
G1 X109.918 Y74.381 E.0171
G1 X110.348 Y74.734 E.0171
G1 X110.701 Y75.164 E.0171
G1 X110.963 Y75.655 E.0171
G1 X111.125 Y76.188 E.0171
G1 X111.179 Y76.742 E.0171
G1 X111.125 Y77.296 E.0171
G1 X110.963 Y77.828 E.0171
G1 X110.701 Y78.319 E.0171
G1 X110.348 Y78.749 E.0171
G1 X109.918 Y79.102 E.0171
G1 X109.427 Y79.365 E.0171
G1 X108.894 Y79.526 E.0171
G1 X108.34 Y79.581 E.0171
G1 X107.786 Y79.526 E.0171
G1 X107.254 Y79.365 E.0171
G1 X106.763 Y79.102 E.0171
G1 X106.333 Y78.749 E.0171
G1 X105.98 Y78.319 E.0171
G1 X105.717 Y77.828 E.0171
G1 X105.556 Y77.296 E.0171
G1 X105.501 Y76.742 E.0171
G1 X105.556 Y76.188 E.0171
G1 X105.717 Y75.655 E.0171
G1 X105.98 Y75.164 E.0171
G1 X106.333 Y74.734 E.0171
G1 X106.763 Y74.381 E.0171
G1 X107.254 Y74.119 E.0171
G1 X107.786 Y73.957 E.0171
G1 X108.245 Y73.912 E.01416
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 2.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X108.34 Y73.903 E-.03633
G1 X108.722 Y73.94 E-.14594
G1 X108.894 Y73.957 E-.06554
G1 X109.427 Y74.119 E-.21149
G1 X109.918 Y74.381 E-.21148
G1 X110.099 Y74.53 E-.08922
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 12/32
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
G3 Z2.6 I-.61 J1.053 P1  F30000
G1 X129.32 Y85.669 Z2.6
G1 Z2.4
G1 E.8 F1800
M204 S5000
G1 F2194
G1 X129.495 Y85.66 E.00538
G1 X130.084 Y85.756 E.01835
G1 X130.639 Y85.977 E.01835
G1 X131.133 Y86.312 E.01835
G1 X131.543 Y86.746 E.01835
G1 X131.851 Y87.257 E.01835
G1 X132.042 Y87.823 E.01835
G1 X132.106 Y88.417 E.01835
G1 X132.042 Y89.01 E.01835
G1 X131.851 Y89.576 E.01835
G1 X131.543 Y90.088 E.01835
G1 X131.133 Y90.521 E.01835
G1 X130.639 Y90.856 E.01835
G1 X130.084 Y91.077 E.01835
G1 X129.495 Y91.174 E.01835
G1 X128.898 Y91.142 E.01835
G1 X128.323 Y90.982 E.01835
G1 X127.796 Y90.702 E.01835
G1 X127.341 Y90.316 E.01835
G1 X126.979 Y89.84 E.01835
G1 X126.728 Y89.298 E.01835
G1 X126.6 Y88.715 E.01835
G1 X126.6 Y88.118 E.01835
G1 X126.728 Y87.535 E.01835
G1 X126.979 Y86.993 E.01835
G1 X127.341 Y86.518 E.01835
G1 X127.796 Y86.131 E.01835
G1 X128.323 Y85.852 E.01835
G1 X128.898 Y85.692 E.01835
G1 X129.141 Y85.679 E.00748
G1 X129.26 Y85.672 E.00365
M204 S10000
; WIPE_START
G1 F24000
G1 X129.495 Y85.66 E-.08931
G1 X130.084 Y85.756 E-.22689
G1 X130.639 Y85.977 E-.22689
G1 X131.111 Y86.297 E-.2169
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I-1.216 J.057 P1  F30000
G1 X131.306 Y90.462 Z2.8
G1 Z2.4
G1 E.8 F1800
M204 S5000
G1 F2194
G1 X130.922 Y90.777 E.01526
G1 X130.432 Y91.04 E.0171
G1 X129.899 Y91.201 E.0171
G1 X129.345 Y91.256 E.0171
G1 X128.791 Y91.201 E.0171
G1 X128.259 Y91.04 E.0171
G1 X127.768 Y90.777 E.0171
G1 X127.338 Y90.424 E.0171
G1 X126.985 Y89.994 E.0171
G1 X126.722 Y89.503 E.0171
G1 X126.561 Y88.971 E.0171
G1 X126.506 Y88.417 E.0171
G1 X126.561 Y87.863 E.0171
G1 X126.722 Y87.33 E.0171
G1 X126.985 Y86.839 E.0171
G1 X127.338 Y86.409 E.0171
G1 X127.768 Y86.056 E.0171
G1 X128.259 Y85.794 E.0171
G1 X128.791 Y85.632 E.0171
G1 X129.345 Y85.578 E.0171
G1 X129.563 Y85.599 E.00671
G1 X129.899 Y85.632 E.01039
G1 X130.432 Y85.794 E.0171
G1 X130.922 Y86.056 E.0171
G1 X131.353 Y86.409 E.0171
G1 X131.706 Y86.839 E.0171
G1 X131.968 Y87.33 E.0171
G1 X132.13 Y87.863 E.0171
G1 X132.184 Y88.417 E.0171
G1 X132.13 Y88.971 E.0171
G1 X131.968 Y89.503 E.0171
G1 X131.706 Y89.994 E.0171
G1 X131.353 Y90.424 E.0171
M204 S10000
; WIPE_START
G1 F24000
G1 X130.922 Y90.777 E-.21149
G1 X130.432 Y91.04 E-.21149
G1 X129.899 Y91.201 E-.21148
G1 X129.57 Y91.234 E-.12554
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I-1.216 J-.037 P1  F30000
G1 X129.077 Y107.649 Z2.8
G1 Z2.4
G1 E.8 F1800
M204 S5000
G1 F2194
G1 X129.251 Y107.639 E.00538
G1 X129.841 Y107.736 E.01835
G1 X130.395 Y107.957 E.01835
G1 X130.889 Y108.292 E.01835
G1 X131.3 Y108.725 E.01835
G1 X131.608 Y109.237 E.01835
G1 X131.798 Y109.803 E.01835
G1 X131.863 Y110.396 E.01835
G1 X131.798 Y110.99 E.01835
G1 X131.608 Y111.556 E.01835
G1 X131.3 Y112.067 E.01835
G1 X130.889 Y112.501 E.01835
G1 X130.395 Y112.836 E.01835
G1 X129.841 Y113.057 E.01835
G1 X129.251 Y113.154 E.01835
G1 X128.655 Y113.121 E.01835
G1 X128.08 Y112.961 E.01835
G1 X127.552 Y112.682 E.01835
G1 X127.097 Y112.295 E.01835
G1 X126.736 Y111.82 E.01835
G1 X126.485 Y111.278 E.01835
G1 X126.357 Y110.695 E.01835
G1 X126.357 Y110.098 E.01835
G1 X126.485 Y109.515 E.01835
G1 X126.736 Y108.973 E.01835
G1 X127.097 Y108.497 E.01835
G1 X127.552 Y108.111 E.01835
G1 X128.08 Y107.831 E.01835
G1 X128.655 Y107.672 E.01835
G1 X128.898 Y107.658 E.00748
G1 X129.017 Y107.652 E.00365
M204 S10000
; WIPE_START
G1 F24000
G1 X129.251 Y107.639 E-.08931
G1 X129.841 Y107.736 E-.22689
G1 X130.395 Y107.957 E-.22689
G1 X130.868 Y108.277 E-.2169
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I-1.216 J.057 P1  F30000
G1 X131.063 Y112.442 Z2.8
G1 Z2.4
G1 E.8 F1800
M204 S5000
G1 F2194
G1 X130.679 Y112.757 E.01526
G1 X130.188 Y113.019 E.0171
G1 X129.656 Y113.181 E.0171
G1 X129.102 Y113.235 E.0171
G1 X128.548 Y113.181 E.0171
G1 X128.015 Y113.019 E.0171
G1 X127.525 Y112.757 E.0171
G1 X127.094 Y112.404 E.0171
G1 X126.741 Y111.974 E.0171
G1 X126.479 Y111.483 E.0171
G1 X126.317 Y110.95 E.0171
G1 X126.263 Y110.396 E.0171
G1 X126.317 Y109.843 E.0171
G1 X126.479 Y109.31 E.0171
G1 X126.741 Y108.819 E.0171
G1 X127.094 Y108.389 E.0171
G1 X127.525 Y108.036 E.0171
G1 X128.015 Y107.773 E.0171
G1 X128.548 Y107.612 E.0171
G1 X129.102 Y107.557 E.0171
G1 X129.319 Y107.579 E.00671
G1 X129.656 Y107.612 E.01039
G1 X130.188 Y107.773 E.0171
G1 X130.679 Y108.036 E.0171
G1 X131.109 Y108.389 E.0171
G1 X131.462 Y108.819 E.0171
G1 X131.725 Y109.31 E.0171
G1 X131.886 Y109.843 E.0171
G1 X131.941 Y110.396 E.0171
G1 X131.886 Y110.95 E.0171
G1 X131.725 Y111.483 E.0171
G1 X131.462 Y111.974 E.0171
G1 X131.109 Y112.404 E.0171
M204 S10000
; WIPE_START
G1 F24000
G1 X130.679 Y112.757 E-.21149
G1 X130.188 Y113.019 E-.21149
G1 X129.656 Y113.181 E-.21148
G1 X129.327 Y113.213 E-.12554
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I-1.215 J.065 P1  F30000
G1 X129.975 Y125.252 Z2.8
G1 Z2.4
G1 E.8 F1800
M204 S5000
G1 F2194
G1 X130.149 Y125.243 E.00538
G1 X130.739 Y125.339 E.01835
G1 X131.293 Y125.56 E.01835
G1 X131.788 Y125.895 E.01835
G1 X132.198 Y126.329 E.01835
M73 P68 R3
G1 X132.506 Y126.841 E.01835
G1 X132.697 Y127.406 E.01835
G1 X132.761 Y128 E.01835
G1 X132.697 Y128.594 E.01835
G1 X132.506 Y129.159 E.01835
G1 X132.198 Y129.671 E.01835
G1 X131.788 Y130.105 E.01835
G1 X131.293 Y130.44 E.01835
G1 X130.739 Y130.661 E.01835
G1 X130.149 Y130.757 E.01835
G1 X129.553 Y130.725 E.01835
G1 X128.978 Y130.565 E.01835
G1 X128.45 Y130.285 E.01835
G1 X127.995 Y129.899 E.01835
G1 X127.634 Y129.424 E.01835
G1 X127.383 Y128.882 E.01835
G1 X127.255 Y128.299 E.01835
G1 X127.255 Y127.701 E.01835
G1 X127.383 Y127.118 E.01835
G1 X127.634 Y126.576 E.01835
G1 X127.995 Y126.101 E.01835
G1 X128.45 Y125.715 E.01835
G1 X128.978 Y125.435 E.01835
G1 X129.553 Y125.275 E.01835
G1 X129.796 Y125.262 E.00748
G1 X129.915 Y125.256 E.00365
M204 S10000
; WIPE_START
G1 F24000
G1 X130.149 Y125.243 E-.08931
G1 X130.739 Y125.339 E-.22689
G1 X131.293 Y125.56 E-.22689
G1 X131.766 Y125.881 E-.2169
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I-1.216 J.057 P1  F30000
G1 X131.961 Y130.046 Z2.8
G1 Z2.4
G1 E.8 F1800
M204 S5000
G1 F2194
G1 X131.577 Y130.361 E.01526
G1 X131.086 Y130.623 E.0171
G1 X130.554 Y130.784 E.0171
G1 X130 Y130.839 E.0171
G1 X129.446 Y130.784 E.0171
G1 X128.914 Y130.623 E.0171
G1 X128.423 Y130.361 E.0171
G1 X127.993 Y130.007 E.0171
G1 X127.639 Y129.577 E.0171
G1 X127.377 Y129.086 E.0171
G1 X127.216 Y128.554 E.0171
G1 X127.161 Y128 E.0171
G1 X127.216 Y127.446 E.0171
G1 X127.377 Y126.914 E.0171
G1 X127.639 Y126.423 E.0171
G1 X127.993 Y125.993 E.0171
G1 X128.423 Y125.639 E.0171
G1 X128.914 Y125.377 E.0171
G1 X129.446 Y125.216 E.0171
G1 X130 Y125.161 E.0171
G1 X130.217 Y125.182 E.00671
G1 X130.554 Y125.216 E.01039
G1 X131.086 Y125.377 E.0171
G1 X131.577 Y125.639 E.0171
G1 X132.007 Y125.993 E.0171
G1 X132.361 Y126.423 E.0171
G1 X132.623 Y126.914 E.0171
G1 X132.784 Y127.446 E.0171
G1 X132.839 Y128 E.0171
G1 X132.784 Y128.554 E.0171
G1 X132.623 Y129.086 E.0171
G1 X132.361 Y129.577 E.0171
G1 X132.007 Y130.007 E.0171
M204 S10000
; WIPE_START
G1 F24000
G1 X131.577 Y130.361 E-.21149
G1 X131.086 Y130.623 E-.21149
G1 X130.554 Y130.784 E-.21148
G1 X130.225 Y130.817 E-.12554
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I-.589 J-1.065 P1  F30000
G1 X111.312 Y141.285 Z2.8
G1 Z2.4
G1 E.8 F1800
M204 S5000
G1 F2194
G1 X111.163 Y141.443 E.00667
G1 X110.669 Y141.778 E.01835
G1 X110.114 Y141.999 E.01835
G1 X109.525 Y142.096 E.01835
G1 X108.929 Y142.063 E.01835
G1 X108.353 Y141.904 E.01835
G1 X107.826 Y141.624 E.01835
G1 X107.371 Y141.237 E.01835
G1 X107.009 Y140.762 E.01835
G1 X106.759 Y140.22 E.01835
G1 X106.63 Y139.637 E.01835
G1 X106.63 Y139.04 E.01835
G1 X106.759 Y138.457 E.01835
G1 X107.009 Y137.915 E.01835
G1 X107.371 Y137.44 E.01835
G1 X107.826 Y137.053 E.01835
G1 X108.353 Y136.773 E.01835
G1 X108.929 Y136.614 E.01835
G1 X109.307 Y136.593 E.01165
G1 X109.525 Y136.581 E.0067
G1 X110.114 Y136.678 E.01835
G1 X110.669 Y136.899 E.01835
G1 X111.163 Y137.234 E.01835
G1 X111.574 Y137.667 E.01835
G1 X111.881 Y138.179 E.01835
G1 X112.072 Y138.745 E.01835
G1 X112.137 Y139.339 E.01835
G1 X112.072 Y139.932 E.01835
G1 X111.881 Y140.498 E.01835
G1 X111.574 Y141.01 E.01835
G1 X111.353 Y141.242 E.00984
M204 S10000
; WIPE_START
G1 F24000
G1 X111.163 Y141.443 E-.10526
G1 X110.669 Y141.778 E-.22689
G1 X110.114 Y141.999 E-.22689
G1 X109.592 Y142.085 E-.20096
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I1.216 J-.059 P1  F30000
G1 X109.322 Y136.505 Z2.8
G1 Z2.4
G1 E.8 F1800
M204 S5000
G1 F2194
G1 X109.375 Y136.5 E.00165
G1 X109.739 Y136.535 E.01124
G1 X109.929 Y136.554 E.00587
G1 X110.462 Y136.716 E.0171
G1 X110.953 Y136.978 E.0171
G1 X111.383 Y137.331 E.0171
G1 X111.736 Y137.761 E.0171
G1 X111.998 Y138.252 E.0171
G1 X112.16 Y138.785 E.0171
G1 X112.214 Y139.339 E.0171
G1 X112.16 Y139.892 E.0171
G1 X111.998 Y140.425 E.0171
G1 X111.736 Y140.916 E.0171
G1 X111.383 Y141.346 E.0171
G1 X110.953 Y141.699 E.0171
G1 X110.462 Y141.961 E.0171
G1 X109.929 Y142.123 E.0171
G1 X109.375 Y142.177 E.0171
G1 X108.822 Y142.123 E.0171
G1 X108.289 Y141.961 E.0171
G1 X107.798 Y141.699 E.0171
G1 X107.368 Y141.346 E.0171
G1 X107.015 Y140.916 E.0171
G1 X106.752 Y140.425 E.0171
G1 X106.591 Y139.892 E.0171
G1 X106.536 Y139.339 E.0171
G1 X106.591 Y138.785 E.0171
G1 X106.752 Y138.252 E.0171
G1 X107.015 Y137.761 E.0171
G1 X107.368 Y137.331 E.0171
G1 X107.798 Y136.978 E.0171
G1 X108.289 Y136.716 E.0171
G1 X108.822 Y136.554 E.0171
G1 X109.262 Y136.511 E.01361
M204 S10000
; WIPE_START
G1 F24000
G1 X109.375 Y136.5 E-.04317
G1 X109.739 Y136.535 E-.13895
G1 X109.929 Y136.554 E-.07254
G1 X110.462 Y136.716 E-.21149
G1 X110.953 Y136.978 E-.21148
G1 X111.12 Y137.116 E-.08238
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I1.217 J.018 P1  F30000
G1 X111.353 Y121.281 Z2.8
G1 Z2.4
G1 E.8 F1800
M204 S5000
G1 F2194
G1 X111.204 Y121.438 E.00667
G1 X110.71 Y121.773 E.01835
G1 X110.155 Y121.994 E.01835
G1 X109.566 Y122.091 E.01835
G1 X108.97 Y122.059 E.01835
G1 X108.394 Y121.899 E.01835
G1 X107.867 Y121.619 E.01835
G1 X107.412 Y121.233 E.01835
G1 X107.051 Y120.757 E.01835
G1 X106.8 Y120.215 E.01835
G1 X106.671 Y119.632 E.01835
G1 X106.671 Y119.035 E.01835
G1 X106.8 Y118.452 E.01835
G1 X107.051 Y117.91 E.01835
G1 X107.412 Y117.435 E.01835
G1 X107.867 Y117.048 E.01835
G1 X108.394 Y116.769 E.01835
G1 X108.97 Y116.609 E.01835
G1 X109.348 Y116.588 E.01165
G1 X109.566 Y116.577 E.0067
G1 X110.155 Y116.673 E.01835
G1 X110.71 Y116.894 E.01835
G1 X111.204 Y117.229 E.01835
G1 X111.615 Y117.663 E.01835
G1 X111.923 Y118.174 E.01835
G1 X112.113 Y118.74 E.01835
G1 X112.178 Y119.334 E.01835
G1 X112.113 Y119.927 E.01835
G1 X111.923 Y120.493 E.01835
G1 X111.615 Y121.005 E.01835
G1 X111.395 Y121.237 E.00984
M204 S10000
; WIPE_START
G1 F24000
G1 X111.204 Y121.438 E-.10526
G1 X110.71 Y121.773 E-.22689
G1 X110.155 Y121.994 E-.22689
G1 X109.633 Y122.08 E-.20096
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I1.216 J-.059 P1  F30000
G1 X109.363 Y116.5 Z2.8
G1 Z2.4
G1 E.8 F1800
M204 S5000
G1 F2194
G1 X109.417 Y116.495 E.00165
G1 X109.78 Y116.531 E.01124
G1 X109.97 Y116.549 E.00587
G1 X110.503 Y116.711 E.0171
G1 X110.994 Y116.973 E.0171
G1 X111.424 Y117.326 E.0171
G1 X111.777 Y117.757 E.0171
G1 X112.039 Y118.247 E.0171
G1 X112.201 Y118.78 E.0171
G1 X112.256 Y119.334 E.0171
G1 X112.201 Y119.888 E.0171
G1 X112.039 Y120.42 E.0171
G1 X111.777 Y120.911 E.0171
G1 X111.424 Y121.341 E.0171
G1 X110.994 Y121.694 E.0171
G1 X110.503 Y121.957 E.0171
G1 X109.97 Y122.118 E.0171
G1 X109.417 Y122.173 E.0171
G1 X108.863 Y122.118 E.0171
G1 X108.33 Y121.957 E.0171
G1 X107.839 Y121.694 E.0171
G1 X107.409 Y121.341 E.0171
G1 X107.056 Y120.911 E.0171
G1 X106.794 Y120.42 E.0171
G1 X106.632 Y119.888 E.0171
G1 X106.578 Y119.334 E.0171
G1 X106.632 Y118.78 E.0171
G1 X106.794 Y118.247 E.0171
G1 X107.056 Y117.757 E.0171
G1 X107.409 Y117.326 E.0171
G1 X107.839 Y116.973 E.0171
G1 X108.33 Y116.711 E.0171
G1 X108.863 Y116.549 E.0171
G1 X109.303 Y116.506 E.01361
M204 S10000
; WIPE_START
G1 F24000
G1 X109.417 Y116.495 E-.04317
G1 X109.78 Y116.531 E-.13895
G1 X109.97 Y116.549 E-.07254
G1 X110.503 Y116.711 E-.21149
G1 X110.994 Y116.973 E-.21148
G1 X111.161 Y117.111 E-.08238
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I1.217 J-.008 P1  F30000
G1 X111.059 Y101.504 Z2.8
G1 Z2.4
G1 E.8 F1800
M204 S5000
G1 F2194
G1 X110.91 Y101.662 E.00667
G1 X110.416 Y101.997 E.01835
G1 X109.861 Y102.218 E.01835
G1 X109.272 Y102.315 E.01835
G1 X108.676 Y102.282 E.01835
G1 X108.1 Y102.122 E.01835
G1 X107.573 Y101.843 E.01835
G1 X107.118 Y101.456 E.01835
G1 X106.756 Y100.981 E.01835
G1 X106.506 Y100.439 E.01835
G1 X106.377 Y99.856 E.01835
G1 X106.377 Y99.259 E.01835
G1 X106.506 Y98.676 E.01835
G1 X106.756 Y98.134 E.01835
G1 X107.118 Y97.658 E.01835
G1 X107.573 Y97.272 E.01835
G1 X108.1 Y96.992 E.01835
G1 X108.676 Y96.832 E.01835
G1 X109.054 Y96.812 E.01165
G1 X109.272 Y96.8 E.0067
G1 X109.861 Y96.897 E.01835
G1 X110.416 Y97.118 E.01835
G1 X110.91 Y97.453 E.01835
G1 X111.321 Y97.886 E.01835
G1 X111.628 Y98.398 E.01835
G1 X111.819 Y98.964 E.01835
G1 X111.884 Y99.557 E.01835
G1 X111.819 Y100.151 E.01835
G1 X111.628 Y100.717 E.01835
G1 X111.321 Y101.228 E.01835
G1 X111.101 Y101.461 E.00984
M204 S10000
; WIPE_START
G1 F24000
G1 X110.91 Y101.662 E-.10526
G1 X110.416 Y101.997 E-.22689
G1 X109.861 Y102.218 E-.22689
G1 X109.339 Y102.303 E-.20096
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I1.216 J-.059 P1  F30000
G1 X109.069 Y96.724 Z2.8
G1 Z2.4
G1 E.8 F1800
M204 S5000
G1 F2194
G1 X109.122 Y96.718 E.00165
G1 X109.486 Y96.754 E.01124
G1 X109.676 Y96.773 E.00587
G1 X110.209 Y96.934 E.0171
G1 X110.7 Y97.197 E.0171
G1 X111.13 Y97.55 E.0171
G1 X111.483 Y97.98 E.0171
G1 X111.745 Y98.471 E.0171
G1 X111.907 Y99.003 E.0171
G1 X111.961 Y99.557 E.0171
G1 X111.907 Y100.111 E.0171
G1 X111.745 Y100.644 E.0171
G1 X111.483 Y101.135 E.0171
G1 X111.13 Y101.565 E.0171
G1 X110.7 Y101.918 E.0171
G1 X110.209 Y102.18 E.0171
G1 X109.676 Y102.342 E.0171
G1 X109.122 Y102.396 E.0171
G1 X108.569 Y102.342 E.0171
G1 X108.036 Y102.18 E.0171
G1 X107.545 Y101.918 E.0171
G1 X107.115 Y101.565 E.0171
G1 X106.762 Y101.135 E.0171
G1 X106.5 Y100.644 E.0171
G1 X106.338 Y100.111 E.0171
G1 X106.283 Y99.557 E.0171
G1 X106.338 Y99.003 E.0171
G1 X106.5 Y98.471 E.0171
G1 X106.762 Y97.98 E.0171
G1 X107.115 Y97.55 E.0171
G1 X107.545 Y97.197 E.0171
G1 X108.036 Y96.934 E.0171
G1 X108.569 Y96.773 E.0171
G1 X109.009 Y96.73 E.01361
M204 S10000
; WIPE_START
G1 F24000
G1 X109.122 Y96.718 E-.04317
G1 X109.486 Y96.754 E-.13895
G1 X109.676 Y96.773 E-.07254
G1 X110.209 Y96.934 E-.21149
G1 X110.7 Y97.197 E-.21148
G1 X110.867 Y97.334 E-.08238
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I1.216 J-.038 P1  F30000
G1 X110.277 Y78.689 Z2.8
G1 Z2.4
G1 E.8 F1800
M204 S5000
G1 F2194
G1 X110.128 Y78.846 E.00667
G1 X109.634 Y79.181 E.01835
G1 X109.079 Y79.402 E.01835
G1 X108.49 Y79.499 E.01835
G1 X107.894 Y79.467 E.01835
G1 X107.318 Y79.307 E.01835
G1 X106.791 Y79.027 E.01835
G1 X106.336 Y78.641 E.01835
G1 X105.974 Y78.165 E.01835
G1 X105.724 Y77.623 E.01835
G1 X105.595 Y77.04 E.01835
G1 X105.595 Y76.443 E.01835
G1 X105.724 Y75.86 E.01835
G1 X105.974 Y75.318 E.01835
G1 X106.336 Y74.843 E.01835
G1 X106.791 Y74.456 E.01835
G1 X107.318 Y74.177 E.01835
G1 X107.894 Y74.017 E.01835
G1 X108.272 Y73.996 E.01165
G1 X108.49 Y73.985 E.0067
G1 X109.079 Y74.081 E.01835
G1 X109.634 Y74.302 E.01835
G1 X110.128 Y74.637 E.01835
G1 X110.538 Y75.071 E.01835
G1 X110.846 Y75.582 E.01835
G1 X111.037 Y76.148 E.01835
G1 X111.102 Y76.742 E.01835
G1 X111.037 Y77.335 E.01835
G1 X110.846 Y77.901 E.01835
G1 X110.538 Y78.413 E.01835
G1 X110.318 Y78.645 E.00984
M204 S10000
; WIPE_START
G1 F24000
G1 X110.128 Y78.846 E-.10526
G1 X109.634 Y79.181 E-.22689
G1 X109.079 Y79.402 E-.22689
G1 X108.557 Y79.488 E-.20096
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I1.216 J-.059 P1  F30000
G1 X108.287 Y73.908 Z2.8
G1 Z2.4
G1 E.8 F1800
M204 S5000
G1 F2194
G1 X108.34 Y73.903 E.00165
G1 X108.704 Y73.939 E.01124
G1 X108.894 Y73.957 E.00587
G1 X109.427 Y74.119 E.0171
G1 X109.918 Y74.381 E.0171
G1 X110.348 Y74.734 E.0171
G1 X110.701 Y75.164 E.0171
G1 X110.963 Y75.655 E.0171
G1 X111.125 Y76.188 E.0171
G1 X111.179 Y76.742 E.0171
G1 X111.125 Y77.296 E.0171
G1 X110.963 Y77.828 E.0171
G1 X110.701 Y78.319 E.0171
G1 X110.348 Y78.749 E.0171
G1 X109.918 Y79.102 E.0171
G1 X109.427 Y79.365 E.0171
G1 X108.894 Y79.526 E.0171
G1 X108.34 Y79.581 E.0171
G1 X107.786 Y79.526 E.0171
G1 X107.254 Y79.365 E.0171
G1 X106.763 Y79.102 E.0171
G1 X106.333 Y78.749 E.0171
G1 X105.98 Y78.319 E.0171
G1 X105.717 Y77.828 E.0171
G1 X105.556 Y77.296 E.0171
G1 X105.501 Y76.742 E.0171
G1 X105.556 Y76.188 E.0171
G1 X105.717 Y75.655 E.0171
G1 X105.98 Y75.164 E.0171
G1 X106.333 Y74.734 E.0171
G1 X106.763 Y74.381 E.0171
G1 X107.254 Y74.119 E.0171
G1 X107.786 Y73.957 E.0171
G1 X108.227 Y73.914 E.01361
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 2.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X108.34 Y73.903 E-.04317
M73 P69 R3
G1 X108.704 Y73.939 E-.13895
G1 X108.894 Y73.957 E-.07254
G1 X109.427 Y74.119 E-.21149
G1 X109.918 Y74.381 E-.21148
G1 X110.085 Y74.519 E-.08238
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 13/32
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
G3 Z2.8 I-.61 J1.053 P1  F30000
G1 X129.318 Y85.669 Z2.8
G1 Z2.6
G1 E.8 F1800
M204 S5000
G1 F2194
G1 X129.495 Y85.66 E.00543
G1 X130.084 Y85.756 E.01835
G1 X130.639 Y85.977 E.01835
G1 X131.133 Y86.312 E.01835
G1 X131.543 Y86.746 E.01835
G1 X131.851 Y87.257 E.01835
G1 X132.042 Y87.823 E.01835
G1 X132.106 Y88.417 E.01835
G1 X132.042 Y89.01 E.01835
G1 X131.851 Y89.576 E.01835
G1 X131.543 Y90.088 E.01835
G1 X131.313 Y90.331 E.01028
G1 X131.133 Y90.521 E.00807
G1 X130.639 Y90.856 E.01835
G1 X130.084 Y91.077 E.01835
G1 X129.495 Y91.174 E.01835
G1 X128.898 Y91.142 E.01835
G1 X128.323 Y90.982 E.01835
G1 X127.796 Y90.702 E.01835
G1 X127.341 Y90.316 E.01835
G1 X126.979 Y89.84 E.01835
G1 X126.728 Y89.298 E.01835
G1 X126.6 Y88.715 E.01835
G1 X126.6 Y88.118 E.01835
G1 X126.728 Y87.535 E.01835
G1 X126.979 Y86.993 E.01835
G1 X127.341 Y86.518 E.01835
G1 X127.796 Y86.131 E.01835
G1 X128.323 Y85.852 E.01835
G1 X128.898 Y85.692 E.01835
G1 X129.161 Y85.678 E.00807
G1 X129.258 Y85.672 E.003
M204 S10000
; WIPE_START
G1 F24000
G1 X129.495 Y85.66 E-.09001
G1 X130.084 Y85.756 E-.22689
G1 X130.639 Y85.977 E-.22689
G1 X131.109 Y86.296 E-.21621
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I-1.216 J.059 P1  F30000
G1 X131.311 Y90.458 Z3
G1 Z2.6
G1 E.8 F1800
M204 S5000
G1 F2194
G1 X130.922 Y90.777 E.01546
G1 X130.432 Y91.04 E.0171
G1 X129.899 Y91.201 E.0171
G1 X129.345 Y91.256 E.0171
G1 X128.791 Y91.201 E.0171
G1 X128.259 Y91.04 E.0171
G1 X127.768 Y90.777 E.0171
G1 X127.338 Y90.424 E.0171
G1 X126.985 Y89.994 E.0171
G1 X126.722 Y89.503 E.0171
G1 X126.561 Y88.971 E.0171
G1 X126.506 Y88.417 E.0171
G1 X126.561 Y87.863 E.0171
G1 X126.722 Y87.33 E.0171
G1 X126.985 Y86.839 E.0171
G1 X127.338 Y86.409 E.0171
G1 X127.768 Y86.056 E.0171
G1 X128.259 Y85.794 E.0171
G1 X128.791 Y85.632 E.0171
G1 X129.345 Y85.578 E.0171
G1 X129.583 Y85.601 E.00735
G1 X129.899 Y85.632 E.00975
G1 X130.432 Y85.794 E.0171
G1 X130.922 Y86.056 E.0171
G1 X131.353 Y86.409 E.0171
G1 X131.706 Y86.839 E.0171
G1 X131.968 Y87.33 E.0171
G1 X132.13 Y87.863 E.0171
G1 X132.184 Y88.417 E.0171
G1 X132.13 Y88.971 E.0171
G1 X131.968 Y89.503 E.0171
G1 X131.706 Y89.994 E.0171
G1 X131.357 Y90.419 E.0169
M204 S10000
; WIPE_START
G1 F24000
G1 X130.922 Y90.777 E-.21395
G1 X130.432 Y91.04 E-.21149
G1 X129.899 Y91.201 E-.21148
G1 X129.577 Y91.233 E-.12308
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I-1.216 J-.037 P1  F30000
G1 X129.075 Y107.649 Z3
G1 Z2.6
G1 E.8 F1800
M204 S5000
G1 F2194
G1 X129.251 Y107.639 E.00543
G1 X129.841 Y107.736 E.01835
G1 X130.395 Y107.957 E.01835
G1 X130.889 Y108.292 E.01835
G1 X131.3 Y108.725 E.01835
G1 X131.608 Y109.237 E.01835
G1 X131.798 Y109.803 E.01835
G1 X131.863 Y110.396 E.01835
G1 X131.798 Y110.99 E.01835
G1 X131.608 Y111.556 E.01835
G1 X131.3 Y112.067 E.01835
G1 X131.07 Y112.31 E.01028
G1 X130.889 Y112.501 E.00807
G1 X130.395 Y112.836 E.01835
G1 X129.841 Y113.057 E.01835
G1 X129.251 Y113.154 E.01835
G1 X128.655 Y113.121 E.01835
G1 X128.08 Y112.961 E.01835
G1 X127.552 Y112.682 E.01835
G1 X127.097 Y112.295 E.01835
G1 X126.736 Y111.82 E.01835
G1 X126.485 Y111.278 E.01835
G1 X126.357 Y110.695 E.01835
G1 X126.357 Y110.098 E.01835
G1 X126.485 Y109.515 E.01835
G1 X126.736 Y108.973 E.01835
G1 X127.097 Y108.497 E.01835
G1 X127.552 Y108.111 E.01835
G1 X128.08 Y107.831 E.01835
G1 X128.655 Y107.672 E.01835
G1 X128.917 Y107.657 E.00807
G1 X129.015 Y107.652 E.003
M204 S10000
; WIPE_START
G1 F24000
G1 X129.251 Y107.639 E-.09001
G1 X129.841 Y107.736 E-.22689
G1 X130.395 Y107.957 E-.22689
G1 X130.866 Y108.276 E-.21621
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I-1.216 J.059 P1  F30000
G1 X131.068 Y112.438 Z3
G1 Z2.6
G1 E.8 F1800
M204 S5000
G1 F2194
G1 X130.679 Y112.757 E.01546
G1 X130.188 Y113.019 E.0171
G1 X129.656 Y113.181 E.0171
G1 X129.102 Y113.235 E.0171
G1 X128.548 Y113.181 E.0171
G1 X128.015 Y113.019 E.0171
G1 X127.525 Y112.757 E.0171
G1 X127.094 Y112.404 E.0171
G1 X126.741 Y111.974 E.0171
G1 X126.479 Y111.483 E.0171
G1 X126.317 Y110.95 E.0171
G1 X126.263 Y110.396 E.0171
G1 X126.317 Y109.843 E.0171
G1 X126.479 Y109.31 E.0171
G1 X126.741 Y108.819 E.0171
G1 X127.094 Y108.389 E.0171
G1 X127.525 Y108.036 E.0171
G1 X128.015 Y107.773 E.0171
G1 X128.548 Y107.612 E.0171
G1 X129.102 Y107.557 E.0171
G1 X129.34 Y107.581 E.00735
G1 X129.656 Y107.612 E.00975
G1 X130.188 Y107.773 E.0171
G1 X130.679 Y108.036 E.0171
G1 X131.109 Y108.389 E.0171
G1 X131.462 Y108.819 E.0171
G1 X131.725 Y109.31 E.0171
G1 X131.886 Y109.843 E.0171
G1 X131.941 Y110.396 E.0171
G1 X131.886 Y110.95 E.0171
G1 X131.725 Y111.483 E.0171
G1 X131.462 Y111.974 E.0171
G1 X131.113 Y112.399 E.0169
M204 S10000
; WIPE_START
G1 F24000
G1 X130.679 Y112.757 E-.21395
G1 X130.188 Y113.019 E-.21149
G1 X129.656 Y113.181 E-.21148
G1 X129.333 Y113.213 E-.12308
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I-1.215 J.065 P1  F30000
G1 X129.973 Y125.252 Z3
G1 Z2.6
G1 E.8 F1800
M204 S5000
G1 F2194
G1 X130.149 Y125.243 E.00543
G1 X130.739 Y125.339 E.01835
G1 X131.293 Y125.56 E.01835
G1 X131.788 Y125.895 E.01835
G1 X132.198 Y126.329 E.01835
G1 X132.506 Y126.841 E.01835
G1 X132.697 Y127.406 E.01835
G1 X132.761 Y128 E.01835
G1 X132.697 Y128.594 E.01835
G1 X132.506 Y129.159 E.01835
G1 X132.198 Y129.671 E.01835
G1 X131.968 Y129.914 E.01028
G1 X131.788 Y130.105 E.00807
G1 X131.293 Y130.44 E.01835
G1 X130.739 Y130.661 E.01835
G1 X130.149 Y130.757 E.01835
G1 X129.553 Y130.725 E.01835
G1 X128.978 Y130.565 E.01835
G1 X128.45 Y130.285 E.01835
G1 X127.995 Y129.899 E.01835
G1 X127.634 Y129.424 E.01835
G1 X127.383 Y128.882 E.01835
G1 X127.255 Y128.299 E.01835
G1 X127.255 Y127.701 E.01835
G1 X127.383 Y127.118 E.01835
G1 X127.634 Y126.576 E.01835
G1 X127.995 Y126.101 E.01835
G1 X128.45 Y125.715 E.01835
G1 X128.978 Y125.435 E.01835
G1 X129.553 Y125.275 E.01835
G1 X129.815 Y125.261 E.00807
G1 X129.913 Y125.256 E.003
M204 S10000
; WIPE_START
G1 F24000
G1 X130.149 Y125.243 E-.09001
G1 X130.739 Y125.339 E-.22689
G1 X131.293 Y125.56 E-.22689
G1 X131.764 Y125.88 E-.21621
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I-1.216 J.059 P1  F30000
G1 X131.966 Y130.041 Z3
G1 Z2.6
G1 E.8 F1800
M204 S5000
G1 F2194
G1 X131.577 Y130.361 E.01546
G1 X131.086 Y130.623 E.0171
G1 X130.554 Y130.784 E.0171
G1 X130 Y130.839 E.0171
G1 X129.446 Y130.784 E.0171
G1 X128.914 Y130.623 E.0171
G1 X128.423 Y130.361 E.0171
G1 X127.993 Y130.007 E.0171
G1 X127.639 Y129.577 E.0171
G1 X127.377 Y129.086 E.0171
G1 X127.216 Y128.554 E.0171
G1 X127.161 Y128 E.0171
G1 X127.216 Y127.446 E.0171
G1 X127.377 Y126.914 E.0171
G1 X127.639 Y126.423 E.0171
G1 X127.993 Y125.993 E.0171
G1 X128.423 Y125.639 E.0171
G1 X128.914 Y125.377 E.0171
G1 X129.446 Y125.216 E.0171
G1 X130 Y125.161 E.0171
G1 X130.238 Y125.184 E.00735
G1 X130.554 Y125.216 E.00975
G1 X131.086 Y125.377 E.0171
G1 X131.577 Y125.639 E.0171
G1 X132.007 Y125.993 E.0171
G1 X132.361 Y126.423 E.0171
G1 X132.623 Y126.914 E.0171
G1 X132.784 Y127.446 E.0171
G1 X132.839 Y128 E.0171
G1 X132.784 Y128.554 E.0171
G1 X132.623 Y129.086 E.0171
G1 X132.361 Y129.577 E.0171
G1 X132.012 Y130.002 E.0169
M204 S10000
; WIPE_START
G1 F24000
G1 X131.577 Y130.361 E-.21395
G1 X131.086 Y130.623 E-.21149
G1 X130.554 Y130.784 E-.21148
G1 X130.232 Y130.816 E-.12308
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I-.589 J-1.065 P1  F30000
G1 X111.313 Y141.285 Z3
G1 Z2.6
G1 E.8 F1800
M204 S5000
G1 F2194
G1 X111.163 Y141.443 E.0067
G1 X110.669 Y141.778 E.01835
G1 X110.114 Y141.999 E.01835
G1 X109.525 Y142.096 E.01835
G1 X108.929 Y142.063 E.01835
G1 X108.353 Y141.904 E.01835
G1 X107.826 Y141.624 E.01835
G1 X107.647 Y141.472 E.00722
G1 X107.371 Y141.237 E.01113
G1 X107.009 Y140.762 E.01835
G1 X106.759 Y140.22 E.01835
G1 X106.63 Y139.637 E.01835
G1 X106.63 Y139.04 E.01835
G1 X106.759 Y138.457 E.01835
G1 X107.009 Y137.915 E.01835
G1 X107.371 Y137.44 E.01835
G1 X107.826 Y137.053 E.01835
G1 X108.353 Y136.773 E.01835
G1 X108.929 Y136.614 E.01835
G1 X109.29 Y136.594 E.01113
G1 X109.525 Y136.581 E.00722
G1 X110.114 Y136.678 E.01835
G1 X110.669 Y136.899 E.01835
G1 X111.163 Y137.234 E.01835
G1 X111.574 Y137.667 E.01835
G1 X111.881 Y138.179 E.01835
G1 X112.072 Y138.745 E.01835
G1 X112.137 Y139.339 E.01835
G1 X112.072 Y139.932 E.01835
G1 X111.881 Y140.498 E.01835
G1 X111.574 Y141.01 E.01835
G1 X111.354 Y141.241 E.00981
M204 S10000
; WIPE_START
G1 F24000
G1 X111.163 Y141.443 E-.10561
G1 X110.669 Y141.778 E-.22689
G1 X110.114 Y141.999 E-.22689
G1 X109.593 Y142.085 E-.20061
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I1.215 J-.063 P1  F30000
G1 X109.304 Y136.507 Z3
G1 Z2.6
G1 E.8 F1800
M204 S5000
G1 F2194
G1 X109.375 Y136.5 E.00221
G1 X109.721 Y136.534 E.01067
G1 X109.929 Y136.554 E.00643
G1 X110.462 Y136.716 E.0171
G1 X110.953 Y136.978 E.0171
G1 X111.383 Y137.331 E.0171
G1 X111.736 Y137.761 E.0171
G1 X111.998 Y138.252 E.0171
G1 X112.16 Y138.785 E.0171
G1 X112.214 Y139.339 E.0171
G1 X112.16 Y139.892 E.0171
G1 X111.998 Y140.425 E.0171
G1 X111.736 Y140.916 E.0171
G1 X111.383 Y141.346 E.0171
G1 X110.953 Y141.699 E.0171
G1 X110.462 Y141.961 E.0171
G1 X109.929 Y142.123 E.0171
G1 X109.375 Y142.177 E.0171
G1 X108.822 Y142.123 E.0171
G1 X108.289 Y141.961 E.0171
G1 X107.798 Y141.699 E.0171
G1 X107.368 Y141.346 E.0171
G1 X107.015 Y140.916 E.0171
G1 X106.752 Y140.425 E.0171
G1 X106.591 Y139.892 E.0171
G1 X106.536 Y139.339 E.0171
G1 X106.591 Y138.785 E.0171
G1 X106.752 Y138.252 E.0171
G1 X107.015 Y137.761 E.0171
G1 X107.368 Y137.331 E.0171
G1 X107.798 Y136.978 E.0171
G1 X108.289 Y136.716 E.0171
G1 X108.822 Y136.554 E.0171
G1 X109.244 Y136.512 E.01305
M204 S10000
; WIPE_START
G1 F24000
G1 X109.375 Y136.5 E-.05009
G1 X109.721 Y136.534 E-.13196
G1 X109.929 Y136.554 E-.07953
G1 X110.462 Y136.716 E-.21149
G1 X110.953 Y136.978 E-.21148
G1 X111.106 Y137.104 E-.07545
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I1.217 J.019 P1  F30000
G1 X111.354 Y121.28 Z3
G1 Z2.6
G1 E.8 F1800
M204 S5000
G1 F2194
G1 X111.204 Y121.438 E.0067
G1 X110.71 Y121.773 E.01835
G1 X110.155 Y121.994 E.01835
G1 X109.566 Y122.091 E.01835
G1 X108.97 Y122.059 E.01835
G1 X108.394 Y121.899 E.01835
G1 X107.867 Y121.619 E.01835
G1 X107.688 Y121.467 E.00722
G1 X107.412 Y121.233 E.01113
G1 X107.051 Y120.757 E.01835
G1 X106.8 Y120.215 E.01835
G1 X106.671 Y119.632 E.01835
G1 X106.671 Y119.035 E.01835
G1 X106.8 Y118.452 E.01835
G1 X107.051 Y117.91 E.01835
G1 X107.412 Y117.435 E.01835
G1 X107.867 Y117.048 E.01835
G1 X108.394 Y116.769 E.01835
G1 X108.97 Y116.609 E.01835
G1 X109.331 Y116.589 E.01113
G1 X109.566 Y116.577 E.00722
G1 X110.155 Y116.673 E.01835
G1 X110.71 Y116.894 E.01835
G1 X111.204 Y117.229 E.01835
G1 X111.615 Y117.663 E.01835
G1 X111.923 Y118.174 E.01835
G1 X112.113 Y118.74 E.01835
G1 X112.178 Y119.334 E.01835
G1 X112.113 Y119.927 E.01835
G1 X111.923 Y120.493 E.01835
G1 X111.615 Y121.005 E.01835
G1 X111.395 Y121.237 E.00981
M204 S10000
; WIPE_START
G1 F24000
G1 X111.204 Y121.438 E-.10561
G1 X110.71 Y121.773 E-.22689
G1 X110.155 Y121.994 E-.22689
G1 X109.634 Y122.08 E-.20061
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I1.215 J-.063 P1  F30000
G1 X109.345 Y116.502 Z3
G1 Z2.6
G1 E.8 F1800
M204 S5000
G1 F2194
G1 X109.417 Y116.495 E.00221
G1 X109.762 Y116.529 E.01067
G1 X109.97 Y116.549 E.00643
G1 X110.503 Y116.711 E.0171
G1 X110.994 Y116.973 E.0171
G1 X111.424 Y117.326 E.0171
G1 X111.777 Y117.757 E.0171
G1 X112.039 Y118.247 E.0171
G1 X112.201 Y118.78 E.0171
G1 X112.256 Y119.334 E.0171
G1 X112.201 Y119.888 E.0171
G1 X112.039 Y120.42 E.0171
G1 X111.777 Y120.911 E.0171
G1 X111.424 Y121.341 E.0171
G1 X110.994 Y121.694 E.0171
G1 X110.503 Y121.957 E.0171
G1 X109.97 Y122.118 E.0171
G1 X109.417 Y122.173 E.0171
G1 X108.863 Y122.118 E.0171
G1 X108.33 Y121.957 E.0171
G1 X107.839 Y121.694 E.0171
M73 P70 R3
G1 X107.409 Y121.341 E.0171
G1 X107.056 Y120.911 E.0171
G1 X106.794 Y120.42 E.0171
G1 X106.632 Y119.888 E.0171
G1 X106.578 Y119.334 E.0171
G1 X106.632 Y118.78 E.0171
G1 X106.794 Y118.247 E.0171
G1 X107.056 Y117.757 E.0171
G1 X107.409 Y117.326 E.0171
G1 X107.839 Y116.973 E.0171
G1 X108.33 Y116.711 E.0171
G1 X108.863 Y116.549 E.0171
G1 X109.285 Y116.508 E.01305
M204 S10000
; WIPE_START
G1 F24000
G1 X109.417 Y116.495 E-.05009
G1 X109.762 Y116.529 E-.13196
G1 X109.97 Y116.549 E-.07953
G1 X110.503 Y116.711 E-.21149
G1 X110.994 Y116.973 E-.21148
G1 X111.147 Y117.099 E-.07545
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I1.217 J-.007 P1  F30000
G1 X111.06 Y101.504 Z3
G1 Z2.6
G1 E.8 F1800
M204 S5000
G1 F2194
G1 X110.91 Y101.662 E.0067
G1 X110.416 Y101.997 E.01835
G1 X109.861 Y102.218 E.01835
G1 X109.272 Y102.315 E.01835
G1 X108.676 Y102.282 E.01835
G1 X108.1 Y102.122 E.01835
G1 X107.573 Y101.843 E.01835
G1 X107.394 Y101.691 E.00722
G1 X107.118 Y101.456 E.01113
G1 X106.756 Y100.981 E.01835
G1 X106.506 Y100.439 E.01835
G1 X106.377 Y99.856 E.01835
G1 X106.377 Y99.259 E.01835
G1 X106.506 Y98.676 E.01835
G1 X106.756 Y98.134 E.01835
G1 X107.118 Y97.658 E.01835
G1 X107.573 Y97.272 E.01835
G1 X108.1 Y96.992 E.01835
G1 X108.676 Y96.832 E.01835
G1 X109.037 Y96.813 E.01113
G1 X109.272 Y96.8 E.00722
G1 X109.861 Y96.897 E.01835
G1 X110.416 Y97.118 E.01835
G1 X110.91 Y97.453 E.01835
G1 X111.321 Y97.886 E.01835
G1 X111.628 Y98.398 E.01835
G1 X111.819 Y98.964 E.01835
G1 X111.884 Y99.557 E.01835
G1 X111.819 Y100.151 E.01835
G1 X111.628 Y100.717 E.01835
G1 X111.321 Y101.228 E.01835
G1 X111.101 Y101.46 E.00981
M204 S10000
; WIPE_START
G1 F24000
G1 X110.91 Y101.662 E-.10561
G1 X110.416 Y101.997 E-.22689
G1 X109.861 Y102.218 E-.22689
G1 X109.34 Y102.303 E-.20061
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I1.215 J-.063 P1  F30000
G1 X109.051 Y96.725 Z3
G1 Z2.6
G1 E.8 F1800
M204 S5000
G1 F2194
G1 X109.122 Y96.718 E.00221
G1 X109.468 Y96.752 E.01067
G1 X109.676 Y96.773 E.00643
G1 X110.209 Y96.934 E.0171
G1 X110.7 Y97.197 E.0171
G1 X111.13 Y97.55 E.0171
G1 X111.483 Y97.98 E.0171
G1 X111.745 Y98.471 E.0171
G1 X111.907 Y99.003 E.0171
G1 X111.961 Y99.557 E.0171
G1 X111.907 Y100.111 E.0171
G1 X111.745 Y100.644 E.0171
G1 X111.483 Y101.135 E.0171
G1 X111.13 Y101.565 E.0171
G1 X110.7 Y101.918 E.0171
G1 X110.209 Y102.18 E.0171
G1 X109.676 Y102.342 E.0171
G1 X109.122 Y102.396 E.0171
G1 X108.569 Y102.342 E.0171
G1 X108.036 Y102.18 E.0171
G1 X107.545 Y101.918 E.0171
G1 X107.115 Y101.565 E.0171
G1 X106.762 Y101.135 E.0171
G1 X106.5 Y100.644 E.0171
G1 X106.338 Y100.111 E.0171
G1 X106.283 Y99.557 E.0171
G1 X106.338 Y99.003 E.0171
G1 X106.5 Y98.471 E.0171
G1 X106.762 Y97.98 E.0171
G1 X107.115 Y97.55 E.0171
G1 X107.545 Y97.197 E.0171
G1 X108.036 Y96.934 E.0171
G1 X108.569 Y96.773 E.0171
G1 X108.991 Y96.731 E.01305
M204 S10000
; WIPE_START
G1 F24000
G1 X109.122 Y96.718 E-.05009
G1 X109.468 Y96.752 E-.13196
G1 X109.676 Y96.773 E-.07953
G1 X110.209 Y96.934 E-.21149
G1 X110.7 Y97.197 E-.21148
G1 X110.853 Y97.323 E-.07545
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I1.216 J-.038 P1  F30000
G1 X110.278 Y78.688 Z3
G1 Z2.6
G1 E.8 F1800
M204 S5000
G1 F2194
G1 X110.128 Y78.846 E.0067
G1 X109.634 Y79.181 E.01835
G1 X109.079 Y79.402 E.01835
G1 X108.49 Y79.499 E.01835
G1 X107.894 Y79.467 E.01835
G1 X107.318 Y79.307 E.01835
G1 X106.791 Y79.027 E.01835
G1 X106.612 Y78.875 E.00722
G1 X106.336 Y78.641 E.01113
G1 X105.974 Y78.165 E.01835
G1 X105.724 Y77.623 E.01835
G1 X105.595 Y77.04 E.01835
G1 X105.595 Y76.443 E.01835
G1 X105.724 Y75.86 E.01835
G1 X105.974 Y75.318 E.01835
G1 X106.336 Y74.843 E.01835
G1 X106.791 Y74.456 E.01835
G1 X107.318 Y74.177 E.01835
G1 X107.894 Y74.017 E.01835
G1 X108.255 Y73.997 E.01113
G1 X108.49 Y73.985 E.00722
G1 X109.079 Y74.081 E.01835
G1 X109.634 Y74.302 E.01835
G1 X110.128 Y74.637 E.01835
G1 X110.538 Y75.071 E.01835
G1 X110.846 Y75.582 E.01835
G1 X111.037 Y76.148 E.01835
G1 X111.102 Y76.742 E.01835
G1 X111.037 Y77.335 E.01835
G1 X110.846 Y77.901 E.01835
G1 X110.538 Y78.413 E.01835
G1 X110.319 Y78.644 E.00981
M204 S10000
; WIPE_START
G1 F24000
G1 X110.128 Y78.846 E-.10561
G1 X109.634 Y79.181 E-.22689
G1 X109.079 Y79.402 E-.22689
G1 X108.558 Y79.488 E-.20061
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I1.215 J-.063 P1  F30000
G1 X108.269 Y73.91 Z3
G1 Z2.6
G1 E.8 F1800
M204 S5000
G1 F2194
G1 X108.34 Y73.903 E.00221
G1 X108.686 Y73.937 E.01067
G1 X108.894 Y73.957 E.00643
G1 X109.427 Y74.119 E.0171
G1 X109.918 Y74.381 E.0171
G1 X110.348 Y74.734 E.0171
G1 X110.701 Y75.164 E.0171
G1 X110.963 Y75.655 E.0171
G1 X111.125 Y76.188 E.0171
G1 X111.179 Y76.742 E.0171
G1 X111.125 Y77.296 E.0171
G1 X110.963 Y77.828 E.0171
G1 X110.701 Y78.319 E.0171
G1 X110.348 Y78.749 E.0171
G1 X109.918 Y79.102 E.0171
G1 X109.427 Y79.365 E.0171
G1 X108.894 Y79.526 E.0171
G1 X108.34 Y79.581 E.0171
G1 X107.786 Y79.526 E.0171
G1 X107.254 Y79.365 E.0171
G1 X106.763 Y79.102 E.0171
G1 X106.333 Y78.749 E.0171
G1 X105.98 Y78.319 E.0171
G1 X105.717 Y77.828 E.0171
G1 X105.556 Y77.296 E.0171
G1 X105.501 Y76.742 E.0171
G1 X105.556 Y76.188 E.0171
G1 X105.717 Y75.655 E.0171
G1 X105.98 Y75.164 E.0171
G1 X106.333 Y74.734 E.0171
G1 X106.763 Y74.381 E.0171
G1 X107.254 Y74.119 E.0171
G1 X107.786 Y73.957 E.0171
G1 X108.209 Y73.916 E.01305
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 2.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X108.34 Y73.903 E-.05009
G1 X108.686 Y73.937 E-.13196
G1 X108.894 Y73.957 E-.07953
G1 X109.427 Y74.119 E-.21149
G1 X109.918 Y74.381 E-.21148
G1 X110.071 Y74.507 E-.07545
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 14/32
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
G3 Z3 I-.61 J1.053 P1  F30000
G1 X129.32 Y85.669 Z3
G1 Z2.8
G1 E.8 F1800
M204 S5000
G1 F2194
G1 X129.495 Y85.66 E.00536
G1 X130.084 Y85.756 E.01835
G1 X130.639 Y85.977 E.01835
G1 X131.133 Y86.312 E.01835
G1 X131.543 Y86.746 E.01835
G1 X131.851 Y87.257 E.01835
G1 X132.042 Y87.823 E.01835
G1 X132.106 Y88.417 E.01835
G1 X132.042 Y89.01 E.01835
G1 X131.851 Y89.576 E.01835
G1 X131.543 Y90.088 E.01835
G1 X131.327 Y90.317 E.00969
G1 X131.133 Y90.521 E.00866
G1 X130.639 Y90.856 E.01835
G1 X130.084 Y91.077 E.01835
G1 X129.495 Y91.174 E.01835
G1 X128.898 Y91.142 E.01835
G1 X128.323 Y90.982 E.01835
G1 X127.796 Y90.702 E.01835
G1 X127.341 Y90.316 E.01835
G1 X126.979 Y89.84 E.01835
G1 X126.728 Y89.298 E.01835
G1 X126.6 Y88.715 E.01835
G1 X126.6 Y88.118 E.01835
G1 X126.728 Y87.535 E.01835
G1 X126.979 Y86.993 E.01835
G1 X127.341 Y86.518 E.01835
G1 X127.796 Y86.131 E.01835
G1 X128.323 Y85.852 E.01835
G1 X128.898 Y85.692 E.01835
G1 X129.18 Y85.677 E.00866
G1 X129.261 Y85.672 E.00248
M204 S10000
; WIPE_START
G1 F24000
G1 X129.495 Y85.66 E-.08911
G1 X130.084 Y85.756 E-.22689
G1 X130.639 Y85.977 E-.22689
G1 X131.111 Y86.298 E-.21711
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I-1.215 J.06 P1  F30000
G1 X131.316 Y90.454 Z3.2
G1 Z2.8
G1 E.8 F1800
M204 S5000
G1 F2194
G1 X130.922 Y90.777 E.01566
G1 X130.432 Y91.04 E.0171
G1 X129.899 Y91.201 E.0171
G1 X129.345 Y91.256 E.0171
G1 X128.791 Y91.201 E.0171
G1 X128.259 Y91.04 E.0171
G1 X127.768 Y90.777 E.0171
G1 X127.338 Y90.424 E.0171
G1 X126.985 Y89.994 E.0171
G1 X126.722 Y89.503 E.0171
G1 X126.561 Y88.971 E.0171
G1 X126.506 Y88.417 E.0171
G1 X126.561 Y87.863 E.0171
G1 X126.722 Y87.33 E.0171
G1 X126.985 Y86.839 E.0171
G1 X127.338 Y86.409 E.0171
G1 X127.768 Y86.056 E.0171
G1 X128.259 Y85.794 E.0171
G1 X128.791 Y85.632 E.0171
G1 X129.345 Y85.578 E.0171
G1 X129.604 Y85.603 E.00799
G1 X129.899 Y85.632 E.00911
G1 X130.432 Y85.794 E.0171
G1 X130.922 Y86.056 E.0171
G1 X131.353 Y86.409 E.0171
G1 X131.706 Y86.839 E.0171
G1 X131.968 Y87.33 E.0171
G1 X132.13 Y87.863 E.0171
G1 X132.184 Y88.417 E.0171
G1 X132.13 Y88.971 E.0171
G1 X131.968 Y89.503 E.0171
G1 X131.706 Y89.994 E.0171
G1 X131.361 Y90.414 E.01669
M204 S10000
; WIPE_START
G1 F24000
G1 X130.922 Y90.777 E-.21642
G1 X130.432 Y91.04 E-.21149
G1 X129.899 Y91.201 E-.21148
G1 X129.583 Y91.232 E-.12061
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I-1.216 J-.037 P1  F30000
G1 X129.077 Y107.649 Z3.2
G1 Z2.8
G1 E.8 F1800
M204 S5000
G1 F2194
G1 X129.251 Y107.639 E.00536
G1 X129.841 Y107.736 E.01835
G1 X130.395 Y107.957 E.01835
G1 X130.889 Y108.292 E.01835
G1 X131.3 Y108.725 E.01835
G1 X131.608 Y109.237 E.01835
G1 X131.798 Y109.803 E.01835
G1 X131.863 Y110.396 E.01835
G1 X131.798 Y110.99 E.01835
G1 X131.608 Y111.556 E.01835
G1 X131.3 Y112.067 E.01835
G1 X131.083 Y112.296 E.00969
G1 X130.889 Y112.501 E.00866
G1 X130.395 Y112.836 E.01835
G1 X129.841 Y113.057 E.01835
G1 X129.251 Y113.154 E.01835
G1 X128.655 Y113.121 E.01835
G1 X128.08 Y112.961 E.01835
G1 X127.552 Y112.682 E.01835
G1 X127.097 Y112.295 E.01835
G1 X126.736 Y111.82 E.01835
G1 X126.485 Y111.278 E.01835
G1 X126.357 Y110.695 E.01835
G1 X126.357 Y110.098 E.01835
G1 X126.485 Y109.515 E.01835
G1 X126.736 Y108.973 E.01835
G1 X127.097 Y108.497 E.01835
G1 X127.552 Y108.111 E.01835
G1 X128.08 Y107.831 E.01835
G1 X128.655 Y107.672 E.01835
G1 X128.936 Y107.656 E.00866
G1 X129.017 Y107.652 E.00248
M204 S10000
; WIPE_START
G1 F24000
G1 X129.251 Y107.639 E-.08911
G1 X129.841 Y107.736 E-.22689
G1 X130.395 Y107.957 E-.22689
G1 X130.868 Y108.277 E-.21711
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I-1.215 J.06 P1  F30000
G1 X131.073 Y112.434 Z3.2
G1 Z2.8
G1 E.8 F1800
M204 S5000
G1 F2194
G1 X130.679 Y112.757 E.01566
G1 X130.188 Y113.019 E.0171
G1 X129.656 Y113.181 E.0171
G1 X129.102 Y113.235 E.0171
G1 X128.548 Y113.181 E.0171
G1 X128.015 Y113.019 E.0171
G1 X127.525 Y112.757 E.0171
G1 X127.094 Y112.404 E.0171
G1 X126.741 Y111.974 E.0171
G1 X126.479 Y111.483 E.0171
G1 X126.317 Y110.95 E.0171
G1 X126.263 Y110.396 E.0171
G1 X126.317 Y109.843 E.0171
G1 X126.479 Y109.31 E.0171
G1 X126.741 Y108.819 E.0171
G1 X127.094 Y108.389 E.0171
G1 X127.525 Y108.036 E.0171
G1 X128.015 Y107.773 E.0171
G1 X128.548 Y107.612 E.0171
G1 X129.102 Y107.557 E.0171
G1 X129.361 Y107.583 E.00799
G1 X129.656 Y107.612 E.00911
G1 X130.188 Y107.773 E.0171
G1 X130.679 Y108.036 E.0171
G1 X131.109 Y108.389 E.0171
G1 X131.462 Y108.819 E.0171
G1 X131.725 Y109.31 E.0171
G1 X131.886 Y109.843 E.0171
G1 X131.941 Y110.396 E.0171
G1 X131.886 Y110.95 E.0171
G1 X131.725 Y111.483 E.0171
G1 X131.462 Y111.974 E.0171
G1 X131.118 Y112.394 E.01669
M204 S10000
; WIPE_START
G1 F24000
G1 X130.679 Y112.757 E-.21642
G1 X130.188 Y113.019 E-.21149
G1 X129.656 Y113.181 E-.21148
G1 X129.34 Y113.212 E-.12061
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I-1.215 J.064 P1  F30000
G1 X129.975 Y125.252 Z3.2
G1 Z2.8
G1 E.8 F1800
M204 S5000
G1 F2194
G1 X130.149 Y125.243 E.00536
G1 X130.739 Y125.339 E.01835
G1 X131.293 Y125.56 E.01835
G1 X131.788 Y125.895 E.01835
G1 X132.198 Y126.329 E.01835
G1 X132.506 Y126.841 E.01835
G1 X132.697 Y127.406 E.01835
G1 X132.761 Y128 E.01835
G1 X132.697 Y128.594 E.01835
G1 X132.506 Y129.159 E.01835
G1 X132.198 Y129.671 E.01835
G1 X131.981 Y129.9 E.00969
G1 X131.788 Y130.105 E.00866
G1 X131.293 Y130.44 E.01835
G1 X130.739 Y130.661 E.01835
G1 X130.149 Y130.757 E.01835
G1 X129.553 Y130.725 E.01835
G1 X128.978 Y130.565 E.01835
G1 X128.45 Y130.285 E.01835
G1 X127.995 Y129.899 E.01835
G1 X127.634 Y129.424 E.01835
G1 X127.383 Y128.882 E.01835
G1 X127.255 Y128.299 E.01835
G1 X127.255 Y127.701 E.01835
G1 X127.383 Y127.118 E.01835
G1 X127.634 Y126.576 E.01835
G1 X127.995 Y126.101 E.01835
G1 X128.45 Y125.715 E.01835
G1 X128.978 Y125.435 E.01835
G1 X129.553 Y125.275 E.01835
G1 X129.835 Y125.26 E.00866
G1 X129.915 Y125.256 E.00248
M204 S10000
; WIPE_START
G1 F24000
G1 X130.149 Y125.243 E-.08911
G1 X130.739 Y125.339 E-.22689
G1 X131.293 Y125.56 E-.22689
G1 X131.766 Y125.881 E-.21711
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I-1.215 J.06 P1  F30000
G1 X131.971 Y130.037 Z3.2
G1 Z2.8
G1 E.8 F1800
M204 S5000
G1 F2194
G1 X131.577 Y130.361 E.01566
G1 X131.086 Y130.623 E.0171
G1 X130.554 Y130.784 E.0171
G1 X130 Y130.839 E.0171
G1 X129.446 Y130.784 E.0171
G1 X128.914 Y130.623 E.0171
M73 P71 R3
G1 X128.423 Y130.361 E.0171
G1 X127.993 Y130.007 E.0171
G1 X127.639 Y129.577 E.0171
G1 X127.377 Y129.086 E.0171
G1 X127.216 Y128.554 E.0171
G1 X127.161 Y128 E.0171
G1 X127.216 Y127.446 E.0171
G1 X127.377 Y126.914 E.0171
G1 X127.639 Y126.423 E.0171
G1 X127.993 Y125.993 E.0171
G1 X128.423 Y125.639 E.0171
G1 X128.914 Y125.377 E.0171
G1 X129.446 Y125.216 E.0171
G1 X130 Y125.161 E.0171
G1 X130.259 Y125.187 E.00799
G1 X130.554 Y125.216 E.00911
G1 X131.086 Y125.377 E.0171
G1 X131.577 Y125.639 E.0171
G1 X132.007 Y125.993 E.0171
G1 X132.361 Y126.423 E.0171
G1 X132.623 Y126.914 E.0171
G1 X132.784 Y127.446 E.0171
G1 X132.839 Y128 E.0171
G1 X132.784 Y128.554 E.0171
G1 X132.623 Y129.086 E.0171
G1 X132.361 Y129.577 E.0171
G1 X132.016 Y129.997 E.01669
M204 S10000
; WIPE_START
G1 F24000
G1 X131.577 Y130.361 E-.21642
G1 X131.086 Y130.623 E-.21149
G1 X130.554 Y130.784 E-.21148
G1 X130.238 Y130.816 E-.12061
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I-.589 J-1.065 P1  F30000
G1 X111.313 Y141.284 Z3.2
G1 Z2.8
G1 E.8 F1800
M204 S5000
G1 F2194
G1 X111.163 Y141.443 E.00672
G1 X110.669 Y141.778 E.01835
G1 X110.114 Y141.999 E.01835
G1 X109.525 Y142.096 E.01835
G1 X108.929 Y142.063 E.01835
G1 X108.353 Y141.904 E.01835
G1 X107.826 Y141.624 E.01835
G1 X107.371 Y141.237 E.01835
G1 X107.009 Y140.762 E.01835
G1 X106.759 Y140.22 E.01835
G1 X106.63 Y139.637 E.01835
G1 X106.63 Y139.04 E.01835
G1 X106.759 Y138.457 E.01835
G1 X107.009 Y137.915 E.01835
G1 X107.371 Y137.44 E.01835
G1 X107.826 Y137.053 E.01835
G1 X108.353 Y136.773 E.01835
G1 X108.929 Y136.614 E.01835
G1 X109.273 Y136.595 E.01061
G1 X109.525 Y136.581 E.00774
G1 X110.114 Y136.678 E.01835
G1 X110.669 Y136.899 E.01835
G1 X111.163 Y137.234 E.01835
G1 X111.574 Y137.667 E.01835
G1 X111.881 Y138.179 E.01835
G1 X112.072 Y138.745 E.01835
G1 X112.137 Y139.339 E.01835
G1 X112.072 Y139.932 E.01835
G1 X111.881 Y140.498 E.01835
G1 X111.574 Y141.01 E.01835
G1 X111.355 Y141.241 E.00978
M204 S10000
; WIPE_START
G1 F24000
G1 X111.163 Y141.443 E-.10596
G1 X110.669 Y141.778 E-.22689
G1 X110.114 Y141.999 E-.22689
G1 X109.594 Y142.084 E-.20026
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I1.215 J-.067 P1  F30000
G1 X109.286 Y136.508 Z3.2
G1 Z2.8
G1 E.8 F1800
M204 S5000
G1 F2194
G1 X109.375 Y136.5 E.00277
G1 X109.703 Y136.532 E.0101
G1 X109.929 Y136.554 E.007
G1 X110.462 Y136.716 E.0171
G1 X110.953 Y136.978 E.0171
G1 X111.383 Y137.331 E.0171
G1 X111.736 Y137.761 E.0171
G1 X111.998 Y138.252 E.0171
G1 X112.16 Y138.785 E.0171
G1 X112.214 Y139.339 E.0171
G1 X112.16 Y139.892 E.0171
G1 X111.998 Y140.425 E.0171
G1 X111.736 Y140.916 E.0171
G1 X111.383 Y141.346 E.0171
G1 X110.953 Y141.699 E.0171
G1 X110.462 Y141.961 E.0171
G1 X109.929 Y142.123 E.0171
G1 X109.375 Y142.177 E.0171
G1 X108.822 Y142.123 E.0171
G1 X108.289 Y141.961 E.0171
G1 X107.798 Y141.699 E.0171
G1 X107.368 Y141.346 E.0171
G1 X107.015 Y140.916 E.0171
G1 X106.752 Y140.425 E.0171
G1 X106.591 Y139.892 E.0171
G1 X106.536 Y139.339 E.0171
G1 X106.591 Y138.785 E.0171
G1 X106.752 Y138.252 E.0171
G1 X107.015 Y137.761 E.0171
G1 X107.368 Y137.331 E.0171
G1 X107.798 Y136.978 E.0171
G1 X108.289 Y136.716 E.0171
G1 X108.822 Y136.554 E.0171
G1 X109.226 Y136.514 E.01248
M204 S10000
; WIPE_START
G1 F24000
G1 X109.375 Y136.5 E-.05709
G1 X109.703 Y136.532 E-.12497
G1 X109.929 Y136.554 E-.08652
G1 X110.462 Y136.716 E-.21149
G1 X110.953 Y136.978 E-.21148
G1 X111.092 Y137.092 E-.06846
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I1.217 J.02 P1  F30000
G1 X111.355 Y121.279 Z3.2
G1 Z2.8
G1 E.8 F1800
M204 S5000
G1 F2194
G1 X111.204 Y121.438 E.00672
G1 X110.71 Y121.773 E.01835
G1 X110.155 Y121.994 E.01835
G1 X109.566 Y122.091 E.01835
G1 X108.97 Y122.059 E.01835
G1 X108.394 Y121.899 E.01835
G1 X107.867 Y121.619 E.01835
G1 X107.412 Y121.233 E.01835
G1 X107.051 Y120.757 E.01835
G1 X106.8 Y120.215 E.01835
G1 X106.671 Y119.632 E.01835
G1 X106.671 Y119.035 E.01835
G1 X106.8 Y118.452 E.01835
G1 X107.051 Y117.91 E.01835
G1 X107.412 Y117.435 E.01835
G1 X107.867 Y117.048 E.01835
G1 X108.394 Y116.769 E.01835
G1 X108.97 Y116.609 E.01835
G1 X109.314 Y116.59 E.01061
G1 X109.566 Y116.577 E.00774
G1 X110.155 Y116.673 E.01835
G1 X110.71 Y116.894 E.01835
G1 X111.204 Y117.229 E.01835
G1 X111.615 Y117.663 E.01835
G1 X111.923 Y118.174 E.01835
G1 X112.113 Y118.74 E.01835
G1 X112.178 Y119.334 E.01835
G1 X112.113 Y119.927 E.01835
G1 X111.923 Y120.493 E.01835
G1 X111.615 Y121.005 E.01835
G1 X111.396 Y121.236 E.00978
M204 S10000
; WIPE_START
G1 F24000
G1 X111.204 Y121.438 E-.10596
G1 X110.71 Y121.773 E-.22689
G1 X110.155 Y121.994 E-.22689
G1 X109.635 Y122.08 E-.20026
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I1.215 J-.067 P1  F30000
G1 X109.327 Y116.504 Z3.2
G1 Z2.8
G1 E.8 F1800
M204 S5000
G1 F2194
G1 X109.417 Y116.495 E.00277
G1 X109.744 Y116.527 E.0101
G1 X109.97 Y116.549 E.007
G1 X110.503 Y116.711 E.0171
G1 X110.994 Y116.973 E.0171
G1 X111.424 Y117.326 E.0171
G1 X111.777 Y117.757 E.0171
G1 X112.039 Y118.247 E.0171
G1 X112.201 Y118.78 E.0171
G1 X112.256 Y119.334 E.0171
G1 X112.201 Y119.888 E.0171
G1 X112.039 Y120.42 E.0171
G1 X111.777 Y120.911 E.0171
G1 X111.424 Y121.341 E.0171
G1 X110.994 Y121.694 E.0171
G1 X110.503 Y121.957 E.0171
G1 X109.97 Y122.118 E.0171
G1 X109.417 Y122.173 E.0171
G1 X108.863 Y122.118 E.0171
G1 X108.33 Y121.957 E.0171
G1 X107.839 Y121.694 E.0171
G1 X107.409 Y121.341 E.0171
G1 X107.056 Y120.911 E.0171
G1 X106.794 Y120.42 E.0171
G1 X106.632 Y119.888 E.0171
G1 X106.578 Y119.334 E.0171
G1 X106.632 Y118.78 E.0171
G1 X106.794 Y118.247 E.0171
G1 X107.056 Y117.757 E.0171
G1 X107.409 Y117.326 E.0171
G1 X107.839 Y116.973 E.0171
G1 X108.33 Y116.711 E.0171
G1 X108.863 Y116.549 E.0171
G1 X109.267 Y116.51 E.01248
M204 S10000
; WIPE_START
G1 F24000
G1 X109.417 Y116.495 E-.05709
G1 X109.744 Y116.527 E-.12497
G1 X109.97 Y116.549 E-.08652
G1 X110.503 Y116.711 E-.21149
G1 X110.994 Y116.973 E-.21148
G1 X111.133 Y117.088 E-.06846
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I1.217 J-.006 P1  F30000
G1 X111.061 Y101.503 Z3.2
G1 Z2.8
G1 E.8 F1800
M204 S5000
G1 F2194
G1 X110.91 Y101.662 E.00672
G1 X110.416 Y101.997 E.01835
G1 X109.861 Y102.218 E.01835
G1 X109.272 Y102.315 E.01835
G1 X108.676 Y102.282 E.01835
G1 X108.1 Y102.122 E.01835
G1 X107.573 Y101.843 E.01835
G1 X107.118 Y101.456 E.01835
G1 X106.756 Y100.981 E.01835
G1 X106.506 Y100.439 E.01835
G1 X106.377 Y99.856 E.01835
G1 X106.377 Y99.259 E.01835
G1 X106.506 Y98.676 E.01835
G1 X106.756 Y98.134 E.01835
G1 X107.118 Y97.658 E.01835
G1 X107.573 Y97.272 E.01835
G1 X108.1 Y96.992 E.01835
G1 X108.676 Y96.832 E.01835
G1 X109.02 Y96.814 E.01061
G1 X109.272 Y96.8 E.00774
G1 X109.861 Y96.897 E.01835
G1 X110.416 Y97.118 E.01835
G1 X110.91 Y97.453 E.01835
G1 X111.321 Y97.886 E.01835
G1 X111.628 Y98.398 E.01835
G1 X111.819 Y98.964 E.01835
G1 X111.884 Y99.557 E.01835
G1 X111.819 Y100.151 E.01835
G1 X111.628 Y100.717 E.01835
G1 X111.321 Y101.228 E.01835
G1 X111.102 Y101.459 E.00978
M204 S10000
; WIPE_START
G1 F24000
G1 X110.91 Y101.662 E-.10596
G1 X110.416 Y101.997 E-.22689
G1 X109.861 Y102.218 E-.22689
G1 X109.341 Y102.303 E-.20026
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I1.215 J-.067 P1  F30000
G1 X109.033 Y96.727 Z3.2
G1 Z2.8
G1 E.8 F1800
M204 S5000
G1 F2194
G1 X109.122 Y96.718 E.00277
G1 X109.45 Y96.751 E.0101
G1 X109.676 Y96.773 E.007
G1 X110.209 Y96.934 E.0171
G1 X110.7 Y97.197 E.0171
G1 X111.13 Y97.55 E.0171
G1 X111.483 Y97.98 E.0171
G1 X111.745 Y98.471 E.0171
G1 X111.907 Y99.003 E.0171
G1 X111.961 Y99.557 E.0171
G1 X111.907 Y100.111 E.0171
G1 X111.745 Y100.644 E.0171
G1 X111.483 Y101.135 E.0171
G1 X111.13 Y101.565 E.0171
G1 X110.7 Y101.918 E.0171
G1 X110.209 Y102.18 E.0171
G1 X109.676 Y102.342 E.0171
G1 X109.122 Y102.396 E.0171
G1 X108.569 Y102.342 E.0171
G1 X108.036 Y102.18 E.0171
G1 X107.545 Y101.918 E.0171
G1 X107.115 Y101.565 E.0171
G1 X106.762 Y101.135 E.0171
G1 X106.5 Y100.644 E.0171
G1 X106.338 Y100.111 E.0171
G1 X106.283 Y99.557 E.0171
G1 X106.338 Y99.003 E.0171
G1 X106.5 Y98.471 E.0171
G1 X106.762 Y97.98 E.0171
G1 X107.115 Y97.55 E.0171
G1 X107.545 Y97.197 E.0171
G1 X108.036 Y96.934 E.0171
G1 X108.569 Y96.773 E.0171
G1 X108.973 Y96.733 E.01248
M204 S10000
; WIPE_START
G1 F24000
G1 X109.122 Y96.718 E-.05709
G1 X109.45 Y96.751 E-.12497
G1 X109.676 Y96.773 E-.08652
G1 X110.209 Y96.934 E-.21149
G1 X110.7 Y97.197 E-.21148
G1 X110.839 Y97.311 E-.06846
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I1.216 J-.037 P1  F30000
G1 X110.278 Y78.687 Z3.2
G1 Z2.8
G1 E.8 F1800
M204 S5000
G1 F2194
G1 X110.128 Y78.846 E.00672
G1 X109.634 Y79.181 E.01835
G1 X109.079 Y79.402 E.01835
G1 X108.49 Y79.499 E.01835
G1 X107.894 Y79.467 E.01835
G1 X107.318 Y79.307 E.01835
G1 X106.791 Y79.027 E.01835
G1 X106.336 Y78.641 E.01835
G1 X105.974 Y78.165 E.01835
G1 X105.724 Y77.623 E.01835
G1 X105.595 Y77.04 E.01835
G1 X105.595 Y76.443 E.01835
G1 X105.724 Y75.86 E.01835
G1 X105.974 Y75.318 E.01835
G1 X106.336 Y74.843 E.01835
G1 X106.791 Y74.456 E.01835
G1 X107.318 Y74.177 E.01835
G1 X107.894 Y74.017 E.01835
G1 X108.238 Y73.998 E.01061
G1 X108.49 Y73.985 E.00774
G1 X109.079 Y74.081 E.01835
G1 X109.634 Y74.302 E.01835
G1 X110.128 Y74.637 E.01835
G1 X110.538 Y75.071 E.01835
G1 X110.846 Y75.582 E.01835
G1 X111.037 Y76.148 E.01835
G1 X111.102 Y76.742 E.01835
G1 X111.037 Y77.335 E.01835
G1 X110.846 Y77.901 E.01835
G1 X110.538 Y78.413 E.01835
G1 X110.32 Y78.644 E.00978
M204 S10000
; WIPE_START
G1 F24000
G1 X110.128 Y78.846 E-.10596
G1 X109.634 Y79.181 E-.22689
G1 X109.079 Y79.402 E-.22689
G1 X108.559 Y79.488 E-.20026
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I1.215 J-.067 P1  F30000
G1 X108.25 Y73.912 Z3.2
G1 Z2.8
G1 E.8 F1800
M204 S5000
G1 F2194
G1 X108.34 Y73.903 E.00277
G1 X108.668 Y73.935 E.0101
G1 X108.894 Y73.957 E.007
G1 X109.427 Y74.119 E.0171
G1 X109.918 Y74.381 E.0171
G1 X110.348 Y74.734 E.0171
G1 X110.701 Y75.164 E.0171
G1 X110.963 Y75.655 E.0171
G1 X111.125 Y76.188 E.0171
G1 X111.179 Y76.742 E.0171
G1 X111.125 Y77.296 E.0171
G1 X110.963 Y77.828 E.0171
G1 X110.701 Y78.319 E.0171
G1 X110.348 Y78.749 E.0171
G1 X109.918 Y79.102 E.0171
G1 X109.427 Y79.365 E.0171
G1 X108.894 Y79.526 E.0171
G1 X108.34 Y79.581 E.0171
G1 X107.786 Y79.526 E.0171
G1 X107.254 Y79.365 E.0171
G1 X106.763 Y79.102 E.0171
G1 X106.333 Y78.749 E.0171
G1 X105.98 Y78.319 E.0171
G1 X105.717 Y77.828 E.0171
G1 X105.556 Y77.296 E.0171
G1 X105.501 Y76.742 E.0171
G1 X105.556 Y76.188 E.0171
G1 X105.717 Y75.655 E.0171
G1 X105.98 Y75.164 E.0171
G1 X106.333 Y74.734 E.0171
G1 X106.763 Y74.381 E.0171
G1 X107.254 Y74.119 E.0171
G1 X107.786 Y73.957 E.0171
G1 X108.191 Y73.917 E.01248
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 3
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X108.34 Y73.903 E-.05709
G1 X108.668 Y73.935 E-.12497
G1 X108.894 Y73.957 E-.08652
G1 X109.427 Y74.119 E-.21149
G1 X109.918 Y74.381 E-.21148
G1 X110.057 Y74.496 E-.06846
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 15/32
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
G3 Z3.2 I-.61 J1.053 P1  F30000
G1 X129.326 Y85.669 Z3.2
G1 Z3
G1 E.8 F1800
M204 S5000
G1 F2194
G1 X129.495 Y85.66 E.0052
G1 X130.084 Y85.756 E.01835
G1 X130.639 Y85.977 E.01835
G1 X131.133 Y86.312 E.01835
G1 X131.543 Y86.746 E.01835
G1 X131.851 Y87.257 E.01835
G1 X132.042 Y87.823 E.01835
G1 X132.106 Y88.417 E.01835
G1 X132.042 Y89.01 E.01835
G1 X131.851 Y89.576 E.01835
G1 X131.543 Y90.088 E.01835
G1 X131.34 Y90.303 E.0091
G1 X131.133 Y90.521 E.00925
G1 X130.639 Y90.856 E.01835
G1 X130.084 Y91.077 E.01835
G1 X129.495 Y91.174 E.01835
G1 X128.898 Y91.142 E.01835
G1 X128.323 Y90.982 E.01835
G1 X127.796 Y90.702 E.01835
G1 X127.341 Y90.316 E.01835
G1 X126.979 Y89.84 E.01835
G1 X126.728 Y89.298 E.01835
G1 X126.6 Y88.715 E.01835
G1 X126.6 Y88.118 E.01835
G1 X126.728 Y87.535 E.01835
G1 X126.979 Y86.993 E.01835
G1 X127.341 Y86.518 E.01835
G1 X127.796 Y86.131 E.01835
G1 X128.323 Y85.852 E.01835
G1 X128.898 Y85.692 E.01835
G1 X129.199 Y85.676 E.00925
G1 X129.266 Y85.672 E.00206
M204 S10000
; WIPE_START
G1 F24000
G1 X129.495 Y85.66 E-.08705
G1 X130.084 Y85.756 E-.22689
M73 P72 R3
G1 X130.639 Y85.977 E-.22689
G1 X131.116 Y86.301 E-.21917
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.215 J.06 P1  F30000
G1 X131.322 Y90.45 Z3.4
G1 Z3
G1 E.8 F1800
M204 S5000
G1 F2194
G1 X130.922 Y90.777 E.01587
G1 X130.432 Y91.04 E.0171
G1 X129.899 Y91.201 E.0171
G1 X129.345 Y91.256 E.0171
G1 X128.791 Y91.201 E.0171
G1 X128.259 Y91.04 E.0171
G1 X127.768 Y90.777 E.0171
G1 X127.338 Y90.424 E.0171
G1 X126.985 Y89.994 E.0171
G1 X126.722 Y89.503 E.0171
G1 X126.561 Y88.971 E.0171
G1 X126.506 Y88.417 E.0171
G1 X126.561 Y87.863 E.0171
G1 X126.722 Y87.33 E.0171
G1 X126.985 Y86.839 E.0171
G1 X127.338 Y86.409 E.0171
G1 X127.768 Y86.056 E.0171
G1 X128.259 Y85.794 E.0171
G1 X128.791 Y85.632 E.0171
G1 X129.345 Y85.578 E.0171
G1 X129.625 Y85.605 E.00863
G1 X129.899 Y85.632 E.00847
G1 X130.432 Y85.794 E.0171
G1 X130.922 Y86.056 E.0171
G1 X131.353 Y86.409 E.0171
G1 X131.706 Y86.839 E.0171
G1 X131.968 Y87.33 E.0171
G1 X132.13 Y87.863 E.0171
G1 X132.184 Y88.417 E.0171
G1 X132.13 Y88.971 E.0171
G1 X131.968 Y89.503 E.0171
G1 X131.706 Y89.994 E.0171
G1 X131.365 Y90.409 E.01649
M204 S10000
; WIPE_START
G1 F24000
G1 X130.922 Y90.777 E-.2189
G1 X130.432 Y91.04 E-.21148
G1 X129.899 Y91.201 E-.21149
G1 X129.59 Y91.232 E-.11813
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.216 J-.038 P1  F30000
G1 X129.082 Y107.648 Z3.4
G1 Z3
G1 E.8 F1800
M204 S5000
G1 F2194
G1 X129.251 Y107.639 E.0052
G1 X129.841 Y107.736 E.01835
G1 X130.395 Y107.957 E.01835
G1 X130.889 Y108.292 E.01835
G1 X131.3 Y108.725 E.01835
G1 X131.608 Y109.237 E.01835
G1 X131.798 Y109.803 E.01835
G1 X131.863 Y110.396 E.01835
G1 X131.798 Y110.99 E.01835
G1 X131.608 Y111.556 E.01835
G1 X131.3 Y112.067 E.01835
G1 X131.096 Y112.282 E.0091
G1 X130.889 Y112.501 E.00925
G1 X130.395 Y112.836 E.01835
G1 X129.841 Y113.057 E.01835
G1 X129.251 Y113.154 E.01835
G1 X128.655 Y113.121 E.01835
G1 X128.08 Y112.961 E.01835
G1 X127.552 Y112.682 E.01835
G1 X127.097 Y112.295 E.01835
G1 X126.736 Y111.82 E.01835
G1 X126.485 Y111.278 E.01835
G1 X126.357 Y110.695 E.01835
G1 X126.357 Y110.098 E.01835
G1 X126.485 Y109.515 E.01835
G1 X126.736 Y108.973 E.01835
G1 X127.097 Y108.497 E.01835
G1 X127.552 Y108.111 E.01835
G1 X128.08 Y107.831 E.01835
G1 X128.655 Y107.672 E.01835
G1 X128.956 Y107.655 E.00925
G1 X129.023 Y107.652 E.00206
M204 S10000
; WIPE_START
G1 F24000
G1 X129.251 Y107.639 E-.08705
G1 X129.841 Y107.736 E-.22689
G1 X130.395 Y107.957 E-.22689
G1 X130.873 Y108.28 E-.21917
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.215 J.06 P1  F30000
G1 X131.078 Y112.429 Z3.4
G1 Z3
G1 E.8 F1800
M204 S5000
G1 F2194
G1 X130.679 Y112.757 E.01587
G1 X130.188 Y113.019 E.0171
G1 X129.656 Y113.181 E.0171
G1 X129.102 Y113.235 E.0171
G1 X128.548 Y113.181 E.0171
G1 X128.015 Y113.019 E.0171
G1 X127.525 Y112.757 E.0171
G1 X127.094 Y112.404 E.0171
G1 X126.741 Y111.974 E.0171
G1 X126.479 Y111.483 E.0171
G1 X126.317 Y110.95 E.0171
G1 X126.263 Y110.396 E.0171
G1 X126.317 Y109.843 E.0171
G1 X126.479 Y109.31 E.0171
G1 X126.741 Y108.819 E.0171
G1 X127.094 Y108.389 E.0171
G1 X127.525 Y108.036 E.0171
G1 X128.015 Y107.773 E.0171
G1 X128.548 Y107.612 E.0171
G1 X129.102 Y107.557 E.0171
G1 X129.381 Y107.585 E.00863
G1 X129.656 Y107.612 E.00847
G1 X130.188 Y107.773 E.0171
G1 X130.679 Y108.036 E.0171
G1 X131.109 Y108.389 E.0171
G1 X131.462 Y108.819 E.0171
G1 X131.725 Y109.31 E.0171
G1 X131.886 Y109.843 E.0171
G1 X131.941 Y110.396 E.0171
G1 X131.886 Y110.95 E.0171
G1 X131.725 Y111.483 E.0171
G1 X131.462 Y111.974 E.0171
G1 X131.122 Y112.388 E.01649
M204 S10000
; WIPE_START
G1 F24000
G1 X130.679 Y112.757 E-.2189
G1 X130.188 Y113.019 E-.21148
G1 X129.656 Y113.181 E-.21149
G1 X129.346 Y113.211 E-.11813
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.215 J.064 P1  F30000
G1 X129.981 Y125.252 Z3.4
G1 Z3
G1 E.8 F1800
M204 S5000
G1 F2194
G1 X130.149 Y125.243 E.0052
G1 X130.739 Y125.339 E.01835
G1 X131.293 Y125.56 E.01835
G1 X131.788 Y125.895 E.01835
G1 X132.198 Y126.329 E.01835
G1 X132.506 Y126.841 E.01835
G1 X132.697 Y127.406 E.01835
G1 X132.761 Y128 E.01835
G1 X132.697 Y128.594 E.01835
G1 X132.506 Y129.159 E.01835
G1 X132.198 Y129.671 E.01835
G1 X131.995 Y129.886 E.0091
G1 X131.788 Y130.105 E.00925
G1 X131.293 Y130.44 E.01835
G1 X130.739 Y130.661 E.01835
G1 X130.149 Y130.757 E.01835
G1 X129.553 Y130.725 E.01835
G1 X128.978 Y130.565 E.01835
G1 X128.45 Y130.285 E.01835
G1 X127.995 Y129.899 E.01835
G1 X127.634 Y129.424 E.01835
G1 X127.383 Y128.882 E.01835
G1 X127.255 Y128.299 E.01835
G1 X127.255 Y127.701 E.01835
G1 X127.383 Y127.118 E.01835
G1 X127.634 Y126.576 E.01835
G1 X127.995 Y126.101 E.01835
G1 X128.45 Y125.715 E.01835
G1 X128.978 Y125.435 E.01835
G1 X129.553 Y125.275 E.01835
G1 X129.854 Y125.259 E.00925
G1 X129.921 Y125.255 E.00206
M204 S10000
; WIPE_START
G1 F24000
G1 X130.149 Y125.243 E-.08705
G1 X130.739 Y125.339 E-.22689
G1 X131.293 Y125.56 E-.22689
G1 X131.771 Y125.884 E-.21917
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.215 J.06 P1  F30000
G1 X131.976 Y130.033 Z3.4
G1 Z3
G1 E.8 F1800
M204 S5000
G1 F2194
G1 X131.577 Y130.361 E.01587
G1 X131.086 Y130.623 E.0171
G1 X130.554 Y130.784 E.0171
G1 X130 Y130.839 E.0171
G1 X129.446 Y130.784 E.0171
G1 X128.914 Y130.623 E.0171
G1 X128.423 Y130.361 E.0171
G1 X127.993 Y130.007 E.0171
G1 X127.639 Y129.577 E.0171
G1 X127.377 Y129.086 E.0171
G1 X127.216 Y128.554 E.0171
G1 X127.161 Y128 E.0171
G1 X127.216 Y127.446 E.0171
G1 X127.377 Y126.914 E.0171
G1 X127.639 Y126.423 E.0171
G1 X127.993 Y125.993 E.0171
G1 X128.423 Y125.639 E.0171
G1 X128.914 Y125.377 E.0171
G1 X129.446 Y125.216 E.0171
G1 X130 Y125.161 E.0171
G1 X130.28 Y125.189 E.00863
G1 X130.554 Y125.216 E.00847
G1 X131.086 Y125.377 E.0171
G1 X131.577 Y125.639 E.0171
G1 X132.007 Y125.993 E.0171
G1 X132.361 Y126.423 E.0171
G1 X132.623 Y126.914 E.0171
G1 X132.784 Y127.446 E.0171
G1 X132.839 Y128 E.0171
G1 X132.784 Y128.554 E.0171
G1 X132.623 Y129.086 E.0171
G1 X132.361 Y129.577 E.0171
G1 X132.02 Y129.992 E.01649
M204 S10000
; WIPE_START
G1 F24000
G1 X131.577 Y130.361 E-.2189
G1 X131.086 Y130.623 E-.21148
G1 X130.554 Y130.784 E-.21149
G1 X130.244 Y130.815 E-.11813
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.589 J-1.065 P1  F30000
G1 X111.314 Y141.283 Z3.4
G1 Z3
G1 E.8 F1800
M204 S5000
G1 F2194
G1 X111.163 Y141.443 E.00675
G1 X110.669 Y141.778 E.01835
G1 X110.114 Y141.999 E.01835
G1 X109.525 Y142.096 E.01835
G1 X108.929 Y142.063 E.01835
G1 X108.353 Y141.904 E.01835
G1 X107.826 Y141.624 E.01835
G1 X107.371 Y141.237 E.01835
G1 X107.009 Y140.762 E.01835
G1 X106.759 Y140.22 E.01835
G1 X106.63 Y139.637 E.01835
G1 X106.63 Y139.04 E.01835
G1 X106.759 Y138.457 E.01835
G1 X107.009 Y137.915 E.01835
G1 X107.371 Y137.44 E.01835
G1 X107.826 Y137.053 E.01835
G1 X108.353 Y136.773 E.01835
G1 X108.929 Y136.614 E.01835
G1 X109.256 Y136.596 E.01009
G1 X109.525 Y136.581 E.00826
G1 X110.114 Y136.678 E.01835
G1 X110.669 Y136.899 E.01835
G1 X111.163 Y137.234 E.01835
G1 X111.574 Y137.667 E.01835
G1 X111.881 Y138.179 E.01835
G1 X112.072 Y138.745 E.01835
G1 X112.137 Y139.339 E.01835
G1 X112.072 Y139.932 E.01835
G1 X111.881 Y140.498 E.01835
G1 X111.574 Y141.01 E.01835
G1 X111.355 Y141.24 E.00975
M204 S10000
; WIPE_START
G1 F24000
G1 X111.163 Y141.443 E-.10631
G1 X110.669 Y141.778 E-.22689
G1 X110.114 Y141.999 E-.22689
G1 X109.595 Y142.084 E-.19991
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I1.215 J-.071 P1  F30000
G1 X109.267 Y136.51 Z3.4
G1 Z3
G1 E.8 F1800
M204 S5000
G1 F2194
G1 X109.375 Y136.5 E.00334
G1 X109.684 Y136.53 E.00954
G1 X109.929 Y136.554 E.00756
G1 X110.462 Y136.716 E.0171
G1 X110.953 Y136.978 E.0171
G1 X111.383 Y137.331 E.0171
G1 X111.736 Y137.761 E.0171
G1 X111.998 Y138.252 E.0171
G1 X112.16 Y138.785 E.0171
G1 X112.214 Y139.339 E.0171
G1 X112.16 Y139.892 E.0171
G1 X111.998 Y140.425 E.0171
G1 X111.736 Y140.916 E.0171
G1 X111.383 Y141.346 E.0171
G1 X110.953 Y141.699 E.0171
G1 X110.462 Y141.961 E.0171
G1 X109.929 Y142.123 E.0171
G1 X109.375 Y142.177 E.0171
G1 X108.822 Y142.123 E.0171
G1 X108.289 Y141.961 E.0171
G1 X107.798 Y141.699 E.0171
G1 X107.368 Y141.346 E.0171
G1 X107.015 Y140.916 E.0171
G1 X106.752 Y140.425 E.0171
G1 X106.591 Y139.892 E.0171
G1 X106.536 Y139.339 E.0171
G1 X106.591 Y138.785 E.0171
G1 X106.752 Y138.252 E.0171
G1 X107.015 Y137.761 E.0171
G1 X107.368 Y137.331 E.0171
G1 X107.798 Y136.978 E.0171
G1 X108.289 Y136.716 E.0171
G1 X108.822 Y136.554 E.0171
G1 X109.207 Y136.516 E.01191
M204 S10000
; WIPE_START
G1 F24000
G1 X109.375 Y136.5 E-.06414
G1 X109.684 Y136.53 E-.11798
G1 X109.929 Y136.554 E-.09351
G1 X110.462 Y136.716 E-.21149
G1 X110.953 Y136.978 E-.21148
G1 X111.078 Y137.081 E-.06141
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I1.217 J.021 P1  F30000
G1 X111.355 Y121.279 Z3.4
G1 Z3
G1 E.8 F1800
M204 S5000
G1 F2194
G1 X111.204 Y121.438 E.00675
G1 X110.71 Y121.773 E.01835
G1 X110.155 Y121.994 E.01835
G1 X109.566 Y122.091 E.01835
G1 X108.97 Y122.059 E.01835
G1 X108.394 Y121.899 E.01835
G1 X107.867 Y121.619 E.01835
G1 X107.412 Y121.233 E.01835
G1 X107.051 Y120.757 E.01835
G1 X106.8 Y120.215 E.01835
G1 X106.671 Y119.632 E.01835
G1 X106.671 Y119.035 E.01835
G1 X106.8 Y118.452 E.01835
G1 X107.051 Y117.91 E.01835
G1 X107.412 Y117.435 E.01835
G1 X107.867 Y117.048 E.01835
G1 X108.394 Y116.769 E.01835
G1 X108.97 Y116.609 E.01835
G1 X109.298 Y116.591 E.01009
G1 X109.566 Y116.577 E.00826
G1 X110.155 Y116.673 E.01835
G1 X110.71 Y116.894 E.01835
G1 X111.204 Y117.229 E.01835
G1 X111.615 Y117.663 E.01835
G1 X111.923 Y118.174 E.01835
G1 X112.113 Y118.74 E.01835
G1 X112.178 Y119.334 E.01835
G1 X112.113 Y119.927 E.01835
G1 X111.923 Y120.493 E.01835
G1 X111.615 Y121.005 E.01835
G1 X111.397 Y121.235 E.00975
M204 S10000
; WIPE_START
G1 F24000
G1 X111.204 Y121.438 E-.10631
G1 X110.71 Y121.773 E-.22689
G1 X110.155 Y121.994 E-.22689
G1 X109.636 Y122.08 E-.19991
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I1.215 J-.071 P1  F30000
G1 X109.308 Y116.506 Z3.4
G1 Z3
G1 E.8 F1800
M204 S5000
G1 F2194
G1 X109.417 Y116.495 E.00334
G1 X109.725 Y116.525 E.00954
G1 X109.97 Y116.549 E.00756
G1 X110.503 Y116.711 E.0171
G1 X110.994 Y116.973 E.0171
G1 X111.424 Y117.326 E.0171
G1 X111.777 Y117.757 E.0171
G1 X112.039 Y118.247 E.0171
G1 X112.201 Y118.78 E.0171
G1 X112.256 Y119.334 E.0171
G1 X112.201 Y119.888 E.0171
G1 X112.039 Y120.42 E.0171
G1 X111.777 Y120.911 E.0171
G1 X111.424 Y121.341 E.0171
G1 X110.994 Y121.694 E.0171
G1 X110.503 Y121.957 E.0171
G1 X109.97 Y122.118 E.0171
G1 X109.417 Y122.173 E.0171
G1 X108.863 Y122.118 E.0171
G1 X108.33 Y121.957 E.0171
G1 X107.839 Y121.694 E.0171
G1 X107.409 Y121.341 E.0171
G1 X107.056 Y120.911 E.0171
G1 X106.794 Y120.42 E.0171
G1 X106.632 Y119.888 E.0171
G1 X106.578 Y119.334 E.0171
G1 X106.632 Y118.78 E.0171
G1 X106.794 Y118.247 E.0171
G1 X107.056 Y117.757 E.0171
G1 X107.409 Y117.326 E.0171
G1 X107.839 Y116.973 E.0171
G1 X108.33 Y116.711 E.0171
G1 X108.863 Y116.549 E.0171
G1 X109.249 Y116.511 E.01191
M204 S10000
; WIPE_START
G1 F24000
G1 X109.417 Y116.495 E-.06414
G1 X109.725 Y116.525 E-.11798
G1 X109.97 Y116.549 E-.09351
G1 X110.503 Y116.711 E-.21149
G1 X110.994 Y116.973 E-.21148
G1 X111.119 Y117.076 E-.06141
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I1.217 J-.004 P1  F30000
G1 X111.061 Y101.502 Z3.4
G1 Z3
G1 E.8 F1800
M204 S5000
G1 F2194
G1 X110.91 Y101.662 E.00675
G1 X110.416 Y101.997 E.01835
G1 X109.861 Y102.218 E.01835
G1 X109.272 Y102.315 E.01835
G1 X108.676 Y102.282 E.01835
G1 X108.1 Y102.122 E.01835
G1 X107.573 Y101.843 E.01835
G1 X107.118 Y101.456 E.01835
G1 X106.756 Y100.981 E.01835
G1 X106.506 Y100.439 E.01835
G1 X106.377 Y99.856 E.01835
G1 X106.377 Y99.259 E.01835
G1 X106.506 Y98.676 E.01835
G1 X106.756 Y98.134 E.01835
G1 X107.118 Y97.658 E.01835
G1 X107.573 Y97.272 E.01835
G1 X108.1 Y96.992 E.01835
G1 X108.676 Y96.832 E.01835
G1 X109.003 Y96.815 E.01009
G1 X109.272 Y96.8 E.00826
M73 P73 R3
G1 X109.861 Y96.897 E.01835
G1 X110.416 Y97.118 E.01835
G1 X110.91 Y97.453 E.01835
G1 X111.321 Y97.886 E.01835
G1 X111.628 Y98.398 E.01835
G1 X111.819 Y98.964 E.01835
G1 X111.884 Y99.557 E.01835
G1 X111.819 Y100.151 E.01835
G1 X111.628 Y100.717 E.01835
G1 X111.321 Y101.228 E.01835
G1 X111.102 Y101.459 E.00975
M204 S10000
; WIPE_START
G1 F24000
G1 X110.91 Y101.662 E-.10631
G1 X110.416 Y101.997 E-.22689
G1 X109.861 Y102.218 E-.22689
G1 X109.342 Y102.303 E-.19991
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I1.215 J-.071 P1  F30000
G1 X109.014 Y96.729 Z3.4
G1 Z3
G1 E.8 F1800
M204 S5000
G1 F2194
G1 X109.122 Y96.718 E.00334
G1 X109.431 Y96.749 E.00954
G1 X109.676 Y96.773 E.00756
G1 X110.209 Y96.934 E.0171
G1 X110.7 Y97.197 E.0171
G1 X111.13 Y97.55 E.0171
G1 X111.483 Y97.98 E.0171
G1 X111.745 Y98.471 E.0171
G1 X111.907 Y99.003 E.0171
G1 X111.961 Y99.557 E.0171
G1 X111.907 Y100.111 E.0171
G1 X111.745 Y100.644 E.0171
G1 X111.483 Y101.135 E.0171
G1 X111.13 Y101.565 E.0171
G1 X110.7 Y101.918 E.0171
G1 X110.209 Y102.18 E.0171
G1 X109.676 Y102.342 E.0171
G1 X109.122 Y102.396 E.0171
G1 X108.569 Y102.342 E.0171
G1 X108.036 Y102.18 E.0171
G1 X107.545 Y101.918 E.0171
G1 X107.115 Y101.565 E.0171
G1 X106.762 Y101.135 E.0171
G1 X106.5 Y100.644 E.0171
G1 X106.338 Y100.111 E.0171
G1 X106.283 Y99.557 E.0171
G1 X106.338 Y99.003 E.0171
G1 X106.5 Y98.471 E.0171
G1 X106.762 Y97.98 E.0171
G1 X107.115 Y97.55 E.0171
G1 X107.545 Y97.197 E.0171
G1 X108.036 Y96.934 E.0171
G1 X108.569 Y96.773 E.0171
G1 X108.954 Y96.735 E.01191
M204 S10000
; WIPE_START
G1 F24000
G1 X109.122 Y96.718 E-.06414
G1 X109.431 Y96.749 E-.11798
G1 X109.676 Y96.773 E-.09351
G1 X110.209 Y96.934 E-.21149
G1 X110.7 Y97.197 E-.21148
G1 X110.825 Y97.299 E-.06141
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I1.216 J-.036 P1  F30000
G1 X110.279 Y78.687 Z3.4
G1 Z3
G1 E.8 F1800
M204 S5000
G1 F2194
G1 X110.128 Y78.846 E.00675
G1 X109.634 Y79.181 E.01835
G1 X109.079 Y79.402 E.01835
G1 X108.49 Y79.499 E.01835
G1 X107.894 Y79.467 E.01835
G1 X107.318 Y79.307 E.01835
G1 X106.791 Y79.027 E.01835
G1 X106.336 Y78.641 E.01835
G1 X105.974 Y78.165 E.01835
G1 X105.724 Y77.623 E.01835
G1 X105.595 Y77.04 E.01835
G1 X105.595 Y76.443 E.01835
G1 X105.724 Y75.86 E.01835
G1 X105.974 Y75.318 E.01835
G1 X106.336 Y74.843 E.01835
G1 X106.791 Y74.456 E.01835
G1 X107.318 Y74.177 E.01835
G1 X107.894 Y74.017 E.01835
G1 X108.221 Y73.999 E.01009
G1 X108.49 Y73.985 E.00826
G1 X109.079 Y74.081 E.01835
G1 X109.634 Y74.302 E.01835
G1 X110.128 Y74.637 E.01835
G1 X110.538 Y75.071 E.01835
G1 X110.846 Y75.582 E.01835
G1 X111.037 Y76.148 E.01835
G1 X111.102 Y76.742 E.01835
G1 X111.037 Y77.335 E.01835
G1 X110.846 Y77.901 E.01835
G1 X110.538 Y78.413 E.01835
G1 X110.32 Y78.643 E.00975
M204 S10000
; WIPE_START
G1 F24000
G1 X110.128 Y78.846 E-.10631
G1 X109.634 Y79.181 E-.22689
G1 X109.079 Y79.402 E-.22689
G1 X108.56 Y79.487 E-.19991
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I1.215 J-.071 P1  F30000
G1 X108.232 Y73.913 Z3.4
G1 Z3
G1 E.8 F1800
M204 S5000
G1 F2194
G1 X108.34 Y73.903 E.00334
G1 X108.649 Y73.933 E.00954
G1 X108.894 Y73.957 E.00756
G1 X109.427 Y74.119 E.0171
G1 X109.918 Y74.381 E.0171
G1 X110.348 Y74.734 E.0171
G1 X110.701 Y75.164 E.0171
G1 X110.963 Y75.655 E.0171
G1 X111.125 Y76.188 E.0171
G1 X111.179 Y76.742 E.0171
G1 X111.125 Y77.296 E.0171
G1 X110.963 Y77.828 E.0171
G1 X110.701 Y78.319 E.0171
G1 X110.348 Y78.749 E.0171
G1 X109.918 Y79.102 E.0171
G1 X109.427 Y79.365 E.0171
G1 X108.894 Y79.526 E.0171
G1 X108.34 Y79.581 E.0171
G1 X107.786 Y79.526 E.0171
G1 X107.254 Y79.365 E.0171
G1 X106.763 Y79.102 E.0171
G1 X106.333 Y78.749 E.0171
G1 X105.98 Y78.319 E.0171
G1 X105.717 Y77.828 E.0171
G1 X105.556 Y77.296 E.0171
G1 X105.501 Y76.742 E.0171
G1 X105.556 Y76.188 E.0171
G1 X105.717 Y75.655 E.0171
G1 X105.98 Y75.164 E.0171
G1 X106.333 Y74.734 E.0171
G1 X106.763 Y74.381 E.0171
G1 X107.254 Y74.119 E.0171
G1 X107.786 Y73.957 E.0171
G1 X108.172 Y73.919 E.01191
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 3.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X108.34 Y73.903 E-.06414
G1 X108.649 Y73.933 E-.11798
G1 X108.894 Y73.957 E-.09351
G1 X109.427 Y74.119 E-.21149
G1 X109.918 Y74.381 E-.21148
G1 X110.042 Y74.484 E-.06141
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 16/32
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
G3 Z3.4 I-.611 J1.053 P1  F30000
G1 X129.328 Y85.669 Z3.4
G1 Z3.2
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X129.495 Y85.66 E.00514
G1 X130.084 Y85.756 E.01835
G1 X130.639 Y85.977 E.01835
G1 X131.133 Y86.312 E.01835
G1 X131.543 Y86.746 E.01835
G1 X131.851 Y87.257 E.01835
G1 X132.042 Y87.823 E.01835
G1 X132.106 Y88.417 E.01835
G1 X132.042 Y89.01 E.01835
G1 X131.851 Y89.576 E.01835
G1 X131.543 Y90.088 E.01835
G1 X131.353 Y90.289 E.00851
G1 X131.133 Y90.521 E.00984
G1 X130.639 Y90.856 E.01835
G1 X130.084 Y91.077 E.01835
G1 X129.495 Y91.174 E.01835
G1 X128.898 Y91.142 E.01835
G1 X128.323 Y90.982 E.01835
G1 X127.796 Y90.702 E.01835
G1 X127.552 Y90.495 E.00984
G1 X127.341 Y90.316 E.00851
G1 X126.979 Y89.84 E.01835
G1 X126.728 Y89.298 E.01835
G1 X126.6 Y88.715 E.01835
G1 X126.6 Y88.118 E.01835
G1 X126.728 Y87.535 E.01835
G1 X126.979 Y86.993 E.01835
G1 X127.341 Y86.518 E.01835
G1 X127.796 Y86.131 E.01835
G1 X128.323 Y85.852 E.01835
G1 X128.898 Y85.692 E.01835
G1 X129.218 Y85.675 E.00984
G1 X129.268 Y85.672 E.00153
M204 S10000
; WIPE_START
G1 F24000
G1 X129.495 Y85.66 E-.08632
G1 X130.084 Y85.756 E-.22689
G1 X130.639 Y85.977 E-.22689
G1 X131.118 Y86.302 E-.2199
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I-1.215 J.061 P1  F30000
G1 X131.327 Y90.445 Z3.6
G1 Z3.2
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X130.922 Y90.777 E.01607
G1 X130.432 Y91.04 E.0171
G1 X129.899 Y91.201 E.0171
G1 X129.345 Y91.256 E.0171
G1 X128.791 Y91.201 E.0171
G1 X128.259 Y91.04 E.0171
G1 X127.768 Y90.777 E.0171
G1 X127.338 Y90.424 E.0171
G1 X126.985 Y89.994 E.0171
G1 X126.722 Y89.503 E.0171
G1 X126.561 Y88.971 E.0171
G1 X126.506 Y88.417 E.0171
G1 X126.561 Y87.863 E.0171
G1 X126.722 Y87.33 E.0171
G1 X126.985 Y86.839 E.0171
G1 X127.338 Y86.409 E.0171
G1 X127.768 Y86.056 E.0171
G1 X128.259 Y85.794 E.0171
G1 X128.791 Y85.632 E.0171
G1 X129.345 Y85.578 E.0171
G1 X129.645 Y85.607 E.00927
G1 X129.899 Y85.632 E.00783
G1 X130.432 Y85.794 E.0171
G1 X130.922 Y86.056 E.0171
G1 X131.353 Y86.409 E.0171
G1 X131.706 Y86.839 E.0171
G1 X131.968 Y87.33 E.0171
G1 X132.13 Y87.863 E.0171
G1 X132.184 Y88.417 E.0171
G1 X132.13 Y88.971 E.0171
G1 X131.968 Y89.503 E.0171
G1 X131.706 Y89.994 E.0171
G1 X131.369 Y90.404 E.01629
M204 S10000
; WIPE_START
G1 F24000
G1 X130.922 Y90.777 E-.22139
G1 X130.432 Y91.04 E-.21149
G1 X129.899 Y91.201 E-.21148
G1 X129.596 Y91.231 E-.11564
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I-1.216 J-.038 P1  F30000
G1 X129.084 Y107.648 Z3.6
G1 Z3.2
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X129.251 Y107.639 E.00514
G1 X129.841 Y107.736 E.01835
G1 X130.395 Y107.957 E.01835
G1 X130.889 Y108.292 E.01835
G1 X131.3 Y108.725 E.01835
G1 X131.608 Y109.237 E.01835
G1 X131.798 Y109.803 E.01835
G1 X131.863 Y110.396 E.01835
G1 X131.798 Y110.99 E.01835
G1 X131.608 Y111.556 E.01835
G1 X131.3 Y112.067 E.01835
G1 X131.11 Y112.268 E.00851
G1 X130.889 Y112.501 E.00984
G1 X130.395 Y112.836 E.01835
G1 X129.841 Y113.057 E.01835
G1 X129.251 Y113.154 E.01835
G1 X128.655 Y113.121 E.01835
G1 X128.08 Y112.961 E.01835
G1 X127.552 Y112.682 E.01835
G1 X127.308 Y112.475 E.00984
G1 X127.097 Y112.295 E.00851
G1 X126.736 Y111.82 E.01835
G1 X126.485 Y111.278 E.01835
G1 X126.357 Y110.695 E.01835
G1 X126.357 Y110.098 E.01835
G1 X126.485 Y109.515 E.01835
G1 X126.736 Y108.973 E.01835
G1 X127.097 Y108.497 E.01835
G1 X127.552 Y108.111 E.01835
G1 X128.08 Y107.831 E.01835
G1 X128.655 Y107.672 E.01835
G1 X128.975 Y107.654 E.00984
G1 X129.024 Y107.651 E.00153
M204 S10000
; WIPE_START
G1 F24000
G1 X129.251 Y107.639 E-.08632
G1 X129.841 Y107.736 E-.22689
G1 X130.395 Y107.957 E-.22689
G1 X130.874 Y108.282 E-.2199
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I-1.215 J.061 P1  F30000
G1 X131.083 Y112.425 Z3.6
G1 Z3.2
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X130.679 Y112.757 E.01607
G1 X130.188 Y113.019 E.0171
G1 X129.656 Y113.181 E.0171
G1 X129.102 Y113.235 E.0171
G1 X128.548 Y113.181 E.0171
G1 X128.015 Y113.019 E.0171
G1 X127.525 Y112.757 E.0171
G1 X127.094 Y112.404 E.0171
G1 X126.741 Y111.974 E.0171
G1 X126.479 Y111.483 E.0171
G1 X126.317 Y110.95 E.0171
G1 X126.263 Y110.396 E.0171
G1 X126.317 Y109.843 E.0171
G1 X126.479 Y109.31 E.0171
G1 X126.741 Y108.819 E.0171
G1 X127.094 Y108.389 E.0171
G1 X127.525 Y108.036 E.0171
G1 X128.015 Y107.773 E.0171
G1 X128.548 Y107.612 E.0171
G1 X129.102 Y107.557 E.0171
G1 X129.402 Y107.587 E.00927
G1 X129.656 Y107.612 E.00783
G1 X130.188 Y107.773 E.0171
G1 X130.679 Y108.036 E.0171
G1 X131.109 Y108.389 E.0171
G1 X131.462 Y108.819 E.0171
G1 X131.725 Y109.31 E.0171
G1 X131.886 Y109.843 E.0171
G1 X131.941 Y110.396 E.0171
G1 X131.886 Y110.95 E.0171
G1 X131.725 Y111.483 E.0171
G1 X131.462 Y111.974 E.0171
G1 X131.126 Y112.383 E.01629
M204 S10000
; WIPE_START
G1 F24000
G1 X130.679 Y112.757 E-.22139
G1 X130.188 Y113.019 E-.21149
G1 X129.656 Y113.181 E-.21148
G1 X129.353 Y113.211 E-.11564
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I-1.215 J.064 P1  F30000
G1 X129.983 Y125.252 Z3.6
G1 Z3.2
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X130.149 Y125.243 E.00514
G1 X130.739 Y125.339 E.01835
G1 X131.293 Y125.56 E.01835
G1 X131.788 Y125.895 E.01835
G1 X132.198 Y126.329 E.01835
G1 X132.506 Y126.841 E.01835
G1 X132.697 Y127.406 E.01835
G1 X132.761 Y128 E.01835
G1 X132.697 Y128.594 E.01835
G1 X132.506 Y129.159 E.01835
G1 X132.198 Y129.671 E.01835
G1 X132.008 Y129.872 E.00851
G1 X131.788 Y130.105 E.00984
G1 X131.293 Y130.44 E.01835
G1 X130.739 Y130.661 E.01835
G1 X130.149 Y130.757 E.01835
G1 X129.553 Y130.725 E.01835
G1 X128.978 Y130.565 E.01835
G1 X128.45 Y130.285 E.01835
G1 X128.206 Y130.078 E.00984
G1 X127.995 Y129.899 E.00851
G1 X127.634 Y129.424 E.01835
G1 X127.383 Y128.882 E.01835
G1 X127.255 Y128.299 E.01835
G1 X127.255 Y127.701 E.01835
G1 X127.383 Y127.118 E.01835
G1 X127.634 Y126.576 E.01835
G1 X127.995 Y126.101 E.01835
G1 X128.45 Y125.715 E.01835
G1 X128.978 Y125.435 E.01835
G1 X129.553 Y125.275 E.01835
G1 X129.873 Y125.258 E.00984
G1 X129.923 Y125.255 E.00153
M204 S10000
; WIPE_START
G1 F24000
G1 X130.149 Y125.243 E-.08632
G1 X130.739 Y125.339 E-.22689
G1 X131.293 Y125.56 E-.22689
G1 X131.772 Y125.885 E-.2199
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I-1.215 J.061 P1  F30000
G1 X131.982 Y130.029 Z3.6
G1 Z3.2
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X131.577 Y130.361 E.01607
G1 X131.086 Y130.623 E.0171
G1 X130.554 Y130.784 E.0171
G1 X130 Y130.839 E.0171
G1 X129.446 Y130.784 E.0171
G1 X128.914 Y130.623 E.0171
G1 X128.423 Y130.361 E.0171
G1 X127.993 Y130.007 E.0171
G1 X127.639 Y129.577 E.0171
G1 X127.377 Y129.086 E.0171
G1 X127.216 Y128.554 E.0171
G1 X127.161 Y128 E.0171
G1 X127.216 Y127.446 E.0171
G1 X127.377 Y126.914 E.0171
G1 X127.639 Y126.423 E.0171
G1 X127.993 Y125.993 E.0171
G1 X128.423 Y125.639 E.0171
G1 X128.914 Y125.377 E.0171
G1 X129.446 Y125.216 E.0171
G1 X130 Y125.161 E.0171
G1 X130.3 Y125.191 E.00927
G1 X130.554 Y125.216 E.00783
G1 X131.086 Y125.377 E.0171
G1 X131.577 Y125.639 E.0171
G1 X132.007 Y125.993 E.0171
G1 X132.361 Y126.423 E.0171
G1 X132.623 Y126.914 E.0171
G1 X132.784 Y127.446 E.0171
G1 X132.839 Y128 E.0171
G1 X132.784 Y128.554 E.0171
G1 X132.623 Y129.086 E.0171
G1 X132.361 Y129.577 E.0171
G1 X132.024 Y129.987 E.01629
M204 S10000
; WIPE_START
G1 F24000
G1 X131.577 Y130.361 E-.22139
G1 X131.086 Y130.623 E-.21149
G1 X130.554 Y130.784 E-.21148
G1 X130.251 Y130.814 E-.11564
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I-.323 J-1.173 P1  F30000
G1 X109.254 Y136.596 Z3.6
G1 Z3.2
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X109.525 Y136.581 E.00833
G1 X110.114 Y136.678 E.01835
G1 X110.669 Y136.899 E.01835
G1 X111.163 Y137.234 E.01835
G1 X111.574 Y137.667 E.01835
G1 X111.881 Y138.179 E.01835
G1 X112.072 Y138.745 E.01835
M73 P74 R3
G1 X112.137 Y139.339 E.01835
G1 X112.072 Y139.932 E.01835
G1 X111.881 Y140.498 E.01835
G1 X111.574 Y141.01 E.01835
G1 X111.163 Y141.443 E.01835
G1 X110.669 Y141.778 E.01835
G1 X110.114 Y141.999 E.01835
G1 X109.525 Y142.096 E.01835
G1 X108.929 Y142.063 E.01835
G1 X108.353 Y141.904 E.01835
G1 X107.826 Y141.624 E.01835
G1 X107.371 Y141.237 E.01835
G1 X107.009 Y140.762 E.01835
G1 X106.759 Y140.22 E.01835
G1 X106.63 Y139.637 E.01835
G1 X106.63 Y139.04 E.01835
G1 X106.759 Y138.457 E.01835
G1 X107.009 Y137.915 E.01835
G1 X107.371 Y137.44 E.01835
G1 X107.826 Y137.053 E.01835
G1 X108.353 Y136.773 E.01835
G1 X108.929 Y136.614 E.01835
G1 X109.194 Y136.599 E.00818
M204 S10000
; WIPE_START
G1 F24000
G1 X109.525 Y136.581 E-.12577
G1 X110.114 Y136.678 E-.22689
G1 X110.669 Y136.899 E-.22689
G1 X111.062 Y137.165 E-.18044
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I-1.214 J.092 P1  F30000
G1 X111.378 Y141.35 Z3.6
G1 Z3.2
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X110.953 Y141.699 E.01691
G1 X110.462 Y141.961 E.0171
G1 X109.929 Y142.123 E.0171
G1 X109.375 Y142.177 E.0171
G1 X108.822 Y142.123 E.0171
G1 X108.289 Y141.961 E.0171
G1 X107.798 Y141.699 E.0171
G1 X107.368 Y141.346 E.0171
G1 X107.015 Y140.916 E.0171
G1 X106.752 Y140.425 E.0171
G1 X106.591 Y139.892 E.0171
G1 X106.536 Y139.339 E.0171
G1 X106.591 Y138.785 E.0171
G1 X106.752 Y138.252 E.0171
G1 X107.015 Y137.761 E.0171
G1 X107.368 Y137.331 E.0171
G1 X107.798 Y136.978 E.0171
G1 X108.289 Y136.716 E.0171
G1 X108.822 Y136.554 E.0171
G1 X109.375 Y136.5 E.0171
G1 X109.666 Y136.528 E.00897
G1 X109.929 Y136.554 E.00813
G1 X110.462 Y136.716 E.0171
G1 X110.953 Y136.978 E.0171
G1 X111.383 Y137.331 E.0171
G1 X111.736 Y137.761 E.0171
G1 X111.998 Y138.252 E.0171
G1 X112.16 Y138.785 E.0171
G1 X112.214 Y139.339 E.0171
G1 X112.16 Y139.892 E.0171
G1 X111.998 Y140.425 E.0171
G1 X111.736 Y140.916 E.0171
G1 X111.417 Y141.304 E.01544
M204 S10000
; WIPE_START
G1 F24000
G1 X110.953 Y141.699 E-.2316
G1 X110.462 Y141.961 E-.21149
G1 X109.929 Y142.123 E-.21148
G1 X109.653 Y142.15 E-.10543
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I1.217 J-.017 P1  F30000
G1 X109.295 Y116.591 Z3.6
G1 Z3.2
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X109.566 Y116.577 E.00833
G1 X110.155 Y116.673 E.01835
G1 X110.71 Y116.894 E.01835
G1 X111.204 Y117.229 E.01835
G1 X111.615 Y117.663 E.01835
G1 X111.923 Y118.174 E.01835
G1 X112.113 Y118.74 E.01835
G1 X112.178 Y119.334 E.01835
G1 X112.113 Y119.927 E.01835
G1 X111.923 Y120.493 E.01835
G1 X111.615 Y121.005 E.01835
G1 X111.204 Y121.438 E.01835
G1 X110.71 Y121.773 E.01835
G1 X110.155 Y121.994 E.01835
G1 X109.566 Y122.091 E.01835
G1 X108.97 Y122.059 E.01835
G1 X108.394 Y121.899 E.01835
G1 X107.867 Y121.619 E.01835
G1 X107.412 Y121.233 E.01835
G1 X107.051 Y120.757 E.01835
G1 X106.8 Y120.215 E.01835
G1 X106.671 Y119.632 E.01835
G1 X106.671 Y119.035 E.01835
G1 X106.8 Y118.452 E.01835
G1 X107.051 Y117.91 E.01835
G1 X107.412 Y117.435 E.01835
G1 X107.867 Y117.048 E.01835
G1 X108.394 Y116.769 E.01835
G1 X108.97 Y116.609 E.01835
G1 X109.236 Y116.595 E.00818
M204 S10000
; WIPE_START
G1 F24000
G1 X109.566 Y116.577 E-.12577
G1 X110.155 Y116.673 E-.22689
G1 X110.71 Y116.894 E-.22689
G1 X111.103 Y117.161 E-.18044
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I-1.214 J.092 P1  F30000
G1 X111.419 Y121.345 Z3.6
G1 Z3.2
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X110.994 Y121.694 E.01691
G1 X110.503 Y121.957 E.0171
G1 X109.97 Y122.118 E.0171
G1 X109.417 Y122.173 E.0171
G1 X108.863 Y122.118 E.0171
G1 X108.33 Y121.957 E.0171
G1 X107.839 Y121.694 E.0171
G1 X107.409 Y121.341 E.0171
G1 X107.056 Y120.911 E.0171
G1 X106.794 Y120.42 E.0171
G1 X106.632 Y119.888 E.0171
G1 X106.578 Y119.334 E.0171
G1 X106.632 Y118.78 E.0171
G1 X106.794 Y118.247 E.0171
G1 X107.056 Y117.757 E.0171
G1 X107.409 Y117.326 E.0171
G1 X107.839 Y116.973 E.0171
G1 X108.33 Y116.711 E.0171
G1 X108.863 Y116.549 E.0171
G1 X109.417 Y116.495 E.0171
G1 X109.707 Y116.523 E.00897
G1 X109.97 Y116.549 E.00813
G1 X110.503 Y116.711 E.0171
G1 X110.994 Y116.973 E.0171
G1 X111.424 Y117.326 E.0171
G1 X111.777 Y117.757 E.0171
G1 X112.039 Y118.247 E.0171
G1 X112.201 Y118.78 E.0171
G1 X112.256 Y119.334 E.0171
G1 X112.201 Y119.888 E.0171
G1 X112.039 Y120.42 E.0171
G1 X111.777 Y120.911 E.0171
G1 X111.458 Y121.3 E.01544
M204 S10000
; WIPE_START
G1 F24000
G1 X110.994 Y121.694 E-.2316
G1 X110.503 Y121.957 E-.21149
G1 X109.97 Y122.118 E-.21148
G1 X109.694 Y122.145 E-.10543
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I1.217 J-.033 P1  F30000
G1 X109.001 Y96.815 Z3.6
G1 Z3.2
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X109.272 Y96.8 E.00833
G1 X109.861 Y96.897 E.01835
G1 X110.416 Y97.118 E.01835
G1 X110.91 Y97.453 E.01835
G1 X111.321 Y97.886 E.01835
G1 X111.628 Y98.398 E.01835
G1 X111.819 Y98.964 E.01835
G1 X111.884 Y99.557 E.01835
G1 X111.819 Y100.151 E.01835
G1 X111.628 Y100.717 E.01835
G1 X111.321 Y101.228 E.01835
G1 X110.91 Y101.662 E.01835
G1 X110.416 Y101.997 E.01835
G1 X109.861 Y102.218 E.01835
M73 P74 R2
G1 X109.272 Y102.315 E.01835
G1 X108.676 Y102.282 E.01835
G1 X108.1 Y102.122 E.01835
G1 X107.573 Y101.843 E.01835
G1 X107.118 Y101.456 E.01835
G1 X106.756 Y100.981 E.01835
G1 X106.506 Y100.439 E.01835
G1 X106.377 Y99.856 E.01835
G1 X106.377 Y99.259 E.01835
G1 X106.506 Y98.676 E.01835
G1 X106.756 Y98.134 E.01835
G1 X107.118 Y97.658 E.01835
G1 X107.573 Y97.272 E.01835
G1 X108.1 Y96.992 E.01835
G1 X108.676 Y96.832 E.01835
G1 X108.941 Y96.818 E.00818
M204 S10000
; WIPE_START
G1 F24000
G1 X109.272 Y96.8 E-.12577
G1 X109.861 Y96.897 E-.22689
G1 X110.416 Y97.118 E-.22689
G1 X110.809 Y97.384 E-.18044
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I-1.214 J.092 P1  F30000
G1 X111.125 Y101.569 Z3.6
G1 Z3.2
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X110.7 Y101.918 E.01691
G1 X110.209 Y102.18 E.0171
G1 X109.676 Y102.342 E.0171
G1 X109.122 Y102.396 E.0171
G1 X108.569 Y102.342 E.0171
G1 X108.036 Y102.18 E.0171
G1 X107.545 Y101.918 E.0171
G1 X107.115 Y101.565 E.0171
G1 X106.762 Y101.135 E.0171
G1 X106.5 Y100.644 E.0171
G1 X106.338 Y100.111 E.0171
G1 X106.283 Y99.557 E.0171
G1 X106.338 Y99.003 E.0171
G1 X106.5 Y98.471 E.0171
G1 X106.762 Y97.98 E.0171
G1 X107.115 Y97.55 E.0171
G1 X107.545 Y97.197 E.0171
G1 X108.036 Y96.934 E.0171
G1 X108.569 Y96.773 E.0171
G1 X109.122 Y96.718 E.0171
G1 X109.413 Y96.747 E.00897
G1 X109.676 Y96.773 E.00813
G1 X110.209 Y96.934 E.0171
G1 X110.7 Y97.197 E.0171
G1 X111.13 Y97.55 E.0171
G1 X111.483 Y97.98 E.0171
G1 X111.745 Y98.471 E.0171
G1 X111.907 Y99.003 E.0171
G1 X111.961 Y99.557 E.0171
G1 X111.907 Y100.111 E.0171
G1 X111.745 Y100.644 E.0171
G1 X111.483 Y101.135 E.0171
G1 X111.164 Y101.523 E.01544
M204 S10000
; WIPE_START
G1 F24000
G1 X110.7 Y101.918 E-.2316
G1 X110.209 Y102.18 E-.21149
G1 X109.676 Y102.342 E-.21148
G1 X109.4 Y102.369 E-.10543
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I1.216 J-.051 P1  F30000
G1 X108.219 Y73.999 Z3.6
G1 Z3.2
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X108.49 Y73.985 E.00833
G1 X109.079 Y74.081 E.01835
G1 X109.634 Y74.302 E.01835
G1 X110.128 Y74.637 E.01835
G1 X110.538 Y75.071 E.01835
G1 X110.846 Y75.582 E.01835
G1 X111.037 Y76.148 E.01835
G1 X111.102 Y76.742 E.01835
G1 X111.037 Y77.335 E.01835
G1 X110.846 Y77.901 E.01835
G1 X110.538 Y78.413 E.01835
G1 X110.128 Y78.846 E.01835
G1 X109.634 Y79.181 E.01835
G1 X109.079 Y79.402 E.01835
G1 X108.49 Y79.499 E.01835
G1 X107.894 Y79.467 E.01835
G1 X107.318 Y79.307 E.01835
G1 X106.791 Y79.027 E.01835
G1 X106.336 Y78.641 E.01835
G1 X105.974 Y78.165 E.01835
G1 X105.724 Y77.623 E.01835
G1 X105.595 Y77.04 E.01835
G1 X105.595 Y76.443 E.01835
G1 X105.724 Y75.86 E.01835
G1 X105.974 Y75.318 E.01835
G1 X106.336 Y74.843 E.01835
G1 X106.791 Y74.456 E.01835
G1 X107.318 Y74.177 E.01835
G1 X107.894 Y74.017 E.01835
G1 X108.159 Y74.002 E.00818
M204 S10000
; WIPE_START
G1 F24000
G1 X108.49 Y73.985 E-.12577
G1 X109.079 Y74.081 E-.22689
G1 X109.634 Y74.302 E-.22689
G1 X110.027 Y74.569 E-.18044
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I-1.214 J.092 P1  F30000
G1 X110.343 Y78.753 Z3.6
G1 Z3.2
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X109.918 Y79.102 E.01691
G1 X109.427 Y79.365 E.0171
G1 X108.894 Y79.526 E.0171
G1 X108.34 Y79.581 E.0171
G1 X107.786 Y79.526 E.0171
G1 X107.254 Y79.365 E.0171
G1 X106.763 Y79.102 E.0171
G1 X106.333 Y78.749 E.0171
G1 X105.98 Y78.319 E.0171
G1 X105.717 Y77.828 E.0171
G1 X105.556 Y77.296 E.0171
G1 X105.501 Y76.742 E.0171
G1 X105.556 Y76.188 E.0171
G1 X105.717 Y75.655 E.0171
G1 X105.98 Y75.164 E.0171
G1 X106.333 Y74.734 E.0171
G1 X106.763 Y74.381 E.0171
G1 X107.254 Y74.119 E.0171
G1 X107.786 Y73.957 E.0171
G1 X108.34 Y73.903 E.0171
G1 X108.631 Y73.931 E.00897
G1 X108.894 Y73.957 E.00813
G1 X109.427 Y74.119 E.0171
G1 X109.918 Y74.381 E.0171
G1 X110.348 Y74.734 E.0171
G1 X110.701 Y75.164 E.0171
G1 X110.963 Y75.655 E.0171
G1 X111.125 Y76.188 E.0171
G1 X111.179 Y76.742 E.0171
G1 X111.125 Y77.296 E.0171
G1 X110.963 Y77.828 E.0171
G1 X110.701 Y78.319 E.0171
G1 X110.382 Y78.708 E.01544
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 3.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X109.918 Y79.102 E-.2316
G1 X109.427 Y79.365 E-.21149
G1 X108.894 Y79.526 E-.21148
G1 X108.618 Y79.553 E-.10543
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 17/32
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
G3 Z3.6 I-.345 J1.167 P1  F30000
G1 X129.33 Y85.668 Z3.6
G1 Z3.4
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X129.495 Y85.66 E.00508
G1 X130.084 Y85.756 E.01835
G1 X130.639 Y85.977 E.01835
G1 X131.133 Y86.312 E.01835
G1 X131.543 Y86.746 E.01835
G1 X131.851 Y87.257 E.01835
G1 X132.042 Y87.823 E.01835
G1 X132.106 Y88.417 E.01835
G1 X132.042 Y89.01 E.01835
G1 X131.851 Y89.576 E.01835
G1 X131.543 Y90.088 E.01835
G1 X131.366 Y90.275 E.00792
G1 X131.133 Y90.521 E.01043
G1 X130.639 Y90.856 E.01835
G1 X130.084 Y91.077 E.01835
G1 X129.495 Y91.174 E.01835
G1 X128.898 Y91.142 E.01835
G1 X128.323 Y90.982 E.01835
G1 X127.796 Y90.702 E.01835
G1 X127.341 Y90.316 E.01835
G1 X126.979 Y89.84 E.01835
G1 X126.728 Y89.298 E.01835
G1 X126.6 Y88.715 E.01835
G1 X126.6 Y88.118 E.01835
G1 X126.728 Y87.535 E.01835
G1 X126.979 Y86.993 E.01835
G1 X127.341 Y86.518 E.01835
G1 X127.796 Y86.131 E.01835
G1 X128.323 Y85.852 E.01835
G1 X128.898 Y85.692 E.01835
G1 X129.237 Y85.673 E.01043
G1 X129.27 Y85.672 E.001
M204 S10000
; WIPE_START
G1 F24000
G1 X129.495 Y85.66 E-.08558
G1 X130.084 Y85.756 E-.22689
G1 X130.639 Y85.977 E-.22689
G1 X131.119 Y86.303 E-.22063
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I-1.215 J.062 P1  F30000
G1 X131.332 Y90.441 Z3.8
G1 Z3.4
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X130.922 Y90.777 E.01628
G1 X130.432 Y91.04 E.0171
G1 X129.899 Y91.201 E.0171
G1 X129.345 Y91.256 E.0171
G1 X128.791 Y91.201 E.0171
G1 X128.259 Y91.04 E.0171
G1 X127.768 Y90.777 E.0171
G1 X127.338 Y90.424 E.0171
G1 X126.985 Y89.994 E.0171
G1 X126.722 Y89.503 E.0171
G1 X126.561 Y88.971 E.0171
G1 X126.506 Y88.417 E.0171
G1 X126.561 Y87.863 E.0171
G1 X126.722 Y87.33 E.0171
G1 X126.985 Y86.839 E.0171
G1 X127.338 Y86.409 E.0171
G1 X127.768 Y86.056 E.0171
G1 X128.259 Y85.794 E.0171
G1 X128.791 Y85.632 E.0171
G1 X129.345 Y85.578 E.0171
G1 X129.666 Y85.609 E.00991
G1 X129.899 Y85.632 E.00719
G1 X130.432 Y85.794 E.0171
G1 X130.922 Y86.056 E.0171
G1 X131.353 Y86.409 E.0171
G1 X131.706 Y86.839 E.0171
G1 X131.968 Y87.33 E.0171
G1 X132.13 Y87.863 E.0171
G1 X132.184 Y88.417 E.0171
G1 X132.13 Y88.971 E.0171
G1 X131.968 Y89.503 E.0171
G1 X131.706 Y89.994 E.0171
G1 X131.374 Y90.399 E.01608
M204 S10000
; WIPE_START
G1 F24000
G1 X130.922 Y90.777 E-.22387
G1 X130.432 Y91.04 E-.21148
G1 X129.899 Y91.201 E-.21149
G1 X129.603 Y91.23 E-.11316
; WIPE_END
M73 P75 R2
G1 E-.04 F1800
G17
G3 Z3.8 I-1.216 J-.038 P1  F30000
G1 X129.086 Y107.648 Z3.8
G1 Z3.4
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X129.251 Y107.639 E.00508
G1 X129.841 Y107.736 E.01835
G1 X130.395 Y107.957 E.01835
G1 X130.889 Y108.292 E.01835
G1 X131.3 Y108.725 E.01835
G1 X131.608 Y109.237 E.01835
G1 X131.798 Y109.803 E.01835
G1 X131.863 Y110.396 E.01835
G1 X131.798 Y110.99 E.01835
G1 X131.608 Y111.556 E.01835
G1 X131.3 Y112.067 E.01835
G1 X131.123 Y112.255 E.00792
G1 X130.889 Y112.501 E.01043
G1 X130.395 Y112.836 E.01835
G1 X129.841 Y113.057 E.01835
G1 X129.251 Y113.154 E.01835
G1 X128.655 Y113.121 E.01835
G1 X128.08 Y112.961 E.01835
G1 X127.552 Y112.682 E.01835
G1 X127.097 Y112.295 E.01835
G1 X126.736 Y111.82 E.01835
G1 X126.485 Y111.278 E.01835
G1 X126.357 Y110.695 E.01835
G1 X126.357 Y110.098 E.01835
G1 X126.485 Y109.515 E.01835
G1 X126.736 Y108.973 E.01835
G1 X127.097 Y108.497 E.01835
G1 X127.552 Y108.111 E.01835
G1 X128.08 Y107.831 E.01835
G1 X128.655 Y107.672 E.01835
G1 X128.994 Y107.653 E.01043
G1 X129.026 Y107.651 E.001
M204 S10000
; WIPE_START
G1 F24000
G1 X129.251 Y107.639 E-.08558
G1 X129.841 Y107.736 E-.22689
G1 X130.395 Y107.957 E-.22689
G1 X130.876 Y108.283 E-.22063
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I-1.215 J.062 P1  F30000
G1 X131.089 Y112.421 Z3.8
G1 Z3.4
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X130.679 Y112.757 E.01628
G1 X130.188 Y113.019 E.0171
G1 X129.656 Y113.181 E.0171
G1 X129.102 Y113.235 E.0171
G1 X128.548 Y113.181 E.0171
G1 X128.015 Y113.019 E.0171
G1 X127.525 Y112.757 E.0171
G1 X127.094 Y112.404 E.0171
G1 X126.741 Y111.974 E.0171
G1 X126.479 Y111.483 E.0171
G1 X126.317 Y110.95 E.0171
G1 X126.263 Y110.396 E.0171
G1 X126.317 Y109.843 E.0171
G1 X126.479 Y109.31 E.0171
G1 X126.741 Y108.819 E.0171
G1 X127.094 Y108.389 E.0171
G1 X127.525 Y108.036 E.0171
G1 X128.015 Y107.773 E.0171
G1 X128.548 Y107.612 E.0171
G1 X129.102 Y107.557 E.0171
G1 X129.423 Y107.589 E.00991
G1 X129.656 Y107.612 E.00719
G1 X130.188 Y107.773 E.0171
G1 X130.679 Y108.036 E.0171
G1 X131.109 Y108.389 E.0171
G1 X131.462 Y108.819 E.0171
G1 X131.725 Y109.31 E.0171
G1 X131.886 Y109.843 E.0171
G1 X131.941 Y110.396 E.0171
G1 X131.886 Y110.95 E.0171
G1 X131.725 Y111.483 E.0171
G1 X131.462 Y111.974 E.0171
G1 X131.13 Y112.378 E.01608
M204 S10000
; WIPE_START
G1 F24000
G1 X130.679 Y112.757 E-.22387
G1 X130.188 Y113.019 E-.21148
G1 X129.656 Y113.181 E-.21149
G1 X129.359 Y113.21 E-.11316
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I-1.215 J.063 P1  F30000
G1 X129.985 Y125.252 Z3.8
G1 Z3.4
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X130.149 Y125.243 E.00508
G1 X130.739 Y125.339 E.01835
G1 X131.293 Y125.56 E.01835
G1 X131.788 Y125.895 E.01835
G1 X132.198 Y126.329 E.01835
G1 X132.506 Y126.841 E.01835
G1 X132.697 Y127.406 E.01835
G1 X132.761 Y128 E.01835
G1 X132.697 Y128.594 E.01835
G1 X132.506 Y129.159 E.01835
G1 X132.198 Y129.671 E.01835
G1 X132.021 Y129.858 E.00792
G1 X131.788 Y130.105 E.01043
G1 X131.293 Y130.44 E.01835
G1 X130.739 Y130.661 E.01835
G1 X130.149 Y130.757 E.01835
G1 X129.553 Y130.725 E.01835
G1 X128.978 Y130.565 E.01835
G1 X128.45 Y130.285 E.01835
G1 X127.995 Y129.899 E.01835
G1 X127.634 Y129.424 E.01835
G1 X127.383 Y128.882 E.01835
G1 X127.255 Y128.299 E.01835
G1 X127.255 Y127.701 E.01835
G1 X127.383 Y127.118 E.01835
G1 X127.634 Y126.576 E.01835
G1 X127.995 Y126.101 E.01835
G1 X128.45 Y125.715 E.01835
G1 X128.978 Y125.435 E.01835
G1 X129.553 Y125.275 E.01835
G1 X129.892 Y125.257 E.01043
G1 X129.925 Y125.255 E.001
M204 S10000
; WIPE_START
G1 F24000
G1 X130.149 Y125.243 E-.08558
G1 X130.739 Y125.339 E-.22689
G1 X131.293 Y125.56 E-.22689
G1 X131.774 Y125.886 E-.22063
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I-1.215 J.062 P1  F30000
G1 X131.987 Y130.024 Z3.8
G1 Z3.4
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X131.577 Y130.361 E.01628
G1 X131.086 Y130.623 E.0171
G1 X130.554 Y130.784 E.0171
G1 X130 Y130.839 E.0171
G1 X129.446 Y130.784 E.0171
G1 X128.914 Y130.623 E.0171
G1 X128.423 Y130.361 E.0171
G1 X127.993 Y130.007 E.0171
G1 X127.639 Y129.577 E.0171
G1 X127.377 Y129.086 E.0171
G1 X127.216 Y128.554 E.0171
G1 X127.161 Y128 E.0171
G1 X127.216 Y127.446 E.0171
G1 X127.377 Y126.914 E.0171
G1 X127.639 Y126.423 E.0171
G1 X127.993 Y125.993 E.0171
G1 X128.423 Y125.639 E.0171
G1 X128.914 Y125.377 E.0171
G1 X129.446 Y125.216 E.0171
G1 X130 Y125.161 E.0171
G1 X130.321 Y125.193 E.00991
G1 X130.554 Y125.216 E.00719
G1 X131.086 Y125.377 E.0171
G1 X131.577 Y125.639 E.0171
G1 X132.007 Y125.993 E.0171
G1 X132.361 Y126.423 E.0171
G1 X132.623 Y126.914 E.0171
G1 X132.784 Y127.446 E.0171
G1 X132.839 Y128 E.0171
G1 X132.784 Y128.554 E.0171
G1 X132.623 Y129.086 E.0171
G1 X132.361 Y129.577 E.0171
G1 X132.029 Y129.982 E.01608
M204 S10000
; WIPE_START
G1 F24000
G1 X131.577 Y130.361 E-.22387
G1 X131.086 Y130.623 E-.21148
G1 X130.554 Y130.784 E-.21149
G1 X130.257 Y130.814 E-.11316
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I-.323 J-1.173 P1  F30000
G1 X109.236 Y136.597 Z3.8
G1 Z3.4
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X109.525 Y136.581 E.0089
G1 X110.114 Y136.678 E.01835
G1 X110.669 Y136.899 E.01835
G1 X111.163 Y137.234 E.01835
G1 X111.574 Y137.667 E.01835
G1 X111.881 Y138.179 E.01835
G1 X112.072 Y138.745 E.01835
G1 X112.137 Y139.339 E.01835
G1 X112.072 Y139.932 E.01835
G1 X111.881 Y140.498 E.01835
G1 X111.574 Y141.01 E.01835
G1 X111.371 Y141.223 E.00904
G1 X111.163 Y141.443 E.0093
G1 X110.669 Y141.778 E.01835
G1 X110.114 Y141.999 E.01835
G1 X109.525 Y142.096 E.01835
G1 X108.929 Y142.063 E.01835
G1 X108.353 Y141.904 E.01835
G1 X107.826 Y141.624 E.01835
G1 X107.371 Y141.237 E.01835
G1 X107.009 Y140.762 E.01835
G1 X106.759 Y140.22 E.01835
G1 X106.63 Y139.637 E.01835
G1 X106.63 Y139.04 E.01835
G1 X106.759 Y138.457 E.01835
G1 X107.009 Y137.915 E.01835
G1 X107.371 Y137.44 E.01835
G1 X107.826 Y137.053 E.01835
G1 X108.353 Y136.773 E.01835
G1 X108.929 Y136.614 E.01835
G1 X109.176 Y136.6 E.0076
M204 S10000
; WIPE_START
G1 F24000
G1 X109.525 Y136.581 E-.13288
G1 X110.114 Y136.678 E-.22689
G1 X110.669 Y136.899 E-.22689
G1 X111.046 Y137.155 E-.17333
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I-1.213 J.096 P1  F30000
G1 X111.379 Y141.349 Z3.8
G1 Z3.4
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X110.953 Y141.699 E.01693
G1 X110.462 Y141.961 E.0171
G1 X109.929 Y142.123 E.0171
G1 X109.375 Y142.177 E.0171
G1 X108.822 Y142.123 E.0171
G1 X108.289 Y141.961 E.0171
G1 X107.798 Y141.699 E.0171
G1 X107.368 Y141.346 E.0171
G1 X107.015 Y140.916 E.0171
G1 X106.752 Y140.425 E.0171
G1 X106.591 Y139.892 E.0171
G1 X106.536 Y139.339 E.0171
G1 X106.591 Y138.785 E.0171
G1 X106.752 Y138.252 E.0171
G1 X107.015 Y137.761 E.0171
G1 X107.368 Y137.331 E.0171
G1 X107.798 Y136.978 E.0171
G1 X108.289 Y136.716 E.0171
G1 X108.822 Y136.554 E.0171
G1 X109.375 Y136.5 E.0171
G1 X109.648 Y136.526 E.00841
G1 X109.929 Y136.554 E.00869
G1 X110.462 Y136.716 E.0171
G1 X110.953 Y136.978 E.0171
G1 X111.383 Y137.331 E.0171
G1 X111.736 Y137.761 E.0171
G1 X111.998 Y138.252 E.0171
G1 X112.16 Y138.785 E.0171
G1 X112.214 Y139.339 E.0171
G1 X112.16 Y139.892 E.0171
G1 X111.998 Y140.425 E.0171
G1 X111.736 Y140.916 E.0171
G1 X111.417 Y141.304 E.01542
M204 S10000
; WIPE_START
G1 F24000
G1 X110.953 Y141.699 E-.23187
G1 X110.462 Y141.961 E-.21149
G1 X109.929 Y142.123 E-.21148
G1 X109.654 Y142.15 E-.10517
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I1.217 J-.018 P1  F30000
G1 X109.277 Y116.592 Z3.8
G1 Z3.4
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X109.566 Y116.577 E.0089
G1 X110.155 Y116.673 E.01835
G1 X110.71 Y116.894 E.01835
G1 X111.204 Y117.229 E.01835
G1 X111.615 Y117.663 E.01835
G1 X111.923 Y118.174 E.01835
G1 X112.113 Y118.74 E.01835
G1 X112.178 Y119.334 E.01835
G1 X112.113 Y119.927 E.01835
G1 X111.923 Y120.493 E.01835
G1 X111.615 Y121.005 E.01835
G1 X111.412 Y121.219 E.00904
G1 X111.204 Y121.438 E.0093
G1 X110.71 Y121.773 E.01835
G1 X110.155 Y121.994 E.01835
G1 X109.566 Y122.091 E.01835
G1 X108.97 Y122.059 E.01835
G1 X108.394 Y121.899 E.01835
G1 X107.867 Y121.619 E.01835
G1 X107.412 Y121.233 E.01835
G1 X107.051 Y120.757 E.01835
G1 X106.8 Y120.215 E.01835
G1 X106.671 Y119.632 E.01835
G1 X106.671 Y119.035 E.01835
G1 X106.8 Y118.452 E.01835
G1 X107.051 Y117.91 E.01835
G1 X107.412 Y117.435 E.01835
G1 X107.867 Y117.048 E.01835
G1 X108.394 Y116.769 E.01835
G1 X108.97 Y116.609 E.01835
G1 X109.217 Y116.596 E.0076
M204 S10000
; WIPE_START
G1 F24000
G1 X109.566 Y116.577 E-.13288
G1 X110.155 Y116.673 E-.22689
G1 X110.71 Y116.894 E-.22689
G1 X111.087 Y117.15 E-.17333
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I-1.213 J.096 P1  F30000
G1 X111.42 Y121.345 Z3.8
G1 Z3.4
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X110.994 Y121.694 E.01693
G1 X110.503 Y121.957 E.0171
G1 X109.97 Y122.118 E.0171
G1 X109.417 Y122.173 E.0171
G1 X108.863 Y122.118 E.0171
G1 X108.33 Y121.957 E.0171
G1 X107.839 Y121.694 E.0171
G1 X107.409 Y121.341 E.0171
G1 X107.056 Y120.911 E.0171
G1 X106.794 Y120.42 E.0171
G1 X106.632 Y119.888 E.0171
G1 X106.578 Y119.334 E.0171
G1 X106.632 Y118.78 E.0171
G1 X106.794 Y118.247 E.0171
G1 X107.056 Y117.757 E.0171
G1 X107.409 Y117.326 E.0171
G1 X107.839 Y116.973 E.0171
G1 X108.33 Y116.711 E.0171
G1 X108.863 Y116.549 E.0171
G1 X109.417 Y116.495 E.0171
G1 X109.689 Y116.522 E.00841
G1 X109.97 Y116.549 E.00869
G1 X110.503 Y116.711 E.0171
G1 X110.994 Y116.973 E.0171
G1 X111.424 Y117.326 E.0171
G1 X111.777 Y117.757 E.0171
G1 X112.039 Y118.247 E.0171
G1 X112.201 Y118.78 E.0171
G1 X112.256 Y119.334 E.0171
G1 X112.201 Y119.888 E.0171
G1 X112.039 Y120.42 E.0171
G1 X111.777 Y120.911 E.0171
G1 X111.459 Y121.299 E.01542
M204 S10000
; WIPE_START
G1 F24000
G1 X110.994 Y121.694 E-.23187
G1 X110.503 Y121.957 E-.21149
G1 X109.97 Y122.118 E-.21148
G1 X109.695 Y122.145 E-.10517
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I1.216 J-.034 P1  F30000
G1 X108.983 Y96.816 Z3.8
G1 Z3.4
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X109.272 Y96.8 E.0089
G1 X109.861 Y96.897 E.01835
G1 X110.416 Y97.118 E.01835
G1 X110.91 Y97.453 E.01835
G1 X111.321 Y97.886 E.01835
G1 X111.628 Y98.398 E.01835
G1 X111.819 Y98.964 E.01835
G1 X111.884 Y99.557 E.01835
G1 X111.819 Y100.151 E.01835
G1 X111.628 Y100.717 E.01835
G1 X111.321 Y101.228 E.01835
G1 X111.118 Y101.442 E.00904
G1 X110.91 Y101.662 E.0093
G1 X110.416 Y101.997 E.01835
G1 X109.861 Y102.218 E.01835
G1 X109.272 Y102.315 E.01835
G1 X108.676 Y102.282 E.01835
G1 X108.1 Y102.122 E.01835
G1 X107.573 Y101.843 E.01835
G1 X107.118 Y101.456 E.01835
G1 X106.756 Y100.981 E.01835
G1 X106.506 Y100.439 E.01835
G1 X106.377 Y99.856 E.01835
G1 X106.377 Y99.259 E.01835
G1 X106.506 Y98.676 E.01835
G1 X106.756 Y98.134 E.01835
G1 X107.118 Y97.658 E.01835
G1 X107.573 Y97.272 E.01835
G1 X108.1 Y96.992 E.01835
G1 X108.676 Y96.832 E.01835
G1 X108.923 Y96.819 E.0076
M204 S10000
; WIPE_START
G1 F24000
G1 X109.272 Y96.8 E-.13288
G1 X109.861 Y96.897 E-.22689
G1 X110.416 Y97.118 E-.22689
G1 X110.793 Y97.374 E-.17333
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I-1.213 J.096 P1  F30000
G1 X111.126 Y101.568 Z3.8
G1 Z3.4
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X110.7 Y101.918 E.01693
G1 X110.209 Y102.18 E.0171
G1 X109.676 Y102.342 E.0171
G1 X109.122 Y102.396 E.0171
G1 X108.569 Y102.342 E.0171
G1 X108.036 Y102.18 E.0171
G1 X107.545 Y101.918 E.0171
G1 X107.115 Y101.565 E.0171
G1 X106.762 Y101.135 E.0171
G1 X106.5 Y100.644 E.0171
G1 X106.338 Y100.111 E.0171
G1 X106.283 Y99.557 E.0171
G1 X106.338 Y99.003 E.0171
G1 X106.5 Y98.471 E.0171
G1 X106.762 Y97.98 E.0171
G1 X107.115 Y97.55 E.0171
G1 X107.545 Y97.197 E.0171
G1 X108.036 Y96.934 E.0171
G1 X108.569 Y96.773 E.0171
G1 X109.122 Y96.718 E.0171
G1 X109.395 Y96.745 E.00841
G1 X109.676 Y96.773 E.00869
G1 X110.209 Y96.934 E.0171
G1 X110.7 Y97.197 E.0171
G1 X111.13 Y97.55 E.0171
G1 X111.483 Y97.98 E.0171
M73 P76 R2
G1 X111.745 Y98.471 E.0171
G1 X111.907 Y99.003 E.0171
G1 X111.961 Y99.557 E.0171
G1 X111.907 Y100.111 E.0171
G1 X111.745 Y100.644 E.0171
G1 X111.483 Y101.135 E.0171
G1 X111.165 Y101.523 E.01542
M204 S10000
; WIPE_START
G1 F24000
G1 X110.7 Y101.918 E-.23187
G1 X110.209 Y102.18 E-.21149
G1 X109.676 Y102.342 E-.21148
G1 X109.401 Y102.369 E-.10517
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I1.216 J-.051 P1  F30000
G1 X108.201 Y74 Z3.8
G1 Z3.4
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X108.49 Y73.985 E.0089
G1 X109.079 Y74.081 E.01835
G1 X109.634 Y74.302 E.01835
G1 X110.128 Y74.637 E.01835
G1 X110.538 Y75.071 E.01835
G1 X110.846 Y75.582 E.01835
G1 X111.037 Y76.148 E.01835
G1 X111.102 Y76.742 E.01835
G1 X111.037 Y77.335 E.01835
G1 X110.846 Y77.901 E.01835
G1 X110.538 Y78.413 E.01835
G1 X110.336 Y78.626 E.00904
G1 X110.128 Y78.846 E.0093
G1 X109.634 Y79.181 E.01835
G1 X109.079 Y79.402 E.01835
G1 X108.49 Y79.499 E.01835
G1 X107.894 Y79.467 E.01835
G1 X107.318 Y79.307 E.01835
G1 X106.791 Y79.027 E.01835
G1 X106.336 Y78.641 E.01835
G1 X105.974 Y78.165 E.01835
G1 X105.724 Y77.623 E.01835
G1 X105.595 Y77.04 E.01835
G1 X105.595 Y76.443 E.01835
G1 X105.724 Y75.86 E.01835
G1 X105.974 Y75.318 E.01835
G1 X106.336 Y74.843 E.01835
G1 X106.791 Y74.456 E.01835
G1 X107.318 Y74.177 E.01835
G1 X107.894 Y74.017 E.01835
G1 X108.141 Y74.003 E.0076
M204 S10000
; WIPE_START
G1 F24000
G1 X108.49 Y73.985 E-.13288
G1 X109.079 Y74.081 E-.22689
G1 X109.634 Y74.302 E-.22689
G1 X110.011 Y74.558 E-.17333
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I-1.213 J.096 P1  F30000
G1 X110.344 Y78.753 Z3.8
G1 Z3.4
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X109.918 Y79.102 E.01693
G1 X109.427 Y79.365 E.0171
G1 X108.894 Y79.526 E.0171
G1 X108.34 Y79.581 E.0171
G1 X107.786 Y79.526 E.0171
G1 X107.254 Y79.365 E.0171
G1 X106.763 Y79.102 E.0171
G1 X106.333 Y78.749 E.0171
G1 X105.98 Y78.319 E.0171
G1 X105.717 Y77.828 E.0171
G1 X105.556 Y77.296 E.0171
G1 X105.501 Y76.742 E.0171
G1 X105.556 Y76.188 E.0171
G1 X105.717 Y75.655 E.0171
G1 X105.98 Y75.164 E.0171
G1 X106.333 Y74.734 E.0171
G1 X106.763 Y74.381 E.0171
G1 X107.254 Y74.119 E.0171
G1 X107.786 Y73.957 E.0171
G1 X108.34 Y73.903 E.0171
G1 X108.613 Y73.93 E.00841
G1 X108.894 Y73.957 E.00869
G1 X109.427 Y74.119 E.0171
G1 X109.918 Y74.381 E.0171
G1 X110.348 Y74.734 E.0171
G1 X110.701 Y75.164 E.0171
G1 X110.963 Y75.655 E.0171
G1 X111.125 Y76.188 E.0171
G1 X111.179 Y76.742 E.0171
G1 X111.125 Y77.296 E.0171
G1 X110.963 Y77.828 E.0171
G1 X110.701 Y78.319 E.0171
G1 X110.382 Y78.707 E.01542
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 3.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X109.918 Y79.102 E-.23187
G1 X109.427 Y79.365 E-.21149
G1 X108.894 Y79.526 E-.21148
G1 X108.619 Y79.553 E-.10517
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 18/32
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
G3 Z3.8 I-.345 J1.167 P1  F30000
G1 X129.332 Y85.668 Z3.8
G1 Z3.6
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X129.495 Y85.66 E.00502
G1 X130.084 Y85.756 E.01835
G1 X130.639 Y85.977 E.01835
G1 X131.133 Y86.312 E.01835
G1 X131.543 Y86.746 E.01835
G1 X131.851 Y87.257 E.01835
G1 X132.042 Y87.823 E.01835
G1 X132.106 Y88.417 E.01835
G1 X132.042 Y89.01 E.01835
G1 X131.851 Y89.576 E.01835
G1 X131.543 Y90.088 E.01835
G1 X131.379 Y90.261 E.00733
G1 X131.133 Y90.521 E.01101
G1 X130.639 Y90.856 E.01835
G1 X130.084 Y91.077 E.01835
G1 X129.495 Y91.174 E.01835
G1 X128.898 Y91.142 E.01835
G1 X128.323 Y90.982 E.01835
G1 X127.796 Y90.702 E.01835
G1 X127.341 Y90.316 E.01835
G1 X126.979 Y89.84 E.01835
G1 X126.728 Y89.298 E.01835
G1 X126.6 Y88.715 E.01835
G1 X126.6 Y88.118 E.01835
G1 X126.728 Y87.535 E.01835
G1 X126.979 Y86.993 E.01835
G1 X127.341 Y86.518 E.01835
G1 X127.796 Y86.131 E.01835
G1 X128.323 Y85.852 E.01835
G1 X128.898 Y85.692 E.01835
G1 X129.256 Y85.672 E.01102
G1 X129.272 Y85.672 E.00047
M204 S10000
; WIPE_START
G1 F24000
G1 X129.495 Y85.66 E-.08485
G1 X130.084 Y85.756 E-.22689
G1 X130.639 Y85.977 E-.22689
G1 X131.121 Y86.304 E-.22136
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I-1.215 J.064 P1  F30000
G1 X131.337 Y90.437 Z4
G1 Z3.6
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X130.922 Y90.777 E.01648
G1 X130.432 Y91.04 E.0171
G1 X129.899 Y91.201 E.0171
G1 X129.345 Y91.256 E.0171
G1 X128.791 Y91.201 E.0171
G1 X128.259 Y91.04 E.0171
G1 X127.768 Y90.777 E.0171
G1 X127.338 Y90.424 E.0171
G1 X126.985 Y89.994 E.0171
G1 X126.722 Y89.503 E.0171
G1 X126.561 Y88.971 E.0171
G1 X126.506 Y88.417 E.0171
G1 X126.561 Y87.863 E.0171
G1 X126.722 Y87.33 E.0171
G1 X126.985 Y86.839 E.0171
G1 X127.338 Y86.409 E.0171
G1 X127.768 Y86.056 E.0171
G1 X128.259 Y85.794 E.0171
G1 X128.791 Y85.632 E.0171
G1 X129.345 Y85.578 E.0171
G1 X129.687 Y85.611 E.01055
G1 X129.899 Y85.632 E.00655
G1 X130.432 Y85.794 E.0171
G1 X130.922 Y86.056 E.0171
G1 X131.353 Y86.409 E.0171
G1 X131.706 Y86.839 E.0171
G1 X131.968 Y87.33 E.0171
G1 X132.13 Y87.863 E.0171
G1 X132.184 Y88.417 E.0171
G1 X132.13 Y88.971 E.0171
G1 X131.968 Y89.503 E.0171
G1 X131.706 Y89.994 E.0171
G1 X131.378 Y90.393 E.01588
M204 S10000
; WIPE_START
G1 F24000
G1 X130.922 Y90.777 E-.22633
G1 X130.432 Y91.04 E-.21148
G1 X129.899 Y91.201 E-.21149
G1 X129.609 Y91.23 E-.1107
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I-1.216 J-.039 P1  F30000
G1 X129.088 Y107.648 Z4
G1 Z3.6
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X129.251 Y107.639 E.00502
G1 X129.841 Y107.736 E.01835
G1 X130.395 Y107.957 E.01835
G1 X130.889 Y108.292 E.01835
G1 X131.3 Y108.725 E.01835
G1 X131.608 Y109.237 E.01835
G1 X131.798 Y109.803 E.01835
G1 X131.863 Y110.396 E.01835
G1 X131.798 Y110.99 E.01835
G1 X131.608 Y111.556 E.01835
G1 X131.3 Y112.067 E.01835
G1 X131.136 Y112.241 E.00733
G1 X130.889 Y112.501 E.01101
G1 X130.395 Y112.836 E.01835
G1 X129.841 Y113.057 E.01835
G1 X129.251 Y113.154 E.01835
G1 X128.655 Y113.121 E.01835
G1 X128.08 Y112.961 E.01835
G1 X127.552 Y112.682 E.01835
G1 X127.097 Y112.295 E.01835
G1 X126.736 Y111.82 E.01835
G1 X126.485 Y111.278 E.01835
G1 X126.357 Y110.695 E.01835
G1 X126.357 Y110.098 E.01835
G1 X126.485 Y109.515 E.01835
G1 X126.736 Y108.973 E.01835
G1 X127.097 Y108.497 E.01835
G1 X127.552 Y108.111 E.01835
G1 X128.08 Y107.831 E.01835
G1 X128.655 Y107.672 E.01835
G1 X129.013 Y107.652 E.01102
G1 X129.028 Y107.651 E.00047
M204 S10000
; WIPE_START
G1 F24000
G1 X129.251 Y107.639 E-.08485
G1 X129.841 Y107.736 E-.22689
G1 X130.395 Y107.957 E-.22689
G1 X130.877 Y108.284 E-.22136
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I-1.215 J.064 P1  F30000
G1 X131.094 Y112.417 Z4
G1 Z3.6
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X130.679 Y112.757 E.01648
G1 X130.188 Y113.019 E.0171
G1 X129.656 Y113.181 E.0171
G1 X129.102 Y113.235 E.0171
G1 X128.548 Y113.181 E.0171
G1 X128.015 Y113.019 E.0171
G1 X127.525 Y112.757 E.0171
G1 X127.094 Y112.404 E.0171
G1 X126.741 Y111.974 E.0171
G1 X126.479 Y111.483 E.0171
G1 X126.317 Y110.95 E.0171
G1 X126.263 Y110.396 E.0171
G1 X126.317 Y109.843 E.0171
G1 X126.479 Y109.31 E.0171
G1 X126.741 Y108.819 E.0171
G1 X127.094 Y108.389 E.0171
G1 X127.525 Y108.036 E.0171
G1 X128.015 Y107.773 E.0171
G1 X128.548 Y107.612 E.0171
G1 X129.102 Y107.557 E.0171
G1 X129.443 Y107.591 E.01055
G1 X129.656 Y107.612 E.00655
G1 X130.188 Y107.773 E.0171
G1 X130.679 Y108.036 E.0171
G1 X131.109 Y108.389 E.0171
G1 X131.462 Y108.819 E.0171
G1 X131.725 Y109.31 E.0171
G1 X131.886 Y109.843 E.0171
G1 X131.941 Y110.396 E.0171
G1 X131.886 Y110.95 E.0171
G1 X131.725 Y111.483 E.0171
G1 X131.462 Y111.974 E.0171
G1 X131.135 Y112.373 E.01588
M204 S10000
; WIPE_START
G1 F24000
G1 X130.679 Y112.757 E-.22633
G1 X130.188 Y113.019 E-.21148
G1 X129.656 Y113.181 E-.21149
G1 X129.366 Y113.209 E-.1107
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I-1.215 J.063 P1  F30000
G1 X129.986 Y125.252 Z4
G1 Z3.6
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X130.149 Y125.243 E.00502
G1 X130.739 Y125.339 E.01835
G1 X131.293 Y125.56 E.01835
G1 X131.788 Y125.895 E.01835
G1 X132.198 Y126.329 E.01835
G1 X132.506 Y126.841 E.01835
G1 X132.697 Y127.406 E.01835
G1 X132.761 Y128 E.01835
G1 X132.697 Y128.594 E.01835
G1 X132.506 Y129.159 E.01835
G1 X132.198 Y129.671 E.01835
G1 X132.034 Y129.844 E.00733
G1 X131.788 Y130.105 E.01101
G1 X131.293 Y130.44 E.01835
G1 X130.739 Y130.661 E.01835
G1 X130.149 Y130.757 E.01835
G1 X129.553 Y130.725 E.01835
G1 X128.978 Y130.565 E.01835
G1 X128.45 Y130.285 E.01835
G1 X127.995 Y129.899 E.01835
G1 X127.634 Y129.424 E.01835
G1 X127.383 Y128.882 E.01835
G1 X127.255 Y128.299 E.01835
G1 X127.255 Y127.701 E.01835
G1 X127.383 Y127.118 E.01835
G1 X127.634 Y126.576 E.01835
G1 X127.995 Y126.101 E.01835
G1 X128.45 Y125.715 E.01835
G1 X128.978 Y125.435 E.01835
G1 X129.553 Y125.275 E.01835
G1 X129.911 Y125.256 E.01102
G1 X129.927 Y125.255 E.00047
M204 S10000
; WIPE_START
G1 F24000
G1 X130.149 Y125.243 E-.08485
G1 X130.739 Y125.339 E-.22689
G1 X131.293 Y125.56 E-.22689
G1 X131.776 Y125.887 E-.22136
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I-1.215 J.064 P1  F30000
G1 X131.992 Y130.02 Z4
G1 Z3.6
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X131.577 Y130.361 E.01648
G1 X131.086 Y130.623 E.0171
G1 X130.554 Y130.784 E.0171
G1 X130 Y130.839 E.0171
G1 X129.446 Y130.784 E.0171
G1 X128.914 Y130.623 E.0171
G1 X128.423 Y130.361 E.0171
G1 X127.993 Y130.007 E.0171
G1 X127.639 Y129.577 E.0171
G1 X127.377 Y129.086 E.0171
G1 X127.216 Y128.554 E.0171
G1 X127.161 Y128 E.0171
G1 X127.216 Y127.446 E.0171
G1 X127.377 Y126.914 E.0171
G1 X127.639 Y126.423 E.0171
G1 X127.993 Y125.993 E.0171
G1 X128.423 Y125.639 E.0171
G1 X128.914 Y125.377 E.0171
G1 X129.446 Y125.216 E.0171
G1 X130 Y125.161 E.0171
G1 X130.342 Y125.195 E.01055
G1 X130.554 Y125.216 E.00655
G1 X131.086 Y125.377 E.0171
G1 X131.577 Y125.639 E.0171
G1 X132.007 Y125.993 E.0171
G1 X132.361 Y126.423 E.0171
G1 X132.623 Y126.914 E.0171
G1 X132.784 Y127.446 E.0171
G1 X132.839 Y128 E.0171
G1 X132.784 Y128.554 E.0171
G1 X132.623 Y129.086 E.0171
G1 X132.361 Y129.577 E.0171
G1 X132.033 Y129.977 E.01588
M204 S10000
; WIPE_START
G1 F24000
G1 X131.577 Y130.361 E-.22633
G1 X131.086 Y130.623 E-.21148
G1 X130.554 Y130.784 E-.21149
G1 X130.264 Y130.813 E-.1107
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I-.323 J-1.173 P1  F30000
G1 X109.217 Y136.598 Z4
G1 Z3.6
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X109.525 Y136.581 E.00947
G1 X110.114 Y136.678 E.01835
G1 X110.669 Y136.899 E.01835
G1 X111.163 Y137.234 E.01835
G1 X111.574 Y137.667 E.01835
G1 X111.881 Y138.179 E.01835
G1 X112.072 Y138.745 E.01835
G1 X112.137 Y139.339 E.01835
G1 X112.072 Y139.932 E.01835
G1 X111.881 Y140.498 E.01835
G1 X111.574 Y141.01 E.01835
G1 X111.383 Y141.211 E.00852
G1 X111.163 Y141.443 E.00983
G1 X110.669 Y141.778 E.01835
G1 X110.114 Y141.999 E.01835
G1 X109.525 Y142.096 E.01835
G1 X108.929 Y142.063 E.01835
G1 X108.353 Y141.904 E.01835
G1 X107.826 Y141.624 E.01835
G1 X107.582 Y141.417 E.00983
G1 X107.371 Y141.237 E.00852
G1 X107.009 Y140.762 E.01835
G1 X106.759 Y140.22 E.01835
G1 X106.63 Y139.637 E.01835
G1 X106.63 Y139.04 E.01835
G1 X106.759 Y138.457 E.01835
G1 X107.009 Y137.915 E.01835
G1 X107.371 Y137.44 E.01835
G1 X107.826 Y137.053 E.01835
G1 X108.353 Y136.773 E.01835
G1 X108.929 Y136.614 E.01835
G1 X109.157 Y136.601 E.00704
M204 S10000
; WIPE_START
G1 F24000
G1 X109.525 Y136.581 E-.13987
G1 X110.114 Y136.678 E-.22689
G1 X110.669 Y136.899 E-.22689
G1 X111.031 Y137.145 E-.16634
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I-1.213 J.1 P1  F30000
G1 X111.379 Y141.349 Z4
G1 Z3.6
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X110.953 Y141.699 E.01696
G1 X110.462 Y141.961 E.0171
G1 X109.929 Y142.123 E.0171
G1 X109.375 Y142.177 E.0171
G1 X108.822 Y142.123 E.0171
G1 X108.289 Y141.961 E.0171
G1 X107.798 Y141.699 E.0171
G1 X107.368 Y141.346 E.0171
G1 X107.015 Y140.916 E.0171
G1 X106.752 Y140.425 E.0171
G1 X106.591 Y139.892 E.0171
G1 X106.536 Y139.339 E.0171
G1 X106.591 Y138.785 E.0171
M73 P77 R2
G1 X106.752 Y138.252 E.0171
G1 X107.015 Y137.761 E.0171
G1 X107.368 Y137.331 E.0171
G1 X107.798 Y136.978 E.0171
G1 X108.289 Y136.716 E.0171
G1 X108.822 Y136.554 E.0171
G1 X109.375 Y136.5 E.0171
G1 X109.629 Y136.525 E.00784
G1 X109.929 Y136.554 E.00926
G1 X110.462 Y136.716 E.0171
G1 X110.953 Y136.978 E.0171
G1 X111.383 Y137.331 E.0171
G1 X111.736 Y137.761 E.0171
G1 X111.998 Y138.252 E.0171
G1 X112.16 Y138.785 E.0171
G1 X112.214 Y139.339 E.0171
G1 X112.16 Y139.892 E.0171
G1 X111.998 Y140.425 E.0171
G1 X111.736 Y140.916 E.0171
G1 X111.418 Y141.303 E.0154
M204 S10000
; WIPE_START
G1 F24000
G1 X110.953 Y141.699 E-.23213
G1 X110.462 Y141.961 E-.21148
G1 X109.929 Y142.123 E-.21149
G1 X109.654 Y142.15 E-.1049
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I1.217 J-.019 P1  F30000
G1 X109.258 Y116.593 Z4
G1 Z3.6
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X109.566 Y116.577 E.00947
G1 X110.155 Y116.673 E.01835
G1 X110.71 Y116.894 E.01835
G1 X111.204 Y117.229 E.01835
G1 X111.615 Y117.663 E.01835
G1 X111.923 Y118.174 E.01835
G1 X112.113 Y118.74 E.01835
G1 X112.178 Y119.334 E.01835
G1 X112.113 Y119.927 E.01835
G1 X111.923 Y120.493 E.01835
G1 X111.615 Y121.005 E.01835
G1 X111.424 Y121.206 E.00852
G1 X111.204 Y121.438 E.00983
G1 X110.71 Y121.773 E.01835
G1 X110.155 Y121.994 E.01835
G1 X109.566 Y122.091 E.01835
G1 X108.97 Y122.059 E.01835
G1 X108.394 Y121.899 E.01835
G1 X107.867 Y121.619 E.01835
G1 X107.623 Y121.412 E.00983
G1 X107.412 Y121.233 E.00852
G1 X107.051 Y120.757 E.01835
G1 X106.8 Y120.215 E.01835
G1 X106.671 Y119.632 E.01835
G1 X106.671 Y119.035 E.01835
G1 X106.8 Y118.452 E.01835
G1 X107.051 Y117.91 E.01835
G1 X107.412 Y117.435 E.01835
G1 X107.867 Y117.048 E.01835
G1 X108.394 Y116.769 E.01835
G1 X108.97 Y116.609 E.01835
G1 X109.198 Y116.597 E.00704
M204 S10000
; WIPE_START
G1 F24000
G1 X109.566 Y116.577 E-.13987
G1 X110.155 Y116.673 E-.22689
G1 X110.71 Y116.894 E-.22689
G1 X111.072 Y117.14 E-.16634
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I-1.213 J.1 P1  F30000
G1 X111.42 Y121.344 Z4
G1 Z3.6
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X110.994 Y121.694 E.01696
G1 X110.503 Y121.957 E.0171
G1 X109.97 Y122.118 E.0171
G1 X109.417 Y122.173 E.0171
G1 X108.863 Y122.118 E.0171
G1 X108.33 Y121.957 E.0171
G1 X107.839 Y121.694 E.0171
G1 X107.409 Y121.341 E.0171
G1 X107.056 Y120.911 E.0171
G1 X106.794 Y120.42 E.0171
G1 X106.632 Y119.888 E.0171
G1 X106.578 Y119.334 E.0171
G1 X106.632 Y118.78 E.0171
G1 X106.794 Y118.247 E.0171
G1 X107.056 Y117.757 E.0171
G1 X107.409 Y117.326 E.0171
G1 X107.839 Y116.973 E.0171
G1 X108.33 Y116.711 E.0171
G1 X108.863 Y116.549 E.0171
G1 X109.417 Y116.495 E.0171
G1 X109.671 Y116.52 E.00784
G1 X109.97 Y116.549 E.00926
G1 X110.503 Y116.711 E.0171
G1 X110.994 Y116.973 E.0171
G1 X111.424 Y117.326 E.0171
G1 X111.777 Y117.757 E.0171
G1 X112.039 Y118.247 E.0171
G1 X112.201 Y118.78 E.0171
G1 X112.256 Y119.334 E.0171
G1 X112.201 Y119.888 E.0171
G1 X112.039 Y120.42 E.0171
G1 X111.777 Y120.911 E.0171
G1 X111.459 Y121.299 E.0154
M204 S10000
; WIPE_START
G1 F24000
G1 X110.994 Y121.694 E-.23213
G1 X110.503 Y121.957 E-.21148
G1 X109.97 Y122.118 E-.21149
G1 X109.696 Y122.145 E-.1049
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I1.216 J-.035 P1  F30000
G1 X108.964 Y96.817 Z4
G1 Z3.6
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X109.272 Y96.8 E.00947
G1 X109.861 Y96.897 E.01835
G1 X110.416 Y97.118 E.01835
G1 X110.91 Y97.453 E.01835
G1 X111.321 Y97.886 E.01835
G1 X111.628 Y98.398 E.01835
G1 X111.819 Y98.964 E.01835
G1 X111.884 Y99.557 E.01835
G1 X111.819 Y100.151 E.01835
G1 X111.628 Y100.717 E.01835
G1 X111.321 Y101.228 E.01835
G1 X111.13 Y101.43 E.00852
G1 X110.91 Y101.662 E.00983
G1 X110.416 Y101.997 E.01835
G1 X109.861 Y102.218 E.01835
G1 X109.272 Y102.315 E.01835
G1 X108.676 Y102.282 E.01835
G1 X108.1 Y102.122 E.01835
G1 X107.573 Y101.843 E.01835
G1 X107.329 Y101.636 E.00983
G1 X107.118 Y101.456 E.00852
G1 X106.756 Y100.981 E.01835
G1 X106.506 Y100.439 E.01835
G1 X106.377 Y99.856 E.01835
G1 X106.377 Y99.259 E.01835
G1 X106.506 Y98.676 E.01835
G1 X106.756 Y98.134 E.01835
G1 X107.118 Y97.658 E.01835
G1 X107.573 Y97.272 E.01835
G1 X108.1 Y96.992 E.01835
G1 X108.676 Y96.832 E.01835
G1 X108.904 Y96.82 E.00704
M204 S10000
; WIPE_START
G1 F24000
G1 X109.272 Y96.8 E-.13987
G1 X109.861 Y96.897 E-.22689
G1 X110.416 Y97.118 E-.22689
G1 X110.778 Y97.363 E-.16634
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I-1.213 J.1 P1  F30000
G1 X111.126 Y101.568 Z4
G1 Z3.6
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X110.7 Y101.918 E.01696
G1 X110.209 Y102.18 E.0171
G1 X109.676 Y102.342 E.0171
G1 X109.122 Y102.396 E.0171
G1 X108.569 Y102.342 E.0171
G1 X108.036 Y102.18 E.0171
G1 X107.545 Y101.918 E.0171
G1 X107.115 Y101.565 E.0171
G1 X106.762 Y101.135 E.0171
G1 X106.5 Y100.644 E.0171
G1 X106.338 Y100.111 E.0171
G1 X106.283 Y99.557 E.0171
G1 X106.338 Y99.003 E.0171
G1 X106.5 Y98.471 E.0171
G1 X106.762 Y97.98 E.0171
G1 X107.115 Y97.55 E.0171
G1 X107.545 Y97.197 E.0171
G1 X108.036 Y96.934 E.0171
G1 X108.569 Y96.773 E.0171
G1 X109.122 Y96.718 E.0171
G1 X109.376 Y96.743 E.00784
G1 X109.676 Y96.773 E.00926
G1 X110.209 Y96.934 E.0171
G1 X110.7 Y97.197 E.0171
G1 X111.13 Y97.55 E.0171
G1 X111.483 Y97.98 E.0171
G1 X111.745 Y98.471 E.0171
G1 X111.907 Y99.003 E.0171
G1 X111.961 Y99.557 E.0171
G1 X111.907 Y100.111 E.0171
G1 X111.745 Y100.644 E.0171
G1 X111.483 Y101.135 E.0171
G1 X111.165 Y101.522 E.0154
M204 S10000
; WIPE_START
G1 F24000
G1 X110.7 Y101.918 E-.23213
G1 X110.209 Y102.18 E-.21148
G1 X109.676 Y102.342 E-.21149
G1 X109.402 Y102.369 E-.1049
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I1.216 J-.052 P1  F30000
G1 X108.182 Y74.001 Z4
G1 Z3.6
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X108.49 Y73.985 E.00947
G1 X109.079 Y74.081 E.01835
G1 X109.634 Y74.302 E.01835
G1 X110.128 Y74.637 E.01835
G1 X110.538 Y75.071 E.01835
G1 X110.846 Y75.582 E.01835
G1 X111.037 Y76.148 E.01835
G1 X111.102 Y76.742 E.01835
G1 X111.037 Y77.335 E.01835
G1 X110.846 Y77.901 E.01835
G1 X110.538 Y78.413 E.01835
G1 X110.348 Y78.614 E.00852
G1 X110.128 Y78.846 E.00983
G1 X109.634 Y79.181 E.01835
G1 X109.079 Y79.402 E.01835
G1 X108.49 Y79.499 E.01835
G1 X107.894 Y79.467 E.01835
G1 X107.318 Y79.307 E.01835
G1 X106.791 Y79.027 E.01835
G1 X106.547 Y78.82 E.00983
G1 X106.336 Y78.641 E.00852
G1 X105.974 Y78.165 E.01835
G1 X105.724 Y77.623 E.01835
G1 X105.595 Y77.04 E.01835
G1 X105.595 Y76.443 E.01835
G1 X105.724 Y75.86 E.01835
G1 X105.974 Y75.318 E.01835
G1 X106.336 Y74.843 E.01835
G1 X106.791 Y74.456 E.01835
G1 X107.318 Y74.177 E.01835
G1 X107.894 Y74.017 E.01835
G1 X108.122 Y74.004 E.00704
M204 S10000
; WIPE_START
G1 F24000
G1 X108.49 Y73.985 E-.13987
G1 X109.079 Y74.081 E-.22689
G1 X109.634 Y74.302 E-.22689
G1 X109.996 Y74.548 E-.16634
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I-1.213 J.1 P1  F30000
G1 X110.344 Y78.752 Z4
G1 Z3.6
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X109.918 Y79.102 E.01696
G1 X109.427 Y79.365 E.0171
G1 X108.894 Y79.526 E.0171
G1 X108.34 Y79.581 E.0171
G1 X107.786 Y79.526 E.0171
G1 X107.254 Y79.365 E.0171
G1 X106.763 Y79.102 E.0171
G1 X106.333 Y78.749 E.0171
G1 X105.98 Y78.319 E.0171
G1 X105.717 Y77.828 E.0171
G1 X105.556 Y77.296 E.0171
G1 X105.501 Y76.742 E.0171
G1 X105.556 Y76.188 E.0171
G1 X105.717 Y75.655 E.0171
G1 X105.98 Y75.164 E.0171
G1 X106.333 Y74.734 E.0171
G1 X106.763 Y74.381 E.0171
G1 X107.254 Y74.119 E.0171
G1 X107.786 Y73.957 E.0171
G1 X108.34 Y73.903 E.0171
G1 X108.594 Y73.928 E.00784
G1 X108.894 Y73.957 E.00926
G1 X109.427 Y74.119 E.0171
G1 X109.918 Y74.381 E.0171
G1 X110.348 Y74.734 E.0171
G1 X110.701 Y75.164 E.0171
G1 X110.963 Y75.655 E.0171
G1 X111.125 Y76.188 E.0171
G1 X111.179 Y76.742 E.0171
G1 X111.125 Y77.296 E.0171
G1 X110.963 Y77.828 E.0171
G1 X110.701 Y78.319 E.0171
G1 X110.383 Y78.706 E.0154
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 3.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X109.918 Y79.102 E-.23213
G1 X109.427 Y79.365 E-.21148
G1 X108.894 Y79.526 E-.21149
G1 X108.619 Y79.553 E-.1049
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 19/32
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
G3 Z4 I-.345 J1.167 P1  F30000
G1 X129.332 Y85.668 Z4
G1 Z3.8
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X129.495 Y85.66 E.005
G1 X130.084 Y85.756 E.01835
G1 X130.639 Y85.977 E.01835
G1 X131.133 Y86.312 E.01835
G1 X131.543 Y86.746 E.01835
G1 X131.851 Y87.257 E.01835
G1 X132.042 Y87.823 E.01835
G1 X132.106 Y88.417 E.01835
G1 X132.042 Y89.01 E.01835
G1 X131.851 Y89.576 E.01835
G1 X131.543 Y90.088 E.01835
G1 X131.392 Y90.247 E.00674
G1 X131.133 Y90.521 E.0116
G1 X130.639 Y90.856 E.01835
G1 X130.084 Y91.077 E.01835
G1 X129.495 Y91.174 E.01835
G1 X128.898 Y91.142 E.01835
G1 X128.323 Y90.982 E.01835
G1 X127.796 Y90.702 E.01835
G1 X127.341 Y90.316 E.01835
G1 X126.979 Y89.84 E.01835
G1 X126.728 Y89.298 E.01835
G1 X126.6 Y88.715 E.01835
G1 X126.6 Y88.118 E.01835
G1 X126.728 Y87.535 E.01835
G1 X126.979 Y86.993 E.01835
G1 X127.341 Y86.518 E.01835
G1 X127.796 Y86.131 E.01835
G1 X128.323 Y85.852 E.01835
G1 X128.898 Y85.692 E.01835
G1 X129.272 Y85.672 E.0115
M204 S10000
; WIPE_START
G1 F24000
G1 X129.495 Y85.66 E-.08465
G1 X130.084 Y85.756 E-.22689
G1 X130.639 Y85.977 E-.22689
G1 X131.121 Y86.304 E-.22157
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I-1.215 J.065 P1  F30000
G1 X131.342 Y90.433 Z4.2
G1 Z3.8
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X130.922 Y90.777 E.01668
G1 X130.432 Y91.04 E.0171
G1 X129.899 Y91.201 E.0171
G1 X129.345 Y91.256 E.0171
G1 X128.791 Y91.201 E.0171
G1 X128.259 Y91.04 E.0171
G1 X127.768 Y90.777 E.0171
G1 X127.338 Y90.424 E.0171
G1 X126.985 Y89.994 E.0171
G1 X126.722 Y89.503 E.0171
G1 X126.561 Y88.971 E.0171
G1 X126.506 Y88.417 E.0171
G1 X126.561 Y87.863 E.0171
G1 X126.722 Y87.33 E.0171
G1 X126.985 Y86.839 E.0171
G1 X127.338 Y86.409 E.0171
G1 X127.768 Y86.056 E.0171
G1 X128.259 Y85.794 E.0171
G1 X128.791 Y85.632 E.0171
G1 X129.345 Y85.578 E.0171
G1 X129.707 Y85.613 E.01119
G1 X129.899 Y85.632 E.00591
G1 X130.432 Y85.794 E.0171
G1 X130.922 Y86.056 E.0171
G1 X131.353 Y86.409 E.0171
G1 X131.706 Y86.839 E.0171
G1 X131.968 Y87.33 E.0171
G1 X132.13 Y87.863 E.0171
G1 X132.184 Y88.417 E.0171
G1 X132.13 Y88.971 E.0171
G1 X131.968 Y89.503 E.0171
G1 X131.706 Y89.994 E.0171
G1 X131.382 Y90.388 E.01568
M204 S10000
; WIPE_START
G1 F24000
G1 X130.922 Y90.777 E-.22876
G1 X130.432 Y91.04 E-.21148
G1 X129.899 Y91.201 E-.21149
G1 X129.615 Y91.229 E-.10827
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I-1.216 J-.039 P1  F30000
G1 X129.089 Y107.648 Z4.2
G1 Z3.8
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X129.251 Y107.639 E.005
G1 X129.841 Y107.736 E.01835
G1 X130.395 Y107.957 E.01835
G1 X130.889 Y108.292 E.01835
G1 X131.3 Y108.725 E.01835
G1 X131.608 Y109.237 E.01835
G1 X131.798 Y109.803 E.01835
G1 X131.863 Y110.396 E.01835
G1 X131.798 Y110.99 E.01835
G1 X131.608 Y111.556 E.01835
G1 X131.3 Y112.067 E.01835
G1 X131.149 Y112.227 E.00674
G1 X130.889 Y112.501 E.0116
G1 X130.395 Y112.836 E.01835
G1 X129.841 Y113.057 E.01835
G1 X129.251 Y113.154 E.01835
G1 X128.655 Y113.121 E.01835
G1 X128.08 Y112.961 E.01835
G1 X127.552 Y112.682 E.01835
G1 X127.097 Y112.295 E.01835
G1 X126.736 Y111.82 E.01835
G1 X126.485 Y111.278 E.01835
G1 X126.357 Y110.695 E.01835
G1 X126.357 Y110.098 E.01835
G1 X126.485 Y109.515 E.01835
G1 X126.736 Y108.973 E.01835
G1 X127.097 Y108.497 E.01835
G1 X127.552 Y108.111 E.01835
G1 X128.08 Y107.831 E.01835
G1 X128.655 Y107.672 E.01835
G1 X129.029 Y107.651 E.0115
M204 S10000
; WIPE_START
G1 F24000
G1 X129.251 Y107.639 E-.08465
G1 X129.841 Y107.736 E-.22689
G1 X130.395 Y107.957 E-.22689
G1 X130.878 Y108.284 E-.22157
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I-1.215 J.065 P1  F30000
G1 X131.099 Y112.413 Z4.2
G1 Z3.8
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X130.679 Y112.757 E.01668
G1 X130.188 Y113.019 E.0171
G1 X129.656 Y113.181 E.0171
G1 X129.102 Y113.235 E.0171
G1 X128.548 Y113.181 E.0171
G1 X128.015 Y113.019 E.0171
M73 P78 R2
G1 X127.525 Y112.757 E.0171
G1 X127.094 Y112.404 E.0171
G1 X126.741 Y111.974 E.0171
G1 X126.479 Y111.483 E.0171
G1 X126.317 Y110.95 E.0171
G1 X126.263 Y110.396 E.0171
G1 X126.317 Y109.843 E.0171
G1 X126.479 Y109.31 E.0171
G1 X126.741 Y108.819 E.0171
G1 X127.094 Y108.389 E.0171
G1 X127.525 Y108.036 E.0171
G1 X128.015 Y107.773 E.0171
G1 X128.548 Y107.612 E.0171
G1 X129.102 Y107.557 E.0171
G1 X129.464 Y107.593 E.01119
G1 X129.656 Y107.612 E.00591
G1 X130.188 Y107.773 E.0171
G1 X130.679 Y108.036 E.0171
G1 X131.109 Y108.389 E.0171
G1 X131.462 Y108.819 E.0171
G1 X131.725 Y109.31 E.0171
G1 X131.886 Y109.843 E.0171
G1 X131.941 Y110.396 E.0171
G1 X131.886 Y110.95 E.0171
G1 X131.725 Y111.483 E.0171
G1 X131.462 Y111.974 E.0171
G1 X131.139 Y112.368 E.01568
M204 S10000
; WIPE_START
G1 F24000
G1 X130.679 Y112.757 E-.22876
G1 X130.188 Y113.019 E-.21148
G1 X129.656 Y113.181 E-.21149
G1 X129.372 Y113.209 E-.10827
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I-1.215 J.062 P1  F30000
G1 X129.987 Y125.252 Z4.2
G1 Z3.8
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X130.149 Y125.243 E.005
G1 X130.739 Y125.339 E.01835
G1 X131.293 Y125.56 E.01835
G1 X131.788 Y125.895 E.01835
G1 X132.198 Y126.329 E.01835
G1 X132.506 Y126.841 E.01835
G1 X132.697 Y127.406 E.01835
G1 X132.761 Y128 E.01835
G1 X132.697 Y128.594 E.01835
G1 X132.506 Y129.159 E.01835
G1 X132.198 Y129.671 E.01835
G1 X132.047 Y129.83 E.00674
G1 X131.788 Y130.105 E.0116
G1 X131.293 Y130.44 E.01835
G1 X130.739 Y130.661 E.01835
G1 X130.149 Y130.757 E.01835
G1 X129.553 Y130.725 E.01835
G1 X128.978 Y130.565 E.01835
G1 X128.45 Y130.285 E.01835
G1 X127.995 Y129.899 E.01835
G1 X127.634 Y129.424 E.01835
G1 X127.383 Y128.882 E.01835
G1 X127.255 Y128.299 E.01835
G1 X127.255 Y127.701 E.01835
G1 X127.383 Y127.118 E.01835
G1 X127.634 Y126.576 E.01835
G1 X127.995 Y126.101 E.01835
G1 X128.45 Y125.715 E.01835
G1 X128.978 Y125.435 E.01835
G1 X129.553 Y125.275 E.01835
G1 X129.927 Y125.255 E.0115
M204 S10000
; WIPE_START
G1 F24000
G1 X130.149 Y125.243 E-.08465
G1 X130.739 Y125.339 E-.22689
G1 X131.293 Y125.56 E-.22689
G1 X131.776 Y125.888 E-.22157
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I-1.215 J.065 P1  F30000
G1 X131.997 Y130.016 Z4.2
G1 Z3.8
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X131.577 Y130.361 E.01668
G1 X131.086 Y130.623 E.0171
G1 X130.554 Y130.784 E.0171
G1 X130 Y130.839 E.0171
G1 X129.446 Y130.784 E.0171
G1 X128.914 Y130.623 E.0171
G1 X128.423 Y130.361 E.0171
G1 X127.993 Y130.007 E.0171
G1 X127.639 Y129.577 E.0171
G1 X127.377 Y129.086 E.0171
G1 X127.216 Y128.554 E.0171
G1 X127.161 Y128 E.0171
G1 X127.216 Y127.446 E.0171
G1 X127.377 Y126.914 E.0171
G1 X127.639 Y126.423 E.0171
G1 X127.993 Y125.993 E.0171
G1 X128.423 Y125.639 E.0171
G1 X128.914 Y125.377 E.0171
G1 X129.446 Y125.216 E.0171
G1 X130 Y125.161 E.0171
G1 X130.362 Y125.197 E.01119
G1 X130.554 Y125.216 E.00591
G1 X131.086 Y125.377 E.0171
G1 X131.577 Y125.639 E.0171
G1 X132.007 Y125.993 E.0171
G1 X132.361 Y126.423 E.0171
G1 X132.623 Y126.914 E.0171
G1 X132.784 Y127.446 E.0171
G1 X132.839 Y128 E.0171
G1 X132.784 Y128.554 E.0171
G1 X132.623 Y129.086 E.0171
G1 X132.361 Y129.577 E.0171
G1 X132.037 Y129.972 E.01568
M204 S10000
; WIPE_START
G1 F24000
G1 X131.577 Y130.361 E-.22876
G1 X131.086 Y130.623 E-.21148
G1 X130.554 Y130.784 E-.21149
G1 X130.27 Y130.812 E-.10827
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I-.322 J-1.174 P1  F30000
G1 X109.199 Y136.599 Z4.2
G1 Z3.8
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X109.525 Y136.581 E.01004
G1 X110.114 Y136.678 E.01835
G1 X110.669 Y136.899 E.01835
G1 X111.163 Y137.234 E.01835
G1 X111.574 Y137.667 E.01835
G1 X111.881 Y138.179 E.01835
G1 X112.072 Y138.745 E.01835
G1 X112.137 Y139.339 E.01835
G1 X112.072 Y139.932 E.01835
G1 X111.881 Y140.498 E.01835
G1 X111.574 Y141.01 E.01835
G1 X111.395 Y141.199 E.008
G1 X111.163 Y141.443 E.01035
G1 X110.669 Y141.778 E.01835
G1 X110.114 Y141.999 E.01835
G1 X109.525 Y142.096 E.01835
G1 X108.929 Y142.063 E.01835
G1 X108.353 Y141.904 E.01835
G1 X107.826 Y141.624 E.01835
G1 X107.569 Y141.406 E.01035
G1 X107.371 Y141.237 E.008
G1 X107.009 Y140.762 E.01835
G1 X106.759 Y140.22 E.01835
G1 X106.63 Y139.637 E.01835
G1 X106.63 Y139.04 E.01835
G1 X106.759 Y138.457 E.01835
G1 X107.009 Y137.915 E.01835
G1 X107.371 Y137.44 E.01835
G1 X107.826 Y137.053 E.01835
G1 X108.353 Y136.773 E.01835
G1 X108.929 Y136.614 E.01835
G1 X109.139 Y136.602 E.00646
M204 S10000
; WIPE_START
G1 F24000
G1 X109.525 Y136.581 E-.14696
G1 X110.114 Y136.678 E-.22689
G1 X110.669 Y136.899 E-.22689
G1 X111.016 Y137.134 E-.15926
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I-1.212 J.105 P1  F30000
G1 X111.38 Y141.349 Z4.2
G1 Z3.8
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X110.953 Y141.699 E.01698
G1 X110.462 Y141.961 E.0171
G1 X109.929 Y142.123 E.0171
G1 X109.375 Y142.177 E.0171
G1 X108.822 Y142.123 E.0171
G1 X108.289 Y141.961 E.0171
G1 X107.798 Y141.699 E.0171
G1 X107.368 Y141.346 E.0171
G1 X107.015 Y140.916 E.0171
G1 X106.752 Y140.425 E.0171
G1 X106.591 Y139.892 E.0171
G1 X106.536 Y139.339 E.0171
G1 X106.591 Y138.785 E.0171
G1 X106.752 Y138.252 E.0171
G1 X107.015 Y137.761 E.0171
G1 X107.368 Y137.331 E.0171
G1 X107.798 Y136.978 E.0171
G1 X108.289 Y136.716 E.0171
G1 X108.822 Y136.554 E.0171
G1 X109.375 Y136.5 E.0171
G1 X109.611 Y136.523 E.00728
G1 X109.929 Y136.554 E.00982
G1 X110.462 Y136.716 E.0171
G1 X110.953 Y136.978 E.0171
G1 X111.383 Y137.331 E.0171
G1 X111.736 Y137.761 E.0171
G1 X111.998 Y138.252 E.0171
G1 X112.16 Y138.785 E.0171
G1 X112.214 Y139.339 E.0171
G1 X112.16 Y139.892 E.0171
G1 X111.998 Y140.425 E.0171
G1 X111.736 Y140.916 E.0171
G1 X111.418 Y141.303 E.01538
M204 S10000
; WIPE_START
G1 F24000
G1 X110.953 Y141.699 E-.23239
G1 X110.462 Y141.961 E-.21149
G1 X109.929 Y142.123 E-.21148
G1 X109.655 Y142.15 E-.10464
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I1.217 J-.02 P1  F30000
G1 X109.24 Y116.594 Z4.2
G1 Z3.8
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X109.566 Y116.577 E.01004
G1 X110.155 Y116.673 E.01835
G1 X110.71 Y116.894 E.01835
G1 X111.204 Y117.229 E.01835
G1 X111.615 Y117.663 E.01835
G1 X111.923 Y118.174 E.01835
G1 X112.113 Y118.74 E.01835
G1 X112.178 Y119.334 E.01835
G1 X112.113 Y119.927 E.01835
G1 X111.923 Y120.493 E.01835
G1 X111.615 Y121.005 E.01835
G1 X111.436 Y121.194 E.008
G1 X111.204 Y121.438 E.01035
G1 X110.71 Y121.773 E.01835
G1 X110.155 Y121.994 E.01835
G1 X109.566 Y122.091 E.01835
G1 X108.97 Y122.059 E.01835
G1 X108.394 Y121.899 E.01835
G1 X107.867 Y121.619 E.01835
G1 X107.61 Y121.401 E.01035
G1 X107.412 Y121.233 E.008
G1 X107.051 Y120.757 E.01835
G1 X106.8 Y120.215 E.01835
G1 X106.671 Y119.632 E.01835
G1 X106.671 Y119.035 E.01835
G1 X106.8 Y118.452 E.01835
G1 X107.051 Y117.91 E.01835
G1 X107.412 Y117.435 E.01835
G1 X107.867 Y117.048 E.01835
G1 X108.394 Y116.769 E.01835
G1 X108.97 Y116.609 E.01835
G1 X109.18 Y116.598 E.00646
M204 S10000
; WIPE_START
G1 F24000
G1 X109.566 Y116.577 E-.14696
G1 X110.155 Y116.673 E-.22689
G1 X110.71 Y116.894 E-.22689
G1 X111.057 Y117.129 E-.15926
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I-1.212 J.105 P1  F30000
G1 X111.421 Y121.344 Z4.2
G1 Z3.8
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X110.994 Y121.694 E.01698
G1 X110.503 Y121.957 E.0171
G1 X109.97 Y122.118 E.0171
G1 X109.417 Y122.173 E.0171
G1 X108.863 Y122.118 E.0171
G1 X108.33 Y121.957 E.0171
G1 X107.839 Y121.694 E.0171
G1 X107.409 Y121.341 E.0171
G1 X107.056 Y120.911 E.0171
G1 X106.794 Y120.42 E.0171
G1 X106.632 Y119.888 E.0171
G1 X106.578 Y119.334 E.0171
G1 X106.632 Y118.78 E.0171
G1 X106.794 Y118.247 E.0171
G1 X107.056 Y117.757 E.0171
G1 X107.409 Y117.326 E.0171
G1 X107.839 Y116.973 E.0171
G1 X108.33 Y116.711 E.0171
G1 X108.863 Y116.549 E.0171
G1 X109.417 Y116.495 E.0171
G1 X109.652 Y116.518 E.00728
G1 X109.97 Y116.549 E.00982
G1 X110.503 Y116.711 E.0171
G1 X110.994 Y116.973 E.0171
G1 X111.424 Y117.326 E.0171
G1 X111.777 Y117.757 E.0171
G1 X112.039 Y118.247 E.0171
G1 X112.201 Y118.78 E.0171
G1 X112.256 Y119.334 E.0171
G1 X112.201 Y119.888 E.0171
G1 X112.039 Y120.42 E.0171
G1 X111.777 Y120.911 E.0171
G1 X111.46 Y121.298 E.01538
M204 S10000
; WIPE_START
G1 F24000
G1 X110.994 Y121.694 E-.23239
G1 X110.503 Y121.957 E-.21149
G1 X109.97 Y122.118 E-.21148
G1 X109.696 Y122.145 E-.10464
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I1.216 J-.036 P1  F30000
G1 X108.946 Y96.818 Z4.2
G1 Z3.8
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X109.272 Y96.8 E.01004
G1 X109.861 Y96.897 E.01835
G1 X110.416 Y97.118 E.01835
G1 X110.91 Y97.453 E.01835
G1 X111.321 Y97.886 E.01835
G1 X111.628 Y98.398 E.01835
G1 X111.819 Y98.964 E.01835
G1 X111.884 Y99.557 E.01835
G1 X111.819 Y100.151 E.01835
G1 X111.628 Y100.717 E.01835
G1 X111.321 Y101.228 E.01835
G1 X111.142 Y101.417 E.008
G1 X110.91 Y101.662 E.01035
G1 X110.416 Y101.997 E.01835
G1 X109.861 Y102.218 E.01835
G1 X109.272 Y102.315 E.01835
G1 X108.676 Y102.282 E.01835
G1 X108.1 Y102.122 E.01835
G1 X107.573 Y101.843 E.01835
G1 X107.316 Y101.625 E.01035
G1 X107.118 Y101.456 E.008
G1 X106.756 Y100.981 E.01835
G1 X106.506 Y100.439 E.01835
G1 X106.377 Y99.856 E.01835
G1 X106.377 Y99.259 E.01835
G1 X106.506 Y98.676 E.01835
G1 X106.756 Y98.134 E.01835
G1 X107.118 Y97.658 E.01835
G1 X107.573 Y97.272 E.01835
G1 X108.1 Y96.992 E.01835
G1 X108.676 Y96.832 E.01835
G1 X108.886 Y96.821 E.00646
M204 S10000
; WIPE_START
G1 F24000
G1 X109.272 Y96.8 E-.14696
G1 X109.861 Y96.897 E-.22689
G1 X110.416 Y97.118 E-.22689
G1 X110.763 Y97.353 E-.15926
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I-1.212 J.105 P1  F30000
G1 X111.127 Y101.567 Z4.2
G1 Z3.8
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X110.7 Y101.918 E.01698
G1 X110.209 Y102.18 E.0171
G1 X109.676 Y102.342 E.0171
G1 X109.122 Y102.396 E.0171
G1 X108.569 Y102.342 E.0171
G1 X108.036 Y102.18 E.0171
G1 X107.545 Y101.918 E.0171
G1 X107.115 Y101.565 E.0171
G1 X106.762 Y101.135 E.0171
G1 X106.5 Y100.644 E.0171
G1 X106.338 Y100.111 E.0171
G1 X106.283 Y99.557 E.0171
G1 X106.338 Y99.003 E.0171
G1 X106.5 Y98.471 E.0171
G1 X106.762 Y97.98 E.0171
G1 X107.115 Y97.55 E.0171
G1 X107.545 Y97.197 E.0171
G1 X108.036 Y96.934 E.0171
G1 X108.569 Y96.773 E.0171
G1 X109.122 Y96.718 E.0171
G1 X109.358 Y96.742 E.00728
G1 X109.676 Y96.773 E.00982
G1 X110.209 Y96.934 E.0171
G1 X110.7 Y97.197 E.0171
G1 X111.13 Y97.55 E.0171
G1 X111.483 Y97.98 E.0171
G1 X111.745 Y98.471 E.0171
G1 X111.907 Y99.003 E.0171
G1 X111.961 Y99.557 E.0171
G1 X111.907 Y100.111 E.0171
G1 X111.745 Y100.644 E.0171
G1 X111.483 Y101.135 E.0171
G1 X111.165 Y101.522 E.01538
M204 S10000
; WIPE_START
G1 F24000
G1 X110.7 Y101.918 E-.23239
G1 X110.209 Y102.18 E-.21149
G1 X109.676 Y102.342 E-.21148
G1 X109.402 Y102.369 E-.10464
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I1.216 J-.053 P1  F30000
G1 X108.164 Y74.002 Z4.2
G1 Z3.8
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X108.49 Y73.985 E.01004
G1 X109.079 Y74.081 E.01835
G1 X109.634 Y74.302 E.01835
G1 X110.128 Y74.637 E.01835
G1 X110.538 Y75.071 E.01835
G1 X110.846 Y75.582 E.01835
G1 X111.037 Y76.148 E.01835
G1 X111.102 Y76.742 E.01835
G1 X111.037 Y77.335 E.01835
G1 X110.846 Y77.901 E.01835
G1 X110.538 Y78.413 E.01835
G1 X110.359 Y78.602 E.008
G1 X110.128 Y78.846 E.01035
G1 X109.634 Y79.181 E.01835
G1 X109.079 Y79.402 E.01835
G1 X108.49 Y79.499 E.01835
G1 X107.894 Y79.467 E.01835
G1 X107.318 Y79.307 E.01835
G1 X106.791 Y79.027 E.01835
G1 X106.534 Y78.809 E.01035
G1 X106.336 Y78.641 E.008
G1 X105.974 Y78.165 E.01835
G1 X105.724 Y77.623 E.01835
G1 X105.595 Y77.04 E.01835
G1 X105.595 Y76.443 E.01835
G1 X105.724 Y75.86 E.01835
G1 X105.974 Y75.318 E.01835
G1 X106.336 Y74.843 E.01835
G1 X106.791 Y74.456 E.01835
G1 X107.318 Y74.177 E.01835
G1 X107.894 Y74.017 E.01835
G1 X108.104 Y74.005 E.00646
M204 S10000
; WIPE_START
G1 F24000
M73 P79 R2
G1 X108.49 Y73.985 E-.14696
G1 X109.079 Y74.081 E-.22689
G1 X109.634 Y74.302 E-.22689
G1 X109.981 Y74.537 E-.15926
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I-1.212 J.105 P1  F30000
G1 X110.345 Y78.752 Z4.2
G1 Z3.8
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X109.918 Y79.102 E.01698
G1 X109.427 Y79.365 E.0171
G1 X108.894 Y79.526 E.0171
G1 X108.34 Y79.581 E.0171
G1 X107.786 Y79.526 E.0171
G1 X107.254 Y79.365 E.0171
G1 X106.763 Y79.102 E.0171
G1 X106.333 Y78.749 E.0171
G1 X105.98 Y78.319 E.0171
G1 X105.717 Y77.828 E.0171
G1 X105.556 Y77.296 E.0171
G1 X105.501 Y76.742 E.0171
G1 X105.556 Y76.188 E.0171
G1 X105.717 Y75.655 E.0171
G1 X105.98 Y75.164 E.0171
G1 X106.333 Y74.734 E.0171
G1 X106.763 Y74.381 E.0171
G1 X107.254 Y74.119 E.0171
G1 X107.786 Y73.957 E.0171
G1 X108.34 Y73.903 E.0171
G1 X108.576 Y73.926 E.00728
G1 X108.894 Y73.957 E.00982
G1 X109.427 Y74.119 E.0171
G1 X109.918 Y74.381 E.0171
G1 X110.348 Y74.734 E.0171
G1 X110.701 Y75.164 E.0171
G1 X110.963 Y75.655 E.0171
G1 X111.125 Y76.188 E.0171
G1 X111.179 Y76.742 E.0171
G1 X111.125 Y77.296 E.0171
G1 X110.963 Y77.828 E.0171
G1 X110.701 Y78.319 E.0171
G1 X110.383 Y78.706 E.01538
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X109.918 Y79.102 E-.23239
G1 X109.427 Y79.365 E-.21149
G1 X108.894 Y79.526 E-.21148
G1 X108.62 Y79.553 E-.10464
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 20/32
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
G3 Z4.2 I-.345 J1.167 P1  F30000
G1 X129.335 Y85.668 Z4.2
G1 Z4
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X129.495 Y85.66 E.0049
G1 X130.084 Y85.756 E.01835
G1 X130.639 Y85.977 E.01835
G1 X131.133 Y86.312 E.01835
G1 X131.543 Y86.746 E.01835
G1 X131.851 Y87.257 E.01835
G1 X132.042 Y87.823 E.01835
G1 X132.106 Y88.417 E.01835
G1 X132.042 Y89.01 E.01835
G1 X131.851 Y89.576 E.01835
G1 X131.543 Y90.088 E.01835
G1 X131.406 Y90.233 E.00615
G1 X131.133 Y90.521 E.01219
G1 X130.639 Y90.856 E.01835
G1 X130.084 Y91.077 E.01835
G1 X129.495 Y91.174 E.01835
G1 X128.898 Y91.142 E.01835
G1 X128.323 Y90.982 E.01835
G1 X127.796 Y90.702 E.01835
G1 X127.341 Y90.316 E.01835
G1 X126.979 Y89.84 E.01835
G1 X126.728 Y89.298 E.01835
G1 X126.6 Y88.715 E.01835
G1 X126.6 Y88.118 E.01835
G1 X126.728 Y87.535 E.01835
G1 X126.979 Y86.993 E.01835
G1 X127.341 Y86.518 E.01835
G1 X127.796 Y86.131 E.01835
G1 X128.323 Y85.852 E.01835
G1 X128.898 Y85.692 E.01835
G1 X129.275 Y85.671 E.0116
M204 S10000
; WIPE_START
G1 F24000
G1 X129.495 Y85.66 E-.08341
G1 X130.084 Y85.756 E-.22689
G1 X130.639 Y85.977 E-.22689
G1 X131.124 Y86.306 E-.2228
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I-1.215 J.066 P1  F30000
G1 X131.347 Y90.429 Z4.4
G1 Z4
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X130.922 Y90.777 E.01688
G1 X130.432 Y91.04 E.0171
G1 X129.899 Y91.201 E.0171
G1 X129.345 Y91.256 E.0171
G1 X128.791 Y91.201 E.0171
G1 X128.259 Y91.04 E.0171
G1 X127.768 Y90.777 E.0171
G1 X127.338 Y90.424 E.0171
G1 X126.985 Y89.994 E.0171
G1 X126.722 Y89.503 E.0171
G1 X126.561 Y88.971 E.0171
G1 X126.506 Y88.417 E.0171
G1 X126.561 Y87.863 E.0171
G1 X126.722 Y87.33 E.0171
G1 X126.985 Y86.839 E.0171
G1 X127.338 Y86.409 E.0171
G1 X127.768 Y86.056 E.0171
G1 X128.259 Y85.794 E.0171
G1 X128.791 Y85.632 E.0171
G1 X129.345 Y85.578 E.0171
G1 X129.728 Y85.615 E.01183
G1 X129.899 Y85.632 E.00528
G1 X130.432 Y85.794 E.0171
G1 X130.922 Y86.056 E.0171
G1 X131.353 Y86.409 E.0171
G1 X131.706 Y86.839 E.0171
G1 X131.968 Y87.33 E.0171
G1 X132.13 Y87.863 E.0171
G1 X132.184 Y88.417 E.0171
G1 X132.13 Y88.971 E.0171
G1 X131.968 Y89.503 E.0171
G1 X131.706 Y89.994 E.0171
G1 X131.386 Y90.383 E.01548
M204 S10000
; WIPE_START
G1 F24000
G1 X130.922 Y90.777 E-.23117
G1 X130.432 Y91.04 E-.21148
G1 X129.899 Y91.201 E-.21149
G1 X129.622 Y91.228 E-.10586
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I-1.216 J-.039 P1  F30000
G1 X129.092 Y107.648 Z4.4
G1 Z4
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X129.251 Y107.639 E.0049
G1 X129.841 Y107.736 E.01835
G1 X130.395 Y107.957 E.01835
G1 X130.889 Y108.292 E.01835
G1 X131.3 Y108.725 E.01835
G1 X131.608 Y109.237 E.01835
G1 X131.798 Y109.803 E.01835
G1 X131.863 Y110.396 E.01835
G1 X131.798 Y110.99 E.01835
G1 X131.608 Y111.556 E.01835
G1 X131.3 Y112.067 E.01835
G1 X131.162 Y112.213 E.00615
G1 X130.889 Y112.501 E.01219
G1 X130.395 Y112.836 E.01835
G1 X129.841 Y113.057 E.01835
G1 X129.251 Y113.154 E.01835
G1 X128.655 Y113.121 E.01835
G1 X128.08 Y112.961 E.01835
G1 X127.552 Y112.682 E.01835
G1 X127.097 Y112.295 E.01835
G1 X126.736 Y111.82 E.01835
G1 X126.485 Y111.278 E.01835
G1 X126.357 Y110.695 E.01835
G1 X126.357 Y110.098 E.01835
G1 X126.485 Y109.515 E.01835
G1 X126.736 Y108.973 E.01835
G1 X127.097 Y108.497 E.01835
G1 X127.552 Y108.111 E.01835
G1 X128.08 Y107.831 E.01835
G1 X128.655 Y107.672 E.01835
G1 X129.032 Y107.651 E.0116
M204 S10000
; WIPE_START
G1 F24000
G1 X129.251 Y107.639 E-.08341
G1 X129.841 Y107.736 E-.22689
G1 X130.395 Y107.957 E-.22689
G1 X130.88 Y108.286 E-.2228
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I-1.215 J.066 P1  F30000
G1 X131.104 Y112.408 Z4.4
G1 Z4
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X130.679 Y112.757 E.01688
G1 X130.188 Y113.019 E.0171
G1 X129.656 Y113.181 E.0171
G1 X129.102 Y113.235 E.0171
G1 X128.548 Y113.181 E.0171
G1 X128.015 Y113.019 E.0171
G1 X127.525 Y112.757 E.0171
G1 X127.094 Y112.404 E.0171
G1 X126.741 Y111.974 E.0171
G1 X126.479 Y111.483 E.0171
G1 X126.317 Y110.95 E.0171
G1 X126.263 Y110.396 E.0171
G1 X126.317 Y109.843 E.0171
G1 X126.479 Y109.31 E.0171
G1 X126.741 Y108.819 E.0171
G1 X127.094 Y108.389 E.0171
G1 X127.525 Y108.036 E.0171
G1 X128.015 Y107.773 E.0171
G1 X128.548 Y107.612 E.0171
G1 X129.102 Y107.557 E.0171
G1 X129.485 Y107.595 E.01183
G1 X129.656 Y107.612 E.00528
G1 X130.188 Y107.773 E.0171
G1 X130.679 Y108.036 E.0171
G1 X131.109 Y108.389 E.0171
G1 X131.462 Y108.819 E.0171
G1 X131.725 Y109.31 E.0171
G1 X131.886 Y109.843 E.0171
G1 X131.941 Y110.396 E.0171
G1 X131.886 Y110.95 E.0171
G1 X131.725 Y111.483 E.0171
G1 X131.462 Y111.974 E.0171
G1 X131.143 Y112.363 E.01548
M204 S10000
; WIPE_START
G1 F24000
G1 X130.679 Y112.757 E-.23117
G1 X130.188 Y113.019 E-.21148
G1 X129.656 Y113.181 E-.21149
G1 X129.378 Y113.208 E-.10586
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I-1.215 J.062 P1  F30000
G1 X129.99 Y125.251 Z4.4
G1 Z4
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X130.149 Y125.243 E.0049
G1 X130.739 Y125.339 E.01835
G1 X131.293 Y125.56 E.01835
G1 X131.788 Y125.895 E.01835
G1 X132.198 Y126.329 E.01835
G1 X132.506 Y126.841 E.01835
G1 X132.697 Y127.406 E.01835
G1 X132.761 Y128 E.01835
G1 X132.697 Y128.594 E.01835
G1 X132.506 Y129.159 E.01835
G1 X132.198 Y129.671 E.01835
G1 X132.06 Y129.816 E.00615
G1 X131.788 Y130.105 E.01219
G1 X131.293 Y130.44 E.01835
G1 X130.739 Y130.661 E.01835
G1 X130.149 Y130.757 E.01835
G1 X129.553 Y130.725 E.01835
G1 X128.978 Y130.565 E.01835
G1 X128.45 Y130.285 E.01835
G1 X127.995 Y129.899 E.01835
G1 X127.634 Y129.424 E.01835
G1 X127.383 Y128.882 E.01835
G1 X127.255 Y128.299 E.01835
G1 X127.255 Y127.701 E.01835
G1 X127.383 Y127.118 E.01835
G1 X127.634 Y126.576 E.01835
G1 X127.995 Y126.101 E.01835
G1 X128.45 Y125.715 E.01835
G1 X128.978 Y125.435 E.01835
G1 X129.553 Y125.275 E.01835
G1 X129.93 Y125.255 E.0116
M204 S10000
; WIPE_START
G1 F24000
G1 X130.149 Y125.243 E-.08341
G1 X130.739 Y125.339 E-.22689
G1 X131.293 Y125.56 E-.22689
G1 X131.779 Y125.889 E-.2228
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I-1.215 J.066 P1  F30000
G1 X132.002 Y130.012 Z4.4
G1 Z4
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X131.577 Y130.361 E.01688
G1 X131.086 Y130.623 E.0171
G1 X130.554 Y130.784 E.0171
G1 X130 Y130.839 E.0171
G1 X129.446 Y130.784 E.0171
G1 X128.914 Y130.623 E.0171
G1 X128.423 Y130.361 E.0171
G1 X127.993 Y130.007 E.0171
G1 X127.639 Y129.577 E.0171
G1 X127.377 Y129.086 E.0171
G1 X127.216 Y128.554 E.0171
G1 X127.161 Y128 E.0171
G1 X127.216 Y127.446 E.0171
G1 X127.377 Y126.914 E.0171
G1 X127.639 Y126.423 E.0171
G1 X127.993 Y125.993 E.0171
G1 X128.423 Y125.639 E.0171
G1 X128.914 Y125.377 E.0171
G1 X129.446 Y125.216 E.0171
G1 X130 Y125.161 E.0171
G1 X130.383 Y125.199 E.01183
G1 X130.554 Y125.216 E.00528
G1 X131.086 Y125.377 E.0171
G1 X131.577 Y125.639 E.0171
G1 X132.007 Y125.993 E.0171
G1 X132.361 Y126.423 E.0171
G1 X132.623 Y126.914 E.0171
G1 X132.784 Y127.446 E.0171
G1 X132.839 Y128 E.0171
G1 X132.784 Y128.554 E.0171
G1 X132.623 Y129.086 E.0171
G1 X132.361 Y129.577 E.0171
G1 X132.041 Y129.967 E.01548
M204 S10000
; WIPE_START
G1 F24000
G1 X131.577 Y130.361 E-.23117
G1 X131.086 Y130.623 E-.21148
G1 X130.554 Y130.784 E-.21149
G1 X130.277 Y130.812 E-.10586
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I-.322 J-1.174 P1  F30000
G1 X109.18 Y136.6 Z4.4
G1 Z4
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X109.525 Y136.581 E.01061
G1 X110.114 Y136.678 E.01835
G1 X110.669 Y136.899 E.01835
G1 X111.163 Y137.234 E.01835
G1 X111.574 Y137.667 E.01835
G1 X111.881 Y138.179 E.01835
G1 X112.072 Y138.745 E.01835
G1 X112.137 Y139.339 E.01835
G1 X112.072 Y139.932 E.01835
G1 X111.881 Y140.498 E.01835
G1 X111.574 Y141.01 E.01835
G1 X111.163 Y141.443 E.01835
G1 X110.669 Y141.778 E.01835
G1 X110.114 Y141.999 E.01835
G1 X109.525 Y142.096 E.01835
G1 X108.929 Y142.063 E.01835
G1 X108.353 Y141.904 E.01835
G1 X107.826 Y141.624 E.01835
G1 X107.371 Y141.237 E.01835
G1 X107.009 Y140.762 E.01835
G1 X106.759 Y140.22 E.01835
G1 X106.63 Y139.637 E.01835
G1 X106.63 Y139.04 E.01835
G1 X106.759 Y138.457 E.01835
G1 X107.009 Y137.915 E.01835
G1 X107.371 Y137.44 E.01835
G1 X107.826 Y137.053 E.01835
G1 X108.353 Y136.773 E.01835
G1 X108.929 Y136.614 E.01835
G1 X109.12 Y136.603 E.00589
M204 S10000
; WIPE_START
G1 F24000
G1 X109.525 Y136.581 E-.15399
G1 X110.114 Y136.678 E-.22689
G1 X110.669 Y136.899 E-.22689
G1 X111 Y137.124 E-.15223
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I-1.212 J.109 P1  F30000
G1 X111.38 Y141.348 Z4.4
G1 Z4
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X110.953 Y141.699 E.017
G1 X110.462 Y141.961 E.0171
G1 X109.929 Y142.123 E.0171
G1 X109.375 Y142.177 E.0171
G1 X108.822 Y142.123 E.0171
G1 X108.289 Y141.961 E.0171
G1 X107.798 Y141.699 E.0171
G1 X107.368 Y141.346 E.0171
G1 X107.015 Y140.916 E.0171
G1 X106.752 Y140.425 E.0171
G1 X106.591 Y139.892 E.0171
G1 X106.536 Y139.339 E.0171
G1 X106.591 Y138.785 E.0171
G1 X106.752 Y138.252 E.0171
G1 X107.015 Y137.761 E.0171
G1 X107.368 Y137.331 E.0171
G1 X107.798 Y136.978 E.0171
G1 X108.289 Y136.716 E.0171
G1 X108.822 Y136.554 E.0171
G1 X109.375 Y136.5 E.0171
G1 X109.593 Y136.521 E.00671
G1 X109.929 Y136.554 E.01039
G1 X110.462 Y136.716 E.0171
G1 X110.953 Y136.978 E.0171
G1 X111.383 Y137.331 E.0171
G1 X111.736 Y137.761 E.0171
G1 X111.998 Y138.252 E.0171
G1 X112.16 Y138.785 E.0171
G1 X112.214 Y139.339 E.0171
G1 X112.16 Y139.892 E.0171
G1 X111.998 Y140.425 E.0171
G1 X111.736 Y140.916 E.0171
G1 X111.419 Y141.302 E.01536
M204 S10000
; WIPE_START
G1 F24000
G1 X110.953 Y141.699 E-.23265
G1 X110.462 Y141.961 E-.21149
G1 X109.929 Y142.123 E-.21148
G1 X109.656 Y142.15 E-.10439
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I1.217 J-.021 P1  F30000
G1 X109.221 Y116.595 Z4.4
G1 Z4
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X109.566 Y116.577 E.01061
G1 X110.155 Y116.673 E.01835
G1 X110.71 Y116.894 E.01835
G1 X111.204 Y117.229 E.01835
G1 X111.615 Y117.663 E.01835
G1 X111.923 Y118.174 E.01835
G1 X112.113 Y118.74 E.01835
G1 X112.178 Y119.334 E.01835
G1 X112.113 Y119.927 E.01835
G1 X111.923 Y120.493 E.01835
G1 X111.615 Y121.005 E.01835
G1 X111.204 Y121.438 E.01835
G1 X110.71 Y121.773 E.01835
G1 X110.155 Y121.994 E.01835
G1 X109.566 Y122.091 E.01835
G1 X108.97 Y122.059 E.01835
G1 X108.394 Y121.899 E.01835
G1 X107.867 Y121.619 E.01835
G1 X107.412 Y121.233 E.01835
M73 P80 R2
G1 X107.051 Y120.757 E.01835
G1 X106.8 Y120.215 E.01835
G1 X106.671 Y119.632 E.01835
G1 X106.671 Y119.035 E.01835
G1 X106.8 Y118.452 E.01835
G1 X107.051 Y117.91 E.01835
G1 X107.412 Y117.435 E.01835
G1 X107.867 Y117.048 E.01835
G1 X108.394 Y116.769 E.01835
G1 X108.97 Y116.609 E.01835
G1 X109.161 Y116.599 E.00589
M204 S10000
; WIPE_START
G1 F24000
G1 X109.566 Y116.577 E-.15399
G1 X110.155 Y116.673 E-.22689
G1 X110.71 Y116.894 E-.22689
G1 X111.041 Y117.119 E-.15223
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I-1.212 J.109 P1  F30000
G1 X111.421 Y121.343 Z4.4
G1 Z4
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X110.994 Y121.694 E.017
G1 X110.503 Y121.957 E.0171
G1 X109.97 Y122.118 E.0171
G1 X109.417 Y122.173 E.0171
G1 X108.863 Y122.118 E.0171
G1 X108.33 Y121.957 E.0171
G1 X107.839 Y121.694 E.0171
G1 X107.409 Y121.341 E.0171
G1 X107.056 Y120.911 E.0171
G1 X106.794 Y120.42 E.0171
G1 X106.632 Y119.888 E.0171
G1 X106.578 Y119.334 E.0171
G1 X106.632 Y118.78 E.0171
G1 X106.794 Y118.247 E.0171
G1 X107.056 Y117.757 E.0171
G1 X107.409 Y117.326 E.0171
G1 X107.839 Y116.973 E.0171
G1 X108.33 Y116.711 E.0171
G1 X108.863 Y116.549 E.0171
G1 X109.417 Y116.495 E.0171
G1 X109.634 Y116.516 E.00671
G1 X109.97 Y116.549 E.01039
G1 X110.503 Y116.711 E.0171
G1 X110.994 Y116.973 E.0171
G1 X111.424 Y117.326 E.0171
G1 X111.777 Y117.757 E.0171
G1 X112.039 Y118.247 E.0171
G1 X112.201 Y118.78 E.0171
G1 X112.256 Y119.334 E.0171
G1 X112.201 Y119.888 E.0171
G1 X112.039 Y120.42 E.0171
G1 X111.777 Y120.911 E.0171
G1 X111.46 Y121.297 E.01536
M204 S10000
; WIPE_START
G1 F24000
G1 X110.994 Y121.694 E-.23265
G1 X110.503 Y121.957 E-.21149
G1 X109.97 Y122.118 E-.21148
G1 X109.697 Y122.145 E-.10439
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I1.216 J-.037 P1  F30000
G1 X108.927 Y96.819 Z4.4
G1 Z4
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X109.272 Y96.8 E.01061
G1 X109.861 Y96.897 E.01835
G1 X110.416 Y97.118 E.01835
G1 X110.91 Y97.453 E.01835
G1 X111.321 Y97.886 E.01835
G1 X111.628 Y98.398 E.01835
G1 X111.819 Y98.964 E.01835
G1 X111.884 Y99.557 E.01835
G1 X111.819 Y100.151 E.01835
G1 X111.628 Y100.717 E.01835
G1 X111.321 Y101.228 E.01835
G1 X110.91 Y101.662 E.01835
G1 X110.416 Y101.997 E.01835
G1 X109.861 Y102.218 E.01835
G1 X109.272 Y102.315 E.01835
G1 X108.676 Y102.282 E.01835
G1 X108.1 Y102.122 E.01835
G1 X107.573 Y101.843 E.01835
G1 X107.118 Y101.456 E.01835
G1 X106.756 Y100.981 E.01835
G1 X106.506 Y100.439 E.01835
G1 X106.377 Y99.856 E.01835
G1 X106.377 Y99.259 E.01835
G1 X106.506 Y98.676 E.01835
G1 X106.756 Y98.134 E.01835
G1 X107.118 Y97.658 E.01835
G1 X107.573 Y97.272 E.01835
G1 X108.1 Y96.992 E.01835
G1 X108.676 Y96.832 E.01835
G1 X108.867 Y96.822 E.00589
M204 S10000
; WIPE_START
G1 F24000
G1 X109.272 Y96.8 E-.15399
G1 X109.861 Y96.897 E-.22689
G1 X110.416 Y97.118 E-.22689
G1 X110.747 Y97.343 E-.15223
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I-1.212 J.109 P1  F30000
G1 X111.127 Y101.567 Z4.4
G1 Z4
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X110.7 Y101.918 E.017
G1 X110.209 Y102.18 E.0171
G1 X109.676 Y102.342 E.0171
G1 X109.122 Y102.396 E.0171
G1 X108.569 Y102.342 E.0171
G1 X108.036 Y102.18 E.0171
G1 X107.545 Y101.918 E.0171
G1 X107.115 Y101.565 E.0171
G1 X106.762 Y101.135 E.0171
G1 X106.5 Y100.644 E.0171
G1 X106.338 Y100.111 E.0171
G1 X106.283 Y99.557 E.0171
G1 X106.338 Y99.003 E.0171
G1 X106.5 Y98.471 E.0171
G1 X106.762 Y97.98 E.0171
G1 X107.115 Y97.55 E.0171
G1 X107.545 Y97.197 E.0171
G1 X108.036 Y96.934 E.0171
G1 X108.569 Y96.773 E.0171
G1 X109.122 Y96.718 E.0171
G1 X109.34 Y96.74 E.00671
G1 X109.676 Y96.773 E.01039
G1 X110.209 Y96.934 E.0171
G1 X110.7 Y97.197 E.0171
G1 X111.13 Y97.55 E.0171
G1 X111.483 Y97.98 E.0171
G1 X111.745 Y98.471 E.0171
G1 X111.907 Y99.003 E.0171
G1 X111.961 Y99.557 E.0171
G1 X111.907 Y100.111 E.0171
G1 X111.745 Y100.644 E.0171
G1 X111.483 Y101.135 E.0171
G1 X111.166 Y101.521 E.01536
M204 S10000
; WIPE_START
G1 F24000
G1 X110.7 Y101.918 E-.23265
G1 X110.209 Y102.18 E-.21149
G1 X109.676 Y102.342 E-.21148
G1 X109.403 Y102.369 E-.10439
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I1.216 J-.054 P1  F30000
G1 X108.145 Y74.003 Z4.4
G1 Z4
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X108.49 Y73.985 E.01061
G1 X109.079 Y74.081 E.01835
G1 X109.634 Y74.302 E.01835
G1 X110.128 Y74.637 E.01835
G1 X110.538 Y75.071 E.01835
G1 X110.846 Y75.582 E.01835
G1 X111.037 Y76.148 E.01835
G1 X111.102 Y76.742 E.01835
G1 X111.037 Y77.335 E.01835
G1 X110.846 Y77.901 E.01835
G1 X110.538 Y78.413 E.01835
G1 X110.128 Y78.846 E.01835
G1 X109.634 Y79.181 E.01835
G1 X109.079 Y79.402 E.01835
G1 X108.49 Y79.499 E.01835
G1 X107.894 Y79.467 E.01835
G1 X107.318 Y79.307 E.01835
G1 X106.791 Y79.027 E.01835
G1 X106.336 Y78.641 E.01835
G1 X105.974 Y78.165 E.01835
G1 X105.724 Y77.623 E.01835
G1 X105.595 Y77.04 E.01835
G1 X105.595 Y76.443 E.01835
G1 X105.724 Y75.86 E.01835
G1 X105.974 Y75.318 E.01835
G1 X106.336 Y74.843 E.01835
G1 X106.791 Y74.456 E.01835
G1 X107.318 Y74.177 E.01835
G1 X107.894 Y74.017 E.01835
G1 X108.085 Y74.006 E.00589
M204 S10000
; WIPE_START
G1 F24000
G1 X108.49 Y73.985 E-.15399
G1 X109.079 Y74.081 E-.22689
G1 X109.634 Y74.302 E-.22689
G1 X109.965 Y74.527 E-.15223
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I-1.212 J.109 P1  F30000
G1 X110.345 Y78.751 Z4.4
G1 Z4
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X109.918 Y79.102 E.017
G1 X109.427 Y79.365 E.0171
G1 X108.894 Y79.526 E.0171
G1 X108.34 Y79.581 E.0171
G1 X107.786 Y79.526 E.0171
G1 X107.254 Y79.365 E.0171
G1 X106.763 Y79.102 E.0171
G1 X106.333 Y78.749 E.0171
G1 X105.98 Y78.319 E.0171
G1 X105.717 Y77.828 E.0171
G1 X105.556 Y77.296 E.0171
G1 X105.501 Y76.742 E.0171
G1 X105.556 Y76.188 E.0171
G1 X105.717 Y75.655 E.0171
G1 X105.98 Y75.164 E.0171
G1 X106.333 Y74.734 E.0171
G1 X106.763 Y74.381 E.0171
G1 X107.254 Y74.119 E.0171
G1 X107.786 Y73.957 E.0171
G1 X108.34 Y73.903 E.0171
G1 X108.558 Y73.924 E.00671
G1 X108.894 Y73.957 E.01039
G1 X109.427 Y74.119 E.0171
G1 X109.918 Y74.381 E.0171
G1 X110.348 Y74.734 E.0171
G1 X110.701 Y75.164 E.0171
G1 X110.963 Y75.655 E.0171
G1 X111.125 Y76.188 E.0171
G1 X111.179 Y76.742 E.0171
G1 X111.125 Y77.296 E.0171
G1 X110.963 Y77.828 E.0171
G1 X110.701 Y78.319 E.0171
G1 X110.384 Y78.705 E.01536
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 4.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X109.918 Y79.102 E-.23265
G1 X109.427 Y79.365 E-.21149
G1 X108.894 Y79.526 E-.21148
G1 X108.621 Y79.553 E-.10439
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 21/32
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
G3 Z4.4 I-.345 J1.167 P1  F30000
G1 X129.337 Y85.668 Z4.4
G1 Z4.2
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X129.495 Y85.66 E.00484
G1 X130.084 Y85.756 E.01835
G1 X130.639 Y85.977 E.01835
G1 X131.133 Y86.312 E.01835
G1 X131.543 Y86.746 E.01835
G1 X131.851 Y87.257 E.01835
G1 X132.042 Y87.823 E.01835
G1 X132.106 Y88.417 E.01835
G1 X132.042 Y89.01 E.01835
G1 X131.851 Y89.576 E.01835
G1 X131.543 Y90.088 E.01835
G1 X131.419 Y90.219 E.00556
G1 X131.133 Y90.521 E.01278
G1 X130.639 Y90.856 E.01835
G1 X130.084 Y91.077 E.01835
G1 X129.495 Y91.174 E.01835
G1 X128.898 Y91.142 E.01835
G1 X128.323 Y90.982 E.01835
G1 X127.796 Y90.702 E.01835
G1 X127.341 Y90.316 E.01835
G1 X126.979 Y89.84 E.01835
G1 X126.728 Y89.298 E.01835
G1 X126.6 Y88.715 E.01835
G1 X126.6 Y88.118 E.01835
G1 X126.728 Y87.535 E.01835
G1 X126.979 Y86.993 E.01835
G1 X127.341 Y86.518 E.01835
G1 X127.796 Y86.131 E.01835
G1 X128.323 Y85.852 E.01835
G1 X128.898 Y85.692 E.01835
G1 X129.277 Y85.671 E.01166
M204 S10000
; WIPE_START
G1 F24000
G1 X129.495 Y85.66 E-.0827
G1 X130.084 Y85.756 E-.22689
G1 X130.639 Y85.977 E-.22689
G1 X131.125 Y86.307 E-.22352
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I-1.215 J.067 P1  F30000
G1 X131.352 Y90.425 Z4.6
G1 Z4.2
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X130.922 Y90.777 E.01707
G1 X130.432 Y91.04 E.0171
G1 X129.899 Y91.201 E.0171
G1 X129.345 Y91.256 E.0171
G1 X128.791 Y91.201 E.0171
G1 X128.259 Y91.04 E.0171
G1 X127.768 Y90.777 E.0171
G1 X127.338 Y90.424 E.0171
G1 X126.985 Y89.994 E.0171
G1 X126.722 Y89.503 E.0171
G1 X126.561 Y88.971 E.0171
G1 X126.506 Y88.417 E.0171
G1 X126.561 Y87.863 E.0171
G1 X126.722 Y87.33 E.0171
G1 X126.985 Y86.839 E.0171
G1 X127.338 Y86.409 E.0171
G1 X127.768 Y86.056 E.0171
G1 X128.259 Y85.794 E.0171
G1 X128.791 Y85.632 E.0171
G1 X129.345 Y85.578 E.0171
G1 X129.749 Y85.617 E.01246
G1 X129.899 Y85.632 E.00464
G1 X130.432 Y85.794 E.0171
G1 X130.922 Y86.056 E.0171
G1 X131.353 Y86.409 E.0171
G1 X131.706 Y86.839 E.0171
G1 X131.968 Y87.33 E.0171
G1 X132.13 Y87.863 E.0171
G1 X132.184 Y88.417 E.0171
G1 X132.13 Y88.971 E.0171
G1 X131.968 Y89.503 E.0171
G1 X131.706 Y89.994 E.0171
G1 X131.39 Y90.379 E.01529
M204 S10000
; WIPE_START
G1 F24000
G1 X130.922 Y90.777 E-.23353
G1 X130.432 Y91.04 E-.21148
G1 X129.899 Y91.201 E-.21149
G1 X129.628 Y91.228 E-.1035
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I-1.216 J-.04 P1  F30000
G1 X129.094 Y107.648 Z4.6
G1 Z4.2
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X129.251 Y107.639 E.00484
G1 X129.841 Y107.736 E.01835
G1 X130.395 Y107.957 E.01835
G1 X130.889 Y108.292 E.01835
G1 X131.3 Y108.725 E.01835
G1 X131.608 Y109.237 E.01835
G1 X131.798 Y109.803 E.01835
G1 X131.863 Y110.396 E.01835
G1 X131.798 Y110.99 E.01835
G1 X131.608 Y111.556 E.01835
G1 X131.3 Y112.067 E.01835
G1 X131.175 Y112.199 E.00556
G1 X130.889 Y112.501 E.01278
G1 X130.395 Y112.836 E.01835
G1 X129.841 Y113.057 E.01835
G1 X129.251 Y113.154 E.01835
G1 X128.655 Y113.121 E.01835
G1 X128.08 Y112.961 E.01835
G1 X127.552 Y112.682 E.01835
G1 X127.097 Y112.295 E.01835
G1 X126.736 Y111.82 E.01835
G1 X126.485 Y111.278 E.01835
G1 X126.357 Y110.695 E.01835
G1 X126.357 Y110.098 E.01835
G1 X126.485 Y109.515 E.01835
G1 X126.736 Y108.973 E.01835
G1 X127.097 Y108.497 E.01835
G1 X127.552 Y108.111 E.01835
G1 X128.08 Y107.831 E.01835
G1 X128.655 Y107.672 E.01835
G1 X129.034 Y107.651 E.01166
M204 S10000
; WIPE_START
G1 F24000
G1 X129.251 Y107.639 E-.0827
G1 X129.841 Y107.736 E-.22689
G1 X130.395 Y107.957 E-.22689
G1 X130.882 Y108.287 E-.22352
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I-1.215 J.067 P1  F30000
G1 X131.109 Y112.404 Z4.6
G1 Z4.2
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X130.679 Y112.757 E.01707
G1 X130.188 Y113.019 E.0171
G1 X129.656 Y113.181 E.0171
G1 X129.102 Y113.235 E.0171
G1 X128.548 Y113.181 E.0171
G1 X128.015 Y113.019 E.0171
G1 X127.525 Y112.757 E.0171
G1 X127.094 Y112.404 E.0171
G1 X126.741 Y111.974 E.0171
G1 X126.479 Y111.483 E.0171
G1 X126.317 Y110.95 E.0171
G1 X126.263 Y110.396 E.0171
G1 X126.317 Y109.843 E.0171
G1 X126.479 Y109.31 E.0171
G1 X126.741 Y108.819 E.0171
G1 X127.094 Y108.389 E.0171
G1 X127.525 Y108.036 E.0171
G1 X128.015 Y107.773 E.0171
G1 X128.548 Y107.612 E.0171
G1 X129.102 Y107.557 E.0171
G1 X129.506 Y107.597 E.01246
G1 X129.656 Y107.612 E.00464
G1 X130.188 Y107.773 E.0171
G1 X130.679 Y108.036 E.0171
G1 X131.109 Y108.389 E.0171
G1 X131.462 Y108.819 E.0171
G1 X131.725 Y109.31 E.0171
G1 X131.886 Y109.843 E.0171
G1 X131.941 Y110.396 E.0171
G1 X131.886 Y110.95 E.0171
G1 X131.725 Y111.483 E.0171
G1 X131.462 Y111.974 E.0171
G1 X131.147 Y112.358 E.01529
M204 S10000
; WIPE_START
G1 F24000
G1 X130.679 Y112.757 E-.23353
G1 X130.188 Y113.019 E-.21148
G1 X129.656 Y113.181 E-.21149
G1 X129.385 Y113.208 E-.1035
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I-1.215 J.061 P1  F30000
G1 X129.992 Y125.251 Z4.6
G1 Z4.2
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X130.149 Y125.243 E.00484
G1 X130.739 Y125.339 E.01835
G1 X131.293 Y125.56 E.01835
G1 X131.788 Y125.895 E.01835
G1 X132.198 Y126.329 E.01835
M73 P81 R2
G1 X132.506 Y126.841 E.01835
G1 X132.697 Y127.406 E.01835
G1 X132.761 Y128 E.01835
G1 X132.697 Y128.594 E.01835
G1 X132.506 Y129.159 E.01835
G1 X132.198 Y129.671 E.01835
G1 X132.074 Y129.802 E.00556
G1 X131.788 Y130.105 E.01278
G1 X131.293 Y130.44 E.01835
G1 X130.739 Y130.661 E.01835
G1 X130.149 Y130.757 E.01835
G1 X129.553 Y130.725 E.01835
G1 X128.978 Y130.565 E.01835
G1 X128.45 Y130.285 E.01835
G1 X127.995 Y129.899 E.01835
G1 X127.634 Y129.424 E.01835
G1 X127.383 Y128.882 E.01835
G1 X127.255 Y128.299 E.01835
G1 X127.255 Y127.701 E.01835
G1 X127.383 Y127.118 E.01835
G1 X127.634 Y126.576 E.01835
G1 X127.995 Y126.101 E.01835
G1 X128.45 Y125.715 E.01835
G1 X128.978 Y125.435 E.01835
G1 X129.553 Y125.275 E.01835
G1 X129.932 Y125.255 E.01166
M204 S10000
; WIPE_START
G1 F24000
G1 X130.149 Y125.243 E-.0827
G1 X130.739 Y125.339 E-.22689
G1 X131.293 Y125.56 E-.22689
G1 X131.78 Y125.891 E-.22352
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I-1.215 J.067 P1  F30000
G1 X132.007 Y130.008 Z4.6
G1 Z4.2
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X131.577 Y130.361 E.01707
G1 X131.086 Y130.623 E.0171
G1 X130.554 Y130.784 E.0171
G1 X130 Y130.839 E.0171
G1 X129.446 Y130.784 E.0171
G1 X128.914 Y130.623 E.0171
G1 X128.423 Y130.361 E.0171
G1 X127.993 Y130.007 E.0171
G1 X127.639 Y129.577 E.0171
G1 X127.377 Y129.086 E.0171
G1 X127.216 Y128.554 E.0171
G1 X127.161 Y128 E.0171
G1 X127.216 Y127.446 E.0171
G1 X127.377 Y126.914 E.0171
G1 X127.639 Y126.423 E.0171
G1 X127.993 Y125.993 E.0171
G1 X128.423 Y125.639 E.0171
G1 X128.914 Y125.377 E.0171
G1 X129.446 Y125.216 E.0171
G1 X130 Y125.161 E.0171
G1 X130.404 Y125.201 E.01246
G1 X130.554 Y125.216 E.00464
G1 X131.086 Y125.377 E.0171
G1 X131.577 Y125.639 E.0171
G1 X132.007 Y125.993 E.0171
G1 X132.361 Y126.423 E.0171
G1 X132.623 Y126.914 E.0171
G1 X132.784 Y127.446 E.0171
G1 X132.839 Y128 E.0171
G1 X132.784 Y128.554 E.0171
G1 X132.623 Y129.086 E.0171
G1 X132.361 Y129.577 E.0171
G1 X132.045 Y129.962 E.01529
M204 S10000
; WIPE_START
G1 F24000
G1 X131.577 Y130.361 E-.23353
G1 X131.086 Y130.623 E-.21148
G1 X130.554 Y130.784 E-.21149
G1 X130.283 Y130.811 E-.1035
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I-.322 J-1.174 P1  F30000
G1 X109.162 Y136.601 Z4.6
G1 Z4.2
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X109.525 Y136.581 E.01118
G1 X110.114 Y136.678 E.01835
G1 X110.669 Y136.899 E.01835
G1 X111.163 Y137.234 E.01835
G1 X111.574 Y137.667 E.01835
G1 X111.881 Y138.179 E.01835
G1 X112.072 Y138.745 E.01835
G1 X112.137 Y139.339 E.01835
G1 X112.072 Y139.932 E.01835
G1 X111.881 Y140.498 E.01835
G1 X111.574 Y141.01 E.01835
G1 X111.418 Y141.174 E.00696
G1 X111.163 Y141.443 E.01139
G1 X110.669 Y141.778 E.01835
G1 X110.114 Y141.999 E.01835
G1 X109.525 Y142.096 E.01835
G1 X108.929 Y142.063 E.01835
G1 X108.353 Y141.904 E.01835
G1 X107.826 Y141.624 E.01835
G1 X107.371 Y141.237 E.01835
G1 X107.009 Y140.762 E.01835
G1 X106.759 Y140.22 E.01835
G1 X106.63 Y139.637 E.01835
G1 X106.63 Y139.04 E.01835
G1 X106.759 Y138.457 E.01835
G1 X107.009 Y137.915 E.01835
G1 X107.371 Y137.44 E.01835
G1 X107.826 Y137.053 E.01835
G1 X108.353 Y136.773 E.01835
G1 X108.929 Y136.614 E.01835
G1 X109.102 Y136.604 E.00533
M204 S10000
; WIPE_START
G1 F24000
G1 X109.525 Y136.581 E-.16102
G1 X110.114 Y136.678 E-.22689
G1 X110.669 Y136.899 E-.22689
G1 X110.985 Y137.113 E-.1452
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I-1.212 J.113 P1  F30000
G1 X111.381 Y141.348 Z4.6
G1 Z4.2
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X110.953 Y141.699 E.01702
G1 X110.462 Y141.961 E.0171
G1 X109.929 Y142.123 E.0171
G1 X109.375 Y142.177 E.0171
G1 X108.822 Y142.123 E.0171
G1 X108.289 Y141.961 E.0171
G1 X107.798 Y141.699 E.0171
G1 X107.368 Y141.346 E.0171
G1 X107.015 Y140.916 E.0171
G1 X106.752 Y140.425 E.0171
G1 X106.591 Y139.892 E.0171
G1 X106.536 Y139.339 E.0171
G1 X106.591 Y138.785 E.0171
G1 X106.752 Y138.252 E.0171
G1 X107.015 Y137.761 E.0171
G1 X107.368 Y137.331 E.0171
G1 X107.798 Y136.978 E.0171
G1 X108.289 Y136.716 E.0171
G1 X108.822 Y136.554 E.0171
G1 X109.375 Y136.5 E.0171
G1 X109.574 Y136.519 E.00615
G1 X109.929 Y136.554 E.01095
G1 X110.462 Y136.716 E.0171
G1 X110.953 Y136.978 E.0171
G1 X111.383 Y137.331 E.0171
G1 X111.736 Y137.761 E.0171
G1 X111.998 Y138.252 E.0171
G1 X112.16 Y138.785 E.0171
G1 X112.214 Y139.339 E.0171
G1 X112.16 Y139.892 E.0171
G1 X111.998 Y140.425 E.0171
G1 X111.736 Y140.916 E.0171
G1 X111.419 Y141.302 E.01534
M204 S10000
; WIPE_START
G1 F24000
G1 X110.953 Y141.699 E-.2329
G1 X110.462 Y141.961 E-.21148
G1 X109.929 Y142.123 E-.21149
G1 X109.657 Y142.15 E-.10413
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I1.217 J-.022 P1  F30000
G1 X109.203 Y116.596 Z4.6
G1 Z4.2
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X109.566 Y116.577 E.01118
G1 X110.155 Y116.673 E.01835
G1 X110.71 Y116.894 E.01835
G1 X111.204 Y117.229 E.01835
G1 X111.615 Y117.663 E.01835
G1 X111.923 Y118.174 E.01835
G1 X112.113 Y118.74 E.01835
G1 X112.178 Y119.334 E.01835
G1 X112.113 Y119.927 E.01835
G1 X111.923 Y120.493 E.01835
G1 X111.615 Y121.005 E.01835
G1 X111.459 Y121.169 E.00696
G1 X111.204 Y121.438 E.01139
G1 X110.71 Y121.773 E.01835
G1 X110.155 Y121.994 E.01835
G1 X109.566 Y122.091 E.01835
G1 X108.97 Y122.059 E.01835
G1 X108.394 Y121.899 E.01835
G1 X107.867 Y121.619 E.01835
G1 X107.412 Y121.233 E.01835
G1 X107.051 Y120.757 E.01835
G1 X106.8 Y120.215 E.01835
G1 X106.671 Y119.632 E.01835
G1 X106.671 Y119.035 E.01835
G1 X106.8 Y118.452 E.01835
G1 X107.051 Y117.91 E.01835
G1 X107.412 Y117.435 E.01835
G1 X107.867 Y117.048 E.01835
G1 X108.394 Y116.769 E.01835
G1 X108.97 Y116.609 E.01835
G1 X109.143 Y116.6 E.00533
M204 S10000
; WIPE_START
G1 F24000
G1 X109.566 Y116.577 E-.16102
G1 X110.155 Y116.673 E-.22689
G1 X110.71 Y116.894 E-.22689
G1 X111.026 Y117.109 E-.1452
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I-1.212 J.113 P1  F30000
G1 X111.422 Y121.343 Z4.6
G1 Z4.2
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X110.994 Y121.694 E.01702
G1 X110.503 Y121.957 E.0171
G1 X109.97 Y122.118 E.0171
G1 X109.417 Y122.173 E.0171
G1 X108.863 Y122.118 E.0171
G1 X108.33 Y121.957 E.0171
G1 X107.839 Y121.694 E.0171
G1 X107.409 Y121.341 E.0171
G1 X107.056 Y120.911 E.0171
G1 X106.794 Y120.42 E.0171
G1 X106.632 Y119.888 E.0171
G1 X106.578 Y119.334 E.0171
G1 X106.632 Y118.78 E.0171
G1 X106.794 Y118.247 E.0171
G1 X107.056 Y117.757 E.0171
G1 X107.409 Y117.326 E.0171
G1 X107.839 Y116.973 E.0171
G1 X108.33 Y116.711 E.0171
G1 X108.863 Y116.549 E.0171
G1 X109.417 Y116.495 E.0171
G1 X109.616 Y116.514 E.00615
G1 X109.97 Y116.549 E.01095
G1 X110.503 Y116.711 E.0171
G1 X110.994 Y116.973 E.0171
G1 X111.424 Y117.326 E.0171
G1 X111.777 Y117.757 E.0171
G1 X112.039 Y118.247 E.0171
G1 X112.201 Y118.78 E.0171
G1 X112.256 Y119.334 E.0171
G1 X112.201 Y119.888 E.0171
G1 X112.039 Y120.42 E.0171
G1 X111.777 Y120.911 E.0171
G1 X111.46 Y121.297 E.01534
M204 S10000
; WIPE_START
G1 F24000
G1 X110.994 Y121.694 E-.2329
G1 X110.503 Y121.957 E-.21148
G1 X109.97 Y122.118 E-.21149
G1 X109.698 Y122.145 E-.10413
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I1.216 J-.038 P1  F30000
G1 X108.909 Y96.82 Z4.6
G1 Z4.2
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X109.272 Y96.8 E.01118
G1 X109.861 Y96.897 E.01835
G1 X110.416 Y97.118 E.01835
G1 X110.91 Y97.453 E.01835
G1 X111.321 Y97.886 E.01835
G1 X111.628 Y98.398 E.01835
G1 X111.819 Y98.964 E.01835
G1 X111.884 Y99.557 E.01835
G1 X111.819 Y100.151 E.01835
G1 X111.628 Y100.717 E.01835
G1 X111.321 Y101.228 E.01835
G1 X111.165 Y101.393 E.00696
G1 X110.91 Y101.662 E.01139
G1 X110.416 Y101.997 E.01835
G1 X109.861 Y102.218 E.01835
G1 X109.272 Y102.315 E.01835
G1 X108.676 Y102.282 E.01835
G1 X108.1 Y102.122 E.01835
G1 X107.573 Y101.843 E.01835
G1 X107.118 Y101.456 E.01835
G1 X106.756 Y100.981 E.01835
G1 X106.506 Y100.439 E.01835
G1 X106.377 Y99.856 E.01835
G1 X106.377 Y99.259 E.01835
G1 X106.506 Y98.676 E.01835
G1 X106.756 Y98.134 E.01835
G1 X107.118 Y97.658 E.01835
G1 X107.573 Y97.272 E.01835
G1 X108.1 Y96.992 E.01835
G1 X108.676 Y96.832 E.01835
G1 X108.849 Y96.823 E.00533
M204 S10000
; WIPE_START
G1 F24000
G1 X109.272 Y96.8 E-.16102
G1 X109.861 Y96.897 E-.22689
G1 X110.416 Y97.118 E-.22689
G1 X110.732 Y97.332 E-.1452
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I-1.212 J.113 P1  F30000
G1 X111.128 Y101.566 Z4.6
G1 Z4.2
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X110.7 Y101.918 E.01702
G1 X110.209 Y102.18 E.0171
G1 X109.676 Y102.342 E.0171
G1 X109.122 Y102.396 E.0171
G1 X108.569 Y102.342 E.0171
G1 X108.036 Y102.18 E.0171
G1 X107.545 Y101.918 E.0171
G1 X107.115 Y101.565 E.0171
G1 X106.762 Y101.135 E.0171
G1 X106.5 Y100.644 E.0171
G1 X106.338 Y100.111 E.0171
G1 X106.283 Y99.557 E.0171
G1 X106.338 Y99.003 E.0171
G1 X106.5 Y98.471 E.0171
G1 X106.762 Y97.98 E.0171
G1 X107.115 Y97.55 E.0171
G1 X107.545 Y97.197 E.0171
G1 X108.036 Y96.934 E.0171
G1 X108.569 Y96.773 E.0171
G1 X109.122 Y96.718 E.0171
G1 X109.322 Y96.738 E.00615
G1 X109.676 Y96.773 E.01095
G1 X110.209 Y96.934 E.0171
G1 X110.7 Y97.197 E.0171
G1 X111.13 Y97.55 E.0171
G1 X111.483 Y97.98 E.0171
G1 X111.745 Y98.471 E.0171
G1 X111.907 Y99.003 E.0171
G1 X111.961 Y99.557 E.0171
G1 X111.907 Y100.111 E.0171
G1 X111.745 Y100.644 E.0171
G1 X111.483 Y101.135 E.0171
G1 X111.166 Y101.52 E.01534
M204 S10000
; WIPE_START
G1 F24000
G1 X110.7 Y101.918 E-.2329
G1 X110.209 Y102.18 E-.21148
G1 X109.676 Y102.342 E-.21149
G1 X109.404 Y102.369 E-.10413
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I1.216 J-.055 P1  F30000
G1 X108.127 Y74.004 Z4.6
G1 Z4.2
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X108.49 Y73.985 E.01118
G1 X109.079 Y74.081 E.01835
G1 X109.634 Y74.302 E.01835
G1 X110.128 Y74.637 E.01835
G1 X110.538 Y75.071 E.01835
G1 X110.846 Y75.582 E.01835
G1 X111.037 Y76.148 E.01835
G1 X111.102 Y76.742 E.01835
G1 X111.037 Y77.335 E.01835
G1 X110.846 Y77.901 E.01835
G1 X110.538 Y78.413 E.01835
G1 X110.383 Y78.577 E.00696
G1 X110.128 Y78.846 E.01139
G1 X109.634 Y79.181 E.01835
G1 X109.079 Y79.402 E.01835
G1 X108.49 Y79.499 E.01835
G1 X107.894 Y79.467 E.01835
G1 X107.318 Y79.307 E.01835
G1 X106.791 Y79.027 E.01835
G1 X106.336 Y78.641 E.01835
G1 X105.974 Y78.165 E.01835
G1 X105.724 Y77.623 E.01835
G1 X105.595 Y77.04 E.01835
G1 X105.595 Y76.443 E.01835
G1 X105.724 Y75.86 E.01835
G1 X105.974 Y75.318 E.01835
G1 X106.336 Y74.843 E.01835
G1 X106.791 Y74.456 E.01835
G1 X107.318 Y74.177 E.01835
G1 X107.894 Y74.017 E.01835
G1 X108.067 Y74.007 E.00533
M204 S10000
; WIPE_START
G1 F24000
G1 X108.49 Y73.985 E-.16102
G1 X109.079 Y74.081 E-.22689
G1 X109.634 Y74.302 E-.22689
G1 X109.95 Y74.517 E-.1452
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I-1.212 J.113 P1  F30000
G1 X110.346 Y78.751 Z4.6
G1 Z4.2
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X109.918 Y79.102 E.01702
G1 X109.427 Y79.365 E.0171
G1 X108.894 Y79.526 E.0171
G1 X108.34 Y79.581 E.0171
G1 X107.786 Y79.526 E.0171
G1 X107.254 Y79.365 E.0171
G1 X106.763 Y79.102 E.0171
G1 X106.333 Y78.749 E.0171
G1 X105.98 Y78.319 E.0171
G1 X105.717 Y77.828 E.0171
G1 X105.556 Y77.296 E.0171
G1 X105.501 Y76.742 E.0171
G1 X105.556 Y76.188 E.0171
G1 X105.717 Y75.655 E.0171
G1 X105.98 Y75.164 E.0171
G1 X106.333 Y74.734 E.0171
G1 X106.763 Y74.381 E.0171
G1 X107.254 Y74.119 E.0171
G1 X107.786 Y73.957 E.0171
G1 X108.34 Y73.903 E.0171
G1 X108.539 Y73.922 E.00615
G1 X108.894 Y73.957 E.01095
G1 X109.427 Y74.119 E.0171
G1 X109.918 Y74.381 E.0171
G1 X110.348 Y74.734 E.0171
G1 X110.701 Y75.164 E.0171
G1 X110.963 Y75.655 E.0171
G1 X111.125 Y76.188 E.0171
G1 X111.179 Y76.742 E.0171
G1 X111.125 Y77.296 E.0171
G1 X110.963 Y77.828 E.0171
G1 X110.701 Y78.319 E.0171
G1 X110.384 Y78.705 E.01534
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 4.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X109.918 Y79.102 E-.2329
G1 X109.427 Y79.365 E-.21148
M73 P82 R2
G1 X108.894 Y79.526 E-.21149
G1 X108.621 Y79.553 E-.10413
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 22/32
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
G3 Z4.6 I-.345 J1.167 P1  F30000
G1 X129.339 Y85.668 Z4.6
G1 Z4.4
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X129.495 Y85.66 E.00479
G1 X130.084 Y85.756 E.01835
G1 X130.639 Y85.977 E.01835
G1 X131.133 Y86.312 E.01835
G1 X131.543 Y86.746 E.01835
G1 X131.851 Y87.257 E.01835
G1 X132.042 Y87.823 E.01835
G1 X132.106 Y88.417 E.01835
G1 X132.042 Y89.01 E.01835
G1 X131.851 Y89.576 E.01835
G1 X131.543 Y90.088 E.01835
G1 X131.432 Y90.205 E.00497
G1 X131.133 Y90.521 E.01337
G1 X130.639 Y90.856 E.01835
G1 X130.084 Y91.077 E.01835
G1 X129.495 Y91.174 E.01835
G1 X128.898 Y91.142 E.01835
G1 X128.323 Y90.982 E.01835
G1 X127.796 Y90.702 E.01835
G1 X127.464 Y90.42 E.01337
G1 X127.341 Y90.316 E.00497
G1 X126.979 Y89.84 E.01835
G1 X126.728 Y89.298 E.01835
G1 X126.6 Y88.715 E.01835
G1 X126.6 Y88.118 E.01835
G1 X126.728 Y87.535 E.01835
G1 X126.979 Y86.993 E.01835
G1 X127.341 Y86.518 E.01835
G1 X127.796 Y86.131 E.01835
G1 X128.323 Y85.852 E.01835
G1 X128.898 Y85.692 E.01835
G1 X129.279 Y85.671 E.01172
M204 S10000
; WIPE_START
G1 F24000
G1 X129.495 Y85.66 E-.082
G1 X130.084 Y85.756 E-.22689
G1 X130.639 Y85.977 E-.22689
G1 X131.127 Y86.308 E-.22422
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I-1.215 J.068 P1  F30000
G1 X131.356 Y90.42 Z4.8
G1 Z4.4
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X131.353 Y90.424 E.00018
G1 X130.922 Y90.777 E.0171
G1 X130.432 Y91.04 E.0171
G1 X129.899 Y91.201 E.0171
G1 X129.345 Y91.256 E.0171
G1 X128.791 Y91.201 E.0171
G1 X128.259 Y91.04 E.0171
G1 X127.768 Y90.777 E.0171
G1 X127.338 Y90.424 E.0171
G1 X126.985 Y89.994 E.0171
G1 X126.722 Y89.503 E.0171
G1 X126.561 Y88.971 E.0171
G1 X126.506 Y88.417 E.0171
G1 X126.561 Y87.863 E.0171
G1 X126.722 Y87.33 E.0171
G1 X126.985 Y86.839 E.0171
G1 X127.338 Y86.409 E.0171
G1 X127.768 Y86.056 E.0171
G1 X128.259 Y85.794 E.0171
G1 X128.791 Y85.632 E.0171
G1 X129.345 Y85.578 E.0171
G1 X129.77 Y85.62 E.0131
G1 X129.899 Y85.632 E.004
G1 X130.432 Y85.794 E.0171
G1 X130.922 Y86.056 E.0171
G1 X131.353 Y86.409 E.0171
G1 X131.706 Y86.839 E.0171
G1 X131.968 Y87.33 E.0171
G1 X132.13 Y87.863 E.0171
G1 X132.184 Y88.417 E.0171
G1 X132.13 Y88.971 E.0171
G1 X131.968 Y89.503 E.0171
G1 X131.706 Y89.994 E.0171
G1 X131.394 Y90.373 E.01508
M204 S10000
; WIPE_START
G1 F24000
G1 X131.353 Y90.424 E-.02498
G1 X130.922 Y90.777 E-.21148
G1 X130.432 Y91.04 E-.21148
G1 X129.899 Y91.201 E-.21149
G1 X129.636 Y91.227 E-.10057
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I-1.216 J-.04 P1  F30000
G1 X129.096 Y107.648 Z4.8
G1 Z4.4
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X129.251 Y107.639 E.00479
G1 X129.841 Y107.736 E.01835
G1 X130.395 Y107.957 E.01835
G1 X130.889 Y108.292 E.01835
G1 X131.3 Y108.725 E.01835
G1 X131.608 Y109.237 E.01835
G1 X131.798 Y109.803 E.01835
G1 X131.863 Y110.396 E.01835
G1 X131.798 Y110.99 E.01835
G1 X131.608 Y111.556 E.01835
G1 X131.3 Y112.067 E.01835
G1 X131.189 Y112.185 E.00497
G1 X130.889 Y112.501 E.01337
G1 X130.395 Y112.836 E.01835
G1 X129.841 Y113.057 E.01835
G1 X129.251 Y113.154 E.01835
G1 X128.655 Y113.121 E.01835
G1 X128.08 Y112.961 E.01835
G1 X127.552 Y112.682 E.01835
G1 X127.221 Y112.4 E.01337
G1 X127.097 Y112.295 E.00497
G1 X126.736 Y111.82 E.01835
G1 X126.485 Y111.278 E.01835
G1 X126.357 Y110.695 E.01835
G1 X126.357 Y110.098 E.01835
G1 X126.485 Y109.515 E.01835
G1 X126.736 Y108.973 E.01835
G1 X127.097 Y108.497 E.01835
G1 X127.552 Y108.111 E.01835
G1 X128.08 Y107.831 E.01835
G1 X128.655 Y107.672 E.01835
G1 X129.036 Y107.651 E.01172
M204 S10000
; WIPE_START
G1 F24000
G1 X129.251 Y107.639 E-.082
G1 X129.841 Y107.736 E-.22689
G1 X130.395 Y107.957 E-.22689
G1 X130.884 Y108.288 E-.22422
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I-1.215 J.068 P1  F30000
G1 X131.113 Y112.399 Z4.8
G1 Z4.4
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X131.109 Y112.404 E.00018
G1 X130.679 Y112.757 E.0171
G1 X130.188 Y113.019 E.0171
G1 X129.656 Y113.181 E.0171
G1 X129.102 Y113.235 E.0171
G1 X128.548 Y113.181 E.0171
G1 X128.015 Y113.019 E.0171
G1 X127.525 Y112.757 E.0171
G1 X127.094 Y112.404 E.0171
G1 X126.741 Y111.974 E.0171
G1 X126.479 Y111.483 E.0171
G1 X126.317 Y110.95 E.0171
G1 X126.263 Y110.396 E.0171
G1 X126.317 Y109.843 E.0171
G1 X126.479 Y109.31 E.0171
G1 X126.741 Y108.819 E.0171
G1 X127.094 Y108.389 E.0171
G1 X127.525 Y108.036 E.0171
G1 X128.015 Y107.773 E.0171
G1 X128.548 Y107.612 E.0171
G1 X129.102 Y107.557 E.0171
G1 X129.526 Y107.599 E.0131
G1 X129.656 Y107.612 E.004
G1 X130.188 Y107.773 E.0171
G1 X130.679 Y108.036 E.0171
G1 X131.109 Y108.389 E.0171
G1 X131.462 Y108.819 E.0171
G1 X131.725 Y109.31 E.0171
G1 X131.886 Y109.843 E.0171
G1 X131.941 Y110.396 E.0171
G1 X131.886 Y110.95 E.0171
G1 X131.725 Y111.483 E.0171
G1 X131.462 Y111.974 E.0171
G1 X131.151 Y112.353 E.01508
M204 S10000
; WIPE_START
G1 F24000
G1 X131.109 Y112.404 E-.02498
G1 X130.679 Y112.757 E-.21148
G1 X130.188 Y113.019 E-.21148
G1 X129.656 Y113.181 E-.21149
G1 X129.392 Y113.207 E-.10057
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I-1.215 J.061 P1  F30000
G1 X129.994 Y125.251 Z4.8
G1 Z4.4
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X130.149 Y125.243 E.00479
G1 X130.739 Y125.339 E.01835
G1 X131.293 Y125.56 E.01835
G1 X131.788 Y125.895 E.01835
G1 X132.198 Y126.329 E.01835
G1 X132.506 Y126.841 E.01835
G1 X132.697 Y127.406 E.01835
G1 X132.761 Y128 E.01835
G1 X132.697 Y128.594 E.01835
G1 X132.506 Y129.159 E.01835
G1 X132.198 Y129.671 E.01835
G1 X132.087 Y129.789 E.00497
G1 X131.788 Y130.105 E.01337
G1 X131.293 Y130.44 E.01835
G1 X130.739 Y130.661 E.01835
G1 X130.149 Y130.757 E.01835
G1 X129.553 Y130.725 E.01835
G1 X128.978 Y130.565 E.01835
G1 X128.45 Y130.285 E.01835
G1 X128.119 Y130.004 E.01337
G1 X127.995 Y129.899 E.00497
G1 X127.634 Y129.424 E.01835
G1 X127.383 Y128.882 E.01835
G1 X127.255 Y128.299 E.01835
G1 X127.255 Y127.701 E.01835
G1 X127.383 Y127.118 E.01835
G1 X127.634 Y126.576 E.01835
G1 X127.995 Y126.101 E.01835
G1 X128.45 Y125.715 E.01835
G1 X128.978 Y125.435 E.01835
G1 X129.553 Y125.275 E.01835
G1 X129.934 Y125.254 E.01172
M204 S10000
; WIPE_START
G1 F24000
G1 X130.149 Y125.243 E-.082
G1 X130.739 Y125.339 E-.22689
G1 X131.293 Y125.56 E-.22689
G1 X131.782 Y125.892 E-.22422
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I-1.215 J.068 P1  F30000
G1 X132.011 Y130.003 Z4.8
G1 Z4.4
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X132.007 Y130.007 E.00018
G1 X131.577 Y130.361 E.0171
G1 X131.086 Y130.623 E.0171
G1 X130.554 Y130.784 E.0171
G1 X130 Y130.839 E.0171
G1 X129.446 Y130.784 E.0171
G1 X128.914 Y130.623 E.0171
G1 X128.423 Y130.361 E.0171
G1 X127.993 Y130.007 E.0171
G1 X127.639 Y129.577 E.0171
G1 X127.377 Y129.086 E.0171
G1 X127.216 Y128.554 E.0171
G1 X127.161 Y128 E.0171
G1 X127.216 Y127.446 E.0171
G1 X127.377 Y126.914 E.0171
G1 X127.639 Y126.423 E.0171
G1 X127.993 Y125.993 E.0171
G1 X128.423 Y125.639 E.0171
G1 X128.914 Y125.377 E.0171
G1 X129.446 Y125.216 E.0171
G1 X130 Y125.161 E.0171
G1 X130.424 Y125.203 E.0131
G1 X130.554 Y125.216 E.004
G1 X131.086 Y125.377 E.0171
G1 X131.577 Y125.639 E.0171
G1 X132.007 Y125.993 E.0171
G1 X132.361 Y126.423 E.0171
G1 X132.623 Y126.914 E.0171
G1 X132.784 Y127.446 E.0171
G1 X132.839 Y128 E.0171
G1 X132.784 Y128.554 E.0171
G1 X132.623 Y129.086 E.0171
G1 X132.361 Y129.577 E.0171
G1 X132.049 Y129.957 E.01508
M204 S10000
; WIPE_START
G1 F24000
G1 X132.007 Y130.007 E-.02498
G1 X131.577 Y130.361 E-.21148
G1 X131.086 Y130.623 E-.21148
G1 X130.554 Y130.784 E-.21149
G1 X130.29 Y130.81 E-.10057
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I-.321 J-1.174 P1  F30000
G1 X109.144 Y136.602 Z4.8
G1 Z4.4
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X109.525 Y136.581 E.01173
G1 X110.114 Y136.678 E.01835
G1 X110.669 Y136.899 E.01835
G1 X111.163 Y137.234 E.01835
G1 X111.574 Y137.667 E.01835
G1 X111.881 Y138.179 E.01835
G1 X112.072 Y138.745 E.01835
G1 X112.137 Y139.339 E.01835
G1 X112.072 Y139.932 E.01835
G1 X111.881 Y140.498 E.01835
G1 X111.574 Y141.01 E.01835
G1 X111.163 Y141.443 E.01835
G1 X110.669 Y141.778 E.01835
G1 X110.114 Y141.999 E.01835
G1 X109.525 Y142.096 E.01835
G1 X108.929 Y142.063 E.01835
G1 X108.353 Y141.904 E.01835
G1 X107.826 Y141.624 E.01835
G1 X107.371 Y141.237 E.01835
G1 X107.009 Y140.762 E.01835
G1 X106.759 Y140.22 E.01835
G1 X106.63 Y139.637 E.01835
G1 X106.63 Y139.04 E.01835
G1 X106.759 Y138.457 E.01835
G1 X107.009 Y137.915 E.01835
G1 X107.371 Y137.44 E.01835
G1 X107.826 Y137.053 E.01835
G1 X108.353 Y136.773 E.01835
G1 X108.929 Y136.614 E.01835
G1 X109.084 Y136.605 E.00478
M204 S10000
; WIPE_START
G1 F24000
G1 X109.525 Y136.581 E-.16783
G1 X110.114 Y136.678 E-.22689
G1 X110.669 Y136.899 E-.22689
G1 X110.97 Y137.103 E-.13838
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I-1.211 J.117 P1  F30000
G1 X111.381 Y141.347 Z4.8
G1 Z4.4
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X110.953 Y141.699 E.01704
G1 X110.462 Y141.961 E.0171
G1 X109.929 Y142.123 E.0171
G1 X109.375 Y142.177 E.0171
G1 X108.822 Y142.123 E.0171
G1 X108.289 Y141.961 E.0171
G1 X107.798 Y141.699 E.0171
G1 X107.368 Y141.346 E.0171
G1 X107.015 Y140.916 E.0171
G1 X106.752 Y140.425 E.0171
G1 X106.591 Y139.892 E.0171
G1 X106.536 Y139.339 E.0171
G1 X106.591 Y138.785 E.0171
G1 X106.752 Y138.252 E.0171
G1 X107.015 Y137.761 E.0171
G1 X107.368 Y137.331 E.0171
G1 X107.798 Y136.978 E.0171
G1 X108.289 Y136.716 E.0171
G1 X108.822 Y136.554 E.0171
G1 X109.375 Y136.5 E.0171
G1 X109.556 Y136.517 E.00558
G1 X109.929 Y136.554 E.01152
G1 X110.462 Y136.716 E.0171
G1 X110.953 Y136.978 E.0171
G1 X111.383 Y137.331 E.0171
G1 X111.736 Y137.761 E.0171
G1 X111.998 Y138.252 E.0171
G1 X112.16 Y138.785 E.0171
G1 X112.214 Y139.339 E.0171
G1 X112.16 Y139.892 E.0171
G1 X111.998 Y140.425 E.0171
G1 X111.736 Y140.916 E.0171
G1 X111.42 Y141.301 E.01532
M204 S10000
; WIPE_START
G1 F24000
G1 X110.953 Y141.699 E-.23315
G1 X110.462 Y141.961 E-.21149
G1 X109.929 Y142.123 E-.21148
G1 X109.657 Y142.15 E-.10388
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I1.217 J-.022 P1  F30000
G1 X109.185 Y116.597 Z4.8
G1 Z4.4
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X109.566 Y116.577 E.01173
G1 X110.155 Y116.673 E.01835
G1 X110.71 Y116.894 E.01835
G1 X111.204 Y117.229 E.01835
G1 X111.615 Y117.663 E.01835
G1 X111.923 Y118.174 E.01835
G1 X112.113 Y118.74 E.01835
G1 X112.178 Y119.334 E.01835
G1 X112.113 Y119.927 E.01835
G1 X111.923 Y120.493 E.01835
G1 X111.615 Y121.005 E.01835
G1 X111.204 Y121.438 E.01835
G1 X110.71 Y121.773 E.01835
G1 X110.155 Y121.994 E.01835
G1 X109.566 Y122.091 E.01835
G1 X108.97 Y122.059 E.01835
G1 X108.394 Y121.899 E.01835
G1 X107.867 Y121.619 E.01835
G1 X107.412 Y121.233 E.01835
G1 X107.051 Y120.757 E.01835
G1 X106.8 Y120.215 E.01835
G1 X106.671 Y119.632 E.01835
G1 X106.671 Y119.035 E.01835
G1 X106.8 Y118.452 E.01835
G1 X107.051 Y117.91 E.01835
G1 X107.412 Y117.435 E.01835
G1 X107.867 Y117.048 E.01835
G1 X108.394 Y116.769 E.01835
G1 X108.97 Y116.609 E.01835
G1 X109.125 Y116.601 E.00478
M204 S10000
; WIPE_START
G1 F24000
G1 X109.566 Y116.577 E-.16783
G1 X110.155 Y116.673 E-.22689
G1 X110.71 Y116.894 E-.22689
G1 X111.011 Y117.099 E-.13838
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I-1.211 J.117 P1  F30000
G1 X111.422 Y121.343 Z4.8
G1 Z4.4
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X110.994 Y121.694 E.01704
G1 X110.503 Y121.957 E.0171
G1 X109.97 Y122.118 E.0171
G1 X109.417 Y122.173 E.0171
G1 X108.863 Y122.118 E.0171
G1 X108.33 Y121.957 E.0171
G1 X107.839 Y121.694 E.0171
G1 X107.409 Y121.341 E.0171
G1 X107.056 Y120.911 E.0171
G1 X106.794 Y120.42 E.0171
G1 X106.632 Y119.888 E.0171
G1 X106.578 Y119.334 E.0171
G1 X106.632 Y118.78 E.0171
G1 X106.794 Y118.247 E.0171
G1 X107.056 Y117.757 E.0171
M73 P82 R1
G1 X107.409 Y117.326 E.0171
G1 X107.839 Y116.973 E.0171
G1 X108.33 Y116.711 E.0171
G1 X108.863 Y116.549 E.0171
G1 X109.417 Y116.495 E.0171
G1 X109.597 Y116.513 E.00558
G1 X109.97 Y116.549 E.01152
G1 X110.503 Y116.711 E.0171
G1 X110.994 Y116.973 E.0171
G1 X111.424 Y117.326 E.0171
M73 P83 R1
G1 X111.777 Y117.757 E.0171
G1 X112.039 Y118.247 E.0171
G1 X112.201 Y118.78 E.0171
G1 X112.256 Y119.334 E.0171
G1 X112.201 Y119.888 E.0171
G1 X112.039 Y120.42 E.0171
G1 X111.777 Y120.911 E.0171
G1 X111.461 Y121.296 E.01532
M204 S10000
; WIPE_START
G1 F24000
G1 X110.994 Y121.694 E-.23315
G1 X110.503 Y121.957 E-.21149
G1 X109.97 Y122.118 E-.21148
G1 X109.698 Y122.145 E-.10388
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I1.216 J-.039 P1  F30000
G1 X108.891 Y96.821 Z4.8
G1 Z4.4
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X109.272 Y96.8 E.01173
G1 X109.861 Y96.897 E.01835
G1 X110.416 Y97.118 E.01835
G1 X110.91 Y97.453 E.01835
G1 X111.321 Y97.886 E.01835
G1 X111.628 Y98.398 E.01835
G1 X111.819 Y98.964 E.01835
G1 X111.884 Y99.557 E.01835
G1 X111.819 Y100.151 E.01835
G1 X111.628 Y100.717 E.01835
G1 X111.321 Y101.228 E.01835
G1 X110.91 Y101.662 E.01835
G1 X110.416 Y101.997 E.01835
G1 X109.861 Y102.218 E.01835
G1 X109.272 Y102.315 E.01835
G1 X108.676 Y102.282 E.01835
G1 X108.1 Y102.122 E.01835
G1 X107.573 Y101.843 E.01835
G1 X107.118 Y101.456 E.01835
G1 X106.756 Y100.981 E.01835
G1 X106.506 Y100.439 E.01835
G1 X106.377 Y99.856 E.01835
G1 X106.377 Y99.259 E.01835
G1 X106.506 Y98.676 E.01835
G1 X106.756 Y98.134 E.01835
G1 X107.118 Y97.658 E.01835
G1 X107.573 Y97.272 E.01835
G1 X108.1 Y96.992 E.01835
G1 X108.676 Y96.832 E.01835
G1 X108.831 Y96.824 E.00478
M204 S10000
; WIPE_START
G1 F24000
G1 X109.272 Y96.8 E-.16783
G1 X109.861 Y96.897 E-.22689
G1 X110.416 Y97.118 E-.22689
G1 X110.717 Y97.322 E-.13838
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I-1.211 J.117 P1  F30000
G1 X111.128 Y101.566 Z4.8
G1 Z4.4
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X110.7 Y101.918 E.01704
G1 X110.209 Y102.18 E.0171
G1 X109.676 Y102.342 E.0171
G1 X109.122 Y102.396 E.0171
G1 X108.569 Y102.342 E.0171
G1 X108.036 Y102.18 E.0171
G1 X107.545 Y101.918 E.0171
G1 X107.115 Y101.565 E.0171
G1 X106.762 Y101.135 E.0171
G1 X106.5 Y100.644 E.0171
G1 X106.338 Y100.111 E.0171
G1 X106.283 Y99.557 E.0171
G1 X106.338 Y99.003 E.0171
G1 X106.5 Y98.471 E.0171
G1 X106.762 Y97.98 E.0171
G1 X107.115 Y97.55 E.0171
G1 X107.545 Y97.197 E.0171
G1 X108.036 Y96.934 E.0171
G1 X108.569 Y96.773 E.0171
G1 X109.122 Y96.718 E.0171
G1 X109.303 Y96.736 E.00558
G1 X109.676 Y96.773 E.01152
G1 X110.209 Y96.934 E.0171
G1 X110.7 Y97.197 E.0171
G1 X111.13 Y97.55 E.0171
G1 X111.483 Y97.98 E.0171
G1 X111.745 Y98.471 E.0171
G1 X111.907 Y99.003 E.0171
G1 X111.961 Y99.557 E.0171
G1 X111.907 Y100.111 E.0171
G1 X111.745 Y100.644 E.0171
G1 X111.483 Y101.135 E.0171
G1 X111.167 Y101.52 E.01532
M204 S10000
; WIPE_START
G1 F24000
G1 X110.7 Y101.918 E-.23315
G1 X110.209 Y102.18 E-.21149
G1 X109.676 Y102.342 E-.21148
G1 X109.404 Y102.369 E-.10388
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I1.216 J-.056 P1  F30000
G1 X108.109 Y74.005 Z4.8
G1 Z4.4
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X108.49 Y73.985 E.01173
G1 X109.079 Y74.081 E.01835
G1 X109.634 Y74.302 E.01835
G1 X110.128 Y74.637 E.01835
G1 X110.538 Y75.071 E.01835
G1 X110.846 Y75.582 E.01835
G1 X111.037 Y76.148 E.01835
G1 X111.102 Y76.742 E.01835
G1 X111.037 Y77.335 E.01835
G1 X110.846 Y77.901 E.01835
G1 X110.538 Y78.413 E.01835
G1 X110.128 Y78.846 E.01835
G1 X109.634 Y79.181 E.01835
G1 X109.079 Y79.402 E.01835
G1 X108.49 Y79.499 E.01835
G1 X107.894 Y79.467 E.01835
G1 X107.318 Y79.307 E.01835
G1 X106.791 Y79.027 E.01835
G1 X106.336 Y78.641 E.01835
G1 X105.974 Y78.165 E.01835
G1 X105.724 Y77.623 E.01835
G1 X105.595 Y77.04 E.01835
G1 X105.595 Y76.443 E.01835
G1 X105.724 Y75.86 E.01835
G1 X105.974 Y75.318 E.01835
G1 X106.336 Y74.843 E.01835
G1 X106.791 Y74.456 E.01835
G1 X107.318 Y74.177 E.01835
G1 X107.894 Y74.017 E.01835
G1 X108.049 Y74.008 E.00478
M204 S10000
; WIPE_START
G1 F24000
G1 X108.49 Y73.985 E-.16783
G1 X109.079 Y74.081 E-.22689
G1 X109.634 Y74.302 E-.22689
G1 X109.935 Y74.507 E-.13838
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I-1.211 J.117 P1  F30000
G1 X110.346 Y78.75 Z4.8
G1 Z4.4
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X109.918 Y79.102 E.01704
G1 X109.427 Y79.365 E.0171
G1 X108.894 Y79.526 E.0171
G1 X108.34 Y79.581 E.0171
G1 X107.786 Y79.526 E.0171
G1 X107.254 Y79.365 E.0171
G1 X106.763 Y79.102 E.0171
G1 X106.333 Y78.749 E.0171
G1 X105.98 Y78.319 E.0171
G1 X105.717 Y77.828 E.0171
G1 X105.556 Y77.296 E.0171
G1 X105.501 Y76.742 E.0171
G1 X105.556 Y76.188 E.0171
G1 X105.717 Y75.655 E.0171
G1 X105.98 Y75.164 E.0171
G1 X106.333 Y74.734 E.0171
G1 X106.763 Y74.381 E.0171
G1 X107.254 Y74.119 E.0171
G1 X107.786 Y73.957 E.0171
G1 X108.34 Y73.903 E.0171
G1 X108.521 Y73.921 E.00558
G1 X108.894 Y73.957 E.01152
G1 X109.427 Y74.119 E.0171
G1 X109.918 Y74.381 E.0171
G1 X110.348 Y74.734 E.0171
G1 X110.701 Y75.164 E.0171
G1 X110.963 Y75.655 E.0171
G1 X111.125 Y76.188 E.0171
G1 X111.179 Y76.742 E.0171
G1 X111.125 Y77.296 E.0171
G1 X110.963 Y77.828 E.0171
G1 X110.701 Y78.319 E.0171
G1 X110.385 Y78.704 E.01532
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 4.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X109.918 Y79.102 E-.23315
G1 X109.427 Y79.365 E-.21149
G1 X108.894 Y79.526 E-.21148
G1 X108.622 Y79.553 E-.10388
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 23/32
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
G3 Z4.8 I-.344 J1.167 P1  F30000
G1 X129.341 Y85.668 Z4.8
G1 Z4.6
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X129.352 Y85.667 E.00035
G1 X129.495 Y85.66 E.00439
G1 X130.084 Y85.756 E.01835
G1 X130.639 Y85.977 E.01835
G1 X131.133 Y86.312 E.01835
G1 X131.543 Y86.746 E.01835
G1 X131.851 Y87.257 E.01835
G1 X132.042 Y87.823 E.01835
G1 X132.106 Y88.417 E.01835
G1 X132.042 Y89.01 E.01835
G1 X131.851 Y89.576 E.01835
G1 X131.543 Y90.088 E.01835
G1 X131.445 Y90.191 E.00439
G1 X131.133 Y90.521 E.01396
G1 X130.639 Y90.856 E.01835
G1 X130.084 Y91.077 E.01835
G1 X129.495 Y91.174 E.01835
G1 X128.898 Y91.142 E.01835
G1 X128.323 Y90.982 E.01835
G1 X127.796 Y90.702 E.01835
G1 X127.341 Y90.316 E.01835
G1 X126.979 Y89.84 E.01835
G1 X126.728 Y89.298 E.01835
G1 X126.6 Y88.715 E.01835
G1 X126.6 Y88.118 E.01835
G1 X126.728 Y87.535 E.01835
G1 X126.979 Y86.993 E.01835
G1 X127.341 Y86.518 E.01835
G1 X127.796 Y86.131 E.01835
G1 X128.323 Y85.852 E.01835
G1 X128.898 Y85.692 E.01835
G1 X129.281 Y85.671 E.01177
M204 S10000
; WIPE_START
G1 F24000
G1 X129.352 Y85.667 E-.02708
G1 X129.495 Y85.66 E-.05423
G1 X130.084 Y85.756 E-.22689
G1 X130.639 Y85.977 E-.22689
G1 X131.128 Y86.309 E-.22491
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I-1.215 J.068 P1  F30000
G1 X131.36 Y90.416 Z5
G1 Z4.6
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X131.353 Y90.424 E.00034
G1 X130.922 Y90.777 E.0171
G1 X130.432 Y91.04 E.0171
G1 X129.899 Y91.201 E.0171
G1 X129.345 Y91.256 E.0171
G1 X128.791 Y91.201 E.0171
G1 X128.259 Y91.04 E.0171
G1 X127.768 Y90.777 E.0171
G1 X127.338 Y90.424 E.0171
G1 X126.985 Y89.994 E.0171
G1 X126.722 Y89.503 E.0171
G1 X126.561 Y88.971 E.0171
G1 X126.506 Y88.417 E.0171
G1 X126.561 Y87.863 E.0171
G1 X126.722 Y87.33 E.0171
G1 X126.985 Y86.839 E.0171
G1 X127.338 Y86.409 E.0171
G1 X127.768 Y86.056 E.0171
G1 X128.259 Y85.794 E.0171
G1 X128.791 Y85.632 E.0171
G1 X129.345 Y85.578 E.0171
G1 X129.79 Y85.622 E.01374
G1 X129.899 Y85.632 E.00336
G1 X130.432 Y85.794 E.0171
G1 X130.922 Y86.056 E.0171
G1 X131.353 Y86.409 E.0171
G1 X131.706 Y86.839 E.0171
G1 X131.968 Y87.33 E.0171
G1 X132.13 Y87.863 E.0171
G1 X132.184 Y88.417 E.0171
G1 X132.13 Y88.971 E.0171
G1 X131.968 Y89.503 E.0171
G1 X131.706 Y89.994 E.0171
G1 X131.398 Y90.369 E.01492
M204 S10000
; WIPE_START
G1 F24000
G1 X131.353 Y90.424 E-.02697
G1 X130.922 Y90.777 E-.21148
G1 X130.432 Y91.04 E-.21149
G1 X129.899 Y91.201 E-.21148
G1 X129.641 Y91.227 E-.09858
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I-1.216 J-.04 P1  F30000
G1 X129.098 Y107.648 Z5
G1 Z4.6
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X129.109 Y107.647 E.00035
G1 X129.251 Y107.639 E.00439
G1 X129.841 Y107.736 E.01835
G1 X130.395 Y107.957 E.01835
G1 X130.889 Y108.292 E.01835
G1 X131.3 Y108.725 E.01835
G1 X131.608 Y109.237 E.01835
G1 X131.798 Y109.803 E.01835
G1 X131.863 Y110.396 E.01835
G1 X131.798 Y110.99 E.01835
G1 X131.608 Y111.556 E.01835
G1 X131.3 Y112.067 E.01835
G1 X131.202 Y112.171 E.00439
G1 X130.889 Y112.501 E.01396
G1 X130.395 Y112.836 E.01835
G1 X129.841 Y113.057 E.01835
G1 X129.251 Y113.154 E.01835
G1 X128.655 Y113.121 E.01835
G1 X128.08 Y112.961 E.01835
G1 X127.552 Y112.682 E.01835
G1 X127.097 Y112.295 E.01835
G1 X126.736 Y111.82 E.01835
G1 X126.485 Y111.278 E.01835
G1 X126.357 Y110.695 E.01835
G1 X126.357 Y110.098 E.01835
G1 X126.485 Y109.515 E.01835
G1 X126.736 Y108.973 E.01835
G1 X127.097 Y108.497 E.01835
G1 X127.552 Y108.111 E.01835
G1 X128.08 Y107.831 E.01835
G1 X128.655 Y107.672 E.01835
G1 X129.038 Y107.651 E.01177
M204 S10000
; WIPE_START
G1 F24000
G1 X129.109 Y107.647 E-.02708
G1 X129.251 Y107.639 E-.05423
G1 X129.841 Y107.736 E-.22689
G1 X130.395 Y107.957 E-.22689
G1 X130.885 Y108.289 E-.22491
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I-1.215 J.068 P1  F30000
G1 X131.116 Y112.395 Z5
G1 Z4.6
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X131.109 Y112.404 E.00034
G1 X130.679 Y112.757 E.0171
G1 X130.188 Y113.019 E.0171
G1 X129.656 Y113.181 E.0171
G1 X129.102 Y113.235 E.0171
G1 X128.548 Y113.181 E.0171
G1 X128.015 Y113.019 E.0171
G1 X127.525 Y112.757 E.0171
G1 X127.094 Y112.404 E.0171
G1 X126.741 Y111.974 E.0171
G1 X126.479 Y111.483 E.0171
G1 X126.317 Y110.95 E.0171
G1 X126.263 Y110.396 E.0171
G1 X126.317 Y109.843 E.0171
G1 X126.479 Y109.31 E.0171
G1 X126.741 Y108.819 E.0171
G1 X127.094 Y108.389 E.0171
G1 X127.525 Y108.036 E.0171
G1 X128.015 Y107.773 E.0171
G1 X128.548 Y107.612 E.0171
G1 X129.102 Y107.557 E.0171
G1 X129.547 Y107.601 E.01374
G1 X129.656 Y107.612 E.00336
G1 X130.188 Y107.773 E.0171
G1 X130.679 Y108.036 E.0171
G1 X131.109 Y108.389 E.0171
G1 X131.462 Y108.819 E.0171
G1 X131.725 Y109.31 E.0171
G1 X131.886 Y109.843 E.0171
G1 X131.941 Y110.396 E.0171
G1 X131.886 Y110.95 E.0171
G1 X131.725 Y111.483 E.0171
G1 X131.462 Y111.974 E.0171
G1 X131.154 Y112.349 E.01492
M204 S10000
; WIPE_START
G1 F24000
G1 X131.109 Y112.404 E-.02697
G1 X130.679 Y112.757 E-.21148
G1 X130.188 Y113.019 E-.21149
G1 X129.656 Y113.181 E-.21148
G1 X129.397 Y113.206 E-.09858
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I-1.215 J.06 P1  F30000
G1 X129.996 Y125.251 Z5
G1 Z4.6
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X130.007 Y125.251 E.00035
G1 X130.149 Y125.243 E.00439
G1 X130.739 Y125.339 E.01835
G1 X131.293 Y125.56 E.01835
G1 X131.788 Y125.895 E.01835
G1 X132.198 Y126.329 E.01835
G1 X132.506 Y126.841 E.01835
G1 X132.697 Y127.406 E.01835
G1 X132.761 Y128 E.01835
G1 X132.697 Y128.594 E.01835
G1 X132.506 Y129.159 E.01835
G1 X132.198 Y129.671 E.01835
G1 X132.1 Y129.775 E.00439
G1 X131.788 Y130.105 E.01396
G1 X131.293 Y130.44 E.01835
G1 X130.739 Y130.661 E.01835
G1 X130.149 Y130.757 E.01835
G1 X129.553 Y130.725 E.01835
G1 X128.978 Y130.565 E.01835
G1 X128.45 Y130.285 E.01835
G1 X127.995 Y129.899 E.01835
G1 X127.634 Y129.424 E.01835
G1 X127.383 Y128.882 E.01835
G1 X127.255 Y128.299 E.01835
G1 X127.255 Y127.701 E.01835
G1 X127.383 Y127.118 E.01835
G1 X127.634 Y126.576 E.01835
G1 X127.995 Y126.101 E.01835
G1 X128.45 Y125.715 E.01835
G1 X128.978 Y125.435 E.01835
G1 X129.553 Y125.275 E.01835
G1 X129.936 Y125.254 E.01177
M204 S10000
; WIPE_START
G1 F24000
G1 X130.007 Y125.251 E-.02708
G1 X130.149 Y125.243 E-.05423
G1 X130.739 Y125.339 E-.22689
G1 X131.293 Y125.56 E-.22689
G1 X131.783 Y125.893 E-.22491
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I-1.215 J.068 P1  F30000
G1 X132.014 Y129.999 Z5
G1 Z4.6
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X132.007 Y130.007 E.00034
G1 X131.577 Y130.361 E.0171
G1 X131.086 Y130.623 E.0171
G1 X130.554 Y130.784 E.0171
G1 X130 Y130.839 E.0171
G1 X129.446 Y130.784 E.0171
G1 X128.914 Y130.623 E.0171
G1 X128.423 Y130.361 E.0171
G1 X127.993 Y130.007 E.0171
G1 X127.639 Y129.577 E.0171
G1 X127.377 Y129.086 E.0171
G1 X127.216 Y128.554 E.0171
M73 P84 R1
G1 X127.161 Y128 E.0171
G1 X127.216 Y127.446 E.0171
G1 X127.377 Y126.914 E.0171
G1 X127.639 Y126.423 E.0171
G1 X127.993 Y125.993 E.0171
G1 X128.423 Y125.639 E.0171
G1 X128.914 Y125.377 E.0171
G1 X129.446 Y125.216 E.0171
G1 X130 Y125.161 E.0171
G1 X130.445 Y125.205 E.01374
G1 X130.554 Y125.216 E.00336
G1 X131.086 Y125.377 E.0171
G1 X131.577 Y125.639 E.0171
G1 X132.007 Y125.993 E.0171
G1 X132.361 Y126.423 E.0171
G1 X132.623 Y126.914 E.0171
G1 X132.784 Y127.446 E.0171
G1 X132.839 Y128 E.0171
G1 X132.784 Y128.554 E.0171
G1 X132.623 Y129.086 E.0171
G1 X132.361 Y129.577 E.0171
G1 X132.052 Y129.953 E.01492
M204 S10000
; WIPE_START
G1 F24000
G1 X132.007 Y130.007 E-.02697
G1 X131.577 Y130.361 E-.21148
G1 X131.086 Y130.623 E-.21149
G1 X130.554 Y130.784 E-.21148
G1 X130.296 Y130.81 E-.09858
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I-.321 J-1.174 P1  F30000
G1 X109.126 Y136.603 Z5
G1 Z4.6
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X109.525 Y136.581 E.01227
G1 X110.114 Y136.678 E.01835
G1 X110.669 Y136.899 E.01835
G1 X111.163 Y137.234 E.01835
G1 X111.574 Y137.667 E.01835
G1 X111.881 Y138.179 E.01835
G1 X112.072 Y138.745 E.01835
G1 X112.137 Y139.339 E.01835
G1 X112.072 Y139.932 E.01835
G1 X111.881 Y140.498 E.01835
G1 X111.574 Y141.01 E.01835
G1 X111.441 Y141.149 E.00592
G1 X111.163 Y141.443 E.01243
G1 X110.669 Y141.778 E.01835
G1 X110.114 Y141.999 E.01835
G1 X109.525 Y142.096 E.01835
G1 X108.929 Y142.063 E.01835
G1 X108.353 Y141.904 E.01835
G1 X107.826 Y141.624 E.01835
G1 X107.371 Y141.237 E.01835
G1 X107.009 Y140.762 E.01835
G1 X106.759 Y140.22 E.01835
G1 X106.63 Y139.637 E.01835
G1 X106.63 Y139.04 E.01835
G1 X106.759 Y138.457 E.01835
G1 X107.009 Y137.915 E.01835
G1 X107.371 Y137.44 E.01835
G1 X107.826 Y137.053 E.01835
G1 X108.353 Y136.773 E.01835
G1 X108.929 Y136.614 E.01835
G1 X109.066 Y136.606 E.00423
M204 S10000
; WIPE_START
G1 F24000
G1 X109.525 Y136.581 E-.1746
G1 X110.114 Y136.678 E-.22689
G1 X110.669 Y136.899 E-.22689
G1 X110.955 Y137.093 E-.13162
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I-1.211 J.122 P1  F30000
G1 X111.384 Y141.345 Z5
G1 Z4.6
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X111.383 Y141.346 E.00005
G1 X110.953 Y141.699 E.0171
G1 X110.462 Y141.961 E.0171
G1 X109.929 Y142.123 E.0171
G1 X109.375 Y142.177 E.0171
G1 X108.822 Y142.123 E.0171
G1 X108.289 Y141.961 E.0171
G1 X107.798 Y141.699 E.0171
G1 X107.368 Y141.346 E.0171
G1 X107.015 Y140.916 E.0171
G1 X106.752 Y140.425 E.0171
G1 X106.591 Y139.892 E.0171
G1 X106.536 Y139.339 E.0171
G1 X106.591 Y138.785 E.0171
G1 X106.752 Y138.252 E.0171
G1 X107.015 Y137.761 E.0171
G1 X107.368 Y137.331 E.0171
G1 X107.798 Y136.978 E.0171
G1 X108.289 Y136.716 E.0171
G1 X108.822 Y136.554 E.0171
G1 X109.375 Y136.5 E.0171
G1 X109.538 Y136.516 E.00502
G1 X109.929 Y136.554 E.01208
G1 X110.462 Y136.716 E.0171
G1 X110.953 Y136.978 E.0171
G1 X111.383 Y137.331 E.0171
G1 X111.736 Y137.761 E.0171
G1 X111.998 Y138.252 E.0171
G1 X112.16 Y138.785 E.0171
G1 X112.214 Y139.339 E.0171
G1 X112.16 Y139.892 E.0171
G1 X111.998 Y140.425 E.0171
G1 X111.736 Y140.916 E.0171
G1 X111.422 Y141.298 E.01521
M204 S10000
; WIPE_START
G1 F24000
G1 X111.383 Y141.346 E-.02336
G1 X110.953 Y141.699 E-.21149
G1 X110.462 Y141.961 E-.21149
G1 X109.929 Y142.123 E-.21148
G1 X109.662 Y142.149 E-.10219
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I1.217 J-.024 P1  F30000
G1 X109.167 Y116.598 Z5
G1 Z4.6
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X109.566 Y116.577 E.01227
G1 X110.155 Y116.673 E.01835
G1 X110.71 Y116.894 E.01835
G1 X111.204 Y117.229 E.01835
G1 X111.615 Y117.663 E.01835
G1 X111.923 Y118.174 E.01835
G1 X112.113 Y118.74 E.01835
G1 X112.178 Y119.334 E.01835
G1 X112.113 Y119.927 E.01835
G1 X111.923 Y120.493 E.01835
G1 X111.615 Y121.005 E.01835
G1 X111.482 Y121.145 E.00592
G1 X111.204 Y121.438 E.01243
G1 X110.71 Y121.773 E.01835
G1 X110.155 Y121.994 E.01835
G1 X109.566 Y122.091 E.01835
G1 X108.97 Y122.059 E.01835
G1 X108.394 Y121.899 E.01835
G1 X107.867 Y121.619 E.01835
G1 X107.412 Y121.233 E.01835
G1 X107.051 Y120.757 E.01835
G1 X106.8 Y120.215 E.01835
G1 X106.671 Y119.632 E.01835
G1 X106.671 Y119.035 E.01835
G1 X106.8 Y118.452 E.01835
G1 X107.051 Y117.91 E.01835
G1 X107.412 Y117.435 E.01835
G1 X107.867 Y117.048 E.01835
G1 X108.394 Y116.769 E.01835
G1 X108.97 Y116.609 E.01835
G1 X109.107 Y116.602 E.00423
M204 S10000
; WIPE_START
G1 F24000
G1 X109.566 Y116.577 E-.1746
G1 X110.155 Y116.673 E-.22689
G1 X110.71 Y116.894 E-.22689
G1 X110.997 Y117.089 E-.13162
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I-1.211 J.122 P1  F30000
G1 X111.425 Y121.34 Z5
G1 Z4.6
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X111.424 Y121.341 E.00005
G1 X110.994 Y121.694 E.0171
G1 X110.503 Y121.957 E.0171
G1 X109.97 Y122.118 E.0171
G1 X109.417 Y122.173 E.0171
G1 X108.863 Y122.118 E.0171
G1 X108.33 Y121.957 E.0171
G1 X107.839 Y121.694 E.0171
G1 X107.409 Y121.341 E.0171
G1 X107.056 Y120.911 E.0171
G1 X106.794 Y120.42 E.0171
G1 X106.632 Y119.888 E.0171
G1 X106.578 Y119.334 E.0171
G1 X106.632 Y118.78 E.0171
G1 X106.794 Y118.247 E.0171
G1 X107.056 Y117.757 E.0171
G1 X107.409 Y117.326 E.0171
G1 X107.839 Y116.973 E.0171
G1 X108.33 Y116.711 E.0171
G1 X108.863 Y116.549 E.0171
G1 X109.417 Y116.495 E.0171
G1 X109.579 Y116.511 E.00502
G1 X109.97 Y116.549 E.01208
G1 X110.503 Y116.711 E.0171
G1 X110.994 Y116.973 E.0171
G1 X111.424 Y117.326 E.0171
G1 X111.777 Y117.757 E.0171
G1 X112.039 Y118.247 E.0171
G1 X112.201 Y118.78 E.0171
G1 X112.256 Y119.334 E.0171
G1 X112.201 Y119.888 E.0171
G1 X112.039 Y120.42 E.0171
G1 X111.777 Y120.911 E.0171
G1 X111.463 Y121.294 E.01521
M204 S10000
; WIPE_START
G1 F24000
G1 X111.424 Y121.341 E-.02336
G1 X110.994 Y121.694 E-.21149
G1 X110.503 Y121.957 E-.21149
G1 X109.97 Y122.118 E-.21148
G1 X109.703 Y122.145 E-.10219
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I1.216 J-.04 P1  F30000
G1 X108.873 Y96.822 Z5
G1 Z4.6
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X109.272 Y96.8 E.01227
G1 X109.861 Y96.897 E.01835
G1 X110.416 Y97.118 E.01835
G1 X110.91 Y97.453 E.01835
G1 X111.321 Y97.886 E.01835
G1 X111.628 Y98.398 E.01835
G1 X111.819 Y98.964 E.01835
G1 X111.884 Y99.557 E.01835
G1 X111.819 Y100.151 E.01835
G1 X111.628 Y100.717 E.01835
G1 X111.321 Y101.228 E.01835
G1 X111.188 Y101.368 E.00592
G1 X110.91 Y101.662 E.01243
G1 X110.416 Y101.997 E.01835
G1 X109.861 Y102.218 E.01835
G1 X109.272 Y102.315 E.01835
G1 X108.676 Y102.282 E.01835
G1 X108.1 Y102.122 E.01835
G1 X107.573 Y101.843 E.01835
G1 X107.118 Y101.456 E.01835
G1 X106.756 Y100.981 E.01835
G1 X106.506 Y100.439 E.01835
G1 X106.377 Y99.856 E.01835
G1 X106.377 Y99.259 E.01835
G1 X106.506 Y98.676 E.01835
G1 X106.756 Y98.134 E.01835
G1 X107.118 Y97.658 E.01835
G1 X107.573 Y97.272 E.01835
G1 X108.1 Y96.992 E.01835
G1 X108.676 Y96.832 E.01835
G1 X108.813 Y96.825 E.00423
M204 S10000
; WIPE_START
G1 F24000
G1 X109.272 Y96.8 E-.1746
G1 X109.861 Y96.897 E-.22689
G1 X110.416 Y97.118 E-.22689
G1 X110.702 Y97.312 E-.13162
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I-1.211 J.122 P1  F30000
G1 X111.131 Y101.564 Z5
G1 Z4.6
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X111.13 Y101.565 E.00005
G1 X110.7 Y101.918 E.0171
G1 X110.209 Y102.18 E.0171
G1 X109.676 Y102.342 E.0171
G1 X109.122 Y102.396 E.0171
G1 X108.569 Y102.342 E.0171
G1 X108.036 Y102.18 E.0171
G1 X107.545 Y101.918 E.0171
G1 X107.115 Y101.565 E.0171
G1 X106.762 Y101.135 E.0171
G1 X106.5 Y100.644 E.0171
G1 X106.338 Y100.111 E.0171
G1 X106.283 Y99.557 E.0171
G1 X106.338 Y99.003 E.0171
G1 X106.5 Y98.471 E.0171
G1 X106.762 Y97.98 E.0171
G1 X107.115 Y97.55 E.0171
G1 X107.545 Y97.197 E.0171
G1 X108.036 Y96.934 E.0171
G1 X108.569 Y96.773 E.0171
G1 X109.122 Y96.718 E.0171
G1 X109.285 Y96.734 E.00502
G1 X109.676 Y96.773 E.01208
G1 X110.209 Y96.934 E.0171
G1 X110.7 Y97.197 E.0171
G1 X111.13 Y97.55 E.0171
G1 X111.483 Y97.98 E.0171
G1 X111.745 Y98.471 E.0171
G1 X111.907 Y99.003 E.0171
G1 X111.961 Y99.557 E.0171
G1 X111.907 Y100.111 E.0171
G1 X111.745 Y100.644 E.0171
G1 X111.483 Y101.135 E.0171
G1 X111.169 Y101.517 E.01521
M204 S10000
; WIPE_START
G1 F24000
G1 X111.13 Y101.565 E-.02336
G1 X110.7 Y101.918 E-.21149
G1 X110.209 Y102.18 E-.21149
G1 X109.676 Y102.342 E-.21148
G1 X109.409 Y102.368 E-.10219
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I1.216 J-.056 P1  F30000
G1 X108.091 Y74.006 Z5
G1 Z4.6
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X108.49 Y73.985 E.01227
G1 X109.079 Y74.081 E.01835
G1 X109.634 Y74.302 E.01835
G1 X110.128 Y74.637 E.01835
G1 X110.538 Y75.071 E.01835
G1 X110.846 Y75.582 E.01835
G1 X111.037 Y76.148 E.01835
G1 X111.102 Y76.742 E.01835
G1 X111.037 Y77.335 E.01835
G1 X110.846 Y77.901 E.01835
G1 X110.538 Y78.413 E.01835
G1 X110.406 Y78.553 E.00592
G1 X110.128 Y78.846 E.01243
G1 X109.634 Y79.181 E.01835
G1 X109.079 Y79.402 E.01835
G1 X108.49 Y79.499 E.01835
G1 X107.894 Y79.467 E.01835
G1 X107.318 Y79.307 E.01835
G1 X106.791 Y79.027 E.01835
G1 X106.336 Y78.641 E.01835
G1 X105.974 Y78.165 E.01835
G1 X105.724 Y77.623 E.01835
G1 X105.595 Y77.04 E.01835
G1 X105.595 Y76.443 E.01835
G1 X105.724 Y75.86 E.01835
G1 X105.974 Y75.318 E.01835
G1 X106.336 Y74.843 E.01835
G1 X106.791 Y74.456 E.01835
G1 X107.318 Y74.177 E.01835
G1 X107.894 Y74.017 E.01835
G1 X108.031 Y74.009 E.00423
M204 S10000
; WIPE_START
G1 F24000
G1 X108.49 Y73.985 E-.1746
G1 X109.079 Y74.081 E-.22689
G1 X109.634 Y74.302 E-.22689
G1 X109.92 Y74.497 E-.13162
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I-1.211 J.122 P1  F30000
G1 X110.349 Y78.748 Z5
G1 Z4.6
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X110.348 Y78.749 E.00005
G1 X109.918 Y79.102 E.0171
G1 X109.427 Y79.365 E.0171
G1 X108.894 Y79.526 E.0171
G1 X108.34 Y79.581 E.0171
G1 X107.786 Y79.526 E.0171
G1 X107.254 Y79.365 E.0171
G1 X106.763 Y79.102 E.0171
G1 X106.333 Y78.749 E.0171
G1 X105.98 Y78.319 E.0171
G1 X105.717 Y77.828 E.0171
G1 X105.556 Y77.296 E.0171
G1 X105.501 Y76.742 E.0171
G1 X105.556 Y76.188 E.0171
G1 X105.717 Y75.655 E.0171
G1 X105.98 Y75.164 E.0171
G1 X106.333 Y74.734 E.0171
G1 X106.763 Y74.381 E.0171
G1 X107.254 Y74.119 E.0171
G1 X107.786 Y73.957 E.0171
G1 X108.34 Y73.903 E.0171
G1 X108.503 Y73.919 E.00502
G1 X108.894 Y73.957 E.01208
G1 X109.427 Y74.119 E.0171
G1 X109.918 Y74.381 E.0171
G1 X110.348 Y74.734 E.0171
G1 X110.701 Y75.164 E.0171
G1 X110.963 Y75.655 E.0171
G1 X111.125 Y76.188 E.0171
G1 X111.179 Y76.742 E.0171
G1 X111.125 Y77.296 E.0171
G1 X110.963 Y77.828 E.0171
G1 X110.701 Y78.319 E.0171
G1 X110.387 Y78.702 E.01521
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 4.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X110.348 Y78.749 E-.02336
G1 X109.918 Y79.102 E-.21149
G1 X109.427 Y79.365 E-.21149
G1 X108.894 Y79.526 E-.21148
G1 X108.627 Y79.553 E-.10219
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 24/32
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
G3 Z5 I-.345 J1.167 P1  F30000
G1 X129.343 Y85.668 Z5
G1 Z4.8
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X129.371 Y85.666 E.00088
G1 X129.495 Y85.66 E.0038
G1 X130.084 Y85.756 E.01835
G1 X130.639 Y85.977 E.01835
G1 X131.133 Y86.312 E.01835
G1 X131.543 Y86.746 E.01835
G1 X131.851 Y87.257 E.01835
G1 X132.042 Y87.823 E.01835
G1 X132.106 Y88.417 E.01835
G1 X132.042 Y89.01 E.01835
G1 X131.851 Y89.576 E.01835
G1 X131.543 Y90.088 E.01835
G1 X131.133 Y90.521 E.01835
G1 X130.639 Y90.856 E.01835
G1 X130.084 Y91.077 E.01835
G1 X129.495 Y91.174 E.01835
G1 X128.898 Y91.142 E.01835
G1 X128.323 Y90.982 E.01835
G1 X127.796 Y90.702 E.01835
G1 X127.341 Y90.316 E.01835
G1 X126.979 Y89.84 E.01835
G1 X126.728 Y89.298 E.01835
G1 X126.6 Y88.715 E.01835
G1 X126.6 Y88.118 E.01835
G1 X126.728 Y87.535 E.01835
G1 X126.979 Y86.993 E.01835
G1 X127.341 Y86.518 E.01835
G1 X127.796 Y86.131 E.01835
G1 X128.323 Y85.852 E.01835
G1 X128.898 Y85.692 E.01835
G1 X129.283 Y85.671 E.01183
M204 S10000
; WIPE_START
G1 F24000
G1 X129.371 Y85.666 E-.03369
G1 X129.495 Y85.66 E-.04694
G1 X130.084 Y85.756 E-.22689
G1 X130.639 Y85.977 E-.22689
G1 X131.13 Y86.31 E-.22558
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I-1.215 J.069 P1  F30000
G1 X131.363 Y90.412 Z5.2
G1 Z4.8
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X131.353 Y90.424 E.00049
G1 X130.922 Y90.777 E.0171
G1 X130.432 Y91.04 E.0171
G1 X129.899 Y91.201 E.0171
G1 X129.345 Y91.256 E.0171
M73 P85 R1
G1 X128.791 Y91.201 E.0171
G1 X128.259 Y91.04 E.0171
G1 X127.768 Y90.777 E.0171
G1 X127.338 Y90.424 E.0171
G1 X126.985 Y89.994 E.0171
G1 X126.722 Y89.503 E.0171
G1 X126.561 Y88.971 E.0171
G1 X126.506 Y88.417 E.0171
G1 X126.561 Y87.863 E.0171
G1 X126.722 Y87.33 E.0171
G1 X126.985 Y86.839 E.0171
G1 X127.338 Y86.409 E.0171
G1 X127.768 Y86.056 E.0171
G1 X128.259 Y85.794 E.0171
G1 X128.791 Y85.632 E.0171
G1 X129.345 Y85.578 E.0171
G1 X129.811 Y85.624 E.01438
G1 X129.899 Y85.632 E.00272
G1 X130.432 Y85.794 E.0171
G1 X130.922 Y86.056 E.0171
G1 X131.353 Y86.409 E.0171
G1 X131.706 Y86.839 E.0171
G1 X131.968 Y87.33 E.0171
G1 X132.13 Y87.863 E.0171
G1 X132.184 Y88.417 E.0171
G1 X132.13 Y88.971 E.0171
G1 X131.968 Y89.503 E.0171
G1 X131.706 Y89.994 E.0171
G1 X131.401 Y90.365 E.01476
M204 S10000
; WIPE_START
G1 F24000
G1 X131.353 Y90.424 E-.02889
G1 X130.922 Y90.777 E-.21148
G1 X130.432 Y91.04 E-.21148
G1 X129.899 Y91.201 E-.21149
G1 X129.646 Y91.226 E-.09665
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I-1.216 J-.04 P1  F30000
G1 X129.099 Y107.647 Z5.2
G1 Z4.8
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X129.128 Y107.646 E.00088
G1 X129.251 Y107.639 E.0038
G1 X129.841 Y107.736 E.01835
G1 X130.395 Y107.957 E.01835
G1 X130.889 Y108.292 E.01835
G1 X131.3 Y108.725 E.01835
G1 X131.608 Y109.237 E.01835
G1 X131.798 Y109.803 E.01835
G1 X131.863 Y110.396 E.01835
G1 X131.798 Y110.99 E.01835
G1 X131.608 Y111.556 E.01835
G1 X131.3 Y112.067 E.01835
G1 X130.889 Y112.501 E.01835
G1 X130.395 Y112.836 E.01835
G1 X129.841 Y113.057 E.01835
G1 X129.251 Y113.154 E.01835
G1 X128.655 Y113.121 E.01835
G1 X128.08 Y112.961 E.01835
G1 X127.552 Y112.682 E.01835
G1 X127.097 Y112.295 E.01835
G1 X126.736 Y111.82 E.01835
G1 X126.485 Y111.278 E.01835
G1 X126.357 Y110.695 E.01835
G1 X126.357 Y110.098 E.01835
G1 X126.485 Y109.515 E.01835
G1 X126.736 Y108.973 E.01835
G1 X127.097 Y108.497 E.01835
G1 X127.552 Y108.111 E.01835
G1 X128.08 Y107.831 E.01835
G1 X128.655 Y107.672 E.01835
G1 X129.039 Y107.651 E.01183
M204 S10000
; WIPE_START
G1 F24000
G1 X129.128 Y107.646 E-.03369
G1 X129.251 Y107.639 E-.04694
G1 X129.841 Y107.736 E-.22689
G1 X130.395 Y107.957 E-.22689
G1 X130.887 Y108.29 E-.22558
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I-1.215 J.069 P1  F30000
G1 X131.119 Y112.391 Z5.2
G1 Z4.8
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X131.109 Y112.404 E.00049
G1 X130.679 Y112.757 E.0171
G1 X130.188 Y113.019 E.0171
G1 X129.656 Y113.181 E.0171
G1 X129.102 Y113.235 E.0171
G1 X128.548 Y113.181 E.0171
G1 X128.015 Y113.019 E.0171
G1 X127.525 Y112.757 E.0171
G1 X127.094 Y112.404 E.0171
G1 X126.741 Y111.974 E.0171
G1 X126.479 Y111.483 E.0171
G1 X126.317 Y110.95 E.0171
G1 X126.263 Y110.396 E.0171
G1 X126.317 Y109.843 E.0171
G1 X126.479 Y109.31 E.0171
G1 X126.741 Y108.819 E.0171
G1 X127.094 Y108.389 E.0171
G1 X127.525 Y108.036 E.0171
G1 X128.015 Y107.773 E.0171
G1 X128.548 Y107.612 E.0171
G1 X129.102 Y107.557 E.0171
G1 X129.568 Y107.603 E.01438
G1 X129.656 Y107.612 E.00272
G1 X130.188 Y107.773 E.0171
G1 X130.679 Y108.036 E.0171
G1 X131.109 Y108.389 E.0171
G1 X131.462 Y108.819 E.0171
G1 X131.725 Y109.31 E.0171
G1 X131.886 Y109.843 E.0171
G1 X131.941 Y110.396 E.0171
G1 X131.886 Y110.95 E.0171
G1 X131.725 Y111.483 E.0171
G1 X131.462 Y111.974 E.0171
G1 X131.158 Y112.345 E.01476
M204 S10000
; WIPE_START
G1 F24000
G1 X131.109 Y112.404 E-.02889
G1 X130.679 Y112.757 E-.21148
G1 X130.188 Y113.019 E-.21148
G1 X129.656 Y113.181 E-.21149
G1 X129.403 Y113.206 E-.09665
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I-1.215 J.06 P1  F30000
G1 X129.998 Y125.251 Z5.2
G1 Z4.8
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X130.026 Y125.249 E.00088
G1 X130.149 Y125.243 E.0038
G1 X130.739 Y125.339 E.01835
G1 X131.293 Y125.56 E.01835
G1 X131.788 Y125.895 E.01835
G1 X132.198 Y126.329 E.01835
G1 X132.506 Y126.841 E.01835
G1 X132.697 Y127.406 E.01835
G1 X132.761 Y128 E.01835
G1 X132.697 Y128.594 E.01835
G1 X132.506 Y129.159 E.01835
G1 X132.198 Y129.671 E.01835
G1 X131.788 Y130.105 E.01835
G1 X131.293 Y130.44 E.01835
G1 X130.739 Y130.661 E.01835
G1 X130.149 Y130.757 E.01835
G1 X129.553 Y130.725 E.01835
G1 X128.978 Y130.565 E.01835
G1 X128.45 Y130.285 E.01835
G1 X127.995 Y129.899 E.01835
G1 X127.634 Y129.424 E.01835
G1 X127.383 Y128.882 E.01835
G1 X127.255 Y128.299 E.01835
G1 X127.255 Y127.701 E.01835
G1 X127.383 Y127.118 E.01835
G1 X127.634 Y126.576 E.01835
G1 X127.995 Y126.101 E.01835
G1 X128.45 Y125.715 E.01835
G1 X128.978 Y125.435 E.01835
G1 X129.553 Y125.275 E.01835
G1 X129.938 Y125.254 E.01183
M204 S10000
; WIPE_START
G1 F24000
G1 X130.026 Y125.249 E-.03369
G1 X130.149 Y125.243 E-.04694
G1 X130.739 Y125.339 E-.22689
G1 X131.293 Y125.56 E-.22689
G1 X131.785 Y125.894 E-.22558
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I-1.215 J.069 P1  F30000
G1 X132.018 Y129.995 Z5.2
G1 Z4.8
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X132.007 Y130.007 E.00049
G1 X131.577 Y130.361 E.0171
G1 X131.086 Y130.623 E.0171
G1 X130.554 Y130.784 E.0171
G1 X130 Y130.839 E.0171
G1 X129.446 Y130.784 E.0171
G1 X128.914 Y130.623 E.0171
G1 X128.423 Y130.361 E.0171
G1 X127.993 Y130.007 E.0171
G1 X127.639 Y129.577 E.0171
G1 X127.377 Y129.086 E.0171
G1 X127.216 Y128.554 E.0171
G1 X127.161 Y128 E.0171
G1 X127.216 Y127.446 E.0171
G1 X127.377 Y126.914 E.0171
G1 X127.639 Y126.423 E.0171
G1 X127.993 Y125.993 E.0171
G1 X128.423 Y125.639 E.0171
G1 X128.914 Y125.377 E.0171
G1 X129.446 Y125.216 E.0171
G1 X130 Y125.161 E.0171
G1 X130.466 Y125.207 E.01438
G1 X130.554 Y125.216 E.00272
G1 X131.086 Y125.377 E.0171
G1 X131.577 Y125.639 E.0171
G1 X132.007 Y125.993 E.0171
G1 X132.361 Y126.423 E.0171
G1 X132.623 Y126.914 E.0171
G1 X132.784 Y127.446 E.0171
G1 X132.839 Y128 E.0171
G1 X132.784 Y128.554 E.0171
G1 X132.623 Y129.086 E.0171
G1 X132.361 Y129.577 E.0171
G1 X132.056 Y129.949 E.01476
M204 S10000
; WIPE_START
G1 F24000
G1 X132.007 Y130.007 E-.02889
G1 X131.577 Y130.361 E-.21148
G1 X131.086 Y130.623 E-.21148
G1 X130.554 Y130.784 E-.21149
G1 X130.301 Y130.809 E-.09665
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I-.321 J-1.174 P1  F30000
G1 X109.109 Y136.604 Z5.2
G1 Z4.8
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X109.525 Y136.581 E.01281
G1 X110.114 Y136.678 E.01835
G1 X110.669 Y136.899 E.01835
G1 X111.163 Y137.234 E.01835
G1 X111.574 Y137.667 E.01835
G1 X111.881 Y138.179 E.01835
G1 X112.072 Y138.745 E.01835
G1 X112.137 Y139.339 E.01835
G1 X112.072 Y139.932 E.01835
G1 X111.881 Y140.498 E.01835
G1 X111.574 Y141.01 E.01835
G1 X111.453 Y141.137 E.00539
G1 X111.163 Y141.443 E.01295
G1 X110.669 Y141.778 E.01835
G1 X110.114 Y141.999 E.01835
G1 X109.525 Y142.096 E.01835
G1 X108.929 Y142.063 E.01835
G1 X108.353 Y141.904 E.01835
G1 X107.826 Y141.624 E.01835
G1 X107.371 Y141.237 E.01835
G1 X107.009 Y140.762 E.01835
G1 X106.759 Y140.22 E.01835
G1 X106.63 Y139.637 E.01835
G1 X106.63 Y139.04 E.01835
G1 X106.759 Y138.457 E.01835
G1 X107.009 Y137.915 E.01835
G1 X107.371 Y137.44 E.01835
G1 X107.826 Y137.053 E.01835
G1 X108.353 Y136.773 E.01835
G1 X108.929 Y136.614 E.01835
G1 X109.049 Y136.607 E.00369
M204 S10000
; WIPE_START
G1 F24000
G1 X109.525 Y136.581 E-.18124
G1 X110.114 Y136.678 E-.22689
G1 X110.669 Y136.899 E-.22689
G1 X110.941 Y137.083 E-.12498
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I-1.21 J.126 P1  F30000
G1 X111.384 Y141.345 Z5.2
G1 Z4.8
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X111.383 Y141.346 E.00005
G1 X110.953 Y141.699 E.0171
G1 X110.462 Y141.961 E.0171
G1 X109.929 Y142.123 E.0171
G1 X109.375 Y142.177 E.0171
G1 X108.822 Y142.123 E.0171
G1 X108.289 Y141.961 E.0171
G1 X107.798 Y141.699 E.0171
G1 X107.368 Y141.346 E.0171
G1 X107.015 Y140.916 E.0171
G1 X106.752 Y140.425 E.0171
G1 X106.591 Y139.892 E.0171
G1 X106.536 Y139.339 E.0171
G1 X106.591 Y138.785 E.0171
G1 X106.752 Y138.252 E.0171
G1 X107.015 Y137.761 E.0171
G1 X107.368 Y137.331 E.0171
G1 X107.798 Y136.978 E.0171
G1 X108.289 Y136.716 E.0171
G1 X108.822 Y136.554 E.0171
G1 X109.375 Y136.5 E.0171
G1 X109.52 Y136.514 E.00445
G1 X109.929 Y136.554 E.01265
G1 X110.462 Y136.716 E.0171
G1 X110.953 Y136.978 E.0171
G1 X111.383 Y137.331 E.0171
G1 X111.736 Y137.761 E.0171
G1 X111.998 Y138.252 E.0171
G1 X112.16 Y138.785 E.0171
G1 X112.214 Y139.339 E.0171
G1 X112.16 Y139.892 E.0171
G1 X111.998 Y140.425 E.0171
G1 X111.736 Y140.916 E.0171
G1 X111.422 Y141.298 E.0152
M204 S10000
; WIPE_START
G1 F24000
G1 X111.383 Y141.346 E-.02348
G1 X110.953 Y141.699 E-.21149
G1 X110.462 Y141.961 E-.21148
G1 X109.929 Y142.123 E-.21149
G1 X109.662 Y142.149 E-.10206
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I1.217 J-.024 P1  F30000
G1 X109.15 Y116.599 Z5.2
G1 Z4.8
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X109.566 Y116.577 E.01281
G1 X110.155 Y116.673 E.01835
G1 X110.71 Y116.894 E.01835
G1 X111.204 Y117.229 E.01835
G1 X111.615 Y117.663 E.01835
G1 X111.923 Y118.174 E.01835
G1 X112.113 Y118.74 E.01835
G1 X112.178 Y119.334 E.01835
G1 X112.113 Y119.927 E.01835
G1 X111.923 Y120.493 E.01835
G1 X111.615 Y121.005 E.01835
G1 X111.494 Y121.132 E.00539
G1 X111.204 Y121.438 E.01295
G1 X110.71 Y121.773 E.01835
G1 X110.155 Y121.994 E.01835
G1 X109.566 Y122.091 E.01835
G1 X108.97 Y122.059 E.01835
G1 X108.394 Y121.899 E.01835
G1 X107.867 Y121.619 E.01835
G1 X107.412 Y121.233 E.01835
G1 X107.051 Y120.757 E.01835
G1 X106.8 Y120.215 E.01835
G1 X106.671 Y119.632 E.01835
G1 X106.671 Y119.035 E.01835
G1 X106.8 Y118.452 E.01835
G1 X107.051 Y117.91 E.01835
G1 X107.412 Y117.435 E.01835
G1 X107.867 Y117.048 E.01835
G1 X108.394 Y116.769 E.01835
G1 X108.97 Y116.609 E.01835
G1 X109.09 Y116.602 E.00369
M204 S10000
; WIPE_START
G1 F24000
G1 X109.566 Y116.577 E-.18124
G1 X110.155 Y116.673 E-.22689
G1 X110.71 Y116.894 E-.22689
G1 X110.982 Y117.079 E-.12498
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I-1.21 J.126 P1  F30000
G1 X111.425 Y121.34 Z5.2
G1 Z4.8
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X111.424 Y121.341 E.00005
G1 X110.994 Y121.694 E.0171
G1 X110.503 Y121.957 E.0171
G1 X109.97 Y122.118 E.0171
G1 X109.417 Y122.173 E.0171
G1 X108.863 Y122.118 E.0171
G1 X108.33 Y121.957 E.0171
G1 X107.839 Y121.694 E.0171
G1 X107.409 Y121.341 E.0171
G1 X107.056 Y120.911 E.0171
G1 X106.794 Y120.42 E.0171
G1 X106.632 Y119.888 E.0171
G1 X106.578 Y119.334 E.0171
G1 X106.632 Y118.78 E.0171
G1 X106.794 Y118.247 E.0171
G1 X107.056 Y117.757 E.0171
G1 X107.409 Y117.326 E.0171
G1 X107.839 Y116.973 E.0171
G1 X108.33 Y116.711 E.0171
G1 X108.863 Y116.549 E.0171
G1 X109.417 Y116.495 E.0171
G1 X109.561 Y116.509 E.00445
G1 X109.97 Y116.549 E.01265
G1 X110.503 Y116.711 E.0171
G1 X110.994 Y116.973 E.0171
G1 X111.424 Y117.326 E.0171
G1 X111.777 Y117.757 E.0171
G1 X112.039 Y118.247 E.0171
G1 X112.201 Y118.78 E.0171
G1 X112.256 Y119.334 E.0171
G1 X112.201 Y119.888 E.0171
G1 X112.039 Y120.42 E.0171
G1 X111.777 Y120.911 E.0171
G1 X111.463 Y121.294 E.0152
M204 S10000
; WIPE_START
G1 F24000
G1 X111.424 Y121.341 E-.02348
G1 X110.994 Y121.694 E-.21149
G1 X110.503 Y121.957 E-.21148
G1 X109.97 Y122.118 E-.21149
G1 X109.703 Y122.145 E-.10206
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I1.216 J-.041 P1  F30000
G1 X108.856 Y96.823 Z5.2
G1 Z4.8
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X109.272 Y96.8 E.01281
G1 X109.861 Y96.897 E.01835
G1 X110.416 Y97.118 E.01835
G1 X110.91 Y97.453 E.01835
G1 X111.321 Y97.886 E.01835
G1 X111.628 Y98.398 E.01835
G1 X111.819 Y98.964 E.01835
G1 X111.884 Y99.557 E.01835
G1 X111.819 Y100.151 E.01835
G1 X111.628 Y100.717 E.01835
G1 X111.321 Y101.228 E.01835
G1 X111.2 Y101.356 E.00539
G1 X110.91 Y101.662 E.01295
G1 X110.416 Y101.997 E.01835
G1 X109.861 Y102.218 E.01835
G1 X109.272 Y102.315 E.01835
G1 X108.676 Y102.282 E.01835
G1 X108.1 Y102.122 E.01835
G1 X107.573 Y101.843 E.01835
G1 X107.118 Y101.456 E.01835
G1 X106.756 Y100.981 E.01835
G1 X106.506 Y100.439 E.01835
G1 X106.377 Y99.856 E.01835
G1 X106.377 Y99.259 E.01835
G1 X106.506 Y98.676 E.01835
G1 X106.756 Y98.134 E.01835
G1 X107.118 Y97.658 E.01835
G1 X107.573 Y97.272 E.01835
G1 X108.1 Y96.992 E.01835
G1 X108.676 Y96.832 E.01835
G1 X108.796 Y96.826 E.00369
M204 S10000
; WIPE_START
G1 F24000
G1 X109.272 Y96.8 E-.18124
M73 P86 R1
G1 X109.861 Y96.897 E-.22689
G1 X110.416 Y97.118 E-.22689
G1 X110.688 Y97.302 E-.12498
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I-1.21 J.126 P1  F30000
G1 X111.131 Y101.563 Z5.2
G1 Z4.8
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X111.13 Y101.565 E.00005
G1 X110.7 Y101.918 E.0171
G1 X110.209 Y102.18 E.0171
G1 X109.676 Y102.342 E.0171
G1 X109.122 Y102.396 E.0171
G1 X108.569 Y102.342 E.0171
G1 X108.036 Y102.18 E.0171
G1 X107.545 Y101.918 E.0171
G1 X107.115 Y101.565 E.0171
G1 X106.762 Y101.135 E.0171
G1 X106.5 Y100.644 E.0171
G1 X106.338 Y100.111 E.0171
G1 X106.283 Y99.557 E.0171
G1 X106.338 Y99.003 E.0171
G1 X106.5 Y98.471 E.0171
G1 X106.762 Y97.98 E.0171
G1 X107.115 Y97.55 E.0171
G1 X107.545 Y97.197 E.0171
G1 X108.036 Y96.934 E.0171
G1 X108.569 Y96.773 E.0171
G1 X109.122 Y96.718 E.0171
G1 X109.267 Y96.733 E.00445
G1 X109.676 Y96.773 E.01265
G1 X110.209 Y96.934 E.0171
G1 X110.7 Y97.197 E.0171
G1 X111.13 Y97.55 E.0171
G1 X111.483 Y97.98 E.0171
G1 X111.745 Y98.471 E.0171
G1 X111.907 Y99.003 E.0171
G1 X111.961 Y99.557 E.0171
G1 X111.907 Y100.111 E.0171
G1 X111.745 Y100.644 E.0171
G1 X111.483 Y101.135 E.0171
G1 X111.169 Y101.517 E.0152
M204 S10000
; WIPE_START
G1 F24000
G1 X111.13 Y101.565 E-.02348
G1 X110.7 Y101.918 E-.21149
G1 X110.209 Y102.18 E-.21148
G1 X109.676 Y102.342 E-.21149
G1 X109.409 Y102.368 E-.10206
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I1.216 J-.057 P1  F30000
G1 X108.073 Y74.007 Z5.2
G1 Z4.8
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X108.49 Y73.985 E.01281
G1 X109.079 Y74.081 E.01835
G1 X109.634 Y74.302 E.01835
G1 X110.128 Y74.637 E.01835
G1 X110.538 Y75.071 E.01835
G1 X110.846 Y75.582 E.01835
G1 X111.037 Y76.148 E.01835
G1 X111.102 Y76.742 E.01835
G1 X111.037 Y77.335 E.01835
G1 X110.846 Y77.901 E.01835
G1 X110.538 Y78.413 E.01835
G1 X110.418 Y78.54 E.00539
G1 X110.128 Y78.846 E.01295
G1 X109.634 Y79.181 E.01835
G1 X109.079 Y79.402 E.01835
G1 X108.49 Y79.499 E.01835
G1 X107.894 Y79.467 E.01835
G1 X107.318 Y79.307 E.01835
G1 X106.791 Y79.027 E.01835
G1 X106.336 Y78.641 E.01835
G1 X105.974 Y78.165 E.01835
G1 X105.724 Y77.623 E.01835
G1 X105.595 Y77.04 E.01835
G1 X105.595 Y76.443 E.01835
G1 X105.724 Y75.86 E.01835
G1 X105.974 Y75.318 E.01835
G1 X106.336 Y74.843 E.01835
G1 X106.791 Y74.456 E.01835
G1 X107.318 Y74.177 E.01835
G1 X107.894 Y74.017 E.01835
G1 X108.014 Y74.01 E.00369
M204 S10000
; WIPE_START
G1 F24000
G1 X108.49 Y73.985 E-.18124
G1 X109.079 Y74.081 E-.22689
G1 X109.634 Y74.302 E-.22689
G1 X109.906 Y74.487 E-.12498
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I-1.21 J.126 P1  F30000
G1 X110.349 Y78.748 Z5.2
G1 Z4.8
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X110.348 Y78.749 E.00005
G1 X109.918 Y79.102 E.0171
G1 X109.427 Y79.365 E.0171
G1 X108.894 Y79.526 E.0171
G1 X108.34 Y79.581 E.0171
G1 X107.786 Y79.526 E.0171
G1 X107.254 Y79.365 E.0171
G1 X106.763 Y79.102 E.0171
G1 X106.333 Y78.749 E.0171
G1 X105.98 Y78.319 E.0171
G1 X105.717 Y77.828 E.0171
G1 X105.556 Y77.296 E.0171
G1 X105.501 Y76.742 E.0171
G1 X105.556 Y76.188 E.0171
G1 X105.717 Y75.655 E.0171
G1 X105.98 Y75.164 E.0171
G1 X106.333 Y74.734 E.0171
G1 X106.763 Y74.381 E.0171
G1 X107.254 Y74.119 E.0171
G1 X107.786 Y73.957 E.0171
G1 X108.34 Y73.903 E.0171
G1 X108.484 Y73.917 E.00445
G1 X108.894 Y73.957 E.01265
G1 X109.427 Y74.119 E.0171
G1 X109.918 Y74.381 E.0171
G1 X110.348 Y74.734 E.0171
G1 X110.701 Y75.164 E.0171
G1 X110.963 Y75.655 E.0171
G1 X111.125 Y76.188 E.0171
G1 X111.179 Y76.742 E.0171
G1 X111.125 Y77.296 E.0171
G1 X110.963 Y77.828 E.0171
G1 X110.701 Y78.319 E.0171
G1 X110.387 Y78.701 E.0152
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 5
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X110.348 Y78.749 E-.02348
G1 X109.918 Y79.102 E-.21149
G1 X109.427 Y79.365 E-.21148
G1 X108.894 Y79.526 E-.21149
G1 X108.627 Y79.553 E-.10206
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 25/32
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
G3 Z5.2 I-.345 J1.167 P1  F30000
G1 X129.344 Y85.668 Z5.2
G1 Z5
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X129.39 Y85.665 E.00142
G1 X129.495 Y85.66 E.00321
G1 X130.084 Y85.756 E.01835
G1 X130.639 Y85.977 E.01835
G1 X131.133 Y86.312 E.01835
G1 X131.543 Y86.746 E.01835
G1 X131.851 Y87.257 E.01835
G1 X132.042 Y87.823 E.01835
G1 X132.106 Y88.417 E.01835
G1 X132.042 Y89.01 E.01835
G1 X131.851 Y89.576 E.01835
G1 X131.543 Y90.088 E.01835
G1 X131.472 Y90.163 E.00321
G1 X131.133 Y90.521 E.01514
G1 X130.639 Y90.856 E.01835
G1 X130.084 Y91.077 E.01835
G1 X129.495 Y91.174 E.01835
G1 X128.898 Y91.142 E.01835
G1 X128.323 Y90.982 E.01835
G1 X127.796 Y90.702 E.01835
G1 X127.42 Y90.383 E.01514
G1 X127.341 Y90.316 E.00321
G1 X126.979 Y89.84 E.01835
G1 X126.728 Y89.298 E.01835
G1 X126.6 Y88.715 E.01835
G1 X126.6 Y88.118 E.01835
G1 X126.728 Y87.535 E.01835
G1 X126.979 Y86.993 E.01835
G1 X127.341 Y86.518 E.01835
G1 X127.796 Y86.131 E.01835
G1 X128.323 Y85.852 E.01835
G1 X128.898 Y85.692 E.01835
G1 X129.285 Y85.671 E.01188
M204 S10000
; WIPE_START
G1 F24000
G1 X129.39 Y85.665 E-.04032
G1 X129.495 Y85.66 E-.03965
G1 X130.084 Y85.756 E-.22689
G1 X130.639 Y85.977 E-.22689
G1 X131.131 Y86.311 E-.22625
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I-1.215 J.07 P1  F30000
G1 X131.366 Y90.408 Z5.4
G1 Z5
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X131.353 Y90.424 E.00064
G1 X130.922 Y90.777 E.0171
G1 X130.432 Y91.04 E.0171
G1 X129.899 Y91.201 E.0171
G1 X129.345 Y91.256 E.0171
G1 X128.791 Y91.201 E.0171
G1 X128.259 Y91.04 E.0171
G1 X127.768 Y90.777 E.0171
G1 X127.338 Y90.424 E.0171
G1 X126.985 Y89.994 E.0171
G1 X126.722 Y89.503 E.0171
G1 X126.561 Y88.971 E.0171
G1 X126.506 Y88.417 E.0171
G1 X126.561 Y87.863 E.0171
G1 X126.722 Y87.33 E.0171
G1 X126.985 Y86.839 E.0171
G1 X127.338 Y86.409 E.0171
G1 X127.768 Y86.056 E.0171
G1 X128.259 Y85.794 E.0171
G1 X128.791 Y85.632 E.0171
G1 X129.345 Y85.578 E.0171
G1 X129.832 Y85.626 E.01502
G1 X130.432 Y85.794 E.01915
G1 X130.922 Y86.056 E.0171
G1 X131.353 Y86.409 E.0171
G1 X131.706 Y86.839 E.0171
G1 X131.968 Y87.33 E.0171
G1 X132.13 Y87.863 E.0171
G1 X132.184 Y88.417 E.0171
G1 X132.13 Y88.971 E.0171
G1 X131.968 Y89.503 E.0171
G1 X131.706 Y89.994 E.0171
G1 X131.404 Y90.362 E.01461
M204 S10000
; WIPE_START
G1 F24000
G1 X131.353 Y90.424 E-.03075
G1 X130.922 Y90.777 E-.21148
G1 X130.432 Y91.04 E-.21148
G1 X129.899 Y91.201 E-.21149
G1 X129.651 Y91.226 E-.0948
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I-1.216 J-.041 P1  F30000
G1 X129.101 Y107.647 Z5.4
G1 Z5
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X129.147 Y107.645 E.00142
G1 X129.251 Y107.639 E.00321
G1 X129.841 Y107.736 E.01835
G1 X130.395 Y107.957 E.01835
G1 X130.889 Y108.292 E.01835
G1 X131.3 Y108.725 E.01835
G1 X131.608 Y109.237 E.01835
G1 X131.798 Y109.803 E.01835
G1 X131.863 Y110.396 E.01835
G1 X131.798 Y110.99 E.01835
G1 X131.608 Y111.556 E.01835
G1 X131.3 Y112.067 E.01835
G1 X131.228 Y112.143 E.00321
G1 X130.889 Y112.501 E.01514
G1 X130.395 Y112.836 E.01835
G1 X129.841 Y113.057 E.01835
G1 X129.251 Y113.154 E.01835
G1 X128.655 Y113.121 E.01835
G1 X128.08 Y112.961 E.01835
G1 X127.552 Y112.682 E.01835
G1 X127.177 Y112.363 E.01514
G1 X127.097 Y112.295 E.00321
G1 X126.736 Y111.82 E.01835
G1 X126.485 Y111.278 E.01835
G1 X126.357 Y110.695 E.01835
G1 X126.357 Y110.098 E.01835
G1 X126.485 Y109.515 E.01835
G1 X126.736 Y108.973 E.01835
G1 X127.097 Y108.497 E.01835
G1 X127.552 Y108.111 E.01835
G1 X128.08 Y107.831 E.01835
G1 X128.655 Y107.672 E.01835
G1 X129.041 Y107.651 E.01188
M204 S10000
; WIPE_START
G1 F24000
G1 X129.147 Y107.645 E-.04032
G1 X129.251 Y107.639 E-.03965
G1 X129.841 Y107.736 E-.22689
G1 X130.395 Y107.957 E-.22689
G1 X130.888 Y108.291 E-.22625
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I-1.215 J.07 P1  F30000
G1 X131.123 Y112.388 Z5.4
G1 Z5
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X131.109 Y112.404 E.00064
G1 X130.679 Y112.757 E.0171
G1 X130.188 Y113.019 E.0171
G1 X129.656 Y113.181 E.0171
G1 X129.102 Y113.235 E.0171
G1 X128.548 Y113.181 E.0171
G1 X128.015 Y113.019 E.0171
G1 X127.525 Y112.757 E.0171
G1 X127.094 Y112.404 E.0171
G1 X126.741 Y111.974 E.0171
G1 X126.479 Y111.483 E.0171
G1 X126.317 Y110.95 E.0171
G1 X126.263 Y110.396 E.0171
G1 X126.317 Y109.843 E.0171
G1 X126.479 Y109.31 E.0171
G1 X126.741 Y108.819 E.0171
G1 X127.094 Y108.389 E.0171
G1 X127.525 Y108.036 E.0171
G1 X128.015 Y107.773 E.0171
G1 X128.548 Y107.612 E.0171
G1 X129.102 Y107.557 E.0171
G1 X129.588 Y107.605 E.01502
G1 X130.188 Y107.773 E.01915
G1 X130.679 Y108.036 E.0171
G1 X131.109 Y108.389 E.0171
G1 X131.462 Y108.819 E.0171
G1 X131.725 Y109.31 E.0171
G1 X131.886 Y109.843 E.0171
G1 X131.941 Y110.396 E.0171
G1 X131.886 Y110.95 E.0171
G1 X131.725 Y111.483 E.0171
G1 X131.462 Y111.974 E.0171
G1 X131.161 Y112.341 E.01461
M204 S10000
; WIPE_START
G1 F24000
G1 X131.109 Y112.404 E-.03075
G1 X130.679 Y112.757 E-.21148
G1 X130.188 Y113.019 E-.21148
G1 X129.656 Y113.181 E-.21149
G1 X129.407 Y113.205 E-.0948
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I-1.215 J.06 P1  F30000
G1 X129.999 Y125.251 Z5.4
G1 Z5
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X130.045 Y125.248 E.00142
G1 X130.149 Y125.243 E.00321
G1 X130.739 Y125.339 E.01835
G1 X131.293 Y125.56 E.01835
G1 X131.788 Y125.895 E.01835
G1 X132.198 Y126.329 E.01835
G1 X132.506 Y126.841 E.01835
G1 X132.697 Y127.406 E.01835
G1 X132.761 Y128 E.01835
G1 X132.697 Y128.594 E.01835
G1 X132.506 Y129.159 E.01835
G1 X132.198 Y129.671 E.01835
G1 X132.126 Y129.747 E.00321
G1 X131.788 Y130.105 E.01514
G1 X131.293 Y130.44 E.01835
G1 X130.739 Y130.661 E.01835
G1 X130.149 Y130.757 E.01835
G1 X129.553 Y130.725 E.01835
G1 X128.978 Y130.565 E.01835
G1 X128.45 Y130.285 E.01835
G1 X128.075 Y129.966 E.01514
G1 X127.995 Y129.899 E.00321
G1 X127.634 Y129.424 E.01835
G1 X127.383 Y128.882 E.01835
G1 X127.255 Y128.299 E.01835
G1 X127.255 Y127.701 E.01835
G1 X127.383 Y127.118 E.01835
G1 X127.634 Y126.576 E.01835
G1 X127.995 Y126.101 E.01835
G1 X128.45 Y125.715 E.01835
G1 X128.978 Y125.435 E.01835
G1 X129.553 Y125.275 E.01835
G1 X129.939 Y125.254 E.01188
M204 S10000
; WIPE_START
G1 F24000
G1 X130.045 Y125.248 E-.04032
G1 X130.149 Y125.243 E-.03965
G1 X130.739 Y125.339 E-.22689
G1 X131.293 Y125.56 E-.22689
G1 X131.786 Y125.895 E-.22625
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I-1.215 J.07 P1  F30000
G1 X132.021 Y129.991 Z5.4
G1 Z5
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X132.007 Y130.007 E.00064
G1 X131.577 Y130.361 E.0171
G1 X131.086 Y130.623 E.0171
G1 X130.554 Y130.784 E.0171
G1 X130 Y130.839 E.0171
G1 X129.446 Y130.784 E.0171
G1 X128.914 Y130.623 E.0171
G1 X128.423 Y130.361 E.0171
G1 X127.993 Y130.007 E.0171
G1 X127.639 Y129.577 E.0171
G1 X127.377 Y129.086 E.0171
G1 X127.216 Y128.554 E.0171
G1 X127.161 Y128 E.0171
G1 X127.216 Y127.446 E.0171
G1 X127.377 Y126.914 E.0171
G1 X127.639 Y126.423 E.0171
G1 X127.993 Y125.993 E.0171
G1 X128.423 Y125.639 E.0171
G1 X128.914 Y125.377 E.0171
G1 X129.446 Y125.216 E.0171
G1 X130 Y125.161 E.0171
G1 X130.486 Y125.209 E.01502
G1 X131.086 Y125.377 E.01915
G1 X131.577 Y125.639 E.0171
G1 X132.007 Y125.993 E.0171
G1 X132.361 Y126.423 E.0171
G1 X132.623 Y126.914 E.0171
G1 X132.784 Y127.446 E.0171
G1 X132.839 Y128 E.0171
G1 X132.784 Y128.554 E.0171
G1 X132.623 Y129.086 E.0171
G1 X132.361 Y129.577 E.0171
G1 X132.059 Y129.945 E.01461
M204 S10000
; WIPE_START
G1 F24000
G1 X132.007 Y130.007 E-.03075
G1 X131.577 Y130.361 E-.21148
G1 X131.086 Y130.623 E-.21148
G1 X130.554 Y130.784 E-.21149
G1 X130.306 Y130.809 E-.0948
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I-.321 J-1.174 P1  F30000
G1 X109.091 Y136.605 Z5.4
G1 Z5
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X109.525 Y136.581 E.01334
G1 X110.114 Y136.678 E.01835
G1 X110.669 Y136.899 E.01835
G1 X111.163 Y137.234 E.01835
G1 X111.574 Y137.667 E.01835
G1 X111.881 Y138.179 E.01835
G1 X112.072 Y138.745 E.01835
G1 X112.137 Y139.339 E.01835
G1 X112.072 Y139.932 E.01835
G1 X111.881 Y140.498 E.01835
G1 X111.574 Y141.01 E.01835
G1 X111.465 Y141.125 E.00487
G1 X111.163 Y141.443 E.01347
G1 X110.669 Y141.778 E.01835
G1 X110.114 Y141.999 E.01835
G1 X109.525 Y142.096 E.01835
G1 X108.929 Y142.063 E.01835
G1 X108.353 Y141.904 E.01835
G1 X107.826 Y141.624 E.01835
G1 X107.371 Y141.237 E.01835
G1 X107.009 Y140.762 E.01835
M73 P87 R1
G1 X106.759 Y140.22 E.01835
G1 X106.63 Y139.637 E.01835
G1 X106.63 Y139.04 E.01835
G1 X106.759 Y138.457 E.01835
G1 X107.009 Y137.915 E.01835
G1 X107.371 Y137.44 E.01835
G1 X107.826 Y137.053 E.01835
G1 X108.353 Y136.773 E.01835
G1 X108.929 Y136.614 E.01835
G1 X109.032 Y136.608 E.00317
M204 S10000
; WIPE_START
G1 F24000
G1 X109.525 Y136.581 E-.18773
G1 X110.114 Y136.678 E-.22689
G1 X110.669 Y136.899 E-.22689
G1 X110.927 Y137.074 E-.11849
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I-1.21 J.13 P1  F30000
G1 X111.384 Y141.344 Z5.4
G1 Z5
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X111.383 Y141.346 E.00006
G1 X110.953 Y141.699 E.0171
G1 X110.462 Y141.961 E.0171
G1 X109.929 Y142.123 E.0171
G1 X109.375 Y142.177 E.0171
G1 X108.822 Y142.123 E.0171
G1 X108.289 Y141.961 E.0171
G1 X107.798 Y141.699 E.0171
G1 X107.368 Y141.346 E.0171
G1 X107.015 Y140.916 E.0171
G1 X106.752 Y140.425 E.0171
G1 X106.591 Y139.892 E.0171
G1 X106.536 Y139.339 E.0171
G1 X106.591 Y138.785 E.0171
G1 X106.752 Y138.252 E.0171
G1 X107.015 Y137.761 E.0171
G1 X107.368 Y137.331 E.0171
G1 X107.798 Y136.978 E.0171
G1 X108.289 Y136.716 E.0171
G1 X108.822 Y136.554 E.0171
G1 X109.375 Y136.5 E.0171
G1 X109.501 Y136.512 E.00389
G1 X109.929 Y136.554 E.01321
G1 X110.462 Y136.716 E.0171
G1 X110.953 Y136.978 E.0171
G1 X111.383 Y137.331 E.0171
G1 X111.736 Y137.761 E.0171
G1 X111.998 Y138.252 E.0171
G1 X112.16 Y138.785 E.0171
G1 X112.214 Y139.339 E.0171
G1 X112.16 Y139.892 E.0171
G1 X111.998 Y140.425 E.0171
G1 X111.736 Y140.916 E.0171
G1 X111.422 Y141.298 E.01519
M204 S10000
; WIPE_START
G1 F24000
G1 X111.383 Y141.346 E-.0236
G1 X110.953 Y141.699 E-.21148
G1 X110.462 Y141.961 E-.21149
G1 X109.929 Y142.123 E-.21148
G1 X109.662 Y142.149 E-.10195
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I1.217 J-.025 P1  F30000
G1 X109.133 Y116.6 Z5.4
G1 Z5
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X109.566 Y116.577 E.01334
G1 X110.155 Y116.673 E.01835
G1 X110.71 Y116.894 E.01835
G1 X111.204 Y117.229 E.01835
G1 X111.615 Y117.663 E.01835
G1 X111.923 Y118.174 E.01835
G1 X112.113 Y118.74 E.01835
G1 X112.178 Y119.334 E.01835
G1 X112.113 Y119.927 E.01835
G1 X111.923 Y120.493 E.01835
G1 X111.615 Y121.005 E.01835
G1 X111.506 Y121.12 E.00487
G1 X111.204 Y121.438 E.01347
G1 X110.71 Y121.773 E.01835
G1 X110.155 Y121.994 E.01835
G1 X109.566 Y122.091 E.01835
G1 X108.97 Y122.059 E.01835
G1 X108.394 Y121.899 E.01835
G1 X107.867 Y121.619 E.01835
G1 X107.412 Y121.233 E.01835
G1 X107.051 Y120.757 E.01835
G1 X106.8 Y120.215 E.01835
G1 X106.671 Y119.632 E.01835
G1 X106.671 Y119.035 E.01835
G1 X106.8 Y118.452 E.01835
G1 X107.051 Y117.91 E.01835
G1 X107.412 Y117.435 E.01835
G1 X107.867 Y117.048 E.01835
G1 X108.394 Y116.769 E.01835
G1 X108.97 Y116.609 E.01835
G1 X109.073 Y116.603 E.00317
M204 S10000
; WIPE_START
G1 F24000
G1 X109.566 Y116.577 E-.18773
G1 X110.155 Y116.673 E-.22689
G1 X110.71 Y116.894 E-.22689
G1 X110.968 Y117.069 E-.11849
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I-1.21 J.13 P1  F30000
G1 X111.425 Y121.34 Z5.4
G1 Z5
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X111.424 Y121.341 E.00006
G1 X110.994 Y121.694 E.0171
G1 X110.503 Y121.957 E.0171
G1 X109.97 Y122.118 E.0171
G1 X109.417 Y122.173 E.0171
G1 X108.863 Y122.118 E.0171
G1 X108.33 Y121.957 E.0171
G1 X107.839 Y121.694 E.0171
G1 X107.409 Y121.341 E.0171
G1 X107.056 Y120.911 E.0171
G1 X106.794 Y120.42 E.0171
G1 X106.632 Y119.888 E.0171
G1 X106.578 Y119.334 E.0171
G1 X106.632 Y118.78 E.0171
G1 X106.794 Y118.247 E.0171
G1 X107.056 Y117.757 E.0171
G1 X107.409 Y117.326 E.0171
G1 X107.839 Y116.973 E.0171
G1 X108.33 Y116.711 E.0171
G1 X108.863 Y116.549 E.0171
G1 X109.417 Y116.495 E.0171
G1 X109.542 Y116.507 E.00389
G1 X109.97 Y116.549 E.01321
G1 X110.503 Y116.711 E.0171
G1 X110.994 Y116.973 E.0171
G1 X111.424 Y117.326 E.0171
G1 X111.777 Y117.757 E.0171
G1 X112.039 Y118.247 E.0171
G1 X112.201 Y118.78 E.0171
G1 X112.256 Y119.334 E.0171
G1 X112.201 Y119.888 E.0171
G1 X112.039 Y120.42 E.0171
G1 X111.777 Y120.911 E.0171
G1 X111.463 Y121.293 E.01519
M204 S10000
; WIPE_START
G1 F24000
G1 X111.424 Y121.341 E-.0236
G1 X110.994 Y121.694 E-.21148
G1 X110.503 Y121.957 E-.21149
G1 X109.97 Y122.118 E-.21148
G1 X109.703 Y122.145 E-.10195
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I1.216 J-.042 P1  F30000
G1 X108.839 Y96.824 Z5.4
G1 Z5
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X109.272 Y96.8 E.01334
G1 X109.861 Y96.897 E.01835
G1 X110.416 Y97.118 E.01835
G1 X110.91 Y97.453 E.01835
G1 X111.321 Y97.886 E.01835
G1 X111.628 Y98.398 E.01835
G1 X111.819 Y98.964 E.01835
G1 X111.884 Y99.557 E.01835
G1 X111.819 Y100.151 E.01835
G1 X111.628 Y100.717 E.01835
G1 X111.321 Y101.228 E.01835
G1 X111.212 Y101.344 E.00487
G1 X110.91 Y101.662 E.01347
G1 X110.416 Y101.997 E.01835
G1 X109.861 Y102.218 E.01835
G1 X109.272 Y102.315 E.01835
G1 X108.676 Y102.282 E.01835
G1 X108.1 Y102.122 E.01835
G1 X107.573 Y101.843 E.01835
G1 X107.118 Y101.456 E.01835
G1 X106.756 Y100.981 E.01835
G1 X106.506 Y100.439 E.01835
G1 X106.377 Y99.856 E.01835
G1 X106.377 Y99.259 E.01835
G1 X106.506 Y98.676 E.01835
G1 X106.756 Y98.134 E.01835
G1 X107.118 Y97.658 E.01835
G1 X107.573 Y97.272 E.01835
G1 X108.1 Y96.992 E.01835
G1 X108.676 Y96.832 E.01835
G1 X108.779 Y96.827 E.00317
M204 S10000
; WIPE_START
G1 F24000
G1 X109.272 Y96.8 E-.18773
G1 X109.861 Y96.897 E-.22689
G1 X110.416 Y97.118 E-.22689
G1 X110.674 Y97.293 E-.11849
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I-1.21 J.13 P1  F30000
G1 X111.131 Y101.563 Z5.4
G1 Z5
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X111.13 Y101.565 E.00006
G1 X110.7 Y101.918 E.0171
G1 X110.209 Y102.18 E.0171
G1 X109.676 Y102.342 E.0171
G1 X109.122 Y102.396 E.0171
G1 X108.569 Y102.342 E.0171
G1 X108.036 Y102.18 E.0171
G1 X107.545 Y101.918 E.0171
G1 X107.115 Y101.565 E.0171
G1 X106.762 Y101.135 E.0171
G1 X106.5 Y100.644 E.0171
G1 X106.338 Y100.111 E.0171
G1 X106.283 Y99.557 E.0171
G1 X106.338 Y99.003 E.0171
G1 X106.5 Y98.471 E.0171
G1 X106.762 Y97.98 E.0171
G1 X107.115 Y97.55 E.0171
G1 X107.545 Y97.197 E.0171
G1 X108.036 Y96.934 E.0171
G1 X108.569 Y96.773 E.0171
G1 X109.122 Y96.718 E.0171
G1 X109.248 Y96.731 E.00389
G1 X109.676 Y96.773 E.01321
G1 X110.209 Y96.934 E.0171
G1 X110.7 Y97.197 E.0171
G1 X111.13 Y97.55 E.0171
G1 X111.483 Y97.98 E.0171
G1 X111.745 Y98.471 E.0171
G1 X111.907 Y99.003 E.0171
G1 X111.961 Y99.557 E.0171
G1 X111.907 Y100.111 E.0171
G1 X111.745 Y100.644 E.0171
G1 X111.483 Y101.135 E.0171
G1 X111.169 Y101.517 E.01519
M204 S10000
; WIPE_START
G1 F24000
G1 X111.13 Y101.565 E-.0236
G1 X110.7 Y101.918 E-.21148
G1 X110.209 Y102.18 E-.21149
G1 X109.676 Y102.342 E-.21148
G1 X109.409 Y102.368 E-.10195
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I1.216 J-.058 P1  F30000
G1 X108.056 Y74.008 Z5.4
G1 Z5
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X108.49 Y73.985 E.01334
G1 X109.079 Y74.081 E.01835
G1 X109.634 Y74.302 E.01835
G1 X110.128 Y74.637 E.01835
G1 X110.538 Y75.071 E.01835
G1 X110.846 Y75.582 E.01835
G1 X111.037 Y76.148 E.01835
G1 X111.102 Y76.742 E.01835
G1 X111.037 Y77.335 E.01835
G1 X110.846 Y77.901 E.01835
G1 X110.538 Y78.413 E.01835
G1 X110.429 Y78.528 E.00487
G1 X110.128 Y78.846 E.01347
G1 X109.634 Y79.181 E.01835
G1 X109.079 Y79.402 E.01835
G1 X108.49 Y79.499 E.01835
G1 X107.894 Y79.467 E.01835
G1 X107.318 Y79.307 E.01835
G1 X106.791 Y79.027 E.01835
G1 X106.336 Y78.641 E.01835
G1 X105.974 Y78.165 E.01835
G1 X105.724 Y77.623 E.01835
G1 X105.595 Y77.04 E.01835
G1 X105.595 Y76.443 E.01835
G1 X105.724 Y75.86 E.01835
G1 X105.974 Y75.318 E.01835
G1 X106.336 Y74.843 E.01835
G1 X106.791 Y74.456 E.01835
G1 X107.318 Y74.177 E.01835
G1 X107.894 Y74.017 E.01835
G1 X107.996 Y74.011 E.00317
M204 S10000
; WIPE_START
G1 F24000
G1 X108.49 Y73.985 E-.18773
G1 X109.079 Y74.081 E-.22689
G1 X109.634 Y74.302 E-.22689
G1 X109.892 Y74.477 E-.11849
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I-1.21 J.13 P1  F30000
G1 X110.349 Y78.748 Z5.4
G1 Z5
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X110.348 Y78.749 E.00006
G1 X109.918 Y79.102 E.0171
G1 X109.427 Y79.365 E.0171
G1 X108.894 Y79.526 E.0171
G1 X108.34 Y79.581 E.0171
G1 X107.786 Y79.526 E.0171
G1 X107.254 Y79.365 E.0171
G1 X106.763 Y79.102 E.0171
G1 X106.333 Y78.749 E.0171
G1 X105.98 Y78.319 E.0171
G1 X105.717 Y77.828 E.0171
G1 X105.556 Y77.296 E.0171
G1 X105.501 Y76.742 E.0171
G1 X105.556 Y76.188 E.0171
G1 X105.717 Y75.655 E.0171
G1 X105.98 Y75.164 E.0171
G1 X106.333 Y74.734 E.0171
G1 X106.763 Y74.381 E.0171
G1 X107.254 Y74.119 E.0171
G1 X107.786 Y73.957 E.0171
G1 X108.34 Y73.903 E.0171
G1 X108.466 Y73.915 E.00389
G1 X108.894 Y73.957 E.01321
G1 X109.427 Y74.119 E.0171
G1 X109.918 Y74.381 E.0171
G1 X110.348 Y74.734 E.0171
G1 X110.701 Y75.164 E.0171
G1 X110.963 Y75.655 E.0171
G1 X111.125 Y76.188 E.0171
G1 X111.179 Y76.742 E.0171
G1 X111.125 Y77.296 E.0171
G1 X110.963 Y77.828 E.0171
G1 X110.701 Y78.319 E.0171
G1 X110.387 Y78.701 E.01519
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 5.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X110.348 Y78.749 E-.0236
G1 X109.918 Y79.102 E-.21148
G1 X109.427 Y79.365 E-.21149
G1 X108.894 Y79.526 E-.21148
G1 X108.627 Y79.552 E-.10195
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 26/32
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
G3 Z5.4 I-.344 J1.167 P1  F30000
G1 X129.346 Y85.668 Z5.4
G1 Z5.2
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X129.41 Y85.664 E.00195
G1 X129.495 Y85.66 E.00262
G1 X130.084 Y85.756 E.01835
G1 X130.639 Y85.977 E.01835
G1 X131.133 Y86.312 E.01835
G1 X131.543 Y86.746 E.01835
G1 X131.851 Y87.257 E.01835
G1 X132.042 Y87.823 E.01835
G1 X132.106 Y88.417 E.01835
G1 X132.042 Y89.01 E.01835
G1 X131.851 Y89.576 E.01835
G1 X131.543 Y90.088 E.01835
G1 X131.133 Y90.521 E.01835
G1 X130.639 Y90.856 E.01835
G1 X130.084 Y91.077 E.01835
G1 X129.495 Y91.174 E.01835
G1 X128.898 Y91.142 E.01835
G1 X128.323 Y90.982 E.01835
G1 X127.796 Y90.702 E.01835
G1 X127.341 Y90.316 E.01835
G1 X126.979 Y89.84 E.01835
G1 X126.728 Y89.298 E.01835
G1 X126.6 Y88.715 E.01835
G1 X126.6 Y88.118 E.01835
G1 X126.728 Y87.535 E.01835
G1 X126.979 Y86.993 E.01835
G1 X127.341 Y86.518 E.01835
G1 X127.796 Y86.131 E.01835
G1 X128.323 Y85.852 E.01835
G1 X128.898 Y85.692 E.01835
G1 X129.286 Y85.671 E.01193
M204 S10000
; WIPE_START
G1 F24000
G1 X129.41 Y85.664 E-.04696
G1 X129.495 Y85.66 E-.03236
G1 X130.084 Y85.756 E-.22689
G1 X130.639 Y85.977 E-.22689
G1 X131.133 Y86.312 E-.22689
G1 X131.133 Y86.312 E0
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I-1.215 J.07 P1  F30000
G1 X131.369 Y90.404 Z5.6
G1 Z5.2
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X131.353 Y90.424 E.00079
G1 X130.922 Y90.777 E.0171
G1 X130.432 Y91.04 E.0171
G1 X129.899 Y91.201 E.0171
G1 X129.345 Y91.256 E.0171
G1 X128.791 Y91.201 E.0171
G1 X128.259 Y91.04 E.0171
G1 X127.768 Y90.777 E.0171
G1 X127.338 Y90.424 E.0171
G1 X126.985 Y89.994 E.0171
G1 X126.722 Y89.503 E.0171
G1 X126.561 Y88.971 E.0171
G1 X126.506 Y88.417 E.0171
G1 X126.561 Y87.863 E.0171
G1 X126.722 Y87.33 E.0171
G1 X126.985 Y86.839 E.0171
G1 X127.338 Y86.409 E.0171
G1 X127.768 Y86.056 E.0171
G1 X128.259 Y85.794 E.0171
G1 X128.791 Y85.632 E.0171
G1 X129.345 Y85.578 E.0171
G1 X129.852 Y85.628 E.01566
G1 X130.432 Y85.794 E.01852
G1 X130.922 Y86.056 E.0171
G1 X131.353 Y86.409 E.0171
G1 X131.706 Y86.839 E.0171
G1 X131.968 Y87.33 E.0171
G1 X132.13 Y87.863 E.0171
G1 X132.184 Y88.417 E.0171
G1 X132.13 Y88.971 E.0171
G1 X131.968 Y89.503 E.0171
G1 X131.706 Y89.994 E.0171
G1 X131.407 Y90.358 E.01447
M204 S10000
; WIPE_START
G1 F24000
G1 X131.353 Y90.424 E-.03253
G1 X130.922 Y90.777 E-.21148
G1 X130.432 Y91.04 E-.21148
G1 X129.899 Y91.201 E-.21149
G1 X129.655 Y91.225 E-.09301
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I-1.216 J-.041 P1  F30000
G1 X129.103 Y107.647 Z5.6
G1 Z5.2
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X129.166 Y107.644 E.00195
G1 X129.251 Y107.639 E.00262
G1 X129.841 Y107.736 E.01835
G1 X130.395 Y107.957 E.01835
G1 X130.889 Y108.292 E.01835
M73 P88 R1
G1 X131.3 Y108.725 E.01835
G1 X131.608 Y109.237 E.01835
G1 X131.798 Y109.803 E.01835
G1 X131.863 Y110.396 E.01835
G1 X131.798 Y110.99 E.01835
G1 X131.608 Y111.556 E.01835
G1 X131.3 Y112.067 E.01835
G1 X130.889 Y112.501 E.01835
G1 X130.395 Y112.836 E.01835
G1 X129.841 Y113.057 E.01835
G1 X129.251 Y113.154 E.01835
G1 X128.655 Y113.121 E.01835
G1 X128.08 Y112.961 E.01835
G1 X127.552 Y112.682 E.01835
G1 X127.097 Y112.295 E.01835
G1 X126.736 Y111.82 E.01835
G1 X126.485 Y111.278 E.01835
G1 X126.357 Y110.695 E.01835
G1 X126.357 Y110.098 E.01835
G1 X126.485 Y109.515 E.01835
G1 X126.736 Y108.973 E.01835
G1 X127.097 Y108.497 E.01835
G1 X127.552 Y108.111 E.01835
G1 X128.08 Y107.831 E.01835
G1 X128.655 Y107.672 E.01835
G1 X129.043 Y107.65 E.01193
M204 S10000
; WIPE_START
G1 F24000
G1 X129.166 Y107.644 E-.04696
G1 X129.251 Y107.639 E-.03236
G1 X129.841 Y107.736 E-.22689
G1 X130.395 Y107.957 E-.22689
G1 X130.889 Y108.292 E-.22689
G1 X130.889 Y108.292 E0
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I-1.215 J.07 P1  F30000
G1 X131.126 Y112.384 Z5.6
G1 Z5.2
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X131.109 Y112.404 E.00079
G1 X130.679 Y112.757 E.0171
G1 X130.188 Y113.019 E.0171
G1 X129.656 Y113.181 E.0171
G1 X129.102 Y113.235 E.0171
G1 X128.548 Y113.181 E.0171
G1 X128.015 Y113.019 E.0171
G1 X127.525 Y112.757 E.0171
G1 X127.094 Y112.404 E.0171
G1 X126.741 Y111.974 E.0171
G1 X126.479 Y111.483 E.0171
G1 X126.317 Y110.95 E.0171
G1 X126.263 Y110.396 E.0171
G1 X126.317 Y109.843 E.0171
G1 X126.479 Y109.31 E.0171
G1 X126.741 Y108.819 E.0171
G1 X127.094 Y108.389 E.0171
G1 X127.525 Y108.036 E.0171
G1 X128.015 Y107.773 E.0171
G1 X128.548 Y107.612 E.0171
G1 X129.102 Y107.557 E.0171
G1 X129.609 Y107.607 E.01566
G1 X130.188 Y107.773 E.01852
G1 X130.679 Y108.036 E.0171
G1 X131.109 Y108.389 E.0171
G1 X131.462 Y108.819 E.0171
G1 X131.725 Y109.31 E.0171
G1 X131.886 Y109.843 E.0171
G1 X131.941 Y110.396 E.0171
G1 X131.886 Y110.95 E.0171
G1 X131.725 Y111.483 E.0171
G1 X131.462 Y111.974 E.0171
G1 X131.164 Y112.338 E.01447
M204 S10000
; WIPE_START
G1 F24000
G1 X131.109 Y112.404 E-.03253
G1 X130.679 Y112.757 E-.21148
G1 X130.188 Y113.019 E-.21148
G1 X129.656 Y113.181 E-.21149
G1 X129.412 Y113.205 E-.09301
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I-1.216 J.059 P1  F30000
G1 X130.001 Y125.251 Z5.6
G1 Z5.2
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X130.064 Y125.247 E.00195
G1 X130.149 Y125.243 E.00262
G1 X130.739 Y125.339 E.01835
G1 X131.293 Y125.56 E.01835
G1 X131.788 Y125.895 E.01835
G1 X132.198 Y126.329 E.01835
G1 X132.506 Y126.841 E.01835
G1 X132.697 Y127.406 E.01835
G1 X132.761 Y128 E.01835
G1 X132.697 Y128.594 E.01835
G1 X132.506 Y129.159 E.01835
G1 X132.198 Y129.671 E.01835
G1 X131.788 Y130.105 E.01835
G1 X131.293 Y130.44 E.01835
G1 X130.739 Y130.661 E.01835
G1 X130.149 Y130.757 E.01835
G1 X129.553 Y130.725 E.01835
G1 X128.978 Y130.565 E.01835
G1 X128.45 Y130.285 E.01835
G1 X127.995 Y129.899 E.01835
G1 X127.634 Y129.424 E.01835
G1 X127.383 Y128.882 E.01835
G1 X127.255 Y128.299 E.01835
G1 X127.255 Y127.701 E.01835
G1 X127.383 Y127.118 E.01835
G1 X127.634 Y126.576 E.01835
G1 X127.995 Y126.101 E.01835
G1 X128.45 Y125.715 E.01835
G1 X128.978 Y125.435 E.01835
G1 X129.553 Y125.275 E.01835
G1 X129.941 Y125.254 E.01193
M204 S10000
; WIPE_START
G1 F24000
G1 X130.064 Y125.247 E-.04696
G1 X130.149 Y125.243 E-.03236
G1 X130.739 Y125.339 E-.22689
G1 X131.293 Y125.56 E-.22689
G1 X131.788 Y125.895 E-.22689
G1 X131.788 Y125.895 E0
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I-1.215 J.07 P1  F30000
G1 X132.024 Y129.988 Z5.6
G1 Z5.2
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X132.007 Y130.007 E.00079
G1 X131.577 Y130.361 E.0171
G1 X131.086 Y130.623 E.0171
G1 X130.554 Y130.784 E.0171
G1 X130 Y130.839 E.0171
G1 X129.446 Y130.784 E.0171
G1 X128.914 Y130.623 E.0171
G1 X128.423 Y130.361 E.0171
G1 X127.993 Y130.007 E.0171
G1 X127.639 Y129.577 E.0171
G1 X127.377 Y129.086 E.0171
G1 X127.216 Y128.554 E.0171
G1 X127.161 Y128 E.0171
G1 X127.216 Y127.446 E.0171
G1 X127.377 Y126.914 E.0171
G1 X127.639 Y126.423 E.0171
G1 X127.993 Y125.993 E.0171
G1 X128.423 Y125.639 E.0171
G1 X128.914 Y125.377 E.0171
G1 X129.446 Y125.216 E.0171
G1 X130 Y125.161 E.0171
G1 X130.507 Y125.211 E.01566
G1 X131.086 Y125.377 E.01852
G1 X131.577 Y125.639 E.0171
G1 X132.007 Y125.993 E.0171
G1 X132.361 Y126.423 E.0171
G1 X132.623 Y126.914 E.0171
G1 X132.784 Y127.446 E.0171
G1 X132.839 Y128 E.0171
G1 X132.784 Y128.554 E.0171
G1 X132.623 Y129.086 E.0171
G1 X132.361 Y129.577 E.0171
G1 X132.062 Y129.941 E.01447
M204 S10000
; WIPE_START
G1 F24000
G1 X132.007 Y130.007 E-.03253
G1 X131.577 Y130.361 E-.21148
G1 X131.086 Y130.623 E-.21148
G1 X130.554 Y130.784 E-.21149
G1 X130.31 Y130.808 E-.09301
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I-.321 J-1.174 P1  F30000
G1 X109.075 Y136.606 Z5.6
G1 Z5.2
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X109.525 Y136.581 E.01385
G1 X110.114 Y136.678 E.01835
G1 X110.669 Y136.899 E.01835
G1 X111.163 Y137.234 E.01835
G1 X111.574 Y137.667 E.01835
G1 X111.881 Y138.179 E.01835
G1 X112.072 Y138.745 E.01835
G1 X112.137 Y139.339 E.01835
G1 X112.072 Y139.932 E.01835
G1 X111.881 Y140.498 E.01835
G1 X111.574 Y141.01 E.01835
G1 X111.476 Y141.112 E.00435
G1 X111.163 Y141.443 E.014
G1 X110.669 Y141.778 E.01835
G1 X110.114 Y141.999 E.01835
G1 X109.525 Y142.096 E.01835
G1 X108.929 Y142.063 E.01835
G1 X108.353 Y141.904 E.01835
G1 X107.826 Y141.624 E.01835
G1 X107.371 Y141.237 E.01835
G1 X107.009 Y140.762 E.01835
G1 X106.759 Y140.22 E.01835
G1 X106.63 Y139.637 E.01835
G1 X106.63 Y139.04 E.01835
G1 X106.759 Y138.457 E.01835
G1 X107.009 Y137.915 E.01835
G1 X107.371 Y137.44 E.01835
G1 X107.826 Y137.053 E.01835
G1 X108.353 Y136.773 E.01835
G1 X108.929 Y136.614 E.01835
G1 X109.015 Y136.609 E.00266
M204 S10000
; WIPE_START
G1 F24000
G1 X109.525 Y136.581 E-.19406
G1 X110.114 Y136.678 E-.22689
G1 X110.669 Y136.899 E-.22689
G1 X110.913 Y137.065 E-.11216
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I-1.21 J.133 P1  F30000
G1 X111.384 Y141.344 Z5.6
G1 Z5.2
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X111.383 Y141.346 E.00007
G1 X110.953 Y141.699 E.0171
G1 X110.462 Y141.961 E.0171
G1 X109.929 Y142.123 E.0171
G1 X109.375 Y142.177 E.0171
G1 X108.822 Y142.123 E.0171
G1 X108.289 Y141.961 E.0171
G1 X107.798 Y141.699 E.0171
G1 X107.368 Y141.346 E.0171
G1 X107.015 Y140.916 E.0171
G1 X106.752 Y140.425 E.0171
G1 X106.591 Y139.892 E.0171
G1 X106.536 Y139.339 E.0171
G1 X106.591 Y138.785 E.0171
G1 X106.752 Y138.252 E.0171
G1 X107.015 Y137.761 E.0171
G1 X107.368 Y137.331 E.0171
G1 X107.798 Y136.978 E.0171
G1 X108.289 Y136.716 E.0171
G1 X108.822 Y136.554 E.0171
G1 X109.375 Y136.5 E.0171
G1 X109.483 Y136.51 E.00332
G1 X109.929 Y136.554 E.01378
G1 X110.462 Y136.716 E.0171
G1 X110.953 Y136.978 E.0171
G1 X111.383 Y137.331 E.0171
G1 X111.736 Y137.761 E.0171
G1 X111.998 Y138.252 E.0171
G1 X112.16 Y138.785 E.0171
G1 X112.214 Y139.339 E.0171
G1 X112.16 Y139.892 E.0171
G1 X111.998 Y140.425 E.0171
G1 X111.736 Y140.916 E.0171
G1 X111.422 Y141.298 E.01518
M204 S10000
; WIPE_START
G1 F24000
G1 X111.383 Y141.346 E-.02372
G1 X110.953 Y141.699 E-.21149
G1 X110.462 Y141.961 E-.21148
G1 X109.929 Y142.123 E-.21149
G1 X109.663 Y142.149 E-.10183
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I1.217 J-.026 P1  F30000
G1 X109.116 Y116.601 Z5.6
G1 Z5.2
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X109.566 Y116.577 E.01385
G1 X110.155 Y116.673 E.01835
G1 X110.71 Y116.894 E.01835
G1 X111.204 Y117.229 E.01835
G1 X111.615 Y117.663 E.01835
G1 X111.923 Y118.174 E.01835
G1 X112.113 Y118.74 E.01835
G1 X112.178 Y119.334 E.01835
G1 X112.113 Y119.927 E.01835
G1 X111.923 Y120.493 E.01835
G1 X111.615 Y121.005 E.01835
G1 X111.517 Y121.108 E.00435
G1 X111.204 Y121.438 E.014
G1 X110.71 Y121.773 E.01835
G1 X110.155 Y121.994 E.01835
G1 X109.566 Y122.091 E.01835
G1 X108.97 Y122.059 E.01835
G1 X108.394 Y121.899 E.01835
G1 X107.867 Y121.619 E.01835
G1 X107.412 Y121.233 E.01835
G1 X107.051 Y120.757 E.01835
G1 X106.8 Y120.215 E.01835
G1 X106.671 Y119.632 E.01835
G1 X106.671 Y119.035 E.01835
G1 X106.8 Y118.452 E.01835
G1 X107.051 Y117.91 E.01835
G1 X107.412 Y117.435 E.01835
G1 X107.867 Y117.048 E.01835
G1 X108.394 Y116.769 E.01835
G1 X108.97 Y116.609 E.01835
G1 X109.056 Y116.604 E.00266
M204 S10000
; WIPE_START
G1 F24000
G1 X109.566 Y116.577 E-.19406
G1 X110.155 Y116.673 E-.22689
G1 X110.71 Y116.894 E-.22689
G1 X110.954 Y117.06 E-.11216
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I-1.21 J.133 P1  F30000
G1 X111.426 Y121.339 Z5.6
G1 Z5.2
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X111.424 Y121.341 E.00007
G1 X110.994 Y121.694 E.0171
G1 X110.503 Y121.957 E.0171
G1 X109.97 Y122.118 E.0171
G1 X109.417 Y122.173 E.0171
G1 X108.863 Y122.118 E.0171
G1 X108.33 Y121.957 E.0171
G1 X107.839 Y121.694 E.0171
G1 X107.409 Y121.341 E.0171
G1 X107.056 Y120.911 E.0171
G1 X106.794 Y120.42 E.0171
G1 X106.632 Y119.888 E.0171
G1 X106.578 Y119.334 E.0171
G1 X106.632 Y118.78 E.0171
G1 X106.794 Y118.247 E.0171
G1 X107.056 Y117.757 E.0171
G1 X107.409 Y117.326 E.0171
G1 X107.839 Y116.973 E.0171
G1 X108.33 Y116.711 E.0171
G1 X108.863 Y116.549 E.0171
G1 X109.417 Y116.495 E.0171
G1 X109.524 Y116.505 E.00332
G1 X109.97 Y116.549 E.01378
G1 X110.503 Y116.711 E.0171
G1 X110.994 Y116.973 E.0171
G1 X111.424 Y117.326 E.0171
G1 X111.777 Y117.757 E.0171
G1 X112.039 Y118.247 E.0171
G1 X112.201 Y118.78 E.0171
G1 X112.256 Y119.334 E.0171
G1 X112.201 Y119.888 E.0171
G1 X112.039 Y120.42 E.0171
G1 X111.777 Y120.911 E.0171
G1 X111.464 Y121.293 E.01518
M204 S10000
; WIPE_START
G1 F24000
G1 X111.424 Y121.341 E-.02372
G1 X110.994 Y121.694 E-.21149
G1 X110.503 Y121.957 E-.21148
G1 X109.97 Y122.118 E-.21149
G1 X109.704 Y122.145 E-.10183
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I1.216 J-.042 P1  F30000
G1 X108.822 Y96.825 Z5.6
G1 Z5.2
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X109.272 Y96.8 E.01385
G1 X109.861 Y96.897 E.01835
G1 X110.416 Y97.118 E.01835
G1 X110.91 Y97.453 E.01835
G1 X111.321 Y97.886 E.01835
G1 X111.628 Y98.398 E.01835
G1 X111.819 Y98.964 E.01835
G1 X111.884 Y99.557 E.01835
G1 X111.819 Y100.151 E.01835
G1 X111.628 Y100.717 E.01835
G1 X111.321 Y101.228 E.01835
G1 X111.223 Y101.331 E.00435
G1 X110.91 Y101.662 E.014
G1 X110.416 Y101.997 E.01835
G1 X109.861 Y102.218 E.01835
G1 X109.272 Y102.315 E.01835
G1 X108.676 Y102.282 E.01835
G1 X108.1 Y102.122 E.01835
G1 X107.573 Y101.843 E.01835
G1 X107.118 Y101.456 E.01835
G1 X106.756 Y100.981 E.01835
G1 X106.506 Y100.439 E.01835
G1 X106.377 Y99.856 E.01835
G1 X106.377 Y99.259 E.01835
G1 X106.506 Y98.676 E.01835
G1 X106.756 Y98.134 E.01835
G1 X107.118 Y97.658 E.01835
G1 X107.573 Y97.272 E.01835
G1 X108.1 Y96.992 E.01835
G1 X108.676 Y96.832 E.01835
G1 X108.762 Y96.828 E.00266
M204 S10000
; WIPE_START
G1 F24000
G1 X109.272 Y96.8 E-.19406
G1 X109.861 Y96.897 E-.22689
G1 X110.416 Y97.118 E-.22689
G1 X110.66 Y97.283 E-.11216
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I-1.21 J.133 P1  F30000
G1 X111.131 Y101.563 Z5.6
G1 Z5.2
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X111.13 Y101.565 E.00007
G1 X110.7 Y101.918 E.0171
G1 X110.209 Y102.18 E.0171
G1 X109.676 Y102.342 E.0171
G1 X109.122 Y102.396 E.0171
G1 X108.569 Y102.342 E.0171
G1 X108.036 Y102.18 E.0171
G1 X107.545 Y101.918 E.0171
G1 X107.115 Y101.565 E.0171
G1 X106.762 Y101.135 E.0171
G1 X106.5 Y100.644 E.0171
G1 X106.338 Y100.111 E.0171
G1 X106.283 Y99.557 E.0171
G1 X106.338 Y99.003 E.0171
G1 X106.5 Y98.471 E.0171
G1 X106.762 Y97.98 E.0171
G1 X107.115 Y97.55 E.0171
G1 X107.545 Y97.197 E.0171
G1 X108.036 Y96.934 E.0171
G1 X108.569 Y96.773 E.0171
G1 X109.122 Y96.718 E.0171
G1 X109.23 Y96.729 E.00332
G1 X109.676 Y96.773 E.01378
G1 X110.209 Y96.934 E.0171
G1 X110.7 Y97.197 E.0171
G1 X111.13 Y97.55 E.0171
G1 X111.483 Y97.98 E.0171
G1 X111.745 Y98.471 E.0171
G1 X111.907 Y99.003 E.0171
G1 X111.961 Y99.557 E.0171
G1 X111.907 Y100.111 E.0171
G1 X111.745 Y100.644 E.0171
G1 X111.483 Y101.135 E.0171
G1 X111.169 Y101.517 E.01518
M204 S10000
; WIPE_START
G1 F24000
G1 X111.13 Y101.565 E-.02372
G1 X110.7 Y101.918 E-.21149
G1 X110.209 Y102.18 E-.21148
G1 X109.676 Y102.342 E-.21149
G1 X109.41 Y102.368 E-.10183
; WIPE_END
M73 P89 R1
G1 E-.04 F1800
G17
G3 Z5.6 I1.216 J-.059 P1  F30000
G1 X108.04 Y74.009 Z5.6
G1 Z5.2
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X108.49 Y73.985 E.01385
G1 X109.079 Y74.081 E.01835
G1 X109.634 Y74.302 E.01835
G1 X110.128 Y74.637 E.01835
G1 X110.538 Y75.071 E.01835
G1 X110.846 Y75.582 E.01835
G1 X111.037 Y76.148 E.01835
G1 X111.102 Y76.742 E.01835
G1 X111.037 Y77.335 E.01835
G1 X110.846 Y77.901 E.01835
G1 X110.538 Y78.413 E.01835
G1 X110.441 Y78.516 E.00435
G1 X110.128 Y78.846 E.014
G1 X109.634 Y79.181 E.01835
G1 X109.079 Y79.402 E.01835
G1 X108.49 Y79.499 E.01835
G1 X107.894 Y79.467 E.01835
G1 X107.318 Y79.307 E.01835
G1 X106.791 Y79.027 E.01835
G1 X106.336 Y78.641 E.01835
G1 X105.974 Y78.165 E.01835
G1 X105.724 Y77.623 E.01835
G1 X105.595 Y77.04 E.01835
G1 X105.595 Y76.443 E.01835
G1 X105.724 Y75.86 E.01835
G1 X105.974 Y75.318 E.01835
G1 X106.336 Y74.843 E.01835
G1 X106.791 Y74.456 E.01835
G1 X107.318 Y74.177 E.01835
G1 X107.894 Y74.017 E.01835
G1 X107.98 Y74.012 E.00266
M204 S10000
; WIPE_START
G1 F24000
G1 X108.49 Y73.985 E-.19406
G1 X109.079 Y74.081 E-.22689
G1 X109.634 Y74.302 E-.22689
G1 X109.878 Y74.468 E-.11216
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I-1.21 J.133 P1  F30000
G1 X110.349 Y78.747 Z5.6
G1 Z5.2
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X110.348 Y78.749 E.00007
G1 X109.918 Y79.102 E.0171
G1 X109.427 Y79.365 E.0171
G1 X108.894 Y79.526 E.0171
G1 X108.34 Y79.581 E.0171
G1 X107.786 Y79.526 E.0171
G1 X107.254 Y79.365 E.0171
G1 X106.763 Y79.102 E.0171
G1 X106.333 Y78.749 E.0171
G1 X105.98 Y78.319 E.0171
G1 X105.717 Y77.828 E.0171
G1 X105.556 Y77.296 E.0171
G1 X105.501 Y76.742 E.0171
G1 X105.556 Y76.188 E.0171
G1 X105.717 Y75.655 E.0171
G1 X105.98 Y75.164 E.0171
G1 X106.333 Y74.734 E.0171
G1 X106.763 Y74.381 E.0171
G1 X107.254 Y74.119 E.0171
G1 X107.786 Y73.957 E.0171
G1 X108.34 Y73.903 E.0171
G1 X108.448 Y73.913 E.00332
G1 X108.894 Y73.957 E.01378
G1 X109.427 Y74.119 E.0171
G1 X109.918 Y74.381 E.0171
G1 X110.348 Y74.734 E.0171
G1 X110.701 Y75.164 E.0171
G1 X110.963 Y75.655 E.0171
G1 X111.125 Y76.188 E.0171
G1 X111.179 Y76.742 E.0171
G1 X111.125 Y77.296 E.0171
G1 X110.963 Y77.828 E.0171
G1 X110.701 Y78.319 E.0171
G1 X110.387 Y78.701 E.01518
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 5.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X110.348 Y78.749 E-.02372
G1 X109.918 Y79.102 E-.21149
G1 X109.427 Y79.365 E-.21148
G1 X108.894 Y79.526 E-.21149
G1 X108.627 Y79.552 E-.10183
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 27/32
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
G3 Z5.6 I-.344 J1.167 P1  F30000
G1 X129.348 Y85.667 Z5.6
G1 Z5.4
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X129.429 Y85.663 E.00249
G1 X129.495 Y85.66 E.00203
G1 X130.084 Y85.756 E.01835
G1 X130.639 Y85.977 E.01835
G1 X131.133 Y86.312 E.01835
G1 X131.543 Y86.746 E.01835
G1 X131.851 Y87.257 E.01835
G1 X132.042 Y87.823 E.01835
G1 X132.106 Y88.417 E.01835
G1 X132.042 Y89.01 E.01835
G1 X131.851 Y89.576 E.01835
G1 X131.543 Y90.088 E.01835
G1 X131.498 Y90.136 E.00203
G1 X131.133 Y90.521 E.01632
G1 X130.639 Y90.856 E.01835
G1 X130.084 Y91.077 E.01835
G1 X129.495 Y91.174 E.01835
G1 X128.898 Y91.142 E.01835
G1 X128.323 Y90.982 E.01835
G1 X127.796 Y90.702 E.01835
G1 X127.341 Y90.316 E.01835
G1 X126.979 Y89.84 E.01835
G1 X126.728 Y89.298 E.01835
G1 X126.6 Y88.715 E.01835
G1 X126.6 Y88.118 E.01835
G1 X126.728 Y87.535 E.01835
G1 X126.979 Y86.993 E.01835
G1 X127.341 Y86.518 E.01835
G1 X127.796 Y86.131 E.01835
G1 X128.323 Y85.852 E.01835
G1 X128.898 Y85.692 E.01835
G1 X129.288 Y85.671 E.01198
M204 S10000
; WIPE_START
G1 F24000
G1 X129.429 Y85.663 E-.05362
G1 X129.495 Y85.66 E-.02508
G1 X130.084 Y85.756 E-.22689
G1 X130.639 Y85.977 E-.22689
G1 X131.133 Y86.312 E-.22689
G1 X131.134 Y86.313 E-.00063
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I-1.215 J.071 P1  F30000
G1 X131.372 Y90.401 Z5.8
G1 Z5.4
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X131.353 Y90.424 E.00092
G1 X130.922 Y90.777 E.0171
G1 X130.432 Y91.04 E.0171
G1 X129.899 Y91.201 E.0171
G1 X129.345 Y91.256 E.0171
G1 X128.791 Y91.201 E.0171
G1 X128.259 Y91.04 E.0171
G1 X127.768 Y90.777 E.0171
G1 X127.338 Y90.424 E.0171
G1 X126.985 Y89.994 E.0171
G1 X126.722 Y89.503 E.0171
G1 X126.561 Y88.971 E.0171
G1 X126.506 Y88.417 E.0171
G1 X126.561 Y87.863 E.0171
G1 X126.722 Y87.33 E.0171
G1 X126.985 Y86.839 E.0171
G1 X127.338 Y86.409 E.0171
G1 X127.768 Y86.056 E.0171
G1 X128.259 Y85.794 E.0171
G1 X128.791 Y85.632 E.0171
G1 X129.345 Y85.578 E.0171
G1 X129.873 Y85.63 E.0163
G1 X130.432 Y85.794 E.01789
G1 X130.922 Y86.056 E.0171
G1 X131.353 Y86.409 E.0171
G1 X131.706 Y86.839 E.0171
G1 X131.968 Y87.33 E.0171
G1 X132.13 Y87.863 E.0171
G1 X132.184 Y88.417 E.0171
G1 X132.13 Y88.971 E.0171
G1 X131.968 Y89.503 E.0171
G1 X131.706 Y89.994 E.0171
G1 X131.41 Y90.355 E.01433
M204 S10000
; WIPE_START
G1 F24000
G1 X131.353 Y90.424 E-.03424
G1 X130.922 Y90.777 E-.21148
G1 X130.432 Y91.04 E-.21149
G1 X129.899 Y91.201 E-.21148
G1 X129.66 Y91.225 E-.09131
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I-1.216 J-.041 P1  F30000
G1 X129.104 Y107.647 Z5.8
G1 Z5.4
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X129.185 Y107.643 E.00249
G1 X129.251 Y107.639 E.00203
G1 X129.841 Y107.736 E.01835
G1 X130.395 Y107.957 E.01835
G1 X130.889 Y108.292 E.01835
G1 X131.3 Y108.725 E.01835
G1 X131.608 Y109.237 E.01835
G1 X131.798 Y109.803 E.01835
G1 X131.863 Y110.396 E.01835
G1 X131.798 Y110.99 E.01835
G1 X131.608 Y111.556 E.01835
G1 X131.3 Y112.067 E.01835
G1 X131.255 Y112.115 E.00203
G1 X130.889 Y112.501 E.01632
G1 X130.395 Y112.836 E.01835
G1 X129.841 Y113.057 E.01835
G1 X129.251 Y113.154 E.01835
G1 X128.655 Y113.121 E.01835
G1 X128.08 Y112.961 E.01835
G1 X127.552 Y112.682 E.01835
G1 X127.097 Y112.295 E.01835
G1 X126.736 Y111.82 E.01835
G1 X126.485 Y111.278 E.01835
G1 X126.357 Y110.695 E.01835
G1 X126.357 Y110.098 E.01835
G1 X126.485 Y109.515 E.01835
G1 X126.736 Y108.973 E.01835
G1 X127.097 Y108.497 E.01835
G1 X127.552 Y108.111 E.01835
G1 X128.08 Y107.831 E.01835
G1 X128.655 Y107.672 E.01835
G1 X129.045 Y107.65 E.01198
M204 S10000
; WIPE_START
G1 F24000
G1 X129.185 Y107.643 E-.05362
G1 X129.251 Y107.639 E-.02508
G1 X129.841 Y107.736 E-.22689
G1 X130.395 Y107.957 E-.22689
G1 X130.889 Y108.292 E-.22689
G1 X130.891 Y108.293 E-.00063
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I-1.215 J.071 P1  F30000
G1 X131.128 Y112.381 Z5.8
G1 Z5.4
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X131.109 Y112.404 E.00092
G1 X130.679 Y112.757 E.0171
G1 X130.188 Y113.019 E.0171
G1 X129.656 Y113.181 E.0171
G1 X129.102 Y113.235 E.0171
G1 X128.548 Y113.181 E.0171
G1 X128.015 Y113.019 E.0171
G1 X127.525 Y112.757 E.0171
G1 X127.094 Y112.404 E.0171
G1 X126.741 Y111.974 E.0171
G1 X126.479 Y111.483 E.0171
G1 X126.317 Y110.95 E.0171
G1 X126.263 Y110.396 E.0171
G1 X126.317 Y109.843 E.0171
G1 X126.479 Y109.31 E.0171
G1 X126.741 Y108.819 E.0171
G1 X127.094 Y108.389 E.0171
G1 X127.525 Y108.036 E.0171
G1 X128.015 Y107.773 E.0171
G1 X128.548 Y107.612 E.0171
G1 X129.102 Y107.557 E.0171
G1 X129.63 Y107.609 E.0163
G1 X130.188 Y107.773 E.01789
G1 X130.679 Y108.036 E.0171
G1 X131.109 Y108.389 E.0171
G1 X131.462 Y108.819 E.0171
G1 X131.725 Y109.31 E.0171
G1 X131.886 Y109.843 E.0171
G1 X131.941 Y110.396 E.0171
G1 X131.886 Y110.95 E.0171
G1 X131.725 Y111.483 E.0171
G1 X131.462 Y111.974 E.0171
G1 X131.166 Y112.334 E.01433
M204 S10000
; WIPE_START
G1 F24000
G1 X131.109 Y112.404 E-.03424
G1 X130.679 Y112.757 E-.21148
G1 X130.188 Y113.019 E-.21149
G1 X129.656 Y113.181 E-.21148
G1 X129.417 Y113.204 E-.09131
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I-1.216 J.059 P1  F30000
G1 X130.003 Y125.251 Z5.8
G1 Z5.4
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X130.084 Y125.246 E.00249
G1 X130.149 Y125.243 E.00203
G1 X130.739 Y125.339 E.01835
G1 X131.293 Y125.56 E.01835
G1 X131.788 Y125.895 E.01835
G1 X132.198 Y126.329 E.01835
G1 X132.506 Y126.841 E.01835
G1 X132.697 Y127.406 E.01835
G1 X132.761 Y128 E.01835
G1 X132.697 Y128.594 E.01835
G1 X132.506 Y129.159 E.01835
G1 X132.198 Y129.671 E.01835
G1 X132.153 Y129.719 E.00203
G1 X131.788 Y130.105 E.01632
G1 X131.293 Y130.44 E.01835
G1 X130.739 Y130.661 E.01835
G1 X130.149 Y130.757 E.01835
G1 X129.553 Y130.725 E.01835
G1 X128.978 Y130.565 E.01835
G1 X128.45 Y130.285 E.01835
G1 X127.995 Y129.899 E.01835
G1 X127.634 Y129.424 E.01835
G1 X127.383 Y128.882 E.01835
G1 X127.255 Y128.299 E.01835
G1 X127.255 Y127.701 E.01835
G1 X127.383 Y127.118 E.01835
G1 X127.634 Y126.576 E.01835
G1 X127.995 Y126.101 E.01835
G1 X128.45 Y125.715 E.01835
G1 X128.978 Y125.435 E.01835
G1 X129.553 Y125.275 E.01835
G1 X129.943 Y125.254 E.01198
M204 S10000
; WIPE_START
G1 F24000
G1 X130.084 Y125.246 E-.05362
G1 X130.149 Y125.243 E-.02508
G1 X130.739 Y125.339 E-.22689
G1 X131.293 Y125.56 E-.22689
G1 X131.788 Y125.895 E-.22689
G1 X131.789 Y125.897 E-.00063
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I-1.215 J.071 P1  F30000
G1 X132.027 Y129.984 Z5.8
G1 Z5.4
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X132.007 Y130.007 E.00092
G1 X131.577 Y130.361 E.0171
G1 X131.086 Y130.623 E.0171
G1 X130.554 Y130.784 E.0171
G1 X130 Y130.839 E.0171
G1 X129.446 Y130.784 E.0171
G1 X128.914 Y130.623 E.0171
G1 X128.423 Y130.361 E.0171
G1 X127.993 Y130.007 E.0171
G1 X127.639 Y129.577 E.0171
G1 X127.377 Y129.086 E.0171
G1 X127.216 Y128.554 E.0171
G1 X127.161 Y128 E.0171
G1 X127.216 Y127.446 E.0171
G1 X127.377 Y126.914 E.0171
G1 X127.639 Y126.423 E.0171
G1 X127.993 Y125.993 E.0171
G1 X128.423 Y125.639 E.0171
G1 X128.914 Y125.377 E.0171
G1 X129.446 Y125.216 E.0171
G1 X130 Y125.161 E.0171
G1 X130.528 Y125.213 E.0163
G1 X131.086 Y125.377 E.01789
G1 X131.577 Y125.639 E.0171
G1 X132.007 Y125.993 E.0171
G1 X132.361 Y126.423 E.0171
G1 X132.623 Y126.914 E.0171
G1 X132.784 Y127.446 E.0171
G1 X132.839 Y128 E.0171
G1 X132.784 Y128.554 E.0171
G1 X132.623 Y129.086 E.0171
G1 X132.361 Y129.577 E.0171
G1 X132.065 Y129.938 E.01433
M204 S10000
; WIPE_START
G1 F24000
G1 X132.007 Y130.007 E-.03424
G1 X131.577 Y130.361 E-.21148
G1 X131.086 Y130.623 E-.21149
G1 X130.554 Y130.784 E-.21148
G1 X130.315 Y130.808 E-.09131
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I-.32 J-1.174 P1  F30000
G1 X109.059 Y136.607 Z5.8
G1 Z5.4
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X109.525 Y136.581 E.01434
G1 X110.114 Y136.678 E.01835
G1 X110.669 Y136.899 E.01835
G1 X111.163 Y137.234 E.01835
G1 X111.574 Y137.667 E.01835
G1 X111.881 Y138.179 E.01835
G1 X112.072 Y138.745 E.01835
G1 X112.137 Y139.339 E.01835
G1 X112.072 Y139.932 E.01835
G1 X111.881 Y140.498 E.01835
G1 X111.574 Y141.01 E.01835
G1 X111.488 Y141.1 E.00383
G1 X111.163 Y141.443 E.01452
G1 X110.669 Y141.778 E.01835
G1 X110.114 Y141.999 E.01835
G1 X109.525 Y142.096 E.01835
G1 X108.929 Y142.063 E.01835
G1 X108.353 Y141.904 E.01835
G1 X107.826 Y141.624 E.01835
G1 X107.371 Y141.237 E.01835
G1 X107.009 Y140.762 E.01835
G1 X106.759 Y140.22 E.01835
G1 X106.63 Y139.637 E.01835
G1 X106.63 Y139.04 E.01835
G1 X106.759 Y138.457 E.01835
G1 X107.009 Y137.915 E.01835
G1 X107.371 Y137.44 E.01835
G1 X107.826 Y137.053 E.01835
G1 X108.353 Y136.773 E.01835
G1 X108.929 Y136.614 E.01835
G1 X108.999 Y136.61 E.00216
M204 S10000
; WIPE_START
G1 F24000
G1 X109.525 Y136.581 E-.20019
G1 X110.114 Y136.678 E-.22689
G1 X110.669 Y136.899 E-.22689
G1 X110.9 Y137.056 E-.10602
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I-1.209 J.137 P1  F30000
G1 X111.385 Y141.344 Z5.8
G1 Z5.4
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X111.383 Y141.346 E.00008
G1 X110.953 Y141.699 E.0171
G1 X110.462 Y141.961 E.0171
G1 X109.929 Y142.123 E.0171
G1 X109.375 Y142.177 E.0171
G1 X108.822 Y142.123 E.0171
G1 X108.289 Y141.961 E.0171
G1 X107.798 Y141.699 E.0171
G1 X107.368 Y141.346 E.0171
G1 X107.015 Y140.916 E.0171
G1 X106.752 Y140.425 E.0171
G1 X106.591 Y139.892 E.0171
G1 X106.536 Y139.339 E.0171
G1 X106.591 Y138.785 E.0171
G1 X106.752 Y138.252 E.0171
G1 X107.015 Y137.761 E.0171
G1 X107.368 Y137.331 E.0171
G1 X107.798 Y136.978 E.0171
G1 X108.289 Y136.716 E.0171
G1 X108.822 Y136.554 E.0171
G1 X109.375 Y136.5 E.0171
G1 X109.465 Y136.508 E.00276
G1 X109.929 Y136.554 E.01434
G1 X110.462 Y136.716 E.0171
G1 X110.953 Y136.978 E.0171
G1 X111.383 Y137.331 E.0171
G1 X111.736 Y137.761 E.0171
G1 X111.998 Y138.252 E.0171
G1 X112.16 Y138.785 E.0171
M73 P90 R1
G1 X112.214 Y139.339 E.0171
G1 X112.16 Y139.892 E.0171
G1 X111.998 Y140.425 E.0171
G1 X111.736 Y140.916 E.0171
G1 X111.423 Y141.298 E.01517
M204 S10000
; WIPE_START
G1 F24000
G1 X111.383 Y141.346 E-.02383
G1 X110.953 Y141.699 E-.21148
G1 X110.462 Y141.961 E-.21149
G1 X109.929 Y142.123 E-.21148
G1 X109.663 Y142.149 E-.10172
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I1.217 J-.027 P1  F30000
G1 X109.1 Y116.602 Z5.8
G1 Z5.4
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X109.566 Y116.577 E.01434
G1 X110.155 Y116.673 E.01835
G1 X110.71 Y116.894 E.01835
G1 X111.204 Y117.229 E.01835
G1 X111.615 Y117.663 E.01835
G1 X111.923 Y118.174 E.01835
G1 X112.113 Y118.74 E.01835
G1 X112.178 Y119.334 E.01835
G1 X112.113 Y119.927 E.01835
G1 X111.923 Y120.493 E.01835
G1 X111.615 Y121.005 E.01835
G1 X111.529 Y121.095 E.00383
G1 X111.204 Y121.438 E.01452
G1 X110.71 Y121.773 E.01835
G1 X110.155 Y121.994 E.01835
G1 X109.566 Y122.091 E.01835
G1 X108.97 Y122.059 E.01835
G1 X108.394 Y121.899 E.01835
G1 X107.867 Y121.619 E.01835
G1 X107.412 Y121.233 E.01835
G1 X107.051 Y120.757 E.01835
G1 X106.8 Y120.215 E.01835
G1 X106.671 Y119.632 E.01835
G1 X106.671 Y119.035 E.01835
G1 X106.8 Y118.452 E.01835
G1 X107.051 Y117.91 E.01835
G1 X107.412 Y117.435 E.01835
G1 X107.867 Y117.048 E.01835
G1 X108.394 Y116.769 E.01835
G1 X108.97 Y116.609 E.01835
G1 X109.04 Y116.605 E.00216
M204 S10000
; WIPE_START
G1 F24000
G1 X109.566 Y116.577 E-.20019
G1 X110.155 Y116.673 E-.22689
G1 X110.71 Y116.894 E-.22689
G1 X110.941 Y117.051 E-.10602
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I-1.209 J.137 P1  F30000
G1 X111.426 Y121.339 Z5.8
G1 Z5.4
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X111.424 Y121.341 E.00008
G1 X110.994 Y121.694 E.0171
G1 X110.503 Y121.957 E.0171
G1 X109.97 Y122.118 E.0171
G1 X109.417 Y122.173 E.0171
G1 X108.863 Y122.118 E.0171
G1 X108.33 Y121.957 E.0171
G1 X107.839 Y121.694 E.0171
G1 X107.409 Y121.341 E.0171
G1 X107.056 Y120.911 E.0171
G1 X106.794 Y120.42 E.0171
G1 X106.632 Y119.888 E.0171
G1 X106.578 Y119.334 E.0171
G1 X106.632 Y118.78 E.0171
G1 X106.794 Y118.247 E.0171
G1 X107.056 Y117.757 E.0171
G1 X107.409 Y117.326 E.0171
G1 X107.839 Y116.973 E.0171
G1 X108.33 Y116.711 E.0171
G1 X108.863 Y116.549 E.0171
G1 X109.417 Y116.495 E.0171
G1 X109.506 Y116.504 E.00276
G1 X109.97 Y116.549 E.01434
G1 X110.503 Y116.711 E.0171
G1 X110.994 Y116.973 E.0171
G1 X111.424 Y117.326 E.0171
G1 X111.777 Y117.757 E.0171
G1 X112.039 Y118.247 E.0171
G1 X112.201 Y118.78 E.0171
G1 X112.256 Y119.334 E.0171
G1 X112.201 Y119.888 E.0171
G1 X112.039 Y120.42 E.0171
G1 X111.777 Y120.911 E.0171
G1 X111.464 Y121.293 E.01517
M204 S10000
; WIPE_START
G1 F24000
G1 X111.424 Y121.341 E-.02383
G1 X110.994 Y121.694 E-.21148
G1 X110.503 Y121.957 E-.21149
G1 X109.97 Y122.118 E-.21148
G1 X109.704 Y122.144 E-.10172
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I1.216 J-.043 P1  F30000
G1 X108.806 Y96.825 Z5.8
G1 Z5.4
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X109.272 Y96.8 E.01434
G1 X109.861 Y96.897 E.01835
G1 X110.416 Y97.118 E.01835
G1 X110.91 Y97.453 E.01835
G1 X111.321 Y97.886 E.01835
G1 X111.628 Y98.398 E.01835
G1 X111.819 Y98.964 E.01835
G1 X111.884 Y99.557 E.01835
G1 X111.819 Y100.151 E.01835
G1 X111.628 Y100.717 E.01835
G1 X111.321 Y101.228 E.01835
G1 X111.235 Y101.319 E.00383
G1 X110.91 Y101.662 E.01452
G1 X110.416 Y101.997 E.01835
G1 X109.861 Y102.218 E.01835
G1 X109.272 Y102.315 E.01835
G1 X108.676 Y102.282 E.01835
G1 X108.1 Y102.122 E.01835
G1 X107.573 Y101.843 E.01835
G1 X107.118 Y101.456 E.01835
G1 X106.756 Y100.981 E.01835
G1 X106.506 Y100.439 E.01835
G1 X106.377 Y99.856 E.01835
G1 X106.377 Y99.259 E.01835
G1 X106.506 Y98.676 E.01835
G1 X106.756 Y98.134 E.01835
G1 X107.118 Y97.658 E.01835
G1 X107.573 Y97.272 E.01835
G1 X108.1 Y96.992 E.01835
G1 X108.676 Y96.832 E.01835
G1 X108.746 Y96.829 E.00216
M204 S10000
; WIPE_START
G1 F24000
G1 X109.272 Y96.8 E-.20019
G1 X109.861 Y96.897 E-.22689
G1 X110.416 Y97.118 E-.22689
G1 X110.647 Y97.274 E-.10602
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I-1.209 J.137 P1  F30000
G1 X111.132 Y101.563 Z5.8
G1 Z5.4
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X111.13 Y101.565 E.00008
G1 X110.7 Y101.918 E.0171
G1 X110.209 Y102.18 E.0171
G1 X109.676 Y102.342 E.0171
G1 X109.122 Y102.396 E.0171
G1 X108.569 Y102.342 E.0171
G1 X108.036 Y102.18 E.0171
G1 X107.545 Y101.918 E.0171
G1 X107.115 Y101.565 E.0171
G1 X106.762 Y101.135 E.0171
G1 X106.5 Y100.644 E.0171
G1 X106.338 Y100.111 E.0171
G1 X106.283 Y99.557 E.0171
G1 X106.338 Y99.003 E.0171
G1 X106.5 Y98.471 E.0171
G1 X106.762 Y97.98 E.0171
G1 X107.115 Y97.55 E.0171
G1 X107.545 Y97.197 E.0171
G1 X108.036 Y96.934 E.0171
G1 X108.569 Y96.773 E.0171
G1 X109.122 Y96.718 E.0171
G1 X109.212 Y96.727 E.00276
G1 X109.676 Y96.773 E.01434
G1 X110.209 Y96.934 E.0171
G1 X110.7 Y97.197 E.0171
G1 X111.13 Y97.55 E.0171
G1 X111.483 Y97.98 E.0171
G1 X111.745 Y98.471 E.0171
G1 X111.907 Y99.003 E.0171
G1 X111.961 Y99.557 E.0171
G1 X111.907 Y100.111 E.0171
G1 X111.745 Y100.644 E.0171
G1 X111.483 Y101.135 E.0171
G1 X111.17 Y101.516 E.01517
M204 S10000
; WIPE_START
G1 F24000
G1 X111.13 Y101.565 E-.02383
G1 X110.7 Y101.918 E-.21148
G1 X110.209 Y102.18 E-.21149
G1 X109.676 Y102.342 E-.21148
G1 X109.41 Y102.368 E-.10172
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I1.216 J-.059 P1  F30000
G1 X108.024 Y74.01 Z5.8
G1 Z5.4
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X108.49 Y73.985 E.01434
G1 X109.079 Y74.081 E.01835
G1 X109.634 Y74.302 E.01835
G1 X110.128 Y74.637 E.01835
G1 X110.538 Y75.071 E.01835
G1 X110.846 Y75.582 E.01835
G1 X111.037 Y76.148 E.01835
G1 X111.102 Y76.742 E.01835
G1 X111.037 Y77.335 E.01835
G1 X110.846 Y77.901 E.01835
G1 X110.538 Y78.413 E.01835
G1 X110.453 Y78.503 E.00383
G1 X110.128 Y78.846 E.01452
G1 X109.634 Y79.181 E.01835
G1 X109.079 Y79.402 E.01835
G1 X108.49 Y79.499 E.01835
G1 X107.894 Y79.467 E.01835
G1 X107.318 Y79.307 E.01835
G1 X106.791 Y79.027 E.01835
G1 X106.336 Y78.641 E.01835
G1 X105.974 Y78.165 E.01835
G1 X105.724 Y77.623 E.01835
G1 X105.595 Y77.04 E.01835
G1 X105.595 Y76.443 E.01835
G1 X105.724 Y75.86 E.01835
G1 X105.974 Y75.318 E.01835
G1 X106.336 Y74.843 E.01835
G1 X106.791 Y74.456 E.01835
G1 X107.318 Y74.177 E.01835
G1 X107.894 Y74.017 E.01835
G1 X107.964 Y74.013 E.00216
M204 S10000
; WIPE_START
G1 F24000
G1 X108.49 Y73.985 E-.20019
G1 X109.079 Y74.081 E-.22689
G1 X109.634 Y74.302 E-.22689
G1 X109.865 Y74.459 E-.10602
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I-1.209 J.137 P1  F30000
G1 X110.349 Y78.747 Z5.8
G1 Z5.4
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X110.348 Y78.749 E.00008
G1 X109.918 Y79.102 E.0171
G1 X109.427 Y79.365 E.0171
G1 X108.894 Y79.526 E.0171
G1 X108.34 Y79.581 E.0171
G1 X107.786 Y79.526 E.0171
G1 X107.254 Y79.365 E.0171
G1 X106.763 Y79.102 E.0171
G1 X106.333 Y78.749 E.0171
G1 X105.98 Y78.319 E.0171
G1 X105.717 Y77.828 E.0171
G1 X105.556 Y77.296 E.0171
G1 X105.501 Y76.742 E.0171
G1 X105.556 Y76.188 E.0171
G1 X105.717 Y75.655 E.0171
G1 X105.98 Y75.164 E.0171
G1 X106.333 Y74.734 E.0171
G1 X106.763 Y74.381 E.0171
G1 X107.254 Y74.119 E.0171
G1 X107.786 Y73.957 E.0171
G1 X108.34 Y73.903 E.0171
G1 X108.43 Y73.912 E.00276
G1 X108.894 Y73.957 E.01434
G1 X109.427 Y74.119 E.0171
G1 X109.918 Y74.381 E.0171
G1 X110.348 Y74.734 E.0171
G1 X110.701 Y75.164 E.0171
G1 X110.963 Y75.655 E.0171
G1 X111.125 Y76.188 E.0171
G1 X111.179 Y76.742 E.0171
G1 X111.125 Y77.296 E.0171
G1 X110.963 Y77.828 E.0171
G1 X110.701 Y78.319 E.0171
G1 X110.388 Y78.701 E.01517
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 5.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X110.348 Y78.749 E-.02383
G1 X109.918 Y79.102 E-.21148
G1 X109.427 Y79.365 E-.21149
G1 X108.894 Y79.526 E-.21148
G1 X108.628 Y79.552 E-.10172
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 28/32
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
G3 Z5.8 I-.344 J1.167 P1  F30000
G1 X129.349 Y85.667 Z5.8
G1 Z5.6
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X129.448 Y85.662 E.00303
G1 X130.084 Y85.756 E.01975
G1 X130.639 Y85.977 E.01835
G1 X131.133 Y86.312 E.01835
G1 X131.543 Y86.746 E.01835
G1 X131.851 Y87.257 E.01835
G1 X132.042 Y87.823 E.01835
G1 X132.106 Y88.417 E.01835
G1 X132.042 Y89.01 E.01835
G1 X131.851 Y89.576 E.01835
G1 X131.543 Y90.088 E.01835
G1 X131.133 Y90.521 E.01835
G1 X130.639 Y90.856 E.01835
G1 X130.084 Y91.077 E.01835
G1 X129.495 Y91.174 E.01835
G1 X128.898 Y91.142 E.01835
G1 X128.323 Y90.982 E.01835
G1 X127.796 Y90.702 E.01835
G1 X127.341 Y90.316 E.01835
G1 X126.979 Y89.84 E.01835
G1 X126.728 Y89.298 E.01835
G1 X126.6 Y88.715 E.01835
G1 X126.6 Y88.118 E.01835
G1 X126.728 Y87.535 E.01835
G1 X126.979 Y86.993 E.01835
G1 X127.341 Y86.518 E.01835
G1 X127.796 Y86.131 E.01835
G1 X128.323 Y85.852 E.01835
G1 X128.898 Y85.692 E.01835
G1 X129.289 Y85.671 E.01203
M204 S10000
; WIPE_START
G1 F24000
G1 X129.448 Y85.662 E-.06029
G1 X130.084 Y85.756 E-.24429
G1 X130.639 Y85.977 E-.22689
G1 X131.133 Y86.312 E-.22689
G1 X131.136 Y86.315 E-.00163
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I-1.215 J.071 P1  F30000
G1 X131.374 Y90.398 Z6
G1 Z5.6
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X131.353 Y90.424 E.00106
G1 X130.922 Y90.777 E.0171
G1 X130.432 Y91.04 E.0171
G1 X129.899 Y91.201 E.0171
G1 X129.345 Y91.256 E.0171
G1 X128.791 Y91.201 E.0171
G1 X128.259 Y91.04 E.0171
G1 X127.768 Y90.777 E.0171
G1 X127.338 Y90.424 E.0171
G1 X126.985 Y89.994 E.0171
G1 X126.722 Y89.503 E.0171
G1 X126.561 Y88.971 E.0171
G1 X126.506 Y88.417 E.0171
G1 X126.561 Y87.863 E.0171
G1 X126.722 Y87.33 E.0171
G1 X126.985 Y86.839 E.0171
G1 X127.338 Y86.409 E.0171
G1 X127.768 Y86.056 E.0171
G1 X128.259 Y85.794 E.0171
G1 X128.791 Y85.632 E.0171
G1 X129.345 Y85.578 E.0171
G1 X129.894 Y85.632 E.01694
G1 X130.432 Y85.794 E.01726
G1 X130.922 Y86.056 E.0171
G1 X131.353 Y86.409 E.0171
G1 X131.706 Y86.839 E.0171
G1 X131.968 Y87.33 E.0171
G1 X132.13 Y87.863 E.0171
G1 X132.184 Y88.417 E.0171
G1 X132.13 Y88.971 E.0171
G1 X131.968 Y89.503 E.0171
G1 X131.706 Y89.994 E.0171
G1 X131.412 Y90.351 E.0142
M204 S10000
; WIPE_START
G1 F24000
G1 X131.353 Y90.424 E-.03585
G1 X130.922 Y90.777 E-.21148
G1 X130.432 Y91.04 E-.21149
G1 X129.899 Y91.201 E-.21148
G1 X129.664 Y91.224 E-.0897
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I-1.216 J-.041 P1  F30000
G1 X129.106 Y107.647 Z6
G1 Z5.6
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X129.205 Y107.642 E.00303
G1 X129.841 Y107.736 E.01975
G1 X130.395 Y107.957 E.01835
G1 X130.889 Y108.292 E.01835
G1 X131.3 Y108.725 E.01835
G1 X131.608 Y109.237 E.01835
G1 X131.798 Y109.803 E.01835
G1 X131.863 Y110.396 E.01835
G1 X131.798 Y110.99 E.01835
G1 X131.608 Y111.556 E.01835
G1 X131.3 Y112.067 E.01835
G1 X130.889 Y112.501 E.01835
G1 X130.395 Y112.836 E.01835
G1 X129.841 Y113.057 E.01835
G1 X129.251 Y113.154 E.01835
G1 X128.655 Y113.121 E.01835
G1 X128.08 Y112.961 E.01835
G1 X127.552 Y112.682 E.01835
G1 X127.097 Y112.295 E.01835
G1 X126.736 Y111.82 E.01835
G1 X126.485 Y111.278 E.01835
G1 X126.357 Y110.695 E.01835
G1 X126.357 Y110.098 E.01835
G1 X126.485 Y109.515 E.01835
G1 X126.736 Y108.973 E.01835
G1 X127.097 Y108.497 E.01835
G1 X127.552 Y108.111 E.01835
G1 X128.08 Y107.831 E.01835
G1 X128.655 Y107.672 E.01835
G1 X129.046 Y107.65 E.01203
M204 S10000
; WIPE_START
G1 F24000
G1 X129.205 Y107.642 E-.06029
G1 X129.841 Y107.736 E-.24429
G1 X130.395 Y107.957 E-.22689
G1 X130.889 Y108.292 E-.22689
G1 X130.892 Y108.295 E-.00163
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I-1.215 J.071 P1  F30000
G1 X131.131 Y112.377 Z6
G1 Z5.6
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X131.109 Y112.404 E.00106
G1 X130.679 Y112.757 E.0171
G1 X130.188 Y113.019 E.0171
G1 X129.656 Y113.181 E.0171
G1 X129.102 Y113.235 E.0171
G1 X128.548 Y113.181 E.0171
G1 X128.015 Y113.019 E.0171
G1 X127.525 Y112.757 E.0171
G1 X127.094 Y112.404 E.0171
G1 X126.741 Y111.974 E.0171
G1 X126.479 Y111.483 E.0171
G1 X126.317 Y110.95 E.0171
G1 X126.263 Y110.396 E.0171
G1 X126.317 Y109.843 E.0171
G1 X126.479 Y109.31 E.0171
G1 X126.741 Y108.819 E.0171
M73 P91 R1
G1 X127.094 Y108.389 E.0171
G1 X127.525 Y108.036 E.0171
G1 X128.015 Y107.773 E.0171
G1 X128.548 Y107.612 E.0171
G1 X129.102 Y107.557 E.0171
G1 X129.65 Y107.611 E.01694
G1 X130.188 Y107.773 E.01726
G1 X130.679 Y108.036 E.0171
G1 X131.109 Y108.389 E.0171
G1 X131.462 Y108.819 E.0171
G1 X131.725 Y109.31 E.0171
G1 X131.886 Y109.843 E.0171
G1 X131.941 Y110.396 E.0171
G1 X131.886 Y110.95 E.0171
G1 X131.725 Y111.483 E.0171
G1 X131.462 Y111.974 E.0171
G1 X131.169 Y112.331 E.0142
M204 S10000
; WIPE_START
G1 F24000
G1 X131.109 Y112.404 E-.03585
G1 X130.679 Y112.757 E-.21148
G1 X130.188 Y113.019 E-.21149
G1 X129.656 Y113.181 E-.21148
G1 X129.421 Y113.204 E-.0897
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I-1.216 J.059 P1  F30000
G1 X130.004 Y125.251 Z6
G1 Z5.6
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X130.103 Y125.245 E.00303
G1 X130.739 Y125.339 E.01975
G1 X131.293 Y125.56 E.01835
G1 X131.788 Y125.895 E.01835
G1 X132.198 Y126.329 E.01835
G1 X132.506 Y126.841 E.01835
G1 X132.697 Y127.406 E.01835
G1 X132.761 Y128 E.01835
G1 X132.697 Y128.594 E.01835
G1 X132.506 Y129.159 E.01835
G1 X132.198 Y129.671 E.01835
G1 X131.788 Y130.105 E.01835
G1 X131.293 Y130.44 E.01835
G1 X130.739 Y130.661 E.01835
G1 X130.149 Y130.757 E.01835
G1 X129.553 Y130.725 E.01835
G1 X128.978 Y130.565 E.01835
G1 X128.45 Y130.285 E.01835
G1 X127.995 Y129.899 E.01835
G1 X127.634 Y129.424 E.01835
G1 X127.383 Y128.882 E.01835
G1 X127.255 Y128.299 E.01835
G1 X127.255 Y127.701 E.01835
G1 X127.383 Y127.118 E.01835
G1 X127.634 Y126.576 E.01835
G1 X127.995 Y126.101 E.01835
G1 X128.45 Y125.715 E.01835
G1 X128.978 Y125.435 E.01835
G1 X129.553 Y125.275 E.01835
G1 X129.944 Y125.254 E.01203
M204 S10000
; WIPE_START
G1 F24000
G1 X130.103 Y125.245 E-.06029
G1 X130.739 Y125.339 E-.24429
G1 X131.293 Y125.56 E-.22689
G1 X131.788 Y125.895 E-.22689
G1 X131.791 Y125.899 E-.00163
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I-1.215 J.071 P1  F30000
G1 X132.029 Y129.981 Z6
G1 Z5.6
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X132.007 Y130.007 E.00106
G1 X131.577 Y130.361 E.0171
G1 X131.086 Y130.623 E.0171
G1 X130.554 Y130.784 E.0171
G1 X130 Y130.839 E.0171
G1 X129.446 Y130.784 E.0171
G1 X128.914 Y130.623 E.0171
G1 X128.423 Y130.361 E.0171
G1 X127.993 Y130.007 E.0171
G1 X127.639 Y129.577 E.0171
G1 X127.377 Y129.086 E.0171
G1 X127.216 Y128.554 E.0171
G1 X127.161 Y128 E.0171
G1 X127.216 Y127.446 E.0171
G1 X127.377 Y126.914 E.0171
G1 X127.639 Y126.423 E.0171
G1 X127.993 Y125.993 E.0171
G1 X128.423 Y125.639 E.0171
G1 X128.914 Y125.377 E.0171
G1 X129.446 Y125.216 E.0171
G1 X130 Y125.161 E.0171
G1 X130.549 Y125.215 E.01694
G1 X131.086 Y125.377 E.01726
G1 X131.577 Y125.639 E.0171
G1 X132.007 Y125.993 E.0171
G1 X132.361 Y126.423 E.0171
G1 X132.623 Y126.914 E.0171
G1 X132.784 Y127.446 E.0171
G1 X132.839 Y128 E.0171
G1 X132.784 Y128.554 E.0171
G1 X132.623 Y129.086 E.0171
G1 X132.361 Y129.577 E.0171
G1 X132.067 Y129.935 E.0142
M204 S10000
; WIPE_START
G1 F24000
G1 X132.007 Y130.007 E-.03585
G1 X131.577 Y130.361 E-.21148
G1 X131.086 Y130.623 E-.21149
G1 X130.554 Y130.784 E-.21148
G1 X130.319 Y130.808 E-.0897
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I-.32 J-1.174 P1  F30000
G1 X109.043 Y136.607 Z6
G1 Z5.6
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X109.525 Y136.581 E.01482
G1 X110.114 Y136.678 E.01835
G1 X110.669 Y136.899 E.01835
G1 X111.163 Y137.234 E.01835
G1 X111.574 Y137.667 E.01835
G1 X111.881 Y138.179 E.01835
G1 X112.072 Y138.745 E.01835
G1 X112.137 Y139.339 E.01835
G1 X112.072 Y139.932 E.01835
G1 X111.881 Y140.498 E.01835
G1 X111.574 Y141.01 E.01835
G1 X111.5 Y141.088 E.00331
G1 X111.163 Y141.443 E.01504
G1 X110.669 Y141.778 E.01835
G1 X110.114 Y141.999 E.01835
G1 X109.525 Y142.096 E.01835
G1 X108.929 Y142.063 E.01835
G1 X108.353 Y141.904 E.01835
G1 X107.826 Y141.624 E.01835
G1 X107.453 Y141.307 E.01504
G1 X107.371 Y141.237 E.00331
G1 X107.009 Y140.762 E.01835
G1 X106.759 Y140.22 E.01835
G1 X106.63 Y139.637 E.01835
G1 X106.63 Y139.04 E.01835
G1 X106.759 Y138.457 E.01835
G1 X107.009 Y137.915 E.01835
G1 X107.371 Y137.44 E.01835
G1 X107.826 Y137.053 E.01835
G1 X108.353 Y136.773 E.01835
G1 X108.929 Y136.614 E.01835
G1 X108.983 Y136.611 E.00168
M204 S10000
; WIPE_START
G1 F24000
G1 X109.525 Y136.581 E-.20613
G1 X110.114 Y136.678 E-.22689
G1 X110.669 Y136.899 E-.22689
G1 X110.887 Y137.047 E-.10009
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I-1.209 J.14 P1  F30000
G1 X111.385 Y141.344 Z6
G1 Z5.6
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X111.383 Y141.346 E.00009
G1 X110.953 Y141.699 E.0171
G1 X110.462 Y141.961 E.0171
G1 X109.929 Y142.123 E.0171
G1 X109.375 Y142.177 E.0171
G1 X108.822 Y142.123 E.0171
G1 X108.289 Y141.961 E.0171
G1 X107.798 Y141.699 E.0171
G1 X107.368 Y141.346 E.0171
G1 X107.015 Y140.916 E.0171
G1 X106.752 Y140.425 E.0171
G1 X106.591 Y139.892 E.0171
G1 X106.536 Y139.339 E.0171
G1 X106.591 Y138.785 E.0171
G1 X106.752 Y138.252 E.0171
G1 X107.015 Y137.761 E.0171
G1 X107.368 Y137.331 E.0171
G1 X107.798 Y136.978 E.0171
G1 X108.289 Y136.716 E.0171
G1 X108.822 Y136.554 E.0171
G1 X109.375 Y136.5 E.0171
G1 X109.446 Y136.507 E.00219
G1 X109.929 Y136.554 E.01491
G1 X110.462 Y136.716 E.0171
G1 X110.953 Y136.978 E.0171
G1 X111.383 Y137.331 E.0171
G1 X111.736 Y137.761 E.0171
G1 X111.998 Y138.252 E.0171
G1 X112.16 Y138.785 E.0171
G1 X112.214 Y139.339 E.0171
G1 X112.16 Y139.892 E.0171
G1 X111.998 Y140.425 E.0171
G1 X111.736 Y140.916 E.0171
G1 X111.423 Y141.297 E.01517
M204 S10000
; WIPE_START
G1 F24000
G1 X111.383 Y141.346 E-.02393
G1 X110.953 Y141.699 E-.21149
G1 X110.462 Y141.961 E-.21148
G1 X109.929 Y142.123 E-.21148
G1 X109.663 Y142.149 E-.10161
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I1.217 J-.028 P1  F30000
G1 X109.084 Y116.603 Z6
G1 Z5.6
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X109.566 Y116.577 E.01482
G1 X110.155 Y116.673 E.01835
G1 X110.71 Y116.894 E.01835
G1 X111.204 Y117.229 E.01835
G1 X111.615 Y117.663 E.01835
G1 X111.923 Y118.174 E.01835
G1 X112.113 Y118.74 E.01835
G1 X112.178 Y119.334 E.01835
G1 X112.113 Y119.927 E.01835
G1 X111.923 Y120.493 E.01835
G1 X111.615 Y121.005 E.01835
G1 X111.541 Y121.083 E.00331
G1 X111.204 Y121.438 E.01504
G1 X110.71 Y121.773 E.01835
G1 X110.155 Y121.994 E.01835
G1 X109.566 Y122.091 E.01835
G1 X108.97 Y122.059 E.01835
G1 X108.394 Y121.899 E.01835
G1 X107.867 Y121.619 E.01835
G1 X107.494 Y121.302 E.01504
M73 P91 R0
G1 X107.412 Y121.233 E.00331
G1 X107.051 Y120.757 E.01835
G1 X106.8 Y120.215 E.01835
G1 X106.671 Y119.632 E.01835
G1 X106.671 Y119.035 E.01835
G1 X106.8 Y118.452 E.01835
G1 X107.051 Y117.91 E.01835
G1 X107.412 Y117.435 E.01835
G1 X107.867 Y117.048 E.01835
G1 X108.394 Y116.769 E.01835
G1 X108.97 Y116.609 E.01835
G1 X109.024 Y116.606 E.00168
M204 S10000
; WIPE_START
G1 F24000
G1 X109.566 Y116.577 E-.20613
G1 X110.155 Y116.673 E-.22689
G1 X110.71 Y116.894 E-.22689
G1 X110.928 Y117.042 E-.10009
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I-1.209 J.14 P1  F30000
G1 X111.426 Y121.339 Z6
G1 Z5.6
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X111.424 Y121.341 E.00009
G1 X110.994 Y121.694 E.0171
G1 X110.503 Y121.957 E.0171
G1 X109.97 Y122.118 E.0171
G1 X109.417 Y122.173 E.0171
G1 X108.863 Y122.118 E.0171
G1 X108.33 Y121.957 E.0171
G1 X107.839 Y121.694 E.0171
G1 X107.409 Y121.341 E.0171
G1 X107.056 Y120.911 E.0171
G1 X106.794 Y120.42 E.0171
G1 X106.632 Y119.888 E.0171
G1 X106.578 Y119.334 E.0171
G1 X106.632 Y118.78 E.0171
G1 X106.794 Y118.247 E.0171
G1 X107.056 Y117.757 E.0171
G1 X107.409 Y117.326 E.0171
G1 X107.839 Y116.973 E.0171
G1 X108.33 Y116.711 E.0171
G1 X108.863 Y116.549 E.0171
G1 X109.417 Y116.495 E.0171
G1 X109.487 Y116.502 E.00219
G1 X109.97 Y116.549 E.01491
G1 X110.503 Y116.711 E.0171
G1 X110.994 Y116.973 E.0171
G1 X111.424 Y117.326 E.0171
G1 X111.777 Y117.757 E.0171
G1 X112.039 Y118.247 E.0171
G1 X112.201 Y118.78 E.0171
G1 X112.256 Y119.334 E.0171
G1 X112.201 Y119.888 E.0171
G1 X112.039 Y120.42 E.0171
G1 X111.777 Y120.911 E.0171
G1 X111.464 Y121.293 E.01517
M204 S10000
; WIPE_START
G1 F24000
G1 X111.424 Y121.341 E-.02393
G1 X110.994 Y121.694 E-.21149
G1 X110.503 Y121.957 E-.21148
G1 X109.97 Y122.118 E-.21148
G1 X109.704 Y122.144 E-.10161
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I1.216 J-.044 P1  F30000
G1 X108.79 Y96.826 Z6
G1 Z5.6
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X109.272 Y96.8 E.01482
G1 X109.861 Y96.897 E.01835
G1 X110.416 Y97.118 E.01835
G1 X110.91 Y97.453 E.01835
G1 X111.321 Y97.886 E.01835
G1 X111.628 Y98.398 E.01835
G1 X111.819 Y98.964 E.01835
G1 X111.884 Y99.557 E.01835
G1 X111.819 Y100.151 E.01835
G1 X111.628 Y100.717 E.01835
G1 X111.321 Y101.228 E.01835
G1 X111.247 Y101.307 E.00331
G1 X110.91 Y101.662 E.01504
G1 X110.416 Y101.997 E.01835
G1 X109.861 Y102.218 E.01835
G1 X109.272 Y102.315 E.01835
G1 X108.676 Y102.282 E.01835
G1 X108.1 Y102.122 E.01835
G1 X107.573 Y101.843 E.01835
G1 X107.2 Y101.526 E.01504
G1 X107.118 Y101.456 E.00331
G1 X106.756 Y100.981 E.01835
G1 X106.506 Y100.439 E.01835
G1 X106.377 Y99.856 E.01835
G1 X106.377 Y99.259 E.01835
G1 X106.506 Y98.676 E.01835
G1 X106.756 Y98.134 E.01835
G1 X107.118 Y97.658 E.01835
G1 X107.573 Y97.272 E.01835
G1 X108.1 Y96.992 E.01835
G1 X108.676 Y96.832 E.01835
G1 X108.73 Y96.83 E.00168
M204 S10000
; WIPE_START
G1 F24000
G1 X109.272 Y96.8 E-.20613
G1 X109.861 Y96.897 E-.22689
G1 X110.416 Y97.118 E-.22689
G1 X110.634 Y97.266 E-.10009
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I-1.209 J.14 P1  F30000
G1 X111.132 Y101.563 Z6
G1 Z5.6
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X111.13 Y101.565 E.00009
G1 X110.7 Y101.918 E.0171
G1 X110.209 Y102.18 E.0171
G1 X109.676 Y102.342 E.0171
G1 X109.122 Y102.396 E.0171
G1 X108.569 Y102.342 E.0171
G1 X108.036 Y102.18 E.0171
G1 X107.545 Y101.918 E.0171
G1 X107.115 Y101.565 E.0171
G1 X106.762 Y101.135 E.0171
G1 X106.5 Y100.644 E.0171
G1 X106.338 Y100.111 E.0171
G1 X106.283 Y99.557 E.0171
G1 X106.338 Y99.003 E.0171
G1 X106.5 Y98.471 E.0171
G1 X106.762 Y97.98 E.0171
G1 X107.115 Y97.55 E.0171
G1 X107.545 Y97.197 E.0171
G1 X108.036 Y96.934 E.0171
G1 X108.569 Y96.773 E.0171
G1 X109.122 Y96.718 E.0171
G1 X109.193 Y96.725 E.00219
G1 X109.676 Y96.773 E.01491
G1 X110.209 Y96.934 E.0171
G1 X110.7 Y97.197 E.0171
G1 X111.13 Y97.55 E.0171
G1 X111.483 Y97.98 E.0171
G1 X111.745 Y98.471 E.0171
G1 X111.907 Y99.003 E.0171
G1 X111.961 Y99.557 E.0171
G1 X111.907 Y100.111 E.0171
G1 X111.745 Y100.644 E.0171
G1 X111.483 Y101.135 E.0171
G1 X111.17 Y101.516 E.01517
M204 S10000
; WIPE_START
G1 F24000
G1 X111.13 Y101.565 E-.02393
G1 X110.7 Y101.918 E-.21149
G1 X110.209 Y102.18 E-.21148
G1 X109.676 Y102.342 E-.21148
G1 X109.41 Y102.368 E-.10161
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I1.215 J-.06 P1  F30000
G1 X108.008 Y74.011 Z6
G1 Z5.6
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X108.49 Y73.985 E.01482
G1 X109.079 Y74.081 E.01835
G1 X109.634 Y74.302 E.01835
G1 X110.128 Y74.637 E.01835
G1 X110.538 Y75.071 E.01835
G1 X110.846 Y75.582 E.01835
G1 X111.037 Y76.148 E.01835
G1 X111.102 Y76.742 E.01835
G1 X111.037 Y77.335 E.01835
G1 X110.846 Y77.901 E.01835
G1 X110.538 Y78.413 E.01835
G1 X110.464 Y78.491 E.00331
G1 X110.128 Y78.846 E.01504
G1 X109.634 Y79.181 E.01835
G1 X109.079 Y79.402 E.01835
G1 X108.49 Y79.499 E.01835
G1 X107.894 Y79.467 E.01835
G1 X107.318 Y79.307 E.01835
G1 X106.791 Y79.027 E.01835
G1 X106.418 Y78.71 E.01504
G1 X106.336 Y78.641 E.00331
G1 X105.974 Y78.165 E.01835
G1 X105.724 Y77.623 E.01835
G1 X105.595 Y77.04 E.01835
G1 X105.595 Y76.443 E.01835
G1 X105.724 Y75.86 E.01835
G1 X105.974 Y75.318 E.01835
G1 X106.336 Y74.843 E.01835
G1 X106.791 Y74.456 E.01835
G1 X107.318 Y74.177 E.01835
G1 X107.894 Y74.017 E.01835
G1 X107.948 Y74.014 E.00168
M204 S10000
; WIPE_START
G1 F24000
G1 X108.49 Y73.985 E-.20613
G1 X109.079 Y74.081 E-.22689
G1 X109.634 Y74.302 E-.22689
G1 X109.852 Y74.45 E-.10009
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I-1.209 J.14 P1  F30000
G1 X110.35 Y78.747 Z6
G1 Z5.6
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X110.348 Y78.749 E.00009
G1 X109.918 Y79.102 E.0171
G1 X109.427 Y79.365 E.0171
G1 X108.894 Y79.526 E.0171
G1 X108.34 Y79.581 E.0171
G1 X107.786 Y79.526 E.0171
M73 P92 R0
G1 X107.254 Y79.365 E.0171
G1 X106.763 Y79.102 E.0171
G1 X106.333 Y78.749 E.0171
G1 X105.98 Y78.319 E.0171
G1 X105.717 Y77.828 E.0171
G1 X105.556 Y77.296 E.0171
G1 X105.501 Y76.742 E.0171
G1 X105.556 Y76.188 E.0171
G1 X105.717 Y75.655 E.0171
G1 X105.98 Y75.164 E.0171
G1 X106.333 Y74.734 E.0171
G1 X106.763 Y74.381 E.0171
G1 X107.254 Y74.119 E.0171
G1 X107.786 Y73.957 E.0171
G1 X108.34 Y73.903 E.0171
G1 X108.411 Y73.91 E.00219
G1 X108.894 Y73.957 E.01491
G1 X109.427 Y74.119 E.0171
G1 X109.918 Y74.381 E.0171
G1 X110.348 Y74.734 E.0171
G1 X110.701 Y75.164 E.0171
G1 X110.963 Y75.655 E.0171
G1 X111.125 Y76.188 E.0171
G1 X111.179 Y76.742 E.0171
G1 X111.125 Y77.296 E.0171
G1 X110.963 Y77.828 E.0171
G1 X110.701 Y78.319 E.0171
G1 X110.388 Y78.701 E.01517
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 5.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X110.348 Y78.749 E-.02393
G1 X109.918 Y79.102 E-.21149
G1 X109.427 Y79.365 E-.21148
G1 X108.894 Y79.526 E-.21148
G1 X108.628 Y79.552 E-.10161
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 29/32
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
G3 Z6 I-.344 J1.167 P1  F30000
G1 X129.351 Y85.667 Z6
G1 Z5.8
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X129.495 Y85.66 E.00441
G1 X130.084 Y85.756 E.01835
G1 X130.639 Y85.977 E.01835
G1 X131.133 Y86.312 E.01835
G1 X131.543 Y86.746 E.01835
G1 X131.851 Y87.257 E.01835
G1 X132.042 Y87.823 E.01835
G1 X132.106 Y88.417 E.01835
G1 X132.042 Y89.01 E.01835
G1 X131.851 Y89.576 E.01835
G1 X131.543 Y90.088 E.01835
G1 X131.133 Y90.521 E.01835
G1 X130.639 Y90.856 E.01835
G1 X130.084 Y91.077 E.01835
G1 X129.495 Y91.174 E.01835
G1 X128.898 Y91.142 E.01835
G1 X128.323 Y90.982 E.01835
G1 X127.796 Y90.702 E.01835
G1 X127.341 Y90.316 E.01835
G1 X126.979 Y89.84 E.01835
G1 X126.728 Y89.298 E.01835
G1 X126.6 Y88.715 E.01835
G1 X126.6 Y88.118 E.01835
G1 X126.728 Y87.535 E.01835
G1 X126.979 Y86.993 E.01835
G1 X127.341 Y86.518 E.01835
G1 X127.796 Y86.131 E.01835
G1 X128.323 Y85.852 E.01835
G1 X128.898 Y85.692 E.01835
G1 X129.292 Y85.671 E.0121
M204 S10000
; WIPE_START
G1 F24000
G1 X129.495 Y85.66 E-.0773
G1 X130.084 Y85.756 E-.22689
G1 X130.639 Y85.977 E-.22689
G1 X131.133 Y86.312 E-.22689
G1 X131.136 Y86.316 E-.00203
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I-1.215 J.072 P1  F30000
G1 X131.377 Y90.395 Z6.2
G1 Z5.8
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X131.353 Y90.424 E.00118
G1 X130.922 Y90.777 E.0171
G1 X130.432 Y91.04 E.0171
G1 X129.899 Y91.201 E.0171
G1 X129.345 Y91.256 E.0171
G1 X128.791 Y91.201 E.0171
G1 X128.259 Y91.04 E.0171
G1 X127.768 Y90.777 E.0171
G1 X127.338 Y90.424 E.0171
G1 X126.985 Y89.994 E.0171
G1 X126.722 Y89.503 E.0171
G1 X126.561 Y88.971 E.0171
G1 X126.506 Y88.417 E.0171
G1 X126.561 Y87.863 E.0171
G1 X126.722 Y87.33 E.0171
G1 X126.985 Y86.839 E.0171
G1 X127.338 Y86.409 E.0171
G1 X127.768 Y86.056 E.0171
G1 X128.259 Y85.794 E.0171
G1 X128.791 Y85.632 E.0171
G1 X129.345 Y85.578 E.0171
G1 X129.894 Y85.632 E.01695
G1 X130.432 Y85.794 E.01726
G1 X130.922 Y86.056 E.0171
G1 X131.353 Y86.409 E.0171
G1 X131.706 Y86.839 E.0171
G1 X131.968 Y87.33 E.0171
G1 X132.13 Y87.863 E.0171
G1 X132.184 Y88.417 E.0171
G1 X132.13 Y88.971 E.0171
G1 X131.968 Y89.503 E.0171
G1 X131.706 Y89.994 E.0171
G1 X131.415 Y90.348 E.01408
M204 S10000
; WIPE_START
G1 F24000
G1 X131.353 Y90.424 E-.03736
G1 X130.922 Y90.777 E-.21148
G1 X130.432 Y91.04 E-.21148
G1 X129.899 Y91.201 E-.21149
G1 X129.668 Y91.224 E-.08818
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I-1.216 J-.041 P1  F30000
G1 X129.108 Y107.647 Z6.2
G1 Z5.8
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X129.251 Y107.639 E.00441
G1 X129.841 Y107.736 E.01835
G1 X130.395 Y107.957 E.01835
G1 X130.889 Y108.292 E.01835
G1 X131.3 Y108.725 E.01835
G1 X131.608 Y109.237 E.01835
G1 X131.798 Y109.803 E.01835
G1 X131.863 Y110.396 E.01835
G1 X131.798 Y110.99 E.01835
G1 X131.608 Y111.556 E.01835
G1 X131.3 Y112.067 E.01835
G1 X130.889 Y112.501 E.01835
G1 X130.395 Y112.836 E.01835
G1 X129.841 Y113.057 E.01835
G1 X129.251 Y113.154 E.01835
G1 X128.655 Y113.121 E.01835
G1 X128.08 Y112.961 E.01835
G1 X127.552 Y112.682 E.01835
G1 X127.097 Y112.295 E.01835
G1 X126.736 Y111.82 E.01835
G1 X126.485 Y111.278 E.01835
G1 X126.357 Y110.695 E.01835
G1 X126.357 Y110.098 E.01835
G1 X126.485 Y109.515 E.01835
G1 X126.736 Y108.973 E.01835
G1 X127.097 Y108.497 E.01835
G1 X127.552 Y108.111 E.01835
G1 X128.08 Y107.831 E.01835
G1 X128.655 Y107.672 E.01835
G1 X129.048 Y107.65 E.0121
M204 S10000
; WIPE_START
G1 F24000
G1 X129.251 Y107.639 E-.0773
G1 X129.841 Y107.736 E-.22689
G1 X130.395 Y107.957 E-.22689
G1 X130.889 Y108.292 E-.22689
G1 X130.893 Y108.296 E-.00203
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I-1.215 J.072 P1  F30000
G1 X131.134 Y112.374 Z6.2
G1 Z5.8
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X131.109 Y112.404 E.00118
G1 X130.679 Y112.757 E.0171
G1 X130.188 Y113.019 E.0171
G1 X129.656 Y113.181 E.0171
G1 X129.102 Y113.235 E.0171
G1 X128.548 Y113.181 E.0171
G1 X128.015 Y113.019 E.0171
G1 X127.525 Y112.757 E.0171
G1 X127.094 Y112.404 E.0171
G1 X126.741 Y111.974 E.0171
G1 X126.479 Y111.483 E.0171
G1 X126.317 Y110.95 E.0171
G1 X126.263 Y110.396 E.0171
G1 X126.317 Y109.843 E.0171
G1 X126.479 Y109.31 E.0171
G1 X126.741 Y108.819 E.0171
G1 X127.094 Y108.389 E.0171
G1 X127.525 Y108.036 E.0171
G1 X128.015 Y107.773 E.0171
G1 X128.548 Y107.612 E.0171
G1 X129.102 Y107.557 E.0171
G1 X129.651 Y107.611 E.01695
G1 X130.188 Y107.774 E.01726
G1 X130.679 Y108.036 E.0171
G1 X131.109 Y108.389 E.0171
G1 X131.462 Y108.819 E.0171
G1 X131.725 Y109.31 E.0171
G1 X131.886 Y109.843 E.0171
G1 X131.941 Y110.396 E.0171
G1 X131.886 Y110.95 E.0171
G1 X131.725 Y111.483 E.0171
G1 X131.462 Y111.974 E.0171
G1 X131.172 Y112.328 E.01408
M204 S10000
; WIPE_START
G1 F24000
G1 X131.109 Y112.404 E-.03736
G1 X130.679 Y112.757 E-.21148
G1 X130.188 Y113.019 E-.21148
G1 X129.656 Y113.181 E-.21149
G1 X129.425 Y113.204 E-.08818
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I-1.216 J.059 P1  F30000
G1 X130.006 Y125.251 Z6.2
G1 Z5.8
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X130.149 Y125.243 E.00441
G1 X130.739 Y125.339 E.01835
G1 X131.293 Y125.56 E.01835
G1 X131.788 Y125.895 E.01835
G1 X132.198 Y126.329 E.01835
G1 X132.506 Y126.841 E.01835
G1 X132.697 Y127.406 E.01835
G1 X132.761 Y128 E.01835
G1 X132.697 Y128.594 E.01835
G1 X132.506 Y129.159 E.01835
G1 X132.198 Y129.671 E.01835
G1 X131.788 Y130.105 E.01835
G1 X131.293 Y130.44 E.01835
G1 X130.739 Y130.661 E.01835
G1 X130.149 Y130.757 E.01835
G1 X129.553 Y130.725 E.01835
G1 X128.978 Y130.565 E.01835
G1 X128.45 Y130.285 E.01835
G1 X127.995 Y129.899 E.01835
G1 X127.634 Y129.424 E.01835
G1 X127.383 Y128.882 E.01835
G1 X127.255 Y128.299 E.01835
G1 X127.255 Y127.701 E.01835
G1 X127.383 Y127.118 E.01835
G1 X127.634 Y126.576 E.01835
G1 X127.995 Y126.101 E.01835
G1 X128.45 Y125.715 E.01835
G1 X128.978 Y125.435 E.01835
G1 X129.553 Y125.275 E.01835
G1 X129.946 Y125.254 E.0121
M204 S10000
; WIPE_START
G1 F24000
G1 X130.149 Y125.243 E-.0773
G1 X130.739 Y125.339 E-.22689
G1 X131.293 Y125.56 E-.22689
G1 X131.788 Y125.895 E-.22689
G1 X131.791 Y125.899 E-.00203
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I-1.215 J.072 P1  F30000
G1 X132.032 Y129.978 Z6.2
G1 Z5.8
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X132.007 Y130.007 E.00118
G1 X131.577 Y130.361 E.0171
G1 X131.086 Y130.623 E.0171
G1 X130.554 Y130.784 E.0171
G1 X130 Y130.839 E.0171
G1 X129.446 Y130.784 E.0171
G1 X128.914 Y130.623 E.0171
G1 X128.423 Y130.361 E.0171
G1 X127.993 Y130.007 E.0171
G1 X127.639 Y129.577 E.0171
G1 X127.377 Y129.086 E.0171
G1 X127.216 Y128.554 E.0171
G1 X127.161 Y128 E.0171
G1 X127.216 Y127.446 E.0171
G1 X127.377 Y126.914 E.0171
G1 X127.639 Y126.423 E.0171
G1 X127.993 Y125.993 E.0171
G1 X128.423 Y125.639 E.0171
G1 X128.914 Y125.377 E.0171
G1 X129.446 Y125.216 E.0171
G1 X130 Y125.161 E.0171
G1 X130.549 Y125.215 E.01695
G1 X131.087 Y125.377 E.01726
G1 X131.577 Y125.639 E.0171
G1 X132.007 Y125.993 E.0171
G1 X132.361 Y126.423 E.0171
G1 X132.623 Y126.914 E.0171
G1 X132.784 Y127.446 E.0171
G1 X132.839 Y128 E.0171
G1 X132.784 Y128.554 E.0171
G1 X132.623 Y129.086 E.0171
G1 X132.361 Y129.577 E.0171
G1 X132.07 Y129.931 E.01408
M204 S10000
; WIPE_START
G1 F24000
G1 X132.007 Y130.007 E-.03736
G1 X131.577 Y130.361 E-.21148
G1 X131.086 Y130.623 E-.21148
G1 X130.554 Y130.784 E-.21149
G1 X130.323 Y130.807 E-.08818
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I-.32 J-1.174 P1  F30000
G1 X109.028 Y136.608 Z6.2
G1 Z5.8
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X109.525 Y136.581 E.01529
G1 X110.114 Y136.678 E.01835
G1 X110.669 Y136.899 E.01835
G1 X111.163 Y137.234 E.01835
G1 X111.574 Y137.667 E.01835
G1 X111.881 Y138.179 E.01835
G1 X112.072 Y138.745 E.01835
G1 X112.137 Y139.339 E.01835
G1 X112.072 Y139.932 E.01835
G1 X111.881 Y140.498 E.01835
G1 X111.574 Y141.01 E.01835
G1 X111.511 Y141.075 E.00279
G1 X111.163 Y141.443 E.01556
G1 X110.669 Y141.778 E.01835
G1 X110.114 Y141.999 E.01835
G1 X109.525 Y142.096 E.01835
G1 X108.929 Y142.063 E.01835
G1 X108.353 Y141.904 E.01835
G1 X107.826 Y141.624 E.01835
G1 X107.371 Y141.237 E.01835
G1 X107.009 Y140.762 E.01835
G1 X106.759 Y140.22 E.01835
G1 X106.63 Y139.637 E.01835
G1 X106.63 Y139.04 E.01835
G1 X106.759 Y138.457 E.01835
G1 X107.009 Y137.915 E.01835
G1 X107.371 Y137.44 E.01835
G1 X107.826 Y137.053 E.01835
G1 X108.353 Y136.773 E.01835
G1 X108.929 Y136.614 E.01835
G1 X108.968 Y136.612 E.00122
M204 S10000
; WIPE_START
G1 F24000
G1 X109.525 Y136.581 E-.21183
G1 X110.114 Y136.678 E-.22689
G1 X110.669 Y136.899 E-.22689
G1 X110.874 Y137.038 E-.09438
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I-1.208 J.143 P1  F30000
G1 X111.385 Y141.343 Z6.2
G1 Z5.8
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X111.383 Y141.346 E.0001
G1 X110.953 Y141.699 E.0171
G1 X110.462 Y141.961 E.0171
G1 X109.929 Y142.123 E.0171
G1 X109.375 Y142.177 E.0171
G1 X108.822 Y142.123 E.0171
G1 X108.289 Y141.961 E.0171
G1 X107.798 Y141.699 E.0171
G1 X107.368 Y141.346 E.0171
G1 X107.015 Y140.916 E.0171
G1 X106.752 Y140.425 E.0171
G1 X106.591 Y139.892 E.0171
G1 X106.536 Y139.339 E.0171
G1 X106.591 Y138.785 E.0171
G1 X106.752 Y138.252 E.0171
G1 X107.015 Y137.761 E.0171
G1 X107.368 Y137.331 E.0171
G1 X107.798 Y136.978 E.0171
G1 X108.289 Y136.716 E.0171
G1 X108.822 Y136.554 E.0171
G1 X109.428 Y136.505 E.0187
G1 X109.929 Y136.554 E.01548
G1 X110.462 Y136.716 E.0171
G1 X110.953 Y136.978 E.0171
G1 X111.383 Y137.331 E.0171
G1 X111.736 Y137.761 E.0171
G1 X111.998 Y138.252 E.0171
G1 X112.16 Y138.785 E.0171
G1 X112.214 Y139.339 E.0171
G1 X112.16 Y139.892 E.0171
G1 X111.998 Y140.425 E.0171
G1 X111.736 Y140.916 E.0171
G1 X111.423 Y141.297 E.01516
M204 S10000
; WIPE_START
G1 F24000
G1 X111.383 Y141.346 E-.02404
G1 X110.953 Y141.699 E-.21149
G1 X110.462 Y141.961 E-.21148
G1 X109.929 Y142.123 E-.21148
G1 X109.663 Y142.149 E-.10151
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I1.217 J-.028 P1  F30000
G1 X109.069 Y116.604 Z6.2
G1 Z5.8
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X109.566 Y116.577 E.01529
G1 X110.155 Y116.673 E.01835
G1 X110.71 Y116.894 E.01835
G1 X111.204 Y117.229 E.01835
G1 X111.615 Y117.663 E.01835
G1 X111.923 Y118.174 E.01835
G1 X112.113 Y118.74 E.01835
G1 X112.178 Y119.334 E.01835
G1 X112.113 Y119.927 E.01835
G1 X111.923 Y120.493 E.01835
G1 X111.615 Y121.005 E.01835
G1 X111.552 Y121.071 E.00279
G1 X111.204 Y121.438 E.01556
G1 X110.71 Y121.773 E.01835
G1 X110.155 Y121.994 E.01835
G1 X109.566 Y122.091 E.01835
G1 X108.97 Y122.059 E.01835
G1 X108.394 Y121.899 E.01835
G1 X107.867 Y121.619 E.01835
G1 X107.412 Y121.233 E.01835
G1 X107.051 Y120.757 E.01835
G1 X106.8 Y120.215 E.01835
G1 X106.671 Y119.632 E.01835
G1 X106.671 Y119.035 E.01835
G1 X106.8 Y118.452 E.01835
G1 X107.051 Y117.91 E.01835
G1 X107.412 Y117.435 E.01835
G1 X107.867 Y117.048 E.01835
G1 X108.394 Y116.769 E.01835
G1 X108.97 Y116.609 E.01835
G1 X109.009 Y116.607 E.00122
M204 S10000
; WIPE_START
G1 F24000
G1 X109.566 Y116.577 E-.21183
G1 X110.155 Y116.673 E-.22689
G1 X110.71 Y116.894 E-.22689
G1 X110.915 Y117.034 E-.09438
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I-1.208 J.143 P1  F30000
M73 P93 R0
G1 X111.426 Y121.339 Z6.2
G1 Z5.8
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X111.424 Y121.341 E.0001
G1 X110.994 Y121.694 E.0171
G1 X110.503 Y121.957 E.0171
G1 X109.97 Y122.118 E.0171
G1 X109.417 Y122.173 E.0171
G1 X108.863 Y122.118 E.0171
G1 X108.33 Y121.957 E.0171
G1 X107.839 Y121.694 E.0171
G1 X107.409 Y121.341 E.0171
G1 X107.056 Y120.911 E.0171
G1 X106.794 Y120.42 E.0171
G1 X106.632 Y119.888 E.0171
G1 X106.578 Y119.334 E.0171
G1 X106.632 Y118.78 E.0171
G1 X106.794 Y118.247 E.0171
G1 X107.056 Y117.757 E.0171
G1 X107.409 Y117.326 E.0171
G1 X107.839 Y116.973 E.0171
G1 X108.33 Y116.711 E.0171
G1 X108.863 Y116.549 E.0171
G1 X109.469 Y116.5 E.0187
G1 X109.97 Y116.549 E.01548
G1 X110.503 Y116.711 E.0171
G1 X110.994 Y116.973 E.0171
G1 X111.424 Y117.326 E.0171
G1 X111.777 Y117.757 E.0171
G1 X112.039 Y118.247 E.0171
G1 X112.201 Y118.78 E.0171
G1 X112.256 Y119.334 E.0171
G1 X112.201 Y119.888 E.0171
G1 X112.039 Y120.42 E.0171
G1 X111.777 Y120.911 E.0171
G1 X111.464 Y121.292 E.01516
M204 S10000
; WIPE_START
G1 F24000
G1 X111.424 Y121.341 E-.02404
G1 X110.994 Y121.694 E-.21149
G1 X110.503 Y121.957 E-.21148
G1 X109.97 Y122.118 E-.21148
G1 X109.705 Y122.144 E-.10151
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I1.216 J-.045 P1  F30000
G1 X108.775 Y96.827 Z6.2
G1 Z5.8
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X109.272 Y96.8 E.01529
G1 X109.861 Y96.897 E.01835
G1 X110.416 Y97.118 E.01835
G1 X110.91 Y97.453 E.01835
G1 X111.321 Y97.886 E.01835
G1 X111.628 Y98.398 E.01835
G1 X111.819 Y98.964 E.01835
G1 X111.884 Y99.557 E.01835
G1 X111.819 Y100.151 E.01835
G1 X111.628 Y100.717 E.01835
G1 X111.321 Y101.228 E.01835
G1 X111.258 Y101.294 E.00279
G1 X110.91 Y101.662 E.01556
G1 X110.416 Y101.997 E.01835
G1 X109.861 Y102.218 E.01835
G1 X109.272 Y102.315 E.01835
G1 X108.676 Y102.282 E.01835
G1 X108.1 Y102.122 E.01835
G1 X107.573 Y101.843 E.01835
G1 X107.118 Y101.456 E.01835
G1 X106.756 Y100.981 E.01835
G1 X106.506 Y100.439 E.01835
G1 X106.377 Y99.856 E.01835
G1 X106.377 Y99.259 E.01835
G1 X106.506 Y98.676 E.01835
G1 X106.756 Y98.134 E.01835
G1 X107.118 Y97.658 E.01835
G1 X107.573 Y97.272 E.01835
G1 X108.1 Y96.992 E.01835
G1 X108.676 Y96.832 E.01835
G1 X108.715 Y96.83 E.00122
M204 S10000
; WIPE_START
G1 F24000
G1 X109.272 Y96.8 E-.21183
G1 X109.861 Y96.897 E-.22689
G1 X110.416 Y97.118 E-.22689
G1 X110.621 Y97.257 E-.09438
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I-1.208 J.143 P1  F30000
G1 X111.132 Y101.562 Z6.2
G1 Z5.8
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X111.13 Y101.565 E.0001
G1 X110.7 Y101.918 E.0171
G1 X110.209 Y102.18 E.0171
G1 X109.676 Y102.342 E.0171
G1 X109.122 Y102.396 E.0171
G1 X108.569 Y102.342 E.0171
G1 X108.036 Y102.18 E.0171
G1 X107.545 Y101.918 E.0171
G1 X107.115 Y101.565 E.0171
G1 X106.762 Y101.135 E.0171
G1 X106.5 Y100.644 E.0171
G1 X106.338 Y100.111 E.0171
G1 X106.283 Y99.557 E.0171
G1 X106.338 Y99.003 E.0171
G1 X106.5 Y98.471 E.0171
G1 X106.762 Y97.98 E.0171
G1 X107.115 Y97.55 E.0171
G1 X107.545 Y97.197 E.0171
G1 X108.036 Y96.934 E.0171
G1 X108.569 Y96.773 E.0171
G1 X109.175 Y96.724 E.0187
G1 X109.676 Y96.773 E.01548
G1 X110.209 Y96.934 E.0171
G1 X110.7 Y97.197 E.0171
G1 X111.13 Y97.55 E.0171
G1 X111.483 Y97.98 E.0171
G1 X111.745 Y98.471 E.0171
G1 X111.907 Y99.003 E.0171
G1 X111.961 Y99.557 E.0171
G1 X111.907 Y100.111 E.0171
G1 X111.745 Y100.644 E.0171
G1 X111.483 Y101.135 E.0171
G1 X111.17 Y101.516 E.01516
M204 S10000
; WIPE_START
G1 F24000
G1 X111.13 Y101.565 E-.02404
G1 X110.7 Y101.918 E-.21149
G1 X110.209 Y102.18 E-.21148
G1 X109.676 Y102.342 E-.21148
G1 X109.41 Y102.368 E-.10151
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I1.215 J-.061 P1  F30000
G1 X107.993 Y74.011 Z6.2
G1 Z5.8
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X108.49 Y73.985 E.01529
G1 X109.079 Y74.081 E.01835
G1 X109.634 Y74.302 E.01835
G1 X110.128 Y74.637 E.01835
G1 X110.538 Y75.071 E.01835
G1 X110.846 Y75.582 E.01835
G1 X111.037 Y76.148 E.01835
G1 X111.102 Y76.742 E.01835
G1 X111.037 Y77.335 E.01835
G1 X110.846 Y77.901 E.01835
G1 X110.538 Y78.413 E.01835
G1 X110.476 Y78.479 E.00279
G1 X110.128 Y78.846 E.01556
G1 X109.634 Y79.181 E.01835
G1 X109.079 Y79.402 E.01835
G1 X108.49 Y79.499 E.01835
G1 X107.894 Y79.467 E.01835
G1 X107.318 Y79.307 E.01835
G1 X106.791 Y79.027 E.01835
G1 X106.336 Y78.641 E.01835
G1 X105.974 Y78.165 E.01835
G1 X105.724 Y77.623 E.01835
G1 X105.595 Y77.04 E.01835
G1 X105.595 Y76.443 E.01835
G1 X105.724 Y75.86 E.01835
G1 X105.974 Y75.318 E.01835
G1 X106.336 Y74.843 E.01835
G1 X106.791 Y74.456 E.01835
G1 X107.318 Y74.177 E.01835
G1 X107.894 Y74.017 E.01835
G1 X107.933 Y74.015 E.00122
M204 S10000
; WIPE_START
G1 F24000
G1 X108.49 Y73.985 E-.21183
G1 X109.079 Y74.081 E-.22689
G1 X109.634 Y74.302 E-.22689
G1 X109.839 Y74.442 E-.09438
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I-1.208 J.143 P1  F30000
G1 X110.35 Y78.747 Z6.2
G1 Z5.8
G1 E.8 F1800
M204 S5000
G1 F2209
G1 X110.348 Y78.749 E.0001
G1 X109.918 Y79.102 E.0171
G1 X109.427 Y79.365 E.0171
G1 X108.894 Y79.526 E.0171
G1 X108.34 Y79.581 E.0171
G1 X107.786 Y79.526 E.0171
G1 X107.254 Y79.365 E.0171
G1 X106.763 Y79.102 E.0171
G1 X106.333 Y78.749 E.0171
G1 X105.98 Y78.319 E.0171
G1 X105.717 Y77.828 E.0171
G1 X105.556 Y77.296 E.0171
G1 X105.501 Y76.742 E.0171
G1 X105.556 Y76.188 E.0171
G1 X105.717 Y75.655 E.0171
G1 X105.98 Y75.164 E.0171
G1 X106.333 Y74.734 E.0171
G1 X106.763 Y74.381 E.0171
G1 X107.254 Y74.119 E.0171
G1 X107.786 Y73.957 E.0171
G1 X108.393 Y73.908 E.0187
G1 X108.894 Y73.957 E.01548
G1 X109.427 Y74.119 E.0171
G1 X109.918 Y74.381 E.0171
G1 X110.348 Y74.734 E.0171
G1 X110.701 Y75.164 E.0171
G1 X110.963 Y75.655 E.0171
G1 X111.125 Y76.188 E.0171
G1 X111.179 Y76.742 E.0171
G1 X111.125 Y77.296 E.0171
G1 X110.963 Y77.828 E.0171
G1 X110.701 Y78.319 E.0171
G1 X110.388 Y78.7 E.01516
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X110.348 Y78.749 E-.02404
G1 X109.918 Y79.102 E-.21149
G1 X109.427 Y79.365 E-.21148
G1 X108.894 Y79.526 E-.21148
G1 X108.628 Y79.552 E-.10151
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 30/32
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
G3 Z6.2 I-1.217 J.008 P1  F30000
G1 X109.014 Y136.609 Z6.2
G1 Z6
G1 E.8 F1800
M204 S5000
G1 F1202
G1 X109.525 Y136.581 E.01573
G1 X110.114 Y136.678 E.01835
G1 X110.669 Y136.899 E.01835
G1 X111.163 Y137.234 E.01835
G1 X111.574 Y137.667 E.01835
G1 X111.881 Y138.179 E.01835
G1 X112.072 Y138.745 E.01835
G1 X112.137 Y139.339 E.01835
G1 X112.072 Y139.932 E.01835
G1 X111.881 Y140.498 E.01835
G1 X111.574 Y141.01 E.01835
G1 X111.523 Y141.063 E.00227
G1 X111.163 Y141.443 E.01608
G1 X110.669 Y141.778 E.01835
G1 X110.114 Y141.999 E.01835
G1 X109.525 Y142.096 E.01835
G1 X108.929 Y142.063 E.01835
G1 X108.353 Y141.904 E.01835
G1 X107.826 Y141.624 E.01835
G1 X107.371 Y141.237 E.01835
G1 X107.009 Y140.762 E.01835
G1 X106.759 Y140.22 E.01835
G1 X106.63 Y139.637 E.01835
G1 X106.63 Y139.04 E.01835
G1 X106.759 Y138.457 E.01835
G1 X107.009 Y137.915 E.01835
G1 X107.371 Y137.44 E.01835
G1 X107.826 Y137.053 E.01835
G1 X108.353 Y136.773 E.01835
G1 X108.929 Y136.614 E.01835
G1 X108.954 Y136.612 E.00078
M204 S10000
; WIPE_START
G1 F24000
G1 X109.525 Y136.581 E-.2173
G1 X110.114 Y136.678 E-.22689
G1 X110.669 Y136.899 E-.22689
G1 X110.862 Y137.03 E-.08892
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I-1.208 J.146 P1  F30000
G1 X111.385 Y141.343 Z6.4
G1 Z6
G1 E.8 F1800
M204 S5000
G1 F1202
G1 X111.383 Y141.346 E.00011
G1 X110.953 Y141.699 E.0171
G1 X110.462 Y141.961 E.0171
G1 X109.929 Y142.123 E.0171
G1 X109.375 Y142.177 E.0171
G1 X108.822 Y142.123 E.0171
G1 X108.289 Y141.961 E.0171
G1 X107.798 Y141.699 E.0171
G1 X107.368 Y141.346 E.0171
G1 X107.015 Y140.916 E.0171
G1 X106.752 Y140.425 E.0171
G1 X106.591 Y139.892 E.0171
G1 X106.536 Y139.339 E.0171
G1 X106.591 Y138.785 E.0171
G1 X106.752 Y138.252 E.0171
G1 X107.015 Y137.761 E.0171
G1 X107.368 Y137.331 E.0171
G1 X107.798 Y136.978 E.0171
G1 X108.289 Y136.716 E.0171
G1 X108.822 Y136.554 E.0171
G1 X109.41 Y136.503 E.01814
G1 X109.929 Y136.554 E.01604
G1 X110.462 Y136.716 E.0171
G1 X110.953 Y136.978 E.0171
G1 X111.383 Y137.331 E.0171
G1 X111.736 Y137.761 E.0171
G1 X111.998 Y138.252 E.0171
G1 X112.16 Y138.785 E.0171
G1 X112.214 Y139.339 E.0171
G1 X112.16 Y139.892 E.0171
G1 X111.998 Y140.425 E.0171
G1 X111.736 Y140.916 E.0171
G1 X111.423 Y141.297 E.01515
M204 S10000
; WIPE_START
G1 F24000
G1 X111.383 Y141.346 E-.02414
G1 X110.953 Y141.699 E-.21149
G1 X110.462 Y141.961 E-.21148
G1 X109.929 Y142.123 E-.21149
G1 X109.664 Y142.149 E-.10141
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I1.217 J-.029 P1  F30000
G1 X109.055 Y116.604 Z6.4
G1 Z6
G1 E.8 F1800
M204 S5000
G1 F1202
G1 X109.566 Y116.577 E.01573
G1 X110.155 Y116.673 E.01835
G1 X110.71 Y116.894 E.01835
G1 X111.204 Y117.229 E.01835
G1 X111.615 Y117.663 E.01835
G1 X111.923 Y118.174 E.01835
G1 X112.113 Y118.74 E.01835
G1 X112.178 Y119.334 E.01835
G1 X112.113 Y119.927 E.01835
G1 X111.923 Y120.493 E.01835
G1 X111.615 Y121.005 E.01835
G1 X111.564 Y121.058 E.00227
G1 X111.204 Y121.438 E.01608
G1 X110.71 Y121.773 E.01835
G1 X110.155 Y121.994 E.01835
G1 X109.566 Y122.091 E.01835
G1 X108.97 Y122.059 E.01835
G1 X108.394 Y121.899 E.01835
G1 X107.867 Y121.619 E.01835
G1 X107.412 Y121.233 E.01835
G1 X107.051 Y120.757 E.01835
G1 X106.8 Y120.215 E.01835
G1 X106.671 Y119.632 E.01835
G1 X106.671 Y119.035 E.01835
G1 X106.8 Y118.452 E.01835
G1 X107.051 Y117.91 E.01835
G1 X107.412 Y117.435 E.01835
G1 X107.867 Y117.048 E.01835
G1 X108.394 Y116.769 E.01835
G1 X108.97 Y116.609 E.01835
G1 X108.995 Y116.608 E.00078
M204 S10000
; WIPE_START
G1 F24000
G1 X109.566 Y116.577 E-.2173
G1 X110.155 Y116.673 E-.22689
G1 X110.71 Y116.894 E-.22689
G1 X110.904 Y117.026 E-.08892
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I-1.208 J.146 P1  F30000
G1 X111.426 Y121.339 Z6.4
G1 Z6
G1 E.8 F1800
M204 S5000
G1 F1202
G1 X111.424 Y121.341 E.00011
G1 X110.994 Y121.694 E.0171
G1 X110.503 Y121.957 E.0171
G1 X109.97 Y122.118 E.0171
G1 X109.417 Y122.173 E.0171
G1 X108.863 Y122.118 E.0171
G1 X108.33 Y121.957 E.0171
G1 X107.839 Y121.694 E.0171
G1 X107.409 Y121.341 E.0171
G1 X107.056 Y120.911 E.0171
G1 X106.794 Y120.42 E.0171
G1 X106.632 Y119.888 E.0171
M73 P94 R0
G1 X106.578 Y119.334 E.0171
G1 X106.632 Y118.78 E.0171
G1 X106.794 Y118.247 E.0171
G1 X107.056 Y117.757 E.0171
G1 X107.409 Y117.326 E.0171
G1 X107.839 Y116.973 E.0171
G1 X108.33 Y116.711 E.0171
G1 X108.863 Y116.549 E.0171
G1 X109.451 Y116.498 E.01814
G1 X109.97 Y116.549 E.01604
G1 X110.503 Y116.711 E.0171
G1 X110.994 Y116.973 E.0171
G1 X111.424 Y117.326 E.0171
G1 X111.777 Y117.757 E.0171
G1 X112.039 Y118.247 E.0171
G1 X112.201 Y118.78 E.0171
G1 X112.256 Y119.334 E.0171
G1 X112.201 Y119.888 E.0171
G1 X112.039 Y120.42 E.0171
G1 X111.777 Y120.911 E.0171
G1 X111.464 Y121.292 E.01515
M204 S10000
; WIPE_START
G1 F24000
G1 X111.424 Y121.341 E-.02414
G1 X110.994 Y121.694 E-.21149
G1 X110.503 Y121.957 E-.21148
G1 X109.97 Y122.118 E-.21149
G1 X109.705 Y122.144 E-.10141
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I1.216 J-.045 P1  F30000
G1 X108.761 Y96.828 Z6.4
G1 Z6
G1 E.8 F1800
M204 S5000
G1 F1202
G1 X109.272 Y96.8 E.01573
G1 X109.861 Y96.897 E.01835
G1 X110.416 Y97.118 E.01835
G1 X110.91 Y97.453 E.01835
G1 X111.321 Y97.886 E.01835
G1 X111.628 Y98.398 E.01835
G1 X111.819 Y98.964 E.01835
G1 X111.884 Y99.557 E.01835
G1 X111.819 Y100.151 E.01835
G1 X111.628 Y100.717 E.01835
G1 X111.321 Y101.228 E.01835
G1 X111.27 Y101.282 E.00227
G1 X110.91 Y101.662 E.01608
G1 X110.416 Y101.997 E.01835
G1 X109.861 Y102.218 E.01835
G1 X109.272 Y102.315 E.01835
G1 X108.676 Y102.282 E.01835
G1 X108.1 Y102.122 E.01835
G1 X107.573 Y101.843 E.01835
G1 X107.118 Y101.456 E.01835
G1 X106.756 Y100.981 E.01835
G1 X106.506 Y100.439 E.01835
G1 X106.377 Y99.856 E.01835
G1 X106.377 Y99.259 E.01835
G1 X106.506 Y98.676 E.01835
G1 X106.756 Y98.134 E.01835
G1 X107.118 Y97.658 E.01835
G1 X107.573 Y97.272 E.01835
G1 X108.1 Y96.992 E.01835
G1 X108.676 Y96.832 E.01835
G1 X108.701 Y96.831 E.00078
M204 S10000
; WIPE_START
G1 F24000
G1 X109.272 Y96.8 E-.2173
G1 X109.861 Y96.897 E-.22689
G1 X110.416 Y97.118 E-.22689
G1 X110.609 Y97.249 E-.08892
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I-1.208 J.146 P1  F30000
G1 X111.132 Y101.562 Z6.4
G1 Z6
G1 E.8 F1800
M204 S5000
G1 F1202
G1 X111.13 Y101.565 E.00011
G1 X110.7 Y101.918 E.0171
G1 X110.209 Y102.18 E.0171
G1 X109.676 Y102.342 E.0171
G1 X109.122 Y102.396 E.0171
G1 X108.569 Y102.342 E.0171
G1 X108.036 Y102.18 E.0171
G1 X107.545 Y101.918 E.0171
G1 X107.115 Y101.565 E.0171
G1 X106.762 Y101.135 E.0171
G1 X106.5 Y100.644 E.0171
G1 X106.338 Y100.111 E.0171
G1 X106.283 Y99.557 E.0171
G1 X106.338 Y99.003 E.0171
G1 X106.5 Y98.471 E.0171
G1 X106.762 Y97.98 E.0171
G1 X107.115 Y97.55 E.0171
G1 X107.545 Y97.197 E.0171
G1 X108.036 Y96.934 E.0171
G1 X108.569 Y96.773 E.0171
G1 X109.157 Y96.722 E.01814
G1 X109.676 Y96.773 E.01604
G1 X110.209 Y96.934 E.0171
G1 X110.7 Y97.197 E.0171
G1 X111.13 Y97.55 E.0171
G1 X111.483 Y97.98 E.0171
G1 X111.745 Y98.471 E.0171
G1 X111.907 Y99.003 E.0171
G1 X111.961 Y99.557 E.0171
G1 X111.907 Y100.111 E.0171
G1 X111.745 Y100.644 E.0171
G1 X111.483 Y101.135 E.0171
G1 X111.17 Y101.516 E.01515
M204 S10000
; WIPE_START
G1 F24000
G1 X111.13 Y101.565 E-.02414
G1 X110.7 Y101.918 E-.21149
G1 X110.209 Y102.18 E-.21148
G1 X109.676 Y102.342 E-.21149
G1 X109.411 Y102.368 E-.10141
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I1.215 J-.061 P1  F30000
G1 X107.979 Y74.012 Z6.4
G1 Z6
G1 E.8 F1800
M204 S5000
G1 F1202
G1 X108.49 Y73.985 E.01573
G1 X109.079 Y74.081 E.01835
G1 X109.634 Y74.302 E.01835
G1 X110.128 Y74.637 E.01835
G1 X110.538 Y75.071 E.01835
G1 X110.846 Y75.582 E.01835
G1 X111.037 Y76.148 E.01835
G1 X111.102 Y76.742 E.01835
G1 X111.037 Y77.335 E.01835
G1 X110.846 Y77.901 E.01835
G1 X110.538 Y78.413 E.01835
G1 X110.488 Y78.466 E.00227
G1 X110.128 Y78.846 E.01608
G1 X109.634 Y79.181 E.01835
G1 X109.079 Y79.402 E.01835
G1 X108.49 Y79.499 E.01835
G1 X107.894 Y79.467 E.01835
G1 X107.318 Y79.307 E.01835
G1 X106.791 Y79.027 E.01835
G1 X106.336 Y78.641 E.01835
G1 X105.974 Y78.165 E.01835
G1 X105.724 Y77.623 E.01835
G1 X105.595 Y77.04 E.01835
G1 X105.595 Y76.443 E.01835
G1 X105.724 Y75.86 E.01835
G1 X105.974 Y75.318 E.01835
G1 X106.336 Y74.843 E.01835
G1 X106.791 Y74.456 E.01835
G1 X107.318 Y74.177 E.01835
G1 X107.894 Y74.017 E.01835
G1 X107.919 Y74.016 E.00078
M204 S10000
; WIPE_START
G1 F24000
G1 X108.49 Y73.985 E-.2173
G1 X109.079 Y74.081 E-.22689
G1 X109.634 Y74.302 E-.22689
G1 X109.827 Y74.433 E-.08892
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I-1.208 J.146 P1  F30000
G1 X110.35 Y78.746 Z6.4
G1 Z6
G1 E.8 F1800
M204 S5000
G1 F1202
G1 X110.348 Y78.749 E.00011
G1 X109.918 Y79.102 E.0171
G1 X109.427 Y79.365 E.0171
G1 X108.894 Y79.526 E.0171
G1 X108.34 Y79.581 E.0171
G1 X107.786 Y79.526 E.0171
G1 X107.254 Y79.365 E.0171
G1 X106.763 Y79.102 E.0171
G1 X106.333 Y78.749 E.0171
G1 X105.98 Y78.319 E.0171
G1 X105.717 Y77.828 E.0171
G1 X105.556 Y77.296 E.0171
G1 X105.501 Y76.742 E.0171
G1 X105.556 Y76.188 E.0171
G1 X105.717 Y75.655 E.0171
G1 X105.98 Y75.164 E.0171
G1 X106.333 Y74.734 E.0171
G1 X106.763 Y74.381 E.0171
G1 X107.254 Y74.119 E.0171
G1 X107.786 Y73.957 E.0171
G1 X108.375 Y73.906 E.01814
G1 X108.894 Y73.957 E.01604
G1 X109.427 Y74.119 E.0171
G1 X109.918 Y74.381 E.0171
G1 X110.348 Y74.734 E.0171
G1 X110.701 Y75.164 E.0171
G1 X110.963 Y75.655 E.0171
G1 X111.125 Y76.188 E.0171
G1 X111.179 Y76.742 E.0171
G1 X111.125 Y77.296 E.0171
G1 X110.963 Y77.828 E.0171
G1 X110.701 Y78.319 E.0171
G1 X110.388 Y78.7 E.01515
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 6.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X110.348 Y78.749 E-.02414
G1 X109.918 Y79.102 E-.21149
G1 X109.427 Y79.365 E-.21148
G1 X108.894 Y79.526 E-.21149
G1 X108.629 Y79.552 E-.10141
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 31/32
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
G3 Z6.4 I-1.217 J.008 P1  F30000
G1 X109 Y136.61 Z6.4
G1 Z6.2
G1 E.8 F1800
M204 S5000
G1 F1202
G1 X109.525 Y136.581 E.01615
G1 X110.114 Y136.678 E.01835
G1 X110.669 Y136.899 E.01835
G1 X111.163 Y137.234 E.01835
G1 X111.574 Y137.667 E.01835
G1 X111.881 Y138.179 E.01835
G1 X112.072 Y138.745 E.01835
G1 X112.137 Y139.339 E.01835
G1 X112.072 Y139.932 E.01835
G1 X111.881 Y140.498 E.01835
G1 X111.574 Y141.01 E.01835
G1 X111.163 Y141.443 E.01835
G1 X110.669 Y141.778 E.01835
G1 X110.114 Y141.999 E.01835
G1 X109.525 Y142.096 E.01835
G1 X108.929 Y142.063 E.01835
G1 X108.353 Y141.904 E.01835
G1 X107.826 Y141.624 E.01835
G1 X107.371 Y141.237 E.01835
G1 X107.009 Y140.762 E.01835
G1 X106.759 Y140.22 E.01835
G1 X106.63 Y139.637 E.01835
G1 X106.63 Y139.04 E.01835
G1 X106.759 Y138.457 E.01835
G1 X107.009 Y137.915 E.01835
G1 X107.371 Y137.44 E.01835
G1 X107.826 Y137.053 E.01835
G1 X108.353 Y136.773 E.01835
G1 X108.942 Y136.622 E.01866
M204 S10000
; WIPE_START
G1 F24000
G1 X109.525 Y136.581 E-.22219
G1 X110.114 Y136.678 E-.22689
G1 X110.669 Y136.899 E-.22689
G1 X110.852 Y137.023 E-.08402
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I-1.208 J.149 P1  F30000
G1 X111.385 Y141.343 Z6.6
G1 Z6.2
G1 E.8 F1800
M204 S5000
G1 F1202
G1 X111.383 Y141.346 E.00012
G1 X110.953 Y141.699 E.0171
G1 X110.462 Y141.961 E.0171
G1 X109.929 Y142.123 E.0171
G1 X109.375 Y142.177 E.0171
G1 X108.822 Y142.123 E.0171
G1 X108.289 Y141.961 E.0171
G1 X107.798 Y141.699 E.0171
G1 X107.368 Y141.346 E.0171
G1 X107.015 Y140.916 E.0171
G1 X106.752 Y140.425 E.0171
G1 X106.591 Y139.892 E.0171
G1 X106.536 Y139.339 E.0171
G1 X106.591 Y138.785 E.0171
G1 X106.752 Y138.252 E.0171
G1 X107.015 Y137.761 E.0171
G1 X107.368 Y137.331 E.0171
G1 X107.798 Y136.978 E.0171
G1 X108.289 Y136.716 E.0171
G1 X108.822 Y136.554 E.0171
G1 X109.391 Y136.501 E.01759
M73 P95 R0
G1 X109.929 Y136.554 E.01661
G1 X110.462 Y136.716 E.0171
G1 X110.953 Y136.978 E.0171
G1 X111.383 Y137.331 E.0171
G1 X111.736 Y137.761 E.0171
G1 X111.998 Y138.252 E.0171
G1 X112.16 Y138.785 E.0171
G1 X112.214 Y139.339 E.0171
G1 X112.16 Y139.892 E.0171
G1 X111.998 Y140.425 E.0171
G1 X111.736 Y140.916 E.0171
G1 X111.423 Y141.297 E.01514
M204 S10000
; WIPE_START
G1 F24000
G1 X111.383 Y141.346 E-.02423
G1 X110.953 Y141.699 E-.21149
G1 X110.462 Y141.961 E-.21148
G1 X109.929 Y142.123 E-.21148
G1 X109.664 Y142.149 E-.10131
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I1.217 J-.03 P1  F30000
G1 X109.041 Y116.605 Z6.6
G1 Z6.2
G1 E.8 F1800
M204 S5000
G1 F1202
G1 X109.566 Y116.577 E.01615
G1 X110.155 Y116.673 E.01835
G1 X110.71 Y116.894 E.01835
G1 X111.204 Y117.229 E.01835
G1 X111.615 Y117.663 E.01835
G1 X111.923 Y118.174 E.01835
G1 X112.113 Y118.74 E.01835
G1 X112.178 Y119.334 E.01835
G1 X112.113 Y119.927 E.01835
G1 X111.923 Y120.493 E.01835
G1 X111.615 Y121.005 E.01835
G1 X111.204 Y121.438 E.01835
G1 X110.71 Y121.773 E.01835
G1 X110.155 Y121.994 E.01835
G1 X109.566 Y122.091 E.01835
G1 X108.97 Y122.059 E.01835
G1 X108.394 Y121.899 E.01835
G1 X107.867 Y121.619 E.01835
G1 X107.412 Y121.233 E.01835
G1 X107.051 Y120.757 E.01835
G1 X106.8 Y120.215 E.01835
G1 X106.671 Y119.632 E.01835
G1 X106.671 Y119.035 E.01835
G1 X106.8 Y118.452 E.01835
G1 X107.051 Y117.91 E.01835
G1 X107.412 Y117.435 E.01835
G1 X107.867 Y117.048 E.01835
G1 X108.394 Y116.769 E.01835
G1 X108.983 Y116.617 E.01866
M204 S10000
; WIPE_START
G1 F24000
G1 X109.566 Y116.577 E-.22219
G1 X110.155 Y116.673 E-.22689
G1 X110.71 Y116.894 E-.22689
G1 X110.893 Y117.018 E-.08402
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I-1.208 J.149 P1  F30000
G1 X111.426 Y121.338 Z6.6
G1 Z6.2
G1 E.8 F1800
M204 S5000
G1 F1202
G1 X111.424 Y121.341 E.00012
G1 X110.994 Y121.694 E.0171
G1 X110.503 Y121.957 E.0171
G1 X109.97 Y122.118 E.0171
G1 X109.417 Y122.173 E.0171
G1 X108.863 Y122.118 E.0171
G1 X108.33 Y121.957 E.0171
G1 X107.839 Y121.694 E.0171
G1 X107.409 Y121.341 E.0171
G1 X107.056 Y120.911 E.0171
G1 X106.794 Y120.42 E.0171
G1 X106.632 Y119.888 E.0171
G1 X106.578 Y119.334 E.0171
G1 X106.632 Y118.78 E.0171
G1 X106.794 Y118.247 E.0171
G1 X107.056 Y117.757 E.0171
G1 X107.409 Y117.326 E.0171
G1 X107.839 Y116.973 E.0171
G1 X108.33 Y116.711 E.0171
G1 X108.863 Y116.549 E.0171
G1 X109.433 Y116.496 E.01759
G1 X109.97 Y116.549 E.01661
G1 X110.503 Y116.711 E.0171
G1 X110.994 Y116.973 E.0171
G1 X111.424 Y117.326 E.0171
G1 X111.777 Y117.757 E.0171
G1 X112.039 Y118.247 E.0171
G1 X112.201 Y118.78 E.0171
G1 X112.256 Y119.334 E.0171
G1 X112.201 Y119.888 E.0171
G1 X112.039 Y120.42 E.0171
G1 X111.777 Y120.911 E.0171
G1 X111.464 Y121.292 E.01514
M204 S10000
; WIPE_START
G1 F24000
G1 X111.424 Y121.341 E-.02423
G1 X110.994 Y121.694 E-.21149
G1 X110.503 Y121.957 E-.21148
G1 X109.97 Y122.118 E-.21148
G1 X109.705 Y122.144 E-.10131
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I1.216 J-.046 P1  F30000
G1 X108.747 Y96.829 Z6.6
G1 Z6.2
G1 E.8 F1800
M204 S5000
G1 F1202
G1 X109.272 Y96.8 E.01615
G1 X109.861 Y96.897 E.01835
G1 X110.416 Y97.118 E.01835
G1 X110.91 Y97.453 E.01835
G1 X111.321 Y97.886 E.01835
G1 X111.628 Y98.398 E.01835
G1 X111.819 Y98.964 E.01835
G1 X111.884 Y99.557 E.01835
G1 X111.819 Y100.151 E.01835
G1 X111.628 Y100.717 E.01835
G1 X111.321 Y101.228 E.01835
G1 X110.91 Y101.662 E.01835
G1 X110.416 Y101.997 E.01835
G1 X109.861 Y102.218 E.01835
G1 X109.272 Y102.315 E.01835
G1 X108.676 Y102.282 E.01835
G1 X108.1 Y102.122 E.01835
G1 X107.573 Y101.843 E.01835
G1 X107.118 Y101.456 E.01835
G1 X106.756 Y100.981 E.01835
G1 X106.506 Y100.439 E.01835
G1 X106.377 Y99.856 E.01835
G1 X106.377 Y99.259 E.01835
G1 X106.506 Y98.676 E.01835
G1 X106.756 Y98.134 E.01835
G1 X107.118 Y97.658 E.01835
G1 X107.573 Y97.272 E.01835
G1 X108.1 Y96.992 E.01835
G1 X108.689 Y96.841 E.01866
M204 S10000
; WIPE_START
G1 F24000
G1 X109.272 Y96.8 E-.22219
G1 X109.861 Y96.897 E-.22689
G1 X110.416 Y97.118 E-.22689
G1 X110.599 Y97.242 E-.08402
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I-1.208 J.149 P1  F30000
G1 X111.132 Y101.562 Z6.6
G1 Z6.2
G1 E.8 F1800
M204 S5000
G1 F1202
G1 X111.13 Y101.565 E.00012
G1 X110.7 Y101.918 E.0171
G1 X110.209 Y102.18 E.0171
G1 X109.676 Y102.342 E.0171
G1 X109.122 Y102.396 E.0171
G1 X108.569 Y102.342 E.0171
G1 X108.036 Y102.18 E.0171
G1 X107.545 Y101.918 E.0171
G1 X107.115 Y101.565 E.0171
G1 X106.762 Y101.135 E.0171
G1 X106.5 Y100.644 E.0171
G1 X106.338 Y100.111 E.0171
G1 X106.283 Y99.557 E.0171
G1 X106.338 Y99.003 E.0171
G1 X106.5 Y98.471 E.0171
G1 X106.762 Y97.98 E.0171
G1 X107.115 Y97.55 E.0171
G1 X107.545 Y97.197 E.0171
G1 X108.036 Y96.934 E.0171
G1 X108.569 Y96.773 E.0171
G1 X109.138 Y96.72 E.01759
G1 X109.676 Y96.773 E.01661
G1 X110.209 Y96.934 E.0171
G1 X110.7 Y97.197 E.0171
G1 X111.13 Y97.55 E.0171
G1 X111.483 Y97.98 E.0171
G1 X111.745 Y98.471 E.0171
G1 X111.907 Y99.003 E.0171
G1 X111.961 Y99.557 E.0171
G1 X111.907 Y100.111 E.0171
G1 X111.745 Y100.644 E.0171
G1 X111.483 Y101.135 E.0171
G1 X111.17 Y101.516 E.01514
M204 S10000
; WIPE_START
G1 F24000
G1 X111.13 Y101.565 E-.02423
G1 X110.7 Y101.918 E-.21149
G1 X110.209 Y102.18 E-.21148
G1 X109.676 Y102.342 E-.21148
G1 X109.411 Y102.368 E-.10131
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I1.215 J-.062 P1  F30000
G1 X107.965 Y74.013 Z6.6
G1 Z6.2
G1 E.8 F1800
M204 S5000
G1 F1202
G1 X108.49 Y73.985 E.01615
G1 X109.079 Y74.081 E.01835
G1 X109.634 Y74.302 E.01835
G1 X110.128 Y74.637 E.01835
G1 X110.538 Y75.071 E.01835
G1 X110.846 Y75.582 E.01835
G1 X111.037 Y76.148 E.01835
G1 X111.102 Y76.742 E.01835
G1 X111.037 Y77.335 E.01835
G1 X110.846 Y77.901 E.01835
G1 X110.538 Y78.413 E.01835
G1 X110.128 Y78.846 E.01835
G1 X109.634 Y79.181 E.01835
G1 X109.079 Y79.402 E.01835
G1 X108.49 Y79.499 E.01835
G1 X107.894 Y79.467 E.01835
G1 X107.318 Y79.307 E.01835
G1 X106.791 Y79.027 E.01835
G1 X106.336 Y78.641 E.01835
G1 X105.974 Y78.165 E.01835
G1 X105.724 Y77.623 E.01835
G1 X105.595 Y77.04 E.01835
G1 X105.595 Y76.443 E.01835
G1 X105.724 Y75.86 E.01835
G1 X105.974 Y75.318 E.01835
G1 X106.336 Y74.843 E.01835
G1 X106.791 Y74.456 E.01835
G1 X107.318 Y74.177 E.01835
G1 X107.906 Y74.025 E.01866
M204 S10000
; WIPE_START
G1 F24000
G1 X108.49 Y73.985 E-.22219
G1 X109.079 Y74.081 E-.22689
G1 X109.634 Y74.302 E-.22689
G1 X109.817 Y74.426 E-.08402
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I-1.208 J.149 P1  F30000
G1 X110.35 Y78.746 Z6.6
G1 Z6.2
G1 E.8 F1800
M204 S5000
G1 F1202
G1 X110.348 Y78.749 E.00012
G1 X109.918 Y79.102 E.0171
G1 X109.427 Y79.365 E.0171
G1 X108.894 Y79.526 E.0171
G1 X108.34 Y79.581 E.0171
G1 X107.786 Y79.526 E.0171
G1 X107.254 Y79.365 E.0171
G1 X106.763 Y79.102 E.0171
G1 X106.333 Y78.749 E.0171
G1 X105.98 Y78.319 E.0171
G1 X105.717 Y77.828 E.0171
G1 X105.556 Y77.296 E.0171
G1 X105.501 Y76.742 E.0171
G1 X105.556 Y76.188 E.0171
G1 X105.717 Y75.655 E.0171
G1 X105.98 Y75.164 E.0171
G1 X106.333 Y74.734 E.0171
G1 X106.763 Y74.381 E.0171
G1 X107.254 Y74.119 E.0171
G1 X107.786 Y73.957 E.0171
G1 X108.356 Y73.904 E.01759
G1 X108.894 Y73.957 E.01661
G1 X109.427 Y74.119 E.0171
G1 X109.918 Y74.381 E.0171
G1 X110.348 Y74.734 E.0171
G1 X110.701 Y75.164 E.0171
G1 X110.963 Y75.655 E.0171
G1 X111.125 Y76.188 E.0171
G1 X111.179 Y76.742 E.0171
G1 X111.125 Y77.296 E.0171
G1 X110.963 Y77.828 E.0171
M73 P96 R0
G1 X110.701 Y78.319 E.0171
G1 X110.388 Y78.7 E.01514
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 6.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X110.348 Y78.749 E-.02423
G1 X109.918 Y79.102 E-.21149
G1 X109.427 Y79.365 E-.21148
G1 X108.894 Y79.526 E-.21148
G1 X108.629 Y79.552 E-.10131
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 32/32
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
G3 Z6.6 I-1.217 J.008 P1  F30000
G1 X108.987 Y136.61 Z6.6
G1 Z6.4
G1 E.8 F1800
M204 S5000
G1 F1202
G1 X109.525 Y136.581 E.01655
G1 X110.114 Y136.678 E.01835
G1 X110.669 Y136.899 E.01835
G1 X111.163 Y137.234 E.01835
G1 X111.574 Y137.667 E.01835
G1 X111.881 Y138.179 E.01835
G1 X112.072 Y138.745 E.01835
G1 X112.137 Y139.339 E.01835
G1 X112.072 Y139.932 E.01835
G1 X111.881 Y140.498 E.01835
G1 X111.546 Y141.038 E.01954
G1 X111.163 Y141.443 E.01712
G1 X110.669 Y141.778 E.01835
G1 X110.114 Y141.999 E.01835
G1 X109.525 Y142.096 E.01835
G1 X108.929 Y142.063 E.01835
G1 X108.353 Y141.904 E.01835
G1 X107.826 Y141.624 E.01835
G1 X107.371 Y141.237 E.01835
G1 X107.009 Y140.762 E.01835
G1 X106.759 Y140.22 E.01835
G1 X106.63 Y139.637 E.01835
G1 X106.63 Y139.04 E.01835
G1 X106.759 Y138.457 E.01835
G1 X107.009 Y137.915 E.01835
G1 X107.371 Y137.44 E.01835
G1 X107.826 Y137.053 E.01835
G1 X108.353 Y136.773 E.01835
G1 X108.929 Y136.622 E.01828
M204 S10000
; WIPE_START
G1 F24000
G1 X109.525 Y136.581 E-.22712
G1 X110.114 Y136.678 E-.22689
G1 X110.669 Y136.899 E-.22689
G1 X110.841 Y137.016 E-.0791
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I-1.207 J.152 P1  F30000
G1 X111.385 Y141.343 Z6.8
G1 Z6.4
G1 E.8 F1800
M204 S5000
G1 F1202
G1 X111.383 Y141.346 E.00012
G1 X110.953 Y141.699 E.0171
G1 X110.462 Y141.961 E.0171
G1 X109.929 Y142.123 E.0171
G1 X109.375 Y142.177 E.0171
G1 X108.822 Y142.123 E.0171
G1 X108.289 Y141.961 E.0171
G1 X107.798 Y141.699 E.0171
G1 X107.368 Y141.346 E.0171
G1 X107.015 Y140.916 E.0171
G1 X106.752 Y140.425 E.0171
G1 X106.591 Y139.892 E.0171
G1 X106.536 Y139.339 E.0171
G1 X106.591 Y138.785 E.0171
G1 X106.752 Y138.252 E.0171
G1 X107.015 Y137.761 E.0171
G1 X107.368 Y137.331 E.0171
G1 X107.798 Y136.978 E.0171
G1 X108.289 Y136.716 E.0171
G1 X108.822 Y136.554 E.0171
G1 X109.375 Y136.5 E.0171
G1 X109.929 Y136.554 E.0171
G1 X110.462 Y136.716 E.0171
G1 X110.953 Y136.978 E.0171
G1 X111.383 Y137.331 E.0171
G1 X111.736 Y137.761 E.0171
G1 X111.998 Y138.252 E.0171
G1 X112.16 Y138.785 E.0171
G1 X112.214 Y139.339 E.0171
G1 X112.16 Y139.892 E.0171
G1 X111.998 Y140.425 E.0171
G1 X111.736 Y140.916 E.0171
G1 X111.423 Y141.297 E.01513
M204 S10000
; WIPE_START
G1 F24000
G1 X111.383 Y141.346 E-.02432
G1 X110.953 Y141.699 E-.21149
G1 X110.462 Y141.961 E-.21148
G1 X109.929 Y142.123 E-.21148
G1 X109.664 Y142.149 E-.10122
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I1.217 J-.03 P1  F30000
G1 X109.028 Y116.606 Z6.8
G1 Z6.4
G1 E.8 F1800
M204 S5000
G1 F1202
G1 X109.566 Y116.577 E.01655
G1 X110.155 Y116.673 E.01835
G1 X110.71 Y116.894 E.01835
G1 X111.204 Y117.229 E.01835
G1 X111.615 Y117.663 E.01835
G1 X111.923 Y118.174 E.01835
G1 X112.113 Y118.74 E.01835
G1 X112.178 Y119.334 E.01835
G1 X112.113 Y119.927 E.01835
G1 X111.923 Y120.493 E.01835
G1 X111.587 Y121.034 E.01954
G1 X111.204 Y121.438 E.01712
G1 X110.71 Y121.773 E.01835
G1 X110.155 Y121.994 E.01835
G1 X109.566 Y122.091 E.01835
G1 X108.97 Y122.059 E.01835
G1 X108.394 Y121.899 E.01835
G1 X107.867 Y121.619 E.01835
G1 X107.412 Y121.233 E.01835
G1 X107.051 Y120.757 E.01835
G1 X106.8 Y120.215 E.01835
G1 X106.671 Y119.632 E.01835
G1 X106.671 Y119.035 E.01835
G1 X106.8 Y118.452 E.01835
G1 X107.051 Y117.91 E.01835
G1 X107.412 Y117.435 E.01835
G1 X107.867 Y117.048 E.01835
G1 X108.394 Y116.769 E.01835
G1 X108.97 Y116.617 E.01828
M204 S10000
; WIPE_START
G1 F24000
G1 X109.566 Y116.577 E-.22712
G1 X110.155 Y116.673 E-.22689
G1 X110.71 Y116.894 E-.22689
G1 X110.882 Y117.011 E-.0791
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I-1.207 J.152 P1  F30000
G1 X111.427 Y121.338 Z6.8
G1 Z6.4
G1 E.8 F1800
M204 S5000
G1 F1202
G1 X111.424 Y121.341 E.00012
G1 X110.994 Y121.694 E.0171
G1 X110.503 Y121.957 E.0171
G1 X109.97 Y122.118 E.0171
G1 X109.417 Y122.173 E.0171
G1 X108.863 Y122.118 E.0171
G1 X108.33 Y121.957 E.0171
G1 X107.839 Y121.694 E.0171
G1 X107.409 Y121.341 E.0171
G1 X107.056 Y120.911 E.0171
G1 X106.794 Y120.42 E.0171
G1 X106.632 Y119.888 E.0171
G1 X106.578 Y119.334 E.0171
G1 X106.632 Y118.78 E.0171
G1 X106.794 Y118.247 E.0171
G1 X107.056 Y117.757 E.0171
G1 X107.409 Y117.326 E.0171
G1 X107.839 Y116.973 E.0171
G1 X108.33 Y116.711 E.0171
G1 X108.863 Y116.549 E.0171
G1 X109.417 Y116.495 E.0171
G1 X109.97 Y116.549 E.0171
G1 X110.503 Y116.711 E.0171
G1 X110.994 Y116.973 E.0171
G1 X111.424 Y117.326 E.0171
G1 X111.777 Y117.757 E.0171
G1 X112.039 Y118.247 E.0171
G1 X112.201 Y118.78 E.0171
G1 X112.256 Y119.334 E.0171
G1 X112.201 Y119.888 E.0171
G1 X112.039 Y120.42 E.0171
G1 X111.777 Y120.911 E.0171
G1 X111.465 Y121.292 E.01513
M204 S10000
; WIPE_START
G1 F24000
G1 X111.424 Y121.341 E-.02432
G1 X110.994 Y121.694 E-.21149
G1 X110.503 Y121.957 E-.21148
G1 X109.97 Y122.118 E-.21148
G1 X109.705 Y122.144 E-.10122
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I1.216 J-.047 P1  F30000
G1 X108.734 Y96.829 Z6.8
G1 Z6.4
G1 E.8 F1800
M204 S5000
G1 F1202
G1 X109.272 Y96.8 E.01655
G1 X109.861 Y96.897 E.01835
G1 X110.416 Y97.118 E.01835
G1 X110.91 Y97.453 E.01835
G1 X111.321 Y97.886 E.01835
G1 X111.628 Y98.398 E.01835
G1 X111.819 Y98.964 E.01835
G1 X111.884 Y99.557 E.01835
G1 X111.819 Y100.151 E.01835
G1 X111.628 Y100.717 E.01835
G1 X111.293 Y101.257 E.01954
G1 X110.91 Y101.662 E.01712
G1 X110.416 Y101.997 E.01835
G1 X109.861 Y102.218 E.01835
G1 X109.272 Y102.315 E.01835
G1 X108.676 Y102.282 E.01835
G1 X108.1 Y102.122 E.01835
G1 X107.573 Y101.843 E.01835
G1 X107.118 Y101.456 E.01835
G1 X106.756 Y100.981 E.01835
G1 X106.506 Y100.439 E.01835
G1 X106.377 Y99.856 E.01835
G1 X106.377 Y99.259 E.01835
G1 X106.506 Y98.676 E.01835
G1 X106.756 Y98.134 E.01835
G1 X107.118 Y97.658 E.01835
G1 X107.573 Y97.272 E.01835
G1 X108.1 Y96.992 E.01835
G1 X108.676 Y96.841 E.01828
M204 S10000
; WIPE_START
G1 F24000
G1 X109.272 Y96.8 E-.22712
G1 X109.861 Y96.897 E-.22689
G1 X110.416 Y97.118 E-.22689
G1 X110.588 Y97.235 E-.0791
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I-1.207 J.152 P1  F30000
G1 X111.132 Y101.562 Z6.8
G1 Z6.4
G1 E.8 F1800
M204 S5000
G1 F1202
G1 X111.13 Y101.565 E.00012
G1 X110.7 Y101.918 E.0171
G1 X110.209 Y102.18 E.0171
G1 X109.676 Y102.342 E.0171
G1 X109.122 Y102.396 E.0171
G1 X108.569 Y102.342 E.0171
G1 X108.036 Y102.18 E.0171
G1 X107.545 Y101.918 E.0171
G1 X107.115 Y101.565 E.0171
G1 X106.762 Y101.135 E.0171
G1 X106.5 Y100.644 E.0171
G1 X106.338 Y100.111 E.0171
G1 X106.283 Y99.557 E.0171
G1 X106.338 Y99.003 E.0171
G1 X106.5 Y98.471 E.0171
G1 X106.762 Y97.98 E.0171
G1 X107.115 Y97.55 E.0171
G1 X107.545 Y97.197 E.0171
G1 X108.036 Y96.934 E.0171
G1 X108.569 Y96.773 E.0171
G1 X109.122 Y96.718 E.0171
G1 X109.676 Y96.773 E.0171
G1 X110.209 Y96.934 E.0171
G1 X110.7 Y97.197 E.0171
G1 X111.13 Y97.55 E.0171
G1 X111.483 Y97.98 E.0171
G1 X111.745 Y98.471 E.0171
G1 X111.907 Y99.003 E.0171
G1 X111.961 Y99.557 E.0171
G1 X111.907 Y100.111 E.0171
G1 X111.745 Y100.644 E.0171
G1 X111.483 Y101.135 E.0171
G1 X111.171 Y101.515 E.01513
M204 S10000
; WIPE_START
G1 F24000
G1 X111.13 Y101.565 E-.02432
G1 X110.7 Y101.918 E-.21149
G1 X110.209 Y102.18 E-.21148
G1 X109.676 Y102.342 E-.21148
M73 P97 R0
G1 X109.411 Y102.368 E-.10122
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I1.215 J-.063 P1  F30000
G1 X107.952 Y74.014 Z6.8
G1 Z6.4
G1 E.8 F1800
M204 S5000
G1 F1202
G1 X108.49 Y73.985 E.01655
G1 X109.079 Y74.081 E.01835
G1 X109.634 Y74.302 E.01835
G1 X110.128 Y74.637 E.01835
G1 X110.538 Y75.071 E.01835
G1 X110.846 Y75.582 E.01835
G1 X111.037 Y76.148 E.01835
G1 X111.102 Y76.742 E.01835
G1 X111.037 Y77.335 E.01835
G1 X110.846 Y77.901 E.01835
G1 X110.511 Y78.442 E.01954
G1 X110.128 Y78.846 E.01712
G1 X109.634 Y79.181 E.01835
G1 X109.079 Y79.402 E.01835
G1 X108.49 Y79.499 E.01835
G1 X107.894 Y79.467 E.01835
G1 X107.318 Y79.307 E.01835
G1 X106.791 Y79.027 E.01835
G1 X106.336 Y78.641 E.01835
G1 X105.974 Y78.165 E.01835
G1 X105.724 Y77.623 E.01835
G1 X105.595 Y77.04 E.01835
G1 X105.595 Y76.443 E.01835
G1 X105.724 Y75.86 E.01835
G1 X105.974 Y75.318 E.01835
G1 X106.336 Y74.843 E.01835
G1 X106.791 Y74.456 E.01835
G1 X107.318 Y74.177 E.01835
G1 X107.893 Y74.025 E.01828
M204 S10000
; WIPE_START
G1 F24000
G1 X108.49 Y73.985 E-.22712
G1 X109.079 Y74.081 E-.22689
G1 X109.634 Y74.302 E-.22689
G1 X109.806 Y74.419 E-.0791
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I-1.207 J.152 P1  F30000
G1 X110.35 Y78.746 Z6.8
G1 Z6.4
G1 E.8 F1800
M204 S5000
G1 F1202
G1 X110.348 Y78.749 E.00012
G1 X109.918 Y79.102 E.0171
G1 X109.427 Y79.365 E.0171
G1 X108.894 Y79.526 E.0171
G1 X108.34 Y79.581 E.0171
G1 X107.786 Y79.526 E.0171
G1 X107.254 Y79.365 E.0171
G1 X106.763 Y79.102 E.0171
G1 X106.333 Y78.749 E.0171
G1 X105.98 Y78.319 E.0171
G1 X105.717 Y77.828 E.0171
G1 X105.556 Y77.296 E.0171
G1 X105.501 Y76.742 E.0171
G1 X105.556 Y76.188 E.0171
G1 X105.717 Y75.655 E.0171
G1 X105.98 Y75.164 E.0171
G1 X106.333 Y74.734 E.0171
G1 X106.763 Y74.381 E.0171
G1 X107.254 Y74.119 E.0171
G1 X107.786 Y73.957 E.0171
G1 X108.34 Y73.903 E.0171
G1 X108.894 Y73.957 E.0171
G1 X109.427 Y74.119 E.0171
G1 X109.918 Y74.381 E.0171
G1 X110.348 Y74.734 E.0171
G1 X110.701 Y75.164 E.0171
G1 X110.963 Y75.655 E.0171
G1 X111.125 Y76.188 E.0171
G1 X111.179 Y76.742 E.0171
G1 X111.125 Y77.296 E.0171
G1 X110.963 Y77.828 E.0171
G1 X110.701 Y78.319 E.0171
G1 X110.388 Y78.7 E.01513
M204 S10000
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F24000
G1 X110.348 Y78.749 E-.02432
G1 X109.918 Y79.102 E-.21149
G1 X109.427 Y79.365 E-.21148
G1 X108.894 Y79.526 E-.21148
G1 X108.629 Y79.552 E-.10122
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
G1 Z6.9 F900 ; lower z a little
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

    G1 Z106.4 F600
    G1 Z104.4

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

