; HEADER_BLOCK_START
; BambuStudio 01.06.02.04
; model printing time: 5m 36s; total estimated time: 11m 25s
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
M73 P38 R6
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
M73 P39 R6
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
M73 P44 R6
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
    G29 A X113.114 Y126.75 I33.1362 J26.0566
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
G1 X114.607 Y129.107 F30000
G1 Z.4
M73 P46 R6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
G1 X128.214 Y129.107 E.50682
G1 X140.214 Y130.107 E.4485
G1 X145.393 Y130.107 E.19288
M73 P47 R6
G1 X145.393 Y130.393 E.01065
G1 X114.607 Y130.393 E1.14666
G1 X114.607 Y129.167 E.04566
; WIPE_START
G1 F24000
G1 X116.607 Y129.158 E-.76
; WIPE_END
M73 P47 R5
G1 E-.04 F1800
G17
G3 Z.6 I1.051 J-.614 P1  F30000
G1 X114.85 Y126.15 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
M73 P48 R5
G1 F3000
G1 X114.85 Y128.65 E.09312
G1 X128.233 Y128.65 E.49848
G1 X140.233 Y129.65 E.4485
G1 X145.85 Y129.65 E.2092
G1 X145.85 Y130.85 E.0447
G1 X114.15 Y130.85 E1.1807
M73 P49 R5
G1 X114.15 Y125.15 E.2123
G1 X145.85 Y125.15 E1.1807
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
; LINE_WIDTH: 0.557302
G1 X114.636 Y125.664 E.00085
; LINE_WIDTH: 0.585842
G1 X114.65 Y125.65 E.00089
; LINE_WIDTH: 0.58584
G1 X145.621 Y125.65 E1.37021
; WIPE_START
G1 F24000
G1 X143.621 Y125.65 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-.716 J-.984 P1  F30000
G1 X137.459 Y130.136 Z.6
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.10292
G1 F3000
M73 P50 R5
G1 X136.864 Y130.111 E.00291
; LINE_WIDTH: 0.150071
G1 X136.269 Y130.086 E.0052
; LINE_WIDTH: 0.197222
G1 X135.674 Y130.061 E.00749
; LINE_WIDTH: 0.244373
G1 X135.079 Y130.037 E.00978
; LINE_WIDTH: 0.291524
G1 X134.484 Y130.012 E.01206
; LINE_WIDTH: 0.338675
G1 X133.889 Y129.987 E.01435
; LINE_WIDTH: 0.385826
G1 X133.294 Y129.962 E.01664
; LINE_WIDTH: 0.432977
G1 X132.699 Y129.938 E.01893
; LINE_WIDTH: 0.480128
G1 X132.104 Y129.913 E.02121
; LINE_WIDTH: 0.527279
G1 X131.509 Y129.888 E.0235
; LINE_WIDTH: 0.57443
G1 X130.914 Y129.863 E.02579
; LINE_WIDTH: 0.621581
G1 X130.319 Y129.839 E.02808
; LINE_WIDTH: 0.668732
G1 X129.724 Y129.814 E.03037
; WIPE_START
G1 F24000
G1 X130.319 Y129.839 E-.76
; WIPE_END
G1 E-.04 F1800
G17
M73 P51 R5
G3 Z.6 I.342 J-1.168 P1  F30000
G1 X128.539 Y129.318 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.504497
G1 F6300
G1 X129.226 Y130.004 E.03653
G1 X128.573 Y130.004 E.02455
G1 X128.064 Y129.496 E.02707
G1 X127.411 Y129.496 E.02455
G1 X127.92 Y130.004 E.02707
G1 X127.267 Y130.004 E.02455
G1 X126.759 Y129.496 E.02707
G1 X126.106 Y129.496 E.02455
G1 X126.615 Y130.004 E.02707
G1 X125.962 Y130.004 E.02455
G1 X125.453 Y129.496 E.02707
G1 X124.8 Y129.496 E.02455
G1 X125.309 Y130.004 E.02707
G1 X124.656 Y130.004 E.02455
G1 X124.148 Y129.496 E.02707
G1 X123.495 Y129.496 E.02455
G1 X124.004 Y130.004 E.02707
G1 X123.351 Y130.004 E.02455
G1 X122.842 Y129.496 E.02707
G1 X122.189 Y129.496 E.02455
G1 X122.698 Y130.004 E.02707
G1 X122.045 Y130.004 E.02455
G1 X121.536 Y129.496 E.02707
G1 X120.884 Y129.496 E.02455
G1 X121.393 Y130.004 E.02707
G1 X120.74 Y130.004 E.02455
G1 X120.231 Y129.496 E.02707
G1 X119.578 Y129.496 E.02455
G1 X120.087 Y130.004 E.02707
G1 X119.434 Y130.004 E.02455
G1 X118.925 Y129.496 E.02707
G1 X118.273 Y129.496 E.02455
G1 X118.781 Y130.004 E.02707
G1 X118.129 Y130.004 E.02455
G1 X117.62 Y129.496 E.02707
G1 X116.967 Y129.496 E.02455
G1 X117.476 Y130.004 E.02707
G1 X116.823 Y130.004 E.02455
G1 X116.314 Y129.496 E.02707
G1 X115.662 Y129.496 E.02455
G1 X116.17 Y130.004 E.02707
G1 X115.518 Y130.004 E.02455
G1 X114.803 Y129.29 E.03801
G1 X114.5 Y128.879 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.286717
G1 F3000
G1 X114.5 Y125.921 E.05875
G1 X114.524 Y125.873 E.00108
; WIPE_START
G1 F24000
G1 X114.5 Y125.921 E-.02064
G1 X114.5 Y127.867 E-.73936
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-1.217 J-.031 P1  F30000
G1 X113.971 Y148.664 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
G1 X127.578 Y148.664 E.50682
G1 X139.578 Y149.664 E.4485
M73 P52 R5
G1 X144.757 Y149.664 E.19288
G1 X144.757 Y149.95 E.01065
G1 X113.971 Y149.95 E1.14666
G1 X113.971 Y148.724 E.04566
; WIPE_START
G1 F24000
G1 X115.971 Y148.715 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I1.051 J-.614 P1  F30000
G1 X114.214 Y145.707 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
G1 F3000
G1 X114.214 Y148.207 E.09312
G1 X127.597 Y148.207 E.49848
G1 X139.597 Y149.207 E.4485
G1 X145.214 Y149.207 E.2092
G1 X145.214 Y150.407 E.0447
G1 X113.514 Y150.407 E1.1807
G1 X113.514 Y144.707 E.2123
G1 X145.214 Y144.707 E1.1807
G1 X145.214 Y145.707 E.03725
G1 X114.274 Y145.707 E1.1524
G1 X113.888 Y145.429 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.38301
G1 F3000
G1 X113.912 Y145.381 E.00151
; LINE_WIDTH: 0.431594
G1 X113.937 Y145.332 E.00172
; LINE_WIDTH: 0.480178
G1 X113.961 Y145.284 E.00194
; LINE_WIDTH: 0.528762
G1 X113.985 Y145.235 E.00215
; LINE_WIDTH: 0.557302
G1 X113.999 Y145.221 E.00085
; LINE_WIDTH: 0.585842
G1 X114.014 Y145.207 E.00089
; LINE_WIDTH: 0.58584
G1 X144.985 Y145.207 E1.37021
; WIPE_START
G1 F24000
G1 X142.985 Y145.207 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-.716 J-.984 P1  F30000
G1 X136.823 Y149.692 Z.6
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.10292
G1 F3000
G1 X136.228 Y149.667 E.00291
; LINE_WIDTH: 0.150071
G1 X135.633 Y149.643 E.0052
; LINE_WIDTH: 0.197222
G1 X135.038 Y149.618 E.00749
; LINE_WIDTH: 0.244373
G1 X134.443 Y149.593 E.00978
; LINE_WIDTH: 0.291524
G1 X133.848 Y149.569 E.01206
; LINE_WIDTH: 0.338675
G1 X133.253 Y149.544 E.01435
; LINE_WIDTH: 0.385826
G1 X132.658 Y149.519 E.01664
; LINE_WIDTH: 0.432977
G1 X132.063 Y149.494 E.01893
; LINE_WIDTH: 0.480128
G1 X131.468 Y149.47 E.02121
; LINE_WIDTH: 0.527279
G1 X130.873 Y149.445 E.0235
; LINE_WIDTH: 0.57443
G1 X130.278 Y149.42 E.02579
; LINE_WIDTH: 0.621581
G1 X129.683 Y149.395 E.02808
; LINE_WIDTH: 0.668732
G1 X129.088 Y149.371 E.03037
; WIPE_START
G1 F24000
G1 X129.683 Y149.395 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I.342 J-1.168 P1  F30000
G1 X127.903 Y148.874 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.504497
G1 F6300
G1 X128.59 Y149.561 E.03653
G1 X127.937 Y149.561 E.02455
G1 X127.428 Y149.052 E.02707
G1 X126.775 Y149.052 E.02455
G1 X127.284 Y149.561 E.02707
G1 X126.631 Y149.561 E.02455
G1 X126.122 Y149.052 E.02707
G1 X125.47 Y149.052 E.02455
G1 X125.978 Y149.561 E.02707
G1 X125.326 Y149.561 E.02455
G1 X124.817 Y149.052 E.02707
G1 X124.164 Y149.052 E.02455
M73 P53 R5
G1 X124.673 Y149.561 E.02707
G1 X124.02 Y149.561 E.02455
G1 X123.511 Y149.052 E.02707
G1 X122.859 Y149.052 E.02455
G1 X123.367 Y149.561 E.02707
G1 X122.715 Y149.561 E.02455
G1 X122.206 Y149.052 E.02707
G1 X121.553 Y149.052 E.02455
G1 X122.062 Y149.561 E.02707
G1 X121.409 Y149.561 E.02455
G1 X120.9 Y149.052 E.02707
G1 X120.247 Y149.052 E.02455
G1 X120.756 Y149.561 E.02707
G1 X120.104 Y149.561 E.02455
G1 X119.595 Y149.052 E.02707
G1 X118.942 Y149.052 E.02455
G1 X119.451 Y149.561 E.02707
G1 X118.798 Y149.561 E.02455
G1 X118.289 Y149.052 E.02707
G1 X117.636 Y149.052 E.02455
G1 X118.145 Y149.561 E.02707
G1 X117.492 Y149.561 E.02455
G1 X116.984 Y149.052 E.02707
G1 X116.331 Y149.052 E.02455
G1 X116.84 Y149.561 E.02707
G1 X116.187 Y149.561 E.02455
G1 X115.678 Y149.052 E.02707
G1 X115.025 Y149.052 E.02455
G1 X115.534 Y149.561 E.02707
G1 X114.881 Y149.561 E.02455
G1 X114.167 Y148.847 E.03801
G1 X113.864 Y148.435 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.286717
G1 F3000
G1 X113.864 Y145.478 E.05875
G1 X113.888 Y145.429 E.00108
M106 S252.45
M106 P2 S178
; CHANGE_LAYER
; Z_HEIGHT: 0.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X113.864 Y145.478 E-.02064
G1 X113.864 Y147.424 E-.73936
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
G3 Z.6 I1.216 J.044 P1  F30000
G1 X114.648 Y125.948 Z.6
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6153
G1 X114.648 Y128.852 E.09634
G1 X128.225 Y128.852 E.45038
G1 X140.225 Y129.852 E.39944
G1 X145.648 Y129.852 E.17989
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
G1 F6153
G1 X115.04 Y128.46 E.06514
G1 X128.241 Y128.46 E.40564
G1 X140.241 Y129.46 E.37
G1 X146.04 Y129.46 E.17818
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
G1 F6153
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
G1 F6153
G1 X140.2 Y130.25 E.16613
; LINE_WIDTH: 0.432356
G1 X139.636 Y130.226 E.01793
; LINE_WIDTH: 0.474338
G1 X139.071 Y130.203 E.01986
; LINE_WIDTH: 0.51632
G1 X138.507 Y130.179 E.0218
; LINE_WIDTH: 0.558302
G1 X137.942 Y130.156 E.02373
; LINE_WIDTH: 0.600284
G1 X137.378 Y130.132 E.02566
G1 X128.63 Y129.768 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.640764
G1 F6153
G1 X128.556 Y129.739 E.00387
; LINE_WIDTH: 0.594008
G1 X128.482 Y129.709 E.00356
; LINE_WIDTH: 0.547251
G1 X128.409 Y129.68 E.00326
; LINE_WIDTH: 0.500494
G1 X128.335 Y129.65 E.00296
; LINE_WIDTH: 0.453737
G1 X128.261 Y129.621 E.00266
; LINE_WIDTH: 0.360363
G1 X128.188 Y129.591 E.00205
G1 X115.091 Y129.591 E.33877
G1 X115.091 Y129.909 E.00821
G1 X128.188 Y129.909 E.33877
; LINE_WIDTH: 0.360223
G1 X128.252 Y129.888 E.00174
; LINE_WIDTH: 0.40698
G1 X128.316 Y129.868 E.002
; LINE_WIDTH: 0.453737
G1 X128.38 Y129.848 E.00225
; LINE_WIDTH: 0.500494
G1 X128.444 Y129.827 E.00251
; LINE_WIDTH: 0.547251
G1 X128.508 Y129.807 E.00276
; LINE_WIDTH: 0.594008
G1 X128.572 Y129.787 E.00302
G1 X128.63 Y129.768 F30000
; LINE_WIDTH: 0.640764
G1 F6153
G1 X129.152 Y129.79 E.02547
; LINE_WIDTH: 0.596486
G1 X129.674 Y129.812 E.02358
; LINE_WIDTH: 0.552208
G1 X130.196 Y129.834 E.02169
; LINE_WIDTH: 0.507929
G1 X130.719 Y129.855 E.01981
; LINE_WIDTH: 0.463651
M73 P54 R5
G1 X131.241 Y129.877 E.01792
; LINE_WIDTH: 0.419373
G1 X131.763 Y129.899 E.01604
G1 X128.209 Y129.244 F30000
; LINE_WIDTH: 0.419999
G1 F6153
G1 X114.744 Y129.244 E.41373
G1 X114.744 Y130.256 E.03109
G1 X131.823 Y130.256 E.52479
G1 X131.956 Y130.231 E.00416
; LINE_WIDTH: 0.46982
G1 X132.09 Y130.206 E.00471
; LINE_WIDTH: 0.519641
G1 X132.223 Y130.181 E.00526
; LINE_WIDTH: 0.569462
G1 X133.377 Y130.205 E.04954
; LINE_WIDTH: 0.521448
G1 X134.531 Y130.229 E.04502
; LINE_WIDTH: 0.473434
G1 X135.686 Y130.253 E.0405
; LINE_WIDTH: 0.408266
G2 X137 Y130.277 I1.235 J-31.596 E.03915
G1 X137.014 Y129.957 E.00955
G1 X136.854 Y129.943 E.00478
; LINE_WIDTH: 0.377405
G1 X135.702 Y129.871 E.03147
; LINE_WIDTH: 0.42542
G1 X134.549 Y129.799 E.03599
; LINE_WIDTH: 0.473434
G1 X133.397 Y129.727 E.0405
; LINE_WIDTH: 0.521448
G1 X132.245 Y129.655 E.04502
; LINE_WIDTH: 0.569462
G1 X132.114 Y129.62 E.00582
; LINE_WIDTH: 0.519641
G1 X131.983 Y129.584 E.00526
; LINE_WIDTH: 0.421809
G1 X131.853 Y129.548 E.00418
G1 X128.268 Y129.249 E.11104
; WIPE_START
G1 F24000
G1 X130.262 Y129.415 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I-.856 J-.865 P1  F30000
G1 X114.012 Y145.505 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6153
G1 X114.012 Y148.409 E.09634
G1 X127.589 Y148.409 E.45038
G1 X139.589 Y149.409 E.39944
G1 X145.012 Y149.409 E.17989
G1 X145.012 Y150.205 E.0264
G1 X113.716 Y150.205 E1.03814
G1 X113.716 Y144.909 E.17567
G1 X145.012 Y144.909 E1.03814
G1 X145.012 Y145.505 E.01977
G1 X114.072 Y145.505 E1.02634
G1 X114.404 Y145.897 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6153
G1 X114.404 Y148.017 E.06514
G1 X127.605 Y148.017 E.40564
G1 X139.605 Y149.017 E.37
G1 X145.404 Y149.017 E.17818
G1 X145.404 Y150.597 E.04855
G1 X113.324 Y150.597 E.98573
G1 X113.324 Y144.517 E.18682
G1 X145.404 Y144.517 E.98573
G1 X145.404 Y145.897 E.0424
G1 X114.464 Y145.897 E.9507
M204 S10000
G1 X113.919 Y145.207 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F6153
G1 X144.808 Y145.207 E.47513
; WIPE_START
G1 F24000
G1 X142.808 Y145.207 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I-1.116 J.485 P1  F30000
G1 X144.808 Y149.807 Z.8
G1 Z.4
G1 E.8 F1800
; LINE_WIDTH: 0.431684
G1 F6153
G1 X139.564 Y149.806 E.16613
; LINE_WIDTH: 0.432356
G1 X139 Y149.783 E.01793
; LINE_WIDTH: 0.474338
G1 X138.435 Y149.759 E.01986
; LINE_WIDTH: 0.51632
G1 X137.87 Y149.736 E.0218
; LINE_WIDTH: 0.558302
G1 X137.306 Y149.712 E.02373
; LINE_WIDTH: 0.600284
G1 X136.741 Y149.689 E.02566
G1 X127.993 Y149.325 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.640764
G1 F6153
G1 X127.92 Y149.295 E.00387
; LINE_WIDTH: 0.594008
G1 X127.846 Y149.266 E.00356
; LINE_WIDTH: 0.547251
G1 X127.772 Y149.236 E.00326
; LINE_WIDTH: 0.500494
G1 X127.699 Y149.207 E.00296
; LINE_WIDTH: 0.453737
G1 X127.625 Y149.177 E.00266
; LINE_WIDTH: 0.360363
G1 X127.551 Y149.148 E.00205
G1 X114.455 Y149.148 E.33877
G1 X114.455 Y149.465 E.00821
G1 X127.551 Y149.465 E.33877
; LINE_WIDTH: 0.360223
G1 X127.616 Y149.445 E.00174
; LINE_WIDTH: 0.40698
G1 X127.68 Y149.425 E.002
; LINE_WIDTH: 0.453737
G1 X127.744 Y149.404 E.00225
; LINE_WIDTH: 0.500494
G1 X127.808 Y149.384 E.00251
; LINE_WIDTH: 0.547251
G1 X127.872 Y149.363 E.00276
; LINE_WIDTH: 0.594008
G1 X127.936 Y149.343 E.00302
G1 X127.993 Y149.325 F30000
; LINE_WIDTH: 0.640764
G1 F6153
G1 X128.516 Y149.347 E.02547
; LINE_WIDTH: 0.596486
G1 X129.038 Y149.368 E.02358
; LINE_WIDTH: 0.552208
G1 X129.56 Y149.39 E.02169
; LINE_WIDTH: 0.507929
G1 X130.082 Y149.412 E.01981
; LINE_WIDTH: 0.463651
G1 X130.605 Y149.434 E.01792
; LINE_WIDTH: 0.419373
G1 X131.127 Y149.455 E.01604
G1 X127.572 Y148.801 F30000
; LINE_WIDTH: 0.419999
G1 F6153
G1 X114.108 Y148.801 E.41373
G1 X114.108 Y149.812 E.03109
G1 X131.187 Y149.812 E.52479
G1 X131.32 Y149.788 E.00416
; LINE_WIDTH: 0.46982
G1 X131.453 Y149.763 E.00471
; LINE_WIDTH: 0.519641
G1 X131.587 Y149.738 E.00526
; LINE_WIDTH: 0.569462
G1 X132.741 Y149.762 E.04954
; LINE_WIDTH: 0.521448
G1 X133.895 Y149.786 E.04502
; LINE_WIDTH: 0.473434
G1 X135.05 Y149.81 E.0405
; LINE_WIDTH: 0.408266
G2 X136.364 Y149.834 I1.235 J-31.596 E.03915
G1 X136.378 Y149.513 E.00955
G1 X136.218 Y149.5 E.00478
; LINE_WIDTH: 0.377405
G1 X135.065 Y149.428 E.03147
; LINE_WIDTH: 0.42542
G1 X133.913 Y149.356 E.03599
; LINE_WIDTH: 0.473434
G1 X132.761 Y149.284 E.0405
; LINE_WIDTH: 0.521448
G1 X131.608 Y149.212 E.04502
; LINE_WIDTH: 0.569462
G1 X131.478 Y149.176 E.00582
; LINE_WIDTH: 0.519641
G1 X131.347 Y149.14 E.00526
; LINE_WIDTH: 0.421809
G1 X131.216 Y149.104 E.00418
G1 X127.632 Y148.806 E.11104
; CHANGE_LAYER
; Z_HEIGHT: 0.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.625 Y148.972 E-.76
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
G3 Z.8 I1.02 J-.664 P1  F30000
G1 X114.648 Y125.948 Z.8
G1 Z.6
M73 P55 R5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6162
G1 X114.648 Y128.852 E.09634
G1 X128.225 Y128.852 E.45038
G1 X140.225 Y129.852 E.39944
G1 X145.648 Y129.852 E.17989
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
G1 F6162
G1 X115.04 Y128.46 E.06514
G1 X128.241 Y128.46 E.40564
G1 X140.241 Y129.46 E.37
G1 X146.04 Y129.46 E.17818
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
G1 F6162
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
G1 F6162
G1 X140.2 Y130.25 E.16613
; LINE_WIDTH: 0.432356
G1 X139.636 Y130.226 E.01793
; LINE_WIDTH: 0.474338
G1 X139.071 Y130.203 E.01986
; LINE_WIDTH: 0.51632
G1 X138.507 Y130.179 E.0218
; LINE_WIDTH: 0.558302
G1 X137.942 Y130.156 E.02373
; LINE_WIDTH: 0.600284
G1 X137.378 Y130.132 E.02566
G1 X128.63 Y129.768 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.640764
G1 F6162
G1 X128.556 Y129.739 E.00387
; LINE_WIDTH: 0.594008
G1 X128.482 Y129.709 E.00356
; LINE_WIDTH: 0.547251
G1 X128.409 Y129.68 E.00326
; LINE_WIDTH: 0.500494
G1 X128.335 Y129.65 E.00296
; LINE_WIDTH: 0.453737
G1 X128.261 Y129.621 E.00266
; LINE_WIDTH: 0.360363
G1 X128.188 Y129.591 E.00205
G1 X115.091 Y129.591 E.33877
G1 X115.091 Y129.909 E.00821
G1 X128.188 Y129.909 E.33877
; LINE_WIDTH: 0.360223
G1 X128.252 Y129.888 E.00174
; LINE_WIDTH: 0.40698
G1 X128.316 Y129.868 E.002
; LINE_WIDTH: 0.453737
G1 X128.38 Y129.848 E.00225
; LINE_WIDTH: 0.500494
G1 X128.444 Y129.827 E.00251
; LINE_WIDTH: 0.547251
G1 X128.508 Y129.807 E.00276
; LINE_WIDTH: 0.594008
G1 X128.572 Y129.787 E.00302
G1 X128.63 Y129.768 F30000
; LINE_WIDTH: 0.640764
G1 F6162
G1 X129.152 Y129.79 E.02547
; LINE_WIDTH: 0.596486
G1 X129.674 Y129.812 E.02358
; LINE_WIDTH: 0.552208
G1 X130.196 Y129.834 E.02169
; LINE_WIDTH: 0.507929
G1 X130.719 Y129.855 E.01981
; LINE_WIDTH: 0.463651
G1 X131.241 Y129.877 E.01792
; LINE_WIDTH: 0.419373
G1 X131.763 Y129.899 E.01604
G1 X128.209 Y129.244 F30000
; LINE_WIDTH: 0.419999
G1 F6162
G1 X114.744 Y129.244 E.41373
G1 X114.744 Y130.256 E.03109
G1 X131.823 Y130.256 E.52479
G1 X131.956 Y130.231 E.00416
; LINE_WIDTH: 0.46982
G1 X132.09 Y130.206 E.00471
; LINE_WIDTH: 0.519641
G1 X132.223 Y130.181 E.00526
; LINE_WIDTH: 0.569462
G1 X133.377 Y130.205 E.04954
; LINE_WIDTH: 0.521448
G1 X134.531 Y130.229 E.04502
; LINE_WIDTH: 0.473434
G1 X135.686 Y130.253 E.0405
; LINE_WIDTH: 0.408266
G2 X137 Y130.277 I1.235 J-31.596 E.03915
G1 X137.014 Y129.957 E.00955
G1 X136.854 Y129.943 E.00478
; LINE_WIDTH: 0.377405
G1 X135.702 Y129.871 E.03147
; LINE_WIDTH: 0.42542
G1 X134.549 Y129.799 E.03599
; LINE_WIDTH: 0.473434
G1 X133.397 Y129.727 E.0405
; LINE_WIDTH: 0.521448
G1 X132.245 Y129.655 E.04502
; LINE_WIDTH: 0.569462
G1 X132.114 Y129.62 E.00582
; LINE_WIDTH: 0.519641
G1 X131.983 Y129.584 E.00526
; LINE_WIDTH: 0.421809
G1 X131.853 Y129.548 E.00418
G1 X128.268 Y129.249 E.11104
; WIPE_START
G1 F24000
G1 X130.262 Y129.415 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I-.856 J-.865 P1  F30000
G1 X114.012 Y145.505 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6162
G1 X114.012 Y148.409 E.09634
G1 X127.589 Y148.409 E.45038
G1 X139.589 Y149.409 E.39944
G1 X145.012 Y149.409 E.17989
G1 X145.012 Y150.205 E.0264
G1 X113.716 Y150.205 E1.03814
G1 X113.716 Y144.909 E.17567
G1 X145.012 Y144.909 E1.03814
G1 X145.012 Y145.505 E.01977
G1 X114.072 Y145.505 E1.02634
G1 X114.404 Y145.897 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6162
G1 X114.404 Y148.017 E.06514
G1 X127.605 Y148.017 E.40564
G1 X139.605 Y149.017 E.37
G1 X145.404 Y149.017 E.17818
G1 X145.404 Y150.597 E.04855
G1 X113.324 Y150.597 E.98573
G1 X113.324 Y144.517 E.18682
G1 X145.404 Y144.517 E.98573
G1 X145.404 Y145.897 E.0424
G1 X114.464 Y145.897 E.9507
M204 S10000
G1 X113.919 Y145.207 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F6162
G1 X144.808 Y145.207 E.47513
; WIPE_START
G1 F24000
G1 X142.808 Y145.207 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I-1.116 J.485 P1  F30000
G1 X144.808 Y149.807 Z1
G1 Z.6
G1 E.8 F1800
; LINE_WIDTH: 0.431684
G1 F6162
G1 X139.564 Y149.806 E.16613
; LINE_WIDTH: 0.432356
G1 X139 Y149.783 E.01793
; LINE_WIDTH: 0.474338
G1 X138.435 Y149.759 E.01986
; LINE_WIDTH: 0.51632
G1 X137.87 Y149.736 E.0218
; LINE_WIDTH: 0.558302
G1 X137.306 Y149.712 E.02373
; LINE_WIDTH: 0.600284
G1 X136.741 Y149.689 E.02566
G1 X127.993 Y149.325 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.640764
G1 F6162
G1 X127.92 Y149.295 E.00387
; LINE_WIDTH: 0.594008
G1 X127.846 Y149.266 E.00356
; LINE_WIDTH: 0.547251
G1 X127.772 Y149.236 E.00326
; LINE_WIDTH: 0.500494
G1 X127.699 Y149.207 E.00296
; LINE_WIDTH: 0.453737
G1 X127.625 Y149.177 E.00266
; LINE_WIDTH: 0.360363
G1 X127.551 Y149.148 E.00205
G1 X114.455 Y149.148 E.33877
G1 X114.455 Y149.465 E.00821
G1 X127.551 Y149.465 E.33877
; LINE_WIDTH: 0.360223
G1 X127.616 Y149.445 E.00174
; LINE_WIDTH: 0.40698
G1 X127.68 Y149.425 E.002
; LINE_WIDTH: 0.453737
G1 X127.744 Y149.404 E.00225
; LINE_WIDTH: 0.500494
G1 X127.808 Y149.384 E.00251
; LINE_WIDTH: 0.547251
G1 X127.872 Y149.363 E.00276
; LINE_WIDTH: 0.594008
G1 X127.936 Y149.343 E.00302
G1 X127.993 Y149.325 F30000
; LINE_WIDTH: 0.640764
G1 F6162
G1 X128.516 Y149.347 E.02547
; LINE_WIDTH: 0.596486
G1 X129.038 Y149.368 E.02358
; LINE_WIDTH: 0.552208
M73 P56 R5
G1 X129.56 Y149.39 E.02169
; LINE_WIDTH: 0.507929
G1 X130.082 Y149.412 E.01981
; LINE_WIDTH: 0.463651
G1 X130.605 Y149.434 E.01792
; LINE_WIDTH: 0.419373
G1 X131.127 Y149.455 E.01604
G1 X127.572 Y148.801 F30000
; LINE_WIDTH: 0.419999
G1 F6162
G1 X114.108 Y148.801 E.41373
G1 X114.108 Y149.812 E.03109
G1 X131.187 Y149.812 E.52479
G1 X131.32 Y149.788 E.00416
; LINE_WIDTH: 0.46982
G1 X131.453 Y149.763 E.00471
; LINE_WIDTH: 0.519641
G1 X131.587 Y149.738 E.00526
; LINE_WIDTH: 0.569462
G1 X132.741 Y149.762 E.04954
; LINE_WIDTH: 0.521448
G1 X133.895 Y149.786 E.04502
; LINE_WIDTH: 0.473434
G1 X135.05 Y149.81 E.0405
; LINE_WIDTH: 0.408266
G2 X136.364 Y149.834 I1.235 J-31.596 E.03915
G1 X136.378 Y149.513 E.00955
M73 P56 R4
G1 X136.218 Y149.5 E.00478
; LINE_WIDTH: 0.377405
G1 X135.065 Y149.428 E.03147
; LINE_WIDTH: 0.42542
G1 X133.913 Y149.356 E.03599
; LINE_WIDTH: 0.473434
G1 X132.761 Y149.284 E.0405
; LINE_WIDTH: 0.521448
G1 X131.608 Y149.212 E.04502
; LINE_WIDTH: 0.569462
G1 X131.478 Y149.176 E.00582
; LINE_WIDTH: 0.519641
G1 X131.347 Y149.14 E.00526
; LINE_WIDTH: 0.421809
G1 X131.216 Y149.104 E.00418
G1 X127.632 Y148.806 E.11104
; CHANGE_LAYER
; Z_HEIGHT: 0.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.625 Y148.972 E-.76
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
G3 Z1 I1.02 J-.664 P1  F30000
G1 X114.648 Y125.948 Z1
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5308
G1 X114.648 Y128.852 E.09634
G1 X128.225 Y128.852 E.45038
G1 X140.225 Y129.852 E.39944
G1 X145.648 Y129.852 E.17989
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
G1 F5308
G1 X115.04 Y128.46 E.06514
G1 X128.241 Y128.46 E.40564
G1 X140.241 Y129.46 E.37
G1 X146.04 Y129.46 E.17818
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
G1 F5308
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
G1 F5308
G1 X140.2 Y130.25 E.16613
; LINE_WIDTH: 0.432356
G1 X139.636 Y130.226 E.01793
; LINE_WIDTH: 0.474338
G1 X139.071 Y130.203 E.01986
; LINE_WIDTH: 0.51632
G1 X138.507 Y130.179 E.0218
; LINE_WIDTH: 0.558302
G1 X137.942 Y130.156 E.02373
; LINE_WIDTH: 0.600284
G1 X137.378 Y130.132 E.02566
G1 X134.217 Y129.701 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5308
G1 X135.84 Y129.836 E.05401
G1 X135.376 Y130.3 E.02175
G1 X132.3 Y130.3 E.10206
G1 X131.472 Y129.472 E.03882
G1 X128.754 Y129.246 E.09047
G1 X127.7 Y130.3 E.04944
G1 X124.624 Y130.3 E.10206
G1 X123.524 Y129.2 E.05157
G1 X121.124 Y129.2 E.07964
G1 X120.024 Y130.3 E.05157
G1 X116.948 Y130.3 E.10206
G1 X115.848 Y129.2 E.05157
G1 X117.477 Y129.2 E.05401
; WIPE_START
G1 F24000
G1 X115.848 Y129.2 E-.61876
G1 X116.111 Y129.463 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I-1.207 J-.158 P1  F30000
G1 X114.012 Y145.505 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5308
G1 X114.012 Y148.409 E.09634
G1 X127.589 Y148.409 E.45038
G1 X139.589 Y149.409 E.39944
G1 X145.012 Y149.409 E.17989
G1 X145.012 Y150.205 E.0264
G1 X113.716 Y150.205 E1.03814
G1 X113.716 Y144.909 E.17567
G1 X145.012 Y144.909 E1.03814
G1 X145.012 Y145.505 E.01977
G1 X114.072 Y145.505 E1.02634
G1 X114.404 Y145.897 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M73 P57 R4
G1 F5308
G1 X114.404 Y148.017 E.06514
G1 X127.605 Y148.017 E.40564
G1 X139.605 Y149.017 E.37
G1 X145.404 Y149.017 E.17818
G1 X145.404 Y150.597 E.04855
G1 X113.324 Y150.597 E.98573
G1 X113.324 Y144.517 E.18682
G1 X145.404 Y144.517 E.98573
G1 X145.404 Y145.897 E.0424
G1 X114.464 Y145.897 E.9507
M204 S10000
G1 X113.919 Y145.207 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5308
G1 X144.808 Y145.207 E.47513
; WIPE_START
G1 F24000
G1 X142.808 Y145.207 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I-1.116 J.485 P1  F30000
G1 X144.808 Y149.807 Z1.2
G1 Z.8
G1 E.8 F1800
; LINE_WIDTH: 0.431684
G1 F5308
G1 X139.564 Y149.806 E.16613
; LINE_WIDTH: 0.432356
G1 X139 Y149.783 E.01793
; LINE_WIDTH: 0.474338
G1 X138.435 Y149.759 E.01986
; LINE_WIDTH: 0.51632
G1 X137.87 Y149.736 E.0218
; LINE_WIDTH: 0.558302
G1 X137.306 Y149.712 E.02373
; LINE_WIDTH: 0.600284
G1 X136.741 Y149.689 E.02566
G1 X133.581 Y149.258 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5308
G1 X135.204 Y149.393 E.05401
G1 X134.74 Y149.856 E.02175
G1 X131.663 Y149.856 E.10206
G1 X130.836 Y149.029 E.03882
G1 X128.118 Y148.802 E.09047
G1 X127.064 Y149.856 E.04944
G1 X123.987 Y149.856 E.10206
G1 X122.888 Y148.757 E.05157
G1 X120.487 Y148.757 E.07964
G1 X119.388 Y149.856 E.05157
G1 X116.311 Y149.856 E.10206
G1 X115.212 Y148.757 E.05157
G1 X116.84 Y148.757 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X115.212 Y148.757 E-.61876
G1 X115.475 Y149.02 E-.14124
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
G3 Z1.2 I1.216 J-.044 P1  F30000
G1 X114.648 Y125.948 Z1.2
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5302
G1 X114.648 Y128.852 E.09634
G1 X128.225 Y128.852 E.45038
G1 X140.225 Y129.852 E.39944
G1 X145.648 Y129.852 E.17989
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
G1 F5302
G1 X115.04 Y128.46 E.06514
G1 X128.241 Y128.46 E.40564
G1 X140.241 Y129.46 E.37
G1 X146.04 Y129.46 E.17818
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
G1 F5302
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
G1 F5302
G1 X140.2 Y130.25 E.16613
; LINE_WIDTH: 0.432356
G1 X139.636 Y130.226 E.01793
; LINE_WIDTH: 0.474338
G1 X139.071 Y130.203 E.01986
; LINE_WIDTH: 0.51632
G1 X138.507 Y130.179 E.0218
; LINE_WIDTH: 0.558302
G1 X137.942 Y130.156 E.02373
; LINE_WIDTH: 0.600284
G1 X137.378 Y130.132 E.02566
G1 X134.217 Y129.701 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5302
G1 X135.84 Y129.836 E.05401
G1 X135.376 Y130.3 E.02175
G1 X132.3 Y130.3 E.10206
G1 X131.472 Y129.472 E.03882
G1 X128.754 Y129.246 E.09047
G1 X127.7 Y130.3 E.04944
G1 X124.624 Y130.3 E.10206
G1 X123.524 Y129.2 E.05157
G1 X121.124 Y129.2 E.07964
G1 X120.024 Y130.3 E.05157
G1 X116.948 Y130.3 E.10206
G1 X115.848 Y129.2 E.05157
G1 X117.477 Y129.2 E.05401
; WIPE_START
G1 F24000
G1 X115.848 Y129.2 E-.61876
G1 X116.111 Y129.463 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I-1.207 J-.158 P1  F30000
M73 P58 R4
G1 X114.012 Y145.505 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5302
G1 X114.012 Y148.409 E.09634
G1 X127.589 Y148.409 E.45038
G1 X139.589 Y149.409 E.39944
G1 X145.012 Y149.409 E.17989
G1 X145.012 Y150.205 E.0264
G1 X113.716 Y150.205 E1.03814
G1 X113.716 Y144.909 E.17567
G1 X145.012 Y144.909 E1.03814
G1 X145.012 Y145.505 E.01977
G1 X114.072 Y145.505 E1.02634
G1 X114.404 Y145.897 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5302
G1 X114.404 Y148.017 E.06514
G1 X127.605 Y148.017 E.40564
G1 X139.605 Y149.017 E.37
G1 X145.404 Y149.017 E.17818
G1 X145.404 Y150.597 E.04855
G1 X113.324 Y150.597 E.98573
G1 X113.324 Y144.517 E.18682
G1 X145.404 Y144.517 E.98573
G1 X145.404 Y145.897 E.0424
G1 X114.464 Y145.897 E.9507
M204 S10000
G1 X113.919 Y145.207 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5302
G1 X144.808 Y145.207 E.47513
; WIPE_START
G1 F24000
G1 X142.808 Y145.207 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I-1.116 J.485 P1  F30000
G1 X144.808 Y149.807 Z1.4
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.431684
G1 F5302
G1 X139.564 Y149.806 E.16613
; LINE_WIDTH: 0.432356
G1 X139 Y149.783 E.01793
; LINE_WIDTH: 0.474338
G1 X138.435 Y149.759 E.01986
; LINE_WIDTH: 0.51632
G1 X137.87 Y149.736 E.0218
; LINE_WIDTH: 0.558302
G1 X137.306 Y149.712 E.02373
; LINE_WIDTH: 0.600284
G1 X136.741 Y149.689 E.02566
G1 X133.581 Y149.258 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5302
G1 X135.204 Y149.393 E.05401
G1 X134.74 Y149.856 E.02175
G1 X131.663 Y149.856 E.10206
G1 X130.836 Y149.029 E.03882
G1 X128.118 Y148.802 E.09047
G1 X127.064 Y149.856 E.04944
G1 X123.987 Y149.856 E.10206
G1 X122.888 Y148.757 E.05157
G1 X120.487 Y148.757 E.07964
G1 X119.388 Y149.856 E.05157
G1 X116.311 Y149.856 E.10206
G1 X115.212 Y148.757 E.05157
G1 X116.84 Y148.757 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 1.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X115.212 Y148.757 E-.61876
G1 X115.475 Y149.02 E-.14124
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
G3 Z1.4 I1.216 J-.044 P1  F30000
G1 X114.648 Y125.948 Z1.4
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5302
G1 X114.648 Y128.852 E.09634
G1 X128.225 Y128.852 E.45038
G1 X140.225 Y129.852 E.39944
G1 X145.648 Y129.852 E.17989
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
M73 P59 R4
G1 F5302
G1 X115.04 Y128.46 E.06514
G1 X128.241 Y128.46 E.40564
G1 X140.241 Y129.46 E.37
G1 X146.04 Y129.46 E.17818
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
G1 F5302
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
G1 F5302
G1 X140.2 Y130.25 E.16613
; LINE_WIDTH: 0.432356
G1 X139.636 Y130.226 E.01793
; LINE_WIDTH: 0.474338
G1 X139.071 Y130.203 E.01986
; LINE_WIDTH: 0.51632
G1 X138.507 Y130.179 E.0218
; LINE_WIDTH: 0.558302
G1 X137.942 Y130.156 E.02373
; LINE_WIDTH: 0.600284
G1 X137.378 Y130.132 E.02566
G1 X134.217 Y129.701 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5302
G1 X135.84 Y129.836 E.05401
G1 X135.376 Y130.3 E.02175
G1 X132.3 Y130.3 E.10206
G1 X131.472 Y129.472 E.03882
G1 X128.754 Y129.246 E.09047
G1 X127.7 Y130.3 E.04944
G1 X124.624 Y130.3 E.10206
G1 X123.524 Y129.2 E.05157
G1 X121.124 Y129.2 E.07964
G1 X120.024 Y130.3 E.05157
G1 X116.948 Y130.3 E.10206
G1 X115.848 Y129.2 E.05157
G1 X117.477 Y129.2 E.05401
; WIPE_START
G1 F24000
G1 X115.848 Y129.2 E-.61876
G1 X116.111 Y129.463 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I-1.207 J-.158 P1  F30000
G1 X114.012 Y145.505 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5302
G1 X114.012 Y148.409 E.09634
G1 X127.589 Y148.409 E.45038
G1 X139.589 Y149.409 E.39944
G1 X145.012 Y149.409 E.17989
G1 X145.012 Y150.205 E.0264
G1 X113.716 Y150.205 E1.03814
G1 X113.716 Y144.909 E.17567
G1 X145.012 Y144.909 E1.03814
G1 X145.012 Y145.505 E.01977
G1 X114.072 Y145.505 E1.02634
G1 X114.404 Y145.897 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5302
G1 X114.404 Y148.017 E.06514
G1 X127.605 Y148.017 E.40564
G1 X139.605 Y149.017 E.37
G1 X145.404 Y149.017 E.17818
G1 X145.404 Y150.597 E.04855
G1 X113.324 Y150.597 E.98573
G1 X113.324 Y144.517 E.18682
G1 X145.404 Y144.517 E.98573
G1 X145.404 Y145.897 E.0424
G1 X114.464 Y145.897 E.9507
M204 S10000
G1 X113.919 Y145.207 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5302
G1 X144.808 Y145.207 E.47513
; WIPE_START
G1 F24000
G1 X142.808 Y145.207 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I-1.116 J.485 P1  F30000
G1 X144.808 Y149.807 Z1.6
G1 Z1.2
G1 E.8 F1800
; LINE_WIDTH: 0.431684
G1 F5302
G1 X139.564 Y149.806 E.16613
; LINE_WIDTH: 0.432356
G1 X139 Y149.783 E.01793
; LINE_WIDTH: 0.474338
G1 X138.435 Y149.759 E.01986
; LINE_WIDTH: 0.51632
G1 X137.87 Y149.736 E.0218
; LINE_WIDTH: 0.558302
G1 X137.306 Y149.712 E.02373
; LINE_WIDTH: 0.600284
G1 X136.741 Y149.689 E.02566
G1 X133.581 Y149.258 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5302
G1 X135.204 Y149.393 E.05401
G1 X134.74 Y149.856 E.02175
G1 X131.663 Y149.856 E.10206
G1 X130.836 Y149.029 E.03882
G1 X128.118 Y148.802 E.09047
G1 X127.064 Y149.856 E.04944
G1 X123.987 Y149.856 E.10206
G1 X122.888 Y148.757 E.05157
G1 X120.487 Y148.757 E.07964
G1 X119.388 Y149.856 E.05157
G1 X116.311 Y149.856 E.10206
G1 X115.212 Y148.757 E.05157
G1 X116.84 Y148.757 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 1.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X115.212 Y148.757 E-.61876
G1 X115.475 Y149.02 E-.14124
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
M73 P60 R4
G3 Z1.6 I1.216 J-.044 P1  F30000
G1 X114.648 Y125.948 Z1.6
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5688
G1 X114.648 Y128.852 E.09634
G1 X128.225 Y128.852 E.45038
G1 X140.225 Y129.852 E.39944
G1 X141.506 Y129.852 E.04248
G1 X141.506 Y130.648 E.0264
G1 X114.352 Y130.648 E.90073
G1 X114.352 Y125.352 E.17567
G1 X145.648 Y125.352 E1.03814
G1 X145.648 Y125.948 E.01977
G1 X114.708 Y125.948 E1.02634
; WIPE_START
G1 F24000
G1 X114.667 Y127.947 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-.076 J1.215 P1  F30000
G1 X144.994 Y129.852 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F5688
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
G1 F5688
G1 X115.04 Y128.46 E.06514
G1 X128.241 Y128.46 E.40564
G1 X140.241 Y129.46 E.37
G1 X146.04 Y129.46 E.17818
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
G1 F5688
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
G1 F5688
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
G1 F5688
G3 X140.2 Y130.25 I-.543 J-26.511 E.0349
; LINE_WIDTH: 0.432356
G1 X139.636 Y130.226 E.01793
; LINE_WIDTH: 0.474338
G1 X139.071 Y130.203 E.01986
; LINE_WIDTH: 0.51632
G1 X138.507 Y130.179 E.0218
; LINE_WIDTH: 0.558302
G1 X137.942 Y130.156 E.02373
; LINE_WIDTH: 0.600284
G1 X137.378 Y130.132 E.02566
G1 X134.217 Y129.701 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5688
G1 X135.84 Y129.836 E.05401
G1 X135.376 Y130.3 E.02175
G1 X132.3 Y130.3 E.10206
G1 X131.472 Y129.472 E.03882
G1 X128.754 Y129.246 E.09047
G1 X127.7 Y130.3 E.04944
G1 X124.624 Y130.3 E.10206
G1 X123.524 Y129.2 E.05157
G1 X121.124 Y129.2 E.07964
G1 X120.024 Y130.3 E.05157
G1 X116.948 Y130.3 E.10206
G1 X115.848 Y129.2 E.05157
G1 X117.477 Y129.2 E.05401
; WIPE_START
G1 F24000
G1 X115.848 Y129.2 E-.61876
G1 X116.111 Y129.463 E-.14124
; WIPE_END
M73 P61 R4
G1 E-.04 F1800
G17
G3 Z1.8 I-1.207 J-.158 P1  F30000
G1 X114.012 Y145.505 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5688
G1 X114.012 Y148.409 E.09634
G1 X127.589 Y148.409 E.45038
G1 X139.589 Y149.409 E.39944
G1 X140.869 Y149.409 E.04248
G1 X140.869 Y150.205 E.0264
G1 X113.716 Y150.205 E.90073
G1 X113.716 Y144.909 E.17567
G1 X145.012 Y144.909 E1.03814
G1 X145.012 Y145.505 E.01977
G1 X114.072 Y145.505 E1.02634
; WIPE_START
G1 F24000
G1 X114.03 Y147.504 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-.076 J1.215 P1  F30000
G1 X144.358 Y149.409 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F5688
G1 X145.012 Y149.409 E.02168
G1 X145.012 Y150.205 E.0264
G1 X144.358 Y150.205 E.02168
G1 X144.358 Y149.469 E.02441
; WIPE_START
G1 F24000
G1 X145.012 Y149.409 E-.24939
G1 X145.012 Y150.205 E-.30242
G1 X144.464 Y150.205 E-.20819
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I.173 J-1.205 P1  F30000
G1 X114.404 Y145.897 Z1.8
G1 Z1.4
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5688
G1 X114.404 Y148.017 E.06514
G1 X127.605 Y148.017 E.40564
G1 X139.605 Y149.017 E.37
G1 X145.404 Y149.017 E.17818
G1 X145.404 Y150.597 E.04855
G1 X113.324 Y150.597 E.98573
G1 X113.324 Y144.517 E.18682
G1 X145.404 Y144.517 E.98573
G1 X145.404 Y145.897 E.0424
G1 X114.464 Y145.897 E.9507
M204 S10000
G1 X113.919 Y145.207 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5688
G1 X144.808 Y145.207 E.47513
; WIPE_START
G1 F24000
G1 X142.808 Y145.207 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-1.169 J.338 P1  F30000
G1 X144.136 Y149.797 Z1.8
G1 Z1.4
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F5688
G1 X143.563 Y149.224 E.02489
G1 X143.03 Y149.224
G1 X144.136 Y150.33 E.04806
G1 X143.662 Y150.389
G1 X142.496 Y149.224 E.05063
G1 X141.963 Y149.224
G1 X143.128 Y150.389 E.05063
G1 X142.595 Y150.389
G1 X141.43 Y149.224 E.05063
G1 X141.092 Y149.419
G1 X142.062 Y150.389 E.04215
G1 X141.529 Y150.389
G1 X141.092 Y149.952 E.01898
M204 S10000
G1 X140.666 Y149.807 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F5688
G3 X139.564 Y149.806 I-.543 J-26.511 E.0349
; LINE_WIDTH: 0.432356
G1 X139 Y149.783 E.01793
; LINE_WIDTH: 0.474338
G1 X138.435 Y149.759 E.01986
; LINE_WIDTH: 0.51632
G1 X137.87 Y149.736 E.0218
; LINE_WIDTH: 0.558302
G1 X137.306 Y149.712 E.02373
; LINE_WIDTH: 0.600284
G1 X136.741 Y149.689 E.02566
G1 X133.581 Y149.258 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5688
G1 X135.204 Y149.393 E.05401
G1 X134.74 Y149.856 E.02175
G1 X131.663 Y149.856 E.10206
G1 X130.836 Y149.029 E.03882
G1 X128.118 Y148.802 E.09047
G1 X127.064 Y149.856 E.04944
G1 X123.987 Y149.856 E.10206
G1 X122.888 Y148.757 E.05157
G1 X120.487 Y148.757 E.07964
G1 X119.388 Y149.856 E.05157
G1 X116.311 Y149.856 E.10206
G1 X115.212 Y148.757 E.05157
G1 X116.84 Y148.757 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 1.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X115.212 Y148.757 E-.61876
G1 X115.475 Y149.02 E-.14124
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
G3 Z1.8 I1.216 J-.044 P1  F30000
G1 X114.648 Y125.948 Z1.8
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5926
G1 X114.648 Y128.852 E.09634
G1 X128.225 Y128.852 E.45038
G1 X140.225 Y129.852 E.39944
G1 X141.981 Y129.852 E.05826
G1 X141.981 Y130.648 E.0264
G1 X114.352 Y130.648 E.91651
G1 X114.352 Y125.352 E.17567
G1 X141.659 Y125.352 E.90581
G1 X141.659 Y125.948 E.01977
G1 X114.708 Y125.948 E.894
; WIPE_START
G1 F24000
G1 X114.667 Y127.947 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I.104 J1.212 P1  F30000
G1 X144.841 Y125.352 Z2
G1 Z1.6
G1 E.8 F1800
G1 F5926
M73 P62 R4
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
G1 F5926
G1 X115.04 Y128.46 E.06514
G1 X128.241 Y128.46 E.40564
G1 X140.241 Y129.46 E.37
G1 X142.373 Y129.46 E.06551
G1 X142.373 Y131.04 E.04855
G1 X113.96 Y131.04 E.87306
G1 X113.96 Y124.96 E.18682
G1 X146.04 Y124.96 E.98573
G1 X146.04 Y126.34 E.0424
G1 X115.1 Y126.34 E.9507
M204 S10000
G1 X114.556 Y125.65 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5926
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
G1 F5926
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
G1 F5926
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
G1 F5926
G3 X140.2 Y130.25 I-.781 J-37.957 E.04998
; LINE_WIDTH: 0.432356
G1 X139.636 Y130.226 E.01793
; LINE_WIDTH: 0.474338
G1 X139.071 Y130.203 E.01986
; LINE_WIDTH: 0.51632
G1 X138.507 Y130.179 E.0218
; LINE_WIDTH: 0.558302
G1 X137.942 Y130.156 E.02373
; LINE_WIDTH: 0.600284
G1 X137.378 Y130.132 E.02566
G1 X134.217 Y129.701 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5926
G1 X135.84 Y129.836 E.05401
G1 X135.376 Y130.3 E.02175
G1 X132.3 Y130.3 E.10206
G1 X131.472 Y129.472 E.03882
G1 X128.754 Y129.246 E.09047
G1 X127.7 Y130.3 E.04944
G1 X124.624 Y130.3 E.10206
G1 X123.524 Y129.2 E.05157
G1 X121.124 Y129.2 E.07964
G1 X120.024 Y130.3 E.05157
G1 X116.948 Y130.3 E.10206
G1 X115.848 Y129.2 E.05157
G1 X117.477 Y129.2 E.05401
; WIPE_START
G1 F24000
G1 X115.848 Y129.2 E-.61876
G1 X116.111 Y129.463 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-.017 J1.217 P1  F30000
G1 X144.519 Y129.852 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5926
G1 X145.648 Y129.852 E.03746
G1 X145.648 Y130.648 E.0264
G1 X144.519 Y130.648 E.03746
G1 X144.519 Y129.912 E.02441
G1 X144.127 Y129.46 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5926
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
G3 Z2 I-.543 J-1.089 P1  F30000
G1 X114.012 Y145.505 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5926
G1 X114.012 Y148.409 E.09634
G1 X127.589 Y148.409 E.45038
G1 X139.589 Y149.409 E.39944
G1 X141.345 Y149.409 E.05826
G1 X141.345 Y150.205 E.0264
G1 X113.716 Y150.205 E.91651
G1 X113.716 Y144.909 E.17567
G1 X141.022 Y144.909 E.90581
G1 X141.022 Y145.505 E.01977
G1 X114.072 Y145.505 E.894
; WIPE_START
G1 F24000
G1 X114.03 Y147.504 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I.104 J1.212 P1  F30000
G1 X144.205 Y144.909 Z2
G1 Z1.6
G1 E.8 F1800
G1 F5926
G1 X145.012 Y144.909 E.02675
G1 X145.012 Y145.505 E.01977
G1 X144.205 Y145.505 E.02675
G1 X144.205 Y144.969 E.01777
; WIPE_START
G1 F24000
G1 X145.012 Y144.909 E-.30732
G1 X145.012 Y145.505 E-.22642
G1 X144.416 Y145.505 E-.22626
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-.016 J-1.217 P1  F30000
G1 X114.404 Y145.897 Z2
G1 Z1.6
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5926
G1 X114.404 Y148.017 E.06514
G1 X127.605 Y148.017 E.40564
G1 X139.605 Y149.017 E.37
G1 X141.737 Y149.017 E.06551
G1 X141.737 Y150.597 E.04855
G1 X113.324 Y150.597 E.87306
G1 X113.324 Y144.517 E.18682
G1 X145.404 Y144.517 E.98573
G1 X145.404 Y145.897 E.0424
G1 X114.464 Y145.897 E.9507
M204 S10000
G1 X113.919 Y145.207 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5926
G1 X140.819 Y145.207 E.41376
; WIPE_START
G1 F24000
G1 X138.819 Y145.207 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-.132 J1.21 P1  F30000
G1 X143.23 Y145.689 Z2
G1 Z1.6
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F5926
G1 X143.983 Y144.936 E.03273
G1 X143.662 Y144.724
M73 P63 R4
G1 X142.696 Y145.689 E.04194
G1 X142.163 Y145.689
G1 X143.128 Y144.724 E.04194
G1 X142.595 Y144.724
G1 X141.63 Y145.689 E.04194
G1 X141.245 Y145.541
G1 X142.062 Y144.724 E.03551
M204 S10000
; WIPE_START
G1 F24000
G1 X141.245 Y145.541 E-.43909
G1 X141.63 Y145.689 E-.1568
G1 X141.935 Y145.384 E-.16411
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I.087 J1.214 P1  F30000
G1 X144.409 Y145.207 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5926
G1 X144.808 Y145.207 E.00614
; WIPE_START
G1 F24000
G1 X144.409 Y145.207 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-.992 J-.705 P1  F30000
G1 X141.142 Y149.807 Z2
G1 Z1.6
G1 E.8 F1800
; LINE_WIDTH: 0.431684
G1 F5926
G3 X139.564 Y149.806 I-.781 J-37.957 E.04998
; LINE_WIDTH: 0.432356
G1 X139 Y149.783 E.01793
; LINE_WIDTH: 0.474338
G1 X138.435 Y149.759 E.01986
; LINE_WIDTH: 0.51632
G1 X137.87 Y149.736 E.0218
; LINE_WIDTH: 0.558302
G1 X137.306 Y149.712 E.02373
; LINE_WIDTH: 0.600284
G1 X136.741 Y149.689 E.02566
G1 X133.581 Y149.258 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5926
G1 X135.204 Y149.393 E.05401
G1 X134.74 Y149.856 E.02175
G1 X131.663 Y149.856 E.10206
G1 X130.836 Y149.029 E.03882
G1 X128.118 Y148.802 E.09047
G1 X127.064 Y149.856 E.04944
G1 X123.987 Y149.856 E.10206
G1 X122.888 Y148.757 E.05157
G1 X120.487 Y148.757 E.07964
G1 X119.388 Y149.856 E.05157
G1 X116.311 Y149.856 E.10206
G1 X115.212 Y148.757 E.05157
G1 X116.84 Y148.757 E.05401
; WIPE_START
G1 F24000
G1 X115.212 Y148.757 E-.61876
G1 X115.475 Y149.02 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-.017 J1.217 P1  F30000
G1 X143.882 Y149.409 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5926
G1 X145.012 Y149.409 E.03746
G1 X145.012 Y150.205 E.0264
G1 X143.882 Y150.205 E.03746
G1 X143.882 Y149.469 E.02441
G1 X143.49 Y149.017 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5926
G1 X145.404 Y149.017 E.05879
G1 X145.404 Y150.597 E.04855
G1 X143.49 Y150.597 E.05879
G1 X143.49 Y149.077 E.04671
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X145.404 Y149.017 E-.72745
G1 X145.404 Y149.102 E-.03255
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
G3 Z2 I1.216 J-.035 P1  F30000
G1 X144.855 Y129.852 Z2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5313
G1 X145.648 Y129.852 E.02631
G1 X145.648 Y130.648 E.0264
G1 X144.855 Y130.648 E.02631
G1 X144.855 Y129.912 E.02441
G1 X144.463 Y129.46 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5313
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
G1 F5313
G1 X144.366 Y125.352 E.01977
G1 X145.648 Y125.352 E.04253
G1 X145.648 Y125.948 E.01977
G1 X144.426 Y125.948 E.04054
G1 X143.974 Y126.34 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5313
G1 X143.974 Y124.96 E.0424
G1 X146.04 Y124.96 E.06349
G1 X146.04 Y126.34 E.0424
G1 X144.034 Y126.34 E.06165
M204 S10000
G1 X144.569 Y125.65 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5313
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
G1 F5313
G1 X114.648 Y128.852 E.09634
G1 X128.225 Y128.852 E.45038
G1 X140.225 Y129.852 E.39944
G1 X141.645 Y129.852 E.04711
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
G1 F5313
G1 X115.04 Y128.46 E.06514
G1 X128.241 Y128.46 E.40564
G1 X140.241 Y129.46 E.37
G1 X142.037 Y129.46 E.05519
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
G1 F5313
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
G1 F5313
G3 X140.2 Y130.25 I-.613 J-29.87 E.03933
; LINE_WIDTH: 0.432356
G1 X139.636 Y130.226 E.01793
; LINE_WIDTH: 0.474338
G1 X139.071 Y130.203 E.01986
; LINE_WIDTH: 0.51632
G1 X138.507 Y130.179 E.0218
; LINE_WIDTH: 0.558302
G1 X137.942 Y130.156 E.02373
; LINE_WIDTH: 0.600284
G1 X137.378 Y130.132 E.02566
G1 X134.217 Y129.701 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5313
G1 X135.84 Y129.836 E.05401
G1 X135.376 Y130.3 E.02175
G1 X132.3 Y130.3 E.10206
G1 X131.472 Y129.472 E.03882
G1 X128.754 Y129.246 E.09047
G1 X127.7 Y130.3 E.04944
G1 X124.624 Y130.3 E.10206
G1 X123.524 Y129.2 E.05157
G1 X121.124 Y129.2 E.07964
G1 X120.024 Y130.3 E.05157
G1 X116.948 Y130.3 E.10206
G1 X115.848 Y129.2 E.05157
G1 X117.477 Y129.2 E.05401
; WIPE_START
G1 F24000
G1 X115.848 Y129.2 E-.61876
M73 P64 R4
G1 X116.111 Y129.463 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-.704 J.992 P1  F30000
G1 X144.219 Y149.409 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5313
G1 X145.012 Y149.409 E.02631
G1 X145.012 Y150.205 E.0264
G1 X144.219 Y150.205 E.02631
G1 X144.219 Y149.469 E.02441
G1 X143.826 Y149.017 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5313
G1 X145.404 Y149.017 E.04847
G1 X145.404 Y150.597 E.04855
G1 X143.826 Y150.597 E.04847
G1 X143.826 Y149.077 E.04671
M204 S10000
; WIPE_START
G1 F24000
G1 X145.404 Y149.017 E-.59981
G1 X145.404 Y149.438 E-.16019
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I1.12 J-.477 P1  F30000
G1 X143.729 Y145.505 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5313
G1 X143.729 Y144.909 E.01977
G1 X145.012 Y144.909 E.04253
G1 X145.012 Y145.505 E.01977
G1 X143.789 Y145.505 E.04054
G1 X143.337 Y145.897 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5313
G1 X143.337 Y144.517 E.0424
G1 X145.404 Y144.517 E.06349
G1 X145.404 Y145.897 E.0424
G1 X143.397 Y145.897 E.06165
M204 S10000
G1 X143.933 Y145.207 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5313
G1 X144.808 Y145.207 E.01346
; WIPE_START
G1 F24000
G1 X143.933 Y145.207 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-.012 J-1.217 P1  F30000
G1 X114.012 Y145.505 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5313
G1 X114.012 Y148.409 E.09634
G1 X127.589 Y148.409 E.45038
G1 X139.589 Y149.409 E.39944
G1 X141.009 Y149.409 E.04711
G1 X141.009 Y150.205 E.0264
G1 X113.716 Y150.205 E.90536
G1 X113.716 Y144.909 E.17567
G1 X141.498 Y144.909 E.92159
G1 X141.498 Y145.505 E.01977
G1 X114.072 Y145.505 E.90978
G1 X114.404 Y145.897 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5313
G1 X114.404 Y148.017 E.06514
G1 X127.605 Y148.017 E.40564
G1 X139.605 Y149.017 E.37
G1 X141.401 Y149.017 E.05519
G1 X141.401 Y150.597 E.04855
G1 X113.324 Y150.597 E.86274
G1 X113.324 Y144.517 E.18682
G1 X141.89 Y144.517 E.87776
G1 X141.89 Y145.897 E.0424
G1 X114.464 Y145.897 E.84274
M204 S10000
G1 X113.919 Y145.207 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5313
G1 X141.295 Y145.207 E.42108
; WIPE_START
G1 F24000
G1 X139.295 Y145.207 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-1.156 J.38 P1  F30000
G1 X140.805 Y149.807 Z2.2
G1 Z1.8
G1 E.8 F1800
; LINE_WIDTH: 0.431684
G1 F5313
G3 X139.564 Y149.806 I-.613 J-29.87 E.03933
; LINE_WIDTH: 0.432356
G1 X139 Y149.783 E.01793
; LINE_WIDTH: 0.474338
G1 X138.435 Y149.759 E.01986
; LINE_WIDTH: 0.51632
G1 X137.87 Y149.736 E.0218
; LINE_WIDTH: 0.558302
G1 X137.306 Y149.712 E.02373
; LINE_WIDTH: 0.600284
G1 X136.741 Y149.689 E.02566
G1 X133.581 Y149.258 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5313
G1 X135.204 Y149.393 E.05401
G1 X134.74 Y149.856 E.02175
G1 X131.663 Y149.856 E.10206
G1 X130.836 Y149.029 E.03882
G1 X128.118 Y148.802 E.09047
G1 X127.064 Y149.856 E.04944
G1 X123.987 Y149.856 E.10206
G1 X122.888 Y148.757 E.05157
G1 X120.487 Y148.757 E.07964
G1 X119.388 Y149.856 E.05157
G1 X116.311 Y149.856 E.10206
G1 X115.212 Y148.757 E.05157
G1 X116.84 Y148.757 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X115.212 Y148.757 E-.61876
G1 X115.475 Y149.02 E-.14124
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
G3 Z2.2 I.661 J1.022 P1  F30000
G1 X145.081 Y129.852 Z2.2
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5249
G1 X145.648 Y129.852 E.01882
G1 X145.648 Y130.648 E.0264
G1 X145.081 Y130.648 E.01882
G1 X145.081 Y129.912 E.02441
G1 X144.688 Y129.46 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5249
G1 X146.04 Y129.46 E.04153
M73 P65 R4
G1 X146.04 Y131.04 E.04855
G1 X144.688 Y131.04 E.04153
M73 P65 R3
G1 X144.688 Y129.52 E.04671
M204 S10000
G1 X145.364 Y130.056 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.203242
G1 F5249
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
G1 F5249
G1 X144.706 Y125.352 E.01977
G1 X145.648 Y125.352 E.03124
G1 X145.648 Y125.948 E.01977
G1 X144.766 Y125.948 E.02925
G1 X144.314 Y126.34 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5249
G1 X144.314 Y124.96 E.0424
G1 X146.04 Y124.96 E.05303
G1 X146.04 Y126.34 E.0424
G1 X144.374 Y126.34 E.05119
M204 S10000
G1 X144.91 Y125.65 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5249
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
G1 F5249
G1 X114.648 Y128.852 E.09634
G1 X128.225 Y128.852 E.45038
G1 X140.225 Y129.852 E.39944
G1 X141.419 Y129.852 E.03962
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
G1 F5249
G1 X115.04 Y128.46 E.06514
G1 X128.241 Y128.46 E.40564
G1 X140.241 Y129.46 E.37
G1 X141.812 Y129.46 E.04825
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
G1 F5249
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
G1 F5249
G3 X140.2 Y130.25 I-.5 J-24.438 E.03218
; LINE_WIDTH: 0.432356
G1 X139.636 Y130.226 E.01793
; LINE_WIDTH: 0.474338
G1 X139.071 Y130.203 E.01986
; LINE_WIDTH: 0.51632
G1 X138.507 Y130.179 E.0218
; LINE_WIDTH: 0.558302
G1 X137.942 Y130.156 E.02373
; LINE_WIDTH: 0.600284
G1 X137.378 Y130.132 E.02566
G1 X134.217 Y129.701 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5249
G1 X135.84 Y129.836 E.05401
G1 X135.376 Y130.3 E.02175
G1 X132.3 Y130.3 E.10206
G1 X131.472 Y129.472 E.03882
G1 X128.754 Y129.246 E.09047
G1 X127.7 Y130.3 E.04944
G1 X124.624 Y130.3 E.10206
G1 X123.524 Y129.2 E.05157
G1 X121.124 Y129.2 E.07964
G1 X120.024 Y130.3 E.05157
G1 X116.948 Y130.3 E.10206
G1 X115.848 Y129.2 E.05157
G1 X117.477 Y129.2 E.05401
; WIPE_START
G1 F24000
G1 X115.848 Y129.2 E-.61876
G1 X116.111 Y129.463 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-.701 J.995 P1  F30000
G1 X144.444 Y149.409 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5249
G1 X145.012 Y149.409 E.01882
G1 X145.012 Y150.205 E.0264
G1 X144.444 Y150.205 E.01882
G1 X144.444 Y149.469 E.02441
G1 X144.052 Y149.017 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5249
G1 X145.404 Y149.017 E.04153
G1 X145.404 Y150.597 E.04855
G1 X144.052 Y150.597 E.04153
G1 X144.052 Y149.077 E.04671
M204 S10000
G1 X144.728 Y149.612 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.203242
G1 F5249
G1 X144.728 Y150.001 E.00508
; WIPE_START
G1 F24000
G1 X144.728 Y149.612 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I1.202 J-.192 P1  F30000
G1 X144.07 Y145.505 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5249
G1 X144.07 Y144.909 E.01977
G1 X145.012 Y144.909 E.03124
G1 X145.012 Y145.505 E.01977
G1 X144.13 Y145.505 E.02925
G1 X143.678 Y145.897 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5249
G1 X143.678 Y144.517 E.0424
G1 X145.404 Y144.517 E.05303
G1 X145.404 Y145.897 E.0424
G1 X143.738 Y145.897 E.05119
M204 S10000
G1 X144.274 Y145.207 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5249
G1 X144.808 Y145.207 E.00822
; WIPE_START
G1 F24000
G1 X144.274 Y145.207 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-.012 J-1.217 P1  F30000
M73 P66 R3
G1 X114.012 Y145.505 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5249
G1 X114.012 Y148.409 E.09634
G1 X127.589 Y148.409 E.45038
G1 X139.589 Y149.409 E.39944
G1 X140.783 Y149.409 E.03962
G1 X140.783 Y150.205 E.0264
G1 X113.716 Y150.205 E.89788
G1 X113.716 Y144.909 E.17567
G1 X141.158 Y144.909 E.91029
G1 X141.158 Y145.505 E.01977
G1 X114.072 Y145.505 E.89849
G1 X114.404 Y145.897 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5249
G1 X114.404 Y148.017 E.06514
G1 X127.605 Y148.017 E.40564
G1 X139.605 Y149.017 E.37
G1 X141.175 Y149.017 E.04825
G1 X141.175 Y150.597 E.04855
G1 X113.324 Y150.597 E.8558
G1 X113.324 Y144.517 E.18682
G1 X141.55 Y144.517 E.8673
G1 X141.55 Y145.897 E.0424
G1 X114.464 Y145.897 E.83227
M204 S10000
G1 X113.919 Y145.207 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5249
G1 X140.954 Y145.207 E.41584
; WIPE_START
G1 F24000
G1 X138.954 Y145.207 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-1.147 J.406 P1  F30000
G1 X140.58 Y149.807 Z2.4
G1 Z2
G1 E.8 F1800
; LINE_WIDTH: 0.431684
G1 F5249
G3 X139.564 Y149.806 I-.5 J-24.438 E.03218
; LINE_WIDTH: 0.432356
G1 X139 Y149.783 E.01793
; LINE_WIDTH: 0.474338
G1 X138.435 Y149.759 E.01986
; LINE_WIDTH: 0.51632
G1 X137.87 Y149.736 E.0218
; LINE_WIDTH: 0.558302
G1 X137.306 Y149.712 E.02373
; LINE_WIDTH: 0.600284
G1 X136.741 Y149.689 E.02566
G1 X133.581 Y149.258 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5249
G1 X135.204 Y149.393 E.05401
G1 X134.74 Y149.856 E.02175
G1 X131.663 Y149.856 E.10206
G1 X130.836 Y149.029 E.03882
G1 X128.118 Y148.802 E.09047
G1 X127.064 Y149.856 E.04944
G1 X123.987 Y149.856 E.10206
G1 X122.888 Y148.757 E.05157
G1 X120.487 Y148.757 E.07964
G1 X119.388 Y149.856 E.05157
G1 X116.311 Y149.856 E.10206
G1 X115.212 Y148.757 E.05157
G1 X116.84 Y148.757 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 2.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X115.212 Y148.757 E-.61876
G1 X115.475 Y149.02 E-.14124
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
G3 Z2.4 I.659 J1.023 P1  F30000
G1 X145.221 Y129.852 Z2.4
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5188
G1 X145.648 Y129.852 E.01416
G1 X145.648 Y130.648 E.0264
G1 X145.221 Y130.648 E.01416
G1 X145.221 Y129.912 E.02441
G1 X144.829 Y129.46 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5188
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
G1 F5188
G1 X144.92 Y125.352 E.01977
G1 X145.648 Y125.352 E.02416
G1 X145.648 Y125.948 E.01977
G1 X144.98 Y125.948 E.02217
G1 X144.527 Y126.34 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5188
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
G1 F5188
G1 X114.648 Y128.852 E.09634
G1 X128.225 Y128.852 E.45038
G1 X140.225 Y129.852 E.39944
G1 X141.279 Y129.852 E.03496
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
G1 F5188
G1 X115.04 Y128.46 E.06514
G1 X128.241 Y128.46 E.40564
G1 X140.241 Y129.46 E.37
G1 X141.671 Y129.46 E.04393
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
G1 F5188
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
G1 F5188
G3 X140.2 Y130.25 I-.429 J-21.055 E.02772
; LINE_WIDTH: 0.432356
G1 X139.636 Y130.226 E.01793
; LINE_WIDTH: 0.474338
G1 X139.071 Y130.203 E.01986
; LINE_WIDTH: 0.51632
G1 X138.507 Y130.179 E.0218
; LINE_WIDTH: 0.558302
G1 X137.942 Y130.156 E.02373
; LINE_WIDTH: 0.600284
G1 X137.378 Y130.132 E.02566
G1 X134.217 Y129.701 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5188
G1 X135.84 Y129.836 E.05401
G1 X135.376 Y130.3 E.02175
G1 X132.3 Y130.3 E.10206
G1 X131.472 Y129.472 E.03882
G1 X128.754 Y129.246 E.09047
G1 X127.7 Y130.3 E.04944
G1 X124.624 Y130.3 E.10206
G1 X123.524 Y129.2 E.05157
G1 X121.124 Y129.2 E.07964
G1 X120.024 Y130.3 E.05157
G1 X116.948 Y130.3 E.10206
G1 X115.848 Y129.2 E.05157
G1 X117.477 Y129.2 E.05401
; WIPE_START
G1 F24000
G1 X115.848 Y129.2 E-.61876
G1 X116.111 Y129.463 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
M73 P67 R3
G3 Z2.6 I-.698 J.997 P1  F30000
G1 X144.585 Y149.409 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5188
G1 X145.012 Y149.409 E.01416
G1 X145.012 Y150.205 E.0264
G1 X144.585 Y150.205 E.01416
G1 X144.585 Y149.469 E.02441
G1 X144.193 Y149.017 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5188
G1 X145.404 Y149.017 E.03721
G1 X145.404 Y150.597 E.04855
G1 X144.193 Y150.597 E.03721
G1 X144.193 Y149.077 E.04671
M204 S10000
; WIPE_START
G1 F24000
G1 X145.404 Y149.017 E-.46072
G1 X145.404 Y149.804 E-.29928
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I1.178 J-.307 P1  F30000
G1 X144.283 Y145.505 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5188
G1 X144.283 Y144.909 E.01977
G1 X145.012 Y144.909 E.02416
G1 X145.012 Y145.505 E.01977
G1 X144.343 Y145.505 E.02217
G1 X143.891 Y145.897 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5188
G1 X143.891 Y144.517 E.0424
G1 X145.404 Y144.517 E.04647
G1 X145.404 Y145.897 E.0424
G1 X143.951 Y145.897 E.04463
M204 S10000
; WIPE_START
G1 F24000
G1 X143.891 Y144.517 E-.5249
G1 X144.51 Y144.517 E-.2351
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I-.039 J-1.216 P1  F30000
G1 X114.012 Y145.505 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5188
G1 X114.012 Y148.409 E.09634
G1 X127.589 Y148.409 E.45038
G1 X139.589 Y149.409 E.39944
G1 X140.643 Y149.409 E.03496
G1 X140.643 Y150.205 E.0264
G1 X113.716 Y150.205 E.89321
G1 X113.716 Y144.909 E.17567
G1 X140.944 Y144.909 E.90321
G1 X140.944 Y145.505 E.01977
G1 X114.072 Y145.505 E.89141
G1 X114.404 Y145.897 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5188
G1 X114.404 Y148.017 E.06514
G1 X127.605 Y148.017 E.40564
G1 X139.605 Y149.017 E.37
G1 X141.035 Y149.017 E.04393
G1 X141.035 Y150.597 E.04855
G1 X113.324 Y150.597 E.85148
G1 X113.324 Y144.517 E.18682
G1 X141.336 Y144.517 E.86075
G1 X141.336 Y145.897 E.0424
G1 X114.464 Y145.897 E.82572
M204 S10000
G1 X113.919 Y145.207 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5188
G1 X140.741 Y145.207 E.41256
; WIPE_START
G1 F24000
G1 X138.741 Y145.207 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I-1.142 J.422 P1  F30000
G1 X140.439 Y149.807 Z2.6
G1 Z2.2
G1 E.8 F1800
; LINE_WIDTH: 0.431684
G1 F5188
G3 X139.564 Y149.806 I-.429 J-21.055 E.02772
; LINE_WIDTH: 0.432356
G1 X139 Y149.783 E.01793
; LINE_WIDTH: 0.474338
G1 X138.435 Y149.759 E.01986
; LINE_WIDTH: 0.51632
G1 X137.87 Y149.736 E.0218
; LINE_WIDTH: 0.558302
G1 X137.306 Y149.712 E.02373
; LINE_WIDTH: 0.600284
G1 X136.741 Y149.689 E.02566
G1 X133.581 Y149.258 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5188
G1 X135.204 Y149.393 E.05401
G1 X134.74 Y149.856 E.02175
G1 X131.663 Y149.856 E.10206
G1 X130.836 Y149.029 E.03882
G1 X128.118 Y148.802 E.09047
G1 X127.064 Y149.856 E.04944
G1 X123.987 Y149.856 E.10206
G1 X122.888 Y148.757 E.05157
G1 X120.487 Y148.757 E.07964
G1 X119.388 Y149.856 E.05157
G1 X116.311 Y149.856 E.10206
G1 X115.212 Y148.757 E.05157
G1 X116.84 Y148.757 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 2.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X115.212 Y148.757 E-.61876
G1 X115.475 Y149.02 E-.14124
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
G3 Z2.6 I.657 J1.024 P1  F30000
G1 X145.338 Y129.852 Z2.6
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5151
G1 X145.648 Y129.852 E.01027
G1 X145.648 Y130.648 E.0264
G1 X145.338 Y130.648 E.01027
G1 X145.338 Y129.912 E.02441
G1 X144.946 Y129.46 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5151
G1 X146.04 Y129.46 E.03361
M73 P68 R3
G1 X146.04 Y131.04 E.04855
G1 X144.946 Y131.04 E.03361
G1 X144.946 Y129.52 E.04671
M204 S10000
; WIPE_START
G1 F24000
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
G1 F5151
G1 X145.058 Y125.352 E.01977
G1 X145.648 Y125.352 E.01958
G1 X145.648 Y125.948 E.01977
G1 X145.118 Y125.948 E.01759
G1 X144.666 Y126.34 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5151
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
G1 F5151
G1 X114.648 Y128.852 E.09634
G1 X128.225 Y128.852 E.45038
G1 X140.225 Y129.852 E.39944
G1 X141.162 Y129.852 E.03107
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
G1 F5151
G1 X115.04 Y128.46 E.06514
G1 X128.241 Y128.46 E.40564
G1 X140.241 Y129.46 E.37
G1 X141.554 Y129.46 E.04033
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
G1 F5151
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
G1 F5151
G3 X140.2 Y130.25 I-.371 J-18.233 E.02401
; LINE_WIDTH: 0.432356
G1 X139.636 Y130.226 E.01793
; LINE_WIDTH: 0.474338
G1 X139.071 Y130.203 E.01986
; LINE_WIDTH: 0.51632
G1 X138.507 Y130.179 E.0218
; LINE_WIDTH: 0.558302
G1 X137.942 Y130.156 E.02373
; LINE_WIDTH: 0.600284
G1 X137.378 Y130.132 E.02566
G1 X134.217 Y129.701 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5151
G1 X135.84 Y129.836 E.05401
G1 X135.376 Y130.3 E.02175
G1 X132.3 Y130.3 E.10206
G1 X131.472 Y129.472 E.03882
G1 X128.754 Y129.246 E.09047
G1 X127.7 Y130.3 E.04944
G1 X124.624 Y130.3 E.10206
G1 X123.524 Y129.2 E.05157
G1 X121.124 Y129.2 E.07964
G1 X120.024 Y130.3 E.05157
G1 X116.948 Y130.3 E.10206
G1 X115.848 Y129.2 E.05157
G1 X117.477 Y129.2 E.05401
; WIPE_START
G1 F24000
G1 X115.848 Y129.2 E-.61876
G1 X116.111 Y129.463 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I-.696 J.998 P1  F30000
G1 X144.702 Y149.409 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5151
G1 X145.012 Y149.409 E.01027
G1 X145.012 Y150.205 E.0264
G1 X144.702 Y150.205 E.01027
G1 X144.702 Y149.469 E.02441
G1 X144.31 Y149.017 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5151
G1 X145.404 Y149.017 E.03361
G1 X145.404 Y150.597 E.04855
G1 X144.31 Y150.597 E.03361
G1 X144.31 Y149.077 E.04671
M204 S10000
; WIPE_START
G1 F24000
G1 X145.404 Y149.017 E-.41622
G1 X145.404 Y149.921 E-.34378
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I1.188 J-.264 P1  F30000
G1 X144.421 Y145.505 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5151
G1 X144.421 Y144.909 E.01977
G1 X145.012 Y144.909 E.01958
G1 X145.012 Y145.505 E.01977
G1 X144.481 Y145.505 E.01759
G1 X144.029 Y145.897 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5151
G1 X144.029 Y144.517 E.0424
G1 X145.404 Y144.517 E.04223
G1 X145.404 Y145.897 E.0424
G1 X144.089 Y145.897 E.04039
M204 S10000
; WIPE_START
G1 F24000
G1 X144.029 Y144.517 E-.5249
G1 X144.648 Y144.517 E-.2351
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I-.039 J-1.216 P1  F30000
G1 X114.012 Y145.505 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5151
G1 X114.012 Y148.409 E.09634
G1 X127.589 Y148.409 E.45038
G1 X139.589 Y149.409 E.39944
M73 P69 R3
G1 X140.525 Y149.409 E.03107
G1 X140.525 Y150.205 E.0264
G1 X113.716 Y150.205 E.88932
G1 X113.716 Y144.909 E.17567
G1 X140.806 Y144.909 E.89863
G1 X140.806 Y145.505 E.01977
G1 X114.072 Y145.505 E.88683
G1 X114.404 Y145.897 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5151
G1 X114.404 Y148.017 E.06514
G1 X127.605 Y148.017 E.40564
G1 X139.605 Y149.017 E.37
G1 X140.917 Y149.017 E.04033
G1 X140.917 Y150.597 E.04855
G1 X113.324 Y150.597 E.84788
G1 X113.324 Y144.517 E.18682
G1 X141.198 Y144.517 E.8565
G1 X141.198 Y145.897 E.0424
G1 X114.464 Y145.897 E.82148
M204 S10000
G1 X113.919 Y145.207 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5151
G1 X140.603 Y145.207 E.41044
; WIPE_START
G1 F24000
G1 X138.603 Y145.207 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I-1.14 J.426 P1  F30000
G1 X140.322 Y149.807 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.431684
G1 F5151
G3 X139.564 Y149.806 I-.371 J-18.233 E.02401
; LINE_WIDTH: 0.432356
G1 X139 Y149.783 E.01793
; LINE_WIDTH: 0.474338
G1 X138.435 Y149.759 E.01986
; LINE_WIDTH: 0.51632
G1 X137.87 Y149.736 E.0218
; LINE_WIDTH: 0.558302
G1 X137.306 Y149.712 E.02373
; LINE_WIDTH: 0.600284
G1 X136.741 Y149.689 E.02566
G1 X133.581 Y149.258 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5151
G1 X135.204 Y149.393 E.05401
G1 X134.74 Y149.856 E.02175
G1 X131.663 Y149.856 E.10206
G1 X130.836 Y149.029 E.03882
G1 X128.118 Y148.802 E.09047
G1 X127.064 Y149.856 E.04944
G1 X123.987 Y149.856 E.10206
G1 X122.888 Y148.757 E.05157
G1 X120.487 Y148.757 E.07964
G1 X119.388 Y149.856 E.05157
G1 X116.311 Y149.856 E.10206
G1 X115.212 Y148.757 E.05157
G1 X116.84 Y148.757 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 2.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X115.212 Y148.757 E-.61876
G1 X115.475 Y149.02 E-.14124
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
G3 Z2.8 I.672 J1.015 P1  F30000
G1 X145.022 Y129.46 Z2.8
G1 Z2.6
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5090
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
G1 F5090
G1 X145.149 Y125.352 E.01977
G1 X145.648 Y125.352 E.01656
G1 X145.648 Y125.948 E.01977
G1 X145.209 Y125.948 E.01457
G1 X144.757 Y126.34 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5090
G1 X144.757 Y124.96 E.0424
G1 X146.04 Y124.96 E.03943
G1 X146.04 Y126.34 E.0424
G1 X144.817 Y126.34 E.03759
M204 S10000
G1 X145.398 Y125.744 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.134926
G1 F5090
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
G1 F5090
G1 X114.648 Y128.852 E.09634
G1 X128.225 Y128.852 E.45038
G1 X140.225 Y129.852 E.39944
G1 X141.086 Y129.852 E.02855
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
G1 F5090
G1 X115.04 Y128.46 E.06514
G1 X128.241 Y128.46 E.40564
G1 X140.241 Y129.46 E.37
G1 X141.478 Y129.46 E.038
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
G1 F5090
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
G1 F5090
G3 X140.2 Y130.25 I-.333 J-16.407 E.0216
; LINE_WIDTH: 0.432356
G1 X139.636 Y130.226 E.01793
; LINE_WIDTH: 0.474338
G1 X139.071 Y130.203 E.01986
; LINE_WIDTH: 0.51632
G1 X138.507 Y130.179 E.0218
; LINE_WIDTH: 0.558302
G1 X137.942 Y130.156 E.02373
; LINE_WIDTH: 0.600284
G1 X137.378 Y130.132 E.02566
G1 X134.217 Y129.701 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5090
G1 X135.84 Y129.836 E.05401
G1 X135.376 Y130.3 E.02175
G1 X132.3 Y130.3 E.10206
G1 X131.472 Y129.472 E.03882
G1 X128.754 Y129.246 E.09047
G1 X127.7 Y130.3 E.04944
G1 X124.624 Y130.3 E.10206
G1 X123.524 Y129.2 E.05157
G1 X121.124 Y129.2 E.07964
G1 X120.024 Y130.3 E.05157
G1 X116.948 Y130.3 E.10206
G1 X115.848 Y129.2 E.05157
G1 X117.477 Y129.2 E.05401
; WIPE_START
G1 F24000
G1 X115.848 Y129.2 E-.61876
G1 X116.111 Y129.463 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
M73 P70 R3
G3 Z3 I-.692 J1.001 P1  F30000
G1 X144.386 Y149.017 Z3
G1 Z2.6
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5090
G1 X145.404 Y149.017 E.03127
G1 X145.404 Y150.597 E.04855
G1 X144.386 Y150.597 E.03127
G1 X144.386 Y149.077 E.04671
M204 S10000
; WIPE_START
G1 F24000
G1 X145.404 Y149.017 E-.38744
G1 X145.404 Y149.997 E-.37256
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I1.194 J-.237 P1  F30000
G1 X144.513 Y145.505 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5090
G1 X144.513 Y144.909 E.01977
G1 X145.012 Y144.909 E.01656
G1 X145.012 Y145.505 E.01977
G1 X144.573 Y145.505 E.01457
G1 X144.121 Y145.897 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5090
G1 X144.121 Y144.517 E.0424
G1 X145.404 Y144.517 E.03943
G1 X145.404 Y145.897 E.0424
G1 X144.181 Y145.897 E.03759
M204 S10000
G1 X144.762 Y145.301 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.134926
G1 F5090
G1 X144.762 Y145.112 E.00142
; WIPE_START
G1 F24000
G1 X144.762 Y145.301 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I-.008 J-1.217 P1  F30000
G1 X114.012 Y145.505 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5090
G1 X114.012 Y148.409 E.09634
G1 X127.589 Y148.409 E.45038
G1 X139.589 Y149.409 E.39944
G1 X140.45 Y149.409 E.02855
G1 X140.45 Y150.205 E.0264
G1 X113.716 Y150.205 E.8868
G1 X113.716 Y144.909 E.17567
G1 X140.715 Y144.909 E.89561
G1 X140.715 Y145.505 E.01977
G1 X114.072 Y145.505 E.88381
G1 X114.404 Y145.897 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5090
G1 X114.404 Y148.017 E.06514
G1 X127.605 Y148.017 E.40564
G1 X139.605 Y149.017 E.37
G1 X140.842 Y149.017 E.038
G1 X140.842 Y150.597 E.04855
G1 X113.324 Y150.597 E.84555
G1 X113.324 Y144.517 E.18682
G1 X141.107 Y144.517 E.8537
G1 X141.107 Y145.897 E.0424
G1 X114.464 Y145.897 E.81867
M204 S10000
G1 X113.919 Y145.207 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5090
G1 X140.511 Y145.207 E.40903
; WIPE_START
G1 F24000
G1 X138.511 Y145.207 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I-1.139 J.429 P1  F30000
G1 X140.246 Y149.807 Z3
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.431684
G1 F5090
G3 X139.564 Y149.806 I-.333 J-16.407 E.0216
; LINE_WIDTH: 0.432356
G1 X139 Y149.783 E.01793
; LINE_WIDTH: 0.474338
G1 X138.435 Y149.759 E.01986
; LINE_WIDTH: 0.51632
G1 X137.87 Y149.736 E.0218
; LINE_WIDTH: 0.558302
G1 X137.306 Y149.712 E.02373
; LINE_WIDTH: 0.600284
G1 X136.741 Y149.689 E.02566
G1 X133.581 Y149.258 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5090
G1 X135.204 Y149.393 E.05401
G1 X134.74 Y149.856 E.02175
G1 X131.663 Y149.856 E.10206
G1 X130.836 Y149.029 E.03882
G1 X128.118 Y148.802 E.09047
G1 X127.064 Y149.856 E.04944
G1 X123.987 Y149.856 E.10206
G1 X122.888 Y148.757 E.05157
G1 X120.487 Y148.757 E.07964
G1 X119.388 Y149.856 E.05157
G1 X116.311 Y149.856 E.10206
G1 X115.212 Y148.757 E.05157
G1 X116.84 Y148.757 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 2.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X115.212 Y148.757 E-.61876
G1 X115.475 Y149.02 E-.14124
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
G3 Z3 I.671 J1.015 P1  F30000
G1 X145.074 Y129.46 Z3
G1 Z2.8
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5091
G1 X146.04 Y129.46 E.0297
G1 X146.04 Y131.04 E.04855
G1 X145.074 Y131.04 E.0297
G1 X145.074 Y129.52 E.04671
M204 S10000
G1 X145.557 Y129.656 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.617268
G1 F5091
G1 X145.557 Y130.844 E.0556
; WIPE_START
G1 F24000
G1 X145.557 Y129.656 E-.76
; WIPE_END
M73 P71 R3
G1 E-.04 F1800
G17
G3 Z3.2 I1.212 J-.111 P1  F30000
G1 X145.216 Y125.948 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5091
G1 X145.216 Y125.352 E.01977
G1 X145.648 Y125.352 E.01434
G1 X145.648 Y125.948 E.01977
G1 X145.276 Y125.948 E.01235
G1 X144.824 Y126.34 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5091
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
G1 F5091
G1 X114.648 Y128.852 E.09634
G1 X128.225 Y128.852 E.45038
G1 X140.225 Y129.852 E.39944
G1 X141.034 Y129.852 E.02685
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
G1 F5091
G1 X115.04 Y128.46 E.06514
G1 X128.241 Y128.46 E.40564
G1 X140.241 Y129.46 E.37
G1 X141.426 Y129.46 E.03642
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
G1 F5091
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
G1 F5091
G3 X140.2 Y130.25 I-.307 J-15.171 E.01997
; LINE_WIDTH: 0.432356
G1 X139.636 Y130.226 E.01793
; LINE_WIDTH: 0.474338
G1 X139.071 Y130.203 E.01986
; LINE_WIDTH: 0.51632
G1 X138.507 Y130.179 E.0218
; LINE_WIDTH: 0.558302
G1 X137.942 Y130.156 E.02373
; LINE_WIDTH: 0.600284
G1 X137.378 Y130.132 E.02566
G1 X134.217 Y129.701 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5091
G1 X135.84 Y129.836 E.05401
G1 X135.376 Y130.3 E.02175
G1 X132.3 Y130.3 E.10206
G1 X131.472 Y129.472 E.03882
G1 X128.754 Y129.246 E.09047
G1 X127.7 Y130.3 E.04944
G1 X124.624 Y130.3 E.10206
G1 X123.524 Y129.2 E.05157
G1 X121.124 Y129.2 E.07964
G1 X120.024 Y130.3 E.05157
G1 X116.948 Y130.3 E.10206
G1 X115.848 Y129.2 E.05157
G1 X117.477 Y129.2 E.05401
; WIPE_START
G1 F24000
G1 X115.848 Y129.2 E-.61876
G1 X116.111 Y129.463 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I-.691 J1.002 P1  F30000
G1 X144.437 Y149.017 Z3.2
G1 Z2.8
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5091
G1 X145.404 Y149.017 E.0297
G1 X145.404 Y150.597 E.04855
G1 X144.437 Y150.597 E.0297
G1 X144.437 Y149.077 E.04671
M204 S10000
G1 X144.921 Y149.213 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.617268
G1 F5091
G1 X144.921 Y150.401 E.0556
; WIPE_START
G1 F24000
G1 X144.921 Y149.213 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I1.212 J-.111 P1  F30000
G1 X144.579 Y145.505 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5091
G1 X144.579 Y144.909 E.01977
G1 X145.012 Y144.909 E.01434
G1 X145.012 Y145.505 E.01977
G1 X144.639 Y145.505 E.01235
G1 X144.187 Y145.897 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5091
G1 X144.187 Y144.517 E.0424
G1 X145.404 Y144.517 E.03738
G1 X145.404 Y145.897 E.0424
G1 X144.247 Y145.897 E.03553
M204 S10000
; WIPE_START
G1 F24000
G1 X144.187 Y144.517 E-.5249
G1 X144.806 Y144.517 E-.2351
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I-.039 J-1.216 P1  F30000
G1 X114.012 Y145.505 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5091
G1 X114.012 Y148.409 E.09634
G1 X127.589 Y148.409 E.45038
G1 X139.589 Y149.409 E.39944
G1 X140.398 Y149.409 E.02685
G1 X140.398 Y150.205 E.0264
G1 X113.716 Y150.205 E.8851
G1 X113.716 Y144.909 E.17567
G1 X140.648 Y144.909 E.89339
G1 X140.648 Y145.505 E.01977
G1 X114.072 Y145.505 E.88159
G1 X114.404 Y145.897 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5091
G1 X114.404 Y148.017 E.06514
G1 X127.605 Y148.017 E.40564
G1 X139.605 Y149.017 E.37
M73 P72 R3
G1 X140.79 Y149.017 E.03642
G1 X140.79 Y150.597 E.04855
G1 X113.324 Y150.597 E.84397
G1 X113.324 Y144.517 E.18682
G1 X141.04 Y144.517 E.85165
G1 X141.04 Y145.897 E.0424
G1 X114.464 Y145.897 E.81662
M204 S10000
G1 X113.919 Y145.207 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5091
G1 X140.445 Y145.207 E.40801
; WIPE_START
G1 F24000
G1 X138.445 Y145.207 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I-1.137 J.433 P1  F30000
G1 X140.195 Y149.807 Z3.2
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.431684
G1 F5091
G3 X139.564 Y149.806 I-.307 J-15.171 E.01997
; LINE_WIDTH: 0.432356
G1 X139 Y149.783 E.01793
; LINE_WIDTH: 0.474338
G1 X138.435 Y149.759 E.01986
; LINE_WIDTH: 0.51632
G1 X137.87 Y149.736 E.0218
; LINE_WIDTH: 0.558302
G1 X137.306 Y149.712 E.02373
; LINE_WIDTH: 0.600284
G1 X136.741 Y149.689 E.02566
G1 X133.581 Y149.258 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5091
G1 X135.204 Y149.393 E.05401
G1 X134.74 Y149.856 E.02175
G1 X131.663 Y149.856 E.10206
G1 X130.836 Y149.029 E.03882
G1 X128.118 Y148.802 E.09047
G1 X127.064 Y149.856 E.04944
G1 X123.987 Y149.856 E.10206
G1 X122.888 Y148.757 E.05157
G1 X120.487 Y148.757 E.07964
G1 X119.388 Y149.856 E.05157
G1 X116.311 Y149.856 E.10206
G1 X115.212 Y148.757 E.05157
G1 X116.84 Y148.757 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 3
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X115.212 Y148.757 E-.61876
G1 X115.475 Y149.02 E-.14124
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
G3 Z3.2 I.671 J1.016 P1  F30000
G1 X145.098 Y129.46 Z3.2
G1 Z3
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5085
G1 X146.04 Y129.46 E.02895
G1 X146.04 Y131.04 E.04855
G1 X145.098 Y131.04 E.02895
G1 X145.098 Y129.52 E.04671
M204 S10000
G1 X145.569 Y129.656 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.592984
G1 F5085
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
G1 F5085
G1 X145.24 Y125.352 E.01977
G1 X145.648 Y125.352 E.01353
G1 X145.648 Y125.948 E.01977
G1 X145.3 Y125.948 E.01154
G1 X144.848 Y126.34 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5085
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
G1 F5085
G1 X114.648 Y128.852 E.09634
G1 X128.225 Y128.852 E.45038
G1 X140.225 Y129.852 E.39944
G1 X141.01 Y129.852 E.02604
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
G1 F5085
G1 X115.04 Y128.46 E.06514
G1 X128.241 Y128.46 E.40564
G1 X140.241 Y129.46 E.37
G1 X141.402 Y129.46 E.03567
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
G1 F5085
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
G1 F5085
G3 X140.2 Y130.25 I-.295 J-14.587 E.01921
; LINE_WIDTH: 0.432356
G1 X139.636 Y130.226 E.01793
; LINE_WIDTH: 0.474338
G1 X139.071 Y130.203 E.01986
; LINE_WIDTH: 0.51632
G1 X138.507 Y130.179 E.0218
; LINE_WIDTH: 0.558302
G1 X137.942 Y130.156 E.02373
; LINE_WIDTH: 0.600284
G1 X137.378 Y130.132 E.02566
G1 X134.217 Y129.701 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5085
G1 X135.84 Y129.836 E.05401
G1 X135.376 Y130.3 E.02175
G1 X132.3 Y130.3 E.10206
G1 X131.472 Y129.472 E.03882
G1 X128.754 Y129.246 E.09047
G1 X127.7 Y130.3 E.04944
G1 X124.624 Y130.3 E.10206
G1 X123.524 Y129.2 E.05157
G1 X121.124 Y129.2 E.07964
G1 X120.024 Y130.3 E.05157
G1 X116.948 Y130.3 E.10206
G1 X115.848 Y129.2 E.05157
G1 X117.477 Y129.2 E.05401
; WIPE_START
G1 F24000
G1 X115.848 Y129.2 E-.61876
G1 X116.111 Y129.463 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.691 J1.002 P1  F30000
G1 X144.462 Y149.017 Z3.4
M73 P73 R3
G1 Z3
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5085
G1 X145.404 Y149.017 E.02895
G1 X145.404 Y150.597 E.04855
G1 X144.462 Y150.597 E.02895
G1 X144.462 Y149.077 E.04671
M204 S10000
G1 X144.933 Y149.213 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.592984
G1 F5085
G1 X144.933 Y150.401 E.05325
; WIPE_START
G1 F24000
G1 X144.933 Y149.213 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I1.212 J-.108 P1  F30000
G1 X144.604 Y145.505 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5085
G1 X144.604 Y144.909 E.01977
G1 X145.012 Y144.909 E.01353
G1 X145.012 Y145.505 E.01977
G1 X144.664 Y145.505 E.01154
G1 X144.212 Y145.897 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5085
G1 X144.212 Y144.517 E.0424
G1 X145.404 Y144.517 E.03663
G1 X145.404 Y145.897 E.0424
G1 X144.272 Y145.897 E.03479
M204 S10000
; WIPE_START
G1 F24000
G1 X144.212 Y144.517 E-.5249
G1 X144.83 Y144.517 E-.2351
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.039 J-1.216 P1  F30000
G1 X114.012 Y145.505 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5085
G1 X114.012 Y148.409 E.09634
G1 X127.589 Y148.409 E.45038
G1 X139.589 Y149.409 E.39944
G1 X140.374 Y149.409 E.02604
G1 X140.374 Y150.205 E.0264
G1 X113.716 Y150.205 E.88429
G1 X113.716 Y144.909 E.17567
G1 X140.624 Y144.909 E.89259
G1 X140.624 Y145.505 E.01977
G1 X114.072 Y145.505 E.88078
G1 X114.404 Y145.897 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5085
G1 X114.404 Y148.017 E.06514
G1 X127.605 Y148.017 E.40564
G1 X139.605 Y149.017 E.37
G1 X140.766 Y149.017 E.03567
G1 X140.766 Y150.597 E.04855
G1 X113.324 Y150.597 E.84322
G1 X113.324 Y144.517 E.18682
G1 X141.016 Y144.517 E.8509
G1 X141.016 Y145.897 E.0424
G1 X114.464 Y145.897 E.81587
M204 S10000
G1 X113.919 Y145.207 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5085
G1 X140.42 Y145.207 E.40763
; WIPE_START
G1 F24000
G1 X138.42 Y145.207 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.137 J.433 P1  F30000
G1 X140.17 Y149.807 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.431684
G1 F5085
G3 X139.564 Y149.806 I-.295 J-14.587 E.01921
; LINE_WIDTH: 0.432356
G1 X139 Y149.783 E.01793
; LINE_WIDTH: 0.474338
G1 X138.435 Y149.759 E.01986
; LINE_WIDTH: 0.51632
G1 X137.87 Y149.736 E.0218
; LINE_WIDTH: 0.558302
G1 X137.306 Y149.712 E.02373
; LINE_WIDTH: 0.600284
G1 X136.741 Y149.689 E.02566
G1 X133.581 Y149.258 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5085
G1 X135.204 Y149.393 E.05401
G1 X134.74 Y149.856 E.02175
G1 X131.663 Y149.856 E.10206
G1 X130.836 Y149.029 E.03882
G1 X128.118 Y148.802 E.09047
G1 X127.064 Y149.856 E.04944
G1 X123.987 Y149.856 E.10206
G1 X122.888 Y148.757 E.05157
G1 X120.487 Y148.757 E.07964
G1 X119.388 Y149.856 E.05157
G1 X116.311 Y149.856 E.10206
G1 X115.212 Y148.757 E.05157
G1 X116.84 Y148.757 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 3.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X115.212 Y148.757 E-.61876
G1 X115.475 Y149.02 E-.14124
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
G3 Z3.4 I.671 J1.016 P1  F30000
G1 X145.098 Y129.46 Z3.4
G1 Z3.2
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M73 P73 R2
G1 F5085
G1 X146.04 Y129.46 E.02895
G1 X146.04 Y131.04 E.04855
G1 X145.098 Y131.04 E.02895
G1 X145.098 Y129.52 E.04671
M204 S10000
G1 X145.569 Y129.656 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.592984
G1 F5085
G1 X145.569 Y130.844 E.05325
; WIPE_START
G1 F24000
G1 X145.569 Y129.656 E-.76
; WIPE_END
M73 P74 R2
G1 E-.04 F1800
G17
G3 Z3.6 I1.212 J-.108 P1  F30000
G1 X145.24 Y125.948 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5085
G1 X145.24 Y125.352 E.01977
G1 X145.648 Y125.352 E.01353
G1 X145.648 Y125.948 E.01977
G1 X145.3 Y125.948 E.01154
G1 X144.848 Y126.34 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5085
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
G1 F5085
G1 X114.648 Y128.852 E.09634
G1 X128.225 Y128.852 E.45038
G1 X140.225 Y129.852 E.39944
G1 X141.01 Y129.852 E.02604
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
G1 F5085
G1 X115.04 Y128.46 E.06514
G1 X128.241 Y128.46 E.40564
G1 X140.241 Y129.46 E.37
G1 X141.402 Y129.46 E.03567
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
G1 F5085
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
G1 F5085
G3 X140.2 Y130.25 I-.295 J-14.587 E.01921
; LINE_WIDTH: 0.432356
G1 X139.636 Y130.226 E.01793
; LINE_WIDTH: 0.474338
G1 X139.071 Y130.203 E.01986
; LINE_WIDTH: 0.51632
G1 X138.507 Y130.179 E.0218
; LINE_WIDTH: 0.558302
G1 X137.942 Y130.156 E.02373
; LINE_WIDTH: 0.600284
G1 X137.378 Y130.132 E.02566
G1 X134.217 Y129.701 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5085
G1 X135.84 Y129.836 E.05401
G1 X135.376 Y130.3 E.02175
G1 X132.3 Y130.3 E.10206
G1 X131.472 Y129.472 E.03882
G1 X128.754 Y129.246 E.09047
G1 X127.7 Y130.3 E.04944
G1 X124.624 Y130.3 E.10206
G1 X123.524 Y129.2 E.05157
G1 X121.124 Y129.2 E.07964
G1 X120.024 Y130.3 E.05157
G1 X116.948 Y130.3 E.10206
G1 X115.848 Y129.2 E.05157
G1 X117.477 Y129.2 E.05401
; WIPE_START
G1 F24000
G1 X115.848 Y129.2 E-.61876
G1 X116.111 Y129.463 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I-.691 J1.002 P1  F30000
G1 X144.462 Y149.017 Z3.6
G1 Z3.2
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5085
G1 X145.404 Y149.017 E.02895
G1 X145.404 Y150.597 E.04855
G1 X144.462 Y150.597 E.02895
G1 X144.462 Y149.077 E.04671
M204 S10000
G1 X144.933 Y149.213 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.592984
G1 F5085
G1 X144.933 Y150.401 E.05325
; WIPE_START
G1 F24000
G1 X144.933 Y149.213 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I1.212 J-.108 P1  F30000
G1 X144.604 Y145.505 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5085
G1 X144.604 Y144.909 E.01977
G1 X145.012 Y144.909 E.01353
G1 X145.012 Y145.505 E.01977
G1 X144.664 Y145.505 E.01154
G1 X144.212 Y145.897 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5085
G1 X144.212 Y144.517 E.0424
G1 X145.404 Y144.517 E.03663
G1 X145.404 Y145.897 E.0424
G1 X144.272 Y145.897 E.03479
M204 S10000
; WIPE_START
G1 F24000
G1 X144.212 Y144.517 E-.5249
G1 X144.83 Y144.517 E-.2351
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I-.039 J-1.216 P1  F30000
G1 X114.012 Y145.505 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5085
G1 X114.012 Y148.409 E.09634
G1 X127.589 Y148.409 E.45038
G1 X139.589 Y149.409 E.39944
G1 X140.374 Y149.409 E.02604
G1 X140.374 Y150.205 E.0264
G1 X113.716 Y150.205 E.88429
G1 X113.716 Y144.909 E.17567
G1 X140.624 Y144.909 E.89259
G1 X140.624 Y145.505 E.01977
G1 X114.072 Y145.505 E.88078
G1 X114.404 Y145.897 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5085
G1 X114.404 Y148.017 E.06514
G1 X127.605 Y148.017 E.40564
G1 X139.605 Y149.017 E.37
G1 X140.766 Y149.017 E.03567
G1 X140.766 Y150.597 E.04855
G1 X113.324 Y150.597 E.84322
G1 X113.324 Y144.517 E.18682
G1 X141.016 Y144.517 E.8509
G1 X141.016 Y145.897 E.0424
G1 X114.464 Y145.897 E.81587
M204 S10000
G1 X113.919 Y145.207 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
M73 P75 R2
G1 F5085
G1 X140.42 Y145.207 E.40763
; WIPE_START
G1 F24000
G1 X138.42 Y145.207 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I-1.137 J.433 P1  F30000
G1 X140.17 Y149.807 Z3.6
G1 Z3.2
G1 E.8 F1800
; LINE_WIDTH: 0.431684
G1 F5085
G3 X139.564 Y149.806 I-.295 J-14.587 E.01921
; LINE_WIDTH: 0.432356
G1 X139 Y149.783 E.01793
; LINE_WIDTH: 0.474338
G1 X138.435 Y149.759 E.01986
; LINE_WIDTH: 0.51632
G1 X137.87 Y149.736 E.0218
; LINE_WIDTH: 0.558302
G1 X137.306 Y149.712 E.02373
; LINE_WIDTH: 0.600284
G1 X136.741 Y149.689 E.02566
G1 X133.581 Y149.258 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5085
G1 X135.204 Y149.393 E.05401
G1 X134.74 Y149.856 E.02175
G1 X131.663 Y149.856 E.10206
G1 X130.836 Y149.029 E.03882
G1 X128.118 Y148.802 E.09047
G1 X127.064 Y149.856 E.04944
G1 X123.987 Y149.856 E.10206
G1 X122.888 Y148.757 E.05157
G1 X120.487 Y148.757 E.07964
G1 X119.388 Y149.856 E.05157
G1 X116.311 Y149.856 E.10206
G1 X115.212 Y148.757 E.05157
G1 X116.84 Y148.757 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 3.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X115.212 Y148.757 E-.61876
G1 X115.475 Y149.02 E-.14124
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
G3 Z3.6 I.671 J1.015 P1  F30000
G1 X145.074 Y129.46 Z3.6
G1 Z3.4
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5091
G1 X146.04 Y129.46 E.0297
G1 X146.04 Y131.04 E.04855
G1 X145.074 Y131.04 E.0297
G1 X145.074 Y129.52 E.04671
M204 S10000
G1 X145.557 Y129.656 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.617268
G1 F5091
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
G1 F5091
G1 X145.216 Y125.352 E.01977
G1 X145.648 Y125.352 E.01434
G1 X145.648 Y125.948 E.01977
G1 X145.276 Y125.948 E.01235
G1 X144.824 Y126.34 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5091
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
G1 F5091
G1 X114.648 Y128.852 E.09634
G1 X128.225 Y128.852 E.45038
G1 X140.225 Y129.852 E.39944
G1 X141.034 Y129.852 E.02685
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
G1 F5091
G1 X115.04 Y128.46 E.06514
G1 X128.241 Y128.46 E.40564
G1 X140.241 Y129.46 E.37
G1 X141.426 Y129.46 E.03642
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
G1 F5091
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
G1 F5091
G3 X140.2 Y130.25 I-.307 J-15.171 E.01997
; LINE_WIDTH: 0.432356
G1 X139.636 Y130.226 E.01793
; LINE_WIDTH: 0.474338
G1 X139.071 Y130.203 E.01986
; LINE_WIDTH: 0.51632
G1 X138.507 Y130.179 E.0218
; LINE_WIDTH: 0.558302
G1 X137.942 Y130.156 E.02373
; LINE_WIDTH: 0.600284
G1 X137.378 Y130.132 E.02566
G1 X134.217 Y129.701 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5091
G1 X135.84 Y129.836 E.05401
G1 X135.376 Y130.3 E.02175
G1 X132.3 Y130.3 E.10206
G1 X131.472 Y129.472 E.03882
G1 X128.754 Y129.246 E.09047
G1 X127.7 Y130.3 E.04944
G1 X124.624 Y130.3 E.10206
G1 X123.524 Y129.2 E.05157
G1 X121.124 Y129.2 E.07964
G1 X120.024 Y130.3 E.05157
G1 X116.948 Y130.3 E.10206
G1 X115.848 Y129.2 E.05157
G1 X117.477 Y129.2 E.05401
; WIPE_START
G1 F24000
G1 X115.848 Y129.2 E-.61876
G1 X116.111 Y129.463 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I-.691 J1.002 P1  F30000
G1 X144.437 Y149.017 Z3.8
M73 P76 R2
G1 Z3.4
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5091
G1 X145.404 Y149.017 E.0297
G1 X145.404 Y150.597 E.04855
G1 X144.437 Y150.597 E.0297
G1 X144.437 Y149.077 E.04671
M204 S10000
G1 X144.921 Y149.213 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.617268
G1 F5091
G1 X144.921 Y150.401 E.0556
; WIPE_START
G1 F24000
G1 X144.921 Y149.213 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I1.212 J-.111 P1  F30000
G1 X144.579 Y145.505 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5091
G1 X144.579 Y144.909 E.01977
G1 X145.012 Y144.909 E.01434
G1 X145.012 Y145.505 E.01977
G1 X144.639 Y145.505 E.01235
G1 X144.187 Y145.897 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5091
G1 X144.187 Y144.517 E.0424
G1 X145.404 Y144.517 E.03738
G1 X145.404 Y145.897 E.0424
G1 X144.247 Y145.897 E.03553
M204 S10000
; WIPE_START
G1 F24000
G1 X144.187 Y144.517 E-.5249
G1 X144.806 Y144.517 E-.2351
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I-.039 J-1.216 P1  F30000
G1 X114.012 Y145.505 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5091
G1 X114.012 Y148.409 E.09634
G1 X127.589 Y148.409 E.45038
G1 X139.589 Y149.409 E.39944
G1 X140.398 Y149.409 E.02685
G1 X140.398 Y150.205 E.0264
G1 X113.716 Y150.205 E.8851
G1 X113.716 Y144.909 E.17567
G1 X140.648 Y144.909 E.89339
G1 X140.648 Y145.505 E.01977
G1 X114.072 Y145.505 E.88159
G1 X114.404 Y145.897 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5091
G1 X114.404 Y148.017 E.06514
G1 X127.605 Y148.017 E.40564
G1 X139.605 Y149.017 E.37
G1 X140.79 Y149.017 E.03642
G1 X140.79 Y150.597 E.04855
G1 X113.324 Y150.597 E.84397
G1 X113.324 Y144.517 E.18682
G1 X141.04 Y144.517 E.85165
G1 X141.04 Y145.897 E.0424
G1 X114.464 Y145.897 E.81662
M204 S10000
G1 X113.919 Y145.207 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5091
G1 X140.445 Y145.207 E.40801
; WIPE_START
G1 F24000
G1 X138.445 Y145.207 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I-1.137 J.433 P1  F30000
G1 X140.195 Y149.807 Z3.8
G1 Z3.4
G1 E.8 F1800
; LINE_WIDTH: 0.431684
G1 F5091
G3 X139.564 Y149.806 I-.307 J-15.171 E.01997
; LINE_WIDTH: 0.432356
G1 X139 Y149.783 E.01793
; LINE_WIDTH: 0.474338
G1 X138.435 Y149.759 E.01986
; LINE_WIDTH: 0.51632
G1 X137.87 Y149.736 E.0218
; LINE_WIDTH: 0.558302
G1 X137.306 Y149.712 E.02373
; LINE_WIDTH: 0.600284
G1 X136.741 Y149.689 E.02566
G1 X133.581 Y149.258 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5091
G1 X135.204 Y149.393 E.05401
G1 X134.74 Y149.856 E.02175
G1 X131.663 Y149.856 E.10206
G1 X130.836 Y149.029 E.03882
G1 X128.118 Y148.802 E.09047
G1 X127.064 Y149.856 E.04944
G1 X123.987 Y149.856 E.10206
G1 X122.888 Y148.757 E.05157
G1 X120.487 Y148.757 E.07964
G1 X119.388 Y149.856 E.05157
G1 X116.311 Y149.856 E.10206
G1 X115.212 Y148.757 E.05157
G1 X116.84 Y148.757 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 3.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X115.212 Y148.757 E-.61876
G1 X115.475 Y149.02 E-.14124
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
G3 Z3.8 I.672 J1.015 P1  F30000
G1 X145.033 Y129.46 Z3.8
G1 Z3.6
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5105
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
M73 P77 R2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5105
G1 X145.149 Y125.352 E.01977
G1 X145.648 Y125.352 E.01656
G1 X145.648 Y125.948 E.01977
G1 X145.209 Y125.948 E.01457
G1 X144.783 Y126.34 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5105
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
G1 F5105
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
G1 F5105
G1 X114.648 Y128.852 E.09634
G1 X128.225 Y128.852 E.45038
G1 X140.225 Y129.852 E.39944
G1 X141.086 Y129.852 E.02855
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
G1 F5105
G1 X115.04 Y128.46 E.06514
G1 X128.241 Y128.46 E.40564
G1 X140.241 Y129.46 E.37
G1 X141.467 Y129.46 E.03768
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
G1 F5105
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
G1 F5105
G3 X140.2 Y130.25 I-.333 J-16.407 E.0216
; LINE_WIDTH: 0.432356
G1 X139.636 Y130.226 E.01793
; LINE_WIDTH: 0.474338
G1 X139.071 Y130.203 E.01986
; LINE_WIDTH: 0.51632
G1 X138.507 Y130.179 E.0218
; LINE_WIDTH: 0.558302
G1 X137.942 Y130.156 E.02373
; LINE_WIDTH: 0.600284
G1 X137.378 Y130.132 E.02566
G1 X134.217 Y129.701 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5105
G1 X135.84 Y129.836 E.05401
G1 X135.376 Y130.3 E.02175
G1 X132.3 Y130.3 E.10206
G1 X131.472 Y129.472 E.03882
G1 X128.754 Y129.246 E.09047
G1 X127.7 Y130.3 E.04944
G1 X124.624 Y130.3 E.10206
G1 X123.524 Y129.2 E.05157
G1 X121.124 Y129.2 E.07964
G1 X120.024 Y130.3 E.05157
G1 X116.948 Y130.3 E.10206
G1 X115.848 Y129.2 E.05157
G1 X117.477 Y129.2 E.05401
; WIPE_START
G1 F24000
G1 X115.848 Y129.2 E-.61876
G1 X116.111 Y129.463 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I-.692 J1.001 P1  F30000
G1 X144.396 Y149.017 Z4
G1 Z3.6
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5105
G1 X145.404 Y149.017 E.03096
G1 X145.404 Y150.597 E.04855
G1 X144.396 Y150.597 E.03096
G1 X144.396 Y149.077 E.04671
M204 S10000
; WIPE_START
G1 F24000
G1 X145.404 Y149.017 E-.3835
G1 X145.404 Y150.007 E-.3765
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I1.194 J-.236 P1  F30000
G1 X144.513 Y145.505 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5105
G1 X144.513 Y144.909 E.01977
G1 X145.012 Y144.909 E.01656
G1 X145.012 Y145.505 E.01977
G1 X144.573 Y145.505 E.01457
G1 X144.146 Y145.897 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5105
G1 X144.121 Y145.897 E.00079
G1 X144.121 Y144.517 E.0424
G1 X144.146 Y144.517 E.00079
G1 X145.404 Y144.517 E.03864
G1 X145.404 Y145.897 E.0424
G1 X144.206 Y145.897 E.03679
M204 S10000
G1 X144.762 Y145.301 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.134926
G1 F5105
G1 X144.762 Y145.112 E.00142
; WIPE_START
G1 F24000
G1 X144.762 Y145.301 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I-.008 J-1.217 P1  F30000
G1 X114.012 Y145.505 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5105
G1 X114.012 Y148.409 E.09634
G1 X127.589 Y148.409 E.45038
G1 X139.589 Y149.409 E.39944
G1 X140.45 Y149.409 E.02855
G1 X140.45 Y150.205 E.0264
G1 X113.716 Y150.205 E.8868
G1 X113.716 Y144.909 E.17567
G1 X140.715 Y144.909 E.89561
G1 X140.715 Y145.505 E.01977
G1 X114.072 Y145.505 E.88381
G1 X114.404 Y145.897 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5105
G1 X114.404 Y148.017 E.06514
G1 X127.605 Y148.017 E.40564
G1 X139.605 Y149.017 E.37
G1 X140.831 Y149.017 E.03768
G1 X140.831 Y150.597 E.04855
G1 X113.324 Y150.597 E.84523
G1 X113.324 Y144.517 E.18682
G1 X141.081 Y144.517 E.85291
G1 X141.107 Y144.517 E.00079
G1 X141.107 Y145.897 E.0424
G1 X141.081 Y145.897 E.00079
G1 X114.464 Y145.897 E.81788
M204 S10000
G1 X113.919 Y145.207 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5105
G1 X140.511 Y145.207 E.40903
; WIPE_START
G1 F24000
G1 X138.511 Y145.207 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I-1.139 J.429 P1  F30000
G1 X140.246 Y149.807 Z4
G1 Z3.6
G1 E.8 F1800
; LINE_WIDTH: 0.431684
G1 F5105
G3 X139.564 Y149.806 I-.333 J-16.407 E.0216
; LINE_WIDTH: 0.432356
G1 X139 Y149.783 E.01793
; LINE_WIDTH: 0.474338
M73 P78 R2
G1 X138.435 Y149.759 E.01986
; LINE_WIDTH: 0.51632
G1 X137.87 Y149.736 E.0218
; LINE_WIDTH: 0.558302
G1 X137.306 Y149.712 E.02373
; LINE_WIDTH: 0.600284
G1 X136.741 Y149.689 E.02566
G1 X133.581 Y149.258 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5105
G1 X135.204 Y149.393 E.05401
G1 X134.74 Y149.856 E.02175
G1 X131.663 Y149.856 E.10206
G1 X130.836 Y149.029 E.03882
G1 X128.118 Y148.802 E.09047
G1 X127.064 Y149.856 E.04944
G1 X123.987 Y149.856 E.10206
G1 X122.888 Y148.757 E.05157
G1 X120.487 Y148.757 E.07964
G1 X119.388 Y149.856 E.05157
G1 X116.311 Y149.856 E.10206
G1 X115.212 Y148.757 E.05157
G1 X116.84 Y148.757 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 3.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X115.212 Y148.757 E-.61876
G1 X115.475 Y149.02 E-.14124
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
G3 Z4 I.657 J1.024 P1  F30000
G1 X145.338 Y129.852 Z4
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5166
G1 X145.648 Y129.852 E.01027
G1 X145.648 Y130.648 E.0264
G1 X145.338 Y130.648 E.01027
G1 X145.338 Y129.912 E.02441
G1 X144.981 Y129.46 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5166
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
G1 F5166
G1 X145.058 Y125.352 E.01977
G1 X145.648 Y125.352 E.01958
G1 X145.648 Y125.948 E.01977
G1 X145.118 Y125.948 E.01759
G1 X144.716 Y126.34 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5166
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
G1 F5166
G1 X114.648 Y128.852 E.09634
G1 X128.225 Y128.852 E.45038
G1 X140.225 Y129.852 E.39944
G1 X141.162 Y129.852 E.03107
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
G1 F5166
G1 X115.04 Y128.46 E.06514
G1 X128.241 Y128.46 E.40564
G1 X140.241 Y129.46 E.37
G1 X141.519 Y129.46 E.03926
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
G1 F5166
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
G1 F5166
G3 X140.2 Y130.25 I-.371 J-18.233 E.02401
; LINE_WIDTH: 0.432356
G1 X139.636 Y130.226 E.01793
; LINE_WIDTH: 0.474338
G1 X139.071 Y130.203 E.01986
; LINE_WIDTH: 0.51632
G1 X138.507 Y130.179 E.0218
; LINE_WIDTH: 0.558302
G1 X137.942 Y130.156 E.02373
; LINE_WIDTH: 0.600284
G1 X137.378 Y130.132 E.02566
G1 X134.217 Y129.701 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5166
G1 X135.84 Y129.836 E.05401
G1 X135.376 Y130.3 E.02175
G1 X132.3 Y130.3 E.10206
G1 X131.472 Y129.472 E.03882
G1 X128.754 Y129.246 E.09047
G1 X127.7 Y130.3 E.04944
G1 X124.624 Y130.3 E.10206
G1 X123.524 Y129.2 E.05157
G1 X121.124 Y129.2 E.07964
G1 X120.024 Y130.3 E.05157
G1 X116.948 Y130.3 E.10206
G1 X115.848 Y129.2 E.05157
G1 X117.477 Y129.2 E.05401
; WIPE_START
G1 F24000
G1 X115.848 Y129.2 E-.61876
G1 X116.111 Y129.463 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
M73 P79 R2
G3 Z4.2 I-.696 J.998 P1  F30000
G1 X144.702 Y149.409 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5166
G1 X145.012 Y149.409 E.01027
G1 X145.012 Y150.205 E.0264
G1 X144.702 Y150.205 E.01027
G1 X144.702 Y149.469 E.02441
G1 X144.345 Y149.017 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5166
G1 X145.404 Y149.017 E.03253
G1 X145.404 Y150.597 E.04855
G1 X144.345 Y150.597 E.03253
G1 X144.31 Y150.597 E.00107
G1 X144.31 Y149.042 E.04778
M204 S10000
; WIPE_START
G1 F24000
G1 X145.404 Y149.017 E-.4157
G1 X145.404 Y149.923 E-.3443
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I1.188 J-.264 P1  F30000
G1 X144.421 Y145.505 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5166
G1 X144.421 Y144.909 E.01977
G1 X145.012 Y144.909 E.01958
G1 X145.012 Y145.505 E.01977
G1 X144.481 Y145.505 E.01759
G1 X144.08 Y145.897 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5166
G1 X144.029 Y145.897 E.00154
G1 X144.029 Y144.517 E.0424
G1 X144.08 Y144.517 E.00154
G1 X145.404 Y144.517 E.04069
G1 X145.404 Y145.897 E.0424
G1 X144.14 Y145.897 E.03885
M204 S10000
; WIPE_START
G1 F24000
G1 X144.029 Y145.897 E-.04188
G1 X144.029 Y144.517 E-.5244
G1 X144.08 Y144.517 E-.01908
G1 X144.539 Y144.517 E-.17464
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I-.039 J-1.216 P1  F30000
G1 X114.012 Y145.505 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5166
G1 X114.012 Y148.409 E.09634
G1 X127.589 Y148.409 E.45038
G1 X139.589 Y149.409 E.39944
G1 X140.525 Y149.409 E.03107
G1 X140.525 Y150.205 E.0264
G1 X113.716 Y150.205 E.88932
G1 X113.716 Y144.909 E.17567
G1 X140.806 Y144.909 E.89863
G1 X140.806 Y145.505 E.01977
G1 X114.072 Y145.505 E.88683
G1 X114.404 Y145.897 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5166
G1 X114.404 Y148.017 E.06514
G1 X127.605 Y148.017 E.40564
G1 X139.605 Y149.017 E.37
G1 X140.883 Y149.017 E.03926
G1 X140.917 Y149.017 E.00107
G1 X140.917 Y150.597 E.04855
G1 X140.883 Y150.597 E.00107
G1 X113.324 Y150.597 E.84681
G1 X113.324 Y144.517 E.18682
G1 X141.148 Y144.517 E.85496
G1 X141.198 Y144.517 E.00154
G1 X141.198 Y145.897 E.0424
G1 X141.148 Y145.897 E.00154
G1 X114.464 Y145.897 E.81993
M204 S10000
G1 X113.919 Y145.207 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5166
G1 X140.603 Y145.207 E.41044
; WIPE_START
G1 F24000
G1 X138.603 Y145.207 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I-1.14 J.426 P1  F30000
G1 X140.322 Y149.807 Z4.2
G1 Z3.8
G1 E.8 F1800
; LINE_WIDTH: 0.431684
G1 F5166
G3 X139.564 Y149.806 I-.371 J-18.233 E.02401
; LINE_WIDTH: 0.432356
G1 X139 Y149.783 E.01793
; LINE_WIDTH: 0.474338
G1 X138.435 Y149.759 E.01986
; LINE_WIDTH: 0.51632
G1 X137.87 Y149.736 E.0218
; LINE_WIDTH: 0.558302
G1 X137.306 Y149.712 E.02373
; LINE_WIDTH: 0.600284
G1 X136.741 Y149.689 E.02566
G1 X133.581 Y149.258 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5166
G1 X135.204 Y149.393 E.05401
G1 X134.74 Y149.856 E.02175
G1 X131.663 Y149.856 E.10206
G1 X130.836 Y149.029 E.03882
G1 X128.118 Y148.802 E.09047
G1 X127.064 Y149.856 E.04944
G1 X123.987 Y149.856 E.10206
G1 X122.888 Y148.757 E.05157
G1 X120.487 Y148.757 E.07964
G1 X119.388 Y149.856 E.05157
G1 X116.311 Y149.856 E.10206
G1 X115.212 Y148.757 E.05157
G1 X116.84 Y148.757 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X115.212 Y148.757 E-.61876
G1 X115.475 Y149.02 E-.14124
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
G3 Z4.2 I.659 J1.023 P1  F30000
G1 X145.221 Y129.852 Z4.2
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5249
G1 X145.648 Y129.852 E.01416
G1 X145.648 Y130.648 E.0264
G1 X145.221 Y130.648 E.01416
G1 X145.221 Y129.912 E.02441
G1 X144.905 Y129.46 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5249
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
M73 P80 R2
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
G1 F5249
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
G1 F5249
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
G1 F5249
G1 X114.648 Y128.852 E.09634
G1 X128.225 Y128.852 E.45038
G1 X140.225 Y129.852 E.39944
G1 X141.279 Y129.852 E.03496
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
G1 F5249
G1 X115.04 Y128.46 E.06514
G1 X128.241 Y128.46 E.40564
G1 X140.241 Y129.46 E.37
G1 X141.595 Y129.46 E.04159
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
G1 F5249
G1 X115.1 Y126.34 E.82525
M204 S10000
G1 X114.556 Y125.65 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5249
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
G1 F5249
G3 X140.2 Y130.25 I-.429 J-21.055 E.02772
; LINE_WIDTH: 0.432356
G1 X139.636 Y130.226 E.01793
; LINE_WIDTH: 0.474338
G1 X139.071 Y130.203 E.01986
; LINE_WIDTH: 0.51632
G1 X138.507 Y130.179 E.0218
; LINE_WIDTH: 0.558302
G1 X137.942 Y130.156 E.02373
; LINE_WIDTH: 0.600284
G1 X137.378 Y130.132 E.02566
G1 X134.217 Y129.701 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5249
G1 X135.84 Y129.836 E.05401
G1 X135.376 Y130.3 E.02175
G1 X132.3 Y130.3 E.10206
G1 X131.472 Y129.472 E.03882
G1 X128.754 Y129.246 E.09047
G1 X127.7 Y130.3 E.04944
G1 X124.624 Y130.3 E.10206
G1 X123.524 Y129.2 E.05157
G1 X121.124 Y129.2 E.07964
G1 X120.024 Y130.3 E.05157
G1 X116.948 Y130.3 E.10206
G1 X115.848 Y129.2 E.05157
G1 X117.477 Y129.2 E.05401
; WIPE_START
G1 F24000
G1 X115.848 Y129.2 E-.61876
G1 X116.111 Y129.463 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I-.698 J.997 P1  F30000
G1 X144.585 Y149.409 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5249
G1 X145.012 Y149.409 E.01416
G1 X145.012 Y150.205 E.0264
G1 X144.585 Y150.205 E.01416
G1 X144.585 Y149.469 E.02441
G1 X144.269 Y149.017 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5249
G1 X145.404 Y149.017 E.03487
G1 X145.404 Y150.597 E.04855
G1 X144.269 Y150.597 E.03487
G1 X144.193 Y150.597 E.00234
G1 X144.193 Y149.017 E.04855
G1 X144.209 Y149.017 E.0005
M204 S10000
; WIPE_START
G1 F24000
G1 X145.404 Y149.017 E-.45397
G1 X145.404 Y149.822 E-.30603
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I1.178 J-.306 P1  F30000
G1 X144.283 Y145.505 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5249
G1 X144.283 Y144.909 E.01977
G1 X145.012 Y144.909 E.02416
G1 X145.012 Y145.505 E.01977
G1 X144.343 Y145.505 E.02217
G1 X143.906 Y145.897 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
G1 X143.891 Y145.897 E.00046
G1 X143.891 Y144.517 E.0424
G1 X143.906 Y144.517 E.00046
G1 F5249
G1 X143.988 Y144.517 E.00252
G1 X145.404 Y144.517 E.04349
G1 X145.404 Y145.897 E.0424
G1 X143.966 Y145.897 E.04417
M204 S10000
; WIPE_START
G1 F24000
G1 X143.891 Y145.897 E-.02852
G1 X143.891 Y144.517 E-.5244
G1 X143.906 Y144.517 E-.00572
G1 X143.988 Y144.517 E-.03116
G1 X144.436 Y144.517 E-.1702
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I-.039 J-1.216 P1  F30000
G1 X114.012 Y145.505 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5249
G1 X114.012 Y148.409 E.09634
G1 X127.589 Y148.409 E.45038
G1 X139.589 Y149.409 E.39944
G1 X140.643 Y149.409 E.03496
G1 X140.643 Y150.205 E.0264
G1 X113.716 Y150.205 E.89321
G1 X113.716 Y144.909 E.17567
G1 X140.944 Y144.909 E.90321
G1 X140.944 Y145.505 E.01977
G1 X114.072 Y145.505 E.89141
G1 X114.404 Y145.897 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5249
G1 X114.404 Y148.017 E.06514
G1 X127.605 Y148.017 E.40564
G1 X139.605 Y149.017 E.37
G1 X140.958 Y149.017 E.04159
G1 X141.035 Y149.017 E.00234
G1 X141.035 Y150.597 E.04855
G1 X140.958 Y150.597 E.00234
G1 X113.324 Y150.597 E.84914
G1 X113.324 Y144.517 E.18682
G1 X141.321 Y144.517 E.86028
G1 F3000
G1 X141.336 Y144.517 E.00046
G1 X141.336 Y145.897 E.0424
G1 X141.321 Y145.897 E.00046
G1 F5249
G1 X114.464 Y145.897 E.82525
M204 S10000
G1 X113.919 Y145.207 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5249
G1 X140.741 Y145.207 E.41256
; WIPE_START
G1 F24000
G1 X138.741 Y145.207 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I-1.142 J.422 P1  F30000
G1 X140.439 Y149.807 Z4.4
G1 Z4
G1 E.8 F1800
; LINE_WIDTH: 0.431684
G1 F5249
G3 X139.564 Y149.806 I-.429 J-21.055 E.02772
; LINE_WIDTH: 0.432356
G1 X139 Y149.783 E.01793
; LINE_WIDTH: 0.474338
G1 X138.435 Y149.759 E.01986
; LINE_WIDTH: 0.51632
G1 X137.87 Y149.736 E.0218
; LINE_WIDTH: 0.558302
G1 X137.306 Y149.712 E.02373
; LINE_WIDTH: 0.600284
G1 X136.741 Y149.689 E.02566
G1 X133.581 Y149.258 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
M73 P81 R2
G1 F5249
G1 X135.204 Y149.393 E.05401
G1 X134.74 Y149.856 E.02175
G1 X131.663 Y149.856 E.10206
G1 X130.836 Y149.029 E.03882
G1 X128.118 Y148.802 E.09047
G1 X127.064 Y149.856 E.04944
G1 X123.987 Y149.856 E.10206
G1 X122.888 Y148.757 E.05157
G1 X120.487 Y148.757 E.07964
G1 X119.388 Y149.856 E.05157
G1 X116.311 Y149.856 E.10206
G1 X115.212 Y148.757 E.05157
G1 X116.84 Y148.757 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 4.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X115.212 Y148.757 E-.61876
G1 X115.475 Y149.02 E-.14124
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
G3 Z4.4 I.661 J1.022 P1  F30000
G1 X145.081 Y129.852 Z4.4
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5433
G1 X145.648 Y129.852 E.01882
G1 X145.648 Y130.648 E.0264
G1 X145.081 Y130.648 E.01882
G1 X145.081 Y129.912 E.02441
G1 X144.788 Y129.46 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5433
G1 X146.04 Y129.46 E.03847
G1 X146.04 Y131.04 E.04855
G1 X144.706 Y131.04 E.04099
G1 F3000
G1 X144.688 Y131.04 E.00054
G1 X144.688 Y129.46 E.04855
G1 X144.706 Y129.46 E.00054
G1 F5433
G1 X144.728 Y129.46 E.00068
M204 S10000
G1 X145.364 Y130.056 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.203242
G1 F5433
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
G1 F5433
G1 X145.648 Y125.352 E.03124
G1 X145.648 Y125.948 E.01977
G1 X144.706 Y125.948 E.03124
G1 X144.706 Y125.412 E.01777
G1 X144.486 Y124.96 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5433
G1 X146.04 Y124.96 E.04773
G1 X146.04 Y126.34 E.0424
G1 X144.322 Y126.34 E.05277
M106 S255
G1 F1800
G1 X144.322 Y124.96 E.0424
M106 S252.45
G1 F5433
G1 X144.426 Y124.96 E.0032
M204 S10000
G1 X144.91 Y125.65 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5433
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
G1 F5433
G1 X114.648 Y128.852 E.09634
G1 X128.225 Y128.852 E.45038
G1 X140.225 Y129.852 E.39944
G1 X141.419 Y129.852 E.03962
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
G1 F5433
G1 X115.04 Y128.46 E.06514
G1 X128.241 Y128.46 E.40564
G1 X140.241 Y129.46 E.37
G1 X141.794 Y129.46 E.04771
G1 F3000
G1 X141.812 Y129.46 E.00054
G1 X141.812 Y131.04 E.04855
G1 X141.794 Y131.04 E.00054
G1 F5433
G1 X141.712 Y131.04 E.00252
G1 X113.96 Y131.04 E.85274
G1 X113.96 Y124.96 E.18682
G1 X142.178 Y124.96 E.86705
M106 S255
G1 F1800
G1 X142.178 Y126.34 E.0424
M106 S252.45
G1 F5433
G1 X115.1 Y126.34 E.83202
M204 S10000
G1 X114.556 Y125.65 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5433
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
G1 F5433
G3 X140.2 Y130.25 I-.5 J-24.438 E.03218
; LINE_WIDTH: 0.432356
G1 X139.636 Y130.226 E.01793
; LINE_WIDTH: 0.474338
G1 X139.071 Y130.203 E.01986
; LINE_WIDTH: 0.51632
G1 X138.507 Y130.179 E.0218
; LINE_WIDTH: 0.558302
G1 X137.942 Y130.156 E.02373
; LINE_WIDTH: 0.600284
G1 X137.378 Y130.132 E.02566
G1 X134.217 Y129.701 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5433
G1 X135.84 Y129.836 E.05401
G1 X135.376 Y130.3 E.02175
G1 X132.3 Y130.3 E.10206
G1 X131.472 Y129.472 E.03882
G1 X128.754 Y129.246 E.09047
G1 X127.7 Y130.3 E.04944
G1 X124.624 Y130.3 E.10206
G1 X123.524 Y129.2 E.05157
G1 X121.124 Y129.2 E.07964
G1 X120.024 Y130.3 E.05157
G1 X116.948 Y130.3 E.10206
G1 X115.848 Y129.2 E.05157
G1 X117.477 Y129.2 E.05401
; WIPE_START
G1 F24000
G1 X115.848 Y129.2 E-.61876
G1 X116.111 Y129.463 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I-.701 J.995 P1  F30000
M73 P82 R2
G1 X144.444 Y149.409 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5433
G1 X145.012 Y149.409 E.01882
G1 X145.012 Y150.205 E.0264
G1 X144.444 Y150.205 E.01882
G1 X144.444 Y149.469 E.02441
G1 X144.152 Y149.017 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5433
G1 X145.404 Y149.017 E.03847
G1 X145.404 Y150.597 E.04855
G1 X144.07 Y150.597 E.04099
G1 F3000
G1 X144.052 Y150.597 E.00054
G1 X144.052 Y149.017 E.04855
G1 X144.07 Y149.017 E.00054
G1 F5433
G1 X144.092 Y149.017 E.00068
M204 S10000
G1 X144.728 Y149.612 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.203242
G1 F5433
G1 X144.728 Y150.001 E.00508
; WIPE_START
G1 F24000
G1 X144.728 Y149.612 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I1.205 J-.169 P1  F30000
G1 X144.07 Y144.909 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5433
G1 X145.012 Y144.909 E.03124
G1 X145.012 Y145.505 E.01977
G1 X144.07 Y145.505 E.03124
G1 X144.07 Y144.969 E.01777
G1 X143.85 Y144.517 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5433
G1 X145.404 Y144.517 E.04773
G1 X145.404 Y145.897 E.0424
G1 X143.686 Y145.897 E.05277
M106 S255
G1 F1800
G1 X143.686 Y144.517 E.0424
M106 S252.45
G1 F5433
G1 X143.79 Y144.517 E.0032
M204 S10000
G1 X144.274 Y145.207 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5433
G1 X144.808 Y145.207 E.00822
; WIPE_START
G1 F24000
G1 X144.274 Y145.207 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I-.012 J-1.217 P1  F30000
G1 X114.012 Y145.505 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5433
G1 X114.012 Y148.409 E.09634
G1 X127.589 Y148.409 E.45038
G1 X139.589 Y149.409 E.39944
G1 X140.783 Y149.409 E.03962
G1 X140.783 Y150.205 E.0264
G1 X113.716 Y150.205 E.89788
G1 X113.716 Y144.909 E.17567
G1 X141.158 Y144.909 E.91029
G1 X141.158 Y145.505 E.01977
G1 X114.072 Y145.505 E.89849
G1 X114.404 Y145.897 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5433
G1 X114.404 Y148.017 E.06514
G1 X127.605 Y148.017 E.40564
G1 X139.605 Y149.017 E.37
G1 X141.158 Y149.017 E.04771
G1 F3000
G1 X141.175 Y149.017 E.00054
G1 X141.175 Y150.597 E.04855
G1 X141.158 Y150.597 E.00054
G1 F5433
G1 X141.076 Y150.597 E.00252
G1 X113.324 Y150.597 E.85274
G1 X113.324 Y144.517 E.18682
G1 X141.541 Y144.517 E.86705
M106 S255
G1 F1800
G1 X141.541 Y145.897 E.0424
M106 S252.45
G1 F5433
G1 X114.464 Y145.897 E.83202
M204 S10000
G1 X113.919 Y145.207 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5433
G1 X140.954 Y145.207 E.41584
; WIPE_START
G1 F24000
G1 X138.954 Y145.207 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I-1.147 J.406 P1  F30000
G1 X140.58 Y149.807 Z4.6
G1 Z4.2
G1 E.8 F1800
; LINE_WIDTH: 0.431684
G1 F5433
G3 X139.564 Y149.806 I-.5 J-24.438 E.03218
; LINE_WIDTH: 0.432356
G1 X139 Y149.783 E.01793
; LINE_WIDTH: 0.474338
G1 X138.435 Y149.759 E.01986
; LINE_WIDTH: 0.51632
G1 X137.87 Y149.736 E.0218
; LINE_WIDTH: 0.558302
G1 X137.306 Y149.712 E.02373
; LINE_WIDTH: 0.600284
G1 X136.741 Y149.689 E.02566
G1 X133.581 Y149.258 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5433
G1 X135.204 Y149.393 E.05401
G1 X134.74 Y149.856 E.02175
G1 X131.663 Y149.856 E.10206
G1 X130.836 Y149.029 E.03882
G1 X128.118 Y148.802 E.09047
G1 X127.064 Y149.856 E.04944
M73 P82 R1
G1 X123.987 Y149.856 E.10206
G1 X122.888 Y148.757 E.05157
G1 X120.487 Y148.757 E.07964
G1 X119.388 Y149.856 E.05157
G1 X116.311 Y149.856 E.10206
G1 X115.212 Y148.757 E.05157
G1 X116.84 Y148.757 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 4.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X115.212 Y148.757 E-.61876
G1 X115.475 Y149.02 E-.14124
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
G3 Z4.6 I.665 J1.019 P1  F30000
G1 X144.855 Y129.852 Z4.6
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5912
G1 X145.648 Y129.852 E.02631
G1 X145.648 Y130.648 E.0264
G1 X144.855 Y130.648 E.02631
G1 X144.855 Y129.912 E.02441
G1 X144.647 Y129.46 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5912
G1 X146.04 Y129.46 E.04279
G1 X146.04 Y131.04 E.04855
G1 X144.483 Y131.04 E.04783
M106 S255
G1 F1800
G1 X144.463 Y131.04 E.00064
G1 X144.463 Y129.46 E.04855
G1 X144.483 Y129.46 E.00064
M106 S252.45
G1 F5912
G1 X144.587 Y129.46 E.0032
M204 S10000
; WIPE_START
G1 F24000
G1 X146.04 Y129.46 E-.55197
G1 X146.04 Y130.007 E-.20803
; WIPE_END
M73 P83 R1
G1 E-.04 F1800
G17
G3 Z4.8 I1.125 J-.464 P1  F30000
G1 X144.366 Y125.948 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5912
G1 X144.366 Y125.352 E.01977
G1 X145.648 Y125.352 E.04253
G1 X145.648 Y125.948 E.01977
G1 X144.426 Y125.948 E.04054
G1 X144.273 Y126.34 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5912
G1 X144.027 Y126.34 E.00756
M106 S255
G1 F600
G1 X143.974 Y126.34 E.00165
G1 X143.974 Y124.96 E.0424
G1 X144.027 Y124.96 E.00165
M106 S252.45
G1 F5912
G1 X144.273 Y124.96 E.00756
G1 X146.04 Y124.96 E.05429
G1 X146.04 Y126.34 E.0424
G1 X144.333 Y126.34 E.05245
M204 S10000
G1 X144.569 Y125.65 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5912
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
G1 F5912
G1 X114.648 Y128.852 E.09634
G1 X128.225 Y128.852 E.45038
G1 X140.225 Y129.852 E.39944
G1 X141.645 Y129.852 E.04711
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
G1 F5912
G1 X115.04 Y128.46 E.06514
G1 X128.241 Y128.46 E.40564
G1 X140.241 Y129.46 E.37
G1 X142.017 Y129.46 E.05455
M106 S255
G1 F1800
G1 X142.037 Y129.46 E.00064
G1 X142.037 Y131.04 E.04855
G1 X142.017 Y131.04 E.00064
M106 S252.45
G1 F5912
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
G1 F5912
G1 X142.227 Y126.34 E.00756
G1 X115.1 Y126.34 E.83353
M204 S10000
G1 X114.556 Y125.65 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5912
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
G1 F5912
G3 X140.2 Y130.25 I-.613 J-29.87 E.03933
; LINE_WIDTH: 0.432356
G1 X139.636 Y130.226 E.01793
; LINE_WIDTH: 0.474338
G1 X139.071 Y130.203 E.01986
; LINE_WIDTH: 0.51632
G1 X138.507 Y130.179 E.0218
; LINE_WIDTH: 0.558302
G1 X137.942 Y130.156 E.02373
; LINE_WIDTH: 0.600284
G1 X137.378 Y130.132 E.02566
G1 X134.217 Y129.701 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5912
G1 X135.84 Y129.836 E.05401
G1 X135.376 Y130.3 E.02175
G1 X132.3 Y130.3 E.10206
G1 X131.472 Y129.472 E.03882
G1 X128.754 Y129.246 E.09047
G1 X127.7 Y130.3 E.04944
G1 X124.624 Y130.3 E.10206
G1 X123.524 Y129.2 E.05157
G1 X121.124 Y129.2 E.07964
G1 X120.024 Y130.3 E.05157
G1 X116.948 Y130.3 E.10206
G1 X115.848 Y129.2 E.05157
G1 X117.477 Y129.2 E.05401
; WIPE_START
G1 F24000
G1 X115.848 Y129.2 E-.61876
G1 X116.111 Y129.463 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I-.704 J.992 P1  F30000
G1 X144.219 Y149.409 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5912
G1 X145.012 Y149.409 E.02631
G1 X145.012 Y150.205 E.0264
G1 X144.219 Y150.205 E.02631
G1 X144.219 Y149.469 E.02441
G1 X144.011 Y149.017 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5912
G1 X145.404 Y149.017 E.04279
G1 X145.404 Y150.597 E.04855
G1 X143.847 Y150.597 E.04783
M106 S255
G1 F1800
G1 X143.826 Y150.597 E.00064
G1 X143.826 Y149.017 E.04855
G1 X143.847 Y149.017 E.00064
M106 S252.45
G1 F5912
G1 X143.951 Y149.017 E.0032
M204 S10000
; WIPE_START
G1 F24000
G1 X145.404 Y149.017 E-.55197
G1 X145.404 Y149.564 E-.20803
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I1.125 J-.464 P1  F30000
G1 X143.729 Y145.505 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5912
G1 X143.729 Y144.909 E.01977
G1 X145.012 Y144.909 E.04253
G1 X145.012 Y145.505 E.01977
G1 X143.789 Y145.505 E.04054
G1 X143.637 Y145.897 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5912
G1 X143.391 Y145.897 E.00756
M106 S255
G1 F600
G1 X143.337 Y145.897 E.00165
G1 X143.337 Y144.517 E.0424
G1 X143.391 Y144.517 E.00165
M106 S252.45
G1 F5912
G1 X143.637 Y144.517 E.00756
G1 X145.404 Y144.517 E.05429
G1 X145.404 Y145.897 E.0424
G1 X143.697 Y145.897 E.05245
M204 S10000
G1 X143.933 Y145.207 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5912
G1 X144.808 Y145.207 E.01346
; WIPE_START
G1 F24000
G1 X143.933 Y145.207 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I-.012 J-1.217 P1  F30000
G1 X114.012 Y145.505 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5912
G1 X114.012 Y148.409 E.09634
G1 X127.589 Y148.409 E.45038
G1 X139.589 Y149.409 E.39944
G1 X141.009 Y149.409 E.04711
G1 X141.009 Y150.205 E.0264
G1 X113.716 Y150.205 E.90536
G1 X113.716 Y144.909 E.17567
G1 X141.498 Y144.909 E.92159
G1 X141.498 Y145.505 E.01977
G1 X114.072 Y145.505 E.90978
G1 X114.404 Y145.897 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5912
G1 X114.404 Y148.017 E.06514
G1 X127.605 Y148.017 E.40564
G1 X139.605 Y149.017 E.37
G1 X141.38 Y149.017 E.05455
M106 S255
G1 F1800
G1 X141.401 Y149.017 E.00064
G1 X141.401 Y150.597 E.04855
G1 X141.38 Y150.597 E.00064
M106 S252.45
G1 F5912
G1 X141.216 Y150.597 E.00504
G1 X113.324 Y150.597 E.85706
G1 X113.324 Y144.517 E.18682
G1 X141.591 Y144.517 E.86856
G1 X141.837 Y144.517 E.00756
M106 S255
G1 F600
G1 X141.89 Y144.517 E.00165
G1 X141.89 Y145.897 E.0424
G1 X141.837 Y145.897 E.00165
M106 S252.45
G1 F5912
G1 X141.591 Y145.897 E.00756
G1 X114.464 Y145.897 E.83353
M204 S10000
G1 X113.919 Y145.207 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5912
G1 X141.295 Y145.207 E.42108
; WIPE_START
G1 F24000
G1 X139.295 Y145.207 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I-1.156 J.38 P1  F30000
G1 X140.805 Y149.807 Z4.8
M73 P84 R1
G1 Z4.4
G1 E.8 F1800
; LINE_WIDTH: 0.431684
G1 F5912
G3 X139.564 Y149.806 I-.613 J-29.87 E.03933
; LINE_WIDTH: 0.432356
G1 X139 Y149.783 E.01793
; LINE_WIDTH: 0.474338
G1 X138.435 Y149.759 E.01986
; LINE_WIDTH: 0.51632
G1 X137.87 Y149.736 E.0218
; LINE_WIDTH: 0.558302
G1 X137.306 Y149.712 E.02373
; LINE_WIDTH: 0.600284
G1 X136.741 Y149.689 E.02566
G1 X133.581 Y149.258 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5912
G1 X135.204 Y149.393 E.05401
G1 X134.74 Y149.856 E.02175
G1 X131.663 Y149.856 E.10206
G1 X130.836 Y149.029 E.03882
G1 X128.118 Y148.802 E.09047
G1 X127.064 Y149.856 E.04944
G1 X123.987 Y149.856 E.10206
G1 X122.888 Y148.757 E.05157
G1 X120.487 Y148.757 E.07964
G1 X119.388 Y149.856 E.05157
G1 X116.311 Y149.856 E.10206
G1 X115.212 Y148.757 E.05157
G1 X116.84 Y148.757 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 4.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X115.212 Y148.757 E-.61876
G1 X115.475 Y149.02 E-.14124
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
G3 Z4.8 I1.216 J-.044 P1  F30000
G1 X114.648 Y125.948 Z4.8
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5960
G1 X114.648 Y128.852 E.09634
G1 X128.225 Y128.852 E.45038
G1 X140.225 Y129.852 E.39944
G1 X141.981 Y129.852 E.05826
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
G1 F5960
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
G1 F5960
G1 X142.554 Y125.948 E.01269
G1 X114.708 Y125.948 E.9237
G1 X115.04 Y126.34 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5960
G1 X115.04 Y128.46 E.06514
G1 X128.241 Y128.46 E.40564
G1 X140.241 Y129.46 E.37
G1 X142.078 Y129.46 E.05645
G1 X142.324 Y129.46 E.00756
M106 S255
G1 F600
G1 X142.373 Y129.46 E.00151
G1 X142.373 Y131.04 E.04855
G1 X142.324 Y131.04 E.00151
M106 S252.45
G1 F5960
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
G1 F5960
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
G1 F5960
G1 X115.1 Y126.34 E.85533
M204 S10000
G1 X114.556 Y125.65 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5960
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
G1 F5960
G3 X140.2 Y130.25 I-.781 J-37.957 E.04998
; LINE_WIDTH: 0.432356
G1 X139.636 Y130.226 E.01793
; LINE_WIDTH: 0.474338
G1 X139.071 Y130.203 E.01986
; LINE_WIDTH: 0.51632
G1 X138.507 Y130.179 E.0218
; LINE_WIDTH: 0.558302
G1 X137.942 Y130.156 E.02373
; LINE_WIDTH: 0.600284
G1 X137.378 Y130.132 E.02566
G1 X134.217 Y129.701 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5960
G1 X135.84 Y129.836 E.05401
G1 X135.376 Y130.3 E.02175
G1 X132.3 Y130.3 E.10206
G1 X131.472 Y129.472 E.03882
G1 X128.754 Y129.246 E.09047
G1 X127.7 Y130.3 E.04944
G1 X124.624 Y130.3 E.10206
G1 X123.524 Y129.2 E.05157
G1 X121.124 Y129.2 E.07964
G1 X120.024 Y130.3 E.05157
G1 X116.948 Y130.3 E.10206
G1 X115.848 Y129.2 E.05157
G1 X117.477 Y129.2 E.05401
; WIPE_START
G1 F24000
G1 X115.848 Y129.2 E-.61876
G1 X116.111 Y129.463 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I-.017 J1.217 P1  F30000
G1 X144.519 Y129.852 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5960
G1 X145.648 Y129.852 E.03746
M73 P85 R1
G1 X145.648 Y130.648 E.0264
G1 X144.519 Y130.648 E.03746
G1 X144.519 Y129.912 E.02441
G1 X144.422 Y129.46 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5960
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
G1 F5960
G1 X144.362 Y129.46 E.00572
M204 S10000
; WIPE_START
G1 F24000
G1 X146.04 Y129.46 E-.63776
G1 X146.04 Y129.782 E-.12224
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I-.536 J-1.092 P1  F30000
G1 X114.012 Y145.505 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5960
G1 X114.012 Y148.409 E.09634
G1 X127.589 Y148.409 E.45038
G1 X139.589 Y149.409 E.39944
G1 X141.345 Y149.409 E.05826
G1 X141.345 Y150.205 E.0264
G1 X113.716 Y150.205 E.91651
G1 X113.716 Y144.909 E.17567
G1 X142.3 Y144.909 E.94819
M204 S5000
; FEATURE: Overhang wall
M106 S255
G1 F3000
G1 X142.927 Y144.909 E.02081
M106 S252.45
M204 S10000
; FEATURE: Inner wall
G1 F5960
G1 X145.012 Y144.909 E.06914
G1 X145.012 Y145.505 E.01977
G1 X142.927 Y145.505 E.06914
M204 S5000
; FEATURE: Overhang wall
M106 S255
G1 F3000
G1 X142.3 Y145.505 E.02081
M106 S252.45
M204 S10000
; FEATURE: Inner wall
G1 F5960
G1 X141.918 Y145.505 E.01269
G1 X114.072 Y145.505 E.9237
G1 X114.404 Y145.897 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5960
G1 X114.404 Y148.017 E.06514
G1 X127.605 Y148.017 E.40564
G1 X139.605 Y149.017 E.37
G1 X141.442 Y149.017 E.05645
G1 X141.688 Y149.017 E.00756
M106 S255
G1 F600
G1 X141.737 Y149.017 E.00151
G1 X141.737 Y150.597 E.04855
G1 X141.688 Y150.597 E.00151
M106 S252.45
G1 F5960
G1 X141.442 Y150.597 E.00756
G1 X113.324 Y150.597 E.864
G1 X113.324 Y144.517 E.18682
G1 X142.3 Y144.517 E.89036
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X142.927 Y144.517 E.02081
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5960
G1 X145.404 Y144.517 E.07609
G1 X145.404 Y145.897 E.0424
G1 X142.927 Y145.897 E.07609
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X142.3 Y145.897 E.02081
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5960
G1 X114.464 Y145.897 E.85533
M204 S10000
G1 X113.919 Y145.207 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5960
G1 X144.808 Y145.207 E.47513
; WIPE_START
G1 F24000
G1 X142.808 Y145.207 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I-1.144 J-.415 P1  F30000
G1 X141.142 Y149.807 Z5
G1 Z4.6
G1 E.8 F1800
; LINE_WIDTH: 0.431684
G1 F5960
G3 X139.564 Y149.806 I-.781 J-37.957 E.04998
; LINE_WIDTH: 0.432356
G1 X139 Y149.783 E.01793
; LINE_WIDTH: 0.474338
G1 X138.435 Y149.759 E.01986
; LINE_WIDTH: 0.51632
G1 X137.87 Y149.736 E.0218
; LINE_WIDTH: 0.558302
G1 X137.306 Y149.712 E.02373
; LINE_WIDTH: 0.600284
G1 X136.741 Y149.689 E.02566
G1 X133.581 Y149.258 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5960
G1 X135.204 Y149.393 E.05401
G1 X134.74 Y149.856 E.02175
G1 X131.663 Y149.856 E.10206
G1 X130.836 Y149.029 E.03882
G1 X128.118 Y148.802 E.09047
G1 X127.064 Y149.856 E.04944
G1 X123.987 Y149.856 E.10206
G1 X122.888 Y148.757 E.05157
G1 X120.487 Y148.757 E.07964
G1 X119.388 Y149.856 E.05157
G1 X116.311 Y149.856 E.10206
G1 X115.212 Y148.757 E.05157
G1 X116.84 Y148.757 E.05401
; WIPE_START
G1 F24000
G1 X115.212 Y148.757 E-.61876
G1 X115.475 Y149.02 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I-.017 J1.217 P1  F30000
G1 X143.882 Y149.409 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5960
G1 X145.012 Y149.409 E.03746
G1 X145.012 Y150.205 E.0264
G1 X143.882 Y150.205 E.03746
G1 X143.882 Y149.469 E.02441
G1 X143.785 Y149.017 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5960
G1 X145.404 Y149.017 E.04973
G1 X145.404 Y150.597 E.04855
G1 X143.785 Y150.597 E.04973
G1 X143.539 Y150.597 E.00756
M106 S255
G1 F600
G1 X143.49 Y150.597 E.00151
G1 X143.49 Y149.017 E.04855
G1 X143.539 Y149.017 E.00151
M106 S252.45
G1 F5960
G1 X143.725 Y149.017 E.00572
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 4.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X145.404 Y149.017 E-.63776
G1 X145.404 Y149.338 E-.12224
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
G3 Z5 I.737 J-.969 P1  F30000
G1 X114.648 Y125.948 Z5
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5381
G1 X114.648 Y128.852 E.09634
G1 X128.225 Y128.852 E.45038
G1 X140.225 Y129.852 E.39944
G1 X142.783 Y129.852 E.08487
M204 S5000
; FEATURE: Overhang wall
M106 S255
G1 F3000
G1 X143.717 Y129.852 E.03096
M106 S252.45
M204 S10000
; FEATURE: Inner wall
G1 F5381
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
G1 F5381
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
G1 F5381
G1 X115.04 Y128.46 E.06514
G1 X128.241 Y128.46 E.40564
G1 X140.241 Y129.46 E.37
G1 X142.783 Y129.46 E.07811
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X143.717 Y129.46 E.03096
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5381
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
G1 F5381
G1 X142.414 Y131.04 E.01134
G1 X113.96 Y131.04 E.87432
G1 X113.96 Y124.96 E.18682
G1 X146.04 Y124.96 E.98573
G1 X146.04 Y126.34 E.0424
G1 X115.1 Y126.34 E.9507
M204 S10000
M73 P86 R1
G1 X114.556 Y125.65 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5381
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
G1 F5381
G1 X140.2 Y130.25 E.16613
; LINE_WIDTH: 0.432356
G1 X139.636 Y130.226 E.01793
; LINE_WIDTH: 0.474338
G1 X139.071 Y130.203 E.01986
; LINE_WIDTH: 0.51632
G1 X138.507 Y130.179 E.0218
; LINE_WIDTH: 0.558302
G1 X137.942 Y130.156 E.02373
; LINE_WIDTH: 0.600284
G1 X137.378 Y130.132 E.02566
G1 X134.217 Y129.701 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5381
G1 X135.84 Y129.836 E.05401
G1 X135.376 Y130.3 E.02175
G1 X132.3 Y130.3 E.10206
G1 X131.472 Y129.472 E.03882
G1 X128.754 Y129.246 E.09047
G1 X127.7 Y130.3 E.04944
G1 X124.624 Y130.3 E.10206
G1 X123.524 Y129.2 E.05157
G1 X121.124 Y129.2 E.07964
G1 X120.024 Y130.3 E.05157
G1 X116.948 Y130.3 E.10206
G1 X115.848 Y129.2 E.05157
G1 X117.477 Y129.2 E.05401
; WIPE_START
G1 F24000
G1 X115.848 Y129.2 E-.61876
G1 X116.111 Y129.463 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I-1.207 J-.158 P1  F30000
G1 X114.012 Y145.505 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5381
G1 X114.012 Y148.409 E.09634
G1 X127.589 Y148.409 E.45038
G1 X139.589 Y149.409 E.39944
G1 X142.147 Y149.409 E.08487
M204 S5000
; FEATURE: Overhang wall
M106 S255
G1 F3000
G1 X143.08 Y149.409 E.03096
M106 S252.45
M204 S10000
; FEATURE: Inner wall
G1 F5381
G1 X145.012 Y149.409 E.06407
G1 X145.012 Y150.205 E.0264
G1 X143.08 Y150.205 E.06407
M204 S5000
; FEATURE: Overhang wall
M106 S255
G1 F3000
G1 X142.147 Y150.205 E.03096
M106 S252.45
M204 S10000
; FEATURE: Inner wall
G1 F5381
G1 X141.765 Y150.205 E.01269
G1 X113.716 Y150.205 E.93043
G1 X113.716 Y144.909 E.17567
G1 X145.012 Y144.909 E1.03814
G1 X145.012 Y145.505 E.01977
G1 X114.072 Y145.505 E1.02634
G1 X114.404 Y145.897 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5381
G1 X114.404 Y148.017 E.06514
G1 X127.605 Y148.017 E.40564
G1 X139.605 Y149.017 E.37
G1 X142.147 Y149.017 E.07811
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X143.08 Y149.017 E.03096
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5381
G1 X145.404 Y149.017 E.07139
G1 X145.404 Y150.597 E.04855
G1 X143.08 Y150.597 E.07139
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X142.147 Y150.597 E.03096
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5381
G1 X141.778 Y150.597 E.01134
G1 X113.324 Y150.597 E.87432
G1 X113.324 Y144.517 E.18682
G1 X145.404 Y144.517 E.98573
G1 X145.404 Y145.897 E.0424
G1 X114.464 Y145.897 E.9507
M204 S10000
G1 X113.919 Y145.207 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5381
G1 X144.808 Y145.207 E.47513
; WIPE_START
G1 F24000
G1 X142.808 Y145.207 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I-1.116 J.485 P1  F30000
G1 X144.808 Y149.807 Z5.2
G1 Z4.8
G1 E.8 F1800
; LINE_WIDTH: 0.431684
G1 F5381
G1 X139.564 Y149.806 E.16613
; LINE_WIDTH: 0.432356
G1 X139 Y149.783 E.01793
; LINE_WIDTH: 0.474338
G1 X138.435 Y149.759 E.01986
; LINE_WIDTH: 0.51632
G1 X137.87 Y149.736 E.0218
; LINE_WIDTH: 0.558302
G1 X137.306 Y149.712 E.02373
; LINE_WIDTH: 0.600284
G1 X136.741 Y149.689 E.02566
G1 X133.581 Y149.258 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5381
G1 X135.204 Y149.393 E.05401
G1 X134.74 Y149.856 E.02175
G1 X131.663 Y149.856 E.10206
G1 X130.836 Y149.029 E.03882
G1 X128.118 Y148.802 E.09047
G1 X127.064 Y149.856 E.04944
G1 X123.987 Y149.856 E.10206
G1 X122.888 Y148.757 E.05157
G1 X120.487 Y148.757 E.07964
G1 X119.388 Y149.856 E.05157
G1 X116.311 Y149.856 E.10206
G1 X115.212 Y148.757 E.05157
G1 X116.84 Y148.757 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 5
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X115.212 Y148.757 E-.61876
G1 X115.475 Y149.02 E-.14124
; WIPE_END
M73 P87 R1
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
G3 Z5.2 I1.216 J-.044 P1  F30000
G1 X114.648 Y125.948 Z5.2
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5302
G1 X114.648 Y128.852 E.09634
G1 X128.225 Y128.852 E.45038
G1 X140.225 Y129.852 E.39944
G1 X145.648 Y129.852 E.17989
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
G1 F5302
G1 X115.04 Y128.46 E.06514
G1 X128.241 Y128.46 E.40564
G1 X140.241 Y129.46 E.37
G1 X146.04 Y129.46 E.17818
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
G1 F5302
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
G1 F5302
G1 X140.2 Y130.25 E.16613
; LINE_WIDTH: 0.432356
G1 X139.636 Y130.226 E.01793
; LINE_WIDTH: 0.474338
G1 X139.071 Y130.203 E.01986
; LINE_WIDTH: 0.51632
G1 X138.507 Y130.179 E.0218
; LINE_WIDTH: 0.558302
G1 X137.942 Y130.156 E.02373
; LINE_WIDTH: 0.600284
G1 X137.378 Y130.132 E.02566
G1 X134.217 Y129.701 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5302
G1 X135.84 Y129.836 E.05401
G1 X135.376 Y130.3 E.02175
G1 X132.3 Y130.3 E.10206
G1 X131.472 Y129.472 E.03882
G1 X128.754 Y129.246 E.09047
G1 X127.7 Y130.3 E.04944
G1 X124.624 Y130.3 E.10206
G1 X123.524 Y129.2 E.05157
G1 X121.124 Y129.2 E.07964
G1 X120.024 Y130.3 E.05157
G1 X116.948 Y130.3 E.10206
G1 X115.848 Y129.2 E.05157
G1 X117.477 Y129.2 E.05401
; WIPE_START
G1 F24000
G1 X115.848 Y129.2 E-.61876
G1 X116.111 Y129.463 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I-1.207 J-.158 P1  F30000
G1 X114.012 Y145.505 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5302
G1 X114.012 Y148.409 E.09634
G1 X127.589 Y148.409 E.45038
G1 X139.589 Y149.409 E.39944
G1 X145.012 Y149.409 E.17989
G1 X145.012 Y150.205 E.0264
G1 X113.716 Y150.205 E1.03814
G1 X113.716 Y144.909 E.17567
G1 X145.012 Y144.909 E1.03814
G1 X145.012 Y145.505 E.01977
G1 X114.072 Y145.505 E1.02634
G1 X114.404 Y145.897 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5302
G1 X114.404 Y148.017 E.06514
G1 X127.605 Y148.017 E.40564
G1 X139.605 Y149.017 E.37
G1 X145.404 Y149.017 E.17818
G1 X145.404 Y150.597 E.04855
G1 X113.324 Y150.597 E.98573
G1 X113.324 Y144.517 E.18682
G1 X145.404 Y144.517 E.98573
G1 X145.404 Y145.897 E.0424
G1 X114.464 Y145.897 E.9507
M204 S10000
G1 X113.919 Y145.207 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5302
G1 X144.808 Y145.207 E.47513
; WIPE_START
G1 F24000
G1 X142.808 Y145.207 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I-1.116 J.485 P1  F30000
G1 X144.808 Y149.807 Z5.4
G1 Z5
M73 P88 R1
G1 E.8 F1800
; LINE_WIDTH: 0.431684
G1 F5302
G1 X139.564 Y149.806 E.16613
; LINE_WIDTH: 0.432356
G1 X139 Y149.783 E.01793
; LINE_WIDTH: 0.474338
G1 X138.435 Y149.759 E.01986
; LINE_WIDTH: 0.51632
G1 X137.87 Y149.736 E.0218
; LINE_WIDTH: 0.558302
G1 X137.306 Y149.712 E.02373
; LINE_WIDTH: 0.600284
G1 X136.741 Y149.689 E.02566
G1 X133.581 Y149.258 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5302
G1 X135.204 Y149.393 E.05401
G1 X134.74 Y149.856 E.02175
G1 X131.663 Y149.856 E.10206
G1 X130.836 Y149.029 E.03882
G1 X128.118 Y148.802 E.09047
G1 X127.064 Y149.856 E.04944
G1 X123.987 Y149.856 E.10206
G1 X122.888 Y148.757 E.05157
G1 X120.487 Y148.757 E.07964
G1 X119.388 Y149.856 E.05157
G1 X116.311 Y149.856 E.10206
G1 X115.212 Y148.757 E.05157
G1 X116.84 Y148.757 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 5.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X115.212 Y148.757 E-.61876
G1 X115.475 Y149.02 E-.14124
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
G3 Z5.4 I1.216 J-.044 P1  F30000
G1 X114.648 Y125.948 Z5.4
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5302
G1 X114.648 Y128.852 E.09634
G1 X128.225 Y128.852 E.45038
G1 X140.225 Y129.852 E.39944
G1 X145.648 Y129.852 E.17989
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
G1 F5302
G1 X115.04 Y128.46 E.06514
G1 X128.241 Y128.46 E.40564
G1 X140.241 Y129.46 E.37
G1 X146.04 Y129.46 E.17818
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
G1 F5302
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
G1 F5302
G1 X140.2 Y130.25 E.16613
; LINE_WIDTH: 0.432356
G1 X139.636 Y130.226 E.01793
; LINE_WIDTH: 0.474338
G1 X139.071 Y130.203 E.01986
; LINE_WIDTH: 0.51632
G1 X138.507 Y130.179 E.0218
; LINE_WIDTH: 0.558302
G1 X137.942 Y130.156 E.02373
; LINE_WIDTH: 0.600284
G1 X137.378 Y130.132 E.02566
G1 X134.217 Y129.701 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5302
G1 X135.84 Y129.836 E.05401
G1 X135.376 Y130.3 E.02175
G1 X132.3 Y130.3 E.10206
G1 X131.472 Y129.472 E.03882
G1 X128.754 Y129.246 E.09047
G1 X127.7 Y130.3 E.04944
G1 X124.624 Y130.3 E.10206
G1 X123.524 Y129.2 E.05157
G1 X121.124 Y129.2 E.07964
G1 X120.024 Y130.3 E.05157
G1 X116.948 Y130.3 E.10206
G1 X115.848 Y129.2 E.05157
G1 X117.477 Y129.2 E.05401
; WIPE_START
G1 F24000
G1 X115.848 Y129.2 E-.61876
G1 X116.111 Y129.463 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I-1.207 J-.158 P1  F30000
G1 X114.012 Y145.505 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5302
G1 X114.012 Y148.409 E.09634
G1 X127.589 Y148.409 E.45038
M73 P89 R1
G1 X139.589 Y149.409 E.39944
G1 X145.012 Y149.409 E.17989
G1 X145.012 Y150.205 E.0264
G1 X113.716 Y150.205 E1.03814
G1 X113.716 Y144.909 E.17567
G1 X145.012 Y144.909 E1.03814
G1 X145.012 Y145.505 E.01977
G1 X114.072 Y145.505 E1.02634
G1 X114.404 Y145.897 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5302
G1 X114.404 Y148.017 E.06514
G1 X127.605 Y148.017 E.40564
G1 X139.605 Y149.017 E.37
G1 X145.404 Y149.017 E.17818
G1 X145.404 Y150.597 E.04855
G1 X113.324 Y150.597 E.98573
G1 X113.324 Y144.517 E.18682
G1 X145.404 Y144.517 E.98573
G1 X145.404 Y145.897 E.0424
G1 X114.464 Y145.897 E.9507
M204 S10000
G1 X113.919 Y145.207 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5302
G1 X144.808 Y145.207 E.47513
; WIPE_START
G1 F24000
G1 X142.808 Y145.207 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I-1.116 J.485 P1  F30000
G1 X144.808 Y149.807 Z5.6
G1 Z5.2
G1 E.8 F1800
; LINE_WIDTH: 0.431684
G1 F5302
G1 X139.564 Y149.806 E.16613
; LINE_WIDTH: 0.432356
G1 X139 Y149.783 E.01793
; LINE_WIDTH: 0.474338
G1 X138.435 Y149.759 E.01986
; LINE_WIDTH: 0.51632
G1 X137.87 Y149.736 E.0218
; LINE_WIDTH: 0.558302
G1 X137.306 Y149.712 E.02373
; LINE_WIDTH: 0.600284
G1 X136.741 Y149.689 E.02566
G1 X133.581 Y149.258 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5302
G1 X135.204 Y149.393 E.05401
G1 X134.74 Y149.856 E.02175
G1 X131.663 Y149.856 E.10206
G1 X130.836 Y149.029 E.03882
G1 X128.118 Y148.802 E.09047
G1 X127.064 Y149.856 E.04944
G1 X123.987 Y149.856 E.10206
G1 X122.888 Y148.757 E.05157
G1 X120.487 Y148.757 E.07964
G1 X119.388 Y149.856 E.05157
G1 X116.311 Y149.856 E.10206
G1 X115.212 Y148.757 E.05157
G1 X116.84 Y148.757 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 5.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X115.212 Y148.757 E-.61876
G1 X115.475 Y149.02 E-.14124
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
G3 Z5.6 I1.216 J-.044 P1  F30000
G1 X114.648 Y125.948 Z5.6
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5302
G1 X114.648 Y128.852 E.09634
G1 X128.225 Y128.852 E.45038
G1 X140.225 Y129.852 E.39944
G1 X145.648 Y129.852 E.17989
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
G1 F5302
G1 X115.04 Y128.46 E.06514
G1 X128.241 Y128.46 E.40564
G1 X140.241 Y129.46 E.37
G1 X146.04 Y129.46 E.17818
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
M73 P90 R1
G1 F5302
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
G1 F5302
G1 X140.2 Y130.25 E.16613
; LINE_WIDTH: 0.432356
G1 X139.636 Y130.226 E.01793
; LINE_WIDTH: 0.474338
G1 X139.071 Y130.203 E.01986
; LINE_WIDTH: 0.51632
G1 X138.507 Y130.179 E.0218
; LINE_WIDTH: 0.558302
G1 X137.942 Y130.156 E.02373
; LINE_WIDTH: 0.600284
G1 X137.378 Y130.132 E.02566
G1 X134.217 Y129.701 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5302
G1 X135.84 Y129.836 E.05401
G1 X135.376 Y130.3 E.02175
G1 X132.3 Y130.3 E.10206
G1 X131.472 Y129.472 E.03882
G1 X128.754 Y129.246 E.09047
G1 X127.7 Y130.3 E.04944
G1 X124.624 Y130.3 E.10206
G1 X123.524 Y129.2 E.05157
G1 X121.124 Y129.2 E.07964
G1 X120.024 Y130.3 E.05157
G1 X116.948 Y130.3 E.10206
G1 X115.848 Y129.2 E.05157
G1 X117.477 Y129.2 E.05401
; WIPE_START
G1 F24000
G1 X115.848 Y129.2 E-.61876
G1 X116.111 Y129.463 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I-1.207 J-.158 P1  F30000
G1 X114.012 Y145.505 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5302
G1 X114.012 Y148.409 E.09634
G1 X127.589 Y148.409 E.45038
G1 X139.589 Y149.409 E.39944
G1 X145.012 Y149.409 E.17989
G1 X145.012 Y150.205 E.0264
G1 X113.716 Y150.205 E1.03814
G1 X113.716 Y144.909 E.17567
G1 X145.012 Y144.909 E1.03814
G1 X145.012 Y145.505 E.01977
G1 X114.072 Y145.505 E1.02634
G1 X114.404 Y145.897 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5302
G1 X114.404 Y148.017 E.06514
G1 X127.605 Y148.017 E.40564
G1 X139.605 Y149.017 E.37
G1 X145.404 Y149.017 E.17818
G1 X145.404 Y150.597 E.04855
G1 X113.324 Y150.597 E.98573
G1 X113.324 Y144.517 E.18682
G1 X145.404 Y144.517 E.98573
G1 X145.404 Y145.897 E.0424
G1 X114.464 Y145.897 E.9507
M204 S10000
G1 X113.919 Y145.207 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5302
G1 X144.808 Y145.207 E.47513
; WIPE_START
G1 F24000
G1 X142.808 Y145.207 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I-1.116 J.485 P1  F30000
G1 X144.808 Y149.807 Z5.8
G1 Z5.4
G1 E.8 F1800
; LINE_WIDTH: 0.431684
G1 F5302
G1 X139.564 Y149.806 E.16613
; LINE_WIDTH: 0.432356
G1 X139 Y149.783 E.01793
; LINE_WIDTH: 0.474338
G1 X138.435 Y149.759 E.01986
; LINE_WIDTH: 0.51632
G1 X137.87 Y149.736 E.0218
; LINE_WIDTH: 0.558302
G1 X137.306 Y149.712 E.02373
; LINE_WIDTH: 0.600284
G1 X136.741 Y149.689 E.02566
G1 X133.581 Y149.258 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5302
G1 X135.204 Y149.393 E.05401
G1 X134.74 Y149.856 E.02175
G1 X131.663 Y149.856 E.10206
G1 X130.836 Y149.029 E.03882
G1 X128.118 Y148.802 E.09047
G1 X127.064 Y149.856 E.04944
G1 X123.987 Y149.856 E.10206
G1 X122.888 Y148.757 E.05157
G1 X120.487 Y148.757 E.07964
G1 X119.388 Y149.856 E.05157
G1 X116.311 Y149.856 E.10206
G1 X115.212 Y148.757 E.05157
G1 X116.84 Y148.757 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 5.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X115.212 Y148.757 E-.61876
G1 X115.475 Y149.02 E-.14124
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
G3 Z5.8 I1.216 J-.044 P1  F30000
G1 X114.648 Y125.948 Z5.8
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
M73 P91 R1
G1 F6155
G1 X114.648 Y128.852 E.09634
G1 X128.225 Y128.852 E.45038
G1 X140.225 Y129.852 E.39944
G1 X145.648 Y129.852 E.17989
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
G1 F6155
G1 X115.04 Y128.46 E.06514
G1 X128.241 Y128.46 E.40564
G1 X140.241 Y129.46 E.37
G1 X146.04 Y129.46 E.17818
M73 P91 R0
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
G1 F6155
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
G1 F6155
G1 X140.2 Y130.25 E.16613
; LINE_WIDTH: 0.432356
G1 X139.636 Y130.226 E.01793
; LINE_WIDTH: 0.474338
G1 X139.071 Y130.203 E.01986
; LINE_WIDTH: 0.51632
G1 X138.507 Y130.179 E.0218
; LINE_WIDTH: 0.558302
G1 X137.942 Y130.156 E.02373
; LINE_WIDTH: 0.600284
G1 X137.378 Y130.132 E.02566
G1 X128.63 Y129.768 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.640764
G1 F6155
G1 X128.556 Y129.739 E.00387
; LINE_WIDTH: 0.594008
G1 X128.482 Y129.709 E.00356
; LINE_WIDTH: 0.547251
G1 X128.409 Y129.68 E.00326
; LINE_WIDTH: 0.500494
G1 X128.335 Y129.65 E.00296
; LINE_WIDTH: 0.453737
G1 X128.261 Y129.621 E.00266
; LINE_WIDTH: 0.360363
G1 X128.188 Y129.591 E.00205
G1 X115.091 Y129.591 E.33877
G1 X115.091 Y129.909 E.00821
G1 X128.188 Y129.909 E.33877
; LINE_WIDTH: 0.360223
G1 X128.252 Y129.888 E.00174
; LINE_WIDTH: 0.40698
G1 X128.316 Y129.868 E.002
; LINE_WIDTH: 0.453737
G1 X128.38 Y129.848 E.00225
; LINE_WIDTH: 0.500494
G1 X128.444 Y129.827 E.00251
; LINE_WIDTH: 0.547251
G1 X128.508 Y129.807 E.00276
; LINE_WIDTH: 0.594008
G1 X128.572 Y129.787 E.00302
G1 X128.63 Y129.768 F30000
; LINE_WIDTH: 0.640764
G1 F6155
G1 X129.152 Y129.79 E.02547
; LINE_WIDTH: 0.596486
G1 X129.674 Y129.812 E.02358
; LINE_WIDTH: 0.552208
G1 X130.196 Y129.834 E.02169
; LINE_WIDTH: 0.507929
G1 X130.719 Y129.855 E.01981
; LINE_WIDTH: 0.463651
G1 X131.241 Y129.877 E.01792
; LINE_WIDTH: 0.419373
G1 X131.763 Y129.899 E.01604
G1 X128.209 Y129.244 F30000
; LINE_WIDTH: 0.419999
G1 F6155
G1 X114.744 Y129.244 E.41373
G1 X114.744 Y130.256 E.03109
G1 X131.823 Y130.256 E.52479
G1 X131.956 Y130.231 E.00416
; LINE_WIDTH: 0.46982
G1 X132.09 Y130.206 E.00471
; LINE_WIDTH: 0.519641
G1 X132.223 Y130.181 E.00526
; LINE_WIDTH: 0.569462
G1 X133.377 Y130.205 E.04954
; LINE_WIDTH: 0.521448
G1 X134.531 Y130.229 E.04502
; LINE_WIDTH: 0.473434
G1 X135.686 Y130.253 E.0405
; LINE_WIDTH: 0.408266
G2 X137 Y130.277 I1.235 J-31.596 E.03915
G1 X137.014 Y129.957 E.00955
G1 X136.854 Y129.943 E.00478
; LINE_WIDTH: 0.377405
G1 X135.702 Y129.871 E.03147
; LINE_WIDTH: 0.42542
G1 X134.549 Y129.799 E.03599
; LINE_WIDTH: 0.473434
G1 X133.397 Y129.727 E.0405
; LINE_WIDTH: 0.521448
G1 X132.245 Y129.655 E.04502
; LINE_WIDTH: 0.569462
G1 X132.114 Y129.62 E.00582
; LINE_WIDTH: 0.519641
G1 X131.983 Y129.584 E.00526
; LINE_WIDTH: 0.421809
G1 X131.853 Y129.548 E.00418
G1 X128.268 Y129.249 E.11104
; WIPE_START
G1 F24000
G1 X130.262 Y129.415 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I-.856 J-.865 P1  F30000
G1 X114.012 Y145.505 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6155
G1 X114.012 Y148.409 E.09634
G1 X127.589 Y148.409 E.45038
G1 X139.589 Y149.409 E.39944
G1 X145.012 Y149.409 E.17989
G1 X145.012 Y150.205 E.0264
G1 X113.716 Y150.205 E1.03814
G1 X113.716 Y144.909 E.17567
G1 X145.012 Y144.909 E1.03814
M73 P92 R0
G1 X145.012 Y145.505 E.01977
G1 X114.072 Y145.505 E1.02634
G1 X114.404 Y145.897 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6155
G1 X114.404 Y148.017 E.06514
G1 X127.605 Y148.017 E.40564
G1 X139.605 Y149.017 E.37
G1 X145.404 Y149.017 E.17818
G1 X145.404 Y150.597 E.04855
G1 X113.324 Y150.597 E.98573
G1 X113.324 Y144.517 E.18682
G1 X145.404 Y144.517 E.98573
G1 X145.404 Y145.897 E.0424
G1 X114.464 Y145.897 E.9507
M204 S10000
G1 X113.919 Y145.207 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F6155
G1 X144.808 Y145.207 E.47513
; WIPE_START
G1 F24000
G1 X142.808 Y145.207 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I-1.116 J.485 P1  F30000
G1 X144.808 Y149.807 Z6
G1 Z5.6
G1 E.8 F1800
; LINE_WIDTH: 0.431684
G1 F6155
G1 X139.564 Y149.806 E.16613
; LINE_WIDTH: 0.432356
G1 X139 Y149.783 E.01793
; LINE_WIDTH: 0.474338
G1 X138.435 Y149.759 E.01986
; LINE_WIDTH: 0.51632
G1 X137.87 Y149.736 E.0218
; LINE_WIDTH: 0.558302
G1 X137.306 Y149.712 E.02373
; LINE_WIDTH: 0.600284
G1 X136.741 Y149.689 E.02566
G1 X127.993 Y149.325 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.640764
G1 F6155
G1 X127.92 Y149.295 E.00387
; LINE_WIDTH: 0.594008
G1 X127.846 Y149.266 E.00356
; LINE_WIDTH: 0.547251
G1 X127.772 Y149.236 E.00326
; LINE_WIDTH: 0.500494
G1 X127.699 Y149.207 E.00296
; LINE_WIDTH: 0.453737
G1 X127.625 Y149.177 E.00266
; LINE_WIDTH: 0.360363
G1 X127.551 Y149.148 E.00205
G1 X114.455 Y149.148 E.33877
G1 X114.455 Y149.465 E.00821
G1 X127.551 Y149.465 E.33877
; LINE_WIDTH: 0.360223
G1 X127.616 Y149.445 E.00174
; LINE_WIDTH: 0.40698
G1 X127.68 Y149.425 E.002
; LINE_WIDTH: 0.453737
G1 X127.744 Y149.404 E.00225
; LINE_WIDTH: 0.500494
G1 X127.808 Y149.384 E.00251
; LINE_WIDTH: 0.547251
G1 X127.872 Y149.363 E.00276
; LINE_WIDTH: 0.594008
G1 X127.936 Y149.343 E.00302
G1 X127.993 Y149.325 F30000
; LINE_WIDTH: 0.640764
G1 F6155
G1 X128.516 Y149.347 E.02547
; LINE_WIDTH: 0.596486
G1 X129.038 Y149.368 E.02358
; LINE_WIDTH: 0.552208
G1 X129.56 Y149.39 E.02169
; LINE_WIDTH: 0.507929
G1 X130.082 Y149.412 E.01981
; LINE_WIDTH: 0.463651
G1 X130.605 Y149.434 E.01792
; LINE_WIDTH: 0.419373
G1 X131.127 Y149.455 E.01604
G1 X127.572 Y148.801 F30000
; LINE_WIDTH: 0.419999
G1 F6155
G1 X114.108 Y148.801 E.41373
G1 X114.108 Y149.812 E.03109
G1 X131.187 Y149.812 E.52479
G1 X131.32 Y149.788 E.00416
; LINE_WIDTH: 0.46982
G1 X131.453 Y149.763 E.00471
; LINE_WIDTH: 0.519641
G1 X131.587 Y149.738 E.00526
; LINE_WIDTH: 0.569462
G1 X132.741 Y149.762 E.04954
; LINE_WIDTH: 0.521448
G1 X133.895 Y149.786 E.04502
; LINE_WIDTH: 0.473434
G1 X135.05 Y149.81 E.0405
; LINE_WIDTH: 0.408266
G2 X136.364 Y149.834 I1.235 J-31.596 E.03915
G1 X136.378 Y149.513 E.00955
G1 X136.218 Y149.5 E.00478
; LINE_WIDTH: 0.377405
G1 X135.065 Y149.428 E.03147
; LINE_WIDTH: 0.42542
G1 X133.913 Y149.356 E.03599
; LINE_WIDTH: 0.473434
G1 X132.761 Y149.284 E.0405
; LINE_WIDTH: 0.521448
G1 X131.608 Y149.212 E.04502
; LINE_WIDTH: 0.569462
G1 X131.478 Y149.176 E.00582
; LINE_WIDTH: 0.519641
G1 X131.347 Y149.14 E.00526
; LINE_WIDTH: 0.421809
G1 X131.216 Y149.104 E.00418
G1 X127.632 Y148.806 E.11104
; CHANGE_LAYER
; Z_HEIGHT: 5.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.625 Y148.972 E-.76
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
G3 Z6 I1.02 J-.664 P1  F30000
G1 X114.648 Y125.948 Z6
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6162
G1 X114.648 Y128.852 E.09634
G1 X128.225 Y128.852 E.45038
G1 X140.225 Y129.852 E.39944
G1 X145.648 Y129.852 E.17989
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
G1 F6162
G1 X115.04 Y128.46 E.06514
G1 X128.241 Y128.46 E.40564
G1 X140.241 Y129.46 E.37
G1 X146.04 Y129.46 E.17818
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
G1 F6162
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
G1 F6162
G1 X140.2 Y130.25 E.16613
; LINE_WIDTH: 0.432356
G1 X139.636 Y130.226 E.01793
; LINE_WIDTH: 0.474338
G1 X139.071 Y130.203 E.01986
; LINE_WIDTH: 0.51632
G1 X138.507 Y130.179 E.0218
; LINE_WIDTH: 0.558302
G1 X137.942 Y130.156 E.02373
; LINE_WIDTH: 0.600284
G1 X137.378 Y130.132 E.02566
G1 X128.63 Y129.768 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.640764
G1 F6162
G1 X128.556 Y129.739 E.00387
; LINE_WIDTH: 0.594008
G1 X128.482 Y129.709 E.00356
; LINE_WIDTH: 0.547251
G1 X128.409 Y129.68 E.00326
; LINE_WIDTH: 0.500494
G1 X128.335 Y129.65 E.00296
; LINE_WIDTH: 0.453737
G1 X128.261 Y129.621 E.00266
; LINE_WIDTH: 0.360363
G1 X128.188 Y129.591 E.00205
G1 X115.091 Y129.591 E.33877
G1 X115.091 Y129.909 E.00821
G1 X128.188 Y129.909 E.33877
; LINE_WIDTH: 0.360223
G1 X128.252 Y129.888 E.00174
; LINE_WIDTH: 0.40698
G1 X128.316 Y129.868 E.002
; LINE_WIDTH: 0.453737
G1 X128.38 Y129.848 E.00225
; LINE_WIDTH: 0.500494
G1 X128.444 Y129.827 E.00251
; LINE_WIDTH: 0.547251
G1 X128.508 Y129.807 E.00276
; LINE_WIDTH: 0.594008
G1 X128.572 Y129.787 E.00302
G1 X128.63 Y129.768 F30000
; LINE_WIDTH: 0.640764
G1 F6162
G1 X129.152 Y129.79 E.02547
; LINE_WIDTH: 0.596486
G1 X129.674 Y129.812 E.02358
; LINE_WIDTH: 0.552208
G1 X130.196 Y129.834 E.02169
; LINE_WIDTH: 0.507929
G1 X130.719 Y129.855 E.01981
; LINE_WIDTH: 0.463651
M73 P93 R0
G1 X131.241 Y129.877 E.01792
; LINE_WIDTH: 0.419373
G1 X131.763 Y129.899 E.01604
G1 X128.209 Y129.244 F30000
; LINE_WIDTH: 0.419999
G1 F6162
G1 X114.744 Y129.244 E.41373
G1 X114.744 Y130.256 E.03109
G1 X131.823 Y130.256 E.52479
G1 X131.956 Y130.231 E.00416
; LINE_WIDTH: 0.46982
G1 X132.09 Y130.206 E.00471
; LINE_WIDTH: 0.519641
G1 X132.223 Y130.181 E.00526
; LINE_WIDTH: 0.569462
G1 X133.377 Y130.205 E.04954
; LINE_WIDTH: 0.521448
G1 X134.531 Y130.229 E.04502
; LINE_WIDTH: 0.473434
G1 X135.686 Y130.253 E.0405
; LINE_WIDTH: 0.408266
G2 X137 Y130.277 I1.235 J-31.596 E.03915
G1 X137.014 Y129.957 E.00955
G1 X136.854 Y129.943 E.00478
; LINE_WIDTH: 0.377405
G1 X135.702 Y129.871 E.03147
; LINE_WIDTH: 0.42542
G1 X134.549 Y129.799 E.03599
; LINE_WIDTH: 0.473434
G1 X133.397 Y129.727 E.0405
; LINE_WIDTH: 0.521448
G1 X132.245 Y129.655 E.04502
; LINE_WIDTH: 0.569462
G1 X132.114 Y129.62 E.00582
; LINE_WIDTH: 0.519641
G1 X131.983 Y129.584 E.00526
; LINE_WIDTH: 0.421809
G1 X131.853 Y129.548 E.00418
G1 X128.268 Y129.249 E.11104
; WIPE_START
G1 F24000
G1 X130.262 Y129.415 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I-.856 J-.865 P1  F30000
G1 X114.012 Y145.505 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6162
G1 X114.012 Y148.409 E.09634
G1 X127.589 Y148.409 E.45038
G1 X139.589 Y149.409 E.39944
G1 X145.012 Y149.409 E.17989
G1 X145.012 Y150.205 E.0264
G1 X113.716 Y150.205 E1.03814
G1 X113.716 Y144.909 E.17567
G1 X145.012 Y144.909 E1.03814
G1 X145.012 Y145.505 E.01977
G1 X114.072 Y145.505 E1.02634
G1 X114.404 Y145.897 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6162
G1 X114.404 Y148.017 E.06514
G1 X127.605 Y148.017 E.40564
G1 X139.605 Y149.017 E.37
G1 X145.404 Y149.017 E.17818
G1 X145.404 Y150.597 E.04855
G1 X113.324 Y150.597 E.98573
G1 X113.324 Y144.517 E.18682
G1 X145.404 Y144.517 E.98573
G1 X145.404 Y145.897 E.0424
G1 X114.464 Y145.897 E.9507
M204 S10000
G1 X113.919 Y145.207 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F6162
G1 X144.808 Y145.207 E.47513
; WIPE_START
G1 F24000
G1 X142.808 Y145.207 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I-1.116 J.485 P1  F30000
G1 X144.808 Y149.807 Z6.2
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.431684
G1 F6162
G1 X139.564 Y149.806 E.16613
; LINE_WIDTH: 0.432356
G1 X139 Y149.783 E.01793
; LINE_WIDTH: 0.474338
G1 X138.435 Y149.759 E.01986
; LINE_WIDTH: 0.51632
G1 X137.87 Y149.736 E.0218
; LINE_WIDTH: 0.558302
G1 X137.306 Y149.712 E.02373
; LINE_WIDTH: 0.600284
G1 X136.741 Y149.689 E.02566
G1 X127.993 Y149.325 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.640764
G1 F6162
G1 X127.92 Y149.295 E.00387
; LINE_WIDTH: 0.594008
G1 X127.846 Y149.266 E.00356
; LINE_WIDTH: 0.547251
G1 X127.772 Y149.236 E.00326
; LINE_WIDTH: 0.500494
G1 X127.699 Y149.207 E.00296
; LINE_WIDTH: 0.453737
G1 X127.625 Y149.177 E.00266
; LINE_WIDTH: 0.360363
G1 X127.551 Y149.148 E.00205
G1 X114.455 Y149.148 E.33877
G1 X114.455 Y149.465 E.00821
G1 X127.551 Y149.465 E.33877
; LINE_WIDTH: 0.360223
G1 X127.616 Y149.445 E.00174
; LINE_WIDTH: 0.40698
G1 X127.68 Y149.425 E.002
; LINE_WIDTH: 0.453737
G1 X127.744 Y149.404 E.00225
; LINE_WIDTH: 0.500494
G1 X127.808 Y149.384 E.00251
; LINE_WIDTH: 0.547251
G1 X127.872 Y149.363 E.00276
; LINE_WIDTH: 0.594008
G1 X127.936 Y149.343 E.00302
G1 X127.993 Y149.325 F30000
; LINE_WIDTH: 0.640764
G1 F6162
G1 X128.516 Y149.347 E.02547
; LINE_WIDTH: 0.596486
G1 X129.038 Y149.368 E.02358
; LINE_WIDTH: 0.552208
G1 X129.56 Y149.39 E.02169
; LINE_WIDTH: 0.507929
G1 X130.082 Y149.412 E.01981
; LINE_WIDTH: 0.463651
G1 X130.605 Y149.434 E.01792
; LINE_WIDTH: 0.419373
G1 X131.127 Y149.455 E.01604
G1 X127.572 Y148.801 F30000
; LINE_WIDTH: 0.419999
G1 F6162
G1 X114.108 Y148.801 E.41373
G1 X114.108 Y149.812 E.03109
G1 X131.187 Y149.812 E.52479
G1 X131.32 Y149.788 E.00416
; LINE_WIDTH: 0.46982
G1 X131.453 Y149.763 E.00471
; LINE_WIDTH: 0.519641
G1 X131.587 Y149.738 E.00526
; LINE_WIDTH: 0.569462
G1 X132.741 Y149.762 E.04954
; LINE_WIDTH: 0.521448
G1 X133.895 Y149.786 E.04502
; LINE_WIDTH: 0.473434
G1 X135.05 Y149.81 E.0405
; LINE_WIDTH: 0.408266
G2 X136.364 Y149.834 I1.235 J-31.596 E.03915
G1 X136.378 Y149.513 E.00955
G1 X136.218 Y149.5 E.00478
; LINE_WIDTH: 0.377405
G1 X135.065 Y149.428 E.03147
; LINE_WIDTH: 0.42542
G1 X133.913 Y149.356 E.03599
; LINE_WIDTH: 0.473434
G1 X132.761 Y149.284 E.0405
; LINE_WIDTH: 0.521448
G1 X131.608 Y149.212 E.04502
; LINE_WIDTH: 0.569462
G1 X131.478 Y149.176 E.00582
; LINE_WIDTH: 0.519641
G1 X131.347 Y149.14 E.00526
; LINE_WIDTH: 0.421809
M73 P94 R0
G1 X131.216 Y149.104 E.00418
G1 X127.632 Y148.806 E.11104
; CHANGE_LAYER
; Z_HEIGHT: 6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.625 Y148.972 E-.76
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
G3 Z6.2 I1.023 J-.659 P1  F30000
G1 X115.04 Y126.34 Z6.2
G1 Z6
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7415
G1 X115.04 Y128.46 E.06514
G1 X128.241 Y128.46 E.40564
G1 X140.241 Y129.46 E.37
G1 X146.04 Y129.46 E.17818
G1 X146.04 Y131.04 E.04855
G1 X113.96 Y131.04 E.98573
G1 X113.96 Y124.96 E.18682
G1 X146.04 Y124.96 E.98573
G1 X146.04 Y126.34 E.0424
G1 X115.1 Y126.34 E.9507
M204 S10000
; WIPE_START
G1 F24000
G1 X115.043 Y128.339 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I.101 J1.213 P1  F30000
G1 X145.833 Y125.766 Z6.4
G1 Z6
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
G1 F7415
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
G1 F7415
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
G1 X139.831 Y129.634 E.05209
G1 X139.339 Y129.593
G1 X138.099 Y130.833 E.05387
G1 X137.566 Y130.833
G1 X138.847 Y129.552 E.05565
G1 X138.355 Y129.511
G1 X137.033 Y130.833 E.05744
G1 X136.5 Y130.833
G1 X137.862 Y129.47 E.05922
G1 X137.37 Y129.429
G1 X135.966 Y130.833 E.061
G1 X135.433 Y130.833
G1 X136.878 Y129.388 E.06278
G1 X136.386 Y129.347
G1 X134.9 Y130.833 E.06457
G1 X134.366 Y130.833
G1 X135.893 Y129.306 E.06635
G1 X135.401 Y129.265
G1 X133.833 Y130.833 E.06813
G1 X133.3 Y130.833
G1 X134.909 Y129.224 E.06991
G1 X134.417 Y129.183
G1 X132.767 Y130.833 E.0717
G1 X132.233 Y130.833
G1 X133.924 Y129.142 E.07348
M73 P95 R0
G1 X133.432 Y129.101
G1 X131.7 Y130.833 E.07526
G1 X131.167 Y130.833
G1 X132.94 Y129.06 E.07704
G1 X132.448 Y129.019
G1 X130.634 Y130.833 E.07883
G1 X130.1 Y130.833
G1 X131.955 Y128.978 E.08061
G1 X131.463 Y128.937
G1 X129.567 Y130.833 E.08239
G1 X129.034 Y130.833
G1 X130.971 Y128.896 E.08417
G1 X130.479 Y128.855
G1 X128.5 Y130.833 E.08596
G1 X127.967 Y130.833
G1 X129.986 Y128.814 E.08774
G1 X129.494 Y128.773
G1 X127.434 Y130.833 E.08952
G1 X126.901 Y130.833
G1 X129.002 Y128.731 E.0913
G1 X128.51 Y128.69
G1 X126.367 Y130.833 E.09309
G1 X125.834 Y130.833
G1 X127.999 Y128.667 E.09409
G1 X127.466 Y128.667
G1 X125.301 Y130.833 E.09409
G1 X124.768 Y130.833
G1 X126.933 Y128.667 E.09409
G1 X126.4 Y128.667
G1 X124.234 Y130.833 E.09409
G1 X123.701 Y130.833
G1 X125.866 Y128.667 E.09409
G1 X125.333 Y128.667
G1 X123.168 Y130.833 E.09409
G1 X122.635 Y130.833
G1 X124.8 Y128.667 E.09409
G1 X124.266 Y128.667
G1 X122.101 Y130.833 E.09409
G1 X121.568 Y130.833
G1 X123.733 Y128.667 E.09409
G1 X123.2 Y128.667
G1 X121.035 Y130.833 E.09409
G1 X120.501 Y130.833
G1 X122.667 Y128.667 E.09409
G1 X122.133 Y128.667
G1 X119.968 Y130.833 E.09409
G1 X119.435 Y130.833
G1 X121.6 Y128.667 E.09409
G1 X121.067 Y128.667
G1 X118.902 Y130.833 E.09409
G1 X118.368 Y130.833
G1 X120.534 Y128.667 E.09409
G1 X120 Y128.667
G1 X117.835 Y130.833 E.09409
G1 X117.302 Y130.833
G1 X119.467 Y128.667 E.09409
G1 X118.934 Y128.667
G1 X116.769 Y130.833 E.09409
G1 X116.235 Y130.833
G1 X118.4 Y128.667 E.09409
G1 X117.867 Y128.667
G1 X115.702 Y130.833 E.09409
G1 X115.169 Y130.833
G1 X117.334 Y128.667 E.09409
G1 X116.801 Y128.667
G1 X114.635 Y130.833 E.09409
G1 X114.167 Y130.767
G1 X116.267 Y128.667 E.09126
G1 X115.734 Y128.667
G1 X114.167 Y130.234 E.06808
G1 X114.167 Y129.701
G1 X115.201 Y128.667 E.04491
G1 X114.833 Y128.502
G1 X114.167 Y129.168 E.02891
G1 X114.167 Y128.634
G1 X114.833 Y127.969 E.02891
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
G1 X114.956 Y126.019 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0989424
G1 F7415
G1 X114.719 Y126.256 E.00153
; WIPE_START
G1 F24000
G1 X114.956 Y126.019 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I-1.216 J-.034 P1  F30000
G1 X114.404 Y145.897 Z6.4
G1 Z6
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7415
G1 X114.404 Y148.017 E.06514
G1 X127.605 Y148.017 E.40564
G1 X139.605 Y149.017 E.37
G1 X145.404 Y149.017 E.17818
G1 X145.404 Y150.597 E.04855
G1 X113.324 Y150.597 E.98573
G1 X113.324 Y144.517 E.18682
G1 X145.404 Y144.517 E.98573
G1 X145.404 Y145.897 E.0424
G1 X114.464 Y145.897 E.9507
M204 S10000
; WIPE_START
G1 F24000
G1 X114.407 Y147.896 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I.101 J1.213 P1  F30000
G1 X145.196 Y145.322 Z6.4
G1 Z6
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
G1 F7415
G1 X144.829 Y145.689 E.01594
G1 X144.296 Y145.689
G1 X145.196 Y144.789 E.03912
G1 X144.728 Y144.724
G1 X143.763 Y145.689 E.04194
G1 X143.23 Y145.689
G1 X144.195 Y144.724 E.04194
G1 X143.662 Y144.724
G1 X142.696 Y145.689 E.04194
G1 X142.163 Y145.689
G1 X143.128 Y144.724 E.04194
G1 X142.595 Y144.724
G1 X141.63 Y145.689 E.04194
G1 X141.097 Y145.689
G1 X142.062 Y144.724 E.04194
G1 X141.529 Y144.724
G1 X140.563 Y145.689 E.04194
G1 X140.03 Y145.689
G1 X140.995 Y144.724 E.04194
G1 X140.462 Y144.724
G1 X139.497 Y145.689 E.04194
G1 X138.964 Y145.689
G1 X139.929 Y144.724 E.04194
G1 X139.395 Y144.724
G1 X138.43 Y145.689 E.04194
G1 X137.897 Y145.689
G1 X138.862 Y144.724 E.04194
G1 X138.329 Y144.724
G1 X137.364 Y145.689 E.04194
G1 X136.83 Y145.689
G1 X137.796 Y144.724 E.04194
G1 X137.262 Y144.724
G1 X136.297 Y145.689 E.04194
G1 X135.764 Y145.689
G1 X136.729 Y144.724 E.04194
G1 X136.196 Y144.724
G1 X135.231 Y145.689 E.04194
G1 X134.697 Y145.689
G1 X135.663 Y144.724 E.04194
G1 X135.129 Y144.724
G1 X134.164 Y145.689 E.04194
G1 X133.631 Y145.689
G1 X134.596 Y144.724 E.04194
G1 X134.063 Y144.724
M73 P96 R0
G1 X133.098 Y145.689 E.04194
G1 X132.564 Y145.689
G1 X133.529 Y144.724 E.04194
G1 X132.996 Y144.724
G1 X132.031 Y145.689 E.04194
G1 X131.498 Y145.689
G1 X132.463 Y144.724 E.04194
G1 X131.93 Y144.724
G1 X130.964 Y145.689 E.04194
G1 X130.431 Y145.689
G1 X131.396 Y144.724 E.04194
G1 X130.863 Y144.724
G1 X129.898 Y145.689 E.04194
G1 X129.365 Y145.689
G1 X130.33 Y144.724 E.04194
G1 X129.797 Y144.724
G1 X128.831 Y145.689 E.04194
G1 X128.298 Y145.689
G1 X129.263 Y144.724 E.04194
G1 X128.73 Y144.724
G1 X127.765 Y145.689 E.04194
G1 X127.232 Y145.689
G1 X128.197 Y144.724 E.04194
G1 X127.664 Y144.724
G1 X126.698 Y145.689 E.04194
G1 X126.165 Y145.689
G1 X127.13 Y144.724 E.04194
G1 X126.597 Y144.724
G1 X125.632 Y145.689 E.04194
G1 X125.098 Y145.689
G1 X126.064 Y144.724 E.04194
G1 X125.53 Y144.724
G1 X124.565 Y145.689 E.04194
G1 X124.032 Y145.689
G1 X124.997 Y144.724 E.04194
G1 X124.464 Y144.724
G1 X123.499 Y145.689 E.04194
G1 X122.965 Y145.689
G1 X123.931 Y144.724 E.04194
G1 X123.397 Y144.724
G1 X122.432 Y145.689 E.04194
G1 X121.899 Y145.689
G1 X122.864 Y144.724 E.04194
G1 X122.331 Y144.724
G1 X121.366 Y145.689 E.04194
G1 X120.832 Y145.689
G1 X121.798 Y144.724 E.04194
G1 X121.264 Y144.724
G1 X120.299 Y145.689 E.04194
G1 X119.766 Y145.689
G1 X120.731 Y144.724 E.04194
G1 X120.198 Y144.724
G1 X119.233 Y145.689 E.04194
G1 X118.699 Y145.689
G1 X119.664 Y144.724 E.04194
G1 X119.131 Y144.724
G1 X118.166 Y145.689 E.04194
G1 X117.633 Y145.689
G1 X118.598 Y144.724 E.04194
G1 X118.065 Y144.724
G1 X117.099 Y145.689 E.04194
G1 X116.566 Y145.689
G1 X117.531 Y144.724 E.04194
G1 X116.998 Y144.724
G1 X116.033 Y145.689 E.04194
G1 X115.5 Y145.689
G1 X116.465 Y144.724 E.04194
G1 X115.932 Y144.724
G1 X114.966 Y145.689 E.04194
G1 X114.433 Y145.689
G1 X115.398 Y144.724 E.04194
M204 S10000
; WIPE_START
G1 F24000
G1 X114.433 Y145.689 E-.51871
G1 X114.966 Y145.689 E-.20264
G1 X115.038 Y145.617 E-.03865
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I-.195 J1.201 P1  F30000
G1 X144.396 Y150.389 Z6.4
G1 Z6
G1 E.8 F1800
M204 S2000
G1 F7415
G1 X145.196 Y149.588 E.0348
G1 X145.028 Y149.224
G1 X143.862 Y150.389 E.05063
G1 X143.329 Y150.389
G1 X144.494 Y149.224 E.05063
G1 X143.961 Y149.224
G1 X142.796 Y150.389 E.05063
G1 X142.263 Y150.389
G1 X143.428 Y149.224 E.05063
G1 X142.895 Y149.224
G1 X141.729 Y150.389 E.05063
G1 X141.196 Y150.389
G1 X142.361 Y149.224 E.05063
G1 X141.828 Y149.224
G1 X140.663 Y150.389 E.05063
G1 X140.129 Y150.389
G1 X141.295 Y149.224 E.05063
G1 X140.761 Y149.224
G1 X139.596 Y150.389 E.05063
G1 X139.063 Y150.389
G1 X140.228 Y149.224 E.05063
G1 X139.695 Y149.224
G1 X138.53 Y150.389 E.05063
G1 X137.996 Y150.389
G1 X139.195 Y149.191 E.05209
G1 X138.703 Y149.15
G1 X137.463 Y150.389 E.05387
G1 X136.93 Y150.389
G1 X138.211 Y149.109 E.05565
G1 X137.718 Y149.067
G1 X136.397 Y150.389 E.05744
G1 X135.863 Y150.389
G1 X137.226 Y149.026 E.05922
G1 X136.734 Y148.985
G1 X135.33 Y150.389 E.061
G1 X134.797 Y150.389
G1 X136.242 Y148.944 E.06278
G1 X135.749 Y148.903
G1 X134.264 Y150.389 E.06457
G1 X133.73 Y150.389
G1 X135.257 Y148.862 E.06635
G1 X134.765 Y148.821
G1 X133.197 Y150.389 E.06813
G1 X132.664 Y150.389
G1 X134.273 Y148.78 E.06991
G1 X133.78 Y148.739
G1 X132.13 Y150.389 E.0717
G1 X131.597 Y150.389
G1 X133.288 Y148.698 E.07348
G1 X132.796 Y148.657
G1 X131.064 Y150.389 E.07526
G1 X130.531 Y150.389
G1 X132.304 Y148.616 E.07704
G1 X131.811 Y148.575
G1 X129.997 Y150.389 E.07883
G1 X129.464 Y150.389
G1 X131.319 Y148.534 E.08061
G1 X130.827 Y148.493
G1 X128.931 Y150.389 E.08239
M73 P97 R0
G1 X128.398 Y150.389
G1 X130.335 Y148.452 E.08417
G1 X129.842 Y148.411
G1 X127.864 Y150.389 E.08596
G1 X127.331 Y150.389
G1 X129.35 Y148.37 E.08774
G1 X128.858 Y148.329
G1 X126.798 Y150.389 E.08952
G1 X126.264 Y150.389
G1 X128.366 Y148.288 E.0913
G1 X127.873 Y148.247
G1 X125.731 Y150.389 E.09309
G1 X125.198 Y150.389
G1 X127.363 Y148.224 E.09409
G1 X126.83 Y148.224
G1 X124.665 Y150.389 E.09409
G1 X124.131 Y150.389
G1 X126.297 Y148.224 E.09409
G1 X125.763 Y148.224
G1 X123.598 Y150.389 E.09409
G1 X123.065 Y150.389
G1 X125.23 Y148.224 E.09409
G1 X124.697 Y148.224
G1 X122.532 Y150.389 E.09409
G1 X121.998 Y150.389
G1 X124.164 Y148.224 E.09409
G1 X123.63 Y148.224
G1 X121.465 Y150.389 E.09409
G1 X120.932 Y150.389
G1 X123.097 Y148.224 E.09409
G1 X122.564 Y148.224
G1 X120.398 Y150.389 E.09409
G1 X119.865 Y150.389
G1 X122.03 Y148.224 E.09409
G1 X121.497 Y148.224
G1 X119.332 Y150.389 E.09409
G1 X118.799 Y150.389
G1 X120.964 Y148.224 E.09409
G1 X120.431 Y148.224
G1 X118.265 Y150.389 E.09409
G1 X117.732 Y150.389
G1 X119.897 Y148.224 E.09409
G1 X119.364 Y148.224
G1 X117.199 Y150.389 E.09409
G1 X116.666 Y150.389
G1 X118.831 Y148.224 E.09409
G1 X118.298 Y148.224
G1 X116.132 Y150.389 E.09409
G1 X115.599 Y150.389
G1 X117.764 Y148.224 E.09409
G1 X117.231 Y148.224
G1 X115.066 Y150.389 E.09409
G1 X114.533 Y150.389
G1 X116.698 Y148.224 E.09409
G1 X116.164 Y148.224
G1 X113.999 Y150.389 E.09409
G1 X113.531 Y150.324
G1 X115.631 Y148.224 E.09126
G1 X115.098 Y148.224
G1 X113.531 Y149.791 E.06808
G1 X113.531 Y149.257
G1 X114.565 Y148.224 E.04491
G1 X114.196 Y148.059
G1 X113.531 Y148.724 E.02891
G1 X113.531 Y148.191
G1 X114.196 Y147.526 E.02891
G1 X114.196 Y146.992
G1 X113.531 Y147.658 E.02891
G1 X113.531 Y147.124
G1 X114.196 Y146.459 E.02891
G1 X114.196 Y145.926
G1 X113.531 Y146.591 E.02891
G1 X113.531 Y146.058
G1 X114.865 Y144.724 E.05796
G1 X114.332 Y144.724
G1 X113.531 Y145.525 E.03479
M204 S10000
G1 X114.32 Y145.576 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0989424
G1 F7415
G1 X114.083 Y145.812 E.00153
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F24000
G1 X114.32 Y145.576 E-.76
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

