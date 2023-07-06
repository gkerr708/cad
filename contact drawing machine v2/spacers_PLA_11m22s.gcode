; HEADER_BLOCK_START
; BambuStudio 01.06.02.04
; model printing time: 5m 34s; total estimated time: 11m 22s
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
M73 P38 R7
G1 Y245
M73 P38 R6
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
M73 P39 R6
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
M73 P41 R6
G1 X76 F15000
M73 P43 R6
G1 X65 F15000
M73 P44 R6
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
M73 P45 R6
G1 X230 Y15
G29.2 S1 ; turn on ABL
;G28 ; home again after hard wipe mouth
M106 S0 ; turn off fan , too noisy
;===== wipe nozzle end ================================


;===== bed leveling ==================================
M1002 judge_flag g29_before_print_flag
M622 J1

    M1002 gcode_claim_action : 1
    G29 A X103.583 Y94.1807 I33.5851 J75.9703
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
M73 P46 R6
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
G1 X107.353 Y93.862 F30000
G1 Z.4
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.449721
G1 F1510
G1 X107.397 Y94.227 E.01219
G1 X107.346 Y94.652 E.0142
G1 X107.194 Y95.052 E.0142
M73 P47 R6
G1 X106.951 Y95.405 E.0142
G1 X106.63 Y95.689 E.0142
G1 X106.251 Y95.888 E.0142
G1 X105.835 Y95.99 E.0142
M73 P47 R5
G1 X105.407 Y95.99 E.0142
G1 X104.991 Y95.888 E.0142
G1 X104.612 Y95.689 E.0142
G1 X104.291 Y95.405 E.0142
G1 X104.048 Y95.052 E.0142
M73 P48 R5
G1 X103.896 Y94.652 E.0142
G1 X103.844 Y94.227 E.0142
G1 X103.896 Y93.801 E.0142
G1 X104.048 Y93.401 E.0142
G1 X104.291 Y93.049 E.0142
G1 X104.612 Y92.765 E.0142
G1 X104.991 Y92.566 E.0142
M73 P49 R5
G1 X105.407 Y92.463 E.0142
G1 X105.835 Y92.463 E.0142
G1 X106.251 Y92.566 E.0142
G1 X106.63 Y92.765 E.0142
G1 X106.951 Y93.049 E.0142
G1 X107.194 Y93.401 E.0142
G1 X107.346 Y93.801 E.0142
G1 X107.346 Y93.802 E.00002
; WIPE_START
G1 F24000
G1 X107.397 Y94.227 E-.16251
G1 X107.346 Y94.652 E-.16274
G1 X107.194 Y95.052 E-.16274
G1 X106.951 Y95.405 E-.16274
G1 X106.735 Y95.595 E-.10926
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I1.051 J-.614 P1  F30000
G1 X104.947 Y92.535 Z.6
G1 Z.2
G1 E.8 F1800
M73 P50 R5
G1 F1510
G3 X105.726 Y92.407 I.678 J1.689 E.02639
G1 X106.109 Y92.469 E.01286
G3 X104.892 Y92.558 I-.484 J1.755 E.33784
; WIPE_START
G1 F24000
G1 X105.326 Y92.427 E-.17223
G1 X105.726 Y92.407 E-.1524
G1 X106.109 Y92.469 E-.14741
G1 X106.475 Y92.615 E-.14987
G1 X106.776 Y92.819 E-.1381
; WIPE_END
M73 P51 R5
G1 E-.04 F1800
G17
G3 Z.6 I-1.19 J.256 P1  F30000
G1 X111.862 Y116.438 Z.6
G1 Z.2
G1 E.8 F1800
G1 F1510
G1 X111.906 Y116.803 E.01219
G1 X111.855 Y117.228 E.0142
G1 X111.703 Y117.628 E.0142
G1 X111.46 Y117.981 E.0142
G1 X111.139 Y118.265 E.0142
G1 X110.76 Y118.464 E.0142
G1 X110.344 Y118.566 E.0142
G1 X109.916 Y118.566 E.0142
G1 X109.5 Y118.464 E.0142
G1 X109.121 Y118.265 E.0142
G1 X108.8 Y117.981 E.0142
G1 X108.557 Y117.628 E.0142
G1 X108.405 Y117.228 E.0142
G1 X108.353 Y116.803 E.0142
G1 X108.405 Y116.377 E.0142
G1 X108.557 Y115.977 E.0142
G1 X108.8 Y115.624 E.0142
G1 X109.121 Y115.34 E.0142
G1 X109.5 Y115.141 E.0142
G1 X109.916 Y115.039 E.0142
G1 X110.344 Y115.039 E.0142
G1 X110.76 Y115.141 E.0142
G1 X111.139 Y115.34 E.0142
G1 X111.46 Y115.624 E.0142
G1 X111.703 Y115.977 E.0142
G1 X111.855 Y116.377 E.0142
G1 X111.855 Y116.378 E.00002
; WIPE_START
G1 F24000
G1 X111.906 Y116.803 E-.16251
G1 X111.855 Y117.228 E-.16274
G1 X111.703 Y117.628 E-.16274
G1 X111.46 Y117.981 E-.16274
G1 X111.244 Y118.171 E-.10926
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I1.051 J-.614 P1  F30000
G1 X109.456 Y115.111 Z.6
G1 Z.2
G1 E.8 F1800
G1 F1510
G3 X110.235 Y114.982 I.678 J1.689 E.02639
G1 X110.618 Y115.045 E.01286
G3 X109.401 Y115.134 I-.484 J1.755 E.33784
; WIPE_START
G1 F24000
G1 X109.834 Y115.003 E-.17223
G1 X110.235 Y114.982 E-.1524
G1 X110.618 Y115.045 E-.14741
G1 X110.984 Y115.191 E-.14987
G1 X111.285 Y115.395 E-.1381
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-1.217 J-.006 P1  F30000
G1 X111.169 Y140.092 Z.6
G1 Z.2
G1 E.8 F1800
G1 F1510
G1 X111.213 Y140.457 E.01219
G1 X111.162 Y140.882 E.0142
G1 X111.01 Y141.282 E.0142
G1 X110.767 Y141.635 E.0142
G1 X110.446 Y141.919 E.0142
G1 X110.067 Y142.118 E.0142
G1 X109.651 Y142.22 E.0142
G1 X109.223 Y142.22 E.0142
G1 X108.807 Y142.118 E.0142
G1 X108.428 Y141.919 E.0142
G1 X108.107 Y141.635 E.0142
G1 X107.864 Y141.282 E.0142
G1 X107.712 Y140.882 E.0142
G1 X107.66 Y140.457 E.0142
G1 X107.712 Y140.032 E.0142
G1 X107.864 Y139.631 E.0142
G1 X108.107 Y139.279 E.0142
G1 X108.428 Y138.995 E.0142
G1 X108.807 Y138.796 E.0142
G1 X109.223 Y138.693 E.0142
G1 X109.651 Y138.693 E.0142
G1 X110.067 Y138.796 E.0142
G1 X110.446 Y138.995 E.0142
G1 X110.767 Y139.279 E.0142
G1 X111.01 Y139.631 E.0142
G1 X111.162 Y140.032 E.0142
G1 X111.162 Y140.032 E.00002
; WIPE_START
G1 F24000
G1 X111.213 Y140.457 E-.16251
G1 X111.162 Y140.882 E-.16274
G1 X111.01 Y141.282 E-.16274
G1 X110.767 Y141.635 E-.16274
G1 X110.551 Y141.826 E-.10926
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I1.051 J-.614 P1  F30000
G1 X108.763 Y138.765 Z.6
G1 Z.2
G1 E.8 F1800
G1 F1510
G3 X109.542 Y138.637 I.678 J1.689 E.02639
G1 X109.925 Y138.7 E.01286
G3 X108.708 Y138.788 I-.484 J1.755 E.33784
; WIPE_START
G1 F24000
G1 X109.141 Y138.657 E-.17223
G1 X109.542 Y138.637 E-.1524
G1 X109.925 Y138.7 E-.14741
G1 X110.291 Y138.846 E-.14987
G1 X110.592 Y139.049 E-.1381
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-1.217 J.019 P1  F30000
G1 X111.003 Y165.739 Z.6
G1 Z.2
G1 E.8 F1800
G1 F1510
G1 X111.048 Y166.104 E.01219
G1 X110.996 Y166.529 E.0142
G1 X110.844 Y166.93 E.0142
G1 X110.601 Y167.282 E.0142
G1 X110.28 Y167.566 E.0142
G1 X109.901 Y167.765 E.0142
G1 X109.485 Y167.868 E.0142
G1 X109.057 Y167.868 E.0142
G1 X108.641 Y167.765 E.0142
G1 X108.262 Y167.566 E.0142
G1 X107.941 Y167.282 E.0142
G1 X107.698 Y166.93 E.0142
G1 X107.546 Y166.529 E.0142
G1 X107.495 Y166.104 E.0142
G1 X107.546 Y165.679 E.0142
G1 X107.698 Y165.279 E.0142
G1 X107.941 Y164.926 E.0142
G1 X108.262 Y164.642 E.0142
G1 X108.641 Y164.443 E.0142
G1 X109.057 Y164.341 E.0142
G1 X109.485 Y164.341 E.0142
G1 X109.901 Y164.443 E.0142
G1 X110.28 Y164.642 E.0142
G1 X110.601 Y164.926 E.0142
G1 X110.844 Y165.278 E.0142
G1 X110.996 Y165.679 E.0142
G1 X110.996 Y165.68 E.00002
; WIPE_START
G1 F24000
G1 X111.048 Y166.104 E-.16251
G1 X110.996 Y166.529 E-.16274
G1 X110.844 Y166.93 E-.16274
G1 X110.601 Y167.282 E-.16274
G1 X110.386 Y167.473 E-.10926
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I1.051 J-.614 P1  F30000
G1 X108.597 Y164.412 Z.6
G1 Z.2
G1 E.8 F1800
G1 F1510
G3 X109.376 Y164.284 I.678 J1.689 E.02639
M73 P52 R5
G1 X109.759 Y164.347 E.01286
G3 X108.542 Y164.435 I-.484 J1.755 E.33784
; WIPE_START
G1 F24000
G1 X108.976 Y164.304 E-.17223
G1 X109.376 Y164.284 E-.1524
G1 X109.759 Y164.347 E-.14741
G1 X110.125 Y164.493 E-.14987
G1 X110.426 Y164.697 E-.1381
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I.443 J1.133 P1  F30000
G1 X136.495 Y154.505 Z.6
G1 Z.2
G1 E.8 F1800
G1 F1510
G1 X136.446 Y154.925 E.01401
G1 X136.294 Y155.326 E.01421
G1 X136.05 Y155.678 E.0142
G1 X135.73 Y155.962 E.0142
G1 X135.357 Y156.158 E.01397
G1 X134.935 Y156.264 E.01441
G1 X134.507 Y156.264 E.01421
G1 X134.098 Y156.163 E.01397
G1 X133.712 Y155.963 E.01441
G1 X133.391 Y155.678 E.01421
G1 X133.148 Y155.326 E.0142
G1 X132.996 Y154.925 E.0142
G1 X132.945 Y154.507 E.01397
G1 X132.996 Y154.076 E.01441
G1 X133.148 Y153.675 E.01421
G1 X133.391 Y153.322 E.0142
G1 X133.712 Y153.038 E.0142
G1 X134.085 Y152.842 E.01397
G1 X134.506 Y152.737 E.01441
G1 X134.935 Y152.737 E.01421
G1 X135.351 Y152.839 E.0142
G1 X135.73 Y153.038 E.0142
G1 X136.05 Y153.322 E.0142
G1 X136.294 Y153.675 E.0142
G1 X136.446 Y154.075 E.0142
G1 X136.491 Y154.446 E.01237
; WIPE_START
G1 F24000
G1 X136.446 Y154.925 E-.18291
G1 X136.294 Y155.326 E-.16292
G1 X136.05 Y155.678 E-.16274
G1 X135.73 Y155.962 E-.16275
G1 X135.523 Y156.071 E-.08868
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I1.125 J-.465 P1  F30000
G1 X134.157 Y152.765 Z.6
G1 Z.2
G1 E.8 F1800
G1 F1510
G3 X134.911 Y152.686 I.561 J1.73 E.02533
G1 X135.277 Y152.764 E.01241
G3 X134.1 Y152.784 I-.559 J1.731 E.33907
; WIPE_START
G1 F24000
G1 X134.53 Y152.686 E-.16752
G1 X134.911 Y152.686 E-.14489
G1 X135.277 Y152.764 E-.14222
G1 X135.633 Y152.921 E-.14767
G1 X135.941 Y153.145 E-.14474
G1 X135.964 Y153.17 E-.01297
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I1.216 J.038 P1  F30000
G1 X136.623 Y132.316 Z.6
G1 Z.2
G1 E.8 F1800
G1 F1510
G1 X136.574 Y132.736 E.01401
G1 X136.422 Y133.137 E.01421
G1 X136.178 Y133.489 E.0142
G1 X135.858 Y133.773 E.0142
G1 X135.485 Y133.969 E.01397
G1 X135.063 Y134.075 E.01441
G1 X134.635 Y134.075 E.01421
G1 X134.226 Y133.974 E.01397
G1 X133.84 Y133.773 E.01441
G1 X133.519 Y133.489 E.01421
G1 X133.276 Y133.137 E.0142
G1 X133.124 Y132.736 E.0142
G1 X133.073 Y132.318 E.01397
G1 X133.124 Y131.886 E.01441
G1 X133.276 Y131.485 E.01421
G1 X133.519 Y131.133 E.0142
G1 X133.84 Y130.849 E.0142
G1 X134.213 Y130.653 E.01397
G1 X134.634 Y130.547 E.01441
G1 X135.063 Y130.547 E.01421
G1 X135.479 Y130.65 E.0142
G1 X135.858 Y130.849 E.0142
G1 X136.178 Y131.133 E.0142
G1 X136.422 Y131.485 E.0142
G1 X136.574 Y131.886 E.0142
G1 X136.619 Y132.256 E.01237
; WIPE_START
G1 F24000
G1 X136.574 Y132.736 E-.18291
G1 X136.422 Y133.137 E-.16292
G1 X136.178 Y133.489 E-.16274
G1 X135.858 Y133.773 E-.16275
G1 X135.651 Y133.882 E-.08868
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I1.125 J-.465 P1  F30000
G1 X134.285 Y130.576 Z.6
G1 Z.2
G1 E.8 F1800
G1 F1510
G3 X135.039 Y130.497 I.561 J1.73 E.02533
G1 X135.405 Y130.575 E.01241
G3 X134.228 Y130.595 I-.559 J1.731 E.33907
; WIPE_START
G1 F24000
G1 X134.658 Y130.497 E-.16752
G1 X135.039 Y130.497 E-.14489
G1 X135.405 Y130.575 E-.14222
G1 X135.761 Y130.732 E-.14767
G1 X136.069 Y130.956 E-.14474
G1 X136.092 Y130.981 E-.01297
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I1.216 J.054 P1  F30000
G1 X136.892 Y112.83 Z.6
G1 Z.2
G1 E.8 F1800
G1 F1510
G1 X136.843 Y113.249 E.01401
G1 X136.691 Y113.65 E.01421
G1 X136.448 Y114.003 E.0142
G1 X136.127 Y114.287 E.0142
G1 X135.754 Y114.483 E.01397
G1 X135.333 Y114.588 E.01441
G1 X134.904 Y114.588 E.01421
G1 X134.495 Y114.487 E.01397
G1 X134.109 Y114.287 E.01441
G1 X133.788 Y114.003 E.01421
G1 X133.545 Y113.65 E.0142
G1 X133.393 Y113.25 E.0142
G1 X133.342 Y112.832 E.01397
G1 X133.393 Y112.4 E.01441
G1 X133.545 Y111.999 E.01421
G1 X133.788 Y111.647 E.0142
G1 X134.109 Y111.363 E.0142
G1 X134.482 Y111.167 E.01397
G1 X134.903 Y111.061 E.01441
G1 X135.332 Y111.061 E.01421
G1 X135.748 Y111.164 E.0142
G1 X136.127 Y111.363 E.0142
G1 X136.448 Y111.647 E.0142
G1 X136.691 Y111.999 E.0142
G1 X136.843 Y112.4 E.0142
G1 X136.888 Y112.77 E.01237
; WIPE_START
G1 F24000
G1 X136.843 Y113.249 E-.18291
G1 X136.691 Y113.65 E-.16292
G1 X136.448 Y114.003 E-.16274
G1 X136.127 Y114.287 E-.16275
G1 X135.921 Y114.395 E-.08868
; WIPE_END
G1 E-.04 F1800
G17
M73 P53 R5
G3 Z.6 I1.125 J-.465 P1  F30000
G1 X134.554 Y111.089 Z.6
G1 Z.2
G1 E.8 F1800
G1 F1510
G3 X135.309 Y111.011 I.561 J1.73 E.02533
G1 X135.675 Y111.089 E.01241
G3 X134.498 Y111.109 I-.559 J1.731 E.33907
M106 S252.45
M106 P2 S178
; CHANGE_LAYER
; Z_HEIGHT: 0.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X134.927 Y111.011 E-.16752
G1 X135.309 Y111.011 E-.14489
G1 X135.675 Y111.089 E-.14222
G1 X136.03 Y111.245 E-.14767
G1 X136.338 Y111.469 E-.14474
G1 X136.361 Y111.495 E-.01297
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
G3 Z.6 I.631 J-1.04 P1  F30000
G1 X107.318 Y93.865 Z.6
G1 Z.4
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.37852
G1 F1461
G1 X107.362 Y94.227 E.00997
G1 X107.311 Y94.643 E.01148
G1 X107.162 Y95.036 E.01148
G1 X106.924 Y95.381 E.01148
G1 X106.61 Y95.659 E.01148
G1 X106.238 Y95.854 E.01148
G1 X105.831 Y95.955 E.01148
G1 X105.372 Y95.945 E.01255
G1 X105.004 Y95.854 E.01038
G1 X104.632 Y95.659 E.01148
G1 X104.318 Y95.381 E.01148
G1 X104.08 Y95.036 E.01148
G1 X103.931 Y94.643 E.01148
G1 X103.88 Y94.227 E.01148
G1 X103.931 Y93.81 E.01148
G1 X104.065 Y93.455 E.01038
G1 X104.318 Y93.072 E.01255
G1 X104.632 Y92.794 E.01148
G1 X105.004 Y92.599 E.01148
G1 X105.411 Y92.499 E.01148
G1 X105.87 Y92.508 E.01255
G1 X106.238 Y92.599 E.01038
G1 X106.61 Y92.794 E.01148
G1 X106.924 Y93.072 E.01148
G1 X107.162 Y93.418 E.01148
G1 X107.301 Y93.807 E.01131
M204 S10000
; WIPE_START
G1 F24000
G1 X107.362 Y94.227 E-.16101
G1 X107.311 Y94.643 E-.15946
G1 X107.162 Y95.036 E-.15946
G1 X106.924 Y95.381 E-.15946
G1 X106.686 Y95.591 E-.12062
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I1.059 J-.6 P1  F30000
G1 X104.932 Y92.499 Z.8
G1 Z.4
G1 E.8 F1800
M204 S5000
G1 F1461
G1 X104.933 Y92.499 E.00001
G3 X105.722 Y92.37 I.688 J1.728 E.02204
G1 X106.118 Y92.435 E.011
G3 X104.577 Y92.687 I-.498 J1.792 E.27545
G1 X104.879 Y92.527 E.00934
M204 S10000
; WIPE_START
G1 F24000
G1 X104.933 Y92.499 E-.02299
G1 X105.32 Y92.392 E-.15281
G1 X105.722 Y92.37 E-.15281
G1 X106.118 Y92.435 E-.15281
G1 X106.492 Y92.584 E-.1528
G1 X106.766 Y92.769 E-.12578
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I-1.19 J.254 P1  F30000
G1 X111.827 Y116.44 Z.8
G1 Z.4
G1 E.8 F1800
M204 S5000
G1 F1461
G1 X111.871 Y116.803 E.00997
G1 X111.82 Y117.219 E.01148
G1 X111.671 Y117.611 E.01148
G1 X111.433 Y117.957 E.01148
G1 X111.119 Y118.235 E.01148
G1 X110.747 Y118.43 E.01148
G1 X110.34 Y118.53 E.01148
G1 X109.881 Y118.521 E.01255
G1 X109.513 Y118.43 E.01038
G1 X109.141 Y118.235 E.01148
G1 X108.827 Y117.957 E.01148
G1 X108.589 Y117.611 E.01148
G1 X108.44 Y117.219 E.01148
G1 X108.389 Y116.803 E.01148
G1 X108.44 Y116.386 E.01148
G1 X108.574 Y116.031 E.01038
G1 X108.827 Y115.648 E.01255
G1 X109.141 Y115.37 E.01148
G1 X109.513 Y115.175 E.01148
G1 X109.92 Y115.075 E.01148
G1 X110.379 Y115.084 E.01255
G1 X110.747 Y115.175 E.01038
G1 X111.119 Y115.37 E.01148
G1 X111.433 Y115.648 E.01148
G1 X111.671 Y115.994 E.01148
G1 X111.81 Y116.383 E.01131
M204 S10000
; WIPE_START
G1 F24000
G1 X111.871 Y116.803 E-.16101
G1 X111.82 Y117.219 E-.15946
G1 X111.671 Y117.611 E-.15946
G1 X111.433 Y117.957 E-.15946
G1 X111.195 Y118.167 E-.12062
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I1.059 J-.6 P1  F30000
G1 X109.441 Y115.075 Z.8
G1 Z.4
G1 E.8 F1800
M204 S5000
G1 F1461
G1 X109.442 Y115.075 E.00001
G3 X110.231 Y114.946 I.688 J1.728 E.02204
G1 X110.627 Y115.011 E.011
G3 X109.086 Y115.263 I-.498 J1.792 E.27545
G1 X109.388 Y115.103 E.00934
M204 S10000
; WIPE_START
G1 F24000
G1 X109.442 Y115.075 E-.02299
G1 X109.829 Y114.967 E-.15281
G1 X110.231 Y114.946 E-.15281
G1 X110.627 Y115.011 E-.15281
G1 X111.001 Y115.16 E-.1528
G1 X111.275 Y115.345 E-.12578
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I-1.217 J-.007 P1  F30000
G1 X111.134 Y140.095 Z.8
G1 Z.4
G1 E.8 F1800
M204 S5000
G1 F1461
G1 X111.178 Y140.457 E.00997
G1 X111.127 Y140.873 E.01148
G1 X110.978 Y141.266 E.01148
G1 X110.74 Y141.611 E.01148
G1 X110.426 Y141.889 E.01148
G1 X110.054 Y142.084 E.01148
G1 X109.647 Y142.185 E.01148
G1 X109.188 Y142.175 E.01255
G1 X108.82 Y142.084 E.01038
G1 X108.448 Y141.889 E.01148
G1 X108.134 Y141.611 E.01148
G1 X107.896 Y141.266 E.01148
G1 X107.747 Y140.873 E.01148
G1 X107.696 Y140.457 E.01148
G1 X107.747 Y140.04 E.01148
G1 X107.881 Y139.686 E.01038
G1 X108.134 Y139.303 E.01255
G1 X108.448 Y139.024 E.01148
G1 X108.82 Y138.829 E.01148
G1 X109.227 Y138.729 E.01148
G1 X109.686 Y138.739 E.01255
G1 X110.054 Y138.829 E.01038
G1 X110.426 Y139.024 E.01148
G1 X110.74 Y139.303 E.01148
G1 X110.978 Y139.648 E.01148
G1 X111.117 Y140.038 E.01131
M204 S10000
; WIPE_START
G1 F24000
G1 X111.178 Y140.457 E-.16101
G1 X111.127 Y140.873 E-.15946
G1 X110.978 Y141.266 E-.15946
G1 X110.74 Y141.611 E-.15946
G1 X110.502 Y141.822 E-.12062
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I1.059 J-.6 P1  F30000
G1 X108.748 Y138.73 Z.8
G1 Z.4
G1 E.8 F1800
M204 S5000
G1 F1461
G1 X108.749 Y138.729 E.00001
G3 X109.538 Y138.6 I.688 J1.728 E.02204
G1 X109.934 Y138.665 E.011
G3 X108.393 Y138.918 I-.498 J1.792 E.27545
G1 X108.695 Y138.758 E.00934
M204 S10000
; WIPE_START
G1 F24000
G1 X108.749 Y138.729 E-.02299
G1 X109.136 Y138.622 E-.15281
G1 X109.538 Y138.6 E-.15281
G1 X109.934 Y138.665 E-.15281
G1 X110.308 Y138.814 E-.1528
G1 X110.582 Y139 E-.12578
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I-1.217 J.018 P1  F30000
G1 X110.968 Y165.742 Z.8
G1 Z.4
G1 E.8 F1800
M204 S5000
G1 F1461
G1 X111.012 Y166.104 E.00997
G1 X110.961 Y166.521 E.01148
G1 X110.812 Y166.913 E.01148
G1 X110.574 Y167.258 E.01148
G1 X110.26 Y167.537 E.01148
G1 X109.888 Y167.732 E.01148
G1 X109.481 Y167.832 E.01148
G1 X109.022 Y167.822 E.01255
G1 X108.654 Y167.732 E.01038
G1 X108.282 Y167.537 E.01148
G1 X107.968 Y167.258 E.01148
G1 X107.73 Y166.913 E.01148
G1 X107.581 Y166.521 E.01148
G1 X107.53 Y166.104 E.01148
G1 X107.581 Y165.688 E.01148
G1 X107.716 Y165.333 E.01038
G1 X107.968 Y164.95 E.01255
G1 X108.282 Y164.672 E.01148
G1 X108.654 Y164.477 E.01148
G1 X109.061 Y164.376 E.01148
G1 X109.52 Y164.386 E.01255
G1 X109.888 Y164.477 E.01038
G1 X110.26 Y164.672 E.01148
G1 X110.574 Y164.95 E.01148
G1 X110.812 Y165.295 E.01148
G1 X110.951 Y165.685 E.01131
M204 S10000
; WIPE_START
G1 F24000
G1 X111.012 Y166.104 E-.16101
G1 X110.961 Y166.521 E-.15946
G1 X110.812 Y166.913 E-.15946
G1 X110.574 Y167.258 E-.15946
G1 X110.336 Y167.469 E-.12062
; WIPE_END
G1 E-.04 F1800
G17
M73 P54 R5
G3 Z.8 I1.059 J-.6 P1  F30000
G1 X108.582 Y164.377 Z.8
G1 Z.4
G1 E.8 F1800
M204 S5000
G1 F1461
G1 X108.583 Y164.377 E.00001
G3 X109.372 Y164.247 I.688 J1.728 E.02204
G1 X109.769 Y164.312 E.011
G3 X108.227 Y164.565 I-.498 J1.792 E.27545
G1 X108.529 Y164.405 E.00934
M204 S10000
; WIPE_START
G1 F24000
G1 X108.583 Y164.377 E-.02299
G1 X108.97 Y164.269 E-.15281
G1 X109.372 Y164.247 E-.15281
G1 X109.769 Y164.312 E-.15281
G1 X110.142 Y164.461 E-.1528
G1 X110.416 Y164.647 E-.12578
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I.442 J1.134 P1  F30000
G1 X136.461 Y154.502 Z.8
G1 Z.4
G1 E.8 F1800
M204 S5000
G1 F1461
G1 X136.411 Y154.917 E.01144
G1 X136.262 Y155.309 E.01148
G1 X136.024 Y155.655 E.01148
G1 X135.71 Y155.933 E.01148
G1 X135.338 Y156.128 E.01148
G1 X134.931 Y156.228 E.01148
G1 X134.511 Y156.228 E.01148
G1 X134.103 Y156.128 E.01148
G1 X133.732 Y155.933 E.01148
G1 X133.418 Y155.655 E.01148
G1 X133.179 Y155.309 E.01148
G1 X133.031 Y154.917 E.01148
G1 X132.98 Y154.5 E.01148
G1 X133.031 Y154.084 E.01148
G1 X133.179 Y153.691 E.01148
G1 X133.418 Y153.346 E.01148
G1 X133.732 Y153.068 E.01148
G1 X134.103 Y152.873 E.01148
G1 X134.511 Y152.772 E.01148
G1 X134.931 Y152.772 E.01148
G1 X135.338 Y152.873 E.01148
G1 X135.71 Y153.068 E.01148
G1 X136.024 Y153.346 E.01148
G1 X136.262 Y153.691 E.01148
G1 X136.411 Y154.084 E.01148
G1 X136.454 Y154.442 E.00988
M204 S10000
; WIPE_START
G1 F24000
G1 X136.411 Y154.917 E-.18113
G1 X136.262 Y155.309 E-.15946
G1 X136.024 Y155.655 E-.15946
G1 X135.71 Y155.933 E-.15946
G1 X135.475 Y156.056 E-.1005
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I1.13 J-.452 P1  F30000
G1 X134.146 Y152.732 Z.8
G1 Z.4
G1 E.8 F1800
M204 S5000
G1 F1461
G1 X134.146 Y152.732 E.00001
G3 X135.293 Y152.731 I.575 J1.768 E.03188
G1 X135.295 Y152.732 E.00007
G3 X135.651 Y156.111 I-.592 J1.77 E.11675
G3 X133.791 Y152.89 I-.93 J-1.61 E.15975
G1 X134.091 Y152.756 E.00898
M204 S10000
; WIPE_START
G1 F24000
G1 X134.146 Y152.732 E-.02294
G1 X134.526 Y152.651 E-.14772
G1 X134.915 Y152.651 E-.14774
G1 X135.293 Y152.731 E-.1468
G1 X135.295 Y152.732 E-.00094
G1 X135.651 Y152.89 E-.14774
G1 X135.962 Y153.116 E-.14613
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I1.216 J.037 P1  F30000
G1 X136.589 Y132.312 Z.8
G1 Z.4
G1 E.8 F1800
M204 S5000
G1 F1461
G1 X136.539 Y132.728 E.01144
G1 X136.39 Y133.12 E.01148
G1 X136.152 Y133.465 E.01148
G1 X135.838 Y133.744 E.01148
G1 X135.466 Y133.939 E.01148
G1 X135.059 Y134.039 E.01148
G1 X134.639 Y134.039 E.01148
G1 X134.231 Y133.939 E.01148
G1 X133.86 Y133.744 E.01148
G1 X133.546 Y133.465 E.01148
G1 X133.307 Y133.12 E.01148
G1 X133.159 Y132.728 E.01148
G1 X133.108 Y132.311 E.01148
G1 X133.159 Y131.894 E.01148
G1 X133.307 Y131.502 E.01148
G1 X133.546 Y131.157 E.01148
G1 X133.86 Y130.878 E.01148
G1 X134.231 Y130.683 E.01148
G1 X134.639 Y130.583 E.01148
G1 X135.059 Y130.583 E.01148
G1 X135.466 Y130.683 E.01148
G1 X135.838 Y130.878 E.01148
G1 X136.152 Y131.157 E.01148
G1 X136.39 Y131.502 E.01148
G1 X136.539 Y131.894 E.01148
G1 X136.582 Y132.253 E.00988
M204 S10000
; WIPE_START
G1 F24000
G1 X136.539 Y132.728 E-.18113
G1 X136.39 Y133.12 E-.15946
G1 X136.152 Y133.465 E-.15946
G1 X135.838 Y133.744 E-.15946
G1 X135.603 Y133.866 E-.1005
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I1.13 J-.452 P1  F30000
G1 X134.274 Y130.543 Z.8
G1 Z.4
G1 E.8 F1800
M204 S5000
G1 F1461
G1 X134.274 Y130.543 E.00001
G3 X135.421 Y130.542 I.575 J1.768 E.03188
G1 X135.423 Y130.542 E.00007
G3 X135.779 Y133.922 I-.592 J1.77 E.11675
G3 X133.919 Y130.701 I-.93 J-1.61 E.15975
G1 X134.219 Y130.567 E.00898
M204 S10000
; WIPE_START
G1 F24000
G1 X134.274 Y130.543 E-.02294
G1 X134.654 Y130.462 E-.14772
G1 X135.043 Y130.462 E-.14774
G1 X135.421 Y130.542 E-.1468
G1 X135.423 Y130.542 E-.00094
G1 X135.779 Y130.7 E-.14774
G1 X136.09 Y130.927 E-.14613
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I1.216 J.052 P1  F30000
G1 X136.858 Y112.826 Z.8
G1 Z.4
G1 E.8 F1800
M204 S5000
G1 F1461
G1 X136.808 Y113.241 E.01144
G1 X136.659 Y113.634 E.01148
G1 X136.421 Y113.979 E.01148
G1 X136.107 Y114.257 E.01148
G1 X135.735 Y114.452 E.01148
G1 X135.328 Y114.553 E.01148
G1 X134.908 Y114.553 E.01148
G1 X134.501 Y114.452 E.01148
G1 X134.129 Y114.257 E.01148
G1 X133.815 Y113.979 E.01148
G1 X133.577 Y113.634 E.01148
G1 X133.428 Y113.241 E.01148
G1 X133.377 Y112.825 E.01148
G1 X133.428 Y112.408 E.01148
G1 X133.577 Y112.016 E.01148
G1 X133.815 Y111.67 E.01148
G1 X134.129 Y111.392 E.01148
G1 X134.501 Y111.197 E.01148
G1 X134.908 Y111.097 E.01148
G1 X135.328 Y111.097 E.01148
G1 X135.735 Y111.197 E.01148
G1 X136.107 Y111.392 E.01148
G1 X136.421 Y111.67 E.01148
G1 X136.659 Y112.016 E.01148
G1 X136.808 Y112.408 E.01148
G1 X136.852 Y112.767 E.00988
M204 S10000
; WIPE_START
G1 F24000
G1 X136.808 Y113.241 E-.18113
G1 X136.659 Y113.634 E-.15946
G1 X136.421 Y113.979 E-.15946
G1 X136.107 Y114.257 E-.15946
G1 X135.873 Y114.38 E-.1005
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I1.13 J-.452 P1  F30000
G1 X134.543 Y111.056 Z.8
G1 Z.4
G1 E.8 F1800
M204 S5000
G1 F1461
G1 X134.543 Y111.056 E.00001
G3 X135.69 Y111.055 I.575 J1.768 E.03188
G1 X135.693 Y111.056 E.00007
G3 X136.048 Y114.435 I-.592 J1.77 E.11675
G3 X134.188 Y111.214 I-.93 J-1.61 E.15975
G1 X134.488 Y111.081 E.00898
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 0.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X134.543 Y111.056 E-.02294
G1 X134.924 Y110.975 E-.14772
G1 X135.312 Y110.975 E-.14774
G1 X135.69 Y111.055 E-.1468
G1 X135.693 Y111.056 E-.00094
G1 X136.048 Y111.214 E-.14774
G1 X136.359 Y111.44 E-.14613
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
G3 Z.8 I.63 J-1.041 P1  F30000
G1 X107.318 Y93.864 Z.8
G1 Z.6
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X107.362 Y94.227 E.01
G1 X107.311 Y94.643 E.01148
G1 X107.162 Y95.036 E.01148
G1 X106.924 Y95.381 E.01148
G1 X106.61 Y95.659 E.01148
G1 X106.238 Y95.854 E.01148
G1 X105.831 Y95.955 E.01148
G1 X105.411 Y95.955 E.01148
G1 X105.004 Y95.854 E.01148
G1 X104.632 Y95.659 E.01148
G1 X104.357 Y95.415 E.01006
G1 X104.08 Y95.036 E.01285
G1 X103.931 Y94.643 E.01148
G1 X103.88 Y94.227 E.01148
G1 X103.931 Y93.81 E.01148
G1 X104.061 Y93.466 E.01006
G1 X104.318 Y93.072 E.01285
G1 X104.632 Y92.794 E.01148
G1 X105.004 Y92.599 E.01148
G1 X105.411 Y92.499 E.01148
G1 X105.831 Y92.499 E.01148
G1 X106.238 Y92.599 E.01148
G1 X106.61 Y92.794 E.01148
G1 X106.924 Y93.072 E.01148
G1 X107.162 Y93.418 E.01148
G1 X107.298 Y93.807 E.01127
M204 S10000
; WIPE_START
G1 F24000
G1 X107.362 Y94.227 E-.16135
G1 X107.311 Y94.643 E-.15946
G1 X107.162 Y95.036 E-.15946
G1 X106.924 Y95.381 E-.15946
G1 X106.687 Y95.591 E-.12028
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I1.059 J-.6 P1  F30000
G1 X104.933 Y92.499 Z1
G1 Z.6
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X105.32 Y92.392 E.01098
G3 X105.735 Y92.372 I.293 J1.808 E.01138
G1 X105.735 Y92.372 E0
G3 X104.878 Y92.522 I-.118 J1.852 E.29483
M204 S10000
; WIPE_START
G1 F24000
G1 X105.32 Y92.392 E-.17521
G1 X105.735 Y92.372 E-.15783
G1 X105.735 Y92.372 E0
G1 X106.118 Y92.435 E-.14767
G1 X106.492 Y92.584 E-.15281
G1 X106.768 Y92.77 E-.12649
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I-1.19 J.254 P1  F30000
G1 X111.826 Y116.439 Z1
G1 Z.6
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X111.871 Y116.803 E.01
G1 X111.82 Y117.219 E.01148
G1 X111.671 Y117.611 E.01148
G1 X111.433 Y117.957 E.01148
G1 X111.119 Y118.235 E.01148
G1 X110.747 Y118.43 E.01148
G1 X110.34 Y118.53 E.01148
G1 X109.92 Y118.53 E.01148
G1 X109.513 Y118.43 E.01148
G1 X109.141 Y118.235 E.01148
G1 X108.866 Y117.991 E.01006
G1 X108.589 Y117.611 E.01285
G1 X108.44 Y117.219 E.01148
G1 X108.389 Y116.803 E.01148
G1 X108.44 Y116.386 E.01148
G1 X108.57 Y116.042 E.01006
M73 P55 R5
G1 X108.827 Y115.648 E.01285
G1 X109.141 Y115.37 E.01148
G1 X109.513 Y115.175 E.01148
G1 X109.92 Y115.075 E.01148
G1 X110.34 Y115.075 E.01148
G1 X110.747 Y115.175 E.01148
G1 X111.119 Y115.37 E.01148
G1 X111.433 Y115.648 E.01148
G1 X111.671 Y115.994 E.01148
G1 X111.807 Y116.383 E.01127
M204 S10000
; WIPE_START
G1 F24000
G1 X111.871 Y116.803 E-.16135
G1 X111.82 Y117.219 E-.15946
G1 X111.671 Y117.611 E-.15946
G1 X111.433 Y117.957 E-.15946
G1 X111.196 Y118.167 E-.12028
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I1.059 J-.6 P1  F30000
G1 X109.442 Y115.075 Z1
G1 Z.6
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X109.829 Y114.967 E.01098
G3 X110.244 Y114.948 I.293 J1.808 E.01138
G1 X110.244 Y114.948 E0
G3 X109.387 Y115.098 I-.118 J1.852 E.29483
M204 S10000
; WIPE_START
G1 F24000
G1 X109.829 Y114.967 E-.17521
G1 X110.244 Y114.948 E-.15783
G1 X110.244 Y114.948 E0
G1 X110.627 Y115.011 E-.14767
G1 X111.001 Y115.16 E-.15281
G1 X111.276 Y115.346 E-.12649
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I-1.217 J-.007 P1  F30000
G1 X111.133 Y140.094 Z1
G1 Z.6
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X111.178 Y140.457 E.01
G1 X111.127 Y140.873 E.01148
G1 X110.978 Y141.266 E.01148
G1 X110.74 Y141.611 E.01148
G1 X110.426 Y141.889 E.01148
G1 X110.054 Y142.084 E.01148
G1 X109.647 Y142.185 E.01148
G1 X109.227 Y142.185 E.01148
G1 X108.82 Y142.084 E.01148
G1 X108.448 Y141.889 E.01148
G1 X108.173 Y141.645 E.01006
G1 X107.896 Y141.266 E.01285
G1 X107.747 Y140.873 E.01148
G1 X107.696 Y140.457 E.01148
G1 X107.747 Y140.04 E.01148
G1 X107.877 Y139.696 E.01006
G1 X108.134 Y139.303 E.01285
G1 X108.448 Y139.024 E.01148
G1 X108.82 Y138.829 E.01148
G1 X109.227 Y138.729 E.01148
G1 X109.647 Y138.729 E.01148
G1 X110.054 Y138.829 E.01148
G1 X110.426 Y139.024 E.01148
G1 X110.74 Y139.303 E.01148
G1 X110.978 Y139.648 E.01148
G1 X111.114 Y140.037 E.01127
M204 S10000
; WIPE_START
G1 F24000
G1 X111.178 Y140.457 E-.16135
G1 X111.127 Y140.873 E-.15946
G1 X110.978 Y141.266 E-.15946
G1 X110.74 Y141.611 E-.15946
G1 X110.503 Y141.821 E-.12028
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I1.059 J-.6 P1  F30000
G1 X108.749 Y138.729 Z1
G1 Z.6
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X109.136 Y138.622 E.01098
G3 X109.551 Y138.602 I.293 J1.808 E.01138
G1 X109.551 Y138.602 E0
G3 X108.694 Y138.752 I-.118 J1.852 E.29483
M204 S10000
; WIPE_START
G1 F24000
G1 X109.136 Y138.622 E-.17521
G1 X109.551 Y138.602 E-.15783
G1 X109.551 Y138.602 E0
G1 X109.934 Y138.665 E-.14767
G1 X110.308 Y138.814 E-.15281
G1 X110.583 Y139.001 E-.12649
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I-1.217 J.017 P1  F30000
G1 X110.968 Y165.741 Z1
G1 Z.6
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X111.012 Y166.104 E.01
G1 X110.961 Y166.521 E.01148
G1 X110.812 Y166.913 E.01148
G1 X110.574 Y167.258 E.01148
G1 X110.26 Y167.537 E.01148
G1 X109.888 Y167.732 E.01148
G1 X109.481 Y167.832 E.01148
G1 X109.061 Y167.832 E.01148
G1 X108.654 Y167.732 E.01148
G1 X108.282 Y167.537 E.01148
G1 X108.007 Y167.293 E.01006
G1 X107.73 Y166.913 E.01285
G1 X107.581 Y166.521 E.01148
G1 X107.53 Y166.104 E.01148
G1 X107.581 Y165.688 E.01148
G1 X107.711 Y165.344 E.01006
G1 X107.968 Y164.95 E.01285
G1 X108.282 Y164.672 E.01148
G1 X108.654 Y164.477 E.01148
G1 X109.061 Y164.376 E.01148
G1 X109.481 Y164.376 E.01148
G1 X109.888 Y164.477 E.01148
G1 X110.26 Y164.672 E.01148
G1 X110.574 Y164.95 E.01148
G1 X110.812 Y165.295 E.01148
G1 X110.948 Y165.684 E.01127
M204 S10000
; WIPE_START
G1 F24000
G1 X111.012 Y166.104 E-.16135
G1 X110.961 Y166.521 E-.15946
G1 X110.812 Y166.913 E-.15946
G1 X110.574 Y167.258 E-.15946
G1 X110.337 Y167.468 E-.12028
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I1.059 J-.6 P1  F30000
G1 X108.583 Y164.376 Z1
G1 Z.6
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X108.97 Y164.269 E.01098
G3 X109.385 Y164.249 I.293 J1.808 E.01138
G1 X109.385 Y164.249 E0
G3 X108.528 Y164.399 I-.118 J1.852 E.29483
M204 S10000
; WIPE_START
G1 F24000
G1 X108.97 Y164.269 E-.17521
G1 X109.385 Y164.249 E-.15783
G1 X109.385 Y164.249 E0
G1 X109.769 Y164.312 E-.14767
G1 X110.142 Y164.461 E-.15281
G1 X110.418 Y164.648 E-.12649
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I.442 J1.134 P1  F30000
G1 X136.461 Y154.502 Z1
G1 Z.6
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X136.411 Y154.917 E.01143
G1 X136.262 Y155.309 E.01148
G1 X136.024 Y155.655 E.01148
G1 X135.71 Y155.933 E.01148
G1 X135.338 Y156.128 E.01148
G1 X134.931 Y156.228 E.01148
G1 X134.511 Y156.228 E.01148
G1 X134.103 Y156.128 E.01148
G1 X133.732 Y155.933 E.01148
G1 X133.418 Y155.655 E.01148
G1 X133.179 Y155.309 E.01148
G1 X133.031 Y154.917 E.01148
G1 X132.98 Y154.5 E.01148
G1 X133.031 Y154.084 E.01148
G1 X133.179 Y153.691 E.01148
G1 X133.418 Y153.346 E.01148
G1 X133.732 Y153.068 E.01148
G1 X134.103 Y152.873 E.01148
G1 X134.511 Y152.772 E.01148
G1 X134.931 Y152.772 E.01148
G1 X135.338 Y152.873 E.01148
G1 X135.71 Y153.068 E.01148
G1 X136.024 Y153.346 E.01148
G1 X136.262 Y153.691 E.01148
G1 X136.411 Y154.084 E.01148
G1 X136.454 Y154.442 E.00988
M204 S10000
; WIPE_START
G1 F24000
G1 X136.411 Y154.917 E-.18102
G1 X136.262 Y155.309 E-.15946
G1 X136.024 Y155.655 E-.15946
G1 X135.71 Y155.933 E-.15946
G1 X135.475 Y156.056 E-.10061
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I1.13 J-.452 P1  F30000
G1 X134.146 Y152.732 Z1
G1 Z.6
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X134.148 Y152.737 E.00016
G3 X135.278 Y152.728 I.58 J1.763 E.03142
G1 X135.295 Y152.732 E.00048
G3 X135.651 Y156.111 I-.592 J1.77 E.11675
G3 X133.794 Y152.896 I-.923 J-1.61 E.15916
G1 X134.091 Y152.757 E.00896
M204 S10000
; WIPE_START
G1 F24000
G1 X134.148 Y152.737 E-.02279
G1 X134.526 Y152.651 E-.14751
G1 X134.915 Y152.651 E-.14774
G1 X135.278 Y152.728 E-.14113
G1 X135.295 Y152.732 E-.0066
G1 X135.651 Y152.89 E-.14774
G1 X135.962 Y153.116 E-.14648
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I1.216 J.037 P1  F30000
G1 X136.589 Y132.313 Z1
G1 Z.6
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X136.539 Y132.728 E.01143
G1 X136.39 Y133.12 E.01148
G1 X136.152 Y133.465 E.01148
G1 X135.838 Y133.744 E.01148
G1 X135.466 Y133.939 E.01148
G1 X135.059 Y134.039 E.01148
G1 X134.639 Y134.039 E.01148
G1 X134.231 Y133.939 E.01148
G1 X133.86 Y133.744 E.01148
G1 X133.546 Y133.465 E.01148
G1 X133.307 Y133.12 E.01148
G1 X133.159 Y132.728 E.01148
G1 X133.108 Y132.311 E.01148
G1 X133.159 Y131.894 E.01148
G1 X133.307 Y131.502 E.01148
G1 X133.546 Y131.157 E.01148
G1 X133.86 Y130.878 E.01148
G1 X134.231 Y130.683 E.01148
G1 X134.639 Y130.583 E.01148
G1 X135.059 Y130.583 E.01148
G1 X135.466 Y130.683 E.01148
G1 X135.838 Y130.878 E.01148
G1 X136.152 Y131.157 E.01148
G1 X136.39 Y131.502 E.01148
G1 X136.539 Y131.894 E.01148
G1 X136.582 Y132.253 E.00988
M204 S10000
; WIPE_START
G1 F24000
G1 X136.539 Y132.728 E-.18102
G1 X136.39 Y133.12 E-.15946
G1 X136.152 Y133.465 E-.15946
G1 X135.838 Y133.744 E-.15946
G1 X135.603 Y133.867 E-.10061
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I1.13 J-.452 P1  F30000
G1 X134.274 Y130.543 Z1
G1 Z.6
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X134.276 Y130.548 E.00016
G3 X135.406 Y130.539 I.58 J1.763 E.03142
G1 X135.423 Y130.542 E.00048
G3 X135.779 Y133.922 I-.592 J1.77 E.11675
G3 X133.922 Y130.707 I-.923 J-1.61 E.15916
G1 X134.219 Y130.568 E.00896
M204 S10000
; WIPE_START
G1 F24000
G1 X134.276 Y130.548 E-.02279
G1 X134.654 Y130.462 E-.14751
G1 X135.043 Y130.462 E-.14774
G1 X135.406 Y130.539 E-.14113
G1 X135.423 Y130.542 E-.0066
G1 X135.779 Y130.7 E-.14774
M73 P56 R5
G1 X136.09 Y130.927 E-.14648
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I1.216 J.052 P1  F30000
G1 X136.858 Y112.826 Z1
G1 Z.6
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X136.808 Y113.241 E.01143
G1 X136.659 Y113.634 E.01148
G1 X136.421 Y113.979 E.01148
G1 X136.107 Y114.257 E.01148
G1 X135.735 Y114.452 E.01148
G1 X135.328 Y114.553 E.01148
G1 X134.908 Y114.553 E.01148
G1 X134.501 Y114.452 E.01148
G1 X134.129 Y114.257 E.01148
G1 X133.815 Y113.979 E.01148
G1 X133.577 Y113.634 E.01148
G1 X133.428 Y113.241 E.01148
G1 X133.377 Y112.825 E.01148
G1 X133.428 Y112.408 E.01148
G1 X133.577 Y112.016 E.01148
G1 X133.815 Y111.67 E.01148
G1 X134.129 Y111.392 E.01148
G1 X134.501 Y111.197 E.01148
G1 X134.908 Y111.097 E.01148
G1 X135.328 Y111.097 E.01148
G1 X135.735 Y111.197 E.01148
G1 X136.107 Y111.392 E.01148
G1 X136.421 Y111.67 E.01148
G1 X136.659 Y112.016 E.01148
G1 X136.808 Y112.408 E.01148
G1 X136.852 Y112.767 E.00988
M204 S10000
; WIPE_START
G1 F24000
G1 X136.808 Y113.241 E-.18102
G1 X136.659 Y113.634 E-.15946
G1 X136.421 Y113.979 E-.15946
G1 X136.107 Y114.257 E-.15946
G1 X135.872 Y114.38 E-.10061
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I1.13 J-.452 P1  F30000
G1 X134.543 Y111.056 Z1
G1 Z.6
M73 P56 R4
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X134.545 Y111.062 E.00016
G3 X135.676 Y111.052 I.58 J1.763 E.03142
G1 X135.693 Y111.056 E.00048
G3 X136.048 Y114.435 I-.592 J1.77 E.11675
G3 X134.192 Y111.22 I-.923 J-1.61 E.15916
G1 X134.489 Y111.082 E.00896
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 0.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X134.545 Y111.062 E-.02279
G1 X134.924 Y110.975 E-.14751
G1 X135.312 Y110.975 E-.14774
G1 X135.676 Y111.052 E-.14113
G1 X135.693 Y111.056 E-.0066
G1 X136.048 Y111.214 E-.14774
G1 X136.36 Y111.441 E-.14648
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
G3 Z1 I.63 J-1.041 P1  F30000
G1 X107.317 Y93.861 Z1
G1 Z.8
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X107.319 Y93.873 E.00032
G1 X107.362 Y94.227 E.00975
G1 X107.311 Y94.643 E.01148
G1 X107.162 Y95.036 E.01148
G1 X106.924 Y95.381 E.01148
G1 X106.61 Y95.659 E.01148
G1 X106.238 Y95.854 E.01148
G1 X105.831 Y95.955 E.01148
G1 X105.411 Y95.955 E.01148
G1 X105.004 Y95.854 E.01148
G1 X104.632 Y95.659 E.01148
G1 X104.365 Y95.423 E.00975
G1 X104.318 Y95.381 E.00173
G1 X104.08 Y95.036 E.01148
G1 X103.931 Y94.643 E.01148
G1 X103.88 Y94.227 E.01148
G1 X103.931 Y93.81 E.01148
G1 X104.057 Y93.477 E.00975
G1 X104.08 Y93.418 E.00173
G1 X104.318 Y93.072 E.01148
G1 X104.632 Y92.794 E.01148
G1 X104.688 Y92.765 E.00173
G1 X105.004 Y92.599 E.00975
G1 X105.411 Y92.499 E.01148
G1 X105.831 Y92.499 E.01148
G1 X106.238 Y92.599 E.01148
G1 X106.61 Y92.794 E.01148
G1 X106.924 Y93.072 E.01148
G1 X107.162 Y93.418 E.01148
G1 X107.308 Y93.802 E.01124
M204 S10000
; WIPE_START
G1 F24000
G1 X107.319 Y93.873 E-.02723
G1 X107.362 Y94.227 E-.13543
G1 X107.311 Y94.643 E-.15946
G1 X107.162 Y95.036 E-.15946
G1 X106.924 Y95.381 E-.15946
G1 X106.69 Y95.588 E-.11897
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I1.058 J-.601 P1  F30000
G1 X104.933 Y92.499 Z1.2
G1 Z.8
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X105.32 Y92.392 E.01098
G3 X105.748 Y92.374 I.292 J1.818 E.01175
G3 X104.577 Y92.687 I-.132 J1.851 E.28507
G3 X104.878 Y92.522 I1.035 J1.523 E.0094
M204 S10000
; WIPE_START
G1 F24000
G1 X105.32 Y92.392 E-.17517
G1 X105.748 Y92.374 E-.16286
G1 X106.118 Y92.435 E-.14249
G1 X106.492 Y92.584 E-.15281
G1 X106.768 Y92.771 E-.12668
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I-1.19 J.254 P1  F30000
G1 X111.826 Y116.437 Z1.2
G1 Z.8
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X111.828 Y116.449 E.00032
G1 X111.871 Y116.803 E.00975
G1 X111.82 Y117.219 E.01148
G1 X111.671 Y117.611 E.01148
G1 X111.433 Y117.957 E.01148
G1 X111.119 Y118.235 E.01148
G1 X110.747 Y118.43 E.01148
G1 X110.34 Y118.53 E.01148
G1 X109.92 Y118.53 E.01148
G1 X109.513 Y118.43 E.01148
G1 X109.141 Y118.235 E.01148
G1 X108.874 Y117.999 E.00975
G1 X108.827 Y117.957 E.00173
G1 X108.589 Y117.611 E.01148
G1 X108.44 Y117.219 E.01148
G1 X108.389 Y116.803 E.01148
G1 X108.44 Y116.386 E.01148
G1 X108.566 Y116.053 E.00975
G1 X108.589 Y115.994 E.00173
G1 X108.827 Y115.648 E.01148
G1 X109.141 Y115.37 E.01148
G1 X109.197 Y115.341 E.00173
G1 X109.513 Y115.175 E.00975
G1 X109.92 Y115.075 E.01148
G1 X110.34 Y115.075 E.01148
G1 X110.747 Y115.175 E.01148
G1 X111.119 Y115.37 E.01148
G1 X111.433 Y115.648 E.01148
G1 X111.671 Y115.994 E.01148
G1 X111.817 Y116.378 E.01124
M204 S10000
; WIPE_START
G1 F24000
G1 X111.828 Y116.449 E-.02723
G1 X111.871 Y116.803 E-.13543
G1 X111.82 Y117.219 E-.15946
G1 X111.671 Y117.611 E-.15946
G1 X111.433 Y117.957 E-.15946
G1 X111.198 Y118.164 E-.11897
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I1.058 J-.601 P1  F30000
G1 X109.442 Y115.075 Z1.2
G1 Z.8
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X109.829 Y114.968 E.01098
G3 X110.257 Y114.95 I.292 J1.818 E.01175
G3 X109.086 Y115.263 I-.132 J1.851 E.28507
G3 X109.387 Y115.098 I1.035 J1.523 E.0094
M204 S10000
; WIPE_START
G1 F24000
G1 X109.829 Y114.968 E-.17517
G1 X110.257 Y114.95 E-.16286
G1 X110.627 Y115.011 E-.14249
G1 X111.001 Y115.16 E-.15281
G1 X111.277 Y115.347 E-.12668
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I-1.217 J-.007 P1  F30000
G1 X111.133 Y140.091 Z1.2
G1 Z.8
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X111.135 Y140.103 E.00032
G1 X111.178 Y140.457 E.00975
G1 X111.127 Y140.873 E.01148
G1 X110.978 Y141.266 E.01148
G1 X110.74 Y141.611 E.01148
G1 X110.426 Y141.889 E.01148
G1 X110.054 Y142.084 E.01148
G1 X109.647 Y142.185 E.01148
G1 X109.227 Y142.185 E.01148
G1 X108.82 Y142.084 E.01148
G1 X108.448 Y141.889 E.01148
G1 X108.181 Y141.653 E.00975
G1 X108.134 Y141.611 E.00173
G1 X107.896 Y141.266 E.01148
G1 X107.747 Y140.873 E.01148
G1 X107.696 Y140.457 E.01148
G1 X107.747 Y140.04 E.01148
G1 X107.873 Y139.707 E.00975
G1 X107.896 Y139.648 E.00173
G1 X108.134 Y139.303 E.01148
G1 X108.448 Y139.024 E.01148
G1 X108.504 Y138.995 E.00173
G1 X108.82 Y138.829 E.00975
G1 X109.227 Y138.729 E.01148
G1 X109.647 Y138.729 E.01148
G1 X110.054 Y138.829 E.01148
G1 X110.426 Y139.024 E.01148
G1 X110.74 Y139.303 E.01148
G1 X110.978 Y139.648 E.01148
G1 X111.124 Y140.032 E.01124
M204 S10000
; WIPE_START
G1 F24000
G1 X111.135 Y140.103 E-.02723
G1 X111.178 Y140.457 E-.13543
G1 X111.127 Y140.873 E-.15946
G1 X110.978 Y141.266 E-.15946
G1 X110.74 Y141.611 E-.15946
G1 X110.505 Y141.819 E-.11897
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I1.058 J-.601 P1  F30000
G1 X108.749 Y138.729 Z1.2
G1 Z.8
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X109.136 Y138.623 E.01098
G3 X109.564 Y138.604 I.292 J1.818 E.01175
G3 X108.393 Y138.918 I-.132 J1.851 E.28507
G3 X108.694 Y138.752 I1.035 J1.523 E.0094
M204 S10000
; WIPE_START
G1 F24000
G1 X109.136 Y138.623 E-.17517
G1 X109.564 Y138.604 E-.16286
G1 X109.934 Y138.665 E-.14249
G1 X110.308 Y138.814 E-.15281
G1 X110.584 Y139.001 E-.12668
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I-1.217 J.017 P1  F30000
G1 X110.967 Y165.739 Z1.2
G1 Z.8
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X110.969 Y165.75 E.00032
G1 X111.012 Y166.104 E.00975
G1 X110.961 Y166.521 E.01148
G1 X110.812 Y166.913 E.01148
G1 X110.574 Y167.258 E.01148
G1 X110.26 Y167.537 E.01148
G1 X109.888 Y167.732 E.01148
G1 X109.481 Y167.832 E.01148
G1 X109.061 Y167.832 E.01148
G1 X108.654 Y167.732 E.01148
G1 X108.282 Y167.537 E.01148
G1 X108.016 Y167.3 E.00975
G1 X107.968 Y167.258 E.00173
G1 X107.73 Y166.913 E.01148
G1 X107.581 Y166.521 E.01148
G1 X107.53 Y166.104 E.01148
G1 X107.581 Y165.688 E.01148
G1 X107.707 Y165.354 E.00975
G1 X107.73 Y165.295 E.00173
G1 X107.968 Y164.95 E.01148
G1 X108.282 Y164.672 E.01148
G1 X108.338 Y164.642 E.00173
G1 X108.654 Y164.477 E.00975
G1 X109.061 Y164.376 E.01148
G1 X109.481 Y164.376 E.01148
G1 X109.888 Y164.477 E.01148
G1 X110.26 Y164.672 E.01148
G1 X110.574 Y164.95 E.01148
G1 X110.812 Y165.295 E.01148
G1 X110.958 Y165.679 E.01124
M204 S10000
; WIPE_START
G1 F24000
G1 X110.969 Y165.75 E-.02723
G1 X111.012 Y166.104 E-.13543
G1 X110.961 Y166.521 E-.15946
G1 X110.812 Y166.913 E-.15946
G1 X110.574 Y167.258 E-.15946
G1 X110.34 Y167.466 E-.11897
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I1.058 J-.601 P1  F30000
M73 P57 R4
G1 X108.583 Y164.376 Z1.2
G1 Z.8
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X108.97 Y164.27 E.01098
G3 X109.399 Y164.252 I.292 J1.818 E.01175
G3 X108.227 Y164.565 I-.132 J1.851 E.28507
G3 X108.528 Y164.399 I1.035 J1.523 E.0094
M204 S10000
; WIPE_START
G1 F24000
G1 X108.97 Y164.27 E-.17517
G1 X109.399 Y164.252 E-.16286
G1 X109.769 Y164.312 E-.14249
G1 X110.142 Y164.461 E-.15281
G1 X110.418 Y164.648 E-.12668
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I.442 J1.134 P1  F30000
G1 X136.461 Y154.502 Z1.2
G1 Z.8
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X136.411 Y154.917 E.01142
G1 X136.262 Y155.309 E.01148
G1 X136.024 Y155.655 E.01148
G1 X135.71 Y155.933 E.01148
G1 X135.338 Y156.128 E.01148
G1 X134.931 Y156.228 E.01148
G1 X134.511 Y156.228 E.01148
G1 X134.103 Y156.128 E.01148
G1 X133.732 Y155.933 E.01148
G1 X133.418 Y155.655 E.01148
G1 X133.379 Y155.598 E.00187
G1 X133.179 Y155.309 E.0096
G1 X133.031 Y154.917 E.01148
G1 X132.98 Y154.5 E.01148
G1 X133.031 Y154.084 E.01148
G1 X133.179 Y153.691 E.01148
G1 X133.418 Y153.346 E.01148
G1 X133.732 Y153.068 E.01148
G1 X134.103 Y152.873 E.01148
G1 X134.511 Y152.772 E.01148
G1 X134.931 Y152.772 E.01148
G1 X135.338 Y152.873 E.01148
G1 X135.71 Y153.068 E.01148
G1 X136.024 Y153.346 E.01148
G1 X136.262 Y153.691 E.01148
G1 X136.411 Y154.084 E.01148
G1 X136.454 Y154.443 E.00989
M204 S10000
; WIPE_START
G1 F24000
G1 X136.411 Y154.917 E-.18091
G1 X136.262 Y155.309 E-.15946
G1 X136.024 Y155.655 E-.15946
G1 X135.71 Y155.933 E-.15946
G1 X135.475 Y156.056 E-.10071
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I1.13 J-.452 P1  F30000
G1 X134.146 Y152.732 Z1.2
G1 Z.8
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X134.527 Y152.655 E.01061
G3 X135.264 Y152.725 I.196 J1.847 E.02038
G1 X135.295 Y152.732 E.00088
G3 X135.651 Y156.111 I-.592 J1.77 E.11675
G3 X134.095 Y152.754 I-.928 J-1.609 E.16863
M204 S10000
; WIPE_START
G1 F24000
G1 X134.527 Y152.655 E-.16841
G1 X134.915 Y152.651 E-.14759
G1 X135.264 Y152.725 E-.13547
G1 X135.295 Y152.732 E-.01227
G1 X135.651 Y152.89 E-.14774
G1 X135.965 Y153.118 E-.14774
G1 X135.967 Y153.12 E-.00079
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I1.216 J.036 P1  F30000
G1 X136.589 Y132.313 Z1.2
G1 Z.8
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X136.539 Y132.728 E.01142
G1 X136.39 Y133.12 E.01148
G1 X136.152 Y133.465 E.01148
G1 X135.838 Y133.744 E.01148
G1 X135.466 Y133.939 E.01148
G1 X135.059 Y134.039 E.01148
G1 X134.639 Y134.039 E.01148
G1 X134.231 Y133.939 E.01148
G1 X133.86 Y133.744 E.01148
G1 X133.546 Y133.465 E.01148
G1 X133.507 Y133.409 E.00187
G1 X133.307 Y133.12 E.0096
G1 X133.159 Y132.728 E.01148
G1 X133.108 Y132.311 E.01148
G1 X133.159 Y131.894 E.01148
G1 X133.307 Y131.502 E.01148
G1 X133.546 Y131.157 E.01148
G1 X133.86 Y130.878 E.01148
G1 X134.231 Y130.683 E.01148
G1 X134.639 Y130.583 E.01148
G1 X135.059 Y130.583 E.01148
G1 X135.466 Y130.683 E.01148
G1 X135.838 Y130.878 E.01148
G1 X136.152 Y131.157 E.01148
G1 X136.39 Y131.502 E.01148
G1 X136.539 Y131.894 E.01148
G1 X136.582 Y132.254 E.00989
M204 S10000
; WIPE_START
G1 F24000
G1 X136.539 Y132.728 E-.18091
G1 X136.39 Y133.12 E-.15946
G1 X136.152 Y133.465 E-.15946
G1 X135.838 Y133.744 E-.15946
G1 X135.603 Y133.867 E-.10071
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I1.13 J-.452 P1  F30000
G1 X134.274 Y130.542 Z1.2
G1 Z.8
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X134.655 Y130.465 E.01061
G3 X135.392 Y130.536 I.196 J1.847 E.02038
G1 X135.423 Y130.542 E.00088
G3 X135.779 Y133.922 I-.592 J1.77 E.11675
G3 X134.223 Y130.564 I-.928 J-1.609 E.16863
M204 S10000
; WIPE_START
G1 F24000
G1 X134.655 Y130.465 E-.16841
G1 X135.043 Y130.462 E-.14759
G1 X135.392 Y130.536 E-.13547
G1 X135.423 Y130.542 E-.01227
G1 X135.779 Y130.7 E-.14774
G1 X136.093 Y130.929 E-.14774
G1 X136.094 Y130.931 E-.00079
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I1.216 J.051 P1  F30000
G1 X136.858 Y112.827 Z1.2
G1 Z.8
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X136.808 Y113.241 E.01142
G1 X136.659 Y113.634 E.01148
G1 X136.421 Y113.979 E.01148
G1 X136.107 Y114.257 E.01148
G1 X135.735 Y114.452 E.01148
G1 X135.328 Y114.553 E.01148
G1 X134.908 Y114.553 E.01148
G1 X134.501 Y114.452 E.01148
G1 X134.129 Y114.257 E.01148
G1 X133.815 Y113.979 E.01148
G1 X133.776 Y113.923 E.00187
G1 X133.577 Y113.634 E.0096
G1 X133.428 Y113.241 E.01148
G1 X133.377 Y112.825 E.01148
G1 X133.428 Y112.408 E.01148
G1 X133.577 Y112.016 E.01148
G1 X133.815 Y111.67 E.01148
G1 X134.129 Y111.392 E.01148
G1 X134.501 Y111.197 E.01148
G1 X134.908 Y111.097 E.01148
G1 X135.328 Y111.097 E.01148
G1 X135.735 Y111.197 E.01148
G1 X136.107 Y111.392 E.01148
G1 X136.421 Y111.67 E.01148
G1 X136.659 Y112.016 E.01148
G1 X136.808 Y112.408 E.01148
G1 X136.852 Y112.767 E.00989
M204 S10000
; WIPE_START
G1 F24000
G1 X136.808 Y113.241 E-.18091
G1 X136.659 Y113.634 E-.15946
G1 X136.421 Y113.979 E-.15946
G1 X136.107 Y114.257 E-.15946
G1 X135.872 Y114.38 E-.10071
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I1.13 J-.452 P1  F30000
G1 X134.544 Y111.056 Z1.2
G1 Z.8
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X134.924 Y110.979 E.01061
G3 X135.661 Y111.049 I.196 J1.847 E.02038
G1 X135.693 Y111.056 E.00088
G3 X136.048 Y114.435 I-.592 J1.77 E.11675
G3 X134.492 Y111.078 I-.928 J-1.609 E.16863
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X134.924 Y110.979 E-.16841
G1 X135.312 Y110.975 E-.14759
G1 X135.661 Y111.049 E-.13547
G1 X135.693 Y111.056 E-.01227
G1 X136.048 Y111.214 E-.14774
G1 X136.362 Y111.443 E-.14774
G1 X136.364 Y111.444 E-.00079
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
G3 Z1.2 I.63 J-1.041 P1  F30000
G1 X107.317 Y93.859 Z1.2
G1 Z1
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X107.32 Y93.884 E.00069
G1 X107.362 Y94.227 E.00943
G1 X107.311 Y94.643 E.01148
G1 X107.162 Y95.036 E.01148
G1 X106.924 Y95.381 E.01148
G1 X106.61 Y95.659 E.01148
G1 X106.238 Y95.854 E.01148
G1 X105.831 Y95.955 E.01148
G1 X105.411 Y95.955 E.01148
G1 X105.004 Y95.854 E.01148
G1 X104.632 Y95.659 E.01148
G1 X104.318 Y95.381 E.01148
G1 X104.08 Y95.036 E.01148
G1 X103.931 Y94.643 E.01148
G1 X103.88 Y94.227 E.01148
G1 X103.931 Y93.81 E.01148
G1 X104.053 Y93.488 E.00943
G1 X104.08 Y93.418 E.00204
G1 X104.318 Y93.072 E.01148
G1 X104.632 Y92.794 E.01148
G1 X105.004 Y92.599 E.01148
G1 X105.411 Y92.499 E.01148
G1 X105.831 Y92.499 E.01148
G1 X106.238 Y92.599 E.01148
G1 X106.61 Y92.794 E.01148
G1 X106.924 Y93.072 E.01148
G1 X107.162 Y93.418 E.01148
G1 X107.307 Y93.8 E.01119
M204 S10000
; WIPE_START
G1 F24000
G1 X107.32 Y93.884 E-.03227
G1 X107.362 Y94.227 E-.13107
G1 X107.311 Y94.643 E-.15946
G1 X107.162 Y95.036 E-.15946
G1 X106.924 Y95.381 E-.15946
G1 X106.691 Y95.587 E-.11829
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I1.058 J-.602 P1  F30000
G1 X104.933 Y92.499 Z1.4
G1 Z1
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X105.321 Y92.397 E.01097
G3 X105.762 Y92.376 I.305 J1.829 E.0121
G1 X105.762 Y92.376 E0
G3 X106.791 Y95.667 I-.135 J1.848 E.12111
G1 X106.791 Y95.667 E0
G3 X104.885 Y92.526 I-1.165 J-1.442 E.1729
M204 S10000
; WIPE_START
G1 F24000
G1 X105.321 Y92.397 E-.17261
G1 X105.762 Y92.376 E-.16773
G1 X105.762 Y92.376 E0
G1 X106.118 Y92.435 E-.1373
G1 X106.492 Y92.584 E-.15281
G1 X106.774 Y92.775 E-.12954
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I-1.19 J.254 P1  F30000
G1 X111.826 Y116.435 Z1.4
G1 Z1
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X111.829 Y116.46 E.00069
G1 X111.871 Y116.803 E.00943
G1 X111.82 Y117.219 E.01148
G1 X111.671 Y117.611 E.01148
G1 X111.433 Y117.957 E.01148
G1 X111.119 Y118.235 E.01148
G1 X110.747 Y118.43 E.01148
G1 X110.34 Y118.53 E.01148
G1 X109.92 Y118.53 E.01148
G1 X109.513 Y118.43 E.01148
G1 X109.141 Y118.235 E.01148
G1 X108.827 Y117.957 E.01148
G1 X108.589 Y117.611 E.01148
G1 X108.44 Y117.219 E.01148
G1 X108.389 Y116.803 E.01148
G1 X108.44 Y116.386 E.01148
G1 X108.562 Y116.063 E.00943
G1 X108.589 Y115.994 E.00204
G1 X108.827 Y115.648 E.01148
G1 X109.141 Y115.37 E.01148
G1 X109.513 Y115.175 E.01148
G1 X109.92 Y115.075 E.01148
G1 X110.34 Y115.075 E.01148
G1 X110.747 Y115.175 E.01148
G1 X111.119 Y115.37 E.01148
G1 X111.433 Y115.648 E.01148
G1 X111.671 Y115.994 E.01148
G1 X111.816 Y116.376 E.01119
M204 S10000
; WIPE_START
G1 F24000
G1 X111.829 Y116.46 E-.03227
G1 X111.871 Y116.803 E-.13107
G1 X111.82 Y117.219 E-.15946
G1 X111.671 Y117.611 E-.15946
G1 X111.433 Y117.957 E-.15946
G1 X111.2 Y118.163 E-.11829
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I1.058 J-.602 P1  F30000
M73 P58 R4
G1 X109.442 Y115.075 Z1.4
G1 Z1
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X109.83 Y114.972 E.01097
G3 X110.271 Y114.952 I.305 J1.829 E.0121
G1 X110.271 Y114.952 E0
G3 X111.3 Y118.243 I-.135 J1.848 E.12111
G1 X111.3 Y118.243 E0
G3 X109.394 Y115.101 I-1.165 J-1.442 E.1729
M204 S10000
; WIPE_START
G1 F24000
G1 X109.83 Y114.972 E-.17261
G1 X110.271 Y114.952 E-.16773
G1 X110.271 Y114.952 E0
G1 X110.627 Y115.011 E-.1373
G1 X111.001 Y115.16 E-.15281
G1 X111.283 Y115.351 E-.12954
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I-1.217 J-.007 P1  F30000
G1 X111.133 Y140.089 Z1.4
G1 Z1
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X111.136 Y140.114 E.00069
G1 X111.178 Y140.457 E.00943
G1 X111.127 Y140.873 E.01148
G1 X110.978 Y141.266 E.01148
G1 X110.74 Y141.611 E.01148
G1 X110.426 Y141.889 E.01148
G1 X110.054 Y142.084 E.01148
G1 X109.647 Y142.185 E.01148
G1 X109.227 Y142.185 E.01148
G1 X108.82 Y142.084 E.01148
G1 X108.448 Y141.889 E.01148
G1 X108.134 Y141.611 E.01148
G1 X107.896 Y141.266 E.01148
G1 X107.747 Y140.873 E.01148
G1 X107.696 Y140.457 E.01148
G1 X107.747 Y140.04 E.01148
G1 X107.869 Y139.718 E.00943
G1 X107.896 Y139.648 E.00204
G1 X108.134 Y139.303 E.01148
G1 X108.448 Y139.024 E.01148
G1 X108.82 Y138.829 E.01148
G1 X109.227 Y138.729 E.01148
G1 X109.647 Y138.729 E.01148
G1 X110.054 Y138.829 E.01148
G1 X110.426 Y139.024 E.01148
G1 X110.74 Y139.303 E.01148
G1 X110.978 Y139.648 E.01148
G1 X111.123 Y140.031 E.01119
M204 S10000
; WIPE_START
G1 F24000
G1 X111.136 Y140.114 E-.03227
G1 X111.178 Y140.457 E-.13107
G1 X111.127 Y140.873 E-.15946
G1 X110.978 Y141.266 E-.15946
G1 X110.74 Y141.611 E-.15946
G1 X110.507 Y141.818 E-.11829
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I1.058 J-.602 P1  F30000
G1 X108.749 Y138.729 Z1.4
G1 Z1
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X109.137 Y138.627 E.01097
G3 X109.578 Y138.607 I.305 J1.829 E.0121
G1 X109.578 Y138.607 E0
G3 X110.607 Y141.897 I-.135 J1.848 E.12111
G1 X110.607 Y141.897 E0
G3 X108.701 Y138.756 I-1.165 J-1.442 E.1729
M204 S10000
; WIPE_START
G1 F24000
G1 X109.137 Y138.627 E-.17261
G1 X109.578 Y138.607 E-.16773
G1 X109.578 Y138.607 E0
G1 X109.934 Y138.665 E-.1373
G1 X110.308 Y138.814 E-.15281
G1 X110.59 Y139.005 E-.12954
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I-1.217 J.017 P1  F30000
G1 X110.967 Y165.737 Z1.4
G1 Z1
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X110.97 Y165.762 E.00069
G1 X111.012 Y166.104 E.00943
G1 X110.961 Y166.521 E.01148
G1 X110.812 Y166.913 E.01148
G1 X110.574 Y167.258 E.01148
G1 X110.26 Y167.537 E.01148
G1 X109.888 Y167.732 E.01148
G1 X109.481 Y167.832 E.01148
G1 X109.061 Y167.832 E.01148
G1 X108.654 Y167.732 E.01148
G1 X108.282 Y167.537 E.01148
G1 X107.968 Y167.258 E.01148
G1 X107.73 Y166.913 E.01148
G1 X107.581 Y166.521 E.01148
G1 X107.53 Y166.104 E.01148
G1 X107.581 Y165.688 E.01148
G1 X107.703 Y165.365 E.00943
G1 X107.73 Y165.295 E.00204
G1 X107.968 Y164.95 E.01148
G1 X108.282 Y164.672 E.01148
G1 X108.654 Y164.477 E.01148
G1 X109.061 Y164.376 E.01148
G1 X109.481 Y164.376 E.01148
G1 X109.888 Y164.477 E.01148
G1 X110.26 Y164.672 E.01148
G1 X110.574 Y164.95 E.01148
G1 X110.812 Y165.295 E.01148
G1 X110.957 Y165.678 E.01119
M204 S10000
; WIPE_START
G1 F24000
G1 X110.97 Y165.762 E-.03227
G1 X111.012 Y166.104 E-.13107
G1 X110.961 Y166.521 E-.15946
G1 X110.812 Y166.913 E-.15946
G1 X110.574 Y167.258 E-.15946
G1 X110.341 Y167.465 E-.11829
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I1.058 J-.602 P1  F30000
G1 X108.583 Y164.376 Z1.4
G1 Z1
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X108.971 Y164.274 E.01097
G3 X109.412 Y164.254 I.305 J1.829 E.0121
G1 X109.412 Y164.254 E0
G3 X110.441 Y167.544 I-.135 J1.848 E.12111
G1 X110.441 Y167.544 E0
G3 X108.536 Y164.403 I-1.165 J-1.442 E.1729
M204 S10000
; WIPE_START
G1 F24000
G1 X108.971 Y164.274 E-.17261
G1 X109.412 Y164.254 E-.16773
G1 X109.412 Y164.254 E0
G1 X109.769 Y164.312 E-.1373
G1 X110.142 Y164.461 E-.15281
G1 X110.424 Y164.652 E-.12954
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I.442 J1.134 P1  F30000
G1 X136.461 Y154.503 Z1.4
G1 Z1
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X136.421 Y154.836 E.00918
G1 X136.411 Y154.917 E.00223
G1 X136.262 Y155.309 E.01148
G1 X136.024 Y155.655 E.01148
G1 X135.71 Y155.933 E.01148
G1 X135.338 Y156.128 E.01148
G1 X134.931 Y156.228 E.01148
G1 X134.511 Y156.228 E.01148
G1 X134.103 Y156.128 E.01148
G1 X133.732 Y155.933 E.01148
G1 X133.418 Y155.655 E.01148
G1 X133.179 Y155.309 E.01148
G1 X133.031 Y154.917 E.01148
G1 X132.98 Y154.5 E.01148
G1 X133.021 Y154.165 E.00925
G1 X133.031 Y154.084 E.00223
G1 X133.179 Y153.691 E.01148
G1 X133.418 Y153.346 E.01148
G1 X133.732 Y153.068 E.01148
G1 X134.103 Y152.873 E.01148
G1 X134.511 Y152.772 E.01148
G1 X134.931 Y152.772 E.01148
G1 X135.338 Y152.873 E.01148
G1 X135.71 Y153.068 E.01148
G1 X136.024 Y153.346 E.01148
G1 X136.262 Y153.691 E.01148
G1 X136.411 Y154.084 E.01148
G1 X136.454 Y154.443 E.0099
M204 S10000
; WIPE_START
G1 F24000
G1 X136.421 Y154.836 E-.14986
G1 X136.411 Y154.917 E-.03096
G1 X136.262 Y155.309 E-.15946
G1 X136.024 Y155.655 E-.15946
G1 X135.71 Y155.933 E-.15946
G1 X135.475 Y156.056 E-.10081
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I1.13 J-.452 P1  F30000
G1 X134.146 Y152.732 Z1.4
G1 Z1
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X134.149 Y152.739 E.00021
G3 X135.249 Y152.722 I.578 J1.763 E.03057
G1 X135.295 Y152.732 E.00129
G3 X135.651 Y156.111 I-.592 J1.77 E.11675
G3 X133.795 Y152.897 I-.924 J-1.609 E.15916
G1 X134.092 Y152.757 E.00896
M204 S10000
; WIPE_START
G1 F24000
G1 X134.149 Y152.739 E-.02275
G1 X134.526 Y152.651 E-.14744
G1 X134.915 Y152.651 E-.14774
G1 X135.249 Y152.722 E-.1298
G1 X135.295 Y152.732 E-.01793
G1 X135.651 Y152.89 E-.14774
G1 X135.963 Y153.116 E-.14659
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I1.216 J.037 P1  F30000
G1 X136.589 Y132.313 Z1.4
G1 Z1
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X136.549 Y132.647 E.00918
G1 X136.539 Y132.728 E.00223
G1 X136.39 Y133.12 E.01148
G1 X136.152 Y133.465 E.01148
G1 X135.838 Y133.744 E.01148
G1 X135.466 Y133.939 E.01148
G1 X135.059 Y134.039 E.01148
G1 X134.639 Y134.039 E.01148
G1 X134.231 Y133.939 E.01148
G1 X133.86 Y133.744 E.01148
G1 X133.546 Y133.465 E.01148
G1 X133.307 Y133.12 E.01148
G1 X133.159 Y132.728 E.01148
G1 X133.108 Y132.311 E.01148
G1 X133.149 Y131.975 E.00925
G1 X133.159 Y131.894 E.00223
G1 X133.307 Y131.502 E.01148
G1 X133.546 Y131.157 E.01148
G1 X133.86 Y130.878 E.01148
G1 X134.231 Y130.683 E.01148
G1 X134.639 Y130.583 E.01148
G1 X135.059 Y130.583 E.01148
G1 X135.466 Y130.683 E.01148
G1 X135.838 Y130.878 E.01148
G1 X136.152 Y131.157 E.01148
G1 X136.39 Y131.502 E.01148
G1 X136.539 Y131.894 E.01148
G1 X136.582 Y132.254 E.0099
M204 S10000
; WIPE_START
G1 F24000
G1 X136.549 Y132.647 E-.14986
G1 X136.539 Y132.728 E-.03096
G1 X136.39 Y133.12 E-.15946
G1 X136.152 Y133.465 E-.15946
G1 X135.838 Y133.744 E-.15946
G1 X135.603 Y133.867 E-.10081
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I1.13 J-.452 P1  F30000
G1 X134.274 Y130.542 Z1.4
G1 Z1
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X134.276 Y130.55 E.00021
G3 X135.377 Y130.533 I.578 J1.763 E.03057
G1 X135.423 Y130.542 E.00129
G3 X135.779 Y133.922 I-.592 J1.77 E.11675
G3 X133.923 Y130.708 I-.924 J-1.609 E.15916
G1 X134.219 Y130.568 E.00896
M204 S10000
; WIPE_START
G1 F24000
G1 X134.276 Y130.55 E-.02275
G1 X134.654 Y130.462 E-.14744
G1 X135.043 Y130.462 E-.14774
G1 X135.377 Y130.533 E-.1298
G1 X135.423 Y130.542 E-.01793
G1 X135.779 Y130.7 E-.14774
G1 X136.091 Y130.927 E-.14659
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I1.216 J.052 P1  F30000
G1 X136.858 Y112.827 Z1.4
G1 Z1
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X136.818 Y113.16 E.00918
G1 X136.808 Y113.241 E.00223
G1 X136.659 Y113.634 E.01148
G1 X136.421 Y113.979 E.01148
G1 X136.107 Y114.257 E.01148
G1 X135.735 Y114.452 E.01148
G1 X135.328 Y114.553 E.01148
G1 X134.908 Y114.553 E.01148
G1 X134.501 Y114.452 E.01148
G1 X134.129 Y114.257 E.01148
G1 X133.815 Y113.979 E.01148
G1 X133.577 Y113.634 E.01148
G1 X133.428 Y113.241 E.01148
G1 X133.377 Y112.825 E.01148
G1 X133.418 Y112.489 E.00925
G1 X133.428 Y112.408 E.00223
G1 X133.577 Y112.016 E.01148
G1 X133.815 Y111.67 E.01148
G1 X134.129 Y111.392 E.01148
M73 P59 R4
G1 X134.501 Y111.197 E.01148
G1 X134.908 Y111.097 E.01148
G1 X135.328 Y111.097 E.01148
G1 X135.735 Y111.197 E.01148
G1 X136.107 Y111.392 E.01148
G1 X136.421 Y111.67 E.01148
G1 X136.659 Y112.016 E.01148
G1 X136.808 Y112.408 E.01148
G1 X136.852 Y112.767 E.0099
M204 S10000
; WIPE_START
G1 F24000
G1 X136.818 Y113.16 E-.14986
G1 X136.808 Y113.241 E-.03096
G1 X136.659 Y113.634 E-.15946
G1 X136.421 Y113.979 E-.15946
G1 X136.107 Y114.257 E-.15946
G1 X135.872 Y114.381 E-.10081
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I1.13 J-.452 P1  F30000
G1 X134.543 Y111.056 Z1.4
G1 Z1
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X134.546 Y111.063 E.00021
G3 X135.647 Y111.046 I.578 J1.763 E.03057
G1 X135.693 Y111.056 E.00129
G3 X136.048 Y114.435 I-.592 J1.77 E.11675
G3 X134.193 Y111.222 I-.924 J-1.609 E.15916
G1 X134.489 Y111.082 E.00896
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 1.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X134.546 Y111.063 E-.02275
G1 X134.924 Y110.975 E-.14744
G1 X135.312 Y110.975 E-.14774
G1 X135.647 Y111.046 E-.1298
G1 X135.693 Y111.056 E-.01793
G1 X136.048 Y111.214 E-.14774
G1 X136.36 Y111.441 E-.14659
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
G3 Z1.4 I.63 J-1.041 P1  F30000
G1 X107.317 Y93.857 Z1.4
G1 Z1.2
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X107.362 Y94.227 E.01017
G1 X107.311 Y94.643 E.01148
G1 X107.162 Y95.036 E.01148
G1 X106.924 Y95.381 E.01148
G1 X106.61 Y95.659 E.01148
G1 X106.238 Y95.854 E.01148
G1 X105.831 Y95.955 E.01148
G1 X105.411 Y95.955 E.01148
G1 X105.004 Y95.854 E.01148
G1 X104.632 Y95.659 E.01148
G1 X104.318 Y95.381 E.01148
G1 X104.08 Y95.036 E.01148
G1 X103.931 Y94.643 E.01148
G1 X103.88 Y94.227 E.01148
G1 X103.931 Y93.81 E.01148
G1 X104.049 Y93.498 E.00912
G1 X104.08 Y93.418 E.00236
G1 X104.318 Y93.072 E.01148
G1 X104.632 Y92.794 E.01148
G1 X105.004 Y92.599 E.01148
G1 X105.411 Y92.499 E.01148
G1 X105.831 Y92.499 E.01148
G1 X106.238 Y92.599 E.01148
G1 X106.61 Y92.794 E.01148
G1 X106.924 Y93.072 E.01148
G1 X107.162 Y93.418 E.01148
G1 X107.307 Y93.798 E.01114
M204 S10000
; WIPE_START
G1 F24000
G1 X107.362 Y94.227 E-.16403
G1 X107.311 Y94.643 E-.15946
G1 X107.162 Y95.036 E-.15946
G1 X106.924 Y95.381 E-.15946
G1 X106.692 Y95.586 E-.1176
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I1.057 J-.603 P1  F30000
G1 X104.932 Y92.499 Z1.6
G1 Z1.2
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X104.933 Y92.501 E.00004
G3 X105.775 Y92.379 I.679 J1.719 E.02348
G1 X105.775 Y92.379 E0
G3 X104.028 Y93.268 I-.16 J1.849 E.26232
G3 X104.578 Y92.688 I1.585 J.952 E.02204
G1 X104.879 Y92.527 E.00934
M204 S10000
; WIPE_START
G1 F24000
G1 X104.933 Y92.501 E-.0229
G1 X105.32 Y92.392 E-.15275
G1 X105.775 Y92.379 E-.17306
G1 X105.775 Y92.379 E0
G1 X106.118 Y92.435 E-.13212
G1 X106.492 Y92.584 E-.1528
G1 X106.767 Y92.77 E-.12636
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I-1.19 J.254 P1  F30000
G1 X111.826 Y116.433 Z1.6
G1 Z1.2
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X111.871 Y116.803 E.01017
G1 X111.82 Y117.219 E.01148
G1 X111.671 Y117.611 E.01148
G1 X111.433 Y117.957 E.01148
G1 X111.119 Y118.235 E.01148
G1 X110.747 Y118.43 E.01148
G1 X110.34 Y118.53 E.01148
G1 X109.92 Y118.53 E.01148
G1 X109.513 Y118.43 E.01148
G1 X109.141 Y118.235 E.01148
G1 X108.827 Y117.957 E.01148
G1 X108.589 Y117.611 E.01148
G1 X108.44 Y117.219 E.01148
G1 X108.389 Y116.803 E.01148
G1 X108.44 Y116.386 E.01148
G1 X108.558 Y116.074 E.00912
G1 X108.589 Y115.994 E.00236
G1 X108.827 Y115.648 E.01148
G1 X109.141 Y115.37 E.01148
G1 X109.513 Y115.175 E.01148
G1 X109.92 Y115.075 E.01148
G1 X110.34 Y115.075 E.01148
G1 X110.747 Y115.175 E.01148
G1 X111.119 Y115.37 E.01148
G1 X111.433 Y115.648 E.01148
G1 X111.671 Y115.994 E.01148
G1 X111.816 Y116.374 E.01114
M204 S10000
; WIPE_START
G1 F24000
G1 X111.871 Y116.803 E-.16403
G1 X111.82 Y117.219 E-.15946
G1 X111.671 Y117.611 E-.15946
G1 X111.433 Y117.957 E-.15946
G1 X111.201 Y118.162 E-.1176
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I1.057 J-.603 P1  F30000
G1 X109.441 Y115.075 Z1.6
G1 Z1.2
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X109.442 Y115.076 E.00004
G3 X110.284 Y114.954 I.679 J1.719 E.02348
G1 X110.284 Y114.954 E0
G3 X108.536 Y115.844 I-.16 J1.849 E.26232
G3 X109.087 Y115.264 I1.585 J.952 E.02204
G1 X109.388 Y115.103 E.00934
M204 S10000
; WIPE_START
G1 F24000
G1 X109.442 Y115.076 E-.0229
G1 X109.829 Y114.967 E-.15275
G1 X110.284 Y114.954 E-.17306
G1 X110.284 Y114.954 E0
G1 X110.627 Y115.011 E-.13212
G1 X111.001 Y115.16 E-.1528
G1 X111.276 Y115.346 E-.12636
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I-1.217 J-.007 P1  F30000
G1 X111.133 Y140.088 Z1.6
G1 Z1.2
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X111.178 Y140.457 E.01017
G1 X111.127 Y140.873 E.01148
G1 X110.978 Y141.266 E.01148
G1 X110.74 Y141.611 E.01148
G1 X110.426 Y141.889 E.01148
G1 X110.054 Y142.084 E.01148
G1 X109.647 Y142.185 E.01148
G1 X109.227 Y142.185 E.01148
G1 X108.82 Y142.084 E.01148
G1 X108.448 Y141.889 E.01148
G1 X108.134 Y141.611 E.01148
G1 X107.896 Y141.266 E.01148
G1 X107.747 Y140.873 E.01148
G1 X107.696 Y140.457 E.01148
G1 X107.747 Y140.04 E.01148
G1 X107.865 Y139.729 E.00912
G1 X107.896 Y139.648 E.00236
G1 X108.134 Y139.303 E.01148
G1 X108.448 Y139.024 E.01148
G1 X108.82 Y138.829 E.01148
G1 X109.227 Y138.729 E.01148
G1 X109.647 Y138.729 E.01148
G1 X110.054 Y138.829 E.01148
G1 X110.426 Y139.024 E.01148
G1 X110.74 Y139.303 E.01148
G1 X110.978 Y139.648 E.01148
G1 X111.123 Y140.029 E.01114
M204 S10000
; WIPE_START
G1 F24000
G1 X111.178 Y140.457 E-.16403
G1 X111.127 Y140.873 E-.15946
G1 X110.978 Y141.266 E-.15946
G1 X110.74 Y141.611 E-.15946
G1 X110.508 Y141.816 E-.1176
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I1.057 J-.603 P1  F30000
G1 X108.748 Y138.73 Z1.6
G1 Z1.2
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X108.749 Y138.731 E.00004
G3 X109.591 Y138.609 I.679 J1.719 E.02348
G1 X109.591 Y138.609 E0
G3 X107.843 Y139.498 I-.16 J1.849 E.26232
G3 X108.394 Y138.918 I1.585 J.952 E.02204
G1 X108.695 Y138.758 E.00934
M204 S10000
; WIPE_START
G1 F24000
G1 X108.749 Y138.731 E-.0229
G1 X109.136 Y138.622 E-.15275
G1 X109.591 Y138.609 E-.17306
G1 X109.591 Y138.609 E0
G1 X109.934 Y138.665 E-.13212
G1 X110.308 Y138.814 E-.1528
G1 X110.583 Y139 E-.12636
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I-1.217 J.017 P1  F30000
G1 X110.967 Y165.735 Z1.6
G1 Z1.2
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X111.012 Y166.104 E.01017
G1 X110.961 Y166.521 E.01148
G1 X110.812 Y166.913 E.01148
G1 X110.574 Y167.258 E.01148
G1 X110.26 Y167.537 E.01148
G1 X109.888 Y167.732 E.01148
G1 X109.481 Y167.832 E.01148
G1 X109.061 Y167.832 E.01148
G1 X108.654 Y167.732 E.01148
G1 X108.282 Y167.537 E.01148
G1 X107.968 Y167.258 E.01148
G1 X107.73 Y166.913 E.01148
G1 X107.581 Y166.521 E.01148
G1 X107.53 Y166.104 E.01148
G1 X107.581 Y165.688 E.01148
G1 X107.699 Y165.376 E.00912
G1 X107.73 Y165.295 E.00236
G1 X107.968 Y164.95 E.01148
G1 X108.282 Y164.672 E.01148
G1 X108.654 Y164.477 E.01148
G1 X109.061 Y164.376 E.01148
G1 X109.481 Y164.376 E.01148
G1 X109.888 Y164.477 E.01148
G1 X110.26 Y164.672 E.01148
G1 X110.574 Y164.95 E.01148
G1 X110.812 Y165.295 E.01148
G1 X110.957 Y165.676 E.01114
M204 S10000
; WIPE_START
G1 F24000
G1 X111.012 Y166.104 E-.16403
G1 X110.961 Y166.521 E-.15946
G1 X110.812 Y166.913 E-.15946
G1 X110.574 Y167.258 E-.15946
G1 X110.342 Y167.464 E-.1176
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I1.057 J-.603 P1  F30000
G1 X108.582 Y164.377 Z1.6
G1 Z1.2
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X108.583 Y164.378 E.00004
G3 X109.425 Y164.256 I.679 J1.719 E.02348
G1 X109.425 Y164.256 E0
G3 X107.678 Y165.145 I-.16 J1.849 E.26232
G3 X108.228 Y164.565 I1.585 J.952 E.02204
G1 X108.529 Y164.405 E.00934
M204 S10000
; WIPE_START
G1 F24000
G1 X108.583 Y164.378 E-.0229
G1 X108.97 Y164.269 E-.15275
G1 X109.425 Y164.256 E-.17306
G1 X109.425 Y164.256 E0
G1 X109.769 Y164.312 E-.13212
G1 X110.142 Y164.461 E-.1528
G1 X110.417 Y164.648 E-.12636
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I.442 J1.134 P1  F30000
G1 X136.461 Y154.503 Z1.6
G1 Z1.2
G1 E.8 F1800
M204 S5000
G1 F1460
M73 P60 R4
G1 X136.411 Y154.917 E.0114
G1 X136.262 Y155.309 E.01148
G1 X136.024 Y155.655 E.01148
G1 X135.71 Y155.933 E.01148
G1 X135.338 Y156.128 E.01148
G1 X134.931 Y156.228 E.01148
G1 X134.511 Y156.228 E.01148
G1 X134.103 Y156.128 E.01148
G1 X133.732 Y155.933 E.01148
G1 X133.418 Y155.655 E.01148
G1 X133.179 Y155.309 E.01148
G1 X133.031 Y154.917 E.01148
G1 X132.98 Y154.5 E.01148
G1 X133.031 Y154.084 E.01148
G1 X133.179 Y153.691 E.01148
G1 X133.418 Y153.346 E.01148
G1 X133.732 Y153.068 E.01148
G1 X134.103 Y152.873 E.01148
G1 X134.511 Y152.772 E.01148
G1 X134.931 Y152.772 E.01148
G1 X135.338 Y152.873 E.01148
G1 X135.71 Y153.068 E.01148
G1 X136.024 Y153.346 E.01148
G1 X136.262 Y153.691 E.01148
G1 X136.411 Y154.084 E.01148
G1 X136.454 Y154.443 E.00991
M204 S10000
; WIPE_START
G1 F24000
G1 X136.411 Y154.917 E-.18068
G1 X136.262 Y155.309 E-.15946
G1 X136.024 Y155.655 E-.15946
G1 X135.71 Y155.933 E-.15946
G1 X135.474 Y156.056 E-.10095
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I1.13 J-.452 P1  F30000
G1 X134.146 Y152.732 Z1.6
G1 Z1.2
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X134.149 Y152.74 E.00024
G3 X135.235 Y152.719 I.578 J1.763 E.03014
G1 X135.295 Y152.732 E.0017
G3 X135.651 Y156.111 I-.592 J1.77 E.11675
G3 X133.796 Y152.898 I-.924 J-1.608 E.15916
G1 X134.092 Y152.757 E.00896
M204 S10000
; WIPE_START
G1 F24000
G1 X134.149 Y152.74 E-.02274
G1 X134.526 Y152.651 E-.14742
G1 X134.915 Y152.651 E-.14774
G1 X135.235 Y152.719 E-.12414
G1 X135.295 Y152.732 E-.02359
G1 X135.651 Y152.89 E-.14774
G1 X135.963 Y153.117 E-.14662
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I1.216 J.037 P1  F30000
G1 X136.589 Y132.314 Z1.6
G1 Z1.2
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X136.539 Y132.728 E.0114
G1 X136.39 Y133.12 E.01148
G1 X136.152 Y133.465 E.01148
G1 X135.838 Y133.744 E.01148
G1 X135.466 Y133.939 E.01148
G1 X135.059 Y134.039 E.01148
G1 X134.639 Y134.039 E.01148
G1 X134.231 Y133.939 E.01148
G1 X133.86 Y133.744 E.01148
G1 X133.546 Y133.465 E.01148
G1 X133.307 Y133.12 E.01148
G1 X133.159 Y132.728 E.01148
G1 X133.108 Y132.311 E.01148
G1 X133.159 Y131.894 E.01148
G1 X133.307 Y131.502 E.01148
G1 X133.546 Y131.157 E.01148
G1 X133.86 Y130.878 E.01148
G1 X134.231 Y130.683 E.01148
G1 X134.639 Y130.583 E.01148
G1 X135.059 Y130.583 E.01148
G1 X135.466 Y130.683 E.01148
G1 X135.838 Y130.878 E.01148
G1 X136.152 Y131.157 E.01148
G1 X136.39 Y131.502 E.01148
G1 X136.539 Y131.894 E.01148
G1 X136.582 Y132.254 E.00991
M204 S10000
; WIPE_START
G1 F24000
G1 X136.539 Y132.728 E-.18068
G1 X136.39 Y133.12 E-.15946
G1 X136.152 Y133.465 E-.15946
G1 X135.838 Y133.744 E-.15946
G1 X135.602 Y133.867 E-.10095
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I1.13 J-.452 P1  F30000
G1 X134.274 Y130.542 Z1.6
G1 Z1.2
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X134.277 Y130.551 E.00024
G3 X135.363 Y130.529 I.578 J1.763 E.03014
G1 X135.423 Y130.542 E.0017
G3 X135.779 Y133.922 I-.592 J1.77 E.11675
G3 X133.924 Y130.709 I-.924 J-1.608 E.15916
G1 X134.22 Y130.568 E.00896
M204 S10000
; WIPE_START
G1 F24000
G1 X134.277 Y130.551 E-.02274
G1 X134.654 Y130.462 E-.14742
G1 X135.043 Y130.462 E-.14774
G1 X135.363 Y130.529 E-.12414
G1 X135.423 Y130.542 E-.02359
G1 X135.779 Y130.7 E-.14774
G1 X136.091 Y130.927 E-.14662
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I1.216 J.052 P1  F30000
G1 X136.858 Y112.827 Z1.6
G1 Z1.2
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X136.808 Y113.241 E.0114
G1 X136.659 Y113.634 E.01148
G1 X136.421 Y113.979 E.01148
G1 X136.107 Y114.257 E.01148
G1 X135.735 Y114.452 E.01148
G1 X135.328 Y114.553 E.01148
G1 X134.908 Y114.553 E.01148
G1 X134.501 Y114.452 E.01148
G1 X134.129 Y114.257 E.01148
G1 X133.815 Y113.979 E.01148
G1 X133.577 Y113.634 E.01148
G1 X133.428 Y113.241 E.01148
G1 X133.377 Y112.825 E.01148
G1 X133.428 Y112.408 E.01148
G1 X133.577 Y112.016 E.01148
G1 X133.815 Y111.67 E.01148
G1 X134.129 Y111.392 E.01148
G1 X134.501 Y111.197 E.01148
G1 X134.908 Y111.097 E.01148
G1 X135.328 Y111.097 E.01148
G1 X135.735 Y111.197 E.01148
G1 X136.107 Y111.392 E.01148
G1 X136.421 Y111.67 E.01148
G1 X136.659 Y112.016 E.01148
G1 X136.808 Y112.408 E.01148
G1 X136.852 Y112.768 E.00991
M204 S10000
; WIPE_START
G1 F24000
G1 X136.808 Y113.241 E-.18068
G1 X136.659 Y113.634 E-.15946
G1 X136.421 Y113.979 E-.15946
G1 X136.107 Y114.257 E-.15946
G1 X135.872 Y114.381 E-.10095
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I1.13 J-.452 P1  F30000
G1 X134.543 Y111.056 Z1.6
G1 Z1.2
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X134.546 Y111.064 E.00024
G3 X135.632 Y111.043 I.578 J1.763 E.03014
G1 X135.693 Y111.056 E.0017
G3 X136.048 Y114.435 I-.592 J1.77 E.11675
G3 X134.193 Y111.222 I-.924 J-1.608 E.15916
G1 X134.489 Y111.082 E.00896
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 1.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X134.546 Y111.064 E-.02274
G1 X134.924 Y110.975 E-.14742
G1 X135.312 Y110.975 E-.14774
G1 X135.632 Y111.043 E-.12414
G1 X135.693 Y111.056 E-.02359
G1 X136.048 Y111.214 E-.14774
G1 X136.36 Y111.441 E-.14663
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
G3 Z1.6 I.63 J-1.041 P1  F30000
G1 X107.317 Y93.855 Z1.6
G1 Z1.4
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X107.362 Y94.227 E.01023
G1 X107.311 Y94.643 E.01148
G1 X107.162 Y95.036 E.01148
G1 X106.924 Y95.381 E.01148
G1 X106.61 Y95.659 E.01148
G1 X106.238 Y95.854 E.01148
G1 X105.831 Y95.955 E.01148
G1 X105.411 Y95.955 E.01148
G1 X105.004 Y95.854 E.01148
G1 X104.632 Y95.659 E.01148
G1 X104.318 Y95.381 E.01148
G1 X104.08 Y95.036 E.01148
G1 X103.931 Y94.643 E.01148
G1 X103.892 Y94.324 E.0088
G1 X103.88 Y94.227 E.00267
G1 X103.931 Y93.81 E.01148
G1 X104.08 Y93.418 E.01148
G1 X104.318 Y93.072 E.01148
G1 X104.632 Y92.794 E.01148
G1 X105.004 Y92.599 E.01148
G1 X105.411 Y92.499 E.01148
G1 X105.831 Y92.499 E.01148
G1 X106.238 Y92.599 E.01148
G1 X106.61 Y92.794 E.01148
G1 X106.924 Y93.072 E.01148
G1 X107.162 Y93.418 E.01148
G1 X107.306 Y93.797 E.01108
M204 S10000
; WIPE_START
G1 F24000
G1 X107.362 Y94.227 E-.16476
G1 X107.311 Y94.643 E-.15946
G1 X107.162 Y95.036 E-.15946
G1 X106.924 Y95.381 E-.15946
G1 X106.694 Y95.585 E-.11687
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I1.057 J-.603 P1  F30000
G1 X104.933 Y92.499 Z1.8
G1 Z1.4
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X105.321 Y92.395 E.01098
G3 X105.789 Y92.381 I.29 J1.824 E.01284
G3 X104.028 Y93.268 I-.174 J1.846 E.26172
G3 X104.88 Y92.523 I1.583 J.951 E.03146
M204 S10000
; WIPE_START
G1 F24000
G1 X105.321 Y92.395 E-.17448
G1 X105.722 Y92.37 E-.15267
G1 X105.789 Y92.381 E-.02587
G1 X106.118 Y92.435 E-.12694
G1 X106.492 Y92.584 E-.1528
G1 X106.769 Y92.772 E-.12723
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-1.19 J.254 P1  F30000
G1 X111.825 Y116.431 Z1.8
G1 Z1.4
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X111.871 Y116.803 E.01023
G1 X111.82 Y117.219 E.01148
G1 X111.671 Y117.611 E.01148
G1 X111.433 Y117.957 E.01148
G1 X111.119 Y118.235 E.01148
G1 X110.747 Y118.43 E.01148
G1 X110.34 Y118.53 E.01148
G1 X109.92 Y118.53 E.01148
G1 X109.513 Y118.43 E.01148
G1 X109.141 Y118.235 E.01148
G1 X108.827 Y117.957 E.01148
G1 X108.589 Y117.611 E.01148
G1 X108.44 Y117.219 E.01148
G1 X108.401 Y116.9 E.0088
G1 X108.389 Y116.803 E.00267
G1 X108.44 Y116.386 E.01148
G1 X108.589 Y115.994 E.01148
G1 X108.827 Y115.648 E.01148
G1 X109.141 Y115.37 E.01148
G1 X109.513 Y115.175 E.01148
G1 X109.92 Y115.075 E.01148
G1 X110.34 Y115.075 E.01148
G1 X110.747 Y115.175 E.01148
G1 X111.119 Y115.37 E.01148
G1 X111.433 Y115.648 E.01148
G1 X111.671 Y115.994 E.01148
G1 X111.815 Y116.373 E.01108
M204 S10000
; WIPE_START
G1 F24000
G1 X111.871 Y116.803 E-.16476
G1 X111.82 Y117.219 E-.15946
G1 X111.671 Y117.611 E-.15946
G1 X111.433 Y117.957 E-.15946
G1 X111.203 Y118.161 E-.11687
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I1.057 J-.603 P1  F30000
G1 X109.442 Y115.075 Z1.8
G1 Z1.4
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X109.83 Y114.971 E.01098
G3 X110.298 Y114.957 I.29 J1.824 E.01284
G3 X108.536 Y115.844 I-.174 J1.846 E.26172
G3 X109.389 Y115.099 I1.583 J.951 E.03146
M204 S10000
; WIPE_START
G1 F24000
G1 X109.83 Y114.971 E-.17448
G1 X110.231 Y114.946 E-.15267
G1 X110.298 Y114.957 E-.02587
G1 X110.627 Y115.011 E-.12694
M73 P61 R4
G1 X111.001 Y115.16 E-.1528
G1 X111.278 Y115.347 E-.12723
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-1.217 J-.007 P1  F30000
G1 X111.132 Y140.086 Z1.8
G1 Z1.4
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X111.178 Y140.457 E.01023
G1 X111.127 Y140.873 E.01148
G1 X110.978 Y141.266 E.01148
G1 X110.74 Y141.611 E.01148
G1 X110.426 Y141.889 E.01148
G1 X110.054 Y142.084 E.01148
G1 X109.647 Y142.185 E.01148
G1 X109.227 Y142.185 E.01148
G1 X108.82 Y142.084 E.01148
G1 X108.448 Y141.889 E.01148
G1 X108.134 Y141.611 E.01148
G1 X107.896 Y141.266 E.01148
G1 X107.747 Y140.873 E.01148
G1 X107.708 Y140.554 E.0088
G1 X107.696 Y140.457 E.00267
G1 X107.747 Y140.04 E.01148
G1 X107.896 Y139.648 E.01148
G1 X108.134 Y139.303 E.01148
G1 X108.448 Y139.024 E.01148
G1 X108.82 Y138.829 E.01148
G1 X109.227 Y138.729 E.01148
G1 X109.647 Y138.729 E.01148
G1 X110.054 Y138.829 E.01148
G1 X110.426 Y139.024 E.01148
G1 X110.74 Y139.303 E.01148
G1 X110.978 Y139.648 E.01148
G1 X111.122 Y140.027 E.01108
M204 S10000
; WIPE_START
G1 F24000
G1 X111.178 Y140.457 E-.16476
G1 X111.127 Y140.873 E-.15946
G1 X110.978 Y141.266 E-.15946
G1 X110.74 Y141.611 E-.15946
G1 X110.51 Y141.815 E-.11687
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I1.057 J-.603 P1  F30000
G1 X108.749 Y138.729 Z1.8
G1 Z1.4
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X109.137 Y138.625 E.01098
G3 X109.605 Y138.611 I.29 J1.824 E.01284
G3 X107.843 Y139.498 I-.174 J1.846 E.26172
G3 X108.696 Y138.753 I1.583 J.951 E.03146
M204 S10000
; WIPE_START
G1 F24000
G1 X109.137 Y138.625 E-.17448
G1 X109.538 Y138.6 E-.15267
G1 X109.605 Y138.611 E-.02587
G1 X109.934 Y138.665 E-.12694
G1 X110.308 Y138.814 E-.1528
G1 X110.585 Y139.002 E-.12723
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-1.217 J.017 P1  F30000
G1 X110.967 Y165.733 Z1.8
G1 Z1.4
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X111.012 Y166.104 E.01023
G1 X110.961 Y166.521 E.01148
G1 X110.812 Y166.913 E.01148
G1 X110.574 Y167.258 E.01148
G1 X110.26 Y167.537 E.01148
G1 X109.888 Y167.732 E.01148
G1 X109.481 Y167.832 E.01148
G1 X109.061 Y167.832 E.01148
G1 X108.654 Y167.732 E.01148
G1 X108.282 Y167.537 E.01148
G1 X107.968 Y167.258 E.01148
G1 X107.73 Y166.913 E.01148
G1 X107.581 Y166.521 E.01148
G1 X107.542 Y166.201 E.0088
G1 X107.53 Y166.104 E.00267
G1 X107.581 Y165.688 E.01148
G1 X107.73 Y165.295 E.01148
G1 X107.968 Y164.95 E.01148
G1 X108.282 Y164.672 E.01148
G1 X108.654 Y164.477 E.01148
G1 X109.061 Y164.376 E.01148
G1 X109.481 Y164.376 E.01148
G1 X109.888 Y164.477 E.01148
G1 X110.26 Y164.672 E.01148
G1 X110.574 Y164.95 E.01148
G1 X110.812 Y165.295 E.01148
G1 X110.956 Y165.674 E.01108
M204 S10000
; WIPE_START
G1 F24000
G1 X111.012 Y166.104 E-.16476
G1 X110.961 Y166.521 E-.15946
G1 X110.812 Y166.913 E-.15946
G1 X110.574 Y167.258 E-.15946
G1 X110.344 Y167.462 E-.11687
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I1.057 J-.603 P1  F30000
G1 X108.583 Y164.376 Z1.8
G1 Z1.4
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X108.971 Y164.272 E.01098
G3 X109.439 Y164.258 I.29 J1.824 E.01284
G3 X107.678 Y165.145 I-.174 J1.846 E.26172
G3 X108.53 Y164.4 I1.583 J.951 E.03146
M204 S10000
; WIPE_START
G1 F24000
G1 X108.971 Y164.272 E-.17448
G1 X109.372 Y164.247 E-.15267
G1 X109.439 Y164.258 E-.02587
G1 X109.769 Y164.312 E-.12694
G1 X110.142 Y164.461 E-.1528
G1 X110.419 Y164.649 E-.12723
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I.442 J1.134 P1  F30000
G1 X136.461 Y154.503 Z1.8
G1 Z1.4
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X136.424 Y154.81 E.00845
G1 X136.411 Y154.917 E.00294
G1 X136.262 Y155.309 E.01148
G1 X136.024 Y155.655 E.01148
G1 X135.71 Y155.933 E.01148
G1 X135.338 Y156.128 E.01148
G1 X134.931 Y156.228 E.01148
G1 X134.511 Y156.228 E.01148
G1 X134.103 Y156.128 E.01148
G1 X133.732 Y155.933 E.01148
G1 X133.418 Y155.655 E.01148
G1 X133.179 Y155.309 E.01148
G1 X133.031 Y154.917 E.01148
G1 X132.98 Y154.5 E.01148
G1 X133.018 Y154.19 E.00854
G1 X133.031 Y154.084 E.00294
G1 X133.179 Y153.691 E.01148
G1 X133.418 Y153.346 E.01148
G1 X133.732 Y153.068 E.01148
G1 X134.103 Y152.873 E.01148
G1 X134.511 Y152.772 E.01148
G1 X134.931 Y152.772 E.01148
G1 X135.338 Y152.873 E.01148
G1 X135.71 Y153.068 E.01148
G1 X136.024 Y153.346 E.01148
G1 X136.262 Y153.691 E.01148
G1 X136.411 Y154.084 E.01148
G1 X136.455 Y154.444 E.00992
M204 S10000
; WIPE_START
G1 F24000
G1 X136.424 Y154.81 E-.13974
G1 X136.411 Y154.917 E-.04083
G1 X136.262 Y155.309 E-.15946
G1 X136.024 Y155.655 E-.15946
G1 X135.71 Y155.933 E-.15946
G1 X135.474 Y156.056 E-.10105
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I1.13 J-.451 P1  F30000
G1 X134.146 Y152.732 Z1.8
G1 Z1.4
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X134.527 Y152.659 E.0106
G3 X135.22 Y152.716 I.199 J1.844 E.01912
G1 X135.295 Y152.732 E.00211
G3 X135.651 Y156.111 I-.592 J1.77 E.11675
G3 X134.101 Y152.757 I-.924 J-1.608 E.16837
M204 S10000
; WIPE_START
G1 F24000
G1 X134.527 Y152.659 E-.16607
G1 X134.915 Y152.651 E-.14742
G1 X135.22 Y152.716 E-.11848
G1 X135.295 Y152.732 E-.02926
G1 X135.651 Y152.89 E-.14774
G1 X135.965 Y153.118 E-.14774
G1 X135.971 Y153.125 E-.0033
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I1.216 J.036 P1  F30000
G1 X136.589 Y132.314 Z1.8
G1 Z1.4
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X136.552 Y132.621 E.00845
G1 X136.539 Y132.728 E.00294
G1 X136.39 Y133.12 E.01148
G1 X136.152 Y133.465 E.01148
G1 X135.838 Y133.744 E.01148
G1 X135.466 Y133.939 E.01148
G1 X135.059 Y134.039 E.01148
G1 X134.639 Y134.039 E.01148
G1 X134.231 Y133.939 E.01148
G1 X133.86 Y133.744 E.01148
G1 X133.546 Y133.465 E.01148
G1 X133.307 Y133.12 E.01148
G1 X133.159 Y132.728 E.01148
G1 X133.108 Y132.311 E.01148
G1 X133.146 Y132.001 E.00854
G1 X133.159 Y131.894 E.00294
G1 X133.307 Y131.502 E.01148
G1 X133.546 Y131.157 E.01148
G1 X133.86 Y130.878 E.01148
G1 X134.231 Y130.683 E.01148
G1 X134.639 Y130.583 E.01148
G1 X135.059 Y130.583 E.01148
G1 X135.466 Y130.683 E.01148
G1 X135.838 Y130.878 E.01148
G1 X136.152 Y131.157 E.01148
G1 X136.39 Y131.502 E.01148
G1 X136.539 Y131.894 E.01148
G1 X136.582 Y132.254 E.00992
M204 S10000
; WIPE_START
G1 F24000
G1 X136.552 Y132.621 E-.13974
G1 X136.539 Y132.728 E-.04083
G1 X136.39 Y133.12 E-.15946
G1 X136.152 Y133.465 E-.15946
G1 X135.838 Y133.744 E-.15946
G1 X135.602 Y133.867 E-.10105
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I1.13 J-.451 P1  F30000
G1 X134.274 Y130.542 Z1.8
G1 Z1.4
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X134.655 Y130.47 E.0106
G3 X135.348 Y130.526 I.199 J1.844 E.01912
G1 X135.423 Y130.542 E.00211
G3 X135.779 Y133.922 I-.592 J1.77 E.11675
G3 X134.229 Y130.568 I-.924 J-1.608 E.16837
M204 S10000
; WIPE_START
G1 F24000
G1 X134.655 Y130.47 E-.16607
G1 X135.043 Y130.462 E-.14742
G1 X135.348 Y130.526 E-.11848
G1 X135.423 Y130.542 E-.02926
G1 X135.779 Y130.7 E-.14774
G1 X136.093 Y130.929 E-.14774
G1 X136.099 Y130.935 E-.0033
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I1.216 J.051 P1  F30000
G1 X136.858 Y112.828 Z1.8
G1 Z1.4
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X136.821 Y113.135 E.00845
G1 X136.808 Y113.241 E.00294
G1 X136.659 Y113.634 E.01148
G1 X136.421 Y113.979 E.01148
G1 X136.107 Y114.257 E.01148
G1 X135.735 Y114.452 E.01148
G1 X135.328 Y114.553 E.01148
G1 X134.908 Y114.553 E.01148
G1 X134.501 Y114.452 E.01148
G1 X134.129 Y114.257 E.01148
G1 X133.815 Y113.979 E.01148
G1 X133.577 Y113.634 E.01148
G1 X133.428 Y113.241 E.01148
G1 X133.377 Y112.825 E.01148
G1 X133.415 Y112.515 E.00854
G1 X133.428 Y112.408 E.00294
G1 X133.577 Y112.016 E.01148
G1 X133.815 Y111.67 E.01148
G1 X134.129 Y111.392 E.01148
G1 X134.501 Y111.197 E.01148
G1 X134.908 Y111.097 E.01148
G1 X135.328 Y111.097 E.01148
G1 X135.735 Y111.197 E.01148
G1 X136.107 Y111.392 E.01148
G1 X136.421 Y111.67 E.01148
G1 X136.659 Y112.016 E.01148
G1 X136.808 Y112.408 E.01148
G1 X136.852 Y112.768 E.00992
M204 S10000
; WIPE_START
G1 F24000
G1 X136.821 Y113.135 E-.13974
G1 X136.808 Y113.241 E-.04083
G1 X136.659 Y113.634 E-.15946
G1 X136.421 Y113.979 E-.15946
G1 X136.107 Y114.257 E-.15946
G1 X135.871 Y114.381 E-.10105
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I1.13 J-.451 P1  F30000
M73 P62 R4
G1 X134.544 Y111.056 Z1.8
G1 Z1.4
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X134.925 Y110.984 E.0106
G3 X135.617 Y111.04 I.199 J1.844 E.01912
G1 X135.693 Y111.056 E.00211
G3 X136.048 Y114.435 I-.592 J1.77 E.11675
G3 X134.499 Y111.081 I-.924 J-1.608 E.16837
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 1.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X134.925 Y110.984 E-.16607
G1 X135.312 Y110.975 E-.14742
G1 X135.617 Y111.04 E-.11848
G1 X135.693 Y111.056 E-.02926
G1 X136.048 Y111.214 E-.14774
G1 X136.362 Y111.443 E-.14774
G1 X136.368 Y111.449 E-.0033
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
G3 Z1.8 I.63 J-1.041 P1  F30000
G1 X107.317 Y93.857 Z1.8
G1 Z1.6
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X107.324 Y93.918 E.0017
G1 X107.362 Y94.227 E.00849
G1 X107.311 Y94.643 E.01148
G1 X107.162 Y95.036 E.01148
G1 X106.924 Y95.381 E.01148
G1 X106.61 Y95.659 E.01148
G1 X106.238 Y95.854 E.01148
G1 X105.831 Y95.955 E.01148
G1 X105.411 Y95.955 E.01148
G1 X105.305 Y95.928 E.00299
G1 X105.004 Y95.854 E.00849
G1 X104.632 Y95.659 E.01148
G1 X104.318 Y95.381 E.01148
G1 X104.08 Y95.036 E.01148
G1 X103.931 Y94.643 E.01148
G1 X103.88 Y94.227 E.01148
G1 X103.931 Y93.81 E.01148
G1 X104.041 Y93.52 E.00849
G1 X104.08 Y93.418 E.00299
G1 X104.318 Y93.072 E.01148
G1 X104.632 Y92.794 E.01148
G1 X105.004 Y92.599 E.01148
G1 X105.411 Y92.499 E.01148
G1 X105.831 Y92.499 E.01148
G1 X105.937 Y92.525 E.00299
G1 X106.238 Y92.599 E.00849
G1 X106.61 Y92.794 E.01148
G1 X106.924 Y93.072 E.01148
G1 X107.162 Y93.418 E.01148
G1 X107.306 Y93.798 E.01112
M204 S10000
; WIPE_START
G1 F24000
G1 X107.324 Y93.918 E-.04632
G1 X107.362 Y94.227 E-.11796
G1 X107.311 Y94.643 E-.15946
G1 X107.162 Y95.036 E-.15946
G1 X106.924 Y95.381 E-.15946
G1 X106.693 Y95.586 E-.11735
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I1.057 J-.603 P1  F30000
G1 X104.932 Y92.499 Z2
G1 Z1.6
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X104.933 Y92.5 E.00002
G3 X105.722 Y92.37 I.689 J1.721 E.02203
G1 X105.802 Y92.383 E.00223
G1 X106.118 Y92.435 E.00876
G3 X104.578 Y92.689 I-.497 J1.786 E.27453
G1 X104.879 Y92.528 E.00934
M204 S10000
; WIPE_START
G1 F24000
G1 X104.933 Y92.5 E-.02291
G1 X105.32 Y92.392 E-.15278
G1 X105.722 Y92.37 E-.1528
G1 X105.802 Y92.383 E-.03105
G1 X106.118 Y92.435 E-.12176
G1 X106.492 Y92.584 E-.1528
G1 X106.766 Y92.77 E-.12589
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-1.19 J.254 P1  F30000
G1 X111.826 Y116.433 Z2
G1 Z1.6
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X111.833 Y116.494 E.0017
G1 X111.871 Y116.803 E.00849
G1 X111.82 Y117.219 E.01148
G1 X111.671 Y117.611 E.01148
G1 X111.433 Y117.957 E.01148
G1 X111.119 Y118.235 E.01148
G1 X110.747 Y118.43 E.01148
G1 X110.34 Y118.53 E.01148
G1 X109.92 Y118.53 E.01148
G1 X109.814 Y118.504 E.00299
G1 X109.513 Y118.43 E.00849
G1 X109.141 Y118.235 E.01148
G1 X108.827 Y117.957 E.01148
G1 X108.589 Y117.611 E.01148
G1 X108.44 Y117.219 E.01148
G1 X108.389 Y116.803 E.01148
G1 X108.44 Y116.386 E.01148
G1 X108.55 Y116.096 E.00849
G1 X108.589 Y115.994 E.00299
G1 X108.827 Y115.648 E.01148
G1 X109.141 Y115.37 E.01148
G1 X109.513 Y115.175 E.01148
G1 X109.92 Y115.075 E.01148
G1 X110.34 Y115.075 E.01148
G1 X110.446 Y115.101 E.00299
G1 X110.747 Y115.175 E.00849
G1 X111.119 Y115.37 E.01148
G1 X111.433 Y115.648 E.01148
G1 X111.671 Y115.994 E.01148
G1 X111.815 Y116.374 E.01112
M204 S10000
; WIPE_START
G1 F24000
G1 X111.833 Y116.494 E-.04632
G1 X111.871 Y116.803 E-.11796
G1 X111.82 Y117.219 E-.15946
G1 X111.671 Y117.611 E-.15946
G1 X111.433 Y117.957 E-.15946
G1 X111.202 Y118.162 E-.11735
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I1.057 J-.603 P1  F30000
G1 X109.441 Y115.075 Z2
G1 Z1.6
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X109.442 Y115.076 E.00002
G3 X110.231 Y114.946 I.689 J1.721 E.02203
G1 X110.311 Y114.959 E.00223
G1 X110.627 Y115.011 E.00876
G3 X109.087 Y115.265 I-.497 J1.786 E.27453
G1 X109.388 Y115.103 E.00934
M204 S10000
; WIPE_START
G1 F24000
G1 X109.442 Y115.076 E-.02291
G1 X109.829 Y114.967 E-.15278
G1 X110.231 Y114.946 E-.1528
G1 X110.311 Y114.959 E-.03105
G1 X110.627 Y115.011 E-.12176
G1 X111.001 Y115.16 E-.1528
G1 X111.275 Y115.345 E-.12589
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-1.217 J-.007 P1  F30000
G1 X111.133 Y140.087 Z2
G1 Z1.6
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X111.14 Y140.149 E.0017
G1 X111.178 Y140.457 E.00849
G1 X111.127 Y140.873 E.01148
G1 X110.978 Y141.266 E.01148
G1 X110.74 Y141.611 E.01148
G1 X110.426 Y141.889 E.01148
G1 X110.054 Y142.084 E.01148
G1 X109.647 Y142.185 E.01148
G1 X109.227 Y142.185 E.01148
G1 X109.121 Y142.159 E.00299
G1 X108.82 Y142.084 E.00849
G1 X108.448 Y141.889 E.01148
G1 X108.134 Y141.611 E.01148
G1 X107.896 Y141.266 E.01148
G1 X107.747 Y140.873 E.01148
G1 X107.696 Y140.457 E.01148
G1 X107.747 Y140.04 E.01148
G1 X107.857 Y139.75 E.00849
G1 X107.896 Y139.648 E.00299
G1 X108.134 Y139.303 E.01148
G1 X108.448 Y139.024 E.01148
G1 X108.82 Y138.829 E.01148
G1 X109.227 Y138.729 E.01148
G1 X109.647 Y138.729 E.01148
G1 X109.753 Y138.755 E.00299
G1 X110.054 Y138.829 E.00849
G1 X110.426 Y139.024 E.01148
G1 X110.74 Y139.303 E.01148
G1 X110.978 Y139.648 E.01148
G1 X111.122 Y140.028 E.01112
M204 S10000
; WIPE_START
G1 F24000
G1 X111.14 Y140.149 E-.04632
G1 X111.178 Y140.457 E-.11796
G1 X111.127 Y140.873 E-.15946
G1 X110.978 Y141.266 E-.15946
G1 X110.74 Y141.611 E-.15946
G1 X110.509 Y141.816 E-.11735
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I1.057 J-.603 P1  F30000
G1 X108.748 Y138.73 Z2
G1 Z1.6
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X108.749 Y138.73 E.00002
G3 X109.538 Y138.6 I.689 J1.721 E.02203
G1 X109.618 Y138.613 E.00223
G1 X109.934 Y138.665 E.00876
G3 X108.394 Y138.919 I-.497 J1.786 E.27453
G1 X108.695 Y138.758 E.00934
M204 S10000
; WIPE_START
G1 F24000
G1 X108.749 Y138.73 E-.02291
G1 X109.136 Y138.622 E-.15278
G1 X109.538 Y138.6 E-.1528
G1 X109.618 Y138.613 E-.03105
G1 X109.934 Y138.665 E-.12176
G1 X110.308 Y138.814 E-.1528
G1 X110.582 Y139 E-.12589
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-1.217 J.018 P1  F30000
G1 X110.967 Y165.734 Z2
G1 Z1.6
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X110.974 Y165.796 E.0017
G1 X111.012 Y166.104 E.00849
G1 X110.961 Y166.521 E.01148
G1 X110.812 Y166.913 E.01148
G1 X110.574 Y167.258 E.01148
G1 X110.26 Y167.537 E.01148
G1 X109.888 Y167.732 E.01148
G1 X109.481 Y167.832 E.01148
G1 X109.061 Y167.832 E.01148
G1 X108.955 Y167.806 E.00299
G1 X108.654 Y167.732 E.00849
G1 X108.282 Y167.537 E.01148
G1 X107.968 Y167.258 E.01148
G1 X107.73 Y166.913 E.01148
G1 X107.581 Y166.521 E.01148
G1 X107.53 Y166.104 E.01148
G1 X107.581 Y165.688 E.01148
G1 X107.691 Y165.397 E.00849
G1 X107.73 Y165.295 E.00299
G1 X107.968 Y164.95 E.01148
G1 X108.282 Y164.672 E.01148
G1 X108.654 Y164.477 E.01148
G1 X109.061 Y164.376 E.01148
G1 X109.481 Y164.376 E.01148
G1 X109.587 Y164.402 E.00299
G1 X109.888 Y164.477 E.00849
G1 X110.26 Y164.672 E.01148
G1 X110.574 Y164.95 E.01148
G1 X110.812 Y165.295 E.01148
G1 X110.957 Y165.675 E.01112
M204 S10000
; WIPE_START
G1 F24000
G1 X110.974 Y165.796 E-.04632
G1 X111.012 Y166.104 E-.11796
G1 X110.961 Y166.521 E-.15946
G1 X110.812 Y166.913 E-.15946
G1 X110.574 Y167.258 E-.15946
G1 X110.343 Y167.463 E-.11735
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I1.057 J-.603 P1  F30000
G1 X108.582 Y164.377 Z2
G1 Z1.6
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X108.583 Y164.377 E.00002
G3 X109.372 Y164.247 I.689 J1.721 E.02203
G1 X109.452 Y164.26 E.00223
G1 X109.769 Y164.312 E.00876
G3 X108.228 Y164.566 I-.497 J1.786 E.27453
G1 X108.53 Y164.405 E.00934
M204 S10000
; WIPE_START
G1 F24000
G1 X108.583 Y164.377 E-.02291
G1 X108.97 Y164.269 E-.15278
G1 X109.372 Y164.247 E-.1528
G1 X109.452 Y164.26 E-.03105
G1 X109.769 Y164.312 E-.12176
G1 X110.142 Y164.461 E-.1528
G1 X110.416 Y164.647 E-.12589
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I.442 J1.134 P1  F30000
G1 X136.461 Y154.504 Z2
G1 Z1.6
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X136.411 Y154.917 E.01138
G1 X136.262 Y155.309 E.01148
G1 X136.024 Y155.655 E.01148
G1 X135.71 Y155.933 E.01148
G1 X135.338 Y156.128 E.01148
G1 X134.931 Y156.228 E.01148
G1 X134.511 Y156.228 E.01148
G1 X134.103 Y156.128 E.01148
G1 X133.732 Y155.933 E.01148
G1 X133.418 Y155.655 E.01148
G1 X133.179 Y155.309 E.01148
G1 X133.031 Y154.917 E.01148
G1 X132.98 Y154.5 E.01148
G1 X133.031 Y154.084 E.01148
G1 X133.179 Y153.691 E.01148
G1 X133.418 Y153.346 E.01148
G1 X133.732 Y153.068 E.01148
G1 X134.103 Y152.873 E.01148
G1 X134.511 Y152.772 E.01148
G1 X134.931 Y152.772 E.01148
G1 X135.338 Y152.873 E.01148
G1 X135.71 Y153.068 E.01148
G1 X136.024 Y153.346 E.01148
G1 X136.262 Y153.691 E.01148
G1 X136.411 Y154.084 E.01148
G1 X136.455 Y154.444 E.00993
M204 S10000
; WIPE_START
G1 F24000
G1 X136.411 Y154.917 E-.18043
M73 P63 R4
G1 X136.262 Y155.309 E-.15946
G1 X136.024 Y155.655 E-.15946
G1 X135.71 Y155.933 E-.15946
G1 X135.474 Y156.057 E-.1012
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I1.13 J-.451 P1  F30000
G1 X134.146 Y152.732 Z2
G1 Z1.6
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X134.149 Y152.741 E.00028
G3 X135.206 Y152.712 I.577 J1.762 E.0293
G1 X135.295 Y152.732 E.00251
G3 X135.651 Y156.111 I-.592 J1.77 E.11675
G3 X133.796 Y152.899 I-.925 J-1.607 E.15915
G1 X134.092 Y152.758 E.00896
M204 S10000
; WIPE_START
G1 F24000
G1 X134.149 Y152.741 E-.02273
G1 X134.526 Y152.651 E-.14737
G1 X134.915 Y152.651 E-.14774
G1 X135.206 Y152.712 E-.11281
G1 X135.295 Y152.732 E-.03492
G1 X135.651 Y152.89 E-.14774
G1 X135.963 Y153.117 E-.14668
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I1.216 J.037 P1  F30000
G1 X136.589 Y132.314 Z2
G1 Z1.6
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X136.539 Y132.728 E.01138
G1 X136.39 Y133.12 E.01148
G1 X136.152 Y133.465 E.01148
G1 X135.838 Y133.744 E.01148
G1 X135.466 Y133.939 E.01148
G1 X135.059 Y134.039 E.01148
G1 X134.639 Y134.039 E.01148
G1 X134.231 Y133.939 E.01148
G1 X133.86 Y133.744 E.01148
G1 X133.546 Y133.465 E.01148
G1 X133.307 Y133.12 E.01148
G1 X133.159 Y132.728 E.01148
G1 X133.108 Y132.311 E.01148
G1 X133.159 Y131.894 E.01148
G1 X133.307 Y131.502 E.01148
G1 X133.546 Y131.157 E.01148
G1 X133.86 Y130.878 E.01148
G1 X134.231 Y130.683 E.01148
G1 X134.639 Y130.583 E.01148
G1 X135.059 Y130.583 E.01148
G1 X135.466 Y130.683 E.01148
G1 X135.838 Y130.878 E.01148
G1 X136.152 Y131.157 E.01148
G1 X136.39 Y131.502 E.01148
G1 X136.539 Y131.894 E.01148
G1 X136.583 Y132.255 E.00993
M204 S10000
; WIPE_START
G1 F24000
G1 X136.539 Y132.728 E-.18043
G1 X136.39 Y133.12 E-.15946
G1 X136.152 Y133.465 E-.15946
G1 X135.838 Y133.744 E-.15946
G1 X135.602 Y133.867 E-.1012
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I1.13 J-.451 P1  F30000
G1 X134.274 Y130.542 Z2
G1 Z1.6
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X134.277 Y130.552 E.00028
G3 X135.333 Y130.523 I.577 J1.762 E.0293
G1 X135.423 Y130.542 E.00251
G3 X135.779 Y133.922 I-.592 J1.77 E.11675
G3 X133.924 Y130.71 I-.925 J-1.607 E.15915
G1 X134.22 Y130.568 E.00896
M204 S10000
; WIPE_START
G1 F24000
G1 X134.277 Y130.552 E-.02273
G1 X134.654 Y130.462 E-.14737
G1 X135.043 Y130.462 E-.14774
G1 X135.333 Y130.523 E-.11281
G1 X135.423 Y130.542 E-.03492
G1 X135.779 Y130.7 E-.14774
G1 X136.091 Y130.927 E-.14668
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I1.216 J.052 P1  F30000
G1 X136.858 Y112.828 Z2
G1 Z1.6
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X136.808 Y113.241 E.01138
G1 X136.659 Y113.634 E.01148
G1 X136.421 Y113.979 E.01148
G1 X136.107 Y114.257 E.01148
G1 X135.735 Y114.452 E.01148
G1 X135.328 Y114.553 E.01148
G1 X134.908 Y114.553 E.01148
G1 X134.501 Y114.452 E.01148
G1 X134.129 Y114.257 E.01148
G1 X133.815 Y113.979 E.01148
G1 X133.577 Y113.634 E.01148
G1 X133.428 Y113.241 E.01148
G1 X133.377 Y112.825 E.01148
G1 X133.428 Y112.408 E.01148
G1 X133.577 Y112.016 E.01148
G1 X133.815 Y111.67 E.01148
G1 X134.129 Y111.392 E.01148
G1 X134.501 Y111.197 E.01148
G1 X134.908 Y111.097 E.01148
G1 X135.328 Y111.097 E.01148
G1 X135.735 Y111.197 E.01148
G1 X136.107 Y111.392 E.01148
G1 X136.421 Y111.67 E.01148
G1 X136.659 Y112.016 E.01148
G1 X136.808 Y112.408 E.01148
G1 X136.852 Y112.768 E.00993
M204 S10000
; WIPE_START
G1 F24000
G1 X136.808 Y113.241 E-.18043
G1 X136.659 Y113.634 E-.15946
G1 X136.421 Y113.979 E-.15946
G1 X136.107 Y114.257 E-.15946
G1 X135.871 Y114.381 E-.1012
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I1.13 J-.451 P1  F30000
G1 X134.543 Y111.056 Z2
G1 Z1.6
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X134.547 Y111.066 E.00028
G3 X135.603 Y111.037 I.577 J1.762 E.0293
G1 X135.693 Y111.056 E.00251
G3 X136.048 Y114.435 I-.592 J1.77 E.11675
G3 X134.194 Y111.224 I-.925 J-1.607 E.15915
G1 X134.489 Y111.082 E.00896
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X134.547 Y111.066 E-.02273
G1 X134.924 Y110.975 E-.14737
G1 X135.312 Y110.975 E-.14774
G1 X135.603 Y111.037 E-.11281
G1 X135.693 Y111.056 E-.03492
G1 X136.048 Y111.214 E-.14774
G1 X136.36 Y111.441 E-.14668
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
G3 Z2 I.63 J-1.041 P1  F30000
G1 X107.316 Y93.855 Z2
G1 Z1.8
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X107.326 Y93.93 E.00206
G1 X107.362 Y94.227 E.00817
G1 X107.311 Y94.643 E.01148
G1 X107.162 Y95.036 E.01148
G1 X106.924 Y95.381 E.01148
G1 X106.61 Y95.659 E.01148
G1 X106.238 Y95.854 E.01148
G1 X105.831 Y95.955 E.01148
G1 X105.411 Y95.955 E.01148
G1 X105.004 Y95.854 E.01148
G1 X104.632 Y95.659 E.01148
G1 X104.318 Y95.381 E.01148
G1 X104.08 Y95.036 E.01148
G1 X103.931 Y94.643 E.01148
G1 X103.88 Y94.227 E.01148
G1 X103.931 Y93.81 E.01148
G1 X104.037 Y93.531 E.00817
G1 X104.08 Y93.418 E.0033
G1 X104.318 Y93.072 E.01148
G1 X104.632 Y92.794 E.01148
G1 X105.004 Y92.599 E.01148
G1 X105.411 Y92.499 E.01148
G1 X105.831 Y92.499 E.01148
G1 X106.238 Y92.599 E.01148
G1 X106.61 Y92.794 E.01148
G1 X106.924 Y93.072 E.01148
G1 X107.162 Y93.418 E.01148
G1 X107.306 Y93.796 E.01108
M204 S10000
; WIPE_START
G1 F24000
G1 X107.326 Y93.93 E-.05129
G1 X107.362 Y94.227 E-.11359
G1 X107.311 Y94.643 E-.15946
G1 X107.162 Y95.036 E-.15946
G1 X106.924 Y95.381 E-.15946
G1 X106.694 Y95.585 E-.11675
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I1.057 J-.603 P1  F30000
G1 X104.933 Y92.499 Z2.2
G1 Z1.8
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X105.321 Y92.4 E.01097
G3 X105.816 Y92.385 I.301 J1.831 E.01356
G1 X106.118 Y92.435 E.00839
G3 X106.746 Y95.697 I-.51 J1.79 E.11229
G1 X106.492 Y95.87 E.00839
G3 X104.888 Y92.527 I-.87 J-1.639 E.16351
M204 S10000
; WIPE_START
G1 F24000
G1 X105.321 Y92.4 E-.1716
G1 X105.722 Y92.37 E-.15249
G1 X105.816 Y92.385 E-.03624
G1 X106.118 Y92.435 E-.11657
G1 X106.492 Y92.584 E-.1528
G1 X106.776 Y92.776 E-.13029
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-1.19 J.254 P1  F30000
G1 X111.825 Y116.431 Z2.2
G1 Z1.8
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X111.835 Y116.506 E.00206
G1 X111.871 Y116.803 E.00817
G1 X111.82 Y117.219 E.01148
G1 X111.671 Y117.611 E.01148
G1 X111.433 Y117.957 E.01148
G1 X111.119 Y118.235 E.01148
G1 X110.747 Y118.43 E.01148
G1 X110.34 Y118.53 E.01148
G1 X109.92 Y118.53 E.01148
G1 X109.513 Y118.43 E.01148
G1 X109.141 Y118.235 E.01148
G1 X108.827 Y117.957 E.01148
G1 X108.589 Y117.611 E.01148
G1 X108.44 Y117.219 E.01148
G1 X108.389 Y116.803 E.01148
G1 X108.44 Y116.386 E.01148
G1 X108.546 Y116.106 E.00817
G1 X108.589 Y115.994 E.0033
G1 X108.827 Y115.648 E.01148
G1 X109.141 Y115.37 E.01148
G1 X109.513 Y115.175 E.01148
G1 X109.92 Y115.075 E.01148
G1 X110.34 Y115.075 E.01148
G1 X110.747 Y115.175 E.01148
G1 X111.119 Y115.37 E.01148
G1 X111.433 Y115.648 E.01148
G1 X111.671 Y115.994 E.01148
G1 X111.815 Y116.372 E.01108
M204 S10000
; WIPE_START
G1 F24000
G1 X111.835 Y116.506 E-.05129
G1 X111.871 Y116.803 E-.11359
G1 X111.82 Y117.219 E-.15946
G1 X111.671 Y117.611 E-.15946
G1 X111.433 Y117.957 E-.15946
G1 X111.203 Y118.161 E-.11675
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I1.057 J-.603 P1  F30000
G1 X109.442 Y115.075 Z2.2
G1 Z1.8
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X109.83 Y114.976 E.01097
G3 X110.325 Y114.961 I.301 J1.831 E.01356
G1 X110.627 Y115.011 E.00839
G3 X111.255 Y118.273 I-.51 J1.79 E.11229
G1 X111.001 Y118.446 E.00839
G3 X109.397 Y115.102 I-.87 J-1.639 E.16351
M204 S10000
; WIPE_START
G1 F24000
G1 X109.83 Y114.976 E-.1716
G1 X110.231 Y114.946 E-.15249
G1 X110.325 Y114.961 E-.03624
G1 X110.627 Y115.011 E-.11657
G1 X111.001 Y115.16 E-.1528
G1 X111.285 Y115.352 E-.13029
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-1.217 J-.007 P1  F30000
G1 X111.132 Y140.085 Z2.2
G1 Z1.8
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X111.142 Y140.16 E.00206
G1 X111.178 Y140.457 E.00817
G1 X111.127 Y140.873 E.01148
G1 X110.978 Y141.266 E.01148
G1 X110.74 Y141.611 E.01148
M73 P64 R4
G1 X110.426 Y141.889 E.01148
G1 X110.054 Y142.084 E.01148
G1 X109.647 Y142.185 E.01148
G1 X109.227 Y142.185 E.01148
G1 X108.82 Y142.084 E.01148
G1 X108.448 Y141.889 E.01148
G1 X108.134 Y141.611 E.01148
G1 X107.896 Y141.266 E.01148
G1 X107.747 Y140.873 E.01148
G1 X107.696 Y140.457 E.01148
G1 X107.747 Y140.04 E.01148
G1 X107.853 Y139.761 E.00817
G1 X107.896 Y139.648 E.0033
G1 X108.134 Y139.303 E.01148
G1 X108.448 Y139.024 E.01148
G1 X108.82 Y138.829 E.01148
G1 X109.227 Y138.729 E.01148
G1 X109.647 Y138.729 E.01148
G1 X110.054 Y138.829 E.01148
G1 X110.426 Y139.024 E.01148
G1 X110.74 Y139.303 E.01148
G1 X110.978 Y139.648 E.01148
G1 X111.122 Y140.027 E.01108
M204 S10000
; WIPE_START
G1 F24000
G1 X111.142 Y140.16 E-.05129
G1 X111.178 Y140.457 E-.11359
G1 X111.127 Y140.873 E-.15946
G1 X110.978 Y141.266 E-.15946
G1 X110.74 Y141.611 E-.15946
G1 X110.51 Y141.815 E-.11675
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I1.057 J-.603 P1  F30000
G1 X108.749 Y138.729 Z2.2
G1 Z1.8
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X109.137 Y138.63 E.01097
G3 X109.632 Y138.615 I.301 J1.831 E.01356
G1 X109.934 Y138.665 E.00839
G3 X110.562 Y141.928 I-.51 J1.79 E.11229
G1 X110.308 Y142.1 E.00839
G3 X108.704 Y138.757 I-.87 J-1.639 E.16351
M204 S10000
; WIPE_START
G1 F24000
G1 X109.137 Y138.63 E-.1716
G1 X109.538 Y138.6 E-.15249
G1 X109.632 Y138.615 E-.03624
G1 X109.934 Y138.665 E-.11657
G1 X110.308 Y138.814 E-.1528
G1 X110.592 Y139.006 E-.13029
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-1.217 J.017 P1  F30000
G1 X110.967 Y165.733 Z2.2
G1 Z1.8
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X110.976 Y165.807 E.00206
G1 X111.012 Y166.104 E.00817
G1 X110.961 Y166.521 E.01148
G1 X110.812 Y166.913 E.01148
G1 X110.574 Y167.258 E.01148
G1 X110.26 Y167.537 E.01148
G1 X109.888 Y167.732 E.01148
G1 X109.481 Y167.832 E.01148
G1 X109.061 Y167.832 E.01148
G1 X108.654 Y167.732 E.01148
G1 X108.282 Y167.537 E.01148
G1 X107.968 Y167.258 E.01148
G1 X107.73 Y166.913 E.01148
G1 X107.581 Y166.521 E.01148
G1 X107.53 Y166.104 E.01148
G1 X107.581 Y165.688 E.01148
G1 X107.687 Y165.408 E.00817
G1 X107.73 Y165.295 E.0033
G1 X107.968 Y164.95 E.01148
G1 X108.282 Y164.672 E.01148
G1 X108.654 Y164.477 E.01148
G1 X109.061 Y164.376 E.01148
G1 X109.481 Y164.376 E.01148
G1 X109.888 Y164.477 E.01148
G1 X110.26 Y164.672 E.01148
G1 X110.574 Y164.95 E.01148
G1 X110.812 Y165.295 E.01148
G1 X110.956 Y165.674 E.01108
M204 S10000
; WIPE_START
G1 F24000
G1 X110.976 Y165.807 E-.05129
G1 X111.012 Y166.104 E-.11359
G1 X110.961 Y166.521 E-.15946
G1 X110.812 Y166.913 E-.15946
G1 X110.574 Y167.258 E-.15946
G1 X110.344 Y167.462 E-.11675
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I1.057 J-.603 P1  F30000
G1 X108.583 Y164.376 Z2.2
G1 Z1.8
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X108.972 Y164.277 E.01097
G3 X109.466 Y164.263 I.301 J1.831 E.01356
G1 X109.769 Y164.312 E.00839
G3 X110.396 Y167.575 I-.51 J1.79 E.11229
G1 X110.142 Y167.747 E.00839
G3 X108.538 Y164.404 I-.87 J-1.639 E.16351
M204 S10000
; WIPE_START
G1 F24000
G1 X108.972 Y164.277 E-.1716
G1 X109.372 Y164.247 E-.15249
G1 X109.466 Y164.263 E-.03624
G1 X109.769 Y164.312 E-.11657
G1 X110.142 Y164.461 E-.1528
G1 X110.426 Y164.654 E-.13029
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I.442 J1.134 P1  F30000
G1 X136.461 Y154.504 Z2.2
G1 Z1.8
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X136.411 Y154.917 E.01137
G1 X136.262 Y155.309 E.01148
G1 X136.024 Y155.655 E.01148
G1 X135.71 Y155.933 E.01148
G1 X135.338 Y156.128 E.01148
G1 X134.931 Y156.228 E.01148
G1 X134.511 Y156.228 E.01148
G1 X134.103 Y156.128 E.01148
G1 X133.732 Y155.933 E.01148
G1 X133.418 Y155.655 E.01148
G1 X133.179 Y155.309 E.01148
G1 X133.031 Y154.917 E.01148
G1 X132.98 Y154.5 E.01148
G1 X133.031 Y154.084 E.01148
G1 X133.179 Y153.691 E.01148
G1 X133.418 Y153.346 E.01148
G1 X133.732 Y153.068 E.01148
G1 X134.103 Y152.873 E.01148
G1 X134.511 Y152.772 E.01148
G1 X134.931 Y152.772 E.01148
G1 X135.338 Y152.873 E.01148
G1 X135.71 Y153.068 E.01148
G1 X136.024 Y153.346 E.01148
G1 X136.262 Y153.691 E.01148
G1 X136.411 Y154.084 E.01148
G1 X136.455 Y154.444 E.00994
M204 S10000
; WIPE_START
G1 F24000
G1 X136.411 Y154.917 E-.18029
G1 X136.262 Y155.309 E-.15946
G1 X136.024 Y155.655 E-.15946
G1 X135.71 Y155.933 E-.15946
G1 X135.473 Y156.057 E-.10133
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I1.13 J-.451 P1  F30000
G1 X134.146 Y152.732 Z2.2
G1 Z1.8
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X134.149 Y152.742 E.00029
G3 X135.191 Y152.709 I.576 J1.762 E.02889
G1 X135.295 Y152.732 E.00292
G3 X135.651 Y156.111 I-.592 J1.77 E.11675
G3 X133.797 Y152.9 I-.925 J-1.607 E.15915
G1 X134.092 Y152.758 E.00896
M204 S10000
; WIPE_START
G1 F24000
G1 X134.149 Y152.742 E-.02273
G1 X134.526 Y152.651 E-.14736
G1 X134.915 Y152.651 E-.14774
G1 X135.191 Y152.709 E-.10715
G1 X135.295 Y152.732 E-.04059
G1 X135.651 Y152.89 E-.14774
G1 X135.963 Y153.117 E-.1467
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I1.216 J.037 P1  F30000
G1 X136.589 Y132.315 Z2.2
G1 Z1.8
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X136.539 Y132.728 E.01137
G1 X136.39 Y133.12 E.01148
G1 X136.152 Y133.465 E.01148
G1 X135.838 Y133.744 E.01148
G1 X135.466 Y133.939 E.01148
G1 X135.059 Y134.039 E.01148
G1 X134.639 Y134.039 E.01148
G1 X134.231 Y133.939 E.01148
G1 X133.86 Y133.744 E.01148
G1 X133.546 Y133.465 E.01148
G1 X133.307 Y133.12 E.01148
G1 X133.159 Y132.728 E.01148
G1 X133.108 Y132.311 E.01148
G1 X133.159 Y131.894 E.01148
G1 X133.307 Y131.502 E.01148
G1 X133.546 Y131.157 E.01148
G1 X133.86 Y130.878 E.01148
G1 X134.231 Y130.683 E.01148
G1 X134.639 Y130.583 E.01148
G1 X135.059 Y130.583 E.01148
G1 X135.466 Y130.683 E.01148
G1 X135.838 Y130.878 E.01148
G1 X136.152 Y131.157 E.01148
G1 X136.39 Y131.502 E.01148
G1 X136.539 Y131.894 E.01148
G1 X136.583 Y132.255 E.00994
M204 S10000
; WIPE_START
G1 F24000
G1 X136.539 Y132.728 E-.18029
G1 X136.39 Y133.12 E-.15946
G1 X136.152 Y133.465 E-.15946
G1 X135.838 Y133.744 E-.15946
G1 X135.601 Y133.867 E-.10133
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I1.13 J-.451 P1  F30000
G1 X134.274 Y130.542 Z2.2
G1 Z1.8
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X134.277 Y130.553 E.00029
G3 X135.319 Y130.52 I.576 J1.762 E.02889
G1 X135.423 Y130.542 E.00292
G3 X135.779 Y133.922 I-.592 J1.77 E.11675
G3 X133.925 Y130.71 I-.925 J-1.607 E.15915
G1 X134.22 Y130.568 E.00896
M204 S10000
; WIPE_START
G1 F24000
G1 X134.277 Y130.553 E-.02273
G1 X134.654 Y130.462 E-.14736
G1 X135.043 Y130.462 E-.14774
G1 X135.319 Y130.52 E-.10715
G1 X135.423 Y130.542 E-.04059
G1 X135.779 Y130.7 E-.14774
G1 X136.091 Y130.927 E-.1467
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I1.216 J.052 P1  F30000
G1 X136.858 Y112.828 Z2.2
G1 Z1.8
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X136.808 Y113.241 E.01137
G1 X136.659 Y113.634 E.01148
G1 X136.421 Y113.979 E.01148
G1 X136.107 Y114.257 E.01148
G1 X135.735 Y114.452 E.01148
G1 X135.328 Y114.553 E.01148
G1 X134.908 Y114.553 E.01148
G1 X134.501 Y114.452 E.01148
G1 X134.129 Y114.257 E.01148
G1 X133.815 Y113.979 E.01148
G1 X133.577 Y113.634 E.01148
G1 X133.428 Y113.241 E.01148
G1 X133.377 Y112.825 E.01148
G1 X133.428 Y112.408 E.01148
G1 X133.577 Y112.016 E.01148
G1 X133.815 Y111.67 E.01148
G1 X134.129 Y111.392 E.01148
G1 X134.501 Y111.197 E.01148
G1 X134.908 Y111.097 E.01148
G1 X135.328 Y111.097 E.01148
G1 X135.735 Y111.197 E.01148
G1 X136.107 Y111.392 E.01148
G1 X136.421 Y111.67 E.01148
G1 X136.659 Y112.016 E.01148
G1 X136.808 Y112.408 E.01148
G1 X136.852 Y112.769 E.00994
M204 S10000
; WIPE_START
G1 F24000
G1 X136.808 Y113.241 E-.18029
G1 X136.659 Y113.634 E-.15946
G1 X136.421 Y113.979 E-.15946
M73 P64 R3
G1 X136.107 Y114.257 E-.15946
G1 X135.871 Y114.381 E-.10133
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I1.13 J-.451 P1  F30000
G1 X134.543 Y111.056 Z2.2
G1 Z1.8
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X134.547 Y111.066 E.00029
G3 X135.588 Y111.034 I.576 J1.762 E.02889
G1 X135.693 Y111.056 E.00292
G3 X136.048 Y114.435 I-.592 J1.77 E.11675
G3 X134.194 Y111.224 I-.925 J-1.607 E.15915
G1 X134.489 Y111.082 E.00896
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X134.547 Y111.066 E-.02273
G1 X134.924 Y110.975 E-.14736
G1 X135.312 Y110.975 E-.14774
M73 P65 R3
G1 X135.588 Y111.034 E-.10715
G1 X135.693 Y111.056 E-.04059
G1 X136.048 Y111.214 E-.14774
G1 X136.36 Y111.441 E-.1467
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
G3 Z2.2 I.63 J-1.041 P1  F30000
G1 X107.316 Y93.853 Z2.2
G1 Z2
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X107.327 Y93.941 E.00242
G1 X107.362 Y94.227 E.00786
G1 X107.311 Y94.643 E.01148
G1 X107.162 Y95.036 E.01148
G1 X106.924 Y95.381 E.01148
G1 X106.61 Y95.659 E.01148
G1 X106.238 Y95.854 E.01148
G1 X105.831 Y95.955 E.01148
G1 X105.411 Y95.955 E.01148
G1 X105.004 Y95.854 E.01148
G1 X104.632 Y95.659 E.01148
G1 X104.318 Y95.381 E.01148
G1 X104.08 Y95.036 E.01148
G1 X103.931 Y94.643 E.01148
G1 X103.88 Y94.227 E.01148
G1 X103.931 Y93.81 E.01148
G1 X104.033 Y93.541 E.00786
G1 X104.08 Y93.418 E.00362
G1 X104.318 Y93.072 E.01148
G1 X104.632 Y92.794 E.01148
G1 X105.004 Y92.599 E.01148
G1 X105.411 Y92.499 E.01148
G1 X105.831 Y92.499 E.01148
G1 X106.238 Y92.599 E.01148
G1 X106.61 Y92.794 E.01148
G1 X106.924 Y93.072 E.01148
G1 X107.162 Y93.418 E.01148
G1 X107.305 Y93.795 E.01103
M204 S10000
; WIPE_START
G1 F24000
G1 X107.327 Y93.941 E-.05628
G1 X107.362 Y94.227 E-.10922
G1 X107.311 Y94.643 E-.15946
G1 X107.162 Y95.036 E-.15946
G1 X106.924 Y95.381 E-.15946
G1 X106.695 Y95.584 E-.11613
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I1.057 J-.604 P1  F30000
G1 X104.933 Y92.499 Z2.4
G1 Z2
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X105.32 Y92.392 E.01099
G3 X105.722 Y92.37 I.302 J1.83 E.01102
G1 X105.829 Y92.387 E.00298
G1 X106.118 Y92.435 E.00802
G3 X104.878 Y92.523 I-.497 J1.787 E.28399
M204 S10000
; WIPE_START
G1 F24000
G1 X105.32 Y92.392 E-.17508
G1 X105.722 Y92.37 E-.15279
G1 X105.829 Y92.387 E-.04142
G1 X106.118 Y92.435 E-.11139
G1 X106.492 Y92.584 E-.1528
G1 X106.768 Y92.77 E-.12652
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-1.19 J.254 P1  F30000
G1 X111.825 Y116.429 Z2.4
G1 Z2
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X111.836 Y116.517 E.00242
G1 X111.871 Y116.803 E.00786
G1 X111.82 Y117.219 E.01148
G1 X111.671 Y117.611 E.01148
G1 X111.433 Y117.957 E.01148
G1 X111.119 Y118.235 E.01148
G1 X110.747 Y118.43 E.01148
G1 X110.34 Y118.53 E.01148
G1 X109.92 Y118.53 E.01148
G1 X109.513 Y118.43 E.01148
G1 X109.141 Y118.235 E.01148
G1 X108.827 Y117.957 E.01148
G1 X108.589 Y117.611 E.01148
G1 X108.44 Y117.219 E.01148
G1 X108.389 Y116.803 E.01148
G1 X108.44 Y116.386 E.01148
G1 X108.542 Y116.117 E.00786
G1 X108.589 Y115.994 E.00362
G1 X108.827 Y115.648 E.01148
G1 X109.141 Y115.37 E.01148
G1 X109.513 Y115.175 E.01148
G1 X109.92 Y115.075 E.01148
G1 X110.34 Y115.075 E.01148
G1 X110.747 Y115.175 E.01148
G1 X111.119 Y115.37 E.01148
G1 X111.433 Y115.648 E.01148
G1 X111.671 Y115.994 E.01148
G1 X111.814 Y116.371 E.01103
M204 S10000
; WIPE_START
G1 F24000
G1 X111.836 Y116.517 E-.05628
G1 X111.871 Y116.803 E-.10922
G1 X111.82 Y117.219 E-.15946
G1 X111.671 Y117.611 E-.15946
G1 X111.433 Y117.957 E-.15946
G1 X111.204 Y118.159 E-.11613
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I1.057 J-.604 P1  F30000
G1 X109.442 Y115.075 Z2.4
G1 Z2
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X109.829 Y114.968 E.01099
G3 X110.231 Y114.946 I.302 J1.83 E.01102
G1 X110.338 Y114.963 E.00298
G1 X110.627 Y115.011 E.00802
G3 X109.387 Y115.098 I-.497 J1.787 E.28399
M204 S10000
; WIPE_START
G1 F24000
G1 X109.829 Y114.968 E-.17508
G1 X110.231 Y114.946 E-.15279
G1 X110.338 Y114.963 E-.04142
G1 X110.627 Y115.011 E-.11139
G1 X111.001 Y115.16 E-.1528
G1 X111.277 Y115.346 E-.12651
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-1.217 J-.007 P1  F30000
G1 X111.132 Y140.084 Z2.4
G1 Z2
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X111.143 Y140.172 E.00242
G1 X111.178 Y140.457 E.00786
G1 X111.127 Y140.873 E.01148
G1 X110.978 Y141.266 E.01148
G1 X110.74 Y141.611 E.01148
G1 X110.426 Y141.889 E.01148
G1 X110.054 Y142.084 E.01148
G1 X109.647 Y142.185 E.01148
G1 X109.227 Y142.185 E.01148
G1 X108.82 Y142.084 E.01148
G1 X108.448 Y141.889 E.01148
G1 X108.134 Y141.611 E.01148
G1 X107.896 Y141.266 E.01148
G1 X107.747 Y140.873 E.01148
G1 X107.696 Y140.457 E.01148
G1 X107.747 Y140.04 E.01148
G1 X107.849 Y139.772 E.00786
G1 X107.896 Y139.648 E.00362
G1 X108.134 Y139.303 E.01148
G1 X108.448 Y139.024 E.01148
G1 X108.82 Y138.829 E.01148
G1 X109.227 Y138.729 E.01148
G1 X109.647 Y138.729 E.01148
G1 X110.054 Y138.829 E.01148
G1 X110.426 Y139.024 E.01148
G1 X110.74 Y139.303 E.01148
G1 X110.978 Y139.648 E.01148
G1 X111.121 Y140.025 E.01103
M204 S10000
; WIPE_START
G1 F24000
G1 X111.143 Y140.172 E-.05628
G1 X111.178 Y140.457 E-.10922
G1 X111.127 Y140.873 E-.15946
G1 X110.978 Y141.266 E-.15946
G1 X110.74 Y141.611 E-.15946
G1 X110.511 Y141.814 E-.11613
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I1.057 J-.604 P1  F30000
G1 X108.749 Y138.729 Z2.4
G1 Z2
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X109.136 Y138.622 E.01099
G3 X109.538 Y138.6 I.302 J1.83 E.01102
G1 X109.645 Y138.618 E.00298
G1 X109.934 Y138.665 E.00802
G3 X108.694 Y138.753 I-.497 J1.787 E.28399
M204 S10000
; WIPE_START
G1 F24000
G1 X109.136 Y138.622 E-.17508
G1 X109.538 Y138.6 E-.15279
G1 X109.645 Y138.618 E-.04142
G1 X109.934 Y138.665 E-.11139
G1 X110.308 Y138.814 E-.1528
G1 X110.584 Y139.001 E-.12651
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-1.217 J.017 P1  F30000
G1 X110.966 Y165.731 Z2.4
G1 Z2
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X110.977 Y165.819 E.00242
G1 X111.012 Y166.104 E.00786
G1 X110.961 Y166.521 E.01148
G1 X110.812 Y166.913 E.01148
G1 X110.574 Y167.258 E.01148
G1 X110.26 Y167.537 E.01148
G1 X109.888 Y167.732 E.01148
G1 X109.481 Y167.832 E.01148
G1 X109.061 Y167.832 E.01148
G1 X108.654 Y167.732 E.01148
G1 X108.282 Y167.537 E.01148
G1 X107.968 Y167.258 E.01148
G1 X107.73 Y166.913 E.01148
G1 X107.581 Y166.521 E.01148
G1 X107.53 Y166.104 E.01148
G1 X107.581 Y165.688 E.01148
G1 X107.683 Y165.419 E.00786
G1 X107.73 Y165.295 E.00362
G1 X107.968 Y164.95 E.01148
G1 X108.282 Y164.672 E.01148
G1 X108.654 Y164.477 E.01148
G1 X109.061 Y164.376 E.01148
G1 X109.481 Y164.376 E.01148
G1 X109.888 Y164.477 E.01148
G1 X110.26 Y164.672 E.01148
G1 X110.574 Y164.95 E.01148
G1 X110.812 Y165.295 E.01148
G1 X110.955 Y165.672 E.01103
M204 S10000
; WIPE_START
G1 F24000
G1 X110.977 Y165.819 E-.05628
G1 X111.012 Y166.104 E-.10922
G1 X110.961 Y166.521 E-.15946
G1 X110.812 Y166.913 E-.15946
G1 X110.574 Y167.258 E-.15946
G1 X110.345 Y167.461 E-.11613
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I1.057 J-.604 P1  F30000
G1 X108.583 Y164.376 Z2.4
G1 Z2
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X108.97 Y164.269 E.01099
G3 X109.372 Y164.247 I.302 J1.83 E.01102
G1 X109.479 Y164.265 E.00298
G1 X109.769 Y164.312 E.00802
G3 X108.529 Y164.4 I-.497 J1.787 E.28399
M204 S10000
; WIPE_START
G1 F24000
G1 X108.97 Y164.269 E-.17508
G1 X109.372 Y164.247 E-.15279
G1 X109.479 Y164.265 E-.04142
G1 X109.769 Y164.312 E-.11139
G1 X110.142 Y164.461 E-.1528
G1 X110.418 Y164.648 E-.12651
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I.442 J1.134 P1  F30000
G1 X136.461 Y154.504 Z2.4
G1 Z2
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X136.428 Y154.771 E.00736
G1 X136.411 Y154.917 E.00401
G1 X136.262 Y155.309 E.01148
G1 X136.024 Y155.655 E.01148
G1 X135.71 Y155.933 E.01148
G1 X135.338 Y156.128 E.01148
G1 X134.931 Y156.228 E.01148
G1 X134.511 Y156.228 E.01148
G1 X134.103 Y156.128 E.01148
G1 X133.732 Y155.933 E.01148
G1 X133.418 Y155.655 E.01148
G1 X133.179 Y155.309 E.01148
G1 X133.031 Y154.917 E.01148
G1 X132.98 Y154.5 E.01148
G1 X133.013 Y154.229 E.00747
G1 X133.031 Y154.084 E.00401
G1 X133.179 Y153.691 E.01148
G1 X133.418 Y153.346 E.01148
G1 X133.732 Y153.068 E.01148
G1 X134.103 Y152.873 E.01148
G1 X134.511 Y152.772 E.01148
G1 X134.931 Y152.772 E.01148
G1 X135.338 Y152.873 E.01148
G1 X135.71 Y153.068 E.01148
G1 X136.024 Y153.346 E.01148
G1 X136.262 Y153.691 E.01148
G1 X136.411 Y154.084 E.01148
G1 X136.455 Y154.445 E.00995
M204 S10000
; WIPE_START
G1 F24000
G1 X136.428 Y154.771 E-.12454
G1 X136.411 Y154.917 E-.05565
G1 X136.262 Y155.309 E-.15946
G1 X136.024 Y155.655 E-.15946
G1 X135.71 Y155.933 E-.15946
G1 X135.473 Y156.057 E-.10144
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I1.13 J-.451 P1  F30000
G1 X134.146 Y152.732 Z2.4
G1 Z2
M73 P66 R3
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X134.149 Y152.741 E.00026
G3 X135.176 Y152.706 I.573 J1.764 E.02848
G1 X135.295 Y152.732 E.00333
G3 X135.651 Y156.111 I-.592 J1.77 E.11675
G3 X133.796 Y152.898 I-.928 J-1.606 E.15942
G1 X134.092 Y152.757 E.00896
M204 S10000
; WIPE_START
G1 F24000
G1 X134.149 Y152.741 E-.02271
G1 X134.526 Y152.651 E-.1474
G1 X134.915 Y152.651 E-.14774
G1 X135.176 Y152.706 E-.10148
G1 X135.295 Y152.732 E-.04625
G1 X135.651 Y152.89 E-.14774
G1 X135.963 Y153.117 E-.14667
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I1.216 J.037 P1  F30000
G1 X136.589 Y132.315 Z2.4
G1 Z2
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X136.556 Y132.582 E.00736
G1 X136.539 Y132.728 E.00401
G1 X136.39 Y133.12 E.01148
G1 X136.152 Y133.465 E.01148
G1 X135.838 Y133.744 E.01148
G1 X135.466 Y133.939 E.01148
G1 X135.059 Y134.039 E.01148
G1 X134.639 Y134.039 E.01148
G1 X134.231 Y133.939 E.01148
G1 X133.86 Y133.744 E.01148
G1 X133.546 Y133.465 E.01148
G1 X133.307 Y133.12 E.01148
G1 X133.159 Y132.728 E.01148
G1 X133.108 Y132.311 E.01148
G1 X133.141 Y132.04 E.00747
G1 X133.159 Y131.894 E.00401
G1 X133.307 Y131.502 E.01148
G1 X133.546 Y131.157 E.01148
G1 X133.86 Y130.878 E.01148
G1 X134.231 Y130.683 E.01148
G1 X134.639 Y130.583 E.01148
G1 X135.059 Y130.583 E.01148
G1 X135.466 Y130.683 E.01148
G1 X135.838 Y130.878 E.01148
G1 X136.152 Y131.157 E.01148
G1 X136.39 Y131.502 E.01148
G1 X136.539 Y131.894 E.01148
G1 X136.583 Y132.256 E.00995
M204 S10000
; WIPE_START
G1 F24000
G1 X136.556 Y132.582 E-.12454
G1 X136.539 Y132.728 E-.05565
G1 X136.39 Y133.12 E-.15946
G1 X136.152 Y133.465 E-.15946
G1 X135.838 Y133.744 E-.15946
G1 X135.601 Y133.868 E-.10144
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I1.13 J-.451 P1  F30000
G1 X134.274 Y130.542 Z2.4
G1 Z2
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X134.277 Y130.551 E.00026
G3 X135.304 Y130.517 I.573 J1.764 E.02848
G1 X135.423 Y130.542 E.00333
G3 X135.779 Y133.922 I-.592 J1.77 E.11675
G3 X133.924 Y130.709 I-.928 J-1.606 E.15942
G1 X134.22 Y130.568 E.00896
M204 S10000
; WIPE_START
G1 F24000
G1 X134.277 Y130.551 E-.02271
G1 X134.654 Y130.462 E-.1474
G1 X135.043 Y130.462 E-.14774
G1 X135.304 Y130.517 E-.10148
G1 X135.423 Y130.542 E-.04625
G1 X135.779 Y130.7 E-.14774
G1 X136.091 Y130.927 E-.14667
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I1.216 J.052 P1  F30000
G1 X136.858 Y112.829 Z2.4
G1 Z2
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X136.826 Y113.096 E.00736
G1 X136.808 Y113.241 E.00401
G1 X136.659 Y113.634 E.01148
G1 X136.421 Y113.979 E.01148
G1 X136.107 Y114.257 E.01148
G1 X135.735 Y114.452 E.01148
G1 X135.328 Y114.553 E.01148
G1 X134.908 Y114.553 E.01148
G1 X134.501 Y114.452 E.01148
G1 X134.129 Y114.257 E.01148
G1 X133.815 Y113.979 E.01148
G1 X133.577 Y113.634 E.01148
G1 X133.428 Y113.241 E.01148
G1 X133.377 Y112.825 E.01148
G1 X133.41 Y112.554 E.00747
G1 X133.428 Y112.408 E.00401
G1 X133.577 Y112.016 E.01148
G1 X133.815 Y111.67 E.01148
G1 X134.129 Y111.392 E.01148
G1 X134.501 Y111.197 E.01148
G1 X134.908 Y111.097 E.01148
G1 X135.328 Y111.097 E.01148
G1 X135.735 Y111.197 E.01148
G1 X136.107 Y111.392 E.01148
G1 X136.421 Y111.67 E.01148
G1 X136.659 Y112.016 E.01148
G1 X136.808 Y112.408 E.01148
G1 X136.852 Y112.769 E.00995
M204 S10000
; WIPE_START
G1 F24000
G1 X136.826 Y113.096 E-.12454
G1 X136.808 Y113.241 E-.05565
G1 X136.659 Y113.634 E-.15946
G1 X136.421 Y113.979 E-.15946
G1 X136.107 Y114.257 E-.15946
G1 X135.87 Y114.381 E-.10144
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I1.13 J-.451 P1  F30000
G1 X134.543 Y111.056 Z2.4
G1 Z2
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X134.546 Y111.065 E.00026
G3 X135.574 Y111.031 I.573 J1.764 E.02848
G1 X135.693 Y111.056 E.00333
G3 X136.048 Y114.435 I-.592 J1.77 E.11675
G3 X134.193 Y111.222 I-.928 J-1.606 E.15942
G1 X134.489 Y111.082 E.00896
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 2.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X134.546 Y111.065 E-.02271
G1 X134.924 Y110.975 E-.1474
G1 X135.312 Y110.975 E-.14774
G1 X135.574 Y111.031 E-.10148
G1 X135.693 Y111.056 E-.04625
G1 X136.048 Y111.214 E-.14774
G1 X136.36 Y111.441 E-.14667
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
G3 Z2.4 I.63 J-1.041 P1  F30000
G1 X107.316 Y93.852 Z2.4
G1 Z2.2
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X107.328 Y93.953 E.00278
G1 X107.362 Y94.227 E.00755
G1 X107.311 Y94.643 E.01148
G1 X107.162 Y95.036 E.01148
G1 X106.924 Y95.381 E.01148
G1 X106.61 Y95.659 E.01148
G1 X106.238 Y95.854 E.01148
G1 X105.831 Y95.955 E.01148
G1 X105.411 Y95.955 E.01148
G1 X105.004 Y95.854 E.01148
G1 X104.632 Y95.659 E.01148
G1 X104.318 Y95.381 E.01148
G1 X104.08 Y95.036 E.01148
G1 X103.931 Y94.643 E.01148
G1 X103.88 Y94.227 E.01148
G1 X103.931 Y93.81 E.01148
G1 X104.029 Y93.552 E.00755
G1 X104.08 Y93.418 E.00393
G1 X104.318 Y93.072 E.01148
G1 X104.632 Y92.794 E.01148
G1 X105.004 Y92.599 E.01148
G1 X105.411 Y92.499 E.01148
G1 X105.831 Y92.499 E.01148
G1 X106.238 Y92.599 E.01148
G1 X106.61 Y92.794 E.01148
G1 X106.924 Y93.072 E.01148
G1 X107.162 Y93.418 E.01148
G1 X107.305 Y93.793 E.01098
M204 S10000
; WIPE_START
G1 F24000
G1 X107.328 Y93.953 E-.06128
G1 X107.362 Y94.227 E-.10485
G1 X107.311 Y94.643 E-.15946
G1 X107.162 Y95.036 E-.15946
G1 X106.924 Y95.381 E-.15946
G1 X106.696 Y95.582 E-.1155
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I1.056 J-.604 P1  F30000
G1 X104.932 Y92.499 Z2.6
G1 Z2.2
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X104.936 Y92.508 E.00027
G3 X105.843 Y92.39 I.686 J1.723 E.02526
G1 X106.118 Y92.435 E.00764
G3 X106.723 Y95.713 I-.509 J1.789 E.11302
G1 X106.492 Y95.87 E.00764
G3 X104.583 Y92.695 I-.869 J-1.638 E.15389
G1 X104.88 Y92.529 E.00932
M204 S10000
; WIPE_START
G1 F24000
G1 X104.936 Y92.508 E-.02272
G1 X105.32 Y92.392 E-.15245
G1 X105.722 Y92.37 E-.1528
G1 X105.843 Y92.39 E-.0466
G1 X106.118 Y92.435 E-.10621
G1 X106.492 Y92.584 E-.1528
G1 X106.767 Y92.77 E-.12641
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I-1.19 J.254 P1  F30000
G1 X111.825 Y116.428 Z2.6
G1 Z2.2
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X111.837 Y116.529 E.00278
G1 X111.871 Y116.803 E.00755
G1 X111.82 Y117.219 E.01148
G1 X111.671 Y117.611 E.01148
G1 X111.433 Y117.957 E.01148
G1 X111.119 Y118.235 E.01148
G1 X110.747 Y118.43 E.01148
G1 X110.34 Y118.53 E.01148
G1 X109.92 Y118.53 E.01148
G1 X109.513 Y118.43 E.01148
G1 X109.141 Y118.235 E.01148
G1 X108.827 Y117.957 E.01148
G1 X108.589 Y117.611 E.01148
G1 X108.44 Y117.219 E.01148
G1 X108.389 Y116.803 E.01148
G1 X108.44 Y116.386 E.01148
G1 X108.538 Y116.128 E.00755
G1 X108.589 Y115.994 E.00393
G1 X108.827 Y115.648 E.01148
G1 X109.141 Y115.37 E.01148
G1 X109.513 Y115.175 E.01148
G1 X109.92 Y115.075 E.01148
G1 X110.34 Y115.075 E.01148
G1 X110.747 Y115.175 E.01148
G1 X111.119 Y115.37 E.01148
G1 X111.433 Y115.648 E.01148
G1 X111.671 Y115.994 E.01148
G1 X111.814 Y116.369 E.01098
M204 S10000
; WIPE_START
G1 F24000
G1 X111.837 Y116.529 E-.06128
G1 X111.871 Y116.803 E-.10485
G1 X111.82 Y117.219 E-.15946
G1 X111.671 Y117.611 E-.15946
G1 X111.433 Y117.957 E-.15946
G1 X111.205 Y118.158 E-.1155
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I1.056 J-.604 P1  F30000
G1 X109.441 Y115.075 Z2.6
G1 Z2.2
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X109.445 Y115.084 E.00027
G3 X110.352 Y114.965 I.686 J1.723 E.02526
G1 X110.627 Y115.011 E.00764
G3 X111.232 Y118.289 I-.509 J1.789 E.11302
G1 X111.001 Y118.446 E.00764
G3 X109.092 Y115.271 I-.869 J-1.638 E.15389
G1 X109.389 Y115.104 E.00932
M204 S10000
; WIPE_START
G1 F24000
G1 X109.445 Y115.084 E-.02272
G1 X109.829 Y114.967 E-.15245
G1 X110.231 Y114.946 E-.1528
G1 X110.352 Y114.965 E-.0466
G1 X110.627 Y115.011 E-.10621
G1 X111.001 Y115.16 E-.1528
G1 X111.276 Y115.346 E-.12641
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I-1.217 J-.007 P1  F30000
G1 X111.132 Y140.082 Z2.6
G1 Z2.2
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X111.144 Y140.183 E.00278
G1 X111.178 Y140.457 E.00755
G1 X111.127 Y140.873 E.01148
G1 X110.978 Y141.266 E.01148
G1 X110.74 Y141.611 E.01148
G1 X110.426 Y141.889 E.01148
G1 X110.054 Y142.084 E.01148
G1 X109.647 Y142.185 E.01148
G1 X109.227 Y142.185 E.01148
G1 X108.82 Y142.084 E.01148
G1 X108.448 Y141.889 E.01148
G1 X108.134 Y141.611 E.01148
G1 X107.896 Y141.266 E.01148
G1 X107.747 Y140.873 E.01148
G1 X107.696 Y140.457 E.01148
G1 X107.747 Y140.04 E.01148
G1 X107.845 Y139.782 E.00755
G1 X107.896 Y139.648 E.00393
G1 X108.134 Y139.303 E.01148
G1 X108.448 Y139.024 E.01148
G1 X108.82 Y138.829 E.01148
G1 X109.227 Y138.729 E.01148
G1 X109.647 Y138.729 E.01148
G1 X110.054 Y138.829 E.01148
G1 X110.426 Y139.024 E.01148
G1 X110.74 Y139.303 E.01148
G1 X110.978 Y139.648 E.01148
M73 P67 R3
G1 X111.121 Y140.023 E.01098
M204 S10000
; WIPE_START
G1 F24000
G1 X111.144 Y140.183 E-.06128
G1 X111.178 Y140.457 E-.10485
G1 X111.127 Y140.873 E-.15946
G1 X110.978 Y141.266 E-.15946
G1 X110.74 Y141.611 E-.15946
G1 X110.512 Y141.813 E-.1155
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I1.056 J-.604 P1  F30000
G1 X108.748 Y138.729 Z2.6
G1 Z2.2
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X108.752 Y138.738 E.00027
G3 X109.659 Y138.62 I.686 J1.723 E.02526
G1 X109.934 Y138.665 E.00764
G3 X110.539 Y141.943 I-.509 J1.789 E.11302
G1 X110.308 Y142.1 E.00764
G3 X108.399 Y138.926 I-.869 J-1.638 E.15389
G1 X108.696 Y138.759 E.00932
M204 S10000
; WIPE_START
G1 F24000
G1 X108.752 Y138.738 E-.02272
G1 X109.136 Y138.622 E-.15245
G1 X109.538 Y138.6 E-.1528
G1 X109.659 Y138.62 E-.0466
G1 X109.934 Y138.665 E-.10621
G1 X110.308 Y138.814 E-.1528
G1 X110.583 Y139.001 E-.12641
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I-1.217 J.017 P1  F30000
G1 X110.966 Y165.729 Z2.6
G1 Z2.2
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X110.978 Y165.83 E.00278
G1 X111.012 Y166.104 E.00755
G1 X110.961 Y166.521 E.01148
G1 X110.812 Y166.913 E.01148
G1 X110.574 Y167.258 E.01148
G1 X110.26 Y167.537 E.01148
G1 X109.888 Y167.732 E.01148
G1 X109.481 Y167.832 E.01148
G1 X109.061 Y167.832 E.01148
G1 X108.654 Y167.732 E.01148
G1 X108.282 Y167.537 E.01148
G1 X107.968 Y167.258 E.01148
G1 X107.73 Y166.913 E.01148
G1 X107.581 Y166.521 E.01148
G1 X107.53 Y166.104 E.01148
G1 X107.581 Y165.688 E.01148
G1 X107.679 Y165.43 E.00755
G1 X107.73 Y165.295 E.00393
G1 X107.968 Y164.95 E.01148
G1 X108.282 Y164.672 E.01148
G1 X108.654 Y164.477 E.01148
G1 X109.061 Y164.376 E.01148
G1 X109.481 Y164.376 E.01148
G1 X109.888 Y164.477 E.01148
G1 X110.26 Y164.672 E.01148
G1 X110.574 Y164.95 E.01148
G1 X110.812 Y165.295 E.01148
G1 X110.955 Y165.671 E.01098
M204 S10000
; WIPE_START
G1 F24000
G1 X110.978 Y165.83 E-.06128
G1 X111.012 Y166.104 E-.10485
G1 X110.961 Y166.521 E-.15946
G1 X110.812 Y166.913 E-.15946
G1 X110.574 Y167.258 E-.15946
G1 X110.346 Y167.46 E-.1155
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I1.056 J-.604 P1  F30000
G1 X108.583 Y164.377 Z2.6
G1 Z2.2
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X108.586 Y164.386 E.00027
G3 X109.493 Y164.267 I.686 J1.723 E.02526
G1 X109.769 Y164.312 E.00764
G3 X110.373 Y167.59 I-.509 J1.789 E.11302
G1 X110.142 Y167.747 E.00764
G3 X108.233 Y164.573 I-.869 J-1.638 E.15389
G1 X108.53 Y164.406 E.00932
M204 S10000
; WIPE_START
G1 F24000
G1 X108.586 Y164.386 E-.02272
G1 X108.97 Y164.269 E-.15245
G1 X109.372 Y164.247 E-.1528
G1 X109.493 Y164.267 E-.0466
G1 X109.769 Y164.312 E-.10621
G1 X110.142 Y164.461 E-.1528
G1 X110.417 Y164.648 E-.12641
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I.442 J1.134 P1  F30000
G1 X136.461 Y154.505 Z2.6
G1 Z2.2
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X136.411 Y154.917 E.01135
G1 X136.262 Y155.309 E.01148
G1 X136.024 Y155.655 E.01148
G1 X135.71 Y155.933 E.01148
G1 X135.338 Y156.128 E.01148
G1 X134.931 Y156.228 E.01148
G1 X134.511 Y156.228 E.01148
G1 X134.103 Y156.128 E.01148
G1 X133.732 Y155.933 E.01148
G1 X133.418 Y155.655 E.01148
G1 X133.179 Y155.309 E.01148
G1 X133.031 Y154.917 E.01148
G1 X132.999 Y154.659 E.00712
G1 X132.98 Y154.5 E.00436
G1 X133.031 Y154.084 E.01148
G1 X133.179 Y153.691 E.01148
G1 X133.418 Y153.346 E.01148
G1 X133.732 Y153.068 E.01148
G1 X134.103 Y152.873 E.01148
G1 X134.511 Y152.772 E.01148
G1 X134.931 Y152.772 E.01148
G1 X135.338 Y152.873 E.01148
G1 X135.71 Y153.068 E.01148
G1 X136.024 Y153.346 E.01148
G1 X136.262 Y153.691 E.01148
G1 X136.411 Y154.084 E.01148
G1 X136.442 Y154.342 E.00712
G1 X136.455 Y154.445 E.00284
M204 S10000
; WIPE_START
G1 F24000
G1 X136.411 Y154.917 E-.18002
G1 X136.262 Y155.309 E-.15946
G1 X136.024 Y155.655 E-.15946
G1 X135.71 Y155.933 E-.15946
G1 X135.473 Y156.057 E-.1016
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I1.13 J-.451 P1  F30000
G1 X134.146 Y152.732 Z2.6
G1 Z2.2
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X134.527 Y152.66 E.0106
G3 X135.162 Y152.703 I.194 J1.845 E.01747
G1 X135.295 Y152.732 E.00374
G3 X135.651 Y156.111 I-.592 J1.77 E.11675
G3 X134.102 Y152.757 I-.929 J-1.606 E.16867
M204 S10000
; WIPE_START
G1 F24000
G1 X134.527 Y152.66 E-.16592
G1 X134.915 Y152.651 E-.1474
G1 X135.162 Y152.703 E-.09582
G1 X135.295 Y152.732 E-.05192
G1 X135.651 Y152.89 E-.14774
G1 X135.965 Y153.118 E-.14774
G1 X135.971 Y153.125 E-.00347
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I1.216 J.036 P1  F30000
G1 X136.589 Y132.315 Z2.6
G1 Z2.2
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X136.539 Y132.728 E.01135
G1 X136.39 Y133.12 E.01148
G1 X136.152 Y133.465 E.01148
G1 X135.838 Y133.744 E.01148
G1 X135.466 Y133.939 E.01148
G1 X135.059 Y134.039 E.01148
G1 X134.639 Y134.039 E.01148
G1 X134.231 Y133.939 E.01148
G1 X133.86 Y133.744 E.01148
G1 X133.546 Y133.465 E.01148
G1 X133.307 Y133.12 E.01148
G1 X133.159 Y132.728 E.01148
G1 X133.127 Y132.469 E.00712
G1 X133.108 Y132.311 E.00436
G1 X133.159 Y131.894 E.01148
G1 X133.307 Y131.502 E.01148
G1 X133.546 Y131.157 E.01148
G1 X133.86 Y130.878 E.01148
G1 X134.231 Y130.683 E.01148
G1 X134.639 Y130.583 E.01148
G1 X135.059 Y130.583 E.01148
G1 X135.466 Y130.683 E.01148
G1 X135.838 Y130.878 E.01148
G1 X136.152 Y131.157 E.01148
G1 X136.39 Y131.502 E.01148
G1 X136.539 Y131.894 E.01148
G1 X136.57 Y132.153 E.00712
G1 X136.583 Y132.256 E.00284
M204 S10000
; WIPE_START
G1 F24000
G1 X136.539 Y132.728 E-.18002
G1 X136.39 Y133.12 E-.15946
G1 X136.152 Y133.465 E-.15946
G1 X135.838 Y133.744 E-.15946
G1 X135.601 Y133.868 E-.1016
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I1.13 J-.451 P1  F30000
G1 X134.274 Y130.542 Z2.6
G1 Z2.2
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X134.655 Y130.471 E.0106
G3 X135.29 Y130.514 I.194 J1.845 E.01747
G1 X135.423 Y130.542 E.00374
G3 X135.779 Y133.922 I-.592 J1.77 E.11675
G3 X134.23 Y130.568 I-.929 J-1.606 E.16867
M204 S10000
; WIPE_START
G1 F24000
G1 X134.655 Y130.471 E-.16592
G1 X135.043 Y130.462 E-.1474
G1 X135.29 Y130.514 E-.09582
G1 X135.423 Y130.542 E-.05192
G1 X135.779 Y130.7 E-.14774
G1 X136.093 Y130.929 E-.14774
G1 X136.099 Y130.936 E-.00347
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I1.216 J.051 P1  F30000
G1 X136.858 Y112.829 Z2.6
G1 Z2.2
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X136.808 Y113.241 E.01135
G1 X136.659 Y113.634 E.01148
G1 X136.421 Y113.979 E.01148
G1 X136.107 Y114.257 E.01148
G1 X135.735 Y114.452 E.01148
G1 X135.328 Y114.553 E.01148
G1 X134.908 Y114.553 E.01148
G1 X134.501 Y114.452 E.01148
G1 X134.129 Y114.257 E.01148
G1 X133.815 Y113.979 E.01148
G1 X133.577 Y113.634 E.01148
G1 X133.428 Y113.241 E.01148
G1 X133.397 Y112.983 E.00712
G1 X133.377 Y112.825 E.00436
G1 X133.428 Y112.408 E.01148
G1 X133.577 Y112.016 E.01148
G1 X133.815 Y111.67 E.01148
G1 X134.129 Y111.392 E.01148
G1 X134.501 Y111.197 E.01148
G1 X134.908 Y111.097 E.01148
G1 X135.328 Y111.097 E.01148
G1 X135.735 Y111.197 E.01148
G1 X136.107 Y111.392 E.01148
G1 X136.421 Y111.67 E.01148
G1 X136.659 Y112.016 E.01148
G1 X136.808 Y112.408 E.01148
G1 X136.839 Y112.666 E.00712
G1 X136.852 Y112.77 E.00284
M204 S10000
; WIPE_START
G1 F24000
G1 X136.808 Y113.241 E-.18002
G1 X136.659 Y113.634 E-.15946
G1 X136.421 Y113.979 E-.15946
G1 X136.107 Y114.257 E-.15946
G1 X135.87 Y114.381 E-.1016
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I1.13 J-.451 P1  F30000
G1 X134.544 Y111.056 Z2.6
G1 Z2.2
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X134.925 Y110.985 E.0106
G3 X135.559 Y111.028 I.194 J1.845 E.01747
G1 X135.693 Y111.056 E.00374
G3 X136.048 Y114.435 I-.592 J1.77 E.11675
G3 X134.499 Y111.081 I-.929 J-1.606 E.16867
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 2.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X134.925 Y110.985 E-.16592
G1 X135.312 Y110.975 E-.1474
G1 X135.559 Y111.028 E-.09582
G1 X135.693 Y111.056 E-.05192
G1 X136.048 Y111.214 E-.14774
G1 X136.362 Y111.443 E-.14774
G1 X136.369 Y111.449 E-.00347
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
G3 Z2.6 I.631 J-1.041 P1  F30000
G1 X107.316 Y93.85 Z2.6
G1 Z2.4
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X107.33 Y93.964 E.00314
G1 X107.362 Y94.227 E.00723
G1 X107.311 Y94.643 E.01148
G1 X107.162 Y95.036 E.01148
G1 X106.924 Y95.381 E.01148
G1 X106.61 Y95.659 E.01148
M73 P68 R3
G1 X106.238 Y95.854 E.01148
G1 X105.831 Y95.955 E.01148
G1 X105.411 Y95.955 E.01148
G1 X105.004 Y95.854 E.01148
G1 X104.632 Y95.659 E.01148
G1 X104.434 Y95.484 E.00723
G1 X104.318 Y95.381 E.00424
G1 X104.08 Y95.036 E.01148
G1 X103.931 Y94.643 E.01148
G1 X103.88 Y94.227 E.01148
G1 X103.931 Y93.81 E.01148
G1 X104.08 Y93.418 E.01148
G1 X104.318 Y93.072 E.01148
G1 X104.632 Y92.794 E.01148
G1 X105.004 Y92.599 E.01148
G1 X105.411 Y92.499 E.01148
G1 X105.831 Y92.499 E.01148
G1 X106.238 Y92.599 E.01148
G1 X106.61 Y92.794 E.01148
G1 X106.924 Y93.072 E.01148
G1 X107.162 Y93.418 E.01148
G1 X107.304 Y93.792 E.01093
M204 S10000
; WIPE_START
G1 F24000
G1 X107.33 Y93.964 E-.0663
G1 X107.362 Y94.227 E-.10048
G1 X107.311 Y94.643 E-.15946
G1 X107.162 Y95.036 E-.15946
G1 X106.924 Y95.381 E-.15946
G1 X106.698 Y95.581 E-.11485
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I1.056 J-.605 P1  F30000
G1 X104.932 Y92.499 Z2.8
G1 Z2.4
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X104.933 Y92.5 E.00002
G3 X105.722 Y92.37 I.689 J1.721 E.02203
G1 X105.856 Y92.392 E.00373
G1 X106.118 Y92.435 E.00727
G3 X104.578 Y92.689 I-.497 J1.786 E.27453
G1 X104.879 Y92.528 E.00934
M204 S10000
; WIPE_START
G1 F24000
G1 X104.933 Y92.5 E-.02287
G1 X105.32 Y92.392 E-.15277
G1 X105.722 Y92.37 E-.1528
G1 X105.856 Y92.392 E-.05179
G1 X106.118 Y92.435 E-.10102
G1 X106.492 Y92.584 E-.15281
G1 X106.766 Y92.77 E-.12593
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I-1.19 J.254 P1  F30000
G1 X111.825 Y116.426 Z2.8
G1 Z2.4
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X111.839 Y116.54 E.00314
G1 X111.871 Y116.803 E.00723
G1 X111.82 Y117.219 E.01148
G1 X111.671 Y117.611 E.01148
G1 X111.433 Y117.957 E.01148
G1 X111.119 Y118.235 E.01148
G1 X110.747 Y118.43 E.01148
G1 X110.34 Y118.53 E.01148
G1 X109.92 Y118.53 E.01148
G1 X109.513 Y118.43 E.01148
G1 X109.141 Y118.235 E.01148
G1 X108.943 Y118.06 E.00723
G1 X108.827 Y117.957 E.00424
G1 X108.589 Y117.611 E.01148
G1 X108.44 Y117.219 E.01148
G1 X108.389 Y116.803 E.01148
G1 X108.44 Y116.386 E.01148
G1 X108.589 Y115.994 E.01148
G1 X108.827 Y115.648 E.01148
G1 X109.141 Y115.37 E.01148
G1 X109.513 Y115.175 E.01148
G1 X109.92 Y115.075 E.01148
G1 X110.34 Y115.075 E.01148
G1 X110.747 Y115.175 E.01148
G1 X111.119 Y115.37 E.01148
G1 X111.433 Y115.648 E.01148
G1 X111.671 Y115.994 E.01148
G1 X111.813 Y116.367 E.01093
M204 S10000
; WIPE_START
G1 F24000
G1 X111.839 Y116.54 E-.0663
G1 X111.871 Y116.803 E-.10048
G1 X111.82 Y117.219 E-.15946
G1 X111.671 Y117.611 E-.15946
G1 X111.433 Y117.957 E-.15946
G1 X111.207 Y118.157 E-.11485
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I1.056 J-.605 P1  F30000
G1 X109.441 Y115.075 Z2.8
G1 Z2.4
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X109.442 Y115.076 E.00002
G3 X110.231 Y114.946 I.689 J1.721 E.02203
G1 X110.365 Y114.968 E.00373
G1 X110.627 Y115.011 E.00727
G3 X109.087 Y115.265 I-.497 J1.786 E.27453
G1 X109.388 Y115.103 E.00934
M204 S10000
; WIPE_START
G1 F24000
G1 X109.442 Y115.076 E-.02287
G1 X109.829 Y114.967 E-.15277
G1 X110.231 Y114.946 E-.1528
G1 X110.365 Y114.968 E-.05179
G1 X110.627 Y115.011 E-.10102
G1 X111.001 Y115.16 E-.15281
G1 X111.275 Y115.345 E-.12593
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I-1.217 J-.007 P1  F30000
G1 X111.132 Y140.08 Z2.8
G1 Z2.4
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X111.146 Y140.194 E.00314
G1 X111.178 Y140.457 E.00723
G1 X111.127 Y140.873 E.01148
G1 X110.978 Y141.266 E.01148
G1 X110.74 Y141.611 E.01148
G1 X110.426 Y141.889 E.01148
G1 X110.054 Y142.084 E.01148
G1 X109.647 Y142.185 E.01148
G1 X109.227 Y142.185 E.01148
G1 X108.82 Y142.084 E.01148
G1 X108.448 Y141.889 E.01148
G1 X108.25 Y141.714 E.00723
G1 X108.134 Y141.611 E.00424
G1 X107.896 Y141.266 E.01148
G1 X107.747 Y140.873 E.01148
G1 X107.696 Y140.457 E.01148
G1 X107.747 Y140.04 E.01148
G1 X107.896 Y139.648 E.01148
G1 X108.134 Y139.303 E.01148
G1 X108.448 Y139.024 E.01148
G1 X108.82 Y138.829 E.01148
G1 X109.227 Y138.729 E.01148
G1 X109.647 Y138.729 E.01148
G1 X110.054 Y138.829 E.01148
G1 X110.426 Y139.024 E.01148
G1 X110.74 Y139.303 E.01148
G1 X110.978 Y139.648 E.01148
G1 X111.12 Y140.022 E.01093
M204 S10000
; WIPE_START
G1 F24000
G1 X111.146 Y140.194 E-.0663
G1 X111.178 Y140.457 E-.10048
G1 X111.127 Y140.873 E-.15946
G1 X110.978 Y141.266 E-.15946
G1 X110.74 Y141.611 E-.15946
G1 X110.514 Y141.812 E-.11485
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I1.056 J-.605 P1  F30000
G1 X108.748 Y138.729 Z2.8
G1 Z2.4
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X108.749 Y138.73 E.00002
G3 X109.538 Y138.6 I.689 J1.721 E.02203
G1 X109.672 Y138.622 E.00373
G1 X109.934 Y138.665 E.00727
G3 X108.394 Y138.919 I-.497 J1.786 E.27453
G1 X108.695 Y138.758 E.00934
M204 S10000
; WIPE_START
G1 F24000
G1 X108.749 Y138.73 E-.02287
G1 X109.136 Y138.622 E-.15277
G1 X109.538 Y138.6 E-.1528
G1 X109.672 Y138.622 E-.05179
G1 X109.934 Y138.665 E-.10102
G1 X110.308 Y138.814 E-.15281
G1 X110.582 Y139 E-.12593
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I-1.217 J.017 P1  F30000
G1 X110.966 Y165.727 Z2.8
G1 Z2.4
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X110.98 Y165.842 E.00314
G1 X111.012 Y166.104 E.00723
G1 X110.961 Y166.521 E.01148
G1 X110.812 Y166.913 E.01148
G1 X110.574 Y167.258 E.01148
G1 X110.26 Y167.537 E.01148
G1 X109.888 Y167.732 E.01148
G1 X109.481 Y167.832 E.01148
G1 X109.061 Y167.832 E.01148
G1 X108.654 Y167.732 E.01148
G1 X108.282 Y167.537 E.01148
G1 X108.084 Y167.361 E.00723
G1 X107.968 Y167.258 E.00424
G1 X107.73 Y166.913 E.01148
G1 X107.581 Y166.521 E.01148
G1 X107.53 Y166.104 E.01148
G1 X107.581 Y165.688 E.01148
G1 X107.73 Y165.295 E.01148
G1 X107.968 Y164.95 E.01148
G1 X108.282 Y164.672 E.01148
G1 X108.654 Y164.477 E.01148
G1 X109.061 Y164.376 E.01148
G1 X109.481 Y164.376 E.01148
G1 X109.888 Y164.477 E.01148
G1 X110.26 Y164.672 E.01148
G1 X110.574 Y164.95 E.01148
G1 X110.812 Y165.295 E.01148
G1 X110.954 Y165.669 E.01093
M204 S10000
; WIPE_START
G1 F24000
G1 X110.98 Y165.842 E-.0663
G1 X111.012 Y166.104 E-.10048
G1 X110.961 Y166.521 E-.15946
G1 X110.812 Y166.913 E-.15946
G1 X110.574 Y167.258 E-.15946
G1 X110.348 Y167.459 E-.11485
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I1.056 J-.605 P1  F30000
G1 X108.583 Y164.377 Z2.8
G1 Z2.4
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X108.583 Y164.377 E.00002
G3 X109.372 Y164.247 I.689 J1.721 E.02203
G1 X109.506 Y164.269 E.00373
G1 X109.769 Y164.312 E.00727
G3 X108.228 Y164.566 I-.497 J1.786 E.27453
G1 X108.53 Y164.405 E.00934
M204 S10000
; WIPE_START
G1 F24000
G1 X108.583 Y164.377 E-.02287
G1 X108.97 Y164.269 E-.15277
G1 X109.372 Y164.247 E-.1528
G1 X109.506 Y164.269 E-.05179
G1 X109.769 Y164.312 E-.10102
G1 X110.142 Y164.461 E-.15281
G1 X110.416 Y164.647 E-.12593
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I.442 J1.134 P1  F30000
G1 X136.461 Y154.505 Z2.8
G1 Z2.4
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X136.411 Y154.917 E.01134
G1 X136.262 Y155.309 E.01148
G1 X136.024 Y155.655 E.01148
G1 X135.71 Y155.933 E.01148
G1 X135.338 Y156.128 E.01148
G1 X134.931 Y156.228 E.01148
G1 X134.511 Y156.228 E.01148
G1 X134.103 Y156.128 E.01148
G1 X133.732 Y155.933 E.01148
G1 X133.418 Y155.655 E.01148
G1 X133.179 Y155.309 E.01148
G1 X133.031 Y154.917 E.01148
G1 X132.98 Y154.5 E.01148
G1 X133.031 Y154.084 E.01148
G1 X133.179 Y153.691 E.01148
G1 X133.418 Y153.346 E.01148
G1 X133.732 Y153.068 E.01148
G1 X134.103 Y152.873 E.01148
G1 X134.511 Y152.772 E.01148
G1 X134.931 Y152.772 E.01148
G1 X135.338 Y152.873 E.01148
G1 X135.71 Y153.068 E.01148
G1 X136.024 Y153.346 E.01148
G1 X136.262 Y153.691 E.01148
G1 X136.411 Y154.084 E.01148
G1 X136.455 Y154.446 E.00997
M204 S10000
; WIPE_START
G1 F24000
G1 X136.411 Y154.917 E-.17988
G1 X136.262 Y155.309 E-.15946
G1 X136.024 Y155.655 E-.15946
G1 X135.71 Y155.933 E-.15946
G1 X135.472 Y156.057 E-.10174
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I1.13 J-.451 P1  F30000
G1 X134.146 Y152.732 Z2.8
G1 Z2.4
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X134.527 Y152.661 E.0106
G3 X135.147 Y152.7 I.194 J1.845 E.01706
G1 X135.295 Y152.732 E.00414
G3 X135.651 Y156.111 I-.592 J1.77 E.11675
G3 X134.102 Y152.757 I-.929 J-1.605 E.16867
M204 S10000
; WIPE_START
G1 F24000
G1 X134.527 Y152.661 E-.16574
G1 X134.915 Y152.651 E-.14738
G1 X135.147 Y152.7 E-.09015
G1 X135.295 Y152.732 E-.05758
G1 X135.651 Y152.89 E-.14774
M73 P69 R3
G1 X135.965 Y153.118 E-.14774
G1 X135.972 Y153.125 E-.00367
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I1.216 J.036 P1  F30000
G1 X136.589 Y132.316 Z2.8
G1 Z2.4
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X136.539 Y132.728 E.01134
G1 X136.39 Y133.12 E.01148
G1 X136.152 Y133.465 E.01148
G1 X135.838 Y133.744 E.01148
G1 X135.466 Y133.939 E.01148
G1 X135.059 Y134.039 E.01148
G1 X134.639 Y134.039 E.01148
G1 X134.231 Y133.939 E.01148
G1 X133.86 Y133.744 E.01148
G1 X133.546 Y133.465 E.01148
G1 X133.307 Y133.12 E.01148
G1 X133.159 Y132.728 E.01148
G1 X133.108 Y132.311 E.01148
G1 X133.159 Y131.894 E.01148
G1 X133.307 Y131.502 E.01148
G1 X133.546 Y131.157 E.01148
G1 X133.86 Y130.878 E.01148
G1 X134.231 Y130.683 E.01148
G1 X134.639 Y130.583 E.01148
G1 X135.059 Y130.583 E.01148
G1 X135.466 Y130.683 E.01148
G1 X135.838 Y130.878 E.01148
G1 X136.152 Y131.157 E.01148
G1 X136.39 Y131.502 E.01148
G1 X136.539 Y131.894 E.01148
G1 X136.583 Y132.256 E.00997
M204 S10000
; WIPE_START
G1 F24000
G1 X136.539 Y132.728 E-.17988
G1 X136.39 Y133.12 E-.15946
G1 X136.152 Y133.465 E-.15946
G1 X135.838 Y133.744 E-.15946
G1 X135.6 Y133.868 E-.10174
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I1.13 J-.451 P1  F30000
G1 X134.274 Y130.542 Z2.8
G1 Z2.4
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X134.655 Y130.472 E.0106
G3 X135.275 Y130.511 I.194 J1.845 E.01706
G1 X135.423 Y130.542 E.00414
G3 X135.779 Y133.922 I-.592 J1.77 E.11675
G3 X134.23 Y130.568 I-.929 J-1.605 E.16867
M204 S10000
; WIPE_START
G1 F24000
G1 X134.655 Y130.472 E-.16574
G1 X135.043 Y130.462 E-.14738
G1 X135.275 Y130.511 E-.09015
G1 X135.423 Y130.542 E-.05758
G1 X135.779 Y130.7 E-.14774
G1 X136.093 Y130.929 E-.14774
G1 X136.1 Y130.936 E-.00367
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I1.216 J.051 P1  F30000
G1 X136.858 Y112.829 Z2.8
G1 Z2.4
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X136.808 Y113.241 E.01134
G1 X136.659 Y113.634 E.01148
G1 X136.421 Y113.979 E.01148
G1 X136.107 Y114.257 E.01148
G1 X135.735 Y114.452 E.01148
G1 X135.328 Y114.553 E.01148
G1 X134.908 Y114.553 E.01148
G1 X134.501 Y114.452 E.01148
G1 X134.129 Y114.257 E.01148
G1 X133.815 Y113.979 E.01148
G1 X133.577 Y113.634 E.01148
G1 X133.428 Y113.241 E.01148
G1 X133.377 Y112.825 E.01148
G1 X133.428 Y112.408 E.01148
G1 X133.577 Y112.016 E.01148
G1 X133.815 Y111.67 E.01148
G1 X134.129 Y111.392 E.01148
G1 X134.501 Y111.197 E.01148
G1 X134.908 Y111.097 E.01148
G1 X135.328 Y111.097 E.01148
G1 X135.735 Y111.197 E.01148
G1 X136.107 Y111.392 E.01148
G1 X136.421 Y111.67 E.01148
G1 X136.659 Y112.016 E.01148
G1 X136.808 Y112.408 E.01148
G1 X136.852 Y112.77 E.00997
M204 S10000
; WIPE_START
G1 F24000
G1 X136.808 Y113.241 E-.17988
G1 X136.659 Y113.634 E-.15946
G1 X136.421 Y113.979 E-.15946
G1 X136.107 Y114.257 E-.15946
G1 X135.87 Y114.382 E-.10174
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I1.13 J-.451 P1  F30000
G1 X134.544 Y111.056 Z2.8
G1 Z2.4
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X134.925 Y110.985 E.0106
G3 X135.544 Y111.025 I.194 J1.845 E.01706
G1 X135.693 Y111.056 E.00414
G3 X136.048 Y114.435 I-.592 J1.77 E.11675
G3 X134.499 Y111.082 I-.929 J-1.605 E.16867
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 2.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X134.925 Y110.985 E-.16574
G1 X135.312 Y110.975 E-.14738
G1 X135.544 Y111.025 E-.09015
G1 X135.693 Y111.056 E-.05758
G1 X136.048 Y111.214 E-.14774
G1 X136.362 Y111.443 E-.14774
G1 X136.369 Y111.45 E-.00367
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
G3 Z2.8 I.631 J-1.041 P1  F30000
G1 X107.315 Y93.843 Z2.8
G1 Z2.6
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X107.362 Y94.227 E.01058
G1 X107.311 Y94.643 E.01148
G1 X107.162 Y95.036 E.01148
G1 X106.924 Y95.381 E.01148
G1 X106.61 Y95.659 E.01148
G1 X106.238 Y95.854 E.01148
G1 X105.831 Y95.955 E.01148
G1 X105.411 Y95.955 E.01148
G1 X105.004 Y95.854 E.01148
G1 X104.632 Y95.659 E.01148
G1 X104.443 Y95.491 E.00692
G1 X104.318 Y95.381 E.00456
G1 X104.08 Y95.036 E.01148
G1 X103.931 Y94.643 E.01148
G1 X103.88 Y94.227 E.01148
G1 X103.931 Y93.81 E.01148
G1 X104.08 Y93.418 E.01148
G1 X104.318 Y93.072 E.01148
G1 X104.632 Y92.794 E.01148
G1 X104.78 Y92.717 E.00456
G1 X105.004 Y92.599 E.00692
G1 X105.411 Y92.499 E.01148
G1 X105.831 Y92.499 E.01148
G1 X106.238 Y92.599 E.01148
G1 X106.61 Y92.794 E.01148
G1 X106.924 Y93.072 E.01148
G1 X107.162 Y93.418 E.01148
G1 X107.301 Y93.785 E.01073
M204 S10000
; WIPE_START
G1 F24000
G1 X107.362 Y94.227 E-.16953
G1 X107.311 Y94.643 E-.15946
G1 X107.162 Y95.036 E-.15946
G1 X106.924 Y95.381 E-.15946
G1 X106.703 Y95.577 E-.1121
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I1.055 J-.607 P1  F30000
G1 X104.932 Y92.499 Z3
G1 Z2.6
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X104.933 Y92.5 E.00002
G3 X105.722 Y92.37 I.689 J1.721 E.02203
G1 X105.87 Y92.394 E.0041
G1 X106.118 Y92.435 E.0069
G3 X104.578 Y92.689 I-.497 J1.786 E.27453
G1 X104.88 Y92.527 E.00935
M204 S10000
; WIPE_START
G1 F24000
G1 X104.933 Y92.5 E-.02286
G1 X105.32 Y92.392 E-.15277
G1 X105.722 Y92.37 E-.1528
G1 X105.87 Y92.394 E-.05697
G1 X106.118 Y92.435 E-.09584
G1 X106.492 Y92.584 E-.1528
G1 X106.766 Y92.77 E-.12594
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I-1.19 J.255 P1  F30000
G1 X111.824 Y116.418 Z3
G1 Z2.6
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X111.871 Y116.803 E.01058
G1 X111.82 Y117.219 E.01148
G1 X111.671 Y117.611 E.01148
G1 X111.433 Y117.957 E.01148
G1 X111.119 Y118.235 E.01148
G1 X110.747 Y118.43 E.01148
G1 X110.34 Y118.53 E.01148
G1 X109.92 Y118.53 E.01148
G1 X109.513 Y118.43 E.01148
G1 X109.141 Y118.235 E.01148
G1 X108.952 Y118.067 E.00692
G1 X108.827 Y117.957 E.00456
G1 X108.589 Y117.611 E.01148
G1 X108.44 Y117.219 E.01148
G1 X108.389 Y116.803 E.01148
G1 X108.44 Y116.386 E.01148
G1 X108.589 Y115.994 E.01148
G1 X108.827 Y115.648 E.01148
G1 X109.141 Y115.37 E.01148
G1 X109.289 Y115.293 E.00456
G1 X109.513 Y115.175 E.00692
G1 X109.92 Y115.075 E.01148
G1 X110.34 Y115.075 E.01148
G1 X110.747 Y115.175 E.01148
G1 X111.119 Y115.37 E.01148
G1 X111.433 Y115.648 E.01148
G1 X111.671 Y115.994 E.01148
G1 X111.81 Y116.36 E.01073
M204 S10000
; WIPE_START
G1 F24000
G1 X111.871 Y116.803 E-.16953
G1 X111.82 Y117.219 E-.15946
G1 X111.671 Y117.611 E-.15946
G1 X111.433 Y117.957 E-.15946
G1 X111.212 Y118.152 E-.1121
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I1.055 J-.607 P1  F30000
G1 X109.441 Y115.075 Z3
G1 Z2.6
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X109.442 Y115.076 E.00002
G3 X110.231 Y114.946 I.689 J1.721 E.02203
G1 X110.379 Y114.97 E.0041
G1 X110.627 Y115.011 E.0069
G3 X109.087 Y115.265 I-.497 J1.786 E.27453
G1 X109.388 Y115.103 E.00935
M204 S10000
; WIPE_START
G1 F24000
G1 X109.442 Y115.076 E-.02286
G1 X109.829 Y114.967 E-.15277
G1 X110.231 Y114.946 E-.1528
G1 X110.379 Y114.97 E-.05697
G1 X110.627 Y115.011 E-.09584
G1 X111.001 Y115.16 E-.1528
G1 X111.275 Y115.346 E-.12594
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I-1.217 J-.007 P1  F30000
G1 X111.131 Y140.073 Z3
G1 Z2.6
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X111.178 Y140.457 E.01058
G1 X111.127 Y140.873 E.01148
G1 X110.978 Y141.266 E.01148
G1 X110.74 Y141.611 E.01148
G1 X110.426 Y141.889 E.01148
G1 X110.054 Y142.084 E.01148
G1 X109.647 Y142.185 E.01148
G1 X109.227 Y142.185 E.01148
G1 X108.82 Y142.084 E.01148
G1 X108.448 Y141.889 E.01148
G1 X108.259 Y141.722 E.00692
G1 X108.134 Y141.611 E.00456
G1 X107.896 Y141.266 E.01148
G1 X107.747 Y140.873 E.01148
G1 X107.696 Y140.457 E.01148
G1 X107.747 Y140.04 E.01148
G1 X107.896 Y139.648 E.01148
G1 X108.134 Y139.303 E.01148
G1 X108.448 Y139.024 E.01148
G1 X108.596 Y138.947 E.00456
G1 X108.82 Y138.829 E.00692
G1 X109.227 Y138.729 E.01148
G1 X109.647 Y138.729 E.01148
G1 X110.054 Y138.829 E.01148
G1 X110.426 Y139.024 E.01148
G1 X110.74 Y139.303 E.01148
G1 X110.978 Y139.648 E.01148
G1 X111.117 Y140.015 E.01073
M204 S10000
; WIPE_START
G1 F24000
G1 X111.178 Y140.457 E-.16953
G1 X111.127 Y140.873 E-.15946
G1 X110.978 Y141.266 E-.15946
G1 X110.74 Y141.611 E-.15946
G1 X110.519 Y141.807 E-.1121
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I1.055 J-.607 P1  F30000
G1 X108.748 Y138.729 Z3
M73 P70 R3
G1 Z2.6
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X108.749 Y138.73 E.00002
G3 X109.538 Y138.6 I.689 J1.721 E.02203
G1 X109.686 Y138.624 E.0041
G1 X109.934 Y138.665 E.0069
G3 X108.394 Y138.919 I-.497 J1.786 E.27453
G1 X108.695 Y138.758 E.00935
M204 S10000
; WIPE_START
G1 F24000
G1 X108.749 Y138.73 E-.02286
G1 X109.136 Y138.622 E-.15277
G1 X109.538 Y138.6 E-.1528
G1 X109.686 Y138.624 E-.05697
G1 X109.934 Y138.665 E-.09584
G1 X110.308 Y138.814 E-.1528
G1 X110.582 Y139 E-.12594
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I-1.217 J.017 P1  F30000
G1 X110.965 Y165.72 Z3
G1 Z2.6
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X111.012 Y166.104 E.01058
G1 X110.961 Y166.521 E.01148
G1 X110.812 Y166.913 E.01148
G1 X110.574 Y167.258 E.01148
G1 X110.26 Y167.537 E.01148
G1 X109.888 Y167.732 E.01148
G1 X109.481 Y167.832 E.01148
G1 X109.061 Y167.832 E.01148
G1 X108.654 Y167.732 E.01148
G1 X108.282 Y167.537 E.01148
G1 X108.093 Y167.369 E.00692
G1 X107.968 Y167.258 E.00456
G1 X107.73 Y166.913 E.01148
G1 X107.581 Y166.521 E.01148
G1 X107.53 Y166.104 E.01148
G1 X107.581 Y165.688 E.01148
G1 X107.73 Y165.295 E.01148
G1 X107.968 Y164.95 E.01148
G1 X108.282 Y164.672 E.01148
G1 X108.43 Y164.594 E.00456
G1 X108.654 Y164.477 E.00692
G1 X109.061 Y164.376 E.01148
G1 X109.481 Y164.376 E.01148
G1 X109.888 Y164.477 E.01148
G1 X110.26 Y164.672 E.01148
G1 X110.574 Y164.95 E.01148
G1 X110.812 Y165.295 E.01148
G1 X110.951 Y165.662 E.01073
M204 S10000
; WIPE_START
G1 F24000
G1 X111.012 Y166.104 E-.16953
G1 X110.961 Y166.521 E-.15946
G1 X110.812 Y166.913 E-.15946
G1 X110.574 Y167.258 E-.15946
G1 X110.353 Y167.454 E-.1121
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I1.055 J-.607 P1  F30000
G1 X108.583 Y164.377 Z3
G1 Z2.6
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X108.583 Y164.377 E.00002
G3 X109.372 Y164.247 I.689 J1.721 E.02203
G1 X109.52 Y164.271 E.0041
G1 X109.769 Y164.312 E.0069
G3 X108.228 Y164.566 I-.497 J1.786 E.27453
G1 X108.53 Y164.405 E.00935
M204 S10000
; WIPE_START
G1 F24000
G1 X108.583 Y164.377 E-.02286
G1 X108.97 Y164.269 E-.15277
G1 X109.372 Y164.247 E-.1528
G1 X109.52 Y164.271 E-.05697
G1 X109.769 Y164.312 E-.09584
G1 X110.142 Y164.461 E-.1528
G1 X110.416 Y164.647 E-.12594
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I.442 J1.134 P1  F30000
G1 X136.461 Y154.505 Z3
G1 Z2.6
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X136.433 Y154.733 E.00626
G1 X136.411 Y154.917 E.00507
G1 X136.262 Y155.309 E.01148
G1 X136.024 Y155.655 E.01148
G1 X135.71 Y155.933 E.01148
G1 X135.338 Y156.128 E.01148
G1 X134.931 Y156.228 E.01148
G1 X134.511 Y156.228 E.01148
G1 X134.103 Y156.128 E.01148
G1 X133.732 Y155.933 E.01148
G1 X133.418 Y155.655 E.01148
G1 X133.179 Y155.309 E.01148
G1 X133.031 Y154.917 E.01148
G1 X132.98 Y154.5 E.01148
G1 X133.008 Y154.268 E.0064
G1 X133.031 Y154.084 E.00507
G1 X133.179 Y153.691 E.01148
G1 X133.418 Y153.346 E.01148
G1 X133.732 Y153.068 E.01148
G1 X134.103 Y152.873 E.01148
G1 X134.511 Y152.772 E.01148
G1 X134.931 Y152.772 E.01148
G1 X135.338 Y152.873 E.01148
G1 X135.71 Y153.068 E.01148
G1 X136.024 Y153.346 E.01148
G1 X136.262 Y153.691 E.01148
G1 X136.411 Y154.084 E.01148
G1 X136.455 Y154.446 E.00998
M204 S10000
; WIPE_START
G1 F24000
G1 X136.433 Y154.733 E-.10932
G1 X136.411 Y154.917 E-.07047
G1 X136.262 Y155.309 E-.15946
G1 X136.024 Y155.655 E-.15946
G1 X135.71 Y155.933 E-.15946
G1 X135.472 Y156.057 E-.10184
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I1.13 J-.451 P1  F30000
G1 X134.146 Y152.732 Z3
G1 Z2.6
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X134.149 Y152.742 E.00029
G3 X135.133 Y152.697 I.573 J1.764 E.02725
G1 X135.295 Y152.732 E.00455
G3 X135.651 Y156.111 I-.592 J1.77 E.11675
G3 X133.796 Y152.899 I-.929 J-1.605 E.15943
G1 X134.092 Y152.757 E.00896
M204 S10000
; WIPE_START
G1 F24000
G1 X134.149 Y152.742 E-.02269
G1 X134.526 Y152.651 E-.14737
G1 X134.915 Y152.651 E-.14774
G1 X135.133 Y152.697 E-.08449
G1 X135.295 Y152.732 E-.06325
G1 X135.651 Y152.89 E-.14774
G1 X135.963 Y153.117 E-.14672
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I1.216 J.037 P1  F30000
G1 X136.589 Y132.316 Z3
G1 Z2.6
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X136.561 Y132.543 E.00626
G1 X136.539 Y132.728 E.00507
G1 X136.39 Y133.12 E.01148
G1 X136.152 Y133.465 E.01148
G1 X135.838 Y133.744 E.01148
G1 X135.466 Y133.939 E.01148
G1 X135.059 Y134.039 E.01148
G1 X134.639 Y134.039 E.01148
G1 X134.231 Y133.939 E.01148
G1 X133.86 Y133.744 E.01148
G1 X133.546 Y133.465 E.01148
G1 X133.307 Y133.12 E.01148
G1 X133.159 Y132.728 E.01148
G1 X133.108 Y132.311 E.01148
G1 X133.136 Y132.079 E.0064
G1 X133.159 Y131.894 E.00507
G1 X133.307 Y131.502 E.01148
G1 X133.546 Y131.157 E.01148
G1 X133.86 Y130.878 E.01148
G1 X134.231 Y130.683 E.01148
G1 X134.639 Y130.583 E.01148
G1 X135.059 Y130.583 E.01148
G1 X135.466 Y130.683 E.01148
G1 X135.838 Y130.878 E.01148
G1 X136.152 Y131.157 E.01148
G1 X136.39 Y131.502 E.01148
G1 X136.539 Y131.894 E.01148
G1 X136.583 Y132.257 E.00998
M204 S10000
; WIPE_START
G1 F24000
G1 X136.561 Y132.543 E-.10932
G1 X136.539 Y132.728 E-.07047
G1 X136.39 Y133.12 E-.15946
G1 X136.152 Y133.465 E-.15946
G1 X135.838 Y133.744 E-.15946
G1 X135.6 Y133.868 E-.10184
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I1.13 J-.451 P1  F30000
G1 X134.274 Y130.542 Z3
G1 Z2.6
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X134.277 Y130.552 E.00029
G3 X135.261 Y130.508 I.573 J1.764 E.02725
G1 X135.423 Y130.542 E.00455
G3 X135.779 Y133.922 I-.592 J1.77 E.11675
G3 X133.924 Y130.709 I-.929 J-1.605 E.15943
G1 X134.22 Y130.568 E.00896
M204 S10000
; WIPE_START
G1 F24000
G1 X134.277 Y130.552 E-.02269
G1 X134.654 Y130.462 E-.14737
G1 X135.043 Y130.462 E-.14774
G1 X135.261 Y130.508 E-.08449
G1 X135.423 Y130.542 E-.06325
G1 X135.779 Y130.7 E-.14774
G1 X136.091 Y130.927 E-.14672
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I1.216 J.052 P1  F30000
G1 X136.858 Y112.83 Z3
G1 Z2.6
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X136.83 Y113.057 E.00626
G1 X136.808 Y113.241 E.00507
G1 X136.659 Y113.634 E.01148
G1 X136.421 Y113.979 E.01148
G1 X136.107 Y114.257 E.01148
G1 X135.735 Y114.452 E.01148
G1 X135.328 Y114.553 E.01148
G1 X134.908 Y114.553 E.01148
G1 X134.501 Y114.452 E.01148
G1 X134.129 Y114.257 E.01148
G1 X133.815 Y113.979 E.01148
G1 X133.577 Y113.634 E.01148
G1 X133.428 Y113.241 E.01148
G1 X133.377 Y112.825 E.01148
G1 X133.406 Y112.592 E.0064
G1 X133.428 Y112.408 E.00507
G1 X133.577 Y112.016 E.01148
G1 X133.815 Y111.67 E.01148
G1 X134.129 Y111.392 E.01148
G1 X134.501 Y111.197 E.01148
G1 X134.908 Y111.097 E.01148
G1 X135.328 Y111.097 E.01148
G1 X135.735 Y111.197 E.01148
G1 X136.107 Y111.392 E.01148
G1 X136.421 Y111.67 E.01148
G1 X136.659 Y112.016 E.01148
G1 X136.808 Y112.408 E.01148
G1 X136.852 Y112.77 E.00998
M204 S10000
; WIPE_START
G1 F24000
G1 X136.83 Y113.057 E-.10932
G1 X136.808 Y113.241 E-.07047
G1 X136.659 Y113.634 E-.15946
G1 X136.421 Y113.979 E-.15946
G1 X136.107 Y114.257 E-.15946
G1 X135.87 Y114.382 E-.10184
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I1.13 J-.451 P1  F30000
G1 X134.543 Y111.056 Z3
G1 Z2.6
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X134.547 Y111.066 E.00029
G3 X135.53 Y111.021 I.573 J1.764 E.02725
G1 X135.693 Y111.056 E.00455
G3 X136.048 Y114.435 I-.592 J1.77 E.11675
G3 X134.193 Y111.223 I-.929 J-1.605 E.15943
G1 X134.489 Y111.082 E.00896
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 2.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X134.547 Y111.066 E-.02269
G1 X134.924 Y110.975 E-.14737
G1 X135.312 Y110.975 E-.14774
G1 X135.53 Y111.021 E-.08449
G1 X135.693 Y111.056 E-.06325
G1 X136.048 Y111.214 E-.14774
G1 X136.36 Y111.441 E-.14672
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
G3 Z3 I.631 J-1.041 P1  F30000
G1 X107.315 Y93.84 Z3
G1 Z2.8
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X107.332 Y93.987 E.00404
G1 X107.362 Y94.227 E.0066
G1 X107.311 Y94.643 E.01148
G1 X107.162 Y95.036 E.01148
G1 X106.924 Y95.381 E.01148
G1 X106.61 Y95.659 E.01148
G1 X106.238 Y95.854 E.01148
G1 X105.831 Y95.955 E.01148
G1 X105.411 Y95.955 E.01148
G1 X105.004 Y95.854 E.01148
G1 X104.632 Y95.659 E.01148
G1 X104.318 Y95.381 E.01148
G1 X104.08 Y95.036 E.01148
G1 X103.931 Y94.643 E.01148
G1 X103.902 Y94.404 E.0066
G1 X103.88 Y94.227 E.00487
G1 X103.931 Y93.81 E.01148
G1 X104.08 Y93.418 E.01148
G1 X104.318 Y93.072 E.01148
G1 X104.632 Y92.794 E.01148
G1 X105.004 Y92.599 E.01148
G1 X105.411 Y92.499 E.01148
G1 X105.831 Y92.499 E.01148
G1 X106.238 Y92.599 E.01148
G1 X106.61 Y92.794 E.01148
G1 X106.924 Y93.072 E.01148
G1 X107.162 Y93.418 E.01148
G1 X107.301 Y93.782 E.01067
M204 S10000
; WIPE_START
G1 F24000
G1 X107.332 Y93.987 E-.07864
M73 P71 R3
G1 X107.362 Y94.227 E-.09174
G1 X107.311 Y94.643 E-.15946
G1 X107.162 Y95.036 E-.15946
G1 X106.924 Y95.381 E-.15946
G1 X106.705 Y95.575 E-.11124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I1.055 J-.607 P1  F30000
G1 X104.933 Y92.499 Z3.2
G1 Z2.8
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X105.32 Y92.392 E.01099
G3 X105.722 Y92.37 I.302 J1.829 E.01102
G1 X105.883 Y92.396 E.00447
G1 X106.118 Y92.435 E.00652
G3 X104.878 Y92.523 I-.497 J1.786 E.28393
M204 S10000
; WIPE_START
G1 F24000
G1 X105.32 Y92.392 E-.17507
G1 X105.722 Y92.37 E-.15279
G1 X105.883 Y92.396 E-.06215
G1 X106.118 Y92.435 E-.09066
G1 X106.492 Y92.584 E-.1528
G1 X106.768 Y92.77 E-.12653
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I-1.19 J.254 P1  F30000
G1 X111.824 Y116.416 Z3.2
G1 Z2.8
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X111.841 Y116.563 E.00404
G1 X111.871 Y116.803 E.0066
G1 X111.82 Y117.219 E.01148
G1 X111.671 Y117.611 E.01148
G1 X111.433 Y117.957 E.01148
G1 X111.119 Y118.235 E.01148
G1 X110.747 Y118.43 E.01148
G1 X110.34 Y118.53 E.01148
G1 X109.92 Y118.53 E.01148
G1 X109.513 Y118.43 E.01148
G1 X109.141 Y118.235 E.01148
G1 X108.827 Y117.957 E.01148
G1 X108.589 Y117.611 E.01148
G1 X108.44 Y117.219 E.01148
G1 X108.411 Y116.979 E.0066
G1 X108.389 Y116.803 E.00487
G1 X108.44 Y116.386 E.01148
G1 X108.589 Y115.994 E.01148
G1 X108.827 Y115.648 E.01148
G1 X109.141 Y115.37 E.01148
G1 X109.513 Y115.175 E.01148
G1 X109.92 Y115.075 E.01148
G1 X110.34 Y115.075 E.01148
G1 X110.747 Y115.175 E.01148
G1 X111.119 Y115.37 E.01148
G1 X111.433 Y115.648 E.01148
G1 X111.671 Y115.994 E.01148
G1 X111.81 Y116.358 E.01067
M204 S10000
; WIPE_START
G1 F24000
G1 X111.841 Y116.563 E-.07864
G1 X111.871 Y116.803 E-.09174
G1 X111.82 Y117.219 E-.15946
G1 X111.671 Y117.611 E-.15946
G1 X111.433 Y117.957 E-.15946
G1 X111.214 Y118.151 E-.11124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I1.055 J-.607 P1  F30000
G1 X109.442 Y115.075 Z3.2
G1 Z2.8
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X109.829 Y114.968 E.01099
G3 X110.231 Y114.946 I.302 J1.829 E.01102
G1 X110.392 Y114.972 E.00447
G1 X110.627 Y115.011 E.00652
G3 X109.387 Y115.098 I-.497 J1.786 E.28393
M204 S10000
; WIPE_START
G1 F24000
G1 X109.829 Y114.968 E-.17507
G1 X110.231 Y114.946 E-.15279
G1 X110.392 Y114.972 E-.06215
G1 X110.627 Y115.011 E-.09066
G1 X111.001 Y115.16 E-.1528
G1 X111.277 Y115.346 E-.12653
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I-1.217 J-.007 P1  F30000
G1 X111.131 Y140.071 Z3.2
G1 Z2.8
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X111.148 Y140.217 E.00404
G1 X111.178 Y140.457 E.0066
G1 X111.127 Y140.873 E.01148
G1 X110.978 Y141.266 E.01148
G1 X110.74 Y141.611 E.01148
G1 X110.426 Y141.889 E.01148
G1 X110.054 Y142.084 E.01148
G1 X109.647 Y142.185 E.01148
G1 X109.227 Y142.185 E.01148
G1 X108.82 Y142.084 E.01148
G1 X108.448 Y141.889 E.01148
G1 X108.134 Y141.611 E.01148
G1 X107.896 Y141.266 E.01148
G1 X107.747 Y140.873 E.01148
G1 X107.718 Y140.634 E.0066
G1 X107.696 Y140.457 E.00487
G1 X107.747 Y140.04 E.01148
G1 X107.896 Y139.648 E.01148
G1 X108.134 Y139.303 E.01148
G1 X108.448 Y139.024 E.01148
G1 X108.82 Y138.829 E.01148
G1 X109.227 Y138.729 E.01148
G1 X109.647 Y138.729 E.01148
G1 X110.054 Y138.829 E.01148
G1 X110.426 Y139.024 E.01148
G1 X110.74 Y139.303 E.01148
G1 X110.978 Y139.648 E.01148
G1 X111.117 Y140.013 E.01067
M204 S10000
; WIPE_START
G1 F24000
G1 X111.148 Y140.217 E-.07864
G1 X111.178 Y140.457 E-.09174
G1 X111.127 Y140.873 E-.15946
G1 X110.978 Y141.266 E-.15946
G1 X110.74 Y141.611 E-.15946
G1 X110.521 Y141.805 E-.11124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I1.055 J-.607 P1  F30000
G1 X108.749 Y138.729 Z3.2
G1 Z2.8
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X109.136 Y138.622 E.01099
G3 X109.538 Y138.6 I.302 J1.829 E.01102
G1 X109.699 Y138.626 E.00447
G1 X109.934 Y138.665 E.00652
G3 X108.694 Y138.753 I-.497 J1.786 E.28393
M204 S10000
; WIPE_START
G1 F24000
G1 X109.136 Y138.622 E-.17507
G1 X109.538 Y138.6 E-.15279
G1 X109.699 Y138.626 E-.06215
G1 X109.934 Y138.665 E-.09066
G1 X110.308 Y138.814 E-.1528
G1 X110.584 Y139.001 E-.12653
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I-1.217 J.017 P1  F30000
G1 X110.965 Y165.718 Z3.2
G1 Z2.8
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X110.983 Y165.864 E.00404
G1 X111.012 Y166.104 E.0066
G1 X110.961 Y166.521 E.01148
G1 X110.812 Y166.913 E.01148
G1 X110.574 Y167.258 E.01148
G1 X110.26 Y167.537 E.01148
G1 X109.888 Y167.732 E.01148
G1 X109.481 Y167.832 E.01148
G1 X109.061 Y167.832 E.01148
G1 X108.654 Y167.732 E.01148
G1 X108.282 Y167.537 E.01148
G1 X107.968 Y167.258 E.01148
G1 X107.73 Y166.913 E.01148
G1 X107.581 Y166.521 E.01148
G1 X107.552 Y166.281 E.0066
G1 X107.53 Y166.104 E.00487
G1 X107.581 Y165.688 E.01148
G1 X107.73 Y165.295 E.01148
G1 X107.968 Y164.95 E.01148
G1 X108.282 Y164.672 E.01148
G1 X108.654 Y164.477 E.01148
G1 X109.061 Y164.376 E.01148
G1 X109.481 Y164.376 E.01148
G1 X109.888 Y164.477 E.01148
G1 X110.26 Y164.672 E.01148
G1 X110.574 Y164.95 E.01148
G1 X110.812 Y165.295 E.01148
G1 X110.951 Y165.66 E.01067
M204 S10000
; WIPE_START
G1 F24000
G1 X110.983 Y165.864 E-.07864
G1 X111.012 Y166.104 E-.09174
G1 X110.961 Y166.521 E-.15946
G1 X110.812 Y166.913 E-.15946
G1 X110.574 Y167.258 E-.15946
G1 X110.355 Y167.452 E-.11124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I1.055 J-.607 P1  F30000
G1 X108.583 Y164.376 Z3.2
G1 Z2.8
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X108.97 Y164.269 E.01099
G3 X109.372 Y164.247 I.302 J1.829 E.01102
G1 X109.533 Y164.274 E.00447
G1 X109.769 Y164.312 E.00652
G3 X108.529 Y164.4 I-.497 J1.786 E.28393
M204 S10000
; WIPE_START
G1 F24000
G1 X108.97 Y164.269 E-.17507
G1 X109.372 Y164.247 E-.15279
G1 X109.533 Y164.274 E-.06215
G1 X109.769 Y164.312 E-.09066
G1 X110.142 Y164.461 E-.1528
G1 X110.418 Y164.648 E-.12653
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I.442 J1.134 P1  F30000
G1 X136.461 Y154.506 Z3.2
G1 Z2.8
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X136.411 Y154.917 E.01132
G1 X136.262 Y155.309 E.01148
G1 X136.024 Y155.655 E.01148
G1 X135.71 Y155.933 E.01148
G1 X135.338 Y156.128 E.01148
G1 X134.931 Y156.228 E.01148
G1 X134.511 Y156.228 E.01148
G1 X134.103 Y156.128 E.01148
G1 X133.732 Y155.933 E.01148
G1 X133.418 Y155.655 E.01148
G1 X133.179 Y155.309 E.01148
G1 X133.031 Y154.917 E.01148
G1 X133.004 Y154.697 E.00605
G1 X132.98 Y154.5 E.00543
G1 X133.031 Y154.084 E.01148
G1 X133.179 Y153.691 E.01148
G1 X133.418 Y153.346 E.01148
G1 X133.732 Y153.068 E.01148
G1 X134.103 Y152.873 E.01148
G1 X134.511 Y152.772 E.01148
G1 X134.931 Y152.772 E.01148
G1 X135.338 Y152.873 E.01148
G1 X135.71 Y153.068 E.01148
G1 X136.024 Y153.346 E.01148
G1 X136.262 Y153.691 E.01148
G1 X136.411 Y154.084 E.01148
G1 X136.437 Y154.303 E.00605
G1 X136.455 Y154.446 E.00394
M204 S10000
; WIPE_START
G1 F24000
G1 X136.411 Y154.917 E-.1796
G1 X136.262 Y155.309 E-.15946
G1 X136.024 Y155.655 E-.15946
G1 X135.71 Y155.933 E-.15946
G1 X135.472 Y156.058 E-.10202
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I1.13 J-.451 P1  F30000
G1 X134.149 Y152.742 Z3.2
G1 Z2.8
G1 E.8 F1800
M204 S5000
G1 F1460
G3 X135.118 Y152.694 I.573 J1.764 E.02684
G1 X135.295 Y152.732 E.00496
G3 X135.651 Y156.111 I-.592 J1.77 E.11675
G3 X134.093 Y152.761 I-.929 J-1.605 E.16837
M204 S10000
; WIPE_START
G1 F24000
G1 X134.526 Y152.651 E-.17006
G1 X134.915 Y152.651 E-.14774
G1 X135.118 Y152.694 E-.07882
G1 X135.295 Y152.732 E-.06891
G1 X135.651 Y152.89 E-.14774
G1 X135.963 Y153.117 E-.14672
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I1.216 J.037 P1  F30000
G1 X136.589 Y132.317 Z3.2
G1 Z2.8
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X136.539 Y132.728 E.01132
G1 X136.39 Y133.12 E.01148
G1 X136.152 Y133.465 E.01148
G1 X135.838 Y133.744 E.01148
G1 X135.466 Y133.939 E.01148
G1 X135.059 Y134.039 E.01148
G1 X134.639 Y134.039 E.01148
G1 X134.231 Y133.939 E.01148
G1 X133.86 Y133.744 E.01148
G1 X133.546 Y133.465 E.01148
M73 P72 R3
G1 X133.307 Y133.12 E.01148
G1 X133.159 Y132.728 E.01148
G1 X133.132 Y132.508 E.00605
G1 X133.108 Y132.311 E.00543
G1 X133.159 Y131.894 E.01148
G1 X133.307 Y131.502 E.01148
G1 X133.546 Y131.157 E.01148
G1 X133.86 Y130.878 E.01148
G1 X134.231 Y130.683 E.01148
G1 X134.639 Y130.583 E.01148
G1 X135.059 Y130.583 E.01148
G1 X135.466 Y130.683 E.01148
G1 X135.838 Y130.878 E.01148
G1 X136.152 Y131.157 E.01148
G1 X136.39 Y131.502 E.01148
G1 X136.539 Y131.894 E.01148
G1 X136.565 Y132.114 E.00605
G1 X136.583 Y132.257 E.00394
M204 S10000
; WIPE_START
G1 F24000
G1 X136.539 Y132.728 E-.1796
G1 X136.39 Y133.12 E-.15946
G1 X136.152 Y133.465 E-.15946
G1 X135.838 Y133.744 E-.15946
G1 X135.6 Y133.868 E-.10202
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I1.13 J-.451 P1  F30000
G1 X134.277 Y130.552 Z3.2
G1 Z2.8
G1 E.8 F1800
M204 S5000
G1 F1460
G3 X135.246 Y130.505 I.573 J1.764 E.02684
G1 X135.423 Y130.542 E.00496
G3 X135.779 Y133.922 I-.592 J1.77 E.11675
G3 X134.221 Y130.572 I-.929 J-1.605 E.16837
M204 S10000
; WIPE_START
G1 F24000
G1 X134.654 Y130.462 E-.17006
G1 X135.043 Y130.462 E-.14774
G1 X135.246 Y130.505 E-.07882
G1 X135.423 Y130.542 E-.06891
G1 X135.779 Y130.7 E-.14774
G1 X136.091 Y130.927 E-.14672
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I1.216 J.052 P1  F30000
G1 X136.858 Y112.83 Z3.2
G1 Z2.8
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X136.808 Y113.241 E.01132
G1 X136.659 Y113.634 E.01148
G1 X136.421 Y113.979 E.01148
G1 X136.107 Y114.257 E.01148
G1 X135.735 Y114.452 E.01148
G1 X135.328 Y114.553 E.01148
G1 X134.908 Y114.553 E.01148
G1 X134.501 Y114.452 E.01148
G1 X134.129 Y114.257 E.01148
G1 X133.815 Y113.979 E.01148
G1 X133.577 Y113.634 E.01148
G1 X133.428 Y113.241 E.01148
G1 X133.401 Y113.022 E.00605
G1 X133.377 Y112.825 E.00543
G1 X133.428 Y112.408 E.01148
G1 X133.577 Y112.016 E.01148
G1 X133.815 Y111.67 E.01148
G1 X134.129 Y111.392 E.01148
G1 X134.501 Y111.197 E.01148
G1 X134.908 Y111.097 E.01148
G1 X135.328 Y111.097 E.01148
G1 X135.735 Y111.197 E.01148
G1 X136.107 Y111.392 E.01148
G1 X136.421 Y111.67 E.01148
G1 X136.659 Y112.016 E.01148
G1 X136.808 Y112.408 E.01148
G1 X136.835 Y112.628 E.00605
G1 X136.852 Y112.771 E.00394
M204 S10000
; WIPE_START
G1 F24000
G1 X136.808 Y113.241 E-.1796
G1 X136.659 Y113.634 E-.15946
G1 X136.421 Y113.979 E-.15946
G1 X136.107 Y114.257 E-.15946
G1 X135.869 Y114.382 E-.10202
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I1.13 J-.451 P1  F30000
G1 X134.547 Y111.066 Z3.2
G1 Z2.8
G1 E.8 F1800
M204 S5000
G1 F1460
G3 X135.515 Y111.018 I.573 J1.764 E.02684
G1 X135.693 Y111.056 E.00496
G3 X136.048 Y114.435 I-.592 J1.77 E.11675
G3 X134.49 Y111.086 I-.929 J-1.605 E.16837
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 3
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X134.924 Y110.975 E-.17006
G1 X135.312 Y110.975 E-.14774
G1 X135.515 Y111.018 E-.07882
G1 X135.693 Y111.056 E-.06891
G1 X136.048 Y111.214 E-.14774
G1 X136.36 Y111.441 E-.14672
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
G3 Z3.2 I.631 J-1.041 P1  F30000
G1 X107.314 Y93.838 Z3.2
G1 Z3
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X107.334 Y93.998 E.00442
G1 X107.362 Y94.227 E.00629
G1 X107.311 Y94.643 E.01148
G1 X107.162 Y95.036 E.01148
G1 X106.924 Y95.381 E.01148
G1 X106.61 Y95.659 E.01148
G1 X106.238 Y95.854 E.01148
G1 X105.831 Y95.955 E.01148
G1 X105.411 Y95.955 E.01148
G1 X105.004 Y95.854 E.01148
G1 X104.632 Y95.659 E.01148
G1 X104.318 Y95.381 E.01148
G1 X104.08 Y95.036 E.01148
G1 X103.931 Y94.643 E.01148
G1 X103.88 Y94.227 E.01148
G1 X103.931 Y93.81 E.01148
G1 X104.012 Y93.595 E.00629
G1 X104.08 Y93.418 E.00519
G1 X104.318 Y93.072 E.01148
G1 X104.632 Y92.794 E.01148
G1 X105.004 Y92.599 E.01148
G1 X105.411 Y92.499 E.01148
G1 X105.831 Y92.499 E.01148
G1 X106.238 Y92.599 E.01148
G1 X106.61 Y92.794 E.01148
G1 X106.924 Y93.072 E.01148
G1 X107.162 Y93.418 E.01148
G1 X107.3 Y93.78 E.01061
M204 S10000
; WIPE_START
G1 F24000
G1 X107.334 Y93.998 E-.08386
G1 X107.362 Y94.227 E-.08737
G1 X107.311 Y94.643 E-.15946
G1 X107.162 Y95.036 E-.15946
G1 X106.924 Y95.381 E-.15946
G1 X106.706 Y95.574 E-.1104
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I1.054 J-.608 P1  F30000
G1 X104.932 Y92.499 Z3.4
G1 Z3
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X104.933 Y92.5 E.00002
G3 X105.722 Y92.37 I.689 J1.721 E.02203
G1 X105.896 Y92.398 E.00485
G1 X106.118 Y92.435 E.00615
G3 X104.578 Y92.689 I-.497 J1.786 E.27453
G1 X104.88 Y92.527 E.00935
M204 S10000
; WIPE_START
G1 F24000
G1 X104.933 Y92.5 E-.02284
G1 X105.32 Y92.392 E-.15277
G1 X105.722 Y92.37 E-.1528
G1 X105.896 Y92.398 E-.06733
G1 X106.118 Y92.435 E-.08548
G1 X106.492 Y92.584 E-.1528
G1 X106.766 Y92.77 E-.12597
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.19 J.255 P1  F30000
G1 X111.823 Y116.414 Z3.4
G1 Z3
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X111.843 Y116.574 E.00442
G1 X111.871 Y116.803 E.00629
G1 X111.82 Y117.219 E.01148
G1 X111.671 Y117.611 E.01148
G1 X111.433 Y117.957 E.01148
G1 X111.119 Y118.235 E.01148
G1 X110.747 Y118.43 E.01148
G1 X110.34 Y118.53 E.01148
G1 X109.92 Y118.53 E.01148
G1 X109.513 Y118.43 E.01148
G1 X109.141 Y118.235 E.01148
G1 X108.827 Y117.957 E.01148
G1 X108.589 Y117.611 E.01148
G1 X108.44 Y117.219 E.01148
G1 X108.389 Y116.803 E.01148
G1 X108.44 Y116.386 E.01148
G1 X108.521 Y116.171 E.00629
G1 X108.589 Y115.994 E.00519
G1 X108.827 Y115.648 E.01148
G1 X109.141 Y115.37 E.01148
G1 X109.513 Y115.175 E.01148
G1 X109.92 Y115.075 E.01148
G1 X110.34 Y115.075 E.01148
G1 X110.747 Y115.175 E.01148
G1 X111.119 Y115.37 E.01148
G1 X111.433 Y115.648 E.01148
G1 X111.671 Y115.994 E.01148
G1 X111.809 Y116.356 E.01061
M204 S10000
; WIPE_START
G1 F24000
G1 X111.843 Y116.574 E-.08386
G1 X111.871 Y116.803 E-.08737
G1 X111.82 Y117.219 E-.15946
G1 X111.671 Y117.611 E-.15946
G1 X111.433 Y117.957 E-.15946
G1 X111.215 Y118.149 E-.1104
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I1.054 J-.608 P1  F30000
G1 X109.441 Y115.075 Z3.4
G1 Z3
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X109.442 Y115.076 E.00002
G3 X110.231 Y114.946 I.689 J1.721 E.02203
G1 X110.405 Y114.974 E.00485
G1 X110.627 Y115.011 E.00615
G3 X109.087 Y115.265 I-.497 J1.786 E.27453
G1 X109.389 Y115.103 E.00935
M204 S10000
; WIPE_START
G1 F24000
G1 X109.442 Y115.076 E-.02284
G1 X109.829 Y114.967 E-.15277
G1 X110.231 Y114.946 E-.1528
G1 X110.405 Y114.974 E-.06733
G1 X110.627 Y115.011 E-.08548
G1 X111.001 Y115.16 E-.1528
G1 X111.275 Y115.346 E-.12597
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.217 J-.007 P1  F30000
G1 X111.13 Y140.068 Z3.4
G1 Z3
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X111.15 Y140.229 E.00442
G1 X111.178 Y140.457 E.00629
G1 X111.127 Y140.873 E.01148
G1 X110.978 Y141.266 E.01148
G1 X110.74 Y141.611 E.01148
G1 X110.426 Y141.889 E.01148
G1 X110.054 Y142.084 E.01148
G1 X109.647 Y142.185 E.01148
G1 X109.227 Y142.185 E.01148
G1 X108.82 Y142.084 E.01148
G1 X108.448 Y141.889 E.01148
G1 X108.134 Y141.611 E.01148
G1 X107.896 Y141.266 E.01148
G1 X107.747 Y140.873 E.01148
G1 X107.696 Y140.457 E.01148
G1 X107.747 Y140.04 E.01148
G1 X107.828 Y139.825 E.00629
G1 X107.896 Y139.648 E.00519
G1 X108.134 Y139.303 E.01148
G1 X108.448 Y139.024 E.01148
G1 X108.82 Y138.829 E.01148
G1 X109.227 Y138.729 E.01148
G1 X109.647 Y138.729 E.01148
G1 X110.054 Y138.829 E.01148
G1 X110.426 Y139.024 E.01148
G1 X110.74 Y139.303 E.01148
G1 X110.978 Y139.648 E.01148
G1 X111.116 Y140.011 E.01061
M204 S10000
; WIPE_START
G1 F24000
G1 X111.15 Y140.229 E-.08386
G1 X111.178 Y140.457 E-.08737
G1 X111.127 Y140.873 E-.15946
G1 X110.978 Y141.266 E-.15946
G1 X110.74 Y141.611 E-.15946
G1 X110.522 Y141.804 E-.1104
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I1.054 J-.608 P1  F30000
G1 X108.748 Y138.729 Z3.4
G1 Z3
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X108.749 Y138.73 E.00002
G3 X109.538 Y138.6 I.689 J1.721 E.02203
G1 X109.712 Y138.629 E.00485
G1 X109.934 Y138.665 E.00615
G3 X108.394 Y138.919 I-.497 J1.786 E.27453
G1 X108.696 Y138.758 E.00935
M204 S10000
; WIPE_START
G1 F24000
G1 X108.749 Y138.73 E-.02284
M73 P73 R3
G1 X109.136 Y138.622 E-.15277
G1 X109.538 Y138.6 E-.1528
G1 X109.712 Y138.629 E-.06733
G1 X109.934 Y138.665 E-.08548
G1 X110.308 Y138.814 E-.1528
G1 X110.582 Y139 E-.12597
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.217 J.017 P1  F30000
G1 X110.965 Y165.716 Z3.4
G1 Z3
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X110.984 Y165.876 E.00442
G1 X111.012 Y166.104 E.00629
G1 X110.961 Y166.521 E.01148
G1 X110.812 Y166.913 E.01148
G1 X110.574 Y167.258 E.01148
G1 X110.26 Y167.537 E.01148
G1 X109.888 Y167.732 E.01148
G1 X109.481 Y167.832 E.01148
G1 X109.061 Y167.832 E.01148
G1 X108.654 Y167.732 E.01148
G1 X108.282 Y167.537 E.01148
G1 X107.968 Y167.258 E.01148
G1 X107.73 Y166.913 E.01148
G1 X107.581 Y166.521 E.01148
G1 X107.53 Y166.104 E.01148
G1 X107.581 Y165.688 E.01148
G1 X107.663 Y165.473 E.00629
G1 X107.73 Y165.295 E.00519
G1 X107.968 Y164.95 E.01148
G1 X108.282 Y164.672 E.01148
G1 X108.654 Y164.477 E.01148
G1 X109.061 Y164.376 E.01148
G1 X109.481 Y164.376 E.01148
G1 X109.888 Y164.477 E.01148
G1 X110.26 Y164.672 E.01148
G1 X110.574 Y164.95 E.01148
G1 X110.812 Y165.295 E.01148
G1 X110.95 Y165.658 E.01061
M204 S10000
; WIPE_START
G1 F24000
G1 X110.984 Y165.876 E-.08386
G1 X111.012 Y166.104 E-.08737
G1 X110.961 Y166.521 E-.15946
G1 X110.812 Y166.913 E-.15946
G1 X110.574 Y167.258 E-.15946
G1 X110.357 Y167.451 E-.1104
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I1.054 J-.608 P1  F30000
G1 X108.583 Y164.377 Z3.4
G1 Z3
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X108.583 Y164.377 E.00002
G3 X109.372 Y164.247 I.689 J1.721 E.02203
G1 X109.547 Y164.276 E.00485
G1 X109.769 Y164.312 E.00615
G3 X108.228 Y164.566 I-.497 J1.786 E.27453
G1 X108.53 Y164.405 E.00935
M204 S10000
; WIPE_START
G1 F24000
G1 X108.583 Y164.377 E-.02284
G1 X108.97 Y164.269 E-.15277
G1 X109.372 Y164.247 E-.1528
G1 X109.547 Y164.276 E-.06733
G1 X109.769 Y164.312 E-.08548
G1 X110.142 Y164.461 E-.1528
G1 X110.417 Y164.647 E-.12597
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.442 J1.134 P1  F30000
G1 X136.461 Y154.506 Z3.4
G1 Z3
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X136.411 Y154.917 E.01131
G1 X136.262 Y155.309 E.01148
G1 X136.024 Y155.655 E.01148
G1 X135.71 Y155.933 E.01148
G1 X135.338 Y156.128 E.01148
G1 X134.931 Y156.228 E.01148
G1 X134.511 Y156.228 E.01148
G1 X134.104 Y156.128 E.01148
G1 X133.732 Y155.933 E.01148
G1 X133.418 Y155.655 E.01148
G1 X133.179 Y155.309 E.01148
G1 X133.031 Y154.917 E.01148
G1 X132.98 Y154.5 E.01148
G1 X133.031 Y154.084 E.01148
G1 X133.179 Y153.691 E.01148
G1 X133.418 Y153.346 E.01148
G1 X133.732 Y153.068 E.01148
G1 X134.104 Y152.873 E.01148
G1 X134.511 Y152.772 E.01148
G1 X134.931 Y152.772 E.01148
G1 X135.338 Y152.873 E.01148
G1 X135.71 Y153.068 E.01148
G1 X136.024 Y153.346 E.01148
G1 X136.262 Y153.691 E.01148
G1 X136.411 Y154.084 E.01148
G1 X136.455 Y154.447 E.01
M204 S10000
; WIPE_START
G1 F24000
G1 X136.411 Y154.917 E-.17946
G1 X136.262 Y155.309 E-.15946
G1 X136.024 Y155.655 E-.15946
G1 X135.71 Y155.933 E-.15946
G1 X135.471 Y156.058 E-.10217
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I1.13 J-.451 P1  F30000
G1 X134.149 Y152.742 Z3.4
G1 Z3
G1 E.8 F1800
M204 S5000
G1 F1460
G3 X135.103 Y152.691 I.573 J1.764 E.02643
G1 X135.295 Y152.732 E.00537
G3 X135.651 Y156.111 I-.592 J1.77 E.11675
G3 X134.093 Y152.761 I-.929 J-1.605 E.16837
M204 S10000
; WIPE_START
G1 F24000
G1 X134.526 Y152.651 E-.17006
G1 X134.915 Y152.651 E-.14774
G1 X135.103 Y152.691 E-.07316
G1 X135.295 Y152.732 E-.07458
G1 X135.651 Y152.89 E-.14774
G1 X135.963 Y153.117 E-.14672
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I1.216 J.037 P1  F30000
G1 X136.589 Y132.317 Z3.4
G1 Z3
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X136.539 Y132.728 E.01131
G1 X136.39 Y133.12 E.01148
G1 X136.152 Y133.465 E.01148
G1 X135.838 Y133.744 E.01148
G1 X135.466 Y133.939 E.01148
G1 X135.059 Y134.039 E.01148
G1 X134.639 Y134.039 E.01148
G1 X134.231 Y133.939 E.01148
G1 X133.86 Y133.744 E.01148
G1 X133.546 Y133.465 E.01148
G1 X133.307 Y133.12 E.01148
G1 X133.159 Y132.728 E.01148
G1 X133.108 Y132.311 E.01148
G1 X133.159 Y131.894 E.01148
G1 X133.307 Y131.502 E.01148
G1 X133.546 Y131.157 E.01148
G1 X133.86 Y130.878 E.01148
G1 X134.231 Y130.683 E.01148
G1 X134.639 Y130.583 E.01148
G1 X135.059 Y130.583 E.01148
G1 X135.466 Y130.683 E.01148
G1 X135.838 Y130.878 E.01148
G1 X136.152 Y131.157 E.01148
G1 X136.39 Y131.502 E.01148
G1 X136.539 Y131.894 E.01148
G1 X136.583 Y132.257 E.01
M204 S10000
; WIPE_START
G1 F24000
G1 X136.539 Y132.728 E-.17946
G1 X136.39 Y133.12 E-.15946
G1 X136.152 Y133.465 E-.15946
G1 X135.838 Y133.744 E-.15946
G1 X135.599 Y133.868 E-.10217
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I1.13 J-.451 P1  F30000
G1 X134.277 Y130.552 Z3.4
G1 Z3
G1 E.8 F1800
M204 S5000
G1 F1460
G3 X135.231 Y130.502 I.573 J1.764 E.02643
G1 X135.423 Y130.542 E.00537
G3 X135.779 Y133.922 I-.592 J1.77 E.11675
G3 X134.221 Y130.572 I-.929 J-1.605 E.16837
M204 S10000
; WIPE_START
G1 F24000
G1 X134.654 Y130.462 E-.17006
G1 X135.043 Y130.462 E-.14774
G1 X135.231 Y130.502 E-.07316
G1 X135.423 Y130.542 E-.07458
G1 X135.779 Y130.7 E-.14774
G1 X136.091 Y130.927 E-.14672
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I1.216 J.052 P1  F30000
G1 X136.858 Y112.831 Z3.4
G1 Z3
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X136.808 Y113.241 E.01131
G1 X136.659 Y113.634 E.01148
G1 X136.421 Y113.979 E.01148
G1 X136.107 Y114.257 E.01148
G1 X135.735 Y114.452 E.01148
G1 X135.328 Y114.553 E.01148
G1 X134.908 Y114.553 E.01148
G1 X134.501 Y114.452 E.01148
G1 X134.129 Y114.257 E.01148
G1 X133.815 Y113.979 E.01148
G1 X133.577 Y113.634 E.01148
G1 X133.428 Y113.241 E.01148
G1 X133.377 Y112.825 E.01148
G1 X133.428 Y112.408 E.01148
G1 X133.577 Y112.016 E.01148
G1 X133.815 Y111.67 E.01148
G1 X134.129 Y111.392 E.01148
G1 X134.501 Y111.197 E.01148
G1 X134.908 Y111.097 E.01148
M73 P73 R2
G1 X135.328 Y111.097 E.01148
G1 X135.735 Y111.197 E.01148
G1 X136.107 Y111.392 E.01148
G1 X136.421 Y111.67 E.01148
G1 X136.659 Y112.016 E.01148
G1 X136.808 Y112.408 E.01148
G1 X136.852 Y112.771 E.01
M204 S10000
; WIPE_START
G1 F24000
G1 X136.808 Y113.241 E-.17946
G1 X136.659 Y113.634 E-.15946
G1 X136.421 Y113.979 E-.15946
G1 X136.107 Y114.257 E-.15946
G1 X135.869 Y114.382 E-.10217
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I1.13 J-.451 P1  F30000
G1 X134.547 Y111.066 Z3.4
G1 Z3
G1 E.8 F1800
M204 S5000
G1 F1460
G3 X135.501 Y111.015 I.573 J1.764 E.02643
G1 X135.693 Y111.056 E.00537
G3 X136.048 Y114.435 I-.592 J1.77 E.11675
G3 X134.49 Y111.086 I-.929 J-1.605 E.16837
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 3.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X134.924 Y110.975 E-.17006
G1 X135.312 Y110.975 E-.14774
G1 X135.501 Y111.015 E-.07316
G1 X135.693 Y111.056 E-.07458
G1 X136.048 Y111.214 E-.14774
G1 X136.36 Y111.441 E-.14672
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
G3 Z3.4 I.631 J-1.041 P1  F30000
G1 X107.314 Y93.836 Z3.4
G1 Z3.2
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X107.335 Y94.01 E.00479
G1 X107.362 Y94.227 E.00597
G1 X107.311 Y94.643 E.01148
G1 X107.162 Y95.036 E.01148
G1 X106.924 Y95.381 E.01148
G1 X106.61 Y95.659 E.01148
G1 X106.238 Y95.854 E.01148
G1 X105.831 Y95.955 E.01148
G1 X105.411 Y95.955 E.01148
G1 X105.004 Y95.854 E.01148
G1 X104.632 Y95.659 E.01148
G1 X104.318 Y95.381 E.01148
G1 X104.08 Y95.036 E.01148
G1 X103.931 Y94.643 E.01148
G1 X103.88 Y94.227 E.01148
G1 X103.931 Y93.81 E.01148
G1 X104.08 Y93.418 E.01148
G1 X104.318 Y93.072 E.01148
G1 X104.632 Y92.794 E.01148
G1 X105.004 Y92.599 E.01148
G1 X105.411 Y92.499 E.01148
G1 X105.831 Y92.499 E.01148
G1 X106.238 Y92.599 E.01148
G1 X106.61 Y92.794 E.01148
G1 X106.924 Y93.072 E.01148
G1 X107.162 Y93.418 E.01148
G1 X107.299 Y93.778 E.01054
M204 S10000
; WIPE_START
G1 F24000
G1 X107.335 Y94.01 E-.08907
G1 X107.362 Y94.227 E-.08301
G1 X107.311 Y94.643 E-.15946
G1 X107.162 Y95.036 E-.15946
G1 X106.924 Y95.381 E-.15946
G1 X106.708 Y95.572 E-.10955
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I1.054 J-.609 P1  F30000
G1 X104.933 Y92.5 Z3.6
G1 Z3.2
G1 E.8 F1800
M204 S5000
M73 P74 R2
G1 F1460
G3 X105.722 Y92.37 I.689 J1.721 E.02203
G1 X105.91 Y92.401 E.00522
G1 X106.118 Y92.435 E.00578
G3 X104.878 Y92.523 I-.497 J1.786 E.28391
M204 S10000
; WIPE_START
G1 F24000
G1 X105.32 Y92.392 E-.17536
G1 X105.722 Y92.37 E-.1528
G1 X105.91 Y92.401 E-.07252
G1 X106.118 Y92.435 E-.08029
G1 X106.492 Y92.584 E-.15281
G1 X106.767 Y92.77 E-.12622
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I-1.19 J.255 P1  F30000
G1 X111.823 Y116.412 Z3.6
G1 Z3.2
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X111.844 Y116.586 E.00479
G1 X111.871 Y116.803 E.00597
G1 X111.82 Y117.219 E.01148
G1 X111.671 Y117.611 E.01148
G1 X111.433 Y117.957 E.01148
G1 X111.119 Y118.235 E.01148
G1 X110.747 Y118.43 E.01148
G1 X110.34 Y118.53 E.01148
G1 X109.92 Y118.53 E.01148
G1 X109.513 Y118.43 E.01148
G1 X109.141 Y118.235 E.01148
G1 X108.827 Y117.957 E.01148
G1 X108.589 Y117.611 E.01148
G1 X108.44 Y117.219 E.01148
G1 X108.389 Y116.803 E.01148
G1 X108.44 Y116.386 E.01148
G1 X108.589 Y115.994 E.01148
G1 X108.827 Y115.648 E.01148
G1 X109.141 Y115.37 E.01148
G1 X109.513 Y115.175 E.01148
G1 X109.92 Y115.075 E.01148
G1 X110.34 Y115.075 E.01148
G1 X110.747 Y115.175 E.01148
G1 X111.119 Y115.37 E.01148
G1 X111.433 Y115.648 E.01148
G1 X111.671 Y115.994 E.01148
G1 X111.808 Y116.354 E.01054
M204 S10000
; WIPE_START
G1 F24000
G1 X111.844 Y116.586 E-.08907
G1 X111.871 Y116.803 E-.08301
G1 X111.82 Y117.219 E-.15946
G1 X111.671 Y117.611 E-.15946
G1 X111.433 Y117.957 E-.15946
G1 X111.217 Y118.148 E-.10955
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I1.054 J-.609 P1  F30000
G1 X109.442 Y115.076 Z3.6
G1 Z3.2
G1 E.8 F1800
M204 S5000
G1 F1460
G3 X110.231 Y114.946 I.689 J1.721 E.02203
G1 X110.419 Y114.976 E.00522
G1 X110.627 Y115.011 E.00578
G3 X109.387 Y115.099 I-.497 J1.786 E.28391
M204 S10000
; WIPE_START
G1 F24000
G1 X109.829 Y114.967 E-.17536
G1 X110.231 Y114.946 E-.1528
G1 X110.419 Y114.976 E-.07252
G1 X110.627 Y115.011 E-.08029
G1 X111.001 Y115.16 E-.15281
G1 X111.276 Y115.346 E-.12622
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I-1.217 J-.007 P1  F30000
G1 X111.13 Y140.066 Z3.6
G1 Z3.2
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X111.151 Y140.24 E.00479
G1 X111.178 Y140.457 E.00597
G1 X111.127 Y140.873 E.01148
G1 X110.978 Y141.266 E.01148
G1 X110.74 Y141.611 E.01148
G1 X110.426 Y141.889 E.01148
G1 X110.054 Y142.084 E.01148
G1 X109.647 Y142.185 E.01148
G1 X109.227 Y142.185 E.01148
G1 X108.82 Y142.084 E.01148
G1 X108.448 Y141.889 E.01148
G1 X108.134 Y141.611 E.01148
G1 X107.896 Y141.266 E.01148
G1 X107.747 Y140.873 E.01148
G1 X107.696 Y140.457 E.01148
G1 X107.747 Y140.04 E.01148
G1 X107.896 Y139.648 E.01148
G1 X108.134 Y139.303 E.01148
G1 X108.448 Y139.024 E.01148
G1 X108.82 Y138.829 E.01148
G1 X109.227 Y138.729 E.01148
G1 X109.647 Y138.729 E.01148
G1 X110.054 Y138.829 E.01148
G1 X110.426 Y139.024 E.01148
G1 X110.74 Y139.303 E.01148
G1 X110.978 Y139.648 E.01148
G1 X111.115 Y140.008 E.01054
M204 S10000
; WIPE_START
G1 F24000
G1 X111.151 Y140.24 E-.08907
G1 X111.178 Y140.457 E-.08301
G1 X111.127 Y140.873 E-.15946
G1 X110.978 Y141.266 E-.15946
G1 X110.74 Y141.611 E-.15946
G1 X110.524 Y141.802 E-.10955
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I1.054 J-.609 P1  F30000
G1 X108.749 Y138.73 Z3.6
G1 Z3.2
G1 E.8 F1800
M204 S5000
G1 F1460
G3 X109.538 Y138.6 I.689 J1.721 E.02203
G1 X109.726 Y138.631 E.00522
G1 X109.934 Y138.665 E.00578
G3 X108.694 Y138.753 I-.497 J1.786 E.28391
M204 S10000
; WIPE_START
G1 F24000
G1 X109.136 Y138.622 E-.17536
G1 X109.538 Y138.6 E-.1528
G1 X109.726 Y138.631 E-.07252
G1 X109.934 Y138.665 E-.08029
G1 X110.308 Y138.814 E-.15281
G1 X110.583 Y139 E-.12622
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I-1.217 J.017 P1  F30000
G1 X110.964 Y165.713 Z3.6
G1 Z3.2
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X110.985 Y165.887 E.00479
G1 X111.012 Y166.104 E.00597
G1 X110.961 Y166.521 E.01148
G1 X110.812 Y166.913 E.01148
G1 X110.574 Y167.258 E.01148
G1 X110.26 Y167.537 E.01148
G1 X109.888 Y167.732 E.01148
G1 X109.481 Y167.832 E.01148
G1 X109.061 Y167.832 E.01148
G1 X108.654 Y167.732 E.01148
G1 X108.282 Y167.537 E.01148
G1 X107.968 Y167.258 E.01148
G1 X107.73 Y166.913 E.01148
G1 X107.581 Y166.521 E.01148
G1 X107.53 Y166.104 E.01148
G1 X107.581 Y165.688 E.01148
G1 X107.73 Y165.295 E.01148
G1 X107.968 Y164.95 E.01148
G1 X108.282 Y164.672 E.01148
G1 X108.654 Y164.477 E.01148
G1 X109.061 Y164.376 E.01148
G1 X109.481 Y164.376 E.01148
G1 X109.888 Y164.477 E.01148
G1 X110.26 Y164.672 E.01148
G1 X110.574 Y164.95 E.01148
G1 X110.812 Y165.295 E.01148
G1 X110.949 Y165.656 E.01054
M204 S10000
; WIPE_START
G1 F24000
G1 X110.985 Y165.887 E-.08907
G1 X111.012 Y166.104 E-.08301
G1 X110.961 Y166.521 E-.15946
G1 X110.812 Y166.913 E-.15946
G1 X110.574 Y167.258 E-.15946
G1 X110.358 Y167.45 E-.10955
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I1.054 J-.609 P1  F30000
G1 X108.583 Y164.377 Z3.6
G1 Z3.2
G1 E.8 F1800
M204 S5000
G1 F1460
G3 X109.372 Y164.247 I.689 J1.721 E.02203
G1 X109.56 Y164.278 E.00522
G1 X109.769 Y164.312 E.00578
G3 X108.528 Y164.4 I-.497 J1.786 E.28391
M204 S10000
; WIPE_START
G1 F24000
G1 X108.97 Y164.269 E-.17536
G1 X109.372 Y164.247 E-.1528
G1 X109.56 Y164.278 E-.07252
G1 X109.769 Y164.312 E-.08029
G1 X110.142 Y164.461 E-.15281
G1 X110.417 Y164.647 E-.12622
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I.442 J1.134 P1  F30000
G1 X136.461 Y154.507 Z3.6
G1 Z3.2
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X136.411 Y154.917 E.0113
G1 X136.262 Y155.309 E.01148
G1 X136.024 Y155.655 E.01148
G1 X135.71 Y155.933 E.01148
G1 X135.338 Y156.128 E.01148
G1 X134.931 Y156.228 E.01148
G1 X134.511 Y156.228 E.01148
G1 X134.103 Y156.128 E.01148
G1 X133.732 Y155.933 E.01148
G1 X133.418 Y155.655 E.01148
G1 X133.179 Y155.309 E.01148
G1 X133.031 Y154.917 E.01148
G1 X132.98 Y154.5 E.01148
G1 X133.031 Y154.084 E.01148
G1 X133.179 Y153.691 E.01148
G1 X133.418 Y153.346 E.01148
G1 X133.732 Y153.068 E.01148
G1 X134.103 Y152.873 E.01148
G1 X134.511 Y152.772 E.01148
G1 X134.931 Y152.772 E.01148
G1 X135.338 Y152.873 E.01148
G1 X135.71 Y153.068 E.01148
G1 X136.024 Y153.346 E.01148
G1 X136.262 Y153.691 E.01148
G1 X136.411 Y154.084 E.01148
G1 X136.455 Y154.447 E.01001
M204 S10000
; WIPE_START
G1 F24000
G1 X136.411 Y154.917 E-.17932
G1 X136.262 Y155.309 E-.15946
G1 X136.024 Y155.655 E-.15946
G1 X135.71 Y155.933 E-.15946
G1 X135.471 Y156.058 E-.10231
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I1.13 J-.451 P1  F30000
G1 X134.149 Y152.742 Z3.6
G1 Z3.2
G1 E.8 F1800
M204 S5000
G1 F1460
G3 X135.089 Y152.688 I.573 J1.764 E.02602
G1 X135.295 Y152.732 E.00577
G3 X135.651 Y156.111 I-.592 J1.77 E.11675
G3 X134.093 Y152.761 I-.929 J-1.605 E.16838
M204 S10000
; WIPE_START
G1 F24000
G1 X134.526 Y152.651 E-.17007
G1 X134.915 Y152.651 E-.14774
G1 X135.089 Y152.688 E-.0675
G1 X135.295 Y152.732 E-.08024
G1 X135.651 Y152.89 E-.14774
G1 X135.963 Y153.117 E-.14672
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I1.216 J.037 P1  F30000
G1 X136.589 Y132.317 Z3.6
G1 Z3.2
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X136.539 Y132.728 E.0113
G1 X136.39 Y133.12 E.01148
G1 X136.152 Y133.465 E.01148
G1 X135.838 Y133.744 E.01148
G1 X135.466 Y133.939 E.01148
G1 X135.059 Y134.039 E.01148
G1 X134.639 Y134.039 E.01148
G1 X134.231 Y133.939 E.01148
G1 X133.86 Y133.744 E.01148
G1 X133.546 Y133.465 E.01148
G1 X133.307 Y133.12 E.01148
G1 X133.159 Y132.728 E.01148
G1 X133.108 Y132.311 E.01148
G1 X133.159 Y131.894 E.01148
G1 X133.307 Y131.502 E.01148
G1 X133.546 Y131.157 E.01148
G1 X133.86 Y130.878 E.01148
G1 X134.231 Y130.683 E.01148
G1 X134.639 Y130.583 E.01148
G1 X135.059 Y130.583 E.01148
G1 X135.466 Y130.683 E.01148
G1 X135.838 Y130.878 E.01148
G1 X136.152 Y131.157 E.01148
G1 X136.39 Y131.502 E.01148
G1 X136.539 Y131.894 E.01148
G1 X136.583 Y132.258 E.01001
M204 S10000
; WIPE_START
G1 F24000
G1 X136.539 Y132.728 E-.17932
G1 X136.39 Y133.12 E-.15946
G1 X136.152 Y133.465 E-.15946
G1 X135.838 Y133.744 E-.15946
G1 X135.599 Y133.869 E-.10231
; WIPE_END
G1 E-.04 F1800
G17
M73 P75 R2
G3 Z3.6 I1.13 J-.451 P1  F30000
G1 X134.277 Y130.552 Z3.6
G1 Z3.2
G1 E.8 F1800
M204 S5000
G1 F1460
G3 X135.217 Y130.498 I.573 J1.764 E.02602
G1 X135.423 Y130.542 E.00577
G3 X135.779 Y133.922 I-.592 J1.77 E.11675
G3 X134.221 Y130.572 I-.929 J-1.605 E.16838
M204 S10000
; WIPE_START
G1 F24000
G1 X134.654 Y130.462 E-.17007
G1 X135.043 Y130.462 E-.14774
G1 X135.217 Y130.498 E-.0675
G1 X135.423 Y130.542 E-.08024
G1 X135.779 Y130.7 E-.14774
G1 X136.091 Y130.927 E-.14672
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I1.216 J.052 P1  F30000
G1 X136.858 Y112.831 Z3.6
G1 Z3.2
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X136.808 Y113.241 E.0113
G1 X136.659 Y113.634 E.01148
G1 X136.421 Y113.979 E.01148
G1 X136.107 Y114.257 E.01148
G1 X135.735 Y114.452 E.01148
G1 X135.328 Y114.553 E.01148
G1 X134.908 Y114.553 E.01148
G1 X134.501 Y114.452 E.01148
G1 X134.129 Y114.257 E.01148
G1 X133.815 Y113.979 E.01148
G1 X133.577 Y113.634 E.01148
G1 X133.428 Y113.241 E.01148
G1 X133.377 Y112.825 E.01148
G1 X133.428 Y112.408 E.01148
G1 X133.577 Y112.016 E.01148
G1 X133.815 Y111.67 E.01148
G1 X134.129 Y111.392 E.01148
G1 X134.501 Y111.197 E.01148
G1 X134.908 Y111.097 E.01148
G1 X135.328 Y111.097 E.01148
G1 X135.735 Y111.197 E.01148
G1 X136.107 Y111.392 E.01148
G1 X136.421 Y111.67 E.01148
G1 X136.659 Y112.016 E.01148
G1 X136.808 Y112.408 E.01148
G1 X136.852 Y112.771 E.01001
M204 S10000
; WIPE_START
G1 F24000
G1 X136.808 Y113.241 E-.17932
G1 X136.659 Y113.634 E-.15946
G1 X136.421 Y113.979 E-.15946
G1 X136.107 Y114.257 E-.15946
G1 X135.868 Y114.382 E-.10231
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I1.13 J-.451 P1  F30000
G1 X134.547 Y111.066 Z3.6
G1 Z3.2
G1 E.8 F1800
M204 S5000
G1 F1460
G3 X135.486 Y111.012 I.573 J1.764 E.02602
G1 X135.693 Y111.056 E.00577
G3 X136.048 Y114.435 I-.592 J1.77 E.11675
G3 X134.49 Y111.085 I-.929 J-1.605 E.16838
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 3.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X134.924 Y110.975 E-.17007
G1 X135.312 Y110.975 E-.14774
G1 X135.486 Y111.012 E-.0675
G1 X135.693 Y111.056 E-.08024
G1 X136.048 Y111.214 E-.14774
G1 X136.36 Y111.441 E-.14672
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
G3 Z3.6 I.631 J-1.041 P1  F30000
G1 X107.314 Y93.834 Z3.6
G1 Z3.4
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X107.337 Y94.021 E.00517
G1 X107.362 Y94.227 E.00566
G1 X107.311 Y94.643 E.01148
G1 X107.162 Y95.036 E.01148
G1 X106.924 Y95.381 E.01148
G1 X106.61 Y95.659 E.01148
G1 X106.238 Y95.854 E.01148
G1 X105.831 Y95.955 E.01148
G1 X105.411 Y95.955 E.01148
G1 X105.004 Y95.854 E.01148
G1 X104.632 Y95.659 E.01148
G1 X104.477 Y95.522 E.00566
G1 X104.318 Y95.381 E.00582
G1 X104.08 Y95.036 E.01148
G1 X103.931 Y94.643 E.01148
G1 X103.88 Y94.227 E.01148
G1 X103.931 Y93.81 E.01148
G1 X104.08 Y93.418 E.01148
G1 X104.318 Y93.072 E.01148
G1 X104.632 Y92.794 E.01148
G1 X105.004 Y92.599 E.01148
G1 X105.411 Y92.499 E.01148
G1 X105.831 Y92.499 E.01148
G1 X106.238 Y92.599 E.01148
G1 X106.61 Y92.794 E.01148
G1 X106.924 Y93.072 E.01148
G1 X107.162 Y93.418 E.01148
G1 X107.298 Y93.776 E.01048
M204 S10000
; WIPE_START
G1 F24000
G1 X107.337 Y94.021 E-.09429
G1 X107.362 Y94.227 E-.07864
G1 X107.311 Y94.643 E-.15946
G1 X107.162 Y95.036 E-.15946
G1 X106.924 Y95.381 E-.15946
G1 X106.71 Y95.571 E-.1087
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I1.053 J-.61 P1  F30000
G1 X104.937 Y92.509 Z3.8
G1 Z3.4
G1 E.8 F1800
M204 S5000
G1 F1460
G3 X105.923 Y92.403 I.685 J1.723 E.02747
G1 X106.118 Y92.435 E.00541
G3 X106.656 Y95.759 I-.495 J1.785 E.11553
G1 X106.492 Y95.87 E.00541
G3 X104.881 Y92.532 I-.87 J-1.637 E.16324
M204 S10000
; WIPE_START
G1 F24000
G1 X105.32 Y92.392 E-.17509
G1 X105.722 Y92.37 E-.1528
G1 X105.923 Y92.403 E-.0777
G1 X106.118 Y92.435 E-.07511
G1 X106.492 Y92.584 E-.1528
G1 X106.768 Y92.77 E-.12649
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I-1.19 J.254 P1  F30000
G1 X111.823 Y116.409 Z3.8
G1 Z3.4
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X111.846 Y116.597 E.00517
G1 X111.871 Y116.803 E.00566
G1 X111.82 Y117.219 E.01148
G1 X111.671 Y117.611 E.01148
G1 X111.433 Y117.957 E.01148
G1 X111.119 Y118.235 E.01148
G1 X110.747 Y118.43 E.01148
G1 X110.34 Y118.53 E.01148
G1 X109.92 Y118.53 E.01148
G1 X109.513 Y118.43 E.01148
G1 X109.141 Y118.235 E.01148
G1 X108.986 Y118.098 E.00566
G1 X108.827 Y117.957 E.00582
G1 X108.589 Y117.611 E.01148
G1 X108.44 Y117.219 E.01148
G1 X108.389 Y116.803 E.01148
G1 X108.44 Y116.386 E.01148
G1 X108.589 Y115.994 E.01148
G1 X108.827 Y115.648 E.01148
G1 X109.141 Y115.37 E.01148
G1 X109.513 Y115.175 E.01148
G1 X109.92 Y115.075 E.01148
G1 X110.34 Y115.075 E.01148
G1 X110.747 Y115.175 E.01148
G1 X111.119 Y115.37 E.01148
G1 X111.433 Y115.648 E.01148
G1 X111.671 Y115.994 E.01148
G1 X111.807 Y116.352 E.01048
M204 S10000
; WIPE_START
G1 F24000
G1 X111.846 Y116.597 E-.09429
G1 X111.871 Y116.803 E-.07864
G1 X111.82 Y117.219 E-.15946
G1 X111.671 Y117.611 E-.15946
G1 X111.433 Y117.957 E-.15946
G1 X111.219 Y118.146 E-.1087
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I1.053 J-.61 P1  F30000
G1 X109.446 Y115.085 Z3.8
G1 Z3.4
G1 E.8 F1800
M204 S5000
G1 F1460
G3 X110.432 Y114.979 I.685 J1.723 E.02747
G1 X110.627 Y115.011 E.00541
G3 X111.165 Y118.335 I-.495 J1.785 E.11553
G1 X111.001 Y118.446 E.00541
G3 X109.39 Y115.108 I-.87 J-1.637 E.16324
M204 S10000
; WIPE_START
G1 F24000
G1 X109.829 Y114.967 E-.17509
G1 X110.231 Y114.946 E-.1528
G1 X110.432 Y114.979 E-.0777
G1 X110.627 Y115.011 E-.07511
G1 X111.001 Y115.16 E-.1528
G1 X111.276 Y115.346 E-.12649
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I-1.217 J-.007 P1  F30000
G1 X111.13 Y140.064 Z3.8
G1 Z3.4
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X111.153 Y140.251 E.00517
G1 X111.178 Y140.457 E.00566
G1 X111.127 Y140.873 E.01148
G1 X110.978 Y141.266 E.01148
G1 X110.74 Y141.611 E.01148
G1 X110.426 Y141.889 E.01148
G1 X110.054 Y142.084 E.01148
G1 X109.647 Y142.185 E.01148
G1 X109.227 Y142.185 E.01148
G1 X108.82 Y142.084 E.01148
G1 X108.448 Y141.889 E.01148
G1 X108.293 Y141.752 E.00566
G1 X108.134 Y141.611 E.00582
G1 X107.896 Y141.266 E.01148
G1 X107.747 Y140.873 E.01148
G1 X107.696 Y140.457 E.01148
G1 X107.747 Y140.04 E.01148
G1 X107.896 Y139.648 E.01148
G1 X108.134 Y139.303 E.01148
G1 X108.448 Y139.024 E.01148
G1 X108.82 Y138.829 E.01148
G1 X109.227 Y138.729 E.01148
G1 X109.647 Y138.729 E.01148
G1 X110.054 Y138.829 E.01148
G1 X110.426 Y139.024 E.01148
G1 X110.74 Y139.303 E.01148
G1 X110.978 Y139.648 E.01148
G1 X111.114 Y140.006 E.01048
M204 S10000
; WIPE_START
G1 F24000
G1 X111.153 Y140.251 E-.09429
G1 X111.178 Y140.457 E-.07864
G1 X111.127 Y140.873 E-.15946
G1 X110.978 Y141.266 E-.15946
G1 X110.74 Y141.611 E-.15946
G1 X110.526 Y141.801 E-.1087
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I1.053 J-.61 P1  F30000
G1 X108.753 Y138.74 Z3.8
G1 Z3.4
G1 E.8 F1800
M204 S5000
G1 F1460
G3 X109.739 Y138.633 I.685 J1.723 E.02747
G1 X109.934 Y138.665 E.00541
G3 X110.472 Y141.989 I-.495 J1.785 E.11553
G1 X110.308 Y142.1 E.00541
G3 X108.697 Y138.763 I-.87 J-1.637 E.16324
M204 S10000
; WIPE_START
G1 F24000
G1 X109.136 Y138.622 E-.17509
G1 X109.538 Y138.6 E-.1528
G1 X109.739 Y138.633 E-.0777
G1 X109.934 Y138.665 E-.07511
G1 X110.308 Y138.814 E-.1528
G1 X110.583 Y139.001 E-.12649
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I-1.217 J.017 P1  F30000
G1 X110.964 Y165.711 Z3.8
G1 Z3.4
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X110.987 Y165.899 E.00517
G1 X111.012 Y166.104 E.00566
G1 X110.961 Y166.521 E.01148
G1 X110.812 Y166.913 E.01148
G1 X110.574 Y167.258 E.01148
G1 X110.26 Y167.537 E.01148
G1 X109.888 Y167.732 E.01148
G1 X109.481 Y167.832 E.01148
G1 X109.061 Y167.832 E.01148
G1 X108.654 Y167.732 E.01148
G1 X108.282 Y167.537 E.01148
G1 X108.127 Y167.399 E.00566
G1 X107.968 Y167.258 E.00582
M73 P76 R2
G1 X107.73 Y166.913 E.01148
G1 X107.581 Y166.521 E.01148
G1 X107.53 Y166.104 E.01148
G1 X107.581 Y165.688 E.01148
G1 X107.73 Y165.295 E.01148
G1 X107.968 Y164.95 E.01148
G1 X108.282 Y164.672 E.01148
G1 X108.654 Y164.477 E.01148
G1 X109.061 Y164.376 E.01148
G1 X109.481 Y164.376 E.01148
G1 X109.888 Y164.477 E.01148
G1 X110.26 Y164.672 E.01148
G1 X110.574 Y164.95 E.01148
G1 X110.812 Y165.295 E.01148
G1 X110.948 Y165.654 E.01048
M204 S10000
; WIPE_START
G1 F24000
G1 X110.987 Y165.899 E-.09429
G1 X111.012 Y166.104 E-.07864
G1 X110.961 Y166.521 E-.15946
G1 X110.812 Y166.913 E-.15946
G1 X110.574 Y167.258 E-.15946
G1 X110.36 Y167.448 E-.1087
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I1.053 J-.61 P1  F30000
G1 X108.587 Y164.387 Z3.8
G1 Z3.4
G1 E.8 F1800
M204 S5000
G1 F1460
G3 X109.574 Y164.28 I.685 J1.723 E.02747
G1 X109.769 Y164.312 E.00541
G3 X110.306 Y167.636 I-.495 J1.785 E.11553
G1 X110.142 Y167.747 E.00541
G3 X108.532 Y164.41 I-.87 J-1.637 E.16324
M204 S10000
; WIPE_START
G1 F24000
G1 X108.97 Y164.269 E-.17509
G1 X109.372 Y164.247 E-.1528
G1 X109.574 Y164.28 E-.0777
G1 X109.769 Y164.312 E-.07511
G1 X110.142 Y164.461 E-.1528
G1 X110.418 Y164.648 E-.12649
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I.442 J1.134 P1  F30000
G1 X136.461 Y154.507 Z3.8
G1 Z3.4
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X136.411 Y154.917 E.01129
G1 X136.262 Y155.309 E.01148
G1 X136.024 Y155.655 E.01148
G1 X135.71 Y155.933 E.01148
G1 X135.338 Y156.128 E.01148
G1 X134.931 Y156.228 E.01148
G1 X134.511 Y156.228 E.01148
G1 X134.103 Y156.128 E.01148
G1 X133.732 Y155.933 E.01148
G1 X133.418 Y155.655 E.01148
G1 X133.179 Y155.309 E.01148
G1 X133.031 Y154.917 E.01148
G1 X132.98 Y154.5 E.01148
G1 X133.031 Y154.084 E.01148
G1 X133.179 Y153.691 E.01148
G1 X133.418 Y153.346 E.01148
G1 X133.732 Y153.068 E.01148
G1 X134.103 Y152.873 E.01148
G1 X134.511 Y152.772 E.01148
G1 X134.931 Y152.772 E.01148
G1 X135.338 Y152.873 E.01148
G1 X135.71 Y153.068 E.01148
G1 X136.024 Y153.346 E.01148
G1 X136.262 Y153.691 E.01148
G1 X136.411 Y154.084 E.01148
G1 X136.455 Y154.447 E.01002
M204 S10000
; WIPE_START
G1 F24000
G1 X136.411 Y154.917 E-.17918
G1 X136.262 Y155.309 E-.15946
G1 X136.024 Y155.655 E-.15946
G1 X135.71 Y155.933 E-.15946
G1 X135.471 Y156.058 E-.10245
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I1.131 J-.45 P1  F30000
G1 X134.149 Y152.741 Z3.8
G1 Z3.4
G1 E.8 F1800
M204 S5000
G1 F1460
G3 X135.074 Y152.685 I.573 J1.764 E.02562
G1 X135.295 Y152.732 E.00618
G3 X135.651 Y156.111 I-.592 J1.77 E.11675
G3 X134.093 Y152.761 I-.929 J-1.605 E.16838
M204 S10000
; WIPE_START
G1 F24000
G1 X134.526 Y152.651 E-.17007
G1 X134.915 Y152.651 E-.14774
G1 X135.074 Y152.685 E-.06183
G1 X135.295 Y152.732 E-.0859
G1 X135.651 Y152.89 E-.14774
G1 X135.963 Y153.117 E-.14672
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I1.216 J.037 P1  F30000
G1 X136.589 Y132.318 Z3.8
G1 Z3.4
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X136.539 Y132.728 E.01129
G1 X136.39 Y133.12 E.01148
G1 X136.152 Y133.465 E.01148
G1 X135.838 Y133.744 E.01148
G1 X135.466 Y133.939 E.01148
G1 X135.059 Y134.039 E.01148
G1 X134.639 Y134.039 E.01148
G1 X134.231 Y133.939 E.01148
G1 X133.86 Y133.744 E.01148
G1 X133.546 Y133.465 E.01148
G1 X133.307 Y133.12 E.01148
G1 X133.159 Y132.728 E.01148
G1 X133.108 Y132.311 E.01148
G1 X133.159 Y131.894 E.01148
G1 X133.307 Y131.502 E.01148
G1 X133.546 Y131.157 E.01148
G1 X133.86 Y130.878 E.01148
G1 X134.231 Y130.683 E.01148
G1 X134.639 Y130.583 E.01148
G1 X135.059 Y130.583 E.01148
G1 X135.466 Y130.683 E.01148
G1 X135.838 Y130.878 E.01148
G1 X136.152 Y131.157 E.01148
G1 X136.39 Y131.502 E.01148
G1 X136.539 Y131.894 E.01148
G1 X136.583 Y132.258 E.01002
M204 S10000
; WIPE_START
G1 F24000
G1 X136.539 Y132.728 E-.17918
G1 X136.39 Y133.12 E-.15946
G1 X136.152 Y133.465 E-.15946
G1 X135.838 Y133.744 E-.15946
G1 X135.599 Y133.869 E-.10245
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I1.131 J-.45 P1  F30000
G1 X134.277 Y130.552 Z3.8
G1 Z3.4
G1 E.8 F1800
M204 S5000
G1 F1460
G3 X135.202 Y130.495 I.573 J1.764 E.02562
G1 X135.423 Y130.542 E.00618
G3 X135.779 Y133.922 I-.592 J1.77 E.11675
G3 X134.221 Y130.572 I-.929 J-1.605 E.16838
M204 S10000
; WIPE_START
G1 F24000
G1 X134.654 Y130.462 E-.17007
G1 X135.043 Y130.462 E-.14774
G1 X135.202 Y130.495 E-.06183
G1 X135.423 Y130.542 E-.0859
G1 X135.779 Y130.7 E-.14774
G1 X136.091 Y130.927 E-.14672
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I1.216 J.052 P1  F30000
G1 X136.858 Y112.831 Z3.8
G1 Z3.4
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X136.808 Y113.241 E.01129
G1 X136.659 Y113.634 E.01148
G1 X136.421 Y113.979 E.01148
G1 X136.107 Y114.257 E.01148
G1 X135.735 Y114.452 E.01148
G1 X135.328 Y114.553 E.01148
G1 X134.908 Y114.553 E.01148
G1 X134.501 Y114.452 E.01148
G1 X134.129 Y114.257 E.01148
G1 X133.815 Y113.979 E.01148
G1 X133.577 Y113.634 E.01148
G1 X133.428 Y113.241 E.01148
G1 X133.377 Y112.825 E.01148
G1 X133.428 Y112.408 E.01148
G1 X133.577 Y112.016 E.01148
G1 X133.815 Y111.67 E.01148
G1 X134.129 Y111.392 E.01148
G1 X134.501 Y111.197 E.01148
G1 X134.908 Y111.097 E.01148
G1 X135.328 Y111.097 E.01148
G1 X135.735 Y111.197 E.01148
G1 X136.107 Y111.392 E.01148
G1 X136.421 Y111.67 E.01148
G1 X136.659 Y112.016 E.01148
G1 X136.808 Y112.408 E.01148
G1 X136.852 Y112.772 E.01002
M204 S10000
; WIPE_START
G1 F24000
G1 X136.808 Y113.241 E-.17918
G1 X136.659 Y113.634 E-.15946
G1 X136.421 Y113.979 E-.15946
G1 X136.107 Y114.257 E-.15946
G1 X135.868 Y114.383 E-.10245
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I1.131 J-.45 P1  F30000
G1 X134.547 Y111.066 Z3.8
G1 Z3.4
G1 E.8 F1800
M204 S5000
G1 F1460
G3 X135.472 Y111.009 I.573 J1.764 E.02562
G1 X135.693 Y111.056 E.00618
G3 X136.048 Y114.435 I-.592 J1.77 E.11675
G3 X134.49 Y111.085 I-.929 J-1.605 E.16838
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 3.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X134.924 Y110.975 E-.17007
G1 X135.312 Y110.975 E-.14774
G1 X135.472 Y111.009 E-.06183
G1 X135.693 Y111.056 E-.0859
G1 X136.048 Y111.214 E-.14774
G1 X136.36 Y111.441 E-.14672
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
G3 Z3.8 I.631 J-1.041 P1  F30000
G1 X107.314 Y93.831 Z3.8
G1 Z3.6
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X107.338 Y94.033 E.00555
G1 X107.362 Y94.227 E.00534
G1 X107.311 Y94.643 E.01148
G1 X107.162 Y95.036 E.01148
G1 X106.924 Y95.381 E.01148
G1 X106.61 Y95.659 E.01148
G1 X106.238 Y95.854 E.01148
G1 X105.831 Y95.955 E.01148
G1 X105.411 Y95.955 E.01148
G1 X105.004 Y95.854 E.01148
G1 X104.632 Y95.659 E.01148
G1 X104.318 Y95.381 E.01148
G1 X104.08 Y95.036 E.01148
G1 X103.931 Y94.643 E.01148
G1 X103.88 Y94.227 E.01148
G1 X103.931 Y93.81 E.01148
G1 X104.08 Y93.418 E.01148
G1 X104.318 Y93.072 E.01148
G1 X104.632 Y92.794 E.01148
G1 X105.004 Y92.599 E.01148
G1 X105.411 Y92.499 E.01148
G1 X105.831 Y92.499 E.01148
G1 X106.238 Y92.599 E.01148
G1 X106.61 Y92.794 E.01148
G1 X106.924 Y93.072 E.01148
G1 X107.162 Y93.418 E.01148
G1 X107.297 Y93.774 E.01042
M204 S10000
; WIPE_START
G1 F24000
G1 X107.338 Y94.033 E-.09951
G1 X107.362 Y94.227 E-.07427
G1 X107.311 Y94.643 E-.15946
G1 X107.162 Y95.036 E-.15946
G1 X106.924 Y95.381 E-.15946
G1 X106.711 Y95.569 E-.10785
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I1.053 J-.61 P1  F30000
G1 X104.933 Y92.5 Z4
G1 Z3.6
G1 E.8 F1800
M204 S5000
G1 F1460
G3 X105.722 Y92.37 I.689 J1.721 E.02203
G1 X105.937 Y92.405 E.00596
G1 X106.118 Y92.435 E.00503
G3 X104.878 Y92.523 I-.497 J1.786 E.28391
M204 S10000
; WIPE_START
G1 F24000
G1 X105.32 Y92.392 E-.17537
G1 X105.722 Y92.37 E-.1528
G1 X105.937 Y92.405 E-.08288
G1 X106.118 Y92.435 E-.06993
G1 X106.492 Y92.584 E-.1528
M73 P77 R2
G1 X106.767 Y92.77 E-.12622
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I-1.19 J.255 P1  F30000
G1 X111.823 Y116.407 Z4
G1 Z3.6
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X111.847 Y116.609 E.00555
G1 X111.871 Y116.803 E.00534
G1 X111.82 Y117.219 E.01148
G1 X111.671 Y117.611 E.01148
G1 X111.433 Y117.957 E.01148
G1 X111.119 Y118.235 E.01148
G1 X110.747 Y118.43 E.01148
G1 X110.34 Y118.53 E.01148
G1 X109.92 Y118.53 E.01148
G1 X109.513 Y118.43 E.01148
G1 X109.141 Y118.235 E.01148
G1 X108.827 Y117.957 E.01148
G1 X108.589 Y117.611 E.01148
G1 X108.44 Y117.219 E.01148
G1 X108.389 Y116.803 E.01148
G1 X108.44 Y116.386 E.01148
G1 X108.589 Y115.994 E.01148
G1 X108.827 Y115.648 E.01148
G1 X109.141 Y115.37 E.01148
G1 X109.513 Y115.175 E.01148
G1 X109.92 Y115.075 E.01148
G1 X110.34 Y115.075 E.01148
G1 X110.747 Y115.175 E.01148
G1 X111.119 Y115.37 E.01148
G1 X111.433 Y115.648 E.01148
G1 X111.671 Y115.994 E.01148
G1 X111.806 Y116.35 E.01042
M204 S10000
; WIPE_START
G1 F24000
G1 X111.847 Y116.609 E-.09951
G1 X111.871 Y116.803 E-.07427
G1 X111.82 Y117.219 E-.15946
G1 X111.671 Y117.611 E-.15946
G1 X111.433 Y117.957 E-.15946
G1 X111.22 Y118.145 E-.10785
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I1.053 J-.61 P1  F30000
G1 X109.442 Y115.076 Z4
G1 Z3.6
G1 E.8 F1800
M204 S5000
G1 F1460
G3 X110.231 Y114.946 I.689 J1.721 E.02203
G1 X110.446 Y114.981 E.00596
G1 X110.627 Y115.011 E.00503
G3 X109.387 Y115.099 I-.497 J1.786 E.28391
M204 S10000
; WIPE_START
G1 F24000
G1 X109.829 Y114.967 E-.17537
G1 X110.231 Y114.946 E-.1528
G1 X110.446 Y114.981 E-.08288
G1 X110.627 Y115.011 E-.06993
G1 X111.001 Y115.16 E-.1528
G1 X111.276 Y115.346 E-.12622
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I-1.217 J-.007 P1  F30000
G1 X111.13 Y140.062 Z4
G1 Z3.6
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X111.154 Y140.263 E.00555
G1 X111.178 Y140.457 E.00534
G1 X111.127 Y140.873 E.01148
G1 X110.978 Y141.266 E.01148
G1 X110.74 Y141.611 E.01148
G1 X110.426 Y141.889 E.01148
G1 X110.054 Y142.084 E.01148
G1 X109.647 Y142.185 E.01148
G1 X109.227 Y142.185 E.01148
G1 X108.82 Y142.084 E.01148
G1 X108.448 Y141.889 E.01148
G1 X108.134 Y141.611 E.01148
G1 X107.896 Y141.266 E.01148
G1 X107.747 Y140.873 E.01148
G1 X107.696 Y140.457 E.01148
G1 X107.747 Y140.04 E.01148
G1 X107.896 Y139.648 E.01148
G1 X108.134 Y139.303 E.01148
G1 X108.448 Y139.024 E.01148
G1 X108.82 Y138.829 E.01148
G1 X109.227 Y138.729 E.01148
G1 X109.647 Y138.729 E.01148
G1 X110.054 Y138.829 E.01148
G1 X110.426 Y139.024 E.01148
G1 X110.74 Y139.303 E.01148
G1 X110.978 Y139.648 E.01148
G1 X111.113 Y140.004 E.01042
M204 S10000
; WIPE_START
G1 F24000
G1 X111.154 Y140.263 E-.09951
G1 X111.178 Y140.457 E-.07427
G1 X111.127 Y140.873 E-.15946
G1 X110.978 Y141.266 E-.15946
G1 X110.74 Y141.611 E-.15946
G1 X110.527 Y141.799 E-.10785
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I1.053 J-.61 P1  F30000
G1 X108.749 Y138.73 Z4
G1 Z3.6
G1 E.8 F1800
M204 S5000
G1 F1460
G3 X109.538 Y138.6 I.689 J1.721 E.02203
G1 X109.753 Y138.635 E.00596
G1 X109.934 Y138.665 E.00503
G3 X108.694 Y138.753 I-.497 J1.786 E.28391
M204 S10000
; WIPE_START
G1 F24000
G1 X109.136 Y138.622 E-.17537
G1 X109.538 Y138.6 E-.1528
G1 X109.753 Y138.635 E-.08288
G1 X109.934 Y138.665 E-.06993
G1 X110.308 Y138.814 E-.1528
G1 X110.583 Y139 E-.12622
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I-1.217 J.017 P1  F30000
G1 X110.964 Y165.709 Z4
G1 Z3.6
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X110.988 Y165.91 E.00555
G1 X111.012 Y166.104 E.00534
G1 X110.961 Y166.521 E.01148
G1 X110.812 Y166.913 E.01148
G1 X110.574 Y167.258 E.01148
G1 X110.26 Y167.537 E.01148
G1 X109.888 Y167.732 E.01148
G1 X109.481 Y167.832 E.01148
G1 X109.061 Y167.832 E.01148
G1 X108.654 Y167.732 E.01148
G1 X108.282 Y167.537 E.01148
G1 X107.968 Y167.258 E.01148
G1 X107.73 Y166.913 E.01148
G1 X107.581 Y166.521 E.01148
G1 X107.53 Y166.104 E.01148
G1 X107.581 Y165.688 E.01148
G1 X107.73 Y165.295 E.01148
G1 X107.968 Y164.95 E.01148
G1 X108.282 Y164.672 E.01148
G1 X108.654 Y164.477 E.01148
G1 X109.061 Y164.376 E.01148
G1 X109.481 Y164.376 E.01148
G1 X109.888 Y164.477 E.01148
G1 X110.26 Y164.672 E.01148
G1 X110.574 Y164.95 E.01148
G1 X110.812 Y165.295 E.01148
G1 X110.947 Y165.651 E.01042
M204 S10000
; WIPE_START
G1 F24000
G1 X110.988 Y165.91 E-.09951
G1 X111.012 Y166.104 E-.07427
G1 X110.961 Y166.521 E-.15946
G1 X110.812 Y166.913 E-.15946
G1 X110.574 Y167.258 E-.15946
G1 X110.362 Y167.447 E-.10785
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I1.053 J-.61 P1  F30000
G1 X108.583 Y164.377 Z4
G1 Z3.6
G1 E.8 F1800
M204 S5000
G1 F1460
G3 X109.372 Y164.247 I.689 J1.721 E.02203
G1 X109.587 Y164.282 E.00596
G1 X109.769 Y164.312 E.00503
G3 X108.528 Y164.4 I-.497 J1.786 E.28391
M204 S10000
; WIPE_START
G1 F24000
G1 X108.97 Y164.269 E-.17537
G1 X109.372 Y164.247 E-.1528
G1 X109.587 Y164.282 E-.08288
G1 X109.769 Y164.312 E-.06993
G1 X110.142 Y164.461 E-.1528
G1 X110.417 Y164.647 E-.12622
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I.441 J1.134 P1  F30000
G1 X136.46 Y154.514 Z4
G1 Z3.6
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X136.441 Y154.668 E.00426
G1 X136.411 Y154.917 E.00685
G1 X136.262 Y155.309 E.01148
G1 X136.024 Y155.655 E.01148
G1 X135.71 Y155.933 E.01148
G1 X135.338 Y156.128 E.01148
G1 X134.931 Y156.228 E.01148
G1 X134.511 Y156.228 E.01148
G1 X134.103 Y156.128 E.01148
G1 X133.732 Y155.933 E.01148
G1 X133.418 Y155.655 E.01148
G1 X133.179 Y155.309 E.01148
G1 X133.031 Y154.917 E.01148
G1 X132.98 Y154.5 E.01148
G1 X133 Y154.332 E.00463
G1 X133.031 Y154.084 E.00685
G1 X133.179 Y153.691 E.01148
G1 X133.418 Y153.346 E.01148
G1 X133.732 Y153.068 E.01148
G1 X134.103 Y152.873 E.01148
G1 X134.511 Y152.772 E.01148
G1 X134.931 Y152.772 E.01148
G1 X135.338 Y152.873 E.01148
G1 X135.71 Y153.068 E.01148
G1 X136.024 Y153.346 E.01148
G1 X136.262 Y153.691 E.01148
G1 X136.411 Y154.084 E.01148
G1 X136.456 Y154.454 E.0102
M204 S10000
; WIPE_START
G1 F24000
G1 X136.441 Y154.668 E-.08158
G1 X136.411 Y154.917 E-.09516
G1 X136.262 Y155.309 E-.15946
G1 X136.024 Y155.655 E-.15946
G1 X135.71 Y155.933 E-.15946
G1 X135.465 Y156.061 E-.10488
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I1.131 J-.448 P1  F30000
G1 X134.149 Y152.741 Z4
G1 Z3.6
G1 E.8 F1800
M204 S5000
G1 F1460
G3 X135.06 Y152.681 I.573 J1.764 E.02521
G1 X135.295 Y152.732 E.00659
G3 X135.651 Y156.111 I-.592 J1.77 E.11675
G3 X134.092 Y152.76 I-.929 J-1.606 E.1684
M204 S10000
; WIPE_START
G1 F24000
G1 X134.526 Y152.651 E-.17008
G1 X134.915 Y152.651 E-.14774
G1 X135.06 Y152.681 E-.05617
G1 X135.295 Y152.732 E-.09157
G1 X135.651 Y152.89 E-.14774
G1 X135.963 Y153.117 E-.14671
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I1.216 J.037 P1  F30000
G1 X136.588 Y132.324 Z4
G1 Z3.6
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X136.569 Y132.479 E.00426
G1 X136.539 Y132.728 E.00685
G1 X136.39 Y133.12 E.01148
G1 X136.152 Y133.465 E.01148
G1 X135.838 Y133.744 E.01148
G1 X135.466 Y133.939 E.01148
G1 X135.059 Y134.039 E.01148
G1 X134.639 Y134.039 E.01148
G1 X134.231 Y133.939 E.01148
G1 X133.86 Y133.744 E.01148
G1 X133.546 Y133.465 E.01148
G1 X133.307 Y133.12 E.01148
G1 X133.159 Y132.728 E.01148
G1 X133.108 Y132.311 E.01148
G1 X133.128 Y132.143 E.00463
G1 X133.159 Y131.894 E.00685
G1 X133.307 Y131.502 E.01148
G1 X133.546 Y131.157 E.01148
G1 X133.86 Y130.878 E.01148
G1 X134.231 Y130.683 E.01148
G1 X134.639 Y130.583 E.01148
G1 X135.059 Y130.583 E.01148
G1 X135.466 Y130.683 E.01148
G1 X135.838 Y130.878 E.01148
G1 X136.152 Y131.157 E.01148
G1 X136.39 Y131.502 E.01148
G1 X136.539 Y131.894 E.01148
G1 X136.584 Y132.265 E.0102
M204 S10000
; WIPE_START
G1 F24000
G1 X136.569 Y132.479 E-.08158
G1 X136.539 Y132.728 E-.09516
G1 X136.39 Y133.12 E-.15946
G1 X136.152 Y133.465 E-.15946
G1 X135.838 Y133.744 E-.15946
G1 X135.593 Y133.872 E-.10488
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I1.131 J-.448 P1  F30000
G1 X134.277 Y130.552 Z4
G1 Z3.6
M73 P78 R2
G1 E.8 F1800
M204 S5000
G1 F1460
G3 X135.188 Y130.492 I.573 J1.764 E.02521
G1 X135.423 Y130.542 E.00659
G3 X135.779 Y133.922 I-.592 J1.77 E.11675
G3 X134.22 Y130.571 I-.929 J-1.606 E.1684
M204 S10000
; WIPE_START
G1 F24000
G1 X134.654 Y130.462 E-.17008
G1 X135.043 Y130.462 E-.14774
G1 X135.188 Y130.492 E-.05617
G1 X135.423 Y130.542 E-.09157
G1 X135.779 Y130.7 E-.14774
G1 X136.091 Y130.927 E-.14671
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I1.216 J.051 P1  F30000
G1 X136.857 Y112.838 Z4
G1 Z3.6
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X136.838 Y112.993 E.00426
G1 X136.808 Y113.241 E.00685
G1 X136.659 Y113.634 E.01148
G1 X136.421 Y113.979 E.01148
G1 X136.107 Y114.257 E.01148
G1 X135.735 Y114.452 E.01148
G1 X135.328 Y114.553 E.01148
G1 X134.908 Y114.553 E.01148
G1 X134.501 Y114.452 E.01148
G1 X134.129 Y114.257 E.01148
G1 X133.815 Y113.979 E.01148
G1 X133.577 Y113.634 E.01148
G1 X133.428 Y113.241 E.01148
G1 X133.377 Y112.825 E.01148
G1 X133.398 Y112.657 E.00463
G1 X133.428 Y112.408 E.00685
G1 X133.577 Y112.016 E.01148
G1 X133.815 Y111.67 E.01148
G1 X134.129 Y111.392 E.01148
G1 X134.501 Y111.197 E.01148
G1 X134.908 Y111.097 E.01148
G1 X135.328 Y111.097 E.01148
G1 X135.735 Y111.197 E.01148
G1 X136.107 Y111.392 E.01148
G1 X136.421 Y111.67 E.01148
G1 X136.659 Y112.016 E.01148
G1 X136.808 Y112.408 E.01148
G1 X136.853 Y112.778 E.0102
M204 S10000
; WIPE_START
G1 F24000
G1 X136.838 Y112.993 E-.08158
G1 X136.808 Y113.241 E-.09516
G1 X136.659 Y113.634 E-.15946
G1 X136.421 Y113.979 E-.15946
G1 X136.107 Y114.257 E-.15946
G1 X135.862 Y114.385 E-.10488
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I1.131 J-.448 P1  F30000
G1 X134.546 Y111.065 Z4
G1 Z3.6
G1 E.8 F1800
M204 S5000
G1 F1460
G3 X135.457 Y111.006 I.573 J1.764 E.02521
G1 X135.693 Y111.056 E.00659
G3 X136.048 Y114.435 I-.592 J1.77 E.11675
G3 X134.49 Y111.085 I-.929 J-1.606 E.1684
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 3.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X134.924 Y110.975 E-.17008
G1 X135.312 Y110.975 E-.14774
G1 X135.457 Y111.006 E-.05617
G1 X135.693 Y111.056 E-.09157
G1 X136.048 Y111.214 E-.14774
G1 X136.36 Y111.441 E-.14671
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
G3 Z4 I.631 J-1.041 P1  F30000
G1 X107.313 Y93.829 Z4
G1 Z3.8
G1 E.8 F1800
M204 S5000
G1 F1461
G1 X107.362 Y94.227 E.01095
G1 X107.311 Y94.643 E.01148
G1 X107.162 Y95.036 E.01148
G1 X106.924 Y95.381 E.01148
G1 X106.61 Y95.659 E.01148
G1 X106.238 Y95.854 E.01148
G1 X105.831 Y95.955 E.01148
G1 X105.411 Y95.955 E.01148
G1 X105.004 Y95.854 E.01148
G1 X104.632 Y95.659 E.01148
G1 X104.318 Y95.381 E.01148
G1 X104.08 Y95.036 E.01148
G1 X103.931 Y94.643 E.01148
G1 X103.88 Y94.227 E.01148
G1 X103.931 Y93.81 E.01148
G1 X104.08 Y93.418 E.01148
G1 X104.318 Y93.072 E.01148
G1 X104.632 Y92.794 E.01148
G1 X105.004 Y92.599 E.01148
G1 X105.411 Y92.499 E.01148
G1 X105.831 Y92.499 E.01148
G1 X106.238 Y92.599 E.01148
G1 X106.61 Y92.794 E.01148
G1 X106.924 Y93.072 E.01148
G1 X107.162 Y93.418 E.01148
G1 X107.297 Y93.772 E.01036
M204 S10000
; WIPE_START
G1 F24000
G1 X107.362 Y94.227 E-.17459
G1 X107.311 Y94.643 E-.15946
G1 X107.162 Y95.036 E-.15946
G1 X106.924 Y95.381 E-.15946
G1 X106.713 Y95.568 E-.10704
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I1.052 J-.611 P1  F30000
G1 X104.937 Y92.509 Z4.2
G1 Z3.8
G1 E.8 F1800
M204 S5000
G1 F1461
G3 X105.95 Y92.407 I.685 J1.723 E.02822
G1 X106.118 Y92.435 E.00466
G3 X106.633 Y95.774 I-.495 J1.786 E.11629
G1 X106.492 Y95.87 E.00466
G3 X104.881 Y92.532 I-.87 J-1.637 E.16324
M204 S10000
; WIPE_START
G1 F24000
G1 X105.32 Y92.392 E-.1751
G1 X105.722 Y92.37 E-.1528
G1 X105.95 Y92.407 E-.08807
G1 X106.118 Y92.435 E-.06474
G1 X106.492 Y92.584 E-.1528
G1 X106.768 Y92.77 E-.12648
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I-1.19 J.255 P1  F30000
G1 X111.822 Y116.405 Z4.2
G1 Z3.8
G1 E.8 F1800
M204 S5000
G1 F1461
G1 X111.871 Y116.803 E.01095
G1 X111.82 Y117.219 E.01148
G1 X111.671 Y117.611 E.01148
G1 X111.433 Y117.957 E.01148
G1 X111.119 Y118.235 E.01148
G1 X110.747 Y118.43 E.01148
G1 X110.34 Y118.53 E.01148
G1 X109.92 Y118.53 E.01148
G1 X109.513 Y118.43 E.01148
G1 X109.141 Y118.235 E.01148
G1 X108.827 Y117.957 E.01148
G1 X108.589 Y117.611 E.01148
G1 X108.44 Y117.219 E.01148
G1 X108.389 Y116.803 E.01148
G1 X108.44 Y116.386 E.01148
G1 X108.589 Y115.994 E.01148
G1 X108.827 Y115.648 E.01148
G1 X109.141 Y115.37 E.01148
G1 X109.513 Y115.175 E.01148
G1 X109.92 Y115.075 E.01148
G1 X110.34 Y115.075 E.01148
G1 X110.747 Y115.175 E.01148
G1 X111.119 Y115.37 E.01148
G1 X111.433 Y115.648 E.01148
G1 X111.671 Y115.994 E.01148
G1 X111.805 Y116.348 E.01036
M204 S10000
; WIPE_START
G1 F24000
G1 X111.871 Y116.803 E-.17459
G1 X111.82 Y117.219 E-.15946
G1 X111.671 Y117.611 E-.15946
G1 X111.433 Y117.957 E-.15946
G1 X111.222 Y118.144 E-.10704
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I1.052 J-.611 P1  F30000
G1 X109.446 Y115.085 Z4.2
G1 Z3.8
G1 E.8 F1800
M204 S5000
G1 F1461
G3 X110.459 Y114.983 I.685 J1.723 E.02822
G1 X110.627 Y115.011 E.00466
G3 X111.142 Y118.35 I-.495 J1.786 E.11629
G1 X111.001 Y118.446 E.00466
G3 X109.39 Y115.108 I-.87 J-1.637 E.16324
M204 S10000
; WIPE_START
G1 F24000
G1 X109.829 Y114.967 E-.1751
G1 X110.231 Y114.946 E-.1528
G1 X110.459 Y114.983 E-.08807
G1 X110.627 Y115.011 E-.06474
G1 X111.001 Y115.16 E-.1528
G1 X111.276 Y115.346 E-.12648
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I-1.217 J-.007 P1  F30000
G1 X111.129 Y140.059 Z4.2
G1 Z3.8
G1 E.8 F1800
M204 S5000
G1 F1461
G1 X111.178 Y140.457 E.01095
G1 X111.127 Y140.873 E.01148
G1 X110.978 Y141.266 E.01148
G1 X110.74 Y141.611 E.01148
G1 X110.426 Y141.889 E.01148
G1 X110.054 Y142.084 E.01148
G1 X109.647 Y142.185 E.01148
G1 X109.227 Y142.185 E.01148
G1 X108.82 Y142.084 E.01148
G1 X108.448 Y141.889 E.01148
G1 X108.134 Y141.611 E.01148
G1 X107.896 Y141.266 E.01148
G1 X107.747 Y140.873 E.01148
G1 X107.696 Y140.457 E.01148
G1 X107.747 Y140.04 E.01148
G1 X107.896 Y139.648 E.01148
G1 X108.134 Y139.303 E.01148
G1 X108.448 Y139.024 E.01148
G1 X108.82 Y138.829 E.01148
G1 X109.227 Y138.729 E.01148
G1 X109.647 Y138.729 E.01148
G1 X110.054 Y138.829 E.01148
G1 X110.426 Y139.024 E.01148
G1 X110.74 Y139.303 E.01148
G1 X110.978 Y139.648 E.01148
G1 X111.112 Y140.002 E.01036
M204 S10000
; WIPE_START
G1 F24000
G1 X111.178 Y140.457 E-.17459
G1 X111.127 Y140.873 E-.15946
G1 X110.978 Y141.266 E-.15946
G1 X110.74 Y141.611 E-.15946
G1 X110.529 Y141.798 E-.10704
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I1.052 J-.611 P1  F30000
G1 X108.753 Y138.739 Z4.2
G1 Z3.8
G1 E.8 F1800
M204 S5000
G1 F1461
G3 X109.766 Y138.637 I.685 J1.723 E.02822
G1 X109.934 Y138.665 E.00466
G3 X110.449 Y142.004 I-.495 J1.786 E.11629
G1 X110.308 Y142.1 E.00466
G3 X108.697 Y138.762 I-.87 J-1.637 E.16324
M204 S10000
; WIPE_START
G1 F24000
G1 X109.136 Y138.622 E-.1751
G1 X109.538 Y138.6 E-.1528
G1 X109.766 Y138.637 E-.08807
G1 X109.934 Y138.665 E-.06474
G1 X110.308 Y138.814 E-.1528
G1 X110.583 Y139.001 E-.12648
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I-1.217 J.017 P1  F30000
G1 X110.963 Y165.706 Z4.2
G1 Z3.8
G1 E.8 F1800
M204 S5000
G1 F1461
G1 X111.012 Y166.104 E.01095
G1 X110.961 Y166.521 E.01148
G1 X110.812 Y166.913 E.01148
G1 X110.574 Y167.258 E.01148
G1 X110.26 Y167.537 E.01148
G1 X109.888 Y167.732 E.01148
G1 X109.481 Y167.832 E.01148
G1 X109.061 Y167.832 E.01148
G1 X108.654 Y167.732 E.01148
G1 X108.282 Y167.537 E.01148
G1 X107.968 Y167.258 E.01148
G1 X107.73 Y166.913 E.01148
G1 X107.581 Y166.521 E.01148
G1 X107.53 Y166.104 E.01148
G1 X107.581 Y165.688 E.01148
G1 X107.73 Y165.295 E.01148
G1 X107.968 Y164.95 E.01148
G1 X108.282 Y164.672 E.01148
G1 X108.654 Y164.477 E.01148
G1 X109.061 Y164.376 E.01148
G1 X109.481 Y164.376 E.01148
G1 X109.888 Y164.477 E.01148
G1 X110.26 Y164.672 E.01148
G1 X110.574 Y164.95 E.01148
G1 X110.812 Y165.295 E.01148
G1 X110.947 Y165.649 E.01036
M204 S10000
; WIPE_START
G1 F24000
G1 X111.012 Y166.104 E-.17459
G1 X110.961 Y166.521 E-.15946
G1 X110.812 Y166.913 E-.15946
G1 X110.574 Y167.258 E-.15946
G1 X110.363 Y167.445 E-.10704
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I1.052 J-.611 P1  F30000
G1 X108.587 Y164.387 Z4.2
M73 P79 R2
G1 Z3.8
G1 E.8 F1800
M204 S5000
G1 F1461
G3 X109.6 Y164.285 I.685 J1.723 E.02822
G1 X109.769 Y164.312 E.00466
G3 X110.283 Y167.651 I-.495 J1.786 E.11629
G1 X110.142 Y167.747 E.00466
G3 X108.531 Y164.41 I-.87 J-1.637 E.16324
M204 S10000
; WIPE_START
G1 F24000
G1 X108.97 Y164.269 E-.1751
G1 X109.372 Y164.247 E-.1528
G1 X109.6 Y164.285 E-.08807
G1 X109.769 Y164.312 E-.06474
G1 X110.142 Y164.461 E-.1528
G1 X110.418 Y164.648 E-.12648
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I.442 J1.134 P1  F30000
G1 X136.46 Y154.508 Z4.2
G1 Z3.8
G1 E.8 F1800
M204 S5000
G1 F1461
G1 X136.411 Y154.917 E.01127
G1 X136.262 Y155.309 E.01148
G1 X136.024 Y155.655 E.01148
G1 X135.71 Y155.933 E.01148
G1 X135.338 Y156.128 E.01148
G1 X134.931 Y156.228 E.01148
G1 X134.511 Y156.228 E.01148
G1 X134.104 Y156.128 E.01148
G1 X133.732 Y155.933 E.01148
G1 X133.418 Y155.655 E.01148
G1 X133.179 Y155.309 E.01148
G1 X133.031 Y154.917 E.01148
G1 X133.012 Y154.762 E.00427
G1 X132.98 Y154.5 E.0072
G1 X133.031 Y154.084 E.01148
G1 X133.179 Y153.691 E.01148
G1 X133.418 Y153.346 E.01148
G1 X133.732 Y153.068 E.01148
G1 X134.104 Y152.873 E.01148
G1 X134.511 Y152.772 E.01148
G1 X134.931 Y152.772 E.01148
G1 X135.338 Y152.873 E.01148
G1 X135.71 Y153.068 E.01148
G1 X136.024 Y153.346 E.01148
G1 X136.262 Y153.691 E.01148
G1 X136.411 Y154.084 E.01148
G1 X136.43 Y154.239 E.00427
G1 X136.455 Y154.448 E.00577
M204 S10000
; WIPE_START
G1 F24000
G1 X136.411 Y154.917 E-.1789
G1 X136.262 Y155.309 E-.15946
G1 X136.024 Y155.655 E-.15946
G1 X135.71 Y155.933 E-.15946
G1 X135.47 Y156.058 E-.10273
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I1.131 J-.45 P1  F30000
G1 X134.146 Y152.732 Z4.2
G1 Z3.8
G1 E.8 F1800
M204 S5000
G1 F1461
G3 X134.915 Y152.651 I.576 J1.763 E.0213
G1 X135.045 Y152.678 E.00363
G1 X135.295 Y152.732 E.007
G3 X134.09 Y152.752 I-.574 J1.764 E.28509
M204 S10000
; WIPE_START
G1 F24000
G1 X134.526 Y152.651 E-.17031
G1 X134.915 Y152.651 E-.14774
G1 X135.045 Y152.678 E-.0505
G1 X135.295 Y152.732 E-.09723
G1 X135.651 Y152.89 E-.14774
G1 X135.962 Y153.116 E-.14647
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I1.216 J.037 P1  F30000
G1 X136.588 Y132.318 Z4.2
G1 Z3.8
G1 E.8 F1800
M204 S5000
G1 F1461
G1 X136.539 Y132.728 E.01127
G1 X136.39 Y133.12 E.01148
G1 X136.152 Y133.465 E.01148
G1 X135.838 Y133.744 E.01148
G1 X135.466 Y133.939 E.01148
G1 X135.059 Y134.039 E.01148
G1 X134.639 Y134.039 E.01148
G1 X134.231 Y133.939 E.01148
G1 X133.86 Y133.744 E.01148
G1 X133.546 Y133.465 E.01148
G1 X133.307 Y133.12 E.01148
G1 X133.159 Y132.728 E.01148
G1 X133.14 Y132.573 E.00427
G1 X133.108 Y132.311 E.0072
G1 X133.159 Y131.894 E.01148
G1 X133.307 Y131.502 E.01148
G1 X133.546 Y131.157 E.01148
G1 X133.86 Y130.878 E.01148
G1 X134.231 Y130.683 E.01148
G1 X134.639 Y130.583 E.01148
G1 X135.059 Y130.583 E.01148
G1 X135.466 Y130.683 E.01148
G1 X135.838 Y130.878 E.01148
G1 X136.152 Y131.157 E.01148
G1 X136.39 Y131.502 E.01148
G1 X136.539 Y131.894 E.01148
G1 X136.558 Y132.05 E.00427
G1 X136.583 Y132.259 E.00577
M204 S10000
; WIPE_START
G1 F24000
G1 X136.539 Y132.728 E-.1789
G1 X136.39 Y133.12 E-.15946
G1 X136.152 Y133.465 E-.15946
G1 X135.838 Y133.744 E-.15946
G1 X135.598 Y133.869 E-.10273
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I1.131 J-.45 P1  F30000
G1 X134.274 Y130.543 Z4.2
G1 Z3.8
G1 E.8 F1800
M204 S5000
G1 F1461
G3 X135.043 Y130.462 I.576 J1.763 E.0213
G1 X135.173 Y130.489 E.00363
G1 X135.423 Y130.542 E.007
G3 X134.218 Y130.562 I-.574 J1.764 E.28509
M204 S10000
; WIPE_START
G1 F24000
G1 X134.654 Y130.462 E-.17031
G1 X135.043 Y130.462 E-.14774
G1 X135.173 Y130.489 E-.0505
G1 X135.423 Y130.542 E-.09723
G1 X135.779 Y130.7 E-.14774
G1 X136.09 Y130.927 E-.14647
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I1.216 J.052 P1  F30000
G1 X136.858 Y112.832 Z4.2
G1 Z3.8
G1 E.8 F1800
M204 S5000
G1 F1461
G1 X136.808 Y113.241 E.01127
G1 X136.659 Y113.634 E.01148
G1 X136.421 Y113.979 E.01148
G1 X136.107 Y114.257 E.01148
G1 X135.735 Y114.452 E.01148
G1 X135.328 Y114.553 E.01148
G1 X134.908 Y114.553 E.01148
G1 X134.501 Y114.452 E.01148
G1 X134.129 Y114.257 E.01148
G1 X133.815 Y113.979 E.01148
G1 X133.577 Y113.634 E.01148
G1 X133.428 Y113.241 E.01148
G1 X133.409 Y113.086 E.00427
G1 X133.377 Y112.825 E.0072
G1 X133.428 Y112.408 E.01148
G1 X133.577 Y112.016 E.01148
G1 X133.815 Y111.67 E.01148
G1 X134.129 Y111.392 E.01148
G1 X134.501 Y111.197 E.01148
G1 X134.908 Y111.097 E.01148
G1 X135.328 Y111.097 E.01148
G1 X135.735 Y111.197 E.01148
G1 X136.107 Y111.392 E.01148
G1 X136.421 Y111.67 E.01148
G1 X136.659 Y112.016 E.01148
G1 X136.808 Y112.408 E.01148
G1 X136.827 Y112.563 E.00427
G1 X136.852 Y112.773 E.00577
M204 S10000
; WIPE_START
G1 F24000
G1 X136.808 Y113.241 E-.1789
G1 X136.659 Y113.634 E-.15946
G1 X136.421 Y113.979 E-.15946
G1 X136.107 Y114.257 E-.15946
G1 X135.867 Y114.383 E-.10273
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I1.131 J-.45 P1  F30000
G1 X134.544 Y111.057 Z4.2
G1 Z3.8
G1 E.8 F1800
M204 S5000
G1 F1461
G3 X135.312 Y110.975 I.576 J1.763 E.0213
G1 X135.442 Y111.003 E.00363
G1 X135.693 Y111.056 E.007
G3 X134.487 Y111.076 I-.574 J1.764 E.28509
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X134.924 Y110.975 E-.17031
G1 X135.312 Y110.975 E-.14774
G1 X135.442 Y111.003 E-.0505
G1 X135.693 Y111.056 E-.09723
G1 X136.048 Y111.214 E-.14774
G1 X136.36 Y111.441 E-.14647
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
G3 Z4.2 I.631 J-1.041 P1  F30000
G1 X107.313 Y93.827 Z4.2
G1 Z4
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X107.362 Y94.227 E.01102
G1 X107.311 Y94.643 E.01148
G1 X107.162 Y95.036 E.01148
G1 X106.924 Y95.381 E.01148
G1 X106.61 Y95.659 E.01148
G1 X106.238 Y95.854 E.01148
G1 X105.831 Y95.955 E.01148
G1 X105.411 Y95.955 E.01148
G1 X105.004 Y95.854 E.01148
G1 X104.632 Y95.659 E.01148
G1 X104.318 Y95.381 E.01148
G1 X104.08 Y95.036 E.01148
G1 X103.931 Y94.643 E.01148
G1 X103.91 Y94.472 E.00472
G1 X103.88 Y94.227 E.00676
G1 X103.931 Y93.81 E.01148
G1 X104.08 Y93.418 E.01148
G1 X104.318 Y93.072 E.01148
G1 X104.632 Y92.794 E.01148
G1 X105.004 Y92.599 E.01148
G1 X105.411 Y92.499 E.01148
G1 X105.831 Y92.499 E.01148
G1 X106.238 Y92.599 E.01148
G1 X106.61 Y92.794 E.01148
G1 X106.924 Y93.072 E.01148
G1 X107.162 Y93.418 E.01148
G1 X107.296 Y93.77 E.01029
M204 S10000
; WIPE_START
G1 F24000
G1 X107.362 Y94.227 E-.17543
G1 X107.311 Y94.643 E-.15946
G1 X107.162 Y95.036 E-.15946
G1 X106.924 Y95.381 E-.15946
G1 X106.715 Y95.566 E-.1062
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I1.052 J-.611 P1  F30000
G1 X104.933 Y92.5 Z4.4
G1 Z4
G1 E.8 F1800
M204 S5000
G1 F1460
G3 X105.722 Y92.37 I.689 J1.721 E.02203
G1 X105.964 Y92.409 E.00671
G1 X106.118 Y92.435 E.00429
G3 X104.878 Y92.523 I-.497 J1.786 E.28391
M204 S10000
; WIPE_START
G1 F24000
G1 X105.32 Y92.392 E-.17536
G1 X105.722 Y92.37 E-.1528
G1 X105.964 Y92.409 E-.09325
G1 X106.118 Y92.435 E-.05956
G1 X106.492 Y92.584 E-.1528
G1 X106.767 Y92.77 E-.12622
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I-1.19 J.255 P1  F30000
G1 X111.822 Y116.403 Z4.4
G1 Z4
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X111.871 Y116.803 E.01102
G1 X111.82 Y117.219 E.01148
G1 X111.671 Y117.611 E.01148
G1 X111.433 Y117.957 E.01148
G1 X111.119 Y118.235 E.01148
G1 X110.747 Y118.43 E.01148
G1 X110.34 Y118.53 E.01148
G1 X109.92 Y118.53 E.01148
G1 X109.513 Y118.43 E.01148
G1 X109.141 Y118.235 E.01148
G1 X108.827 Y117.957 E.01148
G1 X108.589 Y117.611 E.01148
G1 X108.44 Y117.219 E.01148
G1 X108.419 Y117.048 E.00472
G1 X108.389 Y116.803 E.00676
G1 X108.44 Y116.386 E.01148
G1 X108.589 Y115.994 E.01148
G1 X108.827 Y115.648 E.01148
G1 X109.141 Y115.37 E.01148
M73 P80 R2
G1 X109.513 Y115.175 E.01148
G1 X109.92 Y115.075 E.01148
G1 X110.34 Y115.075 E.01148
G1 X110.747 Y115.175 E.01148
G1 X111.119 Y115.37 E.01148
G1 X111.433 Y115.648 E.01148
G1 X111.671 Y115.994 E.01148
G1 X111.805 Y116.346 E.01029
M204 S10000
; WIPE_START
G1 F24000
G1 X111.871 Y116.803 E-.17543
G1 X111.82 Y117.219 E-.15946
G1 X111.671 Y117.611 E-.15946
G1 X111.433 Y117.957 E-.15946
G1 X111.224 Y118.142 E-.1062
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I1.052 J-.611 P1  F30000
G1 X109.442 Y115.076 Z4.4
G1 Z4
G1 E.8 F1800
M204 S5000
G1 F1460
G3 X110.231 Y114.946 I.689 J1.721 E.02203
G1 X110.473 Y114.985 E.00671
G1 X110.627 Y115.011 E.00429
G3 X109.387 Y115.099 I-.497 J1.786 E.28391
M204 S10000
; WIPE_START
G1 F24000
G1 X109.829 Y114.967 E-.17536
G1 X110.231 Y114.946 E-.1528
G1 X110.473 Y114.985 E-.09325
G1 X110.627 Y115.011 E-.05956
G1 X111.001 Y115.16 E-.1528
G1 X111.276 Y115.346 E-.12622
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I-1.217 J-.007 P1  F30000
G1 X111.129 Y140.057 Z4.4
G1 Z4
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X111.178 Y140.457 E.01102
G1 X111.127 Y140.873 E.01148
G1 X110.978 Y141.266 E.01148
G1 X110.74 Y141.611 E.01148
G1 X110.426 Y141.889 E.01148
G1 X110.054 Y142.084 E.01148
G1 X109.647 Y142.185 E.01148
G1 X109.227 Y142.185 E.01148
G1 X108.82 Y142.084 E.01148
G1 X108.448 Y141.889 E.01148
G1 X108.134 Y141.611 E.01148
G1 X107.896 Y141.266 E.01148
G1 X107.747 Y140.873 E.01148
G1 X107.726 Y140.702 E.00472
G1 X107.696 Y140.457 E.00676
G1 X107.747 Y140.04 E.01148
G1 X107.896 Y139.648 E.01148
G1 X108.134 Y139.303 E.01148
G1 X108.448 Y139.024 E.01148
G1 X108.82 Y138.829 E.01148
G1 X109.227 Y138.729 E.01148
G1 X109.647 Y138.729 E.01148
G1 X110.054 Y138.829 E.01148
G1 X110.426 Y139.024 E.01148
G1 X110.74 Y139.303 E.01148
G1 X110.978 Y139.648 E.01148
G1 X111.112 Y140 E.01029
M204 S10000
; WIPE_START
G1 F24000
G1 X111.178 Y140.457 E-.17543
G1 X111.127 Y140.873 E-.15946
G1 X110.978 Y141.266 E-.15946
G1 X110.74 Y141.611 E-.15946
G1 X110.531 Y141.796 E-.1062
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I1.052 J-.611 P1  F30000
G1 X108.749 Y138.73 Z4.4
G1 Z4
G1 E.8 F1800
M204 S5000
G1 F1460
G3 X109.538 Y138.6 I.689 J1.721 E.02203
G1 X109.78 Y138.64 E.00671
G1 X109.934 Y138.665 E.00429
G3 X108.694 Y138.753 I-.497 J1.786 E.28391
M204 S10000
; WIPE_START
G1 F24000
G1 X109.136 Y138.622 E-.17536
G1 X109.538 Y138.6 E-.1528
G1 X109.78 Y138.64 E-.09325
G1 X109.934 Y138.665 E-.05956
G1 X110.308 Y138.814 E-.1528
G1 X110.583 Y139 E-.12622
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I-1.217 J.017 P1  F30000
G1 X110.963 Y165.704 Z4.4
G1 Z4
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X111.012 Y166.104 E.01102
G1 X110.961 Y166.521 E.01148
G1 X110.812 Y166.913 E.01148
G1 X110.574 Y167.258 E.01148
G1 X110.26 Y167.537 E.01148
G1 X109.888 Y167.732 E.01148
G1 X109.481 Y167.832 E.01148
G1 X109.061 Y167.832 E.01148
G1 X108.654 Y167.732 E.01148
G1 X108.282 Y167.537 E.01148
G1 X107.968 Y167.258 E.01148
G1 X107.73 Y166.913 E.01148
G1 X107.581 Y166.521 E.01148
G1 X107.56 Y166.349 E.00472
G1 X107.53 Y166.104 E.00676
G1 X107.581 Y165.688 E.01148
G1 X107.73 Y165.295 E.01148
G1 X107.968 Y164.95 E.01148
G1 X108.282 Y164.672 E.01148
G1 X108.654 Y164.477 E.01148
G1 X109.061 Y164.376 E.01148
G1 X109.481 Y164.376 E.01148
G1 X109.888 Y164.477 E.01148
G1 X110.26 Y164.672 E.01148
G1 X110.574 Y164.95 E.01148
G1 X110.812 Y165.295 E.01148
G1 X110.946 Y165.647 E.01029
M204 S10000
; WIPE_START
G1 F24000
G1 X111.012 Y166.104 E-.17543
G1 X110.961 Y166.521 E-.15946
G1 X110.812 Y166.913 E-.15946
G1 X110.574 Y167.258 E-.15946
G1 X110.365 Y167.444 E-.1062
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I1.052 J-.611 P1  F30000
G1 X108.583 Y164.377 Z4.4
G1 Z4
G1 E.8 F1800
M204 S5000
G1 F1460
G3 X109.372 Y164.247 I.689 J1.721 E.02203
G1 X109.614 Y164.287 E.00671
G1 X109.769 Y164.312 E.00429
G3 X108.528 Y164.4 I-.497 J1.786 E.28391
M204 S10000
; WIPE_START
G1 F24000
G1 X108.97 Y164.269 E-.17536
G1 X109.372 Y164.247 E-.1528
G1 X109.614 Y164.287 E-.09325
G1 X109.769 Y164.312 E-.05956
G1 X110.142 Y164.461 E-.1528
G1 X110.417 Y164.647 E-.12622
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I.442 J1.134 P1  F30000
G1 X136.46 Y154.508 Z4.4
G1 Z4
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X136.411 Y154.917 E.01126
G1 X136.262 Y155.309 E.01148
G1 X136.024 Y155.655 E.01148
G1 X135.71 Y155.933 E.01148
G1 X135.338 Y156.128 E.01148
G1 X134.931 Y156.228 E.01148
G1 X134.511 Y156.228 E.01148
G1 X134.104 Y156.128 E.01148
G1 X133.732 Y155.933 E.01148
G1 X133.418 Y155.655 E.01148
G1 X133.179 Y155.309 E.01148
G1 X133.031 Y154.917 E.01148
G1 X132.98 Y154.5 E.01148
G1 X133.031 Y154.084 E.01148
G1 X133.179 Y153.691 E.01148
G1 X133.418 Y153.346 E.01148
G1 X133.732 Y153.068 E.01148
G1 X134.104 Y152.873 E.01148
G1 X134.511 Y152.772 E.01148
G1 X134.931 Y152.772 E.01148
G1 X135.338 Y152.873 E.01148
G1 X135.71 Y153.068 E.01148
G1 X136.024 Y153.346 E.01148
G1 X136.262 Y153.691 E.01148
G1 X136.411 Y154.084 E.01148
G1 X136.455 Y154.448 E.01005
M204 S10000
; WIPE_START
G1 F24000
G1 X136.411 Y154.917 E-.17876
G1 X136.262 Y155.309 E-.15946
G1 X136.024 Y155.655 E-.15946
G1 X135.71 Y155.933 E-.15946
G1 X135.47 Y156.059 E-.10286
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I1.131 J-.45 P1  F30000
G1 X134.149 Y152.742 Z4.4
G1 Z4
G1 E.8 F1800
M204 S5000
G1 F1460
G3 X135.031 Y152.675 I.576 J1.762 E.0244
G1 X135.295 Y152.732 E.00741
G3 X135.651 Y156.111 I-.592 J1.77 E.11675
G3 X134.093 Y152.761 I-.925 J-1.607 E.1681
M204 S10000
; WIPE_START
G1 F24000
G1 X134.526 Y152.651 E-.17005
G1 X134.915 Y152.651 E-.14774
G1 X135.031 Y152.675 E-.04484
G1 X135.295 Y152.732 E-.1029
G1 X135.651 Y152.89 E-.14774
G1 X135.963 Y153.117 E-.14674
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I1.216 J.037 P1  F30000
G1 X136.588 Y132.319 Z4.4
G1 Z4
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X136.539 Y132.728 E.01126
G1 X136.39 Y133.12 E.01148
G1 X136.152 Y133.465 E.01148
G1 X135.838 Y133.744 E.01148
G1 X135.466 Y133.939 E.01148
G1 X135.059 Y134.039 E.01148
G1 X134.639 Y134.039 E.01148
G1 X134.231 Y133.939 E.01148
G1 X133.86 Y133.744 E.01148
G1 X133.546 Y133.465 E.01148
G1 X133.307 Y133.12 E.01148
G1 X133.159 Y132.728 E.01148
G1 X133.108 Y132.311 E.01148
G1 X133.159 Y131.894 E.01148
G1 X133.307 Y131.502 E.01148
G1 X133.546 Y131.157 E.01148
G1 X133.86 Y130.878 E.01148
G1 X134.231 Y130.683 E.01148
G1 X134.639 Y130.583 E.01148
G1 X135.059 Y130.583 E.01148
G1 X135.466 Y130.683 E.01148
G1 X135.838 Y130.878 E.01148
G1 X136.152 Y131.157 E.01148
G1 X136.39 Y131.502 E.01148
G1 X136.539 Y131.894 E.01148
G1 X136.583 Y132.259 E.01005
M204 S10000
; WIPE_START
G1 F24000
G1 X136.539 Y132.728 E-.17876
G1 X136.39 Y133.12 E-.15946
G1 X136.152 Y133.465 E-.15946
G1 X135.838 Y133.744 E-.15946
G1 X135.598 Y133.869 E-.10286
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I1.131 J-.45 P1  F30000
G1 X134.277 Y130.553 Z4.4
G1 Z4
G1 E.8 F1800
M204 S5000
G1 F1460
G3 X135.159 Y130.486 I.576 J1.762 E.0244
G1 X135.423 Y130.542 E.00741
G3 X135.779 Y133.922 I-.592 J1.77 E.11675
G3 X134.221 Y130.572 I-.925 J-1.607 E.1681
M204 S10000
; WIPE_START
G1 F24000
G1 X134.654 Y130.462 E-.17005
G1 X135.043 Y130.462 E-.14774
G1 X135.159 Y130.486 E-.04484
G1 X135.423 Y130.542 E-.1029
G1 X135.779 Y130.7 E-.14774
G1 X136.091 Y130.927 E-.14674
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I1.216 J.052 P1  F30000
G1 X136.858 Y112.832 Z4.4
G1 Z4
G1 E.8 F1800
M204 S5000
M73 P81 R2
G1 F1460
G1 X136.808 Y113.241 E.01126
G1 X136.659 Y113.634 E.01148
G1 X136.421 Y113.979 E.01148
G1 X136.107 Y114.257 E.01148
G1 X135.735 Y114.452 E.01148
G1 X135.328 Y114.553 E.01148
G1 X134.908 Y114.553 E.01148
G1 X134.501 Y114.452 E.01148
G1 X134.129 Y114.257 E.01148
G1 X133.815 Y113.979 E.01148
G1 X133.577 Y113.634 E.01148
G1 X133.428 Y113.241 E.01148
G1 X133.377 Y112.825 E.01148
G1 X133.428 Y112.408 E.01148
G1 X133.577 Y112.016 E.01148
G1 X133.815 Y111.67 E.01148
G1 X134.129 Y111.392 E.01148
G1 X134.501 Y111.197 E.01148
G1 X134.908 Y111.097 E.01148
G1 X135.328 Y111.097 E.01148
G1 X135.735 Y111.197 E.01148
G1 X136.107 Y111.392 E.01148
G1 X136.421 Y111.67 E.01148
G1 X136.659 Y112.016 E.01148
G1 X136.808 Y112.408 E.01148
G1 X136.852 Y112.773 E.01005
M204 S10000
; WIPE_START
G1 F24000
G1 X136.808 Y113.241 E-.17876
G1 X136.659 Y113.634 E-.15946
G1 X136.421 Y113.979 E-.15946
G1 X136.107 Y114.257 E-.15946
G1 X135.867 Y114.383 E-.10286
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I1.131 J-.45 P1  F30000
G1 X134.547 Y111.066 Z4.4
G1 Z4
G1 E.8 F1800
M204 S5000
G1 F1460
G3 X135.428 Y111 I.576 J1.762 E.0244
G1 X135.693 Y111.056 E.00741
G3 X136.048 Y114.435 I-.592 J1.77 E.11675
G3 X134.49 Y111.086 I-.925 J-1.607 E.1681
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 4.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X134.924 Y110.975 E-.17005
G1 X135.312 Y110.975 E-.14774
G1 X135.428 Y111 E-.04484
G1 X135.693 Y111.056 E-.1029
G1 X136.048 Y111.214 E-.14774
G1 X136.36 Y111.441 E-.14674
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
G3 Z4.4 I.631 J-1.041 P1  F30000
G1 X107.313 Y93.825 Z4.4
G1 Z4.2
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X107.342 Y94.067 E.00668
G1 X107.362 Y94.227 E.0044
G1 X107.311 Y94.643 E.01148
G1 X107.162 Y95.036 E.01148
G1 X106.924 Y95.381 E.01148
G1 X106.61 Y95.659 E.01148
G1 X106.238 Y95.854 E.01148
G1 X105.831 Y95.955 E.01148
G1 X105.411 Y95.955 E.01148
G1 X105.004 Y95.854 E.01148
G1 X104.632 Y95.659 E.01148
G1 X104.318 Y95.381 E.01148
G1 X104.08 Y95.036 E.01148
G1 X103.931 Y94.643 E.01148
G1 X103.911 Y94.483 E.0044
G1 X103.88 Y94.227 E.00707
G1 X103.931 Y93.81 E.01148
G1 X104.08 Y93.418 E.01148
G1 X104.318 Y93.072 E.01148
G1 X104.632 Y92.794 E.01148
G1 X105.004 Y92.599 E.01148
G1 X105.411 Y92.499 E.01148
G1 X105.831 Y92.499 E.01148
G1 X106.238 Y92.599 E.01148
G1 X106.61 Y92.794 E.01148
G1 X106.924 Y93.072 E.01148
G1 X107.162 Y93.418 E.01148
G1 X107.295 Y93.768 E.01023
M204 S10000
; WIPE_START
G1 F24000
G1 X107.342 Y94.067 E-.11513
G1 X107.362 Y94.227 E-.06116
G1 X107.311 Y94.643 E-.15946
G1 X107.162 Y95.036 E-.15946
G1 X106.924 Y95.381 E-.15946
G1 X106.716 Y95.565 E-.10534
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I1.052 J-.612 P1  F30000
G1 X104.937 Y92.509 Z4.6
G1 Z4.2
G1 E.8 F1800
M204 S5000
G1 F1460
G3 X105.977 Y92.412 I.686 J1.723 E.02898
G1 X106.118 Y92.435 E.00391
G3 X106.61 Y95.789 I-.495 J1.786 E.11705
G1 X106.492 Y95.87 E.00391
G3 X104.881 Y92.532 I-.87 J-1.638 E.16322
M204 S10000
; WIPE_START
G1 F24000
G1 X105.32 Y92.392 E-.17511
G1 X105.722 Y92.37 E-.1528
G1 X105.977 Y92.412 E-.09843
G1 X106.118 Y92.435 E-.05438
G1 X106.492 Y92.584 E-.1528
G1 X106.767 Y92.77 E-.12648
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I-1.19 J.255 P1  F30000
G1 X111.822 Y116.4 Z4.6
G1 Z4.2
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X111.851 Y116.643 E.00668
G1 X111.871 Y116.803 E.0044
G1 X111.82 Y117.219 E.01148
G1 X111.671 Y117.611 E.01148
G1 X111.433 Y117.957 E.01148
G1 X111.119 Y118.235 E.01148
G1 X110.747 Y118.43 E.01148
G1 X110.34 Y118.53 E.01148
G1 X109.92 Y118.53 E.01148
G1 X109.513 Y118.43 E.01148
G1 X109.141 Y118.235 E.01148
G1 X108.827 Y117.957 E.01148
G1 X108.589 Y117.611 E.01148
G1 X108.44 Y117.219 E.01148
G1 X108.42 Y117.059 E.0044
G1 X108.389 Y116.803 E.00707
G1 X108.44 Y116.386 E.01148
G1 X108.589 Y115.994 E.01148
G1 X108.827 Y115.648 E.01148
G1 X109.141 Y115.37 E.01148
G1 X109.513 Y115.175 E.01148
G1 X109.92 Y115.075 E.01148
G1 X110.34 Y115.075 E.01148
G1 X110.747 Y115.175 E.01148
G1 X111.119 Y115.37 E.01148
G1 X111.433 Y115.648 E.01148
G1 X111.671 Y115.994 E.01148
G1 X111.804 Y116.343 E.01023
M204 S10000
; WIPE_START
G1 F24000
G1 X111.851 Y116.643 E-.11513
G1 X111.871 Y116.803 E-.06116
G1 X111.82 Y117.219 E-.15946
G1 X111.671 Y117.611 E-.15946
G1 X111.433 Y117.957 E-.15946
G1 X111.225 Y118.141 E-.10534
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I1.052 J-.612 P1  F30000
G1 X109.445 Y115.085 Z4.6
G1 Z4.2
G1 E.8 F1800
M204 S5000
G1 F1460
G3 X110.486 Y114.988 I.686 J1.723 E.02898
G1 X110.627 Y115.011 E.00391
G3 X111.119 Y118.365 I-.495 J1.786 E.11705
G1 X111.001 Y118.446 E.00391
G3 X109.39 Y115.108 I-.87 J-1.638 E.16322
M204 S10000
; WIPE_START
G1 F24000
G1 X109.829 Y114.967 E-.17511
G1 X110.231 Y114.946 E-.1528
G1 X110.486 Y114.988 E-.09843
G1 X110.627 Y115.011 E-.05438
G1 X111.001 Y115.16 E-.1528
G1 X111.276 Y115.346 E-.12648
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I-1.217 J-.007 P1  F30000
G1 X111.129 Y140.055 Z4.6
G1 Z4.2
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X111.158 Y140.297 E.00668
G1 X111.178 Y140.457 E.0044
G1 X111.127 Y140.873 E.01148
G1 X110.978 Y141.266 E.01148
G1 X110.74 Y141.611 E.01148
G1 X110.426 Y141.889 E.01148
G1 X110.054 Y142.084 E.01148
G1 X109.647 Y142.185 E.01148
G1 X109.227 Y142.185 E.01148
G1 X108.82 Y142.084 E.01148
G1 X108.448 Y141.889 E.01148
G1 X108.134 Y141.611 E.01148
G1 X107.896 Y141.266 E.01148
G1 X107.747 Y140.873 E.01148
G1 X107.727 Y140.714 E.0044
G1 X107.696 Y140.457 E.00707
G1 X107.747 Y140.04 E.01148
G1 X107.896 Y139.648 E.01148
G1 X108.134 Y139.303 E.01148
G1 X108.448 Y139.024 E.01148
G1 X108.82 Y138.829 E.01148
G1 X109.227 Y138.729 E.01148
G1 X109.647 Y138.729 E.01148
G1 X110.054 Y138.829 E.01148
G1 X110.426 Y139.024 E.01148
G1 X110.74 Y139.303 E.01148
G1 X110.978 Y139.648 E.01148
G1 X111.111 Y139.998 E.01023
M204 S10000
; WIPE_START
G1 F24000
G1 X111.158 Y140.297 E-.11513
G1 X111.178 Y140.457 E-.06116
G1 X111.127 Y140.873 E-.15946
G1 X110.978 Y141.266 E-.15946
G1 X110.74 Y141.611 E-.15946
G1 X110.532 Y141.795 E-.10534
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I1.052 J-.612 P1  F30000
G1 X108.752 Y138.739 Z4.6
G1 Z4.2
G1 E.8 F1800
M204 S5000
G1 F1460
G3 X109.793 Y138.642 I.686 J1.723 E.02898
G1 X109.934 Y138.665 E.00391
G3 X110.426 Y142.02 I-.495 J1.786 E.11705
G1 X110.308 Y142.1 E.00391
G3 X108.697 Y138.762 I-.87 J-1.638 E.16322
M204 S10000
; WIPE_START
G1 F24000
G1 X109.136 Y138.622 E-.17511
G1 X109.538 Y138.6 E-.1528
G1 X109.793 Y138.642 E-.09843
G1 X109.934 Y138.665 E-.05438
G1 X110.308 Y138.814 E-.1528
G1 X110.583 Y139.001 E-.12648
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I-1.217 J.017 P1  F30000
G1 X110.963 Y165.702 Z4.6
G1 Z4.2
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X110.992 Y165.944 E.00668
G1 X111.012 Y166.104 E.0044
G1 X110.961 Y166.521 E.01148
G1 X110.812 Y166.913 E.01148
G1 X110.574 Y167.258 E.01148
G1 X110.26 Y167.537 E.01148
G1 X109.888 Y167.732 E.01148
G1 X109.481 Y167.832 E.01148
G1 X109.061 Y167.832 E.01148
G1 X108.654 Y167.732 E.01148
G1 X108.282 Y167.537 E.01148
G1 X107.968 Y167.258 E.01148
G1 X107.73 Y166.913 E.01148
G1 X107.581 Y166.521 E.01148
G1 X107.562 Y166.361 E.0044
G1 X107.53 Y166.104 E.00707
G1 X107.581 Y165.688 E.01148
G1 X107.73 Y165.295 E.01148
G1 X107.968 Y164.95 E.01148
G1 X108.282 Y164.672 E.01148
G1 X108.654 Y164.477 E.01148
G1 X109.061 Y164.376 E.01148
G1 X109.481 Y164.376 E.01148
G1 X109.888 Y164.477 E.01148
G1 X110.26 Y164.672 E.01148
G1 X110.574 Y164.95 E.01148
G1 X110.812 Y165.295 E.01148
G1 X110.945 Y165.645 E.01023
M204 S10000
; WIPE_START
G1 F24000
G1 X110.992 Y165.944 E-.11513
G1 X111.012 Y166.104 E-.06116
G1 X110.961 Y166.521 E-.15946
G1 X110.812 Y166.913 E-.15946
G1 X110.574 Y167.258 E-.15946
G1 X110.366 Y167.442 E-.10534
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I1.052 J-.612 P1  F30000
G1 X108.587 Y164.386 Z4.6
G1 Z4.2
M73 P82 R2
G1 E.8 F1800
M204 S5000
G1 F1460
G3 X109.627 Y164.289 I.686 J1.723 E.02898
G1 X109.769 Y164.312 E.00391
G3 X110.261 Y167.667 I-.495 J1.786 E.11705
G1 X110.142 Y167.747 E.00391
G3 X108.531 Y164.409 I-.87 J-1.638 E.16322
M204 S10000
; WIPE_START
G1 F24000
G1 X108.97 Y164.269 E-.17511
G1 X109.372 Y164.247 E-.1528
G1 X109.627 Y164.289 E-.09843
G1 X109.769 Y164.312 E-.05438
G1 X110.142 Y164.461 E-.1528
G1 X110.418 Y164.648 E-.12648
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I.442 J1.134 P1  F30000
G1 X136.46 Y154.508 Z4.6
G1 Z4.2
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X136.411 Y154.917 E.01125
G1 X136.262 Y155.309 E.01148
G1 X136.024 Y155.655 E.01148
G1 X135.71 Y155.933 E.01148
G1 X135.338 Y156.128 E.01148
G1 X134.931 Y156.228 E.01148
G1 X134.511 Y156.228 E.01148
G1 X134.103 Y156.128 E.01148
G1 X133.732 Y155.933 E.01148
G1 X133.418 Y155.655 E.01148
G1 X133.179 Y155.309 E.01148
G1 X133.031 Y154.917 E.01148
G1 X132.98 Y154.5 E.01148
G1 X133.031 Y154.084 E.01148
G1 X133.179 Y153.691 E.01148
G1 X133.418 Y153.346 E.01148
G1 X133.732 Y153.068 E.01148
G1 X134.103 Y152.873 E.01148
G1 X134.511 Y152.772 E.01148
G1 X134.931 Y152.772 E.01148
G1 X135.338 Y152.873 E.01148
G1 X135.71 Y153.068 E.01148
G1 X136.024 Y153.346 E.01148
G1 X136.262 Y153.691 E.01148
G1 X136.411 Y154.084 E.01148
G1 X136.455 Y154.449 E.01006
M204 S10000
; WIPE_START
G1 F24000
G1 X136.411 Y154.917 E-.17863
G1 X136.262 Y155.309 E-.15946
G1 X136.024 Y155.655 E-.15946
G1 X135.71 Y155.933 E-.15946
G1 X135.47 Y156.059 E-.103
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I1.131 J-.45 P1  F30000
G1 X134.149 Y152.742 Z4.6
G1 Z4.2
G1 E.8 F1800
M204 S5000
G1 F1460
G3 X135.016 Y152.672 I.579 J1.787 E.02399
G3 X133.022 Y153.744 I-.302 J1.83 E.25211
G3 X134.093 Y152.761 I1.707 J.784 E.04081
M204 S10000
; WIPE_START
G1 F24000
G1 X134.526 Y152.651 E-.17007
G1 X134.915 Y152.651 E-.14774
G1 X135.016 Y152.672 E-.03917
G1 X135.295 Y152.732 E-.10856
G1 X135.651 Y152.89 E-.14774
G1 X135.963 Y153.117 E-.14672
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I1.216 J.037 P1  F30000
G1 X136.588 Y132.319 Z4.6
G1 Z4.2
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X136.539 Y132.728 E.01125
G1 X136.39 Y133.12 E.01148
G1 X136.152 Y133.465 E.01148
G1 X135.838 Y133.744 E.01148
G1 X135.466 Y133.939 E.01148
G1 X135.059 Y134.039 E.01148
G1 X134.639 Y134.039 E.01148
G1 X134.231 Y133.939 E.01148
G1 X133.86 Y133.744 E.01148
G1 X133.546 Y133.465 E.01148
G1 X133.307 Y133.12 E.01148
G1 X133.159 Y132.728 E.01148
G1 X133.108 Y132.311 E.01148
G1 X133.159 Y131.894 E.01148
G1 X133.307 Y131.502 E.01148
G1 X133.546 Y131.157 E.01148
G1 X133.86 Y130.878 E.01148
G1 X134.231 Y130.683 E.01148
G1 X134.639 Y130.583 E.01148
G1 X135.059 Y130.583 E.01148
G1 X135.466 Y130.683 E.01148
G1 X135.838 Y130.878 E.01148
G1 X136.152 Y131.157 E.01148
G1 X136.39 Y131.502 E.01148
G1 X136.539 Y131.894 E.01148
G1 X136.583 Y132.26 E.01006
M204 S10000
; WIPE_START
G1 F24000
G1 X136.539 Y132.728 E-.17863
G1 X136.39 Y133.12 E-.15946
G1 X136.152 Y133.465 E-.15946
G1 X135.838 Y133.744 E-.15946
G1 X135.598 Y133.87 E-.103
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I1.131 J-.45 P1  F30000
G1 X134.277 Y130.552 Z4.6
G1 Z4.2
G1 E.8 F1800
M204 S5000
G1 F1460
G3 X135.144 Y130.483 I.579 J1.787 E.02399
G3 X133.15 Y131.555 I-.302 J1.83 E.25211
G3 X134.221 Y130.572 I1.707 J.784 E.04081
M204 S10000
; WIPE_START
G1 F24000
G1 X134.654 Y130.462 E-.17007
G1 X135.043 Y130.462 E-.14774
G1 X135.144 Y130.483 E-.03917
G1 X135.423 Y130.542 E-.10856
G1 X135.779 Y130.7 E-.14774
G1 X136.091 Y130.927 E-.14672
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I1.216 J.052 P1  F30000
G1 X136.858 Y112.833 Z4.6
G1 Z4.2
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X136.808 Y113.241 E.01125
G1 X136.659 Y113.634 E.01148
G1 X136.421 Y113.979 E.01148
G1 X136.107 Y114.257 E.01148
G1 X135.735 Y114.452 E.01148
G1 X135.328 Y114.553 E.01148
G1 X134.908 Y114.553 E.01148
M73 P82 R1
G1 X134.501 Y114.452 E.01148
G1 X134.129 Y114.257 E.01148
G1 X133.815 Y113.979 E.01148
G1 X133.577 Y113.634 E.01148
G1 X133.428 Y113.241 E.01148
G1 X133.377 Y112.825 E.01148
G1 X133.428 Y112.408 E.01148
G1 X133.577 Y112.016 E.01148
G1 X133.815 Y111.67 E.01148
G1 X134.129 Y111.392 E.01148
G1 X134.501 Y111.197 E.01148
G1 X134.908 Y111.097 E.01148
G1 X135.328 Y111.097 E.01148
G1 X135.735 Y111.197 E.01148
G1 X136.107 Y111.392 E.01148
G1 X136.421 Y111.67 E.01148
G1 X136.659 Y112.016 E.01148
G1 X136.808 Y112.408 E.01148
G1 X136.852 Y112.773 E.01006
M204 S10000
; WIPE_START
G1 F24000
G1 X136.808 Y113.241 E-.17863
G1 X136.659 Y113.634 E-.15946
G1 X136.421 Y113.979 E-.15946
G1 X136.107 Y114.257 E-.15946
G1 X135.867 Y114.383 E-.103
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I1.131 J-.45 P1  F30000
G1 X134.547 Y111.066 Z4.6
G1 Z4.2
G1 E.8 F1800
M204 S5000
G1 F1460
G3 X135.413 Y110.997 I.579 J1.787 E.02399
G3 X133.419 Y112.068 I-.302 J1.83 E.25211
G3 X134.49 Y111.085 I1.707 J.784 E.04081
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 4.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X134.924 Y110.975 E-.17007
G1 X135.312 Y110.975 E-.14774
G1 X135.413 Y110.997 E-.03917
G1 X135.693 Y111.056 E-.10856
G1 X136.048 Y111.214 E-.14774
G1 X136.36 Y111.441 E-.14672
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
G3 Z4.6 I.631 J-1.041 P1  F30000
G1 X107.313 Y93.822 Z4.6
G1 Z4.4
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X107.344 Y94.078 E.00705
G1 X107.362 Y94.227 E.00409
G1 X107.311 Y94.643 E.01148
G1 X107.162 Y95.036 E.01148
G1 X106.924 Y95.381 E.01148
G1 X106.61 Y95.659 E.01148
G1 X106.238 Y95.854 E.01148
G1 X105.831 Y95.955 E.01148
G1 X105.411 Y95.955 E.01148
G1 X105.004 Y95.854 E.01148
G1 X104.632 Y95.659 E.01148
G1 X104.318 Y95.381 E.01148
G1 X104.08 Y95.036 E.01148
G1 X103.931 Y94.643 E.01148
G1 X103.88 Y94.227 E.01148
G1 X103.931 Y93.81 E.01148
G1 X104.08 Y93.418 E.01148
G1 X104.318 Y93.072 E.01148
G1 X104.632 Y92.794 E.01148
G1 X105.004 Y92.599 E.01148
G1 X105.411 Y92.499 E.01148
G1 X105.831 Y92.499 E.01148
G1 X106.238 Y92.599 E.01148
G1 X106.61 Y92.794 E.01148
G1 X106.924 Y93.072 E.01148
G1 X107.162 Y93.418 E.01148
G1 X107.294 Y93.766 E.01017
M204 S10000
; WIPE_START
G1 F24000
G1 X107.344 Y94.078 E-.12032
G1 X107.362 Y94.227 E-.05679
G1 X107.311 Y94.643 E-.15946
G1 X107.162 Y95.036 E-.15946
G1 X106.924 Y95.381 E-.15946
G1 X106.718 Y95.563 E-.10452
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I1.051 J-.613 P1  F30000
G1 X104.936 Y92.508 Z4.8
G1 Z4.4
G1 E.8 F1800
M204 S5000
G1 F1460
G3 X105.991 Y92.414 I.686 J1.723 E.02936
G1 X106.118 Y92.435 E.00354
G3 X106.599 Y95.797 I-.508 J1.788 E.11712
G1 X106.492 Y95.87 E.00354
G3 X104.881 Y92.531 I-.87 J-1.638 E.16324
M204 S10000
; WIPE_START
G1 F24000
G1 X105.32 Y92.392 E-.17512
G1 X105.722 Y92.37 E-.1528
G1 X105.991 Y92.414 E-.10362
G1 X106.118 Y92.435 E-.04919
G1 X106.492 Y92.584 E-.15281
G1 X106.767 Y92.77 E-.12647
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I-1.19 J.255 P1  F30000
G1 X111.821 Y116.398 Z4.8
G1 Z4.4
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X111.853 Y116.654 E.00705
G1 X111.871 Y116.803 E.00409
G1 X111.82 Y117.219 E.01148
G1 X111.671 Y117.611 E.01148
G1 X111.433 Y117.957 E.01148
G1 X111.119 Y118.235 E.01148
G1 X110.747 Y118.43 E.01148
G1 X110.34 Y118.53 E.01148
G1 X109.92 Y118.53 E.01148
G1 X109.513 Y118.43 E.01148
G1 X109.141 Y118.235 E.01148
G1 X108.827 Y117.957 E.01148
G1 X108.589 Y117.611 E.01148
G1 X108.44 Y117.219 E.01148
G1 X108.389 Y116.803 E.01148
G1 X108.44 Y116.386 E.01148
G1 X108.589 Y115.994 E.01148
G1 X108.827 Y115.648 E.01148
G1 X109.141 Y115.37 E.01148
G1 X109.513 Y115.175 E.01148
G1 X109.92 Y115.075 E.01148
G1 X110.34 Y115.075 E.01148
G1 X110.747 Y115.175 E.01148
G1 X111.119 Y115.37 E.01148
G1 X111.433 Y115.648 E.01148
G1 X111.671 Y115.994 E.01148
G1 X111.803 Y116.341 E.01017
M204 S10000
; WIPE_START
G1 F24000
G1 X111.853 Y116.654 E-.12032
G1 X111.871 Y116.803 E-.05679
G1 X111.82 Y117.219 E-.15946
G1 X111.671 Y117.611 E-.15946
G1 X111.433 Y117.957 E-.15946
G1 X111.227 Y118.139 E-.10452
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I1.051 J-.613 P1  F30000
G1 X109.445 Y115.084 Z4.8
M73 P83 R1
G1 Z4.4
G1 E.8 F1800
M204 S5000
G1 F1460
G3 X110.5 Y114.99 I.686 J1.723 E.02936
G1 X110.627 Y115.011 E.00354
G3 X111.108 Y118.373 I-.508 J1.788 E.11712
G1 X111.001 Y118.446 E.00354
G3 X109.39 Y115.107 I-.87 J-1.638 E.16324
M204 S10000
; WIPE_START
G1 F24000
G1 X109.829 Y114.967 E-.17512
G1 X110.231 Y114.946 E-.1528
G1 X110.5 Y114.99 E-.10362
G1 X110.627 Y115.011 E-.04919
G1 X111.001 Y115.16 E-.15281
G1 X111.276 Y115.346 E-.12646
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I-1.217 J-.007 P1  F30000
G1 X111.128 Y140.053 Z4.8
G1 Z4.4
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X111.16 Y140.309 E.00705
G1 X111.178 Y140.457 E.00409
G1 X111.127 Y140.873 E.01148
G1 X110.978 Y141.266 E.01148
G1 X110.74 Y141.611 E.01148
G1 X110.426 Y141.889 E.01148
G1 X110.054 Y142.084 E.01148
G1 X109.647 Y142.185 E.01148
G1 X109.227 Y142.185 E.01148
G1 X108.82 Y142.084 E.01148
G1 X108.448 Y141.889 E.01148
G1 X108.134 Y141.611 E.01148
G1 X107.896 Y141.266 E.01148
G1 X107.747 Y140.873 E.01148
G1 X107.696 Y140.457 E.01148
G1 X107.747 Y140.04 E.01148
G1 X107.896 Y139.648 E.01148
G1 X108.134 Y139.303 E.01148
G1 X108.448 Y139.024 E.01148
G1 X108.82 Y138.829 E.01148
G1 X109.227 Y138.729 E.01148
G1 X109.647 Y138.729 E.01148
G1 X110.054 Y138.829 E.01148
G1 X110.426 Y139.024 E.01148
G1 X110.74 Y139.303 E.01148
G1 X110.978 Y139.648 E.01148
G1 X111.11 Y139.996 E.01017
M204 S10000
; WIPE_START
G1 F24000
G1 X111.16 Y140.309 E-.12032
G1 X111.178 Y140.457 E-.05679
G1 X111.127 Y140.873 E-.15946
G1 X110.978 Y141.266 E-.15946
G1 X110.74 Y141.611 E-.15946
G1 X110.534 Y141.794 E-.10452
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I1.051 J-.613 P1  F30000
G1 X108.752 Y138.739 Z4.8
G1 Z4.4
G1 E.8 F1800
M204 S5000
G1 F1460
G3 X109.807 Y138.644 I.686 J1.723 E.02936
G1 X109.934 Y138.665 E.00354
G3 X110.415 Y142.027 I-.508 J1.788 E.11712
G1 X110.308 Y142.1 E.00354
G3 X108.697 Y138.762 I-.87 J-1.638 E.16324
M204 S10000
; WIPE_START
G1 F24000
G1 X109.136 Y138.622 E-.17512
G1 X109.538 Y138.6 E-.1528
G1 X109.807 Y138.644 E-.10362
G1 X109.934 Y138.665 E-.04919
G1 X110.308 Y138.814 E-.15281
G1 X110.583 Y139.001 E-.12646
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I-1.217 J.017 P1  F30000
G1 X110.963 Y165.7 Z4.8
G1 Z4.4
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X110.994 Y165.956 E.00705
G1 X111.012 Y166.104 E.00409
G1 X110.961 Y166.521 E.01148
G1 X110.812 Y166.913 E.01148
G1 X110.574 Y167.258 E.01148
G1 X110.26 Y167.537 E.01148
G1 X109.888 Y167.732 E.01148
G1 X109.481 Y167.832 E.01148
G1 X109.061 Y167.832 E.01148
G1 X108.654 Y167.732 E.01148
G1 X108.282 Y167.537 E.01148
G1 X107.968 Y167.258 E.01148
G1 X107.73 Y166.913 E.01148
G1 X107.581 Y166.521 E.01148
G1 X107.53 Y166.104 E.01148
G1 X107.581 Y165.688 E.01148
G1 X107.73 Y165.295 E.01148
G1 X107.968 Y164.95 E.01148
G1 X108.282 Y164.672 E.01148
G1 X108.654 Y164.477 E.01148
G1 X109.061 Y164.376 E.01148
G1 X109.481 Y164.376 E.01148
G1 X109.888 Y164.477 E.01148
G1 X110.26 Y164.672 E.01148
G1 X110.574 Y164.95 E.01148
G1 X110.812 Y165.295 E.01148
G1 X110.944 Y165.643 E.01017
M204 S10000
; WIPE_START
G1 F24000
G1 X110.994 Y165.956 E-.12032
G1 X111.012 Y166.104 E-.05679
G1 X110.961 Y166.521 E-.15946
G1 X110.812 Y166.913 E-.15946
G1 X110.574 Y167.258 E-.15946
G1 X110.368 Y167.441 E-.10452
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I1.051 J-.613 P1  F30000
G1 X108.586 Y164.386 Z4.8
G1 Z4.4
G1 E.8 F1800
M204 S5000
G1 F1460
G3 X109.641 Y164.291 I.686 J1.723 E.02936
G1 X109.769 Y164.312 E.00354
G3 X110.249 Y167.674 I-.508 J1.788 E.11712
G1 X110.142 Y167.747 E.00354
G3 X108.531 Y164.409 I-.87 J-1.638 E.16324
M204 S10000
; WIPE_START
G1 F24000
G1 X108.97 Y164.269 E-.17512
G1 X109.372 Y164.247 E-.1528
G1 X109.641 Y164.291 E-.10362
G1 X109.769 Y164.312 E-.04919
G1 X110.142 Y164.461 E-.15281
G1 X110.418 Y164.648 E-.12646
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I.442 J1.134 P1  F30000
G1 X136.46 Y154.509 Z4.8
G1 Z4.4
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X136.411 Y154.917 E.01124
G1 X136.262 Y155.309 E.01148
G1 X136.024 Y155.655 E.01148
G1 X135.71 Y155.933 E.01148
G1 X135.338 Y156.128 E.01148
G1 X134.931 Y156.228 E.01148
G1 X134.511 Y156.228 E.01148
G1 X134.103 Y156.128 E.01148
G1 X133.732 Y155.933 E.01148
G1 X133.418 Y155.655 E.01148
G1 X133.179 Y155.309 E.01148
G1 X133.031 Y154.917 E.01148
G1 X133.017 Y154.8 E.00321
G1 X132.98 Y154.5 E.00827
G1 X133.031 Y154.084 E.01148
G1 X133.179 Y153.691 E.01148
G1 X133.418 Y153.346 E.01148
G1 X133.732 Y153.068 E.01148
G1 X134.103 Y152.873 E.01148
G1 X134.511 Y152.772 E.01148
G1 X134.931 Y152.772 E.01148
G1 X135.338 Y152.873 E.01148
G1 X135.71 Y153.068 E.01148
G1 X136.024 Y153.346 E.01148
G1 X136.262 Y153.691 E.01148
G1 X136.411 Y154.084 E.01148
G1 X136.425 Y154.2 E.00321
G1 X136.455 Y154.449 E.00686
M204 S10000
; WIPE_START
G1 F24000
G1 X136.411 Y154.917 E-.1785
G1 X136.262 Y155.309 E-.15946
G1 X136.024 Y155.655 E-.15946
G1 X135.71 Y155.933 E-.15946
G1 X135.469 Y156.059 E-.10313
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I1.131 J-.45 P1  F30000
G1 X134.149 Y152.741 Z4.8
G1 Z4.4
G1 E.8 F1800
M204 S5000
G1 F1460
G3 X135.001 Y152.669 I.581 J1.789 E.02359
G3 X133.022 Y153.744 I-.286 J1.833 E.25259
G3 X134.093 Y152.761 I1.708 J.786 E.04081
M204 S10000
; WIPE_START
G1 F24000
G1 X134.526 Y152.651 E-.17007
G1 X134.915 Y152.651 E-.14774
G1 X135.001 Y152.669 E-.03351
G1 X135.295 Y152.732 E-.11423
G1 X135.651 Y152.89 E-.14774
G1 X135.963 Y153.117 E-.14672
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I1.216 J.037 P1  F30000
G1 X136.588 Y132.32 Z4.8
G1 Z4.4
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X136.539 Y132.728 E.01124
G1 X136.39 Y133.12 E.01148
G1 X136.152 Y133.465 E.01148
G1 X135.838 Y133.744 E.01148
G1 X135.466 Y133.939 E.01148
G1 X135.059 Y134.039 E.01148
G1 X134.639 Y134.039 E.01148
G1 X134.231 Y133.939 E.01148
G1 X133.86 Y133.744 E.01148
G1 X133.546 Y133.465 E.01148
G1 X133.307 Y133.12 E.01148
G1 X133.159 Y132.728 E.01148
G1 X133.145 Y132.611 E.00321
G1 X133.108 Y132.311 E.00827
G1 X133.159 Y131.894 E.01148
G1 X133.307 Y131.502 E.01148
G1 X133.546 Y131.157 E.01148
G1 X133.86 Y130.878 E.01148
G1 X134.231 Y130.683 E.01148
G1 X134.639 Y130.583 E.01148
G1 X135.059 Y130.583 E.01148
G1 X135.466 Y130.683 E.01148
G1 X135.838 Y130.878 E.01148
G1 X136.152 Y131.157 E.01148
G1 X136.39 Y131.502 E.01148
G1 X136.539 Y131.894 E.01148
G1 X136.553 Y132.011 E.00321
G1 X136.583 Y132.26 E.00686
M204 S10000
; WIPE_START
G1 F24000
G1 X136.539 Y132.728 E-.1785
G1 X136.39 Y133.12 E-.15946
G1 X136.152 Y133.465 E-.15946
G1 X135.838 Y133.744 E-.15946
G1 X135.597 Y133.87 E-.10313
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I1.131 J-.45 P1  F30000
G1 X134.277 Y130.552 Z4.8
G1 Z4.4
G1 E.8 F1800
M204 S5000
G1 F1460
G3 X135.129 Y130.48 I.581 J1.789 E.02359
G3 X133.15 Y131.555 I-.286 J1.833 E.25259
G3 X134.221 Y130.572 I1.708 J.786 E.04081
M204 S10000
; WIPE_START
G1 F24000
G1 X134.654 Y130.462 E-.17007
G1 X135.043 Y130.462 E-.14774
G1 X135.129 Y130.48 E-.03351
G1 X135.423 Y130.542 E-.11423
G1 X135.779 Y130.7 E-.14774
G1 X136.091 Y130.927 E-.14672
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I1.216 J.052 P1  F30000
G1 X136.858 Y112.833 Z4.8
G1 Z4.4
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X136.808 Y113.241 E.01124
G1 X136.659 Y113.634 E.01148
G1 X136.421 Y113.979 E.01148
G1 X136.107 Y114.257 E.01148
G1 X135.735 Y114.452 E.01148
G1 X135.328 Y114.553 E.01148
G1 X134.908 Y114.553 E.01148
G1 X134.501 Y114.452 E.01148
G1 X134.129 Y114.257 E.01148
G1 X133.815 Y113.979 E.01148
G1 X133.577 Y113.634 E.01148
G1 X133.428 Y113.241 E.01148
G1 X133.414 Y113.125 E.00321
G1 X133.377 Y112.825 E.00827
G1 X133.428 Y112.408 E.01148
G1 X133.577 Y112.016 E.01148
G1 X133.815 Y111.67 E.01148
G1 X134.129 Y111.392 E.01148
G1 X134.501 Y111.197 E.01148
G1 X134.908 Y111.097 E.01148
G1 X135.328 Y111.097 E.01148
G1 X135.735 Y111.197 E.01148
M73 P84 R1
G1 X136.107 Y111.392 E.01148
G1 X136.421 Y111.67 E.01148
G1 X136.659 Y112.016 E.01148
G1 X136.808 Y112.408 E.01148
G1 X136.822 Y112.524 E.00321
G1 X136.852 Y112.774 E.00686
M204 S10000
; WIPE_START
G1 F24000
G1 X136.808 Y113.241 E-.1785
G1 X136.659 Y113.634 E-.15946
G1 X136.421 Y113.979 E-.15946
G1 X136.107 Y114.257 E-.15946
G1 X135.867 Y114.383 E-.10313
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I1.131 J-.45 P1  F30000
G1 X134.547 Y111.066 Z4.8
G1 Z4.4
G1 E.8 F1800
M204 S5000
G1 F1460
G3 X135.399 Y110.994 I.581 J1.789 E.02359
G3 X133.419 Y112.068 I-.286 J1.833 E.25259
G3 X134.49 Y111.085 I1.708 J.786 E.04081
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 4.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X134.924 Y110.975 E-.17007
G1 X135.312 Y110.975 E-.14774
G1 X135.399 Y110.994 E-.03351
G1 X135.693 Y111.056 E-.11423
G1 X136.048 Y111.214 E-.14774
G1 X136.36 Y111.441 E-.14672
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
G3 Z4.8 I.631 J-1.04 P1  F30000
G1 X107.312 Y93.82 Z4.8
G1 Z4.6
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X107.345 Y94.09 E.00742
G1 X107.362 Y94.227 E.00377
G1 X107.311 Y94.643 E.01148
G1 X107.162 Y95.036 E.01148
G1 X106.924 Y95.381 E.01148
G1 X106.61 Y95.659 E.01148
G1 X106.238 Y95.854 E.01148
G1 X105.831 Y95.955 E.01148
G1 X105.411 Y95.955 E.01148
G1 X105.004 Y95.854 E.01148
G1 X104.632 Y95.659 E.01148
G1 X104.529 Y95.568 E.00377
G1 X104.318 Y95.381 E.0077
G1 X104.08 Y95.036 E.01148
G1 X103.931 Y94.643 E.01148
G1 X103.88 Y94.227 E.01148
G1 X103.931 Y93.81 E.01148
G1 X104.08 Y93.418 E.01148
G1 X104.318 Y93.072 E.01148
G1 X104.632 Y92.794 E.01148
G1 X105.004 Y92.599 E.01148
G1 X105.411 Y92.499 E.01148
G1 X105.831 Y92.499 E.01148
G1 X106.238 Y92.599 E.01148
G1 X106.61 Y92.794 E.01148
G1 X106.924 Y93.072 E.01148
G1 X107.162 Y93.418 E.01148
G1 X107.293 Y93.763 E.01011
M204 S10000
; WIPE_START
G1 F24000
G1 X107.345 Y94.09 E-.12549
G1 X107.362 Y94.227 E-.05242
G1 X107.311 Y94.643 E-.15946
G1 X107.162 Y95.036 E-.15946
G1 X106.924 Y95.381 E-.15946
G1 X106.72 Y95.562 E-.10371
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I1.051 J-.613 P1  F30000
G1 X104.933 Y92.5 Z5
G1 Z4.6
G1 E.8 F1800
M204 S5000
G1 F1460
G3 X105.722 Y92.37 I.689 J1.721 E.02203
G1 X106.004 Y92.416 E.00783
G1 X106.118 Y92.435 E.00317
G3 X104.878 Y92.523 I-.497 J1.786 E.28391
M204 S10000
; WIPE_START
G1 F24000
G1 X105.32 Y92.392 E-.17536
G1 X105.722 Y92.37 E-.1528
G1 X106.004 Y92.416 E-.1088
G1 X106.118 Y92.435 E-.04401
G1 X106.492 Y92.584 E-.1528
G1 X106.767 Y92.77 E-.12622
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I-1.19 J.255 P1  F30000
G1 X111.821 Y116.396 Z5
G1 Z4.6
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X111.854 Y116.666 E.00742
G1 X111.871 Y116.803 E.00377
G1 X111.82 Y117.219 E.01148
G1 X111.671 Y117.611 E.01148
G1 X111.433 Y117.957 E.01148
G1 X111.119 Y118.235 E.01148
G1 X110.747 Y118.43 E.01148
G1 X110.34 Y118.53 E.01148
G1 X109.92 Y118.53 E.01148
G1 X109.513 Y118.43 E.01148
G1 X109.141 Y118.235 E.01148
G1 X109.038 Y118.144 E.00377
G1 X108.827 Y117.957 E.0077
G1 X108.589 Y117.611 E.01148
G1 X108.44 Y117.219 E.01148
G1 X108.389 Y116.803 E.01148
G1 X108.44 Y116.386 E.01148
G1 X108.589 Y115.994 E.01148
G1 X108.827 Y115.648 E.01148
G1 X109.141 Y115.37 E.01148
G1 X109.513 Y115.175 E.01148
G1 X109.92 Y115.075 E.01148
G1 X110.34 Y115.075 E.01148
G1 X110.747 Y115.175 E.01148
G1 X111.119 Y115.37 E.01148
G1 X111.433 Y115.648 E.01148
G1 X111.671 Y115.994 E.01148
G1 X111.802 Y116.339 E.01011
M204 S10000
; WIPE_START
G1 F24000
G1 X111.854 Y116.666 E-.12549
G1 X111.871 Y116.803 E-.05242
G1 X111.82 Y117.219 E-.15946
G1 X111.671 Y117.611 E-.15946
G1 X111.433 Y117.957 E-.15946
G1 X111.229 Y118.138 E-.10371
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I1.051 J-.613 P1  F30000
G1 X109.442 Y115.076 Z5
G1 Z4.6
G1 E.8 F1800
M204 S5000
G1 F1460
G3 X110.231 Y114.946 I.689 J1.721 E.02203
G1 X110.513 Y114.992 E.00783
G1 X110.627 Y115.011 E.00317
G3 X109.387 Y115.099 I-.497 J1.786 E.28391
M204 S10000
; WIPE_START
G1 F24000
G1 X109.829 Y114.967 E-.17536
G1 X110.231 Y114.946 E-.1528
G1 X110.513 Y114.992 E-.1088
G1 X110.627 Y115.011 E-.04401
G1 X111.001 Y115.16 E-.1528
G1 X111.276 Y115.346 E-.12622
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I-1.217 J-.007 P1  F30000
G1 X111.128 Y140.05 Z5
G1 Z4.6
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X111.161 Y140.32 E.00742
G1 X111.178 Y140.457 E.00377
G1 X111.127 Y140.873 E.01148
G1 X110.978 Y141.266 E.01148
G1 X110.74 Y141.611 E.01148
G1 X110.426 Y141.889 E.01148
G1 X110.054 Y142.084 E.01148
G1 X109.647 Y142.185 E.01148
G1 X109.227 Y142.185 E.01148
G1 X108.82 Y142.084 E.01148
G1 X108.448 Y141.889 E.01148
G1 X108.345 Y141.798 E.00377
G1 X108.134 Y141.611 E.0077
G1 X107.896 Y141.266 E.01148
G1 X107.747 Y140.873 E.01148
G1 X107.696 Y140.457 E.01148
G1 X107.747 Y140.04 E.01148
G1 X107.896 Y139.648 E.01148
G1 X108.134 Y139.303 E.01148
G1 X108.448 Y139.024 E.01148
G1 X108.82 Y138.829 E.01148
G1 X109.227 Y138.729 E.01148
G1 X109.647 Y138.729 E.01148
G1 X110.054 Y138.829 E.01148
G1 X110.426 Y139.024 E.01148
G1 X110.74 Y139.303 E.01148
G1 X110.978 Y139.648 E.01148
G1 X111.109 Y139.994 E.01011
M204 S10000
; WIPE_START
G1 F24000
G1 X111.161 Y140.32 E-.12549
G1 X111.178 Y140.457 E-.05242
G1 X111.127 Y140.873 E-.15946
G1 X110.978 Y141.266 E-.15946
G1 X110.74 Y141.611 E-.15946
G1 X110.536 Y141.792 E-.10371
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I1.051 J-.613 P1  F30000
G1 X108.749 Y138.73 Z5
G1 Z4.6
G1 E.8 F1800
M204 S5000
G1 F1460
G3 X109.538 Y138.6 I.689 J1.721 E.02203
G1 X109.82 Y138.646 E.00783
G1 X109.934 Y138.665 E.00317
G3 X108.694 Y138.753 I-.497 J1.786 E.28391
M204 S10000
; WIPE_START
G1 F24000
G1 X109.136 Y138.622 E-.17536
G1 X109.538 Y138.6 E-.1528
G1 X109.82 Y138.646 E-.1088
G1 X109.934 Y138.665 E-.04401
G1 X110.308 Y138.814 E-.1528
G1 X110.583 Y139 E-.12622
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I-1.217 J.017 P1  F30000
G1 X110.962 Y165.698 Z5
G1 Z4.6
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X110.995 Y165.967 E.00742
G1 X111.012 Y166.104 E.00377
G1 X110.961 Y166.521 E.01148
G1 X110.812 Y166.913 E.01148
G1 X110.574 Y167.258 E.01148
G1 X110.26 Y167.537 E.01148
G1 X109.888 Y167.732 E.01148
G1 X109.481 Y167.832 E.01148
G1 X109.061 Y167.832 E.01148
G1 X108.654 Y167.732 E.01148
G1 X108.282 Y167.537 E.01148
G1 X108.179 Y167.445 E.00377
G1 X107.968 Y167.258 E.0077
G1 X107.73 Y166.913 E.01148
G1 X107.581 Y166.521 E.01148
G1 X107.53 Y166.104 E.01148
G1 X107.581 Y165.688 E.01148
G1 X107.73 Y165.295 E.01148
G1 X107.968 Y164.95 E.01148
G1 X108.282 Y164.672 E.01148
G1 X108.654 Y164.477 E.01148
G1 X109.061 Y164.376 E.01148
G1 X109.481 Y164.376 E.01148
G1 X109.888 Y164.477 E.01148
G1 X110.26 Y164.672 E.01148
G1 X110.574 Y164.95 E.01148
G1 X110.812 Y165.295 E.01148
G1 X110.943 Y165.641 E.01011
M204 S10000
; WIPE_START
G1 F24000
G1 X110.995 Y165.967 E-.12549
G1 X111.012 Y166.104 E-.05242
G1 X110.961 Y166.521 E-.15946
G1 X110.812 Y166.913 E-.15946
G1 X110.574 Y167.258 E-.15946
G1 X110.37 Y167.439 E-.10371
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I1.051 J-.613 P1  F30000
G1 X108.583 Y164.377 Z5
G1 Z4.6
G1 E.8 F1800
M204 S5000
G1 F1460
G3 X109.372 Y164.247 I.689 J1.721 E.02203
G1 X109.654 Y164.294 E.00783
G1 X109.769 Y164.312 E.00317
G3 X108.528 Y164.4 I-.497 J1.786 E.28391
M204 S10000
; WIPE_START
G1 F24000
G1 X108.97 Y164.269 E-.17536
G1 X109.372 Y164.247 E-.1528
G1 X109.654 Y164.294 E-.1088
G1 X109.769 Y164.312 E-.04401
G1 X110.142 Y164.461 E-.1528
G1 X110.417 Y164.647 E-.12622
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I.441 J1.134 P1  F30000
G1 X136.46 Y154.509 Z5
G1 Z4.6
G1 E.8 F1800
M204 S5000
G1 F1460
M73 P85 R1
G1 X136.411 Y154.917 E.01123
G1 X136.262 Y155.309 E.01148
G1 X136.024 Y155.655 E.01148
G1 X135.71 Y155.933 E.01148
G1 X135.338 Y156.128 E.01148
G1 X134.931 Y156.228 E.01148
G1 X134.511 Y156.228 E.01148
G1 X134.104 Y156.128 E.01148
G1 X133.732 Y155.933 E.01148
G1 X133.418 Y155.655 E.01148
G1 X133.179 Y155.309 E.01148
G1 X133.031 Y154.917 E.01148
G1 X132.98 Y154.5 E.01148
G1 X133.031 Y154.084 E.01148
G1 X133.179 Y153.691 E.01148
G1 X133.418 Y153.346 E.01148
G1 X133.732 Y153.068 E.01148
G1 X134.104 Y152.873 E.01148
G1 X134.511 Y152.772 E.01148
G1 X134.931 Y152.772 E.01148
G1 X135.338 Y152.873 E.01148
G1 X135.71 Y153.068 E.01148
G1 X136.024 Y153.346 E.01148
G1 X136.262 Y153.691 E.01148
G1 X136.411 Y154.084 E.01148
G1 X136.455 Y154.45 E.01008
M204 S10000
; WIPE_START
G1 F24000
G1 X136.411 Y154.917 E-.17837
G1 X136.262 Y155.309 E-.15946
G1 X136.024 Y155.655 E-.15946
G1 X135.71 Y155.933 E-.15946
G1 X135.469 Y156.059 E-.10326
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I1.131 J-.45 P1  F30000
G1 X134.147 Y152.733 Z5
G1 Z4.6
G1 E.8 F1800
M204 S5000
G1 F1460
G3 X134.987 Y152.666 I.564 J1.758 E.02326
G3 X133.216 Y153.407 I-.272 J1.835 E.26357
G3 X134.09 Y152.753 I1.494 J1.084 E.03031
M204 S10000
; WIPE_START
G1 F24000
G1 X134.526 Y152.651 E-.17029
G1 X134.915 Y152.651 E-.14774
G1 X134.987 Y152.666 E-.02784
G1 X135.295 Y152.732 E-.11989
G1 X135.651 Y152.89 E-.14774
G1 X135.962 Y153.116 E-.1465
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I1.216 J.037 P1  F30000
G1 X136.588 Y132.32 Z5
G1 Z4.6
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X136.539 Y132.728 E.01123
G1 X136.39 Y133.12 E.01148
G1 X136.152 Y133.465 E.01148
G1 X135.838 Y133.744 E.01148
G1 X135.466 Y133.939 E.01148
G1 X135.059 Y134.039 E.01148
G1 X134.639 Y134.039 E.01148
G1 X134.231 Y133.939 E.01148
G1 X133.86 Y133.744 E.01148
G1 X133.546 Y133.465 E.01148
G1 X133.307 Y133.12 E.01148
G1 X133.159 Y132.728 E.01148
G1 X133.108 Y132.311 E.01148
G1 X133.159 Y131.894 E.01148
G1 X133.307 Y131.502 E.01148
G1 X133.546 Y131.157 E.01148
G1 X133.86 Y130.878 E.01148
G1 X134.231 Y130.683 E.01148
G1 X134.639 Y130.583 E.01148
G1 X135.059 Y130.583 E.01148
G1 X135.466 Y130.683 E.01148
G1 X135.838 Y130.878 E.01148
G1 X136.152 Y131.157 E.01148
G1 X136.39 Y131.502 E.01148
G1 X136.539 Y131.894 E.01148
G1 X136.583 Y132.26 E.01008
M204 S10000
; WIPE_START
G1 F24000
G1 X136.539 Y132.728 E-.17837
G1 X136.39 Y133.12 E-.15946
G1 X136.152 Y133.465 E-.15946
G1 X135.838 Y133.744 E-.15946
G1 X135.597 Y133.87 E-.10326
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I1.131 J-.45 P1  F30000
G1 X134.275 Y130.544 Z5
G1 Z4.6
G1 E.8 F1800
M204 S5000
G1 F1460
G3 X135.115 Y130.477 I.564 J1.758 E.02326
G3 X133.344 Y131.218 I-.272 J1.835 E.26357
G3 X134.218 Y130.563 I1.494 J1.084 E.03031
M204 S10000
; WIPE_START
G1 F24000
G1 X134.654 Y130.462 E-.17029
G1 X135.043 Y130.462 E-.14774
G1 X135.115 Y130.477 E-.02784
G1 X135.423 Y130.542 E-.11989
G1 X135.779 Y130.7 E-.14774
G1 X136.09 Y130.927 E-.1465
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I1.216 J.052 P1  F30000
G1 X136.858 Y112.834 Z5
G1 Z4.6
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X136.808 Y113.241 E.01123
G1 X136.659 Y113.634 E.01148
G1 X136.421 Y113.979 E.01148
G1 X136.107 Y114.257 E.01148
G1 X135.735 Y114.452 E.01148
G1 X135.328 Y114.553 E.01148
G1 X134.908 Y114.553 E.01148
G1 X134.501 Y114.452 E.01148
G1 X134.129 Y114.257 E.01148
G1 X133.815 Y113.979 E.01148
G1 X133.577 Y113.634 E.01148
G1 X133.428 Y113.241 E.01148
G1 X133.377 Y112.825 E.01148
G1 X133.428 Y112.408 E.01148
G1 X133.577 Y112.016 E.01148
G1 X133.815 Y111.67 E.01148
G1 X134.129 Y111.392 E.01148
G1 X134.501 Y111.197 E.01148
G1 X134.908 Y111.097 E.01148
G1 X135.328 Y111.097 E.01148
G1 X135.735 Y111.197 E.01148
G1 X136.107 Y111.392 E.01148
G1 X136.421 Y111.67 E.01148
G1 X136.659 Y112.016 E.01148
G1 X136.808 Y112.408 E.01148
G1 X136.853 Y112.774 E.01008
M204 S10000
; WIPE_START
G1 F24000
G1 X136.808 Y113.241 E-.17837
G1 X136.659 Y113.634 E-.15946
G1 X136.421 Y113.979 E-.15946
G1 X136.107 Y114.257 E-.15946
G1 X135.866 Y114.383 E-.10326
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I1.131 J-.45 P1  F30000
G1 X134.544 Y111.058 Z5
G1 Z4.6
G1 E.8 F1800
M204 S5000
G1 F1460
G3 X135.384 Y110.99 I.564 J1.758 E.02326
G3 X133.613 Y111.732 I-.272 J1.835 E.26357
G3 X134.487 Y111.077 I1.494 J1.084 E.03031
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 4.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X134.924 Y110.975 E-.17029
G1 X135.312 Y110.975 E-.14774
G1 X135.384 Y110.99 E-.02784
G1 X135.693 Y111.056 E-.11989
G1 X136.048 Y111.214 E-.14774
G1 X136.36 Y111.441 E-.1465
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
G3 Z5 I.631 J-1.04 P1  F30000
G1 X107.312 Y93.818 Z5
G1 Z4.8
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X107.346 Y94.101 E.0078
G1 X107.362 Y94.227 E.00346
G1 X107.311 Y94.643 E.01148
G1 X107.162 Y95.036 E.01148
G1 X106.924 Y95.381 E.01148
G1 X106.61 Y95.659 E.01148
G1 X106.238 Y95.854 E.01148
G1 X105.831 Y95.955 E.01148
G1 X105.411 Y95.955 E.01148
G1 X105.004 Y95.854 E.01148
G1 X104.632 Y95.659 E.01148
G1 X104.318 Y95.381 E.01148
G1 X104.08 Y95.036 E.01148
G1 X103.931 Y94.643 E.01148
G1 X103.88 Y94.227 E.01148
G1 X103.931 Y93.81 E.01148
G1 X104.08 Y93.418 E.01148
G1 X104.318 Y93.072 E.01148
G1 X104.632 Y92.794 E.01148
G1 X105.004 Y92.599 E.01148
G1 X105.411 Y92.499 E.01148
G1 X105.831 Y92.499 E.01148
G1 X106.238 Y92.599 E.01148
G1 X106.61 Y92.794 E.01148
G1 X106.924 Y93.072 E.01148
G1 X107.162 Y93.418 E.01148
G1 X107.293 Y93.761 E.01006
M204 S10000
; WIPE_START
G1 F24000
G1 X107.346 Y94.101 E-.13065
G1 X107.362 Y94.227 E-.04805
G1 X107.311 Y94.643 E-.15946
G1 X107.162 Y95.036 E-.15946
G1 X106.924 Y95.381 E-.15946
G1 X106.721 Y95.56 E-.10292
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I1.051 J-.614 P1  F30000
G1 X104.936 Y92.507 Z5.2
G1 Z4.8
G1 E.8 F1800
M204 S5000
G1 F1460
G3 X106.018 Y92.418 I.687 J1.723 E.03012
G1 X106.118 Y92.435 E.00279
G3 X106.577 Y95.812 I-.509 J1.789 E.11787
G1 X106.492 Y95.87 E.00279
G3 X104.881 Y92.531 I-.869 J-1.639 E.16325
M204 S10000
; WIPE_START
G1 F24000
G1 X105.32 Y92.392 E-.17514
G1 X105.722 Y92.37 E-.1528
G1 X106.018 Y92.418 E-.11398
G1 X106.118 Y92.435 E-.03883
G1 X106.492 Y92.584 E-.1528
G1 X106.767 Y92.77 E-.12644
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I-1.19 J.255 P1  F30000
G1 X111.821 Y116.394 Z5.2
G1 Z4.8
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X111.855 Y116.677 E.0078
G1 X111.871 Y116.803 E.00346
G1 X111.82 Y117.219 E.01148
G1 X111.671 Y117.611 E.01148
G1 X111.433 Y117.957 E.01148
G1 X111.119 Y118.235 E.01148
G1 X110.747 Y118.43 E.01148
G1 X110.34 Y118.53 E.01148
G1 X109.92 Y118.53 E.01148
G1 X109.513 Y118.43 E.01148
G1 X109.141 Y118.235 E.01148
G1 X108.827 Y117.957 E.01148
G1 X108.589 Y117.611 E.01148
G1 X108.44 Y117.219 E.01148
G1 X108.389 Y116.803 E.01148
G1 X108.44 Y116.386 E.01148
G1 X108.589 Y115.994 E.01148
G1 X108.827 Y115.648 E.01148
G1 X109.141 Y115.37 E.01148
G1 X109.513 Y115.175 E.01148
G1 X109.92 Y115.075 E.01148
G1 X110.34 Y115.075 E.01148
G1 X110.747 Y115.175 E.01148
G1 X111.119 Y115.37 E.01148
G1 X111.433 Y115.648 E.01148
G1 X111.671 Y115.994 E.01148
G1 X111.802 Y116.337 E.01006
M204 S10000
; WIPE_START
G1 F24000
G1 X111.855 Y116.677 E-.13065
G1 X111.871 Y116.803 E-.04805
G1 X111.82 Y117.219 E-.15946
G1 X111.671 Y117.611 E-.15946
G1 X111.433 Y117.957 E-.15946
G1 X111.23 Y118.136 E-.10292
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I1.051 J-.614 P1  F30000
G1 X109.445 Y115.083 Z5.2
G1 Z4.8
G1 E.8 F1800
M204 S5000
G1 F1460
G3 X110.527 Y114.994 I.687 J1.723 E.03012
G1 X110.627 Y115.011 E.00279
G3 X111.086 Y118.388 I-.509 J1.789 E.11787
G1 X111.001 Y118.446 E.00279
G3 X109.39 Y115.106 I-.869 J-1.639 E.16325
M204 S10000
; WIPE_START
M73 P86 R1
G1 F24000
G1 X109.829 Y114.967 E-.17514
G1 X110.231 Y114.946 E-.1528
G1 X110.527 Y114.994 E-.11398
G1 X110.627 Y115.011 E-.03883
G1 X111.001 Y115.16 E-.1528
G1 X111.276 Y115.346 E-.12644
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I-1.217 J-.007 P1  F30000
G1 X111.128 Y140.048 Z5.2
G1 Z4.8
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X111.162 Y140.331 E.0078
G1 X111.178 Y140.457 E.00346
G1 X111.127 Y140.873 E.01148
G1 X110.978 Y141.266 E.01148
G1 X110.74 Y141.611 E.01148
G1 X110.426 Y141.889 E.01148
G1 X110.054 Y142.084 E.01148
G1 X109.647 Y142.185 E.01148
G1 X109.227 Y142.185 E.01148
G1 X108.82 Y142.084 E.01148
G1 X108.448 Y141.889 E.01148
G1 X108.134 Y141.611 E.01148
G1 X107.896 Y141.266 E.01148
G1 X107.747 Y140.873 E.01148
G1 X107.696 Y140.457 E.01148
G1 X107.747 Y140.04 E.01148
G1 X107.896 Y139.648 E.01148
G1 X108.134 Y139.303 E.01148
G1 X108.448 Y139.024 E.01148
G1 X108.82 Y138.829 E.01148
G1 X109.227 Y138.729 E.01148
G1 X109.647 Y138.729 E.01148
G1 X110.054 Y138.829 E.01148
G1 X110.426 Y139.024 E.01148
G1 X110.74 Y139.303 E.01148
G1 X110.978 Y139.648 E.01148
G1 X111.109 Y139.992 E.01006
M204 S10000
; WIPE_START
G1 F24000
G1 X111.162 Y140.331 E-.13065
G1 X111.178 Y140.457 E-.04805
G1 X111.127 Y140.873 E-.15946
G1 X110.978 Y141.266 E-.15946
G1 X110.74 Y141.611 E-.15946
G1 X110.537 Y141.791 E-.10292
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I1.051 J-.614 P1  F30000
G1 X108.752 Y138.738 Z5.2
G1 Z4.8
G1 E.8 F1800
M204 S5000
G1 F1460
G3 X109.834 Y138.649 I.687 J1.723 E.03012
G1 X109.934 Y138.665 E.00279
G3 X110.393 Y142.043 I-.509 J1.789 E.11787
G1 X110.308 Y142.1 E.00279
G3 X108.697 Y138.761 I-.869 J-1.639 E.16325
M204 S10000
; WIPE_START
G1 F24000
G1 X109.136 Y138.622 E-.17514
G1 X109.538 Y138.6 E-.1528
G1 X109.834 Y138.649 E-.11398
G1 X109.934 Y138.665 E-.03883
G1 X110.308 Y138.814 E-.1528
G1 X110.583 Y139.001 E-.12644
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I-1.217 J.017 P1  F30000
G1 X110.962 Y165.696 Z5.2
G1 Z4.8
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X110.996 Y165.979 E.0078
G1 X111.012 Y166.104 E.00346
G1 X110.961 Y166.521 E.01148
G1 X110.812 Y166.913 E.01148
G1 X110.574 Y167.258 E.01148
G1 X110.26 Y167.537 E.01148
G1 X109.888 Y167.732 E.01148
G1 X109.481 Y167.832 E.01148
G1 X109.061 Y167.832 E.01148
G1 X108.654 Y167.732 E.01148
G1 X108.282 Y167.537 E.01148
G1 X107.968 Y167.258 E.01148
G1 X107.73 Y166.913 E.01148
G1 X107.581 Y166.521 E.01148
G1 X107.53 Y166.104 E.01148
G1 X107.581 Y165.688 E.01148
G1 X107.73 Y165.295 E.01148
G1 X107.968 Y164.95 E.01148
G1 X108.282 Y164.672 E.01148
G1 X108.654 Y164.477 E.01148
G1 X109.061 Y164.376 E.01148
G1 X109.481 Y164.376 E.01148
G1 X109.888 Y164.477 E.01148
G1 X110.26 Y164.672 E.01148
G1 X110.574 Y164.95 E.01148
G1 X110.812 Y165.295 E.01148
G1 X110.943 Y165.639 E.01006
M204 S10000
; WIPE_START
G1 F24000
G1 X110.996 Y165.979 E-.13065
G1 X111.012 Y166.104 E-.04805
G1 X110.961 Y166.521 E-.15946
G1 X110.812 Y166.913 E-.15946
G1 X110.574 Y167.258 E-.15946
G1 X110.371 Y167.438 E-.10292
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I1.051 J-.614 P1  F30000
G1 X108.586 Y164.385 Z5.2
G1 Z4.8
G1 E.8 F1800
M204 S5000
G1 F1460
G3 X109.668 Y164.296 I.687 J1.723 E.03012
G1 X109.769 Y164.312 E.00279
G3 X110.227 Y167.69 I-.509 J1.789 E.11787
G1 X110.142 Y167.747 E.00279
G3 X108.531 Y164.408 I-.869 J-1.639 E.16325
M204 S10000
; WIPE_START
G1 F24000
G1 X108.97 Y164.269 E-.17514
G1 X109.372 Y164.247 E-.1528
G1 X109.668 Y164.296 E-.11398
G1 X109.769 Y164.312 E-.03883
G1 X110.142 Y164.461 E-.1528
G1 X110.418 Y164.648 E-.12644
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I.441 J1.134 P1  F30000
G1 X136.46 Y154.509 Z5.2
G1 Z4.8
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X136.411 Y154.917 E.01122
G1 X136.262 Y155.309 E.01148
G1 X136.024 Y155.655 E.01148
G1 X135.71 Y155.933 E.01148
G1 X135.338 Y156.128 E.01148
G1 X134.931 Y156.228 E.01148
G1 X134.511 Y156.228 E.01148
G1 X134.103 Y156.128 E.01148
G1 X133.732 Y155.933 E.01148
G1 X133.418 Y155.655 E.01148
G1 X133.179 Y155.309 E.01148
G1 X133.031 Y154.917 E.01148
G1 X133.02 Y154.826 E.00249
G1 X132.98 Y154.5 E.00898
G1 X133.031 Y154.084 E.01148
G1 X133.179 Y153.691 E.01148
G1 X133.418 Y153.346 E.01148
G1 X133.732 Y153.068 E.01148
G1 X134.104 Y152.873 E.01148
G1 X134.511 Y152.772 E.01148
G1 X134.931 Y152.772 E.01148
G1 X135.338 Y152.873 E.01148
G1 X135.71 Y153.068 E.01148
G1 X136.024 Y153.346 E.01148
G1 X136.262 Y153.691 E.01148
G1 X136.411 Y154.084 E.01148
G1 X136.422 Y154.174 E.00249
G1 X136.455 Y154.45 E.00759
M204 S10000
; WIPE_START
G1 F24000
G1 X136.411 Y154.917 E-.17825
G1 X136.262 Y155.309 E-.15946
G1 X136.024 Y155.655 E-.15946
G1 X135.71 Y155.933 E-.15946
G1 X135.469 Y156.059 E-.10338
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I1.131 J-.45 P1  F30000
G1 X134.149 Y152.741 Z5.2
G1 Z4.8
G1 E.8 F1800
M204 S5000
G1 F1460
G3 X134.972 Y152.663 I.59 J1.84 E.02279
G3 X133.476 Y153.118 I-.258 J1.837 E.27455
G3 X134.092 Y152.76 I1.263 J1.463 E.0196
M204 S10000
; WIPE_START
G1 F24000
G1 X134.526 Y152.651 E-.1701
G1 X134.972 Y152.663 E-.1695
G1 X135.295 Y152.732 E-.12556
G1 X135.651 Y152.89 E-.14774
G1 X135.964 Y153.117 E-.14711
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I1.216 J.037 P1  F30000
G1 X136.588 Y132.32 Z5.2
G1 Z4.8
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X136.539 Y132.728 E.01122
G1 X136.39 Y133.12 E.01148
G1 X136.152 Y133.465 E.01148
G1 X135.838 Y133.744 E.01148
G1 X135.466 Y133.939 E.01148
G1 X135.059 Y134.039 E.01148
G1 X134.639 Y134.039 E.01148
G1 X134.231 Y133.939 E.01148
G1 X133.86 Y133.744 E.01148
G1 X133.546 Y133.465 E.01148
G1 X133.307 Y133.12 E.01148
G1 X133.159 Y132.728 E.01148
G1 X133.148 Y132.637 E.00249
G1 X133.108 Y132.311 E.00898
G1 X133.159 Y131.894 E.01148
G1 X133.307 Y131.502 E.01148
G1 X133.546 Y131.157 E.01148
G1 X133.86 Y130.878 E.01148
G1 X134.231 Y130.683 E.01148
G1 X134.639 Y130.583 E.01148
G1 X135.059 Y130.583 E.01148
G1 X135.466 Y130.683 E.01148
G1 X135.838 Y130.878 E.01148
G1 X136.152 Y131.157 E.01148
G1 X136.39 Y131.502 E.01148
G1 X136.539 Y131.894 E.01148
G1 X136.55 Y131.985 E.00249
G1 X136.583 Y132.261 E.00759
M204 S10000
; WIPE_START
G1 F24000
G1 X136.539 Y132.728 E-.17825
G1 X136.39 Y133.12 E-.15946
G1 X136.152 Y133.465 E-.15946
G1 X135.838 Y133.744 E-.15946
G1 X135.597 Y133.87 E-.10338
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I1.131 J-.45 P1  F30000
G1 X134.277 Y130.552 Z5.2
G1 Z4.8
G1 E.8 F1800
M204 S5000
G1 F1460
G3 X135.1 Y130.474 I.59 J1.84 E.02279
G3 X133.604 Y130.929 I-.258 J1.837 E.27455
G3 X134.22 Y130.571 I1.263 J1.463 E.0196
M204 S10000
; WIPE_START
G1 F24000
G1 X134.654 Y130.462 E-.1701
G1 X135.1 Y130.474 E-.1695
G1 X135.423 Y130.542 E-.12556
G1 X135.779 Y130.7 E-.14774
G1 X136.092 Y130.928 E-.14711
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I1.216 J.051 P1  F30000
G1 X136.858 Y112.834 Z5.2
G1 Z4.8
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X136.808 Y113.241 E.01122
G1 X136.659 Y113.634 E.01148
G1 X136.421 Y113.979 E.01148
G1 X136.107 Y114.257 E.01148
G1 X135.735 Y114.452 E.01148
G1 X135.328 Y114.553 E.01148
G1 X134.908 Y114.553 E.01148
G1 X134.501 Y114.452 E.01148
G1 X134.129 Y114.257 E.01148
G1 X133.815 Y113.979 E.01148
G1 X133.577 Y113.634 E.01148
G1 X133.428 Y113.241 E.01148
G1 X133.417 Y113.151 E.00249
G1 X133.377 Y112.825 E.00898
G1 X133.428 Y112.408 E.01148
G1 X133.577 Y112.016 E.01148
G1 X133.815 Y111.67 E.01148
G1 X134.129 Y111.392 E.01148
G1 X134.501 Y111.197 E.01148
G1 X134.908 Y111.097 E.01148
G1 X135.328 Y111.097 E.01148
G1 X135.735 Y111.197 E.01148
G1 X136.107 Y111.392 E.01148
G1 X136.421 Y111.67 E.01148
G1 X136.659 Y112.016 E.01148
G1 X136.808 Y112.408 E.01148
G1 X136.819 Y112.499 E.00249
G1 X136.853 Y112.774 E.00759
M204 S10000
; WIPE_START
G1 F24000
G1 X136.808 Y113.241 E-.17825
G1 X136.659 Y113.634 E-.15946
G1 X136.421 Y113.979 E-.15946
G1 X136.107 Y114.257 E-.15946
G1 X135.866 Y114.384 E-.10338
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I1.131 J-.45 P1  F30000
G1 X134.546 Y111.065 Z5.2
G1 Z4.8
G1 E.8 F1800
M204 S5000
M73 P87 R1
G1 F1460
G3 X135.37 Y110.987 I.59 J1.84 E.02279
G3 X133.874 Y111.443 I-.258 J1.837 E.27455
G3 X134.49 Y111.085 I1.263 J1.463 E.0196
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 5
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X134.924 Y110.975 E-.1701
G1 X135.37 Y110.987 E-.1695
G1 X135.693 Y111.056 E-.12556
G1 X136.048 Y111.214 E-.14774
G1 X136.361 Y111.442 E-.14711
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
G3 Z5.2 I.631 J-1.04 P1  F30000
G1 X107.312 Y93.816 Z5.2
G1 Z5
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X107.348 Y94.113 E.00817
G1 X107.362 Y94.227 E.00314
G1 X107.311 Y94.643 E.01148
G1 X107.162 Y95.036 E.01148
G1 X106.924 Y95.381 E.01148
G1 X106.61 Y95.659 E.01148
G1 X106.238 Y95.854 E.01148
G1 X105.831 Y95.955 E.01148
G1 X105.411 Y95.955 E.01148
G1 X105.004 Y95.854 E.01148
G1 X104.632 Y95.659 E.01148
G1 X104.318 Y95.381 E.01148
G1 X104.08 Y95.036 E.01148
G1 X103.931 Y94.643 E.01148
G1 X103.88 Y94.227 E.01148
G1 X103.931 Y93.81 E.01148
G1 X104.08 Y93.418 E.01148
G1 X104.318 Y93.072 E.01148
G1 X104.632 Y92.794 E.01148
G1 X105.004 Y92.599 E.01148
G1 X105.411 Y92.499 E.01148
G1 X105.831 Y92.499 E.01148
G1 X106.238 Y92.599 E.01148
G1 X106.61 Y92.794 E.01148
G1 X106.924 Y93.072 E.01148
G1 X107.162 Y93.418 E.01148
G1 X107.292 Y93.76 E.01
M204 S10000
; WIPE_START
G1 F24000
G1 X107.348 Y94.113 E-.1358
G1 X107.362 Y94.227 E-.04368
G1 X107.311 Y94.643 E-.15946
G1 X107.162 Y95.036 E-.15946
G1 X106.924 Y95.381 E-.15946
G1 X106.723 Y95.559 E-.10215
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I1.05 J-.615 P1  F30000
G1 X104.936 Y92.507 Z5.4
G1 Z5
G1 E.8 F1800
M204 S5000
G1 F1460
G3 X106.031 Y92.42 I.687 J1.724 E.03051
G1 X106.118 Y92.435 E.00242
G3 X106.565 Y95.82 I-.51 J1.789 E.11825
G1 X106.492 Y95.87 E.00242
G3 X104.88 Y92.53 I-.87 J-1.639 E.16329
M204 S10000
; WIPE_START
G1 F24000
G1 X105.32 Y92.392 E-.17516
G1 X105.722 Y92.37 E-.1528
G1 X106.031 Y92.42 E-.11917
G1 X106.118 Y92.435 E-.03364
G1 X106.492 Y92.584 E-.15281
G1 X106.767 Y92.77 E-.12642
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I-1.19 J.255 P1  F30000
G1 X111.821 Y116.392 Z5.4
G1 Z5
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X111.857 Y116.688 E.00817
G1 X111.871 Y116.803 E.00314
G1 X111.82 Y117.219 E.01148
G1 X111.671 Y117.611 E.01148
G1 X111.433 Y117.957 E.01148
G1 X111.119 Y118.235 E.01148
G1 X110.747 Y118.43 E.01148
G1 X110.34 Y118.53 E.01148
G1 X109.92 Y118.53 E.01148
G1 X109.513 Y118.43 E.01148
G1 X109.141 Y118.235 E.01148
G1 X108.827 Y117.957 E.01148
G1 X108.589 Y117.611 E.01148
G1 X108.44 Y117.219 E.01148
G1 X108.389 Y116.803 E.01148
G1 X108.44 Y116.386 E.01148
G1 X108.589 Y115.994 E.01148
G1 X108.827 Y115.648 E.01148
G1 X109.141 Y115.37 E.01148
G1 X109.513 Y115.175 E.01148
G1 X109.92 Y115.075 E.01148
G1 X110.34 Y115.075 E.01148
G1 X110.747 Y115.175 E.01148
G1 X111.119 Y115.37 E.01148
G1 X111.433 Y115.648 E.01148
G1 X111.671 Y115.994 E.01148
G1 X111.801 Y116.335 E.01
M204 S10000
; WIPE_START
G1 F24000
G1 X111.857 Y116.688 E-.1358
G1 X111.871 Y116.803 E-.04368
G1 X111.82 Y117.219 E-.15946
G1 X111.671 Y117.611 E-.15946
G1 X111.433 Y117.957 E-.15946
G1 X111.232 Y118.135 E-.10215
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I1.05 J-.615 P1  F30000
G1 X109.445 Y115.083 Z5.4
G1 Z5
G1 E.8 F1800
M204 S5000
G1 F1460
G3 X110.54 Y114.996 I.687 J1.724 E.03051
G1 X110.627 Y115.011 E.00242
G3 X111.074 Y118.396 I-.51 J1.789 E.11825
G1 X111.001 Y118.446 E.00242
G3 X109.389 Y115.106 I-.87 J-1.639 E.16329
M204 S10000
; WIPE_START
G1 F24000
G1 X109.829 Y114.967 E-.17516
G1 X110.231 Y114.946 E-.1528
G1 X110.54 Y114.996 E-.11917
G1 X110.627 Y115.011 E-.03364
G1 X111.001 Y115.16 E-.15281
G1 X111.276 Y115.346 E-.12642
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I-1.217 J-.007 P1  F30000
G1 X111.128 Y140.046 Z5.4
G1 Z5
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X111.164 Y140.343 E.00817
G1 X111.178 Y140.457 E.00314
G1 X111.127 Y140.873 E.01148
G1 X110.978 Y141.266 E.01148
G1 X110.74 Y141.611 E.01148
G1 X110.426 Y141.889 E.01148
G1 X110.054 Y142.084 E.01148
G1 X109.647 Y142.185 E.01148
G1 X109.227 Y142.185 E.01148
G1 X108.82 Y142.084 E.01148
G1 X108.448 Y141.889 E.01148
G1 X108.134 Y141.611 E.01148
G1 X107.896 Y141.266 E.01148
G1 X107.747 Y140.873 E.01148
G1 X107.696 Y140.457 E.01148
G1 X107.747 Y140.04 E.01148
G1 X107.896 Y139.648 E.01148
G1 X108.134 Y139.303 E.01148
G1 X108.448 Y139.024 E.01148
G1 X108.82 Y138.829 E.01148
G1 X109.227 Y138.729 E.01148
G1 X109.647 Y138.729 E.01148
G1 X110.054 Y138.829 E.01148
G1 X110.426 Y139.024 E.01148
G1 X110.74 Y139.303 E.01148
G1 X110.978 Y139.648 E.01148
G1 X111.108 Y139.99 E.01
M204 S10000
; WIPE_START
G1 F24000
G1 X111.164 Y140.343 E-.1358
G1 X111.178 Y140.457 E-.04368
G1 X111.127 Y140.873 E-.15946
G1 X110.978 Y141.266 E-.15946
G1 X110.74 Y141.611 E-.15946
G1 X110.539 Y141.789 E-.10215
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I1.05 J-.615 P1  F30000
G1 X108.752 Y138.737 Z5.4
G1 Z5
G1 E.8 F1800
M204 S5000
G1 F1460
G3 X109.847 Y138.651 I.687 J1.724 E.03051
G1 X109.934 Y138.665 E.00242
G3 X110.381 Y142.05 I-.51 J1.789 E.11825
G1 X110.308 Y142.1 E.00242
G3 X108.696 Y138.76 I-.87 J-1.639 E.16329
M204 S10000
; WIPE_START
G1 F24000
G1 X109.136 Y138.622 E-.17516
G1 X109.538 Y138.6 E-.1528
G1 X109.847 Y138.651 E-.11917
G1 X109.934 Y138.665 E-.03364
G1 X110.308 Y138.814 E-.15281
G1 X110.583 Y139.001 E-.12642
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I-1.217 J.017 P1  F30000
G1 X110.962 Y165.693 Z5.4
G1 Z5
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X110.998 Y165.99 E.00817
G1 X111.012 Y166.104 E.00314
G1 X110.961 Y166.521 E.01148
G1 X110.812 Y166.913 E.01148
G1 X110.574 Y167.258 E.01148
G1 X110.26 Y167.537 E.01148
G1 X109.888 Y167.732 E.01148
G1 X109.481 Y167.832 E.01148
G1 X109.061 Y167.832 E.01148
G1 X108.654 Y167.732 E.01148
G1 X108.282 Y167.537 E.01148
G1 X107.968 Y167.258 E.01148
G1 X107.73 Y166.913 E.01148
G1 X107.581 Y166.521 E.01148
G1 X107.53 Y166.104 E.01148
G1 X107.581 Y165.688 E.01148
G1 X107.73 Y165.295 E.01148
G1 X107.968 Y164.95 E.01148
G1 X108.282 Y164.672 E.01148
G1 X108.654 Y164.477 E.01148
G1 X109.061 Y164.376 E.01148
G1 X109.481 Y164.376 E.01148
G1 X109.888 Y164.477 E.01148
G1 X110.26 Y164.672 E.01148
G1 X110.574 Y164.95 E.01148
G1 X110.812 Y165.295 E.01148
G1 X110.942 Y165.637 E.01
M204 S10000
; WIPE_START
G1 F24000
G1 X110.998 Y165.99 E-.1358
G1 X111.012 Y166.104 E-.04368
G1 X110.961 Y166.521 E-.15946
G1 X110.812 Y166.913 E-.15946
G1 X110.574 Y167.258 E-.15946
G1 X110.373 Y167.437 E-.10215
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I1.05 J-.615 P1  F30000
G1 X108.586 Y164.384 Z5.4
G1 Z5
G1 E.8 F1800
M204 S5000
G1 F1460
G3 X109.681 Y164.298 I.687 J1.724 E.03051
G1 X109.769 Y164.312 E.00242
G3 X110.215 Y167.697 I-.51 J1.789 E.11825
G1 X110.142 Y167.747 E.00242
G3 X108.531 Y164.407 I-.87 J-1.639 E.16329
M204 S10000
; WIPE_START
G1 F24000
G1 X108.97 Y164.269 E-.17516
G1 X109.372 Y164.247 E-.1528
G1 X109.681 Y164.298 E-.11917
G1 X109.769 Y164.312 E-.03364
G1 X110.142 Y164.461 E-.15281
G1 X110.418 Y164.648 E-.12642
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I.441 J1.134 P1  F30000
G1 X136.46 Y154.51 Z5.4
G1 Z5
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X136.411 Y154.917 E.01121
G1 X136.262 Y155.309 E.01148
G1 X136.024 Y155.655 E.01148
G1 X135.71 Y155.933 E.01148
G1 X135.338 Y156.128 E.01148
G1 X134.931 Y156.228 E.01148
G1 X134.511 Y156.228 E.01148
G1 X134.103 Y156.128 E.01148
G1 X133.732 Y155.933 E.01148
G1 X133.418 Y155.655 E.01148
G1 X133.179 Y155.309 E.01148
G1 X133.031 Y154.917 E.01148
G1 X132.98 Y154.5 E.01148
G1 X133.031 Y154.084 E.01148
G1 X133.179 Y153.691 E.01148
G1 X133.418 Y153.346 E.01148
G1 X133.732 Y153.068 E.01148
G1 X134.103 Y152.873 E.01148
G1 X134.511 Y152.772 E.01148
G1 X134.931 Y152.772 E.01148
G1 X135.338 Y152.873 E.01148
G1 X135.71 Y153.068 E.01148
G1 X136.024 Y153.346 E.01148
G1 X136.262 Y153.691 E.01148
G1 X136.411 Y154.084 E.01148
G1 X136.455 Y154.45 E.0101
M204 S10000
; WIPE_START
G1 F24000
G1 X136.411 Y154.917 E-.17813
G1 X136.262 Y155.309 E-.15946
G1 X136.024 Y155.655 E-.15946
M73 P88 R1
G1 X135.71 Y155.933 E-.15946
G1 X135.468 Y156.059 E-.1035
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I1.131 J-.45 P1  F30000
G1 X134.149 Y152.741 Z5.4
G1 Z5
G1 E.8 F1800
M204 S5000
G1 F1460
G3 X134.958 Y152.66 I.594 J1.849 E.02239
G3 X133.476 Y153.118 I-.242 J1.84 E.27513
G3 X134.092 Y152.76 I1.267 J1.472 E.01959
M204 S10000
; WIPE_START
G1 F24000
G1 X134.526 Y152.651 E-.17009
G1 X134.958 Y152.66 E-.16393
G1 X135.295 Y152.732 E-.13122
G1 X135.651 Y152.89 E-.14774
G1 X135.964 Y153.117 E-.14702
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I1.216 J.037 P1  F30000
G1 X136.588 Y132.321 Z5.4
G1 Z5
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X136.539 Y132.728 E.01121
G1 X136.39 Y133.12 E.01148
G1 X136.152 Y133.465 E.01148
G1 X135.838 Y133.744 E.01148
G1 X135.466 Y133.939 E.01148
G1 X135.059 Y134.039 E.01148
G1 X134.639 Y134.039 E.01148
G1 X134.231 Y133.939 E.01148
G1 X133.86 Y133.744 E.01148
G1 X133.546 Y133.465 E.01148
G1 X133.307 Y133.12 E.01148
G1 X133.159 Y132.728 E.01148
G1 X133.108 Y132.311 E.01148
G1 X133.159 Y131.894 E.01148
G1 X133.307 Y131.502 E.01148
G1 X133.546 Y131.157 E.01148
G1 X133.86 Y130.878 E.01148
G1 X134.231 Y130.683 E.01148
G1 X134.639 Y130.583 E.01148
G1 X135.059 Y130.583 E.01148
G1 X135.466 Y130.683 E.01148
G1 X135.838 Y130.878 E.01148
G1 X136.152 Y131.157 E.01148
G1 X136.39 Y131.502 E.01148
G1 X136.539 Y131.894 E.01148
G1 X136.583 Y132.261 E.0101
M204 S10000
; WIPE_START
G1 F24000
G1 X136.539 Y132.728 E-.17813
G1 X136.39 Y133.12 E-.15946
G1 X136.152 Y133.465 E-.15946
G1 X135.838 Y133.744 E-.15946
G1 X135.596 Y133.87 E-.1035
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I1.131 J-.45 P1  F30000
G1 X134.277 Y130.552 Z5.4
G1 Z5
G1 E.8 F1800
M204 S5000
G1 F1460
G3 X135.086 Y130.471 I.594 J1.849 E.02239
G3 X133.604 Y130.929 I-.242 J1.84 E.27513
G3 X134.22 Y130.571 I1.267 J1.472 E.01959
M204 S10000
; WIPE_START
G1 F24000
G1 X134.654 Y130.462 E-.17009
G1 X135.086 Y130.471 E-.16393
G1 X135.423 Y130.542 E-.13122
G1 X135.779 Y130.7 E-.14774
G1 X136.092 Y130.928 E-.14702
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I1.216 J.051 P1  F30000
G1 X136.858 Y112.834 Z5.4
G1 Z5
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X136.808 Y113.241 E.01121
G1 X136.659 Y113.634 E.01148
G1 X136.421 Y113.979 E.01148
G1 X136.107 Y114.257 E.01148
G1 X135.735 Y114.452 E.01148
G1 X135.328 Y114.553 E.01148
G1 X134.908 Y114.553 E.01148
G1 X134.501 Y114.452 E.01148
G1 X134.129 Y114.257 E.01148
G1 X133.815 Y113.979 E.01148
G1 X133.577 Y113.634 E.01148
G1 X133.428 Y113.241 E.01148
G1 X133.377 Y112.825 E.01148
G1 X133.428 Y112.408 E.01148
G1 X133.577 Y112.016 E.01148
G1 X133.815 Y111.67 E.01148
G1 X134.129 Y111.392 E.01148
G1 X134.501 Y111.197 E.01148
G1 X134.908 Y111.097 E.01148
G1 X135.328 Y111.097 E.01148
G1 X135.735 Y111.197 E.01148
G1 X136.107 Y111.392 E.01148
G1 X136.421 Y111.67 E.01148
G1 X136.659 Y112.016 E.01148
G1 X136.808 Y112.408 E.01148
G1 X136.853 Y112.775 E.0101
M204 S10000
; WIPE_START
G1 F24000
G1 X136.808 Y113.241 E-.17813
G1 X136.659 Y113.634 E-.15946
G1 X136.421 Y113.979 E-.15946
G1 X136.107 Y114.257 E-.15946
G1 X135.866 Y114.384 E-.1035
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I1.131 J-.45 P1  F30000
G1 X134.546 Y111.066 Z5.4
G1 Z5
G1 E.8 F1800
M204 S5000
G1 F1460
G3 X135.355 Y110.984 I.594 J1.849 E.02239
G3 X133.874 Y111.443 I-.242 J1.84 E.27513
G3 X134.49 Y111.085 I1.267 J1.472 E.01959
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 5.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X134.924 Y110.975 E-.17009
G1 X135.355 Y110.984 E-.16393
G1 X135.693 Y111.056 E-.13122
G1 X136.048 Y111.214 E-.14774
G1 X136.361 Y111.442 E-.14702
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
G3 Z5.4 I.631 J-1.04 P1  F30000
G1 X107.311 Y93.814 Z5.4
G1 Z5.2
G1 E.8 F1800
M204 S5000
G1 F1461
G1 X107.362 Y94.227 E.01137
G1 X107.311 Y94.643 E.01148
G1 X107.162 Y95.036 E.01148
G1 X106.924 Y95.381 E.01148
G1 X106.61 Y95.659 E.01148
G1 X106.238 Y95.854 E.01148
G1 X105.831 Y95.955 E.01148
G1 X105.411 Y95.955 E.01148
G1 X105.004 Y95.854 E.01148
G1 X104.632 Y95.659 E.01148
G1 X104.318 Y95.381 E.01148
G1 X104.08 Y95.036 E.01148
G1 X103.931 Y94.643 E.01148
G1 X103.88 Y94.227 E.01148
G1 X103.931 Y93.81 E.01148
G1 X104.08 Y93.418 E.01148
G1 X104.318 Y93.072 E.01148
G1 X104.632 Y92.794 E.01148
G1 X104.912 Y92.647 E.00865
G1 X105.004 Y92.599 E.00283
G1 X105.411 Y92.499 E.01148
G1 X105.831 Y92.499 E.01148
G1 X106.238 Y92.599 E.01148
G1 X106.61 Y92.794 E.01148
G1 X106.924 Y93.072 E.01148
G1 X107.162 Y93.418 E.01148
G1 X107.291 Y93.758 E.00994
M204 S10000
; WIPE_START
G1 F24000
G1 X107.362 Y94.227 E-.18021
G1 X107.311 Y94.643 E-.15946
G1 X107.162 Y95.036 E-.15946
G1 X106.924 Y95.381 E-.15946
G1 X106.724 Y95.558 E-.10142
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I1.05 J-.615 P1  F30000
G1 X104.933 Y92.499 Z5.6
G1 Z5.2
G1 E.8 F1800
M204 S5000
G1 F1461
G3 X105.722 Y92.37 I.688 J1.728 E.02204
G1 X106.045 Y92.423 E.00895
G1 X106.118 Y92.435 E.00205
G3 X104.877 Y92.522 I-.498 J1.792 E.28484
M204 S10000
; WIPE_START
G1 F24000
G1 X105.32 Y92.392 E-.17539
G1 X105.722 Y92.37 E-.1528
G1 X106.045 Y92.423 E-.12435
G1 X106.118 Y92.435 E-.02846
G1 X106.492 Y92.584 E-.1528
G1 X106.767 Y92.77 E-.12619
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I-1.19 J.255 P1  F30000
G1 X111.82 Y116.39 Z5.6
G1 Z5.2
G1 E.8 F1800
M204 S5000
G1 F1461
G1 X111.871 Y116.803 E.01137
G1 X111.82 Y117.219 E.01148
G1 X111.671 Y117.611 E.01148
G1 X111.433 Y117.957 E.01148
G1 X111.119 Y118.235 E.01148
G1 X110.747 Y118.43 E.01148
G1 X110.34 Y118.53 E.01148
G1 X109.92 Y118.53 E.01148
G1 X109.513 Y118.43 E.01148
G1 X109.141 Y118.235 E.01148
G1 X108.827 Y117.957 E.01148
G1 X108.589 Y117.611 E.01148
G1 X108.44 Y117.219 E.01148
G1 X108.389 Y116.803 E.01148
G1 X108.44 Y116.386 E.01148
G1 X108.589 Y115.994 E.01148
G1 X108.827 Y115.648 E.01148
G1 X109.141 Y115.37 E.01148
G1 X109.421 Y115.223 E.00865
G1 X109.513 Y115.175 E.00283
G1 X109.92 Y115.075 E.01148
G1 X110.34 Y115.075 E.01148
G1 X110.747 Y115.175 E.01148
G1 X111.119 Y115.37 E.01148
G1 X111.433 Y115.648 E.01148
G1 X111.671 Y115.994 E.01148
G1 X111.8 Y116.334 E.00994
M204 S10000
; WIPE_START
G1 F24000
G1 X111.871 Y116.803 E-.18021
G1 X111.82 Y117.219 E-.15946
G1 X111.671 Y117.611 E-.15946
G1 X111.433 Y117.957 E-.15946
G1 X111.233 Y118.134 E-.10142
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I1.05 J-.615 P1  F30000
G1 X109.442 Y115.075 Z5.6
G1 Z5.2
G1 E.8 F1800
M204 S5000
G1 F1461
G3 X110.231 Y114.946 I.688 J1.728 E.02204
G1 X110.553 Y114.999 E.00895
G1 X110.627 Y115.011 E.00205
G3 X109.386 Y115.098 I-.498 J1.792 E.28484
M204 S10000
; WIPE_START
G1 F24000
G1 X109.829 Y114.967 E-.17539
G1 X110.231 Y114.946 E-.1528
G1 X110.553 Y114.999 E-.12435
G1 X110.627 Y115.011 E-.02846
G1 X111.001 Y115.16 E-.1528
G1 X111.276 Y115.346 E-.12619
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I-1.217 J-.007 P1  F30000
G1 X111.127 Y140.044 Z5.6
G1 Z5.2
G1 E.8 F1800
M204 S5000
G1 F1461
G1 X111.178 Y140.457 E.01137
G1 X111.127 Y140.873 E.01148
G1 X110.978 Y141.266 E.01148
G1 X110.74 Y141.611 E.01148
G1 X110.426 Y141.889 E.01148
G1 X110.054 Y142.084 E.01148
G1 X109.647 Y142.185 E.01148
M73 P89 R1
G1 X109.227 Y142.185 E.01148
G1 X108.82 Y142.084 E.01148
G1 X108.448 Y141.889 E.01148
G1 X108.134 Y141.611 E.01148
G1 X107.896 Y141.266 E.01148
G1 X107.747 Y140.873 E.01148
G1 X107.696 Y140.457 E.01148
G1 X107.747 Y140.04 E.01148
G1 X107.896 Y139.648 E.01148
G1 X108.134 Y139.303 E.01148
G1 X108.448 Y139.024 E.01148
G1 X108.728 Y138.877 E.00865
G1 X108.82 Y138.829 E.00283
G1 X109.227 Y138.729 E.01148
G1 X109.647 Y138.729 E.01148
G1 X110.054 Y138.829 E.01148
G1 X110.426 Y139.024 E.01148
G1 X110.74 Y139.303 E.01148
G1 X110.978 Y139.648 E.01148
G1 X111.107 Y139.988 E.00994
M204 S10000
; WIPE_START
G1 F24000
G1 X111.178 Y140.457 E-.18021
G1 X111.127 Y140.873 E-.15946
G1 X110.978 Y141.266 E-.15946
G1 X110.74 Y141.611 E-.15946
G1 X110.54 Y141.788 E-.10142
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I1.05 J-.615 P1  F30000
G1 X108.749 Y138.729 Z5.6
G1 Z5.2
G1 E.8 F1800
M204 S5000
G1 F1461
G3 X109.538 Y138.6 I.688 J1.728 E.02204
G1 X109.861 Y138.653 E.00895
G1 X109.934 Y138.665 E.00205
G3 X108.693 Y138.752 I-.498 J1.792 E.28484
M204 S10000
; WIPE_START
G1 F24000
G1 X109.136 Y138.622 E-.17539
G1 X109.538 Y138.6 E-.1528
G1 X109.861 Y138.653 E-.12435
G1 X109.934 Y138.665 E-.02846
G1 X110.308 Y138.814 E-.1528
G1 X110.583 Y139 E-.12619
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I-1.217 J.017 P1  F30000
G1 X110.962 Y165.691 Z5.6
G1 Z5.2
G1 E.8 F1800
M204 S5000
G1 F1461
G1 X111.012 Y166.104 E.01137
G1 X110.961 Y166.521 E.01148
G1 X110.812 Y166.913 E.01148
G1 X110.574 Y167.258 E.01148
G1 X110.26 Y167.537 E.01148
G1 X109.888 Y167.732 E.01148
G1 X109.481 Y167.832 E.01148
G1 X109.061 Y167.832 E.01148
G1 X108.654 Y167.732 E.01148
G1 X108.282 Y167.537 E.01148
G1 X107.968 Y167.258 E.01148
G1 X107.73 Y166.913 E.01148
G1 X107.581 Y166.521 E.01148
G1 X107.53 Y166.104 E.01148
G1 X107.581 Y165.688 E.01148
G1 X107.73 Y165.295 E.01148
G1 X107.968 Y164.95 E.01148
G1 X108.282 Y164.672 E.01148
G1 X108.562 Y164.525 E.00865
G1 X108.654 Y164.477 E.00283
G1 X109.061 Y164.376 E.01148
G1 X109.481 Y164.376 E.01148
G1 X109.888 Y164.477 E.01148
G1 X110.26 Y164.672 E.01148
G1 X110.574 Y164.95 E.01148
G1 X110.812 Y165.295 E.01148
G1 X110.941 Y165.635 E.00994
M204 S10000
; WIPE_START
G1 F24000
G1 X111.012 Y166.104 E-.18021
G1 X110.961 Y166.521 E-.15946
G1 X110.812 Y166.913 E-.15946
G1 X110.574 Y167.258 E-.15946
G1 X110.374 Y167.435 E-.10142
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I1.05 J-.615 P1  F30000
G1 X108.583 Y164.377 Z5.6
G1 Z5.2
G1 E.8 F1800
M204 S5000
G1 F1461
G3 X109.372 Y164.247 I.688 J1.728 E.02204
G1 X109.695 Y164.3 E.00895
G1 X109.769 Y164.312 E.00205
G3 X108.528 Y164.4 I-.498 J1.792 E.28484
M204 S10000
; WIPE_START
G1 F24000
G1 X108.97 Y164.269 E-.17539
G1 X109.372 Y164.247 E-.1528
G1 X109.695 Y164.3 E-.12435
G1 X109.769 Y164.312 E-.02846
G1 X110.142 Y164.461 E-.1528
G1 X110.417 Y164.647 E-.12619
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I.441 J1.134 P1  F30000
G1 X136.46 Y154.51 Z5.6
G1 Z5.2
G1 E.8 F1800
M204 S5000
G1 F1461
G1 X136.454 Y154.565 E.00151
G1 X136.411 Y154.917 E.00969
G1 X136.262 Y155.309 E.01148
G1 X136.024 Y155.655 E.01148
G1 X135.71 Y155.933 E.01148
G1 X135.338 Y156.128 E.01148
G1 X134.931 Y156.228 E.01148
G1 X134.511 Y156.228 E.01148
G1 X134.103 Y156.128 E.01148
G1 X133.732 Y155.933 E.01148
G1 X133.418 Y155.655 E.01148
G1 X133.179 Y155.309 E.01148
G1 X133.031 Y154.917 E.01148
G1 X132.98 Y154.5 E.01148
G1 X132.988 Y154.436 E.00178
G1 X133.031 Y154.084 E.00969
G1 X133.179 Y153.691 E.01148
G1 X133.418 Y153.346 E.01148
G1 X133.732 Y153.068 E.01148
G1 X134.103 Y152.873 E.01148
G1 X134.511 Y152.772 E.01148
G1 X134.931 Y152.772 E.01148
G1 X135.338 Y152.873 E.01148
G1 X135.71 Y153.068 E.01148
G1 X136.024 Y153.346 E.01148
G1 X136.262 Y153.691 E.01148
G1 X136.411 Y154.084 E.01148
G1 X136.455 Y154.451 E.0101
M204 S10000
; WIPE_START
G1 F24000
G1 X136.454 Y154.565 E-.04352
G1 X136.411 Y154.917 E-.13467
G1 X136.262 Y155.309 E-.15946
G1 X136.024 Y155.655 E-.15946
G1 X135.71 Y155.933 E-.15946
G1 X135.469 Y156.059 E-.10344
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I1.131 J-.449 P1  F30000
G1 X134.146 Y152.732 Z5.6
G1 Z5.2
G1 E.8 F1800
M204 S5000
G1 F1461
G3 X134.943 Y152.657 I.566 J1.75 E.02207
G3 X133.791 Y152.89 I-.227 J1.84 E.28587
G3 X134.089 Y152.751 I.922 J1.592 E.00902
M204 S10000
; WIPE_START
G1 F24000
G1 X134.526 Y152.651 E-.17034
G1 X134.943 Y152.657 E-.15837
G1 X135.295 Y152.732 E-.13689
G1 X135.651 Y152.89 E-.14774
G1 X135.963 Y153.117 E-.14667
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I1.216 J.037 P1  F30000
G1 X136.588 Y132.321 Z5.6
G1 Z5.2
G1 E.8 F1800
M204 S5000
G1 F1461
G1 X136.582 Y132.376 E.00151
G1 X136.539 Y132.728 E.00969
G1 X136.39 Y133.12 E.01148
G1 X136.152 Y133.465 E.01148
G1 X135.838 Y133.744 E.01148
G1 X135.466 Y133.939 E.01148
G1 X135.059 Y134.039 E.01148
G1 X134.639 Y134.039 E.01148
G1 X134.231 Y133.939 E.01148
G1 X133.86 Y133.744 E.01148
G1 X133.546 Y133.465 E.01148
G1 X133.307 Y133.12 E.01148
G1 X133.159 Y132.728 E.01148
G1 X133.108 Y132.311 E.01148
G1 X133.116 Y132.246 E.00178
G1 X133.159 Y131.894 E.00969
G1 X133.307 Y131.502 E.01148
G1 X133.546 Y131.157 E.01148
G1 X133.86 Y130.878 E.01148
G1 X134.231 Y130.683 E.01148
G1 X134.639 Y130.583 E.01148
G1 X135.059 Y130.583 E.01148
G1 X135.466 Y130.683 E.01148
G1 X135.838 Y130.878 E.01148
G1 X136.152 Y131.157 E.01148
G1 X136.39 Y131.502 E.01148
G1 X136.539 Y131.894 E.01148
G1 X136.583 Y132.261 E.0101
M204 S10000
; WIPE_START
G1 F24000
G1 X136.582 Y132.376 E-.04352
G1 X136.539 Y132.728 E-.13467
G1 X136.39 Y133.12 E-.15946
G1 X136.152 Y133.465 E-.15946
G1 X135.838 Y133.744 E-.15946
G1 X135.596 Y133.87 E-.10344
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I1.131 J-.449 P1  F30000
G1 X134.274 Y130.542 Z5.6
G1 Z5.2
G1 E.8 F1800
M204 S5000
G1 F1461
G3 X135.071 Y130.467 I.566 J1.75 E.02207
G3 X133.919 Y130.7 I-.227 J1.84 E.28587
G3 X134.217 Y130.562 I.922 J1.592 E.00902
M204 S10000
; WIPE_START
G1 F24000
G1 X134.654 Y130.462 E-.17034
G1 X135.071 Y130.467 E-.15837
G1 X135.423 Y130.542 E-.13689
G1 X135.779 Y130.7 E-.14774
G1 X136.091 Y130.927 E-.14667
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I1.216 J.052 P1  F30000
G1 X136.857 Y112.834 Z5.6
G1 Z5.2
G1 E.8 F1800
M204 S5000
G1 F1461
G1 X136.851 Y112.889 E.00151
G1 X136.808 Y113.241 E.00969
G1 X136.659 Y113.634 E.01148
G1 X136.421 Y113.979 E.01148
G1 X136.107 Y114.257 E.01148
G1 X135.735 Y114.452 E.01148
G1 X135.328 Y114.553 E.01148
G1 X134.908 Y114.553 E.01148
G1 X134.501 Y114.452 E.01148
G1 X134.129 Y114.257 E.01148
G1 X133.815 Y113.979 E.01148
G1 X133.577 Y113.634 E.01148
G1 X133.428 Y113.241 E.01148
G1 X133.377 Y112.825 E.01148
G1 X133.385 Y112.76 E.00178
G1 X133.428 Y112.408 E.00969
G1 X133.577 Y112.016 E.01148
G1 X133.815 Y111.67 E.01148
G1 X134.129 Y111.392 E.01148
G1 X134.501 Y111.197 E.01148
G1 X134.908 Y111.097 E.01148
G1 X135.328 Y111.097 E.01148
G1 X135.735 Y111.197 E.01148
G1 X136.107 Y111.392 E.01148
G1 X136.421 Y111.67 E.01148
G1 X136.659 Y112.016 E.01148
G1 X136.808 Y112.408 E.01148
G1 X136.853 Y112.775 E.0101
M204 S10000
; WIPE_START
G1 F24000
G1 X136.851 Y112.889 E-.04352
G1 X136.808 Y113.241 E-.13467
G1 X136.659 Y113.634 E-.15946
G1 X136.421 Y113.979 E-.15946
G1 X136.107 Y114.257 E-.15946
G1 X135.866 Y114.384 E-.10344
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I1.131 J-.449 P1  F30000
G1 X134.543 Y111.056 Z5.6
G1 Z5.2
G1 E.8 F1800
M204 S5000
G1 F1461
G3 X135.34 Y110.981 I.566 J1.75 E.02207
G3 X134.188 Y111.214 I-.227 J1.84 E.28587
G3 X134.487 Y111.075 I.922 J1.592 E.00902
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 5.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X134.924 Y110.975 E-.17034
G1 X135.34 Y110.981 E-.15837
G1 X135.693 Y111.056 E-.13689
G1 X136.048 Y111.214 E-.14774
M73 P90 R1
G1 X136.36 Y111.441 E-.14667
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
G3 Z5.6 I.631 J-1.04 P1  F30000
G1 X107.311 Y93.812 Z5.6
G1 Z5.4
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X107.362 Y94.227 E.01142
G1 X107.311 Y94.643 E.01148
G1 X107.162 Y95.036 E.01148
G1 X106.924 Y95.381 E.01148
G1 X106.61 Y95.659 E.01148
G1 X106.238 Y95.854 E.01148
G1 X105.831 Y95.955 E.01148
G1 X105.411 Y95.955 E.01148
G1 X105.004 Y95.854 E.01148
G1 X104.632 Y95.659 E.01148
G1 X104.318 Y95.381 E.01148
G1 X104.08 Y95.036 E.01148
G1 X103.931 Y94.643 E.01148
G1 X103.92 Y94.552 E.00251
G1 X103.88 Y94.227 E.00896
G1 X103.931 Y93.81 E.01148
G1 X104.08 Y93.418 E.01148
G1 X104.318 Y93.072 E.01148
G1 X104.632 Y92.794 E.01148
G1 X105.004 Y92.599 E.01148
G1 X105.411 Y92.499 E.01148
G1 X105.831 Y92.499 E.01148
G1 X106.238 Y92.599 E.01148
G1 X106.61 Y92.794 E.01148
G1 X106.924 Y93.072 E.01148
G1 X107.162 Y93.418 E.01148
G1 X107.29 Y93.756 E.00989
M204 S10000
; WIPE_START
G1 F24000
G1 X107.362 Y94.227 E-.18094
G1 X107.311 Y94.643 E-.15946
G1 X107.162 Y95.036 E-.15946
G1 X106.924 Y95.381 E-.15946
G1 X106.726 Y95.557 E-.10068
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I1.05 J-.616 P1  F30000
G1 X104.935 Y92.505 Z5.8
G1 Z5.4
G1 E.8 F1800
M204 S5000
G1 F1460
G3 X106.058 Y92.425 I.687 J1.725 E.03128
G1 X106.118 Y92.435 E.00168
G3 X106.543 Y95.835 I-.511 J1.79 E.11902
G1 X106.492 Y95.87 E.00168
G3 X104.88 Y92.528 I-.87 J-1.64 E.16337
M204 S10000
; WIPE_START
G1 F24000
G1 X105.32 Y92.392 E-.17521
G1 X105.722 Y92.37 E-.1528
G1 X106.058 Y92.425 E-.12953
G1 X106.118 Y92.435 E-.02328
G1 X106.492 Y92.584 E-.15281
G1 X106.767 Y92.77 E-.12637
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I-1.19 J.255 P1  F30000
G1 X111.82 Y116.388 Z5.8
G1 Z5.4
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X111.871 Y116.803 E.01142
G1 X111.82 Y117.219 E.01148
G1 X111.671 Y117.611 E.01148
G1 X111.433 Y117.957 E.01148
G1 X111.119 Y118.235 E.01148
G1 X110.747 Y118.43 E.01148
G1 X110.34 Y118.53 E.01148
G1 X109.92 Y118.53 E.01148
G1 X109.513 Y118.43 E.01148
G1 X109.141 Y118.235 E.01148
G1 X108.827 Y117.957 E.01148
G1 X108.589 Y117.611 E.01148
G1 X108.44 Y117.219 E.01148
G1 X108.429 Y117.128 E.00251
G1 X108.389 Y116.803 E.00896
G1 X108.44 Y116.386 E.01148
G1 X108.589 Y115.994 E.01148
G1 X108.827 Y115.648 E.01148
G1 X109.141 Y115.37 E.01148
G1 X109.513 Y115.175 E.01148
G1 X109.92 Y115.075 E.01148
G1 X110.34 Y115.075 E.01148
G1 X110.747 Y115.175 E.01148
G1 X111.119 Y115.37 E.01148
G1 X111.433 Y115.648 E.01148
G1 X111.671 Y115.994 E.01148
G1 X111.799 Y116.332 E.00989
M204 S10000
; WIPE_START
G1 F24000
G1 X111.871 Y116.803 E-.18094
G1 X111.82 Y117.219 E-.15946
G1 X111.671 Y117.611 E-.15946
G1 X111.433 Y117.957 E-.15946
G1 X111.234 Y118.132 E-.10068
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I1.05 J-.616 P1  F30000
G1 X109.444 Y115.081 Z5.8
G1 Z5.4
G1 E.8 F1800
M204 S5000
G1 F1460
G3 X110.567 Y115.001 I.687 J1.725 E.03128
G1 X110.627 Y115.011 E.00168
G3 X111.052 Y118.411 I-.511 J1.79 E.11902
G1 X111.001 Y118.446 E.00168
G3 X109.389 Y115.104 I-.87 J-1.64 E.16337
M204 S10000
; WIPE_START
G1 F24000
G1 X109.829 Y114.967 E-.17521
G1 X110.231 Y114.946 E-.1528
G1 X110.567 Y115.001 E-.12953
G1 X110.627 Y115.011 E-.02328
G1 X111.001 Y115.16 E-.15281
G1 X111.276 Y115.346 E-.12637
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I-1.217 J-.007 P1  F30000
G1 X111.127 Y140.042 Z5.8
G1 Z5.4
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X111.178 Y140.457 E.01142
G1 X111.127 Y140.873 E.01148
G1 X110.978 Y141.266 E.01148
G1 X110.74 Y141.611 E.01148
G1 X110.426 Y141.889 E.01148
G1 X110.054 Y142.084 E.01148
G1 X109.647 Y142.185 E.01148
G1 X109.227 Y142.185 E.01148
G1 X108.82 Y142.084 E.01148
G1 X108.448 Y141.889 E.01148
G1 X108.134 Y141.611 E.01148
G1 X107.896 Y141.266 E.01148
G1 X107.747 Y140.873 E.01148
G1 X107.736 Y140.782 E.00251
G1 X107.696 Y140.457 E.00896
G1 X107.747 Y140.04 E.01148
G1 X107.896 Y139.648 E.01148
G1 X108.134 Y139.303 E.01148
G1 X108.448 Y139.024 E.01148
G1 X108.82 Y138.829 E.01148
G1 X109.227 Y138.729 E.01148
G1 X109.647 Y138.729 E.01148
G1 X110.054 Y138.829 E.01148
G1 X110.426 Y139.024 E.01148
G1 X110.74 Y139.303 E.01148
G1 X110.978 Y139.648 E.01148
G1 X111.106 Y139.986 E.00989
M204 S10000
; WIPE_START
G1 F24000
G1 X111.178 Y140.457 E-.18094
G1 X111.127 Y140.873 E-.15946
G1 X110.978 Y141.266 E-.15946
G1 X110.74 Y141.611 E-.15946
G1 X110.541 Y141.787 E-.10068
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I1.05 J-.616 P1  F30000
G1 X108.751 Y138.735 Z5.8
G1 Z5.4
G1 E.8 F1800
M204 S5000
G1 F1460
G3 X109.874 Y138.655 I.687 J1.725 E.03128
G1 X109.934 Y138.665 E.00168
G3 X110.359 Y142.066 I-.511 J1.79 E.11902
G1 X110.308 Y142.1 E.00168
G3 X108.696 Y138.758 I-.87 J-1.64 E.16337
M204 S10000
; WIPE_START
G1 F24000
G1 X109.136 Y138.622 E-.17521
G1 X109.538 Y138.6 E-.1528
G1 X109.874 Y138.655 E-.12953
G1 X109.934 Y138.665 E-.02328
G1 X110.308 Y138.814 E-.15281
G1 X110.583 Y139.001 E-.12637
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I-1.217 J.017 P1  F30000
G1 X110.961 Y165.689 Z5.8
G1 Z5.4
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X111.012 Y166.104 E.01142
G1 X110.961 Y166.521 E.01148
G1 X110.812 Y166.913 E.01148
G1 X110.574 Y167.258 E.01148
G1 X110.26 Y167.537 E.01148
G1 X109.888 Y167.732 E.01148
G1 X109.481 Y167.832 E.01148
G1 X109.061 Y167.832 E.01148
G1 X108.654 Y167.732 E.01148
G1 X108.282 Y167.537 E.01148
G1 X107.968 Y167.258 E.01148
G1 X107.73 Y166.913 E.01148
G1 X107.581 Y166.521 E.01148
G1 X107.57 Y166.429 E.00251
G1 X107.53 Y166.104 E.00896
G1 X107.581 Y165.688 E.01148
G1 X107.73 Y165.295 E.01148
G1 X107.968 Y164.95 E.01148
G1 X108.282 Y164.672 E.01148
G1 X108.654 Y164.477 E.01148
G1 X109.061 Y164.376 E.01148
G1 X109.481 Y164.376 E.01148
G1 X109.888 Y164.477 E.01148
G1 X110.26 Y164.672 E.01148
G1 X110.574 Y164.95 E.01148
G1 X110.812 Y165.295 E.01148
G1 X110.941 Y165.633 E.00989
M204 S10000
; WIPE_START
G1 F24000
G1 X111.012 Y166.104 E-.18094
G1 X110.961 Y166.521 E-.15946
G1 X110.812 Y166.913 E-.15946
G1 X110.574 Y167.258 E-.15946
G1 X110.376 Y167.434 E-.10068
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I1.05 J-.616 P1  F30000
G1 X108.585 Y164.382 Z5.8
G1 Z5.4
G1 E.8 F1800
M204 S5000
G1 F1460
G3 X109.708 Y164.302 I.687 J1.725 E.03128
G1 X109.769 Y164.312 E.00168
G3 X110.193 Y167.713 I-.511 J1.79 E.11902
G1 X110.142 Y167.747 E.00168
G3 X108.53 Y164.405 I-.87 J-1.64 E.16337
M204 S10000
; WIPE_START
G1 F24000
G1 X108.97 Y164.269 E-.17521
G1 X109.372 Y164.247 E-.1528
G1 X109.708 Y164.302 E-.12953
G1 X109.769 Y164.312 E-.02328
G1 X110.142 Y164.461 E-.15281
G1 X110.417 Y164.648 E-.12637
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I.441 J1.134 P1  F30000
G1 X136.46 Y154.51 Z5.8
G1 Z5.4
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X136.411 Y154.917 E.01121
G1 X136.262 Y155.309 E.01148
G1 X136.024 Y155.655 E.01148
G1 X135.663 Y155.957 E.01287
G1 X135.338 Y156.128 E.01005
G1 X134.931 Y156.228 E.01148
G1 X134.511 Y156.228 E.01148
G1 X134.104 Y156.128 E.01148
G1 X133.732 Y155.933 E.01148
G1 X133.418 Y155.655 E.01148
G1 X133.179 Y155.309 E.01148
G1 X133.024 Y154.865 E.01287
G1 X132.98 Y154.5 E.01005
G1 X133.031 Y154.084 E.01148
G1 X133.179 Y153.691 E.01148
G1 X133.418 Y153.346 E.01148
G1 X133.778 Y153.043 E.01287
G1 X134.104 Y152.873 E.01005
G1 X134.511 Y152.772 E.01148
G1 X134.931 Y152.772 E.01148
G1 X135.338 Y152.873 E.01148
G1 X135.71 Y153.068 E.01148
G1 X136.024 Y153.346 E.01148
G1 X136.262 Y153.691 E.01148
G1 X136.417 Y154.136 E.01287
G1 X136.455 Y154.45 E.00867
M204 S10000
; WIPE_START
G1 F24000
G1 X136.411 Y154.917 E-.17805
G1 X136.262 Y155.309 E-.15946
G1 X136.024 Y155.655 E-.15946
G1 X135.663 Y155.957 E-.17879
G1 X135.467 Y156.06 E-.08425
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I1.131 J-.449 P1  F30000
G1 X134.146 Y152.732 Z5.8
G1 Z5.4
G1 E.8 F1800
M204 S5000
G1 F1460
G3 X134.928 Y152.654 I.569 J1.74 E.02167
M73 P91 R1
G3 X134.089 Y152.751 I-.211 J1.844 E.29564
M204 S10000
; WIPE_START
G1 F24000
G1 X134.526 Y152.651 E-.17034
G1 X134.928 Y152.654 E-.15281
G1 X135.295 Y152.732 E-.14255
G1 X135.651 Y152.89 E-.14774
G1 X135.963 Y153.116 E-.14656
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I1.216 J.037 P1  F30000
G1 X136.588 Y132.321 Z5.8
G1 Z5.4
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X136.539 Y132.728 E.01121
G1 X136.39 Y133.12 E.01148
G1 X136.152 Y133.465 E.01148
G1 X135.791 Y133.768 E.01287
G1 X135.466 Y133.939 E.01005
G1 X135.059 Y134.039 E.01148
G1 X134.639 Y134.039 E.01148
G1 X134.231 Y133.939 E.01148
G1 X133.86 Y133.744 E.01148
G1 X133.546 Y133.465 E.01148
G1 X133.307 Y133.12 E.01148
G1 X133.152 Y132.676 E.01287
G1 X133.108 Y132.311 E.01005
G1 X133.159 Y131.894 E.01148
G1 X133.307 Y131.502 E.01148
G1 X133.546 Y131.157 E.01148
G1 X133.906 Y130.854 E.01287
G1 X134.231 Y130.683 E.01005
G1 X134.639 Y130.583 E.01148
G1 X135.059 Y130.583 E.01148
G1 X135.466 Y130.683 E.01148
G1 X135.838 Y130.878 E.01148
G1 X136.152 Y131.157 E.01148
G1 X136.39 Y131.502 E.01148
G1 X136.545 Y131.946 E.01287
G1 X136.583 Y132.261 E.00867
M204 S10000
; WIPE_START
G1 F24000
G1 X136.539 Y132.728 E-.17805
G1 X136.39 Y133.12 E-.15946
G1 X136.152 Y133.465 E-.15946
G1 X135.791 Y133.768 E-.17879
G1 X135.595 Y133.871 E-.08425
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I1.131 J-.449 P1  F30000
G1 X134.274 Y130.542 Z5.8
G1 Z5.4
G1 E.8 F1800
M204 S5000
G1 F1460
G3 X135.056 Y130.464 I.569 J1.74 E.02167
G3 X134.217 Y130.562 I-.211 J1.844 E.29564
M204 S10000
; WIPE_START
G1 F24000
G1 X134.654 Y130.462 E-.17034
G1 X135.056 Y130.464 E-.15281
G1 X135.423 Y130.542 E-.14255
G1 X135.779 Y130.7 E-.14774
G1 X136.091 Y130.927 E-.14656
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I1.216 J.052 P1  F30000
G1 X136.857 Y112.834 Z5.8
G1 Z5.4
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X136.808 Y113.241 E.01121
M73 P91 R0
G1 X136.659 Y113.634 E.01148
G1 X136.421 Y113.979 E.01148
G1 X136.061 Y114.281 E.01287
G1 X135.735 Y114.452 E.01005
G1 X135.328 Y114.553 E.01148
G1 X134.908 Y114.553 E.01148
G1 X134.501 Y114.452 E.01148
G1 X134.129 Y114.257 E.01148
G1 X133.815 Y113.979 E.01148
G1 X133.577 Y113.634 E.01148
G1 X133.422 Y113.189 E.01287
G1 X133.377 Y112.825 E.01005
G1 X133.428 Y112.408 E.01148
G1 X133.577 Y112.016 E.01148
G1 X133.815 Y111.67 E.01148
G1 X134.175 Y111.368 E.01287
G1 X134.501 Y111.197 E.01005
G1 X134.908 Y111.097 E.01148
G1 X135.328 Y111.097 E.01148
G1 X135.735 Y111.197 E.01148
G1 X136.107 Y111.392 E.01148
G1 X136.421 Y111.67 E.01148
G1 X136.659 Y112.016 E.01148
G1 X136.814 Y112.46 E.01287
G1 X136.853 Y112.775 E.00867
M204 S10000
; WIPE_START
G1 F24000
G1 X136.808 Y113.241 E-.17805
G1 X136.659 Y113.634 E-.15946
G1 X136.421 Y113.979 E-.15946
G1 X136.061 Y114.281 E-.17879
G1 X135.864 Y114.385 E-.08425
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I1.131 J-.449 P1  F30000
G1 X134.543 Y111.056 Z5.8
G1 Z5.4
G1 E.8 F1800
M204 S5000
G1 F1460
G3 X135.326 Y110.978 I.569 J1.74 E.02167
G3 X134.487 Y111.075 I-.211 J1.844 E.29564
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 5.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X134.924 Y110.975 E-.17034
G1 X135.326 Y110.978 E-.15281
G1 X135.693 Y111.056 E-.14255
G1 X136.048 Y111.214 E-.14774
G1 X136.36 Y111.441 E-.14656
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
G3 Z5.8 I.631 J-1.04 P1  F30000
G1 X107.311 Y93.81 Z5.8
G1 Z5.6
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X107.352 Y94.147 E.00927
G1 X107.362 Y94.227 E.0022
G1 X107.311 Y94.643 E.01148
G1 X107.162 Y95.036 E.01148
G1 X106.924 Y95.381 E.01148
G1 X106.61 Y95.659 E.01148
G1 X106.238 Y95.854 E.01148
G1 X105.831 Y95.955 E.01148
G1 X105.411 Y95.955 E.01148
G1 X105.004 Y95.854 E.01148
G1 X104.632 Y95.659 E.01148
G1 X104.318 Y95.381 E.01148
G1 X104.08 Y95.036 E.01148
G1 X103.931 Y94.643 E.01148
G1 X103.88 Y94.227 E.01148
G1 X103.931 Y93.81 E.01148
G1 X104.08 Y93.418 E.01148
G1 X104.318 Y93.072 E.01148
G1 X104.632 Y92.794 E.01148
G1 X105.004 Y92.599 E.01148
G1 X105.411 Y92.499 E.01148
G1 X105.831 Y92.499 E.01148
G1 X106.238 Y92.599 E.01148
G1 X106.61 Y92.794 E.01148
G1 X106.924 Y93.072 E.01148
G1 X107.162 Y93.418 E.01148
G1 X107.29 Y93.754 E.00983
M204 S10000
; WIPE_START
G1 F24000
G1 X107.352 Y94.147 E-.15112
G1 X107.362 Y94.227 E-.03058
G1 X107.311 Y94.643 E-.15946
G1 X107.162 Y95.036 E-.15946
G1 X106.924 Y95.381 E-.15946
G1 X106.727 Y95.555 E-.09994
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I1.049 J-.616 P1  F30000
G1 X104.933 Y92.5 Z6
G1 Z5.6
G1 E.8 F1800
M204 S5000
G1 F1460
G3 X105.722 Y92.37 I.689 J1.721 E.02203
G1 X106.071 Y92.427 E.00969
G1 X106.118 Y92.435 E.0013
G3 X104.878 Y92.523 I-.497 J1.786 E.28391
M204 S10000
; WIPE_START
G1 F24000
G1 X105.32 Y92.392 E-.17537
G1 X105.722 Y92.37 E-.1528
G1 X106.071 Y92.427 E-.13471
G1 X106.118 Y92.435 E-.01809
G1 X106.492 Y92.584 E-.15281
G1 X106.767 Y92.77 E-.12622
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I-1.19 J.255 P1  F30000
G1 X111.82 Y116.386 Z6
G1 Z5.6
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X111.861 Y116.723 E.00927
G1 X111.871 Y116.803 E.0022
G1 X111.82 Y117.219 E.01148
G1 X111.671 Y117.611 E.01148
G1 X111.433 Y117.957 E.01148
G1 X111.119 Y118.235 E.01148
G1 X110.747 Y118.43 E.01148
G1 X110.34 Y118.53 E.01148
G1 X109.92 Y118.53 E.01148
G1 X109.513 Y118.43 E.01148
G1 X109.141 Y118.235 E.01148
G1 X108.827 Y117.957 E.01148
G1 X108.589 Y117.611 E.01148
G1 X108.44 Y117.219 E.01148
G1 X108.389 Y116.803 E.01148
G1 X108.44 Y116.386 E.01148
G1 X108.589 Y115.994 E.01148
G1 X108.827 Y115.648 E.01148
G1 X109.141 Y115.37 E.01148
G1 X109.513 Y115.175 E.01148
G1 X109.92 Y115.075 E.01148
G1 X110.34 Y115.075 E.01148
G1 X110.747 Y115.175 E.01148
G1 X111.119 Y115.37 E.01148
G1 X111.433 Y115.648 E.01148
G1 X111.671 Y115.994 E.01148
G1 X111.799 Y116.33 E.00983
M204 S10000
; WIPE_START
G1 F24000
G1 X111.861 Y116.723 E-.15112
G1 X111.871 Y116.803 E-.03058
G1 X111.82 Y117.219 E-.15946
G1 X111.671 Y117.611 E-.15946
G1 X111.433 Y117.957 E-.15946
G1 X111.236 Y118.131 E-.09994
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I1.049 J-.616 P1  F30000
G1 X109.442 Y115.076 Z6
G1 Z5.6
G1 E.8 F1800
M204 S5000
G1 F1460
G3 X110.231 Y114.946 I.689 J1.721 E.02203
G1 X110.58 Y115.003 E.00969
G1 X110.627 Y115.011 E.0013
G3 X109.387 Y115.099 I-.497 J1.786 E.28391
M204 S10000
; WIPE_START
G1 F24000
G1 X109.829 Y114.967 E-.17537
G1 X110.231 Y114.946 E-.1528
G1 X110.58 Y115.003 E-.13471
G1 X110.627 Y115.011 E-.01809
G1 X111.001 Y115.16 E-.15281
G1 X111.276 Y115.346 E-.12622
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I-1.217 J-.007 P1  F30000
G1 X111.127 Y140.04 Z6
G1 Z5.6
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X111.168 Y140.377 E.00927
G1 X111.178 Y140.457 E.0022
G1 X111.127 Y140.873 E.01148
G1 X110.978 Y141.266 E.01148
G1 X110.74 Y141.611 E.01148
G1 X110.426 Y141.889 E.01148
G1 X110.054 Y142.084 E.01148
G1 X109.647 Y142.185 E.01148
G1 X109.227 Y142.185 E.01148
G1 X108.82 Y142.084 E.01148
G1 X108.448 Y141.889 E.01148
G1 X108.134 Y141.611 E.01148
G1 X107.896 Y141.266 E.01148
G1 X107.747 Y140.873 E.01148
G1 X107.696 Y140.457 E.01148
G1 X107.747 Y140.04 E.01148
G1 X107.896 Y139.648 E.01148
G1 X108.134 Y139.303 E.01148
G1 X108.448 Y139.024 E.01148
G1 X108.82 Y138.829 E.01148
G1 X109.227 Y138.729 E.01148
G1 X109.647 Y138.729 E.01148
G1 X110.054 Y138.829 E.01148
G1 X110.426 Y139.024 E.01148
G1 X110.74 Y139.303 E.01148
G1 X110.978 Y139.648 E.01148
G1 X111.106 Y139.984 E.00983
M204 S10000
; WIPE_START
G1 F24000
G1 X111.168 Y140.377 E-.15112
G1 X111.178 Y140.457 E-.03058
G1 X111.127 Y140.873 E-.15946
G1 X110.978 Y141.266 E-.15946
G1 X110.74 Y141.611 E-.15946
M73 P92 R0
G1 X110.543 Y141.786 E-.09994
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I1.049 J-.616 P1  F30000
G1 X108.749 Y138.73 Z6
G1 Z5.6
G1 E.8 F1800
M204 S5000
G1 F1460
G3 X109.538 Y138.6 I.689 J1.721 E.02203
G1 X109.887 Y138.657 E.00969
G1 X109.934 Y138.665 E.0013
G3 X108.694 Y138.753 I-.497 J1.786 E.28391
M204 S10000
; WIPE_START
G1 F24000
G1 X109.136 Y138.622 E-.17537
G1 X109.538 Y138.6 E-.1528
G1 X109.887 Y138.657 E-.13471
G1 X109.934 Y138.665 E-.01809
G1 X110.308 Y138.814 E-.15281
G1 X110.583 Y139 E-.12622
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I-1.217 J.017 P1  F30000
G1 X110.961 Y165.688 Z6
G1 Z5.6
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X111.002 Y166.024 E.00927
G1 X111.012 Y166.104 E.0022
G1 X110.961 Y166.521 E.01148
G1 X110.812 Y166.913 E.01148
G1 X110.574 Y167.258 E.01148
G1 X110.26 Y167.537 E.01148
G1 X109.888 Y167.732 E.01148
G1 X109.481 Y167.832 E.01148
G1 X109.061 Y167.832 E.01148
G1 X108.654 Y167.732 E.01148
G1 X108.282 Y167.537 E.01148
G1 X107.968 Y167.258 E.01148
G1 X107.73 Y166.913 E.01148
G1 X107.581 Y166.521 E.01148
G1 X107.53 Y166.104 E.01148
G1 X107.581 Y165.688 E.01148
G1 X107.73 Y165.295 E.01148
G1 X107.968 Y164.95 E.01148
G1 X108.282 Y164.672 E.01148
G1 X108.654 Y164.477 E.01148
G1 X109.061 Y164.376 E.01148
G1 X109.481 Y164.376 E.01148
G1 X109.888 Y164.477 E.01148
G1 X110.26 Y164.672 E.01148
G1 X110.574 Y164.95 E.01148
G1 X110.812 Y165.295 E.01148
G1 X110.94 Y165.631 E.00983
M204 S10000
; WIPE_START
G1 F24000
G1 X111.002 Y166.024 E-.15112
G1 X111.012 Y166.104 E-.03058
G1 X110.961 Y166.521 E-.15946
G1 X110.812 Y166.913 E-.15946
G1 X110.574 Y167.258 E-.15946
G1 X110.377 Y167.433 E-.09994
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I1.049 J-.616 P1  F30000
G1 X108.583 Y164.377 Z6
G1 Z5.6
G1 E.8 F1800
M204 S5000
G1 F1460
G3 X109.372 Y164.247 I.689 J1.721 E.02203
G1 X109.722 Y164.305 E.00969
G1 X109.769 Y164.312 E.0013
G3 X108.528 Y164.4 I-.497 J1.786 E.28391
M204 S10000
; WIPE_START
G1 F24000
G1 X108.97 Y164.269 E-.17537
G1 X109.372 Y164.247 E-.1528
G1 X109.722 Y164.305 E-.13471
G1 X109.769 Y164.312 E-.01809
G1 X110.142 Y164.461 E-.15281
G1 X110.417 Y164.647 E-.12622
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I.441 J1.134 P1  F30000
G1 X136.46 Y154.511 Z6
G1 Z5.6
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X136.411 Y154.917 E.01119
G1 X136.262 Y155.309 E.01148
G1 X136.024 Y155.655 E.01148
G1 X135.71 Y155.933 E.01148
G1 X135.338 Y156.128 E.01148
G1 X134.931 Y156.228 E.01148
G1 X134.511 Y156.228 E.01148
G1 X134.103 Y156.128 E.01148
G1 X133.732 Y155.933 E.01148
G1 X133.418 Y155.655 E.01148
G1 X133.179 Y155.309 E.01148
G1 X133.031 Y154.917 E.01148
G1 X132.98 Y154.5 E.01148
G1 X133.031 Y154.084 E.01148
G1 X133.179 Y153.691 E.01148
G1 X133.418 Y153.346 E.01148
G1 X133.732 Y153.068 E.01148
G1 X134.104 Y152.873 E.01148
G1 X134.511 Y152.772 E.01148
G1 X134.931 Y152.772 E.01148
G1 X135.338 Y152.873 E.01148
G1 X135.71 Y153.068 E.01148
G1 X136.024 Y153.346 E.01148
G1 X136.262 Y153.691 E.01148
G1 X136.411 Y154.084 E.01148
G1 X136.455 Y154.451 E.01012
M204 S10000
; WIPE_START
G1 F24000
G1 X136.411 Y154.917 E-.1778
G1 X136.262 Y155.309 E-.15946
G1 X136.024 Y155.655 E-.15946
G1 X135.71 Y155.933 E-.15946
G1 X135.468 Y156.06 E-.10383
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I1.131 J-.449 P1  F30000
G1 X134.147 Y152.736 Z6
G1 Z5.6
G1 E.8 F1800
M204 S5000
G1 F1460
G3 X135.295 Y152.732 I.58 J1.764 E.03192
G3 X135.651 Y156.111 I-.592 J1.77 E.11675
G3 X134.091 Y152.755 I-.923 J-1.611 E.16814
M204 S10000
; WIPE_START
G1 F24000
G1 X134.526 Y152.651 E-.1702
G1 X134.915 Y152.651 E-.14774
G1 X135.295 Y152.732 E-.14774
G1 X135.651 Y152.89 E-.14774
G1 X135.963 Y153.116 E-.14658
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I1.216 J.037 P1  F30000
G1 X136.588 Y132.321 Z6
G1 Z5.6
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X136.539 Y132.728 E.01119
G1 X136.39 Y133.12 E.01148
G1 X136.152 Y133.465 E.01148
G1 X135.838 Y133.744 E.01148
G1 X135.466 Y133.939 E.01148
G1 X135.059 Y134.039 E.01148
G1 X134.639 Y134.039 E.01148
G1 X134.231 Y133.939 E.01148
G1 X133.86 Y133.744 E.01148
G1 X133.546 Y133.465 E.01148
G1 X133.307 Y133.12 E.01148
G1 X133.159 Y132.728 E.01148
G1 X133.108 Y132.311 E.01148
G1 X133.159 Y131.894 E.01148
G1 X133.307 Y131.502 E.01148
G1 X133.546 Y131.157 E.01148
G1 X133.86 Y130.878 E.01148
G1 X134.231 Y130.683 E.01148
G1 X134.639 Y130.583 E.01148
G1 X135.059 Y130.583 E.01148
G1 X135.466 Y130.683 E.01148
G1 X135.838 Y130.878 E.01148
G1 X136.152 Y131.157 E.01148
G1 X136.39 Y131.502 E.01148
G1 X136.539 Y131.894 E.01148
G1 X136.583 Y132.262 E.01012
M204 S10000
; WIPE_START
G1 F24000
G1 X136.539 Y132.728 E-.1778
G1 X136.39 Y133.12 E-.15946
G1 X136.152 Y133.465 E-.15946
G1 X135.838 Y133.744 E-.15946
G1 X135.596 Y133.871 E-.10383
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I1.131 J-.449 P1  F30000
G1 X134.275 Y130.547 Z6
G1 Z5.6
G1 E.8 F1800
M204 S5000
G1 F1460
G3 X135.423 Y130.542 I.58 J1.764 E.03192
G3 X135.779 Y133.922 I-.592 J1.77 E.11675
G3 X134.219 Y130.566 I-.923 J-1.611 E.16814
M204 S10000
; WIPE_START
G1 F24000
G1 X134.654 Y130.462 E-.1702
G1 X135.043 Y130.462 E-.14774
G1 X135.423 Y130.542 E-.14774
G1 X135.779 Y130.7 E-.14774
G1 X136.091 Y130.927 E-.14658
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I1.216 J.052 P1  F30000
G1 X136.857 Y112.835 Z6
G1 Z5.6
G1 E.8 F1800
M204 S5000
G1 F1460
G1 X136.808 Y113.241 E.01119
G1 X136.659 Y113.634 E.01148
G1 X136.421 Y113.979 E.01148
G1 X136.107 Y114.257 E.01148
G1 X135.735 Y114.452 E.01148
G1 X135.328 Y114.553 E.01148
G1 X134.908 Y114.553 E.01148
G1 X134.501 Y114.452 E.01148
G1 X134.129 Y114.257 E.01148
G1 X133.815 Y113.979 E.01148
G1 X133.577 Y113.634 E.01148
G1 X133.428 Y113.241 E.01148
G1 X133.377 Y112.825 E.01148
G1 X133.428 Y112.408 E.01148
G1 X133.577 Y112.016 E.01148
G1 X133.815 Y111.67 E.01148
G1 X134.129 Y111.392 E.01148
G1 X134.501 Y111.197 E.01148
G1 X134.908 Y111.097 E.01148
G1 X135.328 Y111.097 E.01148
G1 X135.735 Y111.197 E.01148
G1 X136.107 Y111.392 E.01148
G1 X136.421 Y111.67 E.01148
G1 X136.659 Y112.016 E.01148
G1 X136.808 Y112.408 E.01148
G1 X136.853 Y112.775 E.01012
M204 S10000
; WIPE_START
G1 F24000
G1 X136.808 Y113.241 E-.1778
G1 X136.659 Y113.634 E-.15946
G1 X136.421 Y113.979 E-.15946
G1 X136.107 Y114.257 E-.15946
G1 X135.865 Y114.384 E-.10383
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I1.131 J-.449 P1  F30000
G1 X134.545 Y111.06 Z6
G1 Z5.6
G1 E.8 F1800
M204 S5000
G1 F1460
G3 X135.693 Y111.056 I.58 J1.764 E.03192
G3 X136.048 Y114.435 I-.592 J1.77 E.11675
G3 X134.488 Y111.08 I-.923 J-1.611 E.16814
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 5.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X134.924 Y110.975 E-.1702
G1 X135.312 Y110.975 E-.14774
G1 X135.693 Y111.056 E-.14774
G1 X136.048 Y111.214 E-.14774
G1 X136.36 Y111.441 E-.14658
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
G3 Z6 I.631 J-1.04 P1  F30000
G1 X107.31 Y93.808 Z6
G1 Z5.8
G1 E.8 F1800
M204 S5000
G1 F1461
G1 X107.311 Y93.81 E.00005
G1 X107.353 Y94.158 E.00959
G1 X107.362 Y94.227 E.00189
G1 X107.311 Y94.643 E.01148
G1 X107.162 Y95.036 E.01148
G1 X106.924 Y95.381 E.01148
G1 X106.61 Y95.659 E.01148
G1 X106.238 Y95.854 E.01148
G1 X105.831 Y95.955 E.01148
G1 X105.411 Y95.955 E.01148
G1 X105.004 Y95.854 E.01148
G1 X104.632 Y95.659 E.01148
G1 X104.318 Y95.381 E.01148
G1 X104.08 Y95.036 E.01148
G1 X103.931 Y94.643 E.01148
G1 X103.88 Y94.227 E.01148
G1 X103.931 Y93.81 E.01148
G1 X104.08 Y93.418 E.01148
M73 P93 R0
G1 X104.318 Y93.072 E.01148
G1 X104.632 Y92.794 E.01148
G1 X104.943 Y92.631 E.00959
G1 X105.004 Y92.599 E.00189
G1 X105.411 Y92.499 E.01148
G1 X105.831 Y92.499 E.01148
G1 X106.238 Y92.599 E.01148
G1 X106.61 Y92.794 E.01148
G1 X106.924 Y93.072 E.01148
G1 X107.162 Y93.418 E.01148
G1 X107.289 Y93.752 E.00978
M204 S10000
; WIPE_START
G1 F24000
G1 X107.311 Y93.81 E-.02356
G1 X107.353 Y94.158 E-.13325
G1 X107.362 Y94.227 E-.02621
G1 X107.311 Y94.643 E-.15946
G1 X107.162 Y95.036 E-.15946
G1 X106.924 Y95.381 E-.15946
G1 X106.73 Y95.553 E-.09861
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I1.049 J-.617 P1  F30000
G1 X104.934 Y92.503 Z6.2
G1 Z5.8
G1 E.8 F1800
M204 S5000
G1 F1461
G3 X106.085 Y92.429 I.688 J1.726 E.03207
G1 X106.118 Y92.435 E.00093
G3 X106.52 Y95.851 I-.513 J1.792 E.11978
G1 X106.492 Y95.87 E.00093
G3 X104.879 Y92.526 I-.87 J-1.641 E.16348
M204 S10000
; WIPE_START
G1 F24000
G1 X105.32 Y92.392 E-.17528
G1 X105.722 Y92.37 E-.1528
G1 X106.085 Y92.429 E-.1399
G1 X106.118 Y92.435 E-.01291
G1 X106.492 Y92.584 E-.15281
G1 X106.767 Y92.77 E-.1263
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I-1.19 J.255 P1  F30000
G1 X111.819 Y116.384 Z6.2
G1 Z5.8
G1 E.8 F1800
M204 S5000
G1 F1461
G1 X111.82 Y116.386 E.00005
G1 X111.862 Y116.734 E.00959
G1 X111.871 Y116.803 E.00189
G1 X111.82 Y117.219 E.01148
G1 X111.671 Y117.611 E.01148
G1 X111.433 Y117.957 E.01148
G1 X111.119 Y118.235 E.01148
G1 X110.747 Y118.43 E.01148
G1 X110.34 Y118.53 E.01148
G1 X109.92 Y118.53 E.01148
G1 X109.513 Y118.43 E.01148
G1 X109.141 Y118.235 E.01148
G1 X108.827 Y117.957 E.01148
G1 X108.589 Y117.611 E.01148
G1 X108.44 Y117.219 E.01148
G1 X108.389 Y116.803 E.01148
G1 X108.44 Y116.386 E.01148
G1 X108.589 Y115.994 E.01148
G1 X108.827 Y115.648 E.01148
G1 X109.141 Y115.37 E.01148
G1 X109.452 Y115.207 E.00959
G1 X109.513 Y115.175 E.00189
G1 X109.92 Y115.075 E.01148
G1 X110.34 Y115.075 E.01148
G1 X110.747 Y115.175 E.01148
G1 X111.119 Y115.37 E.01148
G1 X111.433 Y115.648 E.01148
G1 X111.671 Y115.994 E.01148
G1 X111.798 Y116.328 E.00978
M204 S10000
; WIPE_START
G1 F24000
G1 X111.82 Y116.386 E-.02356
G1 X111.862 Y116.734 E-.13325
G1 X111.871 Y116.803 E-.02621
G1 X111.82 Y117.219 E-.15946
G1 X111.671 Y117.611 E-.15946
G1 X111.433 Y117.957 E-.15946
G1 X111.239 Y118.129 E-.09861
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I1.049 J-.617 P1  F30000
G1 X109.443 Y115.078 Z6.2
G1 Z5.8
G1 E.8 F1800
M204 S5000
G1 F1461
G3 X110.594 Y115.005 I.688 J1.726 E.03207
G1 X110.627 Y115.011 E.00093
G3 X111.029 Y118.426 I-.513 J1.792 E.11978
G1 X111.001 Y118.446 E.00093
G3 X109.388 Y115.101 I-.87 J-1.641 E.16348
M204 S10000
; WIPE_START
G1 F24000
G1 X109.829 Y114.967 E-.17528
G1 X110.231 Y114.946 E-.1528
G1 X110.594 Y115.005 E-.1399
G1 X110.627 Y115.011 E-.01291
G1 X111.001 Y115.16 E-.15281
G1 X111.276 Y115.346 E-.1263
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I-1.217 J-.007 P1  F30000
G1 X111.126 Y140.038 Z6.2
G1 Z5.8
G1 E.8 F1800
M204 S5000
G1 F1461
G1 X111.127 Y140.04 E.00005
G1 X111.169 Y140.388 E.00959
G1 X111.178 Y140.457 E.00189
G1 X111.127 Y140.873 E.01148
G1 X110.978 Y141.266 E.01148
G1 X110.74 Y141.611 E.01148
G1 X110.426 Y141.889 E.01148
G1 X110.054 Y142.084 E.01148
G1 X109.647 Y142.185 E.01148
G1 X109.227 Y142.185 E.01148
G1 X108.82 Y142.084 E.01148
G1 X108.448 Y141.889 E.01148
G1 X108.134 Y141.611 E.01148
G1 X107.896 Y141.266 E.01148
G1 X107.747 Y140.873 E.01148
G1 X107.696 Y140.457 E.01148
G1 X107.747 Y140.04 E.01148
G1 X107.896 Y139.648 E.01148
G1 X108.134 Y139.303 E.01148
G1 X108.448 Y139.024 E.01148
G1 X108.759 Y138.861 E.00959
G1 X108.82 Y138.829 E.00189
G1 X109.227 Y138.729 E.01148
G1 X109.647 Y138.729 E.01148
G1 X110.054 Y138.829 E.01148
G1 X110.426 Y139.024 E.01148
G1 X110.74 Y139.303 E.01148
G1 X110.978 Y139.648 E.01148
G1 X111.105 Y139.982 E.00978
M204 S10000
; WIPE_START
G1 F24000
G1 X111.127 Y140.04 E-.02356
G1 X111.169 Y140.388 E-.13325
G1 X111.178 Y140.457 E-.02621
G1 X111.127 Y140.873 E-.15946
G1 X110.978 Y141.266 E-.15946
G1 X110.74 Y141.611 E-.15946
G1 X110.546 Y141.783 E-.09861
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I1.049 J-.617 P1  F30000
G1 X108.75 Y138.733 Z6.2
G1 Z5.8
G1 E.8 F1800
M204 S5000
G1 F1461
G3 X109.901 Y138.66 I.688 J1.726 E.03207
G1 X109.934 Y138.665 E.00093
G3 X110.336 Y142.081 I-.513 J1.792 E.11978
G1 X110.308 Y142.1 E.00093
G3 X108.695 Y138.756 I-.87 J-1.641 E.16348
M204 S10000
; WIPE_START
G1 F24000
G1 X109.136 Y138.622 E-.17528
G1 X109.538 Y138.6 E-.1528
G1 X109.901 Y138.66 E-.1399
G1 X109.934 Y138.665 E-.01291
G1 X110.308 Y138.814 E-.15281
G1 X110.583 Y139 E-.1263
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I-1.217 J.017 P1  F30000
G1 X110.96 Y165.686 Z6.2
G1 Z5.8
G1 E.8 F1800
M204 S5000
G1 F1461
G1 X110.961 Y165.688 E.00005
G1 X111.003 Y166.036 E.00959
G1 X111.012 Y166.104 E.00189
G1 X110.961 Y166.521 E.01148
G1 X110.812 Y166.913 E.01148
G1 X110.574 Y167.258 E.01148
G1 X110.26 Y167.537 E.01148
G1 X109.888 Y167.732 E.01148
G1 X109.481 Y167.832 E.01148
G1 X109.061 Y167.832 E.01148
G1 X108.654 Y167.732 E.01148
G1 X108.282 Y167.537 E.01148
G1 X107.968 Y167.258 E.01148
G1 X107.73 Y166.913 E.01148
G1 X107.581 Y166.521 E.01148
G1 X107.53 Y166.104 E.01148
G1 X107.581 Y165.688 E.01148
G1 X107.73 Y165.295 E.01148
G1 X107.968 Y164.95 E.01148
G1 X108.282 Y164.672 E.01148
G1 X108.593 Y164.509 E.00959
G1 X108.654 Y164.477 E.00189
G1 X109.061 Y164.376 E.01148
G1 X109.481 Y164.376 E.01148
G1 X109.888 Y164.477 E.01148
G1 X110.26 Y164.672 E.01148
G1 X110.574 Y164.95 E.01148
G1 X110.812 Y165.295 E.01148
G1 X110.939 Y165.63 E.00978
M204 S10000
; WIPE_START
G1 F24000
G1 X110.961 Y165.688 E-.02356
G1 X111.003 Y166.036 E-.13325
G1 X111.012 Y166.104 E-.02621
G1 X110.961 Y166.521 E-.15946
G1 X110.812 Y166.913 E-.15946
G1 X110.574 Y167.258 E-.15946
G1 X110.38 Y167.43 E-.09861
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I1.049 J-.617 P1  F30000
G1 X108.584 Y164.38 Z6.2
G1 Z5.8
G1 E.8 F1800
M204 S5000
G1 F1461
G3 X109.735 Y164.307 I.688 J1.726 E.03207
G1 X109.769 Y164.312 E.00093
G3 X110.17 Y167.728 I-.513 J1.792 E.11978
G1 X110.142 Y167.747 E.00093
G3 X108.529 Y164.403 I-.87 J-1.641 E.16348
M204 S10000
; WIPE_START
G1 F24000
G1 X108.97 Y164.269 E-.17528
G1 X109.372 Y164.247 E-.1528
G1 X109.735 Y164.307 E-.1399
G1 X109.769 Y164.312 E-.01291
G1 X110.142 Y164.461 E-.15281
G1 X110.417 Y164.648 E-.1263
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I.441 J1.134 P1  F30000
G1 X136.46 Y154.511 Z6.2
G1 Z5.8
G1 E.8 F1800
M204 S5000
G1 F1461
G1 X136.411 Y154.917 E.01118
G1 X136.262 Y155.309 E.01148
G1 X136.024 Y155.655 E.01148
G1 X135.71 Y155.933 E.01148
G1 X135.338 Y156.128 E.01148
G1 X134.931 Y156.228 E.01148
G1 X134.511 Y156.228 E.01148
G1 X134.104 Y156.128 E.01148
G1 X133.732 Y155.933 E.01148
G1 X133.418 Y155.655 E.01148
G1 X133.179 Y155.309 E.01148
G1 X133.031 Y154.917 E.01148
G1 X132.98 Y154.5 E.01148
G1 X133.031 Y154.084 E.01148
G1 X133.179 Y153.691 E.01148
G1 X133.418 Y153.346 E.01148
G1 X133.732 Y153.068 E.01148
G1 X134.104 Y152.873 E.01148
G1 X134.511 Y152.772 E.01148
G1 X134.931 Y152.772 E.01148
G1 X135.338 Y152.873 E.01148
G1 X135.71 Y153.068 E.01148
G1 X136.024 Y153.346 E.01148
G1 X136.262 Y153.691 E.01148
G1 X136.411 Y154.084 E.01148
G1 X136.455 Y154.451 E.01013
M204 S10000
; WIPE_START
G1 F24000
G1 X136.411 Y154.917 E-.1777
G1 X136.262 Y155.309 E-.15946
G1 X136.024 Y155.655 E-.15946
G1 X135.71 Y155.933 E-.15946
G1 X135.467 Y156.06 E-.10393
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I1.131 J-.449 P1  F30000
G1 X134.146 Y152.731 Z6.2
G1 Z5.8
G1 E.8 F1800
M204 S5000
G1 F1461
G3 X134.526 Y152.651 I.573 J1.764 E.01065
G1 X134.919 Y152.652 E.01073
G3 X134.089 Y152.751 I-.2 J1.844 E.29562
M204 S10000
; WIPE_START
G1 F24000
G1 X134.526 Y152.651 E-.17027
G1 X134.919 Y152.652 E-.14913
G1 X135.295 Y152.732 E-.14639
G1 X135.651 Y152.89 E-.14774
G1 X135.962 Y153.116 E-.14648
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I1.216 J.037 P1  F30000
G1 X136.588 Y132.322 Z6.2
G1 Z5.8
M73 P94 R0
G1 E.8 F1800
M204 S5000
G1 F1461
G1 X136.539 Y132.728 E.01118
G1 X136.39 Y133.12 E.01148
G1 X136.152 Y133.465 E.01148
G1 X135.838 Y133.744 E.01148
G1 X135.466 Y133.939 E.01148
G1 X135.059 Y134.039 E.01148
G1 X134.639 Y134.039 E.01148
G1 X134.231 Y133.939 E.01148
G1 X133.86 Y133.744 E.01148
G1 X133.546 Y133.465 E.01148
G1 X133.307 Y133.12 E.01148
G1 X133.159 Y132.728 E.01148
G1 X133.108 Y132.311 E.01148
G1 X133.159 Y131.894 E.01148
G1 X133.307 Y131.502 E.01148
G1 X133.546 Y131.157 E.01148
G1 X133.86 Y130.878 E.01148
G1 X134.231 Y130.683 E.01148
G1 X134.639 Y130.583 E.01148
G1 X135.059 Y130.583 E.01148
G1 X135.466 Y130.683 E.01148
G1 X135.838 Y130.878 E.01148
G1 X136.152 Y131.157 E.01148
G1 X136.39 Y131.502 E.01148
G1 X136.539 Y131.894 E.01148
G1 X136.583 Y132.262 E.01013
M204 S10000
; WIPE_START
G1 F24000
G1 X136.539 Y132.728 E-.1777
G1 X136.39 Y133.12 E-.15946
G1 X136.152 Y133.465 E-.15946
G1 X135.838 Y133.744 E-.15946
G1 X135.595 Y133.871 E-.10393
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I1.131 J-.449 P1  F30000
G1 X134.274 Y130.542 Z6.2
G1 Z5.8
G1 E.8 F1800
M204 S5000
G1 F1461
G3 X134.654 Y130.462 I.573 J1.764 E.01065
G1 X135.047 Y130.462 E.01073
G3 X134.217 Y130.562 I-.2 J1.844 E.29562
M204 S10000
; WIPE_START
G1 F24000
G1 X134.654 Y130.462 E-.17027
G1 X135.047 Y130.462 E-.14913
G1 X135.423 Y130.542 E-.14639
G1 X135.779 Y130.7 E-.14774
G1 X136.09 Y130.927 E-.14648
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I1.216 J.052 P1  F30000
G1 X136.857 Y112.835 Z6.2
G1 Z5.8
G1 E.8 F1800
M204 S5000
G1 F1461
G1 X136.808 Y113.241 E.01118
G1 X136.659 Y113.634 E.01148
G1 X136.421 Y113.979 E.01148
G1 X136.107 Y114.257 E.01148
G1 X135.735 Y114.452 E.01148
G1 X135.328 Y114.553 E.01148
G1 X134.908 Y114.553 E.01148
G1 X134.501 Y114.452 E.01148
G1 X134.129 Y114.257 E.01148
G1 X133.815 Y113.979 E.01148
G1 X133.577 Y113.634 E.01148
G1 X133.428 Y113.241 E.01148
G1 X133.377 Y112.825 E.01148
G1 X133.428 Y112.408 E.01148
G1 X133.577 Y112.016 E.01148
G1 X133.815 Y111.67 E.01148
G1 X134.129 Y111.392 E.01148
G1 X134.501 Y111.197 E.01148
G1 X134.908 Y111.097 E.01148
G1 X135.328 Y111.097 E.01148
G1 X135.735 Y111.197 E.01148
G1 X136.107 Y111.392 E.01148
G1 X136.421 Y111.67 E.01148
G1 X136.659 Y112.016 E.01148
G1 X136.808 Y112.408 E.01148
G1 X136.853 Y112.776 E.01013
M204 S10000
; WIPE_START
G1 F24000
G1 X136.808 Y113.241 E-.1777
G1 X136.659 Y113.634 E-.15946
G1 X136.421 Y113.979 E-.15946
G1 X136.107 Y114.257 E-.15946
G1 X135.865 Y114.384 E-.10393
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I1.131 J-.449 P1  F30000
G1 X134.543 Y111.056 Z6.2
G1 Z5.8
G1 E.8 F1800
M204 S5000
G1 F1461
G3 X134.923 Y110.975 I.573 J1.764 E.01065
G1 X135.316 Y110.976 E.01073
G3 X134.487 Y111.075 I-.2 J1.844 E.29562
M204 S10000
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X134.923 Y110.975 E-.17027
G1 X135.316 Y110.976 E-.14913
G1 X135.693 Y111.056 E-.14639
G1 X136.048 Y111.214 E-.14774
G1 X136.36 Y111.441 E-.14648
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
G3 Z6.2 I.631 J-1.04 P1  F30000
G1 X107.31 Y93.807 Z6.2
G1 Z6
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X107.311 Y93.81 E.0001
G1 X107.355 Y94.17 E.0099
G1 X107.362 Y94.227 E.00157
G1 X107.311 Y94.643 E.01148
G1 X107.162 Y95.036 E.01148
G1 X106.924 Y95.381 E.01148
G1 X106.61 Y95.659 E.01148
G1 X106.238 Y95.854 E.01148
G1 X105.831 Y95.955 E.01148
G1 X105.411 Y95.955 E.01148
G1 X105.004 Y95.854 E.01148
G1 X104.632 Y95.659 E.01148
G1 X104.589 Y95.621 E.00157
G1 X104.318 Y95.381 E.0099
G1 X104.08 Y95.036 E.01148
G1 X103.931 Y94.643 E.01148
G1 X103.88 Y94.227 E.01148
G1 X103.931 Y93.81 E.01148
G1 X104.08 Y93.418 E.01148
G1 X104.318 Y93.072 E.01148
G1 X104.632 Y92.794 E.01148
G1 X105.004 Y92.599 E.01148
G1 X105.411 Y92.499 E.01148
G1 X105.831 Y92.499 E.01148
G1 X106.238 Y92.599 E.01148
G1 X106.61 Y92.794 E.01148
G1 X106.924 Y93.072 E.01148
G1 X107.162 Y93.418 E.01148
G1 X107.288 Y93.75 E.00973
M204 S10000
; WIPE_START
G1 F24000
G1 X107.311 Y93.81 E-.02422
G1 X107.355 Y94.17 E-.13762
G1 X107.362 Y94.227 E-.02184
G1 X107.311 Y94.643 E-.15946
G1 X107.162 Y95.036 E-.15946
G1 X106.924 Y95.381 E-.15946
G1 X106.731 Y95.552 E-.09795
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I1.049 J-.618 P1  F30000
G1 X104.933 Y92.501 Z6.4
G1 Z6
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X106.098 Y92.431 I.688 J1.726 E.03246
G1 X106.118 Y92.435 E.00056
G3 X106.492 Y95.87 I-.515 J1.794 E.12074
G3 X104.878 Y92.524 I-.871 J-1.642 E.16354
M204 S10000
; WIPE_START
G1 F24000
G1 X105.32 Y92.392 E-.17532
G1 X105.722 Y92.37 E-.1528
G1 X106.098 Y92.431 E-.14508
G1 X106.118 Y92.435 E-.00773
G1 X106.492 Y92.584 E-.1528
G1 X106.767 Y92.77 E-.12626
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I-1.19 J.255 P1  F30000
G1 X111.819 Y116.382 Z6.4
G1 Z6
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X111.82 Y116.386 E.0001
G1 X111.864 Y116.745 E.0099
G1 X111.871 Y116.803 E.00157
G1 X111.82 Y117.219 E.01148
G1 X111.671 Y117.611 E.01148
G1 X111.433 Y117.957 E.01148
G1 X111.119 Y118.235 E.01148
G1 X110.747 Y118.43 E.01148
G1 X110.34 Y118.53 E.01148
G1 X109.92 Y118.53 E.01148
G1 X109.513 Y118.43 E.01148
G1 X109.141 Y118.235 E.01148
G1 X109.098 Y118.197 E.00157
G1 X108.827 Y117.957 E.0099
G1 X108.589 Y117.611 E.01148
G1 X108.44 Y117.219 E.01148
G1 X108.389 Y116.803 E.01148
G1 X108.44 Y116.386 E.01148
G1 X108.589 Y115.994 E.01148
G1 X108.827 Y115.648 E.01148
G1 X109.141 Y115.37 E.01148
G1 X109.513 Y115.175 E.01148
G1 X109.92 Y115.075 E.01148
G1 X110.34 Y115.075 E.01148
G1 X110.747 Y115.175 E.01148
G1 X111.119 Y115.37 E.01148
G1 X111.433 Y115.648 E.01148
G1 X111.671 Y115.994 E.01148
G1 X111.797 Y116.326 E.00973
M204 S10000
; WIPE_START
G1 F24000
G1 X111.82 Y116.386 E-.02422
G1 X111.864 Y116.745 E-.13762
G1 X111.871 Y116.803 E-.02184
G1 X111.82 Y117.219 E-.15946
G1 X111.671 Y117.611 E-.15946
G1 X111.433 Y117.957 E-.15946
G1 X111.24 Y118.128 E-.09795
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I1.049 J-.618 P1  F30000
G1 X109.442 Y115.077 Z6.4
G1 Z6
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X110.607 Y115.007 I.688 J1.726 E.03246
G1 X110.627 Y115.011 E.00056
G3 X111.001 Y118.446 I-.515 J1.794 E.12074
G3 X109.387 Y115.1 I-.871 J-1.642 E.16354
M204 S10000
; WIPE_START
G1 F24000
G1 X109.829 Y114.967 E-.17532
G1 X110.231 Y114.946 E-.1528
G1 X110.607 Y115.007 E-.14508
G1 X110.627 Y115.011 E-.00773
G1 X111.001 Y115.16 E-.1528
G1 X111.276 Y115.346 E-.12626
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I-1.217 J-.007 P1  F30000
G1 X111.126 Y140.037 Z6.4
G1 Z6
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X111.127 Y140.04 E.0001
G1 X111.171 Y140.4 E.0099
G1 X111.178 Y140.457 E.00157
G1 X111.127 Y140.873 E.01148
G1 X110.978 Y141.266 E.01148
G1 X110.74 Y141.611 E.01148
G1 X110.426 Y141.889 E.01148
G1 X110.054 Y142.084 E.01148
G1 X109.647 Y142.185 E.01148
G1 X109.227 Y142.185 E.01148
G1 X108.82 Y142.084 E.01148
G1 X108.448 Y141.889 E.01148
G1 X108.405 Y141.851 E.00157
G1 X108.134 Y141.611 E.0099
G1 X107.896 Y141.266 E.01148
G1 X107.747 Y140.873 E.01148
G1 X107.696 Y140.457 E.01148
G1 X107.747 Y140.04 E.01148
G1 X107.896 Y139.648 E.01148
G1 X108.134 Y139.303 E.01148
G1 X108.448 Y139.024 E.01148
G1 X108.82 Y138.829 E.01148
G1 X109.227 Y138.729 E.01148
G1 X109.647 Y138.729 E.01148
G1 X110.054 Y138.829 E.01148
G1 X110.426 Y139.024 E.01148
G1 X110.74 Y139.303 E.01148
G1 X110.978 Y139.648 E.01148
G1 X111.104 Y139.981 E.00973
M204 S10000
; WIPE_START
G1 F24000
G1 X111.127 Y140.04 E-.02422
G1 X111.171 Y140.4 E-.13762
G1 X111.178 Y140.457 E-.02184
G1 X111.127 Y140.873 E-.15946
G1 X110.978 Y141.266 E-.15946
G1 X110.74 Y141.611 E-.15946
G1 X110.547 Y141.782 E-.09795
; WIPE_END
G1 E-.04 F1800
G17
M73 P95 R0
G3 Z6.4 I1.049 J-.618 P1  F30000
G1 X108.749 Y138.731 Z6.4
G1 Z6
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X109.914 Y138.662 I.688 J1.726 E.03246
G1 X109.934 Y138.665 E.00056
G3 X110.308 Y142.1 I-.515 J1.794 E.12074
G3 X108.694 Y138.755 I-.871 J-1.642 E.16354
M204 S10000
; WIPE_START
G1 F24000
G1 X109.136 Y138.622 E-.17532
G1 X109.538 Y138.6 E-.1528
G1 X109.914 Y138.662 E-.14508
G1 X109.934 Y138.665 E-.00773
G1 X110.308 Y138.814 E-.1528
G1 X110.583 Y139 E-.12626
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I-1.217 J.017 P1  F30000
G1 X110.96 Y165.684 Z6.4
G1 Z6
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X110.961 Y165.688 E.0001
G1 X111.005 Y166.047 E.0099
G1 X111.012 Y166.104 E.00157
G1 X110.961 Y166.521 E.01148
G1 X110.812 Y166.913 E.01148
G1 X110.574 Y167.258 E.01148
G1 X110.26 Y167.537 E.01148
G1 X109.888 Y167.732 E.01148
G1 X109.481 Y167.832 E.01148
G1 X109.061 Y167.832 E.01148
G1 X108.654 Y167.732 E.01148
G1 X108.282 Y167.537 E.01148
G1 X108.239 Y167.499 E.00157
G1 X107.968 Y167.258 E.0099
G1 X107.73 Y166.913 E.01148
G1 X107.581 Y166.521 E.01148
G1 X107.53 Y166.104 E.01148
G1 X107.581 Y165.688 E.01148
G1 X107.73 Y165.295 E.01148
G1 X107.968 Y164.95 E.01148
G1 X108.282 Y164.672 E.01148
G1 X108.654 Y164.477 E.01148
G1 X109.061 Y164.376 E.01148
G1 X109.481 Y164.376 E.01148
G1 X109.888 Y164.477 E.01148
G1 X110.26 Y164.672 E.01148
G1 X110.574 Y164.95 E.01148
G1 X110.812 Y165.295 E.01148
G1 X110.939 Y165.628 E.00973
M204 S10000
; WIPE_START
G1 F24000
G1 X110.961 Y165.688 E-.02422
G1 X111.005 Y166.047 E-.13762
G1 X111.012 Y166.104 E-.02184
G1 X110.961 Y166.521 E-.15946
G1 X110.812 Y166.913 E-.15946
G1 X110.574 Y167.258 E-.15946
G1 X110.381 Y167.429 E-.09795
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I1.049 J-.618 P1  F30000
G1 X108.584 Y164.379 Z6.4
G1 Z6
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X109.749 Y164.309 I.688 J1.726 E.03246
G1 X109.769 Y164.312 E.00056
G3 X110.142 Y167.747 I-.515 J1.794 E.12074
G3 X108.528 Y164.402 I-.871 J-1.642 E.16354
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 6.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X108.97 Y164.269 E-.17532
G1 X109.372 Y164.247 E-.1528
G1 X109.749 Y164.309 E-.14508
G1 X109.769 Y164.312 E-.00773
G1 X110.142 Y164.461 E-.1528
G1 X110.417 Y164.648 E-.12626
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
G3 Z6.4 I1.216 J-.053 P1  F30000
G1 X107.309 Y93.805 Z6.4
G1 Z6.2
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X107.311 Y93.81 E.00014
G1 X107.356 Y94.181 E.01022
G1 X107.311 Y94.643 E.0127
G1 X107.162 Y95.036 E.01148
G1 X106.924 Y95.381 E.01148
G1 X106.61 Y95.659 E.01148
G1 X106.238 Y95.854 E.01148
G1 X105.831 Y95.955 E.01148
G1 X105.411 Y95.955 E.01148
G1 X105.004 Y95.854 E.01148
G1 X104.598 Y95.629 E.0127
G1 X104.318 Y95.381 E.01022
G1 X104.08 Y95.036 E.01148
G1 X103.931 Y94.643 E.01148
G1 X103.88 Y94.227 E.01148
G1 X103.931 Y93.81 E.01148
G1 X104.08 Y93.418 E.01148
G1 X104.318 Y93.072 E.01148
G1 X104.632 Y92.794 E.01148
G1 X105.004 Y92.599 E.01148
G1 X105.411 Y92.499 E.01148
G1 X105.831 Y92.499 E.01148
G1 X106.238 Y92.599 E.01148
G1 X106.61 Y92.794 E.01148
G1 X106.924 Y93.072 E.01148
G1 X107.162 Y93.418 E.01148
G1 X107.288 Y93.749 E.00969
M204 S10000
; WIPE_START
G1 F24000
G1 X107.311 Y93.81 E-.02477
G1 X107.356 Y94.181 E-.14199
G1 X107.311 Y94.643 E-.17647
G1 X107.162 Y95.036 E-.15946
G1 X106.924 Y95.381 E-.15946
G1 X106.731 Y95.552 E-.09786
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I1.049 J-.618 P1  F30000
G1 X104.933 Y92.5 Z6.6
G1 Z6.2
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X105.722 Y92.37 I.689 J1.721 E.02203
G1 X106.112 Y92.434 E.01081
G1 X106.118 Y92.435 E.00018
G3 X104.878 Y92.523 I-.497 J1.786 E.28391
M204 S10000
; WIPE_START
G1 F24000
G1 X105.32 Y92.392 E-.17537
G1 X105.722 Y92.37 E-.1528
G1 X106.112 Y92.434 E-.15027
G1 X106.118 Y92.435 E-.00254
G1 X106.492 Y92.584 E-.15281
G1 X106.767 Y92.77 E-.12622
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I-1.19 J.255 P1  F30000
G1 X111.818 Y116.381 Z6.6
G1 Z6.2
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X111.82 Y116.386 E.00014
G1 X111.865 Y116.757 E.01022
G1 X111.82 Y117.219 E.0127
G1 X111.671 Y117.611 E.01148
G1 X111.433 Y117.957 E.01148
G1 X111.119 Y118.235 E.01148
G1 X110.747 Y118.43 E.01148
G1 X110.34 Y118.53 E.01148
G1 X109.92 Y118.53 E.01148
G1 X109.513 Y118.43 E.01148
G1 X109.107 Y118.205 E.0127
G1 X108.827 Y117.957 E.01022
G1 X108.589 Y117.611 E.01148
G1 X108.44 Y117.219 E.01148
G1 X108.389 Y116.803 E.01148
G1 X108.44 Y116.386 E.01148
G1 X108.589 Y115.994 E.01148
G1 X108.827 Y115.648 E.01148
G1 X109.141 Y115.37 E.01148
G1 X109.513 Y115.175 E.01148
G1 X109.92 Y115.075 E.01148
G1 X110.34 Y115.075 E.01148
G1 X110.747 Y115.175 E.01148
G1 X111.119 Y115.37 E.01148
G1 X111.433 Y115.648 E.01148
G1 X111.671 Y115.994 E.01148
G1 X111.797 Y116.325 E.00969
M204 S10000
; WIPE_START
G1 F24000
G1 X111.82 Y116.386 E-.02477
G1 X111.865 Y116.757 E-.14199
G1 X111.82 Y117.219 E-.17647
G1 X111.671 Y117.611 E-.15946
G1 X111.433 Y117.957 E-.15946
G1 X111.24 Y118.128 E-.09786
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I1.049 J-.618 P1  F30000
G1 X109.442 Y115.076 Z6.6
G1 Z6.2
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X110.231 Y114.946 I.689 J1.721 E.02203
G1 X110.621 Y115.01 E.01081
G1 X110.627 Y115.011 E.00018
G3 X109.387 Y115.099 I-.497 J1.786 E.28391
M204 S10000
; WIPE_START
G1 F24000
G1 X109.829 Y114.967 E-.17537
G1 X110.231 Y114.946 E-.1528
G1 X110.621 Y115.01 E-.15027
G1 X110.627 Y115.011 E-.00254
G1 X111.001 Y115.16 E-.15281
G1 X111.276 Y115.346 E-.12622
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I-1.217 J-.007 P1  F30000
G1 X111.125 Y140.035 Z6.6
G1 Z6.2
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X111.127 Y140.04 E.00014
G1 X111.172 Y140.411 E.01022
G1 X111.127 Y140.873 E.0127
G1 X110.978 Y141.266 E.01148
G1 X110.74 Y141.611 E.01148
G1 X110.426 Y141.889 E.01148
G1 X110.054 Y142.084 E.01148
G1 X109.647 Y142.185 E.01148
G1 X109.227 Y142.185 E.01148
G1 X108.82 Y142.084 E.01148
G1 X108.414 Y141.859 E.0127
G1 X108.134 Y141.611 E.01022
G1 X107.896 Y141.266 E.01148
G1 X107.747 Y140.873 E.01148
G1 X107.696 Y140.457 E.01148
G1 X107.747 Y140.04 E.01148
G1 X107.896 Y139.648 E.01148
G1 X108.134 Y139.303 E.01148
G1 X108.448 Y139.024 E.01148
G1 X108.82 Y138.829 E.01148
G1 X109.227 Y138.729 E.01148
G1 X109.647 Y138.729 E.01148
G1 X110.054 Y138.829 E.01148
G1 X110.426 Y139.024 E.01148
G1 X110.74 Y139.303 E.01148
G1 X110.978 Y139.648 E.01148
G1 X111.104 Y139.979 E.00969
M204 S10000
; WIPE_START
G1 F24000
G1 X111.127 Y140.04 E-.02477
G1 X111.172 Y140.411 E-.14199
G1 X111.127 Y140.873 E-.17647
G1 X110.978 Y141.266 E-.15946
G1 X110.74 Y141.611 E-.15946
G1 X110.547 Y141.782 E-.09786
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I1.049 J-.618 P1  F30000
G1 X108.749 Y138.73 Z6.6
G1 Z6.2
G1 E.8 F1800
M204 S5000
M73 P96 R0
G1 F1200
G3 X109.538 Y138.6 I.689 J1.721 E.02203
G1 X109.928 Y138.664 E.01081
G1 X109.934 Y138.665 E.00018
G3 X108.694 Y138.753 I-.497 J1.786 E.28391
M204 S10000
; WIPE_START
G1 F24000
G1 X109.136 Y138.622 E-.17537
G1 X109.538 Y138.6 E-.1528
G1 X109.928 Y138.664 E-.15027
G1 X109.934 Y138.665 E-.00254
G1 X110.308 Y138.814 E-.15281
G1 X110.583 Y139 E-.12622
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I-1.217 J.017 P1  F30000
G1 X110.959 Y165.683 Z6.6
G1 Z6.2
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X110.961 Y165.688 E.00014
G1 X111.006 Y166.058 E.01022
G1 X110.961 Y166.521 E.0127
G1 X110.812 Y166.913 E.01148
G1 X110.574 Y167.258 E.01148
G1 X110.26 Y167.537 E.01148
G1 X109.888 Y167.732 E.01148
G1 X109.481 Y167.832 E.01148
G1 X109.061 Y167.832 E.01148
G1 X108.654 Y167.732 E.01148
G1 X108.248 Y167.506 E.0127
G1 X107.968 Y167.258 E.01022
G1 X107.73 Y166.913 E.01148
G1 X107.581 Y166.521 E.01148
G1 X107.53 Y166.104 E.01148
G1 X107.581 Y165.688 E.01148
G1 X107.73 Y165.295 E.01148
G1 X107.968 Y164.95 E.01148
G1 X108.282 Y164.672 E.01148
G1 X108.654 Y164.477 E.01148
G1 X109.061 Y164.376 E.01148
G1 X109.481 Y164.376 E.01148
G1 X109.888 Y164.477 E.01148
G1 X110.26 Y164.672 E.01148
G1 X110.574 Y164.95 E.01148
G1 X110.812 Y165.295 E.01148
G1 X110.938 Y165.627 E.00969
M204 S10000
; WIPE_START
G1 F24000
G1 X110.961 Y165.688 E-.02477
G1 X111.006 Y166.058 E-.14199
G1 X110.961 Y166.521 E-.17647
G1 X110.812 Y166.913 E-.15946
G1 X110.574 Y167.258 E-.15946
G1 X110.381 Y167.429 E-.09786
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I1.049 J-.618 P1  F30000
G1 X108.583 Y164.377 Z6.6
G1 Z6.2
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X109.372 Y164.247 I.689 J1.721 E.02203
G1 X109.762 Y164.311 E.01081
G1 X109.769 Y164.312 E.00018
G3 X108.528 Y164.4 I-.497 J1.786 E.28391
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 6.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X108.97 Y164.269 E-.17537
G1 X109.372 Y164.247 E-.1528
G1 X109.762 Y164.311 E-.15027
G1 X109.769 Y164.312 E-.00254
G1 X110.142 Y164.461 E-.15281
G1 X110.417 Y164.647 E-.12622
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
G3 Z6.6 I1.216 J-.053 P1  F30000
G1 X107.309 Y93.804 Z6.6
G1 Z6.4
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X107.311 Y93.81 E.00018
G1 X107.357 Y94.192 E.01053
G1 X107.311 Y94.643 E.01239
G1 X107.162 Y95.036 E.01148
G1 X106.924 Y95.381 E.01148
G1 X106.61 Y95.659 E.01148
G1 X106.238 Y95.854 E.01148
G1 X105.831 Y95.955 E.01148
G1 X105.411 Y95.955 E.01148
G1 X105.004 Y95.854 E.01148
G1 X104.632 Y95.659 E.01148
G1 X104.318 Y95.381 E.01148
G1 X104.08 Y95.036 E.01148
G1 X103.931 Y94.643 E.01148
G1 X103.88 Y94.227 E.01148
G1 X103.931 Y93.81 E.01148
G1 X104.08 Y93.418 E.01148
G1 X104.318 Y93.072 E.01148
G1 X104.632 Y92.794 E.01148
G1 X105.004 Y92.599 E.01148
G1 X105.411 Y92.499 E.01148
G1 X105.831 Y92.499 E.01148
G1 X106.238 Y92.599 E.01148
G1 X106.61 Y92.794 E.01148
G1 X106.924 Y93.072 E.01148
G1 X107.162 Y93.418 E.01148
G1 X107.287 Y93.748 E.00965
M204 S10000
; WIPE_START
G1 F24000
G1 X107.311 Y93.81 E-.02534
G1 X107.357 Y94.192 E-.14636
G1 X107.311 Y94.643 E-.17221
G1 X107.162 Y95.036 E-.15946
G1 X106.924 Y95.381 E-.15946
G1 X106.732 Y95.55 E-.09718
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I1.048 J-.618 P1  F30000
G1 X104.933 Y92.499 Z6.8
G1 Z6.4
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X105.722 Y92.37 I.688 J1.728 E.02204
G1 X106.118 Y92.435 E.011
G3 X104.877 Y92.522 I-.497 J1.792 E.28484
M204 S10000
; WIPE_START
G1 F24000
G1 X105.32 Y92.392 E-.17539
G1 X105.722 Y92.37 E-.15281
G1 X106.118 Y92.435 E-.15281
G1 X106.492 Y92.584 E-.15281
G1 X106.767 Y92.77 E-.12619
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I-1.19 J.255 P1  F30000
G1 X111.818 Y116.38 Z6.8
G1 Z6.4
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X111.82 Y116.386 E.00018
G1 X111.866 Y116.768 E.01053
G1 X111.82 Y117.219 E.01239
G1 X111.671 Y117.611 E.01148
G1 X111.433 Y117.957 E.01148
G1 X111.119 Y118.235 E.01148
G1 X110.747 Y118.43 E.01148
G1 X110.34 Y118.53 E.01148
G1 X109.92 Y118.53 E.01148
G1 X109.513 Y118.43 E.01148
G1 X109.141 Y118.235 E.01148
G1 X108.827 Y117.957 E.01148
G1 X108.589 Y117.611 E.01148
G1 X108.44 Y117.219 E.01148
G1 X108.389 Y116.803 E.01148
G1 X108.44 Y116.386 E.01148
G1 X108.589 Y115.994 E.01148
G1 X108.827 Y115.648 E.01148
G1 X109.141 Y115.37 E.01148
G1 X109.513 Y115.175 E.01148
G1 X109.92 Y115.075 E.01148
G1 X110.34 Y115.075 E.01148
G1 X110.747 Y115.175 E.01148
G1 X111.119 Y115.37 E.01148
G1 X111.433 Y115.648 E.01148
G1 X111.671 Y115.994 E.01148
G1 X111.796 Y116.324 E.00965
M204 S10000
; WIPE_START
G1 F24000
G1 X111.82 Y116.386 E-.02534
G1 X111.866 Y116.768 E-.14636
G1 X111.82 Y117.219 E-.17221
G1 X111.671 Y117.611 E-.15946
G1 X111.433 Y117.957 E-.15946
G1 X111.241 Y118.126 E-.09718
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I1.048 J-.618 P1  F30000
G1 X109.442 Y115.075 Z6.8
G1 Z6.4
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X110.231 Y114.946 I.688 J1.728 E.02204
G1 X110.627 Y115.011 E.011
G3 X109.386 Y115.098 I-.497 J1.792 E.28484
M204 S10000
; WIPE_START
G1 F24000
G1 X109.829 Y114.967 E-.17539
G1 X110.231 Y114.946 E-.15281
G1 X110.627 Y115.011 E-.15281
G1 X111.001 Y115.16 E-.15281
G1 X111.276 Y115.346 E-.12619
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I-1.217 J-.007 P1  F30000
G1 X111.125 Y140.034 Z6.8
G1 Z6.4
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X111.127 Y140.04 E.00018
G1 X111.173 Y140.423 E.01053
G1 X111.127 Y140.873 E.01239
G1 X110.978 Y141.266 E.01148
G1 X110.74 Y141.611 E.01148
G1 X110.426 Y141.889 E.01148
G1 X110.054 Y142.084 E.01148
G1 X109.647 Y142.185 E.01148
G1 X109.227 Y142.185 E.01148
G1 X108.82 Y142.084 E.01148
G1 X108.448 Y141.889 E.01148
G1 X108.134 Y141.611 E.01148
G1 X107.896 Y141.266 E.01148
G1 X107.747 Y140.873 E.01148
G1 X107.696 Y140.457 E.01148
G1 X107.747 Y140.04 E.01148
G1 X107.896 Y139.648 E.01148
G1 X108.134 Y139.303 E.01148
G1 X108.448 Y139.024 E.01148
G1 X108.82 Y138.829 E.01148
G1 X109.227 Y138.729 E.01148
G1 X109.647 Y138.729 E.01148
G1 X110.054 Y138.829 E.01148
G1 X110.426 Y139.024 E.01148
G1 X110.74 Y139.303 E.01148
G1 X110.978 Y139.648 E.01148
G1 X111.103 Y139.978 E.00965
M204 S10000
; WIPE_START
G1 F24000
G1 X111.127 Y140.04 E-.02534
G1 X111.173 Y140.423 E-.14636
G1 X111.127 Y140.873 E-.17221
G1 X110.978 Y141.266 E-.15946
G1 X110.74 Y141.611 E-.15946
G1 X110.548 Y141.781 E-.09718
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I1.048 J-.618 P1  F30000
G1 X108.749 Y138.729 Z6.8
G1 Z6.4
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X109.538 Y138.6 I.688 J1.728 E.02204
G1 X109.934 Y138.665 E.011
M73 P97 R0
G3 X108.693 Y138.752 I-.497 J1.792 E.28484
M204 S10000
; WIPE_START
G1 F24000
G1 X109.136 Y138.622 E-.17539
G1 X109.538 Y138.6 E-.15281
G1 X109.934 Y138.665 E-.15281
G1 X110.308 Y138.814 E-.15281
G1 X110.583 Y139 E-.12619
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I-1.217 J.017 P1  F30000
G1 X110.959 Y165.681 Z6.8
G1 Z6.4
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X110.961 Y165.688 E.00018
G1 X111.008 Y166.07 E.01053
G1 X110.961 Y166.521 E.01239
G1 X110.812 Y166.913 E.01148
G1 X110.574 Y167.258 E.01148
G1 X110.26 Y167.537 E.01148
G1 X109.888 Y167.732 E.01148
G1 X109.481 Y167.832 E.01148
G1 X109.061 Y167.832 E.01148
G1 X108.654 Y167.732 E.01148
G1 X108.282 Y167.537 E.01148
G1 X107.968 Y167.258 E.01148
G1 X107.73 Y166.913 E.01148
G1 X107.581 Y166.521 E.01148
G1 X107.53 Y166.104 E.01148
G1 X107.581 Y165.688 E.01148
G1 X107.73 Y165.295 E.01148
G1 X107.968 Y164.95 E.01148
G1 X108.282 Y164.672 E.01148
G1 X108.654 Y164.477 E.01148
G1 X109.061 Y164.376 E.01148
G1 X109.481 Y164.376 E.01148
G1 X109.888 Y164.477 E.01148
G1 X110.26 Y164.672 E.01148
G1 X110.574 Y164.95 E.01148
G1 X110.812 Y165.295 E.01148
G1 X110.938 Y165.625 E.00965
M204 S10000
; WIPE_START
G1 F24000
G1 X110.961 Y165.688 E-.02534
G1 X111.008 Y166.07 E-.14636
G1 X110.961 Y166.521 E-.17221
G1 X110.812 Y166.913 E-.15946
G1 X110.574 Y167.258 E-.15946
G1 X110.383 Y167.428 E-.09718
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I1.048 J-.618 P1  F30000
G1 X108.583 Y164.377 Z6.8
G1 Z6.4
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X109.372 Y164.247 I.688 J1.728 E.02204
G1 X109.769 Y164.312 E.011
G3 X108.528 Y164.4 I-.497 J1.792 E.28484
M204 S10000
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F24000
G1 X108.97 Y164.269 E-.17539
G1 X109.372 Y164.247 E-.15281
G1 X109.769 Y164.312 E-.15281
G1 X110.142 Y164.461 E-.15281
G1 X110.417 Y164.647 E-.12619
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

